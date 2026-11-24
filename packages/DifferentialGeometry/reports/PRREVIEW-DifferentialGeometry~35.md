# Review of DifferentialGeometry (pull request #334 at a01a8ad)

**Verdict:** needs changes

**Summary.** Changes are needed, for one reason: the pull request adds the folder `TauCetiRoadmap/DifferentialGeometry/`, and main already has a roadmap in that folder, merged after this branch was cut, which plans the same objects (the wedge along a coefficient pairing, pullback, the manifold exterior derivative, Lie-algebra-valued forms, joint smoothness of flows) in far more detail. The two texts cannot both merge, so nothing else about this text was reviewed; there are no small corrections and no format notes. Whether the differential-geometry roadmap should be split, which the README asks, is for the human reviewers and the author to settle.

## R01 (P1) — The pull request adds a second roadmap in a folder where main already has one, and plans again what that roadmap plans

The branch was cut at `27ffe09`, when `TauCetiRoadmap/DifferentialGeometry/` did not exist. Main now has it: a README of 3253 lines with layers 0 to 12, a `Suggested.lean` of 1097 lines, `STATUS.md`, `PROGRESS.md` and `metadata.toml`. This head's README (482 lines) and `Suggested.lean` (154 lines) share no line of content with main's; the branch has not merged main. Merging as it stands would conflict in both files, and resolving in favour of this text would delete every layer of main's roadmap, which dozens of other roadmaps, on main and in open pull requests, cite by layer or section.

The ids main defines and this text lacks are all of them: Layer 0 (alternating bundles, forms, wedge; §0.1, §0.3, §0.4), Layer 1 (exterior derivative; §1.2, §1.4), Layer 2 (orientations; §2.1), Layer 3 (flows; §3.1 to §3.5), Layer 4 (distributions, Frobenius; §4.3), Layer 5 (integration and Stokes; §5.1 to §5.4, §5.5b), Layer 5.6 (planar Green), Layer 6 (de Rham complex; §6.2, §6.4), Layer 7, Layer 8 (de Rham theorem; §8.3, §8.4), Layer 9, Layer 10 (degree; §10.2), Layer 11, Layer 12 (Riemannian metrics, Laplace–Beltrami; §12.3), and the sections "Boundary and corners" and "Rectifiable curves and geometric measure theory".

What this text proposes is, item by item, already in main's roadmap:

- the wedge along a continuous bilinear coefficient pairing is main's 0.1, built on Tau Ceti's `ContinuousAlternatingMap.pairedWedge`, with the same determinant normalisation (permutation sum divided by `k! l!`) and the Lie-algebra-valued Check `[φ ∧ φ](v, w) = 2[φ v, φ w]`, hence `dω + ½[ω ∧ ω]`;
- rough and smooth forms, pullback through `compContinuousLinearMap`, and the bridge to `TauCeti.SmoothTwoForm` are main's 0.3 and 0.4;
- the manifold exterior derivative, `d² = 0`, naturality, the Leibniz law for a fixed pairing and the Cartan calculus are main's Layer 1 (1.1 to 1.4);
- joint smoothness of the flow in time and initial point (Lee, Thm. 9.12) is main's 3.1 and 3.2: for finite-dimensional models it is cited there as Tau Ceti's `contMDiffOn_maximalIntegralCurve`, and the open target is the extension to Banach models.

This text's flow section also rests on declarations that neither library pin contains: there is no `contMDiff_flow_like`, `expLie`, `funVF` or `ExpLie.lean` in Tau Ceti, at the pin of this branch or at main's, so Tau Ceti has no such axiom to replace. They appear to live in the fork linked from the docstring of `Suggested.lean`.

What this text has that main lacks, and is worth carrying over:

- two references main does not cite: the Kudryashov–Lindauer progress report of 12 May 2026 and Yin–Kudryashov, arXiv:2602.13247 (main cites the `DeRhamCohomology` repository and the discussion threads only);
- the statement of the flow theorem for an arbitrary family: if `Φ 0 x = x` and every `t ↦ Φ t x` is an integral curve of a `C^n` field on a boundaryless Hausdorff manifold, then `Φ` is jointly `C^n`. Main's 3.2 states joint smoothness for the maximal flow; this corollary (by uniqueness of integral curves) is not an item there and could be added to Layer 3 as a new item, with its regularity fixed rather than left as a placeholder;
- the application to smoothness of the Lie-group exponential, as a line under main's "Downstream consumers" or in the Lie-groups roadmap, whichever owns it.

The repair is the author's choice between two: make the pull request a revision of main's text (merge main into the branch, take main's README and `Suggested.lean`, and make the additions above inside them, every layer and section of main keeping its id and subject), or close it in favour of main's roadmap. A proposal to split the roadmap into parts is a discussion for an issue; it cannot be carried by a README that replaces the roadmap. The statements of this copy were not reviewed further, since repairing them would be wasted work; for the record, its `Suggested.lean` does not compile (line 89: a binder is named `ω`, which is a reserved token once the `ContDiff` scope is open) and defines `wedgeWith` by `sorry`.

## Questions for the author

- Is the `contMDiff_flow_like` axiom in a fork of Mathlib rather than in Tau Ceti? I could not find it, `expLie` or `funVF` in the Tau Ceti that this branch or main pins, so I could not tell which library the "existing" flow and Lie-group work refers to.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| The folder is a second copy | merge base `27ffe09` against main `592bdb1` | merge base: folder absent; main: README 3253 lines, 5 files; head: README 482 lines; common content lines: 0 (two headings only) | confirmed | R01 |
| Paired wedge has an owner | main's 0.1 (lines 691–726) against this head's §6–7 | both: pairing `μ : F₁ →L F₂ →L F₃`, degree `k + l`, normalisation giving `φ(v)ψ(w) − φ(w)ψ(v)` in degree (1,1) | same object | R01 |
| Smooth flow has an owner | main's 3.1–3.2 (lines 1257–1277) against this head's §11 | main: finite-dimensional case cited from Tau Ceti, Banach case the target; head: 2/3/2 regularity "placeholders" | same theorem, main's is definite | R01 |
| "Existing `contMDiff_flow_like` axiom" | search of Tau Ceti at both pins | 0 occurrences of `contMDiff_flow_like`, `expLie`, `funVF`; no axiom of that name | not in the library | question |

- Source locators checked against text: 0 (steps after the duplication audit were skipped, as the rules for a second copy require).
- Library declarations opened: `contMDiffOn_maximalIntegralCurve` (`Geometry/Manifold/IntegralCurve/Flow.lean:33` in the Tau Ceti main pins); `pairedWedge` (`Analysis/Calculus/DifferentialForm/Wedge.lean`, same pin); `Geometry/Manifold/TwoForm.lean` exists at this branch's pin.
- Cross-roadmap citations resolved: this README makes none.
- Dependency check: `depcheck: 132 roadmaps, 1466 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Changes outside the folder: none.
- Elaboration: not run; the worker's build fails at `Suggested.lean` line 89, which I confirmed by reading (binder named `ω` under `open scoped ContDiff`).
- Previous review on file: it read another pull request (the revision of 5.4 and 10.2 of main's README) and was an acceptance with all five earlier remarks repaired; none of them concerns a passage of this head.

Overlap check: read DifferentialGeometry on main (the roadmap this text duplicates); HamiltonianSystems and HopfRinow, the nearest by vocabulary at 0.09, were not read, since the audit stops at the second copy. Every object of this text is owned by DifferentialGeometry on main.

Source independence: not carried out (0 passages compared); the review stops at the second copy.

Research link: not assessed for this text; main's roadmap of the same folder carries the subject.

## Not verifiable

- The seeded sample (Kudryashov–Lindauer, progress report of 12 May 2026) and the locators into Tu and Lee: not opened, because the review stops at the second copy.

Automatic checks set aside as false positives: none. The failed build, the definition whose body is `sorry` and the missing `metadata.toml` are real; they are not raised as separate remarks because this text cannot merge as a copy.

## Source issues

- none

## For the human reviewers

- Scope: the README (lines 3–15, 408–416) is addressed to a named maintainer (`deicyde`) and asks whether to split the differential-geometry roadmap; main already has that roadmap unsplit, layers 0–12.
- Licence: the docstring of `Suggested.lean` (line 15) links a branch of a personal Mathlib fork as "existing flow/Lie work"; that code is in neither pinned library.
