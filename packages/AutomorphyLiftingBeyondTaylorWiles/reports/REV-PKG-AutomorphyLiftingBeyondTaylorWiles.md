<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/999#issuecomment-6375805406 -->
Review (claude) of 71a36b3

Verdict: needs changes

1. **F01** (P2) `gap:localized-orbifold-perfect-duality` bundles three contracts for two consumers

   - **Location.** `packages/AutomorphyLiftingBeyondTaylorWiles/README.md` line 49 (same text in the plan's `gaps`): "establish … the localized finite-coefficient bound 0≤i≤dim Y and adjoint finite-level duality, and prove that a uniform finite-coefficient range and boundary vanishing … yields perfect equivariant models".
   - **Claim.** One declared supplier contract.
   - **Witness.** §2.8 (line 880, Needs line 897) consumes only the degree bound and the duality ("supplied independently of B^van(a) by the localized-orbifold contract"); §4.1 (line 1142) consumes only the perfect models ("Apply the localized perfect-model contract to the p-group cover"). Two independent theorems with different consumers sit under one slug: a compound `needs`.
   - **Repair.** Replace the slug by two package-stage gaps, supplier ArithmeticLocallySymmetricSpaces: `gap:localized-orbifold-range-duality` (section ALS.5a.6; needs: for Res PGLₙ groupoid quotients at standing big-image non-Eisenstein ideals, including p-torsion stabilizers, prove H^i(Y(K), O/ϖᵃ)_m = 0 outside 0 ≤ i ≤ dim Y and adjoint finite-level duality at m, without assuming B^van(a)); and `gap:localized-orbifold-perfect-models` (section ALS.1.6; needs: given finite-coefficient vanishing outside [q₀, q₀+ℓ₀] and boundary vanishing at m on every intermediate cover of a finite abelian p-group cover, prove that the localized cochains are a perfect O[Δ]-complex compatible with coefficient change, including p-torsion stabilizers). Put both in the ArithmeticLocallySymmetricSpaces contract paragraph (line 49) and in the plan's `gaps`; §2.8 Needs (line 897) names the first, §4.1 Needs (line 1142) the second. Tested on the witness: each consumer then names exactly one slug, and that slug's `needs` is exactly its input.

2. **F02** (P3) `gap:simultaneous-orbifold-hecke-finiteness` asks again for the local-factor decomposition

   - **Location.** README line 57: "… and identify its completed local factors with their compatible actions on all finite O-coefficient modules."
   - **Witness.** IntegralHeckeAndGaloisDeterminants §2.2 ("Finite local factors": a finite commutative algebra over a complete Noetherian local ring is a finite product of complete local factors; "Specified idempotent summands") supplies this, and README §0.3 Needs (line 265) already cites §2.2 for it.
   - **Repair.** End the `needs` after the finiteness clause and the coefficient clause: "…including stabilizer cohomology, and prove that this image acts compatibly on cohomology with every finite O-module coefficient." Keep IntegralHeckeAndGaloisDeterminants §2.2 for the local factors. Not raised as P2: only a sub-clause overlaps; the core contract (finiteness at orbifold levels over all coefficients) is not provided anywhere.

3. **F03** (P3) Relation to ModularityAndLanglandsExtensions §§2.7–2.8 misdescribed

   - **Location.** README line 13: "This roadmap consumes those statements: its hypothesis package strengthens §2.7 …"; line 1415 (§5.8 Needs) lists ModularityAndLanglandsExtensions §§2.7–2.8.
   - **Witness.** ModularityAndLanglandsExtensions §2.7 (open head) defines its Conjecture B "for the `GL_n` locally symmetric spaces", whereas Layer 2 here is for Res_{F/ℚ}PGLₙ (Conventions; CG18 line 4579), so it is not a strengthening of §2.7. No target uses the §2.8 endpoint: §5.8 proves the deduction itself. And §2.8 there says of the Theorem 9.19 verifications: "These arithmetic verifications are owned here", overlapping Layers 4–5.
   - **Repair.** In Scope, replace the sentence by: "ModularityAndLanglandsExtensions §2.7 states a GLₙ form of Conjecture B and §2.8 the conditional endpoint. Layer 2 states the Res PGLₙ package of CG18 §9 independently, adding all intermediate covers and the inertia–diamond clause; §5.8 is a kept variant of §2.8 under that package, with balanced oddness and the split ramification set. The CG18 §9.5 patching verification and Theorem 9.19 are owned here." Remove ModularityAndLanglandsExtensions §§2.7–2.8 from §5.8's Needs (line 1415), since neither statement nor route uses them. The ownership reasoning is under "Duplication and ownership".

4. **F04** (P3) Design labels and supplier labels that exist nowhere

   - **Location.** Line 7 "its PA.3–PA.4 argument"; line 65 "rather than a nonexistent global §R04.2"; lines 381, 637, 679 "BT.0", "BT.5"; line 529 "its rank-n supplier contract/taylor-wiles-inertia-action"; line 651 "agrees with IHG's the supplied absolute-irreducibility predicate"; line 882 "enter through U.4/cg-localized-h1-vanishing"; line 1251 "requested from DeformationAndDerivedPatchingAlgebra P8"; line 1342 "so the node applies to r^∨".
   - **Witness.** PotentialAutomorphyInfrastructure (open head) has no PA.n labels; its relevant layers are "Layer 3: Ordinary cohomology and compatibility" to "Layer 5: Arithmetic patching and automorphy lifting". DeformationAndDerivedPatchingAlgebra has no "P8", KTheoryLowDegrees no "U.4". BT.n are the design's names for this roadmap's layers.
   - **Repair.** Line 7: "PotentialAutomorphyInfrastructure Layers 3–5". Line 65: delete the "rather than …" clause. BT.0 → "§0.1"; BT.5 → "Layer 5". Line 529: "GlobalGaloisDeformations §§5.5–5.8 and gap:big-image-rank-n-taylor-wiles". Line 651: "agrees with the absolute-irreducibility predicate of IntegralHeckeAndGaloisDeterminants §3b.1". Line 882: "enter through ArithmeticLocallySymmetricSpaces gap:congruence-character-localized-h1". Line 1251: "requested from DeformationAndDerivedPatchingAlgebra §8.6 as gap:paired-cohomology-action-patching". Line 1342: "node" → "statement".

5. **F05** (P3) Roadmaps named as owners or consumers that exist nowhere

   - **Location.** Line 15: "Coherent-cohomology patching belongs to IntegralCoherentHeckeComplexes; defect-one GL₂ applications belong to GL2ModularityLiftingDefectOne." Line 1471 names AdjointSelmerGroupsFromModularityLifting, GL2ModularityLiftingDefectOne and GL2ModularityLiftingPositiveDefect as consumers.
   - **Witness.** None of the four is on main, in the open-roadmap index (331 pull requests), in the board-packages index or board checkout, or in any board job issue (searched by name). The board package GL2ModularityLiftingPartII (design README line 7) records GL2ModularityLiftingDefectOne as an alias of its canonical id GL2ModularityLiftingPartII.
   - **Repair.** Write GL2ModularityLiftingPartII for GL2ModularityLiftingDefectOne. For the other three, either name an existing owner, or (Scope) say that coherent-cohomology patching is outside this roadmap without naming a roadmap, and (Downstream consumers) describe the applications (CGH20 Theorem 1.2; positive-defect GL₂ lifting) without roadmap names.

6. **F06** (P3) Layer 3 inputs: ModularCurvesPartII §15.4 is narrower than used; structure theorem uncited

   - **Location.** Line 93: "Its group-cohomological theorem is used with the actual amalgam …"; line 1030 (§3.4 Needs) "ModularCurvesPartII §15.4"; line 937: "Serre's structure theorem for groups acting on trees with an edge as quotient gives the amalgam."
   - **Witness.** ModularCurvesPartII §15.4 (open head) is stated "For the actual amalgam G=G₁*_{H}G₂ of §15.2", the principal-level Γ_N(ℤ[1/p]) amalgam over ℚ; the number-field amalgam of §3.2 lies outside it. The structure theorem is FreeGroupsAndLimitGroups §4.8 (with §4.5 for one-edge amalgams), on main; no owner is named.
   - **Repair.** §3.2 Needs: add "FreeGroupsAndLimitGroups §§4.5 and 4.8". §3.4: derive the sequence for the §3.2 amalgam from the exact cellular chain complex of the tree (ReductiveGroupsPartII RG2.2.4) and Mathlib's Shapiro isomorphism `groupCohomology.coindIso` (`Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean`, line 58), and cite ModularCurvesPartII §15.4 only for the ℚ case (lines 93 and 1030). The statement of §3.4 is already a target here, so nothing becomes unowned.

7. **F07** (P3) Bare section references that point to the wrong section; garbled text

   - **Location and witness.** Line 227 "(§2.1 …)", "(§2.2)" and line 273 "By §2.3": these mean IntegralHeckeAndGaloisDeterminants §§2.1–2.3, but this README's §§2.1–2.3 are Conjecture B clauses. Line 1106 "§2.3, §2.3". Line 1360: "(§5.5)", "(§5.3)" mean AutomorphicFormsOnReductiveGroups §§5.5, 5.3 (own §5.5 is R = T), and "Tau Ceti Chebotarev layer 10" means TauCetiRoadmap.Chebotarev Layer 10. Line 1381: "(§5.5, §5.3)", same. Lines 1255 and 1445: "(§9.2)" means DeformationAndDerivedPatchingAlgebra §9.2. Line 1443: "by (5)" means §1.1(f). Line 1445: "(§5.3)" means AutomorphicFormsOnReductiveGroups §5.3. Garbled: line 493 "GlobalGaloisDeformations GlobalGaloisDeformations §3.3"; line 1273 doubled roadmap name; line 1338 "(DeformationAndDerivedPatchingAlgebra §6.4, DeformationAndDerivedPatchingAlgebra §6.4)"; line 677 "allowed). the strengthened"; line 1294 "module. the special-fibre".
   - **Repair.** Prefix each reference with its roadmap name (line 1106: "IntegralHeckeAndGaloisDeterminants §2.3"), remove the duplicates and capitalize the two sentence starts.

8. **F08** (P3) Locator drift (pages right, lines or section labels wrong)

   - Line 895: "CG18, §5.2, Lemma 5.9(1), … CG18 line 3185". Lemma 5.9 is in §5.3.1 at CG18 line 3235 (p. 376); line 3185 is the start of §5.3.1 on p. 375.
   - Line 715: Conjecture A(3) cited at CG18 line 3130, which is Definition 5.4. Conjecture A starts at CG18 line 3145 and clause (3) is at line 3156.
   - Line 1350: Theorem 6.4(1) cited at CG18 line 3600, the start of §6.1 on p. 386. The theorem is CG18 lines 3728–3730 (p. 389).
   - Line 1328: the statement of Theorem 9.19 is CG18 line 5166 (p. 426); line 5228 is the end of its proof.
   - Line 217: CGH20 line 199 is inside the proof of Lemma 3.1. The Hecke algebra the section relies on is defined at CGH20 lines 178–185.
   - **Repair.** Replace the five line locators (and "§5.2" by "§5.3.1") as listed.

9. **F09** (P3) `sources.toml`: KT17 `cited_for` is truncated

   - **Location.** `packages/AutomorphyLiftingBeyondTaylorWiles/sources.toml`, KT17 entry: `cited_for = ["Sections "]`.
   - **Witness.** The README cites KT17 in §3.6, §3.7 and References.
   - **Repair.** `cited_for = ["Sections 3.6, 3.7"]` (the author's fix; the review does not rewrite author entries).

10. **F10** (P3) A §0.6 Check overstates the source

   - **Location.** Line 363: "It is not preserved by cyclic base change in general (CG18, remark after Theorem 5.16)."
   - **Witness.** CG18 lines 3538–3539 say only that condition 8b is not obviously preserved under cyclic base change.
   - **Repair.** "It is not known to be preserved by cyclic base change (CG18, remark after Theorem 5.16)." §0.6 keeps six other Checks.

11. **F11** (P3) §3.7 states its hypothesis only by analogy

   - **Location.** Line 1076: "assuming the corresponding localized smooth PGLₙ block condition and compatibility at the auxiliary places".
   - **Witness.** §3.6 (line 1056) names the module, the group and the block. §3.7 names none of them, so its hypothesis cannot be checked.
   - **Repair.** State: "for each x ∈ Q, every j and every b ≥ 1, the smooth PGLₙ(F_x)-module colim_a H^j(Y(x^a), O/ϖᵇ)_{m_∅} is locally admissible and each of its irreducible subquotients is the unramified principal series with trivial central character attached to r̄|G_x."

12. **F12** (P3) Notation slips

   - Line 1056 (§3.6): the coefficients O/ϖ^n use n, which is also the rank. Write O/ϖᵇ.
   - Line 761 (§2.4): B^tw uses Q_x(V_x) with Q_x ∈ k[X], but §0.4 builds e_Q from a lift Q̃_x ∈ O[X]. Write Q̃_x.
   - Line 1102 (§4.1(3)): D̃_N is compared with E_{Q_N}H, but D̃^χ_N with e_{Q_N}H. Both need the selected-factor projection E_{Q_N}.

13. **F13** (P3) The duality isomorphism carries an unneeded boundary hypothesis

   - **Location.** Line 313 (§0.5(3)): "Under B(4)(b) at m, H^*_χ(Y(K), O/ϖ^m)^∨_m ≅ `H_{*,chi^{-1}}(Y(K), O/varpi^m)_{m^*}`". Line 737 (§2.3 interface): "Under (b), …".
   - **Witness.** O/ϖᵃ is self-injective, so universal coefficients give H^i(Γ, O(χ)/ϖᵃ)^∨ ≅ H_i(Γ, O(χ⁻¹)/ϖᵃ) in each degree, with Hecke operators transposed (m ↦ m^*). At level one over ℚ with p > 3 and the Eisenstein ideal, boundary cohomology is nonzero at m, yet H⁰(Y,k)_m = k and H₀(Y,k)_{m^*} = k agree.
   - **Repair.** Drop "Under B(4)(b) at m" and "Under (b)" from these two isomorphisms and cite Pontryagin duality over O/ϖᵃ (universal coefficients); keep B(4)(b) for H_c ≅ H after localization.

Thirteen findings, one blocking (R01, P2). The mathematics of the README survived a computed adversarial pass (table below); every one of the 15 sampled locators supports its statement. The empty `Suggested.lean` is justified headline by headline: no headline is statable on the pinned carriers (section "Headline theorems" below), and the file elaborates with no messages. The blocking item is a compound supplier-gap contract.

## Verified sound

### Principles

- **Generality.** Arbitrary number fields are retained. The split R = R_triv ⊔ R_reg is a forced correction, not a shortcut: the README's own negative control (§1.3) and a source error (CG18 Lemma 8.2; Source issues) show the unsplit statement fails.
- **No re-planning.** Supplier roadmaps are cited by section. The overlap with ModularityAndLanglandsExtensions concerns a proof-route claim there, not a target (R03).
- **Supply direction.** Single direction, checked by the depcheck below.
- **Own words.** No copied passages found. Spot-checked §§0.3, 1.4, 3.5 and 4.2 against CG18 lines 3928, 4453–4463, 4782–4874 and 5168–5208: short technical phrases only.
- **No algorithms.** The only construction (distinct χ in §5.8) is a two-line mathematical choice.
- **Lean form.** No sorry'd data, no `set_option`, single `import Mathlib`.

### Sources: the seeded sample (15 targets; no locator is flagged unverified in the package)

| Target | Locator checked | Result |
|---|---|---|
| 0.2 | CG18 §9.2 (lines 4628–4648, pp. 412–413); deck coordinate against §9.1(2) (lines 4596–4607); Conj. B(5) (line 4710); §9.5 (line 5118) | Supported. det(B)a^{1−n} matches the explicit (1 ∗; 0 GL)/(1 ∗; 0 SL) form. The unnormalized choice is forced: the source's normalized T_{a,k} gives the wrong determinant (Source issues). CGH20 line drift is R08. |
| 0.3 | Def. 9.1 and Rem. 9.2 (lines 4650–4680); finite, not flat (line 4683); §7.1 (line 3928, p. 394) | Supported. The intermediate-level extension is a declared modification. |
| 1.1 | §8.5 (lines 4395–4421); Lemma 8.2 (line 4440); CGH20 §4(2)(a) (line 293, p. 7) | Supported with the declared correction (triviality at R_triv, no congruence on R_reg = CGH20 Theorem 1.2). |
| 1.4 | §8.5.1–8.5.2 (lines 4453–4480) | D_x, S_Q and representability verbatim in content. |
| 1.5 | Lemma 8.3 (line 4494, p. 409); Prop. 8.4 (lines 4521–4539, p. 410) | All three formulas agree term by term. |
| 1.7 | Thm 5.16(1),(2),(6),(7) (lines 3502–3515, p. 383); §9.5 (line 5105) | Supported. |
| 2.2 | Conj. B(1)–(3) (lines 4700–4705, p. 414); Conj. A(3) (lines 3156–3165, pp. 374–375) | Supported. Clause (6) is a declared addition. Line drift is R08. |
| 2.3 | Conj. B(4) (lines 4706–4709); §8.4 (lines 4359–4369) | Supported. d and ℓ₀ agree with line 4361. |
| 2.8 | Rem. 9.3 (lines 4744–4754, p. 415); Lemma 5.9(1) (line 3235, p. 376) | Supported. The README correctly reads the misprinted H_c^{q₀−1} as degree d−1 (Source issues). Section and line drift is R08. |
| 3.5 | Lemma 9.6 and proof (lines 4782–4874, pp. 416–418); Rems. 9.7–9.8 (lines 4875–4896) | Supported. The Gram matrix and determinant match line 4790. The README's N(x)^{−2} and its localization at m̃ correct the source (Source issues). |
| 3.6 | §9.4.1–9.4.2 (lines 4897–5104, pp. 419–424); CGH20 Thm 3.2 proof (line 230, p. 6) | Supported. The spectral sequences and conclusion match lines 5098–5103. |
| 4.2 | Thm 9.19 proof (lines 5168–5208, pp. 426–427) | Supported. The reflection T^c = H^{q₀+ℓ₀−c} corrects the source's T^i = H^{i−ℓ₀} (Source issues). Compatible surjections mod ϖ are made explicit. |
| 5.4 | Thm 9.19 (line 5166, p. 426) and §9.5 standing assumptions (lines 5111–5115) | Supported, with the declared strengthened hypotheses. |
| 5.5 | Thm 6.4(1) (line 3730, p. 389); CGH20 §4 (lines 308–316, p. 8) | Supported. Smoothness of R^1_loc when R_triv = ∅ is §1.2(iii). |
| 5.7 | Thm 5.16(8a)–(8b) (lines 3516–3525, pp. 383–384); §9.5 (line 5111) | Supported as a declared reformulation of (8a). |

KT17 Lemma 6.25 (line 1893, p. 41) was also read: it treats GLₙ at Iwahori level with ordinary completed cohomology, as the README says.

### Adversarial pass (computed values; README side = my computation unless marked)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: (d,q₀,ℓ₀) | ℚ,n=2; imag. quad.; real quad.; PGL₃/ℚ; CM quartic n=2 | (2,1,0); (3,1,1); (4,2,0); (5,2,1); (6,2,2). d−ℓ₀ per real place = 2,4,8,12 for n=2..5, all even. | holds | none |
| Conventions: Frobenius/Satake | N(v)=7, trace 3 | arithmetic X²−3X+7; geometric trace 3/7, det 1/7; Satake product 1 ⇒ det 7 | holds | none |
| Conventions/§1.1(f): balanced oddness | n=2,p=3,c=1; general n,p>n | trace 2≡−1 but dims (2,0). Trace ∈{0,±1} with \|a−b\|>1 iff n even, p=n+1, c=±1. | exception stated exactly | none |
| Conventions: dual pairing | χ(g)=ζₚ | ζₚ·ζₚ⁻¹=1; χ both sides gives ζₚ²≠1 for odd p | holds | none |
| §0.1 O(ψ) | n=2, θ of order 3 (p=3) | (θ,θ⁻¹) on a scalar: 1 (descends); (θ,1): θ(a)≠1. N(v)≢1 ⇒ \|k_v^×\| prime to p ⇒ ψ trivial. | holds | none |
| §0.2 deck coordinate | n=3; p>n | det(cB)(ca)^{−2}=1; diag(u,1,1)↦u^{−2}; p∤(n−1) since 0<n−1<p, so T_{α,1} exhaust the p-part | holds | none |
| §0.2/§2.1 normalization | n=2, N=2, char 7 | unnormalized det N=2; normalized N^{n(n−3)/2}=2^{−1}=4 | Check correct | none |
| §0.3 Hecke algebra | ℚ, n=2, level 1, p>3; O→ϖO | H¹(PSL₂ℤ,O/ϖᵐ)=Hom(ℤ/6,·)=0; T_λ on H⁰ = λ+1 ⇒ T^an=O. Residual H⁰ of O→ϖO with O/ϖᵃ coefficients ≅ k. | holds | none |
| §0.4 projector | V=diag(α̃,β̃); p=7, roots 2,4, extra line V=1 | (V−β̃)^{k!}→diag(1,0). V−4 acts by −2 (unit), 0, −3 (unit), so the V=1 line is kept and the explicit m_Q projection is needed. Double root ⇒ kills. | holds | none |
| §0.5 residual independence | χ ≡ 1 mod ϖ | O(χ)/ϖ=k; (3) also holds without B(4)(b) | true, extra hypothesis | R13 |
| §0.6 minimal level | r̄ unramified; 1⊕ε̄ | level K_∅(∅); reducible excluded | holds; base-change Check overstated | R10 |
| §1.1 standing datum | E[p], multiplicative v, p∤v(Δ); unramified non-scalar v | single unipotent block ⇒ R_reg with no congruence; non-scalar unramified v fits neither | holds | none |
| §1.2 local rings | n=2, q=7, p=3, A=ℤ₃⟦X⟧[a]/(a²,6a) | det Φ=7, det Σ=1, Σ⁷=Σ, 6·tr=0; mod 3: tr(Φ(Σ−1))=a(2X+X²)/(1+X)≠0. Universal: ΦNΦ⁻¹=qN ⇒ (q−1)tr(ΦN)=0. | p-torsion confirmed | none |
| §1.3 corrected Lemma 8.2 | dimension sum; unramified distinct-eigenvalue v, χ₂=χ₁⁻¹ | Σ_{v\|p}(n²−1+[F_v:ℚₚ]n(n−1)/2)+\|R\|(n²−1)+1 matches. Lifts ψ₁⊕ψ₂ with inertia (χ₁,χ₂) or (χ₂,χ₁): two disjoint char-0 components. | holds; negative control valid | none |
| §1.4 inertia coordinate | n=3, p=5, Δ=C₅ | 1−n≡3, inverse 2; deck d³ acts by θ(d)⁶=θ(d); direct θ gives θ³ | holds | none |
| §1.5 presentation | Greenberg–Wiles terms; n=2, \|T\|=1,2 | T: −h⁰; Q: dim L−h⁰; ∞: −h⁰ (L=0, p odd), as CG18 line 4527; framing 3, 7 | holds | none |
| §1.6 numerical coincidence | real balanced n=2..5; complex; imag. quad. n=2, \|T\|=1, q=3 | a²+b²−1 = 1,4,7,12 = n(n−1)/2+⌊(n−1)/2⌋; complex n²−1. g=q+\|T\|−1−[F:ℚ]n(n−1)/2−ℓ₀; g=0, dim R=6=1+3+3−1. g≥0 once dual Selmer vanishes (g is a tangent dimension). | holds | none |
| §1.7 point x_r | O⟦X⟧→O′, X↦0 | image O ≠ O′ | holds | none |
| §1.8 GL₁ | ℚ; imag. quad.; real quad.; C₃ | ℓ₀ = 0, 0, 1; 𝔽₃[C₃]=𝔽₃[t]/(t−1)³; components (S¹)^{r₁+r₂−1} as CG18 lines 4257–4267 | holds | none |
| §2.1 B^gal | 1⊕ε̄ at level 1 | X²−(1+λ)X+λ = formula with T_{λ,2}=1 | holds | none |
| §2.2 B^lgc clause (6) | n=3, p=5 | ⟨δ⟩↦θ(δ^{b}) agrees with §0.2 and §1.4 | consistent | none |
| §2.3 B^van | imag. quad.; PGL₃/ℚ; intermediate covers | ranges {1,2}, {2,3}. Lower vanishing passes up Hochschild–Serre, upper does not, so "every K′" is a real strengthening. | holds | none |
| §2.4 B^tw | n=2 | old V_x eigenvalues α,β on H(Y)²; e_Q keeps α | holds; Q_x vs Q̃_x slip | R12 |
| §2.5 bundle | Q=∅; Eisenstein, level 1 over ℚ | B^tw trivial; H⁰(Y,k)_m=k breaks B^van(a) | holds | none |
| §2.6 dévissage | O→ϖO; k→O/ϖ²→k | integral H⁰=0, residual k; five lemma needs all degrees | holds | none |
| §2.7 R ↠ T | generators T_{α,k}, α=ϖ_λ^a·u | spherical part is a polynomial in T_{λ,i}; units at Q give diamonds; global units act trivially ⇒ image needs clause (6) | holds | none |
| §2.8 small rank | PGL₃/ℚ; CM quartic | excluded degrees {0,1,4,5}, {0,1,5,6}; d−1 = 4, 5 ≠ q₀−1 = 1. PGL₃(ℝ)≅SL₃(ℝ) and PGL₂(ℂ) connected. ζₚ∈F forces p ramified, so p∤#μ(F). | holds | gap split, R01 |
| §3.1 PSL₂ reduction | C₂, k=𝔽₃ and 𝔽₂ | (a,b)↦((a+b)/2,(a+b)/2); H¹(C₂,𝔽₂)=𝔽₂ | holds | none |
| §3.2 amalgam | h=diag(1,π) | hγh⁻¹=(a, b/π; cπ, d); Γ¹∩hΓ¹h⁻¹ = {c≡0 mod π} = Γ¹₀(x); index N(x)+1 | holds; structure theorem uncited | R06 |
| §3.3 U_{x²} | N(x)=7, p=3, ℤ/9 | N⁻²=49⁻¹≡4⁻¹≡7≠1; V_x²=N²U_{x²} | holds | none |
| §3.4 Lyndon/tree map | general q; q=7 mod 9 | ∂(edge sum)=A₂(b)−A₁(a)+b−qA₁(b)+qa=F(b)−F(a); augmentations 1, 1; normalized 7, 7, 49·7≡1 | holds | supplier scope, R06 |
| §3.5 Lemma 9.6 | p=7, N=29, roots 2,4; roots 1,1 | Gram det 4−36≡3, α²−1=3 (units); repeated root: 0, 0 | holds | none |
| §3.6 GLₙ comparison | n=2 | needs α≠β; matches CG18 lines 5094–5103 | holds | O/ϖⁿ slip, R12 |
| §3.7 PGLₙ descent | n=3, p=7, roots 1,2,4; central Cₚ | 1·2·4=8≡1; H¹(Cₚ,k)=k ≠ 0, so descent is not formal | statement loose | R11 |
| §4.1 minimal complexes | k→0→k; O→1→O; ℓ₀=0 | ranks (1,1); disk deleted; single free module | holds | e vs E slip, R12 |
| §4.2 patching data | (q₀,ℓ₀)=(1,1) | reflection: T⁰=H²∨, T¹=H¹∨; source formula gives T⁰=0, T¹=H⁰∨; dim R∞=1+q+j−ℓ₀ | holds | none |
| §4.3 comparisons mod ϖ | universal coefficients | 0→H^{q₀−1}(E/O)/ϖ→H^{q₀}(k)→H^{q₀}(E/O)[ϖ]→0, left term 0 by B^van(a) | holds | none |
| §4.4 hypotheses | O⟦z⟧/(ϖ²,z²,ϖz) | ≅ O/ϖ²⊕(O/ϖ)z as O-module; kernel ker φ_M as DeformationAndDerivedPatchingAlgebra §8.6 | holds | none |
| §5.1 patched complexes | dims | dim S□∞=1+q+j, dim R∞ = that −ℓ₀ ⇒ codimension ≥ ℓ₀ | holds | none |
| §5.2 near faithfulness | k[ε]/ε², M=k | depth 0 = dim; annihilator (ε) nilpotent, not faithful | holds | none |
| §5.3 transfer | O⟦x,y⟧/(xy), M=A/(x) | ϖ regular on M but M/ϖ misses V(y): the lifting hypothesis is needed | holds | none |
| §5.4 Theorem 9.19 | O[ε]/ε², M=O | annihilator nilpotent; A→O not injective | holds | none |
| §5.5 R = T | R_triv=∅; R^a | R^1_loc smooth (§1.2); Ann R^a = 0 iff a≥1 | holds | none |
| §5.6 cuspidal recognition | Speh(σ,2), n=4, N(λ)≡1 | residual roots (a,a,b,b): no simple eigenvalue, excluded by bigness | holds | none |
| §5.7 maximal ideal | lattice O^a | reduction has dimension a; m stays in the support | holds | none |
| §5.8 deduction | p=5, n=3, C₅; n=2 | exponents 0,1,2 shifted by −1 give −1,0,1 (sum 0, distinct); Euler factor 1−tT+N T² | holds | Needs edge, R03 |
| §5.9 imag. quad. | ℚ(i), q=3 | p=5 split, \|T\|=2, g=1; p=7 inert, \|T\|=1, g=0 | holds | none |
| §5.10 defect zero | real quad., \|T\|=1 | g=q−2, dim R∞=4+q; q₀=[F:ℚ] | holds | references, R07 |
| Library suppliers | 7 declarations | all present at the pins (below) | holds | none |

### Duplication and ownership (by object)

- **Pinned libraries.** Checked at the pins:
  - `Field.absoluteGaloisGroup`: `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean`, line 42.
  - `Representation`: `Mathlib/RepresentationTheory/Basic.lean`, line 48.
  - `IsHeckeTriple`, `HeckeCoset`, `HeckeRing`: `Mathlib/NumberTheory/HeckeRing/Defs.lean`, lines 75, 157, 189. That file carries no convolution product.
  - `Module.support_eq_zeroLocus`: `Mathlib/RingTheory/Support.lean`, line 216.
  - `TauCeti.MonoidAlgebra.augmentation`: `TauCeti/Algebra/MonoidAlgebra/Exactness.lean`, line 115.

  Neither library has Galois deformation rings, nearly faithful modules, Taylor–Wiles data or automorphic representations of GLₙ(𝔸_F). Searched for `Deformation`, `LiftingRing`, `NearlyFaithful`, `TaylorWiles` and automorphic-representation carriers. Tau Ceti's `NumberTheory/HeckeRing` has Hecke sums on invariants, not Hecke operators on higher cohomology of arithmetic groups.
- **Open roadmaps and main.** Searched with `roadmaps grep` over all 331 heads and main for "Lemma 9.6", "Theorem 9.19", "Conjecture B", "Calegari–Geraghty", "Proposition 8.5", amalgams and Lyndon sequences. The relevant hits:
  - ArithmeticLocallySymmetricSpaces ALS.3.14 owns the degeneracy maps (cited).
  - ALS.5b.8 is CM-only, with Galois inputs, as the README says (read).
  - ModularCurvesPartII §§15.2–15.8 is over ℚ (R06).
  - GL2ModularityLifting and EllipticCurveModularityImaginaryQuadratic cite different works under "Lemma 9.6".
  - DeformationAndDerivedPatchingAlgebra §8.5 handles paired data only for the derived-action variant §8.4, so the paired cohomology-action gap is not provided.
  - DeformationAndDerivedPatchingAlgebra §4.6 needs O-flat reduced factors, so the literal-ring completed-product gap is not provided.
  - ArithmeticGaloisRepresentations §§7.9–7.12 define adequate and enormous images but not CHT bigness, so `gap:cht-big-image` is not provided.
  - GlobalGaloisDeformations §§5.1–5.8 are rank two, so the rank-n Taylor–Wiles gap is not provided.
- **Board packages.** Read at their current heads:
  - OrdinaryAutomorphicFormsAndModularityLiftingPartII: design README at its board pull request's head 7e88c38. It owns dyadic unitary and GSp₄ ordinary lifting (BCGP) and has no overlap.
  - PotentialAutomorphyInfrastructurePartII: board checkout. Its line 45 routes Calegari–Geraghty conditional GLₙ lifting to a separate Part II, consistent with this roadmap.
- **Why this roadmap owns its targets.** ModularityAndLanglandsExtensions §2.8 states only the conditional endpoint as a target. Its claim to own the Theorem 9.19 verification is a proof-route sentence, and that route cannot be carried out from its own §2.7: GLₙ, no intermediate covers, no diamond clause, while CG18's patching step (d) needs such a clause (Source issues). The accepted design routes CG18 Part 2 here. So Layers 4–5 and §5.4 are owned here, §5.8 is a kept variant, and the wording fix is R03.
- **Lean names.** `Suggested.lean` declares nothing, so no fully qualified name collides with a readable roadmap.

### Supplier order and declared gaps

Dependency check output (run on the README, merge order, `--movable`):

    depcheck: 28 roadmaps, 251 edges, 0 problem(s)

No UPWARD or CYCLE line. Every supplier (ArithmeticLocallySymmetricSpaces 79, IntegralHeckeAndGaloisDeterminants 31, LocalGaloisDeformationRings 89, GlobalGaloisDeformations 91, ArithmeticGaloisRepresentations 52, ArithmeticGaloisDuality 53, DeformationAndDerivedPatchingAlgebra 74, ReductiveGroupsPartII 25, ModularCurvesPartII 88, SmoothRepresentationsOfLocalGroups 28, AutomorphicFormsOnReductiveGroups 80, AutomorphicSpectralTheory 98, KTheoryLowDegrees 43, PadicHodgeTheory 142, AdelicAlgebraicGroups 38, ModularityAndLanglandsExtensions 254) precedes position 280. ClassFieldTheory and Chebotarev are on main.

Cited sections resolved at the open heads (headings read, statements read where load-bearing):

- ArithmeticLocallySymmetricSpaces: 41 sections.
- IntegralHeckeAndGaloisDeterminants: §§1.2, 1.3, 2.1–2.3, 3a.1, 3b.1, 3b.2. §3a.1 uses the same unnormalized polynomial.
- LocalGaloisDeformationRings: F.1–F.3, F.2.6, F.2.7, F.2.9, F.3.1, 1.6, 1.10, 1.13, 2.8, 2.10, 2.15, 2.16, 2.21, 2.23, 2.26. §2.15 is for trivial residual data, matching R_triv.
- GlobalGaloisDeformations: 3.3–3.7, 4.3, 4.4, 5.1, 5.5–5.8, 7.2–7.4.
- ArithmeticGaloisRepresentations: 7.2, 7.4, 7.7–7.12.
- ArithmeticGaloisDuality: R02.5.1, R02.5.2, R02.6.1, R02.6.2. R02.6.1 contains the balanced archimedean count.
- DeformationAndDerivedPatchingAlgebra: 1.12, 3.1–3.4, 3.10, 4.6, 6.1–6.8, 7.3, 7.6, 8.6, 9.1, 9.2.
- ReductiveGroupsPartII: RG2.2.4 "Ihara's theorem: SL₂ as an amalgam", with g = diag(1,ϖ).
- ModularCurvesPartII: 15.4, 15.8.
- SmoothRepresentationsOfLocalGroups: SR.5.3 and both named items.
- AutomorphicFormsOnReductiveGroups: Layers 4–6, 5.3, 5.5.
- AutomorphicSpectralTheory: 4.14a, 5.12–5.14.
- KTheoryLowDegrees: 11.6.
- PadicHodgeTheory: 6.1, 6.2.
- AdelicAlgebraicGroups: 4.2 (covers SL₂ at a split finite place) and 5.1; "Layer AA.5" is its Layer 5.
- ClassFieldTheory: Layers 7 and 11.
- Chebotarev: Layer 10.
- ModularityAndLanglandsExtensions: 2.7, 2.8.

Failures: PotentialAutomorphyInfrastructure "PA.3–PA.4" (R04); four non-supplier names (R05).

Declared gaps, nine in the plan. Eight appear in the README in the right supplier subsection, with identical `needs` text and identical supplier. All are precise and minimal except R01 (compound) and R02 (one sub-clause provided). `gap:res-pgl-distinct-eigenvalue-comparison` has no supplier in the plan, but its object is this roadmap's own target §3.7 (same groups, same norm and distinct-eigenvalue conditions, same two routes). So it is owned, not unowned; no target here depends on it (§5.4 assumes B^tw). It is therefore not raised as P1. R11 tightens §3.7's hypothesis.

### Shape and Lean form

- **README shape.** Matches the house shape: title, Summary, Scope, Conventions, Exact supplier contracts, How to read, Layers 0–5 with Examples and Dependencies, Downstream consumers, References. Of the 86 headings scanned, every subsection that carries Checks has at least three; no LaTeX delimiters; process residue is R04.
- **`Suggested.lean`.** Single `import Mathlib`, one module docstring titled "…: target signatures", namespace `TauCetiRoadmap.AutomorphyLiftingBeyondTaylorWiles`, no declarations, no `set_option`, 52 lines.
- **Elaboration.** `lake env lean` on the file, run from the content checkout: exit 0, no messages, 3.7 s. No `TauCeti.*` import needed building.
- **Mechanical checks.** The `#check @name` binder comparison and the one-tactic padding probe have nothing to run on (no declarations); stated, not skipped.

### Headline theorems (README Summary and Layers 4–5) and statability at the pins

| Headline | Statable? | Missing carrier at the pins |
|---|---|---|
| Corrected Lemma 8.2 (§1.3) | no | framed local Galois lifting rings and their literal character quotients; a functor-of-points encoding would be a long ad hoc encoding |
| Proposition 8.5 count (§1.6) | no | Selmer groups with Taylor–Wiles conditions and R^□_{S_Q}; the archimedean identity alone is ArithmeticGaloisDuality R02.6.1's and would be a stand-in |
| Lemma 9.6 (§3.5) | no | cohomology of Res PGL₂ arithmetic quotients with Hecke operators in all degrees (Tau Ceti's Hecke sums act on invariants only) |
| §3.6, §3.7 comparisons | no | arithmetic towers and smooth localized modules |
| Patched complexes (§5.1) | no | the arithmetic patching data |
| Theorem 9.19 (§5.4), R = T (§5.5) | no | R_S and the localized cohomology dual with its ring action |
| Cuspidal recognition (§5.6), support-to-eigenclass (§5.8) | no | automorphic representations of GLₙ(𝔸_F), cohomology eigenspaces |
| Applications (§§5.9–5.10) | no | as above, plus the conditional hypotheses |

Two non-headlines were considered. The §3.2 S-arithmetic amalgam is statable with `Monoid.PushoutI` and projective special linear groups, but it is a Layer-3 input, not a headline. The §1.8 GL₁ case is an illustration that the README itself calls circular. The module docstring names every headline in the table with its missing carrier. Nothing is padding.

## Not verifiable

- CGH20 published appendix numbering (A.2–A.4) and the page "published appendix p. 882" (README §2.1): the manifest records arXiv v1 only, and the Duke version was not opened (paywalled). The arXiv locators were verified.
- The 2022 published correction to CG18 (Invent. Math. 227, 855–856) is known here only through its description in DeformationAndDerivedPatchingAlgebra §8.6 (bracket typography). It is not cited by the README and was not read.
- Works cited inside CG18 (Taylor's Ihara-avoidance paper, CHT): not opened; the README routes them through LocalGaloisDeformationRings and ArithmeticGaloisRepresentations, whose statements were read.
- The truth of supplier statements (for example LocalGaloisDeformationRings §2.15 in fixed determinant): read as contracts, not re-proved.

## Source issues

- **Error** in CG18 at Lemma 8.2, p. 407: the source says both local rings are p-torsion free and Spec R^χ_loc is irreducible for R allowing places where r̄ is unramified or non-trivially unipotent; it should be r̄|G_v trivial at the character places, with only characteristic-zero minimal primes claimed for the literal unipotent ring (which has p-torsion); affects a stated result.
- **Error** in CG18 at proof of Theorem 9.19, p. 426: the source says each patched ring R^i_∞ is p-torsion free by Lemma 8.2; it should be only depth equal to dimension and characteristic-zero minimal primes, which suffice for the argument; affects the proof.
- **Misprint** in CG18 at §9.2 after Definition 9.1 and Conjecture B, pp. 413–414: the source says T_{a,k} carries the factor N(a)^{−k} and then uses T_{λ,i} with exponent i(i−1)/2; it should be the unnormalized double cosets, since normalized ones give determinant N^{n(n−1)/2−n}; affects a stated result.
- **Error** in CG18 at §8.4, equation (1), p. 406: the source says trace of complex conjugation in {−1,0,1} yields the archimedean adjoint sum; it should be balanced eigenspaces, since for n even and p = n+1 a scalar conjugation passes the trace test with larger h⁰; affects a stated result.
- **Misprint** in CG18 at Remark 9.3, p. 415: the source says duality gives vanishing of compactly supported cohomology in degree q₀−1; it should be degree d−1 with d = 2q₀+ℓ₀, the degree dual to H¹; affects nothing.
- **Error** in CG18 at proof of Lemma 9.6, p. 418: the source says the normalized U_{x²} acts on the cohomology of the amalgam by 1; it should be N(x)^{−2}, the unnormalized double coset acting by 1, still congruent to 1 mod p; affects the proof.
- **Misprint** in CG18 at proof of Lemma 9.6, p. 418: the source says the Lyndon sequence passes from H^{i−1} of the amalgam to the two vertex terms; it should be H^{i−1} of the edge group, then H^i of the amalgam, then the vertex terms; affects nothing.
- **Gap** in CG18 at proof of Lemma 9.6, p. 418: the source says the old-space isomorphism holds at the anemic ideal because α_x, β_x ≠ ±1; it should be argued only after localizing at (m, U_x − α_x), where U_{x²} − 1 is invertible; affects the proof.
- **Misprint** in CG18 at proof of Theorem 9.19, p. 426: the source says the residual complex has degree-i term dual to H^{i−ℓ₀}(Y, k); it should be dual to H^{q₀+ℓ₀−i}(Y, k), so that the top degree gives H^{q₀}; affects the proof.
- **Gap** in CG18 at §9.3 after Conjecture B, p. 415, and proof of Theorem 9.19, p. 427: the source says surjectivity onto the anemic algebra and patching condition (d) follow from Conjecture B; it should be an added clause tying diamond operators at Q to inertia, as Conjecture A(3) does; affects the proof.
- **Misprint** in CG18 at Theorem 6.3(d), p. 386: the source says the augmentation ideal at level N lies in the image of ker φ_N; it should be ker φ_M for the original level M, as φ₀ is undefined; affects a stated result.
- **Gap** in CG18 at §7.1, Lemma 7.1, p. 392, applied in §9.5, p. 425: the source says perfect free models exist for covers of manifolds; it should be justified for the orbifold cohomology of §9, whose stabilizers can have p-torsion (PSL₂(ℤ), p = 3 = n+1); affects the proof.
- **Gap** in CG18 at §9.4, p. 419: the source says the PGLₙ case should follow easily from GLₙ through circle bundles; it should be proved, because the centre has p-primary cohomology when p divides N(x) − 1; affects nothing.
- **Gap** in CGH20 at proof of Theorem 3.2, arXiv v1 p. 6: the source says the Taylor–Wiles level comparison for the PGLₙ quotients follows as in CG18 §9.4 and KT17 Lemma 6.25(4); it should be proved for Res PGLₙ, as both cited results concern GLₙ; affects the proof.
- **Misprint** in CGH20 at Theorem 1.2(1), arXiv v1 p. 2: the source says enormous image in the sense of CG18 §9.2; it should be CG18 §9.4 (published p. 419); affects nothing.
- **Misprint** in CG18 at §9.1(2), p. 412: the source says the lower blocks of the Taylor–Wiles levels are GL and SL of size N−1; it should be size n−1; affects nothing.
- **Misprint** in CG18 at Theorem 5.16(8)(a), p. 383: the source says the Galois representation r_p(π); it should be r_p(π₀); affects nothing.
- **Misprint** in CG18 at §9.2, p. 412: the source says the first Hecke map lands on the level gKg⁻¹ ∩ K_Q; it should be gKg⁻¹ ∩ K; affects nothing.
- **Misprint** in CG18 at Theorem 6.4(1), p. 389: the source says R is a power series ring over O; it should be R_∞; affects nothing.
- **Misprint** in CG18 at Definition 9.1, p. 413: the source says generators T_{α,k} for all α that are units at S_Q; it should be α trivial at R, since §9.2 defines T(g) only for g trivial at R; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "71a36b3", "job": "REV-PKG-AutomorphyLiftingBeyondTaylorWiles", "model": "opus", "worker": "fable-rev36"} -->
