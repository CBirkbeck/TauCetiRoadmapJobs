# Review of AdelicHeightsAndSuccessiveMinima (pull request #3027 at c832fa9)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/AdelicHeightsAndSuccessiveMinima/`
**Verdict:** accepted

**Summary.** Accepted: the rewritten paragraph on `*Corollary of:*` lines is true of 2.5b, the only section here that carries such a line. The formal proof has no adelic heights. It proves only the CM-field Gram/index form, and it states the automorphism clause in a narrower form. There are seven small corrections and no format notes, none blocking. Two are new: the 2.5b method label does not give the narrower form that the paragraph now says it gives, and the family index lists Minkowski's second theorem over number fields among the results the proof uses, which this README denies. Five are carried unrepaired from the previous review. Three points are left for the human reviewers: policy, licence and scope.

## C01 — The `*Corollary of:*` line of 2.5b names DiophantineApproximationAndTranscendence §2.5a alone, but the deduction also needs ArakelovGeometryAndAbelianHeights §1.5a

The rewritten convention (lines 29–30) now says "what the line covers is deduced from it". That repeats the claim of the previous wording. The route (lines 152–160) still needs the Gram formula of ArakelovGeometryAndAbelianHeights §1.5a to identify `h_{Λ,F}(U)` with `H_A(U)^[E:ℚ]` before §2.5a applies, and the `*Needs:*` line (lines 166–168) lists §§1.5a–1.5b "for the deduction". The line at lines 116–117 is unchanged. Example: over `ℚ(i)` with `Λ = ℤ[i]` and `F_τ = 2`, §2.5a gives `H_A(E) = 1/2`, and only the Gram formula `deg = −Σ_σ log‖1‖_σ = log 4 = −log h` turns `h = 1/4` into `(1/2)²`. Either of two repairs would do: add "with ArakelovGeometryAndAbelianHeights §1.5a (the Gram formula for the degree)" to the line, or end the convention with "together with the sections the `*Needs:*` line names for the deduction".

## C02 — The method label of 2.5b does not give the narrower form in which the formal proof has the automorphism clause, though the rewritten convention now says it does

The new convention (lines 31–32) says the label states "for which form of the statement when that proof has a narrower one". At 2.5b the label (lines 111–114) says only that the height "is invariant under an automorphism of the lattice applied to frame and subspace together". The formal proof's statement, `GlobalTheory.T.heightSup_invariant_under_hermitianLattice_aut`, is narrower in two ways. It assumes `γ` preserves a Hermitian form as well as `Λ` (`IsUStab`, `ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/FundamentalDomains/Signature.lean` line 54). And it concludes only that the supremum of `h^(−δ)` over the subspaces of each dimension is unchanged (`HeightSupInvariantUnderHermitianLatticeAutStatement.lean` line 8). A reader who trusts the convention reads the label as the full clause. The narrower form is stated, but four paragraphs later (lines 137–142). One clause in the label would fix this: "the formal proof states it for automorphisms that also preserve a Hermitian form, as the invariance of the supremum of `h^(−δ)` over the subspaces of each dimension (below)".

## C03 — The origin label of 2.5a, and the Labels paragraph, credit Roy and Thunder with the comparison with `TauCeti.twistedHeight` and `TauCeti.deltaL`, which is this roadmap's own

This is the previous review's C02, not repaired. The label (lines 42–44) and the Labels paragraph (lines 24–25) set apart as this roadmap's own only the comparison with the Arakelov height. The *Change of basis* bullet (lines 68–71) also compares with `TauCeti.twistedHeight` and `TauCeti.deltaL`, and the scope (line 302) lists that comparison as owned here. Suggested wording for both places: "the comparisons with the Arakelov height under *Standard data* and with `TauCeti.twistedHeight` and `TauCeti.deltaL` under *Change of basis* are this roadmap's own formulation".

## C04 — `latticeFrameHeight_map` uses only `hg` among its hypotheses

This is the previous review's C03, not repaired. In `Suggested.lean`, lines 76–84, `hΦ`, `hΛ`, `hspan`, `hz`, `hzΛ` and `[IsCMField E]` are not needed. For every `τ`, `G_τ⁻¹τ(g z_i) = F_τ⁻¹τ(z_i)`, so the Gram factors agree for any finite set of embeddings. And `g` carries `Λ ∩ U` and the `𝓞 E`-span of `z` onto their images, so the index agrees. The author may keep the hypotheses as the README's setting.

## C05 — The description does not say that this folder gains 2.5b and a new headline (1)

This is the previous review's C04, not repaired. Suggested text: "In AdelicHeightsAndSuccessiveMinima, §2.5a keeps its statements and now cites DiophantineApproximationAndTranscendence §2.5a, which proves them. A new §2.5b states the formal proof's Gram-determinant form of the subspace height of a lattice with a frame over a CM field, as a corollary of that section. It is headline (1), stated in `Suggested.lean` as `latticeFrameHeight_eq_of_span_eq` and `latticeFrameHeight_map` with the definitions `IsCMType` and `latticeFrameHeight`. ShimuraVarieties §5.1 and ArakelovGeometryAndAbelianHeights §§1.5a–1.5b become suppliers."

## C06 — The family index describes this roadmap without its adelic heights

This is the previous review's C05, not repaired. The entry in `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md` (lines 261–264) still names only the lattice-with-frame height and the successive minima, though 2.5a opens Layer 2. Suggested text: "adelic heights of vectors and subspaces over every finite extension; the subspace height of a lattice with a frame over a CM field, …".

## C07 — The family index lists Minkowski's second theorem over number fields among the results the proof uses, while this README says no step of the proof needs it

The new table "Published results, and where the proof uses them" says that its first column names the special case where only one is used (line 149). Its row at line 157 lists "Minkowski's second theorem over number fields" for Steps 6 and 7 and names this roadmap. But 3.1 (lines 249–250) says the formal proof uses the real upper bound, only for a Euclidean ball, and that the statements over `K`, the lower bound and `c_K` are needed by no step of it. One of the two must change. If 3.1 is right, the row would read "Minkowski's second theorem, only its upper bound over `ℚ` for a Euclidean ball".

## Previous findings

- None: the previous review raised no findings. Its small corrections are accounted for here.
- C01 (Corollary line names §2.5a alone) — not repaired: the line (lines 116–117) is unchanged, and the new convention says "what the line covers is deduced from it"; carried as C01.
- C02 (origin label of 2.5a omits the `twistedHeight`/`deltaL` comparison) — not repaired: lines 42–44 and 24–25 are unchanged; carried as C03.
- C03 (unused hypotheses of the 2.5b theorems) — not repaired: `Suggested.lean` is unchanged since `644c332`; carried as C04 for `latticeFrameHeight_map`.
- C04 (description silent on 2.5b and headline (1)) — not repaired: the description still names this folder only through the four declarations moved to DiophantineApproximationAndTranscendence; carried as C05.
- C05 (family index entry) — not repaired: lines 261–264 still omit the adelic heights; carried as C06.

## Verified sound

| Statement | Instance | Values computed on each side | Result |
|---|---|---|---|
| Convention: what the line covers "is deduced from" DAT §2.5a (2.5b) | `ℚ(i)`, `Λ = ℤ[i]`, `F_τ = 2`, `z = 1` | `h = 1/4`; DAT §2.5a: `H_A(E) = 1/2`; AGAH §1.5a: `deg = 0 − 2 log(1/2) = log 4 = −log h`; §1.5b: `−2 log(1/2)` | consistent; uses AGAH §1.5a too (C01) |
| Convention: the RH proof "needs only that case" (2.5b) | formal statements `gramDet_div_index_eq_of_span_eq`, `heightSup_invariant_under_hermitianLattice_aut` | CM type `Ψ`, `Λ` finitely generated; `γ` with `IsUStab` (Hermitian form and `Λ`); conclusion on `sup d^(−δ)` over `dim = i` | true; the proof has no adelic height |
| Convention: label gives the narrower form (2.5b label) | label, lines 111–114, vs formal statement | label: pointwise, any `g(Λ) = Λ`; proof: supremum, `γ` also Hermitian-isometric | narrower form only at lines 137–142 (C02) |
| Convention: a route other than the deduction is FormalProof's (2.5b route) | `p = 1`, `T = 1 + i`, `ℤ[i]`, `F = 1` | Gram `×|1+i|² = 2`; index `[ℤ[i] : (1+i)] = 2`; `|N(1+i)| = 2` | matches the label |
| Deduction through change of basis at `g⁻¹` | `n = 1`, `g = i`, `F_τ = 2`, `G_τ = 2i` | `(A g⁻¹)_τ = (1/2)(−i)`, modulus `1/2 = |G_τ⁻¹|`; `A_𝔭 g⁻¹ ℤ[i]_𝔭 = 𝓞_𝔭` | `A·g⁻¹` is an adelic matrix of `Λ, G` |
| 2.5a change of basis (sample) | `ℚ`, `A = 1`, `g = [[1,1],[0,1]]`, `x = e₂` | `g⁻¹x = (−1, 1)`, `(A g)(−1, 1) = (0, 1)`: `H = 1 = H_1(e₂)`; untwisted `H_1(−1, 1) = √2` | holds; the twist matters |
| 3.1 headline (2) (sample) | `ℚ`, `ℤ²`, `B = [−1, 1]²` | `μ_0 = μ_1 = 1`, `vol = 4`, `covol = 1`, `c_ℚ = 1`: `2²/2! = 2 ≤ 4 ≤ 4` | holds; upper bound an equality |
| 3.1 origin, BV Theorem 3 (sample) | BombieriVaaler1983 lines 353–356 (file page 9 = printed p. 18) | `(λ_1⋯λ_L)^d V(S) ≤ 2^(dL)` for `S_v` nonempty, open, convex, symmetric, bounded | supports the upper bound as cited |
| Family index row (line 157) vs 3.1 (lines 249–250) | "over number fields" vs "no step needs the statements over `K`" | row names no special case; 3.1: real upper bound, Euclidean ball only | inconsistent (C07) |

The rows of the previous review for untouched statements (the 2.5a Checks, `IsCMType`, the 2.5b instances over `ℚ(i)` and `ℚ(√−5)`, the 3.1 Checks and Theorem 6) stand as in the previous review, of `644c332`.

- Source locators checked against the text: 1 (Bombieri–Vaaler Theorem 3, p. 18). Formal-proof statements opened in the operator's local copy: 2 (`HeightSupInvariantUnderHermitianLatticeAutStatement.lean` line 8; `IsUStab`, `Signature.lean` line 54).
- Cross-roadmap citations resolved at this head: DiophantineApproximationAndTranscendence §2.5a (README line 1410: Plücker independence and change of basis for subspaces, each to be proved). ArakelovGeometryAndAbelianHeights §§1.5a–1.5b: its README is unchanged since `644c332`. SlopesOfHermitianVectorBundles: only its convention paragraph changed, and its citations of 3.1 at lines 646, 653, 657 and 1446 still resolve.
- Dependency check: `depcheck: 132 roadmaps, 1466 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: the worker's run passed every check. My rerun flagged only the outside-folder check, set aside below. All 117 files lie in folders this pull request owns: the listed roadmap folders, the four RepresentationTheory folders and the family index.
- Elaboration: `lake env lean` on `Suggested.lean` gave four `sorry` warnings (lines 63, 76, 113, 130) and nothing else. The file is unchanged since `644c332`, and the elaborated signatures are as compared there; no binder is lost.

Overlap check: read SlopesOfHermitianVectorBundles (its change and its citations of 3.1), SubspaceTheorem, SuccessiveMinima and ComplexMultiplicationAndExplicitReciprocityPartII. A search of the open heads and of main for the lattice-with-frame height and for bodies balanced over the completions finds them only here, in SlopesOfHermitianVectorBundles (a consumer) and in SubspaceTheorem §§4.1, 4.3 (cited). Owners are as in the previous review: CM types, ShimuraVarieties §5.1; the minima over `K`, SubspaceTheorem §4.2; `H_A` and its properties, DiophantineApproximationAndTranscendence §§2.5–2.5a; the Gram/index quotient, 2.5b. No object has two owners.

Source independence: 1 changed passage compared (the convention paragraph, lines 27–34; changed passages only). It cites no source and paraphrases none. It was also read against the family index's paragraph (lines 200–205) and against the formal proof's statements for 2.5b; nothing is shared beyond declaration names. Largest share unchanged: BombieriVaaler1983 and [FormalProof], 9 of 22 locators each. Contents not compared again: the change adds, removes or reorders no layer.

Research link: Layer 2's heights are the twisted heights of Roy and Thunder (1996, absolute Siegel lemma). 2.5b is their Gram/index form, the Arakelov degree of a Hermitian sub-bundle, for a lattice with a frame over a CM field. Layer 3 extends Bombieri and Vaaler's (1983) Minkowski theorem over number fields, which SlopesOfHermitianVectorBundles §4.1 uses. Rests on the README and on both texts read.

## Not verifiable

- Bombieri–Gubler, *Heights in Diophantine Geometry*, Appendix C.2: cited through SubspaceTheorem §4.2 in untouched text; not opened.

Automatic checks set aside as false positives: the check that a pull request edits nothing outside the roadmap under review listed the files of the other roadmap folders and of the family index that this pull request also adds or revises. Each is part of this same pull request, with a review of its own, and no changed file lies outside them.

## Source issues

- none

## For the human reviewers

- Policy: 2.5b (lines 103–179) states the CM-field case that [FormalProof] has. The convention (lines 27–34) now deduces it from DiophantineApproximationAndTranscendence §2.5a and keeps the formal proof's integral-change argument as a second proof (lines 144–150). Whether this labelled special case is acceptable under the rule against route-specific shortcuts is yours to decide.
- Licence: `latticeFrameHeight` and `latticeFrameHeight_eq_of_span_eq` state the expression of `GlobalTheory.T.gramDet_div_index_eq_of_span_eq` in leanprover-community/riemann-hypothesis (`Development/AbelianVarietyTheory/Proofs/TorusHaarMeasure/GramDetDivIndexEqOfSpanEqStatement.lean`). They use the same Gram-over-CM-type and `relIndex` form, with other names and binders. The repository's licence was not established.
- Scope: 2.5b and the method labels of 2.5a, 2.5b and 3.1 rest on [FormalProof], an unrefereed formalisation announced on 20 November 2026 (README lines 336–337). The roadmap's other sources, Roy–Thunder 1996 and Bombieri–Vaaler 1983, are refereed.
