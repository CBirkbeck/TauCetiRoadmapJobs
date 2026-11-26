# Review of TopologicalKTheory (pull request #3170 at 198459f)

**Verdict:** accepted

**Summary.** An incremental re-review of the 11 lines changed since `f17d28c`, and a reading of the pull request's title and description against this head. The three small corrections of the previous review are repaired: the docstring no longer gives a variable-rank bundle category as an obstacle to the rank-k statement, the *Needs:* line of the representability paragraph of T1.6a now lists T1.2's pullback isomorphisms, the fixed-rank carrier with its CW structure and the four Mathlib declarations the paragraph uses, and the description's sentences about this folder agree with the head. No finding and no small correction; two format notes carried over from the previous review, neither blocking. One licence question stays with the human reviewers.

## N01 — `Functor.RepresentableBy` in the representability paragraph of T1.6a (README line 888) is still written without its namespace; the *Needs:* line below it (line 897) now gives `CategoryTheory.Functor.RepresentableBy`, so the two spellings would be better made one.

## N02 — The AlgebraicTopology supplier bullet (README lines 215–218) still does not mention Stage 4.7, which T1.6a consumes for the paracompactness of Hausdorff CW complexes; one clause there would keep the supplier list complete.

## Previous findings

The previous review had no findings (R); its small corrections and format notes are accounted for here.

- C01 — repaired: docstring lines 37–40 now end "no stable Grassmannian colimit carriers `Gr_k∞(𝕜)`, `BO` and `BU`, and no homotopy category of unpointed spaces."
- C02 — repaired: "*Needs:* T1.1; T1.2's pullback with its identity and composition isomorphisms; T1.4; the fixed-rank carrier with its CW structure, … Mathlib `TopCat`, `CategoryTheory.Quotient`, `ContinuousMap.Homotopic`, `CategoryTheory.Functor.RepresentableBy`."
- C03 — repaired: the description now opens "Most of them upgrade", and its TopologicalKTheory bullet says the paragraph "packages the fixed-rank classification that T1.6a plans and the pinned Tau Ceti does not prove".
- N01 — partly repaired: the *Needs:* line has the full name; line 888 still reads `Functor.RepresentableBy`. Written again as N01.
- N02 — not repaired: lines 215–218 name Stage 5.5 only. Written again as N02.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| T1.6a representability [X,Gr_k∞(𝕜)]≃Vect_k(X), whose *Needs:* line changed | X=pt⊔pt; X=S¹, 𝕜=ℝ, k=1; X=S², 𝕜=ℂ, k=1; X=S², 𝕜=ℝ, k=2 | pt⊔pt: 1=1 (Gr connected). S¹: conjugacy classes of ℤ/2 = 2 = {trivial, Möbius}. S²: ℤ=ℤ (c₁). Real rank 2 on S²: π₂(BO(2))/π₁ = ℤ/±1 = ℕ = unoriented Euler number | holds; unchanged statement |
| Each item of the new *Needs:* line is used by the paragraph | the paragraph, clause by clause | T1.2 (line 414): naturality (f∘g)*γ≅g*(f*γ); CW structure: Gr an object of HoPara via Stage 4.7; `TopCat`: the full subcategory; `Quotient`, `Homotopic`: HoPara; `RepresentableBy`: the packaging | complete, nothing superfluous |
| Docstring bullet after the repair | the pins | no `Gr_k∞` and no unpointed homotopy category at Tau Ceti `2fd255d`; constant-rank cores exist, so the dropped clause was not an obstacle | "lacks" claims true |
| `nonempty_homotopyGroup_orthogonalGroup_mulEquiv` (only declaration, untouched) | i=0, 2, 6 | index (i+1)%8: 1→ZMod 2 (π₁O=ℤ/2); 3→ZMod 0=ℤ (π₃O); 7→ℤ (π₇O) | holds, signature unchanged |

The rows of the previous review for untouched statements, the seeded targets T2.0 and T7.0 among them, stand as in the previous review, of `f17d28c`; neither seeded target lies in a changed passage.

- Source locators checked against the text: none new; the diff adds no locator.
- Library declarations opened at the pinned Mathlib: 4. `TopCat` (`Topology/Category/TopCat/Basic.lean:34`), `CategoryTheory.Quotient` (`CategoryTheory/Quotient.lean:124`), `ContinuousMap.Homotopic` (`Topology/Homotopy/Basic.lean:333`), `CategoryTheory.Functor.RepresentableBy` (`CategoryTheory/Yoneda.lean:282`).
- Cross-roadmap and internal citations resolved: AlgebraicTopology Stage 4.7 at this head (`TauCetiRoadmap/AlgebraicTopology/README.md` line 1059, paracompactness of Hausdorff CW complexes in its item list); T1.2 (README line 414); the fixed-rank carrier (README line 854).
- Record: against the merge base, no heading, layer, item or Lean declaration removed, renumbered or retitled (28 insertions, 2 deletions).
- Dependency check: `depcheck: 94 roadmaps, 1061 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Automatic checks: all pass. Elaboration of `TauCetiRoadmap/TopologicalKTheory/Suggested.lean`: exit 0, the single warning `60:8: declaration uses sorry`; its one declaration has no section binder to lose.
- Pull-request text: title ("sixteen roadmaps") agrees with the sixteen folders changed; the TopologicalKTheory bullet, "`Suggested.lean`: no declaration", the pin `2fd255d`, the claim that only DynamicalDegreesOfRationalMaps leaves its `Suggested.lean` unchanged (15 `Suggested.lean` files in the diff), and "a *Needs:* line citing pinned names" all agree with this head; no heading, declaration or supplier of this folder is removed or added, so nothing is left unstated.
- No change outside the roadmap folders the pull request owns.

Overlap check: read CharacteristicClasses (main), GeneralizedCohomology (main), HomotopySpheres (main), TangentialBordism (main), DGFloerPartII (open) and ClassifyingSpaces (this pull request), as in the previous review; nothing shared. The change adds no object.

Source independence: 2 passages compared with 1 source (changed passages only: the new *Needs:* line and the docstring bullet, against `hatcher-vbkt` Theorem 1.16), none shared; largest share Atiyah's papers together, 15 of 51 citations, and `hatcher-vbkt` 11 as the largest single text; contents not compared, since the diff adds, removes and reorders no layer.

Research link: the roadmap builds bundle classification, complex and real Bott periodicity (Atiyah–Bott 1964; Atiyah 1966) and equivariant Thom isomorphisms (Segal 1968), which the index theorem uses (Atiyah 1968). It rests on the README's overview and reference list.

## Not verifiable

- `sibson-1969` (T7.0, seeded): uncertified, cited by its locator only; untouched by this change.
- Ownership against open pull requests: not searched again, since the change adds no object; the previous review's search stands.

## Source issues

- none

## For the human reviewers

- **Licence (untouched text).** README lines 2201, 2282 and 2486 cite Atiyah, *K-theory and reality* (1966), for two headline theorems of T7.1; `packages/TopologicalKTheory/sources.toml` has no entry for it.
