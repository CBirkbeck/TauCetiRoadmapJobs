# Review of LovaszLocalLemma (pull request #2857 at b77ca38)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of the five layers was recomputed on degenerate and small instances (negative and unit weights, loops, `d = 0`, `k ≤ 2`, the empty clause, the empty index type), every numerical Check was reproduced, and every source locator and supplier citation was read at its place; nothing false was found. There is one small correction (a sentence of the pull-request description) and three format notes, none blocking. Two points are left to the human reviewers: the main source is a set of lecture notes, and the four original papers were not opened.

## C01 — The description's sentence on generality counts two statements, lists three, and one of the three is in the source

The description says "Two statements are more general than the source and say so" and then names three: the weights `x i ≤ 1`, the "at least `k`" form of the hypergraph and satisfiability criteria, and "at most `k` edges" in the regular-hypergraph criterion. For the hypergraph criterion the source is not narrower: Zhao, Theorem 6.2.6, p. 84, assumes edges with at least `k` vertices each meeting at most `d` others and `e · 2^(1 − k) · (d + 1) ≤ 1` (on a possibly infinite vertex set), and its proof begins with the finite case, which is 3.1 as stated; Moser and Tardos, p. 2, also recall the "at least `k` vertices" form. A reader of the description would take 3.1 to be a new generalisation.

Text that would be right: "Three statements are more general than the cited locators and say so: the weights …, the satisfiability criterion allows clauses with at least `k` variables, and the regular-hypergraph criterion allows every vertex in at most `k` edges; the hypergraph criterion with at least `k` vertices is Zhao's Theorem 6.2.6 (p. 84) for finite hypergraphs."

## N01 — The locator of 3.1 could name the theorem that states it

In 3.1 (README line 273) the citation is to Zhao, Theorem 6.2.1, "for `k`-uniform hypergraphs". Theorem 6.2.6, p. 84, has the hypotheses of 3.1 exactly (the finite case is the first step of its proof); adding it would give the target a locator at its own generality. The compactness extension of that theorem stays outside the scope, as the scope section says.

## N02 — `[DecidableEq ι]` is not used by the three Layer 1 signatures

In `Suggested.lean` the three theorems of Layer 1 carry `[DecidableEq ι]`, and the Conventions say the index type has decidable equality. The three statements elaborate unchanged without the instance (checked on a copy); only `dependencyNbhd` and 2.1 need it. The instance could be dropped from Layer 1 and from the convention, so that an implementer is not handed an unused argument.

## N03 — 4.2 is the only target without a locator

The occurrence criterion of 4.2 is derived here from 4.1 and the text says so, which is sound. If the author knows a published statement of the bound `t ≤ 2^k/(e k)` for formulas with `k` variables per clause, a locator would place the target in the literature; none is needed for correctness.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 lopsided lemma | independent events, `Γ = ∅`, `x = P(A)`; `x = 2`; `x = −1` with sure event; event and complement; loop at `i` | equality `∏(1 − P)`; `1 ≤ 1/4` false with hypothesis true; `0 ≤ −1/2` fails; `1/2 ≤ 1/4` fails; loop multiplies right side by `1 − x i ∈ [0, 1]` or makes it more negative | true; `x ≤ 1` needed | none |
| 1.1 exhaustive Check | 15 mass vectors × 64 event pairs × 16 digraphs × 36 weight pairs, exact rationals | `552960` instances, `62145` satisfy the hypothesis, `0` violate the conclusion | Check reproduced | none |
| 1.1 route, negative weight | `x i < 0`, all `x j ≤ 1` | right side `x i ∏(1 − x j) ≤ 0`, so `μ(A i) ≥ 0` forces a factor `1 − x j = 0`; product on the left is `0` | sound | none |
| 1.2 dependency digraph | `Γ i = univ`; adding arcs; three pairwise independent events | second σ-algebra `{∅, Ω}`: `μ(s ∩ Ω) = μ(s) · 1`; smaller generating set; `1/4` against `1/8` | definition excludes pairwise model | none |
| 1.2 general lemma | `ι` empty; pairwise example with `x = 1/2` | `1 ≤ μ(Ω) = 1`; would give `1/8 ≤ 0`, excluded since empty digraph is not a dependency digraph | true | none |
| 1.3 symmetric, lopsided | `d = 0`; `d ≥ 1`; `p < 0`; complement pair `p = 1/2`, `d = 1` | `x = max p 0 ≤ 1/e`, bound `(1 − x)^n > 0`; `(d/(d+1))^d ≥ 1/e`; `p < 0` forces `ι` empty, `μ(Ω) = 1 > 0`; `e > 1` | true | none |
| 1.3 exhaustive Check | 15360 choices, least admissible `p` | `1488` satisfy `e p (d + 1) ≤ 1`; `0` with no good point | Check reproduced | none |
| 2.1 variable model | `X₁ = X₂`; `{X₁ = 1}`, `{X₁ ≠ X₂}`; `vbl i = ∅`; `V` infinite | `1/2 ≠ 1/4`; `1/4 = 1/2 · 1/2`; event is `∅` or `Ω`; index sets `vbl i` and union of the others disjoint | true; independence needed | none |
| 3.1 hypergraph criterion | `k = 3, 4, 5`; `k ≤ 2`; Fano plane; `V` empty | `d ≤ 0, 1, 4` (`2^k/(2e) − 1 = 0.47, 1.94, 4.89`); `2e ≈ 5.44 > 4`; `14e ≈ 38.06 > 8`; `H = ∅` | true | none |
| 3.2 regular hypergraphs | `k = 9`, `k = 8`; ratio step; Fano neighbour count | `396.87 ≤ 512`; `309.88 > 256`; `91/73 ≈ 1.247 < 2`; `3 · 2 = 6` | true | none |
| 4.1 clause overlaps | `k = 3, 4, 5`; `k = 0, 1`; `F = {∅}`; all `2^k` sign patterns; tautological clause | `d ≤ 1, 4, 10`; `e(d+1) ≥ e > 2`; `e ≤ 1` false; `e · 2^k > 2^k`; falsified with probability `0` | true | none |
| 4.2 occurrences | `k = 1..7`; `k = 0` with `F = {∅}`; `t = 0` | `⌊2^k/(e k)⌋ = 0, 0, 0, 1, 2, 3, 6`; `0 ≤ 1` and unsatisfiable, so `k ≥ 1` needed; `k(t − 1) + 1 ≤ k t` | true | none |
| 5.1 Spencer's criterion | `k ≤ 1`, `k = 2`, `k = 3, 4`; `k = 10, 11, 20` against the counting criterion | `2e > 1`; `4e > 2`; `n = 0`, `n ≤ 2`; largest `n`: `96/100`, `156/152`, `7739/5817` | true; truncated `k − 2` never reached | none |
| 5.1 neighbour count | `n ≤ 12`, `2 ≤ k ≤ 6`, enumeration | count equals `∑ binom(k, i) binom(n − k, k − i)` and is `≤ binom(k, 2) binom(n, k − 2)` in all cases | Check reproduced | none |
| Copied definitions | six of PropositionalSatisfiability 1.1, two of RamseyNumbers 1.1, at the heads of their pull requests | bodies identical character for character; namespaces differ | no shared qualified name | none |
| Description sentence (C01) | Zhao Theorem 6.2.6 against 3.1 | same hypotheses: at least `k` vertices, at most `d` neighbours, `e 2^(1−k)(d+1) ≤ 1` | description inexact | C01 |

- Source locators checked against the text: 17 in Zhao's notes (all printed pages agree: 6, 79–83, 92–93, 100) and 4 in Moser–Tardos (Theorem 1.1, p. 1; dependency graph and the `2^k/e` remark, p. 2).
- Library declarations opened at the pin: 16, among them `ProbabilityTheory.indep_iSup_of_disjoint` (`Mathlib/Probability/Independence/Basic.lean:510`), `Indep_iff` (`:204`), `iIndepFun_iff_iIndep` (`:231`), `iIndepFun_pi` (`:895`), `MeasureTheory.measure_inter_add_sdiff` (`Mathlib/MeasureTheory/Measure/Basic.lean:83`), `Real.add_one_le_exp` (`Mathlib/Analysis/Complex/Exponential.lean:629`), `SimpleGraph.IsNClique` (`Mathlib/Combinatorics/SimpleGraph/Clique.lean:245`); no form of the local lemma in the pinned Mathlib or Tau Ceti.
- Cross-roadmap citations resolved: PropositionalSatisfiability 1.1 (definitions and scope sentence), RamseyNumbers 1.1, 1.2 (`ramseyProp_iff_ramseyNumber_le`, finite `K`), 5.1 and its scope sentence; all present at the heads of their pull requests.
- Dependency check: `depcheck: 172 roadmaps, 1998 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with nine `sorry` warnings and nothing else; the elaborated types were compared with the README statements, no binder lost.
- One-tactic probe (`simp`, `rfl`, `infer_instance`, `aesop`, `simp_all`): none of the nine theorems closes; no padding. All nine headline theorems of the README are stated.
- Overlap check: read RamseyNumbers, PropositionalSatisfiability, SatisfiabilityComplexity, GraphicalModelsAndConditionalIndependence, DimerModelsAndLozengeTilings, FiniteSamplingDiscrepancy; nothing shared (clauses and Ramsey numbers are owned by the first two and cited; both place the local lemma outside their scope).
- Source independence: 12 passages compared with 2 sources, none shared; largest share Zhao, 17 of 21 locators; contents compared with Zhao, Chapter 6 (6.1 to 6.6): independent (Layer 1 puts the lopsided form of 6.5 first, Layers 2, 4 and 5 are not sections of that chapter).
- Research link: Layer 1 is the lemma of Erdős and Lovász (1975) with the lopsided form of Erdős and Spencer (1991); Layer 2 is the variable setting in which Moser and Tardos (2010) prove their constructive version; Layer 5 is Spencer's bound (1977). Rests on the README and both sources read.

## Not verifiable

- The papers of Erdős–Lovász (1975), Spencer (1977), Shearer (1985) and Erdős–Spencer (1991): named for attribution only, with no locator; not opened, as the README itself says.
- Zhao's notes were read through text recognition of the file on the author's page; formulas in displays are partly garbled there, and the displayed hypotheses of Theorems 1.1.9, 6.1.9 and 6.5.1 were reconstructed from the surrounding proof text.

## Source issues

- **Gap** in Zhao at the derivation of the symmetric form from the general form, after Theorem 6.1.9, printed p. 81: the source says the weights `1/(d + 1)` are below `1`; it should be treated separately when `d = 0`, where the weight is `1` and the bound is `0`; affects the proof.

## For the human reviewers

- **Scope.** The source with 17 of 21 locators is a set of lecture notes on the author's page (Zhao, MIT 18.226, version of 18 June 2024), not a refereed text; the results are classical and the second source is published (J. ACM 2010).
- **Not tested.** The four original papers named for attribution (Erdős–Lovász 1975, Spencer 1977, Shearer 1985, Erdős–Spencer 1991) carry no locator and were not opened by the author or by this review.
- **Licence.** Zhao's notes were read from the author's own page; the file states no licence. Nothing is reused from it beyond statements and locators.
