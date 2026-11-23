# Review of DifferentialGeometry (pull request #3011 at 6ddd288)

**Verdict:** needs changes

**Summary.** Changes are needed for one finding, in text this pull request does not edit: 10.2's Sard theorem in all dimensions is stated for sources with boundary or corners, but the flat theorem it names needs smoothness on a full neighbourhood of each point, so the route stops at boundary points when `dim M > dim N`. The reordered *Needs:* line of 5.4 changes no statement, and the rest of the full pass (the seeded sample, the headline statements of `Suggested.lean`, the dependency check, the elaboration) holds. There are four small corrections, none blocking, the same four as in the previous review of this head. For the human reviewers: [Lee], the most-cited source, could be read only as far as its contents pages.

## R01 (P2) — 10.2's target, Sard in all dimensions, is stated for sources with boundary or corners, and the flat theorem it is derived from does not reach their boundary points.

An implementer who follows 10.2 is stuck at the boundary critical points of a source of larger dimension than the target, and a consumer reading the target as stated gets a theorem the named inputs do not prove. The target (lines 2705–2710) is "for a `C^∞` map `f : M → N` between finite-dimensional manifolds with `M` Lindelöf", with no boundaryless hypothesis, "from the flat Morse–Sard theorem … read in countably many pairs of extended charts, as the equal-dimensional case is". The equal-dimensional case goes through with corners because its flat lemma is stated for derivatives within `range I` (`TauCeti.addHaar_image_eq_zero_of_not_surjective_fderivWithin`, cited in the header of `Geometry/Manifold/Sard/EqualDimension.lean`). The flat theorem named here is not: `TauCeti.addHaar_image_criticalPoints_eq_zero` (`Analysis/Calculus/Sard/OutermostStratum.lean:347`) asks for `ContDiffAt ℝ n f x` at every point of `U` and concludes for `fderiv`. At a boundary point of `M` the chart expression of `f` is smooth only within `range I`, and `mfderiv` is the derivative within `range I`, so that theorem does not apply there. For `dim M > dim N` the image of the boundary is not null for free, as it is in equal dimensions. Neither pin has a smooth extension across the boundary of `range I` (no Whitney or Seeley extension in Mathlib or Tau Ceti), and the pinned meagre form, `ContMDiff.isMeagre_image_criticalPoints` (`Sard/Meagre.lean`), is for manifolds without boundary.

The smallest change is the hypothesis: "for a `C^∞` map `f : M → N` between finite-dimensional manifolds with `M` Lindelöf and boundaryless". Nothing in this roadmap uses more: 10.3–10.4 take regular values of maps between boundaryless manifolds of equal dimension. If the generality is wanted, name the extra input instead. Over `𝓡∂ n` a boundary critical point of `f` is critical for the restriction of `f` to Tau Ceti's boundary manifold (the differential of the restriction is the differential of `f` composed with that of the inclusion), so the boundaryless case on `∂M` covers it; over a general model with corners a smooth local extension lemma would have to become a target.

## C01 — 5.4's Stokes on `M × [0, 1]` is named but not stated, so its sign is left to the implementer.

An implementer has to choose the hypotheses, the orientation of the cylinder and the sign, and 10.5 consumes the result. In 5.4 (lines 1813–1814) the target is only "Stokes on `M × Icc 0 1` for boundaryless `M`". With 2.2's product orientation, first factor first (line 1049), and the outward-first rule, the end `M × {1}` carries `(−1)^n` times the orientation of `M`, as 5.5b's product convention also gives (line 2008). Witness: `M = ℝ`, `ω = t φ(x) dx` with `φ` compactly supported and `∫ φ = 1`. Then `dω = −φ dx ∧ dt`, so `∫ dω = −1`, while `∫_M ι₁^*ω − ∫_M ι₀^*ω = 1`. 10.5's display (line 2751) has no such factor; it stays true only because `d(F^*ω) = F^*(dω) = 0` there, so every term is zero.

A repair would state the target: for an oriented boundaryless Hausdorff σ-compact `M` of dimension `n`, `M × Icc 0 1` with the product orientation of 2.2, and a compactly supported `C¹` `n`-form `ω` on it, `∫_{M × [0,1]} dω = (−1)^n (∫_M ι₁^*ω − ∫_M ι₀^*ω)`.

## C02 — The edited *Needs:* line excludes 5.3 from the cylinder Stokes, whose slice route uses 5.3's boundaryless Stokes.

An implementer who follows the line proves boundaryless Stokes a second time. Write `ω = α_t + dt ∧ β_t`. In top degree `dω = dt ∧ (∂_t α_t − d_M β_t)`; after Fubini the `β` term is `∫₀¹ ∫_M d_M β_t dt`, which vanishes by Stokes on the boundaryless `M`, that is by `TauCeti.integralTopForm_mextDeriv_eq_zero`, which this README places in 5.3 (line 1742). The edited line (lines 1817–1818) gives the cylinder Stokes "5.2's integral and the interval fundamental theorem of calculus" and ends "not 5.3".

A repair would read: "5.2's integral, 5.3's boundaryless `TauCeti.integralTopForm_mextDeriv_eq_zero`, Mathlib's Fubini and the interval fundamental theorem of calculus, for the separate Stokes on `M × Icc 0 1`; the homotopy operator itself needs not 5.3".

## C03 — The opening says the roadmap follows [Lee], but its layers are not in Lee's order.

A reader is told the plan is a book's when it is the roadmap's own. Line 11 reads "This roadmap asks for that theory, following [Lee]". Against Lee's contents pages (front matter of the second edition, author's page), layers 0–12 correspond to Chapters 14, 14, 15, 9 and 12, 19, 16, none (5.6), 17, 17, 18, 17–18, 17, 16, 13 and 16. A repair would read: "[Lee] = … GTM 218 is the standard reference, cited with that edition's numbering; departures from its proofs are marked."

## C04 — The description gives no order against the other open pull request that changes this README.

Whoever merges second resolves the conflict, and the description does not say who. The draft "Differential Forms & Smooth Flows" (#334) changes the same `README.md` and `Suggested.lean`, and the two heads conflict in both. One sentence would do: "#334 rewrites the same README; it is rebased on this change (or on main after it)."

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| Edited *Needs:* of 5.4 (1815–1818) | diff against the merge base | Same prerequisites, 5.2 moved before the exclusion of 5.3; no statement changed | holds | C02 |
| 10.2 Sard, all dimensions (2705) | `OutermostStratum.lean:347`; `EqualDimension.lean` header; `Meagre.lean` header | Flat theorem: `ContDiffAt`, `fderiv`; equal-dim lemma: `fderivWithin`; meagre form: without boundary | route stops at boundary, `dim M > dim N` | R01 |
| 5.4 cylinder Stokes, sign | `M = ℝ`, `ω = tφ(x)dx`, `∫φ = 1` | `∫dω = −1`; `∫ι₁^*ω − ∫ι₀^*ω = 1`; factor `(−1)^n` | sign unstated | C01 |
| 10.5 display (2751) | closed `F^*ω`, `n = 1, 2` | `d(F^*ω) = F^*(dω) = 0`; all terms `0` under either sign | holds | C01 |
| Smooth 2-forms (545) | `TwoForm/Basic.lean:37,50`; `Closed.lean:43,52` | abbrev of `SmoothForm I M ℝ 2`; `const` from `SmoothForm.const`; closed is `mextDeriv = 0`; chartwise form needs `IsManifold I 2 M` | holds | none |
| Canonical interfaces (1409) | `Distribution.lean:269,351`; `Foliation/Basic.lean:63`; `Graph.lean:235`; `IntegralManifold.lean:74,139` | frames on open neighbourhoods; involutivity tests `MDiff` fields on open `U`; nine files exist | holds | none |
| Layer 4 acceptance (1632) | `Distribution.lean:499,560`; `S(x,y,z) = (y,x,z)` | fibre `c = x·b`, i.e. `ker(dz − x dy)`; pulled back: `dz − y dx`; `[∂y, ∂x + y∂z] = ∂z` | holds | none |
| 5.6 conventions (2075) | `CurveIntegral/Basic.lean:148`; `AbsolutelyContinuous.lean:155`; `Integrability.lean:198`; `Number/Basic.lean:76` | all four declarations exist; `windingNumber` in `TauCeti.Contour` | holds | none |
| Henstock–Kurzweil (2231) | `Oriented/Basic.lean:34`; `FundThmCalculus.lean:68,102` | GP iff Henstock for every `f` on `Box (Fin 1)`; FTC: `a < b`, complete, countable `s`, value `f b − f a` | holds | none |
| 5.6 acceptance (2339) | ellipse; weak field on the square; `t² sin t⁻²`; `Examples/CurveArea/Green.lean:45–131` | `½∫(ab sin² + ab cos²) = πab`; `¼ − ¼ + 1 + 0 = 1`; `h(1) − h(0) = sin 1`; eleven names exist | holds | none |
| Flat punctured-plane family (2364) | general `α`; unit circle | curl `2ρ^(−α) − 2αρ^(−α−1)(x² + y²) = 2(1 − α)ρ^(−α)`; integrand `s² + c² = 1`, integral `2π` | holds | none |
| Ownership and ordering (2379) | links at the head and on main | both `Completed/` roadmaps, `PDE`, `ModularForms` exist; filled hull in ConformalMapping (its README 25, 262) | holds | none |
| 5.4 coordinate formula | `H^*(A dx∧dy)`, contraction slot first | `∫tA(−v du + u dv)dt = η`; `2I + uI_u + vI_v = ∫₀¹ d/dt[t²A] = A` | holds | none |
| `planarRadialPrimitive_hasFDerivAt` | `(1,0)`; `(x,y)`; `(−y,x)` | `g = x`; `(x² + y²)/2`; `g = 0`, `dg ≠ ω` (not closed) | holds | none |
| `moving_pullback_hasDerivAt` | `k = 0`, `ω` a `1`-form | both sides `ω(D_xV·v) + Dω(V)(dp·v)` | holds | none |
| 2.2 pentagonal cone Check | 120 permutations of the five rays, exact arithmetic | cross products `12, 16, 18, 9, 8` (convex); only the identity extends to a linear map | holds | none |
| `orientable_iff_exists_atlas` | empty `M`; `ℝ`; `[0,1]` (excluded) | both sides true; `{id}` oriented; chart at `0` increasing, at `1` decreasing | holds | none |
| `exists_contDiffAt_localFlow_of_completeSpace` | pinned `InitialCondition.lean:217` | same statement with `[FiniteDimensional ℝ E]`; global flow law from a cut-off field | holds | none |
| `exists_timeDependentFlow` | `v = 0`, discontinuous family; pinned `TimeDependent.lean:439` | value `0` at `(ε, 0, 1 + ε/2)`, `1` at `(0,0,1)`; pinned form lacks the joint `C¹` clause | holds | none |
| `exists_flowOf_one_eq` | point; `ℝ`; Banach | `v = 0`; bump field along an arc; compactly supported field is `0` | holds | none |
| 5.5a `Density` Check | `m < dim V`; dependent tuple | `(2^dim − 2^m)·toFun v = 0`; projection, `det = 0` | holds | none |
| 5.5b facet signs | `Q¹`, `Q²`, unit square, `ω = y dx` | `(−1)^(i+1)`: `−1`; corner lifts `+1`, `−1`; `∫dω = −1` = top edge leftward | holds | none |
| 7.4 induction principle | shells `f⁻¹[k, k+1]` | even and odd unions disjoint; intersections in `f⁻¹(k+½, k+3/2)`, disjoint | holds | none |
| 8.3 corner Check | faces `(y−z)²`, `(x−z)²`, `(x−y)²` | Hessian diagonal `2`, off-diagonal `−2`; `½t²(6 − 12) = −3t²` | holds | none |
| `bijective_integral_…` (9.2) | point; `ℝ` | `ℝ → ℝ`, sign times evaluation; `∫` iso | holds | none |
| `bijective_poincarePairing` (9.3) | countable discrete, `n = 0`; empty `M` | `∏ℝ ≅ (⊕ℝ)^*`; both sides zero | holds | none |
| Degree integral formula (10.3–10.4) | `id`, `z^k`, `z̄` on `S¹` | `1·∫η`; `k·2π`; `−2π` | holds | none |
| Hairy ball (11) | `n = 0, 1, 2` | `v x·x = 0 ⇒ v = 0` in `ℝ`; `ix` excluded by `Even n`; zeros at poles | holds | none |
| 12.3 Checks | `g = e^(2x)δ` on `ℝ²` | `div ∂₁ = 2u₁ = 2`; `Γ²₂₁ = 1`, Hessian `(e₂,e₂) = 1` | holds | none |
| `integral_divergence_eq_boundaryFlux` | half-line, `X` compactly supported; `X = 1` | `∫₀^∞X' = −X(0)`; flux `⟪X, −∂ₜ⟫ = −X(0)`; excluded by support | holds | none |
| `volume_circle` | round metric | `2π` | holds | none |

- Previous review (this same head, accepted): no finding to re-check; its four small corrections are unrepaired, since the head is unchanged, and are C01–C04 above.
- Automatic checks: every check of the worker passes on this head. Dependency check output: `depcheck: 133 roadmaps, 1475 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. Nothing changes outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 36 `declaration uses sorry` warnings and nothing else. The nine dropped-binder leads are benign: `omit [CompleteSpace E]` beside `[FiniteDimensional ℝ E]`, and definitions whose bodies need none of the dropped instances.
- One-tactic probe on a copy of the file, twelve theorems (2.2 atlas criterion, 2.4 cover and both averaging statements, 3.2 openness, 3.5 global domain, 4.3 slices, 5.4 primitive, 9.3, 11.2, 12.5 continuity, `volume_circle`) with `rfl`, `simp`, `infer_instance` or one library term: all fail. No padding.
- Record check against the merge base: no layer, heading or Lean declaration removed, renamed or added; 2 lines of `README.md` change.
- Library declarations opened at the pin: about 55 (files and lines above, the eleven acceptance examples, `integralTopForm_mextDeriv_eq_zero` and its two lemmas in `BoundarylessStokes.lean`, `OrientationLift` at `Orientation/Lift.lean:52`, `Orientable` at `Orientation/Basic.lean:263`, `degreeAtRegularValue_const` at `Degree/Basic.lean:121`). No pinned declaration states any theorem of `Suggested.lean` or the cylinder Stokes of 5.4.
- Cross-roadmap citations resolved on main: DeRhamCohomologyAndDuality §§2.1–2.2 and §4.1, GeometricMeasureTheory G1 and G6, AlgebraicTopology 6.3, HeegaardFloer F0.S, Isoperimetry I3, SmoothBundlesConnections B2.4. The seven Lean names found nowhere in the libraries are declarations of `Suggested.lean`.
- Source locators checked against text: the chapter-level and section-title locators of [Lee] (layers 0–12, "Manifolds with Corners", "Densities", "Degree Theory") against its contents pages; no theorem-level locator could be checked.

Overlap check: read DeRhamCohomologyAndDuality, RiemannianGeometry and SmoothBundlesConnections (main), and ContactGeometry, ComplexKahlerGeometry, HamiltonianReduction and GeometricMeasureTheory (open heads or main). Density integration is DifferentialGeometry 5.5a's and the measure of a density SmoothBundlesConnections B2.4's; the relative de Rham theory is DeRhamCohomologyAndDuality's; arclength is GeometricMeasureTheory G1's; the sharp Sard bound is HeegaardFloer F0.S's. No object has two owners.

Source independence: 0 passages compared with source text, because no cited source is legally readable beyond [Lee]'s front matter; largest share [Lee], 59 of the 60 bracketed citations that carry a locator; contents compared with [Lee]: independent (layer-to-chapter sequence 14, 14, 15, 9 and 12, 19, 16, –, 17, 17, 18, 17–18, 17, 16, 13 and 16).

Research link: layers 8–10 build the de Rham theorem, Poincaré duality and degree theory (Lee 2013, Ch. 17–18; Bott–Tu 1982, I §5; Milnor 1965, §5), which DeRhamCohomologyAndDuality, HeegaardFloer and the symplectic roadmaps consume; 5.6 matches the HOL Light and Abdulaziz–Paulson formalisations of Green's theorem. Rests on the README's References and *Downstream consumers*.

## Not verifiable

- [Lee], GTM 218 (Springer): paywalled; the author's page gives the front matter only, so the 59 theorem-level "[Lee, …]" locators were not checked against the text.
- [Bott–Tu], GTM 82; [Tu], GTM 275; [Milnor], University Press of Virginia: the sources service found no legal open copy.
- The Archive of Formal Proofs `Green` entry and the HOL Light page: not fetched, so the three AFP theorem names in 5.6 were not checked.

## Source issues

- none

## For the human reviewers

- Not tested: [Lee] holds 59 of the 60 bracketed citations that carry a locator and only its front matter (author's page) could be read; its contents were compared with the layers, no wording was compared with its text.
