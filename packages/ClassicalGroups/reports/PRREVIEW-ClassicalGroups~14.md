# Review of ClassicalGroups (pull request #3027 at 644c332)
Folder: `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 107 changed lines since `74a09b7`. Checked: the two added sections, §6.6a (the Capelli identity) and §6.6b (quantum minors of `u + E`), clause by clause with their Checks, routes and source locators, by hand for `n = 2` and symbolically for `k = n = 3`; the README at the merge base as the record; ownership against main and the open pull requests; the dependency check; and the elaboration of `Suggested.lean`. Every statement and Check holds and nothing is removed, so there is no finding: two small corrections (the description does not mention this revision; an untouched-text remark on three Tau Ceti names missing at the pin) and no format notes, none blocking. One decision of the human reviewers was applied, and a note on the source manifest is left for them.

## C01 — The pull request's description does not say that it revises ClassicalGroups, a roadmap on main.

A reader of the description cannot tell that this roadmap gains two sections or that two roadmaps of the family now take their general theorems from it. Neither the title nor the description names ClassicalGroups, the Capelli identity or the quantum minors: the "49 existing roadmaps" are not listed, and the largest additions it names do not include this one. Nothing is removed or renumbered and `Suggested.lean` is unchanged, so one sentence would cover it, for instance: "ClassicalGroups gains §6.6a (the Capelli identity over every commutative ring) and §6.6b (quantum minors of `u + E` for elements satisfying the relations of `𝔤𝔩_n`: antisymmetry and row form, centrality and highest-weight value of `qdet(u)`, the quantum comatrix); IntegralWeylModulesOfGeneralLinearGroups 3.1 and TensorInductionAndFiniteGroupInputs 9.1 (a), (c), (d) cite them as their general theorems. No section, supplier or `Suggested.lean` declaration of ClassicalGroups changes."

## C02 — Untouched text: README §4.2 and the Tau Ceti contract name three character theorems that the pinned Tau Ceti does not have.

The *Needs* line of §4.2 (line 816) and the *From Tau Ceti* contract (lines 1932–1933) name `TauCeti.char_weylFDRepOfShape_diagramOf_diagonal_eq_sum_spechtChar`, `TauCeti.char_weylFDRepOfShape_diagonal_of_colLen_le_one` and `TauCeti.char_weylFDRepOfShape_diagonal_of_rowLen_le_one`, the last two located at `WeylModule/Character.lean:93,132`. None of the three occurs anywhere in the pinned Tau Ceti, so an implementer who follows the contract finds nothing. What the pin has is `TauCeti.char_weylFDRepOfShape_ofPartition_diagonal_eq_sum_spechtChar` (`TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/SchurWeyl.lean:167`), which looks like a rename of the first name, and `TauCeti.char_weylFDRepOfShape_ofPartition_diagonal` and `TauCeti.char_weylFDRepOfShape_diagonal_eq_eval_diagramSchurPoly` (`.../WeylModule/Character.lean:92,110`). No one-row or one-column special case exists under any name. This text is the same on main and this pull request does not touch it. A separate pull request could name the pinned declarations, or describe the one-row and one-column identities in prose if they are meant as targets.

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| §6.6a `det(g)·det(∂) = A_k(k−1)` | k=1; k=2 on `det g`; k=3 on `det g`, `det g²`, `g₁₁·det g`, three random polynomials | k=1: `g₁₁∂₁₁ = E₁₁ = A₁(0)`; k=3: `det(∂)det g = 6`, both sides `6·det g`; all six tests equal | holds | none |
| §6.6a polarisation relations | general `a,b,c,d` | `[g_as∂_bs, g_ct∂_dt]` sums to `δ_bc E_ad − δ_ad E_cb`; same as molev2003yangians line 138, mno1996 (1.2.1) | holds | none |
| §6.6a over any commutative `R` | char p, `ℤ` | css2009 Cor. 1.3 (lines 182–220) holds in any ring with (1.18a–c), `h = 1`; operators on `R[g]` satisfy them | holds | none |
| §6.6a Check `k = 2` | `f = det g` | `det(∂)f = 2`; `E₁₁f = E₂₂f = f`, `E₁₂f = 0`: shifted `2f`, unshifted `f` | true, separates shift | none |
| §6.6b `qdet(u) = A_n(u)` image | n = 2, 3 | shifts `u − c + 1` in column c equal §6.6's; mno1996 Remark 2.11 (1) gives the same determinant | holds | none |
| §6.6b (a) antisymmetry | n=3, `u ∈ {0,1,5/2,−3}`; columns swapped; repeated column `(2,2)` | `M + M(swapped) = 0`; repeated-column minor `= 0` on four test polynomials | holds | none |
| §6.6b (a) row form | t = 2, 3, rows `(2,2,3)` repeated | column form = row form on all tests; n=2 difference `(E₁₁−E₂₂) − [E₁₂,E₂₁] = 0` | holds | none |
| §6.6b (b) centrality | n=3, all nine `E_cd`, four values of `u` | `E_cd·qdet(u)f = qdet(u)·E_cd f`; n=2 both commutators `E₁₂E₂₂ − E₁₂E₁₁ − 2E₁₂` | holds | none |
| §6.6b (b) highest-weight value | `v = g₁₁²·det₂`, weights `(3,1,0)` | `qdet(u)v = (u+3)u(u−2)v` for all four `u`; molev2003yangians (4.1), `l_i = λ_i − i + 1` | holds | none |
| §6.6b (c) comatrix | n=3 all `(i,l)`; n=2 `(1,1)`, `(1,2)`; n=1 | sum `= δ_il·qdet(u)` on three tests; n=2: `qdet(u)` and `[E₂₂,E₁₂]+E₁₂ = 0`; n=1: `u+E₁₁` | holds | none |
| §6.6b exchange relation of the route | general | right side expands to `(u−w)(δ_bc E_ad − δ_ad E_cb) = (u−w)[E_ab,E_cd]`; molev2003yangians (2.3) under (2.7) | holds | none |
| §6.6b evaluation normalisation | size-t minor | `t_ij(u−s) ↦ (u−s)⁻¹((u−s)δ_ij+E_ij)`; multiplying by `u(u−1)⋯(u−t+1)` gives both forms of §2.6 | holds | none |
| §6.6b Check 3 against §6.6 | `λ = (2,1)` | `(u+2)(u+1−1) = u(u+2)`, as §6.6's second Check | consistent | none |
| Headline: Weyl dimension = GT count | `λ = (2,1,0)` | Weyl product `2·2·2 = 8`; patterns `2+1+3+2 = 8` | consistent | none |
| Headline: Schur character | shape `(2,1)` at `diag(2,3)` | `4·3 + 2·9 = 30 = det·trace = 6·5` | true | none |
| Headline: branching `GL₂ ↓ GL₁` | `(1,−1)` | weights `−1,0,1`; at `t=2`: `1/2+1+2 = 7/2` | true | none |
| Headline: diagonal overgroups | n = 1 against n = 2 | n=1: `{(cg,g)}` is the whole group and equal determinant is the diagonal, so "distinct for n ≥ 2" is needed | true as stated | none |
| C02: §4.2 *Needs*, Tau Ceti contract | pinned Tau Ceti | three names: no occurrence; pin has `…ofPartition_diagonal_eq_sum_spechtChar` (SchurWeyl.lean:167), `…diagonal_eq_eval_diagramSchurPoly` (Character.lean:110) | stale names | C02 |

- Source locators checked against the text: 10 of the 11 in the changed passages. These are molev2003yangians (arXiv math/0211288v1) Prop. 2.2 (line 200), §2.6 (lines 349–409), Def. 2.26 (line 634), Prop. 2.27 (lines 638–642), (4.1) (line 1393); mno1996 (arXiv hep-th/9409025v2) 1.16 (lines 980–983), Thm 2.10 (line 1409), Remark 2.11 (lines 1488–1511); css2009 (arXiv 0809.3516v2) Cor. 1.3, (1.19c), (1.20a) (lines 182–220).
- Library declarations opened at the pins: `MvPolynomial.pderiv` (Mathlib/Algebra/MvPolynomial/PDeriv.lean:61), `Matrix.det` (Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:63), `UniversalEnvelopingAlgebra.lift` (Mathlib/Algebra/Lie/UniversalEnveloping.lean:92); Tau Ceti WeylModule/Character.lean and WeylModule/SchurWeyl.lean. Neither library has the Capelli identity or quantum minors.
- Cross-roadmap citations resolved: IntegralWeylModulesOfGeneralLinearGroups 3.1 (line 328) with its scope, and TensorInductionAndFiniteGroupInputs 9.1 with its scope, cite exactly the clauses §§6.6a and 6.6b state. The change adds no roadmap supplier.
- Record: README at the merge base against the head has 10 layers, none removed or retitled, 0 headings removed and 2 added; main's folder is identical to the merge base.
- Automatic checks: all passed. Dependency check output: `depcheck: 129 roadmaps, 1454 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` (unchanged by the pull request): exit 0, 11 warnings `declaration uses sorry`, no other diagnostics.
- Computation: exact rational check in the polarisation representation, `k = n = 3`, `u ∈ {0, 1, 5/2, −3}`: every clause of §§6.6a–6.6b holds.

Overlap check: read ClassicalGroupsPartII, NonintersectingPathsAndLGV, RepresentationTheory (index), CompactGroupsPartII, TensorProductCombinatorics, LieHighestWeight, SchurWeyl; nothing shared. The Capelli identity and the quantum minors are owned here; the family roadmaps that state them cite §§6.6a–6.6b as owner. Ownership against the open pull requests was checked with the search over their heads.

Source independence: changed passages only. 10 passages (6.6a statement, route and Checks; 6.6b definition, clauses (a)–(c), attribution, route and Checks; the Dependencies and Scope sentences) compared with 4 sources (molev2003yangians, mno1996, css2009, molev2002); the longest shared run is 6 words, a standard phrase. Largest share of the changed passages' locators: molev2003yangians, 5 of 11. No layer added, removed or reordered, so contents not compared. Result: independent.

Research link: §§6.6a–6.6b are the Capelli identity (Capelli 1887; Howe–Umeda 1991; Caracciolo–Sokal–Sportiello 2009) and the evaluation images of the Yangian quantum minors (Molev–Nazarov–Olshanski 1996; Molev 2003), the Capelli generators behind Molev's Gelfand–Tsetlin bases (molev2002 (2.21)–(2.22)). This rests on the README's References and the three open texts read.

## Not verifiable

- Howe–Umeda 1991, formula (1.12), p. 568, and its polarisation convention: the article is behind the publisher's paywall and the sources service found no open copy. The identity itself is checked against css2009 Cor. 1.3.
- Capelli 1887 (Math. Ann. 29, 331–338): only the GDZ volume page was fetched, not the article. The bibliographic data agree with mno1996 line 3328 and css2009 line 1886.
- The page range 907–959 of Molev's survey in the Handbook of Algebra, vol. 3: the arXiv text gives only the volume (molev2003yangians line 11).

Automatic checks set aside as false positives: the citation resolver lists ten Layer 6A names (`DiagonalOvergroups.determinantEqual` and nine more) as found nowhere, but `Suggested.lean` declares each of them. The resolver does not read the roadmap's own Lean file.

## Source issues

- none

## For the human reviewers

- The decision that the family's published theorems live in general roadmaps was applied. Here it reaches only citations: TensorInductionAndFiniteGroupInputs 9.1 (a), (c), (d) and IntegralWeylModulesOfGeneralLinearGroups 3.1 take their general theorems from §§6.6b and 6.6a, which state them. ClassicalGroups loses nothing.
- The board's source manifest for ClassicalGroups records only molev2002 and milne2022. The five works cited by §§6.6a–6.6b are not recorded; Howe–Umeda 1991 is paywalled and was not read.
