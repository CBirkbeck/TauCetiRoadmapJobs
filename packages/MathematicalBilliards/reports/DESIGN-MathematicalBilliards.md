# DESIGN-MathematicalBilliards: design report

Files written: `packages/MathematicalBilliards/design/README.md` (12 layers), `packages/MathematicalBilliards/design/plan.json` (57 targets: 13 definitions, 5 constructions, 36 theorems, 3 examples; no gaps), `packages/MathematicalBilliards/sources.toml` (12 keys, two of them new). No `Suggested.lean` was written (not a deliverable of this job), so no Lean was run; the README's own backticked names are listed in "How to read the build" as the declarations `Suggested.lean` must carry.

## What the design covers

Every final target of `target.md` (T1–T11) is planned:

| Target | Where | Notes |
|---|---|---|
| T1 convex tables | §§1.1–1.5 | carrier at `C^k` assumes strict convexity and orientation; positive curvature is the theorem §1.2; plane is `ℂ` |
| T2 billiard ball map | §§2.1–2.6 | `C^{k−1}` for `k ≥ 2`, homeomorphism for `k ≥ 1`, closed cylinder, `T⁻¹ = I T I`, conjugacy with C3.1's `β` |
| T3 generating function, measure | §§3.1–3.3 | Jacobian route at `k ≥ 2`; total mass `2ℓ` |
| T4 twist | §§4.1–4.3 | topological and `C¹` twist lifts, exactness for a primitive `g dx`; non-wandering set §4.4 added (needed by T5) |
| T5 Birkhoff's theorem | §§5.1–5.3 | proved, by Fathi's topological argument (Herman1983 appendix) plus Herman's Lipschitz lemma 2.2 |
| T6 rotation numbers, periodic orbits | §§5.4–5.5, Layer 6 | both Birkhoff orbits planned with a checked route (§6.4) |
| T7 circular table | §§2.6, 5.6 | |
| T8 polygonal tables, trajectories | §§7.1–7.3 | tables with holes; corner bound `⌈π/α⌉` |
| T9 singular set, flow | §§8.1–8.3 | flow = trajectory map on `X_P`, identity on `Σ`, an honest `AddAction ℝ` |
| T10 rational tables, KZ surface | Layer 9, Layers 10–11 | general translation surfaces (Layer 10) rather than a KZ-only construction |
| T11 weak mixing | Layer 12 | definition, ergodicity, torus flows, eigenfunction criterion; Koopman continuity and Wiener's lemma owned here |

### Questions the target left to the design, settled

- **Whether area preservation can be weakened in Birkhoff's theorem.** Settled from the source: Fathi's theorem (Herman1983, line 1150) needs only that the invariant annular region lies in the non-wandering set; area preservation enters only through Poincaré recurrence (Herman1983 3.4.4, line 434; C3.1's finite-volume recurrence). §5.2 states the region theorem with the non-wandering hypothesis, §5.3 the curve theorem with "every point of the open annulus non-wandering", and the billiard case derives that hypothesis from §3.3.
- **The second `(p, q)` orbit.** IntegrableSystems I5's Poincaré–Birkhoff theorem needs a smooth diffeomorphism of the closed annulus, which the billiard map is not at the boundary (Check of §2.3: at a flat point of the superellipse `s₁ − s ≈ (4δ)^{1/3}`), and it gives fixed points of an iterate, not distinct orbits. §6.4 instead uses the cup-length bound of IntegrableSystems I5.4 on `P_ε/Γ`, `Γ = ⟨σ, d⟩ ≅ ℤ`, with a pseudo-gradient pointing inward near degenerate configurations; quotienting by `σ` is what makes the two rest points two orbits. The plain ε-box is not forward invariant for the gradient (at a corner where three consecutive gaps equal `ε`, `ġ_k` is `O(ε³κ′)` of either sign), which is why a pseudo-gradient is used.
- **Generality of the periodic-orbit theorems.** §§6.2–6.4 hold for `k ≥ 1`: they use only first derivatives of `L` and the boundary continuity of §2.3; the target's `C²` is a special case.
- **Rotation numbers.** The target asked for `ρ ∈ [0, 1]`; for a rotational invariant curve in the open cylinder the sharper `ρ ∈ (0, 1)` holds (`g(x) − x` is continuous, `ℓ`-periodic, valued in `(0, ℓ)`), and is stated.
- **The genus of `S_P`.** Computed through `TauCeti.eulerChar` and Mayer–Vietoris, with the genus of GeometricTopology §1.7; TeichmullerGeometry §0.0f (an open pull request) is therefore not needed and not cited.

## Ownership

- **SymplecticGeometry/CotangentLagrangian C3.1 (main).** The single construction of the convex billiard map is §2.1 at regularity `C^k`; §2.5 proves `Ψ ∘ T = β ∘ Ψ` for `k = ∞`. C3.1's smooth statements (exactness, measure preservation, critical polygons, the circle) are not restated: §§3.2–3.3 are the `C^k` statements whose `k = ∞` case they are, and §6.3 refines `exists_billiard_periodic_reflection` by the winding number and lowers the regularity. C3.1 cannot consume this roadmap (it is on main and earlier), so the overlap of the `k = ∞` case is the inclusion of a special case in a more general theorem, as the target's Risks section anticipated; no erratum is proposed.
- **IntegrableSystems I5.0 and I5.4 (main):** sign convention (§3.2) and the cup-length machinery (§6.4).
- **RiemannianGeometry/Surfaces §3.1 (main):** the turning theorem, consumed with no corners in §1.2.
- **GeometricTopology §2.3, §1.7 (main):** annulus theorem in dimension two (§5.3), genus (§11.3).
- **Owned here because no roadmap or library has them** (searched by object with `roadmaps grep` over main and all open roadmap pull requests, and in the pins): twist maps, the non-wandering set, rotational invariant curves, translation groupoid and translation surfaces (`translation surface` occurs only as Nelson's counterexample in UnboundedOperators), weak mixing of measure-preserving flows (FactorRigidity §8.2 on main defines weak mixing of trace-preserving actions on von Neumann algebras, a different object), Wiener's lemma, strong continuity of Koopman groups of jointly measurable actions. Bochner's theorem is consumed from Tau Ceti (`TauCeti.bochner_charFun_real`), the material of Completed/OneParameterSemigroups.
- **Never-cite list:** PlanarTopology and SurfaceTopology (crosscut and planar theory) are not cited; the Tau Ceti crosscut and Schoenflies declarations are used instead.
- **Board neighbours:** HardSphereDynamicsAndKineticLimits uses the same almost-everywhere flow shape (trajectory map off a null set, identity on it); this design adopts that shape and owns nothing of hard spheres. HyperbolicDynamicsAndThermodynamicFormalism shares no object (it uses `ErgodicVAdd ℝ X μ` for flow ergodicity, the convention adopted here).
- **Open revisions of the cited roadmaps.** #1187's head carries an older CotangentLagrangian README without C3.1 and an IntegrableSystems README without I5; the overlap tool reports no dropped id for them (the head predates those sections rather than deleting them), so the citations are to main. #1808 and #1854 do not carry those READMEs. GeometricTopology's revisions #1791 and #1797 keep §1.7 and §2.3 at their heads. No citation uses a revision's numbering.
- **Ownership against open pull requests** was checked with `roadmaps grep` (which covers every open roadmap pull request at its head and main) for: billiard, twist map, invariant curve, rotation number, translation surface, weak mixing, non-wandering, mountain pass, minimax, Lusternik, cup length, turning tangent / rotation index, signed curvature, crosscut, Bochner, Wiener's lemma, Koopman.

## Notions moved down from later roadmaps

None. Every supplier is on main; nothing is taken from a roadmap later in the merge order.

## Proposed Part IIs and future roadmaps

- *MathematicalBilliards, Part II*: caustics, Lazutkin's theorem and the KAM curves near the boundary, Aubry–Mather sets of the billiard map; measure preservation for tables of class `C¹` (true, by approximation, but not in the sources and not needed by any consumer).
- The consumer roadmaps of the README: the Birkhoff–Poritsky theorem (BialyMironov2022), weakly mixing polygonal billiards (ChaikaForni2026), and translation surfaces with the `SL₂(ℝ)` action (KerckhoffMasurSmillie1986); the last should take Layer 10 as its floor.

## Gaps

None: every prerequisite is a pinned declaration, a section of a roadmap on main, or a target here.

## Sources

- **Read** (cached, quoted by line): `BialyMironov2022`, `ChaikaForni2026`, and two new open sources fetched through the service: `Herman1983` (Numdam, Astérisque 103–104, open repository; Chapitre I and Fathi's appendix give Birkhoff's theorem with complete proofs) and `Hochman2012` (author's page; Chapter 6 for weak mixing of `ℤ`-actions, adapted here to `ℝ`-actions).
- **Settled, cited by locator only** (not requested again): `KatokHasselblatt1995`, `Tabachnikov2005`, `ChernovMarkarian2006`, `BoldrighiniKeaneMarchetti1978`, `ZemlyakovKatok1975`, `KerckhoffMasurSmillie1986` (waived) and `MasurTabachnikov2002` (uncertified). Their locators are chapter- or section-level and could not be checked against the texts.
- **`Birkhoff1927`:** the manifest records it as certified, but its cached text is a refusal page of the host (five lines, "Request unsuccessful"). It is not quoted and no statement depends on it; the periodic-orbit targets cite `KatokHasselblatt1995`, Section 9.3. It was not listed in `needs-references.toml` (the job has already asked for it, and a third request would block the job); a human should correct the manifest entry.
- No `needs-references.toml` was written: nothing in the design depends on a text that could not be read.

## Adversarial pass

One row per statement; values computed by hand (and the ellipse values below rechecked arithmetically).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Convention: cross product orientation | `1 × i` | `Im(conj 1 · i) = 1` | `i` left of `1` | Check added |
| Convention: positive orientation | circle `R e^{is/R}` vs clockwise, `t − s = πR` | `R(1 − cos π) = 2R`; clockwise `−2R` | orientation pinned by the carrier | clockwise circle is a non-example Check |
| Convention: phase state | unit circle `(0, π/2)` | `e^{iπ/2} · i = −1` at the point `1` | points at the centre | witness |
| Convention: exit point | unit circle `(0, π/2)`; ellipse `(2cos u, sin u)` at `(2,0)`, `δ = π/4` | `(π, π/2)`, `L = 2`; line `(2 − t/√2, t/√2)` meets the ellipse at `t = 4√2/5`, point `(6/5, 4/5)`, `τ₁ = (−8, 3)/√73`, `cos δ₁ = 11/√146`, `sin δ₁ = 5/√146` | consistent with `τ(s₁) = e^{iδ₁} w` (`Im(conj τ₁ · w) < 0`) | used in §3.2–3.3 Checks |
| Convention: twist signs | circle | `∂s₁/∂δ = 2R`, `∂s₁/∂y = 2R/sin δ`, `∂s₁/∂v = −2R/sin δ`; C3.1 states `∂t/∂v < 0` | consistent with C3.1 | stated "negative in `(s, v)`" |
| Convention: measure | `μ_A(A)`, image under `cos` | `ℓ·∫₀^π sin = 2ℓ`; `|d cos δ| = sin δ dδ` | Lebesgue on `(−1, 1)` | none |
| Convention: forms and generator sign | `λ = y ds`, `y = −cos δ` | `−d(y ds) = ds ∧ dy`; `∂_s L = −cos δ = y`, `∂_{s₁}L = cos δ₁ = −Y`; I5.0 needs `y = −∂₁S` ⇒ `S = −L` | matches C3.1 (`−L` = negative perimeter) | stated |
| Convention: rotation number normalisation | circle `δ = π/3`; lift `τ_ℓ⁻¹ ∘ F` | `2R(π/3)/(2πR) = 1/3`; shifted lift gives `−2/3` | `(0, 1)` pins the lift | Check |
| Convention: reflection | horizontal, vertical, diagonal sides | `conj`; `−conj` (`e^{iπ/4} ↦ e^{3iπ/4}`); `σ(1) = e^{iπ/2} = i` | `d² conj v` correct, involutive (`d² conj(d² conj v) = v`) | none |
| Convention: weak mixing with absolute value | horizontal flow on `ℂ/(ℤ+iℤ)`, half-torus | `μ(F^{−t}A ∩ A) = |1/2 − t|`; signed mean `∫₀¹|1/2 − t| dt − 1/4 = 0`; absolute mean `2∫₀^{1/2}|u − 1/4|du = 1/8` | absolute value is essential | Check added (§12.1) |
| 1.1 carrier | circle, clockwise circle, superellipse, stadium, circle–ellipse, reversed parametrisation | `2R`, `−2R`; superellipse `κ = 0` at `(±1,0)`, strictly convex; stadium: tangent line contains a side (value `0`); junction curvatures `1` and `a/b² = 1/(1/4) = 4`; reversal flips the sign | carrier is strictly more general than `κ > 0`; excludes flat sides and wrong orientation | carrier assumes strict convexity, `κ > 0` moved to §1.2 |
| 1.2 curvature criterion | ellipse, `exp(2iu) + exp(iu)`, superellipse | ellipse `a/b² > 0`; `γ′ = ie^{iu}(2e^{iu} + 1) ≠ 0`, `Im(conj γ′ γ″) = 9 + 6 cos u ∈ [3, 15]`, turning `4π` ⇒ not injective; `h″(s) = κ(s)` | injectivity is used exactly through the turning theorem; converse false | first draft's limaçon example `e^{iu} + ½e^{2iu}` had `γ′ = 0` at `u = π`; replaced |
| 1.3 exit points | unit circle, ellipse axis, stadium, superellipse flat point | `s₁ = π`, `2π/3`; `(−2, 0)`; stadium `s₁ ↛ s`; `s₁ − s ≈ (4δ)^{1/3} → 0` | limits hold for every table, fail without strict convexity | Check |
| 1.4 oriented lines | unit circle `(0, π/2)`, reversed line | `(e, c) = (−1, Im(−1)) = (−1, 0)`; reversed direction `−w = e^{i(π − δ₁)}τ(s₁)` ⇒ state `I(T(s, δ))` | correct | first draft's vague Check replaced by this computation |
| 1.5 C3.1 hypotheses | unit circle, stadium, superellipse | `(cos s, sin s)` meets `x = 1` only at `s ≡ 0`; repr sends `1, i` to `e₁, e₂`, preserving the cross product | correct | none |
| 2.1 billiard lift | circle, ellipse major axis, wrong angle convention | `(s + 2Rδ, δ)`; `(2,0)·π/2 ↦ (−2,0)·π/2`; reflection `τ² conj(e^{−iδ₁}τ) = e^{iδ₁}τ`; wrong convention gives `I ∘ T`, `(I∘T)²(s,δ) = (s + ℓ, δ)` | wrong model excluded by the stated `cos δ₁` and reflection law | Check |
| 2.2 regularity | circle; `C¹` table | `∂Φ/∂s₁ = Im(conj w · e^{iδ₁}w) = sin δ₁ > 0`, `∂Φ/∂δ = Im(−iL) = −L`, `∂Φ/∂s = sin δ − κL`; circle `2R`, `1`; `κ(s)` jump `1 → 4` in `∂s₁/∂s` | `k ≥ 2` needed for `C¹`; no division by zero on the open strip | first draft attributed the jump to the exit point; corrected to the starting parameter |
| 2.3 closed cylinder | circle, superellipse | extension `(s + 2Rδ, δ)` on `[0, π]`; `δ₁ → π` as `δ → π` (`⟨−τ, τ⟩ = −1`) | only a homeomorphism in general | statement is topological |
| 2.4 time reversal | circle | `ITI(s,δ) = (s + 2R(π − δ), δ) = (s + ℓ − 2Rδ, δ)` | needs the deck translation on the lift | Check |
| 2.5 conjugacy with C3.1 | circle | `β(s, cos δ) = (s + 2R arccos(cos δ), cos δ) = Ψ(T(s,δ))` | correct | none |
| 2.6 circle | `δ = π/2, 2π/3, π√2/2` | types `(1,2)`, `(2,3)`; aperiodic; perimeter `3·2R sin(π/3) = 3√3R` | correct | none |
| 3.1 chord length | circle | `L = 2R sin((s₁−s)/2R)`, mixed derivative `sin δ/(2R) = sin²δ/L`; general `sin δ sin δ₁/L` from `∂_s u = sin δ Ju/L`, `⟨Ju, τ(s₁)⟩ = sin δ₁` | sign agrees with C3.1 (`−L` negative) | none |
| 3.2 exactness, Jacobian | circle, ellipse off-axis state | `det = 1`; `√73/5 ≈ 1.7088`; `sin δ₁ · det = (5/√146)(√73/5) = 1/√2 = sin δ` | wrong Jacobian `sin δ₁/sin δ` gives `0.585`, excluded | Check added |
| 3.3 measure, 3.3.1 invariance | mass, Lebesgue as wrong model | `2ℓ`; Lebesgue Jacobian `1.709 ≠ 1` at the ellipse state | `sin δ dδ ds` is the invariant one | first draft's unsupported ellipse Check replaced |
| 4.1 twist lifts | shear, rotation, standard map | `∂_y F₁ = 1`; rotation `0`; standard map `det = (1 + 2πε cos)·1 − 1·2πε cos = 1` | definitions discriminate | standard map written in the area-preserving form `(x + Y, Y)` |
| 4.2 exactness | shear, standard map, shifted shear | `y dy = d(y²/2)`; `ε sin 2πx dx + d(Y²/2)`, `∫₀¹ ε sin 2πx = 0`; shifted shear flux `c` | area ≠ exactness | Check |
| 4.3 billiard is twist | circle | `S = −2R sin δ`: `∂_δS = −2R cos δ = g(F)∂_δF₁`, `∂_sS = 0 = g(F)·1 − g` | correct signs | none |
| 4.4, 4.4.1 non-wandering | `(x, y²)`, translation of `ℝ`, billiard | boundary circles only; empty; all of `Ā` (fixed boundary points, recurrence inside) | correct; boundary points of `U` in §5.2 are covered | API bullet on closures |
| 5.1, 5.1.1 rotational curves | `δ = c`, small circle, union of two circles | invariant & essential; null-homotopic; not an injective image | correct | components invariant only when `f` preserves ends (stated) |
| 5.2 Birkhoff–Fathi | shear on `[0, 2)`, `1/4`-rotation-invariant curve, `U` = whole annulus | frontier `y = 1`; curve `(t + 0.1 sin 8πt, 1 + 0.1 sin 8πt)`: `min dx/dt = 1 − 0.8π ≈ −1.513 < 0` (not a graph), simple (equal heights ⇒ equal `x − t`), invariant under `x ↦ x + 1/4`; empty frontier | twist and relative compactness are needed | first-draft Check on a dissipative map was unsupported and was replaced |
| 5.3 graph theorem | circle table; rotation example | Lipschitz bound `0/(2R) = 0`, `0/(−2R) = 0` | hypotheses used: twist, non-wandering, annulus theorem | Lipschitz constant stated at points of `C` |
| 5.3.1 billiard case | `k ≥ 2` | hypotheses from §4.3, §4.4.1, §3.3.1 | holds | none |
| 5.4, 5.4.1 rotation number | circle, time reversal, nested circles | `c/π`; `2/3 = 1 − 1/3`; `c₁/π < c₂/π`; `ρ ∈ [ε, 1−ε]` from `g(x) − x ∈ [εℓ, (1−ε)ℓ]` | `(0, 1)` strict | sharpened from the target's `[0, 1]`; monotonicity stated for positive twists |
| 5.5 rational curves | diameters, `δ = π√2/2`, two fixed points | type `(1,2)` everywhere; none; `(δ_{x₁}+δ_{x₂})/2` not full support | full support needed | Check |
| 5.6 circle foliation | perturbed curve at `(ℓ/4, c + ε)` | image at parameter `ℓ/4 + 2R(c+ε)`, curve height `c + ε cos(2(c + ε)) ≠ c + ε` since `0 < c + ε < π` | not invariant | first draft's garbled Check replaced |
| 6.1 configurations | `(1,2)`, `(2,3)` on unit circle, `p = q`, freeness of `Γ` | `W = 2L`; gaps `4π/3`, `W = 3√3`; `p = q` all gaps `ℓ`; stabiliser `(a,−b) ∈ ℤ(q,p)` since the period group has rank 1 and `gcd = 1` | `Γ ≅ ℤ` free | none |
| 6.2 chain dictionary | equilateral, `(0, π/2, π)` | `δ′ = δ = π/3`; at `s = 0`, `cos δ′ = ⟨1, i⟩ = 0`, `cos δ = 1/√2` (agrees with C3.1's own Check) | correct; least period `q` by coprimality | none |
| 6.3 maximal orbit | circle `(1,3)`, `(1,2)`, `(1,4)`; ellipse | `3√3`, `4`, square `4√2 ≈ 5.657` (concavity of `Σ 2 sin(g/2)`) vs unconstrained doubled diameter `8`; ellipse `8` | winding constraint matters | Check |
| 6.4 two orbits | ellipse `(1,2)`, circle | axes `W = 8` and `W = 4`; continuum on the circle | at least two; quotient by `σ` needed | route uses a pseudo-gradient (the ε-box is not gradient-invariant) |
| 7.1 polygonal tables | square, holed square, touching squares, flat vertex | angle sums `2π = (4 − 2)π`, `8π = (8 − 2 + 2)π`; non-disjoint frontiers; Tau Ceti `IsSimple` allows collinear edges | correct | API: angle-sum formula with holes |
| 7.2 phase space | reflections, quarter square | values above; `μ_P = 1/4` | correct | none |
| 7.3 corner bound | `α = π/2, 2π/3, 3π/2, π/3` | `2, 2, 1, 3` rays in an open interval of length `π` | equals `⌈π/α⌉` | none |
| 8.1 singular set | two square states | vertex `(1,1)` reached; unfolded line `y − x = −1/4` meets no lattice point | correct; `Σ` not closed | none |
| 8.2 flow | square, `((1/2,1/2), 1)` | `t = 1/2` at `(1, 1/2)`; `t = 1`: `((1/2,1/2), −1)`; `t = 2`: back | group law holds with identity on `Σ` | continuity claim restated on `ℝ × X_P` |
| 8.3 invariance, reversibility | same state `x = ((1/2,1/2), 1)` | `J x = ((1/2,1/2), −1)`, `F¹(J x) = ((1/2,1/2), 1)`, so `J F¹ J x = ((1/2,1/2), −1)`; and `F¹((1/2,1/2), −1) = x`, so `F⁻¹ x = ((1/2,1/2), −1)` | correct | none |
| 9.1 reflection group | square, equilateral, `π/√2` triangle | orders `4`, `6`, infinite | dihedral, `N ≥ 2` for tables | none |
| 9.2 angle criterion | `π/8` triangle, L-shape, rotated hole | `lcm(2, 8, 8) = 8`, order `16`; `N = 2`; infinite though angles rational | criterion only for `h = 0` | holes stated separately |
| 9.3 non-ergodicity | square `f = cos 2φ`; `N = 1` | `cos(−2φ) = cos 2φ`, `cos(2(π − φ)) = cos 2φ`; `Re v ↦ −Re v` under `−conj` | exponent `N` needed; general invariance from `(d e^{2πij/N} conj v)^N = conj((conj d · v)^N)` | none |
| 10.1 translation groupoid | `z + 3i`, `2z`, `conj`, `−z`, two-component map | derivatives `1`, `2`, antiholomorphic, `−1`, `1` | half-translation excluded | none |
| 10.2 translation surfaces | torus, octagon, pillowcase corner | octagon `8 · 3π/4 = 6π`, `k = 3`; `k = 1/2` excluded | integrality is part of the carrier | general Gauss–Bonnet removed from the API (no route at that generality); proved for `S_P` in §11.3 |
| 10.3 flat area | torus, octagon | covolume; `2(1 + √2) ≈ 4.828` | correct | none |
| 10.4 directional flow | torus, `θ = e^{iπ/4}` | `√2 e^{iπ/4} = 1 + i ≡ 0` | closed leaf | none |
| 10.5 flat tori | `2ℤ + 2iℤ` | area `4` | statement extended to all `k = 1` surfaces (developing map) | genus-1 phrasing replaced |
| 11.1 KZ surface | square, equilateral, `π/8` | classes `4/4 = 1`; `6/6 = 1`; `16/4 = 4`, `16/16 = 1`, `1` | correct | none |
| 11.2 translation structure | translation constant | `σ(a + rd) − (a + rd) = σa − a` (`σd = d² conj d = d`) | independent of `x₀` | Check |
| 11.3 Euler characteristic, genus | square, equilateral, `π/8`, L-shape, holed square | `χ = 0, 0, −2, −2, −8`; genera `1, 1, 2, 2, 5`; `Σ(k − 1) = 0, 0, 2, 2, 8 = 2g − 2`; simple-polygon formula `1 + 4·(2/8) = 2`, `1 + 1·(2/2) = 2` | formulas agree with each other and with the target's Checks | none |
| 11.4 unfolding conjugacy | square `θ = e^{iπ/6}`, `θ = 1`; `π/8` area | stabiliser trivial (`θ ∉ {±1, ±i}`); `θ = 1` fixed by `conj`; `16 · tan(π/8)/2 = 8(√2 − 1) ≈ 3.314` = area of the regular octagon of apothem `1` | trivial stabiliser needed | Check |
| 12.1 weak mixing | two-point space, torus half, point | `1/4`; `0` vs `1/8`; trivially `0` | definition separates WM from ergodic | Check |
| 12.2 WM ⇒ ergodic | invariant `A` | integrand `μ(A) − μ(A)²` | correct; converse fails (torus) | none |
| 12.3 Koopman continuity | circle translation, identity | `U_t e_n = e^{2πint}e_n` | route needs only joint measurability (orthogonal of averaged vectors is `0` by Fubini) | no separability assumed |
| 12.4 Wiener's lemma | `δ₀`, `(δ₀ + δ₁)/2`, Lebesgue on `[0,1]` | limits `1`, `(1 + cos t)/2 → 1/2 = 1/4 + 1/4`, `(2 − 2cos t)/t² → 0` | correct; kernel bounded by `1` | none |
| 12.5 eigenfunction criterion | torus, constants | `e^{2πi⟨λ*, z⟩}` eigenvalue `⟨λ*, θ⟩`; atom at `ξ = 2πa` | atoms ↔ eigenvalues with the `exp(itξ)` convention | atom location corrected to `2πa` |
| 12.6 examples | square, equilateral | `Re(v²)` invariant; `S_P` a torus (all `m_v = 1`) | correct | genus-1 condition restated as "all `m_v = 1`" |

Context and generality checks: every Lean-facing statement carries its regularity hypothesis (`1 ≤ k` or `2 ≤ k`) in the sentence; the plane is `ℂ` throughout and the comparison with C3.1's `EuclideanSpace ℝ (Fin 2)` goes through `Complex.orthonormalBasisOneI.repr`. Unused-hypothesis note (P3): §3.3.1 is stated for `k ≥ 2` (the Jacobian route); for `k = 1` it is true by approximation but not claimed. Duplication by object: the pins were searched for billiards, twist maps, non-wandering sets, weak mixing, translation groupoids, Wiener's lemma and a finite-dimensional mountain pass; none exists, and the declarations consumed instead are listed with their files in the supplier contracts.

## Dependency check

```
$ tauceti-roadmap gate --candidate packages/MathematicalBilliards/design/README.md --only MathematicalBilliards --order merge-order/ORDER.txt --content <content checkout>
candidate: MathematicalBilliards is not in the merge order yet; checked as if placed after QuasiregularMaps (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2132 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every supplier is on main, so the roadmap can be placed anywhere after them.

`roadmaps resolve` lists two leads, `BoldrighiniKeaneMarchetti1978, §2` and `MasurTabachnikov2002, §1`, as cross-roadmap citations found nowhere: these are source keys with their locators, not roadmap citations (false positives of the citation parser). No Lean name was reported missing.

## Suspicious text

None. No fetched page, roadmap or source contained an instruction.
