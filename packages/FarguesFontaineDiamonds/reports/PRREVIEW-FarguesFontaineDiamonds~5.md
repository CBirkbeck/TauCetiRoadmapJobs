# Review of FarguesFontaineDiamonds (pull request #964 at f96f9b6)
**Verdict:** accepted

No finding. Incremental re-review of the 50 lines changed since 389338f, and of the title and description against this head.

## Previous findings

- R01 — repaired: the summary block now reads “Frobenius shifts translate the divisor on Y and preserve its descended divisor on X”, which is `TauCetiRoadmap/FarguesFontaineDiamonds/README.md` “Frobenius-orbit invariance of the marked-untilt divisor”.
- R02 — repaired: the description says it adds the new roadmap, three files “totalling 1,215 lines”, and that `Suggested.lean` “contains no declarations”; the head has 1177 + 37 + 1 = 1215 lines and an empty namespace.
- R03 — repaired: the summary block and README lines 52–54 and 1116–1122 cite VectorBundlesAndIsocrystals Layer 0, Layer 4 and Layer 5; no `VB−1`, `VB1`–`VB3` identifier remains in the README or the description.
- R04 — repaired: the manifest `packages/FarguesFontaineDiamonds/sources.toml` records FS, SW, ECD and KL, each `certified`. The roadmap folder holds no manifest, as no roadmap folder on main does (0 of them); none is asked for there.

## Verified sound

| Statement or claim | Instance | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| README 201–203: hypotheses of the pinned sheaf theorem | `TauCeti.FarguesFontaine.isSheaf_spaYPresheaf`, `Adic.lean:158`; ϖ = 0; trivial valuation | Pin: `CharP R p`, `PerfectRing R p`, `v.Integers R`, `ϖ ≠ 0`, `v ϖ < 1`. ϖ = 0 has value 0 < 1, excluded by `ϖ ≠ 0`; trivial v forces ϖ = 0 | README's four hypotheses equal the pin's | None |
| README 203: “the adic objects and maps take its sheaf witness” | `spaYAdicSpace`, `spaXAdicSpace`, `spaYAdicFrobenius`, `quotientAdicHom` | `Adic.lean:129, 224, 238, 245`: each has the binder `h : (spaYPresheaf P ϖ).IsSheaf`; 4 of 4 | Agrees | None |
| README 194–200: files of the pinned implementations | six names, two files | `windowPreAdicSpaceIso` at `IntervalChart.lean:212`; the other five in `Adic.lean`; 6 of 6 found | Agrees | None |
| `Suggested.lean` docstring, F0: Yoneda-adic category absent, adic objects supplied | pinned Tau Ceti and Mathlib | Declarations named Yoneda-adic: 0 (only `coyoneda` in 2 sheaf-criterion files); `spaYAdicSpace`, `spaXAdicSpace`, `quotientAdicHom`: 3 of 3 present | Agrees | None |
| `Suggested.lean` docstring, F1–F4, and README 1099–1102: perfectoid test category, `Spd`, v-topology, étale sites absent | pinned Tau Ceti and Mathlib | Perfectoid rings and fields: present (`TauCeti/RingTheory/Perfectoid/`, 12 entries); perfectoid spaces, `Spd`, v-topology, étale sites: 0 declarations | Agrees: the carriers named are spaces and sites, not rings | None |
| README 52–54, 1116–1122: downstream layers | VectorBundlesAndIsocrystals at its open head | Layer 0 at line 89, “Marked untilt Cartier divisors and Cartier descent” at 147 with `Div¹` at 151; Layer 4 (classification) at 964; Layer 5 at 1062, “Effective divisors and projective sections” at 1237 | 5 of 5 resolve | None |
| Summary block: divisor translated on Y, preserved on X | Kummer untilt at radius 1, one positive Frobenius shift | p = 2: radius 1 versus 2 on Y; p = 3: 1 versus 3; both pairs have equal image under q | Distinct on Y, equal on X, as the text now says | None |
| Description: “totalling 1,215 lines”, “no declarations” | base-to-head change of the folder | 1177 + 37 + 1 = 1215 insertions, 0 deletions; declarations 0 | Agrees | None |

The rows for untouched statements stand as in the previous review, of `389338f`.

- Gate at this head: every check 0, `OK`; `lake env lean` on `TauCetiRoadmap/FarguesFontaineDiamonds/Suggested.lean` exits 0 with no warning; no declaration, so no binder comparison and no one-tactic probe apply.
- Dependency check: `depcheck: 247 roadmaps, 2238 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Library declarations opened at the pins: 6 new ones (above) and the 18 `TauCeti.FarguesFontaine` names of README 168–188, all found in `Y.lean`, `Window.lean` and `Quotient.lean`.
- Cross-roadmap citations resolved: 5 into VectorBundlesAndIsocrystals, 3 into RelativeFarguesFontaine (Layers 2, 3 and §4.7), BunGAndNewtonStrata Layer 2, AdicSpacesPartII §§R0.3, R0.5, R0.8 on main (lines 1769, 2759, 3868); `BanachModule.CompletedTensor.exact_of_split` of README 262 is AdicSpacesPartII §R0.5's name (its README line 2885).
- Source locators: 0 added or changed; the ten seeded targets fall outside the changed passages.
- Outside the folder: the pull request changes nothing against its base; the merge of main moved the pins to Tau Ceti `2fd255d` and Mathlib `1b1ccf4`.
- Remark: the ten library permalinks of README 150–170 point at the commits pinned before that merge; all ten declarations exist at the pins (five at other lines, for instance `spaAnalytic_eq_spa_of_isTateRing` at 428, linked at 377).
- Remark: F0's first assertion, that every point of `Y` is analytic, can be written at the pin with `TauCeti.PreAdicSpace.analyticPoints`; it is a corollary of `spaY_subset_spaAnalytic`, `analyticPoints_restrict` and `analyticPoints_presentationLimitPreAdicSpace`, not a headline.

Overlap check: read RelativeFarguesFontaine, VectorBundlesAndIsocrystals, AdicCoefficientsAndComparisons, DiamondEtaleCohomology, AInfCohomology, PerfectoidSpaces, DiamondsAndVStacks, AdicSpaces. Owners: fixed-field `ℚ_p` Cartier divisor and diamond comparison, FarguesFontaineDiamonds F4 (cited as supplier at VectorBundlesAndIsocrystals lines 160 and 208 and RelativeFarguesFontaine lines 92 and 1747); general-coefficient curve, divisors and `Div¹`, VectorBundlesAndIsocrystals Layer 0; relative curve, RelativeFarguesFontaine; adic coefficients, AdicCoefficientsAndComparisons L0; discrete coefficients, DiamondEtaleCohomology; tilts and primitive kernels, PerfectoidSpaces; diamond functor and sites, DiamondsAndVStacks; fixed adic curve, AdicSpaces. Nothing has two owners.

Source independence: changed passages only; 5 changed passages read (a scope paragraph, a supplier-contract bullet, two paragraphs on Lean forms and consumers, one docstring), none carries a source locator or wording of FS, SW, ECD or KL, so 0 passages compared with 0 sources; no layer added, removed or reordered, so the locator shares and the arrangement were not compared again.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
