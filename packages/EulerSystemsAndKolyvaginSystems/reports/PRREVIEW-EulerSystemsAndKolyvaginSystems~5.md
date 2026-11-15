# Review of EulerSystemsAndKolyvaginSystems (pull request #1272 at a0e5702)

**Verdict:** needs changes

Incremental re-review of 6 changed lines since ccd7e7a. The folder's change is correct and the gate passes; the one finding is a sentence of the pull request's description. It asks for no change to the roadmap files.

## R01 (P3) — Description's list of cited roadmaps on main omits GlobalNumberFields

**Location:** pull-request description, Dependencies paragraph: "The roadmaps on main that it cites by name and section are Chebotarev, ProfiniteCohomology, ClassFieldTheory, ImaginaryQuadraticClassNumber, EllipticCurves, PadicMeasuresIwasawaAlgebras, ClassicalArithmeticCompletion and DerivedModuleAlgebra."

**Claim:** The list is stated as complete, and the head cites a ninth roadmap on main by name and layer: GlobalNumberFields.

**Witness:** `TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/README.md:1815` "Proof inputs are GlobalNumberFields Layer 2 for the ray class residue-unit exact sequence"; `:2559` "The ray-degree step consumes GlobalNumberFields Layer 2"; `Completed/GlobalNumberFields/README.md:279` is that layer.

**Repair:** Replace the sentence with:

> The roadmaps on main that it cites by name and section are Chebotarev, GlobalNumberFields, ProfiniteCohomology, ClassFieldTheory, ImaginaryQuadraticClassNumber, EllipticCurves, PadicMeasuresIwasawaAlgebras, ClassicalArithmeticCompletion and DerivedModuleAlgebra.

## Previous findings

- R01 — repaired: the description now says "`Suggested.lean` imports Mathlib and two Tau Ceti modules … It states, each with `sorry`, the two §4.2a headline theorems"; "its warnings are the `sorry`s of the two stated theorems".
- R02 — partly repaired: the description now lists the four suppliers not on main, by section (IntegralIwasawaTheory, ArithmeticGaloisRepresentations, SelmerIwasawaCohomology, ArithmeticGaloisDuality); its new list of roadmaps on main omits GlobalNumberFields (R01 above).

## Verified sound

The diff changes no statement; the rows are the library declaration the changed text renames and one Lean statement the changed line `README.md:73` cites.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `IsSemisimpleRing.finiteWedderburnAlgebraPresentation` as cited at `README.md:15`, `:93` | pinned declaration; `A = K = ℚ`; `A = 0`; `A = M₂(ℚ) × ℚ(i)` | at the pin: namespace `IsSemisimpleRing` (not `TauCeti`), needs `[IsSemisimpleRing A] [Module.Finite K A]`; blocks 1 (`D=ℚ`, degree 1); 0 blocks, empty product = 0; 2 blocks, degrees 2, 1 | the renamed citation and its one-clause description match the pin | none |
| `compactIrreducible_h1_vanish` (`Suggested.lean:102`, cited at `README.md:73`) | `G = 1`, `V = Φ`; `G = C₂` by `−1` on `ℚ₂`; control `G = ℤ_p` acting trivially on `Φ` | `H¹ = 0`; `ker(1+σ)/im(1−σ) = V/2V = 0`; control `H¹ = Hom_cont(ℤ_p, Φ) = Φ ≠ 0`, action not faithful | holds; `FaithfulSMul` excludes the control | none |

The rows for all other statements stand as in the previous review, of `ccd7e7a`.

- Changed passages (3 lines of `README.md`): the pinned revisions at `:73` equal `lake-manifest.json` (Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…`) and the checked-out packages; no other occurrence of the old revisions or the old declaration name remains in the folder.
- Library declarations opened at the pin: `TauCeti/RingTheory/Semisimple/Wedderburn/Presentation.lean:280` (namespace), `:325` (definition); `TauCeti/RingTheory/Semisimple/MatrixDivisionRing.lean:101`, `:197` (`TauCeti.Matrix.mulOppositeRingEquivEnd`, unchanged name).
- Gate re-run at `a0e5702`: every counter 0, `OK`; the worker's run also has `build=0`.
- Dependency check: `depcheck: 245 roadmaps, 2214 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `Suggested.lean` at the new pins: two warnings, both `declaration uses sorry` (102:8, 120:8); the elaborated signatures agree with the previous review's, no binder lost.
- Changes outside the folder against the base: none (`git diff --stat origin/main...HEAD` outside the folder is empty; the files that differ from `ccd7e7a` come from the merge of main).
- Description against the head, confirmed: imports (`Suggested.lean:1-3`), the two theorems (`:102`, `:120`), the docstring's absent carriers (`:17-24`, §4.2b at `:14-15`); cited sections present in the README: IntegralIwasawaTheory §12.6, §§0.1–0.3, 1.1 (`:2354`), §§10.0–10.1 (`:4459`, `:4502`); ArithmeticGaloisRepresentations §5.8; SelmerIwasawaCohomology §§2.1–2.19, 3.0, 3.11, 4.18, 4.25; ArithmeticGaloisDuality R02.1.2, R02.1.3, R02.2.1, R02.2.3, R02.4, R02.5.1, D7.1–D7.7; EllipticCurves Layer 7 (`:1449`); HeegnerPointEulerSystems in the scope section (`:19`); the title matches the README heading. The four suppliers not on main are all earlier in the merge order.
- Seeded sample (§§0.4, 0.7, 1.5, 1.20, 3.8, 3.11, 4.11, 5.13, 6.6, 6.9, 7.2, 8.11, 8.12, 8.28, 8.35): none falls in a changed passage; source locators checked this round: 0. Overlap check: read HeegnerPointEulerSystems, SelmerIwasawaCohomology, EulerSystemsCyclotomicMainConjecture; nothing shared (`overlaps.md` lists no dropped id, no second copy and no other pull request changing this roadmap).

Source independence: changed passages only; 3 passages compared with 0 sources (they cite pinned library declarations and revisions, no source text), none shared; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- The sampled locators were not re-certified against their sources this round: the passages are unchanged since the review of `ccd7e7a`.
- Rubin's published pagination remains uncertified, as in the previous reports; the README cites the readable 1999 draft.
- The description's statement of which AI tools assisted, and of Lake's notice in the build log, cannot be checked from the head.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md` References: the Mazur–Rubin "Kolyvagin systems" link is a copy on a third party's institutional page (`webusers.imj-prg.fr/~christophe.cornut`), not an author's page or the publisher.
- **Licence.** `README.md` References: Rubin's published "Euler Systems" is linked from `wstein.org/people/rubin/book`, described there as the author's file hosted by W. Stein.
