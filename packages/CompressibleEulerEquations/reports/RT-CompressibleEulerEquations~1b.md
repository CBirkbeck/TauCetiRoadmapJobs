<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18030#issuecomment-6907385613 -->
Red team round 1 pass b (claude) of 016483d

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §7.2 continuation: the route to §7.1 has no bound on the velocity

   - **Location.** `packages/CompressibleEulerEquations/README.md:1891-1895` ("a Λ-periodic classical
     solution on `[t₀, t₀ + T) × E` with … `∫ ‖∇(ρ, v)‖_∞ dt < ∞` and the range of `ρ` with compact
     closure in `I` extends") and the route at lines 1906-1914; the Lean form is
     `Suggested.lean:388-401`, hypothesis `hcpt`.
   - **Claim.** The Euler continuation criterion follows from §7.1 applied to the symmetrisers.
   - **Witness.** §7.1 (lines 1816-1819) asks "values in a compact subset of `G`", and
     `G = I × E` (full: `{(ρ, v, s) : (ρ, s) ∈ 𝒪}`). The Euler hypothesis bounds only `ρ` (only
     `(ρ, s)`), not `v`; `C([t₀, t₀+T); Hᵏ_Λ)` bounds `v(t)` for each `t`, not uniformly as
     `t → t₀ + T`. The route (lines 1906-1914) treats local existence only.
   - **The statement itself is true**; the missing step is provable inside the roadmap. Checked:
     along a material curve `ẋ = v`, `d/dt v = −ρ⁻¹(∂_ρP ∇ρ + ∂_sP ∇s)`, so
     `|v(t, x(t))| ≤ sup|v(t₀, ·)| + C_L ∫ ‖∇(ρ, s)‖_∞`.
   - **Repair.** Append to the route of §7.2, after "(`2k > n + 2`).":

     > For the continuation criterion §7.1 needs the values of the whole state in a compact subset
     > of `G`, and the hypothesis bounds only `ρ` (for the full system `(ρ, s)`). The velocity is
     > bounded as well: for `t₂ < t₀ + T`, `v` is bounded on `[t₀, t₂] × E` (§4.2, continuity of
     > `t ↦ v(t) − v₀` into `C_b`), so the material curves `ẋ = v(t, x)` through the points of the slab
     > exist back to `t₀` (§1.3), and along them `Bv = −ρ⁻¹∇(P(ρ, s))` gives
     > `sup_x |v(t, x)| ≤ sup_x |v(t₀, x)| + C_L ∫_{t₀}^{t} ‖∇(ρ, s)(r)‖_∞ dr` with
     > `C_L = sup_L (|∂_ρP| + |∂_sP|)/ρ`. With `V` this bound, the values lie in the compact
     > `{(ρ, v, s) : (ρ, s) ∈ L, |v| ≤ V} ⊆ G`, and §7.1 applies.

     and add to the `*Needs:*` line of §7.2: "§1.3 (material curves, for the velocity bound of the
     continuation criterion)". Tested on the simple wave of the Checks (`p = ρ³/3`): there
     `v = ρ − 1 ∈ [0, 1/2]` up to `T*`, inside the bound `sup|v(t₀)| + C_L ∫‖∇ρ‖_∞`, whose integral
     diverges only at `T*`.

2. **F02** (P3) "every statement of Layer 8 contains the barotropic one" has no target for developments

   - **Location.** `README.md:595-598` ("with entropy propagation this is how every statement made
     for the full system below (§7.2, Layer 8) contains the barotropic one") and
     `Suggested.lean:17-19` ("so every statement below about the full system contains the barotropic
     one").
   - **Claim.** A full development of constant-entropy data has constant entropy.
   - **Witness.** Entropy propagation (lines 589-593) is stated only on a slab `[t₀, t₁) × E` with `v`
     bounded. A development `D` is no slab (`T_L ∪ (T_R ∩ {t < 1})` in §8.2), and no bullet of
     §8.1–§8.4 states `s ≡ s₀` on `D`.
   - **Checked true.** A material curve is causal (`|ẋ − v| = 0 ≤ c`); its maximal backward
     continuation in `D` from `p` either reaches `Σ_{t₀}` (in `{t₀} × S`) or has no limit in `D`, and
     then it is past-inextendible and misses `S`, against `D = D⁺_D({t₀} × S)`.
   - **Repair.** Add to the bullets of §8.1:

     > *Entropy on developments.* If `(D, U)` is a development of data with `s̄ ≡ s₀` on `S`, then
     > `s ≡ s₀` on `D`: the material curve through `p ∈ D` is a causal curve of the acoustical field
     > (`|ẋ − v| = 0 ≤ c`), its maximal backward continuation in `D` has a limit in `D` at its lower
     > end only if that end is `t₀` (otherwise Picard–Lindelöf continues it, `D` being relatively
     > open in `H_{t₀}`), so it is past-inextendible in `D` unless it reaches `Σ_{t₀}`; as
     > `D = D⁺_D({t₀} × S)` it reaches `{t₀} × S`, where `s = s₀`, and `Bs = 0` along it. Hence the
     > developments of barotropic data for `(I, p)` are exactly the full developments, for
     > `P(ρ, s) = p(ρ)`, of the data with constant entropy, and §§8.2–8.4 contain the barotropic
     > statements.

     and change line 597 to "with entropy propagation (on slabs, here; on developments, §8.1) this is
     how …". The `*Needs:*` line of §8.1 already has §1.3 (material curves) and §3.3. Tested on
     the counter-flow of §8.2: on `D₁ = T_L ∪ (T_R ∩ {t < 1})` the material curves `ẋ = ±2` run
     back to `x < −1` and `x > 1` at `t = 0`, where `s = 0`.

3. **F03** (P3) Majda1984 §2.3 is cited for lens uniqueness; it is the section on uniformly local spaces

   - **Location.** `README.md:1453` ("Majda1984, Ch. 2, §2.3", weighted energies), `:1656` (local
     uniqueness on lenses), `:1750` (uniqueness on domains of dependence); and `:1961`, where §7.3
     (uniformly local data) cites only "Kato1975, Theorem I".
   - **Witness.** The publisher's contents of Majda1984, Ch. 2: 2.1 local existence of smooth
     solutions, 2.2 a continuation principle, 2.3 uniformly local Sobolev spaces, 2.4 compressible
     and incompressible flow, 2.5 low Mach number combustion. §2.3 is the locator of §7.3 here, not
     of §§5.2, 6.1, 6.2. (Majda1984 is `uncertified`: the text was not read; the contents listing is
     public.)
   - **Repair.** At lines 1453, 1656 and 1750 replace "Majda1984, Ch. 2, §2.3" by "Majda1984, Ch. 2,
     §2.1 (the energy method; the localised form is proved here)"; at line 1961 write "(Majda1984,
     Ch. 2, §2.3, uniformly local Sobolev spaces; Kato1975)". `sources.toml` keeps
     `locator = "Ch. 2 (§§2.1–2.3, Theorem 2.1)"`, with `cited_for` moved accordingly.

4. **F04** (P3) "Kato1975, Theorem I" carries a linear and three quasilinear statements

   - **Location.** `README.md:1590` (linear existence in `Hᵏ_Λ`, "Kato1975, Theorem I, … with `A⁰`
     Lipschitz in time"), `:1829` (quasilinear local well-posedness), `:1961` (uniformly local data),
     `:2177` ("Kato1975, Theorem I … for the slab").
   - **Witness.** One theorem cannot be both the linear existence theorem of §5.4 and the
     quasilinear theorem of §7.1. Second-hand (not read by me): the appendix of arXiv:2103.08919
     calls the quasilinear result of this paper its "main Theorem II". Kato1975 is `uncertified`.
   - **Repair.** Keep "Kato1975, Theorem I" at line 1590 only; at lines 1829, 1961 and 2177 write
     "Kato1975, Theorem II" and set `locator = "Theorems I–II"` in `sources.toml`; if no operator
     can confirm the numbering, cite "Kato1975, §1 (the main theorems)" at the three quasilinear
     places instead. Listed again under `## Not verifiable`.

5. **F05** (P3) two citations do not carry the claim they are attached to

   - **Location and witness.**
     1. `README.md:780-781`: the identification of the null cone of `g_U⁻¹` with the sound sheet and
        of `ζ₀ + v·ζ′ = 0` with the material sheet cites "ChristodoulouMiao2014 lines 864–872;
        Christodoulou2019 lines 134–138". ChristodoulouMiao2014 lines 864–872 define maximal
        developments; Christodoulou2019 lines 134–138 say that a solution defines the sound-cone
        field. Neither mentions a symbol, a characteristic variety or the material sheet.
     2. `README.md:1658`: "BarGinouxPfaffle2007 lines 3664–3668, Theorem 3.2.11, the linear wave
        analogue" of local uniqueness on a lens. That theorem (lines 3664–3669) is global existence
        and uniqueness for a normally hyperbolic operator with data on a Cauchy hypersurface of a
        globally hyperbolic manifold; it has no lens and no local statement.
   - **Repair.** (1) Replace the parenthesis by "(§2.2, the multiplicity-zero Check; the statement
     is proved here. For the sound cones as the causal structure of a solution:
     Christodoulou2019 lines 134–138.)". (2) Replace by "BarGinouxPfaffle2007 lines 3664–3668,
     Theorem 3.2.11, for uniqueness in the global Cauchy problem of linear wave equations".

6. **F06** (P3) `IsContinuousIn` has no Check

   - **Location.** `README.md:1048-1051` (the definition of `U − Ū ∈ C(I; Hᵏ_Λ)`,
     `IsContinuousIn ν I Ū U`); `Suggested.lean:233-236`. The Checks of §4.1 (lines 1078-1124) are
     all about the norm; none tests the continuity clause.
   - **Witness.** The most plausible wrong model, continuity of the norm
     `t ↦ ν(U(t) − Ū)` alone, is excluded by no Check. Computed: `n = 1`, `Λ = 0`, `k = 0`,
     `w = 1_{[0,1]}`, `U(t, x) = w(x − 1/t)` for `t > 0`, `U(0, ·) = w`, `Ū = 0`: `ν(U(t)) = 1` for
     all `t ∈ [0, 1]` (norm continuous), `ν(U(t) − U(0)) = 2` for `0 < t < 1`.
   - **Repair.** Add to the Checks of §4.1:

     > - Continuity in time, `n = 1`, `Λ = 0`, `k = 0`, `Ū = 0`, `w = 1_{[0,1]}`. Transport
     >   `U(t, x) = w(x − t)` is in `C([0, 1]; L²)`: `ν(U(t′) − U(t)) = 2|t′ − t| → 0`. The escaping
     >   bump `U(t, x) = w(x − 1/t)` for `t > 0`, `U(0, ·) = w`, has `ν(U(t)) = 1` for every `t`, so
     >   its norm is continuous, but `ν(U(t) − U(0)) = 2` for `0 < t < 1`: it is not in
     >   `C([0, 1]; L²)`, and a definition asking only continuity of `t ↦ ‖U(t) − Ū‖` would admit it.
     >   The first clause is separate: `U(t, x) = 1` for `t > 0`, `U(0, ·) = 0` has
     >   `ν(U(t) − Ū) = ∞` for `t > 0` on `Λ = 0`, and fails it.

7. **F07** (P3) module docstring: the existence time is said to depend only on the size of the data

   - **Location.** `Suggested.lean:31-32` ("existence on a time depending only on the size of the
     data").
   - **Witness.** `README.md:1862-1868` (the Check "the existence time depends on the norm bound and
     not on `K` alone") and the statement, `T = T(M, K)`, line 1800; the Lean theorem fixes `K`
     before `T` (`Suggested.lean:300-302`). For Burgers and `u₀^λ = −e^{−λ²x²}`:
     `T* = e^{1/2}/(λ√2)`, `0.1166` at `λ = 10`, with values in `K = [−1, 0]` throughout.
   - **Repair.** Replace by "existence on a time depending only on a bound for the `Hᵏ_Λ` norm of
     the data and a compact set of states containing their values".

Seven findings: one P2 (a proof route that applies §7.1 without one of its hypotheses) and six P3
(a missing interface target, locators, citations that do not carry the claim, a definition with
no Check, one docstring overclaim). No statement of `Suggested.lean` was found false: every
theorem was instantiated on the cases of the table below and survived.

## The pass (computed)

`Suggested.lean`: 37 declarations (2 structures with 12 fields, 20 definitions, 15 theorems), one
namespace, section variable `{n : ℕ}` from line 156 on, `{n N : ℕ}` inside
`namespace QuasilinearSystem`; every theorem carries `[NeZero n]`, `Λ`, `[DiscreteTopology Λ]`
and its hypotheses in its own signature (compared with `scratch/signatures.md`: no binder lost).

| Declaration / target | Instances tried | Values computed | Result |
|---|---|---|---|
| `EquationOfState`, `soundSpeed` (§1.1) | `p = ρ²/2` at `ρ = 4`; `p = ρ²` at `1/2`; Chaplygin `−A/ρ`; `p = −ρ²` | `c = 2` (not `4`); `c = 1`; `p′ = A/ρ² > 0`; `p′ = −2ρ < 0` rejected | sound |
| `quadraticLaw` | field proofs read | `deriv (ρ ↦ ρ²) = 2ρ > 0` on `Ioi 0 ×ˢ univ` | sound, used by one theorem |
| `IsSolution` (§1.3) | static entropy wave `P = e^sρ²`, `s = x`, `ρ = e^{−x/2}`; `(1, 0, t)`; `D = ∅`; `D` a closed slab | `P(ρ, s) = 1`, residual `0`; wrong momentum `−e^{x/2}`; `Bs = 1`; slab is uniquely differentiable | sound |
| §1.2 | expanding flow `n = 1`, `t = 1`; general `n`; boost `w = 1` | `∂_tρ = −ρ₀/4 = −∂_x(ρv)`; `∂_tρ = −nρ/(1+t) = −ρ div v`; residual of wrong rule `−1/2` | sound |
| `QuasilinearSystem`, `symbol`, `Dominates` (§2.1) | transport `a = 3`, `ζ = (1, −1)`; wave system `ζ = (1/2, e₁)`; `N = 0`; monotonicity `c′ ≥ c + |w′ − w|` | symbol `−2`; eigenvalue `−1/2`; empty matrix PSD; `ζ₀ + w·ζ′ ≥ c′|ζ′| − |w′−w||ζ′| ≥ c|ζ′|` | sound |
| §2.1 cone map `κ = (1 + λ, 0)` | `σ ≥ (ζ₀ − λ|ζ′|)A⁰` | on `ζ₀ ≥ (1+λ)|ζ′|`: `≥ |ζ′|A⁰ ≥ 0` | sound |
| §2.2 symmetrisers | `S M` entries; `(ρ, s) = (1, 0)`, `P = e^sρ²`; `n = 1`, `(1, 3)`, `c = 2`; `ζ = (−3, 1)` | `(SN)[ρ,vⁱ] = (SN)[vⁱ,ρ] = ∂_ρP`, `(SN)[vⁱ,s] = (SN)[s,vⁱ] = ∂_sP`; block determinant `∂_ρP/ρ`; minors `2, 2, 2`; `det(A¹ − λA⁰) = 4(λ−1)(λ−5)`; `σ = [[0,4],[4,0]]`, `det = −16` | sound |
| §3.1 | `n = 2`, `c = 2`, `v = (1, 0)`; `ζ = (−3, 1, 0)`; boost `w = v` | Gram determinant `−4`; `g(1,3,0) = 0`, `g(1,4,0) = 5`; `ζ₀ + v·ζ′ = −2`, `c|ζ′| = 2`; `(1,3,0) ↦ (1,2,0)` null for `g_{2,0}` | sound |
| `IsCausalCurve`, `IsPastCausalCurve`, `IsPastInextendible` (§3.2) | one-point `J`; `J = ∅`; Cantor `10f`; field `(1, x)`, `x = e^{3t}`; field `(1, x²)` | one-point curve inextendible at `t = t₀`; `∅` excluded by `IsGreatest`; `10 > 1`; `2e^{−3} ≈ 0.0996`; `x(1/4 + 1/m) = −m` | sound |
| `futureDomainOfDependence`, `causalPast` (§3.3) | `p` at `t = t₀`; constant field, ball and half-space; closed `D`; expanding flow; idempotence without openness | `p ∈ D⁺ ⇔ p ∈ S`; `|x − tv₀| < R − c₀t`; boundary curve `x = 1 + t` extends every curve; `2√(1+t) − (1+t)`, `0.828` at `t = 1`, closes at `t = 3`; first-exit argument uses only `S ⊆ Σ_{t₀}` | sound |
| `IsWeakDerivFamily`, `sobolevNormSq`, `…Vec`, `stateSobolevNormSq` (§4.1) | `k = 0`; indicator; `e^{−|x|²}` in `ℝ²`, `k = 2`; `cos x` on `2πℤ`; pinned `HasWeakLineDerivOn` read | `∫|x|^{−1} = ∞`; no family ⇒ `⊤`; `π/2 + π + 7π/2 = 5π`, Hilbert–Schmidt `11π/2`, operator-norm `(7/2 + 8e^{−2})π`; `2π` against `2` and `(1+4π²)/2` | sound |
| `IsContinuousIn` | escaping bump, transport | `ν(U(t) − U(0)) = 2`; `2|t′ − t|` | definition sound; no Check: R06 |
| §4.2–§4.4 | `e^{−x²}`; dilations; Nirenberg exponents; `sin(x/2)` commutator; `a = x` | `2√(π/2) ≤ √5·√(π/2)`; `λ^{1/2}` against `λ^{1/6}`; `1/p = i/(2k)`; `μ₂ε²/8` at `x = π`; `‖ψ′‖_{L¹}` independent of `ε` | sound |
| §5.1–§5.4 | sign of `B`; `A⁰ = √(1+x²)`; forcing Check; `dE₂/dt` at `t = 0` | `e^{−2bt}`; `π`, `π/8`, `2 asinh R`; `C₁ ≥ √(2/3) m²`; `2·2π + 4·4π + 2π = 22π` | sound |
| `IsLensFunction`, `QuasilinearSystem.eqOn_lens` (§6.1) | `t₁ = t₂`; `t₁ > t₂`; non-periodic pair `(0, x)`, `(g(t + 1/x), x)` with `Λ = ℤ` and with `Λ = 0`; `φ` not differentiable | conclusion is `hbase`; empty; `u(0.9, −10/3) = g(0.6) ≠ 0` but `hper` fails (`Λ = ℤ`) and the cover by one compact fails (`Λ = 0`); `fderiv = 0`, `−0` PSD | true as typed |
| `QuasilinearSystem.eqOn_causalPast` (§6.2) | `p` at `t = t₀`; counter-flow at `(2, 0)`; sweep with cones `(c + 2ε, v)` | `causalPast = {p}`, `hdata` applies; `J⁻_{D₁}(p) ⊄ D₂` so `hpO` fails; loss `O(εh)` per step against a fixed margin | true as typed |
| `QuasilinearSystem.localWellPosedness` (§7.1) | `M < 0`; `N = 0`; Burgers `−e^{−λ²x²}`; `F ≡ 1`; `U′` neither periodic nor bounded | `ofReal M = 0` forces `U₀ ≡ Ū`; trivial; `T* = e^{1/2}/(λ√2)`, norm `3√(π/2)λ³` exceeds `M`; `hsrc` fails; uniqueness uses the cones of `U` only | true as typed |
| `QuasilinearSystem.exists_extension_of_lintegral_lt_top` | Burgers at `T*` | `∫‖u_x‖_∞ = ∞`, `hgrad` fails | true as typed |
| `EquationOfState.localWellPosedness` (§7.2) | `L = ∅`; `r < 0`; `ρ₀ ∉ [ρ_*, ρ^*]`; `|v̄ − v₀| ≤ CM` | vacuous; `r/2 < 0 < ρ`; `K = (L ∪ {(ρ₀, s₀)}) × B̄(v₀, CM)` compact in `G` | true as typed |
| `EquationOfState.exists_extension_of_lintegral_lt_top` | velocity not in `hcpt`; simple wave `p = ρ³/3` | `sup|v| ≤ sup|v(t₀)| + C_L∫‖∇(ρ,s)‖_∞`; `T* = e^{1/2}/√2`, `ρ ∈ [1, 3/2]` | true as typed; route: R01 |
| `IsDevelopment` (§8.1) | `S = ∅`; `{|x| < 1 − t/2}`, `p = (1, 0.4)`; truncation at `T = t₀` | `D = ∅`; curve `ẋ = −1` exits at `s = 0.8 > 0`; slice `∅ ≠ S` | sound |
| `maximalCommonDevelopment` | counter-flow pair; `W₁₂ = W₂₁` by first exit with `W₁₂` open and past-closed | `W₁₂ = D₁ ∩ D₂ ∩ {t < 1}`: from `p ∈ T_L ∩ T_R`, `x(1) ≥ x_p − 3(t_p − 1)`, which is `< 2 − 2t_p < 0` | true as typed |
| `compatible_iff` | counter-flow (both sides false); nested pair (both true); glued union | `D₁ ∩ D₂ ∌` slice `t = 1`; union is a development by first exit | true as typed |
| `exists_maximal_development` | chain = nonempty compatible family | union is an upper bound | true as typed |
| `isGreatest_development_of_solution` | `S = ∅`; unbounded field; constant data on a ball | `∅`; first exit needs no bound; `|x − v₀(t−t₀)| < R − c₀(t−t₀)` | true as typed |
| `exists_incompatible_developments` | `D₁ = T_L ∪ (T_R ∩ {t<1})`, `D₂` mirrored; `c(1/2) = √(2·1/2) = 1` | speeds `v ± c = 1, 3` and `−3, −1`; `T_L ∩ T_R ∩ {t<1} = ∅`; `(2, 0) ∈ D₁ ∩ D₂`, `v₁ = 2 ≠ −2 = v₂` | true as typed |
| `isDevelopment_slab` (§8.3) | `U` not Λ-periodic off `D⁺`; `D ⊆ O` | `U = U^λ` on `D⁺_O(S; U)` by §6.2, and `D⁺_O(S; U) = D⁺_O(S; U^λ)` by first exit both ways | true as typed |
| `slab_subset_of_maximal` | field `(1, x²)` (no bound); `p ∈ D ∩ O` | `D⁺_O(Σ) ≠ O`, `hbdd` fails; `J⁻_D(p) ⊆ {t ≤ t_p} ⊆ O`, so §6.2 applies with `U₁ = U′` | true as typed |
| `boundary_futureCausal` (§8.4 a) | top of a truncation; `{|x| < 1 − t/2}`; `dφ(q) = −dt`; `q ∉ closure D` | `1 ≥ 0`; `1/2 < 1` and not a development; impossible for a development; `hq` excludes it | true as typed |
| `boundary_null` (§8.4 b) | top of a truncation; lateral boundary; `b = 0`; `φ = t − 0.9x` with `M = 5` and `M = 1.05` | `hmax` fails (cone of slope `2` added); `1 = 1`; `a > 0 = c̃|b|` strict, excluded by the lens; `(−100, −400)` in the set; `|x| < 18.2ε`, `|t| < 16.4ε` | true as typed |

Dependency check (the command of the brief, run on the README as it stands):

    depcheck: 245 roadmaps, 2287 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

Headline theorems (README lines 483-495, Summary lines 20-26): lens uniqueness, uniqueness on
domains of dependence, quasilinear local well-posedness and continuation, Euler local
well-posedness and continuation, maximal common development, compatibility, existence of maximal
developments, the uniqueness criterion, the counterexample, developments in a slab, the slab in
every maximal development, causal boundary, null regular boundary. All fifteen are stated in
`Suggested.lean`; none is absent and none goes through a stand-in. One-tactic probe: no
declaration restates a definition, follows from one library lemma, mirrors a Check or computes a
value; `quadraticLaw` is the one concrete definition and is needed to state
`exists_incompatible_developments`. No padding found.

Ownership: `roadmaps grep --lean-only` for `structure EquationOfState`,
`structure QuasilinearSystem`, `def futureDomainOfDependence`, `def IsCausalCurve`,
`def sobolevNormSq` and `IsDevelopment` finds no declaration on main or at an open head.
LorentzianGeometry's `Suggested.lean` declares `IsFutureCausalCurveIn`, `IsPastInextendibleIn`
and `futureDomainOfDependenceIn` under its own namespace; the time-parametrised restatements here
have other names, and LorentzianGeometry §12.6 states the reduction to them and its Downstream
consumers hand the fluid side, developments and local well-posedness to this roadmap.
SymmetricHyperbolicSystems' Scope excludes quasilinear systems and the `Hˢ` theory and its
Downstream consumers hand them on. This roadmap is the owner of what it states.

Policy: the pull request changes only `packages/CompressibleEulerEquations/` (README.md,
Suggested.lean, metadata.toml, reports/PKG-CompressibleEulerEquations.md); no pull-request
number, process word, `set_option`, `#eval` or `True` placeholder; "lemma" occurs only in
"Friedrichs' lemma" and "Zorn's lemma"; every target section has a locator or says "proved here".

Source independence: 16 passages compared with 11 sources, none shared (no common run above 5 words; the nearest is the definition of the domain of dependence, which the mathematics forces); largest share Majda1984 and ChristodoulouMiao2014, 18 each of 130 mentions of a source id; contents compared with ChristodoulouMiao2014 (section headings of the cached text: 1.1–1.4, 2.1–2.2, 3.1 ff.) and with the public contents listing of Majda1984 Ch. 2 (2.1–2.5; its text could not be read): independent — Layers 1–8 map onto no run of either, and §7.1/§7.3 are separated by §7.2 and differ in scope from Majda 2.1–2.3.

## Verified sound

- **Declarations read:** 37 of 37 in `Suggested.lean`, each against its README statement and its
  elaborated type in `scratch/signatures.md`; binders, instance arguments and generality agree
  (R07 is a docstring, not a signature).
- **Targets read:** 25 of 25 sections (§1.1–§8.4), every line, with Conventions, the supplier
  contracts, Downstream consumers and Worked examples.
- **Pinned declarations:** 70 of 70 cited Mathlib and Tau Ceti declarations found at the cited
  file and line at the pins; `TauCeti.HasWeakLineDerivOn` and the module docstring of
  `TauCeti/Analysis/Sobolev/Wkp/Basic.lean` read in full and matching what §4.1 says of them.
- **Locators opened in the cached texts:** 60, in 13 sources (ChristodoulouMiao2014 lines
  481–544, 606, 672–676, 685, 818–822, 833–838, 864–886; Christodoulou2019 124–138;
  AbbresciaSpeck2022 149–179, 408–414; LuoYu2023a 82–95; LuoYu2023b 417–419, 910; LukSpeck2018
  1999–2008; Minguzzi2019 1359–1364, 1917, 3576–3583, 3716–3718; Chrusciel2011 534, 1169, 1352,
  1843–1848, 1859; MinguzziCone2019 672–718, 1737–1740; BarGinouxPfaffle2007 1006, 3664–3669;
  EperonReallSbierski2019 767, 1129, 1178, 1195, 1338, 1342, 1603; LukNotes 679, 724, 1158, 1210,
  1239, 1612, 1620; Nirenberg1959 318, 328). All carry the cited statement except the two of R05.
- **Checks tested:** 126 read, about 90 of them recomputed by hand (the values are in the table); none
  false, none vacuous. Read but not recomputed: among others the Besov comparison of §4.1 (it
  depends on the normalisation of PDE §7.1), the `(1, x²)` limit-curve Checks beyond their
  formulas, and six of the nine Checks of §7.3.
- **Sibling citations checked at the open heads:** LorentzianGeometry §6.1 (`minkowskiForm E`),
  §6.3 (hyperplane trichotomy by the sign of `b⁻¹(ξ, ξ)`), §7.3 (every bullet the contract
  lists), §12.6 (`TimeOrientedLorentzianFieldOn`, `IsFutureCausalCurveIn`,
  `IsPastInextendibleIn`, `futureDomainOfDependenceIn`, `futureDomainOfDependenceIn_self`, time
  functions, slabs, coverings) read in full; §8.2, §8.3, §9.2, §11.4, §12.7 by heading.
  SymmetricHyperbolicSystems Scope, Conventions (*Propagation speed*), §1.2 (`LinearSystem`,
  `LinearSystem.apply`, `LinearSystem.IsSymmetricHyperbolic` with `Matrix.IsSymm`), §2.1, §2.2
  and Downstream consumers read; §2.3, §7.3 by heading. PDE §1.3, §1.4, §7.1–§7.3 and
  ComplexKahlerGeometry §5.7 on main; RelativisticQuantumFieldTheory RQFT1 at its head.
- **Supplier gaps:** none declared (`design/plan.json` has `"gaps": []`, README line 465); none
  needed: every cited section exists where cited.

## Not verifiable

- Majda1984, Kato1975, Dafermos2016 (`uncertified`) and Friedrichs1954, HawkingEllis1973,
  ONeill1983, Christodoulou2007 (`waived`): no text. R03 rests on the publisher's contents
  listing; R04 on an internal inconsistency and a second-hand report of the numbering.
  "Dafermos2016, Ch. V, Theorem 5.1.1" and "Majda1984, Ch. 2, Theorem 2.1" were not checked.
- MathematicalStatisticsNonparametric §6.2 (README lines 138-142, not consumed): its head is not
  among the checkouts given to this pass; the citation resolver lists it as found.
- The page numbers "p. 17" for MinguzziCone2019 lines 680–718 agree with the page markers of the
  extraction (page 17 starts at line 673); the published pagination was not compared.
- Speck2016 §1.11 (README line 2347, Downstream consumers only): not opened.
- No Lean was elaborated in this pass (read-only); the elaborated types are those of
  `scratch/signatures.md`.

## Source issues

- **Error** in ChristodoulouMiao2014 at §2.1.2, printed pp. 24–25 (lines 872–880): the source says any two developments of one initial data set agree on their common domain, so the union of all developments is the unique maximal one; it should be that agreement holds on the maximal common development only, and uniqueness needs a further hypothesis; affects a stated result.
## For the human reviewers

- **Scope.** §8.2 (`README.md:2127-2133`) states that the uniqueness claim of ChristodoulouMiao2014 lines 872–880 is false and gives a counterexample (`exists_incompatible_developments`); EperonReallSbierski2019 Theorem 3.45 proves the analogous failure for a quasilinear wave equation only.
- **Licence.** LukNotes is unpublished lecture notes read from the author's page (`sources.toml`: `licence_class = "author-page"`, no date printed in the text); it is cited at seven places of the README, each beside a published source.
- **Not tested.** Majda1984, tied for the largest share of the locators (18 of 130), could not be read: its wording was not compared (part 1), and its arrangement was compared from the public contents listing only (part 2).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "016483dc2662e275bae18dffb57e3df53de48257", "job": "RT-CompressibleEulerEquations~1b", "model": "fable", "worker": "chris-x88"} -->
