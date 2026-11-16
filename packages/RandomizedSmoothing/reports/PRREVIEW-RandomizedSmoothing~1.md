# Review of RandomizedSmoothing (pull request #2428 at ea14431)

**Verdict:** needs changes

## R01 (P2) — Two statable headlines are absent from `Suggested.lean`

**Location:** `TauCetiRoadmap/RandomizedSmoothing/Suggested.lean` (whole file); `README.md` line 8 "a radius that is sharp", lines 115–122 (2.2), lines 192–197 (5.2).
**Claim:** Sharpness of the radius (2.2) and the guarantee with the selection stage (5.2) are headline results, both statable at the pins, and neither is stated; the header names no headline as not statable.
**Witness:** Both statements below elaborate against the pins (appended to a copy of the file; `sorry` the only warning).
**Repair:** Add, in Layers 2 and 5:

```lean
/-- Sharpness of the certified radius: beyond it, some classifier with the same class
probabilities at `x` prefers `B` (Cohen–Rosenfeld–Kolter, Theorem 2). -/
theorem exists_classifier_not_certified [Nontrivial E] {k : ℕ} {σ : ℝ} (hσ : 0 < σ) {pA pB : ℝ}
    (hpB : 0 < pB) (hBA : pB ≤ pA) (hpA : pA < 1) (hsum : pA + pB ≤ 1)
    (hk : 2 + ⌈(1 - pA - pB) / pB⌉₊ ≤ k) {A B : Fin k} (hAB : A ≠ B) (x δ : E)
    (hδ : σ / 2 * (probit pA - probit pB) < ‖δ‖) :
    ∃ C : E → Fin k, Measurable C ∧ classProb σ C A x = pA ∧ classProb σ C B x = pB ∧
      (∀ c, c ≠ A → classProb σ C c x ≤ pB) ∧
      classProb σ C A (x + δ) < classProb σ C B (x + δ) := sorry

/-- The certification guarantee when the class is selected from an independent sample. -/
theorem certify_failure_le_of_selection {k : ℕ} {σ : ℝ} (hσ : 0 < σ) {C : E → Fin k}
    (hC : Measurable C) (x : E) (N₀ N : ℕ) {s : (Fin N₀ → E) → Fin k} (hs : Measurable s)
    {α : ℝ} (hα : α ∈ Ico 0 1) :
    ((Measure.pi fun _ : Fin N₀ => stdGaussian E).prod
        (Measure.pi fun _ : Fin N => stdGaussian E)).real
      {ω | 1 / 2 < cpLower α N (hitCount σ C x (s ω.1) ω.2) ∧
        ¬ SmoothCertified σ C x (s ω.1)
          (σ * probit (cpLower α N (hitCount σ C x (s ω.1) ω.2)))} ≤ α := sorry
```

## R02 (P2) — 2.2 is weaker than the cited theorem and leaves `x`, `A`, `B` unquantified

**Location:** `README.md` lines 118–120: "For every `r > (σ / 2) (Φ⁻¹ p_A - Φ⁻¹ p_B)` there are a base classifier `C` and `δ` with `‖δ‖ < r` such that `P_A(x) = p_A` …".
**Claim:** The statement gives one bad `δ` per radius; the source gives a classifier for every `δ` outside the ball. `x` and the distinct classes `A ≠ B` are never introduced.
**Witness:** Cohen–Rosenfeld–Kolter, Theorem 2 (p. 4; restated p. 15): every `δ` with `‖δ‖ > R`. With `u = δ/‖δ‖`, halfspaces `⟪z−x, u⟫ ≤ σΦ⁻¹p_A`, `≥ −σΦ⁻¹p_B`: `P_A(x+δ) = Φ(Φ⁻¹p_A − ‖δ‖/σ) < Φ(‖δ‖/σ + Φ⁻¹p_B) = P_B(x+δ)`.
**Repair:** "Let `E` be nontrivial, `x ∈ E`, `A ≠ B` in `Fin k`, `0 < p_B ≤ p_A < 1`, `p_A + p_B ≤ 1`, `k ≥ 2 + ⌈(1 - p_A - p_B) / p_B⌉`. For every `δ` with `‖δ‖ > (σ / 2) (Φ⁻¹ p_A - Φ⁻¹ p_B)` there is a base classifier `C` with `P_A(x) = p_A`, `P_B(x) = p_B`, `P_c(x) ≤ p_B` for all `c ≠ A`, and `P_A(x + δ) < P_B(x + δ)` (Cohen–Rosenfeld–Kolter, Theorem 2, p. 4 and p. 15)."

## R03 (P2) — Decision procedures and numerical enclosures are planned as targets

**Location:** `README.md` lines 162–164 "Give a decidable check of `tail N k q ≤ α` … by exact natural-number arithmetic on a common denominator, and prove it sound"; lines 169–173, 176–177 (grid recipe); lines 207–209 "Prove the rational enclosures …".
**Claim:** These are executable procedures, kernel-checked certificates and numerical computations, which a roadmap does not plan.
**Witness:** The principle "computational algorithms are not [welcome]"; 3.4 asks for a decidable checker, Layer 4 for a series-and-grid evaluation scheme (which also silently needs rational bounds for `√(2π)`), Layer 6 for three enclosures of `Φ⁻¹` to three digits.
**Repair:** Keep the mathematics: 3.4's finite-sum formula and "`tail N k q ≤ α` implies `q ≤ cpLower α N k`"; Layer 4's two mean-value inequalities `(b - a) φ(b) ≤ Φ b - Φ a ≤ (b - a) φ(a)` for `0 ≤ a ≤ b`. Delete the decidable check, the exponential-series and grid bullets, the "certify the radius" bullet and the scope line "rational bounds … as rational numbers"; retitle 3.4 and Layer 4 accordingly. In Layer 6 replace "Prove the rational enclosures" by one Check stating the value `Φ⁻¹((1/1000)^(1/100000)) ≈ 3.81`.

## R04 (P3) — Gate: `imports`, `mathlib-subimports`, `no-import-mathlib`

**Location:** `Suggested.lean` lines 9–11: `import Mathlib.Probability.Distributions.Beta`, `…Binomial`, `…Gaussian.Multivariate`.
**Claim:** The file imports Mathlib submodules and has no `import Mathlib` line; the gate fails on all three rules.
**Witness:** Gate at ea14431: `imports=1 mathlib-subimports=3 no-import-mathlib=1 … FAIL`.
**Repair:** Replace lines 9–11 by the single line `import Mathlib`, keeping the four `TauCeti.*` imports (tested: the file elaborates, `sorry` the only warning).

## R05 (P3) — Gate: `outside-folder`; the pull request edits the top-level `README.md`

**Location:** top-level `README.md` line 174: "+- [Randomized smoothing: Gaussian certified radii and exact binomial confidence bounds](TauCetiRoadmap/RandomizedSmoothing/README.md)".
**Claim:** A roadmap pull request touches only its own directory; the roadmap list is regenerated after merge. The description does not mention this edit.
**Witness:** `CONTRIBUTING.md`, "Opening a pull request": "A roadmap pull request touches only its own directory under `TauCetiRoadmap/`"; `git diff --stat origin/main...HEAD` outside the folder: `README.md | 1 +`.
**Repair:** Revert the one-line change to the top-level `README.md`.

## R06 (P3) — No claim carries a source locator

**Location:** `README.md`, Layers 1–5 throughout; e.g. line 109 "**Cohen's theorem.** The smoothed classifier is certified at `x` with class `A` and radius `R`."
**Claim:** The README has a reference list and zero locators at claims.
**Witness:** `grep` for "Theorem", "Lemma", "p. " in Layers 1–5 finds no citation.
**Repair:** Add, at the claims: 1.2 (Cohen–Rosenfeld–Kolter, arXiv:1902.02918, Lemma 4, pp. 12–13); 1.3 probit (Salman et al., arXiv:1906.04584, Lemma 2, Appendix A, p. 13); 2.1 (Cohen et al., Theorem 1, p. 4, proof p. 13; binary case p. 4); 2.2 (Theorem 2, p. 4 and p. 15); 2.3 (Propositions 3–5, pp. 17–19); 5.1–5.2 (Proposition 2, p. 6, proof p. 23); 5.3 (Section 3.2.2, p. 6); 3.2–3.3 (Clopper–Pearson 1934, pp. 404–413; Lehmann–Romano, a section-level locator for the binomial lower confidence bound).

## R07 (P3) — README shape

**Location:** `README.md` line 1 "# Randomized smoothing: Gaussian certified radii and exact binomial confidence bounds"; lines 48–66; line 204 "## Layer 6: checks"; line 217 "## Dependencies and order".
**Claim:** The title is not `# Roadmap: <lower-case title>`; `## Exact supplier contracts`, `## How to read the build` and `## Downstream consumers` are missing; no layer ends with `### Examples` and `### Dependencies`; no target has a `*Needs:*` line; no definition has its own API list and three Checks.
**Witness:** `MathematicalStatisticsFoundations/README.md` on main, lines 1, 35, 108, 162, 253. Here `smooth`, class probabilities, certification, `tail`, `cpLower` and the hit count are defined only under Conventions, with all Checks pooled in "Layer 6".
**Repair:** Retitle `# Roadmap: randomized smoothing …`. Move the supplier lists of lines 30–38 to `## Exact supplier contracts` (declaration, file, what is assumed). Define each object in the layer that first uses it, with its API bullets and a `**Checks.**` list; distribute Layer 6's items there (e.g. for `cpLower`: `cpLower α N 0 = 0` for `α < 1`; `cpLower (1/20) 10 10 = (1/20)^(1/10)`; `cpLower α N k = 1` for `k > N`; `cpLower 1 N 0 = 1`) and delete Layer 6. Give Layer 4 numbered subsections. Replace "Dependencies and order" by `## How to read the build` plus per-layer `### Dependencies`, with `*Needs:*` on each target (1.2: Mathlib `stdGaussian_eq_map_pi_orthonormalBasis`; 3.3: `binomial_tail_eq_regularizedIncompleteBeta`, `cdf_betaMeasure_eq`; 5.1: `iIndepFun.hasLaw_sum_bernoulli`, 2.1, 3.2, 3.3).

## R08 (P3) — Padding in `Suggested.lean`

**Location:** `Suggested.lean` lines 115–116 `le_cpLower_of_tail_le`, 123–124 `probit_le_of_le_stdNormalCDF`, 142–143 `cpLower_twentieth_ten_ten`, 145–147 `probit_maximal_radius_bounds`.
**Claim:** Two close with one library term, one is an instance of `cpLower_self`, one computes a numerical value; the last two mirror Layer 6 Checks.
**Witness:** On a copy: `exact (Measure.quantile_le_iff _ hp.1 hp.2).2 ht`; `exact le_csSup ⟨1, by rintro _ ⟨x, -, rfl⟩; exact x.2.2⟩ ⟨q, hq, rfl⟩`; `simpa using cpLower_self (α := 1/20) (N := 10) (by norm_num) (by norm_num) (by norm_num)` — all accepted.
**Repair:** Delete the four declarations from `Suggested.lean` (the README keeps the statements); delete `le_probit_of_stdNormalCDF_le` with them, see R09.

## R09 (P3) — Layer 4's quantile comparisons restate pinned Tau Ceti lemmas

**Location:** `README.md` lines 174–175: "For `p ∈ (0, 1)`: `Φ t ≤ p` implies `t ≤ Φ⁻¹ p`, `Φ t < p` implies `t < Φ⁻¹ p`, and `p ≤ Φ t` implies `Φ⁻¹ p ≤ t`, `p < Φ t` implies `Φ⁻¹ p < t`."
**Claim:** All four are instances of declarations at the pin and should be cited, not planned.
**Witness:** Tau Ceti `TauCeti/Probability/Quantile.lean`: `MeasureTheory.Measure.quantile_le_iff` (line 247), `lt_quantile_iff` (line 291), `quantile_lt_iff` (line 377, needs continuity and strict monotonicity of the cdf).
**Repair:** Delete the bullet; list the three lemmas under `## Exact supplier contracts` ("From Tau Ceti"), noting that `quantile_lt_iff` is applied with the continuity and strict monotonicity of `Φ`.

## R10 (P3) — A Layer 6 Check is false as written

**Location:** `README.md` line 206: "`cpLower (1/20) 10 10 = (1/20) ^ (1/10)`, and `cpLower α N 0 = 0`."
**Claim:** `cpLower α N 0 = 0` fails for `α ≥ 1`.
**Witness:** `tail N 0 q = 1 ≤ 1` for all `q`, so `cpLower 1 N 0 = sSup [0, 1] = 1`. Line 66 has the hypothesis `α < 1`; line 206 drops it.
**Repair:** "`cpLower α N 0 = 0` for `α < 1`, and `cpLower 1 N 0 = 1`."

## R11 (P3) — 5.3 lacks the hypotheses that make its bound meaningful

**Location:** `README.md` lines 201–202: "With `N` samples and level `α`, every radius returned by 5.1 is at most `σ Φ⁻¹ (α ^ (1 / N))`, by 3.3."
**Claim:** For `α = 0` or `N = 0` the bound is `σ Φ⁻¹ 0` or `σ Φ⁻¹ 1`, outside the convention of line 54; 5.1 allows `α = 0` and `N = 0`.
**Witness:** `α = 0`, `N ≥ 1`: `cpLower 0 N k = 0` for `k ≤ N`, no radius is returned, and the right side is `Φ⁻¹ 0`. `N = 0`: `1 / N` has no value.
**Repair:** "Let `N ≥ 1` and `0 < α < 1`. Every radius returned by 5.1 is at most `σ Φ⁻¹ (α ^ (1 / N))`; none is returned when `α ^ (1 / N) ≤ 1/2`."

## R12 (P3) — README and Lean do not name the same things; header and docstrings

**Location:** `README.md` line 155 "`cpUpper α N k = 1 - cpLower α N (N - k)`"; `Suggested.lean` lines 1–7, 99, 120, 123, 142, 145.
**Claim:** `cpUpper` is a backticked name of this roadmap that `Suggested.lean` does not declare; the README never names `stdNormalCDF`, `probit`, `classProb`, `SmoothCertified`, `hitCount` or any theorem; the header is a plain comment titled "suggested interfaces"; five theorems have no docstring.
**Witness:** `grep -c "classProb\|SmoothCertified\|hitCount\|stdNormalCDF" README.md` gives 0; `Suggested.lean` line 99 `theorem monotone_cpLower` follows a blank line.
**Repair:** Write the upper bound in prose without a code-span name (or declare it). Name each kept Lean declaration at its README target (`classProb` for `P_c(x)`, `SmoothCertified` for "certified", `hitCount` for `K`, and the theorem names). Make the header a module docstring `/-! # Randomized smoothing: target signatures … -/` after the imports, saying that the roadmap is `README.md` and which headlines are not statable (none). Give every remaining theorem a docstring.

## R13 (P3) — "Positivity dichotomy" has three alternatives

**Location:** `README.md` line 74: "**Positivity dichotomy.** Exactly one of the following holds: …"; line 19; `Suggested.lean` line 50.
**Claim:** The statement is a trichotomy (and the Lean name is `smooth_trichotomy`).
**Witness:** `E` trivial, `f ≡ c`: `smooth σ f = c`, so `c = 0`, `c = 1`, `c ∈ (0, 1)` are three distinct cases.
**Repair:** Say "positivity trichotomy" in lines 19 and 74 and in the docstring.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 trichotomy | `E` trivial, `f ≡ c`; `f` halfspace indicator | `smooth = c`; `smooth = Φ((b − ⟪x,u⟫)/σ) ∈ (0,1)` | holds; name R13 |
| 1.2 shift inequality, both forms | halfspace `⟪z,u⟫ ≤ t`, shift `δ`; `δ = 0`; `E` trivial | mean `Φ t` → `Φ(t − ‖δ‖)` exactly; `δ = 0` gives hypothesis = conclusion | holds; Cohen Lemma 4 |
| 1.3 probit `σ⁻¹`-Lipschitz | halfspace | `Φ⁻¹(smooth) = (b − ⟪x,u⟫)/σ`, slope exactly `1/σ` | holds, constant attained; Salman Lemma 2 |
| 1.3 smoothing constant | halfspace at boundary; sup over `f ∈ [0,1]` | derivative `φ(0)/σ = 1/(σ√(2π))`; `E[(X·u)⁺] = 1/√(2π)` | holds and sharp (Salman Lemma 1 gives only `√(2/π)`) |
| 2.1 Cohen radius, Lean `smoothCertified_of_bounds` | `pA ≤ pB`; `k = 1`; `E` trivial | `R ≤ 0`, vacuous; no `c ≠ A`; `δ = 0`, `P_c ≤ pB < pA ≤ P_A` | holds |
| 2.1 one-sided | `p̄_B = 1 − p̲_A` | `(σ/2)(Φ⁻¹p − Φ⁻¹(1−p)) = σΦ⁻¹p` | holds |
| 2.2 sharpness | `p_A = 3/4, p_B = 1/4`; `p_A = p_B`; `p_A + p_B < 1` | crossover at `s = σ(Φ⁻¹p_A − Φ⁻¹p_B)/2 = 0.6745σ`; `R = 0`; `⌈(1−p_A−p_B)/p_B⌉` slabs each `≤ p_B` | true, weaker than source: R02 |
| 2.3 halfspaces | `⟪x,u⟫ < b` | `σΦ⁻¹(Φ((b−⟪x,u⟫)/σ)) = b − ⟪x,u⟫`; at that distance `P_A = 1/2` | holds, exact |
| 3.1 monotonicity, `monotone_cpLower` | `α < 0`; `k = 0`; `k > N` | all sets empty, `cpLower = 0`; `{q}` grows with `k`, `sSup ∅ = 0 ≤` | holds for every `α` |
| 3.2 coverage, `binomial_real_lt_cpLower_le` | `α = 0`; `α ≥ 1`; `p = 1`; `N = 0` | `cpLower 0 N k = 0` for `k ≤ N`, mass 0; trivial; empty event; `k = 0`, `cpLower = 0` | holds |
| 3.3 Beta quantile | `k = N`: Beta(N, 1) cdf `q^N` | quantile `α^(1/N)` = `cpLower α N N`; `sup{F ≤ α} = inf{F ≥ α}` by strict monotonicity | holds |
| 3.3 `cpLower_self` | `α = 0`, `α = 1`, `N = 1` | `0`, `1`, `α` on both sides | holds |
| 3.3 upper bound | `k > N` (truncated `N − k = 0`) | `cpUpper = 1`, not `< p`; event has `Bin` mass 0 | holds |
| 3.4 | `q = 1`, `α < 1`, `k ≤ N` | hypothesis `1 ≤ α` false | holds; padding R08, procedure R03 |
| Layer 4 quantile comparisons | pinned `quantile_le_iff`, `lt_quantile_iff`, `quantile_lt_iff` | identical statements for `gaussianReal 0 1` | duplicate: R09 |
| 5.1 `certify_failure_le` | `N = 0`; `α = 0`; `K = N` | `cpLower = 0`, no failure; same; `cpLower = α^(1/N) < 1`, so `Φ⁻¹` is on `(1/2, 1)` | holds; failure ⊂ `{P_A < p̲}` |
| 5.2 selection | `N₀ = 0` (constant `s`) | reduces to 5.1 | holds; absent from Lean: R01 |
| 5.3 | `α = 0`; `N = 0` | `Φ⁻¹ 0`; `α^(1/0)` | R11 |
| Layer 6 numerics | three enclosures; `Φ⁻¹(3/4)` | `0.64685`, `1.50048`; `1 − p = 6.9075e-5` between `Q(3.82) = 6.673e-5` and `Q(3.81) = 6.948e-5`; `0.67449` | correct; R03, R10 |

- Source locators checked against the text: 8 (Cohen–Rosenfeld–Kolter lines 305, 336, 347, 490, 498–508, 1140–1149, 1232, 1618; Salman et al. lines 715, 743).
- Library declarations opened at the pins: Mathlib `ProbabilityTheory.binomial` (`Probability/Distributions/Binomial.lean` 56), `stdGaussian` and `stdGaussian_eq_map_pi_orthonormalBasis` (`Gaussian/Multivariate.lean` 65, 144), `betaMeasure` (`Beta.lean` 132); Tau Ceti `Measure.quantile` (`Probability/Quantile.lean` 164), `quantile_le_iff` (247), `lt_quantile_iff` (291), `quantile_lt_iff` (377), `quantile_gaussianReal` (`Gaussian/Quantile.lean` 57), `binomial_tail_eq_regularizedIncompleteBeta` (`Binomial/Tail.lean` 128), `cdf_betaMeasure_eq` (`Beta/Cdf.lean` 136), `iIndepFun.hasLaw_sum_bernoulli` (`Binomial/Basic.lean` 132).
- Cross-roadmap citations resolved: MathematicalStatisticsFoundations 6.2 (main, README line 972) and 1.4 (line 385); StandardDistributions (main); RobustnessCertificates (open, new roadmap, named in the description).
- Dependency check: `depcheck: 240 roadmaps, 2251 edges, 0 problem(s)`.
- Gate: FAIL (`imports`, `mathlib-subimports`, `no-import-mathlib`, `outside-folder`); build passes.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning; `#check` signatures compared with the README for all 25 declarations. `smooth`, `classProb`, `SmoothCertified`, `hitCount` drop `[BorelSpace E]`, which their definitions do not need; every theorem carries it.
- Overlap check: read RobustnessCertificates, MathematicalStatisticsFoundations, StandardDistributions; Neyman–Pearson lemma: MathematicalStatisticsFoundations 6.2 (cited); exact binomial intervals: listed by MathematicalStatisticsFoundations under "Beyond this roadmap", so owned here; nothing else shared.
- Source independence: 8 passages compared with 2 sources, none shared; the README has no locators, the source the statements rest on most is Cohen–Rosenfeld–Kolter (6 of the 8 passages); contents compared with it (Sections 3.1–3.3, 4, Appendices A–J): independent. Clopper–Pearson and Lehmann–Romano were not read.

## Not verifiable

- Clopper–Pearson 1934 (3.2, 3.3): the DOI's landing page refuses access; no open copy found.
- Lehmann–Romano 2005, Chapter 3 (1.2, 3.2): no legal copy found; the chapter-level citation has no section or page to check.
- The provenance statement about the `lean4-mlir` files and their licence: the repository was not read.

## Source issues

- none

## For the human reviewers

- **Scope.** The subject is a certification method from machine learning; the main sources are refereed conference papers (ICML 2019, NeurIPS 2019, IEEE S&P 2019) plus Clopper–Pearson 1934; `metadata.toml` files it under `math.ST`.
- **Licence.** `README.md` lines 226–236 say much of the Lean is restated from `brettkoonce/lean4-mlir` (BSD-3, same author as the pull request); the repository and its licence file were not read.
- **Not tested.** Clopper–Pearson 1934 and Lehmann–Romano could not be read; wording and arrangement were compared only with the two arXiv texts.
