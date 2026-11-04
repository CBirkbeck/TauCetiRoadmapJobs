<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1674#issuecomment-6399316936 -->
Review (codex) of 00f55f8

Verdict: needs_changes

1. **F01** (P1) G1 remains an unowned prerequisite

   **Location:** `packages/SheafConvolutionOnAbelianVarieties/design/plan.json:3427`, gap G1; `packages/SheafConvolutionOnAbelianVarieties/README.md:931–943`. The README says: “The target includes these uniform estimates; a finite sweep alone does not prove the unbounded range.”

   **Claim:** The classification in §6.6 and classical monodromy in §6.7 have an owned supply of the uniform comparisons and the small occupancy cases.

   **Witness:** G1 has `id`, `neededBy` and `detail`, but no supplier or section. The README has no `gap:G1` supplier contract. ClassicalArithmeticCompletion §§2.57, 2.71, 2.77–2.78 supply bounds, not this entire list.

   **Repair:** Assign G1 through intake to an earlier named owner, with an exact section and matching machine-readable and README contract. ClassicalArithmeticCompletion is the natural owner for an additional theorem giving exactly the displayed Eulerian inequalities and the B.11–B.12 parameter bounds. Import that additional theorem in §6.2, distinguishing it from the existing general bounds; do not re-plan those bounds. State mathematical inequalities with their ranges, rather than a numerical algorithm or floating-point certificate. If local ownership is intended instead, the legacy unowned design obligation must be formally resolved as local ownership; merely adding a proof sketch does not change its recorded supplier `none`.

   **Validation of the repair requirement:** I checked 2,581 instances using integers and rational upper bounds for square roots, including all applicable displayed ranges with 5≤n≤260. They passed. For example, n=5 gives 1848<1875 and 390<15625. This cannot discharge a universal n≥5 contract. The ownership correction must cover the infinite ranges as well as the finite occupancy cases.

2. **F02** (P1) G3 has no supplier contract

   **Location:** `packages/SheafConvolutionOnAbelianVarieties/design/plan.json:3438`, gap G3; `packages/SheafConvolutionOnAbelianVarieties/README.md:1265–1276`. The README says: “This marked-relation theorem is part of Layer 9, rather than a consequence asserted from CDK alone.”

   **Claim:** Closed identity-orbit relations descend through trace summands, capture the chosen period fibres, and stabilize to supply one family with finite monodromy on every torsion-character summand.

   **Witness:** G3 still has no named supplier or section and no `gap:G3` contract. CDK line 54 and line 59 supply bounded-norm algebraicity and orbit loci, not these trace and period-fibre identifications.

   **Repair:** Resolve G3's recorded ownership, with a matching contract and dependency. For external supply, assign the general marked-variation statement to an earlier owner such as ShimuraData: specify the polarized lattices, the flat pullback/trace maps, the identity orbit, and the period quotient, and require both descent and agreement with the period-fibre relation. Keep the hypersurface application here. If the theorem stays local, intake must explicitly settle the existing unowned G3 record as local ownership. It is not enough to rename an arbitrary total-cohomology Hodge isomorphism as a marked one.

   **Validation of the required distinction:** With u=(1,0)ᵀ, t=(64,0), one has tu=64 and e=ut/64=diag(1,0), e²=e. The swap P has PeP⁻¹=diag(0,1)≠e. Requiring preservation of the flat designated projector excludes precisely this wrong model; the further assertion that the chosen period relation supplies such identifications remains an explicit theorem, not a consequence of that requirement alone.

3. **F03** (P2) Support maps need irreducible factor components

   **Location:** `packages/SheafConvolutionOnAbelianVarieties/README.md:618`: “A multiplicity-one irreducible conormal component supplies dominant rational maps to both supports.”

   **Claim:** A multiplicity-one component of Λ₁◦Λ₂ dominates the whole supports of the two effective clean cycles, which have not been required to be irreducible.

   **Witness:** K2 line 1200, Lemma 5.2.2, p.25, assumes irreducible Z₁,Z₂ with finite stabilizer and a component of Λ_Z₁◦Λ_Z₂. It does not make the stated reducible-support assertion.

   Take Λ₁=Λ_x+Λ_y and Λ₂=Λ_z+Λ_t for points with four distinct sums. Both factors have Gauss degree 2, and Λ_(x+z) occurs with multiplicity 1. Its one-point support cannot dominate the two-point support {x,y}. This tests the cycle inference used in the sentence; it is not claimed to realize every preceding hypothesis on K.

   **Repair:** Select the irreducible components Λ_Z₁ and Λ_Z₂ contributing to the chosen Λ_Y, and state the maps Y⇢Z₁ and Y⇢Z₂. Explain that multiplicity one in the effective total product gives multiplicity one for that contributing pair. If the later hypersurface argument needs the entire factors, first prove they are single components in that application. The point-cycle example then gives the valid maps {x+z}→{x} and {x+z}→{z}; the false maps onto two-point unions disappear.

4. **F04** (P2) The Frobenius collision set omits nonidentity torsion values

   **Location:** `packages/SheafConvolutionOnAbelianVarieties/README.md:1166`: “two choices would give an excluded collision on B.”

   **Claim:** After recognizing that T_r is a finite union of torsion translates of T_B, it suffices to exclude equality of σᵉχ and σᵉ′χ on B.

   **Witness:** Two bad tuples imply their coordinate quotient lies in T_r, not necessarily in T_B. Equality on B detects only the identity component's restriction value.

   Use an elliptic curve and the embedded subvariety a↦(2a,3a,5a) of E³. Its character kernel has equation χ₁²χ₂³χ₃⁵=1. The first-axis inverse image is Π(E)[2], whereas T_E={1}. On a cyclic order-four character subgroup take σ=3, as for a scalar Frobenius of modulus 3 over residue cardinality 9. For M=1, fix (e₂,e₃)=(1,0). Both e₁=0 and e₁=1 are bad: the exponents are 2+9+5=16 and 6+9+5=20, both 0 modulo 4. But χ and σχ are distinct: their difference is 2 modulo 4. Thus the displayed equality collision does not exclude either choice on this permitted axis. The example diagnoses the proof step, not a counterexample to the avoidance theorem.

   **Repair:** Write ρ_B for restriction and E_r=ρ_B(T_r), a finite torsion subgroup. For every exponent pair exclude all solutions of (σᵉ−σᵉ′)ρ_B(χ)=η for every η∈E_r, not only η=0. Nonzero determinant gives finite fibres on prime-to-p torsion; their inverse images are finite unions of torsion cosets of the proper kernel T_B. Then two bad choices really imply membership in the excluded set and the original box bound holds. In the example η=2 is now excluded. Keep the prime-to-p restriction and the existing inequality M(M+1)^(c−1)<(M+1)^c.

5. **F05** (P2) The minuscule table needs a nonzero-weight hypothesis

   **Location:** `packages/SheafConvolutionOnAbelianVarieties/README.md:111`, and the matching `minuscule-weight-table` gap in `design/plan.json`: “the minuscule dominant weights are … and none for E₈, F₄ or G₂.”

   **Claim:** The listed weights exhaust all minuscule dominant weights.

   **Witness:** K1 line 430 defines minuscule by a single Weyl orbit; line 433 restricts its table to nontrivial representations. Weight 0 has orbit {0} and gives the one-dimensional trivial representation, including in E₈.

   **Repair:** Say “the nonzero minuscule dominant weights” in both gap records, or equivalently classify nontrivial irreducible minuscule representations. Retain the ordinary definition of minuscule. On A₁, weight 0 has dimension 1 and the fundamental weight has dimension 2; on E₈ the former still exists, while the repaired table asserts there is no nonzero minuscule weight. The hypersurface application already has N=n!d≥6, so it excludes the trivial representation independently.

6. **F06** (P2) The Albanese gap combines two independent contracts

   **Location:** `packages/SheafConvolutionOnAbelianVarieties/README.md:73`, and the matching `ample-divisor-albanese` gap in `design/plan.json`.

   **Claim:** One supplier gap requests both the Albanese isomorphism for a smooth ample divisor in dimension at least three and extension of rational maps from arbitrary smooth varieties to abelian varieties.

   **Witness:** The two clauses have different inputs and uses: §4.5 needs Alb(H)≅A, whereas K2 line 1221 uses rational-map extension on a resolution times affine space in the §4.3 support-map proof.

   **Repair:** Keep `ample-divisor-albanese` for the dimension≥3 Albanese isomorphism. Add a separate precise rational-map-extension gap, with the same earlier supplier and a named section, in both the plan's gaps and README contracts. Give the source, target and smoothness hypotheses there, and point the two consumers to the appropriate contract. This is the brief's compound-contract defect, not a claim that either mathematical theorem is false. For a separating test, a rational map P¹⇢E is constant and extends, although no smooth ample divisor in an abelian variety of dimension≥3 is an input. Smoothness matters: the identity on an elliptic normalization cannot descend after identifying two distinct points to a node.

7. **F07** (P3) The n=2 Check has the wrong right-hand value

   **Location:** `packages/SheafConvolutionOnAbelianVarieties/README.md:941`: “becomes 1/2<−1”.

   **Claim:** At n=2, A(n,1)−1=−1.

   **Witness:** The two permutations of Fin(2) have respectively zero and one descent. Thus A(2,1)=1, so A(2,1)−1=0, not −1.

   **Repair:** Replace the computed comparison with 1/2<0. It is still false and remains a valid negative control against dropping n≥5. The supplier's convention in ClassicalArithmeticCompletion §2.18 and the native permutation count in `hasEulerianExteriorWeights` both give 1.

Seven findings: two P1, four P2 and one P3. The package is repairable. The six Lean theorem signatures elaborate, and the mechanical dependency check has no ordering problems. Neither fact resolves the unowned obligations G1/G3 or the proof-route defects below. No author file was changed.

## Verified sound

The audit covered all 52 numbered targets, the additional row predicate in §5.1, the four Lean definitions, the six theorem signatures, all `Needs` lines and the supplier contracts. Every numbered target has Checks and a locator; all ten layers have Examples and Dependencies. The prose follows the upstream layer structure, compared with the main-branch ComplexTori and LocalGaloisGroups roadmaps. The retained definitions have API lists and at least three Checks; some Checks repeat each other, but the substantive negative controls include zero Euler characteristic versus derived negligibility, arithmetic versus geometric semisimplicity, unordered versus ordered subsets, and marked versus unmarked Hodge isomorphisms.

No route-specific restriction to good coefficient primes, bypass of the arbitrary semisimple category, copied source passage, sorry-defined data, forbidden import, `lemma`, or `set_option` was found. The characteristic-zero multiplication-cover argument allows every m>0, including m divisible by the cohomological prime. The Frobenius lemma separately restricts the character order to be prime to the residue characteristic, where its determinant argument applies. This is a stated local theorem, not a replacement for the characteristic-zero cover theorem. The scope is a distinct convolution library; the geometric and representation-theoretic foundations are imported by owner. G1 and G3 are exceptions to the claimed ownership completeness, as recorded above.

### Seeded source sample

All nine manifest texts were readable from the supplied legal-source cache. There were no entries flagged unverified, waived or uncertified, and no additional source fetch was necessary. Locators below refer to the versions recorded in `sources.toml`, using printed pages and the supplied line-numbered extraction. “Supported” means the named statement and hypotheses were read, not that a Lean proof was completed.

| Target | Source locator actually read | Outcome |
|---|---|---|
| 0.1 Geometric character space | LS §4, p.30, lines 1388–1397 | Supports continuous characters and restriction loci; products and base extension are explicitly supplied separately. No algebraic-torus identification is asserted. |
| 0.5 Negligible perverse sheaves | LS Lemma 2.2, p.15, lines 672–685; KW Proposition 10.1, pp.21–22, line 787; Lemma 13.1, pp.29–30, line 1084 | Supports nonnegative Euler characteristic, the Serre subcategory and perverse-cohomology definition of the thick ideal. |
| 1.1 Character-admissible perverse sheaves | LS definition and Lemma 2.5, p.16, lines 707–740; KW §13/Theorem 13.2, p.30, lines 1087–1114 | The all-subquotients condition and quotient tensor closure are retained. |
| 1.5 Euler-one perverse sheaves | KW Proposition 10.1(b), pp.21–22, line 794 | Supports rank-one skyscrapers after excluding negligible constituents; it is not asserted for an arbitrary unreduced representative with additional negligible summands. |
| 2.1 Arithmetic and geometric categories | LS Lemmas 2.6–2.7, pp.16–17, lines 749–793 | Geometric semisimplicity, the Hom quotient and summands of arithmetic pullbacks match. The arbitrary semisimple direct-image input is declared as a gap. |
| 4.1 Clean conormal cycle ring | K2 Definition 1.2.2, p.8, line 348; Example 1.3.2, p.9, line 433 | Integral coefficients, generic degree, multiplicities and isogeny pushforward are retained. |
| 4.3 Microlocal tensor factorization | K2 Theorem 2.3.1, p.15, line 728; Lemma 5.2.2, p.25, line 1200; Proposition 6.1.1, pp.29–30, line 1402 | Factorization has the necessary nonzero split-derived hypothesis. The support-map sentence drops irreducibility: R03. |
| 4.7 Inversion symmetry and classical form | LS Lemma 3.11, p.24, lines 1071–1098 | The line-valued pairing and parity (−1)^(n−1) match; no canonical trivialization of the value line is inserted. |
| 5.1 Exterior-power weight multiplicity | LS Lemma 3.14/equation (3), pp.25–27, line 1159; Appendix B/equation (10), p.93, line 4343 | The finite subset definition, histogram multiplicities, shifts and zero extension agree. Source proof misprints are listed below. |
| 5.3 Exceptional threefold degree | LS Lemmas B.6–B.8, pp.95–96, lines 4600–4659 | The package correctly uses d=choose(a+b,a)/6, N=6d and j≥1 in geometric exceptions. |
| 5.5 Extremal occupancies and width | LS Lemmas B.2–B.3, pp.93–94, lines 4380 and 4420 | Finite support, k-normalization and endpoint width hypotheses agree. |
| 5.7 Threefold classification | LS Lemmas B.5–B.8, pp.95–96, lines 4503–4659 | The classical (m,k,d)=(4,2,1) branch and subsequent Pell branches are both kept. |
| 6.1 Adjacent occupancy ratios | LS equations (13)–(14), pp.99–100, line 5013; Lemma B.10, p.100, lines 5053–5075 | All five second ratios were recomputed. The package correctly weakens the product bound to ≤ when an adjacent occupancy vanishes. |
| 7.4 Jordan's theorem | BR Theorem 1.1, p.1, line 12; arbitrary-field discussion, line 67; LS Lemma 4.5 proof, p.32, line 1484 | The finite-entry field embeds in C. The bound is uniform in the characteristic-zero field; the finite-modulo-scalars extension is justified separately. |
| 8.1 Frobenius avoidance | LS Lemma 4.8, pp.34–35, lines 1582–1627 | Prime-to-p scope and inside-coset counting are corrected. The remaining affine torsion collision defect is R04. |

Also opened W's rigidity proposition and proof (lines 10–24, pp.1–2), EHS Theorem A.1 (line 781, pp.20–21), CDK Theorem 1.1/Corollary 1.3 (lines 54/59, p.2), JV Proposition 6.1 (line 941, pp.19–20) and Theorem 12.1 (line 1713, p.38), the LS surface/fourfold/exclusion arguments and the LS period proof (lines 1698–1750). The period proof does not by itself discharge G3.

### Computed adversarial pass

Here δ_x is a rank-one skyscraper, A(n,q) is the descent Eulerian number with the stated zero extension, and W is the actual subset count. In sheaf-theoretic rows, the computations test conventions, degenerate inputs and the cited implications; they are not claimed to prove the general geometric theorem. “Retain” means no defect was found in that test. Every numbered target is represented, including all sampled targets and headline theorems.

| Statement | Instances and computed values on the two sides | Result / change |
|---|---|---|
| 0.1 characters and restriction kernels | dim A=0: character count 1; B=A: restriction kernel {1}; B=0: whole group. On E², diagonal restriction is χ₁χ₂, antidiagonal is χ₁χ₂⁻¹; for (χ,χ), these are χ² and 1. | Retain exclusion B=0 and coupled-coordinate loci. |
| 0.2 normalized character sheaf | Unit monodromy is 1 geometrically and at the origin. Tensoring by an arithmetic character with value −1 leaves geometric monodromy 1 but changes the origin value from 1 to −1. | Retain origin normalization and Galois invariance. |
| 0.3 convolution, dual and symmetry | δ_x*δ_y has support x+y; its dual has support −x−y. δ_x*δ_(−x)=δ_0. Two degree-one factors have exchange sign (−1)^(1·1)=−1, not +1. | Retain proper addition and Koszul symmetry. |
| 0.4 generic vanishing | On E, F[1] has dimensions (1,2,1) in degrees (−1,0,1); a nontrivial rank-one twist gives (0,0,0). For a non-torsion character α, its exceptional twist is α⁻¹, also non-torsion. | Retain geometric-origin condition for torsion translates. |
| 0.5 negligibility | χ(δ_0)=1; χ(F_E[1])=−1+2−1=0. For δ_0⊕δ_0[1], total χ=1−1=0 but both nonzero perverse-cohomology Euler characteristics are 1. | Retain perverse-cohomology condition; total χ=0 is insufficient. |
| 0.6 quotient | Q(F_E[1])=0; Q(δ_0) has End dimension 1. The complex in the previous row still has two nonzero quotient perverse-cohomology objects. | Retain Serre/Verdier comparison gap; no naive total-Euler quotient. |
| 1.1 admissible category | For δ_x, H⁰ dimension 1 and all other dimensions 0 for every χ. F_E[1] at χ=1 has H⁻¹=H¹=1, hence fails; at χ≠1 all dimensions 0, hence passes. | Both directions of the condition tested; retain. |
| 1.2 fibre functor | ω(δ_x*δ_y) has dimension 1=1·1. An admissible negligible constant object has dimension 0=χ, while δ_0 has dimension 1. | Faithfulness requires the quotient; retain. |
| 1.3 convolution group | δ_0 and a zero quotient generator give the trivial group, with fibre dimensions 1 and 0 respectively. For an SL₂ example, K⊕K has diagonal dimension 3, versus product dimension 6. | Retain finite-generator image and no automatic product assertion. |
| 1.4 change of fibre | Changing a basis by diag(2,1) sends E₁₂ to 2E₁₂ by conjugation. For the tensor unit, every scalar basis change conjugates 1 to 1. | Retain isomorphism up to conjugation, not equality of embedded groups. |
| 1.5 Euler one | Rank-one point sheaf: χ=1 and fibre rank 1. Rank-two point sheaf: χ=2. F_E[1]: χ=0. Adding the last to δ_x keeps χ=1 but introduces a negligible constituent. | Retain semisimplicity and absence of negligible constituents in the classification. |
| 2.1 arithmetic/geometric categories | A rank-two unipotent arithmetic action [[1,1],[0,1]] is not the identity, but at the geometric origin its pullback is F⊕F, rank 2 and semisimple. | Retain geometric, not arithmetic, semisimplicity. |
| 2.2 exact sequence | A=Spec k: geometric group 1, arithmetic quotient Gal_k^alg. For algebraically closed k, quotient 1 and G_ar=G_geo. The preceding unipotent action has nonzero upper-right entry 1. | Retain proalgebraic quotient and kernel contract. |
| 2.3 normalization | Identity Galois action normalizes SL₂: 1·g·1⁻¹=g. Its image dimension is 0, versus dim SL₂=3. | Normalization is not containment; retain. |
| 2.4 extension comparison | A k-defined δ_x has End dimension 1 before and after algebraically closed extension. A new K-point y≠x has Hom(δ_x,δ_y)=0. | Retain restriction to the tensor category of the given object. |
| 3.1 Euler identities | n=2,d=1: coherent row (−1,1), topological Euler −2, N=2. n=3,d=1: (1,−4,1), N=6. n=4,d=1: (−1,11,−11,1), N=24. | Signs and factorial normalization agree. |
| 3.2 hypersurface representation | n=3,d=1: shift [2], H⁰(K_H)=H²(H,Lχ), dimension 6. Wrong shift [3] would read H³, which is 0 for a good χ. | Retain shift n−1 and positive dimension. |
| 3.3 Hodge–Tate row | n=3,d=1: weights (0,−1,−2), multiplicities (1,4,1), sum 6. With HT(cyclotomic)=+1 the labels (0,1,2) have the opposite sign. Trace idempotents divide by a positive integer in Q_p, even when p divides it. | Matches the supplier convention; no good-reduction restriction inserted. |
| 4.1 clean cycle ring | (2Λ_x)◦(3Λ_y)=6Λ_(x+y), degrees 2·3=6. Point conormal has degree 1; the zero section for positive-dimensional A has generic degree 0 and is removed. | Retain integral multiplicities and clean quotient. |
| 4.2 characteristic cycle/index | cc(δ_x)=Λ_x, degree=χ=1. On E the constant perverse sheaf has only degenerate conormal contribution, clean degree=χ=0. | Retain regular-holonomic bridge as a supplier gap. |
| 4.3 factorization/support maps | Two sums of two point conormals have degrees 2,2 and product degree 4. Each of four distinct components has multiplicity 1; one point cannot dominate two points. For δ_0 the derived Lie algebra is 0 and total degree 1<2·2. | R03; retain exclusion of zero derived Lie algebra. |
| 4.4 minuscule representation | In ∧² of the standard SL₄ representation there are choose(4,2)=6 weights in one S₄ orbit, each multiplicity 1. Trivial weight has orbit size 1 and dimension 1. | The geometric rank≥6 excludes the trivial model; R05 fixes the general table. |
| 4.5 simplicity modulo centre | A hypothetical nontrivial split gives factor degrees at least 2 and product at least 4. A point/unit has degree 1 and derived dimension 0, so is outside the splitting hypothesis. A smooth ample divisor in dimension 3 has Albanese dimension 3. | Retain n>2 and the Albanese input; R06 splits its contracts. |
| 4.6 representation alternatives | For n≥3, N=n!d is divisible by 6. E₆'s 27 has remainder 3 modulo 6; E₇'s 56 has remainder 2. Every power of 2 is nonzero modulo 3. Weight 0 nevertheless has dimension 1. | Exceptional/spin exclusions agree; R05. |
| 4.7 pairing and classical form | n=3: (−1)²=+1, orthogonal. n=4: (−1)³=−1, symplectic. ∧² SL₄ has dimension 6, central kernel μ₂ and image SO₆. | Retain line-valued pairing and faithful image. |
| 5.1 W and row predicate | Empty list,k=0 gives W(0)=1; m=2,k=3 gives all zeros. Four zero weights,k=2 give 6 at 0. (−1,0,1),k=2 gives (1,1,1). (0,0,1,1),k=2 gives (1,4,1), with both outer counts 0. | Subsets, junk indices and whole-row condition agree. For n=0 the predicate's RHS is 0 everywhere; it is explicitly used only for n≥2. |
| 5.2 Pell classification | P₀=(1,5): 1−20+25=6=1+5. P₁=(5,20): 25−400+400=25. P₂=(20,76): 400−6080+5776=96. Positive a≤b≤1000 gives precisely P₀,…,P₃. | Both directions tested; recurrence subtraction is exact on these values and protected by the invariant generally. |
| 5.3 exceptional degree | choose(25,5)=53130=6·8855; choose(23,4)=8855. D₀=6/6=1; D₂=36030431772522503316 with remainder 0 on division by 6. | Retain normalized degree and j≥1. |
| 5.4 Hodge exterior constraint | (0,0,1,1),k=2 gives 1+4+1=6=choose(4,2)=3!·1. Shifting each weight by b shifts all subset sums by 2b; negating native Hodge–Tate weights reverses the row. | Retain cocharacter comparison and whole-row equation. |
| 5.5 width/extremal occupancies | (0,0,1,1),k=2: min=0,max=2,width=2=n−1 for n=3. Five zeros and one 1,k=3: min=0,max=1,width=1=n−1 for n=2. Four zeros give width 0, so fail either positive-width row. | Retain positivity and interior exponent hypotheses. |
| 5.6 surface classification | Five zeros and one 1,k=3: counts (10,10), m=6=2k,d=choose(5,3)=10. Three zeros and one 1,k=2: counts (3,3), m=4,d=3. | Both balanced branches and singleton endpoint occur. |
| 5.7 threefold classification | (0,0,1,1),k=2: classical (4,2,1). Histogram 1[−1]+23[0]+1[1],k=5: (8855,35420,8855)=8855·(1,4,1), m=25=5+20. | Both classical and exceptional branches occur. |
| 5.8 fourfold obstruction | (0,0,1,2),k=2 gives (1,2,2,1), not (1,11,11,1). Total 6 also cannot equal 24d for integer d≥1. | Width alone is insufficient; no small-case counterexample. |
| 6.1 occupancy ratios | At the preceding m=25,k=5 example: r=4,t=19, R_a=19/5,R_b=1/5, sum 4, product 19/25<1. The five second ratios are (0,0,1,0,0), sum 1. At a surface endpoint, product 0 equals adjacent-height product 0. | Retain ≤ rather than unconditional strict inequality; denominators positive. |
| 6.2 comparisons | n=5: 8<25;1848<1875;58<66;390<15625;660<676;0<17576;58<66;30<44616;0<4225. Small radical bounds are <52.309 and <56.313, both <66; B.16 gives 56<66. n=10:1291680>1026169; n=11:4121199<4145296. n=2:1/2 versus 0. | 2,581 exact finite tests pass; R01 remains universal; R07 corrects the false Check. |
| 6.3 first ratio regime | Histogram 1[−1]+53[0],k=2: first ratio 26 but second 0≠66=A(5,2). Thresholds A(5,1)/2=13 and A(11,1)/2=1018. Sum 26 permits (0,26). | Full-row input and separate R_b branch are necessary; relies on R01. |
| 6.4 large exponents | n=5: roots for sum 26, product 4 are 13±√165, with smaller <1 and larger >25. Five-term bound 5+1+4·26/2=58<66. | No omitted fifth term; relies on R01. |
| 6.5 second ratio regime | n=5,gap r=4: A(5,10)=0 while 26·25/2=325>0. At r=2 the intermediate bound is d<3/676; the proof retains the final occupancy argument for general n. | Boundary r=n−1 treated separately; relies on R01. |
| 6.6 full classification | Surface example: n=2,k=3,d=10. Threefold examples: (m,k,d)=(4,2,1),(25,5,8855). Exhaustive normalized weights in {0,…,4}, lengths 4,…,10, gave 11,018 cases and 9 Eulerian realizations, all in the stated branches. | No counterexample in finite test; not a proof of the universal theorem or G1. |
| 6.7 classical monodromy | n=3,d=1: N=6 and self-dual sign +1 gives SO₆, agreeing with ∧²SL₄. n=4,d=1: N=24, sign −1 gives Sp₂₄. Exceptional d=8855 is excluded only at n=3. | Dimensions/parity consistent; proof depends on R01 and corrected earlier inputs. |
| 7.1 constant constituents | A constant rank-N family has invariant distinguished object rank N; its G* action is nontrivial when N>1. A translation family therefore cannot satisfy the asserted conclusion without the nontranslation hypothesis. | Retain family hypothesis; constant family is the negative control. |
| 7.2 independent axes | For SL₂ on two distinct axes: product dimension 3+3=6. Two copies on the same axis give diagonal dimension 3. For c=1 the dimension is 3. | Retain distinct axes and c≥1. |
| 7.3 no constant invariants | Constant δ_0 gives H⁰ dimension 1 and invariant dimension 1 for every χ. The required invariant dimension is 0, so its constant constituent must be excluded. | Retain arithmetic definition over C(X), geometric origin and constant-constituent hypothesis. |
| 7.4 Jordan | Cyclic group: index 1. Q₈: normal C₄ has index 8/4=2. S₃: normal C₃ has index 6/3=2. Dihedral order 2q: rotations have index 2. | Uniform bound is in dimension, not group order; no commutativity assumption on Γ. |
| 7.5 finite product detector | G*=SL₂,c=2: full product dimension 6 and cross-adjoint invariant dimension 0. Diagonal subgroup dimension 3 and invariant dimension 1 (identity intertwiner). Trivial subgroup fixes all 9 dimensions of the cross-adjoint tensor. | Both directions of detection tested; coordinate-only detector fails. |
| 7.6 simultaneous twists | Two identical twists yield diagonal derived dimension 3 for SL₂; required product dimension 6 on a rank-4 sum. c=1 gives one rank-2 representation and dimension 3. | Diagonal tuples must be exceptional; retain normalizer and semisimple-direct-image inputs. |
| 8.1 Frobenius avoidance | M=0: no bad tuple. M=2,c=2: total 9,bad≤6,good≥3 after valid collisions. Order-four test: residues 16≡20≡0 but restricted character difference 2≠0. | R04; nonidentity torsion targets must be excluded. |
| 8.2 all conjugates | On E, 2³-torsion character count 2⁶=64; three point cosets cover at most 3, leaving ≥61. Dimension-zero A has one character and no positive-dimensional restriction loci. | Retain finite conjugate closure and growing torsion order. |
| 8.3 orbit-uniform monodromy | ℓ=2,p=3 gives coprime character order 2ʳ; ℓ=p does not. For SL₂,c=2, required product dimension 6 differs from diagonal dimension 3. | Quantifier order permits different exponent tuples for different conjugates; depends on R04. |
| 9.1 cover periods | m=1 gives one deck summand. n=3,m=1,m′=2 gives cover degree 2⁶=64 and trace∘pullback=64 id. For d=2, deg φ_L=d²=4, whereas fixing only NS(A) admits every translation. | Retain fixed Picard class, rational projectors and stated line convention for P(H⁰). |
| 9.2 surfaces | d=1 gives genus 2; d=2 gives genus 3 and at most 4 Picard-fixed translates. Empty smooth-divisor locus has fibre cardinality 0. | Torelli and relative pointed Albanese supply a separate dimension-two route. |
| 9.3 period finiteness | r=64 gives e²=e=diag(1,0); swap conjugation gives diag(0,1), not e. Quasi-finite permits a fibre of size 4; it does not require size 1. | R02; marked relation and quotient-period compatibility cannot be replaced by total Hodge isomorphism. |

The finite enumeration used actual unordered subsets, all integer row positions with zero tails, and exact Eulerian counts. Square-root inequalities were tested using rational upper bounds from integer square roots at denominator 10³⁰, so floating-point rounding cannot explain the reported strict inequalities. These computations are diagnostic evidence, not a replacement for the general mathematical proof.

### Pinned libraries, ownership and resolved suppliers

The inspected pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The supplied content checkout was detached; cross-roadmap claims were therefore resolved with the roadmap service's main/open-head copies, rather than assuming the detached checkout was main. Searches were by objects (perverse categories, convolution, Eulerian numbers, finite linear groups, conormal cycles, Hodge loci, trace splittings and minuscule representations), not just by proposed names. The board index was read before drawing ownership conclusions.

| Pinned file and line | Declaration / actual scope opened |
|---|---|
| `Mathlib/Data/Finset/Powerset.lean:197`, `:201`, `:211` | `Finset.powersetCard`, membership and `Finset.card_powersetCard`; actual k-subsets and binomial cardinality. |
| `Mathlib/Data/Nat/Choose/Basic.lean:50` | `Nat.choose`; natural-number binomial conventions, including the out-of-range zero case. |
| `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:74`, `:87` | `HasDerivedCategory`, `DerivedCategory`; localization of complexes of an abelian category, not a constructible perverse sheaf category. |
| `Mathlib/CategoryTheory/Abelian/SerreClass/Localization.lean:408`, `:415`, `:427`, `:433` | The abelian localization and preservation of finite limits/colimits, with preadditive/additive localization assumptions. This does not supply the bounded-heart/Verdier comparison. |
| `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:42` | `Matrix.GeneralLinearGroup`, units of matrices; no algebraic-group representation theory is implicit in this type. |
| `Mathlib/GroupTheory/Index.lean:55` | `Subgroup.index`, natural cardinality of the quotient; infinite index uses the total-function value 0. Here Γ is finite, so that junk value is excluded. |
| `Mathlib/Algebra/Group/Subgroup/Defs.lean:606` | `Subgroup.Normal`, conjugation stability. Jordan's B is a subgroup of Γ, not of the whole GL_n for purposes of index. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | `AbelianVariety` bundles a group object, properness and geometric integrality; smoothness and commutativity are derived. It does not bundle perverse cohomology. |
| `TauCeti/AlgebraicGeometry/AffineGroupScheme/Basic.lean:45`, `:55` | Affine group schemes as a full subcategory; finite type and smoothness are not implicit. |
| `TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive/Basic.lean:66`, `:89` | Reductive group-scheme substrate with its actual finite-type hypotheses. |
| `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean:55`, `:63` | `TauCeti.Tannaka.tensorAutFunctor` for the representation category of an existing bialgebra; not reconstruction of the proposed perverse category. |
| `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean:57`, `:188` | `TauCeti.Tannaka.fgPointTensorIsoEquiv` under the field and commutative Hopf-algebra hypotheses. |
| `TauCeti/Algebra/Lie/UniversalEnveloping/Kostant/MinusculeWeightTable.lean:82`, `:88` | `TauCeti.MinusculeWeightTable.rep`, a rational representation built from a supplied finite minuscule weight table; it does not classify all nonzero minuscule weights. |

The native Eulerian search finds graph Eulerian trails, not a duplicate descent-number API. The general descent API is already owned by ClassicalArithmeticCompletion and is imported. The small permutation-count body in the acceptance predicate is justified by its use solely in the headline; it creates no competing general API. No native constructible adic perverse category or duplicate of the six retained deep theorems was found in the searched pins. No matching fully qualified declaration was found in the inspected roadmap material. Geometric Satake's convolution concerns a different space and does not own addition-convolution on abelian varieties.

| Supplier | Citation resolved and scope checked |
|---|---|
| EtaleCohomologyFoundations | F.0.2, F.0.A2, F.4.5–F.4.6, F.5–F.6: fundamental groups, arithmetic sequence, coefficient essential image, operations and Euler/Gauss–Bonnet inputs. Main copy; the geometric-comparison gap is additional. |
| EtaleDualityAndPerverseSheaves | 0.5; 2.1, 2.2, 2.6–2.10; 3.3–3.5; 5.10: duality, heart/subquotients, adic comparison and geometric decomposition. Open head; arbitrary semisimple proper direct image and the Serre/Verdier comparison remain declared additions. |
| MotivesAndAlgebraicCycles | 6.1–6.3 and 6.8: neutral categories, reconstruction, functor criteria and finite-presentation tensor-isomorphism torsors. Open head; the EHS kernel criterion remains a named gap. A torsor is not asserted to have a rational point over an arbitrary field. |
| AbelianSchemesAndArithmeticModuli | A1.3, A2.4, A3.1–A3.6, A4.1, A5, A6: invariant forms, Riemann–Roch, degree of φ_L, isogenies, Tate rank, lattices and Hom rigidity. Open head; the extra Albanese, family quotient and trace decompositions are gaps. |
| SchemeAndStackFoundations | Layer 5, especially 5.1–5.5 and 5.8: cycles, multiplicity pushforward, Chern classes, normal cone and GRR. Main copy; conormal/Gauss geometry is expressly additional. |
| SpringerResolutionAndCharacteristicCycles | `packages/SpringerResolutionAndCharacteristicCycles/design/README.md:781`, `:1028`, `:1212`: Y/generic-length, D/characteristic-cycle and H/regular-holonomic. The characteristic-cycle construction has pure-dimensional/holonomic hypotheses; the present use is regular holonomic. |
| ComplexComparisonPartII | C5.1–C5.3 and C5.6: ordinary/family/Hodge comparison and regular-singular connections. Open head; these are not silently equated with full holonomic Riemann–Hilbert and its index theorem. |
| PadicHodgeTheory | 3.3, 8.1–8.2: HT(cyclotomic)=+1 and proper smooth comparison. Open head; the image-cocharacter construction is an additional gap. |
| ReductiveGroups; LieHighestWeight; SpinRepresentations | ReductiveGroups Layers 6–10; LieHighestWeight Layers 4, 6, 8; SpinRepresentations Layers 4–5. Main copies: characteristic-zero complete reducibility, structure/classification, rational representations, highest weights/Weyl dimensions and spin models. Their coefficient and finite-dimensionality hypotheses were retained. |
| LieHighestWeightPartII | `packages/LieHighestWeightPartII/design/README.md:342`, `:371`, `:393`, N2. Classical recognition and spin/classification targets exist. The full table requested by the named gap is not a citation to an existing complete table; R05 corrects that contract's scope. |
| ClassicalArithmeticCompletion | 2.18, 2.39, 2.56–2.57, 2.71, 2.77–2.78, main copy. Descent indexing, zero conventions, symmetry, bounds, square separation and the n≥11 threshold are present. Bespoke §6.2 comparisons are not already this API. |
| DeligneWeightsAndPurity | 0.1–0.3, 0.11, 1.4, open head: Weil numbers with q>1, products/inverses/powers and abelian Frobenius eigenvalues. These support the prime-to-p determinant argument, not the p-primary cyclotomic assertion. |
| ShimuraData; HodgeStructures | ShimuraData 3.1–3.4, open head: variations, Hom variations, rational polarizations and lattices. HodgeStructures Layers 0–3, main: pure structures and period-domain points. Bounded-norm orbit algebraicity is correctly a separate contract. G3 is not among the supplied results. |
| MordellLawrenceVenkatesh | 0.22–0.24, open head: two-factor Goursat, ideals and finite products; the c=1 case is retained. |
| AlgebraicModuliForArithmeticGeometry | 1.1–1.2 and 2.1, open head: projective bundles, sections/cohomology and Hilbert families. Its projective-bundle convention is quotients; the package explicitly uses lines in H⁰, so the comparison uses the dual bundle. |
| StableReductionPartII | `packages/StableReductionPartII/design/README.md:19941`, `:21758`: MC.4/fine-level-scheme and MC.6/torelli-finite-fibres. The latter permits two full-level points and one in the hyperelliptic case. The integral polarized Jacobian comparison is a separate matching gap. |
| JacobianChallenge; JacobianChallengePartII | Main Layer F pointed universal property; open Part II §§2.1–2.4 section-free/local pointed Abel maps. The stronger relative pointed factorization is correctly requested separately. |

The three unresolved leads from the automatic citation scan were checked against the board designs above; they are not missing-owner findings. The 14 named gap slugs match between the plan and README. Apart from R05 and R06, their absent supplier implementations are treated as declared contracts, not findings. G1 and G3 are two additional legacy entries without named suppliers. There is no upward citation or internal dependency cycle identified. No ownership move is recommended except the explicit resolution of those two obligations.

The roadmap service's main/open-head object searches were used for the ownership audit. Among the separately indexed board package heads, the readable AnalyticNumberTheory, AutomorphicCongruences, KatoEulerSystems and LogicAndDefinabilityInNumberTheory READMEs did not duplicate these constructions: their convolution references concern analytic/automorphic constructions, and LogicAndDefinability's Hodge-locus references supply o-minimal geometry, not the bounded-norm flat-orbit theorem. The inaccessible heads are listed below; they were not treated as absent packages.

Mechanical dependency output, verbatim:

```text
depcheck: 52 roadmaps, 598 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The check used the supplied merge order with this roadmap's name and the movable option.

### Headline coverage, elaboration and padding

The README's headline results are generic vanishing and the rigid quotient/fibre functor (§§0.3–1.2); arithmetic–geometric exactness and normalization (§§2.2–2.3); hypersurface Euler/Hodge data (§§3.1–3.3); microlocal factorization, minuscule simplicity and classical form (§§4.3–4.7); Pell and exterior-row classification (§§5.2–5.8, 6.6); classical convolution monodromy (§6.7); constant-constituent rigidity, finite detection and simultaneous monodromy (§§7.1–7.6); Frobenius/all-conjugate monodromy (§§8.1–8.3); and surface/general period finiteness (§§9.2–9.3). Euler-one classification and geometric extension comparison are supporting results, also checked above.

The six statable deep numerical/group-theoretic headlines are present as `exceptionalPair_classification`, `surface_exterior_classification`, `threefold_exterior_classification`, `fourfold_exterior_impossible`, `exterior_eulerian_classification` and `jordan_finite_linear_groups`. The four real-bodied definitions are exactly their subset-count, Pell-pair, degree and row-predicate dependencies. The module docstring names the missing geometric headline groups and the absent sheaf, character, conormal, variation or period carriers. The arithmetic representation substrates at the pin are not a substitute for those geometric objects; no free predicate or bare-scalar replacement was introduced.

From the content environment, `lake env lean` on the supplied absolute `Suggested.lean` path exited successfully, with exactly six warnings, all for `sorry`. No Tau Ceti import needed building. A scratch copy containing `#check @name` for all ten declarations was elaborated and every type compared with the README: no section binder was lost and no signature changed. In particular n≥2,d≥1, the interior exponent bounds, normalized 2k≤m where used, and finite Γ over an arbitrary characteristic-zero field are present. Jordan's J is chosen before the coefficient field and finite subgroup; the index is internal to Γ.

A separate scratch copy tried each admitted theorem using `simp`, `rfl` and `infer_instance` individually through a one-tactic fallback probe. None of the six closed. The relevant pinned subset/binomial, matrix and subgroup declarations were also read; none supplies the claimed Pell classification, exterior-row obstruction or uniform Jordan bound by one `exact`. No padding deletion is recommended. All Lean processes finished, and the original acceptance file was left untouched.

## Not verifiable

All nine cited mathematical texts and all 15 seeded locators were readable; there is no missing-reference request.

Ownership against the following separately indexed board-package README heads could not be completed: GitHub's contents endpoint returned HTTP 404 at the supplied head/path. This is an access/path limitation, not evidence that the roadmap or object is absent. The main/open-roadmap service searches and the locally available designs were still checked.

| Board package | Supplied head |
|---|---|
| ArithmeticLocallySymmetricSpacesPartII | c1b8f80 |
| CompletedCohomologyAndLocalGlobalCompatibilityPartII | 777a863 |
| CrystallineCohomologyPartII | 84ea77e |
| EndoscopicTransferAndUnitaryTraceComparisonPartII | 80a66cc |
| HigherHidaAndColemanTheory | 519048f |
| LawrenceVenkateshMethod | 9ee7ac3 |
| OrdinaryAutomorphicFormsAndModularityLiftingPartII | 7e88c38 |
| PELModuliPartII | d4bb48d |
| PadicHodgeTheoryPartII | 6502997 |
| PadicLocalLanglandsForGL2QpPartII | 3e0777d |
| RealSurfacePeriodIndex | 875bca4 |
| SchemeAndStackFoundationsPartII | accb0a0 |
| ShimuraVarietiesPartII | 57dc0a4 |
| VStackSheavesAndLisseCategoriesPartII | 0987ba7 |
| VectorBundlesAndIsocrystalsPartII | b58d862 |

The finite numerical tests do not certify G1's infinite ranges, and no completed proof of G3's marked-period compatibility was supplied. Those are the owned-proof-obligation questions in R01/R02, rather than unread source texts.

## Source issues

- **Error** in K2 at Proposition 6.1.1, printed pp.29–30 (K2 line 1402): the source says nonsimplicity modulo the centre forces two cycle factors of degree greater than one; it should be restricted to a nonzero derived Lie algebra with at least two simple factors; affects a stated result.
- **Misprint** in LS at Lemma 3.14 proof, printed p.26 (LS line 1180): the source says unshifted hypersurface cohomology is concentrated in degree zero; it should be degree n−1, or degree zero after the perverse shift; affects the proof.
- **Misprint** in LS at Lemma 3.14 proof, printed p.26 (LS line 1182): the source says the normalization input is Lemma 2.9(2); it should be Lemma 2.9, which has no numbered second part; affects nothing.
- **Error** in LS at §4 before Lemma 4.4, printed p.30 (LS line 1392): the source says generic-vanishing exceptional translates are torsion for arbitrary perverse sheaves; it should be restricted to geometric-origin sheaves, allowing arbitrary translates otherwise; affects a stated result.
- **Misprint** in LS at Lemma B.4 proof, printed p.94 (LS lines 4467–4499): the source says the binomial top and subsequent size identity use the selected occupancy m_S; it should be the ambient multiplicity m_H; affects the proof.
- **Misprint** in LS at Lemma B.8 proof, printed p.96 (LS line 4658): the source says the excluded initial parameters are k=a(1), m=a(2); it should be k=a(1), m=a(1)+a(2), namely (1,6); affects nothing.
- **Gap** in LS at Lemma B.10 proof, printed p.100 (LS lines 5060–5074): the source says the explicit adjacent-ratio formulas give a strict product bound without addressing zero adjacent multiplicities; it should be non-strict in general, with strictness justified separately when both adjacent multiplicities are positive; affects the proof.
- **Gap** in LS at Lemma 4.8 proof, printed pp.34–35 (LS lines 1592–1598): the source says cyclotomic multiplication by p is invertible on the whole finite-order character space; it should be applied on prime-to-p torsion, with any p-primary assertion justified separately; affects the proof.
- **Misprint** in LS at Lemma 4.8 proof, printed p.35 (LS lines 1601–1602): the source says the upper bound counts tuples outside one exceptional coset; it should be the number inside that coset; affects the proof.
- **Error** in LS at Lemma 4.8 proof, printed p.35 (LS lines 1606–1615): the source says an axis inverse image is a single restriction subtorus; it should be a finite union of torsion translates, retaining every resulting torsion value in the collision argument; affects the proof.
- **Misprint** in LS at Lemma 4.9 proof, printed p.36 (LS line 1647): the source says the count ℓ^(2kn) refers to ℓ^(2k)-torsion characters; it should be ℓ^k-torsion characters; affects nothing.
- **Gap** in LS at Proposition 4.11 proof, printed p.37 (LS lines 1713–1717): the source says identity-orbit Hodge loci are nested and contain the period-fibre square without establishing compatibility; it should be justified through the marked period relation and preservation of trace summands before stabilization; affects the proof.
- **Misprint** in LS at Proposition 4.11 proof, printed p.37 (LS line 1723): the source says the compared second hypersurface cohomology uses the m-cover; it should be the same m′-cover as for the first hypersurface; affects the proof.
- **Gap** in LS at Proposition 4.11 proof, printed p.38 (LS lines 1744–1747): the source says Lemma 3.9 gives simplicity throughout the stated n≥2 range; it should be supplemented by a separate n=2 argument because that simplicity input requires n>2; affects the proof.
- **Misprint** in EHS at Appendix A, equation (A.5), printed p.20 (EHS line 817): the source says the base-changed induced representation is k[A] tensor an unspecified V; it should be k[G] tensor W over k, as the preceding torsor identity implies; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "00f55f811c3268d67ef9045710eb29ef88dcf5be", "job": "REV-PKG-SheafConvolutionOnAbelianVarieties", "model": "gpt-6-astra", "worker": "chris-8"} -->
