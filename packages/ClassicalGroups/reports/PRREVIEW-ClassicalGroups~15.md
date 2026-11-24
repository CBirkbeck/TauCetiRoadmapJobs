# Review of ClassicalGroups (pull request #3027 at 855180d)
Folder: `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 107 changed lines since `74a09b7`. Checked: the two added sections, §6.6a (the Capelli identity) and §6.6b (quantum minors of `u + E`), statement by statement with their routes, Checks and source locators, by hand for `n = 2` and by exact computation for `k = n = 3`; the README at the merge base as the record; ownership against main and the open pull requests; the dependency check; the elaboration of `Suggested.lean`. Every statement and Check holds, nothing is removed or renumbered, and the folder is unchanged since the previous review, so there is no finding: two small corrections (the description does not mention this revision; an untouched-text remark on three Tau Ceti names absent at the pin) and no format notes, none blocking. One decision of the human reviewers was applied, and a note on the source manifest is left for them.

## C01 — The pull request's description does not say that it revises ClassicalGroups, a roadmap on main.

A reader of the description cannot tell that this roadmap gains two sections, or that two roadmaps of the family now take their general theorems from them. Neither the title nor the description names ClassicalGroups, the Capelli identity or the quantum minors: the "49 existing roadmaps" are not listed, and the additions it singles out do not include this one. Nothing is removed or renumbered and `Suggested.lean` is unchanged, so one sentence covers it, for instance: "ClassicalGroups gains §6.6a (the Capelli identity over every commutative ring) and §6.6b (quantum minors of `u + E` for elements satisfying the relations of `𝔤𝔩_n`: antisymmetry and row form, centrality and highest-weight value of `qdet(u)`, the quantum comatrix); IntegralWeylModulesOfGeneralLinearGroups 3.1 and TensorInductionAndFiniteGroupInputs 9.1 (a), (c), (d) cite them as their general theorems. No section, supplier or `Suggested.lean` declaration of ClassicalGroups changes."

## C02 — Untouched text: README §4.2 and the Tau Ceti contract name three character theorems that the pinned Tau Ceti does not have.

The *Needs* line of §4.2 (line 816) and the *From Tau Ceti* contract (lines 1932–1936) name `TauCeti.char_weylFDRepOfShape_diagramOf_diagonal_eq_sum_spechtChar`, `TauCeti.char_weylFDRepOfShape_diagonal_of_colLen_le_one` and `TauCeti.char_weylFDRepOfShape_diagonal_of_rowLen_le_one`. None of the three occurs in the pinned Tau Ceti, so an implementer who follows the contract finds nothing. The pin has `TauCeti.char_weylFDRepOfShape_ofPartition_diagonal_eq_sum_spechtChar` (`TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/SchurWeyl.lean:167`), apparently the first under a new name, and `TauCeti.char_weylFDRepOfShape_ofPartition_diagonal` and `TauCeti.char_weylFDRepOfShape_diagonal_eq_eval_diagramSchurPoly` (`.../WeylModule/Character.lean:92,110`); no one-row or one-column special case exists under any name. The text is the same on main and this pull request does not touch it. A separate pull request could name the pinned declarations, or describe the one-row and one-column identities in prose if they are meant as targets.

## Previous findings

- The previous review (at `644c332`) had no finding. Its two small corrections are C01 and C02 above; the folder is byte-identical at this head and the description still does not name ClassicalGroups, so both stand unchanged.

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| §6.6a polarisation relations | general `a,b,c,d` | `Σ_{s,t}[g_as∂_bs, g_ct∂_dt] = δ_bc E_ad − δ_ad E_cb`; equals molev2003yangians line 138 | holds | none |
| §6.6a `det(g)·det(∂) = A_k(k−1)` | k=1; k=2 on `det g`; k=3 on `det g`, `(det g)²`, `g₁₁²·det₂`, two random polynomials | k=1: `g₁₁∂₁₁ = E₁₁`; k=3: `det(∂)det g = 6`; five tests equal; unshifted `A_3(0)` differs | holds | none |
| §6.6a against css2009 Cor. 1.3 | `A = g`, `B = ∂`, `m=n=r=k`, `h=1` | `[g_ij,∂_kl] = −δ_ik δ_jl`; `(ABᵀ)_ab = Σ_s g_as∂_bs = E_ab`; `Q_col = diag(k−1,…,0)`; col-det ordered as (1.4) | source supports it for every ring | none |
| §6.6a Check `k = 2` | `f = det g` | `det(∂)f = 1−(−1) = 2`; `E₁₁f = E₂₂f = f`, `E₁₂f = g₁₁(−g₁₂)+g₁₂g₁₁ = 0`: shifted `2f`, unshifted `f` | true, separates the shift | none |
| §6.6b exchange relation | general `u,w` | right side `= (u−w)(δ_bc E_ad − δ_ad E_cb) = (u−w)[E_ab,E_cd]` | holds | none |
| §6.6b (a) column antisymmetry, route | adjacent factors, shifts `u, u−1` | `S(b,d)+S(d,b)`: the eight Kronecker terms cancel in pairs, sum `0` | route sound | none |
| §6.6b (a) antisymmetry | n=3, `u ∈ {0,1,5/2,−3}`, rows `(2,1,3)`, columns `(3,2,1)`, `τ` a transposition and a 3-cycle | `M^{a∘τ}_b = sign(τ)M^a_b = M^a_{b∘τ}` on four polynomials; repeated row or column gives `0` | holds | none |
| §6.6b (a) row form | n=2 by hand; n=3 five index pairs incl. repeated and size 2 | n=2: difference `(E₁₁−E₂₂) − [E₁₂,E₂₁] = 0`; n=3: column form = row form on all tests | holds | none |
| §6.6b (b) centrality | n=2 by hand; n=3 all nine `E_cd`, four `u` | n=2: both commutators `= E₁₂E₂₂ − E₁₂E₁₁ − 2E₁₂`; n=3 equal; determinant with equal shifts is not central | holds | none |
| §6.6b (b) highest-weight value | `v = g₁₁²·det₂`, `θ = (3,1,0)` | `qdet(u)v = (u+3)·u·(u−2)·v` for four `u`; molev2003yangians (4.1), `l_i = θ_i − i + 1` | holds | none |
| §6.6b (c) comatrix | n=2 `(1,1)`, `(1,2)` by hand; n=3 all nine `(i,l)` | n=2: `qdet(u)` and `[E₂₂,E₁₂]+E₁₂ = 0`; n=3: `δ_il·qdet(u)`; unshifted last factor fails on three of five tests | holds | none |
| §6.6b (c) route | expansion along last column | sign `(−1)^{n−j}` from `σ(n)=j`; columns `(…î…,i)` give `(−1)^{n−i}`; product `(−1)^{i+j}` | route sound | none |
| §6.6b evaluation normalisation | size-`t` minor | `(u−s)·(δ_ij + E_ij/(u−s)) = (u−s+E)_ij`; product over `s<t` gives both forms of molev2003yangians §2.6 and (2.31) with (2.30) | holds | none |
| §6.6b Check 3 against §6.6 | `λ = (2,1)` | `(u+2)(u−1+1) = u(u+2)`, §6.6's second Check | consistent | none |
| Family citations of §§6.6a–6.6b | IntegralWeylModulesOfGeneralLinearGroups 3.1; TensorInductionAndFiniteGroupInputs 9.1 (a), (c), (d) | shifts `K−1−k` from 0 = `k−c` from 1; 9.1 (a), (c), (d) agree with (a), (b), (c) term by term | the sections state what is cited | none |
| C02: §4.2 *Needs*, Tau Ceti contract | pinned Tau Ceti | three names: no occurrence; pin has `…ofPartition_diagonal_eq_sum_spechtChar` (SchurWeyl.lean:167), `…diagonal_eq_eval_diagramSchurPoly` (Character.lean:110) | stale names | C02 |

- Source locators checked against the text: 10 of 12 in the changed passages. molev2003yangians (arXiv math/0211288v1): Prop. 2.2 (line 200), §2.6 (lines 349–409), Def. 2.26 (line 634), Prop. 2.27 (lines 638–642), (4.1) (lines 1386–1394). mno1996 (arXiv hep-th/9409025v2): 1.16 (lines 980–983), Thm 2.10 (line 1409), Remark 2.11 (lines 1488–1511). css2009 (arXiv 0809.3516v2): Cor. 1.3, (1.19c), (1.20a) (lines 182–220), column-determinant (lines 71–75).
- Library declarations opened at the pins: `MvPolynomial.pderiv` (Mathlib/Algebra/MvPolynomial/PDeriv.lean:61), `Matrix.det` (Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:63), `UniversalEnvelopingAlgebra.lift` (Mathlib/Algebra/Lie/UniversalEnveloping.lean:92). Neither pinned library has the Capelli identity of invariant theory or quantum minors (the Tau Ceti file `FieldTheory/Kummer/Capelli.lean` is Capelli's irreducibility theorem).
- Cross-roadmap citations resolved: the change adds no roadmap supplier; the two family roadmaps that cite §§6.6a–6.6b were read at this head.
- Record: 10 layers at the merge base, none removed or retitled; 0 headings removed, 2 added; main's README equals the merge base's; `Suggested.lean` unchanged.
- Automatic checks: all passed. Dependency check output: `depcheck: 131 roadmaps, 1470 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean`: exit 0, 11 warnings `declaration uses sorry`, nothing else. No declaration is added or changed, so the one-tactic probe and the binder comparison had nothing new to test.
- Computation: exact rational arithmetic with the polarisation operators on polynomials in a 3 × 3 matrix of variables, `u ∈ {0, 1, 5/2, −3}`, with negative controls (unshifted determinant, unshifted comatrix factor).

Overlap check: read ClassicalGroupsPartII, NonintersectingPathsAndLGV, RepresentationTheory (index), TensorProductCombinatorics, LieHighestWeight, SchurWeyl (CompactGroupsPartII through the search over open heads only); nothing shared. The Capelli identity and the quantum minors of `u + E` are stated nowhere else on main or at an open head; the family roadmaps that use them cite §§6.6a–6.6b as owner. The "Capelli" of ArithmeticDynamics, ClassicalArithmeticCompletion, CharacterSumsOverFiniteFields and DiophantineApproximationAndTranscendence is the irreducibility theorem, another object.

Source independence: changed passages only. 10 passages (6.6a statement, route, Checks; 6.6b definition, clauses (a)–(c), attribution, route, Checks; the Dependencies and Scope sentences) compared with 3 sources read (molev2003yangians, mno1996, css2009), none shared beyond formulas and standard names; largest share of the changed passages' locators molev2003yangians, 5 of 12; no layer added, removed or reordered, so contents not compared: independent. Howe–Umeda 1991 could not be read.

Research link: §§6.6a–6.6b are the Capelli identity (Capelli 1887; Howe–Umeda 1991; Caracciolo–Sokal–Sportiello 2009) and the images in `U(gl_n)` of the Yangian's quantum minors (Molev–Nazarov–Olshanski 1996; Molev 2003), whose coefficients are the Capelli generators of Molev's Gelfand–Tsetlin bases (2002). Rests on the README's References and the three open texts read.

## Not verifiable

- Howe–Umeda 1991, formula (1.12), p. 568, and its polarisation convention: paywalled, no open copy found by the sources service. The identity itself is checked against css2009 Cor. 1.3 and by computation.
- Capelli 1887 (Math. Ann. 29, 331–338): the article was not opened; it is cited for the attribution only, with no locator inside it.
- The page range 907–959 of Molev's survey in the Handbook of Algebra, vol. 3: the arXiv text does not give it.

Automatic checks set aside as false positives: the citation resolver lists ten Layer 6A names (`DiagonalOvergroups.determinantEqual` and nine more) as found nowhere, although the roadmap's own `Suggested.lean` declares each; it does not read that file.

## Source issues

- none

## For the human reviewers

- The decision that the family's published theorems live in general roadmaps was applied: TensorInductionAndFiniteGroupInputs 9.1 (a), (c), (d) and IntegralWeylModulesOfGeneralLinearGroups 3.1 cite §§6.6b and 6.6a, which state them. ClassicalGroups loses nothing.
- The board's source manifest for ClassicalGroups records only molev2002 and milne2022; the five works §§6.6a–6.6b cite are not recorded, and Howe–Umeda 1991 is paywalled and was not read.
