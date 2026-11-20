# Review of OrthogonalGeometry (pull request #2615 at dd6c846)
Folder: `TauCetiRoadmap/OperatorTheory/OrthogonalGeometry/`
**Verdict:** needs changes

**Summary.** Needs changes, for one finding. §2.1 plans `familyIsometry` as a new Tau Ceti declaration, but it is the pinned `Orthonormal.synthesisMapIsometry` with `ι = Fin d`, so OG-09–OG-11 end up with two owners. Every Check and example was recomputed and holds, `Suggested.lean` elaborates with no warnings, and the dependency check reports no upward supplier. There are two small corrections (one sentence of the summary, missing locators) and no format notes. The human reviewers have two questions: whether the roadmap should stay active, since every obligation of its version on main is now proved in Tau Ceti, and the Kitware copyright line.

## R01 (P2) — §2.1 plans as a new library declaration a map that the pinned Tau Ceti already defines, so OG-09–OG-11 have two owners

An implementer who follows §2.1 and Convention 8 (lines 71–72: declarations of this roadmap go under `TauCeti/Analysis/InnerProductSpace/`) would add to Tau Ceti a second definition of an existing map, and would prove again the two lemmas the pin already has for it. The README gives both declarations the same label: line 164 says of `familyIsometry` "This is OG-09", and the table at line 301 resolves OG-09 to `Orthonormal.synthesisMapIsometry`.

How I know: `TauCeti/Analysis/InnerProductSpace/Orthonormal/Family.lean` line 40 defines `synthesisMapIsometry (hv : Orthonormal 𝕜 v) : EuclideanSpace 𝕜 ι →ₗᵢ[𝕜] E` for every `[Fintype ι]`. It is built as `LinearMap.isometryOfOrthonormal` on `EuclideanSpace.basisFun ι 𝕜`, so with `ι = Fin d` it has the same construction and the same type as `familyIsometry`. Its `_apply` (line 59) and `_single` (line 69) are the first two bullets of §2.1. Against the pins, the third bullet, `familyIsometry hv = hv.synthesisMapIsometry`, closes by `ext; simp`. The only reason given for a separate map is a name clash between acceptance files (`Suggested.lean`, lines 26–31). The clash is real, but it lies in the acceptance files, not in the library. `Orthonormal/Family.lean` imports, through `Frame` and `SingularValues`, `Positive/SquareRoot.lean`, which declares `LinearMap.IsPositive.sqrt` (line 68). PolarDecomposition's `Suggested.lean` declares the same name (line 91), and PrincipalAngles' `Suggested.lean` imports both files.

The smallest change has four parts:
- Rewrite §2.1 to say that the coordinate isometry on `Fin d` is Tau Ceti's `Orthonormal.synthesisMapIsometry` with `ι = Fin d`.
- Say that `familyIsometry` in `Suggested.lean` is a local copy, kept under the name PrincipalAngles' acceptance file uses and not to be added to Tau Ceti. Keep its equality with the Tau Ceti map as its single statement, marked as a sanity check.
- Remove "This is OG-09" and the OG labels from the §2.1 heading, so that the table alone resolves those labels.
- Revise the description of §2.1 in the scope paragraph (lines 284–286) to match.

The Checks and Examples of Layer 2 can stay as they are.

## C01 — The summary says the layers build on Gram rigidity, but none of them uses it

Lines 11–12 call Gram rigidity "a theorem of Tau Ceti's inner-product library on which the layers below build". Line 38 says the three layers are independent. Layer 1's Dependencies (line 143) say that §1.1 uses only Mathlib's sesquilinearity lemmas, and neither §2.1 nor §3.1 needs a Gram-rigidity declaration. "Which the layers below complement" would be accurate.

## C02 — Two results carry no locator

The citation of Chien and Waldron (line 93 and the References) gives no locator. The statement is their Theorem 2.2(1), pp. 4–5 of arXiv:1312.5393v1 (also (1.1) on p. 2). The source states it for finite sequences of vectors and recalls it as well known, without proof. §3.1 gives no locator either, and unlike §1.1 it does not say that it needs none. One sentence would settle it: its route (finite Pythagoras and continuity of the norm) is the whole proof.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §1.1, `Finset` form | `ℂ`, `a = i`, `b = 1`, `φ = ψ = 1`; `s = ∅` | `⟪i, 1⟫ = −i`; `conj i · 1 · 1 = −i`; wrong conjugation gives `i`; empty: `0 = 0` | holds | none |
| §1.1, dependent family | `ℝ²`, `φ = ψ = (e₁, e₁ + e₂)`, `a = b = (1, −1)` | left `‖−e₂‖² = 1`; right `1 − 1 − 1 + 2 = 1`; diagonal only gives `3` | holds; Check correct | none |
| §1.1, order of arguments | `ℂ²`, `φ = ψ = (e₁, i e₁)`, `a = (1, 0)`, `b = (0, 1)` | left `i`; right `⟪φ₁, ψ₂⟫ = i`; swapped order `−i` | holds | none |
| Kernel equality (Tau Ceti) | `S = id` and `T = (i ·)` on `ℂ` | `⟪x, x⟫ = |x|² = ⟪ix, ix⟫`; both kernels `0` | holds, Rigidity.lean:45 | none |
| Range isometry (Tau Ceti) | `S = id`, `T = −id` on `ℝ`; `S = id`, `T = 2 id` | first: hypothesis holds, `x ↦ −x` isometric; second: `x²` vs `4x²`, hypothesis fails | holds, Rigidity.lean:53 | none |
| Ambient Gram rigidity, any `ι` | `ι = ∅`; `(e₁, 2e₁)` vs `(e₂, 2e₂)`; `ι = ℕ`, `vₙ = e₁`, `wₙ = e₂` | `W = id`; both Gram `[[1,2],[2,4]]`, swap works; all-ones Gram, swap works | holds, Rigidity.lean:142 | none |
| Gram-matrix characterization | `(e₁, e₂)` vs `(e₁, 2e₂)` in `ℝ²` | Gram `diag(1,1)` vs `diag(1,4)`; an isometry would send norm 1 to norm 2 | both directions hold, Rigidity.lean:156 | none |
| §2.1 `familyIsometry` | `d = 0`; `ℂ`, `d = 1`, `v₀ = 1`, `x = i·e₀` | zero map, range `{0}` = span of ∅; image `i`, conjugate variant `−i`; equals `Σ xⱼ vⱼ` = Tau Ceti map | true; duplicate of pinned map | R01 |
| §2.1 Check, unit vectors | `v₁ = v₂ = e₁`, `x = (1, −1)` | image `0`, `‖x‖ = √2` | Check correct | none |
| §2.1 Check, overlap matrix | `u = (e₁, e₂)`, `v` rotation by `θ` | entries `cos θ, −sin θ / sin θ, cos θ`; other order gives the transpose | correct | none |
| Layer 2 example in `ℂ²` | `v₁ = (1, i)/√2`, `v₂ = (1, −i)/√2` | `⟪v₁, v₂⟫ = (1 + (−i)(−i))/2 = 0`; `‖v₁‖² = 1`; image `((x₁+x₂)/√2, i(x₁−x₂)/√2)` | correct | none |
| §3.1 Parseval, no completeness | `ι = ∅`; `σ = (1, 0, 2)` on orthonormal triple; `ℓ²`, `vₙ = 2⁻ⁿ eₙ` | `0 = 0`; `5 = 1 + 0 + 4`; `‖x‖² = 4/3 = Σ 4⁻ⁿ`; unsquared `2` vs `2/√3` | holds; three-line Lean proof | none |
| §3.1 summability criterion | finitely supported sequences, `vₙ = eₙ/(n+1)`; `ℓ²`, `vₙ = eₙ/√(n+1)` | `Σ‖vₙ‖² = π²/6` yet no sum there; `Σ 1/(n+1) = ∞`, not summable | iff holds; completeness needed | none |
| §3.1 Check, independence | `(1, 0)`, `(1, 1)` in `ℝ²` | `‖(2, 1)‖² = 5` vs `1 + 2 = 3` | Check correct | none |
| Summary, lines 11–12 | the Needs lines of §1.1, §2.1, §3.1; line 38 | no Gram-rigidity declaration used by any target | sentence inaccurate | C01 |
| Chien–Waldron citation | arXiv v1, Theorem 2.2(1), pp. 4–5; (1.1), p. 2 | equal Gramians iff unitarily equivalent, finite sequences, recalled as known | supports the claim; no locator | C02 |

- Source locators checked: one source (ChienWaldron2016, arXiv:1312.5393v1), Theorem 2.2(1) at ChienWaldron2016 lines 128–137 and (1.1) at lines 42–46. The README itself gives no exact locator. The three sampled sections (§1.1, §2.1, §3.1) cite no source, so they were verified by computation and in Lean.
- Tau Ceti declarations opened at the pin: `Gram/Rigidity.lean` lines 45, 53, 71, 82, 91, 103, 123, 142, 156; `Orthonormal/Family.lean` lines 40, 59, 69, 76, 82; `InvariantSubspace.lean` lines 30–64; `Projection/Completeness.lean` lines 30–57; `OrthogonalFamily.lean` lines 37, 47; `Positive/SquareRoot.lean` line 68. None of these files contains `sorry`.
- Mathlib at the pin: 23 supplier names confirmed by `#check`. `Subspace.lean` lines 103 (`Orthonormal.orthogonalFamily`, orthonormal only), 156 and 212, and `GramMatrix.lean` line 72, were compared with the README's glosses, and they agree. No pinned statement of Parseval for a sum of pairwise-orthogonal vectors was found (`exact?` timed out).
- Cross-roadmap citations resolved:
  - Majorization: README line 383 on main; line 731 at its open revision, which no longer imports this acceptance file.
  - PrincipalAngles on main: README lines 56–58, 90, 418 and 437; `Suggested.lean` lines 43–44 use `familyIsometry`.
  - SelfAdjointSpectralTheory on main: README lines 787 and 1393.
  - PolarDecomposition: `Suggested.lean` line 91.
  - No roadmap cites the four Lean names this pull request removes.
- Dependency check output: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`. The worker's automatic checks all passed. The roadmap is on main and is not in the merge order.
- Elaboration: `lake env lean` on `Suggested.lean` gives no errors and no warnings. The elaborated type of `@familyIsometry` matches §2.1, the file has no section `variable`s, there are no `set_option`s and no sorry'd data, and the only import besides `Mathlib` is four `TauCeti.*` modules.
- One-tactic probes (on copies of the statements, elaborated against the pins):
  - the §3.1 criterion closes with one term (`orthogonalFamily_span_singleton` and `summable_iff_norm_sq_summable`);
  - Parseval needs three lines;
  - §1.1 is not closed by one `simp`;
  - the formula of `familyIsometry` and its equality with the Tau Ceti map close by `simp`.
  None of these is stated in `Suggested.lean`.
- Overlap check: read OperatorTheory (the index on main and at its open revision), Majorization (main and its open revision), OperatorIdeals (open revision) and PrincipalAngles (main). Nothing is shared: each assigns Gram rigidity, the coordinate isometry, reducing subspaces and orthogonal series to OrthogonalGeometry or Tau Ceti and consumes them. OperatorIdeals cites only Tau Ceti's lemma on singular values of maps to pairwise-orthogonal vectors.

Source independence: 7 passages compared with 1 source (summary ¶2, Layer 1 prose, §1.1, Layer 2 prose, §3.1, the `familyIsometry` docstring, the scope paragraph), none shared. Largest share: ChienWaldron2016, 2 of 2 citations, no exact locators. Contents compared with ChienWaldron2016 (§§1–6, on projective unitary equivalence and m-products): independent.

Research link: Layer 1's Gram rigidity is the unitary-equivalence case that Chien and Waldron (2016, Theorem 2.2(1)) recall as the base of their characterisation of projective unitary equivalence of finite frames. The roadmap supplies Majorization, PrincipalAngles and SelfAdjointSpectralTheory. This rests on the README and ChienWaldron2016.

## Not verifiable

- The published version of Chien–Waldron (SIAM J. Discrete Math. 30, 2016) is paywalled, so its theorem numbering was not compared with arXiv v1.
- The subdirectories of the AIQ DKPS formalization were not searched for a counterpart of `familyIsometry`.

## Source issues

- **Misprint** in ChienWaldron2016 at Lemma 2.1, proof, p. 4 (arXiv v1): the source says that the second slot of the expanded inner product is the phase times the already rescaled vector; it should be the phase times the original vector vₖ; affects nothing.

## For the human reviewers

- Scope: every obligation of the version on main (OG-01–OG-11, OG-15, OG-18, OG-19) is proved at the pinned Tau Ceti (README lines 292–306). Of the remaining targets, the §3.1 criterion closes with one term at the pins, and Parseval in three lines.
- Licence: `Suggested.lean` line 2 reads "Copyright (c) 2026 Kitware, Inc. All rights reserved." (as on main). README line 396 says the Apache-2.0 AIQ DKPS formalization implements this material. Whether `familyIsometry` was adapted from it was not checked.
