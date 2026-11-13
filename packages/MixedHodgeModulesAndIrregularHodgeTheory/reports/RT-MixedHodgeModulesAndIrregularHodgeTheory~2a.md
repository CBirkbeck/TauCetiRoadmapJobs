<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12984#issuecomment-6861830370 -->
Red team round 2 pass a (codex) of 52c7385

Verdict: needs_changes

1. **F01** (P1) The localized Fourier proof consumes an unbuilt stationary-phase comparison

   **Location:** `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:362`: “by formal stationary phase”.

   **Claim:** The formal normal-form theorem and Fourier exactness named in the Needs line supply the comparison between the local germs of a module and those of its Fourier transform.

   **Witness:** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md`, §RD.6.52a, supplies formal decomposition and lattice pairs, no Fourier comparison. README:1096 explicitly says formal normal form and Fourier exactness do not supply kernel specialization; §9.7 itself needs §2.4.

   **Exact repair text:** Add a named intermediate target inside §2.4, before its slope deduction:

   “For a regular holonomic module M on the affine line, regular at infinity, construct and prove the local-to-global formal Fourier comparison. The transformed module is smooth off the output origin. At output infinity its formal germ is a direct sum of E^{ct} tensored with regular-singular formal connections, indexed by the finite singular points c of M; at output zero the localized transformed module is regular singular. Include punctual summands and extensions, and prove compatibility with morphisms. Construct the local formal Fourier functors and their comparison with the formal germs of the global Fourier kernel here; the formal normal-form theorem alone is not this comparison. Use Sabbah, An explicit stationary phase formula for the local formal Fourier–Laplace transform, arXiv:0706.3570v2, Introduction pp. 1–2 and §5.c pp. 18–19, with §5.d (5.17) for minimal extensions. Translate the negative-kernel convention by t↦−t.”

   Replace “by formal stationary phase” in the proof route by “by the local-to-global formal Fourier comparison just constructed”. Keep §9.7 as the later comparison of unipotent cycle diagrams and nilpotent operators, consuming this earlier target. Record the new source under one key; the legally fetched text is SabStationary line 18, line 34, line 940 and line 1025.

   **Test of repair:** For δ_c, c≠0, the comparison gives E^{ct}, slope 0 at zero and 1 at infinity; for O it gives δ₀, whose localized germs both vanish; for D/D(τ∂τ−a), a∉Z, the Fourier relation is t∂t+1+a, giving slope 0 at both ends. The corrected ownership covers all three without using §9.7.

2. **F02** (P3) Compatible filtrations have no discriminating Checks

   **Location:** `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:473`: “Several filtrations on one object are compatible when all the cubes of intersections and quotients they generate are exact.” Checks are at lines 484–486.

   **Claim:** The Checks test the construction of compatible filtrations, including the explicit warning that pairwise strictness is insufficient.

   **Witness:** All three Checks test a single F, Rees strictness or side change. Three one-step filtrations on C² through the lines Ce₁, Ce₂, C(e₁+e₂) pass pairwise tests but fail joint compatibility.

   **Exact repair text:** Append these three Checks to §4.1:

   - “On C³ let A=span(e₁,e₂), B=span(e₂,e₃), C=span(e₁,e₃), each the intermediate step of a one-step filtration. The common coordinate splitting makes the three filtrations compatible; A∩(B+C)=A=(A∩B)+(A∩C), both of dimension 2.”
   - “On C² take A=Ce₁, B=Ce₂ and C=C(e₁+e₂). Each pair of one-step filtrations admits a simultaneous splitting, but A∩(B+C)=A has dimension 1 while (A∩B)+(A∩C)=0. The triple is not compatible.”
   - “On C² take A=B=Ce₁ and C=Ce₂. The common coordinate splitting makes the triple compatible despite the repeated filtration; A∩(B+C)=A=(A∩B)+(A∩C) has dimension 1. Requiring pairwise distinct steps would wrongly reject it.”

   **Test of repair:** The distributivity values are respectively (2,2), (1,0), (1,1); the second distinguishes the plausible pairwise-only definition and the third retains repeated filtrations. These stay in the README, not Suggested.lean.

No package source files changed; no Lean command run.

## Earlier findings: repair verification

All locations below are in `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md` unless specified otherwise.

| Earlier finding | Status | Repaired passage and recomputed witness |
|---|---|---|
| 1a/F01 | Repaired | Line 490: “`x : V_α M → V_{α−1} M` an isomorphism for every `α < 1`”. At α=0, genuine V gives O→xO bijective; constant U gives O→O with image xO, not surjective. |
| 1a/F02 | Repaired | Line 457: “on a curve with at least one puncture”. Empty-puncture P¹ is expressly retained with H⁰=Q, H²=Q(−1), rather than zero. |
| 1a/F03 | Repaired | Line 1007: “`(a_{D₁} − b_{D₁})(a_{D₂} − b_{D₂})` is negative and smallest”. For 1/x,1/y the product is −1; after y=xu it is 0, with transverse zero u=−1. |
| 1a/F04 | Repaired | `packages/MixedHodgeModulesAndIrregularHodgeTheory/Suggested.lean:56–65` names “Kouchnirenko’s graded acyclicity” and “The constant boundary correction”. For x+x⁻¹ the graded ring is C[x,y]/(xy), quotient dimension 2; the finite map has zero boundary cone. Neither is replaced by a stand-in. |
| 1b/F01 | Repaired | Line 896: “Layer 8: Cohomology of a pair, its weights and its logarithmic models”; lines 677,800,1024 similarly regroup classical objects with structures/filtrations and tg with Fourier cohomology. Former sections map at lines 182–213. Source contents verification recorded below. |
| 1b/F02 | Repaired | Line 550: “on an arbitrary variety `X`, taken with its reduced structure”; line 592: “for every morphism `f : X → Y` of varieties”. Hironaka’s proper nonprojective threefold now has MHM(X); point embeddings in A¹/A² give the same MHS category. |
| 1b/F03 | Repaired | Line 23: “neither constructs the complex-coefficient category or its heart”; line 258 explicitly identifies Perv(X,C) with the heart used by EtaleDualityAndPerverseSheaves. A rank-one Q/C stalk has dimension 1 but infinite cardinality. |
| 1b/F04 | Repaired | Line 78 requests stability alone; “composition, identity, adjunction and proper-duality comparisons on holonomic complexes” are explicitly imported from §9.1. |
| 1b/F05 | Repaired | Line 124: “§4.17 (strict normal crossing divisors)”; line 1022: “SchemeAndStackFoundations §4.17”. The unused curve Riemann–Roch/model contracts are removed. The SNC boundary of (G_m,x) is {0,∞}, with pole multiplicity 1 at ∞. |

## Verified sound

Read all 1,252 README lines and all 165 Suggested.lean lines: 64 bold target paragraphs and the unbolded §1.1 construction, 13 Lean declarations (12 definitions/abbreviations, one theorem), and 222 Check bullets. The computations below cover all 65 target paragraphs and all 13 Lean declarations. They are tests, not proofs of the analytic theorems. The two new findings concern prerequisites and Checks; the earlier nine findings are repaired. No new false headline theorem was established.

### Computed target ledger

All section numbers refer to `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md`. Each row gives concrete values, including negative controls. Positive-characteristic coefficients, zero coefficient rings, arbitrary nonseparated spaces and inseparable extensions are outside the fixed complex/rational hypotheses; they are not silently added to the domain. Empty supports, zero objects, dimension zero, nonreduced supports, identity maps and nonproper maps are tested where meaningful.

| Target | Instances and computed values on the two sides | Result; change |
|---|---|---|
| 1.1, line 221 | xy:A²→A¹ has fibres C× at 1 and two axes at 0. G_m→A¹ has point/empty fibres after the relative completion A¹. Rotation gives dρ=−2xy+2xy=0, dilation gives 2ρ≠0. | Distinguishes map stratification, relative compactification and control. |
| 1.2, line 232 | On pt, dual Q² has dimension 2 and double dual dimension 2. On A¹, ordinary ranks (H⁰,H¹,H²)=(1,0,0), compact ranks=(0,0,1). RΓ_{0}=Q[−2], RΓ_∅=0. | Support and duality degrees agree. |
| 1.3, line 250 | Q[1] on a curve has stalk degree −1 and costalk degree 1, meeting j≤−1 and j≥−1 respectively. Q without shift fails the stalk condition. On the node Q_D[1] has origin stalk rank 1, normalization rank 2. | Perversity and reduced-divisor scope survive. |
| 1.4, line 268 | Constants: (ψ,φ)=(Q,0); skyscraper: (0,Q). For t², ψ has ranks 1,1 at eigenvalues ±1. For J²=0, log(1+J)=J and var·can=J/(2πi); log(T)/(T−1)=1−J/2. j_! gives var·Nφ=0 despite Nφ≠0; j_* gives var·Nφ≠0. | Both directions of the variation iff hold on the two nonzero-block models. |
| 1.5, line 288 | pDR(O_A¹)=C[1], pDR(δ₀)=C₀. E^t has algebraic H⁰=H¹=0, whereas O has H⁰=C, although analytic flat bundles agree. | Boundary regularity is necessary and present. |
| 2.1, line 310 | D_f(1)=c, D_f(t)=1+ct for f=ct; D_0=d/dt. E^t⊗E^{−t} has differential d. At infinity ∂x(e^{1/x})=−x⁻²e^{1/x}. | Twisting, pullback and dual signs agree. |
| 2.2, line 328 | FTδ₂=E^{2t}, FT²δ₂=δ_{−2}; FTO=δ₀ and FTδ₀=O. [τ,−∂τ]=1. | Detects missing involution and shift. |
| 2.3, line 345 | δ₂⋆δ_{−2}=δ₀ and E^{2t}⊗E^{−2t}=O. O⋆O has O in degree −1; δ₀⊗ᴸδ₀ has its nonzero Tor in degree −1. Zero factor gives 0. | Derived rather than ordinary tensor is essential. |
| 2.4, line 362 | δ₂ gives E^{2t}, slopes (0,1); j_+O_Gm gives output O_Gm, slopes (0,0); j_!*O_Gm gives output 0. E^{1/τ²} has input slope 2 and is excluded. | Statement survives; proof prerequisite S01. |
| 2.5, line 380 | D(FTδ₂)=E^{−2t}=r_+FT(Dδ₂); omitting r gives E^{2t}. For O both sides δ₀; applying twice gives E^{2t}. | Duality and biduality signs agree. |
| 3.1, line 402 | Q: weight 0, F⁰=C,F¹=0. Q(1): weight −2,F⁻¹=C,F⁰=0. Moving line C(1,t) has derivative (0,1) outside it. Rank-one Q stalk has dimension 1, infinite cardinality. | Flat W and coefficient dictionary distinguished. |
| 3.2, line 420 | T=−1 gives Ψ₁=0, Ψ_{−1}=C and N=0. Tate block logT(α)=−β has weight ranks 1 at 0 and 2; Q(α,−logT α)=1 versus Q(α,logT α)=−1. Constant gives original weight w. | Full nearby space and polarization sign pass. |
| 3.3, line 431 | Weights −2,0 with Ne∈W_{−2}: M=W works. Weights −1,0 force M_{−2}=0, yet Ne≠0, so fail. Moving extension at infinity has graded F⁰ ranks (1,0) rather than (0,1); split extension gives (0,1). | Independent admissibility conditions and boundary are necessary. |
| 3.4, line 451 | Constant on punctured P¹: H^i(P¹,j_*Q) ranks (1,0,1), weights 0,2. On genus g compact curve H¹ rank 2g, weight 1. Nontrivial sign monodromy on G_m gives all j_* cohomology 0. Empty punctures give ranks (1,0,1). | Repaired nonempty-puncture Check passes. Analytic L² assertions remain waived-source dependent. |
| 4.1, line 473 | Shifted identity F(source) starting 1, F(target) starting 0: filtered cokernel=0 but Rees cokernel=C[z]/z, killed by z. Equal starting indices give Rees cokernel 0. Constant right module on A¹ starts −1; δ left image starts +1. Three-line cube gives 1≠0. | Rees shifts pass; compatibility Checks need S02. |
| 4.2, line 490 | O: gr₀=C,gr₁=0; δ: gr₀=0,gr₁=C. Constant U gives all gr=0 but x:O→O not onto. Residue Ae₁=e₀ gives Ne₁=−e₀; var_top(x⁻¹e₁)=−2πi e₁−2π²e₀. | New isomorphism axiom rejects U; nilpotent and variation signs agree. |
| 4.3, line 511 | Constant on A¹ has weight 1, dual weight −1. Point Q(1) has weight −2. Tate-block ψ primitive form and φ form both evaluate +1 with −N, versus −1 with +N. | Normalizations agree; nonpolarizable weight-one Q⁴ is excluded. |
| 4.4, line 530 | Trivial local system on G_m: j_!* gives pQ_A¹; j_* has quotient δQ(−1). Sign monodromy gives ker(T−1)=coker(T−1)=0, so all three extensions agree. Mixed Kummer extension class is nonzero. | Pure strict support does not imply mixed splitting. |
| 4.5, line 540 | P¹→pt yields Q,Q(−1) in degrees −1,1, weights 0,2=1±1; ample ℓ identifies Q with Q(−1)(1)=Q. Blowup A² adds δQ(−1), weight 2. Open G_m has weights 1,2. | Relative Lefschetz twist and properness distinction pass. |
| 4.6, line 550 | Point Q(−1): W₂=Q,F¹=C. Point in A¹ versus A² gives the same category of MHS. Spec C[ε]/ε² reduces to pt. Node embeddings in A²/A³ both contain Q_D[1]. Nonprojective proper threefold now has local MHM representatives. | Repair extends carrier without changing reduced-support theory. |
| 4.7, line 570 | δQ→K has image W₀K and quotient pQ. Tate extension has W_{−2}∩F⁻¹=C, the image of Q(1). End_Q(Q)=Q versus End_C(C)=C. | Rational and simultaneous strictness retained. |
| 5.1, line 592 | id_pt gives identity. DpQ_A¹=pQ_A¹(1) has weight −1. Diagonal tensor on d-fold gives Q[2d]=pQ[d]. P¹ affine-cover Čech gives H⁰=Q,H¹=0,H²=Q(−1). | General gluing matches projective construction. |
| 5.2, line 610 | G_m ordinary H¹ weight 2≥1; compact H¹ weight 0≤1. DQ(−1)=Q(1), weight −2. Q[−1] has bound ≤−1 and its dual Q[1] has bound ≥1. Smooth proper threefold H^{j+3} has weight j+3. | Bounds reverse under duality and retain cohomological shifts. |
| 5.3, line 623 | Smooth weight-m curve variation gives ψ weight m=(m+1)−1. Punctual V gives ψ=0,φ=V. Sign monodromy gives full nearby rank 1, unipotent rank 0. | Both weight centres and full-eigenvalue rank check pass. |
| 5.4, line 640 | Constant costalk Q(−1)[−1] has H¹=Q(−1), stalk Q[1] has H^{−1}=Q. δV has costalk H⁰=V. A 2×2 Jordan block has rank N=1 and cokernel rank 1. | Costalk formula and smooth special case agree. |
| 5.5, line 650 | Point divisor in A¹ gives kernel δQ of j_!pQ→pQ. Node in A²: complement retracts to (S¹)², costalk ranks 2 at 0 and 1 at 1; false smooth formula gives rank 1 only at 0. | Smoothness restriction is necessary and retained. |
| 5.6, line 660 | Constant pQ_X gives V=Q and evaluation identity. Kummer has rank(T−1)=1, hence excluded. Trivial-local-system extension has classes 0 at x=0 and i at x=i in C/Q, fails boundary admissibility. | Constancy does not follow from the local system alone. |
| 6.1, line 683 | RΓ(pQ)=Q[1], RΓ(δQ)=Q, RΓ(K)=cone(Q→Q)=0, RΓ(0)=0. | EMHS admits K, excludes its ambient nonzero punctual subobject. |
| 6.2, line 699 | ΠδQ=K, ΠpQ=0, ΠK=K; Π² has identical values. η:δQ→K has constant cokernel pQ, while η on K is identity. | Reflector/unit claims agree. |
| 6.3, line 716 | K⊗_E K=K, E⊗_E0=0; Πδ₂⊗_EΠδ_{−2}=Πδ₀=K. | Unit and additive convolution agree. |
| 6.4, line 733 | K has ambient graded weights 0,1 but exponential sole weight 0; ΠW₀K=K and ΠW₁K=K. ΠδQ(1) has exponential weight −2. | Presentation by δQ versus K gives equal W^E. |
| 6.5, line 750 | ωpQ=0, ωδ_aV=V_C, ωK=C. ∂+1 on C[t] has zero kernel/cokernel; δ contribution has one-dimensional cokernel. | Faithfulness is asserted only on EMHS. |
| 6.6, line 767 | FTΠδ₀=FTK=O(*0)=(FTδ₀)(*0). FTΠO=0=δ₀(*0). Input localization instead gives δ₀(*0)=0, losing K. | Correct coordinate retained. |
| 6.7, line 777 | φ₁I(Q)=Q and ωI(Q)=C. Πδ₂ has ω dimension 1 but φ₁ at 0 dimension 0; FT is E^{2t}(*0), nonconstant. | Criterion excludes translated classical-looking line. |
| 7.1, line 806 | δQ(−1): F¹=C,F^{3/2}=0; pQ: every fibre step 0. Infinity operator applied to 1 is −x⁻². | Ceiling and sign agree with local formula. |
| 7.2, line 823 | z∂θ+τ=−zx²∂x+τ; τ=z gives z(∂θ+1), τ=1 gives z∂θ+1 instead. δQ has F⁰=C,F^{1/2}=0 and retains α=0. | Specialization and eigenvalue-one endpoint pass. |
| 7.3, line 833 | Metric exponent a=1/2,index b=1/4: growth exponent ceil(b−a)=0, canonical ceil(b)=1. At a=0 both equal ceil(b). Trivial P¹ twistor has direct-image weights −1,1, versus Hodge weights 0,2. | Deligne-type and normalization distinguish the objects. |
| 7.4, line 850 | δQ: filtered maps C→C or 0→C, injective; pQ after exponential localization gives 0→0. Termwise (d+dθ)(1)=dθ≠0. | Degeneration does not imply zero differential. |
| 7.5, line 860 | δQ→K→pQ gives fibre C→C→0, first map identity at F⁰; F¹ terms all 0. | Mixed extension agrees with strict fibre sequence. |
| 7.6, line 870 | η:δQ→K gives identity on W₀∩F⁰=C; at F¹ both 0. pQ→j_*pQ gives image 0=im(a)∩W∩F. | Both filtrations and intersection are tested. |
| 7.7, line 880 | Q(−1): F¹=C,F^{3/2}=0; Q: F⁰=C,F^{1/2}=0; nonsplit Tate extension: dimensions F⁻¹=2,F⁰=1,F¹=0. | Equals classical F^{ceil λ}. |
| 8.1, line 902 | pt,0 gives I(V) in degree 0 only. A¹,t gives 0 in all degrees. A¹,0 gives ordinary I(Q) at 0, compact I(Q(−1)) at 2. | Shift r−d passes d=0,1. |
| 8.2, line 919 | Punctual coefficient on d-fold contributes only in unshifted degree d. G_m,x gives dim H¹=1 on both sides; A¹,x gives all 0. | Supported coefficients retain ambient dimension shift. |
| 8.3, line 929 | Compact G_m,x line weight 0 pairs with ordinary G_m,−x line weight 2 into Q(−1). Same-sign cup product lands in H²_c(G_m,2x)=0. A¹,x times any constant pair gives 0. | Sign and Tate trace agree. |
| 8.4, line 939 | G_m,x: gr¹ compact=ordinary=0 and middle=W₁ordinary=0. A¹,x²: both central lines weight 1, comparison identity. | Both sides of iff hold in zero and nonzero instances; source duality proof checked. |
| 8.5, line 949 | Remove {0} from (A¹,x): compact sequence gives H¹_c=I(Q), ordinary gives H¹=I(Q(−1)). Node requires support ranks (2,1), not smooth purity rank 1. | Localization degrees and singular boundary pass. |
| 8.6, line 959 | k=0: I(Q)→I(Q) identity. k=1: I(Q)→I(Q(−1)) zero. k=2: dimensions 1,1 and jumps 0,2; 2!vol(simplex)=2·1/2=1. | Zero-factor boundary exception is necessary. |
| 8.7, line 969 | pt,0: F⁰=C,F^{1/2}=0. x²,q=1,λ=1/2: floor(2(1−1/2))=1, versus 0 for x. G_m,x has compact twist −{0}, retaining ∞. | Multiplicity and horizontal-support conventions pass. |
| 8.8, line 986 | z/x blowup: charts give z′ and 1/x′, exceptional pole multiplicity 0. P¹ O(−1) has (h⁰,h¹)=(0,0); O(−2)=(0,1); O(1)=(2,0). | Exceptional sign and vanishing interval pass. |
| 8.9, line 997 | A¹,x all filtered groups 0. G_m,x ordinary jump 1, compact jump 0; A¹,x² jump 1/2. | Comparisons retain rational steps. |
| 8.10, line 1007 | x²⊞y² jumps 1/2+1/2=1. G_m,x: ann F⁰_c=0=F^{>1}, ann F^{1/2}_c=C=F^{>1/2}. For 1/x,1/y pole differences 1,−1 have product −1, after blowup 0. | Endpoint and repaired blowup rule agree. |
| 9.1, line 1030 | V=pt,g=0 gives Q at ordinary degree 0 and Q(−1) at compact degree 2; g=1 gives 0. g=x² has reduced zero set pt and the same support groups as x. | No hidden smooth-zero-locus condition. |
| 9.2, line 1040 | g=x on A¹: ordinary/compact H²=Q(−1). g=0 on pt: ordinary H⁰=Q, compact H²=Q(−1). g=xy: H²_Z=Q(−1)²,H³_Z=Q(−2). | Purity used only for smooth divisor. |
| 9.3, line 1050 | δ₀V: Fourier H⁰=V; pQ: Fourier H¹=Q(−1); δ₂V: all Fourier cohomology 0 since ∂+2 is bijective on C[t]. | Pair-degree j+1 passes. |
| 9.4, line 1066 | K has costalk Q in degree 0,Q(−1) in 1; FTK=O(*0) has de Rham ranks 1,1. Constant has only costalk degree 1, punctual only 0. | Costalk, not stalk, matches. |
| 9.5, line 1076 | Smooth pQ of weight 1 gives H¹ weight 2 and Hodge jump 1; size-two unipotent block gives coker N dimension 1 versus generic rank 2; δV has nonzero H⁰ and is excluded. | Smoothness and no-punctual-summand conditions distinguished. |
| 9.6, line 1086 | δQ weight 0 gives correction pQ ambient weight 1 and Fourier H¹ weight 2. Sign-monodromy middle extension has correction 0. | The l−1 shift is necessary. |
| 9.7, line 1096 | O: output φ₀ rank 1=input ψ∞ rank 1. δ₂: both 0. D/D(τ∂τ)² gives N_input=τ∂τ and N_output=−(t∂t+1), matching under Fourier, each rank 1 and square 0. | Underlying comparison signs pass; not the missing formal comparison of S01. |
| 9.8, line 1107 | δQ: ψ∞ΠM=Q weight 0=w, correction ambient weight 1. Blocks lengths 1,3 give primitive indices 0,2 and corrections w+2,w+4. | All primitive pieces, rather than one block, are retained. |
| 10.1a, line 1131 | n=1,φ=x: D(x^m)=mx^m+x^{m+1}. n=2,φ=0: cohomology ranks (1,2,1); for xy, correct d²=xy−xy=0, all-plus gives 2xy. n=0: C in degree 0. | Real definitions preserve grading and signs. |
| 10.1b, line 1146 | x: Δ=[0,1],h(m)=m for m≥0. x+x⁻¹: Δ=[−1,1],h(m)=abs(m). (x+y)² face derivatives at (1,−1)=(0,0). Empty face excluded; n=0 point has volume 1. a=−1 section identity would be 0≠C and is excluded. | Nonemptiness, torus nonzero coordinates and nonnegative scaling all matter. |
| 10.2, line 1164 | x² gives quotient C[x]/x² with Hilbert polynomial 1+t^{1/2}, value 2 at 1. x+x⁻¹ gives graded C[x,y]/xy, quotient by x−y of dimension 2. Degenerate (x+y)² has common factor and nonzero H¹. n=0 gives C. | Associated graded differs from cone algebra; dimension formula survives. |
| 10.3, line 1177 | n=0: finrank 1=0!·1. x: 1=1!·1; x+x⁻¹: 2=1!·2; x+y: 1=2!·1/2. x on two-torus has H¹=H²=C but affine dimension 1<2. | Lean headline matches generality and boundary conventions. |
| 10.4, line 1187 | x on G_m gives jump 1 from h(0)=0; x² gives basis classes 1,x with jumps 1,1/2; x+x⁻¹ gives jumps 1,0. | Filtration bounds do not imply independence of all monomials. |
| 10.5, line 1197 | x+x⁻¹ is finite of degree 2, boundary cone 0, central rank 2. x has nonconvenient Δ=[0,1], compact/ordinary weights 0,2 and comparison 0. x+y+(xy)⁻¹ has normalized volume 3. | Convenience separates the counterexample without implying properness in higher dimension. |

### Lean declaration/context ledger

All declarations lie in namespace `TauCetiRoadmap.MixedHodgeModulesAndIrregularHodgeTheory`, Layer 10. There are no section variables or universe declarations; all carriers are in Type 0, the scalar field is C, and scalar/module/measure instances are the native ones. The supplied elaboration file was compared declaration by declaration with the complete source and README. No binder was lost. No fresh elaboration or build was run, in accordance with the read-only instruction.

| Declaration, line | Explicit context; computed tests | Result |
|---|---|---|
| LaurentRing, 77 | n:Nat. n=0 gives C; n=1 gives C[x±1]; n=2 gives C[x±1,y±1], x·x⁻¹=1. | Native additive monoid algebra specialization. |
| eulerDerivation, 81 | {n}, i:Fin n; C-linear. θ(1)=0, θ(x³)=3x³, θ(x⁻²)=−2x⁻². n=0 has no i. | Finsupp coefficients and integer cast correct. |
| twistedEuler, 89 | {n},φ,i. φ=x: D1=x, Dx= x+x², Dx⁻¹=−x⁻¹+1; φ=0 gives θ. | Multiplication is by θφ, not φ. |
| twistedDifferential, 97 | {n},φ; all subset families. n=2: dω_{01}=D₀ω₁−D₁ω₀; empty output sum 0; d²(xy)=0, all-plus 2xy. | Degree increases exactly one. |
| forms, 105 | n,q:Nat. n=2: q=0,1,2 have 1,2,1 coefficient slots; q=3 gives 0; n=0,q=0 gives C. | Out-of-range degrees vanish. |
| cocycles, 109 | {n},φ,q. n=1,φ=0,q=0 gives C·1; φ=x,q=0 gives 0; q=1 gives all one-forms; q>1 gives 0. | Intersection with forms is necessary. |
| coboundaries, 115 | {n},φ,q. q=0: no p+1=0, hence 0. q=1: range(D). n=0: all boundaries 0. | Avoids natural subtraction junk at zero. |
| topCohomology, 122 | {n},φ; C-module quotient by supremum of linear ranges. φ=x,n=1 gives dimension 1, φ=x+x⁻¹ gives 2, n=0 gives C. | Quotient is not the ideal generated by D(1). |
| latticePoint, 126 | {n},m:Fin n→Z. Exponents −2,0,3 map to −2,0,3 in R; n=0 unique vector goes to unique vector. | Negative coordinates retained. |
| newtonPolytope, 129 | {n},φ. φ=0 gives {0}; x² gives [0,2]; x+x⁻¹ gives [−1,1]; constant term changes none. | Insertion of 0 handles zero support. |
| faceEulerEval, 135 | {n},φ,σ,j,z; negative powers totalized by C. x⁻¹ at z=2 gives −1/2; at z=0 gives 0 but that z is excluded by nondegeneracy. Empty face gives 0. | Torus restriction is carried by the predicate. |
| IsNewtonNondegenerate, 145 | {n},φ. x and x+x⁻¹: True; (x+y)²: False at (1,−1); constants: True since no admitted face. n=0: True. | Empty face and origin-containing whole face excluded. |
| twistedDeRham_concentration_finrank, 157 | {n},φ,hfull,hnd. n=0: 1=1; n=1,x²: 2=2; n=2,x+y: 1=1. Constant n=1 has H⁰=C but hfull=False. q>n: cocycles=boundaries=0. | Both hypotheses survive elaboration; conclusion includes finite dimensionality explicitly. |

The headline inventory is regular Riemann–Hilbert; Zucker's curve theorem; Saito's strict-support, projective image, abelianness and Hodge operations/weights; exponential projector/tensor/weights/fibre; Deligne degeneration and bifiltered strictness; tg classicality and zero-locus formula; Fourier costalks/Hodge numbers and monodromy weights; logarithmic model independence and filtered Künneth/duality; Newton graded acyclicity, concentration/volume, Newton–Hodge comparison and constant boundary correction. The module docstring now accounts for the missing carriers in all these families. The statable concentration/volume headline is present. The 12 definitions are used transitively by it, and the single theorem is not obtainable by a one-tactic/library-lemma probe. No padding theorem, admitted data, set_option, lemma command, free Prop surrogate, or conclusion-as-hypothesis was found.

### Supplier, ownership and pin audit

The supplier contracts were resolved against main where present and the supplied open heads otherwise. The following table records 18 supplier groups; grouped ranges include the individually named sections, rather than treating a roadmap title as a contract.

| Supplier and repository-relative README locator | Contract compared; boundary test |
|---|---|
| TauCetiRoadmap/SpringerResolutionAndCharacteristicCycles/README.md, §§8.2–8.5,9.1–9.7, lines 855–1102 | Filtered algebraic D-modules, transfers, holonomicity and the three regularity closures. Identity transfer has shift 0; point direct image has x∂δ=−δ. The two additional stability/specializability contracts remain declared gaps. |
| TauCetiRoadmap/ComplexComparisonPartII/README.md, §§C-1.1,C5.1,C5.6,C6.0,C6.1 | Algebraic analytification and differential operators; canonical extension has T=exp(−2πi Res); compact supports allow Q/C, while its finite-stalk dictionary does not. Residue 1/2 gives monodromy −1; a Q stalk is infinite as a set. |
| TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md, §§3.5,5.9 | These use the analytic heart/comparisons, not a second construction of rational/complex constructible coefficients. The ownership repair names the common heart. |
| TauCetiRoadmap/FormalConnectionsOpers/README.md:707, §F2.2 | Lie–Rinehart PBW requires a projective tangent module and characteristic zero for comparison with ordinary differential operators. On A¹, gr D=C[x,ξ], [∂,x]=1. |
| TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md, §§RD.6.52a,RD.6.53 | Characteristic-zero formal decomposition, good lattice pairs and curve index apply at C. On G_m, E^{x+x⁻¹} has rank 1, Euler characteristic 0 and total irregularity 2, so χ_dR=−2. No local/global Fourier comparison: S01. |
| TauCetiRoadmap/ShimuraData/README.md:355,386,417, §§3.1–3.3 | Pure real/rational variations, morphisms and rational polarization. The roadmap's mixed structures add flat W and pure graded pieces. |
| TauCetiRoadmap/ShimuraVarieties/README.md:962,974, §§3.5b.1–3.5b.2 | Integral-lattice, unipotent-cover and norm hypotheses retained. The inverse period-lift monodromy is distinguished from horizontal transport; a quasi-unipotent rational matrix has a stable lattice. |
| TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md, §§1.3–1.5,1.7,3.4 | Monodromy filtration, primitive decomposition, relative uniqueness, normalized maps and pencils. A rank-two nilpotent block centred at 1 has weights 0,2. Relative existence is not imported from uniqueness. |
| TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:791,801,893, §§5.1,5.2,6.2 | Principalization, embedded resolution and SNC compactification; projective compactification is used for quasi-projective inputs. General varieties instead use Nagata and local ambient embeddings. |
| TauCetiRoadmap/EtaleCohomologyFoundations/README.md:57,105, §§G.1–G.2 | Compactification of a separated finite-type map over qcqs base, with dense replacement. G_m→A¹ compactifies through id_A¹, not a map P¹→A¹. |
| TauCetiRoadmap/StratifiedSpacesAndTameTopology/README.md:936,957, §§7.2–7.3 | Definable finite-differentiability and semialgebraic Nash stratifications. The algebraic-map refinement remains this roadmap's §1.1. |
| TauCetiRoadmap/AlgebraicTopologyPartII/README.md:1539,1571,1596,1617,1647, §§16.1a–16.1e | Whitney (b), control data, compatible lifts, proper controlled isotopy. dρ(rotation)=0 and dρ(radial)=2ρ. |
| TauCetiRoadmap/EnhancedDerivedSheaves/README.md:429,441,455,492,580, §§0.1–0.4,E1.4 | Ringed-site derived module categories and formal operations. Proper-support exchange equivalences still require geometric hypotheses, supplied/constructed in Layer 1. |
| TauCetiRoadmap/SchemeAndStackFoundations/README.md:1669,4184,4357,5030,5380,6824,6921,7411,8166 | §§0.17,2.2,2.6,2.18,2.20,4.11,4.12,4.17,5.5: depth, cohomology, duality, modifications, Chow, SNC and normal bundles. Smoothness of the blow-up is a separate declared gap. |
| TauCetiRoadmap/SchemeKTheoryOperations/README.md:1973, §5.7 | Koszul-regular exceptional bundle, O(−E)|E=O(1), negative-twist vanishing for 1≤μ≤c−1. For c=2, μ=1 both cohomology groups vanish; μ=2 gives H¹=C and is excluded. |
| Completed/AnalyticToricGeometry/README.md:186, Layer 0 | Lattices, cones, fans and fan schemes, largely pinned implementations. Zero-cone fan gives the torus; the dimension-zero complete fan gives a point. |
| TauCetiRoadmap/AnalyticToricGeometryPartII/README.md:117,143,166, §§0.1–0.3 | Invariant divisors and monomial sections. On P¹, D=dD_− gives weights 0≤m≤d. Normal fan/refinement and rounded nef vanishing are additional declared gaps. |
| TauCetiRoadmap/GroebnerGeometry/README.md:103, §G2 | Affine semigroups and normality versus saturation in their generated lattice. Cohen–Macaulayness is additional, not asserted to follow merely from normality. |

All seven gap slugs agree between README and design/plan.json. Each names an earlier supplier and specifies hypotheses. Their linked outputs are coherent single interfaces (specializability, regular stability, normal-fan/divisor construction, rounded vanishing, smooth blow-up, local-system dictionary, semigroup Cohen–Macaulayness). None is reported merely because the supplier has not yet implemented it. The repaired regular-stability and blow-up contracts no longer duplicate the existing comparison and exceptional-bundle APIs.

The overlap leads were read at the named heads. SheafConvolutionOnAbelianVarieties owns abelian-variety Fourier–Mellin/Mukai transforms and convolution, not affine-line Fourier–Laplace or MHM. MappingClassGroupsAndCanonicalRepresentations explicitly owns real mixed variations and complex variations without quasi-unipotence (README:62–69); this package fixes rational coefficients and quasi-unipotent boundary behavior. KloostermanSheavesAndBesselIsocrystals owns the reductive-group eigensheaves, arithmetic companions and their connections, not the general irregular Hodge filtration. Lefschetz and étale owners are distinguished in the supplier table. The general rational Hodge-module/exponential theory therefore belongs here; object searches did not establish another owner.

The open content proposal for this same roadmap is the earlier version of this package. It must be updated/rebased to this reviewed package before merge, rather than merged independently. Main has no second copy of this roadmap. The overlap record reports no dropped citation ids and no dependency on numbering defined only by an open revision; the explicit former-numbering tables retain the moved ids.

At the pins, Mathlib's AddMonoidAlgebra.coeffLinearEquiv (Mathlib/Algebra/MonoidAlgebra/Module.lean:73) is the coefficient equivalence, not twisted cohomology; IsExposed (Mathlib/Analysis/Convex/Exposed.lean:55) permits both the empty face and the zero functional, exactly the cases excluded explicitly by the nondegeneracy predicate. ZLattice.covolume.tendsto_card_div_pow (Mathlib/Algebra/Module/ZLattice/Covolume.lean:318) counts lattice points asymptotically; it does not identify a twisted quotient or prove acyclicity. The near-matches for finite dimensionality and ordinary polynomial Euler identities likewise do not prove the acceptance theorem. TauCeti/Algebra/WordFiltration/AssociatedGraded.lean constructs word-filtration graded rings, not the rational Newton-face complex required by §10.2. No pinned Hodge-module/irregular-Hodge carrier was found. The fully qualified namespace/headline search returned only the earlier content proposal for this same roadmap, not an independent owner.

TauCeti/Geometry/Hodge/Mixed/Basic.lean:75 carries finite filtrations but does not impose finite dimension on the underlying group; the README adds finite dimension and graded polarizability explicitly. TauCeti/Geometry/Hodge/Mixed/Strictness.lean:88 already proves strictness for sums of Deligne pieces: choosing p≤r and r+s≤k gives the point-case intersection strictness, correctly imported rather than replanned.

All 11 changed paths in `git diff --name-only origin/main...HEAD` lie inside this package. The mechanical dependency command returned:

```text
depcheck: 239 roadmaps, 2175 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. This checks cross-roadmap direction, not the internal missing prerequisite S01.

### Source locator and expression audit

The table records 57 locator comparisons, with ranges grouped where the README cites one connected argument. It does not certify unread passages of an entire chapter. The 222 Check bullets were read against their section formulas; the explicit numerical/sign/degree witnesses are consolidated into the 65 target rows above, with another 13 rows for the Lean declarations. The supplier audit covers 18 groups of citations. Source passages were read in the legal cache; no source passage is reproduced here.

| Source | Comparisons | Locators and supporting source lines; result |
|---|---:|---|
| FSY | 16 | Proposition 2.4 (460); A.1 Fourier/convolution (2740–2791); A.2 side change (2800), duality (2832), Example A.2 (2848–2871), Example A.3 (2872); (A.5) projector (2900); (A.7)–(A.9) fibre (2930–2955); Proposition A.10 (2949), Lemma A.12 and Proposition A.13 (2970–2990); (A.14)/Definition A.18 and (A.16)–(A.17) (2994–3020); Proposition A.19 (3024–3045); Theorem A.24/Example A.27 (3090–3225); Theorem A.30/Corollary A.31 (3241–3270). Signs and scope compared, with source errors listed below. |
| Sai90 | 6 | Introduction (66–104); §2.13 local representatives (1059); §2.17 admissible local gluing (1230); §4.2 locality (3217–3325); §§4.3–4.4 derived operations (3358,3426); §§4.5–4.6 weights/duality (3513,3656). General separated varieties, not only quasi-projective varieties, are supported. |
| Sai88 | 3 | Polarization/dual twist (138); compatible subobjects and distributivity §1.2.15 (739); projective direct image §5.3.1 (4017). Right/left conventions require the package's stated translation. |
| ESY | 4 | Definition 2.2.2 (1018); (3.1.1)/Proposition 3.1.2 (1100–1170); Theorem 3.3.1 (1307); Remark 3.3.2/Lemma 3.3.3 (1325–1360). Strict V and Deligne comparison have the endpoint/τ=z conditions retained. |
| Yu | 6 | Lemma 1.6 (378); Theorem 1.7 (473); Theorem 2.2 (711); Newton definition/Theorem 4.1/Corollary 4.2 (1338–1437); Proposition 4.3 (1423); Theorem 4.6 (1663). Full dimension and nondegeneracy suffice for the last theorem; convenience does not imply properness. |
| CY | 2 | Theorem 1 (24–56); §3.1 blow-up selection (345–401). The repaired signed difference, not the old cross product, is the quantity minimized. |
| AS | 3 | Theorem 4.1 (385–449); Theorem 4.13 and Theorem 5.1 (565–594). Cone algebra versus full Laurent algebra and the r=a=0 specialization compared. |
| KS | 4 | §4.4 Definition 11 (1211); Definition 12 (1229); Proposition 3 (1235); Proposition 4 with Lemma 1 (1278). Exponential weights are not the ambient weights; the proof's reversed ambient weights are not copied. |
| MT | 2 | Proposition A.3 (2046–2069); Lemma A.4 and cycle diagram (2108–2132). Weight centre w versus w−1 and the Fourier sign/involution compared. |
| Sab05 | 3 | §1.3.c harmonic/Rees identification (992); §5.2.c/e Deligne-type and minimal-extension construction (5345,5402); Theorem 6.1.1 (6405). Regularity and twistor weight-zero normalization retained. |
| Sab10 | 2 | Theorem 6.1 (1360); Proposition 6.10 (1554–1590). Negative exponential kernel translated; τ−z quotient retained. |
| SY15 | 1 | Theorem 1.3(4) (93–98): projective direct image and pulled-back meromorphic function, not arbitrary unrelated functions. |
| Sab18 | 1 | Theorems 0.2–0.3 (180–205): exponential embedding, bistrict morphisms and projective strictness; cited as corroboration, not as an unowned replacement proof. |
| Kash86 | 1 | §1.6–1.9 (78–107): graded polarization, quasi-unipotence, relative monodromy and locally free extended bigraded pieces are separate requirements. |
| Kash84 | 1 | §§6–7 (1101–1177): analytic derived regular-holonomic correspondence; algebraic descent uses the additional named regular-singular and stratification suppliers. |
| DL | 2 | §§3.3–3.7 (251–297); §3.9(c) (331–339). Boundary strata, not the zero-cone open stratum, have no critical fibres; finite-field tame constancy is replaced by simple connectedness over C. |

Five further expression comparisons, beyond those target/source comparisons:

| Package passage | Source compared | Result |
|---|---|---|
| README:44, side-change convention | FSY line 2800 | A corrected increasing-filtration formula with a separate point-image test; no copied exposition. |
| README:750, fibre faithfulness proof route | FSY lines 2930–2955; KS §4.3 | The package supplies the rank-zero/Kashiwara/inversion argument and states its dependencies, rather than repeating the source's exposition. |
| README:833, Deligne-type remark | Sab05 lines 5345–5352 | Same defining mathematical condition, expressed using growth in the given metric; the common technical name and equation are unavoidable. |
| README:1007, product-model proof route | CY lines 345–401 | The repaired selection is stated through pole-order differences and checked on 1/x,1/y; the procedure is the geometric blow-up proof, not a computational algorithm. |
| Suggested.lean:151–164, headline docstring/signature | AS lines 565–594 | Native Laurent algebra, degree-zero convention and explicit finite-dimensional conclusion; no matching public-formalization text was found in the ownership search. |

No copied nonmathematical sentence, table, figure or exercise collection was identified in these comparisons. Formulas, conventional terminology and unavoidable hypothesis lists are not counted as copied expression.

For the arrangement count, a locator occurrence means a source key followed by a comma or § in the body before References; repeated references count separately and bare source-line annotations do not. The distribution is FSY 39, Sai90 17, Yu 15, Sab05 11, ESY 10, Sai88 8, KS 6, Dimca 5, Kash86/MT/SZ 4 each, AS/CY 3 each, Zucker/Sab10 2 each, and Kash84/DL/Schmid/Verdier/Kou/SY15/Sab18 1 each: 140 total. FSY has the largest share, 39/140.

FSY's contents (FSY lines 44–51) were compared with the repaired layers. Its A.3/A.4 are now split across Layers 6 and 7; Layer 7 also contains the ESY/Sab05/Sab10 strictness machinery. Its A.5 is integrated in Layer 8 with Yu's logarithmic models and CY's Künneth comparison. A.6/A.7 are combined in Layer 9 with MT's infinity weights. Layer 10 has the AS/Yu Newton targets. This is no longer a one-to-one run of Appendix A's sections. The dependencies §6.7→§7.7→§8.1→§9.1→§9.3 and §8.7→§8.8→§8.9→§10.4 force the retained order; the scopes are determined by the comparison targets.

## Not verifiable

- No Lean command was run, as required by the read-only brief. All 13 supplied elaborated signatures in the scratch signatures record were compared with the actual source and README. No binder change was required; this report does not claim a fresh elaboration/build.
- Zucker is waived. Dimca, Schmid, SZ, Verdier, Kash76 and Kou remain the manifest's settled uncertified citations. Their full source wording and proofs were not inspected or requested again. The unavailable local-complete-intersection connectivity argument and analytic L² details are therefore not source-certified here.
- The source ledger certifies the listed 57 comparisons, not every page covered by broad reference ranges. In particular, no complete reconstruction of the analytic twistor estimates or Saito's projective theorem was performed. Computed instances cannot replace those proofs.
- Supplier gaps are contracts awaiting implementation. The review checks precision, ownership, matching slugs and direction, not completion of the promised supplier code.

## Source issues

- **Misprint** in FSY at Appendix A.2, p. 61 (FSY line 2800): the source says side change uses index p−d; it should be p+d for its increasing left filtration; affects a stated result.
- **Misprint** in FSY at Appendix A.2, p. 62 (FSY line 2832): the source says the dual constant perverse Hodge module has twist −d; it should be twist d; affects a stated result.
- **Misprint** in FSY at Example A.3, p. 63 (FSY line 2876): the source says the divisor inverse image lies in degree zero; it should be the divisor constant perverse object shifted by [1]; affects a stated result.
- **Misprint** in FSY at Example A.27, p. 71 (FSY line 3222): the source says a composite direct-image functor is zero; it should be direct image along the function identically zero on the support; affects the proof.
- **Misprint** in FSY at Theorem A.30, p. 71 (FSY line 3241): the source says the costalk inclusion is in the output t-line; it should be the inclusion in the input τ-line carrying M; affects a stated result.
- **Error** in FSY at Proposition 2.21 proof, footnote 1, p. 17 (FSY line 736): the source says every cone's stratum has constant direct images; it should be restricted to nonzero boundary cones; affects the proof.
- **Error** in KS at Proposition 3 proof, p. 35 (KS line 1250): the source says ΠF has ambient weights n and n−1; it should have F in weight n and a constant quotient of weights at least n+1; affects the proof.
- **Error** in Yu at §4(a), p. 26 (Yu line 1377): the source says convenience implies properness of the Laurent map; it should assert the relevant boundary property after compactification, not properness of the map; affects a stated result.
- **Misprint** in AS at (4.3), p. 68 (AS line 422): the source says degree-l filtered terms use k/e−l; it should be k/e+l so the twisted differential preserves the shifted filtration; affects a stated result; corrected in print at Yu, footnote to Theorem 4.1, p. 27.
- **Misprint** in MT at Lemma A.4 proof, p. 39 (MT line 2116): the source says to push the Fourier kernel along p; it should be q, the projection to the transform coordinate; affects the proof.
- **Misprint** in ESY at Remark 2.2.3(1), p. 20 (ESY line 1037): the source says the Euler eigenvalue is zα; it should be −zα by Definition 2.2.2(b); affects nothing.
- **Misprint** in SabStationary at §5.c, (5.8)–(5.9), p. 19 (SabStationary line 938): the source says c in the translated exponential factor; it should use s, the point indexing the local transform; affects a stated result.

Source independence: 62 passages compared with 16 roadmap sources, with no copied expression identified; one additional source checked for S01. Largest share FSY, 39 of 140 locator occurrences; contents compared with FSY: independent after the first-round reorganisation. Settled unavailable sources are identified under Not verifiable.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "52c7385f0e90f64be0a670e836b1cd7b0a77c13e", "job": "RT-MixedHodgeModulesAndIrregularHodgeTheory~2a", "model": "gpt-6-astra", "worker": "chris-30"} -->
