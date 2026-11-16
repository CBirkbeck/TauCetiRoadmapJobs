<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18030#issuecomment-6908304530 -->
Red team round 2 pass a (claude) of 3969592

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) two pinned Tau Ceti results that carry stated steps of §4.1 and §4.2 are not in the supplier contracts

   **Location.** `packages/CompressibleEulerEquations/README.md:69` ("Tau Ceti also has six special
   cases of Layer 4"), `:1088-1090` (§4.1: "`u ∈ Hᵏ_Λ` iff each coordinate of `u` is the value of an
   element of `TauCeti.Wkp volume ⊤ 2 k`"), `:1170-1174` (§4.2: "every `u ∈ Hᵏ_Λ` has a `Cʲ`
   representative … (for `Λ = 0`, `TauCeti.Wkp.toZeroAtInfty` applied to `∂^αu` …)").

   **Claim.** The contracts list what Tau Ceti has of Layer 4, and the routes of §4.1 and §4.2 use only
   what is listed.

   **Witness.** Pinned Tau Ceti, neither named in the README (`grep` count `0`):

   - `TauCeti/Analysis/Sobolev/Wkp/ContDiffRepresentative.lean:101`, `TauCeti.Wkp.exists_contDiffOn_ae_eq`:
     for `finrank ℝ E < 2 * k`, every `u : Wkp volume Omega 2 (k + j)` has a `ContDiffOn ℝ j`
     representative on `Omega` (with `TauCeti.HasWeakFDerivOn.contDiffOn_succ`,
     `TauCeti/Analysis/Sobolev/WeakDeriv/Classical.lean:145`). At `Omega = ⊤` this is §4.2's `Cʲ`
     representative for `Λ = 0`, without bound or decay; `toZeroAtInfty` on `∂^αu` gives only
     continuous `g_α`.
   - `TauCeti/Analysis/Sobolev/Wkp/LineDeriv.lean:287`,
     `TauCeti.Wkp.exists_value_eq_iff_forall_exists_hasWeakLineDerivOn` (with
     `TauCeti.Wkp.exists_hasWeakLineDerivOn_value`, line 156, and
     `TauCeti.Wkp.exists_value_eq_of_forall_hasWeakLineDerivOn`, line 267, for one orthonormal basis):
     `u ∈ Lᵖ(Ω)` is a value of `W^{k+1,p}(Ω)` iff its weak line derivatives are values of
     `W^{k,p}(Ω)`: the inductive step of §4.1's identification with `TauCeti.Wkp volume ⊤ 2 k`.

   **Repair.** (i) Add to "From Tau Ceti":

   > - `TauCeti.Wkp.exists_value_eq_iff_forall_exists_hasWeakLineDerivOn`, with
   >   `TauCeti.Wkp.exists_hasWeakLineDerivOn_value` and
   >   `TauCeti.Wkp.exists_value_eq_of_forall_hasWeakLineDerivOn`
   >   (`TauCeti/Analysis/Sobolev/Wkp/LineDeriv.lean:287,156,267`): for an additive Haar measure and
   >   an open `Ω`, an `Lᵖ` function is the value of an element of `W^{k+1,p}(Ω)` exactly when its weak
   >   derivatives along one orthonormal basis are values of elements of `W^{k,p}(Ω)`. By induction on
   >   `k` it identifies, at `Λ = 0`, the families of §4.1 with the elements of
   >   `TauCeti.Wkp volume ⊤ 2 k`; consumed, not proved again.
   > - `TauCeti.Wkp.exists_contDiffOn_ae_eq`
   >   (`TauCeti/Analysis/Sobolev/Wkp/ContDiffRepresentative.lean:101`), with
   >   `TauCeti.HasWeakFDerivOn.contDiffOn_succ`
   >   (`TauCeti/Analysis/Sobolev/WeakDeriv/Classical.lean:145`): for `2k > n` every element of
   >   `W^{k+j,2}(Ω)`, `Ω` open, has a representative of class `Cʲ` on `Ω`. With `Ω = ⊤` this is the
   >   regularity of the representative in §4.2 at `Λ = 0`, and on bounded open sets it gives it for
   >   every `Λ`; §4.2 adds the bound `sup_{|α|≤j} ‖∂^αu‖_∞ ≤ C‖u‖_{Hᵏ_Λ}` and the decay.

   (ii) `:69`: "six special cases" → "seven special cases", adding after the interpolation
   inequality "and the interior embedding `W^{k+j,2}(Ω) ⊆ Cʲ(Ω)` for `2k > n`, without a bound".
   (iii) §4.2, `:1173`: "(for `Λ = 0`, `TauCeti.Wkp.exists_contDiffOn_ae_eq` for the regularity and
   `TauCeti.Wkp.toZeroAtInfty` applied to `∂^αu` for the bound and the decay; …)". (iv) Add the two
   names to the *Needs:* lines of §4.1 (`:1162`) and §4.2 (`:1206`). Tested: `n = 1`, `k = 1`, `j = 1`,
   `u = e^{−x²} ∈ W^{2,2}(ℝ)`: `1 < 2`, the pinned lemma gives a `C¹` representative; `toZeroAtInfty`
   on `u` and `u′` gives `sup|u| = 1`, `sup|u′| = √2 e^{−1/2}`.

2. **F02** (P3) `causalPast` has no Check that discriminates it

   **Location.** `README.md:951-953` ("Define the *causal past* `J⁻_D(p)` (`causalPast`) as the set of
   points of past causal curves in `D` ending at `p`"); Checks of §3.3, `:1016-1041`;
   `Suggested.lean:196-200`.

   **Claim.** Each definition has at least three discriminating Checks.

   **Witness.** No Check of §3.3 computes a causal past (the five Checks compute `D⁺_D(S)`). Three
   plausible wrong models are excluded by no Check: the open (chronological) past, which omits `p` and
   the null curves; the past in `𝔐` intersected with `D`; a past assumed compact for every `p`.

   **Repair.** Add to the Checks of §3.3 (`n = 1`, field `(1, 0)`, `t₀ = 0`, `p = (1, 0)`):

   > - Causal pasts. For `D = H₀`, `J⁻_D(p) = {0 ≤ t ≤ 1, |x| ≤ 1 − t}`: it contains `p` (the one-point
   >   curve) and `(0, 1)` (the null curve `x = 1 − t`), not `(0, 1.1)`; a definition with strict
   >   inequality would drop `p` and `(0, 1)`. For `D = H₀ \ ({1/2} × [−1, 1])`, a domain, every past
   >   causal curve from `p` has `|x(t)| ≤ 1 − t`, so it cannot pass `t = 1/2`, and
   >   `J⁻_D(p) = {1/2 < t ≤ 1, |x| ≤ 1 − t}`: the point `(0, 0)` lies in `D` and in the cone of `p` in
   >   `𝔐` but not in `J⁻_D(p)`. For `D = H₀ \ {(1/2, 0)}`, `J⁻_D(p)` is the closed cone without
   >   `(1/2, 0)` (curves detour around the missing point), which is not compact; and indeed
   >   `p ∉ D⁺_D(Σ₀)`, since `x ≡ 0` on `(1/2, 1]` is past-inextendible in `D` and misses `Σ₀`: the
   >   hypothesis `p ∈ D⁺_D(S)` of the compactness statement is needed.

   Tested against the definition in `Suggested.lean:198-200` and against *Compact pasts* (`:965-974`):
   in the second and third instances `p ∉ D⁺_D(Σ₀)`, so that statement makes no claim there.

3. **F03** (P3) the route of §5.4 cites §5.3 for coefficients outside the class of §5.3

   **Location.** `README.md:1650-1651` ("the bounds of §5.3 hold uniformly in `ε` by Friedrichs'
   lemma"), against `:1568-1571` (§5.3: "For `U` with values in `K` and
   `U − Ū ∈ C([0, T]; Hᵏ_Λ) ∩ C¹([0, T]; Hᵏ⁻¹_Λ)`, and `W` … solving
   `A⁰(U)∂_tW + Σᵢ Aⁱ(U)∂ᵢW = f`").

   **Claim.** The `Hᵏ` bound of §5.4 for the regularised solutions is §5.3.

   **Witness.** §5.4 allows `B ≠ 0` and `Aⁱ`, `B` only continuous in time (`:1634-1636`, `:1647`);
   §5.3 does not. `n = N = 1`, `Λ = 2πℤ`, `A⁰ = 1`, `A¹(t, x) = |t − 1/2|`, `B = 0` on `[0, 1]`:
   `A¹ ∈ C([0, 1]; Hᵏ_Λ)` (norm `√(2π)|t − 1/2|`), `W = W₀(x − ∫₀ᵗ |s − 1/2| ds)`, `E_k` constant; no
   `U` with `A¹(U) = A¹` is `C¹` in time at `1/2`.

   **Repair.** Replace "the bounds of §5.3 hold uniformly in `ε` by Friedrichs' lemma;" by:

   > the estimate of the statement holds for `W_ε` uniformly in `ε`, by the computation of §5.3 carried
   > out for the coefficients `A^μ(t, x)` in place of `A^μ(U)`: the commutators of `∂^α` with
   > `(A⁰)⁻¹` and with `Aⁱ`, and the term `∂^α((A⁰)⁻¹BW_ε)`, are bounded by the commutator, product and
   > composition estimates of §4.3 through `sup_t ‖A^μ − Ā^μ‖_{Hᵏ_Λ}` and `sup_t ‖B‖_{Hᵏ_Λ}`, the term
   > `∫_F ⟨∂_tA⁰ ∂^αW_ε, ∂^αW_ε⟩` by `sup_t ‖∂_tA⁰‖_∞`, and the principal term
   > `∫_F ⟨J_ε(Aⁱ∂ᵢJ_ε∂^αW_ε), ∂^αW_ε⟩ = −½∫_F ⟨(∂ᵢAⁱ)J_ε∂^αW_ε, J_ε∂^αW_ε⟩` by the `L²_Λ` symmetry of
   > `J_ε`; no time derivative of `Aⁱ` or `B` enters, and §5.3 itself, stated for coefficients
   > `A^μ(U)`, is not used;

   and in the *Needs:* line of §5.4 (`:1675`) write "§§4.1–4.4, §§5.1 and 5.3 (the computation of
   §5.3, not its statement)". Tested on the witness: `∂ᵢA¹ = 0`, `∂_tA⁰ = 0`, all commutators vanish,
   `dE_k/dt = 0`.

4. **F04** (P3) §6.2 cites the passage that §8.2 calls false

   **Location.** `README.md:1808-1810` ("(Majda1984, Ch. 2, §2.1, …; ChristodoulouMiao2014 lines
   872–878; EperonReallSbierski2019 lines 1178–1189)"), the locators of
   `QuasilinearSystem.eqOn_causalPast`.

   **Claim.** ChristodoulouMiao2014 lines 872–878 support uniqueness on domains of dependence as
   stated in §6.2.

   **Witness.** ChristodoulouMiao2014 lines 872–878 assert agreement on all of `D₁ ∩ D₂`, with no
   hypothesis `J⁻_D(p) ⊆ O`. `README.md:2217-2219` calls lines 872–880 "false on a fixed Galilean
   background"; Check `:1825-1827`: `v₁(2, 0) = 2 ≠ −2 = v₂(2, 0)`.

   **Repair.** At `:1809` write: "ChristodoulouMiao2014 lines 872–878, where local uniqueness is
   asserted on the whole of `D₁ ∩ D₂`; the statement here carries the hypothesis `J⁻_D(p) ⊆ O`,
   without which it fails (Check below and §8.2);". Tested on the counter-flow: at `p = (2, 0)`,
   the slice of `J⁻_{D₁}(p)` at `t = 3/2` is `[−3/2, −1/2]` (speeds in `[1, 3]`), outside
   `D₂ = (T_L ∩ {t < 1}) ∪ T_R`, whose slice there is `{x > −1/2}`; the hypothesis fails and §6.2
   claims nothing.

5. **F05** (P3) `sources.toml` disagrees with the README in six entries

   **Location.** `packages/CompressibleEulerEquations/sources.toml`: `cited_for` of
   ChristodoulouMiao2014 (line 71), Christodoulou2019 (89), AbbresciaSpeck2022 (143), LuoYu2023a (161),
   LuoYu2023b (179); `locator` of Christodoulou2007 (line 11).

   **Witness.** `README.md:2432-2441` (Downstream consumers) cites ChristodoulouMiao2014 lines 880–910,
   LuoYu2023b line 910, AbbresciaSpeck2022, Christodoulou2019, LuoYu2023a and LuoYu2023b; none of the
   five has "Downstream consumers" in `cited_for`, while Speck2016, LukSpeck2018 and Christodoulou2007
   have it. Christodoulou2007: manifest `locator = "Ch. 1–2"`, README `:2138` and `:2465` "Ch. 1".

   **Repair.** Add `"Downstream consumers"` to the `cited_for` of the five entries, and set the
   `locator` of Christodoulou2007 to `"Ch. 1"` (the only chapter the README cites).

Round 2. All eleven findings of round 1 are repaired at this head and no repair introduced an
error (first section). The full pass was run again; it found no false statement and no missing
hypothesis in `Suggested.lean` or the README. Five P3 findings follow (S01–S05): uncited pinned
declarations, a definition without Checks, a route that cites a section outside its class, a
citation of a passage the roadmap itself calls false, and manifest bookkeeping.

## Round 1 findings at this head

| Id | Status | Repaired passage (`packages/CompressibleEulerEquations/README.md` unless said) | Witness re-tested |
|---|---|---|---|
| 1a/F01 | repaired | `:461-468` "The structure and the predicate are the carrier of §5.1. `LinearSystem.apply` is the classical left-hand side … used here only on `C¹` maps"; `:1433-1434`; Check `:1478-1485` | SymmetricHyperbolicSystems `Suggested.lean` at its head: `apply` uses `deriv (fun s => u s x) t` and `fderiv ℝ (u t) x`. For `W = h`: `apply W = 0`, `LW = ∂₁h ≠ 0`; solution `h(x₁ − t, x₂)` |
| 1a/F02 | repaired | `:76-79`, `:335-348` ("it is consumed, not proved again"), `:1345-1349` "This section owns the extension of these two statements", `:1402-1404`, `:1409-1410` | Pinned `TauCeti/Analysis/Sobolev/Mollification/Basic.lean:73,97` read: `[mu.IsAddLeftInvariant] [SFinite mu]`, `rho` `ContDiff ℝ ∞` with compact support, `hx : ∀ y ∈ tsupport rho, x - y ∈ Omega`. With `Omega = ⊤` it applies to `φ = (η(x − 2) + η(x + 2))/2` |
| 1a/F03 | repaired | `:785-790` "(LorentzianGeometry §7.3, first Check, with §6.1's `minkowskiForm E` …); stated here is its determinant `c`"; `:427-429`; `:88-91` | LorentzianGeometry §7.3 at its head, first Check: `(t, x) ↦ (ct, x − vt)` is an isometry onto `minkowskiForm`. `n = 2`, `c = 2`, `v = (1, 0)`: Gram determinant `−3·1 − 1 = −4 = 2²·(−1)` |
| 1a/F04 | repaired | `:2187-2191`, `:2194-2198`, `:2202-2203` | EperonReallSbierski2019 lines 1010–1012, 1141–1144, 1208–1210, 1218–1223, 1228, 1232–1240, 1330 read: each carries what the bullet attributes to it |
| 1b/F01 | repaired | `:1973-1983` "the velocity is bounded as well … `sup_x |v(t, x)| ≤ sup_x |v(t₀, x)| + C_L ∫ ‖∇(ρ, s)(r)‖_∞ dr`"; *Needs* `:2014-2016` | `|Bv| ≤ ρ⁻¹(|∂_ρP||∇ρ| + |∂_sP||∇s|) ≤ C_L‖∇(ρ, s)‖_∞`. Simple wave `p = ρ³/3`: `v = ρ − 1 ∈ [0, 1/2]`, bound `1/2 + (3/2)∫‖ρ_x‖_∞` |
| 1b/F02 | repaired | `:2150-2160` *Entropy on developments*; `:622`; `Suggested.lean:17-20` | Counter-flow `D₁`: from `T_L`, `ẋ = 2` gives `x(0) = x_p − 2t_p < −1 − t_p`; the curve reaches `{0} × S` where `s = 0` |
| 1b/F03 | repaired | `:1504-1505`, `:1710`, `:1808` "Majda1984, Ch. 2, §2.1, the energy method, whose localised form is proved here"; `:2031` "§2.3, uniformly local Sobolev spaces" | text not readable (uncertified); consistent with the contents listing quoted in the repair report |
| 1b/F04 | repaired (applied differently) | `:1642`, `:1888`, `:2031`, `:2267`, `:2486` "Kato1975, Theorem II"; `sources.toml` `locator = "Theorem II"` with a `version_note` | uncertified; one locator now carries all four uses, and §5.4 says it is the case of coefficients independent of the unknown |
| 1b/F05 | repaired | `:806-808` "the identification is proved here. For the sound cones of a solution as its causal structure: …"; `:1713-1716` Corollary 3.2.3 with Lemma 3.2.2 | ChristodoulouMiao2014 lines 869–872 and Christodoulou2019 lines 134–138 are about sound cones as causal structure; BarGinouxPfaffle2007 lines 3284–3291, 3365–3367 are the local statement on a relatively compact causal domain |
| 1b/F06 | repaired | `:1152-1160` | transport: `|[t′, t′+1] Δ [t, t+1]| = 2|t′ − t|`; escaping bump: norm `1`, difference `2`; `U ≡ 1`: differences `0`, norm `∞` |
| 1b/F07 | repaired | `Suggested.lean:32-34` "a time depending only on a bound for the `Hᵏ_Λ` norm of the data and a compact set of states containing their values" | Burgers `−e^{−λ²x²}`, `λ = 10`: `T* = e^{1/2}/(10√2) = 0.1166`, values in `[−1, 0]` |

No repair introduced an error: the new statements (weak `L`, pinned commutation, frame
determinant, velocity bound, entropy on developments, the `C(I; Hᵏ_Λ)` Check) were recomputed, rows
above and in the table of the pass.

## The pass

Running table of `Suggested.lean` (37 declarations, namespace
`TauCetiRoadmap.CompressibleEulerEquations`; `variable {n N : ℕ}` inside `namespace
QuasilinearSystem`, `variable {n : ℕ}` from Layer 3 on; no instance variable in any section, every
theorem carries `[NeZero n]`, `Λ`, `[DiscreteTopology Λ]` and its hypotheses in its own signature).
I ran no Lean (read-only pass): the 37 elaborated types of `scratch/signatures.md` were compared
with the README statements; `[NeZero n]` occurs in 14 theorems (all but
`exists_incompatible_developments`, `n = 1`), `[DiscreteTopology Λ]` in 13; no binder is lost and
nothing changed.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| `EquationOfState`, `soundSpeed`, `quadraticLaw` | `ρ²/2` at `4`; `ρ²` at `1/2`; Chaplygin `−A/ρ`; `−ρ²` | `c = 2` (not `4`); `c = √(2·1/2) = 1`; `p′ = A/ρ² > 0`; `p′ = −2ρ < 0` rejected | sound |
| `IsSolution` (§1.3) | entropy wave `P = e^sρ²`, `s = x`, `ρ = e^{−x/2}`; `(1, 0, t)`; boost `w = 1` of the expanding flow | `P ≡ 1`, wrong momentum `−e^{x/2}`; `Bs = 1`; `∂_tṽ + ṽ∂_yṽ = −(1+y)/(1+t)² + (1+y)/(1+t)² = 0`, wrong rule `−1/(1+t)` | sound |
| `QuasilinearSystem`, `symbol`, `Dominates` | transport `a = 3`, `ζ = (1, −1)`; `κ = (1 + λ, 0)`; monotonicity; `N = 0` | `−2`; `σ ≥ (ζ₀ − λ|ζ′|)A⁰ ≥ |ζ′|A⁰`; `ζ₀ + w·ζ′ ≥ c′|ζ′| − |w′ − w||ζ′| ≥ c|ζ′|`; empty matrix | sound |
| Euler symmetrisers (§2.2) | `SN` entries; `(1, 0)` for `P = e^sρ²`; `n = 1`, `(1, 3)`, `c = 2` | `(SN)[ρ, v] = aρξᵀ = (SN)[v, ρ]ᵀ`, `(SN)[v, s] = ρbξ = (SN)[s, v]ᵀ`; `ad − b² = a`, minors `2, 2, 2`; `4λ² − 24λ + 20 = 4(λ − 1)(λ − 5)` | sound |
| Acoustical form (§3.1, Conventions) | `n = 2`, `c = 2`, `v = (1, 0)`; `ζ = (−3, 1, 0)`; boost `w = v` | determinant `−4`; `(1, 3, 0)`: `−4 + 4 = 0`; `(1, 4, 0)`: `5`; `ζ₀ + v·ζ′ = −2`, `c|ζ′| = 2`; `g_{c,v}((τ, ξ + τw), ·) = g_{c,v−w}` | sound |
| `IsCausalCurve`, `IsPastCausalCurve`, `IsPastInextendible` | `e^{3t}` in `(1, x)`; `1/(1/4 − s)` in `(1, x²)`; one-point `J`; closed `D = {|x| ≤ 1 + t}` | `2e^{3t}`, `0.0996` at `−1`; `ẋ = x²`, `x(1/2) = −4`, `→ −∞`; inextendible only at `t = t₀`; `x ≡ 1.9` extends along `x = 1 + t` to `(0, 1)` | sound |
| `futureDomainOfDependence`, `causalPast` | constant field; point datum `(1, 0)`; expanding flow; slit and punctured half-space | `|x − tv₀| < R − c₀t`; `D⁺ = S`; `ẏ = −(1+t)^{−3/2}`, edge `2√(1+t) − (1+t)`, `0` at `t = 3`; S02 values | sound; S02 |
| First-exit arguments (§3.3, §8.1, §8.2) | `(D, U) ≤ (D′, U′)`; `W₁₂ ⊆ W₂₁`; compatible ⇒ `D₁ ∩ D₂ ⊆ W₁₂` | exit time `τ ≥ t₀`, the piece on `(τ, t_p]` is inextendible in the smaller domain and misses `Σ_{t₀}`; `W₁₂` open (upper semicontinuity) and past-closed, so the exit point lies in `W₁₂` | sound |
| `sobolevNormSq` and variants (§4.1) | `e^{−|x|²}`, `n = 2`, `k = 2`; `cos x` on `2πℤ`; datum `1_{2πℤ}` | `π/2 + π + (3π/2 + 3π/2 + π/2) = 5π`; operator-norm Hessian `2π(1 − e^{−2}) + 10πe^{−2}`; `2π` against `2`, ratio bounds `1/(2π)`, `1/π`; norm `0` with `g_0 = u`, `g_α = 0` | sound; S01 |
| §4.2–§4.3 | `e^{−x²}`; dilations; Nirenberg (2.2) with `a = i/k`; `Φ_m = sin(ms)`; `Φ = y³`, `Ū = a`; hedgehog | `2 ≤ √5`; `λ^{1/2}` against `λ^{1/6}`; `1/p = i/(2k)`; `sin 1 ≤ m·m⁻¹`; ratio `a²`, enlarged constant `max(363, 2000)`; `π²(4π − 4π/3) = 8π³/3`, `J_εu(0) = 0` | sound |
| §4.4 | `a = sin(x/2)`, `u = sin x`; `a = x`; non-bump kernel | `½[5/8 − 3/8]μ₂ε² = μ₂ε²/8` at `π`; `ψ(z) = −zφ_ε(z)`, `‖ψ′‖_{L¹}` scale-free; pinned lemma applies | sound |
| §5.1–§5.4 | `h` witness; `A⁰ = √(1+x²)`; forcing Check; `A⁰ = e^{sin x}`, `A¹ = M` | `apply = 0`, `LW = ∂₁h`; `π`, `π/8`, `2 asinh R`; `2√S_m ≤ C₁√(2π)`, `S_m ≥ πm⁴/3`; `2·2π + 4·4π + 2π = 22π`, `E₂(0) ≤ 24eπ` | sound; S03 |
| `IsLensFunction`, `eqOn_lens` | `t₁ = t₂`; `t₁ > t₂`; weight `φ₊`; pair `(0, x)`, `(g(t + 1/x), x)` | conclusion is `hbase`; empty; `dE/dt = ∫⟨σ(dφ)W, W⟩1_{φ>0} + O(E) ≤ CE`; `g′(1 − 1) = 0`, `u(0.9, −10/3) = g(0.6)`, excluded by `hper` (`Λ = ℤ`) or by compactness (`Λ = 0`) | true as typed |
| `eqOn_causalPast` | `p` at `t = t₀`; counter-flow `(2, 0)`; points of `J⁻_D(p)` at `t₀` | `J⁻ = {p}`, `hdata`; `hpO` fails; each lies on a curve on `[t₀, t_p]`, inextendible, hence in `S` | true as typed; S04 |
| `QuasilinearSystem.localWellPosedness`, continuation | `K = {Ū}`; `M < 0`; Burgers `−e^{−λ²x²}`; non-periodic unbounded `U′` | constant solution; only `U₀ = Ū`; `T* = e^{1/2}/(λ√2)`, `‖u″‖² = 3√(π/2)λ³ = 3760` at `10`; `D⁺_D(Σ) = D` for the bounded field of `U` | true as typed |
| `EquationOfState.localWellPosedness`, continuation | `L = ∅`; `r < 0`; background off `L`; simple wave | vacuous; `r/2 < 0 < ρ`; `{1, 5} × B̄`; `w = v + ρ`, `min w₀′ = −√2e^{−1/2}`, `T* = 1.1658`, `ρ ∈ [1, 3/2]` | true as typed |
| §7.3 | `u′ = u/(1 − u)`; cones `C_y`; switched symbol at `ζ = (−2, 1)` | `−ln U₀ − (1 − U₀)`: `0.0721`, `0.00365`; `|x_q − y′| < 1 − mt_q`; added entry `−2` | sound |
| `IsDevelopment`, `exists_incompatible_developments` | `D₁ = T_L ∪ (T_R ∩ {t < 1})`; `S = ∅` | speeds `1, 3` and `−3, −1`; `x − t` non-increasing backwards in `T_L`; `v₁(2, 0) = 2 ≠ −2`; `D = ∅` | true |
| `maximalCommonDevelopment`, `compatible_iff`, `exists_maximal_development` | `D₁ ⊆ D₂`; glued union; chains | `W₁₂ = D₁`; `ContDiffOn` is local on `(W₁ ∪ W₂) ∩ H`; union is an upper bound | true as typed |
| `isGreatest_development_of_solution`, `isDevelopment_slab`, `slab_subset_of_maximal` | `U` not periodic off `D⁺`; `p ∈ D ∩ O`; `D ∪ O` | `U^λ` has the data of `U` on `S`, so `U = U^λ` on `J⁻_O(p)`; `J⁻_D(p) ⊆ {t ≤ t_p} ⊆ O`; curves from `O \ D` stay below `t₀ + T` and reach `t₀` by `hbdd` | true as typed |
| `boundary_futureCausal`, `boundary_null` | `ξ = v − c′∇φ/|∇φ|`; `∇φ(q) = 0`; truncation top; expanding flow at `t = 1`; `φ = t − 0.9x` | `dφ(1, ξ) = dφ(1, v) − c′|∇φ| < 0`; `∂_tφ > 0 = c̃·0` strict, excluded; cone of slope `2` added; `(1 − 1/√2) + (√2 − 1) = 1/√2 = c`; `|x| < 18.2ε` | true as typed |

Dependency check (the command of the brief, on the README as it stands):

    depcheck: 250 roadmaps, 2363 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. LorentzianGeometry and SymmetricHyperbolicSystems are open pull
requests of other authors that add new roadmap folders; they were read at their heads with
`roadmaps show`.

Headline theorems (README `:508-520`): lens uniqueness, uniqueness on domains of dependence,
quasilinear well-posedness and continuation, Euler well-posedness and continuation, the five
statements of §8.2, the two of §8.3, the two of §8.4. All fifteen are stated; none goes through a
stand-in; the module docstring says none is omitted. One-tactic probe: no declaration restates a
definition, follows from one pinned lemma, mirrors a Check or computes a value; there is no
`example`, `#check`, `#eval`, `set_option` or `lemma`. No padding.

Policy: `git diff --stat origin/main...HEAD` shows only `packages/CompressibleEulerEquations/`
(README.md, Suggested.lean, metadata.toml, sources.toml and two reports); no pull-request number or
process word in the README or the docstrings; "lemma" occurs only in "Friedrichs' lemma", "Zorn's
lemma" and source locators. Supplier gaps: none declared (`design/plan.json` has `"gaps": []`),
none needed.

Source independence: 22 passages compared with 10 sources, none shared (longest common run 4 words, "is a null hypersurface", forced by the mathematics); largest share Majda1984, 18 of 113 locators, whose text and table of contents could not be read; next ChristodoulouMiao2014, 17 of 113; contents compared with ChristodoulouMiao2014 (§§1.1–1.4, 2.1–2.2, 3.1 ff.): independent.

## Verified sound

- **Declarations read:** 37 of 37, each against its README statement and its elaborated type.
- **Targets read:** 25 of 25 sections (§1.1–§8.4), every line, with Scope, Conventions, the
  supplier contracts, Downstream consumers and Worked examples.
- **Checks tested:** about 95 recomputed by hand (values in the table); none false, none vacuous.
- **Pinned declarations:** 68 of 68 `file:line` citations (24 Mathlib, 44 Tau Ceti) found at the
  cited line at the pins; the mollification lemmas read in full.
- **Locators verified this pass:** 39 in 11 cached sources (EperonReallSbierski2019 12,
  ChristodoulouMiao2014 8, LukNotes 4, BarGinouxPfaffle2007 3, Christodoulou2019 3,
  AbbresciaSpeck2022 3, LuoYu2023b 2, LuoYu2023a 1, Minguzzi2019 1, Nirenberg1959 1 with its
  printed page 125, Speck2016 1); all carry the cited statement, with the qualification of S04.
- **Sibling citations checked:** LorentzianGeometry §7.3 and §12.6 read in full at its head
  (first Check of §7.3, `TimeOrientedLorentzianFieldOn`, `IsFutureCausalCurveIn`,
  `IsPastInextendibleIn`, `futureDomainOfDependenceIn`, the time-function, slab, determination and
  covering statements), §§6.1, 6.3, 8.2, 8.3, 9.2, 11.4, 12.7 by heading; SymmetricHyperbolicSystems
  §1.2 (`LinearSystem`, `apply`, `IsSymmetricHyperbolic`), Conventions (*Propagation speed*) and
  §2.1 read, §§2.2, 2.3, 7.3 by heading; PDE §§1.3, 1.4, 7.1–7.3 and ComplexKahlerGeometry §5.7 on
  main; MathematicalStatisticsNonparametric §6.2 and RelativisticQuantumFieldTheory RQFT1 at their
  heads.
- **Ownership:** `roadmaps grep` by object (`QuasilinearSystem`, `EquationOfState`,
  `IsDevelopment`, `sobolevNormSq`, `futureDomainOfDependence`, `IsCausalCurve`, `IsLensFunction`,
  Moser, Gagliardo–Nirenberg, Friedrichs, maximal development) over main and the open heads: no
  second owner. `causalPast` is also declared in LorentzianGeometry and
  RelativisticQuantumFieldTheory under their own namespaces, with other signatures; no fully
  qualified name coincides. The pinned libraries have no quasilinear system, causal curve, Moser
  estimate or periodic `Hᵏ` on `E` (the pinned Gagliardo–Nirenberg–Sobolev inequality is the
  `W^{1,p} → L^{p*}` one).
- **Note (not a finding).** `EquationOfState.isGreatest_development_of_solution` assumes `U`
  Λ-periodic on `H_{t₀}` (`hper`), while §8.3 says no periodicity off the development is needed for
  a slab. With `hper` replaced by periodicity of `Ū` on `S`, the statement follows from
  `EquationOfState.isDevelopment_slab` for every `T` and time truncation
  (`D⁺_H(S) ∩ {t < t₀ + T} = D⁺_{[t₀, t₀+T) × E}(S)`); I found no instance separating the two, so the
  hypothesis is recorded only.

## Not verifiable

- Majda1984, Kato1975, Dafermos2016 (uncertified) and Friedrichs1954, HawkingEllis1973, ONeill1983,
  Christodoulou2007 (waived): no text. Not checked: that Kato's Theorem II is the quasilinear
  theorem and covers the linear case as §5.4 says; Majda §§2.1–2.3 and Theorem 2.1; Dafermos
  Theorem 5.1.1.
- Truth of the 15 `sorry` theorems beyond the instances and arguments of the table; no Lean was
  elaborated in this pass.
- The Besov comparison Check of §4.1 depends on the normalisation of PDE §7.1, a plan on main, not
  a definition.

## Source issues

- **Error** in ChristodoulouMiao2014 at §2.1.2, printed pp. 24–25 (lines 872–880): the source says two developments of one initial data set coincide on the intersection of their domains, so the union of all developments is the unique maximal one; it should be that they coincide on their maximal common development, and uniqueness of a maximal development needs a further hypothesis; affects a stated result.

## For the human reviewers

- **Not tested.** Majda1984 has the largest share of the locators (18 of 113) and is uncertified: its wording and table of contents were not compared; ChristodoulouMiao2014 (17) was.
- **Scope.** `README.md:2217-2219` states that a uniqueness claim printed in ChristodoulouMiao2014 (lines 872–880) is false and gives a counterexample; EperonReallSbierski2019 Theorem 3.45 is the refereed analogue for a wave equation, not for Euler.
- **Licence.** LukNotes is lecture notes read from the author's page (`sources.toml`: `licence_class = "author-page"`); it is cited at eight places, each beside a published source.
- **Licence.** Kato1975's theorem number rests on a second-hand report in arXiv:2103.08919, Appendix A (`sources.toml`, `version_note`); the paper itself was not read.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3969592e9c58b20381174405a2dd90d13cdad77b", "job": "RT-CompressibleEulerEquations~2a", "model": "fable", "worker": "chris-x88"} -->
