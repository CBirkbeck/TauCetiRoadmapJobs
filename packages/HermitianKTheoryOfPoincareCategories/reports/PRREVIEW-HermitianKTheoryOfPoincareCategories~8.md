# Review of HermitianKTheoryOfPoincareCategories (pull request #1266 at 8d4143b)

**Verdict:** accepted

## Previous findings

- R01 — repaired: The description's `roadmap-summary` now distinguishes unrestricted quadratic surgery and classical GW fibre sequences from symmetric surgery, explicitly requiring coherence and finite global dimension, or a bounded t-structure and finite duality bound.
- R02 — repaired: The description explicitly calls this a new roadmap and says `Suggested.lean` has an empty namespace and no declarations. Its revised validation sentence correctly records the targeted build's module-system warning and absence of sorry warnings.

## Verified sound

| Statement | Instances tried | Computed values on both sides | Result / change |
|---|---|---|---|
| Corrected summary; §§6.4–6.5 symmetric surgery | R=𝔽₂, Q=Qgs; (n,d,r,a,b)=(2,0,2,0,0) | k=−2; obstruction bounds −2,−4<0; object/Lagrangian/fibre connectivity −1,−1,−2 from both §6.4 and paper-iii Proposition 1.3.1. | Corrected hypotheses and bounds agree. |
| Corrected summary's finite global dimension restriction | R=𝔽₂[ε]/ε², k=R/(ε) | ker(ε)=im(ε)=𝔽₂ε; applying Hom(−,k) gives zero differentials, hence Extⁱ(k,k)=𝔽₂ for every i≥0; no finite bound d. | Excluded by the corrected symmetric-surgery hypothesis. |
| Corrected description of Suggested.lean | File contents; targeted build; direct elaboration | Description: 0 declarations and 0 sorry warnings. File: 0 declarations, 0 sorry terms; build: module warning; direct elaboration: 0 warnings. | Matches this head. |

Rows for untouched statements stand as in the previous review of `db6600d`.

- 0 folder lines changed since `db6600d`; 3 new files, 1,385 inserted lines against the merge base; 0 PR-owned outside-folder changes.
- 2 previous findings repaired; title and all quoted description prose checked against the head; no missing removal, renumbering or supplier change.
- 5 supporting source locators re-read: paper-iii lines 70, 168, 732, 1250 and 1265; no seeded mathematical target changed.
- 3 pinned declarations opened: `TauCeti/RepresentationTheory/Homological/TateCohomology/Periodic.lean:167,200` and `TauCeti/LinearAlgebra/QuadraticForm/Witt/Ring.lean:218`; 0 local declarations require binder or one-tactic probes.
- 7 supplier roadmaps and the named downstream Segal comparison re-opened; citation resolver reports 0 cross-roadmap misses; overlap data reports 0 conflicts or dropped cited ids.
- Gate: all counters zero, `OK`; worker's gate additionally records `build=0`; targeted Lake build and direct elaboration exit 0.
- Dependency output: `depcheck: 245 roadmaps, 2212 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Untouched-citation remark retained: `TauCetiRoadmap/HermitianKTheoryOfPoincareCategories/README.md:71` names `HasFiniteGlobalDimension`; StablePeriodicCurved Layer 4 states the bound in prose without that identifier.

Overlap check: read GeometryOfNumbersAndQuadraticArithmetic, GeometryOfNumbersAndQuadraticArithmeticPartII, KTheoryFiniteLocalFields, GeneralAlgebraicKTheoryPartII, RefinedTraceMethods, StableHomotopyKTheory and EnhancedDerivedSheaves; Poincaré foundations/exact Witt groups belong to GeometryOfNumbersAndQuadraticArithmetic, enhanced categories to EnhancedDerivedSheaves, ordinary K-theory foundations to StableHomotopyKTheory/GeneralAlgebraicKTheory, stable-category K-theory to RefinedTraceMethods, and bounded surgery/comparisons here; the arithmetic successors consume them.

Source independence: changed passages only; 2 corrected scope sentences compared with 1 source, paper-iii, with no copied expression or reused artifacts identified. The folder has 0 changed passages; its largest source share remains paper-iii, 95 of 152 explicitly named references as counted at `db6600d`. Contents comparison stands from that review: no layer added, removed or reordered.

## Not verifiable

- Paper IV's spectrum-level multiplicative refinement remains uncertified; §§7.10–7.11 retain Paper III's attribution rather than an accessible text of Paper IV.

## Source issues

- **Misprint** in paper-iii at proof of Corollary 1.2.12, printed p.18, line 829: the source says the final injectivity range is n≤2n−3; it should be n≤2m−3; affects the proof.
- **Misprint** in paper-iii at Proposition 1.3.1, printed p.27, lines 1254–1255: the source says the objects belong to the perfect category of R although no R is specified; it should be the given category C; affects a stated result.

## For the human reviewers

- Paper IV is cited without an accessible manuscript in `TauCetiRoadmap/HermitianKTheoryOfPoincareCategories/README.md:1335`; the multiplicative spectrum claims in §§7.10–7.11 retain only Paper III's attribution as source evidence.

