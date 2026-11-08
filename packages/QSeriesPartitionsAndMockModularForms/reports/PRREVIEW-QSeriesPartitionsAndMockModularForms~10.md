# Review of QSeriesPartitionsAndMockModularForms (pull request #1391 at 08e719f)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/` (README 1791 lines, `Suggested.lean` 349 lines) at the head the previous review read; nothing in the folder or outside it changed since. Six findings: two P2, four P3. The previous R01 is not repaired (it is R03 here); R01, R02, R04, R05 and R06 are new.

## R01 (P2) — §11.2's congruence-subgroup law for the root-of-unity rank completions is statable at the pins and absent

**Location.** `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/Suggested.lean` lines 26–30: “The shadow, harmonicity and all-cusp growth assertions of Layers 6, 10 and 11 (… the root-of-unity rank completions) need the half-integral-weight harmonic spaces”. README line 1720 (§11.2): “there exist a congruence subgroup Γ_t of finite index and a common weight-1/2 multiplier χ_t”.

**Claim.** The docstring declares only the shadow, harmonicity and growth parts of §11.2 unstatable. The transformation law itself is the content of Zagier2009 Theorem 7.1 (Bringmann–Ono) and a Summary end result (“root-of-unity rank completions”). It is neither stated in the Lean file nor named in the docstring.

**Witness.** A scratch copy of `Suggested.lean` with the three declarations below (built on the file's own `zwegersR` and Mathlib's `CongruenceSubgroup.Gamma`) elaborates by `lake env lean`: 18 `sorry` warnings, 0 errors. Numerically F_(1/3)(γτ)/(√(9τ+1)F_(1/3)(τ)) = e(3/8) for γ=(1 0;9 1) at three τ.

**Repair.** In `Suggested.lean` add, after Layer 10:

```lean
/-! ## Layer 11: rank specializations at every root of unity -/

/-- Dyson's rank generating function `R(w;q) = Σ_{n≥0} q^{n²}/((wq;q)_n (w⁻¹q;q)_n)`. -/
noncomputable def rankGenFun (w q : ℂ) : ℂ :=
  ∑' n : ℕ, q ^ (n * n) / (P[(w * q), q, n] * P[(w⁻¹ * q), q, n])

/-- The completion `F_α = q^(−1/24) R(ξ;q) − (D/2) q^(−1/6) (ξ⁻¹ R(τ+3α;3τ) − ξ R(−τ+3α;3τ))`,
`ξ = e(α)`, `D = e^(−πiα) − e^(πiα)`; README §11.2. -/
noncomputable def rankCompletion (α : ℚ) (τ : ℂ) : ℂ :=
  let ξ : ℂ := Complex.exp (2 * Real.pi * Complex.I * (α : ℂ))
  let D : ℂ := Complex.exp (-(Real.pi * Complex.I * (α : ℂ))) -
    Complex.exp (Real.pi * Complex.I * (α : ℂ))
  Complex.exp (-(2 * Real.pi * Complex.I * τ) / 24) *
      rankGenFun ξ (Complex.exp (2 * Real.pi * Complex.I * τ)) -
    D / 2 * Complex.exp (-(2 * Real.pi * Complex.I * τ) / 6) *
      (ξ⁻¹ * zwegersR (τ + 3 * (α : ℂ)) (3 * τ) - ξ * zwegersR (-τ + 3 * (α : ℂ)) (3 * τ))

/-- For every `t > 1` the completions `F_(j/t)`, `0 < j < t`, transform with weight `1/2` and a
common multiplier on a principal congruence subgroup; Zagier, Theorem 7.1. -/
theorem rankCompletion_modular (t : ℕ) (ht : 1 < t) :
    ∃ N : ℕ, 0 < N ∧ ∃ χ : Matrix.SpecialLinearGroup (Fin 2) ℤ → ℂ,
      ∀ γ ∈ CongruenceSubgroup.Gamma N, ∀ j : ℕ, 0 < j → j < t → ∀ τ : ℂ, 0 < τ.im →
        rankCompletion ((j : ℚ) / t)
            (((γ 0 0 : ℂ) * τ + (γ 0 1 : ℂ)) / ((γ 1 0 : ℂ) * τ + (γ 1 1 : ℂ))) =
          χ γ * Complex.sqrt ((γ 1 0 : ℂ) * τ + (γ 1 1 : ℂ)) * rankCompletion ((j : ℚ) / t) τ := by
  sorry
```

Name `rankGenFun`, `rankCompletion` and `rankCompletion_modular` in README §11.2 (the gate checks every backticked name). Add the law to the docstring's list of stated headlines and to README line 129. Keep §11.2's shadow, harmonicity and growth in the not-statable bullet. §11.3's filtered law is a finite linear combination of these: state it the same way or name it in the docstring. Tested on the instances: the probe above is this text verbatim. The ratios F_α(γτ)/(√(cτ+d)F_α(τ)) computed from the README's §11.2 formula are τ-independent roots of unity: α=1/2: e(1/3), e(−1/3) at (1 0;2 1), (1 0;4 1); α=1/3: e(1/8), e(3/8), −i, −1 at (1 0;N 1), N=3, 9, 18, 36; α=1/5: e(1/120), e(1/24) at N=5, 25. Spread over three τ is at most 3.7×10⁻¹³.

## R02 (P2) — `gap:vector-bundle-dolbeault` asks for Dolbeault theory that ComplexKahlerGeometry on main already owns

**Location.** README line 103: “What ModularForms must provide (gap:vector-bundle-dolbeault): Supply vector-bundle Dolbeault resolution and duality, high-divisor vanishing and global dbar-solvability on compact Riemann surfaces.” Also lines 15 and 105, and §8.6 *Needs:* (line 1326).

**Claim.** None of the three ingredients exists upstream, so a ModularForms Part II must supply them; the README never cites ComplexKahlerGeometry.

**Witness.** ComplexKahlerGeometry on main, K5b.1 (`TauCetiRoadmap/ComplexKahlerGeometry/README.md` lines 1208–1236): for finite-rank holomorphic bundles on any compact complex manifold, connected or not, the Dolbeault–sheaf comparison and Serre duality H^q(M;E)*≃H^(n−q)(M;E*⊗K_M). K2 (line 193) owns the resolutions.

**Repair.** Add `### From TauCetiRoadmap.ComplexKahlerGeometry` to the supplier contracts with two items. K2 supplies the local Dolbeault–Grothendieck lemma and the analytic fine resolutions. K5b.1 supplies, for finite-rank holomorphic bundles on a compact complex manifold with no connectedness hypothesis, the identification of Dolbeault and sheaf cohomology, finite-dimensionality and Serre duality. Add `ComplexKahlerGeometry K2, K5b.1` to §8.6's *Needs:*. Narrow line 103 to: “What ModularForms must provide (gap:vector-bundle-dolbeault): for a finite-rank holomorphic vector bundle E on a compact Riemann surface C and an effective divisor D of positive degree on every connected component, H¹(C;E(nD))=0 for all sufficiently large n.” In line 105 drop the duality and resolution clauses. Keep the two-elliptic-component warning, and derive the ∂̄-exactness consequence from K5b.1's comparison. In line 15 write “vector-bundle Serre vanishing” for “vector-bundle Dolbeault/Serre theory”. Keep the slug. Tested on the instance: on a curve (n=1) K5b.1 gives H¹(E(nD))≅H⁰(E*⊗K_C(−nD))*, so what K5b.1 does not supply is exactly the narrowed vanishing. The README's disconnected example (D on one of two elliptic components, H¹(O)≠0 on the other) remains its negative Check.

## R03 (P3) — ModularForms §0.2 and the normalized Fricke convention exist only at the open ModularForms revision, which the description does not name

**Location.** README line 832: “*Needs:* TauCetiRoadmap.ModularForms §0.2; Mathlib `ModularForm.eta_ne_zero`, …” (also lines 13, 47, 48, 822, 842, 972, 1765). Line 101: “the normalized Fricke operator, (√N)^(2−k) times the native weight-k slash by (0,−1;N,0)”.

**Claim.** §5.2 consumes ModularForms §0.2, and §4.8a consumes ModularForms' normalized Fricke convention.

**Witness.** Main ModularForms (1d4e7ce) has neither §0.2 nor, in its conventions (lines 73–172), the normalized Fricke operator. The open revision #1706 (head 75cafd52) has §0.2 at line 395 and the Fricke normalization at lines 95–96. The description names neither.

**Repair.** Description only. Add ModularForms (#1706) to “Depends on” and place it before this pull request in the merge-order paragraph; the README keeps its roadmap-and-section citations. Tested: #1706 names this roadmap only as a consumer (its line 1541), so no cycle arises, and the dependency check prints 0 problems.

## R04 (P3) — the Lean names attributed to HabiroCyclotomicCompletions §1.1 are declared nowhere

**Location.** README line 69: “HabiroCyclotomicCompletions §1.1: `QToolkit.pochhammer` is the native finite product Pₙ(a;q) … Its `pochhammer_append` and `pochhammer_inverse_parameter` provide …”. The same paragraph has `pochhammerInf`, `reciprocalPochhammer`, `qBinomialSeries` and `integralPochhammerInf`; the last recurs at lines 188 and 315.

**Claim.** These seven names are §1.1's declarations.

**Witness.** At #1314's head, HabiroCyclotomicCompletions §1.1 (README lines 205–380) states these objects without names, and its `Suggested.lean` declares none of them. `roadmaps grep` finds them only here and in HabiroNahmSeries, and the pinned Mathlib and Tau Ceti have none.

**Repair.** Cite by object, without backticks. Line 69: “HabiroCyclotomicCompletions §1.1: the finite Pochhammer product (x;q)ₙ with its empty, concatenation, shift, base-change and unit inverse-parameter laws; the formal infinite, reciprocal and q-binomial series over a field with qⁿ≠1 for n>0, with Euler and q-binomial identities; the integral infinite Pochhammer product in ℤ⟦q⟧⟦t⟧ with q-adic stabilization, product projections, shift, Euler's reciprocal identity and coefficient change.” At lines 188 and 315 write “§1.1's integral infinite Pochhammer product” for `integralPochhammerInf`. Tested: each clause matches #1314 lines 213–227 and 264–288.

## R05 (P3) — “PDE Lane E” does not exist on main

**Location.** README line 117: “Lane E: The interior regularity foundation; its smooth-coefficient conclusions do not assert analytic regularity.” Line 121: “PDE Lane E supplies smooth/Schauder regularity … This is the Part II extension at Lane E, analytic-coefficient extension.”

**Claim.** PDE has a “Lane E”.

**Witness.** PDE on main has had no “Lane” labels since d0bb87a6 (2026-11-05); elliptic regularity is Layer 5, §§5.1–5.7 (E20–E26), at line 1827. “Lane E” survives only at the open revision #1614 (its line 327), which the description does not name.

**Repair.** Replace each of the three “Lane E” by “Layer 5 (§§5.1–5.7, interior elliptic regularity E20–E26)”, keeping the slug. Tested: main's Layer 5 is smooth, Schauder and De Giorgi–Nash–Moser regularity, and main proves real-analyticity only for harmonic functions (§3.1, line 1319). So the gap is still needed and is unchanged in substance.

## R06 (P3) — §10.3 Check: “starting A₁ at zero would introduce 0/0” is false

**Location.** README line 1575: “seventh constants: A₀(0)=A₂(0)=1 and A₁(0)=0; starting A₁ at zero would introduce 0/0.”

**Claim.** The n=0 summand of A₁ is 0/0.

**Witness.** Under the Conventions (line 19), P₀ is the empty product 1, so the n=0 summand is q⁰/P₀(q⁰;q)=1. At q=10⁻⁶, A₁ summed from n=1 is 1.0×10⁻⁶ and from n=0 is 1.000001; no 0/0 occurs.

**Repair.** Replace the second clause with: “starting A₁ at n=0 adds the summand q⁰/P₀(q⁰;q)=1 and gives A₁(0)=1 (likewise A₂(0)=2), so the start index is detected by the constant term.” Tested on the instance above: A₂ from n=1 gives 1.000001 and from n=0 gives 2.000001.

## Previous findings

- R01 of the previous review (description does not name the ModularForms revision): not repaired. The folder is unchanged (same head 08e719f). The description's “Depends on” still lists only #1172, #925, #851, #1314 and #1063, and its merge-order chain still ends “#1314 (HabiroCyclotomicCompletions) → this pull request”. This is R03 here, with the Fricke convention added to the witness.
- R02 of the review before last (docstring count of unary corrections): repaired at 08e719f. The docstring reads “the twenty-six unary corrections of §§10.5 and 10.7”; 20 + 6 terms re-counted from README lines 1621 and 1663.

## Verified sound

**Gate and dependency check.** This review's run of `gate … --base origin/main` at 08e719f printed every counter at 0, from `set_option=0` through `source-material=0`, then `OK`, exit 0; the worker's gate adds `build=0`. `gate --depcheck … --movable` printed `depcheck: 236 roadmaps, 2419 edges, 0 problem(s)`: no UPWARD, CYCLE or moved line. The diff outside the folder is empty. Suppliers in the merge order sit above this roadmap (line 246): HabiroCyclotomicCompletions 47, GeometryOfNumbersAndQuadraticArithmetic 52, AutomorphicFormsOnReductiveGroups 59, AutomorphicSpectralTheory 95, ArithmeticStatisticsPartIV 114, MetaplecticAutomorphicForms 151. HabiroNahmSeries (334) is a consumer.

**Elaboration, signatures, padding.** A scratch copy elaborated with `lake env lean` (Mathlib 6b7abb3c, Tau Ceti a91d3aaf): 17 `declaration uses sorry` warnings and nothing else. `#check @…` for all 37 declarations matches the README statements. The file has no `variable` line, so no binder can be lost; `signatures.md` reports 0. For the one-tactic probe, every one of the 17 theorems was run with `first | rfl | simp | infer_instance | decide`. Each fails (unsolved goals, or `decide` on free variables), so there is no padding. No sorry'd data and no `set_option`; the imports are `Mathlib` and `TauCeti.Analysis.SpecialFunctions.Erf`.

**Library declarations opened at the pins.** For Mathlib, 44 cited names elaborate by `#check`, including `ModularForm.eta_comp_eq_csqrt_I_inv` (η∘(−1/·) = (√i)⁻¹•(√·)η on ℍ), `discriminant_S/T_invariant`, `CuspForm.discriminant`, `hasDerivAt_jacobiTheta₂_fst` (needs 0<Im τ), `PowerSeries.coeff_expand` (needs CommRing, p≠0), `Nat.Partition.card_restricted_eq_card_countRestricted` (0<m) and `YoungDiagram.rowLens_ofPartition_eq_sort_parts`. `Complex.sqrt a = a ^ (2⁻¹ : ℂ)` is at `Mathlib/Analysis/RCLike/Sqrt.lean` line 26. For Tau Ceti:
- `TauCeti.Real.erf` = 2/√π∫₀ˣexp(−t²), with `erfc = 1 − erf` (`#print`).
- `lowerIncompleteGamma` is at `TauCeti/Analysis/SpecialFunctions/IncompleteGamma.lean`:110, with value 0 for s≤0 (as the §8.4 Check says); `_eq_integral` is at :119, `hasDerivAt_…` at :245 (x>0) and `tendsto_…_atTop` at :329.
- `cuspFormCharSpace` and `modFormCharSpace` are at `NumberTheory/ModularForms/DiamondOperators.lean`:279 and :315, and `mem_…_iff_nebentypus` at :344 and :376.
- `Contour.residue` is at `Analysis/Contour/Residue/Basic.lean`:80, `classicalResidueTheorem_circle` at `Residue/Theorem.lean`:349 (0<R) and `homologyCauchyTheorem` at `HomologyCauchy.lean`:108.
- `CuspFormClass.eichlerIntegral_slash_apply` is at `EichlerIntegral/Transformation.lean`:121, with k = n+2, arithmetic level and positive strict periods, as README line 59 says.

**Cross-roadmap citations resolved.** On main:
- ModularForms 10A (line 1052), 10B (line 1068), and the Uₚ = Tₚ convention.
- ThetaSeries Layers 1–3 (lines 423, 484, 587).
- ClassicalArithmeticCompletion §§2.10 (2954, with `LaurentSeries.cartier`, `cartier_add`, `cartier_smul`, `cartier_ofPowerSeries`), 2.31 (3619), 4.20 (8210), 4.40 (8809), 4.60 (9339), 4.61 (9366).
- PadicMeasuresIwasawaAlgebras §2.9 (1788, with `PowerSeries.cartier`, `coeff_cartier`, `cartier_expand_mul`).
- IntegralLattices 0G (568, the hyperbolic plane), 1G (642), 1H (667). The overlap lead “§0G only at #1239” is false.
- StandardDistributions Layer 2 (314); ContourIntegration (under `Completed/`) Layers 2–3 (158, 184).

At open heads:
- ArithmeticStatisticsPartIV §3.2 (#1172, line 129: recursion, semiring evaluation, symmetry, value `Nat.choose`, field product formula), the Cauchy theorem (164), §3.9's Euler sum (797).
- GeometryOfNumbersAndQuadraticArithmetic §4.3 (#851, line 1516; `qPochhammer`, `jacobiProduct`, `kronecker_single_identity`, `appell_lerch_difference_identity` at 1590–1592).
- MetaplecticAutomorphicForms (#1063) §§2.4b (477), 2.5 (521), 2.6 (529), 4.7 (1245, `finiteWeil_conjugate` at 1255, with ρ_L having the positive T exponent, as in the Conventions), 6.18 (1769), 6.20 (1805), 7.1 (1835), 7.2 (1851), 7.49 (2379).
- AutomorphicSpectralTheory §1.16 (#925, 1246: the same Δ_k, `weight_laplacian_slash`, the Powers bullet).
- AutomorphicFormsOnReductiveGroups §4.5 (#1037, 708).
- ModularForms §0.2 (#1706, 395, matching README line 101 clause by clause; R03).

The `BruinierFunke2003, §3` citation lead is a source key, not a roadmap.

**Declared gaps.** `classical-metaplectic-model` (README lines 95–97) is precise. MetaplecticAutomorphicForms §§2.4b–2.6 and §7.49 at #1063 have no pair model (g,φ) with φ²=cτ+d, and nothing on main or in Tau Ceti does (the only Tau Ceti SL₂ cover is Thurston's `SL2Tilde`). `analytic-elliptic-regularity` (119–121) is precise and not supplied: PDE main proves analyticity only for harmonic functions, and ComplexKahlerGeometry K5a's “analytic regularity” is smooth elliptic theory. `vector-bundle-dolbeault`: R02. All three slugs appear in the README with named suppliers.

**Ownership.**
- HalfIntegralWeightModularForms (#1721) consumes §§5.2, 6.1 and 9.1 and is holomorphic only; no shared object.
- Its §3.3 proves the Dedekind-sum and Kronecker closed forms that ModularForms §0.2 (#1706) also owns. That conflict is between those two roadmaps; this README assigns the closed forms to §0.2 alone.
- HabiroNahmSeries (#1427) is a consumer, and its `gap:qseries-root-modularity` is its own contract.
- The pinned Mathlib and Tau Ceti have no q-Pochhammer, Rogers–Ramanujan, rank, crank, Bailey, Appell–Lerch, Mordell-integral or harmonic Maass carriers.
- The overlap index lists no open pull request changing this roadmap and no dropped id.

**Seeded sample, read at the locators** (Zwegers2002 printed page = PDF page − 4):
- 1.5: Gasper1995 (1.3.10), p. 6, line 313.
- 2.1: Gasper1995 (3.1.6), p. 13, lines 717–730; domain p. 14, line 761.
- 2.2: (3.1.11)–(3.1.13), pp. 14–15, lines 805–854.
- 2.7: Andrews1986 Bailey's Lemma (2.3), p. 114, lines 93–95; (3.1) p. 116, line 156. The (2.4)–(2.6) displays are images; checked by exact computation instead, see the table.
- 3.2: Warnaar2001 (1.3) lines 45–48, (1.4a)–(1.4b) lines 49–65, (1.6) lines 92–108. These are e_(n+1) and d_(n+2), as stated.
- 4.1: AndrewsGarvan1988 rank, line 10; crank definition lines 80–83 (strict ‘larger than’); Zagier2009 lines 898–922.
- 4.2: AndrewsGarvan1988 (1.4)–(1.11), lines 24–64.
- 4.3: Theorem 1, line 87 (n>1), proof lines 97–125; Zagier2009 rank series lines 912–922.
- 4.9: BevilacquaChandranChoi2019 lines 39–44; Atkin1967 Theorem 2, line 28 (β=[(b+2)/2], line 26).
- 5.1: Zwegers2002 Proposition 1.3 (1)–(10), p. 8, lines 336–360.
- 7.2: Definition 2.1, pp. 26–27, lines 1311–1347.
- 8.5: BruinierFunke2003 §2 dim ≥3 at line 190; (3.2) at lines 384–438; Lemma 3.1 and Proposition 3.2 on p. 10; H⁺ and Lemmas 3.3–3.4 on p. 11, lines 487–515.
- 10.1: BringmannOno2006 (2.1)–(2.2), lines 270–278, and (2.3)–(2.5) with Theorem 2.1, lines 279–327; Zagier2009 lines 130–149, with φ and ψ in Zagier's q↦−q convention, as the README defines them.
- 10.7: Zwegers2002 §4.3 and Proposition 4.5, pp. 67–68, lines 3694–3783, term by term: characteristics, ζ phases, A, c₁, c₂ and the order (F₀,F₂,F₁).
- 11.3: Zagier2009, corollary at lines 952–965, p. 986–17.

Also read: Watson1938 (3.2) line 417, (5.2) line 1127, p(243)≡245 mod 343 line 108; Garvan1988 (6.8) line 695 and (6.24) line 748.

**Adversarial table.** Values computed for this review in double precision (series truncated far beyond 10⁻¹⁵, ray integrals by the closed form ∫₀^∞e^(−3πκ²t)(2y+t)^(−1/2)dt, Bailey and Schur exactly over ℚ and ℤ[Q], partition data by enumeration and the pentagonal recurrence).

| Statement / object | Instances tried | Computed sides or competing values | Result / change |
| --- | --- | --- | --- |
| `qBinomial` | (a,q,z)=(0.3+0.2i,0.4−0.3i,0.5+0.1i); (2−i,−0.5+0.2i,−0.3+0.7i); q=0,a=0.7,z=0.6 | 1.8736257319−0.4684739279i both; 1.2420422671−1.0390689318i both; 1.45 both | Keep |
| `qBinomial_largeBase` | (0.5,2,0.7); (0.3,1.5+0.8i,1.1−0.4i), \|az/q\|=0.207; a=0,q=1.3i,z=5; a=8 (\|az/q\|=5.5) | 0.65 both; 0.5205210755+0.9375321564i both; −51.3618219305−42.3816671251i both; terms 7.7×10³, 3.7×10⁷, 9.5×10¹⁴ | Keep; domain sharp |
| `euler_qExponential` | q=0.4−0.3i with z=0.5+0.1i and z=3−2i; q=0,z=2.5 | 1/P(z;q)=2.4874562632−0.3500169047i both; 1.8335105310−0.3850740854i both; −4.1980805035−4.0442739905i both; 3.5=1+z | Keep |
| `ramanujanOnePsiOne_hasSum` | (.8,.1,.2,.7); (2,.5,.3,.6); b=0; (1.5+0.5i,0.3−0.2i,0.3+0.4i,0.4−0.6i); q=0 | 1.1892209225; −0.6482294967; 0.9663838972; 2.0945634402−0.6242419523i (each both sides); q=0: 1.7359098229 both, so q≠0 serves only the qᴺ continuation route | Keep |
| `baileyPair`, `baileyLemma_transform` (2.7) | exact: a=1/3, q=1/2, ρ=(3/5,−2/7), α=(1,2,−1/3,5,0,7/2,−4/9) | displayed β′ = pair-relation β′ at n=0…6 (β′₁=17052/13585); the n−r kernel differs; δ₁ non-example gives 8/3 | Keep |
| §3.2 Schur identities | n=0…13 in ℤ[Q] | both identities equal; D₂=1+Q, E₂=1+Q²; both recurrences hold with D₀=D₁=E₀=E₁=1; G(4,2)(−1)=2 | Keep |
| `rogersRamanujan_count`, `_count_two` | n=0…20 | 1,1,1,1,2,2,3,3,4,5,6,7,9,10,12,14,17,19,23,26,31 both; 1,0,1,1,1,1,2,2,3,3,4,4,6,6,8,9,11,12,15,16,20 both | Keep |
| `rogersRamanujan_hasSum` | q=0.45+0.3i; −0.6+0.1i | 1.2605476441+0.7632052939i, 0.9347715059+0.4255246886i; 0.7135856425−0.0432006090i, 1.2428781156−0.1057352275i (each both sides) | Keep |
| `quintupleProduct_hasSum` | (q,z)=(0.3+0.2i,−0.6+0.9i); (−0.5+0.4i,1.7−0.3i) | 0.4315355615+0.3836699677i both; 5.4863846113−3.4789339271i both | Keep |
| `partitionRank`, `partitionCrank` (4.1) | (3,2,1,1),(1),(3,3),(2,2,2),() | rank −1,0,1,−1,0; crank −1,−1,3,2,0; rank∘conjugate = −rank on all partitions of n<12 | Keep |
| 4.2–4.3 vector crank (sample) | sizes 0–11 | V₁=z+z⁻¹−1, C₁=z⁻¹; crank counts symmetric except n=1 ({−1:1}) | Keep “n≠1” |
| `rank_equidistribution_five_seven` | sizes 4,9,14,19,24 mod 5; 5,12,19,26 mod 7 | [1],[6],[27],[98],[315]×5; [1],[11],[70],[348]×7 | Keep |
| `crank_equidistribution_five_seven_eleven` | the same, and 6,17,28 mod 11 | same for 5 and 7; [1],[27],[338]×11; negative control: rank mod 11 at 6 is [1,2,1,1,0,1,1,0,1,1,2] | Keep |
| `partition_primePowerCongruences` (4.9) | every ℓʳn+δ≤1400: 5ʳ (r≤4), 7 (r≤3), 11ʳ (r≤2) | all divisible; δ=4,24,99,599,5,47,243,6,116; p(243)≡245 (mod 343), so 7³ at r=3 is false | Keep ⌊r/2⌋+1 |
| 4.4a dissections | ℓ=5,7 at q=0.28+0.19i (two roots each); ℓ=11 at \|q\|=0.78 (three roots) | residuals ≤1.2×10⁻¹⁵; eleven with A₉: 3.4×10⁻¹⁵, with printed A₈: 2.4×10⁻⁶; the 11 crank classes of 49 are each 15775 | Keep correction |
| 4.4a theta addition | (a,b)=(0.7+0.2i,−0.4+0.9i), (1.3,0.5i), q=0.28+0.19i | residuals 2.2×10⁻¹⁶, 4.6×10⁻¹⁶ | Keep |
| 4.8a eta equations | τ=0.1+0.9i, −0.3+0.6i | degree 5: 1.2×10⁻¹⁴, 6.0×10⁻¹⁴; degree 7: 4.6×10⁻¹³, 5.9×10⁻¹² | Keep |
| `zwegersOddTheta` (5.1) | τ=0.17+1.1i, z=0.31−0.2i; τ=i, z=1/4 | series = Lean form = −0.8764998324+0.2046506273i; ϑ′(0)=−2.6219290524−0.3451705427i vs −2πη³=−2.6219290523−0.3451705427i; ϑ(1/4;i)=−0.6435897640; laws (1),(2),(4),(6),(7) ≤1.6×10⁻¹⁴ | Keep |
| 5.4 h, 5.5 R | τ=i; z=0.2+0.1i, u=0.23+0.31i, τ=0.3+0.9i | h(1/2;i)=1.0000000000, h(0;i)=0.6690633391; both h shifts and S ≤3.4×10⁻¹⁴; R unit shift, evenness, τ-shift, T, S ≤4.4×10⁻¹⁵ | Keep |
| `zwegersMu`, `zwegersMuHat` | τ=i, u=1/3, v=1/4 | μ=−0.8941872843i, μ̂=−0.7325888912i, μ̂(u/τ,v/τ;−1/τ)=0.7167793631i; opposite correction sign gives −1.0557856775i | Keep |
| `zwegersMuHat_elliptic` | (k,l,m,n)=(1,0,0,1),(0,1,1,0),(1,1,−1,2),(2,0,1,0) at τ=0.3+0.9i | residuals ≤5.5×10⁻¹⁶ against \|values\| 2×10⁻⁴…0.15 | Keep |
| `zwegersMuHat_modular` | S, T, −I, (1 0;1 1), (2 1;3 2), (−3 1;−7 2), (1 0;−2 1) at τ=0.3+i and −0.2+0.7i | residuals ≤7.5×10⁻¹⁵ | Keep w²(η(τ)/η(γτ))³ |
| 5.7 joint difference | u,v as above, w=0.11−0.07i | −0.2179463880−0.0972790122i both | Keep |
| `thirdOrderF`, `thirdOrderF_rank` | coefficients; q=0.3+0.25i | 1,1,−2,3,−3,3,−5,7,−6,6,−10,12,−11 = signed rank counts; f=R(−1;q)=1.2056564842+0.0794678723i | Keep |
| `thirdOrderOmega` (10.1) | coefficients; q=0.3+0.25i | 1,2,3,4,6,8,10,14,18,22,29,36,44; (q²;q²)ω begins 1,2,2,2,2,2,1,2; P(q²;q²)ω = bilateral = 1.5353623341+0.9080039376i | Keep |
| 10.1 relations, 10.1a rank bridge | q=0.3+0.25i; z=−1, 0.4+0.7i, 2−i | 2φ−f = f+4ψ = Θ/P(−q;q) = 0.1127958663−0.4497963279i; Durfee = bilateral to 10⁻¹⁵ at each z | Keep |
| `thirdOrderCompletion_T`, `_S` | τ=0.17+1.1i, i, −0.3+0.8i, 0.45+0.6i | T residual ≤3.0×10⁻¹⁶, S ≤7.8×10⁻¹⁶; F₃(i)=(1.3016831357,0.2690404473,0.2263083242), G₃(i)=(0.7951171069,−0.2375255814,0.2263083242), H₃(i)=(0.5065660287,0.5065660287,0); F+G fails S by 2.14, −√ by 1.22 | Keep |
| 6.1 ∂̄C, ξC; 10.2 first correction | (1/6,0,0.17+1.1i), (0.3,0.25,−0.2+0.7i) | ∂̄C=0.0122354577−0.0598878908i = −ig(a,−b;−τ̄)/√(2y); ξ½C=−0.1256218996+0.0256653125i = −√2g; G₃,₁ = 2C(1/6,0;3τ) = 0.7544430833−0.0334108035i | Keep |
| 7.2 kernel (sample), 7.1 cone | A=[[0,1],[1,0]], c₀=(1,−1), c₁=(1,0), c₂=(0,−1), ν=(½,±½) | B(c₁,c₀)=B(c₂,c₀)=−1; kernels 2 and 0; Q(ν)=¼ gives 2e(τ/4); B((0,−1),(0,½))=0 excluded; (−1,0) has B=+1 | Keep |
| 7.5 corrections | A=[−2], a=¼, c=1 and c=2 | −C(¼,0;2τ); cosets ¼+2ℤ, 5/4+2ℤ give −C(1/8,0;8τ)−C(5/8,0;8τ) | Keep |
| 8.5 ξ coefficients (sample) | k=½, n=−1, (u,v)=(0.13,0.9); constant mode | L_k[H(2πnv)e(nu)]/(−v^(2−k)(−4πn)^(1−k)e(nτ̄)) = 1.0000000103; L_k(v^(1−k)) = 0.4269074848 vs (1−k)v^(2−k) = 0.4269074841 | Keep factor 1 |
| 8.5 parity | L=⟨2⟩, h=½; rank 0 | Q(h)=¼; ρ_L(Z)e_½ = −i e_(−½); k=½, σ=0: 2k+σ odd, so H=0; k=0 contains 1 | Keep |
| 10.3a Hecke identities | q=0.3+0.2i | eight fifth-order residuals ≤1.9×10⁻¹⁵; three seventh-order cone sums ≤8.1×10⁻¹⁶; χ₀=2F₀−φ₀(−q)=1.2972571959+0.4227549277i, χ₁=2F₁+φ₁(−q)/q=1.6034133120+0.8095692283i | Keep |
| 10.7 seventh-order vector (sample) | c₁=(−3,4), c₂=(−4,3) | Q(c₁)=Q(c₂)=−21/2, B=−28; G₇ = Zwegers lines 3771–3777 term by term; leading exponents −1/168, 47/168, 143/168 | Keep |
| 10.3 A₁ start index (R06) | q=10⁻⁶ | A₁: 1.0×10⁻⁶ (n≥1) vs 1.000001 (n≥0); A₂: 1.000001 vs 2.000001; P₀=1 | R06 |
| 10.6, 10.8 S matrices | ((2/√5)M₅)², M₇² | identity to 2.2×10⁻¹⁶ and 1.1×10⁻¹⁶ | Keep |
| 11.2 Lerch form | α=0.2, 0.37, τ=0.17+1.1i | hα = D(…) = 1.3330999297−0.0582037825i both; completed Fα=1.0724134053−0.0465939553i both; ϑ_Z(τ;3τ) = −q^(−1/6)η(τ) = −2.3499661197+0.3177317623i; Zagier's printed form gives 0.3873−0.6443i against 0.0495+1.1340i | Keep README form |
| 11.2 at ξ=−1 | τ=0.17+1.1i | F_½ = H₃,₁ = 0.5786585666−0.0247959850i | Keep |
| 11.2 transformation law (R01) | α=½: (1 0;2 1),(1 0;4 1),T; α=⅓: (1 0;N 1), N=3,9,18,36, T³; α=⅕: N=5,25, T⁵; three τ each | ratios e(⅓), e(−⅓), e(−1/24); e(⅛), e(⅜), −i, −1, e(−⅛); e(1/120), e(1/24), e(−5/24); spreads ≤3.7×10⁻¹³ | R01 |
| 11.3 (sample) | t=1, 2 | N(0,1,n)−p(n)=0; t=2: N(0)−N(1) = coefficients of f, so the deviations are ±f/2 | Keep |
| 1.5 inversion (sample) | a=3, q=2, j=−1, −2 (exact) | P₋₁=−2=(−⅓)·2·3; j=−2: q³/((a−q)(a−q²)) on both sides; exponent j(j+1)/2 gives −1 | Keep |
| 2.1–2.3 (sample) | A=B=[]; A=[],B=[0]; q=2, a=−½ | c₁=−1/(1−q); t₋₁=−q/z, t₋₂/t₋₁=−q²/z; ratio (1−aqⁿ)/(1−q^(n+1)) → a/q, radius 4 = \|q/a\| (Gasper p. 14 would give 2) | Keep README |
| `gap:vector-bundle-dolbeault` (R02) | C elliptic, E=O, D a point | K5b.1 with K_C=O gives H¹(O(nD)) ≅ H⁰(O(−nD))* = 0 for n≥1; only the vanishing step lies outside ComplexKahlerGeometry | R02 |

43 rows; 40 keep, 3 support findings.

## Not verifiable

- GasperRahman2004 and BFOR2017 are waived; Andrews1976, Hickerson1988 and AtkinSwinnertonDyer1954 are uncertified. No cached text exists for them. The seventh-order Hecke identities that §10.3a takes from Hickerson1988 were checked numerically instead (table). AtkinSwinnertonDyer1954's rank-dissection Lambert terms (§4.4a) were not checked.
- Andrews1986 (2.4)–(2.6) on p. 115 are images in the text layer. The transformation was checked by exact computation instead, and the inverse map (2.8), line 123, matches the README's α′.

## Source issues

- **Error** in Gasper1995 at §3.1, p. 14: the source says a nonterminating rφs with \|q\|>1 converges absolutely for \|z\|<\|b₁⋯b_s/(a₁⋯a_r)\|; it should be \|z\|<\|q·b₁⋯b_s/(a₁⋯a_r)\| for nonzero parameters, as (1.3.11) on p. 6 gives for ₁φ₀; affects nothing.
- **Misprint** in Garvan1988 at Theorem (6.7), equation (6.8), p. 64: the source says the residue-five term contains A₈B₇; it should be A₉B₇, as (6.24) on p. 65 and the coefficient of q⁴⁹ confirm; affects nothing.
- **Error** in Zagier2009 at the proof of Theorem 7.1, p. 986–17: the source says q^(−1/24)R(ξ;q)/D equals the theta quotient plus e^(∓2πiα)μ(3α,∓τ;3τ); it should be the negative quotient plus q^(−1/6)(e^(−2πiα)μ(3α,−τ;3τ)−e^(2πiα)μ(3α,τ;3τ)); affects nothing.
- **Error** in BruinierFunke2003 at Lemma 3.1, p. 10: the source says L_k f⁻ carries the factor −2v^(2−k); it should be −v^(2−k) under the normalization of (3.1) and (3.3); affects nothing.
