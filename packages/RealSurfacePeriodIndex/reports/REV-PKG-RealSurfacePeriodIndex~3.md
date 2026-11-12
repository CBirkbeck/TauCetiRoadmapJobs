<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13094#issuecomment-6782360898 -->
Review (codex) of 3987c9e

Verdict: needs_changes

1. **F01** (P2) The general obstruction theorems remain narrowed

   **Location.** packages/RealSurfacePeriodIndex/README.md:24: “The source's Propositions 4.4, 4.5 and 6.6 are planned in their stated generality”; compare :1203, :1259 and source correction E3 at :2646.

   **Claim.** The roadmap retains the general propositions about a given double cover, including an avoided set with mixed evaluation.

   **Witness.** B19 line 748 assumes no Picard-realizability condition. README :1203 additionally assumes a line bundle realizing a₀cl_R(M). For a₀=(0,1), e=(e₀,e₁), the required class is (0,e₁), not e or 0.

   **Repair.** Keep the corrected general boundary formula. Supply a named general target proving the missing realization or an alternative obstruction argument under the original assumptions for a given cover; carry it into §§4.5 and 4.8 and state its inputs. Do not use the freedom to choose a square auxiliary bundle in §6.13 to discharge a theorem about every previously given cover. Until that general target is supplied, remove the assertion that these two propositions are planned in their stated generality and identify the outstanding general case explicitly; this textual correction alone does not complete the required general library. Proposition 6.6 itself is repaired by the square-bundle choice.

   **Test of the repair obligation.** On two components with a₀=(0,1), a₁=0 and e₀,e₁ nonzero, φ=M leaves (e₀,0), and φ=O leaves (0,e₁). A realization with class (0,e₁) makes the residual (0,e₁)+(0,e₁)=0. The current square construction handles e₀=e₁=0 only. This is a missing general argument, not a claimed geometric counterexample to B19's theorem.

   Re-raised: R11. The repair fixes the full mixed-evaluation boundary computation and the constructed-cover theorem, but adds a hypothesis to the two fixed-cover theorems. The binding generality requirement is therefore only partly satisfied; E3 acknowledges this limitation rather than proving the missing implication.

2. **F02** (P1) The split-cover boundary case falsifies the Layer 4 example

   **Location.** packages/RealSurfacePeriodIndex/README.md:1279: “every cover satisfies the hypotheses of §4.1 and the topological obstruction vanishes”; also :1143, “Br(T)[2] ⊂ Br(ℝ(T))[2]”.

   **Claim.** When S(ℝ) is empty, §4.1 alone gives vanishing of the topological obstruction, and its cover always has a function field.

   **Witness.** Take a complex Enriques E as an ℝ-surface, its nonzero Brauer class, R=D=∅, L=O and s=1. Then T=S⊔S, all real-locus groups vanish, but τ=(1,1) in (ℤ/2)².

   **Repair.** In the Layer 4 example retain Assumption 3.1, specifically ampleness of L(R), for obstruction vanishing. Keep §4.2 general: say p*α on T_U extends uniquely to Br(T)[2], and on each integral component T_i its generic restriction belongs to Br(ℝ(T_i))[2]. Use this componentwise language wherever that assertion is repeated before ampleness supplies connectedness. Do not impose integrality on the general finite-cover construction.

   **Verification.** README §3.1 explicitly allows disconnected étale covers. For the example, Assumption 4.1 has Ψ=∅ and maps between zero real cohomology groups, so all three conditions hold. EnriquesSurfaces §1.3 identifies Pic(E) with H²(E,ℤ), and §1.4 computes H³(E,ℤ)[2]=ℤ/2; consequently the nonzero Brauer class has nonzero topological obstruction. These statements are at PR #1286, TauCetiRoadmap/EnriquesSurfaces/README.md:183 and :221. Restricting scalars here means viewing E as an ℝ-scheme, not Weil restriction. Its conjugate pair of complex components has equivariant cohomology H*(E), and the split cover has two copies. Thus τ=(1,1)≠(0,0). Its total rational ring is ℂ(E)×ℂ(E), with (1,0)(0,1)=0, so it is not the field denoted ℝ(T). The repaired componentwise extension yields (α,α), correctly without asserting τ=0. The repaired vanishing statement excludes L=O, which is not ample on this projective surface.

3. **F03** (P3) The integral vanishing lattice is confused with its preferred complement

   **Location.** packages/RealSurfacePeriodIndex/README.md:1731: “The integral classes of the vanishing part need not form a direct summand of H²(T, ℤ)”.

   **Claim.** Rational splitting can fail because the integral vanishing subgroup is not an abstract direct summand.

   **Witness.** For p:ℙ¹×ℙ¹→Sym²ℙ¹=ℙ², p*(h)=(1,1) and p_*(a,b)=a+b. The vanishing lattice is ℤ(1,−1), complemented by ℤ(0,1); the preferred constant-plus-vanishing lattice instead has index 2.

   **Repair.** Replace this Check by the distinction it needs: the rational decomposition need not give an integral decomposition using the pullback lattice as the complementary summand. Give this example, where det((1,1),(1,−1))=−2. The integral subgroup defined as the inverse image of a rational subspace is saturated; H²(T,ℤ) is finitely generated, so its quotient is free and the subgroup does split abstractly. If working modulo torsion, the same conclusion holds. Test the corrected Check with det((1,−1),(0,1))=1 versus the preferred determinant −2.

4. **F04** (P2) The Tsen–Lang ownership transfer is still unilateral

   **Location.** packages/RealSurfacePeriodIndex/README.md:2637: “which is their single owner”; also :24 and §0.7.

   **Claim.** QuadraticFormInvariantsPartII imports the general C_i/system/algebraic-extension/Tsen–Lang interface from this package.

   **Witness.** PR #1834, TauCetiRoadmap/QuadraticFormInvariantsPartII/README.md:1621 still states IsCi.of_trdeg; :116 says RealSurfacePeriodIndex takes §5.6 from it. Its §§5.1, 5.4 and 5.5 also construct the same objects.

   **Repair.** Complete the announced transfer with the worker responsible for that roadmap: retain the owner here, remove the duplicate targets from that later roadmap and replace them with §0.7 supplier citations; remove its reverse supply assertion. Its finite-field and Kronecker-dimension applications remain there. Record completion against that head before acceptance. This reviewer does not edit the sibling package, and no upward citation should be introduced here.

   **Test.** Both current heads claim the extension ℂ⊂ℂ(t₁,…,t_j), j=1,2: C₁ and C₂ give quadratic thresholds 2 and 4. The repaired graph must have one owner for these same statements and exactly the edge RealSurfacePeriodIndex → QuadraticFormInvariantsPartII, rather than two owners and mutually contradictory descriptions.

   Re-raised: R09. The repair report labels this finding “applied”, while its maintainer note explicitly confirms that the other head still needs the change. The package-local edits are correct, but cannot make the factual assertion about that head true. The overlap rule expressly requires checking both heads. The out-of-package limitation is respected by reporting the required coordinated repair, not by editing it.

5. **F05** (P2) Independent layers retain the source's section sequence

   **Location.** packages/RealSurfacePeriodIndex/README.md:1106 and :1285, with Dependencies at :1283 and :1502: Layer 4 depends on Layers 0,1,3; Layer 5 depends on Layers 2,3.

   **Claim.** The build order is derived from the mathematics under the stated organization rule.

   **Witness.** B19 line 667 begins §4, pullback on a double cover; B19 line 904 begins §5, its Noether–Lefschetz locus. README Layers 4 and 5 repeat that sequence although neither dependency list orders them.

   **Repair.** Give these independent branches an organization derived from the final construction, for example put the geometric Noether–Lefschetz branch immediately after the cover construction, followed by the obstruction branch, then their synthesis. Update section references and provide explicit old-to-new aliases for moved IDs. Do not invent a dependency to preserve source order.

   **Test.** The induced graph has zero edges 4→5 and zero edges 5→4. Swapping these branches leaves all their prerequisites earlier and both branches earlier than Layer 6. This is an organization finding under the explicit rubric, not a mathematical cycle.

   Re-raised: R12. The repair report disputes the finding because the layers are independent. That is exactly the condition singled out by the binding rule about runs of layers in source section order whose dependencies do not force that order; the absence of a sentence saying “follows B19” does not remove this separate clause.

Five findings: one P1, three P2 and one P3. Thirteen of the sixteen previous findings are repaired; three are partly repaired or remain open. The mathematical input files were not edited. The eight Lean headline theorems elaborate, retain their hypotheses, and survive the padding probes. The three declared supplier gaps are contracts, not findings.

## Verified sound

### Previous findings, checked before the new pass

The following quotations are from the repaired package, not quotations from sources. All sixteen previous findings were checked individually. “Repaired” here concerns that finding, not acceptance of every neighboring sentence.

| Previous finding | Repaired passage and location | Status and recomputed witness |
|---|---|---|
| R01 native signatures | README :228, “Isometry invariance, additivity under orthogonal sums, multiplicativity under tensor products and the value 0 on the hyperbolic plane are the native laws” | Repaired. Native signature values for positive plane, hyperbolic plane, negative plane are 2,0,−2. Only the varying-ordering adapter remains owned here. |
| R02 finite-dimensional predicate | Suggested.lean :69, “[FiniteDimensional K V]” | Repaired. Infinite-dimensional finrank=0 no longer supplies a false witness. Hyperbolic plane gives 2·1=2; positive plane gives 2·0≠2. Explicit binder retained in the printed type. |
| R03 real-closure restriction | README §0.5, “the relative algebraic closure R_F of F in a real closure R_L of L” | Repaired. For ℝ⊂ℝ(t), trdeg R_L=1, while the relative algebraic closure is ℝ of trdeg 0; trace signatures restrict unchanged. |
| R04 Springer disjunction | README §0.10, “an isotropic q has at least one isotropic residue form” | Repaired. H⊥t⟨1⟩ has zero (1,1,0); residual isotropy values are true,false. |
| R05 Kummer degree | README §1.2, “κ(M) = cl(M) mod n” | Repaired. ℙ¹,O(1),n=2: κ=1 mod 2, βκ=0 in degree 3, c₁=1 in degree 2. |
| R06 projectivity | README §3.2, “if S is projective” | Repaired for the incidence family and its cohomological consumers. Affine base gives ℙ¹×𝔸², not proper; projective base gives a projective threefold. R02 here concerns a different missing ampleness condition. |
| R07 vanishing projection | README :1710, “λ_van = λ − ½·p*p_*λ” | Repaired. For the conic, pushforward is 2h−2h=0 instead of 2h. The constant term has derivative 0. |
| R08 fixed lifts | README §6.12, “the normalisation must still be imposed”; §8.3 requires the zero Kummer lift | Repaired. c₁O(1,0) mod 2=(1,0), although its Brauer image is 0; subtracting that Picard class normalizes it to 0. Same pattern fixed in §4.6. |
| R09 Tsen–Lang owner | README :2637, “which is their single owner” | Partly repaired. Correct local direction; PR #1834 still constructs the same objects and claims the reverse direction. R04 above. |
| R10 internal edges | README §0.9 uses “Br(O_{C,x})”; §7.5 precedes §7.6; Θ₀⊂V is in §8.2 | Repaired. Layer 0 no longer needs Layer 1; specialization precedes its consumer; finite-flat open precedes alternating cover. No return edge remains. |
| R11 mixed evaluation | README §4.4, “[ζ]₁ = a₁ + a₀ ∪ [e]₁”; §4.5, “suppose there is φ_Ψ ∈ Pic(S)” | Partly repaired. Mixed boundary is (0,e₁), and square M makes it 0 for the constructed cover. The given-cover theorems gain a hypothesis: R01 above. |
| R12 source ordering | README Layer 4 and Layer 5 dependencies are unchanged | Not repaired. Both orders are topological orders of the dependency graph; this is the specific organization issue in R05. |
| R13 u-invariant locator | README :289, “EKM, §36, p. 161; BEC05, §2, p. 3” | Repaired in README, Lean docstring and manifest. EKM line 8820 and BEC05 line 75 support the Elman–Lam convention, not the unrestricted dimension supremum over real fields. |
| R14 checks/API | §§0.5 and 0.7 now have “The definition has the following API” and distinct Checks | Repaired. Repeated bullets were removed; Z(0)=∅, Z(ℍ)=X and the transcendental restriction control distinguish the survival-locus construction. Definition sections retain at least three checks. |
| R15 process residue | README §9.12, “The K3 property is proved from the equation” | Repaired. The approval-status remark is gone; sextic degree 6 gives K=0 and rational double points do not change it. |
| R16 algebraically closed branch | README §0.7, “If F is algebraically closed (for any i; this covers i = 0” | Repaired. For ℂ,i=1,r=d=2,N=5: 5>4≥2 and ideal height≤2<5. No nonexistent normic form is required. |

The scan for the repaired patterns included all 106 numbered subsections, all API/Check blocks, the summary, conventions, contracts, source corrections and Lean docstrings. The remaining occurrences that need changes are isolated above. In particular, no new arbitrary Prop stand-in, sorry'd data, set_option, computational algorithm, source passage copying, route-specific prime restriction or package namespace collision was found. The extra realization hypothesis is the remaining generality issue, rather than an unreported exclusion of mixed evaluation in §6.13.

### Computed adversarial evidence

The table reports computations, not a proof by example. It covers all fifteen sampled targets, every headline, every changed mathematical pattern and each finding. Unchanged targets were also read against their routes and Checks; the previous review's numerical rows were used only for the unchanged instances they actually compute. A source's proof is not treated as correct merely because the source is cited.

| Statement | Instances tried | Values computed on the two sides | Result / required change |
|---|---|---|---|
| §0.1 ordering and Harrison signs | ℝ, ℂ; a=1,−1 | X_ℝ={P}, X_ℂ=∅; H_package(1)=X, H_package(−1)=∅ | Properness excludes the whole ring; characteristic-zero field excludes the zero ring. EKM uses negative Harrison sets: H_package(a)=H_EKM(−a). |
| §0.2 compactness/inverse limits | constant ℝ system; an ℂ stage | limit of singleton spaces is singleton; any map to empty X_ℂ forces empty source | Empty Harrison space is compact; no unsupported nonemptiness assertion. |
| §0.3 specified real closure | ℚ with positive cone; ℝ⊂ℝ(t) | algebraic real closure has trdeg 0; real closure of ℝ(t) has trdeg 1 over ℝ | Algebraicity is part of the object; restriction in §0.5 uses a different relative algebraic closure. |
| **§0.4 signature** | ⟨1,1⟩, H, ⟨−1,−1⟩; ⟨1,−t⟩ over ℝ(t) | sigPos−sigNeg=2,0,−2; at t>0 value 0, at t<0 value 2 | Native laws imported; local constancy is on the appropriate Harrison sets. |
| §0.4 signature multiplication | H⊗⟨1,1⟩ | inertia (2,2), signature 0=0·2 | Negative versus positive ordering normalization agrees with the adapter. |
| **§0.5 survival locus** | M_d(ℝ), ℍ; restriction ℝ⊂ℝ(t) | trace-form signatures d,−2; Brauer evaluations 0,1; survival loci ∅,X | Signature distinguishes split and quaternion class; preimage formula holds. R_L is not a real closure of ℝ. |
| §0.5 addition | ℍ+ℍ | Brauer value 1+1=0; X symmetric-difference X=∅ | Confirms symmetric difference, not union. |
| §0.6 zero-total-signature predicate | H, positive plane, zero space; infinite positive space | isotropic dimensions 1,0,0 give 2=2,0≠2,0=0; infinite space is excluded | Real body is a meaningful finite-dimensional predicate. Degenerate forms cause no false anisotropy consequence. |
| §0.7 C_i/system threshold | ℂ,i=1,r=d=2,N=5; ℝ with X²+Y² | 5>2·2=4; height≤2<5. Over ℝ, q(x,y)=0 implies x=y=0 although 2>1 | Algebraically closed branch works; ℝ is not C₀. Degree 0 is not admitted. |
| §0.8 curve u | nonreal ℂ(t), real closed ℝ | ⟨1,−t⟩ anisotropic of rank 2; torsion Witt group of ℝ is 0 | Nonreal curve and Elman–Lam conventions distinguished. |
| §0.9 evaluation | (−1,t) at t=−1, and at t=1 | values ℍ and split; Br evaluation 1 and 0 | The local evaluation carrier is available before Layer 1. |
| §0.10 Springer | H⊥t⟨1⟩; ⟨1,−t⟩ over ℝ((t)) | first zero (1,1,0), residues true,false; second would require even valuation=odd valuation | Correct disjunction in proof and conjunction for anisotropy. Residue characteristic 2 excluded. |
| §0.11 Amer–Brumer | two zero forms in dimension 1; q₁=x²,q₂=0 | common nonzero zero exists in first case, none in second; q₁+tq₂ has same answers | Quantification concerns an actual common vector; no arbitrary predicate surrogate. |
| §0.12 period/index | split matrix algebra; ℍ; Albert biquaternion | (per,ind)=(1,1),(2,2),(2,4) | Zero Brauer class has period 1 in multiplicative Lean convention, not 0. Divisibility is nontrivial in the third case. |
| §§0.13–0.15 classical criteria | division biquaternion and its Albert form; real positive plane | index 4 corresponds to anisotropic Albert rank 6; index≤2 corresponds to isotropy; positive plane signature 2 is outside zero-signature criterion | No claim that all forms over a real field have u≤4. |
| §1.1 unramified locus | quaternion (x,y) on 𝔸²; zero class | residues along axes are y and x modulo squares; zero class has empty ramification | Ramification is a finite union of divisors and its complement is the unramified open. |
| §1.2 coefficient boundary | ℙ¹_ℂ,O(1),n=2; Spec ℝ | κ=1 mod 2, βκ=0, c₁=1; H²_G(ℤ(1))=0, H³_G(ℤ(1))[2]=ℤ/2=Br(ℝ)[2] | Degrees and quotient by Pic agree. |
| §1.3 torsion line class | Möbius line on a circle; trivial line | monodromy/Borel–Haefliger values 1 and 0 | Distinct from the degree-two Kummer boundary in §1.2. |
| §1.4 real evaluation | zero class and Hamilton class | Θ=∅ and whole real locus; local Brauer values 0 and 1 | Local constancy on U, not a false claim of closedness in the compactification. |
| §§1.5–1.7 extension, reduction, removal | ℚ̄⊂ℂ, (x,y); punctured real surface | per/ind stay (2,2); removing a point from a real plane gives H¹=0→𝔽₂, injective but not surjective | Correct direction for cohomology restriction; divisor extension uses smoothness. |
| §2.1 hypersurface positivity | ℙ²,A=O(1); quintic,A=O(1) then O(2) | A²−A·K=4; quintic gives 0, then 20−10=10 | Strict positivity distinguishes the failed first quintic choice. |
| **§2.2 weight-two variation** | constant ℙ² family; K3 fibre | Hodge dimensions (0,1,0), ∇=0=Kodaira–Spencer; K3 gives (1,20,1) | Nonzero H²⁰ is allowed. Conjugation sends h to −h and ℤ(1) multiplies by −1, so the real cycle class is fixed. |
| §§2.3–2.4 topological kill and normalization | torsion τ of order n; β=c₁O(1,0) with prescribed zero lift | nτ=0; β mod 2=(1,0)≠0 before subtraction and 0 afterward | Normalizing β is necessary; its Brauer image alone does not fix reduction. |
| **§2.5 open cone** | ℙ² with H=(1,1) on ℙ¹×ℙ²; boundary of H²K condition | H²K=−2−6=−8<0; a zero-dimensional vanishing space has Ω={0}, nonempty and open | Source's positivity and sufficiently large degree are retained. The cone is in ker p_*, not all H². |
| §2.6 lattice cone | Λ=2ℤ, coset 1+2ℤ, cone (0,∞), ball radius 1/2 | 1 belongs to coset∩cone; coset∩ball=∅ | Conic dilation, not mere openness, supplies the lattice hit. |
| §§2.7–2.9 complex splitting | consecutive d,d+1 with period n; (x,y) over ℂ(x,y) | gcd(dn,(d+1)n)=n; per=ind=2 for quaternion | General de Jong headline is not a split-algebra boundary case. |
| §2.10 norm bound | ℝ(x,y), Albert class; n odd | per=2,ind=4, so 4 divides 4; primes(ind)=primes(n) excludes 2n for odd n | Bound cannot be replaced by equality over every real field. |
| §3.1 finite model | b=1; b=x; b=xy | O[z]/(z²−1)=O×O; discriminant 4x; node z²=xy | Normal need not mean integral; branch equation has simple factors. |
| §3.2 incidence/properness | r=s=0 at crossing; base 𝔸² versus ℙ² | fibre equation 0=0 gives ℙ¹, dimension 1 rather than length 2; affine total space not proper | Finite model and incidence resolution distinguished; base projectivity repaired. |
| §§3.3–3.4 node and strata | r=xy,s unit | w=0 at node, v≠0; exceptional curve and crossing fibre have dimension 1 | Correct homogeneous coordinate and distinct contracted curves. |
| §§3.5–3.6 pushforward | ample double cover versus split O-cover | ample connected cover H⁴→H⁴ is ℤ→ℤ, point class↦point class; split cover gives ℤ²→ℤ, (a,b)↦a+b | Ampleness excludes the kernel generated by (1,−1) in the second example. |
| §4.1 assumptions | S(ℝ)=∅, split cover | H¹,H² of both real loci are 0; Ψ=∅; all three conditions true | This does not imply ampleness or connectedness. R02. |
| **§4.2 unramified pullback** | ramification index 2; complex/real exceptional ℙ¹; split cover | 2·1=0 in ℤ/2; H¹_ét(ℙ¹_ℂ,ℤ/2)=0; real group ℤ/2 killed by one zero evaluation; F×F has zero divisors | Residue argument sound on every component; replace undefined generic field for disconnected T. R02. |
| §4.3 / Layer 4 example | complex Enriques over ℝ; L=O split cover | Pic(E)≅H²(E,ℤ), Br(E)[2]≅H³(E,ℤ)[2]=ℤ/2; pullback τ=(1,1)≠0 | The theorem retains ampleness; the example drops it. R02. |
| **§4.4 boundary formula** | a₀=(0,1), a₁=0, e=(e₀,e₁) | corrected boundary (0,e₁); printed shortcut (e₀,e₁) | Mixed formula repaired; zero-evaluation component detects the old error. |
| §4.4 twist/line convention | negative section of M² on Möbius circle | roots ±im exchange once; [e]₁(γ)=1=w₁(M)(γ); e₀+ω₀=1+1=0 | Bockstein twist and degree-one term agree. |
| §§4.5–4.8 Picard correction | mixed evaluation; realized class χ; θ adjustment | φ=M leaves (e₀,0); φ=O leaves (0,e₁); correct χ gives χ+χ=0; 2δ+θ₁−2(δ−μ−φ−ν)=θ₁+2μ+2φ+2ν | Conditional algebra correct; general realizability missing. R01. |
| §4.6 zero Brauer lift | α=0, α̃=κ(N′) nonzero | zero η gives 0≠κ(N′); η=cl(N′) reduces to κ(N′) | Fixed-lift correction also propagated here. |
| §§5.1–5.4 curve model | C conic in ℙ², A=O(1),l=2,N=O,R line | L=O(1); L|C=O_ℙ¹(2), A²|C=O_ℙ¹(4); H⁰(NK)=H⁰O(−3)=0 | Positive curve and auxiliary vanishings have concrete nonempty instances. |
| **§5.5 normal-bundle bound** | same conic | H¹O_ℙ¹(2)=H¹O_ℙ¹(4)=0; h¹N=0≤h²O_ℙ²=0 | Exact normal sequence gives the advertised inequality. |
| §§5.6–5.8 normal boundary | same rational surface; normal exact sequence | H²O_ℙ²=0; boundary degree is H⁰(N_T/X|C)→H¹(N_C/T), then H²O_T | Degree 1 in the middle, not source's degree-0 misprint. Cokernel bound becomes 0. |
| §5.9 square ample auxiliary | A₀=O(2) versus O(1) on ℙ²_ℝ | cl_R A₀=2h=0 versus h≠0; exceptional twists ±2E have class 0 mod 2 | Square choice preserves ampleness and kills the new correction in constructed covers. |
| §§6.1–6.4 positivity/topology | squared real line with change of frame u; real point blow-up | sign changes by u²>0; χ decreases by 1 under real blow-up | Signs are intrinsic; a blow-up changes the parity used by the branch argument. |
| §§6.5–6.7 prescribed section | h₁ with divisor H−R; source choice H+R | order_R(h₁r)=−1+1=0; source choice gives 1+1=2 | Simple pole, not zero, avoids an unwanted R component. |
| §6.8 real double cover | branch b<0,b>0,b=0 | real fibre counts 0,2,1 | Chosen negative region is avoided; a branch point joins the two real sheets. |
| §6.9 Green criterion | vanishing space 0; constant nonzero summand | map 0→0 is onto; constant derivative 0 cannot cover a nonzero H⁰² target | Apply the criterion to the vanishing variation and actual surjectivity. |
| §6.10 projected curve | conic p_*λ=2h | p_*(λ−p*h)=2h−2h=0; derivative subtracts 0 | Repair of old R07 verified. |
| §6.10 integral lattice | ℙ¹×ℙ¹→ℙ² | kernel ℤ(1,−1); complement (0,1) determinant 1; preferred constant complement (1,1) determinant −2 | Replace the Check as R03. |
| §6.11 pair stratification | node model and moving transverse crossing | at singular node four real dimensions resolve to a fixed exceptional curve; crossing points move in a finite étale degree-constant family | Strata have fibre dimensions 2,0,4 as appropriate; none introduces a critical base value after shrinking. Control-data existence remains the declared gap. |
| **§6.12 chosen Kummer transport** | R=∅, α=α̃=0, β=c₁O(1,0) | β mod 2=(1,0)≠0; normalized β−c₁O(1,0)=0 transports to 0 | Empty ramification simplifies pair transport but does not normalize the lift. |
| **§6.13 splitting/avoidance** | l even, square auxiliary N; mixed a₀ | cl_R M=l cl_R A+cl_R N=0; a₀cl_R M=0 on both components; negative b gives 0 real points over Ψ | Full constructed-cover theorem is no longer restricted to constant evaluation. |
| §§7.1–7.3 induction | n=2,4,6 and odd 3 | half-class evaluation on Θ is 1,0,1; restricted period 1,2,3 after killing half; odd case ind=3 | Parity and corestriction exact-period argument agree; n/2 not used for odd n. |
| **§7.4 no real points** | K=ℂ(x,y) as ℝ-extension, quaternion (x,y) | trdeg_ℝ K=2; −1=i²; per=ind=2 | Nonreal headline is genuinely attained by a nonsplit algebra. |
| §§7.5–7.6 real closures/points | Hamilton class; quaternion (x²+1,y) over ℝ(x,y) | Hamilton evaluates 1 and stays nonzero; x²+1 is positive/square in every real closure, so second class restricts to 0 and has per=ind=2 | Distinguishes real-vanishing from trivial class and the Hamilton negative control. |
| **§7.7 sufficient criterion** | n=2 and [α̃]₁=cl_R N on Θ; n=4; n=3 | corrected component [α̃−κN]₁=0; n/2 mod 2 is 1,0; odd index is 3 | Half-class multiplication and correction commute; criterion does not require α̃ itself to be fixed arbitrarily. |
| §§7.8–7.9 bound and lower example | regular parameters corrected at residue i | derivative matrix is diagonal 2(1+i), determinant 8i≠0; signatures of the four coefficients have two plus and two minus signs | Parameters really are independent; signature 0. Iterated residue forms end in nonzero unary forms, giving anisotropy. |
| **§7.10 u=4** | constructed rank-4 form; zero-signature rank 5; positive rank 5 | lower dimension 4; upper forces every qualifying dimension>4 isotropic; positive form has signature 5 and is excluded | u=4, not unrestricted u of the real field. |
| §7.11 nonreal isotropy | ℂ(x,y), H⊥⟨1,1,1⟩ | value at (1,1,0,0,0) is 0; rank 5≥5 | No nondegeneracy assumption is needed: degenerate forms are already isotropic. |
| §§7.12–7.13 del Pezzo/pair of quadrics | smooth (2,2) intersection in ℙ⁴; q₁=x₁²,q₂=x₂² on K⁵ | anticanonical degree 2·2=4; e₃ gives q₁=q₂=0 with e₃≠0 | Pair headline quantifies all quadratic forms; geometry uses smooth intersection separately. |
| §8.1 finite-flat open | contracted curve over one point | remove its image (codimension 2); remaining degree stays n | No use of V or branch multiplicities before their definition. |
| **§8.2 alternating cover** | transposition, 3-cycle, two disjoint transpositions | ramification multiplicities m=1,2,2; signs −1,+1,+1; n−#fibre has same parities | Odd branch multiplicity produces alternating ramification. For even n, odd fibre size forces a real point. |
| §§8.3–8.4 sign of lift | n=4, ψ on one sheet with sign convention | ψ(1,0,0,0)=(−3,1,1,1); −ψ=(3,−1,−1,−1) reduces constantly to 3, not 1 | b=p*η−ψζ has the correct reduction; trace of ψ is 0. |
| §§8.5–8.6 circle extension | n=2,4; trivial versus nontrivial monodromy | stalks ℤ/4 and 𝔽₂²; order of lift of 1 is 4 versus 2; loop class 0 versus 1 | The two parity cases cannot be treated as the same split extension. |
| **§8.7 correcting line bundle** | branch m=1,2,4 | m≢0 mod 4 includes 1 and 2, excludes 4; cl_Rθ=e₁+Σ cl_R D_i | On Θ the odd branches are absent; the remaining m=2 contributions give the circle correction. |
| §§8.8–8.10 obstruction/dichotomy | torsion-free Picard cokernel, nδ=clφ; period 2 | n[δ]=0 forces [δ]=0; possible indices 2,4 | The torsion-free statement is a declared supplier contract; even-degree obstruction gives the necessary half. |
| §§9.1–9.4 Enriques invariants | canonical class and complex Enriques Brauer group | order K=2, h¹O=h²O=0, Br(E)=ℤ/2; real Br annihilated by 4 | Integral 2-torsion is retained, not lost by rational comparison. |
| §§9.5–9.8 halves and parity | empty real locus; orientable component; two odd-Euler components | w₁=0 in first two cases; χ parity of two ℝℙ² is 1+1=0; cl_R K=w₁ gives pairing w₁²=0 | The source's “odd total number” branch is impossible, not a new family to construct. |
| **§9.9 one nonempty half** | two odd-Euler components with correction on the component outside Θ | original pairing 1; adding w₁ on that component changes it by 1, giving 0; restriction on Θ unchanged | Exactly the correction used by the sufficient criterion. If pairing initially 0, no correction. |
| §9.10 Enriques classification | both halves nonempty/nonorientable versus one half | obstruction possible in first case; one-half case reduces all period-2 classes to index 2 and period-4 classes to index 4 | Both directions checked against the corrected parity argument. |
| §9.11 Puiseux order | t>0 infinitesimal; −t | t has square roots ±t^(1/2); −t<0 has none; t<r for every positive real r | Field is real closed and non-Archimedean; not interchangeable with ℝ in the surface theorem. |
| §§9.12–9.15 Puiseux counterexample | sextic double plane, its four spherical components, quadrant signs | K=O(−3+3)=O; four components give H¹=0; period 2 and no quaternion representative imply index 4 by bound≤4 | Shows why the real-number hypothesis of the topological criterion cannot be dropped. |
| Ownership/order findings | C_i targets in two heads; Layers 4 and 5 | two owners versus required one; zero edges in either direction between branches | R04 and R05 remain. |

### Seeded source sample and source manifest

All fifteen requested locators were compared with the available text at their stated locations. “Supports” below includes the explicit correction indicated; it does not certify an unavailable primary source. There are 23 distinct works in sources.toml: 10 certified cached texts and 13 settled uncertified works. No source was fetched, renamed, removed or rewritten, and there is no new missing-source request. No additional locator is labelled unverified apart from the settled locator-only works. All cited reference keys are present in the manifest. Published/preprint page conventions are identified in References; B19 uses published pages 63–110.

| Sample | Text read and locator | Outcome |
|---|---|---|
| 0.4 signature | EKM lines 7222–7272, §33, printed pp.133–134; remaining stated range pp.133–137 | Ordered signature and total signature agree. Harrison sign convention differs only by a↦−a as computed above. Native algebraic laws correctly imported. |
| 0.5 clopen survival | B19 lines 1308–1318, proof of Theorem 0.12, pp.95–96 | Trace-form sign characterization supports the clopen argument. Arason's Proposition 2.3 itself remains locator-only. The transcendental restriction correction is necessary. |
| 2.2 weight-two variation | BEN18 lines 116–219, §§1.1–1.2, preprint pp.3–5, especially 171–197 | Smooth projective family, H² variation, anti-linear real action, twist and infinitesimal map match. Abstract variation carrier is separately imported. |
| 2.5 Voisin cone | B19 lines 291–314, Theorem 1.5, pp.70–71; VOI06 lines 724–742 and 773–788, Propositions 8–9, preprint pp.19–21 | Nonempty open cone in the vanishing cohomology and sufficiently large degree retained. H²K<0 checked for the supplied threefold. |
| 4.2 unramified pullback | B19 lines 667–704, Proposition 4.2, pp.79–80 | Residue argument supports componentwise extension. Contracted crossing fibres must also be considered. Connectedness is not assumed here: R02. |
| 4.4 avoided-set boundary | B19 lines 748–875, proof of Proposition 4.4, especially (4.8), p.84 | Displayed component formula retains a₀; the following simplification drops it. Package corrects the formula but the subsequent fixed-cover theorem is conditional: R01. |
| 5.5 normal-bundle bound | B19 lines 972–988, Lemma 5.3, pp.87–88 | Exact normal sequence and auxiliary vanishings give h¹N≤h²O. No missing positivity hypothesis relative to Assumptions 5.1–5.2. |
| 6.12 Kummer transport | B19 lines 1253–1283, proof of Proposition 6.6, pp.94–95 | Source does not supply the required pair-preserving normalization step; package names it and the control-data supplier gap. The zero-lift test above distinguishes ordinary transport from the needed statement. |
| 6.13 degree-two splitting | B19 lines 1198–1283, Proposition 6.6, pp.93–95; auxiliary choice lines 1052–1058 | Proposition's full Ξ/Ψ hypotheses retained. Taking the ample auxiliary bundle square is compatible with the arbitrary sufficiently positive choice and proves the constructed-cover mixed case. |
| 7.4 period=index | B19 Theorem 0.3, p.64, and lines 1286–1304, §6.3, p.95 | Empty real locus removes the topological condition. Odd periods use the separate norm argument; even induction has exact half-period. |
| 7.7 sufficient half | B19 lines 65–69, Theorem 0.5, p.64; lines 1286–1304, p.95 | Kummer lift's first component vanishes on Θ after Picard adjustment. Half-period multiplication accounted for. |
| 7.10 u=4 | B19 lines 138–139 and 1329–1338, Theorem 0.12 and its lower-bound proof, pp.66,96 | Statement supported; parameter step needs the package's correction. Its determinant is 8i, not an assertion based on separate nonproportionality. |
| 8.2 alternating cover | B19 lines 1395–1419, §7.1, pp.96–97 | Sign of inertia equals (−1)^m, yielding the odd-multiplicity branch divisor. Finite-flat open and reduced general branch fibres are retained. |
| 8.7 correcting bundle | B19 lines 1624–1652, Proposition 7.7 and (7.11), pp.102–103 | m mod 4 rule, alternating-cover line and circle comparison match. The preceding lift uses the corrected minus sign. |
| 9.9 one half | B19 lines 1782–1799, proof of Theorem 0.6, p.107; MVH98 lines 500–540, Theorem 4.4, preprint p.12 | Picard image is w₁-perpendicular; the even-total-parity component correction works. The source's odd-total-parity branch contradicts its algebraic w₁ and is impossible. |

### Pinned-library and duplication audit

The library was searched by objects as well as declaration names: orderings and their extension/restriction; real closures; signatures and inertia; Brauer groups, index, splitting and base change; quadratic forms and isotropy; Harrison topology; scheme Brauer/evaluation; equivariant real cohomology; Hodge variation; real Enriques/halves; Puiseux and del Pezzo carriers. The last geometry interfaces needed by the omitted headlines are not present at the pins. Existing ordered-field signature theory is now cited instead of re-planned. Library near-matches were treated as leads and compared at the pin; none proves one of the eight retained headline signatures in one application.

Representative declarations opened, with repository-relative pin paths:

| Pin location | What it actually supplies / distinction checked |
|---|---|
| Mathlib/Algebra/BrauerGroup/Defs.lean:41,100 | CSA carrier and Brauer quotient; no group instance in this file. CSA includes the field-algebra finiteness requirements. |
| Mathlib/Algebra/Order/Ring/Ordering/Defs.lean:40,61,115,287 | Native ordering/preordering predicates and the deprecated older carrier; proper support excludes the indiscriminate cone. |
| Mathlib/LinearAlgebra/QuadraticForm/Signature.lean:65,98,121,133,243 | Inertia, isometry invariance and diagonal counts; finite rank matters. |
| Mathlib/FieldTheory/IsRealClosed/Basic.lean:52,80 | Semireality, square/negative-square dichotomy, odd polynomial root; no chosen ordering in the class. |
| Mathlib/Algebra/Ring/Semireal/Defs.lean:38 | Excludes −1 as a sum of squares, the field-theoretic nonreal convention in the Lean signatures. |
| Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1054,1057 | Anisotropic means Qx=0 implies x=0; its negation gives a nonzero zero. It does not itself assume nondegeneracy. |
| Mathlib/LinearAlgebra/QuadraticForm/TensorProduct.lean:128,132 | Scalar extension and the value on a pure tensor; 2 invertible is retained. |
| Mathlib/LinearAlgebra/QuadraticForm/IsometryEquiv.lean:177; Real.lean:78 | Diagonalization versus real signature normal form; neither is the general surface isotropy theorem. |
| Mathlib/LinearAlgebra/Dimension/Finrank.lean:61 | finrank uses Cardinal.toNat, hence infinite dimension would give 0; explicit finite-dimensional binder repairs the old vacuity. |
| Mathlib/RingTheory/EssentialFiniteness.lean:40; AlgebraicIndependent/Basic.lean:45 | Essentially finite type and cardinal transcendence degree; field signatures use them with trdeg 1 or 2 explicitly. |
| Mathlib/Algebra/QuadraticAlgebra/Defs.lean:44,387 | Rank-two algebra with actual basis; local double-cover polynomial z²=b is a specialization, not new generic rank-two algebra. |
| TauCeti/Algebra/CentralSimple/Index.lean:99,112,180,242,247,255 | Index, matrix invariance, positivity and degree-index splitting field. Algebraically closed *K* gives index 1; that is not de Jong for a surface field over algebraically closed *k*. |
| TauCeti/Algebra/BrauerGroup/Group.lean:139,174; BaseChange.lean:136 | Actual class map, multiplicative commutative group and same-universe scalar extension. |
| TauCeti/Algebra/BrauerGroup/Division.lean:69; Real.lean:102 | Division representatives, and Br(ℝ)≃Multiplicative(ℤ/2); the latter does not claim all real closed fields are literally ℝ. |
| TauCeti/Algebra/CrossedProduct/Comparison.lean:274,317 | Cohomological comparison and uniqueness, not scheme evaluation. |
| TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Signature.lean:52,66,111,140; Witt/Signature.lean:133 | Ordered-field signature, class adapter, hyperbolic value, semiring homomorphism and real-closed rank/signature classification. |
| TauCeti/FieldTheory/RealClosure/Basic.lean:120; Algebra/Order/Ring/Ordering/Map.lean:64; Extension.lean:62 | Algebraic same-universe real closure, restriction of orderings, preordering extension. No transcendental real-closure assertion. |
| TauCeti/LinearAlgebra/QuadraticForm/BaseChange.lean:389 | Isotropy survives scalar extension under its hypotheses; does not prove isotropy from transcendence degree. |

Other cited native carriers (Scheme and its functionField, CliffordAlgebra.even, RatFunc, PowerSeries, HahnSeries, HenselianLocalRing, IsDiscreteValuationRing, maximalIdeal, homogeneous polynomials, height bound, generateFrom, compact products, IsClosed, permutation sign, ENat, tensor products and Metric.ball) resolve at the pins. Their generic existence does not provide the missing geometric headline carriers. The function-field carrier in particular does not make a disconnected scheme integral: R02.

The main-branch shapes of SchemeAndStackFoundations, AlgebraicTopology and the completed RealAlgebraicGeometry were read. The board package index was inspected before ownership conclusions. Searches of main, the listed board packages and the open-head roadmap index locate the only unresolved same-object ownership issue identified here in QuadraticFormInvariantsPartII. The close matches AlgebraicTopologyPartII and MotivesAndAlgebraicCycles own the generic equivariant machinery and are explicitly imported; RealSurfacePeriodIndex owns the surface-specific construction and its applications. The two open revisions of QuadraticFormInvariants do not create a second owner of the Harrison/surface-specific objects.

### Supplier resolution and order

Every Needs line and supplier subsection was read. The citation resolver reports no cross-roadmap citation or roadmap Lean name found nowhere, against main 5fc1aa8 and the open heads. Its notice that it did not inspect Lake pins was not treated as a successful library check; those were read directly as above. The overlap report lists no shared changed roadmap, dropped referenced ID or revision-only ID; its nearest-roadmap leads were inspected. R04 is an object-level overlap that the numbering-only overlap report does not settle.

| Supplier, copy inspected | Resolved sections and witness locations |
|---|---|
| SchemeAndStackFoundations, main | §0.1 :616; §0.9 :1026; §0.17 :1310; §§2.2,2.6,2.11,2.16,2.20,2.22 at :3420,3554,3795,4029,4452,4604; §3.4 :5015; §§4.9,4.11,4.13,4.17 at :5734,5820,5945,6389; §§5.4,5.10 at :7065,7565. Relative Spec, Kummer/Brauer, Picard, resolution tools and surface intersection inputs exist at these locators. |
| ResolutionOfSingularitiesCharacteristicZero, main | §§5.1,6.2,7.8 at :791,893,1150: principalization, SNC and field/projective resolution. |
| AlgebraicModuliForArithmeticGeometry, head #853 | §§1.1,1.4 at :313,706: quotient convention Proj Sym E and ample powers with fixed twists. |
| HeightsRationalPointsAndObstructions, head #1017 | §2.16b :1146 and §2.19a :1202: residues, purity and pullback multiplicity; finite-flat corestriction of degree d. |
| MotivesAndAlgebraicCycles, head #1313 | §0.5b Gersten; §§7.6a,7.6b at :1401,1412; §§7.8,7.10 at :1441,1477. Borel/real components, purity and cycle classes, Lefschetz (1,1), Enriques Picard image. |
| AlgebraicTopologyPartII, head #1694 | Layer 6 :836; §7.4 :908; §§9.2–9.3 :980,1003; §§10.3,10.5 :1080,1116; §§12.1–12.2 :1237,1252; §§14.1–14.3 :1331,1354,1367; §§15.1–15.6 :1403,1426,1447,1461,1474,1487; §§16.1–16.4 :1523,1673,1688,1701. The signs and control-data hypothesis match the package's contracts. |
| AlgebraicTopology, main | Stage 6 is retained by its former-numbering mapping at :879; Layer 6 starts :2136, products §6.2 and Poincaré–Lefschetz §6.4. No drift from the old “Stage” citation. |
| ComplexComparisonPartII, head #848 | §§C5.2,C5.3,C6.2,C6.3 at :3257,3584,4853,4896. Smooth proper complex transport/Hodge and complex finite-coefficient Artin comparison; the real comparison is separately declared as a gap. |
| ShimuraData, head #1038 | §3.1 :355 supplies Variation, not the whole surface-specific real infinitesimal argument. |
| AffineMorseLefschetz, main | A3 at :534 and A5 at :1323: affine topology and integral weak Lefschetz. The ample divisor is used via its projective embedding. |
| QuadraticFormInvariants, main | Layers 0,1,2,4,5 supply field forms, hyperbolic/Witt, quaternions and Brauer invariants. The current main numbering and compatibility mapping were used rather than treating a revision as a supplier. |
| RealAlgebraicGeometry, completed main | Layer 1 :128 and native Tau Ceti real-closure extension; real closed R has algebraically closed R(i). |
| SemisimpleAlgebras, main | Layer 6, the index and maximal-subfield interface; actual native index declarations additionally cited. |
| EnriquesSurfaces, head #1286 | §§1.1,1.3,1.4 at :123,181,205: characteristic-zero invariants, integral Picard comparison and finite-coefficient Brauer term. |
| WeilConjectures, head #1208 | WC.7, Enriques definition and invariants at :1848: smooth proper geometrically connected, numerical K=0 and χ(O)=1, stable under field extension. |
| FormalLaurentPuiseux, main | L4 :195, ramified-level field and characteristic-zero algebraic closedness (root theorem :249); order/real closedness is the new adapter here. |
| StableReduction, main; ModularCurves, main; PurityOfBranchLocus, main | Layer 4 :529 supplies blowups/intersections; 4D :1882, miracle flatness at :1919; §2.3 :371 gives the normal-source/regular-target purity statement. Their finiteness/regularity hypotheses are retained in the relevant applications. |

Locations in this table are in each named roadmap's README.md under TauCetiRoadmap (or Completed for a completed roadmap); numbers identify the inspected text, not line numbers of the package. Open PR numbers identify audit evidence only, not proposed supplier citations in roadmap prose.

The requested dependency command completed successfully. Its complete output was:

```text
depcheck: 236 roadmaps, 2145 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No forbidden supplier is imported. This mechanical success does not detect the competing ownership in R04 or the independent-layer organization in R05.

All three gap slugs occur identically in design/plan.json and the README's Exact supplier contracts:

- real-artin-comparison: finite-type real X, finite G-module coefficients, cup and coefficient-boundary compatible comparison; ComplexComparisonPartII C6.3 currently gives the complex version. It is a precise missing real interface.
- picard-cokernel-torsion-free: smooth real X and the integral equivariant Picard cycle map; MotivesAndAlgebraicCycles §7.8 uses the fact internally but the requested named reusable assertion is absent. It is a minimal extraction contract, explicitly permitted by the brief.
- at2-stratified-pair-transport: invariant compatible control data for the stated proper stratified submersion; AlgebraicTopologyPartII §16.2 still assumes these data. This does not ask it to re-prove the transport theorem already stated there.

No gap has supplier “none”; no gap is an unnamed bundle of unrelated prerequisites. Acceptance after the findings are repaired would remain conditional on these three contracts.

### Lean headline completeness, signatures and padding

Suggested.lean has one real definition and eight sorried theorems, nine actual declarations. The worker's signature summary counts a docstring occurrence as an extra declaration; the actual parsed declarations and the independently elaborated #check output have nine. The native-module form is `module` with a single `public import Mathlib` followed by the three used TauCeti modules for index, Brauer group and base change. There is no sorry'd data, opaque placeholder, set_option, admitted example, lemma command or catalogue of API lemmas.

| README headline | Acceptance statement / reason for omission |
|---|---|
| §2.9 de Jong in characteristic zero | index_eq_orderOf_of_isAlgClosed, line 80. Arbitrary algebraically closed characteristic-zero base k and essentially finite type K/k, trdeg 2. |
| §2.10 real-closed norm bound | index_dvd_two_mul_orderOf_of_isRealClosed, line 89. Arbitrary real closed R, not just ℝ. |
| Theorem 0.3, §7.4 | index_eq_orderOf_of_not_isSemireal, line 101. K/ℝ essentially finite type, trdeg 2, nonreal. |
| Theorem 0.4, §7.6 | index_eq_orderOf_of_forall_isRealClosed, line 111. Birational real-closure vanishing formulation; scheme form and missing Br(U)/evaluation explicitly named in the docstring. |
| Theorem 0.5, §§7.7,8.10 | Named as not statable: scheme Brauer group, real equivariant cohomology, Kummer sequence and real components missing. No free Prop stands in for them. |
| Theorem 0.6, §9.10 | Named as not statable: real Enriques carrier, halves, real w₁ and Br(S). |
| Proposition 0.7, §9.15 | Named as not statable: K3 surface, semialgebraic cohomology over Puiseux field and Br(S). |
| Theorem 0.12 upper bound, §7.8 | not_anisotropic_of_hasZeroTotalSignature, line 122. Trdeg 2 without an unnecessary finite-generation restriction; finite-dimensional V and dimension>4. |
| Theorem 0.12 sharpness, §7.10 | exists_anisotropic_hasZeroTotalSignature, line 132. Fin 4 carrier over essentially finite type K/ℝ, trdeg 2. |
| Theorem 0.10, §7.11 | not_anisotropic_of_not_isSemireal, line 140. Nonreal surface field and arbitrary finite-dimensional quadratic form of rank≥5. |
| Theorem 0.13, §7.13 | exists_common_zero_of_not_isSemireal, line 152. Stronger native pair-of-quadrics statement in dimension≥5 over a nonreal curve field. The geometric del Pezzo formulation and missing carrier are separately named. |

Every package-owned backticked Lean identifier in README corresponds to these declarations. Mathematical expressions in code spans were not misclassified as invented declaration names. No missing statable endpoint or weakened scalar stand-in was found. The one definition is needed by the upper and sharp lower u-bound.

The requested `lake env lean` elaboration was run from the pinned content checkout on the package file. Exit status 0; the only warnings were the eight expected “declaration uses sorry” warnings, at lines 80,89,101,111,122,132,140,152. The individual imported object files were already available; no build or dependency update was needed.

A scratch copy then probed **every** sorried theorem with `simp`, `rfl` and `infer_instance`, using fail_if_success with solve so a partial simplification did not count as a proof. It also printed `#check @name` for all nine declarations. This elaboration returned 0 with the same eight sorry warnings; no probe closed a goal. Reading the pinned candidate lemmas supplies the exact-one-lemma check: algebraically closed-field index 1 requires K itself algebraically closed, scalar-extension isotropy requires prior isotropy, and definitional not_anisotropic merely rephrases the conclusion. None supplies a retained theorem under its hypotheses. No theorem mirrors a README Check or only computes a small/boundary value.

All printed types agree with their README statements. HasZeroTotalSignature explicitly retains finite dimension, invertibility of 2, the field/module structures and its quadratic form. Theorems retain their finite-generation, transcendence-degree, nonreal or real-closure-vanishing assumptions where stated. No hypothesis was silently lost, and no signature changed during this review.

## Not verifiable

Thirteen works are deliberately settled as uncertified and were not fetched again: BCR, ARA75, SPR55, EL73, BRO80, DK96, CTP90, SER06, SCH94, GG73, BRE97, DIM85 and DIK00. Their primary text was unavailable in the supplied legal cache. They remain cited by the manifest's locators. In particular, Arason's clopen-survival proposition, Springer's original valuation proof, the original Elman–Lam theorem, Bröcker's prescribed-sign divisor theorem, Scheiderer's real comparison and the original stratification/control-data texts cannot be certified directly here. The readable B19/BW20/BEN18 and suppliers provide context, not a substitute claim that those original pages were read.

The three supplier gaps have not been implemented or proved by this package, and this review does not purport to close them. The new general realization obligation in R01 is likewise not resolved by checking the conditional algebra. No new missing-reference request is needed. Ownership checks used the supplied open-head tools and indexes; they do not certify unlisted private or unavailable work.

## Source issues

- **Error** in B19 at §3.1, printed p.76 (line 545): the source says the incidence surface is a finite double cover; it should be a proper generically double cover with projective-line fibres over branch crossings; affects a stated result.
- **Gap** in B19 at Lemma 1.4, printed p.70 (lines 281–285): the source says an arbitrary integral Brauer lift reduces to the prescribed Kummer pullback; it should be normalized by a Picard class before the pushforward divisibility argument; affects the proof.
- **Gap** in B19 at Proposition 4.2, printed p.80 (lines 687–704): the source says the remaining contracted curves are exceptional for the resolution; it should be both those exceptional curves and the incidence fibres over R∩D; affects the proof.
- **Gap** in B19 at §4 and Proposition 4.2, printed pp.79–80 (lines 668–687): the source says the allowed cover has a function field; it should be componentwise generic restriction unless connectedness is assumed or proved; affects a stated result.
- **Gap** in B19 at Proposition 4.4 after (4.8), printed p.84 (lines 858–861): the source says the first boundary component equals the covering class; it should be multiplied by the degree-zero Kummer evaluation, with its Picard realization justified; affects the proof.
- **Gap** in B19 at Proposition 4.5, printed pp.84–85: the source says an integral lift differs from a mod-two Kummer pullback by integral classes; it should be compared with the integral trace-quotient lift; affects the proof.
- **Gap** in B19 at Proposition 4.5, printed p.85: the source says vanishing on the avoided set suffices for the pushforward criterion; it should first subtract classes of curves avoiding that set to enter the required pushforward image; affects the proof.
- **Misprint** in B19 at (5.7), printed p.88 (line 1026): the source says the normal-sequence boundary lands in degree zero; it should be degree one; affects nothing.
- **Misprint** in B19 at §3.1, printed p.77 (line 556): the source says v vanishes at the fixed nodes; it should be w, with v nonzero; affects nothing.
- **Gap** in B19 at Proposition 6.6, printed pp.94–95 (lines 1253–1283): the source says replacing the fibre completes the splitting argument; it should normalize and transport the chosen Kummer lift on the complement of ramification; affects the proof.
- **Misprint** in B19 at Proposition 6.7, printed p.95 (line 1286): the source says the half-period condition applies to every period; it should apply only to even period, with odd period handled separately; affects nothing.
- **Gap** in B19 at Theorem 0.12 proof, printed p.95 (lines 1311–1312): the source says the whole field is a union of finite extensions of the field carrying the class; it should first include a transcendence basis in that field; affects the proof.
- **Gap** in B19 at Theorem 0.12 lower-bound proof, printed p.96 (lines 1329–1338): the source says separate nonproportionality conditions make the two constructed functions parameters; it should impose joint differential independence, for example by the corrected residue lift; affects the proof.
- **Misprint** in B19 at Lemma 7.3 and (7.13), printed pp.98,103 (lines 1654–1658): the source says the integral pullback lift uses plus the trace-zero operator; it should use minus, compatible with the quotient map; affects the proof.
- **Misprint** in B19 at Theorem 0.6 proof, printed p.107 (line 1783): the source says the class with zero degree-zero component is unique; it should be the unique nonzero such class; affects nothing.
- **Error** in B19 at Theorem 0.6 proof, printed p.107 (lines 1786–1790): the source says a one-half surface can have odd total Euler parity and nonalgebraic w₁; it should exclude this case because w₁ is algebraic and self-orthogonal; affects the proof.
- **Gap** in EKM at Theorem 97.2 proof, printed p.385 (lines 20229–20233): the source says positive i and degree greater than one permit applying the normic-form lemma; it should first separate algebraically closed fields for every i; affects the proof.
- **Error** in B19 at Lemma 6.4, printed p.92: the source says the auxiliary rational function has simple zeros along R and H; it should have a simple pole along R and simple zero along H; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "3987c9ed17b0247551312100e5b9e147da7b562c", "job": "REV-PKG-RealSurfacePeriodIndex~3", "model": "gpt-6-astra", "worker": "chris-6"} -->
