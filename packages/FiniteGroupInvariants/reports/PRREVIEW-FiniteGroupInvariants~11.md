# Review of FiniteGroupInvariants (pull request #1708 at 8d40840)

**Verdict:** accepted

Incremental re-review of 0 changed lines since `60b9e45`. No finding. This round read the pull request's title and description against the head.

## Previous findings

- R01 — repaired: the description now reads "the roadmap, 11 layers (0–10) and 59 sections" and "53 theorems with `sorry` and the definitions they need. The character form of Herbrand's unit theorem (9.3) is not statable at the pins".
- R02 — repaired: the description now reads "elusive permutation groups with the Fein–Kantor–Schacher theorem, `d_ind(G)` and concentrated groups, Malle's `b(ℚ, G)` as a count of divisions (the index `ind`, `a(G)` and `b(H, G)` themselves are ArithmeticStatisticsPartV §3.9's)".

## Verified sound

### The pull request's text against the head

| Passage of the description | Checked against | Outcome |
|---|---|---|
| Title, "feat: roadmap for finite group invariants" | The folder is not on `origin/main`; the pull request adds it (3 files, 2527 insertions). | sound |
| "11 layers (0–10) and 59 sections" | `grep -c '^## Layer'` gives 11; `grep -c '^### [0-9]'` gives 59 (per layer 9, 8, 1, 7, 4, 4, 8, 6, 3, 4, 5). | sound |
| "53 theorems with `sorry`" | 53 `theorem` declarations (a 54th line beginning "theorems" is the module docstring's line 12); 53 `declaration uses sorry` warnings. | sound |
| "The character form of Herbrand's unit theorem (9.3) is not statable at the pins" | `Suggested.lean` module docstring, lines 15–23: the same theorem, lacking the `ℤ[Gal(L/K)]`-module structure of the units modulo torsion. | sound |
| "elusive permutation groups with the Fein–Kantor–Schacher theorem, `d_ind(G)` and concentrated groups" | README 8.3 (1375–1391) and 8.2 (1361–1373). | sound |
| "Malle's `b(ℚ, G)` as a count of divisions (the index `ind`, `a(G)` and `b(H, G)` themselves are ArithmeticStatisticsPartV §3.9's)" | README 8.1 (1350–1354), 70–71, 228 and 1347–1348; ArithmeticStatisticsPartV at its open head, README 1077–1079, §3.9 *Malle invariants of a permutation group*. | sound |
| Summary block, the results built and the consumers named | README Summary 3–23, the headings of Layers 0–10, and `## Downstream consumers` 1719–1723 (SatoTateGroups, AdelicImagesAndModularCurves, QuaternionArithmetic). | sound |
| "`metadata.toml`: arXiv topic `math.GR`" | The file is the one line `topic = "math.GR"`. | sound |
| Suppliers | The prose names ArithmeticStatisticsPartV §3.9 only; the generated `depends-on` block lists the four suppliers still open. The supplier headings of the README (152–230) agree. | sound |

### Adversarial table

| Statement | Instances | Values: left / right | Result |
|---|---|---|---|
| 8.3, elusive groups and the Fein–Kantor–Schacher theorem (cited by the description) | `S₃` on 3 points; `C₄` regular; the trivial group on one point | `S₃`: a 3-cycle has no fixed point, prime order 3: not elusive. `C₄`: `g²` has order 2 and no fixed point; degree `2²`, as the prime-power-degree theorem predicts. One point: no element of prime order, so elusive; the theorem needs degree `> 1`. | sound |
| 8.2, `d_ind(G)` and concentrated groups (cited by the description) | `C₃ ≀ C₂` on 6 points; `A₄` on 4 points | `C₃ ≀ C₂`: one 3-cycle has index `6 − 4 = 2`, two 3-cycles `6 − 2 = 4`, the swap `6 − 3 = 3`; minimal index 2, generated subgroup `C₃ × C₃` of index 2: concentrated, `d_ind = 3`. `A₄`: 3-cycles and double transpositions both `4 − 2 = 2`; `lcm(3, 2) = 6`; they generate `A₄`. | sound |
| 8.1, `b(ℚ, G)` as a count of divisions (cited by the description) | `C₃ ≤ S₃`; `C₂ × C₂` regular | `C₃`: classes `{(123)}`, `{(132)}`, index `3 − 1 = 2`, `(123)² = (132)`: 1 division against 2 classes. `C₂ × C₂`: three involutions of index `4 − 2 = 2`, each rational: 3 divisions. | sound |

The rows for every other statement stand as in the previous review, of `60b9e45`.

- **Gate (worker's):** every check 0, `build=0 OK`.
- **Gate (my run of the brief's command):** every check 0 except `depcheck: NOT IN ORDER: FiniteGroupInvariants (insert it after its last supplier)`; the configured order does not list this roadmap yet, which is not a finding.
- **Dependency check** (the brief's `--depcheck … --movable` command against the candidate order): `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The candidate order has InverseGaloisAndArithmeticFundamentalGroups at line 54, ArithmeticStatisticsPartV at 56, ArithmeticGaloisRepresentations at 58, InductionRestrictionPartII at 66 and FiniteGroupInvariants at 67.
- **Elaboration:** `lake env lean` of `TauCetiRoadmap/FiniteGroupInvariants/Suggested.lean` gives 53 warnings, all `declaration uses sorry`; no error.
- **Cross-roadmap citations resolved this round:** 2. ArithmeticStatisticsPartV §3.9 (open head, README 1077–1079); `Gassmann.almostConjugate_iff_permutation_equiv` in RepresentationTheory/InductionRestriction on main (README 198 there).
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FiniteGroupInvariants'` is empty; `git diff 60b9e45 HEAD` on the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- **Seeded sample:** none of the fifteen targets lies in a changed passage, since the folder did not change. No source locator was opened this round.
- Overlap check: read OddOrderTheorem, InductionRestriction, CharacterTheory; Hall subgroups (`IsHallFor`, existence), chief series and minimal normal subgroups are shared with OddOrderTheorem, owner FiniteGroupInvariants (OddOrderTheorem README 84–87 and 186–194 cites §0.2, §0.3, §2.1 and adds only conjugacy); almost-conjugacy is shared with InductionRestriction, owner InductionRestriction §2.1, cited at README 56–57.
- Source independence: 0 passages compared (changed passages only; the folder did not change); the arrangement was not compared again, since no layer was added, removed or reordered.

## Not verifiable

- "One of 23 roadmaps for the mathematics behind the LMFDB, opened as drafts" (description): a statement about other pull requests, not checkable against this folder.
- Unchanged from the previous reviews: the uncertified and waived sources (guralnick-1980, guralnick-1982, perlis-1977, huppert-eg1, isaacs; robinson, aschbacher, curtis-reiner-1962, reiner-maximal-orders, karpilovsky, bbnwz, collins, gaschutz, hall-1936, johnson-1971).

## Source issues

- none

## For the human reviewers

- none
