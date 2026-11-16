# Review of RankZeroOneBSDPartII (pull request #1732 at 249b5e4)

**Verdict:** needs changes

Incremental re-review: the folder is unchanged since the previous review of `249b5e4` (0 lines). This round read the pull request's title and description against the head, and re-resolved the cross-roadmap citations against the open heads as they are now. R01 and R02 rest on the open head of RankOneConverse (pull request #1805, head `9b5c88a`, dated 2026-11-05), which the previous review could not read: it recorded RankOneConverse as a design package only. They are raised for that reason, although the README text is untouched.

## R01 (P2) — gap:complementary-heegner-twists asks ArithmeticStatisticsPartVI for a theorem RankOneConverse §4.1 states

**Location** `TauCetiRoadmap/RankZeroOneBSDPartII/README.md:107`: "What ArithmeticStatisticsPartVI must provide (gap:complementary-heegner-twists): For every rational elliptic curve and finite set of rational primes, prove both complementary imaginary-quadratic twist nonvanishing branches with those primes split …"; consumed at line 197 (§1.1 *Needs:*).

**Claim** The gap's content has an owner earlier in the merge order. A gap that asks for what an earlier roadmap provides is not minimal, and the theorem would have two owners.

**Witness** RankOneConverse (#1805) `README.md:401`, §4.1: for every trivial-nebentypus newform and finite S₀, `infinite_twist_analyticRank_eq_zero` (ε(g)δ>0) and `infinite_twist_analyticRank_eq_one` (ε(g)δ<0), all of S₀ split; line 19 calls §4.1 the "single owner".

**Repair** Delete the gap sentence at line 107 (and its entry in the plan's `gaps`), and cite RankOneConverse §4.1 in its place, in the contracts and in the §1.1 *Needs:* line and Layer 1 Dependencies: "Apply RankOneConverse §4.1 “General quadratic nonvanishing with local prescriptions” to the newform of E (EllipticCurveModularity R29.3) with S₀ the primes dividing 2pN. For w(E)=−1 its rank-zero branch gives δ<0 with twist order 0; for w(E)=+1 its rank-one branch gives δ<0 with twist order 1. Splitting at 2 makes δ odd and infinitude gives δ<−4." Tested on both instances: ε=−1 needs εδ>0, so δ<0 and the twisted sign ε·sgn(δ) is +1; ε=+1 needs εδ<0, so δ<0 and the sign is −1. Both agree with §1.1's analyticRank(E^K)=1−r. RankOneConverse precedes this roadmap in the merge order and does not cite it as a supplier, so no cycle arises.

## R02 (P3) — "RankOneConverse §§PC.0–PC.6" does not resolve at RankOneConverse's head

**Location** `TauCetiRoadmap/RankZeroOneBSDPartII/README.md:7`: "the irreducible-residual localization criteria belong to RankOneConverse §§PC.0–PC.6."

**Claim** RankOneConverse has no section numbered PC.0–PC.6.

**Witness** RankOneConverse (#1805) `README.md`: headings "## Layer 0: residual restriction and the Heegner normalization" (line 185) to "## Layer 6: the rational rank-zero converse" (line 538); `grep 'PC\.[0-9]'` returns nothing.

**Repair** Replace "RankOneConverse §§PC.0–PC.6" by "RankOneConverse Layers 0–6".

## R03 (P3) — the description says the Lean states definitions and theorems, and that the build warns of `sorry`

**Location** Pull request description: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti" and "the targeted Lake build succeeds with `sorry` as the only warning".

**Claim** The head's `Suggested.lean` declares nothing, so there is no `sorry` and no warning. The reader is not told that no headline theorem is statable at the pins.

**Witness** `TauCetiRoadmap/RankZeroOneBSDPartII/Suggested.lean:9-10`: "None of them is statable at the pins, so no declaration is stated here"; lines 34–36 are an empty namespace; `lake env lean` on it prints nothing (exit 0).

**Repair** Replace the first sentence by: "`Suggested.lean` states no declaration: none of the headline theorems is statable at the pins, and its module docstring names each one with the carriers it lacks (classical odd-primary elliptic Selmer groups with their Kummer and Sha identifications, ordinary anticyclotomic Selmer modules, normalized Heegner families, the continued elliptic L-function identified through modularity; for the proportions also the isogeny-kernel character and the Selmer-ratio family)." Replace the second by: "the targeted Lake build succeeds with no warning (the file contains no `sorry`)".

## R04 (P3) — the description calls Layer 4 the top layer and omits Layer 5

**Location** Pull request description, summary block: "The top layer turns restricted three-Selmer bounds into positive lower proportions of rank-zero and rank-one quadratic twists".

**Claim** The proportions are Layer 4. The last layer is Layer 5, which depends on Layer 4 and which the description does not mention.

**Witness** `README.md:348` "## Layer 4: Admissible quadratic twists and positive proportions"; `README.md:439` "## Layer 5: Concrete models and scope diagnostics", whose Dependencies (line 544) begin "Layer 4".

**Repair** Replace "The top layer turns" by "Layer 4 turns", and add after that sentence: "Layer 5 computes two diagnostic curves: for y²+y=x³+x²+x the admissible twists are exactly d≡2 (mod 3), of density 3/8, and y²+xy+3y=x³ has a rational 3-isogeny but no quadratic twist with good reduction at 3, so the good-at-3 hypothesis is kept."

## Previous findings

- none: the previous report, of `249b5e4`, was an acceptance with no finding.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 complementary twist against RankOneConverse §4.1 (R01) | r=1 (w(E)=−1); r=0 (w(E)=+1); 2, p and primes of N in S₀ | ε=−1: εδ>0 ⇒ δ<0, twisted sign ε·sgn(δ)=+1, order 0=1−r; ε=+1: εδ<0 ⇒ δ<0, sign −1, order 1=1−r | §4.1 covers both branches of the gap | R01 |
| Scope line 7, RankOneConverse boundary (R02) | headings of RankOneConverse at `9b5c88a` | "PC." matches: 0; Layer headings: 7 (Layers 0–6, lines 185–538) | does not resolve | R02 |
| Description, "the Lean states … definitions and theorems" (R03) | `Suggested.lean` at the three commits of the branch | declarations: 0, 0, 0; `sorry`: 0; elaboration output: 0 lines, exit 0 | contradicted | R03 |
| Description, "The top layer" (R04) | README layer headings | layers 0–5; proportions at Layer 4 (line 348); Layer 5 (line 439) depends on Layer 4 | contradicted | R04 |
| §3.1, cited by the description ("subtraction of central orders") | r=0, 1 | 1−(1−0)=0; 1−(1−1)=1 | description agrees | none |
| Description, hypotheses of the converse | p=2; p∣N; φ restricted to G_p equal to 1 or ω; p=3 with unramified quadratic η | first three rejected by lines 23 and 129; η admitted (line 145) | description agrees | none |

The rows for all other statements stand as in the previous review, of `249b5e4`.

- Description sentences read against the head: 16 (summary block and prose); 14 agree, 2 contradicted (R03, R04). The title agrees: the folder is not on main (`666d57e`) and the pull request adds it (599 insertions, 0 deletions, 46 headings added, none removed).
- Cross-roadmap citations re-resolved at current heads: CMRankZeroConverse (#1744) §0.1 at line 161 and Layers 0–6 at lines 159–530; HeegnerPointEulerSystems (#1423) §§8.13, 8.31, 8.34, 8b.2, 8b.10 at lines 1560, 1828, 1870, 2076, 2167; RankOneConverse (#1805) fails (R02). EllipticCurves, ModularForms, PadicMeasuresIwasawaAlgebras are on main and GlobalNumberFields is under `Completed/`.
- Second copy: main has no `RankZeroOneBSDPartII` and no `RankZeroOneBSD` folder; the overlap list shows no other open pull request changing this roadmap and no dropped id.
- Gate at this head, my own run: every check OK, exit 0 (the worker's run also passed, `build=0`). Outside-folder diff against `origin/main`: empty. Worktree clean.
- Elaboration: `lake env lean TauCetiRoadmap/RankZeroOneBSDPartII/Suggested.lean` exits 0 with no output. No declaration exists, so there was nothing for the one-tactic probe or `#check` comparison.
- Dependency check with `--movable`: `depcheck: 233 roadmaps, 2228 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. This roadmap is at line 402 of the merge order, after RankOneConverse and CMRankZeroConverse.
- Declared gaps: the other three (eisenstein-local-dictionary, quadratic-analytic-factorization, cgls-ordinary-control) are unchanged and stand as in the previous review; the fourth is R01.
- Remark: the generated depends-on block lists RankOneConverse (#1805) although the README cites it only as a scope boundary; with R01's repair it becomes a supplier and the block is then right.

Overlap check: read CMRankZeroConverse, RankOneConverse, HeegnerPointEulerSystems; the rank-r p-converse proposition is owned by CMRankZeroConverse §0.1 and cited here (line 117); quadratic twist nonvanishing with split prescriptions is owned by RankOneConverse §4.1 and requested here from ArithmeticStatisticsPartVI (R01); the Eisenstein anticyclotomic equality is owned by HeegnerPointEulerSystems §8b.10 and cited here.

Source independence: 0 passages compared (changed passages only: the folder did not change); largest share CGLS, as counted in the earlier full review; contents not compared again, since no layer was added, removed or reordered.

## Not verifiable

- The description's "after 1 independent review round and 2 red-team rounds on the job board": a statement about the board's history, not about the head; not checked.

## Source issues

- none (no source locator was re-read this round; the two CGLS gaps recorded by the earlier full review at Corollary 5.2.3 and Remark 5.2.4, printed p. 575, stand as recorded there).

## For the human reviewers

- **Scope.** `README.md:552-554` states that CGLS Corollary 5.2.3 and the percentages of Remark 5.2.4 (printed p. 575) are not reached by the converse without a good-at-3 twist; the roadmap adds that hypothesis to a published statement.
- **Not tested.** `Suggested.lean` states no declaration (every headline is named as not statable at the pins), so the build tests no mathematics of this roadmap.
