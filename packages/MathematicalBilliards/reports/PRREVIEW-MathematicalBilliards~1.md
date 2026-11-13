# Review of MathematicalBilliards (pull request #2255 at 5b627bb)

**Verdict:** needs changes

## R01 (P3) — The description says the README names no roadmap in an open pull request of ours

**Location:** pull request description, "Dependencies" paragraph: "In open pull requests of ours: none. Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim:** The README cites, by name and section, a roadmap that is neither on main nor a consumer.

**Witness:** `TauCetiRoadmap/MathematicalBilliards/README.md` line 13 cites ProbabilisticAndMetricNumberTheory §4.9a and §4.6; that roadmap exists only at the head of open pull request #1421 (`TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md` lines 6319 and 5507), not on main.

**Repair:** Replace the two sentences by: "In open pull requests of ours: ProbabilisticAndMetricNumberTheory, whose §§4.6 and 4.9a the Scope section names for comparison with §12.3; no target consumes them. Roadmaps on main are cited by name; ClassicalErgodicTheory and the downstream roadmaps are consumers, not prerequisites."

## Verified sound

| Statement | Instances and values computed | Source or pin read | Result |
|---|---|---|---|
| Conventions: cross product, orientation | `1 × i = 1`; circle `R exp(is/R)`: `τ × (γ(t) − γ(s)) = R(1 − cos((t−s)/R))`, `2R` at `πR`; clockwise `−2R` | — | agrees |
| §1.2 curvature criterion | `h′(t) = sin(θ(t) − θ(s))`, positive on `(s, s′)`; limaçon `Im(conj γ′ γ″) = 9 + 6 cos u`, turning `4π` | BialyMironov2022 lines 96–98, 149–153 | agrees |
| §1.5 smooth tables and C3.1 (sample) | unit circle ↦ `(cos s, sin s)`, meets `x = 1` at `s ≡ 0` only | CotangentLagrangian README lines 527–530, 569–573; its `Suggested.lean` lines 246–251; BialyMironov2022 lines 159–164 | hypotheses match |
| §2.1 lift and map (sample), `billiardLift` | unit circle `(0, π/2)`: `e = −1`, `e × (γ(t) − 1) = −sin t ≥ 0` on `[π, 2π)`, `sInf = π`, `δ₁ = π/2`; `δ = 0`: `s₁ = s`; `δ = π`: `∅`, `0` | BialyMironov2022 lines 154–161 | agrees |
| §2.2 derivatives | `∂Φ/∂δ = −L`, `∂Φ/∂s = sin δ − κL`, `∂Φ/∂s₁ = sin δ₁`; circle `2R` and `1`; `C¹` table one-sided `1` and `7` | — | agrees |
| §2.3 closed cylinder (sample) | circle `(s + 2Rδ, δ)`: identity at `0`, shift `2πR = ℓ` at `π`; flat point `δx = cx⁴`, `x ∼ δ^{1/3}` | KatokHasselblatt1995 not readable | computed side agrees |
| §2.4 time reversal | `I F I (s, δ) = (s + ℓ − 2Rδ, δ) = τ_ℓ F⁻¹`; `Λ(I T(0, π/3)) = (exp(11πi/6), 1/2) = R Λ(0, π/3)`; `Λ(T(0, π/3)) = (−i, −1/2)` | BialyMironov2022 lines 172–176 | agrees |
| §3.1 chord length (sample) | circle `L = 2R sin((s₁−s)/2R)`: `∂₁L = −cos δ`, `∂₂L = cos δ`, mixed `sin δ/(2R) = sin²δ/L` | BialyMironov2022 lines 159–161, 182–185 | agrees |
| §3.2 exactness, Jacobian (sample) | ellipse from `(2, 0)`, `δ = π/4`: exit `(6/5, 4/5)`, `L = 4√2/5`, `cos δ₁ = 11/√146`, `det = √73/5 ≈ 1.709`; circle `1` | BialyMironov2022 lines 182–185 | agrees |
| §3.3 `ConvexTable.measurePreserving_billiardMap` | `dc/ds = e × τ(s) = −sin δ`; circle Jacobian of `Λ` is `sin δ`; pieces off `A`: `(π, 2π)` gives `(s, s₁′]`, inf `s`; `(0, 5π/2) ↦ (π, π/2)`; mass `2ℓ` | `AddCircle.measure_univ` (Periodic.lean:69), `measurePreserving_mk` on `Ioc` (line 91) | true as stated; measurable piecewise |
| §4.1 `IsTwistLift` | shear positive, inverse `(x − y, y)` decreasing; in general the preimage of a vertical is a graph over `[f_b⁻¹X, f_a⁻¹X]`, decreasing; rotation fails | Herman1983 lines 149–155 | agrees |
| §4.2 area and exactness (sample) | shear `F*(y dx) − y dx = y dy`, `h = (X−x)²/2`, `(−∂₁h, ∂₂h) = (1, 1)` at `(1, 2)`, wrong composite `(−3, 3)`; flux of `(x+y, y+c)` is `c` | Herman1983 lines 762–769, printed p. 27 | agrees |
| §4.4 `nonwanderingSet` | `(x, y²)`: boundary circles only; `x + 1` on `ℝ`: empty; `T̄`: all of `Ā` | Herman1983 lines 425–438; CotangentLagrangian README lines 583–591 | agrees |
| §5.2–5.3 `isGraph_of_isRotationalInvariantCurve` | non-graph curve: `dx/dt = 1 + 0.8π cos 8πt < 0`, invariant under `x + 1/4` (no twist); `(−x − y, y)` has lifts with `−(1, 0)` | Herman1983 lines 1130–1154, printed pp. 40–41: orientation, deviation, relative compactness, invariance, non-wandering all present | hypotheses match |
| §5.3 `ConvexTable.exists_lipschitzWith_of_isRotationalInvariantCurve` | circle: slopes `1/(2R)` and `−1/(2R)`, graphs constant, `0 ≤ 1/(2R)` | Herman1983 lines 190–193, 803–807; BialyMironov2022 lines 261–263 (p. 6) | agrees |
| §5.4 rotation numbers (sample) | `ρ(δ = c) = 2Rc/ℓ = c/π`; `1/3`, reversal `2/3`; `α = √2/2`, `q = 7`, `p = 5`: `p − qα = 0.0503`; pair with fixed points: both `0` | Herman1983 lines 277–319, printed pp. 10–11 (2.4.4 assumes Lebesgue measure); `translationNumber_pow` (TranslationNumber.lean:643) | agrees |
| §5.6 circular table (sample) | invariant graph: `ψ(s + 2Rψ(s)) = ψ(s)`; a value with `ψ/π` irrational has dense orbit, so `ψ` is constant; perturbed curve: `cos(2(c + ε)) ≠ 1` | Tabachnikov2005 not readable | computed side agrees |
| §6.1 configurations (sample) | `σ^m d^n` fixing `s` forces `mp = −nq`, so `(m, n) = t(q, −p)`: free; `(2, 3)`: gaps `4π/3`, `W = 3√3`; `(1, 2)`: `W = 2L` | KatokHasselblatt1995 not readable | computed side agrees |
| §6.2–6.4 `ConvexTable.exists_two_periodic_orbits` | equilateral: `1/2 = 1/2`; `(0, π/2, π)`: `0` vs `1/√2`; ellipse `(1, 2)`: `W = 8`, `4`; collapsed `(0, 0, ℓ)`: `W′(0+) = 2p(q−p)ℓ/q = 4ℓ/3`; `(2, 4)` from `(1, 2)` | IntegrableSystems README lines 679–681 (`cl + 1` rest points) | agrees |
| §7.1 polygonal carrier (sample) | angle sum `(n₀ − 2)π + Σ(nᵢ + 2)π = (n − 2 + 2h)π`; holed square `8π`; disjoint or triply nested triangles admit no such `P` | `TauCeti.SimplePolygon` (Simple.lean:767), `Polygon.IsSimple` (line 109); ChernovMarkarian2006, BoldrighiniKeaneMarchetti1978 not readable | determines `P` |
| §7.3 corner bound | open interval of length `π` holds at most `⌈π/α⌉` rays at spacing `α`: `π/2`: 2; `2π/3`: 2; `3π/2`: 1; `π/2 − ε`: 3 | Tabachnikov2005 not readable | agrees |
| §8.2–8.3 polygonal flow (headline, README only) | square `((1/2, 1/2), 1)`: wall at `1/2`, direction `−1` at `1`, back at `2`; `J F¹ J = F⁻¹` there; line `y − x = −1/4` misses `ℤ²` | — | agrees |
| §9.1 reflection group (sample) | square `{±1, ±conj}`, order 4; triangle directions `0, π/3, 2π/3`: order 6; angle `π/√2`: rotation by `π√2`, infinite order | `DihedralGroup` (Dihedral.lean); MasurTabachnikov2002 not readable | agrees |
| §9.2–9.3 angle criterion, non-ergodicity | pentagon `3π/5`: `N = 5`; hexagon: `N = 3`; `f = Re((conj d · v)^N)`: `σ_d` conjugates, rotation by `2π/N` fixes; `N = 1`: `Re v` flips under `−conj` | — | agrees |
| §10.3 flat area | `∫₀^r 2πρ^{2k−1} dρ = πr^{2k}/k`; `k = 3`: `3πρ²`, eight sectors of angle `3π/4`; wrong forms `π(3ρ)^{2/3}`, `9πρ²` | ChaikaForni2026 lines 83–88 | agrees |
| §10.5 flat tori (sample) | `Λ ∩ {|z| < r} = {0}`; `2ℤ + 2iℤ`: area 4; a `k = 1` cone chart is a translation off one point, hence everywhere | `hasGroupoid_smulGroupoid_quotient_subgroup` (SMulGroupoid.lean:299: properly discontinuous, cancellative, T2, locally compact) | agrees; source not readable |
| §11.3 Euler characteristic (sample) | square `4 + 4 − 8 = 0`; triangle `6 + 3 − 9 = 0`; `π/8`: `16 + 6 − 24 = −2`; L: `−2`; holed square `−8`, `4·2 = 8 = 2·5 − 2`; `−χ = Σ(|G|/2n_v)(m_v − 1)` rederived | `TauCeti.eulerChar` (FiniteCWType.lean:123), Mayer–Vietoris (line 93); GeometricTopology README line 1068 | agrees; sources not readable |
| §11.4 unfolding (headline, README only) | `(hσ_S)⁻¹θ = σ_S h⁻¹θ`, identified in `Z_P`; mass `|K_θ||G·θ| area P = |G| area P`; square `θ = 1`: `K = {1, conj}`, quotient `(ℝ/2ℤ) × (0, 1)` | — | agrees |
| §12.1 `IsWeaklyMixing` | half-torus overlap `|1/2 − t|`, mean of `||1/2 − t| − 1/4|` is `1/8`; trivial two-point `1/4`; one point `i − i = 0`, reversed order `−2i` | Hochman2012 lines 2474–2487 | agrees |
| §12.2 weak mixing implies ergodicity (sample) | invariant `A`: constant integrand `μ(A) − μ(A)²`, zero only for `μ(A) ∈ {0, 1}`; `1/2` gives `1/4` | Hochman2012 line 2439, printed p. 56 (ℤ, by the product factor) | agrees |
| §12.3 `continuous_compMeasurePreserving_vadd` | `‖U_t A_h f − A_h f‖ ≤ 2|t|‖f‖/h`; counting measure on `ℝ`: `‖1_{−t} − 1_{0}‖ = √2` | `Lp.compMeasurePreserving_continuous` (line 54) needs `C(X, Y)` on R₁ spaces: not this statement | true; not in the library |
| §12.4 `tendsto_average_norm_charFun_sq` (sample) | `δ₀`: 1; `(δ₀ + δ₁)/2`: `(1 + cos t)/2 → 1/2 = 1/4 + 1/4`; Lebesgue on `[0, 1]`: `(2 − 2cos t)/t²`, `4/π²` at `π`, limit 0 | Hochman2012 lines 3099–3140, printed p. 70 (atomless, discrete); `charFun` (Basic.lean:130) | agrees |
| §12.4.1 `exists_tendsto_twistedAverage` | `v ∈ E_a`: `⟨v, U_t v⟩ = exp(2πiat)‖v‖²`, the transform of `‖v‖² δ_{2πa}`; `e₁`: `A_N⁰ = 0`, `A_T¹ = e₁`; `‖A_T^a v‖² = ∫|K_T(ξ − 2πa)|² dσ` | `StronglyContinuousGroup` (Basic.lean:74), `IsUnitary` (Unitary.lean:107); Hochman2012 lines 3076–3096 | agrees |
| §12.5 `isWeaklyMixing_iff` | (⇐) `a = 0` indicators give ergodicity, then `|f|` constant, `L²`, atoms; (⇒) `a ≠ 0`: `∫f = 0`, atom at `2πa`; `f = 0` is constant | Hochman2012 lines 2854–2855, 3141–3143; ChaikaForni2026 lines 95–100 | both directions hold |
| §12.5 `ergodicVAdd_prod_of_isWeaklyMixing` | `X` a point: product is `Y`; `X = Y = AddCircle 1`: `e₁(x) conj e₁(y)` invariant, `|c₁ − α| = 1`; `Y` trivial two-point: fails | Hochman2012 line 2627, printed p. 59; `ErgodicVAdd` (Action/Basic.lean:31) | agrees |
| §12.6 tori and rational tables | `λ*` off `ℝθ` and `θ^⊥`: `rλ* ≠ λ*`, `⟨rλ*, θ⟩ = ⟨λ*, θ⟩`; square `θ = 1`: `exp(πiu)`, eigenvalue `1/2` | — | agrees |
| Pull request description (R01) | README line 13 names ProbabilisticAndMetricNumberTheory §§4.6, 4.9a | that README at the head of #1421, lines 5507, 6319; absent from main | description contradicted |

- Source locators checked against the text: 33 passages in 4 sources (BialyMironov2022 9, Herman1983 10, Hochman2012 8, ChaikaForni2026 6); pages and line ranges agree.
- Library declarations opened at the pins: 53 in Mathlib and 25 in Tau Ceti, every name of the supplier contracts; all exist in the files cited.
- Cross-roadmap citations resolved: 12 (CotangentLagrangian C3.1 twice and `exists_billiard_periodic_reflection`, IntegrableSystems I5.0 and I5.4, RiemannianGeometry/Surfaces §3.1, GeometricTopology §§1.7 and 2.3, FactorRigidity §8.2, ProbabilisticAndMetricNumberTheory §§4.6 and 4.9a, ClassicalErgodicTheory §§3.2 and 3.5).
- Gate: every check 0, build passes; no change outside the folder. Dependency check: `depcheck: 207 roadmaps, 1896 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: nine `sorry` warnings, nothing else. One-tactic probe (`simp`, `rfl`, `infer_instance`, `exact?`) on a scratch copy: none of the nine theorems closes. The 18 elaborated signatures compared with the README: no binder lost, same generality.
- Headlines: nine stated; the four polygonal ones (flow, non-ergodicity, unfolding, genus) are named as not statable in the module docstring, lines 34–50.
- Overlap check: read ClassicalErgodicTheory, PlanarTopology, TeichmullerGeometry, RiemannianGeometry, IntegrableSystems, CotangentLagrangian, ConformalMapping; nothing shared (ClassicalErgodicTheory cites §§8.2–8.3 and 12.1–12.5 here as owner; C3.1's billiard map is the `k = ∞` case, compared in §2.5).
- Source independence: 18 passages compared with 4 sources, none shared; largest share BialyMironov2022, 16 of 90 locators; contents compared with BialyMironov2022: independent; the seven waived or uncertified sources (47 locators) could not be read.

## Not verifiable

- §2.3, §6.1 and the other KatokHasselblatt1995 locators (Sections 9.2, 9.3, Chapter 13): settled as waived in the manifest, no text in the sources cache.
- §5.6, §1.1, §1.3, §7.3 (Tabachnikov2005, Chapters 3 and 7): waived, no text; whether the circular table is in Chapter 3 rather than an earlier chapter was not confirmed.
- §7.1, §7.2, §8.1–8.3 (ChernovMarkarian2006, Chapter 2; BoldrighiniKeaneMarchetti1978, Section 2): waived, no text.
- §9.1, §9.2, §10.5, §11.1–11.4 (MasurTabachnikov2002, Section 1): uncertified, cited by locator only.
- §11.3 (ZemlyakovKatok1975, pp. 291–300) and §11.4 (KerckhoffMasurSmillie1986, Theorem 1): waived, no text.

## Source issues

- none

## For the human reviewers

- Licence: Hochman2012 (README line 976) is unpublished lecture notes on the author's page; Layer 12 cites it for the `ℤ`-action analogues of §§12.1–12.5.
- Not tested: wording and arrangement were not compared with the seven waived or uncertified sources (47 of 90 locators); Layers 7–11 cite, besides ChaikaForni2026, only these.
