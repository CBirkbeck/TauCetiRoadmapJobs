# Review of AnalyticNumberTheoryPartI (pull request #1126 at e22e67a)

**Verdict:** needs changes

## R01 (P2) — The exception-free corollaries the README sells downstream are statable but absent from `Suggested.lean`

**Location.** `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:15`: "It also owns the effective consequences drawn here: … the exception-free bounded-height Landau–Page theorem (§0.6), the character prime-number estimate without an exceptional term (§§0.18, 0.28) …". See also README lines 3376–3380 and `Suggested.lean` lines 9–40 and 50–286.

**Claim.** README lines 15 and 3376–3380 make §§0.6, 0.18, 0.28 and 2.13 the owned outputs of §0.34 that later roadmaps consume. `Suggested.lean` states §§0.9, 0.32 and 1.2 from that list, but not these four, and its docstring doesn't say why. All four are statable at the pins. §0.18 matters most: it is the uniform character PNT with no `x^β/β` term, the direct consequence of §0.34. The stated Siegel–Walfisz does not imply it outside `q ≤ (log x)^B`.

**Witness.** README line 3379: "SieveMethodsAndPrimePatterns: its small-conductor and Bombieri–Vinogradov estimates, through §§0.18 and 0.32". The three statements below elaborate under `lake env lean` against the pinned Mathlib and Tau Ceti (scratch file, only `sorry` warnings).

**Repair.** Add to `Suggested.lean`, with the README's effectivity sentence in each docstring:

```lean
/-- §0.18: no exceptional term. -/
theorem character_psi_le :
    ∃ c C X₀ : ℝ, 0 < c ∧ 0 < C ∧ ∀ (N : ℕ) [NeZero N] (χ : DirichletCharacter ℂ N),
      χ.IsPrimitive → χ ≠ 1 → ∀ X : ℝ, X₀ ≤ X →
        ‖∑ m ∈ Finset.Icc 1 ⌊X⌋₊, χ m * (ArithmeticFunction.vonMangoldt m : ℂ)‖ ≤
          C * X * Real.exp (-c * Real.log X / (Real.sqrt (Real.log X) + Real.log N)) *
            Real.log N ^ 4 := by
  sorry

/-- §0.6: no exceptional zero in the bounded-height family. -/
theorem landau_page_bounded_height :
    ∃ c : ℝ, 0 < c ∧ ∀ T : ℝ, 2 ≤ T → ∀ (q : ℕ) [NeZero q], (q : ℝ) ≤ T →
      ∀ χ : DirichletCharacter ℂ q, χ.IsPrimitive → ∀ ρ : ℂ,
        DirichletCharacter.LFunction χ ρ = 0 → |ρ.im| ≤ T → ρ.re ≤ 1 - c / Real.log T := by
  sorry

/-- §2.13, through `h⁺(D) log ε_D = 2 h R`. -/
theorem real_quadratic_classNumber_regulator_lower :
    ∃ c : ℝ, 0 < c ∧ ∀ (K : Type) [Field K] [NumberField K] [NumberField.IsTotallyReal K],
      Module.finrank ℚ K = 2 →
        c * Real.sqrt |(NumberField.discr K : ℝ)| / Real.log |(NumberField.discr K : ℝ)| ≤
          NumberField.classNumber K * NumberField.Units.regulator K := by
  sorry
```

State §0.28 the same way on `TauCeti.Multiquadratic.fundamentalDiscriminantChar (fundamentalDiscriminant d)`, and add the identity `h⁺(D) log ε_D = 2hR` to the README's §2.13. Tested: at ℚ(√5), `hR = 0.4812` and `√5/log 5 = 1.389`, so any `c ≤ 0.346` works. At `T = 2` only `ζ` qualifies, and its first zero has height 14.13. §0.18's `x^β/β` is absorbed because `(1−β) log N ≥ c_LS` (README:565).

## R02 (P3) — §0.34a's Lean is weaker than its README statement and than what its consumer uses

**Location.** `Suggested.lean:62–67`, `quadratic_character_kronecker`, concludes only "`∃ d : ℤ, Squarefree d ∧ d ≠ 1 ∧ |d| ≤ q ∧ ∀ p … p ≠ 2 → ¬ p ∣ q → χ p = jacobiSym d p`". README:852 says instead: "`χ` … is the complexification of Tau Ceti's `fundamentalDiscriminantChar D`, transported to level `q`, for the fundamental discriminant `D=χ(−1)q`".

**Claim.** The acceptance test checks only the README's "in particular" clause. It doesn't pin `D = χ(−1)q`, fundamentality, or the identification with Tau Ceti's character. QuadraticCharactersAndReduction §1.4 consumes exactly that identification.

**Witness.** QuadraticCharactersAndReduction at its open head (#1904), README line 115: "AnalyticNumberTheoryPartI §0.34a gives `D = χ(−1) · χ.conductor`". The full form is statable at the pin: `TauCeti.Multiquadratic.fundamentalDiscriminantCharCast` (Tau Ceti `NumberTheory/Multiquadratic/FundamentalDiscriminant/Realization.lean:32`).

**Repair.** State the README form (it elaborates at the pins; scratch file):

```lean
theorem quadratic_character_eq_fundamentalDiscriminantChar :
    ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q), χ.IsPrimitive → χ.IsQuadratic → χ ≠ 1 →
      let D : ℤ := if χ (-1) = 1 then (q : ℤ) else -(q : ℤ)
      ∃ hD : Int.IsFundamentalDiscr D, ∀ n : ℤ,
        χ (n : ZMod q) = TauCeti.Multiquadratic.fundamentalDiscriminantCharCast ℂ D hD
          (n : ZMod D.natAbs) := by
  sorry
```

Keep the current theorem as the README's "in particular" if wanted. Checked: `q = 12` gives `D = 12`, with `χ₁₂(5) = (12/5) = −1`. `q = 8` gives the two characters `D = ±8`.

## R03 (P3) — `besselK_neg` and `besselK_one_half` are padding, and `besselK` serves no headline

**Location.** `Suggested.lean:536–548`: `def besselK`, `theorem besselK_neg`, `theorem besselK_one_half`.

**Claim.** `besselK` occurs nowhere else in the file. Its two theorems are API bullets of §2.1a: a symmetry lemma, and the closed-form value at order `1/2`, which is the general form of the README Check "`K_(1/2)(1)=√(π/2)/e`". `Suggested.lean` is not an API catalogue, and a definition stays only if a headline needs it.

**Witness.** `grep -n besselK Suggested.lean` hits only lines 536–548. Neither theorem is a deep result of the roadmap, and neither appears among the README line 5 headlines except as "the K-Bessel kernel".

**Repair.** Delete `besselK_neg` and `besselK_one_half` from `Suggested.lean`; README §2.1a keeps both. Keep `besselK` only if a headline uses it. The natural one is §2.1b's `completed_eisenstein_fourier` (see R04), statable on `besselK`, `completedRiemannZeta` and `Nat.divisors`. Otherwise delete `besselK` too.

## R04 (P3) — About 90 backticked names of this roadmap's own are not declared in `Suggested.lean`

**Location.** README:5: "Its definitions serve those statements. Other API names below specify library targets." Examples: README:169 `ExceptionalRealZero.iff`, :194 `theta_ap.sum`, :496 `riemann_xi.entire`, :740 `dirichletRayEquiv`, :938 `mobius_vaughan_identity`, :1146 `core_stokes`, :1192 `completed_eisenstein_fourier`, :1232 `artinAnalyticConductor`, :1973–1977 `ArtinHolomorphy`, `ArtinHolomorphy.of_dim_one`, :1999–2003 `DedekindERH`, `HeckeGRH`, `DedekindERH.of_abelian`.

**Claim.** An API bullet may carry a backticked Lean name only when `Suggested.lean` declares it; a backticked name of this roadmap's own is a claim that it does. A mechanical scan finds about 90 such names not declared in `Suggested.lean` and absent from both pinned libraries (list under Verified sound). A consumer already treats one as a declaration: AutomorphicSpectralTheory (#925) README line 101 cites "its completion … with Fourier expansion `completed_eisenstein_fourier`" from this roadmap.

**Witness.** `grep -c completed_eisenstein_fourier Suggested.lean` gives 0. `DirichletGRH` is declared, while its §2.41–2.42 counterparts (`ArtinHolomorphy`, `DedekindERH`, `HeckeGRH`) are not, and are not statable without continued Artin and Dedekind functions.

**Repair.** Write these labels without backticks (prose labels), delete the last sentence of README:5, and declare in `Suggested.lean` the statable headline among them, at least `completed_eisenstein_fourier` (R03).

## R05 (P3) — Thirteen relative links resolve to no file, LFunctions and ZerosOfLFunctions links point at a fork, and three cited supplier API names do not exist

**Location.** README:3470 `[R19]: ../GlobalNumberFields/README.md#layer-9-hecke-and-ray-class-characters`, likewise R20–R22, R24–R26, R35 and R43–R46. README:3460 `[R9]: https://github.com/roed-math/TauCetiRoadmap/blob/e632e3a…/TauCetiRoadmap/LFunctions/README.md`, likewise R10–R18, R52 and R57. README:84: "`IsExceptionalZero`, `.unique`, `.divisor_eq_one`, `.sq_eq_one`".

**Claim.** On main, GlobalNumberFields, NumberFieldArithmetic and Chebotarev are under `Completed/`, so these 13 relative links are dead. LFunctions and ZerosOfLFunctions are on main under `TauCetiRoadmap/`, but the README links frozen commits of a personal fork, so the cited text can drift from main. ZerosOfLFunctions 6.3 on main states uniqueness, multiplicity one and reality in prose and names no `.unique`, `.divisor_eq_one` or `.sq_eq_one`.

**Witness.** Link resolution (scratch script): "MISSING FILE [R19] -> ../GlobalNumberFields/README.md#layer-9-…", 13 such lines. Main's `Completed/GlobalNumberFields/README.md:508` has "### Layer 9: Hecke and ray class characters". ZerosOfLFunctions README (main) lines 1077–1086.

**Repair.** Point R19–R22, R24–R26, R35 and R43–R46 at `../../Completed/<Name>/README.md#…`; the anchors exist there. Point R9–R18, R52 and R57 at `../LFunctions/README.md#…` and `../ZerosOfLFunctions/README.md#…`. At README:84, describe 6.3's API as main states it: at most one exceptional `β`, of multiplicity one, for a real character, with `β ≥ 1/2`.

## R06 (P3) — "QuadraticCharactersAndReduction §Q2" does not exist

**Location.** README:15: "QuadraticCharactersAndReduction §Q2 consumes it". README:3378: "its §Q2 classification of primitive real characters".

**Witness.** QuadraticCharactersAndReduction at its open head (#1904) has Layers 1–4. Its §1.4, "The primitive discriminant of a real character", is the section that consumes §0.34a ("*Needs:* AnalyticNumberTheoryPartI §0.34a", its README line 129).

**Repair.** Write "QuadraticCharactersAndReduction §1.4" at both places.

## R07 (P3) — Two locators do not support what they are cited for (§2.18a, and §0.16's finite input)

**Location.** README:1621: "See [98], Chapter VII §10; [53][R53], §§22.1–22.4, pp.127–129." README:541: "Source: [47][R47], §6, pp.369, 372, and [Ramaré–Rumely][RR-primes], Theorem 2.1.1, p.399, at the primitive conductors 1, 4 and 8."

**Claim.**
- (a) Kedlaya pp.127–129 covers less than §2.18a. It defines only the incomplete Artin `L`-function of `K/ℚ` (ramified factors in a parenthesis), proves Artin's rational induction (Theorem 22.3), and gives continuation only to a neighbourhood of `Re s ≥ 1` (Theorem 22.4). It states neither the ramified induction formula nor Brauer's continuation to `ℂ`, so those rest on Neukirch VII §10, cited without proposition numbers.
- (b) The theta clause of `ModEightFiniteInput` (`|θ(x;a,8)−x/4| ≤ 0.002811x/4` from `x = 10^10`) is Ramaré–Rumely Theorem 1 with Table 1. Theorem 2.1.1 is the GRH(10000) verification, which supports only the zero clause. Bennett–Siksek p.369 states only the derived interval difference.

**Witness.** `kedlayaant` lines 5352–5361 (p.128, "we only allow p to run over unramified primes") and 5406–5421 (Theorems 22.3–22.4). `ramarerumely1996` lines 107–109 (Theorem 2.1.1: GRH(10000) for conductor ≤ 13) and 1374–1385 (Table 1, p.419: the `k = 8` row has `.002811` at `x₀ = 10^10`).

**Repair.**
- (a) Give Neukirch's numbered statements in Chapter VII §10 for the induction formula and for Brauer's meromorphic continuation, and cite Kedlaya only for the `K/ℚ` definition, Conjecture 22.2 and Theorem 22.4.
- (b) Add "Ramaré–Rumely, Theorem 1, p.398, and Table 1, p.419 (`k = 8`, `x₀ = 10^10`)" for the theta clause.

## R08 (P3) — Process wording and undefined labels

**Location.** README:920: "Use the authorized Koukoulopoulos". README:2968: "supplies the exact ES.0 request for every `M>0`". README:3162: "the finite weight computation here supplies the previously external step". Labels used without expansion: KP (885, 3055), LOW (1919, 2087), CKMP (3246), GHS (1015, 3071, 3075, 3356), BMOR (258), and the roadmap abbreviations ADS (818, 940, 1491, 1754) and GNF (1768).

**Claim.** "authorized", "request" and "previously external" are pipeline narrative. "ES.0" is an identifier from another document. The author-initial labels and the roadmap abbreviations are never defined, and cross-roadmap citations must name the roadmap.

**Witness.** The References list keys works by number ([47]…[115]) and a few names (BBR, Nemes, Meurman); none of KP, LOW, CKMP or GHS appears there.

**Repair.**
- Delete "authorized".
- Replace README:2968 with the statement it means, for example "for every `c>0` this gives `τ(n) ≤ C n^(1/(64c))`".
- Write "supplies the step that Shiu's printed proof leaves to a sieve text".
- Expand each label at first use ("Koymans–Pagano [51]", "Lemke Oliver–Wang–Wood [66]", "Chan–Koymans–Milovic–Pagano [92]", "Granville–Harper–Soundararajan [85]", "Bennett–Martin–O'Bryant–Rechnitzer [48]") and write ArithmeticDirichletSeries and GlobalNumberFields in full.

## R09 (P3) — The pull-request description's Dependencies and merge-order paragraph contradict the README and the merge order

**Location.** Pull-request description: "Dependencies (cited in the README by roadmap name and section …): … #792 (AdelicAlgebraicGroups) … #924 (AutomorphicLFunctionsAndLocalFactors), #925 (AutomorphicSpectralTheory)". Merge-order paragraph: "… → #924 (AutomorphicLFunctionsAndLocalFactors) → **this pull request** (#1126)".

**Claim.** The README cites none of the 30 roadmaps the description lists as dependencies. Several are later in the merge order. Two (AnalyticNumberTheoryPartII and SieveMethodsAndPrimePatterns) are named as consumers in the README (lines 17, 3374, 3379), and AdelicAlgebraicGroups and AutomorphicSpectralTheory consume it at their heads.

**Witness.** Each of the 30 names occurs 0 times in the README. ORDER.txt puts AnalyticNumberTheoryPartI at line 49, before AnalyticNumberTheoryPartII (50), AdelicAlgebraicGroups (51), SieveMethodsAndPrimePatterns (56), ArithmeticGaloisRepresentations (57), AutomorphicFormsOnReductiveGroups (59), AutomorphicLFunctionsAndLocalFactors (93) and AutomorphicSpectralTheory (95).

**Repair.** List the README's actual suppliers, all on main: ArithmeticDirichletSeries, ImaginaryQuadraticClassNumber, LFunctions, ZerosOfLFunctions, GlobalNumberFields, NumberFieldArithmetic, ClassFieldTheory, LocalFieldsRamification, RepresentationTheory, FuchsianOrbifolds, DifferentialGeometry, IntegralLattices, Multiquadratic, ContourIntegration and Chebotarev. Drop the merge-order chain, since no open pull request is a supplier.

## Verified sound

**Gate, build and form.**
- The worker's gate at this head passes every check (`build=0 … OK`). Nothing changed outside the folder, and the folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.
- `lake env lean TauCetiRoadmap/AnalyticNumberTheoryPartI/Suggested.lean` exits 0 in 9 s with exactly 56 `declaration uses sorry` warnings and nothing else.
- The form is right: one `import Mathlib` plus four existing `TauCeti.*` modules, no `set_option`, no `lemma`, no sorry'd data. The module docstring names the not-statable carriers (§2.18a Artin functions, §2.1c Nielsen surfaces).

**Dependency check (re-run).** `depcheck: 237 roadmaps, 2427 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. Every supplier the README cites is on main.

**One-tactic probe.** I replaced every `sorry` in a scratch copy with `first | (simp <;> done) | rfl | infer_instance | decide`. All 56 fail, each at its own line, so nothing closes in one tactic. Padding is only R03.

**Binder check.** Compared the worker's elaborated signatures (106 entries, 0 flagged) with the source. The only section `variable`s, `{K} [Field K] [NumberField K]` in `section Hecke`, are retained by `heckeFiniteFactor`, `heckeArchFactor`, `heckeConductorScale` and `heckeContinuation`. Every other declaration carries its binders explicitly.

**Conventions at the pin.**
- Tau Ceti `ramificationGroup G S i := Ideal.inertia G (maximalIdeal S ^ (i+1).toNat)` (`RingTheory/LocalRing/RamificationGroup.lean:118`). So `i = 0` is inertia and `i = 1` is wild inertia, and `lowerArtinConductor`'s `Σ_{i≥0}` matches Serre VI.
- `complexUnitsCharacter s k z = |z|^s (z/|z|)^k` (`Analysis/SpecialFunctions/Complex/ArchimedeanCharacter.lean:247`) and `normPow s ↦ complexExponent = 2s` (`HeckeCharacter/InfinityType.lean:426`). So `complexExponent/2` in `heckeArchFactor` is the `it_w` of `Γ_ℂ(s+it_w+|k_w|/2)`.
- `realUnitsCharacter s ε = |x|^s sgn^ε` (line 112) matches `Γ_ℝ(s+it_w+ε_w)`.

**Library declarations opened at the pins.**
- Mathlib: `Matrix.posSemidef_gram` (`Analysis/InnerProductSpace/GramMatrix.lean:83`), `Matrix.det_gram_ne_zero_iff_linearIndependent` (:126), `Polynomial.resultant_eq_zero_iff` (`RingTheory/Polynomial/Resultant/Basic.lean:912`), `MvPolynomial.schwartz_zippel_totalDegree` (`Algebra/MvPolynomial/SchwartzZippel.lean`), `Matrix.det_le` (`LinearAlgebra/Matrix/AbsoluteValue.lean:43`), `Summable.hasProdUniformlyOn_one_add` (`Analysis/Normed/Module/MultipliableUniformlyOn.lean:87`), `HasProdLocallyUniformlyOn` (`Topology/Algebra/InfiniteSum/UniformOn.lean:147`).
- Mathlib, continued: `DirichletCharacter.LSeries_twist_vonMangoldt_eq` (`NumberTheory/LSeries/Dirichlet.lean:412`), `DirichletCharacter.LFunction_apply_one_ne_zero` (`LSeries/Nonvanishing.lean:412`), `Nat.primesLE` (`NumberTheory/PrimeCounting.lean:133`), `NumberField.dedekindZeta_residue` (`NumberField/DedekindZeta.lean:57`), `Complex.digamma` (`Gamma/Digamma.lean:48`), `RiemannHypothesis` (`LSeries/RiemannZeta.lean:185`), `NumberField.abs_discr_ge'` (`Discriminant/Basic.lean:210`), `Chebyshev.theta_le_log4_mul_x` (`NumberTheory/Chebyshev.lean:191`), `Chebyshev.psi_eq_psi_coe_floor` (:161), `Stirling.le_log_factorial_stirling` (`Stirling.lean:265`), `isEquivalent_choose` (`Choose.lean:45`), `ArithmeticFunction.sum_moebius_mul_log_eq` (`VonMangoldt.lean:134`), and the three `BoundingSieve` lemmas (`SelbergSieve.lean:217, 251, 377`).
- Mathlib has no Hadamard determinant inequality (`LinearAlgebra/Matrix/Hadamard.lean` is the entrywise product), as §0.34c says.
- Tau Ceti: every name in the From Tau Ceti, From RepresentationTheory, From LocalFieldsRamification and Prerequisites paragraphs exists, with the stated namespace. Examples: `TauCeti.Contour.Cycle.classicalResidueTheorem_nullHomologous` (`Analysis/Contour/Cycle/Residue.lean:138`), `TauCeti.Multiquadratic.fundamentalDiscriminantChar` (`…/FundamentalDiscriminant/Character.lean:38`), `TauCeti.ClassFunction.character_mem_indCharacterSpanInt_isElementary`, `TauCeti.IsElementary.isNilpotent`, `TauCeti.LocalFieldsRamification.artinConductorExponent`, `NumberField.NarrowClassGroup.mk0_map_ringOfIntegersQuadraticConj_eq_inv`, `TauCeti.EulerProductData`.

**Cross-roadmap citations resolved.**
- On main: ZerosOfLFunctions 0.1–0.2, 1.2–1.4, 3.3–3.4, 4.3–4.8, 5.2–5.6, 6.2–6.4 (including 6.4d, the `−L′/L` conductor bound used by §0.34b), 7.4 and 8.2–8.8; LFunctions Layers 1–7, with Layer 5's finite-order functional equation used by §2.19; ImaginaryQuadraticClassNumber H2.2–H2.4 (`quadratic_LFunction_siegel` and `imaginary_classNumber_lower_bound` at its `Suggested.lean:56, 63` are implied by §0.9 as the README says).
- Also on main: ArithmeticDirichletSeries Layers 1, 3–6, 8–10 (anchors resolve); ClassFieldTheory 7, 11, 13; RepresentationTheory/InductionRestriction 3, 6; DifferentialGeometry 12; FuchsianOrbifolds 2–3, 6; IntegralLattices Layer B (B2); GlobalNumberFields 2, 4, 9–11, NumberFieldArithmetic 1, 2, 7 and Chebotarev 8, 11, 13, 14 (under `Completed/`, see R05).

**Ownership against open work.** Line 11 claims primary products, the K-Bessel kernel, the Eisenstein series, Nielsen surfaces, Artin and Swan conductors, Hecke continuation, Artin local factors and the CM completion. Every other candidate owner of these is later in the merge order and cites this roadmap as supplier at its head:
- GlobalHolomorphicFunctions (#992, README lines 31, 515);
- AutomorphicSpectralTheory (#925, lines 48, 101);
- AdelicAlgebraicGroups (#792, lines 48, 279);
- ArithmeticGaloisRepresentations (#856) and AutomorphicLFunctionsAndLocalFactors (#924), with 23 and 34 citing lines.
ExplicitZetaBounds (#1954) and ExplicitNumberFields (#1944), the closest in vocabulary, also consume §§0.34, 0.9, 1.7, 2.15 and 2.43 from here. Single owner throughout; no fully qualified name of `Suggested.lean` collides with another roadmap's. `overlaps.md`: no other open PR changes this roadmap and no cited id is dropped, which I confirmed.

**Seeded sample (15 targets, read at the locator).** Source ids such as `bennettsiksekannals` and `zamanthesis` are entries of a scratch manifest; this review edited no manifest.

| Target | Source read | Result |
| --- | --- | --- |
| 0.4 | `bennettsiksekannals` lines 643–654 (pp.369–370: the sum differs from (21) only at prime powers, bounded by `ψ(k)−ϑ(k)−ψ(k/2)+ϑ(k/2)`, Schoenfeld Theorem 6*, (5.3*)–(5.4*)) | supported; the README's own route via Mathlib's `θ(t)≤log4·t` recomputed (row 1 below) |
| 0.16 | `bennettsiksekannals` lines 594–600 (p.369, `ε = 0.002811`), 736–745 (p.372, the 5 mod 8 case); `ramarerumely1996` lines 107–109, 1374–1385 | supported; locator for the theta clause is R07(b) |
| 0.19 | `bennettsiksekannals` lines 1227–1229 (p.382: RS Theorem 5, `|Σ1/p−loglog x−τ| < 1/(2log²x)` for `x≥286`, `τ=0.26149…`) | supported |
| 1.7 | `bombieri1987` lines 2615–2619, 2732 (Théorème 20, p.77, `(TQ²)^{3(1−σ)/(2−σ)}(log TQ)^A`, `A = 19`) | Montgomery range supported; Jutila range not verifiable (below) |
| 2.4 | `kedlayaant` lines 1141–1145 (Lemma 3.6, p.19), 1281 (Exercise 1, p.21) | supported (Landau-positivity lemma) |
| 2.18a | `kedlayaant` lines 5346–5431 (pp.127–129) | partly; R07(a) |
| 2.19 | LFunctions Layer 5 on main (functional equation), Layer 3 (order at 0) | supported; order recomputed (row 12) |
| 2.36 | `dit2016` lines 610–625 (p.964, (5.13) and Theorem 3, second case `∂F_A`), 989–1008 (p.972, (7.8) with `C_A`) | supported as written |
| 2.41 | `kedlayaant` lines 5376–5379 (Conjecture 22.2, p.128); `cogdellartin` lines 607–618, 634–635 (pp.13–14: `Γ_ℝ(s)^{n₊}Γ_ℝ(s+1)^{n₋}`, `Γ_ℂ(s)^{dim}`, `Λ(s,ρ)=εΛ(1−s,ρ^∨)`) | supported |
| 2.42 | `kedlayaant` lines 2827–2843 (Conjecture 10.4, Remark 10.5, p.61) | supported (definition only) |
| 2.43 | `zamanthesis` lines 711–720 (p.16, Theorem 1.3.5, Corollary 1.3.6, `0.0875/log(D_K Q n_K^{n_K})`, `|t|≤1`), 473 ((1.22): `Q = max N f_χ`), 2903–2921 (p.69, Theorem 4.1.1, `c₀ = 0.0875` at `r = 1`, denominator `log D_K + (3/4)log Q + n_Kν(n_K)`) | supported |
| 3.2 | `bennettsiksekannals` lines 872–890 (Lemma 7.3, p.375; computation to `1.2×10^10`, minimum at `N = 24`) | supported; split recomputed (row 17) |
| 3.6 | `smati1992` lines 124–131 (Théorème, p.145, effective for `x≥3`), 70–74 (constant `ζ(2)ζ(3)/ζ(6) = 1.9436`) | supported |
| 3.35 | `hildebrandtenenbaum1993` lines 139–143 (p.414, Rankin's inequality (1.3) for `σ>0`) | supported; the README's `x≥1, y≥2` adds only the trivial `x=1` case |
| 3.38 | `taodivisorbound` lines 56–92 (proofs of (3) and (4)) | supported |

The headline §0.34 itself: `openai2026lspdf` lines 23–25 (Theorem 1), 93–112 (§2 Lemma 2, the prime bias) and 443–475 (§6, proof by contradiction along `q→∞, δ→0`); `green2026` lines 25–34 (Theorem 1.1, `(1/2+O(1/C))log X + O_C(1)`). The README's effectivity of `c_LS` comes from its own direct combination in §0.34, not from either source, and that combination is sound (row 2).

**Adversarial table (values computed).**

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| 1 | §0.4 margin | `k₀ = 2·10^10`, `ε = 0.002811` | `((1−3ε)/8)−0.1239 = 4.5875·10⁻⁵ = 367/8·10⁶`; `2(1/140000+35/7290000) = 2.3888·10⁻⁵`; `√k₀ = 141421`, `k₀^{1/3} = 2714.4`, `log₂k₀ = 34.22` | holds |
| 2 | §0.34 combination | `X = q^C`, `δ = (1−β)log q` | `(C/4−1−A−AC²δ)log q ≤ B+K_C`; with `C ≥ 8(1+A)` and `δ < 1/(16AC)` the left side is `≥ (C/16)log q`, contradiction once `log q > 16(B+K_C)/C`; `q = 3`, `β≤1/2`: `(1−β)log 3 ≥ 0.549` | holds |
| 3 | §0.34c constant | `(1+1/C)(2/3+1/(2C))` | `C = 12`: 0.7674 > 3/4; `C = 15` (3∣C): 0.7467 ≤ 3/4; fact 1 needs `X^{4/3} > 2X^{4/3}/C + X(1+1/C)`, true for `C > 2`, large `X`; `RS = X²/C ≤ N³ = X²` | holds with `C₀ ≥ 15` |
| 4 | §0.34a / `quadratic_character_kronecker` | `q = 3, 4, 8, 12` | `D = −3, −4, ±8, 12`; `d = −3, −1, ±2, 3`; `χ₁₂(5) = (3/5) = −1`; `(−1/5) = 1 = χ₋₄(5)` | holds (R02 on strength) |
| 5 | §0.9 `quadratic_LFunction_one_lower_bound` | `q = 3, 4, 163` | `L(1,χ₋₃) = 0.6046`, `c ≤ 0.6642`; `L(1,χ₋₄) = π/4`, `c ≤ 1.0888`; `L(1,χ₋₁₆₃) = π/√163 = 0.246`, `c ≤ 1.25` | holds |
| 6 | §0.16 `thetaAP_eight_interval_ge` | `k ≥ 2·10^10` | `(1−ε)/4−(1+ε)/8 = 0.123945875 = (1−3ε)/8`; RR Table 1 `k = 8`, `x₀ = 10^10`: `.002811` | holds |
| 7 | §0.19 | `x = 286, 300, 10^3, 10^5, 10^6` | `|Σ1/p−loglog x−B| = 0.015230, 0.010229, 0.003938, 3.05·10⁻⁴, 3.9·10⁻⁵` vs `1/(2log²x) = 0.015630, 0.015369, 0.010478, 0.003772, 0.002620` | holds (tight at 286) |
| 8 | §0.11d `log_floor_factorial_bounds` | `x ∈ [1,200]`, step 0.001 | `min(log⌊x⌋! − lower) = 0.3477`; `min(upper − log⌊x⌋!) = 0` (equality at `x = 1`); `x = 2`: `0.693 ≤ 0.733` | holds |
| 9 | §0.11d identity | `x = 4`, `x < 1` | `log 24 = 3log2+log3`; `ψ(4)+ψ(2)+ψ(4/3)+ψ(1) = 3log2+log3`; `x < 1`: `0 = 0 = 0` | holds |
| 10 | §1.7 `selberg_zero_density` | `σ = 1/2, 4/5, 1 − 1/log(QT)`; `Q = T = 2` | `3/(2−σ) = 2, 2.5`; `(Q²T)^{2.5(1−σ)} ≤ (Q⁵T³)^{1−σ}`; RHS ≤ `C e^{5+ε}`; LHS at `Q=T=2`: 0 (no `ζ` zero below 14.13, no primitive character mod 2) | holds |
| 11 | §2.18a | `ℚ(i)/ℚ` at 2 and 3 | `Ind 1` at 2: inertia invariants dim 1, factor `(1−2^{−s})⁻¹`; at 3: `(1−3^{−2s})⁻¹ = (1−3^{−s})⁻¹(1+3^{−s})⁻¹`, `χ₋₄(3) = −1` | holds |
| 12 | §2.19 | `ℚ`, `ℚ(√2)`, `ℚ(i)` at `−2` | `r₁+r₂ = 1, 2, 1`; `ζ·L(χ₈)`: both vanish at −2 (order 2); `ζ·L(χ₋₄)`: only `ζ` (χ₋₄ odd), order 1 | holds |
| 13 | §2.36 | `d, d′ > 0` | `Λ_DIT(s,χ_d)Λ_DIT(s,χ_{d′}) = D^{s/2}π^{−s}Γ(s/2)²L L`; via §2.24 with `χ(J) = +1`: `Σχ(A)∫_{C_A}E* = ½π^{−s}Γ(s/2)²D^{s/2}·2L(s,χ)`; equal | holds |
| 14 | §2.41 boundary order | trivial line over ℚ; over real quadratic; zero rep. | `a₀ = 1, r = 1`: order 0, `ζ(0) = −1/2`; `a₀ = 2, r = 1`: order 1 = `r₁+r₂−1`; `a₀ = r = 0` | holds |
| 15 | §2.42 | `ℚ(i)`, real quadratic at 0 | `ζ_{ℚ(i)} = ζ·L(χ₋₄)`; order at 0 is `r₁+r₂−1 = 1`, outside the strip | holds |
| 16 | §2.43 | `K = ℚ`, `L = ℚ(ζ_q)` | `Q = max N f_χ` (Zaman (1.22)); `c₀ = 0.0875` at `r = 1` | holds |
| 17 | §3.2 split | `N = 24`, `1.12·10^10`, `1.2·10^10`, `10^12` | `P(24) = 3 > 0.94 log 24 = 2.9874`; `(log N−2log2)/1.000081` vs `0.94 log N`: `21.7511 > 21.7508`, `21.8201 > 21.8157`, `26.2426 > 25.9732` | holds |
| 18 | §3.35 Rankin | `x=y=2`, `σ = 1, 1/2`; `x = 1` | `Ψ = 2 ≤ 4` and `≤ 4.83`; `Ψ(1,y) = 1 <` product | holds |
| 19 | §3.38 | `δ = 1/2`, `n ≤ 5000` | last `n` with `τ(n) > √n` is 1260 (`36 > 35.5`), so `N = 1261` works; at `n = 2`, `τ = 2 > 1.414` (no universal claim, as stated) | holds |
| 20 | §3.6 | constant | `ζ(2)ζ(3)/ζ(6) = 1.943596` (Smati) | holds |
| 21 | `dedekindZeta_residue_le` | `ℚ(i)`, `ℚ(√5)`, `ℚ(∛2)`; `g(6)`, `g(3)` | `0.7854 ≤ 1.8842`; `0.4304 ≤ 2.1875`; `0.8145 ≤ 10.12`; `2π³/189 = 0.3281`, `5π⁷/47628 = 0.3171`, `6·0.329² = 0.649`; `75/(8π²) = 0.950` | holds |
| 22 | `bounded_degree_brauer_siegel` | `L = ℚ` | `hR = 1`, `|disc| = 1`: `C⁻¹ ≤ 1 ≤ C` | holds |
| 23 | `finite_order_hadamard` | `exp(z²)`, `(z−1)²` at `ρ = 0`, `sin z` at `ρ = 1` | `deg P = 2 = ⌊2⌋`; `E₀(z)² = (1−z)²`, `P = 0`; `z∏E₁(z/kπ)`, `Σ|kπ|^{−2} < ∞` | holds |
| 24 | `exists_entire_primary_product_exact` | `a = (1,1)`, `p = (0,0)`; empty `ι` | `F = (1−z)²`, order 2 = card; `F = 1`, order 0 | holds |
| 25 | `pairedHadamard_*` | `cosh`, `z·cosh z`, `1+z²`, `−cosh` | `γ_j = (2j+1)π/2`, `m = 0, 1`; `(1+z²)⁗ = 0` (nonpolynomiality needed); `−cosh` excluded by eventual positivity | holds |
| 26 | `completed_eisenstein_continuation` | residues | at 1: `Λ(2−2s) ~ 1/(2(s−1))`, residue 1/2; at 0: `Λ(2s) ~ −1/(2s)`, residue −1/2; at 1/2 the two poles cancel | holds |
| 27 | `lowerConductors_integral` | `ℚ₂(i)/ℚ₂`, `χ₈` | `G₀ = G₁ = G`, `G₂ = 1`: `a = 1+1 = 2`; `χ₈`: `a = 3`; Tau Ceti `G₀` = inertia | holds |
| 28 | `heckeContinuation` | `K = ℚ`, `χ = 1` | `A = 1`, `L_∞ = Γ_ℝ(s)`, `Λ = completedRiemannZeta`, poles at `0, 1` (`t = 0`), `W = 1`; norm-twist clause consistent with the unitary clause when `χ|·|^t` is unitary (shift `realExponent+t`, `complexExponent+2t`, `N v^{−t}`) | holds |
| 29 | `half_interval_explicit_formula` | `χ₋₃`, `k = 4`, `T = 2` | sum over `{3,4}` = `log 2 = 0.693`; no zero with `|γ| ≤ 2`; bound `C(2·6.17+6.17)` | holds |
| 30 | `dirichlet_polynomial_mean_square` | `N = 2`, `a = (1,1)` | error `4|sin(T log 2)|/log 2 ≤ 5.77 ≤ 6π·3 = 56.5`; `N = 1`: 0 | holds |
| 31 | `zeta_weil_explicit_formula` | integrand at `0⁺`; `F ↦ F̌` | limit `(5/2)F(0)`; `W_∞ = F(0)logπ + I(1/2,0) + J(1/2,0)` matches `weilGammaTerm` at `a = 1/2`, `A = π^{−1/2}`: `F(0)log(AB) = −F(0)logπ` | holds |
| 32 | `digamma_eq_integral` | `z = 1` | `ψ(1) = −γ`; integrand `e^{−t}(1/t − 1/(1−e^{−t})) < 0` | holds |
| 33 | `smoothCount_dickman`, `landau_ramanujan` | `u = 2`; Euler product | `ρ(2) = 1 − log 2 = 0.3069`; `(1/√2)∏_{p≡3(4),p≤23}(1−p^{−2})^{−1/2} ≈ 0.763` vs `C_L = 0.7642` | holds |
| 34 | `restricted_sathe_selberg` | `N = 14` | `r = 1`: `{2,5,13}`, 3; `r = 2`: `{10}`, 1 | holds |
| 35 | R01 statements | `ℚ(√5)`; `T = 2` | `hR = 0.4812`, `√5/log 5 = 1.389`; only `ζ`, first zero at 14.13 | statable, true |

**Mechanical scan behind R04.** Names (besides those quoted there) undeclared in `Suggested.lean` and absent from both pinned libraries include:
- `core_signature`, `core_boundary_period`, `cusp_decay`, `eisenstein_core_integrable`, `quadratic_weyl_domains`, `dirichletData_eq_rayData`, `primitiveL.bounded_height_count`, `dirichletL.near_one_derivative`;
- `mobius_type_I_bound`, `mobius_type_II_bound`, `mobius_reciprocal_narrow_rectangle`, `mobius_small_modulus_progressions`, `mobius_major_minor_uniform`;
- `dedekind_weighted_zero_formula`, `dedekind_repulsion_table`, `zaman_weight_to_prime_count`, `normalClosure_discriminant_le`, `artin_analyticConductor_le`, `regularizedHecke_*` (five), `dedekind_residue_subpower_lower`;
- `divisorErrorStar`, `divisorVoronoi.*` (four), `besselKY.*` (two), `zetaFourthMoment.approximateFE`, `.divisorDiagonal`, `.divisorOffDiagonal`, `halasz_complete_euler_comparison`, `prime_harmonic_rescaling`, `shiftedNorm.forbidden_card`, `roughProgression.crt_density`, `beurlingBoundary.laplace_fourier`.

## Not verifiable

- Jutila, *On Linnik's constant*, Math. Scand. 41 (1977), Theorem 1, (1.8), p.46 (§1.7, range `σ ≥ 4/5`). Fetched from the publisher's open archive, but the file is an image-only scan, and neither OCR nor page rendering is installed on this worker. Bombieri's Théorème 20 covers the other range.
- Rosser–Schoenfeld, Illinois J. Math. 6 (1962), Theorems 1, 5, 6, 11 (§§0.3, 0.5, 0.8, 0.19, 0.25). The Project Euclid PDF request was refused by the host's bot filter. §0.19 is confirmed through Bennett–Siksek p.382, which restates Theorem 5.
- Neukirch, *Algebraic Number Theory*, Chapter VII §10 (§2.18a): a paywalled book; see R07(a).

## Source issues

- **Misprint** in zamanthesis ([67]) at Lemma 7.2.3, pp.159–160: the source says the lemma needs `B ≥ 40` and concludes only for `x ≥ D_L^40`; it should be 35 in both places, matching Theorem 1.3.1 (p.12) and the proof's `B ≥ 35` on p.168; affects the proof.
- **Error** in zamanthesis ([67]) at the proof of Theorem 1.3.1, §7.2, p.168: the source says `B − 2ℓA ≥ 33.24` for `ℓ = ⌈ℒ⌉`, `A = 0.88/ℒ`, `B ≥ 35`, false whenever `ℒ` is not an integer; it should be a smaller constant such as 33.23, which every later inequality survives; affects the proof.
