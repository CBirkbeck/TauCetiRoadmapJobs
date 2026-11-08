# Review of ExplicitNumberFields (pull request #1944 at 0b173fb)

**Verdict:** needs changes

This is a full re-review. The folder changed by 330 lines since `4620ad9` (94 insertions, 236 deletions), and nothing outside the folder changed. No repair report exists for the r8 review, so none of its findings is settled.

The gate passes at this head, as does the dependency check and the elaboration of `Suggested.lean`. The two findings below are P3 locator errors in sampled targets. Neither is blocking, but each is a repair to make before the next review.

## Previous findings (r8, at `4620ad9`)

| r8 | Passage at this head | Status |
|---|---|---|
| R01 (P2): 0.4a re-planned CyclotomicClassGroupsAndStickelberger §3.4 | The four theorems are gone from `Suggested.lean`. 0.4a now reads "That section proves `ζ_F(s) = ∏_{χ ∈ X(F)} L(s, χ)` on `Re s > 1` and `κ_F = ∏_{1 ≠ χ ∈ X(F)} L(1, χ)`; this section owns only the passage to the continued functions" (README.md:1032–1034). The `From TauCetiRoadmap.CyclotomicClassGroupsAndStickelberger` contract is restored (README.md:612–622), and so is the Scope deferral (README.md:138–141). The cluster sentence is deleted. The *Needs:* lines of 0.4a, 5.2 and 5.6 (README.md:1067, 2571, 2825) and the Dependencies of Layers 0 and 5 cite §3.4. `roadmaps grep abelianCharacter_gauss_product` returns only #1260. | repaired |
| R02 (P3): `letI` in four signatures | The four declarations are deleted. The gate gives `statement-hygiene=0`. | repaired |
| R03 (P3): ComputationalNumberTheory consumer dropped | README.md:3449–3451: "ComputationalNumberTheory §4.18: the digamma and trigamma remainders of 1.1a (`digamma_series_remainder`, `trigamma_series_remainder`)". The module docstring names the consumer again. | repaired |
| R04 (P3): 4.9 Guo's gap without a locator | README.md:2402: "*UniformQuadraticZeroGap* `(1/100)` (`guo2026` Theorem 1.1, preprint)". | repaired |

## R01 (P3) — 1.1 points to a line of `sunley1973` that only mentions Rademacher's bound

**Location.** `TauCetiRoadmap/ExplicitNumberFields/README.md:1284–1285`: "(`rademacher1959`, Theorem 4; restated at `lee2023ideals` lines 173–179 as Theorem 2.2, and at `sunley1973` line 105)".

**Claim.** `sunley1973` line 105 does not restate the bound. It says only that an upper bound in a region about `s = 1` is obtained "by using estimates obtained by Rademacher" (lines 104–106). The restatement in that paper is its Lemma 2.2.

**Witness.** `sunley1973` lines 148–158, Lemma 2.2: for `0 < η ≤ 1/2` and `−η < σ < 1 + η`, `|ζ_K(s)| < 3|(1+s)/(1−s)| (d (|1+s|/2π)ⁿ)^{(1+η−σ)/2} ζ(1+η)ⁿ`, with proof "See [14, p. 200]".

**Repair.** Replace "and at `sunley1973` line 105" by "and at `sunley1973` lines 148–158 as Lemma 2.2 (on the open strip `−η < σ < 1 + η`)".

**Tested.** Lemma 2.2 at `K = ℚ(i)`, `s = 1/2 + 10i`, `η = 1/2` gives the value `66.55` of 1.1's third Check, the same as Lee's Theorem 2.2. The bound is `3 · 1.00995 · 3.2187 · ζ(3/2)²`.

## R02 (P3) — 5.4 cites the wrong theorem of `cullyhugilltrudgian2021` for the `τ₄` bound

**Location.** `TauCetiRoadmap/ExplicitNumberFields/README.md:2633–2634`: "Prove the quartic bound (`cullyhugilltrudgian2021`, Theorem 2 and its corollary, consumed as the quartic divisor-sum bound of ExplicitMultiplicativeFunctions §7.5)".

**Claim.** In the source, Theorem 2 is the asymptotic for `Σ_{n ≤ x} τ(n)²`. The bound `Σ_{n ≤ x} τ₄(n) ≤ (1/3) x log³ x` for `x ≥ 193` is display (8) of Theorem 1. The quartic class-number bound that 5.4 restates is Corollary 1, which is derived from Theorem 1. The supplier agrees with this numbering: ExplicitMultiplicativeFunctions §7.5 (README.md:3351–3360 at its head) attributes the `τ₄` bound to "Cully-Hugill–Trudgian's Theorem 1".

**Witness.** In arXiv:1911.07369 v1:
- p. 2, Theorem 1: the asymptotic for `Σ d₄(n)`, then (8), `Σ_{n≤x} d₄(n) ≤ (1/3) x log³ x` when `x ≥ 193`;
- p. 3, Corollary 1: quartic `K` with `b ≥ 193`;
- p. 4, Theorem 2: the asymptotic for `Σ d(n)²`.

**Repair.** Write "(`cullyhugilltrudgian2021` Theorem 1, display (8), and Corollary 1, in the numbering of arXiv:1911.07369 v1; consumed as …)".

**Tested.** The corrected locator supports both statements of 5.4's first target.
- Display (8) is the divisor-sum input. At `x = 193`, `Σ_{m≤193} τ₄(m) = 9333 ≤ (1/3)·193·(log 193)³ = 9376.90`. At `x = 192` it fails: `9329 > 9301.3`.
- Corollary 1 is the class-number form `h_K ≤ (1/3) b log³ b` for `b ≥ 193`.

## Verified sound

### Gate, dependency check, build

- **Gate.** The rerun of `gate … ExplicitNumberFields --base origin/main` printed `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. This matches the worker's gate, which also reported `build=0`.
- **Dependency check.** The output is `depcheck: 237 roadmaps, 2430 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Merge-order positions:
  - this roadmap: 272;
  - suppliers: LFunctions 27, CyclotomicClassGroupsAndStickelberger 33, ZerosOfLFunctions 48, AnalyticNumberTheoryPartI 49, ExplicitZetaBounds 267, ExplicitPrimeCounting 269, ExplicitCharacterSumsAndSieves 270, ExplicitMultiplicativeFunctions 271;
  - ClassFieldTheory, ClassicalArithmeticCompletion, ImaginaryQuadraticClassNumber, SuccessiveMinima and ZerosOfLFunctions are on main.
- **The consumer ComputationalNumberTheory** is at 266, before this roadmap. Its own dependency check, run on its head, prints `moved: ComputationalNumberTheory moved in the merge order from #266 to #272, right after its last supplier ExplicitNumberFields`. That is a placement the worker makes, not a defect here.
- **Elaboration.** `lake env lean TauCetiRoadmap/ExplicitNumberFields/Suggested.lean` gives 16 warnings, all `declaration uses 'sorry'`, and nothing else. There are 16 theorems and 5 definitions.
- **`#check @name`.** I ran it for all 21 declarations in one scratch file. Each elaborated type matches its README statement and `signatures.md`, with the hypotheses in place:
  - `n ≥ 2` and `x > 0` for Sunley;
  - `x ≥ 1` for Debaene;
  - `3 ≤ finrank` with no quadratic subfield for Stark;
  - `x > e` for Debaene's Brun–Titchmarsh inequality;
  - `2 ≤ finrank ℚ L` for Ahn–Kwon.

  The file has no `variable` block, so no binder can be lost. Nothing changed.
- **One-tactic probe.** Each of the 16 theorems was tried with `first | (simp; done) | rfl | (norm_num; done) | trivial | decide | infer_instance | (positivity; done) | (nlinarith; done)`. All 16 still use `sorry`.
- **Headlines.** The stated headlines are 0.4, 1.1a, 2.2, 2.4 (two), 2.5, 3.3, 4.7, 5.3, 5.5, 6.4, 7.1, 7.4 (two) and 7.5.
  - The docstring names the headlines that cannot be stated: every statement about `ζ_K` off `Re s > 1` (0.4a, 1.1, 3.1–3.6, 4.1–4.10, 5.6, 7.2–7.4 under GRH), and the primitive-root bounds of 6.3–6.5, which carry supplier verifications or long sieve encodings. I checked these reasons against the pins.
  - The pinned `NumberField.dedekindZeta` is the Dirichlet series (`Mathlib/NumberTheory/NumberField/DedekindZeta.lean`).

### Sample read at the locators

| Target | Source and locator | Agreement |
|---|---|---|
| 0.2 | `louboutin2005` lines 50–51 | `Π_K(2)/Π_ℚ(2)ⁿ ≤ 1`, `= 1/(2ⁿ − 1)` when `2` is inert. The README's two "iff" directions are true by the argument that each local factor `2^f/(2^f − 1)` is smallest when `f = n`. |
| 0.4 | Mathlib `regulator_div_regulator_eq_two_pow_mul_indexRealUnits_inv` (`CMField.lean:439`); AnalyticNumberTheoryPartI §§2.7, 2.17a, 2.22 at its head; CyclotomicClassGroupsAndStickelberger §3.4 (README.md:653–669 at #1260) | Formula re-derived from the two class-number formulas. §3.4 proves integrality only at prime-power conductors, so the general divisibility `h(K⁺) ∣ h(K)` is this roadmap's. `washington1997` is uncertified (below). |
| 1.1 | `lee2023ideals` lines 173–179 (Theorem 2.2, which restates Rademacher's Theorem 4); `sunley1973` lines 148–158 | Both match the statement; the `sunley1973` locator is R01. |
| 1.1a | `dlmf` line 256 (5.7.6, `z ≠ 0, −1, …`); DLMF §5.15, eq. 5.15.1 read online | Both series hold on `Re z > 0`. |
| 2.1 | `widmer2010` lines 771–776, Theorem 5.4; `debaene2019` lines 205–215 | `c₀(D) = D^{3D²/2}`; `Lip(D, 1, M, L)`; translates; `Ω ≤ n^{3n/2}/(2π)^{n/2}`. |
| 2.2 | `sunley1973` lines 110–112; `lee2023ideals` lines 39–41 and 136–171 | Strict count `N𝔞 < x`, `n ≥ 2`; `ζ_K(0) ≠ 0` only for imaginary quadratic `K`. |
| 3.1 | `louboutin2003` lines 297–306, Proposition 6(1), (8) | `β ∈ [1/2, 1)`, exponent `n`. |
| 3.4 | `louboutin2003` lines 65–86 (Theorem 1 and Table 1) and lines 106–136 (proof) | Thresholds `270, 41, 26, 22, 21, 2π²`; `2600, 50, 25, 20, 2π², 2π²`; `36000, …, 181`, `167.63`; `2682.208`; the split formula with `λ/(s(s − 1))`. |
| 4.1 | `trudgian2015` lines 25–27; `hasanalizadeshenwong2022` lines 37–50, 52–54, 63–65, 76 | Theorem 2; Theorem 1.1, Corollary 1.2; the triple `(0.296, 3.971, 3.969)` for `T ≥ 1`. |
| 4.5 | `kadiri2012` lines 79–82, 87–94, 967 | Theorem 1.1, Corollary 1.2, and `1/c₁ = 1.6110`. The journal page 146 agrees with `louboutin2015ijnt` line 67, "[5, Page 146, end of section 3.5]". |
| 5.2 | `louboutin2005` lines 42–43 | `κ = (5 − 2 log 6)/2 = 0.70824`. The displayed bound is re-derived through the conductor–discriminant formula and AM–GM. |
| 5.4 | `cullyhugilltrudgian2021` arXiv v1, Theorem 1 (8), Corollary 1, Theorem 2; ExplicitMultiplicativeFunctions §§7.5, 7.9 | Statement true; locator wrong (R02). §7.9 states Tudzi's bound with `P₃` and *PiltzRemainderRangeVerified* `3 2 (1.1·10¹⁰)`. |
| 7.1 | `garcialee2022mertens` lines 89–128 | (A1)–(C2), (M1)–(M2), (Λ), (Υ) exactly as in `primeIdeal_mertens_garciaLee`. |
| 7.3 | `daskadiring2025` arXiv v1, (1.3), (1.8), (1.11), Corollaries 1.1 and 1.4 (pp. 3–5), Theorem 10 (p. 19), (7.32) | `n_L ≥ 2`; `0.2714`, `0.4452`, `0.285`, `2915`; `175 e^{−0.23…}`, `18458 e^{−0.25…}` for `n_L ≤ 519`, `729 n_L (log d_L)²`. `R₁ = 20` from `19.55293` and Lee's region, `R₂ = 12.2411`. `m = 1`, `T₀ = t₀ = 40`. |
| 7.4 | `ahnkwon2019` (arXiv:1807.00508), Theorem 1 with `P(C)` = degree-one primes, p. 3; `kadiringwong2019` arXiv v1, Theorems 1.1–1.3, Corollary 1.3.1, p. 1; `thornerzaman2017` (arXiv:1604.01750), (1.3)–(1.4) | `N𝔭 ≤ d_L^{12577}` for `L ≠ ℚ`; `d_L^{16}` for `d_L` large, degree one; `14.144`, `7.071998`, `B = 15.72`; `(4 log D_L + 2.5[L:ℚ] + 5)²` under GRH for Hecke L-functions. Ahn–Kwon §5 bounds local zero counts `n_L(t)`, not `N(σ, T)`, so the Scope's exclusion of density bounds is consistent with 7.4's route. |

Beyond the sample I also re-read:
- 3.3 and 4.7: `garcialee2022mertens` lines 1214–1305;
- 4.3 and 4.4: `louboutin2015ijnt` lines 27–59, 84–91 and `louboutin2017` lines 25–53;
- 5.3: `bordelles2002` lines 185–204 and 344–359, and `bordelles2006` lines 153–161;
- 5.5: `louboutin2003` lines 603–605;
- 5.6: `louboutin2003` lines 282, 307–368, 475–514;
- 6.4: `mcgowntrevinotrudgian2016` lines 40–76;
- 7.5: `debaene2019` lines 69–75 and 107–124.

All agree with the README as written, including the source repairs it states.

### Adversarial table (values computed this round)

| Statement | Instances | Values (left vs right) | Result |
|---|---|---|---|
| 0.1 `μ_K`, `b_K` | `ℚ(i)`; `ℚ(√−14)`; `ℚ` | `μ = 2/π = 0.6366`, `b = 1.273`; `b = (2/π)√56 = 4.7640`; `μ_ℚ = 1`, while the `r₁`-exponent model gives `4/π > 1` | as stated |
| 0.2 `Π_K(p)` | `ℚ(i)` at `2, 5, 3`; `ℚ` at `6`; quartic with `2` inert or totally ramified | `2`, `1.5625`, `9/8` (`3/2` with `p` for `N𝔭`); `Π_ℚ(6) = 3 > 6/5`; `(16/15)/16 = 1/15`, while totally ramified gives `2/16` | primes only; "iff" true |
| 0.3 class-number lemma, Nicolas–Tenenbaum | `ℚ(√−14)` at `b = 2.9` and at `b_K`; `n = 2` at `x = 10`, `√56` | `3 < 4` (not admissible), `8 ≥ 4`; `27 ≤ 33.026`; `16 ≤ 22.545` | as stated |
| 0.4 `relativeClassNumber`, `classNumber_maximalRealSubfield_dvd` | `ℚ(i)`; `ℚ(ζ₈)`; `ℚ(√−5)` | `1·4·2·(π/4)/(2π) = 1`; `L(1, η) = 0.872358`, `√32 · 0.872358 · 8/(4π²) = 1.000`, `256 = 8²·4`, `d_K/d_{K⁺} = 32 = 8·4`; `2/1 = 2` | true |
| 0.4a continued Euler product | `ℚ(i)` inside `ℚ(ζ₈)`; `s = 0`; `s = 1` | imprimitive product `(1 − 2^{−s}) ζ L(·, χ₋₄)` vanishes at `2πi/log 2`; `(−1/2)(1/2) = −1/4 = −h/w`; `dedekindZetaC F 1 = 0` against `ζ(1) κ_F = −0.977 κ_F` | primitive characters needed; `s ≠ 1` needed |
| 0.5 `GRHMod`, gap predicates, `HasNormalTower` | `q = 2`; `√d/log d`; `r = 0` | zeros of `1 − 2^{−s}` on `Re s = 0` excluded by `0 < Re s`; minimum `e/2 = 1.3591` at `d = e²`; `Fin 1` forces `⊥ = ⊤`, so only `ℚ` | as stated |
| 0.6 `leastPrimePrimitiveRoot` | `p = 7, 409, 2791, 11971`; `h(p)` | `(g, ĝ) = (3, 3), (21, 29), (6, 53), (10, 79)` against `√p − 2 = 0.65, 18.22, 50.83, 107.41`; `h(3) = 2`, `h(5) = 2`, `h(7) = 3`, `h(40487) = 10` | matches Checks |
| 1.1 Rademacher (R01) | `ℚ`, `s = 1/2`, `η = 1/2`; `ℚ(i)`, `s = 1/2 + 10i`; record of `10ζ` | `11.4877 ≥ 1.46035`; `66.552`, height factor `3.2187` (`2.5372` without the `n`-th power); `14.60 > 11.49` | as stated |
| 1.1a `digamma_series_remainder`, `trigamma_series_remainder` | `z = 3, N = 1`; `z = 1 + i, N = 1`; trigamma at `(0.999, 50)`, `(0.1, 1)`, `(1, 1)` | `5/6 ≤ 2` (with `a = Re z`, `2/3 < 5/6`); `ψ(1+i) = 0.094650 + 1.076674i`, remainder `0.60174 ≤ 1`; `0.019802 ≤ 0.020000`, `1.43330 ≤ 10`, `0.644934 ≤ 1` | true; cap `min(1, Re z)` needed |
| 2.1 Widmer | `D = 1`, `S = [0, X]`; `D = 2`, disc of radius `R` | `|⌊X⌋ + 1 − X| ≤ 1 ≤ 2`; `2⁶ max(1, 2πR) = 128πR` | true |
| 2.2 `idealCount_sunley` | `ℚ(i)`, `x = 10`; `n = 1` | count `9`, `κx = 7.854`, error `1.146` against more than `e^{61.4}`; `n = 1` excluded (`x < 1`) | true; `n ≥ 2` needed |
| 2.4 `idealCount_debaene`, `classIdealCount_debaene` | cubic field of discriminant `−23`; `ℚ` | `1 + log(Rh) = −0.2687` (printed form false), `log⁺` gives `1`; `n = 1`: `|⌊x⌋ − x| ≤ 1` | true with `log⁺` |
| 2.5 `rayClassIdealCount_gunRamareSivaraman` | `ℚ`, `𝔮 = (1)`; `𝔮 = (5)` | `E = 1039.72`, `F = 2`, bound `3729.86` against a left side below `1`; without `2^{r₁}`: `1144.25`; main term `x/5` | true |
| 3.1 | `ℚ(√5)` | `κ = 0.430409 ≤ (1 − β) · 1.196238`, so `1 − β ≥ 0.359802`; kernel derivative `log x (x^{u−1} − x^{−u}) ≥ 0` iff `u ≥ 1/2` | `β ≥ 1/2` needed |
| 3.2 | cubic field of discriminant `−23`, `2` inert | `κ = 0.368409 ≤ 9.206` | true |
| 3.3 `dedekindZeta_residue_ge_friedman` | `ℚ(ζ₅)`; cubic `−23`; `n = 1` | `0.339837 ≥ 0.032407`; `0.368409 ≥ 0.0756` (`R/w = 0.14060 ≥ 0.09058`); `2^{r₁}(2π)^{r₂} = 2 < 4` | `n ≥ 2` needed |
| 3.4 | `Λ_{{2}}`; thresholds; polar term | `8.492641`; `ϱ(1)Λ_{{2}} = 2293.01` against `ϱ₂(1) = 36000`; `2π²Λ_{{2}} = 167.638`, `32π²Λ_{{2}} = 2682.208`; at `s = 1/2`, `λ/(s(s − 1)) = −4λ` | matches source |
| 3.5 Garcia–Lee Mertens lemma | `x = 1.048, 2, 7, 13.5` | `2.79859 ≤ 4.71341`; `0.60502 ≤ 1.42104`; `0.248963 ≤ 0.249988`; `0.125980 ≤ 0.155306` (Schoenfeld `0.127871`) | true |
| 4.1 Trudgian | `ℚ`, `T = 15`; `ℚ(i)`, `T = 100`; Trudgian minus HSW | `2.620 ≤ 10.67`; main term `156.64 ± 19.51` covers `[150.08, 166.68]`; `0.021X + 2.362n − 0.487 > 0` | true |
| 4.4 | `P(S) = S⁴ + 2S³ − 2S² − 4S + 2` | `S₀ = 0.454334`, `D₁ = 0.276447 > 1/4`, second root `1.221332` in `[0, √2]`; `C₂ = 0.620756`, `D₂ = 0.500097` | root in `[0, 1]` |
| 4.5 Kadiri | `ℚ`, `|t| = 14.13`; real-zero constant | `1 − 1/87.32 = 0.98855` against `0.932`; `1/1.6110 = 0.620732 < C₂ = 0.620756` | consistent |
| 4.7 `starkAlpha`, `dedekindZeta_residue_gt_stark` | `c₄`; `ℚ(ζ₇)⁺`; gamma terms; degree bound | `c₄ = 43.162115`; `1/(16c₄) = 0.00144803`, with `43.2`: `0.00144676`; `0.0014883 < κ = 0.30026`; `−1.55412` per real place at `σ = 1`; `(4/9)(3π/4)³ = 5.814 ≥ 3^{3/2} = 5.196` | true |
| 4.8 | `n = 3`, `d = 23`, `|t| = 1`; `n = 2` real region | denominator `8.0799` (Lee `40.80`); `1/A''(2) = 0.6207556 ≤ C₂ = 0.6207565`; abscissae `0.9432`, `0.8349`, `0.8884`; `ℚ(√−3)`: `0.4350 < 1/2` | as stated |
| 5.1 | `ℚ(√5)`; `ℚ(i)`; `ℚ(√−3)` | `2.4456`; `2.3990`; `2.4697` | true |
| 5.2 | `ℚ(ζ₅)`; `d = 163`; `ℚ(√5)` | `9.808 ≥ 0.9624`; `13.23 ≥ 1`; `0.8997 ≥ 0.4812` | true |
| 5.3 `classNumber_le_bordelles` | `ℚ(√−14)`; cubic `−23`; `ℚ`; `a = 2/log 5`; fifth form at `b = 13` | `60.246 ≥ 4`, first form `11.187`, `2·6·log 6 = 21.50`; `94.30 ≥ 1`; `1 ≤ 1` with `0⁰ = 1`; `4.035 ≥ 1`; `82.61 ≥ 1` | true |
| 5.4 (R02) | `τ₄` at `193`; `τ₃` at `b = 1000, 100, 10, 2`; sign of `γ₁` | `9333 ≤ 9376.90`; `29425 / 29964.17 / 31266.30`, `1471 / 1552.33 / 1570.90`, `53 / 66.41 / 54.54`, `4 ≤ 6.637`; constant of `P₃` `0.48633`, with the opposite sign `0.04944` | true |
| 5.5 `relativeClassNumber_le` | `ℚ(i)`; `ℚ(√−3)`; `ℚ(√−5)`; `ℚ(ζ₈)` | `4.798 ≥ 1`; `4.939 ≥ 1`; `11.592 ≥ 2`; `12.717 ≥ 1`, `L(1, η) = 0.8724 ≤ 11.094` | true |
| 5.6 Theorem 11 threshold | `ℚ(√−3)`, `c = 2` | `(12)` gives `1.1077 > h = 1` | threshold needed, as stated |
| 6.1 Vinogradov | `ℤ/6` at `x = 1, 2`; `ℤ/2 × ℤ/2` at `0` | `3 · (1/3) = 1`, `0`; `−1` (non-cyclic, excluded) | as stated |
| 6.4 `leastPrimePrimitiveRoot_le_grh` | `p = 10⁹ + 7` (`p − 1 = 2 · 500000003`, prime); `p = 1000000021` (`ω = 6`) | `9894.6 < √p − 2 = 31620.8`; `4.3635·10⁶` | true |
| 7.1 `primeIdeal_mertens_garciaLee` | `ℚ(i)`, `x = 10` | product `0.284444`, `e^γ κ log x ∏ = 0.916188`, with `e^{−γ}`: `0.288816`; `M_K ∈ [−1.66435, 0.33565]` | normalisation pinned |
| 7.2 | `ℚ(i)`, `x = 100` | `ψ_K = 93.9327`, `|ψ − x| = 6.07 ≤ 94.763` | true |
| 7.3 | `ℚ(i)/ℚ` | range `log x ≥ 2801.0`, `λ_L = 1.9605`, last term `9.3·10⁻⁴` | matches source |
| 7.4 `leastPrimeIdeal_ahnKwon`, `leastPrimeIdeal_kadiriNgWong` | `ℚ(i)/ℚ` | least inert prime `3`, least split prime `5`; `(4 log 4 + 10)² = 241.6` | true |
| 7.5 `frobeniusPrimeCount_le_debaene` | `L = ℚ` at `x = 2, 2.6, e, 3, 10⁶`; cubic `−23` as `K` | `−56.78`, `0.1286`, `5.437`, `15.046 ≥ 2`, `7.09·10⁵ ≥ 78498`; printed factor `(−0.2687)^{12} = 1.4·10⁻⁷` | `x > e` and `log⁺` needed, as stated |

### Library declarations opened at the pins

I checked all 162 backticked names of the README against an index of the pinned Mathlib and Tau Ceti declarations. Every library name exists. The names not in the pins are this roadmap's own declarations, or targets of LFunctions, AnalyticNumberTheoryPartI and ClassFieldTheory.

Opened:
- **Mathlib.**
  - `NumberField/ClassNumber.lean:78` `exists_ideal_in_class_of_norm_le`;
  - `Discriminant/Basic.lean:210` `abs_discr_ge'`;
  - `Gamma/Digamma.lean:48, 56, 72, 94` (`digamma`, `digamma_one`, `digamma_apply_add_nat`, `digamma_one_sub`);
  - `Cyclotomic/Galois.lean:188` `intermediateFieldEquivSubgroupChar`;
  - `DirichletContinuation.lean:97` `differentiable_LFunction`;
  - `DirichletCharacter/Basic.lean:306` `primitiveCharacter`;
  - `CMField.lean:439`;
  - `Log/PosLog.lean:38` `posLog`;
  - `DedekindZeta.lean:78`.
- **Tau Ceti.**
  - `ArithmeticDirichletSeries/Counting.lean:103, 107` (`idealsLE`, `primesLE`, norm at most `x`);
  - `Chebotarev/PrimeCounting/VonMangoldt.lean:177` (`frobeniusPrimeCount`, unramified primes of `K` of norm at most `x`);
  - `Meromorphic/Continuation.lean:40`;
  - `DirichletCharacter/Conrey.lean:78`;
  - `AdmissibleModulus/Basic.lean:193`;
  - `LFunctions/Mertens.lean:545`;
  - `ZLattice/SuccessiveMinima.lean:111`.

### Cross-roadmap citations, resolved at main or at the open head

- **CyclotomicClassGroupsAndStickelberger §3.4** (#1260). Euler product on `Re s > 1`, residue comparison, Gauss-sum product, `relativeClassNumber_character_product`; README.md:609–671 and Suggested.lean:165–187 at its head.
- **ExplicitZetaBounds** (#1954). §§0.4b (`LuZamanZhaoRecord`), 0.5, 2.1, 2.5, 2.6, 3.2 (with the majorant clause), 5.1, 6.1a, 7.7, 7.9 (Guo and Banks instances), 9.1.
- **ExplicitPrimeCounting** (#1945).
  - §1.3: `ButheVerified`, `Schoenfeld1976Range`, `Buthe2016Range`, *LeeNosalMertensRange*, `LeeNosalRange`.
  - §1.1: `ZetaZeroReciprocalSum`, `ZetaZeroCountLowRange`.
  - §1.7 *RealZeroGap*.
  - §2.2, two-sided from `73.2`, lower side from `59`.
  - §4.7, from `24.4`.
- **ExplicitMultiplicativeFunctions** (#1946). §§1.2, 2.3, 2.5, 7.1, 7.5 (Bordellès, Cully-Hugill–Trudgian), 7.9, 8.1, 9.1, 9.4, and the Layer 0.7 predicates with the instances quoted.
- **ExplicitCharacterSumsAndSieves** (#1948). §4.1 with the `r = 2` refinements, §3.5 `A(q₀)`, §6.1.
- **AnalyticNumberTheoryPartI** (#1126). §§0.34, 0.34a, 1.6, 2.5, 2.7, 2.9a, 2.15, 2.15a, 2.17a, 2.18, 2.22, 2.31d, 2.31e, 2.39, 2.39b, 2.42, 2.43, 2.49.
- **On main.**
  - LFunctions: `dedekindZetaC_quadratic`, `dedekindZetaC_cyclotomic`, `tendsto_prod_one_sub_inv_absNorm_div_log`, `heckeData`.
  - ZerosOfLFunctions: 3.1, 4.1–4.3, 5.5–5.6, 6.1–6.5, 7.1–7.5, 8.5, Layer 9.
  - ClassFieldTheory: `globalArtinMap_ideal`, `kroneckerWeber`, `artinMap_groundNorm`, `gal_hilbertClassField_equiv_classGroup`.
  - ImaginaryQuadraticClassNumber H2.2, which the open revision #1914 keeps.

### Ownership and overlaps

- **The four abelian products.** `roadmaps grep` finds them only in CyclotomicClassGroupsAndStickelberger. `h(K⁺) ∣ h(K)` for every CM field, and `relativeClassNumber`, have no other owner.
- **The continued abelian Euler product of 0.4a** has no other owner as a target. AnalyticNumberTheoryPartI §2.42 uses the same factorization inside its bullet `DedekindERH.of_abelian` without a supplier. That is a matter for that roadmap's review: it is earlier in the order and cannot cite 0.4a.
- **Overlaps.** `overlaps.md` lists no dropped id and no open revision of this roadmap. The renamed 0.4a heading keeps its number, and no other roadmap cites 0.4a.
- **Declared gaps.**
  - The README states three: `artin-norm-compatibility` (ClassFieldTheory Layer 11, which on main has only the local `artinMap_norm` and the abstract Layer 4 diagram), `explicit-mertens-second` (ExplicitPrimeCounting §4.7 starts at `24.4`) and `bach-grh-smoothed-sum` (§6.5 has no smoothed character sum).
  - Each `needs` is precise, each is still missing at its supplier, and each slug matches `plan.json`.
  - The other fifteen plan gaps are cited as the supplier sections above, which now state them.

## Not verifiable

- These texts are recorded as uncertified or waived and were not read: `rademacher1959`, `louboutin2000`, `louboutin2001`, `louboutin2015mmj`, `friedman1989`, `washington1997` (Theorem 4.10), `stark1974`, `lang1994`, `chen2022`, `ramare2001`, `ramare2025`, `palojarvisimonic2026`, `bachsorenson1996` (checked only through `thornerzaman2017` (1.4)), `mcgownsorenson2024`, `tudzi2026`, `leenosal2026`, `lamzourilisoundararajan2015`, `kadiriwong2022`, `odlyzko1976`, `luzamanzhao2026`, `kadiring2012`, `cholemkeoliverzaman2025`, `amberger2026`, `openai2026siegel`, `kerr2026`, `green2026`.
- These preprints were checked last round and not re-read: `fehnker2026`, `gglm2026`, `dglsw2025`, `guo2026`, `banks2026siegel`, `banks2026brauersiegel`.
- I read `daskadiring2025` v1, `ahnkwon2019`, `kadiringwong2019` v1, `thornerzaman2017` and `cullyhugilltrudgian2021` v1 on arXiv, and DLMF §5.15 online. Nothing was recorded in a manifest.
- I could not check whether the Ramanujan J. printing of `cullyhugilltrudgian2021` keeps the arXiv numbering of R02.

## Source issues

- **Misprint** in cullyhugilltrudgian2021 at Corollary 1, p. 3 (arXiv v1): the class-number bound for quartic fields is printed in the variable `x` although its hypothesis is on the Minkowski bound `b ≥ 193`; it should read `h_K ≤ (1/3) b log³ b`; affects nothing.
- **Misprint** in louboutin2017 at Theorem 2, p. 109: the source calls `S₀` the only root of `S⁴ + 2S³ − 2S² − 4S + 2` in `[0, √2]`, which has a second root `1.2213`; it should say the only root in `[0, 1]`; affects nothing.
- **Gap** in louboutin2015ijnt at Corollary 4, p. 2: the source asserts no real zero of `ζ_K` in `[1 − c₂/log d_K, 1)` for odd-degree Galois `K`, but its proof excludes only zeros of odd multiplicity and works at `1 − 2/log d_K`; it should assert no zero of odd multiplicity there, hence `ζ_K ≤ 0`, with `c₂` throughout; affects a stated result.
- **Error** in louboutin2003 at Theorem 11, p. 3088: the source asserts (12) with `c = 2` for every CM field with `ζ_K/ζ_k ≥ 0` on `(0, 1)`, with no root-discriminant threshold, and `ℚ(√−3)` then gets `h⁻ ≥ 1.108`; it should require the thresholds of Theorem 1 that its proof applies; affects a stated result.
- **Misprint** in louboutin2003 at Theorem 13, p. 3088: the source writes root number for root discriminant and the range `[−2/log d_K, 1)` for `β`; it should be root discriminant and `[1 − 2/log d_K, 1)`; affects nothing.
- **Misprint** in bordelles2006 at §1, p. 2: the source defines the first Piltz function as `τ₁(m) = m`; it should be `τ₁(m) = 1`; affects nothing.
- **Error** in debaene2019 at Theorem 1, p. 2: the source asserts the bound for every `x` with `x(log x)^{−5n²} ≥ c_K`, including `x` near `1`, where the right side is negative (`−56.8` at `L = ℚ`, `x = 2`); it should assume `x > e`; affects a stated result.
- **Error** in debaene2019 at Corollary 2, p. 3: the source uses the factor `1 + log(Reg_K h_K)`, which is negative when `Reg_K h_K < 1/e` (cubic field of discriminant `−23`); it should be `1 + log⁺`, as its proof gives; affects a stated result.
