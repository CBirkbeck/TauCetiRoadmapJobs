# Review of EllipticLegendreCharacterInterfaces (pull request #1545 at 2b50d7a)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 2b50d7a. The folder is unchanged; the gate now fails on three `statement-hygiene` hits, and one sentence of the description is contradicted by the head.

## R01 (P3) — `[Fintype F]` beside `[Field F]` in `legendre_minus_one_point_count_v_two`

**Location:** `TauCetiRoadmap/EllipticLegendreCharacterInterfaces/Suggested.lean` line 80: `{F : Type*} [Field F] [Fintype F] (hF : Fintype.card F % 8 = 5)`.

**Claim:** Gate rule `statement-hygiene`: a finite field is `[Finite F]`, with `Nat.card F` as its cardinality.

**Witness:** Gate line `line 80: P3 [Fintype F] beside [Field F]`. Pinned `WeierstrassCurve.pointCount` (TauCeti `AlgebraicGeometry/EllipticCurve/PointCount.lean:68,73`) has only `[Field F]`, so nothing in the statement needs `Fintype`.

**Repair:** `{F : Type*} [Field F] [Finite F] (hF : Nat.card F % 8 = 5) : padicValNat 2 (legendre (-1 : F)).pointCount = 3`. On 𝔽₅: `Nat.card = 5`, count 8, valuation 3.

## R02 (P3) — `[Fintype F]` beside `[Field F]` in `symmetric_cubic_trace_zero`

**Location:** `TauCetiRoadmap/EllipticLegendreCharacterInterfaces/Suggested.lean` line 90: `{F : Type*} [Field F] [Fintype F] (hF : Fintype.card F % 4 = 3) (a : F)`.

**Claim:** Same gate rule.

**Witness:** Gate line `line 90: P3 [Fintype F] beside [Field F]`. Pinned `frobeniusTrace` (TauCeti `PointCount.lean:101`) takes `[Finite F]`; `pointCount` takes no finiteness instance.

**Repair:** `{F : Type*} [Field F] [Finite F] (hF : Nat.card F % 4 = 3) (a : F) : (⟨0, 0, 0, a, 0⟩ : WeierstrassCurve F).pointCount = Nat.card F + 1 ∧ (⟨0, 0, 0, a, 0⟩ : WeierstrassCurve F).frobeniusTrace = 0`. On 𝔽₇, a=3: count 8 = 7+1.

## R03 (P3) — `[Fintype F]` beside `[Field F]` in `quadraticTwistOf_frobeniusTrace`

**Location:** `TauCetiRoadmap/EllipticLegendreCharacterInterfaces/Suggested.lean` line 98: `{F : Type*} [Field F] [Fintype F] [DecidableEq F] (h2 : (2 : F) ≠ 0)`.

**Claim:** Same gate rule. Here `[Finite F]` alone does not elaborate, because the conclusion uses `quadraticChar F d`, so the conclusion has to change with the binder.

**Witness:** Gate line `line 98: P3 [Fintype F] beside [Field F]`. Pinned Mathlib `NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:63,119`: `quadraticChar` is declared under `[Field F] [Fintype F] [DecidableEq F]`.

**Repair:** State the character's three values instead of the character:

```lean
theorem quadraticTwistOf_frobeniusTrace
    {F : Type*} [Field F] [Finite F] (h2 : (2 : F) ≠ 0)
    (W : WeierstrassCurve F) [W.IsCharNeTwoNF] (d : F) :
    (d = 0 → (W.quadraticTwistOf 0 (-d / 4)).frobeniusTrace = 0) ∧
    (d ≠ 0 → IsSquare d →
      (W.quadraticTwistOf 0 (-d / 4)).frobeniusTrace = W.frobeniusTrace) ∧
    (¬ IsSquare d →
      (W.quadraticTwistOf 0 (-d / 4)).frobeniusTrace = -W.frobeniusTrace) := by
  sorry
```

and in README §5.2 write the displayed identity as these three cases, noting that they are the values of quadraticChar(F)(d). On L(3)/𝔽₅ (trace 2): d=0,2,4 give 0, −2, 2. Not elaborated (see Not verifiable); run the gate after the edit.

## R04 (P3) — description: what ErdosProgressionPowers keeps

**Location:** Pull request description, summary block: "ErdosProgressionPowers draws on every layer and keeps only the progression-specific arguments and character nontriviality."

**Claim:** The head assigns ErdosProgressionPowers a third item, so "keeps only" is contradicted.

**Witness:** `TauCetiRoadmap/EllipticLegendreCharacterInterfaces/README.md` line 13: "ErdosProgressionPowers Layer 2 owns all progression-specific uses and character nontriviality, and its Layers 2–3 own the character-sum inequalities".

**Repair:** "ErdosProgressionPowers draws on every layer and keeps the progression-specific arguments, character nontriviality and, in its Layers 2–3, the character-sum inequalities."

## Previous findings

- none: the previous report (of `2b50d7a`) had no numbered findings.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| 3.7 `legendre_minus_one_point_count_v_two` (R01) | q=5,13,29,37; controls q=17,7 | Counts 8,8,40,40, all with v₂=3; q=17 (≡1 mod 8) gives 16, v₂=4; `Nat.card`=`Fintype.card` on each. | Agree; binder change only |
| 5.1 `symmetric_cubic_trace_zero` (R02) | all a over 𝔽₃, 𝔽₇, 𝔽₁₁; control 𝔽₅ | Counts all 4, 8, 12 = q+1, a=0 included; over 𝔽₅ counts (6,4,2,10,8) for a=0..4. | Agree; binder change only |
| 5.2 `quadraticTwistOf_frobeniusTrace` (R03) | all (a₂,a₄,a₆,d) over 𝔽₅ and 𝔽₇; L(3)/𝔽₅ | 625 + 2401 instances of the three-case form, 0 failures; L(3)/𝔽₅ twisted traces for d=0..4: (0,2,−2,−2,2). | Agree; restated by cases |

The rows for the untouched statements stand as in the previous review, of `2b50d7a`.

- Gate, run again on this head: every counter 0 except `statement-hygiene=3` (R01–R03); FAIL.
- Dependency check: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Outside-folder diff against the base: empty; worktree clean at `2b50d7a93d23152ea096f32ac7e0a7a09b1a9a5a`.
- Library declarations opened at the pins (Tau Ceti `a91d3aa`, Mathlib `6b7abb3`): 4 — `pointCount` (PointCount.lean:73), `frobeniusTrace` (PointCount.lean:101), `quadraticTwistOf` (QuadraticTwist/Basic.lean), `quadraticChar` (QuadraticChar/Basic.lean:119).
- Description against the head: the nine declaration names, the consumers (MordellLawrenceVenkatesh, ArithmeticDynamics, EllipticCurveModularityPartII, ComputationalNumberTheory), the Frey specialization, the corrected order-four point and the genuine-conductor sentence all match the README; only R04 differs. The title is right: the pull request adds the roadmap (755 insertions, 0 deletions, 47 headings, 9 declarations).
- Overlaps: none listed (no other pull request changes this roadmap, no dropped or revision-only ids, no result-level near-duplicate). Overlap check: changed passages only, none changed; ownership against ErdosProgressionPowers, ComputationalNumberTheory and EllipticCurves stands as read in the previous review; nothing shared.
- Remark: the merge order lists ErdosProgressionPowers (line 53) before this roadmap (line 103) although it is a consumer of it; that is a matter for the order of that roadmap, not a change here.
- Source independence: changed passages only — 0 passages changed, 0 compared; largest share BS20, 29 of 41 locators; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- Elaboration of `Suggested.lean` and of the repairs of R01–R03: the worktree's package directory for the pinned libraries was absent, so `lake env lean` stopped before elaborating. The repairs were checked by reading the pinned declarations; the signatures file of the worker's earlier run shows the present file elaborating.
- S09 and K84: settled as uncertified, as in the previous review.
- MordellLawrenceVenkatesh §6.4 (a consumer): no checkout supplied, as in the previous review.

## Source issues

- **Error** in BS20 at §6, proof of Lemma 6.6, printed p.371 (BS20 line 718): the source says the displayed y-coordinate gives the chosen order-four point; it should be y=8itv(t+iv) with the same x-coordinate; affects the proof.

## For the human reviewers

- none
