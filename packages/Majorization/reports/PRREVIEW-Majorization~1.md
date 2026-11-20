# Review of Majorization (pull request #2612 at 591e977)
Folder: `TauCetiRoadmap/OperatorTheory/Majorization/`
**Verdict:** accepted

**Summary.** Accepted with no finding: every theorem, Check and worked example was recomputed and holds, including the restated progress step of §1.2, and every cited library declaration exists at the pins with the README's hypotheses. There are five small corrections and two format notes, none blocking; the most important is that the README drops the old `MAJ-` labels with no old → new map, although three roadmaps on main and three open ones cite them. Left for the humans: the two declarations `Suggested.lean` keeps only for other roadmaps' acceptance files, and the fact that none of the five references could be read legally, so no locator was checked against its text.

## C01 — The old labels `MAJ-A01`–`MAJ-B46` are gone from the README with no map to the new sections, and six roadmaps cite them

After the merge, every citation of a `MAJ-` label points at a text that no longer contains it. On main:

- NoncommutativeIntegration cites `MAJ-A28` and `MAJ-A31` (README lines 67, 180–181, 343, 349, 448).
- ComplexHessianEquations cites `MAJ-A27` (line 15).
- PrincipalAngles cites `MAJ-B01`–`MAJ-B43` and `MAJ-B46` (lines 182, 244).

Among open pull requests:

- SpectralSteepestDescent (#2423) cites them at lines 73–76, 116, 148, 178, 241, 266 and 317.
- OperatorMonotoneFunctionsAndMatrixMeans (#2496) cites them at lines 135, 208–210 and 1076–1093.
- MeansMajorizationAndDiscreteInequalities (#2500) cites them at lines 57, 187, 193, 216, 715, 848 and 887.

The last two also say "Part A" and "Part B". The head README contains no `MAJ-` string. Add a short table whose header names the former numbering, for example after Conventions:

| Former labels | Section |
| --- | --- |
| `MAJ-A01`–`A06` | §1.1 |
| `MAJ-A07`–`A17` | §1.2 |
| `MAJ-A18`–`A25` | §1.3 |
| `MAJ-A26`–`A35` | §1.4 |
| `MAJ-A36`–`A40` | §1.5 |
| `MAJ-B01`–`B11` | §2.1 |
| `MAJ-B14`–`B21` | §2.2 |
| `MAJ-B44`–`B46` | §2.3 |
| `MAJ-B22`–`B29` | §2.4 |
| `MAJ-B30`–`B38` | §2.5 |
| `MAJ-B40`–`B43` | §2.6 |

Add one line saying that Part A is Layer 1 and Part B is Layer 2.

## C02 — The progress step of §1.2 is already proved in the pinned Tau Ceti, as a private theorem

The text sends an implementer to prove something the library already contains. These are the "Prove:" at line 182 and the sentence under Scope and ownership (lines 718–720) that lists the progress step as one of the two statements the library lacks. `TauCeti/Analysis/Convex/Majorization.lean` line 261 has `private theorem exists_robinHood_card_lt` with the same hypotheses: `d` antitone, prefix bounds, equal totals, `y ≠ d`. Its conclusion is the same too: an elementary transfer that keeps the prefix bounds and strictly lowers the number of disagreeing coordinates. It takes another route (the first coordinate where `y` and `d` differ, then the first later one where `y < d`). The transfer closure `TauCeti.mem_of_prefixSum_le_of_sum_eq` is proved from it at line 347. Say in §1.2 and in Scope that the step is proved privately there, so the target is to make it a public declaration.

## C03 — The second Check of §2.4 takes `A = C` and `B = D`, so the comparison it illustrates reads `N(X) ≤ N(X)`

The Check (line 580) holds for any statement whatever, so it cannot show that the block-sum comparison does any work. An instance where the hypotheses are strict: take `A = B = I` on `𝕜²` and `C = D = diag(2, 0)`. Then `Kₖ(I) = (1, 2, 2, …) ≤ Kₖ(diag(2, 0)) = (2, 2, 2, …)`. The comparison gives `‖I₄‖ = 1 ≤ 2` for the operator norm, `2 ≤ 2√2` for the Frobenius norm and `4 ≤ 4` for the nuclear norm, the last showing that constant one is attained. Bounding the blocks separately and adding gives `4` for the operator norm.

## C04 — Six sections cite Bhatia only as "Chapters II–IV"

Sections 1.1, 1.2, 1.4, 2.1, 2.3 and 2.5 (lines 107, 169–170, 276–277, 407, 510–511, 587–588) cite only this three-chapter range. A reader cannot find the source statement of, for instance, Ky Fan's maximum principle, the transfer step or the gauge representation. This matters most for the two README-only targets in §1.2 and §1.4. Would theorem or section numbers be given where the source states the result? Bhatia's Theorem IV.2.2, already cited in §2.2, is the model.

## C05 — The description does not say that the `MAJ-` labels are removed from the README

The description says only that "every old label `MAJ-Ann` or `MAJ-Bnn` lands in the section that carries its old subsection". It does not say that the labels no longer appear, or that NoncommutativeIntegration, ComplexHessianEquations and PrincipalAngles on main cite them. Would a sentence such as this be added: "The `MAJ-` labels are retired; the README maps them to the new sections in a table of former labels, which the citing roadmaps NoncommutativeIntegration, ComplexHessianEquations and PrincipalAngles follow"?

## N01 — In the second Check of §2.1 (line 460), "double every singular value" reads as multiplying by 2

The dilation repeats each singular value: `(1, 1, 0, 0)` against `(1, 0, 0, 0)`. Would "would repeat every singular value twice" be used instead?

## N02 — The *Needs:* line of §1.5 (lines 369–372) omits Tau Ceti's `Matrix.toLin_diagonal_apply_self`

The first bullet of §1.5 uses this lemma, and the supplier contracts list it under `TauCeti/Analysis/InnerProductSpace/SingularValues.lean`. Would it be added to that *Needs:* line?

## Questions for the author

- §2.2 cites Bhatia, Theorem IV.2.2 for the orbit-hull characterization, and §2.2–§2.4 state it for rectangular maps and for `𝕜 = ℝ`. Bhatia works with square complex matrices. Is there a source for the rectangular or real form, Mirsky 1960 perhaps? Neither text could be read legally (Springer and Oxford University Press paywalls).
- §1.5 and §2.3 call the gauge representation Mirsky's (Mirsky 1960). The square case is usually credited to von Neumann (1937). Would von Neumann be cited as well, with Mirsky for the rectangular form? Mirsky's paper could not be read, so what it proves is unconfirmed.

## Verified sound

| Statement | Instances tried | Values computed (README side / library or computed side) | Result |
| --- | --- | --- | --- |
| 1.1 weak majorization, elementary transfer | `x=(1,1)`, `y=(2,0)`; transfers of `(3,1)` | `P₁: 1≤2`, `P₂: 2≤2`; reverse `2>1` fails; `δ=1→(2,2)`, `δ=2→(1,3)`, `δ=3→(0,4)` outside `[1,3]²` | holds |
| 1.2 progress step (route) | `y=(3,0,0)`, `d=(1,1,1)`; `y=(1,1)`, `d=(½,½)` | steps `(2,1,0)` (prefix sums `2,3,3 ≥ 1,2,3`), then `d`; agreements `0,1,3`; unequal totals: only `δ=0` is allowed, no progress | holds; proof: `Pₗ(y)−Pₗ(d) ≥ yᵢ−dᵢ ≥ δ` on `(i,j]` |
| 1.2 transfer descent (headline) | `y=(0,1)` unsorted; `K={(1,1)}` | `P₁(y)=0` forces `z=0 ∈ K`; `(½,½) ∉ {(1,1)}`; library `mem_of_prefixSum_le` has no hypothesis on `y` | holds |
| 1.2 gauge monotonicity | `p=|x₀|+2|x₁|`; `ℓ¹, ℓ², ℓ∞` | `p(1,1)=3>2=p(2,0)`; symmetric gauges: `2≤2`, `√2≤2`, `1≤2` | holds |
| 1.3 forward Schur–Horn (headline) | `[[2,1],[1,2]]`; rotated projection; dim 0 | `d=(2,2)`, `λ=(3,1)`: `4=4`, `8≤10`, `|t−2|: 0≤2`; weights `cos²θ, sin²θ`, `cos⁴+sin⁴≤1`; empty sums `0≤0` | holds; library needs only `λᵢ ∈ s` |
| 1.4 Ky Fan principle and triangle (headline) | nilpotent `J`; shear `S`; `diag(1,0)+diag(0,1)` | `σ(J)=(1,0)`, eigenvalues `0,0`, `⟪e₀,Je₁⟫=1`; `⟪e₀,Se₀⟫=1≤(1+√5)/2`; `K₁: 1≤2`, `K₂: 2≤2`, coordinatewise `σ₁: 1>0` | holds; attainment needs `k≤dim E`, `k≤dim F` (library) |
| 1.4 singular pairs attain | `J`, `k=2>rank 1` | `u₁=0`, sum `1=K₂(J)`; `(u₀,u₁)` not orthonormal; `⟪uᵢ,uᵢ⟫=0` when `σᵢ=0` (`inner_leftSingularVector`) | holds |
| 1.4 trace inequality | `diag(3,1,−2)` | `(e₀,e₂)`: `1≤4`; `(e₀,e₁)`: `4` | holds |
| 1.5 diagonal models | `b=(1,−3,2)`; `diag(i,0)` over `ℂ` | `σ=(3,2,1,0,…)`, eigenvalues `(2,1,−3)`; `⟪De₀,e₀⟫=−i ≠ i` | holds |
| 2.1 rectangular seminorms, transport | entrywise `ℓ¹`; zero extension of `J` | `I→2`, rotation by `π/4` `→2√2`; Gram `diag(0,1,0,0)→(1,0,0,0)`; dilation Gram `diag(0,1,1,0)→(1,1,0,0)` | holds |
| 2.2 Fan dominance, orbit hull (headline) | `C=diag(2,0)`, swap `P`; real scalars | `(C+PCP)/2=I`; `K: (1,2)≤(2,2)`; `op 1≤2`, Frobenius `√2≤2`, nuclear `2≤2`; `K₁(C)=2>1`; `diag(2,−2)`, mass `2`: `4≤4`, `2≤4`; `J=BP` | holds; signed permutations are orthogonal, so `ℝ` case holds |
| 2.3 gauge representation, modulus | `σ=(3,1)`; `|J|`; `C=diag(1,0)`, `A=I` | gauges `3, √10, 4, 3`; `|J|=diag(0,1)`, Frobenius `1=1`; nuclear `1≤2`; `ofIsSymmetricGauge` with `n<p` (e.g. `|x₀|`) still subadditive by truncated majorization | holds |
| 2.4 block sums | `A=diag(3,1)`; Check with `A=C`, `B=D` | `σ(A⊕A)=(3,3,1,1)`, `K₂=6=2·3`, `K₄=8=2·4`; Check is `N(X)≤N(X)` (C03); replacement `1≤2`, `2≤2√2`, `4≤4` | holds; Check weak |
| 2.5 concrete seminorms | shear `S`; `I₂`; `J` | `∑‖Sbᵢ‖²=1+2=5/2+1/2=3`; `σ₀σ₁=1`, nuclear `√5≤√6`; `2=√2·√2`; `1=1·1` | holds |
| 2.6 planar models | `[[0,r],[r,0]]`, `[[0,0],[r,0]]`, `r=2,i`; shear | Gram `|r|²I→(|r|,|r|)`, `(|r|,0)`; `(2,2),(2,0),(1,1),(1,0)`; `t=3`, `δ=1`, `σ₀²=(3+√5)/2=((1+√5)/2)²` | holds |
| Suggested.lean `frobenius`, structure | elaborated types | `√(∑‖A bᵢ‖²)` equals `frobenius_apply` for any orthonormal basis (no `FiniteDimensional F` needed); `unitary (F →ₗ F)` is the same as `F ≃ₗᵢ F` in finite dimension | holds |

- Source locators checked against the text: 0 of 13 (none of the five references was readable).
- Library declarations: 195 README names elaborated together by `#check` at the pins, with no error. The 13 names in `ZeroExtension.lean` (lines 40–62) and `SingularValues/Planar.lean` (lines 68–203) were read in the source. Definitions opened at `Analysis/Convex/Majorization.lean` lines 95, 173, 243, 261, 338, 359 and 547, and at `UnitarilyInvariantSeminorm/Basic.lean` line 271. File placement was checked for every name in the Tau Ceti supplier contracts.
- Cross-roadmap citations resolved on main: PD-A51, PD-C08, PD-C18 and PD-C28 (PolarDecomposition README lines 254, 460, 485, 462); OG-01–OG-08 (OrthogonalGeometry lines 73–91); PA-B31, PA-B32 and PA-B34 (PrincipalAngles lines 270–276). The consumer claims were checked against NoncommutativeIntegration line 67, ComplexHessianEquations lines 15, 76 and 202, and PrincipalAngles lines 182, 244 and 436.
- The claim in `Suggested.lean` that its module docstring names rather than imports was checked: PolarDecomposition's `Suggested.lean` declares `LinearMap.IsPositive.sqrt` at line 91, which clashes with Tau Ceti's `Positive/SquareRoot.lean` line 68. `KyFan.lean` imports `SingularValues.lean`, which imports `Positive/SquareRoot`.
- No acceptance file on main or at an open head uses any of the 14 removed `Suggested.lean` declarations. The three importers use only `UnitarilyInvariantSeminorm` and `frobenius`, which are kept.
- Automatic checks: re-run, every one passes, including the targeted build. Dependency check output: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean` with `lake env lean`: no error and no warning. The `#check` types of both declarations match Convention 11.

Overlap check: read MeansMajorizationAndDiscreteInequalities, OperatorMonotoneFunctionsAndMatrixMeans, SpectralSteepestDescent, SchattenClassesAndSchurMultipliers, PolarDecomposition and PrincipalAngles. Weak majorization, transfers, symmetric gauges, Ky Fan sums and unitarily invariant seminorms are owned by Majorization; the first three roadmaps cite it as owner. The modulus and singular system are owned by PolarDecomposition, and permutation-orbit hulls and Davis's bound by PrincipalAngles. Nothing else is shared.

Source independence: 0 passages compared with source text, because none of the 5 sources is readable: Bhatia, Marshall–Olkin–Arnold and Mirsky are paywalled, the service refused the PubMed Central copy of Fan 1949, and Schur 1923 was not found. Largest share: Bhatia 1997, 8 of 13 locators. Contents were compared with Bhatia at chapter level from a public catalogue listing (Ch. II majorisation, Ch. III variational principles), and the roadmap is independent of them: its rectangular, certificate, block-sum, zero-extension and planar sections have no counterpart in that sequence, and the order majorization → Ky Fan sums → norms is forced by the *Needs:* lines of §1.4 (§1.2) and §2.2 (§1.4, §1.2).

Research link: Fan dominance and the symmetric-gauge representation of unitarily invariant norms (Fan 1949; Mirsky 1960) are the norm-transfer inputs that PrincipalAngles uses for Davis's eigenvalue-change bound and SpectralSubspacePerturbation for its sin Θ estimates; OperatorIdeals carries them to Schatten ideals. This rests on the README's Downstream consumers and References.

## Not verifiable

- Bhatia, *Matrix Analysis* (1997), Ch. II–IV and Theorem IV.2.2: Springer, paywalled; the sources service recorded it as uncertified.
- Marshall, Olkin and Arnold, *Inequalities* (2011), Theorem 9.B.1: Springer, paywalled; uncertified.
- Fan 1949, PNAS 35: the publisher page returned HTTP 403, and the PubMed Central PDF returned a login page to the service.
- Mirsky 1960, Quart. J. Math. 11: Oxford University Press, HTTP 403.
- Schur 1923, Sitzungsber. Berl. Math. Ges. 22: no legal copy found.
- The licence of the public formalizations named under Provenance was not checked; the repositories were not opened.

## Source issues

- none

## For the human reviewers

- `Suggested.lean` lines 73–112 keep a second carrier of `TauCeti.UnitarilyInvariantSeminorm` and a Frobenius function only because the acceptance files of PrincipalAngles, OperatorIdeals and SpectralSubspacePerturbation on main import this file. Retiring them needs changes to those three roadmaps.
- README Provenance (lines 699–704) credits `rjwalters/lean-genius` `SchurHornMajorization.lean`, which, as the README says, declares no licence. It also names the Apache-2.0 AIQ DKPS formalization. Neither was opened.
- Every headline theorem is a public Tau Ceti declaration at the pin. The README plans only two steps, one of which is proved privately (C02). Whether the roadmap moves to `Completed/` is the maintainers' decision.
- Not tested: Bhatia (8 of 13 locators) could not be read, so its wording and section-level contents were not checked.
