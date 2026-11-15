# Review of PadicLocalLanglandsForGL2Qp (pull request #1312 at 84416ad)

**Verdict:** needs changes

## R01 (P3) — The description's AI-assistance sentence predates the red-team and review repairs

**Location** Pull-request description, Validation paragraph: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, with author-side red-team passes to follow."

**Claim** The head contradicts this sentence. The red-team passes it says are still to come are already on the branch, and the disclosure leaves out the second AI co-author.

**Witness** `git log origin/main..84416ad -- TauCetiRoadmap/PadicLocalLanglandsForGL2Qp` lists 19 "red-team repairs" commits (8968a7fc, 2026-10-20, through 92e93dd2, 2026-10-26) and 3 "review repairs" commits. Commit 92e93dd2 has the trailer `Co-Authored-By: Claude Opus 5.5`.

**Repair** Replace the sentence with: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package and the `Suggested.lean` statements, and Claude Opus 5.5 for one red-team repair. This branch already contains the author-side red-team and review repair passes."

## Previous findings

- none: the review of `84416ad` reported no findings.

## Verified sound

| Statement (as cited by the description) | Instances tried | Computed values | Other side / rejected model | Result |
| --- | --- | --- | --- | --- |
| "At p = 2, degree-two determinant laws replace traces": Conventions; §5.4, README:1787 | g=I₂ over 𝔽₂; g=diag(2,3) over ℚ | 𝔽₂: T=0, T(g²)=0, so the trace formula for det is 0/2, but det=1. ℚ: (25−13)/2=6 | det diag(2,3)=6. Cayley–Hamilton over 𝔽₂: I−0·I+I=2I=0 | Agrees with §5.4 (determinant kept at p=2) |
| "Mathlib's Amice transform … imported": README:73; Mathlib `NumberTheory/Padics/Measure/AmiceTransform.lean:76` | Dirac at a=0,1,2,3 | Coefficients μ(mahler n)=C(a,n): (1), (1,1), (1,2,1), (1,3,3,1) | (1+T)^a. The model with coefficients aⁿ gives 1+2T+4T² at a=2 | Native at the pin; supplier contract consistent |
| "Mathlib's … algebraic cycles": §0.5, README:322; Mathlib `AlgebraicGeometry/AlgebraicCycle/Basic.lean:44` | k[[x,y]]/(xy); O/ϖ³ | Coefficients (1,1) at the two minimal primes; 3 at the closed point | The two branches have equal multiplicity but are unequal cycles. The residue-tensor model gives 1, not 3 | Native `locallyFinsupp` carrier has no dimension grading; §0.5 adds it |
| Hilbert–Samuel foundation: `exists_hilbertSamuel_polynomial`, Suggested.lean:107 | O with I=(ϖ), M=O/ϖ³ and M=O; field k with I=0, M=k² | Lengths 1,2,3,3,…; n+1; 2,2,… | P=3, X+1, 2. Every length is finite, so `toNat` is faithful | Pass; signature unchanged |
| GL₂ finite length, Suggested.lean:146 ("statable at the pins") | St over k, p=2,3; c-Ind_{KZ}^G 1 | St: O[G]-length 1, k-dimension ∞. c-Ind: K-invariants spanned by f_n, n≥0, so infinite-dimensional | St meets every hypothesis and has finite length; c-Ind fails `IsAdmissible` at n=0 | Pass |
| "The correspondence at every prime": Conventions, §§3.7–3.8 | Rank two, det D=d; d=χ | det D∨(1)=χ²/d; δ_D=χ⁻¹d=1 when d=χ | det(D⊗δ_D⁻¹)=d·δ_D⁻²=χ²/d | Consistent |
| "Results that need global data stay explicit hypotheses": §6.3 | M∞ of generic rank 0,1,2 on a component C | Cycles 0, [C], 2[C] | Ring cycle [C]; equality only at rank 1 | Arithmetic-action data stay a hypothesis |
| "Analytic criteria for the Breuil–Strauch comparison": §6.9, README:2313 | (m,d)=(1,1),(1,2),(2,2) | Sign (−1)^(n−m): +1, −1, +1 | St₂ ↦ trivial character of D×: −1=(−1)·1 | Consistent |

The rows for untouched statements stand as in the previous review, of `84416ad`. That includes all 15 seeded targets of this round (§§0.4, 0.5, 1.1, 2.3, 3.10, 4.2a, 4.3, 4.11, 5.4, 5.10, 5.11, 5.13, 6.1, 6.3, 6.10).

- **Change and gate.** The folder changed by 0 lines since `84416ad`, and nothing outside the folder changed against `origin/main`. My rerun of the gate on this head passed with every scanner at 0. The worker's gate, including the build, also passed. The dependency check printed `depcheck: 245 roadmaps, 2215 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/Suggested.lean` gives only the two `sorry` warnings, at lines 107 and 146. A scratch copy with `#check @` for all 4 declarations gives the same types as the previous review, with no lost binder.
- **Description against the head.** I checked the title, the 12 claims of the summary block and the 5 prose sentences; R01 is the only contradiction. The pinned declarations behind them are Mathlib `AmiceTransform.lean:76`, `Measure/Monoid.lean:98` (`dirac_mul_dirac`) and `AlgebraicCycle/Basic.lean:44`.
- **Suppliers in the description.** The suppliers the README names that are not on main are IntegralHeckeAndGaloisDeterminants, NoncommutativeAndEquivariantIwasawa, PadicPeriodRings and PhiGammaModulesAndIwasawaCohomology. These are exactly the open entries of the depends-on block. LocalFieldsRamification, LocalGaloisGroups and ProfiniteProPGroups are under `Completed/` on main; the open pull request for LocalFieldsRamification only revises it.
- **Consumers in the description.** The claim that other roadmaps import these foundations was checked at their heads:
  - LocallyAnalyticDistributions README:177–181;
  - ArithmeticGaloisDuality README:488;
  - FiniteFlatGroupsAndIntegralPadicHodgeTheory README:138;
  - LocalGaloisDeformationRings, Scope and ownership;
  - ClassicalSerreModularity README:69;
  - PadicLocalLanglandsForGL2QpPartII is in the merge order (line 390) and has a board package.
- **Resolver lead.** The one unresolved name, `SmoothTorsion.finiteLength_of_finitelyGenerated_admissible` at README:701, is declared at Suggested.lean:146.
- Overlap check: read CompletedCohomologyAndLocalGlobalCompatibility, LocalGaloisDeformationRings, ModpRepresentationsOfGL2OverLocalFields and FiniteFlatGroupsAndIntegralPadicHodgeTheory (open), and SmoothRepresentationsOfLocalGroups (main). Owners of the shared objects:
  - GL₂(ℚ_p) blocks, envelopes, the Montreal functor and the correspondence: this roadmap, which the first one's ownership table cites.
  - Framed and type deformation rings: this roadmap's §0.4, which LocalGaloisDeformationRings imports.
  - The ℚ_p mod-p classification: this roadmap's §2.7. ModpRepresentationsOfGL2OverLocalFields comes later in the merge order (line 268), cites it, and declares two gaps on this roadmap.
  - Filtered (φ,N)-modules: §0.2, which FiniteFlatGroupsAndIntegralPadicHodgeTheory imports.
  - Smooth and compact induction and the classical GLₙ correspondence: SmoothRepresentationsOfLocalGroups SR.0, SR.2 and SR.5.2, which this roadmap cites.
- Source independence: changed passages only. The folder changed by 0 lines, so 0 passages were compared with 0 sources. Largest share: COLMEZ10, 32 of 156 linked reference locators. Contents were not compared again, since no layer was added, removed or reordered.

## Not verifiable

- none: no changed passage needed a source. The seeded targets lie in unchanged text and stand as verified in the previous review.

## Source issues

- none

## For the human reviewers

- none
