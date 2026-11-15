# Review of HilbertModularVarietiesAndShimuraCurves (pull request #1005 at 3cac94e)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 3cac94e. The folder is unchanged; this round reads the pull request's title and description against the head. Both findings are in the description, not in the folder. README means `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md`.

## R01 (P3) — Description says the Lean file states definitions and theorems; it declares nothing

**Location:** pull request description, third paragraph: “the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti, every target is in the README.”

**Claim:** At this head `Suggested.lean` contains no definition and no theorem, so the sentence describes an earlier head.

**Witness:** `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/Suggested.lean` lines 12–13: “None of them is statable at the pins, so this file declares nothing”; lines 60–62 are an empty namespace. README line 5: “states no theorem”.

**Repair:** Replace the clause with: “`Suggested.lean` declares nothing: none of the headline theorems is statable at the pinned Mathlib and Tau Ceti, and its module docstring names each group of headlines and the carriers it lacks; every target is in the README.”

## R02 (P3) — Description's validation line reports a `sorry` warning the head does not produce

**Location:** pull request description, “Validation” paragraph: “the targeted Lake build succeeds with `sorry` as the only warning”.

**Claim:** The file has no `sorry`, so the build of this head has no warning at all.

**Witness:** `lake env lean` on `Suggested.lean` at 3cac94e: exit 0, empty output. The word `sorry` occurs 0 times in the file.

**Repair:** Replace with: “the targeted Lake build succeeds with no warning (the file declares nothing, so there is no `sorry`)”.

## Previous findings

- The previous report (of 3cac94e) had no findings; nothing to account for.

## Verified sound

### The pull request's text against the head

| Text | Checked against | Result |
| --- | --- | --- |
| Title | README line 1, `# Roadmap: Hilbert modular varieties and quaternionic Shimura curves` | Identical. |
| Adds or revises | No `HilbertModularVarietiesAndShimuraCurves` folder on main; diff is 3 files, 4544 insertions, 0 deletions, nothing outside the folder | The description names the folder and its three files; a new roadmap, no removal to state. |
| Summary block, “What this roadmap builds” | README Summary (line 3); §H2.3 (every prime), §§H6.2–H6.8, §R18.5.15, §§R18.4.32–R18.4.33, §R18.3.8, §R18.3.12, §R18.3.18 | Each named object has its section. |
| Summary block, “Why Tau Ceti wants it” | README “Downstream consumers”, lines 4432–4439 | Each consumer use named (definite modules, Taylor–Wiles levels, Moret–Bailly input, Heegner/Gross–Zagier, Hasse ideals, perfectoid) is listed there. |
| Summary block, “Approach and generality” | §R18.5.15 proof route (BZ Theorem 6.7 through the auxiliary PEL curve); §R18.4.32 hypotheses | §R18.4.32 assumes `l>2`, non-Eisenstein, large image and the `l=5` exception; no unramifiedness hypothesis on l or F. Agrees. |
| “Roadmaps on main are cited by name; everything else named in the README is a consumer” | 55 roadmap names in the README, classified | 17 on main, Chebotarev among the completed ones (2 of them also in the description's dependency list, marked merged); 27 open, all named in that list; the remaining 11 occur only as consumers (lines 3995, 4080, 4432–4439). No supplier is unaccounted for. |
| “README identifiers absent from Lean … empty Lean sections are all zero”, “no `set_option`”, “no upward edge” | Gate rerun | `readme-ids-missing=0 empty-sections=0 round-labels=0 set_option=0 depcheck=0`. Agrees. |

### Adversarial pass

The change touches no statement; rows for statements the description cites:

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §R18.4.33 integral Ihara saturation (“Ihara lemma and its integral saturation”) | `O→O², x↦(x,0)`; negative control `O→O, x↦λx` | First: cokernel `O`, free; mod `λⁿ` cokernel `O/λⁿ`, free over `O/λⁿ`, split. Control: cokernel `O/λ`, not free; reduction is the zero map, not injective. Saturation is the content. | Correct |
| §R18.5.15 Čerednik–Drinfeld hypotheses (“at a division prime”) | B/ℚ of discriminant 6, `v=2`; `M₂(ℚ)` | Invariants: 1/2 at 2 and 3, 0 at ∞, sum `1≡0`; real place split, 2 division. `M₂(ℚ)`: invariant 0 at 2, hypothesis fails. | Correct |
| §H2.3 flatness and normality “at every prime” (“covering 2 and ramified primes”) | `F=ℚ(√2)`, `p=2` | `O⊗𝔽₂=𝔽₂[t]/(t²)`, not étale: rank-one freeness of `ω` over it is an open condition that fails at points where t acts by 0 on `ω`, so the Rapoport locus is a proper open and smoothness is not claimed there. | Correct |

Rows for all other statements stand as in the previous review, of 3cac94e.

- Gate, rerun on this head: every rule 0, `OK`, exit 0 (the worker's gate adds `build=0`).
- Dependency check, exact output: `depcheck: 247 roadmaps, 2266 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line; this roadmap is at merge-order line 164.
- Elaboration: `lake env lean` on `Suggested.lean`, exit 0, no output. The file declares nothing, so there is no `#check @` comparison and the one-tactic probe is vacuous. The worker's signature file fails because it takes the docstring word “for” as a declaration name.
- Outside the folder: nothing changed.
- Overlap facts: no other open pull request changes this roadmap, no cited id is dropped, and none is defined only by an open revision (AlgebraicTopology Layer 6 is on main, README line 2136 of that roadmap).
- Cross-roadmap citations resolved this round: the 55 roadmap names above; source locators rechecked: 0 (no changed passage).
- Overlap check: read CompletedCohomologyAndLocalGlobalCompatibility, AutomorphicGaloisRepresentations, PotentialModularityAndCompatibleSystems, AutomorphyLiftingBeyondTaylorWiles, ModularCurvesPartII, AdelicAlgebraicGroups, ClassicalArithmeticCompletion; nothing shared. The first three cite this roadmap as their supplier (19, 31 and 17 occurrences); the others state none of the Deligne–Pappas, Čerednik–Drinfeld or Shimura-curve Ihara targets.
- Source independence: changed passages only; 0 passages changed, so none compared; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- As in the previous review: Del80 Corollaries 3.3.4–3.3.6, EGS15 Lemma 4.1.1, Tay02, PRR23 §1.4.2 and the Voi21 printed pages are not readable in the source cache; none is cited in a changed passage.
- The description's “AI assistance” sentence describes the author's process and cannot be checked against the head.

## Source issues

- none

## For the human reviewers

- none
