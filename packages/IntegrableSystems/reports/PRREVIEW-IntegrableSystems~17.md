# Review of IntegrableSystems (pull request #1651 at 8979daa)
Folder: `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/`
**Verdict:** accepted

Full review of both files at this head. The folder is byte-identical to the head `7046353` (the change set since then touches only the sibling CotangentLagrangian folder). No finding. What was checked, with its values, follows.

## Verified sound

**Gate and build.**
- The worker's gate at this head passes every check (`build=0`, `depcheck=0`, all scanners 0).
- My own run of the gate: every scanner 0 and `depcheck=0`; `outside-folder=4` names only `ConvexityToric/README.md`, `ConvexityToric/Suggested.lean`, `CotangentLagrangian/README.md` and `CotangentLagrangian/Suggested.lean`, the two sibling folders that are this pull request's own. The exclusion diff against `origin/main` is empty, and `lake-manifest.json` and `lean-toolchain` do not differ from `origin/main`.
- `lake env lean` of `Suggested.lean` from the worktree: exactly four `declaration uses sorry` warnings, at lines 73, 108, 123 and 151, and nothing else.
- Dependency check, no UPWARD, CYCLE or `moved:` line:

```
depcheck: 234 roadmaps, 2267 edges, 0 problem(s)
```

**Lean form.** One module docstring in the required form; namespace `TauCetiRoadmap.SymplecticGeometry.IntegrableSystems`; `import Mathlib` plus seven `TauCeti.*` modules, all present at the pin; no `set_option`, no sorry'd data, no `lemma`, no `example`. The two definitions (`strip`, `interiorFundamentalDomain`) have real bodies and are used only to state the I5 headline. `#check @` of the four theorems on a scratch copy gives the types of `signatures.md`; the section binders `FiniteDimensional ℝ E`, `I.Boundaryless`, `T2Space M`, `IsManifold I ∞ M` are present where the README states them, and `strict_annulus_two_fixed_points` takes no section variable. No other roadmap on main or at an open head declares any of the six names (`roadmaps grep --lean-only`).

**Padding probe.** On a scratch copy each `sorry` was replaced by `first | (simp; done) | rfl | infer_instance | (simp_all; done) | sorry`: all four theorems still report `sorry`, so none closes in one tactic. The pin was searched by object for each headline: no general action–angle theorem (only `TauCeti.oscillatorActionAngle` for the oscillator), no second-order or Legendre-transport statement in `Geometry/Symplectic/Cotangent/Bundle/Legendre.lean` (its last declarations are the Cartan forms and `mechanicalLagrangian`), no naturality lemma for `hamiltonianVectorField` under a local diffeomorphism in `Hamiltonian/Manifold.lean`, and no annulus fixed-point theorem.

**Headline theorems.** From the README: (I1) regular levels are Lagrangian; (I2) Liouville–Arnold, topological part and action–angle chart; (I2) global action–angle criteria with the Chern and Lagrangian classes; (I3) the Lagrangian field is second order and the Legendre map carries it to Hamilton's equations; (I4) conservation of angular momentum, Kepler action, spherical-pendulum monodromy; (I5) the strict annulus theorem. Stated: I2 chart, both I3 statements, I5. Proved at the pin and cited instead: I1, the topological I2, the I4 conservation law. Named in the docstring as not statable, with the missing carrier: the period-lattice bundle `Λ ⊂ T*B` and its classes, and the pendulum monodromy that transports it. The pin has only the stabilizer of one point (`Hamiltonian/LiouvilleArnold.lean:277`), so the reason stands.

**Sources read at their locators.**
- `lecalvez-wang` line 82: Theorem 1 on the second page of the article (p. 704), for an area-preserving homeomorphism of the closed annulus with the boundary twist condition of lines 77–78, conclusion at least two fixed points that lift to fixed points of the chosen lift. This is the lifted statement of `strict_annulus_two_fixed_points`.
- `cds` lines 4470–4482: Theorem 18.12 in §18.4, part (b) the action coordinates complementary to the angles forming a Darboux chart. The source assumes a regular value; the roadmap assumes only that the compact component `L` consists of regular points. That is the same theorem applied to an open neighbourhood of `L`: at a regular point the level is locally a connected disc, so `L` is open and closed in the level, and `M` minus the rest of the level and minus the critical set is an open set in which `L` is the whole level.
- `smale1959` line 15: Theorem B, first page (p. 621), as the README quotes it. `gramain1973` line 48: Théorème 1 on pp. 53–54.
- `egms` lines 155, 209, 289 (§II.A–C) and 497–555 (§III.B): three polar orbits, of which `P₀` and `P₋` cancel (lines 553–555), as the README says.

**Pinned declarations opened** (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`), each compared with the README sentence that cites it; 61 backticked library names of the README resolve, these were read in full:
- `Hamiltonian/Manifold.lean:124, :179, :338, :416, :541` (`IsHamiltonianVectorField`: σ(X x, v) = df(v); `hamiltonianVectorField` = (σ♭)⁻¹df, zero where the flat map is not invertible; `poissonBracket`; `IsNondegenerate.poissonBracket_eq_mvfderiv`; `SymplecticForm.poissonBracket_constSmooth`).
- `Hamiltonian/Integrable.lean:91, :172, :202, :234, :249, :280, :316` (`IsFirstIntegral`, `IsIntegrableSystem` with its four fields, `isLagrangian_ker_mfderiv`, `exists_eventuallyEq_comp`, `exists_eqOn_comp`, `comp_isLocalDiffeomorph`, `comp_left`).
- `Hamiltonian/Involutive.lean:102, :119, :208, :234` (`orthogonal_ker_mfderiv`, `isCoisotropic_ker_mfderiv_iff`, `two_mul_card_le_finrank`, `ker_mfderiv_eq_span_hamiltonianVectorField`).
- `Hamiltonian/Complete.lean:119`, `Hamiltonian/CommutingFlow.lean:185, :227`, `Hamiltonian/LiouvilleArnold.lean:260, :318, :360, :391`.
- `Cotangent/Bundle/Legendre.lean:121, :198, :247, :277, :451, :468, :510, :532, :549` and `Cotangent/Bundle/Liouville.lean:144, :279`.
- `Hamiltonian/CentralForce.lean:92, :104, :211, :283, :382`, `CentralForce/Kepler.lean:205`, `Oscillator/ActionAngle.lean:101`.
- `Manifold/Instances/AddCircle.lean:137, :258, :296, :388, :560, :624`, `DifferentialForm/AddCircle.lean:92, :125, :156, :201, :229`, `DifferentialForm/Torus.lean:90, :251`, `Orientation/Torus.lean:67`, `Orientation/AddCircle.lean:110`, `Instances/CircleFamily.lean:49, :58`, `Instances/CircleFamily/Pullback.lean:92, :213, :550`, `DifferentialForm/CircleFamily.lean:90, :125, :148, :246, :286, :313`, `DifferentialForm/CircleFamily/Pullback.lean:259`.
- `Manifold/RegularValue/ManifoldLevel.lean:257` (`exists_regularFiber_smoothEmbedding`), `Manifold/Instances/Quotient.lean:242, :253`; Mathlib `CircleDeg1Lift`, `properlyDiscontinuousSMul_iff_properSMul`, `ContinuousAlternatingMap.ofSubsingletonLIE`.

**Cross-roadmap citations resolved** (13): on main `2485dfb`, DifferentialGeometry Layers 0, 1, 3 (3.2, 3.3, 3.5) and 8.4 (README lines 268, 311, 371, 379, 388, 400, 845); SmoothBundlesConnections B1.0, B6.1, B6.6 (lines 221, 1375, 1811); CharacteristicClasses C1.2b (lines 599–652: Čech groups as the colimit over covers, homotopy invariance, the CW comparison with cup naturality and the closed-CW-pair version); AlgebraicTopology Stage 5 and Stage 6 (lines 849, 946, 1071: the absolute-relative module action); HamiltonianReduction R1 (line 33); the family index S0 (line 84); HopfRinow under `Completed/`; LieGroups under `RepresentationTheory/`. At this head: CotangentLagrangian C3 and C3.1 (lines 243, 274; the chain dictionary at 286–296, whose convention `p = d_1S` is the negative of I5.0's, as I5.0 says) and ConvexityToric Layer 1, 1.1 (lines 162, 164). None of the never-cite roadmaps is named.

**Overlaps and ownership.** One other open pull request (the Tau Ceti pin bump) changes this folder's `Suggested.lean`; the description's generated `merge-order` block orders this pull request first. No cited id is dropped by an open pull request, none is defined only by an open revision, and this pull request drops no cited id. Ownership against open pull requests was checked by object with `roadmaps grep` (action–angle, Liouville–Arnold, Poincaré–Birkhoff, second-order Lagrangian field, Euler–Lagrange): the other hits are VariationalMethods and RelativisticQuantumFieldTheory (functionals and fields, not the Legendre map of `TM`) and the two not-to-be-cited open roadmaps; this roadmap is on main and is the earlier owner. The description's IntegrableSystems paragraph agrees with the head.

**Adversarial pass.**

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| “Supplied by Tau Ceti”, I1 bullet | each sentence against the cited declaration; oscillator on ℝ² | `two_mul_card_le_finrank`: 2·card ι ≤ finrank E, i.e. k ≤ n; `isCoisotropic_ker_mfderiv_iff` is an iff with all brackets zero; `IsIntegrableSystem` fields: smooth, commuting, dense regular set, 2·card = finrank. Oscillator: regular set ℝ²∖{0} dense, 2·1 = 2 | agrees | none |
| “Supplied by Tau Ceti”, I2 bullet | hypotheses of `range_hamiltonianFlowAction_apply`, `quotientHamiltonianFlowStabilizerHomeomorph`, `compactSpace_quotient_…` | all three need complete fields on all of `M` (`hc`) and regularity of the component; README says “complete … fields” and keeps the complete-only-along-`L` case as its own target | agrees | none |
| “Supplied by Tau Ceti”, I4 bullet | Kepler: E = −mκ²/(2ℓ²) (circular) and E → 0⁻ | pin: I_r = κ√(m/(−2E)) − |ℓ| for −mκ²/(2ℓ²) ≤ E < 0; circular: κ·|ℓ|/κ − |ℓ| = 0. Inverting: H = −mκ²/(2(I_r+|ℓ|)²), Ω_r = mκ²/(I_r+|ℓ|)³, T = 2π(mκa)^(3/2)/(mκ²) = 2π√(m/κ)a^(3/2) with a = κ/(−2E) | agrees with README I4 | none |
| “Quotient and atlas” | action `n·t = t + np` at the pin; integers meeting [−R,R] twice | `PeriodLine` smul is `t + n.toAdd • p`; at most 2⌊2R/p⌋+1 integers n with |np| ≤ 2R, finite because p > 0 | agrees with `instProperlyDiscontinuousSMul`, `quotientHomeomorph`, `isLocalDiffeomorph_coe` | none |
| “Group, translations and time form” | circuit t ∈ [0,p]; uniqueness | `pathIntegral_timeForm_coe a b = b − a`, so p − 0 = p; `eq_timeForm_iff`: α = dt_p iff q_p^*α = dt | agrees | none |
| “Scaling” | p = 1, q = 2π; composition p→q→r | pin derivative p⁻¹q = 2π; pullback of dt_q is (q/p)dt_p; (r/q)(q/p) = r/p; θ = 2πt/p gives dt_p = (p/2π)dθ | agrees | none |
| “Finite products and open restrictions” | two factors swapped; empty index set; other-coordinate pullback | dt₂∧dt₁ = −dt₁∧dt₂ (`orientationSign_torusOrientation_reindex`); empty product a point, sign +1; `mpullback_update_torusTimeForm_of_ne` gives 0, `…_self` gives dt_(p_i), period p_i | agrees; open restrictions and point factors are not at the pin, as the section says | none |
| “The positive-period total family” | Q(p,t) = (p,[t]_p), deck t ↦ t+kp | η = pβ; Q^*η = dt − (t/p)dp; deck: d(t+kp) − ((t+kp)/p)dp = dt + k dp − (t/p)dp − k dp, equal; dη = dp∧β; Q^*dη = p⁻¹dp∧dt; total form dp∧η, Q^*(dp∧η) = dp∧dt | equal to the pin's theorems (`DifferentialForm/CircleFamily.lean`) | none |
| “Smooth parameter families and estimates” | k = 0, 1, 2 on |t| ≤ R, p ≥ ε; rescaling | ∂_p(t/p) = −t/p², ∂_p²(t/p) = 2t/p³, matching (−1)^k k! t/p^(k+1); bounds R/ε, R/ε², 2R/ε³ = k!R/ε^(k+1); rescale pulls η_q to (q/p)η_p (`mpullback_rescale_timeForm`) | agrees; the estimates are not at the pin | none |
| `exists_actionAngle` | oscillator n = 1, x₀ = (1,0); critical x₀ = (0,0); n = 0; f = p on ℝ² (non-compact); sign and period | (q,p) = (√(2I)sinθ, √(2I)cosθ): dq∧dp = −r sin²θ dr∧dθ + r cos²θ dθ∧dr = r dθ∧dr = dθ∧dI, H = I, X_H = (p,−q) clockwise so θ′ = 1 = ∂H/∂I. Critical point: H constant on a chart circle through 0 would put the circle in the level {0}. n = 0: U = {x₀}, D = ℝ⁰, image the one-point bundle, form clause on zero spaces. Line levels: a chart circle cannot lie in an open piece of a line. Canonical form: λ = ΣIᵢdθᵢ, ω = −dλ = Σdθᵢ∧dIᵢ; a chart with the opposite sign is repaired by I ↦ −I, D ↦ −D; period p from 2π by θ ↦ (p/2π)θ, I ↦ (2π/p)I | true as stated; hypotheses `IsSymplectic`, `T2Space`, `Boundaryless`, compactness and regularity of `L` all in the signature; the conclusion forces the torus through x₀ to be `L` (open and closed in it) | none |
| `mfderiv_proj_lagrangianVectorField` | L = ½mv² − V on ℝ; L = v (not regular); dim 0; wrong sign | ω_L = m dq∧dv, ι_X ω_L = m(a dv − b dq) = mv dv + V′dq gives a = v, b = −V′/m, so dπ(X_E) = v. L = v: θ_L = dq, ω_L = 0, flat map not invertible, pin's field is 0 ≠ v. dim 0: both sides 0. ι_Xω_L = −dE_L gives a = −v | true; regularity makes ω_L nondegenerate through `isLocalDiffeomorph_legendreMap_iff` (boundaryless in scope) | none |
| `mfderiv_legendreMap_lagrangianVectorField` | same L; L = e^v | FL(q,v) = (q,mv), dFL(v,−V′/m) = (v,−V′); H = p²/(2m)+V, X_H = (p/m, −V′) = (v,−V′) at p = mv. L = e^v: FL misses p ≤ 0, `hbij` fails, so the statement does not apply | true; `hbij` in the signature, H = E_L ∘ FL⁻¹ through `Equiv.ofBijective` | none |
| `strict_annulus_two_fixed_points`, `strip`, `interiorFundamentalDomain` | F = (x+(2y−1)/8, y); rigid rotation (x+1/4, y); ρ = 1+y; boundary points | Example: det = 1, F(x,0).1 = x − 1/8 < x, F(x,1).1 = x + 1/8 > x, fixed set y = 1/2, e.g. (0,1/2) ≠ (1/2,1/2) in the domain. Rotation: hlower fails (x+1/4 > x), no fixed point. Boundary fixed points excluded by the strict inequalities, so every fixed point has exactly one translate in [0,1)×(0,1). det = ρ(p)/ρ(Fp) > 0 | true; lifted form of Le Calvez–Wang Thm 1 after the I5.0 normalization | none |
| I5.0 normalization | ρ ≡ 1; ρ = 1+y | s = 1, a = 1, identity; s = 3/2, a = 3/2, v = (2y+y²)/3, a du∧dv = (3/2)(2+2y)/3 = 1+y; u(x+1) = u(x)+1 and u is increasing on each boundary line, so displacement signs transport | agrees | none |
| I5.1–I5.4 worked example | c = 1, K = 1 | N = (x − (6y+1)/8, y), N_Xy = −3/4; S₁ = −(2/3)(x−X)² + (x−X)/6 − 1/96, zero on X = x − 1/8 since −1/96 + 2/96 − 1/96 = 0; S₁₂ = 4/3 = −1/N_Xy; W(d) = −d²/6 − d/6 − 1/96 = 1/32 − (d+1/2)²/6; y₁ = −(4/3)d − 1/6 ∈ [0,1] iff d ∈ [−7/8,−1/8]; d′ = −2W′ = (2/3)(d+1/2); ẏ₁ = −(8/9)(d+1/2) = ∓1/3 at the two faces, outward; G = u − (6v+1)/8, root in (0,1) | every Check agrees with the formulas of its section | none |
| I2 period-lattice formula | oscillator H = νI | period 2π/ν; dI = (1/2π)(2π/ν)dc = dc/ν; Λ = 2π·ν⁻¹ℤ | agrees | none |
| I4 pendulum monodromy | `egms` §III.B | P₊ alone contributes; matrix [[1,1],[0,1]] fixes γ_J and sends γ₂ to γ₂+γ_J | agrees with the source | none |

**Shape.** The README keeps the family's section form (I1–I5 with `**Checks.**` blocks), which is the form of this roadmap on main; the I2.0 paragraphs are main's text, now preceded by the list of pinned declarations that implement them and by the statement of what remains to prove (open restrictions, point factors, families for several periods, the uniform estimates), none of which is at the pin.

**Declared gaps.** None declared, and the README has no `gap:` prerequisite.

## Not verifiable

- Arnold, *Mathematical Methods of Classical Mechanics*, §§49–50; Marsden–Ratiu, Ch. 7; Duistermaat 1980; Conley–Zehnder 1983; Epstein 1966, Thm. 6.4; Spanier, Ch. 6, §§6.6–6.9: recorded as uncertified in the manifest and cited by locator only. The statements that rest on them were checked by computation (the table above) and, for Liouville–Arnold, against `cds`.

## Source issues

- none
