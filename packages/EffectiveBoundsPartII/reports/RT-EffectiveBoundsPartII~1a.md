<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1411#issuecomment-6394711415 -->
Red team round 1 pass a (codex) of 06884a9

Verdict: needs_changes

1. **F01** (P2) Both counting headlines are statable without a new quotient carrier

   **Location:** `packages/EffectiveBoundsPartII/Suggested.lean:11`–15; `packages/EffectiveBoundsPartII/README.md:92`, 727, 748. The module claims the two counting theorems are “not statable at the pins without rebuilding a supplier-owned carrier”.

   **Claim:** The missing isomorphism-family carrier prevents acceptance signatures for the coefficient-system field-class bound and the cubic-logarithmic discriminant bound.

   **Witness:** A finite family of number fields, with pairwise absence of a rational algebra equivalence, counts distinct classes once. `Fin`, `NumberField`, `AlgEquiv`, discriminants, and this file's actual Jacobian-open algebra already exist.

   **Exact repair text:** Replace the non-statability paragraph with: “The two counting theorems are stated on arbitrary finite families of pairwise nonisomorphic number fields. These are equivalent to the unweighted class-cardinality bounds: take one representative per class. ArithmeticStatisticsPartI retains ownership of the quotient carrier.” Add the following two headline signatures, document their equivalence and names in §§5.5–5.6, and retain the supplier quotient for the eventual class-cardinality API:

   ```lean
   /-- An ordered bounded integer system represents at most the coefficient-box
   cardinality times the Bezout degree bound in pairwise nonisomorphic fields
   (README §5.5; Couveignes §4, p.496). -/
   theorem bounded_systems_field_class_bound
       (r d C m : ℕ) (hr : 1 ≤ r) (hd : 1 ≤ d)
       (K : Fin m → Type*) [∀ i, Field (K i)] [∀ i, NumberField (K i)]
       (hsep : Pairwise (fun i j => ¬ Nonempty (K i ≃ₐ[ℚ] K j)))
       (hmodels : ∀ i, ∃ E : Fin r → MvPolynomial (Fin r) ℤ,
         (∀ j, (E j).totalDegree ≤ d) ∧
         (∀ j a, |(E j).coeff a| ≤ (C : ℤ)) ∧
         ∃ φ : JacobianOpenAlgebra E →ₐ[ℚ] K i, Function.Surjective φ) :
       m ≤ (2 * C + 1) ^ (r * (d + r).choose d) * d ^ r := by
     sorry

   /-- Uniform discriminant bound for distinct rational isomorphism classes,
   expressed by arbitrary finite families of representatives
   (README §5.6; Couveignes Theorem 2, p.488). -/
   theorem discriminant_field_class_bound :
       ∃ Q : ℝ, 3 ≤ Q ∧
         ∀ (n H m : ℕ), Q < (n : ℝ) → 1 ≤ H →
         ∀ (K : Fin m → Type*) [∀ i, Field (K i)] [∀ i, NumberField (K i)],
           (∀ i, Module.finrank ℚ (K i) = n) →
           (∀ i, |NumberField.discr (K i)| ≤ (H : ℤ)) →
           Pairwise (fun i j => ¬ Nonempty (K i ≃ₐ[ℚ] K j)) →
           (m : ℝ) ≤ (n : ℝ) ^ (Q * n * (Real.log n) ^ 3) *
             (H : ℝ) ^ (Q * (Real.log n) ^ 3) := by
     sorry
   ```

   The equivalence is exact: a pairwise nonisomorphic finite family maps injectively to the class set; conversely, choose one representative for each member of a finite class set. Existing finiteness supplies the entire discriminant sublevel, and the finite systems/factors supply the entire represented set. Neither signature restricts the number of classes in advance.

   **Repair test:** For the factors of X(X−1), two copies of ℚ fail `hsep`; one copy passes. For (X²−2)(X²−3), the two quadratic fields pass and give 2≤13⁵·4=1485172 at r=1,d=4,C=6 (the polynomial's height is 6). For m=0 the bound is 0≤the nonnegative right side. Thus the signatures count unweighted classes, not embedded multiplicity; no surrogate quotient or assumed counting conclusion occurs. For H=1,n>1, every nonempty family violates the discriminant hypothesis, and m=0 gives 0≤the stated bound. These proposed signatures were inspected statically, not elaborated, as this pass prohibits Lean runs.

## Verified sound

Read all 788 lines of `packages/EffectiveBoundsPartII/README.md`, all 142 lines of `packages/EffectiveBoundsPartII/Suggested.lean`, and the repository README and CONTRIBUTING rules. The audit covers **9 Lean declarations (5 definitions/abbreviations, 4 theorems), 26 numbered README targets, 58 API bullets, 98 Checks, and all 4 bold worked examples**. There are no additional bold theorem targets: the numbered subsections carry the mathematical targets. Verified **26 primary target locators** against the complete published COU20 text; also checked the repeated convention/example locators. Resolved **23 distinct supplier section/target citations** across the five supplier roadmaps below. Counts distinguish distinct contracts from repeated references to them.

The following are the headline theorems: short integral rational bases (§0.5), bounded arithmetic first jets (§1.2), explicit models (§4.2), logarithmic models (§5.2), bounded-system class counts (§5.5), and the discriminant count (§5.6). The first four occur in Lean and survive the one-tactic padding probe: none is a definition expansion, numerical Check, boundary assertion, or direct application of an existing pinned theorem. The last two are the omissions in R01. Every retained definition has a real body and is used by a retained headline. No `set_option`, admitted data, `lemma`, admitted example, extra import, process narrative, or foreign fully qualified declaration name occurs in Suggested.lean. All nine own names appear in the README.

### Lean declaration and context ledger

All names below are in `TauCetiRoadmap.EffectiveBoundsPartII`. There are no standing section `variable` or `include` declarations. The supplied elaborated-signature artifact was compared individually with the source and README; zero missing instance binders were found. No fresh Lean process was run.

| Declaration; layer; source line | Exact object/instance context | Instances and computed sides | Result / change |
| --- | --- | --- | --- |
| `exists_short_integral_basis`; 0; 26 | K:Type u, Field K, NumberField K; b:Basis (Fin n) ℚ K | ℚ: house(1)=1=δ². ℚ(i): houses 1,1≤4. ℚ(√5): houses 1,√5≤5, but integral index 2 | True on tested instances; no change |
| `exists_bounded_first_jet_generators`; 1; 37 | K, Field, NumberField; r,d:ℕ; r≥1,d≥5,n(r+1)≤M; b rational basis; integer u; actual RingHom embeddings | ℚ,r=1,d=5: n=1,M=6,D=10,u=0; κ=0, house 0≤10, jet minor 1. Quadratic √2: u=(0,1), D=20, house √2≤320; confluent four-column minor 64 | Nonnegative parameters, integrality, generation and derivative factors retained |
| `jacobianPolynomial`; 4; 63 | r:ℕ; E:Fin r→MvPolynomial (Fin r) ℤ; output in ℚ-polynomials | (X,Y): J=1; (Y,X): J=−1; X² at 3 gives 6; empty matrix gives 1 | Correct equation-row convention; no change |
| `JacobianOpenAlgebra`; 4; 70 | Same r,E; native ideal quotient then localization at J | X²−2 gives ℚ(√2); X² gives zero; X(X−1) gives ℚ×ℚ; empty system gives ℚ | Localization excludes singular factors; no change |
| `HasBoundedModel`; 4; 79 | K:Type u, Field, NumberField; r,d:ℕ,H:ℝ; integral κ, actual E, Etale and compatible surjective algebra map | ℚ,r=d=1,H=1: E=X,κ=0,φ=id works. H<0,r≥1: even zero coefficients fail 0≤H. r=0,H<0 works only for K≃ℚ. E=X²,κ=0 fails J≠0 | No independent arbitrary map or free Prop field; no change |
| `explicitCoefficientBound`; 4; 101 | n,r,d:ℕ,δ:ℝ; no hidden field assumptions | (1,1,5,1): 5^(5/2)√6·10⁵. Doubling δ multiplies by 1024. (0,1,5,1): exponent 0 and positive-degree factor 0, so B=0. (1,0,0,1): B=1 | Total-function junk is outside theorem hypotheses; no change |
| `exists_explicit_small_model`; 4; 110 | K, Field, NumberField; r,d and three explicit range hypotheses | ℚ,X at 0: 1≤5^(5/2)√6·10⁵. ℚ(√2),X²−2: degree 2≤5,height 2≤4√6·40⁵·8⁵,J=2√2≠0 | Same E,κ and compatible component map; no change |
| `centralBinomialRank`; 5; 124 | n:ℕ; sInf of positive admissible indices | r(0),r(1),r(2),r(14),r(15)=1,1,2,4,5; Catalan 1,2,5,14,42 | Infimum set nonempty, no accidental r=0; no change |
| `exists_logarithmic_small_models`; 5; 130 | ∃Q:ℝ,Q≥3 before all K:Type u, Field and NumberField; n>Q; r fixed by n | r(15)=5,M=252,ℓ=237; log B=237/30·log237+½log252+5log6750+10logδ. Terms have orders (log n)² and log n logδ; at n=1 proposed 1≤Qlog1=0 fails and is excluded | Uniform field-independent r and Q; no change |

Ring homomorphisms K→ℂ fix ℚ, so the jet target has exactly n embeddings; these are not arbitrary functions or a vacuous empty family. The four K-dependent declarations retain both Field and NumberField. The logarithmic theorem is universe-polymorphic, with its constant outside the field quantifier at each universe. The finiteness and equivalence statements used by the omitted counting theorems can also be phrased on native finite field families, as in R01.

### README target ledger

NF means a number field, n≥1, δ≥1. Range means r≥1,d≥5,M=choose(d+r,d)≥n(r+1). Bounds outside Range below test defining formulas or the expressly conditional linear algebra, not the model existence theorem. Every row records actual numerical/algebraic values.

| Target; README line; hypotheses | Instances and computed sides | Source locator verified | Result / change |
| --- | --- | --- | --- |
| 0.1 weighted measure; 100; NF mixed space | ℚ: vol=2; ℚ(i): scale det=2, disk vol=2π≥4, g(1,1)=2 versus house²=1 | COU20 line 104, §2 p.489 | Correct; no change |
| 0.2 covolume; 127; actual integral basis | ℚ(i): product covol 1, canonical 2, Gram det4=abs(−4); √5 rational basis gives20 versus field disc5 | COU20 line 127, §2 p.490 | Genuine basis condition necessary |
| 0.3 short witnesses; 145; NF | n=1: product1=δ^(1/2); n=4,m=3: exponent4/(2·2)=1; n=5,m=3:5/6 | COU20 line 140, §2 p.490 | Strictly more than half retained |
| 0.4 product span; 173; finite field extension,2dimV>n | K=k:2>1,product span dim1; V=ℚ⊂quadratic:2=2 but dimVV=1; inseparable degree2,V=K:dimVV=2; k⁴,V=k³×0:6>4 but dimVV=3 | COU20 line 150, §2 p.490 | Proof extends to inseparable fields; zero divisors excluded |
| 0.5 short rational basis; 192; NF | ℚ:1≤1; ℚ(i):1≤4; ℚ(√5):(1,√5)≤5,integral index2 | COU20 line 161, Proposition1 p.490 | No maximal-order-basis claim |
| 1.1 parameters; 222; integral rational basis,D≥0 | α=(1,√5): embedding det−2√5≠0; u=(0,1) gives√5; u=0 gives0; α=(1,1) gives det0 | COU20 line 207, §3 p.492 | Complex inverse, not integer inverse |
| 1.2 bounded jets; 251; Range | ℚ,u=0:jet minor1; two coincident supports:det0; grid polynomial ∏(T−j):value0 at j<D,value D! at D; plane seven-collinear rank11<21 | COU20 line 242, §3 pp.491–492 | Generic minor and D+1 grid needed |
| 1.3 value descent; 272; actual first jets onto | √2 degree1 values span dim2; √5 integer image index2 although rational rank2; κ=0 in quadratic has rank1<2 | COU20 line 249, §3 p.492 | Rational and integral surjectivity distinguished |
| 2.1 relation kernel; 302; r,d≥0,full value rank for rank formula | √2,d3:two relations,rank4−2=2,Gram diag(5,5); κ=0 in quadratic,d2:rank2≠3−2 | COU20 line 255, §3 p.493 | Kernel saturation and full-rank condition correct |
| 2.2 transpose index; 333; full value rank | √5,d2: q=2,covolS=2√26,covolL⊥=√26; map z↦2z:ratio2/1=2 | COU20 line 269, §3 p.493 | Full lattice dual gives q, not 1 |
| 2.3 Gram/discriminant; 362; actual β,rankB=n | √5,d2:detBBᵗ=104,detVV*=520,520/5=104; ℚ(i):4/4=1,unconjugated numerator−4 | COU20 line 278, §3 pp.493–494 | All determinants and sign conventions consistent |
| 2.4 evaluation height; 382; Range,houseκ≤C₀ | r=d=2,C₀=1:M=6,H₀=1,G=6; n2,r1,d5:C₀=40δ²,H₀=40⁵δ¹⁰,G=6·40¹⁰δ²⁰ | COU20 line 291, §3 pp.493–494 | Constant monomial contributes1 |
| 2.5 relation covolume; 402; Range | √5,d2:covolL=√26≤√(520/5)=2√26; κ=0 overℚ,d2:1=√(1/1) | COU20 line 309 and line285, §3 p.494/p.493 | Correct denominator and index direction |
| 3.1 short relations; 432; Range,ℓ>0 | Intrinsic line:ballvol2; ℓ2:cubevol2≤π; √2,d3:relation norms√5,√5,product5≤2·covolL=10 | COU20 line 323, §3 p.494 | Independent family need not be integral basis |
| 3.2 truncation; 460; sorted witnesses | n2,ℓ4:k3,codim1,tail2; norms1,2,4,8:product64=4²·4,retained maximum4≤8 | COU20 line 330, §3 p.494 | Exact n−1 discard preserves strict codimension |
| 3.3 joint derivatives; 480; first jets onto | P=0,d1:X↦1; d0:kernel0,rank0; P=0,1,d3:columns(−1,1),(0,1),det−1 | COU20 line 342, §3 p.494 | Derivative target contains all blocks |
| 3.4 full block; 498; codimW=n−1 and joint onto | diagonalℂ⊂ℂ²:codim1,block ranks1,1; hyperplaneℂ⁴:codim1,block ranks1,2; zeroℂ²:codim2, ranks0,0 | COU20 line 343, §3 p.494 | Boundary codim=n correctly excluded |
| 3.5 common minor; 518; integer selected rows | X²−2:J=±2√2; X³−2:Norm(3θ²)=27·4=108; X² at0:J=0 | COU20 line 349, §3 pp.494–495 | Field-embedding injectivity suffices without normality |
| 4.1 component map; 548; vanishing E,generation,J≠0 | X²−2:inverse√2/4,product1; product of two quadratics:two field factors; X²:zero localized ring; dual numbers:2ε≠0 but (2ε)²=0 | COU20 line 354, Proposition2 p.495 | Unit/nonzero distinction and compatible map correct |
| 4.2 explicit model; 588; Range | ℚ,X:height1≤5^(5/2)√6·10⁵; plane X(X−1),XY:J=X(2X−1),J(1,0)=1,open algebraℚ | COU20 line 354, Proposition2 p.495 | No global zero-dimensionality claim |
| 5.1 least rank; 628; n≥1 | Catalan1,2,5,14,42;r1=1,r2=2,r14=4,r15=5; n15:90≤252≤360; n1:1>3log1=0 | COU20 line 385, equation(1) p.495 | Bounds are eventual where required |
| 5.2 log models; 657; one absolute Q,n>Q | n15:r5,M252; log coefficient=(237/30)log237+½log252+5log6750+10logδ; δ=1 deletes last summand | COU20 line 20 and line420, Theorem1 p.487, §4 p.496 | Log exponent growth correct |
| 5.3 system box; 677; r,d,C≥0 | r0:0 slots,1 tuple; d0:r slots; C0:1 tuple; r2,d2:12 slots versus wrong18 | COU20 line 425, §4 p.496 | Native ordered polynomial system is an arithmetic specialization |
| 5.4 box count; 707; r,d,C≥0,B≥0 for floor | r1,d2,C1:3³=27; r2,d0,C1:3²=9; r0,C0:1⁰=1; B3.7:7 integer choices | COU20 line 425, §4 p.496 | Both directions of integer-floor equivalence hold |
| 5.5 field-class count; 727; r,d≥1 | product quadratics:4 geometric points,2 factors,2 classes; X(X−1):2,2,1; X²:0,0,0; plane line+point:1≤4 | COU20 line 425, §4 p.496 | Mathematics conditional on declared gap; acceptance omission R01 |
| 5.6 discriminant count; 748; ∃Q before n,H,n>Q,H≥1 | H1,n>1:N=0,logH=0; degree1,H1:N=1 but excluded; rM=O(nlog²n), logB=Q₀log²n+(Q₀/n)logn·logH, so exponents nlog⁴n and log³n·logH | COU20 line 35, Theorem2 p.488, line425 p.496 | Uniform exponent and inclusive cutoff correct; omission R01 |

### Every README Check, recomputed

Each line below is a separate Check in `packages/EffectiveBoundsPartII/README.md`. “Pass” includes the intended failure of an explicitly excluded wrong model; these are not claims that the wrong model satisfies the theorem. No Check requires repair.

| Line / section | Instance and computed values on both sides | Result / change |
| --- | --- | --- |
| 114 / 0.1 | ℚ: length([−1,1])=2=2¹, not1 | Pass / none |
| 115 / 0.1 | ℚ(i): μ_can(disk)=2·π, standard areaπ | Pass / none |
| 116 / 0.1 | Totally real quadratic: r₂=0,scale2⁰=1; house square volume4=4 | Pass / none |
| 117 / 0.1 | z=1: gauge1, g(1,1)=2,norm√2 | Pass / none |
| 133 / 0.2 | ℚ,b=(1): Gram det1,covol1,absdisc1 | Pass / none |
| 134 / 0.2 | ℚ(i):Gram diag(2,2),det4,covol2; unweighted covol1 | Pass / none |
| 135 / 0.2 | √5:b=(1,√5),disc20; β=(1,(1+√5)/2),disc5; ratio4=index² | Pass / none |
| 159 / 0.3 | n=m=1,ω=1,δ=1:house1≤1 and product1≤1 | Pass / none |
| 160 / 0.3 | n4:m3,2m6>4; third exponent4/(2·2)=1 | Pass / none |
| 161 / 0.3 | n5:m3,third exponent5/(2·3)=5/6≤1 | Pass / none |
| 179 / 0.4 | K=k,V=K:2dimV=2>1,span(VV)=K has dim1 | Pass / none |
| 180 / 0.4 | V=ℚ in degree2:2dimV=2=n,dimspan(VV)=1≠2 | Pass / none |
| 181 / 0.4 | 𝔽₂(t)/𝔽₂(t²):degree2,insep2;1·1=1,1·t=t span dim2 | Pass / none |
| 182 / 0.4 | k⁴,V=k³×0:2dimV=6>4,dimspan(VV)=3<4 | Pass / none |
| 198 / 0.5 | ℚ:b=(1),n1,house1=δ²1; NF degree0 impossible since1≠0 | Pass / none |
| 199 / 0.5 | ℚ(i):houses(1,1),δ2,δ²4;1≤4 twice | Pass / none |
| 200 / 0.5 | √5:houses(1,√5),δ²5;coordinate det2 gives index2 | Pass / none |
| 236 / 1.1 | ℚ,α1,u3:κ=3·1=3 | Pass / none |
| 237 / 1.1 | Quadratic,u0:κ0; repeated value rows(1,0,…) have rank1<2 | Pass / none |
| 238 / 1.1 | α=(1,√5):basis overℚ,det of integral coordinates2,not±1 | Pass / none |
| 239 / 1.1 | α=(1,1):embedding matrix[[1,1],[1,1]],det0 | Pass / none |
| 257 / 1.2 | n1,r1,d5:M6≥2,D10;u0,jet columns(1,X) giveI₂,det1 | Pass / none |
| 258 / 1.2 | Quadratic,u0:four jet rows rank2<4,with value-row rank1<2 | Pass / none |
| 259 / 1.2 | D2:P=T(T−1),P0=P1=0,P2=2=2!;D0:P=1,P0=1=0! | Pass / none |
| 260 / 1.2 | Seven points(i,0),d5:horizontal value/derivative rank6,vertical derivative rank5,total11<21 | Pass / none |
| 278 / 1.3 | √2:1,√2 independent,degree1 value rank2=[K:ℚ] | Pass / none |
| 279 / 1.3 | √5:integer image ℤ+ℤ√5,index2; rational rank2 | Pass / none |
| 280 / 1.3 | κ0 in quadratic:polynomial imageℚ,rank1≠2 | Pass / none |
| 317 / 2.1 | κ0,d2:kernel vectors(0,1,0),(0,0,1),rank2;1 evaluates1≠0 | Pass / none |
| 318 / 2.1 | d0:constant map injective,kernel rank0;for n2,image rank1<2 and truncated1−2=0 | Pass / none |
| 319 / 2.1 | √2,d3:kernel basis(−2,0,1,0),(0,−2,0,1),rank2,norm²5 each,dot0 | Pass / none |
| 320 / 2.1 | κ=1/2:eval(X)=1/2∉ℤ,so no evaluation into𝓞_ℚ | Pass / none |
| 321 / 2.1 | κ0,quadratic,d2:actual kernel dim2,claimed formula without rank hypothesis would give3−2=1 | Pass / none |
| 348 / 2.2 | √5,d1:coordinate determinant2,integral image index2,transpose index2;higher powers add no new lattice | Pass / none |
| 349 / 2.2 | √2,d1:B=I₂,index1;all higher powers integral in1,√2 | Pass / none |
| 350 / 2.2 | z↦2z:ker0,covolker1;orthogonalℤ,covol1;dual image2ℤ,covol2 | Pass / none |
| 368 / 2.3 | ℚ(i):B=I₂,detBBᵗ1;detVV*4,4/absdisc4=1;detVVᵗ=−4 | Pass / none |
| 369 / 2.3 | √5,d2:BBᵗ=[[27,−2],[−2,4]],det104;VV*=[[31,21],[21,31]],det520;520/5=104 | Pass / none |
| 370 / 2.3 | Basis(1,√5):BBᵗ=diag(26,1),det26;basisdisc20;520/20=26≠520/5 | Pass / none |
| 388 / 2.4 | r2,d2:monomials6 not9;C₀1 gives H₀1,G6 | Pass / none |
| 389 / 2.4 | κ0:constant1,positive monomials0;false C₀0 bound gives H₀0<1 for d>0 | Pass / none |
| 390 / 2.4 | n2,r1,d5:D20,C₀40δ²,H₀40⁵δ¹⁰,G6·40¹⁰δ²⁰ | Pass / none |
| 408 / 2.5 | √5,d2:relation generator(−5,0,1),norm√26;transpose covol2√26 | Pass / none |
| 409 / 2.5 | detVV*520,disc5:√(520/5)=√104=2√26,not√520 | Pass / none |
| 410 / 2.5 | κ0 overℚ,d2:orthonormal kernel(X,X²),covol1;valueGram1,disc1,ratio1 | Pass / none |
| 446 / 3.1 | X²−2:coeff norm√5,max coeff2,value at√2=0 | Pass / none |
| 447 / 3.1 | Nonzero integer coefficient has abs≥1; rational constant1/2 has norm1/2<1 | Pass / none |
| 448 / 3.1 | Vectors(2,0),(0,1):real rank2,det2,integral index2≠1 | Pass / none |
| 449 / 3.1 | Intrinsic interval length2=2¹·1^(−1/2);ambient area0 | Pass / none |
| 450 / 3.1 | Half-side1/√2:square area2,vertex norm1,disk areaπ≥2;half-side1 gives vertex√2>1 | Pass / none |
| 466 / 3.2 | n2,r1,d5:M6,ℓ4,k3,codim4−3=1=n−1,tail4+1−3=2 | Pass / none |
| 467 / 3.2 | n1:k=ℓ,discard0,codim0;discarding one gives1=n,losing strictness | Pass / none |
| 468 / 3.2 | Norms1,2,4,8:product64=4²·4;retained max4≤4^(4/4)√4=8 | Pass / none |
| 486 / 3.3 | P0,d1:kernelℂX,X′(0)=1,derivative rank1 | Pass / none |
| 487 / 3.3 | P0,d0:value rank1,kernel0,derivative rank0≠1 | Pass / none |
| 488 / 3.3 | f=X(X−1),g=X²(X−1):derivatives at0,1 are(−1,1),(0,1),det−1 | Pass / none |
| 504 / 3.4 | Diagonal inℂ²:dim1,codim1,projection ranks1,1 | Pass / none |
| 505 / 3.4 | Hyperplane x₁=0 inℂ²×ℂ²:dim3,codim1,block ranks1,2 | Pass / none |
| 506 / 3.4 | Zero inℂ²:codim2=n,block ranks0,0 | Pass / none |
| 524 / 3.5 | θ³2:J=3θ²,NormJ=3³·Normθ²=27·4=108;all moduli3·2^(2/3) | Pass / none |
| 525 / 3.5 | X²−2 at±√2:J=±2√2,both squares8≠0 | Pass / none |
| 526 / 3.5 | X² at0:value0,derivative0,not a nonsingular point | Pass / none |
| 568 / 4.1 | X²−2:J=2X,A=ℚ(√2);inverse at√2=√2/4,multiplication1 | Pass / none |
| 569 / 4.1 | Product quadratics:derivatives−2√2 and2√3,both nonzero;2 field factors,4 geometric roots | Pass / none |
| 570 / 4.1 | X² quotient:x²0;localizing2x nilpotent gives1=0;no unital map toℚ | Pass / none |
| 571 / 4.1 | X²−2 at3:J=6,polynomial value7;6≠7 | Pass / none |
| 572 / 4.1 | X² at0:J=0;no inverse can map to unit1 inℚ | Pass / none |
| 573 / 4.1 | (X,Y):J1;(Y,X):J−1;both quotientℚ and invert units | Pass / none |
| 574 / 4.1 | r0:empty determinant1;in zero ring that element is also0 | Pass / none |
| 575 / 4.1 | ℚ[ε]/ε²:E(ε)=0,J=2ε≠0,J²0;nonzero is not unit | Pass / none |
| 576 / 4.1 | 𝔽₂:X²−X derivative−1=1,X² derivative0;𝔽₃:X³−X derivative−1=2 | Pass / none |
| 601 / 4.2 | ℚ,X,κ0:r1,d5,M6,ℓ5,height1≤5^(5/2)√6·10⁵,J1 | Pass / none |
| 602 / 4.2 | √2,X²−2:degree2≤5,height2,δ²8,J2√2;B=4√6·40⁵·8⁵>2 | Pass / none |
| 603 / 4.2 | E=(X(X−1),XY):J=X(2X−1);on line X0:J0;at(1,0):J1;localized algebraℚ | Pass / none |
| 604 / 4.2 | E=X:coeffheight1≤H1≤H′2;zero function sends1 to0≠1 | Pass / none |
| 605 / 4.2 | n1,r1,d5:B(2δ)/B(δ)=2^(2·5)=1024 for δ>0 | Pass / none |
| 606 / 4.2 | n0,r1,d5,δ1:M6,ℓ6,6/(2·0)=0 inℝ,6⁰=1;remaining factor0⁵=0,soB0 | Pass / none |
| 642 / 5.1 | r1=1 because2≥2;r2=2 because2<4 and6=2·3 | Pass / none |
| 643 / 5.1 | Catalan4=70/5=14,Catalan5=252/6=42;least ranks for14,15 are4,5 | Pass / none |
| 644 / 5.1 | n1:r1=1>3log1=0 | Pass / none |
| 645 / 5.1 | n0:0·(r+1)=0≤choose(2r,r);least positive r1 | Pass / none |
| 663 / 5.2 | n14:r4,M70; n15:r5,M252;90≤252≤360,only d5 meets cutoff | Pass / none |
| 664 / 5.2 | n1:Qlog1=0<r1=1 for every realQ | Pass / none |
| 665 / 5.2 | δ1:Qlogn·log(nδ)=Q(logn)²;δ>1:add Qlogn·logδ,with no inverse logδ | Pass / none |
| 692 / 5.3 | r0:0 slots,empty function unique;count(2C+1)⁰1 | Pass / none |
| 693 / 5.3 | d0:M=choose(r,0)=1;r constants give(2C+1)^r | Pass / none |
| 694 / 5.3 | C0:all coefficients0,one zero tuple;1^(rM)=1 | Pass / none |
| 695 / 5.3 | r2,d2:6 monomials,12 slots;coordinatewise degrees give9 and18,including X²Y² of degree4>2 | Pass / none |
| 713 / 5.4 | r1,d2,C1:3 slots,each3 values,3³=27 | Pass / none |
| 714 / 5.4 | B3.7:floor3,integer interval−3,…,3 count7;ceiling4 gives9 | Pass / none |
| 715 / 5.4 | r0:exponent0,count1; r2,d0,C1:exponent2,count9 | Pass / none |
| 733 / 5.5 | Product quadratics:geometric4,factors2,isomorphism classes2 | Pass / none |
| 734 / 5.5 | X(X−1):geometric2,factors2,bothℚ,classes1 | Pass / none |
| 735 / 5.5 | X²:J-open zero ring;points0,factors0,classes0 | Pass / none |
| 736 / 5.5 | Plane line+point:only isolated point(1,0),multiplicity1≤d^r=2²=4 | Pass / none |
| 754 / 5.6 | H1,n>1:classcount0≤n^(Qnlog³n),H-power1,logH0 | Pass / none |
| 755 / 5.6 | Nonnormal cubic:degree3,Aut size1,embedded count3/1=3,class contribution1 | Pass / none |
| 756 / 5.6 | n1,H1:classcount1,r1=1,Qlog1=0;n>Q≥3 fails | Pass / none |

### API statement ledger

The hypotheses are those of the corresponding target above. These are README API obligations, not additional Lean declarations. Each API bullet is checked separately; the examples do not replace the proof-route audit.

| README line / API statement | Computed instance and both sides | Result / change |
| --- | --- | --- |
| 106 / scaled Haar measure | ℚ(i),unit square:μ_can=2·1=2 | Pass / none |
| 107 / measurable-set volume | ℚ(i),unit disk:μ_can=2π=2·volume;empty set0=2·0 | Pass / none |
| 108 / pairing contributions | Real1 with1 gives1;complex1 with1 gives2Re1=2;complex1 with i gives0 | Pass / none |
| 109 / house body volume | r₁0,r₂1:2⁰(2π)¹=2π;real quadratic:2²=4 | Pass / none |
| 110 / house gauge | ℚ(i),x=1+i:mixed modulus√2=house;weighted norm2 differs | Pass / none |
| 151 / ordered independent family | ℚ(i),1,i:two independent vectors,houses1,1,product1≤δ^(n/2)=2 | Pass / none |
| 152 / first m span | ℚ(i):n2,m2,span(1,i) dim2;ℚ:n=m=1 | Pass / none |
| 153 / first m embedding bounds | ℚ(i):all conjugate moduli1≤δ2 | Pass / none |
| 154 / all-house product | ℚ:product1=1;ℚ(i):product1≤2 | Pass / none |
| 155 / witness gauge | ℚ(i),i:house1 versus g-norm√2 | Pass / none |
| 228 / κ construction | α=(1,√5),u=(1,2):κ=1+2√5∈𝓞_K | Pass / none |
| 229 / embedding formula | Two embeddings give1±2√5=1·τ(1)+2·τ(√5) | Pass / none |
| 230 / parameter equivalence | Embedding matrix[[1,√5],[1,−√5]] has determinant−2√5≠0 | Pass / none |
| 231 / house bound | u=(1,2),D2,n2,δ²5:house1+2√5≤20=nDδ² | Pass / none |
| 232 / reindex and inverse basis change | Swap gives2√5+1=1+2√5;basis(1,1+√5),coefficients(−1,1) give√5=0·1+1·√5 | Pass / none |
| 308 / actual kernel | κ√2,d2:coefficients(a,b,c) satisfy a+2c=0,b=0;kernelℤ(−2,0,1) | Pass / none |
| 309 / membership iff | X²−2:degree2,value0,member;X³−2X:value0,degree3>2,not member at d2;1:value1,not member | Pass / none |
| 310 / rank | √2,d3:M4,n2,kernel rank2=4−2;κ0 in same field instead rank3 without onto | Pass / none |
| 311 / saturation | 2(X²−2)(√2)=0 and (X²−2)(√2)=0;2·1 evaluates2≠0 | Pass / none |
| 312 / complex kernel | √2,d2:equations a±b√2+2c=0 give b0,a=−2c;one complex parameter,matching complex span of integral kernel | Pass / none |
| 313 / degree inclusion | X²−2 belongs to d2 and d3 with same vector extended by0;X³−2X enters only at d3 | Pass / none |
| 339 / transpose source and target | √5,d2:β-dual basis gives rows(1,−1,5),(0,2,0) inℤ³ | Pass / none |
| 340 / α-coordinate formula | For α=2,κ²=5:dual coordinates5,0 match transpose rows' third entries5,0 | Pass / none |
| 341 / transpose injectivity | √5,d1:matrix determinant2≠0;κ0 would kill the dual functional vanishing on1 | Pass / none |
| 342 / containment and rank | Rows(1,−1,5),(0,2,0) dot relation(−5,0,1) to0,0;row rank2=n | Pass / none |
| 343 / equality of indices | √5,d2:index in integers2,index in orthogonal2,covol ratio(2√26)/√26=2 | Pass / none |
| 344 / integral-basis invariance | Swap β basis:transpose generating rows swap,Gram determinant104 unchanged | Pass / none |
| 438 / independent sorted relations | √2,d3:two orthogonal norm√5 relations,product5≤2·covolL=10 | Pass / none |
| 439 / degree and vanishing | X²−2,X³−2X have degrees2,3≤3;at√2 both evaluate0 | Pass / none |
| 440 / real and complex spans | Coefficient vectors(−2,0,1,0),(0,−2,0,1) have rank2 overℝ andℂ | Pass / none |
| 441 / norm lower bound | Each vector has norm√5≥1;single integer monomial has norm1 | Pass / none |
| 442 / coefficient norm bound | X²−2:max coefficient2≤√5;X:norm1=coefficient1 | Pass / none |
| 554 / evaluated determinant | (X²,Y),κ=(3,4):derivative matrixdiag(6,1),det6=J(κ) | Pass / none |
| 555 / homomorphism compatibility | X²−2 at√2 gives2√2;conjugation gives−2√2=J(−√2) | Pass / none |
| 556 / localization extension | √2:2√2 is unit with inverse√2/4;dual numbers:2ε squares0,so no extension to invert it | Pass / none |
| 557 / polynomial compatibility | f=X+1:φ([f])=√2+1=f(κ);f=X² gives2=κ² | Pass / none |
| 558 / inverse Jacobian image | φ(J⁻¹)=√2/4;φ(J)φ(J⁻¹)=(2√2)(√2/4)=1 | Pass / none |
| 559 / uniqueness | κ=√2 forcesφ(X)=√2,φ(J⁻¹)=√2/4;conjugate map sendsX to−√2 and fails this compatibility | Pass / none |
| 560 / surjectivity | 1,X map to1,√2,which spanK of dimension2 | Pass / none |
| 561 / marked field factor | Product quadratics gives A=K₂×K₃;φ ontoK₂ maps idempotents(1,0),(0,1) to1,0 | Pass / none |
| 562 / rational/integer compatibility | E=X²−2 at3:integer determinant6,rational determinant6 inℚ and inℚ(i) | Pass / none |
| 563 / universal quotient/localization | X²−2 maps to0 in quotient;class2X times its adjoined inverse gives1 | Pass / none |
| 564 / equation-row transposition | (X,Y) givesJ1,(Y,X) givesJ−1;both ideals(X,Y),both localizationsℚ | Pass / none |
| 594 / same witnesses | ℚ,X,κ0:vanishing0,J1,φ(X)=0;usingκ1 instead givesE(κ)=1≠0 | Pass / none |
| 595 / monotonicity and transport | X at0:degree1≤2,height1≤2;conjugation √2↦−√2 preserves X²−2,height2 and J≠0 | Pass / none |
| 596 / positivity and expansion | n2,r1,d5:ℓ4,G6·40¹⁰δ²⁰;ℓ^(ℓ/2n)√G=4√6·40⁵δ¹⁰>0 forδ≥1 | Pass / none |
| 597 / forced map | X²−2,κ√2 forces values√2 and√2/4 on X,J⁻¹;their product equation equals1 | Pass / none |
| 634 / least admissible rank | n3:Catalan1=1,Catalan2=2<3,Catalan3=5≥3;least r3 | Pass / none |
| 635 / positivity and minimality | n15:r5>0,15·6=90≤252;r4 inadmissible75>70 | Pass / none |
| 636 / two-sided M bound | n15,r5:90≤252≤360; n1,r1:2≤2≤8 | Pass / none |
| 637 / eventual lower/upper r | n15:r5≥5 and5≤3log15≈8.124; n1:r1=1>0,requiring threshold | Pass / none |
| 638 / monotonicity | 14≤15 andr14=4≤r15=5;3≤5 withr3=r5=3 | Pass / none |
| 683 / box predicate | r1,d2,C1:X²+1 admitted;2X excluded because2>1;X³ excluded because3>2 | Pass / none |
| 684 / zero included | Zero polynomial totalDegree0≤d,all coefficients0≤C;degree0 convention agrees | Pass / none |
| 685 / coefficient equivalence | r2,d2:(X²,Y²) has12 coordinates withtwo1s andten0s;each coordinate interval[−1,1] | Pass / none |
| 686 / finiteness | r2,d2,C1:12 slots,3 values each,531441 systems | Pass / none |
| 687 / inclusion | X² belongs at(d2,C1) and(d3,C2);X³ belongs only to latter | Pass / none |
| 688 / native bounded module | r2,d2:each equation has support withinsix exponents;X²Y² has total degree4 and is excluded | Pass / none |

### Remaining conventions and bold worked examples

| Statement / location | Computed instance and sides | Result / change |
| --- | --- | --- |
| Discriminant/root convention; line21 | ℚ(i):disc−4,abs4,n2,δ2;ℚ:disc1,n1,δ1;no n=0 number field | Pass / none |
| Coefficient metric/zero-rank volume; line25 | X²−2:norm²4+1=5,value0;empty Gram determinant1 and intrinsic zero-lattice covolume1 | Pass / none |
| First-jet derivative convention; line27 | X² at3:(value,derivative)=(9,6),not(9,3);in𝔽₂ derivative0 | Pass / none |
| Row Hermitian convention; line27 | Rows1,i:VV*=[[1,−i],[i,1]],native Gram=[[1,i],[−i,1]];both det0,diagonal1,1. Single rowi has Hermitian Gram1 versus unconjugated−1 | Pass / none |
| Explicit parameters; lines29–36 | n2,r1,d5:M6,ℓ4≥nr2,D20,C₀40δ²,G6·40¹⁰δ²⁰;at n0 real quotient0 and B0 | Pass / none |
| Integral/rational distinction; line40 | √5:rational span dim2,integer image index2;normal-closure group S₃ gives3 embedded cubic subfields but1 rational-isomorphism class | Pass / none |
| Bold integral-index worked example; line776 | β-coordinate rows(1,−1,5),(0,2,0),Gramdet104;relationnorm√26,index2;embeddingGramdet520=5·104 | Pass / none |
| Bold all-block minor example; line778 | Four-dimensional L,dimW3:codim1<2;kernel of ontoℂ² hasdim2,codim2 andzero blocks;minor±2√2 and cubic norm108 | Pass / none |
| Bold several-classes example; line780 | Twoquadratics:derivative values−2√2,2√3,4points/2classes;splitquadratic2points/1class;doublepoint0openpoints/0classes | Pass / none |
| Bold uniform-parameter example; line782 | Catalans1,2,5,14,42;forr2,d2,C1 box3¹²=531441. logB=Q₀log²n+(Q₀/n)logn·logH,so rMlogB=O(nlog⁴n+log³n·logH);H1 makes second term0 | Pass / none |

The source's row ordering groups all values before all first derivatives, whereas the supplier and Lean group the Option-valued jet coordinates by point. This is a row permutation, so ranks and onto statements agree. No assertion transfers a minor's sign without specifying its row order. Arithmetic Jacobian equation rows and variable columns have their own explicit transposition test.

Inapplicable degeneracies are excluded by the actual carriers, not silently assumed away: a NumberField cannot be a zero ring, a DVR, positive-characteristic field, infinite-degree extension, or degree-zero field. Arbitrary-characteristic and nonreduced cases were tested where the integer Jacobian and general field-product-span statements permit them. No target involves general topological groups, fans, covers, a residue-field cardinal q, or p-adic valuations; tests of noncompact groups, q=1, and ramification formulas therefore do not instantiate a target. The nonnormal cubic with S₃ normal closure tests the group-theoretic issue that actually occurs. The zero ring, empty system, unit/zero ideals, rank-zero relation space, natural subtraction and division-by-zero cases are accounted for above.

### Supplier, ownership and pin receipts

Supplier text was resolved afresh rather than accepted from the package report. The local content checkout reported main revision `4aeb1cc1`; the automated citation artifact's older main identifier was not used as evidence of a missing declaration. The library checkouts match `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The package remained at `06884a9` throughout. GenericDoublePointInterpolation's supplied checkout is `d1d487c8`. The roadmap service returned the current GeometryOfNumbersAndQuadraticArithmetic and ArithmeticStatisticsPartI README contracts; its one-line display wrapper is excluded from the file locators below.

| Supplier file and exact sections | Contract verified and computed interface witness |
| --- | --- |
| `Completed/EffectiveBounds/README.md:105`, Layer1; line125, Layer2 | Integral rational basis discriminant inequality and fixed-ambient primitive-polynomial count. √5 basis discriminant20≥field5; this is not the new n-sensitive exponent or an assertion that every basis has index1. |
| `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md`, §0.1.2 | Hermitian Gram–Hadamard permits dependent and empty families; Gram of rowi is1,unconjugated is−1. Empty determinant/product1. |
| Same file, §§0.2.1,0.2.6,0.3.3 | Rational intersections, adapted bases and equal primitive orthogonal covolumes require a full self-dual ambient lattice. Inℤ²,diagonal and antidiagonal covolumes√2;twice-diagonal2√2 is not primitive. |
| Same file, §1.1.2 | Zero-based tail n−i.val equals consumer's one-based n+1−i. Ordered sequence(1,2,4):product8,tail lengths3,2,1,not a zero denominator. |
| Same file, §§1.1.3–1.1.5 | Full orthonormal cube, inclusion and positive-dimensional intrinsic ball volume. Dimension2:half-side1/√2,area2≤π;dimension0 handled separately with volume1. |
| Same file, §§1.2.7,1.5.21 | One independent attaining family; explicit common Haar measure; symmetric compact convex body with0 interior for second Minkowski. L=2ℤ,body[−3,3]:minimum2/3,product-volume4=2·covolL. |
| `TauCetiRoadmap/GenericDoublePointInterpolation/README.md:241`, §0.1; line324, §0.3 | Native bounded-polynomial coordinates,count and coefficient metric. r=d=2 gives6 coordinates;2+X has squared norm5. |
| Same file, line447, §1.3; line517, §1.4 | Actual Option-indexed first jets,value projection,joint derivative on value kernel,and matrix realization. At0,d1:columns1,X giveI₂;d0 gives rank1 rather than2. |
| Same file, line1505, §5.1; line1539, §5.2; line1593, §5.3 | Selected integer maximal minor,degree≤dn(r+1),nonempty affine principal open at r,n≥1,d≥5. Integer-polynomial pullback is a separate export; arithmetic complex substitution correctly uses the pinned domain grid theorem instead. Columns1,X atonepoint:minor1;swap:−1. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:900`, §0.10 | Generic Jacobian localization is finitely presented étale over a commutative base. A[t,x]/(tx−1) is A[t,t⁻¹],not finite overA[t];overℚ,the native field theorem supplies finite factors. |
| Same file, line7336, §5.12 | General projective Bézout inequality exists. The isolated affine multiplicity consequence is separately declared, not falsely treated as an existing export. Plane X(X−1),XY has one simple isolated point plus a line:1≤4. |
| `TauCetiRoadmap/ArithmeticStatisticsPartI/README.md:1302`, §0.7, “Number fields ordered by discriminant”; line1338, neighboring count target | `NumberFieldFamily.Embedded`, `isoSetoid`, `isoFamily`, `isoDegree` all occur here with the required meanings. Nonnormal cubic:3 embedded representatives,1 class;quadratic Galois:1 and1. Automated missing-name leads for `isoFamily`/`isoDegree` are false positives for roadmap contracts, not pinned-library claims. |

The `isolated-affine-bezout` slug, supplier and §5.12 are identical in `packages/EffectiveBoundsPartII/design/plan.json` and README line82. The request is precise: r,d≥1,algebraically closed field,isolated local multiplicities despite other positive-dimensional components, and multiplicity1 at an invertible square Jacobian. It does not ask this package to rebuild intersection theory. The plan diff changes only its top-level `gaps` list. The declared gap is accepted as a contract, not raised as a defect.

The named native APIs were read with their hypotheses, including these receipts:

| Pinned file | Declarations / verified content |
| --- | --- |
| `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean:41` and line50 | `NumberField.discr_ne_zero`, `discr_eq_discr_of_algEquiv`; Field and NumberField contexts retained. |
| `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:77`, line124,line494 | `rootDiscr` is absolute integer discriminant to inverse degree; `mixedEmbedding.covolume_integerLattice` uses factor2^(−r₂); `finite_of_discr_bdd` counts finite-dimensional intermediate fields in one fixed characteristic-zero field. `abs_discr_ge` at line242 gives a lower bound already π²/4>1 at degree2, validating N_n(1)=0 for n>1. |
| `Mathlib/NumberTheory/NumberField/CanonicalEmbedding/Basic.lean:79`, line212,line637 | `canonicalEmbedding.norm_le_iff`, `mixedEmbedding.finrank`, `mixedEmbedding.latticeBasis`; supremum embedding norm and dimension n, actual integral lattice basis. |
| `Mathlib/NumberTheory/NumberField/House.lean:38`–95 | `house`, `house_eq_sup'`, `house_sum_le_sum_house`, `house_mul_le`, `house_intCast`, `one_le_house_of_isIntegral`; the last requires both integrality and nonzero. Zero has house0,so the latter cannot apply to it. |
| `Mathlib/RingTheory/MvPolynomial/Basic.lean:95`, line164,line174 | `basisRestrictSupport`, `restrictTotalDegree`, `mem_restrictTotalDegree`; degree means total degree,including degree0 of the zero polynomial. |
| `Mathlib/Algebra/MvPolynomial/Eval.lean:572`; `Mathlib/Algebra/MvPolynomial/PDeriv.lean:61` | Native `aeval`, `pderiv`; coefficient ring is commutative,with appropriate algebra structures; exponent factors survive. |
| `Mathlib/Combinatorics/Nullstellensatz.lean:62` | `eq_zero_of_eval_zero_at_prod_finset` requires an integral domain,finite variables,and degree strictly less than grid cardinality; D+1 is valid, D is not. |
| `Mathlib/RingTheory/Discriminant.lean:127`, line143 | `discr_not_zero_of_basis`, `discr_eq_det_embeddingsMatrixReindex_pow_two`; finite separable extension,algebraically closed embedding field for the latter. Number fields overℚ meet these hypotheses. |
| `Mathlib/Algebra/Module/ZLattice/Covolume.lean:115`, line170 | `covolume_eq_det_mul_measureReal`, `covolume_div_covolume_eq_relIndex'`; full discrete lattices in one finite-dimensional real inner-product space with Borel structure. Lower-rank lattices are moved to their common span. |
| `Mathlib/GroupTheory/Subgroup/Saturated.lean:62` | `AddSubmonoid.ker_saturated` has additive-group domain and additive torsion-free target; integer saturation follows from the natural version and additive inverses. |
| `Mathlib/RingTheory/Ideal/Quotient/Defs.lean:83`; `Mathlib/GroupTheory/MonoidLocalization/Away.lean:140` | `Ideal.Quotient.mk`, `Localization.Away`; actual quotient and localization at the powers of the chosen element,not an opaque algebra carrier. |
| `Mathlib/RingTheory/Etale/Field.lean:194`, line271 | Formally étale product equivalence requires `EssFiniteType`; `Algebra.Etale.iff_exists_algEquiv_prod` includes finite presentation through Etale and exports finite separable factors,with possibly empty index type. |
| `Mathlib/Data/Nat/Choose/Central.lean:36`, line78,line123; `Mathlib/Combinatorics/Enumerative/Catalan/Basic.lean:52`, line126 | `Nat.centralBinom`, `succ_mul_centralBinom_succ`, `four_pow_le_two_mul_add_one_mul_centralBinom`, `catalan`, `succ_mul_catalan_eq_centralBinom`; at r0 all baseline quantities1,at r4 central70=5·14. |
| `TauCeti/Algebra/Module/ZLattice/Covolume.lean:42` | `ZLattice.covolume_sq_eq_det_gram` for an actual ℤ-basis,full discrete lattice,finite-dimensional real inner-product space and Borel structure. Rank0 gives1²=1. |
| `TauCeti/NumberTheory/EffectiveBounds/HermiteCount/Basic.lean:172`, line202 | `ncard_setOf_finiteDimensional_abs_discr_le_le`, `hermiteCountBound`; the fixed-ambient bound is (2C+1)^(D+1)D. It supplies finiteness,not the new exact-degree exponent. |

Object searches used the roadmap search/show service, current main and Completed files, board packages, the pins, and all **48 explicitly supplied sibling folders**. The common objects resolve to the named generic owners; no duplicate fully qualified name was found. The arithmetic embedding substitution, integral evaluation kernel, transpose index, discriminant ratio, fixed-field minor and least Catalan-admissible rank are specializations not supplied by the generic contracts. Class-group relation lattices in ComputationalNumberTheory and K-theory symbol relations in ArithmeticKTheory have different targets. ArithmeticKTheory §8.6 uses the same 2dxdy convention in a congruence-lattice application; it does not introduce a second short-basis/compact-model acceptance theorem. The old `packages/EffectiveBoundsCompactModels/design/` route is explicitly identified with this Part II's scope at `packages/EffectiveBoundsPartII/design/README.md:61`, so it is not treated as an independent owner. ArithmeticStatisticsPartI §0.12's coefficient-vector count supplies the generic box fact; the ordered multivariate equation-box target is its coefficient-coordinate specialization, not a replacement polynomial carrier.

All local *Needs* edges go from a target to earlier material, with no coarse internal layer cycle. Proofs use the integer image rather than silently replacing it by𝓞_K, keep complex conjugation and the discriminant denominator, and use joint gradient surjectivity before truncation. The finite field-factor argument needs the declared isolated-point contract; the component construction itself does not. The supplier variants do not impose an incompatible integral-basis condition or a normality assumption.

Mechanical dependency output:

```text
moved: EffectiveBoundsPartII moved in the merge order from #99 to #123, right after its last supplier ArithmeticStatisticsPartI; checked as moved (the worker moves it there when it submits)
depcheck: 49 roadmaps, 558 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The reported move is permitted by the brief; no order file was edited. The original head diff changes six files, all inside `packages/EffectiveBoundsPartII/`. The only review output added there is this report. No package content, library, main checkout, Git state, pull request or issue was modified. There is no prior repair finding marked not actionable to re-raise in this first round.

## Not verifiable

- No new Lean elaboration was run because this is a read-only no-build pass. The original nine signatures were compared against the supplied elaborated-signature artifact. The two proposed repair signatures have native types and were checked mathematically and syntactically by inspection; their fresh elaboration remains for the repair worker.
- The declared isolated-affine-Bézout contract is not an implemented supplier theorem in the inspected main section. Acceptance of the counting proof is conditional on that declared contract, as required by the brief; this absence is not a finding.
- Full proofs of the supplier roadmaps were not independently reconstructed. Their current statements, hypotheses and conventions were read. No unprovided open checkout was fetched independently; ownership conclusions apply to current main, the service's indexed search, the cited suppliers and the 48 supplied sibling folders.
- The only directly cited work is COU20, available legally in the supplied cache. No text is missing, and no new references request is needed. Siegel, Martinet, Fulton and Alexander–Hirschowitz enter through supplier contracts, not as independently certified primary texts in this pass. The source extraction's erroneous strict-inequality glyphs were checked against rendered publisher pages and are not source mistakes.

## Source issues

- **Misprint** in COU20 at §3, printed p.493 (COU20 line 266): the source says the integral relation lattice is extended to the reals by tensoring over ℚ; it should be tensoring over ℤ, or rationalizing first and then tensoring over ℚ; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "06884a94331b1a80f42bf83fd1df828e001f63e0", "job": "RT-EffectiveBoundsPartII~1a", "model": "gpt-6-astra", "worker": "chris-6"} -->
