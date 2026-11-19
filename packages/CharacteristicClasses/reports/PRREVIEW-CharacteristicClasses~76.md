# Review of CharacteristicClasses (pull request #2528 at 8bc8c19)

**Verdict:** needs changes

**Summary.** Changes are needed, for two findings, neither about the mathematics of the new item: the mathematics of C3.0 (definition, the three stages of additivity, the four Checks) was recomputed and holds. C3.0 names four Tau Ceti declarations or files as existing that the pinned Tau Ceti does not contain, and the module docstring of `Suggested.lean` says the pin has no Thom-class carrier and no Euler class, while it has both, so headline theorems of C2 that are statable are absent. There are six small corrections and one format note; two licence questions are left for a human.

## R01 (P2) — C3.0 cites four Tau Ceti declarations and files that the pinned Tau Ceti does not have

An implementer who opens the pinned library to reuse the cited class, the cited relative-Euler lemma, the cited determinant or the cited tensor bundle finds none of them, and the definition of c₁ is then stated relative to an object that cannot be inspected ("Tau Ceti's `TauCeti.complexEulerClass` with r=0 is this class", C3.0 *Definition*, line 1031).

At the pin (Tau Ceti `2fd255d`, `lake-manifest.json`): `TauCeti/Topology/VectorBundle/EulerClass.lean` declares `IsThomClass` (line 245), `eulerClass` (line 356), `eulerClass_naturality` (368), `eulerClass_eq_zero_of_forall_ne_zero` (383), `eulerClass_pullback` (402) and no `complexEulerClass`; the string `complexEulerClass` and the string `thomPairMapOfNeZero` occur nowhere under `TauCeti/` or in Mathlib. `TauCeti/Topology/VectorBundle/FiniteRank/` holds `Basic`, `Biproduct`, `CoordinateFunctor`, `Dual`, `Pullback`, `Realification`: `FiniteRankBundleCore.ofBundle` is there (`Basic.lean:209`), `FiniteRankBundleCore.det` is not. There is no directory `TauCeti/Topology/VectorBundle/TensorProduct/`. The four places: `TauCeti.complexEulerClass` (lines 1017 and 1031), `FiniteRankBundleCore.det` (lines 1014 and 1021), `TauCeti/Topology/VectorBundle/TensorProduct/Basic.lean` (line 1026), `TauCeti.eulerClass_eq_singularCohomologyMap_thomPairMapOfNeZero` (line 1074). The description repeats the first ("reuses Tau Ceti's existing `TauCeti.complexEulerClass`").

The smallest change keeps the item and makes each sentence true at the pin. Define c₁(L) as C2.2's Euler class of L_ℝ with the complex orientation, on the pinned `TauCeti.eulerClass` and `TauCeti.IsThomClass`; in Stage 2 describe the relative class in `H²(X,X∖Z)` as the pullback of the Thom class along the section, a target of this item; in the determinant paragraph state the comparison with TopologicalKTheory T1.2's determinant and the tensor bundle as targets rather than as library facts. Alternatively the four names stay once the repository's pin is a Tau Ceti commit that contains them; that change of pin is not part of this pull request.

## R02 (P2) — The module docstring of `Suggested.lean` says the pin has no Thom class and no Euler class, and so omits statable headlines of C2

The file is the acceptance test, and its docstring gives as the reason for stating nothing of C2.1–C2.3 that "there is no Thom-class carrier … and no orientation local system on a vector bundle at the pins" and "there is no Euler class or fundamental class of a manifold at the pins" (`Suggested.lean`, lines 11–18). Both sentences are false at the pin, and C3.0 of this pull request itself builds on the pinned Euler class.

The pin has `TauCeti.IsThomClass` and `TauCeti.eulerClass` (`TauCeti/Topology/VectorBundle/EulerClass.lean:245, 356`), orientations of vector bundles with their local system (`TauCeti/Topology/VectorBundle/Orientation/`, files `Basic`, `Cover`, `LocalSystem`, `ThomClass`), the fundamental class on compact subsets of a manifold (`TauCeti/AlgebraicTopology/Singular/LocalHomology/FundamentalClass.lean:139`), and it proves the compact-base Thom class theorem (`exists_isThomClass_of_compactSpace`, `TauCeti/Topology/VectorBundle/MayerVietoris/Basic.lean:612`; `exists_isThomClass`, `Orientation/ThomClass.lean:186`). So C2.1's existence of a Thom class over an arbitrary base is statable: it is the pinned statement without `[CompactSpace B]`. The two declarations the file does state concern formal power series only.

Correct the two docstring entries to what the pin lacks (the arbitrary-base Thom class, Chern and Stiefel–Whitney classes, classifying spaces), and state the C2 headlines that the pinned carriers allow, at least C2.1's Thom class over an arbitrary base and C2.2's Euler-class criterion for a nowhere-zero section. If the other open revision of this roadmap already states them, taking them from there after the two are ordered (C01) is enough.

## C01 — Another open pull request rewrites this README and the two heads conflict; no order is stated

Pull request #1807 ("Cut the dependency loops among the roadmaps on main") changes `TauCetiRoadmap/CharacteristicClasses/README.md`, and its head does not merge with this one. The description of this pull request does not mention it. Say in the description which of the two is rebased on the other; C3.0 and its six pointer edits are a self-contained block and are the natural one to rebase.

## C02 — The scope section says HomotopySpheres both supplies this roadmap and consumes it

"HomotopySpheres §3A and §4A supplies the earlier compactly generated substrate and consumes these classifiers" (lines 24–26), and C1.1b and C1.1d consume it again (lines 377 and 458–460). A reader cannot tell which of the two roadmaps is built first. A roadmap may consume only roadmaps that are built before it, so that no two wait on each other; followed section by section across the 200 roadmaps and their 2194 citation edges, the citations here close no cycle and none points at a later roadmap, and this pull request does not touch these lines, so this does not block; the repair is to name an owner that only supplies (the compactly generated substrate belongs with AlgebraicTopology) or to state the two inputs here, and it may be the other open revision that does it.

## C03 — The description says C5 was updated; the edit is in C3.6

"C1.5, C2.3, C5, the Conventions and the dependency order are updated to point at C3.0." The head changes C1.5 (line 711–716), C2.3 (846), C3.2 (1207–1210), C3.6 (1374, the BU(1)→BSO(2) comparison) and the Conventions and dependency paragraphs; nothing in C5 changes. Write "C3.6" for "C5".

## C04 — Stage 1 of C3.0 uses a local-index formula for a line bundle that C2.3 states without naming its bundle

Stage 1 takes from C2.3 that `⟨c₁(L),[Σ]⟩` is the sum of the local indices of a section with isolated zeros, and applies it to a holomorphic section with a zero of order k, which is not transverse. C2.3 says "On a closed oriented manifold prove the sum-of-local-indices formula and e(TM)[M]=χ(M)" (line 839–840), and its worked example uses it for TM only. Add the bundle to C2.3's sentence: for an oriented rank-m bundle E over a closed oriented m-manifold and a continuous section with isolated zeros, `⟨e(E),[M]⟩` is the sum of the local indices.

## C05 — `lSeries` in `Suggested.lean` is a second definition of the pinned `TauCeti.hirzebruchLSeries`

The file defines `lSeries` as `rescale 2 (bernoulli'PowerSeries ℚ) − X`; the pin defines `TauCeti.hirzebruchLSeries` as `rescale 2 (bernoulliPowerSeries A) + X` (`TauCeti/RingTheory/PowerSeries/CharacteristicSeries.lean:245`), the same series x/tanh x, with its coefficient lemmas and the degree-4 and degree-8 genus polynomials (`GenusPolynomials.lean:114, 121`). The degree-12 statement is not at the pin and stays; stating it on `TauCeti.hirzebruchLSeries` removes `lSeries` and `toddSeries` and lets the proof use the pinned lemmas.

## C06 — The new item and several older targets state theorems with no locator, and C5.2 cites a whole chapter

C3.0 cites no source. Two that support it, read in the cached text: Hatcher, *Vector Bundles and K-Theory*, Proposition 3.10, p. 86 (c₁ of a tensor product of lines is the sum, by the universal calculation that Stage 3 uses) and Proposition 3.13(c),(e), p. 91 (e(E)=c_n(E) for a suitable orientation; e=0 with a nowhere-zero section). The earlier review's locator points are unchanged at this head: C5.2 ends "This is the proof spine of Dupont1978 §8" (line 1488), where Dupont, *Curvature and Characteristic Classes*, Theorem 8.1 and Corollary 8.35 are the statements; C1.2b's counit theorem (line 610) is May, *Concise Course*, Chapter 16 §2, p. 124; C5.4's `H*(BO(n);Q)` (line 1505) is Hatcher, *Vector Bundles and K-Theory*, Theorem 3.16(a), p. 95, after tensoring with ℚ. C5a.1–C5a.7 carry no locator at all.

## N01 — Several names in code font are declared nowhere

For example `bundleDiskSphereRelCW`, `thomCellDimension`, `bundleDiskAttachmentCWModel`, `bundleSphereRelCWBaseHomeomorph` (C2.0) and `bsoCohomologyAwayTwo` (C3.6): a reader cannot tell a proposed name from a declaration. Say they are proposed names.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| C3.0 definition, c₁(L)=e(L_ℝ) | O(1), O(−1) on CP¹; reversed orientation (iv,v); trivial line | z₀ has one simple zero: +1; dual: −1; reversed: −1, +1; nowhere-zero section: 0 | holds; Check excludes the reversed convention | R01 (library names) |
| C3.0 conjugate and dual | L̄ of O(1); orientation (v,−iv) | −1; C2.2 reversal gives −e | holds | none |
| C3.0 c₁(E)=c₁(det E) | E=L; E=ℂ⊕L; rank 0; ℂ^r | det L≃L; Λ²(ℂ⊕L)≃L; 0 by convention; 0 | holds | none |
| C3.0 Stage 1 | TCP¹ with z∂_z; zero of order k; s⊗s' at z∈Z | zeros at 0, ∞, index +1 each, sum 2=χ(S²); index k; d(s⊗s')=ds⊗s'(z), same sign | holds | C04 |
| C3.0 Stage 2 | Z=∅; excision of X∖(U∪U') | c₁(L)=0 and L⊗L'≃L'; closed set inside open X∖(Z∪Z'), group splits as `H²(U,U∖Z)⊕H²(U',U'∖Z')`; cross terms factor through `H²(U',U')=0` | holds | R01 (lemma name) |
| C3.0 Stage 3 | O(−1) on CP¹ against C1.5's x | −1 on both sides | holds | none |
| C3.2 degree-2 coefficient | E=L₁⊕L₂ | ∏(x_i−a)=a²−(x₁+x₂)a+x₁x₂; x₁+x₂=c₁(det E) | holds | none |
| C1.0 metric transport | h₁(u,v)=h₀(Hu,v), frame H^(−1/2)e | h₁(H^(−1/2)e_i,H^(−1/2)e_j)=h₀(H^(1/2)e_i,H^(−1/2)e_j)=δ_ij; Sylvester eigenvalues λ_i+λ_j>0 | holds | none |
| C2.0 cells | radial map; rank 0; empty base | sup-norm 1 ↦ Euclidean norm 1, inverse scales back; Thom space X₊; one point | holds | N01 |
| C5a.1 CE sign, 2d formula | degree 1 | da(X,Y)=−a([X,Y]); Σe^a∧L_(e_a)α on (X,Y) = −2α([X,Y]) = 2dα | holds | C06 |
| C5a.2 character normalization | θ↦exp(iθ) | (i/2π)(ia)=−a/(2π) | holds | none |
| C5a.3 Weil algebra, CS_P | rank one, P=−a/(2π), d=1 | F=dθ+½[θ,θ], Bianchi −[θ,Ω]; CS_P=P(θ)=−θ/(2π), d_W CS_P=P(Ω) | holds | none |
| C5a.4 Koszul model | empty generator system; torus | Λ(∅)=R, trivial group; D=0 on Λ(e_i), H*(T)=Λ(g*) | holds | none |
| C5a.5 transgression degrees | z_i∈E^(0,2d_i−1) | d_(2d_i) lands in E^(2d_i,0), degree of u_i | holds | none |
| C5a.6 Poincaré series | U(2); trivial group; E₈ | (1+t)(1+t³), 4=2², top 4=dim; χ=1; Σ(2d_i−1)=248 | holds | none |
| C5a.7 degrees | SU(1), SU(2), U(2); E₈ exponents; RP²; n=2 strict upper triangular | none; 3; 1,3; 3,15,23,27,35,39,47,59; H⁰=ℤ, H²=ℤ/2; centre=whole, derived=0 | holds | none |
| C7.AdjointHopfObstruction | roots 0, ±(x−y); HP¹; Z=diag(1,−1) | c₂=−(x−y)², p₁=c₁²−4c₂; p₁=−4u, e∈H³(S⁴)=0; X=0, Y=diag(−i,i) | holds; matches `zentner-instanton-sheet2` line 50 | none |
| C7.3a | m=2, 4 | (1+a)^(m−1)=Σ_(j<m)a^j, w̄_(m−1)=a^(m−1)≠0 | holds | none |
| `lSeries_root_coefficient_six` | lSeries; r<3 | 2x/(1−e^(−2x))−x=x coth x; absent p_j are 0; L₃=(62p₃−13p₁p₂+2p₁³)/945 | holds | C05 |
| `twice_even_product_correction_eq_zero` | k=0, 1 | P₀Q₀−P₀Q₀=0; odd-odd term P₁Q₁, 2P₁=0 | holds | none |
| `Suggested.lean` docstring on C2 | pinned Euler class, Thom class | present at the pin (R02) | false sentence | R02 |

- Source locators checked against the text: 7 in 4 sources. `hatcher-vbkt` lines 844 (§1.2, pp. 22–26), 3359–3377 (Prop. 3.10), 3542–3552 (Prop. 3.13), 3681–3683 (Thm 3.16); `dupont-ccc` lines 3514, 3989; `may-concise` line 5287; `zentner-instanton-sheet2` lines 46–67.
- Library declarations opened at the pin: 14, in `Topology/VectorBundle/EulerClass.lean`, `FiniteRank/Basic.lean`, `MayerVietoris/Basic.lean`, `Orientation/ThomClass.lean`, `Singular/LocalHomology/FundamentalClass.lean`, `Topology/Homotopy/Extension/CWComplex.lean:142`, `RingTheory/PowerSeries/CharacteristicSeries.lean`, `GenusPolynomials.lean`.
- Cross-roadmap citations resolved on main: TopologicalKTheory T1.2 (determinant, line 217–218), T1.3 (Hermitian metrics, 225), T1.6a (394); ComplexKahlerGeometry K4; DifferentialGeometry 10.2; GeneralizedCohomology G4.0a, G4.0b; SchubertGeometry S9.6; LieGroupoidsPoisson G1.3a; ReflectionInvariantTheory; PseudoholomorphicCurveAnalysis at this head (its nine citations now read C3.0 or C2.3; C3.2 no longer cited).
- Dependency check: `depcheck: 200 roadmaps, 2194 edges, 0 problem(s)`; no UPWARD or CYCLE line. Changes outside the two named folders: none.
- Lean: `Suggested.lean` elaborates with two `declaration uses sorry` warnings (lines 56, 72) and nothing else. Elaborated types compared with C7.1 and C3.3: they agree, no binder lost. One-tactic probe (`rfl`, `simp`, `simp` with the definitions unfolded, `ring`, `decide`, `infer_instance`) on a scratch copy: both theorems stay open. No padding.
- Headlines: C2.1 Thom isomorphism, C2.2 Euler criterion, C2.3 `e(TM)[M]=χ(M)`, C3.4 universal rings, C5.2 Borel, C4.2 comparison, C7.1 L₃, C3.3 correction. Stated: the last two. Named as not statable: the others; for C2.1–C2.3 the stated reason is false (R02).
- Previous review (of another pull request's head of this folder): its two locator findings are not repaired at this head (lines 1488, 610, 1505 unchanged); under the present rules they are the small correction C06.
- Overlap check: read TopologicalKTheory, AlgebraicTopology, GeneralizedCohomology, Orbifolds (scope sections), SmoothBundlesConnections and ComplexKahlerGeometry; determinant of a bundle: TopologicalKTheory T1.2 owns it on its finite-rank atlas over paracompact bases, C3.0 owns the native-carrier line over any base and proves the comparison; integral c₁ of a holomorphic line by the exponential sequence: ComplexKahlerGeometry K4.P, a different construction; the topological c₁: this roadmap alone. Ownership against the head of #1807 was not checked: its files were not available.
- Source independence: 6 passages compared with 4 sources, none shared; largest share `milnor-stasheff`, 3 of 9 in-text locators, text not readable (uncertified); contents compared with its published table of contents (§§1–20, Appendix C): independent, since C1, C5, C5a and C6 have no counterpart run and C3 builds classes by projective splitting, not in that book's order.
- Research link: C3.0 supplies c₁ for the Maslov index and Riemann–Roch of PseudoholomorphicCurveAnalysis PH7.1–PH7.2 (pull request description and that README); C5–C5a are Cartan's and Borel's theorems as in Dupont 1978, Theorem 8.1 and Corollary 8.35 (`dupont-ccc`).

## Not verifiable

- Milnor–Stasheff §10, §14, §19 (lines 820, 1224, 1930), Milnor, *Topology from the Differentiable Viewpoint*, §6 (line 923), Milnor, *Universal Bundles, II*, §§2–3 (line 328), Bott–Tu: uncertified, cited by locator, not read.
- tom Dieck 14.4.3 (line 330): not opened this round.
- Whether the four names of R01 exist on a Tau Ceti commit later than the pin: the local copy of the library's later history (8 November) has `FiniteRankBundleCore.det` and not the other three; nothing later was read.
- C1.0, C2.0 and C5a.1–C5a.7 carry no locator, so there was none to check; their mathematics was recomputed instead.

Automatic checks set aside as false positives: one of the five mentions of HomotopySpheres (line 271) describes TopologicalKTheory's own comparison and is not a supplier citation of this roadmap; the other four are C02.

## Source issues

- none

## For the human reviewers

- **Licence.** `zentner-instanton-sheet2` is an unpublished course exercise sheet on an author's page, cited once (README line 2026) for `p₁(su(F))=c₁²−4c₂`; the roadmap proves the formula itself.
- **Licence.** `hatcher-vbkt` is an unpublished book draft on the author's page, cited with page numbers of that version (README line 494).
- **Not tested.** `milnor-stasheff` has the largest share of the locators and its text could not be read; wording was not compared against it, and the arrangement only against its published contents page.
