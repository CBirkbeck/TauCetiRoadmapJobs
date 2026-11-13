# GATE-EllAdicHomotopyTypesAndWeights~2: answers to human review

One comment (mycaule, 2026-11-13T01:14:14Z) makes three points; they are numbered H01–H03 in order.
Line numbers refer to `TauCetiRoadmap/EllAdicHomotopyTypesAndWeights/README.md` after the repair
commit (the edits are inline, so no line moved), and to `TauCetiRoadmap/AlgebraicTopologyPartII/README.md`
at that pull request's head `ed88288`.

## H01 (mycaule) — applied

The point is correct. At `ed88288`, AlgebraicTopologyPartII Layer 4 is §§4.1–4.6 (its README lines 617–753), and no line of its README mentions Sullivan, A_PL, minimal models, polynomial forms or Hirsch extensions. This README therefore no longer places the five contracts in that layer. Line 11 "requested from AlgebraicTopologyPartII Layer 4" → "requested from AlgebraicTopologyPartII". Line 65 "the generic rational-homotopy extension of AlgebraicTopologyPartII Layer 4" → "the generic polynomial-form and Sullivan theory requested from AlgebraicTopologyPartII". The clause "For the Layer 4 rational-homotopy extension," is deleted at lines 71 and 75. "AlgebraicTopologyPartII Layer 4" → "AlgebraicTopologyPartII" at line 185 and in the eleven Needs/Dependencies lines 358, 374, 561, 592, 606, 664, 678, 717, 865, 887 and 1006. The five remain gap contracts, that is, requests for material the supplier does not yet plan, and their mathematical content is unchanged.

## H02 (mycaule) — answered

There is no rational-homotopy roadmap this README could cite. The terms Sullivan, A_PL, "Sullivan algebra" and "Hirsch extension" occur only in this roadmap: on main (7342e8f), in the 439 open roadmap pull requests at their heads, and in the 657 board packages. The contracts are now addressed to the roadmap rather than to one of its layers. If a separate roadmap is opened earlier in the merge order, re-addressing them changes only the supplier name, in the "From TauCetiRoadmap.AlgebraicTopologyPartII" heading, the five contract lines and the Needs lines. Opening such a roadmap is a decision outside this pull request. No target here uses Quillen's DG Lie models, so they are not part of this roadmap's requests.

## H03 (mycaule) — disputed

At `ed88288`, AlgebraicTopologyPartII §§4.4–4.6 do not use Sullivan theory:
- §4.4 is proved with the path-loop Serre spectral sequence and rational Hurewicz, with StableHomotopyKTheory §3.36 as input (its lines 707 and 714).
- §4.5 adds up the contributions of §§4.3–4.4 (lines 722 and 729).
- §4.6 is a special case of StableHomotopyKTheory §3.37 (lines 737 and 745).

The only consumer of the five contracts is this roadmap: Layers 0, 2, 4, 6 and 8 (lines 185, 358, 374, 561, 592, 606, 664, 678, 717, 865, 887, 1006).

## Repair outside the review points

Line 13 cited "MixedHodgeModulesAndIrregularHodgeTheory §§H.1/operations and H.1/weight-bounds", ids that roadmap's README does not define; it now cites "§§5.1–5.2". That roadmap is a board package (merge order line 263; this roadmap is at line 295). Its README `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md` has §5.1 "Derived Hodge-module operations" at line 480 and §5.2 "Weight bounds and duality" at line 497. Line 1116 of that README says that EllAdicHomotopyTypesAndWeights uses 5.1 and 5.2. The old ids appear only in that package's `design/plan.json`. The checker still reports "13: MixedHodgeModulesAndIrregularHodgeTheory §§5.1: no roadmap … on main or in an open pull request". That is a false positive: the checker does not read board packages.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| gap:sullivan-quasi-isomorphism-rigidity (scope clause deleted, content unchanged) | no generators; Λ(a₁) with a↦2a; the non-minimal Λ(u₁,v₂), du=v | id: K→K is bijective. a↦2a induces 2≠0 on H¹=K and is invertible as an algebra map. Λ(u,v), du=v → K: both sides have cohomology K in degree 0 and 0 elsewhere (quasi-isomorphism), but the source has v≠0 in degree 2 (not an isomorphism) | holds; minimality excludes the third case | none |
| gap:sullivan-scalar-extension (scope clause deleted, content unchanged) | K=ℚ→L=ℚ(√2): identity of Λ(a₁,b₁) with d=0 as a 1-minimal map; Λ(a₁)→Λ(a₁), a↦2a | dim_L H²(Λ(a,b)⊗L)=1=dim_ℚ H²; H¹ ranks 2=2; scalar 2 stays invertible in L | holds (L is flat over K) | none |
| line 65 "polynomial-form and Sullivan theory" | the five contract headings | 1 polynomial-form contract and 4 Sullivan contracts (minimal models, rigidity, homotopy lifting, scalar extension) | matches | sentence reworded |
| line 13 MixedHodge §§5.1–5.2 | §5.1 domain; §5.2 content | §5.1: D^b MHM(X) on smooth quasi-projective varieties and supported categories; §5.2: f_!, f^* preserve weights ≤w, f_*, f^! preserve weights ≥w | matches "treats quasi-projective varieties" | ids corrected |
| Needs lines "AlgebraicTopologyPartII through gap:…" | every slug named in the 11 lines | each slug is one of the 5 contracts at lines 67–75; none is missing or extra | consistent | "Layer 4" removed |

## Ownership, signatures, sources

- No owner of generic Sullivan theory exists on main, in the open roadmap pull requests, or in the board packages, so this roadmap keeps the contracts addressed to AlgebraicTopologyPartII. That roadmap is at merge order line 229, before this one at line 295.
- `Suggested.lean` declares nothing and was not changed. There was no declaration to check with `#check`, so the signature comparison is empty.
- No new source was cited or fetched, and no `needs-references.toml` was written.
- No passage in the review asks for anything outside this job.

## Build and gates

`lake build TauCetiRoadmap.EllAdicHomotopyTypesAndWeights.Suggested`: `Build completed successfully (18239 jobs).`

Gate after the commit `2e22a163` (exit 0):

```text
gate EllAdicHomotopyTypesAndWeights: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency check (`--movable`, `--pr 1644`), exit 0, full output:

```text
depcheck: 205 roadmaps, 1896 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.
