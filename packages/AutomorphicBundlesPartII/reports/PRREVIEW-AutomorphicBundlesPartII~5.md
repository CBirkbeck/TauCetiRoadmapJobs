# Review of AutomorphicBundlesPartII (pull request #1823 at 40ebb0a)

**Verdict:** accepted

Incremental re-review of 8 changed lines since 3330afd, with the pull request's title and description read against this head. No finding.

## Previous findings

- R01 — repaired: `Suggested.lean` line 73 "theorem nonempty_finiteCoefficientSerreDuality"; README §1.6 line 323 "The headline `nonempty_finiteCoefficientSerreDuality` applies to a smooth proper scheme X over Aₙ"; gate `statement-hygiene=0`. Statement unchanged.
- R02 — repaired: description "the module docstring lists the fourteen other headlines and the carriers each lacks at the pins"; `Suggested.lean` lines 19–32 have 14 bullets.
- R03 — repaired: description "extends Tau Ceti's Serre duality for curves over a field to every dimension, and SchemeAndStackFoundations §2.20's Cohen–Macaulay duality over a field to Artinian DVR quotients"; README line 13 now scopes the specialization to smooth schemes and locally free coefficients.
- R04 — repaired: description "Siegel threefolds and of the Hilbert–Siegel varieties for Res_(F/ℚ)GSp₄ over a totally real field F, of dimension 3[F:ℚ]"; agrees with README §5.0.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.6 / `nonempty_finiteCoefficientSerreDuality` (renamed) | O=𝔽₃[[t]], ϖ=t, n=1, X=ℙ²_k, d=2, F=O(−3), i=−1,0,1,2,3 | Hom(F,Λ²Ω)=O. i=0: Dual(H⁰(O))=k, H²(O(−3))=k. i=1: 0, 0. i=2: Dual(H²(O))=0, H⁰(O(−3))=0. i=3: H³=0, degree −1 zero. i=−1: 0, H³(O(−3))=0 | true |
| same | O=ℤ₃, n=2, A=ℤ/9, X an elliptic curve over A, F=O, i=0; n=0 | Dual(H⁰(Ω))=Dual(A)=A, H¹(O)=A; n=0: zero ring, both sides 0 | true |
| README line 13, "over a field it contains the cases … in which the scheme is smooth and the coefficient sheaf is locally free" | n=1 (A₁=k); smooth proper curve, g=1, F=O(D), deg D=0; a regular non-smooth curve over imperfect k; a nodal cubic | §1.6 at i=0: Dual(H⁰(Ω(−D)))≃H¹(O(D)), dimensions 1,1 (D=0) and 0,0 (D≠0), as the curve statement gives. The two non-smooth schemes satisfy the supplier statements' hypotheses but not §1.6's | true; the restriction to smooth cases is needed and stated |
| Docstring locator "CG18 §7.2, pp. 395–396, 398–400" (changed from 399–400) | printed p. 398 | CG18 lines 4098–4101 (p. 398): duality of H^i of F_A with H^(d−i) of Hom(F,ω)_A over A=O/ϖⁿ; pairing on pp. 399–400 (lines 4105–4143) | locator right; agrees with README line 325 |

Rows for every other statement stand as in the previous review, of `3330afd`.

- Gate, run by this review on 40ebb0a: every counter 0, `OK` (`statement-hygiene=0`, `readme-ids-missing=0`, `outside-folder=0`, `stray-files=0`); the worker's run adds `build=0`.
- Dependency check: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration at the pins of this head (they moved with the merge of main): `lake env lean` on `Suggested.lean` gives one diagnostic, `declaration uses sorry` at line 73. The three elaborated signatures were compared with README §1.6; no binder lost, and the theorem's type is that of the previous head under the new name.
- Library declarations opened at the pin: `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/SerreDuality.lean` line 122 (`SchemeWeilDivisor.cohomologyOneDualEquivCohomologyZero`, an integral separated curve with DVR stalks, k integrally closed in the function field; no smoothness assumed); `TauCeti/AlgebraicGeometry/Modules/Differentials/Canonical.lean` line 248 (curves and invertible sheaves only, so no duplicate of §1.6).
- Cross-roadmap citation resolved: SchemeAndStackFoundations §2.20 on main, README lines 5456–5459 (`cm_serre_duality`: proper Cohen–Macaulay over a field, locally free form with ω_X). `roadmaps resolve` lists none missing.
- Description against the head, further sentences checked and right: the roadmap is added (not on main; 1723 insertions, 3 files, 3 Lean declarations); GSp4NonregularModularityLifting uses every layer (README line 1613); the summary block's and the prose's name of the Lean headline; validation counts (gate above); 5 package review rounds and 2 red-team rounds (the board's reports). Files outside the folder: none changed against the base.
- Overlap check: read HigherHidaAndColemanTheory, PadicFamiliesPartII, GSp4NonregularModularityLifting (open) and SmoothRepresentationsOfLocalGroups (main); nothing shared. The overlap list reports no dropped id, no second copy and no other pull request changing this folder.
- Source independence: changed passages only; 2 passages compared with 1 source (README line 13 and the `Suggested.lean` docstring against CG18 pp. 395–400), none shared; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- GK19 Remark 10.1.3, p. 962 (§7.1): settled as uncertified in the manifest; cited by locator only.
- The seeded sample (§§2.1, 3.2, 3.5, 3.6, 3.11, 5.6, 5.11, 5.13, 5.14, 6.3, 6.7, 6.8, 6.9, 8.6, 8.8) falls in no changed passage and was not reread this round.
- The generated blocks of the description (`depends-on`, `merge-order`) are outside the check of the text.

## Source issues

- none

## For the human reviewers

- none
