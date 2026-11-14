# Review of PosetHomotopyAndSubgroupComplexes (pull request #2296 at 3e08670)

**Verdict:** accepted

## Previous findings

- R01 — repaired: `TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:428` identifies the open star and invokes `openStarHomotopyEquiv`; the supplier contract and *Needs:* list include restriction, stars and cone contractibility.
- R02 — repaired: `TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:439` states the nonempty/fence connectivity criterion and supplies its path-component argument; §4.5 now consumes §2.2.
- R03 — repaired: `TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:715`, :719 and :730 give separate dependencies for §4.1(a), (b), (c); the central-subgroup argument explicitly assumes finiteness.
- R04 — repaired: `TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/Suggested.lean:227` has no `[Finite G]`; README §4.3 separates the general contraction from its finite-group consequences and adds infinite examples.
- R05 — repaired: the description assigns the `p`-core and `p`-rank to OddOrderTheorem §§1.1, 1.4, lists that supplier and its merge order, and uses `m_p(G) − 1` for dimension.
- R06 — repaired: `TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:692` cites `barycentricSubdivisionRealizationHomeomorph` for the comparison of realizations and §3.1 for the nerve comparison.

## Verified sound

| Statement | Instances tried | Computed first side | Computed second side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| §2.2 open-star restriction | Sierpiński, vertex set `{True}`; empty vertex set | `μ⁻¹{True} = (0,1]`; empty star = ∅ | Restricted realizations: point; ∅ | Homotopy equivalents in both cases | Pinned supplier cited |
| §2.2 cone argument | `U_False = {False,True}`; `U_True = {True}` | Faces: three; one; adjoining the minimum preserves every face | Realizations: interval; point; both contractible | Minimum belongs to each cone | Cone API cited |
| §2.2 connectivity criterion | ∅; discrete pair; `0,1<2`; discrete ℕ | Fence-class counts: 0, 2, 1, ℵ₀; nonempty: no, yes, yes, yes | Realization component counts: 0, 2, 1, ℵ₀; connected: no, no, yes, no | Both directions, including infinite and empty cases | Criterion added |
| Layer 3 subdivision example | One edge with endpoints 0, 1 | Face-poset realization: path `{0}—{0,1}—{1}`; midpoint maps to 1/2 | Original realization: `[0,1]`; nerve realization: same subdivided interval | Homeomorphisms, not merely weak equivalences | Citation corrected |
| §4.1(a), (c) dependencies | `G = S₃`, `p = 2` | Conjugation `(123)` sends `⟨(12)⟩` to `⟨(23)⟩`; maximal elementary-abelian order = 2 | Inclusion gives the same subgroup; rank = 1; face lengths = `{1}` | Definitions/action independent of conicality and rank | Three *Needs:* lines |
| §4.1(b) finite conicality | `P = D₈`, `p = 2`, `B = Z(P)`; `P = 1` | `|B| = 2`; reflection `A` has `|AB| = 4`, exponent 2; trivial group has no such B | `A ≤ AB ≥ B` in both posets; trivial-group posets empty | Finite nontrivial hypothesis supplies the central subgroup | Finiteness explicit |
| §4.3 general contraction | `G = ℤ × C_p`, `p = 2,3`, `N = 0 × C_p` | Only nontrivial p-subgroup is N; `QN = N`; N normal | Realization = one point; contractible = yes | Works without finite G | Lean binder removed |
| §4.3 negative controls | Infinite dihedral group, `p = 2`; trivial group | Normal nontrivial 2-subgroups: none; none | Realization: countably infinite discrete set; ∅; neither contractible | Hypothesis excludes both | Infinite Check added |
| §4.5 component route | `S₃`, `p = 2`; `S₄`, `p = 2` | Fence/realization components: 3/3; 1/1 | `M = C₂`: distinct conjugates intersect in 1; Sylow D₈ intersections in S₄ contain V₄ | Strong embedding exists; does not exist | Consumes §2.2 |

Rows for untouched statements stand as in the previous review of `e1b39b5`.

- Sources: three McCord locators checked directly—Theorem 2, p. 466, and §5 Lemmas 3, 7, pp. 469–470 (`mccord1966` lines 72, 238, 270); two Quillen locators corroborated by `piterman2021` lines 190–192 and 836–839, without certifying Quillen's text or its infinite-group scope.
- Pinned route declarations: 12 opened, including Mathlib `GroupTheory/PGroup.lean:378,450`, `Topology/Connected/LocallyPathConnected.lean:122`; Tau Ceti `Realization/Star/HomotopyEquiv.lean:43`, `Star/Retraction.lean:61`, `Restriction.lean:32`, `IsCone.lean:46`, `Realization/Cone.lean:101`, `Realization/LocallyPathConnected.lean:40`, `WeakHomotopyEquivalence.lean:80,102`, `Subdivision/Homeomorph.lean:221`.
- Supplier citations: five sections resolved at their supplied main/open heads—StableHomotopyKTheory §2.31, HomotopyTheoryOfCategories §§2.1, 2.4, OddOrderTheorem §§1.1, 1.4; no supplier drift or competing owner for the added connectivity criterion.
- Headlines: §§1.2–1.5, 2.1–2.3, 3.1–3.5, 4.1(c)–4.7 remain represented by 20 theorems; §3.4(b)'s missing localizer carriers are named in the docstring. All 26 declarations checked with `#check @name`; §4.3 retains primality, normality, nontriviality and the p-group hypothesis, without finiteness.
- Elaboration: `lake env lean` succeeds with exactly 20 `sorry` warnings. The changed theorem survives four one-tactic probes (`simp`, `rfl`, `infer_instance`, `exact?`); none closes it. Five library near-matches concern Sylow algebra, not the realized subgroup poset.
- Gate: all 29 checks zero, including the targeted build, using the supplied candidate order. The default-order diagnostic `NOT IN ORDER: PosetHomotopyAndSubgroupComplexes (insert it after its last supplier)` disappears with that order; it is the brief's excluded placement case.
- Dependency output: `depcheck: 242 roadmaps, 2194 edges, 0 problem(s)`; no UPWARD or CYCLE. Zero files changed outside the folder; review leaves the worktree clean.
- PR text: new-folder status, four layers, suppliers, the new connectivity consequence and the infinite-group extension match this head; no removed headings or declarations need a mapping.

Overlap check: read StratifiedSpacesAndTameTopology, HomotopyTheoryOfCategories, KanQuillen, PlanarTopology and TeichmullerGeometry, plus StableHomotopyKTheory and OddOrderTheorem; shared upper-set topology belongs to Mathlib, realization/subdivision/Euler-characteristic infrastructure to pinned Tau Ceti, realized-nerve Theorem A to StableHomotopyKTheory, localizer Theorem A to HomotopyTheoryOfCategories, and p-core/p-rank to OddOrderTheorem. No second owner for the changed targets.

Source independence: changed passages only; eight passages compared with two texts (`mccord1966`, `piterman2021`) and the pinned APIs, including the §4.3 docstring, with no copied expression or reused material found. Largest share remains `quillen1978`, 13 of 39 locators as counted at `e1b39b5`; its text and contents remain unread. No layer was added, removed or reordered, so the earlier arrangement check stands.

## Not verifiable

- `quillen1978`, Propositions 2.4 and 5.2: the sources service resolves the cited DOI only to a paywalled publisher; primary wording and scope remain uncertified. The general §4.3 route is independently supported by the pinned p-group extension theorem and §3.3.

## Source issues

- none

## For the human reviewers

- **Not tested.** `quillen1978` has the largest share of locators (13 of 39); its text and table of contents remain unavailable, so wording and arrangement were not compared with it.
- **Licence.** `mccord1966` and, in the previous review, `barmak2011` were read on a third party's University of Edinburgh page, rather than an author or publisher page; redistribution permission remains unverified.
- **Licence.** `diaz_ramos2023` (arXiv:2303.15613) is an unpublished preprint; `TauCetiRoadmap/PosetHomotopyAndSubgroupComplexes/README.md:940` labels it as such and no target rests on it.
