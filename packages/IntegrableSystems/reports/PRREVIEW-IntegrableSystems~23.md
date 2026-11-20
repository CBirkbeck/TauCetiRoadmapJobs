# Review of IntegrableSystems (pull request #2691 at 59bce2e)
Folder: `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/`
**Verdict:** needs changes

**Summary.** Changes are needed. The new explicit uniqueness formula for action–angle charts in §2.5 is false whenever the integral matrix A is not the identity, because the map it writes down is not symplectic. Separately, the supplier citations of CotangentLagrangian C3/C3.1 and HamiltonianReduction R1/R3 break under the open revisions of those two roadmaps, which renumber the sections without giving a map. There are seven small corrections (among them a Hausdorff hypothesis for §2.1, an old → new numbering for ids that roadmaps on main cite, a sign convention against SmoothBundlesConnections B6.6, and the loop orientation of the cited pendulum computation) and one format note. One point is left to the human reviewers: the table of contents of the source cited most could not be read.

## R01 (P1) — The explicit uniqueness formula of §2.5 is not symplectic when A ≠ 1, so it does not describe the transitions between action–angle charts

An implementer is asked to prove a false statement, and the uniqueness clause of §2.7 inherits it. In §2.5 (lines 466–469) two charts are said to differ by (θ, I) ↦ (A^(−T)θ + ∇φ(I), AI + b), with φ any smooth function of the actions. Take n = 2, A with rows (1, 1) and (0, 1), b = 0 and φ = I₁²/2. Then θ′ = (θ₁ + I₁, θ₂ − θ₁) and I′ = (I₁ + I₂, I₂), and Σ dθ′ᵢ ∧ dI′ᵢ = Σ dθᵢ ∧ dIᵢ + dI₁ ∧ dI₂, so the stated map is not a symplectomorphism. Conversely, (θ, I) ↦ (A^(−T)(θ + ∇φ(I)), AI) with the same data is symplectic and keeps F a function of the actions, so it is a genuine second chart. Its angle shift A^(−T)∇φ(I) = (I₁, −I₁) is not a gradient (its Jacobian has rows (1, 0) and (−1, 0)), so this chart is not of the stated form. I checked both pullbacks by exact matrix computation.

The smallest repair: write the transition as (θ, I) ↦ (A^(−T)(θ + ∇φ(I)), AI + b). Equivalently, write A^(−T)θ + ∇ψ(AI + b) with ψ a function of the new actions. The present form is correct only for A = 1.

## R02 (P2) — The supplier citations of CotangentLagrangian C3/C3.1 and HamiltonianReduction R1/R3 break when the open revisions of those roadmaps merge

Once those revisions merge, the *Needs:* lines of §§3.3, 4.1, 4.2, 5.0 and 5.2 and the supplier contracts will point at sections that no longer exist under those names. Pull request #2687 renumbers CotangentLagrangian: at its head C3 is "Layer 3" (§§3.0 and 3.0a) and C3.1 is §3.1 (its README lines 682–801), and nowhere does it map the former numbering. This README cites C3.1 at lines 942, 950, 1144, 1192 and 1318, and C3 at lines 96, 644, 829, 1144, 1192 and 1317. Pull request #2690 likewise renames HamiltonianReduction R1 to Layer 1, R3 to Layer 3 and R1a.3 to §1a.3 (its lines 103, 1114 and 454), again without a mapping. This README cites R1 at lines 600, 605, 621, 686, 781, 1193 and 1327, R3 at lines 677, 686, 1193 and 1328, and R1a.3 at line 1152.

Either of two repairs suffices. The two revisions can each add one sentence mapping the former numbering ("C3.1 is now §3.1", "R1 is now Layer 1"), in which case nothing here changes. Or this README cites the new ids next to the old ones, and its description says that it merges after #2687 and #2690.

## C01 — §2.1 needs M Hausdorff, and Convention 1 says such statements carry the hypothesis, but §2.1 does not

Without the hypothesis, §2.1 fails. Take M = (circle with one point doubled) × ℝ, with σ = dθ ∧ dp and F = p. Then F is an integrable system, regular everywhere, and F⁻¹(0) is compact, connected and not Hausdorff. So F⁻¹(0) is not ℝ/Λ, and the integral curves of X_F branch at the doubled point. The family floor (SymplecticGeometry README line 27) makes manifolds Hausdorff, so nothing stated is false. But §2.2 carries the hypothesis explicitly and §2.1 (line 362) does not, and the pinned complete case assumes `[T2Space M]` (Tau Ceti `Geometry/Symplectic/Hamiltonian/LiouvilleArnold.lean` line 79). The contract line for the flow action (line 1250) also omits the pin's Hausdorff and boundaryless hypotheses. Adding "with M Hausdorff" in §2.1, and "on a Hausdorff boundaryless M" in that contract line, would align both.

## C02 — Roadmaps on main cite this roadmap's former ids, and the README gives no old → new numbering

The former ids cited on main are:
- I2.0: the SymplecticGeometry index (anchor links at lines 42 and 90; line 80) and HamiltonianReduction R1a.3 (line 107).
- I3: LocalVariationalFieldTheory (lines 21, 133, 442 and 587; anchor links at lines 436 and 1167).
- I5.0 and I5.4: MathematicalBilliards (lines 26, 304, 336 and 552).
- I5.2: CotangentLagrangian (line 510).

The anchors stop resolving and the plain ids name nothing at this head. The open revision of the SymplecticGeometry index also still cites I2.0. The description mentions only the two anchor links.

A sentence in Scope and ownership would let every citing roadmap follow: "In the former numbering, I1–I4 are Layers 1–4, I2.0 is §2.0 and I5.0–I5.4 are §§5.0–5.4." The family index is part of this pull request, so its two I2.0 links could also be pointed at `#20-positive-period-circles-and-families`.

## C03 — Several results taken from the literature carry no locator, or only a chapter

- §1.3 (the Carathéodory–Jacobi–Lie normal form) and §1.4 (Williamson's classification) cite no source.
- §§2.6–2.7 cite "(Duistermaat, 1980)" with no theorem or section (lines 497, 506).
- §§3.1–3.3 cite Marsden–Ratiu by topic ("Lagrangian and Legendre theory", "Noether theory").
- §§4.2–4.3 cite "(Arnold, central forces)".

A reader cannot check these statements against a source. A theorem or section number at each claim would fix it; for §1.4, Williamson's 1936 paper in the American Journal of Mathematics is the primary source.

## C04 — The description says every target has a source at the claim; the head does not

The sentence "Each target has a *Needs:* line and a source at the claim" does not hold: §§1.2, 1.3, 1.4, 2.2, 2.3, 4.1, 5.0, 5.2 and 5.3 cite no source. This is often rightly so, because they rest on suppliers or the library. Text that would be right: "Each target has a *Needs:* line; targets drawn from the literature cite their source at the claim."

## C05 — The Layer 1 example misses the rest points among the singular points of the central-force map

The Examples of Layer 1 (line 232) say that (H, L) "is regular exactly off the circular orbits". The pin (`Geometry/Symplectic/Hamiltonian/CentralForce/Integrable.lean` lines 150–156) and §4.2's own wording also count the rest points at critical points of V when ℓ = 0. For V(r) = (r − 1)², every point of the circle |q| = 1, p = 0 is singular (dH = 0, dL ≠ 0), and none lies on a circular orbit of positive angular speed. Adding "and, for ℓ = 0, the rest points at critical points of V" would cover them.

## C06 — §4.4 does not say that the cited pendulum computation runs the loop the other way

§4.4 (lines 748–755) sends the reader to Efstathiou–Giacobbe–Mardešić–Sugny §III.B. That computation calls its loop counterclockwise, but it parametrizes it at (1 + ε, 0) as (h, j) = (g(s), −s) (`egms` line 515). That is clockwise in the (h, j)-plane used here, that is, counterclockwise with J on the horizontal axis as in the source's Figure 4. The source finds k = −1 (`egms` line 552), i.e. γ₂ ↦ γ₂ − γ_J. The two agree once the orientations are matched, but a reader checking γ₂ ↦ γ₂ + γ_J against the source finds the opposite sign. One clause would prevent this: the source's loop is the reverse of the one used here, so its k = −1 is γ₂ ↦ γ₂ + γ_J for this loop.

## C07 — The relation between the Lagrangian class and the Chern class in §2.6 depends on a sign convention the section does not fix

§2.6 (lines 487–494) takes the Chern class from SmoothBundlesConnections B6.6. It then says that the image of the Lagrangian class under the connecting map of 0 → Λ → Z¹ → Z¹/Λ → 0 is that class. B6.6 fixes its class as −δ[t] for transitions s_j = s_i + t_ij (its README lines 2204–2205). Connecting maps are natural along Z¹ ⊂ C^∞(T*B), so a torsor cocycle written in B6.6's convention maps to δ[t], which is minus B6.6's class. §2.6 never fixes the sign of the torsor cocycle, so the sentence is right for one convention and off by a sign for the other. One fix is to state the cocycle's convention and the resulting sign. Another is to say "up to sign", as the sentence about s^*σ already does.

## N01 — The summary gives the pendulum's monodromy matrix without the loop orientation and basis

Lines 21–22 give the matrix with no orientation or basis, though the sign flips with the orientation (§4.4, second Check). "for a counterclockwise loop in the (h, j)-plane, in the basis (γ_J, γ₂)" would pin it.

## Questions for the author

- §1.2 relies on DifferentialGeometry §3.4 for the commuting flows of non-complete commuting fields on rectangles. §3.4 (DifferentialGeometry README lines 1308–1314) cites Lee, Thm. 9.44, without stating the domain on which the flows commute. Does it plan the rectangle form? Lee is recorded as uncertified, so I could not read it.
- The Efstathiou et al. section numbers (§§II.A–II.C, III.B) were checked in arXiv v2. Does the J. Math. Phys. version the References cite keep them? The published text is paywalled.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 Checks | H = (q²+p²)/2; F = q₁ on ℝ⁴ | dH rank 1 off 0, rank 0 at 0; X_(q₁) = −∂_(p₁) tangent to levels; 2·1 ≠ 4 | true | none |
| §1.2 flows on rectangles | f = p₁, g = p₂ on T*ℝ² and on the universal cover of ℝ²∖0 | both composites x + se₁ + te₂; routes via (1,−1), (−1,1) end on different sheets; (−1,0) → origin undefined | true; negative control valid | none |
| §1.3 normal form | {q₁,p₁}; oscillator near (1,0) | {q₁,p₁} = dq₁(X_(p₁)) = 1; clockwise θ gives dθ∧dI, counterclockwise −dθ∧dI | true | none |
| §1.4 Williamson, rank r > 0 | qp, (q²+p²)/2, focus–focus pair, q²/2 | eigenvalues ±1, ±i, ±a±ib; (0,−q) nilpotent; d{Fᵢ,Fⱼ} = 0 gives Hess Fⱼ(X_(Fᵢ), w) = 0 | true | none |
| §2.0 circles, families | D_(p,2π); deck (p,t) ↦ (p,t+np); k = 1, 2 | ∫dθ = 2π (wrong conversion p²/2π); dt − (t/p)dp invariant; −t/p², 2t/p³; R/ε², 2R/ε³ | true | none |
| §2.1 compact component | doubled-point circle × ℝ, F = p | level compact, connected, non-Hausdorff, not ℝ/Λ | needs Hausdorff (family floor gives it) | C01 |
| §2.2 saturated neighbourhood | W ≅ L × D, F∘Ψ = pr_D | slices compact hence closed in Hausdorff fibre, open as W open; F|_W ≅ pr_D proper | true | none |
| §2.4 `exists_actionAngle` | oscillator; origin; n = 0; F = p | dq∧dp = r dθ∧dr = dθ∧dI, H = I; hreg fails at 0; one-point bundle; hLc fails | true; binders T2, FiniteDimensional, Boundaryless kept | none |
| §2.5 period lattice | F = (2I₁+I₂, I₂); H = νI | generators π(1,−1), 2π(0,1) = 2π(D_IF)^(−T)ℤ²; π(1,0) moves θ by (2π,π); 2πν⁻¹ℤ | true | none |
| §2.5 uniqueness | n = 2, A rows (1,1),(0,1), φ = I₁²/2 | stated map pulls back Σdθ∧dI + dI₁∧dI₂; A^(−T)(θ+∇φ) symplectic; (I₁,−I₁) not a gradient | false for A ≠ 1 | R01 |
| §2.6 Chern class | B6.6: s_j = s_i + t_ij, class −δ[t] | naturality along Z¹ ⊂ C^∞(T*B): δ(Lagrangian class) = δ[t] = −c | sign depends on unstated convention | C07 |
| §2.7 global criteria | T² → S¹; B = (1,2)×(0,3π) | p_φ = −θ pulls dφ∧dp_φ to dθ∧dφ; dφ closed, not exact; a(r,φ) = a(r,φ+2π) for φ ∈ (0,π) | true | none |
| §3.1 two theorems | L = ½mv² − V; L = v; L = e^v | ι_Xω_L = m(a dv − b dq) = dE_L gives (v, −V′/m); dFL = (v,−V′) = X_H at p = mv; ω_L = 0; FL misses p ≤ 0 | true; pin ω_L = −dθ_L, σ(X_f,·) = df | none |
| §3.2 conservation | F = q − tp, H = p²/2 | ∂_tF = −p, {F,H} = dF(X_H) = p, sum 0; opposite sign gives −2p | true | none |
| §3.3 Noether | L = ½mv², boost ξ = t | δL = mv = d(mq)/dt; J = mvt − mq, J̇ = mv̇t = 0; without B: mv | true; pin momentMap = p(ξ_M x) | none |
| §4.2 polar chart, stability | V = −κ/r | λ = p_r dr + L dθ; r₀ = ℓ²/(mκ), V_ℓ″ = m³κ⁴/ℓ⁶; eigenvalues ±i√(V″/m) | true | none |
| Layer 1 Examples | V = (r−1)², ℓ = 0 | circle |q| = 1, p = 0: dH = 0, dL ≠ 0, rank 1, not a circular orbit | imprecise | C05 |
| §4.3 Kepler, oscillator | E = −mκ²/(2ℓ²); E = −½, m = κ = 1, ℓ = ½ | e = 0, I_r = 0; Ω_r = (−2E)^(3/2)/(κ√m) = 2π/period; e = √3/2, I_r = ½, a = 1, T = 2π | true | none |
| §4.4 pendulum | h ∈ {0, ½, 2, 3}, j = ±10⁻³ | Θ = ±3.1434, ±3.1446 (→ ±π); ±6.2828, ±6.2831 (→ ±2π); lift drops 2π, γ₂ ↦ γ₂+γ_J | true; source loop reversed | C06 |
| §5.0 normalization, convention | ρ ≡ 1; ρ = 1+y; shear R_c | identity; s = a = 3/2, v = (2y+y²)/3, a du∧dv = (1+y)dx∧dy; y = Y = (X−x)/c | true | none |
| §5.0 boundary rotation | G(x) > x for all x vs τ > 0 | periodic margin δ gives τ ≥ δ; G(x₀) ≤ x₀ forces a fixed point (τ = 0) or τ ≤ 0 | true; Mathlib lemmas present | none |
| §5.1 factorization, generator, Moser | F = (x+(2y−1)/8, y), c = 1, 1/8; ρ = 1+ε sin 2πx | N_Xy = −3/4; c = 1/8: +1/8; S₁ = 0 at x−X = 1/8, S₁₂ = 4/3; b = ε(1−cos 2πx)/2π; +β doubles defect | true | none |
| §5.2 action | K = 1, d = x₂ − x₁ | W = −d²/6 − d/6 − 1/96 = 1/32 − (d+½)²/6; y₁ ∈ [0,1] iff d ∈ [−7/8,−1/8]; d = −½ gives y₁ = ½ | true | none |
| §5.3 faces | K = 1; general face | ẏ₁ = −(8/9)(d+½): −1/3, +1/3, outward; dY = dy/B′ gives ÿ_k = S₁₁ẏ_(k−1)/B′ − S₁₂ẏ_(k+1) | true | none |
| §5.4 pair, cup module | K = 1; flow ẏ = 1; height on S¹ | G = u − (6v+1)/8, root in [1/8, 7/8]; Ȟ¹, Ȟ²(P,L) ≅ ℝ, Koszul −1; Ȟ*(P,L) = 0, Inv = ∅; 2 rest points | true | none |
| §5.5 `strict_annulus_two_fixed_points` | shear; rotation x+¼; boundary points | det = 1, fixed circle y = ½ gives two points in [0,1)×(0,1); rotation fails hlower; strict inequalities exclude boundary | true; Le Calvez–Wang Thm. 1, p. 704 for ρ ≡ 1 | none |
| Duistermaat headline; pendulum monodromy | pins | only pointwise stabilizer and global period-map lattice families; no lattice bundle Λ ⊂ T*B, no Z¹/Λ | not statable; docstring says so | none |

- Source locators read in the text: `cds` Lemma 18.11 and Thm. 18.12 (lines 4462–4483, pp. 110–111); `lecalvez-wang` Thm. 1 (lines 75–82, p. 704); `smale1959` Thm. B (lines 15–17, p. 621); `gramain1973` Thm. 1 (lines 48–64, pp. 53–54); `egms` §§II.A–II.C and III.B (lines 134–206, 497–556).
- Library: 139 dotted names resolved with their namespaces at the pins. Opened: Tau Ceti `Hamiltonian/Manifold.lean` 179, 261, 338, 416; `Cotangent/Bundle/Legendre.lean` 121, 198, 277, 468, 510, 532; `Liouville.lean` 144, 279; `Cotangent/StrongDual.lean` 100; `Integrable.lean` 172, 316; `LiouvilleArnold.lean` 79, 360, 391; `Complete.lean` 66, 119; `CommutingFlow.lean` 185; `CentralForce/Integrable.lean` 156; `Kepler.lean` 205; `MomentMap.lean` 84; `ManifoldLevel.lean` 257. Mathlib `LeviCivita.lean` 360; `TranslationNumber.lean` 728, 777, 787.
- Cross-roadmap citations resolved on main: DifferentialGeometry 3.2–3.5, Layers 0–1 and 4, 8.4; SmoothBundlesConnections B1.0, B1.5, B6.1, B6.6; AlgebraicTopology 2.6, 5.1, 6.2; CharacteristicClasses 1.2b; CotangentLagrangian C3, C3.1 and `exists_equiv_periodic_of_generating`; HamiltonianReduction R1, R3, R1a.3; ConvexityToric 1.1; HopfRinow Layer 1 (Completed); SymplecticGeometry S0. At open heads, #2687 and #2690 renumber (R02).
- Automatic checks: every check passed on the worker's run and on mine (text scanners, dependency check, build, no change outside the folder). Dependency check, no UPWARD, CYCLE or moved line: `depcheck: 186 roadmaps, 2086 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives exactly four `declaration uses sorry` warnings (lines 75, 110, 125, 153). `#check @` of all six declarations matches the README statements. The one-tactic probe (rfl, simp, trivial, infer_instance) closed none.
- Description checked against the head: the `Suggested.lean` diff changes comments only; 52 Checks counted; the three content changes it lists (§1.2, the third Check of §5.2, the first Check of §5.3) recomputed and true.
- Previous review (pull request #1651 at 4347340): accepted with no findings, so nothing to account for.

Overlap check: read HamiltonianSystems (open), CotangentLagrangian (main and #2687), HamiltonianReduction (main and #2690), SymplecticGeometry (main and #2696), DGFloer, ContactGeometry, RestrictedThreeBody. Shared objects and their owners:
- Generating functions and the chain dictionary: CotangentLagrangian, cited here.
- The cotangent-lift moment map: HamiltonianReduction R1 and Tau Ceti, cited here.
- Cup length for spaces: AlgebraicTopology and MorseTheory. The flow-theoretic Čech bound of §5.4 is a different statement and is owned here.
- Kepler action variables: this roadmap, on main. The open RestrictedThreeBody builds its own Delaunay coordinates.
- HamiltonianSystems' Noether statement is the Hamiltonian one, and it excludes Lagrangian mechanics and Liouville–Arnold.

Nothing else is shared.

Source independence: 7 passages compared with 5 sources (`cds` Thm. 18.12 and Lemma 18.11, `lecalvez-wang` Thm. 1, `smale1959` Thm. B, `gramain1973` Thm. 1, `egms` §III.B and Def. 4), none shared beyond one-line theorem statements forced by the mathematics. The largest share is arnold-mmcm, 4 of 21 locators. Its contents were not compared, because the text is uncertified and the publisher's table of contents needs a login.

Research link: Layer 2 states the Liouville–Arnold theorem and Duistermaat's 1980 global obstructions (monodromy, Lagrangian class), whose monodromy Efstathiou–Giacobbe–Mardešić–Sugny (2017) compute by rotation forms. Layer 5 proves the Poincaré–Birkhoff theorem (Le Calvez–Wang 2010) by the Conley–Zehnder (1983) route behind the Arnold conjecture. This rests on the README and on `egms` and `lecalvez-wang`.

## Not verifiable

- Arnold, *Mathematical Methods of Classical Mechanics*, §§49–50 and the central-force sections: recorded as uncertified; the publisher's contents page requires a login.
- Marsden–Ratiu, Ch. 7; Duistermaat 1980; Conley–Zehnder 1983; Epstein 1966, Thm. 6.4; Spanier, Ch. 6, §§6.6–6.9: recorded as uncertified, cited by locator only.
- The published (J. Math. Phys.) numbering of Efstathiou et al.: paywalled; the arXiv v2 numbering was checked.

## Source issues

- **Misprint** in egms at §III.A, p. 9: the source says the Hamiltonian field of J = q₁p₂ − q₂p₁ rotates (q₁, q₂) clockwise and (p₁, p₂) counterclockwise; it should rotate both planes in the same sense (for ω = dp∧dq, ι_Xω = dJ, both clockwise); affects nothing.
- **Misprint** in egms at §III.B, p. 11: the source says the polar orbits P₀ and P₋ belong to Π₊; both have q₃ = −1, so it should read Π₋; affects nothing.

## For the human reviewers

- Not tested: the source with the largest share of locators, Arnold's *Mathematical Methods of Classical Mechanics* (4 of 21), could not be read, nor its table of contents (uncertified; publisher page needs a login), so wording and arrangement were not checked against it.
