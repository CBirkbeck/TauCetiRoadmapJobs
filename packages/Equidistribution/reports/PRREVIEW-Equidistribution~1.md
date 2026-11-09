# Review of Equidistribution (pull request #2112 at 1c6fa82)

**Verdict:** needs changes

13 findings: 1 P1, 5 P2, 7 P3. The push gate fails at this head (rerun by this review, same result as the worker's): `imports`, `mathlib-subimports`, `no-import-mathlib`, `sorry-data` (4), `sorry-examples` (8), `prnum` (1), `readme-ids-missing` (37). Every gate failure is covered by a finding below.

## R01 (P1) — The best-approximation characterization is false at `q = 1`

**Location.** `TauCetiRoadmap/Equidistribution/README.md` lines 380–383: "`q ≥ 1` satisfies `∀ q', 0 < q' → q' < q → ‖(q * ξ)‖ < ‖(q' * ξ)‖` iff `q = convDen ξ n` for some `n ≥ 1`". The same misplaced caveat narrows `Suggested.lean` lines 166–167 (`hn : 1 ≤ n`).

**Claim.** The README says best approximations of the second kind are exactly the convergent denominators with index `n ≥ 1`.

**Witness.** ξ = √2: q = 1 qualifies vacuously, but convDen √2 n for n ≥ 1 is 2, 5, 12, …. Fails for 28 of 42 test numbers, exactly those with a₁ ≥ 2.

**Repair.**
- State the characterization for irrational ξ as "iff `q = convDen ξ n` for some `n`", with `n ≥ 0`.
- Delete `convDen_one_isBestApprox_iff` and the "usual caveat at n = 0" sentence. When a₁ = 1 we have q₀ = q₁ = 1, so `n = 0` needs no separate case.
- Tested on the refuting instance: q = 1 = convDen √2 0. The corrected form held for all 42 numbers and every q < 400.
- Drop `hn : 1 ≤ n` from `abs_convErr_le_norm_of_lt_convDen_succ`, in the README and at `Suggested.lean` line 167. The inequality also holds at n = 0:
  - Here |convErr ξ 0| = fract ξ = f.
  - For 0 < q < a₁ we have q·f ≥ f, and 1 − q·f ≥ f because (q+1)·f ≤ a₁·f ≤ 1.
  - Checked in 82 cases (n = 0) and 113,401 cases (n ≥ 1).
- Add the corrected characterization to `Suggested.lean`. It is the headline "convergent denominators are exactly the best approximations", and it is statable at the pin.
- Add a negative-control Check: q = 1 is a best approximation for every ξ.

## R02 (P2) — Upper bound and monotone decrease of the convergent error lack the irrationality hypothesis

**Location.** `TauCetiRoadmap/Equidistribution/README.md` lines 369–373: "`abs_convErr_succ_lt : |convErr ξ (n + 1)| < |convErr ξ n|`, and the upper bound `abs_convErr_lt_inv_convDen_succ : |convErr ξ n| < 1 / convDen ξ (n + 1)` (this is `abs_sub_convs_le` multiplied out)".

**Claim.** "For irrational ξ" grammatically attaches only to `convErr_pos_iff`. Layer C fixes an arbitrary `ξ : ℝ`, so both inequalities are claimed for every ξ.

**Witness.** ξ = 1/2, n = 0: convErr = 1/2 and convDen(1/2, 1) = 2, so 1/2 < 1/2 fails (proved in Lean with the R06 bodies). At n = 1, `abs_convErr_succ_lt` reads `0 < 0`.

**Repair.**
- State both inequalities for irrational ξ.
- `GenContFract.abs_sub_convs_le` gives only `≤`, so "multiplied out" does not yield `<`. Replace it with the route through the complete quotient: |qₙξ − pₙ| = 1/(ξₙ₊₁qₙ + qₙ₋₁), and ξₙ₊₁ > aₙ₊₁ for irrational ξ.
- Add ξ = 1/2, n = 0 as a negative-control Check.
- With the hypothesis, the strict bound and the decrease held in all 588 irrational test cases.

## R03 (P2) — Layer B restates ProbabilisticAndMetricNumberTheory §§2.1, 2.4, 2.5

**Location.** `TauCetiRoadmap/Equidistribution/README.md` lines 35–39 ("This roadmap owns … the definition of a uniformly distributed sequence … with Weyl's criterion, the arc-counting characterization …") and all of Layer B (lines 269–342). `Suggested.lean` lines 63–126.

**Claim.** This roadmap claims to own uniform distribution on the circle, Weyl's criterion, arc counting and the equidistribution of `nα`.

**Witness.** ProbabilisticAndMetricNumberTheory (merge-order line 62; this roadmap, line 401) owns, on `UnitAddTorus d`:
- §2.1 `AsympEquidistributed`.
- §2.4 `weyl_criterion`.
- §2.5 `linear_equidistribution_tfae`, `uniformDistribution_mod_one_tfae` (`Int.fract ∈ [a,b)` frequencies).

**Repair.**
- Add ProbabilisticAndMetricNumberTheory §§2.1, 2.4, 2.5 as a supplier in Scope and the supplier contracts.
- Delete the Layer B targets that restate them: `UnifDistributed`, the weak-convergence iff, the Weyl criterion, `UnifDistributed.denseRange`, `unifDistributed_nsmul`, `tendsto_card_filter_fract_mem_Ico_div`, the shift lemma, and the arc-counting converse. Delete the corresponding declarations from `Suggested.lean`.
- If general period `T` is wanted, keep one target transferring §2.5 from `UnitAddCircle` to `AddCircle T`, with its hypotheses.
- Note the averaging convention there is `(n+1)⁻¹ ∑_{i≤n}`, not `N⁻¹ ∑_{n<N}`.
- After the repair the dependency check stays clean: the supplier is earlier in the merge order.

## R04 (P2) — Hurwitz's theorem is in Mathlib at the pin

**Location.** `TauCetiRoadmap/Equidistribution/Suggested.lean` lines 171–177 (`infinite_rat_abs_sub_lt_one_div_sqrt_five_mul_den_sq_of_irrational`). README lines 205–207 and 389–395 ("the infinitude statement is the open Mathlib pull request …").

**Claim.** Hurwitz's infinitude statement is absent from Mathlib and is a target here.

**Witness.** `Real.infinite_rat_abs_sub_lt_one_div_sqrt_five_mul_den_sq_of_irrational` is at `Mathlib/NumberTheory/DiophantineApproximation/Hurwitz.lean:351`, pin 1b1ccf4b, with the identical statement. In a scratch copy the target closes with the single term `Real.infinite_rat_abs_sub_lt_one_div_sqrt_five_mul_den_sq_of_irrational hξ`.

**Repair.**
- Delete the declaration from `Suggested.lean`; its docstring also carries a pull-request number.
- Cite the Mathlib theorem in the supplier contracts and the Hurwitz bullet.
- Keep the convergent form (`exists_convDen_mul_abs_convErr_lt_inv_sqrt_five`) as the target.
- The sharpness at φ (`finite_setOf_abs_goldenRatio_sub_lt_of_sqrt_five_lt`) is not at the pin and stays.

## R05 (P2) — `seqEmpiricalMeasure` is sorry'd data and duplicates Tau Ceti's `empiricalMeasure`

**Location.** `TauCetiRoadmap/Equidistribution/Suggested.lean` lines 76–80 (`noncomputable def seqEmpiricalMeasure … := sorry`). README lines 201–202 ("the empirical measure of a sequence … consumed in Layer B") and 287–298.

**Claim.** The README says the sequence empirical measure is absent from the libraries, and the file defines it by `sorry`.

**Witness.** The pinned Tau Ceti already has it:
- `TauCeti.Probability.empiricalMeasure (x : ℕ → α) (n : ℕ) : ProbabilityMeasure α` at `TauCeti/Probability/Process/EmpiricalMeasure.lean:354`, averaging the first n+1 terms.
- `integral_empiricalMeasure` at line 406.
- `empiricalMeasure_apply_toReal` at line 381.

**Repair.**
- Delete `seqEmpiricalMeasure` and cite Tau Ceti's declaration, with `import TauCeti.Probability.Process.EmpiricalMeasure` if anything stays.
- After R03 the two theorems using it leave the file as well.
- If the orbit bridge is kept, state it as `(TauCeti.Probability.empiricalMeasure (fun n => x₀ + n • a) N : Measure _) = MeasureTheory.empiricalMeasure (a + ·) x₀ N`. This elaborates at the pin, and is true: both average N+1 Dirac masses, and `(a + ·)^[k] x₀ = x₀ + k • a`.

## R06 (P2) — `convNum`, `convDen` and `gaps` are sorry'd data

**Location.** `TauCetiRoadmap/Equidistribution/Suggested.lean` lines 134–135, 140–141 and 212–213 (`:= sorry`).

**Claim.** Twenty declarations, from `coe_convNum` to `gaps_goldenRatio_le_sq_mul`, are statements about unspecified objects.

**Witness.** The gate reports `sorry-data` on lines 78, 134, 140 and 212.

**Repair (elaborated at the pins in a scratch copy).**
- `convNum ξ n := (Real.convergent ξ n).num`.
- `convDen ξ n := (Real.convergent ξ n).den`.
- `gaps α N := let s := (orbitFract α N).sort (· ≤ ·); ((List.zipWith (· - ·) (s.tail ++ [1]) s : List ℝ) : Multiset ℝ)`.

With these bodies:
- `card_gaps` is proved by `simp` and `omega`.
- `convergent_eq_convNum_div_convDen` is `(Rat.num_div_den _).symm`.
- `coe_convNum` and `coe_convDen` become true theorems: `GenContFract` convergents are in lowest terms by the determinant formula, and `Real.convs_eq_convergent` holds.
- The README definitions should say the same.

## R07 (P3) — Imports and Lean form

**Location.** `TauCetiRoadmap/Equidistribution/Suggested.lean`:
- Lines 5–15: eleven `import Mathlib.<submodule>` lines and no `import Mathlib`.
- Lines 17–37: the module docstring says "seeds one or two targets per layer" and "The imports are the specific modules the statements need".
- Lines 143, 146, 224, 227: `coe_convNum`, `coe_convDen`, `gaps_sum`, `card_gaps` have no docstring.
- Section comments are `/-! ### Layer A … -/`.
- Line 173 cites a pull-request number.

**Claim.** The file does not follow the required Lean form.

**Witness.** Gate rules `imports`, `mathlib-subimports` and `no-import-mathlib`.

**Repair.**
- Replace lines 5–15 by `import Mathlib`. Tested: a copy with `import Mathlib` elaborates at the pins with only `sorry` warnings.
- Rewrite the docstring in the "target signatures" form. It should list the headline theorems and state that each is statable at the pins.
- Give every declaration a docstring.
- Use `/-! ## Layer k: <title> -/` section comments.
- Drop the pull-request number.

## R08 (P3) — ℕ-orbit density is a corollary of a pinned Mathlib lemma

**Location.** `TauCetiRoadmap/Equidistribution/README.md` line 203 ("density of the `ℕ`-orbit `n • a` (only the `ℤ`-orbit is there)") and lines 233–240 (the compactness proof plan). `Suggested.lean` lines 46–50.

**Claim.** ℕ-orbit density is missing from Mathlib and needs a compactness argument.

**Witness.** `denseRange_zsmul_iff_nsmul` (`Mathlib/Topology/Algebra/Group/SubmonoidClosure.lean:100`, additive form) holds in every compact group; the target closes with `rw [← denseRange_zsmul_iff_nsmul, AddCircle.denseRange_zsmul_iff]`.

**Repair.**
- Delete `AddCircle.denseRange_nsmul_iff` from `Suggested.lean`.
- In the README, cite `denseRange_zsmul_iff_nsmul` in the supplier contracts, correct line 203, and replace the compactness plan by that one-line corollary.

## R09 (P3) — Padding in `Suggested.lean`

**Location.**
- `TauCetiRoadmap/Equidistribution/Suggested.lean` lines 264–296: eight `example … := by sorry`, flagged by the gate as `sorry-examples`.
- Lines 143–152, 158–162, 224–228, 240–244: `coe_convNum`, `coe_convDen`, `convergent_eq_convNum_div_convDen`, `fib_succ_le_convDen`, `gaps_sum`, `card_gaps`, `gaps_toFinset_eq_of_card_eq_three`.

**Claim.** These declarations are acceptance-test statements.

**Witness.** The examples mirror README Checks. With R06's bodies, `convergent_eq_convNum_div_convDen` is one term; `gaps_toFinset_eq_of_card_eq_three` is `Finset.eq_of_subset_of_card_le hs (h ▸ Finset.card_le_three)` (probed); `fib_succ_le_convDen` is `GenContFract.succ_nth_fib_le_of_nth_den`; the rest are definition API.

**Repair.** Delete them from `Suggested.lean`; the README keeps them as targets and Checks.

## R10 (P3) — No target carries a locator, and the one specific locator is wrong

**Location.**
- `TauCetiRoadmap/Equidistribution/README.md` lines 525–541. The References give only chapters; no claim in Layers A–D has a parenthetical locator.
- Line 537: "Theorem 1 is Layer D's gap-length statement".

**Claim.** The gap-length statement of Layer D is Alessandri–Berthé Theorem 1.

**Witness.** AB98 line 85: Theorem 1 concerns lim inf/lim sup of n·hₙ and n·Hₙ. The gap lengths are §3's unnumbered "Three distance theorem" (AB98 lines 467–483), for 0 < α < 1 and n + 1 points.

**Repair.**
- Cite "AB98, §3, Three distance theorem (unnumbered), pp. 11–12 of the authors' copy", and record that version. The source writes n = m·qₖ + qₖ₋₁ + r with 1 ≤ m ≤ cₖ₊₁ and 0 ≤ r < qₖ.
- State the reindexing. The README's N equals the source's n + 1. Its range qₖ < N ≤ qₖ₊₁ merges the source's index-(k−1) range, where m = 0, with its index-k range. The extension to all real α holds because the gaps and |qₖα − pₖ| are unchanged by integer translation.
- Add a locator (source, theorem, page) to every target. Candidates are Hardy–Wright and Khinchin theorem numbers, and Kuipers–Niederreiter Ch. 1 theorem numbers for anything kept after R03.
- The rewritten statement passed 14,534 cases numerically.

## R11 (P3) — README shape and policy

**Location.**
- `TauCetiRoadmap/Equidistribution/README.md` headings at lines 77, 118, 197, 225–227, 269, 344, 418, 501 and 515.
- Pull-request numbers at lines 69, 72, 74, 206, 214, 392 and 513.
- Porting process text at lines 212–221 ("coordinate with its author before copying any proof text").
- Line 501: "Layer E: roadmap-for-a-roadmap. DO NOT FOLLOW."

**Claim.** The README follows the roadmap shape and policy.

**Witness.** Missing: `## Exact supplier contracts`, `## How to read the build`, `## Layer k:` with `### k.n`, `*Needs:*` lines, `### Examples`/`### Dependencies`, `## Downstream consumers`. Layer E's discrepancy and Erdős–Turán are owned by ProbabilisticAndMetricNumberTheory §2.7 and DiophantineApproximationAndTranscendencePartII §§3.1–3.4.

**Repair.**
- Restructure into the standard shape, with the supplier contracts split into `From Mathlib`, `From Tau Ceti` and `From TauCetiRoadmap.<X>` subsections, and per-layer `### Examples` and `### Dependencies`.
- Cite GeometryOfNumbersAndQuadraticArithmetic §4.2, ArithmeticDynamics and EffectiveDiophantineMethods by name, not by pull-request number.
- Delete Layer E. Its pointers to the roadmaps that own discrepancy and Erdős–Turán go in Scope.
- Remove the porting process text and the external pull-request references. The second external formalization can stay as a source, without the instructions.

## R12 (P3) — 37 backticked names the README presents as this roadmap's own are not in `Suggested.lean`

**Location.** Throughout Layers A–D of `TauCetiRoadmap/Equidistribution/README.md`, gate rule `readme-ids-missing`.

**Claim.** Each backticked name of this roadmap is declared in `Suggested.lean`.

**Witness.** 25 are undeclared own targets (`Rotation.count_gaps_of_irrational`, `Real.convDen_pos`, `isBestApprox_iff`, …). 12 are Mathlib names read as own because the file nests declarations in `AddCircle` and `Real` (`AddCircle.coe_fract`, `Real.coe_fib_eq`, …).

**Repair.**
- State the facts of own API bullets in prose, without Lean names.
- Move the file's declarations out of the Mathlib namespaces `AddCircle` and `Real`, so that Mathlib names in the README stay unambiguous.

## R13 (P3) — Scope prose: a false ownership claim and a broken supplier link

**Location.** `TauCetiRoadmap/Equidistribution/README.md` lines 64–67: "the pointwise Birkhoff ergodic theorem is not a target of any roadmap"; the link `../Exchangeability/README.md`.

**Claim.** No roadmap owns the pointwise ergodic theorem, and Exchangeability is a sibling folder.

**Witness.**
- ProbabilisticAndMetricNumberTheory §4.1 owns the pointwise ergodic theorem; see its Summary and §4.1 "Pointwise averages, truncated limsups and first hits".
- Exchangeability is at `Completed/Exchangeability`. Its Layer 5 is implemented in `TauCeti/Probability/Ergodic/Koopman.lean`.

**Repair.**
- Cite ProbabilisticAndMetricNumberTheory §4.1 for the pointwise theorem.
- Point to `../../Completed/Exchangeability/README.md`, or better, cite the Tau Ceti declarations directly (for example `TauCeti.Probability.birkhoffAverage_tendsto_metProjection`) in the supplier contracts.

## Verified sound

**Gate and dependency check.**
- The gate was rerun at this head and matches the worker's `gate.md`. The `build` line is not printed while other checks fail, so the elaboration below substitutes for it.
- Dependency check output: `depcheck: 236 roadmaps, 2264 edges, 0 problem(s)`. There is no UPWARD or CYCLE line. The R03 repair adds a supplier at merge-order line 62, below this roadmap's line 401.

**Elaboration and signatures.**
- A scratch copy of `Suggested.lean` with `import Mathlib` and `import TauCeti.Probability.Process.EmpiricalMeasure` elaborates with `lake env lean` at the pins, with only `sorry` warnings.
- All 35 elaborated signatures were compared with the README.
- The one flagged dropped binder, `[Fact (0 < T)]` on `seqEmpiricalMeasure`, is not needed by its type `ProbabilityMeasure (AddCircle T)`, and the definition goes under R05.
- The only generality mismatch is `hn` (R01).

**Adversarial table.** Values are computed; the numerical runs use exact integer arithmetic. Irrationals are represented by 70-digit or 70-quotient rationals, and only indices well below their denominators are used.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `AddCircle.denseRange_nsmul_iff` | a = 1/2; a = √2 | addOrderOf 2, orbit {0, 1/2}, not dense (probe proves ¬Dense); addOrderOf 0, dense | true; one `rw` (R08) |
| `denseRange_nsmul_xor_finite_range` | a = 0, 1/3, √2 | {0}: finite, not dense; 3 points: finite; √2: dense, infinite | true |
| `ncard_range_nsmul_coe_rat` | q = 0, −1/2, 2/5, 3 | den 1, 2, 5, 1; orbits {0}, {0, 1/2}, 5 points, {0} | true |
| `UnifDistributed` (definition) | constant x₀, f = `fourier 1` | averages = `fourier 1 x₀`, modulus 1; Haar integral 0 | rejects the constant (R03: owned elsewhere) |
| Weyl criterion | x n = n•(1/2) | k = 1 averages → 0; k = 2 averages = 1 | criterion fails, consistent |
| `tendsto_card_filter_fract_mem_Ico_div` | u = v; [0,1); u = −1 | limits 0 and 1; u = −1 would give v, not v − u | `0 ≤ u` is needed and present |
| bridge to `MeasureTheory.empiricalMeasure` | N terms | both average N+1 Dirac masses; `(a+·)^[k] x₀ = x₀ + k•a` | true with Tau Ceti's measure |
| `convNum`/`convDen` | √2, n = 2; φ, n = 4 | 7/5; convDen φ 4 = fib 5 = 5, convNum = 8 | consistent |
| `convErr` sign, parity | √2, n = 0, 1; 588 cases | √2 − 1 > 0; 2√2 − 3 < 0 | true |
| `fib_succ_le_convDen` | φ; ξ = 1/2, n = 3 | equality for φ; fib 4 = 3 > convDen = 2 | `Irrational` needed and present |
| `abs_convErr_le_norm_of_lt_convDen_succ` | √2, n = 1, q = 1..4; n = 0 (82 cases) | 0.1716 ≤ 0.414, 0.172, 0.243, 0.343; holds at n = 0 | true; `hn` unneeded (R01) |
| `abs_convErr_lt_inv_convDen_succ` (README) | ξ = 1/2, n = 0 | 1/2 < 1/2 is false | false without irrationality (R02) |
| `isBestApprox_iff` (README) | √2, q = 1; 42 numbers, q < 400 | best = {1, 2, 5, 12, …}, but {qₙ : n ≥ 1} = {2, 5, …} | false (R01) |
| Borel three-consecutive (README) | φ; 588 cases | qₖ\|errₖ\| = 0.618, 0.382, 0.472, 0.438, 0.451, 0.446 against 1/√5 = 0.4472 | true |
| Hurwitz infinitude | — | identical to Mathlib `Hurwitz.lean:351` | duplicate (R04) |
| `finite_setOf_abs_goldenRatio_sub_lt_of_sqrt_five_lt` | c = 3; c = √5 | 1/3 < 0.4472, so finite; at c = √5 odd-k values 0.4458 < 0.4472 recur, so infinite | strict `√5 < c` needed and present |
| `goldenRatio_partDens`, `convDen_goldenRatio`, `convErr_goldenRatio` | n = 0, 1 | a₁ = ⌊φ⌋ = 1; 1, 1, 2, 3, 5 = fib 1..5; φ − 1 = −ψ, φ − 2 = −ψ² | true |
| `gaps` (R06 body), `gaps_sum`, `card_gaps` | N = 0, 1; √2, N = 3 | ∅; {1}; {0.414, 0.414, 0.172}, sum 1; sum = 1 for all rational cases with N ≥ 1 | true; `0 < N` needed for the sum |
| `etaPos`/`etaNeg` | √2, N = 3; card 1 | η⁺ = 0.414 (index 1), η⁻ = 0.172 (index 2); `sInf ∅ = 0` excluded by `2 ≤ card` | true |
| `gaps_toFinset_subset` | 14,616 irrational and 56,550 rational (α, N); α = 2/5, N = 4 | {1/5, 1/5, 2/5, 1/5} ⊆ {1/5, 1/5, 2/5} | true |
| `card_toFinset_gaps_le_three` | 14,658 + 63,360 cases | at most 3 everywhere | true |
| `gaps_toFinset_subset_of_convDen_lt` | 14,534 cases; √2, N = 3 (k = 0); φ, N = 4 (k = 2) | m = 0, {0.172, 0.414, 0.586}; m = (4−1−2)/3 = 0 | true; e₀ − m·e₁ > 0 in every case |
| multiplicities, return times, N = qₖ₊₁ (README) | 14,616 / 14,534 / 191 cases; √2 N = 3: 2, 1, 0; φ N = 4: {3, 2} | all match | true |
| k = 0 case (README) | 82 cases | lengths among {f, 1 − (N−1)f, 1 − (N−2)f} | true |
| `gaps_goldenRatio_le_sq_mul` | N = 1, 4; N < 350 | 1 ≤ φ²; max/min = φ⁻²/φ⁻⁴ = φ² (equality) | true |
| README Checks (√2, φ, 1/3) | as stated | 5√2 − 7 = 0.0711 < 1/12; 5·\|5φ − 8\| = 0.451 < 1/2; ‖3√2‖ = 0.243 > ‖2√2‖ = 0.172; φ, N = 4 and 5 gap lists as stated | true |

**Library declarations opened at the pins.**
- Mathlib:
  - `Mathlib/NumberTheory/DiophantineApproximation/Hurwitz.lean:351`
  - `Mathlib/Topology/Algebra/Group/SubmonoidClosure.lean:100`
  - `Mathlib/Topology/Instances/AddCircle/DenseSubgroup.lean:58, 68`
  - `Mathlib/Topology/Instances/AddCircle/Defs.lean:576, 617, 667`
  - `Mathlib/Analysis/Normed/Group/AddCircle.lean:68, 223`
  - `Mathlib/Dynamics/Ergodic/EmpiricalMeasure.lean:58, 71`
  - `Mathlib/NumberTheory/DiophantineApproximation/Basic.lean:322`
  - `Mathlib/NumberTheory/DiophantineApproximation/ContinuedFractions.lean:39`
  - `Mathlib/Data/Finset/Sort.lean:34`
- Tau Ceti:
  - `TauCeti/Probability/Process/EmpiricalMeasure.lean:354, 381, 406`
  - `TauCeti/Analysis/Fourier/AddCircle.lean:199`, so `ContinuousMap.eq_zero_of_forall_fourierCoeff_eq_zero` is cited correctly.
- With `#check` (all exist): `IsOfFinAddOrder.multiples_eq_zmultiples`, `nsmul_eq_nsmul_iff_modEq`, `Nat.card_zmultiples`, `IsOfFinAddOrder.finite_multiples`, `AddSubmonoid.coe_multiples`, `GenContFract.abs_sub_convergents_le'`, `AddCircle.toCircle_nsmul`, `GenContFract.succ_nth_fib_le_of_nth_den`, `Real.fib_succ_sub_goldenRatio_mul_fib`, `GenContFract.abs_sub_convs_le`, `AddCircle.isOfFinAddOrder_iff_exists_rat_eq_div`, `AddCircle.exists_norm_nsmul_le`, `Real.goldenRatio_irrational`, `Real.coe_fib_eq`, `MeasureTheory.integral_empiricalMeasure_eq_birkhoffaverage`.

**Cross-roadmap citations resolved.**
- DiophantineApproximationAndTranscendence, on main:
  - §0.4 is Kronecker approximation.
  - §0.5 has the lower bound 1/(qₖ(qₖ+qₖ₊₁)) and the limsup formula.
  - §0.6 is `BadlyApproximable`.
  - Nothing from them is restated here.
- Exchangeability Layer 5: exists (see R13 for the path).
- GeometryOfNumbersAndQuadraticArithmetic §4.2, "Mixing, ergodicity and unipotent flows".
- ArithmeticDynamics owns dynamical equidistribution.
- EffectiveDiophantineMethods exists.

**Ownership against open pull requests.**
- Searched by object (Hurwitz/√5, three gap/Steinhaus, best approximation, convergent integer data, golden-ratio continued fraction, ℕ-orbit density, uniform distribution, rotation) across main and the open heads.
- ProbabilisticAndMetricNumberTheory: R03, R13.
- DiophantineApproximationAndTranscendencePartII Layer 3: R11.
- No other owner of Layers A, C or D. The three-gap theorem, the convergent integer data, Lagrange, the sharpness at φ and the φ continued fraction belong here.
- `overlaps.md` lists no dropped ids and no other pull request changing this roadmap.

**Sources: the 15-target sample.** None of the 15 sampled targets carries a locator at the claim:
1. `denseRange_nsmul_iff`
2. minimality
3. `ncard_range_nsmul_coe_rat`
4. `UnifDistributed`
5. the Weyl criterion
6. `unifDistributed_nsmul`
7. `tendsto_card_filter_fract_mem_Ico_div`
8. `coe_convDen`
9. `abs_convErr_lt_inv_convDen_succ`
10. `abs_convErr_le_norm_of_lt_convDen_succ`
11. `isBestApprox_iff`
12. Hurwitz
13. sharpness at φ
14. `gaps_toFinset_subset`
15. `gaps_toFinset_subset_of_convDen_lt`

Targets 12 and 15 have a reference: 12 resolves to the Mathlib pin, and 15's reference was checked against AB98 (R10). Each target's mathematics was checked directly, as in the table.

## Not verifiable

- Hardy–Wright, 6th ed., Theorems 181 and 193–195: the sources service found no legal copy.
- Khinchin, *Continued Fractions*, §§6, 9, 16, 19: no legal copy found.
- Kuipers–Niederreiter, Ch. 1 §§1–2: no legal copy found.
- Weyl 1916 (Math. Ann. 77): DOI resolves only to a paywalled page; uncertified.
- Liang 1979 (Discrete Math. 28): DOI resolves only to a paywalled page; uncertified.
- Sós 1958, Slater 1967 and Einsiedler–Ward: not fetched. The README cites them without locators, so there is nothing to check at a locator.
- Numbering of Alessandri–Berthé in the published Enseign. Math. 44 version: only the authors' copy (author page) was read.

## Source issues

- **Error** in AB98 at §3, Three distance theorem, p. 12 of the authors' copy (line 480): the source says the length ηₖ is the largest of the three lengths; it should say the largest is ηₖ₋₁ − (m−1)ηₖ, the sum of the other two, as its own remark at lines 493–494 states; affects nothing.
