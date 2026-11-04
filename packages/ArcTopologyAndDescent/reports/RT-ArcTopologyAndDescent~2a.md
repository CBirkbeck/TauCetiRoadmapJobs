<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1051#issuecomment-6446670895 -->
Red team round 2 pass a (codex) of 64797ef

Verdict: needs_changes

1. **F01** (P3) The complete-arc definition points to the preceding proof

   **Location:** `packages/ArcTopologyAndDescent/README.md:1434`: “Text locators: CS24 line 692.”

   **Claim:** This is the text locator for CS24 §2.2.1, defining I-complete arc-covers.

   **Witness:** CS24 line 692 is a page marker; lines 693–702 finish the preceding perfectoid-quotient proof. The definition starts at CS24 line 711; its finite-ideal clause starts at line 723.

   **Exact repair text:** Replace “Text locators: CS24 line 692” with “Text locators: CS24 lines 711–736”. In `packages/ArcTopologyAndDescent/sources.toml`, replace the §2.2.1 reference to line 692 by line 711. Retest: lines 723–736 explicitly retain finite generation, complete rank-at-most-one tests and the permitted aic completion; I=0 admits all tests and I=A admits none.

2. **F02** (P3) The first excision Check only repeats its definition

   **Location:** `packages/ArcTopologyAndDescent/README.md:692`: “For a rank-two aic V and middle p the test is exactly F(V)=F(V_p)×_(F(κ(p)))F(V/p).”

   **Claim:** The excision predicates have three discriminating Checks.

   **Witness:** No functor F is chosen and neither side is evaluated. This repeats :678. Only the terminal functor and the proper v-sheaf image give actual examples; :696 tests base-changing ring squares, without evaluating a functor.

   **Exact repair text:** Replace the first Check by: “For the underlying-set functor F(A)=A and a rank-two aic valuation V with middle prime p, the comparison identifies V with pairs (a,b) in V_p×V/p having the same image in κ(p). The pair (1,1) is the image of 1; (1,0) is in the direct product but not in this pullback.” Retest: the residue values for the latter pair are 1 and 0 in the nonzero field κ(p); omitting the compatibility condition now fails the Check.

3. **F03** (P3) The v-cover manifest locator points into the introduction

   **Location:** `packages/ArcTopologyAndDescent/sources.toml:31`: “Definitions 2.1 p. 4 and 2.13 p. 9; BS17 line 140”.

   **Claim:** The certified source record locates the two v-topology definitions.

   **Witness:** BS17 line 140 is the page-4 marker; lines 141–168 continue the introduction and acknowledgments. Definition 2.1 starts at line 173; Definition 2.13 starts at line 384.

   **Exact repair text:** Replace that substring with “Definition 2.1, p. 4; BS17 line 173; Definition 2.13, p. 9; BS17 line 384”. Retest: the first anchor gives the valuation-extension lifting condition; the second names the topology it generates. Identity covers and the failed rank-two split v-cover are unchanged.

4. **F04** (P3) Spa is outside the cited AdicSpaces layers

   **Location:** `packages/ArcTopologyAndDescent/README.md:135`: “AdicSpaces Layers 0–1 supply Huber/Tate rings, completion, continuous valuations and Spa.” The same shortened citation supplies §§1.7 and 9.2 at :358 and :1151.

   **Claim:** Layers 0–1 contain the adic-spectrum carrier and its functoriality used by the lifting comparisons.

   **Witness:** `TauCetiRoadmap/AdicSpaces/README.md:335` defines Cont A. The Spa construction and contravariant map of spectra occur at :358, §2.1, in Layer 2, not in Layers 0–1.

   **Exact repair text:** At :22, :135, :358, :373, :1151 and :1272 replace “AdicSpaces Layers 0–1” by “AdicSpaces Layers 0–1 and §2.1”. Keep the narrower references for pure completion/tensor inputs. Retest: for (K,O_K) the rank-one Spa point and its identity pullback now come from §2.1; the zero-pair map still misses that point. The supplier is unchanged and earlier in the order.

5. **F05** (P2) The EnhancedDerivedSheaves contract overstates its supplied results

   **Location:** `packages/ArcTopologyAndDescent/README.md:91`: “Section E1.6's Tor-independence and valuation-decomposition arguments” and “Section E2.8 supplies finite inductive level and the forward abstract-blowup theorem”. The ownership row at :18 repeats both attributions.

   **Claim:** EnhancedDerivedSheaves supplies valuation prime splitting and the forward blowup-excision theorem for arbitrary set/space-valued h-sheaves.

   **Witness:** `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:689` (§E1.6) supplies perfect-ring Tor results, not valuation splitting. At :2399 (§E2.8) it supplies inductive level and quasicoherent/Perf descent, not the asserted arbitrary-presheaf blowup criterion. This package already targets splitting in §0.5 and the criterion in §1.4.

   **Exact repair text:** Replace those two contract sentences with: “Section E1.6 supplies Tor-independence for perfect F_p-algebras; valuation prime splitting is proved in §0.5 here. Section E2.8 supplies finite inductive level. Both directions of the ordinary-scheme abstract-blowup criterion are proved in §1.4 here.” In the :18 ownership row remove “and valuation decomposition” and “the forward abstract-blowup theorem”. In §1.4 replace the alleged agreement with the supplier by “On perfect schemes use the h-topology supplied by EnhancedDerivedSheaves §E2.8.” Add to its route: “For the h-sheaf-to-excision direction, prove the ordinary sheafified-representable pushout and use its monomorphic leg to identify the presheaf pushout with the homotopy pushout; sheafification preserves that pushout. Mapping into F gives excision (BS17 lines 301–314).” No new gap or supplier is needed.

   Retest: the rank-two prime square is V=V_p×_κ(p)V/p by §0.5, independently of characteristic. For the abstract blowup with Z=X and Y=empty, the new forward argument gives F(X)=F(empty)×_F(empty)F(X); the identity blowup gives F(X)=F(X)×_F(Z)F(Z). These proofs use the actual local targets and the supplier's existing finite-level input.

Five new findings: one P2 supplier overclaim and four P3 locator/Check defects. All eight earlier findings are repaired. The mathematical conclusions remain conditional on the four declared supplier contracts.

## Earlier findings: verification at this head

| Earlier finding | Status | Repaired passage and independently recomputed witness |
|---|---|---|
| Pass a F01 | Repaired | `packages/ArcTopologyAndDescent/README.md:270`: “the two arrows send (a,b) to (a,a,b,b) and to (a,b,a,b)”. Over F₂ equality forces a=b: two pairs, versus four without descent. |
| Pass a F02 | Repaired | `packages/ArcTopologyAndDescent/README.md:143`: “except that §1.6 precedes §1.4, which uses it”. The explicit §1.4→§1.6 edge at :310 now respects the declared order. |
| Pass a F03 | Repaired | `packages/ArcTopologyAndDescent/README.md:334`: “Both colimits are k and the limit map is the identity”. Each stage misses x=0, whereas x↦1 makes both colimits k; base change of B_i is k[x], not k[x,x⁻¹]. |
| Pass b F04 | Repaired | `packages/ArcTopologyAndDescent/README.md:3`: “with values in an infinity-category compactly generated by cotruncated objects”. The hypothesis now agrees with §4.6 and BM21 Theorem 4.1. |
| Pass b F01 | Repaired | `packages/ArcTopologyAndDescent/README.md:1091`: “For a finitary rigid arc-sheaf F with values in D(Lambda)^(>=0)”. The duplicate torsion theorem is removed; :1103, :1180, :1320 and :1490 consume PrismaticCohomology §2.0. BM21 line 2080 supplies the remaining general rigid-functor theorem. For complete aic V and nonzero nonunit t, both punctures are Spec Frac(V), with constant value Λ[0]. |
| Pass b F02 | Repaired | `packages/ArcTopologyAndDescent/README.md:115`: “the completed sequence 0→N→R̂→(R/N)^∧→0 is exact”. If π^cN=0, N∩πⁿR=πⁿN=0 for n≥c; the quotient kernels stabilize to N, so the inverse-limit sequence is exact and inversion kills N. For R=Z_p[x]/(px), both generic rings are Q_p. The compound gap is absent from both declarations. The new :1103 strict-henselization route agrees with BC22 lines 1230–1243: B/aⁿ and B′/aⁿ are the same strict henselization, hence their completions coincide. |
| Pass b F03 | Repaired | `packages/ArcTopologyAndDescent/README.md:69`: “For torsion étale cohomology the supplier states descent, not hyperdescent”. At :1206 the upgrade uses k-truncated Ω^(∞−k). For C∈D(Z)^(>=0), π_j Ω^(∞−k)C=H^(k−j)(C)=0 when j>k. This proves the stated truncation and avoids any assumption of Postnikov convergence; compare CS24 line 808. |
| Pass b F05 | Repaired | `packages/ArcTopologyAndDescent/README.md:69`: “BM21 lines 1560, 1776, 1976, 2087 and 2142”. These open Theorems 5.4, 5.13, 6.4, 6.11 and Corollary 6.17 respectively. The former 1780 page-header and 2093 proof-interior anchors are gone. |

## Verified sound

Read all 1,605 README lines and all 132 Lean lines: 84 numbered target blocks, five definitions and five admitted headline theorems. Read and evaluated all 152 labelled Check bullets, together with the unlabelled worked examples; S02 identifies the definition-only bullet. The statement ledger below records explicit values, including the additional controls needed to distinguish conventions. These computations test the statements; they are not substitutes for proofs.

Checked 125 distinct cached source-line anchors across 13 readable works: 123 land at the relevant statements or proof passages; S01 and S03 identify the incorrect anchors. HUB96 remains uncertified. Checked the 17 named roadmap supplier families against main for existing roadmaps and the indexed open heads for new roadmaps, including the changed PrismaticCohomology, completion and hypercover contracts. S04–S05 identify the remaining supplier attribution defects. The ownership searches covered main, Completed, board packages and the open-head index by object, followed by inspection of relevant matches. No duplicate fully qualified acceptance-file declaration was found.

The five statable headlines are universal spectral characterization, stability under affine-transition cofiltered limits, universal effective epimorphisms of perfect schemes, arbitrary-torsion affinoid vanishing and its residue-invertible improvement. All five appear in the acceptance file. Its module docstring names the unstatable general excision/detection, unrestricted glueing, étale-object descent, h-differential/de Rham, Perf, algebraic-space mapping, completed-generic-fibre/Künneth, finite-ideal and perfectoid/tilt/A_inf families and identifies the missing coherent carriers. None of the five theorems reduces to a definition, a boundary calculation or a single pinned theorem. The five definitions are simple native predicates needed by those headlines.

The ten worker-supplied elaborated types were compared individually with the README and the source signatures. There is no section-variable block; all required instances are explicit in the declarations. No binder was lost. No new Lean command was run.

### Acceptance-file declaration ledger

Every row refers to `packages/ArcTopologyAndDescent/Suggested.lean`. All declarations use universe u; the context column lists additional binders and instances, not assumptions inferred from a docstring.

| Declaration; line; README section | Actual context | Instances and computed values | Result/change |
|---|---|---|---|
| IsSchemeArcCover; 46; §2.7 | X,Y:Scheme.u; f:Y→X. Tests V,W:Type u, commutative domains, valuation rings, KrullDimLE 1; e injective and local; b≫f=Spec(e)≫a. | id_empty: zero tests, true. Empty→Spec F₂: one field test with no lift, false. Reduction F₂[ε]/ε²→F₂: ε must map to zero in every V, and W=V lifts. | Matches the supplied predicate; no sorry-defined data. |
| arc_spectral_characterization; 55; §2.7 | X,Y compact and quasi-separated; f quasi-compact and quasi-separated; every compact quasi-separated T→X. | Identity: both true. Generic inclusion into a DVR: closed singleton has empty compact-open inverse image but is not open, both false. Rank-two split: among eight subsets, exactly empty,{0},{0,p},{0,p,m} have open inverse image; these are the four target opens. | Both directions survive these controls. |
| isSchemeArcCover_of_isLimit; 67; §2.7 | I:Type u, Category.u, nonempty cofiltered; both diagrams objectwise qcqs, both transition families affine; actual limit cones hX,hY; every component arc. | One-object category gives exactly f. Polynomial fold tower has limit fold over k[x₁,x₂,…] and section, hence W=V. Constant empty diagrams give id_empty. Empty index excluded. A false cone with apex empty over constant Spec k fails IsLimit. | Limit hypotheses are substantive. |
| IsPerfectFpScheme; 81; §7.8 | p:ℕ, X:Scheme.u; every open section ring has p=0 and x↦x^p bijective. | Empty: singleton ring, true. F₂[ε]/ε²: ε²=0=0², not injective. F₃[t]: t has no cube root. F_p[t^(1/p∞)]: t^(1/p²)↦t^(1/p). p=0 or1 forces empty; p=4 admits F₂. | Prime requirement belongs to the theorem, as documented. |
| QcqsPerfectFp; 85; §7.8 | p:ℕ; object property compact ∧ quasi-separated ∧ preceding predicate; full subcategory retains all scheme maps. | Spec F_p and empty admitted. Infinite disjoint union of Spec F_p has perfect sections but no finite subcover, hence rejected. Dual numbers fail perfectness. | No morphism condition silently added or omitted. |
| arcCover_iff_universallyEffectiveEpi; 89; §7.8 | p prime; f in full qcqs perfect category; all T,P, g,f′,g′ with IsPullback g′ f′ f g. | Identity: both true. Empty→Spec F_p: arc false and not even epi (two maps to a two-point target agree on empty). Perfect rank-two split: arc true and matching maps glue across κ(p). | Universal quantification is over actual pullbacks in the correct category. |
| IsTorsionEtaleSheaf; 100; §10.0 | X:Scheme.u; F:Sheaf smallEtaleTopology AddCommGrpCat.u; IsAddTorsion on affine étale sections. | Constant Z/6: 6x=0. Constant Z: n·1=n≠0 for n>0. Direct sum of Z/ℓ^r: each finite-support element has finite exponent, with no common exponent across all sections. | Affine basis avoids imposing global uniform torsion on an infinite disjoint union. |
| IsPrimePowerTorsionEtaleSheaf; 105; §10.0 | Same X,F; ℓ:ℕ; ∀ affine U,x, ∃n:ℕ, ℓ^n x=0. | Z/ℓ²: element1 killed at n=2, not1. Z/r for prime r≠ℓ: ℓ^n·1≠0. ℓ=1 allows only zero; ℓ=0,n=1 kills every x. | Prime binder of the theorem excludes junk exponents. |
| affinoid_artin_grothendieck; 111; §10.8 | K nontrivially normed field, ultrametric, NonarchimedeanRing, complete, algebraically closed; A commutative ring/topology/K-algebra; actual strict-tft predicate; d:ℕ, KrullDimLE d; torsion F; q>d+1. | A=0: dim below0 and H^q=0. A=K or K[ε]/ε²,d=0: H⁰=Λ and every positive H=0, so q≥2 vanishes. A=K²: H⁰=Λ², positive H=0. | Topology constrained by an open quotient presentation; nonreduced algebras retained. |
| affinoid_artin_grothendieck_prime_to_residue; 122; §10.8 | Same analytic context; ℓ prime with norm(ℓ)=1; sectionwise ℓ-primary F; q>d. | Over C₂, norm2=1/2 excludes2, norm3=1 admits3. Over C₃, norm3=1/3 excludes3, norm2=1 admits2. A=K,d=0 gives H^q=0 for q≥1; A=0 gives0. | Sharper range and coefficient hypothesis agree. |

### README computation ledger

Here k is algebraically closed unless another field is specified. V₂ has prime chain 0<p<m and elements with v(y)=(1,0), v(x)=(0,1), lexicographically ordered. An aic or perfect extension is taken when the target requires it. V₁ is a nonfield rank-one valuation domain and t a nonzero nonunit. “Agrees” means the displayed instance agrees with the target, not that a general proof was performed. Section numbers and lines refer to `packages/ArcTopologyAndDescent/README.md`.

| Target / convention | Instances tried and values computed on both sides | Result/change |
|---|---|---|
| Conventions; :28–42 | v(y/xⁿ)=(1,−n)>0 for n=0,1,2, hence y lies in every xⁿV₂. Localization at p inverts x; quotient by p kills y. H¹(Z[−1])=Z. The periodic resolution over Z/4 with differential2 gives Tor_i(Z/2,Z/2)=Z/2 for all i≥0. | Ring directions, shifts and absence of Tor assumptions agree. |
| 0.1 aic | Algebraically closed k has roots of every positive-degree monic polynomial; Q has no root of T²−2. Coordinate roots work in k×k despite (1,0)(0,1)=0. Zero ring has no positive-degree polynomial. | Domain-free predicate and positive-degree restriction agree. |
| 0.3 bounded aic extensions | For F_p→k the algebraic closure of F_p inside k has cardinal ℵ₀; there is no unital map 0→nonzero V. A DVR extends to a valuation on an algebraic closure with values v(t)/n. | Bound max(ℵ₀,card A) and nonzero valuation tests agree. |
| 0.4 finite rank | Restrict V₂ to k, k(x), k(x,y): ranks0,1,2. Infinite-variable composite valuations have finite stages of ranks1,2,…, without a uniform bound. | Stagewise finite rank, not bounded rank. |
| 0.5 splitting | p=0 gives Frac(V)×_Frac(V)V=V; p=m gives V×_κ(m)κ(m)=V. For middle p, y/xⁿ∈p and pV_p=p; V_p×_κ(p)V/p=V. | Endpoints and nontrivial square agree. |
| 0.6 intervals | [p,p] gives κ(p); [0,m] gives V. Adjacent [0,p],[p,m] give V_p,V/p; overlap gives κ(p). | Shrinking interval reverses Spec and follows ring arrows. |
| 0.7 ind-smooth | Take k=Q̄. For V=k, Ω¹=0; for k[t]_(t), Ω¹=Vdt. k[ε]/ε² has ε≠0 nilpotent, unlike a filtered colimit of smooth k-algebras. | Valuation and characteristic-zero hypotheses retained. |
| 1.1 universal descent | Identity Čech diagram Tot K=K. For K=Z[0], homotopy equalizer of id,id is Z[0]⊕Z[−1], H¹=Z rather than0. Fold over F₂: the two arrows (a,a,b,b),(a,b,a,b) agree for exactly two of four pairs. | Earlier F01 repaired; full Čech totalization matters. |
| 1.3 h-site/blowups | Z=empty forces the proper map to be an isomorphism. Z=X,Y=empty yields cover X. Blowup of A² has exceptional P¹; deleting the centre of a chosen valuation leaves no lift of that valuation. | Properness/surjectivity is stronger than point surjectivity. |
| 1.4 h criterion | Identity blowup gives F(X)×_F(Z)F(Z)=F(X). Dual-number reduction is an h-cover but raw A¹ sections k[ε]/ε²→k have kernel kε. | Criterion rejects the raw representable; §1.6 now precedes this target. S05 assigns both directions to this local target. |
| 1.5 perfection | (F_p[ε]/ε²)^perf=F_p; (F_p[t])^perf=F_p[t^(1/p∞)]. Perfect rank-two split is arc but no branch lifts the identity rank-two valuation, so it is not v. | Correct restricted subcanonicity and strictness. |
| 1.6 approximation | Infinite polynomial ring is colim k[x₁,…,x_n]; evaluation at zero splits each projection. Noncartesian system A_i=k[x],B_i=k[x,x⁻¹], x↦1 has both colimits k; every stage misses0 and B_i⊗_(A_i)A_(i+1)=k[x]. | Earlier F03 repaired. |
| 1.7 v geometry | id_empty has0 specialization pairs; id_Spec k has1. Split V₂ covers all3 points but has0 comparable lifts of 0⇝m. Frac(V₁) misses its closed point. | Subtrusive, submersive and surjective are distinguished; S04 fixes the Spa supplier locator. |
| 2.2 v versus arc | Reduction of noetherian dual numbers is v and arc. Rank-two split: arc true,v false. After base change to either branch a section exists and v becomes true. | Noetherian-target restriction essential. |
| 2.3 Milnor covers | I=0 gives identity quotient branch; I=A forces B=A under I≅J. Middle-prime split covers rank-one intervals but kills y or inverts x, preventing a rank-two identity lift. | Arc conclusion and not-v control agree. |
| 2.4 specialization lifting | id_V₁ lifts η⇝s. Frac(V₁) disjoint-union κ(m) contains both points but no such specialization. Over a field a nonempty fibre supplies the only pair. | Comparable points, not two unrelated lifts. |
| 2.5 affine purity | V→V maps1↦1 in V/(t²); V→Frac(V) kills1 in V/(t). Every valuation test kills ε in k[ε]/ε², making its reduction base change V→V. k→0 kills1; 0→0 has no tests. | Purity criterion true/false sides match. |
| 2.7 spectral iff | For generic inclusion, preimage of closed point is empty compact open, but singleton is not open. Rank-two split has four open-preimage subsets among eight, exactly the target opens. Identity field has both subsets open. | Iff agrees; no ordinary-quotient overclaim. |
| 2.7 limit theorem | One-object diagram gives f. Limit of polynomial fold tower is split fold over infinitely many variables, with W=V. Empty apex over constant Spec k has0 lifts and is not a limit cone. | Actual cones and nonempty cofiltered index retained. |
| 3.1 cotruncation | Finite set K gives Map(K,X)=X^K,0-truncated for sets. For C∈D(Λ)≥0, Map(Λ[−r],C) has π_j=H^(r−j)(C), zero for j>r. In Spaces, Map(*,K(Z,n)) has π_n=Z for arbitrarily large n. | Generator-dependent bound, not arbitrary stable targets. |
| 3.2 finitary | Terminal functor: colim *=*. Finitely presented affine equations use finitely many coefficients. Identity map of infinite polynomial ring uses infinitely many variables and factors through no finite-variable stage. | Finite-presentation control discriminates. |
| 3.3 totalizations | Constant finite S has Tot S=S on both sides of filtered comparison. Constant scheme identity diagram has identical Čech objects. Fixed r-truncation kills π_j for j>r at every stage. | Uniformity is in the diagram index for a fixed generator. |
| 3.4 h-to-v | Terminal comparison is *→*. Over algebraically closed k, constant torsion coefficients give H⁰=Λ, H^q=0 for q>0 in both supplied calculations. A split affine approximation has Tot equal to base value. | Cotruncated/finitary hypotheses are not dropped. |
| 3.5 detecting families | Singleton identity test is the original comparison. Empty testing family would accept k→* for raw A¹ on empty→Spec k, which has two versus one elements when k=F₂. Product base change has multiplication/projection section. | Joint-cover condition excludes the vacuous family. |
| 3.6 product spectra | Empty product=0, Spec0=empty=βempty. Two factors have two principal ultrafilters and the two valuation fibres. Nonprincipal ultrapower has [(n)]>r[(1)] for every integer r, giving higher rank. | Does not falsely preserve rank one under ultraproducts. |
| 3.7 component obstruction | v on k[x,y] contracts the three primes to0,(y),(x,y), distinct over F₂ and F₃. Rank-zero and rank-one valuation spectra have respectively1 and2 points. | A component with ≤2 points cannot cover all3 contractions. |
| 3.8 Boolean sheaf | One factor gives F(A); empty gives F(0)=terminal; two factors give F(A₁)×F(A₂). For underlying rings, a nonprincipal stalk is colim_(J∈U) product_(j∈J)A_j=ultraproduct_U A_j. | Product convention and stalk direction agree. |
| 3.9 ultrafilter detection | With two factors, cross idempotents multiply to0, so tensor/base-change tests separate the factors and reconstruct their product. On βN principal points omit every nonprincipal ultrafilter. | All ultrafilters, not only listed ring factors, are tested. |
| 3.10 aic detection | Algebraically closed field has identity aic test. For A=0 the empty product gives0 and the empty identity cover. Aic extension of V₂ still has rank2. | Product basis does not assert rank-one components. |
| 4.1 prime extension | k→positive-rank aic W,p=0: pW=0, largest prime over0 is m_W, tensor W=W_(m_W), not Frac W. V₂→κ(m), middle p: contraction of0 is m≠p, excluded by ker⊆p. | Necessary source correction preserved. |
| 4.2 persistence | Constant cartesian identity diagram is v at every stage and limit. The §1.6 x↦1 system has identity limit but no v stage, and base-change ring k[x] differs from B_i. | Cartesian transition hypothesis remains. |
| 4.3 excision | Terminal: *=*×_* *. Node k[x]×_k k[y] base changes to pullbacks k[y]×_k k=k[y] and k×_k k[x]=k[x]. The proper v-sheaf image of a rank-two split lacks the identity section while its branches contain the matching pair. | S02: generic F formula evaluates no functor; replace by underlying-ring pairs, with (1,1) admitted and (1,0) rejected. |
| 4.4 interval induction | Field has only [0,0]. Rank2: [0,p]∪[p,m]=[0,m]. On a chain0<p_n<…<p₁, the collection of intervals avoiding0 plus [0,0] contains every interval of length≤1 but not [0,p₁]; strict extension at0 fails. | Strict extension excludes the infinite-chain wrong model. |
| 4.5 split descent | pW=W gives quotient0 and localization W. p strictly below ker gives pW=0 and W⊗V_p=W⊗κ(p)=0. For field embedding, q=m_W gives W. | The repaired kernel case covers the source proof gap. |
| 4.6 criterion | Terminal functor: arc/excision/aic-excision all true. Proper v-sheaf image H of split V₂: v true, each of the other three false. Endpoint p=0,m squares have identity legs. | Equivalence includes substantive negative model. |
| 4.7 detection | Identity transformation gives identity on every test. Zero→constant nonzero Λ fails on algebraic closure of F₂: H⁰0→Λ. K(Z,r) as r grows has no common truncation bound. | Fixed-bound restriction retained. |
| 5.1 bounded site | Empty family covers empty only. A finite list of Z_(p) misses (q) for another prime q; adding Q covers only generic point. Nilpotent reduction has the same valuation maps. | Infinite family of tests is not a finite covering family. |
| 5.2 coherence | Pushout {a,b} glued along{a} to{c} gives{b,c}; relation sizes2,1,1. A two-element-to-singleton surjection has relation size4. Dual-number reduction becomes an isomorphism of sheafified representables though raw A¹ sections lose ε. | Quasi-separated quotient criterion and sheafification distinguished. |
| 5.3 coherent tests | Identity lifts every section; empty→h_Spec k has0 preimages of the k-section. Infinite coproduct of Q and Z_(p) lifts valuation tests but has no finite covering subfamily. | Quasi-compactness excludes the false criterion. |
| 5.4 cardinal cutoffs | Empty/terminal pull back to empty/terminal; a small field's sheafified representable has the indicated same geometric object. A ring of cardinal in [κ,κ′) exists only in the larger site. | Geometric morphism, not equivalence of entire topoi. |
| 5.5 unrestricted excision | I=0 gives identity A/I=A. I=A forces B=A. For V₂, matching pairs in V_p,V/p over κ(p) recover V; sheaf evaluation yields that same pullback. | No finitariness imposed in conclusion. |
| 5.6 nonsubcanonical | A=k[ε]/ε²,k=A/(ε), k⊗_A k=k. Every reduced Čech level givesk while h_A¹(A)=A; comparison kernel is nonzero kε. | Actual representable descent fails. |
| 6.1 strict henselian calculation | Constant Λ on aic V gives H⁰=Λ=closed stalk and positive H=0. Extension by zero from proper generic open has closed stalk0 and RΓ=0. Finite étale degree r splits into r copies. | Closed stalk, not generic stalk. |
| 6.2 strict-local detection | Spec k has itself as strict localization. Fold has TotΛ=Λ. Empty cover of Spec k comparesΛ→0 and its geometric stalk detects failure. | Detection is not automatic for arbitrary families. |
| 6.5 valuation chain | Rank0 has1 vertex. Rank1 generic open gives stalks(*,empty), constant gives(*,*), transition closed→generic. Fold gives a two-to-one natural transformation, valid despite not injective. | n+1 vertices; only object transitions restricted. |
| 6.6 étale-object descent | Finite étale split V₂ gives FinSet×_FinSet FinSet=FinSet. Separated objects glue diagrams with injective transition maps; constructible sheaves allow all transitions. Empty base has terminal category. | Separated and general categories not identified. |
| 7.3 constructible complexes | Rank0 category Dᵇ_fg(Λ); rank1 skyscraper diagram Λ→0 versus constant Λ→Λ. For Λ=Z/4,M=Z/2, Tor₀,Tor₁,Tor₂ allZ/2, continuing indefinitely. | Bounded cohomology does not imply finite Tor amplitude. |
| 7.4 h-forms | Take k=Q̄. On k: F₀=k, F_i=0 for i>0. On k[t]: F₁=k[t]dt in degree 0. On dual numbers: F₀=k, unlike naive Ω⁰=k⊕kε. | Sheafification eliminates nilpotent wrong model. |
| 7.5 smooth comparison | For k=Q̄, k[t] gives H⁰=k[t]dt and H^q=0 for q>0 on both sides. Empty gives0. Dual numbers give Ω⁰=k⊕kε versus F₀=k, excluded by smoothness. | Generality is smooth/ind-smooth. |
| 7.6 differential arc-descent | Over k=Q̄, in aic V, a∈p has square root b∈p, hence a=b²∈p² and p/p²=0. Flat Ω^i preserves the prime-square kernel. Field endpoint gives identity square; raw dual-number Ω⁰ fails reduction descent. | Uses corrected aic and characteristic-zero inputs. |
| 7.7 Perf | Empty has zero category. Fold over perfect k gives descent Perf(k×k)=Perf(k)²→Perf(k). Perfect prime quotient has Tor_i(V/p,V/p)=0 for i>0; compatible rank-one free modules glue toV. | Perfectness and fixed Tor bounds retained. |
| 7.8 perfectness/canonical covers | F₂ dual numbers fail Frobenius injectivity; F₃[t] fails surjectivity. Empty passes, infinite union fails qc. Identity has both properties; empty→Spec F_p has neither. p=4 passes the predicate on F₂ but is excluded by primality. | Matches all three Lean declarations. |
| 8.1 glueing data | Z/pⁿ=Z_p/pⁿ for n=1,2, but opens are Z[1/p],Q_p. I=0 forces A=B; I=A makes every quotient0. V₂'s x-completion kills nonzero y because y∈all xⁿV₂. | Completion need not be injective; all principal opens retained. |
| 8.4 valuation completion | Z_(p)→Z_p is injective local with same value groupZ. t and t² give cofinal filtrations. V₂ atx killsy. t=1 gives completion0, excluded as pseudouniformizer. | Rank-one and nonunit restrictions matter. |
| 8.5 completion cover | V₂→V̂_x×V₂[1/x] is arc; first branch killsy, second invertsx, so no rank-two identity lift and v false. I=0 supplies identity completion. | Arc need not be v. |
| 8.6 formal glueing | I=0 gives B=A and equalityF(A)=F(B). I=A gives F(B)×_F(B)F(A)=F(A). Z→Z_p has four corners Z,Z_p,Z[1/p],Q_p, with distinct generic rings. | Pullback directions and endpoint values agree. |
| 8.7 rigidity | ConstantΛ comparison identity. Finite étale Z_p and F_p categories agree. Underlying ring functor Z_p→F_p has kernel pZ_p≠0 and is not rigid. Henselian unit ideal forces A=0. | Rigidity is additional. |
| 8.8 punctured rigid functor | For complete aic V,(t), both punctures equal Spec Frac(V), constant valueΛ[0]. I=0 gives empty punctures and0. Henselian I=A forces A=0. | Duplicate torsion theorem removed; stable comparison remains. |
| 8.9 supports/completion | A=Z_p,U=D(p): both opens Q_p; U=SpecA: identity. Empty support gives zero complexes. For I=(x,y) in k[[x,y]], both axis-generic directions occur; one D(x) omits the other. Strict local B/aⁿ=B′/aⁿ makes the completions identical. | New proof matches punctured supplier and BC22. |
| 9.1 arc_t | Identity lifts with W=V. V→Frac(V) has0 lifts preserving t as nonunit. For t=0 or1 there are0 tests, so every map passes. Added boundary R/t=R at0 or R[1/t]=R at1 restores an ordinary cover. | Vacuous boundaries explicitly handled. |
| 9.2 Tate pairs | Identity of(K,O_K) hits its rank-one point. Zero Tate algebra has empty Spa and misses a nonempty target. Fold from two copies surjects and has a section. | Rank-one surjectivity, not arbitrary point bijection. |
| 9.3 arc_t equivalences | For R=Z_p[x]/px every test domain with p≠0 killsx, giving identical Hom sets for R andZ_p. For V→Frac(V), id_V exists but Hom(Frac(V),V) is empty. Identity is bijective. | Unique lifting distinguishes equivalences from covers. |
| 9.4 E_t | Complete aic V gives Λ[0] on its fraction field. t=0 localizes to0; t=1 completes to0. On a field with t≠0, completion is0 and E_t=0, while ordinary H⁰=Λ. | Completion is performed before inversion. |
| 9.5 hyperdescent | Identity hypercover of complete V has TotΛ[0]=Λ[0]; split fold yieldsΛ. Added R/t and R[1/t] each have E_t=0. For C≥0, π_j Ω^(∞−k)C=H^(k−j)C=0 for j>k. | Repaired hypercompleteness argument is valid. |
| 9.7 total integrality | In rank1, c·v(t)+n·v(z)≥0 for alln forces v(z)≥0. z=p⁻¹ in Z_p[1/p] fails at n=c+1, value−1. For t=1, localizationA and c=0 works. | Uniform ∃c∀n, not ∀n∃c. |
| 9.8 invariance | Removing x from Z_p[x]/px leaves completed generic ringQ_p on each side. Fold V→V² changes E_t fromΛ toΛ² and is not an equivalence: it has two projections toV. | Mere covering does not imply invariance. |
| 9.9 universal homeomorphisms | Nilpotent reduction has unchanged étale objects. Purely inseparable extension has diagonal elementδ with δ^p=0. A split two-point cover changes H⁰Λ→Λ² and is not a universal homeomorphism. | Nil and inseparable boundaries survive. |
| 9.10 common total closure | A=B gives identity square. A=k[t²,t³]⊂B=k[t], parameter t²: localization k[t,t⁻¹], total closureB. A+t²B=A; kernel of A/t²A→A/t²B contains nonzero t³ whose square t⁶ lies in t²A. | Nil special-fibre kernel is the required conclusion. |
| 10.0 affinoid carrier | Zero variables giveK; quotient by1 gives0; quotient byT² givesK⊕KT with T²=0. Open quotient fixes the topology. | Includes empty and nonreduced affinoids. |
| 10.0 torsion | Constant Z/6 is killed by6; constantZ has n·1≠0 for n>0. A section of direct sum Z/ℓ^r with support≤m is killed byℓ^m; the whole system has no common exponent. | Elementwise affine-section predicate. |
| 10.0 primary torsion | 1∈Z/ℓ² needs exponent2; ℓ^n·1 in Z/r is nonzero when r≠ℓ. ℓ=0,n=1 kills everything; ℓ=1 kills only0. | Theorems carry primality. |
| 10.1 rational domains | At X=0, generators(X,1) give max1,min0. Characteristicp,n=1 has constant Z/p H^q=0 for q≥2. n=0 dual numbers have H⁰Λ and positiveH=0. In C_p,p≠0 though normp<1. | Maximum and field/residue characteristic distinction retained. |
| 10.2 rational Mayer–Vietoris | f=0,g=1: one patchA, other0, overlap0; pullbackRΓ(A)×_0 0=RΓ(A). f=g=1 gives identity square. f=g=0 fails unit ideal in A≠0. | Denominators and generating condition agree. |
| 10.3 tubes | r=0: U₀=f; r=1: πU₁=f, transitionU₀↦πU₁. f=0 givesA at every tube; f=1 gives empty sufficiently small tubes and quotient0. Complete rank1 test has intersection πⁿV=0, hencef=0. | Transition direction is multiplication byπ. |
| 10.5 valuation Künneth | R=R′=V complete aic: Λ⊗Λ=Λ=E_π(V). R=V/π orV[1/π] gives0 on both sides. Residue-characteristic coefficient prime is not a unit. | Coefficient restriction retained. |
| 10.6 affinoid Künneth | A=B=K gives F_ℓ⊗F_ℓ=F_ℓ. A=K²,B=K gives F_ℓ² on both sides; A=0 gives0. Two d-dimensional factors finite over Tate algebras give dimension≤2d. | Completed tensor, not algebraic tensor. |
| 10.7 constant bounds | d=0 fields/dual numbers have positiveH=0. If H^(d+1)≠0 over field coefficients, tensor square gives nonzero H^(2d+2), contradicting vanishing above2d+1. At d=1 this is4>3. | Strict inequalities and normalization agree. |
| 10.8 arbitrary torsion | K,K²,0 give H⁰Λ,Λ²,0 and positiveH=0. S₃ Sylow indices:3≡1 mod2;2·2≡1 mod3. In F_ℓ[C_ℓ],(g−1)^ℓ=0. Residue norms at2,3 are1/2,1/3; other primes have norm1. | General d+1 and residue-invertible d bounds agree. |
| 11.1 complete arc | I=0 makes V complete; I=A would force V=limV/V=0, impossible for a domain. Z_p→Q_p has no lift of id_Z_p; identity does. For I⊂J, IV=0 or nonzero rank-one ideals give cofinal powers, preserving the inclusion direction. | S01 corrects the text anchor; definition itself agrees. |
| 11.2 valuation products | One V: D(t)=Spec FracV, one point instead of two. Two factors: D((t,1))=Spec FracV₁ disjoint-union SpecV₂. Empty product0 gives empty cover. For finite I, product quotients are coordinatewise and inverse limits give complete product. | Localizations of factors, not unchanged factors. |
| 11.3 formal site | p-complete field has p=0. A characteristic-p field embeds in a complete aic rank-one extension, retaining field tests. Dual-number reduction has identical valuation maps but section rings k⊕kε andk differ. | Rank0 and structure-sheaf caveat retained. |
| 11.4 arc_I | I=0 gives identity quotient boundary. I=A=(2,3) inZ has D(2)∪D(3)=SpecZ, neither alone. For(x,y), points(0,1),(1,0) have union membership(1,1), intersection(0,0). | Every principal open, not their intersection. |
| 11.5 completed/punctured descent | Complete aic V,(t): whole and punctured constant valuesΛ[0]. I=0: wholeR, punctureempty; I=A: completion and henselization0. Identity hypercovers preserve each value; bounded-below truncation gives hyperdescent. | Supplier remains descent; upgrade owned here. |
| 12.2 perfectoid comparison | Completed Z_p[p^(1/p∞)] is its powerbounded model. A=F_p×O_Cp has torsionF_p×0 and generic ringC_p; image isO_Cp. Perfect characteristic-p A gives generic ring0, both cohomologies0. | General integral-model compatibility remains a declared gap. |
| 12.4 formal targets | T=SpfF_p,X=Spfk perfect: one map. Empty target/nonempty source: zero maps; empty source: one map. Canonical Z_p→O_Cp sends pⁿ to pⁿ→0, so is continuous. | No qcqs condition silently imposed onT. |
| 12.5 proper henselian | I=0 gives identity; henselian I=A forces A=0 and both sides0. P¹ over O_Cp with ℓ≠p has H⁰F_ℓ,H¹0,H²F_ℓ(−1) on both sides. | Proper base change uses no flatness ofX. |
| 12.6 tilting covers | Perfect characteristic-p A with parameter0 has A♭=A; both zero-complete predicates coincide. Mixed-characteristic identity lifts byW=V before and after tilt. Compatible sharp sends chosen tilt parameter to a generator of the same ideal. | Parameters and completion agree. |
| 12.7 perfectoid hyperdescent | Identity and split-fold hypercovers of perfect k have Totk=k, Totk♭=k, TotW(k)=W(k), concentrated in degree 0. Zero input gives0 for all three. | A_inf=W(tilt), not direct perfection. |
| Supplied extensions; :242 | Identity is injective and reflects units; V→FracV sends a nonunit t to a unit; V→κ(m) kills nonzero t. | The two extension conditions are independent. |
| Supplied covers; :364,:468 | Empty→empty passes, empty→Spec k fails. Polynomial projection splits by setting variables0. Rank-two split is arc but notv; deleting a blowup point loses the centred valuation lift. | Recomputes imported conventions. |
| Supplied spectral checks; :476 | Identity reflects opens; proper open misses points. Infinite-chain example has inverse image of{0} closed via βN\N although{0} is not closed; the complementary open preimage is not compact. | Spectral submersion does not imply quotient map. |
| Worked examples; :1584 | For every n,v(y/xⁿ)=(1,−n)>0; completion killsy. For two generators axis points lie in the union, not intersection. πʳ(πU_(r+1))=π^(r+1)U_(r+1)=f. | Conventions agree across layers. |

### Supplier, ownership and pin evidence

| Owner checked | Exact current interface and consequence for this package |
|---|---|
| PrismaticCohomology | `TauCetiRoadmap/PrismaticCohomology/README.md` §2.0 supplies Arc.Cover/ofVCover, finite-presentation v-refinement, torsion arc-descent/excision, bounded constructible hyperdescent, torsion glueing, punctured henselian comparison and the p-formal site/basis/O theorem. §§0.79–0.82 and the perfect-prism contracts retain distinguished-generator and bounded-torsion conditions. The package owns the larger domains and the explicit hypercomplete upgrades, not a second torsion theorem. |
| SchemeAndStackFoundations | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:848`, :938–1095, :1565, :2071–2320, :3388, :3482, :3656, :3867 and :5339–6038 resolve the cited approximation, henselian/perfection, algebraic-space, cohomology and formal-scheme sections. In particular :3692 names Etale.artinSchreier_vanishing; §2.15 gives arbitrary henselian-pair Gabber. The three declared extensions are additional interfaces. |
| EnhancedDerivedSheaves | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` §§E0.1–E0.8, 0.1–0.4, E1.3–E1.6, E2.6–E2.8, E4.1–E4.3 and E5:descent supply the indicated enhancements. At :732 perfect-ring Tor vanishing requires all three rings perfect. At :2319 bounded-below hypercover descent needs a uniform lower bound; :2377 distinguishes hypercompleteness from Postnikov completeness. No unbounded convergence is borrowed here. |
| EtaleCohomologyFoundations | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md` §§F.0.1, 0.5–0.7, F.2.1–F.2.6, F.3 and G.1–G.3 resolve continuity, localization, proper base change, field Künneth, affine vanishing and compactification. Finite coefficients of infinite Tor dimension remain in the constructible-cohomology category. |
| ClassicalAdicEtaleCohomology | `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md` §§6.1,6.3 supply the valuation assertions at their stated arbitrary ranks and prime-to-characteristic coefficient range; §§2.5–2.6 keep the Huber standing conditions and normalized p-torsion-free model. The general integral-model comparison is still explicitly conditional, not attributed to the narrower theorem. |
| AdicEtaleGeometry | `TauCetiRoadmap/AdicEtaleGeometry/README.md` §A1.0.5 supplies regular-parameter punctured finite étale approximation; §A1.15 at :5763 supplies enough points for coherent topoi. Dividing out bounded parameter torsion makes the first contract applicable; it is not used for arbitrary open subsets. |
| DiamondsAndVStacks | `TauCetiRoadmap/DiamondsAndVStacks/README.md` §§D0.6,D0.11–D0.12,D0.16,D0.18,D0.22 have the required component, spectral, profinite and ordinary Boolean-sheaf results. D0.11 reflects compact openness, not all openness. D0.22 uses products on disjoint clopens. This package adds the scheme arc characterization and the infinity-categorical ring-functor application. |
| SchemeKTheoryOperations | `TauCetiRoadmap/SchemeKTheoryOperations/README.md` §4.10 supplies perfect-scheme v-hyperdescent and its Tor-amplitude strata; §3.4 supplies K-theory with supports under noetherian completion. The new Perf theorem here is the arc upgrade on the same carrier. |
| DerivedModuleAlgebra | `TauCetiRoadmap/DerivedModuleAlgebra/README.md` §§0.2,0.4,0.7–0.8,0.11–0.12,0.14 and1.1–1.9 match the tensor/cotangent/completion inputs. At :1810 ordinary quotient towers require regular generators or the noetherian comparison; no unconditional replacement of derived completion is imported. |
| DerivedDeRhamCohomology | `TauCetiRoadmap/DerivedDeRhamCohomology/README.md` §§2.1–2.21 and2.22–2.26 supply the forms, differential, derived and Hodge-completed constructions. This package's h-sheafification and arc-descent are different targets. |
| PerfectoidSpaces | `TauCetiRoadmap/PerfectoidSpaces/README.md` §§P1.15,P1.20,P1.24–P1.25,P1.27,P2.2,P3.2,P3.9–P3.12,P3.20 retain the integral/Tate distinctions, compatible parameters and site-level tilting. At :5049 integral perfectoids use ordinary completeness and Fontaine's kernel; at :9976 tilting matches sites and coverings. |
| PerfectoidQuotients | `TauCetiRoadmap/PerfectoidQuotients/README.md` §§0.4–0.6 supply bounded torsion removal, completed ring operations and their tilts. The parameter-completeness and compatible-root conditions remain in the package. |
| AdicSpaces | `TauCetiRoadmap/AdicSpaces/README.md` Layers 0–1 supply Huber/Tate rings, completions and continuous valuations; Spa is in §2.1 at :358 (S04). No replacement analytic spectrum is defined in Suggested.lean. |
| AdicSpacesPartII | `TauCetiRoadmap/AdicSpacesPartII/README.md` §§R0.3,R0.9,R0.19.10,R1.3,R1.9 resolve tensors, affinoids, topoi, analytification and dimension. At :8039 the quasiseparated quotient criterion assumes an algebraic topos and a qcqs covering family; it does not itself assert coherence of sheafified site representables. |
| RigidAnalyticGeometry | `TauCetiRoadmap/RigidAnalyticGeometry/README.md:177–260`, §§1.1–1.3, supplies ideal closedness, complete presentations, finite injective normalization and completed affinoid tensors. These inputs justify the native strict-tft carrier and the dimension upper bound≤2d, including separate treatment of zero algebras. |
| ResolutionOfSingularitiesCharacteristicZero | `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md` §§5.1–5.2 supplies characteristic-zero principalization and embedded resolution for the reduced finite-type models used in §0.7. No positive-characteristic resolution is assumed. |
| GeneralAlgebraicKTheory | `TauCetiRoadmap/GeneralAlgebraicKTheory/README.md` §§8.5–8.6,10.9,10.12 supplies the exact low-degree Milnor sequence and nonpositive relative excision. It does not supply arbitrary higher integral K-excision. The package's abstract excision criterion does not restate these K-specific results. |

The four resolver leads were resolved manually: Arc.Cover.ofVCover is in PrismaticCohomology §2.0; Etale.artinSchreier_vanishing is in SchemeAndStackFoundations §2.11; Topos.isQuasiseparated_iff_of_cover is in AdicSpacesPartII §R0.19.10; sources.toml is a filename. None is a missing supplier.

All four gap slugs agree exactly between `packages/ArcTopologyAndDescent/design/plan.json` and the README contracts. Coherent-site representables add a theorem beyond the supplied quotient criterion; Perf Tannaka matches BH16 line 86, with the target qcqs and source arbitrary; constructible étale-space descent adds the missing general descent/equivalence interface; the perfectoid comparison extends the normalized integral model. Each has an earlier named supplier and explicit hypotheses. The deleted bounded-torsion gap occurs in neither current gap list. No missing-contract finding is raised merely because an agreed extension is not implemented.

The pins in `lake-manifest.json` agree with the README: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Representative definition-level checks, beyond name matching:

| Pinned location | What its definition actually guarantees |
|---|---|
| `Mathlib/RingTheory/Valuation/ValuationRing.lean:64`; `Mathlib/Algebra/Group/Units/Hom.lean:270` | ValuationRing explicitly assumes a domain; IsLocalHom reflects units. Neither “total divisibility” nor “preserves units” alone supplies the intended extension. |
| `Mathlib/RingTheory/Flat/TorsionFree.lean:92`; `Mathlib/RingTheory/Flat/FaithfullyFlat/Algebra.lean:60` | Bézout-domain torsion-free/flat comparison; flatness and a local map give faithful flatness over local rings. |
| `Mathlib/RingTheory/KrullDimension/Basic.lean:30`; `Mathlib/Topology/Spectral/Basic.lean:38`; `Mathlib/Topology/Spectral/Hom.lean:42` | KrullDimLE is a bound, admitting the zero ring. SpectralSpace includes T₀, compactness, quasi-sobriety and quasi-separatedness. IsSpectralMap preserves compact-open inverse images; it does not reflect openness. |
| `Mathlib/ModelTheory/Ultraproducts.lean:154`; `Mathlib/FieldTheory/IsAlgClosed/Basic.lean:78` | Łoś applies with the nonempty-structure context; algebraically closed root existence is a field theorem, not a domain-free aic-ring predicate. |
| `Mathlib/AlgebraicGeometry/Morphisms/Affine.lean:47`; `Mathlib/CategoryTheory/Filtered/Basic.lean:590`; `Mathlib/CategoryTheory/Limits/Cones.lean:373` | Affine inverse images, nonempty cofiltered indexing and postcomposition of actual cones. `Mathlib/AlgebraicGeometry/AffineTransitionLimit.lean` exists at the pin. |
| `Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean:39`; `Mathlib/CategoryTheory/Limits/Shapes/Pullback/IsPullback/Defs.lean:61`; `Mathlib/CategoryTheory/EffectiveEpi/Basic.lean:71` | Full subcategory with all induced morphisms, an actual limit square and effective descent of arrows constant on the relation. |
| `Mathlib/AlgebraicGeometry/Sites/AffineEtale.lean:59`, :140,:149; `Mathlib/AlgebraicGeometry/Sites/EtalePoint.lean:156` | Affine étale basis inclusion and sheaf equivalence, Grothendieck abelian sheaves and enough geometric points without a noetherian assumption. |
| `Mathlib/GroupTheory/Torsion.lean:54`; `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:56`; `Mathlib/CategoryTheory/Abelian/GrothendieckCategory/HasExt.lean:36` | Generated additive torsion predicate is elementwise finite order. H is ordinary Ext-defined sheaf cohomology with the supplied Ext structure. |
| `Mathlib/RingTheory/AdicCompletion/Basic.lean:56`, :171; `Mathlib/RingTheory/IntegralClosure/IsIntegral/AlmostIntegral.lean:26`, :86 | Ordinary completion's carrier is an inverse limit; IsAdicComplete adds separation. Almost integrality uses an arbitrary regular denominator; its cited integrality comparison additionally assumes noetherianity and preservation of nonzerodivisors. |
| `TauCeti/RingTheory/Huber/TopologicallyFiniteType.lean:133`, :150,:207,:273; `TauCeti/RingTheory/Huber/Restricted/GaussNorm.lean:164` | Strict finite type is an open quotient of a finite-variable completed unit-radius series algebra. The general predicate does not separately impose target completeness; complete-field Tate presentation and closed ideals supply it here. Identity and quotient theorems have the recorded hypotheses. |

Ownership searches also checked the underlying objects (Milnor squares, spectral submersions, finite-ideal complete arc, valuation products, perfect complexes, formal glueing and affinoid vanishing), not only these names. The related open work either supplies the named earlier interface, concerns a different coefficient/category domain, or consumes the result. No move to a later supplier is required.

The read-only dependency command returned exit status0 and exactly:

```text
depcheck: 149 roadmaps, 1010 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The internal §1.6-before-§1.4 order is now explicit. The read-only diff against origin/main contains ten changed files, all under `packages/ArcTopologyAndDescent/` (3,314 insertions, eight deletions). The acceptance file has the allowed Mathlib import and one existing, used Tau Ceti module; no lemma declarations, set_option, admitted data, free-condition placeholders, admitted examples or computational algorithm targets were found. No instruction in source or repository text was executed as authority.

## Not verifiable

- HUB96 Corollaries3.2.2,4.2.7 and Theorems3.2.9–3.2.10 remain settled as uncertified. Their supplier interfaces and readable uses in BM21/BS22 were inspected; the book's wording and pages were not independently certified. No repeat source request was made.
- No fresh Lean elaboration or build was run under the read-only restriction. The supplied ten elaborated signatures were checked; this does not certify future proofs of the admitted theorems.
- The four declared supplier extensions remain conditional contracts. Their owners, hypotheses, minimality and matching slugs were checked; their future implementations were not certified.
- Ownership was searched across the mandated open-head index and relevant available sibling files. Unspecified or unindexed future work was not checked. Existing-roadmap revision heads were not substituted for main when resolving suppliers.

## Source issues

- **Misprint** in BM21 at Definition3.26, printed p.22 (BM21 line 922): the source says every monic polynomial has a root, including constant1; it should be every positive-degree monic polynomial; affects a stated result.
- **Misprint** in BM21 at Remark3.31, printed p.23 (BM21 line 977): the source says Proposition3.29 supplies the valuation-product cover; it should be Proposition3.30, with Lemma3.27 identifying ultraproduct components; affects nothing.
- **Error** in BM21 at Lemma4.3, printed p.25 (BM21 line 1040): the source says pW contracts to p for every map V→W with pW proper; it should be require ker(V→W)⊆p; affects a stated result.
- **Gap** in BM21 at proof of Lemma4.4, printed pp.26–27 (BM21 line 1080): the source says the prime-extension lemma applies whenever pW is proper; it should be handle p strictly below the kernel separately, when both localization tensors vanish; affects the proof.
- **Error** in BM21 at Definition4.6, printed p.27 (BM21 line 1112): the source says interval rings of an arbitrary valuation ring are absolutely integrally closed; it should be assume the original valuation ring absolutely integrally closed or omit that adjective; affects a stated result.
- **Misprint** in BM21 at proof of Theorem5.6, printed p.40 (BM21 line 1669): the source says a rank-n valuation spectrum has n vertices; it should be n+1 vertices indexed0 through n; affects the proof.
- **Error** in BM21 at proof of Theorem5.6, printed p.40 (BM21 line 1672): the source says use a functor category into finite sets and injections; it should be use the full finite-set diagram subcategory with injective object transitions and arbitrary natural transformations; affects the proof.
- **Misprint** in BM21 at Example6.1, printed p.47 (BM21 line 1942): the source says horizontal-map fibres compute supported K-theory; it should be vertical localization-map fibres; affects the proof.
- **Misprint** in BM21 at proof of Theorem6.25, printed p.55 (BM21 line 2310): the source says the special-fibre kernel is nilpotent; it should be nil, which its elementwise argument proves and universal homeomorphism needs; affects the proof.
- **Misprint** in BM21 at proof of Lemma7.8, printed p.58 (BM21 line 2458): the source says the minimum generator absolute value is positively bounded below; it should be the maximum, as generators(X,1) at zero show; affects the proof.
- **Misprint** in BS17 at Example2.3, printed p.5 (BS17 line 206): the source says the valuation centred at the deleted exceptional point cannot lift to the full blowup; it should be cannot lift to the punctured blowup; affects a stated result.
- **Misprint** in BS22 at proof of Theorem9.1, footnote15, printed p.72 (BS22 line 2807): the source says algebraically closed residue fields suffice for splitting arbitrary finite covers of valuation factors; it should be algebraically closed fraction fields, as in the chosen basis; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "64797efe5f134a96a2ae41dbd2075bde016fd8e9", "job": "RT-ArcTopologyAndDescent~2a", "model": "gpt-6-astra", "worker": "chris-4"} -->
