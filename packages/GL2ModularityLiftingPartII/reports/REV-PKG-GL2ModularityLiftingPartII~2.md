<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1225#issuecomment-6395646092 -->
Review (claude) of f34aeca

Verdict: needs changes

1. **F01** (P2) Frobenius and inertia predicates are re-planned instead of imported

   - **Location.** `packages/GL2ModularityLiftingPartII/Suggested.lean` lines 48–66 (`IsPlaceAbove`, `IsUnramifiedAt`, `IsArithFrobAt`). README Conventions, lines 27–49: "Define `IsArithFrobAt` for ℓ, v and g in G_ℚ by membership in the decomposition group at v and the action a ↦ a^ℓ on its residue field".
   - **Claim.** These are new definitions of this roadmap, on valuation subrings of ℚ̄.
   - **Witness.**
     - Mathlib already has `IsArithFrobAt` (`Mathlib/RingTheory/Frobenius.lean:183`) and `Ideal.inertia` (`Mathlib/RingTheory/Ideal/Defs.lean:154`).
     - ClassicalSerreModularity, "Arithmetic interfaces for the theorem statements" (head 6c79d1c), defines `IsFrobAt` and `IsUnramifiedAt` on these Mathlib notions.
     - The local `IsArithFrobAt` shadows Mathlib's root name.
   - **Repair.**
     1. Delete `IsPlaceAbove` and the local `IsArithFrobAt`.
     2. Restate `IsUnramifiedAt` and the Frobenius clause of `minimal_weight_one_modularity` on Mathlib's carriers: primes `Q` of `integralClosure ℤ (AlgebraicClosure ℚ)` with `Q.LiesOver (Ideal.span {(ℓ : ℤ)})`, the inertia group `Q.inertia`, and Frobenius elements `IsArithFrobAt ℤ g Q`. These are the carriers of ClassicalSerreModularity, and of `odd_solvable_artin_weight_one` in GL2AutomorphicRepresentationsAndTransfer, whose Suggested.lean also uses `IsArithFrobAt ℤ σ Q`.
     3. In the README, cite ClassicalSerreModularity's interfaces in Scope and in a new "From TauCetiRoadmap.ClassicalSerreModularity" contract, and list Mathlib's `IsArithFrobAt` and `Ideal.inertia` under From Mathlib.
     4. Rewrite the predicates' Checks on the new carrier. The 𝔽₂₇ direction Check stays valid.
     5. Optionally, define `inertiaInvariants` as Mathlib's `Representation.invariants` of the restriction to `Q.inertia`.
   - **Test.** A scratch statement of the repaired clause elaborates with `lake env lean` at the pins. It used `ρ` on `AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ`, `Q.inertia`, `IsArithFrobAt ℤ g Q` and `HeckeRing.GL2.Newform N 1`.
     - Use the `AlgEquiv` type as the domain, as ClassicalSerreModularity's `GQ` does.
     - With `Field.absoluteGaloisGroup ℚ` as the domain, Lean does not find the `MulSemiringAction` instance on the integral closure.

2. **F02** (P2) The modularity headline is stated only for normalized minimal lifts

   - **Location.** `Suggested.lean` lines 124–149. README §6.5, line 879: "More generally first twist ρ̄ by a finite-order character unramified at p … This gives the minimal-up-to-finite-order-twist versions of Corollaries 1.5 and 1.6".
   - **Claim.** `minimal_weight_one_modularity` is the roadmap's form of CG18 Corollary 1.5.
   - **Witness.** p = 3, ψ the cubic character of conductor 7 (residually trivial), ρ₀ minimal with k = 𝔽₃ and 7 ∉ S(ρ̄): ρ = ρ₀⊗ψ² lifts ρ̄ but (det ρ)² = ψ² ≠ 1, so `hmin` fails; §6.5 covers ρ by twisting with ψ.
   - **Repair.**
     1. Replace `hmin` by data and hypotheses on a twist:
        - a continuous finite-order character η : G_ℚ →* Oˣ, unramified at p;
        - `IsWeightOneResidual p` for the twisted residual η̄·ρ̄;
        - `IsMinimalLift` for η·ρ.
        Both twists need one small real-bodied `twist` definition, g ↦ η(g)·ρ(g).
     2. The hypothesis on ρ̄ itself keeps continuity, absolute irreducibility, unramifiedness at p and oddness, but drops the inertia-invariant clause.
     3. The conclusion is unchanged. The normalized theorem is the case η = 1, so do not keep both.
     4. Make the same change to `minimal_lift_finite_image`, with η valued in Aˣ. There the twisted form follows directly from the normalized one, so the change only keeps the two theorems aligned.
   - **Test.** On the witness, η = ψ gives η·ρ = ρ₀⊗ψ³ = ρ₀, which satisfies `IsMinimalLift`.

3. **F03** (P2) Four gap contracts point to this roadmap's sections by bare number

   - **Location.** README lines 189, 161, 159 and 195, with the same text in `design/plan.json` `gaps`:
     - "with the conductor-compatible local quotients of §7.2";
     - "for the exact minimal problems in §§4.1 and 10.1";
     - "rational residual datum of §0.1";
     - "Y₀(Q) and Y_Δ(Q) of §9.1".
   - **Claim.** Each contract is self-contained for its supplier.
   - **Witness.** On the supplier's job these numbers read as the supplier's own sections:
     - GL2ModularityLifting §7.2 is "The dyadic modularity-lifting proposition" (head 1e734ab).
     - GlobalGaloisDeformations §4.1 is "Restriction to a finite extension as a ring map" (head b0adf32).
   - **Repair.** Rewrite the four contracts in the README and in `plan.json` together, naming each object:
     - **scalar-conductor-comparison:** "…with the unipotent quotient at ramified Steinberg primes x ≡ −1 mod p and the minimal conditions of LocalGaloisDeformationRings §§2.1–2.5, 2.19 at the other primes away from p…".
     - **defect-one-presentations:** "…for the CG18 Definition 3.1 minimal problem over ℚ unramified at p and the CG18 §5.1 minimal problem over imaginary quadratic F…".
     - **rigidifying-prime:** "…for an odd absolutely irreducible continuous ρ̄ : G_ℚ → GL₂(k), unramified at p, of prime-to-p conductor N".
     - **localized-three-primary-stabilizers:** "…at the levels Y₀(Q), Y_Δ(Q) of ArithmeticLocallySymmetricSpaces ALS.0.10(iv)…".
   - **Test.** No rewritten sentence contains a bare section number, so none collides with a supplier's section.

4. **F04** (P2) The selected-root comparison is imported without its supplier's Galois hypothesis

   - **Location.** README line 201 and §9.2, line 1147: "The residual Galois-type hypothesis is supplied by the association of m to ρ̄".
   - **Claim.** AutomorphyLiftingBeyondTaylorWiles target BT.3/lemma-9-6 needs only that m is associated to ρ̄.
   - **Witness.** That roadmap's design (board main) states "Lemma 9.6: condition (5) of Conjecture B for n = 2" under B^gal, whose part (ii) requires a lift over the localized anaemic Hecke algebra.
   - **Repair.** Take one of these two routes:
     - (a) Declare a supplier gap at AutomorphyLiftingBeyondTaylorWiles BT.3, for example "prove BT.3/lemma-9-6 assuming only part (i) of B^gal", with a README contract and a `plan.json` `gaps` entry, and cite it in §9.2's Needs line.
     - (b) Prove §9.2 here, as CG18 Lemma 5.8 does: use ALS.3.14's one-copy splitting at Taylor–Wiles primes, then eliminate the complementary summand by the CG18 Lemma 3.5 argument.

     Do not make §9.2 conditional on Conjecture A, because CG18 Lemma 5.8 is unconditional. Correct line 201 to match.
   - **Test.** The BT.3 proof steps use residual data only, so route (a) is a statable contract. At roots 2 and 4 mod 7:
     - the ALS.3.14 determinant is (1+1)² − 6² = 3 = −(2−4)², a unit;
     - U_{x²} − 1 ≡ α² − 1 = 3, also a unit.

5. **F05** (P2) Localized boundary vanishing has two sources, one cited without its hypotheses

   - **Location.**
     - README §9.3, line 1159: "use the ordinary/Borel–Moore comparison of ArithmeticLocallySymmetricSpaces §ALS.4.12(b)".
     - The gap contract, line 195: "prove H₃(Y_?(Q),k)_m = 0 and Hᵢ(∂Y_?(Q),k)_m = 0 for every i≥0".
   - **Claim.** §9.3 holds for every p ≥ 3 from ALS.4.12(b), while p = 3 needs boundary vanishing again from the gap.
   - **Witness.** ALS.4.12 (head 7dca7ea) assumes ♠ and a neat level for all variants; Y₀(Q) is not neat. At p = 3 unramified in F, F ≠ ℚ(√−3), so cusp-stabilizer torsion has order dividing |O_F^×| ∈ {2,4}.
   - **Repair.**
     1. Delete "and Hᵢ(∂Y_?(Q),k)_m = 0 for every i≥0" from gap:localized-three-primary-stabilizers, in the README and in `plan.json`. Keep the H₃ clause: PGL₂(O_F) has elements of order 3.
     2. In §9.3, either show how ALS.4.12(b)'s hypotheses hold at Y₀(Q) and Y_Δ(Q), or declare a separate gap at ArithmeticLocallySymmetricSpaces ALS.4. That gap would ask for CG18 Lemma 5.9(3) at these non-neat levels, for every p ≥ 3 unramified in F, with no Galois-type hypothesis. ♠ for the torus Levi is class field theory. Cite the chosen source in §§9.3–9.4.
   - **Test.** For F = ℚ(i) and p = 3, the boundary torsion element [[i,0],[0,1]] has order 4, prime to 3. So the source's torus argument for Lemma 5.9(3) works unchanged at p = 3.

6. **F06** (P3) Read literally, §10.1 drops Conjecture A at p = 3

   - **Location.** Line 1201: "Assume Conjecture A for all Q_a and p≥5, or assume gap:localized-three-primary-stabilizers for p=3."
   - **Witness.** The patching system needs the Conjecture A surjections R_{Q_a} ↠ T_{Q_a,m} at every p (proof of CG18 Theorem 5.11, cg18 lines 3354–3356). §10.2 keeps Conjecture A.
   - **Repair.**
     - Rewrite the sentence as: "Assume Conjecture A for all Q_a, and either p ≥ 5, or p = 3 with the vanishing of gap:localized-three-primary-stabilizers."
     - Add that slug to §10.1's Needs line.

7. **F07** (P3) Needs lines and layer Dependencies are out of step after the repair

   - **Location.** Layer 8 Dependencies (line 1115) lists only "ArithmeticLocallySymmetricSpaces §§ALS.0.1–ALS.0.9 (quotients and stabilizers)".
   - **Witness.**
     - §§8.2–8.3 Needs lines (1045, 1068) now cite ALS.0.10 and ALS.4.10.
     - Layers 4 and 6 Dependencies (lines 681, 899) omit the Tau Ceti newform names cited in §§4.3, 4.4, 6.4.
     - The §1.1 Needs line (line 331) lists `Matrix.det_fin_two` twice.
   - **Repair.**
     - Add ALS.0.10 and ALS.4.10 to the Layer 8 Dependencies.
     - Add the three `HeckeRing.GL2.*` names to the Layer 4 and Layer 6 Dependencies.
     - Drop the duplicate entry in §1.1.

8. **F08** (P3) §§4.4–4.5 attach the Lean names to no-vexing statements

   - **Location.**
     - Line 644: "Assume the no-vexing … Then `minimal_weight_one_modularity` realizes ρ".
     - Line 661: "Under the no-vexing … `minimal_lift_finite_image` says".
   - **Witness.** The Lean signatures (`Suggested.lean` lines 128–173) have no no-vexing hypothesis, and `IsMinimalLift` contains the vexing injectivity clause. §6.5 (line 883) says the names include vexing lifts.
   - **Repair.** In §§4.4–4.5 write "the no-vexing case of `…`", and attach the full names only in §6.5.

9. **F09** (P3) Two gaps could be narrowed to what is actually missing

   - **Location.** Lines 181 (gap:jacobian-residual-isotypy) and 159 (gap:rigidifying-prime).
   - **Witness.**
     - IntegralHeckeAndGaloisDeterminants §1.6, "Cayley–Hamilton recognition of isotypic modules", together with ModularCurvesPartII §17.2 (Eichler–Shimura relation), gives J₁(N*)[m] ≅ ρ̄^r.
     - Tau Ceti's `hasDirichletDensity_frobeniusPrimeSet` (`TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.lean:51`) gives r as in cg18 lines 1153–1166.
   - **Repair.**
     - Narrow the isotypy gap to the Eichler–Shimura annihilation of J₁(N*)[p^∞]_m by the Hecke-valued determinant, or replace it by those two citations.
     - Choose the rigidifying prime in §0.1 from Tau Ceti's Chebotarev theorem.

10. **F10** (P3) An unsourced result is filed as a supplier contract

   - **Location.** Line 195, and References line 1317: "The source does not establish the variable-determinant scalar comparison, localized 3-primary stabilizer vanishing or integral principal-type model".
   - **Witness.** §§9.3 and 10.1 already treat the p = 3 vanishing as an assumption: "Assume p ≥ 3 and gap:localized-three-primary-stabilizers when p = 3".
   - **Repair.** Either cite a source for localized 3-primary vanishing, or state it as a named hypothesis of the p = 3 Bianchi statements, as Conjecture A is stated. Keep as a gap only what ArithmeticLocallySymmetricSpaces can prove from its sources. The brief's list of gap findings has no class for this, so it is not graded as blocking.

11. **F11** (P3) Details of the Suggested.lean docstring and form

   - **Location.** `Suggested.lean` lines 26–27: "missing the modular Jacobian, full Hecke ideal, ordinary eigenvalue-adorned global ring and variable-determinant type-three comparison". Also the section comment at line 46.
   - **Witness.**
     - J₁(N*)[m] ≅ ρ̄⊕ρ̄ needs only the Jacobian with Hecke and Galois actions; the ring and comparison are proof inputs.
     - Tau Ceti's `ModularSymbols`/`heckeTAlgebra` (`…/ModularSymbols/Hecke/Finite.lean:54`) go unmentioned.
     - README Layer 4 is "Minimal weight-one R = T".
   - **Repair.**
     - Name only the missing statement carriers: J₁(N*) and the Galois action on its torsion.
     - Say why mod-p modular symbols do not state the multiplicity at the pins: they carry no Galois action and no comparison with J₁(N*)[m].
     - Retitle the section comment to match the README.

All 13 round-1 findings are repaired: F03, F04 and F06 by a different route, each sound. The repairs introduced or exposed five blocking defects:

- R01: the new headline predicates re-plan notions that Mathlib and ClassicalSerreModularity already state, and one shadows Mathlib's name.
- R02: the modularity headline is stated only in its normalized form, although README §6.5 claims the twist-general form.
- R03: four gap contracts point to this roadmap's sections by bare number.
- R04: §9.2 imports the BT.3 comparison without that target's Galois hypothesis.
- R05: localized boundary vanishing has two sources, and one is cited without its hypotheses.

Six P3 notes follow. `Suggested.lean` elaborates with only the two expected `sorry` warnings. The dependency check is clean. All 15 sampled locators are supported by the source.

## Verified sound

### Repair check of the round-1 findings

| Id | Repaired passage (quoted ≤ 40 words) | Status |
|---|---|---|
| F01 | Line 418: "The printed matrix [[Tₚ,1],[−⟨p⟩,0]] equals the column-action matrix here exactly when ⟨p⟩ = 1. At Tₚ = 0 and ⟨p⟩ = 3 … (0,1) to (3,0) … (1,0)". Recomputed: second columns (3,0) and (1,0); at ⟨p⟩ = 1 both are [[T,1],[−1,0]]. | repaired |
| F02 | `Suggested.lean` lines 128–173 state `minimal_weight_one_modularity` and `minimal_lift_finite_image` with eight real-bodied predicates. The old docstring sentences are gone. | repaired; new defects R01, R02 |
| F03 | Line 1026: "Use the projective congruence subgroups of ArithmeticLocallySymmetricSpaces §ALS.0.10(ii)". Line 1049 cites `LocallySymmetric.IsEisensteinCG`. Line 1121 cites ALS.0.10(iv). Line 1159 cites ALS.4.12(b). Line 1147 cites BT.3/lemma-9-6, which exists in the design on board main (anchor `bt-bt-3-lemma-9-6`). | repaired differently; new defects R04, R05, R07 |
| F04 | Line 193: "Tor_i^(O[Δ])(H_j(Y_Δ,O),O) ⇒ H_(i+j)(Y₀,O)… This derived consequence needs no extra duality or edge-map supplier contract." The edge sequence was recomputed: E²_{2,0} = 0 once localized H₀ = 0. ALS.5a.6 needs only K′ neat and normal with \|K/K′\| invertible, which holds over K. | repaired differently, sound |
| F05 | Eight single-deliverable slugs replace the four compound ones. All 17 README contracts match `plan.json` `gaps` in slug, supplier and text (checked by script). Only `gaps` changed in `plan.json` since the previous head. | repaired |
| F06 | Line 195 now names the groups, the degrees and the residual hypothesis. | repaired; new defects R03 (bare §9.1) and R05 (boundary clause) |
| F07 | Gap slugs now appear on the Needs lines of §§0.1, 1.1, 1.3, 1.4, 3.5, 4.1, 4.3, 4.4, 6.3, 7.2, 7.4, 7.5, 8.1, 8.2, 8.4, 9.3, 9.4, 10.1 and 10.4. Line 964 reads "Use gap:jacobian-residual-isotypy". | repaired (§10.1 omission: R06) |
| F08 | Line 1244 cites DeformationAndDerivedPatchingAlgebra §§3.4–3.5. Its §3.5 (head a3b5dea) gives exactly the parameter criterion: with A = O, r = q−1, t = q and dim B ≤ 0, the list is regular. No "request" wording is left. | repaired |
| F09 | Line 653: "At v ≡ 1 mod p take residual inertia χ̄ ⊕ 1 … Teich(χ̄)ψ ⊕ 1 with ψ of order p". At p = 3, v = 7, χ̄ = −1 the determinant is −ζ₃, and (−ζ₃)² ≠ 1. | repaired |
| F10 | Line 1216: "The variable count uses the dual Selmer group of ad⁰ρ̄(1)." Matches cg18 line 2986. | repaired |
| F11 | Pointers 870, 1925, 1957 and 3126 are on pp. 318, 343, 344 and 374. All 63 cg18 pointers in the README fall on their cited pages (checked by script). | repaired |
| F12 | Lines 205 and 1300 read "Layers 11–12". On main, ClassFieldTheory Layer 11 is "the global class formation and global Artin reciprocity" and Layer 12 covers "global existence, the norm index, and the global correspondence". | repaired |
| F13 | Line 107 lists the Tau Ceti contracts. Checked at the pin: `Newform` (`Newforms/Newform.lean:104`, nonzero, new, a₁ = 1), `eq_of_forall_prime_eigenvalue_eq` (`StrongMultiplicityOne.lean:96`, equal χ and good-prime eigenvalues), `IsEigenformAwayFromLevel` (`Eigenform.lean:65`; the zero form satisfies it). | repaired |

### Elaboration, binder audit and probes

- **Elaboration.** `lake env lean` on `Suggested.lean` from the content checkout exits 0. The only warnings are two "declaration uses `sorry`", at lines 128 and 155. There is no `set_option`, no `lemma`, a single `import Mathlib`, and the one Tau Ceti module actually used.
- **Binder audit.** A scratch copy with `#check @name` for all 10 declarations elaborated. Every binder in the README statements survives: ring, local, Noetherian, completeness, finiteness, characteristic, residue-compatibility and continuity. No change was needed.
- **One-tactic probe.** Both theorems were tried with `first | rfl | trivial | infer_instance | simp | (intros; simp_all)`. Neither closes ("simp_all made no progress"), so there is no padding among the theorems. The eight definitions are needed to state the two headlines.

### Dependency check

```text
depcheck: 50 roadmaps, 586 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. `roadmaps resolve` reports no unresolved citation. The worker's single lead, `LocallySymmetric.IsEisensteinCG`, is ALS.4.10's API name at head 7dca7ea; it is planned in a README and is not a pinned declaration.

### Seeded source sample (15/15 supported; hypotheses match or the README records a correction)

| Target | Locator checked (cg18 lines) | Result |
|---|---|---|
| 0.4 | §3.2.4, lines 1029–1064: Φ∘T_x = x^{1−n}T_x^∨∘Φ, Ψ = Φ^∨, T-linear at n = 1 | supports the README's dualized identity |
| 1.2 | Lemma 3.5, lines 856–900: det = −(α−β)² | supported |
| 1.4 | Proposition 3.8 proof, lines 1076–1103 | supported; quadrant misprint below |
| 1.5 | Proposition 3.8, lines 1065–1110 | supported |
| 2.3 | §§3.3–3.4, lines 1295–1342 (T_n^an, T_n, T̃_n, image T_{n,m_α}) | supported |
| 3.3 | Lemma 3.24 and Definition 3.25, lines 1662–1689 | supported |
| 3.5 | Theorem 3.11, lines 1178–1207; T_p ∈ T at lines 1436 and 1695 | supported |
| 4.2 | Theorem 3.26, lines 1706–1754 | supported |
| 5.3 | Lemma 3.27(1)–(2), lines 2007–2076 (inertia of order prime to p) | supported |
| 6.1 | Theorem 3.30 steps (1)–(2), lines 2191–2222 | supported (README avoids the transitivity claim) |
| 7.2 | Proof of Theorem 4.8 and Lemma 4.11, lines 2662–2770 | supported with the recorded corrections |
| 7.5 | Theorem 4.8, Remarks 4.9 and 4.12, lines 2597–2606, 2807–2812 | supported (p ≠ 3, not induced from ℚ(√−3)) |
| 9.1 | §5.3.1, lines 3219–3234 | supported |
| 9.3 | Lemma 5.9, lines 3235–3267 | supported with the p = 3 correction |
| 10.1 | Propositions 5.1–5.2 (lines 2960–2998); proof of Theorem 5.11 (lines 3333–3369) | supported |

The new locators also check out:

- Definition 3.1 and §3.1, lines 569–595: the predicates match clauses (1)–(4), with vexing and reducibility read over k̄.
- Corollaries 1.5–1.6, lines 305–329.
- Lemma 4.14, lines 2823–2874: supports §4.5's reducedness route.

### Cross-roadmap citations resolved (at their heads or on main)

Every cited section exists at the head listed below:

- ArithmeticLocallySymmetricSpaces (7dca7ea): ALS.0.8, ALS.0.10(ii),(iv), ALS.3.14, ALS.4.10, ALS.4.12, ALS.5a.6, ALS.6.1–6.3, ALS.5b.5–5b.8.
- AutomorphyLiftingBeyondTaylorWiles: BT.3/lemma-9-6 in its design on board main 6743627.
- DeformationAndDerivedPatchingAlgebra (a3b5dea): §§3.1, 3.4, 3.5, 3.9, 5.1, 5.5.
- LocalGaloisDeformationRings (11b2c65): §§2.1–2.5, 2.19, 4.1, 6.7, 6.18, 7.5.
- GlobalGaloisDeformations (b0adf32): §§3.3–3.7, 5.1–5.8, 6.2–6.8 and Layer R04.6.
- AlgebraicModularFormsAndSerreWeights (4e550b1): R15.1–R15.3, including "Eisenstein boundary eigensystems", "Weight-one T_p with torsion coefficients" and "Twisted duality and the supersingular boundary".
- IntegralHeckeAndGaloisDeterminants (1383569): §§1.3, 2.1–2.2.
- AutomorphicGaloisRepresentations (81e9d0f): §§2.8–2.10, 3.7, 4.1–4.6, 5.1, 6.8–6.12.
- GL2AutomorphicRepresentationsAndTransfer (69bcab7): R16.2.7, R16.2.11, R16.3.9, R16.4, R16.6.5–6.6.
- SerreWeightAndLevelOptimisation (c9bed25): §§3.4, 3.10–3.13.
- GL2ModularityLifting (1e734ab): §§3.7, 4.1–4.2.
- ClassFieldTheory (main): Layers 7, 11, 12.

Part I is imported by name and section. Part II does not re-plan Part I's patching or its integral comparison.

### Pinned declarations opened

- Mathlib:
  - `ValuationSubring.decompositionSubgroup` and `inertiaSubgroup`, `Mathlib/RingTheory/Valuation/RamificationGroup.lean:29,49`. The inertia subgroup is the kernel of the action on the residue field, consistent with the README.
  - `Field.absoluteGaloisGroup`, `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42`.
  - `IsArithFrobAt`, `Mathlib/RingTheory/Frobenius.lean:183`.
  - `Ideal.inertia`, `Mathlib/RingTheory/Ideal/Defs.lean:154`.
  - The `integralClosure` Galois action, `Mathlib/RingTheory/IntegralClosure/Algebra/Basic.lean:259–275`.
  - `Representation.invariants`, `Mathlib/RepresentationTheory/Invariants.lean:73`.
  - `Matrix.charpoly` and `Matrix.aeval_self_charpoly` (`Charpoly/Basic.lean:132,214`), `Matrix.det_fin_two` (`Determinant/Basic.lean:809`).
  - `groupHomology.indIso` (`Shapiro.lean:65`).
  - `ModularForm` and `CuspForm` (`ModularForms/Basic.lean:72,80`).
- Tau Ceti:
  - `TauCeti.MonoidAlgebra.augmentation` and `augmentation_single` (`Algebra/MonoidAlgebra/Exactness.lean:115,120`).
  - The newform API listed under F13.
  - `hasDirichletDensity_frobeniusPrimeSet` (`NumberTheory/Chebotarev/Density/Chebotarev.lean:51`), which uses Mathlib's `IsArithFrobAt`.

### Adversarial pass (passages changed or added by the repair, and the sampled targets)

Rows for untouched passages rely on the round-1 table, every row of which carries computed values.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| `IsPlaceAbove` | 3-adic extension; trivial valuation; labels 0, 1, 5 | ringChar 3 accepts 3 and rejects 5; trivial valuation has ringChar 0; 0 and 1 not prime | correct | R01 (redundant with ideals) |
| `IsUnramifiedAt` | trivial ρ; diag(ζ₃,1); ℓ = 1 | I₂ on inertia; ζ₃ ≠ 1 is ramified though it reduces to 1; no v over 1, so vacuous | correct | R01 (carrier) |
| `IsArithFrobAt` | 𝔽₂₇ = 𝔽₃[t]/(t³−t−1) | Frob: t ↦ t³ = t+1; inverse: t ↦ t⁹ = (t+1)³ = t+2 | correct, but duplicates Mathlib | R01 |
| `IsAdicallyContinuous` | field; O[ε]/ε² | m = 0 gives the discrete topology; m² = (π², πε) | correct | none |
| `IsReducibleOn` | diagonal; S₃ standard over 𝔽₅; H = 1 | line e₁; the 3-cycle eigenvalues ω, ω² ∈ 𝔽₂₅ ∖ 𝔽₅ are swapped by the transposition, so no line; every line for H = 1 | correct | none |
| `inertiaInvariants` | I₂; diag(u,1) with u−1 a unit; ℤ/9 with diag(4,1) | rank 2; Ae₂; 3a = 0 gives 3Ae₁⊕Ae₂ of cardinality 27 ≠ 9 = \|A\| | correct | R11 (optional) |
| `IsWeightOneResidual` | p = 3 complex conjugation diag(1,−1); diagonal ρ̄; p = 2; k-irreducible but k̄-reducible D_x (p = 3, x = 5, order-4 χ in 𝔽₉) | det = −1 ≡ 2; has an invariant line; 2 < 3; the k̄ convention excludes this ρ̄ (ρ̄^{I_x} = 0), matching CG18's twist remark (cg18 lines 576–578) | correct | none |
| `IsMinimalLift` | ℤ/9 with det lift 4; Teich(χ̄)ψ⊕1 at p = 3, v = 7; vexing new inertia | 4² = 7 ≠ 1 rejected, 1² = 1 accepted; (−ζ₃)² = ζ₃² ≠ 1 rejected; two elements over I₂ break injectivity | matches Definition 3.1 | none |
| `minimal_weight_one_modularity` | good Frob diag(2,3); ρ₀⊗ψ² (ψ cubic, conductor 7, p = 3) | a_ℓ = 5, χ(ℓ) = 6 (inverse: 5/6, 1/6); (det ρ)² = ψ² ≠ 1, so `hmin` fails although §6.5 covers it | true; narrower than README | R02 |
| `minimal_lift_finite_image` | A = k; A = O[ε]/ε²; torsion ideal of size s | finite image; {I+aεE₁₂} infinite without rigidity; fibre ≤ s⁴ | true | R02 (alignment) |
| §2.1 Check | T = 0, ⟨p⟩ = 3; ⟨p⟩ = 1 | (3,0) vs (1,0); equal at 1 | correct | F01 done |
| Line 193 HS edge | E²_{i,0} = 0 | H₂(Y_Δ)_Δ → H₂(Y₀) → Tor₁ → 0, with E^∞_{1,1} = E²_{1,1} | correct | none |
| §9.2 | roots 2, 4 mod 7 | αβ = 8 ≡ 1; −(2−4)² ≡ 3; (1+1)² − 6² = −32 ≡ 3; α²−1 = 3 | correct mathematics; hypothesis mismatch | R04 |
| §9.3 boundary, p = 3 | F = ℚ(i); F = ℚ(√−3) | [[i,0],[0,1]] of order 4; 3 \| disc(ℚ(√−3)) = −3, so excluded | not a 3-primary issue | R05 |
| §9.3 H₃, p = 3 | point with stabilizer C₃ | dim H₃(C₃,𝔽₃) = 1 vs coarse 0 | gap clause justified | none |
| §9.4 | Δ = 1, M = Oʳ⊕kˢ | Tor₀ = r+s, Tor₁ = s, d = r | correct | none |
| §10.1 | q = 1; literal p = 3 reading | A∞ = O; Conjecture A missing at p = 3 | wording | R06 |
| §10.3 | q = 1, f = π² | dim B = 0 ≤ 1+0−1, so regular; length 2; CI | correct (DDPA §3.5) | none |
| 0.4 sample | n = 2, x = 2, eigenvalue 2; n = 1 | homological 2⁻¹·2 = 1; scalar 1 | correct | none |
| 1.2 sample | 𝔽₅, x ≡ 1, α = 1, β = 2; α = β = 1 | det[[2,3],[3,4]] = −1 ≡ 4 = −(1−2)²; det 0 | correct | none |
| 1.4–1.5 sample | Δ = 1; C_p acting on k; M = O/π | Tor₁ = 0; Tor₁ = k; 1−1 = 0 = 0−0 | correct | none |
| 2.3 sample | O×O → O; O/π² | image O; π ≠ 0 | correct | none |
| 3.3 sample | c = 2, U = 6 over 𝔽₇ | 2⁻¹ = 4, 4·6 ≡ 3 | correct | none |
| 3.5 sample | ℤ/9; mod 4 | 7² = 49 ≡ 4 with 7 ≡ 1 (mod 3); 1² ≡ 3² ≡ 1 (mod 4) | correct | none |
| 5.3 sample | e = 5, i = 2 | q²O[[q⁵]] and q²k[[q⁵]], both rank 1 | correct | none |
| 6.1 sample | (1,χ), (χ,1), n = 1, χ(x) = −1 | 1+(−1) = 0 and −1+1 = 0 | correct | none |
| 7.2 sample | k[x,y,z]/m²; k[ε]/ε⁴; (ψ,1), (1,ψ⁻¹) | length 4 with socles 3 and 1; both normalize to (ψ^{1/2},ψ^{−1/2}) | correct | none |
| 7.4 isotypy | Gross bounds 3 ≤ d ≤ 4 | evenness gives 4, so multiplicity 2 | correct | R09 (narrow gap) |
| 7.5 sample | [[1,1],[0,1]] vs I | both X²−2X+1; multiplicities 1 and 2 | correct | none |
| 9.1 sample | O[C₃] | rank 3; coinvariants rank 1; augmentation [g] ↦ 1 | correct | none |
| 17 gap contracts | slug, supplier, section and text vs `plan.json` | 17/17 identical; suppliers earlier in ORDER.txt (lines 29–281 vs 289) | declared | R03, R05, R09, R10 |

### Headline theorems and padding

- The README's headlines:
  - torsion weight-one local–global compatibility (§§3.4–3.5);
  - minimal weight-one R = T without and with vexing types (§§4.2, 6.4);
  - conductor rank one (§4.3);
  - weight-one modularity (§§4.4, 6.5);
  - finite image (§§4.5, 6.5);
  - scalar multiplicity two (§7.4);
  - Bianchi R = T, complete intersection, generic rank and lifting (§§10.2–10.5);
  - balancedness (§§1.5, 9.4).
- Modularity and finite image are stated, subject to R02.
- Every other headline is named in the module docstring with its missing carrier: Katz forms, R^min, J₁, Bianchi Hecke homology.
- At the pins I found no deformation ring, modular Jacobian, Katz form or Bianchi Hecke carrier; for modular symbols see R11.
- There is no padding.

### Ownership and duplication

- I searched by object with `roadmaps grep` over main, 354 open roadmap pull requests and the board packages. The objects searched were weight-one finite image, the Frobenius, unramifiedness and absolute-irreducibility predicates, residual isotypy, the Eichler–Shimura relation, and Boston–Lenstra–Ribet.
- The defect-one weight-one, coefficient-bundle, scalar-multiplicity and Bianchi theory has no other owner.
- The duplicates found are R01 (ClassicalSerreModularity, Mathlib) and the narrowing options in R09.
- No declaration of `Suggested.lean` reuses another roadmap's fully qualified name.
- SerreWeightAndLevelOptimisation (head c9bed25; Scope line and §3.11) and AutomorphyLiftingBeyondTaylorWiles still name the consumer "GL2ModularityLiftingDefectOne". That is outside this package.

## Not verifiable

- **CG22** (Correction to CG18): paywalled and recorded as uncertified. The pp. 855–856 locator was not read.
- **AutomorphyLiftingBeyondTaylorWiles package README.** Its pull-request head is not in the board-package index, so BT.3/lemma-9-6 was resolved in its design on board main. The package's numbering or hypotheses may differ.
- **Localized 3-primary H₃ vanishing.** Whether it holds at p = 3 is not settled. CG18 does not establish it (see R10).
- **§6.4's σ/σ\* swap** relative to CG18 Theorem 3.30. Carried over from round 1; not settled.
- **ALS.4.12's internal consistency.** Its main statement assumes a neat level, while variant (b) sits at Y₀(Q). This is a question for ArithmeticLocallySymmetricSpaces and is noted only as the witness of R05.

## Source issues

- **Misprint** in cg18 at Proposition 3.8, proof, p. 323: the source calls the Hochschild–Serre spectral sequence of the diamond cover second-quadrant; it should be first-quadrant, its Pontryagin dual being the third-quadrant sequence used next; affects nothing.
- **Misprint** in cg18 at Theorem 3.11, proof, p. 328 (repeated in Lemma 3.16, p. 332): the printed U_p matrix is the one for the basis (φ, V_p); with the stated ψ = (φ, φT_p − U_pφ) it should be [[T_p, ⟨p⟩],[−1, 0]] on columns; affects nothing.
- **Misprint** in cg18 at Theorem 3.30, proof step (2), p. 351: the source refers to Proposition 3.7(2); it should be Lemma 3.7(2); affects nothing.
- **Misprint** in cg18 at Theorem 5.11, proof, p. 379: the source defines q from the Selmer group of the untwisted adjoint; it should use the dual Selmer group of the Tate-twisted adjoint, as in Proposition 5.2; affects nothing.
- **Misprint** in cg18 at Theorem 5.11, proof (b), p. 380: the Tor term of the spectral sequence lacks its second argument; it should be Tor over S_N of the homology with O; affects nothing.
- **Error** in cg18 at §3.8, final paragraph, p. 340: the source says U_x vanishes whenever x² divides N; with residual χ̄ ⊕ 1 and χ̄ wildly ramified, x² divides N yet U_x is a nonzero Frobenius scalar on the invariant line; affects the proof.
- **Gap** in cg18 at Lemma 5.9(1), proof, p. 377: the source asserts that H₃ of Y₀(Q) with residual coefficients vanishes; with order-3 stabilizers and p = 3 orbifold homology need not vanish in degree 3; it should assume p ≥ 5 or prove localized vanishing; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f34aeca", "job": "REV-PKG-GL2ModularityLiftingPartII~2", "model": "opus", "worker": "fable-rev103"} -->
