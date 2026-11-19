# Review of ComplexManifolds (pull request #2549 at 4d49836)

**Verdict:** needs changes

**Summary.** Two blocking findings, both about what the plan asks of an implementer. §4.1 asks for a comparison with an atlas that exists only in an open Mathlib pull request, and nothing at the pins or in this roadmap supplies it. §1.3 lists as a remaining target the model-transport laws, which the pinned Tau Ceti already proves. There are four small corrections, including that the one theorem in `Suggested.lean` follows in one term from pinned lemmas, and one format note. For the human reviewers: none of the seven cited textbooks could be read, so the wording and arrangement checks were not run against any source.

## R01 (P2) — §4.1 asks for a comparison with an atlas that neither the pins nor any layer provides

An implementer cannot discharge this clause of §4.1 in Tau Ceti. One side of the comparison is not at the pinned Mathlib or Tau Ceti, and no layer asks for it to be built. The clause is in §4.1 (README lines 423–424): "and the atlas built from local inverses of the orbit projection in mathlib4#40727 is compared with the installed one in the same way". mathlib4#40727 is still open (its GitHub page, read today, shows it open). The pinned Mathlib file `Mathlib/Geometry/Manifold/Instances/Quotient.lean` contains only `MulAction.instChartedSpaceQuotient`, built with `IsLocalHomeomorph.chartedSpace`, and has none of that pull request's declarations (`orbitRel.Quotient.localInverseAt`, `MulAction.isManifold_quotient_of_contMDiffConstSMul`). The pinned Tau Ceti has none of them either. So, as written, the target waits on Mathlib, against the repository rule that nothing on a roadmap is pending upstream.

The smallest repair is one of these. Drop the clause, and keep mathlib4#40727 in the References as the design the quotient API follows (the Scope section already says that cited Mathlib work fixes the shape of the API). Or restate the clause about an object at the pins, for instance any atlas whose charts are charts of `M` pushed forward along local inverses of the orbit projection. Or make building that local-inverse atlas a target here, shaped like the pull request.

## R02 (P2) — The model-transport laws of §1.3 are already proved at the Tau Ceti pin, yet the README plans them as a target

The README asks an implementer to prove declarations that exist, and a reader of the Scope section is told the library lacks them. §1.3 (lines 165–168) asks to "Prove the corresponding laws for model transport", meaning transport along the identity equivalence and along a composite. Scope (lines 907–908) lists "model transport laws (§1.3)" among the targets that remain. The pinned Tau Ceti file `TauCeti/Geometry/Manifold/ModelWithCorners/LinearEquiv.lean` proves both laws as equalities of models: `ModelWithCorners.transContinuousLinearEquiv_refl` (line 47) and `ModelWithCorners.transContinuousLinearEquiv_trans` (line 53). The same file proves `ModelWithCorners.maximalAtlas_transContinuousLinearEquiv`, that the maximal atlas does not change under the transport. The comparison diffeomorphism is Mathlib's `ContinuousLinearEquiv.toTransContinuousLinearEquiv`, whose underlying map is the identity, so the composition clause follows from these equalities.

The fix: cite the three declarations in §1.3 and under "From Tau Ceti", and remove "model transport laws (§1.3)" from the list of remaining targets. If a separate composition lemma for the comparison diffeomorphisms is wanted, state only that lemma as the target.

## C01 — The one theorem of `Suggested.lean` follows in one term from pinned lemmas, and it carries a hypothesis that §6.2 calls unused

As a target, `glued_t2Space_of_isClosed_rel` asks an implementer for nothing. I elaborated the following at the pins, with the binder `[∀ i, T2Space (D.U i)]` removed, and it is accepted:
`(t2Space_iff_of_isOpenQuotientMap D.isOpenQuotientMap_sigma_ι).2 <| by simpa only [D.ι_eq_iff_rel] using hrel`.
It uses Mathlib's `t2Space_iff_of_isOpenQuotientMap` (`Mathlib/Topology/Separation/Hausdorff.lean`, line 171) and Tau Ceti's `TopCat.GlueData.isOpenQuotientMap_sigma_ι` (`TauCeti/Topology/Category/TopCat/GlueData.lean`, line 71). This is also the first step of the pinned proof of `TopCat.GlueData.t2Space_iff_isClosed_chartRel`. §6.2 itself says that Hausdorffness of the pieces is not used (lines 636–637), yet the theorem keeps the hypothesis.

Possible repairs, depending on intent:
- mark the theorem as a sanity check;
- or cite the two lemmas in §6.2 and remove "the Hausdorff criterion in generated-relation form (§6.2)" from the remaining targets (Scope, line 911) and from the module docstring (line 38). The file then states no theorem, and its docstring says why, which the rules allow.

In either case, the `T2Space` binder would go.

## C02 — §6.5 calls §6.4 a result about maps out of glued spaces, but §6.4 is local on the target

§6.5 (line 688) lists "the locality of properness for maps out of glued spaces" among the four results above. §6.4 is about a map into a space with an open cover. Read as written, the statement is false. Take countably many points glued along empty overlaps, mapped to a single point: the restriction to each piece is proper, but a map from an infinite discrete space to a point is not. Writing "maps into glued spaces" fixes it.

## C03 — The substantive Layer 7 targets cite no theorem or page

§7.4 (the transition-cocycle model of the normal bundle and its isomorphism with the quotient bundle) and §7.5 (the canonical bundle and its identification with alternating `n`-forms) rely only on the layer-level "Huybrechts, Chapters 1–2". §7.6 (the deck-character theorem) cites no source at all. A reader checking these statements has nowhere to look. One theorem- or page-level locator for each would be enough.

## C04 — The description's list of targets "not at the pins" includes two that are

The sentence "Not at the pins, and so still targets: the model-transport laws and open restriction (§§1.3–1.4), …, the generated-relation form of the Hausdorff criterion and §6.5, …" no longer matches the pins. The model-transport laws are pinned Tau Ceti theorems (R02), and the generated-relation criterion is a one-term corollary of pinned lemmas (C01). After the repairs it would read "Not at the pins, and so still targets: open restriction (§1.4), …, §6.5, …". Also drop "the generated-relation form" from the Suggested.lean paragraph if the theorem is marked or removed.

## N01 — An anchor link from MorseTheory breaks with the renamed heading

MorseTheory on main (README line 1216) links to `../ComplexManifolds/README.md#milestone-1-restriction-of-scalars-and-atlas-transport`. After this change that fragment no longer resolves. The mapping sentence at lines 56–57 covers the textual citations, not the link. An HTML anchor with the old id just before the Layer 1 heading would keep the link working.

## Questions for the author

- The supplier contract for SmoothBundlesConnections §B2.1 (lines 1106–1109) assumes its tensor, exterior-power, dual and Hom carriers are "generic over the field", so that over a complex base model they are ℂ-bundles whose holomorphy §7.2 can prove. §B2.1 on main does say to build smooth finite-rank tensor, dual, exterior-power, direct-sum and Hom bundles. But it treats complex bundles over a real base and never names the field of the base. Is the genericity agreed with that roadmap? I could not tell from its text alone.

## Verified sound

| Statement | Instances tried | Values computed (README side / library or computation side) | Result | Change |
|---|---|---|---|---|
| §1.3 model-transport laws | `e = refl`, `e` then `e'` | README: target to prove / Tau Ceti `transContinuousLinearEquiv_refl`, `_trans` exist at LinearEquiv.lean:47, 53 | already at pin | R02 |
| §1.5 interleaved coordinates | n = 0, 1, 2 | n = 2: (x₁,y₁,x₂,y₂)→(x₁,x₂,y₁,y₂) is one transposition, det −1 / n = 1: same coordinates | holds | none |
| §2.1 orientation of a complex space | c = a+bi, conjugation | det [[a,−b],[b,a]] = a²+b² > 0 / conjugation det −1, (1,i) and (1,−i) opposite | holds | none |
| §2.3 factor interchange | m = m′ = 1; general | (−1)^(2m·2m′) = +1; two transpositions, sign +1 / wrong variant (−1)^(mm′) = −1 | holds; not at pin (no manifold-level `prodComm` in Complex/Orientation.lean) | none |
| §2.4 biholomorphisms preserve orientation | z↦2z, z↦z̄ | real Jacobian 4 > 0 / z̄ has det −1, reverses; pinned lemma needs n ≠ 0 | holds | none |
| §2.2 Check, Riemann sphere vs `OnePoint ℝ` | z↦z⁻¹, x↦x⁻¹ | |−z⁻²|² = |z|⁻⁴ > 0 / −x⁻² < 0 | holds | none |
| §3.1 two charts | z = 2, ∞, 0 | affineChart 2 = 2, invChart 2 = 1/2, invChart ∞ = 0 / pinned `_coe`, `_infty`, sources | holds | none |
| §3.4 Möbius Check | [[0,1],[1,0]], 2·1 | 1/z, 0↦∞, ∞↦0 / (2z+0)/(0z+2) = z; pinned `invChart_symm_eq_smul` | holds | none |
| §4.1 orbit projection, glide reflection | z↦z̄+1 | k-th power shifts Re by k ≠ 0, free / quotient is the Möbius band, not orientable | holds | none |
| §4.1 mathlib4#40727 comparison | pinned Mathlib Quotient.lean | README: compare with that PR's atlas / pin has only `instChartedSpaceQuotient`; PR open | unowned object | R01 |
| §4.2 descent | exp(2πiz) on ℂ/ℤ; z↦z | invariant, injective, image ℂ∖{0} / z↦z not invariant; pinned lemma assumes m ≤ n | holds | none |
| §4.3 section descent | vector bundle; pinned Section.lean | README `C^m` iff upstairs / pinned pullback form adds nonempty fibres (automatic for vector bundles) | holds | none |
| §4.4 compact quotients | ℤ+ℤi, ℤ on ℂ | unit square meets every orbit, torus compact / Im bounded on compacts, ℂ/ℤ not compact; iff needs weakly locally compact | holds | none |
| §5.1 compatibility Checks | conjugate overlap atlas; 1/z̄ | D.t = id holomorphic, D.f₀₁ reads w↦w̄ not holomorphic / 1/z̄ real-smooth, not holomorphic; pinned `isCompatible_iff` | holds | none |
| §5.4 Check, sphere from two copies | gluing by z↦z⁻¹ | identity on piece 0, w↦w⁻¹ on piece 1, 0↦∞ / chartRel = {zw = 1}, closed | holds | none |
| §5.5 realification, recharting | 𝓘(ℂ,E) → 𝓘(ℝ,E) | pinned `IsCompatible.restrictScalars` (self-models) / `isCompatible_transContinuousLinearEquiv_iff` is an iff | holds | none |
| §6.1 second countability | uncountable J of points, empty overlaps | glued space uncountable discrete, not second countable / pinned instance needs `Countable D.J` | holds | none |
| §6.2 Hausdorff criterion, `glued_t2Space_of_isClosed_rel` | doubled origin; probe without `T2Space` pieces | graph of t closed in (ℂ∖0)², chartRel closure ∋ (0,0) / one-term proof elaborates | true, padding | C01 |
| §6.3 connectedness Check | ℂ ⊔ ℂ; doubled origin | no edge between the two pieces, disconnected / overlap ℂ∖{0} nonempty, connected | holds | none |
| §6.4 properness local on target | ℂ∖{0} ↪ ℂ | preimage of closed disc not compact / restriction over ℂ∖{0} is a homeomorphism | holds | none |
| §6.5 invariance | ℕ points ↦ point | README "maps out of glued spaces" / pieces proper, map not proper; §6.4 is target-local | mislabelled | C02 |
| §6.6 doubled origin | X = ℂ, U = ℂ∖{0} | `t2Space_doubleGlueData_iff`: T2 X ∧ U closed / U not closed, so not Hausdorff | holds | none |
| §7.1 exp(Re z) gauge | section 1 | image exp(Re z), ∂̄ = ½exp(Re z) ≠ 0 / pinned `expReTrivialization_notMem_maximalAtlas`, n ≠ 0 | holds | none |
| §7.2 Checks | line cocycle g; diag(a,b) | L⊗L* glued from g·g⁻¹ = 1 (transpose gives g²) / det ab, alternating 2-forms (ab)⁻¹ | holds | none |
| §7.3 Check | z^k vs 2^k z^k | differ by coboundary 2^k on U₀, 1 on U₁ / pinned `exists_diffeomorph_iff` (finite-dim source fibre) | holds | none |
| §7.5 Check | w = 1/z | dw = −z⁻² dz, ∂/∂w = −z² ∂/∂z, product 1 / Example: ∂/∂z = −w² ∂/∂w | holds | none |
| §7.6 deck characters (headline 2) | ℂ∖{0} with z↦−z; ℂ/Λ with half-period | f = z, nowhere zero, χ-equivariant, so L_χ trivial / constant f = −f forces f = 0 | holds; not statable (no L_χ carrier) | C03 |
| Headline 1, realification and orientation | 𝓘(ℂ,E) | pinned `IsManifold.restrictScalars`, `Diffeomorph.restrictScalars` / `complexManifoldOrientation` on 𝓘(ℝ,E), Fin (2·finrank) | at pin | none |
| Headline 3, gluing | doubled origin, sphere | pinned `IsCompatible.isManifold`, `maximalAtlas_chartedSpace_eq` / `t2Space_iff_isClosed_chartRel` needs no T2 pieces | at pin | none |

- Source locators checked against a text: 0. All seven cited works are paywalled textbooks (see Not verifiable).
- Library declarations opened at the pins: about 30, among them Mathlib `Topology/Separation/Hausdorff.lean:171`, `Geometry/Manifold/Instances/Quotient.lean:48`, `Geometry/Manifold/Complex.lean:164`; Tau Ceti `Topology/Category/TopCat/GlueData.lean:52–202`, `ModelWithCorners/LinearEquiv.lean:47–53`, `Complex/Orientation.lean:126–482`, `Instances/Quotient.lean:92–253`, `Gluing/GlueData.lean:103–132`, `Gluing/ModelChange.lean:55–73`, `Topology/Maps/Proper/LocalAtTarget.lean`, `VectorBundle/FrameTrivialization.lean:444`, `VectorBundle/CoordinateHom.lean:170–200`, `SmoothEmbedding/NormalSpace/VectorBundle/Basic.lean:324`, `OnePoint/Moebius.lean:77–165`.
- README identifiers: 251 checked by declared name and namespace at the pins. 232 found directly. The additive variants are generated by `to_additive` from pinned declarations. The rest are names from the mathlib4#40727 and mathlib4#42847 references, which the README does not claim are at the pins.
- Cross-roadmap citations resolved on main: DifferentialGeometry Layer 2 §§2.1–2.2, SmoothBundlesConnections §B2.1, GeometricTopology Layer 1 §§1.1–1.4, ConformalMapping Layers 3–4, UniversalCovers, plus the consumer claims for ComplexKahlerGeometry, ComplexTori and FuchsianOrbifolds.
- Dependency check: `depcheck: 200 roadmaps, 2198 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- Automatic checks: all passed at this head. Elaboration of `Suggested.lean` gives `sorry` as the only warning. `#check` of the one declaration agrees with the README statement in §6.2, with no section binder lost.
- No changes outside `TauCetiRoadmap/ComplexManifolds/`.

Overlap check: read ComplexTori (main and its open revision), ComplexKahlerGeometry (main and its open revision), SmoothBundlesConnections, ComplexCurveModuli, QuasiregularMaps. Shared objects: ComplexTori consumes Layers 4–6 and §7.6, and ComplexKahlerGeometry consumes Layers 1–4 and 7 and extends §7.4 to higher codimension (owner ComplexManifolds); the tensor, exterior-power, dual and Hom carriers belong to SmoothBundlesConnections §B2.1, and this roadmap owns only their holomorphic refinements; nothing is owned twice.

Source independence: 0 passages compared with 0 sources. No cited text could be read legally: not in the worker's cache or the operator's local folder, and the publisher pages require sign-in. Largest share: a four-way tie between Kobayashi–Nomizu, Lee, Forster and Huybrechts, 2 of 11 README locators each. Contents not compared. No source is cited by more than two layers.

Research link: foundational complex-manifold infrastructure. By the README's Downstream consumers, ComplexKahlerGeometry, ComplexTori, AnalyticToricGeometry and FuchsianOrbifolds build on Layers 1–7. The stated results are textbook theory (Huybrechts, *Complex Geometry*; Forster, *Lectures on Riemann Surfaces*). This rests on the README alone.

## Not verifiable

- Kobayashi–Nomizu, *Foundations of Differential Geometry* I, Chapter I (Layers 1, 5): paywalled; not in the worker's cache or the operator's local folder.
- Huybrechts, *Complex Geometry*, Chapters 1–2 (Layers 1, 7): paywalled (Springer); not cached or held locally.
- Bott–Tu, *Differential Forms in Algebraic Topology*, Section 1 (Layer 2): paywalled (Springer); not cached or held locally.
- Forster, *Lectures on Riemann Surfaces*, Sections 1–2 and 4–5 (Layers 3, 4): paywalled; the Springer contents page redirects to sign-in.
- Lee, *Introduction to Smooth Manifolds*, Chapters 1 and 21 (Layers 4, 5): paywalled (Springer); not cached or held locally.
- Steenrod, *The Topology of Fibre Bundles* (Layer 7, no locator): paywalled; not cached or held locally.
- Bourbaki, *General Topology*, Chapter I (Layer 6, `Suggested.lean`): paywalled; not cached or held locally.

## Source issues

- none

## For the human reviewers

- Not tested: none of the seven cited textbooks (Kobayashi–Nomizu, Huybrechts, Bott–Tu, Forster, Lee, Steenrod, Bourbaki) is legally readable here. The wording and the arrangement were therefore not compared with any source; the largest share is a four-way tie at 2 of 11 locators.
