# Review of IntegrableSystems (pull request #2691 at bf1b893)
Folder: `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/`
**Verdict:** accepted

**Summary.** Accepted: no stated result was found false, unsupported or unowned, and the four headline theorems that are statable are stated and elaborate. The head is the one the previous review read, so this is an independent full pass: every Check was recomputed, and the cited sources were read at their locators. There are two small corrections (§1.2 and §2.6 use flows and sheaf identifications that need the Hausdorff hypothesis Convention 1 promises to carry; the collar cut-off of §5.1 works only for a suitably slow profile, not by thinness) and three format notes, none blocking. One point is left to the human reviewers: Arnold's text could not be read.

## C01 — §1.2 and §2.6 need a Hausdorff manifold, and Convention 1 says such statements carry the hypothesis, but neither does

A reader who takes Convention 1 at its word ("a statement that needs either hypothesis carries it", line 67) reads §1.2 and §2.6 as holding on every manifold of the family's model, and an implementer finds the gap only at the first uniqueness lemma.

In §1.2 (line 154), "the maximal flows of X_f and X_g" do not exist without separation: on the cotangent bundle of the line with a doubled origin, with σ = dq ∧ dp and f = p, the field X_f = ∂_q has two maximal integral curves through (−1, 0), one through each origin. In §2.6 (line 489), take M = (circle with one point doubled) × ℝ, σ = dθ ∧ dp, π = p: it is a proper surjective submersion with compact connected Lagrangian fibres, so it meets the definition, yet its fibre is not a torus and the vertical flows that define Λ are not unique. §2.6 also identifies H²_dR(B) with H¹(B; Z¹) and uses Čech H¹ as sheaf cohomology; both rest on Ω¹ being fine (`sjamaar2011` line 371), that is on partitions of unity on B.

Writing "Hausdorff symplectic manifold" in the first sentence of §1.2, and "Hausdorff symplectic manifold … onto a Hausdorff second-countable smooth n-manifold B" in the definition of §2.6, as §§2.1–2.2 already do, would settle it.

## C02 — In §5.1 the interpolation with the identity near the boundary of the square is a diffeomorphism only for a slowly falling cut-off; thinness of the collar does not give it

The route sentence "its convex combination with the identity has positive determinant along the boundary and, cut off to a thin collar, stays a diffeomorphism" (lines 896–898) would lead an implementer to take a standard bump and shrink the collar, which fails.

In (tangent, normal) coordinates (s, n) write h = (s + a n + O(n²), b n + O(n²)) with b > 0, and H = h + χ₀(n/ε)(id − h). With u = n/ε, the normal entry of DH is b + (1 − b)·d(uχ₀)/du + O(n), the tangential entry is 1 + O(n), and the determinant is their product up to O(n). The term u χ₀′(u) is scale invariant, so it does not shrink with ε. For a bump equal to 1 on [0, 1] and 0 on [2, ∞), u χ₀ falls from 1 to 0 over an interval of length 1, so d(uχ₀)/du ≤ −1 somewhere, and the determinant is ≤ 2b − 1 + O(ε) there: negative for every ε once b < 1/2 (for instance h = (s, n/4) near an edge). The construction does work when d(uχ₀)/du > −b_min/(1 − b_min), for example with u χ₀(u) decreasing linearly to 0 on [1, R] and R > 1/b_min, where b_min is the least normal derivative on the boundary.

A clause such as "cut off in a thin collar by a function χ₀(n/ε) whose profile satisfies d(uχ₀)/du > −b_min/(1 − b_min)" makes the step true as written.

## N01 — §3.3's *Needs:* line omits the nondegeneracy of the canonical cotangent form

`TauCeti.SmoothTwoForm.IsMomentMap.poissonBracket_eq_zero_iff` assumes `σ.IsNondegenerate` (Tau Ceti `Geometry/Symplectic/Hamiltonian/MomentMap.lean`, line 279); for T*Q it comes from `TauCeti.CotangentBundle.isSymplectic_symplecticForm` (`Geometry/Symplectic/Cotangent/Bundle/Liouville.lean`, line 334), which the Needs line (lines 626–628) and the Tau Ceti contract do not name.

## N02 — Layer 4's Dependencies name only HamiltonianReduction Layer 1

§4.2's Needs line (line 712) and the HamiltonianReduction contract (lines 1372–1375) use Layers 1 and 3; line 810 would read "HamiltonianReduction Layers 1 and 3".

## N03 — In the injectivity lemma of §5.4 the inclusion is a right inverse of r_t, not a left inverse

Line 1105 says the pair inclusion j : (P, L) → (P, E_t) "is a left inverse of r_t up to homotopy". What the next line uses is r_t ∘ j ≃ id on (P, L), so j^* r_t^* u = u: j is a right inverse (a homotopy section) of r_t.

## Deferred findings

- D01 — resolved: the generated depends-on and merge-order blocks now both list #2687 and #2690 before this pull request, as the description's prose does.

## Previous findings

The previous review, of this same head, had no findings and no small corrections.

- N01 — not repaired: the head is unchanged; lines 626–628 still omit the nondegeneracy supplier (N01 above).
- N02 — not repaired: line 810 still reads "HamiltonianReduction Layer 1" (N02 above).
- D01 — resolved, see above.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions 2–3, 5 | ω = dq∧dp, f = p₁, q₁; θ = 2πt/p | X_(p₁) = ∂_(q₁), X_(q₁) = −∂_(p₁); {f,g} = df(X_g); −d(Σ I dθ) = Σ dθ∧dI; dt_p = (p/2π)dθ | true | none |
| §1.1 (sample) | H = (q²+p²)/2 on ℝ²; F = q₁ on ℝ⁴ | rank 1 off 0, rank 0 at 0, regular set dense; 2·1 ≠ 4, level 3-dim coisotropic; `IsIntegrableSystem` has four fields incl. `2 * card ι = finrank` | true | none |
| §1.2 (sample) | ℝ⁴, p₁, p₂; universal cover of ℝ²∖0 from (−1,−1); doubled-origin line | both orders give x + se₁ + te₂; routes end on different sheets, composite through (0,0) undefined; two integral curves through (−1,0) | true on Hausdorff M | C01 |
| §1.3 (sample) | q₁, p₁ on ℝ⁴; oscillator near (1,0) | {q₁,p₁} = 1; (q,p) = (r sin θ, r cos θ): dq∧dp = r dθ∧dr = dθ∧dI; `lmv` Thm 2.1 line 243, Remark 2.2 line 313 | true | none |
| §1.4 (sample) | (q²+p²)/2, qp, focus–focus pair, q²/2 | X = (p,−q): ±i; (q,−p): ±1; a·A₁ + b·A₂: ±a ± ib; (0,−q) nilpotent; Hess F_j(X_(F_i), w) = 0 from d(dF_j(X_(F_i))) = 0; `miranda-zung` lines 101–135 | true | none |
| §2.0 (sample) | Q(p,t) = (p,[t]_p); deck t ↦ t + np; D_(p,2π) | Q^*η = dt − (t/p)dp; deck pullback dt + n dp − ((t+np)/p)dp = same; ∮dθ = (2π/p)·p = 2π, reversed gives p²/2π; ∂_p(t/p) = −t/p² | true | none |
| §2.1 (sample) | L compact regular component; non-compact ℝ^(n−r) × T^r; doubled circle × ℝ | L open in the level (manifold charts at regular points), orbits open so one orbit; `cds` line 4467 (compact components are tori) | true with Hausdorff as stated | none |
| §2.3 (sample) | F = F(I) | period equation (D_I F)^T t ∈ 2πℤⁿ, smooth in c, basis change in GL(n,ℤ) locally constant | true | none |
| §2.4 `exists_actionAngle` (sample, headline) | n = 0; oscillator at (1,0) and at 0; F = p on ℝ²; period p | n = 0: M discrete, L = {x₀}, all clauses hold; critical level a point vs an infinite circle; circle cannot embed in a line; t = (p/2π)θ scales actions by 2π/p, form kept | true; Lean = README | none |
| §2.5 (sample) | H = νI; F = (2I₁+I₂, I₂); (θ,I) ↦ (A^(−T)(θ+∇φ), AI+b) | Λ = (2π/ν)ℤ; (D_IF)^(−T) columns (½,−½),(0,1): Λ = ⟨π(1,−1), 2π(0,1)⟩; untransposed has π(1,0) moving θ by (2π,π); Σφ_ij dI_j∧dI_i = 0 | true | none |
| §2.6 (sample) | cocycle s_j = s_i + t_ij; s = s_i + α_i; doubled circle × ℝ | t_ij = α_i − α_j; s^*σ = ±dα_i (`sjamaar2011` line 316); λ = 0 iff ≅ T*B/Λ (lines 388–391); δλ = c (447), SmoothBundlesConnections B6.6 uses −δ[t] | true on Hausdorff M, paracompact B | C01 |
| §2.7 (sample, headline) | T² → S¹; B = (1,2)×(0,3π) polar | dφ∧d(−θ) = dθ∧dφ, Λ = 2πℤdφ, I = φ not real-valued; a(r,φ) = a(r,φ+2π) for φ ∈ (0,π); `sjamaar2011` lines 275, 348–355 | true | none |
| §3.1 two theorems (sample, headline) | L = ½mv² − V; L = v; L = e^v | ω_L = m dq∧dv, X_E = (v, −V′/m), dFL(X_E) = (v, −V′) = X_H; L = v: ω_L = 0, field 0 (`inverse` junk value), 0 ≠ v; e^v misses p ≤ 0; `cds` line 4991 | true; Lean = README | none |
| §3.2–3.3 | F = q − tp; boost ξ = t; SO(2) on ℝ² | −p + p = 0; J = mvt − mq, J̇ = m v̇ t; μ = q₁p₂ − q₂p₁, X_μ = ξ lift, {μ,H} = −dH(ξ) (pinned lemma, line 264) | true | N01 |
| §4.1–4.3 | S = −m‖q−Q‖²/2t; V = −κ/r; E = −½, ℓ = ½ | p = P = m(Q−q)/t; r₀ = ℓ²/mκ, V_ℓ″ = m³κ⁴/ℓ⁶; I_r(circular) = 0; Ω_r = (−2E)^(3/2)/(κ√m) = 2π/period; e = √3/2, a = 1 | true | N02 |
| §4.4 pendulum (headline, not statable) | lift of Θ around (1,0) counterclockwise | 2π → π → (formula −π, lift π) → formula −2π, lift 0: drop 2π, so γ₂ ↦ γ₂ + γ_J; columns (1,0),(1,1); `egms` line 515 loop (g(s), −s) | true | none |
| §5.0 | ρ = 1 + y; shear R_c | s = a = 3/2, v = (2y+y²)/3, a du∧dv = (1+y)dx∧dy; S = (X−x)²/2c gives y = Y = (X−x)/c; ∂_kW = Y_(k−1) − y_k | true | none |
| §5.1 (sample) | F = (x + (2y−1)/8, y), c = 1, 1/8; ρ_t = 1 + ε sin 2πx; h = (s, n/4) with a bump | N_Xy = −3/4, +1/8; S₁ constant −1/96, S₁₂ = 4/3; dβ = ε sin 2πx, X^y = 0; determinant ≤ 2b − 1 < 0 for b = ¼; `smale1959` line 15, `gramain1973` lines 48–64 | theorem true; one route step needs a profile condition | C02 |
| §5.2 (sample) | K = 1, d = x₂ − x₁ | W = −d²/6 − d/6 − 1/96 = 1/32 − (d+½)²/6; critical d = −½, y₁ = ½; y₁(−1/8) = 0, y₁(−7/8) = 1; unnormalised constant 1/24 | true | none |
| §5.3 (sample) | K = 1; face y_k = c; runs of length 3, 5, 7 | ḋ = (2/3)(d+½), ẏ₁ = ∓1/3 outward; ẏ_k = S₁₂[−B′(Y_(k−1) − c) + (c − y_(k+1))]; ÿ_k = −S₁₂[B_k′ẏ_(k−1)/B_(k−1)′ + ẏ_(k+1)]; odd face next to an even run endpoint exits at second order | true; L exact | none |
| §5.4 | K = 1; ẏ = 1 on S¹×[0,1]; ∅; height on S¹ | G = u − (6v+1)/8, root in (0,1); Ȟ^*(P,L) = 0 and Inv = ∅; ∅ excluded; 2 = cl + 1; r_t∘j ≃ id gives j^*r_t^*u = u | true | N03 |
| §5.5 `strict_annulus_two_fixed_points` (headline) | shear example; rotation by ¼; fixed point translates | fixed circle y = ½; rotation has none; F(p+n) = F(p)+n puts each fixed point in [0,1)×(0,1); det = ρ(p)/ρ(Fp) > 0; `lecalvez-wang` lines 78–82 same boundary signs | true; Lean = README | none |

- Source locators read against the text: 17, in 9 sources (`lmv` 2, `miranda-zung` 2, `cds` 3, `sjamaar2011` 5, `zung2003` 1, `gramain1973` 1, `smale1959` 1, `lecalvez-wang` 1, `egms` 1); all agree with the README's theorem numbers and printed pages.
- Library declarations opened at the pin: Tau Ceti `IsIntegrableSystem` (`Hamiltonian/Integrable.lean` 172), `hamiltonianVectorField` and `poissonBracket` (`Hamiltonian/Manifold.lean` 179, 338), `IsRegularPoint` (`Manifold/RegularValue.lean` 86), `legendreMap`, `lagrangianEnergy`, `IsRegularLagrangian`, `cartanTwoForm` (`Cotangent/Bundle/Legendre.lean` 121, 198, 277, 510), `symplecticForm` (`Cotangent/Bundle/Liouville.lean` 279), the Noether lemmas (`Hamiltonian/MomentMap.lean` 264, 279); ten further Tau Ceti and seven Mathlib names of the contracts located by declaration.
- Cross-roadmap citations resolved: DifferentialGeometry Layers 0, 1, 3 (3.2–3.5), 4 and 8.4; SmoothBundlesConnections B1.0, B1.5, B6.1, B6.6 (−δ[t] at line 2205); AlgebraicTopology 2.6, 5.1, 6.2; CharacteristicClasses 1.2b; ConvexityToric 1.1; HopfRinow (completed); CotangentLagrangian Layer 3 and §3.1 with `exists_equiv_periodic_of_generating`, and HamiltonianReduction Layers 1 and 3, at the heads of their open revisions, which the description names. The two inbound anchors exist (lines 251, 548).
- Automatic checks: all pass on the worker's run and on mine. Dependency check: `depcheck: 182 roadmaps, 2070 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. No change outside the folder.
- Elaboration: `Suggested.lean` gives exactly four `declaration uses sorry` warnings (lines 75, 110, 125, 153). The six elaborated types were compared with the README statements: every binder is present (finite dimension, boundaryless, T2 for §2.4 only), nothing changed.
- One-tactic probe on a scratch copy (`rfl`, `simp`, `infer_instance`, `trivial`): none of the four theorems closes; the two definitions have real bodies. No padding.
- Headlines: Liouville–Arnold (stated), global obstruction theory and pendulum monodromy (docstring: not statable, lattice bundle missing), Legendre transform (two statements), Poincaré–Birkhoff (stated).
- Description against the head: 53 Checks counted, as stated; the Lean diff changes comments only; the supplier list, the locator paragraph and the four changed statements match the head.

Overlap check: read CotangentLagrangian (main and #2687), HamiltonianReduction (main and #2690), SymplecticGeometry (main and #2696), HamiltonianSystems (#480), DGFloer (#1798) and MathematicalBilliards (main). Shared objects and owners: generating functions and the chain dictionary, CotangentLagrangian; moment maps and regular reduction, HamiltonianReduction; the cotangent-lift moment map and Hamiltonian Noether law, Tau Ceti; positive-period circles, this roadmap (§2.0), consumed by SymplecticGeometry S0; the cup-length bound, this roadmap (§5.4), consumed by MathematicalBilliards. HamiltonianSystems says it leaves Liouville–Arnold, action–angle variables and the Legendre transform out. Nothing has two owners.

Source independence: 17 passages compared with 9 sources, none shared beyond formulas; the longest common runs are five words ("is an integral curve of", `cds` line 4992) and four ("which are the identity", `smale1959` line 16). Largest share: `sjamaar2011`, arnold-mmcm and `cds`, 4 each of 32 locators. Contents compared with `cds` (Parts VII–IX: §18 Hamiltonian fields, §19 variational principles, §20 Legendre transform, §24 reduction) and `sjamaar2011`: Layers 1 and 2 both draw on `cds` §18.4, Layer 3 on §§19, 20 and 24, Layers 4–5 on neither: independent. Arnold's contents could not be read.

Research link: Layer 2 states the Liouville–Arnold theorem and the obstruction theory begun by Duistermaat (1980), in the Lagrangian-class form of Dazord–Delzant and Zung (2003) surveyed by Sjamaar (2011); §4.4 is the monodromy of Efstathiou–Giacobbe–Mardešić–Sugny (2017); Layer 5 is Poincaré–Birkhoff (Le Calvez–Wang 2010) by Conley–Zehnder's (1983) route. Rests on the README and the texts read.

## Not verifiable

- Arnold, *Mathematical Methods of Classical Mechanics*, §§49–50 and Ch. 2; Marsden–Ratiu, Chs. 7 and 11: recorded as uncertified, cited by locator alone.
- Conley–Zehnder 1983 (the two flow statements of §5.4), Epstein 1966, Thm. 6.4 (§5.1; Gramain's p. 54 confirms what it is cited for) and Spanier, Ch. 6, §§6.6–6.9: uncertified, cited by locator alone.
- Whether DifferentialGeometry §3.4 will state the rectangle form of the commuting-flow theorem that §1.2 uses: it cites Lee, Thm. 9.44, which is uncertified. §1.2's own argument (transport of X_g along φ^f on the rectangle) does not depend on it.

## Source issues

- **Misprint** in zung2003 at §2.3, p. 7: the source says the bundles E_ℝ and E_ℤ were defined in the previous subsection as first cohomology bundles; it should say first homology bundles, as §2.2 defines them; affects nothing.
- **Misprint** in miranda-zung at §2.3, p. 4: the source writes the Williamson type of the linear model as (k_e, k_f, k_h); it should be (k_e, k_h, k_f), the order §2.2 fixes; affects nothing.
- **Gap** in cds at Theorem 24.1, p. 147: the source states an equivalence with G-invariance but proves only that invariance implies conservation; it should assume G connected for the converse, which gives infinitesimal invariance only; affects nothing.

## For the human reviewers

- Not tested: arnold-mmcm ties for the largest share of locators (4 of 32, with `sjamaar2011` and `cds`); its text and table of contents could not be read (uncertified), so wording and arrangement were not compared with it.
