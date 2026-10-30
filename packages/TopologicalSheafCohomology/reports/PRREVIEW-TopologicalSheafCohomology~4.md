# Review of TopologicalSheafCohomology (pull request #973 at ac45da4)
**Verdict:** accepted

:robot: Independent AI review. Incremental re-review of 37 changed lines since 5305dcd (README only; `Suggested.lean` is byte-identical to the head the previous review read). The one blocking finding of the previous review is repaired, the repair introduced no new defect, and the gate, targeted build, direct elaboration and signature checks pass. No pull-request file was changed.

No findings.

## Previous findings

- R01 — repaired: no supplier citation of ImplicitAtlases remains. `TauCetiRoadmap/TopologicalSheafCohomology/README.md:144` now reads “*Needs:* §1.1; Mathlib finite subcovers of `CompactSpace`; small module colimits and exactness of filtered colimits”, and line 179 likewise drops the §§0.6–0.7 import. The former “From TauCetiRoadmap.ImplicitAtlases” contract is deleted. The repair route differs from the one the previous report proposed (extraction into a new supplier): the author instead keeps ownership of open-cover Čech cohomology here and names ImplicitAtlases as a consumer. That route is valid; the reasons are under “Ownership” below.

## Verified sound

### Scope of this re-review

Read the previous report in full, the diff of the folder (17 insertions, 20 deletions, all in README.md), the README at `ac45da4` in full and `Suggested.lean`. Reviewed the changed passages and everything that cites them: the Scope and ownership bullet on ImplicitAtlases (line 10), How to read the build (line 49), §1.2 (lines 128–144), the §1.3 S¹ Check (line 157), §1.4 (lines 166–179), the Layer 1 Dependencies paragraph (line 187), Downstream consumers (line 221) and the Pardon reference (line 227). Unchanged mathematical checks are carried from the previous report, each row saying so. The folder is three roadmap files (README.md, Suggested.lean, metadata.toml); `git diff --stat origin/main...HEAD` outside the folder is empty; the worktree is clean.

### Gate, dependency check, build, elaboration and signatures

The worker's gate at this head has every check at zero, including `build=0`. The gate rerun here (text scanners, naming, metadata, stray files, outside-folder, depcheck) also passes every check. The prescribed dependency check printed:

```text
depcheck: 207 roadmaps, 1460 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The three-edge cycle of the previous R01 (this roadmap → CharacteristicClasses → ImplicitAtlases → this roadmap) is broken at its third edge: a grep of the README for “ImplicitAtlases” finds it only in the Scope bullet (line 10) and in Downstream consumers (line 221), neither of which is a `*Needs:*` line, a supplier contract or a “Supplied by” citation.

`lake build TauCetiRoadmap.TopologicalSheafCohomology.Suggested` completed (8976 jobs). `lake env lean` on `TauCetiRoadmap/TopologicalSheafCohomology/Suggested.lean` produced exactly the two expected `sorry` warnings, lines 32 and 63, and nothing else. A scratch copy with `#check @name` for the three declarations elaborated; the elaborated types are unchanged from the previous review: `moduleCohomologyForgetComparison` keeps both `HasSheafify` instances, Γ additivity, `HasInjectiveResolutions` and `HasExt`; `fiberStalkMap` carries no separation or properness binder; `properFiniteFiberStalk` carries `T2Space X`, `IsProperMap f` and finiteness of every fiber, with no hypothesis on Y. Zero binders lost. The Lean file is unchanged since 5305dcd, so the padding probes of the previous report (no one-tactic closure of either theorem; the single definition is needed to state the stalk headline) carry over.

### Headline inventory

| README headline | Acceptance-test disposition |
|---|---|
| §0.1 module-derived/underlying-abelian comparison | `moduleCohomologyForgetComparison`, Suggested.lean line 32 |
| §1.3 compact Hausdorff Čech/derived comparison | Module docstring lines 10–12: no native carrier for the cover-refinement cohomology diagram and its colimit |
| §1.4 bounded-below hypercohomology comparison, two convergent spectral sequences | Module docstring lines 13–16: the diagram and its pagewise colimits are also missing; the newly owned first spectral sequence changes nothing about statability, since its carrier is the same missing colimit |
| §2.1 proper finite-fiber stalk comparison | `properFiniteFiberStalk`, Suggested.lean line 63 |

### Ownership

The repair makes this roadmap the owner of open-cover Čech cohomology with sheaf and presheaf coefficients on arbitrary spaces, including finite-cover cofinality on compact spaces, empty-space vanishing and the bounded-below open-cover hypercohomology with both spectral sequences. Checked by object:

- `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3349` on main (`6cfa9b1c`) states that Čech refinement diagrams and their colimits are outside its interface. No roadmap on main or under `Completed/` defines a colimit over open covers ordered by refinement (grep of every README on main for the colimit-over-covers and preorder-by-refinement phrasings: no hit).
- `TauCetiRoadmap/CharacteristicClasses/README.md:449` on main consumes this roadmap's TS1.1–TS1.2 for exactly that interface, so main already treats this roadmap as the owner.
- `TauCetiRoadmap/ImplicitAtlases/README.md:189–205` at its open head `3b7572e0` still defines open-cover Čech cohomology of sheaves on locally compact Hausdorff spaces (Pardon, Definition A.4.3) with refinement independence, finite-cover cofinality, empty-space vanishing and the compact-cover K-presheaf hypercohomology, and its line 73 consumes CharacteristicClasses. Because CharacteristicClasses consumes this roadmap and ImplicitAtlases consumes CharacteristicClasses, the only direction compatible with a single supply order is this roadmap → CharacteristicClasses → ImplicitAtlases, so this roadmap is the only one of the two that can own the shared open-cover statements. The sheaf-coefficient duplication at ImplicitAtlases' head is that roadmap's to remove by importing §1.2 and §1.4 here; it is not actionable in this folder, and this README's line 10 and line 221 state the relation correctly. Pardon's compact-cover hypercohomology of complexes of K-presheaves (Definition A.4.10) is not a specialization of anything here and rightly stays with ImplicitAtlases.
- The merge order lists ImplicitAtlases at position 200 and this roadmap at 283. The dependency check reports no problem because this roadmap consumes only SchemeAndStackFoundations on main and the libraries; ImplicitAtlases does not cite this roadmap at its head. When it does, the order must place this roadmap before it; that is a merge-order adjustment the consumer's review will raise, not a defect of this README.
- Ownership against open pull requests whose files the brief did not supply was not checked beyond the supplied checkouts.

### Resolved suppliers

| Roadmap and location | Checked |
|---|---|
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3388` on main, §2.5 | Title matches the README's quotation; Godement resolution, flasque terms and flasque Čech vanishing (line 3397) are stated there. Unchanged citation. |
| `TauCetiRoadmap/ImplicitAtlases/README.md:171`, `:189` at head `3b7572e0` | §0.6 is the K-sheaf/sheaf equivalence on locally compact Hausdorff spaces; §0.7 is as the Scope bullet (line 10) describes: compact-cover hypercohomology of complexes of K-presheaves on compact spaces with its spectral sequence (Lemma A.4.13), compact supports and pullbacks. |
| `TauCetiRoadmap/CharacteristicClasses/README.md:449` on main | Consumes TS1.1–TS1.2 for arbitrary spaces, as line 11 and line 221 say. |
| `TauCetiRoadmap/ComplexKahlerGeometry/README.md` K2 on main | Unchanged citation, carried from the previous report. |

Pinned libraries: `CompactSpace` at `Mathlib/Topology/Defs/Filter.lean:296` is the single field `isCompact_univ`, with no separation axiom, as the README's line 128 says; `IsCompact.elim_finite_subcover` at `Mathlib/Topology/Compactness/Compact.lean:208` and `CompactSpace.elim_nhds_subcover` at line 804 are the finite-subcover inputs the new `*Needs:*` line names. All other pinned declarations the README cites are unchanged since the previous review and are carried from its table of 25 declarations.

### Sources and seeded sample

The three cited works are in the sources cache from the previous rounds (Stacks Cohomology of Sheaves, Stacks book for Derived Categories, Pardon arXiv:1309.2370v6); no manifest exists and none was changed. Source ids below are the informal ids the previous reports used. Locators rechecked this round are those the diff touches; the remaining sampled targets (§0.1, §0.2, §1.1 except the Pardon footnote, §1.3, §2.1) are unchanged and their checks are carried from the previous report.

| Sample or changed claim | Locator and extraction | Verification |
|---|---|---|
| §1.2 finite-cover cofinality now proved here (line 128) | Pardon Lemma A.4.4, p.120: `pardon line 5267`–5271 | Source: on compact X finite open covers are cofinal, under the standing locally compact Hausdorff convention (A.0.1). README correctly attributes the Hausdorff-free form to itself and uses only `CompactSpace`. |
| §1.2 refinement independence (line 130) | Pardon Remark A.4.1, p.119: `pardon line 5231`–5236 | Different refinement maps agree on cohomology. Matches. |
| §1.2 empty-space vanishing now proved here (line 134) | Pardon Remark A.4.2, p.119: `pardon line 5237` | Source: empty covering is final among coverings of ∅, so Ȟ(∅;−)=0, for sheaves. README owns the presheaf form and cites the sheaf case. Matches. |
| §1.2 degree-zero normalization (line 134) | Pardon Definition A.4.3, p.119: `pardon line 5240`; Stacks Lemma 20.9.2 carried | Colimit over open covers of the subset-indexed complex. Matches. |
| §1.2 cover colimit preordered by refinement (line 128) | Stacks §20.15, p.24: `stacks-cohomology line 1085`–1087 | Čech cohomology as the colimit over all open coverings preordered by refinement, cohomology maps independent of the index function. Matches. |
| §1.1 order-free form “used by Pardon” (line 108) | Pardon footnote 42, p.119: `pardon line 5262`–5264 | Orientation line (ℤo₁⊕ℤo₂)/(o₁+o₂). Matches the reworded attribution. |
| §1.4 first spectral sequence, “compare” citation (line 168) | Pardon Lemma A.4.13, p.122: `pardon line 5386`–5388 | E₁^(p,q)=Ȟ^q(X;F^p) ⇒ Ȟ^(p+q), bounded-below complexes of K-presheaves, proof “the spectral sequence of the Čech double complex”. The README's indexing (p internal, q Čech) agrees; it owns the open-cover form. |
| References (line 227) | Pardon Definition A.4.10 and Lemma A.4.11: `pardon line 5341`, 5361 | No longer cited in the body (grep: no hit for A.4.10 or A.4.11), and correctly dropped from the reference list. |
| §1.3 S¹ Check reattribution (line 157) | Own computation, below | The removed phrase was an attribution to ImplicitAtlases; the values are unchanged. |

### Adversarial table

Rows marked “carried” repeat the values of the previous report (PRREVIEW-TopologicalSheafCohomology~3), which itself carried the full-review rows; the statements they concern are untouched by the diff. New rows have values computed this round.

| Statement | Instances and values computed on each side | Result | Change / provenance |
|---|---|---|---|
| §0.1 equivalence Sh(X;R-Mod) ≃ Mod(R_X) | Two discrete points: Γ(R_X)=ℤ², r↦(r,r); (2,3)·(a,b)=(2a,3b); restriction along R→Γ(R_X) gives 2·(a,b)=(2a,2b); stalks of R_X are ℤ | Consistent | Carried from ~3 |
| §0.1 extension of scalars | ℤ→ℚ: ℤ↦ℚ, ℤ/2↦0, 0→ℤ→ℤ→ℤ/2→0 ↦ 0→ℚ→ℚ→0 exact; ℤ→𝔽₂: ×2 ↦ 0 on 𝔽₂, kernel 𝔽₂ | Consistent | Carried from ~3 |
| §0.1 zero ring | R=0: all modules 0, both sides 0 | Consistent | Carried from ~3 |
| §0.1 V RⁿΓ_R ≅ Hⁿ U | Point, R=ℤ/4, F=ℤ/4: H⁰=ℤ/4 both sides, 2·1=2, Hⁿ=0 for n>0; ℤ/2 injective as module, not divisible as group, H¹=0 both; X=∅: 0 | Consistent | Carried from ~3 |
| §0.1 acyclic-resolution comparison | Point, M=ℤ/4: Godement terms M, differentials 0,1,0,1,…; H⁰=M, Hⁿ=0; on S¹ the constant sheaf is not Γ-acyclic (R¹Γ=ℤ) | Consistent | Carried from ~3 |
| §0.1 flasque closure | Point: 0→ℤ→ℤ→ℤ/2→0 exact after Γ; two points: A×B→A onto | Consistent | Carried from ~3 |
| §0.2 point complex ℤ→ℤ, ×2 | H⁰=0, H¹=ℤ/2; identity complex 0; zero differential ℤ,ℤ | Consistent | Carried from ~3 |
| §0.2 shift sign | ℤ[1] in degree −1; ×2 becomes −2 | Consistent | Carried from ~3 |
| §0.2 finite diagonal | b=−2, m=0: three terms; no bound: (k,−k) | Consistent | Carried from ~3 |
| §1.1 repeated two-index point cover | C⁰=ℤ², C¹=ℤ, d(a,b)=b−a; H⁰=ℤ diagonal, H¹=0 | Consistent | Carried from ~3 |
| §1.1 bounds and empty family | Two indices: ordered C²=0, tuple C² has 8 coordinates; empty family: 0 | Consistent | Carried from ~3 |
| §1.1 composition of refinements | (2,3,5)↦5↦5; composite index selects 2 | Consistent | Carried from ~3 |
| §1.1 chosen order, orientation line | Reversal: d'(b,a)=a−b=−(b−a); mod 2 agree; o₁+o₂=0 | Consistent | Carried from ~3 |
| §1.1 prism sign | Singleton refining the repeated cover: on (2,3), T₁−T₀=1, hδ=1, δh=0 | Consistent | Carried from ~3; the Stacks display recomputed below under Source issues |
| §1.2 smallness | X→Opens X and Σ n, ULift(Fin n)→Opens X are in Type u | Consistent | Carried from ~3 |
| §1.2 raw category not filtered | Constant index functions 0,1 cannot be equalized by nonempty J′ | Consistent | Carried from ~3 |
| §1.2 two discrete points | Singleton cover: C⁰=A×B, C¹=F(∅)=0; restriction is the projection | Consistent | Carried from ~3 |
| §1.2 point-neighborhood cofinality (line 128, 132) | Wₓ=Uₓ∩Vₓ∋x refines both; repeated point cover raw maps 2,3 on (2,3), both send (a,a) to a | Consistent | Carried from ~3 |
| §1.2 ℚ negative control (line 140) | Finite refining cover lies in a bounded union of (n,n+2)∩ℚ, misses a rational; point-neighborhood refinement covers ℚ | Consistent | Carried from ~3 |
| §1.2 Sierpiński H⁰, H¹ (line 141) | d:P(X)×P({1})→P({1}), (a,b)↦b−res(a): kernel ≅P(X), cokernel 0; one-set cover: P(X), 0 | Consistent | Carried from ~3 |
| §1.2 finite-cover cofinality from `CompactSpace` alone (line 128) | Given a u-small open cover U:I→Opens X with ⋃U_i=X, compactness yields finite S⊆I with ⋃_{i∈S}U_i=X; enumerating S by Fin n gives V:ULift(Fin n)→Opens X and the inclusion S→I is an index function with V_j=U_{a(j)}⊆U_{a(j)}, so V refines U. Sierpiński space (compact, non-Hausdorff): every cover contains X, the one-set cover {X} refines each with a(∗)=the index of X; so the finite system is cofinal. X=∅: the empty family (n=0) refines every cover; it is compact. Point with the infinitely repeated cover U_i=pt, i∈ℕ: subcover {U₀}, index function 0. Negative control ℚ (not compact): no finite refinement of {(n,n+2)∩ℚ}, as in the Check. | Correct; no separation used, in agreement with the `CompactSpace` definition at the pin | New: statement moved from import to owned proof |
| §1.2 empty-space vanishing for every presheaf (line 134, Check line 142) | On ∅ with P(∅)=ℤ: one-set cover {∅} has ordered complex ℤ in degree 0, H⁰=ℤ; the two-set cover {∅,∅} has ℤ²→ℤ, (a,b)↦b−a, H⁰=ℤ, H¹=0; the empty family has the zero complex. The empty index function refines every cover of ∅ (including the one-set and two-set covers), so the empty family is the greatest element of the preorder, nothing nonempty refines it (no map J→∅ for J≠∅), and the colimit is its value, 0 in every degree. Transition maps into it are zero maps. The system of nonempty covers alone has every H⁰=ℤ with isomorphic transitions, colimit ℤ, as the Check says a system omitting the empty family would return. For a sheaf P(∅)=0 and every cover already gives 0, consistent with Pardon Remark A.4.2. | Correct, including P(∅)≠0 | New: statement moved from import to owned proof |
| §1.2 Sierpiński finite-cover sentence (line 141) | Opens are ∅, {1}, X; the point 0 lies only in X, so every cover has a member equal to X; {X} is a finite cover (n=1) refining every cover | Correct | New sentence |
| §1.3 compact Hausdorff comparison | S¹: Čech¹=ℤ=H¹; point: F(pt), 0; ∅: 0; R=0: 0 | Consistent | Carried from ~3 |
| §1.3 zero sheafification needs P(∅)=0 | {a,b}, P(∅)=ℤ, P(nonempty)=0: ordered C¹=ℤ, H¹=ℤ; P^#=0 gives 0 | Consistent | Carried from ~3 |
| §1.3 local annihilation | P({a,b})=ℤ else 0: one-set H⁰=ℤ, singleton H⁰=0, colimit 0 | Consistent | Carried from ~3 |
| §1.3 acyclic cover | S¹ one-set cover not acyclic (H¹=ℤ); two arcs with two-component intersection: fixed-cover H¹=ℤ | Consistent | Carried from ~3 |
| §1.3 S¹ Check after reattribution (line 157) | Two arcs, ℤ²→ℤ², (a,b)↦(b−a,b−a): kernel ℤ, cokernel ℤ; R¹Γ(S¹;ℤ)=ℤ; one-set cover H¹=0 | Values unchanged by the wording change | New wording checked |
| §1.4 total convention | D=δ+(−1)^p d; two paths from (0,0) contribute −1 and +1; unsigned total 2 | Consistent | Carried from ~3 |
| §1.4 conjugation | ε=(−1)^{pq}: d+(−1)^q δ; at (1,1): −1, at (0,1): +1 | Consistent | Carried from ~3 |
| §1.4 which page descends (line 169, Check line 177) | Repeated point cover, F in degree 0: Čech-degree filtration E₁=ℤ² with maps (0,1)↦0 or 1; E₂ diagonal ℤ, both identity | Consistent | Carried from ~3 |
| §1.4 cohomology presheaf at ∅ | F^q(∅)=0 so ℋ^q(∅)=0; §1.3 presheaf comparison applies | Consistent | Carried from ~3 |
| §1.4 first spectral sequence constructed here (line 168) | Filtration F^k Tot=⊕_{p≥k} by internal degree p: δ preserves p, d raises it, so both respect it. E₀ column p is (C^•(U;F^p),δ), hence E₁^(p,q)=Ȟ^q(U;F^p) with d₁ induced by d. Point, F=(ℤ --2→ ℤ) in degrees 0,1, one-set cover: E₁ row ℤ --2→ ℤ, E₂=(0,ℤ/2), abutment H⁰=0, H¹=ℤ/2, agreeing with the direct total (one term ℤ --2→ ℤ). S¹, F=ℤ in degree 0, two-arc cover: single column, E₁^(0,q)=ℤ,ℤ for q=0,1, no d₁, abutment ℤ,ℤ. F=0: every page 0. Refinement independence from E₁: the prism h maps C^(q+1)(V;F^p)→C^q(U;F^p), preserving p, so E₁ carries the cohomology maps, which are index-function independent. | Correct; indexing “p internal, q Čech” matches Pardon's E₁^(p,q)=Ȟ^q(X;F^p) | New: statement moved from import to owned construction |
| §1.4 convergence of both sequences (line 170) | Total degree m: p≥b, q≥0, p+q=m, so p∈{b,…,m}, length m−b+1 for m≥b, empty for m<b (the total complex is zero there, since Čech degree ≥0 and internal ≥b). First filtration d_r has bidegree (r,1−r) in (p,q): outgoing from (p,q) needs q+1−r≥0, r≤q+1≤m−b+1; incoming from (p−r,q−1+r) needs p−r≥b, r≤m−b. For the Čech-degree filtration the roles of p and q swap with the same bound. b=−1, m=1: (0,1),(1,0),(2,−1), r>3 suffices. Finite filtration of each total degree gives strong convergence. | Correct for both filtrations | New: “both sequences” now owned |
| §1.4 colimit over finite versus all covers (line 166) | On compact Hausdorff X, §1.2's finite system is cofinal, so colimits over it and over all u-small covers agree by the cofinal-system comparison of §1.2 (constructed through common refinements). On a point, both systems contain the one-set cover, which is cofinal in each; values coincide. | Consistent | New sentence |
| §2.1 `fiberStalkMap` direction | eqToHom then stalkPushforward; coordinate x | Consistent | Carried from ~3 |
| §2.1 two points to a point | ℤ×ℤ/2→ℤ×ℤ/2 identity, (3,1)↦(3,1) | Consistent | Carried from ~3 |
| §2.1 empty source, identity | f:∅→Y gives 0→0; id on a point gives id_M | Consistent | Carried from ~3 |
| §2.1 properness needed | (0,1)→ℝ, F=ℤ: ℤ→0 not iso | Consistent | Carried from ~3 |
| §2.1 composition | (2,3,5)↦(2,3,5) versus ((2,3),5), reindexed | Consistent | Carried from ~3 |
| §2.1 no averaging | 𝔽₂: identity on 𝔽₂² | Consistent | Carried from ~3 |
| §2.1 closed-neighborhood argument | V=Y∖f(X∖⋃Oₓ) is open, contains y, f⁻¹V⊆⋃Oₓ; glue over disjoint pieces | Consistent | Carried from ~3 |
| §2.1 no local compactness, non-Hausdorff target | ℚ identity: id on F₀; {a}→{a}⊔B indiscrete: id_M and 0→0 | Consistent | Carried from ~3 |
| §2.1 Hausdorff-source negative control | Doubled origin → ℝ: ℤ→ℤ² diagonal, not onto | Consistent | Carried from ~3 |
| Conventions and binders | R, X, Y in Type u; `properFiniteFiberStalk` has one separation binder, `T2Space X` | README and Lean agree | Carried from ~3; re-elaborated this round, types identical |
| Scope bullet on ImplicitAtlases (line 10) | Checked against `TauCetiRoadmap/ImplicitAtlases/README.md:171–205` at `3b7572e0`: §0.6 equivalence, §0.7 compact-cover hypercohomology of K-presheaf complexes on compact X (Definition A.4.10), spectral sequence (A.4.13), compact supports, pullbacks. The bullet's description is accurate; “None of these is an input here” agrees with every `*Needs:*` line. | Accurate | New wording |
| Supplier graph after the repair | Edges: this roadmap → CharacteristicClasses (main, line 449); CharacteristicClasses → ImplicitAtlases (head, line 73); no edge from ImplicitAtlases into this roadmap. The order this roadmap → CharacteristicClasses → ImplicitAtlases satisfies all edges. The dependency check reports 0 problems. | Single direction restored | Previous R01 repaired |
| Downstream consumers (line 221) | Names CharacteristicClasses (main, consumes TS1.1–TS1.2: verified) and ImplicitAtlases as a possible consumer of §1.2 and §1.4 through its §0.6 equivalence: for a complex of sheaves F on compact Hausdorff X, the compact-cover complex of α_*F and the open-cover complexes are compared degreewise by Pardon's Lemma A.4.11 argument, finite in each total degree. The paragraph claims nothing about K-presheaf complexes that are not sheaves. | Accurate as a consumer statement | New wording |
| References (line 227) | Pardon locators listed: A.0.1, A.3.2, A.4.1–A.4.3, footnote 42, A.4.4, A.4.8, A.4.13; each is cited somewhere in the body (lines 108, 128, 134, 168, 197). A.4.10 and A.4.11 are cited nowhere and are dropped. | Consistent | New wording |

## Not verifiable

- Ownership against open pull requests whose files the brief did not supply was not checked; the supplied ImplicitAtlases checkout at `3b7572e0` was read directly.
- The advanced comparison theorems (§§1.3–1.4) remain implementation targets with no native carrier; elaboration and the finite computations above establish consistency of the statements, not their proofs.
- No cited text was inaccessible; all three works were read from the sources cache (Stacks PDFs, arXiv v6).

## Source issues

- **Misprint** in stacks-cohomology at Section 20.15 (tag 09UY), printed p.24: the source says the first refinement map minus the second equals d∘h+h∘d; on the singleton cover refining the two-index point cover the left side is ξ₀−ξ₁ and the right side is ξ₁−ξ₀, so it should be the second minus the first; affects the proof.
- **Misprint** in pardon at Remark A.4.1, printed p.119: the source says the refining member is contained in the coarser member indexed by f of a coarser index; it should be f of the refining index; affects a stated result.
