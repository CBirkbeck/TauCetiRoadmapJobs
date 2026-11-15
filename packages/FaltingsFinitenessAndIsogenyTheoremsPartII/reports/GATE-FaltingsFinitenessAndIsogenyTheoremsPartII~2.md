# GATE-FaltingsFinitenessAndIsogenyTheoremsPartII~2: answers to human review

There is one comment (mycaule, 2026-11-15T21:24:23Z). It makes one point: a partial overlap with the
directory `Mordell/MordellConjecture/` (two files) of the external Lean repository AxiomMath/Mordell
at commit 82a30cb (H01).

## H01 (mycaule) — disputed

The two files state Faltings' theorem on rational points and prove it by the Bombieri–Vojta route: `Faltings.finite_setOf_comp_eq_id_of_two_le_genus` in `Curve.lean` (a smooth projective geometrically integral curve of genus ≥ 2 over a number field has finitely many rational points) and `Faltings.finite_setOf_place_isDegreeOne` in `FunctionField.lean` (a function field of genus ≥ 2 over a number field has finitely many degree-one places). This roadmap states neither result nor any other finiteness result for rational points; its targets are Rosati metrics, the Masser–Wüstholz period theorem, endomorphism, order-discriminant and Hom-discriminant bounds, polarization-free isogeny estimates, the elliptic j-height isogeny bound and uniform integral Tate indices (Layers 1–8; `Suggested.lean` declares `regularOrderDiscriminant`, `class_index_bound` and `elliptic_isogeny_j_height_bound`), and none of these has a counterpart anywhere in that repository. The Tau Ceti owner of the same theorem is HeightsRationalPointsAndObstructions, §6.4 `mordell_finite`, which it proves by the Vojta–Bombieri route of §§5.10–5.12, so the provenance citation of AxiomMath/Mordell belongs in that roadmap; this README is unchanged.

Evidence (all checkable):

- **The rest of the external repository.** The tree at 82a30cb has these top-level directories under `Mordell/`: `AbelianVariety`, `Algebra`, `AlgebraicGeometry`, `Analysis/MahlerMeasure`, `BombieriVojta`, `Curve`, `CurveProduct`, `FunctionField`, `Height`, `Jacobian`, `LeanEval`, `MordellConjecture`, `MordellWeil`, `NeronTate`, `NumberField`, `Polynomial` and `Roth`.
  - No directory or file name concerns Rosati involutions, periods, isogeny degrees, endomorphism rings, polarizations, elliptic curves, orders in division algebras or Galois images.
  - The only lattice files are `Algebra/Quadratic/FGLattice.lean` and `LatticeCriterion.lean`. They show that a finitely generated abelian group modulo torsion is a lattice in its real span, and that a form with finite sublevel sets is positive definite. These are Mordell–Weil facts, not the order-lattice class index of §3.5.
  - `Roth/` (Roth's lemma) is not the multiplicity estimate on an abelian variety of §2.2. `BombieriVojta/SmallSection` (Siegel's lemma) is not the slope-method interpolation of §2.3, which uses no Siegel lemma.
- **Shared vocabulary.** This README uses only two terms that the external repository also develops, and it develops neither:
  - the absolute Weil height of the j-invariant in §6.1 (README line 949), consumed from Mathlib `NumberField.absLogHeight₁`;
  - the Néron–Tate height, which is named only inside the cubist-model request to ArakelovGeometryAndAbelianHeights (README line 79).
- **Ownership of the Mordell conjecture in TauCetiRoadmap.** HeightsRationalPointsAndObstructions (head of its open pull request) owns `mordell_finite` (§6.4, also in its `Suggested.lean`). It proves it from Vojta's inequality (§5.10), Siegel's lemma and the small section (§5.10c), Roth's bound (§5.10d), Mumford's gap (§5.11) and the gap-route conclusion (§5.12). That is the same route as `Mordell/BombieriVojta`.
  - MordellLawrenceVenkatesh gives an independent route.
  - The base roadmap FaltingsFinitenessAndIsogenyTheorems explicitly excludes the Mordell conjecture by the Vojta–Bombieri and Lawrence–Venkatesh methods (Scope, its README lines 150–152 at its head), and treats Parshin's implication only as a conditional worked example.
  - No roadmap on main or at an open head cites AxiomMath/Mordell (`roadmaps grep 'AxiomMath/Mordell|Mordell/tree|Mordell/blob'`: no match).
- **Why no provenance section here.** The repository's rule (README, Porting existing work) asks a roadmap that independently develops the same mathematics to cite the existing work. This roadmap does not develop that mathematics. Adding an "Existing formalizations outside Tau Ceti" section here would record an absence and widen the README.

## Build and gate

- `lake build TauCetiRoadmap.FaltingsFinitenessAndIsogenyTheoremsPartII.Suggested`: `Build completed successfully (18288 jobs).` The only warnings are the two expected `declaration uses 'sorry'` warnings, at `Suggested.lean` lines 47 (`class_index_bound`) and 68 (`elliptic_isogeny_j_height_bound`).
- Gate: `gate FaltingsFinitenessAndIsogenyTheoremsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Direction check (`gate --depcheck … --movable --pr 1738`): `depcheck: 239 roadmaps, 2255 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- No file was changed, so there is no commit.

## Further checks this round

- **Elaborated signatures.** I compared the three elaborated types in the worker's signature file with their README statements: `regularOrderDiscriminant` with §3.1, `class_index_bound` with §3.5, `elliptic_isogeny_j_height_bound` with §6.1.
  - Every hypothesis named in the README is in the signature, and no section binder is lost: the division ring, the `Algebra ℚ D` and finite-dimensionality, the order basis, the full rational spans, `0 < e`, `Module.Finite ℤ M`, the index ≠ 0 conjunct, and the two `IsElliptic` instances with geometric isogeny existence.
  - The Lean file is unchanged, so I did not run a new `#check` file.
- **Citation leads from the resolver.** Both are false positives.
  - AutomorphicBundles defines its letter labels at its README line 221, at the head of its open pull request: B4 = Layer 11, B5.1a = 12.2, B5.n = 12.(n+1). So B4.2 = §11.2 (cuspidal automorphic forms), B4.9 = §11.9 (geometric and analytic classical forms), B5.1a = §12.2 and B5.13 = §12.14 (Tate and analytic q-expansion comparison).
  - `ScalarFourierJacobi.torsorDescription` is the target name that AutomorphicBundles §12.2 itself declares. It is a name of that roadmap, not of this one.
- **Adversarial pass.** No statement was added or changed. As a recomputation of the one headline whose route is pure arithmetic:

| Statement | Instance | Values computed | Result | Change |
|---|---|---|---|---|
| §6.1 `elliptic_isogeny_j_height_bound`, route constant C = 9C₀ | D=1, h(j)=0, h_F ≤ 3 | H = max(1, h_F, 0) ≤ 3 = 3·max(1, 0)·(1+0); C₀H² ≤ 9C₀ = 88,030,890,000,000 = C·1²·1²·1² | holds | none |
| same | D=2, h(j)=12 | h_F ≤ 12/12+3 = 4, log 2 ≈ 0.693, H ≤ 4; 3·max(1, 0.693)·13 = 39 ≥ 4 | holds | none |
| §3.5 `class_index_bound`, index ≠ 0 conjunct | O = ℤ ⊂ ℚ, e = 1, M = ½ℤ | disc = det(tr(1·1)) = 1, so the bound is 1^(1/2) = 1. The map f(1) = 1 has index [½ℤ : ℤ] = 2 > 1, but f(1) = ½ has index 1 ≤ 1, so f exists | holds; the statement is existential in f | none |

- **Ownership against open pull requests.** I checked this by object with `roadmaps grep` over main and every open head ("AxiomMath/Mordell", "Vojta") and by reading the scopes of HeightsRationalPointsAndObstructions, MordellLawrenceVenkatesh, FaltingsFinitenessAndIsogenyTheorems and AutomorphicBundles at their heads.
- **Suspicious text.** None: the comment contains no instruction.
- **Sources.** No source was needed. The external repository was read at the pinned commit on GitHub (Apache-2.0) only to compare statements, and nothing from it was copied.
