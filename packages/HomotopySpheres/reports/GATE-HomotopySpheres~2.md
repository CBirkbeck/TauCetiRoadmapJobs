# GATE-HomotopySpheres~2: answers to human review of the HomotopySpheres pull request

Head before: `52ebd6f`. Head after: `8a5be10`. Three commits, each touching only
`TauCetiRoadmap/HomotopySpheres/README.md` and `TauCetiRoadmap/HomotopySpheres/Suggested.lean`.
The one review (roed-math, 2026-11-06) makes four points, numbered H01–H04 in order.

## H01 (roed-math) — applied

The stable James splitting is now a §3B target: new `#### 3B.6 James splitting after one suspension` (README line 895). It proves the one-suspension splitting `ΣJ_n X ≃ ⋁_(k≤n) ΣX^∧k` (n ≤ ∞, compatible with the word filtration) and the product splitting it is built from, natural up to based homotopy (Hatcher, Propositions 4I.1–4I.2, pp.467–468). With 3B.4 it gives `ΣΩΣX ≃ ⋁ ΣX^∧k`. Through GeneralizedCohomology G2 items 4–5 it gives the requested natural stable form `Σ∞ΩΣW ≃ ⋁_(r≥1) Σ∞W^∧r` and the unreduced form `Σ∞(ΩΣW)₊ ≃ S ∨ ⋁_(r≥1) Σ∞W^∧r`. The Check that relied on an unstated splitting (old line 883, inside 3B.4) moved into 3B.6's Checks, where the splitting is now proved.

- The route is Hatcher's: sections s_k from the iterated product splitting, a homology isomorphism by induction on the filtration, then homological Whitehead. The higher James–Hopf maps the reviewer suggested are named as an alternative route; either route must give the filtration compatibility.
- Ownership: no roadmap on main or in an open pull request owns either splitting. `roadmaps grep` for `James splitting`, `stable splitting`, `Σ(X×Y) ≃` and `Proposition 4I` finds only HomotopySpheres and the two consumers. This roadmap owns J X, so it owns the splitting.
- Consumers: GeneralAlgebraicKTheoryPartII and ChromaticHomotopyTheory are at positions 319 and 320 of the merge order, after HomotopySpheres at 66, so supply runs downward. The new `## Downstream consumers` sentence names GeneralAlgebraicKTheoryPartII §§4.33 and 7.7. ChromaticHomotopyTheory's current head (`839e6dc`) takes the splitting only through GeneralAlgebraicKTheoryPartII §4.33.
- What §7.7 uses is additive: it needs the S-summand to be the augmentation, which it is. 3B.6 supplies no multiplicative "tensor algebra" structure.
- Supplier added: GeneralizedCohomology G2 items 4–5 (on main), recorded in the supplier contracts and in the 3B and 3B.6 `*Needs:*` lines.

## H02 (roed-math) — applied

AlgebraicTopology now owns the compact-generation foundation, and §3A consumes it.

- **Scope bullet (old lines 128–133):** "This roadmap packages `TopologicalSpace.compactlyGenerated` as the right adjoint `k` …" becomes "AlgebraicTopology Stage 4 item 8, *Compact generation and the pointed adjunction*, owns …". The bullet lists the coreflection, products, exponentials, CW comparisons, closed sequential colimits, smash product, reduced suspension, loops and the suspension–loop adjunction. §3A keeps cones, mapping cones, cofiber/Puppe sequences, pointed mapping cylinders, the co-H structure, stabilization and stems.
- **§3A.1:** the target is deleted. A two-sentence id map at the head of §3A (line 696) says that citations of 3A.1, and of 3A.2 for suspension, loops, smash or the adjunction, refer to that AlgebraicTopology item. This keeps the citing roadmaps resolvable: AlgebraicTopology on main, RiemannianGeometry and DGFloerPartII all cite HomotopySpheres 3A.1.
- **§3A.2:** no longer builds suspension, loops or smash, and no longer proves the adjunction. Its compact-generation, smash-product and loop-space Checks were removed with the targets. The suspension Checks became three co-H Checks.
- **Other references:** every `*Needs:*` line that cited 3A.1, or cited 3A.2 for smash/suspension/adjunction, now cites AlgebraicTopology Stage 4 item 8 (or item 4 for sphere smash degrees). That covers 3A.3, 3B.1, 3B.3, 3C.1 items, 3C.4, 3C.5, 4A.1, 4A.3 and 4C. The Conventions and supplier contracts are updated too, and old lines 2898–2899 ("AlgebraicTopology Stage 4.5 uses … 3A.1") are deleted.
- **Why AlgebraicTopology is the owner:** §3A.2 needs AlgebraicTopology Stages 4.5 and 8, so an owner here made the two roadmaps depend on each other. AlgebraicTopology is on main, so it is the earlier owner.
- **Dependency on an open revision:** the item exists only in the two open AlgebraicTopology revisions. In #1663 it is Stage 4 item 8; in #1652 it is Layer 4.0. Both carry the same title, and the README cites both the number and the title.

## H03 (roed-math) — applied differently

**What changed.** The AlgebraicTopology contract (Scope, lines 71–75, and `**From TauCetiRoadmap.AlgebraicTopology.**`, line 361) no longer names `relativeHurewicz` or `poincareDualityMap_isIso`. It cites:

- relative Hurewicz for based cofibration pairs as Stage 8 item 4;
- Poincaré–Lefschetz duality by cap product with the fundamental class, twisted by the orientation system, as Stage 6 item 4;
- `homologicalWhitehead` (Stage 8 item 5) and `compactManifoldFiniteCWType` (Stage 8 item 7), which keeps those two names.

**Why these ids work everywhere.** All four ids name the same content on main and at both heads: #1663 keeps the Stage numbering, and #1652 has Layers 8.4, 6.4, 8.5 and 8.7. Both surviving names exist on main, at #1652 (`Suggested.lean` lines 245 and 276) and at #1663 (lines 564 and 517). So this point needs no dependency on either rewrite, and no PR-description dependency for it.

**Why not the suggested name.** `poincareDuality_of_fundamentalClass` exists only at #1663, so naming it would tie the roadmap to that one revision.

**Same defect elsewhere.**

- GeometricTopology "Layer 6 supplies oriented cobordisms in general dimension" (old line 317, and Scope line 89) cites content that #903's head (`bbf8ce8`) removes; its Layer 6 is knot concordance only. Both places now cite TangentialBordism B1.1–B1.2, which already supplies those witnesses. The GeometricTopology contract now also names Layer 5's general-dimension surgery on framed spheres, which the 7A/7B `*Needs:*` lines already used (main line 546; #903 head §5.2).
- DifferentialGeometry Layer 10 (degree, and Sard), flagged in the overlaps file, is unchanged; see the note on #886 below.

## H04 (roed-math) — disputed

No change: the overlap is already settled in favour of this roadmap. At #903's current head (`bbf8ce8`), GeometricTopology has no handle-decomposition section. Its §1.6 is "PL manifolds through charts". Its Scope (lines 121–126) says HomotopySpheres owns:

- the ordered Morse handle decomposition, reordering, creation and cancellation, handle slides and the same-index basis change;
- the local Whitney move, and Whitney discs in codimension ≥ 3 and on the five-dimensional level;

citing "HomotopySpheres §§1.2–1.6". Its consumers paragraph (lines 12994–12995) says the same. The reviewer checked head `309be2f`; #903's own commit `c8664b7e`, "handle decompositions and Whitney move deferred to HomotopySpheres §§1.2–1.6", made the change after it. GeometricTopology on main has no handle cancellation or Whitney move either. Sections 1.2–1.6 keep their numbers and content, so #903's citation resolves: 1.2 decomposition, cancellation and slides; 1.4 Whitney move; 1.5 codimension ≥ 3; 1.6 the five-dimensional level. Both are built on GeometricTopology Layer 1 handle attachment and tubes, as #903 states.

## Other change needed for the gate

At `52ebd6f` the gate failed `statement-hygiene=7`: seven theorems concluded `Nonempty (A ≃ B)` without a `nonempty_*` name. None of them has a canonical map at the pins: the Bott map, ν², σ and the clutching generators are all absent, and no diffeomorphism is canonical. So the honest form is the existence corollary, and they were renamed:

| Old name | New name |
| --- | --- |
| `orthogonalGroup_bottPeriodicity` | `nonempty_orthogonalGroup_bottPeriodicity` |
| `orthogonalGroup_thirdHomotopyGroup` | `nonempty_orthogonalGroup_thirdHomotopyGroup` |
| `orthogonalGroup_seventhHomotopyGroup` | `nonempty_orthogonalGroup_seventhHomotopyGroup` |
| `orthogonalGroup_eighthHomotopyGroup` | `nonempty_orthogonalGroup_eighthHomotopyGroup` |
| `sphere_homotopyGroup_sixthStem` | `nonempty_sphere_homotopyGroup_sixthStem` |
| `sphere_homotopyGroup_seventhStem` | `nonempty_sphere_homotopyGroup_seventhStem` |
| `smoothPoincareSix` | `nonempty_diffeomorph_sphere_six` |

- No other roadmap cites any of the old names (`roadmaps grep`, main and all open heads).
- The README now says these assert that some isomorphism exists (lines 1491–1495, 2616–2617, 2747–2748). It also says the oriented theorem proves that a diffeomorphism satisfying the derivative equation exists; it no longer "returns the subtype", which the Lean `∃` did not do.
- The module docstring says why the canonical forms are not statable, and lists the James splitting (and its stable form's missing spectra) among the unstatable Section 3B results.

## Overlaps and ownership

- **Only an open revision defines:** AlgebraicTopology Stage 4 item 8, *Compact generation and the pointed adjunction*. It is #1663's Stage 4 item 8 and #1652's Layer 4.0, with the same title. Whichever revision merges first must merge before this roadmap; the worker should name that in the merge-order paragraph.
- **#284 (draft):** it also creates `TauCetiRoadmap/HomotopySpheres/` and conflicts in both files; one of #284 and #1287 has to be closed or rebased on the other before either merges. AlgebraicTopology on main still links HomotopySpheres §3A to #284. The id map at the head of §3A covers that citation.
- **#886 (DifferentialGeometry Layer 10 dropped):** at #886's head, Sard and degree move to DeRhamCohomologyAndDuality. That roadmap is at merge-order position 381, after this one at 66, so it cannot be cited here. Its own head (#1768, `TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md` lines 7–8 and 49) still attributes Sard and degree to DifferentialGeometry Layer 10. The citation stays as on main. The two open pull requests disagree with each other; moving Brouwer degree into this roadmap would be the wrong owner. This item is left open.
- **Ownership against open pull requests:** checked with `roadmaps grep` over main and all 466 open heads, for the James and product splittings and for handle theory. The compact-generation foundation was compared against the #1652 and #1663 heads above.

## Adversarial pass on the statements added or changed

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Product splitting `ΣX∨ΣY∨Σ(X∧Y) → Σ(X×Y)` with the three retractions | X=Y=*; X=*, Y=S¹; X=Y=S¹; X=Y=S⁰ | `*`; `ΣS¹=S²` on both sides; H₂(ΣT²)=ℤ², H₃=ℤ vs S²∨S²∨S³; Σ(4-point set)=⋁₃S¹ vs S¹∨S¹∨Σ(S⁰∧S⁰)=⋁₃S¹ | holds, with no connectivity hypothesis (Hatcher's geometric proof) | Direction fixed to wedge → Σ(X×Y), so "composite with Σp_X is the wedge projection" is well-typed |
| s_k section of ΣJ_kX → ΣX^∧k | k=1; X=* | k=1: X^×1=X, q=id, s₁=id of ΣJ₁X=ΣX; X=*: all points | holds | none |
| Wedge of s₁…sₙ is an equivalence onto ΣJ_nX (X path-connected) | n=0; n=1; X=S¹ (n=∞); X=S² (n=2); X=* | n=0: empty wedge = Σ*; ΣJ(S¹): H̃_k(ΩS²)=ℤ for every k≥1 vs ⋁S^(k+1); Cartesian powers would give H₂ of rank 1+2=3 | holds; path-connectedness is needed for Whitehead even at finite n | Negative-control Check (Cartesian powers) added |
| Not a wedge before suspension | J₂(S²)=S²∪_[ι₂,ι₂]e⁴ | x²=±2y (Hopf invariant of [ι₂,ι₂]=2η₂, per 3C.1) vs 0 in S²∨S⁴; ΣJ₂(S²)≃S³∨S⁵ since Σ of a Whitehead product is null | splitting needs the suspension | Check added |
| Integral Tor summand | X=M(ℤ/2,2) | H̃₅(X)=0; Künneth H̃₅(X∧X)=Tor(ℤ/2,ℤ/2)=ℤ/2; X^∧3 is 5-connected (1+1+1, then 3+1+1); so H̃₅(ΩΣX)=ℤ/2; tensor algebra on H̃_*(X), all in even degrees: 0 | holds | Check moved from 3B.4 into 3B.6 |
| Naturality up to based homotopy | f: S¹→S¹ of degree 2 | Σf^∧k has degree 2^k on S^(k+1); ΩΣf on H_*(ΩS²)=T(x), |x|=1: x^k↦2^k x^k | agree; "degree 2 on every summand" fails at k=2 (2≠4) | Check added |
| Stable form `Σ∞ΩΣW ≃ ⋁ Σ∞W^∧r` and the unreduced form | W=*; W=S² | Σ∞*=0 = empty wedge; Σ∞ΩS³ ≃ ⋁Σ∞S^(2r), rational homology ℚ in positive even degrees = H_*(ΩS³;ℚ)=ℚ[x₂] in positive degrees | holds; uses only additive structure | "inverse to the quotient" corrected to "section of the quotient" (a quotient onto a summand is not invertible) |
| Co-H structure on reduced suspension | ΣS⁰=S¹; Σ²S⁰=S² | pinch+fold degree 2 vs projection degree 1; id + reflection: 1+(−1)=0 vs identity-as-inverse: 2; on S¹ swapped pinch is ba≠ab in F(a,b); on S², (1,1)=(1,1) in π₂(S²∨S²)=ℤ² | holds; single suspension is not cocommutative | Checks rewritten for the co-H structure |
| Puppe sequence of id_* | one-point space | every term a point; [−,Y]_* one-element; an uncollapsed meridian gives an interval | holds | Check reworded (no longer tests AlgebraicTopology's suspension) |
| O(r)→O(r+1) closed, so the colimit is computed in TopCat | r=0,1,2 | continuous injection of compact O(r) into Hausdorff O(r+1) is a closed embedding (O(0)={1}→O(1)={±1}) | holds | Sentence added to 4A.1 |
| J_rX is a closed subcomplex of J_(r+1)X | X=*, X=S¹ | J_r*=*; J₁S¹=S¹ ⊂ J₂S¹ = S¹∪e² | holds for CW X pointed at a 0-cell | Sentence added to 3B.1 |
| AlgebraicTopology contract ids | main, #1663, #1652 | Stage 8 item 4 = relative Hurewicz (main line 1694; #1663 line 1922; #1652 §8.4 line 2590); Stage 6 item 4 = Poincaré–Lefschetz by cap (main 1515; #1663 1674; #1652 §6.4 2212); Stage 8 items 5, 7 = Whitehead, CW type (main 1700, 1811) | resolve at all three | Names replaced by ids, as in H03 |
| Renamed existence headlines | all seven | elaborated types identical before and after, apart from the names (scratch `#check @name` on all 18 declarations) | unchanged mathematics | Names and README wording, as above |

## Checks run

- **Signatures:** a scratch file with `#check @TauCetiRoadmap.HomotopySpheres.<name>` for all 18 declarations was elaborated twice, before and after the renames (exit 0, no errors). Each elaborated type was compared with the previous round's, and they are unchanged apart from the seven names. The only Lean edits this round are those names and the module docstring; no binder or hypothesis changed.
- **Source:** Hatcher, *Algebraic Topology* (author page), id `hatcher-at`, read through the sources service. Proposition 4I.1 is at `hatcher-at line 20117` (p.467), Proposition 4I.2 and its proof at `hatcher-at line 20146` (p.468). The roadmap has no `sources.toml` and this job does not edit a manifest. No `needs-references.toml` is outstanding.

## Build

`lake build TauCetiRoadmap.HomotopySpheres.Suggested` at `3b5a96c` (the last commit touching `Suggested.lean`; `8a5be10` changes only the README): `Build completed successfully (8979 jobs).`, exit 0. Its only warnings are `declaration uses 'sorry'` on the stated theorems.

## Gate

`gate HomotopySpheres: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck (`gate --depcheck … --movable`): `depcheck: 239 roadmaps, 2360 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.

`roadmaps resolve TauCetiRoadmap/HomotopySpheres/README.md`: no cross-roadmap citation found nowhere, and no Lean name found nowhere.

The review text contained no instructions beyond its mathematical suggestions; nothing suspicious to quote.
