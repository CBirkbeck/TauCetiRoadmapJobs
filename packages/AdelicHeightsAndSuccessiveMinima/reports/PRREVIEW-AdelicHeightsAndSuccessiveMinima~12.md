# Review of AdelicHeightsAndSuccessiveMinima (pull request #3027 at cd123f8)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/AdelicHeightsAndSuccessiveMinima/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 366 changed lines since `74a09b7`. Accepted: every statement the change adds or alters (the labels and convention paragraphs, 2.5a in the notation `H_A`, the new 2.5b with its two Lean theorems, and the labels of 3.1) was recomputed on instances, read against Bombieri–Vaaler and the formal proof's statements, and resolved against the supplier sections at this head; no finding. The folder is unchanged since the previous review, so its seven small corrections stand unrepaired and are repeated here; there are no format notes, and none of the seven blocks. Three points are left for the human reviewers: policy, licence and scope.

## C01 — The `*Corollary of:*` line of 2.5b names DiophantineApproximationAndTranscendence §2.5a alone, but the deduction also needs ArakelovGeometryAndAbelianHeights §1.5a

The convention (lines 29–30) says "what the line covers is deduced from it", and the line at 2.5b (lines 116–117) names only §2.5a. The deduction written in the route (lines 152–160) needs the Gram formula of ArakelovGeometryAndAbelianHeights §1.5a first, to identify `h_{Λ,F}(U)` with `H_A(U)^[E:ℚ]`; the `*Needs:*` line (lines 166–168) says so. Over `ℚ(i)` with `Λ = ℤ[i]`, `F_τ = 2`: §2.5a gives `H_A(E) = 1/2`, and only `deg = log 1 − ½·2·log(1/4) = log 4 = −log h` turns `h = 1/4` into `(1/2)²`. Either repair would do: add "with ArakelovGeometryAndAbelianHeights §§1.5a–1.5b (the Gram formula and the degree in an adelic presentation)" to the line, or end the convention's sentence with "together with the sections the `*Needs:*` line names for the deduction".

## C02 — The method label of 2.5b does not give the narrower form in which the formal proof has the automorphism clause, though the convention says the label does

The convention (lines 31–32) says the label states "for which form of the statement when that proof has a narrower one". The label of 2.5b (lines 111–114) says only that the height "is invariant under an automorphism of the lattice applied to frame and subspace together". The formal proof's statement `GlobalTheory.T.heightSup_invariant_under_hermitianLattice_aut` (`Development/AbelianVarietyTheory/Proofs/TorusHaarMeasure/HeightSupInvariantUnderHermitianLatticeAutStatement.lean`, line 8) assumes `IsUStab X.Gm X.Λ γ`, an automorphism that also preserves a Hermitian form, and concludes only that the least upper bound of `d^(−δ)` over the subspaces of each dimension is unchanged. The README says this, but four paragraphs later (lines 137–142). One clause in the label would make the convention true here: "the formal proof states it for automorphisms that also preserve a Hermitian form, as the invariance of the supremum of `h^(−δ)` over the subspaces of each dimension (below)".

## C03 — The origin label of 2.5a, and the Labels paragraph, set apart only the Arakelov comparison as this roadmap's own, but the comparison with `TauCeti.twistedHeight` and `TauCeti.deltaL` is its own too

The label (lines 42–44) and the Labels paragraph (lines 24–25) credit everything in 2.5a except the comparison with the Arakelov height to Roy and Thunder. The *Change of basis* bullet (lines 68–71) also compares with `TauCeti.twistedHeight` and `TauCeti.deltaL`, DiophantineApproximationAndTranscendence §2.5a does not state that comparison, and the scope (line 302) lists it as owned here. Suggested wording in both places: "the comparisons with the Arakelov height under *Standard data* and with `TauCeti.twistedHeight` and `TauCeti.deltaL` under *Change of basis* are this roadmap's own formulation".

## C04 — `latticeFrameHeight_map` uses only `hg` among its hypotheses

In `Suggested.lean`, lines 76–84, `hΦ`, `hΛ`, `hspan`, `hz`, `hzΛ` and `[IsCMField E]` are not needed for the statement to hold: for every `τ`, `G_τ⁻¹τ(g z_i) = F_τ⁻¹τ(g)⁻¹τ(g)τ(z_i) = F_τ⁻¹τ(z_i)`, so the Gram factors agree for any finite set of embeddings, and `g` carries `Λ ∩ U` and the `𝓞 E`-span of `z` onto their images, so the index agrees. (In `latticeFrameHeight_eq_of_span_eq` the CM-type hypothesis is needed: the numerator scales by `∏_{τ∈Φ}|τ(det T)|²`, the index by `|N(det T)|`.) The author may keep the hypotheses as the README's setting; a clause in the docstring saying so would be enough.

## C05 — The description does not say that this folder gains 2.5b and a new headline (1)

The description mentions this folder only through "DiophantineApproximationAndTranscendence receives the four adelic-height declarations". It does not say that the former headline (1) (the values of the adelic subspace height at `A = 1` and on the whole space) leaves `Suggested.lean` here, that a new §2.5b and headline replace it, or that two suppliers are added. Suggested text: "In AdelicHeightsAndSuccessiveMinima, §2.5a keeps its statements and now cites DiophantineApproximationAndTranscendence §2.5a, which proves them. A new §2.5b states the formal proof's Gram-determinant form of the subspace height of a lattice with a frame over a CM field, as a corollary of that section; it is headline (1), stated in `Suggested.lean` as `latticeFrameHeight_eq_of_span_eq` and `latticeFrameHeight_map` with the definitions `IsCMType` and `latticeFrameHeight`. ShimuraVarieties §5.1 and ArakelovGeometryAndAbelianHeights §§1.5a–1.5b become suppliers."

## C06 — The family index describes this roadmap without its adelic heights

The entry in `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md` (lines 261–264) names only the lattice-with-frame height and the successive minima, though 2.5a opens Layer 2 and gives the layer its title. Suggested text: "adelic heights of vectors and subspaces over every finite extension; the subspace height of a lattice with a frame over a CM field, …".

## C07 — The family index lists Minkowski's second theorem over number fields among the results the proof uses, while 3.1 says no step of the proof needs it

The table "Published results, and where the proof uses them" says its first column names the special case where only one is used (line 149). Its row at line 157 lists "Minkowski's second theorem over number fields" for Steps 6 and 7 and names this roadmap. But 3.1 (lines 249–250) says the formal proof uses the real upper bound, only for a Euclidean ball, and that the statements over `K`, the lower bound and `c_K` are needed by no step of it; the formal proof's `Formalism.FN.MinkowskiIIUpper` and `Formalism.FN.MinkowskiIIBall` (`Formalism/SuccessiveMinima/StatementMink.lean`, lines 18 and 34) are indeed real statements. If 3.1 is right, the row would read "Minkowski's second theorem, only its upper bound for a real lattice and a Euclidean ball".

## Previous findings

- The previous review raised no findings. Its seven small corrections are not repaired (the folder and the two places in the family index are unchanged since the head it read): its C01–C07 are carried here under the same numbers.

## Verified sound

| Statement | Instance | Values computed on each side | Result |
|---|---|---|---|
| 2.5a *Well defined*, *Extreme cases* (sample) | `ℚ`, `n = 1`, `A_∞ = 2`, `A_p = 1`, `x = 3` | `2·3·(1/3) = 2 = |det A|_𝔸`; `ℚ`, `n = 2`, `diag(1, e^(−c))`: `H_A(e₂) = e^(−c) = H_A(ℚ²)` | holds |
| 2.5a *Change of basis* (sample) | `ℚ`, `A = 1`, `g = [[1,1],[0,1]]`, `x = e₂` | `g⁻¹x = (−1, 1)`, `(A·g)(−1, 1) = (0, 1)`: height `1 = H_1(e₂)`; untwisted `H_1(−1, 1) = √2` | holds; the twist matters |
| 2.5a first-minimum remark | `absoluteAdelicMinima`, `n = 2, 3` | `μ_1 ≤ 2^((n−1)/2)·|det A|^(1/n)`; `n = 2`: `√2 = √n`; `n = 3`: `2 > √3` | "not a consequence for `n ≥ 3`" is right |
| 2.5b *Well defined* (sample; `latticeFrameHeight_eq_of_span_eq`) | `ℚ(i)`, `ℤ[i]`, `F = 1`, `z = 1` and `z = 1 + i` | Gram `1`, index `1`; Gram `2`, index `[ℤ[i] : (1+i)] = 2`: both `1`. Without CM type (`Φ = ∅`): `1` vs `1/2` | holds; `hΦ` needed |
| 2.5b *Automorphisms* (`latticeFrameHeight_map`) | `n = 1`, `g = i`, `F_τ = 2`, `G_τ = 2i`, `z = 1` | Gram of `(2i)⁻¹·i = 1/2`: `1/4`; index `[ℤ[i] : iℤ[i]] = 1`; both sides `1/4` | holds; only `hg` used (C04) |
| 2.5b `h = H_A^[E:ℚ]` (route, second Check) | `ℚ(i)`, `F_τ = 2`, `A_τ = 1/2`, `A_𝔭 = 1` | `h = 1/4`; `H_A(E) = (1/2)^(2/2) = 1/2`; §1.5a: `deg = 0 − ½·2·log(1/4) = log 4`; §1.5b: `−2·log(1/2) = log 4` | holds; uses §1.5a (C01) |
| 2.5b `A·g⁻¹` is an adelic matrix of `Λ, G` | general | `(A g⁻¹)_τ = F_τ⁻¹τ(g)⁻¹ = G_τ⁻¹`; `A_𝔭 g⁻¹ Λ_𝔭 = A_𝔭 Λ_𝔭 = 𝓞_𝔭^n` | holds |
| `latticeFrameHeight`, empty family and `relIndex` | `p = 0`; `z ⊂ Λ` | empty product `1`, `det` of the `0 × 0` matrix `1`, `relIndex ⊥ ⊥ = 1`; `relIndex` is `[Λ ∩ U : span z]` as `span z ≤ Λ ∩ U` | value `1`, as the docstring says |
| `IsCMType` | `E` with a real embedding `τ` | `conj τ = τ`: `τ ∈ Φ ↔ τ ∉ Φ`, false | no CM type, as the docstring says |
| 2.5b method label vs formal proof | `gramDet_div_index_eq_of_span_eq`, `heightSup_invariant_under_hermitianLattice_aut` | first: same Gram/`relIndex` quotient for two families; second: `IsUStab`, least upper bound of `d^(−δ)` per dimension | label right for the first, wider for the second (C02) |
| 3.1 labels (sample), Bombieri–Vaaler Theorems 3 and 6 | BombieriVaaler1983 lines 325–356, 507–523 | Thm 3: `S_v` nonempty, open, convex, symmetric, bounded, `(λ_1⋯λ_L)^d V(S) ≤ 2^(dL)`, printed p. 18; Thm 6 under (3.16), other constants, p. 23 | supports "adapted from", as cited |
| 3.1 "(3.16) for a convex product body is balancedness" | complex factor, `a = r·e^(iφ)`, `r ≤ 1` | `a x = ((1+r)/2)·e^(iφ)x + ((1−r)/2)·(−e^(iφ)x)`, a convex combination | holds |
| 3.1 method label vs formal proof | `Formalism.FN.MinkowskiIIUpper`, `SuccMinFacts` | compact, convex, symmetric, `0 ∈ interior`: `μ(K)·∏ succMin ≤ 2^m·covol`; one independent family in `succMin_i • K` | as the label says |
| 3.1 headline (2), both halves | `ℚ`, `ℤ²`, unit disc; `ℚ(i)`, `ℤ[i]`, rectangle `ε < 1/2` | disc: `2²/2! = 2 ≤ π ≤ 4`; rectangle: `μ_0 = 1`, `vol = 4ε`, lower bound would read `2 ≤ 4ε` | holds; balancedness needed below |
| Lean upper half without interior | `B` with empty interior | `μ.real B = 0`, left side `0 ≤ 2^(dn)·covol`; Tau Ceti's real upper half takes any `ConvexBody` | holds |
| Family index row (line 157) vs 3.1 (lines 249–250) | "over number fields" vs "no step needs the statements over `K`" | formal proof: real statements only | inconsistent (C07) |

- Source locators checked against the text: 2 (BombieriVaaler1983 Theorem 3 at lines 353–356, printed p. 18; Theorem 6 with (3.16) at lines 511–523, printed p. 23). Formal-proof statements opened in the operator's local copy: 5 (`exists_height`, `gramDet_div_index_eq_of_span_eq`, `heightSup_invariant_under_hermitianLattice_aut`, `MinkowskiIIUpper`, `SuccMinFacts`), each under the name and path the README gives.
- Library declarations opened at the pins: Tau Ceti `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume` (`NumberTheory/GeometryOfNumbers/MinkowskiSecond.lean` line 626) and the lower half (line 728), `TauCeti.NumberField.mul_mem_approxBody` (`NumberTheory/DiophantineApproximation/Subspace/ApproximationDomain.lean` line 224), `twistedHeight`, `deltaL`, `plucker`, `height2`, `subspaceHeight`; Mathlib `NumberField.prod_abs_eq_one`, `IsCMField`, `house`, `normAtPlace`.
- Cross-roadmap citations resolved at this head: DiophantineApproximationAndTranscendence §§0.0, 2.5, 2.5a (line 1410: every statement of 2.5a here is asked to be proved there), 2.8; ArakelovGeometryAndAbelianHeights §§1.5a (Gram formula, with `−log N(𝔟) = log #(E/⊕ O_K e_i)`), 1.5b (i), (ii), 1.12, 1.14; ShimuraVarieties §5.1; SubspaceTheorem §§4.1–4.3. The consumer SlopesOfHermitianVectorBundles cites §3.1 (lines 657, 811, 1446), which is there.
- The record: the README at the merge base has Layers 2 and 3 with items 2.5a and 3.1; this head keeps both layers and both items with every statement (2.5a in the notation `H_A`), and adds 2.5b. The four declarations that leave `Suggested.lean` are in `TauCetiRoadmap/DiophantineApproximationAndTranscendence/Suggested.lean` (lines 291–327) in this pull request.
- Dependency check: `depcheck: 132 roadmaps, 1466 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: the worker's run passed every check. Elaboration: `lake env lean` on `Suggested.lean` gave four `sorry` warnings (lines 63, 76, 113, 130) and nothing else; the elaborated signatures were compared with the README statements, and no binder is lost.
- One-tactic probe: none of the four theorems closes with `rfl`, `aesop` or `simp` with the two definitions unfolded.

Overlap check: read SlopesOfHermitianVectorBundles, SubspaceTheorem, SuccessiveMinima and ComplexMultiplicationAndExplicitReciprocityPartII. A search of the open heads and of main for the lattice-with-frame height and for bodies balanced over the completions finds them only here, in SlopesOfHermitianVectorBundles (a consumer) and in SubspaceTheorem §§4.1–4.3 (cited). Owners: CM types, ShimuraVarieties §5.1; the minima over `K` and the approximation-body case, SubspaceTheorem §4.2; `H_A` and its properties, DiophantineApproximationAndTranscendence §§2.5–2.5a; the Gram/index quotient and the balanced-body case, this roadmap. Nothing has two owners.

Source independence: 4 changed passages compared with 2 sources (changed passages only): the origin label of 3.1 with BombieriVaaler1983 lines 325–356 and 507–523, and the method labels of 2.5b and 3.1 and the statement of 2.5b with the formal proof's statements; none shared beyond hypothesis lists and declaration names. Largest share BombieriVaaler1983 and [FormalProof], 9 of 20 locators each; contents not compared, since the change adds, removes or reorders no layer.

Research link: Layer 2's heights are the twisted heights of Roy and Thunder (1996, absolute Siegel lemma); 2.5b is their Gram/index form for a lattice with a frame over a CM field. Layer 3 extends Bombieri and Vaaler's (1983) adelic Minkowski theorem to balanced bodies, used by SlopesOfHermitianVectorBundles §4.1. Rests on the README and on the Bombieri–Vaaler text read.

## Not verifiable

- Roy and Thunder (1996), §1 and Proposition 4.2: cited for 2.5a and 2.5b through DiophantineApproximationAndTranscendence §2.5a; the text is not among those held for this roadmap, and the locators are that section's, not this folder's.
- Bombieri–Gubler, *Heights in Diophantine Geometry*, Appendix C.2: cited through SubspaceTheorem §4.2 in untouched text; not opened.

## Source issues

- none

## For the human reviewers

- Policy: 2.5b (lines 103–179) states the CM-field case that [FormalProof] has, as a corollary of DiophantineApproximationAndTranscendence §2.5a, and keeps the formal proof's integral-change argument as a second proof. Whether this labelled special case is acceptable under the rule against route-specific statements is yours to decide.
- Licence: `latticeFrameHeight` and `latticeFrameHeight_eq_of_span_eq` state the expression of `GlobalTheory.T.gramDet_div_index_eq_of_span_eq` in leanprover-community/riemann-hypothesis (same Gram-over-CM-type and `relIndex` form, other names and binders). That repository's licence was not established.
- Scope: 2.5b and the method labels of 2.5a, 2.5b and 3.1 rest on [FormalProof], an unrefereed formalisation announced on 20 November 2026 (README lines 336–337). The other sources, Roy–Thunder 1996 and Bombieri–Vaaler 1983, are refereed.
