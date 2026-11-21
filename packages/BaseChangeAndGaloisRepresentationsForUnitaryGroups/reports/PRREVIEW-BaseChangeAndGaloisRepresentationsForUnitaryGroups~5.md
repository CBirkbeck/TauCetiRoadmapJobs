# Review of BaseChangeAndGaloisRepresentationsForUnitaryGroups (pull request #2890 at 650e4a7)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BaseChangeAndGaloisRepresentationsForUnitaryGroups/`
**Verdict:** needs changes

**Summary.** One finding blocks: theorem 16.1 and headline (4) give the Hodge–Tate weights of `r_{ℓ,ι}(Π)` through "the base-changed weight `a` of `λ`", which the README never defines, and the one reading a supplier offers gives the dual of the true weights (rank one: `−m` and `m`, not `m` and `m`). Everything else I computed held: the Deligne–Henniart threshold against the source, the Gauss-sum counterexamples in ranks 5, 6 and 8, the depth-zero `ε`-factor and rectifier, the Satake bookkeeping of 16.1, the `GL_3(𝔽_2)` Check, and every supplier citation I opened. There are three small corrections and one format note, none blocking. The human reviewers have one scope question and one licence question.

## R01 (P2) — In 16.1 the Hodge–Tate weights are stated for "the base-changed weight `a` of `λ`", which is not defined, and the reading available from the suppliers gives the wrong weights

An implementer cannot state the de Rham clause of 16.1 (lines 862–863, and headline (4), line 13) without knowing `a`, and the consumers of 16.1 use exactly these weights. The text says the representation is de Rham "with labelled weights `{a_{τ,i} + n − i}` for the base-changed weight `a` of `λ`". No sentence of the README says what `a` is in terms of `λ`. The only notion of that name in the suppliers is the base change of weights of AutomorphicGaloisRepresentationsPartII AG2.0 (restriction of embeddings, `(a_{F′})_{τ,i} = a_{τ|_F,i}`), which would give `a_τ = a_{τ∘c} = λ`.

That reading is false. Take `n = 1`, `U(V)` the norm-one torus, `Π_v(z) = z^m` on the unit circle read through `τ`. Then `BC(Π)(x) = Π(x/x^c)` has component `z ↦ z^m z̄^{−m}` at `τ`. In the convention of AG2.0 (the infinitesimal character of `π_τ` is that of `Ξ_a^∨`, and the norm character has `a = −1` with `r = ε_ℓ`, weight `−1`), this is `a_τ = −m`, `a_{τ∘c} = m`. So `HT_τ = {−m}` and `HT_{τ∘c} = {m}`, as conjugate self-duality requires, and not `{m}`, `{m}`. In general, with `Π_v` of highest weight `λ_τ` read through `τ`, `a_τ = (−λ_{τ,n}, …, −λ_{τ,1})` and `a_{τ∘c} = λ_τ`. The only Check on the weights (line 886, `λ = 0`) cannot tell `a_τ = λ_τ` from its dual. The same convention is silent in the comparison with PotentialAutomorphyInfrastructurePartII §3.6 (lines 867–873): that section takes `Π_∞ ≅ ξ_{ιλ}^∨` and gets `HT_τ = {λ_{τ,j} + n − j}`, so its `λ` is the dual of the `λ` of 16.1.

Smallest change: define `a` in 16.1 (for `τ` above `v`, `a_τ = −w₀λ_τ` and `a_{τ∘c} = λ_τ`, or take `Π_∞` to be the dual of the representation of highest weight `λ` as §3.6 does, and say which); add the rank-one instance above as a Check; say in the comparison with §3.6 how the two `λ` correspond. The docstring of `Suggested.lean` ("the labelled weights of `λ`") follows.

## C01 — EndoscopicTransferAndUnitaryTraceComparison §2.10 gives the orbital integrals of the packet average, not of one pseudo-coefficient

Steps (1) and (6) of the route of 13.8a (lines 542–543, 565–567) and the contract (line 923) cite §2.10 for the elliptic orbital integrals `conj Θ_{π_τ}/vol` of the pseudo-coefficient of a single `π_τ`, and for the sum of one discrete series character over the conjugates of a torus point. §2.10 computes the trace and the elliptic orbital integrals of the Euler–Poincaré function `f_ξ`, the average over the packet, with value `tr ξ(γ)/vol`; AutomorphicSpectralTheory §6.18 gives traces only. The value for one member of the packet is found in neither place. Either add it to the steps listed as not given at the end of the route, or say how it is drawn from §2.10 (the stable orbital integrals of the members of a packet agree).

## C02 — Headline (1), and the parts of headline (3) that are 14.1 and 15.1, are by the README's own account theorems of two roadmaps on main

The Summary (lines 5–11) and the docstring of `Suggested.lean` present 10.29a, 14.1 and 15.1 as headline theorems of this roadmap. The body says that 10.29a "is EndoscopicTransferAndUnitaryTraceComparison clause by clause, with the same hypotheses" (line 122), that 14.1 is the away-from-`ℓ` part of AutomorphicGaloisRepresentationsPartII AG2.7, and that 15.1 is a case of AG2.6; the Scope section claims only alternative routes for the last two. A reader of the Summary alone takes them for new results. One clause in the Summary would do: that (1) restates the results of EndoscopicTransferAndUnitaryTraceComparison §§10.20–10.30 in the terms of LocalFactorsOfTwistsAndTypes §6.5, and that for 14.1 and 15.1 this roadmap adds a route without the irreducibility input.

## C03 — The description does not name ModularityAndLanglandsExtensions, a supplier added since the head it was written for

14.1 and 15.1 now take ModularityAndLanglandsExtensions §2.43 as the input of their first route, and that roadmap is still an open pull request. The description says "Sub-roadmaps of the family and other roadmaps that are still in open pull requests, among them PotentialAutomorphyInfrastructurePartII, merge first", and its task list has neither roadmap. Text that would be right: "…among them PotentialAutomorphyInfrastructurePartII (16.1) and ModularityAndLanglandsExtensions (§2.43, for 14.1 and 15.1), merge first."

## N01 — TeX macros in code spans

`\bar χ` and `\overline{…}` in the route of 10.33d (lines 283–288) and in the rank-five Check of 10.34 (line 451); the README elsewhere writes `conj`.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| 6.3a closed image | `x/x^c = e ∈ E^×` | `ee^c = 1`, `e = f/f^c`, `xf⁻¹` fixed by `c` | kernel is the image of `C_F` |
| 6.3a parity | real `v` complex in `E` | `(z/|z|)^m` on `ℝ^×` is `sgn^m`; `η_v^κ = sgn^κ` | `m ≡ κ` forced |
| 6.3a avoiding split places | units at `w ∣ u` split, with archimedean part | element `= e·a` forces `e ∈ F` at any other place, then the unit is 1 | injective, so prescription possible |
| 10.27 valuation of `c_χ` | general `a ≥ 2`, `n(ψ)` | trivial on `𝔭^a`, not on `𝔭^{a−1}`: `v(c) = a + n(ψ)` | holds |
| 10.27 uniqueness | two solutions `c, c′` | `v(1 − c/c′) ≥ a − ⌈a/2⌉ = ⌊a/2⌋` | coset of `1 + 𝔭^{⌊a/2⌋}`, DH's `U(α/2)` |
| 10.27 `a = 1` | ideal `𝔭`, `n(ψ) = 0` | both sides 1 iff `v(c) ≤ 1` | Check true |
| 10.27 formula against source | DH 4.6, 4.7 with `γ = a⁻¹`, `c = a⁻¹` | `ε(W ⊗ χ) = det W(γ)` for `β(W) < α(χ)/2`; relation on `v(y) > α/2 = ⌈a/2⌉` | agrees |
| 10.29a clauses | properties 1–5, duals, twists | §10.20 rank one and twist; §10.21, §10.26 supercuspidal and `N = 0`; §10.28 pair `ε`; §10.30 determinant | each found where cited |
| 10.30 transport | rank one | `χ∘Art_ar⁻¹ = (χ∘Art_geo⁻¹)⁻¹` | dual, as LocalFactors §6.5 defines |
| 10.33a centre | `det Ind 1` at Frobenius | sign of an `n`-cycle `= (−1)^{n−1}` | `ξ|_{F^×}η_n` |
| 10.33a (b) unlinked | `ξ/ξ∘φ^j` | absolute value 1 (`|ξ|` is fixed by `φ`) | not `ν^{±1}` |
| 10.33b | lattice `L′ ⊂ L`, `⊄ ϖL` | image in `L/ϖL` is `ū`-stable, nonzero, so all | one fixed vertex |
| 10.33c `n = 1` | unit `γ`, `δ` | `O_γ = f(γ̄)`; `TO_δ = f(N δ̄)·vol(F^×∖F_d^×) = f(N δ̄)` | holds |
| 10.33c (b) | non-norm `γ`, `n = 1` | `d ∤ v(γ)`, so `γ` is not a unit, `O_γ = 0` | holds |
| 10.33c inverse of `δ₀` | `p, p′` lifting `y, y⁻¹` | `pp′ ≡ 1` mod `χ_γ`, Cayley–Hamilton | `δ₀ ∈ K_d` |
| 10.33d | `n = 2`, `l = 3` | `θ^{q³} = θ^q ≠ θ` on `k_6^×` | regular over `k_3`, supercuspidal lift |
| 10.34 (ii) exponent | zeta integrals | `n + n(n−1)/2 − n² = −n(n−1)/2`; with `w = (−1)^{n−1}q^{n(n−1)/2}G_n` | formula as stated |
| 10.34 Galois constant | Tate, `a(χ) = 1`, `n(ψ) = 0` | `χ(ϖ)G_1(χ̄⁻¹)q^{−s}`, over `F_n`: `q^{−ns}` | matches, sign `(−1)^{n−1}` is `Δ_n` |
| 10.34 rank 5 | `(q,n) = (4,5)`, order 33 | `2⁵ ≡ −1 (33)`: pure Gauss sums, all `32`; with `ψ₀(a·)`: `conj χ(a)·32 = 32e^{2πi/3}` for both | Check true |
| 10.34 ranks 6, 8 | `(3,6)` order 28; `(2,8)` order 17 | `3³ ≡ −1 (28)`: sign `(−1)^{28/28}`, sums `−27`; `2⁴ ≡ −1 (17)`: `16` | true; `5 ∉ ⟨3⟩`, `3 ∉ ⟨2⟩` |
| 10.34 character Check | `ξ = Δ_nθ̃` at `ϖ^a u` | `θ̃(ϖ)^a = (−1)^{(n−1)a}ξ(ϖ)^a` | `(−1)^{(n−1)(a+1)}` |
| 10.35 (d) | unramified, `N = 0` | all segments of length one: the spherical Langlands quotient | holds; `St₂` excluded |
| 13.8a Check | `GL_3(𝔽_2)`, transvection values `1,−1,−1,2,−1,0` | fixed dimensions `(χ(1)+3χ(t))/4 = 1,0,0,3,1,2`; `42 = 168/4`; `Σ d² = 15` | true |
| 13.8a symmetry | other place above `v` | opposite radical of `N_a` is conjugate to `N_{r−a}` | condition symmetric |
| 14.1 | `w ∤ ℓ` | AG2.7 export with §2.43; twist route through AG2.5 and AG2.2 | supplied |
| 14.2 Check | `q = 2`, order 7 | `⟨2⟩ = {1,2,4} ∌ 6` | true |
| 15.1 step (2) | `H = ⟨x⟩·∩ker η_k` | `N(𝒪_{M′}^×) ⊂ H ∩ 𝒪^×` as `v(x) ≠ 0` | twists unramified |
| 15.1 step (8) | `X|_{W_n} ⊃ ξ` | Frobenius reciprocity, equal dimensions, `X` semisimple | isomorphism |
| 15.2 | `a ∈ (ℤⁿ)_w`, `k = n+1−i` | `w + n − 1 − (a_{τ,k} + n − k) = w − a_{τ,k} + n − i` | holds |
| 16.1 Frobenius | block `(i,j)` | `q^{(n_i−1)/2}αq^{−s_{ij}} = q^{(n−1)/2}αq^{−(d_i−1)/2+j}` | holds |
| 16.1 against §3.6 | split `w`, eigenvalues `t_j = q^{j(n−j)/2}e_j(α)` | `Σ(−1)^j q^{j(n−1)/2}e_j(α)X^{n−j} = ∏(X − q^{(n−1)/2}α_i)` | same polynomial |
| 16.1 weights | `n = 1`, `Π_v = z^m` | `a_τ = −m`, `a_{τ∘c} = m`; restriction of embeddings would give `m, m` | R01 |
| 16.1 trivial example | `n = 2`, `λ = 0` | `s_{10} = 0`, `s_{11} = −1`; `r = 1 ⊕ ε_ℓ^{−1}`; `(X−1)(X−q)`; `{0,1}` | holds |

- Source locators checked against the text: Deligne–Henniart 1981, Théorème 4.6 and Lemme 4.7 (its text, lines 872–888, printed pp. 110–111); Kottwitz 1986, the statement for unit elements (its text, lines 26–95, pp. 237–239); Caraiani–Scholze in arXiv v1 only (5.5.5 is a lemma there, line 3718).
- Library declarations opened at the pin: `groupCohomology.exists_div_of_norm_eq_one` (Mathlib/RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean:134), `MonoidHom.isOpenMap_of_sigmaCompact` (Mathlib/Topology/Algebra/Group/OpenMapping.lean:114), `complexComponent` (TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/InfinityType.lean:150); no Weil–Deligne, smooth or supercuspidal carrier in either library.
- Cross-roadmap citations resolved: about 75, on main and at the open heads of FiniteReductiveGroups, LocalFactorsOfTwistsAndTypes, HermitianFormsAndLattices, DiscreteSeriesCoefficientsAndAutomorphicMetrics, PotentialAutomorphyInfrastructurePartII and ModularityAndLanglandsExtensions; every section and titled target exists and says what is cited, except as in C01.
- The remarks of the earlier review are settled at this head: 16.1 cites PotentialAutomorphyInfrastructurePartII §3.6; the five supplier citations were repointed; the automatic clause of 6.3a is gone; the three supplier names are in prose.
- Dependency check: `depcheck: 171 roadmaps, 2002 edges, 0 problem(s)`; no UPWARD or CYCLE line. LocalFactorsOfTwistsAndTypes and FiniteReductiveGroups name this roadmap only as a consumer.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output. It declares nothing (no `sorry`, no `set_option`, single `import Mathlib`), so there is no signature to compare and no one-tactic probe to run. The four headlines are each named in the docstring with the carriers they lack.
- The automatic checks all passed; nothing changes outside the folder apart from the family index.

Overlap check: read LocalFactorsOfTwistsAndTypes, CongruenceModulesOfThetaLifts, UniformWildKernelBounds, HeckeIdealsAndTaylorWilesRelations, FiniteReductiveGroups (open) and AutomorphicGaloisRepresentationsPartII, EndoscopicTransferAndUnitaryTraceComparison, GL2AutomorphicRepresentationsAndTransfer (main). Shared objects and owners: the properties of the trace-defined correspondence, EndoscopicTransferAndUnitaryTraceComparison §§10.20–10.30 (cited by 10.29a, 10.30); the away-prime and coefficient-prime comparisons, AutomorphicGaloisRepresentationsPartII AG2.5–AG2.7 (cited by 14.1, 15.1, which keep a second route); Galois representations on the group of PotentialAutomorphyInfrastructurePartII §3.1, its §3.6 (cited by 16.1); the inertial type for `GL₂(ℚ_x)`, GL2AutomorphicRepresentationsAndTransfer §R16.3.9 (cited in a Check). Splitting characters of a general quadratic extension have no other owner: MetaplecticAutomorphicForms and AutomorphicLFunctionsAndLocalFactorsPartII use them as data. CongruenceModulesOfThetaLifts, UniformWildKernelBounds and HeckeIdealsAndTaylorWilesRelations consume this roadmap.

Source independence: 7 passages compared with 3 sources (the statement, the definition of `c_χ` and the route of 10.27 and the threshold sentence of 10.34 with Deligne–Henniart; the statement and the attribution of 10.33c with Kottwitz; the remark of 16.1 with Caraiani–Scholze v1), none shared; largest share Deligne–Henniart 1981, 2 of 8 locators (equal with three others); contents compared with Deligne–Henniart §§0–4: independent, one target cites it. Kudla 1994, Harris–Kudla–Sweet 1996 and Labesse 2011 could not be read.

Research link: Layer 10 is the explicit depth-zero local Langlands correspondence (Henniart 1992; Bushnell–Henniart 2005) with Kottwitz's 1986 matching extended to functions from the residue field; Layers 14–16 apply Caraiani's and Labesse's (2011) results to definite unitary groups. Rests on the README; the family index says the family follows an unpublished formal proof.

## Not verifiable

- Kudla 1994 §1 (6.3a): paywalled; the citation resolves to the publisher only.
- Harris–Kudla–Sweet 1996 §1 (6.3a): the publisher's host is not one the sources service reads.
- Labesse 2011 (16.1, the hypothesis `[E⁺:ℚ] ≥ 2`): the only copy is on a third party's page and was not used; the hypothesis agrees with EndoscopicTransferAndUnitaryTraceComparison §6.29.
- Caraiani–Scholze, Corollary 5.5.5 in the published numbering: the published version is paywalled, and arXiv v1 numbers a different statement 5.5.5.
- Hecke 1918–20, Harris–Taylor 2001, Henniart 2000 and 1992, Bushnell–Henniart 2005, Green 1955, Harris–Lan–Taylor–Thorne 2016, Laumon–Rapoport–Stuhler 1993: cited without locators, not read.
- 10.33c, 10.33d, 13.8a and 15.1 cite no source for their statements; they were checked by computation only, and the five steps of 13.8a listed as not given were not checked.

## Source issues

- none

## For the human reviewers

- Scope: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 9–12) says the family follows a formal Lean proof of the Riemann hypothesis announced on 20 November 2026; I found no refereed source for it. Targets 10.33c, 10.33d, 13.8a and 15.1 here cite no literature.
- Licence: that formal proof is linked from the family index as a public repository; I did not open it and could not check whether any statement or arrangement of this README is adapted from it, or under what licence it is published.
