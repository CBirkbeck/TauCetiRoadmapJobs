# Review of DifferentialGeometry (pull request #3011 at da2fad0)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired, and the repair introduces no new problem. 10.2's Sard theorem in all dimensions now assumes a boundaryless source, which is what the flat Morse–Sard theorem it names reaches, and the extension to sources with boundary or faces is handed to TangentialBordism §2.1, which states it on main. The cylinder Stokes theorem of 5.4 is now stated with its hypotheses, its orientation and the sign `(−1)^n`, which I recomputed. There are no small corrections and no format notes. For the human reviewers: [Lee], the most-cited source, could be read only as far as its contents pages.

## Previous findings

- R01 — repaired: "for a `C^∞` map `f : M → N` between finite-dimensional manifolds with `M` Lindelöf and boundaryless (`[BoundarylessManifold I M]`; `N` may have boundary or corners)" (10.2, lines 2721–2722); the scope paragraph (lines 108–109) and TangentialBordism §2.1 agree on the owner of the extension.
- C01 — repaired: 5.4 (lines 1815–1820) states `∫_{M × [0,1]} dω = (−1)^n (∫_M ι₁^*ω − ∫_M ι₀^*ω)` for boundaryless Hausdorff σ-compact `M`, product orientation with `M` first, compactly supported `C¹` `ω`; 10.5's display carries the same factor.
- C02 — repaired: the *Needs:* line (lines 1829–1833) lists "2.2's product orientation, 5.2's integral, 5.3's boundaryless Stokes `TauCeti.integralTopForm_mextDeriv_eq_zero`, Mathlib's Fubini theorem `MeasureTheory.integral_prod` and the interval fundamental theorem of calculus".
- C03 — repaired: "Its standard reference is [Lee] … cited with that edition's numbering; departures from its proofs are marked" (lines 11–13).
- C04 — repaired: the description now says "#334 is to be rebased on main after this change merges".

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 5.4 cylinder Stokes (1815–1828) | `M = ℝ`, `ω = tφ(x)dx`, `∫φ = 1`; `n = 0`, `M` a point, `ω = g(t)` | `dω = φ dt∧dx = −φ dx∧dt`, `∫dω = −1`, right side `(−1)¹(1 − 0) = −1`; `n = 0`: `g(1) − g(0)` both sides | holds | none |
| 5.4 route | `ω = α_t + dt∧β_t` | `dω = dt∧(∂_tα_t − d_Mβ_t)` (`d_Mα_t` is an `(n+1)`-form on `M`, zero); `dt∧γ = (−1)^n γ∧dt`; `β` term zero by boundaryless Stokes | holds | none |
| 5.4 sign against 5.5b (2023–2024) and outward-first | end `t = 1`, outward `∂_t`; end `t = 0`, outward `−∂_t` | `M × {1}` carries `(−1)^n o`, `M × {0}` carries `−(−1)^n o`; 5.5b: `(−1)^m` on `M × ∂̃N`, `m = n` | agree | none |
| 5.4 *Needs:* names | probe with `#check` against the built libraries | `Orientation.interval 0 1 : Orientation (𝓡∂ 1) (Icc 0 1) (Fin 1)`; `Orientation.prod` gives `Fin (m + n)`, first factor first; `integralTopForm_mextDeriv_eq_zero` needs boundaryless, `T2`, σ-compact, `IsSmoothForm I 1`, compact support | all exist, hypotheses match the target's | none |
| 10.5 display (2774–2776) | closed top form `ω`, `n = 1, 2` | from 5.4, `∫f₁^*ω − ∫f₀^*ω = (−1)^n ∫d(F^*ω)` since `((−1)^n)² = 1`; `d(F^*ω) = F^*(dω) = 0` | holds | none |
| 10.2 Sard, boundaryless sources (2720–2733) | `OutermostStratum.lean:347`; `InteriorBoundary.lean:301`; closed half-line source (now excluded) | flat theorem: `ContDiffAt` on `U`, `k ≥ (dim E)² + 1`, `fderiv`, any set `U`, no relation of dimensions; charts of a boundaryless `M` map into `interior (range I)`; target model unrestricted | holds; the route reaches every point | none |
| Scope paragraph (106–111) | TangentialBordism on main, §2.1 (B1.6), its lines 219–245, 419, 3143–3149, 3466 | it consumes 10.2 "for boundaryless sources" and owns the extension to half-space and face-structured sources through depth strata | one owner, same on both sides | none |
| Opening (11–13) | Lee's contents pages against layers 0–12 | sequence of chapters 14, 14, 15, 9 and 12, 19, 16, –, 17, 17, 18, 17–18, 17, 16, 13 and 16: not Lee's order, and the sentence no longer says it is | holds | none |

The rows for every untouched statement stand as in the previous review, of `6ddd288`.

- Library declarations opened at the pin: 6 (`TauCeti.addHaar_image_criticalPoints_eq_zero`, `Analysis/Calculus/Sard/OutermostStratum.lean:347`; `TauCeti.integralTopForm_mextDeriv_eq_zero`, `Geometry/Manifold/DifferentialForm/Integration/BoundarylessStokes.lean:122`; `TauCeti.Manifold.Orientation.interval`, `Orientation/Interval.lean:62`; `TauCeti.Manifold.Orientation.prod`, `Orientation/Prod.lean:112`; `ModelWithCorners.isInteriorPoint_iff_of_mem_atlas`, `Mathlib/Geometry/Manifold/IsManifold/InteriorBoundary.lean:301`; `MeasureTheory.integral_prod`, `Mathlib/MeasureTheory/Integral/Prod.lean:443`). No pinned declaration states the cylinder Stokes theorem (`DifferentialForm/HomotopyOperator.lean` has the homotopy operator and its formula, no integral).
- Cross-roadmap citations resolved on main: 1 new (TangentialBordism §2.1); the others are unchanged.
- Record check against the merge base: no layer, heading or Lean declaration removed, renamed or added; 10.2 keeps its id and subject. Nothing changes outside the folder.
- Automatic checks: every check of the worker passes on this head. Dependency check output: `depcheck: 133 roadmaps, 1475 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 36 `declaration uses sorry` warnings and nothing else; the file is unchanged since the previous review, whose one-tactic probe and signature comparison stand.
- The pull request's title and description: read against the head; each of the five bullets and the sentence on #334 describes the change as it is.
- Seeded sample: none of its targets lies in a changed passage; they stand as verified in the previous review.
- Source locators checked against text: none in the changed passages (they add no locator).

Overlap check: read DeRhamCohomologyAndDuality, RiemannianGeometry, SmoothBundlesConnections and TangentialBordism (main), and ContactGeometry, ComplexKahlerGeometry, HamiltonianReduction and GeometricMeasureTheory as in the previous review. Sard for boundaryless sources is DifferentialGeometry 10.2's and its extension to half-space and face-structured sources TangentialBordism §2.1's; the other owners are unchanged. No object has two owners.

Source independence: changed passages only; 0 passages compared with source text, because no cited source is legally readable beyond [Lee]'s front matter and the changed passages add no locator; largest share [Lee], 59 of the 60 bracketed citations that carry a locator; contents compared with [Lee]: independent (no layer added, removed or reordered).

Research link: layers 8–10 build the de Rham theorem, Poincaré duality and degree theory (Lee 2013, Ch. 17–18; Bott–Tu 1982, I §5; Milnor 1965, §5), which DeRhamCohomologyAndDuality, HeegaardFloer and the symplectic roadmaps consume; 5.6 matches the HOL Light and Abdulaziz–Paulson formalisations of Green's theorem. Rests on the README's References and *Downstream consumers*.

## Not verifiable

- [Lee], GTM 218 (Springer): paywalled; the author's page gives the front matter only, so the theorem-level "[Lee, …]" locators, among them "[Lee, Thm. 6.10]" beside the changed passage of 10.2, were not checked against the text.
- [Bott–Tu], GTM 82; [Tu], GTM 275; [Milnor], University Press of Virginia: no legal open copy was found in the previous review; not looked for again, since no changed passage cites them.

## Source issues

- none

## For the human reviewers

- Not tested: [Lee] holds 59 of the 60 bracketed citations that carry a locator and only its front matter (author's page) could be read; its contents were compared with the layers, no wording was compared with its text.
