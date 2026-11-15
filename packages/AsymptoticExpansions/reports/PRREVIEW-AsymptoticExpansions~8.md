# Review of AsymptoticExpansions (pull request #2113 at 3d73056)

**Verdict:** accepted

## Previous findings

- None: the previous review of `3d73056` accepted the folder with no open findings.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| PR description; README Layer 3 example, line 530 | `q(t) = 1/(1+t²)`, `s = 2`, `t = 2` | `q‴(2) = 24·2·(1−4)/5⁴ = −144/625`; corrected `q₂(2) = (−1)³(−144/625) = 144/625` | Description matches head | none |
| PR description; README §8.5, lines 1037–1041 | `h(t) = t^(−3/2)` for `t > 1`; `l = 2`; `δ = 1/2, 1/4` | `Mh(z) = [t^(z−3/2)/(z−3/2)]₁^∞ = 1/(3/2−z)`; pole `3/2`; contour `3/2` or `7/4`; separation `0` or `1/4` | First contour forbidden; second admissible | none |

The adversarial rows for untouched statements stand as in the previous review of `3d73056`.

- Increment: 0 changed folder lines; 0 previous findings; 0 seeded targets intersect changed passages, so the settled source sample was not repeated.
- PR text: title and quoted description match both base-to-head README hunks (5 insertions, 4 deletions); 0 omitted section, theorem, declaration or supplier changes; 0 outside-folder changes.
- Citations: ZerosOfLFunctions §§1.2–1.3 resolved on main at `TauCetiRoadmap/ZerosOfLFunctions/README.md:510` and `:520`; ContourIntegration resolved at `Completed/ContourIntegration/README.md:3`.
- Pin: opened `TauCeti.Contour.residue`, `TauCeti/Analysis/Contour/Residue/Basic.lean:80`; the residue convention consumed by §8.5 agrees.
- Gate: all text, dependency and scope checks passed; worker gate also reports `build=0`; fresh targeted build exited 0.
- Dependency output: `depcheck: 245 roadmaps, 2207 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Standalone elaboration of `TauCetiRoadmap/AsymptoticExpansions/Suggested.lean`: exit 0, exactly 39 `sorry` warnings, no other output; 52 unchanged signatures retain the previous binder and padding checks.

Overlap check: read the scope of SpecialFunctionsStruve, SpecialFunctionsGamma, SpecialFunctionsBessel, SpecialFunctionsConfluent, SpecialFunctionsGeneralizedHypergeometric, SpecialFunctionsAiry, SpecialFunctionsParabolicCylinder and SpecialFunctionsEiLiErfIncompleteGamma; general expansion, Laplace, Mellin and ODE methods belong to AsymptoticExpansions, their named-function applications to those consumers, and complex Stirling to ZerosOfLFunctions. The supplied overlap report lists no conflicting head or dropped citation.

Source independence: changed passages only; 0 changed roadmap passages, 0 sources newly compared, 0 changed locators. DLMF remains the principal source; the arrangement comparison was not reopened because no layer was added, removed or reordered.

## Not verifiable

- No new source-access question in this increment; the previous review's limitations for Olver and the other paywalled references remain.

## Source issues

- none

## For the human reviewers

- none
