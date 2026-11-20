# Review of IntegrableSystems (pull request #2691 at 3bea975)
Folder: `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/`
**Verdict:** needs changes

**Summary.** One finding blocks acceptance. The cup-length bound of §5.4 leaves out nonemptiness and is false for the empty space. The section's own negative control reaches that case, and MathematicalBilliards imports the bound word for word. This head repairs every finding of the previous round except the missing Duistermaat locator. There are four small corrections (a Hamiltonian conservation law credited to a HamiltonianReduction layer that does not state it, a downstream-consumer sentence that the HamiltonianReduction revision makes out of date, the Duistermaat locator, and a description sentence about anchors) and one format note on the generated merge-order block. One point is left to the human reviewers: Arnold's text and table of contents could not be read.

## R01 (P2) — The cup-length bound of §5.4 is false when S is empty, because the README sets the cup length of a space with no nonzero products to 0

As written, an implementer is asked to prove a false statement. MathematicalBilliards (on main, its supplier contract for this section, line 78) imports the bound in the same words. In the second bullet of §5.4 (lines 1103–1106) the bound reads: "a flow on a compact metric space S with a continuous Lyapunov function strictly decreasing along every nonconstant orbit has at least cl(Ȟ^*(S; ℝ)) + 1 rest points, where … (0 if there is none)". Take S = ∅. It is a compact metric space, every flow on it satisfies the Lyapunov condition vacuously, and Ȟ*(∅) = 0. So there is no nonzero product, cl = 0 by the stated convention, and the bound asks for one rest point where there are none. For nonempty S the case cl = 0 holds, because a point where the Lyapunov function attains its minimum on the invariant set S is a rest point. The same section's negative control for the injectivity lemma (lines 1124–1126) reaches Inv(P) = ∅, so the empty case is not hypothetical here. The headline is unaffected: Ȟ⁰(P) ≠ 0 and the injectivity lemma make Inv(P) nonempty.

The smallest repair is "on a nonempty compact metric space S". Setting cl(∅) = −1 would also work. The empty flow could then become a negative-control Check.

## C01 — §3.3 and the HamiltonianReduction contract credit a Hamiltonian conservation law to HamiltonianReduction Layer 1, which states none

A reader who follows the citation for the Hamiltonian side of Noether's theorem finds nothing there. §3.3 (lines 610–613) compares the Lagrangian law with "the Hamiltonian conservation law of HamiltonianReduction Layer 1". The supplier contract (lines 1354–1357) consumes "the cotangent-lift moment map … with its equivariance and conservation". HamiltonianReduction's Layer 1 at the head of its revision (#2690, lines 110–246) and its R1 on main (lines 33–70) record the cotangent-lift moment map and its equivariance only. Neither has a conservation or Noether statement. Tau Ceti `Geometry/Symplectic/Cotangent/Bundle/MomentMap.lean` (lines 84–171) has none either. The law is the one-line fact {⟨μ, ξ⟩, H} = −dH(ξ_M) = 0 for G-invariant H, which is Cannas da Silva Thm. 24.1 (`cds` line 5757, p. 147), already cited at that point.

The smallest repair: drop "and conservation" from the contract, and in §3.3 either state the Hamiltonian law as part of the target, with Cannas da Silva's locator, or drop "of HamiltonianReduction Layer 1".

## C02 — The downstream-consumer sentence on HamiltonianReduction §1a.3 describes a citation that the revision this README follows has dropped

The README cites HamiltonianReduction in the numbering of its revision (#2690) and merges after it. At that head, §1a.3 (lines 467–492) takes the period-1 circle directly from Tau Ceti (`AddCircle.instChartedSpace`, `AddCircle.instIsManifold`, `AddCircle.instLieAddGroup`). Its only mention of IntegrableSystems is its own downstream line (line 1862). Only R1a.3 on main (line 107) consumes I2.0. So after both merges, "HamiltonianReduction §1a.3 uses the period-1 torus of §2.0" (line 1172) names a use that no longer exists. Dropping that clause would fix it.

## C03 — §§2.6–2.7 still cite Duistermaat's paper with no section or theorem

A reader cannot find in a twenty-page paper the three results attributed to it: the vanishing criterion, the image of s^*σ and the global action–angle criterion. They are cited "(Duistermaat, 1980)" at lines 505 and 514. This is the one part of the previous round's locator remark that is still open. The section or theorem number at each claim would fix it.

## C04 — The description says the two inbound anchor links break, but the head keeps them

The description says "Two inbound anchor links no longer match a heading and land at the top of the README". The last commit adds explicit anchors `i20-positive-period-circles-and-families` (line 251) and `i3-hamiltonian-and-lagrangian-mechanics` (line 542). These are the targets of the links in the SymplecticGeometry README on main (lines 42 and 90) and LocalVariationalFieldTheory on main (lines 436 and 1167). Text that would be right: "The two inbound anchor links, SymplecticGeometry's to I2.0 and LocalVariationalFieldTheory's to I3, are kept by explicit anchors before §2.0 and Layer 3."

## N01 — The generated merge-order block says the pull request can merge as soon as it is approved, while the description's order paragraph says it merges after #2687 and #2690

The ids CotangentLagrangian Layer 3 and §3.1, and HamiltonianReduction Layers 1 and 3 and §1a.3, exist only at those two heads. The prose is right and the merge-order block and the depends-on block ("none") are not. The tools that generate those blocks would need to list the two revisions.

## Questions for the author

- §1.2's route rests on DifferentialGeometry §3.4 for commuting flows of commuting fields along maximal flows. That section cites Lee, Thm. 9.44, without stating the domain clause. Does it plan the rectangle form that §1.2 needs? Lee is recorded as uncertified, so I could not read the statement.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 Checks | H = (q²+p²)/2; F = q₁ on ℝ⁴ | dH rank 1 off 0, 0 at 0; X_(q₁) = −∂_(p₁) tangent to levels; 2·1 ≠ 4 | true | none |
| §1.2 rectangle commuting | p₁, p₂ on T*ℝ²; universal cover of ℝ²∖0 | both composites x + se₁ + te₂; routes via (1,−1), (−1,1) end on different sheets; (−1,0) → origin undefined | true; control valid | none |
| §1.3 normal form | {q₁,p₁}; oscillator near (1,0); `lmv` lines 243, 313 | {q₁,p₁} = dq₁(∂_(q₁)) = 1; clockwise θ: r dθ∧dr = dθ∧dI; Thm 2.1 p. 6, Rem 2.2 p. 8 (k = n) | true; locators right | none |
| §1.4 Williamson | qp, (q²+p²)/2, focus–focus pair, q²/2 | ±1, ±i, ±a±ib; (0,−q) nilpotent; Hess F_j(X_(F_i), w) = 0 from d{F_j,F_i} = 0; `miranda-zung` lines 101–156 | true | none |
| §2.0 circles, families | D_(p,2π); deck (p,t) ↦ (p,t+np) | ∫dθ = (2π/p)p = 2π (reversed gives p²/2π); dt − (t/p)dp invariant; −t/p², 2t/p³ | true | none |
| §2.1 compact component | Hausdorff now stated (line 370) | doubled-point counterexample of last round excluded; contract line 1275 matches pin `LiouvilleArnold.lean` 76–83 | true | none |
| §2.2 saturated nbhd | W ≅ L × D | C_y = W ∩ F⁻¹(y), compact so closed in Hausdorff fibre, open as W open; F\|_W ≅ pr_D proper; B1.5 hypotheses met | true | none |
| §2.3 smooth lattice | H = I²/2 on I > 0; F = (2I₁+I₂, I₂) | period 2π/√(2E) smooth for E > 0, blows up at 0; basis π(1,−1), 2π(0,1) | true | none |
| §2.4 `exists_actionAngle` | oscillator; origin; n = 0; F = p | (q,p) = (√2I sin θ, √2I cos θ) = pin `ActionAngle.lean` 101; dq∧dp = dθ∧dI; hreg fails at 0; hLc fails for lines | true; binders T2, FiniteDimensional, Boundaryless kept | none |
| §2.5 uniqueness (last R01) | A rows (1,1),(0,1), φ = I₁²/2 | (A^(−T)(dθ+Hφ dI))ᵀ∧A dI = dθ∧dI + dIᵀHφ∧dI = dθ∧dI (Hφ symmetric) | repaired | none |
| §2.5 periods | H = νI; H = I²/2; F = (2I₁+I₂, I₂) | dI = dH/ν; dI = dE/√(2E) matches I = √(2E); π(1,0) moves θ by (2π, π) | true | none |
| §2.6 Lagrangian vs Chern class | B6.6 convention −δ[t] (main line 2205) | naturality along Z¹ ⊂ C^∞(T*B): δ(Lagrangian class) = δ[t] = −c; Λ ⊂ Z¹ since spanned by 2π dIᵢ | true | none |
| §2.7 global criteria | T² → S¹; B = (1,2)×(0,3π) | p_φ = −θ pulls dφ∧dp_φ to dθ∧dφ; dφ closed, not exact; a(r,φ) = a(r,φ+2π) for φ ∈ (0,π) | true | none |
| §3.1 `mfderiv_proj_lagrangianVectorField` | L = ½mv² − V; L = v | ι_X(m dq∧dv) = dE_L gives (v, −V′/m), dπ = v; ω_L = 0 for L = v; −dE_L gives (−v, ·) | true | none |
| §3.1 `mfderiv_legendreMap_lagrangianVectorField` | same; L = e^v | dFL(v, −V′/m) = (v, −V′) = X_H at p = mv; e^v misses p ≤ 0, hbij fails; `cds` Thm 20.10 p. 123 | true | none |
| §3.2 conservation | F = q − tp, H = p²/2 | ∂_tF = −p, {F,H} = p, sum 0; opposite sign −2p | true | none |
| §3.3 Noether | L = ½mv², boost ξ = t | B = mq, J = mvt − mq, J̇ = mv̇t = 0; HR Layer 1 (#2690) and R1 (main): no conservation statement | true; attribution wrong | C01 |
| §4.1 oscillators, free particle | S = −m‖q−Q‖²/2t; Hᵢ = νᵢIᵢ | p = P = m(Q−q)/t, Q = q + tp/m; 2π diag(1/νᵢ)ℤⁿ; CotangentLagrangian #2687 3.0a: p = ∂_qS, P = −∂_QS | true | none |
| §4.2 central forces | V = −κ/r; V = (r−1)², ℓ = 0 | λ = p_r dr + L dθ; r₀ = ℓ²/(mκ), V″ = m³κ⁴/ℓ⁶; rest circle dH = 0, dL ≠ 0, rank 1 | true | none |
| §4.3 Kepler, oscillator | E = −mκ²/(2ℓ²); E = −½, m = κ = 1, ℓ = ½ | e = 0, I_r = 0; Ω_r = (−2E)^(3/2)/(κ√m) = 2π/T; e = √3/2, I_r = ½, a = 1, T = 2π | true | none |
| §4.4 pendulum monodromy | `egms` lines 143–151, 201, 513–552 | source loop (g(s), −s), dj/ds = −1: clockwise in (h,j); k = −1 there means +1 here; lift drops 2π | true; locator p. 10 right | none |
| §5.0 normalization, conventions | ρ ≡ 1; ρ = 1+y; shear R_c | identity; s = a = 3/2, v = (2y+y²)/3, a du∧dv = (1+y)dx∧dy; y = Y = (X−x)/c | true | none |
| §5.1 factorization, Moser | F = (x+(2y−1)/8, y), c = 1, 1/8; ρ = 1+ε sin 2πx | N_Xy = −3/4 vs +1/8; S₁(1/8) = 0, S₁₂ = 4/3; b = ε(1−cos 2πx)/2π; +β doubles defect | true; Smale Thm B p. 621, Gramain Thm 1 pp. 53–54 | none |
| §5.2 action | K = 1, d = x₂ − x₁ | W = 1/32 − (d+½)²/6; y₁ = −(4/3)d − 1/6 ∈ [0,1] iff d ∈ [−7/8, −1/8]; d = −½ gives y₁ = ½ | true | none |
| §5.3 faces | K = 1; general face | ḋ = (2/3)(d+½), ẏ₁ = −1/3 and +1/3, outward; S₁₁ = −S₁₂B′ makes ẏ_k = S₁₂(−B′Y_(k−1) − y_(k+1)) | true | none |
| §5.4 cup-length bound | S = ∅; height on S¹; K = 1 | ∅: cl = 0 by stated convention, bound 1, rest points 0; S¹: 2 = 1+1; circle of rest points | false at ∅ | R01 |
| §5.4 pair, cup module | K = 1 | G = u − (6v+1)/8, root in [1/8, 7/8]; Ȟ¹, Ȟ²(P,L) ≅ ℝ; Koszul −1; flow ẏ = 1: Ȟ*(P,L) = 0, Inv = ∅ | true | none |
| §5.5 `strict_annulus_two_fixed_points` | shear; rotation x + ¼ | det 1, fixed (0,½), (½,½) in domain; rotation fails hlower; `lecalvez-wang` line 82 for ρ ≡ 1 | true | none |
| Duistermaat headline; pendulum monodromy | pins searched | only pointwise stabilizer and global period-map lattice families; no lattice bundle Λ ⊂ T*B, no Z¹/Λ | not statable; docstring says so | none |
| Downstream consumers | HamiltonianReduction #2690 §1a.3 | uses Tau Ceti `AddCircle` instances, no IntegrableSystems citation; main R1a.3 line 107 does cite I2.0 | out of date | C02 |

- Earlier findings: R01 repaired (line 475); R02 repaired, since the layered ids are cited and the description names #2687 and #2690; C01, C02 (lines 1223–1224, anchors 251 and 542), C04, C05, C06, C07 and N01 repaired; C03 partly (Duistermaat, now C03).
- Source locators read: `lmv` Thm 2.1 (line 243, p. 6) and Rem 2.2 (line 313, p. 8); `miranda-zung` §§2.1–2.3 (lines 101–169, pp. 3–4); `cds` Thm 18.12 (lines 4470–4483), Thm 20.10 (line 4991, p. 123), Thm 24.1 (line 5757, p. 147); `egms` §II.A (lines 134–206), §III.A (lines 459–489), §III.B (lines 497–556, p. 10); `lecalvez-wang` Thm 1 (lines 75–82); `smale1959` Thm B (lines 15–17); `gramain1973` Thm 1 (lines 48–64).
- Library: 139 dotted names checked at the pins. 96 resolved by `#check` against the pinned libraries; 43 in modules with no object file, read at their declarations with namespace, among them `CentralForce/Integrable.lean` 156, `Oscillator/ActionAngle.lean` 101, 212, 226, `Cotangent/Bundle/MomentMap.lean` 84, `Orientation/Prod.lean` 112, `Instances/CircleFamily/Pullback.lean` 92. Hypotheses opened: `LiouvilleArnold.lean` 76–83, 260; `Complete.lean` 119; `Integrable.lean` 249, 280, 316.
- Cross-roadmap citations resolved on main: DifferentialGeometry 3.2–3.5 (3.4 at line 1308), Layers 0, 1, 4 and 8.4; SmoothBundlesConnections B1.0 (266), B1.5 (750), B6.1 (1710), B6.6 (2196); AlgebraicTopology 2.6, 5.1, 6.2; CharacteristicClasses 1.2b (715); ConvexityToric 1.1 (206); HopfRinow Layer 1 (Completed, 264); SymplecticGeometry S0 (84); RepresentationTheory/LieGroups. At open heads: CotangentLagrangian #2687 Layer 3 (688), 3.0a (727), 3.1 (807); HamiltonianReduction #2690 Layer 1 (110), 1a.3 (467), Layer 3 (1147). Contract titles match main's C3, C3.1, R1 and R3.
- Automatic checks: every check passed on the worker's run and on mine. Dependency check: `depcheck: 182 roadmaps, 2070 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives exactly four `declaration uses sorry` warnings (lines 75, 110, 125, 153). The elaborated types of all six declarations match the README statements, with no lost binder. The one-tactic probe (`rfl`, `simp`, `trivial`, `infer_instance`) closes none of the four.
- Description against the head: 52 Checks counted; the `Suggested.lean` diff against main changes comments only; the supplier list is unchanged from main; every sentence holds except the anchor sentence (C04).
- Ownership: this roadmap owns Liouville–Arnold without completeness, Duistermaat's symplectic obstruction (SmoothBundlesConnections B6.6 leaves it here), Lagrangian mechanics (HamiltonianSystems #480 excludes it, its lines 548–552) and the annulus theorem. A search of the open heads and main for Poincaré–Birkhoff, Liouville–Arnold, action–angle, Williamson, Carathéodory–Jacobi, Duistermaat and Runge–Lenz found no other owner.

Overlap check: read SymplecticGeometry (main and #2696), HamiltonianSystems (#480), CotangentLagrangian (main and #2687), HamiltonianReduction (main and #2690), DGFloer (#1798), MathematicalBilliards (main). Shared objects and their owners:
- Generating functions and the chain dictionary: CotangentLagrangian, cited here.
- The cotangent-lift moment map: Tau Ceti, recorded by HamiltonianReduction Layer 1 and cited here.
- The Hamiltonian Noether law: stated by HamiltonianSystems' moment-map item and not owned here (C01).
- Positive-period circles: owned here (§2.0) and consumed by SymplecticGeometry S0.
- Compact-pair Čech continuity and the cup-length bound: owned here (§5.4) and consumed by MathematicalBilliards.

Nothing else is shared.

Source independence: 10 passages compared with 7 sources (`lmv` Thm 2.1, `miranda-zung` §§2.1–2.2, `cds` Thms 18.12, 20.10, 24.1, `egms` §§II.A and III.B, `lecalvez-wang` Thm 1, `smale1959` Thm B, `gramain1973` Thm 1). None is shared beyond one-line statements forced by the mathematics; the longest run is 5 words of Smale's Thm. B. The largest shares are arnold-mmcm and `cds`, 4 of 27 locators each. Contents compared with `cds` (Parts VII–IX, §§18–24): independent, since Williamson, Duistermaat, monodromy and the annulus theorem have no counterpart there. The arnold-mmcm contents could not be read.

Research link: Layer 2 states the Liouville–Arnold theorem and Duistermaat's 1980 global obstructions, whose spherical-pendulum monodromy Efstathiou–Giacobbe–Mardešić–Sugny (2017) compute by rotation forms. Layer 1 uses Miranda–Zung's (2003) nondegeneracy and Williamson types. Layer 5 proves the Poincaré–Birkhoff theorem (Le Calvez–Wang 2010) by the Conley–Zehnder (1983) route. This line rests on the README and on `egms`, `miranda-zung` and `lecalvez-wang`.

## Not verifiable

- Arnold, *Mathematical Methods of Classical Mechanics*, §§49–50 and Ch. 2: recorded as uncertified. The publisher's contents page redirects to a login.
- Marsden–Ratiu Chs. 7 and 11; Duistermaat 1980; Conley–Zehnder 1983; Epstein 1966, Thm. 6.4; Spanier Ch. 6, §§6.6–6.9: recorded as uncertified and cited by locator only.
- The domain clause of Lee, Thm. 9.44, behind DifferentialGeometry §3.4: uncertified.

## Source issues

- **Misprint** in egms at §III.A, p. 9: the source says the momentum J = q₁p₂ − q₂p₁ rotates (q₁, q₂) clockwise and (p₁, p₂) counterclockwise; it should rotate both planes in the same sense, as the cotangent lift of a rotation does; affects nothing.
- **Misprint** in egms at §III.B, p. 11: the source says the polar orbits P₀ and P₋ belong to F(Π₊); both have q₃ = −1, so it should be F(Π₋); affects nothing.

## For the human reviewers

- Not tested: arnold-mmcm, which ties for the largest share of locators (4 of 27, with `cds`), could not be read, nor could its table of contents (uncertified; the Springer contents page needs a login). So wording and arrangement were not checked against it.
