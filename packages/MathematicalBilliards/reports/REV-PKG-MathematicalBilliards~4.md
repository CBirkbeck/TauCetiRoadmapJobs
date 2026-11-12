<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13476#issuecomment-6791853201 -->
Review (claude) of dd8a587

Verdict: needs_changes

1. **F01** (P3) §10.5: the route uses the universal cover and a developing map that no *Needs:* line, contract or layer dependency names

   **Location.** `packages/MathematicalBilliards/README.md` line 778 (§10.5): "Route: after forgetting the marked points the translation atlas is complete, so the developing map of the universal cover is an isometry onto `ℂ` and the deck group is a lattice of translations. *Needs:* §10.2, §10.4."

   **Claim.** The route's inputs are §10.2 and §10.4.

   **Witness.** The route uses a universal cover, its deck group, and "a complete local isometry is a covering". None is in the *Needs:* line, in "From Tau Ceti" (lines 58–67) or in the Layer 10 dependencies (line 792, "Mathlib manifolds."). The cover exists at the pin: `TauCeti.UniversalCover`, `TauCeti/AlgebraicTopology/UniversalCover/Basic.lean` line 70; the covering step has no named owner.

   **Repair.** Replace the route sentence of §10.5 (from "Route: after forgetting" to "lattice of translations.") by a route that uses only what the *Needs:* line already lists, and leave the *Needs:* line as it is:

   > Route: after forgetting the marked points (their cone charts have `k = 1` and are translation charts) `Σ = ∅`, so by §10.4 every directional flow is defined for all time on `X`. Put `ψ_0 = id` and `ψ_z = φ_{z/|z|}^{|z|}` for `z ≠ 0`. By compactness there is `r > 0` such that every point is the centre of a translation chart onto a disc of radius `r`; in that chart `ψ_w` is `u ↦ u + w` for `|w| < r`, so `ψ_z ∘ ψ_w = ψ_{z+w} = ψ_w ∘ ψ_z` whenever `|z| + |w| < r`. For arbitrary `z`, `w` choose `n` with `|z| + |w| < nr`; then `ψ_z = (ψ_{z/n})^n` by the group law of one directional flow, the small maps commute, and `ψ_z ∘ ψ_w = (ψ_{z/n} ∘ ψ_{w/n})^n = ψ_{z+w}`. So `ψ` is a continuous action of the group `ℂ` on `X` whose orbit maps `z ↦ ψ_z x` are local homeomorphisms: the orbits are open and `X` is connected, so there is one orbit; the stabiliser `Λ` is the same at every point, because the group is abelian, and meets `|z| < r` only in `0`, so it is discrete; and `z ↦ ψ_z x` descends to a continuous open bijection `ℂ/Λ → X`, a homeomorphism that is a translation in charts and carries `z ↦ z + tθ` to `φ_θ^t`. Since `X` is compact, `ℂ/Λ` is compact, so `Λ` is a lattice.

   Tested on the instance the original route needed outside inputs for: `X = ℂ/(ℤ + iℤ)` with the marked point `0`. Forgetting the point gives `Σ = ∅`; `r = 1/2`; `ψ_z[x] = [x + z]`; the orbit of `[0]` is `X`; the stabiliser is `{z : [z] = [0]} = ℤ + iℤ`, discrete, meeting `|z| < 1/2` only in `0`; `ℂ/Λ → X` is the identity, and `ψ_{tθ} = φ_θ^t`. With `z = 3 + 2i`, `w = −1 + i`, `n = 12`: `|z| + |w| ≈ 5.02 < 6 = nr`, and `ψ_zψ_w[x] = [x + 2 + 3i] = ψ_{z+w}[x]`. No universal cover, deck group or covering criterion is used. The three Checks of §10.5 are unchanged (area `4` for `2ℤ + 2iℤ`; closed leaves of length `1` for `θ = 1`; the marked torus).

One finding, P3, a local repair to `packages/MathematicalBilliards/README.md` (§10.5). The three findings of the previous review are repaired. `Suggested.lean`, `metadata.toml` and `sources.toml` need no change: the acceptance test elaborates with `sorry` as its only warning, no declaration is padding, every pinned name and every supplier citation resolves, and the dependency check reports no problem.

## Previous findings, one by one

| Id (round 3) | Status | Repaired passage (quoted) | Check made now |
|---|---|---|---|
| F01 (P2) equal irrational rotation numbers had no route | repaired | README line 426: "with strict inequality when `ρ(C₁)` or `ρ(C₂)` is irrational"; line 430: "If the translation number `α` of `g₁` is irrational, the translation number of `g₂` is larger than `α`" | Proof recomputed: `ε = min(g₂ − g₁) > 0`; `0 < p − qα < ε`; `τ(g₁^q) = qα > p − ε` so some `x` has `g₁^q x > x + p − ε`; induction `g₂^{n+1}x ≥ g₂(g₁^n x) ≥ g₁^{n+1}x + ε`; `p ≤ qτ(g₂)`. Instance `α = √2/2`, `ε = 1/10`, `q = 7`, `p = 5`: `5 − 4.9497 = 0.0503`, bound `5/7 = 0.714 > 0.707`. `β` case: `q = 10`, `p = 7`, `7.0711 − 7 = 0.0711 < 0.1`, bound `0.7 < 0.7071`. Negative control: `x + sin(2πx)/20 − 1/50 < x + sin(2πx)/20`, derivative `≥ 1 − π/10 = 0.686`, both translation numbers `0`. The five pinned lemmas exist (lines below). Herman1983 line 285 is 2.4.3 on printed p. 10. |
| F02 (P3) the region of §5.3 omitted the boundary circle | repaired | README line 411: "and to `U`, the union of the lower boundary circle `AddCircle ℓ × {a}` with the lower component of §5.1" | `C = {y = c}`: `U = AddCircle ℓ × [a, c)`, open in `AddCircle ℓ × [a, b)`, closure `U ∪ C`, frontier `C`. An open relatively compact `U ≅ T¹ × [0, 1)` must contain the boundary circle (its manifold boundary is open and closed in the connected boundary circle), which the new `U` does. Herman1983 lines 1150–1154 ask exactly: open, relatively compact, homeomorphic to `T¹ × [0, 1[`, invariant, in the non-wandering set. |
| F03 (P3) "pullback by a chart", no API for the flat area | repaired | README line 743: "the image under `φ` of the restriction of `area_X` to the source of `φ` is Lebesgue measure restricted to the target of `φ`"; lines 747–750 the four API bullets | Cone disc: `∫₀^r 2πρ · ρ^{2(k−1)} dρ = πr^{2k}/k`; `k = 1`: `πr²`; octagon `k = 3`, `r = (3ρ)^{1/3}`: `π·9ρ²/3 = 3πρ²`, equal to cone angle `6π` times `ρ²/2` and to `8 · (3π/4)ρ²/2`. Four unit squares: `4`. §11.4: copies `gP` and `gσ_S P` meet along `g(S)` and `gσ_S(S) = g(S) + g(σ_S a − a)`, a translation; `area(gP) = area P`; unit square `4 · 1 = 4`, `π/8` triangle `16 · tan(π/8)/2 = 3.314`. |

Repaired patterns searched in the rest of the package. A route with a case left out: §5.5, §6.3, §6.4, §9.2 and §12.5 recomputed case by case (table), none found. A theorem applied to an object outside its hypotheses: §5.2 against §5.3, §4.4 against §5.3, I5.4 against §6.4, GeometricTopology §2.3 against §5.3: none found. A measure moved in the wrong direction: every "image of" and "carries" in §3.3, §7.2, §10.3, §11.4 goes from source to target. A definition without API: none. A route input with no named owner: R01.

## Verified sound

**Files read.** All of `README.md` (965 lines, 12 layers, 52 target sections, 23 `API:` lists, 52 `**Checks.**` lists), `Suggested.lean` (295 lines, 16 named declarations, one proved `example`), `metadata.toml`, `sources.toml` (12 entries, one key per work, every work of the References recorded, no local path), the previous review, its repair report and the diff of the repair (27 README lines).

**Principles.** No route-specific shortcut (curvature may vanish, holes allowed, no separability, no topology on the space in Layer 12, `k ≥ 1` wherever the proof allows); no re-planned roadmap (C3.1's smooth map is imported and compared in §2.5; no statement of C3.1 is restated); one direction of supply; no copied passage; no algorithm; no sorry'd data; no `set_option`. Layer titles name mathematics; Layers 1–6 and 7–11 are independent and each chain is forced by its *Needs:* lines.

**Elaboration.** `lake env lean` on `packages/MathematicalBilliards/Suggested.lean` from the content checkout: exit 0; seven `declaration uses sorry` warnings (lines 154, 193, 209, 235, 257, 268, 287) and nothing else. Header: `module`, `import Mathlib`, one `TauCeti.*` module, used by `exists_tendsto_twistedAverage`; 69 of the 200 `Suggested.lean` files on main begin with `module`.

**Binders.** `#check @name` for all 16 declarations in one scratch file, elaborated once, each type compared with its README statement: `[Fact (0 < ℓ)]` on every table declaration and on `phaseMeasure`; `2 ≤ k` on the two `k ≥ 2` theorems and absent from `exists_two_periodic_orbits` (README: `k ≥ 1`); `0 < ℓ`, `a < b`, the lift relation, the twist disjunction, non-wandering on the open annulus and `C` in the open annulus on the graph theorem; `0 < p`, `p < q`, `p.Coprime q`; `[CompleteSpace H]`, `U.IsUnitary`; `[IsFiniteMeasure σ]`; `[MeasurableVAdd₂ ℝ X]`, `[IsProbabilityMeasure μ]`, `[VAddInvariantMeasure ℝ X μ]`. Nothing lost, nothing changed; README and Lean generality agree.

**Padding probe.** Every sorried theorem (7 of 7) tried on a scratch copy with `first | rfl | (simp; done) | infer_instance | (intros; simp_all; done) | exact?`: all seven fail (errors at the seven theorem bodies only). None restates a definition, mirrors a Check, computes a value or treats a boundary case. The proved `example` (the unit circle inhabits `ConvexTable ⊤ (2π)`) pins the orientation of the carrier and shows its hypotheses are satisfiable.

**Headlines.** From the Summary: invariance of `sin δ dδ ds` (§3.3, stated); Birkhoff's graph theorem (§5.3, stated, with its Lipschitz billiard form); two Birkhoff orbits (§6.4, stated); measure preservation and reversibility of the polygonal flow (§8.3, named in the module docstring: no carrier for the flow); the unfolding theorem (§11.4, named); the eigenfunction criterion (§12.5, stated). Also stated: Wiener's lemma (§12.4), the mean ergodic projection (§12.4.1). Named with reasons: non-ergodicity of rational tables, the genus formula. All 16 Lean names occur in README line 92; every backticked name of this roadmap's own is declared (the six `ConvexTable.*` leads of the citation resolver are declarations of `Suggested.lean`). No name is shared with a readable roadmap.

**Adversarial table** (sampled targets, headlines, repaired passages, the finding; values computed in this round).

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| §1.1 carrier | circle `R`; clockwise circle; unit circle with `ℓ = 4π`; circle–ellipse | `R(1 − cos((t−s)/R))`, `2R` at `πR`; `−2R`; `1 − cos 2π = 0` so a double period is rejected; ellipse `x² + 4y² = 1` curvature `a/b² = 4` against `1` | sound |
| §1.2 criterion | `exp(2iu) + exp(iu)`; ellipse | `Im(conj γ′ γ″) = 9 + 6cos u ≥ 3`, turning `4π`; `h″(s) = τ × iκτ = κ` | sound |
| §1.3 exit points | unit circle `δ = π/2`, `π/3`; ellipse `(2cos u, sin u)` from `(2, 0)`, `δ = π/2`; superellipse flat point | cross product `cos δ − cos(u − δ) ≥ 0` iff `u ≥ 2δ`: `s₁ = π`, `2π/3`; `e = i·i = −1`, exit `(−2, 0)`; `x⁴ = δx`, `x = δ^{1/3}` | sound |
| §1.4 oriented lines | unit circle `(0, π/2)`; reversal | `e = −1`, `c = Im(−1) = 0`; `(−e) × z = −c` same set; `−e = exp(i(π − δ₁))τ(s₁)`, the state `I(T(s, δ))` | sound |
| §2.1 lift and map | circle; `δ = 0`, `π`, `(π, 2π)`; wrong outgoing angle | set `[s + 2δ, s + 2π)`, `⟨e, τ₁⟩ = cos δ`; `δ = 0`: set `(s, s + ℓ)`, `s₁ = s`, `δ₁ = 0`; `δ = π`: `sInf ∅ = 0`; `(π, 2π)`: set `(s, s₁′]`, infimum `s`; `τ₁² conj e = exp(iδ₁)τ₁`; wrong convention squared `(s + 2Rδ + 2R(π − δ), δ) = (s + ℓ, δ)` | sound |
| §2.2 regularity | general; circle; circle–ellipse | `∂_sΦ = sin δ − κL`, `∂_{s₁}Φ = sin δ₁`, `∂_δΦ = −L`; `(2sin δ − sin δ)/sin δ = 1`; `2·1 − 1 = 1`, `2·4 − 1 = 7` | sound |
| §2.4 time reversal | circle | `I F I(s, δ) = (s + ℓ − 2Rδ, δ) = τ_ℓ F⁻¹` | sound |
| §2.5 comparison with C3.1 | circle; `δ = π/2`, `2π/3`, `π/3`, `π√2/2`; signs | `(s + 2Rδ, cos δ)` on both sides; increments `ℓ/2`, `2ℓ/3`, `ℓ/3`, `(√2/2)ℓ`; `3 · 2R sin(π/3) = 3√3R`; C3.1 `S = −‖χ(t) − χ(s)‖`, `v = ∂_sS = cos δ`, `w = −∂_tS = cos δ₁`, `∂_s∂_tS < 0`; `sin δ dδ ↦ dv` | sound |
| §3.2–3.3 Jacobian, `ConvexTable.measurePreserving_billiardMap` | circle; ellipse at `(2, 0)`, `δ = π/4`; total map off `A` | `det = 1`; `5a²/4 = a`, `a = 4/5`, exit `(6/5, 4/5)`, `L = 4√2/5`, `τ₁ = (−8, 3)/√73`, `cos δ₁ = 11/√146`, `sin δ₁ = 5/√146`, `det = √73/5 = 1.709`, `sin δ₁ · det = 1/√2`; `μ(f⁻¹E) = μ(T⁻¹(E ∩ A)) = μ(E)`; `(0, 5π/2) ↦ (π, π/2)` | sound |
| §4.1–4.2 twist lifts, exactness | shear; standard map; shifted shear; `(x + log y, y)` | `h = (X − x)²/2`, `−∂₁h = ∂₂h = 1` at `(1, 2)`; `Y dX − y dx = ε sin(2πx) dx + d(Y²/2)`, `det = 1`; flux `c`; conjugate by `1/y`: `(x − log y, y)` | sound |
| §4.3 billiard twist | circle; general | `g = −cos δ`, `∂_δg = sin δ = ρ`; `g(F)dF₁ − g ds = −cos δ₁ ds₁ + cos δ ds = −dL`; `∂s₁/∂y = 2R/sin δ`, `∂s₁/∂v = −2R/sin δ`; `∂_δS = −2R cos δ = g(F) · 2R`, `∂_sS = −cos δ + cos δ = 0` | sound |
| §4.4 non-wandering set | `(x, y²)` on `AddCircle 1 × [0, 1]`; `x + 1` on `ℝ`; `f` against `f⁻¹`; billiard `T̄` | `(y + ε)² < y − ε` for small `ε` when `0 < y < 1`, boundary fixed; `(U + n) ∩ U = ∅`; `fⁿU ∩ U ≠ ∅ ⇔ U ∩ f⁻ⁿU ≠ ∅`; `μ_A(U) > 0` gives a return, boundary points fixed | sound |
| §5.1 rotational curves | `δ = c`; small circle; two circles; piecewise linear `h` | degree `±1`; null-homotopic; not injective; `h(−1/2) = h(1/2) = 1/2`, `h(0) = 0`, `(0, −1/2) ↦ (0, 1/2)` | sound |
| §5.3 `isGraph_of_isRotationalInvariantCurve`, Lipschitz forms | `C = {y = c}`; shear on `AddCircle 1 × [0, 1]`; circle | `U = AddCircle ℓ × [a, c)`; shear preserves Lebesgue, `C = {y = 1/2}` satisfies every hypothesis (not vacuous); slopes `±1/(2R)` against `0`; `∂_y(F⁻¹)₁ = −∂_yF₁/det < 0` | sound |
| §5.4 rotation numbers | circle `π/3`, `π/2`, `2π/3`; irrational pairs; rational pair; time reversal | `1/3`, `1/2`, `2/3`; values in the F01 row; `F₁(x, π − ψ(x)) = ℓ + g⁻¹(x)`, `1 − ρ` | sound |
| §5.5 rational curves | two fixed points with `(δ_{x₁} + δ_{x₂})/2` | invariant, support two points, other points not periodic | sound |
| §5.6 circular table | invariant graph `ψ` with `ψ ∘ g = ψ`, `g(s) = s + 2Rψ(s)`; perturbed curve | irrational `ρ`: `ψ` constant on the minimal set, which is invariant under an irrational rotation, hence everything; rational: periodic points have `ψ = πp/q` and every orbit accumulates on them; `cos(2(c + ε)) ≠ 1` for `0 < c + ε < π`; `μ_A(δ < π/2) = ℓ` | sound |
| §6.1–6.3 configurations, maximal orbit | `(2, 3)`, `(1, 4)`, collapsed `(1, 3)`; run end | gaps `4π/3`, `W = 3√3`; `4√2` against `8` for the doubled diameter (type `(2, 4)`); `(q − p)·pℓ/q + p·(q − p)ℓ/q = 4ℓ/3`; rates `1 ± cos δ > 0` | sound |
| §6.2 chain dictionary, `IsPeriodicConfiguration` | equilateral `(1, 3)`; `(0, π/2, π)`; collapsed; `s_j = jπ√2`, `p = q = 0`; `q = 2` | `u₋₁ = (√3 + i)/2`, `u₀ = (−√3 + i)/2`, both components `1/2`; `0` against `1/√2`; `0⁻¹ • 0 = 0`, law `0 = 0`; gaps `4.44 < 2π`, components `cos(π/√2)`; `u₁ = −u₀` forces `⟨u₀, τ⟩ = 0`; `∂W/∂s_j = ⟨u_{j−1}, τ⟩ − ⟨u_j, τ⟩`; least period: `q/m` divides `gcd(p, q)` | sound |
| §6.4 `ConvexTable.exists_two_periodic_orbits` | circle; ellipse `(1, 2)` | `s′_j = c + jpℓ/q` is related to `s` iff `c ∈ (ℓ/q)ℤ`, so `c ∈ (0, ℓ/q)` gives a second orbit; `W = 8` and `4`; cup length `1` gives `2` rest points | sound |
| §7.1–7.3 polygonal tables | unit square; square with hole; sides `d = 1`, `i`, `exp(iπ/4)`; corners `π/2`, `2π/3`, `3π/2` | `2π`; `4·π/2 + 4·3π/2 = 8π = (8 − 2 + 2)π`; `conj v`, `−conj v` (`exp(iπ/4) ↦ exp(3iπ/4)`), `σ(1) = i`; `d² conj(d² conj v) = v`; `μ_P = 1/4`; `⌈π/α⌉ = 2, 2, 1` | sound |
| §8.1–8.3 singular set, flow | square states; `v_n` towards `(n, n)` | `y − x = −1/4 ∉ ℤ` regular; `(1/2, 1/2)` diagonal singular; limit direction regular, so `Σ` not closed; `((1/2, 1/2), 1)` at times `1/2`, `1`, `2`: `(1, 1/2)`, direction `−1`, back | sound |
| §9.1–9.3 rational tables | square, equilateral, `π/8`, L, rotated hole; `f = Re((conj d · v)^N)` | orders `4`, `6`, `16`, `4`, infinite; `conj d · σ_S v = ζ² conj(conj d · v)` with `ζ^{2N} = 1`; `N = 1`: `Re v ↦ −Re v` | sound |
| §10.1–10.2 groupoid, surfaces | `z + 3i`, `2z`, `conj z`, `−z`, two half-planes; octagon | derivatives `1`, `2`, none, `−1`; images `{Re < 0}`, `{Re > 1}` disjoint; `8 · 3π/4 = 6π`, `k = 3`, `2g − 2 = 2` | sound |
| §10.3 flat area | values in the F03 row; atom at a cone point | excluded by `area(Σ) = 0` | sound |
| §10.4 directional flows | `ℂ/(ℤ + iℤ)`, `θ = exp(iπ/4)`, slope `√2`; rotated atlas | `√2 · (1 + i)/√2 = 1 + i ≡ 0`; irrational slope; `ψ = exp(iα)φ`: `φ ↦ φ + tθ` is `ψ ↦ ψ + t exp(iα)θ` | sound |
| §10.5 flat tori | `ℂ/(ℤ + iℤ)` with a marked point | values under R01 | R01 |
| §11.1–11.3 surface, cone angles, genus | square, equilateral, `π/8`, L, hole; side chart | classes `4/4`, `6/6`, `16/4, 16/16, 16/16`; `gσ_S x + g(x₀ − σ_S x₀) = g(σ_S(x − x₀) + x₀) = gx` on `S`; `2n_v · πm_v/n_v = 2πm_v`; `χ = 0, 0, −2, −2, −8`; `Σ(k − 1) = 2` and `8` | sound |
| §11.4 unfolding | well-definedness; `θ = exp(iπ/6)`, `θ = 1`; singular states | `σ_S gθ ↦ [(σ_S g)⁻¹, x] = [g⁻¹σ_S, x] ∼ [g⁻¹, x]`; `conj θ ≠ θ`, `−conj θ ≠ θ`; `conj 1 = 1`; on `Σ` both flows are the identity, so the conjugacy holds there too; areas in the F03 row | sound |
| §12.1–12.3 weak mixing, Koopman group | two points; half-torus; one point; counting measure on `ℝ` | `|1/2 − 1/4| = 1/4`; `2∫₀^{1/2}|u − 1/4| du = 1/8`, signed average `0`; `i − i = 0` against `−2i`; `‖1_{−t} − 1_{0}‖ = √2`; averages: `‖U_tf_h − f_h‖ ≤ 2|t|‖f‖/h` | sound |
| §12.4 `tendsto_average_norm_charFun_sq` | `δ₀`, `(δ₀ + δ₁)/2`, uniform on `[0, 1]` | `1`; `(1 + cos t)/2 → 1/2 = 1/4 + 1/4`; `(2 − 2cos t)/t²`, `4/π²` at `π`, average `→ 0` | sound |
| §12.4.1 `exists_tendsto_twistedAverage` | `e₁` on `AddCircle 1`; identity group; eigenvector `v` | `⟨e₁, U_te₁⟩ = exp(2πit) = charFun δ_{2π}(t)`, `A_T¹e₁ = e₁`, `A_N⁰e₁ = 0`; `(1 − exp(−2πiaT))/(2πiaT) → 0`; `σ = ‖v‖²δ_{2πa}`, `‖w‖² = ‖v‖²`; `‖A_T^a v‖² = ∫|K_T(ξ − 2πa)|² dσ` | sound |
| §12.5 `isWeaklyMixing_iff` | one point; `a ≠ 0`; `a = 0`; mixed correlations | every `f` constant; `c = exp(2πiat)c` forces `c = 0`; `⟨1, P₀f⟩ = ⟨1, f⟩ = 0`; `|⟨g, U_tf⟩|² ≤ ¼ Σ_k |⟨h_k, U_th_k⟩|²` for `h_k = f + i^k g`; almost invariant `A` gives the constant `μ(A) − μ(A)²` | sound |
| §12.6 tori and rational tables | square; equilateral triangle; tables with holes | `Re(v²)` invariant; all `m_v = 1` gives `χ = 0`; a hole has reflex angles, so the `π/n` case has `h = 0` | sound |

Conventions recomputed: all fifteen witnesses of the Conventions section (for instance `1 × i = 1`; `∂_sL = −cos δ = y`; `∂s₁/∂v = −2R/sin δ`; `μ_A(δ < π/2) = ℓ`; the half-torus average `1/8`).

**Seeded source sample.** No locator is flagged unverified by the author.

| Target | Locator read | Outcome |
|---|---|---|
| 1.4 | BialyMironov2022 lines 154–157 and 172–176 (Section 2, p. 4) | the phase cylinder as the space of oriented lines meeting the curve; coordinates `(p, φ)` on oriented lines. Supports the statement. |
| 2.1 | BialyMironov2022 lines 154–161 (p. 4) | coordinates `(cos δ, s)`, `δ ∈ (0, π)`, for curves of positive curvature (line 149), as the README says. |
| 2.5 | BialyMironov2022 lines 159–164 (p. 4) | `cos δ` as the momentum variable; boundaries `cos δ = ±1`. |
| 4.4 | Herman1983 lines 425–432 (3.4.3) and 434–438 (3.4.4) | the non-wandering set and its use; recurrence from an invariant measure of full support. |
| 5.1 | BialyMironov2022 lines 103–104 (Theorem 1.1, p. 3) | "rotational" means simple and winding once around the cylinder. |
| 10.4 | ChaikaForni2026 lines 83–88 (Section 1, p. 3) | the circle of flows of a translation surface and the Lebesgue measure they preserve. |
| 12.4 | Hochman2012 lines 3099–3140 (Proposition 6.6.3, printed p. 70) | the atomless discrete computation, with the kernel `((zy)^N − 1)/(N(zy − 1))`. |
| 12.4.1 | Hochman2012 lines 3076–3096 (Lemma 6.6.2, printed p. 69) | twisted discrete averages tending to `0` when the spectral measure has no atom at the eigenvalue. |
| 1.3, 5.6 | Tabachnikov2005, Chapter 3 | waived, no text; recomputed (table). |
| 4.3, 6.2 | KatokHasselblatt1995, Sections 9.2–9.3 | waived, no text; recomputed (table). |
| 7.2 | ChernovMarkarian2006, Chapter 2; BoldrighiniKeaneMarchetti1978, §2 | waived, no text; recomputed (table). |
| 11.2, 11.4 | MasurTabachnikov2002, §1; KerckhoffMasurSmillie1986, Theorem 1 | uncertified and waived, no text; recomputed on five tables. |

Also read for the repairs and spot checks: Herman1983 lines 149–155 (1.2, printed p. 5), 188–196 (2.2), 268–319 (2.4.1–2.4.4, printed pp. 10–11), 762–769 (4.3, Remarque), 803–807 (5.2), 1128–1154 (Appendice §2 and the Théorème de Birkhoff, printed pp. 40–41); BialyMironov2022 lines 96–119, 149–185, 255–265; ChaikaForni2026 lines 9–28, 89–100, 168–176; Hochman2012 lines 2439, 2474–2487, 2627, 2854–2855, 3012–3073. Sections, theorem numbers and printed pages agree with the README's.

**Pinned declarations opened** (the pins of the content checkout; paths relative to each library, line of the declaration).

- `Mathlib/Dynamics/Circle/RotationNumber/TranslationNumber.lean`: `CircleDeg1Lift` 129, `translationNumber_units_inv` 638, `translationNumber_pow` 643, `tendsto_translationNumber` 685, `translationNumber_mono` 695, `translationNumber_le_of_le_add` 704, `le_translationNumber_of_add_le` 707, `translationNumber_le_of_le_add_int` 710, `le_translationNumber_of_add_int_le` 718, `translationNumber_eq_rat_iff` 820. Its only strict statements (777, 787) need a uniform strict bound `f x < x + z`; none compares two lifts, so the new API bullet of §5.4 duplicates nothing.
- `Mathlib/MeasureTheory/Integral/IntervalIntegral/Periodic.lean` 69, 91; `Analysis/SpecialFunctions/Complex/Circle.lean` 421; `Topology/Instances/AddCircle/Defs.lean` 306; `MeasureTheory/Function/Jacobian.lean` 1184; `Dynamics/Ergodic/Conservative.lean` 63, 196; `Dynamics/Ergodic/Action/Basic.lean` 31 (sets almost invariant under every translate are null or conull); `MeasureTheory/Group/Arithmetic.lean` 456; `MeasureTheory/Group/Defs.lean` 51; `MeasureTheory/Group/Action.lean` 178 (`to_additive`); `Dynamics/Flow.lean` 85; `Analysis/Calculus/ImplicitContDiff.lean` 83, 91 (namespace `ContDiffAt`, lines 50–101); `Analysis/Convex/Strict.lean` 37; `Topology/Homotopy/Contractible.lean` 29; `Geometry/Polygon/Basic.lean` 29, 62, 72; `Geometry/Manifold/StructureGroupoid.lean` 90, 275, 293; `HasGroupoid.lean` 34, 93; `ChartedSpace.lean` 141; `IsManifold/Basic.lean` 673; `GroupTheory/SpecificGroups/Dihedral.lean` 31; `MeasureTheory/Function/LpSpace/Basic.lean` 595, 606, 611, 615, 631; `Analysis/InnerProductSpace/Projection/Basic.lean` 120; `Analysis/InnerProductSpace/Basic.lean` 107; `MeasureTheory/Measure/CharacteristicFunction/Basic.lean` 130, 134; `Analysis/InnerProductSpace/PiL2.lean` 853; `Analysis/InnerProductSpace/MeanErgodic.lean` 89.
- `TauCeti/Geometry/Polygon/Simple.lean` 109, 483, 614, 767; `Topology/JordanCurve/Basic.lean` 107, 282; `Analysis/Complex/PlaneSeparation/Inside.lean` 190; `JordanCurve.lean` 175; `Analysis/Complex/Conformal/Jordan/Schoenflies.lean` 122; `PrimeEnd/Crosscut/TwoSides.lean` 137; `Analysis/Bochner/CharFun/Bochner.lean` 101; `Analysis/Semigroups/Group/Basic.lean` 74 (real-linear operators, `U 0 = id`, `U (s + t) = U s ∘ U t`, continuity of orbits at `0`; no completeness); `Unitary.lean` 107, 154; `Probability/Ergodic/MeanErgodic.lean` 43; `AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean` 123; `MayerVietoris.lean` 93; `AlgebraicTopology/UniversalCover/Basic.lean` 70 (for R01).

Searched by object in both pinned libraries: non-wandering sets, weak mixing, billiards, translation surfaces: no file mentions them. No target of this roadmap is proved at the pin.

**Cross-roadmap citations resolved now** (main at `d2e9ef2`, or the open head for the one roadmap not on main).

- `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md`: C3.1 heading 471; "Convex planar billiards" 527 (coordinates `(s, v)`, `S = −‖χ(t) − χ(s)‖`, `v = ∂_sS`, `w = −∂_tS`, `∂_s∂_tS < 0`, the measure of mass `2L`); `exists_billiard_periodic_reflection` 573 with the hypotheses the contract quotes; circle formula 575; the doubled diameter for `N = 4`; "Finite-volume recurrence" 583.
- `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md`: I5.0 426 (`y = −∂₁S`, `Y = ∂₂S` at 434); I5.4 623 (continuity 674–678, cup-length bound 678–680).
- `TauCetiRoadmap/RiemannianGeometry/Surfaces/README.md`: §3.1 471, `integral_signedCurvature_add_sum_exteriorAngle_eq_two_pi` 489.
- `TauCetiRoadmap/GeometricTopology/README.md`: §1.7 1049 (genus `(2 − χ − b)/2`, 1068–1069); §2.3 1386 (`n + 1 ≤ 3` by Schoenflies, 1392).
- `TauCetiRoadmap/FactorRigidity/README.md`: §8.2 746 (kept-variant comparison).
- ProbabilisticAndMetricNumberTheory at its open head (a new roadmap folder; line 62 of the merge order, this roadmap at line 404): §4.6 at 5508, §4.9a at 6320, the strong-continuity statement at 6364 (kept-variant comparison, not a supplier).

**Ownership and duplication.** The board package index lists three packages, none on this subject. Searched by object across main and the indexed open heads: billiards (only C3.1 on main, cited); translation surfaces, flat structures, cone angles (one worked example in UnboundedOperators; the hits in TeichmullerGeometry are quadratic differentials in Teichmüller's theorem, with no match there for translation surfaces or directional flows); non-wandering sets, Wiener's lemma, the Katok–Zemlyakov surface (no match); weak mixing (only FactorRigidity §8.2, cited as a different notion); mean ergodic theorems (single maps only: `Completed/Exchangeability`, which Equidistribution cites); Koopman strong continuity (ProbabilisticAndMetricNumberTheory §4.9a, cited as the continuous-action variant); rotation and translation numbers (HypergeometricMotives uses the words for a different object). §12.3's jointly measurable case and §12.4.1 have no other owner. The overlap report lists no changing pull request, no dropped id and no revision-only id; the five closest roadmaps own none of this roadmap's objects.

**Supplier order.** No supplier gap is declared (`design/plan.json` has `gaps = []`) and none is needed. Output of the dependency check:

```text
depcheck: 237 roadmaps, 2139 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. No roadmap of the never-cite list is cited.

**Shape and style.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, twelve layers each ending with Examples and Dependencies, Downstream consumers, References. Every definition has an API list and at least three Checks; every theorem its hypotheses and a locator. No LaTeX delimiters, no process words, no pull-request numbers, no machine paths, no `lemma`, no target tables, no `set_option`, `#eval` or `True` placeholder.

Remarks that need no change. The hypothesis `2 ≤ k` of §3.3 is what the route (a `C¹` map and its Jacobian) uses; whether the invariance survives at `k = 1` is not claimed and no instance was computed. In §10.4 the sentence on rotating the atlas is read as: the flow `φ_θ` of the original structure is the flow `φ_{exp(iα)θ}` of the rotated one, which is what the computation gives.

## Not verifiable

- `Tabachnikov2005` (Chapters 3, 7), `KatokHasselblatt1995` (§§9.2–9.3, Chapter 13), `ChernovMarkarian2006` (Chapter 2), `BoldrighiniKeaneMarchetti1978` (§2), `ZemlyakovKatok1975` (pp. 291–300), `KerckhoffMasurSmillie1986` (Theorem 1): settled as waived, no text. The sampled statements resting on them (1.3, 4.3, 5.6, 6.2, 7.2, 11.4) were recomputed, not checked against wording or numbering.
- `MasurTabachnikov2002` (§1): settled as uncertified, no text; 11.2 and 11.4 were recomputed.
- `Birkhoff1927` (§§1–3): the cached file for this key holds a blocked-request page of five lines, not the article, as the manifest's `version_note` says; cited as background only, by its locator.
- Ownership against open pull requests was checked through the indexed heads only; a pull request outside that index was not sought.

## Source issues

- **Misprint** in Hochman2012 at Section 6.6, the example before Theorem 6.6.1, printed p. 68 (Hochman2012 line 3019): the source says the operator `U` preserves the norm, for the multiplication operator it has just named `M`; it should be `M`; affects nothing.
- **Misprint** in Hochman2012 at Theorem 6.6.1, proof sketch, printed p. 68 (Hochman2012 line 3029): the source says the Fourier transform of the spectral measure takes real values; it should be complex valued; affects nothing.
- **Gap** in Hochman2012 at Theorem 6.6.1, proof sketch, printed p. 69 (Hochman2012 lines 3065–3073): the source says polynomials in nonnegative powers of `z` are dense in the `L²` space of the spectral measure; it should use Laurent polynomials, since for Haar measure `z⁻¹` is orthogonal to them; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "dd8a587942bd059b4010e787350e36f938c44ab2", "job": "REV-PKG-MathematicalBilliards~4", "model": "fable", "worker": "chris-x10"} -->
