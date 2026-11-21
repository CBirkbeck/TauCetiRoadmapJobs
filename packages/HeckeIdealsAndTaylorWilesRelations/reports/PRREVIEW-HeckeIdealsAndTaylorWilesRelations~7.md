# Review of HeckeIdealsAndTaylorWilesRelations (pull request #2893 at 210cbc9)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HeckeIdealsAndTaylorWilesRelations/`
**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 89 lines changed since `2d3c8b8` finds the one earlier finding repaired. 9.9 (a) is now stated for a polarized pair `(Π, χ)`, which is Newton–Thorne's Theorem 5.2 and covers the representation `W` for which the family uses 9.9 (c); the new Check that separates the two hypotheses is correct. The three earlier small corrections and three format notes are repaired too, and the nine formal-proof locators added were opened and agree with the README. There are no findings, no small corrections and no format notes; one question to the author is carried over. The human reviewers still decide on the targets whose only source is the unpublished formal proof, and on its licence.

## Questions for the author

- 3.13a still says that (1), (a)–(e) and (g) are statements of the formal proof "in the form given here", that is without `μ_l ⊄ L` (line 124). The bundles that assert the existence of `J` with these properties (`UpperTheory.V.W.HidaUAlt`, and `ModUAlt` in `PointTheoremBaseObject.lean`) assume that `L` has no primitive `l`-th root of unity. The newly cited `UpperTheory.V.Hi.hecke_ideal_point_properties` has no such hypothesis for (f), which is evidence for the README's reading for that clause; is the same true of (b)–(e) and (g) through the declarations cited at lines 124–154? I did not trace each of them.

## Previous findings

- R01 — repaired: "attached to a regular algebraic cuspidal polarized pair `(Π, χ)` of `GL_n(𝔸_F)` (AutomorphicGaloisRepresentationsPartII §AG2.0 …)" (lines 408–411); Summary, docstring of `Suggested.lean`, route and supplier contract follow.
- C01 — repaired: "once `E` is replaced by a finite extension over which the characteristic polynomial of every element of the image splits" (lines 476–480), and likewise in (b) (lines 485–486).
- C02 — repaired: `PointTheoremBaseObject`, `AdjointLiftingTheorem`, `eigenbasis_rank_four`, `regOfTan` and `PTShaAt` are named with their files (lines 111–114, 437–438, 457–463, 617–620); the reference names commit `e50d098…`.
- C03 — repaired: the description now lists 3.13a (1), (a)–(e), (g), and its third headline has the polarized wording.
- N01 — repaired: the docstring names `PolynomialLaw.IsMultiplicative` and `PolynomialLaw.IsHomogeneousOfDegree` of Tau Ceti.
- N02 — repaired: "the compact duality target of IntegralIwasawaTheory §2.0" (route of 10.1 (b)).
- N03 — repaired: "`H¹_f(ℚ, 𝔰𝔭₄(ρ))` is a direct summand of `H¹_f(ℚ, ad r) = 0`" (line 491).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 9.9 (a), hypothesis against the source | NT23 Theorem 5.2 (line 1906, p. 40); definition of polarized (lines 246–249); AG2.0 (iii) | Source: polarized `(π, χ)`, CM `F`, enormous image; NT fix `χ_v(−1) = (−1)^n`, AG2.0 only constancy; `χ ↦ χδ_{F/F⁺}` leaves `χ ∘ N` and `ad r` unchanged | holds |
| 9.9 (a), (c) on the consumer's `W` | `n = 2`, `det W = η_K`, weights `{−e, e}`, `e ≠ 0` | `ρ^c ≅ ρ ≅ ρ^∨`; polarization needs `r_χ|_{G_F} = ε`, `χ = ‖·‖^{±1}`-type, `χ_v(−1) = 1`; weights distinct iff `e ≠ 0` | (c) now applies |
| 9.9, new Check (polarized, not conjugate self-dual) | `n = 2`, `det ρ = 1` | Conjugate self-dual gives `ρ^c ≅ ρ^∨ ⊗ ε^{1−n} = ρ^∨ ⊗ ε^{−1}` (NT23 line 33); then `ρ ≅ ρ ⊗ ε^{−1}`, determinants `1 = ε^{−2}` on `G_F`: false | Check true |
| 9.9 route (a), (b): enlargement of `E` | `n = 2, 3, 4`; compact `SO₃` over `ℚ₃` | Splitting fields of degree `≤ n!`: finitely many over a `p`-adic field, compositum finite; §7.10 criterion assumes splitting; NT23 Example 2.29 enlarges `E` (line 1077) | holds |
| 9.9 route: twist into unitary type | NT23 proof of 5.2 (lines 1910–1912); AG2.2 | Twist `ρ ⊗ r(ψ)`: `ad` on `G_F` unchanged; `c` acts by `X ↦ −AX^tA⁻¹`, `A` unique up to scalar | holds |
| 9.9 route (b), last step | `𝔤𝔩₄ = 𝔰𝔭₄ ⊕ ∧²₀ ⊕ 1` | `𝔰𝔭₄(ρ)` a `G_ℚ`-summand of `ad r`, so `H¹_f(ℚ, 𝔰𝔭₄(ρ)) ⊂ H¹_f(ℚ, ad r) = 0`; no use of `H¹_f(ℚ, ℚ_p)` | holds |
| 9.9 (d), formal locator | `AdjointLiftingTheorem` | `μ_l ⊄ L`, `Large`, `2 ≤ n ≤ 4`, `V0ok`, `AutomorphicPointLocallyGeneric`, `Par`; conclusion `AdZero` | matches |
| 9.9 (d′), rank-four form | `eigenbasis_rank_four`; quantifier on `(χ̄_i/χ̄_j)^m` | Formal: `∃ i j, ∀ m, 0 < m ≤ 4 → … ≠ 1`; README: "for some `i, j` … for every `m ∈ {1, 2, 3, 4}`"; gap `m_j + 2 ≤ m_i`; takes `AdjointLiftingTheorem` as hypothesis | matches |
| 9.9 (d′), seeds and last step | `local_zero_of_modular_p`, `regOfTan` | Both declared in the files cited; the first concludes `LocZero` at seeds under `ModularAlt` and `AdjointLiftingTheorem` | matches |
| 3.13a (f), formal form | `PointTheoremBaseObject`, `hecke_ideal_point_properties` | `2 ≤ n ≤ 4`, `IsAutCsdA`, trivial on inertia at `v₀`, flag with no ratio `ε`; conclusion `J ≤ ker x`; theorem: `IsJ → PointTheoremBaseObject`, no `μ_l` hypothesis | matches |
| 4.2a, `μ_l ⊄ L` | `HasAut`, `HidaUAlt` | `HasAut B J` quantifies over Taylor–Wiles groups and places only; the root-of-unity hypothesis is in the bundle | matches |
| 10.1, instance | `PTShaAt`, `ptShaAt`; `p = 2` with a real place | `S` = places above `l`; `zlTw (e+1)`, `qzTw e = χ^{−e}` on `ℚ_l/ℤ_l`; equality of lengths under `l ≠ 2` or no real place | matches |
| Headlines in `Suggested.lean` | the four headlines | none statable; docstring updated for 9.9 (polarized) and names `PolynomialLaw.IsHomogeneousOfDegree` (`TauCeti/RingTheory/PolynomialLaw/Homogeneous.lean:73`) | holds |

The rows for the untouched statements stand as in the previous review, of `2d3c8b8`.

- Source locators checked against the text: NT23 Introduction (lines 26–34), definition of polarized (246–253), Example 2.29 (1074–1078), Theorem 5.2 and the first lines of its proof (1902–1912, p. 40).
- Formal proof at commit `e50d098`: the nine locators added resolve (file present, declaration declared in it); statements read: `PointTheoremBaseObject`, `hecke_ideal_point_properties`, `HasAut`, `AdjointLiftingTheorem`, `eigenbasis_rank_four`, `local_zero_of_modular_p`, `PTShaAt` with `LData`, `qzTw`, `zlTw`, and the hypotheses of `ptShaAt`.
- Library declarations opened at the pins: `PolynomialLaw.IsHomogeneousOfDegree` (`TauCeti/RingTheory/PolynomialLaw/Homogeneous.lean:73`), `PolynomialLaw.IsMultiplicative` (`TauCeti/RingTheory/PolynomialLaw/Multiplicative.lean`).
- Cross-roadmap citations resolved for the changed passages: AutomorphicGaloisRepresentationsPartII §AG2.0 (polarized pairs, `χ = 1` for conjugate self-dual) and §AG2.2 (twist of a CM polarized pair) on main; ArithmeticGaloisRepresentations §7.10 (splitting hypothesis) on main; ModularityAndLanglandsExtensions §4.1 (unitary type, enormous image) at its open head; UniformWildKernelBounds §§4.1, 4.3 (`det W = η_K`, `W ⊗ χ_ℓ^{−e}` of weight `2e + 1`) at its open head. The Check numbers in the Examples of Layer 9 now match the list.
- Dependency check: `depcheck: 170 roadmaps, 1996 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder and the family index.
- Automatic checks: all passed at this head. `lake env lean` on `Suggested.lean`: exit 0, no output; the file declares nothing (single `import Mathlib`, no `set_option`, no `sorry`), so the `#check @name` comparison and the one-tactic probe had nothing to act on.
- Pull request text: title and description read against the head; nothing contradicted, nothing left unstated.
- Overlap check: read UniformWildKernelBounds, BaseChangeAndGaloisRepresentationsForUnitaryGroups, ModularityAndLanglandsExtensionsPartII, BernoulliBoundsForClassGroupEigenspaces, PotentialAutomorphyInfrastructurePartII, GlobalGaloisDeformations, AutomorphicGaloisRepresentationsPartII (ClassicalSerreModularity by object only, as before); the change adds no object: polarized pairs are AutomorphicGaloisRepresentationsPartII §AG2.0's, cited; ownership otherwise as in the previous review.
- Source independence: changed passages only; 6 passages compared with 2 sources (NT23, FormalProof), none shared beyond formulas; largest share FormalProof, 33 of 40 in-text source citations at this head; arrangement not compared again, since the diff adds, removes or reorders no layer.
- Research link: 9.9 (a)–(c) apply Newton and Thorne's vanishing of adjoint Bloch–Kato Selmer groups (NT23, 2023); 3.13a uses Chenevier's determinants (Che14, 2014) for Hida families at Eisenstein ideals; 3.13a, 4.2a and 9.9 (d) are statements of Alpöge's formal proof (announced 2026). Rests on the README, NT23, Che14 and the Announcement.

## Not verifiable

- That each formal statement compared is proved without residual hypotheses: statements only were read. `hecke_ideal_point_properties` takes a hypothesis bundle as its first argument, and `ptShaAt` takes finite-level duality statements as hypotheses, which the README's "derived from" reflects.

## Source issues

- none

## For the human reviewers

- Scope: the level modules and comparison maps of 4.2a and all of 9.9 (d) rest only on an unpublished, unrefereed Lean formalization; the announcement says a written account is still to come (Announcement lines 45–49). README lines 329–334, 425–443, 514–515.
- Licence: the licence of the formal-proof repository was not read; the README cites its file paths and declaration names at a named commit only, and no statement of `Suggested.lean` is taken from it.
- Not tested: nothing; the formal proof, which has the largest share of the citations (33 of 40), was read at the declarations the change cites.
