# Review of EllipticCurvePeriodsAndModularParametrizations (pull request #1715 at 7a356fe)

**Verdict:** accepted

One P3 note; no blocking finding. The gate passes at this head, the dependency check reports no UPWARD or CYCLE line, `Suggested.lean` elaborates with `sorry` as the only warning, and the five findings of the previous review are repaired (table below).

## R01 (P3) — `max(θ, 1)` in the split-case asymptotic is vacuous

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md:1725` (“Solving the split-case identity exactly gives m_n(w) = h_K c_w (p−1)pⁿ⁻¹ + O(n·max(θ,1)ⁿ)”).

**Claim:** The error term needs a guard against `θ ≤ 1`.

**Witness:** `θ` is the largest modulus of a root of `x² − λx + p` over the eigenvalues `λ` on the orthogonal complement; the two roots have product `p`, so `θ ≥ √p > 1` for every `λ`, and the recursion `m_n + m_{n−1} = M_n − M_{n−1}` accumulates `Σ_{k≤n} (k+1)θ^k = O((n+1)θⁿ)` exactly when `θ > 1`. The guard never acts, and the leading term `h_K c_w (p−1)pⁿ⁻¹` and the positivity argument are unaffected.

**Repair:** Write `O(nθⁿ)` and add “`θ ≥ √p`” where `θ` is introduced (line 1715). Tested on the instance `p = 3`, `λ = 0`: `θ = √3 = 1.7321 > 1`, so the two bounds coincide.

## Verified sound

A full review: the whole README (2408 lines) and `Suggested.lean` (392 lines, unchanged since the previous head) were read; the 181-line change set since 2ec386f was read line by line, and every changed passage is covered below.

### Previous findings, checked individually

| Previous finding | Passage at this head | Assessment |
|---|---|---|
| R01 (P2) split-`p` CM-reduction route false | README 1666–1725 (“dually the pairs (b, C) … correspond bijectively to C_n”; the Bruhat–Tits apartment description; `M_n(w) = m_n(w) + 2 Σ_(k<n) m_k(w)` when `p` splits; `m_n(w) ≥ M_n(w) − 2M_(n−1)(w)`; `M_n − 2M_(n−1) = h_K c_w (p+1)(p−2)pⁿ⁻² + O((n+1)θⁿ)`), Checks 1775–1786 | Repaired. The pair bijection is right: for `L` with `End = O_n` the sublattice `pⁿLO_K` has cyclic quotient (`p^(n−1)LO_K ⊆ L` would make `L` an `O_(n−1)`-module), and `λ p⁻ⁿb = p⁻ⁿb` forces `λ ∈ O_K^× = {±1}`. The tree classification was recomputed (table): for `p = 3`, `n = 2`, the 12 cyclic 9-subgroups of a conductor-one point split as 6 / 4 / 2 by exact conductor `9 / 3 / 1`, and a path running `j` steps along the apartment ends at the lattice `𝔭^(−j)b` exactly (a superlattice of `b` with cyclic quotient of order `p^j` homothetic to `𝔭^(−j)b` has norm index forcing the scalar to be a unit). The identity `M_n = m_n + 2Σ_(k<n) m_k` was verified for `p = 3, 5, 7`, `n ≤ 4`; its consequence `m_n ≥ M_n − 2M_(n−1)` holds in both cases (`m_n − 2Σ_(k<n−1) m_k ≤ m_n` split; `M_n ≥ 0` inert), and the leading term `(p+1)(p−2)pⁿ⁻²` is positive for odd `p` and vanishes at `p = 2`, as the Check says. |
| R02 (P3) Greenberg route's invalid inference | README 1520–1552 (“Prove that X has no nonzero finite Λ-submodule … Greenberg's idelic argument with S the set of primes of F above 𝔩 … Prove that i_(n,m) is injective (Greenberg Lemma 4, p. 92) … the S-adic Leopoldt property … holds because F_m is abelian over the imaginary quadratic field K (Brumer's theorem, as Greenberg's closing remark applies it)”), new Checks 1561–1567 | Repaired. Greenberg 1978 was read this round (greenberg1978, GDZ): Proposition 3 and §4 open on printed p. 91 (greenberg1978 lines 308, 329–339), its proof with `B_n` the `p`-primary part of the preimage, the norm isomorphism `B_m ≅ B_n` and the inclusion `i_(n,m)` (lines 340–371, pp. 91–92), Lemma 4 with its cocycle/`H¹`/roots-of-unity proof (lines 383–418, pp. 92–93), and the closing remark on the one-prime module over an abelian extension of an imaginary quadratic field with Brumer's theorem supplying the `S`-adic Leopoldt property (lines 437–454, pp. 93–94). The README's route is that proof, stated on `X` itself; the quotient inference is gone and the new Check records the `Λ/(3,T)` counterexample. `IntegralIwasawaTheory §2.5` is no longer cited anywhere (grep: 0 hits). |
| R03 (P3) Stevens Theorem 7.1 page | README 1876, 2360 (“p. 104”) | Repaired: stevens line 1148 is on scan page 31; page 23 carries the printed header “96” (line 832) and page 32 “105” (line 1174), so page 31 is p. 104. |
| R04 (P3) contract bundled three theorems | README 320–335 (“supply the three statements restated with their hypotheses and conventions in §4.10, namely (i) Rubin's one-variable main conjecture … (ii) the Katz–de Shalit interpolation … (iii) Hida's almost-all-character unit theorem”) | Repaired as one sentence with the three clauses named and their hypotheses in §4.10 (lines 1500–1515, 1569–1594, 1612–1621). The slug is the one HeegnerPointEulerSystems README line 271 declares on the same supplier; this pull request still carries no `design/plan.json` (the brief records none readable), so nothing further is asked. |
| R05 (P3) twists with `7 ∣ D` | README 1854–1859 (“those among them twisted by a discriminant prime to 7 have good ordinary reduction at 7 (a₇ = ±2) … the twists by a discriminant divisible by 7 are additive at 7 and outside the hypotheses of Theorem 1.11. Two further inputs cover every twist”), Check 1923–1926 | Repaired; `χ_5(7) = (7/5) = −1`, so `a₇(162b1 ⊗ χ_5) = −2` as the Check says. |

### Gate, dependency check, build, binders, padding

Worker's gate at 7a356fe: every check passes (`depcheck=0 … build=0 OK`). Dependency check run here on the candidate order:

```text
depcheck: 204 roadmaps, 1629 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line; the roadmap is at position 319, after GrossZagierAndArithmeticHeights (318); every supplier named in the changed text is earlier (IntegralIwasawaTheory 24 is no longer cited; EulerSystemsCyclotomicMainConjecture 151; ClassFieldTheory, PadicMeasuresIwasawaAlgebras, ImaginaryQuadraticClassNumber and GlobalNumberFields are on main). `git diff --stat origin/main...HEAD` outside the folder is empty.

`lake env lean` on `Suggested.lean`: 36 `declaration uses 'sorry'` warnings, exit 0, nothing else. A scratch copy with `#check @name` for all 54 declarations elaborated (exit 0); the four binders the worker flags (`localPeriod` and `jDenominatorIdeal` carry no `[NumberField K]`; `analyticRank` and `leadingCoefficient` carry no `[W.IsElliptic]`) are exactly the generality the Conventions paragraph (README 133–139) announces, and every positivity, finiteness and nonvanishing theorem (`localPeriod_pos`, `jDenominatorIdeal_dvd_minimalDiscriminantIdeal`, `analyticOrderAt_ne_top`, `leadingCoefficient_ne_zero`) carries the instance. One-tactic probe (`first | rfl | simp | infer_instance | exact trivial | decide | (intros; simp_all)`) on a scratch copy: 36 error sites, 0 closed. No padding, no sorry'd data, no `set_option`, no admitted `example`; imports are `import Mathlib` and five `TauCeti.*` modules that exist at the pin.

Headline inventory (README): lattice characterization and real shapes (1.1, 1.6), model invariance of the global period (2.5), isogeny lattice inclusion with degree index (2.7), nonvanishing and continuation-independent leading term (3.2–3.4), Stevens' minimal curve (4.10), rank-zero rationality (4.12), Faltings ratio one iff minimal (5.5): all stated. The module docstring names the non-statable headlines with their missing carriers (modular-curve quotient and integral homology, elliptic-unit modules and the CM measure, CM conductor points and the supersingular locus, the Tamagawa product, the metrized Hodge line); the pinned trees have no `faltingsHeight`, Tamagawa product or modular-curve quotient (grep of both pins).

### Pinned declarations opened (Mathlib and Tau Ceti at the pins of `lake-manifest.json`)

| Object | File at the pin | What was read |
|---|---|---|
| `embedding_of_isReal_apply`, `mk_conjugate_eq`, `card_add_two_mul_card_eq_rank` | `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean:244`, 108, 474 | 2.1's real-place and conjugate-embedding inputs |
| `covolume_pos`, `covolume_comap`, `covolume_eq_det`, `covolume_div_covolume_eq_relIndex'` | `Mathlib/Algebra/Module/ZLattice/Covolume.lean:98`, 102, 125, 170 | 2.3, 2.7, 5.5 |
| `localPolynomial` | `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:43`–49 | good `1 − aX + qX²`, split `1 − X`, nonsplit `1 + X`, additive `1`: 3.2's bad factors |
| `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, `analyticOrderAt`, `AnalyticAt.meromorphicOrderAt_eq` | `Mathlib/NumberTheory/LSeries/ZMod.lean:203` (use site), `Mathlib/Analysis/Analytic/Order.lean:48`, `Mathlib/Analysis/Meromorphic/Order.lean:303` | 3.3–3.4 |
| `mem_colon_singleton` | `Mathlib/RingTheory/Ideal/Colon.lean:48` | `r ∈ N.colon {x} ↔ r • x ∈ N`: `jDenominatorIdeal` is the integrality ideal (5.3) |
| `g₂ = 60 * G 4`, `g₃ = 140 * G 6` | `Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean:956`, 959 | 1.1 |
| `instAdmissibleAbsValues`, `absLogHeight₁`, `InfinitePlace.prod_eq_abs_norm` | `Mathlib/NumberTheory/Height/NumberField.lean:77`, 145; `ProductFormula.lean:100` (use site) | 3.5, 2.4 |
| `minimalDiscriminantIdeal`, `_smul`, `_eq_span_of_isGlobalMinimal`, `isGlobalMinimal_iff_…` | `TauCeti/AlgebraicGeometry/EllipticCurve/MinimalModel/DiscriminantIdeal.lean:157`, 164, 235, 247 | 2.5 |
| `reducedMinimalModel_smul`, `exists_smul_eq_reducedMinimalModel`, `existsUnique_reducedMinimal` | `…/MinimalModel/Reduced.lean:207`, 213, 70 | 2.6 |
| `Isogeny.pullbackDifferential`, `pullbackDifferential_negIsogeny_invariantDifferential`, `Hom.pullbackDifferential_zsmul_id_invariantDifferential`, `existsUnique_smul_invariantDifferential` | `…/Isogeny/Differential.lean:69`, 153; `…/Isogeny/Hom/Differential.lean:79`; `…/Affine/InvariantDifferential.lean:36` | 2.7, 4.4 |
| `peterssonInnerCosets_definite`, `periodMap`, `periodMap_injective` | `TauCeti/NumberTheory/ModularForms/Petersson/FiniteIndex.lean:212`; `…/ModularSymbols/Period/Map.lean:94` | 4.7, 4.1 |
| `regulator_eq_abs_det_neronTateGramMatrix`, `regulator_eq_one_of_finrank_eq_zero`, `neronTatePairing_apply`, `fg_point_of_numberField`, `IsSemistable` | `…/MordellWeil/Regulator.lean:95`, 104; `…/CanonicalHeight/Basic.lean:378`; `…/MordellWeil/FinitelyGenerated.lean:34`; `…/MinimalModel/Semistable.lean:90` | 3.5, 4.9, 5.3 |

### Cross-roadmap citations resolved (at the copy named, this round)

On main (929496d): ClassFieldTheory Layers 11 and 13 (`ringClassField`, `gal_ringClassField_equiv_pic`); ImaginaryQuadraticClassNumber §§H1.4, H3.1; PadicMeasuresIwasawaAlgebras §§1.7, 2.1, 4.1, 4.5, 4.6; GlobalNumberFields (Completed) Layers 9–10; EllipticCurves Layers 2, 4, 4.5a–b, 6, 7; ModularForms Layers 3, 8, 10B; ArithmeticDirichletSeries (Completed) Layer 3 items 3.1–3.3 (`EulerProductData`, finite products, infinite Euler product under absolute convergence); EllipticIntegrals Milestone 8 (items 2–3: three and one real roots); ComplexTori. At open heads: GrossZagierAndArithmeticHeights §§0a.2, 0.5, 3.1, 3.5, 3.7–3.10 (`cmCyclicPair`, `c_φ`); PeriodsAndSpecialValues PS.1.1, PS.1.7, PS.1.8, PS.3.3; EllipticCurveModularityPartII §§5.0a–5.0b; HeegnerPointEulerSystems line 271 (`gap:eisenstein-elliptic-unit-inputs` on EulerSystemsCyclotomicMainConjecture); ArakelovGeometryAndAbelianHeights §§2.1 (line 684), 2.2, 2.3, 2.7, 2.9, 3.1, 3.4 with `faltingsHeight_eq`, `faltingsHeight_11a2`, `faltingsHeight_model_nonexample`, `stableFaltingsHeight_le`, `stableFaltingsHeight_eq_of_semistable`, `stableFaltingsHeight_congr_geometric`; EllipticCurveModularity Layers R29.3–R29.6 (1020, 1261, 1472, 1605), “Elliptic coefficient summability” (1860), “Continuation and the functional equation” (1926), `exists_entire_completed_LSeries` (1930), the Jacobian-quotient converse (1690); ModularCurvesPartII §§1.1–1.4, 1.4a, 5.1, 5.17, 7.2, 7.5–7.6, 11.1–11.2, 14.12, 14.15, 16.2, 16.5, `invariantDifferentialsAndPeriods` (477), `homothetyAndIsogenyCompatibility` (456); FaltingsFinitenessAndIsogenyTheorems R28.6.5 (2767), R28.6.6 (2788); NeronModelsAndSemistableAbelianVarieties R11.1 (= Layer 1, line 693); ModularSymbolsPadicLFunctions §§0.4 (672), 0.8 (1232), 1.2 (1381); ComplexMultiplicationAndExplicitReciprocity §§5.1 (733), 5.2 (779); SerreWeightAndLevelOptimisation §2.6 with the Deuring–Eichler supersingular comparison (453: ideal class set `B×\B̂×/R̂×`, prime-to-`qM` Hecke correspondences, weights `w_x = |Aut(E,C)/{±1}|`); HilbertModularVarietiesAndShimuraCurves R18.3.5 (2791), R18.3.6 (2803), R18.3.7 (2819: `F = ℚ` at maximal level has trivial norm quotient and constants with `T_v = q_v + 1`), R18.3.22 (3116); AdelicAlgebraicGroups §4.2 (4150); WeightsInEtaleCohomology §6.1 (695). EulerSystemsCyclotomicMainConjecture is readable only through `roadmaps show`; it states no elliptic-unit result, which is why the contract is a declared gap.

Ownership by object (`roadmaps grep` over the 439 open pull requests and main): the Faltings ratio, Stevens' curve, the Néron lattice as a curve invariant, the analytic order of Ш over `K`, the global period and the modular degree are built in no other roadmap (AdelicImagesAndModularCurves lines 126, 232, 1951 defer them to this roadmap; GrossZagierAndArithmeticHeights owns `c_φ` and the Petersson–degree identity, which are consumed); the surjectivity of CM reduction onto the supersingular locus and Greenberg's one-prime finite-submodule theorem appear in no other roadmap (IntegralIwasawaTheory lines 379–383 state the homological criterion and cyclotomic weak Leopoldt only).

### Seeded source sample

| Target | Text read, locator | Conclusion |
|---|---|---|
| 1.4 | ModularCurvesPartII §1.4 (`invariantDifferentialsAndPeriods`, line 477: the period homomorphism of `ω` has image a full lattice), §1.2 (pointed uniformization, 422) | supports |
| 1.6 | knowl `ec.q.period_lattice` lines 94–98 (rectangular `⟨x, yi⟩` for `Δ > 0` with two components, `⟨2x, x + yi⟩` for `Δ < 0` with one, real period `2x`); Silverman Advanced V.2.3.1 not readable | supports the shapes, the component count and `Ω = 2x` |
| 2.1 | `embedding_of_isReal_apply` (Basic.lean:244), `mk_conjugate_eq` (108) | supports |
| 2.5 | Tau Ceti `minimalDiscriminantIdeal_smul` (164), `minimalDiscriminantIdeal_eq_span_of_isGlobalMinimal` (235), `exists_smul_eq_reducedMinimalModel` (Reduced.lean:213); knowl `ec.q.real_period` line 90 | supports; the `32a1`/`ℚ(i)` prefactor `2` recomputed below |
| 2.6 | knowl `ec.q.period_lattice` line 100 (the Néron lattice is the lattice of a global minimal model); Tau Ceti `reducedMinimalModel_smul` (207) | supports |
| 2.7 | ModularCurvesPartII §1.3 (`homothetyAndIsogenyCompatibility`, 456); Tau Ceti `Isogeny.pullbackDifferential` (69), `Hom.pullbackDifferential_zsmul_id_invariantDifferential` (`[n]^*ω = n • ω`, Hom/Differential.lean:37); Mathlib `covolume_div_covolume_eq_relIndex'` (170); vatsal line 158 (Remark 1.4: étale isogenies are cyclic, unique up to automorphism) | supports; `11a` indices recomputed below |
| 3.2 | `LFunction.lean:43`–49; ArithmeticDirichletSeries Layer 3 items 3.1–3.3 | the four local factors are Mathlib's |
| 3.3 | Mathlib `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`; EllipticCurveModularity `exists_entire_completed_LSeries` (1930) | supports |
| 3.6 | knowl `ec.analytic_sha_order` lines 96–105 (`Ш_an = |D_K|^{1/2} L^{(r)}/r! · #tors²/Reg_NT · 1/(Ω ∏c_𝔭)`, `Reg_NT` the un-normalised regulator) | supports |
| 4.2 | EllipticCurveModularity R29.5 (1472: quotient isogenies and parametrisations; `11a3` at 165) | supports |
| 4.4 | GrossZagierAndArithmeticHeights §3.5 (`c_φ`, isogeny law), §3.7 (integrality, odd semistable units) | supports |
| 4.10 | stevens line 424 (Theorem 2.3: unique `A_min` with (a) least height, (b) étale isogeny to every `A`, (c) lattice containment; the étale criterion as an isomorphism on Néron differentials, lines 420–422); vatsal lines 151–157 (Theorem 1.3, the same three forms), 212–220 (Theorems 1.10–1.11), 221–230 (Remark 1.12: `ℓp = 14` at level 49, `21` at level 162), 650–656 (§3.1: units `±1`, `ℓ` odd split, `ℓ ∤ p−1` split / `p+1` inert), 657–660 (`#G_n = h_K pⁿ⁻¹(p ± 1)`), 947–956 (Corollary 3.17 and its proof citing Greenberg end of §4), 1116–1135 (§4.6: `p ∤ NDℓ`, `q` inert, `#C_n = #G_n`, reduction surjective for `n` large), 1148 (Theorem 7.1); greenberg1978 lines 329–454 (above); cornut lines 568–586 (Theorem 3.1, Corollary 3.2) | supports; the hypotheses of the owned CM-reduction target (`p` odd, `p ∤ ND_K`, `q ≠ p` inert, `q ∤ N`) are Vatsal's |
| 4.11 | knowl `ec.q.optimal` not readable (browser check); the predicates are 4.2–4.3's | the statement cites only this roadmap's own targets |
| 5.1 | ArakelovGeometryAndAbelianHeights §3.1 (`faltingsHeight_eq`, 968: `h = (log #(ω̄/O_K α) − ½ Σ_σ log ‖α‖²)/[K:ℚ]`), §2.9 (890), `faltingsHeight_11a2 = −0.3080098` (917) | supports; `−½ log 1.8515436 = −0.3080098` |
| 5.4 | Arakelov §2.3 (741: Faltings norms along isogenies); Faltings 1983 Lemma 5 as read in the previous round (faltings line 392–395, p. 358) | supports; the `11a` differences recomputed below |

### Adversarial mathematics table

Values are my own computations (double precision; covolumes by the AGM lattice computation of the scratch probe; group counts exact).

| Statement | Instance | Left side | Right side / control | Result |
|---|---|---|---|---|
| 1.1 invariants of 11a1 | `[0,−1,1,−10,−20]` | `c₄ = 496`, `c₆ = 20008`, `g₂ = 124/3`, `g₃ = 2501/27` | `g₂³ − 27g₃² = −161051 = −11⁵ = Δ` | agrees |
| 1.1 Weierstrass change | `(u,r,s,t) = (1, −b₂/12, −a₁/2, −a₃/2 + a₁b₂/24)` | `y = y' − (a₁x + a₃)/2`, `x = x' − b₂/12` | gives `y² = x³ − (c₄/48)x − c₆/864` | `u = 1`, `ω` preserved |
| 1.1 CM uniqueness | `g₃ = 0`: `u = i`; `g₂ = 0`: `u = ζ₆` | `i⁴ = 1`, `ζ₆⁶ = 1` | `i⁶ = −1`, `ζ₆⁴ ≠ 1` | exponent choice necessary |
| 1.2 `j` of 11a1 | above | `1728g₂³/Δ = −122023936/161051` | `−2¹²·31³/11⁵` | agrees |
| 1.2 37a1 | `[0,0,1,−1,0]` | `c₄ = 48`, `c₆ = −216`, `Δ = 37` | `g₂ = 4`, `g₃ = −1` | agrees with Worked examples |
| 1.6 / 2.2 shapes | 11a1 (`Δ < 0`), 37a1 (`Δ > 0`) | `[1.2692093, 0.6346047 + 1.4588166i]`; `[2.9934586, 2.4513894i]` | `Ω = 1.2692093`, `5.9869173` | `Ω = 2x` in both |
| 2.3 complex place | 32a1 over `ℚ(i)` | `2 · 0.4296991 · 64/(13.7503716 · 4) = 1.0000` | with `covol` instead of `2 covol`: `2.0000` | factor `2` load-bearing |
| 2.5 prefactor | 32a1 over `ℚ(i)`, `u = 1 + i` | `(2²⁴/2¹²)^{1/12} = 2` | minimal model directly: `covol = 6.8751858 = 2 · 3.4375929` | agrees |
| 2.5 base change | 11a1 over `ℚ(i)` | `2 · 0.3703087 · 25/(3.7030872 · 5) = 1.0000` | with `Ω(11a1)²`: `2.2988` | not multiplicative, as stated |
| 2.6 / 2.7 Néron covolumes | 11a1, 11a2, 11a3 | `1.8515436`, `0.3703067`, `9.2577181` | ratios `5.0000`, `0.2000` | indices `5` with `α = 1`, `5` |
| 3.1 norm-4 coefficient | 11a1 over `ℚ(√17)` | `a_𝔭a_𝔭' + a_{𝔭²} + a_{𝔭'²} = 4 + 2 + 2 = 8` | `a₄(11a1) = 2` | not `2` |
| 3.2 bad factors | split, nonsplit, additive | `1 − X`, `1 + X`, `1` | `LFunction.lean:47`–49 | agree with the pin |
| 3.4 factorial | germ `3(s−1)²` | `F″(1)/2! = 3` | `F″(1) = 6` | convention pinned |
| 3.6 `Ш_an` | 11a1; 37a1; 990h3 | `1.0000`; `1.0000`; `1.0000` | definition | agree |
| 3.6 over `ℚ(√5)` | 11a1 | `√5 · 0.7204129 · 25/(1.6108923 · 25) = 1.0000` | without `√5`: `0.447` | prefactor load-bearing |
| 4.12 | 11a1 | `L(E,1)/Ω = 0.2000 = 1/5` | `Λ_f ∩ ℝ = ℤ · 1.2692093 ∌ 0.2538419` | rational, not integral |
| 4.7 / 5.6 Petersson | 11a1; 37a1 | `4π² · 0.0469001 = 1.8515417`; `½ log 2 − log(2π · 0.6097164) = −0.9965421` | `deg φ · covol = 1.8515436`; `−½ log 7.3381327 = −0.9965422` | agree to the inputs' precision |
| 5.1 / 5.4 heights | 11a1 → 11a2, 11a3 | `−0.3080098 + ½ log 5 = 0.4967091`; `+½ log 5 − log 5 = −1.1127288` | Worked examples | agree |
| 5.2 non-minimal model | `y² = x³ + 16` of 27a3 | `−log 2 − ½ log(8.1086283/4) = −1.0464644` | naive `−½ log(covol/4) = −0.3533172 = h + log 2` | prefactor load-bearing |
| 5.3 stable correction | 27a3; 990h3; 990h1; 32a1 | `−log 27/12 = −0.2746531`; `0.5979432`; `0.5979432`; `−1.3105329` | `h_st − h`; the two `990h` stable heights agree | agree |
| 5.5 ratios | 11a, 14a | `5, 25, 1`; `7.8787542/2.6262514 = 3.0000` | Checks `14a1 ↦ 3` | agree |
| 4.10 Vatsal data | `162b1 = [1,−1,1,−5,5]` | `a_p = 0, 2, −3, 2, −3, −1, −6` for `p = 5…23` | `162c1`: `0, 2, 3, 2, 3, −1, 6` with `χ_{−3} = −,+,−,+,−,+,−` | twist relation at all seven primes; `a₇ = 2` ordinary |
| 4.10 twist by `χ_5` | `162b1 ⊗ χ_5` | `(7/5) = −1`, `a₇ = −2` | ordinary at `7` | R05 Check right |
| 4.10 lattices of `162b`, `162c` | `162b1–4`, `162c1–4` | `covol = 4.0843965, 1.3614655, 0.5834852, 0.1944951` (both classes) | ratios `3, 7, 21` | `162b1`, `162c1` minimal |
| 4.10 tree classification, split | `p = 3`, `n = 1, 2, 3` | exact conductor `pⁿ`: `2, 6, 18`; by conductor at `n = 2`: `6 / 4 / 2`; at `n = 3`: `18 / 12 / 4 / 2` | `(p−1)pⁿ⁻¹ = 2, 6, 18`; total `(p+1)pⁿ⁻¹ = 4, 12, 36` | Check and route agree |
| 4.10 tree classification, inert | `p = 3, 5`, `n ≤ 3` | all `(p+1)pⁿ⁻¹` paths at distance `n` | `4, 12, 36`; `6, 30, 150` | agree |
| 4.10 split identity | `p = 3, 5, 7`, `n = 1…4`, per conductor-one point | `M_n = (p+1)pⁿ⁻¹` | `m_n + 2Σ_(k<n) m_k` with `m_0 = 1`, `m_k = (p−1)p^(k−1)` | equal in all 12 cases |
| 4.10 leading term | `p = 2, 3, 5`, `n = 4` | `M_n − 2M_(n−1) = 0, 36, 450` | `(p+1)(p−2)pⁿ⁻² = 0, 36, 450` | vanishes at `p = 2` only |
| 4.10 exact solution | `m_n + m_(n−1) = M_n − M_(n−1)` | particular solution `C(p−1)pⁿ⁻¹` | `C(p−1)pⁿ⁻²(p+1) = C(p²−1)pⁿ⁻²` | agrees; error `O(nθⁿ)` (R01) |
| 4.10 Hecke recursion | `p = 3`, `n = 0…5` | sphere sizes `1, 4, 12, 36, 108, 324` | `T_p² = T^cyc(p²) + (p+1)`, `T_pT^cyc(pⁿ) = T^cyc(pⁿ⁺¹) + pT^cyc(pⁿ⁻¹)` | agree |
| 4.10 Chebyshev eigenvalue | `λ = p + 1 = 4`, `n = 2, 3, 4` | `μ_n − μ_(n−2) = 12, 36, 108` | `(pⁿ⁺¹ − pⁿ⁻¹)/(p−1)` | agree |
| 4.10 spectral gap | `p = 3`, `λ ∈ {±3.9, 3.5, 2√3, 0}` | larger root modulus `2.846, 2.0, 1.732, 1.732` | `< p = 3`; `≥ √3` | `√p ≤ θ < p` (R01) |
| 4.10 pair bijection | `L` with `End = O_n`, `M = pⁿLO_K` | `[LO_K : L] = pⁿ`, `[LO_K : M] = p²ⁿ` | `p^(n−1)LO_K ⊆ L ⇒ O_(n−1)L ⊆ L` | `L/M` cyclic of order `pⁿ` |
| 4.10 apartment step | `L_j ⊇ b`, `L_j/b` cyclic of order `p^j`, `L_j = λ𝔭^(−j)b` | `[λ𝔭^(−j)b : b] = p^j/N(λ)` | `= p^j ⇒ N(λ) = 1` | `L_j = 𝔭^(−j)b` exactly |
| 4.10 Eichler mass | `N = 1`, `q = 11` | `1/3 + 1/2 = 5/6` | `(q−1)/12 = 5/6` | constant parts `2/5`, `3/5` |
| 4.10 Check instances | `K = ℚ(√−7)`, `q = 5`; `K = ℚ(√−23)`, `q = 11`, `p = 7` | `(−7/5) = −1`; `(−23/11) = −1`, `(−23/7) = −1` | inert as required; `p = 3` splits (`(−23/3) = 1`) | agree |
| 4.10 ring-class orders | `ℚ(√−23)`, `p = 7` inert; `p = 3` split | `|G₁| = 24`, `|G₂| = 168`; `#Pic(O₁)/h_K = 2`, `#Pic(O₂)/h_K = 6`, `#C₂ = 18` | vatsal line 658 | agree |
| 4.10 Greenberg route | `ℓ = 3`, exponent `9`, `m − n = 2` | `i ∘ N = ·3² = ·9` on `B_m` | kills `B_m`; `m = n` is the identity | Check right |
| 4.10 Greenberg negative control | `Λ = ℤ₃⟦T⟧ ⊇ (3, T)` | both without finite submodule | `Λ/(3,T) = 𝔽₃` | the route avoids the quotient inference |
| 4.10 Euler factor | `ℓ = 3`; `5`, `a = 2` | `1 − 3a ≡ 1`; `1 − 125a ≡ 1` | unit | agree |
| 4.10 two reducible `E[ℓ], E[p]`, `ℓ ≥ 7` | list `{1,…,19,21,25,27,37,43,67,163}` | products `ℓp` present: `14, 21` | `22, 26, 35 ∉` | only `14, 21` |

## Not verifiable

- **Rubin 1991** Theorem 4.1(i), **Rubin 1994** Theorem 2(i), **Hida 2004** Theorem 1.1, **Brumer 1967**: paywalled or unresolved (Springer, AMS, de Gruyter; Mathematika DOI); checked as restated in vatsal lines 765–770, 885–904 and in greenberg1978 lines 448–451 (Brumer's theorem applied to the `S`-adic property).
- **Vatsal 2003** §6 (the surjectivity statement itself): Project Euclid page without a readable text; the README's owned route does not depend on it, and its hypotheses are read from vatsal lines 1116–1134.
- **Silverman AEC and Advanced Topics**, **BLR §1.2**, **Mazur Corollary 4.1**, **Manin 1972 §5**, **Abbes–Ullmo Theorem A**, **Zagier 1985**: paywalled; checked through Cremona, the knowls, ARS and the suppliers in earlier rounds; nothing in the change set cites them.
- **LMFDB knowls** `ec.q.optimal`, `ec.q.manin_constant`, `ec.q.modular_degree`, `ec.q.faltings_height`, `ec.q.faltings_ratio`: the cached pages are browser checks; the statements were checked against Cremona, Stevens Theorem 2.3 and Vatsal Theorem 1.3.
- The journal pagination of Vatsal 2005 and Cornut 2002 was not compared with the manuscripts; the README cites manuscript pages and says so.

## Source issues

- **Gap** in vatsal at §4.6, author p. 35 (lines 1129–1134): the source says the reduction map `C_n → S_q(N)` is surjective for large `n`, citing [Vat03] §6 and [Cor02]; it should state the hypotheses of that result (`q` inert, `q ∤ NDℓp`) and that `p` may be split or inert at the point of use; affects the proof (the roadmap restates it with the hypotheses and proves it).
