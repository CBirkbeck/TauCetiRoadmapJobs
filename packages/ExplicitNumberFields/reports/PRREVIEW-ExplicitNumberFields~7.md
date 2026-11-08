# Review of ExplicitNumberFields (pull request #1944 at e163ff8)

**Verdict:** needs changes

This is a full re-review. 1600 lines of the folder changed since `0019da2` (1256 insertions, 344 deletions). No repair report exists for the r6 review, so none of its findings is settled. Nothing outside the folder changed.

## Previous findings (r6, at `0019da2`)

| r6 | Passage at this head | Status |
|---|---|---|
| R01 (P2): §1.1a re-plans ComputationalNumberTheory §4.17a | Ownership moved here. ComputationalNumberTheory at its head (`12bae677`) now consumes 1.1a: its README.md:127–128 and 411–417, and its Suggested.lean:490–492 name `digamma_series_remainder` and `trigamma_series_remainder`. Its §4.17a is now "Weighted alternating Odlyzko tail". The dependency check of that head moves it to #272, after this roadmap, with 0 problems. | repaired, by moving ownership instead of deleting |
| R02 (P2): §0.4a re-plans CyclotomicClassGroupsAndStickelberger §3.4 | The four theorems are gone from `Suggested.lean`, and the §3.4 contract is restored (README.md:606–616). 0.4a keeps only the passage to the continued functions (README.md:1010–1012). §3.4 at its head proves the Euler product on `Re s > 1` and the limit at `1`, nothing off the half-plane. | repaired |
| R03 (P2): two gaps ask for what ExplicitZetaBounds provides | §6.1a and §7.9 are now contracts (README.md:658–687), and both gap slugs are gone from the README. | repaired |
| R04 (P2): 5.7 misreads Banks; Stark's lemma unowned | The route now uses Stark's Lemmas 2–4 (README.md:2754–2758), and the Chebotarev claim is deleted. The uniform constant is assigned to AnalyticNumberTheoryPartI §2.31e, which does not state it. | partly repaired → R01 |
| R05 (P3): `letI` in four signatures | The four theorems are deleted. The gate reports `statement-hygiene=0`. | repaired |
| R06 (P3): no Checks or Examples | The README now has 64 `**Checks.**` lists, 8 `### Examples` and 8 `### Dependencies`. | repaired |
| R07 (P3): supplier verifications not named | They are listed under "Imported, as their owners state them" (README.md:362–419). They are named in 6.2 (2826–2832), in the GGLM theorem of 3.6 (1888–1894), in 4.9 (2331–2334) and in the §7.9 contract (667–671). | repaired |
| R08 (P3): Amberger and DGLSW certificates | Amberger moves to Part II (README.md:197–201). The DGLSW polynomials are named with their tables (301–311), and that list matches arXiv v1 Tables 2, 3 and 11–13. | repaired |
| R09 (P3): two narrowed statements | (a) README.md:2879 now reads "`r ≥ 1` and `h ≥ 2`". (b) README.md:2402 now reads "for every real zero `β₁ ∈ (0, 1)` … exceptional or not". | repaired |
| R10 (P3): two locators | (b) README.md:371 now reads "ExplicitPrimeCounting §1.3". (c) README.md:355 now reads "lines 82–84". | repaired |
| R11 (P3): false reason for omitting Kadiri–Ng–Wong | `leastPrimeIdeal_kadiriNgWong` is now stated, with an absolute `D₀` (Suggested.lean:306–316). | repaired |

## R01 (P2) — 5.7 needs a Stark constant that is uniform in the degree, and §2.31e does not state one

**Location.**
- README.md:568–573, the AnalyticNumberTheoryPartI contract: "Stark's Lemmas 2–4, its interface `dedekind_residue_lower_of_zero_gap` … this contract takes `c > 0` absolute, independent of `K` and of its degree, as Stark's Lemma 4 gives it".
- 5.7's route (README.md:2754–2758) and its *Needs:* line (README.md:2778).

**Claim.** 5.7's whole content is that one `C`, depending only on `c₀`, works for Galois fields of every degree. Its route gets `C = c min(c₀, 1/4)` from the Stark constant `c`, so `c` must not depend on `n`. The contract adds that property itself; the cited supplier section does not state it. So the degree-uniform form of Stark's Lemma 4 has no owner.

**Witness.** AnalyticNumberTheoryPartI at its head:
- §2.31e (README.md:1609) is titled "Fixed-degree residue lower bound, including nonnormal fields". Its constants are degree-indexed (`c_(n,a)`).
- Its Stark paragraph (README.md:1611) gives `κ_K ≥ c min(1/log D_K, 1 − β_K)`, citing "bounded Gamma derivatives". It never says that `c` is independent of `n`.

**Repair.**
1. In 4.7, add a target: there is an absolute effective `c > 0` such that for every number field `K ≠ ℚ`:
   - `κ_K ≥ c min(1/log d_K, 1 − β_K)` when `ζ_K` has a real zero `β_K` in Stark's rectangle `σ ≥ 1 − 1/(4 log d_K)`, `|t| ≤ 1/(4 log d_K)`;
   - `κ_K ≥ c/log d_K` when it has none.

   Locator: Stark 1974, Lemma 4, via `banks2026brauersiegel` Lemma 3.3. 4.7's route already supplies the uniformity: the integration from `σ₀ = 1 + 1/(4 log d_K)` with the gamma terms of 4.3, which are negative on `1 < σ ≤ 2`.
2. Cite 4.7 for that target in 5.7's route and *Needs:*.
3. In the §2.31e contract, delete the clause "this contract takes `c > 0` absolute … used in 5.7".

If AnalyticNumberTheoryPartI is to own it instead, write "What AnalyticNumberTheoryPartI must provide (gap:stark-residue-lemma-uniform): …" with the statement above, and add the slug to `design/plan.json` `gaps`.

**Tested.** Take a Galois `K` of degree `n` with a real zero at `(1 − β) log d_K = c₀`, the worst case of the route.
- With an absolute `c`: `κ_K ≥ c c₀/log d_K`, so `C = c min(c₀, 1/4)` for every `n`, as 5.7 states.
- With the `c_n` that §2.31e allows: the same steps give `C = c_n min(c₀, 1/4)`, which depends on `n`.

## R02 (P3) — 7.2's route has no input for `L = ℚ` and `59 < x ≤ 73.2`

**Location.**
- *GrenieMolteniSmallCases* (README.md:357–360): "for `L = ℚ` and `1 ≤ x ≤ 59`".
- 7.2's route (README.md:3190): "for `L = ℚ`, `x > 73.2`, Schoenfeld's `ψ` bound (ExplicitPrimeCounting §2.2 …)".

**Claim.** For `L = ℚ`, the stated inputs cover `[1, 59]` and `(73.2, ∞)`, and nothing covers `(59, 73.2]`. `greniemolteni2019` (arXiv v3, §5, p. 19) closes that range by remarking that Schoenfeld's bound extends down to `59`. That remark is a finite verification, and the README's Conventions require every finite verification to be a named hypothesis.

**Witness.** ExplicitPrimeCounting at its head:
- §2.2 (README.md:1360) gives the two-sided bound only for `x > 73.2`, and from `x > 59` only the lower side `ψ(x) − x > −…`.
- Its §1.3 predicate `Buthe2016Range` (README.md:1050) gives `|ψ(x) − x| ≤ √x log² x/(8π)` for `59 < x < 5000`.

**Repair.** Either:
- add ExplicitPrimeCounting's `Buthe2016Range` (§1.3) to 7.2's hypotheses and to its *Needs:* line, and say in the route that it covers `L = ℚ` on `59 < x ≤ 73.2`; or
- extend *GrenieMolteniSmallCases* for `L = ℚ` to `1 ≤ x ≤ 73.2`.

**Tested.** On `(59, 73.2]`, sampled every `0.01`:
- the largest value of `|ψ(x) − x|` divided by `√x log² x/(8π)` is `0.808`, at `x = 66.99`, where `|ψ − x| = 4.65` against `5.76`;
- the theorem's bound there is `22.13`.

So the statement is true on that range, and either repair completes the route.

## R03 (P3) — The §0.5 contract leaves out a clause of the supplier's definition

**Location.** README.md:653–655: "§0.5: *IsAdmissibleCosinePolynomial* `n a` (`0 ≤ a_k` for `k ≤ n`, `a₀ < a₁`, and `Σ_{k ≤ n} a_k cos(kθ) ≥ 0` for every real `θ`)".

**Witness.** ExplicitZetaBounds §0.5 (README.md:621–623 at its head) also requires `a k = 0` for `k > n`. It explains that this clause makes `a` the coefficient vector of the polynomial.

**Repair.** Add "and `a_k = 0` for `k > n`" to the parenthesis at README.md:653–654.

**Tested.** Take `n = 4` and `a = (3, 4, 1, 0, 0, 1, 0, …)`, so `a₅ = 1`.
- The README's three clauses hold: `3 + 4 cos θ + cos 2θ = 2(1 + cos θ)² ≥ 0` and `3 < 4`.
- The supplier's predicate fails at `k = 5`.

## R04 (P3) — The class-number lemma and Bordellès' fifth form are narrower than `bordelles2006`

**Location.**
- 0.3 (README.md:893–895): "Prove the class-number lemma: `h_K ≤ Σ_{m ≤ b_K} τ_n(m)`", with `b_K` the Minkowski bound of 0.1.
- 5.3, fifth bullet (README.md:2515–2517): "`h_K ≤ (b/(n−1)!)(log b + n − 2)^{n−1}` for `n ≥ 3` and `b ≥ 13`", with `b = b_K`.

**Witness.** `bordelles2006` states both results for any real bound such that every ideal class contains an integral ideal of norm at most that bound (line 61, Lemma 1.1; lines 158–161, Theorem 2.2). It does not require the Minkowski bound. The README's own locator at README.md:895 says so.

**Repair.**
- State the class-number lemma for every real `b > 0` such that every class contains a nonzero integral ideal of norm at most `b`, and keep `b = b_K` as the instance given by 0.1.
- State the fifth form for every such `b ≥ 13`, keeping the `μ_K` form as its instance at `b = b_K`.

**Tested.** The cubic field of discriminant `−23` has `b_K = (4/π)(6/27)√23 = 1.357 < 13`, so the README asserts nothing there. Since `b = 13` is admissible, the source gives `h_K ≤ (13/2)(log 13 + 1)² = 82.6`.

## Verified sound

**Gate, dependency check and build.**
- Gate rerun (`gate … ExplicitNumberFields --base origin/main`): every count is `0`, result OK. This matches the worker's gate at this head, whose build is `0`.
- Dependency check: `depcheck: 237 roadmaps, 2428 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- Merge-order lines: this roadmap is 272. Its suppliers are LFunctions 27, CyclotomicClassGroupsAndStickelberger 33, ZerosOfLFunctions 48, AnalyticNumberTheoryPartI 49, SmallRamificationAndAbelianVarietyBaseCases 120, ExplicitZetaBounds 267, ExplicitPrimeCounting 269, ExplicitCharacterSumsAndSieves 270 and ExplicitMultiplicativeFunctions 271. The consumer ComputationalNumberTheory (266) is moved by its own check to #272, after this roadmap.
- `lake env lean TauCetiRoadmap/ExplicitNumberFields/Suggested.lean` gives 16 warnings, all `declaration uses 'sorry'`, at lines 97, 129, 138, 149, 161, 173, 188, 209, 226, 238, 248, 262, 278, 299, 310 and 325, and nothing else.
- I ran `#check @name` for all 21 declarations in one scratch file. Each elaborated type matches its README statement and `signatures.md`. The file has no `variable` block, so no binder is lost. Nothing changed.
- One-tactic probe on a scratch copy: each of the 16 theorems was tried with `first | (simp; done) | rfl | (norm_num; done) | trivial | infer_instance | decide | (positivity; done) | (nlinarith; done)`. All 16 fell through to `sorry`, so none is padding.
- The 1.1a theorems are kept as declared names because ComputationalNumberTheory cites them by name. The module docstring says so.
- Gaps: the README declares `gap:artin-norm-compatibility`, `gap:explicit-mertens-second` and `gap:bach-grh-smoothed-sum`, all three in `design/plan.json`. Each is still missing at the supplier:
  - ClassFieldTheory Layer 11 has `globalArtinMap_ideal` and towers, but no ideal-level norm compatibility under a change of base field;
  - ExplicitPrimeCounting §4.7 starts at `24.4`;
  - its §6.5 has no smoothed Bach sum.
- The other plan gaps are now cited as supplied sections, and each was resolved below.

**Library declarations opened at the pins.**
- Mathlib:
  - `NumberField/ClassNumber.lean:78` `exists_ideal_in_class_of_norm_le`;
  - `Discriminant/Basic.lean:210` and `:244`: `abs_discr_ge'` and `abs_discr_ge`;
  - `CMField.lean:439` `regulator_div_regulator_eq_two_pow_mul_indexRealUnits_inv`;
  - `DedekindZeta.lean:61` `dedekindZeta_residue_def`;
  - `Gamma/Digamma.lean`: `digamma_one_half` at `:59`, and `digamma_apply_add_nat`, `digamma_nat_add_one`, `digamma_one_sub`. There is no digamma series, in Mathlib or Tau Ceti;
  - `LSeries/PrimesInAP.lean:431` `infinite_setOfPred_prime_and_eq_mod`;
  - `Cyclotomic/Galois.lean:38` `intermediateFieldEquivSubgroupChar`;
  - `Log/PosLog.lean:38` `Real.posLog`;
  - also `Gammaℝ_mul_Gammaℝ_add_one`, `isCyclic_units_prime`, `isCyclic_units_of_prime_pow`, `differentiable_LFunction` and the Bohr–Mollerup, uniform-limit and identity-theorem lemmas of 1.1a.
- Tau Ceti:
  - `frobeniusPrimeCount` (`Chebotarev/PrimeCounting/VonMangoldt.lean:177`);
  - `frobeniusPrimeSet` (`Chebotarev/FrobeniusPrimeSet.lean:93`);
  - `abelianConductor` (`ClassFieldTheory/Global/AdmissibleModulus/Basic.lean:193`);
  - `conreyGenerator` (`DirichletCharacter/Conrey.lean:78`);
  - `mertensConstant` (`LFunctions/Mertens.lean:545`);
  - `rayClassIdealCountingFunction` (`RayClass/Count/Basic.lean:100`);
  - `idealsLE` and `primesLE`, whose types were checked by `#check`.

**Cross-roadmap citations resolved, at main or at the open head.**
- ExplicitZetaBounds:
  - §0.4b `LuZamanZhaoRecord`; §0.5 (R03);
  - §§2.1, 2.5; §3.2, whose finite-order record matches 1.1's instance; §5.1, Backlund's lemma with `Re f(a + iT)`;
  - §6.1a, iterated Perron for `j ≥ 1`; §7.7;
  - §7.9: Guo's `(1/100) ∞` strict, and Banks's `(3.0·10⁻³) ∞` given the record;
  - §9.1, Ramaré's bounds.
- ExplicitPrimeCounting:
  - §1.1 `ZetaZeroReciprocalSum` and `ZetaZeroCountLowRange`;
  - §1.3, every predicate named under "Imported";
  - §1.7 *RealZeroGap*; §2.2 (R02); §4.7, Lee–Nosal from `24.4`.
- ExplicitMultiplicativeFunctions §§1.2, 2.3, 2.5, 7.1, 7.5, 7.9, 8.1, 9.1 and 9.4, each with the predicates named here.
- ExplicitCharacterSumsAndSieves:
  - §4.1, the shifted moment bound and its `r = 2` refinements;
  - §3.5, `A(q₀)` with `0.8204/log q₀`;
  - §6.1 `LapkovaSmallModuliVerified`.
- AnalyticNumberTheoryPartI:
  - §§0.34 and 0.34a, 1.6, 2.5, 2.7, 2.15 and 2.15a, 2.17a, 2.18, 2.22, 2.31d;
  - §2.31e (R01); §§2.39, 2.39b, 2.42, 2.43, 2.49.
- CyclotomicClassGroupsAndStickelberger §3.4.
- LFunctions Layers 0, 3, 4 (`dedekindZetaC_quadratic`, `dedekindZetaC_cyclotomic`), 5, 7 and 8.
- ZerosOfLFunctions 3.1, 4.1–4.3, 5.5, 5.6, 6.1–6.5, 7.1–7.3 and Layer 9.
- ClassFieldTheory Layers 4, 11, 12 and 13.
- ClassicalArithmeticCompletion §1.5, ImaginaryQuadraticClassNumber H2.2, SmallRamificationAndAbelianVarietyBaseCases §1.7, and SuccessiveMinima Layer 1.

**Ownership by object.** I ran `roadmaps grep` over main and every open head for `GRHMod`, `leastPrimePrimitiveRoot`, the digamma remainders and relative class numbers, and read the scopes of the five closest roadmaps of `overlaps.md`.
- Only ComputationalNumberTheory cites the remainders, as a consumer.
- No other roadmap owns `h(K⁺) ∣ h(K)` for general CM `K`: Cyclotomic §3.4 has integrality only at prime-power conductors, and IntegralIwasawaTheory §5.4 has none.
- No other roadmap owns the continued abelian Euler product: AnalyticNumberTheoryPartI §2.42 uses it only inside `DedekindERH.of_abelian`.
- ExplicitPrimeCounting §6.5 proves only the cyclotomic instance of Bach–Sorenson and leaves the general case of 7.4 to others.
- ExplicitCharacterSumsAndSieves excludes primitive roots.

**Sample read at the locators.**

| Target | Source and lines | Agreement |
|---|---|---|
| 0.2 | `louboutin2005` 50–51 | Ratio `≤ 1`, and `1/(2ⁿ − 1)` when `2` is inert. I proved the README's two "iff"s: equality forces `g = n`; the inert value forces `g = 1` and `f = n` |
| 0.3 | `bordelles2002` 72–77, 79–91; `bordelles2006` 61 | Coefficient bound, Lemma 1.1, Nicolas–Tenenbaum (1.2). I re-derived the induction: `(x/n!)(n y^{n−1} + yⁿ − (n−1)ⁿ) ≤ (x/n!)(y + 1)ⁿ` |
| 2.5 | `gunramaresivaraman2023` 66–82, 1102–1104 | Theorem 1 term for term (`E(K)`, `F(𝔮)`, `n^{8n} R w F`); Lemma 13 gives `F ≥ 1` |
| 2.6 | `fehnker2026` arXiv v1, Theorem 1.1, p. 2 | (A1), (A2), (B2); `t ≥ (10n²√Δ)ⁿ`; `log⁺ = max(1, log)`; `E₁`, `E₂` as stated |
| 3.2 | `louboutin2005` 307 (p. 569) | Theorem 10 is on that page, but the displayed (13) is lost in the extraction. I derived the form from the route: `(1 − 2^{−s}) ≤ 2^{s−2}` on `[1, 6]` |
| 3.3 | `garcialee2022mertens` 1214–1225 | (22), `2^{r₁}(2π)^{r₂} ≥ 4`, Friedman's `0.09058` |
| 3.4 | `louboutin2003` 65–86, 106–136 | Theorem 1 (1), (2), (4); Table 1 entry for entry; `A_K`; the split formula; the sign `λ/(s(s − 1))` |
| 4.2 | `hasanalizadeshenwong2022` 52–77 | Theorem 1.1, Corollary 1.2, Table 1 row `(0.296, 3.971, 3.969)` |
| 4.4 | `louboutin2017` 31–53 | Theorems 2–3: `c₁ = 0.34314`, `d₁ = 0.27644`, `c₂ = 0.62075`, `d₂ = 0.50009`, `(0.59110, 1/4)`, `(0.10379, 1)` for `d_K > 8` |
| 4.8 | `dglsw2025` arXiv v1 pp. 2–4, Tables 1–3, 11–13, (4.18) | Theorems 1.1–1.5 with every constant; `d_min` table; polynomial assignments |
| 5.2 | `louboutin2005` 42–43 | `κ = (5 − 2 log 6)/2 = 0.70824`. The display is lost in the extraction. I derived the base `log d/(4n − 4) + κ/2` from Ramaré's odd bound |
| 5.3 | `bordelles2002` 185–204, 345–359; `bordelles2006` 153–161 | Theorems 5.1–5.3, 2.1–2.2. The `a = 3` condition is `d ≥ e^{2(n−1)/3}` (line 357); Minkowski's margin at `n = 2` is `0.236` (R04) |
| 6.1 | `mcgowntrevinotrudgian2016` 84–98; `kerrmcgowntrudgian2020` 90–113 | The indicator identity; Lemma 1's sieved form |
| 6.4 | `mcgowntrevinotrudgian2016` 40–41, 56–76, 151–255 | Theorems 1–3, Bach's `c(p, x)`, Corollaries 2 and 4, the window `(1.30·10¹⁶, 1.71·10¹⁶)`, Table 2 |
| 7.2 | `greniemolteni2019` arXiv v3 pp. 2–3, 19, 24–25 | Theorem 1.1, Corollary 1.2 (`π_C` line), small cases `L = ℚ` on `[1, 59]` and quadratic `d < 300` up to `10⁵` (R02) |
| Context | `debaene2019` 69–75, 107–124; `sunley1973` 110–112; `lee2023ideals` 39–70; `louboutin2003` 280–345, 399–520, 596–606; `louboutin2015ijnt` 27–91; `garcialee2022mertens` 89–128; `garcialee2022artin` 24–71, 121–147; `mcgowntrudgian2020` 201–234, 416–430; `kerrmcgowntrudgian2020` 25–136, 278–297 | Agree as cited, apart from the source issues below |

**Adversarial table (values computed this round).**

| Statement | Instances | Values (left vs right) | Result |
|---|---|---|---|
| `classNumber_maximalRealSubfield_dvd` | `ℚ(√−5)`; `ℚ(ζ₂₃)` | `1 ∣ 2`; `1 ∣ 3` | true |
| `GRHMod` | `q = 1, 2, 4` | `q = 2`: the Euler-factor zeros lie on `Re s = 0`, outside `0 < Re s`, so `GRHMod 2 ↔ RH`; `q = 4`: RH and `χ₋₄` | as stated |
| `HasNormalTower`, `starkAlpha` | `ℚ`; `ℚ(ζ₅)`; `ℚ(2^{1/4})`; cubic `−23`; quartic `α⁴ − α − 1` | `r = 0` tower; `α = 4, 16, 24`; the quartic (Galois group `S₄`, resolvent `x³ + 4x − 1`) has no tower | as stated |
| `leastPrimePrimitiveRoot` | `7, 409, 2791, 11971, 2` | `ĝ = 3, 29, 53, 79, 3` (against `g = 3, 21, 6, 10, 1`) | matches Checks |
| `digamma_series_remainder` | `z = 3, N = 1`; `z = 1 + i, N = 1` | `0.8333 ≤ 2` (with `a = Re z` the bound would be `0.667 < 0.833`); `0.6017 ≤ 1` | true; cap at `1` needed |
| `trigamma_series_remainder` | `z = 1, N = 1`; `z = 0.999, N = 50` | `0.6449 ≤ 1`; `0.0198 ≤ 0.0200` | true |
| `idealCount_sunley` | `ℚ(i), x = 10`; `0 < x < 1` | `|9 − 7.854| = 1.146` vs `> e^{61}`; left side `κx`, right side `≥ A_S d^{1/3}(log d)² x` | true |
| `idealCount_debaene` | `ℚ`; `ℚ(√5), x = 10`; cubic `−23` | `|⌊x⌋ − x| ≤ 1`; `|4 − 4.304| = 0.304` vs `2.41·10¹²`; printed `1 + log(0.2812) = −0.2687`, while `log⁺` gives `1` | true with `log⁺` |
| `classIdealCount_debaene` | `ℚ(√−5)`, trivial class, `x = 10` | `|8 − 7.025| = 0.975` vs `≥ 2^{40}·…` | true |
| `rayClassIdealCount_gunRamareSivaraman` | `ℚ`, `𝔮 = (5)`, class of `1`, `x = 100` | count `20` = main `1·4·100/(4·5) = 20`; bound `1039.7·2·log 6 + 4 = 3730` | true |
| `dedekindZeta_residue_ge_friedman` | `ℚ(i)`; `ℚ(ζ₅)`; cubic `−23` | `0.181 ≤ 0.785`; `0.0324 ≤ 0.33984`; `0.0756 ≤ 0.3684` | true |
| `dedekindZeta_residue_gt_stark` | cubic `−23` (`α = 24`); `ℚ(ζ₇)⁺` (`α = 4`) | `c₄ = 43.162115`; `0.000308 < 0.3684`; `0.001488 < 0.30026`; `1/(16c₄) = 0.00144803` | true |
| `classNumber_le_bordelles` | `ℚ(√−14)`; cubic `−23`; `ℚ` | `4 ≤ 60.25`; `1 ≤ 94.30`; `1 ≤ 1` (with `0⁰ = 1`) | true |
| `relativeClassNumber_le` | `ℚ(i)`; `ℚ(√−3)`; `ℚ(√−5)`; `ℚ(ζ₈)` | `1 ≤ 4.798`; `1 ≤ 4.939`; `2 ≤ 11.59`; `1 ≤ 12.72` | true |
| `leastPrimePrimitiveRoot_le_grh` | `p = 10⁹ + 7` (`p − 1 = 2·500000003`); `p = 1000000021` (`ω = 6`) | `ĝ = 5 ≤ 9894.6`; bound `4.36·10⁶` | true |
| `primeIdeal_mertens_garciaLee` | `ℚ(i), x = 10` | (A) `|1.2345 − 2.3026| = 1.068 ≤ Υ`; (C) product `0.2844`, `|0.9162 − 1| = 0.0838`; with `e^{−γ}` the value is `0.2888` | true; normalisation pinned |
| `leastPrimeIdeal_ahnKwon`, `_kadiriNgWong` | `ℚ(i)/ℚ` | `C` = conjugation: least `3`; identity: `5`; both `≤ 4^{16}` | true |
| `frobeniusPrimeCount_le_debaene` | `L = K = ℚ`, `x = 3`, `10⁶`; `x = 2` | `2 ≤ 15.05`; `78498 ≤ 7.09·10⁵`; at `x = 2` the printed range admits a right side of `−56.8` | `x > e` needed |
| 0.1 `μ_K` | `ℚ(i)`, `ℚ`; `minkowskiBound` | `2/π`, `b = 4/π`; `μ_ℚ = 1`; `2^{r₁+r₂}√d = 4 ≠ 4/π` | as stated |
| 0.4 relative formula | `ℚ(i)`, `ℚ(√−5)`, `ℚ(ζ₈)` | `1`; `2`; `1.000`, and `1/2` with the wrong power | as stated |
| 2.3 `A_L` | `n = 2, 3` | `λ(2) = 1.4732·10⁹`, `A_L(2) = 2.4913·10¹⁰`, `A_L(3) = 8.4509·10¹¹` (`lee2023ideals` Table 1) | matches |
| 2.6 constants | `E₂(2, 3, 5, 10)`, `E₁(2)` | `1.73·10⁸`, `5.16·10¹⁰`, `1.75·10¹⁵`, `1.02·10²⁶`, `1.11·10⁶`; (B2) at `ℚ(i)`: `8.77·10⁷` | matches |
| 3.1 | `ℚ(√5)` | `(e log 5/4)² = 1.19624`, so `1 − β ≥ 0.35980` | matches |
| 3.2 | cubic `−23`, `2` inert | bound `9.206 ≥ 0.3684` | true |
| 3.4 thresholds | `max(ϱ, ϱ_∅)` by `m` | `2600, 50, 26, 22, 21, 2π²`; `2π²Λ = 167.638`; `32π²Λ = 2682.21` | matches Table 1 |
| 3.5 Mertens lemma | `x = 1.048, 2, 7, 13.5` | `2.7986 < 4.7134`; `0.6050 < 1.4210`; `0.248963 < 0.249988` (`4.95` gives `0.248967`); `0.12598 < 0.12787` | true; the constant `5` is tight |
| 3.6 GGLM | `d = 20, 56` (`n = 2`); `d = 23` (`n = 3`); Palojärvi–Simonič at `5.4·10⁶` | `[0.0845, 19.48]`; `[0.00362, 454.9]`; `[0.00349, 1402]`; `24.09` vs `10595` | matches |
| 4.1 | `ℚ`, `T = 15`; Table 1 | `|2 + 0.620| ≤ 10.67`; difference `0.021(·) + 2.362n − 0.487 > 0` | true |
| 4.2 corollary | coefficient of `n` | `23.02528 + 0.25 + 0.22737(log 3 − log 2π) = 23.1073 ≤ 23.108` | sound |
| 4.3 | `c₁`, `c'₁`; `ℚ(√5)` | `0.3431`, `0.6208` from `d > 3.46`; `1.0718/1.609 = 0.666` | matches |
| 4.4 `P(S)` | roots | `P(0) = 2`, `P(1) = −1`, `P(√2) = 2`; second root `1.221332` | uniqueness only on `[0, 1]` |
| 4.8 | `n = 3`, `d = 23`, `|t| = 1` and `10⁶` | denominators `8.08` vs `40.80`; `403.6` vs `436.0` | matches |
| 5.1 / 5.2 / 5.5 | `ℚ(√5)`; `ℚ(ζ₅)`; `d = 163` | `2.446`; `9.808`; `13.23` and `56.27` | matches |
| 5.4 | `Σ τ₄` to `193`; `Σ τ₃` to `1000`, `100`, `10` | `9333 ≤ 9376.9`; `29425 ≤ 29964.2`, `1471 ≤ 1552.3`, `53 ≤ 66.4`; `P₃(0) = 0.4863` vs wrong sign `0.0494` | matches |
| 5.6 | `ℚ(√−3)` in Theorem 11; `n = 3`, `ρ = 2800` in Theorem 13 | `1.1077 > 1 = h` (threshold needed); `0.0823·52.9/4594 = 9.5·10⁻⁴` | threshold justified |
| 6.2 / 6.3 | `p = 101, H = 4, h = 2`; first ten primes | `8` points, `4 ≤ 8 ≤ 8 ≤ 15.40`; `Σ_{3..29} 1/p = 1.033437`, `Σ_{3..23} = 0.998954` | matches |
| 6.4 window | `ω = 14`, `δ = 0.392963` | `1 − Σ_{q₄..q₁₄} = 0.3929634`; at `1.71·10¹⁶`: `1.30740·10⁸ < 1.30767·10⁸`; at `1.709·10¹⁶`: `1.30734·10⁸ > 1.30729·10⁸` | matches |
| 6.5 | `A(10¹²)`, `A(10²³³)`; `h(3), h(5), h(7), h(40487)`; KMT condition (3) at `ω = 9`, `p = 10¹²` | `0.188846` (`= 5.21801·10⁶` at `q = 10¹²`), `0.160684`; `2, 2, 3, 10`; margin `≈ 8.2` with Rosser–Schoenfeld for `e < 26895` | matches |
| 7.2 | `ψ_{ℚ(i)}(100)`; `L = ℚ` on `(59, 73.2]` | `93.933`, error `6.07 ≤ 94.76`; ratio to Schoenfeld at most `0.808` | true; route gap (R02) |
| 7.3 | `ℚ(i)/ℚ` | range `log x ≥ 2801`, `λ_L = 1.9605`, last term `9.3·10⁻⁴` | matches |
| R04 | cubic `−23` | `b_K = 1.357`; source at `b = 13`: `82.6` | narrowed |

## Not verifiable

- `louboutin2005` Theorem 10 (13) and the abelian bound of lines 42–43: the cached extraction drops the displayed formulas. I checked both by derivation (table above), not against the printed display.
- The following texts are recorded as uncertified and are not in the cache. I did not read them, and no locator into them was checked:
  - `ramare2025`, `guo2026`, `banks2026siegel`, `banks2026brauersiegel`;
  - `louboutin2000`, `louboutin2001`, `friedman1989`, `gglm2026`, `palojarvisimonic2026`;
  - `chen2022`, `washington1997`, `rademacher1959`, Stark 1974;
  - `thornerzaman2017`, `bachsorenson1996`, `ahnkwon2019`, `kadiringwong2019`, `kadiring2012`, `daskadiring2025`;
  - `mcgownsorenson2024`, `cullyhugilltrudgian2021`, `tudzi2026`, `leenosal2026`, `lamzourilisoundararajan2015`, `kadiriwong2022`, `odlyzko1976`, `luzamanzhao2026`.

  The r6 review read `banks2026brauersiegel` v2 and `kadiringwong2019` v1 on arXiv; R01 relies on its record of Lemma 3.3.
- `dglsw2025` (v1), `fehnker2026` (v1) and `greniemolteni2019` (v3) are uncertified. I read their arXiv texts directly this round; nothing was fetched into the cache or recorded in a manifest.
- Ownership against open pull requests was checked by object for the objects named under "Ownership by object", not for every object of the roadmap.

## Source issues

- **Error** in louboutin2003 at Theorem 11, p. 3088: the source states (12) with `c = 2` for every CM field with `ζ_K/ζ_k ≥ 0` on `(0, 1)`, without a root-discriminant threshold; `ℚ(√−3)` qualifies and gets `h⁻ ≥ 1.108`; it should require the thresholds of Theorem 1 that its proof uses; affects a stated result.
- **Misprint** in louboutin2003 at Theorem 13, p. 3088: the source says "root number" and `β ∈ [−2/log d_K, 1)`; it should be root discriminant, and `[1 − 2/log d_K, 1)`; affects nothing.
- **Misprint** in louboutin2017 at Theorem 2, p. 109: the source calls `S₀` the only root of `S⁴ + 2S³ − 2S² − 4S + 2` in `[0, √2]`; that interval also contains `1.2213`, so it should be `[0, 1]`; affects nothing.
- **Gap** in louboutin2015ijnt at Corollary 4, p. 2: the source asserts no real zero in `σ ≥ 1 − c₂/log d_K`, but its proof excludes only zeros of odd multiplicity; it should claim only that, with `ζ_K ≤ 0` there; affects a stated result.
- **Misprint** in louboutin2015ijnt at the proof of Corollary 4, p. 2: the source tests the sign of `ζ_K` at `1 − 2/log d_K`; it should be `1 − c₂/log d_K`; affects nothing.
- **Error** in kerrmcgowntrudgian2020 at Theorem 2, p. 2: the source bounds the `p`-th powers modulo `p²` up to `X` by `√p X^ε` for every `X`; at `p = 3`, `ε = 1/2`, `X = 1000` the count is `111 > 54.8`; it should assume `X < p`, as Lemma 6 needs; affects a stated result.
- **Error** in kerrmcgowntrudgian2020 at Lemma 3, p. 3: the source prints the middle term of `A(q₀)` as `0.8204/√q₀`; Lapkova's odd bound divided by `√q log q` gives `0.8204/log q₀`, so `A(10¹²) = 0.1889`, not `0.16`; affects the proof.
- **Gap** in kerrmcgowntrudgian2020 at the proof of Theorem 1, p. 7: the source bounds `φ(e)/e` with Lemma 4's simplification, valid only for `e ≥ 10¹²`, while `e` can be small there (`e = 6` gives `3 > 1.87`); it should use Lemma 4's general form; affects the proof.
- **Misprint** in bordelles2006 at §1, p. 2 (line 67): the source defines `τ₁(m) = m`; it should be `τ₁(m) = 1`; affects nothing.
- **Misprint** in greniemolteni2019 at §1, p. 2: the source defines `π(C; x)` with the weight `log N𝔭`, yet Corollary 1.2 compares it with `∫₂^x du/log u`; it should be the unweighted sum of `θ(C; 𝔭)`, the weighted one being §6's `ϑ(C; x)`; affects nothing.
- **Gap** in dglsw2025 at (4.18), §4.2, p. 13: the source credits the bound `d_L ≥ 400 001` for `n_L = 2` to Tollis' verification, which covers only degrees `3` and `4`; the quadratic case needs a GRH verification for conductors up to `400 000`; affects the proof.
- **Error** in debaene2019 at Theorem 1, p. 2: the source asserts the bound for every `x` with `x(log x)^{−5n²} ≥ c_K`, including `x` near `1`, where `log log x < 0`; at `L = ℚ`, `x = 2` the right side is `−56.8`; it should assume `x > e`; affects a stated result.
- **Error** in debaene2019 at Corollary 2, p. 3: the source uses the factor `(1 + log Reg_K h_K)`, which is negative for the cubic field of discriminant `−23` (`R h = 0.2812`); it should be `1 + log⁺`, as its proof gives; affects a stated result.
