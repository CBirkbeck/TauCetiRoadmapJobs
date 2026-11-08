# Review of QuadraticFormsOverABase (pull request #1930 at 48cf0a6)

**Verdict:** needs changes

## R01 (P1) — `Suggested.lean` does not build; `conj` restates Mathlib's `QuadraticAlgebra.starAlgEquiv`

- **Location.** `TauCetiRoadmap/QuadraticFormsOverABase/Suggested.lean:333–336`, `conj`: "`{ starRingEnd (QuadraticAlgebra R a b) with commutes' := fun r => by ext <;> simp [QuadraticAlgebra.algebraMap_eq, starRingEnd_apply] }`"; README 5.3 defines `conj` as a new target.
- **Claim.** The file elaborates with `sorry` as the only warning, and the canonical involution needs a new definition.
- **Witness.** `lake env lean` on the file exits with code 1: `336:14: Tactic simp failed … maximum recursion depth` (`algebraMap_eq` and `C_eq_algebraMap` loop). This matches the gate (`build=2`). The pinned Mathlib already has `QuadraticAlgebra.starAlgEquiv : QuadraticAlgebra R a b ≃ₐ[R] QuadraticAlgebra R a b`, which is `star`, ω ↦ b − ω (`Mathlib/Algebra/QuadraticAlgebra/Basic.lean:249`).
- **Repair.** Delete `conj` from `Suggested.lean` and from README 5.3. In `exists_productHom`, write `Algebra.TensorProduct.map (QuadraticAlgebra.starAlgEquiv : QuadraticAlgebra R a₁ b₁ ≃ₐ[R] _).toAlgHom (QuadraticAlgebra.starAlgEquiv : QuadraticAlgebra R a₂ b₂ ≃ₐ[R] _).toAlgHom x = x`. Then list `QuadraticAlgebra.starAlgEquiv` under the Mathlib contracts in place of `starRingEnd`. Tested on a scratch copy: with this change the whole file elaborates with only `sorry` warnings. Keeping `conj` with the body `(QuadraticAlgebra.starAlgEquiv : _ ≃ₐ[R] _).toAlgHom` also elaborates.

## R02 (P2) — Smoothness, its local normal form and the even Clifford centre are already planned by LefschetzPencilsAndVanishingCycles §§2.1–2.2

- **Location.** README Scope, lines 42 and 49: "smoothness of a form, its two criteria, and fppf and étale local triviality (Layer 2)"; "the Azumaya and centre statements on `C₀(Q)` (Layer 4)". The same objects appear in 2.1, the étale half of 2.4, 4.2 and `center_even_etale` (`Suggested.lean:309`).
- **Claim.** This roadmap owns smoothness of forms over a base and the statement that the centre of `C₀(Q)` is finite étale of rank two.
- **Witness.** LefschetzPencilsAndVanishingCycles is an open roadmap pull request, line 56 of the merge order (this roadmap is line 398). It plans the following:
  - README §2.1 (line 1439): "ordinary" forms over any base, defined as nowhere zero with a smooth quadric. This is Conrad's non-degeneracy, which Conrad §C.1, p. 302 says SGA 7 calls *ordinary*. §2.1 also covers base change, the fibre criterion, the comparison with Mathlib's `QuadraticMap.Nondegenerate`, and the étale-local normal form `Σ xᵢx_{i+m}` (with `+ λx²` in odd rank).
  - README §2.2 (line 1499) and `Suggested.lean:98`, `evenClifford_center_etale_azumaya`: for finite projective `W` of positive even rank with bijective `polarBilin`, the centre of `CliffordAlgebra.even Q` is finite étale of local rank 2, and `C₀` is Azumaya over it.
- **Repair.**
  - In Scope, assign ordinary/smooth forms, their base change and fibre criteria, and the étale normal form to LefschetzPencilsAndVanishingCycles §2.1. Assign the even Clifford centre to §2.2, and add both to the supplier contracts.
  - Keep `IsSmooth` only as the carrier on `Fin n → R`. Add the comparison target: for `n ≥ 1`, `IsSmooth Q` holds exactly when `Q` is ordinary in the sense of §2.1. Rank 0 differs, since §2.1 excludes it. Also cite Mathlib `QuadraticMap.Nondegenerate` (`Mathlib/LinearAlgebra/QuadraticForm/Radical.lean:115`) for the field case.
  - Delete 4.2 and `center_even_etale`, and cite `evenClifford_center_etale_azumaya`. On `Fin n → R`, bijectivity of `polarBilin` is `IsUnit (polarMatrix Q).det`, which is `IsSmooth Q` by 2.2.
  - In 2.4, take the étale statement for even `n` from §2.1's normal form. Keep as owned only the fppf statement and the odd-rank case where 2 is a unit (adjoining `√u⁻¹`).
  - The 2.1 Checks then hold unchanged. For example, `x² + yz` over `𝔽₂` is smooth and ordinary.

## R03 (P2) — Two owners of the orthogonal group scheme over a perfect field of characteristic two, and an unbacked claim about OrthogonalTamagawaAndLatticeMass

- **Location.** README Scope, lines 45–48: "This is the most general owner of the orthogonal group scheme of a quadratic form: the group over a perfect field of characteristic two … is OrthogonalTamagawaAndLatticeMass §0.1a's, which specialises the one built here".
- **Claim.** OrthogonalTamagawaAndLatticeMass §0.1a specialises 3.1/3.3.
- **Witness.** OrthogonalTamagawaAndLatticeMass README §0.1a (line 128) builds `O(q) ⊂ GL(W)` itself "by the coefficients of q(gx)−q(x)" and proves even-dimensional smoothness. It cites ReductiveGroups Layers 0/3, not this roadmap. It is line 146 of the merge order and cannot consume a roadmap at line 398.
- **Repair.**
  - Delete "which specialises the one built here".
  - Cite OrthogonalTamagawaAndLatticeMass §0.1a as the owner of the field case (construction, reduction, components, point counts). State 3.1 and 3.3 as its extension to an arbitrary base, with a comparison target: over a perfect field `k` of characteristic two, `H ⧸ orthogonalIdeal Q` is §0.1a's `O(q)` on `kⁿ`.
  - The alternative is to place this roadmap before OrthogonalTamagawaAndLatticeMass and have §0.1a consume 3.1/3.3. That changes the other roadmap, so it must be named in the merge-order paragraph.
  - The 3.1 Check at `Q = x₀x₁` agrees with §0.1a's Check at `q = xy` on `𝔽₂²` (the shear is excluded in both).

## R04 (P2) — `mapCoeffs` and `mapCoeffs_eq_baseChange` re-plan QuadraticFormInvariantsPartII §0.2 `extendScalars`

- **Location.** README 0.2 and Conventions line 80: "`mapCoeffs f Q` applies `f : R →+* S` to the coefficient matrix … 0.2 compares them [with `QuadraticForm.baseChange`]"; Scope line 39: "base change of forms along any ring map, by coefficients (Layer 0)".
- **Claim.** Coordinate base change, and its comparison with Mathlib's base change when 2 is invertible, are owned here.
- **Witness.** QuadraticFormInvariantsPartII (open, merge-order line 387) README §0.2 (line 484), and `extendScalars` at `Suggested.lean:101`. It defines `extendScalars Q L` on `Fin n → L` "by the coordinate polynomial `∑ Q(eᵢ)xᵢ² + ∑_{i<j} b_Q(eᵢ,eⱼ)xᵢxⱼ`". It also identifies this with `QuadraticForm.baseChange` when 2 is invertible.
- **Repair.**
  - In Scope, cite QuadraticFormInvariantsPartII §0.2 for the field case. Keep `mapCoeffs` as the variant along an arbitrary ring map, saying in one clause how it differs (any base ring, not a field and a `K`-algebra).
  - Add the comparison target `mapCoeffs (algebraMap K L) Q = extendScalars Q L` for a field `K`.
  - Drop the field-case content of `mapCoeffs_eq_baseChange`, or restate it as following from that comparison and §0.2.
  - Example: both send `[1, a] = x² + xy + ay²` to `x² + xy + ay²` over `L`.

## R05 (P2) — Layer 6 restates Mathlib's `Polynomial.discr`, Tau Ceti's monic étale criterion and HyperellipticCurves §0.1

- **Location.** README Scope line 52: "the discriminant of a binary form of degree `n` over any ring (Layer 6)". Also 6.1–6.3, and `univBinDisc`, `binDisc`, `leadingCoeff_mul_binDisc`, `isUnit_binDisc_iff_etale` (`Suggested.lean:355–402`).
- **Claim.** The discriminant over any ring, its resultant relation and the étale criterion are new here.
- **Witness.**
  - Mathlib has `Polynomial.discr` over any `CommRing` and `resultant_deriv` (`Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:934, 977`).
  - Tau Ceti has `Polynomial.Monic.isUnit_discr_iff` (`TauCeti/RingTheory/Polynomial/Resultant/Discriminant.lean:703`) and `Monic.etale_adjoinRoot_iff` (`TauCeti/RingTheory/Etale/AdjoinRoot.lean:73`). The probe `rw [hf.isUnit_discr_iff, hf.etale_adjoinRoot_iff]` closes `IsUnit f.discr ↔ Algebra.Etale R (AdjoinRoot f)`.
  - HyperellipticCurves §0.1 (open, merge-order line 392; `Suggested.lean:78, 86`) owns `formDiscr n G`, the discriminant at formal degree `n`, with the same degree-drop laws.
- **Repair.**
  - Delete `univPoly`, `univSignedRes`, `univBinDisc`, `binDisc` and Layer 6's theorems from `Suggested.lean`.
  - In the README, cite Mathlib `Polynomial.discr`, `resultant_deriv` and `discr_of_degree_eq_one/two/three`. Cite Tau Ceti `Monic.isUnit_discr_iff`, `Monic.etale_adjoinRoot_iff` and `discr_map_of_natDegree_eq`. Cite HyperellipticCurves §0.1 `formDiscr`.
  - Keep in Layer 6 only what none of them states, phrased on `formDiscr`. Check this against §0.1, which already lists compatibility with ring homomorphisms. Candidates are the divisibility `aₙ ∣ (−1)^(n(n−1)/2) Res_{n,n−1}` and the leading-coefficient identity at formal degree; at `natDegree f < n` both sides are `0` by `resultant_eq_zero_of_lt_lt`.
  - Present 6.3 as the two-line corollary above.
  - The 6.1 Checks (`b² − 4ac`, the cubic, `X³ − X ↦ 4`) are `discr_of_degree_eq_two/three`.

## R06 (P2) — README 5.1 is Tau Ceti's `QuadraticAlgebra.etale_iff_isUnit_discr`

- **Location.** README 5.1: "Prove `etale_quadraticAlgebra_iff`: `QuadraticAlgebra R a b` is étale over `R` exactly when `b² + 4a` is a unit"; `Suggested.lean:322`.
- **Claim.** The étale criterion for free quadratic algebras without dividing by 2 is owned here (Scope line 50).
- **Witness.** `TauCeti/Algebra/QuadraticAlgebra/Etale.lean:29` states exactly `Algebra.Etale R (QuadraticAlgebra R a b) ↔ IsUnit (discr a b)` over any `CommRing`. On a scratch copy, `example … := QuadraticAlgebra.etale_iff_isUnit_discr` elaborates.
- **Repair.** Delete `etale_quadraticAlgebra_iff` from `Suggested.lean` and 5.1 from the targets. Cite the Tau Ceti theorem in the contracts and in Scope, and keep the three 5.1 Checks under 5.2 or the Conventions. In 5.2, "Route: 5.1" becomes "Route: Tau Ceti `QuadraticAlgebra.etale_iff_isUnit_discr`".

## R07 (P3) — `orthogonalGroup Q A` is a second carrier for Tau Ceti's orthogonal group, and one Tau Ceti claim is wrong

- **Location.** `Suggested.lean:229`, and README Scope line 57: "They are consumed by name; no second carrier is built". Also line 64–66: "…and their smoothness when `2` is invertible are Tau Ceti's `TauCeti.Orthogonal` and `TauCeti.SpecialOrthogonal`".
- **Claim.** No pinned carrier exists for `O(Q)(A)`, and Tau Ceti proves smoothness of both `Oₙ` and `SOₙ` when 2 is invertible.
- **Witness.** `TauCeti.QuadraticMap.orthogonalGroup Q : Subgroup (M ≃ₗ[R] M)` with carrier `{f | ∀ m, Q (f m) = Q m}` is at `TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/Basic.lean:190`. Its coordinate embedding `QuadraticMap.orthogonalToGeneralLinear Q : orthogonalGroup Q →* GL n R` is at line 758. On smoothness, `Orthogonal/Basic.lean` says "no smoothness is claimed here"; only `SpecialOrthogonal/Smooth.lean:100` proves it, under `[Invertible 2]`.
- **Repair.** Define `orthogonalGroup Q A := (QuadraticMap.orthogonalToGeneralLinear (mapCoeffs (algebraMap R A) Q)).range` (tested: elaborates at the pins), or keep the definition and add the comparison as a target. Cite both declarations in the contracts. Change the Scope sentence to "the smoothness of `SOₙ` when 2 is invertible".

## R08 (P3) — 3.4 uses forms on locally free modules, which Scope excludes

- **Location.** Scope lines 67–69: "Forms on projective modules of constant rank … are not treated: every statement here is about `Fin n → R`". 3.4, lines 491–494: "a bijection … onto isometry classes of smooth forms on locally free modules of rank `n`".
- **Claim.** Every statement is about `Fin n → R`.
- **Witness.** The README's own 3.4 Check (lines 506–507) reads `H¹_fppf(R, μ₂)` as "the forms `u x²` on invertible modules". Over `ℤ[√−5]`, `L = (2, 1+√−5)` has `L² = (2)`, so `x ↦ x²/2` is a smooth form on a non-free `L`. Its class maps to `[L] ≠ 0` in `Pic[2]`.
- **Repair.** Either change the Scope sentence to admit locally free modules in 3.4 only, or restate 3.4 on `Fin n → R`: the map from isometry classes of smooth forms on `Rⁿ` to `NonabelianH1` is injective, and its image is the classes whose twisted rank-`n` bundle is free.

## R09 (P3) — A 3.4 Check is false: `H¹(ℝ, O(q₂))` has three elements

- **Location.** README 3.4 Checks, lines 504–505: "over `ℝ`, `x² + y²` and `x y` are not isometric, and the class of `x² + y²` in `H¹(ℝ, O(q₂))` is the nontrivial one".
- **Claim.** There is exactly one nontrivial class.
- **Witness.** `H¹(ℝ, O(q₂))` is the set of isometry classes of non-degenerate real binary forms. These are the signatures `(1,1)`, `(2,0)` and `(0,2)`, the classes of `x y`, `x² + y²` and `−x² − y²`, so there are two nontrivial classes.
- **Repair.** Replace with: "`H¹(ℝ, O(q₂))` has three elements, the classes of `x y` (trivial), `x² + y²` and `−x² − y²`".

## R10 (P3) — Targets without locators, and one misattributed value

- **Location.** 1.4 (`four_dvd_univSignedDisc_sub_sq`, `discr_discAlgebra`), 5.2, 5.3 (`exists_productHom`) and 3.4 have no source locator. The Layer 1 Examples (line 317) say: "`det polarMatrix (standard (2m)) = (−1)^m` (Conrad 2014, proof of Proposition C.1.4, p. 305)".
- **Claim.** Each theorem carries a locator, and Conrad p. 305 computes the even-rank value.
- **Witness.** Conrad 2014 line 12525 (p. 305) computes only `disc(q_{2m+1}) = 2(−1)^m`; no even-rank determinant appears there. The routes of 1.4 and 5.3 are original computations, with no source named.
- **Repair.**
  - Give a locator for 1.4, 5.2, 5.3 and 3.4, or state in each that the result is proved here, with the route as the proof.
  - Split the Examples citation so that only the odd-rank value cites Conrad p. 305.
  - Add the page to the Exercise 1.6.10 citation in 2.2 (Conrad 2014, p. 50).

## R11 (P3) — Padding in `Suggested.lean`: API lemmas of `mapCoeffs` and `halfDisc`

- **Location.** `Suggested.lean:74` `mapCoeffs_apply`, `:79` `mapCoeffs_comp`, `:146` `halfDisc_smul`.
- **Claim.** These are headline theorems (module docstring, lines 18 and 24).
- **Witness.** None of them is among the Summary's end theorems. They are the evaluation and functoriality laws of a definition and the homogeneity of `univHalfDisc`. The README keeps them as 0.2 and 1.3 API. One-tactic probes (`simp` with the definitions unfolded) did not close them, so they are flagged by reading, not by the probe.
- **Repair.** Delete them from `Suggested.lean` and its docstring list. The README keeps the statements.

## R12 (P3) — Process wording in Downstream consumers

- **Location.** README line 706: "No roadmap on main or in an open pull request cites this one."
- **Claim.** The README is timeless.
- **Witness.** The house rules forbid pull-request references and current-state narrative in the README.
- **Repair.** Write "None." or name the consumers, without referring to pull requests.

## Verified sound

**Gate and build.**
- The worker's gate fails only on `build=2` (R01). I reproduced it: `lake env lean Suggested.lean` exits 1 at line 336.
- My re-run of the gate reports `depcheck: NOT IN ORDER: QuadraticFormsOverABase`. The brief says that is not a finding before the design is accepted.
- The brief's depcheck command against the candidate order prints `depcheck: 245 roadmaps, 2467 edges, 0 problem(s)`: no UPWARD or CYCLE line.
- Every repair above cites a roadmap earlier in the merge order: LefschetzPencilsAndVanishingCycles line 56, OrthogonalTamagawaAndLatticeMass 146, QuadraticFormInvariantsPartII 387, HyperellipticCurves 392, and this roadmap at 398. SchemeAndStackFoundations is on main.
- No changes outside the folder (`git diff --stat` empty).

**Mechanical signature check.** I put `#check @name` for all 53 declarations in one scratch file and elaborated it once. Every elaborated type matches its README statement, and no binder was dropped: every hypothesis (`Odd n`, `Even n`, `IsSmooth Q`, `3 ≤ n`, `2 ≤ n`, `Invertible 2`, `1 ≤ n`, `f.Monic`) is in the declaration's own signature. `IsSmooth` quantifies over algebraically closed `K : Type u` in the universe of `R`. Nothing changed.

**Symbolic checks** (pure Python, coefficientwise in `ℤ[U]`):
- `det(U + Uᵀ)` has only even coefficients for `n = 1, 3, 5` (1, 18 and 1110 terms, none odd). This supports 1.1.
- `(−1)^(n/2) det(U + Uᵀ) − Hf²` has all coefficients divisible by 4 for `n = 2, 4, 6` (1, 99 and 7875 terms). This supports 1.4.
- With the sign flipped, 2, 12 and 120 coefficients fail, which confirms the 1.4 sign Check.

**Sources at their locators** (the seeded sample plus every locator in the README):
- Conrad 2014, author's version:
  - §C.1, p. 302, lines 12394–12411: non-degeneracy and the SGA 7 term "ordinary".
  - Remark C.1.1, line 12422: Knus IV 3.1.
  - p. 303, line 12437: representability of O(q).
  - Definition C.1.2, p. 303, line 12451: `q_{2m+1} = x₀² + Σx_{2i−1}x_{2i}`.
  - Proposition C.1.4 (1)–(3), p. 304, lines 12491–12501, with the paragraph before it on the even-rank discriminant.
  - Proof of C.1.4, p. 305, line 12525: `disc′(q_{2m+1}) = (−1)^m`.
  - Theorem C.1.5, p. 305, line 12550: O(q) is smooth iff `n` is even or 2 is a unit; SO′ is smooth for odd `n`.
  - Steps 1–3, pp. 306–308: the tangent dimension `n(n−1)/2 + (δ²+δ)/2` (line 12605), and `O = μ₂ × SO′` for odd `n` (line 12617).
  - Lemma C.2.1, p. 309, line 12685: fppf-locally `qₙ`; étale when `n` is even or 2 is a unit.
  - Proposition C.2.2, p. 309, line 12699: Z(C₀) is rank-2 finite étale.
  - Remark C.2.3, p. 310.
  - Proposition C.2.4, p. 311, line 12806: C₀ is fppf-locally `Mat_{2^m}`, hence Azumaya.
  - Exercise 1.6.10, p. 50, line 2131: defect parity.
- Voight 2011 (arXiv v5): (3.2) on p. 9, line 407, with the coefficient positions of (1.12), line 262, matching README 1.1; §4, p. 17, lines 790–793, "Azumaya iff semiregular", under the standing Noetherian hypothesis (line 17).
- Stacks: Definition 10.144.1 (00UB) and Lemma 10.144.2 (00UC), lines 18146–18154.
- All of these support the statements as written. One generality point: 1.3's `halfDisc_comp` is stated for every matrix, while Conrad's (2) is for invertible changes of coordinates. The universal-ring route given in 1.3 covers all matrices, since `ℤ[A, C] → ℤ[A, C][1/det]` is injective.

**Library declarations opened at the pins (24).**
- Mathlib:
  - `QuadraticMap.toBilin`, `toBilin_apply`, `toQuadraticMap_toBilin`, `BilinMap.toQuadraticMap_surjective` (`LinearAlgebra/QuadraticForm/Basis.lean:88, 93, 98, 119`).
  - `QuadraticMap.radical`, `Nondegenerate`, `radical_eq_ker_polarBilin` [Invertible 2] (`…/Radical.lean:35, 115, 126`).
  - `QuadraticForm.baseChange`, inside the `InvertibleTwo` section (`…/TensorProduct.lean:39–150`).
  - `QuadraticForm.discr'` [Invertible 2] (`…/Basic.lean:1242`).
  - `TensorProduct.piScalarRight` (`RingTheory/TensorProduct/Pi.lean:62`).
  - `IsAzumaya` (`Algebra/Azumaya/Defs.lean:60`).
  - `Module.rankAtStalk` (`RingTheory/Spectrum/Prime/FreeLocus.lean:181`).
  - `QuadraticAlgebra.discr`, `nonempty_algEquiv_iff` [IsRegular 2] (`…/Discriminant.lean:52, 161`).
  - `omega`, `lift`, `star`, `starAlgEquiv` (`…/QuadraticAlgebra/Basic.lean:59, 130, 212, 249`).
  - `Polynomial.sylvester`, `resultant`, `resultant_map_map`, `resultant_eq_zero_of_lt_lt`, `discr`, `resultant_deriv` (`RingTheory/Polynomial/Resultant/Basic.lean:51, 131, 137, 347, 934, 977`).
  - `Polynomial.derivative_map`.
- Tau Ceti:
  - `GeneralLinear.coordinateHopfAlgebra` and `genericMatrix` (`…/GeneralLinear/Coordinate/HopfAlgebra.lean:452, 464`).
  - `HopfIdeal`, `toIdeal`, `ofSpan` (`Algebra/HopfAlgebra/HopfIdeal/Basic.lean:66, 108, 164`).
  - `ConstantForm.definingHopfIdeal` (`…/ConstantForm/Basic.lean:247`).
  - `RootsOfUnityGroup.coordinateRing_smooth_iff` (`…/RootsOfUnity/Smooth.lean:44`).
  - `GeneralLinear.pointsMulEquiv`, by elaboration.
  - The R06, R05 and R07 declarations.
  - `Fppf/Quotient/Torsor.lean`: there is no torsor-class carrier at the pin, so README 3.4 is indeed not statable, as the docstring says.

**Cross-roadmap citations resolved.**
- SchemeAndStackFoundations on main: §1.15 `IsTorsor` (README line 2502), and §2.3 `NonabelianH1`, `NonabelianH1.mk`, `mk_eq_one_iff` (line 3330 ff.).
- OrthogonalTamagawaAndLatticeMass §0.1a, at head 91f8383.

**Ownership.**
- The open roadmap pull requests (index of 2026-11-08) and main were searched by object: half-discriminant, Conrad Appendix C, orthogonal group schemes, even Clifford centre, the coordinate base change, binary-form discriminants, and Voight's quaternion rings and ternary forms.
- Findings: R02 (#873 head 072e6cd), R03 (#1222 head 91f8383), R04 (#1834 head eda79c7) and R05 (#1707 head e63cf0a).
- No overlap for the half-discriminant, the hafnian congruence, the discriminant algebra, 4.1 or 5.3.
- `overlaps.md` lists nothing, and I confirmed: no open pull request changes this roadmap, drops an id it cites, or cites an id it drops.
- The board's packages contain nothing related.

**Adversarial pass.**

| Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| Conventions: `coeffMatrix`, `polarMatrix` | `ax²+bxy+cy²` | `!![a,b;0,c]`; `!![2a,b;b,2c]`, det `4ac−b²` | holds | none |
| 0.1 change of variables | `q = x₀x₁`, `g` = swap | `gᵀUg = !![0,0;1,0]`, folded `!![0,1;0,0]` = coeffMatrix(`x₁x₀`) | holds | none |
| 0.1 polar matrix vs form over 𝔽₂ | `x²` on `Fin 1 → 𝔽₂` | polar `!![0]`, coeff `!![1]` | holds | none |
| 0.2 `mapCoeffs_apply` | `xy`, ℤ→ℤ/6, `x=(2,3)` | `6↦0` / `2·3 = 0` | holds | R11 |
| 0.2 `coeffMatrix ∘ mapCoeffs` | any `f` | the mapped matrix is upper triangular, so `Q(eᵢ)=Mᵢᵢ`, polar `=Mᵢⱼ` | holds | none |
| 0.2 `mapCoeffs_eq_baseChange` | `Q=x²`, `A=R[t]`; general | `t e₀ ↦ t²` both; `Σxᵢ²Q(eᵢ)+Σ_{i<j}xᵢxⱼ polar` both | holds | R04 |
| 1.1 `two_mul_univHalfDisc` | n=1; n=3,5; n=2 | `2U₀₀`; 0 odd coefficients; coefficient −1 at `U₀₁²` | holds; n odd needed | none |
| 1.2 `two_mul_halfDisc` | `x²+yz` on ℤ³; `ax²` | det polar `−2 = 2·(−1)`; `2a = 2·a` | holds | none |
| 1.2 `halfDisc_eq_of_toQuadraticMap` | `B = !![1,0,0;0,0,0;0,1,0]` | `U+Uᵀ` unchanged; `δ' = −1` both | holds | none |
| 1.2 Voight formula | `½det!![2a,w,v;w,2b,u;v,u,2c]` | `4abc+uvw−au²−bv²−cw²` | holds | none |
| 1.3 `halfDisc_comp` | `g=2·1` on `x²`; `g=diag(−1,1,1)` on `q₃` | `4 = 2²·1`; `−1 = 1·(−1)` | holds | none |
| 1.3 `halfDisc_smul` | `a=−1`, `q₃` | `δ'(−q₃)=1` direct / `(−1)³(−1)=1` | holds | R11 |
| 1.4 `four_dvd_…` | n=0,2,4,6; flipped sign | `1−1=0`; `−4ac`; all ≡ 0 mod 4; flipped fails (2/12/120) | holds | R10 (locator) |
| 1.4 `discr_discAlgebra` | n=2; `standard 4` | `B²+4C = b²−4ac`; `B=1`, det `1`, `C=0` | holds | none |
| 2.1 `IsSmooth` | `x²+yz`, `x²+y²+z²` over 𝔽₂; `x²+ty²` over 𝔽₂(t) | radical 0; plane `x+y+z=0`; rational radical 0 but over `K̄` the line `x=√t y` | correct (geometric points needed) | R02 |
| 2.2 odd criterion | same two forms over 𝔽₂ | `δ' = −1 ≡ 1` / smooth; `δ' = 4 ≡ 0` / not smooth | holds | none |
| 2.2 even criterion | `xy`, `x²+y²` over 𝔽₂; rank 0; zero ring | det `1`/smooth, `0`/not; det `1`/smooth; vacuous / every element a unit | holds | none |
| 2.3 standard forms | `q₁, q₃, q₂, q₄` | `δ' = 1, −1`; det polar `−1, 1` = `(−1)^m` | holds | R10 (even case locator) |
| 2.4 local triviality | `tx²` over 𝔽₂(t); `−x²` over 𝔽₃; R=0 | needs √t, inseparable so not étale; `s²=−1` in 𝔽₉, étale; `S=0` faithfully flat vacuously | holds; hypothesis needed | R02 |
| 3.1 relations | `x₀x₁`; `x²`; `Q=0` | `X₀₀X₁₀, X₀₀X₁₁+X₀₁X₁₀−1, X₀₁X₁₁`; `X₀₀²−1`; `⊥` | holds | none |
| 3.1 bilinear vs quadratic | shear over 𝔽₂ | `gᵀCg = C` holds; `q(e₀+e₁) = 1 ≠ 0` | holds | R07 |
| 3.2 `det_sq_eq_one` | `Q=0`, `g=2` over ℚ | `det² = 4 ≠ 1` without smoothness | hypothesis needed | none |
| 3.2 `μ₂ × SO` | `x²`, `g=−1`; `x₀x₁`, swap | `ζ=−1`, `h=1`; `det(ζh)=ζ²=1 ≠ −1` | holds; odd needed | none |
| 3.3 `smooth_orthogonal_iff` | n=1 over 𝔽₂, ℤ[1/2]; n=2 over 𝔽₂; `(x+y)²` | not smooth / RHS false; étale / true; `𝔾_m⋊ℤ/2` / true; `!![a,b;1+a,1+b]`, dim 2 | holds | R03 |
| 3.4 Check | `H¹(ℝ, O(q₂))` | 3 classes (signatures (1,1), (2,0), (0,2)) / "the nontrivial one" | **false** | R09 |
| 3.4 Check | `H¹_fppf(ℤ, μ₂)` | Kummer: `ℤ×/ℤ×² = {±1}`, `Pic ℤ = 0` | holds | none |
| 4.1 `isAzumaya_even_iff` | n=1 `0·x²`; `x²+y²+z²` over ℤ; `q₃` | `C₀=R` Azumaya, `δ'=0`; `(e₁e₂)²=−1`, Lipschitz, `δ'=4`; `M₂(ℤ)`, `δ'=−1` | holds; n ≥ 3 needed | none |
| 4.1 converse ideal | radical `r`, `n ≥ 2` | `rv ≠ 0` for independent `v`; `(rc)(rc′) = −r²cc′ = 0` | holds | none |
| 4.2 centre | `x₀x₁`; `x²+y²`, `x²+xy+y²` over 𝔽₂ | `(e₀e₁)²=e₀e₁`; `t²=1` (not étale); `t²=t+1` (𝔽₄) | holds | R02 (owner) |
| 5.1 étale criterion | `(2ω−b)²`; 𝔽₂ `a=b=1`; `a=b=0` | `b²+4a`; discriminant `1`, 𝔽₄; `0`, dual numbers | holds | R06 |
| 5.2 `etale_discAlgebra_iff` | `xy`, `x²+xy+y²`, `x²+y²` over 𝔽₂ | `ω²=ω`; `ω²=ω+1`; `ω²=1` | holds | R10 (locator) |
| 5.3 relation | `η = (xy−b₁b₂)/2`, `x=2ω₁−b₁`, `y=2ω₂−b₂` | `η² = −b₁b₂η + (d₁d₂−b₁²b₂²)/4 = bη + a` | holds | none |
| 5.3 discriminant and Checks | golden ⊗ golden; ℤ[i] ⊗ ℤ[i]; `A₂ = R×R` | `a=6`, `b=−1`, `25`; `a=4`, `b=0`, `16`, `i⊗i` not in image; `a=a₁`, `b=−b₁` | holds | none |
| 5.3 invariants | `1 = 2u+b₁v+b₂w` | `s = δu−γv−βw` gives `δ=2s`, `β=−sb₂`, `γ=−sb₁` | holds; `(2,b₁,b₂)=R` needed | R01 |
| 6.1 normalisation | n=1, 2, 3 | `Res_{1,0}=a₁`, Disc 1; `b²−4ac`; `X³−X ↦ 4` | holds | R05 |
| 6.1 divisibility | Sylvester last row | only `aₙ`, `n·aₙ` nonzero | holds | R05 |
| 6.2 root at infinity | n=2 `c+bX`; n=3 | `b² = b²·1`; `a₂²(a₁²−4a₂a₀)`; n=1 would give `1 = a₀²` | holds; n ≥ 2 needed | R05 |
| 6.3 étale criterion | `X²+X+1` over 𝔽₂; `X²−2`; `X³−X` over ℤ[1/2] | `1`, 𝔽₄; `8`; `4`, ℤ[1/2]³ | holds | R05 |

## Not verifiable

- Knus 1991, Chapter IV, (3.1). Paywalled (Springer). It is cited only through Conrad's Remark C.1.1, and I confirmed that Conrad cites it there.
- Grothendieck, Montpellier fonds, folder 77, p. 68 (README, Research context). I fetched it from the university's archive, but it is an image-only manuscript scan with no text layer, and OCR is not available on this worker. The claim that it treats the half-discriminant over an arbitrary base is unchecked.

## Source issues

- none
