# Review of VonNeumannAlgebras (pull request #1041 at 772fc38)

**Verdict:** needs changes

One finding is blocking:
- **R01 (P2):** the module docstring of `Suggested.lean` lists the KMS characterization of the modular group as not statable. Its existence-and-uniqueness form is statable at the pins with this head's own `IsNormalFunctional`, and a tested statement is given below. OperatorAlgebraDynamics on main consumes exactly this theorem (its `gap:modular-theory`).

The P3 findings:
- **R02:** the branch is still not rebased on main (carried from the previous review's R03).
- **R03:** V10.KMS plans to build the strip Phragmén–Lindelöf estimate, which Mathlib proves at the pin. Once rebased, it also restates Tau Ceti's matrix Gibbs-state KMS theorem.
- **R04:** V10.AffineAP still "owns" the bijection between rational primes and the primes of `𝓞 ℚ`, and its norm identity. Mathlib and Tau Ceti both prove these at the pin.

## Previous findings (review of c0dc59f)

- **R01 (V10.AffineAP re-plans the prime number theorem in progressions): repaired.**
  - `README.md:2991–2998` now reads "is consumed from Tau Ceti and not proved here … `NumberField.Chebotarev.tendsto_primeCount_primesCongruent d a₀` … (Chebotarev, Layers 13–14, owns both)".
  - The scope (`:64–68`), the Tau Ceti contract (`:237–245`) and the Needs line (`:3014–3017`) name the two theorems and `TauCeti.primeCount`.
  - Wiener–Ikehara, `LFunctionResidueClassAux`, the higher-prime-power and transfer inputs and ArithmeticDirichletSeries Layer 9 are gone (grep: 0 hits).
  - Both theorems exist with the stated signatures:
    - at the branch pin, `TauCeti/NumberTheory/Chebotarev/PrimeCounting/PrimesCongruent.lean:50, 63`;
    - at main's pin, the same file and lines.
  - Chebotarev on main has Layer 13 (`π_C`) and Layer 14 (`Completed/Chebotarev/README.md:593, 612`).
  - R04 below concerns the residual comparison.
- **R02 (three headlines called not statable): repaired.**
  - `Suggested.lean:149–162` (central, abelian and finite projections) and `:191–198`, `:207–212` (`IsNormalFunctional`, `isNormalFunctional_iff_exists_tsum_inner`).
  - `:282–285` adds `IsNormalFunctional M τ` to `exists_faithful_tracialState`.
  - `:361–372` is `existsUnique_typeDecomposition`. Its type I clause is now "every nonzero projection below `z 0` has a nonzero abelian subprojection", which is Peterson's definition (peterson-notes line 1888).
  - Also added: `IsNormalSemifiniteTrace`, `exists_isNormalSemifiniteTrace_of_isFactor` and `exists_conj_commutant_eq_of_isCyclic`.
  - The docstring bullets are rewritten (`:27–33`, `:40–43`), and the README names every new declaration (V3 `:947–951`, V4 `:1129–1133`, `:1242–1248`, V6 `:1776–1788`, `:1810–1813`, `:1839–1844`).
- **R03 (branch not rebased): not repaired.** It is R02 below.
- **R04 (Connes locator): repaired.**
  - `Suggested.lean:465–467` and `README.md:4445–4447` now cite "Hiai, §1.8, p. 9, … and … the Notes to Chapter 11 of Anantharaman–Popa, p. 189".
  - The References entry was moved accordingly (`:4761`, `:4763`).
  - Both passages were checked at the text: hiai-lectures lines 327–334 (page 9 marker at 326), and anantharaman-popa lines 8397–8410 (pdf 195, printed 189), "an injective … von Neumann algebra is AFD (the converse being immediate)".
- **R05 (forward use of V4 normality in Layer 2): repaired.**
  - `README.md:755` and `:800–803` say "ultraweakly continuous", with the square-summable pairing argument.
  - `:863` says "vector-state pairings".
  - The parenthesis is gone, and V4.Normality derives normality (`:1246–1248`) with the Layer 2 Needs entry (`:1260–1261`).
  - No other "normal" survives in Layers 0–3 (grep of `:353–1036`: only `IsStarNormal`/normal-operator uses).

## R01 (P2) — The W*-KMS characterization is statable at the pins, but the docstring lists it as not statable

**Location:**
- `Suggested.lean:48–51`: "Layer 10: Tomita–Takesaki theory, the KMS characterization of the modular group, … There is no closed antilinear operator `S`, modular operator `Δ`, modular conjugation `J` or modular automorphism group."
- README V10.KMS, `:2797–2818`: "Prove α=σ^φ iff it satisfies this condition … Establish existence and uniqueness for faithful normal states".

**Claim:**
- The KMS characterization (Takesaki's theorem) needs no modular-operator carrier in its existence-and-uniqueness form. A faithful normal state has exactly one pointwise strongly continuous one-parameter group of *-automorphisms for which it satisfies the KMS condition on the strip `0≤Im z≤1`, and that group is σ^φ.
- Every carrier exists at the pins: `IsNormalFunctional` (this head), `StarAlgEquiv`, `H →Lₚₜ[ℂ] H`, `DifferentiableOn`, `ContinuousOn` and `Bornology.IsBounded`.
- The statement is ∃!, not a weakened stand-in, in the same way that `existsUnique_typeDecomposition` states the type decomposition.
- It is a declared contract: OperatorAlgebraDynamics on main asks "What VonNeumannAlgebras must provide (gap:modular-theory): V10's modular operator and modular group of a faithful normal state, its W*-KMS characterization" (`TauCetiRoadmap/OperatorAlgebraDynamics/README.md:109–112`).

**Witness:** A scratch copy of `Suggested.lean` with the declaration below appended elaborates under `lake env lean` at the branch pins: exit 0, only `declaration uses sorry`. Hiai, Theorem 2.14, p. 18 (hiai-lectures lines 737–739), states existence and uniqueness among weakly continuous groups at β=−1.

**Repair:**
1. Add the following to `Suggested.lean` after the Layer 6 block, under `/-! ## Layer 10: Affiliated operators and Tomita–Takesaki theory -/`:

```lean
/-- **The KMS characterization of the modular flow** (Takesaki). A faithful normal state `φ`
on `M` has exactly one one-parameter group `σ` of *-automorphisms of `M`, pointwise continuous
in the strong operator topology, for which `φ` satisfies the KMS condition on the strip
`0 ≤ Im z ≤ 1`: for `x, y ∈ M` some bounded continuous `F`, holomorphic inside, has
`F t = φ(σ_t(x) y)` and `F (t + i) = φ(y σ_t(x))`. It is the modular group
`σ_t(x) = Δ^{it} x Δ^{-it}` (README, V10.KMS; Hiai, Theorem 2.14, p. 18; Takesaki II,
Theorem VIII.1.2). -/
theorem existsUnique_isKMS_flow {M : VonNeumannAlgebra H}
    (φ : M.toStarSubalgebra →ₗ[ℂ] ℂ) (hφ1 : φ 1 = 1) (hφ : ∀ x, 0 ≤ φ (star x * x))
    (hφn : IsNormalFunctional M φ) (hφf : ∀ x, φ (star x * x) = 0 → x = 0) :
    ∃! σ : ℝ → (M.toStarSubalgebra ≃⋆ₐ[ℂ] M.toStarSubalgebra),
      (∀ s t, σ (s + t) = (σ t).trans (σ s)) ∧
      (∀ x, Continuous fun t ↦ ContinuousLinearMap.toPointwiseConvergenceCLM ℂ (RingHom.id ℂ) H H
        ((σ t x : M.toStarSubalgebra) : H →L[ℂ] H)) ∧
      ∀ x y, ∃ F : ℂ → ℂ, ContinuousOn F {z | 0 ≤ z.im ∧ z.im ≤ 1} ∧
        DifferentiableOn ℂ F {z | 0 < z.im ∧ z.im < 1} ∧
        Bornology.IsBounded (F '' {z | 0 ≤ z.im ∧ z.im ≤ 1}) ∧
        ∀ t : ℝ, F t = φ (σ t x * y) ∧ F (t + Complex.I) = φ (y * σ t x) := by
  sorry
```

2. In the docstring's Layer 10 bullet:
   - delete "the KMS characterization of the modular group,";
   - add: "The KMS characterization is stated in its existence-and-uniqueness form; the operators `S`, `Δ`, `J` themselves have no carrier."
3. Name `existsUnique_isKMS_flow` in V10.KMS of the README, next to "Establish existence and uniqueness for faithful normal states".

Tested on instances:
- **M₂(ℂ), φ=Tr(h·), h=diag(2/3,1/3).** σ_t=Ad(h^{it}) gives `σ_t(e₁₂)=2^{it}e₁₂`. With `F(z)=(2/3)2^{iz}`, `F(t)=φ(σ_t(e₁₂)e₂₁)=(2/3)2^{it}` and `F(t+i)=(1/3)2^{it}=φ(e₂₁σ_t(e₁₂))`. The opposite flow `Ad(h^{−it})` would exchange the two boundary values, and the README's uniqueness Check forces `h₁₁/h₂₂=2`.
- **A tracial φ.** F is constant, so `φ(σ_t(x)y)=φ(xy)` for all y, and faithfulness forces σ=id.
- **H=0.** The hypothesis `φ 1 = 1` fails, since 1=0 there.
- **Uniqueness class.** Strong pointwise continuity with ‖σ_t(x)‖=‖x‖ implies σ-weak continuity, so uniqueness among Hiai's weakly continuous groups covers this class. The modular group lies in it, by ‖(σ_t(x)−x)ξ‖² = ω_ξ((σ_t(x)−x)*(σ_t(x)−x)) → 0.

## R02 (P3) — The branch is still not rebased, and cites Tau Ceti declarations absent at its own pin

**Location:**
- The Tau Ceti contract, `README.md:216–236`: `PositiveLinearMap.toGNS` …, `NonUnitalStarAlgHom.IsNondegenerate`, `VonNeumannAlgebra.adjoin` …, `StarSubalgebra.exists_forall_norm_sub_apply_lt_of_mem_centralizer_centralizer`.
- `README.md:391–393`: "the Lean statements write out its body".
- `Suggested.lean:17–18`.

**Claim:**
- The pull request cannot merge: git sees both files as added on both sides.
- The 17 contract names from `GNS.lean`, `Nondegenerate.lean`, `Adjoin.lean` and `Density.lean` exist only at main's Tau Ceti pin. At the branch pin, `TauCeti/Analysis/CStarAlgebra/` has only `CharacterSpaceMeasure.lean` and `UnitaryCharacter.lean`, and there is no `TauCeti/Analysis/VonNeumannAlgebra/`.

**Witness:** `git merge-tree --write-tree origin/main HEAD` reports `CONFLICT (add/add)` on both files; the merge base is `350e970c`. `lake-manifest.json` pins Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`; main pins `2fd255d9` and `1b1ccf4b`.

**Repair:**
1. Rebase onto main, keeping this head's two files. This is the worker's step.
2. Then write both Layer 0 headlines with `π.IsNondegenerate`, which is Tau Ceti's `def IsNondegenerate … := Dense (Submodule.span ℂ (⋃ a, Set.range (π a)))` at main's pin (`TauCeti/Analysis/CStarAlgebra/Representation/Nondegenerate.lean:62`). Import `TauCeti.Analysis.CStarAlgebra.Representation.Nondegenerate`.
3. Delete `Suggested.lean:17–18` and the last clause of `README.md:391–393`.

Control: after the rebase, `git merge-tree --write-tree origin/main HEAD` prints only a tree id.

## R03 (P3) — V10.KMS plans to build estimates and statements that the pinned libraries already prove

**Location:**
- `README.md:2804–2805`: "Supply the required scalar/vector strip Phragmén–Lindelöf and Fourier smoothing estimates here from Mathlib complex analysis".
- `:2816–2818`: "the strip Phragmén–Lindelöf and Fourier smoothing estimates are built here from the maximum modulus principle".
- `:2806–2813`: the finite-dimensional statement, `F(z)=Tr_M(h h^(iz)x h^(-iz)y)`.

**Claim:**
- The strip Phragmén–Lindelöf principle, for Banach-space-valued functions and with its uniqueness corollary, is a Mathlib theorem at the pin. Planning it "here from the maximum modulus principle" restates it.
- Once the branch is rebased (R02), Tau Ceti at main's pin also has two things the README restates:
  - the KMS-function and KMS-state vocabulary for point-norm continuous real actions;
  - for a single matrix block, the existence and uniqueness of the KMS state of `Ad(exp(itK))`. This is V10.KMS's finite-dimensional statement and its M₂ uniqueness Check, with K = log h and β = −1.

**Witness:**
- **Mathlib at the branch pin:**
  - `PhragmenLindelof.horizontal_strip`, `Mathlib/Analysis/Complex/PhragmenLindelof.lean:113`: a function differentiable on `a<Im z<b`, continuous on the closure, with the growth bound and `‖f‖≤C` on both lines, has `‖f z‖≤C` on the closed strip;
  - `eqOn_horizontal_strip`, `:249`.
- **Tau Ceti `2fd255d`:**
  - `TauCeti/Analysis/CStarAlgebra/Action/KMS/Basic.lean:83, 222`;
  - `Action/Gibbs.lean:86, 117`.

**Repair:**
1. In V10.KMS and its Needs line, and in the From Mathlib contract, cite `PhragmenLindelof.horizontal_strip` and `PhragmenLindelof.eqOn_horizontal_strip`. Keep as owned only the Fourier-smoothing estimate and the σ-weak analytic-element construction, which no CStarAction covers.
2. After the rebase, add to the From Tau Ceti contract:
   - `TauCeti.CStarAction.IsKMSFunction` and `TauCeti.CStarAction.IsKMSState` (`Action/KMS/Basic.lean`);
   - `Matrix.IsHermitian.isKMSState_gibbsState` and `Matrix.IsHermitian.isKMSState_iff_eq_gibbsState` (`Action/Gibbs.lean`).
3. Reduce the finite-dimensional statement to the multi-block case.
4. State the crosswalk: for norm-continuous σ, the README's strip function F corresponds to Tau Ceti's KMS function G at β=−1 by `G(z)=F(z+i)`, with a=y and b=x.

Tested on the M₂ instance h=diag(2/3,1/3):
- Here `F(z)=(2/3)2^{iz}` and `G(z)=(1/3)2^{iz}`, so `G(t)=(1/3)2^{it}=φ(e₂₁σ_t(e₁₂))` and `G(t−i)=(2/3)2^{it}=φ(σ_t(e₁₂)e₂₁)`. These are Tau Ceti's boundary values `φ(aα_t(b))` and `φ(α_t(b)a)`.
- `exp(itK)e₁₂exp(−itK)=2^{it}e₁₂` for K=log h.
- The Gibbs state at β=−1 is `Tr(e^K·)/Tr(e^K)=Tr(h·)`.
- `|F|` on the strip is `(2/3)2^{−Im z}≤2/3`, the boundary maximum, as `horizontal_strip` gives.

## R04 (P3) — V10.AffineAP owns a prime comparison that Mathlib and Tau Ceti already prove

**Location:** `README.md:2998–3002`: "Own only the rational-prime/prime-ideal comparison …: the bijection `p ↦ pℤ` from rational primes onto `HeightOneSpectrum (𝓞 ℚ)`, with `absNorm(pℤ)=p`".

**Claim:** At the branch pins, Mathlib has the bijection and Tau Ceti has the identification of `Ideal.absNorm v.asIdeal` with the rational prime under v. These are the two halves of what this sentence claims to own, so what is left to own is only the counting identity.

**Witness:**
- Mathlib: `Rat.HeightOneSpectrum.primesEquiv : HeightOneSpectrum R ≃ Nat.Primes`, `v ↦ natGenerator v` (`Mathlib/NumberTheory/Padics/HeightOneSpectrum.lean:109`).
- Tau Ceti: `Rat.HeightOneSpectrum.absNorm_asIdeal : Ideal.absNorm v.asIdeal = natGenerator v` (`TauCeti/NumberTheory/NumberField/Ideal/IntegersRat.lean:162`; `:183` at main's pin).

**Repair:**
1. Replace the quoted sentence by a citation of `Rat.HeightOneSpectrum.primesEquiv` and `Rat.HeightOneSpectrum.absNorm_asIdeal`.
2. Own only the identity `π_(d,a₀)(x) = TauCeti.primeCount ℚ {𝔭 | absNorm 𝔭 % d = a₀ % d} x`, obtained by transporting the count along `primesEquiv`.
3. Add both names to the Needs line (`:3014–3017`) and to the contracts.

Tested at d=4, a₀=3, x=10:
- `π_(4,3)(10)=#{3,7}=2`.
- `natGenerator((3))=3` and `natGenerator((7))=7`, and these are the only v with `absNorm v.asIdeal % 4 = 3` and `≤10`, so the prime-ideal count is also 2.

## Verified sound

**Gate.**
- My run at 772fc38 (`tauceti-roadmap … gate … --base origin/main`) printed `set_option=0 … dropped=0 readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's run adds `build=0`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty.

**Dependency check** (verbatim, exit 0):

```text
depcheck: 238 roadmaps, 2353 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The merge order lists VonNeumannAlgebras at line 5.

**Lean.**
- `lake env lean TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean` exits 0 with exactly 23 `declaration uses sorry` warnings and nothing else. They are at `:100, 111, 122, 131, 142, 171, 180, 207, 224, 244, 273, 282, 289, 318, 334, 361, 379, 402, 418, 436, 471, 478, 488`.
- **`#check @name` for all 40 declarations** (23 theorems, 17 definitions) in one scratch copy:
  - every H-declaration keeps `[NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]`;
  - the three separable theorems keep `[SeparableSpace H]`, and the two uniqueness theorems also keep `[SeparableSpace K]`;
  - `tomiyama` keeps `[PartialOrder A] [StarOrderedRing A]`;
  - `IsNormalFunctional` has the single universe `u`, shared by H and its net index type (`pp.universes`).
  - Each type matches its README statement. Nothing was changed in the folder.
- **One-tactic probe** (`first | rfl | infer_instance | simp | aesop | trivial` at every `sorry`): all 23 sites fail, so there is no padding.
- **Instances.** `#synth` at the pin finds neither `NonUnitalCStarAlgebra` nor `StarOrderedRing` on `M.toStarSubalgebra`, which confirms the new Layer 13 docstring claim about `CompletelyPositiveMap`.
- **Mathlib's `StandardSubspace`.** `Mathlib/Analysis/InnerProductSpace/StandardSubspace.lean:42` lists "Define the Tomita conjugation, prove Tomita's theorem, prove the KMS condition" as TODO. So S, Δ and J are indeed absent at the pin; only R01's ∃! form is statable.

**Library declarations opened.**
- **Tau Ceti `a91d3aaf`:**
  - `Chebotarev/PrimeCounting/PrimesCongruent.lean:50, 63`;
  - `ArithmeticDirichletSeries/Counting.lean:654` (`primeCount` on `HeightOneSpectrum (𝓞 K)`);
  - `NumberField/Ideal/IntegersRat.lean:162, 177`.
- **Mathlib `6b7abb3c`:** `PhragmenLindelof.lean:113, 249`, `Padics/HeightOneSpectrum.lean:90, 109` and `StandardSubspace.lean`.
- **Tau Ceti `2fd255d`:** the same Chebotarev lines, `IntegersRat.lean:183, 198`, `Action/KMS/Basic.lean:83, 222`, `Action/Gibbs.lean:61, 86, 117` and `Representation/Nondegenerate.lean:62`.
- **Main's pin has none of this head's new objects.** Neither Tau Ceti pin nor Mathlib has normal functionals, normal semifinite traces, central, abelian or finite projection predicates, or a type decomposition (grep of `Analysis/VonNeumannAlgebra`, `Analysis/CStarAlgebra` and `Analysis/InnerProductSpace`). The new definitions duplicate nothing.

**Cross-roadmap citations and overlaps.**
- `roadmaps resolve` reports nothing unresolved, and `roadmaps overlaps` lists no dropping or conflicting pull request.
- Against main's copy of this roadmap, this head drops the ids `V2.AbelianClassification`, `V2.AbelianLocalizable`, `V2.AbelianRepresentationMultiplicity` and `V7.GroupApplications`. `roadmaps grep --fixed` finds none of them outside this folder, on main or at the 467 open heads.
- No other `Suggested.lean` uses the namespace `TauCetiRoadmap.VonNeumannAlgebras`.
- **Ownership by object.** I searched for "normal semifinite trace", "type decomposition", `IsNormalFunctional` and the projection predicates: no match on main or at any open head. QuantumFoundations (#1771, 48 citations), OperatorAlgebraDynamics (#1137, 51 citations), CategoricalOperatorAlgebras (#888) and NoncompactQuantumSymmetry (#1015) consume this roadmap for these objects and own none of them.
- **The KMS objects.** OperatorAlgebraDynamics owns C*-dynamics KMS states and consumes V10.KMS (main `README.md:109–112`; #1137 `README.md:118–127`). This roadmap is the owner of the W*-KMS theorem of R01.

**Sources: the seeded sample (13.1 and 13.2) and the new locators.** Printed page = pdf page − 6 for anantharaman-popa; = pdf page for hiai-lectures and peterson-notes.
- **13.1, Tomiyama:** Hiai Theorem 6.5 (hiai-lectures line 2666, p. 55; (ii) and (v) of Theorem 6.4 at lines 2596 and 2602, pp. 53–54) for a C*-algebra and C*-subalgebra, which matches `tomiyama`. Peterson Theorem 6.2.1 is the unital case (peterson-notes line 3948, p. 98).
- **13.1, injectivity:** Anantharaman–Popa Definition 10.2.1 and Proposition 10.2.2(ii)–(iii), lines 7191–7205, p. 161.
- **13.2, Anantharaman–Popa Chapter 10:**
  - Proposition 10.2.5, line 7269, p. 163.
  - Theorems 10.2.8–10.2.9, lines 7325 and 7333–7350, p. 164; (10.1)–(10.2) is the README's operator form.
  - Theorem 10.3.1, line 7413, p. 166, and Theorem 10.3.4, line 7532, p. 168.
- **13.2, Anantharaman–Popa Chapter 11:**
  - Definition 11.1.1 and Theorem 11.1.3, lines 7685 and 7702, p. 173.
  - Theorem 11.2.2(3), line 8298, p. 186.
  - Remark 11.2.3 and Corollary 11.2.4, lines 8358 and 8376, p. 188.
  - The Notes to Chapter 11, line 8397, p. 189.
- **13.2, other sources:**
  - Peterson Theorem 6.3.8, line 4146, p. 103.
  - Hiai §1.8, lines 327–334, p. 9.
  - Haagerup 1989: line 52 is p. 265, and Theorem 6.1 is line 1177.
  - Haagerup 2016: Theorems 1.1, 1.2, 2.8, 3.1, 4.2 and 5.1 (lines 49, 52, 284, 313, 635, 868) and Lemmas 5.4–5.6 (lines 1109, 1347, 1540).
  - Connes–Feldman–Weiss: Definitions 5–6, Proposition 7, Lemmas 8–9 and Theorem 10 (lines 265, 281, 336, 382, 480, 520).
- **New Anantharaman–Popa locators:**
  - Definition 2.5.1, line 1925, p. 40: normality for bounded increasing nets.
  - Theorem 2.5.5, line 1983, p. 42, and Remark 2.5.7, line 2042, p. 43, whose (3′) `ω=Σ_nω_(ζ_n)`, `Σ‖ζ_n‖²<∞` is `isNormalFunctional_iff_exists_tsum_inner`, with no separability.
  - Theorem 6.4.4, line 4341, p. 95.
  - Theorem 7.1.1, line 4465, p. 99: `JL(M)J=L(M)′`.
  - Definition 8.3.1, lines 5742–5761, pp. 124–125: clauses (a)–(f) match `IsNormalSemifiniteTrace`, with semifiniteness (d) in the "dominates a nonzero finite-trace y" form.
- **New Peterson locators:**
  - §3.2, lines 1698–1717, pp. 44–45: the definitions of abelian and finite projections.
  - Theorem 3.3.1, lines 1888–1896, p. 49, and Corollary 3.3.2, line 1928, p. 50.
  - Proposition 4.2.2, line 2325, p. 60.
  - Theorem 4.7.10, line 2844, p. 72.
  - Proposition 4.7.12, line 2893, pp. 73–74.
  - Theorem 4.9.4, line 3080, p. 78: "unique, up to scalar multiplication, normal semi-finite tracial weight … p is finite if and only if Tr(p)<∞".
  - Proposition 4.9.5, line 3121, p. 79.
- **Hiai Theorem 2.14** (lines 737–739, p. 18) for R01.

**Adversarial pass.** All values were computed this round. "Holds" means the instance agrees with the statement as written.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| `exists_faithful_nondegenerate_representation` | A=0; A=ℂ²; control `diag(z,0)` on ℂ² for A=ℂ | K=0, span{0} dense in 0; `diag(a,b)` spans ℂ²; control injective, span `ℂ×0` not dense | holds; nondegeneracy discriminates |
| `exists_injective_nondegenerate_representation_lp` | A=ℂ; A=M₂; A=0 | `z↦z·1`; GNS(tr/2) has dim 4, ⊕ℕ ≅ ℓ²; A=0 has only π=0, span 0 ≠ ℓ², so `[Nontrivial A]` is needed | holds |
| `double_commutant_iff_isClosed_image_ofCLM` | ℂI; finite rank + ℂ on ℓ² | `(ℂI)''=ℂI`, closed; A''=B(ℓ²)≠A and A not WOT closed | holds |
| `closure_unitBall_eq_unitBall_double_centralizer` | ℂI; q=even projection, A=finite rank + ℂ | `{|c|≤1}I` both sides; `qPₙ→q` SOT, `‖q−(c+F)‖≥max(|1−c|,|c|)≥½` | holds |
| `closure_isStarProjection_eq_positive_contractions` | H=ℂ; ℓ², C=½ | `{0,1}∌½`; block `[[½,½],[½,½]]` has eigenvalues 1, 0 and compression ½ | holds; hypothesis needed |
| `IsCentralProjection` | M₂⊕ℂ; ℂ1 on ℂ² | `(e₁₁⊕0)(e₁₂⊕0)=e₁₂⊕0≠0=(e₁₂⊕0)(e₁₁⊕0)`, so not central; 1⊕0 central; `e₁₁∈(ℂ1)′` but `∉ℂ1`, excluded by `z∈M` | discriminating |
| `IsAbelianProjection` | M₂; L∞[0,1] | `e₁₁M₂e₁₁=ℂe₁₁` abelian; for 1: `e₁₂e₂₁=e₁₁≠e₂₂=e₂₁e₁₂`, not abelian; every L∞ projection abelian, none minimal | discriminating |
| `IsFiniteProjection` | B(ℓ²) with S; e₀₀; II₁ factor | `S*S=1`, `SS*=1−e₀₀≤1`, ≠1, so 1 not finite; for e₀₀, `vv*≤e₀₀` of rank 1 forces equality; for q<p with q∼p, τ(p−q)=0, so q=p | discriminating |
| `exists_predual`, `exists_vonNeumannAlgebra_starAlgEquiv` | ℂ1 on ℂ; B(ℂⁿ); M=ℂ² | X=ℂ (z↦z̄); X=conj S₁(ℂⁿ); diag on ℂ² | holds |
| `IsNormalFunctional` | ℓ∞ ultrafilter state; `φ_w=Σ2^(−n−1)x_n`; general linear τ, range net | `φ(1_{0..N})=0↛1`, fails; `1−2^(−N−1)→1`, passes; tail of a monotone net lies above `x_{i0}` in the range order, so Type-u index sets suffice | discriminating; docstring argument checked |
| `isNormalFunctional_iff_exists_tsum_inner` | B(ℓ²), φ=Σ2^(−n−1)ω_(e_n); ultrafilter state on ℓ∞⊂B(ℓ²); H=0 | `ξ_n=2^(−(n+1)/2)e_n`, Σ‖ξ_n‖²=1; any Σω_(ξ_n) has `Σ_kφ(δ_k)=Σ‖ξ_n‖²=1` vs 0, so both sides false; τ=0, ξ=0 | holds both directions |
| `isCyclic_iff_isSeparating_commutant` | M₂ on ℂ²; diag; H=0 | e₁ cyclic for M₂, separating for ℂI; (1,0): `diag(0,1)(1,0)=0`, neither; 0 both on H=0 | holds |
| `equivalent_of_subequivalent` | B(ℓ²), p=1, q=1−e₀₀ | `S*S=1`, `SS*=q`; q≼1 via v=q; p∼q with p≠q | holds |
| `tracialState_unique` | M₂; ℂ⊕ℂ; B(ℓ²) | `τ(e₁₁)=τ(e₂₂)` gives τ=tr/2, and x₁₁ fails (1 vs 0); `t·pr₁+(1−t)pr₂` all tracial (factor needed); `τ(1)=2τ(1)` | holds |
| `exists_faithful_tracialState` (now normal) | R; M₂; B(ℓ²) | R: product trace, `τ(1_{p_n})↑` normal and faithful; M₂ excluded (e₁₁ minimal); B(ℓ²) excluded (S non-unitary isometry) | holds |
| `isSimpleRing_of_isTypeIIOne` | R; ℂ⊕ℂ; B(ℓ²) | `q_i=v_i*pv_i∈I`, `Σq_i=1`; ℂ⊕0 excluded by `IsFactor`; compacts excluded by `IsFinite` | holds |
| `IsNormalSemifiniteTrace` | Tr on B(ℓ²); τ≡∞ off 0; τ=0; ‖·‖ on M₂ | Tr(e₀₀)=1, semifinite; ∞-map normal, tracial, faithful, with no finite y≤1, so not semifinite; zero map semifinite, not faithful; `‖e₁₁+e₂₂‖=1≠2`, not additive | each clause independent |
| `exists_isNormalSemifiniteTrace_of_isFactor` | ℂ; B(ℓ²); R⊗̄B(ℓ²); type III; τ'=0 | τ(c)=c; finite ⟺ finite rank ⟺ Tr<∞; `Tr(1⊗e₀₀)=1`, `Tr(1)=∞` with 1 infinite; no nonzero finite p, hypothesis fails; τ'=0·τ, so c=0 is needed (ℝ≥0) | holds |
| `exists_conj_commutant_eq_of_isCyclic` | diag ℂ², Ω=(1,1); M₂ on M₂ (HS), Ω=I/√2; M₂ on ℂ²; H=0 | J=coordinate conjugation, `J(xΩ)=x*Ω`, M′=diag=JMJ; J(x)=x*, JMJ=right multiplications=M′; trace forces `|Ω₁|=|Ω₂|` and `Ω̄₁Ω₂=0`, so Ω=0, not cyclic (vacuous); J=0 | holds |
| `IsTypeIIInfinity` | R⊗̄B(ℓ²); B(ℓ²); R; H=0 | true (1⊗e₀₀ finite, 1⊗S); false (e₀₀ minimal); false (finite); false (1≠0) | holds |
| `existsUnique_typeDecomposition` | M₂; R; R⊗̄B(ℓ²); III factor; M₂⊕R; H=0 | (1,0,0,0); (0,1,0,0); (0,0,1,0); (0,0,0,1); (1⊕0,0⊕1,0,0), with (1,0,0,0) excluded by q=0⊕1; all 0=1; each `z_iz′_j` (i≠j) is forced to 0 | holds, unique |
| `ergodicSMul_dense_subgroup` | ℚ⊂ℝ; ℤ⊂ℝ | ℚ ergodic; `⋃[n,n+½)` ℤ-invariant, neither null nor conull | holds; density needed |
| `HasTypeITwoSummand` | M₂; M₂⊕M₃; M₃; M₄; ℂ² | true (e₁₁, e₂₂); true (z=1⊕0); false (`2·rank e=3`); false (eM₄e≅M₂ not abelian); false (e∼f forces e=f) | holds |
| `exists_unique_extension_of_finitelyAdditive` | M₃, `μ=Tr(diag(1,−1,0)·)`; M₂ Bloch; H=0 | C=1, ‖φ‖=2≤4; f=¾ vs affine `½+1/(4√2)=0.677`, so M₂ is excluded; μ(0)=2μ(0)=0, φ=0 | holds |
| `dye` | ℂ² swap; M₃ transpose; M₂ Bloch map | `(a,b)↦(b,a)`; `(e₁₂e₂₁)ᵀ=e₁₁≠e₂₂`, Jordan only; image inner product −3/5, excluded | holds |
| `tomiyama` (13.1) | diag E on M₂; `x↦e₁₁xe₁₁`; transpose; A=0 | axb=[[10,28],[45,84]], E=diag(10,84)=aE(x)b; ‖P‖=1 with P(1)=e₁₁; e₁₂↦e₂₁ fails fixing; ‖P‖=0, vacuous | holds |
| 13.1 Checks | transpose⊗id on Σe_ij⊗e_ij; state extension; `x₁₁e₁₁+x₂₂e₂₂+x₁₂e₂₁` | flip eigenvalue −1; ρ=[[½,c],[c̄,½]]≥0 iff |c|≤½; P(P(x))=diag≠P(x), and [[1,1],[1,1]]↦[[1,0],[1,1]] not self-adjoint | holds |
| `IsInjective`, `IsHyperfinite`, `isInjective_iff_isHyperfinite` | H=0; ℂ1 on ℓ²; ℓ∞; L(F₂) | P=0; `P(x)=⟨e₀,xe₀⟩1`, A_n=ℂ1; diagonal expectation and dyadic ℓ∞(2ⁿ); no hypertrace (`W(a)⊔aW(a⁻¹)`, masses 2>1) and no Γ | holds |
| II₁ and II∞ uniqueness (13.2) | R vs L(S_∞); M₂; R⊗̄B(ℓ²); B(ℓ²) | both ≅R (Theorem 11.2.2); M₂ has a minimal projection, excluded; II∞ via Corollary 11.2.4; B(ℓ²) excluded | holds |
| Følner Checks (13.2) | ℂ², τ=(a+2b)/3, u=(1,−1), ε=1/10 | `‖[u,P]‖²=2−2(|α|²−|β|²)²=8|α|²|β|²≤1/100` gives |α|²≤0.0012516 or ≥0.99875; P=1 gives ½; all ≠⅓±1/10; T=diag(3^(−½),(⅔)^½): Tr T²=1, Tr(xT²)=τ(x); T=e₁₁ gives 1≠⅓ | holds |
| Semidiscreteness Checks (13.2) | ℓ∞ truncations; E_n1_[0,1/3] | ‖x−trunc‖=1 for x=(1,1,…); value frac(2ⁿ/3)∈{⅓,⅔}, ‖·‖∞≥⅓, ‖·‖₁≤2⁻ⁿ | holds |
| V13b.SpatialNorm Checks | u=e₁₂⊗e₁₂+e₂₁⊗e₂₁; 1⊗1 | swaps e₁⊗e₁↔e₂⊗e₂, u*u rank 2, ‖u‖=1 vs 2; 1 vs √2·√2=2 | holds |
| Bicentralizer Checks | h=diag(⅔,⅓) | `(e₁₂φ)(e₂₁)=φ(e₂₂)=⅓`, `(φe₁₂)(e₂₁)=φ(e₁₁)=⅔`; density of xφ−φx is xh−hx | holds |
| `existsUnique_isKMS_flow` (R01) | M₂, h=diag(⅔,⅓); tracial φ; H=0 | `σ_t(e₁₂)=2^{it}e₁₂`, F=(⅔)2^{iz}, F(t+i)=(⅓)2^{it}; σ=id; φ1=1 impossible | statable and true (R01) |
| V10.KMS library overlap (R03) | M₂, K=log h, β=−1 | Gibbs `Tr(e^K·)/Tr e^K=Tr(h·)`; G(z)=F(z+i)=(⅓)2^{iz} matches Tau Ceti's boundary values; |F|≤⅔ on the strip | duplicated (R03) |
| V10.AffineAP comparison (R04) | d=4, a₀=3, x=10 | π=#{3,7}=2; natGenerator((3))=3, natGenerator((7))=7, prime-ideal count 2 | duplicated (R04) |
| V10.AffineAP citation (previous R01) | d=4, a₀=3; d=1 | limit 1/φ(4)=½; IsUnit in ZMod 1, limit 1 | holds |

## Not verifiable

- **Arveson 1969, Theorem 1.2.3; Haagerup 1985; Haagerup 1987; Connes–Størmer 1978:** settled as uncertified, with no legal full text in the cache.
- **Tomiyama 1957, Theorem 1:** the cached text for `tomiyama-1957` is five lines ending "Request unsuccessful. Incapsula incident ID …" (lines 1–5), a bot-block page and not the paper. The manifest nevertheless records it as `certified`.
- **Paywalled books, not in the manifest:**
  - Takesaki I–III: IV.4.9; VIII.1.2; XV.3; XVI.1.9 and 1.22–1.23; XVII.3.12; XVIII;
  - Runde, 6.4.14 and 6.4.24–6.4.25;
  - Sakai, Theorem 4.1.6;
  - Goodman–de la Harpe–Jones, §3.3;
  - Reed–Simon I and Rudin.
- **Connes–Woods 1985 §7; Bost–Connes, Laca–Raeburn, Neshveyev:** paywalled.
- **Connes, *Periodic automorphisms*:** an image-only scan, and OCR is not installed on this worker.

## Source issues

- **Gap** in peterson-notes at Theorem 4.9.4, p. 79: the source says a normal semifinite tracial weight ω is faithful, since otherwise semifiniteness fails. It should first show that ω's null ideal is a weakly closed ideal, so ω=0 or ω is faithful, because the zero weight is semifinite in its sense. Affects the proof.
- **Misprint** in peterson-notes at the proof of Theorem 4.9.4, p. 78: the source says take v_n with v_n*v_n=p₀ and v_n*v_n=p_n. It should say v_n*v_n=p₀ and v_nv_n*=p_n. Affects nothing.
- **Misprint** in peterson-notes at the proof of Theorem 4.9.4, p. 78: the source's Fubini computation starts and ends with Tr(xx*). It should end with Tr(x*x). Affects nothing.
- **Misprint** in peterson-notes at §3.2, p. 45: the source says "properly infnite". It should say "properly infinite". Affects nothing.
- **Misprint** in anantharaman-popa at Definition 10.2.1, p. 161: the source writes "a von Neumann M" without "algebra". It should read "a von Neumann algebra M". Affects nothing.
- **Gap** in hiai-lectures at Theorem 6.5, pp. 55–56: the source states Tomiyama's theorem for any C*-algebra and C*-subalgebra but proves only the case of a unital von Neumann subalgebra. It should give the bidual reduction for the general case. Affects the proof.
