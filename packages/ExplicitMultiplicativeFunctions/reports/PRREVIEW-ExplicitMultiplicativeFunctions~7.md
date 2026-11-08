# Review of ExplicitMultiplicativeFunctions (pull request #1946 at 68453f2)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ExplicitMultiplicativeFunctions/README.md` (4039 lines) and `Suggested.lean` (363 lines) at `68453f2`. Below, "README" and "`Suggested.lean`" mean those two files.

- The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with `sorry` as its only warning.
- Eight of the previous review's nine findings are repaired; their new text was recomputed (table below).
- Two findings come from a supplier head pushed two minutes after this one. ExplicitZetaBounds at `1f1a271` now owns, in its §7.10, the three `1/ζ` bounds that this head moved into 1.9 (R01). Its reading of the sources also shows that 1.9 lacks the hypothesis `RH(3 000 175 332 800)` (R02).

## R01 (P2) — The three `1/ζ` bounds of 1.9 now have two owners: ExplicitZetaBounds §7.10 states them

- **Location.**
  - README lines 1705–1712: "State with it, by the same locator, the three bounds for `1/ζ` that its proof uses … This roadmap owns them: ExplicitZetaBounds leaves them to it".
  - The same claim at lines 129–134 (Not owned here) and 484–486 (contract). The route at 1714–1721, the *Needs:* at 1733–1734 and the Layer 1 Dependencies at 1823–1824 cite ExplicitZetaBounds §§3.3, 3.4, 4.8 and 7.3 for it.
  - `Suggested.lean` lines 40–41.
- **Claim.**
  - The bounds `1237 (log t)^{11/12}`, `30.812 log t` and `e^{146} log t` are stated both here and in ExplicitZetaBounds. That roadmap is earlier in the merge order, so it is the owner.
  - The sentence "ExplicitZetaBounds leaves them to it" is false at that roadmap's head.
  - "By the same locator" (`leeLeong2022` (9)–(11), the `M`-bounds) is the wrong locator for these bounds.
- **Witness.** ExplicitZetaBounds `README.md` at `1f1a271`:
  - lines 2396–2412 (§7.10) state all three, each "given `RH(3 000 175 332 800)`";
  - lines 2737–2740 name this roadmap's §1.9 as the consumer of 7.10;
  - `30.812 log t` is Leong's Corollary 4 (`leong2026`), not Lee–Leong.
- **Repair.** Cite, do not restate:
  - In 1.9, delete the three bullets, the paragraph "This roadmap owns them …" and the route for the three bounds.
  - Use the bounds as "ExplicitZetaBounds §7.10". Those are its four items, each given `RH(3 000 175 332 800)`, with the third on `14 ≤ t ≤ H − 1/2` and the item `7.59·10³¹ log t` in the classical region from `t = 13`.
  - In the ExplicitZetaBounds contract, replace the §7.3 and §§3.3/3.4/4.8 bullets (only this route uses them) and the paragraph at lines 484–486 with a §7.10 bullet.
  - In 1.9's *Needs:* and in the Layer 1 Dependencies, write "ExplicitZetaBounds §7.10" for "§§3.3, 3.4, 4.8 and 7.3".
  - In the Scope bullet at lines 129–134, say that the bounds for `1/ζ` used in 1.9 are ExplicitZetaBounds §7.10's.
  - In `Suggested.lean` lines 40–41, drop "with the three bounds for `1/ζ` it rests on".
  - Drop the two `1/ζ` Checks at lines 1738–1746, which repeat ExplicitZetaBounds' Checks at its lines 2443–2458.
  - The plan's declared gap `zeta-reciprocal-bounds` is then supplied by §7.10.

## R02 (P2) — 1.9 omits the verified-height hypothesis its route needs, and states the third `1/ζ` bound up to `H` where its proof reaches `H − 1/2`

- **Location.**
  - README lines 1704–1705: "`|M(x)| < 33.56 x (log x) exp(−√(log x/5.56))` for every real `x ≥ e^{4589.20}`".
  - Line 1710: "`|1/ζ(σ + it)| ≤ e^{146} log t` for every real `t` with `14 ≤ t ≤ H`".
- **Claim.**
  - Every `1/ζ` input of the route rests on `RH(3 000 175 332 800)`, a finite verification. The README's own route says so for the third bound (line 1719), and the classical region of ExplicitZetaBounds §7.3 holds "given `RH(3·10¹²)`".
  - The Conventions (lines 224–233) make every such computation a hypothesis of the theorem that uses it, as 1.7 does through *ZetaResidueSumVerified* (a). The bound on `M` is stated with no hypothesis.
  - The third bound's range is also wider than its proof supports.
- **Witness.**
  - ExplicitZetaBounds `README.md` at `1f1a271`, lines 2409–2417: Lee–Leong's Lemma 4.3 rests on Leong's Corollary 3, valid only up to `H₀ − 1/2`.
  - Its lines 2458–2462: a zero just above `H` with real part in `(3/4, 0.99289)` is not excluded, and would make `1/ζ` unbounded near height `H`.
- **Repair.**
  - State 1.9 as: for every real `x ≥ e^{4589.20}`, given `RH(3 000 175 332 800)` (ExplicitZetaBounds §§0.2 and 0.4, through ExplicitPrimeCounting §1.1), `|M(x)| < …`.
  - Add `RH(H)` to 1.9's *Needs:*.
  - If the three bounds stay here instead of R01's citation, give each the same hypothesis and give the third the range `14 ≤ t ≤ H − 1/2`.

## R03 (P3) — The pull-request description still miscounts the headlines and the suppliers (previous R09, not repaired)

- **Location.** The description:
  - "`Suggested.lean` states the thirteen headline theorems (… and the four pointwise bounds)";
  - "everything else named in the README is a consumer, not a prerequisite".
- **Witness.**
  - `lake env lean` gives 12 `sorry` warnings (lines 170–352), and three pointwise theorems (lines 329, 341, 352).
  - The list "In open pull requests of ours" omits #1945, #1948 and #1954, which the description's own "Depends on" block lists as suppliers.
- **Repair.**
  - Write "twelve headline theorems … and the three pointwise bounds".
  - Add ExplicitPrimeCounting, ExplicitZetaBounds and ExplicitCharacterSumsAndSieves to the dependency paragraph, or drop the "consumer" sentence.

## Previous findings (review of `bca454b`)

- **R01 (P2), the `1/ζ` bounds unowned** — repaired as asked: 1.9 states them (lines 1705–1714). Overtaken two minutes later by ExplicitZetaBounds' own repair, hence R01 and R02 above.
- **R02 (P2), maximal sums** — repaired.
  - Layer 0.7 (lines 785–803) defines *MoebiusStarRangeVerified* and *MoebiusDivStarRangeVerified*, both on the simple sums, which the source's `M*` and `m*` dominate, and lists every row.
  - 1.6 (lines 1572–1587) and 2.4 (lines 2011–2028) use them.
  - 2.4 states the constants the proof gives (`0.320`, `0.320`, `0.143`) and `0.784`. 1.6 states `1.566` for the first row of Theorem 1.19, which fails as printed.
  - All values recomputed (table).
- **R03 (P2), `0.173` at real arguments** — repaired: lines 3314–3323 and Layer 0.7 lines 905–908. Recomputed to `10⁸`.
- **R04 (P2), the 9.2 tie** — repaired: lines 3643–3645 now read "`p^ε < k`" for every maximiser and "`p^ε ≤ k`" for the largest one. The negative control is at lines 3709–3712.
- **R05 (P3), the 7.5 Check for `k = 4`** — repaired: lines 3155–3160. Recomputed for `k = 4, 5`.
- **R06 (P3), the *MoebiusLogRangeVerified* locator** — repaired: lines 780–784. I opened `ramare2015mc` lines 1157–1164 (Lemma 10.2) and `ramare2015corr` lines 237–239.
- **R07 (P3), the `58/√z` owner** — repaired: lines 116–121, 385–388, 466–467 and 2934–2936 cite ExplicitPrimeCounting §0.1. At `d7232a7`, its lines 503–527 define `S(u)` and state Büthe's `O*(58/√u)` for `u ≥ 10⁹`.
- **R08 (P3), the 6.1 locators** — repaired: lines 2637–2650.
  - The product bound rests on Mathlib `EulerProduct.summable_and_hasSum_smoothNumbers_prod_primesBelow_tsum` (`Mathlib/NumberTheory/EulerProduct/Basic.lean` line 142, with the section hypotheses `hf₁`, `hmul` and the summability of the local series, as described).
  - The Rankin-type bound rests on `bordelles2012` Theorem 4.28.
- **R09 (P3), the pull-request description** — not repaired: see R03.

## Verified sound

**Gate, build and order.**

- I ran the gate: `gate ExplicitMultiplicativeFunctions: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit status `0`.
- The dependency check (`gate --depcheck … --movable`) prints `depcheck: 244 roadmaps, 2465 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. `ORDER.txt` has AnalyticNumberTheoryPartI at line 90, SieveMethodsAndPrimePatterns at 269, ExplicitZetaBounds at 270, ExplicitPrimeCounting at 271, ExplicitCharacterSumsAndSieves at 272 and this roadmap at 273.
- `lake env lean` on `Suggested.lean` prints exactly 12 warnings, all `declaration uses 'sorry'`, at lines 170, 197, 202, 212, 227, 249, 274, 291, 314, 329, 341 and 352.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml`; the diff outside it is empty.
- No process word, `lemma` (outside source citations) or `set_option` appears.

**Signatures and padding.**

- I elaborated a scratch copy with `#check @name` for all 25 declarations (13 definitions, 12 theorems). The worker's count of 27 included two false hits from the docstring.
- Every elaborated type matches its README statement: the hypotheses, the ranges, the `Icc 1 ⌊x⌋₊` and `Nat.primesLE ⌊x⌋₊` cutoffs, `mertensConstant ℚ` and `t ^ (-(1/3))`.
- There is no `variable` block, so no binder can drop, and no `def` has a `sorry` body.
- One-tactic probe: I replaced each `sorry` by `first | rfl | (simp; done) | (norm_num; done) | positivity | infer_instance | decide | (simp_all; done) | linarith | omega`. The copy fails with exactly 12 errors, one per theorem, so none is padding.
- The README's end theorems are all stated. The docstring names the three groups not stated: 1.10, Robin's `σ(n)/n`, and the preprint targets.

**Seeded sample: each locator opened.**

- **0.3** — `akhileshRamare2017` lines 319–338 (Lemma 2.1, both forms) and `ramare1995` lines 356–366 (Lemma 3.3; the OCR drops the `γ` of `3 exp(−1 − γ/3)`, and the constant `0.910471` recomputes).
- **1.2** — `macleod1967` lines 24–37 ((4), (5) and Neubauer's range), `macleod1969errata` lines 14–17, and `costaPereira1989` lines 793–803 (`1/1036` from `120 727`).
- **1.5** — the scheme arithmetic recomputed (table); the inputs are as in previous reviews.
- **1.9** — R01 and R02.
- **3.1** — `ramare2015mc` lines 155–163 and 652–689, and `ramare2015corr` lines 13–19. The middle coefficient `5 − 4γ` follows from the source's line 661 with (2.1); I re-derived it (Source issues).
- **3.4** — the extremal value recomputed. `daval2025` is uncertified.
- **4.1** — `bordelles2015` lines 105–107 (Proposition 3) and 606–625 (its proof, citing `bordelles2005` p. 4).
- **5.4** — `akhileshRamare2017` lines 135–171 (Theorem 1.3, with `ℛ` as stated) and 202–224 (Theorem 1.4, `6/11` at `η = 1`).
- **5.6** — `zunigaAlterman2022` is uncertified; the instances were recomputed.
- **6.5** — re-derived both inequalities. `ramare1995` Lemma 3.1 (lines 334–337) has its display as an image, and `vanLintRichert1965` lines 55–92 is garbled OCR.
- **7.1** — `moserMacLeod1966` lines 8–14 and 81, `cipu2015` lines 621–626, `ramare2013aa` lines 267–276, and `ramare2016mc` lines 450–466 (Lemma 3.4 and the identity of line 461).
- **7.5** — `cullyHugillTrudgian2021` lines 44–72, 190–200 and 230–242: (18), `F₁ = 2c + 6α + 2α/log x₀`, `x₀ = 5560`, `c = 1.001` from `6·10⁵`.
- **7.7** — `trevino2015ijnt` lines 223–236 and 274–292 (Lemmas 2–3, the check to `41`, and Moser–MacLeod's tail).
- **7.9** — `tudzi2025` is uncertified; the `0.173` row was recomputed.
- **8.3** — re-derived `η(x) = c/log x + 3c/(2 log² x)` and the product transfer. ExplicitPrimeCounting §6.3 at `d7232a7`, line 3492: `c₀(q) = 1/840` for `3 ≤ q ≤ 10⁴`, `x₀(q) = 8·10⁹` for `3 ≤ q ≤ 10⁵`.
- **New text** — `ramare2015mc` lines 403–432 (Theorems 1.18–1.19), 970–1061 ((7.1) and Lemmas 7.1–7.4), 1082–1110 (Lemma 8.3 and (9.1)), 1437–1559 ((16.1)–(16.5) and Lemmas 16.2–16.6), and 1150–1164 (Lemma 10.2).

**Adversarial table.** Every value was computed in this review, except the rows marked "(carried)".

| Statement | Instances | Values (left / right) | Result | Change |
|---|---|---|---|---|
| 0.7 *MoebiusStarRangeVerified*, `c y/log y` rows | max of `(log y/y)Σ_{w≤√y}\|M(y/w²)\|` on `[a, 10⁵]` | `0.091409` (48 513), `0.198038` (4551), `0.428557` (509), `0.996964` (31) vs `0.0918, 0.199, 0.429, 0.997` | holds | — |
| same, `c y/(1 + log y)` rows | same with `1 + log y` | `0.097355` (48 962), `0.197108` (7110), `0.497320` (509), `1.565663` (`y = 5`, sum `3`) vs `0.0975, 0.198, 0.498, 1.566`; source's `1` fails at `5` | holds; printed row false | — (README already corrects it) |
| 0.7 *MoebiusDivStarRangeVerified*, `c/log y` rows | right ends `(n + 1)⁻` | `0.129502`, `0.301339`, `0.783122` as `y → 11⁻` (sum `0.326587`; `0.751995` at `10`) vs `0.132, 0.320, 0.784` | holds; `0.779` fails at real `y` | — |
| same, `c/(1 + log y)` rows | right ends | `0.141569`, `0.318534`, `0.472527`, `1.693147` (`y → 2⁻`) vs `0.143, 0.320, 0.5, 1.694` | holds | — |
| 0.7 (16.2)–(16.4) instances | `\|M(D)\| log D/D` | `0.643775` at `5` on `(1, 688]`; `0.094968` at `688` (`M(688) = −10`); `0.012910` at `119 545` on `[97 067, 1 078 853]` | holds | — |
| 1.6 Theorem 1.19, first row | `q = 1, x = 5`; `2 ≤ q ≤ 400, x ≤ 2·10⁴` | `(1 + log 5)·2/5 = 1.0438 > 1`; max `0.441816` at `(2, 13)`, `0.589088` with `∏(1 + 1/p)⁻¹` | printed `1` false at `q = 1`; `1.566` holds | — |
| 2.4 Theorems 1.12–1.13 | first row `q ≥ 2`; printed rows `q ≤ 25`, `x ≤ 2·10⁴` | `0.305430` at `q = 2, x → 5⁻`; `5/16` row `0.081742`, `5/38` row `0.093400`, `1/7` row `0.033518` (all `q = 1`) | holds | — |
| 2.4 Lemma 7.4's analytic step, corrected thresholds | `x = 3.3·10⁷`, `10⁸` | `0.113063` (`log`), `0.119594` (`1 + log`); `0.103400` | below the README's `0.1152`, `0.1218`, `0.1047` and below `0.132`, `0.143` | — |
| 1.5 Lemma 7.2 scheme (headline) | `K = 462 848` | `g(K+1) = 0.034515`, `J = 0.000230`, `(6/π²)∫ = 0.047418`, bound `0.012949 log D − 0.145879`, gap `0.00329` at `K·2 160 535` | sound | — |
| 1.5 fields of `RamareTransferComputations` (carried) | (i), (iii)–(vii) | as in the previous review: `−147.768`, `161.66 ≤ 162.46`, `3.4852 ≤ 3.49`, ratios `0.998`, `0.9998` | sound | — |
| 1.9 `1/ζ` Checks | `1/\|ζ(1 + 13i)\|`; ratio to `log t` on `[13, 113]`; `σ = 3/4` | `1.378748`; peak `1.158634` at `t = 14.11`; `1/\|ζ(3/4 + 14.1i)\| = 5.53197 = 2.0906 log 14.1`, grid maximum `2.1038` at `14.13` | values hold; two owners, no `RH(H)` | R01, R02 |
| 1.9 at `t = H` | `log H = 28.72969` | `1237·28.72969^{11/12} = 26 865`; `885.2`; `431.7 log H/log log H = 3693.5` | sound | R01 |
| 1.9 against 1.4 | `L = 4589.2`, `5204.2` | `5.14·10⁻⁸` vs `1.21·10⁻⁸`; `9.05·10⁻⁹` vs `9.03·10⁻⁹` | sound | — |
| 3.1 (headline `abs_moebiusLogSum_sub_one_le`) | `x = 1, 2`; minimum of `x`·polynomial | `−1 = −1` (printed `6 − 4γ` gives `−2`); polynomial `−0.365506`, `g(2) = −0.0407257` from the source's (3.4), `∫₁² h' = 0.117313`; minimum `−1.071141` at `1.171149` | sound | — |
| 3.4 extremal value | `[1, 10⁵]`, ends and interior critical points | supremum `0.16532795` at `x = 2.389861` `= 2(2 − log 2)³/27`; on `[3, 10⁵]` maximum `0.126373` (at `3.1547`) `≤ 0.162` | sound | — |
| 4.1 | `q = 3`, `q = 5` quartic | partial sums `1, 0, 0` (`P = 1`), `L(1, χ) = 0.6046`, sums `1, 1.5, 1.7 ≤ 4.96`; `1, 1+i, 1, 0` (`P = √2`) | sound | — |
| 5.1 comparison (headline) | expansion of `log²(t/m)`; `h = δ` | `u = A H(0)`, `v = 2A H'(0) + B H(0)`, `w = A H''(0) + B H'(0) + C H(0)`, error `D t^{−α} Σ\|h\| m^α`; hypothesis returned | sound | — |
| 5.2 model (headline) | `t = 10⁶`; `t = 0.01`; `sup_{(0,1)} \|P\| t^{1/3}` | `0.4789015` vs `γ² − 2γ₁ = 0.4788096`; `5.76625 > 5.38424`; `1.640819` at `u = 7.216` | sound | — |
| 5.4 | `g = μ` | main term `(log D + γ)·0 + 1 = 1` | sound | — |
| 5.6 instances | `q = 2, X = 100`; `X → 1⁻` | `3.137993` vs `3.142163`; `1.33258`, `1.04389` (`q = 1`), `1.24839` (`q = 2`), `1.21383` (`q = 3`), `0.67665` (`q = 2`, `μ²/ℓ`) | sound | — |
| 6.1 | Mathlib lemma; `f = 1` | `y = 2`: `3/2 = 3/2`; `y = 3`: `11/6 ≤ 2` | sound | — |
| 6.3 Hall–Tenenbaum (headline) | `1 < x < 2` | `hA` at `y = 1` gives `A ≥ 0`, `hB` at `N = 0` gives `B ≥ 0`; right side `≥ x/log x ≥ e > 1` | sound | — |
| 6.5 | `f = 1, d = 2, x = 4` | `3 ≤ 4 ≤ 6`; both inequalities re-derived | sound | — |
| 7.1 | `x ≥ 8` on `[8, 1.1·10⁶]`; `351 115` | maximum `R(n)/√n = 0.485696` (at 15), minimum left limit `−0.134238` (`381⁻`); `Q = 213 474`, `R = 21.6756 > 21.5913` | sound | — |
| 7.5 Bordellès `k = 4, 5`; thresholds | integers of `[1, 10⁵]` | minimum bound/`S₄` `1.16582`, bound/`S₅` `1.37606`; `S₄(6) = 39 ≤ 54.52`; last failures `192`, `432`, `6` | sound | — |
| 7.5 constants | `F₁`, `H*(3/4)`, `C₃`, `C₄` | `4.47291`; `2.17325`; `0.981470`; `1 − C₄ = 0.727228` | sound | — |
| 7.7 | `x = 10`, `41` | `6.22381 ≤ 9.3819`; `γ + 1/3 + 1/41 + 8/123 = 0.99998` | sound | — |
| 7.9 `0.173` row | integers and left limits on `[6·10⁵, 10⁸]` | integer maximum `0.172001` (652 080); only real violation `1 081 080⁻` (`Δ = −181.358`, ratio `0.174425`, `τ = 256`); beyond it maximum `0.138890` (`1 621 620⁻`); `0.764 log x = 0.173 x^{1/6}` at `4.55·10¹²` | sound | — |
| 8.1 Mertens product (headline) | `x = 24 284` | `1/log³ x + 1/(x − 1) = 1.01247·10⁻³ < log(1 + 1/(2 log² x)) = 4.89185·10⁻³` | sound | — |
| 8.1 Axler (headline, carried) | `x = 392 687` | margin `5·10⁻¹³` | sound | — |
| 8.3 | `q = 1, X₀ = 286`; `q = 4` | `C = 1.83681`; `C(4,1)C(4,3) = 2e^{−γ}` | sound | — |
| 9.1 Robin (headline) | `k = 9`; analytic step `k ∈ [27, 2·10⁶]` | `1.384013`; maximum deficiency `1.203374 k` at `k = 31`; last failure of `log(kℓ) ≤ 1.3841ℓ` at `k = 26` (`1.385245`) | sound | — |
| 9.2 Nicolas–Robin (headline) | `n = 6 983 776 800`; the tie | `f₂ = 1.537940`; `N_{2,1} = 2` (`2 ≥ 2`, `3/2 < 2`) | sound | — |
| 9.4 Rosser–Schoenfeld (headline) | `N₉ = 223 092 870` | `n/φ(n) = 6.112911`, constant `2.506369` | sound | — |
| 2.1, 2.2 (headlines) | `S = ∅`; `x = 1, 2` | `1 = 1`; `1 ≤ 3.667`, `1/2 ≤ 1.583` | sound | — |
| 1.2 (5) with `<` | `x = 199` | `\|M(199)\| = 8 = 200/80 + 11/2` | `≤` correct; source strict false | — |

**Library declarations opened at the pins.**

- Mathlib:
  - `Mathlib/NumberTheory/EulerProduct/Basic.lean` line 142;
  - `Mathlib/NumberTheory/LSeries/Dirichlet.lean` lines 69, 312, 322;
  - `Mathlib/NumberTheory/PrimeCounting.lean` line 133 (`primesLE n = primesBelow (n + 1)`);
  - `Mathlib/NumberTheory/Chebyshev.lean` line 191;
  - `Mathlib/NumberTheory/Primorial.lean` line 40;
  - `Mathlib/Data/Nat/Prime/Nth.lean` line 23;
  - `Mathlib/NumberTheory/SmoothNumbers.lean` line 197.
- Tau Ceti:
  - `TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/Formula.lean` line 229;
  - `TauCeti/NumberTheory/LFunctions/Mertens.lean` lines 545 and 564;
  - `TauCeti/NumberTheory/ArithmeticFunction/DivisorBounds.lean` line 52;
  - `TauCeti/NumberTheory/PrimeCounting.lean` line 90.

**Cross-roadmap citations, resolved at the current heads.**

- ExplicitPrimeCounting at `d7232a7`, all as cited:
  - §0.1 (lines 503–527);
  - §1.1 (lines 891–905; `RH(H)` is ExplicitZetaBounds §0.2's, which that roadmap's lines 2737–2740 accept as the route to this roadmap);
  - §1.3 (line 1005, *ButheVerified*); §1.6 (lines 1269–1270); §1.7 (lines 1299–1311);
  - §3.1 (line 1945); §3.2 (lines 2025–2026); §3.3 (line 2099); §3.5 (line 2396);
  - §4.2 (lines 2754, 2763–2764); §4.3 (lines 2837 and 2873); §4.7 (line 3083);
  - §5.3 (`dusart_nth_prime_lower`, `−1` for every `k ≥ 2`, lines 3205–3213); §6.1 (lines 3424, 3444); §6.3 (line 3492).
- ExplicitZetaBounds at `1f1a271`: §§3.3, 3.4 (lines 1086–1127), §4.1 (line 1166), §4.3 (line 1229), §4.8 (line 1462), §6.1 (line 1783), §7.3 (line 23 and lines 2085–2119), and §7.10 (R01). Its line 90 accepts 4.1 for this roadmap's 7.4 and leaves the dyadic second-derivative test here.
- ExplicitCharacterSumsAndSieves at `7dbb08f`: §5.1 (line 1277; `selbergDiagonal`, the coprime comparison, and the asymptotic taken from ExplicitPrimeCounting §0.1).
- ExplicitNumberFields at `4198f62` cites this roadmap's §§2.3, 2.5, 7.1, 7.5, 7.9, 8.1, 9.1 and 9.4. None is renumbered by this head.
- `overlaps.md` and `citations.md` list nothing.

**Ownership against open pull requests.**

- `roadmaps grep` for the new objects (the maximal sums, Theorems 1.18–1.19, bounds for `1/ζ(σ + it)`) finds them only here and in ExplicitZetaBounds (R01).
- ProbabilisticAndMetricNumberTheory (merge order 275) restates in its §3.7 (`README.md` lines 4002–4009 at `e4c4e53`) the Rankin-type bound that this roadmap owns in 6.1. This roadmap is earlier and already names §3.7 as a consumer, so no change is needed here; the repair belongs to that pull request.

**Declared gaps.**

- `plan.json` has 17 slugs. The README states five contracts (`psi-initial-range`, `mertens-reciprocal-axler`, `psi-relative-bklnw`, `psi-tilde-difference`, `psi-log-power`), each precise and each present in the plan.
- None of the five is supplied at ExplicitPrimeCounting `d7232a7`: no `0.8 √x`, `η_A`, `2.58843·10⁻⁵`, `394 385` or `8.96237·10⁻⁴` row.
- Eleven slugs resolve to the sections above.
- `zeta-reciprocal-bounds` lost its contract here and is now supplied by ExplicitZetaBounds §7.10 (R01).

## Not verifiable

- `leeLeong2022` is uncertified and not in the sources cache. Which equation of (9)–(11) is the de la Vallée Poussin bound, and which statements carry the three `1/ζ` bounds, I take from ExplicitZetaBounds' reading at `1f1a271` (Theorem 1.1 (6), lines 100–111; Lemma 4.3, lines 1084–1159). `leong2026` is not cited here and was not opened.
- `ramare1995` Lemma 3.1 (lines 334–337) has its display as an image. `vanLintRichert1965` lines 55–92 is unreadable OCR. I re-derived 6.5 instead.
- These uncertified sources were cited by locator and not opened, with values recomputed where possible:
  - `zunigaAlterman2022` (5.6), `daval2025` (3.4), `tudzi2025` (7.9);
  - `bordelles2002`, `bordelles2006`, `bordelles2012`, `bordelles2005`, `languascoZaccagnini2009` (7.5, 6.1, 6.4, 8.3);
  - `hallTenenbaum1988` (6.3), `deCamargo2025` (1.6, 2.4).
- The instances *DivisorRangeVerified* `0.173 1 081 080 (5·10¹²)` and *DivisorRangeVerifiedNat* `0.173 (6·10⁵) (5·10¹²)` were checked only up to `10⁸`.

## Source issues

- **Error** in ramare2015mc at Theorem 1.19, p. 1365 (line 428), and Lemma 16.6, p. 1385 (line 1554): the source says the first rows hold with constant `1` for every `x/q > 1`, resp. `x > 1`; at `q = 1, x = 5` the left side is `1.0438`, and `M*(5)(1 + log 5)/5 = 1.5657`; it should be `1.566`, what the route gives; affects a stated result.
- **Gap** in ramare2015mc at Lemma 7.4 and (9.1), pp. 1376–1378 (lines 1025 and 1109): the source says `|m*(x)| ≤ 0.779/log x` for `x > 1` and applies it at real `x/d`; at real `y → 11⁻` the sum times `log y` is `0.78312`; it should be `0.784` at real arguments; affects the proof.
- **Error** in ramare2015mc at Lemma 3.2, p. 1369 (line 654, and line 667 of its proof): the source says the coefficient of `x⁻²` is `−(6 − 4γ)`, giving `−2` at `x = 1` where the left side is `−1`; it should be `−(5 − 4γ)`, from its line 661 with (2.1); affects nothing.
- **Error** in macleod1969errata at the corrected (5), p. 1 (lines 14–17): the source says `|M(x)| < (x + 1)/80 + 11/2` strictly for all `x`; at `x = 199` both sides equal `8`; it should be `≤`; affects a stated result.
