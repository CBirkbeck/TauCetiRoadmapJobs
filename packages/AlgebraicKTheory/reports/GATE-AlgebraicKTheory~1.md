# GATE-AlgebraicKTheory~1: answers to human review

Base head `e5df75b`; repairs are in commit `f590526` (not pushed). Files: `TauCetiRoadmap/AlgebraicKTheory/README.md`, `TauCetiRoadmap/AlgebraicKTheory/Suggested.lean`.

The comments are numbered as follows. H01–H06 are roed-math's first review (2026-10-19). H07 is roed-math's follow-up (2026-10-20 04:06). H08–H13 are the six numbered items of kim-em's reply (2026-10-20 13:09). H14–H17 are roed-math's review of `e5df75b` (2026-10-20 20:00).

## H01 (roed-math) — applied differently

A4 now has one owner for the covering-dimension predicate, but the owner is this roadmap, not GeometricTopology. The `CoveringDimensionCore` that `e5df75b` cited exists only in an open pull request that revises GeometricTopology. GeometricTopology on main contains no covering-dimension material (searched for "dimension", "Lebesgue" and `HasCoveringDimension`), and a revision of an existing roadmap cannot be a supplier. Neither pinned library defines covering dimension either.

README line 83 now defines `HasCoveringDimensionLE X d` here, counting distinct members of the refinement as in the Mathlib design. It assigns the basic theory to A4, keeps the finite/indexed-cover comparison with deduplication (line 85) and adds three Checks. `Suggested.lean` declares the predicate with a real body. Line 37 records the ownership. A GeometricTopology revision would consume this predicate rather than supply it.

## H02 (roed-math) — applied differently

The degree-0/1/2 comparison is no longer constructed in A5. A5 now only says that GeometryOfNumbersAndQuadraticArithmetic §6.1.7 (`ringKTheoryModels`) and §6.10 (`plusConstructionComparison`) own it (line 91). The reason is that §6.1.7, at its head, already constructs exactly this comparison: π₀ to `TauCeti.SplitK0`, π₁ to A2's u⊕id class, π₂ to A5's Steinberg kernel, the Morita and opposite-ring conventions, and A6's boundary with α=u⁻¹. Its *Needs* line consumes A0–A2, A5 and A6. If A5 also planned the comparison, it would plan the same thing twice and make supply run in both directions.

Line 39 now names GeneralAlgebraicKTheory and GeometryOfNumbersAndQuadraticArithmetic as consumers and owners of the higher theory. A6 keeps its normalization δ([u])=[M(u)]−[Dⁿ].

## H03 (roed-math) — answered

This was repaired at `e5df75b`. README line 11 adopts `TauCeti.BalancedTensorProduct ℤ R P S` with its `Actions`/`Unit`/`Associator`/`Coherence` API, and keeps the module-category, ring-map and finite-projective adapters as targets. The carrier is not at the pinned Tau Ceti (no `BalancedTensorProduct` under `TauCeti/LinearAlgebra/TensorProduct`). `Suggested.lean` therefore states no headline that needs it; its docstring names noncommutative base change as the missing carrier.

## H04 (roed-math) — applied differently

A3 now constructs K₀(R,I) itself, by triples (P,α,Q) with isomorphism, direct-sum and composition relations, a difference map into A0's `TauCeti.SplitK0`, and the boundary [u]↦[(Rⁿ,u,Rⁿ)] (lines 73–75). It no longer cites GrothendieckEulerForms, which has no relative group, and it no longer cites GeneralAlgebraicKTheory §4.15. GeneralAlgebraicKTheory consumes this roadmap's conventions, A0, A1 and A2 (its lines 62, 401, 423, 457 and 479), so citing §4.15 back made supply run in both directions. Comparing §4.15's generic group for base change with A3's group is recorded as GeneralAlgebraicKTheory's comparison (line 39). The degenerate checks are in the table below.

## H05 (roed-math) — answered

This was repaired at `e5df75b`. A8 (line 129) says that a norm ball about 1 need not be inverse-invariant, and takes U∩U⁻¹ for an open U inside {g : ‖g−1‖<1}.

## H06 (roed-math) — answered

This was repaired at `e5df75b`. The reference (line 133) cites Milnor §§1–6 and 9–12.

## H07 (roed-math) — answered

The follow-up restates H01–H06 against `4c951ce`. All six were changed at `e5df75b`, and the 2026-10-20 20:00 review confirms it. The current status of each is in H01–H06.

## H08 (kim-em) — applied differently

The repair to cite GeometricTopology's `CoveringDimensionCore` depended on a section that is only in an open revision of GeometricTopology; main has no covering-dimension section. A4 is now the owner (see H01).

## H09 (kim-em) — applied differently

Citing GeneralAlgebraicKTheory and GeometryOfNumbersAndQuadraticArithmetic §§6.1.7/6.10 as suppliers to A5 ran supply in both directions, because both consume A0–A2, A5 and A6. They are now consumers that own the comparison (see H02). The Milnor/supplier dictionary α=u⁻¹ is already stated in GeometryOfNumbersAndQuadraticArithmetic §6.1.7.

## H10 (kim-em) — answered

The balanced-tensor adoption at README line 11 stands unchanged (see H03).

## H11 (kim-em) — applied differently

Citing GeneralAlgebraicKTheory §4.15 for A3 ran supply in both directions (see H04). A3 now owns its relative triple group.

## H12 (kim-em) — answered

The A8 norm-neighbourhood text stands unchanged (see H05).

## H13 (kim-em) — answered

The Milnor reference stands unchanged (see H06).

## H14 (roed-math) — applied

A6 line 111: "allow a lift of diag(u,v) for any compatible invertible v after equal-size stabilization" → the lift now applies to v∈GLₙ(Q) and m≥0 such that diag(u⊕Iₘ,v⊕Iₘ)∈E₂₍ₙ₊ₘ₎(Q) with a recorded elementary-word witness. That word is lifted coefficientwise to X′, E′=(X′e′X′⁻¹,e′) is formed, and the class must be independent of v, m and the witness. The text says that invertibility and equal size are not enough, and that [v]=−[u] together with A1's common-stage criterion produces the witness. Check: π₁(X′e′X′⁻¹)=diag(u,v)e′diag(u⁻¹,v⁻¹)=e′, so E′ is a matrix over D.

## H15 (roed-math) — applied

A8 line 127: "compare projective/idempotent K₀ with the topological projection model in the C* case" → A8 now consumes OperatorKTheory K1's canonical natural isomorphism between projection K₀ and `TauCeti.SplitK0` of finitely generated projective right modules. It identifies that category with A0's Proj(A) and constructs no second category or comparison; line 37 states the ownership. OperatorKTheory K1 (its README, the paragraph after the unitization paragraph) constructs that category and isomorphism and does not cite this roadmap. The reciprocal statement inside OperatorKTheory, that its category is A0's carrier, is an edit to OperatorKTheory and outside this job.

## H16 (roed-math) — applied

A8 line 127: the stable component-group functor is now functorial for continuous unital algebra homomorphisms, with the reason (norm-continuous paths). The C* comparisons are natural for unital *-homomorphisms. The lifting statement is for complex Banach algebras. The Milnor-boundary comparison (line 129) is for pullback squares of unital C*-algebras along unital *-homomorphisms, and is now stated precisely. The algebraic Milnor boundary is compared with the composite of OperatorKTheory K3's index boundary K₁(Q)→K₀(J), for J=ker π₁, and the map K₀(J)→K₀(D) induced by J≅ker p₂. Both are [XeX⁻¹]−[e] for a lift X of diag(u,u⁻¹). The previous wording, "analytic pullback boundary", named nothing that OperatorKTheory defines.

## H17 (roed-math) — applied

Line 127 now says "canonical natural isomorphism, for unital *-homomorphisms" for the consumed K₀ comparison, and "identify it with OperatorKTheory K2's unitary K₁" for K₁.

## Further repairs required by the gate and the brief

- **`Suggested.lean`.** The old file had seven `Mathlib.*` sub-imports and no `import Mathlib`. It also had four sorry'd data declarations: `stabilize`, the `DirectedSystem` instance, `noncommutativeExtendScalars` and `noncommutativeExtendRestrictAdj`. It also had API lemmas that were not headlines: `boundary_idempotent`, `elementary_lift`, `diagonal_inverse_elementary` and `stabilize_apply`.
  - It is rewritten with `import Mathlib` plus `TauCeti.Algebra.Category.ModuleCat.CartanMap.Basic` and `TauCeti.CategoryTheory.GrothendieckGroup.Split`, in layer sections.
  - Headlines: `kZero_divisionRing`, `whitehead_commutator_elementary`, `elementary_le_commutator`, `dieudonne_determinant`, `surjective_stability`, `injective_stability`, `hasStableRangeLE_one_of_finite_maximalSpectrum`, `hasStableRangeLE_of_ringKrullDim_le`, `hasStableRangeLE_continuousMap_complex_iff` and `hasStableRangeLE_continuousMap_real_iff`.
  - Real-bodied definitions: `FiniteProjectiveRight`, `KZero`, `elementary`, `HasStableRangeLE` and `HasCoveringDimensionLE`.
  - The docstring names what is not statable at the pins: Milnor patching and the A3/A6 sequences (no noncommutative base change), A5's K₂ results (no Steinberg group) and A8 (no Banach or C* topological K-theory).
  - The matrix headlines are stated at finite size, which is the form Whitehead's lemma and Bass–Vaserstein stability take. The stable GL∞ and K₁ remain README targets: their colimit needs stabilization maps whose directed-system laws would otherwise be sorry'd data.
  - Every name is backticked in the README at its statement (lines 43, 45, 49, 53, 57, 67, 81, 83, 85).
- **GrothendieckEulerForms cycle (depcheck).** The README cited "GrothendieckEulerForms Layers 1–2" for the split-K₀ engine, while the open revision of GrothendieckEulerForms consumes this roadmap. The engine is at the pinned Tau Ceti, so line 37 now consumes `TauCeti.SplitK0` and its API directly. GeneralizedCohomology is no longer cited, because nothing here uses spectra.
- **Gate link and notation fixes.** Commit-pinned GitHub links to GeneralAlgebraicKTheory and GeometryOfNumbersAndQuadraticArithmetic are replaced by names and sections. The TeX-like `×_{C(S,ℂ)}` (line 121) is replaced by prose. The Suggested.lean description in the README opening (line 7) is updated.
- **Bass bounds.** The README stability statements (A4) (lines 81–83) now carry locators (Weibel III Remark 1.2.5 and Exercise 1.3; Weibel I Exercises 1.5(c) and 1.12(v); Bass V.3.5). They also have a Check that ℤ does not have stable range 1 (row (2,5)) and the remark that stable range ≤ 0 forces the zero ring.

## Adversarial pass on changed and added statements

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `kZero_divisionRing` | D=𝔽₂, ℍ; zero ring | finite projective Dᵐᵒᵖ-modules ≅ Dᵐ, classes m·[D]↦m; the zero ring is excluded by `DivisionRing` (its K₀ is 0, not ℤ) | true; normalization [D]↦1 excludes the sign-flipped iso |
| `whitehead_commutator_elementary` | n empty; n=1, R=ℤ, g=h=−1 | empty: both sides are the 0×0 identity; diag(1,1)=I∈E; in general diag([g,h],1)=diag(g,g⁻¹)diag(h,h⁻¹)diag((hg)⁻¹,hg), each in E₂ₙ by A1 | true |
| `elementary_le_commutator` | card n=3; card n=2, R=𝔽₂ | e_ik(a)=[e_ij(a),e_jk(1)] for distinct i,j,k; for n=2, GL₂(𝔽₂)≅S₃ has commutator A₃ of order 3, while E₂(𝔽₂) has order 6 | true for n≥3; n=2 is a counterexample, so the bound is needed |
| `dieudonne_determinant` | D=𝔽₃, n=2; D=𝔽₂, n=2; D=ℍ, n=1 | 𝔽₃: φ=det, ker=SL₂=E₂; 𝔽₂: φ trivial, ker=GL₂(𝔽₂)=E₂ (order 6); ℍ, n=1: ker would be [ℍˣ,ℍˣ]≠1=E₁ | true with n≥2; n=1 is false for noncommutative D, so the bound is needed |
| `HasStableRangeLE` | field, s=1; ℤ, s=1; s=0 | field: (a₀,a₁) unimodular, c=0 if a₀≠0, else c=1; ℤ: (2,5) unimodular, 2+5c≠±1; s=0: row (1) gives the empty sum 0=1, so only the zero ring | the definition separates fields from ℤ |
| `surjective_stability` | k empty; zero ring; R a field, s=1, n=1 | k empty: h=g, e=1; field: g=diag(det g,1,…)·e | true (Weibel III Ex. 1.3(a), with sr=d+1 ↔ n>d+1) |
| `injective_stability` | s=1, n=2 | Weibel III Remark 1.2.5: K₁=GLₙ/Eₙ for n≥d+2=s+1 | true at the Vaserstein bound |
| `hasStableRangeLE_one_of_finite_maximalSpectrum` | zero ring; ℤ_(p); ℤ | zero ring: empty max spectrum, conclusion trivial; ℤ has infinitely many maximal ideals and sr(ℤ)=2 | the hypothesis is necessary |
| `hasStableRangeLE_of_ringKrullDim_le` | ℤ, d=1; field, d=0; zero ring (dim ⊥) | sr(ℤ)=2≤2; sr(field)=1≤1; zero ring trivial | true |
| `HasCoveringDimensionLE` | finite discrete, d=0; [0,1], d=0 and 1; ∅ | singletons give order 1; an order-1 refinement of [0,1] would be a nontrivial clopen partition; ∅ holds for all d | separates dimensions 0 and 1 |
| `…continuousMap_complex_iff` | X=point, [0,1], S²; s=0 excluded | sr=⌊d/2⌋+1 ≤ s ⇔ d≤2s−1: point 1≤1; [0,1] 1≤1 with s=1; S² ⌊2/2⌋+1=2, so false at s=1 and true at s=2; with s=0, a point has dim 0 but sr(ℂ)=1>0 | true; hs needed; finite dimension assumed as in the README |
| `…continuousMap_real_iff` | point, [0,1] | sr=d+1≤s ⇔ d≤s−1: [0,1] gives 2, false at s=1 and true at s=2 | true |
| A3 triple relations | (P,id,P); swap | composition (P,id,P)+(P,id,P)=(P,id,P) gives 0; (P,α,Q)+(Q,α⁻¹,P)=(P,id,P)=0; the difference map respects both relations: [P]−[Q]+[Q]−[S]=[P]−[S] | consistent |
| A3 boundary exactness at K₁(R/I) | u=π(U) | (Rⁿ,ū,Rⁿ)≅(Rⁿ,id,Rⁿ) via f=U, g=id | image of K₁(R) maps to 0 |
| A6 generalized lift | v=u⁻¹, m=0 | diag(u,u⁻¹)∈E₂ₙ by A1; π₁(X′e′X′⁻¹)=e′ | recovers the main case |
| A8 Milnor/OperatorKTheory comparison | J=ker π₁≅ker p₂ | ker p₂={(a,0) : π₁(a)=0}; both boundaries are [XeX⁻¹]−[e] | same sign convention |

## Signature check

I put `#check @name` for all 15 declarations at the end of `Suggested.lean`, built once, then restored the file. Every elaborated type carries its binders explicitly; no section `variable` is used. Examples: `injective_stability` keeps `HasStableRangeLE R s`, both `Fintype`/`DecidableEq` pairs and `s + 1 ≤ Fintype.card n`, and the C(X) equivalences keep `CompactSpace`, `T2Space`, finite dimension and `1 ≤ s`. Each type matches its README statement. Nothing needed changing after the check.

## Ownership and citations

- Ownership was checked by object against main, the board packages and the open roadmap pull requests through `roadmaps grep`.
  - Covering dimension: only the open GeometricTopology revision, a remark in ArithmeticDynamics, and this roadmap mention it.
  - Stable range: absent from both pins.
  - Relative K₀ by triples: GeneralAlgebraicKTheory §4.15 has the generic version for an additive functor and is a consumer here.
  - OperatorKTheory K1/K2/K3, HilbertModules H2/H5, TopologicalKTheory T1 and BanachAlgebras A2 were opened at their current heads or on main and contain the sections cited.
- The citation lead `Set.HasOrderLE` is no longer in the README.
- What is left for other roadmaps:
  - GeneralAlgebraicKTheory and GeometryOfNumbersAndQuadraticArithmetic both sit above this roadmap in the merge order and consume it. That is an upward dependency on their side, which the merge-order insertion has to resolve.
  - The OperatorKTheory reciprocal sentence (H15).
- Sources:
  - Weibel, *The K-book*, Chapters I–III, were read from the author's page through the sources service (keys `Weibel-KBook-I`, `-II`, `-III`). The locators cited are Weibel I lines 144–158 and 243–258, Weibel II lines 204–207, and Weibel III lines 109–115, 146–149 and 503–511.
  - Vaserstein 1971 and Bass 1964 are cited by locator only.
  - The roadmap folder has no `sources.toml`, and this job may edit only README.md and Suggested.lean, so no manifest entries were written.

## Build and gate

- `lake build TauCetiRoadmap.AlgebraicKTheory.Suggested`: Build completed successfully (8999 jobs), with 10 `declaration uses 'sorry'` warnings, one per headline theorem.
- Gate: `gate AlgebraicKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`. The single remaining item is `depcheck: NOT IN ORDER: AlgebraicKTheory (insert it after its last supplier)`, which is expected for a roadmap at the design stage.
- Depcheck (`--movable`):

```
NOT IN ORDER: AlgebraicKTheory (insert it after its last supplier)
depcheck: 148 roadmaps, 1006 edges, 1 problem(s)
```

  It reports no UPWARD and no CYCLE line. The earlier `CYCLE among: AlgebraicKTheory, GrothendieckEulerForms` is gone.
