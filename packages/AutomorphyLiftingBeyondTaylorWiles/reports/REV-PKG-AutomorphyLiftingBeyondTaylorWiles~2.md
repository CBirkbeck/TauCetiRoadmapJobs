<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/999#issuecomment-6393346666 -->
Review (codex) of 4eb2eba

Verdict: needs_changes

1. **F01** (P1) The asserted determinant kernel is not the defined subgroup

   **Location:** `packages/AutomorphyLiftingBeyondTaylorWiles/README.md:915`, “Γ^1 := Γ ∩ PSL_2(O_F). Then Φ := Γ/Γ^1 is an elementary abelian 2-group”; also line 919.

   **Claim:** This intersection is normal in every component group merely commensurable with PGL₂(O_F).

   **Witness:** Over ℚ, put h=diag(2,1), Γ=hPSL₂(ℤ)h⁻¹, A=(1,2;0,1), γ=(1,0;1/2,1). Then A∈Γ¹, γ∈Γ, but γAγ⁻¹=(0,2;−1/2,2)∉PSL₂(ℤ). The index is 3.

   Thus the displayed quotient is not even a group. The example is a conjugated arithmetic level; changing the component representative conjugates its arithmetic stabilizer (ArithmeticLocallySymmetricSpaces ALS.0.7). A determinant square-class kernel is an intersection with PSL₂(F), not necessarily with the standard integral lattice stabilizer. CG18 line 4823 contains the same mistaken identification.

   **Exact repair:** Define Γ¹=Γ∩PSL₂(F), the kernel of the determinant square-class map restricted to Γ. Retain the actual component-dependent compact level when describing its integral lattice stabilizers. Prove that its finite quotient is an elementary 2-group, and transport the level correspondences through this kernel. Propagate this definition through §§3.2–3.5. Add the conjugated-level example as a negative Check. On this example the repaired Γ¹ is Γ and Φ=1, so restriction is the identity; the offending index-three intersection is no longer used.

2. **F02** (P2) The all-prime comparison uses only a principal-prime amalgam

   **Location:** `packages/AutomorphyLiftingBeyondTaylorWiles/README.md:937`, “assume x is trivial in the ray class group”; line 939, “the argument is the same with more notation”; contrast the unrestricted Q at line 1038.

   **Claim:** §§3.2–3.4 supply the component and operator comparisons needed by §3.5 for every Taylor–Wiles prime.

   **Witness:** In F=ℚ(√−5), x=(7,3+√−5) has norm 7 and is nonprincipal: a²+5b²=7 has no integer solution. With p=3, N(x)≡1 and p is unramified in F.

   The local Taylor–Wiles conditions do not force this ideal to be principal. For example, distinct roots i,−i in 𝔽₉ have product 1 and squares −1. This is a local admissibility test, not an assertion that a specified global residual representation has been constructed. There is no π_x generating this ideal, so the displayed h, g, repeated vertex group and componentwise operator are unavailable. The sentence at line 939 does not specify the replacement maps, coefficient transports, or their operator action.

   **Exact repair:** State the general component-indexed amalgam and Lyndon comparison as named targets in §§3.2–3.4, using the two actual adjacent lattice stabilizers and the local adelic element at x. Specify the source and target component of each map and transport O(ψ). State the squared-operator action on the resulting sum of components. Derive the principal ray-class formulas as Checks. Keep §3.5 for all auxiliary primes. For the displayed nonprincipal ideal the repaired formulation must use two component stabilizers and no global generator of x; selecting only principal auxiliary primes is not a repair under the general-library contract.

3. **F03** (P1) The cited local deformation conditions do not supply the stated rank-n datum

   **Location:** `packages/AutomorphyLiftingBeyondTaylorWiles/README.md:63`, “§§2.16 and 2.23 for the rank-n Taylor–Wiles block condition and tangent contribution 1”; lines 497, 501 and 523.

   **Claim:** These supplier sections give the fixed-determinant, two-scalar condition for any unramified residual representation with a chosen simple generalized Frobenius line.

   **Witness:** LocalGaloisDeformationRings §2.16 requires semisimplicity; §2.23 requires an unramified complementary block. Frob=diag(4,J₂(3)) over 𝔽₇ has determinant 1 and a simple 4-line. In rank two, inertia diag(1+ε,1−ε) has determinant 1 and one ramified tangent parameter.

   The rank-three datum satisfies the package's local hypothesis but not the supplier's semisimplicity hypothesis. In the rank-two test, p=5 and residue norm 11, §2.23 with fixed unramified determinant forces the selected character to be 1: its ramified parameter count is 0, whereas the two-scalar condition has count 1. The supplier explicitly distinguishes these conditions in `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:2026` and `:2148` (head 11b2c65). Its rank-two twisting comparison changes the determinant and the diamond coordinate; it is not the direct identification used here.

   **Exact repair:** Consume §2.16 for the two-scalar condition in its actual domain, and remove §2.23 as an identification of that condition. Declare a precise LocalGaloisDeformationRings supplier gap for its extension to arbitrary unramified residual Frobenius with a specified simple generalized eigenline, including representability, the inertia character, the fixed-determinant tangent count and augmentation. Put the same slug and exact hypotheses in the plan's top-level gaps and the README contract. The inertia factorization can then use scalar conjugation and ψ^(N(x)−1)=1, with the determinant relation between the two scalars. The repaired condition admits both test data, retains the one tangent parameter, and uses the existing coordinate correction of §1.4. Do not narrow all auxiliary data to semisimple Frobenius.

4. **F04** (P1) The cited tower version of Hochschild–Serre is absent

   **Location:** `packages/AutomorphyLiftingBeyondTaylorWiles/README.md:1064`, “ArithmeticLocallySymmetricSpaces ALS.6.2 and its tower version”; this route is also needed by §3.7.

   **Claim:** ALS.6.2 supplies continuous compact-open cohomology of the smooth infinite level colimit, with the displayed finite-level abutments.

   **Witness:** `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:195` excludes level-system assembly. ALS.6.2, line 4658, treats K/K′ finite. For U=ℤ_p and k trivial, H¹_cts(U,k)=k, whereas H¹(1,k)=0.

   A finite-cover spectral sequence does not by itself state the colimit comparison. The citation resolver recognizes ALS.6.2, but not this extra mathematical assertion. CompletedCohomologyPartII §6.2, line 1584, is the relevant fixed-exponent descent owner; its standing arithmetic tower varies p-level, whereas these towers vary x∤p. Its regular-cover and stabilizer hypotheses must also be transported.

   **Exact repair:** Replace the nonexistent ALS tower citation by the fixed-exponent descent interface of CompletedCohomologyPartII §6.2 and declare its required tame-place extension as a named supplier gap. Specify, for each coefficient exponent b, the smooth colimit over principal x-levels, continuous cohomology of GLₙ(O_x) or its line parahoric, convergence to the actual arithmetic groupoid cohomology, and Hecke/localization compatibility. Include the analogous PGLₙ level system used in §3.7. Keep ALS.6.2 as the finite-cover input. The repaired interface retains H¹_cts(ℤ_p,k)=k in the test and does not replace derived invariants by ordinary invariants. CompletedCohomologyPartII precedes this package in the supplied order.

5. **F05** (P2) The diamond hypothesis is too weak for the simultaneous image algebra

   **Location:** `packages/AutomorphyLiftingBeyondTaylorWiles/README.md:681`, clause (6) on “H^*_ψ(Y_1(Q), O/ϖᵃ)_m”; compare lines 225, 255, 864–868 and 1215–1219.

   **Claim:** This equality on the full cover identifies diamond operators with inertia in the simultaneous Hecke image on every intermediate cover, yielding the O[Δ_Q]-algebra surjection and patching scalar containment.

   **Witness:** In T=k[ε]/ε², ε acts as 0 on M_top=k and nontrivially on M_inter=T, although ε²=0. For a degree-p cover, cor∘res=p=0 over k, so equivariance supplies no injection.

   This tests the claimed inference, not an arithmetic counterexample. The README itself warns at line 255 that a relation on the top cover may give only a nilpotent relation below. Neither B^van nor the declared finiteness contract supplies equality of these operators on every intermediate level. Pullback/trace compatibility in line 868 does not fix this problem.

   **Exact repair:** State clause (6) for every K′ in 𝒦_Q, every cohomological degree and every O/ϖᵃ, using the residual deck action at that level, and require coefficient and level-map compatibility. Extend to finite O-module coefficients by the same natural coefficient construction used in §4.4. Then its equality is an equality in the image algebra by that algebra's definition. Add the displayed square-zero module pair as the negative Check. It fails the strengthened hypothesis, while the intended all-level equality gives the asserted O[Δ_Q]-linearity without killing nilpotents by assumption.

6. **F06** (P2) An unused derived action of the image ring is asserted without factorization

   **Location:** `packages/AutomorphyLiftingBeyondTaylorWiles/README.md:1124`, “T^an_{Q_N,psi,m} acts on D̃_N in the derived category”.

   **Claim:** Lifting the individual Hecke correspondences to the perfect complex gives an action of the quotient defined by their cohomological image.

   **Witness:** Over a DVR O, Ext¹_O(k,k)=k. On C=k[0]⊕k[1], a nonzero off-diagonal Ext¹ endomorphism t has H*(t)=0 and t²=0, but t≠0 in D(O).

   Thus an abstract operator action need not factor through its cohomological image. This diagnostic does not claim that this particular ghost survives every arithmetic coefficient quotient; it identifies the missing factorization theorem. ALS.3.3 supplies the abstract Hecke action, not this image-ring factorization. DeformationAndDerivedPatchingAlgebra §8.6 expressly concludes cohomology actions, and the package's own contract at line 83 makes the same distinction. No factorization theorem is named in §4.1.

   **Exact repair:** Delete this stronger API bullet. Retain the abstract Hecke endomorphisms used to form the projector and the compatible simultaneous-image actions on all cohomology groups and quotient models required by §4.4. These are precisely the inputs consumed by §8.6. On the ghost example the abstract action is retained and the zero cohomological action remains well-defined; no false assertion that t vanishes in the derived category is needed.

7. **F07** (P2) Minimal-level residual modularity gives total support, not lowest-degree support by definition

   **Location:** `packages/AutomorphyLiftingBeyondTaylorWiles/README.md:1381`, “such an m exists by definition (§0.6)”; compare the definition at line 337 and the proof at line 1385.

   **Claim:** Branch (b) alone gives H^q₀(Y,k)_m≠0, the conclusion just stated for branch (a).

   **Witness:** The §0.6 predicate asks for H*(Y,k)_m≠0. A graded module k in degree q₀+1 has total dimension 1 and degree-q₀ dimension 0. CG18 line 3529 asks only for a mod-p class.

   This is a logical countermodel to the asserted definitional implication, not a proposed arithmetic counterexample. The package itself correctly postpones lowest-degree nonvanishing to the amplitude/codimension argument at lines 1217–1223. That argument needs more than residual modularity.

   **Exact repair:** Separate the conclusions: branch (a) gives nonzero degree-q₀ support; branch (b) gives nonzero total residual support and the matching Galois ideal. Cite the §4.4/§5.1 patching argument, with its full hypotheses, when upgrading branch (b) to nonzero lowest-degree support in §5.8. Preserve the torsion-only branch and do not add an initial characteristic-zero eigenclass. The test graded module then satisfies exactly the branch-(b) conclusion and no unsupported degree claim.

8. **F08** (P1) The supplier-less gap remains, and its claimed consumer drops the new hypothesis

   **Location:** `packages/AutomorphyLiftingBeyondTaylorWiles/design/plan.json:3256`, “res-pgl-distinct-eigenvalue-comparison”; `packages/AutomorphyLiftingBeyondTaylorWiles/README.md:1080`, “It supplies the comparison used by the Betti vanishing argument of CGH20 Theorem 3.2”; also lines 803, 815 and 1475.

   **Claim:** The recorded gap is discharged by §3.7 and supplies the cited CGH20 application under that source's assumptions.

   **Witness:** This gap has no supplier, section or needs field and no matching README supplier contract. Section 3.7 now assumes principal-series block conditions at every successive base level; CGH20 line 230 supplies no such hypothesis or derivation.

   The brief expressly treats a supplier-less gap as P1. The earlier review's rationale was that §3.7 owns the object; the repair strengthens that target by an additional hypothesis. That is appropriate for the conditional target but does not establish the original unqualified application. CGH20 also does not explicitly assume the package's added diamond clause (6), contrary to the literal identification in §2.5.

   The repair report's unnumbered maintainer note leaves the stale gap because it interprets edits to the gaps list as unavailable. That reason fails here: the brief explicitly permits changes to the top-level gaps list. This is not a re-raised numbered finding marked not actionable; all F01–F13 were marked applied.

   **Exact repair:** Remove this stale supplier-gap record if §3.7 remains locally owned, retaining the full conditional comparison as that named target. Qualify the consumer statements in §3.7 and Downstream consumers by its block hypothesis, and describe §2.5 as a strengthened version of the CGH20 hypothesis rather than its literal conjunction. Do not advertise recovery of CGH20's unconditional comparison without a named theorem deriving the extra input. This fixes the recorded owner count from zero to the local target and makes the application use all four block conditions when Q has two primes, rather than silently supplying them from distinct roots alone.

9. **F09** (P3) Two Checks and two locators still need correction

   **Locations:** `packages/AutomorphyLiftingBeyondTaylorWiles/README.md:1457`, “dim R_∞ = dim S_∞”; line 1178, “Changing φ^2_N by x_1 ↦ φ^2_N(x_1) + z_1²”; line 457, citation of LocalGaloisDeformationRings §2.26; line 1439, CG18 line 3497 for Theorems 1.2, 1.3 and 5.11.

   **Claim:** These Checks distinguish the framed dimensions and compatible maps, and the cited locations support the adjacent claims.

   **Witness:** Real quadratic F, n=2, |T|=1, q=3 gives dim R∞=7 and dim S∞=4. The final φ_N kills z₁, so adding z₁² changes it by 0. CG18 line 3497 is Theorem 5.16.

   **Exact repair:** At line 1457 use S∞^□, whose dimension is 7 in the test. At line 1178, explicitly assume g,j≥1 and change the *framed presentation surjection* R∞→R^□ before augmentation, not φ_N:R∞→R: x↦x and x↦x+z² differ modulo ϖ before z=0 and agree afterwards. At line 457 cite LocalGaloisDeformationRings §§2.8 and 2.21 for the regular-unipotent minimal condition; §2.26 concerns a trivial residual Steinberg closure. At line 1439 use CG18 line 192 for Theorem 1.2, line 225 for Theorem 1.3, and line 3324 for Theorem 5.11, with printed pages 301–302 and 379 respectively. The existing line 3497 remains appropriate for Theorem 5.16 elsewhere.

Nine findings: four P1, four P2, and one P3. Eight are blocking. The package is repairable without changing its general arithmetic objective. The Lean elaboration and mechanical dependency check pass; neither establishes the missing mathematical implications below. No author file was changed during this review.

## Verified sound

The review covered all 43 numbered targets, their API bullets, Checks, proof routes and Needs lines, the six layer examples/dependency summaries, the scope and supplier contracts, all three manifest entries, and the whole Lean file. The earlier computed rows were used only for unchanged material; repaired passages and all 15 seeded targets were re-read. The following tables record the actual tests, including failures, rather than treating elaboration or a source citation as a proof.

### Verification of the previous findings, before the new pass

The identifiers here are those in the repair report. Quotes are from the repaired package, not from source texts. All thirteen requested textual repairs are present; remaining defects exposed by testing them or their uses are identified separately above.

| Prior finding | Status | Repaired passage and verification |
|---|---|---|
| F01 | repaired | README:49, “without assuming vanishing outside [q₀, q₀+ℓ₀]”; :51, “given vanishing … on every intermediate cover”. Range/duality and perfect models now have distinct slugs, identical plan needs, and separate consumers at :901 and :1146. |
| F02 | repaired | README:59, “prove that this image acts compatibly on cohomology with every finite O-module coefficient”. The duplicated completed-local-factor request is gone; §2.2 is consumed at :57. |
| F03 | repaired as the specified variant distinction | README:13, “Layer 2 states the Res PGLₙ package … as a kept variant”. §5.8 no longer consumes the GLₙ endpoint. The open MLE §2.7 is indeed GLₙ; its §2.8 still has a broad ownership sentence. See ownership discussion below. |
| F04 | repaired | README:129, “ClassFieldTheory Layer 7 fixes Art_v”; :533, “it is therefore the rank-two Δ_Q-structure of GlobalGaloisDeformations §5.5”. Design labels were replaced by real sections. The coordinate witness computes the inverse power correctly. R03 is a different, substantive local-condition mismatch. |
| F05 | repaired in the reviewed README/Lean | README:15, “are outside this roadmap”; :1475 describes the applications without invented roadmap names. The obsolete consumer remains only in the stale gap record, addressed by R08. |
| F06 | repaired | README:941 cites “FreeGroupsAndLimitGroups §4.8” and “§4.5”; :1019 uses “groupCohomology.coindIso”. The modular-curve citation is now explicitly principal-level over ℚ. The new tree-chain route is checked below; R01–R02 concern its arithmetic inputs. |
| F07 | repaired | README:231 names “IntegralHeckeAndGaloisDeterminants §2.2”; :1364 names “AutomorphicFormsOnReductiveGroups §5.5”. The listed bare/duplicated references are corrected. All remaining Needs lines were resolved again. |
| F08 | repaired for its listed locators | README:899 uses “CG18 line 3235”; :719 uses “CG18 line 3156”; :1354 uses “CG18 line 3728”; :1332 uses “CG18 line 5166”; :219 uses “CGH20 line 178”. Each source location was opened. R09 records another occurrence of the locator pattern. |
| F09 | repaired | `sources.toml:57`, “cited_for = [\"Sections 3.6, 3.7\"]”. KT17's key is retained and its relevant lemma was read. |
| F10 | repaired | README:367, “the source notes that such stability is not evident”. CG18 lines 3534–3539 do not claim a counterexample to base-change stability. |
| F11 | repaired as a conditional theorem | README:1080, “every subset Q′ ⊆ Q ∖ {x}, every j and every b ≥ 1”. For two primes this asks for four successive-level conditions. R08 addresses the stronger downstream assertion that was not correspondingly qualified. |
| F12 | repaired | README:765 uses “Q̃_x(V_x)”; :1106 uses E on both character sides; :1060 uses coefficient exponent b. The non-root V=1 test removes the unwanted component only with E. No remaining integral use of an unlifted residual polynomial was found. |
| F13 | repaired | README:315 states the finite-coefficient cohomology/homology duality in every degree; :729 keeps boundary vanishing for compact-support comparison only. The level-one Eisenstein test computes H⁰=k=H₀ while H²_c=k and H²=0. |

### Seeded source sample

The manifest contains no author-flagged unverified locator. All three recorded legal extractions were readable. CG18 uses the published-layout author's copy; CGH20 and KT17 use the arXiv versions expressly identified in the manifest. Page claims below refer to those versions, except the published-appendix cross-numbering limitation noted under Not verifiable.

| Seeded target | Text opened and locator | Hypotheses and result of comparison |
|---|---|---|
| 0.1 Iwahori local systems | CG18 lines 4588–4626, §9.1, pp.411–412; line 5161, p.426 | Product-one characters descend through the scalar quotient, reduce trivially, and use the inverse dual character. The package retains these conditions. |
| 1.1 Standing datum | CG18 lines 4395–4457, §8.5–8.5.1, pp.406–408; CGH20 lines 287–305, §4(2)(a), p.7 | The split R_triv/R_reg and genuine trivial residual representation at character places avoid the source's excessive irreducibility claim. p>n, unramified p, fixed determinant and balanced real eigenspaces are retained. |
| 1.2 Local rings | CG18 lines 4422–4457, p.407; CGH20 lines 293–305, p.7 | Literal characteristic-polynomial quotients are kept; coefficient flatness is expressly not inferred. Smooth regular-unipotent factors are a separate condition. R09 corrects their supplier locator. |
| 1.4 Global data | CG18 lines 4422–4493 and 4494–4521, pp.407–409; lines 5200–5208, p.427 | Source uses a simple generalized line and scalar inertia on both blocks. This supports the intended condition, but not the mismatched supplier identification: R03. |
| 1.6 Proposition 8.5 | CG18 lines 4543–4578, pp.410–411; lines 4339–4394, pp.405–406; lines 5168–5182, p.426 | q bounds the relative dual Selmer dimension; exactly q primes and g=q+|T|−1−[F:ℚ]n(n−1)/2−ℓ₀. Big-image selection remains an explicit supplier contract. The balanced archimedean replacement is necessary. |
| 2.3 Conjecture B(4) | CG18 lines 4706–4709 and 4740–4757, pp.414–415 | Both range and boundary vanishing are hypotheses. Finite coefficient duality itself does not require boundary vanishing; compact-support comparison does. |
| 2.4 Conjecture B(5) | CG18 lines 4710–4739 and 4764–4781, pp.414–416 | Chosen simple root, residual polynomial factor, lift to O, pullback and root projection are retained. Q=∅ gives identity. The extra selected local factor E is essential outside the old summand. |
| 2.5 Hypothesis bundle | CG18 lines 4684–4739 and 5111–5115, pp.414–415,425; CGH20 lines 71–110 and 287–320, pp.2–3,7–8 | The package openly strengthens B by all-level actions and clause (6). CGH20 assumes the source's B without (4), not literally this stronger bundle; R05 and R08 identify the remaining interface overclaims. |
| 3.1 PSL₂ reduction | CG18 lines 4815–4826, p.417 | The source contains the same integral-intersection error, refuted in R01. Odd p is sufficient for averaging only after the normal subgroup is corrected. |
| 3.2 Amalgam | CG18 lines 4827–4843 and 4875–4881, pp.417–418 | The source explains the simplifying ray-class assumption and mentions different lattices otherwise. The package has yet to state that general interface: R02. Adjacent vertices, rather than the distance-two diagonal, are correct. |
| 3.3 Squared operator | CG18 lines 4847–4865, p.418 | The source's scalar 1 is inconsistent with the normalized augmentation. The package correctly gets q⁻², tested as 7 in ℤ/9 for q=7. Its domain still depends on R02. |
| 3.4 Lyndon sequence | CG18 lines 4843–4874, p.418 | The package repairs the source's degree and localization issues. The cellular boundary and augmentation computation is correct for the stated one-edge action. Arithmetic generality remains R01–R02. |
| 4.3 Reduction comparison | CG18 lines 5183–5187 and 5200–5224, pp.426–427 | Lowest cohomology and top reflected degree are compared using vanishing below q₀, coefficient exactness, common residual rings and compatible presentations. It is not arbitrary cohomology commuting with every quotient. |
| 5.5 Smooth R=T | CG18 lines 3728–3746, Theorem 6.4(1), p.389; CGH20 lines 293–316, pp.7–8 | Smooth local rings, the dimension count and a nonzero free patched module give faithful action. R_triv=∅ removes the nonflat character factors. Nilpotent kernel alone would not give integral R=T. |
| 5.7 Initial m | CG18 lines 3497–3539, Theorem 5.16(8), pp.383–384; line 5111, p.425 | Branch (a) retains an integral cuspidal eigensystem. Branch (b) requires only a mod-p class; the stronger degree claim is R07. |

KT17 lines 1893–1956, Lemma 6.25(4), pp.40–41, were also read: the objects are GLₙ over CM fields, at Iwahori level with ordinary completed cohomology. They do not establish the claimed PGLₙ descent. CG18 lines 4897–5104 give the GLₙ block argument and its two spectral sequences; Theorem 9.16 at line 5027 is a local derived-invariants comparison, not an identification of global GLₙ and PGLₙ cohomology.

### Computed adversarial pass

Rows separate independent operations when a numbered target contains several. “Holds” means the displayed computation and hypothesis check succeeded; it is not a claim to have proved the roadmap theorem. Arithmetic conditional theorems are tested on their actual formulas and interfaces. Algebraic countermodels to an inference are explicitly distinguished from arithmetic counterexamples. Empty or excluded inputs are tested against the stated domain, not assigned fabricated arithmetic objects.

| Statement or operation | Instances tried | Values computed on the two sides | Result | Change |
|---|---|---|---|---|
| Conventions: dimension and defect | n=2 over ℚ, imaginary quadratic, real quadratic; n=3 over ℚ; n=2 over CM quartic | (dim Y,q₀,ℓ₀)=(2,1,0),(3,1,1),(4,2,0),(5,2,1),(6,2,2); each dim Y=2q₀+ℓ₀ | Holds | None |
| Conventions: balanced oddness | n=4,p=5,c=identity versus balanced (2,2) | Identity has trace 4=−1 mod 5 but h⁰(ad⁰)=15; balanced has trace 0 and h⁰=7=6+1 | Balanced condition excludes wrong trace-only model | None |
| Conventions: Frobenius | Arithmetic eigenvalues with trace 3, determinant 7 | Arithmetic polynomial X²−3X+7; inverse Frobenius has trace 3/7 and determinant 1/7 | Arithmetic convention discriminates inverse | None |
| Coefficient domain and indices | n=0,1, p=2; O=0 or equal-characteristic DVR; exponent a=0 | Main domain n≥2,p>n rejects first ranks and p=2; O is finite-extension p-adic integers, not 0 or equal characteristic; O/ϖ⁰=0 is excluded by a≥1 | No unnoticed zero coefficient or rank-zero theorem | Rank one only §1.8 |
| 0.1 character descent | θ of order 3, tuples (θ,θ⁻¹) and (θ,1) | Scalar value 1 versus θ; precisely first descends | Holds | None |
| 0.1 coefficient reduction and dual | ψ≡1 mod ϖ, ψ(g)=ζ; trivial ψ | Residual action 1; dual action ζ⁻¹; ζζ⁻¹=1 rather than ζ²; ψ=1 gives O | Holds | None |
| 0.1 prime-to-p character and pullback | p∤N(v)−1; identity or level change away from R | Character order divides both a p-power and N(v)−1, hence 1; pullback keeps the same scalar ψ(γ) | Holds | None |
| 0.2 scalar quotient of the parahoric | n=3, scalar c and diag(u,1,1) | det(B)a⁻² changes by c²c⁻²=1; diag(u,1,1) maps to u⁻², not 1 | Holds | None |
| 0.2 central operator and empty Q | diag(ϖ,…,ϖ); α=1; Q=∅ | PGL class 1, operator 1; Δ=1 and K_Q=L_Q | Holds | None |
| 0.2 unnormalized characteristic polynomial | n=2,N(λ)=2,k=𝔽₇ | Constant coefficient 2; rescaling T_i by 2⁻ⁱ gives 2⁻¹=4 | Holds; norm-one primes alone would miss error | None |
| 0.3 simultaneous image versus one level | T=k[ε]/ε² on k and T | ε has action 0 on k, ε≠0 on T, and ε²=0 | Definition correctly includes both; later inference fails | R05 |
| 0.3 finite coefficients versus integral cohomology | C=[O --ϖ→ O] | Integral (H⁰,H¹)=(0,k); modulo ϖᵃ they are (k,k), for all a≥1 | All coefficient exponents necessary | None |
| 0.3 complete local factors | O[t]/(t(t−1)) | Evaluation gives O×O; t acts as (0,1), 1−t as (1,0); local summands recover the original module | Holds under finite O-algebra hypothesis | None |
| 0.3 Eisenstein level-one test | PSL₂(ℤ)=C₂*C₃, p>3 | H⁰=k, H^i=0 for i>0; T_λ eigenvalue 1+λ; simultaneous integral image O | Holds | None |
| 0.4 factorial root projector | k=𝔽₇,V=diag(2,4), Q_x(X)=X−4 | Q_x(V)=diag(−2,0); factorial powers eventually diag(1,0), whereas powers without factorial need not converge | Holds | None |
| 0.4 extra local-factor projection E | Add V=1 component to previous example | Q_x(1)=−3 is a unit, so e keeps this component; selected m_Q projection kills it, giving E=0 there | E is needed on both character sides | Prior F12 repaired |
| 0.4 lift and simplicity | Lift coefficients mod ϖ; repeat root 1,1 | Lift perturbations have same unit/nilpotent split; repeated root gives Q(1)=0 rather than a unit | Holds; repeated roots excluded | None |
| 0.5 residual twist and adjoint action | χ(g)=ζ_p, χ≡1 mod ϖ | Both residual local systems are k; dual uses ζ_p⁻¹, pairing value 1 | Holds | None |
| 0.5 finite-coefficient duality without boundary removal | Level one, p>3 | H⁰=k=H₀; H²_c=k but H²=0; boundary nonzero | Cohomology/homology duality survives; compact-support equality does not | Prior F13 repaired |
| 0.5 stabilizer torsion | PSL₂(ℤ),p=3 | H¹=Hom(ℤ/6,𝔽₃)=𝔽₃=H₁; H²(C₃,k)=k=H₂(C₃,k) | No hidden neatness in degreewise finite-coefficient duality | None |
| 0.6 minimal-level predicate | Reducible 1⊕ε̄; empty R; torsion-only eigenclass | Reducible representation fails absolute irreducibility; empty R gives hyperspecial level; k-class contributes dimension 1 without any O-eigenline | Predicate itself sound | R07 at its later use |
| 0.6 base-change statement | Identity base change on a one-dimensional residual eigenspace | Degree-one field extension is the identity; eigenspace dimension 1 maps to 1 and Hecke eigenvalues are unchanged. No nontrivial-extension stability is asserted for branch (8b). | Identity control holds; broader claim matches source after repair | None |
| 1.1 standing ramification partition | R=∅; regular unipotent (1,1;0,1); nontrivial unramified residual place | T=S_p≠∅; N=matrix−1 has rank 1; nontrivial unramified residual data fail the trivial-residual character-place condition | Holds | None |
| 1.1 residual local/generalized line | Frob=diag(4,J₂(3)),k=𝔽₇ | Characteristic polynomial (X−4)(X−3)², determinant 36=1; simple line dimension 1, complement nonsemisimple | Allowed by package, not cited local condition | R03 |
| 1.2 literal quotient and p-torsion | O=ℤ₃, q=7, A=O[[X]][a]/(a²,6a); Φ=diag(1+X,7/(1+X)), Σ=diag(1+a,1−a) | det Φ=7, det Σ=1, charpoly Σ=(T−1)²; Σ⁷=Σ; tr Φ(Σ−1)=a((1+X)−7/(1+X))≠0, killed by 6 | Literal quotient need not be O-flat | Flatness correctly absent |
| 1.2 smooth factors and fixed determinant | n=2,p>2, unramified p-place of degree f; regular-unipotent place | Fixed determinant dimensions 3+f and 3; removing determinant removes one variable from corresponding GL₂ dimensions | Correct conditions; wrong regular-place locator | R09 |
| 1.3 completed-product dimension | |T| factors with dimensions n²−1 plus p-adic Hodge terms | dim=1+|T|(n²−1)+[F:ℚ]n(n−1)/2; R_triv=∅ gives a single smooth component | Holds conditional on named product contract | None |
| 1.3 necessity of trivial residual character places | Residual Frobenius has two distinct eigenvalues; χ₁≠χ₂=χ₁⁻¹ | Two eigenline/character assignments give two generic components, versus claimed one at trivial residual datum | Negative Check distinguishes wrong generality | None |
| 1.4 deck-coordinate correction | n=2; n=3,p=5 | b=−1 gives (u⁻¹)⁻¹=u; n=3 gives b=2 and (u⁻²)²=u mod order 5, unlike naive u⁻² | Holds | None |
| 1.4 local tangent contribution | n=2,p=5,q=11,A=k[ε]/ε² | Two-scalar diag(1+ε,1−ε) has det 1 and one inertia parameter; unramified complement plus fixed determinant gives zero parameters | Supplier mismatch | R03 |
| 1.4 augmentation and residual comparison | Q=∅; kill selected inertia character; χ≡1 mod ϖ | O[1]=O and augmentation identity; ψ=1 forces other scalar=1 since n−1 invertible; both residual polynomial conditions become (X−1)ⁿ | Holds for the intended two-scalar condition | R03 supplies its full domain |
| 1.5 framing and trace generation | n=2,|T|=1,2,0; absolutely irreducible versus scalar residual | Framing counts 3,7,−1; T=0 is excluded. Absolute irreducibility gives scalar centralizer dimension 1; scalar residual gives dimension 4 | Standing hypotheses retain the subtraction and representability constraints | None |
| 1.6 archimedean adjoint count | Balanced n=2,3,4,5 | a²+b²−1=1,4,7,12; n(n−1)/2+floor((n−1)/2)=1,4,7,12 | Holds | None |
| 1.6 numerical coincidence | Imaginary quadratic F,n=2,|T|=1,q=3 | g=3+1−1−2−1=0; j=3; dim R∞=6=1+3+3−1 | Holds; q=0 would yield g=−3 and is not licensed by the Selmer bound | None |
| 1.6 auxiliary avoidance | Remove a finite set from an infinite Chebotarev set; q=0 | Positive density set remains infinite; empty set has cardinality 0 and kills no nonzero dual Selmer group | Quantifiers are conditional on exact supplier selection contract | None |
| 1.7 deformation point and coefficient extension | O[[X]]→O′ with X↦0 | Image O, not generally O′; fraction-field point exists without surjectivity onto O′ | Correct point formulation | None |
| 1.8 rank-one illustration | ℚ, imaginary quadratic, real quadratic; Δ=C₃ | ℓ₀=r₁+r₂−1 equals 0,0,1; O[C₃] has rank 3 and mod 3 polynomial (t−1)³ | Holds; rank-one class-field-theory input is not re-proved | None |
| 2.1 residual representation and non-Eisenstein condition | 1⊕ε̄; n=2 | Polynomial X²−(1+λ)X+λ; determinant λ; representation reducible, so completed irreducible-lift clause not applicable | Holds | None |
| 2.1 honest lift versus nilpotent quotient | T=k[ε]/ε²→k | Kernel (ε) is nonzero with square 0; a map to k is not a lift to T | Weaker CM realization does not satisfy stronger B^gal | None |
| 2.2 local weights and diamond character | n=3,p=5; n=2 selected versus other line | Weights {0,1,2} lie in [0,3]; selected θ(u), other θ(u)⁻¹; p>n makes 1−n invertible on Δ | Normalization correct | All-level quantifier R05 |
| 2.3 range and boundary | Imaginary quadratic n=2; PGL₃/ℚ; CM quartic n=2; Eisenstein H⁰ | Allowed degrees {1,2},{2,3},{2,3,4}; Eisenstein H⁰=k lies outside each interval with q₀>0 | Separate hypotheses necessary | None |
| 2.3 duality and compact supports | Nonzero boundary versus boundary vanishing | With boundary, H²_c=k≠0=H² in level-one example; if boundary complex=0, triangle makes H_c→H an isomorphism | Correctly separated | Prior F13 repaired |
| 2.4 no-new comparison | Q=∅; two old roots α≠β | Empty product 1 and pullback identity; old unselected module has two copies, selected α-part one copy | Target chooses the correct summand | None |
| 2.5 conjunction and converse | Remove B^van; Eisenstein level one | Full conjunction implies four predicates; remaining three do not assert the missing range/boundary; H⁰=k contradicts required vanishing | Bundle valid; its source identification too strong | R08 |
| 2.6 dévissage | 0→k→O/ϖ²→k→0; disk O --ϖ→ O | Long exact rows have zero outside the same interval; disk H⁰ integral 0 versus residual k shows isolated-degree inference fails | All-degree naturality is retained | None |
| 2.7 Δ-linearity and image generation | Q=∅; top-only diamond equality | Empty-Q augmentation is identity; ε=0 on top but ε≠0 on intermediate image | Full simultaneous equality is missing | R05 |
| 2.8 low-rank vanishing | (q₀,ℓ₀,d)=(2,1,5),(2,2,6) | Outside degrees within [0,d] are {0,1,4,5} and {0,1,5,6}; dual of degree 1 is 4 or 5, not q₀−1=1 | Range, character and duality gaps used separately | None |
| 3.1 actual determinant kernel | Conjugated PSL₂(ℤ) from R01 | Index in integral intersection 3; conjugate A has entry −1/2; kernel in PSL₂(ℚ) has index 1 | False as written | R01 |
| 3.1 finite quotient averaging | C₂ swap on k², k=𝔽₃ and 𝔽₂ | At 3: projector (a,b)↦((a+b)/2,(a+b)/2); at 2: denominator 0, H¹(C₂,k)=k | p odd essential | None after R01 |
| Group-cohomology control in 3.1/3.4 | Nonabelian S₃ at p=5; Q₈ at p=3 | |S₃|=6=1 mod 5 and |Q₈|=8=2 mod 3 are units; averaged trivial action=1, positive-degree cohomology=0 | Generic imported constructions do not assume an abelian arithmetic group | None |
| 3.2 adjacent-vertex convention | h=diag(1,π),g=diag(π,π⁻¹) | h moves distance 1, g distance 2; conjugation gives (a,b/π;πc,d); intersection has c≡0 mod π and index q+1 | Local convention correct | Global generality R02 |
| 3.2 all-prime claim | ℚ(√−5),x=(7,3+√−5),p=3 | N(x)=7=1 mod 3; a²+5b²=7 has zero solutions; global generator absent | General component interface missing | R02 |
| 3.3 normalized U_x² | q=7,O/ϖᵃ=ℤ/9 | Edge degree q²=49=4; augmentation 1; normalized augmentation 4⁻¹=7; 7−1=6 is nilpotent (6²=0 mod 9) | Source's scalar 1 corrected | None after R02 |
| 3.3 root eigenvalues | Arithmetic roots a,b, product q | V eigenvalues a,b; U eigenvalues a/q,b/q; U_x² eigenvalues a²/q²,b²/q² | Denominator q is a unit since x∤p | None |
| 3.4 cellular boundary and grading | Oriented edge v₀→v₁, q=7 | Vertex augmentations 8−7=1 and 56−56+1=1; edge sum size 49; H⁰ middle map (a,a)↦0 | Chain route and difference sign correct | Arithmetic inputs R01–R02 |
| 3.4 localization | q=7 mod 9, unit U_x²−1 on localized part | G action difference=6, 6²=0; making it invertible kills G terms. Normalized vertex augmentations 7,7, normalized edge degree 1 | Localized exact sequence correct | None |
| 3.5 Gram determinant and selected root | p=7,q=29,roots 2,4; roots 1,1 | 4−6²=3 and 2²−1=3, units; repeated roots give 4−2²=0 and 1²−1=0 | Rank-two algebra correct, global route incomplete | R01–R02 |
| 3.6 tower-derived invariants | U=ℤ_p,k trivial; identity cover | H¹_cts(U,k)=k versus H¹(1,k)=0; identity-cover abutment unchanged | “Tower version” cannot mean ordinary invariants | R04 |
| 3.6 distinct block | n=3,p=7,roots 1,2,4 versus 1,1,1 | Distinct product 8=1; Q(α)≠0 at selected distinct root; repeated-root Q(1)=0 | Extra block hypothesis is not just distinctness | None in conditional statement |
| 3.7 successive base levels | Q={x₁,x₂}; Q=∅ | Required pairs (x₁,∅),(x₁,{x₂}),(x₂,∅),(x₂,{x₁}): 4, versus 2 if only empty base; empty Q gives identity | Prior repair correct | Application R08 |
| 3.7 central descent | Central C_p with k coefficients | H⁰=k,H¹=k; deleting centre would lose a nonzero degree-one term | Full derived comparison is a target, not an identification | R04/R08 |
| 4.1 minimal model and amplitude | k --0→ k; O --1→ O; ℓ₀=0 | Residual term ranks (1,1); contractible disk ranks (0,0) after minimalization; defect zero gives one free stalk | Holds conditional on perfect-model contract | None |
| 4.1 Hecke image versus derived action | Ext¹ ghost on k[0]⊕k[1] | H*(t)=0, t²=0, derived t≠0 | Factorization not supplied | R06 |
| 4.2 reflected degrees | q₀=ℓ₀=1 | T⁰=H²∨,T¹=H¹∨; alternate source formula gives T⁰=0,T¹=H⁰∨ | Corrected reflection necessary | None |
| 4.2 framed dimensions | q=3,n=2,|T|=1 | j=3; dim S∞^□=7; dim R∞=7−ℓ₀ | Holds | R09 for unframed comparison |
| 4.2 compatible surjections Check | x↦x versus x↦x+z² | Before augmentation difference z²≠0 mod ϖ; after z=0 difference 0 | Check names wrong map | R09 |
| 4.3 universal coefficients | B^van below q₀ | 0→H^(q₀−1)(E/O)/ϖ→H^q₀(k)→H^q₀(E/O)[ϖ]→0; left term 0 | Lowest-degree reduction valid | None |
| 4.3 top versus arbitrary cohomology | C=O --ϖ→ O | Top cokernel k reduces to k=coker(0:k→k); degree-zero integral kernel 0 reduces to 0≠k=ker(0) | Top-cokernel argument does not overclaim arbitrary base change | None |
| 4.4 finite framing quotients | O[[z]]/(ϖ²,z²,ϖz) | As O-module O/ϖ²⊕kz, not flat over O/ϖ²; scalar quotient creates new torsion class z | Actions must be supplied on these quotient models | R05 supplies all-level equality |
| 4.4 nonzero residual data | A nonzero bounded minimal free complex over a local ring | Reducing gives zero differentials and a nonzero graded k-space; acyclicity would instead give all ranks 0 | Nonzero total support suffices before concentration | R07 in §5.7 |
| 5.1 concentration and depth | dim S∞^□=d,dim R∞=d−ℓ₀; nonzero complex of length ℓ₀ | First nonzero degree m yields dim support≥d−m; upper bound d−ℓ₀ forces m=ℓ₀; depth=d−ℓ₀ | Correct argument with nonzero module | None |
| 5.2 near faithfulness | A=k[ε]/ε²,M=k | depth M=0=dim A; Ann M=(ε), (Ann M)²=0; support all Spec A but action not faithful | Distinction retained | None |
| 5.3 support lifting | A=O[[x,y]]/(xy),M=A/(x) | ϖ regular on M; mod-ϖ support is V(x), misses the other component V(y) | Torsion-freeness alone insufficient; residual full support is present in target | None |
| 5.3 augmentation | Free rank-r module, quotient by group/framing variables | M/aM=(R/aR)^r; zero rank gives 0 and cannot prove faithfulness | Nonzero hypothesis retained | None |
| 5.4 Theorem 9.19 | A=O[ε]/ε² acting on O | Kernel (ε)≠0, square zero; reduced quotient A_red=O | Near faithfulness is the correct conclusion | None |
| 5.5 smooth R=T and freeness | Smooth R, M=R^r, r≥1 versus r=0 | Ann(R^r)=0 for r≥1; Ann(0)=R | Requires nonzero free module; no integral R=T from nilpotence alone | None |
| 5.6 residual cuspidal support | Speh(σ,2),n=4, norm 1 modulo p | Roots (a,a,b,b): every multiplicity≥2, versus simple eigenvalue required by bigness | Residual exclusion correct with spectral gap | None |
| 5.7(a) initial ideal | Integral eigensummand lattice O^r,r≥1 | Reduction k^r has dimension r>0 and same reduced Hecke eigenvalues | Holds | None |
| 5.7(b) initial ideal | Total support k only in degree q₀+1 | Total dimension 1, degree-q₀ dimension 0 | Not a definitional implication | R07 |
| 5.8 determinant normalization and point support | n=3, weights 0,1,2; determinant-adjusting shift −1 | Shifted exponents −1,0,1 sum 0; one-dimensional point quotient detects nonzero localization of a finite supported module | No arbitrary function or free automorphy predicate substituted | None |
| 5.9 imaginary-quadratic counts | F=ℚ(i),n=2,q=3; p=5 split or p=7 inert | (q₀,ℓ₀)=(1,1); |T|=2 gives g=1; |T|=1 gives g=0 | Split and inert p both retained | Locator R09 |
| 5.10 defect-zero counts | Real quadratic F,n=2,|T|=1,q=3 | q₀=2,ℓ₀=0,g=1; dim R∞=7, dim S∞=4, dim S∞^□=7 | One Check contradicts the other | R09 |

The tests also check direction of map and domain: coefficient change is a quotient, augmentation sends every group element to 1, root projectors act after pullback, Hecke duality inverts characters and uses the adjoint ideal, and degree reflection places the lowest arithmetic cohomology in the highest patching degree. All denominators used here are units under the stated p>n and x∤p hypotheses. There are no Lean total-function junk values to conceal a subtraction or indexing error: this Lean file has no declarations. Numerical counts in the README are integers subject to Selmer/dimension hypotheses; the negative g test was not silently truncated to zero.

### Supplier contracts, ownership and order

The review used `roadmaps list`, object searches with `roadmaps grep`, `roadmaps show` for each direct supplier, and `roadmaps resolve` for this README. The index was dated 2026-10-25T03:33:11Z. Main was b41e47bc34e30def0db01d84cc92062ed72c6e68. Existing roadmaps were read on main, not on progress pull requests; new roadmaps were read at their indexed heads. The resolver reported no unresolved roadmap or Lean names, but its remote library scan was unavailable, so the library declarations were opened locally at the pins.

Object searches included the literal character quotient, simple Frobenius block, scalar inertia and determinant fixing; Conjecture B and Theorem 9.19; the arithmetic amalgam and Lyndon sequence; cohomology-action patching; and tower Hochschild–Serre. These searches covered indexed open roadmap heads and main and were complemented by the local board-package search and the supplied board-package index. The three inaccessible indexed sibling packages are recorded below; they were not treated as absent.

The table records the cross-roadmap citations resolved this round. Paths in the first column mean `TauCetiRoadmap/<name>/README.md`. Line anchors identify a load-bearing passage read, while the section lists give the full cited contract. A found section is not automatically a sufficiently general supplier: the exceptions are R03, R04 and R06.

| Roadmap and anchor | Sections resolved | What was verified |
|---|---|---|
| ArithmeticLocallySymmetricSpaces:1343,4655; head 7dca7ea | ALS.0.7–0.10; 1.1–1.8; 2.2–2.4; 3.3–3.9,3.14; 4.1,4.9–4.12; 5a.2–5a.6; 5b.4–5b.6; 6.1–6.3 | Components, groupoid local systems, boundary/coefficient maps, Hecke adjunction, finite descent. Ordinary unlocalized perfect models exclude bad stabilizers; declared gaps address that. No tower version: R04. |
| IntegralHeckeAndGaloisDeterminants:2829,2894,3058; head 1383569 | 1.2–1.3; 2.1–2.3; 3a.1; 3b.1–3b.2 | Finite image algebra, local factors, factorial projectors, unnormalized Hecke polynomial, irreducibility and adjoint residual ideals. Ghost/nilpotent kernels do not give exact image-ring actions in the derived category. |
| LocalGaloisDeformationRings:767,1495,2003,2024,2146; head 11b2c65 | F.1–F.3, especially F.2.7–F.2.9 and F.3.1; 1.6,1.10,1.13; 2.8,2.10,2.15–2.16,2.21,2.23 | Framing, trace generation, determinant fixing, Fontaine–Laffaille dimension, minimal regular-unipotent condition and literal quotient. The two-scalar versus unramified-complement distinction and semisimplicity restriction are real: R03. §2.26 was also opened for R09. |
| GlobalGaloisDeformations:407,1287,1844 | 3.3–3.7; 4.3–4.4; 5.1,5.5–5.8; 7.2–7.4 | Strict deformation data, local/global maps, tangent presentation, augmentation and n²|T|−1 framing count. Existing rank-two selection statements do not supply the declared general big-image selection contract. |
| ArithmeticGaloisRepresentations:4126,4218,4661 | 7.2,7.4,7.7–7.12 | Trace-zero adjoint and balanced real involutions; big, adequate and enormous are not silently equated. The requested CHT detector is not replaced by SL₂ containment. |
| ArithmeticGaloisDuality:6413,6751 | R02.5.1–5.2; R02.6.1–6.2 | Greenberg–Wiles with exact local annihilators; rank-one unit defect and adjoint local/archimedean counts. The relative T-condition is zero and its dual unrestricted. |
| DeformationAndDerivedPatchingAlgebra:276,1292,1382,1450,1664 | 1.12; 3.1–3.4,3.10; 4.6; 6.1–6.8; 7.3,7.6; 8.6; 9.1–9.2 | Complete-local coproduct, support, near faithfulness, minimal models, signed duality and cohomology-action patching. Generic product theorems retain geometric/flatness assumptions. §8.6 requires all finite quotient actions and does not conclude a derived deformation action. |
| ReductiveGroupsPartII:3698; head 1383569 | RG2.2.4, Ihara amalgam | Adjacent lattices O² and O⊕ϖO; PSL₂ quotient; PGL₂ edge inversions; no substitution of the distance-two diagonal for the second vertex. |
| FreeGroupsAndLimitGroups:863,937; main | 4.5,4.8 | Segment graph-of-groups pushout and structure theorem for actions without inversion. This supplies the generic theorem, not a second construction here. |
| ModularCurvesPartII:4218,4317 | 15.4,15.8 | The cited Lyndon theorem has the actual principal-level Γ_N setting over ℚ, N≥3. The package now correctly cites it only for that specialization. Its scope is narrower than the number-field target. |
| SmoothRepresentationsOfLocalGroups:4660,4692,4705; head 1383569 | SR.5.3, distinct-eigenvalue block and derived hyperspecial/parahoric comparison | GLₙ, specified residual principal-series block, locally admissible finite-coefficient smooth modules; source/target invariants retain their group. The PGLₙ extension remains a target, not a supplied equality. |
| AutomorphicFormsOnReductiveGroups:760,806 | Layers 4–6, particularly 5.3 and 5.5 | Split-centre convention, PGLₙ dimension/defect, tempered cohomological interval and purity with central character retained. |
| AutomorphicSpectralTheory:2522,2903 | 4.14a; 5.12–5.14 | Number-field Speh blocks and cuspidal-support/isobaric realization. The boundary-or-residual implication is an additional declared contract, not inferred just from the decomposition. |
| KTheoryLowDegrees:1090 | 11.6 | Finite congruence-kernel character factorization in the stated low-rank cases; not the stronger strict congruence subgroup property or the localized cohomology vanishing itself. |
| PadicHodgeTheory:1134,1154 | 6.1 and its integral 6.2 input | Contravariant Fontaine–Laffaille sign and integral range [0,p−2]. p>n puts 0,…,n−1 in that range. |
| AdelicAlgebraicGroups:3987 | 4.2; AA.5 | Strong approximation for SL₂ with a noncompact local factor; torus/unit-rank components. These concern actual lattice stabilizers and do not identify all with the standard integral subgroup. |
| ClassFieldTheory:1312,1683; main | Layers 7,11 | Local Artin sends uniformizer to arithmetic Frobenius; global reciprocity and class-group quotient. |
| Chebotarev:410; main | Layer 10 | Density |C|/|G| for a finite conjugacy class and infinitude outside any finite avoidance set. |
| PotentialAutomorphyInfrastructure:1260,2091,2256 | Layers 3–5 | Unconditional CM-field ordinary/integral arithmetic construction has a different domain and hypotheses from this arbitrary-number-field conditional PGLₙ construction. |
| ModularityAndLanglandsExtensions:947,975; head 2d70821 | 2.7–2.8 | Its stated spaces are GLₙ. The present Res PGLₙ, all-intermediate-level variant is explicitly distinguished. Its broad sentence claiming the CG verification remains imprecise, but it is not used here as a supplied PGLₙ theorem. The kept variant does not declare its Lean name. |
| CompletedCohomologyPartII:1580; head 92dc4a1 | 6.2, with Conventions and 6.1 | Fixed-exponent tower descent is the relevant earlier owner. The tame-place/groupoid specialization must be made an exact contract, rather than attributed to ALS.6.2: R04. |

The ownership differences are by object: generic quotient/cohomology belongs to ALS, generic double-coset algebra to the native libraries and IHG, local rings to LGD, generic global representability to GGD, and generic patching/support algebra to DDPA. This package owns their particular two-character Res PGLₙ assembly and its arithmetic consequences. The general-number-field amalgam coefficient comparison is a genuine extension of the principal modular-curve case, but must actually be stated at that generality (R02). No fully qualified Lean name is duplicated because this package declares none. No new computational algorithm or copied source passage was found.

### Declared-gap audit

There are ten plan gap records. Nine have named earlier suppliers and exactly matching needs sentences under the correct README supplier headings; the tenth is R08. The named gaps are contracts rather than unowned prerequisites. Their absence from the suppliers today is not itself a finding.

| Gap slug | Supplier/section; precise missing distinction | Discriminating computation and audit result |
|---|---|---|
| localized-orbifold-range-duality | ALS.5a.6; localized range/duality with bad stabilizers, without assuming the desired short interval | Unlocalized PSL₂(ℤ),p=3 has H^(2j)=k for every j≥1, beyond real dimension 2. The localized contract is materially stronger than the neat-level theorem; not duplicated. |
| localized-orbifold-perfect-models | ALS.1.6; perfect O[Δ] model and every intermediate base change under localized range/boundary hypotheses | For Δ=C_p, the trivial module O has derived coinvariants with k in infinitely many homological degrees; free O[Δ] has coinvariants O in degree 0. The hypotheses distinguish them. Separate from the preceding range contract. |
| congruence-character-localized-h1 | ALS.4.9–4.12; Hecke-localized H⁰,H¹ vanishing in PGL₃/ℚ and PGL₂/CM-quartic | Character factorization alone allows Hom(C_p,k)=k, whereas the required non-Eisenstein localization must kill that eigensystem. KTheoryLowDegrees §11.6 does not already give this conclusion. |
| simultaneous-orbifold-hecke-finiteness | IHG.2.1; all-degree, all-finite-coefficient simultaneous image with stabilizers | Level-one stabilizer H^(2j)(C₃,𝔽₃)=𝔽₃ for all j; finite dimension in each degree does not bound an infinite image. Finite local-factor decomposition is already supplied and was removed from the request. |
| big-image-rank-n-taylor-wiles | GGD.5.6–5.8; exactly q primes and zero new relative dual Selmer group for general rank-n big datum | Local one-dimensional detector contribution is 1; q=0 cannot remove a nonzero dual Selmer space. Existing rank-two conditions do not cover the requested rank-n detector/avoidance quantifiers. |
| cht-big-image | AGR.7.7–7.12; CHT simple-eigenprojector detector and coefficient extension | The scalar subgroup has H⁰(ad⁰) of dimension n²−1, hence fails; a simple eigenvalue gives a rank-one projector rather than the identity rank n. Adequacy/enormousness are not substituted. |
| character-ring-completed-products | DDPA.4.6,6.7–6.8; literal quotient products with characteristic-zero minimal primes, possibly coefficient torsion | The §1.2 square-zero example has nonzero 3-torsion; supplied O-flat product results cannot apply to that literal ring. Dimension formula is the sum of relative dimensions plus 1. |
| paired-cohomology-action-patching | DDPA.8.6; paired residual data at every cutoff with compatible actions and augmentation | Two abstract copies of k are isomorphic as k-spaces, but R=k[t] acting by t=0 and t=1 admits no nonzero R-linear comparison. The requested commuting diagrams are substantive, not generic unmarked isomorphisms. |
| proper-support-boundary-or-residual | AutomorphicSpectralTheory.5.12–5.14; alternatives for actual ordinary-cohomology eigensystems | Speh(σ,2) yields (a,a,b,b) at norm 1; support decomposition by itself does not say a class is on the boundary. The requested dichotomy supplies the missing implication. |
| res-pgl-distinct-eigenvalue-comparison | No named supplier or exact contract | For two primes, §3.7 now needs four block conditions not contained in the original record. Unowned gap record and overbroad consumer statement: R08. |

The requested mechanical command was run on the package README with `--name AutomorphyLiftingBeyondTaylorWiles`, `--order merge-order/ORDER.txt` and `--movable`, using the supplied configuration. Its complete diagnostic output was:

```text
depcheck: 48 roadmaps, 545 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This result does not certify the contents of supplier sections; R03 and R04 are semantic supply defects that a name-level graph cannot detect. No merge-order file was edited.

### Pinned-library audit

Pins were read from `lake-manifest.json`: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The following declarations were opened at those pins. Paths are library-relative.

| Pinned declaration and file | Body/hypotheses checked | Test and limitation |
|---|---|---|
| `Field.absoluteGaloisGroup`, `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42` | Body `AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K`; group and Krull topological-group instances at :43–46 | Native Galois group exists. It does not supply local arithmetic deformation conditions. |
| `Representation`, `Mathlib/RepresentationTheory/Basic.lean:48` | Body `G →* V →ₗ[k] V`, under semiring/monoid/module binders at :44 | Algebraic multiplicativity, not continuity or a Galois local condition. The README explicitly carries continuity separately. |
| `IsHeckeTriple`, `Mathlib/NumberTheory/HeckeRing/Defs.lean:75` | Commensurability and commensurating hypotheses, not arbitrary subgroups with assumed finite sums | Finite double-coset sums require this condition. |
| `HeckeCoset`, same file :157; `HeckeCosetModule`, :183; `HeckeRing`, :189 | Quotient and finitely supported coefficient functions; carrier needs only Zero, convolution is separate | One double coset gives one basis vector. This is not cohomology of an arithmetic quotient. |
| `Module.support_eq_zeroLocus`, `Mathlib/RingTheory/Support.lean:216` | `[Module.Finite R M]` is in scope at :196; membership theorem at :200 | Finite k[ε]/ε²-module k has full support V(ε), not faithful action. README uses the finite hypothesis. |
| `Monoid.PushoutI`, `Mathlib/GroupTheory/PushoutI.lean:60` | Quotient of the monoid coproduct by the amalgamation congruence; group instance and universal lift | Trivial edge group yields the free product, not a direct product. Imported, not redeclared. |
| `groupCohomology.coindIso`, `Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean:58` | Subgroup S≤G, commutative coefficient ring, Rep k S, degree n; no finite-index assumption | At S=G this is the identity coinduction comparison. It is a discrete group theorem, not continuous tower descent. |
| `TauCeti.MonoidAlgebra.augmentation`, `TauCeti/Algebra/MonoidAlgebra/Exactness.lean:115`; `augmentation_single`, :120 | Coefficient-sum ring map on a monoid algebra | [g]↦1, [g]−1↦0; 2[g]+3[h]↦5. This fixes the augmentation convention in §1.4. |
| Hecke sum, `TauCeti/NumberTheory/HeckeRing/Representation.lean:117` | Linear Hecke sum; equivariance/coinvariant descent at :160, with the representation and finite-coset hypotheses | The generic invariant/coinvariant construction is present, not the required all-degree Res PGLₙ arithmetic complexes. |
| `IsDedekindDomain.selmerGroup`, `Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean:161`; elliptic `selmerGroup₂`, `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean:104` | Multiplicative n-th-power classes and an elliptic norm/local-condition subgroup respectively | These are not relative adjoint deformation Selmer groups. A name search for “Selmer” alone would be misleading. |

Object searches at the pins found no arithmetic local/global representing ring, Res PGLₙ Betti complex with the specified levels and Hecke actions, or GLₙ adelic automorphic-representation carrier that makes the listed headlines statable by a few simple definitions. Native matrices, group algebras, cochains and derived categories are useful inputs but do not identify those arithmetic objects. No native support, augmentation, coinduction, or pushout definition is duplicated in the Lean file.

### Shape, headline coverage and Lean checks

The house shape is present: Summary, scope, conventions, exact contracts, build explanation, Layers 0–5, Examples and Dependencies for every layer, downstream consumers and references. Main-branch examples read for comparison were `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md` and `Completed/IntegralLattices/README.md`. Each of the 43 numbered subsections has at least three Checks (minimum 3, maximum 9). The adversarial table above distinguishes real controls from repeated identity Checks; the false or ineffective remaining Checks are R09. The defining sections retain prose APIs. `metadata.toml` contains the consistent topic `math.NT`. No executable algorithm, `set_option`, sorry-defined data, admitted example, or new source-manifest key was introduced or found. The source statements are paraphrases with locators, not copied passages.

| Headline from README | Where | Missing carrier named in the Lean module docstring |
|---|---|---|
| Corrected local-ring comparison, Lemma 8.2 | 1.3 | Literal arithmetic character quotients and completed local deformation rings |
| Numerical coincidence and auxiliary sets, Proposition 8.5 | 1.6 | Relative adjoint Selmer groups, big-image detector, local problems and representing rings |
| Rank-two all-degree Taylor–Wiles comparison, Lemma 9.6 | 3.5 | Arithmetic quotient cohomology, actual level maps/local systems/selected ideals |
| GLₙ distinct-root global comparison | 3.6 | Localized smooth arithmetic tower and its block/derived comparison |
| PGLₙ distinct-root descent | 3.7 | Arithmetic derived cohomology and central-character descent |
| Paired patched arithmetic complexes and maximal-depth top modules | 4.1–5.1 | Decorated finite-cutoff arithmetic data with compatible deformation actions |
| Near faithfulness, Theorem 9.19 | 5.4 | Minimal global deformation ring acting on the actual lowest cohomology dual |
| Smooth minimal R=T and freeness | 5.5 | Arithmetic Hecke image and deformation rings with their module |
| Arbitrary-number-field cuspidal recognition | 5.6 | Adelic automorphic representation and locally symmetric eigenspace |
| Conditional support-to-eigenclass lifting deduction | 5.8 | Arithmetic deformation point and cohomology action |
| Imaginary-quadratic and defect-zero applications | 5.9–5.10 | The same missing arithmetic and automorphic carriers |

All eleven headline categories are named in `Suggested.lean` with their missing carriers. No statable headline was found absent. A bare integer dimension identity would replace, rather than state, Proposition 8.5. The abstract amalgam is a subsidiary input; the GL₁ class-field example is not the roadmap's endpoint. Neither should be added as padding.

`Suggested.lean` has 53 lines, one `import Mathlib`, one module docstring and the requested empty namespace. The prescribed `lake env lean` invocation on its absolute pathname, run from the pinned content checkout, exited 0 with no messages or warnings. There are no TauCeti imports needing a targeted build. There are zero declarations: the mechanical `#check @name` binder audit has zero signatures, and the one-tactic probe has zero sorried theorems. Thus there are no silently lost section hypotheses and no padding to delete. These are empty audited sets, not proof claims inferred from a successful `sorry` build.

## Not verifiable

- The three relevant indexed board heads could not be read through the supplied contents interface: `packages/ArithmeticLocallySymmetricSpacesPartII/README.md` at 84a41ac, `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md` at 948c94c, and `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md` at 7e88c38. Each request returned HTTP 404. Ownership against those exact sibling heads remains unchecked. The index was read first; no claim that these packages do not exist is made.
- CGH20's arXiv v1 text was read. The published appendix's A.2/A.3/A.4 cross-numbering and the separate printed-page reference to p.882 were not independently checked against the publisher text. The manifest explicitly states the version read; no renamed or duplicate source request was made.
- The 2022 correction to CG18 is not a package reference and was not fetched. Its description in DDPA is not treated as an independently read correction; no erratum below claims a verified published correction.
- Sources cited only inside the suppliers or the three papers, rather than by this package, were not independently fetched. The review checks the exact supplied mathematical contracts, not the completion of those future libraries. No package source was unreadable and no new missing-reference request is needed.

## Source issues

The following are paraphrases of errors or unsupported steps observed in the opened passages. They are source issues even where the package has already corrected them. Each “affects” class refers to the source. The values supporting them appear in the tables above.

- **Error** in CG18 at Lemma 8.2(1), printed p.407: the source says the literal character-polynomial deformation rings are p-torsion-free; it should be retain characteristic-zero minimal primes without asserting coefficient flatness of the literal quotient; affects a stated result.
- **Error** in CG18 at Lemma 8.2(3), printed p.408: the source says the character-deformed spectrum is irreducible for its allowed residual data; it should be impose trivial residual data at character places, or retain the different eigenline-assignment components; affects a stated result.
- **Error** in CG18 at proof of Theorem 9.19, printed p.426: the source says the patched rings are p-torsion-free by Lemma 8.2; it should be use characteristic-zero minimal primes and prove torsion-freeness of the maximal-depth patched module; affects the proof.
- **Misprint** in CG18 at §9.2 and Conjecture B, printed pp.413–414: the source says to normalize T_(a,k) by N(a)⁻ᵏ while retaining the displayed characteristic polynomial; it should be use unnormalized operators in that polynomial; affects a stated result.
- **Error** in CG18 at §8.4, equation (1), printed p.406: the source says the trace-only oddness condition gives the balanced archimedean adjoint dimension; it should be require balanced eigenspaces; n=4,p=5 permits scalar trace −1 with adjoint dimension 15 instead of 7; affects a stated result.
- **Misprint** in CG18 at Remark 9.3, printed p.415: the source says duality from H¹ gives compact-support vanishing in degree q₀−1; it should be degree d−1, with d=2q₀+ℓ₀; affects nothing.
- **Error** in CG18 at proof of Lemma 9.6, printed p.417: the source says Γ∩PSL₂(O_F) is the kernel of an elementary-two quotient for arbitrary commensurable component groups; it should be Γ∩PSL₂(F), retaining the component lattice; affects the proof.
- **Misprint** in CG18 at proof of Lemma 9.6, printed p.416: the source says the displayed Gram matrix has determinant T_x²−(N(x)+1)²; it should be (N(x)+1)²−T_x²; affects nothing.
- **Error** in CG18 at proof of Lemma 9.6, printed p.418: the source says the normalized squared operator has augmentation scalar 1; it should be N(x)⁻² for the compatible chain extension with unnormalized augmentation 1; affects the proof.
- **Misprint** in CG18 at proof of Lemma 9.6, printed p.418: the source says H^(i−1)(G) immediately precedes the two vertex terms; it should be H^(i−1) of the edge group, then H^i(G), then the vertex terms; affects nothing.
- **Gap** in CG18 at proof of Lemma 9.6, printed p.418: the source says distinct old roots eliminate the entire new summand at the anemic ideal; it should be localize at the selected U_x-root ideal before using invertibility of U_x²−1; affects the proof.
- **Misprint** in CG18 at proof of Theorem 9.19, printed p.426: the source says degree i of the residual patching complex is dual to H^(i−ℓ₀); it should be dual to H^(q₀+ℓ₀−i), placing lowest arithmetic cohomology in top patching degree; affects the proof.
- **Gap** in CG18 at Conjecture B and proof of Theorem 9.19, printed pp.414–415,427: the source says Conjecture B supplies diamond-image containment for patching; it should be include inertia–diamond compatibility at all coefficient and intermediate-level actions used; affects the proof.
- **Misprint** in CG18 at Theorem 6.3(d), printed p.386: the source says the relevant augmentation image lies in the image of ker φ_N; it should be ker φ_M for the original level, including quotient level N=0; affects a stated result.
- **Gap** in CG18 at proof of Theorem 6.3, printed p.388: the source says cohomology commutes with the arbitrary framing-ideal quotient used to form decorated patch data; it should be supply compatible actions on these nonflat quotient models or justify that base-change equality; affects the proof.
- **Gap** in CG18 at Lemma 7.1 and its use in §9.5, printed pp.392,425: the source says manifold-cover perfect models supply the arithmetic complexes used later; it should be justify localized perfect models when arithmetic stabilizers have p-torsion; affects the proof.
- **Gap** in CG18 at §9.4, printed p.419: the source says the PGLₙ comparison should follow easily from the GLₙ case through circle bundles; it should be prove the central-torus derived comparison, retaining its positive-degree cohomology; affects nothing.
- **Gap** in CGH20 at proof of Theorem 3.2, arXiv v1 p.6: the source says CG18 §9.4 and KT17 Lemma 6.25(4) give the PGLₙ level comparison; it should be prove the PGLₙ comparison and supply the needed local block input; affects the proof.
- **Gap** in CGH20 at proof of Theorem 3.2, arXiv v1 p.6: the source says lowest nonzero cohomology at Y₁(Q) descends by Hochschild–Serre; it should be pass through the p-primary cover or justify trivial prime-to-p deck action on the localized term; affects the proof.
- **Misprint** in CGH20 at Theorem 1.2(1), arXiv v1 p.2: the source says enormous image is defined in CG18 §9.2; it should be CG18 §9.4 in the published numbering; affects nothing.
- **Misprint** in CG18 at §9.1(2), printed p.412: the source says the lower Taylor–Wiles blocks have size N−1; it should be n−1; affects nothing.
- **Misprint** in CG18 at Theorem 5.16(8)(a), printed p.383: the source says the initial representation is r_p(π); it should be r_p(π₀); affects nothing.
- **Misprint** in CG18 at §9.2, printed p.412: the source says the first Hecke map uses gKg⁻¹∩K_Q for general K; it should be gKg⁻¹∩K; affects nothing.
- **Misprint** in CG18 at Theorem 6.4(1), printed p.389: the source says the regular power-series hypothesis concerns R; it should be R∞; affects nothing.
- **Misprint** in CG18 at Definition 9.1, printed p.413: the source says the generators allow arbitrary units at R under the preceding correspondence definition; it should be require α=1 at R or specify the coefficient-character intertwiner; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "4eb2eba9df262693eac847d1e8517032f13a4193", "job": "REV-PKG-AutomorphyLiftingBeyondTaylorWiles~2", "model": "gpt-6-astra", "worker": "chris-7"} -->
