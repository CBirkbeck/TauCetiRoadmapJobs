# Review of MinimalSurfaces (pull request #2491 at 6b081a3)
Folder: `TauCetiRoadmap/RiemannianGeometry/MinimalSurfaces/`
**Verdict:** accepted

**Summary.** Accepted. This is an incremental re-review of the 12 lines of 7.8 changed since `7583884`, and of the pull request's title and description against this head. Both small corrections of the previous review are repaired: the Euclidean case is now attributed to Simon's 1.2 for an oriented hypersurface, which is what that source states, and the description no longer restricts the definitions to two-sided hypersurfaces. There are no findings and no small corrections; two format notes are carried, neither blocking. Four facts are left for the human reviewers, as before.

## N01 — The claim that the scalar notion is stronger on a one-sided Σ has no argument

Carried. In 7.8, line 1688 says the definitions "are stronger than the stability of 6.3 (Checks)" on a one-sided Σ, but the Check only shows that the two differ. The implication is true and takes one line, which would be worth adding: for a τ-odd compactly supported φ̃ on the double cover, `|φ̃|` is τ-even and Lipschitz, descends to Σ, and `Q(φ̃) = Q(|φ̃|) ≥ 0`.

## N02 — The Lean statements of 4.2 and 5.1 do not assume the source surface Hausdorff

Carried; `Suggested.lean` is unchanged. `range_eq_plane_of_minimal_of_nonneg` and `exists_sq_mul_hessianCoordNormSq_le_lintegral` (`Suggested.lean` lines 55 and 89) carry `[TopologicalSpace S]` with no `[T2Space S]`, while the README's surfaces are Hausdorff. Both statements stay true; adding `[T2Space S]` would make the Lean and the README agree.

## Previous findings

- The previous report, of `7583884`, raised no finding (no R01).
- C01 — repaired: the description now reads "For a hypersurface without boundary, two-sided or not, in any Riemannian manifold … Two-sidedness is assumed only where the form is identified with the second variation of area."
- C02 — repaired: README line 1683 now reads "For an oriented Σ, the Euclidean case, `Ric = 0` and μ the Hausdorff measure, is [Simon23, 1.2, pp. 3–4]"; the source's hypersurface is oriented (Simon23 line 91).
- N01 — not repaired: line 1688 is unchanged; carried as N01.
- N02 — not repaired: `Suggested.lean` is unchanged; carried as N02.

## Verified sound

| Statement | Instance | Roadmap side | Computed side | Result |
|---|---|---|---|---|
| 7.8, attribution of the Euclidean case to [Simon23, 1.2] for oriented Σ | `Ric = 0`, `w = |x| + |ξ|`, μ Hausdorff | `∫|A|²ζ² + κ∫(|∇ζ|² + w⁻²ζ²) ≤ ∫|∇ζ|²` | Simon23 lines 91–111: oriented M; `κ∫(|∇ζ|² + r̃⁻²ζ²) ≤ ∫(|∇ζ|² − |A|²ζ²)`, `r̃ = |x| + |ξ|`, `ζ ∈ C^∞_c` ambient: the same inequality | holds |
| 7.8, "For an oriented Σ" is a real restriction of the Euclidean case | open Möbius band in `U = ℝ³` | definitions admit one-sided Σ | embedded, boundaryless, not closed in U, no global normal: admitted by 7.8, outside the source's oriented M | holds; the clause is needed |
| 7.8 cone criterion, cited by the changed paragraph for the weight `|X|` | Simons cone, n = 7; `C_(1,1)`, n = 3 | `λ₁ + ((n−2)/2)² > 0` iff strictly stable | `−6 + 25/4 = 1/4 > 0`; `−2 + 1/4 = −7/4 < 0`; `(n² − 8n + 8)/4` at n = 6, 7: `−1`, `1/4` | holds |

The diff changes no statement; the rows for the untouched statements stand as in the previous review, of `7583884`.

- Source locators read against the text this round: 1, [Simon23, 1.2, pp. 3–4] with Theorem 1.1 (Simon23 lines 89–119, arXiv:2101.06401v2). None of the 15 seeded sample targets falls in the changed passage.
- Changed passage read against what cites it: the MS7 scope bullet (line 52), the scope sentence on 7.8 (line 112), the Layer 7 guide (line 388), the Layer 7 dependencies (line 1764) and all of 7.8 (lines 1660–1747). None is made wrong by the change.
- Cross-roadmap citations in the changed passage: none. No open pull request changes this roadmap, drops an id it cites, or cites an id it drops.
- Automatic checks: all pass on this head. The dependency check prints `depcheck: 109 roadmaps, 1250 edges, 0 problem(s)`, with no UPWARD or CYCLE line. Nothing outside the folder changes, against the base or since `7583884`.
- Elaboration: `Suggested.lean` is unchanged since `7583884`; elaborated again, it gives five `sorry` warnings (lines 55, 89, 116, 138, 158) and nothing else.
- Title and description against the head, sentence by sentence: all hold. One heading added (7.8), none removed or renumbered; `Suggested.lean` unchanged; no supplier added or dropped; the scope bullet, the scope sentence, the Layer 7 dependencies and the 6.1 locator ([Chodosh, Theorem 23.2, p. 60]) are changed as described; the Checks listed are the five of 7.8, with `(n² − 8n + 8)/4` negative for 3 ≤ n ≤ 6 and positive from n = 7.

Overlap check: read GeometricCurrents, LorentzianGeometry, PDE, HeegaardFloer, ManifoldOptimization (open) and RiemannianGeometry, Surfaces, PositiveMass (main) as in the previous review; the change touches no owned object, and nothing is shared beyond what that review records (Simons' identity, the tangency principle and monotonicity are GeometricCurrents G6's; the linear elliptic theory is PDE's; Gauss–Bonnet is PositiveMass §3.1's; second variation and Schrödinger spectral theory are the parent's R5a–R5c). Stability across a singular set and strict stability are owned here alone.

Source independence: changed passages only; 1 passage compared with 1 source (Simon23), none shared beyond the formula and standard terms; largest share Chodosh, 59 of about 167 locators, as in the previous review; the diff adds, removes or reorders no layer, so the arrangement was not compared again.

Research link: Layers 8–12 reach the Choi–Schoen compactness theorem (1985); 7.4–7.5 give Schoen's curvature estimate (1983) by Lynch's route (2026 preprint); 7.8 is the strict stability of Simon (2021, 2023), used there for hypersurfaces with prescribed singular set. Rests on the README and on Simon21 and Simon23, which were read.

## Not verifiable

- [CM] (AMS GSM 121), [ChoiSchoen] and [SY] (Springer), [Simons] (JSTOR) and [Schoen] (Annals of Mathematics Studies 103): no legal copy, as in the previous review; none is cited in the changed passage.

## Source issues

- **Misprint** in Simon23 at the note after 1.2, p. 4: the source says the left side of 1.2 is the second variation of area; it should be the right side; affects nothing.

## For the human reviewers

- Licence: [Chodosh] is read from the author's Stanford page (web.stanford.edu/~ochodosh), a host the sources service does not classify; it was treated as an author page.
- Scope: the route of 7.4 follows [Lynch], an unrefereed preprint (arXiv:2611.12758v1, 2026; README lines 376 and 1527). The theorem it serves, 7.5, is Schoen's published estimate.
- Scope: no item of this roadmap consumes 7.8 (README lines 1746–1747 and 1764–1765); the uses its sources name are Simon's (Simon21, Simon23).
- Not tested: [CM] has the second-largest share of the locators (about 31 of 167) and no legal copy, so wording and arrangement were not compared with it.
