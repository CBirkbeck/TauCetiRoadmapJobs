<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13476#issuecomment-6790377177 -->
Review (claude) of e527860

Verdict: needs_changes

1. **F01** (P2) Strict monotonicity of the rotation number is stated without the `C¹` twist it uses

   **Location.** `packages/MathematicalBilliards/README.md` line 424 (§5.4): "for a positive twist, if `ψ₁ < ψ₂` are two invariant graphs then `ρ(C₁) ≤ ρ(C₂)`, strictly when `F` preserves a measure with continuous positive density", with route "monotonicity from `∂_yF₁ > 0`".

   **Claim.** §5.4 is set up for "the twist lift `F`", the topological notion `IsTwistLift` of §4.1, which has no derivative. The strict inequality is asserted at that generality.

   **Witness.** Herman1983 line 268 (2.4.1) assumes a diffeomorphism deviating the vertical; 2.4.4 (lines 287–319) proves strictness for it, using a `C¹` negative path (line 310). The README's own route uses `∂_yF₁`, absent from a topological twist.

   **Repair.** In §5.4 replace the clause by: "and, for a positive twist lift, if `ψ₁ < ψ₂` are two invariant graphs then `ρ(C₁) ≤ ρ(C₂)`; if moreover `F` restricts to a monotone twist map (`C¹`, `∂_yF₁ > 0`) on the open strip and preserves a measure with continuous positive density, the inequality is strict (Herman1983, Chapitre I, 2.4.2 and 2.4.4, printed pp. 10–11, for diffeomorphisms deviating the vertical and Lebesgue measure)". In the route replace "monotonicity from `∂_yF₁ > 0` and `CircleDeg1Lift.translationNumber_mono`" by "monotonicity from the strict increase of `y ↦ F₁(x, y)` and `CircleDeg1Lift.translationNumber_mono`; strictness by Herman's region argument, which uses the `C¹` twist". Tested: the weak inequality needs only `g₁(x) = F₁(x, ψ₁(x)) < F₁(x, ψ₂(x)) = g₂(x)`; the circular table (`k = ∞`, a monotone twist preserving `sin δ dδ ds`) gives `ρ(δ = π/3) = 1/3 < 1/2 = ρ(δ = π/2)`, and the billiard uses of §§5.4–5.6 all have `k ≥ 2`. No counterexample at topological generality is claimed; the defect is the missing hypothesis.

2. **F02** (P3) The measurability pieces of §3.3 do not cover the complement of the phase cylinder

   **Location.** `packages/MathematicalBilliards/README.md` line 277 (§3.3): "off `A`, continuous on each of the Borel pieces `δ ∈ (π, 2π) ∪ {0}` modulo `2π` (exit parameter `s`) and `δ ≡ π` (exit parameter `0`)".

   **Claim.** These pieces, with `A`, partition `AddCircle ℓ × ℝ`.

   **Witness.** The state `(s, 5π/2)` is off `A = AddCircle ℓ × (0, π)` and in neither piece. There `exp(iδ) = i`, so `ConvexTable.billiardLift` returns the value at `(s, π/2)`; on the unit circle `(0, 5π/2) ↦ (π, π/2)`.

   **Repair.** Add the third family: "and on each `δ ∈ (0, π) + 2πm`, `m ≠ 0`, where the lift depends on `δ` only through `exp(iδ)` and equals the map on `A` precomposed with `δ ↦ δ − 2πm`". Tested on the witness: `(0, 5π/2)` lies in the piece `m = 1` and is sent to `T(0, π/2) = (π, π/2)`, continuous there. The measure statement is unaffected (`μ_A` is concentrated on `A`).

3. **F03** (P3) A locator that does not contain the cited statement

   **Location.** `packages/MathematicalBilliards/README.md` line 850 (§12.1): "The product of a weakly mixing action with an ergodic one is ergodic (ChaikaForni2026 lines 95–98; Hochman2012, Proposition 6.2.1 …)".

   **Claim.** ChaikaForni2026 states this at the cited place.

   **Witness.** ChaikaForni2026 lines 95–98 say that Theorem 1.3 (almost no direction has a given nonzero eigenvalue), with ergodicity in almost every direction, implies ergodicity of the product flows of Theorem 1.2. Neither factor is weakly mixing there.

   **Repair.** Write "(Hochman2012, Proposition 6.2.1, printed p. 59, for `ℤ`-actions; ChaikaForni2026, Section 1, p. 3, uses the related spectral criterion that two ergodic flows without a common nontrivial eigenvalue have an ergodic product)". Tested against the texts: Hochman2012 line 2627 states exactly the multiplier property; ChaikaForni2026 lines 95–100 state the eigenvalue route.

4. **F04** (P3) Locators given only as line numbers of a text extraction

   **Location.** `packages/MathematicalBilliards/README.md` lines 120, 140, 145, 250, 255, 267, 380, 412, 440, 842, 850, 902, for example line 440: "(BialyMironov2022 lines 116–119)".

   **Claim.** Each claim has a locator a reader can follow in the source.

   **Witness.** Twelve citations of BialyMironov2022 and ChaikaForni2026 give no theorem, section or page, only line numbers of an extraction that is not part of the roadmap. The Herman1983 and Hochman2012 citations carry section or theorem numbers.

   **Repair.** Give each a section or theorem and printed page (the line numbers may stay after it). Checked in the texts: line 120 → BialyMironov2022, §1.3, p. 2, and Section 2, p. 4; lines 140, 145, 250, 255, 267 → Section 2, p. 4; line 380 → Theorem 1.1, p. 3; line 412 → Section 3, p. 6; line 440 → §1.3, p. 3, the remark after Corollary 1.3; line 842 → ChaikaForni2026, abstract, p. 1, and Theorem 1.3, p. 3; line 850 → as in R03; line 902 → Section 1, p. 3, Theorem 1.3.

5. **F05** (P3) Three layer dependency lines disagree with the layers' `*Needs:*` lines

   **Location.** `packages/MathematicalBilliards/README.md` line 297: "Layers 1–2."; line 464: "Layers 2–4; GeometricTopology §2.3; Tau Ceti plane topology."; line 777: "Mathlib manifolds; GeometricTopology §1.7 (genus)."

   **Claim.** Each `### Dependencies` lists what its layer needs.

   **Witness.** §3.2 needs IntegrableSystems I5.0 and §3.3 Mathlib (lines 267 and 277); §5.6 needs CotangentLagrangian C3.1 and §5.4 Mathlib (lines 424, 450); no target of Layer 10 needs GeometricTopology §1.7, and line 90 calls Layer 10 self-contained.

   **Repair.** Line 297: "Layers 1–2; Mathlib (change of variables, `AddCircle` measure); SymplecticGeometry/IntegrableSystems I5.0 (sign convention in §3.2)." Line 464: "Mathlib (translation numbers, null-homotopy); Layers 2–4; GeometricTopology §2.3; Tau Ceti plane topology; SymplecticGeometry/CotangentLagrangian C3.1 (circular formula in §5.6)." Line 777: "Mathlib manifolds." (§11.3 keeps §1.7 in Layer 11's line.) Tested with the dependency check: all four roadmaps are earlier in the merge order, so no edge changes direction.

6. **F06** (P3) A point where a coordinate is meant

   **Location.** `packages/MathematicalBilliards/README.md` line 386 (§5.1): "`f(x, y) → a` as `y → a` and `→ b` as `y → b` uniformly in `x` when `Y` is open".

   **Claim.** The end-preservation condition is stated exactly.

   **Witness.** `f(x, y)` is a point of `AddCircle ℓ × Y`, not a real number; §4.1 (line 303) writes the same condition as `F₂(x, y) → a`.

   **Repair.** Write "`f₂(x, y) → a` as `y → a` and `f₂(x, y) → b` as `y → b`, uniformly in `x`, for the second coordinate `f₂`". Tested on the Check's map `f(x, y) = (x, h(y))`: `f₂ = h`, `h(y) → −1` and `→ 1` at the two ends.

Six findings: one P2 and five P3. The eight findings of the previous review are all repaired. The acceptance test elaborates with `sorry` as its only warning, no declaration is padding, and every supplier citation and pinned name resolves. The findings are local repairs to the README; `Suggested.lean`, `metadata.toml` and `sources.toml` need no change.

## Previous findings, one by one

| Id | Status | Repaired passage (quoted) | Check made now |
|---|---|---|---|
| F01 (P2) summary promised a differentiable twist at `C¹` | repaired | README line 3: "for `k ≥ 2` it proves that the map is a `C^{k−1}` diffeomorphism and an exact area-preserving monotone twist map … (at `k = 1` the map need not be differentiable, §2.2)" | Recomputed `∂s₁/∂s = (κ(s)L − sin δ)/sin δ₁` from `Φ = e × (γ(s₁) − γ(s))`: `∂_sΦ = sin δ − κL`, `∂_{s₁}Φ = sin δ₁`. At the diameter state of the circle–ellipse table `L = 2`, `sin δ = sin δ₁ = 1`: one-sided values `1` and `7`. |
| F02 (P2) component invariance needs a homeomorphism | repaired | README line 386: "If `f` is a homeomorphism of the annulus with `f(C) = C` that preserves each end … then `f` maps each of the two components onto itself" | `h` through `(−1,−1), (−1/2,1/2), (0,0), (1,1)`: `h(−1/2) = h(1/2) = 1/2`, `h(0) = 0`, also `h(−5/6) = 0`; not injective, excluded. A wording slip in the new bullet is R06. |
| F03 (P2) zero period | repaired | `Suggested.lean` line 227: "`0 < q ∧ (∀ j : ℤ, s (j + q) = s j + p * ℓ) ∧`"; README line 488: "`q ≥ 1`, `s_{j+q} = s_j + pℓ`" | `s_j = jπ√2`, `p = q = 0`: rejected by `0 < 0`. `(1,3)` equilateral: both components `1/2`; `(1,2)` diameter: both `0`; still accepted. |
| F04 (P2) Wiener headline absent | repaired | `Suggested.lean` line 257: "`theorem tendsto_average_norm_charFun_sq (σ : Measure ℝ) [IsFiniteMeasure σ]`"; named in README lines 92 and 880 and in the module docstring | `σ = 0`: `0 = 0`; `δ₀`: `1 = 1`; `(δ₀ + δ₁)/2`: `(1 + cos t)/2 → 1/2 = 1/4 + 1/4`; Lebesgue on `[0,1]`: `(2 − 2cos t)/t² → 0`, sum `0`. Not closed by `rfl`, `simp`, `infer_instance`. |
| F05 (P3) three API lists | repaired | README lines 142, 252, 582: an `API:` bullet list in each of §§1.4, 3.1, 7.3 | Unit circle `(0, π/2)`: `(e, c) = (−1, 0)`; `∂²L/∂s∂s₁ = sin δ sin δ₁/L` rederived from `∂_s u = sin δ · (iu)/L` and `⟨iu, τ(s₁)⟩ = sin δ₁`; corner bounds `2, 2, 1`. |
| F06 (P3) zero constant | repaired | README line 907: "A nonzero constant function is an eigenfunction with eigenvalue `0` … the zero function … is not an eigenfunction" | One point: `f = 1` only for `a = 0`; `f = 0` for no `a`. |
| F07 (P3) Koopman Check | repaired | README line 876: "`‖U_t 1_{0} − 1_{0}‖₂ = √2` for every `t ≠ 0` and `0` at `t = 0`" | `U_t 1_{0}(x) = 1_{0}(x + t) = 1_{−t}(x)`; disjoint unit atoms give `√2`. |
| F08 (P3) Birkhoff1927 certified from a failed response | repaired | `sources.toml` line 27: `status = "uncertified"`, `licence_class = "none"`, DOI URL, same key | One key for the work; `cited_for = ["References"]`; no target rests on it. |

The repaired patterns were looked for in the rest of the package: no other predicate has an unconstrained period, no other headline of the Summary is missing from the Lean file, no other definition section lacks an `API:` list (22 lists), and no other `certified` entry points at a non-article (the four certified texts were opened and contain the cited passages).

## Verified sound

**Files read.** All of `README.md` (950 lines, 12 layers, 52 target sections, 54 `*Needs:*` lines), `Suggested.lean` (295 lines, 16 declarations), `metadata.toml`, `sources.toml` (12 entries, one key per work), and the previous review with its repair report.

**Principles.** No route-specific shortcut (tables of class `C^k` with vanishing curvature allowed, polygons with holes, arbitrary measurable spaces in Layer 12); no re-planned roadmap (C3.1's smooth map is imported and compared in §2.5, not restated); supply is one-directional; no copied passage; no algorithm; no sorry'd data; no `set_option`. Layer titles name mathematics, and the order is forced by the dependency lines.

**Elaboration.** `lake env lean` on `packages/MathematicalBilliards/Suggested.lean` from the content checkout: exit 0, seven `declaration uses sorry` warnings (lines 154, 193, 209, 235, 257, 268, 287) and nothing else. The one `TauCeti.*` import was already built. Header: `module`, `import Mathlib`, one `TauCeti.*` module that is used (`StronglyContinuousGroup.IsUnitary`).

**Binders.** `#check @name` for all 16 declarations in one scratch copy, elaborated once, each compared with its README statement: `[Fact (0 < ℓ)]` on every table declaration, `2 ≤ k` on the two `k ≥ 2` theorems, `0 < ℓ`, `a < b`, the lift relation, the twist disjunction and the non-wandering hypothesis on the graph theorem, `0 < p`, `p < q`, `p.Coprime q`, `[CompleteSpace H]` and `U.IsUnitary`, `[IsFiniteMeasure σ]`, `[MeasurableVAdd₂ ℝ X]`, `[IsProbabilityMeasure μ]`, `[VAddInvariantMeasure ℝ X μ]`. Nothing lost, nothing changed.

**Padding probe.** Every sorried theorem (7 of 7) was tried with `first | rfl | simp | infer_instance` on a scratch copy: all seven fail. None restates a definition, mirrors a Check, computes a value or treats a boundary case. The one proved `example` (the unit circle inhabits `ConvexTable ⊤ (2π)`) tests the orientation of the carrier and shows the headlines are not vacuous; it stays.

**Headlines.** From the Summary: invariant measure (§3.3, stated), graph theorem (§5.3, stated, with its Lipschitz billiard form), two Birkhoff orbits (§6.4, stated), polygonal measure preservation and reversibility (§8.3, named as not statable: no polygonal flow carrier), unfolding (§11.4, named as not statable), eigenfunction criterion (§12.5, stated); also Wiener's lemma (§12.4, stated) and the mean ergodic projection (§12.4.1, stated); non-ergodicity of rational tables and the genus formula are named as not statable with their reasons. All 16 Lean names appear in README line 92, and every backticked name of this roadmap's own in the README is declared (`roadmaps resolve`: no citation and no Lean name found nowhere).

**Adversarial table** (sampled targets, headlines, and targets touched by findings; values computed in this round).

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| §2.1 lift and map | circle `R`; `δ = 0`, `π`, `δ ∈ (π, 2π)`, `δ = 5π/2`; wrong outgoing angle | set of parameters is `[s₁, s + ℓ)` on the strip since `e × τ(s) = −sin δ < 0`; `τ(s₁)² conj e = exp(iδ₁)τ(s₁)`; `δ = 0`: `s₁ = s`, `δ₁ = 0`; `δ = π`: `sInf ∅ = 0`; `δ ∈ (π, 2π)`: `s₁ = s`, `δ₁ = arccos(cos δ)`; wrong convention squared `= (s + ℓ, δ)` | sound; R02 on the pieces |
| §2.4 time reversal | circle | `I T I (s, δ) = (s + ℓ − 2Rδ, δ) ≡ T⁻¹`; lifts differ by `τ_ℓ`: gaps `ℓ − 2Rδ ∈ (0, ℓ)` against `−2Rδ ∈ (−ℓ, 0)` | sound |
| §3.2 exactness, Jacobian | circle; ellipse `(2 cos u, sin u)` at `(2, 0)`, `δ = π/4` | `det = 1`; exit `u(5u/4 − 1) = 0`, point `(6/5, 4/5)`, `L = 4√2/5`, `τ₁ = (−8, 3)/√73`, `cos δ₁ = 11/√146`, `sin δ₁ = 5/√146`, `det = √73/5 ≈ 1.709`; sign: `S = −L` gives `−∂₁S = −cos δ = y`, `∂₂S = −cos δ₁ = Y` (I5.0's convention, read at the supplier) | sound |
| §3.3 `measurePreserving_billiardMap` | total map off `A`; ellipse | `μ(f⁻¹E) = μ(T⁻¹(E ∩ A)) = μ(E)`; density transport `(5/√146)(√73/5) = 1/√2 = sin(π/4)` | sound |
| §4.1 inverse of a twist | image curves `c_x` of verticals | `c_{x′}` right of `c_x` for `x′ > x`; on a vertical the lower part is right of `c_x`, so `(F⁻¹)₁(X₀, ·)` is strictly decreasing | sound |
| §4.2 generating function | shear at `(1, 2)`; standard map; shifted shear | `−∂₁h = ∂₂h = 1`, `S = 1/2`, wrong composite `(−3, 3)`; `(Y − y)dx + Y dY`; flux `c` | sound |
| §5.3 graph theorem and Lipschitz bound | shear; circular table; rotation with wavy curve | invariant graphs of the shear satisfy `ψ(x + ψ(x)) = ψ(x)`, constants; slopes `±1/(2R)`, graph constant `0`; `dx/dt = 1 − 0.8π < 0` for the non-twist | sound; hypotheses match Herman1983 lines 1150–1154 |
| §5.4 rotation numbers | circle `δ = π/3`, `2π/3`; `ψ₁ < ψ₂` | `1/3`, `2/3 = 1 − 1/3`; `g₁ < g₂` gives `≤` | R01 for the strict part |
| §5.5 rational curves | `δ = π/2`; `δ = π√2/2`; two fixed points | type `(1, 2)`; `qδ/π ∉ ℤ`; atomic measure not of full support | sound |
| §5.6 circular table | graph `ψ` with `ψ(s + 2Rψ(s)) = ψ(s)` | an irrational value of `ψ/π` has a dense orbit, so `ψ` is constant; sine graph: `cos(2(c + ε)) ≠ 1` | sound |
| §6.2 dictionary | `(1, 3)` equilateral; `(0, π/2, π)`; collapsed; `q = 0`; least period | `1/2 = 1/2`; `0 ≠ 1/√2`; `0 = 0` excluded by gaps; rejected by `0 < q`; `m < q` forces `(q/m) ∣ gcd(p, q)` | sound |
| §6.3 maximal orbit | run end with gap `0`, with gap `ℓ`; `(1, 4)`; `(0, 0, 0, ℓ)` | rates `1 − cos δ`, `1 + cos δ`, both `> 0`; square `4√2` against doubled diameter `8` of type `(2, 4)`; `W′(0+) = 2p(q − p)ℓ/q = 4ℓ/3` | sound |
| §6.4 `exists_two_periodic_orbits` | circle; ellipse `(1, 2)`; `Γ` | critical circle; `W = 8` and `4`; `Γ = ℤ²/⟨(q, −p)⟩ ≅ ℤ`, free: `s_{j+m} = s_j − nℓ` forces `q ∣ m` | sound |
| §8.1 singular set | square, slope `1` from `(1/2, 1/2)` and `(1/2, 1/4)`; `v_n` | reaches `(1, 1)`; line `y − x = −1/4` misses `ℤ²`; `v_n → (1 + i)/√2` regular limit | sound |
| §9.1 reflection group | square; equilateral; angle `π/√2`; flat vertex | orders `4`, `6`; rotation `√2π` of infinite order; `N ≥ 2` because two side directions differ | sound |
| §10.1 translation groupoid | `z + 3i`, `2z`, `conj z`, `−z`, two half-planes | derivatives `1`, `2`, none, `−1`; images `{Re < 0}`, `{Re > 1}` disjoint | sound |
| §10.3 flat area | torus; octagon; cone disc | `1`; `2(1 + √2)`; `k · π(r^k/k)²` finite, so the measure is finite; atom at a cone point excluded by `area(Σ) = 0` | sound |
| §11.2 cone angles | side chart; L-table; square with hole | `gσ_S x + g(x₀ − σ_S x₀) = g ρ_S(x)`, independent of `x₀` as `σ_S d = d`; `2n_v · πm_v/n_v = 2πm_v`; `6π` once; `6π` four times | sound |
| §11.3 Euler characteristic, genus | square, triangle, `π/8`, L, hole | `0, 0, −2, −2, −8`; genera `1, 1, 2, 2, 5`; `Σ_v (|G|/2n_v)m_v = (|G|/2)(n − 2 + 2h)` reconciles the two formulas | sound |
| §11.4 unfolding | well-definedness; `θ = 1`; `π/8` area; singular states | `(σ_S g)⁻¹ = g⁻¹σ_S`, glued to `g⁻¹` along `S`; two labels for `θ = 1`; `16 · tan(π/8)/2 = 8(√2 − 1)`, the octagon of apothem `1`; `Σ ∩ M_θ` maps into fixed leaves, so the conjugacy holds on all of `M_θ` | sound |
| §12.2 weak mixing ⇒ ergodic | invariant set of mass `r` | integrand `r − r²`, zero only for `r ∈ {0, 1}`; matches `ErgodicVAdd`'s field at the pin | sound |
| §12.3 Koopman continuity | no separability | averages `g_h` satisfy `‖U_t g_h − g_h‖ ≤ 2|t|‖f‖_∞/h`; `g_h → f` by differentiation along orbits and invariance; counting measure `√2` | sound |
| §12.4 `tendsto_average_norm_charFun_sq` | `0`, `δ₀`, `(δ₀ + δ₁)/2`, uniform | `0/0`, `1/1`, `1/2 / 1/2`, `0/0`; finite partial sums `≤ σ(ℝ)²` | sound |
| §12.4.1 `exists_tendsto_twistedAverage` | `e₁` on `AddCircle 1`; identity group; `v = 0` | `a = 1`: `w = e₁`, `‖w‖² = 1 = δ_{2π}({2π})`; `a = 0`: `w = 0`; identity, `a ≠ 0`: `(1 − exp(−2πiaT))/(2πiaT) → 0` | sound |
| §12.5 `isWeaklyMixing_iff` | one point; `e₁`; `a = 0` projection | `f = 1` constant; `e₁` nonconstant and the circle flow has residual `1/8`; `⟨1, P₀f⟩ = ⟨1, f⟩ = 0` makes a nonzero `P₀f` nonconstant; `|f|` constant by ergodicity puts every eigenfunction in `L²` | sound |
| §1.4, §3.1, §7.3 API | see the table of previous findings | as there | sound |

**Seeded source sample.** No locator is flagged unverified by the author.

| Target | Locator read | Outcome |
|---|---|---|
| 2.1 | BialyMironov2022 lines 154–161, Section 2, p. 4 | coordinates `(cos δ, s)` and the reflection law for positive curvature; the README says the `C^k` construction is its own. ChernovMarkarian2006 and KatokHasselblatt1995 waived. |
| 2.4 | KatokHasselblatt1995 §9.2 | waived; identity recomputed on the circle. |
| 3.2 | BialyMironov2022 lines 182–185, p. 4 | the identity `cos δ₁ ds₁ − cos δ ds = dL` is there. |
| 5.5 | BialyMironov2022 lines 116–119, p. 3 | an invariant measure and a rational rotation number give all orbits periodic; the README adds full support, which the argument needs. |
| 6.2, 6.3 | KatokHasselblatt1995 §9.3 | waived; dictionary and boundary variation recomputed. |
| 8.1 | ChernovMarkarian2006 Ch. 2; BoldrighiniKeaneMarchetti1978 §2 | waived; Fubini route and Checks recomputed. |
| 9.1 | MasurTabachnikov2002 §1 | uncertified; recomputed. |
| 10.1 | ChaikaForni2026 lines 168–176, Section 2, p. 5 | charts by integrating the differential off its zeros; the README owns the groupoid. |
| 10.3 | ChaikaForni2026 lines 83–88, p. 3 | flows and invariant Lebesgue measure; uniqueness is the README's. |
| 11.2, 11.3, 11.4 | MasurTabachnikov2002 §1; ZemlyakovKatok1975; KerckhoffMasurSmillie1986 | uncertified or waived; formulas recomputed on five tables. |
| 12.2 | Hochman2012 line 2439, printed p. 56 | discrete implication present. |
| 12.4 | Hochman2012 lines 3099–3140, Proposition 6.6.3, printed p. 70 | atomless discrete statement present; the README states the real-line form with atoms as its own. |

Also read: Herman1983 lines 149–155 (1.2, printed p. 5), 188–196 (2.2), 268–319 (2.4), 425–436 (3.4.3–3.4.4), 762–769 (4.3 Remarque, printed p. 27), 803–807 (5.2), 1128–1154 (Appendice, printed pp. 40–41); BialyMironov2022 lines 96–109 (Theorem 1.1) and 261–263 (Section 3, p. 6); ChaikaForni2026 lines 9–28 and 89–100; Hochman2012 lines 2474–2487, 2627, 2854–2855, 3076–3077, 3141–3143. Printed pages agree with the README's wherever it gives one.

**Pinned declarations opened** (Mathlib and Tau Ceti at the pins of the content checkout's manifest; paths relative to each library).

- `Mathlib/Dynamics/Circle/RotationNumber/TranslationNumber.lean`: `CircleDeg1Lift` 129, `translationNumber` 550, `translationNumber_units_inv` 638, `tendsto_translationNumber` 685, `translationNumber_mono` 695, `translationNumber_le_of_le_add` 704, `le_translationNumber_of_add_le` 707, `translationNumber_eq_rat_iff` 820 (needs continuity and `0 < n`).
- `Mathlib/MeasureTheory/Integral/IntervalIntegral/Periodic.lean`: `AddCircle.measure_univ` 69, `AddCircle.measurePreserving_mk` 91. `Mathlib/Topology/Instances/AddCircle/Defs.lean`: `AddCircle` 190, `equivIco` 306. `Mathlib/Analysis/SpecialFunctions/Complex/Circle.lean`: `homeomorphCircle'` 421.
- `Mathlib/MeasureTheory/Function/Jacobian.lean` 1184; `Mathlib/Dynamics/Ergodic/Conservative.lean` 63, 196; `Mathlib/Dynamics/Ergodic/Action/Basic.lean` 31 (`ErgodicVAdd`: a.e.-invariant measurable sets are null or conull); `Mathlib/MeasureTheory/Group/Arithmetic.lean` 456 (`MeasurableVAdd₂`); `Mathlib/MeasureTheory/Group/Defs.lean` 51; `Mathlib/MeasureTheory/Group/Action.lean` 178 (`measurePreserving_smul`, whose additive form is `measurePreserving_vadd`); `Mathlib/Dynamics/Flow.lean` 85.
- `Mathlib/Analysis/Calculus/ImplicitContDiff.lean` 41, 83; `Mathlib/Analysis/Convex/Strict.lean` 37; `Mathlib/Analysis/Convex/Hull.lean` 48; `Mathlib/Geometry/Manifold/StructureGroupoid.lean` 90, 275, 293; `ChartedSpace.lean` 141; `HasGroupoid.lean` 34, 93; `IsManifold/Basic.lean` 673; `Mathlib/Topology/Homotopy/Contractible.lean` 29; `Mathlib/Geometry/Polygon/Basic.lean` 29, 62, 72; `Mathlib/GroupTheory/SpecificGroups/Dihedral.lean` 31.
- `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean` 595, 606, 611, 615, 631; `Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean` 120; `Mathlib/Analysis/InnerProductSpace/Basic.lean` 107; `Mathlib/MeasureTheory/Measure/CharacteristicFunction/Basic.lean` 130, 134 (`charFun μ t = ∫ exp(⟪x, t⟫ I)`); `Mathlib/Analysis/InnerProductSpace/PiL2.lean` 853; `Mathlib/Analysis/InnerProductSpace/MeanErgodic.lean` 89 (one operator, not a group).
- `TauCeti/Geometry/Polygon/Simple.lean` 109, 483, 614, 767; `TauCeti/Topology/JordanCurve/Basic.lean` 107, 282; `TauCeti/Analysis/Complex/PlaneSeparation/Inside.lean` 190; `JordanCurve.lean` 175; `TauCeti/Analysis/Complex/Conformal/Jordan/Schoenflies.lean` 122; `PrimeEnd/Crosscut/TwoSides.lean` 137; `TauCeti/Analysis/Bochner/CharFun/Bochner.lean` 101; `TauCeti/Analysis/Semigroups/Group/Basic.lean` 74 (real-linear operators, no completeness in the carrier); `Unitary.lean` 107 (`IsUnitary`: every `U t` preserves the complex inner product), 154; `TauCeti/Probability/Ergodic/MeanErgodic.lean` 43; `TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean` 123; `MayerVietoris.lean` 93.

No pinned declaration proves a target: neither library has Wiener's lemma, a continuous-time mean ergodic theorem, a non-wandering set, twist maps, a billiard map or translation surfaces.

**Cross-roadmap citations resolved now** (main, or the open head for the one roadmap not on main).

- `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md`: C3.1 "Convex planar billiards" 527 (`v = ∂_sS`, `S = −‖χ(t) − χ(s)‖`, `∂_s∂_tS < 0`, measure of mass `2L`), `exists_billiard_periodic_reflection` 573, circle formula 575, chain dictionary 480, "Finite-volume recurrence" 583.
- `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md`: I5.0 426, convention `y = −∂₁S`, `Y = ∂₂S` 434; I5.4 623, cup-length bound 678–680.
- `TauCetiRoadmap/RiemannianGeometry/Surfaces/README.md`: §3.1 471, `integral_signedCurvature_add_sum_exteriorAngle_eq_two_pi` 489.
- `TauCetiRoadmap/GeometricTopology/README.md`: §1.7 1049 (genus at 1068), §2.3 1386 (`n + 1 ≤ 3` by Schoenflies).
- `TauCetiRoadmap/FactorRigidity/README.md`: §8.2 746 (kept-variant comparison).
- ProbabilisticAndMetricNumberTheory at its open head (a new roadmap folder, earlier in the merge order): §4.6 at line 5508, §4.9a at line 6320, strong continuity under continuity and regularity at 6364 (kept-variant comparison, not a supplier).

**Ownership and duplication.** Read the board package index (three packages, none on this subject) and searched, by object, main and the open heads for billiards, twist maps, non-wandering sets, translation surfaces, weak mixing, Wiener's lemma, mean ergodic theorems and Koopman groups. Billiards occur only in C3.1 (cited). Weak mixing occurs only in FactorRigidity §8.2 (cited as a different notion). Mean ergodic theorems occur for single maps only (`Completed/Exchangeability`, realised at the pin and cited through Tau Ceti; Equidistribution cites the same). A translation surface occurs once, as a specific noncompact example in OperatorTheory/UnboundedOperators §2. `OperatorTheory/SelfAdjointSpectralTheory` on main states no spectral-atom or eigenspace identity for unitary groups. IncompressibleFlows builds Koopman groups of continuous flows; it may not be cited as a supplier, and §12.3's jointly measurable case differs. No declaration of `Suggested.lean` has the fully qualified name of a declaration in another readable roadmap. The overlap report lists no changing pull request, no dropped id and no revision-only id; the five closest roadmaps (PlanarTopology, TeichmullerGeometry, ProbabilisticAndMetricNumberTheory, Equidistribution, PointProcesses) own none of this roadmap's objects. The board design HardSphereDynamicsAndKineticLimits treats the two-body problem as a billiard outside a ball and owns no polygonal or convex-table object.

**Supplier order.** No supplier gap is declared and none is needed. Output of the dependency check:

```text
depcheck: 237 roadmaps, 2139 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. No roadmap of the never-cite list is cited.

**Shape and style.** Summary, Scope and ownership, Conventions (each with a computed witness), Exact supplier contracts, How to read the build, twelve layers each ending with Examples and Dependencies, Downstream consumers, References. Every definition has an API list and at least three Checks. No LaTeX delimiters, no process words, no pull-request numbers, no machine paths, no `lemma`, no target tables. Remarks that need no change: `Suggested.lean` docstrings cite sources by section and page; the wording "pullback by every translation chart" in §10.3 is read as the image measure under the chart.

## Not verifiable

- `Tabachnikov2005` (Chapters 3, 7), `KatokHasselblatt1995` (§§9.2–9.3, Chapter 13), `ChernovMarkarian2006` (Chapter 2), `BoldrighiniKeaneMarchetti1978` (§2), `ZemlyakovKatok1975` (pp. 291–300), `KerckhoffMasurSmillie1986` (Theorem 1): settled as waived, no text. The statements resting on them were recomputed, not checked against the wording or numbering.
- `MasurTabachnikov2002` (§1) and `Birkhoff1927` (§§1–3): settled as uncertified, no text.
- Ownership against open pull requests was checked through the indexed heads only (`roadmaps grep`); a pull request outside that index was not sought.

## Source issues

- **Misprint** in Hochman2012 at Theorem 6.6.1, proof sketch, printed p. 68 (Hochman2012 line 3029): the source says the Fourier transform of the spectral measure takes real values; it should be complex values; affects nothing.
- **Gap** in Hochman2012 at Theorem 6.6.1, proof sketch, printed p. 69 (Hochman2012 lines 3065–3073): the source says polynomials in nonnegative powers of `z` are dense in the `L²` space of the spectral measure; it should use Laurent polynomials, since for Haar measure `z⁻¹` is orthogonal to them; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e5278607494a1b327f6829983dcc702c72c4aaa9", "job": "REV-PKG-MathematicalBilliards~2", "model": "fable", "worker": "chris-x10"} -->
