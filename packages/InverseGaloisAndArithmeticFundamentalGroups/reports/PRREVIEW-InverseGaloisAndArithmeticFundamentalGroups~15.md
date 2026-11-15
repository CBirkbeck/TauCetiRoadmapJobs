# Review of InverseGaloisAndArithmeticFundamentalGroups (pull request #850 at 9432671)

**Verdict:** needs changes

## R01 (P3) — Description names three on-main roadmaps the README never cites

**Location:** PR description, Dependencies paragraph: “Roadmaps already on main that the README cites (SchemeAndStackFoundations, PadicMeasuresIwasawaAlgebras, AdicSpacesPartII, RigidAnalyticGeometry and the older roadmaps) are consumed from main”.
**Claim:** Three of the four named roadmaps are cited nowhere in the folder. The on-main suppliers the README actually uses are not named.
**Witness:** Occurrences in `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md` and `Suggested.lean`: PadicMeasuresIwasawaAlgebras 0, AdicSpacesPartII 0, RigidAnalyticGeometry 0. On-main roadmaps the README does cite: EtaleCohomologyFoundations 152, BelyiMaps 34, ResolutionOfSingularitiesCharacteristicZero 12, EnhancedDerivedSheaves 7, AdicEtaleGeometry 4.
**Repair:** Replace the parenthesis with “(EtaleCohomologyFoundations, SchemeAndStackFoundations, BelyiMaps, AdicEtaleGeometry, EnhancedDerivedSheaves, AdelicAlgebraicGroups, ResolutionOfSingularitiesCharacteristicZero and the older roadmaps)”.

## R02 (P3) — Summary credits the path groupoid and the arithmetic sequence to this roadmap's layers

**Location:** `roadmap-summary` block, “Why Tau Ceti wants it”: “The path groupoid, tame tangential base points and arithmetic sequence of its first layers underlie the anabelian and nonabelian Chabauty roadmap and arithmetic dynamics.”
**Claim:** IG.0–IG.1 import étale paths and the arithmetic exact sequence from another roadmap; they do not build them. The summary's next paragraph says so too.
**Witness:** README:105 says paths are “Supplied by EtaleCohomologyFoundations §F.0”. README:1001 says “EtaleCohomologyFoundations §§F.0.A1–F.0.A2 supply the arithmetic exact sequence”. On main, EtaleCohomologyFoundations README:368 is “F.0.A2 The arithmetic fundamental-group sequence”.
**Repair:** “The tame quotients, tangential base points and specialization maps of its first layers, built on the étale paths and arithmetic sequence of EtaleCohomologyFoundations §§F.0 and F.0.A2, underlie the anabelian and nonabelian Chabauty roadmap and arithmetic dynamics.”

## Previous findings

- R01 — repaired: the description now reads “downstream consumers are listed in the README’s “Downstream consumers” section”, and README:7531 has that heading.
- R02 — repaired: “This PR adds the new roadmap `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups`, with seven layers IG.0–IG.6, a README, `Suggested.lean` and `metadata.toml`.” This matches the head: 7 `## Layer IG.k` headings and 3 added files.

## Verified sound

| Statement | Instance | First side computed | Second side computed | Result | Change |
| --- | --- | --- | --- | --- | --- |
| Description's list of cited on-main roadmaps (R01) | Occurrence count in the README | Named: SchemeAndStackFoundations 86; PadicMeasuresIwasawaAlgebras 0, AdicSpacesPartII 0, RigidAnalyticGeometry 0 | Unnamed but on main and cited: EtaleCohomologyFoundations 152, BelyiMaps 34, AdicEtaleGeometry 4 | 3 of 4 names wrong | Replace the list |
| Summary's ownership of paths and the arithmetic sequence (R02) | IG.1 introduction against the summary | README:105, 1001: imported from EtaleCohomologyFoundations §§F.0, F.0.A2 | Summary: “of its first layers”; its next paragraph says “come from EtaleCohomologyFoundations” | Self-contradicting | Reword |
| `inverseGaloisProblem_of_regular` (named in the summary) | `G = C₂`, trivial `G`, universes | `C₂`: `L = ℚ(T)(√T)`, degree 2, constants ℚ (regular); `T = 2` gives `ℚ(√2)` with group of order 2 | Trivial `G`: `L = ℚ(T)` is regular and specializes to `ℚ`; `K = ℚ : Type` puts `L : Type`, as in `InverseGaloisProblem` | Agrees | None |
| `HasRegularRealization` (inside `RegularInverseGaloisProblem`) | Non-example `ℚ(i)(T)/ℚ(T)` | Finite Galois extension with group `C₂` | `i` is a root of `X² + 1`, so integral over ℚ but not in ℚ: `IsIntegrallyClosedIn ℚ L` fails | Constant extension excluded | None |
| Summary: “conjugacy of complements” under solvability (README:197, 3309) | `N = C₃ ⊲ S₃` | Complements are the 3 subgroups of order 2 | All conjugate (3-cycles conjugate them); `G/N = C₂` is solvable | Agrees | None |
| Summary: “Schur multiplier is `groupHomology.H2`” | README:263, 3042 | `M(G) = groupHomology.H2 (Rep.trivial ℤ G ℤ)` | No second carrier among the 36 declarations of `Suggested.lean` | Agrees | None |

The rows for untouched statements stand as in the previous review of `9432671`.

- Incremental scope: 0 changed folder lines and 0 changes outside the folder (`git diff --stat` excluding the folder is empty). Title, the 3 summary paragraphs and the 3 prose paragraphs were checked against the head.
- Citations resolved: 17 roadmap names counted in the README and each checked on main (`TauCetiRoadmap/` or `Completed/`). DeligneWeightsAndPurity is not on main; README:205 names it only as a development, not as a supplier.
- Tau Ceti carriers opened for the “braid and rational-function-place carriers” sentence: `TauCeti.BraidGroup` (`GroupTheory/SpecificGroups/Braid/Basic.lean:99`), `permHom` (:358), `pureSubgroup` (:504), `Place.adicOfIrreducible` (`FieldTheory/FunctionField/Place/RatFunc/Basic.lean:252`), `valuation_ofIrreducible_le_one_iff` (`RatFunc/Order.lean:337`). The sentence stands.
- Gate with the configured order: `depcheck=3`, all UPWARD edges to ArithmeticGaloisDuality, ArithmeticGaloisRepresentations and SieveMethodsAndPrimePatterns. With the supplied moved order, `--movable --build`: every counter 0, `build=0 OK`, exit 0. The worker's gate also passes.
- Dependency check with the supplied order: `depcheck: 245 roadmaps, 2223 edges, 0 problem(s)`. The roadmap is placed after ArithmeticGaloisDuality (line 61 of the order).
- `lake env lean` on `Suggested.lean`: exit 0; 18 warnings, all `declaration uses sorry`; 0 errors.
- Remark (untouched text): README:7533–7534 (Downstream consumers) gives the same attribution of the path groupoid and arithmetic sequence to Layers IG.0–IG.1 as R02.

Overlap check: read EtaleCohomologyFoundations (main: paths §F.0 and arithmetic sequence §F.0.A2, owned there and imported here), BelyiMaps (three-point theory, owned there), SchemeAndStackFoundations, ArithmeticGaloisDuality, ArithmeticStatisticsPartVIII, InductionRestrictionPartII and InverseGaloisAndArithmeticFundamentalGroupsPartII. No change to ownership. The overlap report lists no conflicting head and no dropped citation.

Source independence: changed passages only; 0 passages compared with 0 sources, because the folder diff is empty. No layer was added, removed or reordered, so the contents comparison stands as in the previous review.

## Not verifiable

- The previous source limits stand: the SGA 4½ secondary curve-trace citation, Serre's *Topics in Galois Theory*, Fried–Jarden, Poonen §8.2, Kollár IV.6.10, Huppert, and Ribes–Zalesskii. No new source was needed this round.

## Source issues

- none

## For the human reviewers

- none
