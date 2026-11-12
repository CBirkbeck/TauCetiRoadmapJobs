<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13169#issuecomment-6785884962 -->
Review (codex) of 27f65e9

Verdict: needs_changes

1. **F01** (P1) The displayed character does not exist on ℚ_p

   **Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:334`, Layer 0 Examples: “For G = ℚ_p … the integration map of the character a ↦ (1 + p)^a”.

   **Claim:** The sentence uses an E-valued character on all of the additive group ℚ_p with value 1+p at 1. The standing coefficient hypotheses allow E=ℚ_p. This is false even as an abstract character, independently of continuity or analyticity.

   **Witness:** Set p=3 and E=ℚ₃. A character would give x=χ(1/3) with x³=χ(1)=4. Then v₃(x)=0, but unit cubes modulo 9 are 1 or 8, never 4.

   **Exact repair:** Keep the countable-direct-sum statement for G=ℚ_p. Put the integration example in a separate sentence for G=ℤ_p, p odd, and a∈ℤ_p, where the binomial character a↦(1+p)^a exists. Add the ℚ₃ example above as a negative control against extending its domain to ℚ_p. This repairs the example without narrowing the distribution-algebra theorem. The repaired example has χ(0)=1, χ(1)=4, χ(2)=16, χ(1+1)=χ(1)², and evaluation of δ_a gives these values. The other occurrences in §§0.2, 0.5 and 2.5 are restricted to the appropriate compact analytic domain; this broadening occurs in the layer example.

2. **F02** (P2) The ordered Bernstein maps have incompatible domains

   **Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:109`: “maps 𝒥_w from the Bernstein centre … to the functions on the parameter torus … satisfy 𝒥_(w_2) ∘ p_(w_2w_1⁻¹) = 𝒥_(w_1)”. The formula is used again at line 1359, §8.8.

   **Claim:** The gap describes algebra maps Z→O(T_w), but composes them in the order appropriate to geometric maps T_w→Spec Z. A permutation of parameter spaces cannot be followed by that algebra map. Interpreting the permutation as pullback still gives the wrong order. Consequently the differential invoked by the proof route does not yet have a specified, consistent source and target.

   **Witness:** DING25 line 1594 defines 𝒥_w:T_w→Spec H, with T_w the ordered product of character tori. Lines 1597–1601 print a separate composition misprint. CEGGPS line 1921 identifies the centre with invariant functions, reversing arrows on spectra.

   **Exact repair:** Describe the contract geometrically: T_w=∏_i Spec H_(w⁻¹(i)), 𝒥_w:T_w→Spec Z, and p_u:T_(w_1)→T_(w_2), u=w_2w_1⁻¹, sending (χ_i) to (χ_(u⁻¹(i))). Then retain 𝒥_(w_2)∘p_u=𝒥_(w_1), with differentials at the corresponding ordered points. If ring maps are also stated, write 𝒥_(w_1)^*=p_u^*∘𝒥_(w_2)^*. Use these same domains in §8.8 and record the source composition slip under Source corrections. No new gap is needed: the existing plan entry has the geometric-order formula and does not impose the erroneous ring-map direction.

   The repair was tested with n=3, u=(123), and unramified parameter values (2,4,8) over ℚ₃, which are generic. The permutation gives (8,2,4). The elementary symmetric coordinates on the Bernstein quotient are (14,56,64) on both tuples. The infinitesimal deformation of the first coordinate 2(1+ε) moves to the second coordinate; its quotient tangent is (2,24,64) in both descriptions. Thus d𝒥_((123))(ψ₂)=d𝒥_1(ψ₁), exactly the required ζ identity. The original ring/space composition has no value on this instance.

Two new findings: one P1 and one P2. Six findings from round 3 are repaired. The other two were marked not actionable in this package; their reasons withstand the checks below, so they are not re-raised. No package mathematics or source-manifest entry was changed during this review.

## Verified sound

### Previous findings, checked before the new pass

Locations in this table are in `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md` unless stated otherwise. The quoted passages are the repaired text, not quotations from sources.

| Round-3 finding | Repaired passage and location | Status and verification |
|---|---|---|
| F01, noncompact nonreflexivity | Line 285: “Only the product topology of C^an(G, E) is used, no duality property of it” | **Repaired.** For discrete ℤ the dual is E^(ℤ), its dual is E^ℤ, and the evaluation bidual map is the identity; no false nonreflexivity assertion remains. The new Check distinguishes reflexivity from compact type. |
| F02, one unipotent translate | Line 432: “Otherwise replace x by n·x − x ≠ 0” and “a linear combination of translates of x” | **Repaired.** In Sym², u(t)e₁e₂=e₁e₂+t e₁², while (u(t)−1)e₁e₂=t e₁². This works for nonzero arbitrarily small t also at p=2. Connectedness is explicit at line 430; the added Zariski-density argument uses the named analytic-dimension supplier. ST01 lines 539–558 support the successive-difference route. |
| F03, nonsplit endpoint of O | Line 817: “on which 𝔥 acts diagonalisably with eigenvalues in k” | **Repaired.** The ℚ₃-module with t²=3 has dimension 2 and sum of ℚ₃-weight spaces 0; after adjoining √3 it has two weight lines. It is now excluded, rather than identified with an object of O. |
| F04, wrong group acting on the smaller disc | Line 743: “works with the group M_r alone at stage r”; “form the finite induction from M_r to M_0” | **Repaired.** Translation by 1 does not preserve 2ℤ₂. One connected analytic disc has 2 idempotents; its induced two-disc space has 4. The repair uses the latter only for Shapiro and retains M_r for the single-disc comparison. |
| F05, unrestricted small-prime theorem | Line 1010: “there is no restriction for GL_n”; non-A restriction remains | **Not repaired; settled as not actionable in this package.** The repair report identifies an open general theorem and requests a human scope decision. OS15 lines 117–122 distinguish the proof restriction from a counterexample. I found no evidence invalidating that reason; I do not certify an all-prime non-A irreducibility theorem or re-raise the settled finding. |
| F06, category-O duplication at Springer head | Line 13: “This roadmap is the single owner of category O over split reductive Lie algebras” | **Partly repaired globally; settled as not actionable here.** ORDER places this package at 253 and Springer at 258. At #1828, `TauCetiRoadmap/SpringerResolutionAndCharacteristicCycles/README.md:1214`, 1216 and 1222 still construct the common modules/classification. The needed import is an edit to that later roadmap. The package's ownership boundary is explicit and the proposed repair there has the correct direction. |
| F07, three wrong pages | Line 835: “Introduction, p. 3”; line 1014: “Lemma 2.1, p. 8”; line 1535: “arXiv v2 pp. 45–46” | **Repaired.** OS15 lines 98–114 precede the p.4 marker; BR16 line 321 is between the p.8 and p.9 markers; DING25 lines 1820–1853 cross the p.46 marker. The related §8.14 range is pp.42–43, and Breuil's §2 starts on p.6. |
| F08, missing definition APIs | E.g. line 1539: “ζ_(F_P) is E-linear: additive in the tuple of classes and compatible with scalars, not multilinear.” | **Repaired.** Explicit prose API lists are present in all 14 identified sections: 3.1, 4.3, 4.4, 5.2, 5.4, 8.1, 8.3, 8.5, 8.7, 8.13, 8.14, 9.3, 9.5, 10.2. Their changed assertions were recomputed, including the tensor filtration and maximal-parabolic direction. |

I searched the remainder for the repaired patterns: noncompact/reflexive claims, single-translate highest-weight arguments, split versus semisimple Cartan actions, full-group actions on small discs, the three locator patterns, and missing API lists. R01 is a separate domain error in an unchanged example; R02 is a separate domain/variance error in a supplier contract and its consumer.

### Seeded source sample and repaired locators

All 15 sampled targets were read against the cached primary texts. Page numbers below refer to the versions identified in the README: arXiv pages when specified there, printed pages for SCH11/BHS19, and the pagination of the cited author copies for Emerton/Breuil. The checks include hypotheses and normalisations, not just theorem-number matches. HUM08, SCHN11 and NFA02 remain the three settled uncertified works; their contents are not asserted to have been read.

| Target | Source passage read | Verification |
|---|---|---|
| 0.4 noncompact D(G,E) | ST02 line 330, Proposition 2.3 p.9; line 514, Lemma 3.1 p.13; BR16 line 377, proof of Lemma 2.2 p.9 | Product of analytic-function spaces, strong-dual direct sum, convolution and Dirac density support the construction. Separately continuous multiplication is retained; a noncompact algebra is not called Fréchet. R01 concerns its layer example, not this theorem. |
| 0.6 compact-type duality | ST02 line 553, Corollary 3.3 p.14 | Compact-type/nuclear-Fréchet duality uses the strong dual, contragredient action and separately continuous distribution-module action. It is not a duality on arbitrary locally convex spaces. |
| 1.3 noncompact anti-equivalence | ST03 line 1256, Theorem 6.3 at line 1333, pp.31–34; noncompact extension in the surrounding discussion | Compact-open coadmissibility and the canonical nuclear Fréchet topology supply the noncompact formulation. The compact input is imported; the noncompact module/action comparison is local work. |
| 1.6 locally algebraic representations | ST01 line 519, Proposition 3.4 pp.13–14, proof at line 539; ST03 line 1416, Theorem 6.6 pp.35–36; EM17 lines 4370, 5643, 6094, 6163, 6196, Propositions 4.2.10, 6.1.5, 6.3.2, 6.3.6, 6.3.10 | Split connected group and absolute irreducibility are retained. Closedness is the compact-type claim; finest topology/admissibility use admissible V. The corrected proof uses differences, not a single orbit point. |
| 1.9 dual numbers/tautological extensions | DING25 lines 1458–1465, §3.1.1 p.36 | ε is quotient followed by inclusion, so ε²=0; the tautological extension has quotient V₁⊗U and subobject V₂. The finite-dimensional Ext hypothesis is present. |
| 3.3 Banach analytic-group equivalence | BCGP25 line 1039, Remark 2.2.19 p.22 | The quasi-compact analytic-group hypothesis is retained in the Banach action/coaction equivalence; the more general Stein case is not silently substituted. |
| 4.2 O, O^p, O^p_alg | OS15 lines 275–342, §2.5, Definition 2.6, Example 2.7 and Lemma 2.8, pp.7–9 | The source's finite coefficient field is not algebraically closed. The package repairs the nonsplit-weight defect explicitly; its category-O inclusion and algebraic-weight criterion now agree. |
| 4.6 Kostant homology | SCH11 lines 1776–1804, Corollary 4.9 and (4.40)–(4.42), printed p.82 | Homology/cohomology dualisation and opposite-nilradical weights agree with the GL₂ computation below. General split reductive cohomology is a declared ALS supplier gap, not attributed to the GL₃ paper. |
| 5.2 principal series | BR16 line 349, Lemma 2.2 p.9; line 446, Corollary 2.5 pp.11–12; OS10 line 434, Theorem 3.1.3 p.13 | Unnormalised induction, W′ in the annihilator construction and the locally algebraic socle agree. OS10's locally L-analytic criterion is not used as an unrestricted ℚ_p-analytic theorem. The GL₂ special case is imported by name. |
| 7.4 Emerton adjunction | EMJ2 line 142, Theorem 0.13 p.4; line 2761, Corollary 4.3.3 p.58; balancing condition near line 101 | Balanced maps, closed induction and the U⊗δ_P twist are present. The theorem is not an unrestricted adjunction for the full locally analytic induction. |
| 7.6 Breuil adjunction | BR15 lines 518, 530, 596 and 650, Proposition 4.2, Theorem 4.3, Remark 4.4 pp.13–16; BHS19 lines 3702 and 3716, (5.9), Lemma 5.2.1 pp.391–392 | BR15's sum action is converted to the package's averaged action. This accounts for π_P⊗δ_P⁻¹ on the induced side. Algebraic dual and very strong admissibility hypotheses are retained. |
| 8.8 self-extensions | DING25 line 1539, Proposition 3.3 and diagram (3.5), pp.38–40; CEGGPS line 1921, Lemma 3.22 p.47 | Dimension n+d_L and the Weyl transition agree. R02 repairs the ring/space direction of the proof input; DING25 line 1597 has its own ill-typed composition. |
| 8.10 ζ maps | DING25 lines 1641–1658, (3.10)–(3.11), Proposition 3.6, Remark 3.7 p.41; lines 1667–1670, (3.13) p.42 | Push-forward, actual ζ_w, injectivity of each map and surjectivity of the sum are distinguished. The sum is not claimed to be an isomorphism. |
| 8.11 Ext¹(π_alg,PS₁) | DING25 line 1646, Proposition 3.6 p.41; line 1692, Remark 3.9 p.42 | Full locally ℚ_p-analytic Hom has dimension n(1+d_L). The H₁ weight mismatch used in the route is checked below. |
| 9.3 π_(F_P), Ext¹_(F_P) | DING25 lines 1792–1818, (3.21)–(3.24), Proposition 3.11 pp.44–45 | The subrepresentation, subset labels, push-forward image and dimension formula use the specified P-filtration. P=B and P=G recover the previously constructed objects. |
| Changed 4.3, 6.1, 8.14, 9.5 locators | OS15 lines 98–114 p.3; BR16 lines 229 and 321 pp.6,8; DING25 lines 1704–1723 pp.42–43 and 1820–1853 pp.45–46 | Page markers verify the repaired ranges. The tensor-extension construction has one B-factor, as the package corrects, not all but one. |

The 29 manifest works match the reference list: 26 certified and 3 settled uncertified. There is no additional author-flagged unverified locator outside those settled works. No new source was fetched, no existing manifest entry was rewritten, and no missing-source request is needed.

### Computed adversarial table

All 86 numbered subsections, their API statements and Checks were read. For untouched mathematics I also used only the explicit-valued rows of round 3's adversarial table; bare statements that something was sound were not treated as evidence. The table below records the new calculations for the seeded sample, headline results, changed passages, both findings and convention controls. Finite examples test the statements and exclude wrong models; they are not substitutes for proofs of the general theorems.

| Statement | Instances tried | Values computed on both sides, or for the wrong model | Result; change |
|---|---|---|---|
| Fields, 0.1 | L=ℚ₂(√2), E splitting; trivial group | √2⊗1 maps to (√2,−√2), two distinct coordinates; dimensions 2=2. Trivial Lie algebra has dimension 0=0 | Characteristic-zero splitting retained |
| Group/action convention, 0.2 | S₃ acting on E³ | ρ(12)ρ(23)e₃=e₁; reversed order gives e₂ | Nonabelian order distinguished |
| Derivative/dual, 0.3 | χ(a)=(1+p)^a on ℤ_p, p odd; χ=1 | Derivatives log(1+p), −log(1+p) on primal/dual; trivial derivative 0 | Correct opposite sign |
| 0.4 distribution algebra | Discrete ℤ, H=1; finite S₃ | C^an=E^ℤ, D=E[t,t⁻¹]; δ₁δ₂=δ₃. In E[S₃], δ_(12)δ_(23)=δ_(123), reverse product δ_(132) | Sum/product and order distinguished |
| 0.4 conjugation | GL₂, g=diag(p,1), upper root vector e | g e g⁻¹=p e; inverse convention gives p⁻¹e | Compatible with enveloping-algebra supplier |
| Layer 0 example, R01 | G=ℚ₃, E=ℚ₃, a=1/3 | Required x³=4; unit cubes modulo 9 are {1,8}. On ℤ₃ repaired χ(0),χ(1),χ(2)=1,4,16 | False domain; split the examples |
| 0.5 integrated module | Trivial E, δ_g−δ_1 | δ_g and δ_1 each act by 1; their difference acts by 0 | No false faithfulness claim |
| 0.6 duality | G=1, V=0,E²; χ(x)=x on ℚ_p^× | Bidual dimensions 0=0, 2=2, evaluation matrix identity; dual χ(p)=p⁻¹ versus p | Strong contragredient duality correct |
| 0.7 repaired continuity | G=ℤ discrete, G=C₂, λ=0 | E^ℤ dual E^(ℤ), bidual E^ℤ; C₂ gives E²; F_0=0. Infinite sum is not metrizable | Product continuity does not need blanket nonreflexivity |
| 0.8 weak-null test | e_n,p^n e_n in c₀ | Norms 1, |p|^n; bounded constant-coordinate functional values 1,p^n | Weak and norm controls agree |
| 0.9 and 1.5 tensor | E²,E³; zero; trivial tensor unit | Dimensions 6=2·3, 0=0·3, dim(V⊗E)=dim V | External tensor; no diagonal admissibility overclaim |
| 1.1 noncompact coadmissibility | G=ℤ, H=1 | E has compact-open module rank 1; E[t,t⁻¹] has infinite E-dimension | Correct local finiteness test |
| 1.3 anti-equivalence | Finite C₂ and S₃; inclusion E→E² | Dual map E²→E rank 1; source/target dimensions reverse 1,2 to 2,1 | Correct variance, not arbitrary dual data |
| 1.4 strictness | Zero map E²→E³ | Kernel 2, image 0 closed, cokernel 3 | Exact-category conventions consistent |
| 1.6 repaired route | Sym², v=e₁e₂, including p=2 | u(t)v=e₁e₂+t e₁² has mixed coefficient 1; difference t e₁² has mixed coefficient 0, nonzero for t≠0 | Repair excludes single-translate model |
| 1.6 density/topology | Open units of ℚ_p(√p); trivial c₀ | Open-unit dimension 2=dimension Res 𝔾_m; on c₀, p^n e_n→0 but Hamel functional value 1 | Connectedness and admissibility do work |
| 1.7, 1.8 Ext | Finite S₃ over ℚ₂; T=(ℚ₂^×)^n, n=0,1,2 | Averaging uses 1/6∈ℚ₂; Ext¹=0, only split class. Torus Hom dimensions 0,2,4 | Residue characteristic is not coefficient characteristic |
| 1.9 dual numbers | Split extension V⊕V; rank-one ψ; U=0 | ε(a,b)=(0,a); ε²=0; ker ε=im ε={0}⊕V. χ(1+ψε) multiplies with ε² coefficient 0; U=0 leaves V₂ | Correct free dual-number structure and tautological direction |
| 2.1 nonunitary Banach | χ=x on ℚ_p^× | ℤ_p^× preserves O_E, but pO_E≠O_E; compact dual generator count 1 | Nonunitary global case retained |
| 2.3–2.5 strong LA headline | Finite group, uniform open subgroup 1; C(ℤ_p,E) | H⁰=B, H^i=0 for i>0, positive-degree transition maps 0; regular Banach analytic vectors C^la, higher R^iLA=0 | Stagewise and derived vanishing consistent |
| 3.1 added API | c₀, E^ℕ | c₀ dual coefficients have bounded denominators, excluding p^(−n); product dual has finite support | Banach/Smith and Fréchet/LS roles separated |
| 3.2 action/coaction | Trivial line and weight k | Counit gives v, iterated coaction 1⊗1⊗v; zero coaction gives 0; character gives x^k | Counit excludes zero structure |
| 3.3 Banach equivalence | Analytic group 1, V=E² | D=E; Hom(E,E²)=E²=E⊗E²; action and coaction identities | Quasi-compact test succeeds |
| 3.7 Grothendieck headline | M=1, S=point; E^m→E^(m+1) | Hom(E,E²)=E²=V(S); kernels 0 before/after colimit; colimit ⊕_ℕE | Generator/exactness control succeeds |
| 3.8 repaired comparison | M₀=ℤ₂, M_r=2ℤ₂; trivial V | 1+0 lies outside small disc; disc idempotents 2, induced two-disc idempotents 4; H⁰(M_r,O(𝔾_r))=E=Pan H⁰ | Correct group at each stage |
| 3.8 residual action | Analytic character χ, f(g)=χ(g)v | Right translation at h gives χ(h)v; double-twisted wrong action gives χ(h)²v | Residual action consistent |
| 4.1 reductive adapter | Torus; sl₂ at weight 0 | Torus Verma=simple, dimension 1; sl₂ M(0) has L(0),L(−2), each once | Not duplicate of arbitrary reductive native carrier |
| 4.2 repaired O^g | ℚ₃[t]/(t²−3); det⊕Sym² for gl₂ | Dimension 2 versus k-weight sum 0; after scalar extension two lines. det⊕Sym² weights (1,1),(2,0),(1,1),(0,2) | Nonsplit simple excluded; split example included |
| 4.3 added maximal-parabolic API | gl₃ λ=(2,0,1); gl₂ λ=(0,2); P=G | Pairings 2,−1 give I={α₁}, so b,p_(α₁) included, p_(α₂),g excluded; gl₂ I=∅; M_G(W)=W | Both directions of the criterion tested |
| 4.4 added dual API | gl₂ highest weight (1,0) | Restricted BGG dual retains (1,0), contragredient highest weight is (0,−1); top M=L(λ)=soc M^∨ | Dualities distinguished |
| 4.6, 5.4 homology | GL₂ Sym^k; P=G | Lower H₀ weight (k,0), H₁ (−1,k+1); upper H₀ (0,k), H₁ (k+1,−1). N=1 gives H₀=V, higher 0 | Signs and added functorial API consistent |
| 5.2 principal series | G=T, χ(1+ψε); GL₂ inducing 1; λ=(0,2) | Rank-one induction is χ(1+ψε), extension class ψ; smooth Ind 1 has factors 1,St, length 2; nondominant λ has no finite-dimensional algebraic highest-weight module | Full/generalised principal series not assumed irreducible |
| 5.5 Schraen headline | P=G; GL₂ Σ=1, ρ=z^(0,2) | N=1 leaves only H₀=Σ. GL₂ lower homology weights (0,0),(−1,1), both different from (0,2), so corresponding Ext terms 0 | Degeneration and weight separation agree |
| 6.1, 6.2 construction/exactness | Torus; 0→E→E²→E→0 | Relation kernel 0, F equals induction, dimension 1; contravariant dimensions 1←2←1 and ranks 1,1 | No rank-zero properness or variance defect |
| 6.3 transitivity | Raw GL₂ ratios 1,ν,ν⁻¹,ν⁻² | Normalised ratios ν,ν²,1,ν⁻¹ give reducible, irreducible, irreducible, reducible | Raw exceptional set {1,ν⁻²} agrees |
| 6.4, 6.5–6.6 headlines | Torus inputs 0,1; generic GL₂ over degrees 1 and 2 | Zero smooth inputs both yield 0; nonzero inputs distinguish weights 0,−1. Generic product length 2·4=8; nongeneric example 3·4=12 | Nonzero/generic hypotheses retained; settled small-prime limitation not erased |
| 7.1, 7.4, Jacquet normalisation | GL₂(ℚ₂), m=diag(2,1), V=1, U=δ_B⁻¹ | Index 2, δ_B(m)=1/2, average (1+1)/2=1; Uδ_B=1; matching Hom dimensions 1 and 1 | Supplier and local conventions match |
| 7.3–7.4 adjunction | G=T, U=V=χ; unequal χ,χ′ | U(g)⊗_(U(g))U=U; balancing identity; matching Hom dimensions 1=1, unequal 0=0 | Closed induction/balancing, not full unqualified induction |
| 7.6 Breuil adjunction | GL₂ trivial Π,W; torus weight k | Averaged action 1 versus sum p; smooth π=δ_B gives πδ_B⁻¹=1, both Hom dimensions 1. Torus dual weight −k matches on both sides | Inverse modulus and algebraic dual correct |
| 8.1, 8.3 added APIs | n=2,h=(1,0); swap a forbidden ratio | θ=(0,−1), λ=(1,1), s·λ=(0,2); both ordered ratios ν,ν⁻¹ occur, so swap remains nongeneric | Symmetry and weight conventions agree |
| 8.5 labels/count | n=1,2,3; w=(123), w′=(23)w, i=1 | Counts 0,2d_L,6d_L; inverse images both {3}, forward images {2},{3} | Corrected source labels distinguish wrong permutation |
| 8.7 added API | n=2,d_L=1 | PS₁ length 2, π₁ length 1+2=3; common socle counted once | Amalgam construction consistent |
| 8.8 self-Ext | (n,d_L)=(1,1),(2,1) | Dimensions n+d_L=2,3; smooth dimensions 1,2, determinant-log complement 1 in each | Correct local-algebraic space |
| 8.8 map direction, R02 | n=3, cycle (123), values (2,4,8) | Permuted values (8,2,4); symmetric coordinates (14,56,64) on both; log-coordinate tangent (2,24,64) on both | Geometric composition works; original mixed composition ill-typed |
| 8.10 ζ_w and sum | n=2,d_L=1; n=1 | Two Hom spaces total dimension 8, image dimension 5, kernel 3; for n=1 a single map is identity | Each ζ injective, sum only surjective |
| 8.11 headline | n=2,d_L=1,2; λ=(1,1) | Hom dimensions 4,6 equal Ext dimensions 4,6; reflected H₁ weight (0,2) differs from (1,1), unwanted Hom 0 | Claimed bijection consistent |
| 8.12 headline | (n,d_L)=(1,2),(2,1),(3,1),(3,2) | n+d_L+(2^n−2)d_L=n+(2^n−1)d_L gives 3,5,10,17 on both sides | Full subset indexing essential |
| 8.13, 8.14 added APIs | n=2,d_L=1 | π=π₁ length 3; Ext filtration dimensions 2⊆3⊆4, two w-spaces span dimension 5 | No excess socle or equality of all subspaces |
| 9.1 Levi singleton | Blocks (2,1), ordered characters (φ₃,φ₁,φ₂) | Singleton positional index 3 and character φ₂ give φ₂z^(h₃); source positional index 2 gives a different weight | Corrected source index and grade distinguished |
| 9.3 sampled definition/API | n=3, blocks (2,1), d_L=1; P=B,G | Labels {1},{2},{1,2}, count 3, π_(F_P) length 4, Ext dimension 3+1+3=7. Endpoints count n−1 and 2^n−2 | Endpoints and subset condition agree |
| 9.5 changed tensor API | Three factors dim A_i=1, dim B_i=2; one factor | Degree-one kernel dimension 2+2+2=6, wrong reversed kernel 4+4+4=12. One-factor kernel B₁, map identity | Correct first-order tensor quotient |
| 9.5 additivity | Two extension classes, both doubled | Additive map doubles output; multilinear alternative quadruples | Added E-linearity is correct |
| 9.6 parabolic headline | n=3, blocks (2,1), d_L=1 | Source (2+3)+(1+1)=7; target 3+2+2=7 | Bijection dimensions and block data agree |
| 9.7 endpoint headline | n=2,3, d_L=1; n=4 Levi types | 4+4−3=5 and 7+7−4=10; for n=4, endpoint Levi types (3,1),(1,3), whereas P₂ has type (2,2) | Common subspace subtracted once |
| 10.2 added embedding API | n=2,d_L=2; d_L=1 | One σ-part length 1+2=3; amalgam 1+2·2=5. For d_L=1 the part equals π₁ | Full and single-embedding objects separated |
| 10.5 decomposition headline | n=3,d_L=2 | Smooth dimension 3; each σ-space dimension 10; amalgam dimension 3+2(10−3)=17=3+7·2 | Shared smooth subspace retained once |
| 10.6, 10.7 headlines | σ-part, blocks (2,1); endpoints n=2,3 | Fixed-σ parabolic dimension 7; endpoint dimensions 4+4−3=5, 7+7−4=10 | Parabolic and embedding specialisations agree |

The standing domains exclude zero coefficient rings, equal-characteristic or characteristic-p coefficient fields, and inseparable extensions; these are not silently included in a Lean signature. Residue p=2,3 remains allowed where the theorem permits it. GL_n application layers use n≥1; the rank-zero torus calculation in §5.3 separately returns 0, not 1. Tensor/Ext formulas avoid division by zero; Hecke averages divide by a positive finite index in characteristic zero. Arbitrary data are not substituted for the defined π, Jacquet or induction objects.

### Library and acceptance-test audit

`Suggested.lean` has 51 lines, one `import Mathlib`, one module docstring, the required namespace, and **zero declarations**. There are no `sorry` data, options, placeholders, catalogue lemmas, examples, or own backticked API names falsely claiming a Lean declaration. The README's backticked library names were resolved at the pins. Its remaining code spans are notation, file names or supplier names, not invented local declarations.

The prescribed `lake env lean` elaboration was run from the content checkout against the absolute package-file argument. It exited **0 with no output and no warnings**. There is no TauCeti import requiring an object-file build. The exhaustive one-tactic probe has **0 sorried theorems** as inputs; the exhaustive `#check @name` signature comparison likewise has **0 local declarations**. No probe theorem was invented to pad either test. No statable headline was found missing or replaced by a stand-in.

These declarations and their surrounding binders were opened at the pins, rather than inferred from names:

| Pinned file and line | Object and scope checked |
|---|---|
| `Mathlib/CategoryTheory/Abelian/Ext.lean:41` | Root `Ext`, R-linear abelian category with enough projectives; does not construct a locally analytic category. |
| `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118` | `CategoryTheory.Abelian.Ext`, with `HasExt` at line 113; abstract derived-category Ext. |
| `Mathlib/Algebra/Category/ModuleCat/Basic.lean:59` | `ModuleCat` fields include “carrier : Type v”, “isAddCommGroup” and “isModule”; no topology, completeness or representation condition. |
| `Mathlib/RepresentationTheory/Continuous/TopRep.lean:31` | `TopRep` has topological additive/scalar structures and “ρ : ContRepresentation k G V”; no Hausdorff, compact-type, analytic-orbit or admissibility field. |
| `Mathlib/Analysis/LocallyConvex/Barrelled.lean:90`, 122, 164, 192 | `BarrelledSpace`, Baire instance, `WithSeminorms.banach_steinhaus`, `PolynormableSpace.banach_steinhaus`: nontrivially normed fields include E. |
| `Mathlib/Topology/Algebra/Module/LocallyConvex.lean:51` | Native `LocallyConvexSpace` uses ordered scalars. It is not the missing O_E-lattice/native-barrel comparison. |
| `Mathlib/Algebra/DualNumber.lean:46`, 50 | `DualNumber`, `DualNumber.eps`: actual trivial square-zero extension, not opaque coefficient data. |
| `Mathlib/Algebra/Lie/UniversalEnveloping.lean:65`, 92 | `UniversalEnvelopingAlgebra`, `lift`: the algebra/universal property, not category O or analytic induction. |
| `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:131` | `continuousCohomology` on continuous cochains/TopRep; no p-valued analytic-stage functor. |
| `Mathlib/Geometry/Manifold/Algebra/LieGroup.lean:72` | Native Lie-group carrier can express analytic group laws; it does not supply analytic representation categories. |
| `Mathlib/Topology/MetricSpace/Ultra/Basic.lean:47` | `IsUltrametricDist` supplies the ultrametric inequality; it does not add separation or local convexity. |
| `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145` | `TauCeti.completedGroupAlgebra`: integral profinite inverse-limit algebra, not D(G,E). |
| `TauCeti/Algebra/Lie/HighestWeight/Verma.lean:195`, 525; binders at 140 | `TauCeti.VermaModule`, `irreducibleQuotient`: finite-dimensional Killing Lie algebra, characteristic zero and Cartan/triangular data. The general reductive/parabolic category is additional. |
| `TauCeti/NumberTheory/Padics/Distribution/AnalyticStage.lean:107` | `TauCeti.AnalyticStage`: one-variable Banach coefficient stages on ℤ_p. |
| `TauCeti/NumberTheory/Padics/Distribution/LocallyAnalytic.lean:45`, limitation at 31 | `TauCeti.LocallyAnalytic`: algebraic direct limit, explicitly without a topology. It does not supply general manifold functions or distribution algebras. |

Object searches at both pins for coadmissibility, Fréchet–Stein algebras, Orlik–Strauch functors, analytic representation categories, Jacquet functors and parabolic category O returned no implementation. These absence checks were combined with the positive near-carrier inspections above; they were not just same-name searches. The library-matches input contains zero local declarations, consistently with this file.

| Headline from the README summary | Where the Lean docstring identifies the obstruction |
|---|---|
| Noncompact Schneider–Teitelbaum anti-equivalence and Breuil Ext¹ classification (§§1.3,1.8) | Lines 11–23: missing topologised general analytic functions, D(G,E), locally analytic representations and coadmissible category. |
| Pan strong LA-acyclicity (§2.5) | Lines 24–27: p-valued-group Banach analytic stages and admissible Banach category. |
| Smooth-solid Grothendieck property and derived analytic-vector comparison (§§3.7–3.8) | Lines 28–31: analytic E-ring, solid E-spaces and solidified group rings. |
| Schraen spectral sequence (§5.5) | Lines 32–37: locally analytic induction and topological nilradical homology. |
| Orlik–Strauch irreducibility and Jordan–Hölder theory (§§6.4–6.6) | Same bullet: actual parabolic O and Orlik–Strauch functor, beyond native Killing Verma modules. |
| Emerton and Breuil adjunctions (§§7.4,7.6) | Lines 38–40: analytic Jacquet, closed induction and very strong admissibility. |
| ζ_w isomorphisms and full Ext dimension (§§8.11–8.12) | Lines 41–46: actual π_alg, π₁, principal-series and Ext carriers. |
| Parabolic ζ_(F_P) isomorphisms/amalgamation (§§9.6–9.7) | Same application bullet: parabolic maps and the preceding unavailable representations. |
| Decomposition over embeddings and its parabolic specialisations (§§10.5–10.7) | Same bullet: embeddingwise Ext decomposition on those actual carriers. |

The README's category-O layer is supporting theory, not replaced by a theorem on arbitrary modules; the summary's deep analytic/application results cannot be made into honest statements merely by introducing a free predicate or generic Ext space.

### Current suppliers, duplication and order

The board package index, citation lead and overlap report were read before resolving existence claims. Current supplier text was obtained on main where the roadmap is on main, and at the provided open head for new roadmaps otherwise. Read-only `roadmaps show`/`roadmaps grep` and object searches were used; the lines below were opened. Main-branch roadmaps ReductiveGroups, AdicSpacesPartIII and PadicMeasuresIwasawaAlgebras also supplied the house-shape comparison.

| Supplier/head | Resolved file and lines | Object and ownership result |
|---|---|---|
| LocallyAnalyticDistributions #854 | `TauCetiRoadmap/LocallyAnalyticDistributions/README.md:891`, 988, 1002, 1093, 1107, 1135 | §§0.0,0.2 give lattice locally convex spaces, tensor comparisons, Hahn–Banach, open mapping and compact-type extensions. Strict tensor exactness/native barrel comparison remain explicit gaps. |
| LocallyAnalyticDistributionsPartII, board | `packages/LocallyAnalyticDistributionsPartII/README.md:141`, 164, 248 | §§1.1,1.2,2.5 give enveloping embedding, crossed products and Arens–Michael envelope. The resolver's sole “not found” lead is false for this available board package. ORDER position 199 is earlier than 253. |
| NoncommutativeAndEquivariantIwasawa #1307 | `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:150`, 177, 209, 303, 333 | §§0.1–0.3,0.6–0.7 supply uniform groups, finite-free subgroup comparison, coordinates and valuations. The offset at p=2 is 2 rather than 1. |
| PadicLocalLanglandsForGL2Qp #1312 | `TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:205`, 217, 219, 228, 749, 1587 | §0.1 compact distribution/coadmissibility/Banach foundations; §§2.4,4.8 GL₂ special cases. Noncompact duality and general split-group applications here extend those inputs. General Fréchet–Stein/radius API is declared as gaps. |
| CompletedCohomologyPartII #1035 | `TauCetiRoadmap/CompletedCohomologyPartII/README.md:183`, 241 | F.1/F.4 give unitary category and analytic-vector/derived-cohomology carriers. The strong stagewise Pan vanishing is additional here. |
| OverconvergentAutomorphicForms #1422 | `TauCetiRoadmap/OverconvergentAutomorphicForms/README.md:315`, 357, 361, 374, 376, 390 | §0.6 supplies character spaces, essential admissibility, finite slope and averaged Jacquet action. Generic Jacquet construction is imported, not duplicated. Index p and averaged scalar 1 agree with Convention 5 here. |
| ReductiveGroupsPartII, main | `TauCetiRoadmap/ReductiveGroupsPartII/README.md:640`, 5834, 6289, 6304 | RG2.0.2 smooth analytic charts, RG2.4.2 Iwahori factors, RG2.4.4 Iwasawa/compact flag quotient. General parabolics follow by containment of a minimal parabolic. |
| SmoothRepresentationsOfLocalGroups #1688 | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:623`, 643, 704, 871, 932, 1677, 1858 | SR.0.1,0.2,0.4,0d.1,0d.2 give smooth categories, admissibility, Grothendieck property and central Ext separation. |
| Same smooth supplier | Same file:1918, 1937, 1981, 1991, 2047, 2095, 2116, 2193, 2207 | SR.2.1–2.3 induction, stages/exactness, modulus, Jacquet modules/lemma and invariant comparison. Right-translation unnormalised induction agrees. Unaveraged positive Hecke on the trivial line is p=δ_B⁻¹; the package divides by p. |
| Same smooth supplier | Same file:2624, 2691, 2799, 3002 | SR.3.1 finite length/generic locus, SR.3.2 complex Bernstein centre, SR.3.4 Steinberg. The finite-E generic, Jacquet, finite-length and ordered-parameter refinements are declared gaps; R02 repairs the last contract's direction. |
| ReductiveGroups, main | `TauCetiRoadmap/ReductiveGroups/README.md:1030`, 1230, 2253, 4143 | Layers 1,2,7 and §10B: rational representations, Lie algebra, parabolics/Levis, split highest-weight modules and their highest line. These support the new density route in §1.6. |
| LieHighestWeight, main | `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:405`, 537, 567, 931, 1432 | Layers 3,4,5,7,9: native semisimple Verma theory, classification, reducibility, centre and reductive decomposition. Local split-field/category-O adapters are additional. |
| ArithmeticLocallySymmetricSpaces #871 | `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:3593` | ALS.4.5 explicitly uses a Weil restriction from number fields. The arbitrary split reductive version is a declared extension gap. |
| VStackSheavesAndLisseCategories #1230 | `TauCetiRoadmap/VStackSheavesAndLisseCategories/README.md:656`, 700, 733 | VS2.1 solid derived tensor and VS2.2 analytic-ring/solid nonarchimedean coefficients. The classical locally convex comparison is explicitly assigned to its consumer. |
| AdicSpacesPartIII, main | `TauCetiRoadmap/AdicSpacesPartIII/README.md:10053`, 10126, 10139 | R3.4 quasi-Stein spaces and Theorems B/A. The complete nontrivially valued field and coherent hypotheses are present. |
| PadicMeasuresIwasawaAlgebras, main | `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:909` | §1.7 measure/completed-group-algebra comparison with a countable quotient tower, available for the compact p-adic analytic groups used here. |
| CompletedCohomologyAndLocalGlobalCompatibility #1270 | `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md:7`, 233, 241 | Arithmetic/global comparisons, not another owner of the general local Ext theory; it imports the same averaged Jacquet convention. |
| TriangulineVarietyAndItsLocalModel #1829 | `TauCetiRoadmap/TriangulineVarietyAndItsLocalModel/README.md:7`, 115–121 | Geometry and cycle transfers consume genuine principal-series/Orlik–Strauch objects from this roadmap. Its LR.4/LR.5 citations resolve through the former-numbering table at README line 133. |
| SpringerResolutionAndCharacteristicCycles #1828 | `TauCetiRoadmap/SpringerResolutionAndCharacteristicCycles/README.md:21`, 1214, 1216, 1222, 1233 | Residual category-O duplication is the settled external F06, discussed above. Strict central reduction, orbit labels and localisation belong there; common category O belongs here earlier in ORDER. |

No dropped supplier id, revision-only id, unmapped dropped local id or conflicting alternative head was reported by the supplied overlap facts; the former-numbering table preserves the old LR identifiers used by #1829. Closest-head scope comparisons were performed, rather than treating “no overlap facts” as proof of disjoint ownership. This package is not a re-plan of an existing main-branch roadmap. No new ownership move is needed for R01 or R02.

All 86 `*Needs:*` lines and all supplier contracts were read. The mechanical dependency check was run with the prescribed name, movable placement, merge order and content checkout. Exact output:

```text
depcheck: 236 roadmaps, 2145 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The gap suppliers are all named and earlier. The check is supplemented by the section-level resolutions above; it does not certify the mathematical content of a supplier.

### Declared gaps and shape

All nine slugs occur both in `packages/LocallyAnalyticRepresentationsOfLocalGroups/design/plan.json` and under the corresponding README supplier. No supplier is `none`. Eight contract descriptions need no change; the ninth has R02's domain correction. Their absence from a supplier today is not a finding.

| Gap | Minimal additional contract checked |
|---|---|
| barrelled-banach-steinhaus | Lattice/native boundedness and barrel comparison, compact-type and inductive-limit instances; does not ask for native Banach–Steinhaus again. |
| compact-type-tensor | Functorial strict exactness of the completed tensor on compact-type spaces; not a second tensor carrier/comparison. |
| kostant-split-reductive | General split connected reductive group in characteristic zero, beyond ALS's arithmetic Weil restrictions. |
| generic-principal-series-finite-coefficients | Explicit generic criterion, absolute irreducibility, End=E and E-rational Weyl intertwiners. |
| principal-series-jacquet-finite-coefficients | Generic finite-E direct sum, with the correct upper/lower modulus distinction. |
| finite-length-finite-coefficients | Finite-E parabolic finite length and scalar extension of the complex theorem. |
| ordered-character-map | Ordered character tori, Bernstein quotient and tangent compatibility; repair domains as R02. |
| frechet-stein-general | General coadmissible coherent-system theorem with its topology/closedness/change-of-ring API beyond the special distribution-algebra statement. |
| radius-algebras | Saturated p-valued coordinates, radius norms and noetherian Banach stages, not a duplicate compact distribution algebra. |

There are **11 layers, 86 numbered targets, 86 per-target Needs lines and 86 Checks blocks containing 307 bullets**. Each numbered target has at least three Checks. All layers end with Examples and Dependencies; definitions have explicit prose API lists, including the 14 repaired blocks. The mathematical organisation is explained at line 131: Layer 4 is independent Lie theory; Layers 5–7 produce induction, constituents and adjunctions; Layer 9 uses the Layer-8 theory on Levi blocks; Layer 10 uses both along embeddings. No layer is named for a source chapter, no sentence says the source's exposition dictates the plan, and the application order has stated dependencies.

The opening summary, scope, conventions, supplier contracts, build explanation, downstream consumers and references are present. There is no algorithmic target, copied source passage, local machine path, pull-request/process residue, source instruction, HTML anchor, `set_option`, sorry'd data, or invented own Lean identifier in the reviewed files. The former-numbering table is a required compatibility map, not a target-numbering catalogue. The source-correction section records mathematical errata. The small-prime scope and external duplication are explicitly accounted for as settled F05/F06, not silently certified away.

## Not verifiable

- **SCHN11:** *p-Adic Lie Groups* is settled uncertified. Its analytic-group/restriction-of-scalars locators cannot be certified from the supplied texts. The named analytic-chart supplier was checked instead; the book is not requested again.
- **NFA02:** *Nonarchimedean Functional Analysis* is settled uncertified. Its functional-analysis locators cannot be text-certified here. The pinned barrelled/Banach–Steinhaus statements and the locally convex supplier contracts were opened; the book is not requested again.
- **HUM08:** *Representations of Semisimple Lie Algebras in the BGG Category O* is settled uncertified. Its category-O chapter locators cannot be text-certified here. The accessible OS15 passages and explicit low-rank tests were checked; the book is not requested again.
- The non-A all-prime Orlik–Strauch irreducibility statement remains the settled human-scope issue F05, not a theorem verified by this review. The related source explicitly describes a proof limitation and absence of a known counterexample.

All 15 seeded targets had readable primary-source material, with the HUM08 supplementary citation in Layer 4 subject to the qualification above. No requested elaboration or source-cache tool was unavailable. No process was left running.

## Source issues

- **Error** in OS15 at §2.5, paragraph after Example 2.7, p.8 (OS15 lines 315–325): the source says the stated parabolic conditions imply membership in O and identifies O^g with all finite-dimensional semisimple modules; it should be split Cartan semisimplicity over the coefficient field is also required; affects a stated result.
- **Misprint** in DING25 at paragraph after Proposition 3.1, arXiv v2 p.37 (DING25 line 1505): the source says the subset label is the forward image of the first i indices; it should be the inverse image, constant on the indicated left Levi-Weyl coset; affects a stated result.
- **Misprint** in DING25 at (3.1) and Lemma 3.2, arXiv v2 p.37 (DING25 lines 1509–1513): the source says the inducing character has the negative reflected algebraic weight; it should be positive reflected weight, with the minus sign only on the category-O input; affects a stated result.
- **Misprint** in DING25 at Lemma 3.2(1), arXiv v2 p.37 (DING25 line 1511): the source says Hom is taken over the torus of ℚ_p-points; it should be over the torus of the local field's points; affects a stated result.
- **Misprint** in DING25 at proof of Proposition 3.3(2), arXiv v2 pp.39–40 (DING25 lines 1594–1601): the source says compose the ordered-torus permutation after the Bernstein map; it should be compose 𝒥_(w₂) after the permutation to obtain 𝒥_(w₁); affects the proof.
- **Misprint** in DING25 at (3.12), arXiv v2 p.41 (DING25 lines 1660–1663): the source says subsets are drawn from the first n−1 indices; it should be from all n indices, with cardinality i; affects a stated result.
- **Misprint** in DING25 at the construction between (3.25) and (3.26), arXiv v2 pp.45–46 (DING25 lines 1832–1841): the source says the first-order kernel has one algebraic factor and all remaining π₁ factors; it should be one π₁ factor and all remaining algebraic factors; affects the proof.
- **Misprint** in DING25 at §3.1.3, singleton-block sentence before Lemma 3.10, arXiv v2 p.43 (DING25 lines 1735–1736): the source says the singleton uses the preceding cumulative index and its character; it should be the next positional weight and the character in the specified filtration grade; affects a stated result.
- **Misprint** in DING25 at the last paragraph of §3.1.3, arXiv v2 p.47 (DING25 line 1910): the source says the two endpoint inductions use P₁ and P₂; it should be the parabolics with Levi types (n−1,1) and (1,n−1), respectively; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "27f65e948bb50d9886c0ef2c7bfe65ef1bc9fe7d", "job": "REV-PKG-LocallyAnalyticRepresentationsOfLocalGroups~4", "model": "gpt-6-astra", "worker": "chris-10"} -->
