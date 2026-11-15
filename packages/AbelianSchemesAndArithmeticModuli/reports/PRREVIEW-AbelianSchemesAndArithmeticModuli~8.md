# Review of AbelianSchemesAndArithmeticModuli (pull request #849 at 4ed5f32)

**Verdict:** needs changes

Incremental re-review: the folder has 0 changed lines since the review of `4ed5f32`, and this round reads the pull request's title and description against the head. Both findings are in the description; neither asks for a change to `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md` or `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/Suggested.lean`.

## R01 (P3) — The description names three roadmaps the README does not cite

**Location** Pull request description, the paragraph beginning "Dependencies": "Roadmaps already on main that the README cites (SchemeAndStackFoundations, PadicMeasuresIwasawaAlgebras, AdicSpacesPartII, RigidAnalyticGeometry and the older roadmaps) are consumed from main and are not prerequisites; consumers of this roadmap are listed in the merge-order block, not here."

**Claim** The README cites PadicMeasuresIwasawaAlgebras, AdicSpacesPartII and RigidAnalyticGeometry nowhere. The merge-order block ends at this pull request and lists no consumer.

**Witness** `grep -c` on `README.md` gives 0 for each of the three names (and for "Iwasawa", "adic spaces", "rigid analytic", case-insensitive). The roadmaps on main it does cite are in the replacement below (`README.md:130–139, 405–566`).

**Repair** Replace the sentence with: "Roadmaps already on main that the README cites (JacobianChallenge, ModularCurves, EllipticCurves, SchemeAndStackFoundations, EtaleCohomologyFoundations, EnhancedDerivedSheaves, ComplexTori, AlgebraicVectorBundles, StableReduction, EquivariantIntersectionTheory) are consumed from main and are not prerequisites; the roadmaps that consume this one are listed in the README's Downstream consumers section."

## R02 (P3) — The description does not say that the pull request adds a new roadmap

**Location** Pull request description: "Roadmap folder `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli` (README, `Suggested.lean`, `metadata.toml`); the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti, every target is in the README."

**Claim** The text never says whether the folder is new or revises one on main. With the title's "the Jacobian challenge, part II" and "This roadmap extends the Jacobian challenge", it can be read as a revision of JacobianChallenge, which is on main.

**Witness** The folder is absent from `origin/main` (3cf7342). The change is 4471 insertions and 0 deletions in three new files; `git diff --stat origin/main...HEAD` outside the folder is empty, so `TauCetiRoadmap/JacobianChallenge/` is untouched.

**Repair** Begin that sentence: "This pull request adds a new roadmap folder, `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli` (README, `Suggested.lean`, `metadata.toml`), and changes no other folder; JacobianChallenge on main is cited, not revised; the Lean states only …".

## Previous findings

- none: the review of `4ed5f32` had no finding. Its R01 of the round before (`tateModule_rank` as `Nonempty` of an equivalence) stays repaired: `Suggested.lean:266–270` concludes `Module.Free … ∧ Module.Finite … ∧ Module.finrank … = 2 * g`.

## Verified sound

Rows for the statements the description names, each computed against the head.

| Statement | Instances tried | Values on the two sides | Result | Change |
|---|---|---|---|---|
| Description: "`charpolyTate`", "characteristic polynomials come from degree polynomials"; `exists_charpoly`, `charpolyTate` (`Suggested.lean:324–349`) | `E : y² + y = x³` over `𝔽₂`, `α = π`; `g = 0` | `#E(𝔽₂) = 3` (two points at `x = 0`, none at `x = 1`, one at infinity); `P = X² + 2`, `P(1) = 3 = deg(π − 1)`, `P(0) = 2 = deg π`; `g = 0`: `P = 1 = deg` | description and Lean agree | none |
| Description: "isogeny degrees are finite-flat ranks, inseparable part included"; `IsAbelianIsogeny`, `Hom.deg`, A3.1 | Frobenius and `[2]` on the supersingular `E/𝔽̄₂` | ranks `2` and `4`; geometric kernel points `1` and `1`; a point count would give degree `1` twice | sentence true of the head | none |
| Description: "`homFreeFinite`" (`Suggested.lean:316–320`) | non-CM `E`; supersingular `E/𝔽̄_p`; `gA = 0` | ranks `1 ≤ 4`, `4 = 4·1·1`, `0 ≤ 0` | bound attained, statement as described | none |
| Description: "`endQ_isSemisimple`" (`Suggested.lean:322–326`) | `E²` non-CM; `E × E′` non-isogenous; zero variety | `M₂(ℚ)` of dimension `4`; `ℚ × ℚ`; the zero ring (semisimple, finite) | as described | none |
| Description: "`relativeSeesaw` and `relativeCube`", "zero-rigidified line bundles rather than a reduced-fibre test" | `n = 2`; `L = π^*N`, `N² ≠ 1`, `n = 1` | exponents `(3, 1)`, sum `4 = n²`; `e^*π^*N = N ≠ O_S`, so `π^*N` is not rigidified and is excluded by the binder | as described | none |
| Description: "A polarization is a homomorphism to the dual, not a chosen ample bundle" (A2.5, `README.md:1206–1216`) | `O(m·0)` on `E`, `m = 1, 2`; `[−1]` | kernel ranks `1, 4`, degrees `1, 2`; `[−1]` symmetric but `= φ_{O(−0)}`, not ample | as described | none |
| Description: "integral unimodular Riemann-form theory stated on Tau Ceti's weight-one carriers" (`README.md:305–307, 2580–2601`) | `ℤ + iℤ`, `E = Im(v w̄)`; `2E` | `det E = 1`, principal; `det(2E) = 4`, cokernel `(ℤ/2)²`, not principal; `Q = −E`, `C = −J` | as described | none |

The rows of the previous review for the folder's statements stand as in the previous review, of `4ed5f32`: the folder is byte-identical.

- Title: "Abelian schemes and arithmetic moduli (the Jacobian challenge, part II)" equals the README's heading (`README.md:1`).
- Summary block: every backticked name it uses (`AbelianScheme`, `relativeSeesaw`, `relativeCube`, `homFreeFinite`, `endQ_isSemisimple`, `charpolyTate`) is declared in `Suggested.lean`; each of its three paragraphs was read against the Summary, Scope, A2.1–A2.5, A4.7, A4.9, A5.3, A5.8, A6.10–A6.14 and Downstream consumers (`README.md:3–37, 83, 1206–1216, 3924–3970`); no sentence is contradicted.
- "The Lean imports none of them": `Suggested.lean:1–6` imports `Mathlib` and five `TauCeti.*` modules only. Folder contents: `README.md`, `Suggested.lean`, `metadata.toml`, as the description says.
- Open suppliers named in the description's generated blocks (CrystallineCohomology, AlgebraicModuliForArithmeticGeometry, ComplexComparisonPartII) are earlier in the merge order (lines 25, 36, 41 against 43) and absent from main; EquivariantIntersectionTheory is on main, ticked.
- Gate, my run on this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate adds `build=0 OK`.
- Elaboration: `lake env lean` on `Suggested.lean` prints 21 `declaration uses sorry` warnings and nothing else.
- Direction check: `depcheck: 245 roadmaps, 2215 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Overlap check: read JacobianChallengePartII, PELModuli, FaltingsFinitenessAndIsogenyTheorems (open) and JacobianChallenge, ModularCurves, SchemeAndStackFoundations (main); nothing shared. The three open ones cite this roadmap's A-sections as a supplier; relative Jacobians of curves are JacobianChallengePartII's, and this roadmap does not cite it.
- Source independence: changed passages only; the folder has no changed passage, so 0 passages compared with 0 sources; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- No source locator was reopened: no passage of the folder changed. The texts on the earlier reports' lists (faltings-chai I.5 p. 25 and I.1.6 p. 4, blr, messing, bbm, chai-conrad-oort §1.7.4) remain as recorded there.
- The description's generated blocks (`depends-on`, `merge-order`) are outside the check of the text; they were read only to test the prose sentences that point at them.

## Source issues

- none

## For the human reviewers

- none
