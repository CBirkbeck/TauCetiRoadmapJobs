# Review of ComplexManifolds (pull request #2549 at d33ec3d)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired (§7.6 and the `Suggested.lean` docstring now carry the Hausdorff hypothesis, with a computed non-Hausdorff counterexample as a Check), and the repairs introduce no new problem. §1.4 and §4.5 are now stated as holding by definition, with the pinned theorem for the transported model, and §7.4 has a Check that separates the normal bundle from its dual. There are no small corrections and no format notes. For the human reviewers: seven of the eight cited textbooks cannot be read legally here.

## Questions for the author

- Carried from the previous review, the text being unchanged: the contract for SmoothBundlesConnections §B2.1 assumes its tensor and exterior-power carriers are "generic over the field", while §B2.1 on main discusses complex bundles only over a real base. Is the generic-field form agreed with that roadmap? Its text alone does not settle it.

## Previous findings

- R01 — repaired: §7.6 (line 867) reads "act freely by biholomorphisms on a Hausdorff complex manifold `M`, so that Layer 4 applies"; the `Suggested.lean` docstring (line 49) says "compact connected Hausdorff complex manifold"; a third Check gives the counterexample.
- C01 — repaired: §1.4 (line 189) says open restriction holds "by definition"; §4.5 names `ContMDiffConstSMul.restrictScalars` and `ContinuousLinearEquiv.contMDiffConstSMul_transContinuousLinearEquiv_iff`; Scope no longer lists either as a remaining target.
- N01 — repaired: §7.4 has a second Check (line 841), the line `{x₂ = 0}` in `ℙ²`: cocycle `t` gives `O(1)`, the inverse `1/t` gives `O(−1)` with no nonzero section.

## Deferred findings

- D01 — stands

## Verified sound

| Statement | Instances tried | Values computed (README side / library or computation side) | Result | Change |
|---|---|---|---|---|
| §1.4 open restriction, by definition | `U` open in `M` | README: one charted space / pinned `TopologicalSpace.Opens.instChartedSpace` takes `[ChartedSpace H M]` and `s` only, no model argument | holds | none |
| §4.5 realification half | `G` on `M`, `𝓘(ℂ, E)` | README: action `C^n` for realified model / pinned `ContMDiffConstSMul.restrictScalars` (`Algebra/SMul.lean:131`): `𝓘(𝕜', E) → 𝓘(𝕜, E)`, same `ChartedSpace E M` | holds | none |
| §4.5 recharting half | `e : E ≃L[𝕜] F`, any `I`, `n` | README iff / pinned iff (`Algebra/SMul.lean:105`) same; probe: `IsManifold (I.transContinuousLinearEquiv e) n (M/G)` by `inferInstance`; comparison map equals `id` by `rfl` | holds | none |
| §4.5 quotient atlas independent of model | `MulAction.instChartedSpaceQuotient` | signature at pin: `H`, `ChartedSpace H M`, no `ModelWithCorners` | holds | none |
| §7.4 Check, line in `ℙ²` | `u₀ = x₂/x₀`, `u₁ = x₂/x₁` | `u₀/u₁ = x₁/x₀ = t`; `s₀ = t s₁`: `s₀` entire, `s₀/t` bounded at `∞`, so `a + bt`, dimension 2 = `h⁰(O(1))` / inverse: `t s₀` bounded, `s₀ = 0` | holds | none |
| §7.6 statement with Hausdorff | finite `G`, free, `M` Hausdorff, `E` finite-dimensional | Layer 4 needs `T2Space`, `LocallyCompactSpace`, properly discontinuous: finite `G` gives finitely many `g` trivially; finite-dimensional model gives local compactness | holds | none |
| §7.6 Check, doubled 2-torsion | `T = ℂ/Λ`, `z ↦ −z` swapping copies | fixed points of `−1` on `T`: the 4 points `2p = 0`, all swapped, so free; `−(p + w) = p − w`; `f(p₁) = lim f(p + w) = f(p₂) = −f(p₁)`, so `0` | holds | none |
| §7.6 theorem (headline 2), unchanged conclusion | torus, half-period translation; `ℂ ∖ {0}`, `z ↦ −z` | constant `f = −f` gives `0`, nontrivial / `f = z` trivializes, noncompact; pinned `MDifferentiable.apply_eq_of_compactSpace` needs compact, preconnected | holds | none |
| `Suggested.lean` docstring, §7.6 entry | against §7.6 and the Summary | docstring: compact, connected, Hausdorff, free, finite, biholomorphisms / §7.6: the same six | agree | none |

The rows for untouched statements stand as in the previous review, of `6611a6e`.

- Source locators checked against a text: 3 in the changed passages or beside them (demailly-agbook V §6 p. 261, lines 12860–12867; V §13 p. 271, line 13337; VII (12.4) a) p. 357, lines 17495–17503). All support the text. Of the seeded sample, the changed passages touch §4.5 and §7.6; §4.5 cites no readable text.
- Library declarations opened at the pins: Tau Ceti `Geometry/Manifold/Algebra/SMul.lean:105` (the iff), `:113` (the instance for the transported model), `:131`; Mathlib `Geometry/Manifold/Instances/Quotient.lean:50`, `Geometry/Manifold/Diffeomorph.lean:467` (in namespace `ContinuousLinearEquiv`); `TopologicalSpace.Opens.instChartedSpace` and `MDifferentiable.apply_eq_of_compactSpace` by `#check`.
- Probe elaborated at the pins: the transported-model manifold instance on the orbit space, the identity comparison diffeomorphism, and its underlying map equal to the identity by `rfl`; no error.
- Cross-roadmap citations: the diff adds none; MorseTheory's link on main (line 1216) still has the old fragment (D01).
- Dependency check: `depcheck: 200 roadmaps, 2198 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed, run again on this head. `Suggested.lean` elaborates with no output; it declares nothing, so there is no signature to compare and nothing for the one-tactic probe. Nothing changed outside the folder.
- The pull request's description read against the head: 30 Checks counted in the README, as it says; it states the §7.4 and non-Hausdorff §7.6 Checks, the by-definition status of §1.4 and §4.5 and the two pinned theorems; no sentence contradicts the head.

Overlap check: read ComplexTori (main and its open revision), ComplexKahlerGeometry (main and its open revision), SmoothBundlesConnections, QuasiregularMaps, DifferentialGeometry; nothing shared beyond what the previous review recorded (quotients, gluing, §7.4 and §7.6 owned here; tensor and exterior-power carriers owned by SmoothBundlesConnections §B2.1), and the diff moves no ownership.

Source independence: changed passages only; 5 passages compared with 1 source (demailly-agbook, at pp. 261, 271, 357 and by search for the two new examples), none shared; largest share demailly-agbook, 4 of 15 in-text locators; the diff adds, removes or reorders no layer, so the contents comparison stands: independent. The seven other texts could not be read.

Research link: foundational complex-manifold infrastructure. By the README's Downstream consumers, ComplexKahlerGeometry, ComplexTori, AnalyticToricGeometry and FuchsianOrbifolds build on Layers 1–7; Layer 7's divisor, normal and canonical bundles are the objects Demailly 2012 (Ch. V §13, Ch. VII §§3, 12) uses for vanishing theorems and blow-ups. Rests on the README and demailly-agbook.

## Not verifiable

- Forster, *Lectures on Riemann Surfaces*, Sections 4–5, and Lee, *Introduction to Smooth Manifolds*, Chapter 21 (cited for Layer 4, which §4.5 and §7.6 rest on): not in the roadmap's source manifest or the sources cache; paywalled. The changed statements were checked against the pinned declarations and by computation instead.
- The other chapter-level locators of the seeded sample (Kobayashi–Nomizu, Huybrechts, Bott–Tu, Bourbaki, Steenrod) are in untouched text and remain unread, as in the previous review.

## Source issues

- none

## For the human reviewers

- Not tested: seven cited textbooks (Kobayashi–Nomizu, Huybrechts, Bott–Tu, Forster, Lee, Steenrod, Bourbaki) carry 11 of the README's 15 in-text locators and are not legally readable here; wording and arrangement were compared only with demailly-agbook (4 locators) and mathlib4-pr-40727.
