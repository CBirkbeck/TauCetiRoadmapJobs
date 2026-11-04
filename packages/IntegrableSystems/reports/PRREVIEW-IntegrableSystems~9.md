# Review of IntegrableSystems (pull request #1651 at bd2dba9)
Folder: `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/`
**Verdict:** needs changes

Full review of the repaired head (489 changed lines since d9c6241). Gate at bd2dba9 (worker's run, data): every check passed, `build=0`. Dependency check run on this head:

```
depcheck: 204 roadmaps, 1659 edges, 0 problem(s)
```

**Repairs of the previous review (r8), finding by finding.**

- R01 (Čech theory unowned): repaired. I5.4 (README lines 532–548) now owns the compact-pair theory (relative groups, exact sequence, homotopy invariance, closed-cover excision, continuity, relative cup product) and consumes only CharacteristicClasses C1.2b for the absolute open-cover Čech theory; the AlgebraicTopology supplement citation is gone. One input of that paragraph is still not a target (R08 below).
- R02 (MorseTheory M4.2): repaired. I5.4 lines 550–576 state the injectivity lemma and the cup-length bound as targets with the Conley–Zehnder locator and a route; both routes check (table).
- R03 (SurfaceTopology/PlanarTopology URLs): repaired. I5.1 lines 340–370 own the isotopy theorem with Epstein, Gramain and Smale locators; the URLs are gone. Two sentences of the route contradict each other (R04 below).
- R04 (I5 headline not in `Suggested.lean`): repaired. `strict_annulus_two_fixed_points` is at `Suggested.lean` lines 117–131; the companion file is deleted.
- R05 (LieGroupoidsPoisson upward): repaired as asked, but the replacement is a duplication (R01 below): LieGroupoidsPoisson has since merged to main (commit 98f7ed30) and its §G0.1 defers regular fibres to SmoothBundlesConnections B1.0, which owns exactly the theorem I1 now claims.
- R06 (sorry'd data): repaired. No `def`, `instance` or `abbrev` has a `sorry` body; `chosenHamiltonianField` has a real body with `Classical.choose`.
- R07 (imports, padding): repaired. `import Mathlib` plus three `TauCeti.*` modules that exist at the pin; the four padding declarations are gone. The two copied definitions collide with the family index (R02 below).
- R08 (residue anchor): repaired (line 295 is a plain heading).
- R09 (dead links, EGMS locator): repaired. HopfRinow links `../../../Completed/HopfRinow/README.md` (exists on main); HamiltonianSystems is no longer cited; EGMS is cited as §II.A–II.C and §III.B with the three polar orbits.
- R10 (I5 locators): repaired, with one page number off by one (R06 below).
- R11 (C3.1 bijection restated): repaired. I5.2 lines 432–439 cite CotangentLagrangian C3.1 "Chains of generating functions" (its README lines 266–285 at this head, which name I5.2 as the instance) and own only the sign change, the diagonal quotient and injectivity on (x_1 mod 1, y_1).
- R12 (normalization of S_k): repaired. I5.1 lines 395–398 fix S_k ≡ 0 on the lower boundary graph; the value 1/32 is now reproducible (table).
- R13 (no Checks in I5): repaired. I5.0–I5.4 carry 3, 3, 3, 3 and 4 Checks; all recomputed (table), one negative control is wrong (R05 below).
- R14 (Lean narrower than README): repaired. The Lean statement carries a smooth positive periodic density ρ with ρ(F p)·det DF_p = ρ(p); the docstring says the constant density is the standard-area case.

## R01 (P2) — I1 re-plans the regular-fibre theorem that SmoothBundlesConnections B1.0 owns on main

Location: `README.md` lines 44–51, "Prove the regular-level-set theorem here, since no roadmap on main states it for vector-valued maps: for k≤n smooth functions with surjective differential at every point of a common level, that level is an embedded submanifold with tangent space ker df (Lee, … Cor. 5.14)"; and lines 18–19, "I1 owns the regular-level-set theorem it needs".

Claim: no roadmap on main states the theorem.

Witness: SmoothBundlesConnections B1.0 on main (its README line 221, "B1.0 Regular fibres, fibre products and kernel distributions of submersions") defines the regular fibre of a smooth map `f : X → N` over `c` under surjectivity of `mfderiv f x` at every point of the fibre and states the headline `exists_regularFiber_smoothEmbedding`: a charted-space structure making it a smooth manifold with `Subtype.val` a smooth embedding whose tangent image is `ker (mfderiv f z)`, citing the same Lee Cor. 5.14 and Prop. 5.38. LieGroupoidsPoisson, now on main, says at its §G0.1 (README line 301) that regular fibres are consumed from B1.0 and not constructed there. The principle is that what another roadmap plans is imported, never planned again; SmoothBundlesConnections is already a supplier of this roadmap (line 19).

Repair: delete lines 44–51; replace lines 18–19 by "SmoothBundlesConnections B1.0 supplies regular fibres with tangent space ker df (`exists_regularFiber_smoothEmbedding`)", and in the I1 paragraph at line 33 cite "(SmoothBundlesConnections B1.0)" at "regular common levels have tangent ker df". Drop the Lee entry from the References if nothing else cites it. The remaining ownership sentences inside layer prose (line 341 "No roadmap on the content repository's main branch owns this statement", line 482 "which no roadmap on main supplies") belong in the setting paragraph, which is this roadmap's scope section; say there once what I5 owns (the "Acceptance and order" paragraph at line 603 already does) and delete them from the layers.

## R02 (P2) — `Suggested.lean` declares two fully qualified names the family index already declares

Location: `Suggested.lean` lines 43–49, `def chosenHamiltonianField` and `def bracketValue` in `namespace TauCetiRoadmap.SymplecticGeometry`.

Claim (README line 13): the bracket is "this roadmap's own carrier `bracketValue`".

Witness: `TauCetiRoadmap/SymplecticGeometry/Suggested.lean` (the family index, unchanged by this pull request and on main) declares `TauCetiRoadmap.SymplecticGeometry.chosenHamiltonianField` (its line 24) and `TauCetiRoadmap.SymplecticGeometry.bracketValue` (its line 29) with the same bodies; `HamiltonianReduction/Suggested.lean` imports that index. Two modules of one package now declare the same fully qualified names: any module importing both fails to elaborate, and the brief forbids giving a declaration the fully qualified name of a declaration in a roadmap one can read. The previous head avoided this by importing the index, which the gate's import rule forbids.

Repair: put this file's declarations in the roadmap's own namespace, `namespace TauCetiRoadmap.SymplecticGeometry.IntegrableSystems` (as `ContactGeometry/Suggested.lean` does with `…SymplecticGeometry.ContactGeometry`), so that `IntegrableSystem`, `strip` and the rest cannot collide either; the README's backticked names are unchanged. Tested: the file elaborates unchanged under the longer namespace, since nothing in it refers to the index.

## R03 (P3) — the ConvexityToric citation names a label that no longer exists at this head

Location: `README.md` line 16, "torus/lattice API from [ConvexityToric T1](../ConvexityToric/README.md#t1-compact-symplectic-actions-and-local-models)".

Witness: ConvexityToric at this head (this pull request's own, commit bd2dba9) has no "T1" label and no such anchor: its headings are "## Layer 1: Compact symplectic actions and local models" (line 118) with "### 1.1 Periods, characters and rank-one normalization" (line 120); the label "## T1." exists only on main (ConvexityToric README line 32), which this pull request replaces.

Repair: cite "ConvexityToric Layer 1 (1.1)" and link `../ConvexityToric/README.md#layer-1-compact-symplectic-actions-and-local-models`.

## R04 (P3) — the I5.1 isotopy route contradicts itself on the boundary lift

Location: `README.md` lines 350–353, "Lift g to G on the strip, commuting with T and fixing both boundary lines pointwise. The image under G of the segment {0}×[0,1] is a properly embedded arc from (0,0) to (m,1) for an integer m"; and lines 360–361, "along each edge its derivative is unipotent with positive normal component".

Witness: a lift fixing both boundary lines pointwise sends (0,1) to (0,1), so m=0 and the twist correction τ^(−m) is empty; for the Dehn twist τ(x,y)=(x+y,y) the lift fixing y=0 pointwise moves (x,1) to (x+1,1), so m=1. A diffeomorphism of the square fixing its boundary pointwise has, at a boundary point in (tangent, normal) coordinates, derivative [[1,a],[0,b]] with b>0 and b≠1 in general (for (x,y)↦(x,y+y(1−y)) at (x,0) it is [[1,0],[0,2]]), which is not unipotent.

Repair: "fixing the lower boundary line pointwise, so that it translates the upper line by an integer m"; and "its derivative is upper triangular with tangential entry 1 and positive normal entry, so its convex combination with the identity has positive determinant along the boundary and, cut off to a thin collar, stays a diffeomorphism". The rest of the route (τ^(−m)∘G fixes both lines, Epstein's arc theorem, Smale's Theorem B) is unchanged.

## R05 (P3) — the Moser negative-control Check states a false value

Location: `README.md` lines 419–420, "Writing β_t=a_t dy+b_t dx instead gives dβ_t=−(ρ_t−1)dx∧dy, the wrong sign."

Witness: in that Check a_t=0 and b_t=ε(1−cos 2πx)/(2π) depends on x alone, so β′=b_t dx has dβ′=∂_y b_t dy∧dx=0, not −ε sin(2πx)dx∧dy. In general d(a_t dy+b_t dx)=−(∂_y b_t)dx∧dy, which is not ±(ρ_t−1)dx∧dy.

Repair: use a wrong model that computes to the wrong sign, e.g. "Writing β_t=−a_t dx−b_t dy instead gives dβ_t=−(ρ_t−1)dx∧dy, and the Moser field then expands rather than corrects the density", or "defining the field by ι_Xω=+β_t instead of −β_t reverses its sign, and ψ_(t,1) then pulls ω_(t,1) back to (1+2(ρ_t−1))dx∧dy at first order".

## R06 (P3) — Le Calvez–Wang Theorem 1 is on p. 704

Location: `README.md` line 298, "Le Calvez–Wang, Thm. 1, p. 705".

Witness: `lecalvez-wang` line 82 states Theorem 1 ("If F preserves the measure induced by dx∧dy then ♯Fix*(F) ≥ 2") on the page whose running head (line 52) reads 704; the article starts at p. 703 (line 7).

Repair: "Thm. 1, p. 704".

## R07 (P3) — the Lean docstring cites Cannas da Silva §18.3 for a §18.4 statement

Location: `Suggested.lean` line 67, "(I1; Cannas da Silva, Lectures on Symplectic Geometry, §18.3)".

Witness: `cds` line 4367 opens §18.3 "Brackets" (printed p. 108); the statement that a regular level of n commuting integrals is Lagrangian is at lines 4458–4461 and in Theorem 18.12 at lines 4470–4473, inside §18.4 "Integrable Systems" (line 4420, printed pp. 109–110). The README's reference (line 618) already says §18.4.

Repair: "§18.4, Theorem 18.12, p. 110".

## R08 (P3) — the Čech/Alexander–Spanier comparison is used but not stated as a target

Location: `README.md` lines 535–542, "Own here its compact-pair theory … (Spanier, Algebraic Topology, Ch. 6, §§6.6–6.9, for Alexander–Spanier cohomology, which agrees with the open-cover Čech theory on paracompact spaces)".

Claim: the properties listed (excision for closed covers, continuity, relative cup product) hold for the Čech groups of CharacteristicClasses C1.2b.

Witness: those properties are Spanier's theorems for Alexander–Spanier cohomology; transporting them to C1.2b's open-cover Čech theory needs the natural isomorphism of the two theories on compact (or paracompact Hausdorff) pairs, which the parenthesis asserts as a fact and no target of I5.4 states. The injectivity lemma (lines 552–560) uses both the closed-cover excision and C1.2b's groups, so the comparison is an input of the proof.

Repair: add to the owned list "the natural isomorphism, compatible with cup products and maps of pairs, between the open-cover Čech cohomology of C1.2b and Alexander–Spanier cohomology for compact Hausdorff pairs (Spanier, Ch. 6)", or define the relative groups of I5.4 directly as Alexander–Spanier groups and state the comparison with C1.2b only for the absolute groups of P and S.

## R09 (P3) — the module docstring gives a wrong reason for the absent I3 headline

Location: `Suggested.lean` lines 26–27, "the Legendre transform and the Euler–Lagrange/Hamilton equivalence of I3: there is no carrier for the fibre derivative of a Lagrangian on a tangent bundle".

Witness: at the pin the fibre derivative is definable with a real body: for `L : TangentBundle I Q → ℝ`, the fibre `TangentSpace I q` is the normed space `E` and `fderiv ℝ (fun v ↦ L ⟨q, v⟩) v : E →L[ℝ] ℝ` is a cotangent vector. What is missing is the canonical symplectic form on the cotangent bundle of a manifold: Tau Ceti's `TauCeti/Geometry/Symplectic/Cotangent/Liouville.lean` has `cotangentLiouvilleForm` only on `V × StrongDual ℝ V` (its lines 59–71), so Hamilton's equations on `T*Q` and the Lagrangian two-form `FL^*ω` cannot be written without heavy definitions.

Repair: "the Legendre transform is definable, but the Euler–Lagrange/Hamilton equivalence needs the canonical symplectic form on the cotangent bundle of a manifold, which Tau Ceti has only on a vector space times its dual".

## Verified sound

**Adversarial pass.** One row per statement; the values are what I computed.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| I5 theorem (README) vs Le Calvez–Wang Thm 1 | lift f with p₁f(x,0)<x<p₁f(x,1), F area-preserving homeomorphism | source: ♯Fix*(F)≥2 (`lecalvez-wang` lines 75–82); README: smooth diffeomorphism, same twist, same conclusion | README is the smooth special case | R06 (page) |
| `strict_annulus_two_fixed_points` | F=(x+(2y−1)/8,y), ρ≡1; rotation (x+1/4,y); ρ=1+y with F=(x+(2y−1)/8,y) | first: det=1, hlower (2·0−1)/8<0 ✓, hupper 1/8>0 ✓, fixed set {y=1/2}: p=(0,1/2), q=(1/2,1/2) distinct ✓; rotation: hlower fails; ρ=1+y: ρ(Fp)·1=ρ(p) ✓ same fixed set | true as stated; hypotheses make F a lift of a density-preserving diffeomorphism of the annulus | none |
| Lean binders | `#check @` of all 10 declarations | `IntegrableSystem`, `regularLevel_lagrangian` keep `[FiniteDimensional ℝ E]`, `[IsManifold I ∞ M]`; `centralForce_commutes` keeps `0<mass`, `ContDiffOn ℝ ∞ V (Ioi 0)`, `z.1≠0`; the I5 theorem keeps all 13 hypotheses | types match the README | none |
| Rotation-number equivalence (I5 intro) | lift with F(x₀)≤x₀, ρ>0 | Fⁿ(x₀)≤x₀ so ρ≤0, contradiction; F>x everywhere gives ρ≥δ>0 by compactness | ✓ | none |
| I5.0 normalization | ρ≡1; ρ=1+y | s=1,a=1,(u,v)=(x,y); s=3/2,a=3/2,u=x,v=(2y+y²)/3, v(0)=0,v(1)=1, a du∧dv=(3/2)(2(1+y)/3)=(1+y) ✓; without a: (2/3)(1+y) | ✓ | none |
| Shear generator | R_c, S=(X−x)²/(2c) | −∂₁S=(X−x)/c=y ✓, ∂₂S=(X−x)/c=Y ✓; C3's p=d₁S gives −(X−x)/c | ✓ | none |
| Sign vs C3.1 | S_I5=−S_C3 | C3.1: p=d₁S, P=−d₂S (its line 259); here y=−∂₁S, Y=∂₂S | consistent | none |
| ∂_kW, ẋ_k, ẏ_k | W=ΣS_k(x_k,x_{k+1}) | ∂_kW=Y_{k−1}−y_k; ẋ_k=y_k−Y_{k−1}; ẏ_k=−S₁₁ẋ_k−S₁₂ẋ_{k+1}=S₁₁(Y_{k−1}−y_k)+S₁₂(Y_k−y_{k+1}) | ✓ | none |
| Isotopy B_t | b_± increasing degree one | ∂_xB_t=(1−t)+t((1−y)b_−′+yb_+′)>0; B_t(x+1,y)=B_t(x,y)+(1,0); B_1|_{y=0}=b_−, |_{y=1}=b_+ | ✓ | none |
| Lift G and m | τ(x,y)=(x+y,y) | lift fixing y=0 pointwise sends (0,1)↦(1,1): m=1≠0 | "fixing both lines pointwise" false | R04 |
| Square-edge derivative | (x,y)↦(x,y+y(1−y)) | at (x,0): [[1,0],[0,2]], not unipotent; (1−s)I+sD has det 1+s>0 | wording | R04 |
| Gramain Thm 1 for the annulus | `gramain1973` lines 48–60 | D₀(cylinder)≃O(2): two components; orientation-preserving boundary-component-preserving maps are homotopic to id and form one component | supports I5.1 statement | none |
| Smale Thm B | `smale1959` lines 15–17 | diffeomorphisms of the square equal to the identity near the boundary form a contractible space, printed p. 621 | ✓ | none |
| Moser data | g_t=ρ_t−1 | a_t(1)=−∫∫g_t=0 (area 1 preserved); b_t(x+1,y)−b_t(x,y)=ḡ_t−ḡ_t=0; dβ_t=(∂_xb_t−∂_ya_t)dx∧dy=g_t dx∧dy | ✓ | none |
| Moser field | ω_s=λdx∧dy, λ=1+sg_t>0 | ι_Xω_s=λ(X¹dy−X²dx)=−a_tdx−b_tdy ⇒ X²=a_t/λ, X¹=−b_t/λ; X²=0 at y=0,1; k_t^*(dx∧dy)=ψ^*(ρ_t dx∧dy)=ω_{t,0} | ✓ | none |
| Moser Check ρ_t=1+ε sin2πx | ε≠0 | ḡ=0, a=0, b=ε(1−cos2πx)/(2π), dβ=ε sin(2πx)dx∧dy ✓; wrong model β′=b dx: dβ′=0, not −(ρ−1)dx∧dy | negative control false | R05 |
| Twist factorization | H∈U, R_c | N=R_c⁻¹H: N^x_x=H^x_x−cH^y_x≈1>0, N^x_y=H^x_y−cH^y_y≈−c<0; R_c: X_x=1, X_y=c | ✓ | none |
| Check K=1 factorization | F=(x+(2y−1)/8,y), c=1; c=1/8 | N=(x−(6y+1)/8,y): N_Xx=1, N_Xy=−3/4 ✓; c=1/8: N=(x+(y−1)/8,y), N_Xy=+1/8 ✓ | ✓ | none |
| Generators S₁,S₂ | N, R_1 | y=(4/3)(x−X)−1/6 ⇒ S₁=−(2/3)(x−X)²+(x−X)/6+C; on X=x−1/8: 1/96+C=0 ⇒ C=−1/96 ✓; S₁₂=4/3=−1/N_Xy ✓; S₂=(X−x)²/2, S₂₁₂=−1=−1/R_Xy ✓ | ✓ | none |
| S₁₂=−1/X_y, S₁₁=−S₁₂B′ | general | y=−∂₁S(x,X): 1=−S₁₂X_y; c=−∂₁S(x,B(x)): 0=−S₁₁−S₁₂B′ | ✓ | none |
| W(d) and band | d=x₂−x₁ | S₁(x₁,x₂)=−(2/3)d²−d/6−1/96, S₂(x₂,x₁)=d²/2; W=−(d²+d)/6−1/96=1/32−(d+1/2)²/6 ✓; without normalization 1/24 ✓; y₁=−(4/3)d−1/6∈[0,1] ⟺ d∈[−7/8,−1/8] ✓; y₂=−d∈[1/8,7/8] ✓; W′=0 at d=−1/2, y₁=1/2 ✓ | ✓ | none |
| Descended gradient | Euclidean metric on (x₁,x₂) | −gradW=(W′,−W′), d′=−2W′=(2/3)(d+1/2); ẏ₁=−(4/3)d′=−(8/9)(d+1/2): −1/3 at d=−1/8, +1/3 at d=−7/8, both outward | ✓ | none |
| Face derivative signs | y_k=c, Y_k=c | ẏ_k=S₁₂[−B′(Y_{k−1}−c)+(c−y_{k+1})]; c=0: bracket≤0, even (S₁₂<0) inward, odd outward; c=1 symmetric; equality iff Y_{k−1}=c=y_{k+1} | ✓ | none |
| Second-order exit | odd k in a run | Y_x=0, Y_y=1/B′ on a face (det=1); ÿ_k=S₁₁ẏ_{k−1}/B′_{k−1}−S₁₂ẏ_{k+1}=−S₁₂[B′_kẏ_{k−1}/B′_{k−1}+ẏ_{k+1}]; c=0 with inward neighbours, one strict: ÿ_k<0 | ✓ | none |
| Full run | all y_k=c | every ẋ_k=0, ẏ_k=0: lifted fixed point on the boundary, contradicting the strict inequality | ✓ | none |
| Exit set L | point with an odd active face; point with only even faces | first: exits at first or second order (run endpoints); second: strict inward, interior forward segment | L exact | none |
| First exit from the interior | second-order tangency only | outside P for small negative time too: contradicts interiority before exit | ✓ | none |
| Injectivity lemma route | u∈Ȟ^K(P,L), v∈Ȟ^j(P), v|_{N_t}=0 | r_t∘j=r_t≃id on (P,L) so j^*r_t^*u=u; r_t^*u∪v∈Ȟ(P,E_t)≅Ȟ(N_t,N_t∩E_t) restricts to (r_t^*u)|∪0=0; hence u∪v=0, v=0 | ✓ (needs closed-cover excision and the comparison of R08) | R08 |
| S⁺ to S | Φ^t on S⁺ | Φ^t≃id; class vanishing on a neighbourhood U of S; Φ^t(S⁺)⊂U for t large; (Φ^t)^*v=v=0 | ✓ | none |
| G and root | K=1 example | G=u−(6v+1)/8, ∂_uG=1, ∂_vG=−3/4, G(0,0)=−1/8=F^x(x,0)−x, G(1,1)=1/8 ✓; t(v)=(6v+1)/8∈[1/8,7/8]⊂(0,1) ✓; general: ∂G/∂y_k=(∏_{j>k}X_{j,x})X_{k,y} | ✓ | none |
| Clamped root | τ∈[−1,1] | clamp(a_s−1)=0 ⇒ G<0; clamp(a_s+1)=1 ⇒ G>0; monotone, strict coordinate increase ⇒ strict G increase ⇒ vector unique | ✓ | none |
| Pair model, K=1 | (S¹×[0,1],S¹×{0,1}) | Ȟ¹(P,L)≅Ȟ⁰(S¹)=ℝ, Ȟ²(P,L)≅Ȟ¹(S¹)=ℝ; Koszul (−1)^{1·1}=−1 ✓ | ✓ | none |
| Negative control ẏ=1 | P=S¹×[0,1] | L=upper circle, (P,L)≃(S¹,S¹), Ȟ^*(P,L)=0; Inv(P)=∅ | ✓ | none |
| Cup-length sharpness | height on S¹; K=1 example | 2=cl+1 rest points; circle d=−1/2 of rest points | ✓ | none |
| Lean `hV`, `hq` | V=r², q=0 | H=‖p‖²/2m+‖q‖² smooth, rotation-invariant, bracket 0; where H is not differentiable `mfderiv` is 0 and the bracket is 0 | statement holds without them (junk value); the hypotheses are the honest domain | note only |
| `centralForce_commutes` sign | ω=±Σdq_i∧dp_i | X_L=±(−q₂,q₁,−p₂,p₁); dH(X_L)=±[(1/m)(−p₁p₂+p₂p₁)+V′(r)(−q₁q₂+q₂q₁)/r]=0 | ✓ either sign | none |
| `regularLevel_lagrangian` | n=0; n=1, M=ℝ², f=p | n=0: ker = everything, finrank 0, Lagrangian ✓; n=1: ker dp=span(∂_q), ω(∂_q,∂_q)=0, dim 1 ✓ | ✓ | none |
| `IntegrableSystem` n=0 | `Fin 0 → M → ℝ` | surjectivity onto the zero space holds everywhere, `Dense univ` ✓ | consistent | none |
| I2.0 "Quotient and atlas" | p>0, compact K₁,K₂⊂[−R,R] | (K₁+np)∩K₂≠∅ ⇒ |n|≤2R/p: finite; lifts differ by np, transition derivative 1 | ✓ | none |
| I2.0 "Group, translations and time form" | γ(t)=q_p(t), 0≤t≤p; m∈ℤ | ∫_γdt_p=∫₀^p1=p; [t]↦[mt] well defined since m(t+np)=mt+(mn)p; pullback m·dt_p, sign kept for m<0 | ✓ | none |
| I2.0 "Scaling" | D_{p,q}([t]_p)=[(q/p)t]_q | derivative q/p, D^*dt_q=(q/p)dt_p; D_{q,r}∘D_{p,q}: (r/q)(q/p)=r/p; p=q identity; θ=2πt/p ⇒ dt_p=(p/2π)dθ | ✓ (`AddCircle.equivAddCircle` at `Mathlib/Topology/Instances/AddCircle/Defs.lean:499`) | none |
| I2.0 "Finite products and open restrictions" | two factors, swap | pullback of dt_j along the i-th inclusion is 0 for j≠i; dt₂∧dt₁=−dt₁∧dt₂; empty product = point, degree 0 | ✓ | none |
| I2.0 "The positive-period total family" | Q(p,t)=(p,q_p(t)), deck t↦t+np | N∘Q=(p,[t/p]₁); Q^*η=p·d(t/p)=dt−(t/p)dp; dη=dp∧β; Q^*dη=(1/p)dp∧dt; deck: dt+ndp−(t/p)dp−ndp invariant; i_p^*η=dt_p | ✓ | none |
| I2.0 "Smooth parameter families and estimates" | k=0,1,2; ε≤p, |t|≤R | ∂_p^k(t/p)=(−1)^k k! t p^{−k−1}, ∂_t of it =(−1)^k k! p^{−k−1}; bounds k!R/ε^{k+1}, k!/ε^{k+1}; ∂_t²=0 | ✓ | none |
| I4 Kepler | κ,m>0, ℓ≠0 | A=p×L−mκq/r=(p₂ℓ−mκq₁/r,−p₁ℓ−mκq₂/r); |A|²=m²κ²+2mEℓ²; e²=1+2Eℓ²/(mκ²); I_r=κ√(m/(−2E))−|ℓ|; H=−mκ²/(2(I_r+|ℓ|)²); Ω_r=mκ²/(I_r+|ℓ|)³; a=κ/(−2E), T²=4π²ma³/κ | ✓ | none |
| I4 free particle | C3 convention p=d_qS | S=−m‖q−Q‖²/(2t): d_qS=m(Q−q)/t=p ⟺ Q=q+tp/m; P=−d_QS=m(Q−q)/t=p | ✓ | none |
| I4 oscillators | E=ν(2I_r+|ℓ|) | I_r=(E/ν−|ℓ|)/2; one-dimensional action E/ν | ✓ | none |

**Lean form.** `lake env lean` on a copy of `Suggested.lean` (with `#check @` lines for all ten declarations and a one-tactic probe `first | rfl | simp_all | infer_instance` on each of the three theorems) elaborated in 4 s with exactly the three `declaration uses 'sorry'` warnings for the file's own theorems; the elaborated types are recorded in the table row "Lean binders". None of the three theorems closes under one tactic (the probe reports unsolved goals or an instance error for each), so there is no padding; the two definitions `strip` and `interiorFundamentalDomain` and the two I4 definitions are the simple definitions the headlines need. Single `import Mathlib`, three `TauCeti.*` modules that exist at the pin (`TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean`, `…/Lagrangian/Basic.lean`, `…/StandardCompatible.lean`), no `set_option`, no `lemma`, no sorry'd data, `theorem` throughout. Every Lean name appears in the README (lines 13, 35–38, 253–254, 313–314) and every backticked name of the roadmap's own in the README is declared in the file. The worker's signature probe failed only because it read a Lake packages directory that is not this pull request's (`315a2ceb…`); this worktree's `.lake/packages` resolves to the directory at the pin (`6b7abb3c`/`a91d3aaf`) with a complete olean set.

**Library declarations opened at the pins.** `TauCeti.SmoothTwoForm` (`TauCeti/Geometry/Manifold/TwoForm/Basic.lean:61`); `IsNondegenerate`, `IsSymplectic`, `IsNondegenerate.symplecticFormAt`, `constSmooth` (`TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean:68, 92, 99, 192`); `TauCeti.SymplecticForm.IsLagrangian` (`TauCeti/Geometry/Symplectic/Lagrangian/Basic.lean:99`); `TauCeti.stdSymplecticForm : SymplecticForm (V × V)` for an inner-product space (`TauCeti/Geometry/Symplectic/StandardCompatible.lean:83`); `mvfderiv` (`Mathlib/Geometry/Manifold/MFDeriv/NormedSpace.lean:448`); `TauCeti.levelSetChart` (`TauCeti/Analysis/Fredholm/LevelSet/Basic.lean:117`, normed-space level sets with closed-complemented kernel) and `TauCeti.isManifold_levelSet` (`…/LevelSet/Manifold.lean:142`, Fredholm derivative of index n at every level point), both in `namespace TauCeti`; `Manifold.IsSubmersionAt` (`Mathlib/Geometry/Manifold/Submersion.lean:171`); `OpenPartialHomeomorph` (`Mathlib/Topology/OpenPartialHomeomorph/Defs.lean:52`); `CircleDeg1Lift` and `translationNumber` (`Mathlib/Dynamics/Circle/RotationNumber/TranslationNumber.lean:129`); `properlyDiscontinuousSMul_iff_properSMul` (`Mathlib/Topology/Algebra/ProperAction/CompactlyGenerated.lean:95`); `ContinuousAlternatingMap.ofSubsingletonLIE` (`Mathlib/Analysis/Normed/Module/Alternating/Basic.lean:294`); `ContMDiffSection` (`Mathlib/Geometry/Manifold/VectorBundle/ContMDiffSection.lean:286`); `TauCeti.instIsManifoldQuotient` and `isLocalDiffeomorph_quotientMk` (`TauCeti/Geometry/Manifold/Instances/Quotient.lean:208, 216`); `cotangentLiouvilleForm` (`TauCeti/Geometry/Symplectic/Cotangent/Liouville.lean:71`, on `V × StrongDual ℝ V` only). No `ChartedSpace` or `IsManifold` instance on `AddCircle` in either package, and no Poisson bracket or Hamiltonian vector field in Tau Ceti, so `bracketValue` duplicates no library object (the family index's docstring naming `SmoothTwoForm.poissonBracket` refers to nothing at the pin).

**Cross-roadmap citations resolved** (main at a0ad405, open heads as given): CharacteristicClasses C1.2b (README lines 419–477: open-cover Čech colimit, constant-coefficient homotopy invariance, cup-natural closed-CW-pair comparison); AlgebraicTopology Stage 5 (line 849, Künneth under stated hypotheses, product case recovered) and Stage 6 (line 946; "absolute-relative module action and same-pair relative cup product for every pair" at lines 1071–1072); DifferentialGeometry 3.2, 3.3 (compactly supported completeness), 3.5 (`exists_timeDependentFlow`), 8.4 (`chainIntegral`) at lines 379, 388, 400, 845, and Layers 0–1 by relative link; SmoothBundlesConnections B1.0 (line 221), B6.1 (line 1375), B6.6 "Lattice local systems and affine torus bundles" (line 1811), B1.5 Ehresmann/proper submersion (line 498); HamiltonianReduction R1 (line 33) and its line 107 consuming I2.0; the family README's S0 (line 84) and its I2.0 citation (line 42); CotangentLagrangian C3 (line 225, `p=d_qS, P=−d_QS` at line 235) and C3.1 (line 256, chains at 266–285) at this head; ConvexityToric at this head (R03); Completed/HopfRinow on main; LieGroups at the head of #1051 (Layer 0, the exponential map and one-parameter subgroups); LieGroupoidsPoisson on main (merged, §G0.1 at line 299 deferring regular fibres to B1.0). Ownership by object (`roadmaps grep` over main and the 440 open heads): the Poincaré–Birkhoff theorem, index pairs and exit sets, and compact-pair Čech/Alexander–Spanier theory occur in no other roadmap; Epstein's theorems and the rel-boundary annulus mapping class group are planned in PlanarTopology/SurfaceTopology at #271 (another author's new folders), which the previous round judged upward for this on-main roadmap, so I5.1's ownership of the smooth isotopy-to-identity statement stands. Ownership against open pull requests whose files the brief does not give was checked only through `roadmaps grep`.

**Sources read.** `lecalvez-wang` (AMS, 13 pages): Theorem 1 and the twist condition at lines 75–82. `smale1959` (AMS, 6 pages): Theorem B at lines 15–17. `gramain1973` (Numdam, 15 pages): Théorème 1 at lines 48–60 (printed pp. 53–54). `cds` (author page): §18.3 at line 4367, §18.4 at line 4420, the Lagrangian level at lines 4458–4461 and Theorem 18.12 at lines 4470–4478. `egms` (arXiv 1608.01579): polar orbits and the spherical pendulum at lines 92–94, 454–471, as the previous review recorded for §III.B.

**Seeded sample.** The six I2.0 targets ("Quotient and atlas", "Group, translations and time form", "Scaling", "Finite products and open restrictions", "The positive-period total family", "Smooth parameter families and estimates") are constructions on main without source locators; each formula was recomputed (six rows of the table) and every native name they cite exists at the pins (list above).

**Declared gaps.** None declared; no `gap:` prerequisite in the README.

## Not verifiable

- Conley–Zehnder 1983 (Invent. Math. 73, pp. 33–49): paywalled, settled uncertified; the injectivity lemma and cup-length bound were checked by the argument in the table, not against the text.
- Epstein 1966 (Acta Math. 115, Thm. 6.4), Lee (Cor. 5.14), Spanier (Ch. 6): settled uncertified. For Spanier my recollection is that relative Alexander–Spanier groups with exactness and excision are introduced in §6.4 and the homotopy axiom in §6.5, before the tautness/continuity and presheaf sections §§6.6–6.9 the README cites; the author should check whether "§§6.4–6.9" is the right range.
- Arnold, Marsden–Ratiu, Duistermaat, Hofer–Zehnder: inherited references, uncertified; their support for I3–I4 was not checked against text.
- The board's `signatures.md` for this head reports no signatures because the worker's probe used a Lake packages directory at another pin; my own elaboration (above) stands in for it.

## Source issues

- none
