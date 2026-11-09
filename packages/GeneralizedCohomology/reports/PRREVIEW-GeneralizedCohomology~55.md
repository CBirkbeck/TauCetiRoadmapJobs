# Review of GeneralizedCohomology (pull request #1854 at f28d376)

**Verdict:** needs changes

The push gate fails on this head: `outside-folder` lists 2 files (R10). Every other gate check passes, and so does the dependency check. Three findings are blocking (P2): R01–R03.

## R01 (P2) — The Kan–Quillen model structure is statable at the pins but is not stated

**Location.** `TauCetiRoadmap/GeneralizedCohomology/Suggested.lean` lines 24–27 list it as not statable: "Mathlib has the generating classes `SSet.modelCategoryQuillen.I` and `J` with their cofibrations and fibrations, but no class of weak equivalences of simplicial sets and no `ModelCategory SSet`". README lines 184–186 say the same and add "G2.1 builds them".

**Claim.** The reason given is false at the Tau Ceti pin.
- Tau Ceti supplies the Kan–Quillen weak equivalences: realization-defined weak homotopy equivalences, given as a scoped `CategoryWithWeakEquivalences SSet` instance.
- The instance lives in the same `SSet.modelCategoryQuillen` scope as Mathlib's scoped cofibrations and fibrations.
- So the model axioms are statable propositions, and so is the unit of realization ⊣ Sing. These axioms are the content of G2.1's headline.

**Witness.**
- The instance: `SSet.modelCategoryQuillen.instCategoryWithWeakEquivalences` (`TauCeti/AlgebraicTopology/SimplicialSet/WeakEquivalence.lean:60`), with `weakEquivalence_iff` at line 71.
- A scratch file with the four statements below elaborates with `sorry` warnings only.
- `first | infer_instance | simp | rfl | exact?` closes none of them.

**Repair.**
1. **Import and scope.** Import `TauCeti.AlgebraicTopology.SimplicialSet.WeakEquivalence` and open `HomotopicalAlgebra` and `scoped SSet.modelCategoryQuillen`.
2. **State the headlines**, each with a docstring and the Quillen locator (Quillen, *Homotopical Algebra*, Chapter II, Section 3):

```lean
theorem kanQuillen_hasLiftingProperty_of_trivialCofibration {A B X Y : SSet.{u}}
    (i : A ⟶ B) (p : X ⟶ Y) [Cofibration i] [WeakEquivalence i] [Fibration p] :
    HasLiftingProperty i p := by
  sorry
theorem kanQuillen_hasLiftingProperty_of_trivialFibration {A B X Y : SSet.{u}}
    (i : A ⟶ B) (p : X ⟶ Y) [Cofibration i] [Fibration p] [WeakEquivalence p] :
    HasLiftingProperty i p := by
  sorry
theorem kanQuillen_hasFactorization :
    MorphismProperty.HasFactorization (trivialCofibrations SSet.{u}) (fibrations SSet.{u}) := by
  sorry
theorem sSetTopAdj_unit_weakEquivalence (X : SSet.{u}) :
    WeakEquivalence (sSetTopAdj.unit.app X) := by
  sorry
```

3. **Docstring.** Move the Kan–Quillen bullet from the not-statable list to the stated list.
4. **README.** Rewrite lines 184–186 to consume Tau Ceti's class rather than build one, and add the Kan–Quillen structure to the Summary's list of headline theorems.

## R02 (P2) — The README plans objects that the pinned Mathlib and Tau Ceti already provide

**Location and witness.** Three README passages plan constructions that exist at the pins.

**1. G2.1, line 547.** "Define a simplicial weak equivalence to mean that its realization induces a bijection on path components and isomorphisms on all based homotopy groups".
- Tau Ceti already defines exactly this class (R01).
- It also gives two out of three and retract stability for it (`SimplicialSet/WeakEquivalence.lean:76–86`).
- It has `TauCeti.TopCat.weakEquivalences` (`Topology/Category/TopCat/WeakEquivalence.lean:50`).
- It has the trivial-fibration characterization `SSet.rlp_monomorphisms_iff` (`SimplicialSet/TrivialFibration.lean`).

**2. G2.11, lines 1168–1170.** "Construct the simplex Reedy structure from native simplex epi/mono factorization, following the design of [`SimplexCategory.reedyStructure`](…)".
- That declaration is native at the Mathlib pin: `Mathlib/AlgebraicTopology/Reedy/SimplexCategory.lean:42`.
- The link points to another Mathlib commit, not the pin.

**3. G5.5-RealHilbert, lines 3322–3330 and 3394–3410.** These lines construct three things:
- `RealHilbertComplexification H` with the inner product `⟨x+iy,x′+iy′⟩=(x,x′)+(y,y′)+i((x,y′)−(y,x′))`;
- the complexification of bounded maps, with adjoints and operator-norm equality;
- `realHilbertContinuousFunctionalCalculus` on `H→L[ℝ]H`, and a global `realHilbertOperatorStarOrderedRing` instance.

The Tau Ceti pin has all three:
- the L² complexification `WithLp 2 (TauCeti.Complexification X)` with that inner product, kept off the Taylor carrier (`Analysis/InnerProductSpace/Complexification.lean`, module docstring);
- `ContinuousLinearMap.complexifyL2` (:201) and the isometric ⋆-embedding `complexifyL2StarAlgHom` (:307);
- `ContinuousLinearMap.instContinuousFunctionalCalculusRealIsSelfAdjoint` (`Analysis/InnerProductSpace/ContinuousFunctionalCalculus.lean:89`), with `complexifyL2_cfc` (:108) and `spectrum_complexifyL2`;
- `instStarOrderedRingRCLike`, registered as an instance at line 225.

**Claim.** What the pins state is cited, not planned again. Two of the README's own "From …" contracts are also wrong:
- "From Mathlib" says Mathlib lacks the weak equivalences.
- "From Tau Ceti" names neither the SSet weak equivalences nor the real-Hilbert calculus.

**Repair.**
1. **G2.1.** Consume `SSet.modelCategoryQuillen.instCategoryWithWeakEquivalences` and `TauCeti.TopCat.weakEquivalences`. Keep as targets only the lifting and factorization axioms and the Quillen equivalence.
2. **G2.11.** Replace "Construct the simplex Reedy structure …" by "Use native `SimplexCategory.reedyStructure`".
3. **G5.5-RealHilbert.** Delete the construction of the complexification, its operator transport, the real CFC and the star-order instance. Consume the Tau Ceti declarations above. Keep the closed (`LinearPMap`) descent and the finite-Clifford module items, which the pins lack.
4. **Contracts.** Add all of these to "From Tau Ceti" and "From Mathlib".
5. **Downstream note.** The SpinGeometry bullet under Downstream consumers should then say that SpinGeometry takes the bounded real calculus from Tau Ceti.

## R03 (P2) — The realization-product comparison is handed in opposite directions by this head and AlgebraicTopology at #1652

**Location.** README lines 77–80 ("The realization product comparison is AlgebraicTopology Stage 4.5's single simplicial-realization product comparison") and the moved-identifier line "G2.1 realizationProductKelleyComparison → AlgebraicTopology Stage 4.5". Also line 558 ("Consume AlgebraicTopology Stage 4.5's simplicial-realization product comparison").

**Claim.** This roadmap names AlgebraicTopology as the owner. The open AlgebraicTopology revision #1652 names this roadmap as the owner and consumes it from here. If #1652 merges after this pull request without a rebase, the comparison has no owner.

**Witness.** `TauCetiRoadmap/AlgebraicTopology/README.md` at #1652:
- lines 170–171: "GeneralizedCohomology G2.1 owns the simplicial-realization product comparison";
- lines 3830–3831: "Consume GeneralizedCohomology G2.1's foundational `realizationProductKelleyComparison`".

**Repair.**
- Keep AlgebraicTopology as the owner, as this head and this pull request's AlgebraicTopology copy (its lines 151–155) do.
- Name #1652 in the merge-order paragraph, and state that #1652 is rebased on this pull request.
- After that rebase, #1652's compact-generation layer owns the comparison and its §8.10 consumes it from there. Its line 165 puts that layer at Layer 4.8, not G2.1.

## R04 (P3) — Build order: G2.9 and G4.0a depend on each other, and several *Needs:* lines omit what their text uses

**Location.**
- **G2.9 → G4.0a.** Line 952, G2.9's *Needs:*: "…; G4.0a; …".
- **G4.0a → G2.9.** Line 2329, G4.0a: "Compare its Sp(r) frame classifier with CC C1.1b's join carrier via G2.9's general-topological extension". The Dependencies paragraph at line 4044 says "G4.0a … precedes G2.9's computations".

**Claim.**
- **The loop.** Each subsection consumes the other, so the build has a Layer 2 ↔ Layer 4 loop. One *Needs:* line covers G2.9's general classifier, which precedes G4.0a, and its GL_k(ℝ) table, which follows it.
- **Incomplete *Needs:* lines.**
  - G4.0 (line 2513) omits G2.9, CharacteristicClasses C1.1b, AlgebraicTopology Stages 2.5 and 4.4, SpinRepresentations Layer 7 and SpinGeometry G4.1, all of which its text uses.
  - G5.0 (line 2903) omits G3.10, G4.0a, G4.5, SpinGeometry G4.1, the GeometricTopology smoothing item and AlgebraicTopology 4.5. Its "CharacteristicClasses' Spin obstruction" names no section.
- **Unlisted supplier.** G5.7 (line 3977) uses "DG12.1", but DifferentialGeometry appears neither among the supplier contracts nor in G5.7's *Needs:*.
- **Stale layer.** The GeometricTopology contract (line 337) puts "the smoothing-and-triangulation comparison" in Layer 1.

**Witness.** GeometricTopology on main, README lines 776–778, maps the old anchor `#the-smoothing-and-triangulation-comparison-far-horizon`, item 1 (smooth implies PL), to **Layer 11.3**. DifferentialGeometry on main has "12.1 Metrics" at line 915.

**Repair.**
1. **Split G2.9.** G2.9 keeps the general classifiers, the gauge and clutching comparisons and the low-rank negative controls. Move the GL_k(ℝ) homotopy table, the semidirect products and the stabilization maps into a new subsection after G4.0a (e.g. 4.0c). Its *Needs:* line is G2.9, G4.0a, SmoothBundlesConnections B1.4 and LieGroups Layer 2.
2. **Remove the loop.** Delete G4.0a from G2.9's *Needs:* line.
3. **Complete the *Needs:* lines** of G4.0, G5.0 and G5.7 with the items listed above.
4. **Add a contract** "From TauCetiRoadmap.DifferentialGeometry: 12.1 metrics (`nonempty_contMDiffRiemannianMetric`)".
5. **Repoint** the smoothing-and-triangulation citations (lines 337–339, 2783, 3914) to GeometricTopology Layer 11.3.
6. **Rerun the dependency check.**

## R05 (P3) — Twelve of the fifteen sampled targets carry no source locator; two locators are TeX labels; one drops the source's hypotheses

**Location.**
- **No locator at the claim:** G1.5, G1.6, G1.7, G2.8, G2.9, G3.6, G3.7, G3.8, G3.10, G4.1, G4.2 and G5.5. G2.3 cites a source only in a Check, not for the stable model structure itself.
- **TeX labels:** line 1351 "(HTT's weakcompatequiv)" and line 1469 "(HTT spek3–spek5)".
- **Dropped hypotheses:** line 2574 cites Cohen Theorem 10.40, p. 330, for every E and every base.

**Claim.**
- Every theorem needs a locator at the claim.
- `weakcompatequiv` and `spek3`–`spek5` are labels from Lurie's TeX source and appear nowhere in the book.
- Cohen's Theorem 10.40 assumes a **connective** ring spectrum and a **connected** base, and Cohen's E-orientation (Definition 10.27) also assumes E connective. G4.5 and G5.5 apply the Thom isomorphism to KU and KO, which are not connective.

**Witness.**
- CohenBMH lines 11933–11934 state 10.40 for "a connective ring spectrum" over "a connected space"; line 11916 gives Definition 10.27. π₋₂KU = ℤ ≠ 0, so KU is not connective.
- LurieHTT contains neither label. The marked tensor comparison is Proposition 3.2.1.13 with Corollary 3.2.1.15 (LurieHTT lines 8420 and 9134). The weak-compatibility criterion is Proposition A.3.1.10 (LurieHTT lines 39789 and 9138).

**Repair.**
1. **Locators I checked**:
   - G2.3: HSS Theorem 3.4.4, p. 35 (HSS line 1635);
   - G3.8: Lurie, *Higher Algebra*, Proposition 1.4.3.6, whose part (3) gives left and right completeness, the two convergence statements (LurieHA line 5707);
   - G4.1: Hatcher, *Algebraic Topology*, Theorem 4D.1, p. 432 (HatcherAT line 18645), for ordinary cohomology, and Hatcher, *Vector Bundles and K-Theory*, Theorem 2.25, p. 72 (HatcherVBKT line 2673), for K-theory;
   - G2.8's bipermutative input: Elmendorf–Mandell Theorem 3.7 (ElmendorfMandell line 612).
2. **Other uncited claims.** Give each its own locator: G1.5–G1.7, G2.9, G3.6, G3.7, G3.10, G4.2 and G5.5. G4.1's general E and G4.3's non-connective E need either a source stating them, or a sentence saying the theorem extends the cited special case along the cited proof.
3. **Replace the TeX labels** by "HTT Proposition 3.2.1.13 and Corollary 3.2.1.15" and "HTT Proposition A.3.1.10".
4. **G4.3.** State Cohen 10.40's connective and connected hypotheses at the locator. Then add the general statement for arbitrary ring spectra and arbitrary CW-type bases as this roadmap's extension. Cohen's proof (CohenBMH line 11931–11932: "follows the proof of Theorem 6.10 at every step") is a Mayer–Vietoris induction that does not use connectivity.

## R06 (P3) — Two Checks are false

**Check 1: the SO(1) map.**
- **Location.** Line 959 (G2.9): "The first-column map SO(1) → S⁰ has image {e₀} only and is not a fibration onto S⁰".
- **Claim.** Every map into a discrete space is a Hurewicz fibration, this one included. Its fibre over −e₀ is empty.
- **Witness.** A homotopy H : Y×I → S⁰ with H(y,0) = e₀ is constant in t, since I is connected. So H̃(y,t) = f̃(y) lifts it.
- **Repair.** "The first-column map SO(1) → S⁰ is not surjective, so it is not a principal SO(0)-bundle over S⁰ (as a map into a discrete space it is a Hurewicz fibration with empty fibre over −e₀); the principal sphere fibrations start at k = 2."

**Check 2: the operator classifier at n = 0.**
- **Location.** Line 3674 (G5.5): "For n = 0 the operator classifier has the zero homomorphism as basepoint and represents KO⁰ of a point, ℤ."
- **Claim.** In the K_op,n notation, the README fixes K_op,0 = S⁰ (lines 3301 and 3517–3518). The KO⁰ classifier is the zero-signature mixed classifier on the ample universe.
- **Witness.** K_op,0 consists of the graded ⋆-homomorphisms C₀(ℝ) → 𝕜, with H₀ = L²(ℝ⁰) = 𝕜 even. These are 0 and evaluation at 0, so π₀K_op,0 has two points, not ℤ.
- **Repair.** "For p = q = 0 the mixed classifier realMixedCliffordOperatorClassifier 0 0, on the ample universe with both parities, has π₀ = KO⁰(*) = ℤ, whereas K_op,0 = S⁰ = {0, ev₀} has two components; the classifier needs the ample universe."

## R07 (P3) — Checks that do not discriminate, and definitions without Checks

**G1.6 (line 505).** The only Check takes p = 0, where `(−1)^p = 1`, so the unsigned rule `δ(i*a∪b) = a∪δb` passes it too.

Add a p = 1 Check, computed in ordinary cohomology from the cochain rule d(φ∪ψ) = dφ∪ψ + (−1)^p φ∪dψ (Hatcher, *Algebraic Topology*, Lemma 3.6; HatcherAT line 8935):
- On (S¹×D¹, S¹×S⁰), take a = α×1 with α the generator of H¹(S¹), and let b be 1 on S¹×{1} and 0 on S¹×{−1}.
- Then δb = 1×θ and δ(i*a∪b) = −α×θ = (−1)¹a∪δb in H²(S¹×(D¹,S⁰)) ≅ ℤ.
- The unsigned rule predicts +α×θ.

**G5.5 (line 3673).** "`pq + (p+q)r` and `qr + p(q+r)` both equal pq + pr + qr" is an identity of integers, so any sign rule passes it.

Replace it with a computed sign:
- In Cl₁⊗̂Cl₁, (e⊗1)(1⊗e) = e⊗e and (1⊗e)(e⊗1) = −e⊗e.
- The swapped reduction sends e⊗e to e₂e₁ = diag(i, −i) in the line-3273 matrix model.
- The unswapped reduction sends it to e₁e₂ = diag(−i, i). They differ by (−1)^(pq) = −1 at p = q = 1.

**G3.8 (line 2172).** "τ_(≥k)E → E is an isomorphism on π_n for n ≥ k and π_n τ_(≥k)E = 0 for n < k" restates the definition.

Replace it with: "`τ_(<1)S ≃ HZ`, with S → τ_(<1)S the unit and π₀ = ℤ; an off-by-one truncation τ_(≤1) would keep π₁S = ℤ/2."

**G3.10.** It defines the nonabelian lim¹ orbit set and has no Checks. Add three:
- **Constant tower.** For a constant tower of groups, lim¹ is a point.
- **Surjections.** For a tower of surjections, lim¹ is a point.
- **Abelian tower.** For the abelian tower ℤ ←×2 ℤ ←×2 ⋯, the action becomes h ↦ h + (1−shift)g. The orbit set is then coker(1−shift) = ℤ₂/ℤ ≠ 0.

## R08 (P3) — The README is not in the required definition shape

**Location.**
- **No API bullets.** No definition in the README has an API bullet list: `grep '^\*\*API'` finds none.
- **Section sizes.** Four subsections each carry one *Needs:* line:

  | Subsection | Lines | `Define`/`Construct` | Checks |
  | --- | --- | --- | --- |
  | G2.11 | 852 | 68 | 3 |
  | G5.5 | 542 | 24 | 3 |
  | G5.7 | 307 | 21 | 2 |
  | G4.0 | 263 | 13 | 4 |

- **No Checks at all.** G3.5, G3.7 and G3.10 have none.

**Claim.** Each definition lists its API as prose bullets and at least three discriminating Checks, and each target has its own *Needs:* line.
- **G2.11's definitions.** These include the Bergner model, categorical equivalences, the Joyal model, marked models, Cat∞, stable ∞-categories, ∞-operads, LM^⊗, C/D and Ind_κ. All of them share the three Checks at lines 1862–1864, and those three concern only nerves, cores and equivalence edges.

**Repair.**
1. **Split the large subsections.** Split G2.11 into `### 2.11.k` subsections, one per model or object (Bergner, unmarked straightening, Joyal, marked straightening, coherent diagrams and Sp∞, Kan extensions, ∞-operads and LM, quotients and Ind, relative adjoints). Split G5.5 (orientation table, MU→HZ, ABS, operator classifiers, finite-Clifford modules) and G5.7 the same way.
2. **Fill each new subsection.** Give each an API bullet list, at least three Checks and its own *Needs:* line. Example Checks for the Joyal model:
   - Δ[0] ⊔ Δ[0] → Δ[1] is a monomorphism but not a categorical equivalence;
   - the nerve of the walking isomorphism is categorically equivalent to Δ[0];
   - Λ²₁ → Δ[2] is a trivial cofibration.

## R09 (P3) — The k ≤ 1 clause of the unstable rational Hurewicz statement is false at k = 0

**Location.**
- `Suggested.lean` line 107: "For `k ≤ 1` only the degree-one surjectivity is asserted."
- README line 3712: "for k≤1 only the degree-one surjectivity of the Hurewicz theorem remains".

**Claim.** At k = 0 the hypothesis is empty and degree-one surjectivity fails. The Lean statement asserts nothing at k = 0, because `2*0 - 1 = 0` and `n + 1 ≤ 0` is false. So the Lean is right and the prose is wrong.

**Witness.** X = pt ⊔ S¹ with x = pt: π₁(X, x) = 1, while H₁(X;ℚ) = ℚ.

**Repair.** In both places write: "For k = 1 only the degree-one surjectivity is asserted, and for k = 0 nothing is." Add X = pt ⊔ S¹ as a negative-control Check in G5.6.

## R10 (P3) — Edits outside the pull request's named folders (gate `outside-folder`)

**Location.** `Completed/ArithmeticDirichletSeries/README.md` (one line, line 331) and `TauCetiRoadmap/SymplecticGeometry/README.md` (three lines, 76–78).

**Claim.** The brief does not name either folder among the pull request's own, so the gate fails. This re-raises R14 of the previous review: no repair report marks it not actionable.

**Witness.** The worker's gate: `outside-folder=2 … FAIL`. `git diff --stat origin/main...HEAD`, with the named folders excluded, lists exactly these two files.

**Repair.** Move the two loop-cut sentences to pull requests of their own, or add both folders to the pull request's named folders. Then rerun the gate.

## R11 (P3) — No stated order with #1187, whose head conflicts in this folder

**Location.** The merge-order paragraph of the pull request description names #1101, #1807 and #1808 only.

**Claim.** #1187 (the Tau Ceti bump) changes `TauCetiRoadmap/GeneralizedCohomology/Suggested.lean` and conflicts with this head. Its copy is the old 25-sub-import file.

**Witness.** The overlap check: "#1187 and #1854 conflict in … `TauCetiRoadmap/GeneralizedCohomology/Suggested.lean`". At #1187, `Suggested.lean` opens with `import Mathlib.Topology.Homotopy.HomotopyGroup`.

**Repair.** Add #1187 to the merge-order paragraph and state that #1187 rebases on this pull request, taking this head's `Suggested.lean`.

## Verified sound

### Repair status of the previous review (head a7b81af)

| Previous | Status at f28d376 | Passage or evidence |
| --- | --- | --- |
| R01 cycle and upward suppliers | repaired | Dependency check: "depcheck: 236 roadmaps, 2292 edges, 0 problem(s)". HomotopySpheres and OperatorKTheory are no longer cited. StringOrientation and TangentialBordism appear only as consumers (Downstream consumers, lines 4060 and 4066). |
| R02 sorry'd data | repaired | gate `sorry-data=0`; `Suggested.lean` has 4 theorems and no `def`. |
| R03 `set_option` | repaired | gate `set_option=0` |
| R04 no headline | partly | Four headlines are stated, and the docstring names the ones it cannot state. The Kan–Quillen headline is wrongly listed as not statable (R01). |
| R05 AlgebraicTopology names | repaired | Stage citations resolve at this head: 4.4/4.5 (AT lines 146–155, 759), 4.7/4.8 (Stage 4 items 7–8, lines 1129ff), 5.0/6.0 (lines 1181, 1465), 8.8c (2587), 8.8d (2661), 8.11b (2828). `ordinaryPairQuotientComparison` is at AT line 1045. |
| R06 two owners with HigherToposTheory | repaired on this side | Scope (line 59) claims G2.1 and G2.11, and line 4068 names HigherToposTheory as a consumer. HigherToposTheory at #1901 still claims these objects (its README lines 37–41). Under the main-first rule, that copy is #1901's to remove. |
| R07 Tau Ceti carriers | partly | The "From Tau Ceti" contract (lines 203–253) resolves at the pin: every declaration listed below. New duplications are in R02. |
| R08 moved ids | repaired | "Moved identifiers" (lines 77–103), with one line per BordismFormalGroups F6.5 paragraph and the G2.1/G2.10 names. |
| R09 padding | repaired | `first \| simp \| rfl \| infer_instance \| exact?` closes none of the 4 theorems (the stable-stem one times out). |
| R10 three locators and a link | repaired | HTT Proposition 5.2.7.12 (line 1597), A.2.6.15 (line 1402), HA Corollary 4.8.1.14 (lines 1728–1729). The SpinRepresentations path is now named by roadmap. |
| R11 README/Lean names | repaired | gate `readme-ids-missing=0`; the four Lean names appear in G2.10, G3.3 and G5.6. |
| R12 form | partly | The headings are now in the house shape. API bullets, per-target *Needs:* lines and locators are still missing (R05, R08). |
| R13 imports | repaired | `import Mathlib` plus two `TauCeti.*` modules, both used. |
| R14 outside folder | not repaired | R10 |

### Build and Lean checks
- `lake env lean` on `Suggested.lean`: 4 "declaration uses `sorry`" warnings, nothing else. The worker's targeted build passes (gate `build=0`).
- `#check @name` for all 4 declarations, elaborated in one scratch file, matches the worker's elaborated-signature list. Each type carries every binder its README statement needs, so no section variable is lost.

### Adversarial table (values computed on each side)

| Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- |
| `numerableFiberBundle_hurewicz` | ι=Unit, ρ≡1, trivial B×F | the hypothesis holds; conclusion = Tau Ceti `isHurewiczFibration_fst` | holds | none |
| same | ι empty; F = ∅ | Σρᵢ = 1 forces B = ∅, so Z = ∅; F = ∅ gives Z = ∅; lifting is vacuous | holds | none |
| same | subordinate ⇒ cover | Σρᵢ(b) = 1 ⇒ some ρᵢ(b) > 0 ⇒ b ∈ baseSet | holds | none |
| same | {0,1} → [0,1] | the fibre over ½ is empty, so no covering trivializations exist and the hypothesis fails; it is not a fibration | negative control holds | none |
| `homologyComparison` | X = ∅ | `IsAdditive` at `J = PEmpty` gives H(∅) = 0 on both sides | holds | none |
| same | X = ∨_ℕ S¹; X = CP^∞ | wedges by additivity; the infinite dimension by the telescope Mayer–Vietoris long exact sequence and the five lemma, valid in any abelian C | holds | none |
| same | f : HZ → HQ | ℤ → ℚ is not iso on a point, and H₁(S¹): ℤ → ℚ is not iso | the hypothesis is needed | none |
| `stableStem_isOfFinOrder` | (n,k) = (0,3), (1,4), (2,5) | π₄S³ = ℤ/2, π₆S⁴ = ℤ/2, π₈S⁵ = ℤ/24 | torsion | none |
| same | range edge | k+n+1 ≤ 2k−2 ⟺ k ≥ n+3. Excluded: π₃S² = ℤ (n=0, k=2) and π₇S⁴ = ℤ⊕ℤ/12 (n=2, k=4) | the hypothesis is needed | none |
| `rationalHurewicz` | S², k=2 | deg 2: ℤ → ℚ injective; deg 3: the image in H₃ = 0 spans; deg-3 kernel (η) not asserted | holds | none |
| same | S³, k=3 | deg 4: π₄ = ℤ/2, all torsion; deg 5: H₅ = 0 | holds | none |
| same | k=1, S¹∨S¹ | F₂ → H₁ = ℚ²; the image spans | holds | none |
| same | k=0, pt⊔S¹ | Lean: nothing asserted (`2*0-1 = 0`). Prose: claims deg-1 surjectivity, but π₁ = 1 and H₁ = ℚ | prose false | R09 |
| G2.1 Kan–Quillen | probe | CM4a, CM4b, CM5a and the unit elaborate; one tactic closes none | statable | R01 |
| G2.1 Checks | Δ[1]→Δ[0]; Λ²₀ with vertices 0,1,0; ∂Δ[1] | |Δ[1]| contractible; the filler needs the edge 1→0; two components | holds | none |
| G1.5 | X=Y=S¹; U=V=ℝ | H̃²(T²) = ℤ, H̃²(S¹∨S¹) = 0, collapse iso; (ℝ²)⁺ = S² = S¹∧S¹ | holds | none |
| G1.6 sign | p=0; p=1 on S¹×(D¹,S⁰) | p=0: both rules give δb. p=1: −α×θ against unsigned +α×θ | p=0 does not discriminate | R07 |
| G1.7 | KU; HF₂ | KU⁰(S¹) = ℤ⊕0, KU¹(S¹) = 0⊕ℤ; σ² = −σ² is vacuous mod 2; S¹→S² is null | holds | none |
| G2.3 Checks | λ : F₁S¹ → F₀S⁰ | level 0: * against S⁰; naive π₀ = ⊕ℤ against ℤ (HSS line 1090); [S,HZ] = ℤ against 0 | holds | none |
| G2.5 signs | m=n=2; m=3,n=2; complex n=3 | (−1)^1 = −1; (−1)^3 = −1 with 3 inversions; 3 inversions | holds | none |
| G2.8 Checks | ℕ; discrete A; 0 | special, not very special, group completion π₀ = ℤ; HA; contractible | holds | none |
| G2.9 table | k = 0…5 | GL₀ trivial; SO(2): π₁ = ℤ; SO(3): ℤ/2, π₃ = ℤ; SO(4): π₃ = ℤ²; k ≥ 5: ℤ/2, ℤ | holds | none |
| G2.9 actions | r₂; r₄; odd k | negation; factor swap; r_k = −(SO element), so inner | holds | none |
| G2.9 stabilization | π₃ | SO(3)→SO(4) q ↦ (q,q); SO(4)→SO(5) (a,b) ↦ a+b; composite ×2 | holds | none |
| G2.9 Check 4 | SO(1) → S⁰ | a map into a discrete space lifts every homotopy | Check false | R06 |
| G2.10 Checks | B×F; Möbius; {0,1}→[0,1] | ρ≡1; two arcs; no lift from 0 | holds | none |
| G3.4 tower | ×2, ×3, … | lim = 0, lim¹ = Ext(ℚ,ℤ) ≠ 0 | holds | none |
| G3.6 phantom | S_ℚ → ΣHZ | [S,ΣHZ] = 0; the constant-one class needs a₁ ≡ Σ_{j≤N} j! mod (N+1)! for all N, impossible since 0 < Σ < (N+1)! is unbounded | holds | none |
| G3.7 | X = S⁰, E = HZ, n = 0 | colim_k [S^k, K(ℤ,k)] = ℤ = HZ⁰(S⁰) reduced | holds | none |
| G3.8 | KU; HA; V = Σ⁻¹S | τ_(≥0)KU = ku with ℤ[β]; τ_(≥k)HA = HA or 0; π₁Map(Σ⁻¹S,HA) = A ≠ 0, so connectivity is needed | holds | Check 3 restates the definition (R07) |
| G3.9 | HZ, HQ | π₀HZ^∧_p = ℤ_p; HQ^∧_p ≃ 0 although ℚ⊗ℤ_p = ℚ_p | holds | none |
| G3.10 | abelian ×2 tower | the action is h + (1−shift)g; orbit set ℤ₂/ℤ | holds | add Checks (R07) |
| G4.0 calibration | e₀, e₂; u = (1+j)/√2 | u·x·u: 1↦j, i↦i, j↦−1, k↦k; −u·1·u = −j = Ψ(e₀); −u(−j)u = −1 = Ψ(e₂); q_L = u n₂ u⁻¹, q_R = u⁻¹ n₁ u | holds | none |
| G4.1 | X×CPⁿ; B = ∅; infinite B | H*(X)⊗ℤ[x]/(x^{n+1}); 0 = 0; the Milnor towers are isomorphic | holds | locator (R05) |
| G4.2 | 0_B; ε^r over a point; γ¹ over RPⁿ | B₊; S^r; RP^{n+1} | holds | none |
| G4.3 | Möbius; KU | w₁ ≠ 0 is not HZ-orientable; KU is non-connective (π₋₂ = ℤ), outside Cohen's 10.40 | the source hypothesis is dropped | R05 |
| G4.4 | TS²; odd rank | e = 2·gen; −1 on fibres gives e = −e | holds | none |
| G4.5 | Sp(1); torus | p₁ = −2c₂ = 2e^std; a_i ↦ (−1)^i e_i(x²), a₁ ↦ −Σx_j² | holds | none |
| G5.0 | π_i BSpin, w₂(−ξ) | 0,0,0,ℤ,0,0,0,ℤ; (1+w₁+w₂)⁻¹ in degree 2 is w₂+w₁² | holds | none |
| G5.2 | M = pt; Sⁿ ⊂ ℝⁿ⁺¹ | Th(−TM) = S; Σ^{−(n+1)}Σ(Sⁿ₊) = S∨S⁻ⁿ | holds | none |
| G5.4 KSp | [ℍ] = ab⁻¹ | a²b⁻¹ = 4; c: 2u²·u⁻⁴·u² = 2 | holds | none |
| G5.5 Cl₂ matrices | e₁, e₂ | e₂² = I; e₁e₂ = diag(−i,i) = −e₂e₁; odd under diag(1,−1) | holds | none |
| G5.5 classifiers | K_op,1; K_op,4; K_op,0 | KO¹ = KO₇ = 0; KO⁴ = KO₄ = ℤ; K_op,0 = {0, ev₀} | the n=0 Check is false | R06 |
| G5.5 Koszul Check | all p,q,r | an integer identity, true for every sign rule | vacuous | R07 |
| G5.6 rational | K(ℤ,3), K(ℤ,2) | Λ[x₃]; ℚ[x₂] | holds | none |

### Library declarations opened at the pins
- **Mathlib:**
  - `TopPair.HomologyPretheory`, `IsAdditive` (line 214), `HasExcisionIso` (192), `HasPairSequence` (242) and `IsExtraordinaryEilenbergSteenrod` (297), all in `AlgebraicTopology/EilenbergSteenrod.lean`;
  - `ModelCategory` (`ModelCategory/Basic.lean:43`);
  - `SSet.modelCategoryQuillen.I`/`J` and their scoped instances (`SimplicialSet/CategoryWithFibrations.lean:40,48,70,76`);
  - `sSetTopAdj` (`SingularSet.lean:74`; its TODO says the Quillen equivalence is open);
  - `SimplexCategory.reedyStructure` (`Reedy/SimplexCategory.lean:42`);
  - `instStarOrderedRingRCLike` (`InnerProductSpace/StarOrder.lean:59`).
- **Tau Ceti:**
  - `IsHurewiczFibration` (`HurewiczFibration/Basic.lean:58`) and `HomotopyGroup.hurewiczHom` (`Hurewicz/Basic.lean:652`, target `R ⟶ H_(n+1)(X;R)`);
  - the SSet and TopCat weak equivalences, `SSet.rlp_monomorphisms_iff`, and the real-Hilbert complexification and CFC files of R02;
  - `isCompact_unitaryGroup`, which is RCLike-only, so Sp(r) compactness is not at the pin;
  - every declaration that "From Tau Ceti" names, all present. These include `SymmetricSequence.sphere` (`SymmetricSpectrum.lean:82`), the wedge formula `DayFunctor.isColimitShuffleCofan`, `Mod.monoidalCategory`/`symmetricCategory`/`internalHom` (`Monoidal/Mod/Tensor.lean:121`, `Symmetric.lean:99`, `InternalHom.lean:326`), `SSet.join` (`Join/Basic.lean:358`), `SSet.Edge.IsEquivalence` and `SSet.core` (`Quasicategory/Core.lean:71,226`) and `TauCeti.PointedSSet.circle` (`Pointed/Circle.lean:115`).

### Not-statable claims of the docstring, checked
- **Stable equivalences:** absent at both pins.
- **Reduced suspension:** absent; nothing with that name, or "smash product", under Mathlib or Tau Ceti Topology.
- **Sequential spectra:** absent.
- **Cohomology pretheory:** absent. Mathlib has `HomologyPretheory` only.
- **CW wedges.** Tau Ceti's `CWType.lean` has no wedge-closure theorem, and its only CW wedge is `WedgeCircles.lean`, so the Brown reason holds. The Kan–Quillen claim is wrong (R01).

### Cross-roadmap citations resolved
- **Main:** SpinGeometry G1.3 (`cliffordScalarTrace`, line 233) and G4.1a/b (lines 397–437); HilbertModules H1–H6 (lines 126–705); CStarAlgebras C5.1–C5.3; SmoothBundlesConnections B1.4 (line 31); DifferentialGeometry 12.1 (line 915); GeometricTopology's anchor map (lines 776–778).
- **This head:** AlgebraicTopology stages as in the repair table, and 8.8d's torsion-only Serre classes (lines 2661–2700). AT 8.8d supplies only the torsion Serre class, so G5.6's torsion form of the stable-stem theorem matches its supply. Hatcher's and Cohen's finiteness theorems are correctly labelled as stronger.
- **Overlaps.**
  - #1807 order: stated in the description.
  - #1808: no conflict in this folder.
  - #1187: unordered (R11).
  - StableHomotopyKTheory (#1227) and HigherToposTheory (#1901) cite the moved G2.1 name. The moved-identifier line covers it.
  - HomotopyTheoryOfCategories (#1521) cites "G2 item 1", which is the current G2.1.

### Sources: the seeded sample (15 targets)

| Target | Locator in the README | Verdict |
| --- | --- | --- |
| G1.5, G1.6, G1.7 | none | missing (R05) |
| G2.1 | Quillen, *Homotopical Algebra*, Chapter II, Section 3 | uncertified; see Not verifiable |
| G2.3 | HSS Example 3.1.10, p. 23 (Checks only) | correct: HSS line 1088, page 23. It states λ, the wedge of n copies of Sⁿ, π₀F₁S¹ = ⊕ℤ and the stable equivalence. The model structure itself lacks a locator (R05). |
| G2.8, G2.9, G3.6, G3.7, G3.8, G3.10, G4.1, G4.2, G5.5 | none | missing (R05) |
| G4.3 | Cohen Theorem 10.40, p. 330 | number and page correct (CohenBMH line 11933, printed p. 330); connective and connected hypotheses dropped (R05) |

No locator in the README is flagged as unverified.

Also checked:
- Hatcher Proposition 3.17, p. 217 (HatcherAT line 9415), for cohomology, with the infinite-dimensional step left to the reader (Source issues).
- Hatcher Theorem 4.23 and Corollary 4.24, p. 360 (lines 15681 and 15686), which match G2.5's ranges.
- Hatcher Theorem 3F.8, p. 314 (line 13729).
- Hatcher SSAT Theorem 1.21, p. 32 (HatcherSSAT line 1946).
- Cohen Theorem 10.19, printed p. 294 (CohenBMH line 10477).
- May, *Concise*, Chapter 7, Section 4, Theorem on numerable covers (MayConcise line 2181).
- HTT A.3.1.10 and 3.2.1.13 (R05).
- HA 1.4.3.6.

### Dependency check output

```
depcheck: 236 roadmaps, 2292 edges, 0 problem(s)
```

## Not verifiable

- **Quillen, *Homotopical Algebra*, Chapter II, Section 3** (G2.1, and the Suggested Kan–Quillen repair): the manifest settles this text as uncertified, so it is cited by its locator only.
- **Segal, McDuff–Segal, Atiyah–Bott–Shapiro and Joachim:** all settled as uncertified and cited at section level. So G2.8's Γ-space claims and G5.5's KO operator model were checked only against Elmendorf–Mandell and Hebestreit–Sagave §6.
- **The KO^n versus KO^(−n) degree of Cl(n,0)-graded K_op,n (G5.5).** HebestreitSagave §§6–7 (lines 1253–1340) does not fix the sign of the generators, so I could not check π₀K_op,1 = KO¹ and π₀K_op,4 = KO⁴ against a source. The values hold under the README's own convention.
- **Ownership against open pull requests** was checked with `roadmaps grep` and `roadmaps show`, for HigherToposTheory, StableHomotopyKTheory, HomotopyTheoryOfCategories and AlgebraicTopology at #1652. It was not checked against pull requests without a listed checkout beyond these searches.

## Source issues

- **Gap** in HatcherAT at Proposition 3.17, p. 217: the source states the comparison for all CW pairs but proves only finite-dimensional ones, leaving the infinite-dimensional telescope step to the reader; it should give that step through the lim¹ sequence of Theorem 3F.8 or the telescope of Lemma 2.34; affects the proof.
