# Review of ConsequencesOfTheRiemannHypothesisForDirichletLFunctions (pull request #3027 at 3b77a6a)

**Verdict:** accepted

**Summary.** Accepted: the thirteen Lean statements are true and match the README, among them the five new ones for the zero count of `ζ` and for Li and Weil positivity, whose four definitions agree word for word with WeilPositivityAndLiCriterion's. The fifteen sampled discharges match the sections they cite, at those roadmaps' current texts, and the recomputed values hold. All four remarks of the previous review are repaired. There are no findings, no small corrections and one format note. Three facts are left for the human reviewers: the unrefereed formal proof that every target rests on, its licence, and the removal of these sections from GeneralizedRiemannHypothesisFromWindowBounds on main.

## N01 — Code font for two predicates that no Lean file declares

RiemannHypothesisStatementsAndConsequences has a record form and a ray-class form of its predicate. In this README both are in code font: `d.GeneralizedRiemannHypothesis` and `riemannZetaData.GeneralizedRiemannHypothesis` (lines 115, 249, 252, 400–401, 2034), and `φ̃.character.GeneralizedRiemannHypothesis` (lines 310, 331). That roadmap's `Suggested.lean` declares only the Dirichlet form (line 87), and the supplier contracts here put the other two in italics (lines 2033, 2037). Italics in those places would match the README's own convention for proposed names.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 0.1 `re_eq_half_of_meromorphicOrderAt_completedLFunction_pos` | `N = 1`; diff with main | `completedLFunction_modOne_eq` gives `completedRiemannZeta`, poles of order `−1` excluded by `0 <`; type identical to main's former 5.4 | holds |
| 0.2 (ANT-I §2.42) and Lean | `K = ℚ(i)` | §2.42 (head, line 2057): ERH(`K`) ⇔ RH ∧ `DirichletGRH χ` for nontrivial `χ`; `ζ_K = ζ·L(χ₋₄)`; type unchanged from main | holds |
| 0.3 Lean | `K = L = ℚ` | `φ = 1`, `φ̃ = 1`, L-function `dedekindZetaC ℚ`; statement identical to main's former 5.6 | holds |
| 0.5 (RHSC §§9.3, 9.6) | `σ = 1/2` | §9.6 has (a) and (c) only; (a) at `1/2 < 3/4` gives no exceptional zero; README (b) is §9.6 (c), `C√y` | matches |
| 0.7 (EZB §§0.4b, 9.3) | `q = 3`, `q = 10⁶` | `1 − 1/(5 log 3) = 0.81795 > 1/2`; `1.507/11.657 = 0.12928 > 1/8`; width `0.00621`; EZB line 107: quadratic means `χ ≠ 1` | holds |
| 0.8 (ANT-I §0.16; ErdosProgressionPowers §0.9) | four characters mod 8 | zero clause is the strip form at `|Im s| ≤ 10000`; Erdős headlines carry `hM` (Suggested.lean lines 186, 202, 225) | holds |
| 0.9 (EPC §2.1) | `T = 4πe`, `200`, `10⁷` | `m₇ = 0.0171594248`; `0.016235 < m₇`; lower error `−0.17530 ≥ −0.1754`; JY Lemma 2.5 (line 189) | holds |
| 1.1 `norm_riemannZeta_le_rpow`, `LFunction_one_bounds` | `C < 0`; `σ ≥ 2` | RHSC §9.7 (ii)(c),(d); RHSC Suggested.lean line 193, same type plus GRH; `C < 0` falsifies the second conjunct | holds |
| 1.3 `abs_sum_zetaZeroMult_sub_le` | `T = 16`; finiteness | `log log 16 = 1.0198`, factor `2.719 > 1/(40T) = 0.0016`; support in bounded strip; `log T/log log T` increasing past `e^e = 15.154` | holds |
| 1.4 (EZB §§7.2–8.5) | `R = 0.7`, `t₀ = −20`; `|t| = 3` | boundary `0.4606 < 1/2`; `e^{2/0.7} = 17.41`; `R > 9.4648`; classical minimum `0.7405`, Ford `0.89246`; names at EZB Suggested.lean 700–835 | holds |
| 1.6 `liCoeff_pos`, `liGramMatrix_posDef`, `re_weilForm_pos` | `N = 0, 1`; `n = 0` | bodies equal WPLC Suggested.lean 38–39, 67–69, 130–132, 149–150; entry `2λ₁`; `liCoeff 0 = 0` by `simp`; probes fail | holds |
| 1.6 route (strict Weil) | multiplicity; `sinh` | `m_ρ ≤ 2C log γ/log log γ`; distinct zeros `≫ T log log T` against Jensen's `O(T)`; `Σ⌊log(n+1)⌋ ≍ R log R` in the Check | holds |
| 2.1 (RHSC §9.9) and `primeCounting_sub_logIntegral_isBigO` | `(q)∞` | type equals RHSC Suggested.lean line 221 without `h`; `#Cl_{(q)∞} = φ(q)` | holds |
| 2.6 (EPC §4.7) | hypothesis list | same eight hypotheses as §4.7 (`ButheVerified` … `YangRecord`); thresholds `43.1`, `24.4` | matches |
| 2.7 (EMF §§0.7, 1.9, 8.1) | clauses | `ZetaResidueSumVerified` (a) = `RH(T)` and simplicity; `33.56`, `e^{4589.20}`; Leong (b) `1719 log t`; `ε_RH`, `x ≥ 24.4` | matches |
| 2.9 (EPC §§7.1–7.3, 7.5) | thresholds of each row | `1.091·10¹¹ ≤ 2.410·10¹⁴`; RS `0.0428`, `0.1037`, `0.7721`, `8039`; KL `2.72682·10⁻⁸ < 2.77140·10⁻⁸`; CHL `0.73684`; powers `0.0207`; `x = 7`: `0.3644` | holds |
| 3.1 `psiAP_isBigO` | `q = 1` | `residueClass` on `ZMod 1` is `Λ`; type identical to main's former 6.5 | holds |
| 3.2 (EPC §§6.1, 6.3, 6.6) | `q = 8`, `q = 2, 3`, `q = 10⁵` | `X = 1.54503`, `ε = 0.112191` against `0.00070275`; `9.947 > e^{2/R} = 1.2304`; `0.85996`, `0.85043`; `9.54·10⁻⁴` | holds |
| 3.4 `exists_ne_zero_ne_one_le_log_sq` | `q = 2, 3`; Hecke form | `q = 2` vacuous; `χ₋₃(2) = −1`; QRH §11.2 at `θ = 1/2`, exponent `2`; `C_{K,θ}(log N𝔪₀ + 2)²` | holds |
| 4.1 (RHSC §9.7) and Lean | `|D| = 7` | `log log 7 = 0.6657 > 0`; Tau Ceti `h = √|D| L(1, χ_D)/π` for `D ≠ −3, −4` (`#check`); `c = 1/(πC)` | holds |
| 4.3 (ANT-I §2.49) | `L = F = ℚ` | `n > 1` excludes `log D = 0`; ERH(`L`) by 0.2; `O(x^{1/2} log(Dx^n))`, least prime `≪ (log D)²` | matches |
| 4.4 (CAC §5.16a) | clauses (i), (ii) | (i) `DedekindERH`, `x ≥ 100`; (ii) adds `RiemannHypothesis`, `T ≥ 100`, same `ε_K(T)` | matches |
| 4.6 (ENF §§3.5, 3.6) | `x = 13.5, 17, 19, 23, 24.4⁻` | `0.125980 < 0.127871`, `0.099937 < 0.120624`, `0.114062 < 0.117145`, `0.094672 < 0.111227`; `0.076002`; GGLM Thm 2.1 line 140 | holds |
| N01 (lines 115, 249, 252, 310, 400, 2034) | RHSC Suggested.lean | declares only `DirichletCharacter.GeneralizedRiemannHypothesis` (line 87); README italicises the others at 2033, 2037 | format |

- Earlier remarks: R01 repaired: 1.3 and 1.6 are stated (`abs_sum_zetaZeroMult_sub_le`, `liCoeff_pos`, `liGramMatrix_posDef`, `re_weilForm_pos`, four copied definitions). 4.4 moved to "Targets that can be stated at the pins" with its reason. N01 repaired: references for "Cully-Hugill and Johnston (2023)" and "Garcia, Grenié, Lee and Molteni (2026)". N02 repaired: "ImaginaryQuadraticClassNumber §2.4". N03 repaired: the overview now states Lindelöf, Littlewood, `h(D)`, von Koch, `ψ(x; a, q)`, the zero count and positivity.
- Source locators checked against the text: 10 in 5 sources. GGLM 2026: Theorem 2.1 and its route, lines 140–144. Cully-Hugill–Johnston: Theorems 1.2–1.3 and Table 4, lines 83–95. Lu–Zaman–Zhao: Theorem 1.1, line 39; Corollary 1.3, line 96; Hoffstein's lemma as quoted, lines 369–371. Leong: Corollaries 3–4, lines 113 and 125. Johnston–Yang: Lemma 2.5, line 189.
- Cross-roadmap sections read where they are cited: about 45.
  - At this head: ANT-I §§0.16, 2.42, 2.49; RHSC §§9.3, 9.6, 9.7, 9.9; ENF §§3.5, 3.6 and its contract for `gap:explicit-mertens-second`; QRH §11.2; GRHFWB.
  - On main: EZB §§0.3, 0.4b, 7.2, 7.3, 7.3a, 7.9, 8.3a, 9.3; EPC §§1.1, 1.4, 2.1, 4.7, 6.1, 7.1, 7.2, 7.5; EMF §§0.7, 1.9, 8.1; CAC §5.16a; Erdős §§0.9, 2.3, 2.6; WPLC §§1.1, 3.2, 4.2, 5.1, 5.2; IQCN §2.4; GRHFWB.
- Library declarations opened at the pins: 38 by `#check`, all found (17 of this roadmap, 21 of Mathlib and Tau Ceti). `TauCeti.LFunctions.dirichletData`, whose module the probe did not import, was read in its source (`NumberTheory/LFunctions/Dirichlet/Basic.lean:38`, completion `N^(s/2) · χ.completedLFunction s`).
- Elaboration: `lake env lean` gives 13 `sorry` warnings and nothing else. `#check @` on all 17 declarations: no section binder lost, and each type matches its README statement. The four statements moved from GeneralizedRiemannHypothesisFromWindowBounds are identical to main's.
- One-tactic probe (`simp`, `norm_num`, `positivity`, `rfl`, `infer_instance`, `simp_all`, `decide`) on the zero count and on the three positivity theorems: none closes. There is no padding.
- Automatic checks all passed. Dependency check: `depcheck: 132 roadmaps, 1474 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Ownership: `roadmaps grep` over 450 open heads and main finds the nine new headline names only here. WeilPositivityAndLiCriterion §5.2's own route for strictness compares zero counts taken with multiplicity, and the Check of 1.6 shows why that comparison fails; 1.6's route avoids it.

Overlap check: read GeneralizedRiemannHypothesisFromWindowBounds (main and head), ExplicitPrimeCounting, ExplicitZetaBounds, ExplicitNumberFields (head), ZerosOfLFunctions (head), LiCoefficientsArithmeticFormula (#2858 head), AnalyticNumberTheoryPartI (head), ErdosProgressionPowers and WeilPositivityAndLiCriterion. Each shared object has one owner:
- the conditional theorems are owned by the roadmaps named in the headings;
- the main theorems are owned by GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3;
- the discharges and the six records stated here are this roadmap's own, since at this head GeneralizedRiemannHypothesisFromWindowBounds has no Layer 6 and no §§5.4–5.6;
- `zetaZeroMult`, `liCoeff`, `liGramMatrix` and `weilForm` are owned by WeilPositivityAndLiCriterion and copied here under this roadmap's namespace;
- Schoenfeld's estimate from `13.5` under the Riemann hypothesis is asked of ExplicitPrimeCounting §4.7 by ExplicitNumberFields' gap; 4.6 states a different statement, without the hypothesis and with a finite record.

Source independence: 7 passages compared with 5 sources (0.7 against Lu–Zaman–Zhao twice, 4.6 against GGLM twice, 2.9 against Cully-Hugill–Johnston, 1.4 (c) and 2.7 against Leong, 0.9 against Johnston–Yang); none shared beyond forced formulas, thresholds and twelve-word statements. Largest share of reference locators: johnston-yang-2023, 5 of about 66 (Schoenfeld 1976 next, with 4). Contents compared with johnston-yang-2023 (introduction, lemmas, three proof sections, further improvements): independent. Layers 0–4 follow the subjects of the discharged theorems, and ExplicitPrimeCounting, the most cited roadmap, has Layers 0–7 in another order.

Research link: The targets are the unconditional forms of published conditional theorems. Among them are von Koch (1901), Littlewood (1928), Weil (1952), Schoenfeld (1976), Bach–Sorenson (1996), Li (1997), Dudek (2015), Carneiro–Milinovich–Soundararajan (2019), Grenié–Molteni (2019) and Garcia–Grenié–Lee–Molteni (2026). The Riemann hypothesis itself comes from GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3. This rests on the README and on the five sources read.

## Not verifiable

- Davenport (2000), Heilbronn (1967), Titchmarsh (1986), Iwaniec–Kowalski (2004) and Ingham (1932) are books and were not fetched; their locators match the supplier sections that cite them.
- Littlewood (1928) and Schoenfeld (1976) were not fetched; each was checked as RiemannHypothesisStatementsAndConsequences §9.7 and ExplicitPrimeCounting §§2.2, 7.1 state it.
- Hoffstein (1980/81), Lemma 1, was checked only as Lu–Zaman–Zhao quote it (lines 369–371).
- The journal data of Leong (J. Number Theory 285) and of Cully-Hugill–Johnston (Int. J. Number Theory 19) are absent from the arXiv v5 texts read.
- *ZetaZeroReciprocalLowRange* was not recomputed this round; it rests on the zeros computed in the previous round.

## Source issues

- none

## For the human reviewers

- Scope: every target rests on GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3. Their source is a formal Lean proof announced on 20 November 2026 (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, line 16), not a refereed publication. The conditional theorems discharged here are published, except the preprints that the Origin labels mark.
- Licence: the family index says the proof "was published without a license" (same file, line 20). This roadmap cites it only through GeneralizedRiemannHypothesisFromWindowBounds.
- Record: 35 of this roadmap's 36 sections are §§5.4–5.6 and Layer 6 of GeneralizedRiemannHypothesisFromWindowBounds on main. The pull request deletes them there and gives them new numbers here, citing the family owner's decision. Whether a roadmap on main may lose them is a question for that folder's review.
