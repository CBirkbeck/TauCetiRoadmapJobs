# Review of ExplicitNumberFields (pull request #1944 at 4620ad9)

**Verdict:** needs changes

This is a full re-review. The folder changed by 561 lines since `e163ff8` (402 insertions, 159 deletions). No repair report exists for the r7 review, so none of its findings is settled. Nothing outside the folder changed.

The gate fails at this head with `statement-hygiene=4`, which is R02.

## Previous findings (r7, at `e163ff8`)

| r7 | Passage at this head | Status |
|---|---|---|
| R01 (P2): 5.7 needs a degree-uniform Stark constant that §2.31e does not state | 4.7 now has the target "there is an effective constant `c > 0`, the same for every number field" (README.md:2332–2341). 5.7's route and *Needs:* cite "4.7 (the degree-uniform Stark bound)" (README.md:2923–2926, 2947). The §2.31e contract clause is replaced by "are not used here: 4.7 states the degree-uniform form" (README.md:596–599). §2.31e at the AnalyticNumberTheoryPartI head is unchanged and still fixed-degree. | repaired |
| R02 (P3): 7.2 has no input for `L = ℚ`, `59 < x ≤ 73.2` | 7.2 now carries "`Buthe2016Range` (for `L = ℚ` on `59 < x ≤ 73.2`)" (README.md:3347–3348). The route covers the three ranges (README.md:3361–3368). The predicate exists at ExplicitPrimeCounting README.md:1054 at its head. | repaired |
| R03 (P3): §0.5 contract omits `a_k = 0` for `k > n` | The contract now reads "`a_k = 0` for `k > n`" (README.md:653). This matches ExplicitZetaBounds README.md:636 at its head. | repaired |
| R04 (P3): class-number lemma and Bordellès' fifth form narrower than `bordelles2006` | 0.3 now reads "for every real `b` such that every ideal class of `K` contains a nonzero integral ideal of norm at most `b`" (README.md:911–913). 5.3's fifth form reads "every admissible `b ≥ 13`" (README.md:2673). Both agree with `bordelles2006` lines 61–62 and 158–161. | repaired |

Two findings that the r6 review raised and r7 confirmed repaired have come back:
- r6 R02, re-planning CyclotomicClassGroupsAndStickelberger §3.4, is now R01;
- r6 R05, `letI` in four signatures, is now R02.

## R01 (P2) — 0.4a re-plans CyclotomicClassGroupsAndStickelberger §3.4, so the same four theorems have two owners

**Location.**
- README.md:1059–1131, 0.4a: "Prove `dedekindZeta_eq_prod_LFunction` … Prove `dedekindZeta_residue_eq_prod_LFunction_one` … Prove `abelianCharacter_gauss_product` … Prove `relativeClassNumber_character_product`".
- Suggested.lean:102–160, where the four theorems are declared.
- README.md:36–41, Scope: "the roadmaps on cyclotomic class groups, on effective class numbers and on computational number theory that share material with it import that material from here rather than supply it".
- The §3.4 contract and its Scope deferral are deleted, and *Needs:* lines that cited §3.4 now cite 0.4a instead (README.md:1150, 2655, 2907).

**Claim.** CyclotomicClassGroupsAndStickelberger comes much earlier in the merge order (33 against 272) and was this roadmap's supplier for these results at `e163ff8`. Its §3.4 already plans exactly these four results:
- the Euler product on `Re s > 1`;
- the residue comparison at `1`;
- the signed Gauss-sum product;
- the odd-character Bernoulli product.

Restating them here re-plans an existing roadmap and makes two owners for one object. Two of the Lean statements match that roadmap's statements. The Scope sentence is false at the supplier's head:
- CyclotomicClassGroupsAndStickelberger cites nothing from this roadmap;
- EulerSystemsCyclotomicMainConjecture consumes these results from §3.4;
- EffectiveClassNumbers shares none of this material.

**Witness.** At the CyclotomicClassGroupsAndStickelberger head (pull request #1260):
- Suggested.lean:166–175 is `abelianCharacter_gauss_product`, identical to Suggested.lean:135–143 here;
- Suggested.lean:179–188 is `relativeClassNumber_character_product`;
- README.md:671 proves the Euler product and residue comparison.

**Repair.** Restore the ownership of `e163ff8`:
1. Delete the four theorems from Suggested.lean, and their entries from the module docstring.
2. In 0.4a, delete the "Prove" paragraphs for:
   - the Euler product on `Re s > 1`;
   - the residue product;
   - the Gauss-sum product;
   - the odd-character value at `1`;
   - the Bernoulli product.

   Keep only the continued-function identity, the additivity of zero orders and the parity remark, citing §3.4 for the identity on `Re s > 1` and for `X(F)`.
3. Restore the `### From TauCetiRoadmap.CyclotomicClassGroupsAndStickelberger` contract and the Scope deferral.
4. Cite §3.4 in the *Needs:* lines of 0.4a, 5.2 and 5.6 and in the Dependencies of Layers 0 and 5.
5. Delete the Scope sentence quoted above.

**Tested.**
- At `e163ff8`, which had exactly this shape, the r7 run of the gate passed and the dependency check reported 0 problems, since CyclotomicClassGroupsAndStickelberger precedes this roadmap.
- After the deletion, `roadmaps grep abelianCharacter_gauss_product` returns a single owner, CyclotomicClassGroupsAndStickelberger.

The alternative, moving §3.4 here, would need CyclotomicClassGroupsAndStickelberger, which is 33rd in the merge order, to cite a roadmap that is 272nd. That is an upward supply.

## R02 (P3) — Gate failure: `letI` in four theorem signatures

**Location.** Suggested.lean:113, 127, 140, 158, which is `letI : NeZero χ.conductor := ⟨χ.conductor_ne_zero⟩` inside the statements of:
- `dedekindZeta_eq_prod_LFunction`;
- `dedekindZeta_residue_eq_prod_LFunction_one`;
- `abelianCharacter_gauss_product`;
- `relativeClassNumber_character_product`.

**Claim.** These are four `statement-hygiene` hits of the push gate, each P3. While the gate fails, the folder cannot be accepted.

**Witness.** The gate rerun at this head gives `statement-hygiene=4 … FAIL`, naming lines 113, 127, 140 and 158 with the repair "use an instance binder or a named instance in the signature".

**Repair.** The deletion of R01 removes all four declarations. If any were kept, the gate's repair would apply. Since this is a P3, it is not the reason to keep them.

**Tested.** At `e163ff8`, without these four theorems, the gate reported `statement-hygiene=0`.

## R03 (P3) — Downstream consumers drops ComputationalNumberTheory, which cites 1.1a by fully qualified name

**Location.** README.md:3528–3537. The line "ComputationalNumberTheory §4.18: the digamma and trigamma remainders of 1.1a" of `e163ff8` (its README.md:3351) is gone. The same consumer note was also removed from the module docstring (Suggested.lean:29–30).

**Claim.** The consumer still exists. Without the line, nothing in this folder records that the two Lean names are cited downstream, so they must not change.

**Witness.** At the ComputationalNumberTheory head (pull request #1408):
- README.md:127 and 411 cite "ExplicitNumberFields 1.1a";
- Suggested.lean:490–492 names `TauCetiRoadmap.ExplicitNumberFields.digamma_series_remainder` and `TauCetiRoadmap.ExplicitNumberFields.trigamma_series_remainder`.

**Repair.** Restore the bullet under `## Downstream consumers`: "ComputationalNumberTheory §4.18: the digamma and trigamma remainders of 1.1a (`digamma_series_remainder`, `trigamma_series_remainder`)".

**Tested.** `roadmaps grep ExplicitNumberFields` lists ComputationalNumberTheory as the only roadmap citing a Lean name of this one.

## R04 (P3) — 4.9 states Guo's gap without a locator

**Location.** README.md:2488: "Prove Guo's gap, *UniformQuadraticZeroGap* `(1/100)` (`guo2026`, preprint)".

**Claim.** Every target needs a locator. Banks's gap in the same sentence has one ("`banks2026siegel` Theorem 1.1"). Guo's does not.

**Witness.** `guo2026` arXiv v1, Theorem 1.1, gives `(1 − β) log q > 1/100` for every real zero `β ∈ (0, 1)` of `L(s, χ)`, for every primitive quadratic character `χ` of conductor `q ≥ 3`. ExplicitZetaBounds §7.9 cites it so.

**Repair.** Write "(`guo2026` Theorem 1.1, preprint)".

**Tested.** The cited theorem gives the strict bound for every conductor `q ≥ 3`. By the agreement of 0.5 (`q = d_F`), it implies *UniformQuadraticZeroGap* `(1/100)` exactly as 4.9 states it.

## Verified sound

### Gate, dependency check and build

**Gate.** The rerun (`gate … ExplicitNumberFields --base origin/main`) gives every count `0` except `statement-hygiene=4` (R02). This matches the worker's gate.

**Dependency check.** It reports `depcheck: 237 roadmaps, 2427 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. In the merge order:
- this roadmap is 272nd;
- its suppliers are LFunctions 27, CyclotomicClassGroupsAndStickelberger 33 (after the R01 repair), ZerosOfLFunctions 48, AnalyticNumberTheoryPartI 49, ExplicitZetaBounds 267, ExplicitPrimeCounting 269, ExplicitCharacterSumsAndSieves 270 and ExplicitMultiplicativeFunctions 271;
- ClassFieldTheory, ClassicalArithmeticCompletion, ImaginaryQuadraticClassNumber, LFunctions, SuccessiveMinima and ZerosOfLFunctions are on main.

**Elaboration.** `lake env lean TauCetiRoadmap/ExplicitNumberFields/Suggested.lean` gives 20 warnings, all `declaration uses 'sorry'`, and nothing else.

**`#check @name`.** I ran it for all 25 declarations (20 theorems and 5 definitions) in one scratch file. Each elaborated type matches its README statement and `signatures.md`. The file has no `variable` block, so no binder can be lost. Nothing changed.

**One-tactic probe.** On a scratch copy I tried each of the 20 theorems with `first | (simp; done) | rfl | (norm_num; done) | trivial | decide | infer_instance | (positivity; done) | (nlinarith; done)`. All 20 still use `sorry`, so none is padding by that test. The four 0.4a theorems are deep but not this roadmap's (R01).

**Declared gaps.** All three are still missing at their suppliers:
- `gap:explicit-mertens-second`: ExplicitPrimeCounting §4.7 at its head starts at `x ≥ 24.4`;
- `gap:bach-grh-smoothed-sum`: ExplicitPrimeCounting §6.5 has no smoothed Bach sum with `c(p, x)`;
- `gap:artin-norm-compatibility`: ClassFieldTheory Layer 11 on main has no ideal-level norm functoriality under a change of base field.

The other gaps of the plan are cited as supplied sections, and each section exists, as listed below.

### Library declarations opened at the pins

**Mathlib.**
- `NumberField/ClassNumber.lean:78` `exists_ideal_in_class_of_norm_le`, with the bound `M K`.
- `Discriminant/Basic.lean:210` and `:244`: `abs_discr_ge'` and `abs_discr_ge`.
- `Cyclotomic/Galois.lean`:
  - `:133` `galEquivZMod_stabilizer`;
  - `:188` `intermediateFieldEquivSubgroupChar`, which sends `F` to the characters trivial on `Gal(K/F)` and needs `[IsAbelianGalois ℚ K]`;
  - `:195` `card_intermediateFieldEquivSubgroupChar`.
- `Cyclotomic/Ideal.lean:398` and `:406`: `IsCyclotomicExtension.Rat.inertiaDegIn_eq` and `ramificationIdxIn_eq`.
- `DirichletCharacter/Basic.lean`: `:309` `changeLevel_primitiveCharacter`, `:313` `primitiveCharacter_isPrimitive`, `:537` `Odd`.
- `LSeries/DirichletContinuation.lean`:
  - `:206` `gammaFactor`;
  - `:231` `completedLFunction`;
  - `:279` `rootNumber`, which is `gaussSum χ stdAddChar / I^a / N^{1/2}`;
  - `:291` `IsPrimitive.completedLFunction_one_sub`, with the factor `N^(s − 1/2) · rootNumber χ`.
- `Analysis/Fourier/ZMod.lean:219` `IsPrimitive.fourierTransform_eq_inv_mul_gaussSum`.
- `RiemannZeta.lean:242` `riemannZeta_residue_one`.
- `AbelLimit.lean:162` `tendsto_tsum_powerSeries_nhdsWithin_stolzSet`.
- `Gamma/Deligne.lean:155` `Gammaℝ_mul_Gammaℝ_add_one`.
- `DedekindZeta.lean:78` `tendsto_sub_one_mul_dedekindZeta_nhdsGT`.
- `ZMod/UnitsCyclic.lean:85` and `:206`: `isCyclic_units_prime` and `isCyclic_units_of_prime_pow`.

**Tau Ceti.**
- `DirichletCharacter/GeneralizedBernoulli.lean`: `generalizedBernoulli`, with representatives in `{1, …, N}`.
- `DirichletCharacter/GaussSum.lean:93` `gaussSum_mul_gaussSum_inv_eq_neg_one_mul_card_of_isPrimitive`.
- `DirichletCharacter/LFunction/Bounds.lean:47` `LFunction_eq_mul_integral`.
- `Analysis/Meromorphic/Continuation.lean:40` `eventuallyEq_of_meromorphic_of_eqOn_halfPlane`.
- `DirichletCharacter/Conrey.lean:78` `conreyGenerator`.
- `LFunctions/Mertens.lean:545` `mertensConstant`.
- `RayClass/Count/Basic.lean:100` `rayClassIdealCountingFunction`.
- `AdmissibleModulus/Basic.lean:193` `abelianConductor`.

### Cross-roadmap citations resolved, at main or at the open head

- **ExplicitZetaBounds** (pull request #1954): §§0.4b, 0.5 (README.md:633–641, with the vanishing clause), 2.1, 2.5, 3.2, 5.1, 6.1a, 7.7, 7.9, 9.1.
- **ExplicitPrimeCounting** (pull request #1945):
  - §1.3, including `Buthe2016Range` at README.md:1054 for `59 < x < 5000`;
  - §1.7;
  - §2.2, which is two-sided from `73.2` with the lower side from `59` (README.md:1364);
  - §§4.7 and 6.5.
- **ExplicitMultiplicativeFunctions** (pull request #1946): §§1.2, 2.3, 2.5, 7.1, 7.5, 7.9, 8.1, 9.1, 9.4.
- **ExplicitCharacterSumsAndSieves** (pull request #1948): §§3.5, 4.1, 6.1.
- **AnalyticNumberTheoryPartI** (pull request #1126):
  - §§0.34, 0.34a, 1.6, 2.5, 2.7, 2.15, 2.15a, 2.17a, 2.18, 2.22, 2.31d, 2.39, 2.39b, 2.42, 2.43, 2.49;
  - §2.31d gives `D_L ≤ D_E^m`;
  - §2.31e is still fixed-degree, with `c_(n,a)` and no statement that Stark's `c` is absolute, which is what makes the new 4.7 target a kept variant rather than a duplicate.
- **CyclotomicClassGroupsAndStickelberger** §3.4 (R01).
- ClassFieldTheory Layers 4, 11, 12, 13 and ZerosOfLFunctions, both on main.

### Ownership by object

- I ran `roadmaps grep` for the four 0.4a names over main and every open head. CyclotomicClassGroupsAndStickelberger owns them, and EulerSystemsCyclotomicMainConjecture (README.md:770, 777) consumes them from §3.4 (R01).
- I read the scope of EffectiveClassNumbers: imaginary quadratic lower bounds after Goldfeld–Oesterlé. It owns nothing that this roadmap owns and cites nothing from it.
- ComputationalNumberTheory consumes 1.1a (R03).
- Ownership against the other open pull requests was checked by object only for these objects and for the 4.7 Stark bound.

### Sample read at the locators

| Target | Source and locator | Agreement |
|---|---|---|
| 0.1 | Mathlib `exists_ideal_in_class_of_norm_le`, `abs_discr_ge'` | `M K = (4/π)^{r₂}(n!/nⁿ)√d_K = b_K` |
| 0.2 | `louboutin2005` lines 50–51 | ratio `≤ 1`; `1/(2ⁿ − 1)` when `2` is inert |
| 0.3 | `bordelles2002` lines 72–77, 79, 85–91; `bordelles2006` lines 61–62 | Lenstra's injection; Lemma 1.1 at a general admissible `b` (2006); (1.2) for `n ≥ 1`, `x ≥ 1` |
| 0.6 | `kerrmcgowntrudgian2020` lines 37–39 | exactly one of `j + kp` fails modulo `p²`, so `h(p) ≤ g(p) + p` |
| 2.2 | `sunley1973` lines 110–112; `lee2023ideals` lines 39–41 | Theorem 1.1(1), `n ≥ 2`, `e^{28.2n+5}(n+1)^{5(n+1)/2}`, strict count `N𝔞 < x` |
| 2.3 | `lee2023ideals` lines 46–47, 57–70 | Table 1: `A(2) = 2.49133·10¹⁰`, `A(3) = 8.45088·10¹¹` |
| 2.4 | `debaene2019` lines 107–124 | Corollary 2 with `1 + log` (repaired to `log⁺`), `x ≥ 1` |
| 2.6 | `fehnker2026` arXiv v1, Theorem 1.1, p. 2 | (A1), (A2), (B2); `t ≥ (10n²√Δ)ⁿ`; `log⁺ = max(1, log)`; `E₁`, `E₂` |
| 3.6 | `gglm2026` arXiv v5: Theorem 1.1 p. 2, Remark 1.2, Theorem 2.1, Lemmas 2.2–2.3, Theorem 3.1, §4.1, Remark 4.2 | `d_K ≥ 14`; GRH with `t ≠ 0`; Palojärvi–Simonič `2.475` from `5.4·10⁶`; `x ≥ 5·10⁵`; `M(t)`; tabulated fields below `1.6·10⁶` |
| 3.6 | `garcialee2022artin` lines 62–74, 121–131, 145–147 | Corollary 2 and its five pairs; Lemma 3, `m(x)`; clearance `0.0010` at `7` |
| 4.2 | `hasanalizadeshenwong2022` lines 52–54, 63–65, 76 | Theorem 1.1 with `r₁/4`; Corollary 1.2; triple `(0.296, 3.971, 3.969)` |
| 4.8 | `dglsw2025` arXiv v1, Theorems 1.1, 1.2, 1.4, 1.5 | `(12.21124, 9.54177, −11.59548, 4.57803, 1)`; `A(n)`, `A''(n)` and `A''_{1/20}` as listed |
| 4.9 | `guo2026` arXiv v1, Theorem 1.1; `banks2026siegel` arXiv v1, Theorem 1.1, Remark 7.1 | `> 1/100` for `q ≥ 3`; `3.0·10⁻³` from `10¹⁰`, `3.069·10⁻³`, below `10¹⁰` from the record (R04) |
| 5.6 | `louboutin2003` lines 282, 307–339, 341–360, 368–369, 399–427, 475–492, 503–514, 603–605 | Theorems 9, 11, 12, 13, (9)–(11), Lemmas 7–8, `κ₁ = 0` |
| 5.7 | `banks2026brauersiegel` arXiv v2, Lemma 3.3, Theorem 1.3, p. 10 | absolute effective `c₂`; `β_K` convention; `c₃(ℚ) = c₂ min(1/4, c(ℚ), 1)` |
| 6.1 | `mcgowntrevinotrudgian2016` lines 84–95; `kerrmcgowntrudgian2020` lines 90–113 | indicator identity; Lemma 1, the sieved form |

### Adversarial table (values computed this round)

| Statement | Instances | Values (left vs right) | Result |
|---|---|---|---|
| 0.1 `μ_K`, `b_K` | `ℚ(i)`; `ℚ(√−14)`; `ℚ` | `2/π = 0.6366`, `b = 1.273`; `b = 4.764`, equal to `M K`; `μ_ℚ = 1`, while the `r₁`-exponent model gives `4/π > 1`; `a₂/a₁ = 0.564 < 1` | as stated |
| 0.2 `Π_K(p)` | `ℚ(i)` at `2, 5, 3`; `ℚ` at `6` | `2`, `1.5625`, `9/8` (with `p` in place of `N𝔭`: `3/2`); `Π_ℚ(6) = 3 > (6/5)` | primes only, as stated |
| 0.3 class-number lemma | `ℚ(√−14)` at `b_K` and at `b = 2.9`; Nicolas–Tenenbaum at `n = 2, x = 10` and `n = 3, x = 1` | `8 ≥ 4`; non-admissible `3 < 4`; `27 ≤ 33.03`; `1 ≤ 2`; integral `f(1) + ∫ = (x/n!)(n y^{n−1} + yⁿ − (n−1)ⁿ)` re-derived | admissibility needed, as stated |
| 0.4 relative class number and formula | `ℚ(√−5)`; `ℚ(i)`; `ℚ(ζ₈)` | `2/1 = 2`; `1·4·2·(π/4)/(2π) = 1`; `1.000`, and `1/2` with the wrong power | true |
| 0.4a four products (R01) | `ℚ(i)` at `s = 2`; residue; Gauss sums; Bernoulli | `ζ(2)G = 1.5067`, while the imprimitive level-8 product is `1.1300`; `L(1, χ₋₄) = π/4 = κ`; `ℚ(ζ₅)`: `−5√5 = i²√125`; `ℚ(√−3)`: `6·(1/6) = 1`; `ℚ(ζ₈)`: `8·(1/4)(1/2) = 1`; odd `L(1, χ₋₄) = πi·2i·(−1/2)/4 = π/4` | true; second owner |
| 0.5 `GRHMod`, gap predicates | `q = 2`; `√d/log d` | Euler-factor zeros on `Re s = 0` excluded by `0 < Re s`; minimum `e/2 = 1.359` at `d = e²`; `200/e = 73.576`; `√10⁷/log 10⁷ = 196.19`, `9·10⁶`: `187.35` | as stated |
| 0.5 `HasNormalTower` | `α⁴ − α − 1`; `ℚ(2^{1/4})` | discriminant `−283`, resolvent `x³ + 4x − 1` with no rational root, so `S₄` and no tower; quadratic steps | as stated |
| 0.6 `leastPrimePrimitiveRoot` | `p = 7, 409, 2791, 11971`; `h(40487)` | `(g, ĝ) = (3, 3), (21, 29), (6, 53), (10, 79)`; `√p − 2 = 18.22, 50.83, 107.41`; `h = 10`, `g = 5`; `h(3) = h(5) = 2` | matches Checks |
| 1.1a `digamma_series_remainder`, `trigamma_series_remainder` | `z = 3, N = 1`; `z = 1, N = 1` | `5/6 ≤ 2` (with `a = Re z`: `2/3 < 5/6`); `π²/6 − 1 = 0.6449 ≤ 1` | true; cap at `1` needed |
| 2.2 `idealCount_sunley` | `ℚ(i)`, `x = 10`; `n = 1` | count `9`, `κx = 7.854`, error `1.146` vs a right side above `e^{61.4}`; `n = 1` fails for `x < 1` | true; `n ≥ 2` needed |
| 2.3 Lee | `n = 1, 2, 3` | `𝔪(1) = π/4 < 1` (undefined); `A(2)`, `A(3)` as in Table 1 | matches |
| 2.4 `idealCount_debaene`, `classIdealCount_debaene` | cubic field of discriminant `−23`; `ℚ(i)`, `x = 10` | `R h = 0.2812`: printed `1 + log = −0.2687` (false form), `log⁺` gives `1`; `1.146 ≤ 2^{40}√10` | true with `log⁺` |
| 2.5 `rayClassIdealCount_gunRamareSivaraman` | `ℚ`, `𝔮 = (1)`; `𝔮 = (5)` | `F = 2`, `E = 1039.7`, bound `3729.8` vs a left side below `1`; `F = 2`, main term `x/5` | true |
| 2.6 Fehnker | `E₁(2)`, `E₂(2)`; `ℚ(i)` | `1.106·10⁶`, `1.733·10⁸`; range `t ≥ 6400`, (B2) constant `8.77·10⁷` | matches source |
| 3.3 `dedekindZeta_residue_ge_friedman` | `ℚ(ζ₅)`; cubic `−23` | `0.0324 ≤ 0.33984`; `0.0756 ≤ 0.3684` | true |
| 3.6 GGLM, Garcia–Lee | `ℚ(√−5)`; Theorem 2.1 at `x = e` | `0.0845 ≤ 1.405 ≤ 19.48`; `0.0772 ≤ 0.2172` | true |
| 4.2 | `ℚ`, `T = 15` | `2 + 0.620 + 1/4 = 2.87 ≤ 27.77` | true |
| 4.7 degree-uniform Stark | `ℚ(√5)`, `ℚ(ζ₇)⁺`; the degree bound; the gamma terms | `κ log d = 0.6927`, `1.1686`, so `c ≤ 0.6927`; `5.81 ≥ 5.20` (`n = 3`), `2343.8 ≥ 243` (`n = 10`); `−1.5541` per real place and `−2.4151` per complex place at `σ = 1` | true; repairs r7 R01 |
| 4.7 `dedekindZeta_residue_gt_stark` | `c₄`; cubic `−23` (`α = 24`); `ℚ(ζ₇)⁺` (`α = 4`) | `43.16211`; `0.000308 < 0.3684`; `0.001488 < 0.30026`; `1/(16c₄) = 0.00144803 > 0.0014480` | true |
| 4.8 | `n = 3`, `d = 23`, `|t| = 1` | denominator `8.08 > 0`; `1/A''(2) = 0.6207556 ≤ C₂ = 0.6207565` | matches |
| 4.9 | `ℚ(ζ₇)⁺`; why `c₀ ≤ 1/4` | interval `(0.9358, 1)`; `1/(4 log d) ≥ c₀/log d` only for `c₀ ≤ 1/4` | as stated (R04) |
| 5.3 `classNumber_le_bordelles` | `ℚ(√−14)`; cubic `−23`; `ℚ`; fifth form | `4 ≤ 60.25`; `1 ≤ 94.30`; `1 ≤ 1` (with `0⁰ = 1`); at admissible `b = 13`: `82.61` | true |
| 5.5 `relativeClassNumber_le` | `ℚ(i)`; `ℚ(√−5)`; `ℚ(ζ₈)` | `1 ≤ 4.798`; `2 ≤ 11.59`; `1 ≤ 12.72` | true |
| 5.6 | `ℚ(√−3)` in (12) with `c = 2`; Theorem 13 at `n = 3`, `ρ = 2800` | `1.1077 > 1 = h`, so the threshold is needed; `0.0823·52.9/4594 = 9.5·10⁻⁴` | threshold justified |
| 5.7 | worst case `(1 − β) log d = c₀`; no zero | `κ ≥ c c₀/log d`; `c/log d ≥ c c₀/log d` since `c₀ ≤ 1/4` | `C = c min(c₀, 1/4)` |
| 6.1 Vinogradov | `ℤ/6` at `x = 1, 2`; `ℤ/2 × ℤ/2` at `0` | `3·(1/3) = 1`, `0`; `−1` (non-cyclic, excluded) | as stated |
| 6.4 `leastPrimePrimitiveRoot_le_grh` | `p = 10⁹ + 7` (`p − 1 = 2·500000003`) | `ĝ = 5 ≤ 9894.6` | true |
| 7.1 `primeIdeal_mertens_garciaLee` | `ℚ(i)`, `x = 10` | product `0.2844`, `e^γ κ log x · ∏ = 0.9162`; with `e^{−γ}`: `0.2888` | normalisation pinned |
| 7.4 `leastPrimeIdeal_ahnKwon`, `_kadiriNgWong` | `ℚ(i)/ℚ` | least primes `3` (conjugation) and `5` (identity); Bach–Sorenson `(4 log 4 + 10)² = 241.7` | true |
| 7.5 `frobeniusPrimeCount_le_debaene` | `L = ℚ`, `x = 3` and `x = 2` | `2 ≤ 15.05`; at `x = 2` the right side is `−56.8 < 1` | `x > e` needed, as stated |

## Not verifiable

- These texts are recorded as uncertified, are not in the cache, and I did not read them this round, so no locator into them was checked:
  - `ramare2025`, `louboutin2000`, `louboutin2001`, `friedman1989`, `palojarvisimonic2026`;
  - `chen2022`, `washington1997`, `rademacher1959`, `stark1974`;
  - `thornerzaman2017`, `bachsorenson1996`, `ahnkwon2019`, `kadiringwong2019`, `kadiring2012`, `daskadiring2025`;
  - `mcgownsorenson2024`, `cullyhugilltrudgian2021`, `tudzi2026`, `leenosal2026`, `lamzourilisoundararajan2015`, `kadiriwong2022`, `odlyzko1976`, `luzamanzhao2026`.
- `stark1974` Lemmas 2–4 is checked only through its statement in `banks2026brauersiegel` Lemma 3.3. The `washington1997` Theorems 4.3, 4.9 and 4.17 cited in 0.4a are textbook results, and I checked them by computation (table above).
- I read `fehnker2026` v1, `gglm2026` v5, `dglsw2025` v1, `guo2026` v1, `banks2026siegel` v1 and `banks2026brauersiegel` v2 directly on arXiv. Nothing was recorded in a manifest.

## Source issues

These were re-verified at their locators this round. The other entries of the r7 review were not re-read and are not repeated.

- **Error** in louboutin2003 at Theorem 11, p. 3088: the source asserts (12) with `c = 2` for every CM field with `ζ_K/ζ_k ≥ 0` on `(0, 1)`, with no root-discriminant threshold, and `ℚ(√−3)` then gets `h⁻ ≥ 1.108`; it should require the thresholds of Theorem 1 that its proof applies; affects a stated result.
- **Misprint** in louboutin2003 at Theorem 13, p. 3088: the source writes root number for root discriminant and the range `[−2/log d_K, 1)` for `β`; it should be root discriminant and `[1 − 2/log d_K, 1)`; affects nothing.
- **Misprint** in bordelles2006 at §1, p. 2: the source defines the first Piltz function as `τ₁(m) = m`; it should be `τ₁(m) = 1`; affects nothing.
- **Error** in debaene2019 at Theorem 1, p. 2: the source asserts the bound for every `x` with `x(log x)^{−5n²} ≥ c_K`, including `x` near `1`, where `log log x < 0` and the right side is negative (`−56.8` at `L = ℚ`, `x = 2`); it should assume `x > e`; affects a stated result.
- **Error** in debaene2019 at Corollary 2, p. 3: the source uses the factor `1 + log(Reg_K h_K)`, which is negative when `Reg_K h_K < 1/e` (cubic field of discriminant `−23`); it should be `1 + log⁺`, as its proof gives; affects a stated result.
