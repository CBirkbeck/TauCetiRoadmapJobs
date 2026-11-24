# Review of ConsequencesOfTheRiemannHypothesisForDirichletLFunctions (pull request #3027 at f596230)

**Verdict:** needs changes

**Summary.** The mathematics holds: the sampled discharges match the conditional theorems they cite, the recomputed values are right, the nine Lean statements are true and match the README, and all six remarks of the previous review are repaired. One finding blocks: the docstring of `Suggested.lean` calls three targets "not statable" that can be stated at the pins with one-line definitions: Li and Weil positivity (1.6), the zero count of `ζ` (1.3) and the residue approximation 4.4 (ii). There are no small corrections and three format notes; the human reviewers have two facts to weigh, on scope and licence.

## R01 (P2) — Three targets the docstring lists as not statable can be stated at the pins, so headline targets are missing from the acceptance test

The docstring of `Suggested.lean` (lines 50–57) puts three targets among those "written in the other definitions of other roadmaps, which are not in the library": "the zero count `N(T)` (1.3) of `ζ`; the Li coefficients and the Weil form (1.6); … the truncated Euler sum and its error in 4.4 (ii)". The docstring's own classification makes these targets that would be stated if they could be. A separate list holds the statable targets the author does not count as headlines. So the acceptance test is missing statements its author means it to have. 1.6 matters most: it is the one target whose proof (the strict positivity of Weil's form, by counting zeros without multiplicity) is this roadmap's own.

Each can be stated with only simple definitions that have real bodies on carriers at the pins:

- **1.6.** WeilPositivityAndLiCriterion's `Suggested.lean` defines these in one line each (lines 38–39, 67–69 and 149–150):
  - `zetaZeroMult ρ := (MeromorphicOn.divisor completedRiemannZeta univ ρ).toNat`;
  - `liCoeff n`, a `tsum` over `ρ`;
  - `weilForm g h`, a `tsum` over `ρ` with Mathlib's `mellin`.

  The open roadmap LiCoefficientsArithmeticFormula copies them into its own namespace for the same reason.
- **1.3.** With `zetaZeroMult`, `N(T)` is `∑ᶠ ρ ∈ {ρ | 0 < ρ.im ∧ ρ.im ≤ T}, zetaZeroMult ρ`.
- **4.4 (ii).** `κ_K` is Mathlib's `NumberField.dedekindZeta_residue K` (`NumberTheory/NumberField/DedekindZeta.lean:57`) and `Λ_K` is Tau Ceti's `TauCeti.primeVonMangoldtCoeff K Set.univ` (`ArithmeticDirichletSeries/Prime/Psi.lean:446`). ClassicalArithmeticCompletion §5.16a names the same carriers.

The following statements elaborate at the pins with `sorry` as the only warning:

- `0 < liCoeff n` for `n ≥ 1`;
- `0 < (weilForm g g).re` for `g` smooth, compactly supported in `(0, ∞)` and nonzero;
- `∃ C, ∀ T ≥ 16, |N(T) − (T/2π) log(T/(2πe)) − 7/8| ≤ C log T/log log T`;
- 4.4 (ii) for `K` with `IsAbelianGalois ℚ K` and `T ≥ 100`, with `S_K(T)` and `ε_K(T)` written out as in §5.16a.

The fix: state 1.6 and 1.3, with the three definitions copied under this roadmap's namespace; the README's "Consumed, not redefined" can say they are copies of WeilPositivityAndLiCriterion §§1.1, 3.1 and 5.1. 4.4 (ii) should be stated as well. If the author does not count it as a headline, move it in the docstring to the list of statable targets that are not stated, with the reason.

## N01 — Two cited works have no entry in the References

Cully-Hugill–Johnston (2.9's Origin and its §7.5 bullet, and *CullyHugillJohnstonTable* in the Conventions) is named without a year or a reference entry. ExplicitPrimeCounting cites it as `cully-hugill-johnston-2021`, Theorem 1.3. The von Mangoldt–log sum of 4.6 is Garcia–Grenié–Lee–Molteni (J. Number Theory 2026, arXiv:2506.17416, Theorem 2.1). The 4.6 Origin label does not name it, and the References have no entry for it.

## N02 — The citation "ImaginaryQuadraticClassNumber H2.4" in 4.1 uses that roadmap's former label

On main it is §2.4, and its Conventions keep a map from the old labels, so the citation still resolves. "§2.4" would match the current text.

## N03 — The opening overview states no theorem of this roadmap with its hypotheses

The overview states the main theorems of the supplier and gives a guide to the layers, but none of this roadmap's own headline statements. A sentence would let a reader place the roadmap at once, for example: Lindelöf's bound, Littlewood's bounds for `L(1, χ)` and `h(D) ≫ √|D|/log log |D|`, von Koch's bound, and `ψ(x; a, q) = x/φ(q) + O(√x log² x)`.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 0.1 (ZerosOfLFunctions §9.1) | `N = 1`; Lean type | §9.1 (iii)⇒(i) at head; `completedLFunction_modOne_eq`; poles of `completedRiemannZeta` order −1, excluded by `0 <` | holds |
| 0.2 (Lean) | `K = ℚ(i)`; `#check @` | `ζ_K = ζ·L(χ₋₄)`; type uses `heckeLFunctionC (1 : PrimitiveRayClassCharacter K).character`, `1/2 < re` | holds |
| 0.3 (Lean, Check) | `K = ℚ(i)`, `L = ℚ(ζ₁₂)` | `L/K` ramified only at `(3)`; `φ̃(𝔭) = (N𝔭/3)`; `(1+i) ↦ (2/3) = −1` | holds |
| 0.5 (RHSC §§9.3, 9.6) | (a) at `σ = 1/2` | §9.6 has (a), (c) only; README maps (b) to §9.6(c); `1/2 < 3/4` gives no exceptional zero | matches |
| 0.6 (EZB §§0.2, 0.4; EPC §1.2) | four heights; `q = 6` | §0.2 laws `(∀H) RH(H) ⇔ RH`, passage to imprimitive; four §0.4 heights listed identically | holds |
| 0.7 (EZB §§0.4b, 9.3) | `q = 3`; `q > 10⁶` | `1 − 1/(5 log 3) = 0.81795`; `1.507/11.657 = 0.12928 > 1/8`; quadratic means `χ ≠ 1` (EZB Conventions) | holds |
| 0.9 | records | `m₇ = 16.2278074617 − 16.2106480369 = 0.0171594248`; lower error `0.175303 ≤ 0.1754`; `0.0162353 < m₇`; `5.7699 ≤ 5.8025` at `10⁹` | holds |
| 0.9 record | zeros to 200 | `N(200) = 79`, `74` in `(4πe, 200]`; at `4πe` `0.221530 ≤ 0.228129`; least margin `0.00104` at `43.327` | holds |
| 1.1 (RHSC §9.7) | (ii)(c),(d) | (c) Lindelöf for `σ ≥ σ₀`, line included; (d) `|L′/L(1)| ≤ C log log 𝔮₁`; `log log 3 = 0.094 > 0` | matches |
| `norm_riemannZeta_le_rpow` | `σ ≥ 2`; junk at `1` | `|ζ| ≤ ζ(2)` for `σ ≥ 2`; `|Im s| ≥ 2` excludes `s = 1`; probe fails | true, not padding |
| `LFunction_one_bounds` | `q = 2, 3`; `C < 0` | no primitive χ mod 2; `C < 0` makes second conjunct false, so `C > 0` forced | true |
| 1.3 (EZB §2.9) | `T ≥ 16` | bracket `7/8 < ϑ/π + 1 − main < 7/8 + 1/(40T)`; `1/(40T) < log T/log log T` | holds |
| 1.4 (EZB §§7.2–8.5) | `R = 0.7`; boundaries | `0.7 log 20 = 2.097`, boundary `0.4606`, `e^{2/0.7} = 17.41`; `R > 9.4648`; classical min `0.7405` | holds |
| 1.5 (EZB §7.9) | conductor 3 | `(log 3)/2 = 0.5493 > 1/6.50 = 0.1538 > 0.1037` | holds |
| 1.6 | probe | `zetaZeroMult`, `liCoeff`, `weilForm` one-line; `liCoeff_pos`, `weilForm_pos`, 1.3 bound elaborate, sorry only | R01 |
| 2.1 / `primeCounting_sub_logIntegral_isBigO` | `logIntegral` | `#print`: `∫ t in 2..x, (log t)⁻¹`; `li 2 = 1.04516`, constant shift | holds |
| 2.2 (EPC §2.2) | thresholds | Lee–Nosal `x ≥ 11`, `101`, `2657` (LN v4 lines 65–72); Schoenfeld `73.2, 59, 599, 0, 23·10⁸, 2657, 3/2` | matches |
| 2.3 (EPC §§2.3, 2.6) | initial ranges | sup ratios `0.608178` on `[49/16, 25/8)`, `0.630042` on `[47/16, 3)`; `|ψ(3) − 3| = 1.2082 < 2.0905` | holds |
| 2.4 Checks | `23⁻`, `149⁻`, `29⁻`, `223⁻` | `3.7343 > 3.7016`; `22.3564 > 22.3395`; sup `0.839888`, `0.879691`, `0.883754` | holds |
| 2.5 (EPC §3.5) | `L = 3914, 3915` | `li 2 − P₄(2) = −369.99419`; `120(1 + 768/L) = 143.546`; `ε_M − ε′_m = 3914.50 < 3915` | holds |
| 2.9 Checks | rows | KL `2.72682·10⁻⁸ < 2.77140·10⁻⁸`; CHL `0.73684`; RS `8039`, `533.4 > 378.9`; `10 726 904 659`, `10 726 905 041` prime, no prime between | holds |
| 3.1 / `psiAP_isBigO` | `q = 1` | `ψ(x) − x`; `vonMangoldt.residueClass : ZMod q → ℕ → ℝ` | holds |
| 3.2 Checks | `q = 8`; `p = 10 007` | `ε = 0.112191`, `159.6×` row; sup `162.4754` at `8597⁻`, value `153.4163` | holds |
| 3.3 (EPC §6.5) | `q = 1, 2, 3, 4` | `56.25`; `207.2`; `3/56.25 = 0.0533`; `5/7.687 = 0.6504`; `φ(2 log q + 1.114) + 5 > φ log q` | holds |
| `exists_ne_zero_ne_one_le_log_sq` | `q = 3`, mod 12 | QRH §11.2 at `θ = 1/2` exponent `2`; `χ(2) = −1` at `q = 3` | true |
| 4.1 / `mul_sqrt_div_log_log_le_classNumber` | `|D| = 7` | `log log 7 = 0.6657 > 0`; Tau Ceti `h = √|D| L(1, χ_D)/π` for `D ≠ −3, −4` | true |
| 4.2 Checks | `d_F = 13, 15` | `(π/6)√13 = 1.8879 < 2`; `2/√15 = 0.5164 < π/6 = 0.5236` | holds |
| 4.4 (ii) | probe | `dedekindZeta_residue`, `primeVonMangoldtCoeff`; statement elaborates, sorry only | R01 |
| 4.5 (CAC §§5.0, 5.1b, 5.1c) | `ℚ(√−5)`, `ℚ(√−23)` | §5.1b needs ERH ∧ HeckeGRH; §5.1c HeckeGRH only; `12 (log 20)² = 107.7` | matches |
| 4.6 (ENF §§3.5, 3.6) | `13.5, 17, 19, 23, 24.4⁻` | `0.125980 < 0.127871` … `0.094672 < 0.111227`; `0.076002`; `0.078041 < 0.094672` | holds |
| 4.7 (ENF §§7.2, 7.4) | `L = K` | GM Thm 1.1 `x ≥ 1` (GM lines 121–123); §7.4 Bach–Sorenson `(4 log d_L + 2.5 n_L + 5)²`, `L ≠ ℚ` | matches |

- Source locators checked against the text: 8, in johnston-yang-2023 (Lemma 2.5, lines 189–203), dudek-2015 (Theorem 2, lines 51–52; Ramaré–Saouter line 48), carneiro-milinovich-soundararajan-2019 (Theorem 5, lines 261–273), grenie-molteni-2019 (Theorem 1.1, Corollary 1.2, lines 121–138), lee-nosal-2026 (Theorems 1.1–1.2, Corollary 1.3, lines 65–88).
- Library declarations opened at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`): 22 by `#check`.
  - Tau Ceti: `isPrimitive_fundamentalDiscriminantCharCast` (`Multiquadratic/FundamentalDiscriminant/Realization.lean:59`), `classNumber_eq_LFunction_one_of_discr_ne` (`NumberField/Quadratic/DedekindZeta.lean:288`), `mertensConstant` (`LFunctions/Mertens.lean:545`), `primePsi` (`ArithmeticDirichletSeries/Prime/Psi.lean:148`), `primeVonMangoldtCoeff` (`Psi.lean:446`), `IdealArithmeticFunction.vonMangoldt` (`ArithmeticDirichletSeries/VonMangoldt.lean:82`), `kroneckerWeber` (`ClassFieldTheory/ClassFields/KroneckerWeber.lean:178`), `hilbertClassArtinEquiv_oneEquivClassGroup` (`ClassFields/RayClassField.lean:269`), `PrimitiveRayClassCharacter.of_induced`, `RayClassGroup.hom_ext`, `Modulus.eq_one_of_dvd_one`, `logIntegral`.
  - Mathlib: `NumberField.dedekindZeta_residue` (`NumberField/DedekindZeta.lean:57`), `AnalyticOnNhd.sum_divisor_le`, `polynomialFunctions_closure_eq_top`, `completedLFunction_modOne_eq`, `LFunction_apply_one_ne_zero`, `vonMangoldt.residueClass`.
- Cross-roadmap citations resolved: 74 sections and layers.
  - At this head: GeneralizedRiemannHypothesisFromWindowBounds, RiemannHypothesisStatementsAndConsequences, ZerosOfLFunctions, AnalyticNumberTheoryPartI, QuasiRiemannHypothesis, ExplicitNumberFields.
  - On main: ExplicitZetaBounds, ExplicitPrimeCounting (also at #3036, same section numbers), ClassicalArithmeticCompletion, ExplicitMultiplicativeFunctions, WeilPositivityAndLiCriterion, ErdosProgressionPowers, SieveMethodsAndPrimePatterns, ClassFieldTheory, and LFunctions Layers 3–5 and 8, which still match on main after its revision.
  - ImaginaryQuadraticClassNumber H2.4 resolves through main's map to §2.4.
- Automatic checks: all passed; dependency check `0 problem(s)`; no UPWARD or CYCLE.
- Elaboration: nine `sorry` warnings only. `#check @` on all nine: no section binder lost, and each type matches its README statement. The one-tactic probe (`simp_all`, `rfl`, `norm_num`, `positivity`, `infer_instance`) closes none.
- Probes for R01: `liCoeff_pos`, `weilForm_pos`, the 1.3 bound and 4.4 (ii) elaborate at the pins with only `sorry` warnings.
- Numerics recomputed in plain Python: Johnston initial ranges, 0.9 constants, 2.4/2.5/2.9/3.2/3.3/4.6 Checks, primality near Ramaré–Saouter's threshold, the zeros of `ζ` to height 200.

- Previous review: R01 repaired (five statements added, docstring rewritten; R01 above concerns the new docstring); C01 repaired ("a record of the published rows that no general statement here gives, and 0.6 discharges its premise"); C02 repaired (0.5 "RiemannHypothesisStatementsAndConsequences's own formulation"; 2.3, 2.4 mark the preprints); C03 repaired ("every numerical record other than those that this roadmap states"); C04 repaired ("takes its conditional theorems from"); N01 repaired (now 0.9).

Overlap check: read GeneralizedRiemannHypothesisFromWindowBounds (main and head), ExplicitPrimeCounting (main and #3036), ExplicitZetaBounds, ExplicitNumberFields, ZerosOfLFunctions (head and #3012), LiCoefficientsArithmeticFormula (#2858), AnalyticNumberTheoryPartI and ErdosProgressionPowers. Each shared object has one owner:

- the conditional theorems are owned by the roadmaps in each heading and are cited;
- the main theorems are owned by GeneralizedRiemannHypothesisFromWindowBounds;
- the Layer 0–4 discharges and the six records are owned by this roadmap: at this head GeneralizedRiemannHypothesisFromWindowBounds has no Layer 6 and no §§5.4–5.6, and the four moved Lean names live only here;
- `zetaZeroMult`, `liCoeff` and `weilForm` are owned by WeilPositivityAndLiCriterion.

The unconditional forms of Lindelöf, Littlewood, von Koch and least-value appear nowhere else in Lean; RiemannHypothesisStatementsAndConsequences has only their conditional forms.

Source independence: 8 passages compared with 5 sources, none shared beyond forced formulas and thresholds. The largest share of reference locators is johnston-yang-2023, 5 of about 61 (Schoenfeld 1976 next with 4). Contents compared with johnston-yang-2023 (introduction, lemmas, three proofs): independent. The layers follow the subjects of the discharged theorems: hypotheses, zeros, prime counts, progressions and number fields.

Research link: The targets are the unconditional forms of published conditional theorems, among them von Koch (1901), Littlewood (1928), Schoenfeld (1976), Bach–Sorenson (1996), Lamzouri–Li–Soundararajan (2015), Dudek (2015), Carneiro–Milinovich–Soundararajan (2019), Grenié–Molteni (2019) and Lee–Nosal (2026). GRH itself comes from GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3. This rests on the README and on the five sources read.

## Not verifiable

- Davenport (2000) chapters 9 and 12, Heilbronn (1967), Titchmarsh (1986), Iwaniec–Kowalski (2004): books, not fetched; their locators match the supplier sections that cite them.
- Littlewood (1928): not fetched; checked as RiemannHypothesisStatementsAndConsequences §9.7 (ii)(d) states it.
- Schoenfeld (1976): not fetched this round; an earlier round found the sources service does not classify the AMS host.
- Hoffstein (1980/81), Lemma 1: checked only as ExplicitZetaBounds §9.3 quotes it from Lu–Zaman–Zhao.
- *ZetaZeroReciprocalLowRange*: checked with zeros computed by the Riemann–Siegel formula with two correction terms, the first eight replaced by their published values; not against a certified zero table.

## Source issues

- none

## For the human reviewers

- Scope: every target rests on GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3. Their source is a formal Lean proof announced on 20 November 2026 (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, line 16), not a refereed publication. The conditional theorems discharged here are published, except the preprints the Origin labels mark.
- Licence: the family index says that repository's proof "was published without a license" (same file, line 20). This roadmap cites it only through GeneralizedRiemannHypothesisFromWindowBounds.
