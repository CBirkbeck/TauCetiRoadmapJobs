<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1225#issuecomment-6389196909 -->
Review (claude) of bfc6e86

Verdict: needs changes

1. **F01** (P1) False Check: the diamond test does not separate the README matrix from the source's printed one

   - **Location.** `packages/GL2ModularityLiftingPartII/README.md` line 340, §2.1 Checks: "The matrix has upper-right diamond and lower-left −1; checking a diamond value different from −1 must distinguish it from the source’s swap."
   - **Claim.** Every diamond value ≠ −1 separates the README matrix `[[Tₚ,⟨p⟩],[−1,0]]` from the source's matrix.
   - **Witness.** The source prints `[[Tₚ,1],[−⟨p⟩,0]]` (cg18 lines 1273–1274, proof of Theorem 3.11, p. 328; again in Lemma 3.16, cg18 line 1452). The two matrices are equal exactly when ⟨p⟩ = 1, and 1 is a value "different from −1". So at ⟨p⟩ = 1, T = 0 both are `[[0,1],[−1,0]]` and the test separates nothing.
   - **Repair.** Replace the bullet with: "The source prints `[[Tₚ,1],[−⟨p⟩,0]]`. That matrix equals this one exactly when ⟨p⟩ = 1, so the test must use a diamond ≠ 1. At ⟨p⟩ = 3, T = 0 this matrix sends (0,1) to (3,0), and the printed one sends it to (1,0)." Tested: at ⟨p⟩ = 1 the two matrices coincide; at ⟨p⟩ = 3 their second columns are (3,0) and (1,0).

2. **F02** (P2) Two headline theorems can be stated at the pins but are absent from Suggested.lean

   - **Location.** `packages/GL2ModularityLiftingPartII/Suggested.lean` lines 18–20 say the headline is not statable because it is "missing the local inertial minimality functors and the preceding universal arithmetic ring". Lines 39–40 say native complex modular forms "do not supply … the specified actions".
   - **Claim.** CG18 Corollary 1.6 (README §4.5, with its vexing version in §6.5) and Corollary 1.5 (README §4.4) cannot be stated at the pins.
   - **Witness.** Neither statement mentions the universal ring. Every carrier exists at the pins:
     - `Field.absoluteGaloisGroup`: `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42`.
     - `ValuationSubring.decompositionSubgroup` and `ValuationSubring.inertiaSubgroup`: `Mathlib/RingTheory/Valuation/RamificationGroup.lean:29,49`.
     - `HeckeRing.GL2.Newform N 1`: `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104`, with Hecke action `IsEigenformAwayFromLevel` at `TauCeti/NumberTheory/ModularForms/Eigenform.lean:65`.
     - `UpperHalfPlane.qExpansion`.

     Two scratch files defined "unramified at ℓ" and "arithmetic Frobenius at v" from these carriers and stated `(Set.range ρ).Finite` and "∃ weight-one newform with matching Frobenius traces". Both elaborated under `lake env lean` (exit 0; `sorry` was the only warning).
   - **Repair.**
     1. Add `theorem`s for CG18 Corollary 1.6 (finite image of minimal deformations to complete Noetherian local O-algebras with residue k) and CG18 Corollary 1.5 (a minimal lift unramified at p comes from a weight-one newform).
     2. Give them real-bodied predicates: `IsUnramifiedAt` (via `ValuationSubring.inertiaSubgroup`), `IsArithFrobAt`, 𝔪-adic continuity, and `IsMinimalLift`, which states CG18 Definition 3.1 (1)–(4): determinant values of order dividing |k|−1 (the Teichmüller lift), unramified outside S(ρ̄), reduction injective on ρ(I_x) at vexing x, and ρ^{I_x} a rank-one direct summand. Include the standing hypothesis ρ̄^{I_x} ≠ 0.
     3. Delete the two inaccurate docstring sentences, and backtick the new names in §§4.4, 4.5 and 6.5.
     4. If the author still judges a predicate unstatable, the docstring must name the specific missing carrier. The probes show it is not the inertia subgroup, the Frobenius element or the weight-one Hecke eigenform.

3. **F03** (P2) Statements owned by ArithmeticLocallySymmetricSpaces and AutomorphyLiftingBeyondTaylorWiles are restated

   - **Location.** All in `packages/GL2ModularityLiftingPartII/README.md`:
     - line 947 (§8.2): "Define Γ₀(v^c), Γ₁(v^c), Γ_p(v^c) in PGL₂(O_(F_v)) by normalized matrices [[1,*],[0,d]]".
     - line 1042 (§9.1): "set Δ_Q=∏(O_F/x)×, choose a p-power quotient Δ, and let Y_Δ(Q)→Y₀(Q)".
     - line 970 (§8.3): "An ideal is Eisenstein if T_λ≡2 at almost all primes splitting".
     - line 1081 (§9.3): "H_i(Y₀(Q),μ)_m≅H_i^(BM)(Y₀(Q),μ)_m for every i".
     - line 1065 (§9.2): the selected-root comparison.
   - **Claim.** These are new targets of this roadmap.
   - **Witness.** Each is already stated by a roadmap that is earlier in the merge order:
     - ArithmeticLocallySymmetricSpaces ALS.0.10 (ii) and (iv) (`LocallySymmetric.gamma0`, `LocallySymmetric.taylorWilesLevel`) defines the same Γ₀, Γ₁ and Γ_p in PGL₂(O_v), together with K_Δ(Q) and Y_Δ(Q).
     - ALS.4.10 defines CG18's Eisenstein notion as `LocallySymmetric.IsEisensteinCG`.
     - ALS.4.12, variant (b), states CG18 Lemma 5.9(3) for exactly these Bianchi levels.
     - AutomorphyLiftingBeyondTaylorWiles §3.5 (package head 71a36b3) states CG18 Lemma 9.6 for n = 2 over any number field, built on ALS.3.14. Its design assigns this to the present roadmap as an import.
   - **Repair.**
     1. §8.2: delete the Γ-group definitions and cite ALS.0.10(ii). Keep the per-place level choices and the type-P distinction, and add ALS.0.10 to the Needs line, which currently cites ALS.0.1–0.9.
     2. §9.1: cite ALS.0.10(iv) for Δ_Q and Y_Δ(Q), keeping the Shapiro identification.
     3. §8.3: replace the definition sentence with a citation of `LocallySymmetric.IsEisensteinCG` (ALS.4.10).
     4. §9.3: drop the Borel–Moore clause and its route sentence. Cite ALS.4.12(b), and keep H₀ = H₃ = 0 and the torsion-freeness of H₂.
     5. §9.2: cite AutomorphyLiftingBeyondTaylorWiles §3.5 and ALS.3.14, and state here only the homological translation through universal coefficients. B^gal holds because m is associated to ρ̄.
     6. Optionally, §8.4: cite AutomorphyLiftingBeyondTaylorWiles §§2.1–2.2 for the clauses of Conjecture A(1) and A(3) that are the n = 2 cases of B^gal(ii) and B^lgc(2),(6).

4. **F04** (P2) gap:homological-cover-duality asks for a duality the supplier already provides

   - **Location.** README line 123 and the same slug in `design/plan.json` `gaps`: "oriented finite-level Poincaré–Borel–Moore duality for these orbifold quotients when all stabilizer orders are invertible, without requiring an invertible-order neat-cover quotient".
   - **Claim.** ALS.5a.6 cannot supply the duality §§9.3–9.4 use.
   - **Witness.** ALS.5a.6 (`LocallySymmetric.verdierDuality_of_invertibleOrder`) gives Hecke-equivariant duality whenever |K/K′| is invertible in R, for K′ neat and normal of finite index.
     - §9.4 uses duality only for dimensions over K (CG18 Proposition 5.10, cg18 lines 3293–3303). With R = K every such K′ qualifies.
     - At p ≥ 5 it also holds integrally: take full level at an auxiliary v₀ ∤ 6pN with N(v₀) ≡ 2 mod p. Then |PGL₂(k_{v₀})| = q(q²−1) ≡ 6 mod p, which is a unit.
   - **Repair.** Delete the duality clause from this slug in `plan.json` and in README line 123, and cite ALS.5a.6 with R = K in the Needs lines of §§9.3–9.4. Keep the homological Tor edge sequence as a separate one-sentence gap only if it cannot be read off ALS.6.1–6.2 by Pontryagin duality.

5. **F05** (P2) Four gap `needs` sentences bundle independent deliverables for different targets

   - **Location.** README lines 107, 65, 85 and 79, with the same text in `plan.json`.
   - **Claim.** Each is one supplier contract.
   - **Witness.**
     - `gap:jacobian-isotypy-quotient` asks for "full-ideal Jacobian residual isotypy … and the Carayol diamond-quotient comparison". Isotypy is consumed by §7.4 (line 885) and the J_H comparison by §7.5 (lines 897, 901).
     - `gap:coherent-conductor-descent` bundles descent through fine rigidifications (§0.1 line 141, §1.3 line 277) with diamond-cover Cartan–Leray and Tor edge maps (§1.4 line 293).
     - `gap:defect-one-primes` adds "the admissible rigidifying prime" (§0.1) to the Taylor–Wiles sets (§§4.1, 10.1).
     - `gap:minimal-local-classification` bundles CG18 Definition 3.1 minimality over ℚ (§§3.5, 4.4) with the Bianchi S/P/M/H conditions (§8.1).
   - **Repair.** Split each slug into single-deliverable gaps with the same supplier and section:
     - `jacobian-residual-isotypy` / `carayol-diamond-quotient`;
     - `conductor-rigidified-descent` / `diamond-cover-cartan-leray`;
     - `taylor-wiles-sets` / `rigidifying-prime`;
     - `rational-minimal-conditions` / `bianchi-local-types`.

     Update `plan.json` `gaps` and the README contracts together.

6. **F06** (P2) gap:localized-three-primary-stabilizers is vague

   - **Location.** README line 119: "Provide localized 3-primary stabilizer and Farrell-homology vanishing with boundary and duality for the selected cyclotomically absolutely irreducible Bianchi residual systems at every fixed Taylor–Wiles level."
   - **Claim.** A precise supplier contract.
   - **Witness.** The sentence names neither the groups that must vanish nor their degrees nor the duality statement. The consumers need exactly the p = 3 cases of CG18 Lemma 5.9(1)–(3) (README line 1081): H₃(Y₀(Q),k)_m = 0 and Hᵢ(∂Y₀(Q),k)_m = 0.
   - **Repair.** Replace the needs sentence with: "For p = 3, the levels Y₀(Q), Y_Δ(Q) of §9.1 and every non-Eisenstein m associated to ρ̄ with ρ̄|G_F(ζ₃) absolutely irreducible, prove H₃(Y₀(Q),k)_m = 0 and Hᵢ(∂Y₀(Q),k)_m = 0 for all i." Make the same change in `plan.json`.

7. **F07** (P3) Gap dependencies are written as supplied

   - **Location.** README line 885 (§7.4): "Import the Jacobian residual-isotypy theorem from SerreWeightAndLevelOptimisation §§3.4, 3.10–3.13".
   - **Witness.** None of SerreWeightAndLevelOptimisation §3.4 (weight-one unramifiedness) or §§3.10–3.13 states isotypy; that is gap:jacobian-isotypy-quotient. In general the Needs lines of the consuming targets (§§0.1, 1.4, 4.3, 7.2, 7.4, 7.5, 8.2, 9.3, 9.4) never name the gap slug they depend on.
   - **Repair.** In §7.4 write "gap:jacobian-isotypy-quotient (SerreWeightAndLevelOptimisation §§3.10–3.12)", and add the gap slug to each consuming Needs line.

8. **F08** (P3) §10.3 cites the wrong supplier section; process wording in target prose

   - **Location.** README line 1166: "Apply the requested regular-local/CM parameter-sequence criterion". Needs line 1174 cites "DeformationAndDerivedPatchingAlgebra §§3.1, 3.9".
   - **Witness.** The criterion (A complete CM, `B=A[[X]]/(f₁…f_t)` with `dim B ≤ dim A+r−t` ⇒ a regular sequence, and CI is inherited) is DeformationAndDerivedPatchingAlgebra §3.5, with complete intersections in §3.4. The words "requested" and "supplier request" at lines 849, 947, 951 and 1166 are process language.
   - **Repair.** Cite §§3.4–3.5 in line 1166 and in the Needs line. Rephrase lines 849, 947 and 951 as "by gap:…".

9. **F09** (P3) Check at line 575 does not test the case it is meant to

   - **Location.** README line 575: "A diagonal inertial lift diag(ζₚ,1) reduces to diag(1,1) but has a new p-power inertial character."
   - **Witness.** For this lift ρ̄^{I} has dimension 2, so it does not satisfy the "dim ρ^{I_x} = dim ρ̄^{I_x} = 1" premise of line 566. It cannot separate invariant-dimension counting from genuine minimality.
   - **Repair.** Use v ≡ 1 mod p with ρ̄|I_v = χ̄ ⊕ 1, χ̄ of prime-to-p order, and the lift Teich(χ̄)ψ ⊕ 1 with ψ of order p. Both invariant spaces are lines, but det|I_v = Teich(χ̄)ψ ≠ Teich(det ρ̄)|I_v.

10. **F10** (P3) Check at line 1138 is garbled and carries source errata

   - **Location.** README line 1138: "not the untwisted adjoint Selmer group source’s at p. 379."
   - **Repair.** Change the Check to: "The variable count uses the dual Selmer group of ad⁰ρ̄(1). Using H¹ of ad⁰ρ̄ instead changes q in general." The misprint itself goes to the errata register (see Source issues).

11. **F11** (P3) cg18 line pointers point to the wrong page

   - **Location and witness.**
     - README line 238: cg18 line 818 is on p. 316, while the citation is pp. 318–321.
     - Line 635: line 1901 is on p. 342, while §3.9.1 is cited at pp. 343–344.
     - Lines 707 and 726: line 1920 is on p. 343, while pp. 344–345 is cited.
     - Line 974: line 3100 is on p. 373, while pp. 374–375 is cited.
   - **Repair.** Use lines 870, 1925, 1957 and 3126 respectively.

12. **F12** (P3) Global reciprocity is ClassFieldTheory Layer 11, not Layer 12

   - **Location.** README line 127: "Layer 12 supplies global reciprocity, ray-class finiteness and the norm-index/class-field correspondence."
   - **Witness.** ClassFieldTheory on main: "Layer 11: the global class formation and global Artin reciprocity". Layer 12 begins "After global reciprocity is established".
   - **Repair.** Write "Layers 11–12".

13. **F13** (P3) The pinned Tau Ceti classical newform API is not cited

   - **Location.** README "From Tau Ceti" (line 39) cites only the augmentation. §§4.3, 4.4 and 6.4 take global multiplicity one and the weight-one dictionary from GL2AutomorphicRepresentationsAndTransfer.
   - **Witness.** The pin already has:
     - `HeckeRing.GL2.Newform` (`TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104`);
     - `HeckeRing.GL2.Newform.eq_of_forall_prime_eigenvalue_eq` (`…/Newforms/StrongMultiplicityOne.lean:96`);
     - `HeckeRing.GL2.IsEigenformAwayFromLevel` (`…/ModularForms/Eigenform.lean:65`).
   - **Repair.** List these under "From Tau Ceti", with their file paths and their hypotheses (level N, weight k, nebentypus), and cite them for the classical weight-one steps.

Six blocking findings: one false Check (R01), two headline theorems that can be stated at the pins but are missing from `Suggested.lean` (R02), statements that ArithmeticLocallySymmetricSpaces and AutomorphyLiftingBeyondTaylorWiles already own and that are restated here (R03), and three defects in the declared supplier gaps (R04–R06). Seven P3 notes follow. The mathematics is otherwise in good shape. All 15 sampled locators are supported by the source, and I recomputed every numerical Check except the false one (R01) and the mis-aimed one (R09).

## Adversarial pass

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Conventions, reciprocity | φ(Frob)=2 over 𝔽₇ | geometric value 2⁻¹=4; 2·4=8≡1 | sound | — |
| Conventions, T_x formula (Check 178) | j=1,x=2,n=1,d=3,a₂=4,a₀=1 | guarded 4; ℕ-division 4+3=7 | sound | — |
| AMFSW boundary contract | n=1, χ(x)=−1; n=2, x=2 trivial | ∞: 1−1=0, 0: −1+1=0; 1+2=3 | sound | — |
| AMFSW Hasse contract | θ on V₃(q) | over ℤ/9: 3q³≠0; over 𝔽₃: 0 | sound | — |
| AGR ordinary characters | U=2, ⟨p⟩=6 over 𝔽₇ | sub 6/2=3, quotient 2, trace 5, det 6 | sound | — |
| LGDR type-three quotient | k[x,y,z]/m² | length 4, socle 3 (k[ε]/ε⁴: 4, 1) | sound | — |
| ALS stabilizer control | C₃, 𝔽₃ | Hᵢ(C₃,𝔽₃)=𝔽₃ all i; coarse point H₃=0 | sound | — |
| 0.1 level datum | r with ρ̄(Frob_r)=I, r≢1 | ratio 1∉{r,r⁻¹} (cg18 1153–1163) | sound | — |
| 0.2 Hecke datum | (X−1)(X−2) over 𝔽₅ | two distinct factors U−1, U−2 | sound | — |
| 0.3 dual homology | L=ω | H₀(ω)=Hom(H⁰((Ω¹⊗ω⁻¹)_{K/O}),K/O)≅H¹(ω) | sound | — |
| 0.4 Hecke duality | n=2,x=2, eigenvalue 2 | homological 2⁻¹·2=1; n=1 scalar 1 | sound | — |
| 1.1 degeneracy | x=2,T=0,d=3; x=1 | entries 6, −1/2; det[[T,d],[−1,0]]=d; det ψ^∨ψ both forms = x⁻¹(1+x²)αβ−α²−β² | sound | — |
| 1.2 selected root | 𝔽₅, x=1, (1,2); (1,1) | det[[2,3],[3,4]]=−1≡4=−(1−2)²; [[2,2],[2,2]] det 0 | sound | — |
| 1.3 harmless prime | 𝔽₅, x=2, α=β=1; α=2,β=1 | det 2⁻¹·1=3; U=[[2,2],[2,0]], (U−1)²=[[5,10],[10,20]]≡0; α=xβ ⇒ 0 | sound | — |
| 1.4 descent | Δ=1; k over O[C_p] | Tor₁=0; Tor₁=H₁(C_p,k)=k | sound | — |
| 1.5 balancedness | M=O/π, Sʳ, 0 | 1−1=0 vs 0−0; r; 0 | sound | — |
| 2.1 U_p matrix | T=0,d=3 ℚ; T=3,d=2 𝔽₅; d=1 | U(1,0)=(0,−1), U(0,1)=(3,0), U²=−3I; roots 1,2, det 2; equals source matrix at d=1 | sound statement; Check false | R01 |
| 2.2 projections | T=3,d=2 𝔽₅ | eigenvectors (4,1),(3,1); (1,0)=1·(4,1)+4·(3,1) | sound | — |
| 2.3 image algebras | B=O×O; O/π² | image O; π≠0 operator | sound | — |
| 2.4 doubling | a+bU; T=3,d=2 𝔽₅; 𝔽₅[X]/(X−1)² | lower-left −b ⇒ b=0 ⇒ a=0; dims 2 vs 1; dim 2, (X−1)≠0 | sound | — |
| 3.1 Wiese | Jordan J on k²; S₃ std over 𝔽₅ | J−1≠0,(J−1)²=0; irreducible (5∤6); hypotheses = cg18 Lemma 3.17 | sound | — |
| 3.2 global doubling ideal | A=T̃; A→A[X]/(quad) | Ann = unit ideal; quotient AX free, Ann 0; J_loc⊂J_glob (cg18 1681–1685) | sound | — |
| 3.3 local comparison | c=2, U=6 𝔽₇; A⊂A[β]/β² | 4·6=24≡3; quotient Aβ, Ann 0 | sound | — |
| 3.4 three cases | diag(1,2), J, I over 𝔽₅ | (3,2),(2,1),(2,1); eigenspaces 1,2 | sound | — |
| 3.5 Hecke-valued ρ | ℤ/9, p=3; p=2; 𝔽₇ roots 2,3 | √4≡1 mod 3: 7 (7²=49≡4); 1,3 mod 4; 4+5=9≡2≠5 | sound | — |
| 4.1 TW system | q=1; augmentation | A∞=O; [g]↦1 (`augmentation_single`) | sound | — |
| 4.2 R=T | R=T=H=k; H=0 | free rank 1, πH=0; zero action | sound | — |
| 4.3 rank one | k[ε]/ε²; wild χ̄⊕1 with x²∣N | dual m-torsion dim 1 vs length 2; U_x≠0 at x²∣N | sound (better than source) | — |
| 4.4 minimal lifting | diag(ζ_p,1) | ρ̄^I dim 2 ≠ 1 | Check mis-aimed | R09, R02 |
| 4.5 finite image | ideal of size s; O[ε]/ε² | fibre s⁴; {I+aεE₁₂} infinite | sound | R02 |
| 5.1 vexing datum | x≡−1, D_x reducible; T=∅ | not vexing; rank-one trivial lattice | sound | — |
| 5.2 bundles | G=1; μ_e on q | O_X, O_X(−C); χ_i-part q^iO[[q^e]] (cg18 2141) | sound | — |
| 5.3 local freeness | e=5,i=2 | q²O[[q⁵]] rank 1 before and after ⊗k; e prime to p (cg18 2045) | sound | — |
| 5.4 cusp duality | e=5, i=2 and 0 | q⁻²·q⁵=q³; sub q⁵O[[q⁵]] | sound | — |
| 5.5 vanishing | n=2; traces n=0,1,2 | cusp weight 0 vanishes, full weight 0 has constants; 3/2, 2, 3 | sound | — |
| 5.6 type Hecke | d=2 over 𝔽₇ | transpose 4 | sound | — |
| 6.1 boundary with types | x=1 𝔽₅ roots 1,2; (1,χ),(χ,1), n=1 | pairing det 4; traces 0, 0 | sound | — |
| 6.2 contragredient | 𝔽₇, diamond 2, tr 5, det 6 | 2⁻¹=4; 5·6⁻¹=30≡2; Ψ-transport gives tr/det (cg18 2257) | sound | — |
| 6.3 typed Galois | traces; diag(0,1) | 3,2,2; non-equivariant counterexample | sound | — |
| 6.4 typed R=T | diamond 2 𝔽₇ | contragredient 4 | not settled vs source | Not verifiable |
| 6.5 typed finite image | orders a,b,c | ≤abc | sound | R02 |
| 7.1 Φ datum | C₃; C₂ | squaring bijective; kills C₂; N*=Np (cg18 2625) | sound | — |
| 7.2 type three | k[x,y,z]/m², k[ε]/ε⁴; (ψ,1),(1,ψ⁻¹) | socle 3 vs 1; both normalize to (ψ^{1/2},ψ^{−1/2}) | sound (restriction justified) | — |
| 7.3 twisting identity | O[C₃]; O×O vs congruence order | squares 1,g²,g; index |k|, same K² | sound | — |
| 7.4 multiplicity two | Gross bounds | G⁰[m]=type 3, Gᵉ[m]=1; 3≤dim≤4, even ⇒ 4 ⇒ 2 | sound | R07 |
| 7.5 alternatives | J vs I | discriminant 0 both; multiplicities 1, 2 | sound | — |
| 8.1 Bianchi datum | μ_p⊕ℤ/p; Kummer p vs unit; χ·unipotent | flat, ordinary; p non-flat, unit flat; rejected | sound | — |
| 8.2 levels | ψ quadratic; unit scaling | ψ(a²)=1; class preserved | sound; duplicate | R03 |
| 8.3 Hecke data | diamond c≠1; 2-component swap | U ↦ cα; matrix [[0,2],[2,0]] | sound; duplicate | R03 |
| 8.4 Conjecture A | T/I, nilpotent I | contract fails over T | sound | R03 (optional) |
| 8.5 R↠T | 𝔽₇ roots 2,4; (1,1); diamond 3 | αβ=8≡1, f′=5,2; f′=0; 2↦6 | sound | — |
| 9.1 diamond cover | O[C₃] | rank 3, coinvariants rank 1, [g]↦1 | sound; duplicate | R03 |
| 9.2 selected root | roots 2,4 mod 7 | −(2−4)²≡3; ALS form (1+1)²−6²=−32≡3 | sound; duplicate | R03 |
| 9.3 amplitude | C₃ at p=3; torsion orders in PGL₂(F) | dim H₃=1 vs 0; ζ+ζ⁻¹∈ℚ ⇒ n∈{1,2,3,4,6}, groups ∣24 | sound; BM clause duplicate | R03, R06 |
| 9.4 balanced | Oʳ⊕kˢ | Tor₀ r+s, Tor₁ s, d=r | sound | R04 |
| 10.1 TW system | q (Prop 5.1) | q−1≥0 ⇒ q≥1; q=1 ⇒ A∞=O | sound | — |
| 10.2 R=T | T=k, H=k²; H=0 | free rank 2, generic 0; zero algebra | sound | — |
| 10.3 CI | q=1, f=π²; f=0 | O/π² dim 0, length 2; dim 1 fails | sound | R08 |
| 10.4 generic rank | dims 2,3; S-only | 1·2·3=6; 1 | sound | — |
| 10.5 lifting | O-point of π-torsion T | impossible (π≠0 in O) | sound | — |
| 10.6 class group | 𝔽₁₉^×=⟨g⟩, α=g³ | α⁶=g¹⁸=1, α²=g⁶≠1; ranks 3 vs 1 | sound | — |
| Layer 5 example | t=q⁵=u⁷, q=w⁷, u=w⁵ | w⁷/w²=w⁵=u | sound | — |

## Verified sound

- **Seeded sample (15/15 supported at the locator; hypotheses match).**
  - 2.2: CG20 Lemma 8.14 and proof, cg20 lines 2540–2603, pp. 865–866.
  - 3.2: Definition 3.25, cg18 line 1679, p. 338.
  - 3.5: Theorem 3.11, line 1178, pp. 326–327.
  - 4.2: Theorem 3.26, line 1706, p. 339.
  - 4.3: final paragraph of §3.8, lines 1766–1776, p. 340.
  - 5.3: Lemma 3.27(1)–(2), lines 2007–2076.
  - 5.5: Corollary 3.29, line 2163.
  - 6.1: Theorem 3.30(1)–(2), lines 2195–2222.
  - 6.2: Theorem 3.30(3), lines 2223–2285.
  - 7.1: Theorem 4.8 setup, lines 2586–2659.
  - 7.2: Theorem 4.8 proof and Lemma 4.11, lines 2662–2770.
  - 9.1: §5.3.1, lines 3219–3234.
  - 9.2: Lemma 5.8, line 3205.
  - 10.1: Propositions 5.1–5.2 and the proof of Theorem 5.11, lines 2960–3371.
  - 10.3: closing remarks after Theorem 5.11, lines 3372–3375.
- **All cg18 line pointers checked by script.** 60 pointers: 55 on the cited page, 5 off-page (R11).
- **Suppliers resolved at their heads or on main.** Every cited section exists:
  - DeformationAndDerivedPatchingAlgebra §§3.1, 3.9, 5.1, 5.5 (#1034);
  - LocalGaloisDeformationRings §§2.1–2.5, 2.19, 4.1, 6.7, 6.18, 7.5 (#923);
  - GlobalGaloisDeformations §§3.3–3.7, 5.1–5.8, 6.2–6.8, Layer R04.6 (#920);
  - AlgebraicModularFormsAndSerreWeights R15.1–R15.3, including "Eisenstein boundary eigensystems", "Weight-one T_p with torsion coefficients" and "Twisted duality and the supersingular boundary" (#928);
  - IntegralHeckeAndGaloisDeterminants §§1.3, 2.1–2.2 (#785);
  - AutomorphicGaloisRepresentations §§2.8–2.10, 3.7, 4.1–4.6, 5.1, 6.8–6.12 (#1007);
  - GL2AutomorphicRepresentationsAndTransfer R16.2.7, R16.2.11, R16.3.9, R16.4, R16.6.5–6.6 (#931);
  - SerreWeightAndLevelOptimisation §§3.4, 3.10–3.13 (#1013);
  - ArithmeticLocallySymmetricSpaces ALS.0–ALS.6 subsections (#871);
  - GL2ModularityLifting §§3.7, 4.1–4.2 (#1071);
  - ClassFieldTheory Layers 7, 11, 12 (main).

  `roadmaps resolve` reports nothing unresolved.
- **Pinned declarations opened.**
  - `Matrix.charpoly` (`Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:132`) and `Matrix.aeval_self_charpoly` (:214).
  - `Matrix.det_fin_two` (`Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:809`).
  - `groupHomology.indIso` (`Mathlib/RepresentationTheory/Homological/GroupHomology/Shapiro.lean:65`).
  - `ModularForm` and `CuspForm` (`Mathlib/NumberTheory/ModularForms/Basic.lean:72,80`).
  - `TauCeti.MonoidAlgebra.augmentation` and `augmentation_single` (`TauCeti/Algebra/MonoidAlgebra/Exactness.lean:115,120`).

  The README describes each correctly.
- **Supplier order.** The dependency check reports `depcheck: 34 roadmaps, 318 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. Every supplier is on main or earlier in ORDER.txt; this roadmap is line 289 and its latest supplier, AutomorphyLiftingBeyondTaylorWiles, is line 281.
- **Gaps.** All 14 slugs agree between `plan.json` `gaps` and the README contracts, each in the right supplier subsection, and none has supplier `none`.
- **Ownership.** Searched by object with `roadmaps grep` over main, all 338 open roadmap pull requests at their heads, and the board packages. The Wiese criterion, the global doubling ideal, invariant-pushforward type bundles, weight-one torsion local–global compatibility and the scalar multiplicity-two bound have no other owner. The defect-one weight-one and Bianchi theory is deferred to this roadmap by AutomorphyLiftingBeyondTaylorWiles and SerreWeightAndLevelOptimisation, under the name "GL2ModularityLiftingDefectOne"; those suppliers should repoint to GL2ModularityLiftingPartII. The exceptions are in R03.
- **Lean.** `lake env lean` on `Suggested.lean` exits 0 with empty output: no declarations, so no `sorry`, no `set_option`, a single `import Mathlib`, and the correct namespace. With no declarations, the `#check @name` binder audit is empty. The scratch statability files for R02 were elaborated outside the package and left there. There is no padding.
- **README shape.** 54 targets. Every construction has an API list and at least 3 Checks (172 Check bullets in all; all numerical ones recomputed). Every layer has Examples and Dependencies. No LaTeX delimiters and no `lemma`.

## Not verifiable

- CG22 (Correction to CG18): paywalled and recorded as uncertified. Its locator pp. 855–856 (README lines 21, 1241) was not read.
- README §6.4 (line 784) says the homological carrier must swap σ and σ* relative to CG18 Theorem 3.30. I checked that the README's convention is consistent with CG18's duality formula (cg18 line 2226), but did not settle whether CG18's own normalization is wrong.
- README §8.2 (line 947) says the printed Γ_p(v^{2a(ψ)}) level at type-P primes admits non-minimal lifts. Not settled.
- Whether LocalGaloisDeformationRings §§2.3 and 2.9 (CHT minimal ramification, fixed-type quotients) already supply part of gap:minimal-local-classification. Not settled, so it is not raised as "already provided".
- The probes used Mathlib's `ValuationSubring.inertiaSubgroup` rather than `TauCeti.inertiaSubgroup`. The Tau Ceti local-field inertia module has no built object file, and building shared Tau Ceti modules was not permitted.
- AutomorphyLiftingBeyondTaylorWiles §3.5 is cited at its open package head (71a36b3). Its numbering may change in its own repair round.

## Source issues

- **Misprint** in cg18 at Lemma 3.5, proof, pp. 318–319: the source says U_x∘V_x = π₁*⟨x⟩ (twice), although its own count of x subgroups gives x⟨x⟩; it should be U_x∘V_x = x⟨x⟩π₁*, as its matrix A uses; affects nothing.
- **Gap** in cg18 at Lemma 3.5, proof, p. 320: the source derives (1/x)π₁*∘tr(π₁)∘W_x = U_x + (1/x)W_x by cancelling π₁* on the right, citing full faithfulness; it should verify the identity directly by summing over order-x subgroups; affects the proof.
- **Error** in cg18 at Remark 3.4, p. 316: the source says (ℤ/NQℤ)^× acts transitively on the cusps; diamonds preserve whether the level structure meets the identity component, so ∞ and 0 lie in different orbits; it should compute ψ₁(x)+x^{n−1}ψ₂(x) orbit by orbit; affects the proof.
- **Misprint** in cg18 at Theorem 3.11, proof, p. 328 (repeated in Lemma 3.16, p. 332): the source prints U_p as [[T_p,1],[−⟨p⟩,0]] while ψ=(φ,⟨p⟩V_p); it should be [[T_p,⟨p⟩],[−1,0]] on column vectors; affects nothing (same characteristic polynomial).
- **Error** in cg18 at §3.8, final paragraph, p. 340: the source says U_x = 0 whenever x² divides N; for ρ̄|G_x ≅ χ̄⊕1 with χ̄ wildly ramified, x² divides N yet U_x is the Frobenius scalar on the invariant line; it should split by dim ρ̄^{I_x}; affects the proof.
- **Misprint** in cg18 at Theorem 3.30, proof step (2), p. 351: the source refers to Proposition 3.7(2); it should be Lemma 3.7(2); affects nothing.
- **Misprint** in cg18 at Theorem 3.30, proof step (3), p. 353: the source defines m* by β(T_x)=α(⟨x⟩T_x); transport through Ψ (preceding page) gives β(T_x)=α(⟨x⟩⁻¹T_x), the contragredient value tr/det; affects nothing.
- **Error** in cg18 at Theorem 4.8, proof, p. 363: the source says every lift at a non-harmless prime is uniquely twist-equivalent to a conductor-minimal one; at x≡1 mod p with a ramified unipotent residual self-extension, types (ψ,1) and (1,ψ⁻¹) are both minimal and twist-equivalent; it should exclude these primes or use a variable-determinant ring; affects the proof.
- **Error** in cg18 at Lemma 4.11, p. 364: the source lists three non-smooth local rings; at v≡−1 mod p with ramified Steinberg ρ̄|G_v, H⁰(G_v,ad⁰ρ̄(1))∋E₁₂ is nonzero and conductor-two supercuspidal lifts occur; it should add this case and use the Steinberg quotient; affects the proof.
- **Gap** in cg18 at Theorem 4.8, proof, p. 366: the source deduces T_m ≅ T_{1,m}⊗O[Φ] from a rational isomorphism and torsion-freeness; it should prove the integral image is generated (O×O versus the congruence order shows the gap); affects the proof.
- **Gap** in cg18 at Theorem 4.8, proof, p. 366: the source adds dim G⁰[m] and dim Gᵉ[m] to get dim G[m], though m-torsion is only left exact; it should use 3 ≤ dim G[m] ≤ 4 plus ρ̄-isotypy of J₁(N*)[m]; affects the proof.
- **Gap** in cg18 at Corollary 1.5, p. 304: the source's hypothesis (1) admits ρ|I_v = Teich(χ̄)ψ⊕1 with ψ of order p, which no finite twist makes minimal for Theorem 1.4; it should require minimality up to finite-order twist, including the inertial determinant; affects a stated result.
- **Gap** in cg18 at Lemma 5.9(1), proof, p. 377: the source asserts H₃(Y₀(Q),k)=0, but orbifold homology of lattices containing order-3 elements is nonzero in every degree with 𝔽₃ coefficients; it should assume p≥5 or prove vanishing after localization; affects the proof.
- **Misprint** in cg18 at §5.2.1(4), p. 373: the source sets K_{Q,v}=GL₂(O_v) at flat v|p inside Res PGL₂; it should be PGL₂(O_v); affects nothing.
- **Misprint** in cg18 at Theorem 5.11, proof, p. 379: the source defines q=dim H¹_∅(G_F,ad⁰ρ̄); it should be ad⁰ρ̄(1), as in Proposition 5.2; affects nothing.
- **Misprint** in cg18 at Theorem 5.11, proof (b), p. 380: the source writes Tor^{S_N}_i(H_j(Y_{Δ_N}(Q_N),O)_m) without its second argument; it should be Tor^{S_N}_i(H_j(Y_{Δ_N}(Q_N),O)_m, O); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "bfc6e86", "job": "REV-PKG-GL2ModularityLiftingPartII", "model": "opus", "worker": "fable-rev68"} -->
