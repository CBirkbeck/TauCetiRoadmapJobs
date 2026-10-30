# Review of GanGrossPrasadUnitaryGroups (pull request #1404 at f802dd1)

**Verdict:** needs changes

One P2 finding (a supplier declaration cited by name that does not exist in the cited roadmap) and four P3 notes. The mathematics of the sampled targets, the headline list, the gaps and the supplier direction all checked out; the repairs are textual.

## R01 (P2) — `ExtendedUnitaryPacket` and `UnitaryClassificationInputs` are cited as supplier declarations that do not exist

Location: `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md`, Scope paragraph (line 17: "owns the shared carriers for local parameters, inner twists, Langlands packets and pairings, including `ExtendedUnitaryPacket`"), the EndoscopicTransferAndUnitaryTraceComparison contract (line 141: "§11.3 for `ExtendedUnitaryPacket`"; "Retain `UnitaryClassificationInputs`, including its Mok and weighted-stabilization premises"), and gaps enhanced-packets and global-parameters (lines 143, 145: "Retain `UnitaryClassificationInputs` in the supplied conditional theorem and discharge its premises").

Claim: EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 declare a carrier `ExtendedUnitaryPacket` and a hypothesis bundle `UnitaryClassificationInputs`, and this roadmap's contracts are phrased against them.

Witness: `tauceti-roadmap roadmaps grep 'ExtendedUnitaryPacket|UnitaryClassificationInputs'` over main and all 424 open heads returns hits only in this README. The supplier's README at its head (#999) has §11.2 "Tempered local unitary packets with inner-twist pairings", §11.3 "Extended local unitary packets by positive-exponent induction", §11.4 "Endoscopic classification of unitary groups for generic parameters", and states its premises as "the unitary classification contract of §§11.0d–11.0e" (11.0d quasi-split local classification, 11.0e quasi-split global classification); the backticked names in §11 are only variables and roadmap names. Its `Suggested.lean` does not declare either name.

Repair: drop both backticked names. Write "the extended local unitary packets of §11.3" for the carrier and "the unitary classification contract of §§11.0d–11.0e (the Mok and weighted-stabilization inputs)" for the premises, in the Scope paragraph, the supplier contract and the two gap sentences (and the matching `needs` sentences in `design/plan.json`, see R02). The sections cited exist and say what the README uses from them, so nothing else changes.

## R02 (P3) — `design/plan.json` names different suppliers and sections than the README for four gaps

Location: `packages/GanGrossPrasadUnitaryGroups/design/plan.json`, `gaps` entries `enhanced-packets`, `global-parameters`, `ordinary-endoscopy`, `spectral-isolation`; README "Exact supplier contracts".

Claim: the plan and the README declare the same gaps (the intake announces each gap on the plan's supplier).

Witness: plan `enhanced-packets` supplier ModularityAndLanglandsExtensions "3.13, 3.15 and 3.20"; README states it under EndoscopicTransferAndUnitaryTraceComparison "§§11.2–11.3". Plan `global-parameters` supplier ModularityAndLanglandsExtensions "5.1 and 5.4" (those sections at #1180 are Cogdell–Kim–Piatetski-Shapiro–Shahidi transfer and Ginzburg–Rallis–Soudry descent for split classical groups); README states it under EndoscopicTransferAndUnitaryTraceComparison "§11.4". Plan `ordinary-endoscopy` section "Layers 2–5 and 11.2–11.4"; README "Layers 2–5". Plan `spectral-isolation` section "proposed Part II §§SM.0–SM.5"; README "requested Schwartz-multiplier continuation of §6.3" (AutomorphicSpectralTheoryPartII at #1761 has no SM sections; its isolation targets are §§5.3–5.7). The `needs` sentences also differ in wording for enhanced-packets and global-parameters.

Repair: edit the four `gaps` entries of `design/plan.json` (the one part of the plan a package may change) so that `supplier`, `section` and `needs` are the README's. The announcement for enhanced-packets and global-parameters then reaches the endoscopic roadmap, which is the owner the README argues for.

## R03 (P3) — AutomorphicLFunctionsAndLocalFactors targets cited through anchors that do not exist

Location: README lines 179–181 (contract "From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors"): links `README.md#whittaker-model`, `#rs-local-convergence`, `#rs-local-factor`, `#normalized-rs-period`, and the name `rs-local-integrals`; the same slugs recur in the *Needs:* lines of §§3.10, 3.11, 5.1a, 5.3, 6.1.

Claim: these are the supplier's labels for its targets.

Witness: none of the five strings occurs in that roadmap's README at its head (#924), which labels its targets by number: AL.3.1.2 "The Whittaker realization", AL.3.2.1 "The local Rankin–Selberg integrals", AL.3.2.2 "Local convergence and continuity", AL.3.2.3 "The Rankin–Selberg local L-factor", AL.3.8.1 "The normalized adjacent-rank period" (which states exactly what the README attributes to it: entire quotient, invariance, spherical value 1, tempered convergence for Re(s) > −1/2).

Repair: replace each slug by the target number and title (AL.3.1.2, AL.3.2.1, AL.3.2.2, AL.3.2.3, AL.3.8.1) and drop the markdown anchors.

## R04 (P3) — gap:hermitian-unitary points at RG2.4, whose subject is different

Location: README line 149 ("The section contract is RG2.4: arbitrary-form Hermitian continuation"); plan.json the same.

Claim: ReductiveGroupsPartII RG2.4 is the Hermitian-form section the continuation extends.

Witness: ReductiveGroupsPartII on main lists RG2.4 as "the decompositions of G(E), the Iwahori–Weyl combinatorics up to admissible sets, the local adjoint-modulus formula and the algebraic parabolic adjoint determinant identity"; its only Hermitian material is the rank-one `SU_3` examples.

Repair: label the contract as a new continuation section of ReductiveGroupsPartII (no borrowed number), or point it at the section whose objects it extends; the `needs` sentence is already precise and minimal.

## R05 (P3) — two cited sources are missing from the manifest

Location: README References, keys `bpc-bessel` (cited with line locators in §4.4) and `kmsw` (cited with line locators in §3.1); `packages/GanGrossPrasadUnitaryGroups/sources.toml` has neither key.

Claim: every cited work is recorded in the manifest and its line locators refer to a cached extraction.

Witness: the manifest's keys are xue-real, xue-bessel, ggp, agrs, sun-zhu, bp-unitary-tempered, bp-arch, bp-refined, harris, bplzz, bpcz, jsz-bessel, bp-plancherel, zhang-period, bernstein-zelevinsky, bp-fundamental, ag-descent. I fetched both texts through the sources service (bpc-bessel from the author page cited in References, licence class author-page; kmsw from arXiv 1409.3731v1) and the README's line locators match them: bpc-bessel line 268–277 is Theorem 1.3.3.1, line 352–373 is §1.3.6 with Theorem 1.3.6.1, line 378–379 is Remark 1.3.6.2(3); kmsw line 1074 defines S_φ, S_φ^rad and S_φ^♮, line 1112–1113 is Lemma 0.4.13.

Repair: add both keys to the manifest with the fetched provenance (the service records url, fetched_from, sha256 and licence class), so the locators are certified rather than dangling.

## Verified sound

**Gate.** The worker's gate at this head passes every check including the targeted build (`build=0`). I reran the scanners (`gate … --base origin/main`): all zero, OK. The dependency check: `depcheck: 204 roadmaps, 1392 edges, 0 problem(s)`; no UPWARD or CYCLE line. The outside-folder diff is empty.

**Lean.** `lake env lean` on `Suggested.lean` at the pins (Mathlib 6b7abb3c, Tau Ceti a91d3aaf; shared package directory confirmed at the pin with a complete olean set) exits 0 in 2.5 s with no output. The file declares nothing, so there was no `#check` probe and no one-tactic padding probe to run. I checked the docstring's claim that no headline is statable: Tau Ceti at the pin has no smooth, admissible or Casselman–Wallach representation carrier (the only "admissible" hits are combinatorial files), Mathlib at the pin has no local-field class and no Whittaker, Bessel-model or Harish-Chandra object (the "Bessel" hits are Bessel potential spaces), and no arbitrary-form unitary group exists (`Matrix.unitaryGroup` is the identity Gram matrix, `Mathlib/LinearAlgebra/UnitaryGroup.lean:58`). Stating the split GL case over `ℚ_[p]` alone would be a narrowed stand-in, which the rules forbid. The empty file is correct.

**Headline theorems.** The README lists them (line 549–555): §2.2, §§2.3–2.6, §2.7, §§3.1–3.2, §§3.3–3.5, §§3.6–3.9, §3.11, §§4.1–4.3, §§5.1a–5.3, §§6.1–6.5, §§7.1–7.2, §7.4; §3.10 conjectural; §4.4 literature theorem with formal proof assigned to Part II. The module docstring names every one of these with the missing carrier. Agreement README/Lean: no backticked name of this roadmap's own is claimed.

**Pinned declarations opened** (file:line at Mathlib 6b7abb3c / Tau Ceti a91d3aaf): `LinearMap.Nondegenerate` SesquilinearForm/Basic.lean:595; `LinearMap.flip_nondegenerate` ibid.:656; `Submodule.orthogonalBilin` SesquilinearForm/Orthogonal.lean:48 and `mem_orthogonalBilin` :54; `Representation.IntertwiningMap` RepresentationTheory/Intertwining.lean:36, `.ext` :53, `.isIntertwining` :87; `Representation.tprod` RepresentationTheory/Basic.lean:618, `tprod_apply` :626, `dual` :670; `Matrix.unitaryGroup` UnitaryGroup.lean:58; `Prod.isUnit_iff` Algebra/Group/Prod.lean:615; `isUnit_iff_ne_zero` GroupWithZero/Units/Basic.lean:263; `Nat.card_fun` Cardinal/Finite.lean:242, `Nat.card_sum` :217; `pi_eq_sum_univ'` BigOperators/Pi.lean:72; `map_sum` (to_additive of `map_prod`) BigOperators/Group/Finset/Defs.lean:365; `LinearMap.mul'` Algebra/Bilinear.lean:40; `TensorProduct.map_tmul` TensorProduct/Map.lean:59; `Circle` Complex/Circle.lean:53, `Circle.coeHom` :97; `invMonoidHom` Group/Hom/Basic.lean:61; `LinearEquiv.finrank_eq` Dimension/Finrank.lean:115; `TauCeti.HopfAlgebra.pointsFunctor` TauCeti/Algebra/AlgebraicGroup/PointsFunctor.lean:150. All exist with the meaning the README gives them.

**Cross-roadmap citations resolved** (at main for ReductiveGroups, ReductiveGroupsPartII, NoncommutativeGeometry; Completed for GlobalNumberFields and RestrictedProducts; open heads for the rest): ReductiveGroups Layers 0, 3, 5, 7 (present); ReductiveGroupsPartII RG2.4 (present, different subject: R04); NoncommutativeGeometry N1 (constructs completed projective tensors of Hausdorff locally convex spaces with the universal property, as used); GlobalNumberFields Layers 4–6, 8 (finite adeles, full adeles, strong approximation and ideles, finite extensions of adeles); RestrictedProducts Layers 0–3; GeometryOfNumbersAndQuadraticArithmetic §2.9 `SignedHermitianSpace K V ε`, `signedHermitianAdjoint` and its four lemmas, stated "for any commutative field with involution and finite-dimensional V" with the odd-residue hypotheses reserved for the classification theorems, exactly as the README says; MetaplecticAutomorphicForms §3.2a (split E=F×F, A⊕A∨, pairing (ℓ(y), εk(x)) conjugate-linear first, isometry group GL(A) by (g,(g⁻¹)∨)), §0.18, §§3.3–3.6, 3.3b; SmoothRepresentationsOfLocalGroups SR.0.1–0.4, SR.2.1–2.3, SR.3.1–3.3, SR.4.1–4.2, SR.5 (all present); AutomorphicFormsOnReductiveGroups §§0.1–0.5, 2.3, 2.6 (`HasWhittakerModel`, `genericUnitaryInduction`, `genericUnitaryClassification`, `whittakerTwist`, stated for all GL_m(ℝ) and GL_m(ℂ), m ≥ 1), 2.7 (`seminormEstimate`), 3.4–3.5, 4.2; AutomorphicSpectralTheory Layers 0–4, 6 and §§6.3 (Arthur multipliers on C_c^∞(G,K) with support radius, as the README characterizes it), 6.4–6.6, 6.12–6.16; ModularityAndLanglandsExtensions §§3.12, 3.13, 3.16; EndoscopicTransferAndUnitaryTraceComparison Layers 2–5, §§11.2–11.4 (present; the two declaration names are R01); AdelicAlgebraicGroups §§0.1–0.3, 1.1–1.5, 2.2–2.5; AutomorphicLFunctionsAndLocalFactors AL.0–AL.5, AL.R.1 and the five AL.3 targets (present under numbers: R03).

**Gap audit.** All 36 slugs in the README are in `plan.json` and conversely; every gap names a supplier (none is `none`); each `needs` sentence is a single precise request with its hypotheses. Minimality spot checks against the suppliers at their heads: SR.3.3 does not state tempered GL genericity, SR.2.2 does not state the k! coinvariant dimension, SR.5 has the mirabolic functors but not the supercuspidal restriction theorem, SR.4 has Macdonald's formula for GL_n(E) but not the unitary spherical coefficients or spherical Whittaker normalization at every residue size, AutomorphicLFunctionsAndLocalFactors contains no Asai L-function, AdelicAlgebraicGroups has convergence factors but not the BPCZ Artin–Tate comparison for unitary inner forms: none of the gaps asks for something already provided. AutomorphicSpectralTheoryPartII (#1761, merge order after this roadmap) plans the BPLZZ isolation (§§5.3–5.7) and itself names this roadmap's §6.4 as the consumer needing the transfer-preserving supplement; this roadmap correctly cites neither it nor any later roadmap (gap:spectral-isolation carries the request).

**Ownership.** The Bessel subgroup, local model, epsilon character, global period and `GGP.8` are built nowhere else: TwistedAutomorphicDescents (#1758, later in the order) consumes this roadmap's §§1.2, 2.1–2.6, 3.7, 3.9, 4.1–4.4, 7.4 and owns only the orthogonal/symplectic Bessel data; PeriodsAndSpecialValues and SelmerIwasawaCohomologyPartII are consumers later in the order. The Scope section records the deferrals to GeometryOfNumbersAndQuadraticArithmetic, MetaplecticAutomorphicForms, ReductiveGroupsPartII and the named suppliers.

**Sources, seeded sample** (every locator opened at the cited line in the cached extraction; the statement at that line supports the README as written):
- 2.1: ggp line 2020–2022 (d(π)=dim Hom_H(π⊗ν,ℂ)), 2051–2062 (completed tensor, continuous functionals at infinity); xue-real line 196–200 (Hom_H(π⊗σ,ν) continuous).
- 2.7: harris line 231–250 (Ξ, weak inequality, Proposition 2.1 absolute convergence); bpcz line 166–167.
- 3.1: ggp line 727–737 (Theorem 6.1, χ_N(a)=ε(M^a⊗N,ψ₀), change of ψ₀ by det), 2425–2430 (Hermitian clause §17), 598–601 (ε duality), 510–548 (component group, Prop 4.1); bp-refined line 2625–2632 (ε^G_{φ,φ′}(s)=ε(φ^{s=−1}⊗φ′)), 2224–2225 (Φ_temp(G)=Φ^{(−1)^{d+1}}, ε(z_φ)=μ(V,h)); kmsw line 1074 (S_φ^♮=S_φ/S_φ^rad), 1112–1113.
- 3.7: bp-refined line 2869–2875 (Theorem 8.5.1, d even, d′ odd), 2888 (Fourier formula (1) with (1+ε(φ⊗φ′)μ(G))/2); bp-arch line 11200–11205 (Theorem 12.4.1).
- 3.8: xue-real line 63–67 (ψ, ψ_ℂ), 267–303 (outline, induction on a+b), 554–587 ((3.11)–(3.15)), 677–685 (signature rule), 848–864 ((3.17)), 873–876 (Prop 3.6), 893–900 (splitting characters), 983–984 (Lemma 3.8), 1024–1025 (Lemma 3.9), 1050–1088 (Lemma 4.1), 1098–1099, 1172–1173, 1188–1189 (Lemmas 4.2–4.4), 1207–1211 (§4.4).
- 3.9: xue-real line 213–216 (Theorem 2.2), 238–255 (Props 2.3–2.4, Cor 2.5), 179–182.
- 3.10: ggp line 2386–2388 (Conjecture 17.1), 2394–2405 (Theorem 17.2); bernstein-zelevinsky line 329–338 (geometric lemma 2.12, p. 448).
- 5.1a: zhang-period line 1543–1551 (Prop 4.10), 964–986 ((3.23)–(3.26)), 424–440 (measure warning), 1437–1440 (change of measures), 1523–1542 (Lemma 4.9), 656–678 ((3.2), (3.3)), 489–522 (self-dual measures, dg with ζ_F(1)).
- 5.2: bpcz line 159–169 (P♮ and (1.1.6.1)); harris line 75–111; bp-arch line 6797–6801, 6820–6833.
- 5.4, 5.5: bpcz line 168–193 (Theorem 1.1.6.1, Tamagawa measures, factorizing local Haar), 679–699 (§2.3.2–2.3.3).
- 6.1: bpcz line 4122–4153 (λ, β_η, ⟨,⟩_Whitt, Theorem 8.1.2.1), 4835–4845.
- 6.2: bpcz line 1167–1186 (K-basis, Prop 2.8.4.1), 4694–4701 (J^h_σ), 3040–3058 (I_{P,π}, Prop 5.1.5.1), 4225–4233 (I_Π), 4873–4888 (local J_{σ_v}).
- 7.1: bpcz line 124–134 (Theorem 1.1.5.1), 4835–4864 (§10.2).
- 7.4: bpcz line 179–193, 679–699, 4865–4946 (§10.3, (10.3.2.1), (10.3.3.2), (10.3.5.4), |S_Π|=2^{dim a_P}); bplzz line 185–186 (Theorem 1.10), 128–132 (Definition 1.5), 157–170 (Theorem 1.8, n > 1).
Also opened for the adversarial pass: bp-arch line 10066–10078 (Γ measure, atom at 1), 10204–10208 ((11.2.1) Δ(x)=|N_{E/F} det(1−x)|_{W″_x}|), 10248–10252 (Prop 11.2.1), 10538–10539 (Lemma 11.3.1), 10551–10558 (Theorems 11.4.1–11.4.3), 3994–4011 (c_θ average over Nil_reg(g_x), zero when G_x not quasi-split, Prop 4.5.1); bp-unitary-tempered line 5003–5004; agrs line 59–65 (Theorem 1′), 80–83 (Theorem 2′, σ(m)=m̄⁻¹); sun-zhu line 49–54, 66–68; ggp line 272–276 (geometric Frobenius to a uniformizer, |F|=q⁻¹), 2152–2235 (Theorem 15.1, Mackey orbits, Corollary 15.2); jsz-bessel line 24–27, 207–216 (Prop 3.1), 260–285 (Props 3.3–3.4, proof of Theorem A), 652–656 (Lemma 6.2), 765–804; bp-plancherel line 4480–4491 (Theorem 5.3.1), 4734–4748 (Theorem 5.5.1, Remark 5.5.2); ag-descent line 406–410, 583–599, 1189–1191; bp-fundamental line 99–119; harris line 149–157 (Remark 1.4), 170–181, 1289–1294; bpc-bessel and kmsw as in R05.

**Adversarial table** (values computed on each side):

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: split rank-one group | E=F×F, rank 1 | U(h)=GL_1(F)=F×; F-dimension 2 would give GL_2 | holds | none |
| Conventions: ν-covariance of P(f)=∫f ν⁻¹ | ν(h)=i | P(R(h)f)=ν(h)P(f)=i·P(f); weighting by ν gives ν(h)⁻¹=−i | holds | none |
| Conventions: constituent coefficient | counts (1,1),(2,1) | 2^{−2}=1/4, 2^{−3}=1/8; bpcz |S_Π|=2^{r_n+r_{n+1}} | holds | none |
| Conventions: rescaling laws | f→cf; B_v→2B_v; Haar 2 and 1/2; global H Haar ×2 | |P|²,⟨f,f⟩ ×|c|²; α_v,B_v(x,x) ×2 so q_v fixed; local product ×1; |P|² ×4 | holds | none |
| 1.1 rank and Witt index | W=0,r=0,L=⟨1⟩; W=0,r=1 | rank 1; rank 3 with maximal isotropic rank 1 (H⊕⟨1⟩) | holds | none |
| 1.1 field-form comparison h(x,y)=k(y,x) | E=ℂ, k=conj(x)y | h(i,1)=k(1,i)=i; h(1,i)=k(i,1)=−i; unswapped k(i,1)=−i | holds | none |
| 1.1 split-line frame condition | e=(1,1),(1,0),(2,1) over ℚ | norms (1,1),(0,0),(2,2): unit, non-unit, unit of norm 2 | holds | none |
| 1.1 split form h((x,ℓ),(y,m))=(m(x),ℓ(y)) vs MAF (ℓ(y),εk(x)) | ε=+1, v=(1,0), w=(0,1) | k(v,w)=(0,1), h(v,w)=(1,0); both self-pairings 0 | holds (slot swap of the supplier's formula) | none |
| 1.2 b(u) in split W=0, r=1 | u=[[1,x,z],[0,1,y],[0,0,1]], Gram antidiag(1,1,1), e₀=(1,1) | second factor J⁻¹(u⁻¹)ᵗJ has (1,3) entry −y; b(u)=(x,−y) | holds | none |
| 2.1 U(1) scalar models | weights (1,−1) and (1,1), z=i | i·i⁻¹=1: finrank 1; i·i=−1 on 1⊗1 vs +1 on target: finrank 0 | holds | none |
| 2.1 linear-first pairing | (i,1),(1,i),(cx,y),(x,cy) | i, −i, cB, conj(c)B | holds | none |
| 2.2 anti-involution | U(1) nonsplit, z with N(z)=1; split GL₂ unipotent | c₀(z⁻¹)=conj(z̄)=z so ι=id; transpose [[1,x],[0,1]]↦[[1,0],[x,1]] | holds (agrs σ(m)=m̄⁻¹) | none |
| 2.3 adjacent bound | U(0)⊂U(1), any character | Hom_1(χ,ℂ): dimension 1 ≤ 1 | holds | none |
| 2.4 unnormalized induction, Witt index | GL₂ upper B; W=H, r=1 | δ_B(diag(a,1))=|a|, normalized inserts |a|^{1/2}; W′≅H³, Y rank 2 < Witt index 3 | holds | none |
| 2.6 bound is not equality | U(2) std ⊗ U(1) weight 1 / weight −1 | restricted weights 2,1 (no 0): m=0; 0,−1: m=1 | holds | none |
| 2.7 temperedness needed | split GL₂×GL₁ trivial; compact U(1) | ∫_{F×}1 dt=∞; I(1,1)=vol(U(1)) | holds | none |
| 3.1 component groups | degree 1 nonsplit; one irreducible with multiplicity 2; split GL₁; zero parameter | O(1)={±1}, A order 2, z_φ≠0, quotient order 1; O(2): A order 2, z_φ=−Id∈SO(2)=0; S^♮=ℂ×/1=ℂ×, A=1; all trivial | holds | none |
| 3.1 epsilon character at z_φ | ℂ/ℝ, φ_V=χ₁⊕χ₋₁, φ_W=1 | χ₁ conjugate-symplectic (χ₁|ℝ×=sgn), signs −,+; ε(χ₁)ε(χ₁^∨)=χ₁(−1)=−1=χ_W(z) | holds | none |
| 3.1 multiplicity 2 | φ_V=χ₁⊕χ₁ | generator value ε(χ₁,ψ_E)=±1 (flips under ψ_E(−1·) since χ₁(−1)=−1); z_φ=0 gives +1 | holds | none |
| 3.1 central-element identity | Fin 2→ZMod 2, χ=x₀+x₁, d=(1,1); d=(2) | z_d=(1,1), χ(z_d)=0=1+1; z_d=0 while e₀≠0 | holds | none |
| 3.2 change of ψ_E | dim(2,1), t nonnorm | V generator ×det(χ⊗1)(t)=η(t)=−1; W label ×det(1⊗φ_V)(t)=η(t)²=1 | holds | none |
| 3.4 Δ and c_θ | W=ℂ, x=−1; x=1; compact U(2)×U(1) at x=1 | |N_{ℂ/ℝ}(det(1−x)|_{im})|=|N(2)|=4 (reciprocal 1/4 wrong); zero moving space: 1; Nil_reg(g_x)=∅ so c_θ(1)=0 | holds (bp-arch (11.2.1), Prop 4.5.1(i)) | none |
| 3.6 Fourier identity | μ=−ε; μ=ε at (0,0); A=ℤ/2 values (1,−1) | (1+με)/2=0; 1; inversion gives the delta at the nontrivial character | holds (bp-refined (1), line 2888) | none |
| 3.7 uniqueness over pure inner forms | bp-refined 8.5.1 hypotheses d even, d′ odd | one pair with m=1 iff ε(φ⊗φ′)=μ(G) on that form; ε(z_φ)=μ(V,h) picks the form | holds | none |
| 3.8 induction counts | (a,b)=(2,1) | a≡n+1, b≡n mod 2 so a+b odd; first step (1,1), second (b,a−2)=(1,0); π₀ count 0, σ₀ count 1 | holds (xue-real line 288–292) | none |
| 3.8 splitting characters | equal rank; n±1; complementary line | (μ^n,μ^n); (μ^n,μ^{n+(−1)^n}); (μ^n,μ^{(−1)^n}) | matches xue-real line 895–900 | none |
| 3.8 integrated seesaw form | U(0); n=1 weights k,k,conj k; π′ weight k+1 | F(1,1)=1; integrand 1, scaling i / −i; integrand h, integral 0 | holds | none |
| 3.8 non-example | V=⟨−1,−1⟩, W=⟨−1⟩, π std, σ weight 1 | a=2 (two distinct odd characters), b=1; tensor weights 2,1: m=0 | holds (m=1 fails with wrong enhancements) | none |
| 3.9 interlacing | U(2) weight (1,0), U(1) weight −1 / 1 | σ∨=1∈{1,0}: m=1; σ∨=−1∉: m=0 | holds | none |
| 3.10/3.11 split cases | GL₁×GL₀; regular GL₃ principal series | Hom_1(ℂ,ℂ) dim 1; Hom_N(π,1) dim 3!=6, Whittaker dim 1 | holds (BZ 2.12) | none |
| 3.11 real r=1 character | basis (v,w,e₀,v*), N with coordinates a,x,z,b,y | b(u)=(x,−y) by the J-conjugation computation; a,b,z killed | holds | none |
| 4.1 period covariance | ν(h)=i | ×i; weighted by ν gives ×(−i) | holds | none |
| 4.2 factorization scalars | ℓ_v=2, ℓ_w=3; reference vector ×a | P ×6; ℓ_v/a and P(f⁰)·a | holds | none |
| 4.3 dim R | ranks (2,1); b=0 | 2ab=4; 0 and L=1 | holds | none |
| 4.4 character translation | line ⟨2⟩→⟨1⟩ by scaling 1/2; ν(h)=i | ψ_{B_h}=ν⁻¹=−i; both integrands carry −i (bpc-bessel line 262–265) | holds | none |
| 5.1 Δ_{n+1} | n=1; split place | L(1,η)L(2,1); ∏ζ_v(i), i=1,2, finite for q_v>1 | holds | none |
| 5.1a rescaling | dt→2dt | raw period ×2, λ fixed | holds | none |
| 5.2 normalized form | U(1) mass a, inverse weights, B(1,1)=1 | α(1,1)=a/C_v=q(1); q(cx)=q(x) | holds | none |
| 5.3 split ℚ₂, n=1 | π_V=Ind(1⊠ω), ω(2)=−1, π_W=1, vol(ℤ₂×)=1 | L(1/2,π_V×1)=(1−1/2)⁻¹=2; Δ₂=2·4/3=8/3; L(1,Ad)=(16/9)(2)=32/9; C=(8/3)·4/(32/9)=3; Macdonald: Φ(2^k)=2^{−k/2}(1+(−1)^k)/2; raw=1+2Σ2^{−m}=3; α=1=vol(K_W) | holds | none |
| 5.3 unramified E/ℚ₂, n=1 | W=⟨1⟩, V=⟨1,1⟩, σ_W=1, Satake (t,t⁻¹) | Δ₂=(2/3)(4/3)=8/9; As⁺ at inert place gives L(1,σ_V,Ad)=(4/3)L_E(1/2,BC σ_V×1), L(1,1_{U(1)},Ad)=L(1,η)=2/3: product (8/9)L_E; C=1; compact H mass 1: raw=1=α | holds | none |
| 5.3 non-example | ℚ₂ split, St_{GL₂}, conductor-4 character | no GL₂(ℤ₂)-fixed and no ℤ₂×-fixed vector | holds | none |
| 5.4/5.5 | B_v→2B_v; Haar 2,1/2; one q_v=0; good place of volume 2 | q_v fixed; product ×1; product 0; both sides ×2 | holds | none |
| 6.1 Asai signs | n=1 | β uses As^{(−1)^{n+1}}=As⁺ on Π₁, As^{(−1)^n}=As⁻ on Π₂ (bpcz line 4137) | holds | none |
| 6.2 relative character | one-dimensional realization; basis vector ce | σ(f)|P(e)|²/⟨e,e⟩; numerator and norm ×|c|² | holds | none |
| 6.2 local spherical projector | f_v=1_{K_G}/vol(K_G), unit x | σ_v(f_v)=T_{x,x}; J=∫_H B(σ(t)x,x)dt=C_vα_v(x,x) | holds | none |
| 6.3 sign group order | I,J with #I+#J=2,3,0 | Nat.card_fun/Nat.card_sum: 2^{#I+#J}=4,8,1; dim a_P=r_n+r_{n+1} | holds (bpcz line 4945) | none |
| 6.4/6.5 | three constituents; counts (2,1) | I_Π/8; |S_Π|⁻¹=1/8; ∏κ_v=1 | holds | none |
| 7.1/7.2 ranges | n=1; n>1 | bpcz 1.1.5.1 fixes n≥1; bplzz 1.8 requires n>1 | holds | none |
| 7.3/7.4 | counts (1,1),(2,1); central value 0 | 1/4, 1/8; right side 0 with every local factor defined, so every period is 0 | holds | none |
| Headline statability | each headline of line 549–555 | no carrier at the pins for smooth/admissible or Casselman–Wallach representations, arbitrary-form U(h), parameters, adelic periods | docstring correct | none |

**Settled findings.** The board's repair reports mark one finding `not actionable in this package` (F04: successor scope and ownership of Part II require a board decision). I do not re-raise it.

**Ownership against open pull requests** was checked with `roadmaps grep` over the 424 open heads listed in the index of 2026-10-30 and the sibling checkouts named in the brief.

## Not verifiable

- xue-real (3.12) and (3.14), p. 1010: whether the epsilon factor is taken against ψ_ℂ or its conjugate, and χ_V or χ_V⁻¹. The cached extraction and a layout extraction of the PDF page both lose the symbol font, so the bars cannot be read; the README and gap:real-small-theta write ε(φ_i⊗χ_V⁻¹, conj(ψ_ℂ)). This only affects the label transport inside the declared gap and §3.8's restatement of it, not a theorem this roadmap proves independently of that gap.
- xue-bessel: waived in the manifest; cited by locator only.

## Source issues

- none
