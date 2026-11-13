# Review of KloostermanSheavesAndBesselIsocrystals (pull request #2289 at 08122a9)

**Verdict:** accepted

## Deferred findings

- D01 — stands.
- D02 — stands.

## Previous findings

- R01 — not repaired: deferred (D01). The scope now includes dense-open convergence detection at `TauCetiRoadmap/KloostermanSheavesAndBesselIsocrystals/README.md:96`; the four missing plan entries remain outside this review's repair scope.
- R02 — repaired: `TauCetiRoadmap/KloostermanSheavesAndBesselIsocrystals/README.md:722` cites §4.1.3, (4.1.3.1), and Lemma 4.1.4(i)–(ii); these exist at XZ lines 1816–1834.
- R03 — repaired: `TauCetiRoadmap/KloostermanSheavesAndBesselIsocrystals/README.md:687` qualifies BD §5.3 as over ℂ; lines 688–695 retain the general-field target and name its coefficient and geometry inputs.
- R04 — not repaired: deferred (D02). The supplied description now names the other authors and both previously omitted suppliers; the external generator finding remains on the board.

## Verified sound

| Statement | Instances tried | Left-side values | Right-side values | Result; change |
| --- | --- | --- | --- | --- |
| Scope, dense-open convergence (§3.4 contract) | Trivial connection and `d + dx` over ℚ₂; disc and tube of 𝔾_m | Normalized Taylor radii on disc: `1`, `1/2` | Radii on dense-open tube: `1`, `1/2` | Constant passes; exponential excluded; scope matches contract |
| §1.3 de Rham Satake | `G = 𝔾_m`, weights `1, −1`, over ℚ and ℚ₂ | `δ₁ ⋆ δ₋₁ = δ₀`; fibre dimension `1` | Characters `z·z⁻¹ = 1`; dimension `1` | Field clarification preserves tensor unit |
| §1.3 tensor and symmetry | `G = PGL₂`, minuscule object; dual standard representation | Tensor weights `−2, 0, 2` have multiplicities `1, 2, 1`; corrected flip eigenspaces `3, 1` | `Sym² ⊕ Λ²`: multiplicities `1, 2, 1`; flip eigenspaces `3, 1` | Sign correction retained over characteristic-zero fields |
| §1.3 added use of §1.2 | Constant object on 𝔸²; weights `(1, −1)`; de Rham coefficients | Repelling then fixed-locus restriction: `K[−2]`, dimension `1` | Attracting then fixed-locus restriction: `K[−2]`, dimension `1` | No Frobenius or Tate scalar needed |
| §1.4 clean datum (seeded target) | `SL₂`, generic character, chart origin | Exponential fibre `exp(0) = 1`; shifted fibre `K[2]` | Normalized fibre `K[2][−2] = K[0]`; dimension `1` | Corrected locator supports equivalence and normalization |
| §2.4 flat specialization in localization | `A = K[t]`, free module `A²`, `χ(t) = 0`; tensor unit | Derived fibre: `H⁰ = K²`, `Tor₁ = 0`; unit action rank `2` | Ordinary fibre: `K²`; tensor with unit rank `2·1 = 2` | Scalar-extension step valid; field qualification added |
| §2.4 flatness control | `A = K[t]`, module `A/(t)`, `χ(t) = 0` | Derived fibre: `H⁻¹ = K`, `H⁰ = K` | Ordinary fibre: `H⁻¹ = 0`, `H⁰ = K` | Nonflat example excluded by retained hypothesis |

The adversarial rows for untouched statements stand as in the previous review of `8199100`.

- Sources: 12 locators reopened across 5 sources: BD §5.3 (line 6178); XZ Proposition 3.1.2, Theorems 3.5.1/3.5.3, §4.1.3, Lemma 4.1.4, §4.2.7 (lines 1243, 1566, 1578, 1816, 1827, 2103); HNY Lemma 2.3/Definition 2.4 (lines 669, 698); Zhu Theorem 8/Corollary 9 (lines 377, 435); Miy proof of Theorem 4.1.3 (line 1294).
- Supplier citations implicated by the edits resolved in 6 roadmaps: GlobalShtukasAndFunctionFieldLanglands §§0.1, 1.1–1.2, 1.5, 1.8–1.9; SpringerResolutionAndCharacteristicCycles Layer 9; AffineLieAlgebras A7–A8; FormalConnectionsOpers F2/F4/F6; ReductiveGroups Layers 1/10; PadicDifferentialEquationsAndRigidCohomology §RD.6.42. The relative-geometry and rational-centre extensions remain explicit contracts.
- Pinned-library object searches: no matching Satake or critical-localization implementation found; 0 new Lean declarations or library citations introduced by the diff.
- Dependency output: `depcheck: 239 roadmaps, 2174 edges, 0 problem(s)`; 0 UPWARD/CYCLE lines.
- Gate: all checks zero, `OK`; targeted Lake build and direct `lake env lean` succeed, with exactly 5 `sorry` warnings each.
- Scratch `#check @name` probe: all 11 actual declarations elaborate; 0 lost binders. The two docstring-derived names in the worker's signature transcript are scanner artifacts. No Lean signature changed.
- Pull request text checked against the head and base: new folder, 0 removed headings/declarations, 0 newly added/dropped suppliers in this update, 0 outside-folder changes; no new prose discrepancy.

Overlap check: read GlobalShtukasAndFunctionFieldLanglandsPartII, PadicDifferentialEquationsAndRigidCohomology, GeometricSatakeAndFusion, MixedHodgeModulesAndIrregularHodgeTheory, PotentialAutomorphyDworkMotivesPartII and AffineLieAlgebras; scalar rigid Kloosterman objects belong to PadicDifferentialEquationsAndRigidCohomology, critical centres to AffineLieAlgebras, Witt/étale Satake to GeometricSatakeAndFusion; the de Rham/arithmetic Satake and localization extensions remain here. No new conflicting ownership in the changed passages.

Source independence: changed passages only; 4 passages compared with 5 sources, no copied expression or reused material found. Largest share remains XZ, 96 of approximately 190 source mentions (previous review's counting). No layer added, removed or reordered; the previous contents comparison stands.

## Not verifiable

- The previously recorded uncertified sources remain uncertified; no changed locator requires a new unavailable source.
- The characteristic-zero extensions in §§1.3 and 2.4 are roadmap targets, not theorems established over general fields by the cited complex-field passages.

## Source issues

- none

## For the human reviewers

- **Licence.** BD is an unpublished author-hosted preprint, cited in `TauCetiRoadmap/KloostermanSheavesAndBesselIsocrystals/README.md:687` and `TauCetiRoadmap/KloostermanSheavesAndBesselIsocrystals/README.md:934`.
- **Scope.** KloostermanMomentsAndPotentialAutomorphy and PadicDifferentialEquationsAndRigidCohomologyPartII remain board-package suppliers, absent from main and the supplied open-head index; their contracts are at `TauCetiRoadmap/KloostermanSheavesAndBesselIsocrystals/README.md:240` and `TauCetiRoadmap/KloostermanSheavesAndBesselIsocrystals/README.md:379`.
- **Scope.** The corrections to XZ in `TauCetiRoadmap/KloostermanSheavesAndBesselIsocrystals/README.md` §§3.3, 6.5, 7.6, 8.5, 9.4 and 11.1 remain; the previous review numerically confirmed two identities but did not establish the replacement of Lemma 4.2.6 in general.
