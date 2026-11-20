# Review of OrthogonalGeometry (pull request #2615 at 848620b)
Folder: `TauCetiRoadmap/OperatorTheory/OrthogonalGeometry/`
**Verdict:** accepted

**Summary.** Accepted: this was an incremental re-review of the 84 lines changed since `fbb2cb5`, and no finding remains. The one finding of the previous review is repaired: `Suggested.lean` now states the §1.1 expansion in both forms and Parseval's identity of §3.1 with `sorry`, each agreeing with its README statement, each true on the instances recomputed, and none closed by one tactic or by a lemma of the pinned libraries. There are no small corrections and no format notes. Two questions are left for the human reviewers (scope and a copyright line), as before.

## Previous findings

- R01 — repaired: `Suggested.lean` lines 53–58, 64–69 and 96–100 state `inner_sum_smul_sum_smul`, `inner_linearCombination_linearCombination` and `hasSum_norm_sq_of_pairwise_inner_eq_zero`; the docstring (lines 17–32) separates them from the Tau Ceti theorems pinned by `#check`; Convention 8 (README lines 70–72) is now true.

The repair introduced no new problem: the three names in code font in the README (lines 100, 105, 232) are declared in the file, the statements carry every binder in their own signatures, and the description of the pull request describes this head.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| `inner_sum_smul_sum_smul` (§1.1, sampled) | `ℂ`, `a = i`, `b = 1`, `φ = ψ = 1`; `ℝ²`, `φ = ψ = (e₁, e₁+e₂)`, `a = b = (1, −1)`; `s = ∅` | `⟪i,1⟫ = −i` = `conj i·1·1`; right-conjugated variant `i`. `‖−e₂‖² = 1` = `1−1−1+2`. Empty: `0 = 0` | true; elaborated type equals README line 103 | none |
| `inner_linearCombination_linearCombination` (§1.1) | `a = single i₀ i`, `b = single j₀ 1`, `φ = ψ = 1` in `ℂ`; `a = 0`; `ι ≠ κ` | `⟪i,1⟫ = −i` = `conj i·1·⟪1,1⟫`; `⟪0, y⟫ = 0` = empty sum; independent index types in signature | true; elaborated type equals README lines 108–109 | none |
| One-tactic probe, §1.1 (both forms) | `simp`; `simp` with `sum_inner`, `inner_sum`, `inner_smul_left`, `inner_smul_right`, `mul_assoc` (and the `Finsupp` lemmas); `exact?` | `simp` no progress; with lemmas a goal remains (sums in the other order, `b j` outside the inner sum); `exact?` finds no library lemma | not padding | none |
| `hasSum_norm_sq_of_pairwise_inner_eq_zero` (§3.1, sampled) | `ι = ∅`, `x = 0`; `(u₁, 0, 2u₃)`; `(1,0)`, `(1,1)` in `ℝ²`; `(e₀, e₁/2)` in finitely supported sequences | `0 = 0`; `5 = 1+0+4`; `5 ≠ 3` (orthogonality needed, and assumed); `5/4 = 1 + 1/4` with no completeness | true; proved in a probe without `[CompleteSpace E]` | none |
| One-tactic probe, §3.1 Parseval | `simp`; `exact?`; a four-line proof | `simp` no progress; `exact?` no library lemma; proof: `hx.norm.pow 2`, then congruence with Tau Ceti's finite Pythagoras | not padding; elaborated type equals README lines 232–233 | none |
| Module docstring, lines 17–32, and Convention 8 | declarations of the file; README lines 20–24, 70–72, 295–296 | file: 3 theorems with `sorry`, 1 `def` with a body, 6 `#check`; criterion named as one term from two pinned declarations, both present at the pins | agrees with README | none |
| Description of the pull request, "Suggested.lean" section | the three library names it gives as nearest statements | `Orthonormal.inner_finsupp_eq_sum_left` (one orthonormal family), `Matrix.star_dotProduct_gram_mulVec` (`GramMatrix.lean`:72, `[Fintype n]`, one family), `HilbertBasis.hasSum_norm_sq_inner` (Tau Ceti `Parseval.lean`:42) | all exist; all special cases | none |

The rows for the untouched statements (the Checks and examples of the three layers, Gram rigidity as cited, §2.1 and `familyIsometry`, the §3.1 criterion, the supplier glosses) stand as in the previous review, of `fbb2cb5`.

- Source locators checked against the text: the diff adds or changes none. The two locators of the README (ChienWaldron2016 lines 44–46, (1.1), p. 2; lines 128–137, Theorem 2.2(1), pp. 4–5) were read again and stand. Of the seeded sample, §1.1 and §3.1 say they need no source (sesquilinearity; a complete route from named declarations), which the probes confirm; §2.1 is untouched.
- Library declarations opened at the pin: Tau Ceti `OrthogonalFamily.lean`:37 and :47 (`orthogonalFamily_span_singleton`, `norm_sum_sq_eq_sum_norm_sq_of_pairwise_inner_eq_zero`), `Parseval.lean`:42; Mathlib `Analysis/InnerProductSpace/Basic.lean`:633 (`inner_sum_smul_sum_smul_of_sum_eq_zero`, a real, affine statement with weights summing to zero, not this target), `GramMatrix.lean`:72. No declaration of either pinned library has the name or the statement of one of the three new theorems.
- Cross-roadmap: the three new names occur in no other roadmap on main or at an open head; the citation check lists nothing unresolved; no id is dropped and no other open pull request changes this roadmap.
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`. The automatic checks all passed. Nothing changed outside the folder.
- Elaboration: `Suggested.lean` gives no error and three `sorry` warnings (lines 53, 64, 96), then the six `#check` outputs. The elaborated types of the four declarations were compared with §1.1, §2.1 and §3.1: all binders present, nothing changed.
- Headline theorems: §1.1 (both forms) and Parseval of §3.1 stated; the §3.1 criterion named in the docstring as one term from the pins and kept as a README target; Gram rigidity and the other supplier theorems pinned by `#check`.

Overlap check: read OperatorTheory (the family index), Majorization, OperatorIdeals and SpectralSubspacePerturbation (open), PrincipalAngles (main); nothing shared.

Source independence: changed passages only: 6 passages compared with 1 source (the three new docstrings, the two new paragraphs of the module docstring, the reworded Convention 8), none shared (ChienWaldron2016 states neither the expansion nor Parseval's identity); largest share ChienWaldron2016, 2 of 2 locators; no layer was added, removed or reordered, so the comparison of contents stands: independent.

Research link: Gram rigidity is the unitary-equivalence criterion that Chien and Waldron (2016, Theorem 2.2(1)) recall as the base case of their characterisation of projective unitary equivalence of finite frames; the roadmap supplies Majorization, PrincipalAngles and SelfAdjointSpectralTheory. Rests on the README and ChienWaldron2016.

## Not verifiable

- The published version of Chien–Waldron (SIAM J. Discrete Math. 30, 2016) is paywalled; its numbering was not compared with arXiv v1, which the README says its locators refer to.
- The AIQ DKPS formalization and the Mathlib pull request named in the References were not opened.

## Source issues

- **Error** in ChienWaldron2016 at Theorem 2.2(1), pp. 4–5, with the definition on p. 2 (arXiv v1): the source says that equal Gramians give a unitary map carrying one sequence to the other; it should assume the sequences span their spaces or ask for a unitary between the spans, since `(1)` in `ℂ` and `(e₁)` in `ℂ²` admit none; affects nothing.
- **Misprint** in ChienWaldron2016 at Lemma 2.1, proof, p. 4 (arXiv v1): the source says the second slot of the expanded inner product holds the phase times the already rescaled vector; it should be the phase times the original vector; affects nothing.

## For the human reviewers

- Scope: Tau Ceti at the pin proves every labelled item of the version on main except OG-04 (README lines 300–317). The remaining targets are §1.1 and §3.1; the §3.1 criterion is one term at the pins and Parseval a few lines.
- Licence: `Suggested.lean` line 2 reads "Copyright (c) 2026 Kitware, Inc. All rights reserved." (as on main); the README's References say the Apache-2.0 AIQ DKPS formalization implements this material. Whether `familyIsometry` was adapted from it was not checked.
