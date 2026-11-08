# Review of QuadraticFormsOverABase (pull request #1930 at cdc1c9f)

**Verdict:** needs changes

## Previous findings (review of 48cf0a6)

| Id | Status at cdc1c9f | Passage |
|---|---|---|
| R01 | repaired | `conj` is gone. `exists_productHom` uses `QuadraticAlgebra.starAlgEquiv` (`Suggested.lean:312–315`), and the file elaborates. |
| R02 | repaired | Scope lines 72–76: "Ordinary quadratic forms … are LefschetzPencilsAndVanishingCycles §2.1's … is its §2.2's (`evenClifford_center_etale_azumaya`)". 4.2 is deleted. 2.1 states the comparison for `n ≥ 1`. 2.4 (line 503) says "the even-rank normal form is §2.1's". |
| R03 | repaired | Lines 77–80 credit §0.1a. 3.1 (lines 549–552) states the comparison. The characteristic ≠ 2 case is still unassigned: see R02 below. |
| R04 | repaired | Lines 39–42 and 254–263: the comparison with §0.2's `extendScalars` is a target, and `mapCoeffs_eq_baseChange` is "its form over a ring". |
| R05 | repaired | Layer 6 is only the formal-degree identity. `Suggested.lean` has no Layer 6 declaration. |
| R06 | repaired | 5.1 is now `etale_discAlgebra_iff`. The Tau Ceti criterion is a contract (lines 181–182). |
| R07 | repaired | `orthogonalGroup` is the range of `QuadraticMap.orthogonalToGeneralLinear` (`Suggested.lean:222–224`). Line 88 reads "with the smoothness of `SOₙ` when `2` is invertible". |
| R08 | repaired | Lines 34–35: "3.4 alone reaches forms on locally free modules of rank `n`". |
| R09 | repaired | Lines 629–631: "`H¹(ℝ, O(q₂))` has three elements". |
| R10 | partly | 1.4 cites Auel–Biesel–Voight Prop. 3.20 for `4 ∣ n` and proves the rest by the route. 5.1, 5.2 and 3.4 name their route or source. The Examples citation is split, and Exercise 1.6.10 has its page. Still missing: 2.3 and the new Arf and Conrad 2015 citations (R05 below). |
| R11 | repaired | `mapCoeffs_apply`, `mapCoeffs_comp` and `halfDisc_smul` are no longer in `Suggested.lean`. |
| R12 | repaired | Line 806 reads "None." |

## R01 (P1) — The route of 3.3 needs the fibral flatness criterion, and nothing supplies it

- **Location.** README 3.3, `README.md:596–599`: "Route: the fibral criterion for a flat morphism of finite presentation, the orbit map of `GLₙ` on the scheme of smooth forms, and the tangent space computation". The *Needs:* line (603–604) lists 2.2, 2.4, 3.1, 3.2, `Algebra.Smooth`, `Algebra.FormallySmooth` and `RootsOfUnityGroup.coordinateRing_smooth_iff`.
- **Claim.** Every input of the route for `smooth_orthogonal_iff` and `smooth_specialOrthogonal` is owned.
- **Witness.** Conrad2014 lines 12559–12564 (p. 306): the criterion reduces to fibral flatness (EGA IV₃ 11.3.10). Tau Ceti `Module.Flat.of_flat_fiber` (`TauCeti/RingTheory/Flat/Fiber.lean:116`) assumes `Module.FinitePresentation B M`, a finite module; the orbit map is not finite. No roadmap owns 11.3.10.
- **Repair.**
  - **`smooth_orthogonal_iff`, direction ⇐.** Use an infinitesimal lifting route. It only needs the polar matrix `P` to be invertible, which holds when `n` is even, or when `2 ∈ Rˣ` and `δ'` is a unit.
    - Take a square-zero `A → A/J` and `g₀ ∈ O(Q)(A/J)`, and choose any lift `g̃`.
    - Write `−(Q ∘ g̃ − Q)` as an upper-triangular `β` with entries in `J`.
    - Then `g = g̃ (1 + P⁻¹β)` lies in `O(Q)(A)`.
    - Finite presentation then gives `Algebra.Smooth`, using Mathlib `Algebra.FormallySmooth`.
    - Tested over `𝔽₂[ε]/(ε²)` with `Q = x₀x₁` and `g₀` the swap:
      - `g̃ = !![ε, 1; 1, 0]` has `Q ∘ g̃ − Q = ε x₀²`;
      - `T = P⁻¹β = !![0, 0; ε, 0]`;
      - `g̃ (1 + T) = !![0, 1; 1, 0]`, which is in `O(Q)(A)`.
  - **`smooth_specialOrthogonal` at residue characteristic two**, where the polar form is not perfect. Do one of the following:
    - Make the fibral flatness criterion for finitely presented algebras a Layer 3 target. Locator: EGA IV₃ 11.3.10, as Conrad 2014 uses it on p. 306. *Needs:* Tau Ceti `Module.Flat.of_flat_fiber` (the finite case) and Mathlib's local flatness criterion. Also list Mathlib `Algebra.Smooth.of_formallySmooth_fiber` (`Mathlib/RingTheory/Smooth/Fiber.lean:238`).
    - Or give `SO′` a lifting route with trace-zero corrections `T`. By 1.3, `(x ↦ B_Q(x, T x), tr T)` lies in the hyperplane `dδ'_Q(ψ) = 2 t δ'(Q)`. The tangent count of Conrad's Steps 1 and 3 (`n(n − 1)/2` at geometric points) together with Nakayama gives surjectivity onto that hyperplane.

## R02 (P2) — The orthogonal group scheme over a field of characteristic ≠ 2 has two owners

- **Location.**
  - Scope, `README.md:48–50`: "the orthogonal group `O(Q)` of a form as a closed subgroup scheme of `GLₙ` over an arbitrary base, its smoothness".
  - `README.md:77–80` assigns only OrthogonalTamagawaAndLatticeMass §0.1a (characteristic two).
  - 3.3 is at lines 593–595.
- **Claim.** The only earlier owner of an orthogonal group scheme is §0.1a.
- **Witness.** OrthogonalTamagawaAndLatticeMass (#1222, head be1d8b4, merge-order line 150), `README.md:122–126`, §0.1: over fields of characteristic ≠ 2, `O(V,Q)` is `TauCeti.ConstantForm.groupScheme K n C`, and §0.1 proves smoothness "for every nondegenerate C". This is the field case of 3.3.
- **Repair.**
  - Add to "Left to other roadmaps": "The orthogonal and special orthogonal group schemes of a nondegenerate quadratic space over a field of characteristic ≠ 2, as `TauCeti.ConstantForm.groupScheme K n C`, with their smoothness, are OrthogonalTamagawaAndLatticeMass §0.1's; Layer 3 extends them to an arbitrary base."
  - Add §0.1 to that roadmap's contract.
  - Add a comparison target to 3.1: when `2 ∈ Rˣ`, `g ↦ (gᵀ)⁻¹` maps `orthogonalGroup Q A` isomorphically onto the points `M C Mᵀ = C` of `TauCeti.ConstantForm` at `C = polarMatrix Q`. This is the convention OrthogonalTamagawaAndLatticeMass records at its lines 16 and 175.
  - Tested on `Q = x² + 4y²` over `ℚ`, `C = diag(2, 8)`:
    - `g = !![0, 2; 1/2, 0]` has `Q(g x) = Q(x)`;
    - `g C gᵀ = diag(32, 1/2) ≠ C`, so the identity map is wrong;
    - `(gᵀ)⁻¹ = !![0, 1/2; 2, 0]` satisfies `M C Mᵀ = C`.
  - The 3.1 Check "give the same points over `ℤ[1/2]`" is right only because there `C⁻¹ = C`. Say so in the Check.

## R03 (P3) — The *Needs:* line of 3.4 omits the flatness of `O(qₙ)` and the descent its route uses

- **Location.** `README.md:624–625`: "*Needs:* 2.4, 3.1; SchemeAndStackFoundations §1.15 (`IsTorsor`) and §2.3". The route (lines 619–621) uses "fppf descent of modules with a quadratic form".
- **Witness.** SchemeAndStackFoundations (main), `README.md:2507–2508`: fppf torsors are developed for `G` flat and locally of finite presentation. `O(q₃)` over `ℤ` is not smooth (Theorem C.1.5); its flatness needs 3.2 and 3.3. Module descent is §1.1 (line 2071).
- **Repair.**
  - Write "*Needs:* 2.4, 3.1, 3.2, 3.3; SchemeAndStackFoundations §1.1 (descent of quasi-coherent modules), §1.15, §2.3".
  - Add one sentence to the route: `O(qₙ)` is flat and finitely presented over `ℤ` (smooth for `n` even, `μ₂ × SO′ₙ` for `n` odd), so §1.15 applies.
  - Add §1.1 to the SchemeAndStackFoundations contract and to the Layer 3 Dependencies.

## R04 (P3) — `coeff_mul_formDiscr` is backticked in the README but not declared in `Suggested.lean`

- **Location.** `README.md:769`: "Prove `coeff_mul_formDiscr`: for `n ≥ 1` and `f : R[X]` with `natDegree f ≤ n`".
- **Witness.** `Suggested.lean` declares no `coeff_mul_formDiscr`; its docstring (lines 45–46) lists 6.1 as not statable without `formDiscr`. A backticked name of this roadmap's own is a claim that `Suggested.lean` declares it.
- **Repair.** Write "Prove that, for `n ≥ 1` and `f : R[X]` with `natDegree f ≤ n`, …" with no Lean name. This is how 0.2, 2.1, 3.1 and 3.4 already state their comparisons that cannot be stated in Lean.

## R05 (P3) — One target and two citations have no locator

- **Location.**
  - (a) 2.3, `README.md:476–477`: "Prove that it is smooth for every `n` and every `R`, with `δ'(standard (2m + 1)) = (−1)^m`…". There is neither a locator nor a route.
  - (b) `README.md:403` and `819`: "(Arf 1941)".
  - (c) `README.md:637–638`: "The orthogonal groups of such positive-definite lattices give non-split reductive `ℤ`-groups of types B and D (Conrad 2015)".
- **Witness.**
  - (a) Conrad2014 line 12461 (p. 303) has the smoothness of `qₙ`, and line 12525 (p. 305) has `disc′(q₂ₘ₊₁) = (−1)^m`.
  - (c) Conrad2015 lines 332–347 (Examples 2.9–2.10, p. 9) are about `SO(q)`, not `O(q)`.
  - (b) Arf 1941 has no open copy.
- **Repair.**
  - (a) Add "(Conrad 2014, Definition C.1.2 and the sentence after it, p. 303; proof of Proposition C.1.4, p. 305, for the odd value; the even value is the block computation of the Layer 1 Examples)".
  - (b) Cite GeometryOfNumbersAndQuadraticArithmetic §6.8 (`arfInvariant`, merge-order line 52) for Arf's invariant: the class of `Σ q(eᵢ) q(fᵢ)` in `K/℘(K)` in a symplectic basis. In the basis `(eᵢ, fᵢ/bᵢ)` this is `Σ aᵢcᵢ/bᵢ²`, the constant of the Example's Artin–Schreier algebra. Give a section and page if Arf 1941 is kept.
  - (c) Write "The special orthogonal groups `SO(q)` of such lattices are semisimple `ℤ`-groups of types D and B, non-split when `q` is definite (Conrad 2015, Examples 2.9 and 2.10, author's version p. 9)".

## R06 (P3) — The uniqueness clause of 1.1 needs `n` odd

- **Location.** `README.md:302–303`: "Also prove that `univHalfDisc n` is homogeneous of degree `n` and that it is the only polynomial `d` with `2d = univDisc n`."
- **Witness.** The README's own Check (line 314): `univDisc 2 = 4U₀₀U₁₁ − (U₀₁ + U₁₀)²` has coefficient `−1` at `U₀₁²`, so no `d` with `2d = univDisc 2` exists. Homogeneity holds for every `n`.
- **Repair.** Write "…homogeneous of degree `n` for every `n`, and that, for `n` odd, it is the only polynomial `d` with `2d = univDisc n` (`ℤ[U]` has no `2`-torsion)".

## Verified sound

### Gate, build and dependency check

- **Worker's gate** (at cdc1c9f): every check is 0, including `build=0`.
- **My re-run of the gate.** All text scanners are 0. It reports `depcheck: NOT IN ORDER: QuadraticFormsOverABase (insert it after its last supplier)`, because the public order file does not list this roadmap yet. The candidate merge order places it at line 393, right after its last supplier, so this is not a finding.
- **The brief's depcheck command** prints `depcheck: 238 roadmaps, 2346 edges, 0 problem(s)`: no UPWARD line and no CYCLE line.
- **Suppliers in the merge order.** LefschetzPencilsAndVanishingCycles 67, OrthogonalTamagawaAndLatticeMass 150, QuadraticFormInvariantsPartII 387, HyperellipticCurves 392. SchemeAndStackFoundations and QuadraticFormInvariants are on main. The R05 repair's GeometryOfNumbersAndQuadraticArithmetic is at line 52.
- **Changes outside the folder:** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Elaboration.** `lake env lean TauCetiRoadmap/QuadraticFormsOverABase/Suggested.lean` exits 0 with 21 warnings, all `declaration uses 'sorry'`.
- **Mechanical signature check.** One scratch file holds `#check @name` for all 38 declarations and 42 cited library names, and elaborates with exit 0.
  - Every elaborated type matches its README statement.
  - Every needed hypothesis is in the declaration's own signature: `Odd n`, `Even n`, `3 ≤ n`, `IsSmooth Q`, `Invertible 2`, `Even n ∨ IsUnit 2`, `Ideal.span {2, b₁, b₂} = ⊤`.
  - `IsSmooth` quantifies over algebraically closed `K : Type u`, the universe of `R`.
  - Nothing changed.
- **One-tactic probe.** On a scratch copy, every `sorry` was replaced by `first | rfl | (simp; done) | infer_instance | (norm_num; done) | (simp_all; done) | decide`. None of the 21 theorems closes, so there is no padding.
- **Headline coverage.**
  - Every statable headline of the Summary is stated.
  - Five targets are listed in the docstring as not statable, each with its missing carrier: the 0.2 and 2.1 comparisons, the 3.1 comparison, 3.4, and 6.1.
  - There are no stand-ins.
  - Definitions have real bodies, and there is no `set_option`, `lemma`, `#eval` or sorry'd data.

### Sources read at their locators (seeded sample and every locator the README gives)

The texts were fetched legally (arXiv, author pages, msp.org). Page numbers are those of the author's version for Conrad, and of the arXiv version where the README says "arXiv numbering". In the Conrad 2014 and 2015 extractions the sign ⩾ comes out as `>`. Two passages show this: "now we may and do assume n > 3 (i.e., m > 1)" right after the case `m = 0` (line 12823), and "so δq > 1 if dim V is odd" (line 2141). So "rank n > 1" in C.1–C.2 reads `n ⩾ 1`, which matches the README's ranges.

- **0.1, 0.2, 5.1, 6.1** name no source; I checked their routes as proofs (table).
- **Conrad2014**, Appendix C:
  - §C.1, p. 302, lines 12394–12411: non-degeneracy, fibrewise smooth quadric, and SGA 7's "ordinary".
  - Remark C.1.1, line 12422: cites Knus IV 3.1.
  - p. 303, lines 12435–12439: representability of `O(q)`.
  - Definition C.1.2, p. 303, lines 12451–12461.
  - Grothendieck–Kneser attribution, p. 304, line 12490.
  - Paragraph before C.1.4, p. 304, lines 12476–12487.
  - Proposition C.1.4 (1)–(3), p. 304, lines 12491–12501.
  - Proof of C.1.4, p. 305, line 12525: `disc′(q₂ₘ₊₁) = (−1)^m`.
  - Theorem C.1.5, p. 305, lines 12550–12554.
  - Fibral criterion, p. 306, lines 12559–12564 (R01).
  - Tangent dimension `n(n−1)/2 + (δ²+δ)/2`, p. 307, line 12605.
  - Step 2, p. 307, lines 12607–12617: `(det g)² = 1` and `O = μ₂ × SO′`.
  - Step 3, p. 308, line 12643.
  - Lemma C.2.1, p. 309, lines 12685–12687: fppf-local, étale when `n` is even or `2` is a unit.
  - Proposition C.2.2, p. 309, line 12699.
  - Remark C.2.3, p. 310, line 12753.
  - Proposition C.2.4, p. 311, lines 12806–12819: `C₀` is fppf-locally `Mat_{2^m}`, hence Azumaya.
  - (C.2.2), p. 313, line 12867: the Dickson invariant.
  - Theorem C.2.11 and Remark C.2.12, p. 318, lines 13075–13090.
  - Exercise 1.6.10, p. 50, line 2131.
- **Voight2011** (arXiv v5):
  - (3.2) on p. 9, line 407, with the coefficient positions of (1.12), line 262.
  - §4 (from line 651), p. 17, lines 791–793: Azumaya iff semiregular.
  - Standing Noetherian hypothesis at line 17, as the README says.
- **AuelBieselVoight2023** (arXiv v2):
  - Proposition 3.10, p. 8, line 431.
  - Proposition 3.20, p. 10, lines 559–562: `C` symmetric with even diagonal, `4 ∣ n`, `det C ≡ pf(U − Uᵀ)²`.
  - Lemma 3.21, line 564.
  - Remark 3.25 (`4 ∣ n` is needed), line 586.
  - Theorem 3.28, p. 12, line 619.
- **Voight2016** (arXiv v3): Theorem A (iii), lines 160–161; Construction 3.12 and (3.13), p. 16, lines 741–747.
- **Wood2011** (arXiv v1): §2, Key Construction, p. 7, lines 291–299: `τ² = −bτ − ac`.
- **ChaputRomagny2010** (arXiv v1):
  - Remark 4.1.2, p. 20, lines 914–919: the bilinear subscheme is not flat; `O₂ₙ` is its largest flat subscheme.
  - Lemma 4.1.4, line 928: `det = 1 + 2δ`.
  - Definition 4.1.6, line 940.
- **Dieudonne1955**: §2, pp. 908–909, lines 65–96: `z² + z = Δ(Q) = Σ Q(eᵢ)Q(e_{m+i})`.
- **BieselGioia2016**: §8 as announced at lines 173–176: `Δ(A × B) ≅ Δ(A) ∗ Δ(B)` for Voight's `∗`. Lines 95–97: the same discriminant form.
- **Conrad2015**: abstract, lines 7–12, types B and D from definite lattices; Examples 2.9–2.10, p. 9 (R05).

All of these support the statements as written, except the three items of R05.

### Symbolic checks

These are pure Python, coefficientwise in `ℤ[U]` and in the parameter rings.

- **`det(U + Uᵀ)`, odd `n`.** For `n = 1, 3, 5` it has 1, 18 and 1110 terms, none odd.
- **`(−1)^(n/2) det(U + Uᵀ) − B²`, even `n`.** For `n = 2, 4, 6` it has 1, 99 and 7875 terms, all divisible by 4. With the sign flipped, 2, 12 and 120 coefficients fail.
- **5.2 relation.** `(2XY − b₁Y − b₂X)² − a − b(2XY − b₁Y − b₂X)` reduces to 0 modulo `X² − b₁X − a₁` and `Y² − b₂Y − a₂`.
- **Discriminant of the product.** `b² + 4a − (b₁² + 4a₁)(b₂² + 4a₂) = 0`.
- **Voight's (3.13).** It holds for `w = x ⊗ y + σx ⊗ σy` (residue 0).
- **Layer 1 Example, `m = 2`.**
  - `C = −a₁c₁b₂² − a₂c₂b₁² + 4a₁a₂c₁c₂`.
  - Modulo 2 this is `a₁c₁b₂² + a₂c₂b₁²`, as the README says.

### Library declarations opened at the pins (49)

42 were checked by `#check`; the other 7 were read in source.

- **Mathlib:**
  - `QuadraticMap.toBilin` and `toBilin_apply` (`LinearAlgebra/QuadraticForm/Basis.lean:88, 93`, upper triangular as the Conventions say).
  - `radical` and `Nondegenerate` (`…/Radical.lean:35, 115`). `Nondegenerate` is radical `⊥` plus polar kernel of rank `≤ 1`.
  - `QuadraticForm.baseChange` and `baseChange_tmul` (`…/TensorProduct.lean:128, 132`, inside `InvertibleTwo`).
  - `IsAzumaya` (`Algebra/Azumaya/Defs.lean:60`). It includes `FaithfulSMul`, so the zero ring is harmless.
  - `QuadraticAlgebra.discr`, which is `b ^ 2 + 4 * a` (`…/Discriminant.lean:52`).
  - `starAlgEquiv` (`…/Basic.lean:249`).
  - `resultant_eq_zero_of_lt_lt` and `resultant_deriv` (`RingTheory/Polynomial/Resultant/Basic.lean:347, 977`). The latter needs `0 < f.degree`, which `natDegree f = n ≥ 1` gives.
  - `discr` and `discr_of_degree_eq_two` (`…:934, 956`).
  - `Algebra.Smooth.of_formallySmooth_fiber` (`RingTheory/Smooth/Fiber.lean:238`).
  - `Module.rankAtStalk`, `WittVector`, `Ideal.exists_le_maximal`, `Algebra.TensorProduct.basis`, `TensorProduct.piScalarRight`, `LinearMap.BilinMap.toQuadraticMap_surjective`, `QuadraticMap.IsometryEquiv`.
- **Tau Ceti:**
  - `TauCeti.QuadraticMap.orthogonalGroup` (`LinearAlgebra/QuadraticForm/OrthogonalGroup/Basic.lean:190`).
  - `QuadraticMap.orthogonalToGeneralLinear` (`:758`). Its entries are `g (Pi.single j 1) i`, so matrices act on column vectors, as the Conventions say.
  - `GeneralLinear.coordinateHopfAlgebra`, `genericMatrix`, `pointsMulEquiv`.
  - `HopfIdeal`, `toIdeal`, `ofSpan`.
  - `ConstantForm.definingHopfIdeal` (`Algebra/AlgebraicGroup/ConstantForm/Basic.lean:247`, relations `X C Xᵀ − C`).
  - `RootsOfUnityGroup.coordinateRing_smooth_iff` (`…/RootsOfUnity/Smooth.lean:44`, over a field).
  - `TauCeti.Orthogonal`: relations `X Xᵀ − 1`, with "no smoothness is claimed here".
  - `SpecialOrthogonal` smoothness under `[Invertible 2]` (`…/SpecialOrthogonal/Smooth.lean:80, 100`).
  - `QuadraticAlgebra.etale_iff_isUnit_discr` (`Algebra/QuadraticAlgebra/Etale.lean:29`, any `CommRing`).
  - `Polynomial.Monic.isUnit_discr_iff`, `discr_map_of_natDegree_eq` and `Monic.etale_adjoinRoot_iff`. Their signatures agree with Layer 6's "`IsUnit f.discr ↔ f.Separable ↔ Algebra.Etale R (AdjoinRoot f)`".
  - `Module.Flat.of_flat_fiber` (`RingTheory/Flat/Fiber.lean:116`).

### Cross-roadmap citations resolved

- **LefschetzPencilsAndVanishingCycles** (#873, head 072e6cd):
  - §2.1 at line 1440: ordinary forms, the rank-zero exclusion, `Nondegenerate` over a field, and the normal form `Σ xᵢx_{i+m} (+ λx²)`.
  - §2.2 at line 1499, and `evenClifford_center_etale_azumaya` at `Suggested.lean:99` (bijective `polarBilin`, `Nontrivial R`).
- **OrthogonalTamagawaAndLatticeMass** (#1222, be1d8b4): §0.1a at line 146, with the coefficients of `q(gx) − q(x)`, perfect `k` of characteristic two, and the `xy` Check.
- **QuadraticFormInvariantsPartII** (#1834, eda79c7): §0.2 at line 484, and `extendScalars` at `Suggested.lean:101`, which is the same coordinate polynomial as `mapCoeffs`.
- **HyperellipticCurves** (#1707, e63cf0a): §0.1 at line 541; `formDiscr` at `Suggested.lean:86`, the discriminant of the universal polynomial. §0.1 does not state the resultant identity, so 6.1 is new.
- **SchemeAndStackFoundations** (main): §1.15 `IsTorsor` (line 2502), §2.3 `NonabelianH1`, `NonabelianH1.mk`, `mk_eq_one_iff` (lines 3330–3338), §1.1 (line 2071).
- **QuadraticFormInvariants** is on main.
- **Shared objects recomputed in each supplier.** Each agrees with this roadmap:
  - `xy + z²` is ordinary (2.1 Check and Lefschetz §2.1).
  - `u² = u − Q(e₀)Q(e₁)` (Layer 4 Examples and Lefschetz §2.2).
  - The swap and identity on `𝔽₂²` (3.1 Check and OrthogonalTamagawaAndLatticeMass §0.1a).
  - `[1, a]` maps to `x² + xy + ay²` (0.2 Check and QuadraticFormInvariantsPartII §0.2).
  - `formDiscr 1 = 1` (Conventions and HyperellipticCurves §0.1).

### Ownership and overlaps

- **Search by object, on main and at the 464 open heads.** The objects searched were: half-discriminant, hafnian, discriminant algebra, Arf invariant, Voight's product, quaternion rings and semiregularity, even Clifford Azumaya, orthogonal group schemes, the Conrad Appendix C locators, and EGA IV₃ 11.3.10.
- **Results.**
  - Nobody else owns 1.1–1.4, 4.1, 5.1–5.2 or 6.1.
  - OrthogonalSpinGroups (completed on main; the closest in vocabulary) treats discriminant algebras of forms over fields with `2` invertible and shares no target.
  - OrthogonalTamagawaAndLatticeMass §0.1 is the second owner in R02.
  - GeometryOfNumbersAndQuadraticArithmetic §6.8 owns `arfInvariant` (R05).
  - 11.3.10 has no owner (R01).
  - The board's packages (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) are unrelated.
- **Overlaps.** `overlaps.md`, re-run at the 17:59 index, lists no pull request that changes this roadmap, no dropped id that it cites, and no consumer of it. The renumbering (4.2 and the old 5.1 deleted) affects no citing roadmap.

### Adversarial pass

| Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| Conventions, 0.1 `coeffMatrix`, `polarMatrix` | `ax²+bxy+cy²`; `x²` on `Fin 1 → 𝔽₂` | `!![a,b;0,c]`, `!![2a,b;b,2c]`, det `4ac−b²`; polar `!![0]` vs coefficient `!![1]` | holds | none |
| 0.1 change of variables | `x₀x₁`, `g` = swap | `gᵀUg = !![0,0;1,0]`, folded `!![0,1;0,0]` | holds | none |
| 0.2 evaluation law | `xy`, `ℤ → ℤ/6`, `x = (2,3)` | `f(6) = 0` / `2·3 = 0` | holds | none |
| 0.2 comparison with `extendScalars` | `[1,a]`, `K → L`; Lean bodies | both give `x² + xy + ay²`; `Σ Q(eᵢ) proj i i + Σ_{i<j} polar · proj i j` is the upper-triangular `toLinearMap₂'` | holds | none |
| 0.2 `mapCoeffs_eq_baseChange` | `x²`, `A = R[t]`, `t e₀`; `xy` at `(t,1)` | `t²` / `t²`; `t` / `t` (`piScalarRight.symm (t,1) = t⊗e₀ + 1⊗e₁`) | holds | none |
| 1.1 `two_mul_univHalfDisc` | `n = 1, 3, 5`; `n = 2` | `2U₀₀`; 0 odd coefficients; coefficient `−1` at `U₀₁²` | holds, odd `n` needed | R06 (clause) |
| 1.1 Voight check | `½ det !![2a,w,v;w,2b,u;v,u,2c]` | `4abc+uvw−au²−bv²−cw²` = Voight2011 line 407 | holds | none |
| 1.2 `two_mul_halfDisc` | `x²+yz` on `ℤ³`; `ax²` | `det polar = −2 = 2·(−1)`; `2a = 2·a` | holds | none |
| 1.2 `halfDisc_eq_of_toQuadraticMap` | `B = !![1,0,0;0,0,0;0,1,0]` for `x²+yz` | `B + Bᵀ = U + Uᵀ`; `δ' = −1` on both sides | holds | none |
| 1.3 `halfDisc_comp` | `g = 2` on `x²`; `diag(−1,1,1)` on `q₃`; `g = 0`, `n = 3` | `4 = 2²·1`; `−1 = 1·(−1)`; `0 = 0·δ'` (homogeneous of degree 3) | holds for every matrix | none |
| 1.3 `halfDisc_mapCoeffs`, `δ'(aQ)` | `n = 2` junk value; `a = −1` on `q₃` | evaluation commutes with `Int.castRingHom` for any fixed polynomial; `1 = (−1)³(−1)` | holds for every `n` | none |
| 1.4 `four_dvd_univSignedDisc_sub_sq` | `n = 0, 2, 4, 6`; sign flipped | `1 − 1 = 0`; 1/99/7875 terms all `≡ 0 (mod 4)`; flipped: 2/12/120 fail | holds | none |
| 1.4 route | `det(P − 2Uᵀ) ≡ det P − 2 tr(adj P Uᵀ)`, `2 tr(adj P Uᵀ) = tr(adj P · P) = n det P` | `det K ≡ (1−n) det P`; `(−1)^(n/2) ≡ 1 − n (mod 4)` at `n = 0, 2, 4, 6` | holds | none |
| 1.4 Auel–Biesel–Voight locator | Prop. 3.20 at `4 ∣ n`; Remark 3.25 at `n = 2` | `det C ≡ pf(U−Uᵀ)²`, `pf ≡ B (mod 2)`; `det !![0,1;1,0] = −1`, `(−1)·(−1) = 1 = B²` | consistent | none |
| 1.4 `discr_discAlgebra` | `n = 2`; `n = 0`; `standard 4` | `b² + 4(−ac) = b² − 4ac`; `1 + 0 = 1`; `B = 1`, `det = 1`, `C = 0` | holds | none |
| 1.4 Wood comparison | `ω ↦ −τ` | `ω² = τ² = −bτ − ac = bω − ac` | holds | none |
| Layer 1 Example (characteristic two) | `m = 2` blocks | `C ≡ a₁c₁b₂² + a₂c₂b₁²`; `ω = Bt` gives `t² + t + Σ aᵢcᵢ/bᵢ²` | holds | R05 (locator) |
| 2.1 `IsSmooth` | `x²+yz`, `x²+y²+z²` over `𝔽₂`; `x²+ty²` over `𝔽₂(t)`; `n = 0` | radical 0; plane `x+y+z = 0`; rational radical 0, line `x = √t y` over `K̄`; vacuous | correct | none |
| 2.1 vs `Nondegenerate` over a field | characteristic 2, polar kernel `W`, `Q|_W = ℓ²` over `K̄` | radical 0 ⇔ (`dim W ≤ 1` and `Q ≠ 0` on `W`) | holds in both directions, `n ≥ 0` | none |
| 2.1 vs ordinarity | `0·x²` (`n = 1`); `n = 0` | radical everything / not ordinary; smooth / excluded | `n ≥ 1` needed, and stated | none |
| 2.2 odd criterion | `x²+yz`, `x²+y²+z²` over `𝔽₂`; `ax²`; zero ring | `δ' = 1` and smooth; `δ' = 0` and not; `a` unit ⇔ smooth; both true | holds | none |
| 2.2 even criterion | `xy`, `x²+y²` over `𝔽₂`; `n = 0`; `x²+y²` over `ℤ` | det 1, smooth; 0, not; 1, smooth; 4, not smooth at 2 | holds | none |
| 2.3 standard forms | `q₁, q₂, q₃, q₄`; `n = 0` | `δ' = 1, −1`; polar det `−1, 1`; det `1` | holds | R05 (locator) |
| 2.4 faithfully flat / étale | `tx²` over `𝔽₂(t)`; `x²+y²` over `ℝ`; zero ring; `x²+xy+y²` over `ℤ[1/3][ζ₃]` | needs `√t` (inseparable); `(x+iy)(x−iy)`, det `−2i`; `S = 0` is faithfully flat over `0`; `(ζ−ζ⁻¹)² = −3` | holds | none |
| 3.1 relations and points | `x₀x₁` over connected `A`; `x²`; `Q = 0` | `ac = bd = 0`, `ad+bc = 1` gives `diag(t,t⁻¹)` or the anti-diagonal; `X₀₀² − 1`; `⊥`, `GLₙ` | holds | none |
| 3.1 bilinear vs quadratic | shear over `𝔽₂` | `g C gᵀ = !![2,1;1,0] ≡ C`; `q(e₀+e₁) = 1 ≠ 0` | holds | none |
| 3.1 ConstantForm convention | `Q = x²+4y²` over `ℚ`, `g = !![0,2;1/2,0]` | `Q(gx) = Q(x)`; `g C gᵀ = diag(32,1/2) ≠ C`; `(gᵀ)⁻¹ C (gᵀ)⁻ᵀ = C` | needs `g⁻ᵀ` | R02 |
| 3.2 `det_sq_eq_one` | `Q = 0`, `g = 2` over `ℚ`; swap for `x₀x₁` | `4` (hypothesis needed); `(−1)² = 1` | holds | none |
| 3.2 `mem_orthogonalGroup_iff_existsUnique` | `q₃`, `g = −I` over `ℤ`; swap at `n = 2` | `ζ = det g = −1`, `h = I`; `det(ζh) = ζ² = 1 ≠ −1` | holds, odd `n` needed | none |
| 3.3 `smooth_orthogonal_iff` | `n = 0`; `x²` over `𝔽₂` and `ℤ[1/2]`; `x₀x₁` over `𝔽₂`; `(x+y)²` over `K̄` | `GL₀` trivial / `Even 0`; `μ₂` not smooth / false, étale / true; dimension 1 / true; `!![a,b;1+a,1+b]`, dimension 2 | holds | R01 (route) |
| 3.3 lifting route (repair) | `𝔽₂[ε]`, `x₀x₁`, `g̃ = !![ε,1;1,0]` | `Q∘g̃ − Q = εx₀²`, `T = !![0,0;ε,0]`, `g̃(1+T) = !![0,1;1,0]` | lifts | R01 |
| 3.3 `smooth_specialOrthogonal` | `x²` over `𝔽₂`; `q₃` over `ℤ` | `SO′ = 1`, smooth; Conrad C.1.5 | holds | R01 (route) |
| 3.4 Checks | `H¹(ℝ, O(q₂))`; `H¹(ℤ, μ₂)`; `E₈` | 3 signatures; `ℤˣ/ℤˣ² = {±1}`, `Pic ℤ = 0`; polar det 1, definite vs indefinite | hold | R05 (`SO`) |
| 3.4 flatness of `O(qₙ)` | `q₃` over `ℤ` | not smooth (C.1.5); `μ₂ × SO′₃`, flat | needs 3.2–3.3 | R03 |
| 4.1 `isAzumaya_even_iff` | `0·x²` (`n = 1`); `x²+y²+z²` over `ℤ`; `q₃`; ideal `rC₁` | `C₀ = R` is Azumaya while `δ' = 0`; Lipschitz order, `δ' = 4`; `M₂(ℤ)`, `δ' = −1`; `(rc)(rc′) = −Q(r)cc′ = 0` | holds, `n ≥ 3` needed | none |
| Layer 4 Examples | `x²+xy+y²`, `x₀x₁`, `x²+y²` over `𝔽₂` | `t² = t − Q(e₀)Q(e₁)`: `t²+t+1`; `t² = t`; `t² = 1` | hold | none |
| 5.1 `etale_discAlgebra_iff` | `xy`, `x²+xy+y²`, `x²+y²` over `𝔽₂`; `n = 0` | `ω² = ω`; `ω² = ω+1` (`𝔽₄`); `ω² = 1`; `R × R`, smooth | holds | none |
| 5.2 `exists_productHom` relation | symbolic | residue 0; `disc = d₁d₂` | holds | none |
| 5.2 Voight identification | `ω′ = w − st` | `ω′² = −stω′ − (mt²+ns²−4nm) = bω′ + a` at `t = b₁`, `n = −a₁`, `s = b₂`, `m = −a₂` | holds | none |
| 5.2 invariants | `1 = 2u + b₁v + b₂w`; `ℤ[i] ⊗ ℤ[i]`; `𝔽₄ ⊗ 𝔽₄` | `δ = 2s`, `β = −sb₂`, `γ = −sb₁` (using `γb₂ = βb₁`); invariants `⟨1, XY⟩` vs image `⟨1, 2XY⟩`; `η = X+Y`, `η² = η` | holds, hypothesis needed | none |
| 5.2 Checks | golden ⊗ golden; `ℤ[i]²`; `A₂ = R × R`; `(5,3,0,1)` | `a = 6, b = −1`, 25; `a = 4, b = 0`, 16; `a = a₁, b = −b₁`; `29 = 29` | holds | none |
| 6.1 formal-degree identity | `n = 1` (`a₁` arbitrary, also `0`); `n = 2`; `c + bX` at `n = 2`; `X³ − X` | `a₁·1 = a₁`, `0 = 0`; `a(b²−4ac)` on both sides; `0·b² = 0 = Res` (`lt_lt`); `1·4 = (−1)³(−4)` | holds | R04 (name) |

## Not verifiable

- **Knus 1991, Chapter IV, (3.1).** Springer, paywalled. It is cited only through Conrad's Remark C.1.1, and I confirmed that Conrad cites it there (Conrad2014 line 12424).
- **Arf 1941.** The DOI resolves only to a de Gruyter landing page; the sources service found no legal open copy. The value of Arf's invariant was checked against Dieudonne1955 instead.
- **Bichsel–Knus 1994.** AMS Contemporary Mathematics, not fetched. It is cited only to exclude line-bundle-valued forms from scope.
- **Grothendieck, Montpellier fonds, folder 77, p. 68** (Research context). It is an image-only manuscript, and OCR is not available on this worker.
- **EGA IV₃ 11.3.10.** Not read. R01 relies on Conrad's statement of it (Conrad2014 lines 12559–12564).

## Source issues

- **Misprint** in Wood2011 at §2, Key Construction, p. 7 (arXiv v1): the source says "we we construct", with a doubled word; it should be "we construct"; affects nothing.
- **Misprint** in AuelBieselVoight2023 at Remark 3.19, p. 10 (arXiv v2): the source says "once wishes to prove an equality"; it should be "one wishes"; affects nothing.
