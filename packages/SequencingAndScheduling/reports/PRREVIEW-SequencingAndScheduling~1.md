# Review of SequencingAndScheduling (pull request #2917 at 0f6b9b3)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every theorem, proof route and Check was recomputed (degenerate cases included: no jobs, one job, zero and negative processing times, `m = 0`, `T = 0`, ties) and every source locator was read in the text; all hold as written, and `Suggested.lean` elaborates with `sorry` as the only warning. There are no small corrections and two format notes, neither blocking. One question of scope is left for the human reviewers.

## N01 — The supplier line for `MeasureTheory.volume` glosses it as Lebesgue measure on `ℝ`, which that file does not define

In the Mathlib contracts (README line 509), `Mathlib/MeasureTheory/Measure/MeasureSpaceDef.lean` declares `volume` for an arbitrary `MeasureSpace` (line 359 at the pin); the instance that makes it Lebesgue measure on `ℝ` is `Real.measureSpace`, `Mathlib/MeasureTheory/Measure/Haar/OfBasis.lean` line 320. Naming that instance beside `volume` would let a reader find the object Layer 3 uses.

## N02 — A Check on zero-length jobs would pin the non-overlap clause of the flow-shop schedule

The non-overlap clause of 4.1 (`s₁ i + a i ≤ s₁ j` or `s₁ j + a j ≤ s₁ i`) forbids a job of length `0` strictly inside another job's interval but allows it at either endpoint: with `a = (2, 0)`, `s₁ = (0, 1)` both inequalities fail (`1 ≤ 0`, `2 ≤ 1`), while `s₁ = (0, 2)` and `s₁ = (0, 0)` pass. The route of 4.1 already relies on this (its tie-break for jobs of length `0`); a Check stating it would separate the definition from the variant with strict interiors. Offered, not required.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 completion time and Check | `p = (2,1,3)`, order `b,a,c`; strict-prefix variant | `3, 1, 6`; variant `1, 0, 3` | agrees | none |
| 1.1 adjacent exchange bullet | `i` then `j` adjacent | new `C_j = C_i − p_i + p_j`, new `C_i` = old `C_j`; cost change `w_i p_j − w_j p_i` | agrees | none |
| 1.2 Smith, `weightedCompletion_le_iff` | `n = 0, 1`; `p=(1,2), w=(1,3)`; `w=(−1,1)`; ties `p=w=(1,2)`; `p=(0,1)` | both sides true; costs `9` vs `10`; `−1` vs `1`; `7 = 7`; cost `1` optimal but `1 ≤ 1/0 = 0` fails | iff holds for `p > 0`, any real `w`; positivity needed | none |
| 1.3 Lawler, `exists_respectsPrecedence_maxCost_le_last` | Check 1; non-monotone cost; 2-cycle; `p = (−2,−2)`; `J = {l}` | `a,c,b`: `max(0,4,3)=4`; others `6, 6`; `10` vs `0`; no respecting sequence; `1` vs `0`; cost `f l (p l)` | true; each hypothesis needed | none |
| 1.3 route, two lower bounds | any respecting `τ` | last job costs `≥ f l (P)`; deleting `l` gives `≤ cost(τ)`; appended sequence costs their max | sound | none |
| 2.1 Jackson, `IsEDD.maxLateness_le` | `p=(2,1), d=(3,1)`; `p=(−2,−2), d=(0,1)`; no jobs | `0` vs `2`; EDD `−2` > other `−3`; `⊥ ≤ ⊥` | true for `p ≥ 0`; sign needed | none |
| 2.2 `IsEDD.isOnTimeSet_univ_iff` and Checks | `p=d=(1,1)`; `p=(2,−5), d=(1,0)`; empty `J` | both jobs: `2 > 1`; singletons on time; `C_0 = −3 ≤ 1`; both sides true | true | none |
| 2.3 `isOnTimeSet_one_iff` | `D=(1,1,2)`; a deadline `0`; `t = 0` | on-time sets `∅`, 3 singletons, `{0,2}`, `{1,2}`; `{0,1}` has count `2 > 1`; position `k` completes at `k+1 ≥ 1` | both directions hold | none |
| 2.4 `exists_matroid_indep_iff_isOnTimeSet` | `D=(1,1,2)`; `p=(2,1,1), d=(2,2,2)`; augmentation at `t ≤ t*`, `t > t*` | bases `{0,2}`, `{1,2}`; maximal sets `{0}`, `{1,2}`; `#Y(t)+1 ≤ #X(t) ≤ t` | matroid for unit jobs; fails otherwise | none |
| 2.5 `exists_isOnTimeSet_card_max_not_mem` | Check 1; `p=(1,2), d=(1,1)`; `p=(2,2), d=(1,2)`; `k` first in `σ`; `m = k`; `r = k` | `C = 1,4,5`, largest sets `{0,2}`, `{1,2}`; only `{0}`; only `{1}`; `k` never on time; `k ∉ X'`; `C_k ≤ C_σ(k) − p_m ≤ d_k` | true; each hypothesis needed | none |
| 3.1 `IsPreemptiveSchedule` | `m = 0`; `T < 0`; Bernstein set | empty sum `0 = ofReal (p j)` iff `p j ≤ 0`; `Icc 0 T = ∅`; outer measures `1 + 1 > 1` | definition fixes its object | none |
| 3.2 `exists_isPreemptiveSchedule_iff` | `m = 0`; `T = 0`; `p=0, T=−1`; `p=(1,1,−5), m=1, T=1`; no jobs | both sides ⇔ all `p j = 0`; same; schedule exists, `0 ≤ −1` false; sum `−3 ≤ 1` but `2 > 1` needed; both true | iff holds for `p ≥ 0`, `T ≥ 0` | none |
| 3.2 `isLeast_preemptiveMakespan` | `p=(1,1,1), m=2`; `p=(3,1,1), m=2` | `max(1, 3/2) = 3/2` (non-preemptive `2`); `max(3, 5/2) = 3` | agrees with criterion | none |
| 4.1 `exists_followsSequence_of_isFlowShopSchedule` | zero-length jobs at equal starts; empty `J`; general bound | machine-1 order `σ`: `c₂ = max_r (c₁(r) + ∑_{r..q} b) ≤` original finish | true for `a, b ≥ 0` | none |
| 4.1 makespan recursion, Check and Examples | jobs `(3,2),(1,4),(2,2)`, six orders | `012:11, 021:11, 102:9, 120:9, 201:11, 210:10`; lower bound `∑b + min a = 9` | agrees | none |
| 4.2 `exists_johnsonCondition` | three cases of the rule order | `min(a_i,b_j) ≤ a_i ≤ min(a_j,b_i)`; `≤ b_j ≤ min(a_j,b_i)`; `≤ a_i ≤ b_i` and `≤ b_j < a_j` | holds, ties included | none |
| 4.2 `JohnsonCondition.exists_followsSequence` | exchange formula; Check 1; `(1,0),(0,0),(0,1)` | `c₂ = max(y+b_k+b_j, x+a_k+a_j+b_k+b_j − min(a_j,b_k))`; orders `120`, `102` satisfy, four fail; adjacent `0 ≤ 0`, outer `1 ≤ 0` fails, makespans `2` vs `1` | true; all-pairs condition needed | none |
| Padding probe | each of the 12 theorems with `first \| rfl \| simp \| exact?` | 12 errors, none closes | no padding | none |
| Section binders | 23 elaborated types against README | `IsPreemptiveSchedule`, `IsFlowShopSchedule` carry no `[Fintype J]`; neither uses finiteness of `J` | generality equals README | none |

- Source locators checked against the text: 17 of 17 (Lenstra–Shmoys 7, Karger–Stein–Wein 6, Erickson 2, Cheriyan–Ravi–Skutella 2), all at the stated theorem and printed page, with the stated hypotheses.
- Library declarations opened at the pin: `IndepMatroid.ofFinset` and `ofFinset_indep` (`Mathlib/Combinatorics/Matroid/IndepAxioms.lean` 421, 445), `Matroid.ext_indep` (`Matroid/Basic.lean` 731), `measure_biUnion_finset` (`Measure/Basic.lean` 149), `measure_iUnion_le`, `measure_mono` (`OuterMeasure/Basic.lean` 64, 49), `Real.volume_Icc`, `volume_Ico` (`Lebesgue/Basic.lean` 87, 77), `ENNReal.ofReal` (`Mathlib/Basic/ENNReal/Basic.lean` 233), `Relation.TransGen` (core `Init/Core.lean` 1353), `MonovaryOn.sum_smul_comp_perm_le_sum_smul` (`Rearrangement.lean` 71); every cited file exists.
- Pinned Mathlib and Tau Ceti searched by object (completion time, makespan, lateness, flow shop, schedule): nothing on the subject.
- Cross-roadmap citations resolved: MatroidOptimization Layer 2 (greedy theorem) and ApproximationGuarantees 4.1, 4.2 (non-preemptive list schedules), both at their open heads; neither is a supplier.
- Dependency check: `depcheck: 171 roadmaps, 1988 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed; elaboration of `Suggested.lean`: 12 `sorry` warnings, nothing else; single `import Mathlib`, no `set_option`, no sorried data.
- Pull request text: 12 theorems, 10 definitions, 1 structure, locators and suppliers as the description says; no change outside the folder.
- Three names the citation tool could not find (`IsEDD.isOnTimeSet_univ_iff`, `IsEDD.maxLateness_le`, `JohnsonCondition.exists_followsSequence`) are declared in `Suggested.lean` at lines 94, 82, 193.

Overlap check: read ApproximationGuarantees, MatroidOptimization, TuttePolynomialAndArrangements; nothing shared (ApproximationGuarantees owns non-preemptive assignments and list schedules, this roadmap preemptive schedules; MatroidOptimization states no scheduling matroid; no roadmap on main or open states completion times, lateness or flow shops).

Source independence: 22 passages compared with 4 sources, none shared (the route of 2.4 uses the notation `X(t)`, `t*` of Erickson's proof of Lemma E.4, under 7 consecutive words in common); largest share Lenstra–Shmoys, 7 of 17 locators; contents compared with Lenstra–Shmoys (Ch. 3, 4, 5, 10, 13): independent, since Layer 1 joins Ch. 4 with the end of §3.1 and Layer 2 opens with the start of §3.1 and continues with material from other sources.

Research link: the headline theorems are those of Smith (1956), Jackson (1955), Johnson (1954), McNaughton (1959), Lawler (1973) and Moore (1968); Lenstra–Shmoys Ch. 4, 10 and 13 use them as the base of approximation algorithms for `1|prec|∑wC`, `Q|pmtn|Cmax` and flow shops. Rests on the sources read.

## Not verifiable

- none; all four cited texts were read (arXiv for two, the authors' pages for two). The Karger–Stein–Wein copy extracts without usable page breaks, so its pages were read from the printed page numbers in the text.

## Source issues

- **Misprint** in Lenstra–Shmoys, *Elements of Scheduling* (arXiv:2001.06005v1) at Ch. 3, §3.1, p. 2: the source says sorting the due dates takes time `O(log n)`; it should be `O(n log n)`, as on p. 3 of the same chapter; affects nothing.
- **Misprint** in Erickson, *Algorithms*, chapter E at the proof of Lemma E.4, p. 6: the source says `|X(t)| < t` for `t > t*`; it should be `|X(t)| ≤ t`, which is what realisticity of `X` gives and all the proof needs; affects nothing.
- **Misprint** in Erickson, *Algorithms*, chapter E at the proof of Lemma E.3, p. 5: the source says the `t`-th task `i_t` is done by `D[i]`; it should be `D[i_t]`; affects nothing.

## For the human reviewers

- Scope: the headline theorems are textbook classics of 1954–1973. The cited texts are chapters of an unfinished book (arXiv:2001.06005), a handbook chapter (author's copy), lecture notes (Erickson, chapter E) and a three-page 2021 preprint (arXiv:2104.06210).
