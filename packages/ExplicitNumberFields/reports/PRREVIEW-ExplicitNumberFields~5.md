# Review of ExplicitNumberFields (pull request #1944 at 43e8351)

**Verdict:** needs changes

This is a full re-review. The folder changed by 1753 lines since `4198f62`: 499 insertions, 1254 deletions. The head does four things:
- adds a `## Computational hypotheses` section;
- takes ownership of the abelian character products as a new 0.4a, with four new theorems in `Suggested.lean`;
- drops the CyclotomicClassGroupsAndStickelberger contract;
- deletes every **Checks.** list and every `### Examples` section.

Nothing outside the folder changed.

**Previous findings.** The previous review (r4, at `4198f62`) raised no findings, so nothing needed repair. The two Checks it recomputed are deleted at this head: the `ω = 17` Check of 6.3 and the `ω(p − 1) = 14` Check of 6.4 (see R05).

## R01 (P2) — 0.4a re-plans CyclotomicClassGroupsAndStickelberger §3.4

**Location.**
- `TauCetiRoadmap/ExplicitNumberFields/README.md:46–48`, under "Owned here": "the primitive character group `X(F)` of an abelian field with its Euler product, its residue product, its Gauss-sum product and the odd-character Bernoulli product".
- §0.4a (README.md:866–952).
- `Suggested.lean:101–158`: `dedekindZeta_eq_prod_LFunction`, `dedekindZeta_residue_eq_prod_LFunction_one`, `abelianCharacter_gauss_product`, `relativeClassNumber_character_product`.

**Claim.** All four objects are planned by CyclotomicClassGroupsAndStickelberger §3.4. That roadmap is open as #1260 and is line 34 of the merge order; this roadmap is line 274. The head deleted the contract that consumed §3.4 (README at `4198f62`, `### From TauCetiRoadmap.CyclotomicClassGroupsAndStickelberger`) and restated the targets here. The objects now have two owners.

**Witness.** CyclotomicClassGroupsAndStickelberger at #1260:
- `Suggested.lean:166` declares `abelianCharacter_gauss_product` and `Suggested.lean:179` declares `relativeClassNumber_character_product`, with the same hypotheses and right-hand sides, `letI` included.
- `README.md:671` makes the Euler-product identity and the residue comparison targets.

**Repair.**
- Restore the `4198f62` contract: CyclotomicClassGroupsAndStickelberger §3.4 supplies `X(F)`, `ζ_F = ∏ L(s, χ)` for `Re s > 1` with the comparison at `s = 1`, the Gauss product and the relative class-number character product.
- Delete §0.4a and its four theorems from `Suggested.lean`.
- In Scope, move `X(F)` and its products from "Owned here" to "Consumed". Keep the clause saying how 0.4 differs: `h(K⁺) ∣ h(K)` for every CM field, with `relativeClassNumber` a natural number.
- Cite §3.4 in the *Needs:* of 0.4, 5.2 and 5.6, and in the Layer 0 and Layer 5 Dependencies.
- If you judge that §3.4 uses `κ_F = ∏_{χ ≠ 1} L(1, χ)` only inside a route, keep that one statement here as a consequence of §3.4's Euler product, stated with the instance of R04.

**Tested.** `4198f62` carried exactly this contract, and the gate passed there with `statement-hygiene=0`.

## R02 (P2) — Two declared gaps ask for what ExplicitZetaBounds already states

**Location.** README.md:618–627 declares `gap:iterated-perron` with "Required location: Layer 6, beside §6.2". README.md:629–632 declares `gap:uniform-landau-siegel-gap` with "Required location: §7.9, beside Banks's instance". Both are repeated in Scope (README.md:122–123 and 176–177), in the *Needs:* of 2.2, 2.3, 3.6 and 4.9, and in the Layer 2–4 Dependencies.

**Claim.** The supplier's head already contains both statements, so each gap asks for what is provided.

**Witness.** ExplicitZetaBounds at #1954:
- §6.1a, "Landau's iterated Perron identity" (`README.md:1828–1849`), proves the identity for `j ≥ 1`, `c > max(κ_a, 0)` and `x > 0`, with the iterated-integral form.
- §7.9 (`README.md:2415–2420`) proves Guo's *HasLandauSiegelGap* `(1/100) ∞`, with strict inequality for every `q ≥ 3`.

**Repair.**
- Replace the two "What ExplicitZetaBounds must provide" paragraphs with contract entries citing §6.1a and §7.9 (Guo's instance), each stated as the supplier states it.
- In 2.2, 2.3 and 3.6, cite §6.1a instead of `gap:iterated-perron`.
- In 4.9, Scope and the Layer 4 Dependencies, cite §7.9 instead of `gap:uniform-landau-siegel-gap`.
- Drop "(supplier gaps below)" at README.md:123.

**Tested.** I checked that the statement at §6.1a, for `j = n` and `j = 1`, is the form 2.2, 2.3 and 3.6 use. The three gaps that remain are not provided at their suppliers' heads: `explicit-mertens-second` (ExplicitPrimeCounting §4.7 starts at `x = 24.4`), `bach-grh-smoothed-sum` (ExplicitPrimeCounting §6.5 has no smoothed sum with `c(p, x)`) and `artin-norm-compatibility`.

## R03 (P2) — 5.7's route misreads Banks and leaves its residue input unowned

**Location.** README.md:1958–1962: "Route (`banks2026brauersiegel`): the source's bound for `Σ_{N𝔭 ≤ X} δ_𝔭 log N𝔭/N𝔭` …, uniform over Galois `K` once `X ≥ d_K^C` (the tool of both of its theorems) … The uniform Chebotarev-type bound is part of this target."

**Claim.** In the source, the uniform Chebotarev bound (Theorems 1.4–1.5) proves the gap (Theorem 1.1 and Corollary 1.2). 5.7 assumes that gap as *UniformQuadraticZeroGap* `c₀`. Theorem 1.3 itself follows from three inputs:
- the gap;
- Stark's reduction to a quadratic subfield;
- Stark's residue lemma `κ_K ≥ c₂(1 − β_K)`.

The third input is stated nowhere here or in a supplier; 4.7 only passes through it inside a route. The target is therefore inflated by a Masser-type theorem it does not need, and it misses the lemma it does need.

**Witness.** `banks2026brauersiegel` (arXiv v2, read here):
- lines 538–561: the proof of Theorem 1.3 uses Corollary 1.2, Lemma 3.2 (Stark's Lemma 3 and Theorem 3) and Lemma 3.3;
- lines 519–520: Lemma 3.3 is Stark's Lemma 4, `κ_K ≥ c₂(1 − β_K)` with `c₂` absolute and effective;
- line 555: `C = c₂ min(1/4, c(k), η_k)`, with `η_ℚ = 1`.

**Repair.**
- In 4.7, add Stark's Lemma 4 as a target. For every `K ≠ ℚ`, `κ_K ≥ c₂(1 − β_K)` with an absolute effective `c₂ > 0`. Here `β_K` is the largest real zero of `ζ_K` in `[1 − 1/(4 log d_K), 1)`, or `1 − 1/(4 log d_K)` if there is none. Cite Stark 1974, Lemma 4, through `banks2026brauersiegel` Lemma 3.3, lines 516–520.
- Rewrite 5.7's route:
  1. 4.9's Galois bound gives `1 − β_K ≥ c₀/log d_K` (`0 < c₀ ≤ 1/4`).
  2. The new lemma, the residue formula, `w_K ≥ 1` and `2^{r₁}(2π)^{r₂} ≤ (2π)ⁿ` give `h_K R_K ≥ c₂ c₀ √d_K/((2π)ⁿ log d_K)`.
- Delete "The uniform Chebotarev-type bound is part of this target".
- *Needs:* 4.7 (Stark's Lemma 4) and 4.9.

**Tested.** I checked this derivation against lines 549–559 at `k = ℚ`: there `η_ℚ = 1`, and `c(ℚ)` is replaced by `c₀ ≤ 1/4`.

## R04 (P3) — Gate fails: `letI` in four theorem signatures

**Location.** `Suggested.lean:112, 126, 139, 156`, each reading `letI : NeZero χ.conductor := ⟨χ.conductor_ne_zero⟩`.

**Claim.** This is the gate's statement-hygiene rule, at P3 with the repair "use an instance binder or a named instance". The gate fails, so the folder cannot be accepted.

**Witness.** My rerun of the gate on this head reports `statement-hygiene=4`, with the same four lines, and FAIL. At the pin Mathlib has no `NeZero χ.conductor` instance; `conductor_ne_zero` is a lemma (`Mathlib/NumberTheory/DirichletCharacter/Basic.lean:254`).

**Repair.** R01 removes three of the four statements. For any statement that stays:
- declare once, before it, `instance instNeZeroConductor {m : ℕ} [NeZero m] (χ : DirichletCharacter ℂ m) : NeZero χ.conductor := ⟨χ.conductor_ne_zero⟩`;
- delete the `letI` lines;
- name the instance in the module docstring's list of definitions.

**Tested.** I elaborated a scratch copy with that instance and no `letI`. It gives 17 `sorry` warnings and nothing else.

## R05 (P3) — Every Checks list and every Examples section was deleted

**Location.** The whole README. For example, 0.1 (README.md:756–774) ends at *Needs:* with no **Checks.**, and Layer 0 ends at `### Dependencies` (README.md:1060) with no `### Examples`. The same holds for Layers 1–7.

**Claim.** None of the roughly 23 definitions has a Check, and no layer has examples:
- in Layer 0: `μ_K` and `b_K`, `Π_K`, `η_K`, `relativeClassNumber`, `X(F)`, *DedekindConjecture*, *CMPositivity*, `GRHMod`, the three gap predicates, `HasNormalTower`, `g` and `ĝ`;
- in later layers: `A_L`, `E` and `F` of 2.5, `ℓ_K`, `u_K` and `r_K`, the thresholds `ϱ`, `𝒬_K`, `S_K(c, d)`, `starkAlpha`, `v_n` and `B_k`, *NoImaginaryQuadraticRealZero*, `δ_{ω,s}` and `c(p, x)`.

The deleted Checks also carried the evidence for two predicates that now stand without it. *McGownTrudgianWindowCheck* exists because at `ω = 17` the least left side is `1.462·10¹¹ > 10¹¹`. The threshold `1.71·10¹⁶` belonged to *GrosswaldSieveVerification* at `ω = 14`.

**Witness.** At `4198f62` the README had 63 `**Checks.**` lists and 8 `### Examples` sections. At this head it has 0 of each.

**Repair.**
- Restore the 63 Checks lists and 8 Examples sections from `4198f62`, at least three discriminating Checks per definition.
- Adjust the Checks whose objects changed. For example, 0.1's comparison with ClassicalArithmeticCompletion §5.1 no longer has a cited counterpart; compare with `exists_ideal_in_class_of_norm_le` instead.
- Add Checks for 0.4a only if 0.4a survives R01.

## R06 (P3) — Supplier verifications are carried but not named

**Location.**
- README.md:379–381: "The finite verifications under which ExplicitMultiplicativeFunctions §§2.3, 2.5 and 7.1 state the bounds … under the names given there".
- 6.2 (README.md:1996–1999) and the theorems of 6.3 that use it.
- The GGLM theorem of 3.6 (README.md:1421–1425): "the inputs of ExplicitPrimeCounting §2.2".

**Claim.** The new *Computational hypotheses* section promises that every theorem takes each finite verification it rests on as a named hypothesis. These hypotheses are left unnamed in that section and in the statements that carry them.

**Witness.**
- ExplicitMultiplicativeFunctions at #1946 names *MoebiusRangeVerified*, *MoebiusDivRangeVerified*, *SquarefreeRangeVerified* and *SquarefreeReciprocalRangeVerified*, with their instances (its README lines 794–915).
- ExplicitPrimeCounting at #1945 §2.2 (line 1586) and §4.7 (lines 3248–3249) name `LeeNosalRange`, `ZetaZeroReciprocalSum`, `ZetaZeroCountLowRange` and *PsiThetaUpper*.

**Repair.**
- List each predicate, with the instance its owner uses, under "Imported, as their owners state them", with its section.
- Name them in the hypotheses of 6.2 and of Theorem 3, Theorems 1–2 and Corollaries 1–2 of 6.3 and McGown–Sorenson's bounds, and in the GGLM theorem of 3.6.

## R07 (P3) — Two computational hypotheses are not stated

**Location.**
- README.md:282–284, *AmbergerMajorantCertificate*: "the auxiliary function of `amberger2026` Lemma 3 … satisfies the sign conditions of that lemma at the parameters chosen for its Theorem 1".
- README.md:292–294, *DGLSWPolynomialCertificates*: "each nonnegative even trigonometric polynomial of the proofs of Theorems 1.1–1.5 … (`dglsw2025` §§2–5)".

**Claim.** Neither entry says which function or polynomials it means, at which parameters, or which inequality it asserts. The hypotheses of 4.2 (Amberger) and of 4.8, 4.10 and 7.3 are therefore not determined by the README.

**Witness.** `dglsw2025` (arXiv v1, read here) gives its polynomials by degree, `n ∈ {8, 16, 40, 46}`, in §3.3 and Table 2 (line 832), with coefficients in Tables 12–13 (lines 1465 and 1494). The README cites only "§§2–5".

**Repair.**
- For DGLSW, state the predicate as *IsAdmissibleCosinePolynomial* `n a` for each polynomial of §3.3 and Tables 12–13, by table and degree.
- For Amberger, write out the majorant and the inequalities of Lemma 3 at the parameter values of the proof of Theorem 1. If `amberger2026` does not print them, place Amberger's count in ExplicitNumberFields, Part II (Scope).

## R08 (P3) — Two statements are narrower than their sources

**Location.**
- (a) README.md:2027–2028, McGown–Trudgian's main criterion: "integers `r, h ≥ 2`".
- (b) README.md:1747–1752: Kadiri–Ng–Wong's real-zero repulsion, under "a real zero `β₁` of `ζ_K` with `β₁ ≥ 1 − 1/(12.74 log d_K)`".

**Witness.**
- (a) `mcgowntrudgian2020` line 423 has `r, h ∈ ℤ⁺` with `h ≥ 2`. `mcgownsorenson2024` line 184 runs the criterion with `r` from 1 to 10, so *McGownSorensonGapChecks*(i) ("some admissible `e`, `r`, `h`") records less than the computation used.
- (b) `kadiringwong2019` lines 65–72 state Theorem 1.3 for any real zero `β₁`.

**Repair.**
- (a) Write "integers `r ≥ 1`, `h ≥ 2`". The moment constant `W(p, h, r)` comes from ExplicitCharacterSumsAndSieves §4.1, stated for `r, h ≥ 1` (README.md:637).
- (b) State Theorem 1.3 for every real zero `β₁`, and keep the exceptional-zero hypothesis on Theorem 1.2 only.

## R09 (P3) — Three locators

**Location.**
- (a) `mossinghofftrudgian2015`, at README.md:290 and 2447–2449.
- (b) *LeeNosalMertensRange*, at README.md:351–354, cited as "(ExplicitPrimeCounting)".
- (c) *SmallPrimitiveRootsModPSquare*, at README.md:337–339, cited as "`kerrmcgowntrudgian2020` lines 278–297".

**Witness.**
- (a) The roadmap's `sources.toml` has no entry under this key. `lee2021zerofree` lines 123–124 only name Mossinghoff–Trudgian's degree-16 polynomial; they do not print its coefficients.
- (b) The predicate is in ExplicitPrimeCounting §1.3 (its README line 1147).
- (c) Lines 278–297 of the source treat `p ≥ 10¹²`. The small cases are lines 82–84: Paszkiewicz's computation and "a trivial calculation on the two exceptional primes".

**Repair.**
- (a) Record `mossinghofftrudgian2015` (arXiv:1410.3926, Table 5) in the manifest.
- (b) Write "ExplicitPrimeCounting §1.3".
- (c) Write "lines 82–84".

## Verified sound

**Gate, build and dependency check.**
- I reran the gate (`gate … ExplicitNumberFields --base origin/main`). Every check is 0 except `statement-hygiene=4` (R04), so the result is FAIL. The worker's gate reports the same failure and build OK.
- Dependency check: `depcheck: 240 roadmaps, 2439 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. ExplicitNumberFields is line 274 of the order. Its earlier suppliers are at:
  - LFunctions 28, CyclotomicClassGroupsAndStickelberger 34, ZerosOfLFunctions 85, AnalyticNumberTheoryPartI 90;
  - ComputationalNumberTheory 193, ExplicitZetaBounds 270, ExplicitPrimeCounting 271, ExplicitCharacterSumsAndSieves 272, ExplicitMultiplicativeFunctions 273.

  ClassFieldTheory, ClassicalArithmeticCompletion, ImaginaryQuadraticClassNumber and SuccessiveMinima are on main, and Completed/GlobalNumberFields, Chebotarev, EffectiveBounds and ArithmeticDirichletSeries are under `Completed/`.
- `lake env lean …/Suggested.lean` gives 17 warnings, all `declaration uses 'sorry'`, at lines 97, 106, 120, 134, 149, 189, 201, 213, 228, 249, 266, 278, 288, 302, 318, 339 and 353, and nothing else.
- `#check @name` for all 22 declarations elaborates and matches `signatures.md`. No section binder is lost: every declaration carries its own binders, and the file has no `variable` block.
- One-tactic probe: each of the 17 theorems was tried with `simp; done`, `rfl`, `norm_num; done`, `trivial`, `infer_instance` and `decide`. None closes, so there is no padding.
- R04's repair, a named instance in place of `letI`, elaborates cleanly.
- Nothing outside the folder changed.

**Library declarations opened at the pins.**
- Mathlib:
  - `IsCyclotomicExtension.Rat.intermediateFieldEquivSubgroupChar` (`Mathlib/NumberTheory/NumberField/Cyclotomic/Galois.lean:188`), with `mem_…_iff` at :204: `χ ∈ Y(F)` iff `χ` is trivial on `galEquivZMod` of the fixing subgroup, as 0.4a says. `card_…` is at :195.
  - `DirichletCharacter.conductor_ne_zero` (`…/DirichletCharacter/Basic.lean:254`).
- Tau Ceti:
  - `DirichletCharacter.generalizedBernoulli` (`…/DirichletCharacter/GeneralizedBernoulli.lean:81`): `N^{n−1} Σ χ(a) B_n(a/N)` with `a` running over `1..N`, so `B_{1,χ} = f⁻¹ Σ a χ(a)` for `χ ≠ 1` (:161).
  - `gaussSum_mul_gaussSum_inv_eq_neg_one_mul_card_of_isPrimitive` (`…/GaussSum.lean:93`): `τ(χ)τ(χ⁻¹) = χ(−1)·N`.
  - `eventuallyEq_of_meromorphic_of_eqOn_halfPlane` (`TauCeti/Analysis/Meromorphic/Continuation.lean:40`).
  - `conreyGenerator` (`Conrey.lean:78`), `mertensConstant` (`Mertens.lean:545`), `frobeniusPsi` and `frobeniusPrimeCount` (`VonMangoldt.lean:165`, `:177`), `frobeniusPrimeSet` (`FrobeniusPrimeSet.lean:93`), `abelianConductor` (`AdmissibleModulus/Basic.lean:193`), `isBigO_card_idealsLE_sub` (`NumberField/DedekindZeta.lean:109`), `truncatedPerron_LSeries` (`Perron/Formula.lean`).

**Cross-roadmap citations resolved (main or open head).**
- ClassFieldTheory on main: Layer 4 `artinMap_groundNorm`, Layer 11 (towers, `globalArtinMap_ideal`) and Layer 13 (`hilbertClassField`, `gal_hilbertClassField_equiv_classGroup`, `kroneckerWeber`, conductor–discriminant).
- ClassicalArithmeticCompletion §1.5 (the Legendre character is primitive) and ImaginaryQuadraticClassNumber H2.2.
- ZerosOfLFunctions on main: 3.1, 4.1–4.3, 5.5–5.6, 6.1–6.5, 7.1–7.5 and 8.5, and Layer 9 (*AllOnCriticalLine*, *GRH*).
- LFunctions on main: `dedekindZetaC`, `completedDedekindZeta`, `dedekindZetaData`, `dedekindZetaC_quadratic`, `dedekindZetaC_cyclotomic`, `PrimitiveRayClassCharacter`, `heckeLFunctionC` and `tendsto_prod_one_sub_inv_absNorm_div_log`.
- ExplicitZetaBounds §§0.5 (*IsAdmissibleCosinePolynomial*, matching `dglsw2025`'s class `P_n` at line 202), 2.1, 2.5, 3.2, 5.1, 6.1a, 7.9 and 9.1.
- ExplicitPrimeCounting §§1.3 (*ButheVerified*, *Schoenfeld1976Range*, *LeeNosalMertensRange*), 1.7, 2.2 (Schoenfeld's clause needs only `RiemannHypothesis`, *ButheVerified* and *Schoenfeld1976Range*), 4.7 and 6.5.
- ExplicitCharacterSumsAndSieves §§3.5, 4.1 and 6.1. *LapkovaSmallModuliVerified* matches; the `A(q₀)` correction is recorded there too, at its line 945.
- ExplicitMultiplicativeFunctions §§2.3, 2.5, 7.1, 7.5, 7.9, 8.1, 9.1 and 9.4, with the predicate names used here.
- Gaps: the five gap slugs in the README are all in `plan.json`. The plan's other 13 gaps are now cited as supplied sections, and each of those sections exists at its head.
- Ownership: for the least primitive root, Grosswald's conjecture and the relative class number, `roadmaps grep` finds owners only in this roadmap, in CyclotomicClassGroupsAndStickelberger (R01) and, as routes, in AnalyticNumberTheoryPartI §2.42.

**Sample sources read at their locators.**

| Target | Source and lines | Agreement |
|---|---|---|
| 0.2 | `louboutin2005` 50–51 | `Π_K(2)/2ⁿ ≤ 1`, equal to `1/(2ⁿ − 1)` when 2 is inert. The README's "iff" holds both ways: inert gives `2ⁿ/(2ⁿ−1)`, and any other splitting gives a strictly larger `Π_K(2)` (totally ramified gives `2`) |
| 2.2 | `sunley1973` 110–112 | Theorem 1.1(1): strict count, `n ≥ 2`, exponent `(n−1)/(n+1)`. `lee2023ideals` 39–58 |
| 3.4 | `louboutin2003` 65–86 and 106–136 | Theorem 1(1), (2), (4), Table 1, the split formula and `A_K = √d_K/(2π)ⁿ`, all as stated |
| 4.3 | `louboutin2017` 25–26; `louboutin2015ijnt` 27–28, 48–59, 84–91 | Statements as given. The repair of Corollary 4, which excludes only odd multiplicity, is justified by lines 56–59 |
| 4.4 | `louboutin2017` 31–53 | `c₁`, `d₁`, `S₀`, `λ`, `c₂ = 0.62075`, `d₂ = 0.50009`, `(0.59110, 1/4)`, and `(0.10379, 1)` for `d_K > 8` |
| 4.10 | `dglsw2025` 115–122 and 142–149, read from arXiv v1 | Theorems 1.3 and 1.5: the tables of `A_ν` and `A''_ν` agree digit for digit |
| 4.10 | `kadiringwong2019` 51–81, read from arXiv v1 | Theorems 1.2–1.3 and Corollary 1.3.1, with `14.144`, `7.071998`, `7.072` |
| 4.10 | `kadiring2012` 151–165, read from arXiv v1 | Theorem 4: the README's min-form is equivalent, because the maximal `β'` has the least `λ'` |
| 4.8, 2.6 | `dglsw2025` 106–109, 134–137, 276–281 and 836–843 | Theorems 1.2 and 1.4, Table 1 (*MinimalDiscriminantTable*, all 20 entries), and (4.18) (*DGLSWSmallFieldGRH*) |
| 5.1 | `louboutin2005` 38–39 | The formula is lost in the extraction; checked by derivation in the table below |
| 5.2 | `louboutin2005` 42–43 | `κ = (5 − 2 log 6)/2 = 0.70824`, which is `5/2 − log 6` |
| 5.7 | `banks2026brauersiegel` 161–168 and 503–561, read from arXiv v2 | Theorem 1.3(ii) at `k = ℚ` matches the statement; the route does not (R03) |
| 6.3 | `mcgowntrudgian2020` 59–93, 296–353, 415–430, 615–647 | Theorems 1–3, Corollaries 1–2, (8) and the Möbius checks |
| 6.4 | `mcgowntrevinotrudgian2016` 36–100 | Theorems 1–2 and Lemma 1, with `c(p, x)` |
| 6.5 | `kerrmcgowntrudgian2020` 25–84, 115–192, 270–297 | Theorems 1–3, Lemmas 3, 6 and 7 |
| 6.5 | `mcgownsorenson2024` 84–107 and 155–252, read from arXiv v2 | Theorems 1–4; Chen's (2.5) at lines 228–233; `α = 0.661`; `10²³³`; `ω ≤ 105` |
| 7.1 | `garcialee2022mertens` 89–128 | Theorem 1: (A1)–(C2), (Λ), (Υ), (M1) and (M2), as stated; 3.3 and 4.7 at lines 1214–1305 |
| 4.6 | `lee2021zerofree` 103–109 | Theorems 1–2 |

**Adversarial table (values computed this round unless marked r3).**

| Statement | Instances | Values computed (left vs right) | Result |
|---|---|---|---|
| `abelianCharacter_gauss_product` (R01) | `ℚ(i)`; `ℚ(√−3)`; `ℚ(√5)`; `ℚ(ζ₅)`; `F = ⊥` | `2i` vs `i·2`; `1.7320i` vs `i√3`; `2.2361` vs `√5`; `√5·(−5) = −11.1803` vs `i²√125 = −11.1803`; `1` vs `1` | true, but duplicated |
| `relativeClassNumber_character_product` (R01) | `ℚ(i)`, `ℚ(√−3)`, `ℚ(√−5)`, `ℚ(ζ₈)` | `B₁`: `−1/2`, `−1/3`, `−2`, and `(−1/2, −1)` for `ℚ(ζ₈)`. `Q·w·∏(−B/2)`: `4·¼ = 1`, `6·⅙ = 1`, `2·1 = 2`, `8·¼·½ = 1`, each equal to `h⁻` | true, but duplicated |
| `dedekindZeta_residue_eq_prod_LFunction_one` and the value at 1 | `ℚ(i)`; `ℚ`; `m = 2` | `κ = π/4 = 0.785398 = L(1, χ₄)`, and `(πi·2i/4)(−½) = 0.785398`; empty product `1 = κ_ℚ`; the trivial character modulo 2 becomes primitive modulo 1, giving `ζ`, not `ζ(1 − 2^{−s})` | true, but duplicated |
| `letI` repair (R04) | scratch copy | 17 `sorry` warnings, 0 errors | repair works |
| 5.7 (R03) | Banks's proof at `k = ℚ` | `C = c₂ min(¼, c(ℚ), η_ℚ)` with `η_ℚ = 1`, from Corollary 1.2, Stark's Lemma 3 and Stark's Lemma 4. Theorems 1.4–1.5 are not used (lines 538–561) | route wrong |
| 2.2 | `n = 2` constant | `e^{61.4}·3^{7.5} = 1.75425·10³⁰`, equal to `lee2023ideals` Table 1 | sound |
| 2.3 | `A_L(2)` | `2.49133·10¹⁰` from the README's formula, equal to Lee's Table 1 | sound |
| 3.4 thresholds | `2m = 2…12, ∞` | `max(ϱ, ϱ_∅) = 2600, 50, 26, 22, 21, 2π²`, as 5.6 uses. `32π²Λ_{{2}} = 2682.2`. `ϱ_2(1) = 36000 ≠ 270·8.4926 = 2293` (not a product form) | sound |
| 4.4 | `P(S) = S⁴+2S³−2S²−4S+2` | `P(0) = 2`, `P(1) = −1`, `P(√2) = 2`. `D₁ = 0.27645`, `C₁ = 0.343146`, `C₂ = 0.620756`, `D₂ = 0.50010` | sound |
| 4.3 | Corollary 4 at `m = 2` | `max(2(√3−1), c₂) = max(1.4641, 1.0718)`; `log 23 = 3.14 > 1.4641` | sound |
| 4.10 | *DGLSWSmallFieldGRH* fields | `ν/log d ≤ 0.5/log 3 = 0.455`, so `β₁ ≥ 0.545 > ½`, which the hypothesis excludes | sound |
| *GarciaLeeMertensSmallRange* | grid `x ∈ [1.048, 13.5)`, step `10⁻⁴` | least margin `0.00103` at `x = 7.0001` (`0.24896` vs `0.24998`); at `x = 1.048`, `2.7988` vs `4.713` | true |
| *GGLMPsiSmallRange* | grid `x ∈ [e, 73.2)` | least margin `0.0425` at `x ≈ 3` (`0.1710` vs `0.2136`) | true |
| *McGownTrudgianMoebiusChecks* | `S` on `[1, 38)`, `T` on `[2, 1000)`, exact `φ` | least margins `0.363` and `0.602` (at `X = 2`) | true |
| *RamareSmallRangeCheck* | `ℚ(i)` at `X = 1, 2, 5`; `ℚ(√−3)` at `X = 1, 4` | `0.215 ≤ 1.4`; `0.429 ≤ 1.76`; `1.07 ≤ 2.39`; `0.395 ≤ 1.94`; `0.582 ≤ 3.08` | true |
| *MinimalDiscriminantTable* | `n = 2…20, ≥ 21` | 20 entries, each equal to `dglsw2025` Table 1 | sound |
| 6.3, Corollary 1 range | `p < 10¹⁰⁰⁰` | first primorial above `10¹⁰⁰⁰` is at `k = 351` (`q₃₅₁ = 2371`), so `ω ≤ 350`, as the README says, not the source's `200` | sound |
| 6.3, `ω = 17` | `s = 12…15` | `2.811·10¹²`, `4.572·10¹¹`, `1.462·10¹¹`, `4.051·10¹¹`; all exceed `10¹¹`, so the window predicate is needed | sound |
| 6.5, McGown–Sorenson above `10²³³` | primorial `ω`; Robin with integer `ω` | `ω ≤ 104` at `10²³³` and `≤ 105` to `10²³⁴` (`k = 105, 106`); least factor on `[10²³³, 10²⁷⁵]` is `937 > 900` (at `10^{233.42}`, `ω = 105`); from `10²⁷⁴` with `ω = ⌊1.3841 log p/log log p⌋` the least factor is `2.0176 > 2` | sound (tight) |
| 6.5, `A(q₀)` | `q₀ = 10¹²`, `10²³³` | `0.188846 ≤ 0.1889`; `A(10²³³) ≤ 0.1607`; the source's misprinted form gives `0.15916 ≤ 0.16` | sound |
| 6.5, KMT Theorem 2 | `X < p` | Lemma 6 needs `T ⊆ [1, p)` (line 139); the application uses `X = p^{0.99}` | sound |
| 5.1 | residue to `hR` | `2^{r₁}(2π)^{r₂} = 2ⁿ(π/2)^{r₂}` gives `(w/2)(2/π)^{r₂}(e log d/(4n−4))^{n−1}√d`; the zero-dependent and `Π_K(2)` forms follow the same way | sound |
| 5.2 | AM–GM over `n − 1` characters | average `c_χ ≤ 5/2 − log 6`, giving `(log d/(4n−4) + (5 − 2 log 6)/4)^{n−1}` | sound |
| 5.6, uniform-gap lemma | `c₀ = 1/100`, `d_F = 3` | `c₀/log 3 = 0.0091 < 1`; the interval lies in `(0, 1)`; contradiction with `(1 − β) log d_F ≥ c₀` | sound |
| 7.1 (C) form | `t eᵗ` increasing | `|C| ≤ |E|e^{|E|}` with `|E| ≤ n/(x−1) + 2Υ/log x = Θ` | sound |
| `classNumber_le_bordelles` | `ℚ(√−14)`; `ℚ` | `2·√56·log 56 = 60.24 ≥ 4`; `1 ≥ 1` | sound |
| `dedekindZeta_residue_ge_friedman` | `ℚ(i)` | `0.7854 ≥ 0.36232/2 = 0.1812` | sound |
| `dedekindZeta_residue_gt_stark` | `ℚ(ζ₇)⁺` | `c₄ = 43.1621`; `1/(43.1621·4·log 49) = 0.001488 < κ = 0.30026` (r3) | sound |
| `relativeClassNumber_le` | `ℚ(i)` | `2·1·4·2·(e log 4/(4π)) = 4.798 ≥ 1` | sound |
| `leastPrimePrimitiveRoot_le_grh` | `p = 10⁹ + 7` | `((8/5)·3·log p)² = 9894.6`, against `√p − 2 = 31620.8` (r3) | sound |
| `idealCount_sunley` | `ℚ(i)`, `x = 10` | count `9` vs `7.854`, difference `1.146 ≤ 1.15·10³¹` | sound |
| `primeIdeal_mertens_garciaLee` | `ℚ(i)`, `x = 10` | product `0.5·0.64·0.8889 = 0.28444`; `e^γκ log x·∏ = 0.9161` | sound |
| `leastPrimeIdeal_ahnKwon` | `ℚ(i)/ℚ` | least primes `5` (split) and `3` (inert), both below `4^{12577}` | sound |
| `frobeniusPrimeCount_le_debaene` | `L = ℚ`, `x = 10⁶` | `78498 ≤ 7.088·10⁵` (r3) | sound |
| `GRHMod`, `HasNormalTower`, `starkAlpha`, `idealCount_debaene`, `classIdealCount_debaene`, `rayClassIdealCount_gunRamareSivaraman` | unchanged since r3 | r3 rows stand: `q = 1, 2, 4`; `ℚ(2^{1/4})`, `x⁴ − x − 1`; cubic of discriminant `−23` with `log⁺`; `ℚ` with `𝔮 = (1)`, bound `3729.9` | sound |

## Not verifiable

- `washington1997` Theorem 4.10 (0.4) and `louboutin2001` Theorem 1 (5.1) are recorded as uncertified, and their texts are not in the cache. 5.1 was checked by derivation from AnalyticNumberTheoryPartI §2.15.
- `ramare2025` (2.7) is uncertified and not in the cache. The 2.7 statements were checked only for internal consistency: `ζ_K(0) = B_{1,χ}/2 = −h/w`, `−1/4` for `ℚ(i)`, and *RamareSmallRangeCheck* at small `X`.
- `chen2022` (6.5) is uncertified; its criterion (2.5) was read through `mcgownsorenson2024` lines 228–233.
- `amberger2026` (R07) and Stark 1974 Lemma 4 (R03) are not in the cache. Stark's lemma was read as quoted in `banks2026brauersiegel`.
- Stark's lemma, `palojarvisimonic2026`, `gglm2026`, `guo2026`, `banks2026siegel`, `fehnker2026`, `friedman1989` and `rademacher1959` lie outside the sample, and I did not reopen them.
- Ownership against open pull requests was checked by object, with `roadmaps grep`, only for the objects of R01 and Layer 6, and against the five closest open roadmaps in `overlaps.md`. It was not checked against every open head.

## Source issues

- **Error** in louboutin2017 at Theorem 2, p. 109: the source says `S₀` is the only root of `S⁴ + 2S³ − 2S² − 4S + 2` in `[0, √2]`; it should be `[0, 1]`, since a second root `1.2213` lies in `(1, √2)`; affects nothing.
- **Gap** in louboutin2015ijnt at Corollary 4, p. 2: the source says `ζ_K` has no real zero in `σ ≥ σ₂`, but the proof excludes only zeros of odd multiplicity; it should say only that, and that `ζ_K(σ₂) ≤ 0`; affects a stated result.
- **Misprint** in louboutin2015ijnt at proof of Corollary 4, p. 2: the source evaluates `ζ_K` at `1 − 2/log d_K`; it should be `1 − c₂/log d_K`, the abscissa of the statement; affects nothing.
- **Error** in mcgowntrudgian2020 at proof of Corollary 1, p. 11: the source says `p ≤ 10¹⁰⁰⁰` forces `ω ≤ 200`, and that `s = ω − 3` makes (9) hold below `10¹¹` up to `ω = 17`; it should be `ω ≤ 350`, and `ω = 17` fails (least left side `1.462·10¹¹`); affects the proof.
- **Error** in kerrmcgowntrudgian2020 at Lemma 3, p. 3: the source prints the middle term of `A(q₀)` as `0.8204/√q₀`; it should be `0.8204/log q₀`, from Lapkova's Lemma 3A, so `A(10¹²) = 0.1888`, not `≤ 0.16`; affects the proof.
- **Gap** in kerrmcgowntrudgian2020 at Theorem 2, p. 2: the source states the bound for every `X`; it should assume `X < p`, since Lemma 6 needs the set inside `[1, p)`; affects nothing.
- **Misprint** in kerrmcgowntrudgian2020 at proof of Theorem 1, pp. 6–7: the source says `ω ≤ 13` and then chooses `s = 8` for `ω = 14`; the `ω = 14` case is vacuous and should be omitted; affects nothing.
- **Error** in mcgownsorenson2024 at Theorems 2 and 4, p. 2: the source states them for all primes; it should say odd primes, since `g(2) = 1 ≠ h(2) = 3` and `h(2) = 3 > 2^{2/3}`; affects nothing.
