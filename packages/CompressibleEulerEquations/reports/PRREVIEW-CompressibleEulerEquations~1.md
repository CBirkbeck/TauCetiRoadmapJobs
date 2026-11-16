# Review of CompressibleEulerEquations (pull request #2442 at 85b68bd)

**Verdict:** needs changes

## R01 (P3) — The counter-flow counterexample in `Suggested.lean` mirrors a README Check

**Location** `TauCetiRoadmap/CompressibleEulerEquations/Suggested.lean:479–502` (`quadraticLaw`, `exists_incompatible_developments`); README.md:2324–2328: "there are two developments that are not compatible; the developments and the computation are the first Check below."

**Claim** `exists_incompatible_developments` is a negative control built from two constant states. It is the §8.2 Check "Non-uniqueness" restated, not a headline result. `quadraticLaw` exists only to state it. Both are padding in the acceptance test.

**Witness** README.md:2340–2349 (Check "Non-uniqueness") gives the same law, data, towers `T_L`, `T_R`, developments `D₁`, `D₂` and point `(2, 0)` as the Lean statement. README.md:2328 says this.

**Repair** Delete `quadraticLaw` and `exists_incompatible_developments` from `Suggested.lean`, and the docstring clause ", and the failure of uniqueness in general (`exists_incompatible_developments`)" (lines 44–45). In the README, drop the Lean names but keep the statements:
- line 547–548: "`EquationOfState.exists_maximal_development` and `EquationOfState.isGreatest_development_of_solution`; §8.3";
- line 571–572: "and so is the law `P(ρ, s) = ρ²` on `(0, ∞) × ℝ`, with `c = √(2ρ)`.";
- line 2324–2325: "*Failure of uniqueness.* For the law `P(ρ, s) = ρ²` on `(0, ∞) × ℝ`, `n = 1`, …".

The description then says fourteen headline theorems.

## R02 (P3) — `IsHalfSpaceDomain` has no API list and no Checks

**Location** README.md:179–180: "A *domain* in this roadmap is a subset `D ⊆ H_{t₀}` that is relatively open in `H_{t₀}` (`IsHalfSpaceDomain t₀ D`: `D = W ∩ H_{t₀}` for an open `W ⊆ 𝔐`)"

**Claim** This is a definition declared in `Suggested.lean` (line 164) and used by `QuasilinearSystem.eqOn_causalPast` and `EquationOfState.IsDevelopment`. It has no API bullets and only a cross-reference to one §3.3 Check. That §3.3 Check tests `futureDomainOfDependence`, not this predicate.

**Witness** README.md:166–226 (Conventions) has no `**Checks.**` list. `IsHalfSpaceDomain` appears nowhere else in the README.

**Repair** After the definition, add:
- API: a domain is `UniqueDiffOn`. Finite unions and intersections of domains are domains. `{x : (t₀, x) ∈ D}` is open in `E`. A domain is a neighbourhood in `𝔐` of each of its points with `t > t₀`.
- **Checks.**
  - `H_{t₀}` (`W = 𝔐`) and `{t ≥ 0, |x| < 1 + t}` are domains.
  - The closed `{t ≥ 0, |x| ≤ 1 + t}` (`n = 1`) is not: every open `W ∋ (0, 1)` contains `(0, 1 + δ) ∈ H₀`, outside the set.
  - `(t₀, ∞) × E` is a domain with empty initial slice, and `[t₀ − 1, ∞) × E` is not one (it is not contained in `H_{t₀}`).
  - The wrong definition "open in `𝔐`" excludes `H_{t₀}` itself, so no domain could contain its data slice `{t₀} × S`.

## R03 (P3) — A §7.1 Check names a family that `IsWeakDerivFamily` rejects

**Location** README.md:2042–2043: "`‖U₀ − Ū‖_{Hᵏ_Λ} = 0` (it is `0` almost everywhere, and the zero family is a family of weak derivatives)"

**Claim** `IsWeakDerivFamily k u g` requires `g 0 = u` pointwise. Here `u` equals `1` on `2πℤ`, so the zero family is not a family of iterated weak derivatives of `u`. The value `0` is right; the stated witness is wrong.

**Witness** `Suggested.lean:211`: `g 0 = u ∧ …`. README.md:1120 says the same ("`g_0 = u`"). At `x = 0`, `u 0 = 1 ≠ 0`.

**Repair** Replace the parenthesis with: "(it is `0` almost everywhere, and the family with `g_0 = U₀ − Ū` and `g_α = 0` for `α ≠ 0` is a family of iterated weak derivatives, each `∫_F |g_α|²` being `0`)".

## R04 (P3) — The description calls every other named roadmap a consumer

**Location** Pull-request description: "Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim** The README names two open roadmaps only to mark scope boundaries: MathematicalStatisticsNonparametric and RelativisticQuantumFieldTheory. Neither is a consumer, and neither appears under Downstream consumers.

**Witness** README.md:146–150 ("nothing of that roadmap is consumed"); README.md:161–162 ("is neither consumed nor restated"); README.md:2541–2560 (Downstream consumers) lists neither roadmap.

**Repair** Replace the sentence with: "Roadmaps on main are cited by name. MathematicalStatisticsNonparametric and RelativisticQuantumFieldTheory, both still open, are named only to mark scope boundaries and are neither suppliers nor consumers. The consumers are those under Downstream consumers."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.2 barotropic system (sample) | expanding flow `n = 1`, `t = 1`; `(1 + t, 0)`; boost `w = 1` | `∂_tρ = −ρ₀/4 = −∂_x(ρv)`; `∂_tv + v∂_xv = 0`; `(1+t,0)`: `1 ≠ 0`; wrong boost residual `−1/2` | holds; CM2014 lines 488, 529, 818–822 match | none |
| §2.1 carrier, `Dominates` (sample) | transport `a = 3`; wave system `n = 1`, `2`; `N = 0`; monotonicity | `ζ = (1, −1)`: symbol `−2`; `[[0,−1],[−1,0]]` eigenvalues `±1`; cone `(c′, w′) ⊆ (c, w)` when `c′ ≥ c + |w′ − w|` | holds; Christodoulou2019 lines 124–126 match | none |
| §2.2 Euler symmetrisers (sample) | `n = 1`, `ρ = 1`, `c = 2`, `v = 3`; full `P = e^sρ²` at `(1, 0)`; generic `S·N` | `det(A¹ − λA⁰) = 4(λ−1)(λ−5)`; minors `2, 2, 2`; `d = 1/2` gives `0`; `SN` symmetric with entries `P_ρ`, `P_s` | holds; Majda/Dafermos not verifiable | none |
| §3.1 acoustical form (sample) | `n = 2`, `c = 2`, `v = (1, 0)`; `ζ = (−3, 1, 0)`; boost `w = v` | Gram det `−4`; `(1,3,0)` null, `(1,4,0)` gives `5`; `ζ₀ + v·ζ′ = −2`; future-causal covector criterion by minimising over `ξ` | holds; CM2014 lines 672–676, 685, LukSpeck2018 lines 1999–2008 match | none |
| §3.2 causal curves (sample) | field `(1, 0)`; Cantor `10f`; field `(1, x)`; `1/(1/4 − s)` | `2t` excluded; `10 > 1 = ∫c`; `2e^{3t} ≤ 1` iff `t ≤ −(ln 2)/3`; value `−4` at `s = 1/2` | holds; Minguzzi2019 lines 1359–1364, MinguzziCone2019 lines 680–718 match | none |
| §4.3 Gagliardo–Nirenberg, Moser (sample) | scaling `n = 1`, `k = 2`, `i = 1`; commutator `f = 1 + e^{−x²}`, `g = e^{−x²}` | ratio `λ^{−1/4}`: `2` at `1/16`; LHS `(19/8)√π ≈ 4.21` squared, `2.05 ≤ 3.60`; Nirenberg `1/p = i/2k`, `a = j/m` allowed | holds; Nirenberg1959 line 318, LukNotes line 1612 match | none |
| §5.2 weighted energies (sample) | transport, `χ = (1 − |x| − t/2)₊`; constant Euler cone; `W = (1 − x)^{−1}` | `1/2 > 0` for `x < 0`; support `(−1.1, −0.1)` meets `|x| < 0.55`; `(e·v₀ − c₀) − v₀·e + c₀ = 0`; `∫χW² = ∞` | holds; LukNotes line 724 matches | none |
| §5.3 linearised `Hᵏ` estimate (sample) | `A⁰ = 1/(2+u)`, `U = sin mx`, `W = (δ+t)(2+sin mx)`; `F(u) = u`, `U = eᵗ` | `S_m ≥ πm⁴/3`, forcing `C₁ ≥ √(2/3)m²`; `‖∂_tU‖_∞ = 1`, `‖∇U‖_∞ = 0` | holds; LukNotes line 1620 matches | none |
| §6.2 / `QuasilinearSystem.eqOn_causalPast` (sample, headline) | `p = ρ²/2`, state `(1, 0)`; Burgers slab; `A¹ = diag(z², 0)`; counter-flow | agree at `(1/2, 1.4)` (`< 2 − t = 1.5`), no claim at `1.6`; `u = g(t + 1/x)` differs at `(0.9, −10/3)`; `(2, 0)`: `2` vs `−2` | holds, hypothesis `J⁻_D(p) ⊆ O` needed; ERS lines 1178–1189 match | none |
| §6.1 / `QuasilinearSystem.eqOn_lens` (headline) | `Λ = ℤ`, `φ = 1 − t`; `Λ = 0` same `φ`; transport `φ = 1 − |x| − t/2` | non-periodic solutions differ at `(0.9, −10/3)`; no compact `K` for `Λ = 0`; `σ(dφ) = 1/2 > 0` | holds; all binders present (`#check`) | none |
| §7.1 / `QuasilinearSystem.localWellPosedness` (sample, headline) | Burgers `−e^{−x²}`, `−e^{−λ²x²}`; `F ≡ 1`; indicator of `2πℤ` | `T* = e^{1/2}/√2 ≈ 1.1658`; `λ = 10`: `T* ≈ 0.1166`, `‖u″‖² ≈ 3760`; `u₀ + t ∉ L²`; norm `0` | holds; R03 on wording | R03 |
| `QuasilinearSystem.exists_extension_of_lintegral_lt_top` (headline) | Burgers `u₀ = −e^{−x²}`; constant data | values in `[−1, 0]`, `∫₀^{T*}‖u_x‖_∞ = ∞`; constant extends for all `T` | holds | none |
| §7.2 / `EquationOfState.localWellPosedness` (sample, headline) | `p = ρ³/3` simple wave; `n = 3`; background `(1, 0, 5)`; `Ū = (5, 0)` | `v + ρ = 1 + e^{−x²}`, `ρ ∈ [1, 3/2]`; `6 > 5`, `4 < 5`; `81π/2`; `32π`, `K = {1, 5} × B̄` | holds; AbbresciaSpeck2022 lines 172–179, LuoYu2023a lines 82–95 match | none |
| `EquationOfState.exists_extension_of_lintegral_lt_top` (headline) | simple wave | gradient blows up at `1.1658` while `(ρ, s)` stays in `[1, 3/2] × {s₀}` | holds | none |
| §7.3 uniformly local data (sample) | `u′ = u/(1 − u)`; cutoff value `3`; switched cone `(1, 3)` | edge time `0.0721` (`x = 0`), `0.00365` (`x = 10`); `5/2 ∉ (0, 2)`; `ζ = (−2, 1)` gives entry `−2` | holds; Majda §2.3 not verifiable | none |
| §8.1 `IsDevelopment` (sample) | constant data on `(−1, 1)`; `{|x| < 1 − t/2}`; truncation `T = 0`; expanding flow | `{|x| < 1 − t}` development; `1/2 < 1` timelike, excluded; empty slice; `2√(1+t) − (1+t)` closes at `t = 3` | holds; CM2014 lines 864–872, LuoYu2023b line 910, BGP line 1006 match | none |
| `EquationOfState.maximalCommonDevelopment` (headline) | counter-flow | `W₁₂ = D₁ ∩ D₂ ∩ {t < 1}`; slice of `D₁ ∩ D₂` at `t = 1` empty; `W₁₂ = W₂₁` via past-closedness | holds | none |
| `EquationOfState.compatible_iff` (headline) | counter-flow; truncations | `U₁ ≠ U₂` at `(2, 0)`, `W₁₂ ≠ D₁ ∩ D₂`, no upper bound; truncations: `W₁₂` the smaller one | holds | none |
| `EquationOfState.exists_maximal_development` (headline) | chains; counter-flow | union of a chain is a development (first-exit argument); counter-flow gives at least two maximal developments | holds | none |
| `EquationOfState.isGreatest_development_of_solution` (headline) | constant data on `B(0, R)`; unbounded field `U_*` | `{|x − v₀t| < R − c₀t}`; first exit at `t > t₀` contradicts `D = D⁺_D`; no bound used | holds | none |
| `exists_incompatible_developments`, `quadraticLaw` (headline) | `P = ρ²`, `ρ = 1/2` | `∂_ρP = 1`, `c = 1`; towers `x < −1 + t`, `x > 1 − t`; `v = 2` vs `−2` at `(2, 0)` | true; mirrors Check | R01 |
| §8.3 `isDevelopment_slab` (sample, headline) | `S = ∅`; `S = {x > 0}`; translates `U_ℓ` | `(∅, U)`; `{x > (v₀ + c₀)t}`; `U = U_ℓ` on `D⁺` by §6.2, so `D⁺` is `Λ`-invariant | holds; CM2014 lines 866–872, AS2022 lines 175–179 match | none |
| `EquationOfState.slab_subset_of_maximal` (headline) | field `(1, x²)`; constant data | `(1/2, −4) ∉ D⁺(Σ₀)` without bound; `O = H_{t₀}` | holds | none |
| §8.4 `boundary_futureCausal` (sample, headline) | `{|x| < 1 − t/2}`; truncation top; ball `B(0, R)` | `1/2 < 1` excluded; `1 > 0` allowed; `c₀ = c₀|∇φ|` | holds; Christodoulou2019 lines 131–138, ERS line 1603 match | none |
| `EquationOfState.boundary_null` (headline) | expanding flow `t = 1`; `φ = t − 0.9x`, `M = 5`, `1.05`; slab, `q = (0.2, 0.3)` | `0.2929 + 0.4142 = 1/√2 = c`; `(−100, −400)`: `φ = 260`; `|x| < 18.2ε`; backward foot `0.54 ∈ (0.52, 0.6)` | holds | none |
| Conventions `IsHalfSpaceDomain` | `H₀`, `{|x| < 1 + t}`, `{|x| ≤ 1 + t}`, `(t₀, ∞) × E` | open `W` exists; `(0, 1 + δ)` escapes; slice empty | definition correct, Checks absent | R02 |

- Source locators checked against the cached texts: 69 locators from 13 sources, all matching (ChristodoulouMiao2014 14, ERS2019 14, LukNotes 7, AbbresciaSpeck2022 6, Minguzzi2019 5, Chrusciel2011 5, others 18). No README locator is flagged unverified.
- Library declarations opened at the pins: 52 Tau Ceti and 24 Mathlib `file:line` citations, all resolving to the named declaration. For 13 Tau Ceti statements the hypotheses were compared with the README paraphrase (p-ranges, `n²/ε`, `x − tsupport ρ ⊆ Ω`, `w1p0Submodule_top_eq_top`), and all agree.
- Cross-roadmap citations resolved:
  - LorentzianGeometry §6.1, §6.3, §7.3, §8.2, §8.3, §9.2, §11.4, §12.6, §12.7 at its open head fc070ae;
  - SymmetricHyperbolicSystems §1.2 (`LinearSystem`, `apply`, `IsSymmetricHyperbolic`), Conventions (speed), §2.1, §2.2, §2.3, §7.3 at 6a5cca3;
  - PDE §1.3, §1.4, §7.1–§7.3 and ComplexKahlerGeometry §5.7 on main;
  - MathematicalStatisticsNonparametric layer 6 and RelativisticQuantumFieldTheory RQFT1 at their heads.
- Gate at 85b68bd: every check OK. Dependency check output: `depcheck: 251 roadmaps, 2394 edges, 0 problem(s)`. The diff outside the folder is empty.
- Elaboration of `Suggested.lean`: 15 `declaration uses sorry` warnings, nothing else. `#check @name` was run for all 37 declarations: every binder (`[NeZero n]`, `[DiscreteTopology Λ]`, data hypotheses) is in each elaborated type, matching the README generality.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `exact` trivial) on the 15 theorems: none closes.
- Library near-matches: the only same-name hit (`compatible_iff`) is a category-theory sieve lemma, unrelated.

Overlap check: read LorentzianGeometry, SymmetricHyperbolicSystems, IncompressibleFlows, PDE (main and its open revision), RelativisticQuantumFieldTheory, SobolevPolynomialApproximation and YangMillsConnectionsAndCaloricGauge.
- The acoustical form and causal curves and domains of dependence in subsets are owned by LorentzianGeometry §7.3 and §12.6, and imported here.
- Linear symmetric hyperbolic systems are owned by SymmetricHyperbolicSystems §1.2 and §2.1, and imported here.
- Equations of state, developments and the quasilinear `Hᵏ` theory are owned here; LorentzianGeometry's Downstream consumers hands them over.
- Periodic spaces on `𝕋^d`: PDE §7.2 owns the Fourier Besov spaces and IncompressibleFlows Layer 0 the torus Sobolev spaces. Both are distinct carriers from `Hᵏ_Λ`, related here only by §4.1 Checks. IncompressibleFlows may not be cited.
- Nothing else is shared.

Source independence: 31 passages compared with 13 sources (the sampled locators and six further passages: the `IsDevelopment` and `futureDomainOfDependence` docstrings, §§4.2, 5.1, 7.1, and §8.2's failure paragraph against ERS2019 lines 1195–1210). None shares wording beyond formulae and standard definitions of a dozen words. The largest share is Majda1984, 18 of 113 locators; its text and contents could not be read. Contents were compared with ChristodoulouMiao2014 (17 of 113): independent. Its Chapters 1–2 meet only §§1.1–1.3, 3.1 and 8.1, and Chapters 3 onwards (shock formation) correspond to no layer.

## Not verifiable

- Majda1984 (Ch. 2, §§2.1–2.3, Theorem 2.1; sampled in 2.1, 2.2, 4.3, 5.2, 5.3, 6.2, 7.1, 7.2, 7.3, 8.3): uncertified, paywalled. The Springer contents page needs a login; OpenLibrary and HathiTrust records carry no contents.
- Kato1975 (Theorem II; sampled in 7.1, 7.3, 8.3) and Dafermos2016 (Ch. V, §5.1, Theorem 5.1.1; sampled in 2.1, 2.2, 7.1): uncertified, paywalled.
- Friedrichs1954 (pp. 345–392), Christodoulou2007 (Ch. 1), HawkingEllis1973 (§6.5) and ONeill1983 (Ch. 14): waived, not read.

## Source issues

- **Error** in ChristodoulouMiao2014 at §2.1.2, pp. 24–25 (lines 872–880): the source says any two developments of the same data agree on their common domain, so the union of all developments is the unique maximal development. It should say that on a fixed Galilean background agreement holds on the maximal common development only, since supersonic counter-flowing regions give incompatible developments. This affects a stated result.

## For the human reviewers

- **Not tested.** Majda1984 holds the largest share of locators (18 of 113, README.md). Its text and table of contents could not be read legally, so wording and arrangement were not checked against it.
- **Licence.** LukNotes is unpublished lecture notes, read from the author's Stanford page (manifest `licence_class` author-page). It is cited for eight standard facts (README.md §§4.2, 4.3, 5.1–5.4, 6.1, 7.1).
