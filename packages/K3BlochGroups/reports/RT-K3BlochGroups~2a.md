<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/162#issuecomment-6359375810 -->
Red team round 2 pass a (codex) of cef8286

Verdict: needs_changes

1. **F01** (P2) The arithmetic gap requests results already supplied

   **Location:** packages/K3BlochGroups/README.md:59: “What ArithmeticKTheory must provide (gap:number-field-k3-arithmetic)”; design/plan.json:4.

   **Claim:** Finite generation, ranks, primewise w₂, the ambient K₃ tables and the rational/Gaussian examples still require a supplier gap.

   **Witness:** TauCetiRoadmap/ArithmeticKTheory/README.md §§3.2–3.4,4.1–4.4,5.1,5.3–5.4,8.10 state these inputs; :4359–4363 gives both examples independently of Bloch groups.

   **Exact repair text:** “ArithmeticKTheory §§3.2–3.4 supplies finite generation and rank r₂; §§4.1–4.4 supplies every primewise w₂ formula; §§5.1,5.3–5.4 supplies the number-field K₃ structures and ring-to-field isomorphisms; §8.10 supplies the ℚ and ℚ(i) specializations. All are independent of the Milnor-image quotient and Bloch comparison.” Replace uses of this gap with those precise contracts and remove only its entry from the plan's gaps list. Retain the real-closed-field gap.

   **Repair test:** At ℚ, (r₁,r₂,w₂)=(1,0,24) gives ℤ/48. At ℚ(i), (0,1,24) gives ℤ⊕ℤ/24, exactly the inputs to §5.7.

   Re-raised: F07 in the repair report, only its assertion that the arithmetic supplier has no readable roadmap. The supplied head now contains the entire contract. The original missing-supplier finding is not being repeated; the remaining defect is gap minimality.

2. **F02** (P1) Projective cross-ratio foundations have an earlier owner

   **Location:** packages/K3BlochGroups/README.md:17: “The projective extension here adds homogeneous coordinates, infinity, the normalized orbit classification”; :511–523.

   **Claim:** This package constructs the field-general projective cross-ratio, homogeneous formula and invariance starting only from the pinned affine theorem.

   **Witness:** TauCetiRoadmap/PolylogarithmFunctions/README.md §5.8 (:802–818) already owns field-general crossRatioSphere, homogeneous determinant comparison, Möbius invariance and normalize_five. It precedes K3BlochGroups in the merge order.

   **Exact repair text:** “Import PolylogarithmFunctions §5.8's field-general crossRatioSphere, homogeneous comparison, Möbius invariance and normalize_five. Transport along the projective coordinate identification x↦[1:x], ∞↦[0:1], and define the present cross-ratio on distinct tuples as the reciprocal of that supplier's cross-ratio. This section adds only the normalization adapter, the GL₂ triple stabilizer/orbit characterization and the five deletion-face formulas needed for the symbol complex.” Remove duplicate foundational construction obligations and add the owner to the exact contracts and §3.2 Needs.

   **Repair test:** On (0,∞,1,3), the supplier gives 1/3 and the adapter gives 3. On (∞,0,1,3), the values are 3 and 1/3. No totalized degenerate reciprocal identity is asserted.

3. **F03** (P2) Three statable deep milestones are omitted from the acceptance file

   **Location:** packages/K3BlochGroups/README.md:1245 (finite-step GL stability), :1460: “symmetricGroup_homology_stable”; :1691: “the ℓ-primary summand of integral H₃ …”; Suggested.lean:6–20.

   **Claim:** The four retained theorem signatures cover the statable deep milestones; the omitted ones require missing carriers or are elementary interfaces.

   **Witness:** Mathlib/GroupTheory/Perm/ViaEmbedding.lean:42 supplies Equiv.Perm.viaEmbeddingHom; GroupHomology/Functoriality.lean supplies the actual map. Suggested.lean:87 already uses the native SL₂ and homology carriers needed for the integral theorem.

   **Exact repair text:** Add admitted headline signatures for (1) bijectivity of the actual inclusion-induced H_i(Σ_n;ℤ)→H_i(Σ_(n+1);ℤ) for i,n≥0 and 2i≤n, using viaEmbeddingHom on Fin.castSucc and identity coefficients; (2) for every finite field F of prime characteristic p and cardinality q, an additive equivalence H₃(SL₂(F);ℤ)≃ℤ/N, where N=p(q²−1) for q∈{2,3,4,5,8,9,27} and N=q²−1 otherwise. (3) for every infinite field F and n,i≥0 with i≤n, bijectivity of the actual block-diagonal inclusion H_i(GLₙ(F);ℤ)→H_i(GLₙ₊₁(F);ℤ). The block matrix and its inverse define this map on native general linear groups. Keep only simple inclusion definitions if needed, document all three headlines and their source locators, and put their Lean names in the README.

   **Repair test:** Σ₀→Σ₁ is an H₀ isomorphism ℤ→ℤ; Σ₁→Σ₂ on H₁ is 0→ℤ/2 and fails the range; Σ₂→Σ₃ on H₁ is ℤ/2→ℤ/2. Integral SL₂ at q=2,3,4,5,7 has H₃ of orders 6,24,30,120,48, respectively; localization retains 3,8,15,24,48. For GL₀(ℚ)→GL₁(ℚ), H₀ is ℤ→ℤ, while H₁ is 0→ℚˣ and lies outside the range. For GL₁(ℚ)→GL₂(ℚ), the determinant makes H₁ the identity on ℚˣ. These are general stability and integral homology theorems, not boundary-case padding.

4. **F04** (P1) Finite-word exactness still occurs after a consumer

   **Location:** packages/K3BlochGroups/README.md:1460: “the augmented complex of injective words … exact below its top degree”; :1037 assigns the finite replacement to §5.4.

   **Claim:** The stated construction order supplies the finite-word homology input before symmetric-group stability in §4.15.

   **Witness:** §4.0 supplies only infinite-set exactness. The finite exactness target is §5.4 at :1772, whose Needs (:1789) includes all Layer 4, hence §4.15. This is a forward prerequisite and a coarse cycle.

   **Exact repair text:** Move the general finite injective-word exactness target before §4.1, into §4.0: “For every finite set X of cardinality m, its augmented ordered injective-word complex is exact below augmented degree m; retain the possible top homology. Prove this by successive insertion as in Kerz, Theorem 1, pp.1–2.” Make §4.15 consume this target. Leave in §5.4 only its |P¹(Fq)|=q+1 specialization and the hyperhomology comparison, citing §4.0. Include the empty-set augmented convention.

   **Repair test:** For |X|=0, the augmentation ℤ is the surviving top degree 0; for |X|=1 the complex is exact; for |X|=2 the sole positive reduced group is ℤ in degree 1; for |X|=3 it is ℤ² in degree 2. These give exactly the finite range needed at q=4.

5. **F05** (P2) Characteristic-p coefficient vanishing needs positive degree

   **Location:** packages/K3BlochGroups/README.md:343: “gives Kₙ(Ω;ℤ/p)=0, hence unique p-divisibility”.

   **Claim:** The characteristic-p finite-coefficient vanishing used in the K₄ proof has no degree restriction.

   **Witness:** Ω=𝔽̄₂, n=0: K₀(Ω)=ℤ, K₋₁(Ω)=0, hence K₀(Ω;ℤ/2)=ℤ/2, not zero. KTheoryFiniteLocalFields §5.17 explicitly retains this rank term.

   **Exact repair text:** “In characteristic p, for every n≥1 the finite-coefficient group Kₙ(Ω;ℤ/p) vanishes; the coefficient sequences in adjacent positive degrees imply unique p-divisibility of Kₙ(Ω), in particular of K₄(Ω). Degree zero instead has K₀(Ω;ℤ/p)=ℤ/p.” Add the degree-zero example as a negative-control Check.

   **Repair test:** At Ω=𝔽̄₂, the corrected degree-zero value is ℤ/2; K₄(Ω)=0 remains uniquely 2-divisible. No prime is discarded.

6. **F06** (P1) The K₄ and closure-detector proof inputs are not connected to their owners

   **Location:** packages/K3BlochGroups/README.md:343: “rigidity, Bott and torsion steps”; :1523: “Compose with e_Ω”.

   **Claim:** The exact contracts supply the finite-coefficient comparison and normalized torsion e-invariant needed for these arguments. Instead, :50 gives only a source convention for e, and :343 cites a book for the generic comparison inputs.

   **Witness:** KTheoryFiniteLocalFields §6.5a supplies the separably closed Bott comparison, §5.17 the characteristic-p comparison. ArithmeticKTheory §5.2 (:1411–1418) supplies the characteristic-zero torsion isomorphism with Bockstein, embedding and automorphism compatibility.

   **Exact repair text:** “Import KTheoryFiniteLocalFields §6.5a's separably closed coefficient comparison, including products, coefficient changes and field maps; import §5.17's geisserLevine_fieldComparison for the defining-characteristic branch. Import ArithmeticKTheory §5.2's suslinTorsionComparison at i=2 in characteristic zero. Section 2.2 proves the resulting K₄-divisibility consequence; §4.18 constructs its specified δ and proves the Chern compatibility.” Add these precise contracts to both Needs lists. For the remaining positive-characteristic torsion input, add to the README and plan's gaps a contract with slug algebraically-closed-charp-k3-torsion, supplier KTheoryFiniteLocalFields, section §6.5a, and needs: “For every algebraically closed field Ω of characteristic p>0, supply the natural isomorphism K₃(Ω)_tors≃Tor₁^ℤ(μ(Ω),μ(Ω)), normalized by the degree-four Bott Bockstein for each modulus m≥2 prime to p, compatibly with field embeddings, automorphisms and coefficient changes.” The coefficient calculation alone does not identify the integral torsion subgroup; this additional contract must not be inferred just from the order of a finite coefficient group.

   **Repair test:** In characteristic zero, an automorphism ζ₅↦ζ₅² acts on detected degree-three torsion by 4, not 2. In characteristic two, the defining-prime positive coefficient groups vanish while the prime-to-two degree-four group with modulus 5 is μ₅⊗²≅ℤ/5. Its Bockstein gives the required order-five torsion detector. These are the actual maps needed, rather than an abstract cyclic order.

7. **F07** (P3) Related-work locators do not resolve

   **Location:** packages/K3BlochGroups/README.md:15: “BorelRegulators §8.5”, “PadicHodgeRegulators D.2” and “HabiroNumberFields”; :21 and :243: “AlgebraicTopologyPartII … AT2.4 (hilton-wedge)”.

   **Claim:** These named roadmap sections provide the described related interfaces.

   **Witness:** The main/completed searches and roadmaps show do not resolve these four roadmaps. The supplied citation audit independently flags the first and fourth. Hatcher Example 4.52 supports the actual wedge target (hatcher line 16500).

   **Exact repair text:** Delete the unsupported BorelRegulators sentence and the PadicHodgeRegulators/HabiroNumberFields section-specific claims at :15, and the AlgebraicTopologyPartII sentence at :21. Anticipated consumers may remain listed as anticipated consumers without invented target attributions. Replace the opening of the :243 bullet by “wedgeTwoSpheres_pi3: for an arbitrary set I, fix the Hopf generators and Whitehead attaching orientations as follows.” Retain its existing Hatcher locator and proof; retain the verified Polylogarithms consumer contract.

   **Repair test:** For I empty, π₃ is 0; for one sphere it is ℤ; for two spheres it is ℤ³, with two Hopf generators and one Whitehead generator. No mathematical target is removed by deleting the unsupported related-work attribution.

8. **F08** (P1) The Hopf cube is not supplied by the cited low-stem section

   **Location:** packages/K3BlochGroups/README.md:52: “§7.1 the low stable stems”; :1481 and :1504 use π₃ˢ/(η³)=ℤ/12 and η³≠0.

   **Claim:** StableHomotopyKTheory §7.1 supplies the compatible stable multiplication calculation needed for the order-twelve quotient.

   **Witness:** Its §7.1 sphere_firstStems specifies π₁S and π₂S only (:2234). An abstract π₃S≅ℤ/24 elsewhere does not identify η³. The missing value is 12ν, not zero.

   **Exact repair text:** “StableHomotopyKTheory §7.1 supplies η and η². The compatible third-stem computation π₃S=ℤ/24{ν} is imported from HomotopySpheres Stage 9, and η³=12ν≠0 from FourManifolds F7.0b, using the same stable Hopf generator. Hence the quotient by the subgroup generated by η³ is ℤ/12.” Add those exact supplier contracts and the normalization comparison to §4.16's Needs. The readable new-roadmap heads are HomotopySpheres fb7c47e, Stage 9 item 1 (:890–894), and FourManifolds d09c2c0, F7.0b (:1268–1270). Retain a single owner for the general stable-stem computation and rerun the dependency gate after adding these edges.

   **Repair test:** For F=𝔽₂, Fˣ=1, so π₃(BM⁺)=ℤ/24. Dividing by {0,12} gives ℤ/12; substituting η³=0 would give ℤ/24 and refute :1504.

9. **F09** (P3) Several Checks only repeat their definitions

   **Location:** packages/K3BlochGroups/README.md:637–638: “[1] = 0”; “A five-term element evaluates to zero”; :964 and :2124.

   **Claim:** These entries independently check the pre-Bloch quotient, the extended boundary and the zero fibre.

   **Witness:** The quotient is defined by killing exactly those generators (:615); d_new is defined to vanish on the three degenerate symbols (:940); membership of zero in the zero fibre unfolds to map_zero (:2074).

   **Exact repair text:** Delete the repeated defining-law Checks at :637–638, :870, :873, :964 and :1980; keep their laws in the API. Delete the automatic zero-value Checks at :182, :353, :397, :431, :434, :1926, :1982, :2124 and :2128. Delete :500's generic antisymmetry law from Checks, retaining its API statement and the existing diagonal/mixed-coordinate examples. These entries follow from the displayed quotient, kernel or additive-map definitions and also pass for the corresponding zero map. Retain the existing nonzero controls. In §2.4 replace the vacuous entries by these three computed Checks: “For ℚ, the map K₃→H₃(SL) is ℤ/48→ℤ/24, with 1↦1 and 24↦0 under compatible cyclic identifications”; “For ℚ(i), D=0 and both the free generator and a torsion generator survive in ℤ⊕ℤ/24”; “For 𝔽₅, K₂=0 and K₃→H₃(SL) is an isomorphism of groups of order 24, whereas P(𝔽₅) has order 6.” The original four affected quotient/boundary/fibre blocks retain at least three substantive controls after deletion.

   **Repair test:** The surviving quotient Checks distinguish 0, ℤ, ℤ/5 and ℤ/6 at q=2,3,4,5. The boundary Checks distinguish B_new(𝔽₁₁)=ℤ/3 from B_old(𝔽₁₁)=ℤ/6. The fibre Check gives four representatives 1,7,13,19 whose sixfold multiples are nonzero. Deleting the repeated laws loses none of these distinctions.

10. **F10** (P3) The signed residue comparison is not cited to its existing owner

   **Location:** packages/K3BlochGroups/README.md:1618: “once the Milnor residue … is matched with the K-theory boundary”; “agree up to a universal sign”.

   **Claim:** The degree-three diagram still needs a comparison assembled from K2SymbolsBrauer Layer 9 and SchemeKTheoryOperations §3.6, with its sign unspecified.

   **Witness:** TauCetiRoadmap/K2SymbolsBrauer/README.md:2540–2554, §11.3, already supplies DₙΦₙ=(−1)ⁿ⁻¹Φₙ₋₁rᵥ,ₙ for every DVR and n≥1. The degree-three sign is +1.

   **Exact repair text:** “Import the product-normalized residue comparison of K2SymbolsBrauer §11.3: with the parameter last and the right-linear Quillen boundary D, D₃m₃=m₂rᵥ,₃. Transport D through SchemeKTheoryOperations §3.6's affine/supported comparison. The right square of the two rational-function-field sequences therefore commutes with positive sign.” Add §11.3 to §4.21's Needs; retain the valid SchemeKTheoryOperations §4.7 splitting citation. No new generic residue comparison is constructed here.

   **Repair test:** For k=ℚ(t), O=k[[π]], the residue of {2,t,π} is {2,t}, whose product-normalized t-adic Quillen boundary is 1/2; negating it gives 2. In degree two, {2,5} at 5 instead has Milnor value 2 and Quillen value 3 in 𝔽₅ˣ. Thus the sign is fixed, not harmlessly interchangeable across degrees.

11. **F11** (P2) The finite-field acceptance theorem is restricted to universe zero

   **Location:** packages/K3BlochGroups/Suggested.lean:87: “(F : Type)”; README:1687: “Let F be finite”.

   **Claim:** The acceptance signature covers every finite field in the README's scope.

   **Witness:** The supplied elaborated type has F : Type, without a universe parameter. F=ULift.{1} (ZMod 2) is a finite field in Type 1 and cannot instantiate it. Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:224 requires coefficient and group universes to agree.

   **Exact repair text:** Declare universe u and quantify F : Type u. In both occurrences of the coefficient object use ULift.{u} (Localization (Submonoid.powers (p : ℤ))), with its transported commutative-ring structure. Keep the native special-linear group and the additive equivalence to ZMod (Fintype.card F ^ 2 - 1). State in the README that these are the same trivial localized coefficients transported to the group's universe. Lift the coefficient objects, not merely a morphism type. The analogous stability additions in S03 should use this convention for integral coefficients.

   **Repair test:** At F=ZMod 2 the target order remains 3. At F=ULift.{1} (ZMod 2) it is also 3, and the group and coefficient objects now both inhabit Type 1. The pinned instances are Mathlib/Algebra/Ring/ULift.lean:111 and Mathlib/Algebra/Field/ULift.lean:53. No cardinality or mathematical field restriction is introduced.

12. **F12** (P3) The numerical Milnor symbol cannot test the Chern multiplier

   **Location:** packages/K3BlochGroups/README.md:356: “the third is tested on {2,3,5} by the ordered symbol product rule”.

   **Claim:** This example discriminates the degree-three coefficient +2 and its ordered sign before taking the indecomposable quotient.

   **Witness:** In K₃ᴹ(ℚ)≃ℤ/2 (README §2.3), the real-sign coordinate of {2,3,5} is 0 because all entries are positive. Its image is already zero. Multipliers 0,2 and −2 all give 0.

   **Exact repair text:** “Take F=ℚ(t₁,t₂,t₃) and x={t₁,t₂,t₃}. Successive last-slot Milnor residues at t₃,t₂,t₁ send x to 1∈K₀ᴹ(ℚ)=ℤ. The diagonal Chern composite sends x to 2x and therefore has iterated residue 2; reversing the first two entries gives −2. The zero composite instead gives 0.” Use the existing K2SymbolsBrauer Layer 9 residue maps to compute this Check. Retain 1,−1,2 as the general coefficient formula.

   **Repair test:** The original rational example gives (correct, sign-reversed, zero)=(0,0,0). The replacement gives (2,−2,0), three distinct integers, and reversing two parameters gives (−2,2,0). No Milnor quotient has been taken.

## Earlier findings: verification at this head

Here A/B identify the earlier codex/claude passes. Locations refer to the repaired package. “Repaired” concerns the original defect, not certification of every surrounding proof.

| Earlier finding | Status | Repaired passage and witness |
|---|---|---|
| A-F01, quadratic-root order | Repaired | README:711: “of order three in characteristic 2”; :720 computes ω³=1≠ω in 𝔽₄. Thus ord(ω)=3 and c=0. |
| A-F02, real-closed transfer | Repaired, conditional on declared gap | README:61: “completeness and model completeness … all real closed ordered fields”; :1885 gives the fixed-list equality-pattern transfer. The same slug occurs in design/plan.json:11. For no pairs, k[1]=0 iff k=0; [2]−[3] has augmentation zero but is nonzero. The supplier gap is accepted, not re-raised. |
| A-F03, omitted tensor/certificate carriers | Repaired under the acceptance rules | Suggested.lean:30 defines the actual tensor cokernel; :37 states its full diagonal exactness theorem. README:580 constructs finite certificates and :594 gives their membership equivalence. The latter is elementary, so omission from Lean is appropriate. For A=ℤ² the cokernel is (ℤ/2)²⊕ℤ with kernel (ℤ/2)². |
| A-F04, mixed-field naturality | Repaired | README:2138: “B(f)∘b_F=suslin_E∘q_E∘K₃(f)”; :2150 explicitly uses it. The 𝔽₄ symbols distinguish the two normalizations: [ω²]=4[ω]≠[ω] in ℤ/5. |
| A-F05, stable-homotopy locators | Repaired for the listed corrections | README:48–52 now cites §§3.29,3.31,3.32,5.19,7.27. These target sections exist at the supplier head; uce.source_superperfect occurs in its §3.29 API. The resolver's absence warning is not a defect. |
| A-F06, library pins | Repaired | README:39 names Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, matching lake-manifest.json. |
| A-F07, unavailable motivic/arithmetic supply | Partly repaired | README:50 now imports KTheoryFiniteLocalFields §§1.8,3.0,3.0a,6.10; those exports exist with the stated hypotheses. README:59 declares the arithmetic gap, but its requested inputs now exist at the supplied ArithmeticKTheory head: S01. |
| A-F08, internal forward inputs | Repaired for all three listed edges | README:580 constructs raw certificates in §3.3; :1665 constructs Cartan matrices before §5.2; :1019 constructs configurations before §4.1. Their respective Needs at :608,:1683,:1052 use only prior algebra. Another finite-word forward input remains: S04. |
| A-F09, absent Lean Check mirrors | Repaired under the acceptance rules | README:2016 computes 3·2=6; :2062 computes 1·3=2·4=3 mod 5; :2126–2127 gives the zero fibre and sixfold values 6,18,6,18. These belong in README Checks, not Lean padding. |
| A-F10, source manifest | Repaired | sources.toml contains fifteen lifetime keys, twelve certified and three waived; its version_note distinguishes the two CGZ presentations and K-book pagination. No settled text was requested again. |
| A-F11, duplicate Milnor/Chern foundations | Repaired | README:340: “Their full-field constructions and proofs remain at that supplier”; the native Milnor torsion and diagonal Chern theorems are KTheoryFiniteLocalFields §§3.0,6.10. Degree-three multiplier is +2. |
| A-F12, Chern additivity | Repaired | README:50: “Additivity holds for n≠2 or odd modulus”; :2177 has c₂(2β)=1 versus 2c₂(β)=0 over ℝ mod 2. weibel-chern lines 398–403,437–446 verify the exception. |
| A-F13, Rogers locators | Repaired | README:56 cites PolylogarithmFunctions §§6.1,6.3–6.5; those sections give endpoints, reflection, pentagon and midpoint. At 1/2,2,−1 the detector values are −π²/12,π²/12,−π²/4. |
| A-F14, trailing name catalogue | Repaired | Suggested.lean:12–20 lists mathematical unavailable headlines with their missing carriers; the file ends with its namespace at :102. The trailing catalogue is gone. |
| B-F01, temporal/process qualifiers | Repaired | README:17 “The Tau Ceti theorem”; :19 “Tau Ceti also supplies”; :1697 “Tau Ceti’s … corestriction_mackey”. The six cited temporal qualifications are removed. |
| B-F02, four one-tactic statements | Repaired | comparison_apply, comparison_eq_zero, rankTwoFaceMatrices_det and rootCoefficient_toPre are absent from Suggested.lean. Their mathematical statements remain at README:118,:123,:1307,:2028. Deletion, rather than proving padding in place, is the required repair. |

## Verified sound

Read all 2,209 README lines and all 102 Lean lines: **8 declarations**, including **4 theorem signatures**, and **62 numbered target sections**. The numbered mathematical targets are not boldfaced; the eight bold supplier-contract labels are audited below; the numbered target paragraphs and subordinate constructions are in the statement ledger. All eight supplied elaborated signatures were compared with the README. No section binder is lost; the finite-field universe restriction is S11. I did not run Lean or regenerate signatures: the read-only prohibition takes precedence over the generic instruction to elaborate a scratch file.

The retained four theorems are not one-tactic padding. In particular the cyclic theorem concerns the actual induced power map with an identity coefficient morphism, and the order-six theorem uses the real quotient presentation rather than arbitrary functions satisfying assumed identities. The declarations use one `import Mathlib`, real definition bodies, the required namespace and ordered layer comments. All eight names occur in the README. No `lemma`, `set_option`, admitted data, `True` placeholder or admitted example occurs. The original diff contains only the package folder. The only review changes are this report and scratch notes.

The checks below include characteristic two and three, the trivial group, rank zero, zero modules and the zero ring where admitted, finite fields of sizes 2 and 3 outside later large-field hypotheses, nonabelian S₃ and Q₈, empty configurations, totalized division at forbidden inputs, modulus zero and one, nonflat coefficient change, ramified-root extensions and purely inseparable maps. A field assumption excludes the zero ring and nonreduced thickenings; a number-field assumption excludes positive characteristic. No test of those excluded objects is represented as a proof at greater generality.

### Elaborated declaration ledger

Here Qₛ(A) denotes the actual tensor cokernel; E²(A) denotes the exterior square. Every row includes the complete nontrivial context, rather than inferring instances from an earlier section.

| Declaration and section | Actual variable/instance context | Computed instances and values | Result / change |
|---|---|---|---|
| antisymSquare, §3.1, Lean:30 | R,M:Type*, CommRing R, AddCommGroup M, Module R M; independent universes | R=M=ℤ: tensor ℤ, relation image 2ℤ, quotient ℤ/2; R=𝔽₂,M=𝔽₂²: quotient dimension 3 versus exterior dimension 1; M=0 or R=0: 0 | Correct cokernel, distinct from negative eigenspace. |
| antisymSquare_diagonal_exact, §3.1, :37 | A:Type*, AddCommGroup A; canonical ℤ-module | A=ℤ: p:ℤ/2→0, diagonal equality a≡b mod2 iff a−b=2c. A=ℤ²: p:(ℤ/2)²⊕ℤ→ℤ, (a,b,c)↦c. A=ℤ/3: 0→0, multiplication by2 bijective. A=0: all terms0 | Surjectivity, both kernel directions and both diagonal-equivalence directions agree. No unintended R-linear diagonal is asserted. |
| preBlochRawSymbol, §3.3, :51 | F:Type*, Field F, x:F; classical case split in body | ℚ at0,1,2 gives 0,e₁,e₂; e₁≠0 and e₂≠e₁. 𝔽₂ at2 gives0 because2=0 | Unreduced one is preserved. |
| preBloch, §3.4, :57 | F:Type*, Field F | 𝔽₂: kill sole generator e₁, quotient0. 𝔽₃: kill e₁, no admissible pair, quotientℤ. 𝔽₄: relation matrix [[3,−2],[−2,3]], determinant5, quotientℤ/5. 𝔽₅: Smith diagonal1,1,6 | Correct small fields and precise admissibility. |
| preBlochSymbol, §3.4, :66 | F:Type*, Field F, x:F | At0,1 gives0; at2,3 in𝔽₅ gives2g,g with ord g=6, hence orders3,6. Field identity fixes both | Correct quotient map, no discarded Field binder. |
| cyclicHomology_power_map, §4.15, :74 | m,a,j:ℕ, NeZero m, hj:1≤j; φ into restriction along powMonoidHom a, hφ fixes underlying linear map | m=7,a=2,j=1:2; j=2:4. m=1: both sides0. a=0,j≥1:0; a=1:identity. m=2,a=2:0. j=0 excluded before truncated subtraction | Correct weight j, actual morphism and coefficient context. |
| finite_sl2_localized_homology, §5.2, :87 | F:Type, Field F, Fintype F; p:ℕ, Fact p.Prime, CharP F p | (q,p)=(2,2),(3,3),(4,2),(5,5),(7,7): target orders3,8,15,24,48. Integral groups instead have orders6,24,30,120,48 | Correct localization; cardinality≥2 follows from Field, p=0,1 excluded. The mathematics is correct, but the universe-zero restriction is S11; a small representative does not generalize this signature. |
| blochC_order_six, §5.8, :98 | F:Type*, Field F, IsFormallyReal F | F=ℚ orℝ: ρ(c)=−π²/6 modπ², order6. Real closed non-Archimedean field: same rational certificates by declared transfer. 𝔽₄:c=0; ℂ:c=0; both excluded by IsFormallyReal | Correct typed scope; depends on declared real-closed gap. |

### Statement and convention ledger

Rows separate distinct constructions or claims within a numbered section. “No change” means the displayed test passed, not that a finite test replaces a theorem proof. Symbol calculations use the actual five-term presentation. The finite presentation calculations at q=2,3,4,5,7,11,13, the Γ conjugations and the finite-word chain ranks were independently recomputed with integer/rational arithmetic in scratch notes.

| Statement / location in README | Instances tried; computed values on the two sides | Result / change |
|---|---|---|
| Conventions :25–35: bar signs, zero symbols, tensor quotients, moduli | d₃[g,1,1]=[1,1]−[g,1]; d₄[1,1,1,1]=[1,1,1]. ℤ/0=ℤ; ℤ/1=0. ℤ/2⊗ℤ/2=ℤ/2, exterior²(ℤ/2)=0 | No change; division denominators require stated admissibility. |
| 1.1 bStPlus and plus subgroup | A=0: St=1, π₁=π₂=H₃=0; A=ℤ: π₁(BSt)=St≠1, π₁(BSt⁺)=1, π₂(BSt⁺)=0 versus π₂(BE⁺)=ℤ/2 | No change; trivial-subgroup plus is excluded. |
| 1.1 map q, fibre and higher comparison | A=0,n=3:0≃0; A=ℤ,n=3:π₃(BSt⁺)=ℤ/48=K₃; n=2:0≠K₂(ℤ)=ℤ/2, outside range | No change. |
| 1.1 naturality, identity and composition | 0→0 sends0 to0; ℤ→ℚ→ℝ sends elementary generator x₁₂(2) to x₁₂(2) along either route | No change; strict equality only on induced maps. |
| 1.2 canonical comparison | Four groupsℤ/5, q=×2, other maps=id: comparison(1)=3; wrong direction gives2. q=id gives1 | No change; inverse direction pinned. |
| 1.2 injectivity and equality | Inℤ/5 c=×3, c(1)=3≠0, c(2)=1≠3; at0 both0 | No change; zero map fails. |
| 1.3 bar-cycle evaluation | G=1: chain [1,1,1]≠0 but d₃=0 and value0; d₄[1⁴]=[1³]. G=S₃,g=(12): d₃[g,1,1]=[1,1]−[g,1]≠0 | No change; actual cycles, not arbitrary chains. |
| 1.3 boundary/equality iff and finite support | For c=[1³],c′=0, c−c′=d₄[1⁴], both values0. In H₃(C₂)=ℤ/2, generator versus0 has distinct values and no boundary witness | Both directions discriminated. |
| 1.4 transport and finite-stage colimit | Identity fixes coefficients (1,−1); composable ring maps send a tuple containing x₁₂(2) to the same tuple. Zero ring: finite-stage groups trivial, H₃=0 though bar-chain groups remain nonzero | No change; no false cycle-group vanishing inferred. |
| 1.5 lifted H-space multiplication | Identity cover on simply connected X: lifted μ=μ. A=0: point×point→point. Nontrivial simply connected cover kills π₁ but not necessarily π₂ | No change; units choose the based lift. |
| 1.5 Hopf-Hurewicz kernel | K(ℤ,2):π₂=ℤ,π₃=H₃=0, η=0. K(ℤ,3):π₂=0,π₃=H₃=ℤ. A=ℤ:ℤ/48→ℤ/24, kernel{0,24} | No change; no additive section of the last quotient. |
| 1.5 wedgeTwoSpheres_pi3 :243 | I=∅:0; one element:ℤη; two elements:ℤη₁⊕ℤη₂⊕ℤ[ι₁,ι₂]. All have H₃=0 | Mathematics correct; related locator S07. |
| 1.5 hopfComposition_add :244 | In S²∨S², (ι₁+ι₂)η has coordinates(1,1,1), pure sum(1,1,0). In an H-space the last coordinate maps to0 | Correct +Whitehead convention and H-space hypothesis. |
| 1.5 sphereUnit_eta_minusOne :246 | Transposition [[0,1],[1,0]] has determinant−1; over𝔽₂ determinant1 and its unit class0; overℤ it is nonzero in K₁=ℤ/2 | No change; multiplication is on the specified right factor. |
| 2.1 Milnor m₃ and quotient | 𝔽q:K₃ᴹ=0 so quotient=K₃. ℚ:ℤ/2 maps to{0,24}⊂ℤ/48; quotientℤ/24. ℚ(i):Milnor source0, positive rank1 remains | No change; quotient is not torsion-free quotient. |
| 2.2 injection, 2-kernel and motivic edge | ℚ:ker m₃=0; quotient edgeℤ/24≃H¹(ℚ,ℤ(2)). Characteristic2: imported multiplication-by2 injection rules out a nonzero2-kernel; Prüfer2 group has nonzero2-kernel and is a rejected substitute | No change to endpoint. |
| 2.2 diagonal Chern multiplier | Degrees 1,2,3 give 1,−1,2. Over ℚ, {2,3,5}=0, so the proposed sign test gives 0=−0. Over ℚ(t₁,t₂,t₃), iterated residues of the corrected composite are 2 versus −2 | S12 replaces the vacuous numerical symbol; the general formula and supplier are retained. |
| 2.2 weight-zero mod2 and K₄ divisibility | Ω=𝔽̄₂:K₄=0, quotient/r=0 for every r; n=0,p=2 gives K₀(;ℤ/2)=ℤ/2≠0. Characteristic0 Bott coefficient degree4 mod5=ℤ/5, Bockstein targetK₃[5]=ℤ/5 | S05 and S06. |
| 2.3 prescribed signs and decomposable basis | F=ℚ:σ{−1,−1,−1}=1. F=ℚ(√2): units a₊=−√2,a₋=√2 give signatures(1,0),(0,1). F=ℚ(i):empty coordinate set and zero group | No change; two identical −1 generators would fail. |
| 2.3 multiplication by −1 onto D | Overℚ,{−1,−1}·[−1] gives24∈ℤ/48, the nonzero D element; empty real-place case gives0→0 | No change; number-field scope matters. |
| 2.4 H₃(E) quotient and imaginary equivalence | ℚ:K₃/D=ℤ/24; ℚ(i):D=0 and K₃≃H₃=ℤ⊕ℤ/24; positive-characteristic finite fields:−1·K₂=0 | No change; arbitrary-field quotient uses (−1)K₂, number-field identification uses signs. |
| 2.5 rationalization loses torsion | ℚ:ℤ/48⊗ℚ=ℤ/24⊗ℚ=0 although integral groups differ; ℚ(i):both rational groupsℚ | No change. |
| 3.1 cokernel, universal property and functoriality | A=ℤ²: e₁⊗e₂=−e₂⊗e₁, diagonal generators order2. Map e₁↦2e₁ kills its diagonal but scales mixed generator by2. Identity fixes all three coordinates | No change. |
| 3.1 eigenspace and direct-sum comparison | R=ℚ,M=ℚ²: e₁∧e₂↦(e₁⊗e₂−e₂⊗e₁)/2, quotient back=e₁∧e₂. R=ℤ,M=ℤ:ℤ/2 versus0. A=ℤ⊕ℤ:two diagonal ℤ/2 and one mixedℤ | No change; invertibility of2 essential. |
| 3.1 cyclic formula and diagonal exactness | n=0:ZMod0=ℤ,Qₛ=ℤ/2=gcd(2,0); n=1:0; n=2:ℤ/2; n=3:0. A=0:0→0→0 | No change, including total-function endpoints. |
| 3.2 cross-ratio and orbits | (0,∞,1,3) gives3; swapping first pair gives1/3. Translation gives cr(1,∞,2,4)=3. Over𝔽₃ all values−1; over𝔽₂ no distinct quadruple | Correct normalization; import earlier construction: S02. |
| 3.2 five deletion faces | Tuple(0,∞,1,2,3) yields the five-term combination [2]−[3]+[3/2]−[3/4]+[1/2] with the fixed face orientation; repeated points excluded | No change to adapter and face formula. |
| 3.3 raw/reduced carriers and admissibility | ℚ:unreduced(0,1,2)=(0,e₁,e₂); reduced=(0,0,e₂). (2,3) admissible; (2,2),(2,1) false. At diagonal the unreduced expression is e₁ | No change. |
| 3.3 reflection and inversion identities | R(2,3)−R(−2,−1)=e₂+e₋₁−e₃−e₋₂. Four relations at(2,3),(1/2,1/3),(3,2),(1/3,1/2) sum to2(e₃⁄₂+e₂⁄₃) | No change; checked in free group before quotient. |
| 3.3 certificate evaluation and membership | Empty support,k=2 gives2e₁≠0; indicator(2,3) gives coefficients(1,−1,1,−1,1); e₂ has nonzero boundary so no certificate | Both membership directions and nonexample discriminated. |
| 3.4 quotient and symbol maps | q=2,3,4,5 give0,ℤ,ℤ/5,ℤ/6. Over𝔽₅ symbols2,3,4 map2g,g,0. An all-zero symbol map fails at3 | No change. |
| 3.5 boundary descent | ℚ:∂[3]=3∧(−2), valuation determinant v₂(3)v₃(−2)−v₃(3)v₂(−2)=−1; reversed order gives+1. Five-term boundary at(2,3) has all coefficients0 | No change; sign detected away from2. |
| 3.5 Bloch kernel and Matsumoto exactness | 𝔽₅:P=ℤ/6→Qₛ=ℤ/2 sends g↦1, kernel2ℤ/6=ℤ/3, K₂=0. 𝔽₃:ℤ→ℤ/2 has kernel2ℤ. 𝔽₄:ℤ/5→0 | No change; exterior-target replacement would fail. |
| 3.6 c, inversion h and root criteria | q=4,5,7,11,13:ord c=1,3,2,6,1. q=7:3c=c=h(−1),6c=0. q=4:ω³=1 and2c=3c=0. q=3 excluded from universal torsion law | No change; repaired characteristic-two root order. |
| 3.7 finite presentation table | Prime q=5,7,11,13: Smith invariants respectively(1,1,6),(1⁴,8),(1⁸,12),(1¹⁰,14). q=2,3:0,ℤ | No change. |
| 3.8 exterior Bloch comparison | 𝔽₅:B=ℤ/3,B̃=ℤ/6; 𝔽₃:B=2ℤ,B̃=ℤ; ℂ:units/2=0, Qₛ→exterior is iso | No change; kernel change is integral. |
| 3.8 inversion need not be an exterior cycle | ℚ,h(2):boundary2∧(−1); sign/valuation alternating form gives1 mod2, not0 | No change; source misstatement not copied. |
| 3.9 full-tensor lecture kernel | 𝔽₂:A₀=0; 𝔽₃:A₀=ℤ,T=ℤ/2,λ(1)=1,ker=2ℤ. 𝔽₅:R(2,3)=[4],λ[4]≠0 butλ(2[4])=0 | No change; intersect relation subgroup with kernel. |
| 3.9 μ and relative quotient | 𝔽₅:2[4] is nonzero free cycle with μ=0;4[3] maps to4g≠0 inB=ℤ/3. ℚ:4[−1] has infinite order in kerμ | No change; μ itself is not rationally injective. |
| 3.10 obstruction E/L and sixfold lift | 𝔽₂:E=L=0. 𝔽₃:R=0,λ onto,obstruction0. 𝔽₅:4[3] lifts generator and2[4] remains kernel;6 times obstruction=0 | No change; quotient exactness is distinct from μ injectivity. |
| 3.11 generic configurations Ggen | 𝔽₂:no quadruple→0; 𝔽₃:one orbit,no five-tuple→ℤ; 𝔽₅:Ggen=ℤ/6, boundary kernelℤ/3 | No change; Ggen is pre-Bloch, not Bloch. |
| 3.12 smooth-curve relation and specialization | Onℙ¹, [t]+[1−t] has rational wedge boundary0; evaluation at0 is[0]+[1], at∞ is2[∞], so[1]=0 after killing endpoints. [t] alone has nonzero boundary | No change; only cycles specialize to relations. |
| 3.12 inversion, comparison and arbitrary curves | [t]+[t⁻¹] has rational boundary0, giving[x]+[x⁻¹]=0; ℂ,i has boundary0 because i is torsion. F₃:P⊗ℚ=ℚ but arbitrary-curve presentation=0 | No change; arbitrary-curve injectivity remains conditional, not inferred from rational-curve rigidity. |
| 3.13 old projective exterior convention | ξ₂,₁=[2]+[1/2]−[1] overℚ has exterior boundary2∧(−1)≠0; intersection repairs ill-defined quotient. F₂,F₅,F₁₁ old groupsℤ/3,ℤ/3,ℤ/6 | No change; old source literal subgroup assertion is corrected. |
| 3.14 negative-unit tensor | F₃:Qneg=ℤ/2 vs exterior0; F₅:Qₛ=ℤ/2,Qneg=0 because generator⊗negative generator has coefficient3 inℤ/4. ℚ:2∧(−2) killed only inQneg | No change. |
| 3.15 projective new presentation | dnew[0]=dnew[1]=dnew[∞]=0. F₂:Bnew=ℤ/3; F₃:extendedP=ℤ/2→Qneg=ℤ/2 identity, kernel0; F₁₁:Bnew=ℤ/3 | No change; source's unrestricted small-field surjection not copied. |
| 3.16 convention maps | q=5:ℤ/3→ℤ/3 iso; q=7:ℤ/4→ℤ/2,ker{0,2}; q=11:ℤ/6→ℤ/3,ker{0,3}. All kernels killed by2; tensorℤ/3 removes them | No change. |
| 4.0 ordered complex and augmentation | Empty X: all unaugmented groups0, augmentation targetℤ. One point:ranks(1,0,…), augmentation=id. Two points:ranks(2,2),H₁=ℤ generated(x,y)+(y,x). Three points:ranks(3,6,6),H=(ℤ,0,ℤ²) | No change to signs/indexing. |
| 4.0 d² and infinite exactness | d²(x,y,z)=0; unsigned deletion gives2x+2y+2z. For an infinite set insert a point outside finite support; dS+Sd=id. A finite two-point complex retainsH₁=ℤ | Infinite hypothesis correct; finite prerequisite placement S04. |
| 4.1 hyperhomology and total signs | Complex concentrated at0 with ℤ: hyperhomologyHₙ(G,ℤ). G=1,C=ℤ[1]:totalH₁=ℤ andH₀=0. At bidegree(1,1), two cross terms have coefficients+1,−1, sum0 | No change; bounded-below/finite-diagonal filtration stated. |
| 4.2 independent-vector complex | n=0:augmentationℤ only. n=1 overℚ:d(2)=d(1)=1 andd((2)−(1))=0, no independent pair. n=2:d(e₁,e₂)=e₂−e₁; (e₁,2e₁) excluded | No change; not a distinct-vector complex. |
| 4.2 frame action and top homology | n=m=1:block[[1,0],[1,1]] sends(1,0) to(1,1), not(1,0). InfiniteF:homology off augmented degree n is0; n=0 topℤ retained | No change; lower coordinates acted on. |
| 4.3 scalar acyclicity | V=0,j>0:inner and outer groups0. F=ℚ,V=ℚ,j=1,k=ℚ:innerH₁=ℚ≠0, scalar2−1=id kills coinvariants. F=𝔽₂,V=𝔽₂,j=1,k=𝔽₂ gives nonzero𝔽₂, excluded by infiniteF | Correct hypotheses and object. |
| 4.3 affine stabilizers | M=0:block group=G₁×G₂, map identity. Overℚ,n=m=1,M=ℚ, full scalar action kills radical contribution. Removing scalars with G₁=G₂=1 leavesH₁(M)=ℚ≠0 | No change; arbitrary stable F-subspace allowed. |
| 4.4 Sₙ and frame relations | n=0:S₀=ℤ; n=1:S₁=Fˣ; n=2:S₂=K₂ᴹ⊕ℤ. For a=1 the degree-one unit symbol is0, not a basis vector in a free group | No change; symbols are quotient classes. |
| 4.5 connecting δ, Milnor θ and retract | Degree1:δ sends nonzero1-frame a to its unit class. Degree2 overℚ:ordered(2,3) gives{2,3}; swap gives−{2,3}. θ followed by the stated retract is identity, at zero gives0 | No sign contradiction found; Suslin1984 proof waived. |
| 4.5 SL₂ action and unstable extension | F=ℝ:nontrivial square class−1 remains available; F=ℂ:Fˣ/(Fˣ)²=0, square-class action trivial. A quotient prematurely erasing square classes cannot give the ℝ presentation | Carrier controls agree; full proof not reconstructed. |
| 4.6 split frame algebra | Degree0:coefficientℤ remains; degree1:Fˣ; multiplication by degree-two e carries1∈S₀ to nonzero e∈S₂, and its Milnor projection is0 | No change; injectivity is proved simultaneously with §4.8, not assumed from the result. |
| 4.7 diagonal, monomial and block inclusions | n=1:T₁=M₁=Fˣ. n=2,F₃:orderM₂=2²·2=8 versus orderGL₂=(9−1)(9−3)=48. n=0:trivial stabilization base | No change. |
| 4.8 stability, E¹ and degree-three spanning | GL₀(ℚ)→GL₁(ℚ):H₀ identityℤ, H₁ 0→ℚˣ outside range. GL₁→GL₂:H₁ identity via determinant. Alternating sums of q face maps:1 for odd q,0 for even q | S03 for missing statable stability headline; no endpoint counterexample. |
| 4.8 ordered Milnor quotient | Product(2,3,5) maps{2,3,5} with coefficient+1; first-factor interchange yields negative. Diagonal plus rank-two images span at degree3; zero input has both images0 | Compatible supplier product convention. |
| 4.10 projective coinvariants | F₂:four-tuples absent,H₃=0=P(F₂); F₃:four-point orbit givesH₃=ℤ=P(F₃); F₅:H₃=ℤ/6. In all three,H₀=ℤ,H₁=H₂=0 | No change; small-field claim computed, not inferred from infinite acyclicity. |
| 4.11 E¹ stabilizers and swap | Swap onH₁(T₂)=U⊕U interchanges coordinates; on cross-productH₁⊗H₁ gives minusflip. Thus (a,b)−(b,a), not their sum, for 1−σ. At F₃ integral unipotent homology survives, excluded from infinite Borel equivalence | No change; finite branch later localizes. |
| 4.11 rank-two differential and shear | a=3 overℚ:raw coordinates(−3∧(−2),3⊗(−2)); valuation test on first=+1, tensor alternating test=−1. Shear cancels first coordinate to0, leaving∂[3] with test−1 | No change; agrees with chosen total differential after source sign adapter. |
| 4.11 SL diagonal comparison | D(a)=diag(a,a⁻¹), a∧b sends(2a∧b,−2a⊗b); shear first=0. On ℤ² basis, mixed coefficient−2 rather than+2 | No change; sign is used consistently in §5.4. |
| 4.11 explicit face matrices | At a=2,3 all denominators a,1−a are nonzero. The three face determinants are (1−a,a(1−a),a): at a=2 they are (−1,−2,2), at a=3 they are (−2,−6,3); a=0 or1 makes a face singular | Rank-two proof remains source-supported; no one-tactic Lean mirror retained. |
| 4.12 ψ₂, image and monomial kernel | ψ₂ takes cycles intoB. Overℚ a raw symbol[2] has nonzero tensor boundary, so cannot be an arbitrary cycle image. Zero and diagonal-torus classes map 0 | No change; surjectivity is a theorem, not manufactured from a cyclic equivalence. |
| 4.13 general-position/rotation cone | 1−t and N=1+t+…+t⁴ have composites1−t⁵=0; on a fixed orbit t⁵=id. With the specified differential D(x,y)=(dᵃx−Ny,−dy), D²=(0,0), whereas replacing −dy by+dy leaves −2Ndy | No change to rotation and cone signs. |
| 4.13 omitted-last-face complex | Fixing the last letter decomposes the finite complex into augmented injective-word complexes on the other letters. For three letters the top rank is 3·1=3; for four it is 4·2=8. For an infinite set all nonnegative homology groups are 0 | Correct finite exceptions to the infinite acyclicity statement. |
| 4.14 ψ′ and rank compatibility | ψ′([a;x])=[a]; overF₁₁,Σᵢψ′tⁱ[a;x]=2c, henceψ′(P)=−2c cancels. Overℚ,[2]∉B, soψ′ itself is not B-valued | No change; map onH₃ is the B-valued object. |
| 4.15 corrected symbol identities | At x=2 inF₅, [x²]=[4]=0 and2([2]+[−2]+[−1])=2(2g+g+0)=0. Correct second identity gives4g=2c; printed erroneous variant need not agree | Corrected identity retained, source misprint flagged in README. |
| 4.15 permutation image | F₅:c order3→2c order3. F₇:c order2→2c=0. F₁₁:c order6→2c order3, so usingc instead gives wrong order6 | No change. |
| 4.15 monomial exact sequences | F₂ is excluded from infinite-field ψ sequence. Forℚ, permutation image has order 3; quotientB/⟨2c⟩=(ℤ/6)/(order3)=ℤ/2 | No change; natural arrows distinguished from abstract cyclic models. |
| 4.15 mixed Künneth and Tor input | C₃×C₃:H₃ has two pureℤ/3 terms and a Torℤ/3 term, not only pure terms. After the mixed-diagonal lemma the last term hasψ-image0 | No change; no natural Künneth splitting assumed. |
| 4.15 Γ and 2-primary vanishing | detΓ=1; Γ⁻¹P₁₂Γ has off-block(2,3)=1; P₃₄ has off-block(1,4)=1,(2,4)=−1; P₁₃P₂₄ has lower-right swap. Mod2 these entries persist as1 | Recomputed all three conjugations; no new repair error. |
| 4.15 cyclic maps | C₇ power2:H₁×2,H₃×4. C₂↪C₄:H₃ generator↦2mod4, injective. C₅ power2 onH₃:fixed equation4x=x implies3x=0, hencex=0 | No change. |
| 4.15 symmetric stability | Σ₀→Σ₁:H₀ ℤ→ℤ. Σ₁→Σ₂:H₁ 0→ℤ/2 failsn≥2. Σ₂→Σ₃:H₁ ℤ/2→ℤ/2. i=3 usesn=6 | S03 and S04; source Kerz has equivalent range. |
| 4.16 indecomposable monomial object | F₂:π₃=ℤ/24, product subgroup{0,12}, quotientℤ/12. ℚ:Tor(μ,μ)=ℤ/2, enhanced partℤ/4, resultℤ/4⊕ℤ/12 | S08 for omitted Hopf-cube supplier. |
| 4.16 free-G-set Barratt–Priddy and AHSS | G=1:sphere case. X=point:E² only p=0, abutmentπ*𝕊. Collapse X₊→S⁰ after basepoint unit=id, so bottom coefficient column survives | No change; general G comparison locally owned, not inferred as already supplied. |
| 4.16 extension and module products | F₄:μ₂=0,Tor(C₃,C₃)=ℤ/3, extension kernel0. ℚ:μ₂=ℤ/2→ℤ/4→ℤ/2; productηη² maps12mod24 | Conditional on S08's precise product input. |
| 4.17 doubling and cyclic Chern sign | C₇:γδ sends1↦2; c₂ of characters(+1,−1) is−u², coefficient 6 mod 7. At m=2,−1=1≠0. m=1 excluded | No change; doubling is not the injective detector. |
| 4.18 detector and cofinal moduli | F=ℚ:H₃(C₂)=ℤ/2 has nonzero image although doubling=0. μ=ℚ/ℤ:μ⊗μ=0 butTor=ℚ/ℤ. OnC₇ power2 detection scales4. Mod8 includes order2torsion | S06 for explicit upstream comparison; tensor/Tor correction sound. |
| 4.19 enhanced Tor and root model | ℚ:Ttilde=ℤ/4,ordinary Tor=ℤ/2. F₅:root modelμ₈⊂F₂₅ˣ. F₄:squaring onμ₃ is×2,iso but not identity. ℚ(ζ₃):conjugation acts×1 onTor,×(−1) onμ₆ | No change; abstract root model is not asserted naturally equivalent. |
| 4.19 nonsplitting | ℤ/4→ℤ/2 has preimages1,3 of 1, both double2≠0; divisible closure μ gives multiplication by2 with nonzeroμ₂kernel, still no additive section | No change. |
| 4.20 infinite Suslin sequence | ℚ:0→ℤ/4→ℤ/24→ℤ/6→0;kernel order4,target order6. Tensorℚ gives0→0 iso. F₂, F₃ excluded | No change to theorem and natural map. |
| 4.21 K₃ind rigidity and Bloch rigidity | F₂:K₃ind=ℤ/3 remainsℤ/3 overF₂(t), butB(F₂)=0 and infinite-field Bloch sequence givesB(F₂(t))=ℤ/3, so Bloch rigidity must excludeF₂. Same obstruction F₃:P=ℤ, versus finiteK₃ind=ℤ/8 | No change; distinction correctly retained. |
| 4.21 rational specialization and relation equality | At t=0,R(tx,ty) specializes[1], killed only in reduced relations. Collision at positions0,2 leaves[r]+[r⁻¹], rationally0 but possibly integral2torsion | No change; arbitrary-curve equality not inferred. |
| 5.1 finite K₃ and transfer | q=2:order3;q=4:order15. Restriction F₂→F₄ injects order3; transfer∘restriction=×2. Frobenius onK₃(F₄)=×2²=4 and its square=1mod15 | No change. |
| 5.1 norm-one matrix | F₄/F₂,basis(1,ω):Mω=[[0,1],[1,1]], determinant−1=1,trace1=ω+ω². M1=I,M0=0 excluded from units. Changing basis conjugates | No change; determinant equals norm. |
| 5.2 localized and integral H₃ | q=2,3,4,5,7,8,9,27:localized orders3,8,15,24,48,63,80,728; integral orders6,24,30,120,48,126,240,2184 | No counterexample; integral headline missing S03. |
| 5.2 stable elements and duality | G=S₃,r=3,P=C₃:normalizer inversion acts+1 onH⁴(C₃)=ℤ/3, stable groupℤ/3;degree 2 action−1 leaves0. d=0 duality would compare ℤ with H¹=0, excluded | No change; restriction/inclusion direction correct. |
| 5.2 quaternion resolution and periods | Q₈:H₁=(ℤ/2)²,H₂=0,H₃=ℤ/8,H₄=0. Cyclic SylowC₅ with normalizer inversion:period4,not2;trivial subgroupH₃=0=ℤ/1 | No change; no cyclic-group substitution forQ₈. |
| 5.2 subgroup injection and conjugation | C₃⊂SL₂(F₂):H₃order3 injects into order6. C₄⊂SL₂(F₃):H₃order4 injects into order24. F₂→F₄:localized order3→15injective | No change; extension argument uses actual maps. |
| 5.2 defining-characteristic part | q=4:additive group(ℤ/2)² has one invariant symmetric-tensor weight, givingℤ/2; q=8:topΛ³ yieldsℤ/2; q=27:Λ³ yieldsℤ/3; q=7:no invariant,0 | No change; exceptional list matches source. |
| 5.3 stabilization σF | q=5:integral order120→K₃order24 has kernel order5;localized order24→24iso. F₃→F₉:source order8 injects into order80 | No change; not claimed integrally isomorphic. |
| 5.3 quadratic Cartan detection | Fq²ˣ has order q²−1; q=2:3, q=3:8. Its degree-three image after regular representation has the same order, detected over the closure | No change; proof requires S06's maps. |
| 5.4 refined symbols and λ₁ | F₄:GF=1,RF=ℤ,λ₁=0,RP=P. F₅:GF=C₂,ε²=1;λ₁[2]=0,λ₁[3]=(ε−1)²=2(1−ε)≠0 | No change; dropping coefficients fails. |
| 5.4 refined relations and cross-ratio | F₅,R(2,3)=(1−ε)[2]+ε[4],augmentation[4]=0. crref(0,∞,a,b)=⟨a⟩[b/a]; nonsquare a givesε not 1 | No change. |
| 5.4 finite-word comparison | q=4: cardinality(P¹)=5; possible unaugmented top H₄ is retained, while H₁,H₂,H₃ vanish. | S04 placement; no false global acyclicity. |
| 5.4 bar comparison and repeated points | q=4:degree≤4chain map exists from exactness below top;repeated tuple assigned0. For normalized degenerate bar[1,1,1],source class0,so homotopy comparison requires zero homology image | No change; chain map rather than naive cross-ratio. |
| 5.4 E²,d² and torus shear | F₅:Ī=I/I²=ℤ/2,d²(ε−1)=nonsquare class; fourth-face producta⁻¹ at a=2 is3,the same square class as2. D-diagonal mixed coefficient−2 | No change; source is Ī, not I. |
| 5.4 remaining filtration and forgetful equivalence | F₅:Λ²C₄=0,Ī⊗μ₂=ℤ/2. Involution onI²≅ℤ acts−1, H₁(C₂,I²)=0; thus coinvariant kernel isB. F₄:μ₂=0,remaining term0 | No change; RP≅P not asserted in odd characteristic. |
| 5.4 λF kernel | q=4:30→5,kernel6;q=5:120→3,kernel40;q=7:48→4,kernel12 | No change; integral characteristic part retained. |
| 5.5 finite sequence and natural tF | q=4:0→ℤ/3→ℤ/15→ℤ/5→0; q=5:0→ℤ/8→ℤ/24→ℤ/3→0; q=7:0→ℤ/12→ℤ/48→ℤ/4→0 | No change; specified injected left map precedes subgroup uniqueness argument. |
| 5.5 quaternion residue removal | Odd q:middle possible 2-residue is removed by the comparison cycle. q=5 gives B order3,not6; q=7 gives 4,not8 | No change; prime 2 not discarded. |
| 5.6 odd coefficients and Cartan | (q,n)=(5,3),(11,3),(4,5):all compared quotientsℤ/3,ℤ/3,ℤ/5. (7,3)fails gcd(n,q−1)=1 and n∣q+1. n=1:all0 | No change; even characteristic included. |
| 5.7 number fields | ℚ:(r₁,r₂,w₂)=(1,0,24),K₃=ℤ/48,D=ℤ/2,K₃ind=ℤ/24. ℚ(i):(0,1,24),D=0,K₃=ℤ⊕ℤ/24 | S01 supplier gap minimality; arithmetic consequences correct. |
| 5.8 Rogers homomorphism and period | L(1/2)=π²/12;ρ(1/2)=−π²/12,ρ(2)=π²/12,ρ(−1)=−π²/4. Sum c=−π²/6 has order 6 mod π²,butorder3 mod π²/2 | No change; period fixes the normalization and excludes rescaling. |
| 5.8 finite-certificate transfer | No pairs:k[1]=0 iff k=0 over both real closed fields. Indicator(2,3)has five rational arguments in both. ξ=[2]−[3]has augmentation0 but free coefficients+1,−1,thus not0 | No change, conditional on the declared precise gap. |
| 5.8 formally-real order and B(ℚ) | ℚ,ℝ and a real closure of ℝ(t): rational certificate6c=0 and detectorc≠0,…,5c≠0. B(ℚ)order6 from 24/4,c generator | No change. |
| 6.1 relation transports and mod n | n=0:integer quotientP/0=P;n=1:zero. Indicator(2,3)maps0 in both. Certificate[1]kills degenerate one,but[0]new has order3overF₂ | No change; distinct CGZ versions not collapsed. |
| 6.2 boundary certificate carrier | ℚ,ξ=[2]+[−1]:cross coordinate−1+1=0;ξ=[2]:−1mod2≠0. Primitive sixth root ω:diagonal1·5=1mod2,twice gives0 | No change; diagonal congruences essential. |
| 6.2 constructor and presentation independence | ofData([2]+[−1])=c,ofData(0)=0;reflected relations give equal c. F₅:[3]rejected,2[3]accepted. c has order 6overℚ,its CGZ new image[0]order3 | No change; constructor uses kernel boundary. |
| 6.3 integral root multiple | δ:ℤ→ℤ/2,x=1,m=2 gives2∈kerδ,not 1. m=0gives0; b=2∈ker,m=3gives6. ζ=1has raw quotient symbol0 | No change; no implicit division. |
| 6.3 primitive sixth root criterion | F=ℚ(√−3):∂[ω]=−ω∧ω=nonzero diagonal order2;2[ω]is a cycle. F=ℚ(ζ₁₂):ω=ζ₁₂²,diagonal coefficient4=0,so[ω]is a cycle | No change; −1-square condition verified. |
| 6.4 coefficient division and annihilator independence | δ:ℤ→ℤ/2,x=1,R=ℤ/5:annihilator 2 gives coordinate 3 in basis 2;annihilator 4 gives2·4=8=3. Inclusion multiplies2,so image1. R=ℤ/2:inclusion tensor zero and 2 nonunit | No change; no flatness assumed. |
| 6.4 localization and primitive roots | ℚ,ζ=−1,n=3:2[−1]=h(−1)=3c,then2h=6c=0mod3. At m=0 unit denominator forces zero coefficient ring,all classes0 | No change; zero-ring coefficient case consistent. |
| 6.5 Suslin fibre and torsor | ℤ/24→ℤ/6,fibre1={1,7,13,19};kernel={0,6,12,18} acts freely transitively. Sixfold values6,18,6,18,none 0,so no section | No change; arbitrary fibre has no canonical basepoint. |
| 6.5 finite bar witness | G=1,β≠0:no witness. β=0:zero chain and[1³]distinct witnesses with same homology. G=S₃,g=(12):[g,1,1]boundary≠0,not a witness | No change; chain extensionality is not determined by homology. |
| 6.6 mixed compatibility | F₄→F₄(t):(0,∞,1,ω)gives ω by both routes. Reciprocal normalization givesω²and[ω²]=4[ω]≠[ω]inℤ/5. Zero class maps0in both | Repaired square discriminates normalization. |
| 6.6 exact rational and finite quotients | ℚ integral0→ℤ/4→ℤ/24→ℤ/6→0;tensorℚ gives0≃0. Mod 2 snake has nonzero Ttilde/2=ℤ/2,so quotient cannot ignore the left term. Odd moduli ignore 2-kernels,not arbitrary root-torsion | No change. |
| 6.7 finite Chern indecomposable isomorphism | n=1:both groups0. E=ℚ,n=5:K₃/5=0 but K₃(;ℤ/5)containsK₂[5]≠0;{2,−31}is 5-torsion because{32,1−32}=0 and its 31-residue 2 has order 5 | No change; finite coefficients are not the ordinary quotient. |
| 6.7 real-sign and additivity controls | Odd n:(ℤ/2)^r₁⊗ℤ/n=0;even n not 0. E=ℝ,mod2degree2:c₂(2β)=1 but2c₂β=0. Degree3lies outside the exception | Repaired Chern qualification correct. |

### Supplier, ownership and headline audit

The eight bold contract groups were checked against their current files. This table records their inputs, hypotheses and convention controls. Counts here are contract groups, not a claim that a roadmap's entire contents have already been formalized.

| Bold contract / README location | Resolved supply and scope | Computed convention control / outcome |
|---|---|---|
| Stable groups and low K-theory :47 | GeneralAlgebraicKTheory §§3.3–3.4; AlgebraicKTheory A5; StableHomotopyKTheory §3.29; K2SymbolsBrauer §§5.4,5.6,5.12–5.14,7.2,8.1–8.4,10.32 | Stable St, not finite St: zero ring gives St=E=1 and K₂=0. Product-normalized m₂ sends {2,5} to the class whose right residue at 5 is 3, not the classical tame value 2. Number-field Milnor K₃ has rank r₁ over 𝔽₂: ℚ gives 1, ℚ(i) gives 0. |
| Plus and external products :48 | StableHomotopyKTheory §§1.30,1.32,3.26–3.32,4.14; GeneralAlgebraicKTheory §§1.8,3.2,3.12,7.4 | BSt⁺ is 2-connected: at ℤ its π₂=0, whereas BE⁺ has π₂=K₂(ℤ)=ℤ/2. Right multiplication by [−1] sends the generator of K₂(ℤ) to 24 in K₃(ℤ)=ℤ/48. |
| Hopf input :49 | AlgebraicTopology Stage 8; completed UniversalCovers Stages 2–3; StableHomotopyKTheory §§5.19,6.3,7.1; local §1.5 | For two 2-spheres π₃=ℤ³ and the pinch-Hopf class is (1,1,1); for an H-space the Whitehead coordinate maps to 0. The transposition has determinant −1, reducing to 1 in characteristic two. The missing η³ contract is S08. |
| Motivic and Chern input :50 | KTheoryFiniteLocalFields §§1.8,3.0,3.0a,6.10 checked with n,ν and invertibility restrictions | Diagonal multipliers for degrees 1,2,3 are 1,−1,2. In degree two over ℝ mod 2, c₂(2β)=1 but 2c₂(β)=0. Degree three is additive. S05–S06 concern the separate algebraically closed input, not the imported Milnor theorem. |
| Spectral sequences :52 | StableHomotopyKTheory §§1.17,7.27; AlgebraicTopology Stages 2–5; pinned Shapiro/transfer maps | H₃(C₃×C₃)= (ℤ/3)³ includes a Tor summand; the two pure terms alone give only (ℤ/3)². For a point the AHSS is its p=0 column. Its sphere-module structure is locally owned; third-stem multiplication needs S08. |
| Arithmetic :53 | GeneralAlgebraicKTheory §13.8c; KTheoryFiniteLocalFields §1.5; GlobalNumberFields Layer 1; ArithmeticKTheory current head | At q=4, K₃ has order 15 and Frobenius acts by 4. At ℚ(√2), −√2 and √2 give the two independent sign vectors. S01 removes the now-redundant arithmetic gap. |
| Smooth-curve specialization :55 | AlgebraicCurves Layer 12A gives the DVR at a regular closed point; README assumes a smooth integral curve and rational evaluation points | At 0 on ℙ¹ the local parameter t has valuation 1 and residue field F. A nonrational closed point has an extension residue field, so the same target F is not asserted there. The nodal nonregular local ring is excluded. |
| Interval Rogers function :56 | PolylogarithmFunctions §§6.1,6.3–6.5, with the unshifted interval normalization | L(1/2)=π²/12, reflection gives π²/6. The local shifted detector gives ρ(c)=−π²/6 modulo π²; changing the period to π²/2 would give order 3 instead of 6. Projective foundations also owned by this supplier: S02. |

The two declared gap slugs occur in both README and design/plan.json with named suppliers. The real-closed transfer gap is precise, and RealAlgebraicGeometry's main Layer 6 only asserts the ℝ version; its Layer 1 supplies ordered real closures. It remains an accepted conditional input. The number-field gap's whole requested contract is present at the supplied ArithmeticKTheory head, which is why S01 concerns minimality. Neither gap is treated as unowned just because it is not implemented.

Ownership was searched by objects in main, Completed, board packages, the open-roadmap index and all **21 supplied sibling folders**, including their Suggested.lean files. Relevant open-head matches were read. Polylogarithms explicitly consumes K3BlochGroups Layers 3,4,6 and uses the opposite displayed boundary; on [3] the two valuation tests are −1 and +1. Its Goncharov convention is transported, not identified literally. ArithmeticKTheory supplies ambient groups independently. The other supplied siblings produced no competing K₃/Bloch construction; occurrences of Rogers–Ramanujan in QSeriesPartitionsAndMockModularForms concern a different object.

ColemanIntegration L2.Fb, README:1458–1475, also describes the integral pre-Bloch quotient, tensor cokernel and Bloch kernel. It is later in the supplied merge order (113 versus K3BlochGroups at 86). K3BlochGroups is therefore the earlier owner of these carriers: the downstream Coleman block must consume Layer 3 and keep its evaluation/coordinate adapters. This is recorded as a downstream ownership correction, not repaired by adding an upward supplier here. PolylogarithmFunctions at position 36 is the earlier owner of the projective cross-ratio and is handled in S02. No declaration in this package shares a fully qualified name with a declaration found in the searched roadmaps or pins.

The README's headline inventory is: homological K₃ comparison and Hopf kernel; Milnor injection and motivic edge; integral tensor diagonal; GL and symmetric-group homological stability; cyclic power-map action; natural Suslin sequence and transcendental rigidity; localized and integral finite SL₂ homology; finite Suslin sequence and mixed-field compatibility; number-field quotient applications; Rogers/order-six detector; and the genuine finite-coefficient Chern comparison. The four current signatures cover tensor diagonal, cyclic powers, localized SL₂ and formally real order six. S03 identifies three further statable milestones. The other headlines require the missing Quillen, Milnor/motivic, plus-space, enhanced-Tor, analytic Rogers or finite-coefficient Chern carriers named in the module docstring. Finite certificates, root division and fibre identities are interfaces rather than replacement headlines.

Pinned searches checked the native object definitions, not just the proposed names: antisymmetricTensors is the −1 eigenspace, not the tensor cokernel; the exterior-square comparison in TauCeti/LinearAlgebra/TensorSquare.lean requires invertibility of 2. On M=ℤ the eigenspace is 0 but the cokernel is ℤ/2. The group-homology map has an actual representation morphism; the retained cyclic theorem fixes its underlying map to the identity. The finite transfer maps require finite index. Tau Ceti's all-degree corestriction Mackey theorem uses a profinite group, open/closed subgroups and discrete coefficients; finite groups with discrete topology satisfy these hypotheses. The exact source declarations were found in the pinned modules named in the README. No canonical Quillen, Milnor, Bloch boundary or enhanced-Tor carrier was found at the pins.

### Source audit

There are **15 manifest works: 12 readable certified works and 3 settled waived works**. Both versions of CGZ remain under the single cgz2021 key. The table records **40 grouped locator checks**, including calculations taken from proofs, not just theorem titles. Repeated citations to the same paragraph count once. Source text is not reproduced.

| Locator checked | Source witness | Scope / outcome |
|---|---|---|
| Weibel IV.1.9 | weibel lines 15948–15957 | Universal central extension gives the fibre and K₃–H₃(St) comparison for unital rings. |
| Weibel IV.1.19–1.20 | weibel lines 15824–15879 | H-space Hopf kernel and the right [−1] product. |
| Weibel IV.1 Exercises 1.11–1.12 | weibel lines 15962–15996 | Block sum, η↦[−1], compatible products and composition. |
| Hatcher Examples 4.51–4.52 | hatcher lines 16494–16571 | Hopf generator and finite wedge calculation; passage through finite subwedges is separately explained. |
| Hatcher §4.2 Exercise 37 | hatcher line 17029 | Whitehead products vanish for an H-space. |
| Weibel VI.4.3.1–4.3.2 | weibel lines 29189–29217 | Low-degree motivic exact sequence and all-field Milnor K₃ injection. |
| Weibel VI.1.3–1.6 | weibel lines 28030–28295 | Algebraically closed coefficient/divisibility input; characteristic-zero torsion hypotheses retained. S05 concerns degree zero, S06 formal supply. |
| Weibel VI.5.1 and opening | weibel lines 29550–29573 | Antisymmetric target, symbols and exceptional q=2,3. |
| Weibel VI.5.2–5.2.1 | weibel lines 29587–29616 | Natural sequence and real/rational order-six consequence. |
| Weibel VI.5.3 | weibel lines 29628–29653 | Number-field structure and indecomposable quotient. |
| Weibel VI.5.4 | weibel lines 29663–29705 | c and inversion identities. The printed assertion placing every inversion element in B is not copied; its exterior boundary is tested. |
| Weibel VI.5.5–5.6 | weibel lines 29710–29760 | Ordered configurations, infinite exactness and projective coinvariants. The erroneous seven-point count for P¹(𝔽₂) is avoided. |
| Weibel VI.5.7–5.8 | weibel lines 29768–29844 | Rank-two sequence. Scalar triple stabilizer is diag(a,a), correcting the printed determinant-one diagonal. |
| Mirzaii Lemma 4.1 | mirzaii lines 365–398 | The raw differential is compared after the roadmap's total-sign adapter and shear. Only the explicit chain calculation is used. |
| Weibel VI.5.9 | weibel lines 29872–29917 | Cone differential (dᵃx−Ny,−dy), cyclic rotation and general position. Distinct tuples are not incorrectly treated as a simplicial subobject. |
| Weibel VI.5.10–5.13 | weibel lines 29993–30082 | Rank comparison, torus kernel, stable spanning and permutation image. |
| Weibel VI.5.15–5.16 | weibel lines 30177–30265 | Monomial and homotopy exact sequences. The local proof includes the mixed Tor term omitted by a naive Künneth direct-sum reading. |
| Weibel VI.5.17 | weibel lines 30321–30353 | AHSS low-degree sequence; normalized stable product input separately flagged in S08. |
| Weibel VI.5.18–5.19 | weibel lines 30366–30420 | Doubling, Chern sign and closure detector. |
| Weibel VI.5.20 and proof | weibel lines 30421–30448 | Enhanced extension and nonsplitting. |
| Weibel VI Exercises 5.3,5.5–5.6 | weibel lines 30485–30501 | Small-field and symbol misprints were not propagated; finite presentations and corrected identities were recomputed. |
| Hutchinson Theorem 2.9 proof | hutchinson2013 lines 367–444 | Symplectic-symbol presentation is used in the proof's infinite-field branch, not its small finite-field exceptions. |
| Hutchinson Corollaries 3.6–3.9 | hutchinson2013 lines 704–738 | Localized H₃, actual cyclic subgroup injection, conjugation and stabilization. |
| Hutchinson Lemma 3.14 | hutchinson2013 lines 861–905 | Defining-characteristic exceptions q=2,3,4,5,8,9,27 retained. |
| Hutchinson Theorem 4.3 | hutchinson2013 lines 943–953 | The possible middle two-primary residue is retained before the quaternion calculation. |
| Hutchinson Lemmas 4.4–4.6 | hutchinson2013 lines 968–1026 | Finite-word top degree and the low-degree hyperhomology range, including q=4. |
| Hutchinson §§4.3–4.4 | hutchinson2013 lines 1040–1100 | Central Pontryagin action has sign (−1)^degree; tuple stabilizers are B,T,μ₂. |
| Hutchinson Lemma 4.7 and §4.8 | hutchinson2013 lines 1294–1410 | Truncation comparison, Weyl sign and all remaining filtration terms. |
| Hutchinson §6.5 | hutchinson2013 lines 1625–1637 | Actual quaternion bar cycle, not merely an abstract group order. |
| Hutchinson Lemma 7.1 and Remark 7.2 | hutchinson2013 lines 1645–1665 | RB≃B, whereas RP≃P fails in odd characteristic. |
| Hutchinson Lemmas 7.3–7.4 and Corollary 7.5 | hutchinson2013 lines 1668–1737 | Inversion/c relations, quaternion correction and finite sequence. The roadmap restricts the unmodified presentation to q≥4. |
| Kerz Theorems 1–2 | kerz lines 15–23,80–104 | Finite injective-word exactness and the equivalent symmetric-group stability range; placement defect S04. |
| CGZ arXiv v3 Definitions 1.1,2.1 and Lemma 2.2 | cgz2021 lines 74–100,380–410 | Exterior convention; the literal C⊆A issue is corrected by intersection with the kernel. |
| CGZ published Definition 2.1 and Lemma 2.2 | cgz2021 published extraction lines 445–488 | The target kills u⊗(−u), where −u is the field negative. It is not the old exterior target. |
| CGZ published §4.2 | cgz2021 published extraction lines 1193–1233 | Cartan comparison; roadmap retains defining-characteristic homology instead of copying the printed integral q²−1 assertion. |
| CGZ circular-root remark | cgz2021 lines 1520–1524 | The integral multiple D[ζ_D] is a cycle; this does not make the unmultiplied symbol a Suslin cycle. |
| Goncharov §§1.8–1.9 | goncharov lines 675–715,760–814,903–925 | Opposite boundary sign, curve relations and the conjectural arbitrary-curve assertion. The rational-curve result is proved separately. |
| Levine Theorems 4.11–4.12 | levine lines 2825–2882 | Finite-coefficient indecomposable comparison, retaining the actual finite-coefficient groups. |
| Hutchinson 2024 Theorem 2.10; Weibel Chern Proposition 2.4 | hutchinson2024 lines 145–180; weibel-chern lines 398–403,437–446 | Invertible moduli including even moduli; the degree-two additivity exception is explicit. |
| Marker Theorem 3.5, Corollary 3.6, Proposition 4.1; Zagier II.1.A | marker lines 398,429,444; zagier lines 1023–1065 | Real-closed transfer and interval Rogers normalization. Zagier alone does not certify the shifted π²-period descent; its Suslin locator remains waived. |

All 57 labelled Check blocks and the separate Chern-additivity Check were read and tested against their section's definitions and formulas; the 123-row statement ledger and eight-row declaration ledger record computed controls. The repeated-law Checks identified in S09 are not counted as independent mathematical evidence. Main, completed and open-head contracts were resolved for **13 named suppliers**: AlgebraicKTheory, AlgebraicTopology, UniversalCovers, GeneralAlgebraicKTheory, StableHomotopyKTheory, K2SymbolsBrauer, KTheoryFiniteLocalFields, ArithmeticKTheory, GlobalNumberFields, AlgebraicCurves, PolylogarithmFunctions, RealAlgebraicGeometry and SchemeKTheoryOperations. HomotopySpheres and FourManifolds were additionally read to give S08 a concrete repair. The unresolved related-work claims are isolated in S07.

The prescribed dependency command, run on the unchanged package README with the supplied order and movable flag, returned exit status 0:

```text
depcheck: 23 roadmaps, 193 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This checks cross-roadmap direction; it does not detect the within-roadmap forward prerequisite in S04. The original pull-request diff is seven files, all under packages/K3BlochGroups. At completion git status showed only the new review report as untracked; README, Suggested.lean, plan, manifests and pins were unchanged.

## Not verifiable

- **Settled waived sources:** bloch, Lecture 6; suslin-1984, §§1–3 and Theorem 3.4, pp.188–204; suslin-1991, §§1–5, pp.217–239. Their contents were not guessed and they were not requested again. In particular the full frame induction, ordered-torus identification, monomial filtration and shifted real-detector descent remain uncertified at their primary locators. Available secondary proofs and the explicit calculations are recorded above.
- **Formal elaboration:** no Lean command was run. The supplied eight-declaration signature audit was used and compared with every current signature. The three proposed S03 additions are mathematical repair specifications on native carriers, not claimed to be elaborated Lean code.
- **Implementation proofs:** the 123 finite/boundary calculations cannot certify every spectral-sequence differential or chain homotopy. They establish the displayed counterexamples and convention tests; the source audit records which proof inputs could be read. No completed proof is inferred from a sorry.
- **Future supplier delivery:** the declared real-closed gap remains conditional. The additional precise positive-characteristic torsion contract proposed in S06 is a repair, not a claim that the current supplier exports it.
- **Missing consumer texts:** S07 records the four unresolved named attributions. EllipticKTheory and ArithmeticQuantumTopology appear only in the consumer list; no mathematical supplier assertion was inferred from those names. Ownership against the 21 supplied open heads was checked; no claim is made about private or unindexed work.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "cef8286a27412c0725c8d1715d9aa99a7a6eeda1", "job": "RT-K3BlochGroups~2a", "model": "gpt-6-astra", "worker": "chris-4"} -->
