# Review of CompressibleEulerEquations (pull request #2442 at a16a9e6)

**Verdict:** accepted

**Summary.** Accepted: no finding at this head. Every statement of `TauCetiRoadmap/CompressibleEulerEquations/README.md` and `Suggested.lean` was read and recomputed, including the new opening overview, whose four theorems agree with §§6.2, 7.2, 8.2 and 8.4 hypothesis by hypothesis. There are two small corrections (one sentence of the description is out of date about real Sobolev orders; the time orientation by `[B]` is attributed to LorentzianGeometry §7.3, which leaves it to its §8.1) and no format note; none blocks. Two points are left for the human reviewers (Majda1984 could not be read; LukNotes is unpublished).

## C01 — The description says real Sobolev orders "are deferred"; at this head they belong to neither compressible Euler roadmap

A reader of the description expects a later roadmap to take well-posedness at real orders. The description's summary block says "Well-posedness follows the Friedrichs energy method … at integer Sobolev orders, as in the cited theorems; real orders are deferred." The README now says, in Scope and ownership under Fractional orders (README.md:2284–2285), that "well-posedness at real orders is not part of this roadmap or of "Compressible Euler equations, Part II"", and the Part II entry of Downstream consumers (README.md:2155–2161) no longer lists them; CompressibleEulerEquationsPartII at its open head says the same in its own scope.

The text that would be right: "real orders are outside this roadmap and outside Part II."

## C02 — The time orientation by `[B]` is attributed to LorentzianGeometry §7.3, which proves only that `B` is a continuous timelike field

A reader who opens §7.3 of LorentzianGeometry for the orientation does not find it there. The Conventions say "its §7.3 time-orients the acoustical form by `[B]`" (README.md:149–150), §3.1 says §7.3 proves "that `[B]` orients time" (README.md:422), and the supplier contract for §7.3 ends "`B` is a continuous timelike field orienting time" (README.md:2563–2564). At its open head LorentzianGeometry §7.3 proves that `B` is a continuous timelike vector field where `c > 0` and `c`, `v` are continuous, and then says that its §8.1 time-orients the form by `[B]`; the statement "the acoustical metric is time oriented by `B`" is a Check of its §8.1. No result here is affected: §3.2 uses `TimeOrientedLorentzianFieldOn D` of §12.6, which asks only for a timelike field, and the computation `g(B, X) = −c²τ` in the Conventions is §7.3's.

Either wording would do: "its §7.3 makes `B = (1, v)` a continuous timelike field (which its §8.1 uses to orient time)" in the three places, with no new dependency; or cite §8.1 for the orientation and add it to the *Needs* line of §3.1.

## Verified sound

Earlier findings: the previous review (at `59271f0`) had none, so there is nothing to mark repaired. `Suggested.lean` is unchanged since that head; the README change is the new overview, the move of Scope and the supplier contracts to the end, and the Part II boundary (README.md:2155–2161, 2274–2285).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 equations of state (sample) | `p = ρ²/2` at `ρ = 4`; `p = −A/ρ`; ideal gas `k₀ = 1`, `γ = 2` at `(1, 0)`; `p = −ρ²` | `c = 2`, wrong `c = p′` gives `4`; `p′ = A/ρ² > 0`; `∂_ρP = 2`, `c = √2`; `p′ = −2ρ < 0` | holds | none |
| §1.2 barotropic system (sample) | expanding flow, `n = 1`, `t = 1`; boost `w = 1`; `(1 + t, 0)` | `∂_tρ = −ρ₀/4`, `∂_x(ρv) = ρ₀/4`; boosted residual `0`, wrong rule `−1/(1 + t) = −1/2`; `∂_tρ = 1 ≠ 0` | holds | none |
| §2.1 quasilinear systems, `Dominates` (sample) | transport `a = 3`, `ζ = (1, −1)`; wave system `ζ = (1/2, e₁)`; cones `(c, w) → (c′, w′)` | cone condition `1 ≥ 1`, symbol `−2`; eigenvalue `−1/2`; `ζ₀ + w·ζ′ ≥ (c′ − \|w′ − w\|)\|ζ′\| ≥ c\|ζ′\|` | holds | none |
| §2.2 symmetrisers (touched by §3.1) | `n = 1`, `ρ = 1`, `c = 2`, `v = 3`; `P = e^sρ²` at `(1, 0)` | `det(A¹ − λA⁰) = 4(λ − 1)(λ − 5)`; `SM¹` rows `(vP_ρ/ρ, P_ρ, vP_s/ρ)`, `(P_ρ, ρv, P_s)`, `(vP_s/ρ, P_s, dv)`; minors `2, 2, 2` | holds | none |
| Conventions and §3.1, acoustical form (C02) | `n = 2`, `c = 2`, `v = (1, 0)`; `n = 1`, `c = 1`, `v = 0` | Gram determinant `−4`; `g(B, B) = −4`; `(1, 3, 0)` null, `(1, 4, 0)` gives `5`; `g((1, 0), (1, 1/2)) = −1` | holds; orientation pointer is C02 | C02 |
| §3.3 causal pasts, `futureDomainOfDependence` (sample) | expanding flow from `(−1, 1)`; field `(1, x²)` at `(1/2, −4)`; point datum `(1, 0)` | `ẏ = −(1+t)^{−3/2}`, boundary `2√(1+t) − (1+t)`, `0.828` at `t = 1`, closes at `t = 3`; blow-up at `s = 1/4`; `D⁺ = S` | holds | none |
| §4.1 norm (supports §4.2) | `u = e^{−\|x\|²}`, `n = 2`, `k = 2`; `cos x` on `2πℤ` | `π/2 + π + 7π/2 = 5π`; operator-norm version `(7/2 + 8e^{−2})π`; circle norm `2` against `2π`, ratios `π`, `2π` | holds | none |
| §4.2 embeddings, interpolation (sample) | `u = e^{−x²}`; dilations `u(λx)`; `k = 0` | `1 ≤ √(π/2) ≈ 1.2533`; `2G ≤ √5·G`; `λ^{1/2}` against `λ^{1/6}`; `2·3^{1/4}(π/2)^{1/4} ≈ 2.947 ≥ 1.120` | holds | none |
| §4.3 Gagliardo–Nirenberg, Moser (sample) | Nirenberg `(m, j, q, r) = (k, i, ∞, 2)`; `f = 1 + e^{−x²}`, `g = e^{−x²}`; `n = 3` circle map | `1/p = i/n + (i/k)(1/2 − k/n) = i/(2k)`; `(12x² − 2)e^{−2x²}`, norm² `(19/8)√π`, right side `3.60`; `8π³/3` | holds | none |
| §4.4 Friedrichs mollifiers (sample) | `a = sin(x/2)`, `u = sin x`; `a = x`; `u = 1` on `2πℤ` | commutator `μ₂ε²/8` at `π`: `½(5/8 − 3/8)μ₂ε²`; `ψ = −zφ_ε`, `‖ψ′‖_{L¹}` free of `ε`; `1 ≤ C/ε` fails at `2C` | holds | none |
| §5.1 energy identity (sample) | `B = bI`; `A⁰ = √(1 + x²)`, `W = (1 + x²)^{−1/2}`; Jordan block | `E = e^{−2bt}E(0)`; `‖W‖² = π`, `‖W′‖² = π/8`, energy `2 asinh R → ∞`; `W = (g − tf′, f)` grows | holds | none |
| §5.3 `Hᵏ` estimates (sample) | `A⁰ = 1/(2 + u)`, `U = sin mx`, `W = (δ + t)(2 + sin mx)`; Burgers | `S_m ≥ πm⁴/3`, `2√S_m ≤ C₁√(2π)`, so `C₁ ≥ √(2/3)m²`; `d/dt‖u_x‖² = −∫u_x³` | holds | none |
| §5.4 linear existence (sample) | `A⁰ = e^{sin x}`, `A¹ = M`, `W(0) = sin x + sin 2x` | `2·2π + 4·4π + 2π = 22π` per unit `M`; `E₂(0) ≤ 24eπ` | holds | none |
| §6.1 `QuasilinearSystem.eqOn_lens` (sample, headline) | `A¹ = diag(z², 0)`, `u = g(t + 1/x)`, `φ = 1 − t`, `Λ = ℤ`, `0`; `v₀ = 3`, `c₀ = 1` | `g′·(1 − 1) = 0`; value `g(0.6)` at `(0.9, −10/3)`; static cone `M ≥ 4`, moving `M ≥ 1` | holds; both clauses of the lens function are in the Lean | none |
| §6.2 `QuasilinearSystem.eqOn_causalPast` (headline) | counter-flow at `(2, 0)`; field `(1 + x², 0)` from `(0.9, −10/3)`; sweep by cones `(c + 2ε, v)` | pasts leave the other domain; escape time `π/2 − 1.279 = 0.29 < 0.9`, so `p ∉ D⁺`; loss `O(εh)` per step | holds | none |
| §7.1 `QuasilinearSystem.localWellPosedness` (sample, headline) | Burgers `u₀ = −e^{−λ²x²}`, `λ = 1, 10`; `M < 0`; `F ≡ 1` | `T* = 1.1658`, `0.1166`; `‖u₀″‖² ≈ 3760`; `ofReal M = 0` forces `U₀ = Ū`; `u₀ + t ∉ L²` | holds | none |
| §7.1 `QuasilinearSystem.exists_extension_of_lintegral_lt_top` (headline) | Burgers at `T*`; `F(u) = u`, `U = eᵗ` | `∫‖u_x‖_∞ = ∞`, values in `[−1, 0]`; `‖∂_tU‖_∞ = 1`, `‖∇U‖_∞ = 0` | holds | none |
| §7.2 `EquationOfState.localWellPosedness` (sample, headline) | `p = ρ³/3`, `ρ̄ = 1 + e^{−x²}/2`; `L = ∅`; background `(1, 0, 5)` | `v − ρ ≡ −1`, `v + ρ = 1 + e^{−x²}`, `T* = 1.1658`, `ρ ∈ [1, 3/2]`; no datum; `(1, 5) ∉ 𝒪` | holds; velocity bounded by `CM` through §4.2 | none |
| §7.2 `EquationOfState.exists_extension_of_lintegral_lt_top` (headline) | velocity along material curves | `sup\|v(t)\| ≤ sup\|v(t₀)\| + C_L∫‖∇(ρ, s)‖_∞`, `C_L` finite on compact `L` | holds; reduces to §7.1 | none |
| §7.3 uniformly local data (used by §8.3) | `u′ = u/(1 − u)` from `U₀(x)`, `x = 0, 10` | exit times `−ln U₀ − (1 − U₀) = 0.0721`, `0.00365` | holds | none |
| §8.2 `EquationOfState.maximalCommonDevelopment` (sample, headline) | counter-flow `p = ρ²`, `ρ = 1/2`, `v = ±2`; `W₁₂ ⊆ W₂₁` | speeds `1, 3` and `−3, −1`; towers `x < t − 1`, `x > 1 − t`; gap `< 2(t_p − 1)`, closing rate `4` | holds; `W₁₂ = D₁ ∩ D₂ ∩ {t < 1}` | none |
| §8.2 `EquationOfState.compatible_iff` (headline) | same pair; glued union | `v₁(2, 0) = 2 ≠ −2 = v₂(2, 0)`; `W₁₂ ≠ D₁ ∩ D₂`; three implications by first exit and gluing | holds in both directions | none |
| §8.2 `EquationOfState.exists_maximal_development` (headline) | nonempty chain; `S = ∅` | union of a chain is a development; `D = D⁺_D(∅) = ∅` | holds | none |
| §8.2 `EquationOfState.isGreatest_development_of_solution` (headline) | development `(D, U′)` against `U` on `H_{t₀}`; `S = ∅` | `J⁻_D(p) ⊆ H_{t₀}`, so `U′ = U`; a curve leaving `D` at `t > t₀` misses `S`; empty development | holds; no bound on the field needed | none |
| §8.3 `EquationOfState.isDevelopment_slab` (headline) | translate `U^λ`; development inside the slab | `U = U^λ` on `D⁺_O(S)` by §6.2; `D ⊆ D⁺_O(S)` by first exit | holds without periodicity of `U` | none |
| §8.3 `EquationOfState.slab_subset_of_maximal` (headline) | `p ∈ D ∩ O`; field `(1, x²)` | `J⁻_D(p) ⊆ {t ≤ t_p} ⊆ O`; without the bound a curve blows up at `s = 1/4` | holds; `hbdd` used only for the second clause | none |
| §8.4 `EquationOfState.boundary_futureCausal` (sample, headline) | `u = v − c′b/\|b\|`, `c′ < c`; `b = 0`; `{\|x\| < 1 − t/2}` | `dφ(1, u) = a − c′\|b\| < 0` gives an exiting segment; `a ≥ 0`; `1/2 < 1` excluded | holds | none |
| §8.4 `EquationOfState.boundary_null` (sample, headline) | expanding flow at `(1, 2√2 − 2)`; `φ = t − 0.9x`, `M = 5`, `1.05`; slab Check | `0.2929 + 0.4142 = 0.7071 = c`; `φ = 260`, `ψ = ε + 100`; `\|x\| < 18.2ε`, `\|t\| < 16.4ε`; distances `0.0707 > 0.05` | holds; `b ≠ 0` follows | none |
| Opening overview (README.md:3–49) | each of its four theorems against its section | hypotheses equal those of §7.2, §6.2, §8.2, §8.4; counter-flow data as in §8.2 | agrees | none |

- Source locators checked against the cached texts: 61 in 12 sources (ChristodoulouMiao2014 11, EperonReallSbierski2019 13, LukNotes 7, AbbresciaSpeck2022 5, Minguzzi2019 5, Chrusciel2011 5, LuoYu2023a 4, MinguzziCone2019 3, BarGinouxPfaffle2007 3, LuoYu2023b 2, Christodoulou2019 2, Nirenberg1959 1); each matches its line, number and hypotheses.
- Library declarations opened at the pins: 45, each at the file and line the README gives (among them `TauCeti.HasWeakLineDerivOn` at `WeakDeriv/Basic.lean:212`, `Wkp.norm_iteratedGradient_lowerOrder_le` at `Wkp/Interpolation.lean:335`, `zorn_le_nonempty₀` at `Order/Zorn.lean:126`). The pinned Mathlib and Tau Ceti contain no `EquationOfState`, `QuasilinearSystem`, `IsSymmetricHyperbolic`, causal curve or domain of dependence.
- Cross-roadmap citations resolved at the open heads: LorentzianGeometry §6.1, §6.3, §7.3, §8.2, §8.3, §9.2, §11.4, §12.6, §12.7 and SymmetricHyperbolicSystems Conventions, §1.2, §2.1, §2.2, §2.3, §7.3. LorentzianGeometry's Downstream consumers lists exactly §6.1, §6.3, §7.3, §8.2 and §12.6 for this roadmap; CompressibleEulerEquationsPartII cites §§1.1–3.3, 6.1–8.4 here, all present.
- Dependency check: `depcheck: 132 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD or CYCLE line. The diff outside the folder is empty. The automatic checks all pass.
- Elaboration of `Suggested.lean`: 14 `declaration uses sorry` warnings and nothing else. One-tactic probe (`rfl`, `trivial`, `simp`, `simp_all`, `infer_instance`) on a scratch copy: none of the 14 theorems closes. `#check @name` for all 35 declarations: `[NeZero n]` is in all 14 theorems, no binder lost, each type equal to its README statement.
- Headlines: the 14 named under How to read the build (README.md:66–78) are the 14 theorems of the file and the "fourteen" of the description; none is absent or stated through a stand-in; all 21 definitions are used by a headline.
- Duplication by object: `causalPast` and `futureDomainOfDependenceIn` occur in LorentzianGeometry's and RelativisticQuantumFieldTheory's files under their own namespaces, for a spacetime; the time-parametrised notions here are the forms §12.6 of LorentzianGeometry reduces to, and no fully qualified name is shared.
- Pull request text: one sentence out of date (C01); the suppliers and scope-boundary roadmaps it names are the README's.

Overlap check: read CompressibleEulerEquationsPartII, LorentzianGeometry, SymmetricHyperbolicSystems, IncompressibleFluids, PDE, SobolevPolynomialApproximation, YangMillsConnectionsAndCaloricGauge. The acoustical form, causal curves and domains of dependence in subsets are LorentzianGeometry's, cited. Linear systems and their classical energy theory are SymmetricHyperbolicSystems', cited. Equations of state, quasilinear systems, `Hᵏ_Λ`, well-posedness and developments of data on open sets are owned here, as Part II's, LorentzianGeometry's and SymmetricHyperbolicSystems' scopes each say. Characteristic data, acoustical functions and the characteristic boundary are Part II's. Real Sobolev orders and shock formation are owned by neither, and both READMEs say so.

Source independence: 18 passages compared with 12 sources, none shared (the definitions of §1.1, §3.3 and §8.1, the statements of §4.2, §4.3, §6.1, §7.1, §7.2, §8.2 and §8.4, the proof plans of §3.3, §6.2, §8.2 and §8.4, and four docstrings of `Suggested.lean`); largest share Majda1984, 18 of 113 locators, whose text and contents could not be read; contents compared with ChristodoulouMiao2014 (17 locators): independent, no layer corresponds to one of its chapters.

Research link: §7.2 and §§8.2–8.4 are the well-posedness, maximal-development and null-boundary statements on which Christodoulou–Miao 2014, Luk–Speck 2018, Abbrescia–Speck 2022 (shock formation) and Luo–Yu 2025 (rarefaction waves) pose their theorems; §8.2 takes up Eperon–Reall–Sbierski 2019 on non-unique maximal developments. Rests on the README's Downstream consumers and the cached texts.

## Not verifiable

- Majda1984 (Ch. 2, §§2.1–2.3, Theorem 2.1), Kato1975 (Theorem II) and Dafermos2016 (Ch. V, §5.1, Theorem 5.1.1): uncertified, no legal text; the sampled §4.4 cites only Majda1984 and Friedrichs1954, and its statements were recomputed instead.
- Friedrichs1954 (pp. 345–392), Christodoulou2007 (Ch. 1), HawkingEllis1973 (§6.5) and ONeill1983 (Ch. 14): waived, cited by locator alone.

## Source issues

- **Gap** in ChristodoulouMiao2014 at §2.1.2, printed pp. 24–25: the source says two developments of the same data agree on the whole intersection of their domains, so the union of all developments is the unique maximal one; it should be that they agree on the points whose acoustical causal past lies in both domains, uniqueness of a maximal development needing a separate argument; affects a stated result.

## For the human reviewers

- **Not tested.** Majda1984 holds the largest share of locators (18 of 113, `TauCetiRoadmap/CompressibleEulerEquations/README.md`). Its text and table of contents could not be read legally, so wording and arrangement were not checked against it.
- **Licence.** LukNotes is unpublished lecture notes read from the author's page (manifest `licence_class` author-page). It is cited for standard facts in README.md §§4.2, 4.3, 5.1–5.4, 6.1 and 7.1.
