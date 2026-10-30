# Review of TopologicalSheafCohomology (pull request #973 at f3cac1b)
**Verdict:** accepted

:robot: Independent AI review. Incremental re-review of 4 changed lines since ac45da4: two replacements in the ownership and downstream-consumer paragraphs. No findings. The gate, targeted build, direct elaboration and all three signature checks pass. This folder is ready for human final approval.

## Previous findings

The preceding report had no findings of its own. Its historical finding remains repaired:

- R01 — repaired: README lines 10 and 221 keep ImplicitAtlases a consumer. No supplier contract or Needs line imports it; the dependency check reports zero problems. The added ownership explanation does not restore the former cycle.

## Verified sound

### Review boundary and validation

Read the repository README's Writing a roadmap checklist and CONTRIBUTING, the previous report, the exact diff and both target files. The diff is two additions and two deletions in TauCetiRoadmap/TopologicalSheafCohomology/README.md:10 and :221. Reviewed the changed claims and their dependencies in §§1.1–1.2 and §1.4. Suggested.lean is unchanged. No file outside the folder differs from origin/main in this PR; the worktree remains clean. No PR file was modified.

The worker's full gate at f3cac1b passes, including build=0. The independent gate rerun passes every scanner, metadata, dependency, stray-file and outside-folder check. The independent targeted build of TauCetiRoadmap.TopologicalSheafCohomology.Suggested passes (8976 jobs). The prescribed dependency check prints:

    depcheck: 207 roadmaps, 1463 edges, 0 problem(s)

There is no UPWARD, CYCLE or moved line. All seven Needs lines retain their previous inputs; ImplicitAtlases and CharacteristicClasses supply none of them. The order file still places ImplicitAtlases at 200 and this roadmap at 283. As established in review ~4, an eventual import of this roadmap by ImplicitAtlases requires moving that consumer after its supplier; the present paragraph adds no reverse dependency.

Direct lake env lean elaboration of TauCetiRoadmap/TopologicalSheafCohomology/Suggested.lean exits successfully with only the two expected sorry warnings (lines 32 and 63). A scratch copy with #check @name for all three declarations also elaborates. Comparing those types with README §§0.1 and 2.1:

- moduleCohomologyForgetComparison retains both sheafification instances, Γ additivity, module-sheaf injective resolutions and abelian-sheaf Ext, at the matching universe.
- fiberStalkMap has no properness, finiteness or separation assumption; its fiber index is the actual subtype f(x)=y.
- properFiniteFiberStalk retains Hausdorff X, properness and every-fiber finiteness, and imposes no separation or local compactness on Y.

Zero binders were lost and no signatures changed. The unsuccessful one-tactic padding probes for the two theorems recorded by review ~4 carry forward because neither Lean nor the pins changed. The sole definition is still needed to state the actual stalk-map headline.

### Headline inventory

| README headline | Acceptance-test disposition |
|---|---|
| §0.1 module-derived/underlying-abelian comparison | moduleCohomologyForgetComparison, Suggested.lean:32 |
| §1.3 compact Hausdorff Čech/derived comparison | Docstring lines 10–12 names the missing cover-refinement diagram and all-cover colimit |
| §1.4 bounded-below hypercohomology comparison and two convergent spectral sequences | Docstring lines 13–16 names the missing hypercohomology diagram and pagewise colimits |
| §2.1 canonical proper finite-fiber stalk isomorphism | properFiniteFiberStalk, Suggested.lean:63, using fiberStalkMap at line 49 |

The ownership clarification changes none of these statements or their statability.

### Ownership and resolved cross-roadmap citations

Rechecked all four cross-roadmap references against main or the supplied open head. Main is 6cfa9b1c; the supplied ImplicitAtlases head is 3b7572e0. Read the corresponding main-roadmap sections as the house-style examples as well.

| Citation | Witness at the required revision | Conclusion |
|---|---|---|
| SchemeAndStackFoundations §2.5 | TauCetiRoadmap/SchemeAndStackFoundations/README.md:3388, especially 3391–3399 | Owns the Godement construction, module/abelian forms, restriction, sections comparison and flasque Čech vanishing. This unchanged supplier contract resolves. |
| ImplicitAtlases §§0.5–0.11, especially §§0.6–0.7 | TauCetiRoadmap/ImplicitAtlases/README.md:171, :189, :191, :193, :194, :195 | The newly explicit sentence is accurate: §0.7 defines open-cover sheaf Čech cohomology on the locally compact Hausdorff spaces fixed in §0.6, refinement independence and finite-cover cofinality. It separately defines compact-cover K-presheaf hypercohomology and its spectral sequence. |
| CharacteristicClasses C1.2b | TauCetiRoadmap/CharacteristicClasses/README.md:449 through 463 | Explicitly consumes TS1.1–TS1.2's arbitrary-space interface and excludes a local-compactness restriction. Its own comparison assumes paracompact Hausdorff CW type. |
| ComplexKahlerGeometry K2 | TauCetiRoadmap/ComplexKahlerGeometry/README.md:193, :266 through 280 | Owns analytic resolutions, fine acyclicity and the manifold Čech/derived comparison, matching the unchanged boundary statement. |

Used the roadmap search service to search by open-cover Čech objects and TS1.1–TS1.2, then read the supplied ImplicitAtlases checkout and main citations. Also searched board package READMEs and plans for the cover-colimit/refinement objects. The overlap relevant to this diff is the same one identified in review ~4: ImplicitAtlases §0.7 still contains the specialization. Main CharacteristicClasses consumes this roadmap, while ImplicitAtlases consumes CharacteristicClasses (TauCetiRoadmap/ImplicitAtlases/README.md:73–75). Consequently the single supply direction is TopologicalSheafCohomology → CharacteristicClasses → ImplicitAtlases. Keeping the arbitrary-space owner here and directing the consumer to import its specialization is consistent with that direction. Removing the duplicate from ImplicitAtlases remains work in that folder, not a defect reparable by introducing a reverse import here.

The new wording expressly acknowledges the existing specialization. It adds neither a new construction nor a new supplier. The compact-cover comparison belongs to ImplicitAtlases and applies through its equivalence to complexes of sheaves/K-sheaves; this equivalence does not identify arbitrary K-presheaves with sheaves. The downstream paragraph is read with that explicit §0.6 domain, as in review ~4.

### Pinned library witnesses

Reopened these five declarations relevant to the changed claims; unchanged library audits are carried from review ~4:

| Declaration and pinned file | What the declaration provides |
|---|---|
| CategoryTheory.cechComplexFunctor, Mathlib/CategoryTheory/Sites/SheafCohomology/Cech.lean:65 (binders at 58) | A complex for a family U:ι→C, with tuple-indexed terms; no covering, Hausdorffness or all-cover colimit is part of this definition. |
| CompactSpace, Mathlib/Topology/Defs/Filter.lean:296 | The single compactness field for the whole space; no separation axiom. |
| IsCompact.elim_finite_subcover, Mathlib/Topology/Compactness/Compact.lean:208 | A finite subfamily from any indexed open cover of a compact set. |
| TauCeti.CategoryTheory.cechAugmentation, TauCeti/CategoryTheory/Sites/SheafCohomology/Cech.lean:198 | The augmentation of a fixed-family complex from sections at a terminal object. |
| TauCeti.CategoryTheory.quasiIso_cechAugmentation_iff, same file:309 | Quasi-isomorphism iff the sheaf condition for that family and all positive-degree exactness hold; no general all-cover comparison. |

These native objects agree with the ownership boundary: the general cohomological refinement colimit and its comparisons remain roadmap targets. No new Lean declaration or duplicate fully qualified name was introduced.

### Sources and seeded sample

Fetched the relevant legal texts through the sources service: Pardon arXiv:1309.2370v6 and the Stacks Cohomology of Sheaves PDF. Read the exact locators below. No source file, extraction or manifest was added to the PR. Numbering below uses the README's full Stacks chapter numbering; the chapter PDF abbreviates it by dropping the chapter prefix.

| Seeded target or dependent claim | Verification in this incremental pass |
|---|---|
| §0.1 constant-ring adapter and cohomology comparison | Unchanged; carry the source and mathematical checks from PRREVIEW-TopologicalSheafCohomology~4. Its Lean signature was re-elaborated here. |
| §0.2 bounded-below derived sections | Unchanged; carry the source checks and two-term/shift computations from review ~4. |
| §1.1 fixed-cover complexes and raw refinements | Rechecked Stacks Definitions 20.23.1–20.23.2 and Lemmas 20.23.3–20.23.6, pp.40–43: stacks-cohomology line 1821, line 1840, line 1857, line 1868, line 1874 and line 1880. The ordered/alternating identification and homotopy equivalence with the tuple complex support the added sentence. Pardon footnote 42, p.119, pardon line 5262, supplies the orientation-line presentation. |
| §1.2 small cofinal cover systems | Rechecked refinement independence and the cover preorder in Stacks §20.15, p.24, stacks-cohomology line 1066 through line 1087. Pardon Remark A.4.1, Definition A.4.3 and Lemma A.4.4, pp.119–120, pardon line 5231, line 5240 and line 5267, give precisely the specialization now acknowledged. Its standing local compactness/Hausdorff convention is pardon line 4931; finite subcovers themselves need only compactness. |
| §1.3 compact Hausdorff comparison | Unchanged; carry review ~4's source check and computed rows. No new derived-comparison claim was added. |
| §1.4 bounded-below hypercohomology and two spectral sequences | Unchanged targets; rechecked the boundary with Pardon Definition A.4.10, Lemmas A.4.11 and A.4.13, pp.121–122, pardon line 5341, line 5361 and line 5386. Open/compact comparison is for a sheaf through the §0.6 equivalence (Lemma A.1.8, p.115, pardon line 5027); the compact-cover spectral sequence allows bounded-below K-presheaf complexes. Carry the other source and convergence checks from review ~4. |
| §2.1 canonical product-of-stalks comparison | Unchanged; carry review ~4's source check and counterexamples. Both the map definition and theorem signature were re-elaborated here. |

No newly unverified locator was introduced. The two source misprints below are retained with their witnesses; neither was copied into a target.

### Adversarial table

There are 52 rows: 47 carried from PRREVIEW-TopologicalSheafCohomology~4 and five computed for the changed ownership claims and their mathematical interfaces. Carried rows preserve that report's values; they are not presented as fresh computations. The two former rows about the ownership and downstream paragraphs are replaced by the new rows. All seven sampled targets and all headline theorems remain covered.

| Statement | Instances and values computed on each side | Result | Change / provenance |
|---|---|---|---|
| §0.1 equivalence Sh(X;R-Mod) ≃ Mod(R_X) | Two discrete points: Γ(R_X)=ℤ², r↦(r,r); (2,3)·(a,b)=(2a,3b); restriction along R→Γ(R_X) gives 2·(a,b)=(2a,2b); stalks of R_X are ℤ | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §0.1 extension of scalars | ℤ→ℚ: ℤ↦ℚ, ℤ/2↦0, 0→ℤ→ℤ→ℤ/2→0 ↦ 0→ℚ→ℚ→0 exact; ℤ→𝔽₂: ×2 ↦ 0 on 𝔽₂, kernel 𝔽₂ | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §0.1 zero ring | R=0: all modules 0, both sides 0 | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §0.1 V RⁿΓ_R ≅ Hⁿ U | Point, R=ℤ/4, F=ℤ/4: H⁰=ℤ/4 both sides, 2·1=2, Hⁿ=0 for n>0; ℤ/2 injective as module, not divisible as group, H¹=0 both; X=∅: 0 | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §0.1 acyclic-resolution comparison | Point, M=ℤ/4: Godement terms M, differentials 0,1,0,1,…; H⁰=M, Hⁿ=0; on S¹ the constant sheaf is not Γ-acyclic (R¹Γ=ℤ) | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §0.1 flasque closure | Point: 0→ℤ→ℤ→ℤ/2→0 exact after Γ; two points: A×B→A onto | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §0.2 point complex ℤ→ℤ, ×2 | H⁰=0, H¹=ℤ/2; identity complex 0; zero differential ℤ,ℤ | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §0.2 shift sign | ℤ[1] in degree −1; ×2 becomes −2 | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §0.2 finite diagonal | b=−2, m=0: three terms; no bound: (k,−k) | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §1.1 repeated two-index point cover | C⁰=ℤ², C¹=ℤ, d(a,b)=b−a; H⁰=ℤ diagonal, H¹=0 | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §1.1 bounds and empty family | Two indices: ordered C²=0, tuple C² has 8 coordinates; empty family: 0 | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §1.1 composition of refinements | (2,3,5)↦5↦5; composite index selects 2 | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §1.1 chosen order, orientation line | Reversal: d'(b,a)=a−b=−(b−a); mod 2 agree; o₁+o₂=0 | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §1.1 prism sign | Singleton refining the repeated cover: on (2,3), T₁−T₀=1, hδ=1, δh=0 | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §1.2 smallness | X→Opens X and Σ n, ULift(Fin n)→Opens X are in Type u | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §1.2 raw category not filtered | Constant index functions 0,1 cannot be equalized by nonempty J′ | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §1.2 two discrete points | Singleton cover: C⁰=A×B, C¹=F(∅)=0; restriction is the projection | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §1.2 point-neighborhood cofinality (line 128, 132) | Wₓ=Uₓ∩Vₓ∋x refines both; repeated point cover raw maps 2,3 on (2,3), both send (a,a) to a | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §1.2 ℚ negative control (line 140) | Finite refining cover lies in a bounded union of (n,n+2)∩ℚ, misses a rational; point-neighborhood refinement covers ℚ | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §1.2 Sierpiński H⁰, H¹ (line 141) | d:P(X)×P({1})→P({1}), (a,b)↦b−res(a): kernel ≅P(X), cokernel 0; one-set cover: P(X), 0 | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §1.2 finite-cover cofinality from `CompactSpace` alone (line 128) | Given a u-small open cover U:I→Opens X with ⋃U_i=X, compactness yields finite S⊆I with ⋃_{i∈S}U_i=X; enumerating S by Fin n gives V:ULift(Fin n)→Opens X and the inclusion S→I is an index function with V_j=U_{a(j)}⊆U_{a(j)}, so V refines U. Sierpiński space (compact, non-Hausdorff): every cover contains X, the one-set cover {X} refines each with a(∗)=the index of X; so the finite system is cofinal. X=∅: the empty family (n=0) refines every cover; it is compact. Point with the infinitely repeated cover U_i=pt, i∈ℕ: subcover {U₀}, index function 0. Negative control ℚ (not compact): no finite refinement of {(n,n+2)∩ℚ}, as in the Check. | Correct; no separation used, in agreement with the `CompactSpace` definition at the pin | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §1.2 empty-space vanishing for every presheaf (line 134, Check line 142) | On ∅ with P(∅)=ℤ: one-set cover {∅} has ordered complex ℤ in degree 0, H⁰=ℤ; the two-set cover {∅,∅} has ℤ²→ℤ, (a,b)↦b−a, H⁰=ℤ, H¹=0; the empty family has the zero complex. The empty index function refines every cover of ∅ (including the one-set and two-set covers), so the empty family is the greatest element of the preorder, nothing nonempty refines it (no map J→∅ for J≠∅), and the colimit is its value, 0 in every degree. Transition maps into it are zero maps. The system of nonempty covers alone has every H⁰=ℤ with isomorphic transitions, colimit ℤ, as the Check says a system omitting the empty family would return. For a sheaf P(∅)=0 and every cover already gives 0, consistent with Pardon Remark A.4.2. | Correct, including P(∅)≠0 | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §1.2 Sierpiński finite-cover sentence (line 141) | Opens are ∅, {1}, X; the point 0 lies only in X, so every cover has a member equal to X; {X} is a finite cover (n=1) refining every cover | Correct | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §1.3 compact Hausdorff comparison | S¹: Čech¹=ℤ=H¹; point: F(pt), 0; ∅: 0; R=0: 0 | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §1.3 zero sheafification needs P(∅)=0 | {a,b}, P(∅)=ℤ, P(nonempty)=0: ordered C¹=ℤ, H¹=ℤ; P^#=0 gives 0 | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §1.3 local annihilation | P({a,b})=ℤ else 0: one-set H⁰=ℤ, singleton H⁰=0, colimit 0 | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §1.3 acyclic cover | S¹ one-set cover not acyclic (H¹=ℤ); two arcs with two-component intersection: fixed-cover H¹=ℤ | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §1.3 S¹ Check after reattribution (line 157) | Two arcs, ℤ²→ℤ², (a,b)↦(b−a,b−a): kernel ℤ, cokernel ℤ; R¹Γ(S¹;ℤ)=ℤ; one-set cover H¹=0 | Values unchanged by the wording change | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §1.4 total convention | D=δ+(−1)^p d; two paths from (0,0) contribute −1 and +1; unsigned total 2 | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §1.4 conjugation | ε=(−1)^{pq}: d+(−1)^q δ; at (1,1): −1, at (0,1): +1 | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §1.4 which page descends (line 169, Check line 177) | Repeated point cover, F in degree 0: Čech-degree filtration E₁=ℤ² with maps (0,1)↦0 or 1; E₂ diagonal ℤ, both identity | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §1.4 cohomology presheaf at ∅ | F^q(∅)=0 so ℋ^q(∅)=0; §1.3 presheaf comparison applies | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §1.4 first spectral sequence constructed here (line 168) | Filtration F^k Tot=⊕_{p≥k} by internal degree p: δ preserves p, d raises it, so both respect it. E₀ column p is (C^•(U;F^p),δ), hence E₁^(p,q)=Ȟ^q(U;F^p) with d₁ induced by d. Point, F=(ℤ --2→ ℤ) in degrees 0,1, one-set cover: E₁ row ℤ --2→ ℤ, E₂=(0,ℤ/2), abutment H⁰=0, H¹=ℤ/2, agreeing with the direct total (one term ℤ --2→ ℤ). S¹, F=ℤ in degree 0, two-arc cover: single column, E₁^(0,q)=ℤ,ℤ for q=0,1, no d₁, abutment ℤ,ℤ. F=0: every page 0. Refinement independence from E₁: the prism h maps C^(q+1)(V;F^p)→C^q(U;F^p), preserving p, so E₁ carries the cohomology maps, which are index-function independent. | Correct; indexing “p internal, q Čech” matches Pardon's E₁^(p,q)=Ȟ^q(X;F^p) | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §1.4 convergence of both sequences (line 170) | Total degree m: p≥b, q≥0, p+q=m, so p∈{b,…,m}, length m−b+1 for m≥b, empty for m<b (the total complex is zero there, since Čech degree ≥0 and internal ≥b). First filtration d_r has bidegree (r,1−r) in (p,q): outgoing from (p,q) needs q+1−r≥0, r≤q+1≤m−b+1; incoming from (p−r,q−1+r) needs p−r≥b, r≤m−b. For the Čech-degree filtration the roles of p and q swap with the same bound. b=−1, m=1: (0,1),(1,0),(2,−1), r>3 suffices. Finite filtration of each total degree gives strong convergence. | Correct for both filtrations | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §1.4 colimit over finite versus all covers (line 166) | On compact Hausdorff X, §1.2's finite system is cofinal, so colimits over it and over all u-small covers agree by the cofinal-system comparison of §1.2 (constructed through common refinements). On a point, both systems contain the one-set cover, which is cofinal in each; values coincide. | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §2.1 `fiberStalkMap` direction | eqToHom then stalkPushforward; coordinate x | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §2.1 two points to a point | ℤ×ℤ/2→ℤ×ℤ/2 identity, (3,1)↦(3,1) | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §2.1 empty source, identity | f:∅→Y gives 0→0; id on a point gives id_M | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §2.1 properness needed | (0,1)→ℝ, F=ℤ: ℤ→0 not iso | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §2.1 composition | (2,3,5)↦(2,3,5) versus ((2,3),5), reindexed | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §2.1 no averaging | 𝔽₂: identity on 𝔽₂² | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §2.1 closed-neighborhood argument | V=Y∖f(X∖⋃Oₓ) is open, contains y, f⁻¹V⊆⋃Oₓ; glue over disjoint pieces | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §2.1 no local compactness, non-Hausdorff target | ℚ identity: id on F₀; {a}→{a}⊔B indiscrete: id_M and 0→0 | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| §2.1 Hausdorff-source negative control | Doubled origin → ℝ: ℤ→ℤ² diagonal, not onto | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| Conventions and binders | R, X, Y in Type u; `properFiniteFiberStalk` has one separation binder, `T2Space X` | README and Lean agree | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| Supplier graph after the repair | Edges: this roadmap → CharacteristicClasses (main, line 449); CharacteristicClasses → ImplicitAtlases (head, line 73); no edge from ImplicitAtlases into this roadmap. The order this roadmap → CharacteristicClasses → ImplicitAtlases satisfies all edges. The dependency check reports 0 problems. | Single direction restored | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| References (line 227) | Pardon locators listed: A.0.1, A.3.2, A.4.1–A.4.3, footnote 42, A.4.4, A.4.8, A.4.13; each is cited somewhere in the body (lines 108, 128, 134, 168, 197). A.4.10 and A.4.11 are cited nowhere and are dropped. | Consistent | Carried from PRREVIEW-TopologicalSheafCohomology~4, Adversarial table |
| README:10, existing open-cover definition and refinement independence specialize §1.2 | Point, R=ℤ, repeated cover: ordered C⁰=ℤ², C¹=ℤ, d(a,b)=b−a; kernel={(a,a)}≅ℤ and cokernel=0. Refinement to one point sends (2,3) to 2 or 3 on cochains, but (a,a) to a by either choice. Both definitions give H⁰=ℤ, H¹=0 and identical transitions on H⁰. | Correct specialization; raw maps are not identified | New computation for README:10 |
| README:10, finite-cover cofinality specializes the compact case | Point with U_i=point for i∈ℕ: {U₀} refines it, cohomology ℤ in degree 0 and 0 above in both systems. Empty space: empty cover gives 0 in all degrees in both systems. Sierpiński space: every cover contains X; {X} refines all covers, yielding P(X),0 above, although X is not Hausdorff. | Compactness suffices; the locally compact Hausdorff case is included | New computation for README:10 |
| README:10, order-free and tuple complexes compute the same object | Repeated two-index cover of a point: ordered d(2,3)=1; tuple d(2,3)=(0,1,−1,0). The ordered generator 1 embeds as (0,1,−1,0). Reversing order gives −1; the orientation relation o₁+o₂=0 gives the same sign. Modulo 2, the tuple is (0,1,1,0), and both H⁰=𝔽₂, H¹=0. Singleton cover: tuple differentials 0,1,0,1,… versus ordered ℤ only in degree 0; both have H⁰=ℤ and Hⁿ=0 for n>0. | Homotopy equivalence, not termwise equality; no division by 2 | New computation for README:10 |
| README:10, CharacteristicClasses needs a domain beyond local compactness | Infinite-dimensional real Hilbert space ℓ² is metrizable, paracompact Hausdorff and contracts by (x,t)↦(1−t)x. In any radius-r neighborhood, x_n=(r/2)e_n have pairwise distance r/√2>0, so no compact neighborhood exists. Constant integral coefficients have H⁰=ℤ on both Čech and singular sides and higher groups 0. Its CW type is that of a point, so C1.2b includes it while the locally compact domain excludes it. | The generality distinction has a concrete witness | New computation for README:10 |
| README:221, consumer can substitute §1.2 and compare sheaf hypercohomology through §0.6 | On a point with F=(ℤ --2→ ℤ), open and compact singleton-cover totals are both ℤ --2→ ℤ: kernel 0, cokernel ℤ/2. The first spectral sequence has E₁ row ℤ --2→ ℤ and E₂=(0,ℤ/2) on both sides. For F=0 both totals and all pages are 0; on ∅ both are 0. | Valid on the sheaf/K-sheaf domain of the cited equivalence; no comparison of arbitrary K-presheaves is inferred | New computation for README:221 |

## Not verifiable

- Ownership against open pull requests whose files were not supplied was not independently checked. The service's wider search results were leads; this review relies on main and the supplied checkouts.
- No source needed for the changed passages was inaccessible. Unchanged source checks, the broader duplication audit and the one-tactic probes are carried from review ~4, as required for an incremental re-review.
- The admitted headline theorems remain unproved acceptance targets. Elaboration checks their types; the explicit instances above check consistency and do not constitute general proofs.

## Source issues

- **Misprint** in stacks-cohomology at Section 20.15 (tag 09UY), printed p.24: the source says the displayed prism gives the first refinement map minus the second; it should be the second minus the first; affects the proof.
- **Misprint** in pardon at Remark A.4.1, printed p.119: the source says the containing coarse member is indexed by f of a coarse index; it should be indexed by f of the refining index; affects a stated result.
