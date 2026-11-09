# Review of GlobalGaloisDeformationsPartII (pull request #1837 at d2150fc)

**Verdict:** accepted

Incremental re-review of the 2 lines changed since 8221ac8: one sentence added at the top of `## Exact supplier contracts` (`TauCetiRoadmap/GlobalGaloisDeformationsPartII/README.md:48`) naming the Tau Ceti and Mathlib revisions at which the README's library citations are read. `Suggested.lean` is unchanged. No finding remains.

## Previous findings

- R01 — repaired: `README.md:48` now reads "read at the revisions the content repository's manifest records: Tau Ceti `2fd255d9…` and Mathlib `1b1ccf4b…`. Every declaration, module and file named in this section … is cited as it is at those revisions." Both hashes equal the `rev` fields of `lake-manifest.json` on main (3090489), and every citation resolves there (counts below), including the two files the previous witness named: `TauCeti/Algebra/Lie/Whitehead.lean` (`exists_eq_lie_of_d₁₂_eq_zero` :105, `exists_d₁₂_eq` :113) and `TauCeti/Algebra/Lie/UniversalEnveloping/Augmentation/Basic.lean` (`ι_mem_augmentation` :82). The form has precedent on main: PDE (`README.md:270`), AlgebraicVectorBundles (`README.md:50`, `:226`, `:269`) and GeometricTopology (`README.md:323`) name the revision of their citations the same way. The repair introduces no new problem.

## Verified sound

**Gate.** The worker's gate at d2150fc reports every check 0 including `build=0`. My rerun: `gate GlobalGaloisDeformationsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml`.

**Dependency check**, complete output: `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/GlobalGaloisDeformationsPartII/Suggested.lean` from the worktree: exit 0 in 14 s, the only messages `declaration uses 'sorry'` at 128:8 (`uniformTorsion_H1`) and 147:8 (`uniformTorsion`). The file is byte-identical to the one read at 8221ac8 (the diff touches only the README), so the elaborated types, the binder comparison against `signatures.md` and the one-tactic probes of the r10 and r11 reports stand unchanged.

**The changed sentence, checked claim by claim at the named revisions** (Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; the checkouts I searched report exactly these as their heads).

- Files: the README names 34 distinct `Mathlib/…lean` and `TauCeti/…lean` paths (25 Mathlib, 9 Tau Ceti). All 34 exist at the named revisions.
- Declarations, each found in the file the README gives for it. Mathlib (36): `Representation` (`RepresentationTheory/Basic.lean:48`), `Rep.of` (`Rep/Basic.lean:62`), `Representation.IntertwiningMap` and `.Equiv` (`Intertwining.lean:36`, `:320`), `groupCohomology.H1` (`…/GroupCohomology/LowDegree.lean:965`), `TopRep`, `TopRep.of` (`Continuous/TopRep.lean:31`, `:16`), `ContRepresentation` (`Continuous/Basic.lean:55`), `continuousCohomology` (`…/ContCohomology/Basic.lean:131`), `OpenSubgroup` (`Topology/Algebra/OpenSubgroup.lean:49`), `ContinuousCohomology.tateShafarevich` (`…/ContCohomology/Sha.lean:72`), `LieGroup` (`Geometry/Manifold/Algebra/LieGroup.lean:72`), `GroupLieAlgebra` (`Geometry/Manifold/GroupLieAlgebra.lean:56`) with its `LieRing` (:230) and `LieAlgebra` (:262) instances and `mulInvariantVectorField` (:62), `LieAlgebra.IsSemisimple` (`Algebra/Lie/Semisimple/Defs.lean:105`), `VectorField.lieBracket` (`Analysis/Calculus/VectorField.lean:59`), `VectorField.mpullback_mlieBracket` (`Geometry/Manifold/VectorField/LieBracket.lean:907`), `ContDiffAt.analyticAt` and `AnalyticAt.contDiffAt` (`Analysis/Calculus/ContDiff/Defs.lean:977`, `:985`), `Subrepresentation.quotient` (`RepresentationTheory/Subrepresentation.lean:114`), `CategoryTheory.ShortComplex.ShortExact` (`Algebra/Homology/ShortComplex/ShortExact.lean:34`), `CompositionSeries.jordan_holder` (`Order/JordanHolder.lean:455`), `Submodule.span`, `subset_span`, `span_le` (`LinearAlgebra/Span/Defs.lean:46`, `:75`, `:80`), `Submodule.map_span` (`Span/Basic.lean:73`), `Submodule.map` (`Algebra/Module/Submodule/Map.lean:52`), `AddSubgroup.map` (`Algebra/Group/Subgroup/Map.lean:112`, by `to_additive`), `IsAbelianGalois` (`FieldTheory/Galois/Abelian.lean:25`), `LieModule.Cohomology.d₁₂` and `twoCocycle` (`Algebra/Lie/Cochain.lean:101`, `:156`), `LieAlgebra.HasTrivialRadical.instIsKilling` (`Algebra/Lie/CartanCriterion.lean:257`); the module `…/GroupCohomology/LongExactSequence.lean` exists. Tau Ceti (13): `TauCeti.ContCohomology.H1` (`…/ContCohomology/LowDegree.lean:829`), `explicitInfRes_exact` (`…/Inflation/Basic.lean:353`), `exists_isCompl_of_isKilling` (:259), `representation_casimirElement_injective_of_isIrreducible_of_not_isTrivial` (:127) and `exists_isInternal_isIrreducible_of_isKilling` (:275) in `Algebra/Lie/HighestWeight/CompleteReducibility.lean`, the two Whitehead lemmas and `ι_mem_augmentation` as above, `casimirElement` and `casimirElement_mem_center` (`…/UniversalEnveloping/Casimir.lean:125`, `:175`), `HopfIdeal.augmentation` (`Algebra/HopfAlgebra/HopfIdeal/Augmentation.lean:61`), `isKilling_baseChange_iff` (`Algebra/Lie/Killing/BaseChange.lean:101`), `LieModule.maxTrivSubmodule_baseChange` (`Algebra/Lie/BaseChange/MaxTrivSubmodule.lean:57`).
- Scope of the sentence. The library names in the Scope and ownership paragraphs, on the *Needs:* lines and in §4.4 (37 distinct backticked identifiers, two of them this roadmap's own `uniformTorsion_H1` and `uniformTorsion`) are all in the list above, plus `mlieBracket`, which is in `Mathlib/Geometry/Manifold/VectorField/LieBracket.lean`.
- "The Tau Ceti import of `Suggested.lean`": the file has exactly one, `TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree` (line 4); the module exists at the named revision and declares `abbrev H1` at :829, the only Tau Ceti name the Lean statements use (`Suggested.lean:136`).
- The sentence is not process narrative, names no pull request, path or round, and passes the gate's `residue`, `prnum` and `private-paths` scanners.

**Adversarial table.** The diff changes no mathematical statement; the one changed passage is a claim about the libraries, and its row carries the counts computed above. All other rows are carried from the r11 report (which carries r10's), their statements being untouched.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `README.md:48`: citations are as at Tau Ceti `2fd255d9…`, Mathlib `1b1ccf4b…`, the manifest's revisions | main's `lake-manifest.json`; 34 paths; 49 declarations; the Lean import | manifest `rev` fields equal both hashes character for character; 34/34 paths exist; 49/49 declarations found in the cited file; import module exists, `H1` at :829. Control: at Tau Ceti `358314d` the same test gives 32/34 paths (the two files of the previous R01 absent), so the test discriminates | holds | none |
| §4.4 comparison: bracket of `GroupLieAlgebra` equals Lazard's | as r11 | r11: left-invariant fields give `½[v,w] − ½[w,v] = [v,w]`; right-invariant give `−[v,w]` | holds (carried) | none |
| §4.4 comparison Checks (SL₂(ℤ₃); ℤ₃; finite Γ; ℤ₂^×) | as r11 | r11: `E₁₂E₂₁ − E₂₁E₁₂ = h`; Killing form 0 on ℚ₃; `0 = 0`; `ω(x²) = ω(x)+1`, `log H = 4ℤ₂` | hold (carried) | none |
| §4.4 Casimir invertibility route | as r11 | r11: Killing Casimir on the standard sl₂-module is 3/8, trace-form 3/2 = 4·3/8, trivial module 0 and excluded | holds (carried) | none |
| §4.4 hypothesis ⇔ no L(Γ)-invariants in V⊗ℚ_p | as r11 | r11: `(V⊗ℚ)^U = (V⊗ℚ)^𝔤` for small U; `p^m w ∈ V` fixed | holds (carried) | none |
| `uniformTorsion_H1` (§4.4, degree one) | as r10 | r10: ℤ₃ excluded (H¹ = ℤ/3ʳ), C₃ on ℤ₃[ζ₃] killed by 3¹, r = 0 and V = 0 give a = 0 | holds (carried) | none |
| `uniformTorsion` (§4.4, all degrees) | as r10 | r10: SL₂(ℤ₃) on ℤ₃² satisfies `hfix`; trivial ℤ₃ fails at U = Γ; C₃ fails at U = ⊥ | holds (carried) | none |
| §0.2 oddness; §0.3 C1–C4; §1.2; §1.3; §1.5; §2.4; §2.5; §2.7; §3.1; §3.4; §7.5; §8.1; §8.5; §8.8; §10.1; Conventions, §1.7/§9.5, §4.2/§4.6, §8.10/§8.11, §7.8 Checks | as r10 | values in the r10 report's table; none of these passages changed | hold (carried) | none |

**Seeded sample.** The fifteen targets (§§0.2, 1.2, 1.6, 1.9, 1.12, 2.1, 2.2, 3.3, 4.1, 5.4, 7.6, 8.4, 8.5, 8.6, 8.10) all lie in untouched text; the diff adds no locator and touches none of them, so none was re-read this round. The README flags no locator as unverified.

**Cross-roadmap citations, overlaps, gaps.** The changed sentence cites no roadmap. The citations tool's one lead, PotentialAutomorphyInfrastructurePartII §8.17, is the board package resolved in r10, untouched. The overlaps tool reports no pull request changing this roadmap, no dropped id and no id only an open revision defines. The 26 declared gaps are unchanged.

**Remarks, no change requested.**
- The branch's own `lake-manifest.json` still records Tau Ceti `358314d` and Mathlib `f6090c7`; the pull request does not change the manifest, so on merge the folder sits under main's, which is the one the sentence names. `Suggested.lean` elaborates at the branch pins (above) and the r8 round recorded that the same Lean statements elaborate at main's. Merging `origin/main` into the branch before the human approval would make the two agree; that is the worker's step, not a README change.
- Data for the worker: the description still says the degree-one form is "the one headline statable", while `Suggested.lean` states both forms.

## Not verifiable

- Gur99 Theorem A; NSW08 Theorems 8.6.7, 8.6.10 and 8.7.9; BC14 Lemma 10, Propositions 11 and 32, Definitions 29–30: settled as uncertified, cited by locator only, not read.
- Elaboration of `Suggested.lean` at main's revisions was not rerun this round (Lean is run only in the branch worktree); the import module differs between the two revisions outside `H1`'s statement, and the r8 record of a clean elaboration at `2fd255d9`/`1b1ccf4b` is relied on.

## Source issues

- none
