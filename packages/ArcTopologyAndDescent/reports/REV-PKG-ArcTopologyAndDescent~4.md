<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1051#issuecomment-6400109612 -->
Review (codex) of 9af1fe1

Verdict: accepted
Conditional on the announced gaps: `coherent-topos-pushouts`, `algebraic-space-perf-tannaka`, `constructible-etale-space-descent`, `perfectoid-tate-constant-comparison`, `bounded-torsion-punctured-approximation`

No package findings. Acceptance is conditional on the five declared supplier contracts listed below. Source errata are recorded separately; they are not defects in the package, which avoids the erroneous assertions.

## Previous findings

All four findings of the preceding review are repaired. The repair report's claims were checked against the files and the mathematics, rather than taken as instructions or evidence by themselves.

| Previous finding | Repaired passage and location | Verification and status |
| --- | --- | --- |
| F01, missing limit headline | `packages/ArcTopologyAndDescent/README.md:452`: “Precisely, let I be a small nonempty cofiltered category, X and Y be I-diagrams of qcqs schemes with affine transition maps”; `Suggested.lean:67` declares `isSchemeArcCover_of_isLimit`. | **Repaired.** Both limit witnesses, both affine-transition hypotheses and all objectwise qcqs hypotheses survive elaboration. The one-object diagram gives precisely the component map. Replacing the source limit by the empty cone gives zero lifts of a field test; the required `hY` excludes it. |
| F02, unsupported map to a component ring | `packages/ArcTopologyAndDescent/README.md:593`: “Since Spec W is connected, its image lies in one connected component of Spec B.” | **Repaired.** The three primes contract to `0`, `(y)`, `(x,y)`, whereas a rank-at-most-one component has at most two points. No map from V to the component ring is asserted. The calculation works over both F₂ and F₃. |
| F03, missing perfect-scheme dependencies | `packages/ArcTopologyAndDescent/README.md:971`: “It is equivalent to SchemeAndStackFoundations §0.24's `Scheme.IsPerfect` for X over F_p”; line 1000 names the full-subcategory, pullback and effective-epimorphism carriers. | **Repaired.** The cited supplier sections exist; line 1008 includes Layer 2. Empty schemes pass both predicates; Frobenius kills the nonzero ε in F_p[ε]/ε², so both fail there. |
| F04, duplicated proper-comparison sentence | `packages/ArcTopologyAndDescent/README.md:1544`: “For I=(p), this is the reduction used in the proof of CMM21 Theorem 6.3.” | **Repaired.** The second occurrence is gone. CMM21 line 2189 uses the p-henselian case. The preceding general statement follows by the two named suppliers, proper base change and affine henselian-pair comparison. |

The changed passages and their Checks were re-evaluated. The same patterns were also sought elsewhere: missing headline signatures, nonexistent maps in valuation arguments, omitted carrier dependencies, and duplicated consumer claims. No recurrence requiring a finding was found. Unsupported blanket assurances in the preceding review were not used to exempt untouched sections from this round's examination.

## Verified sound

The review covered all four package inputs, all 84 numbered targets and their API/Check text, all 84 Needs clauses, all 13 layers, the five definitions and five theorem signatures, the 15 seeded source targets, and the five declared gaps. There are 38 explicit Checks blocks, in addition to labelled supplied-object and limit-theorem Checks. A separate working ledger records computed instances for all 84 numbered targets; the report below retains the sampled targets, headlines and repaired passages, as required for the comment-size limit. These are counterexample searches and mathematical calculations, not a claim that elaboration proves the admitted theorems.

The package develops the general theory: arbitrary-rank valuation inputs, nondiscrete rank-one tests, zero and unit ideal boundaries, arbitrary torsion, both residue-characteristic cases, and the separate stronger residue-invertible bound remain present. It does not replace the theory by a route-specific special case. Existing scheme cover predicates, torsion hyperdescent, Perf v-descent, ordinary Boolean sheaves, and perfectoid carriers are expressly supplied. The new targets have the larger domains identified in Scope and ownership. No re-planning of an existing roadmap, forbidden algorithm, sorry'd data, `set_option`, copied source passage, or cyclic supply was found. The README has the prescribed sections, API lists, discriminating definition Checks, layer Examples and Dependencies. The main-branch roadmaps `TauCetiRoadmap/ComplexTori/README.md` and `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md` were read for the prose shape.

### Seeded source verification

Page numbers below are those of the versions named in References and the manifest, not an assumed match to a different published pagination. Every sampled text was readable. No additional unverified locator was flagged by the author apart from the settled HUB96 certification limit.

| Target | Text opened at locator | Hypotheses and support |
| --- | --- | --- |
| 0.6 Prime intervals | BM21 Definition 4.6, p. 27; BM21 lines 1110–1119 | Quotient/localization, reversed interval arrows and shrinking-chain colimits agree. The README correctly restricts inherited aic-ness to aic V. Directed shrinking families have the same endpoint-union/intersection calculation. |
| 0.7 Smooth approximation | BM21 proof of Theorem 5.14, p. 43; BM21 lines 1813–1818 | The proof uses characteristic-zero valuation algebras as filtered colimits of smooth algebras. The roadmap retains characteristic zero and owns the resolution-to-approximation step; it does not import the characteristic-p perfect-ring Tor calculation as a substitute. |
| 2.5 Affine criterion | BM21 Proposition 2.11, p. 11; BM21 lines 423–439 | The condition is injectivity on every V-module after every rank-at-most-one valuation base change. It is universal injectivity, not merely injectivity of V into the tensor ring. |
| 3.6 Ultraproduct components | BM21 Remark 3.16, p. 20, and Lemma 3.27, p. 22; BM21 lines 816, 928; BS17 Lemma 6.2, p. 21, BS17 lines 966–1005 | Components of the product spectrum are ultraproduct spectra. Aic and valuation axioms pass to ultraproducts. A rank-one bound does not. Empty products and nonprincipal ultrafilters are distinguished. |
| 4.3 Excision | BM21 Theorem 4.1 and Proposition 4.2, p. 25, BM21 lines 1009–1037; Lemma 4.13, p. 31, lines 1288–1306 | Finitary v-sheaf and cotruncated compact-generation hypotheses remain in the equivalence. General Milnor data do not impose Tor-independence. The domain base-change step is separately justified. |
| 4.5 Universal valuation split | BM21 Lemma 4.4, pp. 26–27; BM21 lines 1073–1098 | The conclusion is supported. The roadmap repairs the source proof's omitted kernel case and uses the largest prime over p, rather than incorrectly replacing it by pW. |
| 5.1 Bounded site | BM21 Definition 4.16 and Remark 4.17, pp. 32–33; BM21 lines 1346–1369 | Uncountable strong-limit bound, bounded charts and finite covering subfamilies are retained. This is a universe-sized site construction, not an assertion that arbitrary jointly valuative families have finite subcovers. |
| 5.2 Coherence/points | BM21 Lemmas 4.19 and 4.23, pp. 33–35; BM21 lines 1381–1388, 1443–1469 | Coherent representables, enough points and monic pushout coherence have the right hypotheses. The foundational coherent-site input is a declared gap; the relation criterion has an existing supplier. |
| 6.2 Strict-henselization detection | BM21 Lemma 5.1, p. 37; BM21 lines 1519–1528 and following proof | Detection is applied to universal descent, with continuity and the stated target conditions permitting stalk/totalization comparison. It does not identify global cohomology with a single strict-local value. |
| 9.3 arc_t-equivalences | BM21 Definition 6.19 and Example 6.20, p. 53; BM21 lines 2203–2217 | Restriction on complete aic rank-one t-tests is bijective. Nilpotent reduction and the uniform-denominator example fit; mere existence of a lift does not define equivalence. |
| 9.9 Universal homeomorphisms | BM21 Proposition 6.24, p. 54; BM21 lines 2270–2282 | The arc_t-sheaf invariance argument uses universal injectivity and the Čech nerve, including radicial and nilpotent cases. It is not an assertion about arbitrary topological homeomorphisms. |
| 10.6 Affinoid Künneth | BM21 Proposition 7.5, p. 57; BM21 lines 2373–2379, with conventions at lines 2326–2333 | The completed tensor product and residue-invertible coefficient restriction agree. The all-torsion d+1 theorem is not used to broaden Künneth to residue-characteristic coefficients. |
| 11.1 Complete covers | CS24 §2.2.1, pp. 18–19; CS24 lines 711–753 | Finitely generated ideal, complete valuation tests, locality and rank restriction agree; zero-image tests remain included. |
| 11.4 Punctured covers | MAT22 Definition 5.17 and Remark 5.18, p. 20; MAT22 lines 880–888; CS24 proof of Theorem 2.2.5, p. 20, lines 815–818 | The principal boundary formula is supported. The finite-ideal extension is justified by the explicitly stated three cases IV=0, IV=V, and nonzero proper IV; all principal opens are retained. |
| 12.4 Formal targets | BS22 Proposition 8.10, pp. 67–68; BS22 lines 2619–2621, 2650–2661 | The target formal scheme is arbitrary. The proof first handles affine targets and then descends the continuous underlying map before localizing. The roadmap does not silently impose qcqs on that target. |

The repaired limit theorem was also compared with BM21 Corollary 2.20, p. 14, BM21 line 560; the corrected component obstruction with Remark 3.31, p. 23, lines 977–983; the perfect-scheme headline with Theorem 5.17, pp. 45–46, line 1875; the affinoid bounds with Theorem 7.3, pp. 56–57, line 2340; and the proper-comparison consumer with CMM21 proof of Theorem 6.3, p. 51, lines 2180–2189. The source version information and keys were left unchanged.

### Computed adversarial table

Here k is a field; when needed it is algebraically closed. V₂ is the valuation ring of the composite valuation on k((x))((y)), with v(y)=(1,0), v(x)=(0,1), lexicographically ordered. Its primes are 0⊊p⊊m. V₁ denotes a nonfield rank-one valuation domain. “Pass” means the computed instance agrees with the statement and its hypotheses; no change is requested.

| Statement | Instances tried | Values computed on the compared sides | Result/change |
| --- | --- | --- | --- |
| Conventions; §§0.1, 0.5–0.6 | Field, zero ring, V₂ and its intervals | Spec 0=∅; Spec k has one point. `[0,m]`, `[0,p]`, `[p,m]`, `[p,p]` give V₂, (V₂)_p, V₂/p, κ(p). Shrinking to the first branch inverts x; shrinking to the second kills y. v(y/xⁿ)=(1,−n)>0. | Pass; direction and endpoints agree. |
| §0.7 smooth approximation | Q, Q(t), Q[t]_(t); inseparable characteristic-p control | L_(Q/Q)=0; Ω¹_(Q(t)/Q)=Q(t)dt in degree zero. For F_p(s)→F_p(s^(1/p)), the relation has derivative 0 and H⁻¹ of the cotangent complex is nonzero. | Pass; characteristic zero excludes the negative control. |
| §2.5 purity iff | Identity V₁→V₁; inversion; k[ε]/ε²→k | Identity gives M→M for M=V₁/t². Inversion sends nonzero V₁/t to 0. A map k[ε]→a domain kills ε, so base change of the reduction is V→V. | Pass in both directions on these tests. |
| §2.7 spectral headline | Identity point; generic inclusion; rank-two split | Identity has two subsets, both open. Generic inclusion misses m, whose inverse image is the compact open ∅ although {m} is not open. Split has three image points and exactly four open inverse-image subsets: ∅,{0},{0,p},all. | Pass; neither surjectivity nor reflection is discarded. |
| §2.7 limit headline, F01 | One-object diagram; polynomial tower folds; false source limit | One-object induced map=f. Limit of folds is two copies of Spec k[t₁,t₂,…]→Spec k[t₁,t₂,…], with a section and W=V for every test. Empty source cone has zero lifts over Spec k. | Pass; actual `IsLimit` hypotheses exclude the false cone. |
| §3.6 product components | Two factors; empty product; nonprincipal product of O_(C_p) | Two ultrafilters give two components; empty product has zero components. For a=[p], b=[p^i], 0<v(a) and n·v(a)<v(b) for every standard n. | Pass; nonprincipal component need not have rank one. |
| §3.7 repaired obstruction, F02 | k=F₂ and F₃; V₂→W injective local | Three prime contractions are 0,(y),(x,y), all distinct. Any rank-at-most-one component has ≤2 points. | Pass; 3>2 gives the contradiction without an invented ring map. |
| §§4.1, 4.5 kernel and largest-prime cases | V→κ(m), p=0; V→Frac V, p≠0; field k→W | First square has rings W,0,W,0 and pullback W. Second has W,W,0,0 and pullback W. For k→W all primes contract to 0, so the largest is m_W and W⊗_k k=W_{m_W}=W, generally not Frac W. | Pass; covers all three branches of the corrected proof. |
| §4.3 excision; §4.6 criterion headline | Node k[x,y]/xy; valuation split; terminal functor | Node pullback is `{(f(x),g(y)):f(0)=g(0)}`. Valuation pullback is V₂. Terminal F gives 1=1×₁1. The image v-sheaf of the rank-two split has compatible branch sections but lacks the identity section over V₂. | Pass; v-descent alone is not being renamed arc-descent. |
| §§3.1–3.3 truncation/continuity | Sets; all spaces; infinitely presented affine representable | Maps from a finite set are 0-truncated. Map(*,K(Z,n)) has π_n=Z for arbitrary n. Identity of k[t_i:i≥1] is absent from every finite-variable stage although present at the colimit. | Pass; wrong target and wrong finitariness models fail. |
| §5.1 site size and covers | λ<κ; Q and all Z_(p) over Z | λ^λ≤2^(λ×λ)<κ. The infinite family lifts every valuation on Z; each finite subfamily has zero lifts of the F_q point for an omitted prime q. | Pass; finite covering subfamilies are a substantive condition. |
| §5.2 coherent monic pushout | A={a}⊂B={a,b}, C={c}; nonmonic control | Pushout is {b,c}; the equivalence relation on B⊔C has five ordered pairs. Replacing A by two points with both maps to singleton gives homotopy pushout S¹, whereas the set pushout is singleton. | Pass; monicity excludes the extra loop. |
| §§5.3–5.5 unrestricted excision headline | Two-point cover; Milnor square; sheafified nilpotent reduction | Kernel pair of two points→one has four points. Terminal Milnor values give 1×₁1=1. Reduction has h_Spec(k[ε])^#=h_Spec(k)^#, while unsheafified A¹ values are k[ε] and k. | Pass; sheafification and qcqs conditions remain essential. |
| §6.2 strict-local test | Identity; Spec F₂; closed-point skyscraper on V₁ | Identity comparisons are identities. H¹(F₂,F₃)=F₃, while H¹(Fbar₂,F₃)=0. Skyscraper values are Λ on V₁ and 0 on Frac V₁. | Pass; local detection is not an equality of unrelated global values. |
| §§6.6, 7.3 étale and constructible descent | Split fold; finite coefficient ring Z/4 | Descent of a pair of finite sets requires an isomorphism, so different cardinalities fail. Tor_i^(Z/4)(Z/2,Z/2)=Z/2 for every i≥0. | Pass; constructible does not mean finite Tor dimension. |
| §§7.4–7.6 differential headline | Smooth point, affine line, square-zero thickening | Ω⁰(k)=k, Ω¹(k)=0; Ω¹(k[t])=k[t]dt. Degree-zero h-forms on k[ε] are k, whereas raw Ω⁰ is k[ε]. Z[−1] has H¹=Z. | Pass; the h-upgrade and cohomological shift are discriminating. |
| §7.7 Perf headline | Perfect field; nilpotent perfection; split fold | Perfection of F_p[ε] is F_p; Perf of a field consists of bounded finite-dimensional complexes. Split-fold descent returns one such complex; Tor-unbounded Z/2 over Z/4 is not perfect. | Pass; supplied Perf and fixed bounds are used. |
| §7.8 perfect-scheme headline, F03 | ∅; F_p; F_p[ε]; F_p[t]; perfected polynomial ring | Empty rings have one element; F_p Frobenius is bijective. ε maps to 0, violating injectivity; t has no pth root in F_p[t], violating surjectivity; adjoining all p-power roots fixes it. | Pass; the predicate determines perfect schemes. |
| §7.8 universal effective epi iff | Identity; split fold; ∅→Spec F_p; generic inclusion of perfect V₁ | Identity and fold pass arc and effective-epi tests. Empty→point fails both: two distinct maps from the point to two points agree on ∅. For Frac(V₁)→V₁ the affine equalizer is Frac(V₁)≠V₁, and the closed valuation test has no lift. | Pass in both directions; universality is quantified over actual pullback squares. |
| §§8.1, 8.5–8.6 formal glueing headline | Z→Z_p; I=0; I=1; two generators | Quotients are Z/pⁿ on both sides. I=0 forces B=A and the puncture is empty; I=1 gives whole open pieces and identity horizontal maps. D(x)∪D(y) contains (0,1),(1,0); D(xy) contains neither. | Pass; no single-open shortcut. |
| §§8.4, 8.9 completion/support | Rank one versus V₂; empty support | Z_(p)→Z_p retains p≠0. In V₂, y∈xⁿV₂ for every n, so x-completion kills nonzero y. Empty support complex=0 before and after completion. | Pass; injectivity is not claimed for arbitrary-rank completion. |
| §9.3 arc_t-equivalence | Z_p[x]/px→Z_p; Z_p→Z_p[x] | px=0 in a t-test forces x=0, so restriction is bijective. For the polynomial extension x=0 and x=1 give two lifts of the same base map. | Pass; cover and equivalence are distinguished. |
| §§9.4–9.5 generic-fibre headline | Complete aic V₁; t=0; t unit | Pseudouniformizer case gives H⁰=Λ,H^{>0}=0 of the algebraically closed fraction field. Both boundary cases give the zero generic ring and zero cohomology. Identity hypercover totalization has the same values. | Pass; no 0/0 or missing empty fibre. |
| §§9.7–9.8 uniform denominator | t⁻¹; rank-two V₂ with t=x | Taking n=c+1 would require t⁻¹∈A, contradicting nonunit t. Yet yx^(−n)∈V₂ for all n, so x⁻¹ is ordinarily almost integral using denominator y. | Pass; the target is distinct from native almost integrality. |
| §9.9 universal homeomorphism | Nilpotent quotient; purely inseparable extension L/K of degree p | k⊗_(k[ε])k=k. L⊗_K L=L[u]/u^p, whose reduction is diagonal L. Both nerves become constant after nilpotent invariance. | Pass; includes inseparability and nilpotents. |
| §10.6 Künneth headline | A=B=K×K; zero algebra; K=C₂ | Completed tensor algebra is K⁴; H⁰ tensor is F_ℓ²⊗F_ℓ²=F_ℓ⁴; positive cohomology is 0 here. Zero algebra gives 0 on both sides. Norm 3=1, norm 2=1/2 in C₂. | Pass; residue-invertible restriction is preserved. |
| §§10.1–10.3 analytic route | Rational generators X,1; adjacent tube terms | At X=0, max(0,1)=1 while min(0,1)=0. Transition U_r↦πU_(r+1) takes πʳU_r−f to πʳ⁺¹U_(r+1)−f=0. Separated tests give f=0 and then U_r=0. | Pass; corrected maximum and shrinking direction. |
| §§10.0, 10.8 torsion/vanishing headlines | Z; Z/6; direct sum Z/ℓʳ; A=K,K[ε],0 | Z has 1 of infinite order; Z/6 is killed by 6; the direct sum has elementwise finite exponent but no common exponent. For K and K[ε], H⁰=F_ℓ and H^{>0}=0; for A=0 every group is 0. | Pass; no hidden uniform exponent or nonzero-algebra hypothesis. |
| §10.8 trace and prime bounds | S₃ at ℓ=2,3; C_ℓ; C₂,C₃ | Sylow indices give 3=1 in F₂ and 2·2=1 in F₃. Degree ℓ would give trace composite 0. (g−1)^ℓ=0 for C_ℓ. Norm 2 in C₂ is 1/2 and norm 3 in C₃ is 1/3, excluding the sharper theorem there. | Pass; nonabelian and small-prime controls retained. |
| §11.1 complete-cover definition | I=0; I=1; Z_p→Q_p; completion | At I=0 every valuation is complete. At I=1 no nonzero separated complete valuation exists. Identity test Z_p has zero lifts to Q_p. R→R̂_I has the universal completed lift. | Pass; characteristic-p tests survive. |
| §11.4 punctured boundary formula | I=0; unit ideal (2,3); I=(x,y) | I=0 adds identity factor R/I=R. At F₂ use D(3), at F₃ use D(2), so the unit-ideal family covers. The two axis points belong to the union but not D(xy). | Pass; finite-generator extension is verified. |
| §11.5 complete hyperdescent headline | Identity hypercover; zero/unit ideals | I=0 whole functors give RΓ(R), punctured functors give 0. I=1 gives zero completed/henselian formal object and empty punctures. Identity hypercover totalization returns each value. | Pass; completion is not assumed to commute with filtered colimits. |
| §12.4 formal-target descent | X=Spf O_(C_p), split fold, T=Spf Z_p⟨T⟩; infinite disjoint target | Hom(X,T)=O_(C_p); compatible pairs are exactly (a,a), while (0,1) fails. For a target disjoint union of countably many F_p points and connected characteristic-p X, values are N and the equalizer is the diagonal N. | Pass; arbitrary target need not be qcqs. |
| §12.5 proper comparison, F04 | Proper identity; I=0; p-henselian pair | At I=0 the comparison is identity. For Spec Z_p→Spec Z_p, reduction is Spec F_p and constant sections are Λ on both sides. General comparison uses proper base change and Gabber; CMM uses I=(p). | Pass; general target and specific consumer are separated. |
| §§12.2, 12.6–12.7 perfectoid headline | F_p×O_(C_p); perfect field k; zero ring | p-power torsion is F_p×0; generic ring is C_p. For perfect k, k♭=k and A_inf=W(k); identity hypercover limits are k,k,W(k). For zero ring all three are 0; characteristic-p generic fibre is empty. | Pass; tilt is the inverse Frobenius limit and zero cases are handled. |

### Pinned declarations and duplication by object

The revisions in the package agree with the content manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches used the objects and hypotheses as well as names. The following pinned declarations were opened; their content, rather than a newer online API, was used in the review.

| Pinned file and line | Declaration/content checked | Consequence |
| --- | --- | --- |
| `Mathlib/RingTheory/Valuation/ValuationRing.lean:56`, 64, 406 | Total divisibility in `PreValuationRing`; `ValuationRing` explicitly extends `IsDomain`; `iff_local_bezout_domain`. | Zero ring is not a valuation domain. The native carrier is reused. |
| `Mathlib/Algebra/Group/Units/Hom.lean:270` | `IsLocalHom` reflects units. | Injectivity alone is not a valuation extension. |
| `Mathlib/RingTheory/Flat/TorsionFree.lean:92`; `Mathlib/RingTheory/Flat/FaithfullyFlat/Algebra.lean:60` | Bézout-domain torsion-free/flat comparison; faithful flatness of flat local maps. | The supplied extension equivalence has the required algebraic inputs. |
| `Mathlib/FieldTheory/IsAlgClosed/Basic.lean:78` | `IsAlgClosed.exists_root` is on fields. | The ring aic predicate permitting zero divisors is not duplicate field data. |
| `Mathlib/ModelTheory/Ultraproducts.lean:93`, 154 | Nonempty structures; `sentence_realize`. | Łoś applies to the valuation and each finite-degree monic-root sentence, not to a rank-one bound. |
| `Mathlib/Topology/Spectral/Basic.lean:38`; `Mathlib/Topology/Spectral/Hom.lean:42` | Spectral space includes T₀, compactness, quasi-sobriety, quasi-separatedness and compact-open basis; spectral map preserves compactness of inverse images. | Reflection of openness is genuinely additional. |
| `Mathlib/AlgebraicGeometry/Morphisms/Affine.lean:47`; `Mathlib/CategoryTheory/Filtered/Basic.lean:590` | Affine inverse images; cofiltered category includes nonemptiness. | The limit headline can be stated without an artificial carrier. |
| `Mathlib/CategoryTheory/Limits/Cones.lean:116`, 373; `Mathlib/CategoryTheory/Limits/IsLimit.lean:49` | `Cone`, `Cone.postcompose`, `IsLimit`. | The theorem's map is the induced limit map, not an unconstrained arrow. |
| `Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean:39` | Objects carry the property; morphisms are all underlying morphisms. | The object predicate, not an undocumented restriction on arrows, enforces perfect qcqs schemes. |
| `Mathlib/CategoryTheory/Limits/Shapes/Pullback/IsPullback/Defs.lean:61`; `Mathlib/CategoryTheory/EffectiveEpi/Basic.lean:71` | Cartesian square witness; descent of maps constant on relations, including uniqueness. | The universal effective-epi signature has its actual categorical meaning. Generic universally-effective-epi language exists in Mathlib; the perfect-scheme arc characterization does not follow from it alone. |
| `Mathlib/AlgebraicGeometry/Sites/AffineEtale.lean:59`, 140, 149 | Affine basis functor, sheaf equivalence, Grothendieck abelian instance. | Ordinary torsion sheaf cohomology is statable on native carriers. |
| `Mathlib/AlgebraicGeometry/Sites/EtalePoint.lean:62`, 146, 156 | Geometric points and enough-points instance for arbitrary schemes. | No noetherian assumption is silently borrowed. |
| `Mathlib/GroupTheory/Torsion.lean:56` | `IsMulTorsion`, generating `IsAddTorsion`, is elementwise finite order. | The Lean torsion predicate does not impose a common exponent. |
| `Mathlib/RingTheory/AdicCompletion/Basic.lean:56`, 171; `Mathlib/RingTheory/AdicCompletion/Completeness.lean:151`, 181 | Complete means Hausdorff and precomplete; completion is a quotient inverse limit; finite generation gives the evaluation kernel formula and completeness. | §8.1 uses the native finite-ideal completion theorem, rather than an unowned noetherian-only approximation. |
| `Mathlib/RingTheory/IntegralClosure/IsIntegral/AlmostIntegral.lean:26`, 31, 86 | Arbitrary regular denominator; complete integral closure; noetherian integral comparison. | §9.7's uniform powers of a fixed t are a distinct condition, as the rank-two witness shows. |
| `Mathlib/RingTheory/MvPowerSeries/Restricted.lean:33`, 107 | Restricted series predicate and subring. | The finite unit-polyradius presentation uses native series. |
| `TauCeti/RingTheory/Huber/TopologicallyFiniteType.lean:133`, 150, 207, 273 | Strict finite type uses a compatible finite-variable completed-series open quotient; presentations, quotients and identity examples. | The Lean hypothesis is a genuine affinoid presentation. The general predicate itself does not include target Hausdorffness/completeness; the field-affinoid situation supplies the needed consequences. |

The object audit also searched the pins for arc/v sites, coherent sheaf categories and totalizations, perfect scheme/perfection and Perf interfaces, integral perfectoid complete hypercovers, algebraic/formal-space mapping descent, and the five theorem names. Existing categorical machinery is imported; it does not supply the absent coherent geometric interfaces wholesale. No existing pinned theorem was found that is simply re-declared as one of the five acceptance theorems.

`roadmaps grep` was used for arc covers, arc descent/topology, ultraproducts, Milnor excision, universally effective epimorphisms and differential descent across main and indexed open roadmap heads. A separate fully qualified namespace search found no match on main or any indexed open roadmap head. Available board package/design files were searched by the same objects, and all 19 indexed board-head READMEs were requested. Four were retrieved and searched: AnalyticNumberTheory, AutomorphicCongruences, KatoEulerSystems and LogicAndDefinabilityInNumberTheory. The last imports native Łoś transfer (README lines 14, 49, 313) for AKE applications, rather than owning the product-spectrum/component theorem here. No competing general arc construction appeared in these four texts. The 15 failed head reads are recorded below, without treating absence from this checkout as absence of a roadmap.

### Supplier resolution and order

`roadmaps resolve` found no unresolved cross-roadmap citation or backticked Lean name at the indexed main/open heads. Its leads were checked against the cited sections; pinned declarations were checked locally because the resolver's own checkout does not establish the pin. Readable new-roadmap heads were inspected with `roadmaps show`; existing-roadmap contracts were checked on main. The important ownership divisions resolved as follows (all roadmap paths are under `TauCetiRoadmap/`).

| Supplier and resolved location | Actual supplied scope; ownership conclusion |
| --- | --- |
| `SchemeAndStackFoundations/README.md`, §§0.9, 0.11–0.14, 0.24–0.25; perfection starts line 1565 | Approximation, integral closures/henselian pairs and scheme perfection exist. The acceptance-file sectionwise predicate is a small native expression for the supplied perfect-scheme notion, not another perfection construction. |
| `SchemeAndStackFoundations/README.md`, §§1.1–1.10, §1.4 at line 2150, §§2.1–2.3, 2.5, 2.7, 2.11, 2.14–2.15 | Algebraic spaces and descent, cohomological functoriality, constant characteristic-primary affine vanishing, continuity and the full henselian-pair theorem are present. The three stronger contracts remain explicitly declared gaps, not false claims that these sections already supply them. |
| `SchemeAndStackFoundations/README.md`, §§4.7–4.8, 4.11–4.12, 4.16 | Formal spectra/maps, modifications, flattening and alterations are present with their own hypotheses. |
| `PrismaticCohomology/README.md`, §2.0; §§0.79–0.82 and perfect-prism contracts | Scheme v/arc predicates, arbitrary-torsion hyperdescent, constructible finite-coefficient descent, p-parameter formal comparisons and perfectoid basis/structure sheaf are already owned there. ArcTopologyAndDescent imports them and extends coefficients/parameters/target categories where specified. |
| `DiamondsAndVStacks/README.md`, §§D0.6, D0.11–D0.12, D0.16, D0.18, D0.22 | Components, spectral submersions/limits, profinite spaces and ordinary Boolean sheaves are supplied. §D0.22 has product-over-clopens and inhabitedness for set ultraproducts; the present infinity-categorical/ring-product extensions are distinguished. |
| `EnhancedDerivedSheaves/README.md`, E0, §§0.1–0.4, E1.3–E1.6, E2.6–E2.8, E4.1–E4.3, E5:abstract.5 and E5:descent | Coherent enhancements, perfect characteristic-p algebra, hypercovers, finite inductive level, derived completion and module descent are present. Arbitrary-ring Tor-independence is not inferred from perfect-ring Tor vanishing. |
| `EtaleCohomologyFoundations/README.md`, §§F.0.1, 0.5–0.7, F.2.1–F.2.6, F.3, G.1–G.3 | Constructible continuity, proper base change for arbitrary torsion, invertible-order field Künneth, affine vanishing and compactifications are supplied. Infinite coefficient Tor dimension is not accidentally excluded. |
| `ClassicalAdicEtaleCohomology/README.md`, §§6.1, 6.3, 2.5–2.6 | Injective-local valuation extensions, strict henselianity and the full sheaf-level valuation base change are present. Analytic comparisons retain their actual hypotheses. §2.6's normalized perfectoid case is narrower than the declared integral-model extension. |
| `AdicEtaleGeometry/README.md`, §§A1.0.5, A1.15 | Regular-parameter henselian finite étale approximation and Deligne enough points are present. The bounded-torsion/finite-ideal extension is declared rather than silently assumed supplied. |
| `AdicSpacesPartII/README.md`, §§R0.3, R0.9, R0.13, R0.19, R1.1, R1.3, R1.9; §R0.19.10 relation criterion at line 8039 | Analytic tensor/carrier comparisons and qcqs topos objects are supplied. `Topos.isQuasiseparated_iff_of_cover` is present. It does not by itself supply the missing coherent-representable theorem. |
| `AdicSpaces/README.md`, Layers 0–1; `RigidAnalyticGeometry/README.md`, §§1.1–1.3, lines 177, 205, 235 | Huber/Tate rings and Spa; affinoid presentations, Noether normalization, dimension and tensors are supplied. The 2d estimate is an upper bound from finiteness over a Tate algebra, not an unsupported dimension equality. |
| `SchemeKTheoryOperations/README.md`, §§3.4, 4.10 | Supported K-theory and enhanced Perf v-hyperdescent with fixed Tor bounds are supplied. §7.7 owns only the arc upgrade. |
| `GeneralAlgebraicKTheory/README.md`, §§8.5–8.6, 10.9, 10.12 | Milnor Mayer–Vietoris and relative excision: isomorphisms in degrees ≤0, surjectivity in degree 1. The package preserves that distinction. |
| `DerivedModuleAlgebra/README.md`, §§0.2, 0.4, 0.7–0.8, 0.11–0.12, 0.14, 1.1–1.9; `DerivedDeRhamCohomology/README.md`, §§2.1–2.26 | Tensor/cotangent/exterior powers, completion, forms and de Rham constructions are supplied. The h-sheaf extension is new here, not another construction of those objects. |
| `PerfectoidSpaces/README.md`, §§P1.4–P1.8, P1.15, P1.20, P1.24–P1.25, P1.27, P2.2, P3.2, P3.9–P3.12, P3.20; `PerfectoidQuotients/README.md`, §§0.4–0.6 | Integral/Tate perfectoids, tilt and valuation/étale comparisons, torsion removal, products, completed tensors and henselization are supplied. Complete-arc hyperdescent is the new target. |
| `ResolutionOfSingularitiesCharacteristicZero/README.md`, §§5.1–5.2 | Characteristic-zero principalization and embedded resolution are supplied. §0.7 owns their valuation ind-smooth consequence. |

The declared contracts have identical slugs in `packages/ArcTopologyAndDescent/design/plan.json` and the README's Exact supplier contracts. Each names an earlier supplier and specifies the missing hypothesis range. None was found to duplicate an already supplied theorem in the inspected sources.

| Conditional gap | Supplier | Minimal missing interface |
| --- | --- | --- |
| coherent-topos-pushouts | SchemeAndStackFoundations §2.5 | Coherent sheafified representables for essentially small finite-limit sites with finite covering subfamilies. The quotient criterion is already supplied separately. |
| algebraic-space-perf-tannaka | SchemeAndStackFoundations §1.4 | Coherent exact symmetric-monoidal Perf reconstruction for qcqs target algebraic spaces and arbitrary source algebraic spaces. |
| constructible-etale-space-descent | SchemeAndStackFoundations §§1.2–1.10 | Effective qcqs étale-space descent on arbitrary qcqs bases and the constructible finite-set sheaf equivalence, with the separated-scheme subcategory retained. |
| perfectoid-tate-constant-comparison | ClassicalAdicEtaleCohomology §2.6 | Comparison for the image of a general p-complete integral perfectoid in its generic ring, compatible with powerbounded replacement, restriction and tilting. |
| bounded-torsion-punctured-approximation | AdicEtaleGeometry §A1.0.5 | Finite étale approximation on the stated bounded-torsion henselian opens and noetherian finite-ideal complements, with restriction/gluing compatibility. |

The required dependency check, with `--depcheck`, `--name ArcTopologyAndDescent`, the supplied order and `--movable`, returned:

```text
depcheck: 52 roadmaps, 596 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. The order and the tooling were not edited. No ownership move is required by this review.

### Headline coverage, elaboration and padding

The README's headline results are the general finitary arc/Milnor/aic-excision equivalence and rank-one detection (§§4.6–4.7); universal spectral characterization and affine-transition limit stability (§2.7); unrestricted Milnor excision (§5.5); étale-object descent (§6.6); h-differential descent (§7.6); Perf-on-perfections hyperdescent and canonical perfect-scheme covers (§§7.7–7.8); formal glueing (§8.6); arbitrary-parameter completed-generic-fibre descent (§9.5); affinoid Künneth and both vanishing bounds (§§10.6–10.8); finite-ideal complete hyperdescent (§11.5); and integral perfectoid, tilt and A_inf hyperdescent (§12.7).

The five statable headline signatures are present:

| Declaration | README match | Signature audit and probe |
| --- | --- | --- |
| `arc_spectral_characterization` | §2.7 | qcqs schemes/map; all qcqs base changes; surjectivity plus compact-open reflection. `simp`, `rfl`, `infer_instance` each fail. |
| `isSchemeArcCover_of_isLimit` | §2.7 | Nonempty cofiltered category; objectwise qcqs; both affine-transition systems; both actual limit cones; component cover hypothesis. Same three probes fail. |
| `arcCover_iff_universallyEffectiveEpi` | §7.8 | Prime p; full category of qcqs perfect F_p-schemes; all cartesian base-change squares; actual `EffectiveEpi`. Same three probes fail. |
| `affinoid_artin_grothendieck` | §10.8 | Complete algebraically closed nontrivially normed ultrametric K; actual strict finite-type structure map; dimension upper bound d; elementwise torsion; q>d+1. Same three probes fail. |
| `affinoid_artin_grothendieck_prime_to_residue` | §10.8 | Same native analytic hypotheses; prime ℓ and norm ℓ=1; affine-section ℓ-primary torsion; q>d. Same three probes fail. |

The remaining headline families are named in the module docstring with their missing coherent sites, enhancements, Perf/perfection, algebraic-space or integral-perfectoid interfaces. No free Prop-valued substitute or bounded stand-in was used. The five real-bodied definitions are precisely the simple predicates needed by these signatures.

The requested `lake env lean` elaboration of `packages/ArcTopologyAndDescent/Suggested.lean`, run from the pinned content checkout, exited 0 with exactly five warnings, all for `sorry`. No import was missing. A scratch copy containing `#check @name` for all ten declarations also elaborated; all elaborated binders were compared with the README, with no lost hypothesis found and no change made. On that copy, fifteen `fail_if_success` probes established that none of the five theorems closes by `simp`, `rfl` or `infer_instance`. Reading the pinned object-level candidates found no single library lemma providing any of the five conclusions. In particular, generic categorical effective-epimorphism lemmas do not connect to the valuation predicate, and affinoid cohomological dimension is not native tautology. No padding declaration was found.

## Not verifiable

- **HUB96 text.** The manifest settles this work as uncertified. Its printed locators, including Corollary 3.2.2 and Corollary 4.2.7, remain citations without direct text certification. No renewed source request was made. The consuming roadmap contracts and the readable BM21/BS22 proof routes were checked; that does not certify the inaccessible book itself.
- **Board heads outside this branch.** All 19 indexed package READMEs were requested at their specified heads; four were readable and 15 requests returned HTTP 404. Ownership against the following head texts could not be certified. Available local board files and the indexed main/open-roadmap corpus were searched; they do not replace these inaccessible files. No assertion that an object “exists nowhere” is made.

| Unreadable board package README | Specified head | Reason |
| --- | --- | --- |
| `packages/ArithmeticLocallySymmetricSpacesPartII/README.md` | `c1b8f80` | HTTP 404 |
| `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md` | `777a863` | HTTP 404 |
| `packages/CrystallineCohomologyPartII/README.md` | `3808b1d` | HTTP 404 |
| `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/README.md` | `78eadae` | HTTP 404 |
| `packages/HigherHidaAndColemanTheory/README.md` | `519048f` | HTTP 404 |
| `packages/LawrenceVenkateshMethod/README.md` | `9ee7ac3` | HTTP 404 |
| `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md` | `7e88c38` | HTTP 404 |
| `packages/PELModuliPartII/README.md` | `d4bb48d` | HTTP 404 |
| `packages/PadicHodgeTheoryPartII/README.md` | `6502997` | HTTP 404 |
| `packages/PadicLocalLanglandsForGL2QpPartII/README.md` | `3e0777d` | HTTP 404 |
| `packages/RealSurfacePeriodIndex/README.md` | `875bca4` | HTTP 404 |
| `packages/SchemeAndStackFoundationsPartII/README.md` | `accb0a0` | HTTP 404 |
| `packages/ShimuraVarietiesPartII/README.md` | `57dc0a4` | HTTP 404 |
| `packages/VStackSheavesAndLisseCategoriesPartII/README.md` | `0987ba7` | HTTP 404 |
| `packages/VectorBundlesAndIsocrystalsPartII/README.md` | `b58d862` | HTTP 404 |

All 15 sampled source targets were readable. No additional source was fetched, no manifest entry was changed, and no new missing-reference request was needed. The five declared supplier gaps are explicit acceptance conditions, not items misclassified as unverifiable or unowned prerequisites.

## Source issues

- **Error** in BM21 at Lemma 4.3, pp. 25–26 (BM21 lines 1040–1049): the source says the extended prime contracts correctly for any map with proper extended ideal; it should be restricted by ker(f)⊆p; affects a stated result.
- **Gap** in BM21 at proof of Lemma 4.4, pp. 26–27 (BM21 lines 1080–1098): the source says the proper-extended-ideal case follows directly from Lemma 4.3; it should be split further when p is strictly below the kernel, yielding the trivial square; affects the proof.
- **Misprint** in BM21 at Definition 4.6, p. 27 (BM21 lines 1108–1115): the source says interval rings of an arbitrary valuation ring are absolutely integrally closed; it should be conditional on the original valuation ring being absolutely integrally closed; affects a stated result.
- **Misprint** in BM21 at Remark 3.31, p. 23 (BM21 line 977): the source says Proposition 3.29 supplies the product-cover argument; it should be Proposition 3.30; affects nothing.
- **Gap** in BM21 at Remark 3.31, p. 23 (BM21 lines 980–983): the source says the component rank bound rules out the higher-rank valuation lift; it should be justified by three distinct contracted primes in one component, which has at most two points; affects the proof.
- **Misprint** in BM21 at proof of Lemma 7.8, pp. 58–59 (BM21 lines 2458–2460): the source says the minimum of the unit-ideal generators' norms is uniformly positive; it should be the maximum; affects the proof.
- **Misprint** in BS22 at end of proof of Proposition 8.10, p. 68 (BS22 lines 2660–2661): the source says X→Y supplies the quotient map and descends a map from Y; it should be Y→X and the descended map should have source X; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "9af1fe1682bee639fad990cd2e1c4ed3fd031f50", "job": "REV-PKG-ArcTopologyAndDescent~4", "model": "gpt-6-astra", "worker": "chris-30"} -->
