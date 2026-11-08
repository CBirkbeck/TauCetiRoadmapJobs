# Review of ExplicitNumberFields (pull request #1944 at 0019da2)

**Verdict:** needs changes

This is a full re-review. Since `43e8351`, the head the previous review read, 178 lines of the folder changed (129 insertions, 49 deletions). The change does two things:
- it adds §1.1a, the digamma and trigamma series remainders, with two new theorems in `Suggested.lean`;
- it deletes the ComputationalNumberTheory contract that used to supply those remainders, and repoints 4.2, 4.3, 4.5, 4.8, 4.10, 7.2 and 7.3 to §1.1a.

Nothing outside the folder changed. No repair report exists for the previous review, so none of its findings is settled.

## Previous findings (r5, at `43e8351`)

| r5 | Passage at this head | Status |
|---|---|---|
| R01 (P2), §0.4a re-plans CyclotomicClassGroupsAndStickelberger §3.4 | README.md:46–48 still lists "the primitive character group `X(F)` … the odd-character Bernoulli product" under "Owned here"; §0.4a (README.md:872–958) and `Suggested.lean`:102–159 are unchanged | not repaired → R02 |
| R02 (P2), two gaps ask for what ExplicitZetaBounds provides | README.md:622–636 still declare `gap:iterated-perron` ("Required location: Layer 6, beside §6.2") and `gap:uniform-landau-siegel-gap` | not repaired → R03 |
| R03 (P2), 5.7's route misreads Banks | README.md:2021 still reads "The uniform Chebotarev-type bound is part of this target"; Stark's residue lemma is still stated nowhere | not repaired → R04 |
| R04 (P3), `letI` in four signatures | `Suggested.lean`:113, 127, 140, 157 unchanged; the gate still fails | not repaired → R05 |
| R05 (P3), Checks and Examples deleted | 0 `**Checks.**` lists and 0 `### Examples` sections (63 and 8 at `4198f62`) | not repaired → R06 |
| R06 (P3), supplier verifications not named | README.md:381–383 unchanged ("under the names given there") | not repaired → R07 |
| R07 (P3), Amberger and DGLSW certificates not stated | README.md:284–286 and 294–296 unchanged | not repaired → R08 |
| R08 (P3), two statements narrower than their sources | README.md:2087 "`r, h ≥ 2`"; README.md:1808 "with `β₁ ≥ 1 − 1/(12.74 log d_K)`" | not repaired → R09 |
| R09 (P3), three locators | (a) `sources.toml` now records `mossinghofftrudgian2015` (arXiv 1410.3926v1, Table 5, certified); (b) README.md:356 still "(ExplicitPrimeCounting)"; (c) README.md:340 still "lines 278–297" | (a) repaired; (b), (c) not → R10 |

## R01 (P2) — §1.1a re-plans ComputationalNumberTheory §4.17a

**Location.**
- README.md:53–55, under "Owned here": "the series for the digamma and trigamma functions on `Re z > 0` and their explicit remainders `digamma_series_remainder` and `trigamma_series_remainder`".
- §1.1a (README.md:1091–1141).
- `Suggested.lean`:184–201.

**Claim.** §1.1a and its two theorems repeat ComputationalNumberTheory §4.17a, statement for statement. That roadmap is open with this section at its head, at line 193 of the merge order; this roadmap is at line 274. The head deleted the contract that consumed §4.17a and planned the section again here. The object now has two owners, and two `Suggested.lean` files declare the same two theorems. The two theorems are not headlines of this roadmap either: they are about Mathlib's `Complex.digamma` and mention no number field. This file's own docstring says intermediate targets stay in the README.

**Witness.** ComputationalNumberTheory at its head:
- README.md:2167, "### 4.17a Explicit digamma and trigamma remainders", with the same `D_N`, `T_N`, `a = min(1, Re z)` and the same two bounds;
- `Suggested.lean`:492 and :499 declare `digamma_series_remainder` and `trigamma_series_remainder` with the same binders and the same right-hand sides as `Suggested.lean`:189 and :198 here.

**Repair.**
- Delete §1.1a, the Scope clause at README.md:53–55, the "For 1.1a" entry of *From Mathlib* (README.md:422–428), the `dlmf` reference (README.md:2510–2511; `sources.toml` has no `dlmf` entry), the two theorems, and the Layer 1 bullet of the module docstring.
- Restore the `43e8351` contract "### From TauCetiRoadmap.ComputationalNumberTheory: §4.17a `digamma_series_remainder`, `trigamma_series_remainder`".
- Cite §4.17a instead of 1.1a in:
  - the *Needs:* of 4.2, 4.5, 4.8, 4.10, 7.2 and 7.3;
  - the Dependencies of Layers 1, 4 and 7;
  - *How to read the build*.
- For the signs of the gamma terms in 4.3, cite ExplicitZetaBounds §1.2. Its bracket `ψ(x) < log x − 1/(2x)` for `x > 0` (its README.md:716) gives `ψ(σ/2) < 0 < log π` and `ψ(σ) < log 2 < log 2π` on `0 < σ ≤ 2`.
- Name ComputationalNumberTheory again among the suppliers in the pull request description.

**Tested.**
- The mathematics of §1.1a is right. I checked numerically:
  - at `z = 2`, `N = 1`: `0.5 ≤ 1` and `0.395 ≤ 1`;
  - at `z = 0.1`, `N = 1`: `0.847 ≤ 9` and `1.433 ≤ 10`;
  - at `z = 0.5 + 10i`: `2.391 ≤ 20.03`;
  - the largest ratio found is `0.990`, at `z = 0.999`, `N = 50`.
- So the defect is ownership, not truth. ComputationalNumberTheory is earlier in the merge order, so restoring the contract adds no upward edge.

## R02 (P2) — §0.4a re-plans CyclotomicClassGroupsAndStickelberger §3.4

Carried over from r5 R01; this head does not touch §0.4a.

**Location.**
- README.md:46–48 (Scope, "Owned here").
- §0.4a (README.md:872–958).
- `Suggested.lean`:102–159: `dedekindZeta_eq_prod_LFunction`, `dedekindZeta_residue_eq_prod_LFunction_one`, `abelianCharacter_gauss_product`, `relativeClassNumber_character_product`.

**Claim.** CyclotomicClassGroupsAndStickelberger (merge-order line 34) plans all four objects in its §3.4. Each object has two owners.

**Witness.** CyclotomicClassGroupsAndStickelberger at its head:
- README.md:640 makes `abelianCharacter_gauss_product` a target;
- README.md:671 makes the Euler product `ζ_F = ∏ L(χ, s)` and the residue comparison targets;
- `Suggested.lean`:166 and :179 declare `abelianCharacter_gauss_product` and `relativeClassNumber_character_product`, with the same hypotheses and right-hand sides, `letI` included.

EulerSystemsCyclotomicMainConjecture (README.md:777) already consumes §3.4's product.

**Repair.**
- Restore the `4198f62` contract: CyclotomicClassGroupsAndStickelberger §3.4 supplies:
  - `X(F)`;
  - `ζ_F = ∏ L(s, χ)` for `Re s > 1`, with the comparison at `s = 1`;
  - the Gauss product;
  - the relative class-number character product.
- Delete §0.4a and its four theorems.
- In Scope, move `X(F)` and its products to "Consumed".
- Cite §3.4 in the *Needs:* of 0.4, 5.2 and 5.6 and in the Layer 0 and Layer 5 Dependencies.
- Keep 0.4's `relativeClassNumber : ℕ` and `classNumber_maximalRealSubfield_dvd`. They are this roadmap's own: the supplier defines `h(F)/h(F⁺)` as a positive rational.

**Tested.** `4198f62` carried exactly this contract, with `statement-hygiene=0`. Deleting the four theorems also removes the four gate hits of R05.

## R03 (P2) — Two declared gaps ask for what ExplicitZetaBounds already states

Carried over from r5 R02.

**Location.**
- README.md:622–631: `gap:iterated-perron`, "Required location: Layer 6, beside §6.2".
- README.md:633–636: `gap:uniform-landau-siegel-gap`, "Required location: §7.9, beside Banks's instance".
- Both slugs are repeated in Scope (README.md:124–125, 177–178), in the *Needs:* of 2.2, 2.3, 3.6 and 4.9, and in the Dependencies of Layers 2–4.

**Witness.** ExplicitZetaBounds at its head:
- README.md:1853 is "### 6.1a Landau's iterated Perron identity", for `j ≥ 1`, `c > max(κ_a, 0)` and `x > 0`, with absolute convergence and the iterated-integral form;
- README.md:2436–2440 (§7.9) state the instance *HasLandauSiegelGap* `(1/100) ∞` "with the strict inequality (Guo, Theorem 1.1)".

**Repair.**
- Replace the two "What ExplicitZetaBounds must provide" paragraphs with contract entries citing §6.1a and §7.9 (Guo's instance), each stated as the supplier states it.
- Cite §6.1a in 2.2, 2.3, 3.6 and the Layer 2–3 Dependencies.
- Cite §7.9 in 4.9, in Scope and in the Layer 4 Dependencies.

**Tested.**
- §6.1a at `j = n` is the form 2.2 and 2.3 use, and at `j = 1` the form 3.6 uses.
- Guo's instance at §7.9 is the gap sentence of README.md:634–636, word for word in content: strict, every `q ≥ 3`.

## R04 (P2) — 5.7's route misreads Banks and leaves Stark's residue lemma unowned

Carried over from r5 R03.

**Location.** README.md:2017–2021: "Route (`banks2026brauersiegel`): the source's bound for `Σ_{N𝔭 ≤ X} δ_𝔭 log N𝔭/N𝔭` … uniform over Galois `K` once `X ≥ d_K^C` (the tool of both of its theorems) … The uniform Chebotarev-type bound is part of this target."

**Claim.**
- 5.7 assumes the gap as *UniformQuadraticZeroGap* `c₀`. In the source, the uniform Chebotarev bound only proves that gap, so the route inflates the target with a theorem it does not need.
- The route omits what turns a zero bound into a residue bound: Stark's Lemma 4, `κ_K ≥ c₂(1 − β_K)`. No layer here and no supplier states that lemma, so the input is unowned.

**Witness.** `banks2026brauersiegel` (arXiv v2, §3, pp. 9–10):
- Lemma 3.3 is Stark's Lemma 4: `κ_K ≥ c₂(1 − β_K)` for every `K ≠ ℚ`, with `c₂` absolute and effective.
- The proof of Theorem 1.3 uses Corollary 1.2, Lemma 3.2 and Lemma 3.3, giving `c₃(k) = c₂ min(1/4, c(k), η_k)` with `η_ℚ = 1`.
- Theorems 1.4–1.5 enter only through Corollary 1.2.

**Repair.**
- In 4.7, add Stark's Lemma 4 as a target: for every `K ≠ ℚ`, `κ_K ≥ c₂(1 − β_K)` with an absolute effective `c₂ > 0`. Here `β_K` is the largest real zero of `ζ_K` in `[1 − 1/(4 log d_K), 1)`, or `1 − 1/(4 log d_K)` if there is none. Cite Stark 1974, Lemma 4, through `banks2026brauersiegel` Lemma 3.3.
- Rewrite 5.7's route:
  1. 4.9's Galois bound gives `1 − β_K ≥ c₀/log d_K`.
  2. The new lemma, the residue formula, `w_K ≥ 1` and `2^{r₁}(2π)^{r₂} ≤ (2π)ⁿ` give `h_K R_K ≥ c₂ min(1/4, c₀) √d_K/((2π)ⁿ log d_K)`.
- Delete "The uniform Chebotarev-type bound is part of this target".
- *Needs:* 4.7 (Stark's Lemma 4) and 4.9.

**Tested.** At `k = ℚ` the source's constant becomes `c₂ min(1/4, c₀, 1)`. At `c₀ = 1/100` that is `C = c₂/100`. If `β_K` is not a zero, then `1 − β_K = 1/(4 log d_K) ≥ c₀/log d_K`.

## R05 (P3) — Gate fails: `letI` in four theorem signatures

Carried over from r5 R04.

**Location.** `Suggested.lean`:113, 127, 140, 157, each reading `letI : NeZero χ.conductor := ⟨χ.conductor_ne_zero⟩`.

**Witness.** My rerun of the gate on this head gives `statement-hygiene=4` and FAIL, at the same four lines. At the pin, `DirichletCharacter.conductor_ne_zero` is a lemma (`Mathlib/NumberTheory/DirichletCharacter/Basic.lean:254`), not an instance.

**Repair.** R02 deletes all four theorems. For any that stays:
- declare `instance instNeZeroConductor {m : ℕ} [NeZero m] (χ : DirichletCharacter ℂ m) : NeZero χ.conductor := ⟨χ.conductor_ne_zero⟩` after the Layer 0 heading;
- delete the `letI` lines;
- list the instance in the module docstring.

**Tested.** A scratch copy with that instance and no `letI` elaborates with 19 `sorry` warnings and nothing else.

## R06 (P3) — No definition has Checks and no layer has Examples

Carried over from r5 R05.

**Location.** The whole README. For example, 0.1 (README.md:762–780) ends at *Needs:*, and Layer 0 ends at `### Dependencies` (README.md:1066).

**Claim.** No definition has a single Check. Affected:
- Layer 0: `μ_K`, `b_K`, `Π_K`, `η_K`, `relativeClassNumber`, `X(F)`, *DedekindConjecture*, *CMPositivity*, `GRHMod`, the three gap predicates, `HasNormalTower`, `g`, `ĝ`;
- later layers: `A_L`, `E` and `F` of 2.5, `ℓ_K`, `u_K`, `r_K`, the thresholds `ϱ`, `𝒬_K`, `S_K(c, d)`, `starkAlpha`, `v_n`, `B_k`, *NoImaginaryQuadraticRealZero*, `δ_{ω,s}`, `c(p, x)`.

**Witness.** At this head the README has 0 `**Checks.**` lists and 0 `### Examples` sections. At `4198f62` it had 63 and 8. ComputationalNumberTheory's §4.17a, which §1.1a copies, carries three Checks; §1.1a carries none.

**Repair.**
- Restore the Checks lists and Examples sections of `4198f62`, with at least three discriminating Checks per definition.
- Adjust the Checks whose objects changed.

## R07 (P3) — Supplier verifications and hypotheses are carried but not named

Carried over from r5 R06, with one item added.

**Location.**
- README.md:381–383: "The finite verifications under which ExplicitMultiplicativeFunctions §§2.3, 2.5 and 7.1 state the bounds … under the names given there".
- 6.2 (README.md:2055–2058) and the theorems of 6.3 that use it.
- The GGLM theorem of 3.6 (README.md:1481–1484: "the inputs of ExplicitPrimeCounting §2.2").
- New: the §7.9 contract (README.md:610–616) and Banks's gap in 4.9 (README.md:1753–1756), which carry ExplicitPrimeCounting's *LuZamanZhaoSweep*.

**Witness.**
- ExplicitMultiplicativeFunctions at its head names, in §§2.3, 2.5 and 7.1:
  - *MoebiusRangeVerified*, *MoebiusDivRangeVerified*, *MoebiusDivStarRangeVerified*;
  - *SquarefreeRangeVerified*, *SquarefreeReciprocalRangeVerified*;
  - *MoebiusSquareTailRangeVerified*, *SquarefreeIntegralRangeVerified*.
- ExplicitZetaBounds README.md:2434 states Banks's instance "given `LuZamanZhaoRecord` (0.4b)". That record (its README.md:576) excludes zeros with `σ ≥ 1 − 1/(5 log q)` strictly, imprimitive characters included.

**Repair.**
- List each predicate, with the instance its owner uses, under "Imported, as their owners state them".
- Name them in the hypotheses of:
  - 6.2;
  - Theorem 3, Theorems 1–2 and Corollaries 1–2 of 6.3;
  - McGown–Sorenson's bounds;
  - the GGLM theorem of 3.6.
- In the §7.9 contract and in 4.9, carry ExplicitZetaBounds' `LuZamanZhaoRecord` (its 0.4b) as the supplier states it.

**Tested.** *LuZamanZhaoSweep* (`(1 − β) log q ≥ 1/5`) does not imply the record. A zero with `(1 − β) log q = 1/5` exactly satisfies the first and violates the second. So 4.9, under *LuZamanZhaoSweep* alone, does not meet the hypothesis of the supplier's theorem.

## R08 (P3) — Two computational hypotheses are not stated

Carried over from r5 R07.

**Location.**
- README.md:284–286, *AmbergerMajorantCertificate*: "the auxiliary function of `amberger2026` Lemma 3 … satisfies the sign conditions of that lemma at the parameters chosen for its Theorem 1".
- README.md:294–296, *DGLSWPolynomialCertificates*: "each nonnegative even trigonometric polynomial of the proofs of Theorems 1.1–1.5 … (`dglsw2025` §§2–5)".

**Claim.** Neither entry says which function or which polynomials, at which parameters, or which inequality it asserts. So the hypotheses of 4.2 (Amberger), 4.8, 4.10 and 7.3 are not determined.

**Witness.** Compare *KadiriDedekindPolynomialCertificate* (README.md:287–290): it names the predicate (*IsAdmissibleCosinePolynomial* `4 a`, ExplicitZetaBounds §0.5) and the literal coefficients. The two entries above name neither.

**Repair.**
- For DGLSW, state *IsAdmissibleCosinePolynomial* `n a` for each polynomial of `dglsw2025` §3.3 and its coefficient tables, giving each one's table and degree.
- For Amberger, write out the majorant and the inequalities of its Lemma 3 at the parameters of the proof of Theorem 1. If the preprint does not print them, move Amberger's count to ExplicitNumberFields, Part II.

## R09 (P3) — Two statements are narrower than their sources

Carried over from r5 R08.

**Location.**
- (a) README.md:2087, McGown–Trudgian's main criterion: "integers `r, h ≥ 2`".
- (b) README.md:1806–1808, Kadiri–Ng–Wong: "a real zero `β₁` of `ζ_K` with `β₁ ≥ 1 − 1/(12.74 log d_K)`", imposed on Theorem 1.3 as well as Theorem 1.2.

**Witness.**
- (a) `mcgowntrudgian2020` line 416 says "Given r, h ≥ 1", and line 423 says `r, h ∈ ℤ⁺` with `h ≥ 2`.
- (b) `kadiringwong2019` (arXiv:1902.08640v1, p. 2): Theorem 1.3 assumes only a real zero `β₁` and another real zero `β′ ∈ (0, 1)`. The exceptional-zero hypothesis belongs to Theorem 1.2 alone.

**Repair.**
- (a) Write "integers `r ≥ 1`, `h ≥ 2`". The moment constant of ExplicitCharacterSumsAndSieves §4.1 is stated for `r, h ≥ 1`.
- (b) State Theorem 1.3 for every real zero `β₁`, and keep the exceptional hypothesis on Theorem 1.2.

**Tested.** At `r = 1` the source's criterion applies and the README's excludes it. `β₁ = 1 − 1/(10 log d_K)` is covered by the source's Theorem 1.3 and not by the README's statement.

## R10 (P3) — Two locators

Carried over from r5 R09 (b) and (c).

**Location.**
- (b) README.md:353–356: *LeeNosalMertensRange* is cited as "(ExplicitPrimeCounting)".
- (c) README.md:339–341: *SmallPrimitiveRootsModPSquare* is cited as "`kerrmcgowntrudgian2020` lines 278–297".

**Witness.**
- (b) The predicate is in ExplicitPrimeCounting §1.3, "Finite-range verifications" (its README.md:1056).
- (c) `kerrmcgowntrudgian2020` lines 278–297 treat `p ≥ 10¹²`. The small cases are lines 82–84: Paszkiewicz's computation and the two exceptional primes.

**Repair.** (b) Write "ExplicitPrimeCounting §1.3". (c) Write "lines 82–84".

## R11 (P3) — `Suggested.lean` gives a false reason for omitting Kadiri–Ng–Wong's least prime ideal

**Location.** `Suggested.lean`:73–77: Kadiri–Ng–Wong's bound "is statable … but is not stated: its source is cited by locator only, so the form of its conclusion beyond the exponent (the threshold and the degree of the prime) is not checked against the text".

**Witness.** `kadiringwong2019` (arXiv:1902.08640v1, Theorem 1.1, p. 1): for `L/K` Galois and a conjugacy class `C`, there is an unramified prime of `𝓞_K` of degree one with Frobenius class `C` and norm at most `d_L^{16}`, when `d_L` is sufficiently large. Both the threshold and the degree can be checked in that text.

**Repair.** Either:
- state it beside `leastPrimeIdeal_ahnKwon`, with an absolute threshold as the Conventions prescribe: `∃ D₀ : ℝ`, for every Galois `L/K` with `D₀ ≤ |d_L|` and every `C`, some `𝔭 ∈ frobeniusPrimeSet K L C` has prime norm `≤ |d_L|^16`; or
- give a true reason in the docstring, for example that it is a variant of the Ahn–Kwon headline.

## Verified sound

**Gate, dependency check and build.**
- Gate rerun (`gate … ExplicitNumberFields --base origin/main`): every check is 0 except `statement-hygiene=4` (R05), so the result is FAIL. The worker's gate reports the same failure, with build 0.
- Dependency check output: `depcheck: 238 roadmaps, 2432 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. Merge-order lines of the suppliers:
  - this roadmap 274;
  - LFunctions 28, CyclotomicClassGroupsAndStickelberger 34, ZerosOfLFunctions 85, AnalyticNumberTheoryPartI 90;
  - ComputationalNumberTheory 193;
  - ExplicitZetaBounds 270, ExplicitPrimeCounting 271, ExplicitCharacterSumsAndSieves 272, ExplicitMultiplicativeFunctions 273.
- `lake env lean …/Suggested.lean` gives 19 warnings, all `declaration uses 'sorry'`, at lines 98, 107, 121, 135, 150, 189, 198, 209, 221, 233, 248, 269, 286, 298, 308, 322, 338, 359 and 373, and nothing else.
- I ran `#check @name` for all 24 declarations in one scratch file. Each elaborated type matches its README statement and `signatures.md`. The file has no `variable` block, so no binder is lost.
- One-tactic probe: each of the 19 theorems was tried with `first | (simp; done) | rfl | (norm_num; done) | trivial | infer_instance | decide | (positivity; done)`. All 19 fail, so none is one-tactic padding. The two digamma theorems are not headlines (R01).
- Nothing outside the folder changed (`git diff --stat origin/main...HEAD` outside the folder is empty).

**Library declarations opened at the pins.**
- Mathlib, in `Mathlib/Analysis/SpecialFunctions/Gamma/Digamma.lean`:
  - `Complex.digamma` (:48, `logDeriv Gamma`), `digamma_one` (:56), `digamma_apply_add_nat` (:72), `digamma_nat_add_one` (:85), `digamma_one_sub` (:94).
  - Mathlib has no digamma series at the pin. The file's TODO names only Gauss' integral.
- Mathlib, other files:
  - `Real.BohrMollerup.tendsto_log_gamma` and `logGammaSeq` (`Gamma/BohrMollerup.lean`:293, :140);
  - `Real.tendsto_harmonic_sub_log` (`Harmonic/EulerMascheroni.lean`:153);
  - `Complex.Gamma_ofReal` (`Gamma/Basic.lean`:419);
  - `Complex.differentiableAt_Gamma` (`Gamma/Deriv.lean`:75);
  - `Complex.Gamma_ne_zero` (`Gamma/Beta.lean`:427);
  - `hasDerivAt_of_tendstoLocallyUniformlyOn` (`Calculus/UniformLimitsDeriv.lean`:489);
  - `HasDerivAt.real_of_complex` (`Complex/RealDeriv.lean`:47);
  - `Complex.differentiableOn_tsum_of_summable_norm` and `hasSum_deriv_of_summable_norm` (`Complex/LocallyUniformLimit.lean`:171, :182);
  - `AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq` (`Analytic/IsolatedZeros.lean`:234);
  - `dedekindZeta_residue`, `dedekindZeta_residue_def`, `tendsto_sub_one_mul_dedekindZeta_nhdsGT` (`NumberField/DedekindZeta.lean`:57, :61, :78);
  - `DirichletCharacter.conductor_ne_zero` and `primitiveCharacter` (`DirichletCharacter/Basic.lean`:254, :306).
- Tau Ceti:
  - `idealsLE` and `primesLE` (`ArithmeticDirichletSeries/Counting.lean`:103, :107);
  - `rayClassIdealCountingFunction` (`RayClass/Count/Basic.lean`:100);
  - `frobeniusPrimeSet` (`Chebotarev/FrobeniusPrimeSet.lean`:93);
  - `frobeniusPrimeCount` (`PrimeCounting/VonMangoldt.lean`:177);
  - `abelianConductor` (`AdmissibleModulus/Basic.lean`:193);
  - `mertensConstant` (`LFunctions/Mertens.lean`:545);
  - `generalizedBernoulli` (`GeneralizedBernoulli.lean`:81);
  - `conreyGenerator` (`Conrey.lean`:78).

**Cross-roadmap citations resolved, at main or at the open head.**
- ComputationalNumberTheory §4.17a (R01).
- CyclotomicClassGroupsAndStickelberger §3.4 (R02).
- ExplicitZetaBounds:
  - §§0.5, 2.1, 2.5, 3.2, 5.1, 7.9, 9.1 at their headings;
  - §6.1a (R03);
  - §1.2's digamma bracket (README.md:716);
  - 0.4b `LuZamanZhaoRecord` (R07).
- ExplicitPrimeCounting:
  - §§1.3, 1.7 (*LuZamanZhaoSweep*, *BanksGap*), 2.2, 4.7, 6.5;
  - §4.7 has no Schoenfeld bound from `x = 13.5`, and §6.5 has no Bach smoothed sum, so `gap:explicit-mertens-second` and `gap:bach-grh-smoothed-sum` remain real gaps.
- ExplicitMultiplicativeFunctions §§2.3, 2.5, 7.1, 7.5, 7.9, 8.1, 9.1, 9.4. §7.1's `+1.166` is stronger than the source's `+2` (`mcgowntrudgian2020` line 337), as 6.2 needs.
- ClassFieldTheory on main:
  - Layer 11 lists towers and `globalArtinMap_ideal`, but no base-change norm functoriality of the global ideal Artin map; Layer 7's `artinMap_norm` is local. So `gap:artin-norm-compatibility` remains a real gap.
  - Layer 4 `artinMap_groundNorm` exists.
- Gaps: the five slugs in the README are in `design/plan.json`.

**Sample sources read at their locators.**

| Target | Source and lines | Agreement |
|---|---|---|
| 0.2 | `louboutin2005` 50–51 | `Π_K(2)/2ⁿ ≤ 1`, and `= 1/(2ⁿ − 1)` when 2 is inert. The README's "iff" holds both ways: for `n = 2`, inert gives `1/3`, split `1`, ramified `1/2` |
| 1.1a | DLMF 5.7.6 and 5.15.1 (dlmf.nist.gov) | Both series hold for `z ∉ {0, −1, −2, …}`; the README uses them on `Re z > 0` |
| 2.1 | `widmer2010` 771–776; `debaene2019` 205–215 | Theorem 5.4 with `c₀(D) = D^{3D²/2}`, translates, `Ω ≤ D^{3D/2}/(2π)^{D/2}` |
| 2.4 | `debaene2019` 107–124, 876–899, 941–954 | Corollary 2 as printed; the `log⁺` repair is justified (see the source issues) |
| 3.1 | `louboutin2003` 297–306 | (8): `κ_k ≤ (1 − β)(e log d_k/(2n))ⁿ` for `1/2 ≤ β < 1` |
| 3.3 | `garcialee2022mertens` 1214–1225 | (22), `2^{r₁}(2π)^{r₂} ≥ 4`, Friedman's `0.09058` |
| 3.4 | `louboutin2003` 65–87, 106–136 | Theorem 1 (1), (2), (4), Table 1 entry for entry, `A_K`, the split formula |
| 4.2 | `hasanalizadeshenwong2022` 52–54, 63–65, 70–77 | Theorem 1.1, Corollary 1.2, Table 1 |
| 4.5 | `kadiri2012` 79–94 | Theorem 1.1 (12.55, 9.69, 3.03, 58.63; 12.74), Corollary 1.2 (2, 1/2; 1.70, 1/4) |
| 4.6 | `lee2021zerofree` 103–135 | Theorems 1 (no threshold) and 2 (12.43436) |
| 5.6 | `louboutin2003` 282, 307–339, 341–368, 399–427, 475–492, 503–520 | `v_n`, (9)–(11), Lemma 7(2), Lemma 8, Theorems 9, 11, 12 and 13 as stated |
| 6.1 | `mcgowntrevinotrudgian2016` 70–98; `kerrmcgowntrudgian2020` 90–113 | Vinogradov's indicator and the sieved form |
| 7.5 | `debaene2019` 69–75 | Theorem 1 as printed; `x > e` repairs the range (see the source issues) |
| 4.1 (context) | `trudgian2015` 25–27 | `(0.317, 6.333, 3.482)` |
| R04 | `banks2026brauersiegel` arXiv v2 §3, pp. 9–10 | See R04 |
| R09(b), R11 | `kadiringwong2019` arXiv v1 pp. 1–2 | Theorems 1.1–1.3, Corollary 1.3.1 and the remark giving 15.72 |

**Adversarial table (values computed this round).**

| Statement | Instances | Values (left vs right) | Result |
|---|---|---|---|
| `digamma_series_remainder` | `z = 1`; `z = 2, N = 1`; `z = 0.1, N = 1`; `z = 3 − 7i, N = 1`; `z = 0.999, N = 50` | `0 ≤ 0`; `0.5 ≤ 1`; `0.847 ≤ 9`; `1.974 ≤ 7.280`; ratio `0.990` | true; duplicated (R01) |
| `trigamma_series_remainder` | `z = 1, N = 1`; `z = 0.01, N = 1`; `z = 1, N = 50` | `0.645 ≤ 1` (`π²/6 − 1`); `1.621 ≤ 100`; ratio `0.990` | true; duplicated (R01) |
| 1.1a / 4.3 signs | `ψ(1)`, `ψ(2)` | `−0.5772 < log π = 1.1447`; `0.4228 < log 2π = 1.8379` | true |
| `abelianCharacter_gauss_product` | `ℚ(i)`, `ℚ(√5)`, `ℚ(√−3)` | `2i` vs `i·2`; `√5` vs `√5`; `i√3` vs `i√3` | true; duplicated (R02) |
| `relativeClassNumber_character_product` | `ℚ(i)`, `ℚ(√−5)`, `ℚ(√−23)` | `B₁ = −1/2, −2, −3`; `Q w ∏(−B/2) = 4·¼ = 1`, `2·1 = 2`, `2·3/2 = 3`, each equal to `h` | true; duplicated (R02) |
| `dedekindZeta_residue_eq_prod_LFunction_one` | `ℚ(√5)`; `F = ℚ` | `κ = 0.430409 = 2 log φ/√5`; empty product `1 = κ_ℚ` | true; duplicated (R02) |
| `classNumber_maximalRealSubfield_dvd` | `ℚ(√−5)`, `ℚ(ζ₂₃)` | `1 ∣ 2`; `1 ∣ 3` | true |
| `idealCount_sunley` | `ℚ(i)`, `x = 10` | count `9` vs `7.854`; `1.146 ≤ 1.153·10³¹` | true |
| `idealCount_debaene` | `ℚ` (`n = 1`); `ℚ(√5)`; cubic field of discriminant `−23` | `|⌊x⌋ − x| < 1 ≤ 1`; `R h = 0.4812`, printed factor `(1 + log Rh)^{1/2} = 0.518` vs `log⁺` factor `1`; `1 + log(0.2812) = −0.269`, so the printed `(·)^{4/3}` is undefined while `log⁺` gives `1` | the `log⁺` form is needed |
| `classIdealCount_debaene` | `ℚ(√−5)`, trivial class, `x = 10` | principal ideals of norm ≤ 10: `8`, against `κx/h = 7.025`; difference `0.975` | true |
| `rayClassIdealCount_gunRamareSivaraman` | `ℚ`, `𝔮 = (1)` | `H = 1`, `φ = 1`, `F = 2`, `E = 1039.7`; bound `3729.86` vs `|⌊x⌋ − x| < 1` | true |
| `dedekindZeta_residue_ge_friedman` | `ℚ(i)`; `ℚ(√5)`; cubic `−23` | `0.1812 ≤ 0.7854`; `0.1620 ≤ 0.4304`; `0.0755 ≤ 0.3684` | true |
| `dedekindZeta_residue_gt_stark` | cubic `−23` (α = 24); `ℚ(ζ₇)⁺` (α = 4) | `c₄ = 43.1621`; `0.000308 < 0.3684`; `0.001488 < 0.3003`; `1/(16c₄) = 0.0014480` | true |
| `classNumber_le_bordelles` | `ℚ(√−14)`, `ℚ(√−5)`, `ℚ(√−3)`, cubic `−23`, `ℚ` | `60.25 ≥ 4`; `26.79 ≥ 2`; `3.81 ≥ 1`; `94.30 ≥ 1`; `n = 1`: `1 ≥ 1` | true |
| `relativeClassNumber_le` | `ℚ(i)`, `ℚ(√−23)`, `ℚ(ζ₅)` | `4.798 ≥ 1`; `13.01 ≥ 3`; `12.12 ≥ 1` | true |
| `leastPrimePrimitiveRoot_le_grh` | `p = 10⁹ + 7`, `ω(p − 1) = 2` | `ĝ = 5 ≤ 9894.6` | true |
| `primeIdeal_mertens_garciaLee` | `ℚ(i)`, `x = 10` | (A) `|1.2345 − 2.3026| = 1.068 ≤ Υ`; (C) `e^γ κ log x ∏ = 0.9162`, error `0.084 ≤ Θe^Θ` | true |
| `leastPrimeIdeal_ahnKwon` | `ℚ(i)/ℚ`; `L = K = ℚ(i)` | split prime `5`, inert `3`; `(1 + i)` of norm `2`; all `≤ 4^{12577}` | true |
| `frobeniusPrimeCount_le_debaene` | `L = K = ℚ`, `x = 10⁶`; `x = 3` | condition `5.03·10⁵ ≤ 10⁶`, `78498 ≤ 708805`; condition `1.60 ≤ 3`, `2 ≤ 15.05` | true |
| 4.1 from HSW Table 1 | differences of the constants | `0.021`, `2.362`, `−0.487`; `2.362 − 0.487 > 0` | sound |
| 4.2 corollary | coefficient of `n` | `23.02528 + 0.22737(log 3 − log 2π) + 0.25 = 23.1072 ≤ 23.108` | sound |
| 3.4 thresholds | `Λ_{2}` | `8.4926`; `2π² = 19.739`; `2π²Λ = 167.638`; `32π²Λ = 2682.208` (source lines 82, 84) | sound |
| 3.1 route | kernel `x^{u−1} + x^{−u}` | its derivative is `log x (x^{u−1} − x^{−u}) ≥ 0` iff `u ≥ 1/2`, for `x ≥ 1` | sound |
| 5.6, Theorem 13 route | `d_F^n ≤ d_K` | `√d_F ≤ ρ_K`; `d_K^{(β−1)/2} ≥ e^{−1}` on `β ≥ 1 − 2/log d_K` | sound |
| 6.1 | `ℤ/4`, `ℤ/6` | generator: `(2/4)(1 + 1) = 1` and `(2/6)·3 = 1`; element of order 3 in `ℤ/6`: `1 − 1 + ½ − ½ = 0` | sound |
| 4.9 | `c₀ = 1/100`, `d_F = 3` | `c₀/log 3 = 0.0091 < 1/4`; the non-Galois case uses `log d_N ≤ m_N log d_K` (`louboutin2003` line 357) | sound |
| 5.7 (R04) | Banks at `k = ℚ` | `C = c₂ min(1/4, c₀, 1) = c₂/100` at `c₀ = 1/100` | route wrong |
| 4.9 Banks gap (R07) | a zero at `(1 − β) log q = 1/5` | allowed by *LuZamanZhaoSweep*, excluded by `LuZamanZhaoRecord` | hypothesis misnamed |
| R05 repair | scratch copy | 19 `sorry` warnings, 0 errors | works |

## Not verifiable

- These texts are recorded as uncertified, are not in the cache, and I did not read them:
  - `ramare2025` (2.7): checked only for internal consistency. `ζ_K(0) = (1/(2d)) Σ r χ(r) = −h/w` gives `−1/4` for `ℚ(i)` and `−1/6` for `ℚ(√−3)`. The supremum limits `1/(1 − s) = 4` and `1/(s − 1) = 4` agree with `r_K ≥ 4^{2/3}`.
  - `guo2026` and `banks2026siegel` (4.9): the route was checked by derivation.
  - `amberger2026` (4.2, R08).
  - `louboutin2001` (3.1, primary; read through `louboutin2003`).
  - `friedman1989` (3.3, read through `garcialee2022mertens`).
  - `dglsw2025`, `fehnker2026`, `gglm2026`, `palojarvisimonic2026`, `chen2022`, `washington1997`, `rademacher1959` and Stark 1974.
- `banks2026brauersiegel` and `kadiringwong2019` are uncertified in the manifest. I read their arXiv texts (v2 and v1) directly; nothing was fetched into the cache.
- Ownership against open pull requests was checked by object only for the objects of R01, R02 and R11. For those I ran `roadmaps grep` over every open head and main, and read the five closest roadmaps in `overlaps.md`. It was not checked for every object of the roadmap.

## Source issues

- **Misprint** in louboutin2003 at Theorem 13, p. 3088: the source says "root number `ρ_K ≥ 2800`" and `β ∈ [−(2/log d_K), 1)`; it should be root discriminant, and `[1 − 2/log d_K, 1)`; affects nothing.
- **Error** in debaene2019 at Theorem 1, p. 2: the source states the bound for every `x` with `x(log x)^{−5n²} ≥ c_K`, which includes `x` near `1`; at `L = K = ℚ`, `x = 1.5` the hypothesis holds (`0.011 ≤ 1.5`) and the right side is about `−330`; it should assume `x > e`; affects a stated result.
- **Error** in debaene2019 at Corollary 2 and its proof, pp. 3 and 15: the source writes `(1 + log Reg_K h_K)^{(n−1)²/n}`, but for the cubic field of discriminant `−23` (`R h = 0.2812`) the base is `−0.269`, and the absorption step needs `Reg ≥ 1`; it should be `1 + log⁺`; affects a stated result.
- **Misprint** in banks2026brauersiegel at Theorem 1.3, p. 3: the statement calls its constant `c(k)`, the symbol of Corollary 1.2's gap constant; the proof gives `c₃(k) = c₂ min(1/4, c(k), η_k)`; affects nothing.
