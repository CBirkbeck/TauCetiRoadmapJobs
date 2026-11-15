# Review of NeronModelsAndSemistableAbelianVarietiesPartII (pull request #870 at 9027cc3)

**Verdict:** needs changes

Incremental re-review of the 28 README lines changed since fec9eae, and the first check of the pull request's title and description against the head. One P3 finding, in the description; the folder itself has none.

## R01 (P3) — The description names three main roadmaps the README does not cite, and points to a consumer list that is not there

**Location:** pull request description, the paragraph after the folder line: "Roadmaps already on main that the README cites (SchemeAndStackFoundations, PadicMeasuresIwasawaAlgebras, AdicSpacesPartII, RigidAnalyticGeometry and the older roadmaps) … consumers of this roadmap are listed in the merge-order block, not here."

**Claim:** The README cites PadicMeasuresIwasawaAlgebras, AdicSpacesPartII and RigidAnalyticGeometry, and the merge-order block lists this roadmap's consumers.

**Witness:** `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarietiesPartII/README.md` contains none of the three names (0 matches each; SchemeAndStackFoundations 94). The merge-order block ends at "**this pull request** (#870)" and names no consumer.

**Repair:** Replace the sentence by: "Roadmaps already on main that the README cites (StableReduction, SchemeAndStackFoundations, EllipticCurves, ReductiveGroupsPartII, JacobianChallenge, EtaleCohomologyFoundations, AlgebraicCurves, IntegralLattices, ModularCurves, ZigzagPreprojective) are consumed from main and are not prerequisites." The ten names are exactly the main roadmaps the README names; drop the clause about consumers.

## Previous findings

- R01 — repaired: §5.1, §3.1, §4.13, §2.27 and §1.5 each have three Checks now (`README.md:525–529`, `4829–4833`, `8515–8518`, `9252–9257`, `9490–9496`); every added value recomputed below, no new problem.
- R02 — repaired: Layer 6 is numbered 6.1, 6.2, 6.3 (`README.md:9814`, `9893`, `9912`); Downstream consumers reads "§§6.2–6.3" (`README.md:10224`); no "6.16" or "6.17" section reference remains in the file.

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §1.5 new Checks and `ferrand_scheme_pushout_exists` | Z=∅; Z=Y with i=id | Z=∅: hypothesis holds with U=⊥; P=Y⊔Z′, Y→P open-closed hence finite, Y×_P Z′=∅. i=id: pushout is Z′, a=g finite, b=id closed, Y∖Z=∅=P∖Z′ | Pass |
| §2.27 new Checks | k=F₂(a), E=k(√a), point x²=a of P¹; Y=A¹ | E⊗k̄=k̄[ε], pinch of P¹ along a length-two point to Spec k̄: cusp, p_a=1; A¹ affine so pinch is affine; A¹→C finite surjective, C proper would force A¹ proper | Pass |
| §3.1 new Checks | m=1; m=2; local ring with π=u·vᵐ, D: w=0 | R′=O/(w), uniformizer v: R′/πR′=R′/(vᵐ), length 1 then 2; R′/(v)=k both times; rank of R′ over R is m, so D is a section only for m=1 | Pass |
| §4.13 new Checks | I₂; I₁; E×P¹ | deg O(3O) on the I₂ components (3,0); contracted curve has self-intersection −2, giving A₁ on a nodal cubic; I₁: (3), no contraction; E×P¹: all fibres irreducible, degree 3 very ample fibrewise | Pass (E×P¹ lies outside the section's rationality hypothesis, as the Check says) |
| §5.1 new Checks | models 4 and 13 of §6.1; E₁, II, split I₁, nonsplit I₁ at q=2 | III*: r=8, 2r+1=17; I₃*: r=8, 17; 17+2+6=25, 17+4+4=25; with 2r: 23, 23; values 1, q+1=3, q=2, q+2=4; 2·1+1=3≠1 for E₁ | Pass; table rows 4 and 13 (`README.md:9868`, `9877`) agree |
| §6.2, §6.3 (renumbered) | references in the README and in other roadmaps | headings 6.1, 6.2, 6.3; one internal reference, updated; `roadmaps grep` finds no citation of §6.16 or §6.17 of this roadmap on main or at any open head | Pass |

The rows of the previous review, of fec9eae, stand for every untouched statement.

- Source locators checked against the text: 2. Sample target 3.1: schroer lines 974–991 (Proposition 8.1 and proof, printed p. 22; the setup starts on p. 21) give the multiplicity m, the rational point, the extension by EGA IV₄ 18.5.11, D=Spec R′ regular with residue degree one. Sample target 2.10, cited by the new §5.1 Check: schroer lines 468–473 (Proposition 3.2, p. 11) give rq, q+2, 2q+2, rq+1. The other thirteen sample targets fall outside the changed passages.
- Gate: the worker's run at 9027cc3 passes every text and dependency check and fails only `build` (exit 1), on a missing object file for `TauCeti.LinearAlgebra.RootSystem.AffineDynkinType.Basic` in the worker's package cache. My re-run of the gate command reports OK on all text and dependency checks.
- Elaboration: the module's source exists at the Tau Ceti pin of main and its four imports are built; a scratch copy compiles without error or warning. With that object on the search path, `Suggested.lean` elaborates at main's pins with exit 0 and exactly five `declaration uses sorry` warnings. The file is byte-identical to the one reviewed at fec9eae. The build failure is in the cache, not in the pull request; it is not counted as a finding.
- Signatures: `#check @name` for all six declarations, elaborated the same way; every binder of the previous review's record is present (`[Field k] [Finite k]`, `Smooth`, `IsProper`, `GeometricallyConnected` or `GeometricallyIntegral`, the explicit `FiniteDimensional` instance, `topologicalKrullDim X = 1`, `genus = 1`, the gcd-one positive null vector). No change.
- Dependency check: `depcheck: 245 roadmaps, 2216 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Changes outside the roadmap folder against `origin/main`: none. Since fec9eae only `README.md` changed (25 insertions, 3 deletions).
- Pull request text, the rest: the title, the summary block (fourteen models, eleven nonzero-j and three zero-j, `README.md:10171–10176`; the family's hypotheses, `README.md:10084–10086`; pinching in algebraic spaces and the scheme criterion, §§1.9–1.11; Mathlib's monogenic `conductor R x`, `README.md:102–104`, `358`; the Enriques consumers, `README.md:10211–10212`), the continuation sentence and the folder line (three files, six Lean declarations) agree with the head. The four suppliers in the dependency list are the four open roadmaps the README names.
- Remark on untouched text: StableReductionPartII (#1841), in its Scope, attributes the genus-one canonical formula and Hodge-line degree to K3SurfacesAndSymplecticBoundedness §6.0b; that roadmap's head now consumes them from §§4.1–4.2 here, so the stale attribution is in #1841, not in this folder.

Overlap check: read EnriquesSurfacesAndIntegralNonexistence, FunctionFieldArithmeticPartII, StableReductionPartII, RelativeJacobiansAndIntegralCurveModels, AlgebraicModuliForArithmeticGeometryPartII (Scope sections at their heads), SchemeAndStackFoundations, ModularCurves, StableReduction (as cited); the change adds no object; genus-one fibration theory (§§2.1, 2.5, 4.1–4.2, 4.7–4.8, 4.17): owner this roadmap, consumed by section by EnriquesSurfacesAndIntegralNonexistence, K3SurfacesAndSymplecticBoundedness and WeilConjectures.

Source independence: changed passages only; 6 passages compared with 1 source (schroer), none shared; largest share schroer, as in the review of fec9eae; contents not compared again, the change adds, removes and reorders no layer.

## Not verifiable

- Elaboration at the branch's own manifest pins: the package cache for those pins is not on this worker, so the file was elaborated at main's pins only.
- Ferrand §§4.1, 5.1, 5.4, 7.1 for §1.5: not re-read this round; the two added Checks are the trivial cases Z=∅ and i=id, computed directly.

## Source issues

- none

## For the human reviewers

- **Not tested.** The worker's gate records `build` as failed at 9027cc3: the object file of one pinned Tau Ceti module is absent from the worker's cache. `Suggested.lean` elaborates once it is built; the cache needs that module built before the next gate run.
