# Review of ProjectiveModelsAndPeriodBoundsOnShimuraVarieties (pull request #2910 at c2b2d8a)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ProjectiveModelsAndPeriodBoundsOnShimuraVarieties/`
**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 17 lines changed since `6f15194` finds no finding. The change names the semistable reduction theorem behind 7.31a (b′) and adds NeronModelsAndSemistableAbelianVarieties §§3.1, 3.3, 3.10 as its owner; the three new locators into [FormalProof] and the three supplier sections say what the README says of them. There are two small corrections (the description's list of suppliers, and the commit the family index says each roadmap names) and one format note, none blocking. The points left for a human are those of the previous review.

## C01 — The description's list of dependencies omits NeronModelsAndSemistableAbelianVarieties, which this head cites as a supplier.

A reader of the description counts seven suppliers on main, while the README now has an eighth: the Dependencies line of Layer 7 (line 541) ends "NeronModelsAndSemistableAbelianVarieties §§3.1, 3.3, 3.10", and the supplier contracts have a subsection for it (lines 608–610). The description's paragraph "Dependencies." lists "ShimuraCompactifications, PELModuli, SchemeAndStackFoundations, StableReduction (relative ampleness), ArakelovGeometryAndAbelianHeights, AbelianSchemesAndArithmeticModuli and EquivariantIntersectionTheory". Adding "NeronModelsAndSemistableAbelianVarieties (semistable reduction, the input of the formal proof of 7.31a (b′))" to that list makes it right. The same paragraph group's sentence that the automatic checks pass with two exceptions (the rule that a pull request changes nothing outside its own roadmap folder, and the check of the merge order) was written for an earlier head; at this head every check passes, so the sentence should say that with no exception.

## C02 — The family index says that each roadmap's reference to the formal proof names the first commit of the repository; this roadmap's reference names none.

The index now reads (family `README.md`, lines 18–20): "the reference to the formal proof in each roadmap names that commit", the commit being `40e56bab026552e089d7afcfeff08d2defb9c005`, at which the files are to be looked up. The [FormalProof] entry of this README (line 622) gives only the repository's address and "paths relative to the repository's `src` directory", so a reader sent from the index to this entry does not find the commit, and the repository has changed since it. Adding "at its first commit `40e56bab…`" to the entry makes the two agree.

## N01 — The References entry for Faltings–Chai (1990) still names no chapter or page for "the computation behind ArakelovGeometryAndAbelianHeights §5.3" (line 620), while 6.2a cites the work at line 104; a chapter or section number would let a reader find it.

## Previous findings

- none: the previous report, of `6f15194`, had no finding (no R01). Its one format note, on the locator of Faltings–Chai, is not repaired and stands as N01 above; the change did not touch the References.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 7.31a (b′), the sentence on semistable reduction (lines 463–472) | [FormalProof] `GlobalTheory.Published.SemistableReductionSt`; `K/ℚ_p` finite; Tate curve; additive, potentially good elliptic curve | Source: `∀ p, K/ℚ_p` finite, polarised `A/K`, `∃ K' ⊇ K` finite, semi-abelian `G` over the integers of `K'`, generic fibre `A_{K'}`. README: the same. Tate curve: `G` has fibre `𝔾_m`; potentially good: `G` abelian over `K'` | agree | none |
| The same sentence against NeronModelsAndSemistableAbelianVarieties §§3.10, 3.1, 3.3 | `R` the integers of `K` (complete, so one discrete valuation ring over it); characteristic 0 | §3.10: `K'/K` finite separable, `A_{K'}` semistable at every such ring; §3.1: then `M⁰` has semi-abelian special fibre, generic fibre `A_{K'}`; §3.3: a semi-abelian model is `N⁰`. Separability automatic over `ℚ_p` | the three sections give the cited theorem | none |
| "proves as … applies in …" (lines 468–472) | the two declarations and the proof of `partI_holds` | `GlobalTheory.T.semistableReduction_ppav_padicField : SemistableReductionSt`; `partI_of_semistableReduction : SemistableReductionSt → PartI`; `partI_holds := partI_of_semistableReduction semistableReductionSt` | as the README says | none |
| Supplier contract, lines 608–610 | headings of the supplier on main | §3.1 "The semistable reduction predicate"; §3.3 "Semistable identity models and finite base change" (open immersion; semi-abelian `G = G⁰` is the identity model); §3.10 "Semistable reduction after a finite separable extension" | each clause matches its section | none |

The rows of the previous reviews for the statements this change does not touch (6.2a, 6.7a, 6.9a, 7.12a, 7.17a, 9.1, the statements and Checks of 7.31a) stand as in the previous review, of `6f15194`. The seeded sample falls in the changed passages only at 7.31a, in the rows above.

- Source locators checked against the text: 3 new ones in [FormalProof], read in the copy the operator holds (commit `e50d098` of the repository): `Development/AbelianVarietyTheory/PublishedTheorems/SemistableReduction₂/SemistableReductionSt.lean`, `…/Proofs/DegenerationProofs/SemistableReductionPpavPadicFieldStatement.lean`, `…/Proofs/ModuliProofs/PartOneOfSemistableReductionPadicPolarized.lean`; each file exists and declares the name the README gives. The use in `partI_holds` was read in `Development/AutomorphicSpectrum/Proofs/GeometryProofs/PartIHolds.lean`.
- Library declarations opened at the pins: none; the change makes no claim about Mathlib or Tau Ceti and `Suggested.lean` is unchanged.
- Cross-roadmap citations resolved: NeronModelsAndSemistableAbelianVarieties §§3.1, 3.3, 3.10 on main (README lines 955, 1022, 1311); the roadmap is on main and earlier in the merge order. No citation is reported as found nowhere.
- Dependency check output: `depcheck: 133 roadmaps, 1478 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Since `6f15194` the pull request changed this README and the family index `README.md` only; outside the folder it changes only the files of the family index.
- Elaboration: `lake env lean` on `Suggested.lean` gives no output and exit code 0. The file declares nothing, so there was nothing to `#check` and no one-tactic probe to run; its docstring names each headline with the carriers it lacks.
- The pull request's title and description were read against this head: C01. The family index was read: its entry for this roadmap agrees with the README; its new sentence on the commit is C02.
- Overlap check: read ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, HeightsForLogSingularMetrics, HodgeTateLatticesAndLubinTateLogarithms, DiscreteSeriesCoefficientsAndAutomorphicMetrics (open), ShimuraCompactifications, ArakelovGeometryAndAbelianHeights, PELModuli (main) as in the previous review, and NeronModelsAndSemistableAbelianVarieties (main) for this change; nothing shared: semistable reduction is owned by NeronModelsAndSemistableAbelianVarieties §3.10 and is cited here, not stated. The change adds, removes and reorders no layer and no target.

Source independence: changed passages only: 2 passages compared with 1 source ([FormalProof], Lean declarations without prose), none shared; largest share [FormalProof], 45 of 55 locators; the arrangement was not compared again, the change adding, removing and reordering no layer.

Research link: The headline targets are inputs of Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (2026; README and [FormalProof], read). 6.2a rests on the growth computation of Faltings–Chai (1990); 7.17a and 7.31a extend Lan's integral compactifications (2016, 2017); these two rest on the README alone.

## Not verifiable

- The three new [FormalProof] locators at the repository's first commit `40e56bab`: the copy read is at the later commit `e50d098`; the files and declarations exist there.
- [Lan16], Propositions 6.1 and 6.4, pp. 32–35 (7.31a (a)): the DOI resolves only to the publisher's page, which is in no class I may read from.
- Lan (2017), Theorem 6.1 (the Route of 7.31a (b)): no copy in a place I may read from.
- Faltings–Chai (1990): listed in the References without a locator; nothing to check.

## Source issues

- **Misprint** in DN at Théorème 2.3, printed page 11: the source says the equivariant bundle is called `F` and then that `E` descends; it should be that `F` descends; affects nothing.

## For the human reviewers

- Scope: 6.9a, 7.12a and 7.31a (b′) rest on [FormalProof] alone, a Lean repository announced on 20 November 2026 and not refereed; no published text states these forms (README References).
- Licence: the family index says the formal proof "was published without a license" and is mirrored for verification only; the README restates its declarations as mathematics and `Suggested.lean` declares nothing.
- Not tested: [Lan16] and Lan (2017) could not be read, so 7.31a (a) and the bad-prime step of 7.31a (b) were not checked against them.
- Merge coordination: ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, at its open head (README line 81), still takes the cubical line bundle from "§7.31a (b)"; this head gives it in (b′) (ii) only.
- Family index: this head adds to the family `README.md` a section "When a roadmap is wrong", a rule for contributions and reviews across the family; whether it belongs there is a project decision.
