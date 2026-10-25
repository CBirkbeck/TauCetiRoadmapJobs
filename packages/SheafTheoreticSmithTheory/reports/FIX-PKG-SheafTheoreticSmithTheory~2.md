# Repair report: sheaf-theoretic Smith theory

## F01 (P1) — not actionable in this package: accepted intake classifications require the design owner

The ownership mismatch is real. The permitted plan edits add supplier contracts; they do not authorize reclassifying local intake obligations or assigning a self-supplier. Original G1–G5 are unchanged. Their ownership reconciliation is recorded below for the design/intake owner. Existing external contracts already cover the external portions of G1/G2; adding differently named contracts cannot reclassify those original records.

## F02 (P1) — applied differently

Unqualified attribution to SchemeAndStackFoundations → native affine finiteness, gap:admissible-invariant-quotient-gluing, and ModularCurves Layer 0C for free torsors. The latter already owns the requested free-action theorem, so duplicating it as a new obligation would be wrong. Updated Scope, supplier contracts, §0.2 and Layer 0 dependencies; added the nonprojective rank-p Kummer Check. Matching plan gap added.

## F03 (P2) — applied

Odd-prime coefficient datum → arbitrary-prime datum. Added p=2 Tate computations in §0.1; made oddness explicit in normalized cyclic uses and routes in §§5.2–5.5 and 6.4. Preserved the general induced-pariversity assertion and all-prime Smith/algebra theories. The dimension-one p=2 negative control remains in §§5.1 and 8.1 and now also tests §6.4.

## F04 (P2) — applied

Field classification used integrally → explicit gap:integral-tilting-lifts with split highest-weight orders, Ext vanishing, tilting existence, Hom base change, idempotent lifting and reduction classification. Updated §3.3, integral standard comparison §3.2, product route §4.6 and Layer 3 dependencies. Added trivial-group, SL₂ rank-six versus rank-four, zero and summand Checks. JMW16 remains the field locator; no integral theorem is attributed to it.

## F05 (P3) — applied

Arbitrarily chosen generator in periodicIso → periodicIsoOfGenerator with g=σ and its generating proof, in the supplier contract and §1.2. Specified both pinned even/odd composition identities. Added the C₃ inversion control: normalized H² class multiplied by 2 while dimensions remain 1. The sheaf theorem and both Lean headlines are unchanged.

## F06 (P3) — applied

F₉ as sole direction witness → an F₂₇ witness separating Frobenius and its inverse. Added the computation to Conventions, §§5.6, 5.8, 6.6 and 8.3, Layer 5 Examples and the torus worked example. Retained the valid F₉ formulas. In F₃[β]/(β³−β−1), the inverse composition gives β and the forward composition gives β−1.

## F07 (P3) — applied

Definition 15.70.1 tagged 0A5M → 0A5N in §0.6, References and sources.toml. Added its direct chapter-line locator. The manifest still records the actual section URL used to fetch the chapter; its locator/version note now distinguishes section 0A5M from definition 0A5N. The two-term perfect-complex computation is unchanged.

## Intake ownership reconciliation and supplier consequences

These dispositions identify mathematical owners, not completed proofs. The original five records still lack supplier fields; this report does not claim that the intake-ledger finding has been fixed. A human/design owner must apply the local-versus-external classification, rather than infer a self-dependency.

| Original obligation | Local ownership | External portion, with a single owner per input |
|---|---|---|
| G1: uniform integral Smith theory | §1.1 owns constructible-to-ind kernel comparison/conservativity; §§1.3 and 2.1–2.9 own the Smith specializations and comparisons. | EtaleDualityAndPerverseSheaves §§3.1–3.2, gap:witt-adic-uniform-operations, owns the general W(k)-adic extension, uniform bounds and operation/limit comparisons. |
| G2: étale modular Satake and parity transport | §3.1 owns the k/W(k) Satake extension; §§4.4–4.7 own parity realization, étale transport and graded composition; §5.7 owns the compatible prime-field form; §§6.1–6.5 own its constant-term comparisons. | GlobalShtukasAndFunctionFieldLanglands §§1.1–1.3, gap:grassmannian-arbitrary-geometric-field, owns geometric field extension. GeometricSatakeAndFusion GS0 supplies its specified Schubert-model input. The distinct adic coefficient input is the G1 supplier contract. |
| G3: good-prime perversity engine | §4.5 owns the modular exotic/Soergel engine and its transport, including its grading/label conventions. | None: a local theorem target, not an outstanding supplier gap. |
| G4: integral norm-image naturality | §7.6 owns naturality on norm-generated maps, with §7.5's objectwise comparison as input. | None: a local theorem target, not an outstanding supplier gap. |
| G5: natural dual-group comparison | §6.8 owns root-subgroup-equivariant components and naturality; §7.4 owns their continuous Galois compatibility. | None: local theorem targets, not an outstanding supplier gap. |

The two new supplier-gap records have exactly slug, needs, supplier and section, with verbatim matching needs in Exact supplier contracts. All five supplier-gap records have named suppliers; none uses supplier `none`. Every original gap record and every plan field outside the top-level gaps list is unchanged. No self-edge was introduced. SchemeAndStackFoundations must supply admissible nonfree gluing/restriction compatibility; LanglandsParameterStacks must supply the integral highest-weight extension before integral tilting consumers can be implemented. Those are declared needs, not assertions that the supplier already contains the extensions.

The free-action result was found on main in TauCetiRoadmap/ModularCurves/README.md, Layer 0C, lines 343–367, especially lines 358–364. Thus the suggested combined torsor gap was split by existing ownership. TauCetiRoadmap/SchemeAndStackFoundations/README.md §1.17, lines 2643–2661, explicitly bounds its general quotient API and states projective gluing. Its §§1.21 and 1.23 do not repair the admissible-action attribution. The indexed lookup for SchemeAndStackFoundationsPartII returned no roadmap on main or at an open head; no missing theorem is attributed to that unavailable name.

No Lean declaration was added, deleted or renamed. Downstream references to the six existing names remain valid. Checks were kept in the README; no boundary-case or API padding was added to Suggested.lean.

## Source and ownership verification

Read the main SchemeAndStackFoundations and ModularCurves roadmaps before editing, including their ownership/dependency layout. Main checkout was a8132fb2. The supplied roadmap index identifies its main snapshot as bbed953; its successful resolution was used as a lead and actual cited text was inspected in the provided checkout or indexed open head. A revision to an existing main roadmap was not used to replace main.

| Input | Verification and precise boundary |
|---|---|
| F02 geometry | Feng24 line 650, §3.2, pp.14–15, and Feng24 line 677, Lemma 3.6: admissibility/free quotient at the intended scope. Native TauCeti/AlgebraicGeometry/Quotient/FiniteGroup/Affine.lean lines 19–20, 66 and 73 distinguish finiteness from flatness/presentation. ModularCurves Layer 0C supplies the free torsor input. |
| F03 coefficients and normalization | Feng24 line 317 gives the coefficient/generator notation; Feng24 line 759 gives the two Tate quotients; Feng24 line 1155 explicitly uses oddness in the dimension-pariversity calculation. All-prime low-layer formulas were recomputed, rather than inferred from an odd-prime parity theorem. |
| F04 field versus integral tiltings | JMW16 lines 12–27, §1.1/Theorem 1.1, p.1, specify a field. Feng24 lines 993–996 use Rep_k. LanglandsParameterStacks LP3.0 at the indexed head is field-valued; its finite-ideal contract is also field-valued. The integral assertions are therefore conditional on the new supplier contract, independently of §4.5. ReductiveGroups §10B's integral lattices/duals do not supply the missing tilting-lifting theorem. |
| F05 chosen generator | TauCeti/RepresentationTheory/Homological/TateCohomology/Periodic.lean line 302 takes g and its generating proof; lines 322 and 332 state the composition identities. Line 346's periodicIso instead chooses a generator. Lines 167 and 200 retain g in even/odd comparisons. |
| F06 scalar direction | Feng24 lines 1162–1188, Construction 4.17, pp.26–27; Feng24 lines 1896–1909, Construction 5.17, p.43; TV16 lines 207–210, §2.1, p.5. The tensor balancing and inverse source direction agree; the order-three field witness tests them. |
| F07 tag | Stacks line 8129 labels the More on Algebra section 0A5M; Stacks lines 8130–8135 label Definition 15.70.1 as 0A5N and define bounded projective representatives. |
| Other conventions used in the pass | JMW14 lines 199–212: free even local-system Hom. LL21 lines 641–675 and 1120–1125: graded Hom, ordinary-map compatibility and lifting. MR18 lines 105–114 and 273–274: grading −1, label −λ and good-prime perversity. Braden03 lines 28–47: coefficient/domain and weak equivariance. Feng24 lines 1863–1885 and TV16 lines 512–529: algebra diagonal and character extension. |

All nine manifest works are legally cached and remain single-key entries. No additional source was needed and no missing-reference request was created. Only the Stacks locator metadata changed; fetch provenance and hashes were preserved. No extracted source passage was copied into the package or report.

Cross-roadmap citations were resolved and checked against the actual referenced sections: EnhancedDerivedSheaves §§0.1–0.4, E1.3–E1.4, E3.4 and E5:abstract; EtaleCohomologyFoundations §§F.1–F.3, F.5–F.6, 0.8 and 0.10; SchemeAndStackFoundations §§0.23a, 1.17, 1.21, 1.23; ModularCurves Layer 0C; ReductiveGroups Layers 1, 4, 9 and 10A–10B on main. For the new-roadmap heads, checked EtaleDualityAndPerverseSheaves §§0.1–0.2, 2.2, 2.4–2.5, 3.1–3.2, 5.2 and 7.3; DeformationAndDerivedPatchingAlgebra §7.5; GlobalShtukasAndFunctionFieldLanglands §§1.1–1.3, 1.5, 1.8–1.9 and 1.14; GeometricSatakeAndFusion GS0's named equal-characteristic target; ReductiveGroupsPartII RG2.0a and RG2.5.1–RG2.5.2; LanglandsParameterStacks LP3.0; AInfCohomology AI.7.2. The distinct coefficient/geometric extensions remain explicit contracts.

Object searches used roadmap grep/show across main and indexed open heads, board-package searches, and the pinned Mathlib/Tau Ceti representation and Tate sources. ModularCurves was the relevant extra owner found. Highest-weight representations remain with ReductiveGroups/LanglandsParameterStacks; generic spectral Tate constructions remain with the named suppliers. This package retains sheaf quotients, concrete parity comparisons and the algebra invariant-ring diagonal. No independently existing pinned theorem with either kept headline's mathematical statement was found; module Tate cohomology alone is not a ring diagonal or a character-extension theorem. No new fully qualified Lean name was introduced.

Pinned native references were also checked in their actual files: Mathlib/FieldTheory/Perfect.lean line 121; Mathlib/LinearAlgebra/LinearIndependent/Basic.lean line 502; Mathlib/Algebra/Ring/Subring/Basic.lean line 867; Mathlib/RingTheory/LocalRing/Module.lean line 299; Mathlib/RingTheory/WittVector/DiscreteValuationRing.lean line 148; Mathlib/RingTheory/WittVector/Complete.lean lines 105 and 116. The finite-generation hypothesis of the native flat/free result was retained. Native eqLocus imposes equality of the two ring homomorphisms, not a geometric separation or nonemptiness condition.

## Computed adversarial mathematics pass

Here k=F̄₃, O=W(k), A=k[u]/u³ and u=σ−1 unless the row specifies otherwise. Tate pairs are even then odd. Calculations test the actual definitions, conventions, theorem hypotheses and their controls; they are not proofs of the unconstructed general sheaf library. The table includes every numbered target, the four kept definitions, and separate tests for the new supplier contracts. The changed statements' computations were propagated to their consuming examples.

| Statement | Instances tried | Values computed on the two sides or the failing control | Result / change |
|---|---|---|---|
| Coefficient convention | p=2,3; O versus k; geometry F of characteristic 5 | N on trivial O is 2 or 3, nonzero; N on k is 0; char F=5 differs from p=2,3. | Removed global oddness; retained geometric invertibility. |
| Differential/shift convention | Regular A; trivial O; K=k[1] | N=u², σ−1=u, 1−σ=−u; u·u²=0. H⁻¹(k[1])=k; H⁰(k[1])=0. | Signs and shift direction agree. |
| Uniform bound/universe convention | Direct sums indexed by ℕ, including zero summands | ⊕k[2n] has H⁻²ⁿ=k for all n; ⊕0=0 has every Hʲ=0. Small ℕ-indexing does not create a common finite interval. | Boundedness excludes the first, includes the second. |
| Frobenius convention | α²=−1 in F₉; β³=β+1 in F₂₇ | Fr α=Fr⁻¹α=−α. Fr β=β+1, Fr⁻¹β=β−1; cubing these gives β−1 and β respectively. | F₂₇ control added throughout. |
| §0.1 datum and good-prime condition | A₁/G₂; p=2,3 | Highest-root coefficients 1 and (3,2): 3 good for A₁, bad for G₂. At p=2, N=u, Tate(k)=(k,k), Tate(O)=(k,0), Tate(k[C₂])=(0,0). | Arbitrary prime admitted; normalization stays separate. |
| §0.2 admissible actions/equalizer | Rotation on X³, including dual numbers; scalar A¹ action; trivial action | Fixed tuples=(a,a,a), including a=ε. (ζ−1)x=0 gives x=0 since ζ−1 is a unit; trivial action gives fixed Y and U=∅. | Full scheme equalizer retained. |
| Quotient-gluing contract | Scalar A¹, identity action, empty Y | Quotient coordinate x³; restriction to G_m has basis 1,x,x² and derivative 3x² a unit; identity quotient q=id; empty quotient ∅. | General gluing declared, not inferred from projectivity. |
| Free-torsor contract | G_m with C₃, regular 3-point orbit, trivial-action complement | Fibres have rank 3; Γ×G_m and G_m×_Q G_m each have the same three graph components; regular orbit quotient is one point; trivial complement gives ∅→∅. | Existing ModularCurves ownership used. |
| §0.3 equivariant derived category | Point; free 3-point orbit; unbounded sum | Point is D(A), free-orbit pushforward is rank-3 A; unrelated trivial k³ has N=0 instead of rank-1 orbit sum. ⊕k[2n] has arbitrarily negative nonzero degrees. | Geometric descent and common bounds distinguish the models. |
| §0.4 arbitrary flat modules | A, residue k, A^(ℕ), p=2 | A has rank 3 and is free; Tor₁^A(k,k)=k; A^(ℕ) has rank ℵ₀. At p=2, regular algebra rank 2, residue Tor₁=k. | Arbitrary-rank supplier is necessary. |
| §0.5 flat/perfect complexes | C=[A→u A] in degrees 0,1; k in degree 0 | H⁰C=(u²), H¹C=A/(u), both dimension 1 and nonflat; C⊗ᴸk=[k→0 k] with amplitude [0,1]. k has nonzero Tor in all degrees. | Perfect complex is not cohomology-flat. |
| §0.6 projective representatives/stalk detection | Same C; disjoint family k[2n] | C's two terms are rank-1 projectives in [0,1], although its two cohomology modules are k. Family has nonzero H⁻²ⁿ for every n. | Definition tag corrected; local versus common bound retained. |
| §1.1 quotient/kernel comparison | A, k, O; identity cone | T*A=0; T*k has pair (k,k); T*O has pair (k,0); cone(id)=0. Thus killing all coefficient-perfect objects would wrongly kill k. | Correct group-ring kernel; integral comparison remains a local target with its supplier input. |
| §1.2 periodicity | k, O, A at p=2,3; inverted generator of C₃ | Pairs (k,k),(k,0),(0,0) recur after +2; generator inversion sends H¹ value 1 to 2 and its H² Bockstein to 2 times the generator. Dimensions remain 1. | Explicit-generator API and class control added. |
| §1.3 Tate cohomology sheaf | Two disjoint points; trivial and regular stalks | Stalks are k and 0; sections are k⊕0=k with restriction projections. On two trivial stalks sections are k², with each stalk k. | Internal sheaf Hom distinguishes stalks from global sections. |
| §1.4 exact sequence | Split sequence; 0→O→³O→k→0 | Split boundary=0; T¹k→T²O is k≅k; T⁰O→T⁰k sends 1 to 1; multiplication by 3 on T⁰O is 0. | Boundary has degree +1. |
| §1.5 trivial action formulas | k⊕k[1]; Oʳ for r=0,1,2; regular A | First complex has (k²,k²); Oʳ gives (kʳ,0), including (0,0) at r=0; A gives (0,0). | Integral and mod-p units remain distinct. |
| §1.6 stratified integral category | Point; inflated O²; skyscraper on one-stratum P¹ | Tate(O)=(k,0), Tate(O[1])=(0,k); O²/p=k². Skyscraper stalk ranks are 1 at its point and 0 elsewhere, hence not locally constant on P¹. | Stratification and inflation are retained. |
| §2.1 compact and ambient bounds | A¹→pt; G_m↪A¹ | RΓ_c(A¹,A)=A(−1)[−2] has H²=A(−1); nearby regular complex has H⁰=k,H¹=k(−1). Relative dimension of j is 0 but H¹≠0. | Separate bound is required. |
| §2.2 locally finite type supports | ⊔ℕ pt; ⊔ₙ Aⁿ; empty source | Compact supports on points give ⊕ℕk; the constant sequence (1,1,…) belongs only to the product. H_c²ⁿ(Aⁿ)=k(−n); empty source has 0. | Common dimension bound retained. |
| §2.3 free quotient flatness | Three permuted points, trivial coefficient k | q_*k=A of rank 3; N(e₀)=e₀+e₁+e₂, whereas a trivial action on k³ gives N=0. | Actual geometric equivariance matters. |
| §2.4 nearby fixed stalks | Scalar rotation on A¹ | C=[A→u A] has ranks 3→3, H⁰ and H¹ dimension 1; its Tate-quotient class is 0 while each cohomology module's class is nonzero. | Complex-perfect criterion retained. |
| §2.5 i!→i* | Identity fixed locus; origin of scalar A¹ | Identity cone=0; i!k=k(−1)[−2], i*k=k; error is the perfect nearby C. | Bounds and selected periodic comparison retained. |
| §2.6 Smith operation/reduction | Trivial action, free action, fixed origin | Psm(k)=T*k with pair (k,k); free fixed locus ∅ gives 0; fixed origin gives (k,k). O reduces to k on both pullback/reduction routes. | No restriction on prime 2 introduced. |
| §2.7 compact pushforward of kernels | Free 3-point orbit; identity point | RΓ_c=A and T*A=0; id_!A=A and id_!k=k with T*k≠0. | Output kernel belongs on the target. |
| §2.8 descended operations | Unit and regular tensor; proper identity versus A¹→pt | k⊗k=k; A⊗k=A and projects to 0. RΓ(A¹,k)=k in degree 0, RΓ_c(A¹,k)=k(−1)[−2]. | Tensor ideal and support distinction agree. |
| §2.9 relative Smith/compact support | Free orbit; identity with scalar 2 | Both composites give 0 on free orbit; identity carries 2 to 2 on the surviving k. | Natural !-comparison, without properness. |
| §2.10 cohomology localization | One fixed point plus free 3-point orbit | Compact complex k⊕A has Tate pair (k,k); fixed point alone gives (k,k), free summand gives (0,0). | Localization and worked example agree. |
| §3.1 Satake coefficient extension | Torus weights 1,−1; PGL₂ dual; unit | χ₁χ₋₁=χ₀; dual SL₂ standard has weights ±1, dimension 2; O-unit reduces to rank-1 k-unit. | General extension remains separate from supplied finite-DVR theorem. |
| §3.2 standards/coefficient change | λ=0,3 for SL₂ at p=3 | Δ(0)=∇(0)=k; Δ(3),∇(3) each have dimension 4 but opposite head/socle. T(3) has dimension 6. | Integral route now names the lifting contract. |
| §3.3 tilting definition/classification | Trivial group, torus, SL₂, zero | Unit has two length-one filtrations. T_O(3) rank 6 reduces to T_k(3) dimension 6; Δ_O(3) rank 4 reduces to non-tilting Δ_k(3). Zero has no highest-weight line. | Integral existence/classification made conditional on precise supplier input. |
| Integral tilting Hom/base change | O, O² and 0 for trivial group | Hom_O(O,O)=O, tensor k gives k=Hom_k(k,k); Hom_O(O²,O²)=M₂(O), reduction M₂(k); Hom(0,O)=0 on both sides. | Freeness and base change stated only on the proper domain. |
| Integral idempotent/lifting contract | e=diag(1,0) in M₂(O), 1 and 0 | e²=e and e mod p=diag(1,0); image O reduces to image k, each rank 1. 1 has rank 2, 0 rank 0; O⊕O reduces to k⊕k. | Idempotent lifting is an input, not deduced from a field classification. |
| §3.4 tensor closure/characters | SL₂ standard V, maximal torus | V⊗V has dimension 4=3+1 for T(2)⊕T(0); D=diag(1,2) and U=[[1,1],[0,1]] give (DU)₁₂=1, (UD)₁₂=2. | Character classification does not give fullness. |
| §3.5 bounded generation | Torus, zero, Δ(3) | Torus Extⁿ=0 for n>0; zero resolves by zero; 0→Δ(3)→T(3)→Δ(1)→0 has dimensions 4→6→2. | Finite-ideal route; no uniform length asserted. |
| §4.1 JMW condition | A¹ constants, P¹, elliptic curve | Constant positive ordinary H on A¹=0; P¹ has ranks H⁰=1,H²=1,H¹=0; elliptic H¹ rank 2. | Even nonzero Ext allowed; odd Ext excluded. |
| §4.2 parity definition | One-dimensional stratum, point O/p, k⊕k[1] | k[1] has degree −1≡1 and is dimension-even; O/p is not O-free; k⊕k[1] has both degrees 0,−1. | Freeness and direct-sum parity distinguish wrong models. |
| §4.3 uniqueness/Krull–Schmidt | Point O, O² and O[1] | End(O)=O local; End(O²)=M₂(O) with nontrivial diag(1,0); O[1] restricts in degree −1 instead of 0. | Restriction determines a normalized label, not arbitrary isomorphism uniqueness. |
| §4.4 Grassmannian parity | Torus point; GL₂ minuscule P¹; geometric characteristic 5 AS control | Generators O[0], O[1]; H¹(A¹,Lψ(x³)) has dimension 2, while H¹(A¹,k)=0. | Constant-local-system restriction is essential. |
| §4.5 perversity/exotic engine | GL₂ minuscule, zero, grading shift, λ=1 | k[1] on P¹ is perverse with 2-dimensional Satake image; zero maps to zero; [1] maps to grading −1 and label 1 to −1. | Good-prime engine remains a local target; integral inputs precede it. |
| §4.6 external products | r=1,2; E⊕E; zero factor | Dense ranks of E and E⊠E are 1; minuscule shifts 1 and 2. E⊕E has rank 2 and splits; E⊠0=0. | Integral classification route now names its missing supplier. |
| §4.7 graded Hom/composition | E=O_P¹[1]; point | End_T(E)=k⊕kh, indices 0,1; h² lies in H⁴(P¹,k)=0. Point Hom=k in index 0 only. | Composition adds indices before lifting projection. |
| §4.8 Tate parity | O, O[1], A and k at a point | Pairs (k,0),(0,k),(0,0),(k,k) respectively. | Integral even-unit condition rejects the mod-p substitute. |
| §4.9 Tate indecomposables | Point and minuscule P¹ | End_T(O)=k; End_T(O_P¹[1])=k[h]/h², whose nonunits form kh. End_T(O⊕O)=M₂(k) has diag(1,0). | Nonzero positive nilpotents do not destroy localness. |
| §4.10 ordinary reduction | Point Hom; augmentation ideal I | Hom_O(O,O)⊗k=k=Hom_k(k,k). I^C₃=0, whereas (I/pI)^C₃=k·u² has dimension 1. | Ordinary theorem kept; equivariant substitute fails. |
| §4.11 normalization | O, O[1], O[2]; corresponding Tate objects | Ordinary normalized degree 0 includes O but excludes shifts 1,2; T*O[2]≅T*O; negative Hom between point degree-zero objects=0. | Cross-negative condition remains explicit. |
| §4.12 lifting | Tate unit, scalar 2, positive h | L(T*O)=k; L(2)=2; L(h)=0; L(1·1)=1·1. | Degree-zero projection and ordinary-map naturality agree. |
| §5.1 fixed Grassmannian | Product tuples, nilpotents; dimension-one stratum p=2,3 | Fixed tuples=(a,…,a), including a=ε; source/fixed dimensions 3/1 differ by 2, but 2/1 differ by 1. | p=2 normalization control retained. |
| §5.2 norm | Unit; scalar α; rank-2 direct sum, p=3 | Nm(1)=1; scalar α maps to α³=−α; cube expansion has 2 pure+6 mixed terms. | All-k norm general; normalized perverse-parity use scoped explicitly. |
| §5.3 cyclic stalk filtration | Two basis vectors; odd constant vector, p=2,3; zero | p=3: 8 words=2 fixed+2 free orbits; cycle sign +1. p=2: 4 words=2 fixed+1 free orbit, odd constant sign −1. Zero has 0 words. | Oddness added to the stated trivial/free normalized norm application. |
| §5.4 Smith parity criterion | Trivial/free pieces; dimension-one norm | O gives (k,0), regular O[C₃] gives (0,0); source shift 3 and target shift 1 differ by 2. At p=2 the difference is 1. | General induced pariversity retained; normalized application scoped. |
| §5.5 additivity/semilinearity | f+g, scalar p, scalar α | Cube has 2 pure terms+2 transfers of 3 mixed terms; transfers become 0. p maps to 0; α maps to −α. | Normalized output now carries its odd good-prime hypotheses. |
| §5.6 category twist | Scalar endomorphisms over F₉ and F₂₇ | α↦−α for both Fr directions. β³=β+1, β⁹=β−1, β²⁷=β; DFr⁻¹(β)=β but DFr(β)=β−1. | Added discriminating order-three Frobenius control. |
| §5.7 prime-field form | Scalars 2, α, β on a torus generator | Fr(2)=2; Fr(α)=−α; Fr(β)=β+1 and inverse β−1. | Same chosen form/inverse used by the consuming targets. |
| §5.8 linear BC | Torus point identity f; zero/biproduct | BC^(p)(βf)=(β+1)BC^(p)(f); BC(βf)=βBC(f); wrong source direction gives β−1. BC(0)=0, and two pure summands survive. | Actual parity Hom witness added. |
| §6.1 hyperbolic localization | Torus, unit, GL₂ minuscule two attractors | Torus ρ=0; unit has only weight 0. RΓ_c(A¹,O[1])=O(−1)[−1]; point restriction O[1]. | Correspondence direction and bounded monodromic domain retained. |
| §6.2 extreme orbit | GL₂ λ=(1,0), ν=(0,1); ν=(2,−1) | λ+ν=(1,1), pairing with ρ is 0: intersection is one reduced point. ν=(2,−1) outside the weight segment gives empty intersection. | Dimension used only for nonempty intersections. |
| §6.3 normalized CT | Minuscule GL₂, unit and tensor square | At ν₊ shift +1 changes O(−1)[−1] to degree 0; at ν₋ shift −1 changes O[1] to degree 0; tensor weight multiplicities 1,2,1. | Positive normalization and torus restriction agree. |
| §6.4 normalized Smith/CT | Pairings ±1; torus; p=2,3 | p=3 shift differences +2,−2; torus 0; p=2 differences +1,−1. Nonfixed tuple (1,0,0) has no fixed contribution. | Oddness explicit; two-periodicity cannot remove an odd shift. |
| §6.5 CT/lifting | Point degree-zero torus objects; P¹ h | Hom(k,k[2i])=0 for i≠0; CT(h)=0 and L(h)=0, while index-zero scalar 2 stays 2 on both composites. | Grading-compatible route retained. |
| §6.6 torus BC | Weights (2,−1,4); scalars α,β and matrices | Sum=5; BC α=α; BC β=β, wrong direction β−1. Matrix [[1,β],[0,2]] is unchanged after correct linearization. | Direction control propagated. |
| §6.7 objectwise comparison | SL₂ standard tensor cube | Weight multiplicities (1,3,3,1) at (3,1,−1,−3); T(3)+T(1) has the same character and dimension 6+2=8. | Character equality identifies objects, not comparison maps. |
| §6.8 equivariant comparison maps | D=diag(1,2); U upper unipotent | DU=[[1,1],[0,2]], UD=[[1,2],[0,2]]; same torus weights but different upper-root intertwining. | Root-subgroup theorem remains a separate local obligation. |
| §6.9 natural Satake comparison | Torus; external triple of standard tiltings; zero | Torus weight 5 on both sides; diagonal tensor has dimension 8=2³; zero gives 0. Scalar β is β on both correctly linearized functors. | Natural theorem still requires the actual components of §6.8. |
| §7.1 CT conservativity | Zero; minuscule generator | CT(0)=0; minuscule lowest-weight component rank 1≠0; its map 0→E has CT cone with that nonzero component. | Finite support and orbit constructibility retained. |
| §7.2 exact Smith norm | Split 0→k→k²→k→0; nonsplit Δ(3) sequence | Cube mixed terms=6, all Tate-zero; two pure summands survive. Δ(3) has torus weights ±3,±1 with multiplicity 1 and a split torus sequence of dimensions 2,4,2. | Enhanced cone comparison remains part of target. |
| §7.3 equivariantization | Trivial Γ; S₃ permutation action; discontinuous sign | Γ=1 gives u₁=1. P₁₂P₂₃ is a 3-cycle, cube 1, but differs from P₂₃P₁₂. Discontinuous sign takes dense finite-support subgroup to +1 and some other element to −1. | Ordered cocycle and continuity both necessary. |
| §7.4 descent | Trivial descent and cyclic permutation of three factors | Trivial action gives original BC; three rotations compose to identity and cocycle product uγ·γ(uγ)·γ²(uγ)=1. | Separably closed overfield distinguished from a chosen separable closure. |
| §7.5 objectwise integral comparison | Unit and P¹ h | Both objects reduce to the k-unit. L(h)=0 but F_T(h)=h≠0 of index 1. On ordinary scalar 2 both maps give 2. | Naturality only on ordinary inflated maps retained. |
| §7.6 norm-image comparison | Ordinary scalar 2; arbitrary Tate h | Norm scalar 2³ mod 3=2 on both paths. Arbitrary h gives F_T(h)=h versus I_kL(h)=0. | Stronger norm-generated theorem is not inferred from objectwise comparison. |
| §8.1 algebra diagonal | Trivial action; k³ rotation; square-zero ring; p=2 | Δ(x)=xᵖ; transfer of (1,0,0)=(1,1,1), so quotient k³ is 0. Δ(ε)=0. At p=2 mixed defect aσb+bσa=Tr(aσb). | All-prime and nonreduced inputs retained. |
| §8.2 character extension | Trivial action; cyclic product; imperfect field control | Fr⁻¹χ(aᵖ)=χ(a); product transfer contains 1, so χ(1)=1 and χ(transfer)=0 would force 1=0. In F_p(t), χ(xᵖ)=t has no root since v_t(t)=1 is not divisible by p. | Perfect target and containment hypotheses retained. |
| §8.3 algebra/vector twist | k[x] with F_p[x] form; β; tensor balancing | Linearized Δ sends x↦x³ and β↦β. (aλ)³μ=a³λ³μ matches a⊗λ³μ. Wrong source direction sends β↦β−1. | Discriminating scalar witness propagated. |
| fixedSubring | Identity, rotation on k³, permutation polynomial ring | Identity fixes all a; rotation fixes exactly (a,a,a); σ(x₀)=x₁≠x₀. | Native equalizer determines the object. |
| cyclicTransfer | p=0,1,2,3; trivial and cyclic actions | Empty transfer=0; p=1 gives a; trivial char-p action gives 0. Rotation on k³ sends (a,b,c) to diag(a+b+c). | Total-function junk values kept outside prime theorems. |
| cyclicNorm | p=0,1,2,3; 0,1, trivial and cyclic actions | Empty norm=1; p=1 gives a; prime p gives Nm(0)=0,Nm(1)=1. Trivial action gives aᵖ; rotation on k³ gives diag(abc). | Norm is distinguished from transfer. |
| transferIdeal | Identity, cyclic product, zero source | Identity char-p action gives ideal 0; cyclic k³ gives unit ideal; zero ring quotient remains zero. For fixed b, bTr(a)=Tr(ba), so span equals image. | Correct ambient fixed subring; zero quotient allowed. |
| algebra_tate_diagonal headline | p=2,3; zero ring; nonprime control n=4 | Prime mixed orbits give transfer defect, hence quotient defect 0; zero target has 0=1. For σ swapping x,y in F₂[x,y] and length 4, Tr₄=0 but Nm₄(x+y)−Nm₄(x)−Nm₄(y)=(x+y)⁴≠0. | Primality, characteristic equation and σᵖ=1 all explicit; no narrowing. |
| tate_character_extension headline | Identity on F₃[x]; product k³; zero source | χ(x)=a yields unique extension x↦a by Fr⁻¹(a³)=a. Product and zero source admit no χ to a field: χ(1)=1≠0=χ(0). | Existence premise refers to actual character data; no free predicate or conclusion hypothesis. |

The F₂₇ calculation was independently recomputed by multiplication modulo β³−β−1. All three polynomial evaluations are 2 in F₃. In coefficient triples for (1,β,β²), β³=(1,1,0), β⁹=(2,1,0), β²⁷=(0,1,0). Inverse-direction linearization fixes all 27 elements; the opposite direction fails on 24. The p=2/3 tensor-word counts and cyclic signs were independently recomputed as well. These arithmetic checks live outside Suggested.lean.

## Acceptance checks and exact outcomes

1. Elaborated packages/SheafTheoreticSmithTheory/Suggested.lean using `lake env lean` from the supplied content checkout: exit 0. Exactly two warnings, at lines 56 and 67, each stating that the declaration uses `sorry`. No TauCeti import is present, so no targeted module build was needed. No other Lean build was run.
2. Elaborated a scratch copy of that same file with `#check @name` for all six declarations, once: exit 0, the same two intended warnings. Compared every elaborated signature with §8.1 or §8.2. fixedSubring retains its CommRing carrier and automorphism; transfer/norm retain natural-number length; transferIdeal retains its fixed-subring target. The diagonal retains primality, p=0 in A and σᵖ=1. Character extension additionally retains Field/CharP/PerfectRing, invariant containment, every norm and transfer, and annihilation by the specified χ. Zero dropped binders; no Lean change was required.
3. Dependency direction check using the requested name, order and movable flags: exit 0. Final exact output:

```text
depcheck: 56 roadmaps, 639 edges, 0 problem(s)
```

The earlier run before the final dependency-list propagation also exited 0 with `depcheck: 55 roadmaps, 621 edges, 0 problem(s)`.

There is no UPWARD, CYCLE or moved line.

4. Roadmap citation resolution: exit 0; no unresolved cross-roadmap citation and no unresolved Lean name. The resolver reports that it cannot check native pinned Lake names on its host; these were instead checked directly in the supplied pinned source files as recorded above.
5. JSON/TOML, allowed-edit and parity checks: the plan parses; all non-gap fields and the eight original gap entries equal the pre-edit values; the two appended records match their README contracts; all nine source keys remain unique. Suggested.lean and metadata.toml are unchanged. `git diff --check` exits 0.

No additional gate failure was listed in the brief. The existing citation lead for sources.toml was a filename, not a Lean declaration; final citation resolution reports none. No tooling, merge order, other package, source extraction, library pin, pull request or issue was edited. No commit or network write was made. F01's intake classification remains the explicit human/design-owner action; the mathematical supplier needs and local owners have been identified without pretending that package acceptance settles that action.
