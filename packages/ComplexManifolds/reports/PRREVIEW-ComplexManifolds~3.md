# Review of ComplexManifolds (pull request #2549 at 6611a6e)

**Verdict:** needs changes

**Summary.** Changes are needed, for one missing hypothesis: §7.6 states the deck-character construction and theorem for "a complex manifold `M`", but in this README a complex manifold need not be Hausdorff, and without Hausdorffness the associated line bundle does not exist (a compact connected example is below). The Summary and Layer 4 already carry the hypothesis, so the repair is one word in §7.6 and in the `Suggested.lean` docstring. There is also one small correction (two "remaining targets", §1.4 and half of §4.5, hold by definition at the pins) and one format note; neither blocks. For the human reviewers: seven of the eight cited textbooks cannot be read legally here.

## R01 (P2) — §7.6 omits the Hausdorff hypothesis, and without it the line bundle `L_χ` of a character need not exist

An implementer who takes §7.6 at its word will try to build `L_χ` over every free finite quotient of a complex manifold, and the README's own convention makes that class too large. §7.6 (line 851) begins "Let a finite group `G` act freely by biholomorphisms on a complex manifold `M`", and the docstring of `Suggested.lean` (lines 49–51) says "on a compact connected complex manifold with a free action of a finite group". In this README a complex manifold is a charted space with a holomorphic atlas and no separation axiom: §6.6 calls the doubled origin "nevertheless a complex manifold". The Summary's version of the theorem does say "Hausdorff, locally compact", and Layer 4 fixes `T2Space M`, so §7.6 is weaker in hypotheses than the headline it implements.

The hypothesis is needed. Take a complex torus `T = ℂ/Λ`, double each of its four 2-torsion points by gluing two copies of `T` along `T ∖ T[2]` by the identity (compatible by §5.4), and let `ℤ/2` act by `z ↦ −z`, exchanging the two copies of each doubled point. `M` is compact and connected, the action is by biholomorphisms and is free. Near a doubled point `p₁` every neighbourhood contains both `z` and `−z`, so the orbit projection is not injective near `p₁` and is not a local homeomorphism; `M/G` gets no structure from §4.1. For `χ(1) = −1`, a continuous `f` with `f(g x) = χ(g) f(x)` has `f(p₁) = lim f(z) = f(p₂)` and `f(p₂) = −f(p₁)`, so every section vanishes over the image of `p`: the quotient of `M × ℂ` is not a line bundle there.

The smallest change: write "a Hausdorff complex manifold `M`" in the first sentence of §7.6 (finiteness of `G` then gives proper discontinuity, and Layer 4 applies), and add "Hausdorff" to the third bullet of the not-statable list in the `Suggested.lean` docstring.

## C01 — Open restriction (§1.4) and the realification half of §4.5 hold by definition at the pins, so as targets they ask for nothing

§1.4 (lines 189–191) asks to prove that "the realified manifold structure of the open submanifold `U` is the open submanifold of the realified `M`, so that the identity of `U` is a diffeomorphism between the two", and §4.5 asks the same of the orbit space; Scope lists both among the targets that remain. Realification keeps the charted space and changes only the model (§1.1 says so: "The real charted space is the complex one itself"), and the atlas on `U` and on the orbit space does not mention the model. So on each side there is one `ChartedSpace` and two proofs of the same proposition `IsManifold 𝓘(ℝ, E) n _`. I elaborated both at the pins: the instance obtained from `IsManifold.restrictScalars` on `U` equals the open-subset instance of the realified `M` by `rfl`, `Diffeomorph.refl` is the comparison, and the same holds for `MulAction.orbitRel.Quotient G M` with `ContMDiffConstSMul.restrictScalars`.

If these are kept as sanity checks, saying so (as §5.5 does: "The glued charted space does not depend on the model") would be enough, and Scope would then list only the recharting half of §4.5, which does need an instance for the transported model.

## N01 — §7.4 fixes the normal-bundle cocycle as `u_α/u_β`, but no Check tells the normal bundle from its dual

Carried over unchanged from the previous review. With the cocycle inverted, §7.4 would glue the conormal bundle and nothing would catch it. One Check would: for the line `{x₂ = 0}` in `ℙ²` the cocycle is `x₁/x₀`, giving `O(1)` with a section vanishing once; the inverse gives `O(−1)`, with no nonzero section.

## Questions for the author

- The contract for SmoothBundlesConnections §B2.1 (lines 1127–1130) assumes its tensor and exterior-power carriers are "generic over the field". §B2.1 on main asks for smooth finite-rank tensor, dual, exterior-power, direct-sum and Hom bundles but discusses complex bundles only over a real base. Is the generic-field form agreed with that roadmap? Its text alone does not settle it.

## Previous findings

- N01 of the previous review (the §7.4 Check) — not repaired: the head is unchanged; carried as N01 above.
- The previous review had no findings and no small corrections.

## Deferred findings

- D01 — stands

## Verified sound

| Statement | Instances tried | Values computed (README side / library or computation side) | Result | Change |
|---|---|---|---|---|
| §1.1 underlying real model | `z ↦ z̄` on `ℂ` | real-smooth, `∂̄ z̄ = 1 ≠ 0` / pinned `IsManifold.restrictScalars`: same `ChartedSpace`, model `𝓘(𝕜, E)` | holds | none |
| §1.2 functoriality | `Diffeomorph.restrictScalars`, `_symm`, `_trans` | same underlying map / Diffeomorph/RestrictScalars.lean:60, 97, 102 | at pin | none |
| §1.4 open restriction | `U` open in `M`, `E` any | two `IsManifold 𝓘(ℝ, E) n U` instances equal by `rfl`; comparison is `Diffeomorph.refl` | true by definition | C01 |
| §1.5 Check | `n = 2` | `(x₁,y₁,x₂,y₂) → (x₁,x₂,y₁,y₂)`: one transposition, det `−1` | holds | none |
| §2.3 factor interchange | `m = m' = 1` | `(13)(24)`, sign `+1` = `(−1)^(2·2)` / `(−1)^(mm') = −1` | holds | none |
| §2.4 biholomorphisms preserve orientation | `z ↦ 2z`, `z ↦ z̄` | Jacobian `4 > 0` / `−1`, reverses; pinned lemmas need `n ≠ 0`, as the contract says | holds | none |
| §3.4 Möbius action | `[[0,1],[1,0]]`, `2·1`, `[v₀:v₁]` | `1/z`, `0 ↦ ∞` / `(2z)/2 = z`; `equivProjectivization` sends `t ↦ [t:1]`, so finite chart `v₀/v₁` | holds | none |
| §4.1 right-inverse atlases | `ℤ` on `ℂ`, `g = out`, `out + 1` | transition `z ↦ z + 1` / pinned `isLocalDiffeomorph_chartedSpaceOfRightInverse` for any `g`; comparison not at pin | holds; real target | none |
| §4.3 section descent | fibre bundle `V`, `m ≤ n` | README iff / Quotient/Section.lean:89 same; pullback form (:118) adds nonempty fibres | holds | none |
| §4.4 compact quotients | `ℤ + ℤi`, `ℤ` on `ℂ` | unit square meets all orbits / `Im` bounded on compacts, so `ℂ/ℤ` not compact | holds | none |
| §4.5 realification of quotients | `G` on `M`, model `𝓘(ℂ, E)` | two `IsManifold 𝓘(ℝ, E) n (M/G)` instances equal by `rfl` | true by definition | C01 |
| §5.1 compatibility | conjugate overlap atlas; `1/z̄` | `D.t` reads `id`, `D.f 0 1` reads `w ↦ w̄` / pinned structure: `f i j` and `f j i ∘ t i j` local diffeomorphisms | holds | none |
| §5.3 uniqueness | any `c` with `ι i` local diffeomorphisms | equal maximal atlases / Gluing/GlueData.lean:242, same hypotheses | at pin | none |
| §5.4 two-chart gluing | `z ↦ z⁻¹`; identity | identity and `w ↦ w⁻¹`, `0 ↦ ∞`: sphere / doubled origin | holds | none |
| §6.2 Hausdorff criterion | doubled origin; sphere; `i = j` | `(0,0) ∈ closure`, not in `chartRel 0 1` / `{zw = 1}` closed / `chartRel i i` = diagonal, so pieces need no hypothesis | holds | none |
| §6.2 checkable forms | `x ∉ range f i j`, `y ∉ range f j i` | README "points outside the two overlaps" / GlueData.lean:157, 189, 200 same quantifiers | holds | none |
| §6.3 connectedness | `ℂ ⊔ ℂ`; doubled origin | no edge, disconnected / `V(0,1) ≠ ∅`, connected; pin needs `Nonempty D.J`, connected pieces | holds | none |
| §6.4 properness local on target | `ℂ ∖ {0} ↪ ℂ` | preimage of closed disc not compact / over `ℂ ∖ {0}` a homeomorphism; pin: no separation axiom | holds | none |
| §6.6 doubled origin | `X = ℂ`, `U = ℂ ∖ {0}`; `U = X` | `T2 ↔ T2 X ∧ U closed`: false / `U = X` gives `X`, true | holds | none |
| §7.3 line bundles | `zᵏ` vs `2ᵏzᵏ` | coboundary `c₀ = 2ᵏ`, `c₁ = 1` / FrameTrivialization.lean:444 needs `finrank = 1` | holds | none |
| §7.4 cocycle direction | `{x₂ = 0} ⊂ ℙ²` | `u₀/u₁ = x₁/x₀`: `O(1)` / inverse: `O(−1)`; Demailly (13.5) has `g_αβ = u_α/u_β` | holds; no Check | N01 |
| §7.5 Check and Example | `w = 1/z` | `dw = −z⁻²dz`, `∂/∂w = −z²∂/∂z`, product `1` / `∂/∂z = −w²∂/∂w`, zero of order 2 at `∞` | holds | none |
| §7.6 deck characters (headline 2) | `ℂ ∖ {0}`, `z ↦ −z`; torus, half-period; torus with doubled 2-torsion, `z ↦ −z` | `f = z` trivializes / constant `f = −f` gives `0` / non-Hausdorff: projection not locally injective, sections vanish at `p` | false without Hausdorff | R01 |
| Headline 1, realification and orientation | `𝓘(ℂ, E)` | `|det_ℂ|² > 0` / pinned `IsManifold.restrictScalars`, `complexManifoldOrientation` | at pin | none |
| Headline 2, quotients and descent | `exp(2πiz)` on `ℂ/ℤ`; glide reflection | injective, image `ℂ ∖ {0}` / Möbius band, not orientable; pin has `T2Space M` | at pin | none |
| Headline 3, gluing | sphere, doubled origin | pinned `IsCompatible.isManifold`, `t2Space_iff_isClosed_chartRel` with no hypothesis on pieces | at pin | none |

- Source locators checked against a text: 5 (Demailly V §6 p. 261, V (13.5) p. 271, VII (3.4) p. 334, VII (12.4) a) p. 357; mathlib4#40727 at 9da60c2, lines 57–59). All support the text. Of the seeded sample only §7.6 cites a readable text.
- Library names: all 274 code-font identifiers of the README checked. 168 resolved by `#check` at the pins (the additive variants among them), 73 by reading the declaration in the pinned Mathlib or Tau Ceti source, and the remaining 33 are variables, file names or names of the two cited Mathlib pull requests, which the README does not claim are at the pins.
- Library declarations read at the pins: Tau Ceti `Topology/Category/TopCat/GlueData.lean:60–255`, `GlueData/Double.lean:110–186`, `Topology/Maps/Proper/LocalAtTarget.lean:39–60`, `Geometry/Manifold/Gluing/GlueData.lean:95–250`, `Geometry/Manifold/Instances/Quotient.lean:60–260`, `Geometry/Manifold/Quotient/Section.lean:60–125`, `VectorBundle/FrameTrivialization.lean:425–450`, `VectorBundle/CoordinateHom.lean:185–205`, `IsManifold/RestrictScalars.lean:45–102`, `Algebra/SMul.lean:120–136`; Mathlib `Geometry/Manifold/Instances/Quotient.lean:36–52`, `Geometry/Manifold/Complex.lean:164`.
- Probes elaborated at the pins: the two definitional equalities of C01 and the identity diffeomorphism of §1.4.
- Cross-roadmap citations resolved on main: DifferentialGeometry Layer 2 (2.1, 2.2) and Layer 10, SmoothBundlesConnections §B2.1, GeometricTopology Layer 1 §§1.1–1.4, ConformalMapping Layers 3–4, UniversalCovers, AnalyticToricGeometry; consumer claims for FuchsianOrbifolds, ComplexTori and ComplexKahlerGeometry hold, and ConformalMapping does not cite this roadmap, as the README says.
- Dependency check: `depcheck: 200 roadmaps, 2198 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. `Suggested.lean` elaborates with no output; it declares nothing, so there is no signature to compare and nothing for the one-tactic probe. Nothing changed outside the folder.
- The pull request's description was read against the head: its 28 Checks, the Milestone-to-Layer sentence, the MorseTheory link and the list of removed declarations all agree with it.

Overlap check: read ComplexTori (main and its open revision), ComplexKahlerGeometry (main and its open revision), SmoothBundlesConnections, ComplexCurveModuli, QuasiregularMaps. Shared objects: quotients, gluing, §7.4 and §7.6 are owned here and consumed by ComplexTori and ComplexKahlerGeometry (which extends §7.4 to higher codimension); the tensor and exterior-power carriers are owned by SmoothBundlesConnections §B2.1. Nothing is owned twice.

Source independence: 7 passages compared with 2 sources (demailly-agbook, mathlib4-pr-40727), none shared beyond standard names and formulas; largest share demailly-agbook, 4 of 15 in-text locators; contents compared with demailly-agbook (Chapters I–IX: pseudoconvexity, sheaves, currents, cohomology, Hermitian bundles, Hodge theory, vanishing, L² estimates, Stein spaces): independent of Layers 1–7. The seven other texts could not be read.

Research link: foundational complex-manifold infrastructure. By the README's Downstream consumers, ComplexKahlerGeometry, ComplexTori, AnalyticToricGeometry and FuchsianOrbifolds build on Layers 1–7; Layer 7's divisor, normal and canonical bundles are the objects Demailly 2012 (Ch. V §13, Ch. VII §§3, 12) uses for vanishing theorems and blow-ups. Rests on the README and demailly-agbook.

## Not verifiable

- Kobayashi–Nomizu, *Foundations of Differential Geometry* I, Chapter I (§§1.1, 1.2, 5.1, 5.3, 5.4): not in the roadmap's source manifest or the sources cache; paywalled.
- Huybrechts, *Complex Geometry*, Chapters 1–2 (§§1.1, 1.2, 7.3): not in the manifest or cache; paywalled.
- Bott–Tu, *Differential Forms in Algebraic Topology*, Section 1 (§2.4): not in the manifest or cache; paywalled.
- Forster, *Lectures on Riemann Surfaces*, Sections 1–2 and 4–5 (§§3.4, 4.3, 4.5): not in the manifest or cache; paywalled.
- Lee, *Introduction to Smooth Manifolds*, Chapters 1 and 21 (§§4.3, 4.5, 5.1, 5.3, 5.4): not in the manifest or cache; paywalled.
- Bourbaki, *General Topology*, Chapter I (§§6.2, 6.3, 6.4, 6.6): not in the manifest or cache; paywalled.
- Steenrod, *The Topology of Fibre Bundles* (§7.3, no locator): not in the manifest or cache; paywalled.
- For these sampled sections the statements were checked against the pinned declarations and by computation instead (table above); the chapter-level locators themselves were not read.

## Source issues

- none

## For the human reviewers

- Not tested: seven cited textbooks (Kobayashi–Nomizu, Huybrechts, Bott–Tu, Forster, Lee, Steenrod, Bourbaki) carry 11 of the README's 15 in-text locators and are not legally readable here; wording and arrangement were compared only with demailly-agbook (4 locators) and mathlib4-pr-40727.
