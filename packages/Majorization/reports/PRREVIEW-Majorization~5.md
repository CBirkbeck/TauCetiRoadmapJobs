# Review of Majorization (pull request #2612 at 26b053c)
Folder: `TauCetiRoadmap/OperatorTheory/Majorization/`
**Verdict:** accepted

**Summary.** Accepted with no finding: this is an incremental re-review of the 83 lines changed since `624ab6c`, together with the pull request's description. The three small corrections of the previous review are repaired, and the repairs are correct at the pins: the two newly named supplier declarations exist, state what the README says, and are used where the README says. One small correction (a sentence of the description about the Dependencies paragraphs) and one format note (carried over) remain, neither blocking. For the humans: no cited source could be read, so the new section locators into Bhatia are unverified.

## C01 — The description says the Dependencies of both Parts name both suppliers; each names one of the two contracts

The description's record says: "The `*Needs:*` lines of §1.4 (for `PD-A50`) and of §2.2 and §2.3 (for `OG-07`), and the Dependencies of both Parts, name the two." At this head the Dependencies of Part A (README lines 516–522) name the eigenbasis expansion of PolarDecomposition Part A and the singular system, and do not mention OrthogonalGeometry; the Dependencies of Part B (lines 896–902) name `OG-07` and PolarDecomposition's modulus, not `PD-A50`. That is the right distribution, since Gram rigidity enters only in Part B. The sentence would be right as: "…and the Dependencies of Part A (the eigenbasis expansion) and of Part B (`OG-07`) name them."

## N01 — In the second Check of §2.1 (line 605), "double every singular value" reads as multiplying by 2

The dilation repeats each singular value, `(1, 1, 0, 0)` against `(1, 0, 0, 0)`. Would "repeat every singular value twice" be used?

## Questions for the author

No cited text could be read, so these stay questions, as in the previous review.

- §2.2 cites Bhatia, Theorem IV.2.2 for "Ky Fan domination is exactly orbit-hull membership", for rectangular maps and for `𝕜 = ℝ`. Is that theorem the hull characterization, or the norm inequality for square complex matrices, with the hull statement elsewhere in the book?
- §1.4 cites Fan 1949 for the Ky Fan sums of singular values. Is the singular-value maximum principle in that note, or in Fan's 1951 note in the same journal (vol. 37)?
- §1.5 and §2.3 call the gauge representation Mirsky's. The square case is usually credited to von Neumann (1937); would he be cited as well?

## Previous findings

The previous review, of `624ab6c`, had no finding; its small corrections and format note are accounted for here.

- C01 — repaired: the six sections now cite "§II.1 … §IV.1", "Chapter III … §IV.2", "§IV.2" (lines 121–122, 197–198, 355–356, 542, 677, 781); no "Chapters II–IV" remains. The locators themselves could not be checked against the book.
- C02 — repaired: `PD-A50` is in the *Needs:* of §1.4 (lines 431–433), `OG-07` in those of §2.2 and §2.3 (lines 658–659, 708–710), both in the Dependencies, the scope (lines 953–961) and the Tau Ceti contract (lines 1009–1015); the scope bullet is headed "Gram rigidity".
- C03 — repaired: the description's list now has "MAJ-A28, MAJ-A36, MAJ-A39, MAJ-B40 and MAJ-B41 are stated for `𝕜`-valued data or with the modulus".
- N01 — not repaired: "would double every singular value" (line 605); written again as N01.

## Verified sound

| Statement | Instances tried | Values computed (README side / library or computed side) | Result |
| --- | --- | --- | --- |
| Eigenbasis expansion `Re⟪T x, x⟫ = ∑ᵢ λᵢ ‖⟪vᵢ, x⟫‖²` (contract, `PD-A50`) | `T=[[2,1],[1,2]]`, `x=e₀`; `x=(1,1)/√2`; `T=0` | `2 = 3·½ + 1·½`; `3 = 3·1 + 1·0`; `0=0`. Library `CourantFischer.lean` 152: same, coordinates `repr x i` | holds; agrees with `PD-A50` on main |
| MAJ-A27 through it (*Needs:* of §1.4) | same `T`, `k=1`, `u=e₀`; `k=2` | `⟪Te₀,e₀⟫=2 ≤ λ₀=3`; trace `4 = 3+1`. Used at `KyFan.lean` 498 inside `sum_re_inner_apply_self_le_sum_eigenvalues` (489) | holds; citation is the one the proof uses |
| Ambient Gram rigidity (contract, `OG-07`) | `v=(e₀,e₀)`, `w=(e₁,e₁)`; `v=(e₀,e₁)`, `w=(e₀,e₀)`; shift on `ℓ²` | Gram `[[1,1],[1,1]]` both, swap carries; Gram `I` vs all-ones, no isometry; shift is not surjective, so finite dimension is needed and is stated | holds; `Gram/Rigidity.lean` 142 has `[FiniteDimensional 𝕜 E]` |
| Diagonal model independent of orthonormal families up to unitaries (Summary, scope) | `x=(2,0)`, `(e₀,e₁)` vs `(e₁,e₀)`; non-orthonormal `v'=(2e₀,e₁)` | `diag(2,0)` vs `diag(0,2) = P diag(2,0) P`; `diag(4,0)` has `σ=(4,0)≠(2,0)` | holds for orthonormal families, as `DiagonalSum.lean` 118 assumes |
| MAJ-B20 and the gauge of MAJ-B44 rest on it (*Needs:* of §2.2, §2.3) | call sites at the pin | `FanDominance.lean` 116 (file of `mem_twoSidedUnitaryOrbitHull_iff_kyFanSum_le`); `UnitarilyInvariantSeminorm/Gauge.lean` 102 | attribution correct |
| Description against the head | counts, lists, sections | labels `40+1+2+4+32=79`, 79 bold labels at head; eleven conventions, Convention 10 is the Frobenius definition; three `#check` lines; two declarations kept | agrees, except C01 |

The rows for the statements the change does not touch stand as in the previous review, of `624ab6c`.

- Source locators checked against the text: 0 of the 7 changed locators (Bhatia §II.1, Chapter III, §IV.1, §IV.2); the book is not readable (see Not verifiable).
- Library declarations opened at the pinned Tau Ceti: `Analysis/InnerProductSpace/CourantFischer.lean` 152; `Analysis/InnerProductSpace/Gram/Rigidity.lean` 142; `Analysis/InnerProductSpace/DiagonalSum.lean` 118–127; `Analysis/InnerProductSpace/KyFan.lean` 10 (import), 489–498; `Analysis/InnerProductSpace/FanDominance.lean` 116; `Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/Gauge.lean` 8, 102.
- Cross-roadmap citations resolved on main: PolarDecomposition `PD-A50` (README line 252, "Eigenbasis quadratic form", milestone A7); OrthogonalGeometry `OG-07` (line 88, "Ambient Gram rigidity"), milestone `OG-01`–`OG-08` (line 129).
- Record: both Parts and all 79 labels present at the head; the change adds, removes and reorders no layer or item.
- Changes outside the folder: none. Overlaps: no other open pull request changes this roadmap; no cited id is dropped; no id of main is dropped.
- Automatic checks: all passed on this head. Dependency check output: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean` with `lake env lean`: no error and no warning; the three `#check` lines print transfer descent, gauge monotonicity and forward Schur–Horn. The file is unchanged since `624ab6c` and has no sorried declaration, so the one-tactic probe has nothing to try; the elaborated types of the structure and of `frobenius` carry every binder of their signatures.

Overlap check: read EigenvalueAndSingularValueInequalities, MeansMajorizationAndDiscreteInequalities, SpectralSteepestDescent, OperatorIdeals, SpectralSubspacePerturbation, PrincipalAngles, PolarDecomposition and OrthogonalGeometry (as in the previous review; the change adds no object). The eigenbasis expansion is PolarDecomposition's (`PD-A50`) and Gram rigidity is OrthogonalGeometry's (`OG-07`); both are cited, not restated. Nothing has two owners.

Source independence: changed passages only; 0 passages compared with 0 sources, since Bhatia 1997, the only source the changed passages cite, could not be read; largest share Bhatia 1997, 16 of 23 locators; contents not compared (the change adds, removes and reorders no layer).

Research link: Fan dominance and the symmetric-gauge representation of unitarily invariant norms (Fan 1949; Mirsky 1960; Bhatia 1997) are the norm-transfer inputs for PrincipalAngles' and SpectralSubspacePerturbation's perturbation estimates, OperatorIdeals' Schatten norms and the open EigenvalueAndSingularValueInequalities; this rests on the README's Downstream consumers and References, not on a source read.

## Not verifiable

- Bhatia, *Matrix Analysis* (1997), §II.1, Chapter III, §IV.1, §IV.2 and Theorem IV.2.2: recorded as cited by locator only; no legal copy to read.
- Marshall, Olkin and Arnold, *Inequalities* (2011), Theorem 9.B.1: recorded as cited by locator only.
- Fan 1949, Mirsky 1960, Schur 1923: not read, as in the previous review.

## Source issues

- none

## For the human reviewers

- `Suggested.lean` lines 73–112 keep a second carrier of `TauCeti.UnitarilyInvariantSeminorm` and a Frobenius function only because the acceptance files of PrincipalAngles, OperatorIdeals and SpectralSubspacePerturbation use them; the file states no theorem of its own.
- Every headline theorem is a public Tau Ceti declaration at the pin; the two remaining targets are the progress step MAJ-A14 (private in the library) and the singular-pair attainment in MAJ-A29. Whether the roadmap moves to `Completed/` is the maintainers' decision.
- Licence: README Provenance (lines 925–932) credits a proof strategy to `rjwalters/lean-genius`, `SchurHornMajorization.lean`, which the README says declares no licence. That file was not opened.
- Not tested: Bhatia 1997 (16 of 23 locators, including every locator this change adds) could not be read, so neither the new section numbers, the wording nor the arrangement was compared with the book; the same holds for the other four references.
