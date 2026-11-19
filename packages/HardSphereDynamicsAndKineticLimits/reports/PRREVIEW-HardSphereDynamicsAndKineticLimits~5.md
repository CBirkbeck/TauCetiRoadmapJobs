# Review of HardSphereDynamicsAndKineticLimits (pull request #2448 at 5619cb5)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 4 lines changed since `6ffdf49`: the conservation bullet of §5.1 now carries its interval hypothesis and the opening overview now states `0 < ε < ρ` with the two exceptions, and both are correct; the three small corrections of the previous review are repaired. The title and description were read against this head and agree with it. No small correction and no format note. Three points are left for the human reviewers, as before.

## Previous findings

The previous review, of `6ffdf49`, had no finding (no R item); its three small corrections are accounted for here.

- C01 — repaired: §5.1, line 380, reads "Conservation: for an interval `J`, `P(V(t))` and `H(V(t))` are constant on `J`." The two-interval counterexample is excluded; on an interval the statement holds (table below).
- C02 — repaired: the overview, line 3, reads "Throughout this overview 0 < ε < ρ, except for the group law and the reversibility of the flow, which hold for every real ε." Both exceptions match `HardSphere.flow_add` and `HardSphere.flow_reversal`.
- C03 — repaired: the description now reads "is left to BoltzmannGradLimitAndLanford, §5.2, a consumer of this roadmap, listed among the downstream consumers, that is another author's open pull request; it is not a prerequisite", and states the structure independence of §10.4.

## Verified sound

| Statement | Instances tried | Values computed (roadmap / check) | Result | Change |
|---|---|---|---|---|
| §5.1 conservation bullet, for an interval `J` | head-on witness (d = 2, ε = 1) across time 1; general contact with normal ν; normal 0 (ε ≤ 0 or ε ≥ ρ); `J = [0,1] ∪ [2,3]` | `P = (−1,0)`, `H = 1/2` on both sides of time 1; energy change `2a²(‖ν‖² − 1)` with `a = ⟨v−w,ν⟩`: 0 for `‖ν‖ = 1`, and `a = 0` for ν = 0; disconnected `J` (`H` = 0 then 1/2) now excluded | true for every real ε, as the Conventions (line 26) say | none |
| Overview, standing hypothesis `0 < ε < ρ` with two exceptions | `HardSphere.flow_add`, `HardSphere.flow_reversal` (no hypothesis on ε); `HardSphere.measurePreserving_flow`, `HardSphere.weak_liouville` (`0 < ε`, `ofReal ε < ρ`); unit torus d = 2, ε = 0.6 | group law and reversal: ε = −1 rods pass, both sides agree; Alexander's theorem at ε = 0.6 > ρ = 1/2 fails (complement of infinite measure), now excluded by the sentence | overview agrees with §6.4, §7.1–7.3, §9.4, §9.6 | none |
| `HardSphere.IsTrajectory.eqOn` (cited by the changed bullet's hypothesis) | `J` order-connected against `J = [0,1] ∪ [2,3]` | on the two-interval set two trajectories agreeing on `[0,1]` differ at time 2 (jump 5 against jump 0); on an interval none | Lean carries the interval hypothesis the bullet now states | none |

The rows for the untouched statements stand as in the previous review, of `6ffdf49`.

- Changed passages: 2 README lines (overview line 3; §5.1 line 380); `Suggested.lean` and `metadata.toml` unchanged since `6ffdf49`; nothing changed outside the folder. No layer added, removed or reordered.
- Seeded sample: none of the 15 sampled sections contains a changed passage; the changed bullet carries no source locator. Source locators checked this round: 0 new (the 73 of the previous review stand).
- Library declarations opened: none new; the two Lean statements the overview sentence names, `HardSphere.flow_add` (no ε hypothesis) and `HardSphere.flow_reversal` (none), and `HardSphere.measurePreserving_flow`, `HardSphere.weak_liouville` (both hypotheses), read in `TauCetiRoadmap/HardSphereDynamicsAndKineticLimits/Suggested.lean` lines 294–330.
- Cross-roadmap citations resolved again: ClassicalErgodicTheory §3.5 items 1, 3, 4 and §0.2 at its open head (items as cited: conull flows, disjoint unions, transport of densities); BoltzmannGradLimitAndLanford §5.2 at its open head (proves `HardSphere.LanfordStatement d` for `d ≥ 2`). No citation found nowhere.
- Automatic checks: all passed. Dependency check: `depcheck: 199 roadmaps, 2189 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 11 `declaration uses sorry` warnings (lines 262–515) and nothing else; single `import Mathlib`, no `set_option`.
- Pull-request text against the head: it adds the roadmap (not on main; 3 files, 68 headings, 33 declarations, 11 sorried theorems, as it says); suppliers as stated (ClassicalErgodicTheory §3.5 items 1, 3, 4 in §7.2, §7.5, §8.1, §9.4; the ownership citations of ClassicalErgodicTheory §0.2, MathematicalBilliards, RandomMatrices, ProbabilisticAndMetricNumberTheory, ComplexTori are in the README; Tau Ceti declarations for the Gaussian density and strongly continuous groups); the summary block's statements (Alexander's theorem for `0 < ε < ρ`, the law of large numbers from two correlation functions, the consumer BoltzmannGradLimitAndLanford) agree with §6.4, §10.4, §10.5 and the Downstream consumers. No sentence contradicted, no change left unstated.
- Padding probe and headline list: unchanged file, stand as in the previous review (11 headlines stated, none closes in one tactic).

Overlap check: read BoltzmannGradLimitAndLanford, ClassicalErgodicTheory, PointProcesses, RelativisticQuantumFieldTheory, LangevinAndHamiltonianMonteCarlo, MathematicalBilliards, OptimalTransport, ProbabilisticAndMetricNumberTheory; nothing shared. (BoltzmannGradLimitAndLanford and ClassicalErgodicTheory were read again at their heads this round; for the others the previous review's reading stands, the change touching no object.) `HardSphere.LanfordStatement` is owned here and its proof by BoltzmannGradLimitAndLanford §5.2; conull flows are ClassicalErgodicTheory §3.5's, cited. No open pull request changes this roadmap, drops an id it cites, or is a second copy.

Source independence: changed passages only: 2 passages compared with 3 sources (GST2013, BGSS2023, DengHaniMa2024), none shared (each is one sentence of the roadmap's own, a hypothesis on ε and an interval hypothesis); largest share GST2013, 36 of 73 line locators; contents compared with GST2013: independent, as in the previous review (no layer added, removed or reordered). Alexander1976, Lanford1975 and the four background references were not read.

Research link: Layers 5 to 7 are the finite-particle dynamics of Alexander (1976) as used by Gallagher, Saint-Raymond and Texier (2013); Layers 9 and 10 are the grand canonical setting and the statement of Lanford's theorem in Bodineau, Gallagher, Saint-Raymond and Simonella (2023), also the setting of Deng, Hani and Ma (2024). Rests on the three texts read.

## Not verifiable

- Alexander1976 Proposition 4.3 (§6.4): uncertified, not read; the locator rests on GST2013 line 855 and lines 5439–5440.
- Lanford1975 as the fixed-`N` statement (§10.4): uncertified, not read; rests on BGSS2023 lines 313–315.
- The published versions of GST2013 and BGSS2023: numbering checked in the arXiv versions the README cites only.
- The description's sentence on AI assistance (the number of review and red-team rounds): a statement about process, not checkable against the folder.

## Source issues

- **Misprint** in GST2013 at (4.4.1), printed page 33 (line 1222): the source says the starred velocities are the pre-image under (4.1.1), the free-flow equations; it should be (4.1.2), the reflection law; affects nothing.

## For the human reviewers

- `HardSphere.LanfordStatement.tendsto_empirical` assumes `HardSphere.LanfordStatement d`; the roadmap assigned to prove it, BoltzmannGradLimitAndLanford (README lines 893, 935, 954), is an open pull request by another author whose `Suggested.lean` states no theorem.
- BGSS2023 prints Theorem 1 without proof (line 322 refers elsewhere); GST2013 Theorem 8 (lines 2069–2080) prints convergence of velocity averages only. The uniform and almost-everywhere clauses of `LanfordStatement` rest on BGSS2023's wording (README line 893).
- Alexander1976 and Lanford1975 are cited by locator without their text (paywalled); the published numbering of GST2013 and BGSS2023 was not compared with the arXiv versions cited.
