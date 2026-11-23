# Review of Majorization (pull request #2612 at 624ab6c)
Folder: `TauCetiRoadmap/OperatorTheory/Majorization/`
**Verdict:** accepted

**Summary.** Accepted with no finding. All 79 labelled items and both Parts of the README on main are kept under their ids with full statements; every stated result, Check and worked example was recomputed and agrees with the declarations of the pinned Tau Ceti that the items name. There are three small corrections (chapter-range locators into Bhatia, two suppliers named in the scope but absent from the *Needs:* lines and contracts, four generalised items missing from the description's list) and one format note, none blocking. For the humans: no cited source could be read legally, and the two declarations kept in `Suggested.lean` exist for other roadmaps' acceptance files.

## C01 — Six sections still cite Bhatia only as "Chapters II–IV"

Sections 1.1, 1.2, 1.4, 2.1, 2.3 and 2.5 (lines 119, 194–195, 351–352, 535, 669–670, 772–773) give a three-chapter range as their only locator into the book, so a reader cannot find the source statement of the transfer step, of Ky Fan's maximum principle or of the gauge representation. It matters most for the two targets that are not public library declarations: the progress step MAJ-A14 and the attainment by singular pairs in MAJ-A29. Would theorem or section numbers be given where the book states each result, as §2.2 does with Theorem IV.2.2?

## C02 — The scope names Gram rigidity and Courant–Fischer as inputs, but no *Needs:* line, Dependencies paragraph or supplier contract carries them, and Gram rigidity is attached to the wrong items

The Summary (lines 32–33) says OrthogonalGeometry "supplies the Gram rigidity behind the rectangular singular-value factorization", and Scope and ownership (lines 945–950) says the factorization and the orbit statements of §2.2 rest on `OG-01`–`OG-08` and that the Ky Fan trace inequality rests on Courant–Fischer (`PD-A51`). An implementer reading the *Needs:* lines of §1.4, §2.2 and §2.3 (lines 426–427, 650–651, 700–702), the two Dependencies paragraphs (lines 510–515, 888–893) or the Tau Ceti contract (lines 986–997) finds neither supplier: the contract lists PolarDecomposition's singular-value declarations only.

At the pin the picture is this. `TauCeti/Analysis/InnerProductSpace/SingularValues.lean`, which holds the rectangular factorization (line 689), imports no Gram module, and `UnitarilyInvariantSeminorm/Basic.lean`, which holds the orbit statements, imports only that file. Gram rigidity enters in `TauCeti/Analysis/InnerProductSpace/DiagonalSum.lean` (lines 123 and 125 call `TauCeti.exists_linearIsometryEquiv_of_inner_eq`), that is in the independence of the rectangular diagonal model from the chosen orthonormal families, which the gauge of MAJ-B44 and the hull characterization MAJ-B20 use. `KyFan.lean` imports `TauCeti.Analysis.InnerProductSpace.CourantFischer`.

The smallest repair: say in the Summary and in the scope that Gram rigidity is behind the diagonal model of §1.5 and through it MAJ-B20 and MAJ-B44; add OrthogonalGeometry (`OG-01`–`OG-08`, `TauCeti.exists_linearIsometryEquiv_of_inner_eq`) to the *Needs:* of §2.2 and §2.3 and to the contract, and PolarDecomposition `PD-A51` to the *Needs:* of §1.4. The same scope bullet is headed "Gram rigidity and coordinate isometries" with the range `OG-01`–`OG-08`; in OrthogonalGeometry the coordinate isometries are `OG-09`–`OG-11`.

## C03 — The description's list "Statements whose content changed" omits four items the head generalises

Against the README on main, the head also changes MAJ-A28 (it adds the bound on `‖∑ᵢ ⟪uᵢ, A vᵢ⟫‖`), MAJ-A36 and MAJ-A39 (entries `d : ι → 𝕜` with `‖dᵢ‖` rather than a real tuple), MAJ-B40 (`𝕜`-valued `d₀, d₁` with `‖d₁‖ ≤ ‖d₀‖`) and MAJ-B41 (the general off-diagonal matrix `[[0, b], [c, 0]]` under `‖b‖ ≤ ‖c‖`). Each is a generalisation the pinned library proves, and main's statement is an instance, so nothing is lost; one line in that list would make it complete, for example "MAJ-A28, MAJ-A36, MAJ-A39, MAJ-B40 and MAJ-B41 are stated for `𝕜`-valued data or with the modulus, the forms the library proves".

## N01 — In the second Check of §2.1 (lines 598–599), "double every singular value" reads as multiplying by 2

The dilation repeats each singular value, `(1, 1, 0, 0)` against `(1, 0, 0, 0)`. Would "repeat every singular value twice" be used?

## Questions for the author

None of the five references could be read (paywalled, or the publisher's page refused the request), so these stay questions.

- §2.2 (line 604) cites Bhatia, Theorem IV.2.2 for "Ky Fan domination is exactly orbit-hull membership", for rectangular maps and for `𝕜 = ℝ`. Is that theorem the hull characterization, or the norm inequality for square complex matrices, with the hull statement elsewhere in the book?
- §1.4 (lines 351–352) cites Fan 1949 for the Ky Fan sums of singular values. Is the singular-value maximum principle in that note, or in Fan's 1951 note in the same journal (vol. 37)?
- §1.5 and §2.3 (lines 448, 669) call the gauge representation Mirsky's. The square case is usually credited to von Neumann (1937); would he be cited as well?

## Previous findings

The previous review, of `c754e3c`, had no finding; its small correction and format notes are accounted for here.

- C01 — not repaired: "(Bhatia, *Matrix Analysis*, Chapters II–IV)" at six places; written again as C01 above.
- N01 — not repaired: "would double every singular value" (line 599); written again as N01.
- N02 — settled by the rewrite: the items of §1.5 now end with *In Tau Ceti* lines naming `Matrix.toLin_diagonal_apply_self`, `LinearMap.exists_linearIsometryEquiv_eq_comp_toLin_diagonal_comp` and `LinearMap.diagonalSum_add` (lines 455, 476, 482), and the *Needs:* line lists the Mathlib inputs only.

## Verified sound

| Statement | Instances tried | Values computed (README side / library or computed side) | Result |
| --- | --- | --- | --- |
| Record against main | every `MAJ-` label of main, both Parts, milestones, D1 | main 79 labels, head 79 bold labels, symmetric difference empty; Part A, Part B kept; order of main kept (B44–B46 after B21) | no layer or item removed |
| 1.1 objects (A01–A06) | `(1,1)` vs `(2,0)`; `(1/2,1/2)` vs `(1,1)`; transfer on `(3,1)`, `δ=1,2,3`; `i=j` | `P=1≤2, 2≤2`; totals `1,2`; `(2,2)`, `(1,3)`, `(0,4)` off segment; `i=j` identity (`robinHood_self`) | holds; library definitions match |
| 1.2 MAJ-A14 route | `y=(3,0,0)`, `d=(1,1,1)`; general inequality | `j=1,i=0,δ=1→(2,1,0)`; then `j=2,i=0,δ=1→d`; agreements `0,1,3`; `yᵢ−yⱼ=(yᵢ−dᵢ)+(dᵢ−dⱼ)+(dⱼ−yⱼ)≥δ` | holds; equals private theorem at the pin |
| 1.2 transfer descent, gauge monotonicity (A15, A17) | `{(1,1)}`; `g=|x₀|+2|x₁|` at `(1,1)`,`(2,0)`; unordered `y=(0,2)`, `z=(1,1)` | `(1/2,1/2)∉K`; `3>2`; `ℓ¹,ℓ²,ℓ∞`: `2≤2, √2≤2, 1≤2`; `P₁(z)=1>0` so hypothesis fails | holds; both controls separate |
| 1.3 forward Schur–Horn (A18–A25) | projection, rotated basis; `T=[[2,1],[1,2]]`, `φ=|t−2|`, `t²` | weights `cos²,sin²`, rows and columns `1`; diagonal `(2,2)`, spectrum `(3,1)`: `4=4`, `8≤10`, `0≤2` | holds; hypothesis is eigenvalues in `s` only, as in the library |
| 1.4 Ky Fan maximum principle (A28, A29) | `J=[[0,1],[0,0]]`, `k=1,2`; `k=0`; `k>min` dims | `σ(J)=(1,0)`, `⟪e₀,Je₁⟫=1=K₁`; `u₁=0` at `k=2`; `K₀=0`; library `kyFanSum_le_iff` quantifies `m≤k` | holds; existence needs `k≤dim E, dim F` as stated |
| 1.4 triangle (A30, A31), factor bound (A35) | `diag(1,0)+diag(0,1)`; `C=2·id`; `c<0` | `K₁=1≤2`, `K₂=2≤2`, `σ₁=1>0` coordinatewise; `σ(2J)=(2,0)`; `c<0` forces `F=0` | holds |
| 1.5 diagonal models (A36–A40) | `b=(1,−3,2)`; `diag(i,0)` over `ℂ` | `σ=(3,2,1)`, eigenvalues `(2,1,−3)`; `⟪Te₀,e₀⟫=−i`, `⟪e₀,Te₀⟫=i` | holds |
| Part A examples | shear `S=[[1,1],[0,1]]` | `S†S=[[1,1],[1,2]]`, `σ²=(3±√5)/2`, `σ=((1+√5)/2,(√5−1)/2)`, `K₂=√5`, `⟪e₀,Se₀⟫=1` | holds |
| 2.1 seminorms and transport (B01–B11) | entrywise sum at `I` and rotation `π/4`; zero extension and dilation of `J`; types of `A∘eE`, `eF⁻¹∘A` | `2` vs `2√2`; `(1,0,0,0)` vs `(1,1,0,0)`; `E'→F` and `E→F'` typed | holds |
| 2.2 Fan dominance (B14–B21) | `C=diag(2,0)`, swap `P`; `X=diag(2,−2)`; `J=BP`; `1×1` real | `(C+PCP)/2=I`, `Kₖ(I)=1,2≤2,2`; norms `1≤2, √2≤2, 2≤2`; mass `2`: `4≤4`, `2≤4`; hull `[−1,1]` iff `|a|≤1` | iff holds both ways, real and complex |
| 2.3 gauge representation, ideal inequality, modulus (B44–B46) | `σ=(3,1)`; `|J|`; `C=diag(1,0)`, `A=I`; gauge length `n≠p` | `3, √10, 4, 3`; `|J|=diag(0,1)`, Frobenius `1`; `1≤2`; triangle from A30 for every `n` (`ofIsSymmetricGauge`), inverse only at `n=p` | holds as stated |
| 2.4 block sums (B22–B29) | `A=diag(3,1)`; `A=B=I₂`, `C=D=diag(2,0)` | `σ(A⊕A)=(3,3,1,1)`, `K₂=6`, `K₄=8`; `1≤2`, `2≤2√2`, `4≤4`; separate bounds `2+2=4` | holds; library index `i/2` |
| 2.5 concrete seminorms (B30–B38) | shear `S`, two bases; `I₂`; `J` | `1+2=3=5/2+1/2`; `‖S‖_F=√3`, `‖S‖₁=√5`, `√5≤√6`; `2=√2·√2`; `1=√1·1` | holds |
| 2.6 planar models (B40–B43) | `r=2`, `r=i`; `S` against `diag(σ₀,σ₁)` | `(2,2)`,`(2,0)`; `(1,1)`,`(1,0)`; `t=3`, `δ=1`, `σ₀²=(3+√5)/2`; diagonal has `t=3`, `δ=1` | holds; library takes two sources of dimension two |
| `Suggested.lean` structure and `frobenius` | elaborated types against Convention 11 | binders `RCLike`, inner product, `FiniteDimensional E, F`; `frobenius` needs no `FiniteDimensional F`; real bodies, no `sorry` | agrees |
| Description against the head | counts and lists | `40+1+2+4+32=79`; eleven conventions; sections 1.1–1.5, 2.1–2.6; 14 Lean declarations replaced, 2 kept | agrees, except C03 |

- Source locators checked against the text: 0 of 13; no reference could be read (see Not verifiable).
- Library declarations opened: all 153 names on the *In Tau Ceti* lines resolved at the pinned Tau Ceti; statements read in `TauCeti/Analysis/Convex/Majorization.lean` (lines 95, 173, 204, 212, 243, 261, 338, 359, 509, 547, 643, 653), `KyFan.lean` (129, 250, 305, 371, 400, 489), `FanDominance.lean` (85, 187), `UnitarilyInvariantSeminorm/Basic.lean` (157, 178, 271, 428), `Gauge.lean` (136, 145, 160, 191, 249), `BlockSum.lean` (171, 195, 217), `SingularValues/Planar.lean` (110, 129, 179), `SingularValues.lean` (396, 544, 659, 689, 719), `Frobenius.lean` (200), `ZeroExtension.lean` (52). Mathlib names of the contracts resolved at the pin (`Mathlib/Analysis/Normed/Lp/WithLp.lean` 269–281, `Mathlib/LinearAlgebra/Prod.lean` 293, 325, `Mathlib/Analysis/Convex/Jensen.lean` 66, `Mathlib/Analysis/InnerProductSpace/Adjoint.lean` 970, and others).
- Cross-roadmap citations resolved: PolarDecomposition `PD-A51`, `PD-C08`, `PD-C09`–`PD-C18`, `PD-C28`; OrthogonalGeometry `OG-01`–`OG-08`; PrincipalAngles `PA-B31`, `PA-B32`, `PA-B34`; the uses claimed for NoncommutativeIntegration (MAJ-A28, MAJ-A31) and ComplexHessianEquations (MAJ-A27, transfer closure) are in those READMEs.
- Changes outside the folder: none. Overlaps: no other open pull request changes this roadmap; no cited id is dropped; no id of main is dropped.
- Automatic checks: all passed on this head. Dependency check output: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean` with `lake env lean`: no error and no warning; the three `#check` lines print transfer descent, gauge monotonicity and forward Schur–Horn. The file has no sorried declaration, so the one-tactic probe has nothing to try. Imports: `Mathlib` and two `TauCeti.*` modules; no `set_option`.
- Headline theorems: transfer descent and gauge monotonicity, forward Schur–Horn, Ky Fan's maximum principle and triangle inequality, Fan dominance with the hull characterization, gauge representation and modulus invariance, block-sum comparison, nuclear-to-Frobenius bound. Each is a public declaration of the pinned Tau Ceti named in the module docstring and, as the roadmap's practice is, none is restated with `sorry`.

Overlap check: read EigenvalueAndSingularValueInequalities, MeansMajorizationAndDiscreteInequalities, SpectralSteepestDescent, OperatorIdeals, SpectralSubspacePerturbation, PrincipalAngles and PolarDecomposition. Weak majorization of sorted tuples, transfers, symmetric gauges, Ky Fan sums and unitarily invariant seminorms are owned by Majorization, and the three open roadmaps cite them by `MAJ-` label or Tau Ceti name; majorization on arbitrary index types is MeansMajorizationAndDiscreteInequalities' (with a bridge to `TauCeti.IsWeaklyMajorizedBy`); the modulus and singular system are PolarDecomposition's; the permutation-orbit hull and von Neumann's inequality are PrincipalAngles'. Nothing has two owners.

Source independence: 0 passages compared with 0 sources, since none of the 5 references could be read; largest share Bhatia 1997, 8 of 13 locators; contents not compared with Bhatia 1997 (text and table of contents not read). The README's two Parts and eleven sections are those of the README on main.

Research link: Fan dominance and the symmetric-gauge representation of unitarily invariant norms (Fan 1949; Mirsky 1960; Bhatia 1997) are the norm-transfer inputs for PrincipalAngles' and SpectralSubspacePerturbation's perturbation estimates, OperatorIdeals' Schatten norms and the open EigenvalueAndSingularValueInequalities; this rests on the README's Downstream consumers and References, not on a source read.

## Not verifiable

- Bhatia, *Matrix Analysis* (1997), Chapters II–IV and Theorem IV.2.2: paywalled publisher.
- Marshall, Olkin and Arnold, *Inequalities* (2011), Theorem 9.B.1: paywalled publisher.
- Fan 1949, Proc. Nat. Acad. Sci. USA 35: the publisher's page refused the request; no other legal copy found.
- Mirsky 1960, Quart. J. Math. Oxford 11: the publisher's page refused the request.
- Schur 1923: no legal copy found.

## Source issues

- none

## For the human reviewers

- `Suggested.lean` lines 73–112 keep a second carrier of `TauCeti.UnitarilyInvariantSeminorm` and a Frobenius function only because the acceptance files of PrincipalAngles, OperatorIdeals and SpectralSubspacePerturbation use them; the file states no theorem of its own.
- Every headline theorem is a public Tau Ceti declaration at the pin; the two remaining targets are the progress step MAJ-A14 (private in the library) and the singular-pair attainment in MAJ-A29. Whether the roadmap moves to `Completed/` is the maintainers' decision.
- Licence: README Provenance (lines 918–923) credits a proof strategy to `rjwalters/lean-genius`, `SchurHornMajorization.lean`, which the README says declares no licence. That file was not opened.
- Not tested: Bhatia 1997 (8 of 13 locators) could not be read, so neither the wording nor the arrangement was compared with its text or its table of contents; the same holds for the other four references.
