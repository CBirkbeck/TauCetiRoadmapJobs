# Review of RealSemisimpleLieGroups (pull request #2229 at 9a938c5)

**Verdict:** accepted

## Previous findings

- R01 — repaired: `TauCetiRoadmap/RealSemisimpleLieGroups/README.md:1112` assumes conjugate fixed groups; §5.4 derives their conjugacy after §5.3. Its dependency line includes §§5.2–5.3; §5.2 has no dependency on §5.4.

## Verified sound

| Statement | Instances tried | Values computed on both sides | Result | Change |
|---|---|---|---|---|
| §5.4 fixed-point theorem, cited in the PR summary and headline list | Euclidean plane; cyclic group of order two acting by negation; orbit of `(1,2)` | Averaged squared distance is `x²+y²+5`; minimum `5` at `(0,0)`; negation sends `(0,0)` to `(0,0)`. | Fixed point exists | None |
| Same theorem: compactness control | Integer translations of the Euclidean plane | Generator sends `(x,y)` to `(x+1,y)`; fixedness requires `1=0`; orbit of the origin is unbounded. | Noncompact group excluded | None |

The other adversarial rows stand as in the previous review, of `9a938c5`.

- PR text: title, prose and `roadmap-summary` checked against the base diff and head; new folder, six layers, 12 headline theorems, no removed sections or declarations, no unstated supplier change.
- Incremental scope: 0 changed folder lines; 0 seeded source locators fall in changed passages; 0 changes outside the folder; worktree clean.
- Signatures: all 22 named declarations checked with `#check @name`; 0 errors or changed signatures. The worker's extra `on` is docstring text; `groupRealRank` needs none of the omitted binders, and its compactness theorem retains them.
- Pinned declarations opened: 2, `TauCeti.Lie.Ad` at `TauCeti/Geometry/Lie/Adjoint/Derivation.lean:62` and `TauCeti.TitsSystem` at `TauCeti/GroupTheory/TitsSystem/Basic.lean:50`.
- Cross-roadmap resolver: 0 unresolved citations; PR supplier claims compared with LieGroups Layers 5A, 7, 9, AutomorphicFormsOnReductiveGroups §2.3a and ArithmeticLocallySymmetricSpaces ALS.0.1/ALS.F.1; overlap data lists 0 dropped citations or conflicting heads.
- Gate: worker's gate at this head passes all checks. Rerun passes text/scope checks and reports only `depcheck: NOT IN ORDER: RealSemisimpleLieGroups (insert it after its last supplier)`, explicitly exempted by the brief.
- Candidate-order dependency check: `depcheck: 245 roadmaps, 2218 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Targeted build, direct `lake env lean` elaboration and signature probe: all succeed, each with only 12 expected `sorry` warnings.

Overlap check: read AutomorphicFormsOnReductiveGroups, ShimuraData, LieHighestWeightPartII, ManifoldOptimization, LieHighestWeight, LieGroups, RiemannianGeometry and FlagVarieties; minimal real-algebraic parabolics belong to AutomorphicFormsOnReductiveGroups §2.3a, global decompositions and restricted roots to LieGroups Layer 9, homogeneous metrics/comparison to RiemannianGeometry, algebraic flag classification to FlagVarieties, and real analytic extensions to this roadmap. Highest-weight inputs are supplied library theory; the remaining scopes add no ownership change relevant to this zero-line re-review.

Source independence: changed passages only; 0 passages compared with 0 sources, with no layer rearrangement to recheck. Knapp2002 has the largest share, 18 of 52 named source-citation occurrences before References; its text and contents remain untested because access is settled as uncertified.

## Not verifiable

- Knapp2002, Warner1972, BorelJi2006, BourbakiLieIV and Borel1991: settled uncertified in `packages/RealSemisimpleLieGroups/sources.toml`; no renewed access request.
- Helgason, Eberlein and Goldman: no legal copy recorded in the supplied review history and PR source-access paragraph; no changed locator requires a new check.

## Source issues

- none

## For the human reviewers

- **Not tested:** Knapp2002, the most-cited source, is uncertified in `packages/RealSemisimpleLieGroups/sources.toml:23`; its wording and table of contents were not compared in this incremental review.
