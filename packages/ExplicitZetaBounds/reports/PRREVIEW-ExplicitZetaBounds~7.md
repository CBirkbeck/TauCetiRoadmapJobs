# Review of ExplicitZetaBounds (pull request #1954 at c6ba511)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/ExplicitZetaBounds/README.md` and `TauCetiRoadmap/ExplicitZetaBounds/Suggested.lean` at `c6ba5119`. The gate passes and the file elaborates. The main problem is the roadmap's own record discipline (Conventions, "Records"): several headline theorems rest, through their sources' proofs, on computations that are not hypotheses (R01–R05). There are also one ownership loop with an open pull request (R06), one co-owned object (R07), unowned route inputs (R08) and a missing hypothesis in 6.2 (R09).

## R01 (P2) — Phragmén–Lindelöf steps in 4.9, 5.2 and 7.4 use edge bounds that rest on unrecorded computations

**Location.**
- README lines 1545–1550 (4.9): "For integers `k ≥ 4` and `t ≥ 3`, prove `|ζ(σ_k + it)| ≤ 1.546 t^{1/(2^k−2)} log t` … *Needs:* 4.5a, 4.4; 0.5a." No record is named.
- README lines 1711–1734 (5.2) and 2206–2231 (7.4).
- `Suggested.lean` lines 368–385 (`abs_zetaZeroCount_sub_le`, `abs_zetaZeroCount_sub_le_of_recorded`), 419–422 (`riemannZeta_ne_zero_littlewood`), 465–469, 503–505 and 585–589.

**Claim.** The records of 0.4b that the sources use do not appear as hypotheses. The README's Conventions require them, "also when the use passes through another theorem here".

**Witness.**
- Yang proves 4.9 for `3 ≤ t ≤ T_k` by Phragmén–Lindelöf between `σ = 1/2` and `σ = 1`. The edges are HPY's `0.618` bound from `t = 3`, the bound `log t` from `t = 3`, and numerical checks (3.7)–(3.8) on `|t| ≤ 3` (`yang2024` lines 729–763). `T_4 = e^{29.8}` (line 724).
- Yang's Lemma 4.3 in the 7.4 proof repeats this (lines 1549–1553). Bellotti–Wong interpolate Hiary's `1.461` on `|t| ≤ 3`, HPY, Patel and Yang over all `t` (`bellottiwong2025` lines 222–248, 436–450).

**Repair.**
- Add a 0.4b record `YangRecord` for the numerical checks at `yang2024` lines 756–763 and 1550–1553.
- State 4.9 given `HiaryPatelYangRecord`, `PatelRecord` and `YangRecord`, or give it a route for `t ≤ T_k` that avoids them.
- State 5.2 (both items) given `HiaryRecord`, `HiaryPatelYangRecord`, `PatelRecord` and `YangRecord`.
- State 7.4, and every theorem that goes through it (7.6 as routed, the first item of 7.10, and 8.5), given `HiaryPatelYangRecord`, `PatelRecord` and `YangRecord`.
- Add these hypotheses to the six Lean declarations above. The docstring of `abs_zetaZeroCount_sub_le` ("no input about the location of the zeros") stays true, but it must not suggest that no computation is used.
- Tested: at `t = 0` the edge check (3.7) needs `|(s − 1)ζ(1/2)| = 0.7302 < 0.618·1.81^{7/6} log 1.81 = 0.732`. `HiaryRecord`'s `1.461·|s − 1|` gives `4.44` at `t = 3`, against `3.35`, so (3.7) is a computation of its own.

## R02 (P2) — 8.4 omits Platt's records, the record for `Σ γ⁻²` and Bordignon's data that Thorner–Zaman use

**Location.**
- README lines 2610–2615: "Given `RH(3·10¹²)`, for `σ ≥ 39/40` prove `N(σ, Q) ≤ 10^{88} …` … The proof uses the verification for the zeros of `ζ`, through their Lemma 2.1".
- `Suggested.lean` lines 572–578: `primitiveLZeroCount_le_thornerZaman (hRH : RiemannHypothesisUpTo (3 * 10 ^ 12))`.

**Claim.** The theorem needs more than `RH(3·10¹²)`. The README's own Needs line cites 7.5, which carries `PlattRecord`.

**Witness.**
- `thornerzaman2024` Lemma 2.1 uses the `5.573412` region (line 157), which needs `BrentPlattTrudgianRecord` (README 7.3). Lemma 2.2 is Platt's computation (lines 159–163).
- The case `Q ≤ 10⁴` "follows immediately from Lemma 2.2" (line 1275).
- `N*` uses `1 − β₁ ≥ 100/(√Q log²Q)` from Bordignon (line 1477).

**Repair.**
- Add `PlattRecord`, `PlattCentralRecord`, `BrentPlattTrudgianRecord` and the Bordignon data of R04 to 8.4, to its Needs line (0.3, 0.4b, 7.3, 7.7) and to `primitiveLZeroCount_le_thornerZaman`.
- Tested at `Q = 3·10³`: without `PlattRecord` nothing excludes a zero of `L(s, χ)`, `q ≤ Q`, with `β > 39/40`, `|γ| ≤ Q`. The source closes that case only by Lemma 2.2.

## R03 (P2) — 5.3 rests on Bennett–Martin–O'Bryant–Rechnitzer's zero computation, which is not a record

**Location.**
- README lines 1762–1770: "if `ℓ ≤ 1.567` then `N(T, χ) = 0` … and their Lemma 6.1 for `q < 935`".
- `Suggested.lean` lines 392–399: `dirichletZeroCount_explicit`, which has no hypothesis.

**Claim.** Lemma 6.1 is a computation. By the Conventions it must be a record and a hypothesis.

**Witness.**
- `bmor2021` lines 93–95: "we computed all 806,544 zeros … with ℓ ≤ 6 and 1 < q < 935".
- Lemma 6.1 (lines 1030–1047): partial GRH to height `2(e^{6π} − q)/q`, together with clauses (b)–(c). Clause (b), "`ℓ ≤ 1.567` ⇒ `N = 0`", is a pure computation (`q ≤ 15`).

**Repair.**
- Add a 0.4b record for Lemma 6.1(a)–(c) and make it a hypothesis of 5.3 and of `dirichletZeroCount_explicit`.
- `PlattRecord` does not cover it: Lemma 6.1 needs height `3.07·10⁸/q`, while `PlattRecord` reaches `max(10⁸/q, …)`.

## R04 (P2) — `BordignonRecord` cannot give Bordignon's `800` and `515` bounds

**Location.**
- README lines 587–588: "`BordignonRecord`: `L(1, χ) ≥ 12.52/√q` for every real primitive `χ` of conductor `q > 4·10⁵` (… as `bordignon2019` uses them)".
- README lines 2378–2390, and `Suggested.lean` lines 477–482.

**Claim.** The record's constant is `bordignon2020` Theorem 1.2 (even characters). It is not the data that `bordignon2019` uses, and Bordignon's argument with it gives much less than `800` and `515`.

**Witness.**
- `bordignon2019` uses `L(1, χ) ≥ 46π/√q` for odd `χ` (lines 160–168) and `79.2177/√q` for even `χ`, `q ≤ 10⁷` (lines 179–185), against `|L′| ≤ 0.18, 0.1536 log²q` (lines 54–57).
- `46π/0.18 = 802.9`, but `12.52/0.18 = 69.6`. `79.2177/0.1536 = 515.7`, but `12.52/0.1536 = 81.5`.

**Repair.**
- Replace the record by the three bounds `bordignon2019` uses: `46π/√q` (odd, Watkins), `79.2177/√q` (even, `4·10⁵ < q ≤ 10⁷`), and `12/√q` or `12.52/√q` (even, `q > 10⁷`; `bordignon2020` lines 60–62).
- Correct the locator. Alternatively, keep only the `80` and `100` clauses that `12.52` supports.

## R05 (P2) — `HiaryPatelYangRecord` records an analytic range, and 8.3 omits `HiaryRecord`

**Location.**
- README lines 562–563: "`HiaryPatelYangRecord`: `|ζ(1/2 + it)| ≤ 0.618 t^{1/6} log t` for `3 ≤ t < 5.5·10⁷` (`hiarypatelyang2024` §3, lines 147–200)".
- `Suggested.lean` lines 536–545: the docstring says the bound is used "from height 1002 on".

**Claim.**
- Only `3 ≤ t ≤ 200` is a computation. On `[200, 5.5·10⁷)` the record is part of the conclusion of the headline `norm_riemannZeta_criticalLine_le`, which this roadmap proves from 4.6.
- Separately, 8.3 uses Hiary's bound on `|t| ≤ 3`.

**Witness.**
- `hiarypatelyang2024` lines 151–159: for `200 ≤ t ≤ 10⁷` "our main theorem follows from Lemma 2.2", which is 4.6 here. `hiary2016zeta` Lemma 2.2 (lines 166–184) computes `[3, 200]`.
- `kadirilumleyng2018` (3.3) bounds the maximum over `|t| ≤ T` using `1.461` on `[0, 3]` (lines 260–272), and the bound is applied to `∫₀^T` (line 526).

**Repair.**
- Restrict the record to `3 ≤ t < 200` and prove `[200, 5.5·10⁷)` from 4.6 as HPY §3.2 does.
- Add `HiaryRecord` to 8.3 and to `zetaZeroDensityCount_nine_tenths_lt`, and correct its docstring.

## R06 (P2) — The modulus form of Ramaré–Rumely's region is handed back and forth with ExplicitPrimeCounting

**Location.** README lines 155–157: "The passage from it to a modulus `q`, with `q|γ|` in place of `k|γ|` … is `ExplicitPrimeCounting`'s (its §6.1, *RamareRumelyRegion*)".

**Claim.** At its head, ExplicitPrimeCounting (#1945) does not own this passage: it cites it from this roadmap. Nobody owns it.

**Witness.**
- #1945, `TauCetiRoadmap/ExplicitPrimeCounting/README.md` §6.1 says the region is "ExplicitZetaBounds §7.5's form for a modulus … (the end of its fifth item, in `gap:dirichlet-zero-free-constants`)".
- That gap asks for "its form for a modulus … `0 < C ≤ C₁(k, H)` … Required location: its §7.5".

**Repair.**
- Settle one owner. Since this roadmap is earlier in the order and #1945 now cites it, restore at the end of 7.5's fifth item the statement #1945's gap quotes. For `q ≥ 1`, `H ≥ 1000` and `0 < C ≤ C₁(k_χ, H)` for every `χ` modulo `q`: `1 − β ≥ 1/(R log(q|γ|/C))`. It follows from the fifth item because `q|γ|/C ≥ k|γ|/C₁(k, H)`.
- Delete lines 155–157, and keep the earlier Check's constant within `C₁(k, H)`.
- If #1945 is changed to prove the passage instead, keep lines 155–157 and cite its new numbering.

## R07 (P2) — The Euler–Maclaurin formula is owned both here (0.5a) and by AsymptoticExpansions §13.1

**Location.**
- README lines 46–47 ("the Euler–Maclaurin formula for functions with values in a real Banach space (Layer 0)") and 630–641.
- `Suggested.lean` lines 244–259: `sum_Icc_eq_eulerMaclaurin`.

**Claim.** The same theorem, DLMF 2.10.1 with the same name, is a target of another author's open new-roadmap pull request. This roadmap previously cited that pull request for it.

**Witness.** #1857, `TauCetiRoadmap/AsymptoticExpansions/README.md` §13.1 and `Suggested.lean` line 631: `theorem sum_Icc_eq_eulerMaclaurin {f : ℝ → ℝ} {a n : ℤ} {m : ℕ} (hm : 0 < m) (han : a < n)`, the same right side as here. The only difference is that it is real-valued.

**Repair.**
- Settle one owner and name #1857 in Scope and ownership.
- Either cite §13.1 for the real case and keep 0.5a only as the Banach-valued variant, with one clause saying how it differs (and name #1857 in the merge-order paragraph).
- Or keep 0.5a as the owner and have §13.1 cite it.

## R08 (P2) — Routes of 5.4, 8.3, 8.5 and 9.3 use inputs that no layer owns

**Location.**
- README lines 1803–1804, 2584–2588, 2650–2655 and 2734–2736.
- Line 172: "(a divisor-sum bound that no route here uses)".

**Claim.** Each route needs an explicit input that is neither a target here, nor a supplier section, nor a pinned declaration. The natural owner of the divisor sums, ExplicitMultiplicativeFunctions, comes later in the order.

**Witness.**
- Trudgian's `|S₁(T) − c₀| ≤ 2.067 + 0.059 log T` (`brentplatttrudgian2021` lines 170–172).
- Kadiri–Lumley–Ng's sums of `μ²`, `d` and `d²` (lines 276–392).
- Cully-Hugill–Trudgian's `Σ d²(n)` (`bellotti2025density` line 370).
- Hoffstein's lemma (`luzamanzhao2026` lines 369–371).

**Repair.**
- State the four inputs as targets here, each with its locator (Trudgian, *Improvements to Turing's method*, Theorem 2.2; Ramaré's lemmas as KLN quote them; Cully-Hugill–Trudgian Theorem 2; Hoffstein Lemma 1).
- Add them to the Needs lines and correct line 172.

## R09 (P2) — 6.2 drops the hypothesis `κ > 0`

**Location.** README lines 1886–1888: "for `x ≥ 1`, `T > 1`, `κ > κ_a` and `λ ≥ θ'/T` there is `T* ∈ [T, 2T]` with `Σ_{n≤x} a_n = (1/2πi)∫ … + O*(R)`".

**Claim.** The statement is false when `κ ≤ 0`, which `κ > κ_a` allows for Dirichlet polynomials.

**Witness.**
- `cullyhugilljohnston2025` lines 410–411 require "κ > 0 … larger than the abscissa".
- Take `F = 1`, `κ = −1`, `x = 2`. Then `Σ = 1`, while the integral on `Re s = −1` tends to `0` (there is no pole to its left), and `R ≤ (1.785/T²)(1/(4λ²) + 1/(4 log²2)) → 0`.

**Repair.** Write "`κ > max(κ_a, 0)`", as 6.1 and 6.1a already do.

## R10 (P3) — `hasLandauSiegelGap_one_fifth` is padding

**Location.** `Suggested.lean` lines 492–496.

**Claim.** It restates the record `LuZamanZhaoRecord` in the gap vocabulary.

**Witness.** In a scratch copy, the proof `intro …; have hlog : 0 < log q; by_contra; push Not; refine hrec q _ χ _ _ β ?_ hL; rw [sub_le_comm, le_div_iff₀]; nlinarith` (7 lines) elaborates.

**Repair.** Delete it from `Suggested.lean`; the README keeps the instance.

## R11 (P3) — The third Check of 4.2 gives the wrong reason for `|C(h)|`

**Location.** README lines 1241–1243: "with `2Y = 4` in place of `N + H − 1 = 3` that term would drop from `−6` to `−8`, which is why the normalized form uses `|C(h)|`".

**Claim.**
- The bracket equals `Σ_m |Σ_{j<H} b_{m−j}|² ≥ 0`. For `b = (1, −1)` it is `2`, so enlarging `N + H − 1` to `2Y` is always valid.
- `|C(h)|` is needed to replace `H − h` by `H`. Arias de Reyna's real-part form (ExplicitCharacterSumsAndSieves §0.3) shows the real part can be kept.

**Repair.** Replace the reason accordingly.

## R12 (P3) — The second Check of 6.3 states the wrong right side

**Location.** README lines 1922–1923: "the left side is `0` and the right side `8T`".

**Claim.** The majorant principle's right side is `3∫_{−T}^{T} |2|² = 24T`; `8T` omits the `3` that the first Check includes.

**Repair.** Write `24T`.

## R13 (P3) — The third Check of 9.2 asserts a necessity it does not show

**Location.** README lines 2720–2722: "The condition `χ(2) = 1` cannot be dropped … for `χ(2) ≠ 1` the Euler factor at `2` already gives a better constant".

**Claim.** The reason given implies that the bound holds a fortiori when `χ(2) ≠ 1`, so "cannot be dropped" is unsupported. No character is exhibited.

**Repair.** Either exhibit an even primitive `χ` with `χ(2) ≠ 1` and `|L(1, χ)| > (1/2) log q − 0.02012`, or say only that `χ(2) = 1` is the source's hypothesis and the hardest case.

## Verified sound

**Gate, dependencies and build.**
- Gate run at `c6ba511`: every check `0`, `OK`.
- `gate --depcheck`: `depcheck: 238 roadmaps, 2428 edges, 0 problem(s)` (no UPWARD or CYCLE line). The merge order puts this roadmap at 270, after LFunctions 28, ZerosOfLFunctions 85, AnalyticNumberTheoryPartI 90 and SieveMethodsAndPrimePatterns 269.
- `git diff --stat origin/main...HEAD` outside the folder: empty.
- `lake env lean` on `Suggested.lean`: 29 `declaration uses sorry` warnings and nothing else.
- I compared the 58 elaborated signatures in the job's `signatures.md` with the README statements. There is no `variable` block, so no binder can be dropped, and the README and Lean generality agree.

**Library declarations at the pins.**
- I `#check`ed all 80 Mathlib names the README cites; all resolve.
- `hardyZ` is `(completedRiemannZeta (1/2 + tI)).re / ‖Gammaℝ(1/2 + tI)‖` (`Mathlib/NumberTheory/LSeries/HardyZ.lean:76`), which is consistent with 4.5b.
- `Complex.digamma = logDeriv Gamma` (`Mathlib/Analysis/SpecialFunctions/Gamma/Digamma.lean:48`).
- `hasSum_hurwitzZeta_of_one_lt_re` (`HurwitzZeta.lean:73`) gives `ζ(s, u) = Σ_{n≥0}(n + u)^{−s}` for `u ∈ [0, 1]`, including `u = 1`.

**Cross-roadmap citations resolved.**
- LFunctions (main): Layer 0 fields `coeff`, `conductor`, `gammaR`, `gammaC`, `rootNumber`, `completed`, `polarOrder : ℂ →₀ ℕ` (`Suggested.lean` 117–132); `riemannZetaData`, `dedekindZetaData`, `dirichletData`.
- ZerosOfLFunctions (main): 1.1, 1.4, 1.6, 3.4, 4.3, 4.5, 5.5, 5.6, 6.3, 6.4 (its item (4d), cited there as "6.4d"), 6.5, 7.1–7.4, and Layer 9 *HasZerosInRects* and *AllOnCriticalLine*.
- AnalyticNumberTheoryPartI (#1126): §0.23a with `gammaRemainder.slit_logGamma` and the bound `j! sec^{j+2}/(8|z|^{j+1})`; §§0.34, 0.34a, 1.5, 1.5a (`3π/2`), 1.6 (`DirichletGRH`, Lean line 349), 1.7, 3.23.
- SieveMethodsAndPrimePatterns (#1495): §2.6, and §2.9 with `sharp_additive_largeSieve` and `sharp_primitive_largeSieve` (`Suggested.lean` 239, 264).
- Consumer sections: ExplicitCharacterSumsAndSieves §§0.3 and 1.1; ExplicitMultiplicativeFunctions §§1.9 and 7.4; ExplicitNumberFields 4.5, 4.6 and 4.8; ExplicitPrimeCounting §§1.1, 1.2, 1.7 and 6.1. Its gaps `rh-up-to-height`, `grh-up-to-height`, `real-zero-gap`, `vinogradov-korobov-constants`, `explicit-zero-count-error`, `explicit-zero-density` and `classical-zero-free-constants` are met by 0.2–0.4b, 5.2, 7.3, 7.6, 7.9, 8.1 and 8.3. The one exception is R06.

**Ownership.** `roadmaps grep` over the open heads for Preissmann, Kusmin–Landau, the weighted large sieve, Vinogradov's mean value theorem, Gallagher, the Riemann–Siegel formula, the majorant principle, Backlund and Hardy's function finds no second owner. Euler–Maclaurin is the exception (R07).

**Seeded sample (source text read at the locator).**
- **0.4b.** HPY Theorem 1.1 (lines 64–65); Hiary Lemma 2.2 (166–167); Patel Theorem 1.1 (61–66); HLY (1171–1175; computed `2.079 log t` on `[2, 500]` implies the record); BPT Corollary 1 (412–417); LZZ Theorem 1.1 (39–42) and Corollary 1.3, with `q ≤ 10⁶` computed (96–99, 368–371); MST (44–49, 442–446); PSE (35–37) and Saad Eddin (791–794); Platt Theorems 7.1 and 7.2 (955–963, 976–978).
- **1.1.** `brent2019` (5)–(8), lines 121–145.
- **1.2.** Alzer Theorem 8 (520–528); 1.3 is Theorem 9 (649–662).
- **1.6.** Mortici (67–75). A numerical sweep over real `0.001 ≤ x ≤ 220` finds no violation of the real-variable form.
- **2.6.** Nemes' convention (37–38, 53–59); (1.4) translated (86–100); Theorem 1.2 (105–108); the real bound (125–135); Theorem 1.3 and its proof factor `(2√N + 1)/2` (169–171, 543–554).
- **2.7.** Derived from AnalyticNumberTheoryPartI §0.23a at `j = 1`; `sec³(π/4)/8 = 1/(2√2)`.
- **3.1.** Fiori Theorem 1 and Remark 2 (47–70), Remark 4 (91–93).
- **4.9.** Yang Theorem 1.1 (53–55); see R01.
- **5.2.** Bellotti–Wong Theorem 1.1 (31–38), Table 1 (51–59), (1.2) (121–124); see R01.
- **5.4.** BPT Lemma 1 (38–43), Theorem 1 and Lemma 3 (54–71, 186–197), the `168π` split (170–174); see R08.
- **6.2.** CHJ Corollary 3.2 (409–422), `θ′` (393); see R09.
- **6.4.** `ramare2016density` Lemma 6.5 with `c₀ = √(1 + (2/3)√(6/5))` (828–843).
- **9.1.** `ramaretmeemt` lines 88–100.

**Other headline sources read.** MTY Theorems 1.1 and 1.3 (53–54, 96–97); Kadiri density (46–54, rows 655 and 660); KLN Theorem 1.1 (74–87); TZ Theorem 1.2 and Lemmas 2.1–2.3 (64–65, 156–170); Bellotti density (91–101); BMOR Theorem 1.1 and Lemma 5.6 (61–63, 569–577); Ford Theorems 3–5 (96–106, 135–136); Ramaré–Rumely 3.6.2–3.6.3 (795–848).

**Adversarial table** (values computed here; ✓ = statement and Check consistent):

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| 0.1 BigOStar | `π` vs `3`, `0.1416`, `0.1415` | `π − 3 = 0.14159`, so `0.1416` holds and `0.1415` fails | ✓ |
| 0.2 `RH(H)` | `ζ(−2)=0`; `q = 2` | `−2` lies outside the open strip; no character mod 2 is primitive | ✓ |
| 0.3 `plattHeight` | `q = 3`, `400000`, `399999` | `3.33·10⁷`, `387.5`, `293.75` | ✓ |
| 0.3 `LFunction_ne_zero_of_platt` | `q = 1`, `s = 1/2` | `ζ(1/2) = −1.4604 < 0`; for `q ≥ 2` a real zero must be `1/2` | ✓ |
| 0.4b HPY record | `[200, 10⁷]` | `4(t/2π)^{1/4} − 2.08 < 0.592 t^{1/6} log t` (HPY 155) is analytic | R05 |
| 0.4b Bordignon | odd and even inputs | `802.9`/`69.6`; `515.7`/`81.5` | R04 |
| 0.5 admissible | `(1,2)`, `(3,4,1)` | `P(π) = −1`; `P(π) = 0` | ✓ |
| 0.5a Euler–Maclaurin | `f = x²`, `m = 1, 2`; `f = x` | `n³/3 + n²/2 + n/6` both ways; `n²/2 + n/2` | ✓ |
| 1.1 | `r₁(1)`, `r₂(2)` | `0.081061 ∈ (0, 1/12)`; `−0.000326` vs `T₂(2) = −0.000347` | ✓ |
| 1.2 | `x = 1` | `0 > −0.081061`; `ψ(1) = −0.577216 ∈ (−0.583333, −0.5)` | ✓ |
| 1.3 | `k = 1, 2` at `x = 1` | `1.644934 ∈ (1.5, 1.6667)`; `2.404114 ∈ (2, 2.5)` | ✓ |
| 1.4 | `θ_x` | `θ₀.₅ = 0.32076`, `θ₁ = 0.33593`, `θ₂ = 0.51176`, `θ₁₀ = 0.87001`, `θ(0⁺) = 0.96755 = 30/π³` | ✓ |
| 1.5 | `N = 3`, `λ = 1/2`, `x = 2` | `ψ(2) = 0.422784 < F₃ = 0.423984` | ✓ |
| 1.6 | `x = 1`, `x = 20` | `−0.009968 ∈ (−0.075347, 0.059375)`; at `0.953` of a width of `4.21·10⁻⁸` | ✓ |
| 2.2 / 2.1 | `θ = π/3` | `K = 1.1547 < sec²(π/6) = 1.3333` | ✓ |
| 2.3 | `k = 1`; `z = −1 + i`, `u = 1` | `Γ(3/2)/Γ(1) = 0.886227 < 1`; `1 ≥ 3` fails | ✓ |
| 2.4 | `Re ξ(i)` | `−(1/2) log(1 − e^{−2π}) = 0.000935` | ✓ |
| 2.5 `norm_Gamma_bounds` | `s = 1 + 10i`; `1 + i`; `1/2 + 10i` | `1.19355·10⁻⁶ < 1.19456·10⁻⁶ < 1.2177·10⁻⁶`; `0.4440 < 0.5216 < 0.6972`; `3.77753·10⁻⁷` inside; at `t = 0` Lean's `x/0 = 0` makes the lower bound false, hence `ht` | ✓ |
| 2.6 | `γ₃`; `x = 1, 10`; `N = 2`, `z = 10` | `−139/51840`; `1.084438 < 1.086806`; `1.0083654 < 1.0083681 < e^{1/120} = 1.0083682`; `2.04·10⁻⁴ ≥ R₂ = 3.20·10⁻⁵` | ✓ |
| 2.7 | `z = 1` | `0.0772 ≤ 1/8` | ✓ |
| 2.8 | `σ = −1/2`, `t = 0`, `100` | `1/4 = 1/4`; exact `50.0006` vs `1` under the wrong exponent | ✓ |
| 2.9 bracket | `T = e`, `10` | `0.87749 ∈ (0.875, 0.88420)`; `0.87566 ∈ (0.875, 0.8775)` | ✓ |
| 3.2 / `norm_LFunction_le_rademacher` | `ζ`, `s = −1/2`, `η = 1/2`; `χ₋₃`, `s = −1/2` | `0.207886 = 0.207886`; `≈0.167 ≤ 0.6236`; matches `bmor2021` (5.3) | ✓ |
| 3.3 | `t = 50`, `55` | `6.581` vs `6.718`; `6.902` vs `6.880` | ✓ |
| 3.4 | `σ = 2` | `1.64493 ≤ 1.78107`; `0.56996 ≤ 0.875` | ✓ |
| 3.5 | `F = exp(e^{−iπ(z−1/2)})` | `0 + 0 < e^{πt}` at `c = π` | ✓ |
| 4.1 | `θ = 0.01` | `cot(0.005π) = 63.66 > 32.83` | ✓ |
| 4.2 | `b = (1, 1)`, `(1, −1)`, `H = 2` | `16 ≤ 18`, but `12 < 16` with `N`; bracket `= 2 ≥ 0` | R11 |
| 4.3 | Patel at `L = 10`, `V = 2`, `W = 3` | `32.907`, `41.362`; `A = 2.79368` | ✓ |
| 4.4 | lag constants | `72/91`, `72/55`, `9/5`; Patel prints `18/20` (line 196), proof `18/10` | ✓ |
| 4.5b `abs_hardyZ_sub_riemannSiegel_le` | `t = 200` | `n₁ = 5`, `R = 0.396`; `(2π)^{1/4} cos(π/8) = 1.46272 < 1.463` | ✓ |
| 4.7 `norm_riemannZeta_criticalLine_le` | `t = 3`; Lehman on `[3, 200]` | `0.8154`; minimum margin `1.5828` | ✓ (R05) |
| 4.7 hybrid | `q = 64`, `t = 200` | `8911` vs `31.66`; crossover `log(qt) = 123.37` | ✓ |
| 4.8 `norm_riemannZeta_one_add_le` | crossings; `t = 3` | `t = 47.47`; `log t = 140.3`, `t = 8.54·10⁶⁰`; `20.22` | ✓ |
| 4.9 | `k = 4`, `t = 3` | `σ = 5/7`, `1.837`; `T₄ = e^{29.8}` | R01 |
| 4.9a `vinogradovCount_le_ford` | `J₂,₁(2)`, `J₂,₂(3)`; `k = 1000` | `6`, `15`; `Δ = 11 343` and `1001.7`; `s_top = 3 213 463` | ✓ |
| 4.10 `norm_riemannZeta_le_richert` | `σ = 1`, `t = 10¹⁰` | `616.7`, `572.2`; `B/2^{1.5} = 1.573`, `1.569` | ✓ |
| 5.2 Lean pair | `T = e` | `2.5167 + 0.875 + 1/(40e) = 3.4009 < 8.184`, `3.886` | R01 |
| 5.3 `dirichletZeroCount_explicit` | `χ₄`, `T = 10`; `q = 3`, `T = 5/7` | `ℓ = 2.0333`, main term `2.9587`, error `2.1816`, actual `N = 2`; `ℓ = 0.259` | R03 |
| 6.1 | `F = 1`, `x = 1` | error `2 ≥ 1/2`; `θ′ = 0.29130`, `1.0927` | ✓ |
| 6.1a | `x = 3`, `j = 1, 2` | `2 = 2`, `2 = 2`; residues sum to `(1 − 1/y)^j/j!` | ✓ |
| 6.2 | `F = 1`, `κ = −1`, `x = 2` | `1` vs `→ 0` | R09 |
| 6.3 | `a = (1, −1)`, `A = (1, 1)` | right side `24T` | R12 |
| 6.4 | `c₀`; `a = (1, 1)` | `1.315407`, `πc₀ = 4.1325 < 4.7124`; `2.885 ≤ 20.66` | ✓ |
| 7.1 | `s = 2` | `Σ_ρ Re 1/(2 − ρ) = 1 + 0.211392 − 0.572365 − 0.569961 = 0.069066 > 0`; without the pole term it would be `−0.930934` | ✓ |
| 7.2 | `t = 5.45·10⁸`; `t = 10¹⁰` | `0.1181506 > 0.1181474`; `c₆ = 0.0021981 < 0.0025644`; widths `0.0061956`, `0.0061397` | ✓ |
| 7.3 `riemannZeta_ne_zero_classical` | `|t| = 2`, `3·10¹²`; `log(|γ|/17)` | `0.740461`; `0.993738`/`0.993755`/`0.992891`; `0.211309 > 0.207342`; switch at `801.46` | ✓ |
| 7.4 `riemannZeta_ne_zero_littlewood` | containment | simplified form `50.13–170.26`; exact `40.898–185.64`; `5.573412` up to `L = 45.137`; at `L = 23.026` need `0.0064156` vs `0.0061956` | ✓ (R01) |
| 7.5 Lean pair | `q = 3`; `|t| = 2`; Ramaré–Rumely at `k = 1` | `0.837457`; `0.94214`; `0.022085` | ✓ |
| 7.6 `riemannZeta_ne_zero_vinogradovKorobov` | `|t| = e^{1000}` | `9.125`, `9.505`, `9.723 ·10⁻⁵`; Khale `0.991109` | ✓ (R01) |
| 7.7 `LFunction_real_zero_le_bordignon` | `q = 4·10⁵` | `0.007602`, `0.000950`; crossover with 7.9 at `4.71·10⁶` | R04 |
| 7.9 `hasLandauSiegelGap_one_fifth` | padding probe | 7-line proof from the record | R10 |
| 7.10 `inv_norm_riemannZeta_one_add_le` | thresholds | `log log t = 14.011`, `14.690`; Lee–Leong `0.9937397` vs `0.9937382`; `e^{145.995}` | ✓ (R01) |
| 8.1 `zetaZeroCountRight_le_kadiri` | `T = H₀`; Table 1 rows | `1.70·10¹⁰`, `1.35·10¹⁰`; `(0.5561, 0.7586, −268 658)`, `(0.4421, 0.6443, −363 301)` | ✓ |
| 8.3 `zetaZeroDensityCount_nine_tenths_lt` | `T = H₀` | `1.916·10⁸`; (3.3) uses `[0, 3]` | R05 |
| 8.4 `primitiveLZeroCount_le_thornerZaman` | `Q = 3` | `log₁₀ = 99.71`; `β₁(3) = −1`, `min = 1` | R02 |
| 8.5 `zetaZeroDensityCount_le_bellotti` | `T = 10¹³`, `σ = 0.9927` | `2.22·10¹¹` vs `2.16·10¹³` | ✓ (R01, R08) |
| 9.1 `norm_LFunction_one_le_ramare` | `q = 3, 4, 5, 8` | `0.6046 ≤ 1.2575`; `0.7854 ≤ 1.0473`; `0.4304 ≤ 0.8047`; `0.6232 ≤ 0.8664`, `1.1107 ≤ 1.2206` | ✓ |
| 9.2 | `q = 12`, `17` | `0.7603 ≤ 1.1966`; `1.0161 ≤ 1.3965` | ✓ (R13) |
| 9.3 Lean pair | constants; `q = 3` | `0.103196 < 0.109619`; `0.6046 ≥ 0.11378` | ✓ (R08) |

**Headline theorems.** All 29 headline theorems are stated, and none goes through a stand-in. The one unstatable headline, Rademacher's bound for a general record, is named in the module docstring with its missing carrier. The padding probe found only R10.

**Ownership against open pull requests.** Checked with `roadmaps grep`/`show` on the closest heads (#1857, #1944–#1948, #1126, #1495). `scratch/overlaps.md` lists no dropped ids.

## Not verifiable

- `backlund1918` (3.3: `−0.048`, (54), (56), (76)): uncertified. Only (53) was checked, through `trudgian2014argument` line 261.
- `rademacher1959` (2.8; the general form of 3.2): uncertified. The Dirichlet case was checked through `bmor2021` (5.3).
- `andrewsberndt2013` and `mortici2011ramanujan` (1.4): uncertified; checked numerically only.
- `preissmann1984` (6.4): uncertified; checked through `ramare2016density` Lemma 6.5.
- `ramare2001` (9.1): uncertified; checked through `ramaretmeemt`.
- `lehman1966` (5.4, first item): uncertified. `brentplatttrudgian2021` Lemma 1 leaves `A` unspecified, so the "with `A` in place of `2`" variant is unchecked.
- `leong2026` and `leeLeong2022` (`LeongRecord`; 7.10 items 2–4): image-only in the cache, and this worker has no OCR.
- `gallagher1970`, `logan1988`, `montgomery1994ten` (6.3), `montgomeryvaughan1974`, `elliott1987` (6.5), `delange1987`, `rosser1941`, `mccurley1984`, `dlmf`, `titchmarsh1986`, `davenport2000`: uncertified.
- `gabcke1979`: waived.

## Source issues

- **Misprint** in ramare-rumely-1996 at Theorem 3.6.2, proof, p. 408: the source says the bound at `k = 1`, `|γ| = 1000` is below `0.02194`; it should be `0.02208` (only `< 1/2` is used); affects nothing.
- **Error** in ford2002zerofree after Theorem 3, p. 3: the source says the region times `log t` decreases in `t`; it should be increasing (`0.118151` at `T₀`, tending to `0.29772`), so Theorem 4 follows from its value at `T₀`; affects the proof.
- **Gap** in yang2024 at the proof of Corollary 1.2, p. 41: the source says `RH(5.45·10⁸)` and region (1.4) cover `H ≤ t < e^{170.2}`; it should note that (1.4) misses (1.6) for `20.12 ≤ log t < 50.13` (`0.0061397 < 0.0064156` at `t = 10¹⁰`); affects the proof.
- **Gap** in patel2022 at (102), p. 16: the source says `|ζ(1 + it)| ≤ log t` for every `t ≥ 3`; it should cite a computation for `3 ≤ t < 50`, since Backlund's (53) needs `t ≥ 50`; affects a stated result.
- **Misprint** in patel2022 at Lemma 3.1, p. 5: the source says `β₄` has the factor `18/20`; it should be `18/10`, as (33) and (35) of the proof give; affects a stated result.
- **Misprint** in hasanalizadeshenwong2022 at Corollary 1.2, p. 2: the source says the constant is `9.3675`; it should be `9.4925`, as bellottiwong2025 lines 81–82 record; affects a stated result.
- **Error** in hiary2016zeta at Theorem 1.1, p. 2: the source says `0.63 t^{1/6} log t` for `t ≥ 3`, using Cheng–Graham's Kusmin–Landau constant `1/π`; with the correct `2/π` the constant becomes `0.77` (hiarypatelyang2024 lines 29–44); affects a stated result.
