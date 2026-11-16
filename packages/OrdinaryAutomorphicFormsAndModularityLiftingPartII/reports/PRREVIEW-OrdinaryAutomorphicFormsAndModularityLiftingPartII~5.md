# Review of OrdinaryAutomorphicFormsAndModularityLiftingPartII (pull request #2268 at 1c1996f)

**Verdict:** accepted

Incremental re-review of 2 changed lines since `9210046` (item 2 of the README's Summary), and of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: the description's summary block now reads “a seed, regular algebraic or of weight 2, on one ordinary component at each place above p”, with “ordinary of weight 2 above p” on the residual representation.

## Verified sound

| Statement | Instances tried | Computed value | Required or competing value | Result / change |
|---|---|---|---|---|
| Summary item 2, weight of π (changed) | π regular algebraic, (k_v, l_v; 2); π of weight 2, (1, 1; 2) | Summary admits 2 of 2 | §5.4 (line 622): 2 of 2; BCGP25 lines 6620–6644: 2 of 2 | Agrees |
| Summary item 2, ramified-place conditions (changed) | p = 3: q_v = 7, 19; p = 5: q_v = 11; R empty | 7 mod 9 = 7, excluded; 19 mod 9 = 1, allowed; 11 mod 5 = 1, allowed; empty R: vacuous | §5.4 (5) and Checks (lines 633, 635): same four outcomes; BCGP25 lines 6638–6641 | Agrees |
| Summary item 2, the set of places (changed) | R = the prime-to-p ramified places; R strictly larger | Summary's conditions are §5.4 (5) for the smallest admissible R | §5.4 lets R contain that set; condition (5) on the larger R implies it on the smaller | Summary is the instance R minimal: sound |
| Summary item 2, component condition (changed) | residually p-distinguished; not p-distinguished | “unique ordinary component at each v \| p”: automatic in the first case, a hypothesis in the second | §5.4 (4) and first Check; BCGP25 lines 6635–6637, 6655–6656 | Agrees |
| Summary item 2, conclusion (unchanged clause, cited by the change) | T reduced; T = Λ[z]/(z², uz) of §6.3's last Check | Same reduced quotient in both; z ≠ 0, z² = 0 in the second | §6.3: `(R)_red ≅ (T)_red`; §6.4: finite over `Λ_{GSp₄,F⁺}`; BCGP25 lines 6694–6696, p. 148 | Agrees, with the README's recorded correction of the source |
| Summary item 2, “general type” not repeated | π with ρ̄ GSp₄-reasonable | ρ̄ absolutely irreducible (§5.2 API), and the sentence names the seed datum of 5.4 | §5.4 states general type; BCGP25 §6.3 (lines 6620–6626) does not state it | No conflict |
| Description, summary block: symplectic sentence | Each clause against Summary item 2 | 7 clauses: p > 2 split, finiteness, reduced R = T, ramified-place conditions, reasonable and tidy, weight 2 above p, seed weight and component | 7 of 7 present at the head | Agrees |
| Description: “the seven headline theorems … no declarations” | Bullets of the `Suggested.lean` docstring | 4.7, 4.8, 3.2(b), 6.3, 6.4, 5.3, 1.2(4): 7 named, 0 declarations | 7, none stated | Agrees |

Rows for the untouched statements stand as in the previous review, of `9210046`.

- Source locators checked: 3 passages of BCGP25 (§6.3 opening and Hypothesis 6.3.1, lines 6620–6644, p. 146; Remark 6.3.2 and the choice of w₀, lines 6647–6662, p. 147; Theorem 6.3.4, lines 6694–6696, p. 148). The seeded target 6.4 cites Theorem 6.3.4, p. 148: the page and the finiteness assertion are there. No other seeded target lies in or cites the changed sentence.
- Pull-request text: title (“roadmap”; a new folder, 847 insertions, 0 deletions, 61 headings added, 0 removed) and every prose sentence of the description compared with the head; 0 contradicted, no change left unstated. 12 `From TauCetiRoadmap.*` subsections in the README, the same 12 names in the description's dependency block.
- Cross-roadmap citations: the changed sentence adds none. GSp4NonregularModularityLifting (README lines 181, 183) consumes §§5.4 and 6.3–6.4 from this roadmap and does not restate the seed datum.
- Library declarations: the change touches none; `Suggested.lean` has 0 declarations, so 0 binder checks and 0 one-tactic probes apply.
- Gate at this head: every check 0, `OK`. `lake env lean` on `Suggested.lean`: exit 0, no output. 0 files changed outside the folder.
- Dependency check output: `depcheck: 234 roadmaps, 2228 edges, 0 problem(s)`.

Overlap check: read PotentialAutomorphyInfrastructurePartII, GSp4NonregularModularityLifting, AbelianSurfacesModularity, AutomorphyLiftingBeyondTaylorWiles, PotentialAutomorphyInfrastructure and GlobalGaloisDeformations (the main-vocabulary list is empty) for the objects of the changed sentence; the ordinary GSp₄ seed datum and the symplectic theorem are owned here (§§5.4, 6.3, 6.4) and cited by GSp4NonregularModularityLifting; nothing else shared. The overlap facts list no dropped id, no second copy and no other pull request changing this roadmap.

Source independence: changed passages only; 1 passage (Summary item 2) compared with 1 source (BCGP25 lines 6620–6644, 6694–6696), none shared beyond the hypotheses' forced wording (longest shared run under 8 words); largest share BCGP25, unchanged from the previous review; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- §3.2(b)'s inputs (★) and (C) remain unproved in the sources and are kept as targets, with §4.8 conditional on the bound; unchanged by this head.

## Source issues

- none

## For the human reviewers

- none
