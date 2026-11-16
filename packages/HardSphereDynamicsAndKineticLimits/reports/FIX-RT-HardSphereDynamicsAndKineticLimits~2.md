# FIX-RT-HardSphereDynamicsAndKineticLimits~2: red-team round 2 repaired

Six P3 findings from two reviews; the two F01s overlap and are settled once. All are right on the mathematics. Two suggested repairs were corrected before being applied (see the first section).

## RT-HardSphereDynamicsAndKineticLimits~2a/F01, RT-HardSphereDynamicsAndKineticLimits~2b/F01 (P3) — applied differently

The `LanfordStatement` docstring and README §10.4: "the theorem of BGSS2023 Theorem 1 and GST2013 Theorem 8" → "the statement of BGSS2023 Theorem 1 (grand canonical, torus)". GST2013 Theorems 4/8 are now "the counterpart on `ℝᵈ` for fixed `N` with `N ε^{d−1} = 1`", and Lanford1975 is "the fixed-`N` (canonical) statement".

Evidence:
- GST2013 line 668: datum on `ℝ^{2d}`.
- GST2013 line 672: fixed `N`, `N ε^{d−1} = 1`.
- GST2013 line 833: particles in `ℝᵈ`.
- BGSS2023 line 119: torus, `d ≥ 2`.
- BGSS2023 lines 313–315: Lanford's theorem is canonical; Theorem 1 is its grand canonical form.

Two changes to the suggested text, each for a reason:
- **Lanford1975 is not placed on `ℝᵈ`.** The text is uncertified. BGSS2023 lines 313–315 support only "canonical".
- **"Stated without proof" is narrowed.** BGSS2023 line 322 refers to four works for proofs. But BGSS2023 Proposition 5.4.1 (lines 2874–2895) re-derives the convergence of `F^ε_1(t)` in the sense of measures. The text now says so, and the README's "printed in none of these theorems" becomes "for every `n`, printed in none of these statements".

The same claim, "the theorem of its sources", was repaired in two more places:
- README Conventions ("Dimension and spaces").
- The module docstring of `Suggested.lean`.

`sources.toml`: BGSS2023's locator gains "§5.4 Prop. 5.4.1".

## RT-HardSphereDynamicsAndKineticLimits~2a/F02 (P3) — applied

README §10.5 route. Old: "conclude with `ProbabilityTheory.meas_ge_le_variance_div_sq`". New, in three steps:
- For small ε, `P_ε` is a probability measure and `π_t(h)` is square integrable.
- `Var ≤ E[(π_t(h) − ∫ f h)²]`, and `|E π_t(h) − ∫ f h| < δ/2`, so the event lies in `{|π_t(h) − E π_t(h)| ≥ δ/2}`.
- Apply Chebyshev at `c = δ/2`.

Evidence: the pinned lemma (`Mathlib/Probability/Moments/Variance.lean:398`) bounds `μ {c ≤ |X − μ[X]|}`, so it is centred at the mean.

Pattern repairs:
- The supplier-contract line for the lemma now states its centre.
- The §10.5 Check on `F_2 → 2 f ⊗ f` now names the second moment about `m`, and says that the variance has the same limit `m²`.

The `*Needs:*` line of §10.5 and the Dependencies of Layer 10 still cite the same lemma, so they are unchanged.

## RT-HardSphereDynamicsAndKineticLimits~2a/F03 (P3) — applied

README §7.5 gains one Check, which pins the weight `1/N!`:
- On the unit circle with ε = 0.2, the part of `𝒟̄_2` with both speeds at most 1 has `λ_2`-measure `0.6 · 4 = 2.4`.
- Its `Λ`-measure is `1.2`.
- The sum measure without `1/N!` gives `2.4`; it agrees with `Λ` on `N ≤ 1`, which is why the three existing Checks did not separate the two.

§9.3 already pins `1/N!` for `Z` (its divergence non-example), so no other place needed this.

## RT-HardSphereDynamicsAndKineticLimits~2b/F02 (P3) — applied

README §9.5 Vacuum Check. Old: "for `f⁰` of positive mass … `1/Z > 0`". New:
- For `μ > 0` and positive finite mass, `1 < Z < ∞` and the overstatement is `1/Z ∈ (0, 1)`.
- For `μ > 0` and infinite mass, `Z = ∞`, the measure is zero and both counts are 0. This is the `E` instance of §9.6.

Evidence: at that instance the `N = 1` term is `0.1 · ∞`.

Pattern repair: §9.3's "When `∫ f⁰ > 0` and `ε = 0`, every `{N = n}` has positive probability" now restates `μ > 0` and `∫ f⁰ < ∞`.

## RT-HardSphereDynamicsAndKineticLimits~2b/F03 (P3) — applied

The `grandCanonical_flow_invariant` docstring.
- Old: the infinite-`Z` invariance was attributed to "(BGSS2023 lines 479–483)".
- New: BGSS2023 lines 479–483 only name `f⁰ = M` and its invariant measure. The invariance, on every flat position space and for every `Z`, is proved in the roadmap (§9.2, §9.4) and is stated as a theorem in none of GST2013, BGSS2023 and DengHaniMa2024.

Evidence:
- BGSS2023 lines 479–483 use the invariant measure heuristically, for a noise covariance.
- GST2013 lines 786 and 1340–1346 mention Gibbs ensembles but state no invariance.

The other docstring locators were reopened and contain what they are cited for:
- `measurePreserving_flow`: GST2013 line 883 and DengHaniMa2024 line 186.
- `lintegral_sum_distinct_eq_correlation`: BGSS2023 lines 241–288.

## Checks

**Elaboration.** `lake env lean packages/HardSphereDynamicsAndKineticLimits/Suggested.lean`, run from the content checkout, exits 0. The output is 11 warnings "declaration uses `sorry`" at lines 262, 274, 294, 301, 313, 325, 371, 393, 407, 459 and 512, and no errors.

**Binders.** A scratch copy of the file with `#check @name` for all 31 named declarations was elaborated once. Every elaborated type equals the worker's signature transcript. The edits touched only docstrings and changed no binder.

The transcript's 23 "lost binder" leads were compared with the README statements. None is a defect:
- Every theorem using the flow carries `[ProperSpace X] [MeasureSpace X] [BorelSpace X] [FlatPositionSpace d X]`.
- `scatter`, `hardCoreSet`, `partitionFunction`, `grandCanonicalDensity` and `grandCanonical` carry only the instances their bodies use.

The transcript also listed two phantom declarations named `of`, read from module-docstring lines that began with "theorem of" and "structure of". Those lines, and one docstring line of `LanfordStatement` that began with "structure:", were reflowed with no change of wording. No docstring line now begins with a declaration keyword.

**Dependency check.**

    depcheck: 249 roadmaps, 2375 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line.

**Gate failures.** None were listed for this round.

## Adversarial pass on new and changed text

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §7.5 Check: weight `1/2!` | unit circle, ε = 0.2 < ρ = 1/2; speeds ≤ 1 | positions `1 · (1 − 0.4) = 0.6`, velocities `2² = 4`, `λ_2 = 2.4`, `Λ = 1.2`; without `1/N!`: `2.4`; components `N ≤ 1`: weight 1 for both | discriminates |
| §10.5 route (Chebyshev at `δ/2`) | `d = 3`, ε = 0.01, `h = 1`, δ = 0.2; Poisson ε = 0, μ = 2, `h = 1`, δ = 1 | `E π ∈ [0.9581, 1]`, `|E π − 1| ≤ 0.0419 < 0.1`; `P(|N/2 − 1| ≥ 1) = P(N = 0) + P(N ≥ 4) = 0.1353 + 0.1429 = 0.2782 ≤ Var/(1/2)² = 2` | true; eventually `0 < ε < ρ`, `μ_ε > 0` |
| `Var ≤ E[(X − c)²]` | any `c` | `E[(X − c)²] = Var X + (E X − c)²` | true |
| Supplier line: Chebyshev | pinned statement | `[IsFiniteMeasure μ]`, `MemLp X 2 μ`, `0 < c`, centre `μ[X]` | matches |
| §10.5 Check: `F_2 → 2 f ⊗ f` | limits | second moment `0 + 2m² − 2m² + m² = m²`; variance `2m² − m² = m²` | both `m²` |
| §9.5 Vacuum Check | ε = 0, μ = 2, `∫f⁰ = 1`; `E`, d = 1, ε = μ = 1, `f⁰ = 0.1 · 1_{[0,1]}(v)`; μ = 0 | `Z = e²`, `1/Z = 0.13534`, `E[trunc] = 2.13534` against `E N = 2`; `Z = ∞`, both 0; μ = 0 not claimed (`Z = 1`) | true |
| §9.3 clarified sentence | μ = 0; infinite mass; μ = 2, `∫f⁰ = 1` | `P(N = 1) = 0`; zero measure; `P(N = n) = e^{−2} 2ⁿ/n! > 0` | the hypotheses exclude the first two |
| §10.4 / docstring attribution | BGSS2023 lines 119, 313–322, 2874–2895; GST2013 lines 668, 672, 833, 2069–2080 | torus `d ≥ 2`, grand canonical; proofs referred out, except `F_1` in measures; `ℝ^{2d}`, fixed `N` | as now written |
| `grandCanonical_flow_invariant` docstring | BGSS2023 lines 470–490; GST2013 lines 780–790, 1338–1346 | no invariance theorem | as now written |

## For the maintainer

- No Lean name changed, was added or was removed, and no section id changed. Other roadmaps that cite this one are unaffected.
- No new object or construction was introduced, so this round raised no new ownership question.
- No supplier gap was declared; `design/plan.json` is unchanged.
- Nothing in the reviews read as an instruction.
