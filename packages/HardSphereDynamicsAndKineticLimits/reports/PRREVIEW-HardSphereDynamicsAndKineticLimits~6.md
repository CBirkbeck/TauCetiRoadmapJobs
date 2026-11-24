# Review of HardSphereDynamicsAndKineticLimits (pull request #2448 at 621c77c)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 10 lines changed since `5619cb5`: the five README passages that named BoltzmannGradLimitAndLanford (with its §5.2) as the prover of Lanford's proposition now leave the proof to an unnamed roadmap on the BBGKY and Boltzmann hierarchies, the overview's sentences on the Jacobian and on ClassicalErgodicTheory are reworded, and the locator for the BBGKY hierarchy is now BGSS2023 §3.1; each is correct against the sources and the cited sections. One small correction (the pull request's description still names BoltzmannGradLimitAndLanford as an open pull request) and no format note. Three points are left for the human reviewers.

## C01 — The description still assigns the proof of Lanford's proposition to BoltzmannGradLimitAndLanford, which the README no longer names and which is neither on main nor an open pull request

A reader of the description looks for a roadmap that cannot be found. The summary block says "BoltzmannGradLimitAndLanford, which proves `HardSphere.LanfordStatement d` for d ≥ 2 through the BBGKY hierarchy", and the prose says the proof "is left to BoltzmannGradLimitAndLanford, §5.2, a consumer of this roadmap, listed among the downstream consumers, that is another author's open pull request". At this head the README names no such roadmap (the overview at line 13, §10.4 at line 893, Downstream consumers at line 935 and Scope and ownership at line 954 all say "a roadmap on the BBGKY and Boltzmann hierarchies"), and a search of main and of the open roadmap pull requests for that name, and for `LanfordStatement`, returns this pull request only.

Text that would be right, in both places: "a roadmap on the BBGKY and Boltzmann hierarchies, not yet written, which proves `HardSphere.LanfordStatement d` for d ≥ 2 and consumes this roadmap; it is not a prerequisite".

## Previous findings

The previous review, of `5619cb5`, had no finding, no small correction and no format note; nothing is carried.

## Verified sound

| Statement | Instances tried | Values computed (roadmap / check) | Result | Change |
|---|---|---|---|---|
| §10.4 Check, `LanfordStatement 0` false (changed sentence: a proof needs a hypothesis excluding d = 0, as BGSS2023's standing d ≥ 2) | d = 0, `f⁰ = 1`, `C₀ = 1`, `g = 1`, `t = 0` | `μ_ε = 1`; `𝒟̄_N = ∅` for N ≥ 2; partition function 1 + 1 = 2; `F_1 = 1/2`; `Q = 0`, `f(t) = 1`; 1/2 ≠ 1 | false at d = 0; BGSS2023 line 119 has d ≥ 2 | none |
| `HardSphere.LanfordStatement.tendsto_empirical` (cited by the changed overview and scope sentences) | signature at `Suggested.lean` line 515 | carries `hd : 2 ≤ d` and `hL : LanfordStatement d`; the d = 0 instance above is excluded by `hd` | README (d ≥ 2, under the proposition) and Lean agree | none |
| Overview: change of variables turns the unit Jacobian into measure preservation; ClassicalErgodicTheory extends measure preservation to the whole phase space | §4.3–4.4, §7.2 (line 563); ClassicalErgodicTheory §3.5 item 1 at its open head | §7.2 proves `G ∪ 𝒟̄ᶜ` with identity off `G` is a conull flow; item 1 proves the identity extension measure preserving on `(X, μ)` | overview agrees with §7.2 and the supplier | none |
| Downstream consumers: sections the hierarchy roadmap consumes | headings of §7.1, §8.2, §9.5, §9.6, §10.2–10.4 | the flow; the weak Liouville equation; correlation functions; initial chaos; collision operator, mild solutions, the proposition: each section is what the bullet says | section numbers correct | none |

The rows for the untouched statements stand as in the previous review, of `5619cb5`.

- Changed passages: 5 README lines (overview line 13; §10.4 line 893; the d = 0 Check, line 905; Downstream consumers line 935; Scope and ownership line 954); `Suggested.lean` and `metadata.toml` unchanged; nothing changed outside the folder. No layer added, removed or reordered.
- Source locators checked this round: 3. BGSS2023 line 119 (standing d ≥ 2, new locator in the Check): correct. BGSS2023 §3.1 (lines 1498–1503, and line 672, where the BBGKY hierarchy is written): correct, and better than the former §2. GST2013 Chapters 5–7 and Part IV for the proof of Theorem 8 (lines 804, 2088–2130): correct. The seeded sample falls in none of the changed passages.
- Library declarations opened: none new; `LanfordStatement` (line 489) and `LanfordStatement.tendsto_empirical` (line 515) read in `TauCetiRoadmap/HardSphereDynamicsAndKineticLimits/Suggested.lean`; its module docstring (lines 31–35) already says the proof is outside this roadmap and names no other roadmap.
- Cross-roadmap citations resolved again: ClassicalErgodicTheory §3.5 item 1 at its open head (conull flows, identity extension measure preserving). The name BoltzmannGradLimitAndLanford occurs nowhere in the folder; no citation is found nowhere.
- Automatic checks: all passed. Dependency check: `depcheck: 131 roadmaps, 1464 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 11 `declaration uses sorry` warnings (lines 262–515) and nothing else; single `import Mathlib`, no `set_option`.
- Pull-request text against the head: it adds the roadmap (3 files, 68 headings, 33 declarations, 11 sorried theorems, as it says); suppliers as stated; the one disagreement is C01.
- Padding probe and headline list: unchanged file, stand as in the earlier reviews (11 headlines stated, none closes in one tactic).

Overlap check: read ClassicalErgodicTheory, RelativisticQuantumFieldTheory, NBodyProblemAndCentralConfigurations, PointProcesses, HamiltonianSystems, MathematicalBilliards, OptimalTransport, SuccessiveMinima; nothing shared. (ClassicalErgodicTheory was read again at its head this round, and the open pull requests and main were searched for `LanfordStatement` and for the BBGKY hierarchy, with no owner found; for the others the earlier reading stands, the change touching no object of theirs.) `HardSphere.LanfordStatement` is owned here; its proof has no owner yet and is not a prerequisite of any target here. No open pull request changes this roadmap, drops an id it cites, or is a second copy.

Source independence: changed passages only: 5 passages compared with 2 sources (GST2013, BGSS2023), none shared (each is a sentence of ownership or a locator of the roadmap's own); largest share GST2013, 36 of the 73 line locators counted in the earlier review (this change adds one BGSS2023 locator and none to GST2013); contents compared with GST2013: independent, as in the earlier reviews (no layer added, removed or reordered). Alexander1976, Lanford1975 and the four background references were not read.

Research link: Layers 5 to 7 are the finite-particle dynamics of Alexander (1976) as used by Gallagher, Saint-Raymond and Texier (2013); Layers 9 and 10 are the grand canonical setting and the statement of Lanford's theorem in Bodineau, Gallagher, Saint-Raymond and Simonella (2023), also the setting of Deng, Hani and Ma (2024). Rests on the three texts read.

## Not verifiable

- Alexander1976 Proposition 4.3 (§6.4): uncertified, not read; the locator rests on GST2013 line 855 and lines 5439–5440.
- Lanford1975 as the fixed-`N` statement (§10.4): uncertified, not read; rests on BGSS2023 lines 313–315.
- The published versions of GST2013 and BGSS2023: numbering checked in the arXiv versions the README cites only.
- The description's sentence on AI assistance (the number of review and red-team rounds): a statement about process, not checkable against the folder.

## Source issues

- **Misprint** in GST2013 at (4.4.1), printed page 33 (line 1222): the source says the starred velocities are the pre-image under (4.1.1), the free-flow equations; it should be (4.1.2), the reflection law; affects nothing.

## For the human reviewers

- `HardSphere.LanfordStatement.tendsto_empirical` assumes `HardSphere.LanfordStatement d`. The README (lines 13, 935, 954) leaves its proof to an unnamed roadmap on the BBGKY and Boltzmann hierarchies; no roadmap on main or in an open pull request states or proves it.
- BGSS2023 prints Theorem 1 without proof (line 322 refers elsewhere); GST2013 Theorem 8 (lines 2069–2080) prints convergence of velocity averages only. The uniform and almost-everywhere clauses of `LanfordStatement` rest on BGSS2023's wording (README line 893).
- Alexander1976 and Lanford1975 are cited by locator without their text (paywalled); the published numbering of GST2013 and BGSS2023 was not compared with the arXiv versions cited.
