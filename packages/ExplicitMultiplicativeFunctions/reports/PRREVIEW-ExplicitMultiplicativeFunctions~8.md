# Review of ExplicitMultiplicativeFunctions (pull request #1946 at 556188c)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ExplicitMultiplicativeFunctions/README.md` (4085 lines) and `Suggested.lean` (363 lines) at `556188c`. Below, "README" and "`Suggested.lean`" mean those two files.

- The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with `sorry` as its only warning.
- The previous review's two blocking findings are repaired (section "Previous findings").
- The repair of 1.9 adds a new contour join. Its supplier contract is declared under a slug that the plan declares with different content (R01). R02 is an older inconsistency in 2.3 found by the seeded sample.

## R01 (P2) — 1.9's join needs a gap the plan does not declare, and its item (c) states no bound

- **Location.** README lines 498–517: "Supplier gap of this contract (`gap:zeta-reciprocal-bounds`): three further bounds for `1/ζ` and `ζ'/ζ` … (c) a bound for `1/|ζ(3/4 + it)|` for real `|t| ≤ 14` … any explicit bound below `e^{1000}` serves". The same contract is used at lines 133–136, 1752–1757, 1770–1771 and 1866–1867.
- **Claim.**
  - The plan's entry for this slug (`packages/ExplicitMultiplicativeFunctions/design/plan.json`, `gaps`) asks ExplicitZetaBounds for `1237 (log t)^{11/12}`, `30.812 log t` and `e^{146} log t`, and ExplicitZetaBounds §7.10 now states these bounds.
  - Under that slug the README asks for three different bounds:
    - (a) Leong's `|ζ'/ζ| ≤ 10.175 log t` on `σ ≥ 0.95`;
    - (b) the `W = 13` row `1719 log t`;
    - (c) a bound on `σ = 3/4` for `|t| ≤ 14`.
  - The intake reads the plan, so (a)–(c) are never announced to the supplier, and ExplicitZetaBounds does not state any of them.
  - Item (c) names no inequality. Nobody can discharge it, and the `needs` is compound.
  - The Scope bullet (lines 135–136) calls all three "near that height", but (c) concerns `|t| ≤ 14`.
- **Witness.**
  - ExplicitZetaBounds `README.md` at `fcc94b0`, lines 2802–2805: what this roadmap takes is 4.1, 6.1, 7.10 and `RH(H)`.
  - Its §7.10 (lines 2454–2540) states no `ζ'/ζ` bound and mentions `1719` only in a Check.
  - Computed: `max_{|t| ≤ 14} 1/|ζ(3/4 + it)| = 4.9554`, at `t = 14`, and `ζ(3/4) = −3.4413`.
- **Repair.**
  - Add three package-stage gaps to the plan's `gaps`, each with supplier ExplicitZetaBounds §7.10, given `RH(3 000 175 332 800)`, and one `needs` sentence:
    - (a) and (b) exactly as written at lines 504–513;
    - (c) a stated bound, for instance "`1/|ζ(3/4 + it)| ≤ 16` for every real `t` with `|t| ≤ 14`". This is Simonič's `4/(σ − 1/2)` at `σ = 3/4`, as quoted at `leeLeong2022` (43); the true maximum is `4.9554`.
  - In the contract, write each as `What ExplicitZetaBounds must provide (gap:<slug>): …`. Cite the three slugs in 1.9's route, in its *Needs:* line and in the Layer 1 Dependencies.
  - Say in the contract that the plan's `gap:zeta-reciprocal-bounds` is met by §7.10 for 1.9, and that its Littlewood and Korobov–Vinogradov companions are Part II's.
  - In the Scope bullet, replace "near that height" with "at the join below that height and on `|t| ≤ 14`".
  - Alternatively, state (c) as a Layer 0.7 proposition with the instance `16`, since it bounds `1/ζ` on a compact segment (Conventions). The instance holds: `4.9554 ≤ 16`.

## R02 (P3) — 2.3's route uses the source's `58 909 800`, which its own hypothesis does not give

- **Location.** README lines 1956–1964: "Prove, under *MoebiusAbsIntegralLE* `1 078 853 113 556 832`, … through Balazard's identity, Lemma 2.4 (the explicit integral `… + 58 909 800 log x/x²` is increasing to `0.0130(1 − log 2)/3`, lines 479–528)".
- **Claim.**
  - `58 909 800` is the integral of `M` over `{M ≥ 0}` only (`ramare2015mc` lines 461–468, Lemma 2.2).
  - The source uses it at line 545 to bound `∫_{x/D₀}^x |M(x/t)| ε₁'(t) dt`, and nothing printed justifies that step.
  - With the stated hypothesis and `ε₁' ≤ 1/t²`, the term is `113 556 832 log x/x²`. Lemma 2.4's function is then `0.0013553` at `x = D₀`, above the lemma's `0.00134` and above its limit `0.0013297`, so the function is not increasing.
  - Theorem 1.2 still follows. The condition it needs is `f(x) ≤ 0.0014 + 0.018/log x − 4 log x/x`, and its slack is at least `0.00084` on `x ≥ D₀` with either constant.
- **Witness.**
  - At `x = D₀ = 1 078 853`, the function is `0.000703` with `58 909 800` and `0.001355` with `113 556 832`.
  - The exact integral `∫_1^{D₀} |M(D₀/t)| ε₁'(t) dt` is `39.08`, against `58 909 800/D₀ = 54.60` and `113 556 832/D₀ = 105.26`.
- **Repair.**
  - Write: "Lemma 2.4 with `113 556 832` in place of the source's `58 909 800` (the function is then at most `0.001356`, at `x = D₀`), which still closes Theorem 1.2".
  - Add the two values at `D₀` as a Check.
  - To keep `58 909 800` instead, name the computation it needs as a Layer 0.7 proposition: `∫_{x/D₀}^x |M(x/t)| ε₁'(t) dt ≤ 58 909 800/x` for every real `x ≥ D₀`. It holds at the three points computed: `39.08`, `20.06` and `12.23` at `x/D₀ = 1, 1.5, 3`, against `54.60`, `36.40` and `18.20`.

## R03 (P3) — The pull-request description still miscounts the headlines and the suppliers (previous R03, not repaired)

- **Location.** The description:
  - "`Suggested.lean` states the thirteen headline theorems (… and the four pointwise bounds)";
  - "everything else named in the README is a consumer, not a prerequisite".
- **Witness.**
  - `lake env lean` gives 12 `sorry` warnings (lines 170–352), and only three pointwise theorems (lines 329, 341, 352).
  - The list "In open pull requests of ours" omits ExplicitZetaBounds, ExplicitPrimeCounting and ExplicitCharacterSumsAndSieves, which the description's own "Depends on" block lists.
- **Repair.**
  - Write "twelve headline theorems … and the three pointwise bounds".
  - Add the three suppliers to the dependency paragraph, or drop the "consumer" sentence.

## Previous findings (review of `68453f2`)

- **R01 (P2), two owners of the `1/ζ` bounds** — repaired.
  - 1.9 now uses ExplicitZetaBounds' bounds by citation. Line 1749: "ExplicitZetaBounds §7.10 bounds `1/ζ` by `1237 (log|t|)^{11/12}`". The contract has a §7.10 bullet (lines 489–494).
  - Removed: the three restated bounds, the ownership paragraph, the §§3.3/3.4/4.8 contract and the two `1/ζ` Checks.
  - `Suggested.lean` line 40 now reads "Lee–Leong's bound of de la Vallée Poussin shape given the Riemann hypothesis verified to the height `3 000 175 332 800`".
  - The repair also replaced the source's join at `H₀`, whose new contract is R01 above.
- **R02 (P2), the missing `RH(H₀)` and the range up to `H`** — repaired.
  - Line 1736: "given `RH(H₀)`, `|M(x)| < 33.56 x (log x) exp(−√(log x/5.56))`".
  - The hypothesis also appears in the *Needs:* line (line 1766) and in the contracts (lines 392–397 and 480–481).
  - The bound on `σ ≥ 3/4` is used only for `14 ≤ |t| ≤ H₀ − 1/2` (line 1751).
- **R03 (P3), the description** — not repaired (R03 above).

## Verified sound

**Gate, build and order.**

- I ran the gate myself. It printed `gate ExplicitMultiplicativeFunctions: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, with exit status `0`.
- The dependency check (`gate --depcheck … --movable`) printed `depcheck: 244 roadmaps, 2465 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Positions in `ORDER.txt`:

  | Roadmap | Line |
  |---|---|
  | ZerosOfLFunctions | 85 |
  | AnalyticNumberTheoryPartI | 90 |
  | SieveMethodsAndPrimePatterns | 269 |
  | ExplicitZetaBounds | 270 |
  | ExplicitPrimeCounting | 271 |
  | ExplicitCharacterSumsAndSieves | 272 |
  | this roadmap | 273 |
  | ExplicitNumberFields | 274 |
  | ProbabilisticAndMetricNumberTheory | 275 |

- `lake env lean` on `Suggested.lean` printed exactly 12 warnings, all `declaration uses 'sorry'`, at lines 170, 197, 202, 212, 227, 249, 274, 291, 314, 329, 341 and 352.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml`, and the diff outside it is empty.

**Signatures and padding.**

- I elaborated one scratch copy with `#check @name` for all 25 declarations (13 definitions, 12 theorems). Every elaborated type matches its README statement.
  - Nothing changed since `68453f2`: the Lean diff touches only the module docstring.
  - There is no `variable` block, so no binder can drop.
- One-tactic probe: in the same copy, each `sorry` was replaced by `first | rfl | (simp; done) | (norm_num; done) | positivity | infer_instance | decide | (simp_all; done) | linarith | omega`. The copy fails with exactly 12 errors, one per theorem, so nothing is padding.
- Headlines: every end theorem the Summary lists is stated.
  - The stated ones: Ramaré's 2013 instance, Tao, Balazard, Ramaré's `m̌`, the comparison theorem, the Dirichlet-divisor model, Hall–Tenenbaum, both Mertens products, Robin's `ω`, Nicolas–Robin's `τ` and Rosser–Schoenfeld's `n/φ`.
  - The docstring names the three groups not stated: 1.10, Robin's `σ(n)/n`, and the preprint targets, 1.9 among them.

**Seeded sample: each locator opened at the cited lines.**

- **0.4** — `ramare2016mc` lines 540–565 (Lemma 4.3: `X ≥ 0`, `c ∈ [1, 2]`, the split at `√(2N)`). Statement as written.
- **1.2** — `macleod1967` lines 24–37 ((4), (5), Neubauer's range), `macleod1969errata` lines 14–17 ((5) corrected), and `costaPereira1989` lines 794–803 (`1/1036` from `120 727`, Corollary 2).
- **1.5** — all in `ramare2013aa`:
  - lines 50–51 (Theorem 1.1);
  - 189–197 ((3.4), with `−2γ`);
  - 203–214 (Lemma 4.1, (4.1)–(4.2), Lemma 4.2);
  - 251 (Lemma 4.5, false range: Source issues);
  - 261–276 ((4.5)–(4.7), Lemma 4.6);
  - 349–414 ((5.1), Lemmas 5.1–5.2);
  - 471–483 ((6.1), Lemmas 6.1–6.2);
  - 553–583 (Lemmas 6.3–6.4 and the proof of 6.1 at `√D ≥ 36 055`);
  - 587–684 ((7.1)–(7.2), Lemmas 7.1–7.2);
  - 696–725 (Lemma 8.1, `−3.48`).
  - The README's boundary term, its `+k∫` and its split scheme are the correct forms (Source issues).
- **1.8** — `daval2023` is uncertified. I checked Daval's identity numerically at three points (table).
- **1.10, 2.6** — `ramareZunigaAlterman2025` is uncertified. Every number of their Checks was recomputed (table).
- **2.3** — `ramare2015mc` lines 116–152 (Theorem 1.2 and Corollary 1.3 as printed) and 444–556 (Lemmas 2.2–2.4 and the chain; R02). Also `ramare2013aa` lines 56–65 and `bordelles2015` lines 65–77.
- **2.4** — `ramare2015mc` lines 248–334 (Lemma 1.9, Theorems 1.12–1.13 as printed, (1.7)), `bordelles2015` lines 86–100 (Theorem 2, `C_m = 1100(…)²`) and `ramare2014aa` lines 74–84 (Theorem 1.1).
- **6.1** — the product bound is the Mathlib Euler product with the terms beyond `y` dropped. I re-derived the Rankin form from `h = f ⋆ μ`. `bordelles2012` is uncertified.
- **6.2** — `daboussiRivat2001` lines 302–362 (Lemma 4: `K(t) = log t − 1 + 1/t`, `S`, both bounds). The source's simplified form for `log y ≥ 7S` uses `exp(−log y/log z)`. The README's `K(7)` form follows from line 362 (`K(t) ≥ K(7) ≥ 1`).
- **6.3** — `hallTenenbaum1988` and `bordelles2024` are uncertified. I re-derived both forms: the headline's hypotheses `hA`, `hB` give `Σ f(n) log n ≤ (A + B) x Σ f(m)/m`, and `log(x/n) ≤ x/n` closes it.
- **6.4** — `bordelles2012` is uncertified. Re-derived through `g = f ⋆ μ ≥ 0` and the identity `1 + Σ (f(p^a) − f(p^{a−1}))/p^a = (1 − 1/p)(1 + Σ f(p^a)/p^a)`.
- **6.5** — re-derived both inequalities. `vanLintRichert1965` lines 52–95 is garbled OCR, and the display of `ramare1995` Lemma 3.1 (lines 334–337) is an image.
- **7.8** — `chirreHelfgott2025`, `mossinghoffOliveiraESilvaTrudgian2021` and `kumchevEtAl2023` are uncertified. The comparisons and `Q₃(239)` were recomputed (table).
- **9.3**:
  - `nicolas2008` lines 23–26 (Rosser–Schoenfeld as quoted), 56–68 (Théorème 2, (6) and (7) with `M₁`, `M₂`), 232–236 (Définition 1), 399–426 (Lemme 7) and 437–443 (Lemme 9, `15 985`, `166 000`);
  - `ivic1977` lines 19–24 (Theorems 1–2), 49 and 52.
  - `robin1984`, `axlerNicolas2023` and `eumKoo2015` are uncertified.

**Adversarial table.** Every value was computed in this review, except the row marked "(carried)".

| Statement | Instances | Values (left / right) | Result | Change |
|---|---|---|---|---|
| 1.9 threshold and constant | `log x = 4589.20` | `log H₀ = 28.729692`, `5.56 log² H₀ = 4589.1973`; `c₁ = 5.43656 + 27.92999 + 0.18507 = 33.55163 ≤ 33.56` | sound | — |
| 1.9 join (new) | source's segment at `H₀`; rises over `[H₀ − 1/2, H₀]` | `e^{146}` segment `5.65·10³⁵ x`; `7.59·10³¹` rise `3.856·10⁷ x`, below the bound only from `log x = 13 040.6`; `σ = 1` rise `4.696·10⁻¹¹ x` (`0.0915 %` of `5.1334·10⁻⁸`), above the bound from `7281.3`; items (a)+(b): at most `2.606·10⁻⁷` of the bound, at `log x ≈ 5499`; `W = 6` row `2.0016·10⁻⁷` | sound | R01 (contract only) |
| 1.9 item (c) | `σ = 3/4`, `0 ≤ t ≤ 14` (step `10⁻³`) | `max 1/|ζ| = 4.95536` at `t = 14`; `1/|ζ(3/4 + 14.1i)| = 5.53197`; `1/|ζ(1 + 13i)| = 1.378748` | a precise bound exists | R01 |
| 1.9 against 1.4 | `L = 4589.2` | `5.1334·10⁻⁸` against `1.2124·10⁻⁸`; the bounds meet at `L = 5204.17` | sound | — |
| 0.4 | `X = 0.5`, `c ∈ {1, 2, 3}`; `X = 2.999`, `c = 1`; `X = 1` | `|0 − 1/8| ≤ 1/4, 1/8`, but `> 1/16` at `c = 3`; `|3 − 4.4970| = 1.4970 ≤ 1.4995`; `1 = 1/2 + 1/2` | sound | — |
| 1.2 | `[1, 1.2·10⁶]` | `|M(1118)| = 14 > 13.975`, `|M(1109)| = 15 > 13.8625`, last failure of `x/80` at `1118`; `max(|M| − x/80) = 5.5125` at `199` `= 1/80 + 11/2` | sound | — |
| 1.3, 1.5 thresholds | neighbours of each threshold | `M(617 972) = −262`, `M(617 973) = −261`; `M(2 160 534) = −498`, `M(2 160 535) = −497`; `M(1 078 852) = 350`, `M(1 078 853) = 349` against `349.915` | sound | — |
| 1.5 fields (v), (vi) | `D₀ = 2 161 205` | `M(D₀) = −466`, `M₂(μ, D₀) = −98 403.055`, value `−3.48518` (so `3.49`, not `3.48`); `(0.0130 log D₀ − 0.144) D₀ = 98 594.81` | sound | — |
| 1.5 scheme (headline `abs_moebiusSum_le_ramare`) | `K = 462 848`, `D = K·2 160 535` | `g(K+1) = 0.034515`, `J = 0.000230`, `(6/π²)∫ = 0.047418`, bound `0.012949 log D − 0.145884 = 0.21191` against `0.21520`; the source's single-`ρ` form `0.25110`, closing only from `log D ≥ 729.4` | sound (source error) | — |
| 1.1 Lemma 8.1 sign | `f = 1_{n=3}`, `k = 1`, `D₀ = 2`, `D = 4` | `+k∫`: `0.79248 + 0.20752 = 1 = M₀(f, 4)`; `−k∫`: `0.58496` | sound (source misprint) | — |
| 1.8 Daval's identity | `(x, y) = (10, 3), (37.5, 5.2), (100, 10)` | `−N(x)` and the right side: `1.252763`, `3.623167`, `−10.017411` (each equal to `10⁻¹⁴`); `(0.571·160 383)² = 8.3867·10⁹` | sound | — |
| 1.10 ratio for `R₂*` | `X = 2.1·10¹⁰`; `X = 394 385²` | `2.732·10⁻⁴ + 4.42·10⁻⁶ + 1.542·10⁻⁴ + 1.297·10⁻⁵ + 0.010 = 0.010445 ≤ 0.011`; `1.93 log X/√X = 9.695·10⁻⁴` at `1.8·10⁹`; with §4.2's input `0.011660 > 0.011` | sound | — |
| 2.3 thresholds | `[1, 1.2·10⁶]` | last `|m| > 1/100` at `1418`, last `(log x)|m| > 1/20` at `3354`, `> 1/65` at `96 017`; `m(6) = 0.1333`, `m(7) = −0.0095`; `m(40) = 0.0505`, `m(41) = 0.0261`; `|m(32)| = 0.0627 > 0.0548`; `|m(463 421)| = 0.00051541 ≤ 0.00051624` | sound | — |
| 2.3 Lemma 2.4 | `x = D₀`, and `x/D₀` up to `e^{24}` | function `0.000703` / `0.001355` (`58 909 800` / `113 556 832`); limit `0.0013297`; Theorem 1.2 slack `≥ 0.00084`; exact integral `39.08` against `54.60` / `105.26` | statement sound, route inconsistent | R02 |
| 2.4 | `q = 2`, `x = 10`; `C₁`; de Camargo at `q = 1` | `m₂(10) = 34/105 = 0.32381 ≥ 0.32310` (the printed `31/105 = 0.29524` fails); `C₁ = 12 554.88`; `(log 3)/2 = 0.5493 > 0.3055` | sound | — |
| 2.6 | `X = 617 990` | `4.329·10⁻⁴` against Ramaré's `5.175·10⁻⁴` and Daval's `9.755·10⁻⁴` | sound | — |
| 6.1 | `f = 1`, `y = 2, 3`; `f = τ`, `y = 2` | `3/2 = 3/2`; `11/6 ≤ 2`; `2 ≤ 4` | sound | — |
| 6.2 | `f ≡ 1`, `z = 2`, `y = 2` | `S = 0.34657`, `K(2) = 0.19315`; upper `0 ≤ 1.6488`, lower `2 ≥ 0.3512`; `K(7) = 1.0888 ≥ 1` | sound | — |
| 6.3 (headline `sum_le_hall_tenenbaum`) | `f = 1`; `f = 2^ω` | `A = log 4`, `B = 1.982334`, `A + B + 1 = 4.368629`; `2B = 3.964669` | sound | — |
| 6.4 | `f = τ`, `x = 2`; `f = μ²` | `3 ≤ 4`; negative control `2 > 1.5` | sound | — |
| 6.5 | `f = 1`, `d = 2`, `x = 4` | `3 ≤ 4 ≤ 6`; with `x·d`: `11` | sound | — |
| 7.8 | 8.4(b) against 7.2; `Q₃(239)` | 8.4(b) is smaller from `x = 5.1635·10¹⁰` while `log x < 4.756·10¹⁵`; `Q₃(239) = 202`, `239/ζ(3) = 198.826`, ratio `1.2741` | sound | — |
| 8.1 (headline `mertens_product_explicit`) | `x = 24 284` | `1/log³ x + 1/(x − 1) = 1.0125·10⁻³ < log(1 + 1/(2 log² x)) = 4.892·10⁻³` | sound | — |
| 8.1 (headline `mertens_product_axler`) | `x = 392 686, 392 687, 46 909 074` | margins `−5.85·10⁻¹²`, `4.70·10⁻¹³`, `1.68·10⁻⁶`: `392 687` is the least integer threshold | sound | — |
| 9.1 (headline) | `k = 9` | `9 log θ(p₉)/θ(p₉) = 1.384013` with `θ(p₉) = 19.223099` | sound | — |
| 9.2 (headline) | `n = 6 983 776 800` | `τ = 2304`, `f₂ = 1.537940` (`> 1.5379`, `< 1.538`) | sound | — |
| 9.3 | `M₁`; Robin at `12`; Ivić; Eum–Koo | `σ(M₁)/M₁ = 8.504414`, ratio `2.5979075`; `0.6482136`; `8 < 12.07`, `28 < 28.29`, `12 > 9.06`; `σ*`: `32 < 71.39`, `72 > 68.55`; `32 > 31.2314` at `21` | sound | — |
| 9.4 (headline) | `N₉ = 223 092 870` | `n/φ(n) = 6.112911`, `log log n = 2.956113`, constant `2.5063693 < 2.50637` | sound | — |
| 3.1 (headline) | `x = 1`; minimum of `x`·polynomial | `−1` (printed `6 − 4γ` gives `−2`); minimum `−1.071149` at `1.17115` | sound | — |
| 5.2 (headline) | `t = 0.01`; `sup_{(0,1)}` | `5.766253 > 5.384243`, `≤ 7.616847`; `sup |P| t^{1/3} = 1.640819` at `u = 7.216`; `γ² − 2γ₁ = 0.4788096` | sound | — |
| 2.1, 2.2, 5.1 (headlines, carried) | `S = ∅`; `x = 2`; `h = δ` | `1 = 1`; `1/2 ≤ 1.5833`; the conclusion is the hypothesis | sound | — |

**Library declarations opened at the pins.**

- Mathlib:
  - `Mathlib/NumberTheory/LSeries/Dirichlet.lean` lines 69, 312 and 322 (`LSeriesSummable_moebius_iff`, `LSeries_one_eq_riemannZeta`, `LSeries_one_mul_Lseries_moebius`);
  - `Mathlib/NumberTheory/EulerProduct/Basic.lean` line 142;
  - `Mathlib/NumberTheory/PrimeCounting.lean` line 133 (`primesLE n = primesBelow (n + 1)`).
- Tau Ceti:
  - `TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/Formula.lean` line 229, with hypothesis `hoff : ∀ n, f n ≠ 0 → x ≠ n` and the sum over `Ico 1 ⌈x⌉₊`, as the contract says;
  - `TauCeti/NumberTheory/LFunctions/Mertens.lean` lines 545 and 564;
  - `TauCeti/NumberTheory/ArithmeticFunction/DivisorBounds.lean` line 52.

**Cross-roadmap citations, resolved at the current heads (34).**

- ExplicitZetaBounds at `fcc94b0`, pushed after the previous review:
  - §0.2 (lines 421–437) and §0.4 (lines 512–535, `RH(3 000 175 332 800)` recorded);
  - §4.1 (line 1166) and §4.3 (line 1229);
  - §6.1 (line 1794);
  - §7.3 (lines 2064–2160: the `5.558691` instance given `RH(3·10¹²)` for `|γ| ≥ 2`);
  - §7.10 (lines 2454–2540: `1237 (log t)^{11/12}` for `t ≥ H₀`; `29.388 log t` on `σ = 1` for `t ≥ 2`; `e^{146} log t` on `σ ≥ 3/4` for `14 ≤ t ≤ H₀ − 1/2`; each given `RH(H₀)`).
  - Its first §7.10 item now needs `RH(30 610 046 000)`; this roadmap does not use that item.
- ExplicitPrimeCounting at `d7232a7`, unchanged since the previous review:
  - §1.1 (lines 891–904, `RH(H)` as ExplicitZetaBounds §0.2's);
  - spot-checked §1.3 (line 1081) and §3.2 (lines 2153–2154);
  - §§0.1, 1.6, 1.7, 3.3, 3.5, 4.2, 4.3, 4.7, 5.3, 6.1 and 6.3 as resolved in the previous review.
- ExplicitCharacterSumsAndSieves at `7dbb08f`: §5.1 (lines 1277–1290, `selbergDiagonal` and the coprime comparison).
- AnalyticNumberTheoryPartI at `2b9b7af`:
  - §§0.8 (line 292), 0.11 (326), 0.19 (564), 0.21 (584), 0.26 (661) and 0.34 (805);
  - §§3.1 (1942), 3.7 (2029), 3.9 (2071), 3.11 (2093), 3.12 (2103), 3.22 (2318), 3.22a (2330) and 3.22b (2336);
  - §3.23a (2363; `BBRFiniteInput` at line 2385, whose first and fourth conjuncts are as the README says);
  - §3.35 (2916) and §3.35a (2928).
- SieveMethodsAndPrimePatterns at `39cf901`: §0.5 (line 490) and §1.1 (line 992).
- ZerosOfLFunctions on main: Layer 9 (line 1586), *AllOnCriticalLine* (line 1619).
- `overlaps.md` and `citations.md` list nothing. No id of this roadmap that ExplicitNumberFields or ProbabilisticAndMetricNumberTheory cites is renumbered.

**Ownership against open pull requests.**

- `roadmaps grep` for `10.175`, `1719 log`, `4/(σ − 1/2)` and `33.56` finds them only in this README.
- Items (a)–(c) bound `ζ'/ζ` and `1/ζ`, which this roadmap defers to ExplicitZetaBounds (Scope lines 130–136). A supplier gap is therefore the right form; R01 concerns only how the gap is declared.

**Declared gaps.**

- The plan has 17 slugs. The README states contracts for six: the five ExplicitPrimeCounting ones, unchanged and precise, and `zeta-reciprocal-bounds` (R01).
- The other 11 slugs resolve to the ExplicitPrimeCounting sections listed above, at the same head as in the previous review.

## Not verifiable

- `leeLeong2022` is uncertified and not in the sources cache. These locators were not opened:
  - (9), (17), Table 1 and (43);
  - the claim of lines 1757–1759 that the proof of Lemma 5.1 (p. 19) bounds the segment at height `H₀` by `1237`.
  - The README's replacement join was recomputed instead (table).
- `leong2026` (Corollaries 3–4, Tables 2 and 4, "line 78") was fetched but is image-only, and OCR is not available on this worker. Its `[[missing]]` entry in `needs-references.toml` is kept, and nothing is added.
- `ramare1995` Lemma 3.1 has its display as an image, and `vanLintRichert1965` lines 52–95 is garbled OCR. 6.5 was re-derived instead.
- These uncertified sources were cited by locator and not opened, and the numbers from them were recomputed where possible:
  - `daval2023` (1.8) and `ramareZunigaAlterman2025` (1.10, 2.6);
  - `hallTenenbaum1988` and `bordelles2024` (6.3), and `bordelles2012` (6.1, 6.4);
  - `chirreHelfgott2025`, `mossinghoffOliveiraESilvaTrudgian2021` and `kumchevEtAl2023` (7.8);
  - `robin1984`, `axlerNicolas2023` and `eumKoo2015` (9.3);
  - `deCamargo2025` (1.6, 2.4);
  - `dress1993`, `dressElMarraki1993` and `cohenDressElMarraki2007` (1.3, 1.5).

## Source issues

- **Misprint** in ramare2013aa at (7.1)–(7.2), pp. 11–12 (lines 590 and 632): the source says the constant is `+2γ` and the boundary term `+R₂*(K) M(D/K)`; it should be `−2γ`, from its (3.4), and `−R₂*(K) M(D/(K + 1))`, with the first sum over `d ≤ D/(K + 1)`; affects nothing.
- **Misprint** in ramare2013aa at Lemma 8.1, p. 13 (line 697, and its proof at line 704): the source says the integral enters with `−k`; it should be `+k`, since at `f = 1_{n=3}`, `k = 1`, `D₀ = 2`, `D = 4` only `+k` gives `M₀(f, 4) = 1`; affects nothing.
- **Error** in ramare2013aa at the proof of Lemma 7.2, p. 12 (lines 638–643): the source says `0.0213((6/π²) log(D/K) + 1.166) + 0.03739 ≤ 0.0130 log D − 0.144` for `D/K ≥ 2 160 535`; at `D = K·2 160 535` this reads `0.2511 > 0.2152`; it should split `R₂*` by size, which gives `0.2119`; affects the proof.
- **Error** in ramare2013aa at Lemma 4.5, p. 6 (line 251): the source says `|ψ̃(x) − log x + γ| ≤ 0.0067/log x` for `x ≥ 23`; at `x = 23` the left side is `0.0530` and the right `0.0021`; it should be `x ≥ 1 520 000`; affects the proof.
- **Gap** in ramare2015mc at the proof of Theorem 1.2 and Lemma 2.4, pp. 1366–1367 (lines 480 and 545): the source says the range `t ≥ x/D₀` contributes at most `58 909 800/x`, the integral of `M` over `{M ≥ 0}` only; it should cite `∫|M| ≤ 113 556 832` or justify the bound, which holds numerically (`39.08 ≤ 54.60` at `x = D₀`); affects the proof.
- **Misprint** in ramare2015mc at (1.7), p. 1364 (line 329): the source says `|m₂(10)| = 31/105`; it should be `34/105`, the only value consistent with the bound `0.260·2/log 5` on the same line; affects nothing.
- **Error** in macleod1969errata at the corrected (5), p. 1 (lines 14–17): the source says `|M(x)| < (x + 1)/80 + 11/2` strictly for all `x`; at `x = 199` both sides equal `8`; it should be `≤`; affects a stated result.
