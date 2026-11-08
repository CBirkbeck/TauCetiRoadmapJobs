# Review of ExplicitMultiplicativeFunctions (pull request #1946 at ce19e66)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ExplicitMultiplicativeFunctions/README.md` (4054 lines) and `Suggested.lean` (359 lines) at `ce19e66`. Below, "README" and "`Suggested.lean`" mean those two files. Supplier citations were resolved against the suppliers' current heads, which have moved since the previous review: ExplicitPrimeCounting `03fb1a7`, ExplicitZetaBounds `c6ba511`, ExplicitCharacterSumsAndSieves `d6d076d`, AnalyticNumberTheoryPartI `ead4cdb`, SieveMethodsAndPrimePatterns `eecdf1d` and ProbabilisticAndMetricNumberTheory `6fdc62d`.

- The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with 12 `sorry` warnings and nothing else.
- Both findings of the previous review are repaired (section "Previous findings").
- The merge order and the supplier heads have moved since then, which produces two blocking findings:
  - ProbabilisticAndMetricNumberTheory now comes before this roadmap and owns the Rankin-type bound that 6.1 claims (R01).
  - ExplicitZetaBounds §7.10 now attaches two records to the bounds for `1/ζ` that 1.9 uses (R02).
- Three locator and citation repairs follow (R03–R05).

## R01 (P2) — The Rankin-type bound of 6.1 has two owners, and the consumer direction is reversed

- **Location.** README 6.1, lines 2680–2684: "the Rankin-type bound `Σ_{n ≤ x} f(n) ≤ x exp(Σ_{p ≤ x} (f(p) − 1)/p)` … it is proved here, as in 6.4, by applying the first inequality to `h = f ⋆ μ`". Downstream consumers, lines 3857–3860: "this roadmap precedes that one in the order of supply and owns the bound, so §3.7 is a consumer of 6.1 for it."
- **Claim.** In `ORDER.txt`, ProbabilisticAndMetricNumberTheory is line 52 and this roadmap is line 269, so the stated direction is false. That roadmap's §3.7 (open, head `6fdc62d`) states and proves the same bound itself: f multiplicative, `f(p^ν) = f(p) ≥ 1`, every `x ≥ 1`, by the same route (`f = 1 ⋆ h`, `h(p) = f(p) − 1`). It does not cite this roadmap. One object therefore has two owners, and this README names an earlier roadmap as its consumer.
- **Witness.** ProbabilisticAndMetricNumberTheory README at `6fdc62d`, §3.7 (from its line 3986), the paragraph "Rankin-type bound for multiplicative functions (case of Lemma 7.2)" with its proof. `roadmaps grep` for the bound finds only that roadmap and this one.
- **Repair.**
  - In 6.1, replace "it is proved here, as in 6.4, by applying …" with "it is ProbabilisticAndMetricNumberTheory §3.7's Rankin-type bound, cited and not restated; it is also the case `f(p^ν) = f(p)` of 6.4, followed by `1 + u ≤ e^u`."
  - Add the bound to "Consumed, not redefined" under Scope, and add a supplier contract "From TauCetiRoadmap.ProbabilisticAndMetricNumberTheory: §3.7, the Rankin-type bound …".
  - Delete the Downstream consumers bullet for ProbabilisticAndMetricNumberTheory.
  - Tested on the instance `f = 2^ω`, `x = 10`: `Σ_{n ≤ 10} 2^{ω(n)} = 23 ≤ 10·exp(1/2 + 1/3 + 1/5 + 1/7) = 32.42`, from either owner's statement. The supply is then downward (52 < 269), and the pull request's depends-on list gains #1421.

## R02 (P2) — 1.9 and its ExplicitZetaBounds contract omit `BrentPlattTrudgianRecord` and `LeongRecord`

- **Location.**
  - README lines 488–497, the contract: "§7.3 … given `RH(3·10¹²)`" and "§7.10: the bounds for `1/ζ` that the route of Layer 1.9 uses, each given `RH(H₀)`".
  - Lines 1646–1648: Lee–Leong's bound "given `RH(H₀)` and *ZetaReciprocalSegmentVerified*".
  - Line 1655: items (a) and (b) "given `RH(H₀)`".
  - Lines 1702–1708 (*Needs:*) and 1799–1804 (Dependencies).
- **Claim.** At `c6ba511`, ExplicitZetaBounds states each bound that the route of 1.9 consumes under more than `RH(H₀)`:
  - Leong's `29.388 log t` and `30.812 log t` bounds (and the `7.59·10³¹` row of the same corollary) need `RH(H₀)`, `BrentPlattTrudgianRecord` and `LeongRecord`.
  - Lee–Leong's `1237 (log t)^{11/12}` needs `RH(H₀)` and `BrentPlattTrudgianRecord`.
  - The `e^{146} log t` bound needs "the hypotheses of the second item", that is, all three.
  - The `5.558691` region of §7.3 needs `RH(3·10¹²)` and `BrentPlattTrudgianRecord`.

  Both records are named propositions of its §0.4b. Under this README's own Conventions (lines 230–239), a theorem takes as an argument every record its route uses. So Lee–Leong's bound and item (b) are stated with missing hypotheses: item (b) is Leong's Corollary 4, which uses `LeongRecord` for `t ≤ 500` and the §7.3 region above `H₀`. The README does not name either record anywhere (`grep` gives 0 hits).
- **Witness.** ExplicitZetaBounds `c6ba511`, §7.10, second item: "given `RH(3 000 175 332 800)` (0.4), `BrentPlattTrudgianRecord` (for the region of 7.3) and `LeongRecord` (0.4b)". Its consumers paragraph says this roadmap takes §7.10 "each given `RH(3 000 175 332 800)` and `BrentPlattTrudgianRecord`, and … `LeongRecord`".
- **Repair.**
  - In the contract, state §7.3 "given `RH(3·10¹²)` and `BrentPlattTrudgianRecord`". State §7.10 "each given `RH(H₀)` and `BrentPlattTrudgianRecord`, and Leong's line bounds and the bound on `σ ≥ 3/4` also given `LeongRecord` (ExplicitZetaBounds §0.4b)".
  - Add `BrentPlattTrudgianRecord` and `LeongRecord` to the hypotheses of Lee–Leong's bound and of item (b), to the *Needs:* line of 1.9 and to the Layer 1 Dependencies.
  - Keep "§7.10 meets `gap:zeta-reciprocal-bounds`" (lines 504–511), with the records named.
  - Tested on the instance of the second item at `t = 13`: the supplier's statement holds only under all three hypotheses, which the repaired statement now carries. The threshold `5.56 log² H₀ = 4589.197` is unchanged.

## R03 (P3) — ExplicitPrimeCounting §1.7 has no instances named *LuZamanZhaoSweep* or *BanksGap*

- **Location.** README lines 409–410: "*RealZeroGap* `c Q` with its named instances *LuZamanZhaoSweep* and *BanksGap*". The same names appear at lines 519–521 and 3565–3567, in 8.3: "among them *LuZamanZhaoSweep* and *BanksGap* of its §1.7".
- **Claim.** ExplicitPrimeCounting at `03fb1a7` states its two instances without names, each given *LuZamanZhaoRecord*, a record of ExplicitZetaBounds §0.4b: "*RealZeroGap* `(1/5) 10¹⁰`, given *LuZamanZhaoRecord*" and "*RealZeroGap* `(3.0·10⁻³) ∞`, given *LuZamanZhaoRecord*". Its §6.3 lists its three interchangeable hypotheses under those forms. No statement here is proved from these instances, so this is a citation defect, not a missing hypothesis.
- **Witness.** `roadmaps grep 'LuZamanZhaoSweep|BanksGap'` finds the names only in this README and in ExplicitNumberFields. ExplicitPrimeCounting §1.7 at `03fb1a7` (its lines 1181–1199) uses neither name.
- **Repair.** At the three places, replace *LuZamanZhaoSweep* with "*RealZeroGap* `(1/5) 10^{10}` given *LuZamanZhaoRecord*". Replace *BanksGap* with "*RealZeroGap* `(3.0·10^{−3}) ∞` given *LuZamanZhaoRecord* (Banks's instance, a preprint)".

## R04 (P3) — 3.1 presents the corrected coefficient `5 − 4γ` as its own derivation; the corrigendum prints it

- **Location.** README lines 2140–2149: "with the sign of `h'` as corrected by `ramare2015corr` lines 13–19, and with the middle coefficient as it follows from the source's own intermediate identity, line 661 … `5 − 4γ` is the value the derivation yields".
- **Claim.** The corrigendum restates Lemma 3.2 in full, with every quantity in the README's form:
  - the middle coefficient `5 − 4γ₀`;
  - the integral with sign `+(1/x) ∫ M(x/t) h'(t) dt`;
  - `h' = (3/2 − γ₀)ε₁' − g'`;
  - `0 ≤ t²|h'(t)| ≤ 7/4 − γ₀`.

  So the identity has a printed locator, and the README's lines 13–19 cover only the overview.
- **Witness.** `ramare2015corr` lines 76–82 (Lemma 3.2 as corrected, p. 2384). Checked numerically at `x = 2`: the polynomial part is `−0.3655065`, the integral term `(1/2)∫_1^2 h' = 0.0586537`, and their sum `−0.3068528 = m̌(2) − 1`.
- **Repair.** Cite "`ramare2015corr` lines 76–82 (Lemma 3.2 as corrected)" for the identity and for the bound on `t²|h'|`. Drop "as it follows from the source's own intermediate identity …". Keep the Check at `x = 1`, where the printed `6 − 4γ` of `ramare2015mc` line 654 gives `−2`.

## R05 (P3) — An uncertified source cited by line numbers

- **Location.** README line 3744: "restated at `axlerNicolas2023` lines 156–161".
- **Claim.** `axlerNicolas2023` is recorded as uncertified, and the sources cache has no text for it. A line locator into it cannot be checked, and the Conventions (lines 244–247) say an uncertified source is cited by its published locator only.
- **Witness.** The sources list records `axlerNicolas2023` as "settled as uncertified: cite it by its locator". `grep` finds no other line locator into an uncertified source in the README.
- **Repair.** Replace "lines 156–161" with the published locator of the restatement in `axlerNicolas2023` §1, its equation number as listed under References ("(1.13)–(1.22)").

## Previous findings (review of `e44f965`)

- **R01 (P1), Daval's threshold** — repaired. Lines 803, 1946–1948 and 1954–1955 now read `120 561` throughout. The source's `97 603` and the arXiv `97 063` are recorded as false, and the Check at lines 1997–2001 is the negative control. I recomputed `m` to `2.2·10⁷`:
  - the last unit interval on which `(log x)|m(x)| > 0.0130073` starts at `120 560`, where `m(120 560) = 0.00111876308751`;
  - the largest value on `[120 561, 2.2·10⁷]` is `0.0129924` (as `x → 120 562⁻`).
- **R02 (P3), the deleted Checks** — repaired.
  - There are 55 `**Checks.**` blocks, one in every subsection from 0.1 to 9.4, and 10 `### Examples` sections.
  - The Conventions witness for `γ₁` is back (lines 227–228: `γ² − 2γ₁ = 0.4788…` against `γ² − γ₁ = 0.4060…`), and so are the other witnesses that review asked for:
    - the `x = 1` value of 3.1 (lines 2171–2173);
    - the Lemma 8.1 sign witness (lines 1151–1156);
    - `m₂(10) = 34/105` (lines 611–615);
    - the junk controls `M(0.5) = 0`, the `Finset.range` value `M(1) = 0` and `R(0.5) = −3/π²` (lines 575 and 704);
    - the three real-argument failures of the `0.397` row (lines 3112–3115).

## Verified sound

**Gate, build and order.**

- I ran the gate myself on this head. It printed `gate ExplicitMultiplicativeFunctions: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit status `0`.
- The dependency check (`gate --depcheck … --movable`) printed `depcheck: 237 roadmaps, 2425 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Positions in `ORDER.txt`: ZerosOfLFunctions 50, AnalyticNumberTheoryPartI 51, ProbabilisticAndMetricNumberTheory 52, SieveMethodsAndPrimePatterns 54, ExplicitZetaBounds 265, ExplicitPrimeCounting 266, ExplicitCharacterSumsAndSieves 268, this roadmap 269, ExplicitNumberFields 270. The depcheck does not read "Downstream consumers", which is where R01 sits.
- `lake env lean` on `Suggested.lean` printed exactly 12 warnings, all `declaration uses 'sorry'`, at lines 167, 194, 199, 209, 224, 246, 271, 288, 311, 326, 337 and 348.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml`, and the diff outside the folder against `origin/main` is empty.
- `Suggested.lean` is unchanged since `e44f965`; the README changed by 1105 insertions and 8 deletions (the Checks, the Examples and the Daval threshold).
- The README and `Suggested.lean` contain no `lemma`, `set_option`, `#eval` or `#print`, and no process word or pull-request number.

**Signatures and padding.**

- I appended `#check @name` for all 25 declarations (13 definitions, 12 theorems) to a scratch copy and elaborated it. Every elaborated type matches its README statement; there is no `variable` block, so no binder can drop. Two details:
  - `t ^ (-(1/3 : ℝ))` is `Real.rpow`;
  - `hB` of `sum_le_hall_tenenbaum` sums `f m log m/m` over the prime powers that are not primes, which is the README's `Σ_p Σ_{ν ≥ 2}`.
- One-tactic probe: in a scratch copy, each `sorry` was replaced by `first | rfl | (simp; done) | (norm_num; done) | positivity | infer_instance | decide | (simp_all; done) | linarith | omega`. The copy fails with exactly 12 errors (lines 188, 195, 202, 213, 237, 262, 278, 303, 319, 332, 341, 357), one per theorem, so nothing is padding.
- Headlines. Every end theorem of the Summary (lines 16–29) is stated:
  - Ramaré's 2013 instance;
  - Tao's bound and Balazard's inequality;
  - Ramaré's bound for `m̌`;
  - the comparison theorem and the Dirichlet-divisor model;
  - the Hall–Tenenbaum inequality;
  - both Mertens products;
  - Robin's bound for `ω`, Nicolas–Robin's for `τ` and Rosser–Schoenfeld's for `n/φ`.

  The module docstring names the three groups it does not state (1.10, Robin's `σ(n)/n`, the preprint targets) and says why.
- Every hypothesis of the headlines is a true statement, checked numerically where finite, so none of them is vacuous (table).

**Seeded sample: each locator opened at the cited lines (or recomputed where the source is uncertified).**

- **0.1** — No source locator. The Checks were recomputed: `M(1..13)`, `m(5) = −1/30`, `m(7) = −1/105`, `m̌(3) = 0.8959`, `m̌(30) = 1.00302`, `M(30) = −3`, `m(30) = −0.0304751`.
- **0.2** — `ramare2015mc` lines 224–230 ((1.5), `g_q(p^k) = 1` for `p ∣ q`, `0` for `p ∤ q`, `k ≥ 1`), lines 248–274 (Lemma 1.9) and line 329 ((1.7), the printed `31/105`). `34/105 = 0.32381 ≥ 0.260·2/log 5 = 0.32309 > 31/105 = 0.29524`, so the README's correction stands.
- **1.1** — Each locator holds:
  - `balazard2012`: lines 81–84 (Meissel's (1)), 92–109 (Gram's (2), `x m(x) ∈ [2 − x, x]`), 145–149 ((3)–(4)), 180–200 (MacLeod's Proposition 1), 303–320 ((9)–(11)), 321–328 (Proposition 2), 424–440 (`ε₁` and Proposition 6), 444–472 (Proposition 7 and its proof);
  - `ramare2015mc` lines 450–458 ((2.1)–(2.3), with `t⁴` printed in (2.3), and `0 ≤ ε₁' ≤ 1/t²`);
  - `ramare2013aa` lines 696–704 (Lemma 8.1, printed `−k∫`, in its proof as well) and lines 736–746 ((9.1)–(9.2)).
- **1.2** — Each locator holds:
  - `macleod1967` lines 24–37 ((4) with `x ≥ 1119`, Neubauer's `√x` on `(200, 10¹⁰]`);
  - `macleod1969errata` lines 14–17 (the corrected (5));
  - `costaPereira1989` lines 793–803 (`|M(x)/x| < 1/1036` from `10⁸`, then from `120 727` by Table III and a check).
- **2.4** — Each locator holds:
  - `ramare2015mc`: lines 297–307 and 314–325 (Theorems 1.12–1.13, as printed), 1023–1025 (Lemma 7.4, `0.779`), 1086–1089 (Lemma 8.3), 1107–1109 ((9.1), `0.320` from `687`);
  - `ramare2014aa` lines 74–81 (Theorem 1.1, `(q/φ(q))·2/log(x/q)`);
  - `bordelles2015` lines 88–100 (Theorem 2, `C_m = 1100(1 + 4e^{−1}√ζ(m + 1/2))²`, `⌈C₁⌉ = 12 555`, `⌈C₁₀⌉ = 6723`).
- **3.1** — Each locator holds, apart from R04:
  - `ramare2015mc` lines 155–163 (Theorem 1.4), 568–574 (`ε_{6,ℓ}`), 652–689 (Lemma 3.2 with `6 − 4γ₀`; the intermediate identity at line 661; (3.7); `|t² g'| ≤ 1/4` at line 688);
  - `ramare2015corr` lines 13–19 and 76–93 (Lemma 3.2 corrected, R04).
- **5.1** — Each locator holds:
  - `ramare1995` lines 339–354 (Lemma 3.2: three complex sequences, `H̄` convergent on `Re s > −1/3`, four constants; the displays are images) and 356–366 (Lemma 3.3, `3 exp(−1/3 − 1) = 0.9105`);
  - `trudgian2015` lines 433–450 (Lemma 15: `U = 2A H(0)`, the factor `2.5`, the misprint note on `U`).
- **6.1** — `EulerProduct.summable_and_hasSum_smoothNumbers_prod_primesBelow_tsum` exists at the pin (`Mathlib/NumberTheory/EulerProduct/Basic.lean`). `bordelles2012` is uncertified; Theorem 4.28's specialisation was re-derived: `(1 − 1/p)(1 + f(p)/(p − 1)) = 1 + (f(p) − 1)/p`.
- **6.3** — `hallTenenbaum1988` and `bordelles2024` are uncertified. Both inequalities were re-derived from `log t ≤ t` and `log t ≤ t − 1` (table).
- **7.1** — Each locator holds:
  - `moserMacLeod1966` lines 8–14 (`|R| < √x`, `< √x/2` for `x > 8`; Rogers' `53/88`), 72–81 ((8), (9));
  - `ramare2013aa` lines 267–276 (Lemma 4.6: `0.7`, `0.5` from `10`, Cohen–Dress `0.1333` from `1664`);
  - `cipu2015` lines 621–626 (Lemma 4.2(a)–(d), stated for real `x ≥ 1`);
  - `ramare2016mc` lines 450–461 (Lemma 3.4 and the identity with `O*(3/N^{1/3})`);
  - `trevino2015ijnt` lines 276–278 (Moser–MacLeod's (7) for `x ≥ 2`).
- **7.2** — `ramare2019bcp`:
  - lines 87–88 and 93–108 (Corollary 1.2, the `0.036438` and `0.43` constants), 102–106 (`C₂`), 124–128 (`c₀`);
  - lines 179–193 (Theorem 3.1, `11` and `61/25`), 200–206 (Theorem 3.2, `7/20`, `3/5`, `0.56`), 210–214 (Corollary 3.3, `0.073` from `3475`), 219–222 (Corollary 3.4);
  - lines 769–779 (Theorem 8.1), 781–810 (Lemma 8.2), 834–846 (the proof with the uncorrected `0.00252/log t − 0.0077/log² t`).
  - With the corrected inputs: `(0.0144 log y − 0.1)/(y log² y) + 0.0028/(y log y) = (0.0172 log y − 0.1)/(y log² y)`, and `2/714 + 1/69 = 0.017294 ≤ 0.02`, as the README states.
- **7.6** — `cipu2015` lines 633–654 (Lemma 4.3) and `trudgian2015` lines 415–432 (Lemma 13 with `3.253`, `8.14`, `−0.3762`; Lemma 14 with `1.16` "for all `t > 0`"). The constants were recomputed (table).
- **8.2** — `vanlalngaia2017`: page 3, lines 118–131 (Theorem 5: `|ε| < 2`, `x ≥ exp 22`, `O*(0.841/log³ x)`, `γ(ε) = Σ_p Σ_{n ≥ 2} (−1)^{n+1} ε^n/(n p^n)`), Corollary 1 (lines 26–51) and Theorem 9 (lines 190–195). The text's font maps digits to letters (`] = 0`, `a = 1`, `b = 2`, `d = 4`, `h = 8`); decoded consistently.
- **9.3** — Each locator holds:
  - `nicolas2008` lines 56–68 (Théorème 2: `2.59790…` at `M₁ = 2⁸3⁵5³7²11²13² ∏_{17 ≤ p ≤ 113} p`; (7) with `e^γ` on both iterated logarithms and `0.941444079…`), 232–236 (Définition 1), 399–426 (Lemme 7), 437–443 (Lemme 9: `15 985`, `166 000`);
  - `ivic1977` lines 19–24 (Theorems 1–2) and line 52 (Rosser–Schoenfeld's product, `x > 1`).
- **9.4** — `nicolas2008` lines 23–26 (Rosser–Schoenfeld's `2.50637`, `n ≥ 3`) and lines 38–49 (Théorème 1: `3.65278…`, `3 log log φ(n)`, `2.95503…` with equality at `30 030`). `rosserSchoenfeld1962` is uncertified; the table was recomputed.
- **Also opened:** `hurst2018` lines 420–426 (`q(7 766 842 813) = 0.571`, `M = 50 286`); `bordelles2015` lines 60–77 ((1)–(4), Theorem 1); `berkaneBordellesRamare2012` lines 182–189 (Corollary 2.2 as printed, `γ² − γ₁`, "for all `t > 0`"); `ramare2013aa` lines 251–254 (Lemma 4.5, `x ≥ 23`).

**Adversarial table.** Every value below was computed in this review: sieves of `μ` to `2.2·10⁷`, of the primes to `10⁸`, of `τ` and `ω` to `1.1·10⁶`, in extended precision. "Left limit" means `x → N⁻`.

| Statement | Instances | Values (left / right) | Result | Change |
|---|---|---|---|---|
| 0.1 carriers | `x = 1, 2, 5, 7, 30`; `x = 0.5` | `M = 1, 0, −2, −2, −3`; `m(5) = −1/30`, `m(7) = −1/105`, `m(30) = −0.0304751`; `m̌(2) = 0.693147`, `m̌(3) = 0.895880`; `M(0.5) = 0` | sound | — |
| 0.2 decomposition | `q = 2`, `x = 10`; `S = {2, 3}`, `x = 6` | `19/210 − 1/60 + 1/8 + 1/8 = 34/105 = m₂(10)`; `m_S(6) = 1/3` (restriction to `n` with a factor in `S`: `−2/3`) | sound | — |
| 1.1 identities | `ε₁(1.5)`; Balazard at `x = 2`; Lemma 8.1 with `f = 1_{n=3}`, `D₀ = 2`, `D = 4` | `17/162 = 0.104938` (with `t⁴`: `0.106996`); `5/12 + 1/12 = 1/2 = m(2)`; `0.79248 + 0.20752 = 1 = M₀(f, 4)`, against `0.585` with `−k∫` | sound | — |
| 1.2 MacLeod, Costa Pereira | integers `≤ 2.2·10⁷` | last `|M| > x/80` at `1118` (`|M(1118)| = 14`); `max_{[1,1118]} (|M| − x/80) = 5.5125` at `199`; last `> x/1036` at `120 726` | sound | — |
| 1.3 thresholds | integers `≤ 2.2·10⁷` | last `> x/2360` at `617 972` (`M = −262`); last `> x/4345` at `2 160 534` (`M = −498`) | sound | — |
| 1.5 headline `abs_moebiusSum_le_ramare` | `D = 2 161 205`; last violation; the hypotheses | `|M| = 466 ≤ 727.53`; last violation of the bound at `1 078 852` (`M = 350`); `max |ψ − x|/√x` on `[1500, 10⁸]` = `0.7509` (`hψ₂`: `0.8`); `ψ̃` bound `0.0067/log x` last fails below `1 514 838`, max ratio `0.860` on `[1.52·10⁶, 10⁸]` (`hψ₅`); `R/√x ∈ [−0.15263, 0.67909]` (`hQ`: `0.7`); `Σ μ²/n − (6/π²) log y ∈ [0.578617, 1.165457]` (`hQ'`, `hQ''`); `max_{[33, 2.2·10⁷]} |M|/√x = 0.567105` at `199` (`hM`) | sound, hypotheses true | — |
| 2.1 headline `abs_moebiusDivSumIn_le_one` | `S = ∅`; `{2}`; `{2, 3}`, `x = 6`; all primes, `x = 13`; `x < 1` | `1`; `1/2`; `1/3`; `−0.07736`; `0` | sound | — |
| 2.2 headline `abs_moebiusDivSum_le_balazard` | `x = 1, 2` | `1 ≤ 1 + 0 + 8/3`; `1/2 ≤ 0 + 1/4 + 4/3` | sound | — |
| 2.3 Daval's row | `[1, 2.2·10⁷]` | last violating interval `[120 560, 120 561)`, `0.013089`; max `0.0129924` from `120 561`; Theorem 1.2 last violation `463 420` | sound | — |
| 2.4 maximal sums | real `y ≤ 10⁴` | `log y Σ |m(y/w²)|/w² → 0.783122` as `y → 11⁻` (row `0.784`; printed `0.779` fails); `(1 + log y)` form `1.693147` as `y → 2⁻` (row `1.694`); `sup_{x ≥ 2} (log x)|m(x)| = 0.549306` as `x → 3⁻`; `m₆(30) = 0.299894 ≤ 1.4614` | sound | — |
| 3.1 headline `abs_moebiusLogSum_sub_one_le` | `x = 1, 2`; the identity | `1 ≤ 0 + 2`; `0.3069 ≤ 1.293`; at `x = 2`, `−0.3655065 + 0.0586537 = −0.3068528 = m̌(2) − 1`; `x·p(x)` min `−1.071149` at `1.17115`, sup `0.460758` | sound | R04 (locator) |
| 5.1 headline `norm_sum_mul_sub_le_comparison` | `h = δ`; weighted factor; `H̄` | conclusion = hypothesis; `(2 − α)/(1 − α) = 2.5`, `8/3`; `Σ_{n ≤ 10⁶} τ(n) = 13 970 034` (so `U = 2A H(0)`); `ζ(4/3)/ζ(8/3) = 2.80405`, `ζ(6/5)/ζ(12/5) = 4.04208`, `ζ(1)` at `α = 1/2` | sound | — |
| 5.2 headline `sum_tau_div_model` | `(0, 1)`; `[1, 1.1·10⁶]`; `t = 10⁶`; analytic switch | `sup |P| t^{1/3} = 1.6408192` at `log t = −7.2163` (≤ `1.641`); `max |Σ τ/n − P| t^{1/3} = 0.65418` as `t → 2⁻` (≤ `1.16`); constant `0.478901` against `γ² − 2γ₁ = 0.478809`; `(2.883/1.16)⁶ = 235.68`; `t^{1/2}` form `0.87813` at `24⁻`; `t^{2/5}` forms `1.0502863` on `(0, 1)`, `0.68762` at `6⁻` | sound | — |
| 6.1 (R01) | `f = 1`, `y = 2, 3`; `f(n) = n`, `y = 4`; Rankin at `f = 2^ω`, `x = 10` | `3/2 = 3/2`; `11/6 ≤ 2`; `4 ≤ 6`; `23 ≤ 32.42` | sound statement, two owners | R01 |
| 6.3 headline `sum_le_hall_tenenbaum` | `f = 1`; `f = δ` | `A = log 4`, `B = Σ_p log p (2p − 1)/(p(p − 1)²) = 1.982335` (terms `1.0397, 0.4578, 0.1811, 0.1004`), `A + B + 1 = 4.368629`; `1 ≤ x/log x` | sound | — |
| 7.1 squarefree | `[1, 2.2·10⁷]` | `R/√n ∈ [−0.1032287 (380), 0.6790902 (3)]`; real min `−0.152632`; `0.036438` fails at `351 115` (`21.6756 > 21.5914`); `0.02767`: last integer `437 780`, last real interval `[441 352, 441 353)`; `0.1333` last fails at `1663` | sound | — |
| 7.2 constants and tails | primes `≤ 3·10⁶`; `X = 1.9`, `X → 2⁻` | `Σ log p/(p² − 1) = 0.569961`, `C₂ = 1.71714`, `c₀ = 1.33258`; `|1 − (6/π²)(log X + C₂)|√X = 0.598`, `0.658` (the `0.43` fails, `1.044` holds); `sup_{(0,1)} = (6/π²)C₂ = 1.04389` | sound | — |
| 7.6 sums of `2^ω` | `x = 10, 10⁵, 10⁶` | `5.39127 ∈ [2.8759, 7.3739]`, `23 ∈ [14.1, 31.4]`; `56.758403 ≤ 56.8590` (2/5-form `56.8022`), `778 581 ∈ [704 462, 870 812]` (2/5-form `789 932`); `77.697539 ≤ 77.7451` | sound | — |
| 8.1 headline `mertens_product_explicit` | `x = 24 284`; hypothesis `hB` | `ε + 1/(x − 1) = 1.01247·10⁻³` against `4.89185·10⁻³`, `4.91590·10⁻³`, `9.75989·10⁻³`, `9.85609·10⁻³`; `max |E| log³ x` on `[24 284, 10⁸] = 0.934` | sound | — |
| 8.1 headline `mertens_product_axler` | `x = 392 686, 392 687, 46 909 074`; hypothesis | route margins `−5.85·10⁻¹²`, `+4.70·10⁻¹³`, `1.68·10⁻⁶`; `min (E + η_A)` on `(2, 10⁸] = 1.22·10⁻⁵ > 0` | sound | — |
| 8.2 tilted products | `ε = ±1`; `x = e²²` | `γ(1) = −0.181982`, `γ(−1) = −0.315718 = B − γ`, `e^{γ(1) + B} = 1.082762 = (6/π²)e^γ`; `1/(x − 1) = 2.789·10⁻¹⁰ ≤ 2.817·10⁻¹⁰` | sound | — |
| 8.3 (R03) | `q = 1`, `X₀ = 286` | `C = e^γ (1 + 1/log² 286) = 1.836748` | sound | R03 (names) |
| 1.9 (R02) | threshold; hypotheses | `log H₀ = 28.729692`, `5.56 log² H₀ = 4589.197`; supplier items need `{RH(H₀), BrentPlattTrudgianRecord, LeongRecord}` against README `{RH(H₀), segment}` | missing hypotheses | R02 |
| 9.1 headline `cardDistinctFactors_le_robin` | `hp` for `k ≤ 5 761 455`; table; analytic step | no failure of Dusart's bound, min margin `0.0166 k` at `k = 2688`; `k log θ/θ`: `1.079732` (`k = 3`), max `1.384013` (`k = 9`), `1.318852` (`k = 26`); deficit `≤ 1.203374 k`, max at `k = 31`; `log(kℓ) ≤ 1.3841 ℓ` last fails at `26` | sound | — |
| 9.2 headline `sigma_zero_le_nicolasRobin` | all superior highly composite `N`, `ε ∈ [0.1950, 0.3466]` | 15 numbers; max `f₂ = 1.5379399` at `6 983 776 800` (`τ = 2304`); `f₂(5040) = 1.484851` | sound, hypothesis true | — |
| 9.3 sums of divisors | `M₁`; Robin at `12`; Ivić; Eum–Koo | `σ(M₁)/M₁ = 8.504414`, `τ = 97 844 723 712`, ratio `2.5979075`; `0.6482136`; `12 > 9.063`, `28 < 28.290`; `σ*(30) = 72 > 68.55`; `32 > 31.2314` at `21` | sound | R05 (locator) |
| 9.4 headline `div_totient_lt_rosserSchoenfeld` | `N₉`; `hθ` to `10⁸`; `ω ≤ 2`; monotonicity | `N₉/φ(N₉) = 6.1129105`, constant `2.5063693 < 2.50637` (max over `p_k < 24 284`); no violation of `hθ` from `563`, min margin `0.62` at `569⁻`; `2√(2.50637 e^γ) = 4.225649 ≥ 3`; increasing from `y = 26.44` | sound | — |

**Library declarations opened at the pins.**

- Mathlib:
  - `Nat.primesLE` (`NumberTheory/PrimeCounting.lean` line 133);
  - `EulerProduct.summable_and_hasSum_smoothNumbers_prod_primesBelow_tsum` (`NumberTheory/EulerProduct/Basic.lean`);
  - `Complex.borelCaratheodory` (`Analysis/Complex/BorelCaratheodory.lean` lines 86, 109);
  - `DirichletCharacter.LFunction_apply_one_ne_zero` (`NumberTheory/LSeries/Nonvanishing.lean` line 412);
  - `Real.eulerMascheroniConstant_lt_two_thirds` (`NumberTheory/Harmonic`);
  - `sum_mul_eq_sub_sub_integral_mul` (`NumberTheory/AbelSummation.lean`).
- Tau Ceti:
  - `TauCeti.LFunctions.mertensConstant` and `tendsto_primeSummatory_inv_absNorm_sub_log_log` (`NumberTheory/LFunctions/Mertens.lean`);
  - `TauCeti.sigma_le_rpow_mul_tsum` (`ArithmeticFunction/DivisorBounds.lean`);
  - `TauCeti.norm_truncatedPerron_LSeries_sub_sum_le` (`ArithmeticDirichletSeries/Perron/Formula.lean`);
  - `Nat.primeCounting_nth_prime` (`NumberTheory/PrimeCounting.lean` line 90);
  - `Nat.tendsto_prod_primesLE_filter_notMem_one_sub_inv_inv_atTop` (`NumberTheory/SumPrimeReciprocals.lean`).
- No Stieltjes constant, real-argument Möbius summatory function, Selberg remainder, unitary divisor sum or superior highly composite number exists at either pin. Tau Ceti's `ArithmeticDirichletSeries/Stieltjes.lean` concerns Stieltjes integration only.

**Cross-roadmap citations, resolved at the current heads.**

- ExplicitPrimeCounting `03fb1a7`:
  - §0.1 (line 541 `S(u)`, line 564 Büthe's `58/√u`);
  - §1.1 (943, `RH(H)` as ExplicitZetaBounds §0.2's);
  - §1.3 (1038, *ButheVerified*);
  - §1.6 (1174–1176);
  - §1.7 (1181–1199; R03);
  - §3.1 (1765, `ε(40) = 1.93378·10⁻⁸`);
  - §3.2 (1811–1812);
  - §3.3 (1868);
  - §3.5 (2079);
  - §4.2 (2346, 2355–2356);
  - §4.3 (2392–2411, `B = mertensConstant ℚ`, `1/log³ x` from `24 284`; 2449–2450, Axler's `f(x)`);
  - §4.7 (2600–2609, the product forms left to this roadmap);
  - §5.3 (2703, `dusart_nth_prime_lower`);
  - §6.1 (2891–2895, *RamareRumelyTable1*);
  - §6.3 (2944–2981).

  The five README gap contracts (`psi-initial-range`, `mertens-reciprocal-axler`, `psi-relative-bklnw`, `psi-tilde-difference`, `psi-log-power`) are still not stated there (no `0.8 √x`, `η_A`, `2.58843`, `0.05/√x` or `8.96237`), so they remain genuine gaps.
- ExplicitZetaBounds `c6ba511`: §0.2 (415), §0.4 (516–533), §4.1 (1188–1192), §4.3 (1251), §4.8 (1521), §4.10 (1639), §6.1 (1824), §7.3 (2138–2152; R02), §7.10 (2458–2483; R02), consumers paragraph (2791–2797).
- ExplicitCharacterSumsAndSieves `d6d076d`: §5.1 (1275–1285, `selbergDiagonal`, `S_k(z) ≥ (φ(k)/k) S(z)`).
- AnalyticNumberTheoryPartI `ead4cdb`: §§0.11 (297), 0.19 (537–541), 0.21 (557), 0.26 (632), 0.34 (778–780), 3.1 (2050), 3.7 (2137), 3.9 (2179), 3.11 (2201), 3.12 (2211), 3.22 (2424), 3.22a (2436), 3.22b (2442), 3.23a (2469–2493: `divisorError`, the `√x` bound, `BBRFiniteInput`), 3.35 (3001), 3.35a (3013).
- SieveMethodsAndPrimePatterns `eecdf1d`: §0.5 (519, *HasLogSieveDimension*), §1.1 (1070).
- ProbabilisticAndMetricNumberTheory `6fdc62d`: §3.7 (3986–4012; R01).
- ZerosOfLFunctions on main: Layer 9, *AllOnCriticalLine*.
- `citations.md` and `overlaps.md` list nothing. ExplicitNumberFields (#1944) cites this roadmap's §§7.5, 7.9, 8.1, 9.1 and 9.4 and its Layer 0.7 propositions, and each exists at this head.

**Ownership against open pull requests.** `roadmaps grep` was run for Hall–Tenenbaum, `1.3841`, `2.50637`, superior highly composite numbers, Levin–Fainleib, the first Stieltjes constant, Balazard, the Möbius carriers, the Rankin-type bound and Nicolas–Robin (`1.538 log 2`). Apart from R01:
- ExplicitNumberFields cites this roadmap's 9.1 and 9.4 (its lines 373–377 and 678–683), as a consumer;
- SieveMethodsAndPrimePatterns §1.1 owns the asymptotic Levin–Fainleib form that 5.5 cites;
- no other open roadmap states these objects.

**Declared gaps.** The plan has 17 slugs:
- The README states contracts for five of them, each precise and under the plan's slug: `psi-initial-range` (lines 438–441), `mertens-reciprocal-axler` (443–448), `psi-relative-bklnw` (450–454), `psi-tilde-difference` (456–461), `psi-log-power` (463–466).
- `zeta-reciprocal-bounds` is declared met by ExplicitZetaBounds §7.10 (lines 504–511), with the hypotheses of R02 still to be named.
- The other eleven resolve to the ExplicitPrimeCounting sections listed above.

## Not verifiable

- `leong2026`: the cached text has the statements and tables, but its display formulas are images. Corollaries 3 and 4 and Tables 2 and 4 were not re-read this round; the `[[missing]]` entry already recorded stays as it is. OCR is not available on this worker.
- `ramare1995` Lemma 3.2: its displays are images, so 5.1 was re-derived. `vanLintRichert1965` §1 was not re-opened (6.5 is not in the sample).
- These uncertified sources were cited by locator and not opened; the numbers taken from them were recomputed where possible (table):
  - `daval2025` (2.3, 3.4);
  - `ramareZunigaAlterman2025` (1.10, 2.6);
  - `rieselVaughan1983` (5.2, 7.3);
  - `bordelles2002`, `bordelles2006`, `dubbe2020` (7.5);
  - `hallTenenbaum1988`, `bordelles2024`, `bordelles2012` (6.1, 6.3, 6.4);
  - `ramare2009` (5.5);
  - `rosserSchoenfeld1962`, `axler2018`, `axler2022`, `dusart2018` (8.1, 8.2, 9.4);
  - `robin1984`, `axlerNicolas2023`, `eumKoo2015`, `durasNicolasRobin1999`, `robin1983thesis` (9.2, 9.3; R05);
  - `deCamargo2025` (1.6, 2.4);
  - `trevino2015jnt` (2.5);
  - `zunigaAlterman2022` (5.6, 7.2);
  - `plattTrudgian2018` (5.2, 7.6).

## Source issues

- **Error** in ramare2013aa at Lemma 4.5, p. 6 of the author's version (line 251): the source says `ψ̃(x) = log x − γ + O*(0.0067/log x)` for `x ≥ 23`; it should be `x ≥ 1 514 838` (violated at `23` and up to `1 514 837`, none to `10⁸`); affects the proof.
- **Error** in ramare2013aa at Lemma 8.1, p. 13 of the author's version (lines 697 and 704): the source says the integral `∫ M_k(f, t) dt/(t log^{k+1} t)` enters with `−k`; it should enter with `+k` (Abel summation against `log^{−k} t`); affects nothing.
- **Error** in macleod1969errata at the corrected (5), p. 1 (lines 14–17): the source says `|M(x)| < (x + 1)/80 + 11/2` for all `x`; it should be `≤`, since equality holds at `x = 199`, where `|M(199)| = 8`; affects a stated result.
- **Misprint** in ramare2015mc at (1.7), p. 1364 (line 329): the source says `|m₂(10)| = 31/105`; it should be `34/105`, the only value consistent with the bound `0.260·2/log 5` on the same line; affects nothing.
- **Error** in ramare2015mc at Lemma 7.4, p. 1376 (line 1025): the source says the maximal sum is at most `0.779/log x` for every `x > 1`; as `x → 11⁻` it times `log x` tends to `0.783122`; it should be `0.784`; affects the proof.
- **Gap** in ramare2015mc at Theorems 1.12–1.13, pp. 1363–1364 (lines 305, 323–324): the source says `5/16` from `687`, `5/38` from `882` and `1/7` from `11 811`; its proof gives `0.320`, `0.320`, `0.143` (lines 1108, 1086–1087); affects the proof.
- **Error** in ramare2015mc at Lemma 3.2, p. 1369 (line 654): the source says the middle coefficient is `6 − 4γ₀`; it should be `5 − 4γ₀` (at `x = 1` the printed form gives `−2` for `m̌(1) − 1 = −1`); affects a stated result; corrected in print at ramare2015corr Lemma 3.2, p. 2384.
- **Misprint** in ramare2015corr at the proof of Lemma 3.2, p. 2384 (lines 91–93): the source says the expansion of `x(m̌(x) − 1)` contains `−(1/2 − γ₀)M(x)/x`; it should not contain that term (at `x = 1` it gives `−0.9228` for `−1`, and the lemma's statement omits it); affects nothing.
- **Error** in ramare2019bcp at Corollary 1.2, p. 2 (lines 107–108): the source says `3×0.036438` may be replaced by `0.43` for `D ≥ 1`; at real `D = 1.9` the error times `√D` is `0.598`, and it tends to `0.658` as `D → 2⁻`; it should be at least `0.66`; affects a stated result.
- **Error** in cipu2015 at Lemma 4.2(c), p. 214 (line 625), also ramare2019bcp lines 87–88: the source says `|R(x)| ≤ 0.036438 √x` for `x ≥ 82 005`; at `x = 351 115`, `R = 21.6756 > 21.5914`; it should exclude that point or raise the constant; affects a stated result.
- **Error** in cipu2015 at Lemma 4.2(a), p. 214 (line 623): the source says `R(x) ≥ −0.103229 √x` for real `x ≥ 1`; as `x → 2⁻` the quotient tends to `−0.152632`; it should be stated at integers, or with `−0.15264`; affects a stated result.
- **Error** in berkaneBordellesRamare2012 at Corollary 2.2, p. 4 of the text read (lines 182–186): the source says the `1.16 t^{−1/3}` form holds for all `t > 0`; at `t = 0.01`, `|P(t)| = 5.766 > 5.384`; it should be `t ≥ 1`, or `1.641` on `t > 0`; affects a stated result.
- **Misprint** in berkaneBordellesRamare2012 at Corollary 2.2, p. 4 of the text read (line 186): the source says the constant term is `γ² − γ₁`; it should be `γ² − 2γ₁` (`0.478901` at `10⁶` against `0.478809`); affects a stated result.
- **Error** in trudgian2015 at Lemma 14, p. 10 (lines 426–430): the source says the corollary holds with `1.16` for all `t > 0`; it fails on `(0, 1)`, where `sup |P(t)| t^{1/3} = 1.64082`; it should be `t ≥ 1`; affects a stated result (Lemma 13's `3.253`, `8.14`).
- **Error** in daval2025 at Théorème 2 (as quoted; the text was not opened): the source says `(log x)|m(x)| ≤ 0.0130073` for `x ≥ 97 603` (arXiv `97 063`); at `x = 120 560` the left side is `0.013089`; it should be `x ≥ 120 561`; affects a stated result.
