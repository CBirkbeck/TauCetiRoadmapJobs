# Review of MinimalSurfaces (pull request #2226 at 7fce733)
Folder: `TauCetiRoadmap/RiemannianGeometry/MinimalSurfaces/`
**Verdict:** accepted

## Previous findings

- R01 — repaired: The description now says the global tangency principle of 4.1 and both closing steps of 4.2 were written with Claude Opus 5.5 after the review of `4788ed5`, independently of the TeX source.

## Verified sound

| Statement | Instances tried | Claimed value | Computed value | Result / change |
|---|---|---|---|---|
| §4.1 global tangency, cited by the corrected provenance note | `f(u,v)=(u,v,2)`; comparison planes at heights 2 and 3 | Preimage is all of `ℝ²` or empty | Height 2: `2=2`, preimage `ℝ²`; height 3: `2≠3`, preimage `∅` | Both alternatives hold; no mathematical edit |
| §4.2 half-space theorem, cited by the corrected provenance note | `f(u,v)=(u,v,2)` into `{x₃≥0}` | Image `{x₃=c}` for some c | Coordinate Laplacians `(0,0,0)`; `dfᵀdf=I₂`; image `{x₃=2}`, so `c=2` | Holds; no mathematical edit |

The adversarial rows for untouched statements stand as in the previous review of `530ac52`.

- Incremental scope: 0 folder lines changed; 1 previous finding repaired; title and full description checked against the 2 added files and the family-index diff.
- Source sample: 0 new locator checks; all 15 seeded targets are outside the folder diff; earlier source checks and access limitations stand.
- Supplier citations: 10 supplier roadmaps resolved against main; R3 free-endpoint variation, R4.1 barriers, R5c, R7.9 and Surfaces S6 now occur on main and satisfy MS1's contracts; no missing citation reported by `roadmaps resolve`.
- Ownership: 8 closest-roadmap scopes read; CanonicalModelsAndGonality §8.4 still cites 10.3–10.4 (`TauCetiRoadmap/CanonicalModelsAndGonality/README.md:1911`, #1726); no conflicting ownership or dropped cited id found.
- Pinned evidence: `TauCeti.Manifold.laplaceBeltrami` opened at `TauCeti/Geometry/Manifold/Riemannian/Laplacian.lean:238`, body `divergence I (mgradient I f) x`; all 7 freshly elaborated signatures match the supplied signatures, with no lost binder; pins and statements are unchanged, so the previous padding probes stand.
- Gate: worker gate passes every check, including build; standalone rerun reports only `depcheck: NOT IN ORDER: MinimalSurfaces (insert it after its last supplier)` and `outside-folder: TauCetiRoadmap/RiemannianGeometry/README.md`, both explicitly exempted by this brief.
- Dependency-check output: `depcheck: 219 roadmaps, 1941 edges, 0 problem(s)`; no UPWARD or CYCLE. Targeted build passes (Lake emits a module-system advisory); direct Lean elaboration passes with exactly 5 `sorry` warnings.
- Scope diff: 0 PR changes outside the authorized folder and family index; the other files listed since `530ac52` are inherited from merged main; worktree remains clean.

Overlap check: read LorentzianGeometry, ManifoldOptimization, PDE, TeichmullerGeometry, YangMillsConnectionsAndCaloricGauge, RiemannianGeometry, Surfaces and PositiveMass; immersion/variation geometry belongs to RiemannianGeometry, linear elliptic estimates to PDE, intrinsic surface geometry and point cutoffs to Surfaces, closed-surface Gauss–Bonnet to PositiveMass; the remaining scopes add no shared owned target.

Source independence: changed passages only; 0 mathematical passages compared with 0 sources because the folder diff is empty. Largest share: Chodosh, 55 of 123 bracketed locator citations. No layer was added, removed or reordered; the contents comparison was not repeated. The corrected provenance note identifies the independently written arguments.

## Not verifiable

- Carried from `530ac52`: Frankel, §§1–2, pp. 69–71 — the sources service reached only JSTOR; the cited pages remain unread.
- Carried from `530ac52`: Bernstein, Theorem 3.1 — the Johns Hopkins host returned HTTP 403.
- Carried from `530ac52`: Lee, Chapters 6 and 10 — paywalled.
- Carried from `530ac52`: CM, §1.1 — no legal copy was found.
- Carried from `530ac52`: HM, Theorem 1 — paywalled; §4.2 was checked against Chodosh, Theorem 20.1 in the previous review.

## Source issues

- none

## For the human reviewers

- none
