# Review of HardSphereDynamicsAndKineticLimits (pull request #2448 at 621c77c)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of 0 changed lines since `621c77c`; the folder is unchanged, and this round read the pull request's title and description against the head. Every sentence of the description agrees with the README and `Suggested.lean` at this head, and the one small correction of the previous review (the description naming BoltzmannGradLimitAndLanford as prover of Lanford's proposition) is repaired. No small correction and no format note. Three points are left for the human reviewers.

## Previous findings

The previous review, of the same head `621c77c`, had no finding; its one small correction is accounted for here.

- C01 — repaired: the description now says the proof "is left to a roadmap on the BBGKY and Boltzmann hierarchies, not yet written, whose end theorem is `HardSphere.LanfordStatement d` for `d ≥ 2`", as the README does (lines 13, 935, 954); the name BoltzmannGradLimitAndLanford no longer occurs.

## Verified sound

| Statement | Instances tried | Values computed (roadmap / check) | Result | Change |
|---|---|---|---|---|
| `HardSphere.tendsto_empirical_of_correlation` (the description's law of large numbers) | limits of mean and variance of `π_t(h)` under the n = 1, 2 hypotheses | mean → `∫ f h`; variance `μ⁻¹∫F_1 h² + ∫F_2 h⊗h − (∫F_1 h)²` → `0 + (∫ f h)² − (∫ f h)² = 0`; Chebyshev gives the claim | holds; Lean carries `∫⁻ f⁰ ≠ ∞`, `μ_ε → ∞`, `f` integrable, as README | none |
| `HardSphere.LanfordStatement` and `.tendsto_empirical` (description: "for `d ≥ 2`") | d = 0, `f⁰ = 1`, `C₀ = 1`, t = 0 | `μ_ε = ε⁻¹^0 = 1`; `𝒟̄_N = ∅` for N ≥ 2; partition function 1 + 1 = 2; `F_1 = 1/2`; `Q = 0`, `f = 1`; 1/2 ≠ 1 | false at d = 0; excluded by `hd : 2 ≤ d` (line 515) | none |
| Scattering and the right-continuous convention (description: "specular scattering law") | `x_1 = (2,0)`, `x_2 = 0`, `v_1 = (−1,0)`, `v_2 = 0`, ε = 1 | contact at t = 1, ν = (1,0), `⟨v_1 − v_2, ν⟩ = −1`; `v_1' = 0`, `v_2' = (−1,0)`; at t = 3 positions (1,0), (−2,0) | agrees with Conventions and Worked examples | none |
| Boltzmann–Grad scaling `μ_ε = ε^{−(d−1)}` as written in Lean | d = 3, 1, 0 at ε = 0.1 | 100; 1; `ε⁻¹^0 = 1` (not 0.1), used only for d ≥ 1 | agrees with Conventions | none |

The rows for the untouched statements stand as in the previous review, of `621c77c`.

- Changed passages: none in the folder (0 lines); nothing changed outside the folder. No layer added, removed or reordered; the seeded sample falls in no changed passage.
- Pull-request text against the head, sentence by sentence: it adds the roadmap (README, `Suggested.lean`, `metadata.toml`; 68 headings, 33 declarations); eleven sorried theorems (counted: 11); the Lean imports only Mathlib (line 3); ClassicalErgodicTheory §3.5 items 1, 3, 4 consumed in §7.2, §7.5, §8.1, §9.4 (README lines 572, 617, 649, 785, 956, 1007–1013); the ownership-only citations and the two Tau Ceti-only citations as README lines 952–956 have them; structure independence at §10.4 (line 895); uniqueness at every initial state at §5.2 (line 394); the hierarchy roadmap as README lines 13, 935, 954. No sentence is contradicted and no change is left unstated.
- Cross-roadmap citations resolved again: ClassicalErgodicTheory §0.2 and §3.5 items 1, 3 at its open head (another author's new-roadmap pull request, as the description says); on main MathematicalBilliards §10.3, §10.5, §12.3, RandomMatrices §8.1, ProbabilisticAndMetricNumberTheory §4.9a (with `scalarLpKoopman_strong`), ComplexTori, StandardDistributions, and OneParameterSemigroups under `Completed/`. None is found nowhere.
- Source locators checked this round: 1 (GST2013 line 1222, for the carried source issue). No new locator in the change.
- Library declarations opened: none new; `IsTrajectory`, `goodSet`, `volume_hardCoreSet_diff_goodSet`, `flow`, `tendsto_empirical_of_correlation`, `LanfordStatement`, `LanfordStatement.tendsto_empirical` read in `TauCetiRoadmap/HardSphereDynamicsAndKineticLimits/Suggested.lean` against the description's statements of them.
- Automatic checks: all passed. Dependency check: `depcheck: 131 roadmaps, 1464 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 11 `declaration uses sorry` warnings (lines 262–515) and nothing else; single `import Mathlib`, no `set_option`.
- Padding probe and headline list: unchanged file, stand as in the earlier reviews (11 headlines stated, none closes in one tactic).

Overlap check: read ClassicalErgodicTheory, RelativisticQuantumFieldTheory, NBodyProblemAndCentralConfigurations, PointProcesses, HamiltonianSystems, MathematicalBilliards, OptimalTransport, ProbabilisticAndMetricNumberTheory; nothing shared. (ClassicalErgodicTheory §0.2 and §3.5 were read again at its head this round, and main and the open pull requests were searched for `LanfordStatement` and the BBGKY hierarchy, found in this pull request only; for the others the earlier reading stands, the folder being unchanged.) No open pull request changes this roadmap, drops an id it cites, or is a second copy.

Source independence: changed passages only: 0 passages changed, so none compared this round; largest share GST2013, 36 of the 73 line locators counted in the earlier reviews (one BGSS2023 locator was added since, none to GST2013; not recounted this round); contents compared with GST2013: independent, as in the earlier reviews (no layer added, removed or reordered). Alexander1976, Lanford1975 and the four background references were not read.

Research link: Layers 5 to 7 are the finite-particle dynamics of Alexander (1976) as used by Gallagher, Saint-Raymond and Texier (2013); Layers 9 and 10 are the grand canonical setting and the statement of Lanford's theorem in Bodineau, Gallagher, Saint-Raymond and Simonella (2023), also the setting of Deng, Hani and Ma (2024). Rests on the three texts read.

## Not verifiable

- Alexander1976 Proposition 4.3 (§6.4): uncertified, not read; the locator rests on GST2013 line 855.
- Lanford1975 as the fixed-`N` statement (§10.4): uncertified, not read; rests on BGSS2023 lines 313–315.
- The published versions of GST2013 and BGSS2023: numbering checked in the arXiv versions the README cites only.
- The description's sentence on AI assistance (the number of review and red-team rounds): a statement about process, not checkable against the folder.

## Source issues

- **Misprint** in GST2013 at (4.4.1), printed page 33 (line 1222): the source says the starred velocities are the pre-image under (4.1.1), the free-flow equations; it should be (4.1.2), the reflection law; affects nothing.

## For the human reviewers

- `HardSphere.LanfordStatement.tendsto_empirical` assumes `HardSphere.LanfordStatement d`. The README (lines 13, 935, 954) leaves its proof to an unnamed roadmap on the BBGKY and Boltzmann hierarchies; no roadmap on main or in an open pull request states or proves it.
- BGSS2023 prints Theorem 1 without proof (line 322 refers elsewhere); GST2013 Theorem 8 (lines 2069–2080) prints convergence of velocity averages only. The uniform and almost-everywhere clauses of `LanfordStatement` rest on BGSS2023's wording (README line 893).
- Alexander1976 and Lanford1975 are cited by locator without their text (paywalled); the published numbering of GST2013 and BGSS2023 was not compared with the arXiv versions cited.
