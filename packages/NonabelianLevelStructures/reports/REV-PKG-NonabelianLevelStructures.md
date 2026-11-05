<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2283#issuecomment-6663062783 -->
Review (claude) of 710d47b

Verdict: needs_changes

1. **F01** (P3) §5.2 misdescribes the slip in Chen's Proposition 5.2.5

   - Location: `packages/NonabelianLevelStructures/README.md` line 658: "Chen's statement that the action is a homomorphism is corrected to an anti-homomorphism."
   - Claim: the source calls the trace action a homomorphism.
   - Witness: CHEN2024 line 3847 already says "Tr defines an anti-homomorphism"; the slip is the hooked (injective) arrow at line 3848, which the plan's own errata entry E3 records. The map is not injective, since γ₋ᵢ fixes every triple (README §5.2 Check 3).
   - Repair: replace the parenthetical by "Chen displays the map with an injective arrow; it is not injective, since γ₋ᵢ and every inner automorphism act trivially on triples."

2. **F02** (P3) §6.1 misdescribes the slip in the proof of Chen's Proposition 5.2.16(d)

   - Location: `packages/NonabelianLevelStructures/README.md` line 776: "In the proof of Chen's Proposition 5.2.16(d) the trace is t ≠ 2 (not t ≠ ±2)".
   - Claim: the proof says t ≠ ±2.
   - Witness: CHEN2024 lines 4050–4052 state that φ is absolutely irreducible if and only if the commutator trace equals 2 (a dropped ≠); no "±2" occurs in the proof (lines 4037–4071). The plan's entry E12 records the slip correctly.
   - Repair: "In the proof of Chen's Proposition 5.2.16(d) absolute irreducibility is equivalent to commutator trace different from 2, not equal to 2."

3. **F03** (P3) supplier drift: `ExteriorEpi` is not declared by InverseGaloisAndArithmeticFundamentalGroups

   - Location: `packages/NonabelianLevelStructures/README.md` line 58: "§IG.3.2, "Exterior epimorphisms and T-systems": `ExteriorEpi`, the action of Out(F_r) …".
   - Claim: the supplier declares a Lean name `ExteriorEpi`.
   - Witness: at the open head of InverseGaloisAndArithmeticFundamentalGroups (a5186ac) `Suggested.lean` has 391 lines and no identifier containing "xterior"; the README target "Exterior epimorphisms and T-systems" exists (its line 2777) and states the set and the Out(F_r)-action in prose.
   - Repair: delete the backticked `ExteriorEpi`; cite the target by its title only.

4. **F04** (P3) supplier drift: `Curve.finite_rationalPoints` is named `mordell_finite`

   - Location: `packages/NonabelianLevelStructures/README.md` line 110 and §7.4 *Needs:* (line 930): "`Curve.finite_rationalPoints`".
   - Claim: HeightsRationalPointsAndObstructions §4.6 declares `Curve.finite_rationalPoints`.
   - Witness: at head 3961ac8, §4.6 "Mordell over number fields" names `mordell_finite`, stated in its §6.4 and in `Suggested.lean` line 80; no `finite_rationalPoints` occurs in that README or Lean file.
   - Repair: replace both occurrences by `mordell_finite`.

5. **F05** (P3) supplier drift: LanglandsParameterStacks labels LP2e.1 and LP2c.7 no longer exist

   - Location: `packages/NonabelianLevelStructures/README.md` line 92 ("LP2e.1 coarse parameter quotients `Spec A^Ĥ` and LP2c.7 the generation of invariant functions") and §5.1 *Needs:* (line 654), Layer 5 Dependencies (line 768), and the gap `integral-rank-two-invariants` (line 94, "LP2c.7").
   - Claim: the supplier has sections LP2e.1 and LP2c.7.
   - Witness: at head 1e9f8e8 the roadmap is numbered by layer: §2.1 "Coarse parameter quotients" (coaction equalizer, `Spec A^Ĥ`) and §3.8 "Trace and excursion character comparison" (trace generation over an algebraically closed field of characteristic zero). No string "LP2" occurs in it.
   - Repair: write "LanglandsParameterStacks §2.1" and "§3.8" at the four places; the gap's section in `design/plan.json` keeps the title "Trace and excursion character comparison", which still resolves.

6. **F06** (P3) AlgebraicModuliForArithmeticGeometry §8.2 is cited for a family it explicitly does not provide

   - Location: `packages/NonabelianLevelStructures/README.md` line 78 ("§8.2: the smoothing family x y = t of the node") and §0.4 *Needs:* (line 203, "AlgebraicModuliForArithmeticGeometry §8.2"); Layer 0 Dependencies (line 267).
   - Claim: §8.2 supplies the smoothing family of the node.
   - Witness: at head 4f0ad34, §8.2 is "Formal effectivity, versality and algebraization"; its node example is the deformation of a point on the fixed node `xy = 0` with hull `k[[x,y]]/(xy)`, and the roadmap says twice that the smoothing parameter `xy = t` "belongs to a different functor" (its lines 9789 and 10242). The smoothing hull is SchemeAndStackFoundations §4.6 `node_versal_deformation`, already cited at line 72.
   - Repair: delete the §8.2 clause at line 78 and the §8.2 item from the §0.4 *Needs:* line and the Layer 0 Dependencies.

7. **F07** (P3) `ClassificationStatement` is a Tau Ceti declaration, not "CFSGStatement A0"

   - Location: `packages/NonabelianLevelStructures/README.md` lines 116–118 ("### From TauCetiRoadmap.CFSGStatement … A0: `ClassificationStatement`") and §4.2 *Needs:* (line 621), Layer 4 Dependencies (line 629).
   - Claim: CFSGStatement has a section A0 declaring `ClassificationStatement`.
   - Witness: `TauCeti.ClassificationStatement` is a `def … : Prop` at the pin, `TauCeti/GroupTheory/SpecificGroups/CFSG/Classification.lean` line 54 (with `classificationStatement_of_zero` at line 67); the CFSGStatement roadmap on main has Layers 1–3 and no "A0" (A0 is CFSGBasicProperties' label, line 786 of that README, which this README already cites).
   - Repair: move the declaration to "From Tau Ceti" with its file, and cite it as Tau Ceti `TauCeti.ClassificationStatement` in §4.2 and the Layer 4 Dependencies; keep the CFSGStatement subsection only if some section of it is actually consumed.

8. **F08** (P3) convention note: the supplier's Aut(F_r)-action is `e ∘ α⁻¹`

   - Location: `packages/NonabelianLevelStructures/README.md` line 25 ("Aut(F₂) acts by precomposition, which is a right action") and §3.1 second API bullet (line 533).
   - Claim (implicit): the imported action of InverseGaloisAndArithmeticFundamentalGroups §IG.3.2 is the right action by precomposition.
   - Witness: that target (its line 2779) defines the action as `e ↦ e ∘ α⁻¹`, a left action. The orbits of the two actions coincide, so every statement of this roadmap is unaffected, but the anti-homomorphism bookkeeping of §§3.1 and 5.2 is this roadmap's, not the supplier's.
   - Repair: add one sentence to Conventions: "InverseGaloisAndArithmeticFundamentalGroups §IG.3.2 writes the same action as the left action `e ∘ α⁻¹`; the orbits, and hence every statement here, agree."

9. **F09** (P3) BelyiMaps Layer 10 assigns itself to a successor roadmap that exists nowhere

   - Location: `packages/NonabelianLevelStructures/README.md` line 114 ("Layer 10, §10.4: a curve over ℚ̄ admits a Belyi map") and §0.7 *Needs:*.
   - Claim: BelyiMaps Layer 10 §10.4 supplies Belyi's theorem.
   - Witness: on main, `TauCetiRoadmap/BelyiMaps/README.md` line 3280 has "Layer 10: Belyi's theorem" with §10.4 "A curve over ℚ̄ admits a Belyi map" (line 3418), but the layer opens with an owner banner delegating it to `BelyiAlgebraicAndDescent`, which is not on main, not in the merge order and not among the open pull requests (the plan's `upstreamNotes` already records this). The section exists, so the citation resolves; a reader of this roadmap cannot see that the supplier has disowned it.
   - Repair: in Scope and ownership (line 17) write "BelyiMaps Layer 10 §10.4 owns Belyi's theorem (that roadmap assigns the layer to a successor)". No gap is needed: the statement is on main.

10. **F10** (P3) a Check names values the definition does not produce

   - Location: `packages/NonabelianLevelStructures/README.md` line 563: "the least common multiple of image orders 2 and 4 would be 4, not their product 8."
   - Claim: for SL₂(𝔽₅) and c of trace −2 some pair contributes a group of order 4 to m′_c.
   - Witness: brute force over all 9120 generating pairs of SL₂(𝔽₅): for every pair with commutator of trace −2, A(G, u, h) ∩ ⟨[u⁻¹, h⁻¹]⟩ = {±1}, so every element order is 1 or 2 and m′_c = 2; no group of order 4 occurs, and the sentence does not say what "image orders 2 and 4" are.
   - Repair: delete the clause after "d′_c = 10/10 = 1". (A product-versus-lcm discriminator needs two pairs with cyclic groups of different orders; none exists in the examples of this README.)

11. **F11** (P3) `simple_group_congruence` is restricted to `Type`

   - Location: `packages/NonabelianLevelStructures/Suggested.lean` lines 118–121: `{G : Type}` and `∀ (K : Type) [Field K] [Finite K]`.
   - Claim: the README's §4.2 is universe-free, and `combinatorial_congruence` (line 104) is stated for `G : Type*`.
   - Witness: the elaborated signature (`#check`) shows `{G : Type}`; the variant with `universe u`, `{G : Type u}` and `∀ (K : Type u) [Field K] [Finite K]` elaborates at the pin with only the `sorry` warning (tested on a copy of the file).
   - Repair: state the theorem with `{G : Type u}` and `∀ (K : Type u) …`, keeping everything else.

No P1 or P2 finding. Eleven P3 findings: two misdescriptions of the source, five supplier citations that have drifted at the suppliers' current heads or at the pin, one cross-roadmap convention note, one ownership caveat, one Check that names values the definition does not produce, and one universe restriction in `Suggested.lean`. Elaboration passes with the two expected `sorry` warnings; the dependency gate reports no UPWARD or CYCLE line; the one-tactic probe closes neither headline; every computed value of the README that I recomputed agrees.

## Verified sound

**Principles.** No route-specific shortcut (every statement is for a general finite group, every finite field, every commutative ring, with special cases as Checks); no re-planning (the level stacks, the coarse degree congruence, the trace dictionary and the Markoff dynamics are imported from ArithmeticDynamicsPartII, whose §§0.1, 1.4, 2.1–2.4, 3.6–3.7, 4.2, 6.0–6.6, 7.2–7.4a I read at head 7dd79a5 and found to state what is cited, including the general-j congruence of §6.0 with its induction route and §7.4a's restriction to p ≡ 1 (mod 4) and p = 11, which leaves exactly the p ≡ 3 (mod 4) gap this roadmap declares); no copied passages (I compared each sampled section with its locator; wording is the author's); no algorithms (the finite enumerations are Checks); `Suggested.lean` has one `import Mathlib`, no `set_option`, no sorry'd data, `theorem` only.

**Dependency gate.** Output: `depcheck: 225 roadmaps, 2204 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line. All fifteen suppliers are earlier in the merge order or on main; ArithmeticDynamicsPartII is line 293, this roadmap line 295.

**Declared gaps (8).** Each has a named supplier (none is `none`), the same slug in `design/plan.json` and the README, and a `needs` sentence with hypotheses. None asks for what exists at the pins: Mathlib has no Nielsen isomorphism, no Gaschütz lifting lemma, no Vdovin bound, no integral invariant theory of matrix pairs; `TauCeti.ClassificationStatement` is a `Prop`, not a proof. The gap on ArithmeticDynamicsPartII §7.4a is exactly the part that section does not prove.

**Elaboration.** `lake env lean` on `Suggested.lean` from the content checkout: two warnings, both `declaration uses sorry` (lines 104 and 118), nothing else, 5.4 s. Elaborated types compared with the README (`#check @combinatorial_congruence`, `#check @simple_group_congruence`): no binder lost; ⌈r/2⌉ is `(r + 1) / 2`, |G| ≤ ℓ^{3(r+1)} is `Nat.card G ≤ (ℓ ^ (r + 1)) ^ 3`, both as in §§3.3, 4.2. Definition bodies checked by `rfl` on a copy: `nielsenRight G (u, v) = (u, u * v)`, `nielsenLeft G (u, v) = (v * u, v)`, `Equiv.inv (G × G) (u, v) = (u⁻¹, v⁻¹)`, and the `ConjAct G` action on `G × G` is simultaneous conjugation `(g u g⁻¹, g v g⁻¹)`; so `exteriorInversionGroup` is the group of §3.1 and `coarseNielsenOrbit` is the Out⁺(F₂)-orbit in Epi^ext(F₂, G)/⟨γ₋ᵢ⟩ (the transvections commute with conjugation, and γ₋ᵢ is central in Out⁺(F₂), so the image of the transvection orbit equals the image of the orbit of the group generated by transvections, conjugations and γ₋ᵢ). `cuspVerticalExponent` is the lcm of the element orders of all groups A(G, u, h) ∩ ⟨[u⁻¹, h⁻¹]⟩ over pairs with [u, h] conjugate to c (`Finset.lcm_empty` gives 1), which is Chen's m′_c; `centralizerQuotientOrder` is |C_G(⟨c⟩)|/|c| with exact division.

**Padding probe (every sorried theorem).** On a copy, each of `simp`, `rfl`, `infer_instance` and `exact Nat.one_dvd _` fails on `combinatorial_congruence`, and `simp`, `rfl`, `infer_instance` fail on `simple_group_congruence`. Neither restates a definition, mirrors a Check or computes a value. No `example` is present.

**Headline theorems** (README summary): combinatorial congruence (stated), simple-group congruence (stated); cusp classification and vertical automorphism groups, representability criterion, two Markoff components with degree and genus, finiteness of j-invariants, large monodromy and noncongruence, cofinality, integral trace coordinates: each named in the module docstring with the missing carrier, and none is forced through a stand-in. Every backticked name the README attributes to this roadmap (`nielsenRight`, `nielsenLeft`, `positiveNielsenGroup`, `exteriorInversionGroup`, `coarseNielsenOrbit`, `cuspVerticalExponent`, `centralizerQuotientOrder`, `combinatorial_congruence`, `simple_group_congruence`) is declared; every Lean name appears in the README.

**Library names opened at the pins** (file:line): `Equiv.prodShear` Logic/Equiv/Prod.lean:299; `Equiv.mulLeft` Algebra/Group/Units/Equiv.lean:97; `Equiv.inv` Algebra/Group/Equiv/Basic.lean:242; `MulAction.toPermHom` Algebra/Group/Action/End.lean; `Prod.mulAction` Algebra/Group/Action/Prod.lean:88; `MulAction.orbitRel` GroupTheory/GroupAction/Defs.lean:287; `Finset.lcm_empty` Algebra/GCDMonoid/Finset.lean:57; `Nat.factorization` Data/Nat/Factorization/Defs.lean:50; `IsSimpleGroup` GroupTheory/Subgroup/Simple.lean:38 (extends `Nontrivial`, as the README says); `Matrix.ProjectiveSpecialLinearGroup` LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup.lean:33; `CongruenceSubgroup.Gamma` :41 and `IsCongruenceSubgroup` :163 of NumberTheory/ModularForms/CongruenceSubgroups.lean; `alternatingGroup.isSimpleGroup` GroupTheory/SpecificGroups/Alternating/Simple.lean:203 (`5 ≤ Nat.card α`); `nat_card_alternatingGroup` Alternating.lean:140 (`[Nontrivial α]`); `Subgroup.centralizer` GroupTheory/Subgroup/Centralizer.lean:30 with `mem_centralizer_iff` (h * g = g * h); `Subgroup.zpowers` Algebra/Group/Subgroup/ZPowers/Basic.lean:30; `commutatorElement` Algebra/Group/Commutator.lean:28; `orderOf` GroupTheory/OrderOfElement.lean:181. Tau Ceti: `Matrix.SpecialLinearGroup.trace_commutatorElement_fin_two` LinearAlgebra/Matrix/Trace/FinTwo.lean:127; `TauCeti.PermutationTriple` Combinatorics/PermutationTriple/Basic.lean:75 with relation `σinf * σ1 * σ0 = 1`, `eulerChar` EulerCharacteristic.lean:66 (cycle counts minus n), `genus` :204 (truncated), `IsConnected.two_sub_two_mul_genus` :243; `TauCeti.CoveringSpace.monodromyFunctor` Topology/Covering/Monodromy/Basic.lean:65; `TauCeti.ClassificationStatement` GroupTheory/SpecificGroups/CFSG/Classification.lean:54.

**Cross-roadmap citations resolved** (head in parentheses): ArithmeticDynamicsPartII (7dd79a5) all sections above; InverseGaloisAndArithmeticFundamentalGroups (a5186ac) IG.1.2 "Tame tangential fibres at a boundary point", IG.1.3 "Invariance under algebraically closed base extension in characteristic zero", IG.1.4 "Exactness in families and the moduli outer action" (with the generic stabiliser ±1 of 𝓜_{1,1}), IG.3.1 "Riemann existence for punctured curves", IG.3.2 "Exterior epimorphisms and T-systems", IG.5.4 "Admissible G-covers of marked curves" and "Admissible stacks and stable marked G-curves" (marking = reduced ramification divisor over a ramified label, whole fibre over an unramified one; vertical automorphisms of a smooth connected cover = Z(G); inverse node characters); AnabelianGeometryAndNonabelianChabauty (227f000) §1.1 and §1.2 with all five named targets; AlgebraicModuliForArithmeticGeometry (4f0ad34) §5.1 `Rigidification.stack`, `Rigidification.vertical_kernel`, §8.3 `schemeFramedCompletionEquiv`, `completedAtlasPresentation_equivalence`; ModularCurvesPartII (07e21ad) §§3.1, 3.11, 3.12; ArithmeticGaloisRepresentations (cdbe447) §§1.7, 4.3, 4.4; HeightsRationalPointsAndObstructions (3961ac8) §4.6; LanglandsParameterStacks (1e9f8e8) §§2.1, 3.8 by title; on main: StableReduction Layers 1–3 (dual graphs with loops, relative dualizing sheaf, clutching), SchemeAndStackFoundations §§1.19, 1.21, 1.23, 3.2 `scheme_riemann_hurwitz`, 4.6 `node_versal_deformation`, 4.15, ClassicalArithmeticCompletion §§4.57 (`markoffHurwitzMove`, `markoffHurwitzGroup`), 4.58 (`markoffPoly`, `markoffLevelSet`, `markoffTraceSurface`), 4.76, BelyiMaps Layer 10 §10.4, CFSGBasicProperties A0; MappingClassGroupsAndCanonicalRepresentations C.0/moduli-monodromy (board package, design accepted; its node statement is the orbifold fundamental group of M(g, n) as the pure mapping class group, as cited). Ownership against the open pull requests listed in the brief was checked through `roadmaps grep` for "Nielsen", "Higman", "nonabelian level", "Markoff" and "combinatorial congruence": no open roadmap states the cusp theory, the obstruction pair or the congruences; InverseGaloisAndArithmeticFundamentalGroups records Chen's divisibility question only in prose.

**Sources: the seeded sample** (printed page = file page + 300).
- §0.2: Definition 2.3.1 (line 1070, p. 327), Proposition 2.3.2 (1090), Remark 2.3.3 ([b, a] over ℂ, 1101–1114), Definition 2.3.4 (1118, p. 328), Situation 2.5.14 (1821, p. 346). Supports the statement; the coprime-power clause is the roadmap's own.
- §0.4: Proposition 2.5.3 (1502–1520, pp. 338–339: Λ[[T]] → Λ[[t]], T ↦ t^e, flat, smooth locus dense), Corollary 2.5.4 (1611), Propositions 6.5.5–6.5.6 (5359, 5421, pp. 431–432).
- §0.5: Theorem 2.5.2(6) (1448–1463, p. 337), Proposition 2.5.10(f) (1723–1732, p. 344: proper surjective quasi-finite M̄(f)), §4.12 opening (3525–3528, p. 389).
- §0.6: Definition 2.5.13 (1815–1820, p. 346), the free Out(G)-action (1808–1814), Situation 2.5.14.
- §1.2: Proposition 4.1.4 (2459–2472, pp. 362–363), Lemma 4.4.4 (2754–2799, pp. 369–370), Theorem 4.4.5 (2800–2808, pp. 370–371).
- §1.4: Definition 4.7.2 (2995), Propositions 4.7.3–4.7.4 (3014, 3025–3072, pp. 375–377).
- §1.5: Proposition 4.5.2 (2863–2872, p. 372), Definition 4.7.1 (2990), Propositions 4.7.6 (3077) and 4.8.1 (3086–3097, pp. 377–378).
- §1.9: Proposition 4.9.1 (3205–3216, pp. 380–381; symmetric good path, (d) with r > 0).
- §2.1: (4.15) (3302), Proposition 4.10.1 (3304–3311, p. 383), Theorem 4.10.3 (3340–3376, pp. 384–386).
- §2.4: Remark 4.10.4 (3418–3426, p. 386).
- §3.1: §1.1 (169–195, p. 305: Out(Π) ≅ GL₂(ℤ), Out⁺, components as orbits), paragraph after Theorem 4.10.5 (3440–3446, p. 387) and footnote 28 (3473–3477).
- §5.5: Definition 5.1.2 (3665), Proposition 5.1.3 (3670–3706, pp. 392–393): admissible trace lists, unique class for t ≠ ±2, three classes at −2 for odd q, the swap by a nonsquare-determinant conjugation.
- §6.4: Lemma 5.3.1 (4193–4196, p. 405: hypothesis (tr B, tr AB) ≠ (0, 0)), Theorem 5.3.2 (4200–4218), proof (4232–4390, pp. 406–409).
- §6.5: the parabolic, hyperbolic, elliptic and even cases of that proof (4267–4386); the elliptic degenerate conic is called empty at line 4343 (the single point (a, 0, 0) is correct, see Source issues).
- §7.6: (5.8) MP(p) (4676, p. 416), Theorem 5.5.8 (4680), P_MP and Theorem 5.6.6 (4827–4857, p. 420), Corollary 5.6.8 (4860–4875); MP18 Theorems 1.3–1.4 (MP18 lines 90–103), Corollary 1.5 (115) and the classification being used only in Theorem 1.4 (156).
Also read for the headlines and findings: Theorem 4.10.5 (3429–3446), its proof (3450–3468), Lemmas 4.12.1–4.12.2 and Corollaries 4.12.4–4.12.5 (3540–3615, pp. 389–391), §4.11 (3480–3524), Theorem 4.8.4 and Proposition 4.8.6 (3139–3200), Theorem 5.2.1 (3786–3798), Proposition 5.2.5 (3835–3859), Lemma 5.2.9 (3896–3900), Definition 5.2.12 and Proposition 5.2.13 (3985–3993), Propositions 5.2.16–5.2.17 (4037–4085), Remark 5.2.21 (4148–4154), Propositions 5.6.1–5.6.2 and Theorems 5.6.3–5.6.4 (4730–4798), Theorem 6.2.2 (5131), Proposition 6.3.1 (5164), Proposition 6.4.1 (5201–5222), Definition 2.1.4 (696–703: a finite map, flatness not required), Remark 2.2.4 (973–979), Proposition 3.2.2 and its proof (2065–2111), Theorem 1.2.10 (394–400); CHEN2018 Theorem 4.2.2 (its line 1386: φ(k)/2 components, each Y₁(2) for odd k); BBCL22 Theorem 2.2.3 (its line 612). Unverified-flagged locators: the manifest flags none.

**Adversarial table** (values computed by brute force on explicit groups, Markoff surfaces over 𝔽_p for 5 ≤ p ≤ 43, and by hand).

| Statement | Instances | Computed | Result | Change |
| --- | --- | --- | --- | --- |
| §3.3 / `combinatorial_congruence` | C₁, C₂, C₃, S₃, D₁₀, D₁₄, A₄, S₄, SL₂(𝔽₃), A₅, SL₂(𝔽₅), PSL₂(𝔽₇): every Out⁺(F₂)-orbit on Epi^ext/⟨γ₋ᵢ⟩ | (|c|, m′, d′, modulus, orbit): C₁ (1,1,1,1,1); C₂ (1,1,2,1,3); C₃ (1,1,3,1,4); S₃ (3,3,1,1,3); D₁₀ (5,5,1,1,3) twice; D₁₄ (7,7,1,1,3) three times; A₄ (2,2,2,1,4); S₄ (3,1,1,3,9); SL₂(𝔽₃) (4,2,1,2,16); A₅ (5,1,1,5,10) twice and (3,1,1,3,18); SL₂(𝔽₅) (10,2,1,5,40) twice and (6,2,1,3,72); PSL₂(𝔽₇) (7,1,1,7,7) twice, (3,1,1,3,18), (4,1,1,4,16) twice | modulus divides the orbit size in all 24 orbits; matches §3.3 Checks and Layer 3 Examples | none |
| §3.1 γ₋ᵢ versus no γ₋ᵢ | C₃, SL₂(𝔽₃), PSL₂(𝔽₇) order 3 | classes without inversion 8, 32, 36 against 4, 16, 18 with it; C₂, S₃, SL₂(𝔽₅): equal | the quotient by γ₋ᵢ is not a no-op; §0.3 Check (C₃: 8 against 4) confirmed | none |
| §3.1 commutator is conjugated by the transvections | symbolic | [u, uv] = u[u, v]u⁻¹; [vu, v] = v[u, v]v⁻¹; (uv)[u⁻¹, v⁻¹](uv)⁻¹ = [u, v] | identities hold | none |
| §3.2 m′_c, d′_c | SL₂(𝔽₅) trace −2 (order 10): all pairs | A ∩ ⟨[u⁻¹, h⁻¹]⟩ = {±1}, m′ = 2, |C(c)| = 10, d′ = 1; trace 1 (order 6): m′ = 2, d′ = 1 | as stated; the "image orders 2 and 4" clause has no instance | R10 |
| §3.2 empty family | G = 1, and any class not a generating commutator | `Finset.lcm_empty` = 1; d′ = 1 | boundary as stated | none |
| §2.1–2.2 A(G, u, h), k, exact sequence | S₃ ((123), (12)); D₁₀ (rotation, reflection); SL₂(𝔽₃) orders 3, 4; SL₂(𝔽₅) all 9120 generating pairs | S₃: |A| = 3, k = 1, |M| = 3, A ∩ ⟨[u⁻¹, h⁻¹]⟩ of order 3; D₁₀: |A| = 5, k = 1, Z = 1; SL₂(𝔽₃): |M| = 24, |A| = 2, k = 3 = |u|; SL₂(𝔽₅): k = |u| for every pair (0 exceptions) | |A| = |Z||u|/k in every case; Remark 4.10.2's claim for q = 5 confirmed | none |
| §1.6 I(G) | C₁, C₂, C₃, S₃, D₁₀, D₁₄, A₄, S₄, SL₂(𝔽₃), A₅ | 1, 2, 4, 2, 4, 6, 4, 3, 8, 11 | the four values the README states agree | none |
| §2.5 odd dihedral | D₆, D₁₀, D₁₄ | orbits of coarse degree 3 (one, two, three of them = φ(k)/2), m′ = k, d′ = 1, modulus 1 | Chen's d′ = 2 refuted: C(⟨c⟩) = ⟨c⟩ | none (source issue) |
| §4.1 valuations | SL₂(𝔽₅), ℓ = 5, c of order 10 | v₅(m′) = v₅(2) = 0 ≤ ⌊1/2⌋, v₅(d′) = 0 ≤ 0 | as stated | none |
| §4.2 / `simple_group_congruence` hypotheses | A₅ (= PSL₂(𝔽₅)), A₆ (= PSL₂(𝔽₉)), A₇ | A₅ has an abelian subgroup of order 5 > 60^{1/3}; A₇: 7⁶ = 117649 ≥ 2520 and 2520 ≠ q(q² − 1)/gcd(2, q − 1) for any q (q = 16: 4080, q = 17: 2448) | exclusions and the A₇ instance consistent; A₇ orbit not enumerated | none |
| §5.5 admissible traces | SL₂(𝔽_q), q = 2, 3, 5, 7 | {1}, {0}, {1, 3}, {3, 4, 5, 6}; all 8, 27, 125, 343 trace triples attained | matches Proposition 5.1.3(a) and the Layer 5 Examples | none |
| §5.5 Check 4 | 𝔽₅, A = [[0,1],[4,0]], B = [[0,1],[4,2]] | traces (0, 2, 3), commutator trace 1, ⟨A, B⟩ has 120 elements | as stated | none |
| §5.2, Conventions: anti-action witness | (2, 3, 5) | r then t: (2, 1, 3); t then r: (2, 5, 7) | as stated | none |
| §5.2 r² = 1 on triples | symbolic | (x, y, xy − (xy − z)) = (x, y, z) | holds | none |
| §5.2 single sign change | (1, 1, 1) | level 2 → (−1, 1, 1) level 4 | not in the image, as stated | none |
| §5.3 criterion | (I, I); A = [[1,1],[0,1]], B = [[1,0],[1,1]]; A = [[1,2],[0,1]], B = [[1,0],[1,1]] | quantity 0; 1; 4 (triple (2, 2, 4)); ℤ-span I, 2E₁₂, E₂₁, 2E₁₁ is closed under products | as stated | none |
| §5.4 Check 4 | 𝔽₁₁, diag(3, 4) | order 5, trace 7, square has trace 3 | as stated | none |
| Conventions: Fricke and peripheral witnesses | A = [[1,1],[0,1]], B = [[1,0],[1,1]]; 𝔽₇ | tr[A, B] = 3 = 4 + 4 + 9 − 12 − 2; the classes of −[[1,1],[0,1]] and −[[1,−1],[0,1]] in SL₂(𝔽₇) are distinct (24 elements each) | as stated | none |
| §6.2 branch operators on triples | symbolic and 𝔽_p, 5 ≤ p ≤ 43 | γ₀(x,y,z) = (xy − z, x, x²y − xz − y) from tr(A²B⁻¹) = x·tr(AB⁻¹) − tr B⁻¹; γ∞ ∘ γ₁₇₂₈ ∘ γ₀ fixes every point of X*(𝔽_p) for all 12 primes; cycle counts at p = 5: 14, 20, 8 | as stated | none |
| §6.2 Check 1 | 𝔽₇, diag(2, 4), [[0,6],[1,0]] | triple (6, 0, 0), commutator trace 6 | dihedral, excluded by two nonzero coordinates | none |
| §6.3–6.5 slices | 𝔽₅: (a, t) = (1, 4), (0, −2), (2, −2); X*(𝔽₅) slices x = 0, 2, 3; 𝔽₄ | (1, 4): the single point (1, 0, 0); (0, −2): 9 points; (2, −2): 10; x = 0: two 4-cycles; x = 2: two 5-cycles; x = 3: one 10-cycle; 𝔽₄: X² + aX + 1 has no root and L_a has order 5 | as stated (periods 5 and 10 on the ±2 slices) | none |
| §6.6 vertical groups | 𝔽₇ traces 3 and 6 | n₇(3) = 8, n₇(6) = 3 | even/odd as stated | none |
| §7.1–7.3 table | p = 5, 7, 11, 13, 17, 19, 23, 29, 31 (and 37, 41, 43) | D = p(p ± 3): 40, 28, 88, 208, 340, 304, 460, 928, 868; cycles (c₀, c₁₇₂₈, c∞): (14,20,8), (10,15,5), (30,44,14), (70,104,26), (114,171,37), (102,152,34), (154,231,41), (310,464,86), (290,435,69); genus from cycles = genus from the formula: 0, 0, 1, 5, 10, 9, 18, 35, 38; c₀ = (D + 2)/3 and 2c₁₇₂₈ = D + f_p at all twelve primes; C_p formula = c∞ at all twelve; Γ transitive at all twelve; unique γ₀-fixed point (3, 3, 6) ((3, 3, 1) at p = 5) | every entry of the Layer 7 table reproduced; Chen's (D − 3)/3 refuted (not an integer at p = 5) | none (source issue) |
| §7.3 integrality and minimum | all primes 5 ≤ p < 2304 | formula integral at each of the 337 + 3 primes; minimum over 13 ≤ p < 2304 is 5 at p = 13 | as stated | none |
| §7.5 d_p | p = 5, 7 and all twelve | |Y*| = D/4: 10, 7, 22, 52, 85, 76, 115, 232, 217, 370, 451, 430 | freeness of the sign action confirmed by count | none |
| §7.6 parity rule | projective γ₀, γ₁₇₂₈, γ∞ on Y*(p) | parities (even = 0): p = 5, 7, 11, 23, 37, 41, 43: (0, 1, 1); p = 13, 17, 19, 29, 31: (0, 0, 0) | matches the residues mod 16 (5, 7, 11, 7, 5, 9, 11 → S; 13, 1, 3, 13, 15 → A) | none |
| §7.6 MP(p) | p = 7, 11, 19, 23, 31, 43 | orders of a root of X² − 3X + 1 in 𝔽_{p²}: 8, 5, 9, 24, 15, 44; squares below 1024(p + 1) | MP fails at 7 as stated (and at these others) | none |
| §7.8 order argument | d = 5, …, 11 | d! = ℓ(ℓ² − 1) only for d = 5, ℓ = 5 | as stated | none |
| §2.4 Check 1 | (ℤ/n)², n ≥ 3 | orbits |GL₂(ℤ/n)|/|SL₂(ℤ/n)| = φ(n); −I free so degree |SL₂(ℤ/n)|/2 | as stated | none |
| §0.3 Check 3 | C₃ | [SL₂(ℤ) : Γ₁(3)] = 8, −I ∉ Γ₁(3), image index 4 | as stated | none |
| §1.8 Higman word | symbolic; S₃ | (uh)[u⁻¹, h⁻¹](uh)⁻¹ = [u, h]; both 3-cycles for ((123), (12)) | holds | none |
| Lean `cuspVerticalExponent` versus Chen | definition reading | lcm of element orders of ∪ A ∩ ⟨[u⁻¹, h⁻¹]⟩ = least positive integer killing every such group | equal | none |
| Lean universe | `simple_group_congruence` | `{G : Type}`; polymorphic variant elaborates | narrower than README | R11 |

**Shape.** Summary, Scope and ownership, Conventions (with four convention witnesses, each recomputed above), Exact supplier contracts per supplier, How to read the build, Layers 0–7 each ending with Examples and Dependencies, Downstream consumers, Worked examples, References. Every definition section has an API list and at least three Checks (§§0.2, 0.5, 0.6, 1.1, 1.3, 1.4, 1.6, 1.7, 2.1, 3.1, 3.2, 5.1, 5.4, 5.5, 5.6, 6.3, 7.5); every theorem section has hypotheses in the sentence, a locator in parentheses and a *Needs:* line. No LaTeX delimiters, no process words, no pull-request numbers, no machine paths (grep). Manifest: six works, all cited in References; ASADA2001 and VDOVIN1999 recorded `uncertified` with DOI and locator.

## Not verifiable

- ASADA2001 §7 (gap:asada-cofinality) and VDOVIN1999 Theorem A (gap:vdovin-abelian-subgroups and §4.2): paywalled, settled as `uncertified`; cited by locator through Chen's Theorems 2.5.2(7) and 4.12.3, which I read.
- The A₇ instance of §4.2 (7 ∣ orbit size for c of order 7): not enumerated (6.35 million pairs); the hypotheses were checked by hand.
- PSU₃(4) degrees 1 and 184 (Layer 4 Examples): Chen's GAP computation, line 3520–3523; not recomputed.
- The residue-mod-16 rule of §7.6 beyond the twelve primes computed: BBCL22 §3.3, not read in full.

## Source issues

- **Error** in CHEN2024 at §4.11, printed page 388: the source says the centralizer obstruction d′ for odd dihedral D_{2k} is 2; it should be 1, since a primitive rotation's centralizer is the rotation subgroup (the normalizer quotient has order 2); affects nothing (the text's conclusion that m′ is the culprit stands).
- **Error** in CHEN2024 at Proposition 5.6.1(a), printed page 418: the source says the fibre over j = 0 has (p(p ± 3) − 3)/3 points; it should be (p(p ± 3) + 2)/3 (one fixed point plus (D − 1)/3 three-cycles; at p = 5 the printed value is not an integer); affects a stated result (the genus formula of Theorem 5.6.3 is nonetheless correct).
- **Error** in CHEN2024 at the proof of Lemma 5.3.1, elliptic degenerate case, printed page 408: the source says the full conic C₁(a)_t with a² = t + 2 and irreducible X² − aX + 1 is empty; it should be the single point (a, 0, 0) (only y = z = 0 solves (y − ωz)(y − ω⁻¹z) = 0 over 𝔽_q); affects nothing (the point lies outside the non-dihedral locus).
- **Misprint** in CHEN2024 at Remark 5.2.21, printed page 404: the source says γ∞ corresponds to the matrix with upper-right entry −1; it should be +1, since the abelianization of (a, b) ↦ (a, ab) sends b to a + b; affects nothing.
- **Error** in CHEN2024 at Proposition 5.2.5, printed page 397: the source displays the trace anti-homomorphism Aut(Π) → Aut(𝔸³) with an injective arrow; it should be a plain arrow, since inner automorphisms and γ₋ᵢ act trivially on triples; affects nothing.
- **Misprint** in CHEN2024 at the proof of Proposition 5.2.16(d), printed page 402: the source says absolute irreducibility is equivalent to commutator trace equal to 2; it should be different from 2 (Lemma 5.2.9); affects nothing.
- **Gap** in CHEN2024 at the proof of Proposition 5.2.16(d), printed page 402: the source says a dihedral-type pair has both projective images of order at most 2; it should also treat a rotation with a reflection, where the reflection and the product are involutions; affects the proof only (the statement stands).
- **Gap** in CHEN2024 at the proof of Lemma 4.12.2, printed pages 389–390: the source says that an intersection of order at most ℓ^j of two cyclic ℓ-groups makes the ℓ^j-th powers meet trivially; it does not (an element of order ℓ² and one of order ℓ inside its span satisfy the bound and generate a cyclic group); the j = 0 case, which Corollaries 4.12.4(b) and 4.12.5(b) use, is unaffected; affects the proof of the general-j statement.
- **Error** in CHEN2024 at Lemma 4.4.4(g), printed page 370: the source says the glued quotient D_α → E₀ is flat; at a ramified node the local model x = ξ^e, y = η^e, ξη = 0 has special fibre of length 3 and generic rank 2 for e = 2; affects the proof only (the cover is finite and admissible, which is what is used).
- **Error** in CHEN2024 at the proof of Proposition 3.2.2(b), printed page 353: the source says the forgetful maps M_{g,n} → M_{g,n−1} are proper; they are the universal curve minus its sections, not proper; affects the proof only (smooth surjective with connected fibres suffices).
- **Error** in CHEN2024 at Theorem 5.6.4 and Theorem 1.2.10, printed pages 419 and 310: the source says only finitely many elliptic curves over K admit an SL₂(𝔽_p)-structure of ramification index 2p; quadratic twists preserve such structures (γ₋ᵢ acts trivially on the trace −2 fibre), so it should say finitely many j-invariants; affects a stated result.
- **Error** in CHEN2024 at Proposition 6.4.1(b), printed page 429: the source says N/C has order at most 2 and lies in Out(G); it should be N/(G·C), since N/C contains the inner automorphisms; affects a stated result (the intended bound on the diagonal outer group is correct).
- **Misprint** in CHEN2024 at Theorem 1.2.10, printed page 310: the source says every odd prime outside the exceptional set; it should say p ≥ 5, since X*(𝔽₃) is empty; affects nothing.
- **Error** in CHEN2024 at Remark 2.2.4, printed page 324: the source says the reduced ramification divisor is reduced if and only if the base is; the converse fails for an empty divisor (G trivial over a nonreduced base); it should assume the divisor surjects onto the base; affects nothing in the main text.
- **Misprint** in CHEN2024 at the proof of Corollary 4.12.4, printed page 390: the source refers to a part (c); it should refer to the second assertion of part (b); affects nothing.
- **Misprint** in CHEN2024 at Lemma 5.3.1, printed page 405: the source says (tr φ(b), tr φ(ab)) ≠ (0, 0) excludes dihedral type; it excludes only that one pair of zero coordinates; affects nothing (the proof uses the stated hypothesis).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "710d47bfaddf1db07c445e174f41cca75583397f", "job": "REV-PKG-NonabelianLevelStructures", "model": "fable", "worker": "chris-x19"} -->
