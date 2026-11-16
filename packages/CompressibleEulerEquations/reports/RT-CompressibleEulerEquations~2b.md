<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18030#issuecomment-6908288097 -->
Red team round 2 pass b (claude) of 3969592

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §4.3's commutator estimate is stated for `f, g ∈ Hᵏ_Λ`; §5.3 uses it for `f ∉ L²_Λ` and `g ∈ Hᵏ⁻¹_Λ`

   **Location.** `packages/CompressibleEulerEquations/README.md:1217` ("Prove, for `u, f, g ∈ L^∞ ∩ Hᵏ_Λ`
   and multi-indices `α`:") with the *Commutators* bullet :1231-1232; used at :1584-1586 ("The
   commutator is bounded by §4.3 by `C(‖∇U‖_∞‖W‖_{Hᵏ_Λ} + ‖U − Ū‖_{Hᵏ_Λ}‖∇W‖_∞)`") for
   `[∂^α, Mⁱ(U)]∂ᵢW`, `|α| ≤ k`.

   **Claim.** The commutator bound of §5.3 is the *Commutators* bullet of §4.3.

   **Witness.** `Λ = 0`, `n = 1`, `k = 2`, Burgers (`M¹(u) = u`), `Ū = 1`, `U = 1 + e^{−x²}`:
   `f = M¹(U)` has `∫ f² = ∞`, so `f ∉ Hᵏ_Λ`; and `g = ∂ₓW` is only in `H¹` for `W ∈ H²`. Both
   hypotheses of :1217 fail; for `|α| = k`, `∂^α(fg)` is not in `L²`.

   **Repair.** Replace the *Commutators* bullet (:1231-1232) by:

   > - *Commutators.* Let `1 ≤ |α| ≤ k`, let `f` be Λ-periodic and bounded with
   >   `∇f ∈ L^∞ ∩ Hᵏ⁻¹_Λ` (`f` itself need not lie in `L²_Λ`; `f − f̄ ∈ Hᵏ_Λ` for a constant `f̄`
   >   suffices), and let `g ∈ L^∞ ∩ Hᵏ⁻¹_Λ`. The commutator
   >   `[∂^α, f]g = Σ_{0<β≤α} (α choose β) ∂^βf ∂^{α−β}g`, which contains derivatives of `g` of order at
   >   most `k − 1` only and equals `∂^α(fg) − f∂^αg` when `g ∈ Hᵏ_Λ`, satisfies
   >   `‖[∂^α, f]g‖_{L²_Λ} ≤ C(‖∇f‖_∞‖g‖_{Hᵏ⁻¹_Λ} + ‖∇f‖_{Hᵏ⁻¹_Λ}‖g‖_∞)` (Majda1984, Ch. 2, §2.1).
   >   Route: with `m = |α| − 1`, each term is `∂^{β−e}(∂_e f) ∂^{α−β}g` with orders `i = |β| − 1` and
   >   `j = |α − β|`, `i + j = m`; for `m = 0` it is `∂_e f · g`; for `m ≥ 1` Hölder with exponents
   >   `2m/i`, `2m/j` and the Gagliardo–Nirenberg inequality at order `m ≤ k − 1` for `∇f` and `g`
   >   (the `L^∞` norm when `i = 0` or `j = 0`), then Young's inequality.

   and at :1584-1586 write "The commutator `[∂^α, Mⁱ(U)]∂ᵢW = [∂^α, Mⁱ(U) − Mⁱ(Ū)]∂ᵢW` is bounded by
   §4.3, with `f = Mⁱ(U) − Mⁱ(Ū) ∈ L^∞ ∩ Hᵏ_Λ` (composition estimate) and `g = ∂ᵢW ∈ L^∞ ∩ Hᵏ⁻¹_Λ`, by
   …". Tested on the witness: `∇f = −2xe^{−x²} ∈ L^∞ ∩ H¹`, `g = ∂ₓW ∈ H¹(ℝ) ⊆ L^∞`; the repaired
   hypotheses hold and the bound reads `‖∂ₓf ∂ₓg‖ + ‖∂ₓ²f g‖ ≤ ‖∇f‖_∞‖g‖_{H¹} + ‖∇f‖_{H¹}‖g‖_∞`
   (`|α| = 2`), true term by term.

2. **F02** (P3) the route of §5.4 cites "the bounds of §5.3" for coefficients §5.3 does not treat

   **Location.** `README.md:1650-1651` ("the bounds of §5.3 hold uniformly in `ε` by Friedrichs'
   lemma") against §5.3, :1568-1571 ("`W` in the same class solving
   `A⁰(U)∂_tW + Σᵢ Aⁱ(U)∂ᵢW = f`").

   **Claim.** §5.3 supplies the `Hᵏ_Λ` a-priori estimate for the operator of §5.4.

   **Witness.** §5.4's operator has arbitrary coefficients `A^μ(t, x) ∈ Ā^μ + Hᵏ_Λ` and a term `B`.
   `n = N = 1`, `Λ = 2πℤ`, `A⁰ = 1`, `A¹ = 0`, `B = sin x`: an operator of §5.4, not of the form
   `A^μ(U)`, `B = 0` of §5.3.

   **Repair.** Replace the clause by: "the `Hᵏ_Λ` estimate of the statement holds for `W_ε`
   uniformly in `ε`; it is proved by the argument of §5.3 with `A^μ − Ā^μ` and
   `(A⁰)⁻¹ − (Ā⁰)⁻¹` in place of the composed coefficients (product and commutator estimates of
   §4.3; the composition estimate for matrix inversion on `{λ₀I ≤ A ≤ sup‖A⁰‖ I}`, with `Ā⁰` positive
   definite, as it is when `Λ` is not of full rank and as may be arranged by taking for `Ā⁰` a value
   of `A⁰` when it is), and with `‖BW‖_{Hᵏ_Λ} ≤ C‖B‖_{Hᵏ_Λ}‖W‖_{Hᵏ_Λ}` (algebra property, `2k > n`) for
   the zeroth-order term; §5.3 is the case `A^μ = A^μ(U)`, `B = 0`". Tested on the witness:
   `W = e^{−t sin x}W₀`, `dE_k/dt ≤ C(‖sin x‖_{Hᵏ_Λ})E_k`.

3. **F03** (P3) "the pinned statements stop at `j = 0`": Tau Ceti has the circle derivative and the `C¹` embedding

   **Location.** `README.md:69-75` ("Tau Ceti also has six special cases of Layer 4") and :402-420
   ("three special cases of Layer 4 … is the embedding of §4.2 at `j = 0` … §§4.2–4.3 state the
   embeddings into `C^j_b` for `2k > n + 2j`").

   **Claim.** On the circle the pins have the embedding only at `j = 0`, and no derivative operator.

   **Witness.** `TauCeti/Analysis/Sobolev/Circle/Derivative.lean:83,195` at the pin:
   `TauCeti.CircleSobolev.derivative` (bounded `H^t → H^s` for `s + 1 ≤ t`) and
   `TauCeti.CircleSobolev.hasDerivAt_toContinuousMap` (for `s > 1/2`, `s + 1 ≤ t`, the representative
   is differentiable with derivative the representative of the derivative).

   **Repair.** In :69-75 write "eight special cases" and add to the circle list "the derivative
   `H^{s+1} → H^s` and the differentiability of the continuous representative". In the
   `TauCeti.CircleSobolev` bullet write "five special cases" and add: "`TauCeti.CircleSobolev.derivative`
   with `TauCeti.CircleSobolev.norm_derivative_le` and `TauCeti.CircleSobolev.hasDerivAt_toContinuousMap`
   (`TauCeti/Analysis/Sobolev/Circle/Derivative.lean:83,98,195`) are the case `n = 1`, `Λ = Tℤ`,
   complex values, of `∂ᵢ : Hᵏ⁺¹_Λ → Hᵏ_Λ` (§4.1) and, applied `j` times, of the embedding into `C^j`
   for `2k > 1 + 2j` (§4.2); not consumed." and delete "the embeddings into `C^j_b` for
   `2k > n + 2j`," from the list of what only §§4.2–4.3 state. Tested: `k = 2`, `j = 1`: `s = 1 > 1/2`,
   `t = 2 ≥ s + 1`, and `4 > 3`.

4. **F04** (P3) §4.1's identification with `TauCeti.Wkp` has a pinned inductive step that is not cited

   **Location.** `README.md:1088-1091` ("For `Λ = 0`, `u ∈ Hᵏ_Λ` iff each coordinate of `u` is the value
   of an element of `TauCeti.Wkp volume ⊤ 2 k`") and the `*Needs:*` line :1162-1166.

   **Claim.** The inputs of this bullet are the declarations of the `*Needs:*` line.

   **Witness.** `TauCeti/Analysis/Sobolev/Wkp/LineDeriv.lean:287,156` at the pin:
   `TauCeti.Wkp.exists_value_eq_iff_forall_exists_hasWeakLineDerivOn` (`u ∈ Lᵖ(Ω)` is a value of
   `W^{k+1,p}(Ω)` iff every directional weak derivative is a value of `W^{k,p}(Ω)`) and
   `TauCeti.Wkp.exists_hasWeakLineDerivOn_value`. Neither occurs in the README.

   **Repair.** Add to "From Tau Ceti": "`TauCeti.Wkp.exists_value_eq_iff_forall_exists_hasWeakLineDerivOn`
   with `TauCeti.Wkp.exists_hasWeakLineDerivOn_value` and
   `TauCeti.Wkp.exists_value_eq_of_forall_hasWeakLineDerivOn`
   (`TauCeti/Analysis/Sobolev/Wkp/LineDeriv.lean:287,156,267`): an `Lᵖ` function on an open `Ω` is the
   value of an element of `W^{k+1,p}(Ω)` exactly when its weak derivatives along an orthonormal basis
   are values of elements of `W^{k,p}(Ω)`. With `Ω = ⊤`, `p = 2`, by induction on `k`, this is the
   equivalence between a family `IsWeakDerivFamily k u g` with `g_α ∈ L²` and a `Wkp` element of §4.1;
   consumed, not proved again." and add the three names to the `*Needs:*` line of §4.1. Tested at
   `k = 1`, `n = 1`, `u = e^{−x²}`: the family `(u, −2xe^{−x²})` and the `W^{1,2}` element with that
   gradient.

5. **F05** (P3) `causalPast` and `IsLensFunction` have no discriminating Check

   **Location.** `README.md:951-953` (definition of `J⁻_D(p)`, `causalPast`) with the Checks of §3.3,
   :1016-1041, none of which computes a causal past; :1693-1698 (`IsLensFunction`) with the Checks of
   §6.1, :1757-1782, none of which exhibits a function that fails the definition.

   **Witness.** The wrong model "chronological past" (`|ẋ − v| < c`) passes every Check of §3.3. For
   `IsLensFunction`: dropping the compactness clause passes every Check of §6.1, yet with it dropped
   `QuasilinearSystem.eqOn_lens` is false (`Λ = 0`, `φ = 1 − t`, the pair of :1771-1775).

   **Repair.** Add to the Checks of §3.3:

   > - Causal pasts, constant field `(c₀, v₀)`, `D = H₀`:
   >   `J⁻_D(p) = {(t, x) : 0 ≤ t ≤ t_p, |x − x_p − (t − t_p)v₀| ≤ c₀(t_p − t)}`, a compact set
   >   containing `p` and the null segment; for `(1, 0)`, `n = 1`, `p = (2, 0)` its slice at `t = 0` is
   >   `[−2, 2]`, and `(1, 1) ∈ J⁻_D(p)` although no curve with `|ẋ| < 1` joins it to `p`. In
   >   `D = H₀ \ {(1, 0)}` the same `p` has `J⁻_D(p)` equal to that triangle without `(1, 0)`
   >   (`(0, 0)` is reached through `(1, 1/2)`), which is not compact; and `p ∉ D⁺_D(Σ₀)`, since `x ≡ 0`
   >   on `(1, 2]` is past-inextendible: compactness of pasts needs `p ∈ D⁺_D(S)`.

   and to the Checks of §6.1:

   > - The compactness clause: for `Λ = 0`, `φ = 1 − t` on `[0, 2] × ℝ` is Lipschitz and (vacuously)
   >   periodic, but `{φ > 0} = [0, 1) × ℝ` lies in no compact set, so it is not a lens function; and
   >   it must not be one, since the two solutions `(0, x)`, `(u, x)` of the periodicity Check agree
   >   on its base and differ at `(0.9, −10/3)`. For `Λ = 2πℤ` the single cone `R − |x − x₀| − Mt` is
   >   not a lens function either: it is not Λ-periodic (§5.2).

   Both tested: slice `[x_p − c₀t_p, x_p + c₀t_p] = [−2, 2]`; `1 − t > 0` on all of `[0, 1) × ℝ`.

Five new findings: one P2 (a Layer 4 target stated below the generality at which Layer 5 uses it)
and four P3 (a proof route citing a section for a statement it does not make, a "the pins lack"
claim that is false at the pin, an uncited pinned lemma, two definitions without a discriminating
Check). No statement of `Suggested.lean` was refuted; all eleven round-1 findings are repaired.

## Round-1 findings at this head

| Id | Status | Witness at `packages/CompressibleEulerEquations/README.md` (or as noted) |
|---|---|---|
| 1a/F01 | repaired | :462-468 "`LinearSystem.apply` is the classical left-hand side … used here only on `C¹` maps"; :1433 "with `∂_tW` the `L²_Λ`-valued time derivative and `∂ᵢW` the weak derivatives"; new Check :1478-1485. Recomputed: difference quotients of a `C¹` `W` converge in `L²_Λ` and pointwise, so the two limits agree a.e. |
| 1a/F02 | repaired | :338-348 contract bullet for `TauCeti.HasWeakLineDerivOn.lineDeriv_convolution_right`; :1345-1349 "the extension of these two statements … The commutation … is not restated". Lemma read at the pin (`TauCeti/Analysis/Sobolev/Mollification/Basic.lean:73,97`): hypotheses `LocallyIntegrable u`, `ContDiff ℝ ∞ rho`, `HasCompactSupport rho`, as the bullet says. |
| 1a/F03 | repaired | :787-790 "(LorentzianGeometry §7.3, first Check, with §6.1's `minkowskiForm E` …); stated here is its determinant `c`". First Check of §7.3 read at the open head. |
| 1a/F04 | repaired | :2187-2203; EperonReallSbierski2019 lines 1010–1012, 1141–1144, 1208–1210, 1218–1223, 1228, 1232–1240, 1330, 1342 opened: each carries the claim attached. |
| 1b/F01 | repaired | :1973-1983 "the velocity is bounded as well … `sup_x |v(t, x)| ≤ sup_x |v(t₀, x)| + C_L ∫ ‖∇(ρ, s)(r)‖_∞ dr`". Recomputed on `p = ρ³/3`: `C_L = 3/2`, `v ∈ [0, 1/2]`. |
| 1b/F02 | repaired | :2150-2160 *Entropy on developments*; :622 "(on slabs, here; on developments, §8.1)"; `Suggested.lean:18-20`. Recomputed on the counter-flow `D₁`: material curves `ẋ = ±2` reach `x < −1`, `x > 1` at `t = 0`. |
| 1b/F03 | repaired | :1504-1505, :1710, :1808 "Majda1984, Ch. 2, §2.1, the energy method, whose localised form is proved here"; :2031 "§2.3, uniformly local Sobolev spaces". |
| 1b/F04 | repaired (differently) | "Kato1975, Theorem II" at :1642, :1888, :2031, :2267, :2486; `sources.toml` `locator = "Theorem II"`. The numbering is second-hand (see Not verifiable). |
| 1b/F05 | repaired | :806-808 "the identification is proved here"; :1713-1716 BarGinouxPfaffle2007 Corollary 3.2.3 (line 3365) with Lemma 3.2.2 (line 3284), both opened: local, on a relatively compact causal domain. |
| 1b/F06 | repaired | :1152-1160; recomputed: transport `2|t′ − t|`, escaping bump `2`, `U ≡ 1` differences `0` and norm `∞`. |
| 1b/F07 | repaired | `Suggested.lean:32-34` "a bound for the `Hᵏ_Λ` norm of the data and a compact set of states containing their values". |

No repair introduced an error. `git diff 016483d 3969592` changes only the module docstring of
`Suggested.lean`; no signature moved.

## The pass (computed)

`Suggested.lean`: 37 declarations (2 structures, 20 definitions, 15 theorems), namespace
`TauCetiRoadmap.CompressibleEulerEquations`; `variable {n N : ℕ}` inside
`namespace QuasilinearSystem`, `variable {n : ℕ}` from Layer 3 on. No Lean was run (read-only): the
37 elaborated types of the worker's `signatures.md` were compared with the README statements;
`[NeZero n]` occurs in 14 theorems, `[DiscreteTopology Λ]` in 13, no binder is lost, nothing
changed.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `EquationOfState`, `soundSpeed`, `quadraticLaw` | `ρ²` at `1/2`; `e^sρ²` at `(1, 0)`; `−ρ²` | `c = 1`; `∂_ρP = 2`, `c = √2`; `−2ρ < 0` rejected | sound |
| `IsSolution` | expanding flow `n = 1`, `t = 1`; boost `w = 1`; `(1, 0, t)` | `−ρ₀/4` both sides; residual `0`, wrong rule `−1/2`; `Bs = 1` | sound |
| `QuasilinearSystem`, `symbol`, `Dominates` | transport `a = 3`, `ζ = (1, −1)`; monotonicity; `N = 0` | `−2`; `ζ(1, w) ≥ (c′ − |w′ − w|)|ζ′| ≥ c|ζ′|`; empty matrix | sound |
| §2.2 symmetrisers | `S·N` entrywise; block determinant; `(1, 3)`, `c = 2` | `[ρ, vⁱ] = [vⁱ, ρ] = ∂_ρP`, `[vⁱ, s] = [s, vⁱ] = ∂_sP`; `ad − b² = ∂_ρP/ρ`; `4(λ − 1)(λ − 5)`; `σ = [[0, 4], [4, 0]]` | sound |
| §3.1 | `c = 2`, `v = (1, 0)`; covector cone | Gram `det = −4`; `ζ(X) ≥ τ(ζ₀ + v·ζ′ − c|ζ′|)`; `ζ = (−3, 1, 0)`: `−2`, `ζ(1, 3, 0) = 0` | sound |
| `IsCausalCurve`, `IsPastCausalCurve`, `IsPastInextendible` | `e^{3t}` in `(1, x)`; `(1, x²)`; one-point `J`; limit at the lower end outside `D` | `2e^{3t}`; `ẋ = x²`, `x(1/2) = −4`; inextendible iff `t = t₀` slice excluded; no extension since `y(a) = lim x ∉ D` | sound; agrees with LorentzianGeometry §12.6 extension form |
| `futureDomainOfDependence`, `causalPast` | constant field ball; expanding flow; `H₀ \ {(1, 0)}`, `p = (2, 0)` | `|x − tv₀| < R − c₀t`; `ẏ = −(1 + t)^{−3/2}`, edge `2√(1 + t) − (1 + t)`, `0.828` at `t = 1`; past not compact and `p ∉ D⁺` | sound; S05 |
| `IsWeakDerivFamily`, `sobolevNormSq`, `…Vec`, `stateSobolevNormSq` | `e^{−|x|²}`, `n = k = 2`; `cos x` on `2πℤ`; `k = 0` non-measurable `u` | `π/2 + π + (3π/2 + 3π/2 + π/2) = 5π`; operator-norm part `2π(1 − e^{−2}) + 10πe^{−2}`; `2π` vs `2`; only `k ≥ 2` is used by the theorems | sound |
| `IsContinuousIn` | transport, escaping bump, `U ≡ 1` | `2|t′ − t|`; `2`; `0` and `∞` | sound |
| §4.2–§4.4 | dilations; additive interpolation; loss-bound constant; `a = x` | `λ^{1/2}` vs `λ^{1/6}`; `2·3^{1/4}(π/2)^{1/4} ≈ 2.947 ≥ 1.120`; each `β` is `∂ᵢ∂^α` at most `n` times, `C = √n∫|y|φ`; `‖ψ′‖_{L¹}` free of `ε` | sound; commutator bullet: S01 |
| §5.1–§5.4 | `B = bI`; `√(1 + x²)`; `A⁰ = 1/(2 + u)`; `A⁰ = e^{sin x}`, `w = sin x + sin 2x` | `e^{−2bt}`; `π`, `π/8`, `2 asinh R`; `C₁ ≥ √(2/3)m²`; `2·2π + 4·4π + 2·π = 22π`, `E₂(0) ≤ 24eπ` | values sound; S01, S02 |
| `IsLensFunction`, `QuasilinearSystem.eqOn_lens` | `t₁ ≥ t₂`; weight `φ₊`; `Λ = 0`, `φ = 1 − t`; lens closure | conclusion is `hbase` or empty; `dE/dt = ∫_{φ>0}⟨σ(dφ)W, W⟩ + O(E) ≤ CE`; third clause fails; `closure ⊆ Λ + K` closed | true as typed; S05 |
| `QuasilinearSystem.eqOn_causalPast` | `p` at `t₀`; Burgers with `U₁ ≡ 0`; counter-flow at `(2, 0)` | past `{p}`; backward characteristic straight, `U₂(p) = 0`; `J⁻_{D₁}(p)` at `t = 1.5` is `[−1.5, −0.5]`, outside `{x > −0.5}`: `hpO` fails | true as typed |
| `QuasilinearSystem.localWellPosedness` | `M < 0`; Burgers `−e^{−λ²x²}`; `U′` unbounded | `U₀ ≡ Ū`; `T* = e^{1/2}/(λ√2)`, `0.1166` at `λ = 10`, norm² `≈ 3760`; uniqueness from the cones of `U` alone | true as typed |
| `QuasilinearSystem.exists_extension_of_lintegral_lt_top` | Burgers at `T* = 1.1658`; source `F` | `∫‖u_x‖_∞ = ∞`; `‖∂_tU‖_∞ ≤ C(K)(1 + ‖∇U‖_∞)` | true as typed |
| `EquationOfState.localWellPosedness` | `L = ∅`; `r ≤ 0`; background off `L` | vacuous; `r/2 ≤ 0 < ρ`; `(L ∪ {(ρ₀, s₀)}) × B̄(v₀, CM)` compact | true as typed |
| `EquationOfState.exists_extension_of_lintegral_lt_top` | simple wave `p = ρ³/3` | `v − ρ ≡ −1`, `T* = e^{1/2}/√2`, `ρ ∈ [1, 3/2]`, `|v| ≤ 1/2` | true as typed |
| `IsDevelopment`, `exists_incompatible_developments` | `D₁ = T_L ∪ (T_R ∩ {t < 1})` | speeds `1..3`: `x(s) ≤ x_p − (t_p − s) < −1 + s`; `T_L ∩ T_R ∩ {t < 1} = ∅`; `v₁(2, 0) = 2 ≠ −2` | true as typed |
| `maximalCommonDevelopment` | four conjuncts by first exit | `W₁₂` past-closed and relatively open; exit point in `D₁` lies in `J⁻_{D₁}(p) ⊆ W₁₂`, exit point outside `D₁` gives an inextendible curve missing `Σ_{t₀}` | true as typed |
| `compatible_iff`, `exists_maximal_development` | union of two; chains | a curve ending in `D₁` cannot leave `D₁` above `t₀`; union of a chain is an upper bound | true as typed |
| `isGreatest_development_of_solution`, `isDevelopment_slab` | unbounded field; `U` not periodic | first exit needs no bound; `U = U^λ` on `D⁺_O(S)` and `J⁻_O(p) ⊆ D⁺_O(S)` give Λ-invariance | true as typed |
| `slab_subset_of_maximal` | `p ∈ D ∩ O`; field `(1, x²)` | `J⁻_D(p) ⊆ {t ≤ t_p} ⊆ O`; without `hbdd` `D⁺_O(Σ) ≠ O` | true as typed |
| `boundary_futureCausal` | `φ = t − T`; `{|x| < 1 − t/2}`; `∇φ(q) = 0` | `1 ≥ 0`; `1/2 < 1`, not a development; then `u = v` gives `∂_tφ < 0` and an exiting segment | true as typed |
| `boundary_null` | truncation top; expanding flow at `t = 1`; `∇φ = 0` | `hmax` fails; `(1 − 1/√2) + (√2 − 1) = 1/√2 = c`; equality would force `dφ(q) = 0` against `hdφ` | true as typed |
| §7.3 | ODE exit time; switched symbol at `ζ = (−2, 1)`; `κ_m` | `−log(2/3) − 1/3 ≈ 0.0721`, `0.00365` at `x = 10`; added entry `−2`; `max(m, c_κ + |w_κ|) ≥ c_κ + |0 − w_κ|` | sound |

Dependency check (the command of the brief), verbatim:

    depcheck: 250 roadmaps, 2363 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

Headline theorems (README :508-520): lens uniqueness, uniqueness on domains of dependence,
quasilinear well-posedness and continuation, Euler well-posedness and continuation, maximal common
development, compatibility, existence of maximal developments, the uniqueness criterion, the
counterexample, developments in a slab, the slab in every maximal development, causal boundary,
null regular boundary. All fifteen are stated; none goes through a stand-in. One-tactic probe: no
theorem follows from one tactic or one pinned lemma, none restates a definition or mirrors a
Check; no padding.

## Verified sound

- Declarations read: 37 of 37, each against its README statement and its elaborated type.
- Targets read: 25 of 25 sections (§1.1–§8.4), with Summary, Scope, Conventions, supplier contracts,
  Downstream consumers and Worked examples; every line.
- Pinned declarations: 68 `file:line` citations resolved at the pins (24 Mathlib, 44 Tau Ceti), all
  at the cited line; `TauCeti.HasWeakLineDerivOn` and the two convolution lemmas read in full. Grep
  by object of both pins for a Friedrichs commutator lemma, an `L^∞`–`Hᵏ` Gagliardo–Nirenberg or
  Moser estimate, a symmetric hyperbolic system, an equation of state, a causal curve: none (the
  pinned Gagliardo–Nirenberg–Sobolev inequality is the `W^{1,p} ⊆ L^{p*}` embedding).
- Locators opened in the cached texts: 24 in 7 sources (EperonReallSbierski2019 767, 1010, 1141,
  1178, 1195, 1208, 1218, 1228, 1232, 1330, 1338, 1342, 1603; BarGinouxPfaffle2007 1006, 3284,
  3365; ChristodoulouMiao2014 606, 685, 818, 864–880; Christodoulou2019 124–138; LuoYu2023b 417,
  910; LukNotes 724, 1210, 1612). All carry the claim attached.
- Checks tested: about 60 recomputed by hand (values in the table); none false, none vacuous.
- Sibling citations checked at the open heads (`roadmaps show`): LorentzianGeometry §6.1, §6.3,
  §7.3, §12.6 read in full against the contract (every bullet present, including
  `futureDomainOfDependenceIn_self` and the extension form); §8.2, §8.3, §9.2, §11.4, §12.7 by
  heading. SymmetricHyperbolicSystems Scope, *Propagation speed*, §1.2 (`LinearSystem`, `apply`,
  `IsSymmetricHyperbolic` as typed in its `Suggested.lean`), §2.1 read; §2.2, §2.3, §7.3 by heading.
  PDE §1.3, §1.4, §7.1–§7.3 and ComplexKahlerGeometry §5.7 on main. 15 section citations in all.
- Ownership: `roadmaps grep` by object (`structure EquationOfState`, `structure QuasilinearSystem`,
  `IsDevelopment`, `sobolevNormSq`, "Moser estimate", "quasilinear symmetric hyperbolic", "maximal
  development") over main and the open heads: no second owner. `causalPast` is also declared in
  LorentzianGeometry's and RelativisticQuantumFieldTheory's `Suggested.lean`, under their own
  namespaces; no fully qualified name coincides. Both suppliers hand quasilinear systems and
  developments to a consumer (their Downstream consumers).
- Suppliers and order: LorentzianGeometry and SymmetricHyperbolicSystems are open pull requests
  that add new folders; no roadmap of the never-cite list is cited as a supplier. Supplier gaps:
  none declared, none needed.
- Policy: the pull request changes only `packages/CompressibleEulerEquations/`; no pull-request
  number or process word in the README or docstrings; `theorem` only; no `set_option`, `#eval`,
  `#check`, `True` placeholder or sorry'd data; imports `Mathlib` and one Tau Ceti module that
  exists at the pin.

## Not verifiable

- Majda1984, Kato1975, Dafermos2016 (`uncertified`) and Friedrichs1954, HawkingEllis1973,
  ONeill1983, Christodoulou2007 (`waived`): no text. "Kato1975, Theorem II" rests on a second-hand
  report of the numbering (recorded in the manifest's `version_note`); "Majda1984, Ch. 2, §2.3" on
  a public contents listing.
- MathematicalStatisticsNonparametric §6.2 and RelativisticQuantumFieldTheory RQFT1 (named, not
  consumed): resolved by the citation resolver only.
- Locators of the cached sources not reopened in this round (verified in round 1): those of
  Minguzzi2019, MinguzziCone2019, Chrusciel2011, Nirenberg1959, AbbresciaSpeck2022, LuoYu2023a,
  LukSpeck2018, Speck2016.
- Truth of the 15 `sorry` theorems beyond the instances and proof routes of the table; no Lean was
  elaborated in this pass.

Source independence: 24 passages compared with 7 sources, none shared (no common run above 6 words; the nearest are the definition of a Cauchy development and the nullity of the regular boundary, which the mathematics forces); largest share Majda1984, 18 of 113 locators (ChristodoulouMiao2014 next, 17); contents compared with ChristodoulouMiao2014 (cached contents, Ch. 1–2) and with the public contents listing of Majda1984 Ch. 2 (2.1–2.5): independent, Layers 1–8 map onto no run of either; the text of Majda1984 could not be read.

## Source issues

- **Error** in ChristodoulouMiao2014 at §2.1.2, printed pp. 24–25 (lines 872–880): the source says two developments of one initial data set agree on the intersection of their domains, so the union of all developments is the unique maximal one; it should be that they agree on their maximal common development only, and uniqueness of a maximal development needs a further hypothesis; affects a stated result.

## For the human reviewers

- **Scope.** `README.md:2217-2223` and `exists_incompatible_developments` state that a uniqueness claim of ChristodoulouMiao2014 (lines 872–880) is false; EperonReallSbierski2019 Theorem 3.45 is the refereed analogue for a quasilinear wave equation, not for Euler.
- **Licence.** LukNotes (`sources.toml`: `licence_class = "author-page"`) is unpublished lecture notes, cited at eight places of the README, each beside a published source.
- **Not tested.** Majda1984, the source with the largest share of the locators (18 of 113), is `uncertified`: its wording was not compared, and its arrangement only from a public contents listing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3969592e9c58b20381174405a2dd90d13cdad77b", "job": "RT-CompressibleEulerEquations~2b", "model": "fable", "worker": "chris-x30"} -->
