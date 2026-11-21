# Review of HeckeIdealsAndTaylorWilesRelations (pull request #2893 at a03d85a)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HeckeIdealsAndTaylorWilesRelations/`
**Verdict:** needs changes

**Summary.** Changes are needed for four findings, all P2. The README never says which Frobenius `Frob_w` is. Under the convention it imports from PotentialAutomorphyInfrastructurePartII, the Hecke maximal ideal of 3.13a is the dual one, and 4.2a uses the opposite direction from 3.13a. The two results attributed to the formal proof (the level modules of 4.2a, and 9.9 (d)) have no locator into it. 3.13a (f) is narrowed to `2 ≤ n ≤ 4` with no step that needs it, and two Checks are false as written. There are six small corrections and four format notes. The human reviewers have to decide on an unpublished formal proof as the only source for two targets, and on its licence.

## R01 (P2) — The direction of Frobenius is never fixed, and under the convention the README imports, 3.13a picks the dual maximal ideal

A reader cannot tell which Hecke maximal ideal 3.13a localizes at. Under the reading the README itself prescribes, the theorem is generically empty and one of its Checks is false. 3.13a defines the maximal ideal, and `D_𝕋` in (a), through "the characteristic polynomial of `(⊕χ̄_i)(Frob_w⁻¹)`" (lines 52 and 58), but `Frob_w` is defined nowhere in the README. The Conventions (line 16) import the notation of PotentialAutomorphyInfrastructurePartII §§3.1–3.13, and there §3.7 says explicitly that `Frob_w` is geometric, with the Hecke polynomial equal to the characteristic polynomial of `r̄_𝔪(Frob_w)`. Read that way, the 𝔪 of 3.13a has `r̄_𝔪 ≅ ⊕χ̄_i⁻¹`. That representation is conjugate self-dual up to `ε̄^{n−1}`, whereas §3.13(1) there forces `ε̄^{1−n}`. For `n = 2` and `χ̄₁ ≠ χ̄₂`, both can hold only if `{χ̄₁ε̄², χ̄₂ε̄²} = {χ̄₁, χ̄₂}`, that is `ε̄⁴ = 1` on `G_L`. Otherwise `M = 0` and `J = B`. The second Check of 3.13a (the determinant of §3.13(2)'s `r_𝔪` is `D_𝕋`) also fails under this reading, since `D_𝕋` would be `det(r_𝔪^∨)`.

Under the other reading (`Frob_w` arithmetic), 3.13a is consistent. However, the relations in the route of 4.2a then match the normalized `U`-eigenvalues with "the characteristic polynomial of `ρ(Frob_w)`" (line 205). Because 3.13a (a) matches the Hecke polynomial with `Frob_w⁻¹`, the README uses both directions. The smallest repair is to state in the Conventions which Frobenius `Frob_w` is, with a two-term witness. For example: for `n = 1` the `T_w¹`-eigenvalue `t` of a character is its value at `Art(ϖ_w)`, a geometric Frobenius, so the Hecke polynomial `X − t` is the characteristic polynomial of the geometric Frobenius. Then write `φ_{N,j}` and the relations of 4.2a in the same direction as 3.13a (a), or say that the normalized eigenvalues `α_i` are inverses.

## R02 (P2) — 4.2a and 9.9 (d) rest only on [FormalProof], which is cited without any locator

Two targets are attributed to "a theorem of [FormalProof]" and their routes are partly "not given here" (lines 192, 255 and 456): the existence of the level modules `M_N` and of the comparison maps in 4.2a, and all of 9.9 (d). The reference (line 540) gives only a repository. The formal proof has about 175,000 Lean modules (from the module list of the copy the operator holds). Without a module and declaration name, nobody can check that it proves these statements with these hypotheses: the range `2 ≤ n ≤ 4`, conditions (i)–(iii) and the place `v₀` in 9.9 (d), and the factor `f` and the exponent `n!` in 4.2a. Its `PatchingModules` part has modules named after the two kinds of relation in 4.2a, so the statements are probably there to be named. The repair is to give, after each of the two claims, the module and declaration that state it, and to say where the formal statement differs from the README's (hypotheses, the coefficient prime, the form of the exponent).

## R03 (P2) — 3.13a (f) is stated only for `2 ≤ n ≤ 4`, but no step of its route depends on `n`

Statement (f) is what puts automorphic points into `V(J)`. Narrowing it to the range its consumers use ("These consumers use 3.13a (f) in the range `2 ≤ n ≤ 4`", line 442) is a restriction specific to one route, and the library inherits it. The route (lines 115–117) uses three things, none of which depends on `n`:

- descent through PotentialAutomorphyInfrastructurePartII §3.5(1), "for every `n`";
- the first Check of §3.12 there;
- matching of the tame type and the flag.

The one step the route leaves implicit is that a potentially crystalline ordinary `π_v` is `ι`-ordinary. That is PotentialAutomorphyInfrastructurePartII §0.5, which is stated for every `n`. A flag with no two characters in ratio `ε` is potentially crystalline: any other ratio `χ = ε^kη` with `k ≥ 1` has `H²(χ) = 0`, hence `H¹_f(χ) = H¹(χ)`. The repair is either to state (f) for every `n ≥ 1` and add §0.5 to its route and its *Needs:* line, or to name the step that needs `n ≤ 4`.

## R04 (P2) — Two Checks are false as written

In 10.1, the first Check (lines 405–406) says that for odd `p`, "`Ш¹_{S;S_p} = Ш¹_S` by (d)". That holds only when `S = S_p ∪ S_∞`. Take `F = ℚ`, `p = 3` and `S = {3, 61, ∞}`. Since `3⁵ ≡ −1 mod 61`, we get `3²⁰ ≡ 1 mod 61`, so 3 is a cube modulo 61. The cubic character of conductor 61 is therefore trivial on the decomposition group at 3 and lies in `Ш¹_{S;S_3}(ℚ, ℚ₃/ℤ₃)`. It is ramified at 61, so it is not in `Ш¹_S(ℚ, ℚ₃/ℤ₃)`, which is `0`. The repair is to add "when `S = S_p ∪ S_∞`".

In 9.9, the second Check (line 324) says the case `n = 1` is "not a consequence of ModularityAndLanglandsExtensions §4.1". A rank-one image is enormous: ArithmeticGaloisRepresentations §7.10 has the Check "Rank one is enormous", and the first Check of ModularityAndLanglandsExtensions §4.1 says the same. So §4.1 does give `H¹_f(F⁺, ad r) = 0` for `n = 1`. The repair is to drop that clause; `n = 1` can stay outside (a) as the class-group case.

## C01 — Three supplier pointers name sections that do not contain the cited fact

- The route of 3.13a (a) and the supplier contract cite "Chenevier's gluing of determinants over a reduced ring" to IntegralHeckeAndGaloisDeterminants Layer 0 (lines 109 and 489). The gluing is §4.1 there (*Compact coefficient-ring gluing*).
- The contract for IntegralHeckeAndGaloisDeterminants §1.3 (line 490) says it proves that an element `x` with `tr(xy) = 0` for all `y` lies in `ker D`. §1.3 there has the generalized-matrix-algebra decomposition (Chenevier, Theorem 2.22(ii)) but not this consequence. The consequence is two lines in a generalized matrix algebra of type `(1, …, 1)`: every cycle product of `xz` factors as `x_{ab}·y_{ba} = 0`. State it in the route of 3.13a (b) or cite it from Bellaïche–Chenevier.
- 10.1 cites inflation–restriction to ProfiniteCohomology Layers 6–7 (lines 399, 400 and 528). Inflation–restriction is §5.4 there; Layer 6 has the corestriction that (f) also uses.

## C02 — The guide's claim about layer numbers is wrong for Layer 10

"The layers below carry the numbers of the layers of PotentialAutomorphyInfrastructurePartII that they extend" (line 12). Layer 10 of that roadmap is integral `R = T` for rigid residual representations, and it has its own §10.1. Layer 10 here extends ArithmeticGaloisDuality. Add "except Layer 10, which extends ArithmeticGaloisDuality", or renumber that layer, at the author's choice.

## C03 — The list of users of these targets is incomplete

"The users of these targets in this family are UniformWildKernelBounds and BernoulliBoundsForClassGroupEigenspaces" (line 458). CongruenceModulesOfThetaLifts also lists 10.1 among its supplier contracts and uses it in its 7.7b. Add it, and add a line under Downstream consumers.

## C04 — The route inputs from the literature have no locators

[Che14] (line 92) and [BZ77] (line 212) are cited without a theorem number. The statements used are Che14, Proposition 3.7 together with Example 3.6 (p. 43 of arXiv v2): Mazur's condition (F) holds for `G_{K,S}` and for local Galois groups, and it makes the deformation ring of a residual determinant noetherian. The other is BZ77, Geometrical Lemma 2.12. Give them at the citations.

## C05 — The family index says the family follows a source

The family index is part of this pull request: "The family follows the formal Lean proof of these theorems by Levent Alpöge" (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 9–10; the description repeats it). A roadmap's organisation is its own and does not follow a source; the layers here follow PotentialAutomorphyInfrastructurePartII's numbering in any case. A sentence such as "Its targets include results first proved in the formal Lean proof of these theorems by Levent Alpöge" keeps the credit and says what is true.

## C06 — The description ends a sentence with "Its headline theorems:" and gives no list

In the second paragraph of the description, the list that follows those words in the README's summary was dropped. Add the four headline theorems, or end the sentence before them.

## N01 — Cite LocalGaloisDeformationRings §7.4 for the field equivalence in the third Check of 3.13a

Over a field with pairwise distinct characters, the characteristic-polynomial and ordered-product identities together are equivalent to an ordered flag; that is LocalGaloisDeformationRings §7.4.

## N02 — `S_N = S ∪ {w_{N,1}, …, w_{N,q}}` adds places of `L` to a set of places of `L⁺`

In 4.2a (line 177), write the places of `L⁺` below the `w_{N,j}`.

## N03 — The `Suggested.lean` docstring says neither library has "its cohomology in degree two"

Mathlib's `continuousCohomology` is defined in every degree; what is missing is `G_{L,S}` itself (lines 19–21).

## N04 — The second Check of 3.13a reads "(`n` replaced by an absolutely irreducible residual representation)"

It presumably means `⊕χ̄_i` replaced (line 135).

## Questions for the author

- In 4.2a, must the Frobenius elements `φ_{N,j}` satisfy `χ̄_i(φ_{N,j}) = χ̄_i(σ_j)` for every `N`, and not only in the limit? Otherwise, for small `N`, the roots `u_{j,i}` need not reduce to roots of `charpoly D(φ_{N,j})`, and then `Sp = 0`. The definition says only "converging".
- Does the formal statement of 9.9 (d) carry exactly the hypotheses written here, in particular (i), the conditions at `v₀` and `2 ≤ n ≤ 4`? I could not match it: no locator is given, and the copy available holds kernel terms, not readable statements.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 3.13a, maximal ideal via `Frob_w⁻¹` | `n = 2`, `χ̄₁ ≠ χ̄₂`; `Frob_w` geometric (PAIPII §3.7) vs arithmetic | geometric: `r̄_𝔪 ≅ ⊕χ̄_i⁻¹`, twist `ε̄^{+1}`, needs `ε̄⁴ = 1`; arithmetic: `r̄_𝔪 ≅ ⊕χ̄_i`, twist `ε̄^{−1}` | R01 |
| 3.13a, second Check (`D_𝕋 = det r_𝔪`) | non-Eisenstein 𝔪, both readings | geometric: `D_𝕋 = det(r_𝔪^∨)`; arithmetic: equal | R01 |
| 3.13a, third Check (relation versus flag) | `n = 2` flag; `n = 3`, `(φ, θ, φ)`; `det(χ₁ ⊕ χ₂)` | flag gives product 0; `(φ, θ, φ)`: product 0, only stable plane `φ ⊕ φ`, no flag; both orders give 0 | holds |
| 3.13a, first Check (`n = 1`) | `n = 1`, arithmetic reading | relation forces `ψ_{v,1} = D` on `G_{L_ṽ}`; `B` the anticyclotomic completed group ring; `𝕋 = B`, `J = 0` | holds |
| 3.13a (b), unramified at `v₀` | `Nv₀ ≢ 1 mod l`, residual characters equal | `l`-power tame characters need `ord(Nv₀ mod l) ∣ m`, giving distinct residual eigenvalues; Steinberg needs ratio `Nv₀ ≢ 1` | holds |
| 3.13a (d), eigenvalue bound | `m_i = 1`, pieces `π_i ⊗ |det|^{−(n−n_i)/2}` | eigenvalues `q^{(n−1)/2}α`, `q^{−1/2} < |α| < q^{1/2}`, so `|z/z′| < q` | holds |
| 3.13a (f) | `n = 1`, `n = 5` | PAIPII §3.5(1) and §0.5 hold for all `n`; no step of the route uses `n ≤ 4` | R03 |
| 3.13a (g), twists | `D ⊗ γ`, `γ^c = γ⁻¹` | `(D⊗γ)^c = (D⊗γ)^∨ε^{1−n}`; relation scaled by `γ(h)∏γ(g_i)`; `S_t` relation kept since `γ(g) = 1` | holds |
| 4.2a, `f` and `Sp` | `χ̄_i(σ_j)` distinct vs coinciding | `f̄ = ∏_{i≠i′}(ū_i − ū_{i′})² ≠ 0` (`Nw ≡ 1 mod l`); coinciding gives `f ∈ 𝔪`, `Sp` not étale | holds |
| 4.2a, exponent `n!` | irreducible `π` of `GL_n(L_w)` | principal series: `dim π^{I(1)} ≤ |W| = n!`; depth-zero cuspidal: 0; nilpotent `P` on dimension `d` has `P^d = 0` | holds |
| 4.2a, level modules and comparison maps | — | [FormalProof] gives no locator | R02 |
| 9.9 (a) | `n = 1, 2, 3` | derived groups `SL₂`, and `SL₃` or `Sym²SL₂` with `diag(a², 1, a⁻²)` regular, so enormous; `n = 1` enormous | holds; R04 |
| 9.9 (b) | `Sp₄`, `Sym³SL₂`, `SL₂ ⊗ SL₂` | `E₁₁` paired with `I`, `diag(1,0,0,−1)`, `diag(1,−1,−1,1)` gives 1, 1, 1; `SL₂ ⊗ SL₂` keeps a symmetric form | holds |
| 9.9 (c) | `n = 2` | `∧²₀ = 0`, so `ad r ≅ ad⁰W ⊕ η_F`; `H¹_f(ℚ, η_F) ⊂ Hom(Cl_F, E) = 0`; `H¹_f(ℚ, ℚ_p) = 0` | holds |
| 9.9 (d′) | gap 1 vs gap ≥ 2 | `H¹(ℚ_p(k))`, `H¹_f`: dimensions `1, 1` for `k ≥ 2` and `2, 1` for `k = 1`; embedding dimension `≤ n[L⁺:ℚ] ≤ dim (B/J₀)_𝔭` | holds |
| 9.9 (d) | — | not verifiable: [FormalProof] gives no locator | R02 |
| 10.1 (b) | `F = ℚ`, `S = {p, ∞}`, `T = ℤ_p(1)` | `Ш¹_S(ℚ, ℚ_p/ℤ_p) = 0` (Kronecker–Weber), so `Ш²_S(ℚ, ℤ_p(1)) = 0`; `Ш²(T) = lim Ш¹(T^D[pⁿ])^∨` | holds |
| 10.1, fourth Check | `T = ℤ_p(1)`, `ℤ_p` | `Ш¹_S(ℚ_p/ℤ_p) = Hom(Cl_S, ℚ_p/ℤ_p)`, finite; `rank H²(G_S, ℤ_p) = h¹ − 1 − r₂ = δ` | holds |
| 10.1 (e) | `W = ℚ_p/ℤ_p(−e)`, `e = 0, ≠ 0` | `Frob_v` acts by `Nv^{−e}`; `(Nv^{−e} − 1)W = W` for `e ≠ 0`; for `e = 0`, `W/(F−1)W = ℚ_p/ℤ_p` | holds |
| 10.1, first Check | `p = 2`, real place; `p = 3`, `S = {3, 61, ∞}` | `H¹(ℝ, ℚ₂/ℤ₂(−e))` is `ℤ/2` or `0`; `Ш¹_{S;S₃} ⊇ ℤ/3` but `Ш¹_S = 0` (`3²⁰ ≡ 1 mod 61`) | R04 |
| `Suggested.lean` | elaboration at the pins | exit 0, no messages, no declarations; the six library names in the docstring exist | holds |

- Source locators checked against the text: NT23 Theorem A, Definition 2.23, Lemma 2.28, Example 2.29 and Theorem 5.2 (NT23 lines 57–60, 937–939, 1059–1082, 1906–1909); Che14 Proposition 3.7 and Example 3.6 (Che14 lines 1775–1786); BZ77 Geometrical Lemma 2.12 (BZ77 lines 329–336); Announcement lines 9–13 and 45–53.
- Library declarations opened at the pins:
  - Mathlib `ContinuousCohomology.tateShafarevich` (`Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean:72`);
  - Mathlib `continuousCohomology` (`…/ContCohomology/Basic.lean:131`);
  - Mathlib `Field.absoluteGaloisGroup` and `.map` (`Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42, 87`);
  - Mathlib `PolynomialLaw` (`Mathlib/RingTheory/PolynomialLaw/Basic.lean:80`) and `Matrix.unitaryGroup` (`Mathlib/LinearAlgebra/UnitaryGroup.lean`);
  - Tau Ceti `TauCeti.unramifiedOutsideKummerCohomology` (`TauCeti/NumberTheory/DedekindDomain/Kummer/SelmerGroup.lean:71`).

  Neither library has `G_{K,S}` or determinants of group algebras.
- Cross-roadmap citations resolved: about 30 sections in 15 roadmaps, on main or at the open heads (PotentialAutomorphyInfrastructurePartII, ModularityAndLanglandsExtensions, BaseChangeAndGaloisRepresentationsForUnitaryGroups). Three point to the wrong section (C01).
- Dependency check: `depcheck: 170 roadmaps, 1992 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed at this head. Elaboration of `Suggested.lean` with `lake env lean`: exit 0, no output. It has no declarations, so the `#check @name` comparison had nothing to compare.
- Overlap check: read UniformWildKernelBounds, ModularityAndLanglandsExtensionsPartII, PotentialAutomorphyInfrastructurePartII, OrdinaryAutomorphicFormsAndModularityLiftingPartII, CongruenceModulesOfThetaLifts, ReducibilityIdealsAndUltrafilterPatching, GlobalGaloisDeformations, ClassicalSerreModularity and AutomorphicGaloisRepresentationsPartII. Shared objects and their owners:
  - big ordinary Hecke algebras and Taylor–Wiles data on definite unitary groups: owner PotentialAutomorphyInfrastructurePartII, whose non-Eisenstein ideals 3.13a and 4.2a complement;
  - Newton–Thorne vanishing: owner ModularityAndLanglandsExtensions §4.1, cited here;
  - Sha kernels with lattice coefficients: owner this roadmap (10.1), cited by three siblings;
  - patching up to an element: owner ReducibilityIdealsAndUltrafilterPatching §6.13; 4.2a supplies only its automorphic input.
- Source independence: 6 passages compared with 4 sources, none shared beyond forced terms. The largest share is FormalProof, 3 of 8 in-text source citations, none with a locator. Its contents were compared through its module tree only: independent, since the layers follow PotentialAutomorphyInfrastructurePartII's numbering.
- Research link: 9.9 (a)–(c) apply Newton–Thorne's vanishing of adjoint Bloch–Kato Selmer groups (NT23, Theorem A, 2023). 3.13a and 4.2a carry Hida theory and Taylor–Wiles patching on definite unitary groups to Eisenstein ideals through Chenevier's determinants (Che14). The family uses them toward Alpöge's announced proof (2026). This rests on the README and on NT23, Che14 and the announcement.

## Not verifiable

- 4.2a (level modules and comparison maps) and 9.9 (d) could not be checked against [FormalProof]. The README gives no module or declaration, the sources service does not read the repository's host, and the copy the operator holds has module names and kernel terms, not readable statements.

Automatic checks set aside as false positives: the signature listing and the library-match listing for `Suggested.lean` took the word "in", which ends a line of its module docstring, for a declaration name; the file declares nothing.

## Source issues

- none

## For the human reviewers

- Two targets rest only on an unpublished, unrefereed Lean formalization announced on 20 November 2026: the level modules and comparison maps of 4.2a, and 9.9 (d). The announcement (Announcement lines 45–49) says a written account is still to come. README lines 192, 255 and 456.
- Licence: the licence of the formal-proof repository was not read; the copy the operator holds has no licence text. The description says the roadmap was drafted by reading that proof.
- Not tested: [FormalProof], the source cited most, could not be read at the level of statements, so wording and arrangement were compared with its module names only.
