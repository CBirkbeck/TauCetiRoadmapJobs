# Review of OrthogonalGeometry (pull request #2615 at fbb2cb5)
Folder: `TauCetiRoadmap/OperatorTheory/OrthogonalGeometry/`
**Verdict:** needs changes

**Summary.** Needs changes, for one reason. The mathematics of the README is sound: every statement, Check and example was recomputed and holds, and every library and supplier name resolves at the pins. But the acceptance file states none of the roadmap's own theorems: the expansion of §1.1 and Parseval's identity of §3.1 are statable at the pins, are not in the pinned libraries, and are absent from `Suggested.lean`, whose docstring says the headline theorems are all Tau Ceti's. There are no small corrections and no format notes. Two questions are left for the human reviewers (scope and a copyright line).

## R01 (P2) — The roadmap's own headline theorems, the expansion of §1.1 and Parseval's identity of §3.1, are statable at the pins but `Suggested.lean` states neither, so the acceptance file tests nothing

The summary (lines 20–24) names three theorems as "the roadmap's own theorems", and the scope paragraph (lines 294–295) says "Its targets are the expansion of inner products of linear combinations (§1.1) and the summability criterion and Parseval's identity for pairwise-orthogonal families (§3.1)". `Suggested.lean` contains one `def` and six `#check` lines and no theorem, and its docstring (lines 17–24) says "The headline theorems are theorems of the pinned Tau Ceti … Every headline theorem is statable at the pins". An implementer who finishes §1.1 and §3.1 has nothing to be tested against, and the file contradicts the README about which theorems are the roadmap's. Convention 8 (lines 70–72), "the acceptance file `Suggested.lean` states them in `TauCetiRoadmap.OrthogonalGeometry`", is false for the same reason.

How I know. I elaborated the three statements against the pins, with only `import Mathlib` and the four Tau Ceti modules the file already imports:

- §1.1, finite-sum form, with `s : Finset ι`, `t : Finset κ`, `a : ι → 𝕜`, `b : κ → 𝕜`, `φ : ι → E`, `ψ : κ → E`: the statement elaborates as written at line 103. It is not a one-tactic consequence of the library: `simp` with `sum_inner`, `inner_sum`, `inner_smul_left`, `inner_smul_right`, `mul_assoc` leaves the interchange of the two sums, and `exact?` finds no library lemma (Mathlib's nearest, `inner_sum_smul_sum_smul_of_sum_eq_zero`, `Analysis/InnerProductSpace/Basic.lean`:633, is a different, real, affine statement). The `Finsupp.linearCombination` form (lines 107–108) elaborates too and is likewise not closed by one `simp`.
- §3.1, Parseval: `(hv : Pairwise fun i j ↦ ⟪v i, v j⟫_𝕜 = 0) (hx : HasSum v x) : HasSum (fun i ↦ ‖v i‖ ^ 2) (‖x‖ ^ 2)` elaborates with no `[CompleteSpace E]`. `simp` makes no progress and `exact?` finds no library lemma; the proof I checked takes two steps (`hx.norm.pow 2`, then Tau Ceti's finite Pythagoras under `HasSum`). Tau Ceti's `Parseval.lean` is about Hilbert bases only.
- §3.1, summability criterion: this one is a single term at the pins, `(TauCeti.orthogonalFamily_span_singleton hv).summable_iff_norm_sq_summable fun i ↦ ⟨v i, Submodule.mem_span_singleton_self (v i)⟩`, so it asks an implementer for nothing and need not be added.

The smallest change: add to `Suggested.lean`, with `sorry`, the §1.1 expansion (the `Finset` form, and the `Finsupp.linearCombination` form if both are meant as targets) and the `HasSum` form of Parseval's identity, each with a docstring and every binder in its own signature; and reword the docstring's second paragraph so that it distinguishes the Tau Ceti theorems pinned by `#check` from the roadmap's own headline theorems stated in the file. Convention 8 is then true as it stands. The criterion can stay a README target, since it is one term from the library.

## Previous findings

- C01 of the previous review (Convention 8 says `Suggested.lean` states this roadmap's declarations) — not repaired: the head is the one that review read, and lines 70–72 are unchanged. It is the same defect seen from the README's side as R01 above, and the repair of R01 removes it; it is not counted separately.
- The earlier R01, C01 and C02 (coordinate isometry is Tau Ceti's; "complement" in the summary; the Chien–Waldron locators) — repaired, confirmed again: lines 161–163, 11–12 and 93–95.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §1.1 expansion (sampled) | `ℂ`, `a = i`, `b = 1`, `φ = ψ = 1`; `ℝ²`, `φ = ψ = (e₁, e₁+e₂)`, `a = b = (1, −1)`; `s = ∅` | `⟪i,1⟫ = −i` = `conj i·1·1`; wrong conjugation `i`. `‖−e₂‖² = 1` = `1−1−1+2`; diagonal only `3`. Empty: `0 = 0` | holds; elaborates; not one tactic | R01 |
| §1.1 third Check (order of inner product) | `ℂ²`, `φ = ψ = (e₁, i e₁)`, `a = (1,0)`, `b = (0,1)` | `⟪e₁, i e₁⟫ = i` both sides; reversed order `⟪i e₁, e₁⟫ = −i` | true, separates | none |
| §1.1 `Finsupp` form | elaborated at pins | types agree with `Finsupp.sum_inner`, `Finsupp.inner_sum` (`M`-valued summands, any `Zero M`) | elaborates | R01 |
| Layer 1 examples | `(e₁, 2e₁)`, `(e₂, 2e₂)`; `(e₁, e₂)`, `(e₁, 2e₂)` | Gram `[[1,2],[2,4]]` both; `a₁b₁+2a₁b₂+2a₂b₁+4a₂b₂ = (a₁+2a₂)(b₁+2b₂)`; entries `1` vs `4` | true | none |
| Gram rigidity as cited (summary, Layer 1, contracts) | `#check` of `ker_eq_of_inner_self_eq`, `rangeEquivOfInnerEq`, `spanEquivOfInnerEq`, `eq_spanEquivOfInnerEq`, `exists_…_of_inner_eq`, `gram_eq_iff_…` | self inner products only for kernels; `v : ι → E`, `w : ι → F` for spans; `[FiniteDimensional 𝕜 E]`, `ι` arbitrary for ambient | prose equals signatures (`Gram/Rigidity.lean`:45–156) | none |
| §2.1 coordinate isometry (sampled) | `Orthonormal/Family.lean`:40, 59, 69, 76, 82; `ℂ`, `d = 1`, `x = i·e₀`; `d = 0` | `[Fintype ι]`; `a ↦ ∑ aᵢ • vᵢ`; `single i c ↦ c • vᵢ`; value `i`, conjugate variant `−i`; zero map | true | none |
| §2.1 Checks 1 and 3 | `v₁ = v₂ = e₁`, `x = (1,−1)`; `u = (e₁,e₂)`, `v` = rotated frame | image `0`, norm `√2` lost. Entries `⟪uᵢ,vⱼ⟫` = `[[cos θ, −sin θ],[sin θ, cos θ]]`; other order `[[cos θ, sin θ],[−sin θ, cos θ]]` | true | none |
| §2.1 example | `v₁ = (1,i)/√2`, `v₂ = (1,−i)/√2` | `⟪v₁,v₂⟫ = (1 + (−i)(−i))/2 = 0`; `(‖x₁+x₂‖² + ‖x₁−x₂‖²)/2 = ‖x₁‖²+‖x₂‖²` | true | none |
| `familyIsometry` and the name clash | elaborated type; PolarDecomposition `Suggested.lean`:30, 91; `Positive/SquareRoot.lean`:68; `Family` → `Frame` → `SingularValues` | type `Orthonormal 𝕜 v → EuclideanSpace 𝕜 (Fin d) →ₗᵢ[𝕜] E`; both declare `LinearMap.IsPositive.sqrt`; Majorization, PrincipalAngles import both files | real body, no lost binder; claim true | none |
| §3.1 Parseval (sampled) | `ι = ∅`; `(u₁, 0, 2u₃)`; `ℓ²`, `vₙ = 2⁻ⁿeₙ`; proof elaborated without completeness | `0 = 0`; `5 = 1+0+4`; `4/3 = 4/3`, while `∑‖vₙ‖ = 2 ≠ 2/√3` | true; two steps, not in library | R01 |
| §3.1 criterion | finitely supported sequences, `vₙ = eₙ/(n+1)`; `ι = ∅` | `∑ 1/(n+1)²` finite, limit `(1/(n+1))ₙ` not finitely supported, so no sum; both sides true for `∅` | true; completeness needed; one term at pins | none |
| §3.1 `tsum` consequence | incomplete space, squares summable, `v` not summable | `∑' v = 0` but `∑' ‖vᵢ‖² > 0`: the hypothesis `Summable v` is needed and is stated | true | none |
| §3.1 Check 2 and examples | `(1,0)`, `(1,1)`; `T = diag(3,0)` | `‖(2,1)‖² = 5 ≠ 3`; `‖Tx‖² = 9x₁²`; `∑ 1/(n+1)² = π²/6` | true | none |
| Supplier glosses | `#check` of 16 Mathlib and 7 Tau Ceti names | `ofCompleteSpace` needs `[CompleteSpace ↥K]`; `isClosed_of_hasOrthogonalProjection` has no completeness (`Projection/Completeness.lean`:30); `star x ⬝ᵥ gram *ᵥ y = ⟪∑ xᵢvᵢ, ∑ yᵢvᵢ⟫` | all glosses true | none |
| Module docstring of `Suggested.lean`, lines 17–24 | declarations of the file; README lines 20–24, 294–295 | file: 1 `def`, 0 theorems, 6 `#check`; README: own targets §1.1, §3.1 | contradicts README | R01 |

- Source locators checked against the text: 2 of 2 (ChienWaldron2016 lines 44–46, p. 2, (1.1); lines 128–137, pp. 4–5, Theorem 2.2(1), with "well known" at line 137).
- Library declarations opened at the pin: Tau Ceti `Gram/Rigidity.lean` (45, 53, 71, 82, 91, 103, 123, 142, 156), `Orthonormal/Family.lean` (40–90), `OrthogonalFamily.lean` (37, 47), `InvariantSubspace.lean` (30–64), `Projection/Completeness.lean` (30–57), `Parseval.lean`, `LinearCombination.lean`:32; 23 names confirmed by `#check`.
- Cross-roadmap citations resolved: PrincipalAngles on main (README 57–58, 90, 418, 434–437; `Suggested.lean` 7–8, 43–44), SelfAdjointSpectralTheory on main (README 787), Majorization (main README 383, open revision 738), the family index (lines 77–80, 111). Labels on main: OG-01–11, 15, 18, 19; all resolved by the heading of §1.1 or the table.
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`. The automatic checks all passed. Nothing changed outside the folder.
- Elaboration: `Suggested.lean` gives no error and no warning (it has no `sorry`), only the six `#check` outputs; `#check @familyIsometry` compared with §2.1, nothing changed. Two probe files elaborated for the one-tactic tests above.
- Ownership: no other roadmap on main or at an open head declares `familyIsometry`, the §1.1 expansion or Parseval for pairwise-orthogonal families.

Overlap check: read OperatorTheory (the family index), Majorization (main and its open revision), OperatorIdeals and SpectralSubspacePerturbation (open, searched for the shared objects), PrincipalAngles (main); nothing shared: the first, second and last cite this roadmap's labels, and Gram rigidity and the coordinate isometry are Tau Ceti's.

Source independence: 8 passages compared with 1 source (the Chien–Waldron sentence of Layer 1, the reference entry, the statements and routes of §1.1 and §3.1, the two paragraphs of §2.1, the two docstrings), none shared beyond the hypothesis "finite sequences of vectors in Hilbert spaces"; largest share ChienWaldron2016, 2 of 2 locators; contents compared with ChienWaldron2016: independent (its sections on triple products and frame graphs have no counterpart in the three layers).

Research link: Gram rigidity is the unitary-equivalence criterion that Chien and Waldron (2016, Theorem 2.2(1)) recall as the base case of their characterisation of projective unitary equivalence of finite frames; the roadmap supplies Majorization, PrincipalAngles and SelfAdjointSpectralTheory. Rests on the README and ChienWaldron2016.

## Not verifiable

- The published version of Chien–Waldron (SIAM J. Discrete Math. 30, 2016) is paywalled; its numbering was not compared with arXiv v1, which the README says its locators refer to.
- The AIQ DKPS formalization and the Mathlib pull request named in the References were not opened.

## Source issues

- **Error** in ChienWaldron2016 at Theorem 2.2(1), pp. 4–5, with the definition on p. 2 (arXiv v1): the source says that equal Gramians give a unitary map carrying one sequence to the other; it should assume the sequences span their spaces or ask for a unitary between the spans, since `(1)` in `ℂ` and `(e₁)` in `ℂ²` admit none; affects nothing.
- **Misprint** in ChienWaldron2016 at Lemma 2.1, proof, p. 4 (arXiv v1): the source says the second slot of the expanded inner product holds the phase times the already rescaled vector; it should be the phase times the original vector; affects nothing.

## For the human reviewers

- Scope: Tau Ceti at the pin proves every labelled item of the version on main except OG-04 (README lines 299–316). The remaining targets are §1.1 and §3.1; the §3.1 criterion is one term at the pins and Parseval two steps.
- Licence: `Suggested.lean` line 2 reads "Copyright (c) 2026 Kitware, Inc. All rights reserved." (as on main); README lines 409–410 say the Apache-2.0 AIQ DKPS formalization implements this material. Whether `familyIsometry` was adapted from it was not checked.
