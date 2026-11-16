# PORT-ModularFormsPartII

## Result

- Branch `roadmap/modular-forms-part-ii`, head `cd38aeb` (one commit on `51d880d`, message `ModularFormsPartII: roadmap (README, Suggested.lean, metadata)`). The diff against `origin/main` touches only `TauCetiRoadmap/ModularFormsPartII/{README.md, Suggested.lean, metadata.toml}` (1467 insertions).
- Build, `lake build TauCetiRoadmap.ModularFormsPartII.Suggested`: `Build completed successfully (18358 jobs).` with 15 warnings, all `declaration uses \`sorry\`` (one per theorem, 15 theorems). The first build of the package file also warned that the file imports `Mathlib` without the `module` header; adding `module` as the first line removed that warning.
- Gate: `gate ModularFormsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`gate --depcheck … --movable`): `depcheck: 245 roadmaps, 2295 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- Citation resolver on the ported README: no cross-roadmap citation and no Lean name found nowhere.

## Draft pull request body

This roadmap takes modular forms beyond congruence subgroups, to arbitrary finite-index subgroups of `SL₂(ℤ)`, and proves the unbounded denominators theorem of Calegari, Dimitrov and Tang: a weakly holomorphic form of integral weight on a finite-index subgroup whose Fourier expansion at `∞` has integer, or algebraic-integer, coefficients is modular for a congruence subgroup. ModularForms stops at forms on `Γ₁(N)`, and NoncongruenceModularForms on main states the theorem for holomorphic forms and assigns its proof here. The roadmap builds weak forms on arbitrary finite-index subgroups through their cusp germs, signed cusp widths and the geometric level, and proves Wohlfahrt's theorem in its signed form. It presents the modular λ function as an η quotient with an integral `q`-product and proves that it is the universal covering of `ℂ ∖ {0, 1}` with deck group `Γ(2)/±I`. From λ it builds the `ℚ(λ)`-spans `M₂N` of congruence modular functions and `R₂N` of modular functions with bounded denominators, and bounds `[R₂N : ℚ(λ)] ≤ C N³ log(2N)` through the arithmetic holonomy bound and the conformal radius of the roots-of-unity covering. It proves the nonabelian Ihara lemma and the generation identity from the `SL₂(ℤ[1/p])` amalgam and the congruence subgroup property. Degree doubling under p-scaling and Chebyshev's bounds then contradict the rank bound unless `R₂N = M₂N`, which gives the theorem in its integral, rational (poles at `∞` allowed) and algebraic-integer forms, together with Galois conjugation of weak forms with algebraic coefficients. The application layers prove algebraicity and congruence of integral solutions of three-point differential equations, congruence of integral components of vector-valued modular forms with Mason's conjecture in its effective-span form, the differential closure of weak forms by `E₂`, the deficient-place theorems, and the arithmetic fundamental group of the cuspidal smooth model of `X(N)`. `Suggested.lean` states fifteen headline theorems against the pinned Mathlib and Tau Ceti, on Tau Ceti's Laurent `q`-expansion, with nine definitions that make them statable; its docstring names the headlines that are not statable at the pins and what each lacks.

## Dependencies that are still pull requests

The README cites these roadmaps, which are not on main (each checked at its open head):

- QSeriesPartitionsAndMockModularForms (§§8.1, 8.4a)
- ModularCurvesPartII (§§4.1, 4.8, 4.10, 4.11, 5.13, 5.14, 6.3–6.5, 8.1, 11.4, 15.2, 15.3, 15.5, 15.6, 15.9, 15.10; the two declared gaps)
- DiophantineApproximationAndTranscendencePartII (§§4.1–4.8)
- AlgebraicModularFormsAndSerreWeights (§2.9, identifier R15.2)
- AutomorphicGaloisRepresentations (§4.2)
- SpecialFunctionsTheta (§§2.2, 4.2, 6.1, 6.2, 6.4). This one is not in the merge order. It is another author's pull request that adds a new roadmap folder, which the brief permits as a supplier. The dependency check reports no problem for it.

All the others are earlier than ModularFormsPartII in the merge order. The suppliers on main are ModularForms, ConformalMappingPartII, FuchsianOrbifolds, BelyiMaps, DiophantineApproximationAndTranscendence, EtaleCohomologyFoundations and UniversalCovers (Completed). The README also names NoncongruenceModularForms and ConformalMapping (Completed), but only in Scope and ownership, as consumers or for ownership; they are not suppliers. NoncongruenceModularForms on main already cites this roadmap by the former numbers W1.2–W1.3, W1.5–W1.6, W1.8 and W6.3–W6.5; the README's former-numbering table maps them, and the brief's overlap tool reports no dropped id.

## What moved from the Lean to the README

Nothing. The package file already meets the Lean form, and it is kept as it was apart from the `module` header:

- 15 headline theorems and 9 definitions, each needed by a headline. The definitions have real bodies on pinned carriers (`IsWeakForm`, `modularLambda`, `lambdaField`, `congruenceSpan`, `boundedDenominatorSpan`, `IsVectorValuedForm`, `weakFormAlgebra`, `quasiModularWeakAlgebra`, `HasCuspidalExpansionOver`).
- No sorry'd data, no `example`, no `set_option`, no `variable` block.
- Imports: `Mathlib` and `TauCeti.NumberTheory.ModularForms.QExpansion.Laurent`, which is used and exists at the pin.

The module docstring names the headlines that are not stated and why:

- degree doubling (§§5.3, 5.5), whose hypothesis `R₂N ≠ M₂N` the stated equality refutes;
- the three-point differential equation theorems (§§7.1–7.2), which lack analytic continuation of ODE solutions and local monodromy at the pins;
- the fundamental group of the cuspidal model (§9.3), which lacks the minimal regular model of `X(N)` over `𝓞_K` and its cusp section.

The review accepted these reasons and they are kept.

## Supplier replacements and duplication removals

None needed. What was checked:

- **Pinned library names.** All 92 Mathlib and Tau Ceti declarations the README names were elaborated by `#check` at the pins (list below), with namespaces confirmed: `TauCeti.Subgroup.integerCuspWidth`, `TauCeti.UpperHalfPlane.laurentQExpansion*`, `Subgroup.CompactifiedQuotient.*`, `HeckeRing.GL2.Newform.basis`, `ModularForm.sturm_bound_finiteIndex_SL2Z`. I also opened the statements the README relies on: `TauCeti.qExpansion_nat_mul` (hypotheses `0 < h`, `0 < m`, periodic, bounded, `MDiff`), `laurentQExpansion` (a shift by the pole order), `TauCeti.ModularForm.eta_two_mul`/`eta_div_two`, `ModularForm.sturm_bound_finiteIndex_SL2Z` (order in the strict width greater than `(k·[SL₂(ℤ):Γ]).toNat/12`), `Subgroup.adjoinNegOne`, `IsCoveringMapOn`, `NumberField.InfinitePlace.apply`, and the `HasDetPlusMinusOne` instances for images of `SL₂(ℤ)`.
- **Pins by object.** Neither pinned library has a Wohlfahrt theorem, a modular λ function, a weak-form predicate, a geometric level, a vector-valued or quasimodular carrier or a deficient place. Tau Ceti's `TauCeti/Analysis/Complex/WeaklyHolomorphic.lean` is weak holomorphy of Banach-valued maps, a different notion.
- **Roadmaps by object.** I searched main and the 457 open roadmap pull requests at their heads (roadmaps tool), and the 698 board packages, for the signed level and Wohlfahrt, the λ function and its covering, unbounded denominators, the nonabelian Ihara lemma, quasimodular forms, Mason's conjecture, deficient places, vector-valued forms, Catalan and `C(2n, n)²` series, the second-kind elliptic integral in theta form, and `π₁` of the model of `X(N)`. Results:
  - Wohlfahrt appears only in NoncongruenceModularForms, which owns the strict form and cites the signed form here.
  - SpecialFunctionsTheta owns λ, its laws and its mapping theorem, but not the covering or the η presentation; its `modularLambda` lives in its own namespace, so no fully qualified name is shared.
  - PainleveEquations takes the λ cover as an input; it does not plan it.
  - Every other "unbounded denominators" hit (IntegralIwasawaTheoryPartII, KatoEulerSystems, RelativeFarguesFontainePartII, HabiroCyclotomicCompletions and others) is a different sense of the phrase or a bare citation of CDT.
  - "Deficient places" in HyperellipticCurves are Poonen–Stoll's, a different notion.
  - HalfIntegralWeightModularForms assigns vector-valued forms attached to the Weil representation to MetaplecticAutomorphicForms. Our §7.3 carrier is the semisimple-`ρ(T)` case of QSeriesPartitionsAndMockModularForms §8.1, as Scope says.
  - EllipticPeriods only mentions `E₂` as quasimodular.
  - So every object this roadmap owns has no second owner.
- **No cycle with NoncongruenceModularForms.** Its §8.1 (bounded denominators of number-field congruence forms) is not cited here. §8.6 derives the bound it needs from ModularForms §§8.0–8.1 and AlgebraicModularFormsAndSerreWeights §2.9, and citing NoncongruenceModularForms would create a cycle, since that roadmap consumes this one.

## README fixes from the reviewer's reading

I read the whole README as an upstream reviewer would. I found nothing wrong or vacuous, and every claim has a locator or a supplier section. The adversarial table below recomputes every series, matrix and numerical value. Changes made:

1. **Summary link.** It now points to `../ModularForms/README.md`, the relative form the roadmaps on main use, instead of an absolute GitHub URL.
2. **§2.5, the normalized Kummer coordinate `x_N`.** This was the one definition with neither an API list nor Checks. Added:
   - API: `x₁ = x`; `x_N(t) = t·w(t^N)` with `w = (x/q)^(1/N) ∈ 1 + qℤ[1/N][[q]]` and q-coefficient `−8/N`; compatibility `x_N(t)^(N/M) = x_M(t^(N/M))` for `M ∣ N`; integrality exactly when `N ∣ 8`.
   - Four Checks: `x₂ = t − 4t³ + 14t⁵ − 40t⁷ + ⋯` integral; `x₃ = t − (8/3)t⁴ + (68/9)t⁷ − (1408/81)t¹⁰ + ⋯` with 3-power denominators; `x₁₆ = t − (1/2)t¹⁷ + ⋯` not integral although 16 is a power of 2; the root of λ in place of `x = λ/16` has the irrational leading coefficient `16^(1/3)` at `N = 3`.
   - All values computed in exact rationals. The criterion `N ∣ 8` agrees with the Fermat exponents `{1, 2, 4, 8}` of §6.9.

No other wording changed; the README had no process words, LaTeX, machine paths or pull-request numbers.

## Signature check

Mechanical check, done as required:

- I appended `#check @TauCetiRoadmap.ModularFormsPartII.<name>` for all 24 declarations, and `#check` for the 92 library names, to a temporary copy of `Suggested.lean`, with the needed Tau Ceti modules imported temporarily. I elaborated it once with the module build and then restored the file.
- Every elaborated type matches its README statement and the package's `signatures.md`. The file has no `variable` block, so no binder can be lost. The binders are explicit in each signature: `hneg`/`hle`/`hlevel` on `ihara_generation`; `3 ≤ N`, `p.Prime`, `¬ p ∣ N` on both Layer 4 theorems; `[Γ.FiniteIndex]` on the Layer 6 and §8.2 theorems; `0 < N` on both span theorems; `[NumberField K]` on the deficient-place theorems.
- Nothing changed.

## Adversarial mathematics pass

All series were computed in exact rationals (a script of my own, truncated at order 17 or 39), numerics in double precision, and matrices by hand.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.1 product formula for `x = λ/16` | η quotient vs product; route through `eta_two_mul`/`eta_div_two` | Both equal `q − 8q² + 44q³ − 192q⁴ + 718q⁵ − 2400q⁶ + 7352q⁷` through `q¹⁷`; η prefactor `8(−1/24 + 2/12) = 1` | True | — |
| §2.1 Checks, shared nome with SpecialFunctionsTheta | `τ = 0.3 + 0.8i`, `1.3 + 0.8i`, `0.6 + 1.6i`, `i` | `0.76600288 + 0.40978633i`, `−0.05082479 − 1.84025179i` (= λ/(λ − 1) of the first), `−0.02782422 + 0.10296129i`, `λ(i) = 0.5`; SpecialFunctionsTheta §6.1 records the same first two | True | — |
| §2.1 `λ(τ + 1) = λ/(λ − 1)` | series | both `−16q − 128q² − 704q³` | True | — |
| `modularLambda_covering` (§2.2) boundary | `1 ± i`, `(±1 + i)/2` | `λ(1 + i) = λ(−1 + i) = −1`, `λ((1 + i)/2) = λ((−1 + i)/2) = 2` | True | — |
| §2.3 integral inverse | revert x | `q = x + 8x² + 84x³ + 992x⁴ + 12514x⁵ + 164688x⁶ + 2232200x⁷`, integral through `x¹⁷` | True | — |
| §2.5 Kummer roots (new Checks) | `N = 1, 2, 3, 4, 5, 6, 8, 16` | `x₂ = t − 4t³ + 14t⁵ − 40t⁷ + 101t⁹`, `x₄ = t − 2t⁵ + 5t⁹`, `x₈ = t − t⁹`, all integral; `x₃` denominators `3, 9, 81, 243`; `x₅ = t − (8/5)t⁶`; `x₁₆ = t − (1/2)t¹⁷ + (7/8)t³³` | Integral iff `N ∣ 8` | API + 4 Checks added |
| §2.6 `K₀(x(q)) = θ₃²` | series; off-cusp point `τ₀ = (8 + 2i)/17` | Equal through `q¹⁷`; `λ(τ₀) = λ(2i) = 0.0294373`, `K₀(λ/16) = 1.0074837`, `θ₃(τ₀)² = 1.0074837 + 4.0299349i = (1 + 4i)θ₃(2i)²` | True locally, false on `|λ| < 1` as stated | — |
| §2.7 `F₂′(0) = γ₂` | `λ′(i)` numerically | `λ′(i) = 1.0942198i`, `F₂′(0) = −2λ′(i)·2i = 4.3768792 = Γ(1/4)⁴/(4π²)`; `γ₃ = 2.5810565`; both above `16^(1/N)` (`4`, `2.5198421`) | True | — |
| §1.3 Checks, `H′` and the η² character | `g = [[1, 0], [1, 1]]` | `gT²g⁻¹ = [[−1, 2], [−2, 3]]` (`a = −1 ≢ 1 mod 4`), `gT⁴g⁻¹ = [[−3, 4], [−4, 5]] ∈ H′`; `χ(S)⁴ = 1`, `(χ(S)χ(T))³ = (−i·e^(πi/6))³ = −1 = χ(S)²`; `±G` contains `T^m` iff `6 ∣ m`, `G` iff `12 ∣ m` | True | — |
| `wohlfahrt_Gamma_le` (§1.8) | `N = 0`; `H′` at `N = 2`; KSV10 (1) at `a = 2` | `Γ(0) = ⊥`; `−I ∈ Γ(2) ∖ H′` refutes the unsigned form; `(Tᵗ)⁻¹T^(a−1)Tᵗ = [[a, a − 1], [1 − a, 2 − a]]`, `[[2, 1], [−1, 0]]` at `a = 2`; printed order gives `[[0, 1], [−1, 2]]` | True signed; KSV10 misprint confirmed | — |
| §1.7 case split | `p = 2`, `B = [[1, 0], [1, 1]]`, `[[2, 1], [1, 1]]` | `A⁻¹(BT²B⁻¹)A = [[−1, 1], [−4, 3]] = CTC⁻¹`, `C = [[1, 0], [2, 1]]`; `BT²B⁻¹ = [[−3, 8], [−2, 5]] ↦ [[−3, 4], [−4, 5]] = CT⁴C⁻¹`, `C = [[1, 1], [1, 2]]`, det 1 | True | — |
| §3.0, §3.2 Checks | `Γ₀(3)` at `N = 1` | η-exponent `12(1/24 − 3/24) = −1`; `[[1, 0], [3, 1]]·[[1, 0], [2, 1]]⁻¹ = [[1, 0], [1, 1]]`, and `T`, `Tᵗ` generate `SL₂(ℤ)` (`T⁻¹TᵗT⁻¹ = S`) | Definition with `T^(2N) ∈ H` alone would be wrong, as stated | — |
| §3.4 apparent singularity | `f = λ − 1/2`, `N = 1` | `16 − (16u − 1/2)/(u − 1/32) = 0`, residue −1 at `u = 1/32 = λ(i)/16` | True | — |
| §3.5, §3.8 | `N = 2`, `r = 0.95`; `log|φ′(0)|` bound | `|φ′(0)| = 0.95·γ₂/4 = 1.0395088`; `log(1 + u) + log(1 − u/2) = u/2 − O(u²) ≥ u/3` for small `u = A/N³` | True | — |
| `nonabelian_ihara` (§4.1), conjugation | `A = diag(p, 1)` on `[[a, b], [c, d]]` | `AgA⁻¹ = [[a, pb], [c/p, d]]`, in `Γ(N)` when `g ∈ Γ(N) ∩ Γ₀(p)`, `p ∤ N`; `[[1, 0], [6, 1]] ↦ [[1, 0], [3, 1]] ∉ Γ₀(2)` at `N = 3` | True; hypothesis `c` is satisfiable and unique | — |
| `ihara_generation` (§4.3), forward inclusion | third generating set | `AgA⁻¹` integral forces `p ∣ c`; in `±Γ(N)` forces `g ∈ ±Γ(N)` since p is a unit mod N | Generators lie in the right side | — |
| §5.4 degree formula | `N = 1, 2, 3, 4` | `1/2, 4, 12, 32` vs `4N³/π² = 0.41, 3.24, 10.94, 25.94` | True for `N > 1`; `N = 1` split off | — |
| `boundedDenominatorSpan_finrank_le` (§6.1) | `N = 1` | `[R₂ : ℚ(λ)] = 1 ≤ C log 2` needs `C ≥ 1/log 2` | Consistent | — |
| §6.2 `h₀` and its Checks | series; `η(τ)²` and `+1` variants; `ε²` | `h₀ = q^(11/12)(1 − 6q + 33q² − 134q³)`, `h₀⁻¹ = q^(−11/12)(1 + 6q + 3q² − 46q³)`; `x/η(τ)² = q^(5/6)(1 − 8q + 46q²)`; `xη(τ/2)² = q^(13/12)(1 − 10q + 59q²)`; Kronecker numerator at `[[1, 0], [12, 1]]`: `24 − 36 = −12`, `ε = −1`; for `c < 0` in `Γ(12)` numerator of `−γ` `≡ −6 mod 12` | True | — |
| `unbounded_denominators`, `rational_…` (§§6.3–6.4) | `f = 0`; `Δ⁻¹/11` | `QΔ⁻¹ = 1 + 24Q + 324Q² + 3200Q³`; `D = 11` clears it, `Γ′ = SL₂(ℤ)` | True | — |
| `weakForm_galois_conjugate` (§6.5) | `√2Δ⁻¹` | coefficients `√2(1, 24, 324, …)` at `Q^(−1), Q⁰, Q¹`; conjugate `−√2Δ⁻¹` | True | — |
| §6.7 `j^(1/3)` | series | `E₄/η⁸ = Q^(−1/3)(1 + 248Q + 4124Q² + 34752Q³ + 213126Q⁴)`; `ε⁸ = e(num/3)`, numerators `≡ 0 mod 3` on `Γ(3)` | True | — |
| §6.8 root test | `n = 5, 24`; identities | `x(1 − λ)/q = ∏_{m odd}(1 + q^m)^(−24) = ∏((1 + q^(2m))/(1 + q^m))^24`; `u^(1/5) = 1 − 24/5 q + 348/25 q² − 4544/125 q³ + 52854/625 q⁴`; `u^(1/24) = 1 − q + q² − 2q³ + 2q⁴ − 3q⁵ + 4q⁶` | True | — |
| §6.9 Fermat test | `n = 2, 4, 8, 16` (2-adic), `n = 3` (3-adic) | `n = 8`: `1, 1, 2, 1, 2, 2, 3, 1, 2`; `n = 16`: `0, −1, −1, −3, −3, −4, −4, −7, −7`; `n = 3`: `−1, −2, −4, −5, −6, −8, −9, −10, −13`; formula `(4 − a)m − v₂(m!)` verified for `a = 1, …, 4` through `m = 17`; `C(1/16, 2)·256 = −15/2` | True | — |
| `IsVectorValuedForm` (§7.3) sign | cocycle; `γ = −I` | `F(γδτ)` via `(c_γδτ + d_γ)^k(c_δτ + d_δ)^k = (c_{γδ}τ + d_{γδ})^k` gives `ρ(γδ) = ρ(γ)ρ(δ)`; odd k forces `F = 0` | Consistent with a left action | — |
| §7.13 `σ`; `vectorValued_effective_mason` | matrices | `σ(R)² = [[−3, −1], [7, 2]]`, `σ(R)³ = I`, `σ(T) = [[2, 1], [7, 3]]`, trace 5, det −1, `e₊ = 5.1925824`, `e₋ = −0.1925824 = −1/e₊`, `c = 0.2621650` | Infinite image, trivial value span | — |
| Layer 7 Examples | `μ = √2 − 1`; `θ₃²` on `H′`; `η⁴` | `s = 0.5132884`, `ρ(R)³ = I`, `ρ(T)` trace `1.0265768i = 2is`, det −1, eigenvalues of modulus 1 with exponents `0.0857864`, `0.4142136`; `B = [[−3, −2], [2, 1]]`, `B² = [[5, 4], [−4, −3]]`; `η⁴ = Q^(1/6)(1 − 4Q + 2Q² + 8Q³ − 5Q⁴)` | True | — |
| `quasiModularWeakAlgebra_differential_closure` (§8.2), §8.1 Checks | `E₂` | `(E₂∣[2]S)(τ) = E₂ + 6/(πiτ)`; growth in n kills `k > 2`, leaves `f₂ = E₂`; `Δ = q² − 24q⁴`, `θ_qΔ = 2q² − 96q⁴`, `E₂Δ = DΔ = q² − 48q⁴` | True | — |
| §8.3 `E₀` | series; negated sign; theta form; Sturm | `E₀ = (1 − 16x)K₀ + 8∫K₀ = (1 − 16x)(K₀ + 2xK₀′)` through `x¹⁷`, constant 1 (negation −1); `E₀(x(q)) = 1 − 4q + 20q² − 64q³ + 164q⁴ − 392q⁵ + 896q⁶` = theta form; `θ_q x = xθ₄⁴`; Sturm bound `(2·6).toNat/12 = 1` | True | — |
| §8.4 Catalan | series; integrality | `ΣC_n²x^n = 1 + q − 4q² + 5q³ + 12q⁴ − 42q⁵ + 0q⁶`, equal to the theta quotient, whose `q⁻¹` coefficient is 0; `I₁′ = K₀`, `xI₂′ = I₁`, both integral | True | — |
| `congruenceKernel_no_deficient_place` (§8.6) | `k ≤ 1`; `E₄`; `√2Δ` | weight `≤ 0` cusp forms and odd weight (as `ρ(−I) = 1`) are zero, so the bound holds trivially; `240σ₃(m) ≥ 240m³` exceeds `m^(3/2+ε)`, which is why the constant term is excluded; `M = 1`: conjugate `−√2Δ` | True | — |
| `exists_deficient_finite_place` (§8.7) | `S = ∅`; `ρ = 1 ⊕ σ` | integral everywhere ⇒ congruence by §7.11's `𝓞_K` form, contradicting `hnon`; `σ(T)^h − 1` invertible since `e₊^h, e₋^h ≠ 1` | True (vacuous at `S = ∅`) | — |
| §9.1 Check, non-minimal model | blow-up of `ℙ¹` at a point of a fibre | `F = C + E`, `F² = 0`, `C·E = 1`, `E² = −1`, `C² = −1` | True | — |
| §9.3 Example | `X₁(11) → X₀(11)` | degree `|(ℤ/11)^×/±1| = 5`, `0 = 5·0 + R`, `R = 0` | True | — |

## Unresolved

- I did not re-read the source PDFs (CDT25, KSV10) this round; the locators are the package's, which the accepted review sampled and checked. The KSV10 misprint was recomputed above.
- Ownership against open pull requests was checked through the roadmaps tool, which reads all 457 open roadmap heads. The few heads not among the 238 listed checkouts (SpecialFunctionsTheta, ModularCurvesPartII, AlgebraicModularFormsAndSerreWeights, AutomorphicGaloisRepresentations) were read with `roadmaps show`.
- No suspicious instruction was found in any text I read.


Pull request: #2434 (roadmap/modular-forms-part-ii at cd38aeb)
