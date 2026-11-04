<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/163#issuecomment-6396769239 -->
Review (claude) of a3ba9c5

Verdict: needs changes

1. **F01** (P2) The modularity hypothesis makes all three Lean headlines weaker than statable

   - **Location.**
     - `packages/KatoEulerSystems/Suggested.lean` lines 39–40, 50–51, 74–75: the q-expansion binder `hmod` of all three theorems.
     - The module docstring, line 11.
     - `packages/KatoEulerSystems/README.md` lines 2280–2284: "Its modularity hypothesis is the existence of `N > 0` and `f : CuspForm …`".
   - **Claim.** Kato's finiteness theorems are stated for W *assuming* that W is modular.
   - **Witness.** README lines 395–397 use R29.6 to choose the newform for these signatures. `EllipticCurveModularity` (merge-order line 186, earlier) states `modularity` for every E/ℚ (its `Suggested.lean` line 142; README §R29.6). So `hmod` always holds.
   - **Detail.** The statements without `hmod` are statable, true, and are what the finished roadmap proves.
   - **Repair.**
     - In `Suggested.lean`:
       - Delete the `hmod` binder from `ellipticCyclotomicFiniteGeneration`, `ellipticRationalPoints_finite` and `ellipticCharacterPoints_finite`.
       - Drop "modular" from their docstrings, and delete the q-expansion clause of the module docstring.
     - In README §7.9:
       - Replace the sentence "Its modularity hypothesis is …" by "No modularity hypothesis is made: `EllipticCurveModularity` R29.6 supplies the attached newform."
       - Delete the zero-cusp-form half of the Check at line 2387; keep the `y² = x³` half.
     - Optionally, for consistency, replace "Let E/ℚ be modular" in 6.6, 7.3, 7.4, 7.7 and 7.8 by "Let E/ℚ be an elliptic curve (modular by `EllipticCurveModularity` R29.6)", and add R29.6 to those *Needs:* lines.
   - **Tested.**
     - A scratch copy with the three binders removed elaborates with `lake env lean`: exit 0, with only the three `sorry` warnings.
     - On 11a1 (`L(E,1) ≈ 0.2538 ≠ 0`, `E(ℚ) ≅ ℤ/5`) the hypothesis-free statement holds. On 37a, `hne` fails, as before.

2. **F02** (P2) 4.1 misstates Loeffler's Theorem 2.3.1: the adelic openness claim is false for k ≥ 3

   - **Location.** `packages/KatoEulerSystems/README.md` lines 1116–1118: "the image of H is open in the group of units of `B ⊗ ℚ̂` whose reduced norm lies in `ℚ̂^×`".
   - **Claim.** `ρ_f(H)` is open in `{x ∈ (B⊗ℚ̂)^× : nrd x ∈ ℚ̂^×}`.
   - **Witness.** README line 1118 gives `det ∈ ℤ_p^(×(k−1))` at almost all p. At k = 3, `[ℤ_p^× : (ℤ_p^×)²] = 2` at every odd p, so the image is not open. Loeffler2017 line 128 uses pairs `(x,λ)`.
   - **Detail.**
     - On H the reduced norm is `κ^(1−k)`. Infinitely many index-2 factors give infinite index in every open subgroup of the README's group.
     - Loeffler's Theorem 2.3.1 (line 289) concerns `(ρ_f, κ)` in the group of pairs with `nrd x = λ^(1−k)`. Remark 1.2.4 (line 198) records exactly this phenomenon.
   - **Repair.** Replace the clause by: "the image of H under `(ρ_f, κ)` is open in Loeffler's group `G(ℚ̂) = {(x,λ) ∈ (B⊗ℚ̂)^× × ℚ̂^× : nrd x = λ^(1−k)}` (Definition 1.2.1, Theorem 2.3.1). In particular, for each p the image of H is open in `{x ∈ (B⊗ℚ_p)^× : nrd x ∈ ℚ_p^×}`."
   - **Tested.**
     - At k = 3 and each prime p, `(ℚ_p^×)²` has finite index in `ℚ_p^×`, so the per-prime clause holds.
     - The adelic clause is Loeffler's.
     - Nothing downstream changes: admissible_of_split uses only the per-prime openness.

3. **F03** (P2) The admissibility hypothesis is missing from 5.6 and from 6.2–6.4

   - **Location.**
     - `packages/KatoEulerSystems/README.md` lines 1621–1635 (5.6): "Uniqueness is 5.5".
     - Lines 1717–1719 and 1725–1726 (6.2): `katoScalarRegulator` is defined as `ℒ_η(loc_p φ_k z^Ka_γ(f*))`, with the canonical map of 5.1.
     - Line 1775 (6.4): "Under 6.2's hypotheses".
   - **Claim.** 5.6 holds for every N, k. 6.2–6.4 hold for every f with a slope `< k−1` root α.
   - **Witness.** 5.5's injectivity needs admissibility (lines 1596–1597), and 5.6 takes its uniqueness from it (line 1635) with no proviso. 6.2 uses `z^Ka` of 5.1, built "Using 4.4", which is unclaimed at inadmissible λ (lines 1311–1313).
   - **Detail.**
     - 5.6 is not about a single (f,λ), so the Layer 5 preamble (line 1447) does not cover it.
     - Layer 6 never states admissibility: a search of lines 1662–1910 for "admissib" finds only Fontaine's "weak admissibility".
     - Refuting instance: a non-CM f at a division-algebra place λ₀ where admissibility fails, which 4.1 (lines 1136–1143) allows. There 6.4 asserts an equality for a class that 5.1 does not construct.
   - **Repair.**
     - In 5.6 add: "provided every newform constituent of `S_k(N)` is admissible at the coefficient places above p (as in 5.5)".
     - Open Layer 6 with: "In 6.2–6.5, `(f,λ)` is admissible (equivalently `(f*,λ)` is: on `G_(ℚ(μ_(p^∞)))` the twist `κ^(1−k)` is trivial, and the contragredient has fixed spaces of the same dimension)".
     - Alternatively, if a route not through 4.4 is supplied, drop the proviso from 5.5 as well.
   - **Tested.** With the proviso, 5.6's uniqueness follows: two solutions differ by d with `per(ω_m(d)) = 0` for all m. Nakamura (19) (Nakamura2023 line 2037) makes `per` injective, and 5.5 gives d = 0.

4. **F04** (P3) Padding: `ellipticRationalPoints_finite` is the m = 1 case of `ellipticCharacterPoints_finite`

   - **Location.** `packages/KatoEulerSystems/Suggested.lean` lines 46–55; README lines 2284–2288.
   - **Witness.** At m = 1, K = ℚ: `ℤ[G] = ℤ` and `I_ψ = 0`, so the part is `E(ℚ)`. A character mod 1 is 1, so the series is `W.LSeries`. README lines 2319–2321 state this as a Check.
   - **Detail.** The theorem therefore mirrors a Check and treats a boundary case.
   - **Repair.**
     - Delete `ellipticRationalPoints_finite` from `Suggested.lean` and its clause from the module docstring.
     - In README line 2284, describe the `K = ℚ, χ = 1` case in prose without the backticked name, so the gate finds no undeclared name. The Check stays.
   - **Tested.** The remaining character theorem at m = 1 gives exactly the deleted statement.

5. **F05** (P3) 4.4 omits ℚ(√−2) from the CM fields inside ℚ(ζ_(2^∞))

   - **Location.** README lines 1309–1311: "`K = ℚ(i)` at `p = 2`, and `K = ℚ(√−p)` for `p ≡ 3 mod 4`".
   - **Witness.** `ζ₈ + ζ₈³ = i√2`, so `ℚ(√−2) ⊂ ℚ(ζ₈)`. A CM form by ℚ(√−2) at p = 2 falls under Kato 15.14 (Kato2004 line 5731), not 15.13.
   - **Repair.** Write "`K = ℚ(i)` or `ℚ(√−2)` at `p = 2`".
   - **Tested.** The imaginary quadratic subfields of `ℚ(ζ_(2^∞))` are exactly ℚ(i) and ℚ(√−2). For odd p, the unique quadratic subfield of `ℚ(ζ_p)` is ℚ(√±p), and it is imaginary iff p ≡ 3 mod 4.

6. **F06** (P3) Checks still name Lean identifiers (the F03 pattern, elsewhere)

   - **Location.** README:
     - line 894 ("Forgetting the range of modularDualExp returns the supplied value");
     - line 2387 ("`a_1 = W.LFunction(1) = 1`");
     - line 2407 ("the bound of katoTamagawaBound (3)");
     - line 2409 ("the union in modularAbelianVariety_cyclotomicFG is `A(ℚ)`").
   - **Witness.** House style: "a Check never names or claims a Lean counterpart". The round-2 finding F03 fixed the same pattern at lines 473, 1167–1170 and 1290–1291.
   - **Repair.** Name the object instead:
     - "the restricted modular dual exponential";
     - "`a_1 = 1` for the elliptic L-function";
     - "the Tamagawa bound of part (3)";
     - "the union of the m-power cyclotomic layers".
   - **Tested.** After the edit, a search of the Checks for camelCase names returns nothing.

7. **F07** (P3) Manifest, References and one page locator still drift from the README (the F07 pattern)

   - **Location.** README References lines 2459–2466, and `packages/KatoEulerSystems/sources.toml` (`Kato2004` locator, `Rohrlich1984` `cited_for`).
   - **Witness.** §8.4 was added to the manifest but not to References. Kato 8.12 (line 720), 15.23 (line 2206) and 17.2 (line 2044) are in neither list. `Rohrlich1984` lists 4.2, which cites only the 1988 paper (line 1192).
   - **Detail.**
     - §7, used in the proof route of 3.4, is also missing from both lists.
     - 5.6 (README line 1636) places Nakamura's (19) on p. 48. It is displayed on p. 46 (Nakamura2023 line 2037) and invoked on p. 48 (line 2120).
   - **Repair.**
     - Add 8.4 (pp. 182–183), 8.12 (p. 186), 15.23 (p. 267) and 17.2 (p. 272) to the References locator list and to the `Kato2004` locator.
     - Set `Rohrlich1984` `cited_for = ["7.9"]`.
     - In 5.6 write "(19), p. 46, used in the proof of Corollary 3.6, p. 48".
   - **Tested.** A search of the README for each first author then matches its `cited_for`.

8. **F08** (P3) Module docstring: process wording and an imprecise missing carrier

   - **Location.** `Suggested.lean` lines 22–23: "The Selmer χ-part still lacks its elliptic Selmer carrier."
   - **Witness.** "still" is process narrative. Tau Ceti `selmerGroup₂` (`TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean` line 104) is an elliptic Selmer group, but it is the 2-Selmer group, finite unconditionally.
   - **Repair.** Write: "The Selmer χ-part (Corollary 14.3(1)) lacks the `p^∞`-Selmer group of E over K; Tau Ceti's `selmerGroup₂` is the 2-Selmer group, finite without any L-value hypothesis."

All seven round-2 findings are repaired (table under *Verified sound*). The round-3 package has 8 findings, 3 of them blocking (P2):

- **R01.** A repair-exposed weakening of the three Lean headlines.
- **R02.** A false paraphrase of Loeffler's adelic theorem in the sampled target 4.1.
- **R03.** The admissibility hypothesis is missing from 5.6 and 6.2–6.4.

The other five findings are P3: padding, a case enumeration, residual patterns of the round-2 findings F03 and F07, and docstring wording.

`Suggested.lean` elaborates at the pins with exactly three `sorry` warnings. The dependency check reports 0 problems.

## Verified sound

### Round-2 findings, one by one

| Id | Status | Repaired passage and check |
|---|---|---|
| F01 | repaired | `design/plan.json` has `"gaps": []`. README lines 356–366 keep only the section contract, ending "in the augmentation ideal for odd p (§9.36)". Every cited section exists in board-main `packages/PadicHodgeRegulators/README.md`: §1.4 line 466, §1.7 line 509, §1.11 line 564, §8.8 line 1483, §§8.13–8.16 lines 1559–1589, §8.18 line 1609, §§8.20–8.22 lines 1640–1671, §§9.31–9.36 lines 2102–2172. §9.36 says "odd p". |
| F02 | repaired | README lines 158–161 now say that Kato's Chern character sends {u,v} to the ordered cup product of the Kummer classes. This is exactly what Kato2004 lines 2583–2591 (pp. 182–183) contain. "c_(2,2)" has no hit. The new 1.1 Check is computed in row 21 of the table below. |
| F03 | repaired at the listed lines | criticalSign and ordinaryEulerFactor have 0 hits. Lines 473–475, 1167–1171 and 1290–1292 name objects. The same pattern elsewhere is R06. |
| F04 | repaired | The `From EllipticCurveModularity` contract is at lines 388–397. R29.4 (head line 1250: `V_r(E) ≃ V_r(F)` with polynomial `X² − a_ℓX + ℓ`, which is `V_λ(f)(1)` in Kato's cohomological normalization), R29.5 (line 1465: `J₀(M) → E`) and R29.6 (line 1599 and "three equivalent formulations") all say what is claimed. The 4.7 route is at lines 1404–1410 and its *Needs:* at 1422–1424; the Scope is at lines 48–50. This repair exposes R01. |
| F05 | repaired | The contract is at lines 399–406; 6.6 is at lines 1837–1846, with Checks at 1878–1884; the *Needs:* of 6.6, 7.4 and 7.8 are updated. Main `TauCetiRoadmap/EllipticCurves/README.md` has Layer 4.5b at line 1013. Layer 7 (lines 1303–1318) defines `Ω(E) = 2∫_(D_W>0) dx/√D_W` over all real components, so the period is "total", as the contract says. |
| F06 | repaired | The docstring (lines 13–26) names 7.4 and 7.6 with their missing carriers. The Layer comment (line 31) matches the README title. README line 2285 now says "`K = ℚ, χ = 1`". The new definition and theorem are checked in rows 6–14. R04 and R01 arise from them. |
| F07 | repaired | `Schneider1985` and `PerrinRiou1990` both have `cited_for = ["7.5, 7.7"]`, matching lines 2078–2079 and 2123–2124. The `Nakamura2023` locator includes A.1, A.3, A.4, A.5 and A.6. Jacquet–Shalika is gone from References; its lifetime key is kept with empty `cited_for`. The residual drift is R07. |

### Elaboration, signatures and probes

- **Elaboration.**
  - `lake env lean` on `packages/KatoEulerSystems/Suggested.lean`, run from the content checkout at the pins (Mathlib `6b7abb3`, Tau Ceti `a91d3aa`), exits 0 in 3.6 s.
  - Exactly three warnings, all `declaration uses sorry`, at lines 38, 49 and 73.
  - The imports are `import Mathlib` and `TauCeti.AlgebraicGeometry.EllipticCurve.Affine.Point.Galois`, whose object file exists at the pin.
  - There is no `set_option`; every declaration is a `theorem`; the one `def` has a real body.
- **`#check @` dump.**
  - All four declarations elaborate in a scratch copy.
  - Each keeps `[W.IsElliptic]` and every explicit binder: `hmod`; `m`/`hm`; `F`, `hF`, `hcont`, `hne`; `[NeZero m]`, `K`, `[IsCyclotomicExtension {m} ℚ K]`, χ.
  - `ellipticCharacterPart` keeps `K : Type u_1`, `[Field K]`, `[DecidableEq K]` and `[Algebra ℚ K]`.
  - No binder is lost and nothing changed. The generality equals README 7.9.
- **One-tactic probes on `ellipticCharacterPoints_finite`.** `simp`, `infer_instance`, `exact Set.toFinite _`, `exact Set.Finite.subset …` and `aesop` all fail, so the theorem is not padding. The padding of `ellipticRationalPoints_finite` is by specialization (R04), not by a single tactic.

### Dependency check (verbatim)

```text
depcheck: 51 roadmaps, 595 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The citation resolver lists no cross-roadmap citation and no Lean name found nowhere.

### Seeded sample (15 targets): locators read in the text

| Target | Locators checked (source line) | Result |
|---|---|---|
| 0.1 | Kato 1.3(1)–(2), pp. 121–122 (lines 212–227); 1.4, p. 122 (lines 241–256: c ≡ 1 mod N, (c,6N) = 1 smoothing); 1.10 (line 331) | sound; the divisor of the auxiliary identity is recomputed (row 25) |
| 0.2 | Kato 1.6, p. 123 (lines 271–284, det action on constants); Lemma 1.7(1)–(2) (lines 285–301: `(α,β)σ`, the a² fibre, c prime to a and the orders) | sound |
| 0.3 | Kato 1.3(3), p. 122; 1.9, p. 124 (lines 321–330: printed exponent with a/(2N²), a misprint) | sound; the correction is right (row 27) |
| 0.4 | Kato Lemma 2.12, p. 131 (lines 606–613: one-coordinate product, A ≥ 1); 2.13, p. 132 (line 614) | sound |
| 1.1 | Kato Prop. 2.3, p. 126 (lines 410–417); proof 2.11, p. 131 (lines 583–604); Weibel2013 Cor. 1.7.1, p. 8 (line 395), Ex. 5.6, p. 46 (lines 2381–2386, slot order handled through §6.9) | sound |
| 2.1 | Kato 8.9, p. 185 (line 2671); Prop. 8.12, p. 186 (line 2715); 13.1, p. 224 (lines 4174–4187, `P_ℓ` with arithmetic Frobenius); Example 13.3, p. 225 (lines 4208–4226: `1 − ā_ℓℓ^(1−r)t + ε̄(ℓ)ℓ^(k+1−2r)t²`) | sound |
| 4.1 | Loeffler2017 Thm 2.2.2, p. 6 (lines 254–263), Def. 1.2.1 (line 128), Thm 2.3.1 (line 289); Ribet1985 Thm 3.1 and 4.1 (now readable through OCR; lines 271, 330); Kato 12.8.1–12.8.2, p. 223 (lines 4131–4141); Rubin Prop. III.5.8, Rem. III.5.10, p. 50 (lines 2298–2321) | **R02**; the rest is sound |
| 4.2a | Kato 12.9, p. 223 (lines 4145–4148: `H²(ℤ[ζ_(p^n),1/p], ℤ_p(1)) ≅ Cl ⊗ ℤ_p`) | sound (rows 38–39) |
| 4.4 | Kato Thm 12.4, p. 221 (lines 4046–4051); 13.8, p. 227 (line 4297); 15.14–15.15, pp. 264–265 (lines 5731–5753); BurungaleTian2025 Thm 2.3, p. 4 (line 182) | sound, apart from **R05** |
| 5.3 | Kato Thm 12.5(1), p. 221 (lines 4052–4071: `(2πi)^(k−r−1)`, ± = `(−1)^(k−r−1)χ(−1)`, minus conjugation) | sound |
| 5.6 | Nakamura2023 Cor. 3.6, pp. 47–48 (lines 2090–2111); (19), p. 46 (line 2037); proof (lines 2114–2120); Lemma 3.4 (lines 2076–2086, stated without admissibility) | the hypothesis is **R03**; the page of (19) is in **R07** |
| 6.1 | Kato Thm 16.4, p. 270 (lines 5932–5956; the (ii) misprint is at line 5952); Rem. 16.5, p. 270 (line 5957); Nakamura2014 Thm 1.5 (lines 194–206, exp* in part (2)) = Thm 3.10 (line 1370); Colmez1998 Thm 7 (lines 306–312) | sound |
| 6.3 | Kato Thm 16.2, p. 269 (lines 5902–5919); `ModularSymbolsPadicLFunctions` §1.3 dictionary (head line 1461) and `ε_(j,χ) = (−1)^(k−j)χ(−1)` in weight k+2 (head line 1389), so ± = `(−1)^(k−r−1)χ(−1)` after k ↦ k−2, j = r−1 | sound |
| 6.4 | Kato 16.2(ii) (line 5918: the two unramified factors); 16.3(1)–(2) (lines 5920–5927); 16.6, p. 271 (lines 5973–5983) | sound |
| 7.4 | Rubin Thm III.5.13, Prop. 5.14, Cor. 5.15, p. 52 (lines 2374–2416); Thm 5.16, p. 53 (lines 2421–2430); Kato 17.2–17.4, pp. 272–273 (lines 6040–6084; 17.4(3) needs p ≠ 2 at line 6081) | sound; the odd-p restriction of the exact divisibility matches the sources |

No author-flagged unverified locator exists.

### Adversarial table

| # | Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|---|
| 1 | Tower FG, m = 1 | `x^(1^n) = 1` | ⇔ x = 1; the field is ℚ; the conclusion is Mordell–Weil over ℚ | holds | none |
| 2 | Tower FG, junk m = 0 | n = 1 | `x^(0^1) = x^0 = 1` for all x ∈ ℂ; `E(ℂ)` is uncountable, not FG | `hm` necessary | none |
| 3 | Tower FG, m = 6 | `6^n ∣ 6^(n+1)` | the layers are nested; the union contains ζ₄ and ζ₉ | holds (Kato 14.4, any m ≥ 1) | none |
| 4 | `hmod` | 11a1; ECM `modularity` | `L(E,1) ≈ 0.2538`, `E(ℚ) ≅ ℤ/5`; modularity holds for every E/ℚ | always true, removable | R01 |
| 5 | Rank-zero `hne` | 37a | `L(E,1) = 0`, rank 1 | `hne` necessary | none |
| 6 | Character part, m = 1 | K = ℚ, χ mod 1 | `ℤ[G] = ℤ`, the evaluation n ↦ n has kernel 0, so the part is `E(ℚ)`; χ(n) = 1 | equals the rational theorem | R04 |
| 7 | Character part, quadratic | ℚ(ζ₃), χ(2) = −1 | `a + bσ ↦ a − b`, kernel `ℤ(1+σ)`; fixed point of order 3: `2P ≠ 0`; fixed point of order 2: `2P = 0` | Check correct | none |
| 8 | Character part, quartic | m = 5, χ(2) = i | `σ₂² = σ₄`, χ(4) = −1, `1 + σ₄ ↦ 0`; the inverse convention gives −i | Check correct | none |
| 9 | Character orientation | `autEquivPow` (Gal.lean line 77: σμ = μ^k) vs Kato lines 4604–4607 (a ↦ σ_a) | ψ(σ_a) = χ(a) on both sides | agree | none |
| 10 | χ vs χ̄ | `a_n ∈ ℤ` | `L(E,χ̄,1) = conj L(E,χ,1)` | `hne` is convention-free | none |
| 11 | Imprimitive m ≡ 2 mod 4 | m = 6, factor at 2 | `|χ(2)/2| = 1/2 ≠ 1/√2` (roots of `1 − a₂X + 2X²`); multiplicative `1 ∓ χ(2)/2 ≠ 0`; additive 1 | extra factor nonzero | none |
| 12 | Removed factor, trivial χ mod 5 | `a₅ = 1`; split; nonsplit | `1 − 1/5 + 1/5 = 1`; `4/5`; `6/5` | Check correct | none |
| 13 | Abelian K ⊂ ℚ(ζ_m) | inflation | the image of `I_(ψ∘res)` in `ℤ[Gal(K/ℚ)]` lies in `I_ψ`, so `E(K)^(ψ) ⊂ E(ℚ(ζ_m))^(ψ∘res)` | the cyclotomic case covers it | none |
| 14 | Padding probes | 5 tactics | all fail (logged errors) | not padding | none |
| 15 | 6.6, two components | `y² = x³ − x` | Δ = 64 > 0; `x = −1/t` sends `(−1,0)` to `(1,∞)`, `dx/√(x³−x) = dt/√(t³−t)` | `Ω = 2Ω⁺` | none |
| 16 | 6.6, one component | `y² = x³ + x` | Δ = −64 < 0, one real root | `Ω = Ω⁺` | none |
| 17 | Euler-system ratio | `r⁺ = 3, Ω⁺ = 2, c_∞ = 2` | 3/2 vs 6/4 = 3/2; the period alone gives 3/4 | preserved | none |
| 18 | 7.8 valuation | c_∞ = 2 | ord₃ unchanged; ord₂ shifts by −1 | odd p protected | none |
| 19 | Supplier period | EllipticCurves line 1315 | `D_W = 4x³ − 4x`; the integral runs over `D_W > 0` = both components | "total" is correct | none |
| 20 | Rubin's period | Rubin2000 line 2245 | "fundamental real period"; it differs by c_∞ ∈ {1,2} | a p-unit for odd p | none |
| 21 | Chern sign Check | `(𝔾_m)²`, mod 3 | `ch{x,y} = e₁∪e₂ = 1`; `ch{y,x} = −1 = 2`; `ch{1,y} = 0` | correct | none |
| 22 | 0.1 smoothing | c = 5, fixed index | `25g − g = 24g`; with c in place of c²: `5g − g = 4g` | correct | none |
| 23 | 0.1 independence | c = 5, 7 | `48·24g = 1152g = 24·48g` | correct | none |
| 24 | 0.1 integral c-units | g = 1 | 24 ≠ 48 | only the rationalized unit is c-free | none |
| 25 | 0.1 theta identity | divisors | both sides `c²d²(0) − d²E[c] − c²E[d] + E[cd]` | symmetric, correct | none |
| 26 | 0.2 row action | `(1/5,0)` | upper shear gives `(1/5,1/5)`; lower shear fixes it | matches Kato 1.7(1) | none |
| 27 | 0.3 exponent | x = 0, 1/2, 2/5 | 1/12, −1/24, −11/300; the missing-square version gives −23/300 | Kato 1.9 misprint confirmed | none |
| 28 | 0.3 cusp order | c = 11, index (0,1/5), width 5 | `(121−1)/12 = 10`; order 50 in `q^(1/5)` | width factor needed | none |
| 29 | 0.4 count | A = 4 | 4 roots β′ vs 16 pairs | matches Kato 2.12 | none |
| 30 | 1.1 prime sets | (2,3) → (6,9) | first index {2} → {2,3}; ℓ = 3 divides N | ramified branch of 1.2 | none |
| 31 | 1.1 norm vs trace | `ℚ(i)/ℚ` | N(2+i) = 5, Tr = 4; N(1+i) = Tr(1+i) = 2 | Check correct | none |
| 32 | 2.1 polynomial | k = 2, r = 1, ℓ = 3, a = 2 | `ℓ^(−r) = ℓ^(k−1−2r) = 1/3`; `1 − (2/3)X + (1/3)X²` | matches Kato 13.3 | none |
| 33 | 2.1 domain | Kato lines 4180–4182, 4213–4214 | Σ = prime(cdpAN); S = {m : prime(m) ∩ Σ = {p}} | matches | none |
| 34 | 4.1 adelic openness | k = 3, odd unramified p | `[ℤ_p^× : (ℤ_p^×)²] = 2` at infinitely many p | not open | R02 |
| 35 | 4.1 per-prime openness | k = 3 | `(ℚ_p^×)²` has finite index in `ℚ_p^×` | open | repair of R02 |
| 36 | 4.1 unipotent | x = 2 over ℤ; x = 0 | `τ−1: (v₀,v₁) ↦ (2v₁,0)`, cokernel `ℤ/2 ⊕ ℤ`; x = 0 has a 2-dimensional fixed space | Checks correct | none |
| 37 | 4.1 division place | d ≠ 1 | d − 1 invertible; the ℚ_p-span of an open subgroup of `SL₂(ℤ_p)` is `M₂(ℚ_p)`, which has zero divisors | Kato 12.8.2 fails there | none (source issue) |
| 38 | 4.2a Check, `ℤ_p(1)` | p odd | one place above p, totally complex, so `Br(ℤ[ζ_(p^n),1/p]) = 0`; Pic restricts to 0 locally | kernel is the class-group limit | none |
| 39 | 4.2a Check, `ℤ_p(2)` | p odd | `T^∨(1) = ℚ_p/ℤ_p(−1)`; `G_(ℚ_p)`-invariants 0; `G_(ℚ_p(μ))`-invariants everything, so `H²_Iw = ℤ_p` | correct | none |
| 40 | 4.4 CM fields | p = 2 | `ζ₈ + ζ₈³ = i√2`, so ℚ(√−2) ⊂ ℚ(ζ₈) | list incomplete | R05 |
| 41 | 4.4 vs Kato 12.4 | (1)–(3) | torsion / torsion-free and rational rank 1 / free when p ≠ 2 and the residual representation is irreducible | match | none |
| 42 | 4.7 route | F = ℚ, Γ = 1 | dim B = 4 = dim M₂(ℚ); `(u−1)(a,b) = (b,0)`; `[GL₂:H] = [SL₂:H∩SL₂]` when `det H = ℤ_p^×` | correct | none |
| 43 | 5.3 sign | (2,1) even; (4,2) even | +1; −1; twists 1 and 2 | correct | none |
| 44 | 5.6 hypothesis | 5.5 proviso | 5.5 is conditional; 5.6 is stated unconditionally from it | missing | R03 |
| 45 | 6.1 Gauss sum | χ mod 3 | G = i√3, G⁻¹ = −i/√3, G/G⁻¹ = −3 | correct | none |
| 46 | 6.1 factor in (ii) | r = 1 | `(p^(−r)φ)^(−1)p^(−1) = p^(r−1)φ^(−1)`, which is `φ^(−1)` at r = 1 | correct | none |
| 47 | 6.3 conversion | χ mod 3 | `G² = −3 = χ(−1)·3`; powers (2πi)⁰ vs (2πi)⁻¹, ratio `(2πi)^(k−1)` | correct | none |
| 48 | 6.4 CM Check | `y² = x³ − x`, p = 3 | 4 points, `a₃ = 0`, `α² = −3`, `α⁻¹ = −α/3`, `(1+α/3)² = 2/3 + 2α/3`; α = 2 forces `a₃ = 7/2` | correct | none |
| 49 | 6.4 multiplicative | α = 1; α = −1 | factors 0 and 2 | correct | none |
| 50 | 7.4 Coleman multiplier | nonsplit, p = 5 | `(1−α⁻¹)/(1−β⁻¹) = 2/(6/5) = 5/3` | not automatically 0 | none |
| 51 | 7.4 at p = 2 | Kato 17.4(3) | needs p ≠ 2 (line 6081) | the exact divisibility is rightly not claimed | none |
| 52 | 7.9 Tamagawa Check | z = p⁻¹ | `[O:z] = [O:pO]⁻¹ < 1 ≤ #H²` | Check correct | none |
| 53 | 4.5 regular annihilator | μ = p | Λ/(p) is killed by p and is infinite; `R/pR` has p-torsion | hypothesis needed | none |
| 54 | 4.6 twist | κ(γ) = 4 over ℚ₃ | `φ₁(γx) = (1/4)γφ₁(x)` | correct | none |
| 55 | 3.2 normalization | `E^(4)_(0,0)` | `3!·2ζ(4)/(2πi)⁴ = 12π⁴/(90·16π⁴) = 1/120` | correct | none |
| 56 | 3.2 Fourier | N, k = 3 | double transform = N²; `N^(k−2)N^(−k)N² = 1`; the wrong power gives N⁴ | correct | none |
| 57 | 3.3 smoothing exponents | k = 2, r = 1, c = 5, d = 7 | (u,v) = (1,1); 25 − 5 = 20; 49 − 7 = 42 | correct | none |

### Duplication and ownership (by object; open roadmap pull requests through `roadmaps grep`, 362 heads, and board main)

- **`ellipticCharacterPart`.**
  - No other roadmap defines Kato's annihilator χ-part of elliptic points.
  - `EulerSystemsCyclotomicMainConjecture` (open head) has `chiPart` as the tensor quotient `M ⊗_(ℤ_p[Δ]) ℤ_p(χ)` for p-adic modules. That is a different object; Kato p. 236 relates the two up to bounded exponent.
  - No `Suggested.lean` declares the same fully qualified names.
- **Character-part finiteness and rank-zero finiteness.** A search of all `Suggested.lean` files for `Finite W.toAffine.Point`, `W.LSeries` and `ellipticCharacter` finds only `EllipticCurves` `finite_point` (finite fields) and an unrelated `Polylogarithms` definition.
- **Modularity.** It is owned by `EllipticCurveModularity` R29.6; this roadmap should consume it (R01).
- **Serre's open image for E/ℚ (4.7).** This roadmap is the earliest owner. `EllipticCurveModularityImaginaryQuadratic` (later, merge-order line 254) states the mod-p form over number fields (`nonCM_elliptic_large_residual_primes`). This is a note for that later roadmap, not a defect here.
- **Pinned carriers.** The p^∞-Selmer and Ш carriers are absent at the pins, so the docstring is right not to state 7.3/7.8's Ш or the Selmer χ-part:
  - Tau Ceti `selmerGroup₂` is the 2-Selmer group;
  - Mathlib `ContinuousCohomology.tateShafarevich` (`Sha.lean` line 71) needs a `TopRep` of `E(ℚ̄)`, whose continuity is not at the pin.

### Supplier citations resolved this round

- **`PadicHodgeRegulators`** (board main): 18 sections (F01 row).
- **`EllipticCurveModularity`** (open head): R29.4–R29.6, plus `Suggested.lean` `modularity`.
- **`EllipticCurves`** (main): Layers 1, 4, 4.5b, 6 and 7.
- **`EulerSystemsAndKolyvaginSystems`** (open head): §§2.1, 2.2, 2.4, 2.5, 4.3, 4.17, 8.2, 8.3, 8.6, 8.7, 8.16, 8.37–8.39, at their numbers (lines 1556–5849).
- **`SelmerIwasawaCohomology`**: §§0.7–0.11, 2.7, 2.8, 2.8a, 2.12, 2.12a, 2.15, 2.19–2.21, 3.0–3.3, 3.5–3.7, 3.9–3.11, 3.13, 3.15, 3.18–3.21, 4.9, 4.26 (§3.18 fixes odd p for the applications, as 7.6 says).
- **`ArithmeticGaloisDuality`**: §§R02.1.2, R02.2.1–R02.2.3, R02.4.2–R02.4.4, D7.3–D7.4.
- **`ModularSymbolsPadicLFunctions`**: §§0.2, 0.7, 0.8, 1.1–1.3, 2.5, 3.0, 3.2, 3.3.

### Pinned library declarations opened

| Declaration | File and line at the pin |
|---|---|
| `WeierstrassCurve.pointGaloisAction` (coordinate action, `[W.IsElliptic]`) | `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean` line 47 |
| `IsCyclotomicExtension.autEquivPow` (σ ↦ k with σμ = μ^k) | `Mathlib/NumberTheory/Cyclotomic/Gal.lean` line 77 |
| `Polynomial.cyclotomic.irreducible_rat` | `Mathlib/RingTheory/Polynomial/Cyclotomic/Roots.lean` line 190 |
| `MonoidAlgebra.lift`; the structure `MonoidAlgebra` with `coeff` | `Mathlib/Algebra/MonoidAlgebra/Basic.lean` line 232; `Defs.lean` line 76 |
| `WeierstrassCurve.LFunction`, `LSeries` (local minimal model, line 44) | `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` lines 79, 84 |
| `IsCyclotomicExtension` | `Mathlib/NumberTheory/Cyclotomic/Basic.lean` line 74 |
| `ContinuousCohomology.tateShafarevich` | `Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean` line 71 |
| `WeierstrassCurve.Affine.selmerGroup₂` | `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean` line 104 |

## Not verifiable

- **Paywalled.** `Rohrlich1984`, `Rohrlich1988`, `Ribet1980`, `PerrinRiou1990`, `PerrinRiou1994`, `Schneider1985`, `BlochKato1990` and `DiamondShurman2005` are settled as uncertified and cited by locator. `FontaineMessing1987` is waived. `JacquetShalika1976` is no longer cited.
- **Nakamura2023.** Only arXiv v2 was read; the README uses v2 numbering throughout.
- **5.4's factor `(2πi)^(1−k)`.** This was not decided, as in round 2. It depends on the Betti normalization of the twist in Nakamura's Lemma A.3.
- **Sign exponent of Kato 16.2(i).** It is garbled in the extraction (line 5913). It was checked only through 16.2(ii) and 12.5(1).
- **`H¹(GL₂(ℤ₂), (ℚ₂/ℤ₂)²) ≠ 0`.** This claim of 4.7 was not recomputed.

## Source issues

- **Misprint** in Kato2004 at 1.9, printed p. 124: the source says the last term of the leading q-exponent is `a/(2N²)`; it should be `a²/(2N²)`, so that the exponent is half of `B₂(a/N)`; affects nothing.
- **Error** in Kato2004 at Remark 12.8, (12.8.2), p. 223: the source says the image contains an open subgroup of `SL₂(ℤ_p)` at every coefficient place of a non-CM form; it should be restricted to places where Momose's quaternion algebra splits, since a division algebra contains no `M₂(ℚ_p)`; affects a stated result.
- **Misprint** in Kato2004 at Theorem 16.4(ii), p. 270: the source says the auxiliary vector lies in `D_crys` of the form's own representation; it should be `D_crys(V*(1))`, the space containing η; affects nothing.
- **Misprint** in Kato2004 at Theorem 14.5(3), p. 236: the source says the exceptional condition (12.5.1) of Theorem 12.5(4) is assumed; it should be the image condition (12.5.2), on which 14.14 rests; affects nothing.
- **Error** in Rubin2000 at Proposition III.5.1, draft p. 48: the source says the logarithm maps `E₁(ℚ_p)` onto `pℤ_p` for every p; it should exclude p = 2, where `y² + xy = x³ + 1` has image `4ℤ₂`; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a3ba9c5", "job": "REV-PKG-KatoEulerSystems~3", "model": "opus", "worker": "fable-rev108"} -->
