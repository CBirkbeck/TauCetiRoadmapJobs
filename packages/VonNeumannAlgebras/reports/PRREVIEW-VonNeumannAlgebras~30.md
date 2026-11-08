# Review of VonNeumannAlgebras (pull request #1041 at c0dc59f)

**Verdict:** needs changes

Two findings are blocking:
- **R01 (P2):** V10.AffineAP re-plans the prime number theorem for arithmetic progressions. Tau Ceti already proves it at the pin, and Completed/Chebotarev owns it.
- **R02 (P2):** The module docstring of `Suggested.lean` calls three headlines "not statable", but each can be stated at the pins. They are the type decomposition, the normality of the II₁ trace, and Dixmier's normal-functional theorem. The repaired statements below elaborate.

The P3 findings:
- **R03:** the branch is still not rebased on main.
- **R04:** a new locator for Connes's theorem points at a passage that recalls a different equivalence.
- **R05:** a forward use of V4's normality predicate in Layer 2.

## Previous findings

- **R01 (BanachAlgebras owns the regular L² action, the L¹ characters and Fourier uniqueness): repaired.**
  - The scope (`README.md:64–75`) now names BanachAlgebras §§7.2, 7.3, 3.1 and 7.5 as owners, and the consumer claim is gone.
  - A new `From TauCetiRoadmap.BanachAlgebras` contract is at `:270–291`.
  - V8.RegularL2 consumes A7.RegularL2 (`:2216–2234`), and V11.UnitizationCharacters consumes §3.1 and A7.CharactersAndUniqueness (`:3461–3480`).
  - V11.FourierUniqueness is replaced by these citations, with the mapping "The uniqueness inputs of inversion, cited elsewhere as V11.FourierUniqueness, are BanachAlgebras A7.CharactersAndUniqueness on G and Tau Ceti's …" (`:313–316`).
  - I compared the contract against BanachAlgebras on main (`b3d628f`): §7.2 `:1555`, §7.3 `:1611`, §7.5 `:1735`, §3.1 `:756`. The convolution, the involution `f*(x)=c(x)·conj(f(x⁻¹))`, the bound, adjoint law, nondegeneracy and faithfulness of λ, the conjugation-free character bijection, L¹ semisimplicity, measure uniqueness, and the unitization restriction homeomorphism all match.
- **R02 (branch not rebased): not repaired.** This is R03 below.
- **R03 (definitions without Checks): repaired.** New Checks:
  - V7.Index (`:2136–2143`) and V10.TracialLp (`:2610–2617`).
  - The natural cone and its pairing (`:2656–2663`).
  - The measured relations, full group and hyperfinite relations (`:3630–3643`).
  - `Ct` (`:3714–3721`), V12.J.Enriched (`:4003–4011`) and V12.J.CentralSplitting (`:4029–4036`).
  - Semidiscreteness (`:4198–4208`), amenable relations (`:4453–4460`) and the bicentralizer (`:4636–4646`).

  Each definition now has at least three Checks. I recomputed every value (see the table).
- **R04 (V12.J.Maps unitality Check): repaired.** `:3813–3816` now ends "unitality is a separate clause of the normal-map API for maps that are not surjective … for Dye's bijective Φ it also follows from `α(1)=1`".
- **R05 (three locators): partly repaired.**
  - The separability convention (`:121–130`) and Remark 11.2.3, p. 188 (`:4412`) are repaired.
  - The locator for injective ⟺ hyperfinite was replaced by "Notes to Chapter 10 …, p. 171", which recalls a different equivalence. This is R04 below.
- **R06 (three attributions): repaired.**
  - Bergman spaces: `:2463`.
  - `IsHeckeTriple` and `HeckeRing` are now in the Mathlib contract (`:177–179`) and in V10.Hecke's Needs line (`:2842`).
  - "OperatorAlgebraDynamics D4": `:3496`.
- **R07 (layer order): repaired.**
  - V4.AbelianClassification, V4.AbelianLocalizable and V4.AbelianRepresentationMultiplicity close Layer 4 (`:1430–1537`). V8.GroupApplications follows V8.SubgroupCosets (`:2191`).
  - The Dependencies lists are completed: Layer 7 (`:2152`), Layer 12 (`:4059`) and Layer 13 (`:4658`).
  - No other roadmap cites the old ids `V2.Abelian*` or `V7.GroupApplications` (`roadmaps grep`, main and 466 open heads).
  - One forward use of V4 remains in Layer 2: R05.

## R01 (P2) — V10.AffineAP re-plans the prime number theorem for progressions, which Tau Ceti proves at the pin

**Location:**
- `README.md:2925–2955`: "own the adapter `π_(d,a₀)(x) ~ x/(ϕ(d)log x)` … Consume the implemented `TauCeti.LSeries.wienerIkehara` … Specialize the prime-ideal counts to K=ℚ and `S={𝔭:absNorm(𝔭)≡a₀ mod d}`".
- The same analytic inputs are listed at `:296–298`, `:331–332`, `:2966–2968` and `:3054–3055`.

**Claim:** This asymptotic is already a pinned Tau Ceti theorem, in exactly the prime-ideal form the paragraph specializes to. It is owned by Completed/Chebotarev. The README plans it again from Wiener–Ikehara, the residue-class L-series, higher-prime-power removal and Abel transfer. What exists at the pins is cited, not restated.

**Witness:** At Tau Ceti `a91d3aaf` (the branch pin) and `2fd255d` (main's pin), `TauCeti/NumberTheory/Chebotarev/PrimeCounting/PrimesCongruent.lean` has two theorems:
- `:63`, `NumberField.Chebotarev.tendsto_primeCount_primesCongruent (m a) [NeZero m] (ha : IsUnit (a : ZMod m))`: `primeCount ℚ {p | absNorm p % m = a % m} x / (x/log x) → 1/φ(m)`.
- `:50`, the same count `~ Li(x)/φ(m)`.

**Repair:**
1. **Contract and scope.**
   - Add `NumberField.Chebotarev.primeCount_primesCongruent_isEquivalent_logIntegral` and `NumberField.Chebotarev.tendsto_primeCount_primesCongruent` to the From Tau Ceti contract (`TauCeti/NumberTheory/Chebotarev/PrimeCounting/PrimesCongruent.lean`).
   - Add with them `TauCeti.primeCount` (`TauCeti/NumberTheory/ArithmeticDirichletSeries/Counting.lean`).
   - In the scope, name Completed/Chebotarev as the owner of prime counting in progressions.
2. **V10.AffineAP.**
   - Replace its first paragraph (`:2925–2955`) by a citation of these two theorems, for a₀ a unit modulo d.
   - Keep the id V10.AffineAP, the rational-prime/prime-ideal comparison and the prime-pair lemma (`:2957–2965`).
   - AnalyticNumberTheoryPartII (#1167, its `README.md:81` and §6.9c) consumes "V10.AffineAP: the prime number theorem in a fixed residue class and its ratio-2 prime-pair lemma". That citation keeps resolving.
3. **Unused inputs.** Delete the following from `:296–298`, `:331–332`, `:2928–2951`, `:2966–2968` and `:3054–3055`. They are used nowhere else in the README (grep):
   - `TauCeti.LSeries.wienerIkehara`;
   - the `LFunctionResidueClassAux` and `vonMangoldt.residueClass` inputs;
   - the higher-prime-power and transfer declarations;
   - ArithmeticDirichletSeries Layer 9.

Tested on the instances: at d=4, a₀=3 the cited theorem gives the limit 1/φ(4)=1/2, the README's `1/ϕ(d)`. At d=1, `IsUnit (1 : ZMod 1)` holds and the limit is 1, the prime number theorem. The prime-pair lemma uses a₀=1, which is a unit for every d≥1.

## R02 (P2) — Three headlines the docstring calls "not statable" are statable at the pins

**Location:**
- `Suggested.lean:26–28`: "Layers 3 and 6: the type decomposition and the semifinite/standard-form classification. They need central decomposition, normal semifinite traces and the standard form, none of which exist."
- `Suggested.lean:29–32`, Layer 4: "Neither Mathlib nor Tau Ceti at the pins has normal functionals … the same lack is why the trace theorems below omit normality".
- `Suggested.lean:223–229`, `exists_faithful_tracialState`.
- The headlines in the README:
  - `README.md:1792–1800`: the type decomposition by central projections (Peterson, Theorem 3.3.1).
  - `README.md:1612–1614`: "existence and uniqueness of the faithful normal normalized trace on a II₁ factor".
  - `README.md:1209–1211`: a normal positive functional is "a countable sum of vector functionals with square-summable vectors".

**Claim:** The Murray–von Neumann type decomposition needs only projection predicates, the kind the file already uses for `IsTypeIIInfinity`. It needs no central decomposition and no trace.

Normality of a functional is statable on the pinned SOT copy `H →Lₚₜ[ℂ] H`, which the file already uses in `closure_unitBall_eq_unitBall_double_centralizer`. Increasing nets converging strongly are exactly the bounded increasing nets with their supremum, by Vigier.

So the normal-trace headline is stated weaker than the README's, and two headlines are missing.

**Witness:** A scratch copy elaborates under `lake env lean` at the branch pins, with only `sorry` warnings. It contains:
- `IsCentralProjection`, `IsAbelianProjection` (`eMe` commutative) and `IsFiniteProjection` (the clause of `IsTypeIIInfinity`);
- `existsUnique_typeDecomposition`;
- `IsNormalFunctional`, the normal form of `exists_faithful_tracialState`, and `isNormalFunctional_iff_exists_tsum_inner`.

**Repair:** Add to `Suggested.lean`, at Layers 4–6, the following (tested, each with a docstring stating its mathematics):

```lean
open Filter Topology in
def IsNormalFunctional (M : VonNeumannAlgebra H) (τ : M.toStarSubalgebra →ₗ[ℂ] ℂ) : Prop :=
  ∀ (ι : Type u) [Preorder ι] [IsDirected ι (· ≤ ·)] [Nonempty ι]
    (x : ι → M.toStarSubalgebra) (y : M.toStarSubalgebra),
    Monotone (fun i ↦ (x i : H →L[ℂ] H)) →
    Tendsto (fun i ↦ ContinuousLinearMap.toPointwiseConvergenceCLM ℂ (RingHom.id ℂ) H H
      (x i : H →L[ℂ] H)) atTop
      (𝓝 (ContinuousLinearMap.toPointwiseConvergenceCLM ℂ (RingHom.id ℂ) H H (y : H →L[ℂ] H))) →
    Tendsto (fun i ↦ τ (x i)) atTop (𝓝 (τ y))

theorem isNormalFunctional_iff_exists_tsum_inner {M : VonNeumannAlgebra H}
    (τ : M.toStarSubalgebra →ₗ[ℂ] ℂ) (hτ : ∀ x, 0 ≤ τ (star x * x)) :
    IsNormalFunctional M τ ↔ ∃ ξ : ℕ → H, Summable (fun n ↦ ‖ξ n‖ ^ 2) ∧
      ∀ x : M.toStarSubalgebra, τ x = ∑' n, inner ℂ (ξ n) ((x : H →L[ℂ] H) (ξ n)) := by
  sorry

def IsCentralProjection (M : VonNeumannAlgebra H) (z : H →L[ℂ] H) : Prop :=
  IsStarProjection z ∧ z ∈ M ∧ z ∈ M.commutant

def IsAbelianProjection (M : VonNeumannAlgebra H) (e : H →L[ℂ] H) : Prop :=
  IsStarProjection e ∧ e ∈ M ∧
    ∀ x ∈ M, ∀ y ∈ M, (e * x * e) * (e * y * e) = (e * y * e) * (e * x * e)

def IsFiniteProjection (M : VonNeumannAlgebra H) (e : H →L[ℂ] H) : Prop :=
  IsStarProjection e ∧ e ∈ M ∧ ∀ v ∈ M, star v * v = e → v * star v ≤ e → v * star v = e

theorem existsUnique_typeDecomposition (M : VonNeumannAlgebra H) :
    ∃! z : Fin 4 → (H →L[ℂ] H),
      (∀ i, IsCentralProjection M (z i)) ∧ (∀ i j, i ≠ j → z i * z j = 0) ∧ ∑ i, z i = 1 ∧
      (∀ w, IsCentralProjection M w → w ≤ z 0 → w ≠ 0 →
        ∃ e, IsAbelianProjection M e ∧ e ≠ 0 ∧ e ≤ w) ∧
      (IsFiniteProjection M (z 1) ∧ ∀ e, IsAbelianProjection M e → e ≤ z 1 → e = 0) ∧
      ((∀ e, IsAbelianProjection M e → e ≤ z 2 → e = 0) ∧
        (∀ w, IsCentralProjection M w → w ≤ z 2 → w ≠ 0 → ¬ IsFiniteProjection M w) ∧
        (∀ w, IsCentralProjection M w → w ≤ z 2 → w ≠ 0 →
          ∃ e, IsFiniteProjection M e ∧ e ≠ 0 ∧ e ≤ w)) ∧
      (∀ e, IsFiniteProjection M e → e ≤ z 3 → e = 0) := by
  sorry
```

Then:
- Add `IsNormalFunctional M τ ∧` to the conclusion of `exists_faithful_tracialState`.
- Delete the "Layers 3 and 6" type-decomposition clause and the normal-functional sentence of the Layer 4 bullet from the docstring.
- Name the five new declarations in V4.Normality, V5 and Layer 6 of the README, with their Checks.

The values of the tested statements:
- **The `IsNormalFunctional` predicate is discriminating.** `φ_w=Σ2^(−n−1)x_n` on `ℓ∞` passes. The ultrafilter state fails, with `1_{0..N}→1` strongly while `φ(1_{0..N})=0≠1`. A norm-convergence version would wrongly admit that state.
- **`existsUnique_typeDecomposition` on single factors:**
  - `M₂(ℂ)` gets `z=(1,0,0,0)`, since e₁₁ is abelian and finite, which rules out slots 1 and 3.
  - R gets `(0,1,0,0)`.
  - `R⊗̄B(ℓ²)` gets `(0,0,1,0)`.
- **Uniqueness:** every cross product `z_i z′_j` (i≠j) of two solutions is forced to 0.
- **The zero space:** H=0 gives all `z_i=0=1`.

## R03 (P3) — The branch still conflicts with main and cites Tau Ceti declarations absent at its own pin

**Location:**
- The branch as a whole.
- The From Tau Ceti contract (`README.md:211–231`) and Layer 0 (`:379–380`): "the Lean statements write out its body".
- `Suggested.lean:16–17` and `:94`, `:106`.

**Claim:** The pull request cannot merge as it stands. The 17 GNS, nondegeneracy, `adjoin` and density names in the contract exist only at main's Tau Ceti pin. The two Layer 0 headlines restate the body of a pinned predicate.

**Witness:**
- `git merge-tree --write-tree origin/main HEAD` reports `CONFLICT (add/add)` on `README.md` and `Suggested.lean`; the merge base is `350e970c`.
- `lake-manifest.json` pins Tau Ceti `a91d3aaf`, which has no `Analysis/CStarAlgebra/GNS.lean`, `Representation/Nondegenerate.lean` or `Analysis/VonNeumannAlgebra/`.

**Repair:**
1. Rebase onto main, keeping this head's two files. This is the worker's step; a repair job cannot merge main.
2. Then state `exists_faithful_nondegenerate_representation` and `exists_injective_nondegenerate_representation_lp` with `π.IsNondegenerate`, importing `TauCeti.Analysis.CStarAlgebra.Representation.Nondegenerate`.
3. Delete `Suggested.lean:16–17` and the last clause of `README.md:379–380`.

Control: at main's pin `2fd255d` all 17 names exist:
- `GNS.lean:54, 62, 72, 86, 94, 99, 110`;
- `Nondegenerate.lean:62, 68, 74, 82`;
- `Adjoin.lean:38, 49, 54, 59, 65, 74`;
- `Density.lean:128`.

There, `IsNondegenerate π` is the `Dense (span ⋃ range (π a))` body written out at `Suggested.lean:94`. Main's own `Suggested.lean` also uses a plain `import Mathlib`, so no module-form change is needed.

## R04 (P3) — The new locator for injective ⟺ hyperfinite recalls injective ⟺ Property (P)

**Location:**
- `Suggested.lean:342`: "Connes's theorem as recalled in the Notes to Chapter 10 of Anantharaman–Popa, p. 171".
- The same locator at `README.md:4396–4397` and `:4710`.

**Claim:** That passage recalls, for algebras on a separable Hilbert space, the equivalence of amenability with Schwartz's Property (P), not with hyperfiniteness.

**Witness:**
- anantharaman-popa lines 7669–7671, p. 171: "So, finally, amenability is equivalent to Property (P). More generally, this is still true for any von Neumann algebra acting on a separable Hilbert space".
- hiai-lectures lines 327–334, p. 9, assumes a separable Hilbert space, defines AFD sequentially and recalls that Connes proved AFD ⟺ injective.

**Repair:** In all three places, replace the locator by "Connes's theorem as recalled in Hiai, §1.8, p. 9, and in the Notes to Chapter 11 of Anantharaman–Popa, p. 189". The second passage (anantharaman-popa lines 8407–8410) recalls Connes's result that an injective von Neumann algebra is AFD, the converse being immediate. Hiai's sequential definition is `IsHyperfinite`'s.

## R05 (P3) — Layer 2 asserts normality, a predicate Layer 4 defines

**Location:**
- `README.md:787–788`: "construct both canonical normal unital star homomorphisms `ι_M(x)=x⊗1_N` and `ι_N(y)=1_M⊗y`".
- `:741–742`: "the restriction map `M' → B(pH)` is a faithful normal isomorphism onto its image".
- `:801–803`: "(normality is the predicate defined in V4; V4 does not consume this statement)".

**Claim:** Three Layer 2 conclusions use V4's normality predicate. Layer 4 needs Layer 2 (V4.0.Fields consumes V2's completed tensors, and V4.AbelianClassification consumes V2's generator). This is a coarse 2⇄4 edge, and Layer 2's Dependencies (`:921–928`, "Layers 0 and 1") omit it.

**Witness:** V4.Core (`:1100–1104`) defines the normality predicates for functionals, positive maps and star homomorphisms. It then proves that "ultraweak continuity implies these normality predicates", which is all Layer 2 needs.

**Repair:**
1. In `:787–788` and `:741–742`, replace "normal" by "ultraweakly continuous", proved from Layer 1's square-summable characterization of ultraweak functionals (`:514–515`).
2. Delete the parenthesis at `:802–803`.
3. Add to V4.Normality one sentence deriving that `ι_M`, `ι_N` and the corner restriction are normal from V4.Core's implication.

Tested on an instance: for `M=B(ℂ²)` and `N=ℂ`, `ι_M` is the identity, ultraweakly continuous and normal. For `N=0`, `ι_M` is the zero map, which is both.

## Verified sound

**Gate.**
- My run at c0dc59f reports every count 0, ending `source-material=0 OK`, exit 0. The worker's run adds `build=0`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/VonNeumannAlgebras'` is empty.

**Dependency check** (verbatim, exit 0):

```text
depcheck: 237 roadmaps, 2341 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The suppliers are all on main:
- OperatorTheory (PolarDecomposition, OperatorIdeals), BanachSpaceTheory, BanachAlgebras, AmenableGroups and OptimalTransport;
- the RepresentationTheory sub-roadmaps;
- Completed GlobalNumberFields, ArithmeticDirichletSeries and OneParameterSemigroups.

**Lean.**
- `lake env lean TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean` exits 0 with exactly 19 `declaration uses sorry` warnings. They are at `:91, 102, 113, 122, 133, 145, 154, 169, 189, 218, 226, 233, 255, 279, 295, 313, 347, 354, 364`.
- **`#check @name` comparison:** a scratch copy with `#check @name` for all 31 declarations (19 theorems, 12 definitions) elaborated, and nothing changed.
  - Every H-declaration keeps `[NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]`.
  - The three separable-predual theorems keep `[SeparableSpace H]`, and the two uniqueness theorems also keep `[SeparableSpace K]`.
  - `tomiyama` keeps `[PartialOrder A] [StarOrderedRing A]`, `dye` keeps `¬HasTypeITwoSummand M`, and `exists_injective_nondegenerate_representation_lp` keeps `[Nontrivial A]`.
  - Each type matches its README statement.
  - The `signatures.md` entries `are` and `and` are parser artifacts of docstring words.
- **One-tactic probe:** with each `sorry` replaced by `first | rfl | infer_instance | simp | aesop | trivial`, all 19 sites fail, so none of them is padding.
- No `VonNeumannAlgebra → WStarAlgebra` instance exists at the Mathlib pin (only the TODO, `Analysis/VonNeumannAlgebra/Basic.lean:64`), so `exists_predual` is not one `exact` away.

**Library declarations opened.**
- **Mathlib at the branch pin:**
  - `WStarAlgebra` (`Analysis/VonNeumannAlgebra/Basic.lean:45`) and `VonNeumannAlgebra` (`:67`).
  - `ContinuousLinearMap.toPointwiseConvergenceCLM` (`Topology/Algebra/Module/Spaces/PointwiseConvergenceCLM.lean:155`).
  - `IsStarNormal.commute_star_right` (`Analysis/CStarAlgebra/Fuglede.lean:177`) and `Set.Finite.isVonNBounded` (`Analysis/LocallyConvex/Bounded.lean:290`).
  - `Module.Basis.SmithNormalForm` (`LinearAlgebra/FreeModule/PID.lean:407`).
  - `IsHeckeTriple` (`NumberTheory/HeckeRing/Defs.lean:75`) and `HeckeRing` (`:189`).
  - The Hölder `HSMul` on `Lp` (`MeasureTheory/Function/Holder.lean:183`). No ring structure on `Lp` for p=∞ exists at either Mathlib pin, which confirms the docstring's abelian-classification claim.
- **Tau Ceti `a91d3aaf`:**
  - `InnerRegular.lean:51, :82` and `Integrated/Basic.lean:141`.
  - `StronglyContinuous.lean:283`, `Uniqueness.lean:263` (`FiniteMeasure.ext_of_forall_pontryaginMeasureTransform_eq_of_innerRegular`), `FiniteMeasureExt.lean:263` and `DualEval.lean:29`.
  - `HeckeRing/One.lean:123`, the ring structure being Tau Ceti's as the README says.
  - `Chebotarev/PrimeCounting/PrimesCongruent.lean:50, 63` and `ArithmeticDirichletSeries/Counting.lean:654`.
- **Tau Ceti `2fd255d`:** the 17 names listed in R03, `HeckeRing/Multiplication.lean:109, 138`, and the same Chebotarev lines.
- **Name sweep:** 176 backticked Lean-like names in the README. Every Mathlib and Tau Ceti name resolves at the branch pins, except the 17 names of R03, which resolve at main's pins.

**Cross-roadmap citations resolved on main `b3d628f`.**
- All 25 relative links and their 9 anchors resolve, including the Completed paths and the BanachAlgebras and AmenableGroups anchors.
- PD-A36, A45, B23, B24 and B36 exist, as do OI-B23 and OI-B29–B41.
- Consumers confirmed:
  - SelfAdjointSpectralTheory SA-B85 (`:255`);
  - CStarAlgebras (`:40`, `:119`, `:186`);
  - TypeAHeckeAlgebras H3 (`:366`);
  - FactorRigidity (`:87`);
  - NoncommutativeIntegration (`:4`, `:28`);
  - Subfactors (`:4`, `:46`).
- **Dropped id V11.FourierUniqueness.** It is cited by the OperatorAlgebraDynamics revision #1137 (`README.md:178, 458, 473, 2052`, "the Plancherel paragraph that follows V11.FourierUniqueness"). This head maps it at `:311–316` to V11.FourierInversion and to the BanachAlgebras and Tau Ceti owners, so no finding.
- **Ownership against open pull requests.** I searched by object for bicommutant, Kaplansky, Tomita, Connes cocycles, flow of weights, injective factors, coupling constant, index, Dye and Mackey–Gleason.
  - The QuantumGroups revision #1649 (head `cc02cfc`) restates V1's bicommutant and Kaplansky theorems and V11's full-left-Hilbert-algebra Tomita theorem (its `README.md:172–178`, `:373–384`) and cites this roadmap 0 times.
  - Main's QuantumGroups (`README.md:40`) and the revision #1705 (head `c5e5bfa`, 26 citations) consume them from here instead. This roadmap, on main, is the owner; #1649's own review should repoint it, and no change is needed here.
  - CategoricalOperatorAlgebras, OperatorKTheory, CStarClassification and NoncommutativeGeometry use Murray–von Neumann equivalence for their own carriers (matrix projections, bicommutant categories), and none of them claims these objects.
  - AnalyticNumberTheoryPartII (#1167) consumes V10.Hecke, AffineHecke, AffineAP and AffineType by id, which is why R01 keeps the AffineAP id.

**Sources: the seeded sample 13.1 and 13.2.** Printed page = pdf page − 6 for anantharaman-popa; = pdf page for hiai-lectures and peterson-notes.
- **13.1, Tomiyama:**
  - Hiai, Theorem 6.5 (hiai-lectures line 2666, p. 55) states it for any C*-algebra and C*-subalgebra, with (ii) bimodularity and (v) complete positivity of Theorem 6.4 (lines 2596, 2602, pp. 53–54). This matches `tomiyama`.
  - Peterson, Theorem 6.2.1 (peterson-notes line 3948, p. 98) is the unital inclusion case, as cited.
- **13.1, Anantharaman–Popa Chapter 10:**
  - Definition 10.2.1 and Proposition 10.2.2(ii)–(iii) (lines 7191, 7198–7205, p. 161) give the CP-extension and "for any B(H)" forms of `IsInjective`.
- **13.2, Anantharaman–Popa Chapter 10:**
  - Proposition 10.2.5 (line 7269, p. 163).
  - Theorem 10.2.8, Powers–Størmer (line 7325, p. 164).
  - Theorem 10.2.9(2) with (10.1)–(10.2) (lines 7333–7344, pp. 164–165), which is the README's operator form.
  - Theorem 10.3.1, the projection form (10.3) with no trace clause (line 7413, p. 166). The remark at line 7405 drops (10.2) only for II₁ factors.
  - Theorem 10.3.4 (line 7532, p. 168).
- **13.2, Anantharaman–Popa Chapter 11:**
  - Definitions 11.1.1–11.1.2 and Theorem 11.1.3 (lines 7685–7702, p. 173). 11.1.3 is the finite forward direction, as the README now says.
  - Theorem 11.2.2(3) (line 8298, p. 186), which is `IsHyperfinite`.
  - Remark 11.2.3, the separable AFD definition and Corollary 11.2.4 (lines 8358–8376, p. 188).
  - §11.2 spans pp. 185–190 and §12.5 starts on p. 208 (table of contents, lines 89, 99).
- **Peterson, Theorem 6.3.8** (line 4146, p. 103): hypertrace ⟺ expectation.
- **Haagerup 1989:** p. 265 is the first page (line 52), Theorem 6.1 is p. 303 (line 1177), and §2 starts at line 152.
- **Haagerup 2016:** Theorems 1.1–1.2 (lines 49, 52, p. 2), 2.8 (284), 3.1 (313), 4.2 (635) and 5.1 (868), and Lemmas 5.4–5.6 (1109, 1347, 1540).
- **Connes–Feldman–Weiss:** Definitions 5–6 (lines 265, 281), Proposition 7 (336), Lemmas 8–9 (382, 480) and Theorem 10 (520).
- **Separability:** Hiai §1.8, p. 9 (line 328) and Peterson §2.8, p. 36 (line 1438) recall the separable-predual equivalence used at `README.md:1070–1071`.

**Adversarial pass.** All values were computed this round.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| `exists_faithful_nondegenerate_representation` | A=0; A=ℂ²; control `π(z)=diag(z,0)`, A=ℂ | K=0, π=0, span{0} dense in 0; `diag(a,b)` spans ℂ²; control injective, span `ℂ×0` not dense | holds; nondegeneracy discriminates |
| `exists_injective_nondegenerate_representation_lp` | A=ℂ; A=0; A=M₂ | `z↦z·1`; for A=0 only π=0, span{0}≠ℓ² (`[Nontrivial A]` needed); GNS of tr/2 is 4-dimensional, ×ℕ ≅ ℓ² | holds |
| `double_commutant_iff_isClosed_image_ofCLM` | ℂI; finite rank + scalars on ℓ²; H=0 | ℂI''=ℂI, closed; A''=B(ℓ²)≠A and A not WOT closed (both sides false); H=0 both true | holds |
| `closure_unitBall_eq_unitBall_double_centralizer` | ℂI; finite rank + scalars, q=even projection | `{|c|≤1}·I` both sides; `qPₙ→q` SOT, `‖q−(c+F)‖≥max(|1−c|,|c|)≥½` | holds |
| `closure_isStarProjection_eq_positive_contractions` | H=ℂ; ℓ², C=½ | `{0,1}∌½` (hypothesis needed); block `[[½,½],[½,½]]`: eigenvalues 1, 0, compression ½ | holds |
| `exists_predual`, `exists_vonNeumannAlgebra_starAlgEquiv` | ℂI on ℂ; B(ℂⁿ); H=0; M=ℂ² | X=ℂ with `z↦z̄`; X=conj S₁(ℂⁿ); X=0; `diag` on ℂ² | holds |
| `isCyclic_iff_isSeparating_commutant` | M₂ on ℂ²; diagonal; H=0 | e₁ cyclic for M₂ and separating for ℂI; (1,1) both, (1,0) neither (`diag(0,1)(1,0)=0`); 0 both on H=0 | holds |
| `equivalent_of_subequivalent` | B(ℓ²), p=1, `q=1−e₀e₀*` | `S*S=1`, `SS*=q`; `q≼1` via v=q; p∼q with p≠q | holds |
| `tracialState_unique` | M₂; ℂ⊕ℂ; B(ℓ²) | `τ(e₁₁)=τ(e₂₂)`, so `τ=tr/2`, and `x₁₁` fails (1 vs 0); `t·pr₁+(1−t)pr₂` all tracial (factor needed); `τ(1)=2τ(1)`, so none | holds |
| `exists_faithful_tracialState` (R02) | R; M₂; B(ℓ²); ultrafilter state | R: τ faithful; M₂: e₁₁ has no proper subprojection (excluded); B(ℓ²): S not unitary (excluded); normality is statable: `φ(1_{0..N})=0↛1` | holds; normality omitted (R02) |
| `isSimpleRing_of_isTypeIIOne` | R; ℂ⊕ℂ; B(ℓ²) | `qᵢ=vᵢ*pvᵢ∈I`, `Σqᵢ=1`; ideal ℂ⊕0 excluded by `IsFactor`; compacts excluded by `IsFinite` | holds |
| `IsTypeIIInfinity` | R⊗̄B(ℓ²); B(ℓ²); R; H=0 | true (`1⊗e₀₀` finite, `1⊗S` non-unitary isometry); false (e₀₀ minimal); false (finite); false (`1≠0`) | holds |
| `ergodicSMul_dense_subgroup` | ℚ⊂ℝ; ℤ⊂ℝ | ℚ ergodic; `⋃[n,n+½)` ℤ-invariant, neither null nor conull (density needed); `G=⋃γK` σ-compact | holds |
| `HasTypeITwoSummand` | M₂; M₂⊕M₃; M₃; M₄; ℂ²; R | true (e₁₁, e₂₂); true (z=1⊕0); false (`2·rank e=3`); false (`eM₄e≅M₂`); false (`e=v*v=vv*=f`); false | holds |
| `exists_unique_extension_of_finitelyAdditive` | M=ℂ; M₃, `μ=Tr(diag(1,−1,0)·)`; M₂ Bloch; H=0 | `μ(0)=2μ(0)=0`, `φ(z)=zμ(1)`; C=1, ‖φ‖=2≤4C; `f=¾` vs affine fit `½+1/(4√2)=0.677` (M₂ excluded); φ=0 | holds |
| `dye` | ℂ² swap; M₃ transpose; M₂ Bloch map; H=0 | `(a,b)↦(b,a)`; `(e₁₂e₂₁)ᵀ=e₁₁≠e₂₂`, Jordan only; image inner product −3/5 (excluded); P={0} ⇒ N=0 | holds |
| `tomiyama` (13.1) | diagonal E on M₂; `e₁₁·e₁₁`; transpose; A=0 | `axb=[[10,28],[45,84]]`, `E=diag(10,84)=aE(x)b`; ‖P‖=1 with P(1)=e₁₁; transpose fails fixing (`e₁₂↦e₂₁`); A=0 has ‖P‖=0, so vacuous | holds |
| 13.1 Checks | transpose ⊗ id; state extension | flip eigenvalue −1; `ρ=[[½,c],[c̄,½]]≥0` iff `|c|≤½` | holds |
| `IsInjective` | H=0; B(ℓ²); ℓ∞; L(F₂) | P=0, ‖P‖=0≤1; P=id; diagonal expectation; `W(a)⊔aW(a⁻¹)`, masses sum to 2>1, so no hypertrace | holds |
| `IsHyperfinite` | R; B(ℓ²); L∞[0,1]; ℓ∞(I), `|I|>𝔠` | `M_(2ⁿ)`; `Mₙ⊕ℂ`; dyadic `ℓ∞(2ⁿ)`; countably generated W* has ≤𝔠 projections vs `2^|I|` | holds |
| `isInjective_iff_isHyperfinite` (R04) | H=0; ℂ1 on ℓ²; L(F₂) | both true (P=0; Aₙ=⊤); `P(x)=⟨e₀,xe₀⟩1` and `(ℂ1)''=ℂ1`; both false | holds; locator wrong (R04) |
| II₁ and II∞ uniqueness (13.2) | R vs L(S_∞); M₂; R⊗̄B(ℓ²); B(ℓ²) | both ≅R (Thm 11.2.2); M₂ fails no-atom; II∞ via Cor. 11.2.4; B(ℓ²) fails no-atom | holds |
| Følner Checks (13.2) | ℂ², `τ=(a+2b)/3`, u=(1,−1), ε=1/10 | `‖[u,P]‖₂²=8|α|²|β|²≤1/100` ⇒ `|α|²≤0.0012516` or `≥0.9987484`; P=1 gives ½; all ≠⅓±1/10; `T=diag(3^(−½),(⅔)^½)`: `Tr T²=1`, `Tr(xT²)=τ(x)`; T=e₁₁ gives 1≠⅓ | holds |
| Semidiscreteness Checks (13.2) | ℓ∞ truncations; `E_n1_[0,1/3]` | ‖x−truncation‖=1 for x=(1,1,…); value `frac(2ⁿ/3)∈{⅓,⅔}`, ‖·‖∞≥⅓, ‖·‖₁≤2⁻ⁿ | holds |
| V13b.SpatialNorm Checks | u; 1⊗1; (0,ℂ,id); C(X); ℂ² on ℂ³ | `u*u` rank 2, ‖u‖=1 vs 2; 1 vs `√2·√2`; 0 vs 1; `sup|f(x)−f(y)|=1`; both projections of norm 1 | holds |
| Bicentralizer Checks | `h=diag(⅔,⅓)` | `(e₁₂φ)(e₂₁)=φ(e₂₂)=⅓`, `(φe₁₂)(e₂₁)=⅔`; `B(M,φ)=D`; `B(M,τ)=Z(M)` | holds |
| Amenable-relation and full-group Checks | odometer; rotation; Bernoulli F₂ | `d(T,Tₙ)=2⁻ⁿ`; `d(R_(nα),id)=1`; L(F₂) not injective, so not amenable | holds |
| V7.Index Checks | `M₂` (tr/2); `N⊗̄M₂⊃N⊗1`; restriction law | dim ℂ²=½ (unnormalized trace gives 1); index 4 (defining module gives 2); `2=4·½` (√4 would give 1) | holds |
| V10 Checks | `h=diag(⅔,⅓)`; `h=[[½,⅙],[⅙,½]]`; KMS | `he₂₁h^(−½)=6^(−½)e₂₁` vs `(⅔)^½e₂₁`; `h⁻¹=[[9/4,−3/4],[−3/4,9/4]]`, `β₁(e₁₁)=[[9/8,−3/8],[3/8,−1/8]]`, adjoint `=β₋₁(e₁₁)`; `F(t+i)=⅓2^(it)` | holds |
| V8.RegularL2 Checks | ℤ, `δ₋₁+iδ₀+δ₁`; `h_ε*1_[0,1]`; affine group | `sup|2cosθ+i|=√5<3`; error ε/3 (ε≤½), 5/12 at ε=1; `c(α,β)=α` from Jacobian α | holds |
| V11 Checks | ℤ, 𝕋, ℝ | `|zⁿ−1|<ε<2` ∀z forces n=0; `∫(sin(t/2)/(t/2))²dt/(2π)=1`; dual Haar of ℤ mass 1 (arc length gives 2πf(n)) | holds |
| V10.AffineAP (R01) | d=4, a₀=3; d=1 | Tau Ceti `tendsto_primeCount_primesCongruent 4 3`: 1/φ(4)=½ = README `1/ϕ(d)`; d=1 limit 1 | duplicated (R01) |
| Type decomposition (R02) | M₂; R; R⊗̄B(ℓ²); H=0 | z=(1,0,0,0), (0,1,0,0), (0,0,1,0); all zero; scratch statement elaborates | statable (R02) |
| Layer 2 `ι_M` normality (R05) | N=ℂ; N=0 | identity; zero map, both ultraweakly continuous | forward use (R05) |

## Not verifiable

- **Arveson 1969, Theorem 1.2.3; Haagerup 1985; Haagerup 1987; Connes–Størmer 1978:** settled as uncertified, with no legal full text in the cache.
- **Tomiyama 1957, Theorem 1:** the cached text recorded for `tomiyama-1957` is a Project Euclid "Request unsuccessful" page (lines 1–5), not the paper.
- **Paywalled books, not in the manifest:**
  - Takesaki I, IV.4.9;
  - Takesaki III, XV.3, XVI.1.9 and 1.22–1.23, XVII.3.12 and XVIII;
  - Runde, 6.4.14 and 6.4.24–6.4.25.
- **Connes–Woods 1985 §7:** paywalled.
- **Connes, *Periodic automorphisms*:** an image-only scan, and OCR is not installed on this worker.
- **Ownership:** open pull requests outside the index of 2026-11-08T18:34:22Z were not searched.

## Source issues

- **Misprint** in anantharaman-popa at the Notes to Chapter 10, p. 171: the source says hyperfiniteness is weaker than Property (P); it should say hyperfiniteness implies Property (P), as its Exercise 10.10(i) shows; affects nothing.
- **Misprint** in anantharaman-popa at Definition 10.2.1, p. 161: the source writes "a von Neumann M" without "algebra"; it should read "a von Neumann algebra M"; affects nothing.
- **Misprint** in anantharaman-popa at the sentence before Theorem 10.2.7, p. 164: the source writes "we need it the original Powers–Størmer inequality"; it should read "we need is the original Powers–Størmer inequality"; affects nothing.
- **Gap** in anantharaman-popa at Theorem 11.1.3, p. 173: the source proves it only for separable algebras with a faithful normal trace and leaves the general finite case to Exercise 11.1; it should prove or reference that reduction; affects the proof.
- **Gap** in hiai-lectures at Theorem 6.5, pp. 55–56: the source states Tomiyama's theorem for any C*-algebra and C*-subalgebra but proves only a unital von Neumann subalgebra; it should give the bidual reduction for the general case; affects the proof.
