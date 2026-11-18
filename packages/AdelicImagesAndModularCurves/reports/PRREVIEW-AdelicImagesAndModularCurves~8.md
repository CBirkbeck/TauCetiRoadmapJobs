# Review of AdelicImagesAndModularCurves (pull request #1727 at 00b60e0)

**Verdict:** accepted

**Summary.** Accepted. This is an incremental re-review of the 14 lines changed since e4f956a: the supplier of Serre's modularity conjecture in its strong form (used in 3.4 to read the Serre invariants) is now SerreModularityByCompatibleSystems Layer S6 instead of ClassicalSerreModularity Layer R27.6, in all seven places. The new citation resolves, states what 3.4 uses, and is earlier in the merge order; the description already names the new supplier. No finding, no small correction, no format note; nothing is left for a human to decide.

## Previous findings

- none: the previous review, of e4f956a, was an acceptance with no finding.

## Verified sound

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 3.4, Serre invariants: by the strong form (SerreModularityByCompatibleSystems `S6/strong-form-of-serre-conjecture`), `(k(ρ̄), N(ρ̄))` is attained by a newform when `ρ̄_{E,ℓ}` is absolutely irreducible | `37.a1` at `ℓ = 3`; `11.a1` at `ℓ = 2`; `11.a1` at `ℓ = 5` | `37.a1`, `ℓ=3`: surjective, `ord₃₇Δ = 1`, good at 3, so `(k, M) = (2, 37)`, attained by `37.a`. `11.a1`, `ℓ=2`: image `S₃`, `ord₁₁Δ = 5`, `(2, 11)`, attained by `11.a`. `ℓ=5`: reducible, nothing claimed | agrees |
| Contract line (`README.md:467–470`): “an odd, absolutely irreducible `ρ̄ : G_ℚ → GL₂(𝔽̄_p)` arises from a newform of weight `k(ρ̄)` and level `N(ρ̄)`” | the supplier's target at its open head (README l.334–339), `p` odd, `p = 2` with `k = 2`, `p = 2` with `k = 4` | supplier: continuous, odd, absolutely irreducible; newform of weight `k(ρ̄) ≥ 2`, level `N(ρ̄)`; all three cases covered, no restriction on `p` | same statement |
| Seven citations changed consistently | `README.md:148, 467–468, 520, 1651, 1654, 1786` | each reads SerreModularityByCompatibleSystems (SMC) Layer S6; no mention of ClassicalSerreModularity, CSM or R27.6 remains in `README.md` or `Suggested.lean` | consistent |
| Description, ownership paragraph: “Serre's modularity conjecture in its strong form from SerreModularityByCompatibleSystems Layer S6” | head | `README.md:148`, `520` | agrees |

The rows for the roadmap's other statements stand as in the previous review, of e4f956a: no statement changed.

- Cross-roadmap citation resolved (1): SerreModularityByCompatibleSystems at its open head, a pull request adding a new roadmap folder: `## Layer S6: The strong form` (l.316), target `S6/strong-form-of-serre-conjecture` (l.334); its scope section (l.508) directs consumers of the strong form to that target.
- Merge order: SerreModularityByCompatibleSystems at line 266, this roadmap at line 389; the edge points downward.
- Dependency check: `depcheck: 205 roadmaps, 2227 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks, rerun at this head: every count `0`, `OK`.
- `lake env lean` on `TauCetiRoadmap/AdelicImagesAndModularCurves/Suggested.lean`: 25 `declaration uses 'sorry'` warnings, nothing else. The file did not change, so the signatures and the one-tactic probes stand as in the previous review.
- Nothing outside the folder changes: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AdelicImagesAndModularCurves'` is empty.
- Source sample: no seeded target falls in a changed passage (3.4 is not sampled; the change touches no source locator). The reference for the implication of 3.4 (Khare–Wintenberger 2009, `README.md:3359`) is unchanged.
- Pull request's text: title and description read against the head; no sentence is contradicted and no change is left unstated (the merge-order paragraph lists SerreModularityByCompatibleSystems; the generated `depends-on` block is outside this check).

Overlap check: read CanonicalModelsAndGonality, SatoTateGroups, NoncongruenceModularForms; nothing shared (as in the previous review; no dropped id, no second copy, no conflicting head; the change moves a citation and no ownership).

Source independence: changed passages only; 7 changed passages, all supplier citations with no prose taken from a source, compared with 0 sources, none shared; the arrangement was not compared again (no layer added, removed or reordered).

Research link: the headline targets are Serre's open image theorem (Serre 1972), Mazur's torsion and isogeny theorems (Mazur 1977) and the explicit adelic and `ℓ`-adic image classifications of Zywina 2022 and Rouse–Sutherland–Zureick-Brown 2022, the mathematics behind the LMFDB's Galois-image data; rests on the README's summary and its sources.

## Not verifiable

- Carried unchanged from the previous review: Fricke 1922; Prasad–Rajan 2003; Serre, *Abelian ℓ-adic representations*; Mitchell 1914; Bray–Holt–Roney-Dougal 2013; the further unfetched references listed there; `kubert1976` (waived); the LMFDB data of worked examples 5–9.
- “One of 23 roadmaps for the mathematics behind the LMFDB” (description): the count concerns other pull requests and was not checked.

## Source issues

- none

## For the human reviewers

- none
