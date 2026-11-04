# Review of IntegrableSystems (pull request #1651 at d9c6241)
Folder: `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/`
**Verdict:** needs changes

The roadmap is on the content repository's main branch; this pull request amends it in place. The change set in this folder is the new section I5 (README lines 281–466), two sentences in the setting paragraph (lines 21–22) and the companion file `AnnulusFixedPointTargets.lean`. `Suggested.lean` is byte-identical to main. Findings R05–R07 and part of R09 concern inherited text; they are reported because the worker's gate fails on them and the brief counts every gate failure. The findings on the new material are R01–R04 and R08, R10–R14.

Gate at d9c6241 (worker's run, data): `sorry-data=3 residue=1 imports=1 mathlib-subimports=3 no-import-mathlib=1 depcheck=1 build=0 FAIL`. Dependency check run by me on this head:

```
UPWARD: IntegrableSystems (on main) -> LieGroupoidsPoisson (#137) at README lines [17]
depcheck: 204 roadmaps, 1655 edges, 1 problem(s)
```

The depcheck sees only name-form citations. The URL-form citations of SurfaceTopology and PlanarTopology in I5.1 (R03) are invisible to it.

## R01 (P1) — I5.4 consumes a Čech theory that no roadmap owns

Location: `README.md` lines 445–449: "AlgebraicTopology's compact-metric Čech supplement's Čech pair homotopy invariance, ENR-model comparison and relative cube product supply u ∈ H^K(P,L;ℝ) …".

Claim: the cohomology used for Inv(P) and for the pair (P,L) is Čech cohomology of compact metric pairs, supplied by AlgebraicTopology.

Witness: the anchor `compact-metric-cech-closed-pairs` occurs in no README on main or at any open head except this one (`roadmaps grep`). AlgebraicTopology on main mentions Čech only for the fundamental-groupoid Čech diagram (its README lines 233–235). AlgebraicTopology at the head of its open revision (#1652, f285cc1) states at its line 139 that compact closed-pair Čech theory, continuity and cube-module extensions are outside that roadmap. AlgebraicTopologyPartII (rev 1694) has no such section. An open revision of an on-main roadmap is in any case not a dependency: the roadmap is cited as it is on main.

Why it matters: the Conley–Zehnder step needs the cohomology of the compact invariant set Inv(P), which has no manifold or CW structure, so Čech (or Alexander–Spanier) cohomology with its continuity and homotopy invariance is a real input; the pair (P,L) itself is a compact ENR pair, where singular cohomology suffices.

Repair: state the needed theory as targets in I5.4 with hypotheses: Čech cohomology of compact metric pairs with homotopy invariance of pairs, the comparison with singular cohomology on compact ENR pairs (applied to (P,L) and (S¹×[0,1]^K, S¹×∂[0,1]^K)), the relative cup product H^j(P)⊗H^K(P,L)→H^(j+K)(P,L) and its naturality under the inclusion Inv(P)⊂P. Cite Eilenberg–Steenrod or Spanier for each. Remove the AlgebraicTopology citation. If a later roadmap takes ownership, that is its change, not this one's.

## R02 (P1) — I5.3–I5.4 consume a MorseTheory section M4.2 that does not exist

Location: `README.md` lines 407–408 and 449–452: "Establish the regular index-pair/exit-collapsed semiflow data of MorseTheory M4.2 …" and "MorseTheory M4.2's actual survivor/index-pair Floer injection then gives H*(S¹)→H*(Inv(P)), and its arbitrary-degenerate gradient count gives at least two distinct critical points."

Claim: MorseTheory owns an isolating-block/index-pair cup-length bound for gradient-like flows.

Witness: MorseTheory on main has no "M4.2" and no isolating block, index pair, exit set or Conley material (grep of its README: none); its M4 (content lines 481–497) proves `#Crit(f) ≥ cat(M)+1 ≥ cupLength(M;R)+1` for a smooth f on a compact boundaryless manifold only. The open revisions #1094 (head 22a287e, sections M4 and M4.1 only) and #1682 contain no such section either. The anchor `m42-isolating-gradient-cup-bound` occurs nowhere but here.

Repair: state the theorem here as a target of I5.4 (it is the heart of the proof): for the complete flow of −grad W cut off outside a neighbourhood of P, with (P,L) the index pair of I5.3 and S = Inv(P), prove (i) if cup product with a class u ∈ H^K(P,L) is an isomorphism H^j(P)→H^(j+K)(P,L) for all j then the restriction H*(P)→Ȟ*(S) is injective, and (ii) a gradient-like flow on a compact isolated invariant set S has at least cl(Ȟ*(S))+1 rest points, with cl the cup length. Give the locator (Conley–Zehnder, Invent. Math. 73 (1983), the cup-length theorem of §3; paywalled, cite uncertified by DOI 10.1007/BF01393824). Remove the MorseTheory M4.2 citations; MorseTheory M4 on main may still be cited for the closed-manifold Lusternik–Schnirelmann bound if a route uses it.

## R03 (P2) — I5.1 consumes two roadmaps that exist only in an open pull request, cited by fork URL

Location: `README.md` lines 319–324: "One precise route consumes SurfaceTopology Layer 9 … rel-boundary annulus mapping-class group ℤ, its core Dehn twist, and PlanarTopology Layer 8's smooth-isotopy comparison", each linked to a GitHub URL into a fork at a fixed commit.

Claim: the isotopy from id to f through boundary-component-preserving diffeomorphisms is supplied by those two roadmaps.

Witness: SurfaceTopology and PlanarTopology are the new roadmaps of pull request #271 (another author); neither is on main nor in the merge order, so for a roadmap on main they are upward suppliers (the gate's rule that an open-PR supplier of an on-main roadmap is UPWARD; the depcheck does not see URL-form citations). The content cited does exist at #271's head (SurfaceTopology Layer 9, `mcg_annulus_rel_boundary : MappingClassGroupRel Annulus ≃* Multiplicative ℤ` and the positive Dehn twist), so this is a direction defect, not drift. The citation form (a URL into a fork commit) is also outside policy: citations name the roadmap and section.

Repair: own the statement here. Add to I5.1 the target "every orientation-preserving smooth diffeomorphism of the closed annulus preserving each boundary component is smoothly isotopic to the identity through such diffeomorphisms", with the route already sketched (boundary interpolation B_t, then the rel-boundary class is a power of the core twist, then the twist is isotoped away by rotating one boundary), its inputs listed on a *Needs:* line (DG Layer 3 flows; the Alexander trick on the strip; a locator, e.g. Farb–Margalit, A Primer on Mapping Class Groups, Prop. 2.4 and §2.2), and delete the two URLs. The sentence about constructing a compatible finite smooth triangulation (line 329–330) goes with them.

## R04 (P2) — the I5 headline is statable at the pins but is not in `Suggested.lean`

Location: `AnnulusFixedPointTargets.lean` lines 31–43 (`strict_annulus_two_fixed_points`); `Suggested.lean` has no I5 statement; `README.md` line 290 links the companion file.

Claim: the companion file is where the acceptance test for I5 lives.

Witness: the theorem elaborates (6 s, the `sorry` warning only) and is a correct form of the Poincaré–Birkhoff theorem (see the table: hypotheses `hstrip`/`hstrip_inv`/`hdeck`/`harea`/`hlower`/`hupper` make F a lift of an area-preserving boundary-component-preserving diffeomorphism of the annulus with the twist condition; fixed points cannot lie on y∈{0,1} by `hlower`/`hupper`, so representatives in `interiorFundamentalDomain` exist and distinct annulus points give distinct representatives). But `Suggested.lean` is the acceptance test, and the companion carries three `Mathlib.<submodule>` imports (lines 1–3), which the Lean form rules forbid in any `.lean` file of the folder. The same pull request already made this move for its sibling (CotangentLagrangian, commit 319049e2: companion removed, headline into `Suggested.lean`).

Repair: move `strip`, `interiorFundamentalDomain` and `strict_annulus_two_fixed_points` (with `Plane := ℝ × ℝ` inlined or kept as an `abbrev`) into `Suggested.lean` under a `/-! ## I5: the strict annulus fixed-point theorem -/` comment in the `TauCetiRoadmap.SymplecticGeometry` namespace, delete `AnnulusFixedPointTargets.lean`, and replace the README sentence at line 290 by "`strict_annulus_two_fixed_points` states the standard-area lifted form". The moved statement elaborates unchanged under `import Mathlib` (all its carriers are Mathlib's: `OpenPartialHomeomorph` at `Mathlib/Topology/OpenPartialHomeomorph/Defs.lean:52`, `ContDiffOn`, `fderiv`, `LinearMap.det`).

## R05 (P2) — gate: upward supplier LieGroupoidsPoisson (inherited)

Location: `README.md` line 17: "LieGroupoidsPoisson G0.1 supplies regular-level manifolds".

Witness: the depcheck line above. LieGroupoidsPoisson is the open pull request #1050 (merge order line 138); IntegrableSystems is on main, so every open-PR supplier is upward. The cited section exists at #1050's head (its README line 299, "G0.1 Submersion comparisons, the constant-rank theorem, subbundles and bracket naturality"), so this is direction, not drift. The line is main's, but the gate fails on it and the verdict cannot be accepted while it does.

Repair: drop the citation and state the regular-level-set theorem as an I1 target ("the preimage of a regular value of a smooth map between finite-dimensional manifolds is an embedded submanifold with tangent space ker df"), routed through the pinned `IsSubmersionAt` chart data (`Mathlib/Geometry/Manifold/Submersion.lean:171`, which has the local product charts but no level-set theorem at the pin), with a locator (Lee, Introduction to Smooth Manifolds, Cor. 5.14).

## R06 (P2) — gate: sorry'd data in `Suggested.lean` (inherited)

Location: `Suggested.lean` lines 91–101: `angleChartedSpace` (a `ChartedSpace` with body `sorry`), the `local instance … IsManifold … := by sorry`, and `actionAngleForm` (a `SmoothTwoForm` with body `sorry`); lines 104–111 and 114–132 mention them.

Witness: the gate's `sorry-data (3)`; the brief's principles make sorry'd data blocking. Neither Mathlib nor Tau Ceti at the pins gives `AddCircle` a `ChartedSpace` or `IsManifold` instance (grep of both packages: none), so the angle torus is not a native manifold and the Liouville–Arnold normal form is not statable.

Repair: delete `angleChartedSpace`, the two local instances, `actionAngleForm`, `actionAngleForm_inChart` and `LocalActionAngle` from `Suggested.lean` (the README keeps them as I2 targets), and say in the module docstring that the Liouville–Arnold action-angle headline is not statable at the pins because `AddCircle (2π)` has no smooth structure there. `FullPeriodLattice` can stay only if a headline uses it; as it stands it is a definition with no theorem (padding, see R07).

## R07 (P3) — gate: imports and padding in `Suggested.lean` (inherited)

Location: `Suggested.lean` lines 1–4 and 68–85, 135–138.

Witness: the file has no `import Mathlib`; it imports `TauCetiRoadmap.SymplecticGeometry.Suggested` (another module of the repository) and three `Mathlib.<submodule>` lines (gate `imports`, `mathlib-subimports`, `no-import-mathlib`). `positivePeriodScale` wraps `AddCircle.equivAddCircle` (`Mathlib/Topology/Instances/AddCircle/Defs.lean:505–510`) and its two theorems are proved by that file's `_apply_mk` lemmas plus `ring`: padding. `FullPeriodLattice` bundles `IsZLattice` with no theorem about it. `commonLevelTangent` is `LinearMap.ker` of `mfderiv`, a restated definition.

Repair: `import Mathlib` as the single import, inline `bracketValue` from the family index (or keep the family import only if the gate accepts it; it does not today), delete the four padding declarations. `regularLevel_lagrangian` and `centralForce_commutes` are legitimate headlines and stay.

## R08 (P3) — gate: residue anchor

Location: `README.md` line 281: an `<a id="i5-strict-annulus-fixed-points"></a>` tag.

Repair: delete it; the heading on line 282 already yields the anchor `i5-the-strict-annulus-fixed-point-theorem`, and no file links to the custom id (grep of main and the open heads: none).

## R09 (P3) — citation links that do not resolve (inherited)

Location: `README.md` line 13 (HamiltonianSystems linked by a pull-request URL, pull 480), line 18 and I3 line 215 (HopfRinow linked as `../../HopfRinow/README.md`), I4 lines 273–274 (Efstathiou–Giacobbe–Mardešić–Sugny cited as "§§II–III.2").

Witness: HopfRinow moved to `Completed/HopfRinow/` on main (commit 8e789309), so the relative link is dead; HamiltonianSystems is the new roadmap of open pull request #480 and is cited by number, which the policy forbids; the EGMS paper (arXiv 1608.01579v2, cache `egms`) numbers its subsections II.A–II.D and III.A–III.C, with the spherical pendulum in §III.B (lines 497–556), and its loop meets three polar orbits P₊, P₋, P₀ whose contributions are −2π, −2π, +2π (lines 515–552), two of which cancel; "both polar contributions" undercounts.

Repair: link `../../../Completed/HopfRinow/README.md` (or cite by name), cite HamiltonianSystems by name and section without the URL, and cite EGMS as "§II.A–II.C and §III.B, three polar orbits of which P₋ and P₀ cancel".

## R10 (P3) — I5 has no source locator

Location: `README.md` lines 282–466 and the References (lines 476–481).

Witness: the theorem (Poincaré–Birkhoff), the Moser argument with boundary, the twist factorization and the isolating-block argument carry no citation, and the reference list has no entry for them. Every theorem needs a locator.

Repair: cite Brown–Neumann, Proof of the Poincaré–Birkhoff fixed point theorem, Michigan Math. J. 24 (1977) 21–31 (DOI 10.1307/mmj/1029001816; Project Euclid serves only a landing page to the sources service, so record it uncertified unless a PDF is reachable) for the theorem; Conley–Zehnder, Invent. Math. 73 (1983) 33–49 (uncertified, DOI 10.1007/BF01393824) for I5.3–I5.4; and a generating-function treatment (e.g. Le Calvez–Wang, Proc. AMS 138 (2010), 703–715) for I5.1–I5.2. Add them to References.

## R11 (P3) — I5.2 restates CotangentLagrangian C3.1's chain bijection

Location: `README.md` lines 361–366: "Criticality is exactly Y_(k−1)=y_k at every k … Prove this gives a bijection after the diagonal deck quotient".

Witness: CotangentLagrangian C3.1, "Chains of generating functions" (its README lines 266–285, this pull request), proves the bijection between critical cyclic configurations and fixed points of the composite with admissible intermediate states, and at lines 283–285 names I5.2's cyclic configurations as the instance of that dictionary after sign change and deck quotient.

Repair: cite C3.1 for the bijection and own in I5.2 only the sign change (y=−∂₁S, Y=∂₂S), the diagonal ℤ quotient and the statement that the quotient bijection is injective on (x₁ mod 1, y₁).

## R12 (P3) — the acceptance value W(d)=1/32−(d+1/2)²/6 depends on an unstated normalization

Location: `README.md` lines 460–462.

Witness: with S₁(x,X)=−(2/3)(x−X)²+(x−X)/6 and S₂(x,X)=(X−x)²/2 (the generating functions of N=(x−(6y+1)/8,y) and R₁ in the stated convention, both with zero constant), W=−(d²+d)/6=1/24−(d+1/2)²/6. The value 1/32 is obtained exactly when each S_k is normalized to vanish on its lower boundary graph (S₁ then carries −1/96, S₂ already vanishes there), which is the natural choice since the form YdX−ydx vanishes along that graph; I5.1 says only "path integration on the simply connected band supplies S_k".

Repair: say in I5.1 that S_k is the integral from a base point on the lower boundary graph, so S_k≡0 there; then 1/32 is right and the example is reproducible.

## R13 (P3) — the new definitions have no Checks

Location: `README.md` I5.0–I5.4.

Witness: the normalization (u,v), the factors N and R_c, S_k, W, P, L, G and the clamped-root deformation each come with at most the single K=1 example at lines 460–466; the house shape asks for three discriminating Checks per definition.

Repair: add, for instance: a rigid rotation (x+1/4,y) as the negative control for the hypothesis (no fixed point, boundary displacements of one sign); the K=1 example's face derivative ẏ₁=−(8/9)(d+1/2) at d=−1/8 giving −1/3 (outward on the odd face); a run of length three with positive endpoints, where the middle odd face has ẏ=0 and ÿ strictly outward; the density ρ=2 on y<1/2 and ρ=… (a non-constant ρ) showing a=∫ρ and that (u,v) is degree one with a du∧dv=ρ dx∧dy.

## R14 (P3) — Lean headline narrower than the README theorem

Location: `AnnulusFixedPointTargets.lean` lines 38 (`harea : … det … = 1`) and 9 (docstring "standard-area"); `README.md` line 283 ("let ω be a smooth positive area form").

Witness: the README theorem is for any positive area form; the Lean form is the dx∧dy case. I5.0's conjugacy reduces one to the other, so the two are equivalent, but the general form is statable at the pins as easily (a smooth positive T-periodic density ρ with ρ(F p)·det(DF_p)=ρ(p) on the strip).

Repair: either state the density form (and keep the standard-area one as its corollary, or not at all), or say in the module docstring that the headline is stated in the normalized coordinates of I5.0.

## Verified sound

**Adversarial pass.** One row per statement; the values are what I computed.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| I5 theorem (PB form) | F(x,y)=(x+(2y−1)/8,y); rigid rotation (x+1/4,y); F with F^x(x,0)<x only | first: twist holds, fixed set {y=1/2} infinite, ≥2 ✓; rotation: hlower fails, no fixed point; one-sided: hypothesis fails | hypotheses are exactly PB's (Brown–Neumann form) | none |
| Lean `strict_annulus_two_fixed_points` | same; fixed point on y=0 | `hstrip`∧`hstrip_inv` give F|strip bijective; fixed point on y=0 contradicts `(F(x,0)).1<x`; representatives in Ico×Ioo exist and are distinct for distinct annulus points | true as stated | R04 (move), R14 (generality) |
| Rotation-number equivalence (I5 intro) | lift with F(x₀)≤x₀ and ρ>0 | monotone lift: Fⁿ(x₀)≤x₀ so ρ≤0, contradiction; F>x everywhere gives ρ≥δ>0 | ✓ | none |
| I5.0 normalization | ρ=1; ρ=ρ(x) | ∂u/∂x=s/a, ∂v/∂y=ρ/s, a du∧dv=ρ dx∧dy; u(x+1)=u(x)+1; v(x,0)=0, v(x,1)=1 | ✓ | none |
| Sign vs C3 | S_I5=−S_C3 | C3: p=d_qS, P=−d_QS; I5: y=−∂₁S, Y=∂₂S; substitution gives y=p, Y=P | consistent | none |
| ∂_kW, ẋ_k | W=ΣS_k(x_k,x_{k+1}) | ∂_kW=∂₂S_{k−1}+∂₁S_k=Y_{k−1}−y_k; ẋ_k=y_k−Y_{k−1} | ✓ | none |
| Moser form β_t | g_t=ρ_t−1 | dβ_t=(∂_x b_t−∂_y a_t)dx∧dy=(g_t−ḡ_t+ḡ_t)dx∧dy; a_t(1)=−∫∫g_t=0 (f preserves total area); b_t(x+1,y)−b_t(x,y)=ḡ_t−ḡ_t=0 | ✓ | none |
| Moser field tangency | ω_s=λ dx∧dy, λ=1+s g_t>0 | ι_Xω_s=−β gives X²=a_t/λ, X¹=−b_t/λ; a_t(0)=a_t(1)=0 so X²=0 on both circles; d/ds(ψ_s^*ω_s)=ψ_s^*(dι_Xω_s+dβ)=0 | ✓ | none |
| Twist factorization | H near id, R_c, N=R_c⁻¹H | N^x_x=H^x_x−cH^y_x≈1>0; N^x_y=H^x_y−cH^y_y≈−c<0; R_c: X_x=1, X_y=c; R_c and N preserve y=0,1 and area | ✓ | none |
| Generating-function band | X_y≠0 | y↦X(x,y) strictly monotone on [0,1], band between graphs X(·,0), X(·,1); YdX−ydx=dS; period along y=Y=0 is 0 | ✓ | none |
| S₁₂=−1/X_y | N of the example | S₁=−(2/3)(x−X)²+(x−X)/6: S₁₂=4/3; X_y=−3/4; −1/X_y=4/3 | ✓ | none |
| Face derivative | y_k=c, S₁₁=−S₁₂B′ | ẏ_k=S₁₂[−B′(Y_{k−1}−c)+(c−y_{k+1})]; c=0: bracket≤0; c=1: bracket≥0; even (S₁₂<0) inward, odd (S₁₂>0) outward; equality iff Y_{k−1}=c=y_{k+1} | ✓ | none |
| Full run of inputs c | all y_k=c | ẋ_k=c−c=0 and ẏ_k=0 for all k: a critical point, i.e. a lifted boundary fixed point, contradicting the strict inequality; hence no critical point on ∂P | ✓ | none |
| Second-order exit | odd k inside a run, neighbours in run | ÿ_k=S₁₁ẏ_{k−1}/B′_{k−1}−S₁₂ẏ_{k+1} (Y_x=0 on a face, Y_y=1/B′ from det=1); c=0: ẏ_{k±1}≥0, one strict → ÿ_k<0 outward; c=1 symmetric | ✓ | none |
| Run of length 7 with even endpoints | j…j+6, j even | odd j+3 has ẏ=ÿ=0 (both neighbours have ẏ=0), but j+1 and j+5 exit at second order, so the point still leaves P immediately: L exact | ✓ | none |
| First exit from the interior | exit point with a run having an even endpoint | that endpoint has strict inward ẏ, so the orbit was outside P just before: contradiction; all run endpoints are odd and strictly outward | ✓ | none |
| Inv(P)⊂int P | point of ∂P∖L; point of L | strict inward face leaves P in negative time; L leaves in positive time | ✓ | none |
| G monotonicity and signs | u,v inputs | ∂G/∂y_k=(∏_{j>k}X_{j,x})X_{k,y}: sign of X_{k,y}; all inputs 0: x_{2K+1}=F^x(x₁,0)<x₁; all 1: >x₁; G(x₁,0,v)≤G(x₁,0,0)<0<G(x₁,1,1)≤G(x₁,1,v) | ✓ | none |
| Clamped root | τ∈[−1,1] | clamp(a_s−1)=0, clamp(a_s+1)=1: IVT; τ↦clamp nondecreasing, strict coordinate increase strictly increases G: vector unique | ✓ | none |
| Pair equivalence degree | K=1,2 | (P,L)≃(S¹×[0,1]^K,S¹×∂): H^{j+K}(P,L)≅H^j(S¹) | ✓ | none |
| Example K=1 | F=(x+(2y−1)/8,y), c=1 | N=(x−(6y+1)/8,y); y₁=−(4/3)d−1/6∈[0,1] ⟺ d∈[−7/8,−1/8]; y₂=−d∈[1/8,7/8] inactive; W=−(d²+d)/6 (+ −1/96 with lower-boundary normalization) = 1/32−(d+1/2)²/6; d′=−2W′=(2/3)(d+1/2): −7/8 ↦ −1/4, −1/8 ↦ +1/4, both exit; ẏ₁=−(8/9)(d+1/2) | ✓ with normalization | R12 |
| I2.0 η on the cover | Q(p,t)=(p,q_p(t)) | N∘Q=(p,q₁(t/p)); β↦d(t/p); η=pβ↦dt−(t/p)dp; dη↦(1/p)dp∧dt=dp∧β; deck t↦t+np: dt+n dp−(t/p)dp−n dp, invariant; i_p^*η=dt | ✓ | none |
| I2.0 derivative estimates | k=0,1,2 | ∂_p^k(t/p)=(−1)^k k! t p^{−k−1}; ∂_t of it =(−1)^k k! p^{−k−1}; on ε≤p, |t|≤R: k!R/ε^{k+1}, k!/ε^{k+1}; deck p-derivative n unbounded | ✓ | none |
| I2.0 scaling | D_(p,q)([t]_p)=[(q/p)t]_q | derivative q/p, D^*dt_q=(q/p)dt_p; p=q identity; composition (r/q)(q/p)=r/p; `equivAddCircle_apply_mk` gives the representative formula | ✓ | none |
| I2.0 curve integral | γ(t)=q_p(t), 0≤t≤p | ∫γ dt_p=∫₀^p 1 dt=p | ✓ | none |
| I2 action formula | X_{I_i}=Σ_j(∂I_i/∂c_j)X_{f_j} | period 2π of X_{I_i} along γ_i ⟺ 2π∂I_i/∂c=λ^{(i)}; Λ_c=2π(D_If)^{−T}ℤⁿ | ✓ | none |
| I4 Kepler | κ,m>0, ℓ≠0 | e²=1+2Eℓ²/(mκ²); I_r=κ√(m/(−2E))−|ℓ|; H=−mκ²/(2(I_r+|ℓ|)²); Ω_r=mκ²/(I_r+|ℓ|)³; Ω_θ=sgn(ℓ)Ω_r; T=2π√(m/κ)a^{3/2} with a=κ/(−2E) | ✓ | none |
| I4 isotropic oscillator | E=ν(2I_r+|ℓ|) | I_r=(E/ν−|ℓ|)/2 | ✓ | none |
| I4 free particle generator | C3 convention p=d_qS | S=−m‖q−Q‖²/(2t): d_qS=m(Q−q)/t=p ⟺ Q=q+tp/m | ✓ | none |
| I4 pendulum monodromy | EGMS §III.B | counterclockwise loop around (1,0): k=−1 (lines 540–552), matrix [[1,1],[0,1]] with the stated basis; three polar orbits, two cancel | ✓ | R09 (wording) |
| `IntegrableSystem` structure | n=0 | `Fin 0 → M → ℝ`, `denseRegular` holds (surjectivity onto the zero space), dimension 0: the point, consistent | ✓ | none |
| `regularLevel_lagrangian` | n=0 | ker of the zero map is everything; Lagrangian in dimension 0 ✓ | ✓ | none |
| `centralForce_commutes` | z.1=0 excluded; V smooth on (0,∞) only | `planarCentralHamiltonian` uses `Real.sqrt` of ‖q‖², smooth off q=0; conclusion needs only the noncollision domain | ✓ | none |

**Lean form.** `lake env lean` on a copy of `AnnulusFixedPointTargets.lean`: 6 s, only `declaration uses 'sorry'` at its line 31. A `#check @` probe of all 16 declarations of `Suggested.lean` plus the five library names it relies on elaborated in 35 s with the module imported; every elaborated type matches the file (recorded types: `IntegrableSystem` keeps `[FiniteDimensional ℝ E]` as an explicit binder, `regularLevel_lagrangian` carries `IsManifold I ∞ M` and `FiniteDimensional`, `commonLevelTangent` needs no manifold instance, `actionAngleForm` and `angleChartedSpace` are the sorry'd data of R06). Nothing changed in the probe.

**Library declarations opened at the pins (worktree packages = brief's pins):** `CircleDeg1Lift` and `translationNumber` (`Mathlib/Dynamics/Circle/RotationNumber/TranslationNumber.lean:129, 550`); `OpenPartialHomeomorph` (`Mathlib/Topology/OpenPartialHomeomorph/Defs.lean:52`); `AddCircle.equivAddCircle_apply_mk` / `_symm_apply_mk` (`Mathlib/Topology/Instances/AddCircle/Defs.lean:505, 510`); `properlyDiscontinuousSMul_iff_properSMul` (used at `Mathlib/Analysis/Complex/UpperHalfPlane/ProperAction.lean:131`, elaborated with `[CompactlyCoherentSpace (X × X)] [T2Space X] [DiscreteTopology G]`); `ContinuousAlternatingMap.ofSubsingletonLIE` (`Mathlib/Analysis/Normed/Module/Alternating/Basic.lean:294`); `IsSubmersionAt` (`Mathlib/Geometry/Manifold/Submersion.lean:171`); `TauCeti.SmoothTwoForm` (`TauCeti/Geometry/Manifold/TwoForm/Basic.lean:61`), `IsNondegenerate.symplecticFormAt` and `constSmooth` (`TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean:37, 192`), `stdSymplecticForm` (`TauCeti/Geometry/Symplectic/StandardCompatible.lean:83`), `TauCeti.instIsManifoldQuotient` and `isLocalDiffeomorph_quotientMk` (referenced in `TauCeti/Geometry/Manifold/Instances/LensSpace.lean:20` and `TauCeti/Analysis/Complex/Fuchsian/FreeLocus.lean:28`). No `ChartedSpace` or `IsManifold` instance on `AddCircle` in either package.

**Cross-roadmap citations resolved:** family conventions ω=−dλ, ι_Xω=df, {f,g}=df(X_g), default period 2π (`SymplecticGeometry/README.md` lines 37–42) and S0's consumption of I2.0's period-1 circle (line 84–90) agree with I2.0; CotangentLagrangian C3 generating convention and C3.1 chain bijection (its README lines 234–235, 266–285); DifferentialGeometry Layer 3.3 complete flows and 3.5 time-dependent flows (content README lines 371–402), Layer 8.4 de Rham/chain integrals (line 36, 92); MorseTheory main M4 (lines 481–497: closed-manifold LS bound only); AlgebraicTopology main (one Čech mention, lines 233–235) and #1652 head line 139; SurfaceTopology Layer 9 and PlanarTopology Layers 5–8 at #271's head (exist); LieGroupoidsPoisson G0.1 at #1050's head line 299 (exists, upward); HopfRinow under `Completed/` on main. Ownership of the Poincaré–Birkhoff theorem and of index-pair/Conley material was searched by object across main and the open heads (`roadmaps grep`): no other owner; this roadmap may own I5 subject to R01–R03. Ownership against open pull requests whose files the brief does not give was checked only through `roadmaps grep`.

**Sources read.** Cannas da Silva, Lectures on Symplectic Geometry (cache `0b1c3a1f`, author page): §18.4 at line 4405 (printed p. 109), Theorem 18.12 Arnold–Liouville at lines 4470–4487 (pp. 110–111): regular value, Lagrangian levels, complete flows give ℝⁿ-homogeneous components, action coordinates; consistent with I2's hypotheses (I2 adds compactness and connectedness of the chosen component explicitly). Efstathiou–Giacobbe–Mardešić–Sugny, arXiv 1608.01579v2 (fetched into the scratch manifest as `egms`): §II.A Definition 4 (rotation number, line 160), §II.B–II.C rotation one-forms (Lemmas 11–17, lines 220–289), §III.B spherical pendulum (lines 497–556), as recorded in the table.

**Seeded sample.** The six sampled targets ("Quotient and atlas", "Group, translations and time form", "Scaling", "Finite products and open restrictions", "The positive-period total family", "Smooth parameter families and estimates") are I2.0 constructions on main without locators; their formulas were recomputed in the table (η, dη, deck invariance, scaling derivative, curve integral, derivative estimates, permutation sign, empty product). The native names they cite exist at the pins (list above).

## Not verifiable

- Brown–Neumann 1977 (Michigan Math. J. 24): the sources service reached only the Project Euclid landing pages for both the article URL and the download URL (HTML, no text); the I5 theorem was checked against the classical statement from memory and by the instance analysis in the table, not against the text.
- Conley–Zehnder 1983 (Invent. Math. 73): Springer DOI, paywalled; recorded uncertified in the scratch manifest. The index-pair cup-length theorem that R02 asks the roadmap to state was checked by the argument in the table, not against the text.
- Le Calvez–Wang 2010 (Proc. AMS 138): host in no licence class; not read.
- Arnold, Mathematical Methods of Classical Mechanics; Duistermaat 1980 (Comm. Pure Appl. Math.); Marsden–Ratiu: inherited references without locators beyond chapter names; not fetched (paywalled publishers), so their support for I3–I4 was not checked against text.
- SurfaceTopology/PlanarTopology were read at #271's head through the roadmaps tool, not at the fork commit the README links; the linked commit was not checked.

## Source issues

- none
