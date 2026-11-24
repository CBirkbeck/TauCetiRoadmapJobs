# Review of MinimalSurfaces (pull request #2491 at 18e5a16)
Folder: `TauCetiRoadmap/RiemannianGeometry/MinimalSurfaces/`
**Verdict:** accepted

**Summary.** Accepted. This is an incremental re-review: the folder has not changed since the previous review of `18e5a16`, and this round reads the pull request's title and description, including the summary that now opens the description, against this head and against the change from the base. Every sentence of them holds at this head, and no change a reader must know of is left unstated. There are no findings and no small corrections; one format note is carried, not blocking. Four facts are left for the human reviewers, as before.

## N01 — The Lean statements of 4.2 and 5.1 do not assume the source surface Hausdorff

Carried; `Suggested.lean` is unchanged. `range_eq_plane_of_minimal_of_nonneg` and `exists_sq_mul_hessianCoordNormSq_le_lintegral` (`Suggested.lean` lines 55 and 89) carry `[TopologicalSpace S]` with no `[T2Space S]`, while the README's surfaces are Hausdorff. Both statements stay true; adding `[T2Space S]` would make the Lean and the README agree.

## Previous findings

- The previous report, of `18e5a16`, raised no finding (no R01) and no small correction.
- N01 — not repaired: `Suggested.lean` is unchanged; carried as N01.

## Verified sound

The folder's diff since the previous review is empty, so the rows are for the statements of 7.8 that the title and description cite, recomputed this round, and for the description's claims about the change.

| Statement | Instance | Roadmap or description side | Computed side | Result |
|---|---|---|---|---|
| Description: cone criterion, "nonnegative and positive, respectively" (README lines 1716–1731) | Simons cone, n = 7; `C_(1,1)`, n = 3 | strict iff `λ₁ + ((n−2)/2)² > 0`, stable iff `≥ 0` | n = 7: `−6 + 25/4 = 1/4 > 0`; n = 3: `−2 + 1/4 = −7/4 < 0` | holds |
| Description: products of spheres "not stable for n ≤ 6 and strictly stable for n ≥ 7" (line 1740) | n = 3, 4, 5, 6, 7, 8 | `(n² − 8n + 8)/4` | −7/4, −2, −7/4, −1, 1/4, 2 | holds |
| Description: "a sharp Hardy inequality", "proved in place" | `c = (n−2)/2`, n ≥ 3 | `∫f′² r^(n−1) ≥ c² ∫f² r^(n−3)` | square expands to `∫f′²r^(n−1) + (−2c² + c²)∫f²r^(n−3) ≥ 0`; boundary term `f(0)²·0^(n−2) = 0` | holds |
| Description: reduction "with an explicit constant" (line 1711) | `Q ≥ λ∫w⁻²ζ²`, `|A|² + Ric ≤ c₀w⁻²` | `κ = ½ min(λ, (1 + c₀/λ)⁻¹)` | `∫|∇ζ|² ≤ (1 + c₀/λ)Q`; average: `Q ≥ ½λ∫w⁻²ζ² + ½(1 + c₀/λ)⁻¹∫|∇ζ|²` | holds |
| Description: "test functions must cross the singular set" (line 1748) | half-plane, weight `|x₂|`, A = 0 | κ = 1/5 for ζ vanishing near the line | `∫x₂⁻²ζ² ≤ 4∫|∇ζ|²`, so `κ(1 + 4) ≤ 1`, κ = 1/5 | holds |
| Description: "converse fails for the one-sided `ℝP² ⊂ ℝP³`" (line 1750) | ζ = 1, U = `ℝP³` | not stable in U, stable in the sense of 6.3 | `(0 + 2)·2π = 4π > 0 = ∫|∇1|²`; deck-odd eigenvalues `j(j+1) − 2`, j odd, minimum 0 | holds |
| Description: "a plane that is stable and not strictly stable" | `ℝ² × {0} ⊂ ℝ³`, weight `|X|` | A = 0; no κ | `∫_{|X|<1} |X|⁻² = 2π∫_0^1 dr/r = ∞` when `ζ(0) ≠ 0` | holds |
| Description: dilation "preserves strict stability and its constant" | `Σ ↦ tΣ`, w homogeneous of degree one | all terms scale alike | `|A|²ζ²dμ`, `|∇ζ|²dμ`, `w⁻²ζ²dμ`: each `t⁻²·tⁿ = t^(n−2)` | holds |
| Description: "neither minimality nor two-sidedness"; comparison "for a minimal hypersurface" | README lines 1665–1670 and 1696 | definitions for any Σ of locally finite area; comparison for Σ minimal | head: "Σ need not be minimal", "not necessarily two-sided"; comparison item opens "for Σ minimal and not necessarily two-sided" | agrees |
| Description: "MS1 supplier contracts and MS2–MS12 build intact"; "headline Lean statements stay unchanged" | change from the base | no layer or declaration touched | 112 insertions, 5 deletions, all in `README.md`; one heading added (7.8), none removed; Layers 2–12 at lines 427–2344; 0 Lean declarations changed | agrees |
| Description: list of existing headlines | README lines 5–17, `Suggested.lean` docstring | ten named results | README summary names MS4–MS9, MS11, MS12 headlines; Bernstein (7.6) and Hersch (10.3) are stated in `Suggested.lean` lines 138 and 158 | agrees |
| Description: 6.1 "corrects the Chodosh reference" | README line 1188 | Theorem 23.2, arbitrary codimension | head reads "[Chodosh, Theorem 23.2, p. 60], for the index form"; base read "[Chodosh, §24]" | agrees |

The rows for the statements of the folder itself stand as in the previous review, of `18e5a16`.

- Title and description against the head and against the change from the base: 3 paragraphs of the opening summary, 4 bullets and 3 sentences of prose, and the title; none is contradicted. Changes a reader must know of, all stated: a revision of a roadmap on main; one section added (7.8), none removed or renumbered; no `Suggested.lean` declaration changed; no supplier added or dropped; the 6.1 locator. The two added references ([Simon21], [Simon23], lines 2455–2459) are named as the sources of 7.8.
- Source locators: none reopened this round; the changed text is the description only, and its source claims (the Euclidean oriented case, the weights `|X|` and `|x| + |ξ|`) repeat README lines 1681–1684, read against Simon21, Simon23 and Chodosh in the previous reviews.
- Cross-roadmap citations: none in the description beyond the README's own (R5a.2 and R5b of the parent, MS1 (a)). No open pull request changes this roadmap, drops an id it cites, or cites an id it drops.
- Automatic checks: all pass on this head. The dependency check prints `depcheck: 132 roadmaps, 1466 edges, 0 problem(s)`, with no UPWARD or CYCLE line. Nothing outside the folder changes.
- Elaboration: `Suggested.lean`, elaborated again, gives five `sorry` warnings (lines 55, 89, 116, 138, 158) and nothing else; a single `import Mathlib`, two `TauCeti.*` imports, no `set_option`.

Overlap check: read GeometricCurrents, LorentzianGeometry, PDE, HeegaardFloer, ManifoldOptimization (open) and RiemannianGeometry, Surfaces, PositiveMass (main) as in the previous review; nothing changed in the folder, and nothing is shared beyond what that review records (Simons' identity, the tangency principle and monotonicity are GeometricCurrents G6's; the linear elliptic theory is PDE's; Gauss–Bonnet is PositiveMass §3.1's; second variation and Schrödinger spectral theory are the parent's R5a–R5c). Stability across a singular set and strict stability are owned here alone.

Source independence: changed passages only; the folder's diff is empty, so 0 passages compared this round; largest share Chodosh, 59 of about 167 locators, as in the previous review; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: Layers 8–12 reach the Choi–Schoen compactness theorem (1985); 7.4–7.5 give Schoen's curvature estimate (1983) by Lynch's route (2026 preprint); 7.8 is the strict stability of Simon (2021, 2023), used there for hypersurfaces with prescribed singular set. Rests on the README and on Simon21 and Simon23, which were read.

## Not verifiable

- [CM] (AMS GSM 121), [ChoiSchoen] and [SY] (Springer), [Simons] (JSTOR), [Schoen] (Annals of Mathematics Studies 103) and [FCS]: no legal copy read, as in the previous review; nothing in the title or description rests on them.

## Source issues

- **Misprint** in Simon23 at the note after 1.2, p. 4: the source says the left side of 1.2 is the second variation of area; it should be the right side; affects nothing.

## For the human reviewers

- Licence: [Chodosh] is read from the author's Stanford page (web.stanford.edu/~ochodosh), a host the sources service does not classify; it was treated as an author page.
- Scope: the route of 7.4 follows [Lynch], an unrefereed preprint (arXiv:2611.12758v1, 2026; README lines 376 and 1527). The theorem it serves, 7.5, is Schoen's published estimate.
- Scope: no item of this roadmap consumes 7.8 (README lines 1753–1754 and 1771–1772); the uses its sources name are Simon's (Simon21, Simon23).
- Not tested: [CM] has the second-largest share of the locators (about 31 of 167) and no legal copy, so wording and arrangement were not compared with it.
