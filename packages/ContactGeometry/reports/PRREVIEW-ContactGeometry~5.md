# Review of ContactGeometry (pull request #2684 at b79bb2a)
Folder: `TauCetiRoadmap/SymplecticGeometry/ContactGeometry/`
**Verdict:** accepted

**Summary.** Accepted: there is no finding. This is an incremental re-review of the 74 lines changed since `71e7c7e`: the five small corrections of the previous review that lie in this folder or in the description are repaired, and the repairs are correct (the new §2.3 equivalence was recomputed, the two new locators of §6.1 were read at the text, the three Tau Ceti declarations and LieGroupoidsPoisson §G0.1 were opened). The description was read against this head and agrees with it. There are no small corrections and no format notes; one point on the family README is deferred to that file, and one question is left for a human: the most-cited source is a set of unpublished course notes.

## Deferred findings

- D01 — stands

## Previous findings

The previous review had no finding (R); its six small corrections are accounted for here.

- C01 — repaired: the description now says the anchors `#cg1--…`, `#cg4--…`, `#cg5--…`, `#cg6--…` "are kept as explicit anchors before the Layer 1, 4, 5 and 6 headings"; the README defines them at lines 111, 496, 614, 819.
- C02 — repaired: Summary, lines 35–37: "the unit cosphere bundle, whose contact forms are stated with Tau Ceti's contact predicate, the one adopted in the Conventions".
- C03 — repaired: §6.1 (lines 831–833) and the three docstrings cite Kriegl–Michor 43.15, pp. 471–472, and Geiges, Theorem 2.22, p. 16; both read at the text and support the sentence as written.
- C04 — repaired: the *Needs* lines of §1.1 and §1.2, the Layer 1 Dependencies, Scope and the contracts name the three `TauCeti.IsContMDiffDistribution` bundle declarations and LieGroupoidsPoisson §G0.1; all exist where cited.
- C05 — not repaired: deferred (D01)
- C06 — repaired: §2.3 now reads "`gₜ(x) = 1` for every `t` at which `φₜ(x)` is defined if and only if `R_α H` vanishes along the orbit of `x`", which is true in both directions.

## Verified sound

| Statement | Instances tried | Roadmap side | My side | Result |
|---|---|---|---|---|
| §2.3, the new equivalence for `gₜ` | `H = 1`; `H = z`; `H = 2 + sin z` on `(ℝ³, dz − x dy)` | `gₜ(x) = 1` for all admissible `t` iff `R_αH = 0` on the orbit | `∂ₜ log gₜ(x) = (R_αH)(φₜx)`; `H = 1`: `gₜ = 1`, `R_αH = 0`; `H = z`: `gₜ = eᵗ`, `R_αH = 1`; `2 + sin z`: `g_T = 1` only at `T = 2πk/√3`, `R_αH = cos z ≠ 0` | holds, both directions |
| §6.1 `jacobiBracket`, `contactHamiltonianVectorField_jacobiBracket`, `jacobiBracket_jacobi` (docstrings changed) | `x, y` on `(ℝ³, dz − x dy)` | `{x, y} = −1`, `[X_x, X_y] = X_(−1)`; sources: contraction with `α` is a bijection from contact fields to functions | `X_x = −∂_y`, `X_y = ∂_x + y∂_z`; `dα(X_x, X_y) = −1`, `xR(y) − yR(x) = 0`; `[−∂_y, ∂_x + y∂_z] = −∂_z`; K–M 43.15 and Geiges 2.22 say so | holds; statements unchanged |
| §1.1 and §1.2 supplier lines | `D` of rank `k`, `C^n`, on a `C^(n+1)` manifold; `ξ⁰` as a kernel | `D` a `C^n` vector bundle with fibre `Fin k → ℝ`; frames extend, constant-rank kernels are subbundles | `contMDiffVectorBundle` needs `[IsManifold I (n + 1) M]`, fibre `Fin k → 𝕜`, subspace topology; LieGroupoidsPoisson §G0.1 has both bullets | agree |
| Summary sentence on the predicate | Convention 5; Scope | "Tau Ceti's contact predicate, the one adopted in the Conventions" | `TauCeti.SmoothForm.IsContactForm`, adopted in Convention 5; no claim of ownership here | agrees |

The rows of the untouched statements stand as in the previous review, of `71e7c7e`.

- Source locators checked against the text: 2 new of 2 (KrieglMichor1997 lines 21603–21632, printed pp. 471–472; GeigesHandbook lines 530–546, p. 16); the 21 earlier ones stand as in the previous review.
- Library declarations opened at the pin: `TauCeti.IsContMDiffDistribution.fiberBundle`, `.vectorBundle`, `.contMDiffVectorBundle` (`TauCeti/Geometry/Manifold/Distribution/VectorBundle.lean:145`, `:173`, `:191`) and `TauCeti.instTopologicalSpaceTotalSpaceDistribution` (`:88`).
- Cross-roadmap citations resolved: LieGroupoidsPoisson §G0.1 on main (its README lines 369–382: frames of a subbundle extending to ambient frames; kernels and images of constant-rank bundle maps). LieGroupoidsPoisson names ContactGeometry only in a scope sentence (line 2026) and consumes nothing from it, so the new edge makes no cycle. No open pull request revises LieGroupoidsPoisson.
- Dependency check: `depcheck: 182 roadmaps, 2073 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes only the two files of the folder.
- Automatic checks: every check passed on this head.
- Elaboration: `lake env lean` on `Suggested.lean` gives 8 `declaration uses 'sorry'` warnings and no error. The change to the Lean file is to three docstrings only; no signature changed, so the elaborated types and the one-tactic probe stand as in the previous review.
- The description against this head: 38 Checks counted (38); `import Mathlib` and four Tau Ceti modules (4); the anchors kept (4 of 4 present); LieGroupoidsPoisson §G0.1, Geiges 2.22 and Kriegl–Michor 43.15 named; the removed declarations and the dependency on the CotangentLagrangian revision stated. No sentence is contradicted and no change is left unstated.
- Headlines: unchanged since the previous review; stated or named in the module docstring as recorded there.

Overlap check: read CotangentLagrangian (main and #2687), SymplecticGeometry (main and #2696), DifferentialGeometry and LieGroupoidsPoisson (main). Shared objects: the cosphere forms are CotangentLagrangian §2.2's; the contact predicate is Tau Ceti's; the smooth-subbundle API is LieGroupoidsPoisson §G0.1's and is now cited, not restated; the quotient bundle `TM/D` is at none of them and stays a target here. The description names #2687 for the Layer 1 and §2.2 labels.

Source independence: changed passages only; 3 passages compared with 2 sources (the §6.1 sentence, the docstring of `jacobiBracket`, the two reference entries), none shared beyond standard names; largest share CourteGuillermouNotes, 11 of 23 locators; the diff adds, removes or reorders no layer, so the contents comparison stands as in the previous review: independent.

Research link: §5.4 is Lychagin's Legendrian neighbourhood theorem, which Kriegl–Michor (1997, Theorem 43.19) use for the Lie group of contact diffeomorphisms; Geiges (2006, §§2.4–2.5) builds isotopy extension on Gray, Darboux and the neighbourhood theorems; DGFloer's contact-type step consumes the §4.3 collar. Rests on KrieglMichor1997 §43, GeigesHandbook and the DGFloer README.

## Not verifiable

- none

## Source issues

- **Misprint** in GeigesHandbook at Theorem 2.22, p. 16: the source says the correspondence is with smooth functions into the positive reals; it should be all smooth real-valued functions, as its proof treats; affects nothing.

## For the human reviewers

- **Licence / scope.** The source with the largest share of locators (11 of 23) is CourteGuillermouNotes, unpublished course notes read from an author's page (README, References). The same theorems are in Geiges's published survey and Kriegl–Michor's book, both cited.
