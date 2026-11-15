# Review of FiniteGroupInvariants (pull request #1708 at 60b9e45)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since `60b9e45`: the folder is as the previous review accepted it. This round read the pull request's title and description against the head. Both findings are in the description; neither asks for a change to the roadmap's files.

## R01 (P3) — The description counts 64 milestones; the head has 59 sections

**Location:** pull request description, file list: "`TauCetiRoadmap/FiniteGroupInvariants/README.md`: the roadmap, 11 layers and 64 milestones."

**Claim:** The count is that of the first head. The head has 11 layers and 59 numbered sections, and the README no longer uses the word "milestone".

**Witness:** `grep -c '^### [0-9]' TauCetiRoadmap/FiniteGroupInvariants/README.md` gives 64 at `19a7fe9` and 59 at `60b9e45` (Layers 0–10: 9, 8, 1, 7, 4, 4, 8, 6, 3, 4, 5).

**Repair:** Replace the bullet by: "`TauCetiRoadmap/FiniteGroupInvariants/README.md`: the roadmap, 11 layers (0–10) and 59 sections." In the next bullet, replace "what can be stated over Mathlib and the pinned Tau Ceti" by "the headline theorems statable over Mathlib and the pinned Tau Ceti (54 theorems; the character form of Herbrand's theorem, 9.3, is not statable)".

## R02 (P3) — The description lists Malle invariants as specified here; the head imports them

**Location:** pull request description, first prose paragraph: "Specifies the finite-group vocabulary … that Mathlib and Tau Ceti lack: … Gassmann classes with Perlis' theorem, Malle invariants, Z[C_p]-lattices and unit modules, …"

**Claim:** The Malle invariants are a supplier's. Layer 8 owns the division count of `b(ℚ, G)`, `d_ind(G)`, concentrated groups and elusive groups; the paragraph does not name the last three.

**Witness:** README 70–71: "**ArithmeticStatisticsPartV** §3.9 *Malle invariants of a permutation group* (the index `ind(g)`, `ind(G)`, `a(G)` and `b(H, G)`)", under "does not plan again"; README 1347–1348 says the same.

**Repair:** Replace "Malle invariants," by "elusive permutation groups, with `d_ind(G)` and the division count of Malle's `b(ℚ, G)` (the Malle invariants themselves are ArithmeticStatisticsPartV §3.9's),".

## Previous findings

- none: the previous report, of `60b9e45`, had no finding to account for.

## Verified sound

### The pull request's text against the head

| Passage of the description | Checked against | Outcome |
|---|---|---|
| Title, "feat: roadmap for finite group invariants" | The folder is not on `origin/main`; the pull request adds it (3 files, 2527 insertions, nothing outside the folder). | sound |
| Summary block, first paragraph (the results built) | README Summary 3–23 and the headings of Layers 0–10: every result named is a target (0.2, 0.5, 2.1, 3.6, 4.3, 5.1, 6.4, 6.8, 7.4, 9.1–9.4, 10.2–10.5). | sound |
| "Jordan bounds supply SatoTateGroups; Gassmann equivalence supplies AdelicImagesAndModularCurves and QuaternionArithmetic" | README `## Downstream consumers`, 1719–1723: the same three consumers for 10.5, 7.1 and 7.3. | sound |
| "reuses Mathlib's lattice Jordan–Hölder theorem and Tau Ceti's character descent, cyclotomic realization and order theory" | `CompositionSeries.jordan_holder` (0.2); CharacterTheory §4.4, §4.5 and `FDRep.exists_simple_nonempty_iso_baseChange_of_isCyclotomicExtension` (10.5); ClassicalArithmeticCompletion Layer 7 (9.1), on main. | sound |
| "Jordan–Zassenhaus treats all lattices over orders in semisimple rational algebras, reducing to maximal orders and finite lattice quotients" | README 9.1, 1413–1432. | sound |
| "Gassmann equivalence extends to finite-index subgroups of arbitrary groups"; "cyclotomic descent carries Jordan's theorem … to every field of characteristic zero" | README 7.3 (heading at 1213) and 10.5, 1653–1668. | sound |
| "The optimal Jordan constant is (n + 1)! in dimension n ≥ 71, assuming the classification" | README 10.5, 1689–1693; computed below. | sound |
| "`metadata.toml`: arXiv topic `math.GR`" | The file is the one line `topic = "math.GR"`. | sound |
| "11 layers" | `grep -c '^## Layer'` gives 11. | sound |
| Suppliers | The prose names none. The generated `depends-on` block lists the four suppliers that are still open (ArithmeticGaloisRepresentations, ArithmeticStatisticsPartV, InductionRestrictionPartII, InverseGaloisAndArithmeticFundamentalGroups); CharacterTheory, InductionRestriction and ClassicalArithmeticCompletion are on main. The generated blocks are outside this check. | sound |

### Adversarial table

| Statement | Instances | Values: left / right | Result |
|---|---|---|---|
| 10.5, `jordanBound n = (n + 1)!` for `n ≥ 71` (cited by the summary block) | `S_{n+1}` at `n = 71`; `n = 2`; `n = 0, 1` | `S₇₂` on its 71-dimensional standard representation has abelian normal subgroups `1` only, of index `72!`, so `jordanBound 71 ≥ 72!`. At `n = 2`, `3! = 6 < 60 ≤ jordanBound 2` (`SL(2,5)` modulo its centre), so a threshold is needed. `jordanBound 0 = jordanBound 1 = 1`, while `1! = 1` and `2! = 2`. | sound |
| 10.2 and 10.4, Minkowski's bound and the dimension-four counts (cited by the summary block) | `n = 4` | Exponents: `ℓ = 2`: `4 + 2 + 1 = 7`; `ℓ = 3`: `⌊4/2⌋ = 2`; `ℓ = 5`: `⌊4/4⌋ = 1`; product `2⁷ · 3² · 5 = 5760`. `1152 · 5 = 5760`. `710 ≥ 227`. | sound |
| 8.1, `b(ℚ, G)` as a count of divisions (R02) | `C₃ ≤ S₃`; `C₂ × C₂` regular; `S₄` | `C₃`: the classes `{(123)}`, `{(132)}` have index `3 − 1 = 2` and `(123)² = (132)`: one division, `b = 1`, against 2 classes. `C₂²`: three involutions of index `4 − 2 = 2`, each its own division: `b = 3`. `S₄`: transpositions, index `1`: `b = 1`. | sound |
| 8.2, `d_ind(G)` (R02) | `A₄` on 4 points; `S_n` | `A₄`: 3-cycles have index `4 − 2 = 2` and double transpositions `4 − 2 = 2`; `d_ind = lcm(3, 2) = 6`, and they generate `A₄`. `S_n`: `d_ind = 2`. | sound |
| The section count (R01) | first head `19a7fe9`; head `60b9e45` | 64 / 59 numbered sections; 11 / 11 layers. | description stale |

The rows for every other statement stand as in the previous review, of `60b9e45`.

- **Gate (worker's, `gate.md`):** every check 0, `build=0 OK`.
- **Gate (my run of the brief's command):** every check 0 except `depcheck: NOT IN ORDER: FiniteGroupInvariants (insert it after its last supplier)`; the configured order does not list this roadmap yet, which is not a finding.
- **Dependency check** (the brief's `--depcheck … --movable` command against the candidate order): `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The candidate order has InverseGaloisAndArithmeticFundamentalGroups at line 54, ArithmeticStatisticsPartV at 56, ArithmeticGaloisRepresentations at 58, InductionRestrictionPartII at 66 and FiniteGroupInvariants at 67.
- **Elaboration:** `lake env lean` of `TauCetiRoadmap/FiniteGroupInvariants/Suggested.lean` exits 0 with 53 warnings, all `declaration uses sorry`; no error.
- **Cross-roadmap citations resolved this round:** 1. ArithmeticStatisticsPartV §3.9 at its open head has the target *Malle invariants of a permutation group* (README 1079 there) with `ind(g)`, `ind(G)`, `a(G)`, `b(H, G)`.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FiniteGroupInvariants'` is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- **Seeded sample:** none of the fifteen targets lies in a changed passage, since the folder did not change; 8.2 is computed above because R02 touches it. No source locator was opened this round.
- **Overlaps:** `overlaps.md` lists no open pull request that changes this roadmap, no dropped id and no close roadmap by results. Overlap check: not read again this round (InductionRestriction, CharacterTheory and NumberFieldArithmetic stand as the previous review left them; nothing shared was reported).
- Source independence: 0 passages compared (changed passages only; the folder did not change); the arrangement was not compared again, since no layer was added, removed or reordered.

## Not verifiable

- "One of 23 roadmaps for the mathematics behind the LMFDB, opened as drafts" (description): a statement about other pull requests, not checkable against this folder.
- Unchanged from the previous review: the uncertified and waived sources (guralnick-1980, guralnick-1982, perlis-1977, huppert-eg1, isaacs; robinson, aschbacher, curtis-reiner-1962, reiner-maximal-orders, karpilovsky, bbnwz, collins, gaschutz, hall-1936, johnson-1971).

## Source issues

- none

## For the human reviewers

- none
