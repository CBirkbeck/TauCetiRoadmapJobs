# Review of LieGroups (pull request #2642 at 35f6f01)
Folder: `TauCetiRoadmap/RepresentationTheory/LieGroups/`

**Verdict:** needs changes

**Summary.** Changes are needed for two blocking findings: §7.6 presents Tau Ceti's complexification of the split algebra 𝔰𝔭(2l, ℝ) as the Lie-algebra half of the compact identification Sp(n)_ℂ ≅ Sp_{2n}(ℂ), and §7.9 claims ownership of the complex Lie group G(ℂ) ⊂ GL(V)(ℂ), which ReductiveGroups §3A.5e on main owns and says this layer consumes. There are six small corrections (an out-of-date sentence in the §4.1 Check, Kirillov chapter citations that do not contain the cited material, the relation to SchubertGeometry's line bundles, a redundant hypothesis, a universe restriction, two sentences of the description) and two format notes, none of them blocking. Of the previous review's points, the covering-comparison citation is repaired, the universe point partly (C04) and the SchubertGeometry point not (C03); nothing beyond two uncertified sources is left for the human reviewers.

## R01 (P2) — §7.6 attributes the Lie-algebra half of the compact Sp(n)_ℂ ≅ Sp_{2n}(ℂ) to a Tau Ceti declaration about the split real form

An implementer reading §7.6 (lines 1372–1376) will take the differential of the compact symplectic identification as done in the library, but the library states something else. The text says the identifications U(n)_ℂ ≅ GL_n(ℂ), …, Sp(n)_ℂ ≅ Sp_{2n}(ℂ) have "Lie-algebra halves [that] are Tau Ceti's … and `TauCeti.Lie.symplecticBaseChangeLieEquiv`".

At the pin, `TauCeti.Lie.symplecticBaseChangeLieEquiv` (`Geometry/Lie/Subgroup/Complexification.lean` line 349) is `S ⊗[ℝ] Lie(GLSymplectic l ℝ) ≃ₗ⁅S⁆ 𝔰𝔭(2l, S)`. Here `GLSymplectic l ℝ` is the real symplectic group Sp_{2l}(ℝ), and the module docstring (line 23) calls it "the noncompact real symplectic group". The compact Sp(n) = Sp_{2n}(ℂ) ∩ U(2n) has a different Lie algebra: knapp2002 lines 14865–14867 give 𝔰𝔭(n) ≅ 𝔰𝔭(n, ℂ) ∩ 𝔲(2n) as the compact real form. Take n = 1. Then 𝔰𝔭(1) ≅ 𝔰𝔲(2) has negative-definite Killing form. But 𝔰𝔭(2, ℝ) ≅ 𝔰𝔩₂(ℝ) has B(h, h) = 8 > 0 and B(e − f, e − f) = 4 tr((e − f)²) = −8 < 0. They are non-isomorphic real forms of 𝔰𝔩₂(ℂ), so the cited isomorphism says nothing about η(Sp(1)). The scope list (line 2093) correctly writes "Sp(2l, ℝ)", so only §7.6 is wrong. The description's "the Lie-algebra half of the classical complexifications (§7.6)" repeats the claim.

Smallest change: in §7.6, keep the three unitary and orthogonal equivalences as the Lie-algebra halves. Say that `TauCeti.Lie.symplecticBaseChangeLieEquiv` is the split case ℂ ⊗ 𝔰𝔭(2l, ℝ) ≅ 𝔰𝔭(2l, ℂ), and that 𝔰𝔭(n) ⊗_ℝ ℂ ≅ 𝔰𝔭(2n, ℂ) for the compact Sp(n) is part of this target.

## R02 (P2) — The complex Lie group G(ℂ) of §7.9 has two owners: this roadmap and ReductiveGroups §3A.5e

An implementer cannot tell which roadmap builds the complex Lie group G(ℂ) of a smooth connected affine reductive G, because the two READMEs on main claim it in opposite directions.

On main, ReductiveGroups' README says:
- lines 64–69: "LieGroups Layer 7 is a consumer of 3A.5e, not a second supplier of it";
- lines 2024–2033: for any closed immersion G → GL(V), 3A.5e proves that G(ℂ) carries the structure of a closed embedded complex submanifold of GL(V)(ℂ), identifies its Lie algebra with ReductiveGroups Layer 2's, and adds "This complex Lie-group dictionary is owned here";
- lines 6649–6650: "Layer 3A.5 is the single owner of … the complex Lie group G(ℂ)".

This README builds the same subspace topology, complex atlas and tangent identification in §7.9 (lines 1443–1451), "from the carriers of this layer and the algebraic inputs of ReductiveGroups only". Its Scope (lines 2112–2116) acknowledges 3A.5e and then says "the dictionary itself … is owned here". The *Needs* line of 3A.5e (ReductiveGroups line 2058) uses nothing of LieGroups, and this roadmap already consumes ReductiveGroups Layers 0–4, 6, 7 and 7C. So §7.9 can cite 3A.5e without creating a cycle.

Smallest change:
- In §7.9, take G(ℂ), its complex Lie-group structure as a closed embedded complex subgroup of GL(V)(ℂ), and its identification with ReductiveGroups Layer 2's `Lie(G)` from ReductiveGroups §3A.5e. Add 3A.5e to the *Needs* line, the Layer 7 Dependencies and the ReductiveGroups supplier contract.
- Keep as targets here what is specific to the reductive case: Z(G)⁰ as the central torus with tangent algebra 𝔷(𝔤), G_der(ℂ) connected with tangent algebra [𝔤, 𝔤], and the central multiplication with finite kernel.
- Change the Scope sentence to match.

Consumers that cite "the lower analytic dictionary of §7.9" still find it there.

## C01 — The §4.1 Check says the immersion field follows from the other fields, which is no longer true of the carrier it describes

The last sentence of the §4.1 Checks (lines 651–652) says "The immersion condition follows from the others (an injective smooth homomorphism has `ker dφ = Lie(ker φ) = 0`)". That held for the old local structure, which had a separate smoothness field. `TauCeti.Lie.ImmersedLieSubgroupData` (`Geometry/Lie/Subgroup/Immersed/Basic.lean` lines 59–102) has only connectedness, `injective`, `range_eq` and `isImmersion`. Smoothness lives inside `isImmersion`. For example, take X = ℝ and a ℚ-linear automorphism of ℝ that permutes two Hamel basis vectors. It is injective, its source is connected and its range is ℝ, but it is not smooth. Would read: "The immersion field is the only smoothness condition; for a smooth injective homomorphism injectivity of the differential would be automatic, since `ker dφ = Lie(ker φ) = 0`."

## C02 — Several chapter-level citations of Kirillov point to chapters that do not contain the cited material

These citations were added as blanket locators:
- §2.1 (line 392, "Kirillov, Chs. 2–3"). Kirillov treats only closed subgroups (Thm. 2.8, kirillov2008 line 234) and embedded Lie subgroups (Thm. 3.19, line 870; Thm. 3.26, line 970). The non-closed case, which is the point of the headline `mem_lieSubalgebraOfSubgroup_iff`, is not there.
- §§7.2, 7.5, 7.6 and 7.11 (lines 1270, 1356, 1380, 1518, "Kirillov, Chs. 5–8"). In the online copy these chapters are representations of 𝔰𝔩(2, ℂ), structure theory, complex semisimple Lie algebras and root systems (lines 48–78). Kirillov says complexification of groups is not treated and refers to another text (lines 1254–1257). He states the compact real form without proof (Thm. 6.52, lines 3117–3123).
- The References entry (line 2372, "the structure of compact groups and complexification (Chs. 5–8)") has the same problem.

Would be, in §§7.2, 7.5, 7.6 and 7.11: keep Bump and Knapp and either drop Kirillov or cite only his §3.9 (Definitions 3.51–3.53, lines 1238–1249) for the Lie-algebra notion of a real form. For §2.1, cite a text that treats arbitrary subgroups, or say that the finite-product route is the roadmap's own. Correct the References entry to match.

## C03 — §8.3 does not say that SchubertGeometry builds the general-field associated line independently, and the downstream sentence says SchubertGeometry uses Layer 8's lines

§8.3 (lines 1653–1656) says the descent construction of `E_χ` "is built here". SchubertGeometry S3.1 on main (its README line 927) constructs L(λ) on G/B⁻ by descent over any field, with linearization, tensor and dual laws. Its LieGroups contract (lines 542–548) takes only the compact flags and their complex comparisons. Yet Downstream consumers (lines 2044–2046) lists "associated lines from Layer 8" among what SchubertGeometry uses. Would be: add one clause to §8.3 saying that SchubertGeometry S3.1 builds the general-field line on G/B⁻ independently and that the two are compared through φ, and drop "and associated lines" from the downstream sentence. This is the previous review's third point, not yet applied.

## C04 — `exists_holomorphic_extension` keeps the hypothesis `hινj`, which `huniv` already implies

`hινj : Function.Injective ι` (`Suggested.lean` line 337) is not in the README's statement of §7.11 (lines 1507–1509). For compact connected G it follows from `huniv` through §7.5's faithful unitary representation (ρ = ρ_ℂ ∘ η forces η injective), and the extension does not use it. Would be: drop it, or say in the docstring that it is redundant and kept for convenience. The universe half of the previous review's first point is repaired: Conventions lines 162–167 and the module docstring lines 47–48 now state the fixed universes.

## C05 — `exists_monoidHom_of_lieHom` fixes the target group in the universes of the source, which the README does not say

§4.3 (line 677) says "any Lie group G′". The Lean statement takes `E' : Type u`, `H' : Type v` and `G' : Type w`, the universes of `E`, `H` and `G`. The Conventions paragraph on universes (lines 162–167) names only §§7.3, 7.6 and 7.11 as fixed-universe statements. Would be: add §4.3 to that sentence, or give the target fresh universe variables.

## C06 — Two sentences of the description do not match the head

- "are definitionally the same notions, so the Layer 6 statements did not change". This holds for `Subgroup.normalizerQuotient` and `TauCeti.Lie.weylDensity`, but not for `TauCeti.Lie.IsMaximalTorus`. That is `Maximal IsTorus T`, with commutativity as the class `IsMulCommutative T` on the subtype (`Geometry/Lie/Subgroup/Torus.lean` lines 82–89): equivalent to the old body but not definitionally equal. Would read: "are equivalent to the local definitions (the normalizer quotient and the density definitionally), so the Layer 6 statements did not change in meaning".
- "the Lie-algebra half of the classical complexifications (§7.6)" would read: "the Lie-algebra half of the complexifications of U(n), SU(n) and SO(n), and the complexification of the split 𝔰𝔭(2l, ℝ)". See R01.

## N01 — The guide to the build gives a teaching order as the reason for the layer order

"The layers come in three groups, kept from the order in which the theory is usually taught" (line 55) would better say that the order is the one the *Needs* lines force. It is.

## N02 — The maximal compact subgroups of `SL` are listed as in the library but not named

The Scope (line 2096) lists `SL` among the maximal-compact results at the pin, but the Tau Ceti contracts name only the `GL` and `Sp` declarations. The pin has `Matrix.SpecialLinearGroup.eq_comap_unitarySubgroup_of_isCompact_of_le` (`LinearAlgebra/Matrix/SpecialLinearGroup/MaximalCompact.lean` line 105).

## Questions for the author

- §2.1 also cites Varadarajan, Chs. 2–3. Which statement there covers the direction set of a non-closed subgroup? The text is settled as uncertified, so I could not check it.

## Verified sound

**Adversarial table.** It has one row per seeded target, per headline theorem and per target a remark touches. All values were computed by hand.

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| Seed §0.1 Lie algebra ≅ T₁G | G = ℝⁿ; all derivations of C^∞ | ∑aᵢ∂ᵢ, bracket 0, finrank n; all derivations infinite-dimensional; kirillov2008 Thm. 2.25 line 419 | sound |
| Seed §1.1 group adjoint | GL₂, g = diag(2,1), X = E₁₂; SU(2) | gXg⁻¹ = 2E₁₂, g⁻¹Xg = ½E₁₂ (anti-homomorphism); Ad(SU(2)) = SO(3), kernel {±1}; kirillov2008 lines 398–414, 607 | sound |
| Seed §2.1 / `mem_lieSubalgebraOfSubgroup_iff` | ℚ ⊂ ℝ; SL₂(ℤ); irrational line | 𝔨 = 0; exp E₁₂ ∈ SL₂(ℤ), exp(E₁₂/2) ∉; dim 1 not 2; ← is span inclusion | true; Kirillov does not cover it (C02) |
| Seed §4.2 / `exists_simplyConnected_lieGroup` | L = 0, ℝ, 𝔰𝔩₂(ℝ) | point; ℝ (circle excluded); universal cover of SL₂(ℝ), π₁(SL₂ℝ) = ℤ; kirillov2008 Thm. 3.48 line 1214, Cor. 3.49 line 1223 | sound |
| Seed §5.2 centres | SU(2); Heisenberg; Q₈; 𝔰𝔩₂(ℝ) | ker Ad = {±1} = Z; H/Z ≅ ℝ² with centre ℝ²; ker Ad = Q₈ ≠ {±1}; Z(U) ≅ ℤ, D = nℤ, n ≥ 0 | sound; kirillov2008 Thm. 3.32 line 1029 |
| Seed §5.3 / `lieExp_surjective_of_isNilpotent` | Heisenberg; ℝ/ℤ; SL₂(ℝ) | exp(aX+bY+cZ) = [[1,a,c+ab/2],[0,1,b],[0,0,1]]; Γ = ℤ, onto, not injective; diag(−2,−½) commutes ⇒ diagonal ⇒ no | sound; Thm. 3.34 line 1056 |
| Seed §6.1 tori | U(n); ±1-diagonal; Q₈; SU(2) | diagonal maximal; not connected; Weyl group order 8; N(T)/T = C₂, N(T)/{±1} infinite; `Torus.lean` 82–89 | sound |
| Seed §6.9 / `weyl_integration_formula` | SU(2); G = T; det on 𝔤; f = 1/sin²θ | det(R₋₂θ − 1) = 4sin²θ, mean 2 = \|W\|; D = 1, \|W\| = 1; 0 ⇒ 1 = 0; ∫_G f = 2, f\|_T ∉ L¹ | sound |
| Seed §7.5 polar geometry | Circle; SO(3) | P = U(1)·ℝ_{>0} = ℂˣ; P = SO₃(ℂ), π₁ = ℤ/2 both; dρ(𝔤) ⊂ 𝔲(V) totally real | sound; Kirillov citation C02 |
| Seed §7.7 algebraization | U(1) ⊂ GL₁; SU(2) ⊂ GL₂ | Zariski closures 𝔾_m, SL₂; 𝔾_m(ℂ) = ℂˣ, SL₂(ℂ) = SU(2)_ℂ | sound |
| Seed §7.8 real forms | ℂ/(ℤ+(√2+i)ℤ); ℂˣ; {2ⁿ} | √2−i = a+b(√2+i) ⇒ b = −1, a = 2√2 ∉ ℤ; ℝ+Λ = ℝ×ℤ closed; ℝ_{>0}, S¹, ℝˣ; Lie = 0 | sound |
| Seed §8.2 Bruhat | GL₂(ℂ); GL₂(𝔽₃)×C₂; B = T | B∩N = T, 2 cells; \|T\| = 4, \|B∩N\| = 8, \|N/T\| = 4, 2 double cosets; ⋃TnT = N(T) | sound |
| Seed §8.5 Borel–Weil | SL₂, λ = n; GL₃, λ = (1,0,0) | h⁰(O(n)) = n+1; f(g) = ℓ(ge₁), f(gb) = b₁₁f(g), action ℓ∘a⁻¹ = dual; −w₀λ = (0,0,−1) | sound |
| Seed §8.7 BWB | SL₂, μ = −1, −3; L_{λ+2ρ} | μ+ρ = 0 ⇒ zero; s_α(−2)−1 = 1, h¹(O(−3)) = 2; ⟨λ+2ρ, αᵢ∨⟩ ≥ 2 ample | sound |
| Seed §9.4 / `iwasawaDecomposition` | SL₂(ℝ): N₊, N⁻; ℤ-unipotent; chamber = 𝔞 | α(diag(1,−1)) = 2; N⁻ admissible; fails connected and complement; fails at −diag(1,−1); knapp2002 VI.4 line 15448 | sound |
| `mfderiv_lieExp_eq_integral` | GL₂, X = diag(1,0), Y = E₁₂; GL₁ | exp(X+tY) = [[e,t(e−1)],[0,1]], left translate (1−e⁻¹)E₁₂ = ∫e⁻ˢ; +sign gives e−1; factor 1 | sound |
| `simplyConnectedSpace_SU2` | (a,b) ↦ [[a,−b̄],[b,ā]] | det = \|a\|²+\|b\|², M*M = (\|a\|²+\|b\|²)I; S³ ⊂ ℝ⁴, rank 4 > 2 (`simplyConnectedSpace_sphere`, SimplyConnected.lean 389) | sound |
| `exists_immersedLieSubgroup_lieSubalgebra` | 𝔥 = 0, 𝔤; irrational line | K = ⊥; K = G⁰; dense K; Tau Ceti carrier X : Type w, E′ : Type u as before | sound |
| `exists_monoidHom_of_lieHom` | ℝ → Circle; Circle → Circle | x ↦ cx integrates for all c; only c ∈ ℤ (Circle.exp 2πc = 1) | sound; universes C05 |
| `exists_mem_maximalTorus`, `isConj_…`, `lieExp_surjective` | U(n); O(2); Q₈ | spectral theorem; reflections in no torus; −1 in no torus | sound |
| `exists_mem_normalizer_conj` | SU(2); SO(3), u = diag(1,−1,−1) | swap by [[0,−1],[1,0]]; C(u) = {diag(±1,B)} ≅ O(2), disconnected | sound |
| `centralizer_eq_of_isMaximalTorus` | U(n); O(2) | C(T) = T; C(T) = T but \|N/T\| = 2 with reflections outside tori | sound |
| `weyl_conjugation_pushforward` | f = 1 | total mass ∫D/\|W\| = 1; (gt′)t(gt′)⁻¹ = gtg⁻¹ | sound |
| `exists_connected_complexification` | ℝ; Circle; cover of SL₂(ℝ) | ℂ; ℂˣ; SL₂(ℂ) with infinite cyclic kernel; trivial group excluded by uniqueness | sound |
| `exists_complexification` | U(1); SU(2) | ℂˣ, SL₂(ℂ), injective | sound |
| `exists_holomorphic_extension` | U(1) ⊂ SL₂(ℂ); ℂˣ | weight-one character does not extend (SL₂ perfect); zⁿ extend | sound; `hινj` redundant C04 |
| `cartan_polar_decomposition`, `CartanInvolution` | GL₁; motion group n ≥ 2; n = 1; circle with inversion | x = ±eᵗ; centre 0, derived ⊇ ℝⁿ ⇒ none; ⟨diag(eᵗ,e⁻ᵗ), swap⟩ fixed {1, swap}; π(g)² = 1 contradiction | sound |
| `kakDecomposition` | GL_n; SL₂ | SVD a₁ ≥ … ≥ aₙ, centre lineality; diag(eᵃ, e⁻ᵃ) | sound |
| `bijOn_exp_triangular`, `lieExp_bijective_of_…` | m = 0, 1, 2; diag(−1,1); U(2) | exp[[a,x],[0,b]] off-diagonal x(eᵃ−eᵇ)/(a−b); (1,0,1) ↦ [[e,e−1],[0,1]], log x = 1; not reached; K∩AN = {1} | sound |
| R01 §7.6 Sp(n) | n = 1 | 𝔰𝔭(1) ≅ 𝔰𝔲(2), B < 0; 𝔰𝔭(2,ℝ) ≅ 𝔰𝔩₂(ℝ), B(h,h) = 8, B(e−f,e−f) = −8 | misattributed |
| R02 §7.9 G(ℂ) | 𝔾_m → GL₂, t ↦ diag(t,t⁻¹) | both constructions give ℂˣ with the subspace structure (ReductiveGroups Check, its lines 2068–2071) | two owners |
| C01 immersed carrier | X = ℝ, Hamel-basis automorphism | injective, connected source, range ℝ; not smooth, not `IsImmersion` | out of date |
| C03 §8.3 lines | SL₂, B⁺ | E_n = O(−n), φ*(κ) = E₋κ = E_{w₀κ}; L_μ ↦ SchubertGeometry's L(−w₀μ) | sound; relation unstated |

- **Previous review:** R02 was repaired: §5.3 lines 800–801 now cite `IsCoveringMap.homotopyGroupMulEquiv` (`Topology/Homotopy/HomotopyGroup/Covering.lean` line 158, π_N(E, e) ≃* π_N(X, p e) for nontrivial N). R01 was partly repaired: universes are documented, `hινj` is kept (C04). R03 was not repaired: §8.3 lines 1653–1656 are unchanged in substance (C03).
- **Source locators** checked against the text (16): kirillov2008 Thm. 2.25 (419), §2.4 (398–414, 607), Thm. 2.8 (234), Thm. 3.19 (870–877), Thm. 3.26 (970), Thm. 3.32 (1029), Thm. 3.34 (1056), Thm. 3.48 (1214), Cors. 3.49–3.50 (1223–1234), §3.9 (1236–1262), Thm. 6.52 (3117–3123), contents (13–94); knapp2002 contents (61–148), Thm. 6.11 with remarks (14861–14867), Thms. 6.16/6.31 (14985, 15159), VI.4 (15448–15470).
- **Library declarations opened at the pins** (34), including: `IsMaximalTorus` (`Torus.lean` 88), `weylDensity` (`Weyl/Density.lean` 64), `ImmersedLieSubgroupData` (`Immersed/Basic.lean` 59), `mem_centralizer_iff_forall_Ad_apply_eq_self` (`Commutative.lean` 110), `finite_normalizerQuotient` (`Weyl/Finite.lean` 194), `range_lieMapSubtypeVal_eq` (`Differential.lean` 230), `normalizerQuotient` (`NormalizerQuotient/Basic.lean` 47), `LeftInvariantDerivation.Ad_lieExp` (`Adjoint/Exponential/Formula.lean` 292), `homotopyGroupMulEquiv` (`Covering.lean` 158), `simplyConnectedSpace_sphere` (389), `symplecticBaseChangeLieEquiv` (349), `cartanHomeomorph` (`Analysis/Matrix/Cartan.lean` 60), the GL/Sp maximal-compact theorems (106, 73), `exists_conj_smul_le_unitarySubgroup` (132), `polarUnitary_mem` (104), `completeSpace_leftInvariantMetric` (358), `serreChevalleyInvolution` (300), `exists_universalCover` (41), `homEquivKerProjHom` (33), `nonempty_continuousMulEquiv_pi_circle` (241), `closedZpowers_lieExp_eq_top_iff` (87), `envelopingAction_injective` (154), `pbwBasis` (96), `lieExp_circle` (104), `circleLieAlgebraEquiv` (87), `groupLieAlgebra_units_ad_apply` (113), `closure_range_lieExp_eq_connectedComponentOfOne` (72), `t2Space_of_lieGroup` (35), `ContMDiffMul.boundarylessManifold` (61), `TitsSystem` fields (`TitsSystem/Basic.lean` 50–61), `hasFDerivAt_extChartAt_lieExp_zero` (259), Mathlib `orthogonalGroup`/`specialOrthogonalGroup` (`UnitaryGroup.lean` 318, 338). A scripted pass found every other qualified name in the README at the pins.
- **Cross-roadmap citations resolved on main** (45): DifferentialGeometry 2.3 (1149), 3.2–3.3 (1263, 1278), 4.3–4.4 (1540, 1588), 10.2–10.5 (2695–2750); SmoothBundlesConnections B1.1 (378) and B1.4 (578); CompactGroups 0.1, 0.2, 1.2, 5.2, 6.2 and E.1–E.4 (185–803); LieHighestWeight 7.1 (1751); AdoIwasawa Layers 5 and 9 (365, 523, 537); ReductiveGroups Layers 0, 1, 2, 3, 4, 6, 7, 7C and 10, plus 3A.5e (2014); ComplexManifolds Milestone 1 (172); ComplexKahlerGeometry Layer 1 (135), 5.10 (2049) and 6.1 (2127); `Completed/HopfRinow` Layer 3 (451); RiemannianGeometry R4 item 5 (2580); CotangentLagrangian C2.0 and C2.1 (190, 222); SchemeAndStackFoundations 1.15, 1.16, 2.2 and 2.6 (3290–4357); ComplexComparisonPartII C-1.1, C0.1, C0.3–C0.5 and C1.9 (1003–1976); HamiltonianReduction R2 (127); ConvexityToric T1 = Layer 1 (200); SchubertGeometry S3.1 (925) and its LieGroups contract (542).
- **Overlap check:** read LieGroupsPartII, RealSemisimpleLieGroups and ReductiveGroups on main, and CompactGroupsPartII at its open head. Shared objects: Layer 9's decompositions and restricted roots are owned here (RealSemisimpleLieGroups and LieGroupsPartII cite them). Compact structure theory is owned here (CompactGroupsPartII cites it). The complex Lie group G(ℂ) of an affine reductive group is owned by ReductiveGroups §3A.5e and also claimed here (R02). LieGroupoidsPoisson and AdoIwasawa on main are a consumer and a supplier, with no shared object.
- **Duplication by object:** no theorem of `Suggested.lean` is proved at the pin. The only general results found are the commutative-group `lieExp_surjective_of_preconnectedSpace` and the U(n) torus theorems. No other roadmap declares these names.
- **Automatic checks:** the worker's gate passed. The dependency check prints `depcheck: 199 roadmaps, 2201 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean` exits 0 with 22 `sorry` warnings and nothing else. The one-tactic probe (`first | rfl | simp | infer_instance | assumption | simp_all | trivial`) closes none of the 22 theorems. Every elaborated `#check @name` type was compared with the README: the three dropped binders (`T2Space` on `FiniteCartanMatrixModel`; `FiniteDimensional` on `CartanInvolution` and `IsRealReductive`) are used by no field, and every theorem on these structures carries them. The pull request changes nothing outside the folder.
- **Source independence:** 7 passages compared with 3 sources, none shared: §0.1, §4.2 and §5.2 against kirillov2008; §7.1 and §9.4 against knapp2002; §7.3 against heins2025; §3.3 against the formula of kirillov2008 Thm. 3.34. Largest share is kirillov2008, 19 of 62 locators. Contents compared with kirillov2008: independent. Layers 0–4 share Kirillov Ch. 3's dependency order but not its scope (Layer 2 carries the matrix groups and SU(2), Layer 5 nilpotent groups and U(𝔤)), and Layers 5A–9 have no counterpart.
- **Research link:** §7.3's universal complexification is the period-quotient construction that Heins (2025, arXiv 2512.07479, Prop. 2.1) uses for entire functions on Lie groups. Layers 6–9 are the compact and real-reductive structure theory that the README's consumers RealSemisimpleLieGroups and ArithmeticLocallySymmetricSpaces build on. This rests on the README and heins2025.

## Not verifiable

- Bump, Bröcker–tom Dieck, Hall, Varadarajan, Humphreys, Serre, Lee: settled as uncertified. Their chapter and section locators were checked only against the contents as commonly cited.
- LieGroupsPartII, RealSemisimpleLieGroups, LieGroupoidsPoisson and AdoIwasawa at their open heads: not among the checkouts given, so they were read on main and ownership against those open heads was not checked.

## Source issues

- **Gap** in kirillov2008 at Theorem 3.19, printed pp. 25–26 (lines 870–877): the source states that a Lie subgroup's tangent space is a subalgebra and normal subgroups give ideals, but leaves the proof as a placeholder of question marks; it should be the standard argument via one-parameter subgroups; affects nothing.

## For the human reviewers

- Not tested: Bump (12 locators) and Bröcker–tom Dieck (9) are settled as uncertified, so wording and arrangement were not compared with them; the largest-share source, kirillov2008, was read.
