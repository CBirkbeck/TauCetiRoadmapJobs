## H01 (CBirkbeck) — applied

At `TauCetiRoadmap/CohomologyComparisonsPartII/README.md:90`, the period for every smooth quasi-projective V-scheme → the product- and pair-pullback-compatible period square for projective smooth horizontal pairs over W(k), with arbitrary perfect k, every prime and all nonnegative weights; its consumers at lines 873 and 897 now explicitly retain that domain, while Layer 2 keeps its full construction domain. KLZ line 291–315 corrects BesserI line 1214–1216, AM line 1179–1183 and AM line 1302–1334 justify the W(k)-pair square, and the new Checks at lines 887–888 compute the weight-one naturality contradiction and weight-zero quadratic-field obstruction.

## H02 (CBirkbeck) — applied

At `TauCetiRoadmap/CohomologyComparisonsPartII/README.md:130` and line 535, the final term ω^q/B^q → Z^q/B^q, and the final map is explicitly z↦[z]−C⁻¹(z), as in TsujiNearby line 1205–1233, Theorems A3–A4, printed p. 563; inverse Cartier itself is imported from CrystallineCohomology §CR.5.1. The new degree-zero Check at line 545 excludes t because dt≠0 and constructs an étale-local preimage of t^p using u−u^p=t and z=u^p, including p=2, without changing the small-weight comparison range.

## H03 (CBirkbeck) — applied

At `TauCetiRoadmap/CohomologyComparisonsPartII/README.md:13`, lines 84–86, 154, 556 and 591, QWittVectors §1.7 / CommutingEndomorphisms.koszulComplex → AInfCohomology §AI.1.7 / Decalage.koszulComplex, matching that owner's section and QWittVectors' supplier contract at its supplied head. The ordered differential and new Checks at lines 563–564 fix the cochain signs and exhibit a nonzero arithmetic commutator, while retaining PadicHodgeTheory's separate twisted arithmetic totalization and continuous-cohomology comparison.

## Verification and ownership

The reference copies were main `a07e202`, the supplied open-folder checkouts and the indexed new-roadmap heads; QWittVectors was checked at `a04ce9b` and AInfCohomology at `b47987b`. Ownership searches covered the named open folders, the board packages, main, the open-roadmap index and the pinned libraries by object. AInfCohomology owns the commuting carrier, CrystallineCohomology owns inverse Cartier, and the étale logarithmic exact sequence remains the explicitly stated EtaleCohomologyFoundations extension; this Part II introduces neither carrier again. No ownership moved from a later roadmap and no new Lean declaration was introduced.

Every cross-roadmap section/name citation was resolved against those copies, including the unchanged contracts and ColemanIntegrationPartII §§3.0c,3.1a,7.0. Two resolver leads are false positives: `535: TsujiNearby §4: no roadmap TsujiNearby on main or in an open pull request` identifies a source, whose relevant proof is TsujiNearby line 892–940; `README 86: Decalage.koszulComplex: koszulComplex occurs nowhere in the pinned Mathlib and Tau Ceti sources` identifies a planned supplier declaration in AInfCohomology §AI.1.7, rather than a claimed pinned declaration.

The Mathlib and Tau Ceti checkout revisions match the manifest pins `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Their native boundaries remain as stated: MathlibPin line 117 bundles a Frobenius-semilinear automorphism without finite dimensionality or HK geometry; MathlibBDeRhamReview line 79 and line 92 provide completion/localization carriers without the comparison structures; TauCetiExactReview line 245–267 bundles a Quillen exact structure without exact-category Yoneda groups; TauCetiSyntomic line 79–85 concerns standard syntomic algebras without cohomology.

The declaration/signature audit found zero declarations in `TauCetiRoadmap/CohomologyComparisonsPartII/Suggested.lean`, so the list of `#check @name` queries is empty and there are no retained or silently dropped declaration binders to compare. The unchanged module elaborates against the pins; each headline still lacks the geometric or coefficient carrier listed in its module docstring, and no coordinate substitute was added.

KLZ was legally fetched as arXiv v2 and recorded once, with DOI, arXiv version, provenance and locators, in the complete source manifest prepared as `scratch/sources.toml`; the source-manifest update is supplied there because this job authorizes repository edits only to README and Suggested.lean. No reference is missing, and the settled BesserII entry was preserved without another request.

## Adversarial calculations

Values below are finite-instance calculations, rather than proofs of the general targets. A statement identifier refers to its README section or named supplier contract; API statements are separated when their tests differ. Every changed mathematical assertion is included. Unchanged abstract naturality statements are tested on identity, zero and the displayed nonzero witnesses, retaining their stated hypotheses.

| Statement | Instances tried | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: mixed characteristic and reduction | V=ℤ_2[π], π²=2 | V/(π)=𝔽₂; V/(2)=𝔽₂[π]/π², π≠0 in the latter | π and p reductions differ | Retained |
| Conventions: AM modulo-p Frobenius | π²=p, p=2,3 | v_π(Fπ)=1; v_π(π^p)=p; difference has valuation 1<2=v_π(p) | Ramified example excluded only from AM domain | Retained |
| Conventions: fibre shift | ℚ —2→ ℚ | Fib⁰=ℚ, Fib¹=ℚ, d⁰(1)=2, ker=coker=0 | Positive f, negative shifted d | Retained |
| Conventions: graded product | Degrees i=j=1 over ℚ and 𝔽₂ | Sign −1 over ℚ, +1=−1 over 𝔽₂; swapped two-form is negative | No division by 2 | Retained |
| Conventions: Tate twist | O(1), O(−1) | φ=p⁻¹,p; filtration jumps −1,+1; product φ=1, jump=0 | Opposite twists cancel | Retained |
| Conventions: HK normalization | φ=diag(1,p), Ne₁=e₀ | Nφe₁=pe₀=pφNe₁ | Lower exponent must be r−1 | Retained |
| Conventions: uniformizer change | N²=0 on e₀,e₁ | exp(log(u)N)e₁=e₁+log(u)e₀; exp(−e log(u)(−N/e)) gives same value | Positive Taylor sign agrees with base adapter | Retained |
| Conventions: curve residues | dlog t on P¹−{0,∞} | Res=(1,−1); sum=0 | Both signs fixed | Retained |
| Conventions: scalar linearity | k=𝔽_(p²), a not fixed by σ | (1−σ)(a)=a−a^p≠0; a(1−σ)(1)=0 | ℚ_p linearity only | Retained |
| Conventions: empty carriers | Empty scheme, zero module | All cohomology and maps 0; unique 0→0 is invertible | No nonemptiness imposed | Retained |
| AInf commuting Koszul carrier | g₁=2,g₂=3 on ℤ | d⁰(1)=(2,3); d¹(1,0)=−3; d¹(0,1)=2 | Ordered exterior sign fixed | Owner and name replaced |
| AInf Koszul square | Same, also mod 2 and 3 | d¹d⁰(1)=6−6=0 in all three coefficient rings | Commutativity suffices | Added Check |
| AInf empty/identity direction | d=0; d=1,g=id; M=0 | K()=M[0]; H⁰=ker id=0,H¹=coker id=0; K(0)=0 | Degenerate models retained | Added Check |
| AInf intertwining and scalar dual | Scalars 2,3; map ×5 | d⁰(5)=(10,15)=5(2,3); dual chain d₂(1)=(−3,2) gives d¹(a,b)=2b−3a | Cochain dual, not chain grading | Corrected supplier API |
| local-period-koszul-resolution: arithmetic action | γ₀=diag(5,1),γ₁=1+E₁₂ over ℚ₂ | γ₀γ₁γ₀⁻¹=1+5E₁₂=γ₁⁵; [γ₀−1,γ₁−1]e₂=4e₁ | Ordinary commuting carrier fails on Γ_R | Twisted contract retained, Check added |
| Same arithmetic action at odd p | p=3,c=4 | Conjugate=1+4E₁₂; exterior d²(e₂)=3e₁≠0 | Defect is not specific to p=2 | Added Check |
| Generic commuting restriction on a nonabelian group | Left regular actions of (12),(23) on ℤ[S₃] | d²([1])=[(123)]−[(132)]≠0; a single cyclic action has d²=0 | Noncommuting directions excluded from AInf carrier | No new construction |
| Koszul-to-continuous comparison domain | Trivial group and trivial module ℤ_p | H⁰=ℤ_p,H^i=0 for i>0; zero module gives all 0 | Completed resolution needs separate topological contract | Retained CN line 1824–1942 |
| rigid-syntomic-etale-period: supported domain | Y=Spec(ℤ_p),D=∅,r=0 | H⁰_rsyn=ℚ_p→H⁰_et=ℚ_p sends 1↦1 | Projective horizontal pair admitted | Restricted contract |
| Same period: weight-one point | Y=Spec(ℤ_p),r=1 | F¹=0,H¹_rsyn=ℚ_p; H¹_f=ℚ_p with injective period | Removing r=0 alone cannot repair domain | Restricted contract |
| Same period: forbidden generic open | j:Spec(ℚ_p)→Spec(ℤ_p),r=1 | Rigid pullback ℚ_p→0; generic étale pullback id; naturality would force nonzero point map=0 | j excluded from pair domain | Added negative Check |
| Same period: product obstruction | p=3,L=ℚ₃(√2),r=0 | H⁰_rsyn=L,H⁰_et=ℚ₃; squares modulo 3 are 0,1,1, never 2 | No unital ℚ₃-algebra map L→ℚ₃ | Added negative Check |
| Same period: arbitrary perfect k | W(k), horizontal point | Both syntomic realizations are Fib(1−σ:K₀→K₀); 1↦1 in degree 0 | No finite-k or good-prime restriction introduced | AM line 1179–1183,1302–1334 retained |
| relative-hodge: algebraic finiteness independent of rigid | U=D(pt−1)⊂A¹_ℤp | H⁰_dR=ℚ_p[t,(pt−1)⁻¹] with unbounded pole order; H⁰_rig=B†_K, geometric series ∑p^jt^j | Coherence of rigid side alone insufficient | Retained |
| relative-hodge: strict residue | P¹−{0,∞} | F¹H¹=K dlog t maps to K(−1)² by (1,−1); cokernel K(−1) | Correct Tate filtration and trace | Retained |
| rational-descent: truncation | r=0 | τ≤0 retains H⁰ and discards every H^i,i>0; at point H¹_classical=ℚ_p | No all-degree étale equivalence inferred | Retained |
| rational-descent: sign transport | e=2,N_c e₁=e₀ | N_base e₁=−e₀/2; −e log(u)N_base e₁=log(u)e₀ | Shared normalization agrees | Retained |
| crystalline-inputs: low divided powers | r=0, n=1,2 | J^[0]=O; reduction ℤ/p²⊗ᴸℤ/p=ℤ/p for the flat coefficient model | No arbitrary finite-level division | Retained |
| crystalline-filtered-quotient | r=0 at point | F⁰DR=DR, DR/F⁰=0 on both descriptions | Quotient, not unfiltered DR | Retained |
| hyodo-kato-proper | Good reduction point | D=K₀,φ=σ,N=0; every uniformizer map is id after extension | Carrier is actual supplied cohomology | Retained |
| arithmetic-pair-deformation | N=0 point | Semistable terms K₀,K₀⊕K⊕K₀,K₀; N maps 0 | Proper H^q alone does not specify enhanced triangle | Retained |
| period-rings: fundamental kernel lattice | p=2,r=2 | φ(t²/8)=4(t²/8); t²/8 is outside (1/4)ℤ₂(2) | Factorial lattice essential | Retained |
| rigid-realizations: scalar extension | Z=Spec(k),K/K₀ degree e | K⊗K₀K₀=K; empty Z gives K⊗0=0 | Scalar fields retained | Retained |
| rigid-log-crystalline | (P¹,{0,∞}) over W(k) | Both H¹ have generator dlog t,φ=p; F¹=K dlog t | Horizontal boundary comparison | Retained |
| relative-rigid-realization | u=id; empty U | Ru_* forms have H⁰=B†_K,H^i=0 for i>0; empty gives 0 | Construction before finiteness | Retained |
| relative-rigid-coefficients | Unit isocrystal | Φ(1)=1 and ∇1=0; after identical lift change, transport(1)=1 | No free Frobenius choice | Retained |
| relative-rigid-projective-finiteness | Constant genus 0 and 1 curves | Ranks (1,0,1) and (1,2,1) | Proper finiteness compatible with low genera | Retained |
| relative-rigid-log-finiteness | A¹×G_m compactification | H⁰=O,H¹=O(−1), ranks 1,1 | Both total and relative boundary clauses satisfied | Retained |
| rigid-gysin | P¹,D=∅ | H²(X)→H²(U) is id on K₀(−1), not a surjection onto 0 | General sequence retains H²(U) | Retained |
| nearby-cycle-inputs: generic locus | Trivial-log Spec(ℤ_p) | X_tr=X but X_η=Spec(ℚ_p); no ℚ_p→ℤ_p extending id | Generic intersection necessary | Retained |
| nearby-cycle-inputs: vertical locus | Canonical-log Spec(ℤ_p) | X_tr=X_η=Spec(ℚ_p) | Layer 4 canonical-log j′ agrees | Retained |
| nearby-cycle-cartier: cycles and boundaries | Y=A¹_𝔽₂,q=0 | ω⁰=𝔽₂[t],B⁰=0,Z⁰=𝔽₂[t²]; d(t)=dt≠0,d(t²)=0 | Larger quotient is wrong | Changed target to Z/B |
| Same Cartier map | p=2,z=t²; p=3,z=t³ | z−C⁻¹z=t²−t⁴ and t³−t⁹, both closed | Map is quotient minus inverse Cartier | Made map explicit |
| Cartier kernel | q=0,constants a∈𝔽_p; z=t^p | a−a^p=0; t^p−t^(p²)≠0 | Constants generate ω_log⁰; zero map excluded | Corrected contract |
| Cartier local surjection | u−u^p=t, z=u^p | dz=0; z−z^p=(u−u^p)^p=t^p; derivative of u−u^p−t is 1 | Correct target has étale-local preimages | Added Check |
| Cartier inverse on forms | G_m/𝔽_p,q=1 | C⁻¹(t dlog t)=[t^p dlog t]≠0; [t dlog t]=[dt]=0 | Identity coefficient rule excluded | Retained |
| Cartier source ownership | Same torus | Relative Frobenius Cartier maps dlog t↦[dlog t] on both presentations | Generic inverse Cartier imported once | Cited CrystallineCohomology §CR.5.1 |
| nearby-cycle-graded | G_m with one boundary direction | Res(dlog t)=1; with zero horizontal directions gr^W_1=0 | Horizontal pole count distinct from vertical log | Retained |
| local-period-fundamental-sequences | r=0,s=0,zero module | p^r=p^(4r)=p^s=1; zero complexes have kernel=cokernel=0 | Exponent-zero errors vanish | Retained |
| local-period-pd-radius | p=2,u=1; r=1 | 1/(p−1)=1≤u≤1; p^(6r)=64 | Endpoint admitted | Retained |
| local-period-annulus-entry | p=3,u=2/3,v=2 | pu=2=v | Required radius inequality attained | Retained |
| local-period-frobenius-change | p=2,d=0,1 | 2^(2(d+1))=4,16; radii (3/4,3/2) | Dimension dependence visible | Retained |
| local-period-lie | r=0,1,p=2 | Integral exponents 0,40; finite-reduction exponents 0,80 | Bounds are separate, not equivalences at r=1 | Retained |
| local-period-lazard | Trivial coefficient module 0 | Both Koszul models 0 and cohomology 0 | No extra period theorem premise | Retained |
| local-period-annulus-change | Zero coefficient map; r=0 | Maps 0→0 induce id on zero cohomology | Coefficient naturality compatible | Retained |
| local-period-phi-psi | p=2,3 | Error factors 2⁹=512,3¹⁰=59049 | Bound not silently exact | Retained |
| local-period-disk-change | M=0 and identical restriction | H^i=0 on both sides; identical restriction sends x↦x | Shifted ψ-lattice still part of domain | Retained |
| local-period-galois | Trivial rank-one r=0 invariant | H⁰ invariants=ℤ_p; Frobenius fixed unit 1 | Correct unit under Artin–Schreier comparison | Retained |
| local-period-approximation | Identity henselian completion comparison | A unit 1 maps to 1 and induced identity automorphism fixes every element | No new syntomic comparison asserted | Retained |
| local-period-kpi1 | Constant sheaf, empty chart | H⁰=0,H^i=0; trivial group at a point has H⁰=Λ,H^i=0 | Coefficient and positive-degree clauses separated | Retained |
| local-period-etale-gaga | Empty trivial-log locus | Étale cohomology and analytic cohomology both 0 | Boundary retained | Retained |
| local-period-descent | G={1},e₁=1,r=0 | RΓ(G,C)=C; exponent cr e₁=0 and 2cr e₁=0 | Identity extension comparison exact | Retained |
| exact-yoneda | Split extension; i=0 | Split class=0; Ext⁰(O,O)=Hom(O,O); at point Hom=ℚ_p | Abelian instance not assumed | Retained |
| exact-yoneda products | Two degree-zero scalar maps 2,3 | Product=6 and swapping=6; degree-one swap has sign −1 | Biexact symmetric tensor required | Retained |
| affine coefficient vanishing | Affine point; elliptic curve negative control | Point H^j(O)=0,j>0; elliptic H¹(O)=K≠0 | Affineness indispensable | Retained |
| 1.1 FilFMIC definition | Zero and unit objects | c:0≃0,Φ:0≃0; unit ∇1=0,Φ1=1 | Zero object and nonzero object admitted | Retained |
| 1.1 horizontality | Φ(e)=t e on trivial connection | ∇Φ(e)=dt⊗e; Φ∇e=0 | Candidate rejected | Retained |
| 1.1 faithful realization | Spec(K) with B†=0 | id on H_dR=K is 1; rigid component on 0 is 0 | Only de Rham realization faithful | Retained |
| 1.1 composition/extensionality | Scalars 2,3 on unit | Composite=6 on both components; equal scalars give equal pairs | Actual pair maps determine morphisms | Retained |
| 1.2 direct sums/tensor | O(1)⊗O(−1),0⊗O | φ=p⁻¹p=1,F jump=0; second tensor=0 | Tensor formulas agree | Retained |
| 1.2 duality | Rank-one evaluation | ev(h∨⊗h)=1; Frobenius multiplier p·p⁻¹=1 | Triangle composite on h is h | Retained |
| 1.2 pullback/transport | Identity base and identical σ | c,Φ,∇ unchanged; 1↦1, composite id∘id=id | Extra unit rescaling excluded | Retained |
| 1.3 conflations | 0→H→H⊕O→O→0 | Each F^j sequence is split; Yoneda class=0 | Exactness is filtered | Retained |
| 1.3 strictness negative control | B with F⁰=0→A with F⁰=K,Φ=1 | Underlying map=id; inverse sends F⁰A=K outside F⁰B=0 | Not a strict admissible isomorphism | Retained |
| 1.3 tensor exactness | Tensor split sequence with O(1) or 0 | Split ranks (1,2,1) unchanged under O(1); all ranks 0 under 0 | Biexactness consistent | Retained |
| 1.3 Ext and functoriality | Ext¹(O,0),Ext⁰(O,O),zero/split pushout | 0,ℚ_p,0 respectively; identity functor sends class 0 to 0 | Correct exact-category boundary | Retained |
| 1.4 coefficient complex | Unit at point | A⁰=B⁰=ℚ_p,f=0; H⁰=H¹=ℚ_p | Fibre does not erase degree one | Retained |
| 1.4 twist and zero | O(1),0 at point | A⁰=0,B⁰=ℚ_p, H¹=ℚ_p; zero gives all 0 | Filtered source necessary | Retained |
| 1.4 fibre differential first component | d_A=id,d_B=2,f=3,(a,b)=(2,5) | (2,6−10)=(2,−4) | d_A term present | Retained |
| 1.4 fibre differential second component | d_A=0,d_B=id,f=2 | (1,0)↦(0,2); (0,1)↦(0,−1) | Two signs separately fixed | Retained |
| 1.4 square-zero | Chain map identity between [ℚ→ℚ] with d=id | d_F(1,0)=(1,1); next differential (0,1−1)=(0,0) | Chain-map hypothesis used | Retained |
| 1.4 linearity | Same coordinate maps, inputs (1,0),(0,1),scalar 2 | d(1,1)=(0,1)=(0,2)+(0,−1); d(2,0)=(0,4)=2d(1,0); d(0,0)=0 | Linear coordinate API consistent | Retained |
| 1.4 pairing/unit | Point unit 1 and degree-one b | 1 cup b=b; (1−1·1)=0 on unit | Unit pairing compatible with fibre | Retained |
| 1.5 evaluation at i=0 | Hom(O,O),Hom(O,O(1)) | u₀(a)=a; second Hom=0 from a=p⁻¹a | Correct actual category | Retained |
| 1.5 filtration alone | Φ=1,F⁰T=0,F⁻¹T=K | Filtered Hom=0; unfiltered Hom=K | Frobenius alone insufficient | Retained |
| 1.5 split/non-split evaluation | Φe=e−h,Φh=h,F⁰M=M | u₁=(0,h), class 1 in coker(0)=K; split Φe=e gives 0 | Sign detected | Retained |
| 1.5 additivity/cup/naturality | Extensions with coefficients a,b; scalar c | R(E_a+E_b)=−(a+b)h=−ah−bh; R(c_*E_a)=−ca h | Baer and coefficient maps compatible | Retained |
| 1.6 unique lift | H=O(1) at point | F⁰H=0,F⁰M→K is iso; Φe=e+ah gives R=−ah,δ=0 | Unique representative fixes sign | Retained |
| 1.6 injectivity | Same family E_a | R=0 iff a=0; then filtered lift is Φ-fixed | Both implications tested | Retained |
| 1.6 missing vanishing negative control | Split extension by O(0) | Lifts e and e+h both map to 1; difference h≠0 | Uniqueness not exported | Retained |
| 1.6 differential relation and lift change | ∇=0,Φe=e+ah at point | dR=0=(1−Φ)δ; Φ′e=e+a′h gives R′−R=(a−a′)h | Difference sign consistent | Retained |
| 2.1 realizations and specialization | Spec(V),empty,Spec(K) | sp=id_K; 0→0; sp:K→0 respectively | General sp is not invertible | Retained |
| 2.1 naturality/scalar extension | Identity map; K₀⊂K | sp∘id=id∘sp; bc(1)=1 | Named map source/target agree | Retained |
| 2.2 rigid fibre r=0 | V=ℤ_p,point | f(a,b)=(0,a−b); ker=diagonal K, coker=K | H⁰=H¹=K | Retained |
| 2.2 rigid fibre r>0 | Same point, r=1,2 | f(a)=((1−p⁻ʳ)a,a), rank 1 into K²; H⁰=0,H¹=K | Both target components needed | Retained |
| 2.2 empty special fibre | Spec(K),r=0,1 | A=C=0; fibre=F^rDR, hence K[0] at r=0 and 0 at r=1 | Broad producer retained | Used in H01 Checks |
| 2.2 refinement/pullback | Identical presentations and empty scheme | Identity on each component; zero diagrams give zero | No arbitrary comparison chosen | Retained |
| 2.3 single-fibre elimination | K=K₀,point r=0 | Eliminate a=b: f₀=0 on K; H⁰=H¹=K | No sp inverse used | Retained |
| 2.3 twist | G_m,r=1 | (1−φ/p)dlog t=(1−1)dlog t=0; wrong multiplier p gives (1−p²)dlog t≠0 | Inverse Tate exponent fixed | Retained |
| 2.3 exactness/descent/product | Identity one-open cover; empty; unit | Čech augmentation=id; groups for empty=0; 1 cup b=b | Checks agree with full fibre | Retained |
| 3.1 Frobenius-divisibility definition | r=0,p=2,r=1 | J^⟨0⟩=O,φ₀=φ; r=1=p−1 gives J^⟨1⟩=J^[1] | Divisibility range differs from period range | Retained |
| 3.1 finite division negative control | ℤ/p,0 and 1 | p·0=p·1=0 while 0≠1 | Equation cannot select divided image | Retained |
| 3.1 transition independence | r=0,n=1,2,unit section | φ(1)=1 at both levels and reduction(1)=1 | Higher-level construction coherent | Retained |
| 3.2 divided/undivided fibres | r=0 and zero coefficient arrow A[0]→B[0] | S=S′=Fib(1−φ); zero-arrow H⁰=A,H¹=B | Ordinary kernel loses H¹ | Retained |
| 3.2 site/global distinction | Empty X | Derived sections on either site=0 | No unsupported étale kernel replacement | Retained |
| 3.3 ω and τ chain squares | Coefficients p^r,φ | (1−φ/p^r)p^r=p^r−φ and p^r(1−φ/p^r)=p^r−φ | Both chain squares commute before reduction | Retained |
| 3.3 composites/error | p=2,r=1 on ℤ/4 | ×2∘id=×2; ker×2={0,2},coker=ℤ/2, both killed by 2 | Killed error ≠ equivalence | Retained |
| 3.3 weight zero/products | r=0; unit cup b | ω₀=τ₀=id; 1 cup b=b; weight multipliers p^(r+s)=p^r p^s | Only ω has multiplicativity contract | Retained |
| 3.4 local PD gluing | Identity refinement,empty X | Refinement map=id, cocycle id·id=id; empty fibre=0 | Imported PD realization used | Retained |
| 3.4 rational rescaling | p=2,r=1 | (1/2)τω=id and (1/2)ωτ=id | τ alone is ×2, not inverse | Retained |
| 3.4 quotient at r=0 | Point | DR/F⁰=0 | No quotient component retained spuriously | Retained |
| 3.4 derived inverse limit | A_n=⊕_(j≥n)𝔽_p | lim=0; lim¹=∏𝔽_p/⊕𝔽_p; class (1,1,…)≠0 | Rlim cannot become lim | Retained |
| 3.4 horizontal point tower | n=1,2 over ℤ_p,r=0 | [ℤ/p→0ℤ/p], [ℤ/p²→0ℤ/p²]; Rlim=[ℤ_p→0ℤ_p] | H⁰=H¹=ℤ_p then ℚ_p | Retained |
| 4.1 lattice definitions | p=2,r=0,1,2 | a=0,1,2; EN generators 1,1/2,1/8; CN generators 1,1/2,1/4 | Factorial visible | Retained |
| 4.1 generator inclusion | p=2,r=2 | (1/4)/(1/8)=2; cokernel ℤ₂/2 | Correct direction | Retained |
| 4.1 reduced inclusion | Same,mod 2 | Source=target=𝔽₂,1↦2=0 | Inclusion need not stay injective | Retained |
| 4.1 unit factorial | p=3,r=4 | EN=1/18,CN=1/9,ratio=2∈ℤ₃× | Lattices equal, inclusion is iso | Retained |
| 4.1 inclusive endpoint | r=p−1 | a=1,b=0,generator=t^(p−1)/p | Smaller a=0 misses element | Retained |
| 4.1 CN product | p=2,r=s=1 | (1/2)(1/2)=1/4, target floor exponent 2 | Exponent 1 target misses 1/4 | Retained |
| 4.1 EN product | p=2,r=s=1 | Source product=1/4=2·(1/8); coordinate p⁰·2!/(1!1!)=2 | Integral product | Retained |
| 4.1 error composition | ×p followed by ×p on ℤ_p | Composite ×p² has cokernel ℤ/p² killed by p² | Exponents add A+B | Retained |
| 4.2 periods/ω | r=0 | ω=id,L_EN=L,α′=α | Construction normalizations agree | Retained |
| 4.2 unit/product/reduction | Weight zero, n=2→1 | α(1)=1; reduction(1)=1; α(1 cup1)=1·1 | Zero-map candidate excluded | Retained |
| 4.2 nearby cycles | Canonical-log point,ramified cyclotomic character | H¹(I,ℤ/p^n) has a nonzero character; constant geometric stalk H¹=0 | Target cannot be constant sheaf | Retained |
| 4.3 exact comparison range | p=2 and 3 | Allowed r: {0} and {0,1}; excluded r:1 and 2 respectively | Range unchanged | Retained |
| 4.3 corrected local PD input | Y=A¹_𝔽₂,r=q=0 | Target=𝔽₂[t²],image z−z² closed; t∉target | Repaired characteristic-p input | Explicit corrected sequence in route |
| 4.3 integral transfer | p=3,r=1 | τω=3 id, 3 nonunit modulo 3 | Divided equivalence does not make S′ equivalent | Retained |
| 4.3 truncation | r=0 | τ≤0 has H^q=0 for q>0 | Vanishing is source theorem, separate from map | Retained |
| 4.4 chart scope | e=2,h=2 | xy=π² admitted by 1≤h≤e; h=1-only description rejects it | Ramified base changes retained | Retained |
| 4.4 bounded ranges | p=2,r=1 | q=0,1 admitted; q=2 excluded; p^A annihilator need not be 1 | No exact comparison asserted | Retained |
| 4.4 enough-roots radii | p=2,3 | (u,v)=(3/4,3/2),(2/3,2); pu=v in each case | Radius choices compatible | Retained |
| 4.4 proof contracts | Noncommuting arithmetic model above | d²(e₂)=4e₁ or 3e₁ without twist | λ and twisted totalization not supplied by commuting carrier alone | Corrected owner, separate contract retained |
| 4.5 recollement construction | Closed part empty | E=Rj′_*L; restriction to open returns same complex | Not zero closed syntomic sheaf | Retained |
| 4.5 closed/open restrictions | Closed error T=ℤ/p^A,open map=id | Closed ker/coker=T killed by p^A; open ker/coker=0 | Global exponent stays A | Retained |
| 4.5 unit/exact truncation | r=0 | Closed/open units (1,1) glue; period 1; τ≤0 unchanged | Agreement with 4.2–4.3 | Retained |
| 5.1 isocrystal adapter | Point and rank-two witness | Point φ bijective,N=0; rank-two detφ=p≠0 | Actual φ retained | Retained |
| 5.1 Cartier-type necessity | p∤m,m>1 root chart | Residue t≠0,t^m=0; sufficiently high Frobenius sends t↦0 | Not a bijective Frobenius model | Retained |
| 5.2 lower map | p=2,r=0,φ=diag(1,2),Ne₁=e₀ | D⁰e₁=(−e₁,e₁,e₀); D¹D⁰e₁=−e₀+e₀=0 | Lower map=1−2φ | Retained |
| 5.2 differential components | p=2,r=0 and 1 | D¹(e₁,0,0)=e₀; at r=0 D¹(0,0,e₀)=e₀; at r=1 D¹(0,0,e₁)=e₁ | Both sign and exponent detected | Retained |
| 5.2 square-zero general coordinate | p=2,3;r=0,1,2,3 | Eight matrices N(1−p⁻ʳφ)−(1−p^(1−r)φ)N=0 | No natural-number exponent subtraction | Retained |
| 5.2 zero total fibre | D=E=0 | Every term=0,d=0,H=0 | Zero rank admitted | Retained |
| 5.2 chain adapter | e=2,p=2,r=0 | Third component e₀↦−e₀/2; independent D¹ value e₀↦−e₀/2 on both routes | Sign-only adapter fails | Retained |
| 5.2 totalized adapter squares | p=0,1,2,3;r=0,1,2,3;e=0,1,2 | 48 substitutions, each of the two commutation differences=0 | Coordinate identities permit junk parameters | Retained |
| 5.2 adapter equivalence condition | e=0 and e=2 | e=0 scale=0 not invertible; e=2 scale=−1/2 with inverse −2 | Equivalence retains e≥1 | Retained |
| 5.2 uniformizer law | N²=0,e=2 | exp(−2log(u)(−N/2))e₁=e₁+log(u)e₀ | Matches supplier sign | Retained |
| 5.3 h-realization adapter | Identity presentation,r=0,p=2 | Identity on H⁰; degree-one point class excluded by τ≤0 | All weights rational, truncation retained | Retained |
| 5.3 pullback/products/Galois | Unit class,identity base change | 1↦1,1 cup1=1; g(1)=1 | Actual transported period used | Retained |
| 6.1 raw relative datum | u=id,empty U,P¹ | H^i=(O,0,…) for id; all 0 for empty; P¹ ranks 1,0,1 | No arbitrary open coherence claim | Retained |
| 6.1 geometric twist | P¹ degree two | Φ=pσ and H²=O(−1), not p⁻¹σ | Matches Tate convention | Retained |
| 6.2 promotion definition | Unit and zero data | Unit c=id,graded rank1; zero graded rank0 | Both promote | Retained |
| 6.2 promotion negative controls | c=0 on rank1; U=D(pt−1) | Rank(c)=0≠1; algebraic pole orders unbounded while rigid rank1 | Both fail required hypotheses | Retained |
| 6.2 base-change/uniqueness | Identity base and same raw tuple | Matrices c=id,Φ=1; promoted tuple unchanged | No independent Frobenius choice | Retained |
| 6.3 good compactification | A¹×G_m⊂P¹×P¹ | Boundary consists of fibre ∞ and sections 0,∞; horizontal intersections over S are disjoint | Both normal-crossings conditions met | Retained |
| 6.3 empty horizontal divisor | Constant projective fibre | D_h=∅,U=X; vertical divisor still disappears over S | Empty boundary admitted | Retained |
| 6.3 collision negative control | Sections x=0,x=t | At t=0 they coincide: two generic points specialize to one support point | Relative normal-crossings hypothesis fails | Retained |
| 6.3 witness independence | Identical compactifications | Interior U unchanged,c=id on same cohomology | Intrinsic datum determines promoted object | Retained |
| 6.4 projective smooth realization | Genus g=0,1 | Ranks=1,0,1 and 1,2,1 | No positive-genus restriction | Retained |
| 6.4 good-compactification realization | A¹×G_m,p=2 | H⁰=O,H¹=O(−1),φ(dlog x)=2dlog x | Small prime retained | Retained |
| 6.5 continuous forms on A¹ | K⟨t⟩† | d(t)=dt, antiderivative of t^jdt=t^(j+1)/(j+1); H⁰=K,H¹=0 | Overconvergence absorbs denominator growth | Retained |
| 6.5 continuous forms on G_m | Laurent dagger | dlog t=t⁻¹dt has no Laurent primitive; H¹=K dlog t | Nonzero class retained | Retained |
| 6.5 ramified base without AM lift | ℤ₂[π]/(π²−2),U=S×A¹ | Relative H⁰=B†_K,H^i=0,i>0 | Comparison makes no Frobenius claim here | Retained |
| 6.5 coherent corollary | Coherent coefficients on smooth affine S | H^j(S,R^i)=0,j>0; only j=0 column remains | All-degree hypothesis used | Retained |
| 6.5 non-affine negative control | Elliptic E | H¹(E,O)=K≠0 | Unrestricted source wording not consumed | Retained |
| 6.6 residue sequence | P¹−{0,∞} | H¹=K,Res(1)=(1,−1),Gys(a,b)=a+b; kernel=sum-zero line | Exact sequence with both directions | Retained |
| 6.6 nonsplit boundary | t²+t+1 over ℤ₂ | Rank H⁰D=2,trace kernel rank1; σ=−1 there and twisted φ=−2 | Rational-section indexing would lose class | Retained |
| 6.6 empty boundary negative control | U=X=P¹ | 0→0→0→K→0 is not exact; actual H²X→H²U=id_K | Affine U restriction excludes it | Retained |
| 6.6 Ext pushout | Split extension and Res map | Class0↦0; evaluation0↦0; nonzero coefficient (1,−1) has trace0 | Evaluation square compatible | Retained |
| 6.7 geometric projections | G_m,n=1 and point,n=0 | H¹(2)=O(1),F⁰=0; H⁰(1)=O(1),F⁰=0 | r=n+1 valid at n=0 | Retained |
| 6.7 residue twist | G_m,n=1,r=2 | O(−1)(2)=O(1); boundary target H⁰D(1) | Target twist lowered by one | Retained |
| 6.7 cocycle/naturality | Split extension,point pullback | δ=0,R=0,dR=0=(1−Φ)δ; identity pullback gives same 0 | Actual extensions required | Retained |
| 7.1 compatible lifts | σ(t)=t^p,a=0,1 | P₀(t)=0,P₁(t)=1; F[1]=[1]^p=1 | Normalization fixed | Retained |
| 7.1 wrong lift | t=p over ℤ_p | Pσ(t)=p^p≠p=F P(t) | Arbitrary lift excluded | Retained |
| 7.1 changed Frobenius | σ(t)=t^p+p,a=0 | x≡p mod p² satisfies x^p+p≡p≡x mod p² | Compatible point depends on lift | Retained |
| 7.1 identity/composition | Identity morphism of same lifted affine line | P_a(t)=[a] on both routes | No extra lift choices | Retained |
| 7.2 point detection | Rank0,unit1,empty special fibre | x=0; 1(P_a)=1; empty completion=0 | Zero and empty cases consistent | Retained |
| 7.2 residue-field negative control | k=𝔽_p,x=t^p−t | x≠0 but x([a])=0 for all a∈𝔽_p | Algebraic closedness essential | Retained |
| 7.2 reduction witness | Nonzero integral section with nonzero reduction | A nonzero coordinate polynomial has a∈k with value≠0; lift value mod p≠0 | Detection does not need Frobenius | Retained |
| 7.3 extension specialization | Split extension,base point | R=0 before/after; on SpecW pullback=id | Conflation-exact pullback compatible | Retained |
| 7.3 differential specialization | δ=dt⊗h at a W-point | Pullback d(P(t))=d[a]=0 in Ω¹_(K/K) | Differential pullback, not tensor evaluation | Retained |
| 7.3 bad point | σ(t)=t^p,P(t)=p | p^p≠p | Formula needs compatible point | Retained |
| 7.4 comparison of complexes | Point,r=0 | Both fibres=Fib(1−σ); for k=𝔽_p H⁰=H¹=ℚ_p | Realization-induced equivalence | Retained |
| 7.4 product/Frobenius compatibility | (P¹,{0,∞}),dlog t | Both φ(dlog t)=p dlog t; unit cup dlog t=dlog t | Actual comparison preserves named class | Retained |
| 7.4 restricted period compatibility | Horizontal projective point and forbidden j | Admitted point sends 1↦1; forbidden j would force nonzero H¹ point map to 0 | Pair hypotheses explicit in consumer | Updated |
| 7.4 vertical-log negative control | Point,r=1 | Horizontal H¹=K; C_st differential has rank1 into K³,second differential0, H¹=K² | Different log structures give different theories | Retained |
| 7.5 connecting isomorphism | Curve,n=1,r=2 | F²Ω•=0,H²_syn=H¹_rig; connecting b↦(0,b) | Positive connecting sign | Retained |
| 7.5 split extension value | Split E | R=0,connecting(0)=0,period(0)=0 on both routes | Natural value vanishes | Retained |
| 7.5 missing vanishing negative control | Abstract fibre with A=K[n+1],B=0 | H^n(B)=0,H^(n+1)(Fib)=K | Connecting map not onto | Retained |
| 7.5 specialization and periods | Point specialization,nonzero b=1 | R|P=1 on both pullback routes; class=(0,1); both admitted periods share same class | Only projective W(k)-pair periods consumed | Updated |

The calculations of the matrix identities, lattice generators, Cartier polynomials and new Koszul signs were also recomputed with exact rational arithmetic. The 48 adapter substitutions test the two scalar commutation identities; they do not assert a chain equivalence for e=0 or a syntomic complex for p=0.

## Build and gate

Build command: `lake build TauCetiRoadmap.CohomologyComparisonsPartII.Suggested`. Exit status 0; exact outcome:

```text
✔ [8976/8976] Built TauCetiRoadmap.CohomologyComparisonsPartII.Suggested (11s)
Build completed successfully (8976 jobs).
```

Dependency check, with the requested order and movable mode (exit status 0):

```text
depcheck: 26 roadmaps, 230 edges, 0 problem(s)
```

No UPWARD or CYCLE line was emitted. Commit: `899baf7` (`CohomologyComparisonsPartII: review repairs (period domain, Cartier quotient, Koszul ownership)`); the worktree is clean and nothing was pushed. The full gate exited with status 0; exact summary:

```text
gate CohomologyComparisonsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
