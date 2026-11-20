# Review of OrthogonalGeometry (pull request #2615 at fbb2cb5)
Folder: `TauCetiRoadmap/OperatorTheory/OrthogonalGeometry/`
**Verdict:** accepted

**Summary.** Accepted. The earlier finding is repaired. §2.1 now says that the coordinate isometry on `Fin d` is Tau Ceti's `Orthonormal.synthesisMapIsometry`, and that `familyIsometry` is a copy kept only in the acceptance file. Its equality with the Tau Ceti map holds at the pins and closes with one `simp`, and the name clash given as the reason for the copy is real. The two earlier small corrections are repaired. One new small correction remains: a sentence in the conventions that the repair left out of date. There are no format notes. The human reviewers still have the two earlier questions: whether the roadmap should stay active when Tau Ceti already proves every obligation of its version on main, and the Kitware copyright line.

## C01 — Convention 8 still says that `Suggested.lean` states this roadmap's declarations, but its only declaration is now a copy that is not one of them

Convention 8 (lines 70–72) reads: "Declarations of this roadmap go under `TauCeti/Analysis/InnerProductSpace/`; the acceptance file `Suggested.lean` states them in `TauCetiRoadmap.OrthogonalGeometry`." Before the repair, `familyIsometry` was a planned declaration of this roadmap, so the sentence was true. It no longer is. `Suggested.lean` declares one thing, `familyIsometry` (line 42). §2.1 (lines 167–169) and the module docstring (line 29) both say this copy is not to be added to Tau Ceti. The roadmap's own targets, §1.1 and §3.1, are not stated in the file, and the Tau Ceti headline theorems are pinned by `#check` (lines 59–64). A reader who looks in the file for this roadmap's declarations finds none.

A possible wording: "the acceptance file `Suggested.lean`, in the namespace `TauCetiRoadmap.OrthogonalGeometry`, pins the Tau Ceti headline theorems by name and holds the acceptance copy `familyIsometry` of §2.1."

## Previous findings

- R01 — repaired: §2.1 now reads "the coordinate isometry is Tau Ceti's `Orthonormal.synthesisMapIsometry hv` … the case `ι = Fin d`", and calls `familyIsometry` a copy "not to be added to Tau Ceti". The heading no longer carries OG labels, and the scope paragraph (lines 294–297) has been revised to match.
- C01 — repaired: line 11–12 now reads "a theorem of Tau Ceti's inner-product library which the layers below complement".
- C02 — repaired: lines 93–95 now read "(Chien–Waldron, Thm 2.2(1), pp. 4–5; also (1.1), p. 2)", and the References give the same locators against arXiv v1. §3.1 (lines 235–236) now says that its routes are complete proofs, "so the section needs no source".

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §2.1 coordinate formula, Tau Ceti map on `Fin d` | `ℂ`, `d = 1`, `E = ℂ`, `v₀ = 1`, `x = i·e₀`; `d = 0` | `∑ xⱼvⱼ = i`; conjugate variant `−i`; for `d = 0` the image is `0` (`simp` closes it) | holds, `Orthonormal/Family.lean`:59 | none |
| §2.1 action on `EuclideanSpace.single j c` | `ℝ²`, `v = ((cos θ, sin θ), (−sin θ, cos θ))`, `single 1 c` | image `c(−sin θ, cos θ) = c • v₁`; `exact _single` fails on `Fin d` (classical `DecidableEq`, line 65), `simp`/`convert` close it | true | none |
| §2.1 sanity check `familyIsometry hv = hv.synthesisMapIsometry` | copy elaborated with `Orthonormal/Family` imported | `ext x; simp [familyIsometry, constr_apply_fintype]` closes it; `rfl` fails; the written route also needs `OrthonormalBasis.coe_toBasis_repr_apply` | true; one tactic, already marked a sanity check | none |
| `familyIsometry` docstring, "equal to it" | `d = 0`; `ℂ²`, `v₁ = (1, i)/√2`, `v₂ = (1, −i)/√2`, `x = (1, 0)` | both maps give `0`; both give `(1/√2, i/√2)` | true | none |
| Name clash behind the copy (§2.1, module docstring) | `Positive/SquareRoot.lean`:57, 68; PolarDecomposition `Suggested.lean`:30, 91; Majorization `:6–7`; PrincipalAngles `:7–8` | both files declare `LinearMap.IsPositive.sqrt`; `Family` imports `Frame`, which imports `SingularValues`, which imports `SquareRoot`; both consumers import both acceptance files | true | none |
| Chien–Waldron citation, Thm 2.2(1) and (1.1) | ChienWaldron2016 lines 128–137 and 44–46; `(1)` in `ℂ` against `(e₁)` in `ℂ²` | finite sequences in Hilbert spaces, proof only "well known" (line 137); equal Gram matrices `[1]`, yet no unitary `ℂ → ℂ²` exists | README's description accurate; source issue below | none |
| §3.1 "the routes are complete proofs" | both routes elaborated; `ℓ²`, `vₙ = 2⁻ⁿeₙ`; `ι = ∅` | the criterion is one term; Parseval takes three lines (`hx.norm.pow 2`, `congr'`, finite Pythagoras); `4/3 = 4/3`; `0 = 0` | true | none |
| §1.1, sample (unchanged) | `ℂ`, `a = i`, `b = 1`, `φ = ψ = 1` | left `⟪i, 1⟫ = −i`; right `conj i · 1 · 1 = −i`; wrong conjugation gives `i` | holds | none |
| Summary lines 11–12 ("complement") | the *Needs:* lines of §1.1 (116–117), §2.1 (183–186) and §3.1 (243–246) | none of them uses a Gram-rigidity declaration | accurate | none |
| Convention 8, lines 70–72 | declarations in `Suggested.lean` | one `def` (line 42), called a non-library copy (lines 29, 167–169); §1.1 and §3.1 not stated | out of date | C01 |
| Table rows OG-09–OG-11 | `Orthonormal/Family.lean` lines 40, 59, 69 | `[Fintype ι]`; `a ↦ ∑ a i • v i`; `single i c ↦ c • v i` | true | none |
| `EuclideanSpace.basisFun_repr` (supplier contracts) | Mathlib `PiL2.lean`:790 | `(basisFun ι 𝕜).repr x i = x i`, by `rfl` | gloss true | none |

The rows for the statements this change leaves untouched (Gram rigidity in Tau Ceti, the Checks of §1.1, §2.1 and §3.1, the examples) stand as in the previous review, of `dd6c846`.

- Source locators checked: ChienWaldron2016, Theorem 2.2(1) at lines 128–137 (pp. 4–5), with the "well known" remark at line 137, and (1.1) at lines 44–46 (p. 2). Lemma 2.1 (lines 107–122) was read again.
- Tau Ceti opened at the pin:
  - `Orthonormal/Family.lean` lines 40, 59, 65, 69, 76 and 82; `Frame.lean` line 9; `SingularValues.lean` line 12; `Positive/SquareRoot.lean` lines 57 and 68.
  - `OrthogonalFamily.lean` lines 37 and 47.
  - `LinearCombination.lean`: it compares norms of linear combinations, not the expansion of §1.1.
- Mathlib at the pin: `PiL2.lean` line 790 opened, and `Module.Basis.constr_apply_fintype`, `LinearMap.coe_isometryOfOrthonormal`, `OrthonormalBasis.coe_toBasis_repr_apply` and `EuclideanSpace.basisFun_apply` confirmed by `#check`.
- Cross-roadmap citations resolved:
  - PrincipalAngles on main: README lines 57–58, 90, 418 and 434–437; `Suggested.lean` lines 7–8 and 43–44.
  - Majorization on main: `Suggested.lean` lines 6–7. Its open revision: README line 731.
  - PolarDecomposition: `Suggested.lean` lines 30 and 91.
  - SelfAdjointSpectralTheory on main: README line 787.
  - The family index of OperatorTheory, lines 37 and 110–111, is unchanged by this pull request and still consistent.
- Dependency check output: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`. The worker's automatic checks all passed, and a rerun at this head passed as well, with every scanner at 0. Nothing changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives no errors or warnings, only the six `#check` outputs. The elaborated type of `@familyIsometry` matches §2.1, and the file has no `sorry`, no `set_option` and no section `variable`s. Copies of two sets of statements also elaborate against the pins: the §2.1 sanity check with `_single`, and the two §3.1 routes.
- Ownership: no other roadmap, on main or in an open pull request, declares `familyIsometry` or a coordinate isometry. The only other roadmap that names one, CompactGroupsPartII, cites Mathlib's `HilbertBasis`.

Overlap check: read OperatorTheory (the index on main and at its open revision), Majorization (main and its open revision), OperatorIdeals (open revision), PrincipalAngles (main) and CompactGroupsPartII (open). Nothing is shared. The coordinate isometry and Gram rigidity are Tau Ceti's, the first four roadmaps cite this roadmap's OG labels, and CompactGroupsPartII cites Mathlib's `HilbertBasis`.

Source independence: changed passages only. Ten passages were compared with one source: the Chien–Waldron sentence of Layer 1, the reference entry, the two paragraphs and the route of §2.1, the sentence added to §3.1, summary lines 11–12 and 34–37, the scope paragraph, and the module and `familyIsometry` docstrings. The longest shared run is the seven-word hypothesis "finite sequences of vectors in Hilbert spaces", which the mathematics fixes. Largest share: ChienWaldron2016, 2 of 2 locators. Contents were not compared again, because no layer was added, removed or reordered.

Research link: Layer 1's Gram rigidity is the unitary-equivalence case that Chien and Waldron (2016, Theorem 2.2(1)) recall as the base of their characterisation of projective unitary equivalence of finite frames. The roadmap supplies Majorization, PrincipalAngles and SelfAdjointSpectralTheory. This rests on the README and ChienWaldron2016.

## Not verifiable

- The published version of Chien–Waldron (SIAM J. Discrete Math. 30, 2016) is paywalled, so its numbering was not compared with arXiv v1. The README now says that its locators refer to arXiv v1.
- The AIQ DKPS formalization was not searched for a counterpart of `familyIsometry`.

## Source issues

- **Misprint** in ChienWaldron2016 at Lemma 2.1, proof, p. 4 (arXiv v1): the source says that the second slot of the expanded inner product is the phase times the already rescaled vector; it should be the phase times the original vector vₖ; affects nothing.
- **Error** in ChienWaldron2016 at Theorem 2.2(1), pp. 4–5, with the definition on p. 2 (arXiv v1): the source says that equal Gramians give a unitary map between the two ambient Hilbert spaces; it should assume the sequences span (finite frames) or ask for a unitary between the spans, since `(1)` in `ℂ` and `(e₁)` in `ℂ²` admit none; affects nothing.

## For the human reviewers

- Scope: Tau Ceti at the pin proves every obligation of the version on main (OG-01–OG-11, OG-15, OG-18, OG-19; README lines 299–316). Of the remaining targets, the §3.1 criterion closes with one term at the pins and Parseval in three lines.
- Licence: `Suggested.lean` line 2 reads "Copyright (c) 2026 Kitware, Inc. All rights reserved." (as on main). README lines 409–410 say the Apache-2.0 AIQ DKPS formalization implements this material; whether `familyIsometry` was adapted from it was not checked.
