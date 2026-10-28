<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1338#issuecomment-6397183163 -->
Review (codex) of 86986bb

Verdict: needs_changes

1. **F01** (P1) Algebraization of invariants uses the wrong DVR

   **Location:** `packages/EtaleDualityAndPerverseSheavesPartII/README.md:452`, §1.7. Quote: “set A′ = B^H” and “The geometric reformulation follows by taking S = Spec V⟦t_1, …, t_(d−2)⟧”.

   **Claim:** After taking H-invariants, A′ and its ideals can still be algebraized over the indicated power-series ring over V. The action on V is allowed to be nontrivial, so A′ need not even be a V-algebra.

   **Witness:** Set p=3, ℓ=2, W=W(𝔽̄₃), V=W[π]/(π²−3), B=V⟦x⟧; H=C₂ negates π and fixes x. Then B^H=W⟦x⟧. A V-algebra structure would force 2v₃(b₀)=1 for a square root b₀ of 3 in W.

   This is the roadmap's own ramified coefficient-action example at README:394, with the primes fixed. A unital map V→W⟦x⟧ would send π to b(x) with b(x)²=3. Taking the constant term gives b₀²=3, impossible in the unramified DVR W. Thus the proposed base cannot produce the specified completed A′, even before imposing its ideals. The source algebraizes B equivariantly over V, then takes invariants: ILO14 lines 3015–3027. The final base for A′ is over V^H: ILO14 lines 3028–3035, V 3.2.3–3.2.4, printed pp. 67–68.

   **Exact repair:** Rewrite the route to algebraize B and its H-action first, take the invariant algebra, and descend A′ and the ideal family over the henselian polynomial algebra over V^H⟦t_1,…,t_(d−2)⟧. Use S=Spec V^H⟦t_1,…,t_(d−2)⟧ in the geometric reformulation. Explain that the invariant coefficient ring is again a complete mixed-characteristic DVR. Add the ramified C₂ example as a negative-control Check distinguishing V from V^H. The headline and its Lean signature need no weakening.

   **Retest:** Here V^H=W. Take C=W[x], 𝔫=(3,x); its local completion is W⟦x⟧=A′, and dim W+1=1+1=2. The corrected base admits the required structural map and the ideal (x−3) descends literally.

2. **F02** (P2) The split-cover theorem in §8.4 already has an owner

   **Location:** `packages/EtaleDualityAndPerverseSheavesPartII/README.md:1362`. Quote: “Prove the cohomological comparison: for every quasi-compact open U … there are no nonsplit étale covers”. The proof route repeats this construction at README:1366.

   **Claim:** The split-cover assertion is included among this roadmap's new theorem targets, although ArcTopologyAndDescent §11.2 already owns it at greater generality.

   **Witness:** `packages/ArcTopologyAndDescent/design/README.md:1370`: “Any quasi-compact open of the spectrum of a product of aic valuations has no nonsplit étale covers”. Its source is CS24 Lemma 2.2.4, also cited here.

   This is the same object, topology and conclusion; the supplier does not require the additional perfectoid hypotheses of §8.4. The board package exists in the supplied package index, and it is earlier in the merge order. Its §3.6 also supplies the ultraproduct components. Merely including §11.2 in *Needs* while instructing the implementer to prove its assertion again does not resolve ownership.

   **Exact repair:** Remove the split-cover clause from the new theorem statement. Add that exact result to the ArcTopologyAndDescent scope deferral and supplier contract, citing §11.2. In the route, apply that supplied result to compute degree-zero sections and vanishing, then use §8.3 for the new matched-open comparison. Keep the cohomological comparison here; it is not supplied by §11.2.

   **Retest:** For one algebraically closed field, the supplied splitting gives H⁰=G and Hⁱ=0 for i>0. For two factors it gives H⁰=G² and the same higher vanishing. The new comparison still has content: it identifies these groups through the matched clopen algebras, including e_J's ultrafilter membership for infinite products. No theorem or generality is lost.

3. **F03** (P3) Layer 6 still refers to two deleted gap contracts

   **Location:** `packages/EtaleDualityAndPerverseSheavesPartII/README.md:1224`. Quote: “with the general-base exceptional-pullback contract” and “with the general-base open-duality contract”.

   **Claim:** The layer dependency summary retains contracts removed by the repairs of F05 and F06. The exact contracts and the individual targets now give a valid direct route, so this is stale documentation rather than an additional missing prerequisite.

   **Witness:** README:98 imports F.5 on F.2's finite-cohomological-dimension domain; README:1104–1106 proves open-immersion exchange from §0.7 and EnhancedDerivedSheaves §§0.3–0.4. Neither deleted gap occurs in the plan's three gaps.

   **Exact repair:** Delete both “with the … contract” qualifiers. Describe exceptional pullback using the precise F.2/F.5 domain already stated at README:98, and refer the exchange input to this roadmap's §6.8 and its named tensor–Hom suppliers. Keep EtaleDualityAndPerverseSheaves §§0.1–0.2 for their actual coefficient and finite-type duality input.

   **Retest:** For j=id, the exchange is K≅K; for empty U both sides are 0; for the generic open of a strict trait both closed stalks have H⁰=Λ and H¹=Λ(−1). These use the directly supplied adjunctions and require neither deleted gap.

4. **F04** (P3) Higher-graded approximation needs its API and third Check

   **Location:** `packages/EtaleDualityAndPerverseSheavesPartII/README.md:248`, with Checks at README:256 and README:258. Quote: “an a-isomorphism identifies the (a−1)-st infinitesimal fibres and the graded algebras”.

   **Claim:** This is a definition owned here, but it has no prose API list and only two Checks. In particular, neither existing Check distinguishes agreement of the closed fibre from agreement of the higher-graded data.

   **Witness:** Over S=Spec k⟦t⟧, take X=S and Y=Spec k. Their closed fibres agree. For a=1, the degree-one graded pieces are (t)/(t²)≅k for X and 0 for Y.

   **Exact repair:** State a≥1 and compatibility with the base graded algebra, then give the identity, inverse and composition laws as API bullets, citing ILO III 4.2, p. 39 (ILO14 line 1887). Retain the two existing Checks and add the displayed closed-fibre-only negative control. No Lean declaration is needed.

   **Retest:** Identity gives k≅k in degree one. X and Y above cannot be 1-isomorphic since k≄0. Thus the new Check rejects precisely the plausible weaker definition; the étale quadratic Check still tests the separate regularity hypotheses.

Four findings: one P1, one P2 and two P3. The six Lean headlines elaborate, and the dependency check finds no upward edge or cycle. The blocking defects are a false coefficient-base step in the mixed-characteristic algebraization route and a theorem already owned by an earlier supplier. Neither requires changing the roadmap's scope.

## Verified sound

The review read all four package files, all 55 numbered target subsections, the 56 *Needs* entries, the previous review and repair report, the package index, the three declared plan gaps and the relevant supplier passages. All 15 seeded source targets were read at their locators. Earlier computed adversarial rows were used only for unchanged claims; rows that merely asserted a property were supplemented with explicit instances. The tables below concentrate on the seeded targets, headlines, changed passages and finding witnesses. The review did not change the author's four files or the design.

### Verification of the previous eleven findings

Each quoted passage is from the repaired package. The settled external ownership decision in F01 is not re-raised.

| Previous finding | Status | Repaired passage and independent check |
|---|---|---|
| F01, trait theorem ownership | Repaired as a declared contract; external work remains settled | README:108: “What LefschetzPencilsAndVanishingCycles must provide (gap:ILLUSIE-2003)”. The full support-dimension inequality is present there and in the plan, with supplier §6.2. README:850–852 proves only the strict-local consequence. ILO14 lines 10337 and 10557 invoke the trait theorem. |
| F02, Epp proof route | Repaired, with original-source access still uncertified | README:350: “A proof route separates residue-field stability from ramification elimination.” ILO14 lines 2545–2595 supply the reductions, and K10 lines 90–113 supply the cancellation correction. In characteristic 2, u²π⁻²+uπ⁻¹ becomes 0 after the indicated change; the final case can split. No ownerless Epp gap remains. |
| F03, nonabelian oriented descent | Repaired | README:29: “Layer 3 treats torsion abelian coefficients only.” The companion and its gap are absent; §§3.4–3.5 use the abelian theorem. ILO-final-XII lines 209–215 retain the nonabelian limitation. |
| F04, missing cd headline | Repaired, correctly differing from the earlier suggested encoding | README:900: “The sectionwise torsion hypothesis is tested on affine étale objects.” Suggested.lean:265 states the full bound. Affine étale objects are quasi-compact, so a finite refinement supplies a section's exponent. An infinite disjoint union can carry sections of unbounded order and is correctly not tested this way. |
| F05, redundant open-duality gap | Partly repaired: mathematics repaired, summary stale | README:1104: “First prove the open-immersion tensor–Hom exchange, independently of dualizing objects.” The adjunction proof and three discriminating Checks are valid. R03 removes the surviving dependency-summary qualifier. |
| F06, exceptional-pullback gap | Partly repaired: mathematics repaired, summary stale | README:98: “Use §F.5 for f^! as right adjoint to Rf_! on the finite-cohomological-dimension domain of §F.2”. This is supplied independently of dualizing existence. R03 concerns only the old summary wording. |
| F07, arbitrary-DVR normalization | Repaired | README:240: “For X the spectrum of an excellent DVR”. The next Check excludes a non-Japanese DVR with non-finite integral closure. Finite inseparable extensions remain allowed under excellence; no unnecessary separability restriction was introduced. |
| F08, duplicate and malformed Checks | Repaired | README:272: “the identity family witnesses the instance (X, Z)”. The listed duplicate pairs and repeated Epp route are gone; §4.2 has one Check heading. Connected identity covers and component covers are distinguished. R04 is a separate omitted definition API, not a duplicate-Check recurrence. |
| F09, locators and dualizing scope | Repaired | README:1172: “This necessity assertion uses the stronger convention”. Finite dimension and SGA 5 finite quasi-injective dimension are explicit; the ℤ/6 example is factorwise. README:774 cites XIV 1.3.2, and README:970 qualifies the four ILO XVII proof locators. |
| F10, downstream claim | Repaired | README:1418: “PurityForFlatCohomology §PF.1 consumes local Lefschetz (§7.3)”. Its design README:104 and :2073 name that input. The unsupported PF.4 claim is absent. This consumer is not used as a supplier. |
| F11, ordering and labels | Repaired | README:814: “5.3 Regular base change”; README:832: “5.4 Transport of dimension functions”. The transport dependency follows base change. Suggested.lean:47 says “Layer 1”; source labels use the README sections, and the unowned scope exclusions are absent. |

### Seeded sources and the flagged uncertified locators

Printed page numbers below follow the version actually recorded in the manifest. ILO14 is the arXiv v1 volume, not silently the differently paginated published volume; CS24 uses the recorded v3 pagination. No source was fetched under a second key, and no settled access request was reopened.

| Target | Text opened | Hypotheses, number and support |
|---|---|---|
| §0.4 Valuative characterization | ILO14 lines 1571–1608, II 4.2.1–4.2.2, p. 32; ILO-final-II lines 485–500, pp. 33–34 | The algebraically closed object is the fraction field of the valuation ring. The package follows the corrected statement, and its DVR Check now includes excellence. |
| §0.7 Reduction to complete local rings | ILO14 lines 2064–2079, III 6.1–6.2, p. 43 | Complete-local reduction uses the excellent henselian setup and the approximation theorem. The package's line-2056 pointer begins just before the propositions; theorem and page identify them unambiguously. |
| §1.1 Cohen–Gabber in characteristic p | ILO14 lines 2276–2297, IV 2.1.1, pp. 50–53 | Reduced, equidimensional, complete noetherian local, positive characteristic; finite torsion-free parametrization, residue identification and generically étale fibre. All are present in the Lean signature. |
| §1.2 Equivariant Cohen–Gabber | ILO14 lines 2419–2485, IV 2.2.2 and proof, pp. 53–55 | Finite group of invertible order; reduced complete equicharacteristic local ring. Coefficients carry the induced residue action and parameters are fixed. Equidimensionality is not imposed; the characteristic-zero case uses separability and finite-group descent. |
| §1.5 Partial algebraizability definition | ILO14 lines 2884–2889, V 2.1.1, p. 64 | Finite-type model over a strictly lower-dimensional complete local base; actual completion identification and ideal descent, not just an unmarked abstract ring. The native bundle retains these maps. |
| §1.6 Equal-characteristic partial algebraization | ILO14 lines 2890–2915, V 2.1.2, pp. 64–66; lines 2981–2982, V 3.1.4, p. 66 | Reduced complete equicharacteristic nonfield and finite family of ideals; the regular base has dimension one less. The finite-family and positive-dimension binders remain explicit. |
| §2.2 Weak local uniformization | ILO14 lines 3577–3635, VII 1.1 and reduction, p. 81 onward | Quasi-excellent noetherian scheme and nowhere-dense closed subset; finite alteration covering by regular connected schemes with snc inverse-image support. Empty boundary and disconnected targets are handled. |
| §3.1 Oriented product | ILO14 lines 7932–7987, XI 1.1–1.9, pp. 171–176 | General finite-limit-site construction and the directed two-cell. The scheme specialization agrees with the earlier supplier; the arrow is g p₂⇒f p₁. |
| §5.1 Dimension functions | ILO14 lines 9869–9877 and 9979–9994, XIV 2.1.1–2.1.2 and 2.1.8, pp. 209–212; lines 10182–10188, 2.4.5, p. 216 | Immediate étale specialization drops the value by one; differences are locally constant. Strict-local normalization and the conditional −dim O formula are distinguished. XIV 1.3.2 at line 9860 supports the repaired catenarity citation. |
| §5.5 Strict-local trait consequence | ILO14 lines 10552–10561, XV 3.3.2, p. 224; lines 10337–10339, XV 1.1.3, p. 219 | The complete-DVR finite-type local setting and constructible invertible coefficients agree. The proof uses the declared trait theorem. Ill03 Theorem 2.4 itself remains uncertified, not silently certified by this check. |
| §5.7 Local affine Lefschetz | ILO14 lines 10350–10364, XV 1.2.2–1.2.4, p. 220; lines 396–402, Exposé 0 Corollary 8, p. 5 | Strict-local dimension bound and the henselian residue-field contribution are stated on their respective domains. Invertibility and quasi-excellence are present. |
| §5.8 Cohomological dimension | ILO14 lines 16193–16217, XVIII-A 1.1–1.4, p. 331 onward | Arbitrary strictly local noetherian schemes, d>0, ℓ invertible; no quasi-excellence restriction. All ℓ-primary torsion sheaves, not just uniformly bounded torsion. The new Lean headline has exactly this open-subscheme bound. |
| §6.6 Potential-dualizing existence and uniqueness | ILO14 lines 13878–13885, XVII 5.1.1, p. 287; lines 14120–14185 and 14225–14230 in the construction | Excellent noetherian scheme, global dimension function and invertible finite coefficients. Uniqueness concerns pinned complexes and the pinning-preserving isomorphism. |
| §6.7 Functoriality | ILO14 lines 13512–13539 and 13555–13575, XVII 4.1.1–4.1.3, p. 280 onward | Regular morphisms use ordinary pullback with the regular transport rule; separated finite-type morphisms use exceptional pullback with the finite-type transport rule. The smooth test distinguishes the two normalizations. |
| §8.4 Valuation products and tilts | CS24 lines 774–797, Lemma 2.2.4, pp. 19–20; lines 864–871, Theorem 2.2.7 product case, pp. 21–22 | Quasi-compact opens, aic valuation factors and arbitrary torsion abelian G support the cohomological calculation. Ultrafilter components need not have rank ≤1. The mathematics is supported; ownership of the splitting input is R02. |

Also reopened the changed proof routes: ILO III 4.2 and 5.1 (higher-graded approximation); IV 3.1.2–3.2.3 and K10 pp. 1–3 (Epp reductions); V 3.2.3–3.2.4 (invariant-base descent, R01); XII 1.3.4 and published XII 1.4 (nonabelian limitation); XVII 6.1.1 and 7.6.3 (biduality and formal exchange); G04 §8 (stronger dualizing convention); SGA4half [Th. finitude] 1.9, p. 236 (generic constructibility); and CS24 2.1.2.2–2.1.2.3 (powered sharp quotient). The last two are at SGA4half lines 7774–7779 and CS24 lines 415–425.

### Computed adversarial evidence

In this table k is separably closed where used for strict-local tests; Λ is a nonzero finite coefficient ring of invertible order unless another ring is displayed. A cohomological shift [a] places Λ in degree −a. “Retain” records no repair; “R…” identifies a repair above. No row relies on successful elaboration as evidence of truth.

| Statement | Instances tried | Values computed on the two sides | Result and change |
|---|---|---|---|
| Coefficients, shifts and purity conventions | n=1,2; strict trait; strict regular surface | n=1 gives Λ=Λ²=0; n=2 gives cardinalities 2 and 4. H⁻²(Λ[2])=Λ, H⁰=0. H²_s(Λ(1))=Λ; H⁴_x(Λ(2))=Λ. | Nonzero convention and positive twist/shift necessary; retain. |
| §0.3 standard forms | Identity on integral henselian X; identity finite-flat cover | Y=X, V=X; generic degree 1, gcd(1,ℓ)=1; composite is id_X. | Both forms recover the cover, rather than an empty family; retain. |
| §0.4 valuative criterion | G_m→A¹; excellent DVR finite extension; non-Japanese DVR | At t=0, t is a nonunit and cannot become invertible in a local lift. Finite normalization gives an integral surjection; the non-Japanese integral closure has infinite module size and is not an alteration. | Both positive and negative directions distinguished; F07 repaired. |
| §0.5 higher-graded definition | X=Spec k⟦t⟧, Y=Spec k; a=1 | Closed fibres both Spec k; gr¹₁(X)=k, gr¹₁(Y)=0. Identity gives the same graded module in each degree. | R04: closed fibre alone does not determine the object. |
| §0.7 complete-local reduction | Henselized plane with boundary xy(x−y); blow-up, chart y=xu | Pullback equation x³u(1−u); reduced boundary x·u·(1−u). At most two components meet at any point; the same formulas hold after completion. | Approximation must retain the pair, not only the regular ambient ring; retain. |
| §1.1 and equal-characteristic headline | Cusp y²=x³, p=2,3; d=0; non-equidimensional ring | p=2: parameter y, generic degree 3, derivative x²≠0. p=3: parameter x, degree 2, derivative 2y≠0. d=0 gives residue isomorphism and degree 1. k⟦x,y,z⟧/(xz,yz) has component dimensions 2,1. | Small characteristics admitted; the last ring fails hequi, square-zero rings fail reducedness; retain. |
| §1.2 equivariant headline | C₂ on k⟦x⟧; S₃ permuting three variables; wild C₂ in char 2 | Invariant parameter x² gives degree 2; symmetric parameters give degree 6. For σ(x)=x/(1+x), σ²(x)=x but order 2 maps to 0 in characteristic 2. | Nonabelian action tested; invertible-order condition excludes the wild model; retain. |
| §1.3 corrected Epp step | Characteristic 2, u²π⁻²+uπ⁻¹; unramified extension | Subtracting (uπ⁻¹)²−uπ⁻¹ leaves 0; the Artin–Schreier algebra splits. Unramified e=1 requires no ramified base extension. | Cancellation cannot be ignored; repaired route accommodates the terminating case. |
| §1.4 mixed presentation and headline | Identity; ramified coefficient C_ℓ-action; t↦x^p | Identity has generic degree 1. Ramified B/A has degree ℓ but B^H/A has degree 1. The map t↦x^p has derivative px^(p−1) generically nonzero and 0 on the p-fibre. | Invariant degree and p-fibre étaleness fields exclude the two wrong models; retain. |
| §1.5 PartialAlgebraization | k⟦x,y⟧, ideal (y−x²); field k; ideals (x),(x²) | B=k⟦x⟧, C=B[y], completed localization is k⟦x,y⟧; model ideal maps to (y−x²). For a field, dim B<0 is impossible. Quotient lengths for (x),(x²) are 1,2. | Completion map and exact ideal identification are essential; retain. |
| §1.6 equal-characteristic partial algebraization | Node k⟦x,y⟧/(xy), ideals (x),(y); empty family | C=k[x,y]/(xy), 𝔫=(x,y); completion is the node; dim k+1=0+1=1. Both branch ideals descend; an empty family leaves the same ring assertion. | Headline and native bundle agree; retain. |
| §1.7 PrimeToEllLocalExtension | Identity; degree-two extension; formal ℓ=0,1 | gcd(1,ℓ)=1; gcd(2,2)=2, gcd(2,3)=1; gcd(1,0)=1, gcd(2,0)=2, gcd(2,1)=1. | Bundle's broader parameter domain is meaningful; theorem restricts to a prime. Retain. |
| §1.7 invariant-base route | p=3, ℓ=2, V=W[π]/(π²−3), H negates π | V^H=W; B^H=W⟦x⟧. A map from V would imply 2v₃(b₀)=1. Using W gives completion W⟦x⟧ and base dimension 1. | Original route false; R01. |
| Mixed partial-algebraization headline | A=ℤ_p⟦x⟧, E=id, I=(x−p); arbitrary finite family | Extension degree 1 is fixed first; for the displayed ideal C=ℤ_p[x], completion A, dim ℤ_p+1=2. Quantifier order is ∃E∀r∀I∃P, not ∀I∃E. | Uniform extension and family-dependent model correctly separated; retain signature. |
| §2.2 weak uniformization | Cone xy=z², including characteristic 2 | Blow-up x-chart gives y₁=z₁², a regular chart. Exceptional conic has gradient (y,x,−2z); in char 2, x=y=0 forces z=0, no projective singular point. | No restriction to good primes; retain. |
| §3.1 oriented product | Identity strict-trait diagram; punctual base | Point pairs are (s,s),(η,η),(s,η), three rather than the ordinary fibre product's two; (η,s) is absent. Over a point, products of sets with sizes 1 and 2 have size 2. | Direction and ordinary-product specialization correct; retain. |
| §§3.3–3.4 topology and proper acyclicity | Two affine lines over k; identity proper map | Fibre product k[x,y] has dimension 2 and is noetherian. For π=id, the unit is F→F and all positive derived identity images are 0. | Fixed-base finite-type restriction repairs the source category; retain. |
| §3.5 abelian descent | Split two-point cover of a point | Čech C⁰=Λ², C¹=Λ⁴; equalizer is diagonal Λ; higher cohomology is 0 by the split contraction. | Descended object is Λ, not Λ²; F03 repaired. |
| §3.6 hypercover base change | Constant hypercover | Totalization is g^*Rf_*K in degree zero of the simplicial direction; the comparison is its identity, higher normalized simplicial terms 0. | Maps and direction agree; retain. |
| §4.2 finiteness headline | snc boundary with r=0,1,2; noninvertible char-p coefficients | Exterior ranks are (1), (1,1), (1,2,1), then 0 above r. Artin–Schreier classes t^m with p∤m are independent modulo h^p−h, giving infinite H¹(A¹,ℤ/p). | Invertibility and Tate normalization substantive; retain. |
| §5.1 dimension functions | Strict trait; Spec k; A¹ over a DVR; line meeting plane | Trait values (1,0); a point admits any integer c. Closures of the generic point and (πt−1) have dimensions 2,0 although the specialization has codimension 1. On line/plane union −dim O changes 0→−2 along an immediate line specialization. | Rejects closure dimension and unrestricted −dim O; retain. |
| §5.3 regular base change | k[t]_(t), z²=1+t, char k≠2; identity | A root in k(t) would give even valuation at t=−1, but v(1+t)=1. The completion has a root with constant term 1. Identity exchange is F≅F. | General global-cohomology invariance cannot replace the stated local exchange; retain. |
| §5.4 transport and §6.7 conventions | A¹_k→Spec k, δ_k=0 | Finite-type transport gives δ(η)=1 and δ(closed)=0. Regular transport gives δ(η)=0 and δ(closed)=−1. They differ by the constant 1; f^!Λ=Λ(1)[2], f^*Λ=Λ. | The two rules must remain distinct, even for smooth maps; retain. |
| Trait contract and §5.5 consequence | Strict-trait generic open j; separably closed point | H¹(η,Λ)=Λ(−1), H²=0; δ(R¹j_*Λ)=0=1−1. At d=0, H⁰=Λ, H^q=0 for q>0. | Sharp boundary and sign; accepted as a declared supplier contract. |
| §5.6 affine Lefschetz headline | Affine line over separably closed field | Support dimension of the constant sheaf is 1; H^q=0 for q>1, while H⁰=Λ. | Numerical bound includes the constant sheaf without killing degree zero; retain. |
| §5.7 local affine Lefschetz | Strict trait; henselian DVR with finite residue field; W(k̄)⟦x⟧[1/p] | Strict generic field has cd_ℓ=1=1+0. Finite-residue local field has cd_ℓ=2=1+1. Dimension-two strict-local principal open has H^q=0 for q>2. | Residue-field contribution and strict-local hypothesis distinguished; retain. |
| §5.8 cd headline, boundaries | d=0,1,2; empty open; zero sheaf; square-zero thickening | d=0 has cd=0, not −1. For d=1, q starts at 2 and H¹ of the generic open is Λ(−1); for d=2, q starts at 4. Empty/zero inputs give H^q=0. k⟦t⟧[ε]/ε² has the same étale topos as its reduction and dimension 1. | Positive dimension and no reducedness/excellence restriction are correct; retain. |
| §5.8 torsion carrier | Constant ⊕_(r≥1) ℤ/ℓ^r; infinite disjoint union | Every section over an affine basis object has finite image and some exponent. Section (e_r) on the disjoint union has ℓ^k e_(k+1)≠0 for every k. | Affine-basis test admits genuine unbounded torsion; F04 repaired. |
| §6.1 transitions | Wild C₂ acting by sign on 𝔽₃; inseparable degrees 2,3 | Invariants are 0; averaging (1+σ)/2=0. Degree inverses: 2·2=1 mod 3, 3·1=1 mod 2. Identity specialization has twist/shift 0 and identity map. | Zero projection and inverse-degree normalization correct; retain. |
| §6.2 top local class | Strict regular surface, two immediate specializations | Both chains send 1 to 1 in H⁴_x(Λ(2))=Λ; cohomology above 4 is 0. | Chain compatibility, top degree and twist agree; retain. |
| §§6.3–6.4 potential complexes | Trait δ=(1,0); trait δ=(0,−1); empty scheme | First has K=Λ(1)[2], generic degree −2 and closed costalk degree 0. Second has K=Λ and closed costalk Λ(−1)[−2]. Empty scheme has only the zero complex. | Λ fails the first normalization; pinning determines the intended object; retain. |
| §6.5 perverse headline | Point p=0; strict trait p=−2δ; shift k=1 | Point inequalities are i≤0 and i≥0. Trait Λ(1)[2] has generic degree −2 and closed costalk degree 0; Λ instead has 0>−2 at the generic point. On a point Λ[−1] has H¹=Λ. | Heart, negative control and shift D≤p[−k]=D≤p+k agree; retain. |
| §6.6 pinned existence/uniqueness | Regular connected X with δ=−codim; scalar automorphisms | K=Λ; a pinning-preserving scalar u satisfies u·1=1, hence u=1. Without pinning, any coefficient unit remains an automorphism. | Exact uniqueness category essential; retain. |
| §6.8 formal exchange | j=id; U empty; generic open of strict trait | Both sides K; both sides 0; both closed stalks have H⁰=Λ,H¹=Λ(−1), whereas j_! would give zero closed stalk. | Added exchange valid; only stale summary remains, R03. |
| §6.8 dualizing definition | Point, K=𝔽₂²; Λ=ℤ/6 and L=𝔽₂⊕𝔽₃[1] | D²(𝔽₂)=𝔽₂⁴ has 16 elements instead of 2. L⊗ᴸ(𝔽₂⊕𝔽₃[−1])=𝔽₂⊕𝔽₃=Λ, cross terms 0. | Rejects false dualizing object and false common-shift classification; retain. |
| §6.9 biduality headline | Strict regular local dimension d; Λ=ℤ/4, M=ℤ/2 | For K=Λ(d)[2d], double twists and shifts cancel, D²Λ=Λ. Hom_Λ(M,Λ)=(2)≅ℤ/2, so D²M=M although M has infinite Tor dimension. | No unnecessary projectivity or finite-Tor restriction; retain. |
| §6.10 excellent duality and necessity | Trait, factorwise shifted ℤ/6 complex | Shift indices on the two prime factors are (−2,0) and (−3,−1); each increases by 2 along specialization. Floors of negative half-indices give (1,0) on both. | Strong SGA 5 hypothesis and factorwise argument repair F09. |
| §§6.11–6.12 normalized local duality | d=0,1; trait F=Λ | K=Λ for d=0 and Λ(1)[2] for d=1; closed costalk Λ in both. H²_sΛ=Λ(−1)=Hom(H⁻²(K)_s,Λ). | Degree −i and twists agree; retain. |
| §7.3 local Lefschetz headline | DVR, f uniformizer; f=0; d=0 | At i=d−1=0 the map is 0→Λ, injective and not surjective. f=0 gives identity. For d=0, threshold is integer −1 and negative groups are 0. | Boundary must be injectivity only; retains the precise PF.1 input. |
| §8.1 matched-open definition | Rank-one aic valuation; open missing a generic point | Special fibre has one point, hence two closed subsets and two matched open pairs. A complement meeting D(ϖ) is not a special-fibre closed subset. | Positive and negative domains distinguished; no arbitrary-open correspondence asserted. |
| §8.4 product cohomology | One/two aic fields; characteristic-p field with ϖ=0; infinite product | H⁰=G/G², higher 0. D(0)=∅ gives all groups 0, while whole Spec gives G. For e_J, a component is in D(e_J) iff J belongs to its ultrafilter on either side. | Mathematics correct; supplied splitting must be imported, R02. |
| §8.5 tilting headline | Perfect characteristic-p ring; O_C whole/generic opens; finite field control | First comparison is identity. O_C and its algebraically closed fraction field each have G[0], including p-primary G. In contrast H¹(Spec 𝔽_p,ℤ/ℓ)=ℤ/ℓ, not 0. | Perfectness alone does not imply acyclicity; retain. |
| §8.6 tilting with supports | Z empty; O_C special fibre; char-p algebraically closed field, ϖ=0 | Empty support gives 0. O_C restriction is G→G, identity, so its support fibre is 0. For the field and full support the complex is G[0]. | No spurious DVR purity class for a nondiscrete valuation ring; retain. |

The other unchanged statements were checked against their earlier numerical witnesses, including degree-2 versus prime-to-2 alteration covers, the closed-fibre degrees 1 and 2 in the prime-to-ℓ negative control, and the ranks of snc higher direct images. Where the earlier table gave only “identity”, “ordinary descent” or a source name, the explicit identity-map cohomology, Čech equalizer and finite-type product calculations above supply the missing values. The inherited §0.7 tautological complete case was replaced by the explicit boundary calculation.

### Pinned declarations and signature audit

The content checkout used for elaboration has commit `8888d45eea61a0573e32d9b39a00c833f844fc44`. Its manifest pins Mathlib to `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti to `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The declarations below were opened at those pins, not inferred from current online documentation.

| Native object | Pinned file and line; content and limitation checked |
|---|---|
| Local and henselian rings | `Mathlib/RingTheory/LocalRing/Defs.lean:30`: `extends Nontrivial R`; the zero ring is excluded. `Mathlib/RingTheory/Henselian.lean:108`: monic simple-root lifting, extending IsLocalRing; no noetherianity or separably closed residue field is built in. |
| Separably closed residue field | `Mathlib/FieldTheory/IsSepClosed.lean:65`: separable polynomials split; this does not impose perfection. Suggested.lean adds it separately from henselianity. |
| Adic completeness | `Mathlib/RingTheory/AdicCompletion/Basic.lean:56`: Hausdorffness and precompleteness are both required. The bundle uses the maximal-ideal completion, not just a chosen topology. |
| Power-series carrier | `Mathlib/RingTheory/MvPowerSeries/Basic.lean:334`: coefficient inclusion `MvPowerSeries.C`; constant coefficient and the coefficient-map action are the native maps used in the residue and equivariance equations. |
| Finite generically étale maps | `Mathlib/RingTheory/Etale/Basic.lean:205`: étale means formally étale and finitely presented. `Mathlib/RingTheory/Etale/Locus.lean:35`: `Algebra.IsEtaleAt` tests formal étaleness of the localized algebra. Finiteness over the noetherian parameter ring supplies the needed finite-presentation context here. |
| Regular local rings and dimension | `Mathlib/RingTheory/RegularLocalRing/Defs.lean:51`: includes local and noetherian conditions. `Mathlib/RingTheory/KrullDimension/Basic.lean:26`: dimension takes values in `WithBot ℕ∞`; equalities to finite d and strict positivity in the signatures are substantive. |
| Torsion-freeness | `Mathlib/Algebra/Module/Torsion/Free.lean:45`: regular scalars act injectively. For the power-series domain this is the usual torsion-free condition; it is not silently a flatness assertion. |
| Invariants and ℓ-groups | `Mathlib/Algebra/Algebra/Subalgebra/Operations.lean:98`: `FixedPoints.subring` consists of action-fixed elements. `Mathlib/GroupTheory/PGroup.lean:41`: prime-power element orders; finiteness is an additional field of the mixed presentation. |
| Affine schemes and the étale site | `Mathlib/AlgebraicGeometry/AffineScheme.lean:56`: IsAffine is an isomorphism-to-Spec predicate, without noetherianity. `Mathlib/AlgebraicGeometry/Sites/Etale.lean:50`: the small étale category includes non-quasi-compact objects. `Mathlib/AlgebraicGeometry/Sites/AffineEtale.lean:112`: the affine basis supplies HasSheafify. |
| Sheaf cohomology | `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:56`: `Sheaf.H` is Ext from the constant integral sheaf. Subsingleton of H expresses vanishing of the cohomology group, not vanishing of its chosen presentation. |
| Properness | `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean:41`: separated, universally closed and locally finite type; properness itself supplies no noetherian hypothesis. |
| Coefficient injectivity | `TauCeti/Algebra/Module/ZMod/Injective.lean:50`: `Module.Baer.zmod_self`, with nonzero modulus. `Mathlib/Algebra/Module/Injective.lean:401`: `Module.Baer.injective`. The package correctly cites these rather than rebuilding ℤ/n self-injectivity. |
| Tilt-related native carrier | `Mathlib/RingTheory/Perfection.lean:633`: PreTilt is the perfection of ModP. `Mathlib/RingTheory/Perfectoid/Untilt.lean` has the multiplicative untilt construction. Neither supplies the complete henselian-perfectoid matched-open and derived-cohomology interface needed by §§8.3–8.6. |

The required `lake env lean` invocation on the package file, run from the content checkout, exited 0. Its only output was six “declaration uses 'sorry'” warnings, one for each headline. There are no TauCeti imports to build. A scratch copy with `#check @name` for all nine declarations also elaborated; comparing the expanded types found no lost section binder and required no change.

| Declaration | Signature comparison with README |
|---|---|
| `cohenGabber_equalCharacteristic` | Explicit local, noetherian, complete, reduced, characteristic-p and equidimensional hypotheses; actual finite torsion-free generic fibre and residue identity. |
| `cohenGabber_equivariant` | Explicit field algebra, finite group, action and invertible order; correct residue action, no added equidimensionality restriction. |
| `MixedCohenGabberPresentation` | Real rings, structural maps, finite/local/injective conditions, p-fibre étaleness, residue equivalence, actions and invariant generic degree. No free Prop field stands for a missing construction. |
| `cohenGabber_mixedCharacteristic` | Normal complete local domain, characteristic zero, residue characteristic p, prime ℓ≠p and d≥2 all retained. |
| `PartialAlgebraization` | Lower-dimensional complete local base, finite-type algebra, actual maximal ideal over the base maximal ideal, completion equivalence and exact ideal images retained. |
| `partialAlgebraization_equalCharacteristic` | Reducedness, equicharacteristic field algebra, positive dimension and finite indexing type retained; regular base of dimension one less. |
| `PrimeToEllLocalExtension` | Complete normal local domain and finite injective local extension; degree is the dimension of its actual generic fibre, not unrelated scalar data. |
| `partialAlgebraization_mixedCharacteristic` | One extension before all finite families; normality, mixed characteristic and regular base dimension equation explicit. The route error R01 does not falsify this signature. |
| `cohomologicalDimension_le_of_strictlyLocal` | Explicit noetherianity, henselianity, separably closed residue field, d>0, dimension equality and invertible prime; affine-basis torsion and q≥2d retained. |

A scratch one-tactic probe using `simp`, `rfl` and `infer_instance` did not close any of the six headlines. Inspection of the pinned declarations found no single existing theorem providing one of them. The three structures bundle the native data needed by those headlines; they are not sorry'd constructions. There are no admitted examples, API theorem catalogues or boundary-case padding. Equal-characteristic Cohen–Gabber retains its substantive torsion-free conclusion, so it is not merely a trivial-group Check for the equivariant statement.

### Headlines and completeness at the pins

| README headline family | Acceptance-test disposition |
|---|---|
| Cohen–Gabber, §§1.1, 1.2, 1.4 | All three stated in Suggested.lean. |
| Partial algebraization, §§1.6–1.7 | Both stated with the three native data bundles. |
| Gabber's cd bound, §5.8 | Stated without quasi-excellence or bounded-exponent stand-ins. |
| Weak and prime-to-ℓ uniformization, §§2.2–2.4 | Named in the module docstring: quasi-excellent schemes, alteration sites and snc pairs missing. |
| Oriented descent, §§3.4–3.6 | Named: general oriented topoi and derived simplicial direct image missing. |
| Gabber finiteness, §4.2 | Named: constructible étale derived categories and general-base direct image missing. |
| Dimension-function existence/transport and affine Lefschetz, §§5.1–5.7 | Named: immediate étale specialization, strict henselization, dimension functions and constructible étale sheaves missing. |
| Top class, potential complexes, perverse t-structures, existence/uniqueness, biduality and excellent/local duality, §§6.2–6.12 | Named: support, Tate twist, pinning, étale stalk/costalk and derived internal-Hom interfaces missing. Abstract derived categories or t-structures alone do not state these geometric results. |
| Local Lefschetz, §7.3 | Named: local étale supports and the hypersurface restriction map missing. Absolute purity is correctly imported, not duplicated in Lean. |
| Matched-open idempotents, étale tilting and supports, §§8.3–8.6 | Named: henselian perfectoid pairs, sharp quotient comparisons, matched opens and derived étale sections missing. |

Thus no statable headline is now missing and no missing headline is replaced with an artificial surrogate. The file has 278 lines, one `import Mathlib`, the required namespace and docstring, six theorems with sorry and three definitions with real bodies. No `lemma`, `set_option`, sorry'd data, computational algorithm or route-specific prime restriction was found. Every owned Lean name occurs in the README. Definition API/Check completeness has the exception R04; dependency-summary consistency has R03.

### Ownership and supplier-order audit

Object searches used `roadmaps grep` over main and the indexed 362 open heads, together with the board packages and pinned-library searches. The search covered Cohen–Gabber, algebraization, local uniformization, oriented products, dimension functions, dualizing objects, cohomological dimension and étale tilting. A separate Lean-name search for this package's distinctive declarations returned “no match on main or in any open roadmap pull request”. No fully qualified name collision was found. Open-head evidence here is from that provided index; no additional unprovided sibling checkout was assumed.

The base EtaleDualityAndPerverseSheaves is imported and extended, not re-planned. Its finite-type field setting is materially narrower than the general noetherian/excellent setting here. General-topos oriented products extend the supplied scheme-topos object. Absolute purity, coefficient injectivity, perfectoid ring operations, valuation products, Artin approximation and logarithmic modifications are assigned to earlier owners. R02 is the remaining overlap found by object; the actual cohomology-tilting comparison remains this roadmap's responsibility.

All cross-roadmap references were resolved anew. Paths in this table identify the checked roadmap files; line anchors identify especially relevant contracts, not a claim that an entire section fits on one line.

| Supplier and sections consumed | Resolved file and evidence |
|---|---|
| SchemeAndStackFoundations §§0.7, 0.12–0.16, 0.20–0.22; 2.11–2.12, 2.15–2.16; 4.16–4.20 | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:755`, :969, :1032, :1068, :1090, :1099, :1302, :1394, :1462; :3656, :3696, :3867, :3896; :6038, :6075, :6109, :6372, :6411. Henselization, Elkik/Popescu, excellence, finite normalization, ramification sequences, limits, proper descent and alterations are present. |
| EtaleCohomologyFoundations F.0.1–F.0.3, F.1, 0.7, F.2.1–F.2.4, F.3, F.5–F.6, F.8 | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:175`, :200, :231, :439, :460, :592, :692, :1179, :1196, :1266. §0.7 supplies localization/extension by zero over schemes; F.5 is the finite-cd adjoint contract, not a theorem requiring prior dualizing existence. F.3 does not contain the requested arbitrary-noetherian generic theorem. |
| EnhancedDerivedSheaves §§0.1–0.4 and E2 | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:429`, :441, :455, :492, :2293. Tensor–Hom, adjunctions and E2.6 hypercover descent supply the actual operations used in the repaired route. |
| AdicEtaleGeometry A1.14–A1.15 | `TauCetiRoadmap/AdicEtaleGeometry/README.md:5511`, :5673. Coherent sites/topoi and enough points; no analytic comparison is being smuggled into the finiteness proof. |
| PerfectoidSpaces P1.24 | `TauCetiRoadmap/PerfectoidSpaces/README.md:5049`. Integral perfectoid predicate used by the perfectoid suppliers. |
| EtaleDualityAndPerverseSheaves §§0.1–0.2, 1.1, 2.2, 2.4, 2.11 | Open-head `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:105`, :145, :1000, :1463, :1783, :2689. Coefficient duality, supported classes, recollement and finite-type perverse conditions match their stated domains. |
| LefschetzPencilsAndVanishingCycles §§0.2–0.5, 0.10; requested §6.2 gap | Open-head `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:348`, :419, :453, :519, :696, :3294. Trait product and absolute purity are supplied. §6.2 is the trait-perversity owner; the support-bound request is a declared gap, not misreported as already present. |
| ClassicalAdicEtaleCohomology §5.4 | Open-head `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:2708`. `OrientedEtaleProduct`, universal property, Cartesian middle-neighborhood refinements, point pairs and coherent qcqs case are present. |
| DeformationAndDerivedPatchingAlgebra §1.10 | Open-head `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:241`. Cohen-ring and lift infrastructure exists; arbitrary chosen p-basis equicharacteristic coefficient sections are the precise remaining gap. |
| AlgebraicModuliForArithmeticGeometry §§6.0–6.1 | Open-head `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:8907`, :8917, :8937. `polynomial_approximation` and the henselian specialization supply the approximation input, not this roadmap's higher-graded comparison theorem. |
| PerfectoidQuotients §§0.4–0.6 | Open-head `TauCetiRoadmap/PerfectoidQuotients/README.md:767`, :816, :905. Torsion control, p-integral closure, products, completion and étale operations have the stated role. |
| AdicCoefficientsAndComparisonsPartII PA.0.2–PA.0.8, PA.0.11, PA.1.2–PA.1.4, PA.4.1–PA.4.8, PA.5.1–PA.5.4 | `packages/AdicCoefficientsAndComparisonsPartII/design/README.md:83`, :114, :145, :180, :209, :223, :237, :313; :379, :408, :437; :878–:1024; :1074–:1134. Alteration conditions, Riemann–Zariski spaces, very tame/logarithmic modification and stable modification are present. |
| PerfectoidQuotientsPartII Q5.1–Q5.3, Q6.3–Q6.7 | `packages/PerfectoidQuotientsPartII/design/README.md:93`, :109, :125, :249, :265, :283, :299, :315. Product tilts, powered sharp quotients and valuation tilting supply the objects; they do not prove the matched-open étale comparison. |
| ArcTopologyAndDescent §§3.6, 8.3, 8.6–8.9, 11.1–11.2, 11.5, 12.6 | `packages/ArcTopologyAndDescent/design/README.md:519`, :987, :1017, :1027, :1050, :1060, :1343, :1368, :1411, :1483. Components, rigidity, support completion, complete/punctured descent and tilt-invariant covering conditions are present. §11.2 also supplies R02's split-cover result. |
| PurityForFlatCohomology PF.1, downstream only | `packages/PurityForFlatCohomology/design/README.md:104`, :2073. Its local-Lefschetz contract matches §7.3. It creates no upward supplier citation here. |

The citation resolver's four “found nowhere” leads are not findings: AdicCoefficientsAndComparisonsPartII, ArcTopologyAndDescent, PerfectoidQuotientsPartII and PurityForFlatCohomology all exist in the board package index and were read at the paths above. Indexed head texts were used for the new-roadmap suppliers; no revision-only pull request was adopted as a replacement supplier.

The required dependency command with `--movable` returned exactly:

```text
depcheck: 51 roadmaps, 594 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No merge-order edit is requested. All 56 *Needs* entries were read for actual statement and proof-route inputs as well as checked mechanically.

The three gaps in `packages/EtaleDualityAndPerverseSheavesPartII/design/plan.json` match the README's exact contracts by slug, named supplier and needs sentence:

| Gap | Precision and minimality check |
|---|---|
| ILLUSIE-2003 | LefschetzPencilsAndVanishingCycles §6.2; trait normalization, finite-type geometry, affine f, invertible n, constructible F and every q are specified. The general trait support bound is not supplied by the section's current perversity construction. This package owns only its strict-local consequence. |
| equicharacteristic-cohen-coefficients | DeformationAndDerivedPatchingAlgebra §1.10; complete noetherian equicharacteristic local ring, arbitrary residue field and prescribed p-basis lifts are specified. Existing strict Cohen-ring infrastructure does not supply that compatibility. No perfection or finite p-basis restriction is hidden. |
| generic-constructibility-noetherian | EtaleCohomologyFoundations F.3; noetherian base, finite-type source/target, invertible coefficients, dense open, all higher images, eventual vanishing and arbitrary base change are specified. Proper constructibility and field/excellent-trait finiteness do not imply this contract without the requested theorem. |

These are named supplier contracts, not unowned prerequisites. They are not included in the blocking count. Since this verdict needs changes for R01–R02, review.json does not use the acceptance-only conditional_gaps field.

## Not verifiable

- **Ill03, Théorème 2.4:** the original text remains settled as uncertified/paywalled. Its theorem locator is retained. I read ILO14 XV 1.1.3 and 3.3.2, which state/use the relevant input, but that does not certify Ill03's original pages or proof. No new source request was made.
- **Epp73, §§0–1, Theorems 1.3 and 1.9:** the original is likewise settled as uncertified. I verified ILO14's stated reduction and K10's correction, not every step of Epp's original proof. K10 explicitly identifies its corrected p-cyclic statement as Theorem 1.3; the previous report's attribution of that step to Theorem 1.9 is not confirmed by the accessible text.
- **Other published ILO chapters:** locators for chapters without a separately supplied final-version text were checked against the explicitly recorded arXiv v1, not claimed as independently collated against the published pagination. The four final-version chapter files listed in the manifest were read for the stated comparisons.

No additional unavailable source blocks completion of this review. The legal cached texts sufficed for all 15 seeded checks. Proofs of future roadmap theorems are not certified by the sorry elaboration; the mathematical evidence above is the separate adversarial check.

## Source issues

- **Misprint** in ILO14 at II Theorem 4.2.1, printed p. 32 (ILO14 line 1571): the source says the valuation ring's residue field is algebraically closed; it should be its fraction field; affects nothing; corrected in print at ILO-final-II Theorem 4.2.1, pp. 33–34.
- **Misprint** in ILO14 at III Theorem 5.1, printed p. 41 (ILO14 line 1958): the source says X is finite type over S; it should be finite type over the completed base Ŝ; affects nothing.
- **Misprint** in ILO14 at V 3.2.3(i), printed p. 67 (ILO14 line 3000): the source says the dimension condition concerns A′/I+p; it should be A′/(I′+pA′); affects nothing.
- **Misprint** in ILO14 at V 3.2.4, printed p. 68 (ILO14 line 3034): the source says to henselize in t_(d−2); it should be t_(d−1), as in the preceding construction; affects nothing.
- **Gap** in ILO14 at IX Theorem 1.2, printed p. 131 (ILO14 line 5903): the source says irreducibility suffices for the generic-fibre quotient construction; it should be geometric irreducibility, supplying the missing de Jong hypothesis; affects a stated result; corrected in print at ILO-final-IX Theorem 1.2, p. 161.
- **Gap** in ILO14 at XII Theorem 1.2.2 and 1.3.4, printed pp. 189–190 (ILO14 line 9013): the source says the nonabelian descent theorem holds despite an unpublished required limit step; it should be conditional on that step; affects a stated result; corrected in print at ILO-final-XII 1.4, p. 241.
- **Error** in ILO14 at XII 2.1.1, printed p. 191 (ILO14 line 9020): the source says noetherian-scheme diagrams have termwise finite limits; it should use all schemes or finite-type diagrams over a fixed noetherian base; affects a stated result; corrected in print at ILO-final-XII 2.1.1, p. 241.
- **Misprint** in ILO14 at XIV Corollary 2.5.2, printed p. 216 (ILO14 line 10198): the source says to take trdeg of κ(f(y)) over κ(y); it should be trdeg of κ(y) over κ(f(y)); affects a stated result.
- **Misprint** in ILO-final-XIV at Corollary 2.5.2, printed p. 289 (ILO-final-XIV line 477): the source says to take the same reversed residue-field transcendence degree; it should have the extension κ(y)/κ(f(y)); affects a stated result.
- **Misprint** in ILO14 at XVII Theorem 0.9, printed p. 257 (ILO14 line 12220): the source says regular-morphism functoriality uses exceptional pullback; it should use ordinary pullback, as in XVII 4.1.1; affects nothing.
- **Error** in G04 at §8, printed p. 10 (G04 lines 441–451): the source says every local dualizing costalk is one shift of ℤ/n; it should allow separate shifts on the prime-power factors; affects a stated result.
- **Gap** in Epp73 at the equal-characteristic p-cyclic proof, Theorem 1.3, original page uncertified (located by K10, printed pp. 2–3): the source says the leading remaining coefficient is not a p-th power; it should recombine coincident exponents and repeat when cancellation occurs; affects the proof; corrected in print at K10, pp. 1–3.
- **Misprint** in K10 at the coefficients following equation (1), printed p. 2 (K10 line 39): the source says all a_i belong to K; it should say they belong to L, allowing the subsequently defined nonempty set J; affects nothing.
- **Misprint** in K10 at the change of Artin–Schreier variable, printed p. 2 (K10 line 43): the source says d belongs to K⟦t⟧; it should allow d in L((t)), including negative powers and the indicated coefficient roots; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "86986bb5224c28062cba17e8604ed9c47613d2b5", "job": "REV-PKG-EtaleDualityAndPerverseSheavesPartII~2", "model": "gpt-6-astra", "worker": "chris-8"} -->
