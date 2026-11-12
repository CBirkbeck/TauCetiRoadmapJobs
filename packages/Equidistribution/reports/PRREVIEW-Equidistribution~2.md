# Review of Equidistribution (pull request #2112 at 65ead17)

**Verdict:** needs changes

Previous review (at 1c6fa82), finding by finding:

| Previous | Status at 65ead17 | Evidence at this head |
|---|---|---|
| R01 best approximation at `q = 1` | repaired | README 414–417 "`∃ n, convDen ξ n = q`… with `n ≥ 0` and no separate case"; `hn` dropped (Suggested 121–124); negative control at 427–429 |
| R02 irrationality for the error bounds | repaired | README 380 "For irrational `ξ`, prove"; `hξ` in Suggested 109–117; Check 400–402. The new route identity is wrong (R02 below) |
| R03 Layer B restated ProbabilisticAndMetricNumberTheory | repaired | Scope 44–49, Layer 2 278–281; no Weyl/`UnifDistributed` targets |
| R04 Hurwitz already in Mathlib | repaired | §3.4 434–436 consumes `Real.infinite_rat_abs_sub_lt_one_div_sqrt_five_mul_den_sq_of_irrational` |
| R05 sorry'd `seqEmpiricalMeasure` | repaired | Conventions 88–90 use Tau Ceti's `empiricalMeasure`; Suggested 6 imports it |
| R06 sorry'd data | repaired | real bodies at Suggested 90–100, 171–187 |
| R07 imports and Lean form | repaired | `import Mathlib`; "target signatures" docstring; `## Layer k` comments; every declaration has a docstring |
| R08 ℕ-orbit density | repaired | README 225–227 cites `denseRange_zsmul_iff_nsmul` |
| R09 padding | repaired, new padding added | examples and API lemmas gone; `empiricalMeasure_const_add_nsmul` is new padding (R07 below) |
| R10 locators | partly repaired | AB98 locator corrected (583–592); §§4.3 and 4.5 have no locator, §§3.1–3.2 cite only a chapter (R08 below) |
| R11 shape and policy | partly repaired | shape, Layer E and pull-request numbers fixed; References 668 keeps "an unmerged Mathlib development" (R08 below) |
| R12 README names not declared | repaired | gate `readme-ids-missing=0`; namespaces `Rotation`, `ContFrac` |
| R13 ownership of the ergodic theorems | repaired | README 48 cites ProbabilisticAndMetricNumberTheory §4.1; link at 50 resolves to `Completed/Exchangeability` |

## R01 (P2) — Layer 1's torsion description and §3.1's integer convergent data restate pinned Tau Ceti theorems

**Location.** `TauCetiRoadmap/Equidistribution/README.md` 238–239: "prove what is specific to the circle: the orbit is the finite set of `q.den`-torsion points". And 347–351: "Prove that their casts are the continuant numerators and denominators…". Also the bullets at 359–362 and the From Tau Ceti contract at 168–177.

**Claim.** The torsion description of a rational orbit, the casts of `convNum` and `convDen` to the continuants, the Fibonacci lower bound and monotonicity are not in the libraries, so they are targets here.

**Witness.** Pinned Tau Ceti `NumberTheory/DiophantineApproximation/ContinuedFractions.lean`: `Real.den_convergent` (113), `Real.num_convergent` (121), `Real.fib_succ_le_den_convergent` (128), `Real.monotone_den_convergent` (135). `Algebra/AddCircle.lean`: `AddCircle.eq_torsionBy_of_natCard_eq` (231). `Real.den_convergent ξ n` alone proves the `convDen` cast identity.

**Repair.**
- Under `### From Tau Ceti`, add:
  - `Real.num_convergent`, `Real.den_convergent`, `Real.fib_succ_le_den_convergent`, `Real.monotone_den_convergent`, `Real.abs_sub_convergent_le`, `Real.one_div_lt_abs_sub_convergent` and `Irrational.not_of_terminatedAt` (TauCeti/NumberTheory/DiophantineApproximation/ContinuedFractions.lean);
  - `AddCircle.torsionBy_eq_zmultiples` and `AddCircle.eq_torsionBy_of_natCard_eq` (TauCeti/Algebra/AddCircle.lean).
- Replace README 347–351 with: "Tau Ceti's `Real.num_convergent` and `Real.den_convergent` identify their casts with `(cf ξ).nums n` and `(cf ξ).dens n`; they apply to `convNum` and `convDen` by unfolding."
- In the §3.1 list:
  - Replace the Fibonacci bullet by a citation of `Real.fib_succ_le_den_convergent`.
  - Replace "`GenContFract.of_den_mono` gives monotone" by `Real.monotone_den_convergent`.
  - Replace the `terminates_iff_rat` discharge by `Irrational.not_of_terminatedAt`.
- In §1.1, replace 238–239 with: "the orbit is the `q.den`-torsion `(AddCircle p)[q.den]`, by Tau Ceti's `AddCircle.eq_torsionBy_of_natCard_eq` applied to `zmultiples a`, whose `Nat.card` is `q.den`."
- In the DiophantineApproximationAndTranscendence contract (196–199), say that §0.5's two bounds are Tau Ceti's `Real.one_div_lt_abs_sub_convergent` and `Real.abs_sub_convergent_le`.
- At README 106–108, change "is Mathlib's" to "is Mathlib's or Tau Ceti's".

## R02 (P2) — The decrease identity in the §3.2 proof route is off by one complete quotient

**Location.** `TauCetiRoadmap/Equidistribution/README.md` 387–388: "`|convErr ξ (n + 1)| = |convErr ξ n| / ξₙ₊₁`", where line 387 fixes `ξₙ₊₁ = [aₙ₊₁; aₙ₊₂, …]`.

**Claim.** The ratio of consecutive convergent errors is the complete quotient `ξₙ₊₁`.

**Witness.** Take `ξ = √3 = [1; 1, 2, 1, 2, …]` and `n = 0`:
- `|convErr 1| = 2 − √3 = 0.2679`.
- `|convErr 0| / ξ₁ = 0.7321 / 1.3660 = 0.5359`.

The identity fails in 573 of 614 (ξ, n) cases. The first identity, at 387, holds in 614 of 614.

**Repair.** Replace the identity with "`|convErr ξ (n + 1)| = |convErr ξ n| / ξₙ₊₂`". Replace "the second the decrease" with "the second, with `ξₙ₊₂ > 1`, the decrease".

Tested: at √3, n = 0, `0.7321 / 2.7321 = 0.2679`. It held in all 614 cases.

## R03 (P2) — §3.1 says its API holds for every `ξ`, but strict monotonicity and the determinant identity fail for rational `ξ`

**Location.** `TauCetiRoadmap/Equidistribution/README.md` 368: "The statements hold for every `ξ`." This follows the bullets at 359 ("strict monotonicity of `qₙ` from index `1`") and 363 ("`pₙ qₙ₊₁ − pₙ₊₁ qₙ = (−1)ⁿ⁺¹`").

**Claim.** Strict monotonicity of `qₙ` and the determinant identity hold for every real `ξ`.

**Witness.** Take `ξ = 1/2`, the section's own Check (374–376): `q₁ = q₂ = 2`, so `q` is not strictly monotone. At `n = 1`, `p₁q₂ − p₂q₁ = 1·2 − 1·2 = 0`, not `(−1)² = 1`.

**Repair.** Replace 368 with: "The cast identities, positivity, monotonicity and coprimality hold for every `ξ`. Strict monotonicity from index `1`, the determinant identity at `n` and the Fibonacci bound need `¬ (cf ξ).TerminatedAt n`, which holds for every `n` when `ξ` is irrational."

Tested at √2, `n = 1`: `3·5 − 7·2 = 1 = (−1)²`.

## R04 (P2) — The partial-denominator convention is off by one and contradicts itself

**Location.** `TauCetiRoadmap/Equidistribution/README.md` 99–101: "The partial denominators `aₙ` are `(GenContFract.of ξ).partDens.get? n`…, with `a₀` written `(GenContFract.of ξ).h = ⌊ξ⌋`".

**Claim.** The partial denominator `aₙ` is Mathlib's `partDens.get? n`.

**Witness.** At the pin:
- `(GenContFract.of (333/106 : ℚ)).h = 3`, and `partDens.get? 0 = some 7`, so this `a₀` is 7 and not `⌊ξ⌋`.
- For π, `partDens.get? 2 = 1`. The §3.1 recurrence would then read `q₂ = 1·7 + 1 = 8`, but `dens 2 = 106`.

**Repair.** Replace with: "The partial denominators are `a₀ = ⌊ξ⌋ = (GenContFract.of ξ).h` and, for `n ≥ 0`, `aₙ₊₁ = (GenContFract.of ξ).partDens.get? n`: Mathlib's stream index `n` carries the `(n + 1)`-st quotient."

Add a Check: "π: `partDens.get? 0 = 7 = a₁`, and `q₂ = a₂q₁ + q₀ = 15·7 + 1 = 106`." Tested with `partDens.get? 1 = 15`.

## R05 (P2) — Scope and Downstream consumers hand results to roadmaps that do not state or consume them

**Location.** `TauCetiRoadmap/Equidistribution/README.md` 66–69: "Quantitative equidistribution of `{nα}`, including the discrepancy bound for badly approximable `α`… are the subjects of ProbabilisticAndMetricNumberTheory §§2.5 and 2.7 and DiophantineApproximationAndTranscendence §0.4, which consume Layer 3 of this roadmap." The same claim is at 636–644.

**Claim.** ProbabilisticAndMetricNumberTheory §2.7 owns the discrepancy of `{nα}` for badly approximable `α`. That roadmap and DiophantineApproximationAndTranscendence §§0.4–0.6 consume Layer 3.

**Witness.** ProbabilisticAndMetricNumberTheory §2.7 (its README 3229–3304) states only `starDiscrepancy`, `erdos_turan`, `koksma`. No roadmap cites this one (`roadmaps grep`). DiophantineApproximationAndTranscendence §0.5 is Tau Ceti's `Real.one_div_lt_abs_sub_convergent`, on `(ξ.convergent n).den`.

**Repair.**
- Replace 66–69 with: "Kronecker–Weyl equidistribution in several dimensions is ProbabilisticAndMetricNumberTheory §2.5 (`linear_equidistribution_tfae`), and inhomogeneous Kronecker approximation is DiophantineApproximationAndTranscendence §0.4."
- Replace 636–644 with: "No roadmap consumes this one. Layer 3 is stated on Mathlib's `Real.convergent`, the carrier of Tau Ceti's `Real.den_convergent`, so later roadmaps use it without conversion. Layer 4 is the finite-`N` structure of the point set whose limit is ProbabilisticAndMetricNumberTheory §2.5."
- If the badly-approximable discrepancy bound is wanted, state it as a target of this roadmap.

## R06 (P3) — §2.2 transfers from a `UnitAddCircle` statement that ProbabilisticAndMetricNumberTheory §2.5 does not make

**Location.** `TauCetiRoadmap/Equidistribution/README.md` 308–310: "by transferring ProbabilisticAndMetricNumberTheory §2.5 (its `UnitAddCircle` case, a point of infinite order being an irrational point)". The Check at 321 says the same.

**Claim.** §2.5 states the equidistribution of `n • a` on `UnitAddCircle`.

**Witness.** §2.5 states `linear_equidistribution_tfae (α β : UnitAddTorus d)` (its `Suggested.lean` 229) and `uniformDistribution_mod_one_tfae` for real sequences. Neither is the `n • a` statement on `UnitAddCircle`. The bridge `TorusIrrational (fun _ : Unit => a) ↔ addOrderOf a = 0` is §2.3 (its README 2676).

**Repair.** Replace with: "by transferring ProbabilisticAndMetricNumberTheory §2.5 `linear_equidistribution_tfae` at `d = Unit`, `β = 0`, whose hypothesis is equivalent to `addOrderOf a = 0` by §2.3. The transfer runs along the homeomorphism `AddCircle T ≃ₜ (Unit → UnitAddCircle)` that rescales by `T`; it is additive and carries `haarAddCircle` to `torusHaar Unit`."

Add §2.3 to the *Needs:* line. In the Check at 321, change "the `UnitAddCircle` case of §2.5" to "§2.5 at `d = Unit`".

## R07 (P3) — `empiricalMeasure_const_add_nsmul` is padding

**Location.** `TauCetiRoadmap/Equidistribution/Suggested.lean` 66–72, and the module docstring at 21–22 ("the bridge between Tau Ceti's empirical measure…").

**Claim.** The identification of the two empirical measures is a headline theorem.

**Witness.** In a scratch copy, the single tactic `simp [MeasureTheory.empiricalMeasure, birkhoffAverage, birkhoffSum, Finset.smul_sum, add_comm, ENNReal.smul_def]` closes it.

**Repair.**
- Delete it from `Suggested.lean` and from the docstring's Layer 2 list.
- In README 287–288, state it in prose without the backticked Lean name.
- At 300, delete the Check "replacing `a` by `a + T`… changes neither side": `a + (T : AddCircle T)` is `a`, so it tests nothing.

## R08 (P3) — Missing and chapter-level locators, and an unlocatable reference

**Location.**
- §4.3 (README 549–553) and §4.5 (608–616) carry no locator.
- §3.1 (366) and §3.2 (394) cite only "Hardy–Wright Ch. X".
- References 668–669: "an unmerged Mathlib development for irrational `α` through Liang's proof, cited as a source".

**Claim.** Every target carries a locator, and every reference can be found.

**Witness.** AB98 lines 480–483 give the counts `n + 1 − qₖ`, `r + 1`, `qₖ − (r + 1)`: §4.3's `N − r⁺`, `N − r⁻`, `r⁺ + r⁻ − N` under §4.4's returns (11,314 cases). "Unmerged" is a passing state with nothing to locate.

**Repair.**
- §4.3: "(Alessandri–Berthé, §3, Three distance theorem, p. 12 of the authors' copy, the three counts, with the returns of §4.4)".
- §4.5: "(corollary of §§3.5 and 4.4)".
- §§3.1–3.2: give Hardy–Wright theorem numbers.
- Delete the clause about the unmerged Mathlib development from the References.

## R09 (P3) — Layer 4 Checks and Examples

**Location.** `TauCetiRoadmap/Equidistribution/README.md` 516–521: no Check mentions `etaPos` or `etaNeg`. Line 627: "`α = φ`: at `N = Fₖ` there are two gap lengths, at other `N` three".

**Claim.** The return lengths have discriminating Checks, and the golden example holds for every `N`.

**Witness.**
- The wrong model `sInf (orbitFract α N)`, without `erase 0`, gives `0` and passes every Check in §4.1.
- For φ, the numbers of distinct lengths at `N = 1, …, 13` are `1, 2, 2, 3, 2, 3, 3, 2, 3, 3, 3, 3, 2`. At `N = 1 = F₁` there is one length.

**Repair.**
- Add a Check: "`α = √2`, `N = 3`: `η⁺ = √2 − 1` and `η⁻ = 3 − 2√2`; without `erase 0` the infimum would be `0`."
- Change 627 to: "at `N = Fₖ ≥ 2` two gap lengths, at `N = 1` one, at every other `N` three".

## R10 (P3) — The pull request description describes the first head

**Location.** The pull request description:
- "B. Weyl's criterion and `nα`. `UnifDistributed` through `haarAddCircle`…"
- "Hurwitz's `1/(√5 q²)` theorem (named and shaped as the open Mathlib PR #43281…)"
- "Layer E … do not follow."
- "…appear as `example`s in `Suggested.lean`."
- "I have not re-elaborated at that commit."

**Claim.** The description matches the head.

**Witness.** The head has Layers 1–4 and no Layer E. Weyl's criterion is cited from ProbabilisticAndMetricNumberTheory, a supplier the description never names. Hurwitz comes from the Mathlib pin. `Suggested.lean` has no `example`.

**Repair.** Replace the "What it specifies", "Boundaries" and "What was checked" sections with:

"Four layers:
1. The ℕ-orbit dichotomy and the rational orbit count.
2. The equidistribution of `n • a` on `AddCircle T`, transferred from ProbabilisticAndMetricNumberTheory §2.5.
3. Integer convergent data, alternation and decay, Lagrange's best-approximation theorem, Hurwitz in convergent form, its sharpness at φ, and φ's continued fraction.
4. The three-gap theorem uniformly in α, multiplicities, gap lengths from convergents, and the φ² bound.

Suppliers: Mathlib and Tau Ceti at the pins, ProbabilisticAndMetricNumberTheory §§2.1–2.5, and DiophantineApproximationAndTranscendence §§0.4–0.6. `Suggested.lean` elaborates at Mathlib `1b1ccf4b` with `sorry` warnings only."

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.1 `denseRange_nsmul_xor_finite_range` | p = 1; a = 0, 1/3, √2 | {0} finite, not dense; 3 points; √2 dense, nsmul injective so infinite | true |
| §1.1 `ncard_range_nsmul_coe_rat` | q = 0, −1/2, 2/5 | ncard 1, 2, 5 = den; needs 5 rewrites + `field_simp`, not one tactic | true; torsion form at Tau Ceti pin (R01) |
| §2.1 `empiricalMeasure_const_add_nsmul` | N = 0; a = 0 | both Dirac at x₀; one `simp` closes it | true; padding (R07) |
| §2.2 `tendsto_empiricalMeasure_nsmul` | a = 0; orbit of 1/2; T = 1, a = √2 | addOrderOf 0 = 1, Dirac ≠ Haar; k = 2 Weyl average 1; √2 order 0 | true; route R06 |
| §3.1 cast identities | √2, n = 2 | 7/5, dens 5; `Real.den_convergent ξ n` closes it | true; duplicate (R01) |
| §3.1 strict monotonicity, determinant | ξ = 1/2; √2, n = 1 | q = 1, 2, 2; p₁q₂ − p₂q₁ = 0; 3·5 − 7·2 = 1 | false for rational (R03) |
| Conventions `aₙ` | π via 333/106, 103993/33102 | h = 3, get? 0 = 7, get? 2 = 1, dens 2 = 106 vs 8 | off by one (R04) |
| §3.2 `convErr_pos_iff` | 614 (ξ, n) | √2: e₀ = 0.414 > 0, e₁ = −0.172; 0 failures | true |
| §3.2 `abs_convErr_succ_lt`, `abs_convErr_lt_inv_convDen_succ` | 614 each; ξ = 1/2 | 0 failures; at 1/2, n = 0: 1/2 < 1/2 false | true with `hξ` |
| §3.2 route identities | √3, n = 0; 614 cases | e₀ = 1/(ξ₁q₀) = 0.732 ✓; e₁ = 0.268 vs e₀/ξ₁ = 0.536; fixed form 614/614 | second false (R02) |
| §3.3 `abs_convErr_le_norm_of_lt_convDen_succ` | 613,826 (ξ, n, q) | inequality everywhere; strict for q ≠ qₙ | true |
| §3.3 `isBestApprox_iff` | 36 numbers, q < 2500 | best list = convergent denominators; √2: 1, 2, 5, 12 | true |
| §3.4 `exists_convDen_mul_abs_convErr_lt_inv_sqrt_five` | 542 windows incl. n = 0 | φ: 0.618, 0.382, 0.472 against 0.4472 | true |
| §3.4 `finite_setOf_abs_goldenRatio_sub_lt_of_sqrt_five_lt` | c = √5 | odd k: 0.382, 0.438, 0.4458 < 0.4472, infinitely many | strict `√5 < c` needed, present |
| §3.5 `goldenRatio_partDens`, `convDen_goldenRatio`, `convErr_goldenRatio` | n = 0, 1, 4 | h = 1; q = 1, 1, 2, …, 5; e = 0.618 = −ψ, −0.382 = −ψ² | true |
| §4.1 `gaps`, `etaPos`, `etaNeg` | N = 0, 1; √2, N = 3 | `gaps φ 0 = 0` (Lean `simp`); {1}; η⁺ 0.414, η⁻ 0.172 | consistent |
| §4.2 `gaps_toFinset_subset` | 11,396 irrational, 194,220 rational (α, N) | 2/5, N = 4: {1/5, 2/5} ⊆ {1/5, 1/5, 2/5}; 0 failures | true |
| §4.2 `card_toFinset_gaps_le_three` | 11,468 + 209,220 | at most 3 everywhere; rational card = min N den | true |
| §4.3 multiplicities | 11,396 | √2 N = 3: 2, 1, 0; φ N = 4: 2, 1, 1 | true |
| §4.4 `gaps_toFinset_subset_of_convDen_lt` | 11,314; φ N = 4 (k = 2) | m = 0, {0.146, 0.236, 0.382}; e₀ − m·e₁ > 0 always | true |
| §4.4 returns, two-length case, k = 0 | 11,314 / 147 / 82 | {r⁺, r⁻} = {qₖ, qₖ₋₁ + m qₖ}; AB98 counts agree | true |
| §4.5 `gaps_goldenRatio_le_sq_mul` | N < 600 | max/min = φ² whenever three lengths, else φ; N = 1: 1 ≤ φ² | true |
| Layer 4 Example at Fₖ | N = 1..13 | 1, 2, 2, 3, 2, 3, 3, 2, 3, 3, 3, 3, 2 | false at N = 1 (R09) |
| Scope: §2.7 owns the {nα} bound | ProbabilisticAndMetricNumberTheory §2.7 | targets `starDiscrepancy`, `erdos_turan`, `koksma` only | false (R05) |

- **Gate.** The worker's gate passes. My rerun printed only `depcheck: NOT IN ORDER: Equidistribution (insert it after its last supplier)`, which is the not-yet-placed case and not a finding.
- **Dependency check** against the candidate order: `depcheck: 206 roadmaps, 1899 edges, 0 problem(s)`. Suppliers are ProbabilisticAndMetricNumberTheory (merge order 62), then this roadmap (63). Nothing outside the folder changes.
- **Elaboration.** `lake env lean` on a scratch copy with 60 `#check`s gives only `sorry` warnings. All 25 elaborated signatures were compared with the README, and no binder was lost.
- **Sources.** AB98 §3 (lines 457–498, pp. 11–12 of the authors' copy) was checked against §§4.2–4.4, including the reindexing `N = n + 1` and the merge of the index-(k−1) range.
- **Mathlib at `1b1ccf4b`.**
  - Read in the source: `NumberTheory/DiophantineApproximation/Hurwitz.lean` (no convergent form, no sharpness at φ), `Dynamics/Ergodic/EmpiricalMeasure.lean` 57–64 and `Algebra/ContinuedFractions/Computation/Approximations.lean` 332.
  - Resolved with `#check`: the 55 Mathlib names the README cites. `TauCeti.Probability.birkhoffAverage_tendsto_metProjection` is at `MeanErgodic.lean` 91.
- **Tau Ceti at `2fd255d`.** Opened `ContinuedFractions.lean` 62–167, `Algebra/AddCircle.lean` 187 and 231, and `Process/EmpiricalMeasure.lean` 354–406.
- **Cross-roadmap citations resolved.**
  - ProbabilisticAndMetricNumberTheory §§2.1, 2.3, 2.4, 2.5, 2.7, 4.1, 4.5.
  - DiophantineApproximationAndTranscendence §§0.4–0.6 (main 345, 367, 440); DiophantineApproximationAndTranscendencePartII §§3.1–3.4.
  - GeometryOfNumbersAndQuadraticArithmetic §4.2, ArithmeticDynamics, EffectiveDiophantineMethods, `Completed/Exchangeability`.
- **Overlap check.** I read ProbabilisticAndMetricNumberTheory, ClassicalErgodicTheory, SpecialFunctionsEiLiErfIncompleteGamma and Exchangeability. Shared objects and their owners:
  - Equidistribution of `n • a`: ProbabilisticAndMetricNumberTheory §2.5 owns it on `UnitAddTorus d`; this roadmap owns the `AddCircle T` transfer.
  - Unique ergodicity of rotations: ClassicalErgodicTheory §5.1 owns the general statement. It is not yet in the merge order and its suppliers place it after this roadmap.
  - Empirical measures and convergent denominators: owned by Tau Ceti at the pin (R01).
  - A grep of every open head and main finds no other owner of three gaps, Lagrange best approximation, sharpness at φ, or φ's continued fraction.

## Not verifiable

- Hardy–Wright, 6th ed., Ch. X, Theorems 181 and 193–195 (§§3.1–3.5): the sources service found no legal copy.
- Khinchin, *Continued Fractions*, §§6, 9, 16, 19 (§§3.3–3.4): no legal copy found. Check whether these are section numbers or theorem numbers.
- Kuipers–Niederreiter, Ch. 1 §2 (§2.2): no legal copy found.
- Einsiedler–Ward §1.1 (§1.1): the DOI 10.1007/978-0-85729-021-2 resolves only to a paywalled page; uncertified.
- Liang 1979 (§4.2): the DOI 10.1016/0012-365X(79)90140-7 is paywalled; uncertified. It is cited only as a proof pattern.
- Weyl 1916, Sós 1958 and Slater 1967 appear in the References only, with no claim-level locator. Weyl: no legal copy found.

## Source issues

- **Error** in AB98 at §3, Three distance theorem, p. 12 of the authors' copy: the source says ηₖ is the largest of the three lengths; it should say ηₖ₋₁ − (m − 1)ηₖ, the sum of the other two, is largest (as its remark on the same page says; α = φ − 1, n = 3 gives η₂ = 0.236 while η₁ = 0.382 occurs); affects nothing.
