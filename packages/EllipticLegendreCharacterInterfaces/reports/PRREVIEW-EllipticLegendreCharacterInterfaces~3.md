# Review of EllipticLegendreCharacterInterfaces (pull request #1545 at df72341)

**Verdict:** accepted

Incremental re-review of 25 changed lines since 2b50d7a. No finding: the four previous findings are repaired, the repairs introduce no new problem, the gate passes, and the title and description agree with this head.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/EllipticLegendreCharacterInterfaces/Suggested.lean` line 80: `{F : Type*} [Field F] [Finite F] (hF : Nat.card F % 8 = 5)`.
- R02 — repaired: `Suggested.lean` lines 90–91: `[Field F] [Finite F] (hF : Nat.card F % 4 = 3) (a : F)`, conclusion `pointCount = Nat.card F + 1 ∧ frobeniusTrace = 0`.
- R03 — repaired: `Suggested.lean` lines 99–106: `[Field F] [Finite F] (h2 : (2 : F) ≠ 0)`, three conjuncts (`d = 0`; `d ≠ 0 → IsSquare d`; `¬IsSquare d`); README §5.2 states the identity and names the three-value form.
- R04 — repaired: description: "keeps the progression-specific arguments, character nontriviality and, in its Layers 2–3, the character-sum inequalities", as README line 13 has it.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| 3.7 `legendre_minus_one_point_count_v_two` (binder change) | q=5,13,29,37,53; controls q=17, 9, 7 | Counts 8, 8, 40, 40, 40, each v₂=3. q=17 and q=9 (≡1 mod 8): 16, v₂=4, excluded by the hypothesis. q=7: 8. | Agree; none |
| 5.1 `symmetric_cubic_trace_zero` (binder change) | every a over 𝔽₃, 𝔽₇, 𝔽₁₁, 𝔽₁₉; controls 𝔽₅, 𝔽₉ | Counts all 4, 8, 12, 20 = q+1, a=0 included, so trace 0. 𝔽₅ gives {2,4,6,8,10}, 𝔽₉ gives {4,10,16}: q≡3 mod 4 is needed. | Agree; none |
| 5.2 `quadraticTwistOf_frobeniusTrace` (restated by cases; seeded sample) | every (a₂,a₄,a₆,d) over 𝔽₃, 𝔽₅, 𝔽₇, 𝔽₉, 𝔽₁₁ (24309 instances) | Twist coefficients (d·a₂, d²·a₄, d³·a₆) from `quadraticTwistOf 0 (−d/4)`; 0 failures; cases d=0 / square / nonsquare hit 2555 / 10877 / 10877 times. L(3)/𝔽₅: trace 2, twisted traces d=0..4: (0, 2, −2, −2, 2). | Agree; none |
| 5.2 three cases against the character form | d=0; d≠0 square; nonsquare | d=0 is a square, so `¬IsSquare d` gives d≠0: the three cases are disjoint and exhaustive and equal χ(d)=0, 1, −1 (`quadraticChar_one_iff_isSquare` needs `a ≠ 0`; `quadraticChar_neg_one_iff_not_isSquare` does not). | Equivalent to the README identity |
| 5.2 Checks | 𝔽₅: (d,λ)=(1,3),(2,3),(4,3),(1,0),(2,0); y²=x³; 𝔽₉: y²=x³+x+1, d=1+i | Counts 4, 8, 4, 5, 7 (traces 2, −2, 2, 1, −1); y²=x³: 6, trace 0; 𝔽₉: 1+i nonsquare, counts 16 and 4, traces −6 and 6. | All five Checks agree |

The rows for the untouched statements stand as in the previous review, of `2b50d7a`.

- Gate, run again on this head: every counter 0, `OK`; the worker's gate has `build=0`.
- Elaboration of `Suggested.lean`: seven `declaration uses sorry` warnings (lines 34, 45, 58, 70, 79, 89, 99), nothing else. The elaborated types of the three changed theorems carry `[Finite F]` and, for 5.2, `2 ≠ 0` and `[W.IsCharNeTwoNF]`, as README §3.7, §5.1 and §5.2 state.
- One-tactic probe on the three changed theorems (`simp`, `rfl`, `simp_all`, `omega`, `aesop`): none closes any of them; no padding.
- Dependency check: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Library declarations opened at the pins (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`): 7 — `WeierstrassCurve.pointCount` (PointCount.lean:73, `[Field F]` only), `frobeniusTrace` (PointCount.lean:101, `[Finite F]`), `quadraticTwistOf` (QuadraticTwist/Basic.lean:164), `IsCharNeTwoNF` (NormalForms.lean:107), `quadraticChar_one_iff_isSquare` (QuadraticChar/Basic.lean:134), `quadraticChar_neg_one_iff_not_isSquare` (:159), `quadraticChar_exists_neg_one` (:165). The twist trace identity is stated by neither pinned library nor by another roadmap (searched by object).
- Source locators checked: 1 — BS20 lines 703–705 (the twist by 2 of the Legendre curve and the sign change of the trace when 2 is a nonsquare), as §5.2 cites it. S09 §V.1 is uncertified.
- Description against the head: the nine declaration names, "for every odd q", the supplier and consumer sentences and the folder contents match; the title is right (the pull request adds the roadmap: 760 insertions, 47 headings, 9 declarations). Outside-folder diff against the base: empty.
- Overlap check: changed passages only; read ErdosProgressionPowers, ComputationalNumberTheory, EllipticCurves as in the previous review, and searched every open head and main for the twist trace identity; nothing shared.
- Source independence: changed passages only — 3 passages compared (the §5.2 statement, its `*Needs:*` line, the docstring of `quadraticTwistOf_frobeniusTrace`) with 1 source (BS20 lines 697–707), none shared; largest share BS20, 29 of 41 locators; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- S09 and K84: settled as uncertified, as in the previous review.
- MordellLawrenceVenkatesh §6.4 (a consumer): no checkout supplied, as in the previous review.

## Source issues

- **Error** in BS20 at §6, proof of Lemma 6.6, printed p.371 (BS20 line 718): the source says the displayed y-coordinate gives the chosen order-four point; it should be y=8itv(t+iv) with the same x-coordinate; affects the proof.

## For the human reviewers

- none
