# Review of AnalyticNumberTheoryPartII (pull request #1167 at c0e5090)

**Verdict:** needs changes

This is a full review of c0e5090, the same head the previous review read. The only previous finding, R01, is now repaired in the other pull request. The two findings below are new. Both are P3: one is supplier drift in the moment comparison of §4.14, the other two inaccurate locators. Nothing blocking was found.

## R01 (P3) — §4.14's `k=1` comparison carries `BBRFiniteInput`, which its supplier does not need

**Location.** The same claim appears in three places:
- `TauCetiRoadmap/AnalyticNumberTheoryPartII/README.md:43` has "§3.23 the second moment under its `BBRFiniteInput` hypothesis".
- `:117` has "the second-moment comparison uses AnalyticNumberTheoryPartI §3.23 under `BBRFiniteInput`".
- `:510` has "The quantitative `k=1` comparison consumes AnalyticNumberTheoryPartI §3.23 under its `BBRFiniteInput` hypothesis and carries that hypothesis explicitly".
- `:512` repeats it ("Compare `k=1` under `BBRFiniteInput`"), and the Check at `:514` repeats it again ("under that input the second moment has leading term `T log T`").

**Claim.** This misdescribes the supplier, and it states the `k=1` case of the moment model below what is available.
- The comparison §4.14 makes is the leading constant `a(1)g(1)=1` against `∫_0^T|ζ(1/2+it)|²dt∼T log T`.
- AnalyticNumberTheoryPartI states that asymptotic unconditionally.
- `BBRFiniteInput` enters only its explicit endpoint `|E(T)|≤110√T log T` for `T≥10^30`, which §4.14 does not use.

**Witness.** In AnalyticNumberTheoryPartI (#1126 at 6d2ce47), §3.23 (`README.md:2628`) reads: "This is Ingham's unconditional theorem; only the explicit endpoint below assumes `BBRFiniteInput`". At `:2635` it adds: "`zetaSecondMoment.mean_square`: the displayed asymptotic is unconditional … No BBR inequality enters."

**Repair.** Make three edits:
1. At `:43`, write "§3.23 the unconditional second moment `zetaSecondMoment.mean_square`".
2. At `:117` and `:510–512`, say that the `k=1` comparison uses `zetaSecondMoment.mean_square` and is unconditional, like `k=2` with §3.24.
3. Change the Check at `:514` to "unconditionally the second moment has leading term `T log T`, matching `a(1)g(1)=1`".

Drop `BBRFiniteInput` from §4.14 altogether. Keep it only if §4.14 also states the explicit Atkinson remainder (`zetaSecondMoment.atkinson_bound`), and then attach it to that clause alone.

**Tested on the instance.** At `k=1`, `a(1)=1` (every local factor is 1) and `g(1)=G(2)²/G(3)=1`. PartI's unconditional main term `T log(T/2π)+(2γ−1)T` is `∼T log T`. So the comparison holds with no hypothesis.

## R02 (P3) — two locators that do not match their sources

**Location.**
- `README.md:1543` (§5.29) cites "proof of Theorem 1 §§2–9 pp.239–267".
- `README.md:3139` (§6.50) reads "See [112][R112], Ch. 3, §4.6, Theorem 3.32, pp. 474–475; [112][R112], Ch. 3, §4.6, Theorem 3.32, p. 475."

**Claim.**
- In Heath-Brown [109], Theorem 1 is proved in §§2–8, pp.240–265; §9, pp.265–267, proves the corollaries.
- §6.50 cites one theorem twice, and the second citation adds nothing.

**Witness.** [109] (Acta Arith. 72) has "2. Proof of Theorem 1; the plan of attack" on p.240 and "9. Proof of the corollaries" on p.265. Page 239 is still the introduction, where Theorem 3 is stated.

**Repair.**
- At `:1543`, write "proof of Theorem 1 §§2–8 pp.240–265, proof of Corollaries 1–2 §9 pp.265–267".
- At `:3139`, delete the second citation. If a source is wanted for the `0<β≤1` regime, cite Neshveyev [114], Corollary, p.3, which is §6.40's source.

## Previous findings

- **R01 (previous review) — repaired, by the other pull request.** ArithmeticGaloisRepresentations (#856) has moved from cf6ae2f to c0cf462, and now takes these objects from this roadmap.
  - `README.md:495` there is "### From `TauCetiRoadmap.AnalyticNumberTheoryPartII`". It names §5.3g, §5.3h with `adeleRing_selfDual`, and §5.3j.
  - `:2311` there says the trace character, self-duality, Schwartz–Bruhat space, Poisson summation and multiplicative measures "are AnalyticNumberTheoryPartII §§5.3g, 5.3h and 5.3j".
  - The three constructions the previous review quoted ("Define the standard trace character", "Prove the diagonal self-annihilator formula", "Construct the Schwartz–Bruhat space") return no match. Neither does the AutomorphicFormsOnReductiveGroups §4.3 sentence.
  - This README's consumer bullet at `:3166` is therefore now accurate.

## Verified sound

### Gate, dependencies and build

- **Gate rerun at c0e5090** prints `gate AnalyticNumberTheoryPartII: set_option=0 … source-material=0 build=0 OK`, with exit 0.
- **`gate --depcheck … --movable`** prints `depcheck: 239 roadmaps, 2358 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Elaboration.** I appended `#check @name` for all 31 declarations to a scratch copy and ran `lake env lean`. It exits 0 with 14 `declaration uses 'sorry'` warnings and nothing else.
  - The 31 elaborated types match `signatures.md` and the README statements.
  - I checked the section-variable declarations (`exists_unique_restrictedAddHaar`, `exists_unique_quotientMeasure`, `gl2Rational`, `gl2Integral`) by hand. They keep every binder they need.
  - Nothing changed.
- **One-tactic probe.** I ran `simp`, `rfl`, `infer_instance`, `norm_num`, `trivial` and `aesop` on all 14 theorems, 84 attempts in all. Each probe produced exactly one error per theorem, so none closed and there is no padding.

### Library declarations opened at the pins

All Mathlib declarations below are under `.lake/packages/mathlib`.
- **`modularCharacterFun`** (`Mathlib/MeasureTheory/Group/ModularCharacter.lean:45`) is `haarScalarFactor (map (· * g) haar) haar`. This is the convention §5.3l's Check uses (`μ(E·b⁻¹)=Δ(b)μ(E)`, `Δ(diag(2,1))=2`).
- **`DoubleCoset.Quotient`** (`Mathlib/GroupTheory/DoubleCoset.lean:79`) is `H\G/K`, as `gl2_classNumber` needs.
- **The Dedekind residue declarations** are `dedekindZeta_residue`, `_def` and `_pos` (`Mathlib/NumberTheory/NumberField/DedekindZeta.lean:57,61,66`).
- **The discriminant declarations** are:
  - `natAbs_discr_eq_absNorm_differentIdeal_mul_natAbs_discr_pow` and `discr_dvd_discr` (`Discriminant/Different.lean:90,120`);
  - `abs_discr_gt_two` (`Discriminant/Basic.lean:275`).
- **Bernoulli conventions.** `bernoulli_one : bernoulli 1 = -1/2` (`Bernoulli.lean:207`), `Polynomial.bernoulli_one : bernoulli 1 = X - C 2⁻¹` (`BernoulliPolynomials.lean:75`) and `bernoulli_eval_zero` (`:79`). These fix the signs in `complexHurwitzContinuation_exists` and `barnesRemainder`.
- **Tau Ceti universal cover.**
  - `TauCeti.UniversalCover` is at `UniversalCover/Basic.lean:70`, and `basepointLift` at `:151`.
  - The `MulAction (FundamentalGroup X x₀)` is at `UniversalCover/Action.lean:79`.
  - The action prepends the inverse loop, as the README says. This does not affect `lerchContinuation_solvable`, because `derivedSeries … 2` is closed under inverses.

### Sources read at their locators

These are the seeded sample, read from the cache and the sources service.
- **§4.10, against Lagarias–Li II [95] (arXiv 1005.4967v2).** Theorem 2.1 with (2.7)–(2.10) is on p.5. §3 begins on p.8, with Lemma 3.1 on pp.8–9 and the proof of Theorem 2.1 on pp.9–10. The odd equation carries `i e^(−2πiac)` and the symmetrization `e^(−2πia)`, as stated. §4.9a's [99] locators check out: Lemma 3.3 with (3.20)–(3.25) is on pp.12–13, Lemma 3.4 with (3.28)–(3.35) on pp.14–15, and (3.36)–(3.37) on p.15.
- **§§5.7, 5.9 and 5.24, against `LOWW`.**
  - Lemma 2.5 is at line 393, p.8, and Remark 2.7 at line 403, p.8.
  - Remark 3.3 is at line 513, p.10. Proposition 3.4 is at line 535, p.11, and Lemma 3.5 at line 539, p.11. Lemma 3.5 counts `K/k` with `Disc(K/k)=n` and `[K:k]≤3` as `O(n^(1/2+ε)h₂(k)Disc(k)^(1/2+ε))`, which is §5.7.
  - `ξ_(k,α)` is at line 588, p.12, and the dual series of Proposition 3.7(3) at lines 622–631, p.12. Together they are §5.9.
  - Proposition 3.7(3), at lines 614–621, gives `(3^(6s−2)π^(−4s)Γ(s)²Γ(s−1/6)Γ(s+1/6))^[k:ℚ]Disc(k)^(4s−2)`, which is §5.24. The factor 3 of (3.1) sits on `α=ℝ³`, `β=ℝ×ℂ`, the split-to-nonsplit entry of §5.24a.
- **§§5.3 and 5.26, against Blomer [102], read as arXiv 0907.4867v1.**
  - The equation numbers match the README.
  - Lemma 2 gives `(s−1)(w−1)(s+w−3/2)Z` entire with (27)–(28).
  - `β(s,w)=(1−s,s+w−1/2)` is defined after (35).
  - `B₃=(π/8)^(s−1/2)Γ((1−s)/2)/Γ(s/2)I₄`, and (35) gives `B₁(0)=0`.
- **§5.29, against Heath-Brown [109].** Theorem 1 and Corollary 1 are on p.237, and Corollary 2 and Theorem 2 on p.238. Theorem 2's bound is proved by p.269. The proof-of-Theorem-1 range is R02.
- **§6.11, against Zagier [118].** (1) is on p.1, and (2), `∏_γ∏_(m≥0)(1−N(γ)^(−s−m))`, on p.2.
- **§6.6, against `JorgensonSmajlovicSpilioti25`.** (4.2) is at line 653, p.13, and (4.4)–(4.6) at lines 693–720, pp.14–15.
- **§6.40, against Neshveyev [114].**
  - The Corollary is at line 117, p.3.
  - The Proposition and projection formula (2) are at lines 55–79, p.2.
  - (1β) is at line 36, p.1, and the product density at lines 47–52, p.2.
  - The KMS–measure correspondence of [L1] (line 34) is quoted without a unit-invariance hypothesis, so `critical_scaling_measure_unique` follows without one.
- **§§6.28, 6.31 and 6.50, against Connes–Marcolli [112]** (printed page = PDF page − 22).
  - Lemma 3.27 with (3.91)–(3.98) is on p.464, and Lemma 3.28 with (3.100)–(3.101) on p.465.
  - Theorem 3.30(1), the generation of `ℚ[ℚ/ℤ]` by the `e_(1,a)`, is on p.467. That is `firstEisenstein_generate`.
  - Theorem 3.32 is on pp.474–475, and (3.140)–(3.141) on p.475.

### Cross-roadmap citations resolved

- **Supplier ids in AnalyticNumberTheoryPartI (#1126 at 6d2ce47).** These all exist: §§0.9, 0.23a, 0.31b, 0.34, 2.1a, 2.3a, 2.5, 2.7, 2.15, 2.21, 2.31e, 3.1, 3.23, 3.24, `dedekindZeta_residue_le`, `quadratic_LFunction_one_lower_bound`, `besselK` and `heckeContinuation`.
- **Supplier sections on main.**
  - VonNeumannAlgebras has V10.Hecke (`:2494`), V10.AffineHecke (`:2577`), V10.AffineAP (`:2652`) and V10.AffineType (`:2698`).
  - OperatorAlgebraDynamics has D1 (`:148`), D2 (`:221`) and D7 (`:603`).
  - ComplexKahlerGeometry has K5a (`:570`), DifferentialGeometry has Layer 12 with `laplaceBeltrami` (`:910`), and AmenableGroups has Layer 6 (`:391`).
  - UniversalCovers, ProfiniteArithmetic, RestrictedProducts and GlobalNumberFields are under `Completed/`.
- **Merge order.** PolylogarithmFunctions (line 38) and AnalyticNumberTheoryPartI (line 49) precede this roadmap (line 50).
- **Consumers.** Every consumer named in Downstream consumers cites this roadmap at its head:
  - AdelicAlgebraicGroups, 62 lines;
  - AutomorphicLFunctionsAndLocalFactors, 41;
  - ArithmeticGaloisRepresentations, 20;
  - ClassicalArithmeticCompletion #1409, 11;
  - AutomorphicSpectralTheory, 10;
  - GeometryOfNumbersAndQuadraticArithmetic, 7;
  - AutomorphicFormsOnReductiveGroups, 7;
  - SieveMethodsAndPrimePatterns, 7;
  - ArithmeticDirichletSeriesPartII, 7;
  - ProbabilisticAndMetricNumberTheory, 5.
  
  All of them come after line 50 in ORDER.txt.
- **Ownership against open pull requests.**
  - AnalyticNumberTheoryPartIII (#2008) "plans none of Part II's objects".
  - AdelicAlgebraicGroups takes `exists_unique_restrictedAddHaar` and `exists_unique_quotientMeasure` by name, with "Lean: none here".
  - `overlaps.md` reports no dropped or revision-only ids.

### Adversarial table

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `lerch_completed_functional_equations` (§§4.9–4.10) | `a=c=1/2`; `s=0` | even multiplier `e^(−πi/2)=−i`, odd `i·(−i)=1`; `L₊(s,½,½)=0`; `L₊(0,a,c)=1/(1−z)+1/(z−1)=0`, so `Λ₊` is removable at the `Γ(s/2)` pole | Holds | None |
| `lerch_completed_functional_equations`, domain | `p=(s,a,c)∈D` | `(1−s,1−c,a)` has `Re(1−c),Re a∈(0,1)`; `D` is connected, so `L` is fixed by `Im a>0` | Well posed | None |
| `lerchContinuation_solvable` | `π₁(N#)=F₂×F_∞`; `Y_n`, `Y_m` | c-monodromy is upper triangular with diagonal `(1,λ,λ)`; commutators unipotent, so `F_∞″` acts trivially; basepoint `(½,−1,½)` has `Re s,Re c>0`, `z∉[1,∞)` | Holds | None |
| `complexHurwitzContinuation_exists` | `m=0,1`; `c=1,½,1+i` | `−B₁(1)=−½`; `−B₂(1)/2=−1/12`; `−B₁(½)=0`; `−B₁(1+i)=−½−i` | Holds | None |
| `barnesG` | `z=4,5,0` | `G(4)=1!2!=2`; `G(5)=1·2·6=12`; `w=−1` makes the `k=0` factor `0` | Holds | None |
| `barnesG_asymptotic`, main terms | `z→∞` | `z²/4+z·LΓ−(z²/2+z/2+1/12)log z` gives `(z²/2−1/12)log z−3z²/4+(z/2)log2π`; correction coefficient `B/(4k(k+1))−B/((2k+1)(2k+2))=B/(2k(2k+1)(2k+2))` | Holds | None |
| `barnesG_asymptotic`, remainder bound | `N=1`, real `r`; complex `z` | `R₁(r)=−(1/12)∫{t}²(1−{t})²/(t+r)³`; antisymmetric primitive gives `|R₁(r)|<1/(720r²)`; `|t+z|²−(t+|z|)²cos²(θ/2)=(1−cosθ)(t−|z|)²/2≥0` | Holds | None |
| `quadratic_large_sieve` (§5.29) | `M=1`, `N=3` | `a₁=1,a₃=−1` gives `0`; `a₁=a₃=1` gives `4`; `(3/3)=0` | Holds | None |
| `quadratic_fourth_moment` | `σ=½,1`; `q=1` | size `Q(1+|t|)`; `Q+1`; `chi.2≠1` removes exactly the conductor-1 character (primitive mod `q>1` is nontrivial) | Holds | None |
| `quadraticReciprocity` against Blomer (32) | rows 0, 2, 4 | `(½,½,½,−½)` at cols 0,1,4,5; `(½,½,½,−½)` at 8,9,12,13; `(½,½,−½,½)` at 0,1,4,5: equal to `A` | Holds | None |
| `quadraticReflection` against Blomer `B(s)` | `ψ1` entry `[0,0]`; `B(0)[(1,0),(1,0)]` | `¼Σ_η r=1/(4−4^s)+4^(−s)=4^(1−s)/(4−4^s)`, which is `B₁`; `¼(2/π+2/π+4/(3π)+0)=4/(3π)`, which is `B₂(0)` | Holds | None |
| `quadraticReflectionFactors` table | `ψ1`, `ψ−1`; `η=0..3` | `q=1` exactly for residues `≡1` resp. `≡3 mod 4`; `e=+1` at 1,7 and `−1` at 3,5, as at `:994` | Holds | None |
| `exists_unique_restrictedAddHaar` (§5.3f) | `Ẑ`; `p^(−1)ℤ_p` box; `ι=∅` | `1`; `p`; point mass `1=∏ᶠ∅` | Holds | None |
| `adeleRing_selfDual` (§5.3h) | `ψ(1/6)`; sign reversed; `exp(2πix_∞)` | `exp(2πi(1/6−1/2−2/3))=1`; `exp(2πi/3)`; `1/2↦−1`, so it is excluded by triviality on `K` | Holds | None |
| `exists_unique_quotientMeasure` (§5.3k) | `ℤ≤ℝ`; `S₃`; `ax+b` | mass `1`; `6=3·2·1`; `Δ_G(2,0)=2≠1=Δ_H`, so the hypothesis fails as required | Holds | None |
| `gl2_classNumber` (§5.3m) | `ℚ`; `ℚ(√−5)`; `diag(p,1)` | `1=h`; `2=h`; inverse entry `1/p∉ℤ_p`, so not in `gl2Integral` | Holds | None |
| `firstEisenstein_generate` (§§6.26, 6.37) | `e(1/2)`; `e(1/4)²`; character value | `0`; `(2[1/2]−2[0])/16`, so `[1/2]` lies in the algebra; `(ζ+1)/(2(ζ−1))=cot(πt)/(2i)` | Holds | None |
| `IsScalingMeasure` (§6.10) | `δ₀`, `β=1`; Haar | `2_*δ₀=δ₀≠2δ₀`; `μ(2Ẑ)=1/2`, pushforward density `2` | Discriminates | None |
| `critical_scaling_measure_unique` (§6.40) | `e(1/2)`, `e(a/p^k)` | shells give `p^(−kβ)−(1−p^(−β))p^(−(k−1)β)/(p−1)=p^(−kβ)(1−p^(β−1))/(1−p^(−1))`; `b=2`: `2^(1−β)−1` | Matches (3.138) | None |
| `supercritical_scaling_measures` (§6.48b) | `ν=δ₁`; `β=2` | mass `n^(−β)/ζ(β)` at `n`; `Ẑ` mass `1`; `W` mass `6/π²=0.60793` | Holds | None |
| §4.13 constants | `k=1,2,3`; `p=2`, `k=2` | `g(1)=1`; `g(2)=1/12`; `g(3)=4/34560=42/9!=1/8640`; `(1/16)(3/2)(8)=3/4=1−2^(−2)`; `a(2)g(2)=1/(2π²)=0.050661` | Holds | None |
| §4.14 `k=1` comparison | `a(1)g(1)` | `1·1=1` against PartI's unconditional `T log(T/2π)+(2γ−1)T` | Extra hypothesis | R01 |
| §5.3 | `(0,0)`, `(2,3)`, `(½,w)` | `(1,−½)`; `(−1,9/2)`; fixed; `β∘β=(s,w)` | Holds | None |
| §5.7 | `E=F`; `F=ℚ` | `|ker Nm|=1`, `R_E/R_F=1`; `h_E≤C_m D_E^(1/2)(1+log D_E)^(m−1)` | Holds | None |
| §5.9 | `O_F³`; `F[ε]/ε³` | weight `1/|S₃|=1/6`; discriminant `0` | Holds | None |
| §5.24 | `LOWW` (3.1) at `s=1` | real factors `sin(2π)=0`; complex `sin²(π)=0` | Matches | None |
| §5.29 locator | Heath-Brown pages | §2 starts p.240, §9 p.265 | Mislabelled | R02 |
| §6.6 | `λ=1/4`, `u=s(s−1)`; empty spectrum | `(s−½)²`; `1` | Holds | None |
| §6.11 | one class, length `ℓ` | `Z′/Z=Σ_k ℓe^(−(s+k)ℓ)/(1−e^(−(s+k)ℓ))=Σ_m ℓe^(−msℓ)/(1−e^(−mℓ))` | Holds | None |
| §6.28 | `x₂x′₂ε_k`; `σ_t` | `2ε_k` (even `k`), `0` (odd) `=1+(−1)^k=π(1+e(½))`; `(nk/k)^(it)=n^(it)` | Holds | None |
| §6.31 | `P₂,P₃,P₄`; `e_(2,1/3)` | `X²−¼`; `X³−X/4`; `(X²−¼)(3X²−¼)/3=X⁴−X²/3+1/48`; `(e(⅓)+e(⅔)−2)/36−9/36` | Holds | None |
| §6.50 | `e(1/2)` both regimes; locator | `2^(1−β)−1` and Gibbs `−(1−2^(1−β))`, both `0` at `β=1`; citation repeated | Value holds; locator duplicated | R02 |
| Conventions: Sarnak constant (`:25`) | large-`s` expansion, `C_ρ=g−1` | `log det(Δ+s(s−1))` constant `−(g−1)/2`; `Z_I` constant `(g−1)(log2π−4ζ′(−1))`; so `C̃=2(g−1)(2ζ′(−1)−log√2π−¼)`, which gives Sarnak's | README right, JSS (8.8) wrong | None |
| §5.3h Jacobi check | `t=2` | `1+2e^(−4π)=1.0000070`; `½(1+2e^(−π/4)+2e^(−π)+2e^(−9π/4)+…)=1.0000068` | Holds | None |
| §5.3n checks | `q_v=2`, `z=3`; `ℝ`; `ℂ` | `1+½Σ4^(−k)=7/6=(7/8)/(3/4)`; `2=Γ_ℝ(2)/Γ_ℝ(3)`; `π=Γ_ℂ(2)/Γ_ℂ(3)` | Holds | None |

## Not verifiable

- **Keating–Snaith [100] (§§4.13–4.14).** The DOI resolves only to a paywalled page, and the README's link is a copy on a third-party course page, which I did not use. The constants were checked by computation instead (table).
- **Wright [103] and Datskovsky–Wright [105]** are image-only scans, and this worker has no OCR. This covers DW Theorem 3.2, p.47, and Theorems 4.1–4.2 in §5.24a, and Igusa 1984, which I did not read.
- **Blomer [102].** Only arXiv v1 was read. Its equation numbers match the README, but the published page numbers (pp.358–363) were not checked.
- **§5.7a's effective constant** comes from AnalyticNumberTheoryPartI §0.34 (`landau_siegel_exclusion`). PartI cites a 1 October 2026 OpenAI release and Green, "On Landau–Siegel zeros" (2026), for it, and I did not read either. §5.7 does not depend on §0.34, through `LOWW` Remark 2.7.
- **Not fetched:** Bost–Connes [113], Sarnak [115] and Neshveyev [117]. Sarnak's constant was checked by the expansion above.

## Source issues

- **Misprint** in Lagarias–Li, The Lerch zeta function II [95] (arXiv 1005.4967v2), at (2.6), p.5: the source says the symmetrized functions use the factor `e^(2πia)`; it should be `e^(−2πia)`, as in (2.7), (2.9) and (3.1)–(3.2); affects nothing.
- **Misprint** in Lagarias–Li, The Lerch zeta function II [95], at Theorem 2.1(2), p.5: the source says the functional equations (2.9) and (2.10) hold on the extended polycylinder; it should say (2.8) and (2.10), since (2.9) is a definition; affects nothing.
- **Error** in JorgensonSmajlovicSpilioti25 at (1.3), p.3, and (8.8), p.28: the source says the torsion constant is `2C_ρ(X)(2ζ′(−1)−log√2π)`; it should be `2C_ρ(X)(2ζ′(−1)−log√2π−1/4)`, which the vanishing constant term of the large-`s` determinant expansion forces; affects a stated result.
