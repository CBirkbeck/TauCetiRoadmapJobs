<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2224#issuecomment-6488394189 -->
Review (codex) of a27f6fc

Verdict: needs_changes

1. **F01** (P1) Target dependencies contain cycles

   **Location:** packages/PotentialAutomorphyInfrastructurePartII/README.md:787, 823, 859, 896, 951, 975, 2142, 2156. Quote: “*Needs:* 3.4; 3.9; 3.10.”

   **Claim:** The layers and their targets form a build order.

   **Witness:** The printed edges include 3.3→3.5→3.7→3.3, 3.9→3.11→3.9, 3.9→3.12→3.9, and 9.5→9.6→9.5. Each arrow means “needs”; every displayed path returns to its starting vertex.

   **Repair:** Split construction from consequences. Put the underlying unitary base-change theorem before constituent Galois representations; put Hecke extraction and ordinary descent after them. Define the ordinary tower, coefficient data and Hecke action before proving finiteness/classicality; those later properties must not be dependencies of the definitions. Construct the unpolarized trace map before proving its equivariance, then deduce the polarized tangent comparison. Give each resulting theorem its own Needs line. Also move the forward uses of §5.2 in §4.4 and §§7.17–7.19 in §7.12 into an actual topological order. Re-test the four displayed cycles: all must disappear. The roadmap-level depcheck below does not inspect these internal edges.

2. **F02** (P1) The residual Hecke ideal uses the inverse normalization

   **Location:** packages/PotentialAutomorphyInfrastructurePartII/README.md:914. Quote: “T_w^j − q_w^{j(j−1)/2} tr ∧^j r̄(Frob_w)”.

   **Claim:** These generators select the maximal ideal of the specified residual representation.

   **Witness:** In rank two over F₇, take q=2 and determinant 1. §3.3 gives 2T²=1, hence T²=4. §3.10 instead sets T²=2, giving determinant 4. NT21 line 3893 contains the same sign error.

   **Repair:** Replace the coefficient multiplying the exterior trace by q_w^{−j(j−1)/2}; keep the positive exponent in the characteristic polynomial. Add the rank-two F₇ calculation to the Checks. With the repaired generator T²−4, the polynomial has determinant 2·4=1 in F₇, as required. Audit the comparison map P_D→T_D using this correction.

3. **F03** (P1) Teichmüller determinant splitting is incompatible with the fixed multiplier

   **Location:** packages/PotentialAutomorphyInfrastructurePartII/README.md:1592. Quote: “ψ₀ the Teichmüller lift of det r̄”.

   **Claim:** The mixed-characteristic deformation ring splits as its fixed-ψ₀ quotient times the anticyclotomic character ring, for an arbitrary fixed multiplier.

   **Witness:** Take n=1, l=5, F=Q(i), ρ=ε₅⁻¹, µ=δ_{F/Q}ε₅⁻². At g∈G_F with ε₅(g)=6, ψ₀(g)ψ₀ᶜ(g)=1 but µ(g)=1/36. The fixed-ψ₀ ring is killed by 5; the original ring has a Z₅-point.

   **Repair:** Choose a determinant lift d₀ satisfying d₀d₀ᶜ=µⁿ|G_F and the stipulated ramification conditions, instead of an arbitrary Teichmüller lift. State its construction and the resulting dependence of the splitting on d₀. For odd l one can correct the Teichmüller determinant by the unique square root of the residually trivial character (µ/Teich(µ̄))ⁿ, with ramification checked. Then det(r)/d₀ is anticyclotomic and its unique n-th root gives the inverse. Alternatively state the characteristic-l form separately for its uses in dimension arguments, without claiming the false mixed-characteristic form. On the witness d₀=ε₅⁻¹ gives norm 1/36 and the original lift survives. The printed source has the same defect: Tho15 lines 1324–1333, with arbitrary multiplier allowed at lines 610–620.

4. **F04** (P2) The projective-image supplier contract drops essential hypotheses

   **Location:** packages/PotentialAutomorphyInfrastructurePartII/README.md:147; matching gap in packages/PotentialAutomorphyInfrastructurePartII/design/plan.json. Quote: “stays absolutely irreducible on every open subgroup”.

   **Claim:** That condition alone implies openness in a form of PGL_n; unspecified uniform adjoint/cohomology bounds are included in the same contract.

   **Witness:** Γ=Sp₄(F₅[[T]]) in its standard representation remains absolutely irreducible on every open subgroup. Its projective Zariski closure is PSp₄, dimension 10, whereas PGL₄ has dimension 15. Tho15 lines 2532–2536 impose additional hypotheses.

   **Repair:** Make the declared contract match Tho15 §5.1: finite k, l>3, n prime to l, the polarized odd setting, and an element with eigenvalues in A× having no multiplicative relation. State the saturation bound with quantifiers K₀ independent of a,m, and the cohomology bound with its extra normal-subgroup, abelian-quotient, c-stability and trivial-multiplier hypotheses (Tho15 lines 2548–2563). Update the same gap entry and README sentence together. The Sp₄ witness is excluded because its torus eigenvalues satisfy reciprocal relations. This finding concerns an imprecise/overstated contract, not the supplier's present failure to implement a declared gap.

5. **F05** (P1) The Dwork Frobenius polynomial omits the Tate twist

   **Location:** packages/PotentialAutomorphyInfrastructurePartII/README.md:1336. Quote: “with α = ±1”.

   **Claim:** The untwisted V_λ, defined in degree N−2 cohomology, has the displayed weight-(n−1) Frobenius polynomial.

   **Witness:** Set n=2, N=5, q_F=11, and t=1/11 at a split prime above 11. The pairing in (1) gives det(V)=ε⁻³, hence geometric-Frobenius determinant 1331. The polynomial in (5)(b) gives 11.

   **Repair:** State this polynomial for V_λ((N−1−n)/2), consistently with (1), (3) and (6); or retain V_λ and replace α by ±q_F^{(N−1−n)/2}. Specify geometric Frobenius. Carry the same normalization into the API and §6.2's use of the family. For the witness, the untwisted roots ±11, ±121 have product 1331; the twisted roots ±1, ±11 have product 11. Also require n to be positive: the present “n even” permits n=0, incompatible with the assertion of one Jordan block. BLGHT11 lines 1018–1021 and 1269–1273 expose the source's normalization discrepancy.

6. **F06** (P1) The geometric lemma is applied to each subquotient as an equality

   **Location:** packages/PotentialAutomorphyInfrastructurePartII/README.md:337. Quote: “The semisimplified Jacquet module of a subquotient … is the sum of the Weyl translates”.

   **Claim:** Every irreducible subquotient retains all Weyl terms of a principal series.

   **Witness:** For GL₂(Q₃), the principal series induced from |·|^{1/2}, |·|^{−1/2} has trivial and Steinberg constituents. Its Jacquet module has dimension 2; each constituent's Jacquet module has dimension 1. The claimed equality gives 1=2.

   **Repair:** Apply the geometric lemma to the full induced representation. Exactness gives only subquotients of that Jacquet module for its constituents. Use the segment classification separately to identify which constituent contains the ordinary character. In the witness the two one-dimensional Jacquet modules partition the two Weyl terms, rather than each containing both. Retain the existing negative control involving the trivial representation.

7. **F07** (P1) Change of weight explicitly bypasses required general theory

   **Location:** packages/PotentialAutomorphyInfrastructurePartII/README.md:2323–2328 and :71. Quote: “No roadmap plans that theorem, so this form is not stated here.”

   **Claim:** §10.6 replaces the generic Serre-weight theorem with modularity of the desired obvious weights as an additional hypothesis.

   **Witness:** LLHLM23 lines 6251–6253, Remark 9.2.2(1), relaxes to residual automorphy using Theorem 9.1.6. The package instead assumes the missing modular-weight conclusion and expressly excludes that theorem from ownership.

   **Repair:** Restore the full change-of-weight statement at the source's generality. Assign the generic Serre-weight input to an exact earlier owner, with a precise declared gap if needed, or add its general mathematical construction and theorem here if this roadmap is the earliest owner. The input is the polynomial-uniform equality W(r̄)=W^?(r̄_p|I) of LLHLM23 lines 6133–6141, with automorphy, cyclotomic adequacy, p∤2n and tame polynomial-generic local data retained. Do not replace it with an assumed membership of the required weight in W_mod. Re-test the input “residually automorphic, with no supplied weight-compatible seed”: the revised route must construct that seed. Object searches found GL₃-specific LLHLM20 work in LocalGaloisDeformationRings §6.30, which is not the general LLHLM23 theorem.

8. **F08** (P1) Generic Weil–Deligne theory has two owners

   **Location:** packages/PotentialAutomorphyInfrastructurePartII/README.md:2061–2065. Quote: “this is the characteristic-zero notion with monodromy”.

   **Claim:** §9.1 owns the characteristic-zero genericity definition and its local Langlands criterion; the cited supplier is described only as supplying a different residual notion.

   **Witness:** TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md:3166, AG2.6 “Generic monodromy orbits and local genericity”, states the same Hom_WD vanishing criterion and the generic LLC equivalence, with monodromy. Its residual export is separate.

   **Repair:** Import that AG2.6 target in the exact supplier contract and §9.1. Delete the duplicate definition and LLC theorem; retain only genuinely additional transport statements, explicitly distinguished from the import. The rank-two parameter (1⊕|·|,0) has a one-dimensional Hom space in both descriptions; its nonzero Steinberg monodromy makes that space zero in both. There must be one predicate and one owner for those values.

9. **F09** (P2) General Galois existence is cited to a restricted supplier layer

   **Location:** packages/PotentialAutomorphyInfrastructurePartII/README.md:214, :823 and :918. Quote: “AG2.2: existence of Galois representations.”

   **Claim:** AG2.2 supplies existence for every regular algebraic conjugate-self-dual constituent used here.

   **Witness:** TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md:1254–1273 retains Shin regularity and field restrictions; :1354–1368, AG2.3, supplies unrestricted regular conjugate-self-dual existence. Rank two with weight (0,0) fails AG2.2's strict weight inequality 0>0.

   **Repair:** Cite AG2.3 for unrestricted existence, AG2.2 for twisting/discrete assembly, and AG2.5–AG2.6 for compatibility. Make the same change at every general-existence use, including §3.5 and §3.10. The rank-two weight-zero example is then covered without adding Shin regularity or narrowing the theorem. No new supplier gap is needed.

10. **F10** (P1) The rigidity proof tests the wrong eigenvalue ratios

   **Location:** packages/PotentialAutomorphyInfrastructurePartII/README.md:2271. Quote: “once no (α/β)^{N−1−2i} reduces to q”.

   **Claim:** Those exponents detect all possible ramified lifts of Sym^{N−1} of an unramified elliptic-curve representation.

   **Witness:** For y²=x³+3x+2 over F₅, #E(F₅)=5. Modulo 7, Frobenius roots are 2,6. At N=3 the printed ratio set is {1,2,4}, missing q=5; actual pairwise ratios include 5.

   **Repair:** Test all ratios of the symmetric-power eigenvalues, namely (α/β)^j for −(N−1)≤j≤N−1. Retain the finiteness argument using their complex absolute values. Add the witness as a negative control. More explicitly, the arithmetic symmetric-square residual eigenvalues are (2,3,1). The lift Φ=diag(2,10,1), τ=I+7E₂₁ satisfies ΦτΦ⁻¹=τ⁵, reduces to unramified data, and is ramified. Also 7 does not divide (5−1)(5²−1)(5³−1)=11904. The revised ratio test excludes 7 since 5 occurs. This repairs the local proof step; it does not refute the almost-all-primes conclusion. LTXZZ lines 1754–1757 contains the same incomplete ratio test.

11. **F11** (P3) An impossible congruence is used as a Check

   **Location:** packages/PotentialAutomorphyInfrastructurePartII/README.md:981. Quote: “congruent only modulo λ² and not λ”.

   **Claim:** This case gives different spaces over the residue field.

   **Witness:** λ²⊆λ, so the proposed case is empty. In O=Z₅[ζ₅], characters with generator values 1 and ζ₅ differ by the uniformizer: congruent modulo λ, not λ², but identical over k.

   **Repair:** Replace the Check by that latter example and conclude that the k-coefficient spaces agree although the O/λ² coefficient characters differ. It then discriminates reduction modulo λ from reduction modulo λ².

12. **F12** (P3) Scalar conjugation changes the wrong component in a Check

   **Location:** packages/PotentialAutomorphyInfrastructurePartII/README.md:843. Quote: “changes … the GL_1 factor of the j-component”.

   **Claim:** Scalar GL_n conjugation twists the multiplier by a².

   **Witness:** The stated semidirect-product law gives (aI,1)(A,b)j(a⁻¹I,1)=(a²A,b)j. For a=2, A=I, b=1, the result is (4I,1)j, not (I,4)j. The multiplier is unchanged.

   **Repair:** Replace the Check by this computation: scalar conjugation rescales the polarization matrix in GL_n and preserves ν. Explain strict equivalence using the conjugator's reduction, not a change in multiplier. With a≡1 modulo the maximal ideal this is strict conjugation; arbitrary a need not give that chosen residual representative.

13. **F13** (P3) Supersingular Tate-module slopes have the opposite sign

   **Location:** packages/PotentialAutomorphyInfrastructurePartII/README.md:325. Quote: “both slopes of D_cris(V_l E) equal 1/2”.

   **Claim:** These are the slopes of the covariant Tate module with HT(ε)=−1.

   **Witness:** det(V_l E)=ε_l and φ on D_cris(ε_l) is l⁻¹. The slope sum is −1, whereas the printed pair sums to +1. The dual H¹ representation has the positive slopes.

   **Repair:** Replace the two slopes by −1/2, keeping the non-ordinarity argument. The corrected sum is −1 and both slopes are still nonintegral, excluding a crystalline rank-one subrepresentation over Q_l.

14. **F14** (P3) Correct three locator offsets

   **Location:** packages/PotentialAutomorphyInfrastructurePartII/README.md:1837, :1851 and :126. Quote: “Theorem 5.7, pp. 71–72”.

   **Claim:** The displayed pages/line locate the complete statements being consumed.

   **Witness:** NT21 line 3494 starts Proposition 5.6 on p.71; its proof continues on p.72. Lines 3578–3591 place Theorem 5.7 on pp.72–73. The pinned Tau Ceti splitting theorem begins at line 74, not 70.

   **Repair:** Use Proposition 5.6, pp.71–72 (setup p.70), Theorem 5.7, pp.72–73, and TauCeti/NumberTheory/NumberField/SplitsCompletely/Basic.lean:74. Opening those positions reaches the respective statement, including the strict dimension inequality and the finite torsion-free Dedekind-base hypotheses.

15. **F15** (P3) Complete the dependency and acceptance-test guideposts

   **Location:** packages/PotentialAutomorphyInfrastructurePartII/README.md:2281; packages/PotentialAutomorphyInfrastructurePartII/Suggested.lean:5.

   **Claim:** Every target identifies its dependencies, and the acceptance-test docstring identifies the roadmap and its unstated deep results.

   **Witness:** §10.4 is the only one of 110 numbered targets without a Needs line. The docstring never identifies README.md as the roadmap, and does not name prescribed ordinary lifts (§6.3) or almost-all-primes rigidity (§10.3).

   **Repair:** Add the weight dictionary's actual supplier dependencies to §10.4. State in the module docstring that README.md is the roadmap and this file only records acceptance signatures; name §§6.3 and 10.3, and the restored full §10.6, with their missing carriers. Do not add replacement theorems. Recount: 110 targets should have explicit dependencies; the extra headline entries should explain their local deformation/component, compatible-system/rigidity, and Serre-weight/automorphic carriers respectively.

Fifteen findings: ten blocking (P1/P2), five P3. The package is repairable; it is a substantial polarized extension, rather than a replacement for its unpolarized parent. The clean Lean build does not certify the mathematics: Suggested.lean has no declarations.

## Verified sound

The audit read the 2,389-line README's 110 numbered targets, the 52-line Lean file, metadata and all 21 manifest entries. There is no previous review to reconcile. Each numbered target has a Checks block with at least three bullets; this is a structural count, not a claim that all those bullets are valid (R11–R13). The 11 layers have Examples and Dependencies sections. The file contains no computational implementation requirement, sorry'd data, set_option, or extra import. The source sample has 15 targets; none is inaccessible, and there are no author-flagged unverified locators. The verdict is based on the explicit failures above, not on accepting untested generalizations.

The opening shape was compared with TauCetiRoadmap/ComplexTori/README.md and TauCetiRoadmap/StableReduction/README.md on main. The parent boundary is genuinely unpolarized versus polarized; the ownership problems concern particular imported objects and downstream duplication, rather than the existence of a Part II.

### Seeded source audit

These are source-text comparisons, separate from the mathematical tests below. Page numbers are those of the registered version, not the PDF viewer offset. All statements are paraphrased here.

| Target | Text opened | Hypothesis/conclusion comparison |
|---|---|---|
| 0.10 | BLGGT14 lines 1631–1705, Lemmas 2.2.3–2.2.4, pp.36–37 | The induction-descent statement retains the CM setup, algebraic character, regularity and irreducibility inputs. The unitary-dual input is an expressly named supplier gap, not an unexplained automorphy assertion. |
| 0.11 | BLGGT14 lines 4110–4190, Lemmas A.2.4–A.2.5, pp.88–90 | The prescribed conjugate norm, unramifiedness at the chosen finite set, de Rham/local conditions, residual lift and odd-prime square-root requirement agree. |
| 1.4 | BLGGT14 lines 1226–1255 and 1584–1595, §1.4 and §2.1, pp.26–28,35 | The crystalline component condition is not replaced by equality of Hodge lists. Potential diagonalizability allows finite field and coefficient extension. Ordinary noncrystalline representations are not automatically diagonalizable. |
| 2.2 | Tho15 lines 1052–1120, Definitions 3.25/3.27 and Proposition 3.29, pp.23–24; ANT20 lines 357–456, Proposition 3.2 and Lemma 3.3, pp.8–10 | Noetherianity, finiteness over the determinant subring, and the odd-characteristic block-sign invariant description are the intended statements. The absolute-irreducibility locus is retained for étaleness. |
| 3.3 | Tho12 lines 1403–1464, 1562–1571, §6/Proposition 6.6, pp.32–33,36; Ger19 lines 1090–1113, Proposition 2.7.3, pp.24–25 | The positive Hecke-polynomial exponent is correct here. The package correctly retains hyperspecial level for inert-place unramifiedness; R02 concerns its incompatible inverse use in §3.10. |
| 3.5 | Tho12 lines 1535–1558, Theorem 6.5, p.35; Ger19 lines 1065–1089, Proposition 2.7.2, p.24 | Geraghty's dual/Tate twist and exclusion of R support the corrected package statement. Hodge lists, crystalline unramified case and inverse inertial characters match. General existence needs the corrected supplier citation R09. |
| 3.11 | Tho12 lines 1982–2007, Proposition 8.2, p.46; Ger19 lines 716–760, Proposition 2.5.3/Corollary 2.5.4, pp.16–17; Tho15 lines 1804–1829, Proposition 4.3, pp.36–37; NT21 lines 3888–3894, Proposition 6.5, p.79 | The distinction between torsion-free stabilizers and freeness only over a smaller Iwasawa algebra is retained. Finiteness/faithfulness excludes the zero module where necessary. R01 is a build-order defect, not a counterexample to these freeness theorems. |
| 6.3 | BLGGT14 lines 2008–2060, Proposition 3.2.1, pp.45–48 | Split finite S, odd l, cyclotomic irreducibility, the explicit residual-image bound, compatible paired Hodge sets and actual prescribed local lifts are retained. |
| 7.1 | NT21 lines 3268–3281, §5/Lemma 5.1, p.66; Tho15 lines 3181–3206, Theorem 7.1, p.66 | The sources use actual induction, the package's weak notion. Strong primitivity is expressly an additional definition. The characteristic-two example genuinely separates them. |
| 7.4 | Internal proof in README:1482, using the induction and Clifford suppliers | This is an author's deduction, not a numbered theorem in Tho15. The proof uses finite image, normal-kernel p-group orbits and p∤n; it does not silently equate weak and strong primitivity in all prime-to-p ranks. |
| 7.10 | Tho15 lines 2823–2851, Proposition 5.3, pp.57–58 | All six source assumptions are accounted for; the stronger primitivity repair is explicit. The rational-eigenline argument avoids changing the residual coefficient field in the last step. |
| 7.14 | Same Tho15 passage, together with the package's §7.13; Sk13 lines 183–215, Remark 3.2, p.519 | The weak version is not justified merely by citing the printed proof. The package adds a selfdual lattice argument: midpoint weights become integral under T=u² without extending k. This is a genuine extra proof obligation, not a source theorem being independently certified here. |
| 8.7 | NT21 lines 3460–3544, Proposition 5.6, pp.71–72 | The five hypotheses and dimension n[F⁺:Q]+n−d_R match. Rank-one blocks are explicitly assigned a gap. The mixed-characteristic splitting used in its route needs R03; the characteristic-p determinant argument can be retained. Locator correction R14. |
| 8.8 | NT21 lines 3548–3603, Theorem 5.7, pp.72–73 | Both strict inequalities and the decomposition-dependent choice of R_i match. The domain correction from G_F to G_{F⁺} is justified. Locator correction R14. |
| 10.3 | LTXZZ lines 1726–1908, Corollary 4.1.2, Proposition 4.2.3 and Theorem 4.2.6, pp.36–40 | The almost-all-primes results and full Weil-group supercuspidal argument match. The good-reduction ratio test copied into the proof is wrong: R10 gives a computed counterexample. |

### Adversarial calculations

Each row records actual values or a concrete obstruction. Numerical dimension substitutions test the formulas, not existence of a global automorphic example with arbitrarily assigned numerical data. “Survives” means that this test did not refute the stated result; it is not a proof of that result. The table covers all sampled targets, the headline families, and every finding's mathematical target.

| Statement | Instance | Computed sides / control | Result and change |
|---|---|---|---|
| 0.1 ordinary convention | ε_l; rank-two Tate module | λ=(−1); HT={−1}. For λ=(−1,−1), {λ₁+1,λ₂}={0,−1}. Dual weight is (0,0), HT={1,0}. | Convention survives; supersingular slope Check separately fails R13. |
| 0.1 supersingular Check | Covariant Tate module | det slope=−1; printed 1/2+1/2=+1; repaired −1/2−1/2=−1. | R13. |
| 0.2 Jacquet route | Reducible GL₂(Q₃) principal series | Full Jacquet dimension=2; trivial constituent=1; Steinberg constituent=1. | R06; replace equality for subquotients. |
| 0.10 induced descent | M=F, rank one, θ=1 | [M:F]·rank(r)=1; Ind(r⊗1)=r; both automorphy assertions coincide. Degree two would give induced rank 2, not 1. | Boundary and rank bookkeeping survive; no claim of deriving general descent from this control. |
| 0.11 conjugate norm | χ=1, local ψ_v=1, residual θ̄=1 | θ=1 has θθᶜ=1 and HT pair 0+0=0. A pair of local weights (0,1) has norm weight 1 and fails χ's weight 0. | Both positive and excluded prescriptions agree. |
| 1.4 diagonalizability | Crystalline 1⊕1; Tate-curve representation | First is its own character sum, HT={0,0}, N=0. Tate curve has rank(N)=1 and is not potentially crystalline. | Definition excludes the plausible “ordinary implies diagonalizable” wrong model. |
| 2.1 / 2.2 block signs | d=1; d=2 over k of odd characteristic | H/H_scalar has orders 1 and 2. In k[ε]/ε² with sign ε↦−ε, invariants=k; in characteristic 2 invariants=k[ε]/ε². | Oddness is essential; effective sign action, not a freely acting full µ₂^d, is used. |
| 2.2 irreducible case | d=1, absolutely irreducible residual image | Effective block-sign group=1; invariant ring R^1=R, consistent with P=R. | Survives. |
| 3.3 polynomial | n=2, q=2, residual det=1 in F₇ | det=qT²; T²=4 gives 1. | §3.3 survives; contrast R02. |
| 3.5 local normalization | n=1, unramified local character with value a=2 | Dual contributes a⁻¹=1/2; twist exponent 1−n=0. Omitting the dual gives 2, not 1/2. | Ger19 correction is necessary. |
| 3.5 supplier existence | n=2, weight (0,0) | Regular Hodge list={1,0}, but Shin inequality 0>0 is false. | R09: use AG2.3. |
| 3.6 scalar Check | a=2, (A,b)=(I,1) | Conjugated j-component=(4I,1); ν=−1 both before and after. | R12. |
| 3.10 residual ideal | Same F₇ data as §3.3 | Printed generator gives T²=2 and qT²=4≠1. Corrected generator gives T²=4 and qT²=1. | R02. |
| 3.11 freeness formula | Free ordinary module of Λ-rank 2; zero module | Mod m_Λ dimension=2; Λ-rank=2. Rank-zero module has Hecke image 0 and annihilator Λ. | Rank formula survives; zero cannot be called faithful over nonzero Λ. |
| 3.12 character Check | O=Z₅[ζ₅], ϖ=ζ₅−1 | v_ϖ(ζ₅−1)=1: differences are 0 mod ϖ, nonzero mod ϖ². Conversely ϖ²-divisibility implies ϖ-divisibility. | R11. |
| 4.3–5.1 minimal adequate lifting | n=1, trivial residual image, odd l | ad⁰=0, H¹(1,k)=0, H¹(1,ad⁰)=0; trace of scalar projector on 1 is 1. | Rank-one adequacy control survives; no arbitrary residual automorphy is inferred. |
| 4.4, 5.2–5.3 dyadic lifting | p=2 and n even | −1=+1 in k; a sign equality alone has identical values on both parity choices. | Strong residual oddness is retained as additional data; simple sign replacement would fail. Internal forward dependence needs R01. |
| 5.5 ordinary lifting | n=2, λ=(0,0) | Ordinary Hodge list={1,0}; paired list with multiplier ε⁻¹ is {0,1}. | Weight and full-multiplier normalization survive. |
| 5.6–5.9 finite rings/lifts | Rank-one dimension count; R=O/(ϖ) | Archimedean and regular-weight corrections are 0, lower bound 1−h⁰. For h⁰=0 it is 1; O/(ϖ) has dimension 0 and no characteristic-zero point. | Finiteness alone is not used to supply a lift; dimension and obstruction hypothesis matter. |
| 6.1 Dwork pairing/polynomial | n=2,N=5,q=11 | det V(Frob_geom)=11³=1331; printed polynomial determinant=11; twist by 1 divides determinant by 11². | R05; repaired twisted determinant=11. |
| 6.1 rank boundary | n=0,N=3 | Rank-zero monodromy has 0 Jordan blocks, whereas assertion (4) requests 1. | Exclude n=0 in R05. |
| 6.2 simultaneous potential ordinary automorphy | Empty index set; n_i=2 | Empty family requires 0 automorphic objects but retains disjointness of fields. At n_i=2, multiplier exponent 1−n_i=−1 and HT={0,1}. | Quantifiers and normalization survive; geometric input requires R05. |
| 6.3 prescribed lifts | H_τ={0,1}, multiplier weight w=1 | {w−h}={1,0}; choosing {2,3} instead gives no paired weight equality. | Nonempty local conditions and compatible Hodge sets correctly retained. |
| 6.5 PD lifting | Ordinary character versus noncrystalline Tate curve | Character: rank N=0, diagonal sum rank 1. Tate curve: rank N=1, while any crystalline character sum has rank N=0. | PD premise is substantive; final automorphy also retains a residual seed. |
| 7.1 weak/strong primitivity | Trivial rank-two C₂-module over F₂ | Generator on k[C₂] is J₂(1), rank(g−1)=1; on 1⊕1 rank(g−1)=0. Semisimplifications both equal 1⊕1. | Weak=true, strong=false. This verifies that the two definitions cannot be conflated. |
| 7.4 image invariance | S₃ standard representation, p=5,n=2 | Over F₅ there are 0 order-three characters of C₃, so no index-two induction giving the standard module. Over F₂₅ there are 2; each induces it. Normal-kernel orbit p-powers dividing 2 can only be 1. | Prime-to-p/image argument and field sensitivity survive. |
| 7.10 strong restriction | Eigenvalues 1+T and −(1+T), k=F₅ | Distinct initially; squares both 1+2T+T². Their ratio has order 2. | Merely regular semisimple is insufficient; multiplicative independence excludes this input. |
| 7.11 determinant splitting | Rank-one witness of R03 | Teichmüller norm=1; required norm=1/36; difference 35/36 has 5-adic valuation 1. | R03. Repaired d₀ gives norm 1/36 on both sides. |
| 7.13–7.14 weak restriction | Integral norm weights 0 and 1, dual weights 0 and −1; T=u² | Midpoint weights 0 and 0 in this diagonal example; a norm of weight 0 for a line with pairing valuation 1 has selfdual midpoint weight 1/2, becoming 1 after ramification. Residue field remains k. Also (1+T)^5=1+T⁵≠1. | Checks the half-integral and torsion-free steps; not an identification of weak with strong primitivity. |
| 7.18 projective image contract | Standard Sp₄(F₅[[T]]) | dim PSp₄=10; dim PGL₄=15; torus eigenvalues a,b,a⁻¹,b⁻¹ satisfy product=1. | R04; missing independence hypothesis is discriminating. |
| 8.1–8.2, 8.17–8.18 lifting/finiteness | Two rank-one blocks, n=2,l=7 | l>max(3,2); two distinct characters have 2 centralizer blocks; full block-sign group has order 4, effective quotient order 2. | Multi-block formulation retains determinant-ring comparison rather than assuming a universal R→T map. |
| 8.7 reducible locus | n=2,d=[F⁺:Q]=4,d_R=3; empty R | Bound=2·4+2−3=7; with empty R it is 10. Blocks n₁=n₂=1 contribute 4+4 before determinant relations. | Formula and explicit rank-one supplier need survive; R03 must be repaired in the route. |
| 8.8 generic primes | n=2,d=4, local degree 4, d_R₁=d_R₂=3 | Threshold=max(7,4)=7, so a dimension-8 component passes. Empty R gives threshold 10, exceeding dim Λ/(ϖ)=8. | Strict inequality and the empty-set negative control survive. |
| 8.20 auxiliary obstruction | n=1, q=2 mod 5 | q·ad(Frob)−1=1, invertible; for q=1 it is 0 with one-dimensional kernel. | Tate twist is essential and correctly retained. |
| 9.1 generic WD | r=1⊕|·|, q=3 | With N=0, Hom(r,r(1)) has dimension 1. For the nonzero Steinberg N it has dimension 0; rank-one trivial r also gives 0. | Mathematics agrees with the existing AG2.6 object; duplication R08. |
| 9.5–9.6 polarized tangent route | Two-target dependency graph | Edges 9.5→9.6 and 9.6→9.5 produce a directed cycle of length 2. | R01; split construction/equivariance/consequence. |
| 9.7 adjoint Selmer headline | Rank-one unitary character | ad over G_F is a scalar line, but complex conjugation acts by −1; polarized real invariants have dimension 0 for p odd, not 1. | Correct polarized adjoint carrier is indispensable; replacing it by the trivial character changes the statement. |
| 10.1–10.2 integral R=T/parity | N=2,d=1,a=1, b sufficiently large, µ odd | f=1, κ=−1, δ=1; g=b−2; local relative dimension A. dim R∞=1+A+b−2 versus required depth 1+A+b. | Two-dimensional deficit excludes nonzero patched module; odd local correction cancels in the total count. |
| 10.3 rigidity | F₅ elliptic curve in R10, N=3,l=7 | #points=5; roots 2,6; their ratio=5. Printed powers {5²,1,5⁻²}={4,1,2}; full ratio set also contains 5 and 3. | R10. |
| 10.4–10.5 generic-domain lifting | n=2, source λ=(0,0) | Source λ+η=(1,0); changing HT(ε) from +1 to −1 gives {−1,0}. Negating only λ would incorrectly leave {1,0}. | η and the sign conversion cannot be omitted. §10.4 needs its explicit dependency line. |
| 10.6 change of weight | Bare residual seed, no weight-compatible seed supplied | Source relaxation has 0 hypotheses asserting membership of the selected obvious weight in W_mod; package adds 1 such hypothesis. | Binding generality failure R07, not a numerical counterexample to its weaker implication. |
| Locator controls | NT21 pages; pinned splitting declaration | Theorem 5.7 spans pages 72 and 73, not 71 and 72; pinned declaration starts at 74, not 70. | R14. |

### Pinned-library and acceptance-test audit

The pins read were Mathlib 6b7abb3 and Tau Ceti a91d3aa. Object searches covered automorphic representations, deformation rings, Bloch–Kato conditions, diagonalizability, induction, Krull dimension, nilpotent kernels and minimal primes. No pinned carrier was found for the automorphic/deformation/Selmer objects needed by the headline statements. This conclusion does not confuse the existing generic representation carrier with an automorphic or polarized deformation theory.

The following declarations were opened at the pins, rather than inferred from their names:

| Declaration | Pinned file and line | What the definition actually provides |
|---|---|---|
| Field.absoluteGaloisGroup | Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42 | Algebraic-closure algebra automorphisms, with group, Krull topology and topological-group instances. |
| NumberField.IsCMField | Mathlib/NumberTheory/NumberField/CMField.lean:69 | Total complexity and quadraticity over the maximal real subfield. Its binders are Field and CharZero; NumberField is not built into this class. |
| cyclotomicCharacter | Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean:307 | Character on ring automorphisms into p-adic units. The surrounding text explicitly gives the trivial fallback without all p-power roots; an algebraic closure of a number field has the required roots. |
| Representation.ind | Mathlib/RepresentationTheory/Induced.lean:77 | Algebraic induction on coinvariants of the group-algebra tensor product; no continuous open-subgroup induction is included in this definition. |
| ringKrullDim | Mathlib/RingTheory/KrullDimension/Basic.lean:26 | Dimension of PrimeSpectrum, valued in WithBot ℕ∞. It is not an integer-valued function that silently identifies the zero ring with a field. |
| RingHom.Finite | Mathlib/RingTheory/Finiteness/Defs.lean:174 | Module.Finite for the algebra structure induced by the ring map, not finite cardinality of the ring. |
| Ideal.finite_minimalPrimes_of_isNoetherianRing | Mathlib/RingTheory/Ideal/MinimalPrime/Noetherian.lean:26 | Finiteness of minimal primes of an ideal with the Noetherian hypothesis in scope. |
| Module.finite_of_surjective_of_ker_le_nilradical | Mathlib/RingTheory/Finiteness/NilpotentKer.lean:22 | Finite quotient plus surjection, nilradical kernel and finitely generated kernel imply module-finiteness. The kernel hypothesis must not be discarded. |
| NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet | TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.lean:51 | Finite Galois number-field extension and a conjugacy class give density card(C)/card(G); not a theorem for arbitrary infinite extensions. For G=S₃ the transposition density is 3/6=1/2. |
| NumberField.ncard_primesOver_eq_finrank_iff_of_isGalois | TauCeti/NumberTheory/NumberField/SplitsCompletely/Basic.lean:74 | Finite torsion-free Dedekind-base/Galois-group hypotheses accompany the equality of prime count and degree with e=f=1. |

The README's headline families are minimal adequate lifting (§5.1), dyadic lifting (§5.3), ordinary lifting (§5.5), fixed-component/ordinary finiteness (§§5.6–5.7), potential ordinary automorphy (§6.2), prescribed ordinary lifts (§6.3), potentially diagonalizable lifting (§6.5), residually reducible lifting/finiteness (§§8.1–8.2, 8.17–8.18), adjoint Selmer vanishing (§9.7), rigid integral R=T (§10.2), almost-all-primes rigidity (§10.3), and generic-domain lifting/change of weight (§§10.5–10.6). Their missing carriers are substantive. No statable headline forced through a free predicate or a surrogate theorem was found. The docstring omissions are R15.

The required `lake env lean` elaboration of the package's Suggested.lean, run from the pinned content checkout, exited 0 with empty output: **no warnings**, including no sorry warnings. There are zero definitions, instances, theorem declarations and admitted examples. Consequently the elaborated-signature comparison has zero signatures, and the one-tactic padding probe has zero sorried theorems to try. No TauCeti import required building. No build was left running. An empty acceptance file is allowed here; padding it would not repair any finding.

### Ownership and supplier resolution

The supplied board-package index was read before the ownership audit. Main and available open heads were searched by object with `roadmaps grep` and inspected with `roadmaps show`; this included the board packages, not just similarly named declarations. There are no declarations in Suggested.lean, hence zero fully qualified name collisions from this package's Lean file.

The principal overlaps and boundaries are:

- **Earlier generic WD owner:** AutomorphicGaloisRepresentationsPartII AG2.6 already owns the definition and generic LLC criterion. This is the actionable duplication R08.
- **Later ModularityAndLanglandsExtensions:** its README:823 (§2.1), :1106 (§2.14), :1131 (§2.15), :1149 (§2.16) presently also plans PD criteria, paired Dwork/residual potential automorphy, prescribed lifts and PD lifting. The package's downstream section correctly sends these objects toward that later roadmap. Record this as an ownership move down to PotentialAutomorphyInfrastructurePartII, not an upward dependency: the later roadmap must import these targets instead of retaining a second construction. The package must not add it as a supplier. This move is not evidence that the downstream edit has already happened.
- **Local conditions:** LocalGaloisDeformationRings retains ordinary flags, connects and all local lifting-ring constructions. This package's global place-by-place ordinary predicate and global applications are distinct. GL₃-specific weak-minimal patching in §6.30 does not supply the arbitrary-rank generic Serre-weight theorem.
- **Determinants:** IntegralHeckeAndGaloisDeterminants §0.5 owns descent to the coefficient subring; §1.4 owns partition reducibility ideals. The new global finite-over-P and polarized block-sign comparison require additional arithmetic hypotheses and are not duplicates of coefficient descent alone.
- **Primitivity:** searches for weak/strong primitivity and semisimplified induction found no other owner of the package's comparison arguments. The field-sensitive definitions and §§7.3–7.4 are legitimate additions.
- **Dwork geometry:** PeriodsAndSpecialValues §PS.8.16a owns the reciprocal Dwork equivariant semistable model, not the full paired symplectic automorphy construction. Keep that generic geometric object with its owner if a proof route needs it; the present route uses its separately specified cohomological summand and cited geometric inputs.

Supplier locations actually opened include the following. In this table README means TauCetiRoadmap/<Supplier>/README.md; the completed Chebotarev path is specified separately. These are repository-relative locations; all non-main copies are the available open heads, not a remembered earlier version. Grouped entries record related contract boundaries, not additional theorem ownership by this package.

| Supplier | Resolved locations and supplied object |
|---|---|
| PotentialAutomorphyInfrastructure | README:336 (§0.4 dual Weyl lattices), :884 (§2.3 soluble transport), :910 (§2.5 cyclic/CM prescriptions), :1989 (§3.44 ordinarity), :2054 (§3.47 ordinary base change). |
| ArithmeticGaloisRepresentations | README:878 (§1.3 continuous induction), :1100 (§1.8 Brauer–Nesbitt), :1356 (§1.12 Clifford/induction), :4283 (§7.4 polarization), :4816 (§7.9 adequacy), :4907 (§7.10 enormous images). The three names in the citation resolver are supplier APIs, not pinned Mathlib claims or absent roadmap names. |
| LocalGaloisDeformationRings | README:890 (F.2.11 pseudodeformations), :1380 (1.7 ordinary predicates), :1915 (2.15 Ihara components), :2196 (2.28 G-valued generic fibres), :3025 (6.8 connects), :3324 (6.24 trivial-residual flag image). Its G-valued dimensions fix the abelian quotient; freeing the determinant must be accounted for separately. |
| GlobalGaloisDeformations | README:494 (3.6 relative tangent/Selmer), :712 (4.2 restriction finiteness), :765 (4.4 twisting), :1877 (8.1 split odd-p polarized problems), :1995 (8.4 presentations), :2079 (8.6 residual enormous primes). The dyadic, nonsplit and characteristic-zero enormous extensions are declared gaps, not automatically provided by these restricted statements. |
| DeformationAndDerivedPatchingAlgebra | README:904 (4.2 integral points), :1072 (5.4 compatible patching), :1214 (6.1 near faithfulness), :1274 (6.5 reduced identification); §§5.5–5.6,5.8 and 6.4–6.7 resolve in the heading index. Finite modules and Noetherianity are not dispensable in the support arguments. |
| DeformationAndDerivedPatchingAlgebraPartII | README:753 (K0.7 duality), explicitly sourcing Matlis duality to DerivedModuleAlgebra §§1.M.1–1.M.2. This is a transitive supplied input, not a newly proved Matlis theorem here. |
| IntegralHeckeAndGaloisDeterminants | README:597 (0.2 scalar-extension laws), :862 (0.5 coefficient/trace laws), :1864 (1.1 Cayley–Hamilton), :2375 (1.4 reducibility ideals), :3058 (3b.1 Galois-type maximal ideals). |
| AutomorphicGaloisRepresentationsPartII | AG2.0 weight/polarization dictionary; AG2.2 restricted existence and twisting; AG2.3 unrestricted existence; AG2.5–AG2.6 compatibility; AG2.7 finite realization/residual representations. R08–R09 identify the two material ownership/citation corrections. |
| AutomorphicFormsOnReductiveGroups | README:1193 (7.4 actual coefficient action), :1216 (7.5 stabilizers, base change, realization). Finite stabilizers require both compactness modulo the real split center and discreteness of rational central points. Definite unitary groups meet the relevant compact setting. |
| AdelicAlgebraicGroups | README:3029 (3.4 reduction/class numbers), :4350 (4.3 neatness); §4.4 double-coset interfaces resolve. |
| ArithmeticLocallySymmetricSpaces | README:991 (ALS.F.7 algebraic weights and infinity representations); this does not replace the parent's integral dual Weyl lattice. |
| SmoothRepresentationsOfLocalGroups | README:982 (SR.1 convolution), :3757 (SR.5.2 integral blocks/families); the types and segment subsections are inside this long section, not missing because the main heading says “integral blocks”. |
| EndoscopicTransferAndUnitaryTraceComparison | README:1772 (4.7a JL), :2447 (6.24 all-place cyclic comparison), :2484 (6.26 automorphic induction), :2538 (6.29 unitary weak base change/descent), :3920 (10.23 segments/monodromy), :4068 (10.30 classical LLC comparison). Its geometric Frobenius special block satisfies FN=q⁻¹NF, consistent with the package's convention. |
| PadicHodgeTheory | README:754 (3.6 labelled flags), :1177 (6.3 ordinary filtrations/semistability); period and geometric comparison layers resolve. The unlabelled filtration notion is distinguished from a full character flag. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | README:4801 (R07.3.4 FL modules), :5070 (R07.3.12 safe-interval subquotients). The interval and variance conditions accompany the realization. |
| SelmerIwasawaCohomology | README:354 (2.1 Selmer data), :573 (2.9 Galois Selmer groups), :1932 (4.9 Bloch–Kato condition). The finite-coefficient condition is propagated from V, not arbitrarily identified with unramified classes. |
| ArithmeticGaloisDuality | README:1401 (R02.2.3 descent), :4014 (R02.4.5a finite Poitou–Tate), :6600 (R02.5.1 Greenberg–Wiles), :6811 (D8.1 adjoint/first-order coefficients); R02.4.2–4.3 and D7.4 resolve. |
| PadicFamilies | README:189 (0a.2 finite ordinary projector), :233 (0a.4 invertible/nilpotent summands). These statements concern modules finite as sets; the ordinary completed tower applies them at finite quotients. |
| PotentialModularityAndCompatibleSystems | README:778 (2.8 integral points), :844 (2.13 avoidance), :866 (2.15 finite local character extension). Incompleteness and Galoisness are explicit where used. |
| ReductiveGroupsPartII, main | README:2846 (RG2.2.1 building), :3408 (RG2.2.4 GL_n norms/lattice chains). k((T)) with finite k is a nonarchimedean local field, so this norm model applies. |
| EtaleCohomologyFoundations, main | README:504 (F.2.1 proper base change), :522 (F.2.2 smooth base change), :907 (F.10.1 Frobenius). The Dwork family is smooth proper on the specified open base, with l inverted for its lisse sheaf. |
| ComplexComparisonPartII | README:2576 (C5.2 Gauss–Manin), :2899 (C5.3 Hodge theory), :3747 (C5.6 regular singularities), with C6 Artin comparison. |
| LefschetzPencilsAndVanishingCycles | README:932 (1.1 quasi-unipotence), :1017 (1.2 twisted monodromy). Finite residue fields meet the arithmetic monodromy hypotheses. |
| ClassFieldTheory, main | README:1312 (Layer 7 local reciprocity), :1724 (Layer 12 global reciprocity), with the geometric convention recorded at the package boundary. |
| Chebotarev, completed/main | Completed/Chebotarev/README.md:410 (Layer 10); the actual density result used is the pinned Tau Ceti theorem listed above. |

All 17 declared gap slugs occur once in design/plan.json and have matching README markers, supplier names and needs text. None has supplier “none”. In particular the rank-one finiteness, dyadic archimedean/global, nonsplit local/global, completed-product and finite-group-equivariant patching requirements were treated as contracts, not reported as absent suppliers. R04 repairs an actual overclaim in one contract. Since the verdict is needs changes, review.json does not assert conditional acceptance of the other gaps.

The mechanical dependency check completed successfully, with this exact output:

```text
moved: PotentialAutomorphyInfrastructurePartII moved in the merge order from #85 to #258, right after its last supplier PotentialAutomorphyInfrastructure (GlobalGaloisDeformations, PadicHodgeTheory, EndoscopicTransferAndUnitaryTraceComparison, AutomorphicGaloisRepresentationsPartII, PadicFamilies, PotentialModularityAndCompatibleSystems also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 188 roadmaps, 1250 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line for this roadmap in that check. The allowed move is not a finding. The report records the required ownership movement toward this package from later ModularityAndLanglandsExtensions; no merge-order or supplier file was edited.

## Not verifiable

- No cached source needed for the seeded sample was inaccessible. The 21 manifest entries are legally sourced cached texts; there was no need to fetch a replacement or add a missing-reference request. No manifest entry was rewritten.
- The new weak-primitive proof is not a stated result in Tho15 or Sk13. The source audit verifies the printed Tho15 hypotheses/proof gap and Sk13's norm interpolation, while the intermediate lattice construction in §7.13 remains the package's own mathematical work. It cannot be certified simply by reporting the Proposition 5.3 locator as a match.
- The report does not verify texts of separately named secondary works beyond their use in the registered primary papers and resolved suppliers. In particular it does not claim an independent reading of Pink, Tadić, Liu or Brochard. The declared supplier gaps retain those proof obligations.
- Ownership was checked against main, the indexed board packages and the available indexed open heads. This is not a claim about unpublished or otherwise unavailable work.

## Source issues

- **Error** in NT21 at §6, definition following Proposition 6.5, printed p.79: the source says the residual Hecke eigenvalue is q^{j(j−1)/2} times the exterior trace; it should be q^{−j(j−1)/2} times that trace; affects a stated result.
- **Error** in Tho15 at Lemma 3.36, printed p.28: the source says a Teichmüller determinant always supplies the fixed-determinant factor; it should be a determinant compatible with the fixed multiplier and permitted ramification, or a separately stated characteristic-l specialization; affects a stated result.
- **Error** in BLGHT11 at Lemma 5.1(2), printed p.35: the source says the untwisted fibre has Frobenius roots ±1,±q,…; it should be the normalized Tate-twisted fibre, with q the residue cardinality of F; affects a stated result.
- **Error** in LTXZZ at Proposition 4.1.1, good-reduction proof, printed p.36: the source says exponents N−1,N−3,…,1−N suffice to exclude ramified lifts; it should be all eigenvalue-ratio exponents from 1−N through N−1; affects the proof.
- **Misprint** in Tho12 at Theorem 6.5(i), printed p.35: the source says the local comparison without the dual/Tate twist and without excluding R; it should be the dual twisted by 1−n, away from S_l∪R; affects a stated result.
- **Error** in Tho12 at Proposition 6.6(ii), printed p.36: the source says residual representations are unramified outside T without qualifying inert levels; it should be restricted at inert places to hyperspecial level; affects a stated result.
- **Gap** in Tho15 at Proposition 5.3, printed p.58: the source says reduction of characteristic-zero induction contradicts weak residual primitivity; it should justify actual residual induction or assume strong primitivity, and justify coefficient-field stability; affects the proof.
- **Misprint** in Tho15 at §5.2 immediately before Proposition 5.3, printed p.58: the source says E is the fraction field of E; it should be the fraction field of A; affects nothing.
- **Gap** in NT21 at Proposition 5.6, printed p.71: the source says Theorem 5.2 supplies finiteness for both residual blocks; it should supply the rank-one case separately when a block has dimension one; affects the proof.
- **Misprint** in NT21 at setup before Theorem 5.7, printed p.72: the source says the polarized extension has domain G_{F,S}; it should be G_{F⁺,S}; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "a27f6fc6eee062431f1a6b295f0c1e0595e60e73", "job": "REV-PKG-PotentialAutomorphyInfrastructurePartII", "model": "gpt-6-astra", "worker": "chris-3"} -->
