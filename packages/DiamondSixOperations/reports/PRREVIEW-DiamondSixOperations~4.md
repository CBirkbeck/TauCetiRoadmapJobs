# Review of DiamondSixOperations (pull request #927 at a795f1d)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: the description now reads “This pull request adds the roadmap folder `TauCetiRoadmap/DiamondSixOperations` (README, `Suggested.lean`, `metadata.toml`). `Suggested.lean` declares nothing: no headline theorem is statable at the pinned Mathlib and Tau Ceti”.

The repair introduced no new problem.

## Verified sound

Incremental re-review of 11 changed lines since `5c71e4e`. The diff changes no statement; the rows are for the statements the changed text cites. `B` is the perfectoid closed unit ball, `Λ = 𝔽_ℓ`.

| Statement (README line) | Instances tried | Computed left side | Computed right side / control | Result; change |
| --- | --- | --- | --- | --- |
| Smoothness over a general perfectoid base (1118), named by the new Scope bullet (12) | `f = id_X`; `B × X → X`; closed origin `i : Spa(C, O_C) → B_C` with `X̃ = B_C` (`n = 0`) | `Rf^!Λ`: `Λ`; `Λ(1)[2]`; `Ri^!Λ = Λ(−1)[−2]` (from `Rπ^!Λ = Λ(1)[2]` and `R(π∘i)^! = id`) | condition (2): holds; holds; fails on `i_*Λ`, source `Λ(−1)[−2]`, target `Ri^!i_*Λ = Λ`; `i` not smooth | Retain; both directions agree on the three instances. |
| Pins (42) | the two hashes against `lake-manifest.json` | README: Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…` | manifest: mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, TauCeti `2fd255d997f47c0b5d834ee416c7015d55444ce5` | Retain; equal. |
| `ℓ ≠ p` and `ℓ = p` controls of S5.3 through the Tau Ceti contract (52), re-read at the new pin | `K = ℤ_p`, `ℓ ≠ p`; `ℓ = p` | exponent of `ℓ` in `profiniteOrder (Multiplicative ℤ_[p])`: 0; `⊤` | pinned statement: order `= primePower p ⊤` | Retain; the contract's “`p^∞`” is what the pin proves. |

The rows for the statements the diff does not touch stand as in the previous review, of `5c71e4e`.

- Changed passages: the Summary (line 3) no longer says the roadmap follows a source and its new last sentence points to the References entry [ECD], which exists (line 1301); the Scope list (lines 7–13) names its last two items by their mathematics, and each named item is a target (S5.2, S5.4, S5.5 lines 1085, 1108, 1118; S6.1–S6.3); line 15 no longer refers to a source's sections. The strings “following” and “material of ECD” occur nowhere in the README.
- Library declarations opened at the new pins: 14. Mathlib: `closedPoints` and `JacobsonSpace` (`Topology/JacobsonSpace.lean` 36, 70), `JacobsonSpace.of_isOpenEmbedding` (133), `IsLocalRing.exists_factor_valuationRing` (`RingTheory/Valuation/LocalSubring.lean` 249), `finite_of_finite_type_of_isJacobsonRing` (`RingTheory/Jacobson/Ring.lean` 691), `LocallyConstant.freeOfProfinite` (`Topology/Category/Profinite/Nobeling/Induction.lean` 154), `DerivedCategory.singleFunctor` (`Algebra/Homology/DerivedCategory/Basic.lean` 243), `DerivedCategory.homologyFunctor` (`…/HomologySequence.lean` 33), `nonempty_inter_closedPoints`, `conjugateIsoEquiv`. Tau Ceti: `profiniteOrder` (`Topology/Algebra/Group/Profinite/Order.lean` 58), `ofNat_card_quotient_le_profiniteOrder` (146), `Subgroup.profiniteIndex` (`…/Index/Basic.lean` 70), `profiniteOrder_multiplicative_padicInt` (`…/ProP/PadicInt/Basic.lean` 172). The four `TauCeti.*` module paths named in the README exist at the pin.
- Cross-roadmap citations: the diff adds none; the citation tool reports no cross-roadmap citation found nowhere; `SmoothRepresentationsOfLocalGroups` SR.0.3, SR.1.1 and target a-valued-haar-measure resolve on main (lines 765, 1050, 1103).
- Pull request text, read in full against this head: the title; the three paragraphs of the summary block (three-step construction, coefficients killed by an integer prime to `p`, the four examples, the `Spa(C, C⁺)` counterexamples, the two named consumers and the suppliers of Huber's theory, Haar measures, profinite orders and Jacobson spaces, each against Summary, Conventions, the supplier contracts and Downstream consumers); the two prose paragraphs (the folder is new: 1340 insertions, 51 headings added, 0 Lean declarations; the module docstring names the four missing carriers and the results of S0–S6). No sentence is contradicted and no change is left unstated.
- Gate, re-run at this head: `set_option=0 … outside-folder=0 source-material=0 OK`; the worker's run adds `build=0`. Dependency check: `depcheck: 247 roadmaps, 2240 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. No file outside the roadmap folder differs from the merge base.
- Lean: `Suggested.lean` is unchanged since `5c71e4e` and elaborates at the new pins with no message (one `import Mathlib`, a module docstring, an empty namespace); there is no declaration for the `#check` comparison or the one-tactic probe. Headlines: none statable at the pins, each layer's results and the missing carriers named in the docstring.
- Seeded sample: none of the fifteen targets falls in the changed passages; no locator was added or changed.
- Overlap check: no closest roadmap's scope was reread this round (the diff adds no object, and the overlap facts list no pull request changing this roadmap, no dropped id and no roadmap close in results or headings); ownership stands as read in the earlier reviews (DiamondEtaleCohomology, VStackSheavesAndLisseCategories, AdicCoefficientsAndComparisons); nothing shared.
- Source independence: changed passages only; 3 passages compared with 1 source (the new Summary sentence and the two new Scope bullets against ECD lines 35–38, 6326 and 6582), none shared beyond standard names (longest common run 3 words); largest share ECD (118 of 144 locators as counted at `5c71e4e`; the diff removes three section references to ECD and adds none); contents not compared again, the diff adds, removes or reorders no layer.

## Not verifiable

- **Hub96**, Proposition 5.5.8 and Corollary 1.6.10: paywalled, settled as uncertified; untouched by this change.

## Source issues

- none

## For the human reviewers

- **Licence.** The source with the largest share of the locators (ECD, 118 of 144 as counted at `5c71e4e`) is cited from arXiv:1709.07343v4, described in the References (README line 1301) as “to appear in Astérisque”; [KW] is cited as an arXiv preprint only.
