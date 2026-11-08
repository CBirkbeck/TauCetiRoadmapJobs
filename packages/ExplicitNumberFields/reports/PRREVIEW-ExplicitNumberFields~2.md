# Review of ExplicitNumberFields (pull request #1944 at a910d7a)

**Verdict:** needs changes

Scope: `TauCetiRoadmap/ExplicitNumberFields/README.md` and `TauCetiRoadmap/ExplicitNumberFields/Suggested.lean` at `a910d7a`. This is a full review of the repaired head. There are six findings: three P2 and three P3. All twelve findings of the previous review are repaired in the README. Two of the new P2 findings come from supplier heads that changed after the last round. ExplicitCharacterSumsAndSieves now corrects a constant this README copies from its source. ExplicitZetaBounds and two other suppliers now state results this README still declares as gaps.

## Status of the previous review's findings

| Previous | Status | Where (this head) |
|---|---|---|
| R01 Bordellès route | repaired | 0.3 (lines 697–704) states the Nicolas–Tenenbaum bound with an induction route. 5.3 (lines 2226–2234) follows the source: "`h_K ≤ Σ_{m ≤ b_K} τ_n(m) ≤ Σ_{m ≤ √d_K} τ_n(m)` … `n − 1 ≤ (a/2) log d_K`". Checked against `bordelles2002` lines 85–91 and 345–359. |
| R02 `ĝ` finite range | repaired | *GrosswaldPrimeFiniteRange* (lines 2673–2675) is carried by the theorem (line 2694). |
| R03 finite verifications of §§9.1, 9.4 | repaired | *PrimorialTableVerified* `26` at lines 2608–2610, 2636, 2694–2695, 2753 and 2782. *PrimorialTotientTableVerified* `24284` at lines 2753 and 2783. |
| R04 five gaps already supplied | repaired in the README | Lines 516–586 are ordinary contracts. 3.6 (lines 1542–1543, 1551, 1566) and 7.2 (lines 2894–2895) carry *ButheVerified* and *Schoenfeld1976Range*. The plan's `gaps` list still has the five slugs; the plan is frozen after the design, so this is for the board. |
| R05 Das–Gaba–Lee–Savalia–Wong small fields | repaired | *DGLSWSmallFieldGRH* (lines 1985–1990) is carried at lines 2001–2002, 2104 and 2936. |
| R06 Debaene's Brun–Titchmarsh | repaired | `frobeniusPrimeCount_le_debaene` (`Suggested.lean:284`) is stated. `abelianConductor` is cited (lines 333–338). The reason for not stating Kadiri–Ng–Wong's bound is now correct (`Suggested.lean:62–66`). |
| R07 Chen's `A(p)` | repaired | `A` is now a hypothesis: "a real `A` with `|Σ_{m ≤ M} χ(m)| ≤ A √p log p`" (lines 2771–2773). |
| R08 6.2 *Needs* | repaired | Lines 2561–2563 name ExplicitMultiplicativeFunctions §§2.3, 2.5 and 7.1. |
| R09 numerical slips | repaired | Lines 2264 (`1.699`), 2263 (`9376.9`), 1387–1388 (`0.96242`, `0.33984`), 1620 (`3868.5`), 1339 and 1648 (`(0.64020, 1)`), 1265 (`115.67`), 2548–2549 (`(q, t)` order). |
| R10 7.4 *Needs* | repaired | Line 3002: "4.2 (Hasanalizade–Shen–Wong's counts), 4.5–4.7, 4.10 (Kadiri–Ng–Wong's repulsion)". |
| R11 docstring 5.7 | repaired | `Suggested.lean:40–46` no longer lists 5.7 among the zeta statements. |
| R12 merge-order paragraph | repaired | The description's depends-on list and merge chain include ExplicitPrimeCounting and ExplicitMultiplicativeFunctions. |

## R01 (P2) — The Pólya–Vinogradov contract copies a misprinted constant, and 6.5 relies on `A = 0.16` at `q₀ = 10¹²`

**Location.** `README.md:508–511`: "`|Σ_{n ≤ M} χ(n)| ≤ A(q₀) √q log q` with `A(q₀) = 1/(2π) + 0.8204/√q₀ + 1.0285/(√q₀ log q₀)`". The value is used at `README.md:2756` and `2777` ("`A = 0.16` for every prime `p ≥ 10¹²`") and at `2786–2787`.

**Claim.** The contract takes `A(q₀)` from `kerrmcgowntrudgian2020` line 122. That value does not follow from Lapkova's odd bound `(1/(2π))√q log q + 0.8204√q + 1.0285`, which is the source the contract names. Dividing that bound by `√q log q` gives the middle term `0.8204/log q₀`. With it, `A(10¹²) = 0.18885`, so `A = 0.16` for `p ≥ 10¹²` is unproved. This value is used in Kerr–McGown–Trudgian's route, in the remark on Chen's criterion and in McGown–Sorenson's route. At `10²³³` the corrected value is `0.16068`, still above `0.16`. The gap also drops the finite verification under which the supplier states the bound.

**Witness.** ExplicitCharacterSumsAndSieves §3.5 (its README lines 1003–1010 and Checks lines 1029–1033) states `0.8204/log q₀` under its `LapkovaSmallModuliVerified`. It records that the printed form gives `0.16005` at `q₀ = 10⁶`, against the correct `0.21861`.

**Repair.**
- Drop `gap:polya-vinogradov-lapkova` and cite ExplicitCharacterSumsAndSieves §3.5 (initial sums with one constant) as an ordinary contract, with `A(q₀) = 1/(2π) + 0.8204/log q₀ + 1.0285/(√q₀ log q₀)` and `LapkovaSmallModuliVerified`.
- At lines 2756 and 2777, replace `A = 0.16` by `A(10¹²) = 0.1889`.
- At line 2786, use `A(10²³³) = 0.1607`.
- Carry `LapkovaSmallModuliVerified` in Kerr–McGown–Trudgian's bound and in McGown–Sorenson's bound modulo `p²`, as the Conventions require.

Tested with `A = 0.1889`: condition (3) of `kerrmcgowntrudgian2020` (line 286) still holds at `p = max(10¹², q₁⋯q_ω)` for every `ω ≤ 13` (`s = 0` for `ω ≤ 8`, `s = 7` above). The left side is at least `11.0` times `p^{0.7475}`, the worst case being `ω = 8`. Both conclusions, `h(p) < p^{0.99}` and `h(p) < p^{2/3}`, survive; only the constants of the route change.

## R02 (P2) — Seven declared gaps ask for what the supplier heads now state, and their "Required location"s no longer exist

**Location.** `README.md:452–497`: the "What ExplicitZetaBounds must provide" paragraphs, with "Required location: target 5", "target 4", "Layer 2, targets 8–9", "Layer 3, beside target 11", "target 14", "Layer 8, C10" and "target 18". Also `README.md:501–506` (`gap:burgess-moment-estimate`), `README.md:555–559` (`gap:rh-mertens-product`) and `README.md:871` ("ExplicitZetaBounds target 18").

**Claim.** At their heads the suppliers state these results under section numbers. ExplicitZetaBounds has no "target N" labels at all. A gap that is already supplied is an ordinary supplier contract, as the previous round settled for ExplicitMultiplicativeFunctions and ExplicitPrimeCounting.

**Witness.** ExplicitZetaBounds README lines 2315–2318 say this roadmap takes its 3.2, 5.1, Layer 2, 0.5, 7.9 and 9.1. ExplicitCharacterSumsAndSieves README lines 1775–1777 name its §4.1 for this roadmap.

What each head supplies (checked against the gap's `needs`):

| Gap | Supplied at the head by | Note |
|---|---|---|
| `rademacher-general-convexity` | ExplicitZetaBounds §3.2 | Records of finite-order type. Its majorant `Σ|a_m|m^{−σ} ≤ ζ(σ)^n` follows from `|a(k)| ≤ τ_m(k)` and still excludes `10ζ` (`10ζ(σ) > ζ(σ)`). At `s = 1/2`, `η = 1/2` it gives `11.488`, as in 1.1's Check. |
| `complex-stirling-constants` | ExplicitZetaBounds §§2.1, 2.5 | §2.1 gives `|ξ(z)| ≤ 1/(12 sin²(δ/2)|z|)` on `|arg z| ≤ π − δ`; §2.5 gives the two-sided bound for `|Γ(s)|` with `σ > 0`, `t ≠ 0`. |
| `backlund-argument-lemma` | ExplicitZetaBounds §5.1 | Normalised by `Re f(c) ≠ 0`. The gap's form follows after multiplying `f` by a unimodular constant and reflecting the segment. |
| `ramare-L1-bounds` | ExplicitZetaBounds §9.1 | The same constants (`5/2 − log 6 = 0.708241`). |
| `uniform-landau-siegel-gap` | Banks's clause: ExplicitZetaBounds §7.9 (*HasLandauSiegelGap* `(3.0·10⁻³) ∞`). The `6.035/√q` gap of "target 18": ExplicitZetaBounds §7.7. | Guo's `1/100` is in neither and stays a gap. |
| `burgess-moment-estimate` | ExplicitCharacterSumsAndSieves §4.1 | The same statement, with the `r = 2` refinements; `(2r − 1)!! = (2r)!/(2^r r!)`. |
| `rh-mertens-product` | ExplicitMultiplicativeFunctions §8.1 | For `x ≥ 24.4`, `e^{−ε_RH(x)} < e^γ log x ∏(1 − 1/p)`, which implies the gap's `1 − ε` form. 3.6 needs it only at `x ≥ 5·10⁵`. |

**Repair.**
- Rewrite the seven items above as ordinary contracts citing those sections. Cite ExplicitZetaBounds §7.7 in the Check at line 871 and in the gap text at line 497.
- Update Scope (lines 113–118 and 176) and the other lines that name these slugs: 1013, 1015, 1024, 1086, 1125, 1315, 1530, 1562, 1576, 1642–1643, 1657–1658, 1694–1695, 1745, 2048, 2089, 2146–2147, 2206, 2321, 2444, 2484, 2597, 2666, 2827, 3151 and 3188.
- Keep as gaps only `iterated-perron`, Guo's clause, the three polynomial certificates, `explicit-mertens-second`, `bach-grh-smoothed-sum` and `artin-norm-compatibility`. Give their Required locations in the suppliers' current numbering:
  - ExplicitZetaBounds Layer 6, beside §6.2, for the iterated Perron identity;
  - §0.5 for the certificates, which now defines *IsAdmissibleCosinePolynomial* (or state the three instances here as hypotheses of that form);
  - §7.9 for Guo's clause.

## R03 (P2) — *GrosswaldSieveVerification* is not a proposition, so Grosswald's theorem under GRH has an undefined hypothesis

**Location.** `README.md:2675–2678`: "*GrosswaldSieveVerification* as the predicate: the outcome of the case analysis of `mcgowntrevinotrudgian2016` lines 211–255 for `ω(p − 1) ∈ {12, 13, 14}`".

**Claim.** "The outcome of a case analysis" asserts nothing a statement can be checked against. The theorem at lines 2693–2696 takes it as a hypothesis, and the docstring of `Suggested.lean` gives it as a reason not to state that theorem.

**Witness.** `mcgowntrevinotrudgian2016` lines 186–210 and 236–255 leave possible exceptions only for `2.5·10¹⁵ < p < 10⁴³` with `ω(p − 1) ∈ {12, 13, 14}`. Algorithm 1 lists 68,030 primes, and `ĝ(p) < √p − 2` is checked directly at each.

**Repair.** Define it as a GRH-free proposition: for every prime `p` with `2.5·10¹⁵ < p < 10⁴³` and `ω(p − 1) ∈ {12, 13, 14}`, either `ĝ(p) < √p − 2`, or some even divisor `e` of `p − 1` with `δ > 0` (as in 6.3) satisfies `(2c(p, √p − 2)(2 + (s − 1)/δ) 2^{ω(p−1)−s} log p)² < √p − 2`.

Under `GRHMod p`, Theorem 3 at `x = √p − 2` turns the second alternative into `ĝ(p) < √p − 2`: if `ĝ(p) > x`, the bound would give `ĝ(p) < x`. This is how the route at line 2700 uses it. At `n = 14` the source's window `(1.30·10¹⁶, 1.71·10¹⁶)` leaves no exception (its Table 2), so the proposition holds there through the second alternative.

## R04 (P3) — In 3.4's route the split formula has the wrong sign

**Location.** `README.md:1419`: "the split formula `F_K(s) = λ(1/s + 1/(1−s)) + ∫_1^∞ S_K(x)(x^s + x^{1−s}) dx/x`".

**Claim.** `λ(1/s + 1/(1−s)) = λ/(s(1 − s))`, which is the negative of the source's polar term. With this sign the step "`ζ_K(β) ≤ 0` gives a lower bound for `λ`" fails. At `β ∈ (0, 1)` both terms on the right would be positive, so `F_K(β) ≤ 0` could never hold.

**Witness.** `louboutin2003` lines 126–134 give `F_K(s) = λ_K/(s(s − 1)) + ∫_1^∞ S_K(x)(x^s + x^{1−s}) dx/x`. At `s = 1/2` the source's polar term is `−4λ` and the README's is `+4λ`.

**Repair.** Write `λ/(s(s − 1))` (equivalently `λ(1/(s − 1) − 1/s)`), as 3.1 does at line 1328.

## R05 (P3) — Three numerical and labelling slips

- `README.md:771`, `ℚ(ζ₈)`: "a formula with `R_K/R_{K⁺} = 2ⁿ/Q` (the wrong power) would give `2`". Solving `L(1, η) = κ_K/κ_{K⁺}` with that ratio gives `h⁻ = Q w √D L(1, η)/(2(2π)ⁿ) = 8 · 5.6569 · 0.87236/(2 · 39.478) = 0.500`. Repair: "would give `1/2`".
- `README.md:2792`: Robin's bound at `10²³³` allows `ω(p − 1) ≤ 1.3841 · 536.50/6.2851 = 118.15`, not `118.6`. Repair: `118.1`.
- `README.md:2246` and `2278–2279`: the Checks call the `bordelles2006` form (the fifth bullet: `n ≥ 3`, `b ≥ 13`) "the fourth form". The route at lines 2224–2226 uses "fourth" for the general-`a` form. Repair: "fifth form" in both places.

## R06 (P3) — The docstring misdescribes the predicates of 6.3–6.5

**Location.** `Suggested.lean:53–56`: "or are case analyses of the source's sieve with no statement on the pinned carriers (*McGownTrudgianOmegaChecks*, *McGownSorensonGapChecks*, *GrosswaldSieveVerification*); they lack a statement of that input other than the conclusion."

**Claim.** README 6.3 states *McGownTrudgianOmegaChecks* as an explicit inequality between reals built from the primes `q_i`, and *McGownSorensonGapChecks* as a disjunction of explicit conditions. Only *GrosswaldSieveVerification* lacks a statement (R03). What actually prevents stating these headlines is the length of the encodings they need: `W(p, h, r)`, Bach's `c(p, x)`, `δ_{ω,s}`, and the supplier predicate *PrimorialTableVerified*.

**Witness.** `README.md:2572–2573`: "for every integer `ω` with `9 ≤ ω ≤ 350` and `ω ≠ 17` there is an integer `0 ≤ s < ω` with `δ_{ω,s} > 0` and `13 ((2 + (s − 1)/δ_{ω,s}) 2^{ω−s})⁴ < max(10^{11}, (q₁ ⋯ q_ω)^{1/2})`".

**Repair.** Reword the bullet to give that reason: the conditional headlines would need long ad hoc encodings of the sieve criteria and of ExplicitMultiplicativeFunctions' *PrimorialTableVerified* `26`. After R03, check again whether Grosswald's theorem under `GRHMod p` can be stated.

## Verified sound

**Gate and build.**
- The worker's gate passes every check.
- `lake env lean Suggested.lean` gives 13 `sorry` warnings and nothing else (9 s).
- `#check @name` on the five definitions and `signatures.md` for all 18 declarations: no binder is lost. The natural-number expressions are safe:
  - `n − 1` in `classNumber_le_bordelles` (with `finrank ≥ 1`);
  - `2 ^ card − 1 ≥ 1` in `leastPrimePrimitiveRoot_le_grh`;
  - `(n − 1)^2` in `frobeniusPrimeCount_le_debaene`.
- One-tactic probe on a scratch copy (`rfl`, `simp`, `infer_instance`, `norm_num`, `positivity`, `omega`): all 13 theorems resist, so there is no padding and nothing vacuous. The five definitions have real bodies and each serves a headline.

**Dependency check.** Output: `depcheck: 244 roadmaps, 2462 edges, 0 problem(s)`. There is no UPWARD or CYCLE line. ExplicitNumberFields is line 274 of the order, after ExplicitZetaBounds (270), ExplicitPrimeCounting (271), ExplicitCharacterSumsAndSieves (272) and ExplicitMultiplicativeFunctions (273).

**Headline theorems.**
- Stated: `classNumber_maximalRealSubfield_dvd`, `idealCount_sunley`, `idealCount_debaene`, `classIdealCount_debaene`, `rayClassIdealCount_gunRamareSivaraman`, `dedekindZeta_residue_ge_friedman`, `dedekindZeta_residue_gt_stark`, `classNumber_le_bordelles`, `relativeClassNumber_le`, `leastPrimePrimitiveRoot_le_grh`, `primeIdeal_mertens_garciaLee`, `leastPrimeIdeal_ahnKwon`, `frobeniusPrimeCount_le_debaene`.
- Each of these matches its README generality and its source.
- The zeta-dependent headlines are correctly declared not statable: `NumberField.dedekindZeta` is the Dirichlet series and has no continuation at the pin.

**Gap audit.** The README states 13 gaps; the plan lists 18, including the five that R04 converted.
- All 13 are precise and have a named supplier.
- Seven are now supplied (R02), and one has a wrong constant (R01).
- Still genuine gaps:
  - `iterated-perron` (ExplicitZetaBounds' Perron formulas are §§6.1–6.2, not the iterated identity);
  - Guo's clause;
  - the three named polynomial certificates;
  - `explicit-mertens-second` (ExplicitPrimeCounting §4.7 starts at `24.4`, and 3.5 needs it from `13.5`);
  - `bach-grh-smoothed-sum` (not in ExplicitPrimeCounting §6.5);
  - `artin-norm-compatibility`: ClassFieldTheory on main has tower compatibility (Layer 11) and the abstract `artinMap_groundNorm` (Layer 4), but not the ideal-theoretic base-change form.

**Seeded sample, read at the locator.**
- 0.4: Mathlib `regulator_div_regulator_eq_two_pow_mul_indexRealUnits_inv` (`CMField.lean:439`, `regulator K / regulator K⁺ = 2 ^ rank K * Q⁻¹`). The divisibility route (Hilbert class field of `K⁺` totally real, `K ∩ H = K⁺`) is sound. `washington1997` is cited by locator.
- 0.5:
  - `louboutin2003` lines 359–360: Lemma 8(5) is attributed at lines 394–395 to an unpublished proof, as the README says.
  - `louboutin2003` line 369: the dihedral and quaternion example.
  - `garcialee2022mertens` lines 1239–1253: (24), `c₄`, `c₈` and `α(n_K)` with the three cases.
- 2.2: `sunley1973` lines 110–112 (Theorem 1.1(1), degree `n ≥ 2`, strict count `N𝔞 < x`); `lee2023ideals` lines 39–41.
- 2.4: `debaene2019` lines 69–75 and 107–124. The `log⁺` repair is confirmed at lines 941–943: the absorption into `2r log(2rn)(1 + log Reg_K)` needs `Reg_K ≥ 1`.
- 2.7: Ramaré's paper, read from the author's page copy (`ramare2025`).
  - Theorem 1.1: `X ≥ max(|Δ|, 2c₀)`, `0.76`, and `0.67` from `max(1302|Δ|, 10c₀)`; `w`, `W` and `c₀` exactly as `ℓ_K`, `u_K`, `r_K`.
  - Theorems 1.2–1.3 (`[1, 10⁸]`, `2.08`, `1.63`) and Corollaries 1.4–1.6 (`1.4`, `1.94`, and `3.4` for `X ≥ 68`); the fields `−19 ≤ d ≤ −1` are the README's thirteen.
- 3.3: `garcialee2022mertens` lines 1214–1225, with `2^{r₁}(2π)^{r₂} ≥ 4` and Friedman's `0.09058`.
- 3.4: `louboutin2003` lines 65–86 (Theorem 1(1), (2), (4)) and Table 1, lines 78–82: all 21 thresholds and `2π²Λ₂ = 167.63`. See R04 for the route.
- 3.5: `garcialee2022artin` lines 24–29 (Theorem 1), 62–71 (Corollary 2 and the five pairs), 72–74 (the remark on cubic and quartic fields), 121–131 (Lemma 3, `m(x)`, the split at `13.5`) and 145–147 (clearance `0.0010` at `7`).
- 4.3: `louboutin2017` lines 25–26; `louboutin2015ijnt` lines 27–28 and 48–50 (Theorem 3), 51–59 (Corollary 4; the README's odd-multiplicity form is the correct one) and 84–91 (Theorem 6).
- 4.5: `kadiri2012` lines 79–92 (Theorem 1.1 and Corollary 1.2) and 966–969 (`1/c₁ = 1.6110`, region `1/(1.62L)`).
- 4.9: arXiv abstracts of `guo2026` (`(1 − β) log q > 1/100` for `q ≥ 3`, no computation) and of `banks2026siegel` (`q₀ = 10¹⁰`, `δ₀ = 3.0·10⁻³`, all `q ≥ 3` with Lu–Zaman–Zhao).
- 5.1: `louboutin2005` lines 38–43. The displays are lost in the extraction. The three bounds follow from §2.15, 3.1 and 3.2 by Mathlib's `dedekindZeta_residue_def` (`DedekindZeta.lean:57`); I derived each, and `κ = (5 − 2 log 6)/2` is at line 43.
- 6.4: `mcgowntrevinotrudgian2016` lines 40–41, 56–61, 70–76 (Bach's lemma; `c(p, x)` matches the gap), 142–168 and 185–255. `cohenoliveirasilvatrudgian2016` lines 35–36 (`3.67·10⁷¹`) and 334 (`ĝ(p) < √p − 2` for `2791 < p < 2.5·10¹⁵`).
- 7.2: `greniemolteni2019` arXiv v3.
  - Theorem 1.1 holds for both `ψ(C; x)` and `ψ_C(x)`, and Corollary 1.2 for both `π` forms, as the README says.
  - §5 Step 7 covers quadratic `L` with `Δ_L < 300` and `x ≤ x₁(L) ≤ 10⁵`, and `L = ℚ` on `[1, 59]`.
  - For `L = ℚ` on `(59, 73.2]` the source uses Schoenfeld's bound extended to `59`. The README's theorem carries *ButheVerified* (`0.94√x` for `11 < x ≤ 10¹⁹`), which covers that range, so there is no hole.
- 7.3: `daskadiring2025` arXiv v1 HTML.
  - Corollaries 1.1 and 1.4: `2915`, `0.2714`, `0.4452`, `519`, `729`, `175`, `0.23`, `18458`, `0.25`.
  - `λ_L`, `Δ_L` and `E_C`; `β₀` in Stark's region.
  - `R₂ = 12.2411` is from Lee. `R₁ = 20` is from the first author's joint paper's Theorem 1.2, that is `dglsw2025`, so carrying *MinimalDiscriminantTable* and *DGLSWSmallFieldGRH* is right.
- Headline sources:
  - `gunramaresivaraman2023` lines 66–82 (`F ≥ 1`, `E(K)`, `x ≥ 1`);
  - `bordelles2002` lines 185–204 and 345–359;
  - `bordelles2006` lines 153–161 (Theorems 2.1–2.2, `n ≥ 3`, `x, b ≥ 13`);
  - `kerrmcgowntrudgian2020` lines 110–131 and 275–297.

**Library declarations opened at the pins.**
- Mathlib:
  - `NumberTheory/NumberField/DedekindZeta.lean:57,61,66`: the residue is `2^{r₁}(2π)^{r₂} R h/(w √|d|)`;
  - `NumberTheory/NumberField/CMField.lean:439`;
  - `Analysis/SpecialFunctions/Log/PosLog.lean:38` (`posLog r = max 0 (log r)`).
- Tau Ceti:
  - `NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/Basic.lean:193,200` (`abelianConductor` as the idele-class conductor; no hypothesis on `L/K`);
  - `NumberTheory/NumberField/Global/RayClass/Count/Basic.lean:100` (counts integral ideals prime to `𝔪` in the class);
  - `NumberTheory/Chebotarev/FrobeniusPrimeSet.lean:93` (unramified, Artin symbol `= C`);
  - `NumberTheory/Chebotarev/PrimeCounting/VonMangoldt.lean:177`.
- Neither library states `h(K⁺) ∣ h(K)` (grep for class-number divisibility), so `classNumber_maximalRealSubfield_dvd` is new.

**Cross-roadmap citations resolved.**
- AnalyticNumberTheoryPartI at its head: §§0.34, 0.34a, 1.6, 2.5, 2.7, 2.9a, 2.15, 2.15a, 2.17a, 2.18, 2.21, 2.22, 2.31d, 2.31e (Stark's Lemma 8 and the character computation, as the README says), 2.32, 2.39, 2.39b, 2.42, 2.43, 2.46 and 2.49.
- ExplicitMultiplicativeFunctions at its head:
  - §§2.3, 2.5, 5.2, 7.1 (`0.679091`, `1.166`), 7.4, 7.9, 8.1, 9.1 (*PrimorialTableVerified* `26`, with ExplicitPrimeCounting §5.3) and 9.4 (with §§3.2, 4.3);
  - §7.5: Bordellès' three bounds and Cully-Hugill–Trudgian's, and no Nicolas–Tenenbaum bound, as the Scope says.
- ExplicitPrimeCounting at its head: §§1.3, 1.7 (*RealZeroGap*, *LuZamanZhaoSweep*, *BanksGap*), 2.2 (`x > 73.2`, `ButheVerified`, `Schoenfeld1976Range`), 4.7 and 6.5.
- ExplicitZetaBounds at its head: §§0.5, 2.1, 2.5, 3.2, 5.1, 6.1–6.2, 7.7, 7.9 and 9.1.
- ExplicitCharacterSumsAndSieves at its head: §§3.5 and 4.1.
- On main:
  - ClassFieldTheory Layers 4, 11 and 13 (`artinMap_groundNorm`, `globalArtinMap_ideal`, `hilbertClassField`, `gal_hilbertClassField_equiv_classGroup`);
  - LFunctions: `dedekindZetaC`, `completedDedekindZeta`, `dedekindZetaData`, `heckeLFunctionC`, `PrimitiveRayClassCharacter`, `dedekindZetaC_quadratic`, `dedekindZetaC_cyclotomic`, `tendsto_prod_one_sub_inv_absNorm_div_log`;
  - ZerosOfLFunctions 4.1–4.3, 5.5–5.6, 6.1–6.5, 7.1–7.5, 8.5, *AllOnCriticalLine*.
- At their heads: ComputationalNumberTheory §4.17a; CyclotomicClassGroupsAndStickelberger §3.4; SmallRamificationAndAbelianVarietyBaseCases §1.7.

**Ownership and duplication.**
- Searched `roadmaps grep` over main and the open heads for `relativeClassNumber`, `classNumber_maximalRealSubfield_dvd`, `leastPrimePrimitiveRoot`, Grosswald, Sunley, Debaene, `0.36232`, `12577`, the Garcia–Lee Mertens theorems and `h(K⁺) ∣ h(K)`.
- The only neighbour is CyclotomicClassGroupsAndStickelberger §3.4, whose `relativeClassNumber_character_product` and `relativeClassNumber_lt` are for abelian and cyclotomic fields. The Scope records it as a kept variant, and no fully qualified name collides.
- Overlaps: none.

**Adversarial table** (values computed; scripts for the primitive roots, divisor sums, Robin's bound and condition (3) are in my scratch directory).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `classNumber_maximalRealSubfield_dvd`, `relativeClassNumber` | `ℚ(i)`, `ℚ(√−5)`, `ℚ(ζ₈)`; ℕ-division | `1∣1`, `1∣2`, `1∣1`; without the divisibility `3/2` truncates to `1` | sound |
| 0.4 relative class-number formula | `ℚ(i)`, `ℚ(√−3)`, `ℚ(√−5)`, `ℚ(ζ₈)` | `1`, `1`, `2`, `1.0000`; the ratio `2ⁿ/Q` gives `0.500` | sound; Check slip (R05) |
| `GRHMod` | `q = 1, 2` | `GRHMod 1` is RH; zeros of `1 − 2^{−s}` at `Re s = 0` excluded by `0 < Re s`; pole value excluded | sound |
| *UniformQuadraticZeroGap* consequences | `c = 1/100`; `d = 10⁷`, `9·10⁶` | `2/(ec) = 73.576`; `√d/log d = 196.19 ≥ 190.99`, `187.35 < 190.99` | sound |
| `HasNormalTower`, `starkAlpha` | `ℚ(2^{1/4})`; `x⁴ − x − 1`; `ℚ` | two quadratic steps, `α = 16` (two-case rule: `96`); disc `−283`, resolvent `x³ + 4x − 1` has no rational root, so no tower; `r = 0` | sound |
| `leastPrimePrimitiveRoot` | `m = 409, 2791, 11971, 2, 1` | `29`, `53`, `79`; `3`; junk `2` | sound |
| 0.3 Nicolas–Tenenbaum | `x = 1`, `n = 1, 2, 3`; `n = 2`, `x = √56` | right side `1, 1, 2` vs sum `1`; `16 ≤ 22.54`; induction step `(x/n!)(n yⁿ⁻¹ + yⁿ − (n−1)ⁿ) ≤ (x/n!)(y+1)ⁿ` | sound |
| `idealCount_sunley` | `ℚ(i)`, `x = 10`; `n = 1` | `|9 − 7.854| = 1.146` vs `1.15·10³¹`; at `n = 1` the right side is `≡ 0` | sound |
| `idealCount_debaene`, `classIdealCount_debaene` | cubic `−23`; `ℚ`; `ℚ(i)` | printed base `−0.2687`, `rpow` gives `−0.0867`; `log⁺` gives `1`; `ℚ`: bound `1`; `ℚ(i)`: `2⁴⁰x^{1/2}` | sound |
| `rayClassIdealCount_gunRamareSivaraman` | `ℚ`, `(1)`; `(5)` | `F = 2`, `E = 1039.7`, bound `3729.8` (`1144.2` without `2^{r₁}`); main term `x/5` | sound |
| 2.7 Ramaré | `d = 4, 3`; `ℚ(√−3)`, `X = 10`; `ℚ(i)`, `X = 100` | `ζ_K(0) = −1/4, −1/6`; `6 − 6.046 + 1/6 = 0.121`; `79` vs `78.540`; `(2.08/1.4)¹² = 115.67` | sound |
| `dedekindZeta_residue_ge_friedman` | `ℚ(i)`, `ℚ(ζ₅)`, cubic `−23`, `n = 1` | `0.785 ≥ 0.181`; `0.33984 ≥ 0.0324`; `0.3684 ≥ 0.0756`; factor `2 < 4` at `n = 1` | sound |
| 3.1 / 3.2 | `ℚ(√5)`; cubic `−23` with 2 inert | `0.43041/1.19624 = 0.35980`; `(1/7)(2.1308 · 3.7673)² = 9.205 ≥ 0.3684` | sound |
| 3.4 | Table 1; split formula at `s = 1/2` | `ϱ(1)Λ₂ = 2293 ≠ 36000`; `32π²Λ₂ = 2682.2`; source polar term `−4λ`, README `+4λ` | R04 |
| 3.5 Lemma 3 and Duke | `x = 1.048, 2, 7, 13.5`; `χ₋₄` | `2.7986 < 4.7134`; `0.605016 < 1.421044`; `0.248963 < 0.249988` (needs `c ≥ 4.9498`); `0.12598 < 0.127871`; `0.2416 ≤ 13.53` | sound |
| 3.6 | `ℚ(√−5)`, `ℚ(√−14)`, cubic `−23`; `d = 5.4·10⁶`; `q = 10¹⁰` | `[0.0845, 19.48]`, `[0.003616, 454.9]`, `[0.00349, 1402]`; `24.09` vs `10595`; `11.62` vs `11363.6`; `2e^γ·1086 = 3868.5 < 5.43·10⁷` | sound |
| 4.1 / 4.2 | `ℚ`, `T = 15`; `ℚ(i)`, `T = 100`; `d = 3`, `T = 1` | main `−0.6198`, bound `10.673`; `156.64 ± 19.507`; Amberger `10.139`, `19.476`, `17.633` vs `16.496` | sound |
| 4.3 / 4.4 | `ℚ(ζ₇)⁺`; `P(S)` | `0.7246`; `c′₁ = 0.62076` for `d > 3.461`; roots `0.454334`, `1.221332`; `D₁ = 0.27645`, `C₂ = 0.62076` | sound |
| 4.5 / 4.6 | `ℚ`, `|t| = 14.13` | `0.98855`, `0.9637` vs classical `0.9322`; `1/1.6110 = 0.620732 < 0.620756` | sound |
| `dedekindZeta_residue_gt_stark` | `ℚ(ζ₇)⁺`; `c₄` | `c₄ = 43.1621`; `0.0014883 < κ = 0.30026`; `1/(16c₄) = 0.00144803` | sound |
| 4.8 / 4.10 | `n = 3`, `d = 23`, `|t| = 1, 10⁶`; small fields; `ν = 1/2`, `d = 3` | `8.080` vs `40.80`; `403.55` vs `435.98`; abscissae `0.943`, `0.835`, `0.888`; `ℚ(√−3)`: `0.435` covered by `C₂ ≥ 1/A″(2)`; `0.5449 > 1/2` | sound |
| 5.1 / 5.2 | `ℚ(√5)`, `ℚ(i)`, `ℚ(√−3)`; `d = 163`; `ℚ(ζ₅)` | `2.446`, `2.399`, `2.469`; `13.23`; `9.807` (`31.04` with `κ`) | sound |
| `classNumber_le_bordelles` | `ℚ(√−14)`, cubic `−23`, `ℚ`, `ℚ(√5)` at `a = 2/log 5` | `60.25 ≥ 4`; `94.30 ≥ 1`; `1 = 1`; `4.035`; first/third ratio `0.903` (`n = 26`), `2.198` (`n = 27`) | sound |
| 5.4 | `b = 10, 100, 1000`; `193` | `S₃ = 53, 1471, 29425` vs `66.41, 1552.3, 29964.3`; `Σ_{m ≤ 193} τ₄ = 9333 ≤ 9376.9` | sound |
| `relativeClassNumber_le` | `ℚ(i)`, `ℚ(√−3)`, `d = 163`, `ℚ(√−5)`, `ℚ(ζ₈)` | `4.798`, `4.939`, `56.27`, `11.59 ≥ 2`, `12.72` | sound |
| 5.6 (12), (13) | `ℚ(√−3)`; `d = 163`; Theorem 13 at `n = 3`, `ρ = 2800` | `1.108 > 1 = h` (excluded by the threshold); `0.587`; `9.48·10⁻⁴` | sound (source gap) |
| 6.1 / 6.2 | `ℤ/6` at `1, 2`; `ℤ/2 × ℤ/2`; `p = 101`, `H = 4`, `h = 2`; `p = 7` | `1`, `0`; `−1` and `1`; 8 integers with `4 ≤ 8 ≤ 8`, `15.40`; overlap at `2` | sound |
| 6.3 | `ω = 17` | `δ_{17,14} = 0.33587`; `1.462·10¹¹` vs `√(q₁⋯q₁₇) = 4.386·10¹⁰` | sound |
| `leastPrimePrimitiveRoot_le_grh` | `10⁹ + 7` (`ω = 2`), `1000000021` (`ω = 6`) | `9894.7 < 31620.8`; `4.36·10⁶` | sound |
| 6.4 Grosswald | `p = 409, 2791, 11971` | `g = 21 > 18.22`; `ĝ = 53 > 50.83` with `g = 6`; `ĝ = 79 < 107.41` | sound; R03 |
| 6.5 | `h(3), h(5), h(7), h(40487)`; Lapkova `A` | `2, 2, 3, 10`; `A(10¹²) = 0.18885` (printed form `0.15916`); condition (3) ratio `≥ 11.0` | R01 |
| `primeIdeal_mertens_garciaLee` | `ℚ(i)`, `x = 10` and `2` | product `0.284444`; normalised `0.91619` (`e^{−γ}`: `0.288827`); `M ∈ [−1.664, 0.336]`; `0.347` at `x = 2` | sound |
| 7.2 / 7.3 | `ℚ(i)`, `x = 100`; `L = ℚ` on `(59, 73.2]`; `ℚ(i)/ℚ` | `93.93` vs `94.76`; `0.94√60 = 7.28 ≤ 20.66`; `2801`, `λ = 1.96052`, `9.29·10⁻⁴` | sound |
| `leastPrimeIdeal_ahnKwon` | `ℚ(i)/ℚ` | least `3` (conjugation), `5` (identity); GRH form `241.65` | sound |
| `frobeniusPrimeCount_le_debaene` | `L = ℚ`, `x = 3, 10⁶, 2, 2.6, e` | `15.05 ≥ 2`; `7.088·10⁵ ≥ 78498`; `−56.78`, `0.130` (excluded by `x > e`); `5.437` | sound (source error) |

## Not verifiable

- `washington1997` Theorem 4.10, `friedman1989` Theorem B (read through `garcialee2022mertens` line 1215), `rademacher1959` (read through `lee2023ideals` lines 173–179 and ExplicitZetaBounds §3.2), and `louboutin2000` and `louboutin2001` (read through `louboutin2003` and `louboutin2005`): recorded as uncertified.
- `kadiringwong2019`: the arXiv abstract confirms only the factor `5/2` over Zaman's bound. The threshold, the degree of the prime and the repulsion constants `14.144` and `7.071998` are not checked.
- `kadiring2012` Theorem 4, `ahnkwon2019` (not re-read this round), `amberger2026`, `fehnker2026`, `gglm2026`, `palojarvisimonic2026`, `leenosal2026`, `mcgownsorenson2024`, `chen2022`, `luzamanzhao2026`, `banks2026brauersiegel`, `cullyhugilltrudgian2021`, `tudzi2026`, `odlyzko1976`, `cholemkeoliverzaman2025`, `bachsorenson1996`, `greniemolteni2016`, and the context sources `openai2026siegel`, `kerr2026` and `green2026`: uncertified, or read only by abstract.
- The displays of `louboutin2005` p. 560: the extraction has lost them. The bounds of 5.1 were derived instead (see Verified sound).

## Source issues

- **Error** in kerrmcgowntrudgian2020 at Lemma 3, p. 3 (line 122): the source says the middle term of `A(q₀)` is `0.8204/√q₀`; it should be `0.8204/log q₀`, from Lapkova's odd bound divided by `√q log q`; affects the proof (the claim `A(p) ≤ 0.16` for `p ≥ 10¹²` at line 278 fails, since `A(10¹²) = 0.1889`; Theorem 1 still follows).
- **Error** in debaene2019 at Theorem 1, p. 2 (lines 74–75): the source says the bound holds for every `x` with `x(log x)^{−5n²} ≥ c_K`; at `L = ℚ` and `x = 2` the right side is `−56.8 < π(2)`; it should also require `x > e`; affects a stated result.
- **Error** in debaene2019 at Theorem 1 and Corollary 2, pp. 2–3 (lines 73, 113, 122): the source says `1 + log(Reg_K h_K)`, which is negative when `Reg_K h_K < 1/e`; it should be `1 + log⁺(Reg_K h_K)`, as the proof at lines 941–943 gives; affects a stated result.
- **Gap** in louboutin2003 at Theorem 11, p. 3088 (lines 475–479): the source states (12) and (13) for every CM field with the positivity condition; it should require `ρ_K ≥ max(ρ_{2m}, ρ_{2m,∅})`, which its proof through Theorem 1(1)–(2) needs; affects a stated result.
- **Gap** in louboutin2015ijnt at Corollary 4, p. 2 (lines 51–59): the source says there is no real zero in `σ ≥ σ₂`, and the proof argues at `1 − 2/log d_K`; it should exclude only zeros of odd multiplicity and argue at `1 − c₂/log d_K`; affects a stated result.
- **Misprint** in louboutin2017 at Theorem 2, p. 109 (line 34): the source says `S₀` is the only root of `S⁴ + 2S³ − 2S² − 4S + 2` in `[0, √2]`; it should say `[0, 1]`, since `1.221332` is a second root; affects nothing.
- **Gap** in ramare2025 at Corollary 1.4, p. 2: the source derives `1.4X^{1/3}` for `X ≥ 1` from Theorems 1.1–1.2; it should check `[1, 115.67)` separately, since `2.08X^{1/4} ≤ 1.4X^{1/3}` only from `115.67` (the bound holds there); affects the proof.
- **Misprint** in garcialee2022mertens at §3, p. 16 (line 1255): the source opens the derivation of the `|Δ_K|^{1/n}` bound with "in the case K does not have a quadratic subfield"; it should say the derivation holds for every `K`; affects nothing.
