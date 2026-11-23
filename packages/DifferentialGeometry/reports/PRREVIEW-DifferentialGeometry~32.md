# Review of DifferentialGeometry (pull request #3011 at 6ddd288)

**Verdict:** accepted

**Summary.** The reordered *Needs:* line of 5.4 changes no statement or prerequisite, and the full pass over the roadmap found no finding: the seeded sample, the headline statements of `Suggested.lean`, the dependency check and the elaboration all hold. There are four small corrections, none blocking. Two concern the sentence this pull request edits: 5.4's Stokes on `M × [0, 1]` is named without its hypotheses or its sign `(−1)^n`, and its prerequisites exclude 5.3 although the slice route uses 5.3's boundaryless Stokes. The third is the opening's claim that the roadmap follows [Lee], and the fourth is that the description gives no order against the other open pull request on this README. For the human reviewers: [Lee], the most-cited source, could be read only as far as its table of contents.

## C01 — 5.4's Stokes on `M × [0, 1]` is named but not stated, so its sign is left to the implementer.

An implementer of this target has to choose the hypotheses, the orientation of the cylinder and the sign, and 10.5 consumes it. In 5.4 (lines 1813–1814) the target is only "Stokes on `M × Icc 0 1` for boundaryless `M`". It gives no compact support, regularity, orientation of `M` or Hausdorff σ-compact hypothesis, and no sign. The README's product orientation puts the first factor first (2.2, line 1049). With the outward-first rule, the end `M × {1}` then carries `(−1)^n` times the orientation of `M`, as 5.5b's product convention also gives (line 2007). Witness: `M = ℝ` (`n = 1`), `ω = t φ(x) dx` with `φ` compactly supported and `∫ φ = 1`. Then `dω = −φ dx ∧ dt`, so `∫_{M × [0,1]} dω = −1`, while `∫_M ι₁^*ω − ∫_M ι₀^*ω = 1 − 0 = 1`. 10.5's display (line 2751) has no such factor. It stays true there only because `d(F^*ω) = F^*(dω) = 0` in top degree, so every term is zero.

A repair would state the target: for an oriented boundaryless Hausdorff σ-compact `M` of dimension `n`, `M × Icc 0 1` with the product orientation of 2.2, and a compactly supported `C¹` `n`-form `ω` on it, `∫_{M × [0,1]} dω = (−1)^n (∫_M ι₁^*ω − ∫_M ι₀^*ω)`. Then either put the factor into 10.5's display or orient the cylinder there as `[0, 1] × M`.

## C02 — The edited *Needs:* line excludes 5.3 from the cylinder Stokes, whose slice route uses 5.3's boundaryless Stokes.

An implementer who follows the line has to prove boundaryless Stokes again from 5.2's chart formula. Write `ω = α_t + dt ∧ β_t` on `M × [0, 1]`. In top degree `dω = dt ∧ (∂_t α_t − d_M β_t)`. After Fubini the integral is `∫_M α_1 − ∫_M α_0 − ∫_0^1 ∫_M d_M β_t dt` up to C01's sign, and the last term vanishes by Stokes on the boundaryless `M`. This README puts that theorem in 5.3, as `TauCeti.integralTopForm_mextDeriv_eq_zero`, and 9.1 (line 2641) and 10.3–10.4 (line 2731) cite it from there. The edited line (lines 1817–1818) lists for this target only "5.2's integral and the interval fundamental theorem of calculus", followed by "not 5.3". The declaration is already in Tau Ceti, so the exclusion buys nothing.

A repair would read: "5.2's integral, 5.3's boundaryless `TauCeti.integralTopForm_mextDeriv_eq_zero`, Mathlib's Fubini and the interval fundamental theorem of calculus, for the separate Stokes on `M × Icc 0 1`; the homotopy operator itself needs not 5.3". That keeps the point of the exclusion: 5.4 proves the homotopy identity without Stokes, so that `M` may have boundary or corners (line 1761).

## C03 — The opening says the roadmap follows [Lee], but its layers are not in Lee's order.

A reader is told that the plan is a book's when it is the roadmap's own. Line 10 reads "This roadmap asks for that theory, following [Lee]". Against Lee's contents (front matter of the second edition, on the author's page), layers 0–12 correspond to Lee's Chapters 14, 14, 15, 9, 19, 16, (none for 5.6), 17, 17, 18, 17–18, 17, 16 and 13. Flows come after orientations, Frobenius before integration, and the Riemannian calculus last. A repair would read: "[Lee] = … GTM 218 is the standard reference, cited with that edition's numbering; departures from its proofs are marked."

## C04 — The description gives no order against the other open pull request that changes this README.

Whoever merges second has to resolve the conflict, and the description does not say who that is. The draft "Differential Forms & Smooth Flows" (#334, another author) replaces this README with a 483-line text and `Suggested.lean` with a 155-line one, so the two heads conflict in both files. One sentence would do: "#334 rewrites the same README; it is rebased on this change (or on main after it)."

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| Edited *Needs:* of 5.4 (1815–1818) against the merge base | diff `origin/main...HEAD` | Same items {0.3–0.4, 1.1–1.3, interval integral, 1.5, 5.2, FTC}, exclusion of 5.3 kept; no statement changed | holds | C02 |
| 5.4 cylinder Stokes, sign | `M = ℝ`, `ω = tφ(x)dx`, `∫φ = 1`; M-first vs `[0,1]`-first | `∫dω = −1` vs `+1`; `∫ι₁^*ω − ∫ι₀^*ω = 1`; factor `(−1)^n` | sign unstated | C01 |
| 10.5 display (2751) | `n = 1` and `n = 2`, closed `F^*ω` | `d(F^*ω) = F^*(dω) = 0`: all three terms `0` under either sign | holds | C01 |
| Smooth 2-forms (545) | `TwoForm/Basic.lean:37,47`; `Closed.lean:43,54` | abbrev of `SmoothForm I M ℝ 2`; `const` via `SmoothForm.const`; closed ⇔ `mextDeriv = 0`; chartwise form needs `C²` | holds | none |
| Canonical interfaces (1409) | `Distribution.lean:269,351`; `Foliation/Basic.lean:63`; `Graph.lean:235` | involutivity: fields `MDiff` on open `U`, tangent on `U`; frames local; eight files exist | holds | none |
| Layer 4 acceptance (1632) | `Distribution.lean:499,560`; `S(x,y,z) = (y,x,z)` | Tau Ceti fibre `c = x·b` = `ker(dz − x dy)`; `dz − x'dy' = dz − y dx` | holds | none |
| 5.6 conventions (2075) | `CurveIntegral/Basic.lean:148`; `AbsolutelyContinuous.lean:155`; `Filter.lean:244`; `Integrability.lean:198`; `Number/Basic.lean:76` | `curveIntegral` = `∫₀¹ ω(γ.extend t)(deriv γ.extend t)`; all five names exist | holds | none |
| Henstock–Kurzweil (2231) | `Oriented/Basic.lean:34,249,259`; `FundThmCalculus.lean:68,102` | oriented by sign of `b − a`; GP ⇔ Henstock for every `f` on `Box (Fin 1)`; FTC: `a < b`, complete, countable set | holds | none |
| 5.6 acceptance (2339) | ellipse; annulus; `P = abs(x − ½)`, `Q = x`; `t² sin t⁻²` | `πab`; `π(R² − r²)`; `¼ − ¼ + 1 = 1` = area; HK `∫h' = sin 1`, `h(0) = 0` (junk `0·sin 0`) | holds | none |
| Flat punctured-plane family (2364) | general `α`; unit circle; `α = 1` | curl `2ρ^(−α) − 2αρ^(−α−1)(x² + y²) = 2(1 − α)ρ^(−α)`; integrand `1`, integral `2π`; closed iff `α = 1` | holds | none |
| Ownership and ordering (2379) | links on main | `Completed/ContourIntegration`, `Completed/ConformalMapping` (L5 filled hull, its README 733), `PDE`, `ModularForms` exist | holds | none |
| 5.4 coordinate formula `K(H^*(A dx∧dy)) = η` | `I = ∫₀¹ tA(a + tw)dt` | `2I + uI_u + vI_v = ∫₀¹ d/dt[t²A(a + tw)] = A(a + w)` | holds | none |
| 5.4 vertical-disk primitive | `(dy∧dx)(1, i)` | `0·0 − 1·1 = −1`, so `f = −ω(1, i)`; `p_y = f`, `d(p dx) = ω` | holds | none |
| `planarRadialPrimitive` Checks | `(1, 0)`; `(x, y)`; `(−y, x)` | `g = x`; `(x² + y²)/2`; `−xy/2 + xy/2 = 0`, `dg = 0 ≠ ω` | holds | none |
| 5.5a Check, `m < dim V` | `2·id` vs doubling `span v` | `(2^dim − 2^m)·toFun v = 0`; dependent tuple: projection, `det = 0` | holds | none |
| 9.2 `bijective_integral_…` | point; `ℝ`; open Möbius band (9.2 second) | `ℝ → ℝ` by sign·evaluation; `∫` iso; `H²_c = 0` | holds | none |
| 9.3 `bijective_poincarePairing` | countable discrete, `n = 0`; `ℝ`, `k = 0` | `∏ℝ ≅ (⊕ℝ)^*`; `1 ↦ ∫` | holds | none |
| 10.3–10.4 integral formula | `id`, `z^k`, constant on `S¹`; `n = 0` excluded | `1·∫η`; `k·2π` for `dθ`; count `0` off `c`, `c` critical | holds | none |
| 10.4 Check, antipodal | `S¹`, `S²` | `(−1)^(n+1)`: `+1`, `−1` | holds | none |
| 11 hairy ball | `n = 0`; `n = 1`; `n = 2` | `E = ℝ`, `v x · x = 0 ⇒ v = 0`; `ix` excluded by `Even n` | holds | none |
| 12.5 divergence theorem | half-line, `X = f∂ₓ`, `f` compactly supported; `X = ∂ₓ` | `∫₀^∞ f' = −f(0)`; `N = −∂ₓ`, flux `−f(0)`; excluded by support | holds | none |
| 12.1 `volume_circle` | round metric | `2π` | holds | none |
| 3.3 `exists_flowOf_one_eq` | `ℝ`, `x → y`; Banach | bump `(y − x)` on `[x, y]`, flow time 1 reaches `y`; `FiniteDimensional` binder present | holds | none |

- Previous review (on this folder at 729e951): accepted with no open finding, so there is nothing to re-check for repair. Against main this pull request changes two lines.
- Automatic checks re-run on this head: the gate passes with every counter at 0. The dependency check reports `depcheck: 133 roadmaps, 1475 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean` exits 0 with 36 `declaration uses sorry` warnings and nothing else. `git merge-tree` of the head with `origin/main` is clean, and nothing changes outside the folder.
- The record check against the merge base `f83a3b8` finds no layer, heading or Lean declaration removed, renamed or added. The change is 2 lines of `README.md`.
- 48 library declarations were opened at the pin (Tau Ceti and Mathlib files and lines above, the 11 acceptance-example theorems of 5.6, `green_ac_winding_sum`, `Contour.Cycle.green_winding`, `green_ac_index_one`, `green_ac_flux`, `TauCeti.integralTopForm_mextDeriv_eq_zero` at `BoundarylessStokes.lean:122` with its two lemmas, and the `rectangleIntegral` file). None states the cylinder Stokes of 5.4.
- Cross-roadmap citations resolved on main and at the open heads: GeometricMeasureTheory G1 on main (DG's interface consumes G1, and G1 consumes no DG section); DeRhamCohomologyAndDuality, SmoothBundlesConnections and RiemannianGeometry consume DG sections only. The seven "found nowhere" Lean names of the citation lead are declarations of `Suggested.lean` (its lines 333, 346, 356, 667, 684, 700 and 722).
- The nine dropped-binder leads were compared with their README statements. `omit [CompleteSpace E]` appears only next to `[FiniteDimensional ℝ E]`, and the three 3.5 definitions and the two 12.x definitions need none of the dropped instances.
- The one-tactic probe (`simp`, `exact?`, `infer_instance`) was run on a scratch copy for seven declarations (lines 181, 441, 451, 621, 921, 1005, 1094). All 21 attempts fail: no progress, unsolved goals, no instance, or `exact?` finding nothing. No declaration is padding.
- Overlap check: read DeRhamCohomologyAndDuality, RiemannianGeometry and SmoothBundlesConnections (main), and ContactGeometry, ComplexKahlerGeometry, HamiltonianReduction and GeometricMeasureTheory (open heads). The shared objects each have one owner. Density integration belongs to DifferentialGeometry 5.5a, and the measure of a density to SmoothBundlesConnections B2.4. The relative de Rham theory belongs to DeRhamCohomologyAndDuality. Arclength belongs to GeometricMeasureTheory G1. Cylinder Stokes belongs to DifferentialGeometry 5.4 alone.

Source independence: no passage was compared with source text, because no cited source can be read legally beyond [Lee]'s front matter. The largest share is [Lee], with 59 of 65 bracketed locators (plus 8 bare mentions). The layers were compared with Lee's contents (front matter of the second edition, author's page): independent, with the layer-to-chapter sequence 14, 14, 15, 9, 19, 16, –, 17, 17, 18, 17–18, 17, 16, 13.

Research link: layers 8–10 build the de Rham theorem, Poincaré duality and degree theory (Lee 2013, Ch. 17–18; Bott–Tu 1982, I §5; Milnor 1965, §5). DeRhamCohomologyAndDuality consumes 8.3–8.5, and HeegaardFloer and HamiltonianReduction consume the degree of layer 10. 5.6 matches the HOL Light and Abdulaziz–Paulson Green formalisations. This rests on the README's References and *Downstream consumers*.

## Not verifiable

- [Lee], GTM 218 (Springer): no open copy. The author's page offers the front matter, Chapter 1 and the errata, so the 59 "[Lee, …]" locators were not checked against the text.
- [Bott–Tu], GTM 82; [Milnor], University Press of Virginia; [Tu], GTM 275: no legal open copy found.
- The AFP `Green` entry and HOL Light page: the sources service puts `isa-afp.org` in no licence class, so the AFP theorem names in the 5.6 table were not checked.
- Ownership against open pull requests was checked through the board's search tools at the heads of the 493 indexed pull requests.

## Source issues

- none

## For the human reviewers

- Not tested: [Lee] holds 59 of the README's 65 bracketed locators, and only its front matter (author's page) could be read. Its contents were compared (part 2, independent); no wording was compared with its text (part 1).
