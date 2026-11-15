# Review of HilbertModularVarietiesAndShimuraCurves (pull request #1005 at 3cac94e)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 3cac94e. The folder is unchanged; this round reads the pull request's title and description, as they stand now, against the head. No findings. README means `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md`.

## Previous findings

- R01 — repaired: the description now reads “`Suggested.lean` declares nothing: none of the headline theorems is statable at the pinned Mathlib and Tau Ceti, and its module docstring names each group of headlines and the carriers it lacks; every target is in the README.”
- R02 — repaired: the description now reads “the targeted Lake build succeeds with no warning (the file declares nothing, so there is no `sorry`)”.

## Verified sound

### The pull request's text against the head

| Text | Checked against | Result |
| --- | --- | --- |
| Title | README line 1 | Identical. |
| Adds or revises; “Roadmap folder … (README, `Suggested.lean`, `metadata.toml`)” | No folder of this name on main; diff is 3 files, 4544 insertions, 0 deletions; nothing outside the folder | A new roadmap; no removal, renumbering or dropped supplier to state. |
| “`Suggested.lean` declares nothing … its module docstring names each group of headlines and the carriers it lacks” | `Suggested.lean` lines 11–15 (headlines, “declares nothing”), lines 17–50 (eight groups), lines 60–62 (empty namespace) | Agrees. |
| “the targeted Lake build succeeds with no warning” | `lake env lean` on `Suggested.lean`: exit 0, empty output; `sorry` occurs 0 times | Agrees. |
| Summary block and the prose paragraph “Build finite-level …” | README Summary (line 3): §R18.5.15, §§R18.4.32–R18.4.33, §R18.3.8, §§H6.2–H6.8; “Downstream consumers” lines 4432–4439 | Each object and consumer named has its section; “at every prime” is §H2.3; “any totally real field” is §R18.3.8 and §R18.4.32. |
| “Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite” | 55 roadmap names in the README, classified against main and the description's dependency list | 16 on main (2 of them in the list, ticked); 27 open, all 27 in the list; 12 named only as consumers (lines 4080, 4432–4439). No supplier unaccounted for. |
| “README identifiers absent from Lean, … round labels and empty Lean sections are all zero; no `set_option` overrides; … no upward edge” | Gate rerun on this head | `readme-ids-missing=0 round-labels=0 empty-sections=0 set_option=0 depcheck=0`. Agrees. |

### Adversarial pass

The change touches no statement; rows for statements the description cites:

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §R18.3.8 definite Ihara lemma (“a definite Ihara lemma”) | `ω=diag(ϖ,1)`, `k=(1 1; 0 1)`, general `(a b; c d)` with `ϖ∣c`; `F=ℚ`, D ramified at `{2,∞}` | `ωkω⁻¹=(1 ϖ; 0 1)∈H`; `ω(a b; c d)ω⁻¹=(a ϖb; ϖ⁻¹c d)` integral, so `π₂` is defined; `ω⁻¹kω=(1 ϖ⁻¹; 0 1)∉H`. Class number 1: `(1,−1)↦1−1=0`, kernel before localization. | Correct; non-Eisenstein localization is needed |
| §H4.5 unit squares versus scalar levels (“effective level quotients”) | `F=ℚ`; `F=ℚ(√2)`, `η=1+√2`, level 2; scalar `ηI₂` | `ℚ`: positive units `{1}`, relation trivial. `η−1=√2∉2O` but `η²−1=2+2√2∈2O`: square trivial at level 2, root not. `adj(ηI₂)=ηI₂`. | Correct |

Rows for all other statements stand as in the previous review, of 3cac94e.

- Gate, rerun on this head: every rule 0, `OK`, exit 0 (the worker's gate adds `build=0`).
- Dependency check, exact output: `depcheck: 245 roadmaps, 2262 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line; this roadmap is at merge-order line 164.
- Elaboration: `lake env lean` on `Suggested.lean`, exit 0, no output. The file declares nothing, so there is no `#check @` comparison and the one-tactic probe is vacuous; the worker's signature list takes the docstring word “for” as a declaration.
- Outside the folder: nothing changed.
- Overlap facts: no other open pull request changes this roadmap; no cited id is dropped; none is defined only by an open revision.
- Citation leads (6): modules `TauCeti.NumberTheory.ClassFieldTheory.ClassFields.RayClassField` and `TauCeti.RingTheory.IntegralOrder.LeftOrder` exist at the pin; `LocallySymmetric.SheafDerived.isoSingular` and `FrankeInput` are in ArithmeticLocallySymmetricSpaces (README lines 832, 528), `CanonicalModel.minimal_defined_over_reflex` in ShimuraVarieties §8.18 (line 2782). Remark on untouched text: README line 95 attaches `OrderIdeles.completion` and `OrderIdeles.unit_change` to ClassicalArithmeticCompletion §7.72, which states both facts (first two API bullets) under no declaration name.
- Overlap check: read CompletedCohomologyAndLocalGlobalCompatibility, AutomorphicGaloisRepresentations, PotentialModularityAndCompatibleSystems, AutomorphyLiftingBeyondTaylorWiles, ModularCurvesPartII, AdelicAlgebraicGroups, ClassicalArithmeticCompletion; nothing shared. The first three cite this roadmap as supplier (19, 31, 17 occurrences). ModularCurvesPartII §15.7 owns the Ihara lemma for the modular curves `X₁(N)` over ℚ, this roadmap the one for quaternionic Shimura curves over totally real fields (§R18.4.32). AdelicAlgebraicGroups §5.3 and ClassicalArithmeticCompletion §7.72 are cited as suppliers.
- Source independence: changed passages only; 0 passages changed, so none compared; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- As in the previous reviews: Del80 Corollaries 3.3.4–3.3.6, EGS15 Lemma 4.1.1, Tay02, PRR23 §1.4.2 and the Voi21 printed pages are not readable in the source cache; none is cited in a changed passage.
- The description's “AI assistance” sentence describes the author's process and cannot be checked against the head.

## Source issues

- none

## For the human reviewers

- none
