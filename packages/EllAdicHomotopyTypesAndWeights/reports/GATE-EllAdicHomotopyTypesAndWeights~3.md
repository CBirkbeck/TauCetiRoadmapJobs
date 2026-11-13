# GATE-EllAdicHomotopyTypesAndWeights~3: answers to human review

Commit `284a8168` on the pull request branch (not pushed): "EllAdicHomotopyTypesAndWeights: review repairs (Sullivan and polynomial-form contracts consumed from RationalHomotopyModels by section)". It changes `TauCetiRoadmap/EllAdicHomotopyTypesAndWeights/README.md` only (22 lines). `Suggested.lean` is unchanged.

## H01 (mycaule) — applied differently

The five contracts now read "What RationalHomotopyModels §… must provide (…)", replacing "What AlgebraicTopologyPartII must provide (gap:…)", under the heading `### From TauCetiRoadmap.RationalHomotopyModels` (README lines 63–75). They map as follows: polynomial-forms-de-rham §§4.1–4.4; sullivan-minimal-models §§1.1–1.3, 3.1 and 3.2; sullivan-quasi-isomorphism-rigidity §3.3; sullivan-homotopy-lifting §§2.1–2.4 **and 3.4**; sullivan-scalar-extension §3.5. Every Needs and Dependencies line that named AlgebraicTopologyPartII now names these sections (lines 11, 185, 358, 374, 561, 590, 592, 606, 664, 678, 717, 769, 865, 887, 1006). The suggested mapping differs in one place: sullivan-homotopy-lifting cannot be only §§2.1–2.4, because its last clause (lifting an automorphism of a connected target to a homotopy class of automorphisms of the minimal model) is RationalHomotopyModels §3.4, as that roadmap's own Scope and Downstream consumers sections say.

Evidence and details:

- **AlgebraicTopologyPartII does not plan this material (confirmed).** At head `ed88288`, AlgebraicTopologyPartII has 1750 README lines and Layer 4 is §§4.1–4.6 (tame polynomial, bouquet theorem, Hilton decomposition, rational homotopy of spheres, wedge ranks, double-loop model). A case-insensitive search for `A_PL|sullivan|minimal model|polynomial form|Hirsch` finds nothing in it. The contracts therefore had no planned supplier.
- **RationalHomotopyModels owns them (confirmed section by section, head `547c510`).**
  - polynomial-forms-de-rham:
    - Conventions and §4.1: `A_PL(Δⁿ)` with `Σtᵢ=1`, `Σdtᵢ=0`, and the simplex filtration counting the `tᵢ` and the `dtᵢ`.
    - §4.3: `A_PL(X)` as compatible families, contravariant, detected on simplices, with unbounded degree allowed.
    - §4.4: the natural graded-algebra de Rham isomorphism.
  - sullivan-minimal-models:
    - §1.1: ΛV.
    - §1.2: Sullivan algebras, minimality and `Q(A)`.
    - §1.3: maps out of Hirsch extensions.
    - §3.1: existence for `H⁰=K`, with no nilpotence assumption.
    - §3.2: `i`-minimal models, with `i=1` meaning an H¹ isomorphism and an H² injection.
  - Rigidity: §3.3.
  - sullivan-homotopy-lifting:
    - §2.1: `Λ(t,dt)` and its evaluations.
    - §2.3: the equivalence relation, a single homotopy for transitivity, equal cohomology maps, and pre- and postcomposition.
    - §2.4: `[M,A]→[M,B]` is a bijection.
    - §3.4: automorphism lifting, with no compatible choice of actual lifts asserted.
  - Scalar extension: §3.5, which covers full and `i`-minimal maps.
- **One contract clause narrowed to match the supplier.** RationalHomotopyModels §2.3 states the homotopy laws for a Sullivan source and a graded-commutative target, so the contract now reads "prove, for ordered positive-degree Sullivan sources M and commutative DG targets, equal induced cohomology maps, …". Before, the Sullivan restriction attached only to the equivalence relation. Every homotopy in this roadmap has a minimal-model source (§0.1 Examples, §§4.2, 4.4, 6.2), so no use is lost. A non-Sullivan source would also break the bijectivity clause: for `M=K[x]/(x²)`, `|x|=2`, the class of the identity is not in the image of `[M,Λ(x₂,y₃)]→[M,K[x]/(x²)]` (RationalHomotopyModels §2.4, Checks).
- **§4.4 proof pointer corrected.** "Pass to minimal models using the declared Layer 0 contracts" now reads "… using RationalHomotopyModels §§2.4 and 3.1–3.5". Layer 0 declares no Sullivan contract. Moving a minimal model along the zigzag `A_ℓ(X)←…→A_PL(Sing X(C);ℚ)⊗ℚ_ℓ` needs the §2.4 bijection at each quasi-isomorphism.
- **Single owner.** `roadmaps grep` for `A_PL|Sullivan minimal|minimal Sullivan|polynomial de Rham` and for `Sullivan algebra|Hirsch extension|Sullivan model` over main and all 464 open heads finds only RationalHomotopyModels and this roadmap. The other hits are false positives (`spa_plus`, an unrelated "polynomial de Rham complex" in DerivedDeRhamCohomology and QWittVectors, and `eulerFormula_plane`).
- **Direction of supply.** RationalHomotopyModels is an open pull request by another author that adds a new roadmap folder, so this roadmap may consume it.
  - It is not on main or in the merge order. The candidate check places it right after ArithmeticLocallySymmetricSpaces, which is merge-order line 59; this roadmap is at line 296.
  - Its suppliers are DGAInfinity, AlgebraicTopology, GeneralizedCohomology, ComplexKahlerGeometry and DifferentialGeometry on main, plus StableHomotopyKTheory (line 17), DerivedDeRhamCohomology (line 24) and ArithmeticLocallySymmetricSpaces (line 59). None comes after this roadmap.
  - It names this roadmap only in "Left to other roadmaps" and "Downstream consumers", so there is no cycle. The candidate check reported `candidate: RationalHomotopyModels is not in the merge order yet; checked as if placed after ArithmeticLocallySymmetricSpaces …` and `depcheck: 240 roadmaps, 2172 edges, 0 problem(s)`.
  - For the worker: this pull request now depends on RationalHomotopyModels merging first. Name it in the merge-order paragraph.
- **Labels kept, `gap:` prefix dropped.** RationalHomotopyModels refers to the five contracts by these labels in its Scope and Downstream consumers sections, so the labels are kept. They are no longer gap requests.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed (this README ↔ RationalHomotopyModels) | Result | Change |
|---|---|---|---|---|
| Scope l.11: RationalHomotopyModels owns polynomial forms, Sullivan/Hirsch constructions, polynomial homotopies, existence/lifting/uniqueness | AlgebraicTopologyPartII `ed88288`; RationalHomotopyModels `547c510` "Owned here" | AlgebraicTopologyPartII: 0 hits for A_PL/Sullivan/Hirsch/minimal model. RationalHomotopyModels: ΛV, Sullivan algebras, Hirsch extensions, `Λ(t,dt)`, lifting, existence/rigidity/uniqueness/scalar extension, A_PL all listed | holds | "requested from AlgebraicTopologyPartII … extending its rational sphere and loop-space direction" → "RationalHomotopyModels owns …; the five exact contracts below name the sections consumed" |
| polynomial-forms-de-rham ↔ §§4.1–4.4 | Δ⁰; Δ¹; simplicial circle Δ¹/∂Δ¹; filtration on `t₀²`; disjoint union of edges indexed by N | A_PL(Δ⁰)=K ↔ K. A_PL(Δ¹)=Λ(t,dt), H¹=0 ↔ same (over 𝔽_p `t^(p−1)dt` is not exact; char 0 is assumed on both sides). Circle: H¹=K by dt, ∮dt=1 ↔ §4.4 Checks. `d(t₀²)=2t₀dt₀` keeps total degree 2 ↔ §4.1 Checks. `x₁ᴺ` on the Nth edge is in A_PL (§2.5 Check here) ↔ §4.3 "unbounded polynomial degree" | holds | header readdressed |
| sullivan-minimal-models ↔ §§1.1–1.3, 3.1, 3.2 | A=K; A=K[x]/(x²), \|x\|=2; Λ(u₁,v₂), du=v; A=K×K; S¹∨S¹ at i=1 | M=K, no generators ↔ §3.1. Λ(x₂,y₃), dy=x² ↔ §3.1. Q(d)u=v≠0: Sullivan, not minimal ↔ §1.2. H⁰=K²: excluded by H⁰=K ↔ §3.1. Infinite degree-one tower (dz=ab, dw=az, …) ↔ §3.2, matching the three-punctured-line Check in §6.2 here | holds | header readdressed |
| sullivan-quasi-isomorphism-rigidity ↔ §3.3 | K→Λ(u₁,v₂); Λ(e₁)→Λ(e₁), e↦2e | First is a quasi-isomorphism and not surjective; minimality excludes it on both sides. Second is an isomorphism with inverse e↦e/2 (2 invertible in char 0) | holds | header readdressed |
| sullivan-homotopy-lifting ↔ §§2.1–2.4, 3.4; clause scoped to Sullivan sources | Λ(e₁)→Λ(a₁), e↦a vs e↦2a; M=K; M=K[x]/(x²) non-Sullivan; automorphism x↦λx of K[x]/(x²) | H¹ maps 1 ≠ 2, so not homotopic (§0.1 Examples here ↔ §2.1/§2.3 Checks there). [K,A]=one point. Non-Sullivan M: identity class missed, since (cx)²=0 forces c=0, so the Sullivan hypothesis is needed. Lift β(x)=λx, β(y)=λ²y, while β(y)=λy fails unless λ=1 ↔ σy=a²y in §6.4 Checks here | holds after narrowing; §3.4 needed for the last clause | header readdressed; §3.4 added; "for ordered positive-degree Sullivan sources M and commutative DG targets" now governs the whole list |
| sullivan-scalar-extension ↔ §3.5 | K=ℚ→L=ℚ₇ on Λ(a₁,b₁) (the §6.2 Check here, α²=2, α≡3 mod 7); e↦2a; 𝔽₂ | Λ_ℚ₇(a,b) is minimal with d=0. H¹ of e↦2a is 2, invertible over every char-0 L; over 𝔽₂ it is 0, excluded by hypothesis on both sides | holds | header readdressed |
| Needs-line section unions (ll. 185, 358, 374, 561, 592, 664, 678, 717, 769, 865, 887, 1006) | union of the cited contracts' sections per line | §4.2: {1.1–1.3,3.1,3.2}∪{2.1–2.4,3.4}∪{3.3} = §§1.1–1.3, 2.1–2.4, 3.1–3.4. §6.2: {1.1–1.3,3.1,3.2}∪{2.1–2.4,3.4}∪{3.5} = §§1.1–1.3, 2.1–2.4, 3.1–3.2, 3.4–3.5 (3.3 not cited there). §4.4 and Layer 0: all five = §§1.1–1.3, 2.1–2.4, 3.1–3.5, 4.1–4.4. Layer 6 Dependencies: union of §§6.1, 6.2, 6.4 = same as §6.2 | consistent | lines rewritten |
| §4.4 proof pointer | X=𝔾_m,ℂ; the zigzag through A_PL(Sing X(C);ℚ)⊗ℚ_ℓ | Λ(a₁)⊗ℚ_ℓ→A_ℓ(X) has H¹ rank 1 = 1. Transporting the model across each quasi-isomorphism uses the bijection [M,A]≅[M,B] (§2.4), then §§3.3–3.5 | old pointer named Layer 0, which declares no contract | "declared Layer 0 contracts" → "RationalHomotopyModels §§2.4 and 3.1–3.5" |

No hypothesis was dropped and no generality widened. The only statement-level change narrows one contract clause to the hypotheses its supplier states. Every use in this roadmap satisfies them.

## Suggested.lean

Unchanged. It declares nothing, so there is nothing to `#check` (`scratch/signatures.md`: "no named declaration"). Its closing sentence, "The generic Sullivan existence, lifting and uniqueness theorem is a supplier contract in README.md", is still true.

## Build, gate, dependency check

- `lake build TauCetiRoadmap.EllAdicHomotopyTypesAndWeights.Suggested`: `✔ [18238/18239] Built TauCetiRoadmap.EllAdicHomotopyTypesAndWeights.Suggested (4.5s)` / `Build completed successfully (18239 jobs).`
- Gate, after commit: `gate EllAdicHomotopyTypesAndWeights: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`--movable --pr 1644`): `depcheck: 239 roadmaps, 2168 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line. Candidate check of RationalHomotopyModels: see H01.
- `roadmaps resolve` on the edited README: no cross-roadmap citations and no Lean names found nowhere.

## Notes

- Ownership against open work was checked by object over main and all 464 open heads with `roadmaps grep`. RationalHomotopyModels is not among the brief's sibling checkouts, so it was read at its head `547c510` with `roadmaps show`.
- No new sources and no `needs-references.toml`. The contracts keep their existing locators (morgan, dgms, sullivan).
- The review text contained no instructions to act on; nothing suspicious to report.
