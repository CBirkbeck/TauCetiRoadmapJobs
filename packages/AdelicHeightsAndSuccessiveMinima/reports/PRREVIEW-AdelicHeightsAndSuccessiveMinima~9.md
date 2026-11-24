# Review of AdelicHeightsAndSuccessiveMinima (pull request #3027 at 644c332)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/AdelicHeightsAndSuccessiveMinima/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 363 changed lines since `74a09b7`. This head repairs both findings and all three remarks of the previous review. 2.5a is back under its id with its statements and Checks, and headline (1) is now stated in `Suggested.lean` as two theorems that elaborate. I checked the new 2.5b and its four Lean declarations by computing instances over `ℚ(i)` and `ℚ(√−5)`, the labels of 2.5a and 3.1 against Roy–Thunder and Bombieri–Vaaler, and the formal proof's declarations; nothing makes a stated result false or unsupported. Five small corrections and no format notes, none blocking; three points are left for the human reviewers (the policy on special cases, a licence, the scope).

## C01 — The *Corollary of:* line of 2.5b names DiophantineApproximationAndTranscendence §2.5a alone, but 2.5b follows from it only together with ArakelovGeometryAndAbelianHeights §§1.5a–1.5b

Read with the convention paragraph, the line claims more than it delivers. That paragraph (line 29) says "what the line covers follows from that theorem", but the line (lines 113–114) names only §2.5a. That section speaks of adelic heights and says nothing about Gram determinants or lattice indices. The route (lines 149–157) needs the Gram formula of ArakelovGeometryAndAbelianHeights §1.5a and §1.5b (ii) to identify `h_{Λ,F}(U)` with `H_A(U)^[E:ℚ]` before §2.5a applies. In fact §1.5a alone gives both clauses. In the basis `z`, the Gram formula gives `deg(Ē_U) = log [Λ∩U : Σ 𝓞_E z_i] − Σ_{τ∈Φ} log Gram_τ = −log h_{Λ,F}(U)`, because `τ` and `τ̄` have the same Gram determinant. The degree does not depend on `z`. And `g` is an isometry from `Λ` with the norms of `F` to `Λ` with the norms of `G`, since `|G_τ⁻¹τ(gx)| = |F_τ⁻¹τ(x)|`, and it carries `Ē_U` onto `Ē_{g(U)}`. Either of two changes would make the line accurate: add "with ArakelovGeometryAndAbelianHeights §§1.5a–1.5b (the Gram formula and the degree of a sub-bundle in an adelic presentation)", or name §1.5a as the general theorem.

## C02 — The origin label of 2.5a credits Roy and Thunder with the comparison with `TauCeti.twistedHeight` and `TauCeti.deltaL`, which is this roadmap's own

The PR's purpose is to sort each statement by origin, so the label should match the scope. The label (lines 39–41) calls everything published by Roy and Thunder except "the comparison with the Arakelov height under *Standard data*". The *Change of basis* bullet (lines 65–68) also identifies `|det A|_𝔸` with `TauCeti.deltaL` of `v ↦ A_v` when every `A_v` has entries in `K`, and relates the change of basis to that of `TauCeti.twistedHeight`. Roy–Thunder §1 does not contain this comparison, and neither does DiophantineApproximationAndTranscendence §2.5a at this head. The scope (line 299) lists it as owned here. The Labels paragraph (lines 24–25) has the same omission. Suggested wording for both places: "the comparisons with the Arakelov height under *Standard data* and with `TauCeti.twistedHeight` and `TauCeti.deltaL` under *Change of basis* are this roadmap's own formulation".

## C03 — Several hypotheses of the two 2.5b theorems are not used

In `latticeFrameHeight_map` (`Suggested.lean`, lines 76–84) only `hg` is used. `hΦ`, `hΛ`, `hspan`, `hz`, `hzΛ` and `[IsCMField E]` are not. For every `τ`, `G_τ⁻¹τ(g z_i) = F_τ⁻¹τ(z_i)`, so the Gram factors agree for any finite set `Φ`. And since `g(Λ) = Λ`, `g` is an additive isomorphism `Λ ∩ U → Λ ∩ g(U)` carrying the `𝓞_E`-span of `z` onto that of `g z`, so the `relIndex` agrees, finite or not.

In `latticeFrameHeight_eq_of_span_eq` (lines 63–70), `hΦ` is needed: with both embeddings of `ℚ(i)`, `Λ = ℤ[i]` and `F = 1`, the family `z = 1` gives `1` and `z = 1 + i` gives `2·2/2 = 2`. But `[IsCMField E]`, `hΛ` and `hspan` are not needed. Any set with one embedding from each conjugate pair gives `∏_{τ∈Φ} |τ(x)|² = |N_{E/ℚ}(x)|`. When `Λ ∩ U` is not finitely generated, both indices are infinite, so `relIndex` is `0` and both sides are `0`.

The hypotheses record the README's setting. The author may keep them, or drop them from `latticeFrameHeight_map` so that it reads as the transport of structure it is.

## C04 — For this folder, the description does not say that 2.5b and a new headline (1) are added

A reader of the description learns that the four adelic-height declarations go to DiophantineApproximationAndTranscendence. It does not say what replaces them here, or that this roadmap gains suppliers. Suggested text: "In AdelicHeightsAndSuccessiveMinima, §2.5a keeps its statements and now cites DiophantineApproximationAndTranscendence §2.5a, which proves them. A new §2.5b states the formal proof's Gram-determinant form of the subspace height of a lattice with a frame over a CM field; it is headline (1), stated in `Suggested.lean` as `latticeFrameHeight_eq_of_span_eq` and `latticeFrameHeight_map` with the definitions `IsCMType` and `latticeFrameHeight`. ShimuraVarieties §5.1 (CM types) and ArakelovGeometryAndAbelianHeights §§1.5a–1.5b become suppliers of this roadmap."

## C05 — The family index describes this roadmap without its adelic heights

The entry in `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md` (lines 127–130) now names only the lattice-with-frame height and the successive minima. But 2.5a, the adelic heights of vectors and subspaces over every finite extension, is still the first section of Layer 2. The entry on `main` named them. Suggested text: "adelic heights of vectors and subspaces over every finite extension; the subspace height of a lattice with a frame over a CM field, with its independence of the lattice vectors and its invariance under automorphisms of the lattice; and successive minima over number fields for balanced bodies."

## Questions for the author

- Is 2.5b meant to supply the well-definedness of `nz(I)` in ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.16 (a) (its README, line 1039)? There `nz(I)` is the product over `τ` of the Gram determinants of a basis of `I`, divided by the index, which is the quotient of 2.5b. At this head no roadmap cites 2.5b. I did not check that the frame and normalisation there agree with `h_{Λ,F}`.

## Earlier findings

- R01 (2.5a and Layer 2 changed subject): repaired. Layer 2 is again "Adelic heights of vectors and subspaces" (line 33), and 2.5a has that title (line 37). Its four groups of statements (lines 59–70) and three Checks (lines 94–98) match the merge base, with the names `adelicHeight` and `adelicSubspaceHeight` written `H_A`. The lattice-with-frame statement has the new id 2.5b.
- R02 (headline (1) statable but absent): repaired. `latticeFrameHeight_eq_of_span_eq` and `latticeFrameHeight_map` state both clauses, with `IsCMType` and `latticeFrameHeight`. They elaborate with only `sorry` warnings.
- C01 (adelic comparison presented as part of headline (1)): repaired. The overview (line 5) now calls it "The route to both statements".
- C02 (description silent on the change of 2.5a's subject): moot once R01 was repaired. What the description still omits is C04 above.
- N01 (future-tense convention paragraph): repaired. Lines 27–31 now state the convention without a plan for later edits.
- Question (consumer of the new section): still no citation of 2.5b at this head; see the question above.

## Verified sound

| Statement | Instance | Values computed on each side | Result |
|---|---|---|---|
| 2.5a origin, Roy–Thunder §1 | printed pp. 3–4, OCR lines 120–177 | Euclidean/max norms, exponent `n_v/[K:k]`, extension to `E`, `∧^m` height, `H_A(0) = 1`, `H_A(k̄^n) = |det A|` | supports, as DAT §2.5a cites |
| 2.5a, value at `A = 1` | printed p. 5, lines 200–202 | `A = 1` gives the heights of Bombieri–Vaaler and Schmidt | supports |
| 2.5a change of basis | Prop. 4.2, (4.1), p. 11, lines 418–422, `Φ = g`, `B = A·g` | `A Φ B⁻¹ = 1`; `H_A(gx) = H_{Ag}(x)`, i.e. `H_{Ag}(g⁻¹x) = H_A(x)` | supports |
| 2.5a Checks | `ℚ`, `diag(1, e^(−c))`; `ℚ(i)`, `(1,1)`; `ℚ`, `n = 1`, `A_∞ = 2` | `e^(−c) = e^(−c)`; `√2` vs wrong `2^(1/4)`; `2·|x|·∏|x|_p = 2` | true |
| 2.5a remark | first minimum, `n = 2, 3` | `2^((n−1)/2)` vs `√n`: `√2 = √2`; `2 > 1.73` | "not a consequence for `n ≥ 3`" true |
| 2.5b well defined | `ℚ(i)`, `Λ = ℤ[i]`, `F = 1`, `U = E` | `z = 1`: `1/1`; `z = 1+i`: `2/2` | `1 = 1` |
| 2.5b, `Λ` not free | `ℚ(√−5)`, `Λ = 𝔞 = (2, 1+√−5)`, `F = 1` | `z = 2`: `4/2 = 2`; `z = 1+√−5`: `6/3 = 2` | equal (`N𝔞`) |
| 2.5b, `n = 2` | `ℤ[i]²`, `U = E(1,1)` | `z = (1,1)`: `2/1`; `z = (1+i)(1,1)`: `4/2`; `H_1(U)² = (√2)² = 2` | consistent with 2.5a |
| 2.5b, CM type needed | `ℚ(i)`, `Φ` both embeddings; `Φ = ∅` | `1` vs `2·2/2 = 2`; `1` vs `1/2` | fails without `hΦ` (C03) |
| 2.5b automorphisms | `F = 2`, `g = i`; non-example `g = 2`, `F = 1` | `G⁻¹τ(g) = 1/2`, Gram `1/4` both sides; `g = 2`: `1/4` vs `1` | holds; `hg` needed |
| 2.5b, empty family | `p = 0` | `det` of 0×0 is `1`; `relIndex ⊥ ⊥ = 1` (`relIndex_self`) | `1`, as README |
| 2.5b route, integral change | `p = 1`, `T = 1+i` | Gram ×`|1+i|² = 2`; index ×`N(1+i) = 2` | quotient kept |
| 2.5b route, adelic form | `F = 2`, `A_τ = 1/2`; AGAH §1.5a on `Λ ∩ U` | `|det A|_𝔸 = 1/2`, `(1/2)² = 1/4 = h`; `deg = log index − Σ_Φ log Gram = −log h` | consistent; C01 |
| 2.5b, `A·g⁻¹` | infinite and finite places | `F_τ⁻¹τ(g)⁻¹ = G_τ⁻¹`; `A_𝔭 g⁻¹Λ_𝔭 = 𝓞_𝔭^n` | adelic matrix of `Λ, G` |
| `IsCMType` | `ℚ(i)`; `ℚ` | `{id}` yes; both or none no; `ℚ` none (real embedding) | matches ShimuraVarieties §5.1 |
| 2.5b formal form | GramDetDivIndexEqOfSpanEqStatement.lean; Signature.lean | `Data`: `Ψ` CM type, `Λ` finitely generated and spanning; Gram via `ᴴ`, `relIndex` with `⊓`; `lact γ x = τ(γ)·x_τ` | matches Lean and `G_τ = τ(g)F_τ` |
| 3.1 origin, BV Thm 3 | lines 325–356, p. 18 | `S_v` nonempty, open, convex, symmetric, bounded; `(λ_1⋯λ_L)^d V(S) ≤ 2^(dL)` | supports |
| 3.1 origin, BV Thm 6 | lines 507–523, pp. 22–23 | `S_v = αS_v`, `|α| = 1` at complex `v`; constants with `L!`, `(2L)!`, discriminant | supports |
| Headline (2) | `ℚ, ℤ, [−1,1]`; `ℤ²`, disc; `ℤ[i]`, rectangle `ε < 1/2` | `2 ≤ 2 ≤ 2`; `2 ≤ π ≤ 4`; `2 ≤ 4ε` false | holds; balancedness needed |
| 3.1 method label | `Formalism.FN.*`, four names | source files opened; name components in kernel export (13, 1, 1, 1 hits) | matches |

- Source locators checked against the text: 6. Roy–Thunder 1996 §1 (printed pp. 3–4), p. 5 and Proposition 4.2 with (4.1) (p. 11), in the GDZ open copy. Bombieri–Vaaler 1983 Theorem 3 (p. 18), (3.16) (p. 22) and Theorem 6 (p. 23), BombieriVaaler1983 lines 325–356 and 507–523.
- Formal-proof locators: 7 declaration names opened in the operator's local copy of `src/`. All seven last name components occur in the kernel export. The proof's own lemmas `exists_common_integral_refinement` and `abs_norm_eq_prod_cmType_sq` match the 2.5b method label.
- Library declarations opened at the pins: Mathlib `Subgroup.relIndex`/`AddSubgroup.relIndex` (GroupTheory/Index.lean:62) and `relIndex_self` (:282), `NumberField.IsCMField` (NumberField/CMField.lean:70), `ComplexEmbedding.conjugate` (InfinitePlace/Embeddings.lean:192), `Matrix.GeneralLinearGroup.map` (GeneralLinearGroup/Defs.lean:188). Tau Ceti has no Gram/index height over `𝓞_E` and no CM type (ZLattice/Determinant.lean covers `ℤ`-lattices only).
- Cross-roadmap citations resolved: 19. At this head: DiophantineApproximationAndTranscendence §§0.0, 2.5, 2.5a, 2.8; ArakelovGeometryAndAbelianHeights §§1.5a, 1.5b, 1.12, 1.14; SlopesOfHermitianVectorBundles §§1.1, 1.3, 1.6, 4.1, 4.3, 4.3a. On `main`: ShimuraVarieties §5.1 (its `CMType`, Suggested.lean:430, has the same partition condition), SubspaceTheorem §§4.1–4.3, SuccessiveMinima §2.1.
- Dependency check: `depcheck: 132 roadmaps, 1466 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- Automatic checks: the worker's run passed every check. My rerun flagged only the outside-folder check, set aside below: all 115 files lie in folders the pull request owns: 47 top-level roadmap folders, 44 other family and RepresentationTheory folders, and the family index.
- Elaboration: `lake env lean` on `Suggested.lean` gave four `sorry` warnings (lines 63, 76, 113, 130) and nothing else. I compared the elaborated signatures of all eight declarations with the README; no binder is lost.
- One-tactic probe on a copy of the file: `simp [latticeFrameHeight]`, `rfl` and `simp` close none of the four theorems.

Overlap check: read SlopesOfHermitianVectorBundles, SubspaceTheorem, SuccessiveMinima, ComplexMultiplicationAndExplicitReciprocityPartII (and ShimuraVarieties §5.1, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.16). Shared objects and their owners:
- CM types: ShimuraVarieties §5.1, cited.
- The minima over `K`: SubspaceTheorem §4.2.
- The real Minkowski halves: DiophantineApproximationAndTranscendence §0.0, in Tau Ceti.
- The heights `H_A` and their elementary properties: DiophantineApproximationAndTranscendence §§2.5–2.5a.
- The Gram/index quotient: owned only by 2.5b. ArithmeticVolumes §8.16 uses it inline and states nothing about it (question above).

None of these has two owners.

Source independence: 8 passages compared with 3 sources (changed passages only).
- The 2.5a statement paragraph and origin label against Roy–Thunder §1.
- The 2.5a route against Roy–Thunder's product-formula sentence.
- The 3.1 origin label against Bombieri–Vaaler Theorems 3, 6 and (3.16).
- The 2.5b method label, statement and Lean definition against the formal proof's statement files.
- The 3.1 method label against the formal proof's Minkowski files.
- The `IsCMType` docstring against ShimuraVarieties §5.1's definition.

Nothing is shared beyond formulae, standard hypothesis lists and names. Largest share: BombieriVaaler1983 and [FormalProof], 9 of 22 locators each. Contents not compared: the change adds, removes or reorders no layer.

Research link: Layer 2's heights are the twisted heights of Roy and Thunder (1996, absolute Siegel lemma). 2.5b is their Gram/index form, the Arakelov degree of a Hermitian sub-bundle, for a lattice with a frame over a CM field. Layer 3 extends Bombieri and Vaaler's (1983) Minkowski theorem over number fields, which SlopesOfHermitianVectorBundles §4.1 uses. Rests on the README and on both texts read.

## Not verifiable

- Bombieri–Gubler, *Heights in Diophantine Geometry*, Appendix C.2: cited through SubspaceTheorem §4.2 in untouched text; not opened.

Automatic checks set aside as false positives: on my rerun, the check that a pull request edits nothing outside the roadmap under review listed the files of the other roadmap folders and the family index that this pull request also adds or revises. Each is part of this same pull request, with a review of its own, and no changed file lies outside them.

## Source issues

- none

## For the human reviewers

- Policy: 2.5b (lines 100–176) states the CM-field case that [FormalProof] has, names DiophantineApproximationAndTranscendence §2.5a as the general theorem, and lines 27–31 let its route be the formal proof's. The principles exclude route-specific shortcuts; whether this labelled special case is acceptable is yours to decide.
- Licence: `latticeFrameHeight` and `latticeFrameHeight_eq_of_span_eq` state the expression of `GlobalTheory.T.gramDet_div_index_eq_of_span_eq` in leanprover-community/riemann-hypothesis (`Development/AbelianVarietyTheory/Proofs/TorusHaarMeasure/GramDetDivIndexEqOfSpanEqStatement.lean`): the same Gram-over-CM-type and `relIndex` form, with other names and binders. I did not establish the repository's licence.
- Scope: 2.5b and the method labels of 2.5a, 2.5b and 3.1 rest on [FormalProof], an unrefereed formalisation announced on 20 November 2026 (README lines 333–334). The roadmap's other sources, Roy–Thunder 1996 and Bombieri–Vaaler 1983, are refereed.
