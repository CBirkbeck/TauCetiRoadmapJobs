# Review of VirtualFundamentalClasses (package, round 2)

**Verdict:** needs changes

Ten findings, eight blocking (five P1 and three P2). The prescribed Lean elaboration succeeds without diagnostics; the dependency check reports no problems. Neither check establishes the README's mathematics. No author file was changed. The previous ownership decision requiring human action is not re-raised.

## Previous findings and their repairs

The following audit was performed before the new adversarial pass. Locations below are in `packages/VirtualFundamentalClasses/README.md`. Short quotations are from the repaired package, not from sources.

| Previous id | Status and repaired passage | Verification and remaining issue |
|---|---|---|
| R01 | Repaired, lines 138–169: “Every algebraic space and every algebraic stack in this roadmap is quasi-separated”. | The diagonal condition is explicit. Bℤ is excluded; B(S₃) has finite generic order 6. The module docstring agrees. |
| R02 | Not repaired; settled as not actionable in this package. Lines 122–123: “owned here for every such base” and “consumes 11.2–11.6”. | The repair report's reason is valid: selecting between the two new core roadmaps changes their scopes and merge order. PR #1996 still owns the same core; the stable-map specialisation at #1998 remains relevant. This is recorded below, not counted again. |
| R03 | Repaired, lines 473–479: “when its source … is a scheme”. | Base change of id on a point to B(C₂) has source B(C₂), with automorphism order 2, not a scheme. The revised claim excludes calling it a proper scheme cover. The dominating-component argument and §5.1 were also repaired. |
| R04 | Repaired, lines 164–169: “char k ≠ 2”. | The standing condition covers all μ₂ sign examples. In characteristic 2 the μ₂ tangent space has dimension 1; constant C₂ still has tangent dimension 0. |
| R05 | Repaired, lines 706–711: “W_{−1}(BG) = k^×”. | Over ℚ, 2 is nonidentity in this group, but its boundary is 0 in Z₋₁=0. |
| R06 | Partly repaired, lines 1391–1398: “the truncation τ^{≥−1}E admits … a representative”. | O[2] now correctly truncates to 0. The newly supplied resolution argument still assumes too much about untruncated E; new R02 below. |
| R07 | Partly repaired, lines 1427–1435: “cohomology only in degrees 0 and 1”. | The faithful correspondence is correctly restricted and O-linear. Its repaired application in §9.3 incorrectly identifies a truncation with an untruncated derived dual; new R03. |
| R08 | Partly repaired, lines 1598–1604: “τ^{≥−1}(u^*τ^{≥−1}L_{M/𝔐})”. | The extra truncation removes the computed H⁻² counterexample. The revised compatibility datum in §10.7 no longer assumes the old triangle. Derived/ordinary pullback is still conflated, and the source attribution is wrong; new R08 and R09. |
| R09 | Repaired, lines 2265–2283: “L ∈ D_QCoh” and “K ∈ D^+_QCoh”. | These are the domains supplied by SchemeAndStackFoundations §2.19. On ℙ¹, both duality expressions give k in degree 0. |
| R10 | Repaired, lines 2327–2330: “Ext^i_T(g^*E, J)”. | Constant maps ℙ¹→𝔸¹ give k=k in degree 0 and 0=0 in degree 1; no extra shift remains. |
| R11 | Repaired, lines 2191–2200: “m + r = 0”. | M=B,E=0 gives fibre count 1. ℙ¹×B with the ordinary smooth obstruction theory has fibre dimension 1 and is excluded. |
| R12 | Repaired, lines 2039–2042: “For s > 0” and “for s = 0 … [Spec k]”. | At ranks 0,1,2 the classes/degrees are 1,0,0. The separate disconnected-rank defect is new R05. |
| R13 | Repaired, lines 2359–2365: “O_{ℙ¹} ⊕ k_p”. | Every negative twist has the skyscraper section k. The ordinary plane double line has no such negative-twist section. |
| R14 | Partly repaired, lines 394–414: “isFiniteLocallyFreeOfRank”, “relativeSpecHomIso”, “linearSpecPullbackIso”. | All four originally cited invented names were corrected or replaced by prose. Searching for the same pattern finds three further pin namespace errors and three stale supplier Check names; new R04. |
| R15 | Repaired, lines 858–863 and 2209–2215: “unit” and “degree −1”. | Exterior product with the point has coefficient 1, the empty factor gives 0, and the dual-sensitive virtual count is −1 rather than +1. |

## R01 (P1) — Smooth contraction does not imply a degree-one cone

**Location:** `packages/VirtualFundamentalClasses/README.md:1315–1318`: “C is an E-cone iff D is a cone”. The hypotheses are only a smooth surjective equivariant morphism of algebraic spaces with sections and 𝔸¹-actions.

**Claim:** The fibre over the vertex automatically has the vector-bundle and linear-action structure needed for the conclusion.

**Witness:** Over ℚ take D=X=Spec ℚ and C=𝔸¹ with λ·x=λ²x. The structural map is smooth and surjective. Its grading has S₁=0, S₂=ℚx≠0, so it is not generated in degree one.

**Repair:** Do not retain Proposition 1.4 with these hypotheses. State the recognition/descent result with a supplied vector bundle E, its scalar-compatible additive action, and an E-torsor C→D with equivariant local identifications with E×D. Make the local splitting in the exact-sequence definition explicit. Prove descent of the cone structure in that setting; retain Lemma 1.3 for morphisms already known to be cones. Add the weight-two example as a negative Check. It is excluded because scalar compatibility would require 2·1=2 rather than 4; the split weight-one model E×D satisfies the repaired assumptions. The cached source has the same error: behrend-fantechi1997 line 323, Proposition 1.4, p.10.

## R02 (P1) — Condition (⋆) does not resolve arbitrary lower sheaves by free modules

**Location:** `packages/VirtualFundamentalClasses/README.md:1393–1394`: “E has a resolution … by free modules”.

**Claim:** Coherence of H⁰ and H⁻¹ alone supplies an étale-local free resolution of the entire derived object E.

**Witness:** On X=𝔸¹_ℚ, let j:D(t)→X and E=(j_!O)[2]. Then H⁰=H⁻¹=0, but H⁻² has zero stalk at 0 and nonzero generic stalk; it is not quasi-coherent near 0.

**Repair:** First replace E by τ≥−1 E, then construct a free resolution of that bounded coherent truncation. Do not claim a free resolution of E or strengthen (⋆) to discard its intended generality. A complex of free modules has quasi-coherent cohomology, so it cannot represent this E near 0: localisation of a zero stalk at 0 would give zero generic stalk. The repaired construction gives the zero complex for this example, as required. Include it alongside O[2], which tests degrees but not the quasi-coherence defect. The same unjustified reduction occurs in behrend-fantechi1997 line 679; truncating first repairs the proof.

## R03 (P1) — The obstruction-theory route drops higher cohomology of a derived dual

**Location:** `packages/VirtualFundamentalClasses/README.md:1892–1894`: “τ_{[0,1]}((J[1])^∨) = J^∨[−1]”. Here §7.3 explicitly defines ∨ as derived dual after derived extension to the big fppf site.

**Claim:** The right side is always concentrated in degrees 0 and 1, permitting the repaired faithful correspondence of §7.4.

**Witness:** Let A=ℚ[t], J=A/(t), and T̄=Spec(A⊕J). The resolution [A --t→ A] gives J^∨=[O --t→ O] in degrees 0,1. Thus H²(J^∨[−1])=O/t≠0; H² of its truncation is 0.

**Repair:** Replace the displayed identification by τ[0,1]((J[1])^∨)=H⁰(J^∨)[−1], retaining the declared meaning of derived dual. Identify the associated sheaf with C(J) through the degree-one functions of Sym J. Supply the comparison from the O-linear isomorphism/torsor description to Ext⁰ and Ext¹ as an explicit proof input, using local resolutions; faithfulness on two-term objects alone does not identify untruncated derived Hom groups. Do not impose local freeness on arbitrary square-zero ideals. For J=A/(t), both corrected sides have H²=0 and H¹=H⁰(J^∨); for J=O, the simpler original expression is valid. Add both controls.

## R04 (P1) — Several cited declarations do not exist at the stated owner

**Location:** `packages/VirtualFundamentalClasses/README.md:291`, `:294`, `:331`, `:746`, `:991`, `:1172`, `:1407`. Examples are “Chow.equivIntOfUnique”, “Chow.pushforward”, and “test_BG_representations”. The contract fixes TauCeti.AlgebraicGeometry as the default namespace.

**Claim:** These are existing pinned or supplier declarations, rather than mathematical descriptions of Checks.

**Witness:** `TauCeti/AlgebraicGeometry/Chow/Basic.lean:324,369` and `Chow/ClosedImmersion.lean:206,211` put both declarations inside ChowGroup. `CartierDivisor/Basic.lean:60,127` puts CartierDivisor inside Scheme. The three named Check declarations are absent at their supplier.

**Repair:** Use `TauCeti.AlgebraicGeometry.Chow.ChowGroup.equivIntOfUnique`, `TauCeti.AlgebraicGeometry.Chow.ChowGroup.pushforward`, and `TauCeti.AlgebraicGeometry.Scheme.CartierDivisor`. Replace the nonexistent `test_BG_representations`, `test_pn_ring`, and `gysin_open_independent_double_cover` by prose references to SchemeAndStackFoundations §§1.22, 5.6, and 5.5 respectively. Their mathematical Checks occur at `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3111–3113`, `:7287`, and `:7194–7197`; they are not declarations. The corrected pin maps send the point generator to 1 and the identity pushforward to itself; the cited Checks retain the sign representation, H²=0 on ℙ¹, and double-cover multiplicity 2. No new declarations are needed. This is the residual pattern requested by the prior R14 audit, not a reopening of a settled finding.

## R05 (P1) — Constant virtual rank does not give constant obstruction rank

**Location:** `packages/VirtualFundamentalClasses/README.md:2027–2029`: “Ob is locally free of rank s = dim M − vd”. The layer assumes constant rank of E, but neither pure dimension of M nor constant relative dimension of M→𝔐.

**Claim:** One integer s gives the top-Chern formula on every component of a smooth M.

**Witness:** Take M=Spec k ⊔ ℙ¹ over k. Use E=0 on the point and [O(1) --0→ Ω] on ℙ¹. Both have rank 0, but Ob has ranks 0 and 1. The virtual class is (1,−1); c₁(Ob)∩[M]=(0,−1).

**Repair:** State the formula on the open-and-closed loci M_d where M→𝔐 has relative dimension d, with s_d=d−r=dim(M_d)−vd. Define the global expression as the sum of c_{s_d}(Ob|M_d)∩[M_d]. Do not narrow the roadmap to connected spaces. The example has a genuine global resolution with both terms of rank one: use [k --id→ k] on the point. The corrected componentwise formula gives (c₀(0)[pt],c₁(O(−1))[ℙ¹])=(1,−1), as required. Add this negative control and clarify the componentwise meaning of c_top in the headline docstring.

## R06 (P2) — Pullback is said to create a global resolution

**Location:** `packages/VirtualFundamentalClasses/README.md:2063–2067`: “a perfect obstruction theory … with a global resolution”. The explicit layer assumptions at lines 1941–1942 supply only perfectness and constant rank.

**Claim:** The stated base-change hypotheses produce a global resolution even when none was supplied for E.

**Witness:** With v=id the conclusion asserts a global resolution of the original arbitrary E. The cited behrend-fantechi1997 Proposition 7.2, line 1684, makes existence of a global resolution of E a hypothesis.

**Repair:** Separate the statements: the pullback is a perfect obstruction theory; if E has a global two-term vector-bundle resolution F, its pullback is such a resolution and the stated virtual-class identity holds. Make that hypothesis explicit wherever §10.4 or §10.8 invokes a class without previously choosing a resolution, or add an unambiguous standing assumption for those statements. The scope boundary at lines 111–112 expressly retains this restriction; it must not become an existence theorem in §10.6. For the identity square with supplied F, the corrected conclusion gives the same F and the identity on its virtual class; without F it makes no new resolution claim.

## R07 (P3) — The homotopy-invariance locator only covers line bundles

**Location:** `packages/VirtualFundamentalClasses/README.md:1112–1113` and `packages/VirtualFundamentalClasses/sources.toml:244`: “Lemma 32.2 (0B74)” is cited for arbitrary rank r.

**Claim:** This locator supplies the rank-r homotopy isomorphism used on a proper scheme cover.

**Witness:** stacks-chow line 2769, Lemma 32.2, pp.58–59 assumes an invertible sheaf. Lemma 36.3, tag 02TY, p.72, lines 3445–3449 gives finite locally free rank r and the shift by r.

**Repair:** Cite Lemma 36.3 (02TY), p.72 in the statement and under the existing manifest key; retain 32.2 only if separately used for a line bundle. At r=2 over a point the intended map is ℤ=A₀(pt)→A₂(𝔸²)=ℤ, 1↦[𝔸²]. Lemma 32.2 cannot instantiate this rank-two object; 36.3 gives precisely that map. No source entry was changed by this review.

## R08 (P2) — Derived pullback is used where a sheaf pullback is required

**Location:** `packages/VirtualFundamentalClasses/README.md:1576`, `:1592`, `:1610–1611`: “In this subsection u^* is derived pullback” followed by a “sequence of sheaves” containing u^*Ω.

**Claim:** The declared derived pullback of Ω is a degree-zero sheaf, including for nonflat u.

**Witness:** Let A=ℚ[ε]/ε² and u:Spec ℚ→Spec A. Then Ω_{A/ℚ}=ℚ dε and H⁻ⁿ(ℚ⊗ᴸ_A Ω)=ℚ for every n≥0. Ordinary pullback is just ℚ in degree zero.

**Repair:** Write Lu^* on derived objects and u^*_{mod}Ω=H⁰(Lu^*Ω) in the base-change assertion and low-degree transitivity sequence. Carry this distinction through the subsection's Hom descriptions. In this example the corrected sequence is k→0→k→k→0→0→0, with the middle k→k an isomorphism; its terms are sheaves. It does not insert the complex with nonzero cohomology in every negative degree as one of those sheaves. Add this nonflat test, which the new truncation counterexample does not replace.

## R09 (P3) — A valid full cotangent triangle is misreported as a source error

**Location:** `packages/VirtualFundamentalClasses/README.md:1617–1619`: “although behrend-fantechi1997 asserts one for local complete intersections”. In context “one” is a triangle of the three truncated objects.

**Claim:** The cited source asserts the invalid truncated triangle corrected in this package.

**Witness:** behrend-fantechi1997 lines 899–901 defines L as the cotangent complex, not its truncation. Lines 1045–1047, Proposition 3.14, p.31, use the full cotangent transitivity triangle and the lci amplitude of L_{X/Y}.

**Repair:** Say that the cited source uses the full cotangent triangle, which cannot be replaced wholesale by the three truncations here. Keep the package's truncation counterexample and its corrected low-degree result. For A=k[x,y,z]/(xy,xz,yz), t=x+y+z, the full triangle retains the nonzero Tor contribution; replacing its terms by the stated truncations loses it. This repairs the attribution without weakening that counterexample. Do not add this alleged error to the source errata register.

## R10 (P2) — The general small étale site needs its existing elliptic specialisation acknowledged

**Location:** `packages/VirtualFundamentalClasses/README.md:55–57`, `:72–74`, `:1370–1380`: “the small étale site of a Deligne–Mumford stack” is owned here and compared only with the algebraic-space supplier.

**Claim:** There is no pre-existing stack-site construction requiring an ownership/comparison boundary for this retained generalisation.

**Witness:** On main, `TauCetiRoadmap/EllipticCohomology/README.md:207–216`, Layer 1 E1, already owns the small étale sites of the elliptic DM stacks, their sheaf/module categories, atlas comparison and cohomology.

**Repair:** Cite EllipticCohomology Layer 1 E1 in Scope and the supplier contracts. State that §7.3 extends that specialisation to arbitrary DM stacks and agrees with/reuses its site and module categories on the elliptic stacks; leave the elliptic cohomology/duality targets there. This needs no upward edge: the owner is on main. On an étale chart containing the elliptic curve y²=x³−x over ℚ, id and [−1] of the family remain distinct arrows in both descriptions; passing to j-values identifies them. No second elliptic carrier should be planned. This is a distinct main-branch ownership omission, not the settled choice between the two open virtual-class cores.

## Verified sound

All four package files, the previous review and repair report, the board-package index, supplied citation/overlap leads, and all 53 numbered README targets were read. The 15 seeded source targets were checked afresh. All changed passages and their uses were reconsidered; unchanged targets were covered by the first review's computed rows, not its prose assertions. The table below records the fresh sample, headlines, changed patterns and each mathematical finding. For unchanged §§1.3–1.5, 2.1–2.4, 3.1–3.4, 4.2–4.5, 5.3, 7.2, 7.5, 8.1–8.2 and 9.4, the explicit computed rows in the preceding review remain applicable. They are not treated as proofs of statements beyond their tested instances.

The two reviews together distinguish representable from arbitrary proper pushforward, integral from rational Chow groups, coarse from stack multiplicities, arbitrary characteristic from the μ₂ example's restriction, and a full cotangent complex from its naive truncation. No restriction to good primes, executable algorithm, source-order instruction, copied source passage, sorry'd data, `set_option`, forbidden supplier input, or process residue requiring a separate repair was found. The layer order is forced by its dependencies: cycles precede operations, Gysin precedes homotopy/Chern theory, cone stacks precede intrinsic cones and obstruction theories, and virtual classes precede the map-space application. The return to the consequence in §4.4 is separated from its construction and is not a construction cycle.

The 11 layers have dependency paragraphs and Examples. Definition-bearing targets have prose APIs and at least three Check bullets, including the repaired §§3.5 and 10.8. The theorem-only targets with two bullets are not definitions missing a third Check. The house shape was compared with the main SchemeAndStackFoundations, DerivedModuleAlgebra and AlgebraicVectorBundles roadmaps. Metadata is consistent with the algebraic-geometric scope. No supplier gaps are declared in the plan or package.

### Computed adversarial table

In this table k can be ℚ unless a characteristic is specified. “Pass” records the listed computations, not an assertion that a future formal proof has been checked. References R01–R10 are this round's findings.

| Statement | Instances and computed values on the relevant sides | Result / change |
|---|---|---|
| Conventions; finite inertia; proper covers | Bℤ: diagonal fibre has infinitely many components; B(S₃): 6. Base change of pt→pt along B(C₂)→pt has automorphism order 2 rather than 1. | Repaired hypotheses distinguish both pairs. |
| 1.2 closed/integral substacks | In k[x]/x², reduction has length 1 versus original length 2. Under x↦−x, (x) is invariant but (x−1) is not: its translate is (x+1) in char≠2. Empty closed substack contributes 0. | Pass; integral means reduced and irreducible. |
| 2.2 principal divisors | On the sign quotient ord₀(x²)=2; coarse coordinate y has order 1. On BG over ℚ, W₋₁=ℚ× contains 2, while ∂(2)=0 in Z₋₁=0. On ℙ¹, div(t)=[0]−[∞] has degree 1−1=0. | Pass; previous R05 repaired, direction/sign retained. |
| 3.5 exterior product | Separable quadratic K gives K⊗K=K×K and degree 2+2=4. Purely inseparable degree p gives length p over K and degree p². Point factor coefficient 1; empty factor 0. | Pass, including inseparability and repaired third Check. |
| 4.1 cones and duals | C(0)=base, C(k)=𝔸¹; C(O(1))=Tot(O(−1)). Zero-section self-intersection −1 versus wrong dual +1. Node xy=0 has dimension 1; its abelian hull has dimension 2. | Pass. |
| 5.1 homotopy invariance | A₀(pt)=ℤ→A₂(𝔸²)=ℤ sends 1 to [𝔸²]. Rank 0 is identity. O(−1)/ℙ¹ gives s!s*[ℙ¹]=−[pt], not +[pt]. | Mathematics passes; locator R07. |
| 5.2 Chern classes | c₀(0)=1; c(Oⁿ)=1; c₁(L⊕L∨)=a−a=0 and c₂=−a². On ℙ² with a=h, degree c₂=−1. For BG, A₋ᵢ(BG)ℚ=0 for i>0. | Pass; does not identify torsion integral classes with rational ones. |
| 6.1 coarse-space headline | B(C₂), B(S₃), B(Q₈): forward coefficients 1/2,1/6,1/8; inverse coefficients 2,6,8; composites 1. Sign affine line degree-zero comparison is 0→0 rationally, but ℤ/2→0 integrally. | Pass; rationality essential. |
| 6.2 equivariant headline | For μₙ, ℤ[t]/(nt)⊗ℚ=ℚ. For Gₘ on 𝔸² minus 0, A₂^G=ℤ=A₁(ℙ¹), whereas A₂(ℙ¹)=0. For [Gₘ/Gₘ]=pt, A₀^G(Gₘ)=0 but A₀(pt)=ℤ; A₁^G(Gₘ)=ℤ=A₀(pt). | Package passes; shift i−dim G is essential. The adjacent source Proposition 9 omits it. |
| 6.3 degree headline | [Spec ℂ/C₄] over ℝ gives residue/inertia 1/2, agreeing with cover degree 2/4. On sign ℙ¹, div(x²/(x²−1)) gives 2·(1/2)−1=0. A degree-p inseparable field has degree p, not 1. | Pass, including nonneutral and inseparable cases. |
| 7.1 exact cones | Split ranks 1→2→1 dualise to dimensions 1→2→1 in reverse sheaf order. α_p has tᵖ=0 and is not Sym(k). Weight-two 𝔸¹ has S₁=0, S₂=k; scalar 2 sends 1 to 4 rather than 2. | Existing split Checks pass; recognition theorem fails, R01. |
| 7.3 truncation and free resolution | O[2] has H⁻²=k, while τ≥−1=0. For j_!O[2], H⁻² at a geometric origin is 0 but at a geometric generic point is k(t)^sep; a quasi-coherent free-resolution cohomology cannot have this pair. | Original degree repair passes; new route fails, R02. |
| 7.3 ownership variant | The j=1728 elliptic object has the two arrows id and [−1] in both small-stack-site constructions; its coarse j-point has only the identity. | Agreement needs attribution/comparison, R10. |
| 7.4 faithful correspondence | End(k[2])=k but its h¹/h⁰ has one induced endomorphism. For k[−1], linear endomorphisms of the associated additive line are k. [k --id→ k] gives pt; zero differential gives 𝔸¹×B𝔾ₐ. | Two-term repair passes; its §9.3 use is separately tested below. |
| 8.2 cotangent models | For dual numbers, (length H⁻¹,length H⁰)=(1,1) in char≠2, (2,2) in char 2. For I=(x,y)², lengths are 7−3=4 and 6−3=3. | Pass; preserves nonreduced and characteristic-two information. |
| 8.3 repaired base change | A=k[x,y,z]/(xy,xz,yz), t=x+y+z. c=xyz mod I² is nonzero since degree 3<4; dc=tc=0. Derived pullback H⁻² contains kc≠0; truncated target H⁻²=0. Applying τ≥−1 makes both H⁻² zero. | Extra truncation repairs old counterexample. Full triangle remains valid; R09 corrects its attribution. |
| 8.3 sheaf transitivity | A=k[ε]/ε², Ω=k; k⊗ᴸ_A k has H⁻ⁿ=k for every n≥0. Ordinary pullback has only H⁰=k. Correct sheaf sequence k→0→k→k→0→0→0 has connecting map id. | Literal declared notation fails, R08. |
| 8.4 normal sheaf | pt→Spec k[ε]/ε² has truncated L=k[1], N=𝔸¹, C=Spec k[t]/t². Perfect truncated L does not make this morphism lci. | Pass; the roadmap explicitly retains this negative control. |
| 8.5 intrinsic-cone headline | Smooth n-fold: dim BT=n−n=0. pt→BGₘ gives dim B𝔾ₐ=−1=dim BGₘ. I=x(x,y) is of linear type, so C=N, but depth at origin 0<dim 1. | Dimension examples pass; vector-bundle criterion is stronger than C=N. |
| 9.1–9.3 obstruction headline | In char 2, lift x from k[x]/x² to k[x]/x³: (x+ax²)²=x²≠0. φ=(0,id) kills the obstruction despite no lift; h⁻¹(φ) is not surjective. Smooth case is id on BT. | Exact hypotheses of equivalence distinguish false candidate. |
| 9.3 repaired proof route | J=k[t]/t in a split square-zero extension: H²(J∨[−1])=O/t≠0; H²(τ[0,1]((J[1])∨))=0. For J=O, both H²=0. | New application fails, R03; no local-freeness restriction on J is justified. |
| 10.1–10.3 virtual-class headline | Add acyclic [G --id→ G] of rank g: both ranks increase by g, r unchanged; C becomes C×G∨ and 0! returns the same class. E=[O(1)→Ω] on ℙ¹ has r=0 and degree −1 in both resolutions. | Pass, conditional on supplied global resolutions. |
| 10.1 comparison morphisms | E=[O(−4)→Ω] on ℙ¹: Ext¹(Ω,O(−4))=H¹(O(−2))=k, but chain homotopies use H⁰(O(−2))=0. Derived automorphisms 1+ξ exist beyond chain maps. | The fibre-product comparison avoids the false global-chain-map assumption. |
| 10.4 rank-zero repair | pt with obstruction ranks 0,1,2 gives c₀=1, c₁(O)=0, c₂(O²)=0; classes 1,0,0. ℙ¹ with O(a) gives degree −a. | Previous R12 repaired. |
| 10.4 disconnected headline | pt ⊔ ℙ¹ with r=vd=0: local obstruction ranks (0,1), but dim M−vd=1. Correct virtual class (1,−1); fixed c₁ formula (0,−1). | R05; componentwise formula restores (1,−1). |
| 10.5 products headline | Two ℙ¹ theories of degree −1 have product degree (−1)(−1)=1 and vd=0+0=0. Product with pt,E=0 has unchanged coefficient. | Pass. |
| 10.6 pullback headline | Origin→𝔸¹ with M=𝔸¹×Y gives Gysin [M]=[Y]. Flat identity over dual numbers preserves length 2. Identity pulls a given resolution F to F; it does not provide an initially unspecified F. | Identities pass on their defined domain; hypothesis repair R06. |
| 10.6 reduced singular base | On a nodal reduced base with W=base×𝔸¹, relative tangent rank is 1, while the ambient tangent at the node has dimension 3. | Relative tangent invariance used in the extension is the appropriate one; no smooth-base substitution was made. |
| 10.7 functoriality headline | v(s,t)=st: graph z=st has codimension 1 and Γ![𝔸³]=[𝔸²]. L_v=[O --(t,s)→ O²]; b=id and κ=κ_v give the revised datum. | Pass on this compatibility test; no old truncated triangle is used. |
| 10.7 derived compatibility Check | On ℙ¹×ℙ¹, Ext¹(O(2,0),O(2,−2))=k and the companion H¹(O(−2,0))=k cup to H²(O(−2,−2))=k. The relevant P² factors O(−2), T(−2) are acyclic. | The non-chain-map/extension classes have the indicated nonzero and zero values. |
| 10.8 virtual-count headline | M=B,E=0 gives total [B], fibre count 1. ℙ¹×B with smooth theory has fibre dimension 1 and no A₀ count. The rank-zero ℙ¹ theory has count −1. | Repaired hypotheses and sign Checks pass. |
| 11.1 map-space hypothesis | The isolated datum pt carrying id:ℙ¹→ℙ¹ has dim H⁰(E)=3, while dim H⁰(L_pt)=0. | The infinitesimal moduli assumption excludes unrelated universal maps. |
| 11.2 duality | For ℙ¹ and V=O, RΓO=k and RΓω[1]=k. For O(−1), both sides vanish. A rational nodal component with two attaching branches has deg ω=−2+2=0. | Correct bounded/quasi-coherent domains retained. |
| 11.3 Kodaira–Spencer | Constant maps ℙ¹→𝔸¹ have M=𝔸¹, E=O and E→L_M the identity; for X=pt both are zero. | Direction and shift pass. |
| 11.4 curve-map obstruction headline | For ℙ¹→𝔸¹, Ext⁰_C(O,O)=k=Ext⁰_k(k,k); Ext¹ sides 0=0. For an elliptic constant-map family the corresponding degrees are k=k and k=k. | Corrected same-degree comparison passes. |
| 11.5 global resolutions | On ℙ¹, V=O,L=O(1),N=1: G=O(−1)² and H=O(−2), R¹H=k, R¹G=0; Euler characteristic 1. O_{ℙ¹}⊕k_p has negative-twist H⁰=k; a plane double line has 0. | Positive construction and revised nonreduced negative control pass. |
| 11.6 virtual dimension headline | ℙ², g=0,d=1,n=0: 3+(2−3)=2. Calabi–Yau threefold: (3−3)(1−g)+n=n. Target point: rank χ=0 and vd=dim base. | Pass; no hidden genus or characteristic restriction. |

### Seeded source verification

All locators below refer to the cached version actually read; Behrend–Fantechi page numbers are the arXiv version used by the manifest. Statements are paraphrased. The two settled uncertified texts remain listed under Not verifiable. There was no additional author-marked unverified locator requiring a new source request.

| Sample target | Text and locator opened | Comparison with the package |
|---|---|---|
| 1.2 Closed and integral substacks | stacks-properties lines 798,853,872,1073–1106: §§9.6,9.9,9.11,10.1–10.3, pp.17–23; vistoli1989 lines 232–260, (1.5)–(1.7), pp.617–618. | Closed ideals, reduced structure and irreducibility agree; the sign example has the necessary characteristic restriction. |
| 2.2 Orders/principal divisors | vistoli1989 lines 901–911 and 940–959, (3.2)–(3.3), pp.633–634; stacks-chow-spaces line 667, §13.2, tag 0EQ2, pp.15–16. | Dimension i+1 for rational functions and nonzero-function condition agree. The repaired negative index is correct. |
| 3.5 Exterior products | vistoli1989 lines 1705–1718, p.655; fulton1998 §1.10 is uncertified. | The readable source supplies the stack intersection/exterior-product formalism. The inseparable tensor multiplicity and empty/unit Checks were recomputed. |
| 4.1 Cones | behrend-fantechi1997 lines 181–243, pp.5–7; vistoli1989 lines 470–484, p.623. | Degree-zero base, coherent degree-one part, generation in degree one, and contravariant Sym convention agree. This exposes R01 later. |
| 5.1 Homotopy invariance | vistoli1989 lines 1027–1040, pp.636–637, and 1671–1684, p.654; stacks-chow lines 2769–2782 and 3445–3449. | Proper-cover route agrees; scheme homotopy lemma is mislocated, R07. |
| 5.2 Chern classes | vistoli1989 lines 1570–1593, pp.651–652; stacks-chow §37, p.73 onward; fulton1998 Corollary 6.3 uncertified. | The Vistoli citation is correctly labelled as formalism, not a Chern theorem. Scheme Chern theory and the supplier supply Whitney/additivity; self-intersection signs pass. |
| 6.2 DM quotient stacks | edidin-graham1998 lines 770–801, Propositions 10–11, pp.22–23. | The source's quasi-projective coarse-space proviso is not silently claimed as a stronger cited theorem: the package states its own mixed-space/homotopy argument. Smooth affine group, linearised ample sheaf, DM/separated quotient and dimension shift were checked. |
| 6.3 Degrees | vistoli1989 lines 372–376,428,974–997, (1.17),(3.6)–(3.7), pp.620,622,635–636; stacks-chow line 3936, Definition 41.1, p.81. | Residue degree divided by geometric stabiliser order agrees, including nonneutral zero-dimensional substacks and rational-equivalence invariance. |
| 7.1 Abelian hulls/exact cones | behrend-fantechi1997 lines 237–345, pp.7–10. | Hull and dual exact sequence agree; Proposition 1.4 itself is false with its printed hypotheses, R01. The roadmap correctly reverses the source remark's mistaken cone arrows. |
| 9.3 Characterisations | behrend-fantechi1997 lines 1162–1201, Theorem 4.5, pp.35–36; relative form line 1657, p.49. | The four conditions and arbitrary square-zero ideals agree. The new proof route does not correctly instantiate the restricted Lemma 2.2, R03. |
| 10.5 Products | behrend-fantechi1997 lines 1366–1374 and 1713–1720, Propositions 5.7 and 7.4, pp.41,51. | Direct sum, product of bases, global resolutions and the dimension sum agree. |
| 10.6 Pullback | behrend-fantechi1997 lines 1682–1699, Proposition 7.2, p.50. | The source conditions global resolution on that of E, R06. Its smooth-base version is explicitly distinguished from the package's reduced-base extension, whose relative tangent route was inspected. |
| 11.3 Kodaira–Spencer | behrend-fantechi1997 lines 1583–1599, p.47; behrend1997 lines 148–153, p.5. | Cotangent-arrow direction, trace/duality shift and the induced morphism from the universal map agree. |
| 11.5 Global resolutions | behrend1997 lines 165–186, Proposition 5, p.6. | The ample line bundle and reduced nodal fibres supply the negative-twist vanishing and global two-term construction. The package states the required line bundle rather than pretending every family has one. |
| 11.6 Rank/virtual dimension | behrend1997 lines 99,157–161,193–197, Proposition 2 and pp.5–7; li-tian1998 line 1586, §4.3(1), p.46. | χ(F*TX), base dimension and the (dim X−3)(1−g)+n term agree. |

All 22 cited works have a manifest key: 20 readable cached texts and the two settled uncertified works. No duplicate key, new missing text or source-fetch addition was needed. A manifest locator correction remains R07. Source errors discovered in the readable texts are listed separately below, rather than being silently copied into targets.

### Pinned library and headline audit

There are eight headline groups, explicitly enumerated in the module docstring: coarse comparison (§6.1), equivariant comparison (§6.2), degree (§6.3), intrinsic cone (§8.5), obstruction-theory characterisations (§9.3), construction/independence (§§10.2–10.3), virtual-class properties (§§10.4–10.8), and curve-map obstruction theory/resolutions/rank (§§11.4–11.6). Each needs algebraic/DM stacks and cone stacks absent from the pins; stack Chow groups and the relevant stack-derived operations are also absent. Scheme cycle groups, an algebraic-space predicate and category-valued stacks do not supply those carriers. None is statable merely by a few simple definitions on the existing types. No weakened substitute is warranted.

`Suggested.lean` has exactly one `import Mathlib`, one module docstring, the intended namespace, and zero declarations. Thus the exhaustive one-tactic padding probe has zero theorems to try, and the requested mechanical `#check @name` binder comparison has zero declarations to inspect; no binder changed or escaped inspection. There are no own backticked Lean identifiers promised by the README but missing from the file. The unresolved identifiers in R04 are supplier claims, not invented acceptance-test declarations. The prescribed elaboration was run from the pinned content checkout and exited 0 with no errors or warnings. No TauCeti import required a targeted build.

The following pinned files and declaration bodies were opened, including the native hypotheses. Paths are relative to their respective library repositories.

| Pinned declarations / definitions | File and line evidence; relevant boundary |
|---|---|
| AlgebraicCycle, map/mapCoeff, Scheme.ord | `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44,55,69`; `Mathlib/AlgebraicGeometry/OrderOfVanishing.lean:35,52`. Locally finite support and residue-degree weights; ord has junk value 0 outside its codimension/nonzero domain. |
| SheafOfModules, derived categories | `Mathlib/Algebra/Category/ModuleCat/Sheaf/Abelian.lean:40`; `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:74,87`. Abstract site/module carriers, not a constructed DM site. |
| Naive cotangent and H1 | `Mathlib/RingTheory/Extension/Cotangent/Basic.lean:61,319,324,546`. Presentation differential, toKaehler, exactness and H1; not the full derived cotangent complex of a stack. |
| Jacobi–Zariski maps/exactness | `Mathlib/RingTheory/Kaehler/JacobiZariski.lean:537,544,552,559`; `Mathlib/RingTheory/Kaehler/Basic.lean:781`. Tensor of Ω in degree zero; the farther-left assertion has flatness. |
| Formal smoothness and square-zero lifts | `Mathlib/RingTheory/Smooth/Basic.lean:70,290,370`; `Mathlib/RingTheory/Derivation/ToSquareZero.lean:116`. Projective Ω and zero H1; the lifting equivalence has its algebra tower and specified lift. |
| Scheme étale site; categorical pullbacks; IsStack | `Mathlib/AlgebraicGeometry/Sites/Etale.lean:50`; `Mathlib/CategoryTheory/Limits/Shapes/Pullback/Categorical/Basic.lean:81`; `Mathlib/CategoryTheory/Sites/Descent/IsStack.lean:49`. Last definition is for Cat-valued pseudofunctors and does not impose algebraicity or DM conditions. |
| Scheme cycles/Chow and principal cycle | `TauCeti/AlgebraicGeometry/Chow/Basic.lean:86,257,295,304,369`; `Chow/ClosedImmersion.lean:206,211`; `AlgebraicCycle/Principal.lean:71`. Existing scheme objects are imported, not owned again. Namespace corrections are R04. |
| Relative Spec and its points/base change | `TauCeti/AlgebraicGeometry/RelativeSpec/Graded.lean:93`; `BaseChange.lean:272`; `UniversalProperty.lean:349,455`. CommMon.relativeSpecHomEquiv and relativeSpecHomIso use arbitrary test morphisms. |
| LinearSpec and total space | `TauCeti/AlgebraicGeometry/VectorBundle/LinearScheme.lean:175`; `Geometric.lean:221`; `TotalSpace.lean:130,229`; `LinearScheme/BaseChange.lean:52,99`. LinearSpec is contravariant on arbitrary quasi-coherent modules; totalSpace uses the dual of a finite locally free module. |
| Finite locally free and ranks | `TauCeti/AlgebraicGeometry/VectorBundle/FiniteLocallyFree.lean:80`; `Rank.lean:125`; `FixedRank.lean:52`. Rank is locally constant, not automatically constant on a disconnected base. |
| Big structure sheaf and prestable family | `TauCeti/AlgebraicGeometry/Sites/Big/StructureSheaf.lean:84`; `Curves/Prestable.lean:45,55,60`. The native family is a proper, geometrically connected nodal scheme family, with no genus or projectivity field. |
| Algebraic spaces and scheme pseudofunctors | `TauCeti/AlgebraicGeometry/AlgebraicSpace/Basic.lean:195–201`; `Stack/Basic.lean:37`. The algebraic-space predicate has sheaf/diagonal/atlas fields, no quasi-separatedness condition. A Cat pseudofunctor is not an algebraic-stack carrier. |
| LineBundleClass and CartierDivisor | `TauCeti/AlgebraicGeometry/LineBundle/Class.lean:50`; `CartierDivisor/Basic.lean:60,127`. Skeleton of invertible sheaves and global sections of the rational-unit quotient; the latter is in Scheme, R04. |

Object searches were made in both pinned libraries, not just for the proposed names. They found no intrinsic normal cone, perfect obstruction theory, stack Chow group or virtual-class carrier that would make an omitted headline statable. The ordinary scheme and module objects above are properly supplier material. No fully qualified declaration collision can occur in the empty acceptance file.

### Cross-roadmap resolution, ownership and order

Every Needs line and supplier contract was read against main or, for new open work, its supplied head. The README resolver returned no unresolved roadmap/name lead but explicitly said that external Lean names were not checked because it did not see pinned Lake packages. That limitation is why the manual pin audit above was necessary; its clean summary does not overrule R04.

| Supplier on main | Resolved citations and boundary |
|---|---|
| SchemeAndStackFoundations | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:923` (§0.7); `:2145` (§1.1); `:2422–2437` (§1.10); `:2849–3155` (§§1.18–1.23); `:3554–3584` (§2.6); `:3719–3772` (§§2.9–2.10); `:4265–4452` (§§2.19–2.20); `:4917` (§3.3); `:5305` (§4.1); `:6902–7317` (§§5.1–5.6). Stack foundations, QCoh, right-exact extension to a big site, bounded QCoh duality, degree/curve inputs and scheme intersection theory are present. The three nonexistent Check names are R04. |
| AlgebraicVectorBundles | `TauCetiRoadmap/AlgebraicVectorBundles/README.md:345–374`, mapping L0B, L1A, L2A, L2B; `Suggested.lean:76`, isFiniteLocallyFreeOfRank. The former labels remain resolvable through the map. The package uses the native Tau Ceti rank and linearSpec constructions. |
| DerivedModuleAlgebra | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:43–63`, former-name map; `:1398` (§0.7), `:1463–1474` (§0.8), `:1533` (§0.10), `:1588` (§0.13), `:1761–1785` (§0.25). Full transitivity and Tor-independent base change are affine/ring inputs; §0.25 supplies Ext¹ lifting, not a nonexistent named extensionObstruction. |
| EnhancedDerivedSheaves | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:441` (§0.2), `:534` (E1.2), `:580–636` (E1.4). K-injective/K-flat and tensor/Hom/pull-push machinery for ringed topoi; no implicit full cotangent complex of stacks. |
| StableReduction | `TauCetiRoadmap/StableReduction/README.md:405–500`, Layers 2–3. Proper curve cohomology/base change, duality, relative ample input and prestable families. The global resolution argument names its additional ample line bundle. |
| EquivariantIntersectionTheory | `TauCetiRoadmap/EquivariantIntersectionTheory/README.md:48–74`, conventions; `:378` (§2.1), `:402–435` (§2.2). Dimension/codimension conventions and mixed spaces agree; the quotient comparison shifts dimension grading. |
| EllipticCohomology, missing attribution | `TauCetiRoadmap/EllipticCohomology/README.md:207–216`, Layer 1 E1. Existing elliptic small-site specialisation must be acknowledged, R10. |

The board package index was read before searching ownership. The required `roadmaps grep` and `roadmaps show` tools were used for object searches and head inspection. At PR #1996, `TauCetiRoadmap/VirtualFundamentalClass/README.md:199–205` and Layers 2,4–9 still overlap the core. At PR #1998, `TauCetiRoadmap/GromovWittenTheory/README.md:256–269` owns the stable-map specialisation of the curve-map construction. The first review's R02 is settled for this package as a human scope decision; it is not counted among this round's findings or converted into a reciprocal dependency. The new main-branch issue R10 is narrower and has a direct citation/comparison repair.

The supplied overlaps report and opened heads show no other pull request changing this roadmap, no dropped cited ids and no citation requiring an open revision's numbering. The closest SchemeAndStackFoundations revision scopes were also opened at #1808, #1807, #1854 and #1656: they distinguish scheme Chow operations and foundational stacks from this DM virtual-class construction. Their heads do not replace the supplier's main version. No upward supplier was introduced to settle overlap.

Prescribed dependency-check output:

```text
depcheck: 236 roadmaps, 2133 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. No merge-order file was modified. This graph check cannot validate a source theorem or create the missing declaration names in R04.

## Not verifiable

- `gillet1984` §4 remains uncertified in the manifest. Its text was not available; the relevant cycle/rational-equivalence constructions were checked against Vistoli's readable restatement. It was not requested again.
- `fulton1998` §1.10, Corollary 6.3, Proposition 8.1.1 and Appendix B.6.6 remain uncertified. Their exact wording was not read. The readable Vistoli/Behrend–Fantechi statements, scheme suppliers and explicit computations above provide partial independent checks, not certification of these book locators.
- No formal proof of the README's stack results can be tested at these pins. Suggested.lean intentionally has no declarations because the necessary stack carriers are absent. Successful elaboration therefore certifies the permitted file form, not the mathematical claims refuted above.

## Source issues

- **Misprint** in behrend-fantechi1997 at remark after Definition 1.2, arXiv v1 p.8 (lines 272–276): the source says the sheaf sequence gives the cone sequence with F and F′ interchanged; it should be C(E)→C(F)→C(F′); affects a stated result.
- **Misprint** in behrend-fantechi1997 at proof of Lemma 1.3, arXiv v1 p.8 (lines 286–288): the source gives the degree-one algebra map and exact sequence with S₁ and S′₁ interchanged; it should use 0→S′₁→S₁→E→0; affects the proof.
- **Error** in behrend-fantechi1997 at Proposition 1.4, arXiv v1 p.10 (line 323): the source says a smooth equivariant contraction recognises degree-one cones; it should require the missing linear vector-bundle torsor structure, excluding the weight-two affine line; affects a stated result.
- **Error** in behrend-fantechi1997 at Lemma 2.2, arXiv v1 p.19 (line 635): the source says h¹/h⁰ detects arbitrary derived morphisms; it should restrict faithfulness to the appropriate two-term, module-compatible correspondence; affects a stated result.
- **Gap** in behrend-fantechi1997 at proof of Proposition 2.4, arXiv v1 p.20 (line 679): the source assumes a local free resolution from coherence only in degrees zero and minus one; it should truncate first, then resolve the bounded coherent truncation; affects the proof.
- **Error** in behrend-fantechi1997 at Proposition 3.5, arXiv v1 pp.26–27 (line 889): the source says the rational equivalence is invariant under the whole ambient tangent bundle; it should use the relevant smooth-substack or relative tangent directions; affects a stated result.
- **Error** in behrend-fantechi1997 at Proposition 3.12, arXiv v1 p.30 (line 1010): the source says equality of intrinsic cone and normal sheaf implies local complete intersection; it should require the cone to be a vector bundle stack; affects a stated result.
- **Misprint** in kresch1999b at Theorem 3.1, arXiv v2 pp.10–11 (lines 331–343): the source names the tangent bundle of the arbitrary substack as acting; it should name the smooth substack's tangent bundle, as its proof does on p.12; affects a stated result.
- **Misprint** in behrend-fantechi1997 at proof of Proposition 6.2, arXiv v1 p.48 (line 1609): the source places the base Ext group over O_C; it should place it over O_T with the same Ext degree; affects the proof.
- **Error** in edidin-graham1998 at Proposition 9, cached arXiv version p.22 (lines 745–753): the source identifies dimension-indexed equivariant Chow groups at the same index for two quotient presentations; it should shift the second index from i to i−dim G+dim H; affects a stated result.
