# Review of ComplexManifolds (pull request #2549 at 6611a6e)

**Verdict:** accepted

**Summary.** Accepted. Both findings of the previous review are repaired. §4.1 now compares atlases that are all at the pins: the one Mathlib's right-inverse construction builds, and the installed one, which is that construction for a chosen right inverse. §1.3 cites the pinned model-transport laws instead of planning them. The four small corrections are repaired too, including the new Demailly locators for Layer 7, which hold at the cited pages. One format note, which does not block, suggests a Check that pins the direction of the normal-bundle cocycle in §7.4. For the human reviewers: seven of the eight cited textbooks still cannot be read legally here.

## N01 — §7.4 now fixes the normal-bundle cocycle as `u_α/u_β`, but no Check tells the normal bundle from its dual

If the cocycle were inverted to `u_β/u_α`, it would glue the conormal bundle, and nothing in §7.4 would catch the swap (lines 816–822). One Check would catch it. For the line `{x₂ = 0}` in `ℙ²` the cocycle is `x₁/x₀`, so the normal bundle is `O(1)`, with a section vanishing once. The inverse cocycle gives `O(−1)`, which has no nonzero section.

## Previous findings

- R01 — repaired: "the atlas Mathlib's `IsLocalHomeomorph.chartedSpaceOfRightInverse` builds from `g` … and Mathlib's installed atlas, which is that construction for one chosen right inverse, define the same `C^n` structure" (§4.1, lines 424–428).
- R02 — repaired: "The corresponding laws for model transport are Tau Ceti's" with `ModelWithCorners.transContinuousLinearEquiv_refl`, `_trans` and `maximalAtlas_transContinuousLinearEquiv` (§1.3, lines 165–171); the Scope list of remaining targets no longer names them.
- C01 — repaired: `Suggested.lean` states no theorem, and its docstring names "Mathlib's `t2Space_iff_of_isOpenQuotientMap` applied to the open quotient map `TopCat.GlueData.isOpenQuotientMap_sigma_ι`"; the `T2Space` binder is gone with the theorem.
- C02 — repaired: "the locality of properness for maps into glued spaces" (§6.5, line 692).
- C03 — repaired: §7.4 cites Demailly V (13.5), p. 271 and VII Prop. (12.4) a), p. 357; §7.5 cites VII (3.4), p. 334; §7.6 cites V §6, p. 261.
- C04 — repaired: the description now reads "Not at the pins, and so still targets: open restriction (§1.4), …", without the model-transport laws or the generated-relation criterion.
- N01 — not repaired: deferred (D01).

## Deferred findings

- D01 — stands

## Verified sound

| Statement | Instances tried | Values computed (README side / library or computation side) | Result | Change |
|---|---|---|---|---|
| §1.3 model-transport laws | `e = refl`; `e = 2·id`, then `f = 3·id` on `ℂ` | `I.trans(refl) = I`; `(I.trans 2).trans 3 = I.trans 6` / pinned `_refl`, `_trans`, LinearEquiv.lean:47, 53 | cited at pin | none |
| §1.3 comparison diffeomorphisms compose | `e`, then `f` | underlying map `id ∘ id = id`; probe `rfl` elaborates / conjugation is not `ℂ`-linear, so excluded by type | holds | none |
| §1.3 maximal atlas unchanged | `e = 2·id`, charts `φ`, `2φ` | transition `z ↦ 2z`, holomorphic both ways / `maximalAtlas_transContinuousLinearEquiv`, LinearEquiv.lean:82, no `IsManifold` needed | holds | none |
| §4.1 right-inverse comparison | `ℤ` on `ℂ` by translation, `g = out`, `g' = out + 1` | chart transition `z ↦ z + 1`, identity biholomorphic / glide reflection gives `z ↦ z̄ + 1`, excluded by `ContMDiffConstSMul` | holds; not at pin | none |
| §4.1 and Mathlib contract: installed atlas | pinned instance, any `G`, `M`, `H` | `instChartedSpaceQuotient` = `chartedSpaceOfRightInverse (hasRightInverse.choose_spec)`; probe `rfl` elaborates (ChartedSpace.lean:590, 608) | holds | none |
| References: mathlib4#40727 atlas | its file at 9da60c2, lines 57–59 | `chartedSpaceOfRightInverse Quotient.out_eq` / README "for the right inverse `Quotient.out`" | holds | none |
| §6.2 Hausdorff iff `R` closed | doubled origin; sphere gluing; arbitrary `D` | `(0₀, 0₁)` in closure of `R`, not in `R`: not T2 / `{zw = 1}` closed: T2; iff probe elaborates with no piece hypothesis | holds | none |
| §6.5 "into glued spaces" | `ℂ ∖ {0} ↪ ℂ`; `ℕ` points to a point | cover of the target, as in §6.4 / the "out of" counterexample no longer applies | holds | none |
| §7.4 `∂u_α/∂u_β = u_α/u_β` on `Z` | `u_β = z₂`, `u_α = z₂e^{z₁}`; `u_α = z₂ + z₂²` | `e^{z₁}` = `h`; `1 + 2z₂ → 1` = `h` on `Z` | holds | none |
| §7.4 `N_Z ≅ O(Z)|_Z` | line `{x₂ = 0}` in `ℙ²` | `g₀₁ = x₁/x₀`: `O(1)`, one zero / inverse cocycle: `O(−1)`, no sections (conormal) | holds; direction not checked | N01 |
| §7.4 locators | Demailly V (13.5) p. 271; VII (12.4) a) p. 357 | cocycle `u_α/u_β` there / order-one vanishing of `h`, `ker dh = TE`, `N_E ≅ O(E)|_E` | supports statement | none |
| §7.5 `K_M` | `ℙ¹`, `w = 1/z`; Demailly VII (3.4) p. 334 | `K = ΛⁿT*`, `n = dim` / `dw = −z⁻²dz` inverse to the tangent transition; alternating forms are `det⁻¹` (§7.2 Check) | holds | none |
| §7.6 `L_χ`, Demailly V §6 p. 261 | `ℤ/2` on `ℂ ∖ {0}`, `χ = −1` | `(M̃ × S)/π₁`, locally constant transitions / here transitions `χ(g) = ±1`; `f = z` trivializes | analogy accurate | none |
| Headline 3 and `Suggested.lean` | empty file | per-slice `t2Space_iff_isClosed_chartRel` (GlueData.lean:82); Hausdorff.lean:171 with `isOpenQuotientMap_sigma_ι` (:71) / file declares nothing, 0 `sorry` | consistent | none |
| Tau Ceti contract: model transport | signatures at LinearEquiv.lean | "any nontrivially normed field, every regularity" / `NontriviallyNormedField 𝕜`, `n : ℕ∞ω` | holds | none |

The rows for statements the diff does not change stand as in the previous review, of `4d49836`.

- Source locators checked against a text: 5. Demailly V §6 p. 261, V (13.5) p. 271, VII (3.4) p. 334 and VII (12.4) a) p. 357, and mathlib4#40727 at 9da60c2, lines 57–59. All support the text as written. Two seeded-sample targets fall in the changed passages, §4.1 and §7.5, and both are covered by these.
- Library declarations opened at the pins. Mathlib: `Geometry/Manifold/ChartedSpace.lean:590–611`, `Topology/IsLocalHomeomorph.lean:286`, `Geometry/Manifold/Instances/Quotient.lean:48–59`, `Geometry/Manifold/Diffeomorph.lean:451–528`, `Topology/Separation/Hausdorff.lean:171`, `Topology/Gluing.lean:117–174`. Tau Ceti: `Geometry/Manifold/ModelWithCorners/LinearEquiv.lean:47–86`, `Geometry/Manifold/Instances/Quotient.lean:92–200`, `Topology/Category/TopCat/GlueData.lean:71–88`.
- Probes elaborated at the pins: the §6.2 equivalence for an arbitrary `TopCat.GlueData`; the installed quotient atlas equal to `chartedSpaceOfRightInverse` by `rfl`; the composite of two comparison diffeomorphisms equal to `id` by `rfl`.
- Cross-roadmap citations: ComplexTori and ComplexKahlerGeometry cite ComplexManifolds Milestone 7, 7.4 and 7.6 (the canonical bundle among them), and these still resolve through the Milestone-to-Layer sentence (line 56). No roadmap, on main or open, names a removed `Suggested.lean` declaration.
- Dependency check: `depcheck: 200 roadmaps, 2198 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed at this head. `Suggested.lean` elaborates with no output; it declares nothing, so there is no signature to compare. Nothing changed outside the folder.

Overlap check: read ComplexTori (main and its open revision), ComplexKahlerGeometry (main and its open revision), SmoothBundlesConnections, QuasiregularMaps. The change moves no ownership: the canonical bundle, the normal bundle of a hypersurface and §7.6 are owned here and consumed by ComplexKahlerGeometry and ComplexTori, and no other roadmap owns the line bundle of a divisor. Nothing is owned twice.

Source independence: changed passages only. 9 passages were compared with 2 sources (demailly-agbook, mathlib4-pr-40727): no run of six words is shared, only two stock five-word phrases. Largest share: demailly-agbook, 4 of 15 in-text locators. No layer was added, removed or reordered, so the contents were not compared again; Demailly's Chapters I–VIII (currents, sheaves, Hodge theory, vanishing) do not track Layers 1–7.

Research link: foundational complex-manifold infrastructure. By the README's Downstream consumers, ComplexKahlerGeometry, ComplexTori, AnalyticToricGeometry and FuchsianOrbifolds build on Layers 1–7. Layer 7's divisor, normal and canonical bundles are the objects Demailly 2012 (Ch. V §13, Ch. VII §§3, 12) uses for vanishing theorems and blow-ups. This rests on the README and demailly-agbook.

## Not verifiable

- Kobayashi–Nomizu, *Foundations of Differential Geometry* I, Chapter I (Layers 1, 5): paywalled; not in the worker's cache or held locally.
- Lee, *Introduction to Smooth Manifolds*, Chapter 21 (Layer 4, bearing on §4.1): paywalled (Springer); not cached or held locally.
- Forster, *Lectures on Riemann Surfaces*, Sections 1–2 and 4–5 (Layers 3, 4, bearing on §4.1): paywalled; not cached or held locally.
- Huybrechts, *Complex Geometry*, Chapters 1–2 (Layers 1, 7, bearing on §§7.2, 7.5): paywalled (Springer); not cached or held locally.
- Bott–Tu, *Differential Forms in Algebraic Topology*, Section 1 (Layer 2): paywalled (Springer); not cached or held locally.
- Steenrod, *The Topology of Fibre Bundles* (Layer 7, no locator): paywalled; not cached or held locally.
- Bourbaki, *General Topology*, Chapter I (Layer 6): paywalled; not cached or held locally.
- The seeded-sample targets outside the changed passages (§§1.1, 1.5, 2.2–2.4, 3.3, 3.4, 4.3, 5.1, 5.4, 5.5, 6.3, 7.2) cite only these texts and were not re-read in this incremental round.

## Source issues

- none

## For the human reviewers

- Not tested: seven cited textbooks (Kobayashi–Nomizu, Huybrechts, Bott–Tu, Forster, Lee, Steenrod, Bourbaki) carry 11 of the README's 15 in-text locators and are not legally readable here, so wording and arrangement were not compared with them. demailly-agbook (4 locators) was read.
