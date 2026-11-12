# Review of LorentzianGeometry (pull request #2232 at 145033c)

**Verdict:** needs changes

## R01 (P2) — Hawking's theorem is statable at the pins but is not stated

**Location:** `TauCetiRoadmap/LorentzianGeometry/Suggested.lean` lines 27–29: "Hawking's theorem and the timelike focusing lemma (§13.2, §13.3): there is no second fundamental form or mean curvature of a hypersurface in a semi-Riemannian manifold".

**Claim:** A second fundamental form is not needed to state Hawking's theorem. At a point of `S = t⁻¹(0)` the mean curvature is `tr(X ↦ ∇_X ν)` for `ν = −grad t/|grad t|`. All three ingredients are at the pins: Mathlib's `cov σ x : T_xM →L T_xM` (`CovariantDerivative/Basic.lean`:368), Tau Ceti's `sharp` and Tau Ceti's `ricciTensor`. Every smooth spacelike Cauchy surface is such a level set (Bernal–Sánchez 2006, already cited in §12.3).

**Witness:** A scratch copy of the file with the text below elaborates with 8 `sorry` warnings and no errors. For time-reversed Milne, `ν = −∂_t` gives `tr ∇ν = −1/t₀ = H`, and the bound `n/|b| = t₀` matches the second Check of §13.3.

**Repair:**
- In `Suggested.lean`, after the `PiecewisePath` import, add `public import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.Curvature.Ricci` and `public import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.LeviCivita.Nondegenerate.Regularity`.
- Insert the code block below before `end LorentzianMetric`.
- In the module docstring, add "Hawking's theorem (§13.3), for Cauchy surfaces that are level sets of a smooth temporal function" to the stated list. Change the bullet at lines 27–29 to: "the timelike focusing lemma (§13.2): there is no normal exponential map, hence no focal point, of a hypersurface in a semi-Riemannian manifold".
- At the end of the Hawking sentence in README §13.3, add: "(`lorentzianLength_le_of_meanCurvature_le`, for `S = t⁻¹(0)` with `t` smooth temporal, which by Bernal–Sánchez 2006 is every smooth spacelike Cauchy surface; mean curvature `levelSetMeanCurvature` of the unit normal `levelSetUnitNormal`, Ricci tensor `ricci`)".
- In the description, move Hawking's theorem from the not-statable list to the stated list.

```lean
variable (g) in
/-- **§2.5.** The Ricci tensor of the Levi-Civita connection of a smooth Lorentzian metric. -/
def ricci [T2Space M] (hk : ∞ ≤ k) (x : M) :
    TangentSpace I x →ₗ[ℝ] TangentSpace I x →ₗ[ℝ] ℝ :=
  letI := (g.val.toSmoothMetric hk).isLeviCivitaConnection_leviCivitaConnection
    |>.contMDiffCovariantDerivative le_rfl
  (g.val.toSmoothMetric hk).leviCivitaConnection.ricciTensor x

variable (g) in
/-- **§9.1.** The unit normal `−grad t / |grad t|` of the level sets of `t`; it is the future
unit normal when `dt` is positive on future causal vectors. -/
def levelSetUnitNormal (hk : ∞ ≤ k) (t : M → ℝ) (x : M) : TangentSpace I x :=
  let ν := (g.val.toSmoothMetric hk).sharp x
    (mfderiv I 𝓘(ℝ, ℝ) t x : TangentSpace I x →L[ℝ] ℝ).toLinearMap
  ((-1 : ℝ) / Real.sqrt (-(g x ν ν))) • ν

variable (g) in
/-- **§9.1.** The mean curvature `H = tr_h k` of the level sets of `t`, computed as the trace of
`X ↦ ∇_X ν` for the unit normal `ν` (its `ν`-component vanishes as `g(ν, ν) = −1`). -/
def levelSetMeanCurvature (hk : ∞ ≤ k) (t : M → ℝ) (x : M) : ℝ :=
  LinearMap.trace ℝ (TangentSpace I x)
    ((g.val.toSmoothMetric hk).leviCivitaConnection (levelSetUnitNormal g hk t) x).toLinearMap

/-- **§13.3, Hawking's theorem.** In a smooth globally hyperbolic spacetime of dimension `n + 1`
with the timelike convergence condition, if the level set `S = t⁻¹(0)` of a smooth temporal
function is a Cauchy surface with future mean curvature `H ≤ b < 0`, then every future causal
curve from `S` has Lorentzian length at most `n / |b|`. Every smooth spacelike Cauchy surface is
such a level set (Bernal–Sánchez 2006). -/
theorem lorentzianLength_le_of_meanCurvature_le [I.Boundaryless] [T2Space M]
    [SecondCountableTopology M] [ConnectedSpace M] (hk : ∞ ≤ k) (τ : TimeOrientation g)
    (h : IsGloballyHyperbolic τ)
    (hRic : ∀ (x : M) (v : TangentSpace I x), IsTimelike (g x).toBilinForm v →
      0 ≤ g.ricci hk x v v)
    (t : M → ℝ) (ht : ContMDiff I 𝓘(ℝ, ℝ) ∞ t)
    (hdt : ∀ (x : M) (v : TangentSpace I x), τ.IsFutureCausal v →
      (0 : ℝ) < (mfderiv I 𝓘(ℝ, ℝ) t x v : ℝ))
    (hS : IsCauchySurface τ (t ⁻¹' {0})) {b : ℝ} (hb : b < 0)
    (hH : ∀ x ∈ t ⁻¹' {0}, g.levelSetMeanCurvature hk t x ≤ b)
    (γ : ℝ → M) (a c : ℝ) (hγ : IsFutureCausalCurve τ γ a c) (ha : t (γ a) = 0) :
    lorentzianLength g γ a c ≤ ((Module.finrank ℝ E : ℝ) - 1) / |b| := by
  sorry
```

## R02 (P3) — Locators: §2.1 and §5.1 cite no source, §13.3 cites O'Neill by chapter only, and Geroch's theorem cites a different notion of Cauchy surface

**Location:** README §2.1 (lines 508–541) and §5.1 (lines 1058–1076) cite no source. Line 2286: "(O'Neill, Ch. 14; Hawking 1967; for a compact contracting Cauchy surface, …)". Lines 1953–1954: "(Geroch 1970; Minguzzi 2019, Theorem 4.119, p. 147; …)". The same locator is used at line 1926.

**Claim:** Partly repaired (previous R04).
- §2.1 and §5.1 are sampled targets that state theorems with no locator.
- §13.3's general (noncompact) Hawking statement has only a chapter locator.
- Minguzzi's Theorem 4.119 concerns closed acausal Cauchy hypersurfaces, while §12.2's Cauchy surfaces need only be achronal.

**Witness:** minguzzi2019 line 4053 (Definition 3.35, p. 95) requires acausality. In `ℝ^{1+1}` the graph `t = min(max(x, 0), 1)` meets every inextendible timelike curve once (`t − f(x(t))` is strictly increasing) but contains a null segment, so it is not acausal.

**Repair:**
- §2.1, after the trivialization formula: "(for the tangent bundle in coordinates, Barzen–Leymann, Lemma 24, (54), p. 42)".
- §5.1, after `J'' + R(J, γ')γ' = 0`: "(Lorentzian case: Minguzzi 2019, Proposition 6.3, p. 159; the Wronskian identity, p. 160)".
- Line 2286: replace "O'Neill, Ch. 14" with the numbered theorem and its page (`oneill1983` is uncertified, so cite it by locator alone).
- Lines 1953–1954: "(Geroch 1970; Minguzzi 2019, Theorem 4.119, p. 147, for its closed acausal Cauchy hypersurfaces, Definition 3.35, p. 95; for an achronal Cauchy surface, `D(S) = M` from §12.2 with Corollary 3.34, p. 95, and Theorem 3.45, p. 99, gives global hyperbolicity)".
- Line 1926: put "Geroch 1970" before the Minguzzi locator.

## R03 (P3) — The Checks of §2.4 and §12.7 do not test the Christoffel, conformal or Filippov formulas

**Location:** README lines 692–694 (§2.4): "A constant strong metric has zero Christoffel field." Lines 2195–2199 (§12.7): "this section applies to its domains of dependence, while Layer 10 does not."

**Claim:**
- None of the §2.4 Checks would fail for a wrong sign or a wrong factor in the Christoffel formula or the conformal formula.
- §12.7 has one computed Check, and none for its Filippov-geodesic definition.

**Witness:** Each §2.4 Check holds for any formula linear in `∂g`, since all three have `∂g = 0` or concern regularity only. The §12.7 Checks at lines 2195–2199 are remarks.

**Repair:** Add these computed Checks.
- §2.4: "For `−dt² + a(t)² dx²`, `Γ^t_xx = a a′` and `Γ^x_tx = a′/a`; dropping `g^{tt} = −1` gives `−a a′`."
- §2.4: "For `ĝ = e^{2t}(−dt² + dx²)` (`u = t`), the conformal formula gives `ĝ.∇_{∂_x}∂_x = −g(∂_x, ∂_x) g.sharp(dt) = ∂_t`, matching `Γ̂^t_xx = −½ ĝ^{tt} ∂_t ĝ_xx = 1`; the sign `+g(X, Y) g.sharp(du)` gives `−∂_t`."
- §12.7: "For the locally Lipschitz metric `−dt² + e^{2|t|} dx²`, `Γ_y(w, w) = (sign(t) e^{2|t|} w_x², 2 sign(t) w_t w_x)` off `t = 0`. Along `s ↦ (0, s)` its values near `((0, s), (0, 1))` approach `(±1, 0)`, whose convex hull contains `0 = −x″`, so the curve is a Filippov geodesic. A definition evaluating `Γ` along the curve fails, since the curve lies in the null set `t = 0`."
- §12.7: "For the same metric, near `w = (1, 0)` the values approach `0`, so `s ↦ (s, x₀)` is a Filippov geodesic with `x″ = 0`."

## Verified sound

| Target | Instances | Roadmap value | Computed or source value | Result |
| --- | --- | --- | --- | --- |
| §1.1 | `x₁y₂ + x₂y₁` on `ℝ²`; `(2,1) ⊕ (1,2)` | `(1,1)`; `(3,3)` | values `−1, +1` on `(e₁∓e₂)/√2`; diagonal reading gives `(0,0)`; barzenleymann2026 Lemma 22, Def. 37, p. 33 | sound |
| §2.1 | `Γ = x dy`, trivial line bundle | `R(∂x,∂y) = 1`; transport `e^{−s}σ₀` | `DΓ(∂x)∂y − DΓ(∂y)∂x = 1`; `∇ = D − Γ` gives `e^{s}`; formula matches barzenleymann2026 (54) | sound; R02 |
| §2.3 | `f = t\|t\|^{1/2}`; `1 + t\|t\|^α`, `\|t\| < ½` | `C^{1,1/2}`, not `C^{1,1}`; Lorentzian | `f′ = (3/2)\|t\|^{1/2}`, ½-Hölder with constant 3/2; `\|t\|^{1+α} < 1` | sound |
| §2.4 | `−dt² + a²dx²`; `e^{2t}(−dt²+dx²)` | Christoffel and conformal formulas | `Γ^t_xx = aa′`, `Γ^x_tx = a′/a`; `ĝ.∇_{∂x}∂x = ∂_t = Γ̂^t_xx ∂_t` | formulas sound; R03 |
| §2.6 | base `±dt²`, `f = cosh t`; Milne | `K = ∓1`; `K = 0` | `−Hess f/(f g(∂t,∂t)) = −1, +1`; barzenleymann2026 Def. 57 p. 60 (pseudo-Riemannian), Lemmas 34–36 pp. 61–62 | sound |
| §3.1 | `s ↦ s³`; empty `a = b` | not regular; not a domain | velocity `0` at `s = 0`; standard analysis, no source needed | sound |
| §5.1 | de Sitter `κ = 1`, `g(γ′,γ′) = −1`; unit `S²`; Minkowski | `J″ = J`; `J″ = −J`; `J = s∂_x` | `sinh s ≠ 0`; `sin π = 0`; minguzzi2019 line 6704 (Prop. 6.3, p. 159) matches | sound; R02 |
| §5.2 | round `S²`; Euclidean `ℝ³`; `σ = [[0,1],[−1,0]]` | `θ′ = −θ² − 1`; `−θ²/2`; `tr σ² = −2` | `−csc²r = −cot²r − 1`; `−2/r²`; `σ² = −I`; minguzzi2019 lines 6787, 6836 (p. 163) | sound |
| §9.1 | future unit hyperboloid, `ℝ^{1,3}` | Gauss `−1`; constraint `0` | `0 − 1`; `−6 + 9 − 3 = 0`; gourgoulhon2007 lines 1044, 1058 (p. 35), 1096, 1108 (p. 36), 1590, 1599 (p. 54) | sound |
| §10.1 | broken curve via `(1, 0.5)`; `q = (1, 2)` | `√3 < 2`; `q ∉ J⁺(0)` | `2√0.75`; `−1 + 4 = 3 > 0`; minguzzi2015convex lines 673 (Thm 6, p. 16), 1000 (Thm 12, p. 24) | sound |
| §10.2 | `(1,1) ≤ (2,1)` in `ℝ^{1+1}` | `(2,1) ∈ I⁺(0)` | `−4 + 1 = −3`; minguzzi2019 lines 1545, 1577 (pp. 36–37); minguzzi2015convex line 831 (p. 20) | sound |
| §10.3 | `ℝ^{1+1} \ {(1,1)}`; broken null curve to `(2,0)` | `(2,2) ∈ closure J⁺(0) \ J⁺(0)`; `(2,0) ∈ I⁺(0)` | only causal curve passes `(1,1)`; chrusciel2011 lines 1042 (p. 24), 1133 (p. 27); convex line 743 (p. 18) | sound |
| §11.1 | Minkowski `0→(2,0)`, `(1,1)`, `(0,1)` | `τ = 2, 0, 0` | `√4`; null; unrelated; minguzzi2019 line 1651 (Thm 2.32, p. 39) | sound |
| §11.3 | `t + x/2`; `t + x`; `t³` | temporal; not time function; not temporal | `v_t + v_x/2 ≥ v_t/2 > 0`; constant on `(s, −s)`; `d(t³) = 0` at `t = 0`; minguzzi2019 line 5912 (pp. 140–141) | sound |
| §12.1 | `A = {t=0, \|x\|≤1}`; `t = x/2` | `edge = {(0,±1)}`; achronal | `(Δ/2, Δ)`: `−Δ²/4 + Δ² > 0`; minguzzi2019 lines 3243 (p. 76), 3466 (p. 81), 2912 (p. 68), 2589 (p. 61), 3289 (p. 77) | sound |
| §12.3 | AdS, `p = (0,0)`, `q = (π+ε, 0)` | not globally hyperbolic | `∫₀^∞ sech r dr = π/2`; slice `t = π/2 + ε/2` lies in the diamond; minguzzi2019 lines 6154 (p. 146), 6235, 6248 (p. 148); chrusciel2011 line 1703 (p. 40) | sound |
| Geroch (stated) | `(ℝ, −dt²)`; `(S¹, −dθ²)`; `t = min(max(x,0),1)` | GH ⇔ Cauchy surface | `{0}` Cauchy; `S¹` not causal, `e^{i tan s}` meets nonempty `S` infinitely often; the graph is Cauchy but not acausal | true; locator R02 |
| Bernal–Sánchez (stated) | Minkowski `t`; `arctan t` | all level sets Cauchy | `dt(v) = v_t > 0`; `arctan t` level `{2} = ∅`, excluded; minguzzi2019 line 6210 (p. 147) | sound |
| Avez–Seifert (stated) | Minkowski `0→(2,0)`; minus `(1,0)` | geodesic of length `τ` | `s ↦ (s,0)`, `L = 2 = τ`; minus a point: sup `2` unattained, not GH | sound |
| GLS (stated) | Minkowski; half space `{t<0}`; Milne | complete + GH ⇒ `C⁰`-inextendible | half space and Milne GH, incomplete, extendible; non-paracompact or non-time-orientable `M′`: reduce to `ι(M) ∪ W` and its time-orientation double cover | sound |
| Sbierski (stated) | `F = ℝ^d`, `d ≥ 1`; `F = 0` | `IsInextendible 0` | sbierski2018 line 551 (Thm 3.1, p. 13, `d ≥ 1`); `F = 0` by §2.7's Check (infinite `a`-length ends) | sound |
| §12.6 determination (stated) | `D = {t≥0}`, `S = {t=0, x≥0}`; `D′ = {x ≥ t ≥ 0}` | `D⁺_D(S) = D′`; `D⁺_{D′}(S) = D′` | past cone meets `t = 0` in `[x−t, x+t]`; one-point curve at `(0,−1)` excluded; last `S`-hit `s₀ < a` (previous R01 repaired) | sound |
| §12.7 | `−dt² + e^{2\|t\|}dx²`, curve `(0, s)` | Filippov geodesic | hull of `(±1, 0)` contains `0`; one-sided pointwise values `(±1, 0) ≠ 0` | definition sound; R03 |
| §13.3 Hawking (R01) | reversed Milne `n = 1`; Minkowski `t` | `H = −1/t₀`, bound `t₀`; `H = 0` | `ν = −∂t`, `∇_{∂x}ν = −∂x/t`, trace `−1/t₀`; `∇∂_t = 0`; scratch theorem elaborates | statable; R01 |
| §13.3 Penrose | round sphere in `ℝ^{1,3}`, `ℓ± = ∂t ± ∂r` | untrapped | `θ± = ±2/r`; null expansions along an embedding are not at the pins | docstring claim accepted |

- Gate: the worker's run at 145033c is OK. My rerun against the default order differs only by `depcheck: NOT IN ORDER: LorentzianGeometry`, which is not a finding. Against the candidate order: `depcheck: 206 roadmaps, 1899 edges, 0 problem(s)`. No change outside the folder.
- Elaboration: `lake env lean` gives 0 errors and 7 `sorry` warnings (lines 146, 298, 306, 317, 342, 352, 421).
- `#check @`: run on all 42 declarations in a scratch copy, 0 errors; every type matches its README statement. The 10 flagged dropped `[FiniteDimensional ℝ E]` binders are harmless: `sigNeg ≤ finrank = 0` (`Signature.lean`:65, 98) makes `IsLorentzian` false in infinite dimension.
- Padding: the probe `first | rfl | infer_instance | simp | trivial | aesop` closes none of the 7 theorems.
- Source locators checked against the cached text: 87 (minguzzi2019 45, barzenleymann2026 7, gourgoulhon2007 7, gallowaylingsbierski2018 7, minguzzi2015convex 7, chruscielgrant2012 6, chrusciel2011 4, sbierski2018 3, luoyu2023 1). Printed pages match except in the Barzen–Leymann Lemma 35 sign (Source issues).
- Library declarations opened at the pins: 48 in Tau Ceti, for example `IsWarpedProduct` (`Riemannian/WarpedProd.lean`:275), `restrictOpenTangentSpace` (`NondegenerateMetric/Restriction.lean`:75), `sharp` (`NondegenerateMetric/Basic.lean`:361), `ricciTensor` (`Curvature/Ricci.lean`:65) and `IsLeviCivitaConnection.contMDiffCovariantDerivative` (`Nondegenerate/Regularity.lean`:221). 4 in Mathlib: `CovariantDerivative` (`Basic.lean`:366), `sigPos`, `sigNeg` and `IsPiecewiseContMDiffOn` (Tau Ceti `PiecewisePath.lean`:73).
- Cross-roadmap citations resolved on main: RiemannianGeometry R1.3 (lines 1013, 1042), R2 (1283), R3 (1511), R4.7 and R5a (2840); HopfRinow Layer 1 (Completed, 264); SmoothBundlesConnections B3.1–B3.3 (871–936), B4.1 (979), B5.0 (1072), B5.2 (1209), scope (106); PDE §1.7 (996); LVF6 (150, 1037); DifferentialGeometry Layers 2–3 (1005, 1253). At its open head: RelativisticQuantumFieldTheory §1.1 (README 309; `Suggested.lean` 63, 69, 79, 84).
- Previous review (14e6374): R01 repaired, lines 2111–2116: "some future causal curve `σ` in `U` on a nontrivial `[a', a]` ends at `q`. As `S` is closed in `U`, `σ⁻¹(S)` is closed", with §12.4's local length bound in *Needs*. R02 repaired (lines 301–321; no `Curvature/WarpedProd*.lean`). R03 repaired (all nine sections now compute, for example line 1257). R05 repaired (lines 344–352). R04 is partly repaired: §2.5, §4.1, §7.3, §9.1, line 1843 and line 2178 are fixed, O'Neill Ch. 14 remains (R02 here), and its §1.2 request is withdrawn, since §1.2's new claims follow from the four Mathlib declarations it cites.
- Overlap check: read RiemannianGeometry (main; open #2222–#2226 drop no cited id), HopfRinow, RicciFlow, RelativisticQuantumFieldTheory, NoncompactQuantumSymmetry and OrthogonalSpinGroups. Owners: flat Minkowski `J^±`, RelativisticQuantumFieldTheory §1.1 (cited in §8.3); hyperboloid, RiemannianGeometry R4.7; warped-product curvature, R1.3; nondegenerate Levi-Civita, Tau Ceti and HopfRinow Layer 1. `O(p,q)` components have no owner (OrthogonalSpinGroups line 762 excludes them). RicciFlow shares nothing. `roadmaps grep` finds global hyperbolicity, Cauchy surfaces, `LorentzianMetric`, trapped surfaces and acoustical metrics only here.

## Not verifiable

- oneill1983, hawkingellis1973, beemehrlicheasley1996, christodoulou2007, kupeli1987 and wald1984 are settled as uncertified. Not checked: O'Neill Ch. 7, Props. 35, 42 and Cor. 43; Hawking–Ellis Lemma 6.3.2, Prop. 6.5.3 and §6.5.
- Not in the manifest and not cached: Geroch 1970, Bernal–Sánchez 2003–2007, Minguzzi 2008, Nomizu–Ozeki 1961, Kobayashi–Nomizu Vol. I, Penrose 1965, Hawking 1967, Filippov 1988, Joyce, Bruveris, Michor–Mumford and LeFloch–Mardare.
- The description's "Annals definitions 50 and 51" names no locatable source. The PhysLean prior-art sentence was not checked.

## Source issues

- **Error** in barzenleymann2026 at Lemma 35 (iii)–(v), p. 62: the source gives warped-product curvature with O'Neill's sign, although its own definition (53), p. 42, uses the opposite convention; with (69) it gives 2-dimensional de Sitter `K = −1`. It should reverse the sign of each formula (e.g. `R(V,X)Y = −(H^f(X,Y)/f)V`); affects a stated result.
