# Review of ConsequencesOfTheRiemannHypothesisForDirichletLFunctions (pull request #3027 at 4b01d78)

**Verdict:** accepted

**Summary.** Accepted: the folder is unchanged since the head the previous review accepted, and a fresh pass finds the thirteen Lean statements true and equal to their README statements, the fifteen sampled discharges equal to the sections they cite as those roadmaps stand now, and every recomputed value in agreement. There are no findings, no small corrections and one format note, carried over from the previous review. Two facts are left for the human reviewers (the unrefereed formal proof behind every target, and its licence); their decision on the move of these sections out of GeneralizedRiemannHypothesisFromWindowBounds was applied.

## N01 — Code font for three predicates that no Lean file declares

RiemannHypothesisStatementsAndConsequences has a record form and a ray-class form of its predicate besides the Dirichlet one. This README writes them in code font: `d.GeneralizedRiemannHypothesis` and `riemannZetaData.GeneralizedRiemannHypothesis` (Conventions, line 115; 0.1, lines 249 and 252; 0.5, lines 400–401; the contracts, line 2034) and `φ̃.character.GeneralizedRiemannHypothesis` (0.3, lines 310 and 331). That roadmap's `Suggested.lean` declares only `DirichletCharacter.GeneralizedRiemannHypothesis` (its line 87), and the supplier contracts here already put the other two in italics (lines 2033 and 2037). Italics in the six places above would match the README's own convention for proposed names.

## Previous findings

- none: the previous review (at 3b77a6a) raised no finding. Its format note N01 is not taken up, the folder being unchanged, and is repeated above.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 0.1 `re_eq_half_of_meromorphicOrderAt_completedLFunction_pos` | `N = 1`; comparison with main | `completedLFunction_modOne_eq` gives `completedRiemannZeta`, poles excluded by `0 <`; statement identical to the former 5.4 on main | holds |
| 0.2 (ANT-I §2.42) and Lean | `K = ℚ(i)`, `ℚ(√5)` | §2.42 (line 2057): ERH(`K`) ⇔ RH ∧ `DirichletGRH χ`, nontrivial `χ`; `ζ_K = ζ·L(χ₋₄)`; statement identical to main's 5.5 | holds |
| 0.3 (QRH §§5.4, 5.4a) and Lean | `K = L = ℚ`; modulus | §5.4a (a), (b) at lines 906–911; modulus `q𝒪_K` times real places (line 852); `S = primes ∣ q d_K` (line 879); identical to main's 5.6 | holds |
| 0.7 (EZB §§0.4b, 9.3) | `q = 3`; `q > 10⁶` | `1 − 1/(5 log 3) = 0.81795 > 1/2`; `1.507/11.657 = 0.129279 > 1/8`; record at EZB line 366, Hoffstein at 3485–3487 | holds |
| 0.8 (ANT-I §0.16; Erdős §0.9) | four characters mod 8 | zero clause is the strip form at `|Im s| ≤ 10000` (ANT-I line 449); Erdős headlines carry `hM` (Suggested.lean 185, 202, 225) | holds |
| 0.9 (EPC §2.1) | `T = 2π`, `4πe`, `200`, `10⁹` | `N(2π) ≤ 0.3896 < 1`; lower error `−0.17530 ≥ −0.1754`; `0.0162353 < m₇`; Rosser `5.7699 ≤ 5.8025` at `10⁹`; `0.221530 ≤ 0.228129` | holds |
| 1.1 `norm_riemannZeta_le_rpow`, `LFunction_one_bounds` | `q = 3`; large `σ` | `log log 3 = 0.0940 > 0`; `L(1, χ₋₃) = 0.6046` needs `C ≥ 17.59`, finite; RHSC conditional form at its Suggested.lean 193 | holds |
| 1.3 (EZB §2.9) `abs_sum_zetaZeroMult_sub_le` | `T = 16` | left side `0.29126`; `log 16/log log 16 = 2.7188`; `1/(40T) = 0.0016`; §2.9 bracket at EZB line 858 | holds |
| 1.4 (d) and its Check | `R = 0.7`, `t₀ = −20`; `R log(21/17)` | `0.7 log 20 = 2.0970`; boundary `0.4606 < 1/2`; `e^{2/0.7} = 17.41`; `R > 9.4648`; `0.74046`, `0.89246` | holds |
| 1.5 (EZB §7.9) | conductor `3` | `(log 3)/2 = 0.5493 > 1/5 > 1/6.50 > 1/9.6459`; definition at EZB line 3040 restricts to `β ∈ (0, 1)` | holds |
| 1.6 (WPLC §§3.2, 4.2, 5.2) `liCoeff_pos`, `liGramMatrix_posDef`, `re_weilForm_pos` | `n = 0`; `N = 0`; multiplicities | four bodies equal WPLC's (lines 38, 67, 130, 149); `liCoeff 0 = 0` by `simp`; diagonal `2λ_{i+1}`; distinct zeros `≫ T log log T` against `O(T)` | holds |
| 2.1 (RHSC §9.9) `primeCounting_sub_logIntegral_isBigO` | `σ = 1/2`, `K = ℚ` | §9.9 (i) gives `Li x + O(x^σ log x)` (line 1320); conditional twin at RHSC Suggested.lean 221 | holds |
| 2.3 (EPC §§2.3, 2.6) | `x = 3`; pieces of width `1/16` | `3 − log 6 = 1.2082 < 2.0905`; `2.2082 > 2.0905` on `[3, 4)`; ratios `0.6082`, `0.6300`; four thresholds `59, 599, 97, 2657` at EPC 1493–1497 | holds |
| 2.6 (EPC §4.7) | hypothesis list; `x = 24.4` | same eight hypotheses as EPC lines 3219–3222; thresholds `43.1`, `24.4`; bound `0.07720` at `24.4` against left side `0.07600` | matches |
| 2.7 (EMF §§0.7, 1.9, 8.1) | threshold | `5.56 log² H₀ = 4589.197`; `33.56`, `1719 log t`, *ZetaReciprocalSegmentVerified* `(3/4) 14 16` at EMF 1363–1389 | matches |
| 2.9 route | each row's left end | `1.0908·10¹¹ ≤ 2.410·10¹⁴`; RS `0.04284`, `0.10366`, `0.77207`, `8039`; KL `2.72682·10⁻⁸ < 2.77140·10⁻⁸`; CHL `0.73684`, Dudek alone `1.0661` | holds |
| 3.1 `psiAP_isBigO` | `q = 1` | statement identical to main's former 6.5; `residueClass` on `ZMod 1` is `Λ` | holds |
| 3.2 Checks | `q = 8`, `x₀ = 10¹⁰` | `X = 1.54503`, `ε = 0.112191`, `159.6` times `0.00070275`; `0.85043`, `0.85996`; `9.54·10⁻⁴`; `9.947 > 1.2304` | holds |
| 3.3 (EPC §6.5) | `q = 1, 2, 3, 4, 6`; `T = 15` | `56.25`, `207.20`; `3/56.25 = 0.0533`; `5/7.687 = 0.650`; `M(15) = 0.5651`, Rosser `2.4003`; `ℓ = 0.99534` | holds |
| 3.4 (QRH §§11.2, 11.3; Sieve §2.9) `exists_ne_zero_ne_one_le_log_sq` | `q = 2, 3`; imprimitive mod 12 | `q = 2` vacuous; `χ₋₃(2) = −1`; §11.2 at `θ = 1/2` gives exponent `2`, bound in the presentation modulus (QRH 2177–2189) | holds |
| 3.5 (ENF §6.4) | hypothesis list | `GRHMod p` plus the four named records; `p ≥ 10⁹`, `p > 2791`, `p > 409` (ENF lines 2567–2579) | matches |
| 4.1 `mul_sqrt_div_log_log_le_classNumber` | `|D| = 7` | `log log 7 = 0.6657 > 0`; Tau Ceti formula `h = √|D| L(1, χ_D)/π` for `D ≠ −3, −4`; `c = 1/(πC)` | holds |
| 4.2 Check | nine discriminants | lower bounds `0.4565, 0.6440, 0.2176, 1.1107, 0.3625, 1.0669, 0.9534, 0.4894, 0.4221`; `2/√15 = 0.5164 ≤ π/6 = 0.5236`; `1.888 < 2` | holds |
| 4.4 (CAC §5.16a) | clauses (i), (ii) | (i) `DedekindERH K`, `x ≥ 100`; (ii) adds `RiemannHypothesis`, `T ≥ 100`, same `ε_K(T)` (CAC 10832–10838) | matches |
| 4.6 (ENF §§3.5, 3.6) | `x = 13.5, 17, 19, 23, 24.4⁻` | `0.125980 < 0.127871`, `0.099937 < 0.120624`, `0.114062 < 0.117145`, `0.094672 < 0.111227`; `0.076002`; `0.078041` | holds |
| N01 (lines 115, 249, 252, 310, 331, 400, 2034) | RHSC Suggested.lean | declares only `DirichletCharacter.GeneralizedRiemannHypothesis` (line 87); README italicises the others at 2033, 2037 | format |

- Source locators checked against the text: 8 in 6 sources. Lu–Zaman–Zhao (arXiv 2602.03626), Theorem 1.1 at its line 39 and Corollary 1.3 at line 96; Garcia–Grenié–Lee–Molteni (arXiv 2506.17416), Theorem 2.1 at line 140 with its route at 144–146; Bach–Sorenson (1996), Theorem 5.1 at lines 802–811 (with `E ≠ ℚ`) and Theorem 5.3 at 921–922; Grenié–Molteni (arXiv 1312.4463v4), Corollary 1.2 at line 125 (`x ≥ 100`); Carneiro–Milinovich–Soundararajan (arXiv 1708.04122v2), Theorem 5 at line 261 (`x ≥ 4`); Johnston–Yang (arXiv 2204.01980), Lemma 2.5 at line 189 (`T ≥ 4πe`).
- Cross-roadmap sections read where they are cited: 31. At this head: AnalyticNumberTheoryPartI §§0.16, 2.42; QuasiRiemannHypothesis §§5.4, 5.4a, 11.2, 11.3; ExplicitNumberFields §§0.5, 3.5, 3.6, 6.4; RiemannHypothesisStatementsAndConsequences §9.9 and its headings §§8.4a–11.1; GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3. Identical at head and on main: ExplicitZetaBounds §§0.4b, 2.9, 7.9, 9.3; ExplicitPrimeCounting §§2.3, 2.6, 4.7, 6.5; ExplicitMultiplicativeFunctions §§0.7, 1.9; ClassicalArithmeticCompletion §5.16a; ErdosProgressionPowers §0.9; WeilPositivityAndLiCriterion §§3.2, 4.2, 5.2; SieveMethodsAndPrimePatterns §2.9. The open revision of ExplicitPrimeCounting keeps every section number cited here.
- Library declarations opened at the pins: 24. By `#check` in a probe: `AnalyticOnNhd.sum_divisor_le`, `polynomialFunctions_closure_eq_top`, `ArithmeticFunction.vonMangoldt.residueClass`, `rayClassArtinMap_idealClass`, `isAdmissibleModulus_iff_abelianConductor_dvd`, `PrimitiveRayClassCharacter.of_induced`. Read in source: `TauCeti.NumberField.classNumber_eq_LFunction_one_of_discr_ne` (`NumberTheory/NumberField/Quadratic/DedekindZeta.lean:288`), `isPrimitive_fundamentalDiscriminantCharCast` (`Multiquadratic/FundamentalDiscriminant/Realization.lean:59`), `mertensConstant` (`LFunctions/Mertens.lean:545`), `kroneckerWeber` (`ClassFields/KroneckerWeber.lean:178`), `Modulus.eq_one_of_dvd_one` (`RayClass/Modulus.lean:281`), `RayClassCharacter.induced` (`RayClass/Character/Basic.lean:91`), `oneEquivClassGroup` (`RayClass/Basic.lean:319`), and the Hilbert class field declarations of `ClassFields/RayClassField.lean` (lines 123–269).
- Elaboration: `lake env lean` on `Suggested.lean` gives 13 `sorry` warnings and nothing else. The elaborated types of the 17 declarations were compared with the README statements: none lost a binder, none differs. The four statements that came from GeneralizedRiemannHypothesisFromWindowBounds are textually identical to main's.
- One-tactic probe (`simp`, `rfl`, `norm_num`, `positivity`, `infer_instance`, `simp_all`, `decide`) on all 13 theorems: none closes. No padding.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1474 edges, 0 problem(s)`, no UPWARD or CYCLE line. Nothing outside the roadmap folders named for this pull request is changed.
- Ownership: a search of the open heads and of main finds the nine new headline names only in this folder; the conditional twins (`…_of_riemannHypothesis`, `…_of_generalizedRiemannHypothesis`) stay with RiemannHypothesisStatementsAndConsequences and WeilPositivityAndLiCriterion, under other namespaces.
- The pull request's text, part 3: the 35 old → new numbers match the headings on main and at the head; "§0.9 is new", "four statements unchanged", "nine headline theorems" and "four definitions with the same bodies" all hold at this head.

Overlap check: read GeneralizedRiemannHypothesisFromWindowBounds (main and head), ExplicitPrimeCounting (main and its open revision), ExplicitZetaBounds, ExplicitNumberFields (head), LiCoefficientsArithmeticFormula (open), WeilPositivityAndLiCriterion; each shared object has one owner: the conditional theorems belong to the roadmaps named in the headings, the main theorems to GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3, the discharges and the six records stated here to this roadmap, and `zetaZeroMult`, `liCoeff`, `liGramMatrix`, `weilForm` to WeilPositivityAndLiCriterion (repeated here under this roadmap's namespace). LiCoefficientsArithmeticFormula neither assumes nor proves the Riemann hypothesis and shares no statement.

Source independence: 8 passages compared with 6 sources (0.7 against Lu–Zaman–Zhao twice, 4.6 against Garcia–Grenié–Lee–Molteni, 3.3 against Bach–Sorenson twice, 4.4 against Grenié–Molteni, 2.8 against Carneiro–Milinovich–Soundararajan, 0.9 against Johnston–Yang), none shared beyond formulas and thresholds; largest share johnston-yang-2023, 5 of about 66 reference locators; contents compared with johnston-yang-2023 (introduction, lemmas, three proof sections, further improvements): independent, Layers 0–4 being arranged by the subject of the discharged theorem.

Research link: The targets are the unconditional forms of published conditional theorems, among them von Koch (1901), Littlewood (1928), Weil (1952), Schoenfeld (1976), Bach–Sorenson (1996), Li (1997), Dudek (2015), Carneiro–Milinovich–Soundararajan (2019), Grenié–Molteni (2019) and Garcia–Grenié–Lee–Molteni (2026); the hypothesis comes from GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3. Rests on the README and the six sources read.

## Not verifiable

- *ZetaZeroReciprocalLowRange* (Conventions, 0.9): recomputed at `T = 4πe` and at the first eight ordinates only (margin `0.00104` at the eighth); the other 71 ordinates up to `200` were not recomputed this round.
- The numerical tests of 2.4, 2.9 and 3.3 (jumps up to `10⁷`, the sieve behind *RamareSaouterGapRange*, least primes for `q ≤ 1000`) were not rerun.
- Davenport (2000), Heilbronn (1967), Titchmarsh (1986), Iwaniec–Kowalski (2004) and Ingham (1932) are books and were not opened; their locators agree with the supplier sections that cite them.
- Littlewood (1928) and Schoenfeld (1976) were not opened; each was checked as RiemannHypothesisStatementsAndConsequences §9.7 and ExplicitPrimeCounting §§2.2, 2.3 state it.
- Hoffstein (1980/81), Lemma 1, was checked only as ExplicitZetaBounds §9.3 quotes it from Lu–Zaman–Zhao.

## Source issues

- none

## For the human reviewers

- Decision applied (move of 2026-11-24): GeneralizedRiemannHypothesisFromWindowBounds at this head ends at §5.3; its former §§5.4–5.6 and 6.1–6.32 are the 35 sections 0.1–0.8, 1.1–4.7 here, with the four Lean declarations unchanged, as the description lists. Nothing beyond the decision.
- Decision on family sections stated in general roadmaps: nothing in this folder falls under it.
- Scope: every target rests on GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3, whose source is a formal Lean proof announced on 20 November 2026 (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`), not a refereed publication. The conditional theorems discharged here are published, except the preprints the Origin labels mark.
- Licence: the family index says the formal proof was published without a licence; this roadmap cites it only through GeneralizedRiemannHypothesisFromWindowBounds and takes no declaration from it.
