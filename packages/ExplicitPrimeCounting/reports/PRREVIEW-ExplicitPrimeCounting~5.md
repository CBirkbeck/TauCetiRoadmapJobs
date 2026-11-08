# Review of ExplicitPrimeCounting (pull request #1945 at d7232a7)

**Verdict:** needs changes

Eight findings: three P2 and five P3.

- All five findings of the previous review are repaired (see the table under Verified sound).
- The gate passes; the dependency check reports 0 problems.
- `Suggested.lean` elaborates with `sorry` as its only warning.

R01 and R03 are new. They come from reading the Brent–Platt–Trudgian, Rosser–Schoenfeld, Dusart and Faber–Kadiri texts against the general theorems that the README attributes to them. R02 is supplier drift: ExplicitZetaBounds now states Ramaré–Rumely's region in its §7.5 (its head `bd1ac3ea`), while this README still owns the region as a zero input.

## R01 (P2) — The Brent–Platt–Trudgian weighted zero sum is restated without its convexity hypothesis

**Location.** `TauCetiRoadmap/ExplicitPrimeCounting/README.md`:

- line 471, the contract of `gap:lehman-weighted-zero-sum`: "for `φ` with a continuous derivative, nonnegative and non-increasing on `[T₁, T₂]` with `T₁ ≥ 2π`";
- lines 1391–1395 (§2.1), which repeat the same hypotheses for the error `2(2.067 + 0.059 log T₁)|φ′(T₁)| + (0.059 + 1/150) φ(T₁)/T₁`.

**Claim.** Under these hypotheses the statement is false. Brent–Platt–Trudgian's Lemma 3 also assumes `φ″ > 0`. Without convexity the error `E₂ = −∫ φ′Q` is not controlled by `|φ′(T₁)|`.

ExplicitZetaBounds §5.4 already states the correct form: `C²` on `[T₀, ∞)` with `φ ≥ 0`, `φ′ ≤ 0`, `φ″ > 0` and `2π ≤ T₀ ≤ T₁ ≤ T₂`. It also states Lehman's Lemma 1, which is the gap's second item. So the gap asks only for what §5.4 provides, plus the false weakening.

**Witness.** `brent-platt-trudgian-2021` (arXiv v1) lines 176–177: Lemma 3 refines Lehman's lemma "if the conditions φ′(t) ⩽ 0, φ′′(t) > 0 are satisfied". Counterexample:

- take `φ = 1` on `[14, 20.5]`, decreasing in a `C¹` way to `0` on `[20.5, 21]`;
- the stated bound is `0.0657/14 = 0.00469`;
- but `|E₂| ≥ 0.471`, since `Q` lies in `[−0.566, −0.471]` there.

**Repair.**

1. At line 1393, add "`C²`, with `φ′ ≤ 0` and `φ″ > 0`". Use the ordinate sum with half weight at an ordinate equal to `T₁` or `T₂`, as in the source.
2. Replace the gap text by a contract "From ExplicitZetaBounds §5.4" quoting both forms as that section states them. If the gap stays declared, correct its `needs` to the convex form.
3. Check that each weight in a route using the refined form is convex; route any non-convex weight through Lehman's form.

Tested:

- The counterexample has `φ″ < 0` where the drop begins, so the corrected hypothesis excludes it.
- The §2.1 Check weight `φ(t) = t⁻²` has `φ″ = 6t⁻⁴ > 0`, so it is kept.

## R02 (P2) — Ramaré–Rumely's region now has two owners

**Location.** README line 88: "Ramaré–Rumely's region with the constant `C₁(χ, H)` (*RamareRumelyRegion*, §6.1)" is listed under Owned here. Line 411 lists it among the inputs that ExplicitZetaBounds leaves here. Lines 3409–3411 say: "ExplicitZetaBounds leaves this region, which the source proves inside its own argument, to the theorem using it". It also appears at lines 3381, 3423, 3434, 3439 and 3779.

**Claim.** The README no longer matches ExplicitZetaBounds at its head `bd1ac3ea`:

- §7.5 there now states the region (fifth item, Ramaré–Rumely's Theorems 3.6.2–3.6.3, `ramare-rumely-1996` lines 795–848). For `χ` primitive of conductor `k` and `H ≥ 1000`, it gives `1 − β ≥ 1/(R log(k|γ|/C₁(k, H)))` for every zero with `|γ| ≥ H`.
- Its "Not owned here" says "Ramaré and Rumely's region … is 7.5".
- Its Downstream consumers lists the region among the items this roadmap takes from §7.5.
- The plan's `gap:dirichlet-zero-free-constants` asks for exactly this item. Yet the README's contract for that gap (line 459) omits it and owns it here instead.

An object owned by two open roadmaps is P2. The earlier roadmap, ExplicitZetaBounds, is the owner.

**Witness.** ExplicitZetaBounds README §7.5, fifth bullet: "for `H ≥ 1000`, every zero with `|γ| ≥ H` satisfies `1 − β ≥ 1/(R log(k|γ|/C₁(k, H)))`". The same section also covers imprimitive characters: their extra zeros lie on `Re s = 0`.

**Repair.**

1. Delete the zero input *RamareRumelyRegion*:
   - from Owned here (line 88);
   - from the preamble at line 411;
   - from §6.1 (lines 3400–3411);
   - from the Layer 6 Dependencies (line 3779).
2. Add §7.5's fifth item to the list "consumed exactly as that roadmap states them", and restore it to the contract of `gap:dirichlet-zero-free-constants`, as `plan.json` already has it.
3. In §6.1, keep the modulus form as a lemma proved from §7.5. For every `χ` modulo `q` and `|γ| ≥ H`, `1 − β ≥ 1/(R log(q|γ|/C₁(q)))`. This holds because the conductor `k` divides `q` and Dusart's `C₁(q) ≤ C₁(k, H)` (`dusart-2002` lines 105–112).

Tested on `k = q = 3`, `H = |γ| = 10⁴`, `C₁ = 20.92`:

- the README's form gives `1/(9.645908801 log(3·10⁴/20.92)) = 0.014264`;
- §7.5's Check gives `0.014264` for the same instance.

## R03 (P2) — §3.1(b) and (c) omit hypotheses of their sources, and two zero computations are unnamed

**Location.**

- README line 1850, §3.1(b): "Let `A > 0` with `RH(A)`, `R > 0` with the Rosser–Schoenfeld-shape region …".
- Lines 1860–1864, §3.1(c): "Let `H` with `RH(H)`, `R₀` with the classical-shape region, … and `b₀ > 0` with `b₀ < m R₀ (log H)²`".
- Line 2056: Schoenfeld's Theorem 11 "uses `RH(1 894 438.5)`, implied by `RH(545 439 823)`".

**Claim.**

- **(b).** Rosser–Schoenfeld's and Dusart's `ε(b, m, δ)` is valid only when `A` satisfies `N(A) = M(A)`. The boundary term `−R(A)φ_m(A)` in `Ω₂` uses that equality. `RH(A)` does not imply it: ExplicitZetaBounds §0.4 notes that `RH(H)` "says nothing about how many there are". The instances need two recorded counts, and no layer, gap or supplier section states either:
  - `N(545 439 823.215) = 1 500 000 001`, for *DusartThesisTable*, *Dusart1999Row* and §§3.2, 3.3, 5.3 and 7.1;
  - `N(1 894 438.51224) = 3 502 500`, for Schoenfeld's Theorem 11.
- **(c).** The corrigendum's theorem has three hypotheses that the README drops:
  - `T₀ ≤ T₁ < H`;
  - `R₀ ≥ 1`;
  - a computed `s₀ ≥ ∑_{0<γ≤T₀} 1/γ`, which enters `ε` through `B₁(T₁) = s₀ + …`.

  *FaberKadiriTable* uses Best's computation `s₀ = 11.637732` at `T₀ = 1 132 491` without naming it. The Summary promises that every such computation is a named proposition.

**Witness.**

- (b): `rosser-schoenfeld-1975` line 548: "as N(A) = F(A), we have". Also `dusart-1999-mc` lines 64–69 and `dusart-1998-thesis` lines 664 and 705 ("car N(A) = F(A)").
- (c): `faber-kadiri-2018-corrigendum` lines 21–25; `faber-kadiri-2015` lines 365–366 and 714.

**Repair.**

1. In (b), write "`A > 0` with `RH(A)` and `N(A) = M(A)`".
2. In (c), add "`T₀ ≤ T₁ < H`, `R₀ ≥ 1` and `s₀ ≥ ∑_{0<γ≤T₀} 1/γ`", and make `ε` depend on `(T₀, s₀)`.
3. In §1.1, state the three computations as `Prop`s with their data, as `ZetaZeroReciprocalSum` is stated. Alternatively, declare them as gaps on ExplicitZetaBounds §0.4. The three are:
   - `N(545 439 823.215) = 1 500 000 001` (`van-de-lune-te-riele-winter-1986` lines 13–14);
   - `N(1 894 438.51224) = 3 502 500` (`rosser-schoenfeld-1975` lines 52–54);
   - `∑_{0<γ≤1 132 491} 1/γ ≤ 11.637732` (`faber-kadiri-2015` line 714).
4. Add them to the hypotheses of the instances and table propositions listed above, and to Faber–Kadiri's and Trudgian's instances in §3.4.

Tested:

- `M(545 439 823.215) = 1 500 000 000.999` and `M(1 894 438.51224) = 3 502 499.99999`, so the new hypothesis is exactly the recorded count at each source's `A`.
- For (c), `s₀` enters the error function directly (`B₁(T₁) = s₀ + …`, `faber-kadiri-2015` line 470, inside the `x^{−1/2}` term of line 423). The only theorem bound available, Johnston–Yang's Lemma 2.5 `(1/4π) log²(T₀/2π) = 11.655`, exceeds Best's `11.637732`. The printed rows were computed with the computed value, so that value is an input of the rows.

## R04 (P3) — The Massias–Robin locator does not say what it is cited for

**Location.** README lines 3201–3203: "the constant `1` is admissible in the lower bound for `p_k ≤ e⁵⁹⁸` and for `p_k ≥ e¹⁸⁰⁰`, the intermediate range being the one their method could not then close (lines 163–166 describe the iteration over `[600, 1800]`)".

**Claim.** Lines 163–166 of `massias-robin-1996` belong to the proof of its Lemma 3.2 (line 141). That lemma verifies inequality (iii) of Théorème A on `e⁵⁹⁸ ≤ p_k ≤ e¹⁸⁰⁰`. The iteration therefore covers the intermediate range for a different inequality, and gives no evidence of a gap. The two ranges for the constant `1` are stated at `dusart-1999-mc` lines 30–32, which reads them in `k` ("2 ≤ k ≤ exp(598) and k ≥ exp(1800)").

**Witness.** `massias-robin-1996` line 141: for `e⁵⁹⁸ ≤ p_k ≤ e^{b₁}` "les inégalités du (iii) du théorème A sont vérifiées". `dusart-1999-mc` lines 30–32.

**Repair.** Cite `dusart-1999-mc` lines 30–32 for the two ranges, and say whether the bounds are on `k` or on `p_k`. Delete the parenthetical about lines 163–166.

## R05 (P3) — Rosser–Schoenfeld's (3.20) is stated with `1/log x` instead of `1/log² x`

**Location.** README line 2732 (§4.1): "`∑_{p ≤ x} 1/p < log log x + B + 1/log x` for `x > 1`". The Check at line 2741 uses `0.4343 = 1/log 10`.

**Claim.** The README states a weaker form than the source. Rosser–Schoenfeld's (3.20) has `1/log² x`, and the line-numbered text drops the superscript. The same extraction prints (3.18) as `1/(2 log x)` (`rosser-schoenfeld-1962` line 282), although the README itself quotes it as `1/(2 log² x)` at line 2885. Stating a weaker form than the source narrows the statement below what the source supports.

**Witness.**

- The `log²` form is sharp. Computed over every prime up to `1.3·10⁶`, its least margin is `0.0013`, at `x = 19`: `∑_{p ≤ 19} 1/p = 1.45548` against `log log 19 + B + 1/log² 19 = 1.45676`.
- The `1/log x` form never comes within `0.07` of the sum.

**Repair.** State (3.20) with `1/log² x`. Recompute the Check at `x = 10`: `0.8340 + 0.2615 + 0.1886 = 1.2841 > 1.1762`.

## R06 (P3) — *BroadbentRow* misnames Fiori–Kadiri–Swidinsky's bound and duplicates *FioriKadiriSwidinskyPsiRow*

**Location.**

- README line 1928: "*BroadbentRow* (`fiori-kadiri-swidinsky-2023` lines 151–154, Remark 2)".
- Line 1938: "It is the same bound as *BroadbentRow* …, with its own proof".
- The name is also used at lines 2225, 2231, 2268 and 2337–2341.

**Claim.** Remark 2 quotes "[8, Corollary 1.3]". Reference [8] is Fiori–Kadiri–Swidinsky's paper on `ψ` (`fiori-kadiri-swidinsky-2023` line 775), that is `fiori-kadiri-swidinsky-2023-psi`. The bound is therefore not Broadbent et al.'s, and it has no proof separate from *FioriKadiriSwidinskyPsiRow*. The README gives one statement two names.

**Witness.** `fiori-kadiri-swidinsky-2023` lines 151–154 (`A_ψ = 121.096`, `B = 3/2`, `C = 2`, `x₀ = 2`, "by [8, Corollary 1.3]") and line 775 ("[8] A. Fiori, H. Kadiri, and J. Swidinsky, Sharper bounds for the Chebyshev function ψ(x)").

**Repair.** Delete *BroadbentRow* and use *FioriKadiriSwidinskyPsiRow* at each place it occurs. Cite lines 151–154 as the quotation of the `ψ` paper's Corollary 1.3, in its `(A_ψ, B, C, R) = (121.096, 3/2, 2, 5.5666305)` form.

## R07 (P3) — ExplicitZetaBounds §7.9 has three instances, not two

**Location.** README line 1311: "Both are the two instances of ExplicitZetaBounds §7.9."

**Claim.** At its head, §7.9 also proves *HasLandauSiegelGap* `(1/100) ∞` (Guo's theorem, unrefereed). That instance implies *BanksGap* by antitonicity.

**Witness.** ExplicitZetaBounds README §7.9: "Prove *HasLandauSiegelGap* `(1/100) ∞` (Guo, Theorem 1.1 …) … By antitonicity it implies Banks's instance."

**Repair.** Write "two of the instances of ExplicitZetaBounds §7.9". If Guo's instance is used, §6.7(b) keeps its conclusion: `1/100 < 1/9.645908801 = 0.1037`.

## R08 (P3) — The Platt–Trudgian row value in §3.1's Checks is miscomputed

**Location.** README line 1981: "`461.9 · (1000/5.573412)^{1.52} exp(−1.89 √(1000/5.573412)) = 1.27·10⁻⁵`".

**Witness.**

- `(1000/5.573412)^{1.52} = 2666.2` and `exp(−25.316) = 1.0122·10⁻¹¹`.
- Their product with `461.9` is `1.2465·10⁻⁵`.
- The Worked examples (line 4202) round the same product to `1.2·10⁻⁵`.

**Repair.** Write `1.25·10⁻⁵`.

## Verified sound

### Repairs of the previous review (read at `3630d41`)

| Finding | Status | Where in this head |
|---|---|---|
| R01: Cully-Hugill–Lee's density at `3·10¹²` | Repaired | Zero input *CullyHugillLeeDensity* at lines 3909–3918: (4.72)–(4.73) at `H₀ = 3 000 175 332 800`, `10⁹/H₀ ≤ k ≤ 1`, `H ∈ [1002, H₀)`. It is in Owned here (line 86), in §7.3's hypotheses (lines 3885–3886) and in the Layer 7 Dependencies (line 4165). Values: `cully-hugill-lee-2022` lines 613–614 (`5.8773`, `3.869`, `σ₀ = 0.7804`); recomputed below |
| R02: Johnston–Yang's region and density | Repaired | `R₀ = 5.5666305` (line 2222, `johnston-yang-2023` lines 224 and 284). Region `ν₂` for `X ≥ 10⁵` (lines 2273–2283), via ExplicitZetaBounds §7.2 in its `log 0.618` form (contract at lines 441–444). §3.6 uses *JohnstonYangDensityTable* (line 2554). Table rows checked at `johnston-yang-2023` lines 98–113 |
| R03: truncated explicit formula unowned | Repaired | §2.1 states Cully-Hugill–Johnston's Theorem 1.2 (lines 1398–1421) from ExplicitZetaBounds §6.1 (contract at lines 434–440), with the Dudek shape as a consequence. §3.1(d) is the Pintz form. Johnston–Yang's stronger `4.3128 x/(T log^{0.6} x)` is a zero input (lines 2287–2294, `johnston-yang-2023` lines 168–187). Line 141 is corrected (now lines 145–151) |
| R04: `2.15·10¹⁰` | Repaired | Line 4127 now gives `2.1529·10¹⁰` (computed `2.152853·10¹⁰`) |
| R05: Faber–Kadiri's `σ₀` | Repaired | Lines 2169–2178 use the `σ₀` of each row with `faber-kadiri-2015` Table 2 (line 838: `0.4617, 0.6644, −340 272` at `0.89`; also `kadiri-2013-density` line 659). The left/right column rule matches `faber-kadiri-2018-corrigendum` lines 90–93 |

### Gate, build, signatures

- **Gate**, rerun at `d7232a7`: every check `0`, "OK", exit 0.
- **Diff outside the folder:** none (`git diff --stat origin/main...HEAD` restricted to other paths is empty).
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 15 "declaration uses `sorry`" warnings and nothing else.
- **Signatures:** a scratch copy with `#check @name` for all 32 declarations elaborates with no error. The elaborated types match the README statements, and each theorem carries its hypotheses in its own signature, so no binder is lost.
- **Suggested.lean changes:** since `3630d41` only the module docstring changed.
- **Dependency check:** `depcheck: 244 roadmaps, 2465 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- **Merge order:** this roadmap is at 271, after ExplicitZetaBounds (270), SieveMethodsAndPrimePatterns (269), EffectiveClassNumbers (248), ComputationalNumberTheory (193) and AnalyticNumberTheoryPartI (90). SpecialFunctionsEiLiErfIncompleteGamma is a new-roadmap pull request by another author, and the description names it.

### Headlines and padding

- **Statability.** The end theorems at lines 31–58 are stated, except those the module docstring names as resting on table propositions:
  - Rosser–Schoenfeld;
  - Broadbent–Kadiri–Lumley–Ng–Wilk;
  - Fiori–Kadiri–Swidinsky;
  - Bennett–Martin–O'Bryant–Rechnitzer.
- **No padding.** No theorem closes by one tactic: each needs the transfer or route its README section describes.
- **No new definitions.** None was added since the last review.

### Adversarial table

Values were computed with sieves to `2.1·10⁷` and with the series for `li`.

| Statement | Instance | Values (each side) | Result | Change |
|---|---|---|---|---|
| §0.2 `C(q, a)` | `q = 1`; `q = 2`; `q = 4` | `−γ`; `−γ − log 2 = −1.2704`; `C(4,3) − C(4,1) = −½(χ₄(3) − χ₄(1)) L′/L = L′/L(1, χ₄)`; matches `ramare-2002` line 81 | holds | none |
| §0.4 identity | `x = 2` | `(log 2 − 2)/log 2 + 2/log 2 = 1 = π(2)` | holds | none |
| §0.7 identity | `x = 1` | both sides `−∫₁^∞ E/t²`, since `E(1) = −1/φ(q)` | holds | none |
| `ButheVerified`, `θ` clause | `x = 1426.4`, `1426.9` | `73.577 < 73.647`; `74.077 > 73.660` (`θ(1423) = 1352.8227`) | the start `1427` is needed | none |
| `Buthe2016Range`, `π*` clause | `x = 96.28`, `96.9`, `97` | `1.7817 < 1.7831`; `1.9174 > 1.7914`; `0.9392 < 1.7927` | the start `97` is needed | none |
| *Robin1983Range* | `k = 7022`, `8601`, `8602` | `70 919 > 70 918.61`; `88 807 > 88 805.00`; `88 811 < 88 816.44` | the start `8602` is needed | none |
| `vanlalngaia_sum_inv_prime` | `x = 2`, `1000`, `24 284` | `0.6050 ≤ 12.01`; `0.003938 ≤ 0.006978`; `0.00097075 ≤ 0.00097129` | holds; sharp | none |
| §4.3 transfer (`k = 3`, `η = 1`) | `x = 89 967 803` | `1/3 + 5/(4 · 18.315) = 0.4016 ≤ 0.41` | holds | none |
| §2.6 `C_T` | `T = 3·10¹²` and `3·10¹² + 1 + π/3` | `113.66888` both, against `113.67`; `π/(T − 1) + π²/(3T²) − π/(3·10¹²)` of order `−10/T³ < 0` | holds | none |
| `dusart_of_zeroFreeRegion` | `R = 5.69693`, `log x = 400`, `10⁴` | `X = 8.3793`, `ε = 1.0604·10⁻³`; `6.585·10⁻¹⁸`; `8/R` read at `dusart-2016` lines 471 and 531, `8R` at line 79 | holds as corrected | none |
| §3.1(b) | `A = 545 439 823.215` | `M(A) = 1 500 000 000.999`; `N(A) = F(A)` used at `rosser-schoenfeld-1975` line 548 | hypothesis missing | R03 |
| §3.1(c) | `T₀ = 1 132 491` | `s₀ = 11.637732` (computed) against the theorem bound `(1/4π) log²(T₀/2π) = 11.655`; `s₀` enters `B₁(T₁)` (`faber-kadiri-2015` line 470) | input missing | R03 |
| §3.1(d), Platt–Trudgian row | `X = 1000` | `461.9 · 2666.2 · 1.0122·10⁻¹¹ = 1.2465·10⁻⁵` against the Check's `1.27·10⁻⁵` | Check wrong | R08 |
| §3.1 density row | `T = 3.061·10¹⁰` | row `0.89`: `1.413·10¹⁰`; row `17/20`: `1.702·10¹⁰` | holds | none |
| §3.2–3.3 Dusart table | rows `b = 22`, `30` | `2.78652·10⁻⁴ · 23 = 6.409·10⁻³` (`dusart-1998-thesis` line 848); `0.978·10⁻⁵ · 600 = 5.868·10⁻³` (line 851) | holds | none |
| §0.5, `ε₀(e¹⁰⁰)` | `x = e¹⁰⁰` | `0.027754` | holds | none |
| §3.4 `ν₂` | `t = 3`; `log t = 91.2853`; `t → ∞` | `ν₂ = 0.0849`; `ν₂ log t = 0.179642 = 1/5.5666305`; Ford's `log 0.618` width `2.3585·10⁻³` against `1.9679·10⁻³`; ratio tends to `6 · 0.04962 · 3.359 = 1.000041` | holds | none |
| §3.4, Johnston–Yang's first bound from Fiori–Kadiri–Swidinsky | `x = 2`, increasing | ratio `1.03008` | holds | none |
| §3.4 | `x = 2` | `9.39 · 2 · 0.57391 · 0.50216 = 5.412 ≥ 1.31`; the bound is at least `x` for `log x ≤ 137.37` | holds | none |
| §3.6, Johnston–Yang's Theorem 1.4 | `x = 23`; `[59, 5000]`; `[71, 2·10⁵]`; `x = 71` | `ψ`: `0.599 ≤ 3.273`; `θ`: `3.777 > 3.399`; `π`: `1.884 > 1.124`; no failure on either range; `3.597 ≤ 4.212` at `71` | thresholds `59` and `71` needed, as the README states | none |
| §4.1 (3.20) | every prime up to `1.3·10⁶` | margin with `1/log² x` at least `0.0013` (at `19`); with `1/log x` at least `0.071` | the README form is weaker | R05 |
| §4.3, Vanlalngaia's Corollary 2 | `R = 5.5666305`; `R = 5.69693` | `814R = 4531.24`, `1.6R^{−1/4} = 1.04165`, `1/R = 0.17964`; `814R = 4637.30 > 4635` | holds by the README's route | none |
| §4.6 | `r₀(α)` at `α = 1`, `0.5`, `0.15`; coefficients | `1.14450`, `1.43777`, `2.10866`; `592 · 0.15 + 168 = 256.8`, `/384 = 0.66875`; `3207/1944 = 1069/648` | holds | none |
| `dusart_nth_prime_lower` | `2 ≤ k ≤ 10⁶`; `log k = 1792.5`; `log k = 493.8` | least margin `4.148`, at `k = 4`; `1.71769·10⁷ > 1.6571·10⁷`; `0.00821 > 0.0077660` | holds | none |
| §6.1 region | `k = 3`, `|γ| = 10⁴`, `C₁ = 20.92` | `0.014264`, the same as ExplicitZetaBounds §7.5 | duplicate | R02 |
| §6.6, nested regions | `q = 10⁵` | `0.986637` against `0.986503` | holds | none |
| §6.6, Kadiri's Table 1 | `q₀ = 5·10⁴` | `19.228`, `15.550`, `12.245`, `9.4357`, `6.9684`, `4.8430` (`kadiri-2008` lines 148–154) | matches | none |
| §7.3, *CullyHugillLeeDensity* | `T = 3 000 175 332 800`, `σ = 0.78`, `0.7802`, `0.7804` | `1.27574·10¹³`, `1.25466·10¹³`, `1.23392·10¹³` against `P + R = 1.23632·10¹³` | the split `0.7804` holds | none |
| §7.3, the `0.75` row of the §8.3 density | `T = 3·10¹²` | `1.395·10¹⁴` against `1.276·10¹³` | holds | none |
| *RamareRevisedDensity* | `σ = 0.9`, `T = H₀` | `2.152853·10¹⁰` | holds | none |
| `gap:lehman-weighted-zero-sum` | `φ` a step on `[20.5, 21]`, `T₁ = 14` | `|E₂| ≥ 0.4706` against the bound `0.00469` | false as written | R01 |
| `brun_titchmarsh` | `k = 1`, `x = 1.9`, `y = 3.2` | `3 ≤ 6.4/log 3.2 = 5.502` | holds | none |
| `leeNosal_of_riemannHypothesis` | `x = 101`; `x → 101⁻` | `2.340 ≤ 5.6947`; `6.955 > 5.695` | sharp | none |
| `leeNosal_theta_of_riemannHypothesis` | `x = 2657`, `2656` | `89.863 ≤ 94.119`; `96.748 > 94.092` | sharp | none |
| `schoenfeld_interval` | `x = 2 010 759.9`; `x = 2 010 750` | end `2 010 881.05`, past the prime `2 010 881`; end `2 010 871.15`, with no prime | sharp | none |
| `trudgian_interval` | `x = 2 898 240`, `2 898 242` | ends `2 898 357.93`, `2 898 359.93`; next prime `2 898 359` | sharp | none |
| `axler_interval` | `x = 17 051 707.2`, `17 051 708` | ends `17 051 886.93`, `17 051 887.73`; next prime `17 051 887` | sharp | none |
| `axler_primeCounting_upper` | `x = 47`, `48`, `10⁴`, `10⁷`; least margin on `[48, 2·10⁷]` | `−1197.4` (denominator negative); `896.2 ≥ 15`; `1246.02 ≥ 1229`; `664 911.8 ≥ 664 579`; `8.69`, at `1627` | the threshold `48` is needed | none |
| `carneiro_milinovich_soundararajan` | `x = 4`, `7.5`, `30` | primes `5`, `11`, `31` within `6.44`, `12.36`, `46.39` | holds | none |
| `lamzouri_li_soundararajan` | `q = 3`, `4`, `5`, `6`, `7`, `8`, `12` | `q = 3`: `1.45` (excluded); worst ratios `0.65`, `0.458`, `0.545`, `0.213`, `0.246`, `0.132` | holds | none |

### Sampled locators verified against the text

- **§0.2:** `ramare-2002` lines 74–86 (Corollaire 1).
- **§0.4:** `rosser-schoenfeld-1962` line 460, (4.17); `schoenfeld-1976` lines 101–102; `trudgian-2016` lines 124–125.
- **§0.7:** `ramare-rumely-1996` line 67.
- **§1.3:**
  - `buthe-2018` lines 73–85;
  - `rosser-schoenfeld-1962` lines 213–216;
  - `schoenfeld-1976` lines 20–28, 81–97, 104–123, 668–716 and 729–733;
  - `buthe-2016` lines 754–755;
  - `dusart-1998-thesis` lines 863–864, 924–926 and 1279;
  - `dusart-1999-mc` line 118;
  - `robin-1983` lines 84 and 378;
  - `deleglise-nicolas-2019-landau` lines 387–388, 706–710 and 785–787;
  - `trudgian-2016` lines 66–73 and 229–236;
  - `johnston-yang-2023` lines 541–543, 554–556, 643–646 and 702–705;
  - `axler-2016` lines 133–135 and 145–150;
  - `ramare-2013` lines 105–108;
  - `vanlalngaia-2017` lines 26–56, decoded with the README's key.
- **§3.1:**
  - `dusart-2016` lines 74–90, 104–151, 188–194, 471, 531–535 and 576–580;
  - `dusart-1999-mc` lines 61–108;
  - `rosser-schoenfeld-1975` lines 52–55 and 530–538;
  - `faber-kadiri-2018-corrigendum` lines 18–100;
  - `faber-kadiri-2015` lines 365–366, 714 and 818–850;
  - `kadiri-2013-density` lines 46–54 and 655–660;
  - `platt-trudgian-2021-error` lines 58–92, 101–112 and 129–145;
  - `johnston-yang-2023` lines 57–113, 160–260, 268–300 and 440–462;
  - `broadbent-kadiri-lumley-ng-wilk-2021` lines 187–192, 948–953, 1127–1131, 1199–1215, 1376–1442, 1665–1674 and 1724–1729;
  - `fiori-kadiri-swidinsky-2023` lines 26–32, 147–178 and 698–727.
- **§3.2:**
  - `rosser-schoenfeld-1962` lines 195–212, 224–241 and 244–328 (garbled but legible);
  - `schoenfeld-1976` lines 198–206, 764–779 and 1276–1294.
- **§3.3:** `dusart-1998-thesis` lines 843–876 and 920–926.
- **§3.6:** `johnston-yang-2023` lines 77–84 and 636–650.
- **§4.1:** `rosser-schoenfeld-1962` lines 249–322 (see R05).
- **§4.3:** `vanlalngaia-2017` lines 26–114 and 230–240.
- **§4.7:** see Not verifiable.
- **§5.3:**
  - `robin-1983` lines 55–90 and 372–382;
  - `dusart-1999-mc` lines 1–40 and 110–170;
  - `schoenfeld-1976` lines 772 and 1280–1283;
  - `massias-robin-1996` lines 73–100 and 140–166 (see R04).
- **§6.1:**
  - `ramare-rumely-1996` lines 52–95, 820–848 and 1380–1390;
  - `dusart-2002` lines 100–113, 700–708 and 985–1013;
  - `mccurley-1984` lines 54–66 and 118–131.
- **§6.6:** `kadiri-2008` lines 98–162 and 325–345.

Changed passages outside the sample were also checked:

- `cully-hugill-johnston-2021` (v5) lines 78–96, 334–412, 916–922, 960–965 and 1060–1076;
- `cully-hugill-lee-2022` lines 148–168 and 606–616;
- `kadiri-lumley-ng-2018` lines 1292–1298.

The README flags no locator as unverified.

### Library declarations opened at the pins (18)

- **Mathlib:**
  - `NumberTheory/Chebyshev.lean`: 191 (`theta_le_log4_mul_x`), 429 (`psi_eq_theta_add_sum_theta`), 442 (`abs_psi_sub_theta_le_sqrt_mul_log`), 485 (`psi_le_const_mul_self`), 658 (`integrableOn_theta_div_id_mul_log_sq`), 668 (`primeCounting_eq_theta_div_log_add_integral`) and 705 (`theta_eq_primeCounting_mul_log_sub_integral`);
  - `NumberTheory/PrimeCounting.lean` 133 (`primesLE`);
  - `NumberTheory/LSeries/Nonvanishing.lean` 404 and 412;
  - `NumberTheory/Harmonic/ZetaAsymp.lean` 449;
  - `NumberTheory/AbelSummation.lean` 128 (`sum_mul_eq_sub_sub_integral_mul`).
- **Tau Ceti:**
  - `Analysis/SpecialFunctions/LogIntegral.lean` 180;
  - `NumberTheory/ArithmeticDirichletSeries/Transfer.lean` 76 and 86;
  - `NumberTheory/PrimeCounting.lean` 40 and 90;
  - `NumberTheory/Chebotarev/PrimeCounting/PrimesCongruent.lean` 50;
  - `NumberTheory/LFunctions/Mertens.lean` 545.

### Cross-roadmap citations resolved

- **ExplicitZetaBounds** (head `bd1ac3ea`):
  - §§0.2–0.4, 3.4 (Delange's inequality), 5.2, 5.3, 5.4 (R01), 6.1, 6.5 and 7.2 (`log 0.618` form, given `RH(545 439 823)`, from `1.88·10¹⁴`);
  - §7.3, including the `5.5666305` and `log(|γ|/17)` regions;
  - §7.5 (R02), §7.6 (`57.54`), §7.9 (R07), §8.1 (strict `σ₀ > 0.5208`), §8.2, and §8.3 (fixed `H₀ = 3.0610046·10¹⁰`);
  - "Not owned here" (lines 114–170) and Downstream consumers (lines 2636–2667).

  Every other zero input owned here is one that ExplicitZetaBounds' "Not owned here" leaves here, or one that §8.3's fixed `H₀` excludes: Liu–Wang, Ramaré's revised density, Johnston–Yang's recomputed density, `0.28 log T`, Trudgian's triple against `M(T)`, and the Fiori–Kadiri–Swidinsky and Cully-Hugill–Lee recomputations.
- **SpecialFunctionsEiLiErfIncompleteGamma** §§8.2–8.4: `principalLogIntegral`, `logIntegral_eq_principalLogIntegral_sub`, `strictMonoOn_expIntegralEi`, the 6.6 series, and 6.12.2 with the `li` expansion.
- **AnalyticNumberTheoryPartI:** §§0.2, 0.3, 0.5, 0.8, 0.16, 0.19, 0.25, 0.30, 0.32, 0.34, 1.5a, 1.6 and 1.9 exist.
- **ComputationalNumberTheory:** §§4.17a, 4.22 and 4.24.
- **SieveMethodsAndPrimePatterns:** §§2.9 and 3.1.
- **EffectiveClassNumbers:** §4.4.
- **ZerosOfLFunctions** (main): §§4.1, 4.5, 5.6, 6.2–6.4, 7.3, 7.4, 8.3–8.7 and 8.9.
- **Citations of this roadmap:** every section that ExplicitCharacterSumsAndSieves, ExplicitMultiplicativeFunctions and ExplicitNumberFields cite here exists: §§0.1, 1.1, 1.3, 1.6, 1.7, 2.2, 3.2, 3.3, 4.2, 4.3, 4.7, 5.3, 6.1 and 6.3. No other roadmap names *RamareRumelyRegion*, *BroadbentRow* or `gap:lehman-weighted-zero-sum`.

### Ownership and gaps

- **Ownership by object.** These objects were checked against the sibling checkouts and `roadmaps grep`: the truncated explicit formula with a numerical error, `ψ̃` and `C(q, a)`, the Pintz form, and the new zero inputs (`4.3128`, the Cully-Hugill–Lee and Fiori–Kadiri–Swidinsky densities). The only second owner found is R02. ExplicitMultiplicativeFunctions' `C(q, a)` is Languasco–Zaccagnini's product constant, a different object.
- **Gap slugs.** The README's 10 supplier contracts all match slugs in `plan.json`.
- **For the intake** (recorded, not findings):
  - `plan.json` still declares `dirichlet-four-zero-region`, which the README owns as *LiuWangFourZeros* and ExplicitZetaBounds declines.
  - `plan.json` declares `explicit-brun-titchmarsh` with supplier `none`. Its `needs` says "proved in §0.1 of this roadmap", and §0.1 (`brun_titchmarsh`) owns it, so it is not unowned.
  - The README's contract texts for `explicit-zero-count-error` and `explicit-zero-density` are narrower than `plan.json`'s `needs`, matching ExplicitZetaBounds' "Not owned here". For `dirichlet-zero-free-constants`, see R02.

## Not verifiable

These texts are recorded as uncertified or waived in the manifest, so they were cited by locator and not read:

- `lee-nosal-2026`: §§2.2 and 4.7 (sample target 4.7), display (8), display (10) and §§3.2–3.3;
- `chirre-helfgott-2025`: sample target 2.6 (Corollaries 1.2–1.3, §§2–9) and §3.8 ((10.3) and the printed `69 991`); internal values recomputed above;
- `fiori-jaskari-2026`: §3.6's preprint item;
- `axler-2024`: (1.10) and Theorems 1.2–1.6;
- `axler-2018`, `axler-2019-nth-prime`, `dusart-2018`, `dusart-1999-cr`, `platt-ramare-2017`, `johnston-2022`, `bhattacharjee-2024`, `zhang-xiong-2025`;
- `ramare-2023-corrigendum`, `cully-hugill-lee-2024`;
- `fiori-kadiri-swidinsky-2023-psi`: Table 8, Theorem 1.2 and Corollary 1.4 numbering;
- `broadbent-fiori-kadiri-ng-wilk-2026`, `bellotti-trudgian-yang-2026`, `platt-2016`, `lamzouri-li-soundararajan-2015`;
- `lu-zaman-zhao-2026`, `thorner-zaman-2024`, `banks-2026`, `openai-2026-siegel`;
- `cully-hugill-johnston-2025`, `lee-2026`, `visser-2025`, `johnston-sorenson-thomas-webster-2026`;
- `montgomery-vaughan-1973`, `ramare-saouter-2003`, `rosser-1938`, `rosser-1941`; `cipolla-1902`, which is waived.

Two further limits:

- `massias-robin-1996`: the line-numbered text omits the displayed formulas, so the statement of Théorème A could not be read (R04 rests on the prose at lines 141 and 163–166).
- `brent-platt-trudgian-2021` is uncertified in this manifest. The open arXiv text (2009.13791v1), which ExplicitZetaBounds' manifest records, was read for R01.

## Source issues

- **Misprint** in dusart-2016 at Theorem 1.1, p. 876 (line 79): the source prints the condition `X ≥ max(8.36, 8R)`, while its proof (lines 471, 531) uses `X ≥ 8/R`; it should be `X ≥ max(8.36, 8/R)`, which Corollary 1.2 needs; affects a stated result.
- **Error** in johnston-yang-2023 at Theorem 1.4, (1.8)–(1.9), p. 2: the source claims both bounds for `x ≥ 23`, and (1.9) has `π(x) − x`; it should be `θ` from `x ≥ 59` and `|π(x) − li(x)|` from `x ≥ 71` (at `x = 23`: `3.777 > 3.399` and `1.884 > 1.124`); affects a stated result.
- **Misprint** in johnston-yang-2023 at §3.3 and §5.1, pp. 9 and 14 (lines 454 and 640): the source refers to "Lemma 2.3" for the region `ν₂`; it should be Lemma 2.9; affects nothing.
- **Misprint** in dusart-1999-mc at the proof of Theorem 3, p. 413 (lines 131–132): the source says the minimum over `10¹¹ ≤ p_k ≤ exp(1800)` exceeds `c = 0.0077629`; it should be `exp(500)`, since the value is `0.0030 < c` at `e¹⁸⁰⁰`; affects nothing.
- **Gap** in vanlalngaia-2017 at Corollary 2, p. 2 (lines 59–65, derived at lines 111–114): the source states it from `log x ≥ 4635` by Corollary 3 at `R = 5.69693`; it should start at `log x ≥ 814R = 4637.30`, or use `R = 5.5666305`; affects a stated result.
- **Error** in buthe-2018 at Theorem 2, (1.6), p. 2 (line 75): the source states `x − θ(x) ≤ 1.95√x` from `x ≥ 1423`; it should be from `1427`, since the bound fails on `1426.47 < x < 1427`; affects a stated result.
- **Error** in buthe-2016 at Theorem 2, (7.1), p. 13 (line 701): the source states the `π*` bound for `x > 59`; it fails on `96.29 < x < 97` (`1.917 > 1.791` at `96.9`); it should be stated for `x ≥ 97`; affects a stated result.
- **Error** in robin-1983 at Théorème 8, (23) (line 378): the source states `p_k ≤ k(log k + log log k − 0.9385)` for `k ≥ 7022`; it should be `k ≥ 8602`, since `p₇₀₂₂ = 70 919 > 70 918.61` and `p₈₆₀₁ = 88 807 > 88 805.00`; affects a stated result.
- **Error** in trudgian-2016 at Corollary 2 (line 229): the source states the interval for `x ≥ 2 898 239`; it should be `x ≥ 2 898 242`, since at `x = 2 898 240` the interval ends at `2 898 357.93`, before the next prime `2 898 359`; affects a stated result.
- **Error** in ramare-2013 at the Corollary to Theorem 1.1 (line 108): the source states `O*(0.0067/log x)` for `x ≥ 23`; it fails up to `x = 1 514 837` and should be for `x ≥ 1.52·10⁶`; affects a stated result; corrected in print at ramare-2023-corrigendum, the corrected corollary (as the README records; that text was not read here).
