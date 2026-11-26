# Review of TopologicalKTheory (pull request #3170 at 57376f9)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 27 changed lines since `87e7f72`. The change adds a paragraph to T1.6a that packages the fixed-rank classification as a representation of the rank-k bundle functor on the homotopy category of paracompact Hausdorff spaces, with two Checks, and extends one bullet of the `Suggested.lean` docstring. The mathematics holds: the bijection, its naturality and both Checks were recomputed, and the citations resolve on main and at the pins. Accepted with three small corrections (an irrelevant "missing carrier" clause in the docstring, an incomplete *Needs:* line, and a description sentence this folder contradicts) and two format notes, none blocking. The three findings of the earlier review (the unnamed source in T3.2, the pointer for the CompactGroups gap, the missing locators of T4, T5.3 and T6.7) are repaired at this head, and nothing is left for a human to decide about the change.

## C01 — The docstring lists a missing variable-rank bundle category among the obstacles for the rank-k functor, which does not need one

In the last bullet of the `Suggested.lean` module docstring (lines 37–40), "no variable-rank bundle category" is given as one reason the representability statement cannot be stated. An implementer reading this would think the pinned bundle model cannot carry the rank-k functor, but it can. `TauCeti.FiniteRankBundleCore` (`Topology/VectorBundle/FiniteRank/Basic.lean:56`) is a constant-rank bundle with a `rank` field, and `TauCeti.FiniteRankBundleCore.pullback` (`Topology/VectorBundle/FiniteRank/Pullback.lean:43`) pulls it back along any continuous map. README T1.1 already takes these cores as the small model the new paragraph uses for Vect_k. What is really missing at the pins is `Gr_k∞(𝕜)` (`Topology/Grassmannian/` has only the finite stages) and the unpointed homotopy quotient: the pinned Tau Ceti has only `TauCeti.PointedHomotopyCat`, and Mathlib has neither. Delete ", no variable-rank bundle category" from this bullet. Alternatively, keep it and name the statement in the bullet that needs it (the numerable classification for variable rank, on clopen strata).

## C02 — The *Needs:* line of the representability paragraph omits T1.2, whose pullback isomorphisms the paragraph uses

The *Needs:* line at README lines 893–894 lists T1.1, T1.4, the classification and AlgebraicTopology Stage 4.7. The functor X↦Vect_k(X) and the naturality the paragraph names, (f∘g)*γ_k≅g*(f*γ_k), both come from T1.2's pullback and its identity and composition isomorphisms. The paragraph also names three Mathlib declarations that the line does not list. Would read: "*Needs:* T1.1; T1.2's pullback with its identity and composition isomorphisms; T1.4; the fixed-rank classification and universal bundle above; AlgebraicTopology Stage 4.7; Mathlib `CategoryTheory.Quotient`, `ContinuousMap.Homotopic`, `CategoryTheory.Functor.RepresentableBy`."

## C03 — The description says every addition upgrades a bijection Tau Ceti already proves, which is not so for this folder

The description opens: "Each one upgrades a bijection or correspondence that Tau Ceti already proves as bare facts to its natural structure", and adds that each *Needs:* line cites pinned names. For TopologicalKTheory the bijection [X,Gr_k∞(𝕜)]≃Vect_k(X) is itself a planned T1.6a target. The pinned Tau Ceti has no `Gr_k∞(𝕜)`, as the head's `Suggested.lean` docstring says (lines 37–40). The new *Needs:* line also cites roadmap items, not pinned names. Would read, in the TopologicalKTheory bullet: "TopologicalKTheory, T1.6a: the infinite Grassmannian as a representing object for rank-`k` bundles on the homotopy category of paracompact Hausdorff spaces; this packages the fixed-rank classification that T1.6a plans and Tau Ceti does not yet prove." The opening sentence would say "most of them upgrade" instead of "each one upgrades".

## N01 — `Functor.RepresentableBy` (README line 888) is written without its namespace; the declaration is `CategoryTheory.Functor.RepresentableBy`.

## N02 — The AlgebraicTopology supplier bullet (README lines 215–218) does not list Stage 4.7, which T1.6a now consumes for the paracompactness of Hausdorff CW complexes; one clause there would keep the supplier list complete.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| T1.6a representability: [X,Gr_k∞(𝕜)]≃Vect_k(X), [f]↦[f*γ_k] | X=∅; pt; S¹ (ℝ, k=1); S¹ (ℂ, k=1); S² (ℂ and ℝ, k=1); k=0 | ∅: 1=1. pt: π₀=1, Vect=1. S¹: [S¹,RP∞]=2 = trivial, Möbius; [S¹,CP∞]=1=Vect. S²: ℤ=Pic; H¹(S²;ℤ/2)=0, 1=1. k=0: 1=1 | holds; `hatcher-vbkt` line 1161 (Thm 1.16, p. 29), paracompact includes Hausdorff (line 1381) |
| Naturality as `homEquiv_comp` | f:X′→X, g:X→Gr | homEquiv(f≫g)=[(g∘f)*γ]; F.map f.op[g*γ]=[f*(g*γ)]; equal by the composite-pullback isomorphism; README's (f∘g)*γ≅g*(f*γ) is the same with the letters swapped | holds; Mathlib `CategoryTheory/Yoneda.lean:282` |
| HoPara and Vect_k a functor on it | f₀≃f₁:X→Y with X paracompact Hausdorff; universes | X×I paracompact Hausdorff, so T1.4 gives f₀*E≅f₁*E; `Homotopic.comp` and `equivalence` (`Topology/Homotopy/Basic.lean:350`, `:354`) make a congruence; cores of X:Type u live in Type u | holds |
| Gr_k∞(𝕜) an object of HoPara | CW topology; AlgebraicTopology §4.7 | §4.7 (main line 1084, head 1085) owns the paracompactness of Hausdorff CW complexes; `hatcher-vbkt` line 1445, Prop. 1.20, p. 36 | holds |
| Check over [0,1] | k=0, 1; 𝕜=ℝ, ℂ | Vect_k([0,1])=1; the constant maps at span(e₀..e_(k−1)) and span(e₁..e_k) differ for k≥1; at k=0, C([0,1],pt)=1, so k≥1 is needed. On TopCat, C([0,1],Y)=1 forces Y=pt, yet Vect₁(S¹)=2 | holds |
| Check over S¹ | π₁(RP∞)=ℤ/2 | free classes ↔ conjugacy classes of ℤ/2: 2; real lines on S¹: trivial and Möbius, 2 | holds |
| Docstring bullet (C01) | Mathlib and Tau Ceti at the pins | no unpointed homotopy category (only `TauCeti.PointedHomotopyCat`); no Gr_k∞ (finite stages only); constant-rank cores with `pullback` exist | "lacks" claims true; variable-rank clause irrelevant |
| T1.4 input, Prop. 1.7 | `hatcher-vbkt` line 794, p. 20 | paracompact X: the restrictions over X×{0} and X×{1} are isomorphic | supports the functoriality step |
| T2.0 (seeded) | pt; ∅; TS²; ∐ₙpt; ℝ | (ℂⁿ,ℂᵐ)↦n−m; 1=0; [TS²]=2 with G=1; (n)ₙ∈∏ℤ, not ⊕ℤ; K⁰(ℝ)=ℤ, K_c⁰(ℝ)=0 | holds; `hatcher-vbkt` lines 1504–1558 (pp. 39–40), Prop. 2.1 line 1522 |
| T7.0 (seeded) | sh_* on π_n; track k=1,N=2; k=0,N=1; k=N | sh_*(a,b)=(a,a+b), inverse (a,b−a); e₁→e₂→e₀; e₀→e₁→e₀ backtracking (second turn is the first's inverse); constant path | holds; Sibson uncertified |
| `nonempty_homotopyGroup_orthogonalGroup_mulEquiv` (headline, unchanged) | elaborated type; k=1 entry | type as in README; table entry at k=1 is 2 by `decide`, π₁O(n)=ℤ/2 for n≥3 | unchanged, holds |

- **Earlier findings.** All three are repaired at this head. T3.2 now names its sources: Atiyah–Bott–Shapiro §§7–9 and Segal Prop. (3.1), p. 139, with (A.1), p. 148 (README lines 1367–1374). The gap is "under its Layer 5 contract `gap:banach-gfinite-density`" with no roadmap named (lines 266, 1653). T4 cites Hatcher Theorem 2.2, p. 41 (lines 1450–1452); T5.3 and T6.7 cite Segal Prop. (3.2), p. 140 (lines 1616, 1941).
- **Automatic checks.** Every check passes except outside-folder (29 files), and all 29 lie in folders named as this pull request's own; the filtered `git diff --stat` is empty.
- **Dependency check.** `depcheck: 121 roadmaps, 1389 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/TopologicalKTheory/Suggested.lean` exits 0 with the one `sorry` warning (60:8). `#check @` of its one declaration shows no lost binder and a type equal to the README statement; the declaration is untouched by the diff.
- **Source locators: 6 checked** in `hatcher-vbkt`: Theorem 1.16 (line 1161), the definition of paracompact (1381), Proposition 1.7 (794), Proposition 1.20 (1445), §2.1 and Proposition 2.1 (1504–1558).
- **Library declarations opened: 8.** Mathlib: `CategoryTheory.Functor.RepresentableBy` (`CategoryTheory/Yoneda.lean:282`, target universe independent of the Hom universe), `CategoryTheory.Quotient` (`CategoryTheory/Quotient.lean:124`), and `ContinuousMap.Homotopic` with `comp` and `equivalence` (`Topology/Homotopy/Basic.lean:333`, 350, 354). Tau Ceti: `FiniteRankBundleCore` (`Topology/VectorBundle/FiniteRank/Basic.lean:56`), `FiniteRankBundleCore.pullback` (`Pullback.lean:43`), `PointedHomotopyCat` (`AlgebraicTopology/Homotopy/PointedHomotopyCat.lean`). `Topology/Grassmannian/` has no colimit carrier, and neither pin has an unpointed homotopy category of spaces.
- **Cross-roadmap citations: 1 new**, AlgebraicTopology Stage 4.7, resolved on main and at this head with the same text. This pull request's AlgebraicTopology changes drop no id cited here.
- **Pull-request text.** The TopologicalKTheory bullet matches the head. No heading, layer, item or declaration is removed, and no supplier is added or dropped (AlgebraicTopology was already one). C03 is the one sentence the head contradicts.

Overlap check: read CharacteristicClasses (main), GeneralizedCohomology (main), HomotopySpheres (main), TangentialBordism (main), DGFloerPartII (#1799) and ClassifyingSpaces (this pull request); nothing shared. The unpointed homotopy category of paracompact Hausdorff spaces and the representability of Vect_k have no other owner: ClassifyingSpaces §1.4 and GeneralizedCohomology use the pinned pointed homotopy category, and CharacteristicClasses consumes T1.6a.

Source independence: 4 passages compared with 1 source (changed passages only: the new paragraph, its two Checks and the docstring bullet, against `hatcher-vbkt` Theorem 1.16, Propositions 1.7 and 1.20), none shared beyond the forced formula [f]↦f*(E); largest share `hatcher-vbkt`, 11 of 51 source citations; contents not compared, since the diff adds, removes and reorders no layer.

Research link: the roadmap builds the classification of bundles, complex and real Bott periodicity (Atiyah–Bott 1964, Atiyah 1966) and equivariant Thom isomorphisms (Segal 1968) that the index theorem for families uses (Atiyah 1968). This rests on the README's overview and its references.

## Not verifiable

- `sibson-1969` (T7.0, seeded): uncertified, cited by its locator only.
- Ownership against open pull requests was checked through `roadmaps grep` for homotopy categories of spaces and `RepresentableBy`, and through the DGFloerPartII and ClassifyingSpaces checkouts.

## Source issues

- none

## For the human reviewers

- **Licence (untouched text).** README lines 2198, 2279 and 2483 cite Atiyah, *K-theory and reality* (1966), for two headline theorems of T7.1. The work still has no entry in `packages/TopologicalKTheory/sources.toml`.
