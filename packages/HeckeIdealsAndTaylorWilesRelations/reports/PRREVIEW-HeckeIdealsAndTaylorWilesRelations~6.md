# Review of HeckeIdealsAndTaylorWilesRelations (pull request #2893 at 2d3c8b8)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HeckeIdealsAndTaylorWilesRelations/`
**Verdict:** needs changes

**Summary.** Changes are needed for one finding (P2): 9.9 (a) and (c) are stated for conjugate self-dual `Π` only, which is narrower than Newton–Thorne's theorem and than the route written under them, and the representation `W` for which the family uses 9.9 (c) does not satisfy that hypothesis. The statements attributed to the formal proof were read in its source this time and agree with the README (4.2a, 9.9 (d), the rank-four form of 9.9 (d′), 3.13a (f)). There are three small corrections and three format notes, none blocking, and one question. The human reviewers still have to decide on targets whose only source is an unpublished formal proof, and on its licence.

## R01 (P2) — 9.9 (a) and (c) require `Π` conjugate self-dual, but the source and the route cover polarized `Π`, and the family's use of (c) needs that generality

As stated, (c) cannot be applied where the family applies it. In (a) `ρ = r|_{G_F}` is "attached to a regular algebraic conjugate self-dual cuspidal representation `Π`" (line 403), and (c) asks that `W|_{G_F}` "satisfies the hypotheses of (a) for `n = 2`" (lines 412–413). PotentialAutomorphyInfrastructurePartII, whose conventions the README imports, fixes the meaning: "RACSDC means `π^c ≅ π^∨`", as opposed to essentially conjugate self-dual. Then `ρ^c ≅ ρ^∨ ⊗ ε^{1−n}`, so for a `W` defined over `ℚ` and `n = 2` the Hodge–Tate weights of `W` are symmetric about `1/2` (the multiset is stable under `h ↦ 1 − h`). The consumer listed in Downstream consumers, UniformWildKernelBounds §4.3, applies 9.9 (c) to a `W` with `W^∨ ≅ W ⊗ η_K` and `W ≅ V_λ(f)(e)`: its weights are symmetric about `0` (for instance `{−e, e}`), and a twist `W ⊗ ε^k` is symmetric about `1/2` only for `k = ±1/2`. So that `W|_{G_K}` is attached to a polarized `(Π, χ)`, not to a conjugate self-dual `Π`, and (c) says nothing about it.

The source has the wider form: Newton–Thorne's Theorem 5.2 is for a "regular algebraic, cuspidal, polarized" `(π, χ)` over a CM field (NT23 line 1906), and its proof begins by twisting into unitary type, which does not change `ad r`. The README's own route does the same ("applies after the twist into unitary type (AutomorphicGaloisRepresentationsPartII §AG2.2)", lines 461–462), a step that is empty for a `Π` that is already conjugate self-dual; and (b) is already stated with `ρ|_{G_F}` only "conjugate self-dual up to twist". The smallest change: in (a) replace the hypothesis by "attached to a regular algebraic cuspidal polarized `(Π, χ)` of `GL_n(𝔸_F)` (conjugate self-dual up to twist by an algebraic character)", with `r` the `𝒢_n`-valued extension for that polarization; (c) then covers the consumer's `W`. Repeat the wording in the third headline of the Summary (line 7) and in the docstring of `Suggested.lean`.

## C01 — The route of 9.9 (a) and (b) calls the image enormous without the hypothesis its supplier needs

"in both cases the image of `G_{F(μ_{p^∞})}` is enormous (ArithmeticGaloisRepresentations §7.10)" (lines 459–460; likewise "Both are enormous" in (b), line 465). That section, and Newton–Thorne's Lemma 2.28 (NT23 line 1059), prove the Zariski-closure criterion only when every element of the image has characteristic polynomial split over `E`; §7.10 has a Check showing it fails otherwise (a compact form of `SO₃` over `ℚ₃`, which is exactly the shape of a symmetric-square image). `E` is fixed in the Conventions, so the step needs "after replacing `E` by a finite extension over which the characteristic polynomials of the image split (there are finitely many extensions of degree at most `n!`); this does not change the vanishing of `H¹_f`". Newton–Thorne say the same in their Example 2.29.

## C02 — Four statements of the formal proof are described without the declaration that states them, and one is located in a file whose neighbouring statement differs

The README now gives a file and declaration for most attributions, and I could match them. Four are still given in words only, so a reader cannot find them:

- 3.13a (f), formal form (lines 100–109): only the definitions behind (w2) are located. The statement is `UpperTheory.V.W.UniversalOrdinaryDeterminantRing.PointTheoremBaseObject`, in `Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/PointTheoremBaseObject.lean`.
- 9.9 (d) (lines 429–434): the README cites the conclusion `UpperTheory.V.Th.AdZero` and the exponent hypothesis `UpperTheory.V.Th.Par` in `…/TheoremsMuLinked/OrdZero.lean`. The statement in that file, `UpperTheory.V.Th.AdL`, uses automorphy without (w1) and (w2). The statement with (w1) and (w2), which is what (d) records, is `UpperTheory.V.Th.AdjointLiftingTheorem` in `…/DenseThresholdCases/AutomorphicPointGalois.lean`. Name that one.
- 9.9 (d′), rank-four form and "the last step" (lines 441–450): `UpperTheory.V.Th.eigenbasis_rank_four` in `…/DenseThresholdCases/EigenbasisRankFour.lean` and `UpperTheory.V.Ws.Eb.regOfTan` in `…/WeakShimuraTheory/EigenbasisLifts/RegOfTan.lean`.
- The instance of 10.1 (lines 587–590): no file or declaration; I did not find it (see Not verifiable).

The reference [FormalProof] (line 771) also names no commit; the paths above are those of commit `e50d098`.

## C03 — The description lists fewer formal-proof statements than the README

The description says "In this roadmap the formal proof states 4.2a, 9.9 (d), 3.13a (f) for `2 ≤ n ≤ 4` under two further conditions (w1) and (w2), 9.9 (d′) in rank four, and one instance of 10.1". The head also attributes 3.13a (1), (a)–(e) and (g) to it (lines 120–150 and the paragraph after the scope list). Add them, and after R01 change "regular algebraic conjugate self-dual cuspidal" in the description's third headline to the wording chosen there.

## N01 — The docstring of `Suggested.lean` says only Mathlib has polynomial laws

Tau Ceti at the pin has multiplicative polynomial laws (`PolynomialLaw.IsMultiplicative`, `TauCeti/RingTheory/PolynomialLaw/Multiplicative.lean`, line 71), the notion a determinant of a group algebra is built from. The headline stays not statable for lack of `G_{L,S}` and the Hecke algebra, but the sentence "no determinants of group algebras" would be more exact if it named this.

## N02 — `arithmeticCompactDuality` in code font is another roadmap's proposed name

In the route of 10.1 (b) (line 596) the name is IntegralIwasawaTheory §2.0's own and exists in neither pinned library; write it in prose ("the compact duality target of IntegralIwasawaTheory §2.0").

## N03 — A clause in the route of 9.9 (b) is not used

"with `H¹_f(ℚ, ℚ_p) = 0` this gives (b)" (line 469): `𝔰𝔭₄(ρ)` is a direct summand of `ad r`, so `H¹_f(ℚ, 𝔰𝔭₄(ρ)) ⊂ H¹_f(ℚ, ad r) = 0` already.

## Questions for the author

- 3.13a says that (1), (a)–(e) and (g) are statements of the formal proof "in the form given here", that is without `μ_l ⊄ L`. The two bundles I found that assert the existence of `J` with these properties (`UpperTheory.V.W.HidaUAlt`, and `ModUAlt` in `PointTheoremBaseObject.lean`) both assume that `L` has no primitive `l`-th root of unity, as the README itself notes at 4.2a. Is there a formal statement of (b)–(e), (g) without that hypothesis, or should 3.13a say that the formal proof has them under it and that the form without it is the roadmap's own? I did not trace the individual declarations cited at lines 120–150 far enough to decide.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 3.13a, direction of `Frob_w` and `Art` | `n = 2`, constants, weight 0 | Hecke polynomial `(X − 1)(X − Nw)`; `(1 ⊕ ε̄⁻¹)(Frob_w)` geometric: `1, Nw`; unit `U¹`-eigenvalue `1 = ψ₁(Art ϖ)`; `U² = (ψ₁ψ₂ε)(Art ϖ) = 1` | holds |
| 3.13a (a), weights | weight `0`; weight `a` | `ψ_i = ε^{1−i}`, weight `i − 1`; general `i − 1 + a_{τ,n+1−i}`, equal to supplier's `{λ_j + n − j}` with `j = n + 1 − i` | holds |
| 3.13a (1), `Λ` | sum over `v | l` | `n·Σ[L⁺_v : ℚ_l] = n[L⁺ : ℚ]` variables once the `l`-torsion is prescribed | holds |
| 3.13a (b), kernel of `D` | GMA of type `(1,…,1)`, `w = xz`; path `a→b→a→c` | `e_a w e_a = tr(w e_a)e_a = 0`; closed subword `e_a w e_b w e_a = 0`; open words have `D(1 − tv) = 1` | holds |
| 3.13a (d), bound | all `m_i = 1` | eigenvalues `q^{(n−1)/2}α`, `q^{−1/2} < |α| < q^{1/2}`; ratio `< q` | holds |
| 3.13a (f), route | graded character `ψ_jψ_i⁻¹ε`, `i < j`; weight `0`; all weights `0` | weights `(j − i − 1) + (a_{n+1−j} − a_{n+1−i}) ≥ 0`; `φ = 1` vector only if `ψ_i/ψ_j = ε`; at `S_t` inertia image of order prime to `l`, `N = 0` | holds |
| 3.13a (f), formal form | `PointTheoremBaseObject` | `2 ≤ n ≤ 4`, automorphy with (w1), (w2) (`IsAutCsdA`), trivial on inertia at `v₀`, flag with no ratio `ε`; conclusion `J ≤ ker x` | matches; C02 |
| 3.13a (g) | `D ⊗ γ`; `β` of odd order; the `ℤ_l` example | relation scales by `γ(h)∏γ(g_i)`; `μ = β^{(1+ord β)/2}` gives `μ/μ^c = β`; torsion maps to `0` in `ℤ_l` | holds |
| 4.2a against the formal structures | `q = 0`; `n = 1`; coinciding residues | `f = 1`, `Sp_N = B` in both; `f̄ = ∏(ū_i − ū_i′)²`; formal `fEl`, `q1El`, `q2El`, `TWRing`, `TWMaps`, `TWAut` agree term by term | holds |
| 4.2a, exponent | irreducible `π` with `π^{Iw₁} ≠ 0` | `dim π^{Iw₁} ≤ dim π_N ≤ n!`; formal local statement has `F ^ n.factorial`; global structure has one exponent for all `N` | holds |
| 9.9 (a), source | NT23 Theorem A, Theorem 5.2, Lemma 2.28 | Theorem A p. 2 for unitary type; 5.2 for polarized `(π, χ)`; 2.28 assumes split characteristic polynomials | R01, C01 |
| 9.9 (a), (c), hypothesis | `n = 2`, `W` over `ℚ`, `W^∨ ≅ W ⊗ η_K` | RACSDC: weights stable under `h ↦ 1 − h`; consumer's `W`: stable under `h ↦ −h`; twist needs `k = 1/2` | R01 |
| 9.9 (b) | `Sp₄`, `Sym³SL₂`, `SL₂ ⊗ SL₂`; `e = E₁₁` | traces of `e` against `I`, `diag(1,0,0,−1)`, `diag(1,−1,−1,1)` are `1, 1, 1`; `2 ⊗ 2` symmetric; `sim(c) = −1` | holds given C01 |
| 9.9 (d) against the formal statement | `AdjointLiftingTheorem`, `HidaSetting`, `V0ok`, `Par`, `Free`, `N3` | `l` odd, `μ_l ⊄ L`, `2 ≤ n ≤ 4`, (w1), (w2), `StrictAnti m` on ratios, element in `ker ε` with free ratios, irreducible on `G′`, separable elements | matches; C02 |
| 9.9 (d), Check on (i) | pure point, `g = Frob^k σ ∈ ker ε` | `|α_i/α_j| = q^{±k(m_i − m_j)} ≠ 1`; needs parallel weights, which (d) assumes | holds |
| 9.9 (d′) | gap `1` and `≥ 2`; dimension count; `eigenbasis_rank_four`, `regOfTan` | `H¹_f = H¹` unless ratio is `ε`; embedding dimension `≤ dim Λ − 1 ≤ dim (B/J₀)_𝔭`; formal hypotheses on `η` and `(χ̄_i/χ̄_j)^m`, `m ≤ 4`, agree | holds |
| 10.1 (a), (b) | `T = ℤ_p(1)`, `F = ℚ`, `S = {p, ∞}`, also `p = 2` | `lim¹` of finite groups `0`; `(T/pⁿ)^D = T^D[pⁿ]`; `Ш¹_S(ℚ_p/ℤ_p) = 0 = Ш²_S(ℤ_p(1))` | holds |
| 10.1 (e) and second Check | `e ≠ 0`; `e = 0`, `p = 3`, `v = 7` | `Nv^{−e} − 1 ≠ 0` surjective on divisible; `ℚ₃/ℤ₃` against `0` since `7 ≢ 1 mod 9` | holds |
| 10.1, first and fourth Checks | `p = 2`; `S = {3, 61, ∞}`; `T = ℤ_p` | `H¹(ℝ, ℚ₂/ℤ₂(−e)) = ℤ/2, 0`; `3⁵ ≡ −1`, `3²⁰ ≡ 1 mod 61`; `rank H²(G_S, ℤ_p) = δ` | holds |
| 10.1, lengths | `O/ϖ` | `length_{ℤ_p} = f_O`, normalized `1/e_O`, ratio `e_O f_O = [E : ℚ_p]` | holds |
| Headlines in `Suggested.lean` | the four headlines | none statable: `G_{L,S}`, Hecke algebras, `𝒢_n`, `H¹_f`, Poitou–Tate pairing absent at the pins; each named in the docstring | holds; N01 |

- Source locators checked against the text: NT23 Theorem A (lines 57–60, p. 2), Definition 2.23 (937–939), Lemma 2.25 (948), Lemma 2.28 and Example 2.29 (1059–1082), Theorem 5.2 (1906–1909); Che14 Example 3.6 and Proposition 3.7 (1778–1786, p. 43); BZ77 §2.12 (329–334); Announcement (lines 45–53).
- Formal proof: all 42 file-and-declaration locators of the README resolve (file present, declaration declared in it); 14 statements read in full and compared (`AdZero`, `Par`, `AdL`, `AdjointLiftingTheorem`, `IsBK`, `WitOff`, `WitA`, `SuppAt`, `TorAt`, `PointTheoremBaseObject`, `HidaUAlt`, `HasAut` with `TWBase`/`TWRing`/`TWMaps`/`TWAut`/`TWGrp`, `eigenbasis_rank_four`, `regOfTan`).
- Library declarations opened at the pins: `Field.absoluteGaloisGroup` and `.map` (`Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42, 87`), `ContinuousCohomology.tateShafarevich` (`Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean:72`), `Matrix.unitaryGroup` (`Mathlib/LinearAlgebra/UnitaryGroup.lean:105`), `PolynomialLaw` (`Mathlib/RingTheory/PolynomialLaw/Basic.lean:80`), `TauCeti.unramifiedOutsideKummerCohomology` (`TauCeti/NumberTheory/DedekindDomain/Kummer/SelmerGroup.lean:71`), `PolynomialLaw.IsMultiplicative` (`TauCeti/RingTheory/PolynomialLaw/Multiplicative.lean:71`).
- Cross-roadmap citations resolved by heading: 82 section ids in 20 roadmaps, on main or at the open heads of PotentialAutomorphyInfrastructurePartII, ModularityAndLanglandsExtensions, BaseChangeAndGaloisRepresentationsForUnitaryGroups, Chebotarev and the three consumers; all exist. Read at the cited statements: PotentialAutomorphyInfrastructurePartII §§0.5, 3.5–3.7, 3.12–3.14, 9.3, 9.8; ModularityAndLanglandsExtensions §§2.43, 4.1; AutomorphicGaloisRepresentationsPartII AG2.3, AG2.6; ArithmeticGaloisRepresentations §7.10; BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1.
- Dependency check: `depcheck: 171 roadmaps, 2001 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder and the family index.
- Automatic checks: all passed at this head. `lake env lean` on `Suggested.lean`: exit 0, no output. It declares nothing, so the `#check @name` comparison and the one-tactic probe had nothing to act on; nothing is padding.
- Overlap check: read UniformWildKernelBounds, BaseChangeAndGaloisRepresentationsForUnitaryGroups, ModularityAndLanglandsExtensionsPartII, BernoulliBoundsForClassGroupEigenspaces, PotentialAutomorphyInfrastructurePartII, GlobalGaloisDeformations, AutomorphicGaloisRepresentationsPartII (ClassicalSerreModularity searched by object only); big ordinary Hecke algebras and Taylor–Wiles data at non-Eisenstein ideals: PotentialAutomorphyInfrastructurePartII; Newton–Thorne vanishing: ModularityAndLanglandsExtensions §4.1; Sha kernels for finite modules: ArithmeticGaloisDuality; the ordinary determinant ring, its Hecke ideal and patching data, 9.9 and the lattice kernels: this roadmap, cited and not restated by the three consumers.
- Source independence: 19 passages compared with 5 sources (FormalProof, NT23, Che14, BZ77, Announcement), none shared beyond formulas; largest share FormalProof, 30 of 39 in-text source citations; contents compared with FormalProof's directory tree: independent (the locators of the four targets lie in more than ten directories, and the layers carry PotentialAutomorphyInfrastructurePartII's numbering).
- Research link: 9.9 (a)–(c) apply Newton and Thorne's vanishing of adjoint Bloch–Kato Selmer groups (NT23, 2023); 3.13a uses Chenevier's determinants (Che14, 2014) for Hida families at Eisenstein ideals; 3.13a, 4.2a and 9.9 (d) are statements of Alpöge's formal proof (announced 2026). Rests on the README, NT23, Che14 and the Announcement.

## Not verifiable

- The instance of 10.1 attributed to the formal proof (lines 587–590): no file or declaration is given; I found finite-coefficient Poitou–Tate statements with the hypothesis "`l ≠ 2` or totally complex" under `Development/WeilBound/CoreStatements/PublishedTheorems/PoitouTateDuality/`, not the lattice instance.
- That each formal statement I compared is proved without residual hypotheses: only statements were read (for example `UpperTheory.V.Th.adL` takes a hypothesis bundle as an argument); proofs were not traced.

## Source issues

- none

## For the human reviewers

- Scope: the level modules and comparison maps of 4.2a and all of 9.9 (d) rest only on an unpublished, unrefereed Lean formalization; the announcement says a written account is still to come (Announcement lines 45–49). README lines 328–329, 418, 492–493, 666.
- Licence: the licence of the formal-proof repository was not read; the README cites its file paths and declaration names only, and no statement of `Suggested.lean` is taken from it.
- Not tested: nothing; the formal proof, which has the largest share of the citations (30 of 39), was read at the cited declarations and its directory tree compared with the layers.
