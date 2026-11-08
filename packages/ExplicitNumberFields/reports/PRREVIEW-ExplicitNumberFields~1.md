# Review of ExplicitNumberFields (pull request #1944 at 6c7e499)

**Verdict:** needs changes

Scope: `TauCetiRoadmap/ExplicitNumberFields/README.md` and `TauCetiRoadmap/ExplicitNumberFields/Suggested.lean` at `6c7e499`. Twelve findings: one P1, six P2, five P3.

## R01 (P1) — The route for `classNumber_le_bordelles` is false from degree 27, and the input the source actually uses has no owner

**Location.** `TauCetiRoadmap/ExplicitNumberFields/README.md:2155–2158`: "for the third form, `μ_K ≤ 1` and `log b ≤ (1/2) log d_K`, with `(1/2 + (γ + 1/b)/log d_K)^{n−1} n!/nⁿ ≤ 2^{n−1}/(n−1)!` from `log d_K ≥ 2(n−1)/3` (Minkowski) and the first form".

**Claim.** The README derives the headline `h_K ≤ (2^{n−1}/(n−1)!) √d_K (log d_K)^{n−1}` (and its general-`a` form) from the first form `h_K ≤ b(log b + γ + 1/b)^{n−1}`. That derivation fails for large `n`: in that range the first form is weaker than the third, so no route through it can work. The general-`a` form has no route at all. The source proves both forms from a different divisor-sum bound, and neither this roadmap nor ExplicitMultiplicativeFunctions §7.5 states that bound.

**Witness.** Take `n = 27`, `r₂ = 0` and `d_K → ∞`. The ratio of the first form to the third tends to `μ_K (n−1)!/4^{n−1} = 27!·26!/(27²⁷·4²⁶) = 2.199 > 1` (computed; it is `0.90` at `n = 26`). `bordelles2002` lines 345–359 prove Theorem 5.3 from (1.2) at lines 85–91, with `b < √d_K`.

**Repair.** In 0.3, state as a target the Lenstra/Nicolas–Tenenbaum bound: `Σ_{m≤x} τ_n(m) ≤ (x/(n−1)!)(log x + n − 1)^{n−1}` for every `n ≥ 1` and real `x ≥ 1` (`bordelles2002` lines 85–91, proved by induction). Alternatively, add it to the ExplicitMultiplicativeFunctions §7.5 contract. Then rewrite the route as the source's: `h_K ≤ S_n(√d_K)` by 0.3 and `b < √d_K`; then (6.2) with `a ≥ 2(n−1)/log d_K` and `|d_K| ≥ e^{2(n−1)/3}` for `a = 3`. At `n = 27` this gives the headline with no loss.

## R02 (P2) — Grosswald's conjecture under GRH: nothing supplies the `ĝ` clause in its finite range

**Location.** `README.md:2583–2585` declares *GrosswaldFiniteRange* only for `g(p) ≤ √p − 2`. `README.md:2602–2604` then asserts "`ĝ(p) < √p − 2` for every prime `p > 2791`" under `GRHMod p`, *GrosswaldFiniteRange* and *GrosswaldSieveVerification*.

**Claim.** None of the three hypotheses covers `ĝ` on `2791 < p < 2.5·10¹⁵`. Theorem 2 needs `p ≥ 10⁹`, and line 2591 of the README itself says this computation is not in the table.

**Witness.** `cohenoliveirasilvatrudgian2016` lines 314–334 show by a separate computation that `ĝ(p) < √p − 2` for `2791 < p < 2.5·10¹⁵`. `mcgowntrevinotrudgian2016` line 157 relies on it. Computed: `ĝ(2791) = 53 > 50.83`.

**Repair.** Add the clause "`ĝ(p) < √p − 2` for every prime `2791 < p < 2.5·10¹⁵`" (`cohenoliveirasilvatrudgian2016` lines 314–334) to *GrosswaldFiniteRange*, or declare it as its own predicate. Carry it in the theorem. At `p = 2791` the clause correctly starts just above the last exception.

## R03 (P2) — Theorems that use ExplicitMultiplicativeFunctions §§9.1 and 9.4 drop the finite verifications those sections carry

**Location.** The rule is at `README.md:529`: "Every theorem here that uses one of these carries the named finite verification as a hypothesis." Three theorems break it:
- `README.md:2602–2604`: Grosswald under GRH. Its route uses Robin's bound at line 2605.
- `README.md:2655–2657`: Kerr–McGown–Trudgian's `h(p) < p^{0.99}`. Its route uses §9.4 and §9.1 at lines 2659–2663.
- `README.md:2680–2682`: McGown–Sorenson's `h(p) < p^{2/3}`. Its route uses §§9.1 and 9.4 at lines 2684–2686.

**Witness.** At its head, ExplicitMultiplicativeFunctions states Robin's bound under `PrimorialTableVerified 26` (line 3257) and Theorem 15 under `PrimorialTotientTableVerified 24 284` (line 3435). The three hypothesis lists name neither; 6.3's Corollary 1 does (line 2522).

**Repair.** Add *PrimorialTableVerified* `26` to all three theorems, and *PrimorialTotientTableVerified* `24284` to the two 6.5 theorems.

## R04 (P2) — Five declared gaps ask for results the supplier heads already state

**Location.**
- `README.md:504–510`: `gap:piltz-divisor-sums`
- `README.md:512–518`: `gap:tudzi-tau3-remainder`
- `README.md:520–522`: `gap:omega-pointwise-robin`
- `README.md:524–527`: `gap:totient-quotient-bound`
- `README.md:539–541`: `gap:schoenfeld-psi-rh`

Each says "Required location: §…, which states it".

**Witness.** At its head, ExplicitMultiplicativeFunctions states the first four, with the same predicates: §7.5 (lines 2770, 2783, 2802), §7.9 (2982), §9.1 (3257), §9.4 (3435). ExplicitPrimeCounting §2.2 (line 1212) states Schoenfeld's bound, but under `ButheVerified` and `Schoenfeld1976Range` as well as the Riemann hypothesis.

**Repair.** Cite these five sections as ordinary supplier contracts, and remove the five slugs from the README and from the plan's `gaps`. Wherever §2.2 is used, carry `ButheVerified` and `Schoenfeld1976Range`: in 3.6's von Mangoldt–log sum (line 1494) and in 7.2 through its `L = ℚ` case (lines 2799–2800).

## R05 (P2) — Das–Gaba–Lee–Savalia–Wong's theorems rest on GRH verifications that no predicate records

**Location.** `README.md:1942–1943`: "None of the three has a threshold on `d_K`; each takes *MinimalDiscriminantTable* as a hypothesis". `README.md:2037`: "Both take *MinimalDiscriminantTable*".

**Witness.** `dglsw2025` (arXiv v1, §4.5, (4.18), and §5.1) assumes `d_L ≥ 400 001, 240, 321` for `n_L = 2, 3, 4`. It justifies these by Tollis's GRH verification (cubic fields with `d_L ≤ 239` up to `|t| ≤ 92`; quartic fields with `d_L ≤ 320` up to `|t| ≤ 40`). *MinimalDiscriminantTable* only gives `3, 23, 117`.

**Repair.** Declare one predicate for these small-field verifications (state, with its locator, what it asserts for `n = 2, 3, 4`). Carry it in Theorems 1.2–1.5 of 4.8 and in the `dglsw2025` statements of 4.10.

## R06 (P2) — Debaene's Brun–Titchmarsh headline can be stated at the pins, but the docstring says it cannot

**Location.** `Suggested.lean:53–54`: "Debaene's Brun–Titchmarsh inequality (7.5): it needs the conductor of an abelian extension of number fields, which neither library defines". The README also cites ClassFieldTheory Layer 12 for `abelianConductor` (`README.md:117`, `395–396`).

**Witness.** Pinned Tau Ceti defines `TauCeti.ClassFieldTheory.abelianConductor` (`TauCeti/NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/Basic.lean:193`). A scratch statement of `debaene2019` Theorem 1 on `fixedField H`, `abelianConductor` and `frobeniusPrimeCount ℚ L C` elaborates; the only warning is `sorry`.

**Repair.**
- State `debaene2019` Theorem 1 (with `log⁺`) in `Suggested.lean`. Take `L : Type`, because `abelianConductor` lives in `Type`. Import the `AdmissibleModulus.Basic` and `Chebotarev.PrimeCounting.VonMangoldt` modules.
- In 2.5 and 7.5, cite the Tau Ceti declaration in place of ClassFieldTheory Layer 12.
- Kadiri–Ng–Wong's `N𝔭 ≤ d_L^{16}` (7.4) is statable on the carriers of `leastPrimeIdeal_ahnKwon`. The docstring calls it a "variant", but the README says the two "are not comparable" (lines 2882–2883). State it, or give a correct reason for leaving it out.

## R07 (P2) — Chen's criterion uses an undefined function `A(p)`

**Location.** `README.md:2674–2675`: "… `− (2 + (s − 1)/δ) 2^{ω(e)} A(p) √p log p − …` where `A(p)` is the explicit Pólya–Vinogradov-type function of `chen2022`".

**Claim.** The target's statement is not fixed. McGown–Sorenson's `h(p) < p^{2/3}` (line 2680) depends on it through alternative (ii) of *McGownSorensonGapChecks*. The source text is uncertified, so the README cannot leave `A(p)` to it.

**Witness.** `kerrmcgowntrudgian2020` Theorem 3 (lines 64–79) uses the same kind of quantity. The README restates that theorem with `A` as an explicit hypothesis (`README.md:2648–2652`).

**Repair.** Make `A` a hypothesis as Theorem 3 here does (`|Σ_{m≤M} χ(m)| ≤ A √p log p` for every non-principal `χ` modulo `p` and every `M`), or write `A(p)` out with its locator.

## R08 (P3) — The *Needs* line of 6.2 omits the inputs of its large-`X` estimates

**Location.** `README.md:2476–2477`: "*Needs:* Mathlib `ArithmeticFunction.moebius`, `Nat.totient`, `Int.floor`; *McGownTrudgianMoebiusChecks*."

**Witness.** `mcgowntrudgian2020` lines 300–312 prove the bounds for `X ≥ 38` and `X ≥ 1000` from Ramaré's `|Σ_{d≤X} μ(d)/d| ≤ 1/10` (for `X ≥ 7`) and from Cipu's squarefree count. ExplicitMultiplicativeFunctions §2.3 and §7.1 own both.

**Repair.** Add ExplicitMultiplicativeFunctions §§2.3 and 7.1 (and §2.5 for the tail `Σ_{d>X} μ(d)/d²`) to the *Needs* line and to the supplier contracts.

## R09 (P3) — Numerical slips in Checks

**Location and corrected values.**
- `README.md:2187` (5.4): for `ℚ(ζ₅)`, `b = (4/π)²(24/256)√125 = 1.699`, not `2.76`. The README applies `(4/π)²` twice.
- `README.md:2186` (5.4): `(1/3)·193·(log 193)³ = 9376.9`, not `9420`. The actual sum `Σ_{m≤193} τ₄(m)` is `9333`.
- `README.md:1341` (3.3): `R_{ℚ(ζ₅)} = 2 log((1+√5)/2) = 0.96242`, so `κ = 0.3398`, not `0.9620` and `0.3397`.
- `README.md:1570` (3.6): `2e^γ·1086 = 3868.5`, not `3866`.
- `README.md:1292` and `1597` (3.1): `1 − β ≥ 0.4304/1.19624 = 0.35980`, so the zero-free interval is `(0.6402, 1)`, not `[0.64, 1)`.
- `README.md:1219` (2.7): `(2.08/1.4)¹² = 115.67`, so the `X^{1/4}` form implies `1.4 X^{1/3}` from `X ≥ 115.67`, not "only for `X ≥ 117`".
- `README.md:2468–2469` (6.2): the Check writes `I(0,1)`, `J(0,1)`, `I(1,2)`, `J(1,2)` in `(t, q)` order, while the definition at line 2449 is `I(q, t)`.

**Repair.** Replace these with the values above.

## R10 (P3) — 7.4's *Needs* line contradicts the convention on unrefereed sources

**Location.** `README.md:2890` reads "*Needs:* 4.2, 4.5–4.8, 4.10". The Conventions at `README.md:250–253` say the preprint regions of 4.8 and 4.10 are "stated beside a refereed counterpart, which is the one the later layers use".

**Witness.** The route at lines 2871–2873 uses Ahn–Kwon's own region (`A = A' = 29.57`, "in place of 4.8's") and Kadiri–Ng–Wong's own repulsion.

**Repair.** In 7.4's *Needs* line, replace "4.5–4.8, 4.10" with "4.5, 4.6, and 4.10 (Kadiri–Ng–Wong's statements)".

## R11 (P3) — The docstring lists 5.7 among statements that need `ζ_K` off the half-plane

**Location.** `Suggested.lean:40–41`: "the consequences of the uniform real-zero gap (4.9, 5.7)", inside the bullet on zeros and values of `ζ_K`.

**Witness.** 5.7's statement mentions only *UniformQuadraticZeroGap*, which concerns Mathlib's `DirichletCharacter.LFunction` (`README.md:809–812`), together with `h_K R_K` and `d_K`. The actual reason it is not a headline is its preprint source, which `Suggested.lean:61–62` already gives.

**Repair.** Remove 5.7 from that bullet.

## R12 (P3) — The description's merge-order paragraph omits two suppliers that are open pull requests

**Location.** The pull-request description, merge-order paragraph.

**Witness.** The README cites ExplicitPrimeCounting §§1.7, 2.2 and ExplicitMultiplicativeFunctions §§7.5, 7.9, 8.1, 9.1, 9.4 as suppliers (`README.md:102–107`, `502–562`). Both are open new-roadmap pull requests by the same author (#1945, #1946), and neither appears in the paragraph.

**Repair.** Add #1945 (ExplicitPrimeCounting) and #1946 (ExplicitMultiplicativeFunctions) before this pull request in the merge-order paragraph.

## Verified sound

**Gate and build.**
- The worker's gate is all green.
- `lake env lean Suggested.lean` elaborates with 12 `sorry` warnings and nothing else.
- I compared the elaborated types of all 17 declarations against the README statements. No binder is lost; the casts in `primeIdeal_mertens_garciaLee` (`↑n − 1` is real), `classNumber_le_bordelles` (natural `n − 1` with `n ≥ 1`) and `leastPrimePrimitiveRoot_le_grh` are as intended.
- One-tactic padding probe, by reading each theorem against the pinned library: no declaration closes in one step. Each headline needs a deep source theorem, and the five definitions have real bodies.

**Dependency check.** Output: `depcheck: 242 roadmaps, 2452 edges, 0 problem(s)`. There are no UPWARD or CYCLE lines.

**Seeded sample: sources read at the locator.**
- 0.2: `louboutin2005` p. 560 (page rendered), the definition of `Π_K(p)` and `Π_K(2)/2ⁿ ≤ 1`, with `1/(2ⁿ−1)` when 2 is inert.
- 0.3: `bordelles2002` lines 72–79, Lemma 1.1 for `n ≥ 2`.
- 3.1: `louboutin2003` lines 297–300, (8).
- 3.2: `louboutin2005` p. 569, Theorem 10 (13) (rendered), matching the root-discriminant form.
- 3.5: `garcialee2022artin` lines 24–29, 121–131, 136, 145–147 (clearance 0.0010 at `x = 7`), 690–718 and 886 (29). The proof uses only `|χ(pᵐ)| ≤ d`, shifts in `{0, 1}`, the functional equation and `N ≥ 3` (lines 133–180), so the restatement on records is at the source's generality.
- 4.1: `trudgian2015` lines 19–27.
- 4.2: `hasanalizadeshenwong2022` lines 52–76, including the Table 1 row `(0.296, 3.971, 3.969)`.
- 4.5: `kadiri2012` lines 79–92 and 966–969 (`1/c₁ = 1.6110`).
- 4.8 and 4.10: `dglsw2025` arXiv v1 HTML. The constants of Theorems 1.1–1.5 match exactly; see R05 for the missing input.
- 5.2: `louboutin2005` p. 560 abelian display, with `κ = (5 − 2 log 6)/2`.
- 5.5: `louboutin2003` line 605, quoting [Lou7, Corollary 3] for every CM field of degree `2n`.
- 6.2: `mcgowntrudgian2020` lines 201–234, 284–297, 326–327 and 352–353.
- 6.4: `mcgowntrevinotrudgian2016` lines 40–41, 56–76, 142–168 and 185–243; `cohenoliveirasilvatrudgian2016` lines 35–36, 287–334 (see R02).
- 7.3: `daskadiring2025` arXiv HTML, Corollaries 1.1 and 1.4 and the definitions of `λ_L` and `E_C`. Stark's region contains theirs, so the README's convention for `β₀` is implied.
- 7.5: `debaene2019` lines 69–75, plus Corollary 2 at lines 107–124. The `log⁺` repair is sound: the printed base is negative when `R h < 1/e`, and the proof steps are at lines 941–954.

**Headline sources.**
- `sunley1973` lines 110–112. The strict count is passed to the closed count by the right limit.
- `gunramaresivaraman2023` lines 66–82, including `F ≥ 1`.
- `garcialee2022mertens` lines 89–128 for Theorem 1 with (Λ) and (Υ). Lines 1214–1225 give Friedman's bound (22). Lines 1239–1305 give `α(n)`, `c₄ = 43.162115` and `0.001448029`.
- `bordelles2002` lines 185–204.
- `ahnkwon2019` arXiv abstract: a degree-one prime, `L ≠ ℚ`, exponent `12577`.
- `kerrmcgowntrudgian2020` lines 25, 37–39, 50–79 and 139.
- `louboutin2015ijnt` lines 40–59 and 84–91.
- `louboutin2003` lines 282, 307–339 and 475–514.

**Library declarations opened at the pins.**
- Mathlib:
  - `DedekindZeta.lean:57,61,66`
  - `CMField.lean:358,373,385,439` (`regulator K / regulator K⁺ = 2^{rank K}/Q_K`)
  - `Discriminant/Basic.lean:210,244`
  - `ClassNumber.lean:78`
  - `Units/Basic.lean:174`
  - `RiemannZeta.lean:185`
  - `PosLog.lean:38`
  - `TotallyRealComplex.lean:126`
- Tau Ceti:
  - `ArithmeticDirichletSeries/Counting.lean:103,107` (`idealsLE`, `primesLE`)
  - `NumberField/DedekindZeta.lean:109`
  - `RayClass/Modulus.lean:98,288`
  - `RayClass/Count/Basic.lean:100`
  - `Chebotarev/FrobeniusPrimeSet.lean:93`
  - `Chebotarev/PrimeCounting/VonMangoldt.lean:165,170,177`
  - `LFunctions/Mertens.lean:545`
  - `DirichletCharacter/Conrey.lean:78`
  - `EffectiveBounds/ClassNumber/Basic.lean:81`
  - `EffectiveBounds/IdealCount/Basic.lean:399`
  - `AdmissibleModulus/Basic.lean:161,193`

**Cross-roadmap citations resolved.**
- On main:
  - LFunctions Layers 0, 3, 4, 5, 7, 8
  - ZerosOfLFunctions 4.1–4.3, 5.5, 5.6, 6.1–6.5, 7.1–7.5, 8.5, Layer 9 (*AllOnCriticalLine*, *GRH*)
  - ClassFieldTheory Layers 4, 11, 12, 13
  - ClassicalArithmeticCompletion §§1.5, 5.1 (`M_K ≈ 4.764` at `ℚ(√−14)`)
  - ImaginaryQuadraticClassNumber H2.2
- AnalyticNumberTheoryPartI at its head: §§0.34, 0.34a, 1.6, 2.5, 2.7, 2.9a, 2.15, 2.15a, 2.17a, 2.18, 2.21, 2.22, 2.31d, 2.31e, 2.39, 2.39b, 2.42 (`DedekindERH.of_abelian`), 2.43, 2.46, 2.49.
- ExplicitPrimeCounting §§1.7, 2.2, 4.7, 6.5 and ExplicitMultiplicativeFunctions §§7.5, 7.9, 8.1, 9.1, 9.4, at their heads.
- The 18 gap slugs agree between the README and the plan.
- Duplication by object: no other roadmap or pin states the headlines (searched 0.36232, 28.2, 12577, Debaene, Grosswald, Bordellès and the `h(K⁺) ∣ h(K)` divisibility). Overlaps: none.

**Adversarial table.**

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 0.2 `Π_K(p)` | `ℚ(i)` at 2, 3, 5; inert 2 | `2`, `9/8` (`p` in place of `N𝔭` gives `3/2`), `1.5625`; `Π/2ⁿ = 1/(2ⁿ−1)` | sound |
| 0.3 class-number lemma | `ℚ(i)`, `ℚ(√−14)` | `b = 1.273`, sum `1 = h`; `b = 4.764`, `Σ_{m≤4} τ₂ = 8 ≥ 4`, `#idealsLE = 5` | sound |
| 0.4 `relativeClassNumber`, divisibility | `ℚ(i)`, `ℚ(√−5)`, `ℚ(ζ₈)` | formula gives `1`, `2`, `1.000`; wrong power `2ⁿ` gives `2` | sound |
| 0.5 `GRHMod` | `q = 1, 2, 4` | `L(s, 1 mod 2)` zeros on `Re s = 0` excluded by `0 < Re s`; `q = 1` gives RH | sound |
| 0.5 `HasNormalTower` | `ℚ(2^{1/4})`, `x⁴−x−1`, `ℚ` | tower of 2 steps; disc `−283`, resolvent `x³+4x−1` irreducible, so `S₄` and no tower; `r = 0` | sound |
| 0.6 `leastPrimePrimitiveRoot` | `m = 409, 2, 1, 2791` | `g = 21`, `ĝ = 29`; `ĝ(2) = 3`, `ĝ(1) = 2` (junk); `ĝ(2791) = 53` | sound |
| `idealCount_sunley` | `ℚ(i)`, `x = 10`; `n = 1` | `9` vs `7.854`, right side `> e^{61.4}`; at `n = 1` right side `≡ 0` (`log 1`), false at non-integer `x`, so `n ≥ 2` is needed | sound |
| `idealCount_debaene`, class form | cubic of disc `−23`; `n = 1`, `x = 1/2` | `1 + log 0.2812 = −0.2687`, rpow gives `−0.0867`; with `log⁺` factor `1`; `1/2 ≤ 1` | sound |
| `rayClassIdealCount_gunRamareSivaraman` | `ℚ`, `𝔮 = (1)`; `𝔮 = (5)` | `F = 2`, `E = 1039.7`, bound `3730` (`1144` without `2^{r₁}`); `H = (ℤ/5)ˣ`, main term `x/5` | sound |
| `dedekindZeta_residue_ge_friedman` | `ℚ(i)`, `ℚ(ζ₅)`, cubic `−23` | `0.785 ≥ 0.181`; `0.3398 ≥ 0.0324`; `0.3684 ≥ 0.0756`; `n = 1` factor `2 < 4` | sound (R09 slip) |
| `dedekindZeta_residue_gt_stark`, `starkAlpha` | `ℚ(ζ₇)⁺`; `ℚ(2^{1/4})` | `c₄ = 43.1621`; bound `0.001488` vs `κ = 0.3003`; `α = 16` (two-case definition gives `96`) | sound |
| `classNumber_le_bordelles` | `ℚ(√−14)`, cubic `−23`, `ℚ`; `n = 27`, `d → ∞` | `60.2 ≥ 4`, `94.3 ≥ 1`, `1 = 1`; route ratio `2.199 > 1` | statement sound, route false (R01) |
| `relativeClassNumber_le` | `ℚ(i)`, `ℚ(√−3)`, `d = 163`, `ℚ(√−5)`, `ℚ(ζ₈)` | `4.80`, `4.94`, `56.27`, `11.59 ≥ 2`, `12.72 ≥ 1` | sound |
| `leastPrimePrimitiveRoot_le_grh` | `p = 10⁹+7` (`(p−1)/2` prime); `p = 1000000021` (`ω = 6`) | `9894.6 < 31620.8`; `4.36·10⁶` | sound |
| `primeIdeal_mertens_garciaLee` | `ℚ(i)`, `x = 10` | product `0.28444`, normalized `0.91618` (`e^{−γ}` gives `0.2888`); `M ∈ [−1.664, 0.336]`; `Λ ≈ 5.3·10³⁰` | sound |
| `leastPrimeIdeal_ahnKwon` | `ℚ(i)/ℚ` | least primes `3` (conjugation) and `5` (identity); GRH form `241.7` | sound |
| 2.6 Fehnker | `n = 2`; `ℚ(i)` | `E₂ = 1.73·10⁸`, `E₁ = 1.11·10⁶`; range `t ≥ 6400`, `8.77·10⁷` vs `2⁴⁰ = 1.10·10¹²` | values sound; source not verifiable |
| 2.3, 2.7 | `n = 2, 3`; Ramaré up to `2·10⁴` | `A_L(2) = 2.4913·10¹⁰`, `A_L(3) = 8.451·10¹¹`; maxima `0.9011` (`25⁻`), `0.6711` (`91⁻`) | sound (R09 threshold) |
| 3.1 | `ℚ(√5)` | `κ = 0.43041`, `(e log 5/4)² = 1.19624`, `1−β ≥ 0.35980` | sound (R09) |
| 3.5 Mertens lemma and Duke | `x = 1.048, 2, 7, 13.5`; `χ₋₄` | `2.7986 < 4.7134`; `0.605016 < 1.421044`; `0.248963 < 0.249988` (constant `≥ 4.9498` needed); `0.125979 < 0.127873`; `0.2416 ≤ 13.53` | sound |
| 3.6 GGLM | `ℚ(√−5)`, `ℚ(√−14)`, cubic `−23`, `d = 5.4·10⁶`, `10¹⁰` | `[0.0845, 19.48]`, `[0.00362, 454.9]`, `[0.00349, 1402]`; `10595`, `24.09`, `11362.6` | sound (R09 slip) |
| 4.1, 4.2 | `ℚ`, `T = 15`; `ℚ(i)`, `T = 100`; `d = 3`, `T = 1` | `−0.620`, `10.67`, `2.87 ≤ 27.77`; `156.64 ± 19.51`; Amberger `10.14`, `19.48`, `17.63` vs `16.50` | sound |
| 4.3, 4.4, 4.5, 4.6 | `ℚ(ζ₇)⁺`; `P(S)`; `|t| = 14.13` | `0.7246`; roots `0.454334` and `1.221332`, `D₁ = 0.27645`, `C₂ = 0.62076`; regions `0.98855`, `0.96373`; `1/1.6110 = 0.620732 < 0.620756` | sound |
| 4.8 | `n = 3`, `d = 23`, `|t| = 1` and `10⁶` | denominators `8.080` vs `40.80`, `403.55` vs `435.98` | constants sound; missing input (R05) |
| 4.9, 5.6 gap passages | `c = 1/100` | `200/e = 73.576`; `√d/log d = 196.2` at `10⁷`, `187.35` at `9·10⁶`; `n ≥ 108`, `n ≥ 201` | sound |
| 5.1, 5.2 | `ℚ(√5)`, `ℚ(i)`, `d = 163`, `ℚ(ζ₅)` | `2.446`, `2.399`, `13.23`, `9.808` (`31.03` with `κ`); `0.8997` | sound |
| 5.4 | `b = 10, 100, 1000`; `x = 10⁶` | `S₃ = 53, 1471, 29425` vs `66.4, 1552.3, 29964.2`; `S₃(10⁶) = 106030594` vs `106028577.08` | sound (R09 slips) |
| 5.6 Theorem 11 control | `ℚ(√−3)`, `d = 163` | `1.108 > 1`, `0.587` | sound |
| 6.1 Vinogradov identity | `ℤ/6` at `x = 1, 2`; `ℤ/2×ℤ/2` | `3/3 = 1`; `0`; `−1` and `1` | sound |
| 6.2 | `X = 2`, `h = 2`, `H = 4`, `p = 101` | `S = 1`, `T = 2`, `4 ≤ 8 ≤ 8`; `B(2) = 3.1667` gives `15.40`; ratio maxima `0.4559`, `0.5656` | sound |
| 6.3 | `ω = 17`; `δ_{ω,ω−5}`; primorials | `1.4619·10¹¹` at `s = 14`, `δ = 0.33587`, `√(q₁⋯q₁₇) = 4.385·10¹⁰`; negative from `ω = 258`; `q₃₅₁ = 2371` | sound |
| 6.4 Grosswald | `p = 409`, `2791` | `21 > 18.22`, `53 > 50.83` | missing hypothesis (R02) |
| 6.5 | `p = 2, 3, 40487`; `X < p` control | `h(2) = 3 > 1.986`, `h(3) = 2 < 2.0673`; `g = 5`, `h = 10`; `111 > 54.77` | sound (R07) |
| 7.1–7.5 | `ℚ(i)`, `x = 100`; `ℚ`, `x = 10⁶`; DKN at `ℚ(i)` | `ψ = 93.933 ≤ 94.763`; Mertens `0.99996`; `λ = 1.9605`, range `2801`, term `9.29·10⁻⁴`; Brun–Titchmarsh `7.088·10⁵ ≥ 78498` | sound |

## Not verifiable

These are recorded in the manifest as `uncertified` or `waived`, or I could read only their abstract.
- `fehnker2026`: the arXiv abstract has no constants.
- `amberger2026`.
- `kadiringwong2019`: the abstract confirms only the `5/2` improvement (`40/(5/2) = 16`), not the repulsion constants `14.144` and `7.072`.
- `kadiring2012` Theorem 4.
- `rademacher1959` Theorem 4. I checked its quotation at `lee2023ideals` lines 173–179 only through the README's numerical Checks.
- `louboutin2000` and `louboutin2001`: read through the quotations in `louboutin2003` and `louboutin2005`, which I verified.
- `friedman1989`: read through `garcialee2022mertens` line 1215.
- `washington1997` Theorem 4.10.
- `ramare2025`, `gglm2026`, `palojarvisimonic2026`, `leenosal2026`, `mcgownsorenson2024`, `chen2022`, `guo2026`, `banks2026siegel`, `banks2026brauersiegel`, `luzamanzhao2026`, `greniemolteni2019`, `bachsorenson1996`, `cullyhugilltrudgian2021`, `tudzi2026`, `odlyzko1976`, `cholemkeoliverzaman2025`.
- Sunley's thesis, which contains the proof of Theorem 1.1.

## Source issues

- **Error** in debaene2019 at Corollary 2 and Theorem 1, pp. 1–3 (lines 73, 113, 122): the source says the factor is `1 + log(Reg_K h_K)` raised to a power, for every field; it should be `1 + log⁺(Reg_K h_K)`, since the base is negative when `Reg h < 1/e` (−0.2687 for the cubic field of discriminant −23); affects a stated result.
- **Gap** in louboutin2015ijnt at Corollary 4, p. 2 (lines 51–59): the source says `ζ_K` has no real zero in `σ ≥ 1 − c₂/log d_K`; it should say no zero of odd multiplicity, since the proof allows a double zero and argues at `1 − 2/log d_K`; affects a stated result.
- **Gap** in kerrmcgowntrudgian2020 at Theorem 2, p. 2 (line 62): the source says the count holds for every `X`; it should require `X < p`, which Lemma 6 needs (`T ⊆ [1, p)`, line 139); affects a stated result.
- **Misprint** in kerrmcgowntrudgian2020 at the abstract and Theorem 1, pp. 1–2 (lines 23, 50): the source says "every/all primes `p`"; it should say odd primes, as line 25 fixes, since `h(2) = 3 > 2^{0.99}`; affects nothing.
