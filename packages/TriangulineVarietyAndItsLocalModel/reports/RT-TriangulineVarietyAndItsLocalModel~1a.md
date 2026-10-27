<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1547#issuecomment-6433894648 -->
Red team round 1 pass a (codex) of fe88ef7

Verdict: needs_changes

1. **F01** (P1) The Newton–Thorne reciprocity convention is inverted

   **Location:** `packages/TriangulineVarietyAndItsLocalModel/README.md:31`, also :491 and :569: “NT reciprocity Art_K is arithmetic”.

   **Claim:** An unramified Galois character with arithmetic Frobenius value a has Robba parameter with uniformizer value a, and the ordinary-flag dictionary uses this Artin map.

   **Witness:** NT21 lines 261–263 specify geometric Frobenius; `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md:23` agrees. Over ℚ₃ take η(Frob_arith)=2: its crystalline Frobenius and Robba parameter at 3 are 1/2, not 2.

   **Exact repair text:** “In Layer 4, Art_K sends a uniformizer to geometric Frobenius, as in NT21, p. 7 (NT21 lines 261–263). If rec_arith sends a uniformizer to arithmetic Frobenius, Art_K(x)=rec_arith(x)⁻¹. Thus an unramified η with η(Frob_arith)=a has parameter δ(ϖ_K)=a⁻¹. Use this geometric Art_K in δ_i∘Art_K⁻¹ and (χ_i∘Art_K)∏_ττ^(−k_(τ,i)).” Replace the arithmetic-normalization sentence in §4.1 accordingly. Add the Check “Over ℚ₃, η(Frob_arith)=2 gives δ(3)=1/2 and δ∘Art_K⁻¹(Frob_arith)=2.” This computes 2 on both sides of the repaired ordinary dictionary.

2. **F02** (P2) The endpoint derivative uses an undefined refinement

   **Location:** `packages/TriangulineVarietyAndItsLocalModel/README.md:1957`: “kappa_(phi_1)”.

   **Claim:** The pullback and pushout of a de Rham mixed extension have equal ordered smooth derivatives.

   **Witness:** Ding25 lines 1197–1203 define the subscript as the entire ordered tuple (φ₁,…,φₙ₋₁). Here φ₁ denotes one character; for n=3 the derivative requires two ordered coordinates, not one.

   **Exact repair text:** “Put φ_end=(φ₁,…,φₙ₋₁) and T_end=(G_m)^(n−1). Let κ_end,D₁ and κ_end,C₁ be §11.3's derivative maps for this ordered refinement, restricted to de Rham self-extensions, with common target Hom_sm(T_end(K),E). For M∈Ext¹_g(C₁,D₁), κ_end,D₁(ι⁻M)=κ_end,C₁(ι⁺M).” At n=3 a scalar unramified twist now gives (ψ,ψ) on both sides; reversing the endpoint order sends a general (ψ₁,ψ₂) to (ψ₂,ψ₁) and is explicitly excluded.


3. **F03** (P2) The period comparison omits its almost de Rham domain

   **Location:** `packages/TriangulineVarietyAndItsLocalModel/README.md:713` and :729: “For D with M=D[1/t]” and “Assume the localized triangulation has a parameter in T₀ⁿ.”

   **Claim:** The period deformation groupoids and their framed comparison exist under these hypotheses alone.

   **Witness:** Take K=ℚ₃, n=1, δ(u)=exp((1/2)log u) on small units. T₀¹ imposes no ratio restriction, but D_pdR(R(δ))=0. BHS19 lines 2251 and 2305–2308 require almost de Rham periods and locally algebraic parameters.

   **Exact repair text:** “In §6.1 assume W_dR(D) is almost de Rham. In §6.2 assume the localized triangulation admits a locally algebraic parameter δ∈T₀ⁿ.” Retain these hypotheses for the framed statements and specify that the free-lattice consequence has almost de Rham period realization. Add the negative Check “The rank-one weight-1/2 character over ℚ₃ satisfies the pairwise genericity condition vacuously, but has D_pdR=0 and cannot supply a rank-one D_pdR frame.” The repaired domain excludes this example; δ=x² instead gives period rank one and the stated frame.

4. **F04** (P2) The modification target lies outside the defined class

   **Location:** `packages/TriangulineVarietyAndItsLocalModel/README.md:1355` and :1515: “Fix φ and strictly decreasing h” and “ΦΓ_nc(φ,T_σh)”.

   **Claim:** T_σ maps between two instances of the class defined in §10.1.

   **Witness:** For d=2, n=3, off-σ weights (3,1,0) become (0,0,0), which fails §10.1's strict decrease. Ding25 lines 450–457 define ΦΓ_nc for weakly decreasing weights and define regularity separately.

   **Exact repair text:** “For generic φ and weakly decreasing labelled weights h, define ΦΓ_nc(φ,h) by the displayed localization and by requiring every refinement to have ordered weights h. Call its objects regular when every h_τ is strictly decreasing. The original D in Layers 10–13 is regular; its modification D_σ belongs to ΦΓ_nc(φ,T_σh), without that regularity assumption.” The computed target (0,0,0) now belongs to the defined class, while the original (3,1,0) remains regular. Add this as the negative-control Check for regularity.

5. **F05** (P3) The acceptance-file inventory omits headline results

   **Location:** `packages/TriangulineVarietyAndItsLocalModel/Suggested.lean:41`, and `packages/TriangulineVarietyAndItsLocalModel/README.md:519`.

   **Claim:** The module docstring inventories the headline results that cannot yet be stated; its Layer 4 entry only names the numerical Weil–Deligne criterion. Ordered-regular strictness, the rank-two de Rham cases and §10.8’s surjectivity are not named.

   **Witness:** README §4.2 proves strictness and uniqueness for every ordered-regular triangulation of a continuous representation. Numerical noncriticality is unnecessary: rank one is already ordered-regular at nonintegral weight 1/2. The module inventory omits this theorem.

   **Exact repair text:** Add a docstring bullet: “Ordered-regular strictness and uniqueness, and the ordinary-flag dictionary (§§4.1–4.2): missing the coefficient Robba realization of continuous representations, saturated integral triangulations and their ordered parameters.” This covers the weight-1/2 rank-one example, which the existing de Rham/WD entry does not cover. Also name “Rank-two de Rham triangulation cases (§4.5): missing the de Rham/WD realization and its refinements” and “Surjectivity of single-embedding modification (§10.8): missing the crystabelline class and period modification.” Add no surrogate theorem or data declaration.

6. **F06** (P3) The crystalline-family input cites the wrong supplier subsection

   **Location:** `packages/TriangulineVarietyAndItsLocalModel/README.md:1081`: “with their families of filtered φ-modules”.

   **Claim:** LocalGaloisDeformationRings §§3.6 and 3.10 supply that family.

   **Witness:** `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:2455` supplies finite-projective family period modules in §3.5; §3.6 concerns filtered-module deformation theory. A varying Frobenius matrix needs the family module, not just its pointwise deformation groupoid.

   **Exact repair text:** “Import the finite-projective filtered period family and its specialization comparisons from LocalGaloisDeformationRings §3.5, with trivial inertia type and L=K; use §§3.6 and 3.10 for the deformation comparison and regular crystalline geometry.” Add §3.5 to this target's Needs and the exact supplier contract. In the unramified rank-one family with arithmetic Frobenius 1+T, the corrected input specializes the crystalline Frobenius to (1+T)⁻¹, including T=ε, where it is 1−ε.

7. **F07** (P3) A Check refers to an undefined endpoint

   **Location:** `packages/TriangulineVarietyAndItsLocalModel/README.md:2177`: “replacing it by an unrelated D₂,σ does not type-check”.

   **Claim:** This is a discriminating Check for the single-embedding relation.

   **Witness:** No D₂,σ is defined in the package, and Suggested.lean has no declarations on which the claimed type-check could be performed. The actual second endpoint is C₁,σ; the check supplies no mathematical instance.

   **Exact repair text:** Replace that bullet by: “For d=2 and τ≠σ, a scalar coordinate ψ=log_τ is excluded from V_σ, although ψ and −ψ sum to zero; ψ=log_σ is allowed. Thus cancellation alone does not impose the partial condition.” On the stated instance the off-σ derivative is respectively 1 and 0, distinguishing the two cases.

8. **F08** (P3) The zero-operator marking Check contradicts the matrix model

   **Location:** `packages/TriangulineVarietyAndItsLocalModel/README.md:163`: “matrix equality alone does not identify arbitrary markings”.

   **Claim:** With N=0, changing a frame by 1+εB can leave an additional distinction beyond the framed matrix.

   **Witness:** Over A=E[ε]/ε², take ν=0, fixed residual marking and frames α=I, α′=I+εB. The map f=I+εB commutes with ν, reduces to I and satisfies fα=α′. Thus these are isomorphic framed objects.

   **Exact repair text:** “With N=0, the frame change α′=α(1+εB) is transported by the unique compatible period isomorphism f=α′α⁻¹, which reduces to the identity. These framed objects have the same isomorphism class and matrix. Distinct matrices, such as 0 and ε·id in rank one, give different classes.” The first instance now gives equality on both sides of §1.2; the second gives inequality on both sides. No further marking invariant is introduced.

## Verified sound

Read all 2,257 README lines and all 51 Suggested.lean lines. The package has **91 numbered targets**, **267 Check bullets**, and **0 Lean declarations**. The bold labels are structural labels and reference keys, rather than additional mathematical targets. Located and read the primary source passages for all 91 targets in the seven cached works; the source versions and page numbering are identified in sources.toml. The mathematical qualifications and corrections are recorded above and below. Repeated Check bullets were evaluated but do not count as additional independent controls.

The 91-row table below records the computed instances, including controls outside the hypotheses. In particular, the corrected full-character dimension n²−n+dn(n−1)/2, the two frame dimensions, the positive n in the paraboline quotient, and the modified versus unmodified zero kernels agree with those computations. The cycle uniqueness theorem retains its declared triangularity hypothesis; it does not infer constituentwise vanishing from a signed zero sum.

Suggested.lean has zero definitions, theorems, examples, instances, section variables or implicit contexts to audit; the declaration/context inventory is empty. Consequently the requested declaration-by-declaration signature check is vacuous. No Lean process was run. There is one import, Mathlib, an empty correctly named namespace, no sorry data, no stand-in proposition, no padding and no set_option. The eight cited Mathlib declarations were read at the pinned files and lines; the manifest revisions match the package. Their actual finite-dimensional, coefficient and support conditions were checked. Searches by period, Robba, trianguline, crystabelline, paraboline, Sen and Orlik–Strauch objects found no pinned carrier that would make the substantive headlines statable using only simple definitions.

The headline inventory is:

| README targets | Headline and acceptance-file status |
|---|---|
| 1.2, 1.4, 2.2, 2.4 | Framed period and filtered-lattice equivalences; named, coefficient period representations and deformation groupoids absent |
| 4.1–4.2 | Ordinary-flag dictionary and ordered-regular strictness/uniqueness; not statable, inventory omission R05 |
| 4.4–4.5 | Numerical noncriticality and rank-two de Rham triangulation cases; WD/integral-triangulation carriers absent; numerical criterion named, case inventory covered by R05 |
| 5.3 | Formally smooth filtered localized comparison; named, Robba deformation maps absent |
| 6.4, 6.6–6.9 | Double-flag comparison, normal component rings, component indexing and tangents; named, incidence and period moduli absent |
| 7.4–7.5, 8.1 | Analytic completed local model, normality, CM and character flatness; named, rigid trianguline carrier absent |
| 8.4, 8.7 | Crystalline accumulation and companion criterion; named, refined deformation and companion-point carriers absent |
| 9.2, 9.8 | Weight-fibre KL and full-character crystalline multiplicity identities; named, fibre/cycle-transfer/constituent carriers absent |
| 10.4, 10.6, 10.8 | Injection recovery and single-embedding realization; recovery named, actual crystabelline modules and modification absent; surjectivity inventory covered by R05 |
| 11.3, 11.7 | Simultaneous derivatives and paraboline product formulas; named, Robba Ext and refinements absent |
| 12.4–12.7 | Partial modification and quotient comparison; named, partial period conditions absent |
| 13.3, 13.5, 13.11 | Image and relation rigidity; named, actual endpoint Ext maps absent |
| 13.6–13.8, 13.12, 13.16 | Higher intertwining and tangent generation; named, filtration deformation carriers absent |
| 13.10, 13.14–13.15 | Original and single-embedding recovery sequences; named, embedded tangent relations absent |

No theorem on arbitrary linear maps or matrices would test these headlines. The finite-dimensional algebra used after the comparisons is already supplied by Mathlib and does not justify adding acceptance-file padding.

**Supplier and ownership audit.** Checked the 11 consumed roadmap contract groups below, 24 specifically named Springer targets and six specifically named locally analytic representation targets, plus the two character-space ownership citations. Used the roadmap service for ownership-by-object searches and current supplier reads; searched the provided sibling heads, main, Completed and the board packages. No fully qualified declaration collision is possible in the empty acceptance file. The provided sibling-head search found only reference-list mentions in OverconvergentAutomorphicForms; these introduce no competing local construction. The board's PadicHodgeParametersInLocallyAnalyticRepresentations imports TR1–TR5 from this package and supplies no input back to it.

| Supplier | Resolved contract and boundary |
|---|---|
| PadicHodgeTheory | §§4.3–4.5, 5.2, 6.3: field period/B-pair/filtered-module inputs exist; coefficient and partial extensions remain the registered gaps; fullRankQuotient_H0 is present |
| PhiGammaModulesAndIwasawaCohomology | §§1.0c–1.2, 3.1, 3.4a, 3.8–3.9, 4.0, 7.1–7.8: relative Robba, Herr/Ext, character and triangulation inputs; §7.2a includes affinoid Sen polynomials; Tor and finite Gamma-torsion qualifications retained |
| LocalGaloisDeformationRings | §§0.4, 1.1, 1.4, 1.12, 1.18, 1.23 and 3.4–3.10: individual dimensions have generic/noncritical/scalar-endomorphism assumptions; crystalline family citation corrected by R06 |
| SpringerResolutionAndCharacteristicCycles | Board design: all 24 named F/G/I/C/N/S/Y/K/P/T/E targets exist, including completed cycles and formal component detection; characteristic zero, graph w⁻¹ and KL orientation agree |
| SchemeAndStackFoundations | §§0.16–0.17, 0.21, 4.3–4.5: local algebra, excellence and classical fixed-residue Schlessinger inputs; hulls do not remove automorphisms |
| DeformationAndDerivedPatchingAlgebra | §§1.6–1.14, 2.1–2.7, 3.1–3.2: labelled coefficients, finite completion and relative formal presentations; use the complete-local smooth comparison for period frames, not the finite-residue continuous-representation presentation |
| RigidAnalyticGeometry | §§1.2, 7.3, 8.1–8.3: excellence, identity principle, stalk completions and rigid–adic comparison; the three additional openness/normalization contracts remain gaps |
| AdicSpacesPartII | R1.1, R1.5, R1.7, R1.9: completion, local rings, rigid–adic comparison, dimensions and identity principles exist |
| CompletedCohomologyAndLocalGlobalCompatibility | §5.2a is within global hypotheses; the package explicitly registers the unrestricted local variant as a gap rather than claiming it already supplied |
| ModularityAndLanglandsExtensions | §4.3 contains the ordered-regular condition; geometric reciprocity agrees with NT21 and refutes R01 |
| LocallyAnalyticRepresentationsOfLocalGroups | Board design LR.4/principal-series and LR.5's five named Orlik–Strauch targets exist; the BHS convention and all-family triangularity additions are registered gaps |
| Character-space ownership exclusions | LocallyAnalyticDistributions §3.3 adapts PhiGammaModulesAndIwasawaCohomology §4.0; PadicMeasuresIwasawaAlgebras §3a.1 explicitly builds no rigid structure |

All **12 gap slugs**, suppliers and sections agree between design/plan.json and the README's exact contracts. No supplier is “none”. Their missing coefficient, all-family or unrestricted-local content is distinguished from the existing field, generic or global inputs. Absence of these requested extensions at the supplier is not reported as a package defect.

The dependency command returned exit status 0 with this output:

```text
depcheck: 56 roadmaps, 651 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The read-only diff lists eight changed files, all inside packages/TriangulineVarietyAndItsLocalModel. No package source was modified during this review. The earlier repair reports mark no outstanding item “not actionable in this package”; no finding here re-raises such an item.

### Computed target and convention table

All target rows use p prime, K/ℚₚ finite of degree d, E splitting K, n≥1 (n≥2 for Layers 10–13), nonzero characteristic-zero Artinian coefficients with residue E. Thus n=0, zero rings, equal-characteristic and inseparable coefficients are excluded. Auxiliary zero maps/modules, n=1,2,3, p=2,3 and square-zero coefficients are tested below. Residue characteristic 2 never makes 2=0 in E.

| Target | Instances and computed values | Result / repair |
|---|---|---|
| 1.1 | A=E: marked automorphism=1; A=E[ε]/ε²: ν=0 versus ν=ε, squares 0, unequal operators; N=0 and frame I+εB transported by f=I+εB | R08: matrix equality gives the compatible isomorphism |
| 1.2 | n=1: charpoly(ε)=X−ε≠X, ε²=0; n=2,d=2: period/Galois dimensions 8/4 | full matrix completion required |
| 1.3 | ν=[[ε,a],[0,2ε]] gives (ε,2ε); exchange gives (2ε,ε); n=1 gives ε | ordered diagonal valid |
| 1.4 | n=2,d=1: dim flag+stabilizer=1+3=4; n=1,d=2:0+2=2 | dimensions agree |
| 2.1 | unit: (Fil⁰,Fil¹)=(K,0); t·unit: (Fil⁻¹,Fil⁰)=(K,0); ν=J₂≠0 retained | shift −a valid |
| 2.2 | A dual: dim_E A=2, dim_E(A⊗E)=1; (A,0) has ranks (1,0); εA→A tensors to zero E→E | projective, not constant-rank graded pieces |
| 2.3 | h=(0,2) gives ranks(1,2); (0,0) only one jump; two embeddings (0,2),(1,4) give both ranks(1,2) | labelled jumps valid |
| 2.4 | n=2:1+3=4; n=1,d=2:2; N=0 admits every flag and infinitesimal ε | same smooth model |
| 3.1 | n=1:0 ordered pairs; n=2 ratios1,ε excluded; ratio τ₁τ₂⁻¹: generic false but regular true | loci distinguished |
| 3.2 | δ and δx have localized ratio t invertible; δ(1+εlog)/δ has derivative ε≠0 | based uniqueness required |
| 3.3 | k=1,wt0: H⁰,H¹=(1,1); wt1:(0,0); k=0 quotient0→(0,0); ratio1+εlog not algebraic | intervals and nilpotents agree |
| 3.4 | rank-one localization gives period rank1; tD versus D positive lattices tW⁺≠W⁺, localized periods equal; zero extension→0 | exact functor need not reflect splitting |
| 3.5 | δ=x², δ_A=δ(1+εlog): (2+ε)−2=ε; finite-order χ: wt=ν=0 | residual subtraction correct |
| 4.1 | n=1 regular vacuous; valuations(1,−1) have sum0 but not ordinary; η(Frob_arith)=2 yields δ(3)=1/2 | R01 |
| 4.2 | n=1,i=0:H⁰=E,dim1; i=1 quotient0→dim0; R⊕R gives dim2 | upper index n−1 correct |
| 4.3 | gaps3,slope2:2<3; slope3:3<3 false; gaps(3,1),slope2: true,false | strict all-embedding test |
| 4.4 | k=(0,3),slope2: WD2<3, parameter2−0<3; d=2 k=(1,4) each: WD slope4<5 and δ slope2<3 | inequalities agree after R01 convention |
| 4.5 | N rank1:1 stable line; distinct eigenlines,N=0:2 refinements; split: noncritical1,critical1; equal eigencharacters excluded | NT21 Example2.10 agrees |
| 5.1 | ν=0 on E²: ker/coker dims2/2; J₂:1/1; zero extension maps0 | right-exact interpretation valid |
| 5.2 | ℚ₃,unr(2)x²: εδ⁻¹=unr(1/6)x⁻¹; finite shift k=1 rank1,k=2 rank0,full localization rank0; δ=1:H⁰=E | finite/full distinction valid |
| 5.3 | rank1 δ_A derivativeε pairs with ν=ε; pairingν=0 has differenceε≠0; identity base map unchanged | matching condition substantive |
| 5.4 | ν=0 generic localized pair: extension split; J₂≠0 excluded; repeated1 has e₁/e₂ distinct flags | ν=0 and generic lifting context retained |
| 6.1 | D,tD share localization but lattices W⁺,tW⁺ differ; dual gluing maps1,1+ε differ | period lattice must be retained |
| 6.2 | n=2,d=2:6−4=2; δ=1 has H⁰dim1; n=1 nonintegral-weight character has zero D_pdR | R03: missing almost de Rham domain |
| 6.3 | n=2,d=2:14 period,8 rigidified;8+8−2=14; n=d=1:2+1−1=2 | dimensions valid |
| 6.4 | n=2,d=2:8+6=14; n=1,d=2:2+2=4 | zero fibre would lose2 directions |
| 6.5 | n=1:|Weyl|=1; point outsideX_w:0 residual objects; conjugation preserves relative position | empty case excluded |
| 6.6 | n=2,d=2:dim14=8+6; E[[x,y,z]]/(xy−z²):dim2,edim3 normal singular | normal≠smooth |
| 6.7 | s:(ε,2ε)↦(2ε,ε)≠identity; (123)⁻¹:(ε,2ε,3ε)↦(2ε,3ε,ε) | nilpotent graph detection valid |
| 6.8 | n=2,d=2:dim10;10+8=14+4; n=1,d=2:dim3 | frames distinct |
| 6.9 | n=2,d=2:4−8+6+8=10; N=0 equal flags supports{e,s},distinct flags{s} | sufficient support limited toN=0 |
| 7.1 | n=1:one flag; repeated parameters R[1/t]²:at least e₁,e₂ | genericity essential |
| 7.2 | node y↦(0,y),product kernel0,single-branch kernel(y); tR quotientR/tR nonprojective | all branches required |
| 7.3 | roots ε,2+3ε: X²−(2+4ε)X+2ε; roots±ε: productX² | simple residual roots essential |
| 7.4 | n=2,d=2:10+8=8+10=18; n=1,d=2:3+2=2+3=5 | smooth dimensions agree |
| 7.5 | n=1:dim d+1 smooth; normal node-cone surface dim2,edim3 | no smoothness overclaim |
| 8.1 | n=2,d=1:7−4=3,7−2=5; t↦xy:fibre0=two axes,tangentdim2>dim1 | flat≠smooth |
| 8.2 | k_m=(a+(p−1)p^m,b−(p−1)p^m):gap=a−b+2(p−1)p^m→∞,p-adic increments→0; repeated weights gap0 | density requires whole neighbourhood basis |
| 8.3 | e=2,b=1,gap3:3>2;gap2 false; b=0,(0,2):−2>0 false; ramified finiteχ has wt0 but units≠1 | algebraic unit hypothesis necessary |
| 8.4 | same weight sequence has distance→0 and integer gap→∞; disjoint component intersection∅ | local density requires declared gaps |
| 8.5 | GL₂:w=s,w_x=e:7−1+1=7;GL₃:w=w₀,w_x=e:15−1+3=17 | fixed-space codim differs from length |
| 8.6 | n=1 coverdegree1; distinctα,β:2 reduced points; equalα: E[u]/u²,length2 | R06: family belongs to supplier §3.5 |
| 8.7 | S₂:w_x=e allows2,w_x=s allows1; noncritical line≠Hodge line→s; S₃:s₁≤s₁s₂,s₂≰s₁ | order orientation valid |
| 9.1 | n=1,d=2:3−2=1;n=2,d=1:8−3=5;n=2,d=2:12−6=6 | weight codimension valid |
| 9.2 | S₂:w=s,w_x=e→C_e+C_s;w=e,v=s coefficientP_(s,e)=0;J₂ has onlye₁ stable,zero-section term0 | allows vanishing terms |
| 9.3 | n=1,d=2 full fibre0,unit fibre1; unram values1,2 restrict identically to units | different fibres |
| 9.4 | n=2,d=1:8−5=3;d=2:12−8=4;[Z]+(−[Z])=0 | conjecture only; signed group |
| 9.5 | F₂=C₂,F₁=C₁+2C₂→C₁=F₁−2F₂;0=C₁+C₂ admits(a,−a) | all-family gap necessary |
| 9.6 | n=1,d=2:3−3=0;n=2,d=2:12−8=4;weight/full difference6−4=2 | n unramified directions |
| 9.7 | same presentation coefficient1; S₂ different irreducibles not automatically equal | only allowed parabolic presentations |
| 9.8 | split GL₂ fibre:[Z_cr]+[Z_other],generic lengths1,1;absentδ:0 | crystalline case only |
| 9.9 | GL₂ source7,base4,fibre3;unitbase2,fibre5;two components lengths1+1 | singular fibre in smooth source |
| 10.1 | w=(123) sends (φ₁,φ₂,φ₃) to (φ₃,φ₁,φ₂); d=2 modified weights(0,0,0) have gaps0,0 | R04 expands the defined domain |
| 10.2 | n=3: submodule weights(3,1), quotient weights(1,0), both rank2; localization of inclusion–projection has diagonal(1,1), rank2 | endpoints and injection retained |
| 10.3 | n=2: Homdim1, nonzero map rank1; n=3 pencil: exceptional maps rank1, generic maps rank2; determinant pencil has at most2 exceptional projective roots | rank-drop criterion has correct n≥3 condition |
| 10.4 | d=1 annihilator dim1=dim E[D]; d=2 dim2>1; 2·cup=0 iff cup=0 | recovery limited to d=1 |
| 10.5 | d=1: weights unchanged; d=2: off-σ (3,1,0)→(0,0,0), endpoints→(0,0), independent endpoint cutoff gives(1,1) | ambient cutoff necessary; duplicate Check |
| 10.6 | d=2: annihilator dimensions original2,modified1; d=1:1=1 | one embedding contributes |
| 10.7 | a=2: normal(1,−1,1) dot line(1,2,1)=0; a=0 line coordinate0; a=1 normal coordinate0 | noncritical controls hold |
| 10.8 | d=1 identity; d=2 two distinct generic off-σ flags map to same constant flag; (3,1,0)→(0,0,0) | surjective, noninjective; R04 |
| 11.1 | v_K:(ϖ,u)↦(1,0), log_σ↦(0,log_σu); d=2 smooth/σ/full dimensions1/2/3; log_τ is outside Hom_σ for τ≠σ | rank-one derivative directions distinguished |
| 11.2 | scalar log twist gives (log,…,log) and de Rham=false; scalar v_K gives(v_K,…,v_K) and de Rham=true | zero twist gives0 in every refinement |
| 11.3 | n=3,d=1:self10,g4,w7,target6,kernel1; (123) sends(1,2,3)→(3,1,2) | dimensions/ordered action agree |
| 11.4 | n=2,d=1:kernel0,quotient5; n=3,d=1:kernel1,quotient9; n=3,d=2:kernel4,quotient15 | finite-dimensional rank-nullity applies |
| 11.5 | n=2,d=1:gdim2,g′dim3; (log,log) allowed,(log,0) excluded, difference log≠smooth | determinant direction distinguished |
| 11.6 | blocks(2,1):graded(2,1),cumulative(2,3); P=G gives identity; P=B gives ordered scalar derivatives | no cumulative-rank substitution |
| 11.7 | n=3,d=1,P(2,1):dimP7,Ext8,quotient7=4+3; B quotient3d+3,G6d+3 | plus-n sign correct |
| 11.8 | n=3,d=2,blocks(2,1):image7=3+2·2; (log,log,0) allowed,(log,0,0) excluded | W_P exchanges only first two |
| 12.1 | d=1:J=∅,partial=full; d=2 rank1:partial2,full3; log_σ allowed,log_τ excluded | empty complement legitimate |
| 12.2 | n=3,d=2:partial13,P(2,1)11,zero4; quotient7=5+2 | partial-cohomology gap retained |
| 12.3 | n=2,d=2:self9,g2,smooth-preimage3,partial5,partialB4 | modified g≠smooth-preimage |
| 12.4 | d=1:T=id; split class0→0; εid has E-characteristic polynomial X² but nonzero A-operator | nilpotents preserved |
| 12.5 | n=3,d=2:kernel3,g7→4,partial13→10,self19→image16⊊19 | full surjectivity correctly denied |
| 12.6 | n=2,d=2:g-kernel0,full-kernel1; n=3:any d g-kernel1; d=1 kernels coincide | restricted kernel essential |
| 12.7 | n=3,d=2:zero4→1,kernel3; partial quotient13−4=10−1=9 | quotient equality correct |
| 13.1 | ι=0:maps0,ranges0; ι=id:mapsid,rangesfull; 2ι:maps doubled,same ranges | actual endpoints required |
| 13.2 | n=3,d=1:(dim images,intersection,sum)=(2,0,4); d=2:(4,1,7); n=4,d=1:(6,3,9) | 2a−b=c in all cases |
| 13.3 | n=3,d=2:injective image5,exceptional4,zero0; scalar smooth derivative on rank2 endpoints=(ψ,ψ) | R02 defines ordered endpoint tuple |
| 13.4 | f=g=id:E→E:range anti-diagonal; (1,−1) yes,(1,0),(1,1) no; f=g=0:range0 | same at p=2 since char E=0 |
| 13.5 | 2ι andι have same nonzero relation; 0 has zero relation; d=1 annihilator1,d=2 annihilator2 | no general-K recovery from unmodified relation |
| 13.6 | (1+εψ)(1−εψ)=1; scalar deformation gives M=0; n=3,d=1:G filtration output dimensions(2,5),exchanged(5,2) | exchanged last scalar coordinate correct |
| 13.7 | n=3,d=2:15+15−11=19; n=2,d=1:4+4−3=5 | whole intersection subtracted |
| 13.8 | n=2,d=1:two refinements4+4−3=5; n=3,d=1:first/last8+8−6=10 | induction needs §11.7 direct proof, not spanning |
| 13.9 | ψ=0,M gives([ι⁻M],[−ι⁺M]); scalar ψ gives coordinates(ψ,−ψ),sum0; equal positive coordinates sum2ψ≠0 | representative existence matters |
| 13.10 | n=3,d=1:V14,target9,L5; n=2,d=1:V8,target5,L3 | exact dimensions match |
| 13.11 | n=3,d=2:partial image3,original5; n=2:injective image1,zero image0 | modified rigidity distinguished |
| 13.12 | ψ=log_σ:twist product1,partial allowed; log_τ:twist product1 but partial false; ψ=0 trivial twists | partial condition not mere cancellation |
| 13.13 | n=2,d=2:endpoint2,scalar2,V8; target5 givesL3; d=1 agrees original; nonexistent D₂,σ has no domain to evaluate | R07: replace the undefined-endpoint Check |
| 13.14 | n=3,d=2:V14=target9+L5; n=2,d=2:8=5+3 | all-K recovery uses modified annihilator1 |
| 13.15 | n=3,d=2:original partial13−zero4=9,modified10−zero1=9; both V14,L5 | commutative comparison has matching dimensions |
| 13.16 | n=2,d=2:partial refinement5,zero1,quotient4; total partial6,quotient5; two quotients4+4−3=5; modified4+4−3=5 | original and modified partial spanning agree |


Additional convention and contract instances: the trivial Tate-normalization line over ℚ₂ has Robba φ=1, BHS weight +1, NT weight −1 and filtration jump −1; R(x) has φ=2 instead. For ramification index e=2 and vₚδ(ϖ)=1, vₚδ(p)=2. For φ=diag(1,p), N(e₂)=e₁, both Nφ(e₂) and pφN(e₂) equal p e₁. Herr scalar operators φ=2, γ=3 give d⁰(1)=(1,2), d¹d⁰(1)=2−2=0 and d¹(1,0)=2; interchanging the degree-one coordinates requires the stated degree-two sign. At p=2, the unit-character space retains two sign components with values +1 and −1 at −1. A field has one prime; the unit-ideal quotient and zero coefficient ring have no residue-E marking and cannot enter Art_E. For J=∅, the partial condition has zero period equations and the dimension formula reduces to the Herr Euler characteristic.

## Not verifiable

- The 12 declared supplier contracts are future inputs, not implemented theorems. This review does not certify their completed proofs. Their registration, ownership and compatibility with the target instances were checked; no missing-source request is needed for the seven accessible cited works.
- The nonconsumed ownership exclusion PadicLocalLanglandsForGL2QpPartII GR.1/nontrianguline-differential-control could not be independently resolved to a current design file in the supplied checkout. Its board review mentions that target, but a review is not the target itself. No target of this package depends on it; this is not a missing-prerequisite finding.
- Ownership against open pull requests without supplied files was not exhaustively checked. The explicitly supplied sibling heads, available main/Completed roadmaps and board designs were searched; the service searches were used as leads and the relevant supplier text was read.
- There is no elaboration evidence: Lean runs were prohibited and there are zero named declarations to elaborate. The absence of period/moduli carriers is a pinned source-search result, not a claim that arbitrary encodings are logically impossible.

## Source issues

- **Misprint** in BHS19 at §3.2 before Lemma 3.2.2, printed p. 337, BHS19 line 1564: the source says every filtration grade is free of rank one; it should be finite projective, with possibly zero and embedding-dependent ranks; affects a stated result.
- **Misprint** in BHS19 at Lemma 3.7.5, printed p. 369, BHS19 line 2816: the source says the filtration grades are free over the entire product coefficient ring; it should be projective, and free on each embedding component; affects a stated result.
- **Misprint** in BHS19 at (3.19) and the proof of Lemma 3.4.2, printed pp. 349–350, BHS19 lines 2049 and 2092: the source says the Herr/B-pair extension space and comparison carry A⊗K-linearity; it should be A-linearity, with additional A⊗K-linearity on the period-cohomology target; affects a stated result.
- **Gap** in BHS19 at proof of Proposition 3.7.2, printed p. 367, BHS19 lines 2691–2693: the source says completion at one selected birational preimage gives an injective map from the reduced source completion; it should be justified using all normalized branches; one node branch kills the other; affects the proof.
- **Error** in BHS19 at Conjecture 4.3.4, Remark 4.3.5 and (4.11), printed pp. 381–382, BHS19 lines 3265–3270: the source says full-character codimension is dn(n+3)/2; it should be dn(n+1)/2+n, giving dimension n²−n+dn(n−1)/2; affects a stated result.
- **Gap** in BHS19 at proof of Proposition 4.3.6, printed p. 382, BHS19 lines 3291–3293: the source says zero fibre cycle forces each constituent cycle to vanish; it should be deduced from separating equations, since signed cycles can cancel; affects the proof.
- **Misprint** in BHS19 at the definition of δ₀ before Proposition 4.3.7, printed p. 383, BHS19 lines 3335–3336: the source says strict dominance uniquely determines an algebraic twist; it should be strict dominance with the prescribed labelled weight multiset; affects the proof.
- **Misprint** in BHSsmooth17 at proof of Lemma 2.3, author printed p. 10, BHSsmooth17 line 398: the source says the nilradical of the already reduced localization is the ideal to annihilate; it should be the nilradical of the original finite algebra; affects the proof.
- **Misprint** in BHSsmooth17 at proof of Lemma 2.10, author printed p. 15, BHSsmooth17 line 647: the source says the strict comparison includes j=i; it should be j>i; affects the proof.
- **Misprint** in NT21 at proof of Lemma 2.4, printed p. 29, NT21 line 1105: the source says to test indices through i=n using δ_(i+1); it should be 0≤i<n; affects the proof.
- **Misprint** in NT21 at proof of Lemma 2.8, printed p. 32, NT21 line 1263: the source says the Hodge number belongs to Fil_i; it should be the Hodge number of the previously defined submodule M_i; affects the proof.
- **Misprint** in Ding25 at proof of Proposition 2.2, printed p. 12, Ding25 line 516: the source says the complementary quotient labels are {n−2,n−3}; it should be {n−2,n−1}; affects the proof.
- **Misprint** in Ding25 at proof of Lemma 2.11, printed p. 16, Ding25 line 708: the source says the last triangulation factor has algebraic weight h₁; it should be h_n; affects the proof.
- **Misprint** in Ding25 at proof of Corollary 2.14, printed p. 19, Ding25 line 860: the source says the quotient dimension is d dim(B∩L_P)−n; it should be d dim(B∩L_P)+n; affects the proof.
- **Misprint** in Ding25 at proof of Lemma 2.16, printed p. 20, Ding25 line 933: the source says adjoint weight indices run to r; it should be n, the rank of D; affects the proof.
- **Misprint** in Ding25 at proof of Proposition 2.17, printed p. 21, Ding25 line 961: the source says the partial B-pair cohomology formula is applied to W_dR⁺; it should be applied to the full B-pair W; affects the proof.
- **Misprint** in Ding25 at proof of Corollary 2.33, printed p. 29, Ding25 line 1270: the source says the expanded dimension sum does not subtract the entire intersection; it should be 2(1+(n²−n+1)d)−(1+(n²−2n+2)d)=1+n²d; affects the proof.
- **Misprint** in Ding25 at the definition preceding Corollary 2.38, printed p. 31, Ding25 line 1361: the source says the relation has endpoint D₂,σ; it should be C₁,σ; affects nothing.
- **Misprint** in Ding19 at Appendix A before (52), preprint printed p. 45, Ding19 line 2050: the source says the representation comparison has B-pair cohomology on both sides; it should be representation cohomology Hⁱ(G_L,V) on one side; affects nothing.
- **Gap** in Ding19 at proof of Proposition A.3, preprint printed p. 46, Ding19 lines 2088–2089: the source says its twist kills H⁰ under the stated J-condition; it should be treated separately when J is empty, using the Euler characteristic; affects the proof.

The cycle-dimension error gives −1 instead of 0 for n=1,d=2. The signed-cycle gap is witnessed by [Z]+(−[Z])=0. For the empty-J proof gap, the trivial line over ℚₚ has H⁰-dimension 1 and H¹-dimension 2, whereas the unsupported intermediate vanishing step would give H¹-dimension 1; the stated final formula remains correct.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "fe88ef7899698a7d0449a09170f2c9fad213c3b3", "job": "RT-TriangulineVarietyAndItsLocalModel~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
