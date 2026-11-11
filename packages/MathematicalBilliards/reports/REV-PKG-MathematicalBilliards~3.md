<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13476#issuecomment-6791092462 -->
Review (claude) of c9fc8c9

Verdict: needs_changes

1. **F01** (P2) Strict monotonicity of the rotation number: the case of equal irrational rotation numbers has no route and no owner

   **Location.** `packages/MathematicalBilliards/README.md` line 425 (§5.4): "strictness by Herman's region argument when both rotation numbers equal `p/q`: two vertical segments and arcs of `C₁` and `C₂` bound a disc …".

   **Claim.** The route proves `ρ(C₁) < ρ(C₂)` for `ψ₁ < ψ₂` under the `C¹` twist and the invariant density.

   **Witness.** Equality `ρ(C₁) = ρ(C₂) = α ∉ ℚ` is not treated. Herman1983 line 285 (2.4.3, printed p. 10) settles it by an external result; pinned `Mathlib/Dynamics/Circle/RotationNumber/TranslationNumber.lean` has `translationNumber_mono` (line 695), no strict form.

   **Repair.** In §5.4:

   1. Add to the `API:` list: "Strictness at irrational values: if `g₁ < g₂` pointwise are continuous lifts and the translation number `α` of `g₁` is irrational, then the translation number of `g₂` is larger (Herman1983, Chapitre I, 2.4.3, printed p. 10, line 285, where it is quoted from Herman's earlier memoir). Route: `ε = min(g₂ − g₁) > 0` by periodicity; choose integers `q ≥ 1`, `p` with `0 < p − qα < ε`; since `q`-th iterate of `g₁` has translation number `qα > p − ε`, `CircleDeg1Lift.translationNumber_le_of_le_add` gives an `x` with `g₁^q(x) > x + p − ε`; monotonicity gives `g₂^q(x) ≥ g₁^q(x) + ε > x + p`, so the translation number of `g₂` is at least `p/q > α`. The symmetric statement holds when the translation number of `g₂` is irrational."
   2. In the main sentence replace "(Herman1983, Chapitre I, 2.4.2 and 2.4.4, …" by "(Herman1983, Chapitre I, 2.4.2–2.4.4, …".
   3. In the route replace "strictness by Herman's region argument when both rotation numbers equal `p/q`" by "strictness, when the two rotation numbers are equal and irrational, by the irrational case above applied to `g₁ < g₂` (no measure is needed); when both equal `p/q`, by Herman's region argument".

   Tested on the instance that the route missed: translations `g₁(x) = x + α`, `g₂(x) = x + α + ε` with `α = √2/2`, `ε = 1/10`: `q = 7`, `p = 5` give `p − qα ≈ 0.0503 ∈ (0, ε)`, `g₁⁷(x) = x + 4.9497 > x + 4.9`, `g₂⁷(x) = x + 5.6497 > x + 5`, so `τ(g₂) ≥ 5/7 ≈ 0.714 > 0.707`; indeed `τ(g₂) = 0.807`. The added fact is false at rational values, which is why the measure argument stays for `p/q`: `g₁(x) = x + sin(2πx)/20 − 1/50` and `g₂(x) = x + sin(2πx)/20` satisfy `g₁ < g₂`, both have fixed points (`sin 2πx = 2/5`, `sin 2πx = 0`) and both have translation number `0`.

2. **F02** (P3) The region to which §5.3 applies the Birkhoff–Fathi theorem omits the boundary circle

   **Location.** `packages/MathematicalBilliards/README.md` line 411 (§5.3): "Apply §5.2 to `H` on `AddCircle ℓ × [a, b)` and the lower component `U` of §5.1 … `U` is homeomorphic to `AddCircle ℓ × [0, 1)` by the annulus theorem".

   **Claim.** The lower component of §5.1 satisfies the hypotheses of §5.2.

   **Witness.** §5.1 (line 386) defines the components in the open annulus. For `C = {y = c}` the lower component is `AddCircle ℓ × (a, c)`, an open annulus, not homeomorphic to `AddCircle ℓ × [0, 1)`; Herman1983 lines 1150–1154 need `U ≅ T¹ × [0, 1)`.

   **Repair.** Write: "Apply §5.2 to `H` on `AddCircle ℓ × [a, b)` and to `U`, the union of the lower boundary circle `AddCircle ℓ × {a}` with the lower component of §5.1. This `U` is open in `AddCircle ℓ × [a, b)`, relatively compact there (its closure is `U ∪ C`), and `H`-invariant because `H` preserves `C` and the lower boundary circle; it is homeomorphic to `AddCircle ℓ × [0, 1)` by the annulus theorem …". Tested on the witness: `U = AddCircle ℓ × [a, c)`, homeomorphic to `AddCircle ℓ × [0, 1)`, with frontier `{y = c} = C` in `AddCircle ℓ × [a, b)`. The sentence "the boundary circles are non-wandering too" of the same route already supplies `U ⊆ nonwanderingSet H` for this `U`.

3. **F03** (P3) §10.3 defines the flat area through a "pullback by a chart" and gives it no API

   **Location.** `packages/MathematicalBilliards/README.md` line 739 (§10.3): "a unique finite Borel measure `area_X` on `X` with `area_X(Σ_X) = 0` whose pullback by every translation chart is Lebesgue measure on its target".

   **Claim.** The defining property is stated, and the definition has its API.

   **Witness.** A chart `φ : U → ℂ` pulls measures back from `ℂ` to `U`, not from `X`. §10.3 has no `API:` list, while §11.4 (line 823) uses `area(S_P) = |G| area P > 0`, stated nowhere.

   **Repair.** Replace the clause by "such that, for every translation chart `φ`, the image under `φ` of the restriction of `area_X` to the source of `φ` is Lebesgue measure restricted to the target of `φ`", and add after the first paragraph:

       API:

       - `area_X` is finite and gives positive mass to every nonempty open set; in particular `area_X(X) > 0`.
       - In a cone chart `φ` of order `k` the set `{|φ| < r}` has area `π r^{2k} / k`.
       - A homeomorphism of translation surfaces that matches the cone points and the translation atlases carries `area` to `area`; a surface glued from finitely many polygons by translations along sides has area the sum of the areas of the polygons.

   Tested: for `k = 1` the cone formula gives `πr²`; in general `z ↦ z^k/k` covers the disc of radius `r^k/k` exactly `k` times, `k · π(r^k/k)² = πr^{2k}/k`; the octagon of side `1` gives `2(1 + √2)`, the existing Check; the unfolded unit square gives `4 · 1 = 4`, the value used in §11.4.

Three findings: one P2 and two P3, all local repairs to `packages/MathematicalBilliards/README.md`. The six findings of the previous review are repaired. `Suggested.lean`, `metadata.toml` and `sources.toml` need no change: the acceptance test elaborates with `sorry` as its only warning, no declaration is padding, every pinned name and every supplier citation resolves, and the dependency check reports no problem.

## Previous findings, one by one

| Id (round 2) | Status | Repaired passage (quoted) | Check made now |
|---|---|---|---|
| F01 (P2) strict monotonicity without the `C¹` twist | repaired | README line 425: "if moreover `F` restricts to a monotone twist map (`C¹`, `∂_yF₁ > 0`) on the open strip and preserves a measure with a continuous positive density there (§4.2), the inequality is strict" | Herman1983 lines 268–319 read: 2.4.1 assumes a diffeomorphism deviating the vertical, 2.4.4 adds Lebesgue measure. Circle: `1/3 < 1/2`. The adversarial pass on the rewritten route gives R01. |
| F02 (P3) pieces off `A` | repaired | README line 277: "and `δ ∈ (0, π) + 2πm` for each integer `m ≠ 0`, where the lift depends on `δ` only through `exp(iδ)`" | Unit circle, `(0, 5π/2)`: `e = i · i = −1`, image `(π, π/2)`. The four families cover `ℝ` modulo `2π`: `{0} ∪ (π, 2π)`, `{π}`, `(0, π)` shifted, `(0, π)`. |
| F03 (P3) locator for the multiplier property | repaired | README line 852: "(Hochman2012, Proposition 6.2.1, printed p. 59, line 2627, for `ℤ`-actions; ChaikaForni2026, Section 1, p. 3, lines 95–98, uses the related spectral criterion …)" | Hochman2012 line 2627 is Proposition 6.2.1 on the page headed 59; ChaikaForni2026 lines 95–98 derive Theorem 1.2 from Theorem 1.3 and ergodicity. |
| F04 (P3) line-only locators | repaired | for example README line 442: "(BialyMironov2022, Section 1.3, p. 3, lines 116–119, the remark after Corollary 1.3)" | All 23 BialyMironov2022 and ChaikaForni2026 citations now carry a section or theorem and a page; pages recomputed from the page markers (BialyMironov2022 p. 2 ends at line 98, p. 4 is lines 145–185, p. 6 starts at 225; ChaikaForni2026 p. 1 is lines 5–41, p. 3 is lines 80–121, p. 5 starts at 159). |
| F05 (P3) dependency lines | repaired | README line 298: "Layers 1–2; Mathlib (change of variables, the Haar measure of `AddCircle`, densities); SymplecticGeometry/IntegrableSystems I5.0 (sign convention in §3.2)."; lines 244, 466, 698, 779 likewise | All twelve `### Dependencies` lines compared with the union of their layer's `*Needs:*` lines: equal. |
| F06 (P3) point for coordinate | repaired | README line 387: "`f₂(x, y) → a` as `y → a` and `f₂(x, y) → b` as `y → b`, uniformly in `x`, for the second coordinate `f₂`" | Same wording in §4.1 line 304 with `F₂`. |

Repaired patterns searched in the rest of the package: no other derivative-based claim is made for a topological twist; no other partition claim; no locator of a readable source is line-only; no other dependency line disagrees with its layer.

## Verified sound

**Files read.** All of `README.md` (952 lines, 12 layers, 52 target sections, 22 `API:` lists, 52 `**Checks.**` lists), `Suggested.lean` (295 lines, 16 named declarations and one proved `example`), `metadata.toml`, `sources.toml` (12 entries, one key per work, every work of the References recorded, no local path), the previous review and its repair report.

**Principles.** No route-specific shortcut (curvature may vanish, holes allowed, no separability, no topology on the space in Layer 12); no re-planned roadmap (C3.1's smooth map is imported and compared in §2.5); one direction of supply; no copied passage; no algorithm; no sorry'd data; no `set_option`. Layer titles name mathematics and the order is forced by the dependency lines (Layers 1–6 and 7–11 are independent).

**Elaboration.** `lake env lean` on `packages/MathematicalBilliards/Suggested.lean` from the content checkout: exit 0; seven `declaration uses sorry` warnings (lines 154, 193, 209, 235, 257, 268, 287) and nothing else. The one `TauCeti.*` import is used (`StronglyContinuousGroup`, `IsUnitary`) and was already built. Header: `module`, `import Mathlib`, one `TauCeti.*` module.

**Binders.** The elaborated types of all 16 declarations (the worker's `#check @name` listing, regenerated for this head) were compared one by one with the README statements: `[Fact (0 < ℓ)]` on every table declaration; `2 ≤ k` on the two `k ≥ 2` theorems; `0 < ℓ`, `a < b`, the lift relation, the twist disjunction, the non-wandering hypothesis and `C` in the open annulus on the graph theorem; `0 < p`, `p < q`, `p.Coprime q`; `[CompleteSpace H]` and `U.IsUnitary`; `[IsFiniteMeasure σ]`; `[MeasurableVAdd₂ ℝ X]`, `[IsProbabilityMeasure μ]`, `[VAddInvariantMeasure ℝ X μ]`. Nothing lost; README and Lean generality agree.

**Padding probe.** Every sorried theorem (7 of 7) was tried on a scratch copy with `first | rfl | (simp; done) | infer_instance | exact?`: all seven fail. None restates a definition, mirrors a Check, computes a value or treats a boundary case. The proved `example` (the unit circle inhabits `ConvexTable ⊤ (2π)`) tests the orientation convention of the carrier and shows the table hypotheses are satisfiable.

**Headlines.** From the Summary: invariant measure (§3.3, stated); graph theorem (§5.3, stated, with its Lipschitz billiard form); two Birkhoff orbits (§6.4, stated); measure preservation and reversibility of the polygonal flow (§8.3, named in the module docstring: no carrier for the polygonal flow); unfolding (§11.4, named); eigenfunction criterion (§12.5, stated); also Wiener's lemma (§12.4) and the mean ergodic projection (§12.4.1), stated; non-ergodicity of rational tables and the genus formula, named with their reasons. All 16 Lean names occur in README line 92 and every backticked name of this roadmap's own is declared (the six `ConvexTable.*` leads of the citation resolver are declarations of `Suggested.lean`).

**Adversarial table** (sampled targets, headlines, targets touched by findings; values computed in this round).

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| §2.1 lift and map | circle `R`; `δ ∈ (0, π)`, `0`, `π`, `(π, 2π)`; wrong outgoing angle | near `t = s⁺`: `e × τ(s) = Im exp(−iδ) = −sin δ < 0`, so the parameter set is `[s₁, s + ℓ)`; `τ₁² conj e = exp(iδ₁)τ₁`; `δ = 0`: `s₁ = s`, `δ₁ = 0`; `δ = π`: `sInf ∅ = 0`; `δ ∈ (π, 2π)`: set `(s, s₁(δ − π)]`, infimum `s`, `δ₁ = arccos cos δ`; wrong convention squared `= (s + ℓ, δ)` | sound |
| §2.2 regularity | `Φ = e × (γ(s₁) − γ(s))`; circle; circle–ellipse | `∂_sΦ = sin δ − κL`, `∂_δΦ = −L`, `∂_{s₁}Φ = sin δ₁`; circle `(2 sin δ − sin δ)/sin δ = 1`, `2R sin δ/sin δ = 2R`; one-sided `2·1 − 1 = 1`, `2·4 − 1 = 7` | sound |
| §3.2 exactness, Jacobian | circle; ellipse `(2 cos u, sin u)` at `(2, 0)`, `δ = π/4` | `det = 1`; `5a²/4 − a = 0`, `a = 4/5`, exit `(6/5, 4/5)`, `L = 4√2/5`, `τ₁ = (−8, 3)/√73`, `cos δ₁ = 11/√146`, `sin δ₁ = 5/√146`, `det = √73/5 ≈ 1.709`; sign: `λ = cos δ ds`, `T*λ − λ = dL` in BialyMironov2022 line 185, so `∂_sL = −cos δ`, `∂_{s₁}L = cos δ₁` | sound |
| §3.3 `ConvexTable.measurePreserving_billiardMap` | total map off `A`; ellipse state | `μ(f⁻¹E) = μ(T⁻¹(E ∩ A)) = μ(E ∩ A) = μ(E)`; `(5/√146)(√73/5) = 1/√2 = sin(π/4)`; pieces continuous: `(s, arccos cos δ)`, `(0, arccos(−⟨τ(s), τ(0)⟩))`, shifted copies of `T` | sound |
| §4.1 twist lifts | inverse of a positive twist; shear; `(x + log y, y)` | preimage of a vertical meets each `c_x` once, so `Y ↦ (F⁻¹)₁(X₀, Y)` is injective, hence monotone; ends: `F₁(x_a, b) > F₁(x_a, a) = X₀ = F₁(x_b, b)` gives `x_b < x_a`, decreasing; conjugate by `1/y`: `(x − log y, y)` | sound |
| §4.2 area, exactness | shear at `(1, 2)`; standard map; shifted shear | `−∂₁h = ∂₂h = 1`, `S = 1/2`; `F*(y dx) − y dx = ε sin(2πx) dx + d(Y²/2)`, `det DF = 1`; flux `c`; `−dλ = ρ dx ∧ dy` from `∂_y g = ρ` | sound |
| §4.3 billiard twist | circle; general | `g = −cos δ`, `∂_δ g = sin δ`; `F*λ − λ = −cos δ₁ ds₁ + cos δ ds = −dL`; `−∂₁(−L) = −cos δ = g`, `∂₂(−L) = −cos δ₁ = g∘F`; circle `∂_δS = −2R cos δ = g(F) · 2R` | sound |
| §5.3 `isGraph_of_isRotationalInvariantCurve`, Lipschitz bound, billiard form | `C = {y = c}`; shear; circle; non-twist rotation | `U = AddCircle ℓ × [a, c)` (R02); right and left difference quotients `≤ ∂_yF₂/∂_yF₁`, `≥ ∂_y(F⁻¹)₂/∂_y(F⁻¹)₁`; circle `±1/(2R)` against `0`; `1 + 0.8π cos 8πt < 0` somewhere | sound; R02 on the route |
| §5.4 rotation numbers | circle `π/3`, `π/2`, `2π/3`; `α = √2/2`, `ε = 1/10`; rational pair | `1/3`, `1/2`, `2/3 = 1 − 1/3`; `5 − 7α ≈ 0.0503`, `τ(g₂) ≥ 5/7`; `g₁ < g₂` with both `τ = 0` | R01 |
| §6.1 configurations | `Γ`; `(2, 3)` on the unit circle; `p = q` | `σ^q = d^p`; `ℤ²/⟨(q, −p)⟩ ≅ ℤ`; free: `s_{j+m} = s_j − nℓ` forces `−qn = mp`, `q ∣ m`; gaps `4π/3`, `W = 3√3`; `q` gaps `< ℓ` cannot sum to `qℓ` | sound |
| §6.3 maximal orbit | run end with gap `0`, gap `ℓ`; `(1, 4)`; collapsed `(1, 3)` | rates `1 − cos δ`, `1 + cos δ`; `4√2` against `8` of type `(2, 4)`; `(q − p)·pℓ/q + p·(q − p)ℓ/q = 2p(q − p)ℓ/q = 4ℓ/3` | sound |
| §6.4 `ConvexTable.exists_two_periodic_orbits` | circle; ellipse `(1, 2)` | equal-gap configurations `c + jpℓ/q` are distinct modulo `Γ` for `c ∈ [0, ℓ/q)`; `W = 8` and `4` | sound |
| §9.1 reflection group | square; equilateral; `π/√2`; flat vertex; `π/8` triangle | orders `4`, `6`; rotation by `√2π` of infinite order; `{1, σ}` of order `2 = 2n_v` at `α = π`; rotations `−2α_v`, order `n_v`, `lcm(2, 8, 8) = 8` | sound |
| §10.1 translation groupoid | `z + 3i`, `2z`, `conj z`, `−z`, two half-planes | derivatives `1`, `2`, none, `−1`; images `{Re < 0}`, `{Re > 1}` disjoint | sound |
| §10.2 translation surfaces | octagon; pillowcase; `k = 1` | `8 · 3π/4 = 6π`, `k = 3`, `2g − 2 = 2`; `k = 1/2` not an integer; `φ^k/k` has derivative `φ^{k−1} ≠ 0` off `p` | sound |
| §10.3 flat area | cone disc; octagon; atom | `πr^{2k}/k`; `2(1 + √2)`; atom excluded by `area(Σ) = 0` | R03 |
| §11.2 cone angles | side chart; L-table; `π/8` triangle | `gσ_S x + g(x₀ − σ_S x₀) = g(σ_S(x − x₀) + x₀)`; `2n_v · πm_v/n_v = 2πm_v`; classes `16/4, 16/16, 16/16 = 4, 1, 1` | sound |
| §11.3 Euler characteristic, genus | square, equilateral, `π/8`, L, hole | `4 + 4 − 8 = 0`, `6 + 3 − 9 = 0`, `16 + 6 − 24 = −2`, `4 + 6 − 12 = −2`, `0 + 8 − 16 = −8`; genera `1, 1, 2, 2, 5`; `(8/2)(2/8) = 1`; angle sum `(n − 2 + 2h)π`: hole with `n_i` vertices contributes `(n_i + 2)π` | sound |
| §12.4 `tendsto_average_norm_charFun_sq` | `0`, `δ₀`, `(δ₀ + δ₁)/2`, uniform on `[0, 1]` | `0`, `1`, `1/2 = 1/4 + 1/4`, `(2 − 2cos t)/t² → 0` on average | sound |
| §12.4.1 `exists_tendsto_twistedAverage` | `e₁` on `AddCircle 1`; identity group; `v = 0` | `⟨e₁, U_t e₁⟩ = exp(2πit) = charFun δ_{2π}(t)`; `a = 1`: `w = e₁`, `1 = δ_{2π}({2π})`; `a = 0`: `w = 0`; `(1 − exp(−2πiaT))/(2πiaT) → 0`; `‖A_T^a v‖² = ∫ |K_T(ξ − 2πa)|² dσ` | sound |
| §12.5 `isWeaklyMixing_iff` | one point; `f = 0`; `a ≠ 0`; `a = 0` | all `f` constant; `0` constant; `∫f = exp(2πiat)∫f` gives `f ⊥ 1`, `|⟨f, U_tf⟩|² = ‖f‖⁴`, so `f = 0`; `⟨1, P₀f⟩ = ⟨1, f⟩ = 0`; half-circle residual `1/8` | sound |

**Seeded source sample.** No locator is flagged unverified by the author.

| Target | Locator read | Outcome |
|---|---|---|
| 2.1 | BialyMironov2022 lines 154–161 (Section 2, p. 4) | phase cylinder of oriented lines, coordinates `(cos δ, s)`; positive curvature there, the `C^k` construction is the README's, as it says. |
| 2.2, 4.3, 6.1, 6.3 | KatokHasselblatt1995 §§9.2–9.3; ChernovMarkarian2006 Ch. 2 | waived, no text; recomputed (table). |
| 3.2 | BialyMironov2022 lines 182–185 (p. 4) | `T*λ − λ = cos δ₁ ds₁ − cos δ ds = dL` with `λ = cos δ ds`. |
| 4.1 | Herman1983 lines 149–155 (1.2, printed p. 5) and 1128–1141 (Appendice §2, printed pp. 40–41) | the `C¹` definition by cones, and the topological one by transverse crossing; left-to-right crossing is "à droite", the positive twist. |
| 4.2 | Herman1983 lines 762–769 (4.3, Remarque, printed p. 27) | generating functions and globally canonical maps, `f*ω − ω = dS`. |
| 5.4 | Herman1983 lines 268–319 (2.4.1–2.4.4, printed pp. 10–11) | weak inequality from `g₁ < g₂`; 2.4.3 the irrational case by an external reference (R01); 2.4.4 strictness with Lebesgue measure. |
| 9.1, 11.2, 11.3 | MasurTabachnikov2002 §1; ZemlyakovKatok1975 | uncertified or waived, no text; recomputed on five tables. |
| 10.1, 10.2 | ChaikaForni2026 lines 168–176 (Section 2, p. 5) | translation surface as a pair (surface, Abelian differential), charts by integration off the zeros; groupoid and cone-atlas formulations are the README's own, as it says. |
| 12.4.1 | Hochman2012 lines 3076–3096 (Lemma 6.6.2, printed p. 69) | twisted discrete averages tending to `0` when the spectral measure has no atom at the eigenvalue. |

Also read: Herman1983 lines 180–196 (2.1–2.2), 420–438 (3.4), 700–721 (4.2–4.3), 803–807 (5.2), 1144–1154 (Théorème de Birkhoff, printed p. 41); BialyMironov2022 lines 96–119 and 227–265; ChaikaForni2026 lines 9–28 and 83–100; Hochman2012 lines 2439, 2474–2487, 2627, 2854–2855, 3018–3073, 3099–3143. Printed pages agree with the README's wherever it gives one.

**Pinned declarations opened** (the pins of the content checkout's manifest; paths relative to each library, line of the declaration).

- `Mathlib/Dynamics/Circle/RotationNumber/TranslationNumber.lean`: `CircleDeg1Lift` 129, `translationNumber` 550, `translationNumber_units_inv` 638, `tendsto_translationNumber` 685, `translationNumber_mono` 695, `translationNumber_le_of_le_add` 704, `le_translationNumber_of_add_le` 707, `translationNumber_eq_rat_iff` 820; no strict monotonicity statement among its theorems (lines 514–887 listed).
- `Mathlib/MeasureTheory/Integral/IntervalIntegral/Periodic.lean` 69, 91; `Mathlib/Analysis/SpecialFunctions/Complex/Circle.lean` 421; `Mathlib/Topology/Instances/AddCircle/Defs.lean` 190, 306; `Mathlib/MeasureTheory/Function/Jacobian.lean` 1184; `Mathlib/Dynamics/Ergodic/Conservative.lean` 63, 196 (second-countable, opens measurable); `Mathlib/Dynamics/Ergodic/Action/Basic.lean` 31 (`ErgodicVAdd` extends `VAddInvariantMeasure`; almost invariant measurable sets are null or conull); `Mathlib/MeasureTheory/Group/Arithmetic.lean` 456; `Mathlib/MeasureTheory/Group/Defs.lean` 51; `Mathlib/MeasureTheory/Group/Action.lean` 178 (`measurePreserving_smul` with `to_additive`, giving `measurePreserving_vadd`); `Mathlib/Dynamics/Flow.lean` 85.
- `Mathlib/Analysis/Calculus/ImplicitContDiff.lean` 41, 83; `Mathlib/Analysis/Convex/Strict.lean` 37; `Mathlib/Analysis/Convex/Hull.lean` 48; `Mathlib/Geometry/Manifold/StructureGroupoid.lean` 90, 275; `HasGroupoid.lean` 34, 93; `ChartedSpace.lean` 141; `IsManifold/Basic.lean` 673; `Mathlib/Topology/Homotopy/Contractible.lean` 29; `Mathlib/Geometry/Polygon/Basic.lean` 29, 62, 72; `Mathlib/GroupTheory/SpecificGroups/Dihedral.lean` 31.
- `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean` 595, 606, 611, 615, 631; `Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean` 120; `Mathlib/Analysis/InnerProductSpace/Basic.lean` 107; `Mathlib/MeasureTheory/Measure/CharacteristicFunction/Basic.lean` 130, 134; `Mathlib/Analysis/InnerProductSpace/PiL2.lean` 853; `Mathlib/Analysis/InnerProductSpace/MeanErgodic.lean` 89; `Mathlib/MeasureTheory/Integral/IntervalIntegral/Basic.lean` 655; `Mathlib/Topology/Homeomorph/Defs.lean` 44.
- `TauCeti/Geometry/Polygon/Simple.lean` 109, 483, 614, 767; `TauCeti/Topology/JordanCurve/Basic.lean` 107, 282 (convex, nonempty interior, bounded); `TauCeti/Analysis/Complex/PlaneSeparation/Inside.lean` 190; `JordanCurve.lean` 175; `TauCeti/Analysis/Complex/Conformal/Jordan/Schoenflies.lean` 122; `PrimeEnd/Crosscut/TwoSides.lean` 137; `TauCeti/Analysis/Bochner/CharFun/Bochner.lean` 101 (`∃!` finite measure with `F x = ∫ exp(i x ξ)`); `TauCeti/Analysis/Semigroups/Group/Basic.lean` 74 (real-linear operators, `U 0 = id`, `U (s + t) = U s ∘ U t`, continuity of orbits at `0`, no completeness); `Unitary.lean` 107 (every `U t` preserves the complex inner product), 154; `TauCeti/Probability/Ergodic/MeanErgodic.lean` 43; `TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean` 123 (needs `FiniteCWType`); `MayerVietoris.lean` 93.

Searched by object in both pinned libraries: non-wandering sets, weak mixing, Wiener's lemma (only Wiener–Ikehara files), billiards, translation surfaces, twist maps of the annulus, rotational invariant curves, mean ergodic theorems for groups (only the single-operator and single-map forms): no pinned declaration states a target of this roadmap.

**Cross-roadmap citations resolved now** (main at `36371fc`, or the open head for the one roadmap not on main).

- `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md`: C3.1 heading 471, "Convex planar billiards" 527, `exists_billiard_periodic_reflection` 573, circle formula 575, "Finite-volume recurrence" 583.
- `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md`: I5.0 426 with `y = −∂₁S`, `Y = ∂₂S` at 434; I5.4 623, cup-length bound 678–680.
- `TauCetiRoadmap/RiemannianGeometry/Surfaces/README.md`: §3.1 471, `integral_signedCurvature_add_sum_exteriorAngle_eq_two_pi` 489.
- `TauCetiRoadmap/GeometricTopology/README.md`: §1.7 1049 (genus `(2 − χ − b)/2` at 1069), §2.3 1386 (`n + 1 ≤ 3` by Schoenflies, 1392).
- `TauCetiRoadmap/FactorRigidity/README.md`: §8.2 746 (kept-variant comparison).
- ProbabilisticAndMetricNumberTheory at its open head (a new roadmap folder, line 62 of the merge order, this roadmap at line 404): §4.6 at 5507, §4.9a at 6319, `scalarLpKoopman_strong` at 6363 (kept-variant comparison, not a supplier).

**Ownership and duplication.** The board package index lists three packages, none on this subject. Searched by object across main and the 440 indexed open heads: billiards (only C3.1 on main, cited); translation surfaces (one example in UnboundedOperators); non-wandering sets, Wiener's lemma, the Katok–Zemlyakov surface (no match); weak mixing (only FactorRigidity §8.2, cited as a different notion); mean ergodic theorems (single maps only: `Completed/Exchangeability`, Equidistribution citing it); Koopman strong continuity (ProbabilisticAndMetricNumberTheory §4.9a, cited as the continuous-action variant; GeometryOfNumbersAndQuadraticArithmetic states the same continuous-action form, which is a matter between those two roadmaps; IncompressibleFlows may not be cited). §12.3's jointly measurable case has no other owner. No declaration of `Suggested.lean` shares a fully qualified name with a readable roadmap. The overlap report lists no changing pull request, no dropped id and no revision-only id; the five closest roadmaps own none of this roadmap's objects.

**Supplier order.** No supplier gap is declared and none is needed. Output of the dependency check:

```text
depcheck: 237 roadmaps, 2139 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. No roadmap of the never-cite list is cited.

**Shape and style.** Summary, Scope and ownership, Conventions (each with a computed witness), Exact supplier contracts, How to read the build, twelve layers each ending with Examples and Dependencies, Downstream consumers, References. No LaTeX delimiters, no process words, no pull-request numbers, no machine paths, no `lemma`, no target tables. Remarks that need no change: 56 of the roadmaps on main also begin `Suggested.lean` with `module`; "deviates the verticals" is the term of Herman1983 and is explained at §4.1.

## Not verifiable

- `Tabachnikov2005` (Chapters 3, 7), `KatokHasselblatt1995` (§§9.2–9.3, Chapter 13), `ChernovMarkarian2006` (Chapter 2), `BoldrighiniKeaneMarchetti1978` (§2), `ZemlyakovKatok1975` (pp. 291–300), `KerckhoffMasurSmillie1986` (Theorem 1): settled as waived, no text. The sampled statements resting on them (2.2, 4.3, 6.1, 6.3) were recomputed, not checked against wording or numbering.
- `MasurTabachnikov2002` (§1) and `Birkhoff1927` (§§1–3): settled as uncertified, no text; 9.1, 11.2 and 11.3 were recomputed.
- Ownership against open pull requests was checked through the indexed heads only; a pull request outside that index was not sought.

## Source issues

- **Misprint** in Hochman2012 at Theorem 6.6.1, proof sketch, printed p. 68 (Hochman2012 line 3029): the source says the Fourier transform of the spectral measure is real valued; it should be complex valued; affects nothing.
- **Gap** in Hochman2012 at Theorem 6.6.1, proof sketch, printed p. 69 (Hochman2012 lines 3065–3073): the source says polynomials in nonnegative powers of `z` are dense in the `L²` space of the spectral measure; it should use Laurent polynomials, since for Haar measure `z⁻¹` is orthogonal to them; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c9fc8c93d3b0f3e9e8defdf04c110d54f92d8f08", "job": "REV-PKG-MathematicalBilliards~3", "model": "fable", "worker": "chris-l"} -->
