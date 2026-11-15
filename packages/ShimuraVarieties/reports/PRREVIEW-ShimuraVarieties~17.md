# Review of ShimuraVarieties (pull request #933 at 314489c)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since `314489c`; this round reads the pull request's title and description against the head. The folder's files are settled and the gate passes; the one finding is in the description.

## R01 (P3) — The description's list of suppliers on main is incomplete

**Location:** pull request description, the "Dependencies" paragraph: "SchemeAndStackFoundations, ReductiveGroups, ModularCurves, ClassFieldTheory and AlgebraicCurves are on main."

**Claim:** The sentence reads as the list of suppliers already on main, but the head consumes five more roadmaps on main; four of them are named nowhere in the description, so a reader cannot learn that they are suppliers.

**Witness:** `TauCetiRoadmap/ShimuraVarieties/README.md` line 83 (ReductiveGroupsPartII, Layer RG2.0a), line 2006 (SmoothRepresentationsOfLocalGroups §SR.`3a`.1), line 153 (RepresentationTheory/LieGroups), line 15 (Completed/RestrictedProducts), lines 75 and 77 (AdelicAlgebraicGroups, Layers 3–4). All five folders are on main.

**Repair:** Replace the sentence with: "AdelicAlgebraicGroups, SchemeAndStackFoundations, ReductiveGroups, ReductiveGroupsPartII, ModularCurves, ClassFieldTheory, AlgebraicCurves, SmoothRepresentationsOfLocalGroups, RepresentationTheory (LieGroups) and the completed RestrictedProducts are on main."

## Previous findings

- The previous report (`PRREVIEW-ShimuraVarieties~16`, accepted at `314489c`) carried no finding; there is nothing to account for.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Description: "The GL₂ instances are identified with full, Γ₁ and Γ₀ modular curves over ℚ" against §§8.10, 8.14, 8.15 | `K(3)`, `K₁(4)`, `K₀(1)`; `N=3` for `Γ₁` | `det K(3)=1+3ℤ̂`, so `π₀=(ℤ/3)×`, 2 geometric components, one connected `ℚ`-scheme, degree `48/2=24` over `Y(1)`; `det K₁=det K₀=ℤ̂×`, 1 component; `K₀(1)`: `SL₂(ℤ)∖H`, the `j`-line; `Γ₁(3)` has an order-3 elliptic point, so fine only for `N≥4` | description and README agree | — |

The rows of the previous review, of `314489c`, stand for every untouched statement; the diff changes none.

- **Description against the head, sentence by sentence.** Title equals the README's `# Roadmap:` heading. `CanonicalTower.general_data` and `CanonicalModel.general_minimal` are §§8.22 and 8.23 (README lines 2870, 2891). SV1–SV3: line 21 and §P.1. Conditional uniqueness, translation descent and disjoint reflex fields first: "How to read the build" and §§4.10–4.12. Non-neat levels and normalization of coarse Hecke fibre products: §P.4 line 219, §1.5 line 459, §8.3. Adelic carriers, manifold gluing, base change: lines 15, 49, 53–55. The nine consumers named match "Downstream consumers". Folder contents (README, `Suggested.lean`, `metadata.toml`) and "the Lean imports none of them" (`import Mathlib` plus one Tau Ceti module) hold. The five roadmaps the description says are on main are on main. The text presents the roadmap as new, which it is (not on `origin/main`; 3449 insertions, 0 deletions).
- **Gate.** My run on `314489c`: every counter 0, `OK`; the worker's run on the same head adds `build=0`.
- **Dependency check.** `depcheck: 247 roadmaps, 2245 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with 27 warnings, all `declaration uses sorry`. The worker's signature file reports 0 of 39 declarations with a lost binder; file and pins are unchanged since the round that compared them with `#check @`.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ShimuraVarieties'` is empty.
- **Cross-roadmap citations resolved this round:** 10 on main at `8ad4192` (the five the description names and the five of R01), each folder present; ReductiveGroupsPartII RG2.0a, SmoothRepresentationsOfLocalGroups SR.3a and AlgebraicCurves Layer 12 found at the cited ids.
- **Overlaps.** No other open pull request changes this roadmap, no cited id is dropped, none is defined only by an open revision. LogicAndDefinabilityInNumberTheory is new among the closest roadmaps: its lines 10, 25, 106 and 1509–1534 cite ShimuraVarieties §§3.4b–3.4e and §3.5a as owner and construct neither again.
- Overlap check: read LogicAndDefinabilityInNumberTheory, ShimuraData, ShimuraCompactifications; o-minimal structures and `R_an,exp` (shared with the first), pure data and §§P.1–P.5 (the second), Baily–Borel and canonical models (the third) are each owned by ShimuraVarieties and cited by the other.
- Source independence: changed passages only; 0 passages compared, because the folder did not change; arrangement not compared again (no layer added, removed or reordered).
- Remark (generated blocks, outside this check, no change asked): the `depends-on` block ticks AdelicAlgebraicGroups as merged, consistent with R01's repair.

## Not verifiable

- **This round's seeded sample** (1.3, 2.3, 3.5b, 3.5b.1, 4.7, 4.9b, 4.11, 5.10, 5.13, 7.5, 7.7, 8.3, 8.15, 8.19, 8.21): falls in no changed passage, so it was not re-read against the sources; 8.15 was checked only for the values in the table.
- **The description's "AI assistance" sentence** (which models ran which author-side passes): a statement about the pull request's history, not checkable against the head.
- **Margulis 1977 and 1991, van den Dries 1998, and the settled `uncertified` sources** (van den Dries–Miller 1994, Clozel 1986, Platonov–Rapinchuk 1994): unchanged from the previous review.

## Source issues

- none

## For the human reviewers

- none
