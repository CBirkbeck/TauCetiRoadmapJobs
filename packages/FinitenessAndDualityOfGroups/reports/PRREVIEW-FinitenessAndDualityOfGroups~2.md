# Review of FinitenessAndDualityOfGroups (pull request #2343 at b7910ae)

**Verdict:** accepted

No finding at this head.

## Previous findings

- R01 — repaired: `### From Tau Ceti`, `TauCetiRoadmap/FinitenessAndDualityOfGroups/README.md` lines 513–523, now lists `AbstractSimplicialComplex.dimension K` (with `dimension_le_iff`) and `AbstractSimplicialComplex.barycentricSubdivisionRealizationHomeomorph K`, both "Used in 5.4"; the `Realization` bullet reads "used in 5.4 and 5.5".
- R02 — repaired: `TauCetiRoadmap/FinitenessAndDualityOfGroups/Suggested.lean` lines 115, 155, 189 carry the titles of README lines 962, 1360, 1872 word for word; all eight layer comments of the file now equal the README's headings.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Contract `AbstractSimplicialComplex.dimension` (README 513–518) | complex with no face; one vertex; full simplex on `N + 1` vertices; all finite subsets of `ℕ` | `⨆` over `∅` is `⊥`; `1 − 1 = 0`; `(N + 1) − 1 = N`; `card − 1` unbounded gives `⊤`. Pinned body: `⨆ σ ∈ K, (σ.card − 1 : ℕ)` in `WithBot ℕ∞` | agrees |
| Contract `dimension_le_iff` (README 516–518) | `N = 0`; `N = 1` with a triangle; a face of `N + 2` vertices | `card − 1 ≤ 0` iff `card ≤ 1`; triangle `2 ≰ 1`; `N + 1 ≰ N`. Pinned statement has `n : WithBot ℕ∞`, so `N : ℕ` is an instance | agrees |
| Contract `barycentricSubdivisionRealizationHomeomorph` (README 519–523) | `K` an edge `{a, b}` | subdivision: vertices `{a}`, `{b}`, `{a,b}`; maximal chains `{a} ⊂ {a,b}`, `{b} ⊂ {a,b}`; vertex `{a,b}` goes to the midpoint; direction subdivision → `K` as in the pinned type | agrees |
| 5.4, which cites the three contracts | `Sⁿ`, `N = n`; `N = 0`; subdivision of a complex of dimension `≤ n` | boundary of `Δⁿ⁺¹` has `n + 1` vertices per face; discrete space, faces are singletons; a chain of nonempty faces of at most `n + 1` vertices has length at most `n + 1`, dimension stays `≤ n` | agrees |

The rows for the statements the change does not touch stand as in the previous review, of `9c048f9`; the change alters no Lean statement (three section comments only).

- Library declarations opened at the pinned Tau Ceti: 5. `AbstractSimplicialComplex.dimension` at `TauCeti/AlgebraicTopology/SimplicialComplex/Dimension.lean` line 266 and `dimension_le_iff` at line 283; `PreAbstractSimplicialComplex.dimension` at line 73 of the same file; `barycentricSubdivisionRealizationHomeomorph` at `.../SimplicialComplex/Subdivision/Homeomorph.lean` line 221; `PreAbstractSimplicialComplex.barycentricSubdivision` at `.../Subdivision/Basic.lean` line 71 (the order complex of the face poset). File, line, value type and description each agree with the README's three bullets.
- Source locators checked: 1, the one 5.4 carries. Hatcher2002 line 7923 (Theorem 2C.5, printed p. 182) states the same-dimension choice the README attributes to it. No target of the seeded sample falls in a changed passage.
- Cross-roadmap citations resolved for the pull request's text: CohomologyOfGroups at its open head `6447a96` (README lines 103–105 exclude finiteness conditions, dimensions, duality groups, Euler characteristics and Farrell cohomology; line 2856 names the consumer; §3.4–3.6 and §4.6 exist as cited); ArithmeticKTheory §3.2, BianchiModularForms and FuchsianOrbifolds as README lines 118–121 and 2574–2580 cite them.
- Pull request text against this head: title and description read sentence by sentence. The six top results, the supplier pair still open (CohomologyOfGroups, SpectralSequencesAndConvergence), the reuse of `TauCeti.Huber.IsPseudoCoherentOver` and `TauCeti.Module.IsFPD`, the imported cap product (§4.6) and Bass–Serre tree, the three files of the folder, and the count of 27 declarations all hold. FreeGroupsAndLimitGroups, EtaleCohomologyFoundations, ClassifyingSpaces and AlgebraicTopology are on main, as the description says of the roadmaps cited by name. The change since `9c048f9` adds no supplier, removes no section and no declaration, so nothing is left unstated.
- Gate: every check passes (the worker's run at this head, 27 checks at 0). Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: `sorry` is the only warning, on 18 declarations, as before; the 27 elaborated signatures are unchanged by the diff.
- Files changed outside the folder: none.
- Overlap check: read CohomologyOfGroups, ClassifyingSpaces, AlgebraicTopology, StableHomotopyKTheory; CW-to-simplicial replacement is AlgebraicTopology §8.11a's, 5.4 here is its dimension-bounded form and says so; nothing else shared.

Source independence: changed passages only; 3 passages (the three new contract bullets) compared with 1 source, Hatcher2002, none shared; the bullets describe pinned Tau Ceti declarations, the project's own library. Largest share Brown1974, 38 of 150 locators, unchanged; the diff adds, removes and reorders no layer, so the contents were not compared again.

## Not verifiable

- 7.2 (BrownGTM87 §IX.2), 9.4 and 9.5 (Farrell1977; BrownGTM87 §§X.3, VI.3), 5.3 (EilenbergGanea1957), 8.4(d) (Wall1961) and the other BrownGTM87 locators: uncertified sources, as in the previous review; the change touches none of them.
- The description's sentence on the review rounds that preceded the port ("2 independent review rounds and 2 red-team rounds") describes the process, not the folder; nothing at the head confirms or contradicts it.

## Source issues

- none

## For the human reviewers

- **Not tested.** BrownGTM87 carries 23 of 150 locators and is uncertified: wording and arrangement were not compared with it. The layers cite §§VIII.5–6, VIII.2, VIII.3, VIII.11, VIII.7, IX.2, X.2–3, in that order.
- **Declared gaps.** `packages/FinitenessAndDualityOfGroups/design/plan.json` declares two gaps on AlgebraicTopology (§8.11a, §4.7); the README at this head states neither, 5.4 owning the dimension bound and the nerve realization being unused.
