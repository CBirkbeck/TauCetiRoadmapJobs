<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1694#issuecomment-6450686900 -->
Red team round 2 pass a (codex) of 8e576bf

Verdict: needs_changes

1. **F01** (P3) The new projective-line Check does not detect omission of quasi-isomorphisms

   **Location:** `packages/SchemeKTheoryOperationsPartII/README.md:366`: “a model forgetting quasi-isomorphisms or exact sequences would not satisfy this relation.”

   **Claim:** The Euler-sequence relation distinguishes the strict K₀ presentation from the presentation imposing only degreewise exact-sequence relations.

   **Witness:** The degree-zero exact sequence O(−1) → O² → O(1) already gives [O(1)] = 2[O] − [O(−1)] in the latter presentation. No quasi-isomorphism relation is used.

   **Exact repair text:** Replace the last clause by: “This tests the exact-sequence relation. The acyclic complex [O →id O] in the preceding Check separately tests the quasi-isomorphism relation.”

   **Retest:** In the degreewise exact group, the degree-zero Euler relation is 2 − L = 2 − L, while [O →id O] has degree coordinates (1,1) ≠ 0. In strict K₀ its class is 1 − 1 = 0. The revised two tests distinguish the two relations correctly.

2. **F02** (P3) Generic theorem restatements and one duplicated Check remain

   **Location:** `packages/SchemeKTheoryOperationsPartII/README.md:254`, `:407`, `:458`, `:511`, `:760`. Example: “Pairing [𝒪_X] with [G] gives [G].”

   **Claim:** These bullets provide additional discriminating Checks.

   **Witness:** Lines 254, 407, 458 and 511 repeat the API laws at 238/243, 395, 444 and 497. Line 760 gives the same free-module instance as line 761, before the latter supplies its numerical values.

   **Exact repair text:** Delete the Check bullets at lines 254, 407, 458, 511 and 760; retain their API statements and the instantiated rank test at line 761.

   **Retest:** The retained §0.7, §1.6, §1.8, §2.2 and §4.5 blocks have respectively 4, 5, 4, 5 and 3 Checks. Their computed distinctions remain self-Tor₁≠0, h(1)=2 on dual numbers, the transverse-line pairing 1, F¹≠F² on P², and length/rank values 0,2,4.

## Round-one findings, verified individually

The identifiers below distinguish the two earlier passes. All locations in this table are in `packages/SchemeKTheoryOperationsPartII/README.md`. No finding was marked “not actionable in this package” by the repair report.

| Earlier finding | Status | Repaired passage and present witness |
|---|---|---|
| pass a F01: five generic compatibility Checks | Partly repaired | Lines 366, 404, 433, 459 and 513 replace the five generic claims by computations. The projective-line relation is “L⁻¹ = 2 − L”; the dual-number Cartan map “sends 1 = [A] to 2”; P¹ has “h ≠ 0 but h² = 0”; two P² lines give Tor₀ = O_point and positive Tor = 0; P² has “F¹K₀ = ℤh + ℤh², F²K₀ = ℤh²”. These values are correct. The added negative-control claim at 366 is false: S01. |
| pass a F02: empty closed formal subscheme | Repaired | Line 122 now says “every nonempty closed formal subscheme” and explicitly assigns empty codimension ∞. In the one-point formal surface, codim V(t)=1, codim V(p,t)=2, and codim V(1)=inf ∅=∞. |
| pass b F01: unowned locally-free/projective comparison | Repaired | Line 51 says “the comparison of locally free coherent modules with finite projective modules is §1.3 here”; lines 323–327 state and prove it using faithful flatness and finite flat ⇒ projective. ℤ_p is free, 𝔽_p is not projective, and ℤ_p×0 over ℤ_p×ℤ_p is projective with ranks (1,0), not globally free of one rank. |
| pass b F02: K×G supplied as G×G | Repaired | Lines 437–452 explicitly use “under the supported Cartan equivalence” and “the coherent dévissage” from SchemeKTheoryOperations §3.5 before §6.1's product. The supplier's supported comparison identifies perfect support with G of the support; §6.1 itself remains K×G. The transported self-divisor product has Tor Euler 1−1=0; transverse lines give 1. |
| pass b F03: unowned inverse images and flatness | Repaired | Line 201 defines the inverse-image ideal as “the image of the coherent pullback” and flatness using “every stalk map”. Line 217 proves composition, support preservation and exactness. Pulling (p) back to 𝔽_p gives a nonzero module with zero image ideal; this correctly yields the whole source. Ownership and mathematics are repaired. The two Checks at 227–228 and the finite-flat inverse-image computation at 795 jointly provide three tests. |
| pass b F04: §4.5 uses §4.3 outside its hypotheses | Repaired | Line 749 now defines χ on a neighbourhood of the finite support and says “no global dimension bound or exhaustion is assumed.” Line 762 tests an infinite-dimensional disjoint union: the n=2 component has dimension 3; χ(k,O)=1 and χ(k,O/(t₁))=1−1=0. No global dimension or §4.3 definition is required. |
| pass b F05: proper scheme cohomology attributed to the wrong supplier | Repaired | Lines 61–63 name JacobianChallenge and say “Layer C supplies”; line 670 uses its finite A-module cohomology. `TauCetiRoadmap/JacobianChallenge/README.md:143` supplies proper coherent cohomology without flatness. Its import in SchemeAndStackFoundations §2.6 is consistent. For P¹_k, H⁰(O)=k and H¹(O)=0; for A¹_k, H⁰(O)=k[t] is infinite. |
| pass b F06: repeated Check blocks | Repaired for the identified copies | The repeated blocks named in the earlier finding are removed or merged; line 698 retains “For W = P¹_k, degree [O(m)] = m + 1.” For example lines 759–762 retain one boundary/point example and one infinite-dimensional example, and lines 697–702 retain separate torsion-length, projective-line, residue-degree, empty, formal-only and negative-Euler cases. The broader duplication/restatement problem is not completely eliminated: S02 identifies the remaining bullets precisely. |
| pass b F07: two locator windows miss their claims | Repaired | Line 232 now cites “EGA-I lines 8098–8114 and 8186–8192”; lines 8186–8192 contain the base-change proposition 10.10.8. Line 587 now includes “4643–4644”; those ZHANG21 lines contain footnote 11's cokernel convention. |

## Statement and context ledger

All target locations below mean `packages/SchemeKTheoryOperationsPartII/README.md`. The file has 31 numbered target subsections; there are no separately named bold target blocks. The table treats each subsection's statement, defining conventions and API as one target group, and separately records the two definitions added in §0.6. The detailed Check ledger below supplies the remaining numerical instances.

Notation in the tables: R=ℤ_p⟦t⟧ with maximal-ideal topology, k=𝔽_p, D=k[ε]/ε², and N=k⟦x,y⟧/(xy). A displayed Z denotes a closed support, not the integers ℤ. K(f) is homological [O →f O] in degrees 1,0. Unless specified, p may be 2 or 3 as well as any other prime.

| Target and location | Required context; instances and computed values on both sides | Result/change |
|---|---|---|
| 0.1, line 85: stalk/completion comparison | A noetherian complete separated adic, open prime containing I, n≥1. For R at its closed point all three rings are R, dimension 2, and mod Iⁿ they are R/Iⁿ. For discrete k[t] at (t), all three pre-completion rings are k[t]_(t), and their maximal completions are k⟦t⟧. For p-adic ℤ_p⟨t⟩, primes (p) and (p,f) have dimensions 1 and 2 in each construction. Zero ring: no open prime, hence no purported local ring. | Flat/local/completion directions consistent. |
| 0.2, line 101: dimension, purity, codimension | Stalk dimensions, integer finite differences, infimum for codimension. R has dimension 2 despite topological dimension 0; V(t) has dimension 1 and codimension 2−1=1; V(p,t) has dimension 0 and codimension 2−0=2. Empty has dimension ⊥ and codimension ∞. Generic point of A¹ has stalk dimension 0 but every neighbourhood has dimension 1. | Empty convention repaired. |
| 0.3, line 129: regular/CM formal schemes | All stalks; noetherian affines. N has dimension=depth=1 but embedding dimension 2: CM=true, regular=false. The union of two coordinate planes has dimension 2, depth 1: CM=false. ℤ_p⟦t₁,…,t_n⟧ has dimension/depth/embedding dimension n+1 for n=0,1,2. Empty formal scheme satisfies both stalkwise predicates vacuously. | Both directions of affine equivalence survive these tests. |
| 0.4, line 157: codimension formula | CM, noetherian, nonempty support; global d−dim requires pure dimension d. In R, height(t)=1=2−1 and height(p,t)=2=2−0. In k⟦x,y,z⟧/(xz,yz), the line component has height 0 but 2−1=1; it is excluded by CM. | Hypotheses exclude the separating counterexample. |
| 0.5, line 173: regular immersions and Cartier divisors | Local regular sequences; empty immersion vacuous. t−p and t² each give a nonzerodivisor, conormal rank 1 and codimension 1. Identity uses sequence length 0 and codimension 0. N's closed point needs 2 generators but depth 1; no regular immersion. | Nonreduced Cartier divisor retained. |
| 0.6, line 199: formal support | Finite modules/coherent ideals, positive exponent; uniform exponent requires quasi-compactness. (p)² kills ℤ_p/p², no pⁿ kills ℤ_p; J=0 kills every M at n=1, J=1 kills only M=0. Extension exponents a,b give a+b; tensor/Tor exponent a+b−1 is positive, and equals 1 when a=b=1. | Topological-support wrong model rejected. |
| 0.6, line 201: inverse-image definition | Arbitrary formal morphism; use image ideal. ℤ_p→k sends (p)⊗k≅k to ideal 0, so inverse image is Spec k. ℤ_p→R sends (p²) to (p²), quotient (ℤ/p²)⟦t⟧. Identity and composition give J, then J·B·C=J·C. | Definition correct; third test already at 795. |
| 0.6, line 201: flatness definition | Every stalk map flat. ℤ_p→R is flat; ℤ_p→k sends injective multiplication by p to zero on k and is not flat. Third test (line 795), t↦s² is free rank 2; the point ideal (p,t) pulls back to (p,s²), quotient k⟦s⟧/(s²), including p=2. | Definition correct; third test already at 795. |
| 0.7, line 232: coherent Tor | Tor exists for all j; alternating class needs a uniform bound. R/(t) with itself gives Tor₀=Tor₁=ℤ_p, Euler 0; with R/(t−p) gives Tor₀=k, Tor₁=0, Euler 1. Over D, Tor_j(k,k)=k for every j, so no finite alternating class. Unit input gives Tor₀=G, Tor_{>0}=0. | Ambient ring and amplitude conditions essential. |
| 1.1, line 270: coherent K′₀ | Noetherian coherent abelian category, fixed essential-smallness universe. G₀(ℤ_p)=ℤ by rank, [k]=0; G₀(N)=ℤ², [N]=(1,1), [k]=0; G₀(k)=ℤ by dimension; empty group 0. | Uses supplied AbelianK0, no duplicate quotient. |
| 1.2, line 297: coherent dévissage | Ideal-power-supported coherent modules; finite filtration on each object. [ℤ_p/pⁿ] maps to n[k], n=0,1,2 gives 0,1,2. [D] maps to 2[k], whereas naive reduction yields 1[k]. Empty support gives 0→0. | Inverse is filtration class, not restriction. |
| 1.3, line 313: strict supported complexes and projectives | Bounded global finite locally free terms, homology supported. K(p) has H₀=k,H₁=0; K(0) has two non-torsion homology modules, hence lacks V(p)-support; K(1) is acyclic. Pullback K(p) to k has both H₀,H₁=k. Over ℤ_p×ℤ_p, ℤ_p×0 has ranks (1,0) and is projective but not free of one rank. | New comparison correctly owned here. |
| 1.4, line 343: strict K₀ | Degreewise exact and quasi-isomorphism relations, no sorry data. K(p) has supported class 1, full-support class 1−1=0; K(1) is 0; shift takes 1 to −1. On P¹, L⁻¹=2−L. That relation already holds in the degreewise exact group. | Formula true; negative-control assertion false: S01. |
| 1.5, line 370: affine transport | Noetherian adic A; projective/strict and coherent transport; filtration comparison additionally regular finite-dimensional. K(p,t) is generator 1 in both supported groups ℤ; J=1 gives 0=0; A=k,J=0 gives ℤ=ℤ. | Formal versus scheme carrier distinguished; uses parent. |
| 1.6, line 386: homology class | h_Y via dévissage, no unconditional isomorphism. h(K(p))=1, h(K(p)[1])=−1; h_D:ℤ→ℤ sends 1→2; h_N sends r→(r,r), misses (1,0); empty 0→0. | Correct; one generic Check removed by S02. |
| 1.7, line 412: cup product | Bounded strict complexes; support intersection. K(t)K(t−p) gives 1; K(t)² gives 1−1=0. Swapping degree-one factors multiplies by −1; over characteristic 2 this is +1. On P¹, h=1−L is nonzero but h²=0 and L(2−L)=1. | Sign, unit and underived wrong model distinguished. |
| 1.8, line 437: coherent Tor pairing | Regular noetherian finite-dimensional ambient; no global resolution property needed for this pairing. Transverse P² lines give Tor Euler 1; a self-divisor gives 0; free rank 2 input gives 2[k]. Triple K(p) tensor has homology ranks 1,2,1 and Euler 1−2+1=0 under either bracketing. | Transport from parent K×G now justified by supported comparison. |
| 2.1, line 474: regular supported comparison | Regular finite-dimensional plus resolution property, including neighbourhood version. Supported point in R gives ℤ→ℤ, 1→1; field gives ℤ→ℤ; empty 0→0. Without regularity h_N is diagonal ℤ→ℤ² and not surjective. | No missing generality found. |
| 2.2, line 490: two filtrations | Integer indices, finite sums of images, ambient codimension. In R on V(p,t), F²=ℤ,F³=0; on V(t), F¹=ℤ,F²=0. On P², F¹=ℤh+ℤh²,F²=ℤh²,F³=0; conic class 2h−h². Over k: F⁰=F₀=ℤ, F¹=F₋₁=0. | Sign of coefficients unrestricted; no natural-subtraction junk. S02. |
| 2.3, line 518: filtration comparison | Regular pure finite dimension d and resolution property. R, support V(t), d=2: i=1 gives F¹↔F₁=ℤ; i=0 gives F²↔F₀=0. Field d=0 gives graded ℤ in degree 0. At i=d+1, F⁻¹ and F_{d+1} are both full. | Integer-index convention consistent. |
| 2.4, line 534: rational affine multiplicativity | Affine regular noetherian finite dimension, rational coefficients. In ℤ_p⟦t,u⟧, K(t,u) has codimension-2 support. K(t,tu)≅K(t,0) has equal homology classes and Euler 0 despite support codimension 1. Field: ℚ·ℚ=ℚ at index 0, positive filtration 0. | Correctly imports scheme theorem; no non-affine extension claimed. |
| 2.5, line 550: exhaustion groups | Small directed noetherian opens; bounds memberwise; stabilisation requires regular/RP members and quasi-compact support. Finite unions give ℤ^N with projection maps, inverse limit ∏ℕℤ containing (1,1,…), absent from ⊕ℕℤ. A single component support stabilises to ℤ. | Gr is quotient of limit filtrations, not a claimed exchange of limit and quotient. |
| 3.1, line 587: closed-union cokernels | Scheme-theoretic J₁∩J₂=0; local case is limit of cokernels only. N's overlap ℤ maps by 0 to both branch groups ℤ; both displayed sides are ℤ². Two disjoint fields give ℤ⊕ℤ; X₁=X₂=X gives three zero cokernels. | No injectivity or inverse-limit exactness assumed. |
| 3.2, line 603: expected-dimension Tor vanishing | Regular immersion, CM second input, stalkwise expected codimension. Transverse t,t−p gives 2=1+1 and positive Tor=0. Self t gives 1≠1+1 and Tor₁=ℤ_p. The non-CM two-plane example has underived length 3, Tor₁ length 1, Euler 2, detecting CM. | Hypotheses exclude both counterexamples. |
| 3.3, line 619: componentwise Tor | Same regular-immersion/CM hypotheses, expected Y, formal union Y∪Y′. Y′=∅ with transverse divisors gives Tor_{>0}=0, [O_Y]=1. In ℤ_p⟦s,t⟧ the two formal lines have identical point spaces but overlap quotient k, whereas each line has ring ℤ_p. V(xy,xz) has two generators, height 1, so is excluded. | Localisation must use coordinate/stalk primes; consumer geometry separately limited below. |
| 3.4, line 636: Cartier pullback | Cartier on source; ordinary pulled-back quotient only when pulled section remains a nonzerodivisor. Identity on R,t gives Tor₀=ℤ_p,Tor₁=0. Pulling to V(t) gives zero differential and Tor₁=O_D(−D); pulling t along V(p) remains regular and gives k. | Flatness sufficient, not asserted necessary. |
| 4.1, line 664: proper scheme support | Scheme W quasi-compact; proper coherent conclusions require properness. P¹_k factors at n=1 with H⁰=k,H¹=0; Spec A/ϖ³ factors at n=3. A¹_k factors too but H⁰=k[t] has infinite length; Spf A is not a scheme and H⁰=A has infinite length. | Repaired supplier and hypotheses hold. |
| 4.2, line 680: Euler degree | Proper scheme over complete DVR, length finite before integer sum. Spec A/ϖⁿ gives n (0,1,2 included); P¹_k,O(m) gives max(m+1,0)−max(−m−1,0)=m+1. m=−2 gives −1, unlike line-bundle degree −2. Degree-f residue point gives f. | No division or hidden nonzero denominator. |
| 4.3, line 706: Euler intersection pairing | Actual intersection modules have annihilator containing sum of ideals; common support a proper scheme; ambient cohomology requires A-structure. t,t−pⁿ gives length n; n=0 is disjoint and gives 0. Point against t gives 1−1=0; self t has formal infinite-length support and is excluded. | Actual O_W-modules distinguished from merely power-annihilated modules. |
| 4.4, line 733: pushforward and DVR base change | Proper pushforward; finite DVR restriction factor f; flat local DVR extension factor e. Ramified quadratic e=2,f=1: base change residue class has length 2, restriction residue class length 1. Unramified degree 2: base-change length 1, restriction length 2. t↦s² in characteristic 2 still gives e=2. | Ramification/residue factors not reversed; infinite residue extension allowed for base change. |
| 4.5, line 749: length times rank | Regular locally noetherian, finite point support with finite residue degrees; finite bound only near that support. length(F)=1,f=2,r=0,1,2 gives 0,2,4. For G=O/(t), rank 0, Tor Euler 1−1=0. Infinite-dimensional disjoint union at n=2 has local bound 3 and same values. | New definition repairs scope mismatch; S02 removes duplicate test. |
| 4.6, line 766: Cartier pairing/curve degree | Cartier two-term resolution; F formally supported on proper scheme; curve specialisation ϖF=0. Normal line O(a) along special-fibre P¹ gives χ(O)−χ(O(−a))=1−(1−a)=a, including a=−1,0,1. Node ambient with Cartier p and point F gives 1−1=0. | Does not require ambient regularity or curve reducedness. |
| 4.7, line 784: proper coherent transfer/projection | Adic proper finite-type morphism of noetherian formal schemes; projection with regular finite-dimensional ambients and locally perfect input. Identity gives identical class; t↦s² pushes quotient k⟦s⟧/(s²) with length 2, including char 2. Spf k⟦t⟧→Spec k is non-adic and excluded although reductions are proper. | Conditional on the declared direct-image gap; no new gap finding. |

### Suggested.lean declarations and headlines

`packages/SchemeKTheoryOperationsPartII/Suggested.lean` was read in full: 44 lines, one `import Mathlib`, one module docstring, one empty namespace, **zero declarations**. Thus the declaration/context table has no declaration rows: there are zero section variables, instances, binders, sorry'd data, theorem placeholders, padding declarations and fully qualified declaration collisions. There is no declaration for which `#check @name` could be generated. No Lean process was run.

The README headline inventory, compared individually with docstring lines 14–37, is: formal stalk/completion and codimension comparisons; coherent dévissage and affine transport; regular supported comparison; comparison of the two filtrations; rational affine filtration multiplicativity; closed-union decomposition; expected-dimension Tor vanishing; componentwise Tor vanishing; Cartier pullback; Euler pairing and base change; length-times-rank; Cartier/curve degree; proper pushforward and projection. All 13 groups are explicitly named as not statable. The missing native carriers are formal schemes/coherent categories, their strict supported groups and operations, and formal coherent direct images—not arithmetic identities on free variables. Searches of both pinned trees found no formal-scheme carrier. The existing categorical K₀, module Tor and module projectives do not supply those carriers. No missing statable headline or stand-in was found.

### Check ledger

Each row is one of the 130 README Check bullets, indexed by its line in `packages/SchemeKTheoryOperationsPartII/README.md`. “Equal” records equality of the computed values, not a proof by assertion. Boundary examples supplement, rather than replace, the general statements. Lines marked S01/S02 have the defect stated above; line 630 is source-verified but lacks an independent numerical special-cycle instance.

| Line | Instance; computed left and right values | Result/change |
|---|---|---|
| 95 | R, closed point: A_m=O_x=completed localisation=R, dimensions 2=2=2. | Equal. |
| 96 | p-adic ℤ_p⟨t⟩: at (p), dimension 1=1=1; at (p,t), height and stalk dimension 2=2. | Equal; topology matters. |
| 97 | k[t], I=0: I-completion of local ring=k[t]_(t); maximal completion=k⟦t⟧, distinct rings. | Wrong completion rejected. |
| 120 | R: chain (0)⊂(p)⊂(p,t) has length 2; dim=2. | Equal. |
| 121 | Ideals (t),(t−p),(p,t),(t(t−p)): quotient dimensions 1,1,0,1; differences 1,1,2,1. | Equal. |
| 122 | One-point space: topological dimension 0, formal dimension 2; nonempty codimensions 1,2; empty infimum ∞. | Empty repair correct. |
| 123 | A¹_k: generic stalk dimension 0, closed stalk dimensions 1, supremum 1=scheme dimension. | Equal. |
| 124 | Empty point set: sup ∅=⊥; inf ∅=∞; there is no stalk subtraction. | Defined endpoints. |
| 125 | Generic η in A¹: O_η=k(t), dimension 0; every nonempty neighbourhood has dimension 1. | Distinct notions. |
| 149 | R: maximal ideal (p,t), two parameters, dimension 2; regular=true. | Equal embedding/Krull dimensions. |
| 150 | N: dimension 1, depth 1, embedding dimension 2. | CM=true, regular=false. |
| 151 | Two planes meeting at point: exact sequence to k gives depth 1; both components dimension 2. | CM=false. |
| 152 | Aⁿ over ℤ_p, n=0,1,2: closed maximal ideals have n+1 parameters and dimension n+1=1,2,3. | Regular in each case. |
| 153 | Formal power series n=0,1,2: dimension=embedding dimension=1,2,3; smooth p-adic affine line has local dimensions 1 or 2, equal embedding dimensions. | Completion retains regularity. |
| 167 | R/V(t) has dimension 1; R/V(p,t) dimension 0: 2−1=1 and 2−0=2. | Equal. |
| 168 | Plane-plus-line ring, line component: minimal prime height 0; closed-stalk dimension difference 2−1=1. | CM omission refuted, correctly excluded. |
| 169 | X=Spf ℤ_p: codim(X,X)=1−1=0; empty codim=∞. | Correct domain of finite formula. |
| 192 | R/(t−p)=ℤ_p, kernel a nonzerodivisor, conormal rank 1. | Cartier=true, dimension 1. |
| 193 | R/(t²) contains nonzero t with t²=0; t² is nonzerodivisor in R. | Cartier=true, reduced=false. |
| 194 | Identity on R: regular sequence length 0, quotient R≠0, codimension 0; empty immersion has no source stalk. | Correct degenerate cases. |
| 195 | N maximal ideal needs 2 generators; maximum regular-sequence length is depth 1. | Immersion not regular. |
| 223 | ℤ_p,J=(p),n=0,1,2: quotients 0,k,ℤ/p²; killed by Jⁿ; positive supporting exponents for last two 1,2. | Boundary handled. |
| 224 | ℤ_p: pⁿ·1≠0 for every n; both formal spaces have one point. | Formal support false, topological support true. |
| 225 | M=ℤ_p: 0¹M=0, 1ⁿM=M≠0; M=0 is killed by both. | Correct zero/unit-ideal convention. |
| 226 | Spec k[t], M=k[t]/t², Y=V(t): t²M=0 and support={(t)}; M=k[t] has no annihilating t-power and full support. | Both directions distinguished. |
| 227 | ℤ_p→R, J=(p²): inverse ideal (p²), quotient (ℤ/p²)⟦t⟧; p is nonzero nilpotent there. Base change is flat. | Correct; third definition test is at 795. |
| 228 | (p)⊗k=k but image ideal=0; inverse-image quotient k/0=k; multiplication p pulls back to 0:k→k. | Flat=false; third test at 795. |
| 252 | Resolution K(t) tensored with R/t has zero differential: Tor₁=R/t=ℤ_p. | Equal. |
| 253 | K(t) on R/(t−p)=ℤ_p becomes multiplication p: kernel 0, cokernel k. | Tor₁=0,Tor₀=k. |
| 254 | X=Spf ℤ_p,G=k: Tor₀=k, Tor₁=0 (same generic unit law as API). | S02: delete generic Check. |
| 255 | Tor over ℤ_p: kernel of zero on k is k; Tor over k: k is free, positive Tor=0. | Ambient versus reduction distinguished. |
| 256 | D with alternating multiplication ε resolution: after tensor k all maps 0; Tor_j=k at j=0,1,2 and every j. | No finite Euler sum. |
| 289 | Exact sequence with multiplication p on ℤ_p yields [k]=1−1=0; rank generator [ℤ_p]=1. | G₀=ℤ. |
| 290 | N: branch modules have rank vectors (1,0),(0,1); [N]=(1,1); branch parameter gives [k]=0. | G₀=ℤ². |
| 291 | Empty coherent category has only 0; its group is 0. | Equal. |
| 292 | k-vector spaces dimensions 0,1,2 give classes 0,1,2 on Spec k=Spf k. | Equal marked groups. |
| 293 | Thickening generator [k]=1 by length maps to rank 0 in G₀(ℤ_p); homomorphism ℤ→ℤ is zero. | Abstract isomorphism insufficient. |
| 307 | n=0,1,2: lengths of ℤ/pⁿ are 0,1,2; dévissage gives 0[k],1[k],2[k]. | Equal. |
| 308 | D has filtration 0⊂(ε)⊂D, quotients k,k: class 2; D⊗_D k=k: class 1. | Restriction is not inverse dévissage. |
| 309 | Unit ideal annihilates only zero module; supported group 0. | Equal. |
| 333 | K(p) over ℤ_p: H₀=k,H₁=0, killed by p. | Member=true. |
| 334 | K(0): H₀=H₁=ℤ_p, no p-power kills either. | Member=false. |
| 335 | K(1): H₀=H₁=0, empty support; K(0): two nonzero homologies. | True/false distinction. |
| 336 | Pullback to R: multiplication p still injective, H₀=𝔽_p⟦t⟧, pH₀=0. | Support preserved. |
| 337 | Pullback to k: differential 0, H₀=H₁=k, Euler 1−1=0. | Strict full-support membership preserved without flatness. |
| 338 | ℤ_p is free rank 1; Tor₁^ℤ_p(k,k)=k excludes flatness/projectivity of k. | Both directions distinguished. |
| 339 | M=ℤ_p×0 over product ring: local ranks (1,0); direct summand projector diag(1,0). | Projective=true, constant-rank free=false. |
| 362 | Acyclic bounded complex has quasi-isomorphism to 0; its group class 0. | Empty support group 0. |
| 363 | A=D, strict full support: termwise free ranks; K(ε) has alternating rank 1−1=0, while A[0] has rank 1. | K₀=ℤ despite singularity. |
| 364 | K(p): H₀=k,H₁=0, supported homology class 1≠0. | Nonzero strict class detected. |
| 365 | Degreewise exact group over k records (1,1); quasi-isomorphism quotient records 1−1=0. | Detects missing quasi-isomorphism relation. |
| 366 | Euler sequence degree zero gives [O(1)]=2−L in either exact presentation; L(2−L)=1 in K₀. | Formula true, proposed rejection false: S01. |
| 380 | R,J=(p,t): Koszul homology only H₀=k; both supported groups ℤ, marked generator 1. | Equal. |
| 381 | J=A: both groups 0; A=k,J=0: both groups ℤ with [k]=1. | Equal. |
| 382 | k⟦t⟧: supported K(t) class 1; full-support alternating free rank 1−1=0. | Comparison respects support map. |
| 403 | K(p) homology class [k]=1 in G₀(k). | Equal. |
| 404 | D: source [D]=1 by free rank; target [D]=2[k]. | h is multiplication 2. |
| 405 | N: source rank r maps (r,r); equation (r,r)=(1,0) has no solution. | Not surjective. |
| 406 | Y=empty: h:0→0. | Equal. |
| 407 | Sequence (p,t) on R: only homology k, class 1=[R/(p,t)]. | S02: delete generic API restatement. |
| 408 | K(p)[1]: unique nonzero homology k in degree 1, class −1 versus original +1. | Sign fixed. |
| 430 | K(t)⊗K(t−p): H₀=k,H_{>0}=0, Euler 1. | Equal. |
| 431 | K(t)²: H₀=H₁=ℤ_p, Euler 0; tensor of H₀'s alone has class 1. | Derived versus underived distinguished. |
| 432 | Unit⊗K(p) gives class 1; zero⊗K(p) gives 0; swapping two degree-one basis vectors gives −1, or +1 in char 2. | Unit, zero and sign fixed. |
| 433 | P¹: K₀=ℤ[h]/h², h≠0,h²=0; (1+h)(1−h)=1. | Zero product and uncorrected inverse rejected. |
| 456 | Transverse formal divisors: Tor₀=k,Tor₁=0, Euler 1. | Equal. |
| 457 | Self-divisor: Tor₀=Tor₁=ℤ_p, Euler 0, while [O_D]=1. | Trivial normal bundle self-intersection. |
| 458 | X=Spf ℤ_p,G=k: pairing unit with k gives 1. | S02: delete generic API restatement. |
| 459 | P² two lines: restriction of x to other line nonzero, Tor₁=0, Tor₀=k at P; parent and formal values 1=1. | Repaired comparison test. |
| 460 | Free rank 2 against k: Tor₀=k², higher Tor=0, class 2. | Zero pairing excluded. |
| 484 | R, point support: Koszul(p,t) class 1 maps to [k]=1; both groups ℤ. | Equal. |
| 485 | N: h(r)=(r,r); (1,0) absent from image. | Nonregular comparison fails as intended. |
| 486 | Empty: 0→0; field full support: ℤ→ℤ sends 1→1. | Equal. |
| 509 | R, point support: F²=ℤ, F³=0. | Distinct filtration steps. |
| 510 | R,V(t): K(t) maps to generic rank 1; F² generated by finite-length classes maps to 0. | Gr¹ class 1≠0. |
| 511 | Field d=0: F⁰=ℤ,F¹=0; empty support both 0. | S02: generic endpoints restate API and are tested at 514. |
| 512 | Topological codimension on R gives point class codimension 0, hence F²=0; stalk codimension 2 gives F²=ℤ. | Wrong filtration rejected. |
| 513 | P²: h²≠0,h³=0; degrees e=0,1,2 give curve classes 0,h,2h−h²; F²=ℤh² excludes h. | Three integral values, including char 2. |
| 514 | Field: (F⁰,F¹,F₀,F₋₁)=(ℤ,0,ℤ,0); empty all 0. | Boundary conventions instantiated. |
| 528 | R,V(t),d=2: i=1 gives ℤ=ℤ; i=0 gives 0=0 because [k]=0 in G₀(ℤ_p). | Equal filtrations. |
| 529 | Field,d=0: degree-0 graded groups ℤ=ℤ; i=−1 gives F¹=0=F₋₁. | Equal. |
| 530 | Field,d=0,i=1: d−i=−1, F⁻¹=ℤ=F₁. | Integer negative index retained. |
| 544 | In ℤ_p⟦t,u⟧, K(t,tu)≅K(t,0); H₀ and H₁ both R/(t), Euler 0∈F². | Excess intersection compatible. |
| 545 | K(t,u): H₀=ℤ_p,H_{>0}=0; support codimension 3−1=2. | Class belongs to F². |
| 546 | Field rational filtration: F⁰=ℚ,F¹=0; a=b=0 gives ℚ·ℚ=ℚ, a=1 gives 0·ℚ=0. | Equal bounds. |
| 569 | X=Spec k,Y=X, one-member limit ℤ; its projection is identity on 1. | Boundary limit computation. |
| 570 | Finite-union groups ℤ^N, forgetting last coordinates; limit ∏ℕℤ includes (1,1,…), direct sum excludes it. | Limit direction fixed. |
| 571 | Swap components 0 and 1: (a₀,a₁,a₂,…) ↦ (a₁,a₀,a₂,…); the labelled component projections retain values a_n. | Canonical marked comparison. |
| 572 | Open exhaustion of Spf ℤ_p: [k]=0; closed-thickening system: [k]=1 at every stage. | Marked constructions differ. |
| 573 | Support component 0: system ℤ with identity maps, limit ℤ; classes on other components forced 0. | Stabilised support differs from ∏ℕℤ. |
| 597 | Node: overlap ℤ→ℤ² is 0; branch overlap maps also 0; cokernels ℤ² and ℤ⊕ℤ. | Equal; maps not injective. |
| 598 | X=Spec k ⊔ Spec k: overlap group 0; both sides ℤ², object (k,0) maps (1,0). | Additivity instantiated. |
| 599 | X₁=X₂=Spec k: each overlap map identity ℤ→ℤ; all cokernels 0, image (0,0). | Equal. |
| 613 | t,t−p on R: codimension 2=1+1; multiplication p on ℤ_p has kernel 0. | Positive Tor vanishes. |
| 614 | Two-plane ring, regular pair x−z,y−w: Tor₀ length 3, Tor₁ length 1, Tor₂=0; Euler 3−1=2. | Non-CM counterexample excluded. |
| 615 | Self t: codimension 1≠2; Tor₁=ℤ_p≠0. | Expected dimension necessary. |
| 629 | Take Y=Spec k from transverse t,t−p and Y′=empty: positive Tor=0, overlap group 0, quotient class [O_Y]=1. | Boundary reduction instantiated. |
| 630 | LIZHANG22 lines 965–974 identify horizontal component of derived class with [O_horizontal]. No numerical special-cycle instance computed independently. | Source-verified only; limitation below. |
| 631 | Ideals (s,t)+(s,t−p)=(s,t,p); quotient k versus individual quotients ℤ_p; all topological spaces are points. | Formal overlap distinguished. |
| 632 | Ideal (xy,xz): height 1 (component x=0), minimal number of generators 2; regular sequence cannot have both lengths. | Excluded nonregular immersion. |
| 648 | D=V(t) in R: pulled differential zero, H₀=H₁=ℤ_p; Euler 1−1=0. Nontrivial line twist kept in general formula. | Need pulled-section hypothesis. |
| 649 | Identity map on R: t is nonzerodivisor, H₁=0,H₀=ℤ_p. | Cartier pullback class 1. |
| 650 | Nonflat V(p)→Spf R: t nonzerodivisor on k⟦t⟧, H₀=k,H₁=0. | Cartier preservation without flatness. |
| 674 | P¹_k: factor n=1,H⁰=k,H¹=0; Spec ℤ/p³: p³=0 but p²≠0, least n=3. | Finite thickening computed. |
| 675 | Spf ℤ_p: infinitely long chain (pⁿ), so length(ℤ_p)=∞; not an ordinary scheme. | Hypothesis distinction. |
| 676 | A¹_k: H⁰=k[t] has independent 1,t,t²,…, length ∞; factors at n=1 but not proper. | Properness needed. |
| 697 | A/ϖⁿ for n=0,1,2: composition lengths 0,1,2; higher cohomology zero, degree n. | Equal. |
| 698 | P¹,O(m): m=−2,−1,0,1 gives Euler −1,0,1,2=m+1. | Cohomological sign checked. |
| 699 | Degree-f point: A-module composition factors f copies of k, Euler f. f=1,2 gives 1,2. | Residue factor fixed. |
| 700 | Empty scheme: every H^i=0, sum 0. | Equal. |
| 701 | Spf A: H⁰=A has length ∞; finite Euler degree is not defined. | Formal support excluded. |
| 702 | O(−2): H⁰=0,H¹=k; Euler −1, line-bundle degree −2. | Two degree notions distinguished. |
| 725 | t,t−pⁿ: n=0 unit quotient 0; n=1 quotient k; n=2 quotient ℤ/p²; degrees 0,1,2. | Equal to n. |
| 726 | Koszul(t) on k: differential 0, Tor₀=Tor₁=k; Euler 1−1=0. | Higher Tor retained. |
| 727 | F=k,G=O: Tor₀=k, higher Tor 0; pairing and degree both 1. | Instantiated unit. |
| 728 | Self t: Tor₀=Tor₁=ℤ_p, each length ∞; expression ∞−∞ not an integer degree. | Undefined case excluded. |
| 729 | A/ϖ²: ϖ acts nontrivially, so not a k-module; two-step filtration gives degree 2. | Wrong carrier rejected. |
| 743 | A′ with ϖ=(ϖ′)²: quotient A′/ϖ has successive layers k′,k′, degree 2=2·1. | Base-change factor e. |
| 744 | Unramified quadratic: length_A(k′)=2, length_A′(k′)=1. | Restriction factor f=2. |
| 745 | Completed maximal unramified extension: uniformiser unchanged, length_A′(A′/ϖ)=1; residue field infinite over k, restriction not finite. | Correct distinct domains. |
| 759 | Point F=k on R: G=R/t rank 0 gives 1−1=0; G=R rank 1 gives 1. | Rank dependence. |
| 760 | F=k(x),r=2,f=2: Tor₀ has A-length 4, higher Tor 0, rf=4. | S02: duplicated by 761. |
| 761 | r=0,1,2,f=2: Euler lengths 0,2,4 and products rf=0,2,4. | Rank-zero case included. |
| 762 | n=2 component has dimension 3; G=O gives χ=1; G=O/t₁ gives Tor₀=Tor₁=k and χ=0. | No global bound needed. |
| 778 | Transverse r rational points: Tor₀=⊕_r k,Tor₁=0; r=0,1,2 yields degrees 0,1,2. | Equal. |
| 779 | Normal O(a),a=−1,0,1: χ(O)=1, χ(O(−a))=2,1,0; differences −1,0,1=a. | Self-intersection sign fixed. |
| 780 | Singular ℤ_p⟦x,y⟧/(xy),Cartier p,F=k: pulled differential 0, two copies k, Euler 0. | Perfect input suffices. |
| 794 | Identity, point class k: p_*[k]=[k], Lp*[k]=[k]; both degrees 1. | Identity formula instantiated. |
| 795 | t↦s²: pulled point k⟦s⟧/(s²) has basis 1,s, length 2; pushforward degree 2. | Includes p=2 inseparable case. |
| 796 | Spf k⟦t⟧→Spec k: reduced map point→point proper; H⁰=k⟦t⟧ infinite-dimensional; pullback of zero definition ideal is zero, not open. | Non-adic counterexample excluded. |

## Verified sound

Read all **820 README lines**, **44 Suggested.lean lines**, **31 target groups**, all APIs/proof routes and **130 Check bullets**. There are **0 Lean declarations** and **13 explicitly deferred headline groups**. The two prior reviews contribute **9 findings**, verified individually above: eight repaired (including b-F06 for its identified duplicate copies), and one partly repaired (a-F01). Additional instances of b-F06’s general defect are recorded separately. The Check ledger contains **129 computed rows and one source-only consumer-pattern row**. It does not count the latter as an independently computed mathematical test.

Verified **39 source-locator groups** in **5 works**, using **8 cached extractions** (the Stacks work has four chapter extractions). Verified **9 supplier-roadmap contracts**, resolving the referenced sections and named targets against the supplied main checkout or the current new-roadmap head. Verified **28 explicitly cited pinned declarations**, plus the two pinned local-projectivity/flat-descent inputs used in the repair proof. No new source was needed. All five works have one manifest key each; the Li–Zhang entry expressly cites arXiv v3 numbering, and Zhang uses published pagination.

### Source-locator ledger

These are locators and descriptions in the reviewer's words, not copied source text. Stacks line numbers are relative to the chapter extraction named in the row.

| # | Source and locator | Text window read; supported content |
|---|---|---|
| 1 | EGA-I, Ch. 0, 7.6.15–7.6.18, pp. 74–75 | EGA-I lines 2849–2892: localisations, flatness and local rings used in §0.1. |
| 2 | EGA-I, I.10.1.5–10.1.6, p. 182 | EGA-I lines 7294–7299: formal stalk as colimit; local/noetherian conclusions. |
| 3 | EGA-I, I.10.10.2, p. 201 | EGA-I lines 8098–8114: association, exactness and tensor comparison. |
| 4 | EGA-I, I.10.10.5, pp. 202–203 | EGA-I lines 8138–8177: finite-module/coherent equivalence. |
| 5 | EGA-I, I.10.10.8, p. 203 | EGA-I lines 8186–8192: pullback/base-change comparison; corrected locator. |
| 6 | EGA-I, I.10.10.9, p. 203 | EGA-I lines 8193–8199: image of pulled-back ideal is the extended ideal. |
| 7 | EGA-III1, 3.4.1, p. 119 | EGA-III1 lines 4444–4464: adic finite-type proper formal morphisms. |
| 8 | EGA-III1, 3.4.2–3.4.3, pp. 119–120 | EGA-III1 lines 4471–4494: coherent higher direct images and their reduction/limit comparison. |
| 9 | EGA-III1, 3.4.4, p. 120 | EGA-III1 lines 4497–4507: affine-target coherent cohomology and inverse limits. |
| 10 | STACKS, algebra, 0BBZ | STACKS lines 6757–6768: height bound by number of equations. |
| 11 | STACKS, algebra, 00KW | STACKS lines 6769–6776: dimension drop by nonzerodivisor. |
| 12 | STACKS, algebra, 00L6 | STACKS lines 6891–6900: finite-module support and power annihilation. |
| 13 | STACKS, algebra, 00M0 | STACKS lines 8230–8245: Tor long exact sequence. |
| 14 | STACKS, algebra, 00M3 | STACKS lines 8393–8411: symmetry of Tor. |
| 15 | STACKS, algebra, 05GI | STACKS lines 10601–10618: completion ideal in the Jacobson radical. |
| 16 | STACKS, algebra, 02JN | STACKS lines 11776–11781: expected dimension and CM regular sequences. |
| 17 | STACKS, algebra, 00NA | STACKS lines 11785–11792: CM dimension formula and localisation. |
| 18 | STACKS, algebra, 00NP | STACKS lines 11920–11933: regular local rings, domains and regular quotients. |
| 19 | STACKS, algebra, 00O7 | STACKS lines 12478–12503: regular-ring homological dimension. |
| 20 | STACKS, algebra, 0AFS | STACKS lines 12566–12578: regularity/global-dimension characterisation. |
| 21 | STACKS, more-algebra, 062F | STACKS lines 3571–3586: regular sequences imply Koszul regularity. |
| 22 | STACKS, more-algebra, 07NV | STACKS lines 5216–5223: completion preserves local dimension. |
| 23 | STACKS, more-algebra, 07NX | STACKS lines 5224–5228: CM and completion. |
| 24 | STACKS, more-algebra, 07NY | STACKS lines 5229–5237: regularity and completion. |
| 25 | STACKS, coherent, 02KH | STACKS lines 478–491: flat cohomology base change, with qcqs hypotheses. |
| 26 | STACKS, varieties, 0AYR | STACKS lines 4401–4409: degree by Euler difference on proper dimension-at-most-one schemes. |
| 27 | STACKS, varieties, 0AYX | STACKS lines 4509–4513: tensor and dual degree formulas. |
| 28 | ZHANG21, Lemma 4.4, pp. 888–889 | ZHANG21 lines 1053–1104: expected-dimension/Koszul consumer application. |
| 29 | ZHANG21, Proposition 5.2 and Remark 5.3, pp. 896–898 | ZHANG21 lines 1398–1462: numerical intersection and alternative proof route. |
| 30 | ZHANG21, Appendix B.1, pp. 971–972 | ZHANG21 lines 4511–4544: formal support, strict groups and support filtrations; source issues below. |
| 31 | ZHANG21, (B.3), p. 972 | ZHANG21 lines 4545–4560: scheme multiplicativity and expressly unproved general formal extension. |
| 32 | ZHANG21, Appendix B.1, p. 973 | ZHANG21 lines 4563–4603: exhaustion and proper-support Euler characteristic. |
| 33 | ZHANG21, Lemmas B.1–B.2 and footnote 11, pp. 974–975 | ZHANG21 lines 4607–4680, including 4643–4644: union cokernels and two expected-dimension statements. |
| 34 | LIZHANG22, arXiv v3 §1.8, p. 9 | LIZHANG22 lines 336–372: conventions, numerical vanishing and formal pushforward; source error below. |
| 35 | LIZHANG22, arXiv v3 Definitions 2.4.1–2.4.2, p. 11 | LIZHANG22 lines 434–445: derived-cycle consumer definitions. |
| 36 | LIZHANG22, arXiv v3 Definition 5.2.1, p. 24 | LIZHANG22 lines 961–986: horizontal/vertical class and expected component; cross-reference misprint below. |
| 37 | LIZHANG22, arXiv v3 Remark 6.4.11, p. 43 | LIZHANG22 lines 1811–1814: scheme use of filtration multiplicativity. |
| 38 | LIZHANG22, arXiv v3 Lemma 10.4.2, p. 67 | LIZHANG22 lines 2942–2951: Cartier pullback in the stated application. |
| 39 | LIZHANG22, arXiv v3 proof of Theorem 10.5.1, p. 71 | LIZHANG22 lines 3108–3133: finite-flat degree/projection application, not an unconditional abstract projection theorem. |

### Supplier and ownership ledger

The supplied main checkout is at d2e0f0d. Revised versions of existing roadmaps in open work were not substituted for main. The new SchemeKTheoryOperations and GeneralAlgebraicKTheory roadmaps were read at their open heads (b1e77b8 and f16a788 respectively). File references in this table are `TauCetiRoadmap/<name>/README.md`.

| Supplier | Sections/targets resolved and witness locations | Boundary verified |
|---|---|---|
| AdicSpacesPartII | R0.1a at 624; R0.1b at 727 | Complete/separated adic rings and noetherian completion; formal geometry belongs to Part III. |
| AdicSpacesPartIII | F0.1 completed-localization at 729; F0.2 spf-morphism-correspondence at 1211; F0.3 carrier/ideal/gluing targets from 1310; F0.4 proper and closed immersions at 2291,2352; F0.6 associated-formal-module at 2791, affine-coherent-equivalence at 2833, coherent-as-inverse-system at 2873, formal-direct-image-comparison at 3206; F0.8 coherent-formal-module-properties at 3815 | Association already has affine tensor/ideal-image formulas; this package glues the global inverse-image adapter. Proper algebraic-completion comparison does not supply arbitrary proper formal direct images. |
| SchemeAndStackFoundations | 0.7 at 755; 0.16–0.18 at 1099,1138,1254; 2.2 at 3309; 2.6 at 3437; 3.3 at 4713; 4.7–4.10 at 5339,5383,5448,5487; 4.13 at 5643; 5.7 at 6987 | Neighbourhood dimension is not stalk dimension. CM dimension formulas and regularity have no missing field/perfectness condition. Proper cohomology is imported from JacobianChallenge. Curve degree allows singular/nonreduced curves. |
| JacobianChallenge | Layer C at 143–165 | Proper coherent higher-direct-image finiteness needs no flatness. |
| GrothendieckEulerForms | Standing conventions at 45; Layer 2 at 237; Layer 3 at 283 | Essential smallness, additive presentations, finite admissible resolutions and common refinements. This package specialises those constructions. |
| GeneralAlgebraicKTheory | §4.8 at 827 | Dévissage subcategory closed under subobjects/quotients; finite filtration of each object. No assertion that ideal filtrations are exact functors. |
| DerivedModuleAlgebra | §0.K.1 at 516 | Koszul differential/sign conventions and regular-sequence resolution; empty sequence and zero equation are distinct. |
| EnhancedDerivedSheaves | §§0.3–0.4 at 455,492; E1.4 tensor/ringed functors at 580,611; E1.5 at 675; E1.6 at 689 | Koszul homological i matches cohomological −i; projection is initially a transformation, with invertibility requiring the hypotheses supplied here. |
| SchemeKTheoryOperations | §§1.5–1.6 at 228,294; §§2.1–2.5 at 373,443,499,547,577; §§3.1,3.4–3.5 at 663,770,784; §§4.4–4.5 at 1143,1189; §§6.1,6.12 at 1627,2166 | Scheme-only carriers. Regular supported Cartan and dévissage precede converting its K×G product into this package's G×G pairing. Rational multiplication is used on Spec A, which meets the separation/RP hypotheses. |

Ownership was searched by object through `roadmaps grep`, the supplied main/Completed trees, the board packages and the indexed open heads, using formal support, formal coherent Grothendieck groups, Tor pairings, formal inverse images, locally-free/projective comparison, codimension and Euler intersection. Scheme operations belong to SchemeKTheoryOperations; categorical presentations to the named categorical suppliers; formal carriers/coherent association to AdicSpacesPartIII. AdicEtaleGeometry §A1.6a (`README.md:3637`) has a projective/vector-bundle equivalence on the étale site of Spa of a strongly sheafy Tate pair, so it is not the Spf comparison here. No second owner of the formal supported operations was found. The later GrossZagierAndArithmeticHeightsPartII design consumes this theory and asks for an additional non-affine theorem; it is not used as a supplier. There is no own Lean declaration whose fully qualified name could collide.

### Pinned-library ledger

The supplied manifest pins Mathlib at 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039; checkout heads agree. Paths below are relative to those libraries. The symbols were read at the pins, not inferred from the citation resolver.

| Symbols | Pinned location and effective content |
|---|---|
| `ringKrullDim`, `Ideal.height` | `Mathlib/RingTheory/KrullDimension/Basic.lean:26`; `Mathlib/RingTheory/Ideal/Height.lean:35`. Ring dimension is `WithBot ℕ∞`; height uses the minimal-prime infimum. Neither supplies a formal-scheme dimension. |
| `IsRegularLocalRing`, `IsRegularRing` | `Mathlib/RingTheory/RegularLocalRing/Defs.lean:51`, `:92`. The first extends `IsLocalRing R, IsNoetherianRing R`; the second imposes noetherianity and regular localisations. No flatness/completeness is implicit. |
| `RingTheory.Sequence.IsRegular` | `Mathlib/RingTheory/Regular/RegularSequence.lean:146`: weak regularity together with nonzero final quotient. Empty sequence on a nonzero module is allowed; on zero module it is not regular. |
| `IsAdicComplete`, `AdicCompletion` | `Mathlib/RingTheory/AdicCompletion/Basic.lean:56`, `:171`. Complete extends the Hausdorff and precomplete conditions; completion is the inverse-limit module construction, not a formal scheme. |
| `Ideal.jacobson`, `Module.support`, `Module.length`, `Submodule.annihilator` | `Mathlib/RingTheory/Jacobson/Ideal.lean:65`; `Mathlib/RingTheory/Support.lean:47`; `Mathlib/RingTheory/Length.lean:30`; `Mathlib/RingTheory/Ideal/Maps.lean:951`. Support is on PrimeSpectrum, length in ℕ∞, annihilator of the submodule; none reads formal topological support. |
| `Module.Flat`, `Module.FaithfullyFlat` | `Mathlib/RingTheory/Flat/Basic.lean:113`; `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:63`. Flatness requires tensor injectivity; faithful flatness additionally excludes collapse at maximal ideals. Neither definition includes finite generation. |
| `Module.Projective`, `Module.Free`, `Module.free_of_flat_of_isLocalRing` | `Mathlib/Algebra/Module/Projective.lean:70`; `Mathlib/LinearAlgebra/FreeModule/Basic.lean:43`; `Mathlib/RingTheory/LocalRing/Module.lean:299`. Free/projective alone do not include finiteness; the cited local theorem explicitly requires finite and flat. |
| `HomologicalComplex`, `CategoryTheory.Tor` | `Mathlib/Algebra/Homology/HomologicalComplex.lean:59`; `Mathlib/CategoryTheory/Monoidal/Tor.lean:44`. Complex shape is explicit. Tor's context has an abelian monoidal preadditive category and projective resolutions; this does not define coherent formal Tor sheaves. |
| `TauCeti.ExactK0`, `TauCeti.AbelianK0`, `TauCeti.AbelianK0.of` | `TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean:163`; `TauCeti/CategoryTheory/GrothendieckGroup/Abelian.lean:79`, `:94`. Exact structure/abelian and essentially-small contexts retained. |
| `TauCeti.finiteModulesExactStructure`, `TauCeti.finiteProjectiveModulesExactStructure`, `TauCeti.cartanMap`, `TauCeti.cartanEquiv`, `TauCeti.cartanMap_bijective` | `TauCeti/Algebra/Category/ModuleCat/CartanMap/Basic.lean:215`, `:222`, `:381`, `:686`, `:708`. Equivalence/bijectivity retains the finite-projective-resolution hypothesis at 631–632 and its inclusion at 704; not an unconditional noetherian-ring equivalence. |
| `TauCeti.ExactStructure.IsResolving.resolutionEquiv` | `TauCeti/CategoryTheory/GrothendieckGroup/Resolving.lean:308`, with context at 281: resolving subcategory, finite resolutions and smallness. |
| `TauCeti.SheafOfModules.tensorProduct` | `TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Basic.lean:93`: sheafification of the tensor of underlying module presheaves. It is not a derived tensor or a coherent formal category. |
| Additional proof inputs: `Module.projective_of_localization_maximal`, `Module.Flat.of_flat_tensorProduct` | `Mathlib/RingTheory/LocalProperties/Projective.lean:130`, requiring finite presentation; `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:588`, requiring a faithfully flat algebra and flat base-changed module. Noetherian finite modules meet the finite-presentation condition in §1.3. |

### Dependency, gap and policy checks

The declared gap has exactly the same slug, named supplier and hypotheses in `packages/SchemeKTheoryOperationsPartII/design/plan.json` and README line 55: `proper-formal-coherent-direct-images`, AdicSpacesPartIII F0.6. It requests one coherent direct-image theorem with its comparison and Mittag–Leffler clauses. It does not re-request affine acyclicity: README line 53 derives that from the existing algebraic-completion comparison at the identity of Spec B. Existing F0.6 only covers completions of proper algebraic morphisms; the arbitrary formal proper case is a precise additional contract. Acceptance remains conditional on that declared contract, which is not a finding.

The required dependency command was run read-only with `--name SchemeKTheoryOperationsPartII --order merge-order/ORDER.txt --movable`. Final output:

```text
depcheck: 153 roadmaps, 1023 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line appeared. The earlier run also had zero problems (149 roadmaps, 1001 edges); the tool's shared index changed during review, while the reviewed head and supplied content checkout did not. The citation resolver reported no unresolved cross-roadmap citations and no unresolved Lean names. It explicitly skipped external library checking, which is why the pinned checks above were done manually.

All 31 `Needs` lines were inspected: internal proof inputs occur earlier, and the affine filtration theorem has no numerical-degree dependency. The scope exclusions do not remove an input used in these proof routes. The current package diff against origin/main consists of eight files, all inside `packages/SchemeKTheoryOperationsPartII/`; no outside-package edit was found. README and docstrings contain no pull-request numbers or repair narrative, no computational algorithms and no own undeclared backticked Lean symbol. Suggested.lean has no `lemma`, `set_option`, `#eval`, `#synth`, axiom inspection, admitted data or arbitrary predicate stand-in. No source text, credentials or network instructions were copied into an output.

## Not verifiable

- README line 630's Kudla–Rapoport consumer pattern was checked against LIZHANG22 lines 965–974, but an independent arithmetic special-cycle instance was not constructed. The local-algebra theorem is tested separately at lines 629, 631 and 632. This row is excluded from the numerical Check count.
- No Lean elaboration was run, as required by the read-only brief. Suggested.lean has no named declarations, so there are no elaborated signatures to compare and no theorem-body truth could be certified by a build in any event.
- No completed implementation of the declared AdicSpacesPartIII direct-image gap exists in the supplied source tree. Its contract, mathematical source and nonduplication were verified; implementation is the supplier's future work.
- Published numbering of Li–Zhang was not substituted for arXiv v3 numbering. The package explicitly cites the legally cached v3 version. No unavailable or paywalled text is needed for the findings, and no missing-reference request was created.
- Ownership searches cover the supplied snapshots and indexed open heads; they cannot establish absence from unpublished work or changes after those snapshots. No ownership claim relies on such work.

## Source issues

- **Misprint** in ZHANG21 at Appendix B.1, printed p. 971 (ZHANG21 line 4520): the source says the associated ideal sheaf represents the module whose support is being tested; it should be the sheaf associated to M; affects a stated result.
- **Gap** in ZHANG21 at Appendix B.1, printed p. 972 (ZHANG21 lines 4540–4544): the source says regular pure-dimensional formal schemes have the displayed strict-complex/coherent comparison; it should be justified with global finite locally-free resolutions or a comparison from a separately constructed perfect model; affects the proof.
- **Error** in LIZHANG22 at arXiv v3 §1.8, printed p. 9 (LIZHANG22 lines 370–372): the source says proper reduced maps suffice for coherent formal direct-image pushforward; it should be adic finite-type properness or another hypothesis ensuring coherent, bounded higher direct images; affects a stated result.
- **Misprint** in LIZHANG22 at arXiv v3 Definition 5.2.1 discussion, printed p. 24 (LIZHANG22 line 975): the source says Proposition 5.1.1 supplies the change-of-support map; it should be Lemma 5.1.1; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "8e576bf8fe9444a1e472ca675bd72c3b296c242c", "job": "RT-SchemeKTheoryOperationsPartII~2a", "model": "gpt-6-astra", "worker": "chris-4"} -->
