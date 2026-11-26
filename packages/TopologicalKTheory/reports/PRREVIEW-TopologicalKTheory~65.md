# Review of TopologicalKTheory (pull request #3170 at f17d28c)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 27 changed lines since `87e7f72`. The change adds to T1.6a a paragraph that packages the fixed-rank classification as a representation of the rank-k bundle functor on the homotopy category of paracompact Hausdorff spaces by `Gr_k∞(𝕜)`, with one new Check, and extends one bullet of the `Suggested.lean` docstring; the bijection, its naturality, the functoriality on the homotopy quotient and both halves of the Check were recomputed, the sources read at their locators, and the citations resolved on main and at the pins. The mathematics holds, so the folder is accepted, with three small corrections (a docstring clause naming a carrier the statement does not need, an incomplete *Needs:* line, a description sentence this folder contradicts) and two format notes, none blocking. The earlier review had no findings; this folder's text is the same as the one it read, so its corrections are restated here. Nothing about the change is left for a human to decide.

## C01 — The docstring gives a missing variable-rank bundle category as an obstacle to a statement about rank-k bundles, which does not need one

In the last bullet of the `Suggested.lean` module docstring (lines 37–40), "no variable-rank bundle category" stands among the reasons the classification and its representability cannot be stated. An implementer would conclude that the pinned bundle model cannot carry the rank-k functor, and it can: `TauCeti.FiniteRankBundleCore` (`Topology/VectorBundle/FiniteRank/Basic.lean:56`) is a constant-rank core with a `rank` field, `TauCeti.FiniteRankBundleCore.pullback` (`Topology/VectorBundle/FiniteRank/Pullback.lean:43`) pulls it back along any continuous map, and T1.1 of the README takes exactly these cores as the small model the new paragraph uses for Vect_k. What the pins lack is `Gr_k∞(𝕜)` (`Topology/Grassmannian/` holds finite stages only) and an unpointed homotopy category of spaces (Tau Ceti has only `TauCeti.PointedHomotopyCat`; Mathlib has none). Would read without ", no variable-rank bundle category"; or keep the clause and say which statement of the bullet needs it (the variable-rank classification on clopen strata).

## C02 — The *Needs:* line of the representability paragraph omits T1.2, whose pullback isomorphisms the paragraph uses

The line (README lines 893–894) lists T1.1, T1.4, the classification and AlgebraicTopology Stage 4.7. The functor X↦Vect_k(X) and the naturality the paragraph names, (f∘g)*γ_k≅g*(f*γ_k), rest on the pullback of T1's item 2 with its identity and composition isomorphisms (line 414), and the paragraph names three Mathlib declarations the line does not list. Would read: "*Needs:* T1.1; T1.2's pullback with its identity and composition isomorphisms; T1.4; the fixed-rank classification and universal bundle above; AlgebraicTopology Stage 4.7; Mathlib `CategoryTheory.Quotient`, `ContinuousMap.Homotopic`, `CategoryTheory.Functor.RepresentableBy`."

## C03 — The description says every addition upgrades a bijection Tau Ceti already proves and cites pinned names, which is not so for this folder

The description opens: "Each one upgrades a bijection or correspondence that Tau Ceti already proves as bare facts to its natural structure", and says each addition has "a *Needs:* line citing pinned names". For this folder the bijection [X,Gr_k∞(𝕜)]≃Vect_k(X) is itself a planned target of T1.6a: the pinned Tau Ceti has no `Gr_k∞(𝕜)`, as the head's own docstring says (lines 37–40), and the new *Needs:* line cites roadmap items, no pinned name. The TopologicalKTheory bullet would read: "TopologicalKTheory, T1.6a: the infinite Grassmannian as a representing object for rank-`k` bundles on the homotopy category of paracompact Hausdorff spaces; this packages the fixed-rank classification that T1.6a plans and Tau Ceti does not yet prove", and the opening sentence "most of them upgrade".

## N01 — `Functor.RepresentableBy` (README line 888) is written without its namespace; the declaration is `CategoryTheory.Functor.RepresentableBy`.

## N02 — The AlgebraicTopology supplier bullet (README lines 215–218) does not mention Stage 4.7, which T1.6a now consumes for the paracompactness of Hausdorff CW complexes; one clause there would keep the supplier list complete.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| T1.6a representability: [X,Gr_k∞(𝕜)]≃Vect_k(X), [f]↦[f*γ_k] | X=∅; pt; S¹ (ℝ and ℂ, k=1); S² (ℂ and ℝ, k=1); k=0 | ∅: 1=1. pt: π₀(Gr)=1=Vect. S¹: [S¹,RP∞]=2=Vect; [S¹,CP∞]=1=Vect. S²: ℤ=Pic; H¹(S²;ℤ/2)=0, 1=1. k=0: 1=1 | holds; `hatcher-vbkt` line 1161 (Thm 1.16, p. 29) |
| Naturality as `homEquiv_comp` | f:X′→X, g:X→Gr | homEquiv(f≫g)=[(g∘f)*γ]; F.map f.op [g*γ]=[f*(g*γ)]; equal by the composite-pullback isomorphism, the README's formula with letters exchanged | holds; Mathlib `CategoryTheory/Yoneda.lean:282`, `:285` |
| HoPara is a category; Vect_k descends to it | f₀≃f₁:X→Y, X paracompact Hausdorff; universes | `Homotopic.comp`, `equivalence` (`Topology/Homotopy/Basic.lean:350`, `:354`) give the congruence; T1.4 on X×I gives f₀*E≅f₁*E; cores over X:Type u lie in Type u (T1.1) | holds |
| Gr_k∞(𝕜) is an object of HoPara | Hausdorff CW; AlgebraicTopology §4.7 | §4.7 states the paracompactness of Hausdorff CW complexes (head line 1085, same text on main); `hatcher-vbkt` line 1445 (Prop. 1.20, p. 36) | holds |
| New Check, X=[0,1] | k=0, 1; 𝕜=ℝ, ℂ | Vect_k([0,1])=1; constant maps at span(e₀..e_(k−1)) and span(e₁..e_k) differ for k≥1; k=0: C([0,1],pt)=1, so "k≥1" is needed and stated | holds |
| New Check, X=S¹ | π₁(RP∞)=ℤ/2 | free classes = conjugacy classes of ℤ/2 = 2; real lines on S¹: trivial, Möbius = 2 | holds |
| Docstring bullet (C01) | the pins | no `Gr_k∞` (nine files in `Topology/Grassmannian/`, finite stages); no unpointed homotopy category; constant-rank cores with `pullback` exist | "lacks" claims true; variable-rank clause not needed |
| T1.4 input | `hatcher-vbkt` line 794 (Prop. 1.7, p. 20) | paracompact X: restrictions to X×{0}, X×{1} isomorphic | supports functoriality |
| T2.0 (seeded) | pt; ∅; TS²; ∐ₙpt; ℝ | (ℂⁿ,ℂᵐ)↦n−m; 1=0; TS²⊕1≃1³ so [TS²]=3−1=2, G=1; (n)ₙ∈∏ℤ∖⊕ℤ; K⁰(ℝ)=ℤ, K_c⁰(ℝ)=K̃⁰(S¹)=0 | holds; `hatcher-vbkt` lines 1504–1558 (pp. 39–40), Prop. 2.1 at 1522 |
| T7.0 (seeded) | sh_* on π_n; track at k=0; k=N | (a,b)↦(a,a+b), inverse (a,b−a), composite (a,b); k=0: e_i→e_(N+i)→e_i, second turn reverses the first; k=N: no turns, constant | holds; Sibson uncertified |
| `nonempty_homotopyGroup_orthogonalGroup_mulEquiv` (headline, untouched) | elaborated type; k=1, 3, 7 | table index (i+1)%8: k=1→2 (π₁O=ℤ/2), k=3→0 (ℤ), k=7→0 (ℤ), k=2→1 (trivial) | holds, unchanged by the diff |

- Earlier review: it had no findings; its three small corrections and two format notes lie in text this head leaves as it was, and are restated above as C01–C03, N01, N02.
- Source locators checked against the text: 6 in `hatcher-vbkt` (Thm 1.16 line 1161 p. 29; paracompactness definition line 1381; Prop. 1.7 line 794 p. 20; Prop. 1.20 line 1445 p. 36; §2.1 lines 1504–1558; Prop. 2.1 line 1522).
- Library declarations opened: 8. Mathlib `CategoryTheory.Functor.RepresentableBy` (`CategoryTheory/Yoneda.lean:282`), `CategoryTheory.Quotient` (`CategoryTheory/Quotient.lean:124`), `ContinuousMap.Homotopic`, `.comp`, `.equivalence` (`Topology/Homotopy/Basic.lean:333`, 350, 354); Tau Ceti `FiniteRankBundleCore` (`Basic.lean:56`), `.pullback` (`Pullback.lean:43`), `PointedHomotopyCat` (`AlgebraicTopology/Homotopy/PointedHomotopyCat.lean:127`).
- Cross-roadmap citations resolved: 1 new, AlgebraicTopology Stage 4.7, on main and at this head with the same sentence; this pull request's AlgebraicTopology change (new §5.8) drops no id cited here.
- Record: no heading, layer, item or Lean declaration removed, renumbered or retitled; 25 lines added, 2 docstring lines replaced.
- Dependency check: `depcheck: 110 roadmaps, 1263 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Automatic checks: all pass. Elaboration of `TauCetiRoadmap/TopologicalKTheory/Suggested.lean`: exit 0, the single warning `60:8: declaration uses sorry`; its one declaration has no section binder to lose and its type equals the README statement.
- Pull-request text: the TopologicalKTheory bullet agrees with the head; no supplier is added (AlgebraicTopology already is one); C03 is the one sentence the head contradicts.

Overlap check: read CharacteristicClasses (main), GeneralizedCohomology (main), HomotopySpheres (main), TangentialBordism (main), DGFloerPartII (open) and ClassifyingSpaces (this pull request); nothing shared. CharacteristicClasses consumes T1.6a; GeneralizedCohomology and ClassifyingSpaces §1.4 work on the pinned pointed homotopy category; no roadmap on main or open states the unpointed homotopy category of paracompact Hausdorff spaces or the representability of Vect_k.

Source independence: 4 passages compared with 1 source (changed passages only: the new paragraph, its Check and the docstring bullet, against `hatcher-vbkt` Theorem 1.16, Propositions 1.7 and 1.20), none shared beyond the forced formula [f]↦f*(E); largest share Atiyah's papers together, 15 of 51 citations, and `hatcher-vbkt` 11 as the largest single text; contents not compared, since the diff adds, removes and reorders no layer.

Research link: the roadmap builds bundle classification, complex and real Bott periodicity (Atiyah–Bott 1964; Atiyah 1966) and equivariant Thom isomorphisms (Segal 1968), which the index theorem uses (Atiyah 1968). It rests on the README's overview and reference list.

## Not verifiable

- `sibson-1969` (T7.0, seeded): uncertified, cited by its locator only; the shear-map argument was recomputed, the page range was not read.
- Ownership against open pull requests was checked by a search of their heads for homotopy categories of spaces and `RepresentableBy`, and by reading the closest roadmaps named above.

## Source issues

- none

## For the human reviewers

- **Licence (untouched text).** README lines 2198, 2279 and 2483 cite Atiyah, *K-theory and reality* (1966), for two headline theorems of T7.1; `packages/TopologicalKTheory/sources.toml` has no entry for it.
