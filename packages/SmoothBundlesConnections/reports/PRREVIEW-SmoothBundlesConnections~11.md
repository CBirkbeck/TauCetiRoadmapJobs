# Review of SmoothBundlesConnections (pull request #2127 at ca84a4a)

**Verdict:** accepted

🤖 AI-assisted incremental re-review: 0 changed folder lines since ca84a4a; title and description checked against the base-to-head change.

## Previous findings

The previous review accepted this head with no open findings. Its recorded repairs remain:

- R01 — repaired: `TauCetiRoadmap/SmoothBundlesConnections/README.md`:859–864, 890–897 consumes continuous fibre norms and Gram–Schmidt frames; metric data and smoothness remain targets.
- R02 — repaired: `TauCetiRoadmap/SmoothBundlesConnections/README.md`:344–351 consumes `ContMDiffVectorBundle.pullback` and retains smoothness of the pulled-back submersion-coordinate frames.
- R03 — repaired: `TauCetiRoadmap/SmoothBundlesConnections/README.md`:1899–1902 names `Convexity.StdSimplex` as the target of `TauCeti.fullSimplexEquivStdSimplex`.
- R04 — repaired: `TauCetiRoadmap/SmoothBundlesConnections/README.md`:241 includes `TauCeti.isMIntegralCurve_mulInvariantExp_smul_smul`; the description accounts for the expanded Tau Ceti supplier contract.
- R05 — repaired: `TauCetiRoadmap/SmoothBundlesConnections/README.md`:2325–2326 cites Demailly IV (4.18)–(4.19), p. 205, for modules over soft ring sheaves.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| B1.1 presentation and transported division, `TauCetiRoadmap/SmoothBundlesConnections/README.md:415` | `P=ℝ×S₃`; `p=(2,(12))`, `q=(2,(23))`; permutations compose right to left | `δ=p⁻¹q=(123)`; `p·δ=(2,(23))=q`. Reversing division gives `(132)` and `p·(132)=(2,(13))≠q`. | Presentation preserves the stated right-action division. | None |

Untouched statements' adversarial rows stand as in the previous review of ca84a4a.

- PR text: title, `roadmap-summary` and prose cover the revision of main, the Layer 1/2/6 changes, supplier transfers, one actual removed Lean declaration and four added declarations; no headings removed or renumbered. The worker's apparent declaration `above,` is docstring text.
- Scope: 708 insertions and 291 deletions against the merge base, confined to the two requested roadmap files; 0 folder changes since the previous review and 0 outside-folder changes.
- Sources: 4 Demailly locators reopened for the description's acyclicity paragraph—IV (4.14), (4.15), (4.18), (4.19), p. 205; `demailly-agbook` lines 10227–10232, 10258–10272. The five seeded targets have no changed passages; their previous source checks stand.
- Pinned declarations: 7 reopened in `Mathlib/Geometry/Manifold/VectorBundle/Pullback.lean:39`, `TauCeti/Topology/VectorBundle/Riemannian/Hermitian.lean:56`, `TauCeti/Topology/VectorBundle/GramSchmidt.lean:142`, `TauCeti/Geometry/Convex/FullSimplex.lean:85`, and `TauCeti/Geometry/Lie/FundamentalVectorField.lean:316`.
- Citations: 0 unresolved cross-roadmap citations in the supplied resolver; its library-name lead resolves to the retained citation name at `TauCetiRoadmap/DifferentialGeometry/README.md:2600`. ComplexKahlerGeometry §2.5 and §5.1 on main match the description's references.
- Gate: rerun returned all counters 0 and `OK`; the separately rerun targeted build exited 0. Lake also emitted its module-system advisory; direct elaboration emitted only 7 `sorry` warnings.
- Elaboration: direct `lake env lean` exited 0; scratch `#check @name` for all 13 actual declarations exited 0. The README hypotheses remain in the elaborated signatures; no binder repair is needed. Previous padding-probe evidence stands.
- Dependency check: `depcheck: 245 roadmaps, 2207 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.

Overlap check: read DifferentialGeometry, LieGroupoidsPoisson, ComplexKahlerGeometry (main and #1807/#1808), CharacteristicClasses (#1807), TopologicalKTheory (#1807), and ManifoldOptimization (#1506). Smooth bundles, transport, good covers and the normalized circle class belong to SmoothBundlesConnections; continuous bundle theory to TopologicalKTheory; general characteristic classes to CharacteristicClasses; smooth-chain integration and de Rham comparison to DifferentialGeometry; the Atiyah algebroid bracket to LieGroupoidsPoisson. The unchanged fine-acyclicity overlap with ComplexKahlerGeometry §2.5 is acknowledged in the PR description.

Source independence: changed passages only; 0 changed roadmap passages to compare, and 1 description paragraph checked against 1 source (Demailly). No layer was added, removed or reordered; the previous arrangement assessment stands.

## Not verifiable

- Unchanged locators retain the previous review's limitations: no legal copy of Kobayashi–Nomizu I was available there; Lee's smooth-manifold and Riemannian-manifold texts were paywalled. No new source request arises from this zero-line re-review.

## Source issues

- none

## For the human reviewers

- none
