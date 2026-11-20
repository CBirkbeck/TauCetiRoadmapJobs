# Review of Majorization (pull request #2612 at 591e977)
Folder: `TauCetiRoadmap/OperatorTheory/Majorization/`
**Verdict:** accepted

**Summary.** Accepted with no finding: every theorem, Check and worked example was recomputed and holds, the route of the progress step in §1.2 and the singular-pair statement of §1.4 were proved by hand, and every library declaration the README cites exists at the pins with the hypotheses the README gives. There are five small corrections and two format notes, none blocking; the head is the one the previous review read, so its remarks all still apply, the main one being that the old `MAJ-` labels are gone with no map although roadmaps on main cite them. For the humans: the two declarations kept in `Suggested.lean` for other roadmaps' acceptance files, and the fact that none of the five references could be read legally.

## C01 — The labels `MAJ-A01`–`MAJ-B46` are gone from the README with no map to the new sections, and other roadmaps cite them

After the merge a citation of a `MAJ-` label points at a text that no longer contains it. The head README has no `MAJ-` string. On main, NoncommutativeIntegration cites `MAJ-A28` and `MAJ-A31` (README lines 67, 180–181, 343, 349, 448), ComplexHessianEquations cites `MAJ-A27` (line 15), and PrincipalAngles cites `MAJ-B01`–`MAJ-B43` and `MAJ-B46` (lines 182, 244). At open heads, OperatorIdeals cites `MAJ-A26`, `MAJ-B01` and `MAJ-B31` (lines 84, 308, 374 and later), SpectralSteepestDescent cites `MAJ-A26`, `A28`, `A31`, `B01`, `B21`, `B30`–`B37` (from line 73), and OperatorMonotoneFunctionsAndMatrixMeans and MeansMajorizationAndDiscreteInequalities cite labels together with "Part A" and "Part B".

A short table whose header names the former numbering would keep all of these valid, for example after Conventions. Read off the subsections of the README on main, it is:

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

with one line saying that Part A is Layer 1 and Part B is Layer 2.

## C02 — The progress step of §1.2 is already proved in the pinned Tau Ceti, as a private theorem

The "Prove:" at line 182, and the sentence under Scope and ownership (lines 718–720) that names the progress step as one of two statements the library lacks, send an implementer to prove what the library contains. `TauCeti/Analysis/Convex/Majorization.lean` line 261 has `private theorem exists_robinHood_card_lt` with the same hypotheses (`d` antitone, the prefix bounds, equal totals, `y ≠ d`) and the same conclusion (an elementary transfer that keeps the prefix bounds and strictly lowers the number of coordinates where `y` and `d` differ); the transfer closure at line 338 is proved from it. It chooses the coordinates differently (the first coordinate where `y` and `d` differ, where `y` is the larger). Say in §1.2 and in Scope that the step is proved privately there, so that the target is to make it a public declaration.

## C03 — The second Check of §2.4 takes `A = C` and `B = D`, so the comparison it illustrates reads `N(X) ≤ N(X)`

The Check at line 580 is true (`‖I₂‖ = 1`, and the triangle inequality gives `2`), but the block-sum comparison does no work in it: its two sides are the same map. An instance with strict hypotheses: `A = B = I` on `𝕜²` and `C = D = diag(2, 0)`. Then `Kₖ(I) = (1, 2, 2, …) ≤ Kₖ(diag(2, 0)) = (2, 2, 2, …)`, and the comparison gives `1 ≤ 2` for the operator norm, `2 ≤ 2√2` for the Frobenius seminorm and `4 ≤ 4` for the nuclear seminorm, the last showing that constant one is attained; bounding the two blocks separately and adding gives `4` for the operator norm.

## C04 — Six sections cite Bhatia only as "Chapters II–IV"

Sections 1.1, 1.2, 1.4, 2.1, 2.3 and 2.5 (lines 107, 169–170, 276–277, 407, 510–511, 587–588) give a three-chapter range as their only locator into that book, so a reader cannot find the source statement of, say, the transfer step, Ky Fan's maximum principle or the gauge representation. This matters most for the two targets that are not library declarations (§1.2 and §1.4). Would theorem or section numbers be given where the book states each result, as §2.2 does with Theorem IV.2.2?

## C05 — The description does not say that the `MAJ-` labels are removed from the README

The description says "every old label `MAJ-Ann` or `MAJ-Bnn` lands in the section that carries its old subsection", which reads as if the labels survive. They do not appear at the head, and roadmaps on main cite them (C01). Would a sentence be added such as: "The `MAJ-` labels are retired; the README maps them to the new sections in a table of former labels, which NoncommutativeIntegration, ComplexHessianEquations and PrincipalAngles follow"?

## N01 — In the second Check of §2.1 (line 459), "double every singular value" reads as multiplying by 2

The dilation repeats each singular value, `(1, 1, 0, 0)` against `(1, 0, 0, 0)`. Would "repeat every singular value twice" be used?

## N02 — The *Needs:* line of §1.5 (lines 369–372) omits three Tau Ceti lemmas its bullets use

`Matrix.toLin_diagonal_apply_self`, `LinearMap.exists_linearIsometryEquiv_eq_comp_toLin_diagonal_comp` and `LinearMap.diagonalSum_add` are cited in the bullets and listed in the supplier contracts, but not on that line.

## Questions for the author

- §2.2 cites Bhatia, Theorem IV.2.2 for the statement that Ky Fan domination is exactly orbit-hull membership, and §2.2–§2.4 state it for rectangular maps and for `𝕜 = ℝ`. As far as I recall, that theorem is the norm inequality (Fan dominance) for square complex matrices. Is there a locator for the hull characterization itself, and for the rectangular or real form? The book is paywalled, so I could not check.
- §1.4 cites Fan 1949 for the Ky Fan sums of singular values and their triangle inequality. Is the singular-value maximum principle in that note, or in Fan's 1951 note in the same journal (vol. 37)? The publisher page refused access and the open-archive copy returned only a download page.
- §1.5 and §2.3 call the gauge representation Mirsky's. The square case is usually credited to von Neumann (1937); would he be cited as well? Mirsky's paper could not be read.

## Verified sound

| Statement | Instances tried | Values computed (README side / library or computed side) | Result |
| --- | --- | --- | --- |
| 1.1 weak majorization, elementary transfer | `x=(1,1)`, `y=(2,0)`; `(½,½)` vs `(1,1)`; transfers of `(3,1)` | `P: 1≤2, 2≤2`; reverse `2>1`; totals `1, 2`; `δ=1→(2,2)`, `δ=2→(1,3)`, `δ=3→(0,4)` off the segment | holds |
| 1.2 progress step (target) | `y=(3,0,0)`, `d=(1,1,1)`; `y=(1,1)`, `d=(½,½)` | route gives `(2,1,0)` (prefixes `2,3,3 ≥ 1,2,3`), then `d`; agreements `0,1,3`; unequal totals `2≠1` | holds; proof: `yᵢ−yⱼ=(yᵢ−dᵢ)+(dᵢ−dⱼ)+(dⱼ−yⱼ)≥δ`, `Pₗ(y)−Pₗ(d)≥yᵢ−dᵢ≥δ` for `i<l≤j` |
| 1.2 transfer descent (headline) | `K={(1,1)}`; `n=0` | `(½,½)∉K` without sign invariance; library `mem_of_prefixSum_le` asks nothing of `y`; empty tuple trivial | holds |
| 1.2 gauge monotonicity (headline) | `p=|x₀|+2|x₁|`; `ℓ¹, ℓ², ℓ∞` | `p(1,1)=3>2=p(2,0)`; `2≤2`, `√2≤2`, `1≤2` | holds |
| 1.3 forward Schur–Horn (headline) | rotated projection; `[[2,1],[1,2]]` | weights `[[c²,s²],[s²,c²]]`, `c⁴+s⁴≤1`, unsquared row sum `√2`; `4=4`, `8≤10`, `0≤2` | holds; library asks only `λᵢ∈s` |
| 1.4 Ky Fan principle and triangle (headline) | nilpotent `J`; `diag(1,0)+diag(0,1)`; `diag(3,1,−2)` | `σ(J)=(1,0)`, `⟪e₀,Je₁⟫=1`; `K₁: 1≤2`, `K₂: 2≤2`, `σ₁: 1>0`; `1≤4`, `4=4` | holds; attainment needs `k≤dim E`, `k≤dim F` (library) |
| 1.4 singular pairs attain (target) | `J`, `k=2>rank 1`; general `A` | `⟪uᵢ,Avᵢ⟫=σᵢ‖uᵢ‖²=σᵢ` (norm `1` iff `σᵢ≠0`); `u₁=0`, sum `1=K₂(J)`, not orthonormal | holds |
| 1.5 diagonal models | `b=(1,−3,2)`; `diag(i,0)` | `σ=(3,2,1,0,…)`, eigenvalues `(2,1,−3)`; `⟪De₀,e₀⟫=−i≠i`; `diagonalSum e e x = diag(x)` | holds |
| Layer 1 Examples | shear `S`; `2J` | `S†S=[[1,1],[1,2]]`, `σ²=(3±√5)/2`, `K₂=√5`, `1≤1.618`; `σ(2J)=(2,0)` | holds |
| 2.1 rectangular seminorms, transport | entrywise `ℓ¹`; zero extension and dilation of `J` | `2` at `I`, `2√2` at rotation by `π/4`; `(1,0,0,0)` against `(1,1,0,0)` | holds |
| 2.2 orbit hull, Fan dominance (headline) | `C=diag(2,0)`, swap `P`; `diag(2,−2)`; `J=BP`; `n=1`, `𝕜=ℝ` | `(C+PCP)/2=I`; `1≤2`, `√2≤2`, `2≤2`; mass `2`: `4≤4`, `2≤4`; hull of `{±1}` is `[−1,1]` | holds |
| 2.3 gauge representation, modulus (headline) | `σ=(3,1)`; `|J|`; `C=diag(1,0)`, `A=I` | gauges `3, √10, 4, 3`; `|J|=diag(0,1)`, Frobenius `1=1`; nuclear `1≤2` | holds |
| 2.4 block sums (headline) | `A=diag(3,1)`; Check with `A=C`, `B=D`; replacement | `σ(A⊕A)=(3,3,1,1)`, `K₂=6`, `K₄=8`; Check is `1≤1`; replacement `1≤2`, `2≤2√2`, `4≤4` | holds; Check weak (C03) |
| 2.5 concrete seminorms (headline) | shear `S`; `I₂`; `J` | `1+2=5/2+1/2=3`; `σ₀σ₁=1`, `‖S‖₁=√5≤√6`; `2=√2·√2`; `1=1·1`, `1≤√2` | holds |
| 2.6 planar models | `[[0,r],[r,0]]`, `[[0,0],[r,0]]`, `r=2, i`; shear | `(2,2)`, `(2,0)`, `(1,1)`, `(1,0)`; `t=3`, `δ=1`, `σ₀²=(3+√5)/2` | holds; library formulas take real parts of trace and determinant |
| `Suggested.lean`: structure, `frobenius` | elaborated types against Convention 11 | `√(∑‖A bᵢ‖²)` equals `frobenius_apply` at the standard basis; no finite dimension of `F` on either side | holds |

- Source locators checked against the text: 0 of 13 (no reference was readable).
- Library declarations: 203 library names of the README elaborated in one file by `#check` at the pins; 190 resolve, and the 13 that do not are the declarations of `ZeroExtension.lean` (lines 40–51) and `SingularValues/Planar.lean` (lines 68–203), whose modules are not built in this checkout and which were read in the source. Definitions opened in `Analysis/Convex/Majorization.lean` at lines 95, 173, 243, 261, 338, 359, 547, in `DiagonalSum.lean` at line 46, in `UnitarilyInvariantSeminorm/Basic.lean` at lines 271 and 428, and in `KyFan.lean` at line 305.
- Cross-roadmap citations resolved on main: `PD-A51`, `PD-C08`–`PD-C18`, `PD-C28` (PolarDecomposition README lines 254, 460–485); `OG-01`–`OG-08` (OrthogonalGeometry lines 73–91, 129); `PA-B31`, `PA-B32`, `PA-B34` (PrincipalAngles lines 270–276). Consumer claims checked against NoncommutativeIntegration line 67, ComplexHessianEquations lines 15, 76, 202, PrincipalAngles line 436 and SpectralSubspacePerturbation line 19.
- `Suggested.lean` has no sorried declaration, so the one-tactic probe has nothing to try. The three acceptance files that import it use only `Majorization.UnitarilyInvariantSeminorm` and `Majorization.frobenius`, both kept.
- The description's count of 29 Checks, two to four per section, agrees with the head.
- Automatic checks: every one passed, including the targeted build of this file and its three importers. Dependency check output: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean` with `lake env lean`: no error and no warning; the three `#check` lines print the statements of §1.2 and §1.3.
- Previous review at the same head: no finding to repair; its five small corrections and two format notes are not taken up (the folder has not changed) and are restated above.

Overlap check: read MeansMajorizationAndDiscreteInequalities, OperatorIdeals, SpectralSteepestDescent, OperatorMonotoneFunctionsAndMatrixMeans, SchattenClassesAndSchurMultipliers, PolarDecomposition and PrincipalAngles. Weak majorization, transfers, symmetric gauges, Ky Fan sums and unitarily invariant seminorms are owned by Majorization and the first four cite it as owner; the modulus and singular system are PolarDecomposition's; the permutation-orbit hull and Davis's bound are PrincipalAngles'. Nothing else is shared.

Source independence: 0 passages compared with 0 sources, because none of the 5 references could be read (Bhatia, Marshall–Olkin–Arnold and Mirsky are paywalled, Fan 1949 returned no text, Schur 1923 was not found); largest share Bhatia 1997, 8 of 13 locators; contents not compared with Bhatia from its text. The order majorization → Ky Fan sums → seminorms is forced by the *Needs:* lines of §1.4 (§1.2) and §2.2 (§1.2, §1.4, §1.5).

Research link: Fan dominance and the symmetric-gauge representation of unitarily invariant norms (Fan 1949; Mirsky 1960; Bhatia 1997) are the norm-transfer inputs for PrincipalAngles' eigenvalue-perturbation estimates, SpectralSubspacePerturbation's block comparisons and OperatorIdeals' Schatten norms; this rests on the README's Downstream consumers and References, not on a source read.

## Not verifiable

- Bhatia, *Matrix Analysis* (1997), Chapters II–IV and Theorem IV.2.2: Springer, paywalled; the sources service records it as uncertified.
- Marshall, Olkin and Arnold, *Inequalities* (2011), Theorem 9.B.1: Springer, paywalled; uncertified.
- Fan 1949, Proc. Nat. Acad. Sci. 35: the publisher page returned HTTP 403, the Europe PMC copy HTTP 403, and the PubMed Central PDF address returned a download page with no text.
- Mirsky 1960, Quart. J. Math. 11: Oxford University Press, HTTP 403.
- Schur 1923, Sitzungsber. Berl. Math. Ges. 22: no legal copy found.
- The two public formalizations named under Provenance were not opened.

## Source issues

- none

## For the human reviewers

- `Suggested.lean` lines 73–112 keep a second carrier of `TauCeti.UnitarilyInvariantSeminorm` and a Frobenius function only because the acceptance files of PrincipalAngles, OperatorIdeals and SpectralSubspacePerturbation import this file; it states no theorem of its own.
- Every headline theorem is a public Tau Ceti declaration at the pin; of the two remaining targets one is proved privately (C02). Whether the roadmap moves to `Completed/` is the maintainers' decision.
- Licence: README Provenance (lines 699–704) credits a proof strategy to `rjwalters/lean-genius`, `SchurHornMajorization.lean`, which the README says declares no licence. Neither that file nor the Apache-2.0 AIQ DKPS formalization was opened.
- Not tested: Bhatia (8 of 13 locators) could not be read, so neither the wording nor the arrangement was compared with its text or its table of contents.
