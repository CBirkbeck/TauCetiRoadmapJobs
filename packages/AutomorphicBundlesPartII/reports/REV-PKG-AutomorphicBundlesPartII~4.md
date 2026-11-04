<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1029#issuecomment-6400580667 -->
Review (codex) of 1241d47

Verdict: needs_changes

1. **F01** (P1) Perfect proper pushforward is attributed to the wrong supplier

   **Location:** `packages/AutomorphicBundlesPartII/README.md:69`, “scalar-linear derived cohomology, perfect proper pushforward”; §1.4 at lines 248–262, especially “Apply proper perfect pushforward with all its flatness and support hypotheses.”

   **Claim:** The SchemeAndStackFoundations contract says its listed sections supply perfect proper pushforward, and §1.4 uses that input without citing its actual owner. The cited sections supply derived pushforward, coherent finiteness, duality and Tor-independent base change; they do not state preservation of perfect complexes under proper flat finitely presented pushforward. This is the specified supplier-drift defect, rather than an objection to the true mathematical assertion in §1.4.

   **Witness:** `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1057` states `perfect_proper_pushforward` in E1.9; lines 1066–1070 explicitly specialize to proper flat finitely presented morphisms. SchemeAndStackFoundations §§2.6 and 2.18 state different results.

   **Exact repair:** Remove “perfect proper pushforward” from the SchemeAndStackFoundations contract. Add EnhancedDerivedSheaves E1.9 and its `perfect_proper_pushforward` to the ownership/contract text, §1.4's Needs line and the Layer 1 dependency summary. Specify the application with E=F_can or F_sub perfect and G•=O_X[0], under the existing proper, flat, finite-presentation hypotheses. This also supplies the asserted arbitrary derived coefficient base change. Do not add another generic theorem or a supplier gap: E1.9 already owns it and is earlier in the merge order. Base-ring perfectness still does not imply deck-group-ring perfectness.

   **Repair tested:** For X=P¹_O and E=O(−2), RΓ(E)=O[−1]; base change to A₂ gives A₂[−1], perfect on both sides. The omitted target-flatness cannot be discarded: for Spec k→Spec A with A=k[ε]/ε², E=O is perfect on the source but its pushforward k has Tor_j^A(k,k)=k for every j≥0. E1.9 excludes this nonflat example. Its G•=O_X[0] specialization admits the package's proper flat example exactly.

2. **F02** (P3) The endpoint Check does not distinguish support from completion

   **Location:** `packages/AutomorphicBundlesPartII/README.md:471`, “Interchanging local support with completion exchanges these answers incorrectly.”

   **Claim:** The preceding I=(0) and I=(1) computations distinguish completion from the open-complement term, but do not distinguish completion from ordinary local cohomology with support.

   **Witness:** For any nonzero ring A, RΓ_V(0)(A)=A=Λ_(0)(A), while RΓ_V(1)(A)=0=Λ_(1)(A). Interchanging support and completion preserves both answers.

   **Exact repair:** Replace the last sentence by the statement that ordinary support and completion agree at these two endpoints, so these endpoints do not distinguish the constructions. Keep the adjacent k[x], I=(x) example as the distinguishing Check; it already has the needed nontrivial values.

   **Repair tested:** For A=k[x], completion has H⁰=k[[x]] and H¹=0. Ordinary local cohomology has H⁰=0 and H¹=k[x,x⁻¹]/k[x], with nonzero class x⁻¹. These values separate the two objects. No theorem or Lean signature needs changing.

Two findings: one P1 supplier-contract defect and one P3 Check defect. Both findings from round 3 are repaired. The package is repairable without changing its scope. No authored README, Lean file, metadata, plan or source entry was changed.

## Verified sound

Read the 69 numbered target subsections, all 70 Needs lines, eight layer dependency summaries, conventions, supplier contracts, metadata, source manifest and complete 84-line acceptance file. The previous review's computed rows were used only for unchanged assertions they actually tested; its prose summaries were not treated as mathematical evidence. The changed transpose and dependency passages, every seeded target and the headline interfaces were checked afresh. The compact table below records 63 computation rows, including the two findings and additional controls for the repaired patterns. These computations test statements and interfaces; they are not substitutes for proofs of the general geometric theorems.

The Part II boundary is explicit: AutomorphicBundles B0–B5 ends at bundles and section Hecke operators; this package develops higher coherent cohomology and its geometric actions. It retains the general PEL vanishing target and all three GSp₄ ranges. A source's small-weight or good-reduction hypotheses are scoped to its theorem, not imposed on the whole library. No executable-algorithm target, copied source passage in the inspected statements, admitted data definition, substitute Prop field, `set_option` or `lemma` declaration was found. The main-branch shape references read were `TauCetiRoadmap/ComplexTori/README.md` and `TauCetiRoadmap/LocalGaloisGroups/README.md`. The package has the required prose layers, definition APIs and at least three Checks per definition; R02 identifies a defective discrimination within those Checks.

### Previous findings, checked first and individually

| Round-3 finding | Status | Repaired passage and verification |
|---|---|---|
| F01, transpose restricted to finite locally free legs | Repaired | README:664 says “No finiteness or flatness of the legs is required.” README:666 says “For the two global actions require both p₁ and p₂ proper.” The perfect-coefficient, Noetherian and smooth separated finite-type conditions are explicit. The proof uses invertible relative dualizing objects, not finite-flat duality alone. |
| F02, missing local Needs edges | Repaired | README:511 and :553 now include “§3.0a”; :930, :1067 and :1081 include “§5.0”. These supply the solid branches and the quotient/EO/regular-thickening inputs consumed in the prose. |

The enlarged transpose is supported by BP26 Proposition 2.7.3 and proof, pp. 23–24, BP26 line 1182 through line 1199. Smooth source and target over the base make each leg lci, including a closed point into A¹ and a blow-up of P². Perfect tensor duality gives both displayed exchange identities. The relative construction does not require the base itself to be Gorenstein. The properness requirement for both global actions remains separate from existence of the coefficient transpose.

The pattern sweep read the added §3.0a dependencies at README:617, :697 and :729 and the added §5.0 dependency at :1109. It also checked §3.9's four examples, its lci proof, §5.7's use of duality, the solid/discrete comparison and the distinction between proper and finite legs in the normalized compactification supplier. No recurrence of the finite-leg restriction or those missing local inputs was found. The earlier settled Su regularization issue remains a precise declared supplier contract, not a finding re-raised here.

### Source sample: all fifteen targets

There are sixteen source keys: fifteen cached texts and settled uncertified GK19. No fetch or manifest modification was necessary. Source lines below refer to the service's extractions; printed page numbering was checked separately from PDF page markers. A section locator can support a construction plus its formal consequences without containing the roadmap's generalized theorem verbatim; the necessary generic inputs are identified below.

| Target | Text and locator read | Verification |
|---|---|---|
| 1.2 Integral dual-Weyl automorphic coefficients | BP26 §4.3.1 and Remark 4.3.2, pp. 46–47, BP26 line 2410 through line 2430 | The right-B realization and coefficient functor agree. The package corrects the printed left-translation inverse. Field theory is imported; arbitrary integral lattices remain the explicit LP3.0 gap. Symmetric and divided powers are distinguished in characteristic two. |
| 1.4 Integral coherent cohomology complexes | BP26 §1.1, p. 2, BP26 line 55 through line 73; CG18 §7.2, pp. 395–400, CG18 line 3963 and line 4139 through line 4162 | Canonical/subcanonical RΓ and derived Hecke models are supported. General proper-flat perfectness is a generic supplier application, not established by the introductory BP26 paragraph. R01 corrects its owner. |
| 3.3 Composition of cohomological correspondences | BP26 §2.2.9, p. 14, BP26 line 696 through line 723; §2.3.12, p. 17, BP26 line 854 through line 875; P20 §4.3, p. 19, P20 line 811 through line 836 | The sources construct the actual pullback/coefficient/trace action. Composition is the formal consequence of the named adjunction, base-change and enhancement coherences. The package retains those prerequisites and the order of the coefficient arrows. |
| 3.6 Base change | BP26 §2.6.12, pp. 22–23, BP26 line 1132 through line 1150 | Finiteness of S′ is not used as a substitute for Tor-independence or flatness of F. The general discrete branch explicitly uses its supplier's Tor-independent derived comparison. README's line-1088 anchor is the beginning of printed page 22, not the theorem itself. |
| 3.7 Twisting by an automorphic coefficient | BP26 Propositions 4.3.9 and 4.3.11, p. 48, BP26 line 2481 through line 2500; scalar projection formula at BP26 line 1039; P20 §4.3, p. 19, P20 line 829 | Tensor transport and projection formula give the stated coefficient arrow. Invertibility of the twist map is not assumed integrally; it is a separate rational assertion in §3.8. |
| 3.11 Derived formal completion | BP26 Lemma 2.9.3, pp. 27–28, BP26 line 1403 through line 1414; localization triangles at BP26 line 1368 through line 1402 | The completed locale, pseudo-coherent discrete input and object completion agree. The two localization triangles are distinct. R02 concerns an endpoint Check elsewhere, not this theorem. |
| 5.2 Toroidal-to-minimal relative vanishing | Lan17 Definition 8.5 and Theorem 8.6, p. 34, Lan17 line 1490 through line 1516; Remark 8.9, pp. 34–35, Lan17 line 1533 through line 1539 | Canonical n>0 versus subcanonical n≥0, finite base-module filtration and local/refinement forms are preserved. Normalized models do not acquire smoothness by assertion. |
| 5.14 Localized coherent perfect complexes | CG18 §7.2, p. 400, CG18 line 4153 through line 4162 | The source constructs localized perfect models. The package applies the finite derived-action/idempotent suppliers to its actual geometric action; it does not assert that arbitrary prime localization is an idempotent summand. |
| 5.16 Congruence localization over C | P20 §15.2.3, p. 108, P20 line 4931 through line 4963 | Residual congruence selects all characteristic-zero eigensystems reducing to the residual ideal. The coefficient embedding and finite integral algebra are retained. Localization is not at one complex maximal ideal. |
| 6.8 Holomorphic cusp eigensystems | P20 §5.3, pp. 24–25, P20 line 1050 through line 1089; Sch15 Corollary V.1.7, p. 83, Sch15 line 3089 through line 3107; CG20 proof of Proposition 6.8, p. 39, CG20 line 1560 through line 1573 | Corrected parameter (1−k−r,2−r;k+2r), multiplicities and level invariants are retained. Sch15's scalar-weight bounds are k>n in the totally real case and k≥n in the CM case. Semisimplicity of the Hecke image does not assert uniqueness of a global representation. |
| 7.3 Large singular-weight interior decomposition | P20 Theorem 15.2.2.1 and Theorem 15.2.3.1, p. 108, P20 line 4922 through line 4951 | The negative-parameter convention requires −λ₁≥R_sing. Holomorphic and generic multiplicities remain separate. This bound is not substituted for §8.8's global root-separation bound. |
| 8.4 Boundary Satake factorization | BCGP21 proof of Lemma 3.10.7, pp. 238–239, BCGP21 line 3327 through line 3357 | Four distinct spin monomials and the two quadratic factors are retained, correcting the printed repetition. The rank-two realization and GL₁ character give a reducible four-dimensional representation; recognition uses full polynomials in small characteristic. The local identity remains the named gap. |
| 8.5 Degree-zero Hilbert–Siegel boundary vanishing | BCGP21 Lemma 3.10.7 and Remark 3.10.6, pp. 237–239, BCGP21 line 3314 through line 3357; BR16 Theorem 1.12 and Proposition 1.14, pp. 10–12, BR16 line 523 and line 579 through line 647 | Characteristic-zero boundary weight restrictions, parallel lower weight and the scalar-parallel case agree. BR16 line 648 warns against importing the characteristic-zero argument over general coefficients. The package concludes H⁰ boundary vanishing only. |
| 8.6 Localized degrees zero and one | BCGP21 proof of Theorem 3.10.1, p. 239, BCGP21 line 3380 through line 3399; P20 Corollary 15.2.3.1, pp. 108–109, P20 line 4954 through line 4970 | H⁰ isomorphism and H¹ injection follow from the exact sequence. H¹ boundary need not vanish. The missing source localization subscript is corrected. The rational all-degree assertion uses the separate §8.2 theorem. |
| 8.9 Conditional coherent dimension equality | BCGP21 Corollary 3.10.5, p. 237, BCGP21 line 3302 through line 3309; P20 Proposition 15.2.4.1, p. 109, P20 line 4986 through line 5000; CG20 proof of Theorem 7.11, pp. 54–55, CG20 line 2116 through line 2186 | h¹=l₀h⁰ retains the large-gap and classification conditions. The independent rational a≥2 route retains nongeneral-type exclusion and same-finite-part packet pairing; it does not acquire a large-weight restriction. |

The other unresolved-looking source status is GK19, already settled as uncertified; it was not reopened. The Su24 and Lan–Suh contract locators were also checked: Su24 Proposition 4.1, p. 38, line 1609; its central condition at line 259 and inverse coefficient action at line 361; LanSuh Theorem 3.24, pp. 20–21, line 986, and Proposition 7.21, pp. 41–42, line 2012. The cached Lan17err and LanSuhErr do not invalidate the scoped targets. H90's cached OCR and CG20's readable restatement support the separate Harris cusp/interior comparison.

### Computed adversarial pass

Here Aₙ=O/(ϖⁿ), k is a field and cohomological degrees are integers. “Retain” means the computed result agrees with the stated law or is excluded by an explicit hypothesis. Formal q=1 tests are polynomial specializations, not assertions of a field with one element.

| Statement / convention | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Coefficient and integer-degree definitions | O=Z₃, n=0,1,2; Spec A₂, i=−1,0,1 | Quotients 0,F₃,Z/9; cohomology 0,A₂,0. Bare toNat at −1 would give A₂ | Retain n>0 and actual negative-degree zero branch. |
| 1.1 Polarized frame | Rank one, ψ₁=2,c=3; rank zero | ψ₂=3/2 gives product 3, wrong ψ₂=2 gives 4; rank zero retains multiplier G_m | Retain polarization and multiplier datum. |
| 1.2 Translation | Three-cycle matrix m, f=m₂₁, acting identity | Correct f(m)=1; wrong f(m⁻¹)=0 | Correct inverse position; nonabelian test. |
| 1.2 Integral lattice and boundary | Rank two, degree two, char 2; weight zero | Symmetric square mixed coefficient 2=0, divided power coefficient 1; canonical O versus subcanonical I_D | Retain integral lattice gap and boundary twist. |
| 1.3, 4.1, 6.7 Normalization | (a,b)=(5,2), x=2; (4,2) | 128·4⁻³=2 versus wrong 128·4³=8192; second normalized scalar 1 | Same ν⁻³ convention in each layer. |
| 1.4 Derived reduction | [O→ϖO] in degrees 0,1 | H=(0,k); derived tensor gives (k,k), ordinary tensor of H⁰ gives 0 | Retain derived tensor. |
| 1.4 Perfect pushforward | P¹_O,O(−2); Spec k→Spec k[ε]/ε² | RΓ=O[−1], reduction=A₂[−1]; nonflat push k has Tor_j=k for all j | R01: cite E1.9 with flatness. |
| 1.4 Deck ring | k=F₂, Δ=C₂, trivial module | Tor_j over k[Δ] is k for all j; over k higher Tor is 0 | Base perfectness does not imply deck perfectness. |
| 1.5 Matlis and inverse action | δ=2 over F₅; ramified ϖ²=p, p odd | Dual scalar 3, 3·2=1 versus 2·2=4; different (2ϖ), trace-dual lattice (2ϖ)⁻¹O | Retain inverse action and extra trace-character data. |
| 1.6 Duality headline | P¹_A,F=O(2), A=Z/9 or k[t]/t² | Dual H¹(O(−4))=A³=H⁰(O(2)); dual H⁰(O(−4))=0=H¹(O(2)) | Works also for k=F₂ and C; no Z_p-only signature. |
| 1.6 Degeneracies | d=0,F=O or 0; i outside [0,d] | A∨=A; 0∨=0; both sides zero in outside degrees | No truncating subtraction or zero-coefficient problem. |
| 1.6 Wrong trace/base | Elliptic curve; B=k[ε,δ]/(ε,δ)²,F=k | RΓ(ω)[1] has H⁻¹=k,H⁰=k, unlike k[0]; dual dimension 2, bidual 4≠1 over B | Trace is a morphism; Gorenstein/local-freeness restrictions matter. |
| 2.1–2.3 Equivariant model | Split C₂ torsor, k=F₂; nonflat k over A₂ | Upstairs k-rank 2, rank 1 over k[C₂], invariants rank 1 over k; trace(1,0)=1; ϖk=0 | No averaging; nonflat coefficient excluded from lifting theorem. |
| 2.4 Dual model | P¹_k,F=O | F has (H⁰,H¹)=(k,0); F∨ω has (0,k) | Correct coefficient and chain/cochain reversal. |
| 2.5 Hyper-Tor edge | R=F₂[t]/t²,C=[R→tR] in homological degrees 1,0 | H₁=H₀=k; Tor₂(k,k)→H₁⊗k is id; next k→k is zero | Retain Tor₂ term. |
| 3.0a Endpoint Check | I=(0),(1), nonzero A | Completion A,0; ordinary supported RΓ also A,0 | R02: endpoints do not distinguish the two. |
| 3.0a, 3.11 Completion | A=k[x], I=(x) | Completion H⁰=k[[x]],H¹=0; support H⁰=0,H¹=k[x,x⁻¹]/k[x], x⁻¹≠0 | Retain separate triangles and scheme analytic structure. |
| 3.0b, 3.4, 3.8 Integral/rational transport | Multiplication p; q=t²; inseparable t²=s over F₂ | Rational p·p⁻¹=1; p⁻¹∉O; derivative 2t vanishes at 0; inseparable algebra trace 0 | No automatic integral inverse, smoothness or nonzero trace. |
| 3.1–3.2 Actual action | Identity legs, T=2 or 0; split r-point cover | 1 maps to 2 or 0; unit followed by trace maps 1 to r | Actual coefficient arrow and trace determine the operation. |
| 3.3 Composition | Pullbacks x→x+1 and x→2x | Composite x→2x+1; reversed composite x→2x+2 | Retain order and explicit §3.0a input. |
| 3.5 Derived descent | Regular/trivial C₂-modules over F₂ | Regular coinvariants k in degree 0; trivial module derived coinvariants H_j=k for all j≥0 | Flatness separates ordinary and derived descent. |
| 3.6 Base change | O→k pulled back along itself; identity square | k⊗ᴸ_Ok has k in degrees −1,0; ordinary tensor only degree 0; identity has Tor₁=0 | Retain Tor-independence and coefficient conditions. |
| 3.7 Tensor twist | Line transports 1,0,p | Induced scalar operators 1,0,p; inverse of p requires p⁻¹ | Transport need not be an integral isomorphism. |
| 3.9 Proper nonfinite transpose | b:Bl_point(P²)→P² for both legs | Fibre P¹ has dimension 1; b!O=O(E), quotient O_E(−1) has H⁰=H¹=0; paired actions 1=1 | F01 repaired; source-supported case now included. |
| 3.9 Nonflat leg and shift | i:Spec k→A¹,F=O,G=O[1] | i!O=k[−1]; D_XG=O; i!G=i!D_XF=k; T=Tᵗ=id_k | Repaired perfect-complex formulation has necessary shift. |
| 3.9 Adjoint convention | Three-cycle; split degree-two cover in char 2,3 | ⟨σe₁,e₂⟩=1=⟨e₁,σ⁻¹e₂⟩, wrong σ gives 0; trace scalars 0=0 and 2=2 | Inverse coset; no averaged trace. |
| 3.9 Relative/nonproper controls | B=k[ε,δ]/m², identity, T=ε; A¹ with id/constant 0 | Perfect relative dual evaluation ε=ε; joint map closed but second fibre A¹ is nonproper | No absolute Gorenstein-base assumption; global transpose requires both proper legs. |
| 3.10 Contracted support | {0,1}, p₁=id,p₂=0,Z={1}; t→t² | Inverse supports {1},∅ make required inclusion false; supports V(t)=V(t²) but ideals differ | Both directions tested; set-theoretic convention retained. |
| 3.12 Filtered spectral sequence | One stratum k[0], T=2; empty stratum | Sole E₁=k=abutment, both maps ×2; empty contribution 0 | One enhanced filtered morphism, not unrelated page maps. |
| 3.13 Derived detection | O[0]⊕O[−1], projector to second; k[0] | Projector H⁰=0,H¹=id versus zero map H⁰=H¹=0; k identity becomes zero after inverting ϖ | Neither H⁰ nor generic fibre detects all relations. |
| 4.2 Integral division | T=ϖ²id on O; coefficient k and exponent 0,1 | Quotient id over O; multiplication kernels on k are 0,k | Torsion-free uniqueness and positive-exponent condition retained. |
| 4.3 Spin polynomial | q=2,(T₀,T₁,T₂)=(1,3,2); formal q=1,(1,4,4) | Coefficients 1,−3,14,−24,64; second (X−1)⁴ | Generator exchange and fixed-degree reciprocal retained. |
| 4.4 Tower invariants | C₂ over F₂ versus Q | H¹=k versus 0; invariant augmentation 1+σ→0 in F₂ | Characteristic-zero exactness not used integrally. |
| 5.0 Quotient/EO hypotheses | Order-two quotient at p=3,2; t→−t; genus two | (1+σ)/2 idempotent only where 2 invertible; open fixed set empty, boundary fixed point 0; EO codimensions 0,1,2,3 | Compactified descent and EO input retained. |
| 5.1 Formal coefficient | Boundary t=0 under q=t² | Pulled-back ideal (t²), reduced ideal (t); unequal | Retain reduced-boundary verification and new §5.0 edge. |
| 5.2 Relative vanishing | Canonical n=0,1; subcanonical n=0 | Membership in stated theorem false,true,true | Correct strict versus weak twist endpoints; no claim of nonvanishing outside range. |
| 5.3 General PEL/BGG shifts | d=3,lengths 0,1,2,3; p=7,α=β=0,t=1 | First forbidden degrees 4,3,2,1; substituted weights (3,1),(4,2),(4,4) | Retain length shifts, integral BGG and coefficient logarithmic gaps. |
| 5.4–5.6 Three ranges | p=7: (6,1),(7,1); (4,2),(3,1); (7,4),(8,4) | α+β=3<4 versus 4≮4; sums 6 versus 4; differences 3≤3 versus 4>3 | All three distinct boundaries correct. |
| 5.7 Serre-dual weight | (4,2), then dual again; char 2 symmetric degree 2 | (1,−1), then (4,2); mixed coefficients 0 versus divided coefficient 1 | Involution and lattice qualifications retained. |
| 5.8 Singular mod-p | p=5,a=4,3,6 | a=4 gives H²_sub=H³_sub=0; a=3 gives H⁰_can=H³_sub=0 for (3,0); a=6 outside | Canonical/subcanonical tags not interchanged. |
| 5.9 Section reduction | [O→ϖO] versus O[0] | H⁰ reduction 0→k nonsurjective; O→k surjective | H¹-torsion obstruction and large-twist input retained. |
| 5.10–5.11 Regular thickenings | k[x,y]/x² versus /(xy,x²); Koszul(x,y) versus (x) on /(xy) | y-kernel 0 versus nonzero x; Koszul H⁰=k,negative H=0 versus H⁻¹=(y) | Repaired §5.0 dependency is substantive. |
| 5.12–5.13 Integral relations | k→id k, term maps (id,id) versus (id,0); torsion k | dT=Td=id versus id≠0; integral identity ≠0 but generic actions both 0 | Differential compatibility and integral detection retained. |
| 5.14 Localized perfect model | T=A₂×A₂; Z at (3) | e₁²=e₁,e₁e₂=0,e₁+e₂=1; Z has only idempotents 0,1, neither gives Z_(3) | Finite local-factor hypotheses retained. |
| 5.15 Residual form | Eigenvalues 1,1,1,2 over Q | A symplectic pairing would need products 1=2 | Bare GL₄ determinant is insufficient; form/multiplier retained. |
| 5.16 Complex congruence | T=O[t]/t(t−ϖ); T=O×O | Two generic characters 0,ϖ share residual (ϖ,t), block dimension 2 versus single character dimension 1; product algebra gives two blocks | Residual localization and splitting are distinct. |
| 6.1–6.2 Interior image | (t)→k[t]; empty boundary | Image (t) excludes 1; empty boundary gives whole cohomology | Actual image, not a free subspace predicate. |
| 6.3 Su pair and central action | SL₂ trivial coefficient; scalar 2 | Full pair H²=C, parabolic pair H²=0; inverse central factors 2·1/2=1 versus 4 | Declared parabolic gap necessary. |
| 6.4–6.6 Cusp map and multiplicity | Constant section; local dim 1,multiplicity 3,level dim 2 | Boundary constant 1≠0; cusp boundary 0; source contribution 1·3·2=6, image dimension ≤6 | Canonical comparison alone does not prove cusp equality. |
| 6.8 Holomorphic eigensystems | k=0,r=2; Hecke diagonal (1,2) | Parameter (−1,0;4); generated complex algebra C×C with two idempotents | Corrected sign gives holomorphic limit; no global uniqueness inference. |
| 6.9 Künneth degrees | Two binary local degree choices, finite dimension 3 | Coefficients 1,2,1 give dimensions 3,6,3 | Multiplicities and component conditions retained. |
| 7.0 Balancing and Frobenius | (a,b)=(5,2); geometric ε(F_v)=q⁻¹ | Scalar exponent 1 balanced with −1 gives 0, opposite gives 2; dual/twist multiplier μ⁻¹θ² | Compact coefficient and full similitude retained separately. |
| 7.1–7.2 Chambers/walls | (2,1),(2,−1),(1,−2),(−1,−2); shifted weights (1,0),(1,−1),(0,−2) | Interior chambers C₀,C₁,C₂,C₃ respectively; walls lie in C₀∩C₁,C₁∩C₂,C₂∩C₃ | Closed chambers, not strict inequalities. |
| 7.3 Large singular decomposition | Test R_sing=5,k=4,3 | −λ₁=k+1 gives 5≥5 versus 4<5; reversed λ₁ inequality fails both | Correct source sign; separate m_h,m_g. |
| 8.1 Boundary nerve | Two vertices, difference differential | (1,1)→0, (1,0)→−1 | Constants and orientation retained. |
| 8.2, 8.6 Exact sequence | H⁰_D=0,H¹_D=C,H¹_sub=0,H¹_can=C | H⁰ comparison iso; H¹ map 0→C injective with cokernel dimension 1 | Degree-zero vanishing does not give H¹ surjectivity. |
| 8.3 Boundary Φ | k=0,1; eigenvalue T_l=1 | Coefficients ω² versus ω³(−cusp); T_(l,2)=2, reducing to 0 in char 2 | Exceptional k=0 and doubled operator retained. |
| 8.4 Spin boundary | q=2,α=1,β=2,u=4 | Roots 1,2,4,8; coefficients 1,−15,70,−120,64; uD=8=q³T₀,T₁=15,T₂=30 | Four monomials, modulus and both factors agree. |
| 8.4 Repeated roots / small p | α=β=u=1, char 2 | (X−1)⁴=X⁴+1; trace 0 while rank 4 and polynomial remain visible | No division by 2 or root difference; use full polynomials. |
| 8.5 Totally real boundary | Two real places,l=(2,3) or (2,2),k=(2,4) | Nonparallel lower weight kills rank-one stratum; parallel lower weight leaves Hilbert weights (2,4); rank-two summand has invariant dimension 2<4 | Nonparallel-realization gap necessary; no higher boundary conclusion. |
| 8.7 Rational all-weight exhaustion | a=2, same finite part dimension 3 | Paired local limits contribute 3,3; missing generic partner gives 3,0 | Conditional packet input required, no large-a bound. |
| 8.8 Large-gap theorem | R_sep=3,R_gap=5; (8,4),(12,6),(8,2); z=2 | Pairings (5,7,9,2) fail; (7,11,15,4) pass; (7,7,7,0) allowed; central 4·1/4=1 versus 16 | Universal order of quantifiers, allowed wall and inverse norm twist retained. |
| 8.9 Dimension headline | l₀=0,1,2,h⁰=3 | h¹=0,3,6 respectively; for Q paired finite part gives 3=3 | Classification and multiplicity conditions remain explicit. |

### Supplier and ownership audit

The required roadmap service's object searches covered coherent correspondences, coherent duality, perfect pushforward, solid scheme operations, EO strata, Cousin complexes and the three acceptance declaration names on main and indexed open heads. The declaration-name search returned no match on main or any indexed open roadmap pull request. Pinned-library searches were by object as well as by name. The board package index was read before making any availability claim; its accessible heads were searched, and its inaccessible entries are reported below.

The important ownership distinctions are maintained: generic coherent duality and Cousin theory belong to SchemeAndStackFoundations; generic perfect pushforward belongs to EnhancedDerivedSheaves (R01); parent coefficients and section operators belong to AutomorphicBundles; field highest-weight modules belong to LanglandsParameterStacks. This roadmap owns the higher coherent application, the (A,A)■ scheme formalism and its comparison, and the stated Hilbert–Siegel EO application. The étale correspondence category in EtaleDualityAndPerverseSheaves §6.2 has constructible étale coefficients, not these coherent/solid coefficients. VStackSheavesAndLisseCategories VS2.2's (A,Z)■ spectrum has a different localization convention and does not replace §3.0a. IgusaVarietiesAndTorsionConcentration's EO targets are later consumers, not an upward supplier to this package. No second declaration of an inspected native or roadmap object was found in Suggested.lean.

The following current contracts were resolved by section and mathematical object, using main for existing roadmaps and the indexed head for new roadmap folders. R01 is the substantive mismatch despite successful name resolution.

| Supplier | Sections resolved / contract assessed |
|---|---|
| AutomorphicBundles | B0–B5, B3.10, B3.BGG.2–3: parent coefficients, integral good-prime frame theory, section operators and characteristic-zero BGG; integral p-small comparison remains a gap. |
| AlgebraicVectorBundles | L0A–L0C: scheme-module tensor, Hom, pullback, finite locally free operations and affine comparisons. |
| SchemeAndStackFoundations | §§1.1,2.6–2.8,2.18–2.21,2.23,4.8–4.10: descent, derived cohomology, supports, Cousin theory, duality and formal functions. Main README:3437 and :3959 give the two relevant sections; neither supplies R01's perfect pushforward. |
| DerivedModuleAlgebra | §§0.2–0.3,1.1.1,1.3–1.5,1.E.0–1.E.1,1.M.1–1.M.2,S.1: tensor/Hom, object completion, perfect-system effectivity and Matlis/spectral-sequence inputs. |
| DeformationAndDerivedPatchingAlgebra | §§7.1,7.3–7.10: lifting, signed duality, strict towers, finite Hom completion, isolated blocks and hyper-Tor. |
| ShimuraCompactifications | C3.3–C3.10,C4.1–C4.11,C4.16–C4.17,C5.3–C5.17,C5.19–C5.31: spans, refinements, boundary ideals, formal canonical coefficients and normalized models. C5.20 admits proper nonfinite refinements; C5.29's canonical bundle formula requires smoothness. |
| LanglandsParameterStacks | LP3.0 supplies field Weyl/dual-Weyl modules; not the requested integral realization. |
| ComplexComparisonPartII | C1.9,C2,C3.3 supply proper coherent/derived GAGA; compatibility with the actual duality trace remains the declared gap. |
| SmoothRepresentationsOfLocalGroups | SR.0–SR.4.5 supply smooth towers, invariant exactness in its coefficient range, convolution, parabolic induction and spherical spin normalization; Klingen factorization remains a gap. |
| IntegralHeckeAndGaloisDeterminants | §§2.2–2.3,3a.1–3a.2,3b.1–3b.2: finite algebra factors/idempotents, localizations, full spin polynomials, residual predicates, dual and twist transport. Its generator exchange and μ⁻¹θ² multiplier agree. |
| AutomorphicFormsOnReductiveGroups | §§1.1–1.3,4.1–4.2,6.1–6.7: relative cochains, closed chambers, components, occurrences and coherent local calculations. §6.6's global R_sep and singular R_sing are distinct. |
| AutomorphicSpectralTheory | §§4.1–4.5,4.10,5.1–5.8: multiplicity spaces, tempered cuspidality, full-pair regularization and Fin_J acyclicity. §5.2 does not supply Su's parabolic-pair theorem. |
| EndoscopicTransferAndUnitaryTraceComparison | §11.1 with `GSp4ClassificationInputs`: conditional general-type transfer, local parameters and multiplicity-one comparison; unitary normalization transported as stated. |
| ArithmeticGaloisRepresentations | §§1.1–1.12,2.2,Layer 5: continuous representations, lattices, residuals, Frobenius, full-polynomial Brauer–Nesbitt and dense-set recognition. Characteristic-two trace recognition is not substituted. |
| WeightsInEtaleCohomology | R34.5–R34.6: higher classical weights and source-qualified Hilbert realizations; weight one remains the named gap. |
| ModularCurvesPartII | §§14.1–14.4a: weight k≥2 coefficient systems, parabolic image, comparison and level transport; no negative symmetric power for weight one. |
| HilbertModularVarietiesAndShimuraCurves | R18.3.29(a), including its Normalization paragraph: parallel k≥2 and even-degree existence; arithmetic realization is dualized for the geometric convention. Nonparallel extension remains a gap. |
| CrystallineCohomology | CR.5.1,CR.5.3–CR.5.4,CR.DDR.6.11–14: log structures, Cartier-type and crystalline comparisons; not the coefficient vanishing theorem. |
| EnhancedDerivedSheaves | §§0.1–0.3,E1.3,E2:towers,E3.2–E3.3,E5:abstract supply enhancements and coherent diagrams; E1.9 additionally supplies the missing explicit R01 citation. |
| SolidAnalyticRings | §§1.5,2.2,6.4,7.1–7.2: solid reflection/tensor/scalar extension with bounded universes and separate prime completion. |
| VStackSheavesAndLisseCategories | VS2.2 analytic measures and complete modules; its integer-solid scheme convention is explicitly distinguished. |
| AlgebraicModuliForArithmeticGeometry | §7.5: fundamental classes and boundary-twisted trace, retaining projective embedding, Cartier and inverse-boundary requirements. |

All nine declared gaps have the same slug in `packages/AutomorphicBundlesPartII/design/plan.json` and the README, a named earlier supplier and a precise remaining comparison or theorem. None has supplier `none`. Their statements are minimal relative to the sections just inspected:

| Gap slug | Supplier / missing part |
|---|---|
| integral-dual-weyl-lattices | LanglandsParameterStacks LP3.0; integral lattices and residue-characteristic comparison beyond field theory. |
| coefficient-linear-coherent-comparison | SchemeAndStackFoundations §2.18; scalar-derived Hⁱ comparison with the native base-linear groups and maps. |
| gaga-duality-trace | ComplexComparisonPartII C1.9,C3.3; actual trace/counit compatibility, including twists and boundary arrows. |
| boundary-spin-satake | SmoothRepresentationsOfLocalGroups SR.4.5; normalized local Klingen restriction, with q invertible and four monomials. |
| coefficient-logarithmic-splitting | CrystallineCohomology CR.5.4; Lan–Suh relative vanishing with its lift, degree, residue and ampleness assumptions. |
| integral-small-weight-dual-bgg | AutomorphicBundles B3.BGG.2–3; integral p-small coefficient/shift/boundary comparison. |
| classical-weight-one-realization | WeightsInEtaleCohomology R34.6; rank-two classical weight-one realization and full good-prime polynomial. |
| nonparallel-hilbert-realization | HilbertModularVarietiesAndShimuraCurves R18.3.29; nonparallel weights without the finite discrete-series-place restriction. |
| su-parabolic-regularization | AutomorphicSpectralTheory §5.2; Su's parabolic pair, central hypothesis, coefficient action and tower equivariance. |

The dependency gate returned exit code 0, with no UPWARD or CYCLE line:

```text
moved: AutomorphicBundlesPartII moved in the merge order from #178 to #230, right after its last supplier AutomorphicBundles; checked as moved (the worker moves it there when it submits)
depcheck: 54 roadmaps, 616 edges, 0 problem(s)
```

The permitted movement is not a finding. No merge-order file was changed. The citation resolver reported no unresolved roadmap/backticked names on main and the 365 indexed open heads. That is name-resolution evidence only; R01 shows why inspecting the supplied mathematical statement was still necessary. No ownership needs moving to a later roadmap.

### Pinned APIs, elaboration and headline coverage

Pins inspected: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Pinned file and line | Declaration / native meaning checked |
|---|---|
| `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:127` | `SmoothOfRelativeDimension`: smoothness with the fixed relative dimension on affine charts; properness is a separate binder. |
| `Mathlib/Algebra/Category/ModuleCat/Sheaf/LocallyFree.lean:61` | `SheafOfModules.IsLocallyFree`: local generators, without a finite-rank requirement by itself. |
| `Mathlib/Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean:269` | `SheafOfModules.IsFinitePresentation`: local finite presentation; this extra hypothesis is carried by the headline. |
| `TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower.lean:49` | `SheafOfModules.exteriorPower`: actual sheafification of sectionwise exterior powers, not admitted determinant data. |
| `TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean:85` | `Scheme.relativeDifferentials`: Kähler differentials relative to the specified base ring. |
| `TauCeti/AlgebraicGeometry/Modules/TensorProduct.lean:63` | `Scheme.Modules.instMonoidalClosed`: native internal Hom used in the dual coefficient. |
| `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean:61` and :66,:80,:86 | `Cohomology`, `cohomologyFunctor`, `cohomologyZeroEquiv`, its naturality: underlying abelian-sheaf cohomology. |
| `TauCeti/AlgebraicGeometry/Cohomology/Module/Base.lean:45` and :57,:110,:127 | `cohomologyBaseModule`, `cohomologyMapBaseLinear`, `cohomologyZeroBaseLinearEquiv`, its naturality: restrict scalars along the actual base-to-global-sections map, with no automatic finiteness/properness. |
| `TauCeti/AlgebraicGeometry/Cohomology/LongExactSequence.lean:242` | `cohomologyδBaseLinear`: short exact coefficient input, adjacent natural degrees and base-linear connecting map. |
| `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/SerreDuality.lean:113` | `SchemeWeilDivisor.cohomologyOneDualEquivCohomologyZero`: field, integral curve, valuation/properness and function-field hypotheses; divisor-sheaf duality, not arbitrary relative dimension over Aₙ. |
| `TauCeti/AlgebraicGeometry/LineBundle/SerreDuality.lean:99` | Field/curve line-bundle Serre duality; does not close the general finite-quotient theorem. |
| `Mathlib/Algebra/Homology/HomotopyCategory/KProjective.lean:113` | `CochainComplex.isKProjective_of_projective`: upper-bounded projective terms. |
| `Mathlib/Algebra/Homology/DerivedCategory/KProjective.lean:43` | `CochainComplex.IsKProjective.Qh_map_bijective`: K-projective source; equality of homotopy classes, not a strict algebra action by chosen representatives. |

The required `lake env lean` elaboration of the authored Suggested.lean was run from the pinned content checkout: exit 0, only the expected declaration-uses-`sorry` warning at line 67. All four individual Tau Ceti object files were available; no build was needed. A separate scratch copy with `#check @name` for all three declarations also elaborated. Both definitions retain their base ring and scheme data; the theorem retains the domain/DVR/completeness assumptions, irreducible ϖ, positive n, base scheme structure, smooth relative dimension, properness, local freeness, finite presentation and integer degree. No binder was lost and no signature change was required.

The one admitted theorem was probed on a scratch copy with one-tactic alternatives `simp`, `rfl` and `infer_instance`; none closed it. The pinned divisor and line-bundle duality declarations were inspected as exact-one-lemma candidates and have strictly different field/curve carriers and hypotheses. No applicable one-lemma restatement was found. The two real-body definitions are the quotient coefficient ring and integer cohomology extended by zero, both needed by the theorem. There is no padding finding and no proposed “prove it in place” repair.

The README's headline coverage is as follows. “Docstring” means the exact missing geometric/analytic carrier is named there; no stand-in is supplied.

| README headline | Acceptance-file disposition |
|---|---|
| §1.6 Finite-coefficient coherent Serre duality | Stated as `finiteCoefficientSerreDuality`; arbitrary smooth proper relative dimension over Aₙ and finite locally free F. Trace naturality/equivariance await coherent duality trace. |
| Layer 2 Equivariant finite perfect coherent models and deck descent | Docstring: scheme torsor, descended coherent coefficient and equivariant derived realization missing. |
| Layer 3 Coherent composition, base change and transpose | Docstring: coherent upper shriek, trace and enhanced correspondence carrier missing. |
| §§3.0a,3.11–3.12 Solid completion and support filtration spectral sequence | Docstring: solid scheme sheaves, completed locales and operations missing. |
| Layers 3–4 Normalized higher Hecke action and GAGA/tower comparison | Docstring: towers, coefficients, analytic coherent cohomology and geometric spans missing. |
| §5.2 Lan relative vanishing | Docstring: PEL contractions and formally canonical sheaves missing. |
| §§5.3–5.8 General PEL small weights, three GSp₄ ranges and singular mod-p consequences | Docstring: integral model, Hodge bundle, boundary ideal and automorphic coefficients missing. |
| §§5.0,5.10–5.16 Integral convolution and coherent local factors | Docstring: Hilbert–Siegel EO geometry and coherent Cousin/Hecke complexes missing. |
| §6.3 Su canonical comparison | Docstring: compactification, coefficient, growth resolution and parabolic relative cohomology missing. |
| §§6.4–6.9 Harris cusp/interior comparison and multiplicity-counted contribution | Docstring: extension map, spectral occurrence maps and fixed Hermitian pair missing. |
| Layer 7 Tempered-image restriction and singular decomposition | Docstring: archimedean representations, occurrence maps and geometric interior image missing. |
| §8.2 All-degree rational non-Eisenstein boundary vanishing | Docstring: boundary, linearized coefficient and residual ideal missing. |
| §§8.5–8.6 Totally real degree-zero boundary and low-degree comparison | Docstring: Hilbert–Siegel models and normalized boundary maps missing. |
| §§8.7–8.8 Localized injections, large-gap equality and conditional all-weight exhaustion | Docstring: multiplicity spaces, coefficients, congruence localization and packet comparison missing. |
| §8.9 Conditional h¹=l₀h⁰ and rational h¹=h⁰ | Docstring: same geometric cohomology and packet occurrence data missing. |

No additional statable headline was identified at these pins. An integer chamber inequality, generic image of a linear map, polynomial identity on free scalars or K-projective lifting would be a stand-in, not a statement of these geometric headlines.

## Not verifiable

- GK19 remains settled as uncertified. Its cited locators can be recorded, but its text was not independently certified. It was not requested again and no missing-reference entry was created for it.
- The board index supplied nineteen package heads. Four were readable: AnalyticNumberTheory, AutomorphicCongruences, KatoEulerSystems and LogicAndDefinabilityInNumberTheory. Reading the README at the exact listed head returned HTTP 404 for each of the following fifteen: ArithmeticLocallySymmetricSpacesPartII (`c1b8f80`), CompletedCohomologyAndLocalGlobalCompatibilityPartII (`777a863`), CrystallineCohomologyPartII (`3808b1d`), EndoscopicTransferAndUnitaryTraceComparisonPartII (`78eadae`), HigherHidaAndColemanTheory (`519048f`), LawrenceVenkateshMethod (`9ee7ac3`), OrdinaryAutomorphicFormsAndModularityLiftingPartII (`7e88c38`), PELModuliPartII (`d4bb48d`), PadicHodgeTheoryPartII (`6502997`), PadicLocalLanglandsForGL2QpPartII (`3e0777d`), RealSurfacePeriodIndex (`875bca4`), SchemeAndStackFoundationsPartII (`accb0a0`), ShimuraVarietiesPartII (`57dc0a4`), VStackSheavesAndLisseCategoriesPartII (`99411c4`), VectorBundlesAndIsocrystalsPartII (`e81e8ff`). Ownership against those unreadable package files is not certified. No assertion that these roadmaps exist nowhere is made.
- The separately named open roadmap pull requests were not supplied as sibling filesystem checkouts. Ownership against such sibling files was not checked; available indexed heads were searched using the required roadmap service. No additional checkout was sought. This limits the ownership audit, not the fifteen readable seeded source checks.

## Source issues

- **Misprint** in BP26 at §1.1, printed p. 2 (BP26 line 62): the source says M_μ is the parabolic's unipotent radical; it should be the Levi quotient used by the ensuing highest-weight representations and torsor; affects nothing.
- **Misprint** in BP26 at §4.3.1, printed p. 46 (BP26 line 2419): the source says left translation inverts the evaluation variable; it should be f(m′⁻¹m), inverting the acting element; affects a stated result.
- **Error** in CG18 at §7.2, printed p. 400 (CG18 line 4143): the source says derived global sections of the shifted dualizing sheaf are isomorphic to A; it should be the duality trace morphism to A, without an isomorphism assertion; affects the proof.
- **Misprint** in P20 at §5.3, printed p. 24 (P20 line 1064): the source says the first parameter is 1−k+r; it should be 1−k−r, consistent with the preceding dictionary and following normalization; affects a stated result.
- **Misprint** in P20 at §5.3, printed p. 25 (P20 line 1084): the source says the twisted correspondence targets p₁!O; it should be p₁!Ω^(k,r), retaining the coefficient tensor; affects the proof.
- **Misprint** in P20 at Theorem 15.2.2.1(2), printed p. 108 (P20 line 4927): the source says λ₁≥R in its negative-parameter convention; it should be −λ₁≥R; affects a stated result.
- **Misprint** in P20 at Corollary 15.2.3.1, printed p. 108 (P20 line 4960): the source says the degree-one left side is unlocalized while the right side selects residual congruence; it should be localized at m; affects a stated result.
- **Misprint** in P20 at proof of Corollary 15.2.3.1, printed p. 108 (P20 line 4967): the source says the displayed three-term cohomology segment is short exact; it should be an exact segment with its neighboring terms retained; affects nothing.
- **Misprint** in P20 at proof of Corollary 15.2.3.1, printed p. 109 (P20 line 4980): the source says the exceptional untwisted boundary case is k=2; it should be k=0, as in the immediately preceding pushforward formula; affects the proof.
- **Misprint** in P20 at Proposition 15.2.4.1, printed p. 109 (P20 line 4989): the source says λ₁>0 for the previously fixed holomorphic/generic limits; it should be λ₁<0 in that parameter convention; affects a stated result.
- **Misprint** in BCGP21 at proof of Lemma 3.10.7, printed p. 238 (BCGP21 line 3352): the source says the displayed spin character sum repeats a monomial and gives the corresponding repeated factorization; it should be the four distinct spin monomials and their two matching quadratic factors; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "1241d479edfabc509621882fb24e72547baac9d3", "job": "REV-PKG-AutomorphicBundlesPartII~4", "model": "gpt-6-astra", "worker": "chris-31"} -->
