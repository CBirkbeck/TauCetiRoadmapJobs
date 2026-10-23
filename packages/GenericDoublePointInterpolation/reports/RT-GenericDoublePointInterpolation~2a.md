<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/144#issuecomment-6371028082 -->
Red team round 2 pass a (codex) of fc55b70

Verdict: needs_changes

1. **F01** (P2) Fixed homogenization duplicates an existing main-roadmap construction

   **Location:** packages/GenericDoublePointInterpolation/README.md:251: “the fixed-degree homogenization is a linear equivalence”. The ownership claim is also at line 36.

   **Claim:** This roadmap constructs fixed-degree homogenization, its monomial formula and inverse by a new basis transport.

   **Witness:** TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:1740–1775 already supplies block homogenization over every commutative ring, linearity, coefficients, homogeneity and both dehomogenization identities. One block gives exactly this construction.

   **Exact repair text:** “Import DiophantineApproximationAndTranscendence §2.7 block homogenization with one block, affine variables Fin r and block degree d. Restrict it to V(R,r,d), rename its unique homogenizing variable to None and affine variables to Some, and bundle its supplied inverse identities into the linear equivalence with homogeneousSubmodule. This roadmap owns only that native-carrier adapter and its section comparison.” Add this supplier and replace the independent reconstruction in the proof plan.

   **Repair test:** R=ℤ, r=1, d=2, f=1+x gives X₀²+X₀X₁ under both constructions; setting X₀=1 gives 1+x. For r=0, 1 maps to X₀^d in both. This supplier is on main, so no upward dependency is introduced.

2. **F02** (P2) The generic-contact gap does not specify a valid general theorem

   **Location:** packages/GenericDoublePointInterpolation/README.md:154: “give generic smoothness and generic differential-rank/image-dimension comparison in characteristic zero and the tangent-incidence contact-fiber statement”; design/plan.json:14 has the same compound request.

   **Claim:** A finite-type characteristic-zero geometry contract supplies all three results, without specifying its morphism, reducedness/smoothness assumptions, or differential-rank conclusion.

   **Witness:** Over ℂ, Spec(ℂ[ε]/ε²)→Spec ℂ has no nonempty smooth locus. Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:361 already supplies dense smooth locus for reduced locally finitely presented schemes over perfect fields; the missing relative result must be distinguished.

   **Exact repair text:** “Reuse Mathlib’s AlgebraicGeometry.Scheme.Hom.dense_smoothLocus_of_perfectField with its reducedness and local finite-presentation hypotheses. What SchemeAndStackFoundations must provide (gap:generic-contact): for a dominant morphism f:X→Y of smooth integral finite-type schemes over a characteristic-zero field, give a dense open X° on which f is smooth of relative dimension dim X−dim Y and its tangent differential is surjective. Layer 3 derives the Veronese contact-fiber assertion from this relative theorem and the specified secant incidence.” Replace the plan’s needs sentence with this precise relative contract.

   **Repair test:** The nonreduced dual-number example is excluded. For f:A²_ℚ→A¹_ℚ, (x,y)↦x, tangent rank is 1=dim Y and relative dimension is 1=2−1. For x↦x², the open x≠0 has differential rank 1 and relative dimension 0.

3. **F03** (P2) The finite-flat gap combines two different missing constructions

   **Location:** packages/GenericDoublePointInterpolation/README.md:180: “finite locally free pushforward … with proper projective tangent-line parameters”; design/plan.json:24 repeats the compound request.

   **Claim:** One supplier gap requests both pushforward/base change and a universal tangent-direction scheme, without specifying the ambient smooth scheme for the latter.

   **Witness:** For smooth A²_k the direction space is P¹_k and each incidence has length 2. For Spec k it is empty. An arbitrary finite-flat morphism supplies neither an ambient tangent space nor this projective family.

   **Exact repair text:** “Keep gap:finite-flat-sections for: if f:Z→S is finite locally free and L is invertible on Z, then f_*L is finite locally free of rank rank(f), and its comparison with pushforward commutes with every base change. Declare gap:tangent-direction-incidence, with the same named Part II supplier, for: if X/k is smooth separated of finite type, P_X(Ω¹_(X/k)) parametrizes rank-one cotangent quotients and carries the universal closed length-two subscheme of the first infinitesimal diagonal neighborhood, finite locally free of rank two over that parameter scheme, compatibly with base change.” Add the matching plan entry and point each consumer to the appropriate contract.

   **Repair test:** For X=A² the quotient convention gives P¹ and the fiber k[ε]/ε²; for X=Spec k the projectivization of the zero cotangent module is empty. For f:Spec(k×k)→Spec k and L=O, pushforward has rank 2, and base change to k[ε]/ε² gives two copies of that ring.

4. **F04** (P2) The field-generality repair creates a forward proof dependency

   **Location:** packages/GenericDoublePointInterpolation/README.md:1153: “Needs: Bounded integer specialization for an arbitrary nonzero selected minor”.

   **Claim:** The build order proves the nonzero maximal minor over k before proving the integer specialization it explicitly consumes.

   **Witness:** The required specialization is at README.md:1198; its own predecessors are the degree bound at 1157 and principal-open criterion at 1180. All three occur after the consuming target at 1149.

   **Exact repair text:** “Order Layer 5 as universal matrix and selected determinant; degree bound; evaluation prime and principal-open full-jet criterion; bounded integer specialization for arbitrary nonzero minors; existence of a nonzero maximal minor in the endpoint range; generic affine Hermite interpolation; polynomial parameter pullback. Keep the endpoint over every characteristic-zero field. Add Nonzero maximal minor to the generic affine theorem’s Needs line.”

   **Repair test:** For k=ℚ, r=n=1, d=5, columns (1,x) give Δ=1 of degree 0≤10; the already-established grid theorem supplies P=0, then the endpoint follows. No use of the endpoint is needed to establish the grid theorem.

5. **F05** (P3) The extra-coordinate Check fails at degree zero

   **Location:** packages/GenericDoublePointInterpolation/README.md:213: “For r=0 and every d … adding a spurious affine coordinate gives the wrong count.”

   **Claim:** Adding one affine variable changes the bounded-monomial count for every degree.

   **Witness:** At d=0, A(0,0) and A(1,0) both contain only the zero exponent: choose(0,0)=choose(1,0)=1. This negative control does not distinguish the wrong index type.

   **Exact repair text:** “For r=0 the unique exponent gives choose(d,d)=1. At d>0 an extra affine coordinate instead gives d+1>1; at d=0 both counts are 1, so that boundary case is only a positive Check.”

   **Repair test:** At d=0 both sides remain 1; at d=2 the intended count is 1 and the extra-coordinate count is 3.

6. **F06** (P2) The seven subspace base witnesses are missing from the acceptance test

   **Location:** packages/GenericDoublePointInterpolation/README.md:796,812,828: “Three-subspace cubic base rank witnesses”, “Two-subspace cubic base rank witnesses”, “One-subspace cubic base rank witnesses”; Suggested.lean:100–121 states only the other finite bases.

   **Claim:** The accepted finite bases cover the twelve neighboring ranks, plane sextics and P⁵ quartics, but omit all seven codimension-three base configurations. The docstring's missing projective-section carriers do not prevent stating these finite polynomial assertions.

   **Witness:** Pinned Submodule, Module.finrank, MvPolynomial.IsHomogeneous, eval and pderiv state the containing/singularity conditions directly. Mathlib/LinearAlgebra/Projectivization/Basic.lean:48,60 supplies projective supports and :110 tests their equality. No sheaf or relative-incidence carrier is needed.

   **Exact repair text:** “Add three finite-base headline theorems, named in their README targets. For r∈{5,6,7}, assert existence of three rational vector subspaces of dimension r−2, with the prescribed general-position span dimensions and three pairwise projectively distinct nonzero support vectors on each, such that a homogeneous cubic vanishing on those subspaces and having all partials zero at those vectors is zero. State the corresponding two-subspace assertion for r∈{5,7}, with r−2 supports on each and three outside. State the one-subspace assertion for r=5 and r=7 with the README's exact support counts; in r=5 include Q∈L and a transverse vector w∉L, and the actual value/directional-derivative conditions at Q. Use native submodules, projectivization and polynomial evaluation, with only real-bodied vanishing predicates if needed.” These are the specified finite assertions, not replacements for the unavailable general geometric recursions.

   **Repair test:** The independent finite matrices here give three-space ranks 56,84,120, two-space ranks 56,120, and one-space ranks 56,120, so every asserted homogeneous cubic kernel is zero. In the r=5 remainder, w∉L gives length/trace 2/1; omitting transversality would allow a direction already contained in L and would lose that additional condition.

## Earlier findings: verification at this head

All quotes below are from the repaired package, not the earlier review. `A` identifies round-one pass a and `B` identifies pass b. README and Lean locators in this table mean packages/GenericDoublePointInterpolation/README.md and packages/GenericDoublePointInterpolation/Suggested.lean respectively.

| Earlier finding | Status | Repaired passage and independently checked witness |
| --- | --- | --- |
| A F01, admitted foundational data | Repaired | Lean:55 “MvPolynomial.aeval”; Lean:61 “(⨅ i, RingHom.ker …) ^ 2”; Lean:135 “firstJetMatrix …”. All twelve non-theorem declarations have real bodies; no data admission survives. At P=3, x² evaluates to (9,6). |
| A F02, 55 admitted examples | Repaired | Lean:6 “It states the headline theorems”. There are zero examples and exactly eight theorem admissions; the 59 README Checks now carry the examples. The former recommendation to retain examples was correctly superseded by acceptance-test policy. |
| A F03, module form | Repaired | Lean:1 “import Mathlib”; Lean:4 “GenericDoublePointInterpolation: target signatures”; Lean:18 “namespace TauCetiRoadmap.GenericDoublePointInterpolation”. Five layer comments, declaration docstrings, no options or subimports. Layer 2 has no Lean target and needs no comment. |
| A F04, wrong Mathlib pin | Repaired | README:105 “6b7abb3c7686292736be2955bd3eb9ebf63b456a”. All fifteen Mathlib source links use the manifest revision; the Tau Ceti revision also agrees with lake-manifest.json. |
| A F05, invented SF continuation | Partly repaired | README:149 “What SchemeAndStackFoundations must provide (gap:cartier-residual)”; 154 and 160 declare the other two gaps. All three slugs match design/plan.json. Main §§0.28, 2.6, 5.12 exist; S02 records remaining imprecision in generic-contact. |
| A F06, duplicate Euler theorem | Repaired | README:126 “Mathlib also supplies MvPolynomial.IsHomogeneous.sum_X_mul_pderiv”. No homogeneousEuler declaration remains. The pinned EulerIdentity.lean:73 includes degree zero and commutative semirings; at F=X², ΣX∂F=2X². |
| A F07, missing finite bases | Repaired | Lean:102 “theorem nearExceptionRanks”; 111 “theorem sexticPlane”; 117 “theorem quarticFive”. The twelve neighboring ranks, 27/28 sextic ranks and rank 126 were recomputed at distinct integer lifts. |
| A F08, no source manifest | Repaired | sources.toml:1 “schema = \"tauceti-roadmap-sources/v1\"”; entries BO and COU have hashes, legal provenance and versions matching the supplied texts. No third cited work is hidden behind an unrecorded bibliography item. |
| A F09, invented moduli labels | Partly repaired | README:167 “Consume §1.1”; 170 gives “projectiveSpaceCechComparison”; 174 gives “rankLocus”; 175 gives “hilbertFunctorAsQuot”. All exist at the indexed head with the cited hypotheses. S03 concerns the newly combined finite-flat gap, not missing supplier exports. |
| A F10, zero-ring negative Checks | Repaired | README:263 “Over a nontrivial ring”; 327 “in the zero ring this jet is zero”. Also 365, 367, 417, 438, 458 carry nontriviality. At the zero ring the tested polynomials and jets all equal 0. |
| A F11, README/Lean names | Repaired | README:59 names Bounded, Monomials, monomialsFintype; 68 names JetRows; 1188 names genericAffinePrincipalOpen. All twenty retained names occur in the README, and all own backticked declaration names occur in Lean. Removed API names remain ordinary mathematical prose. |
| A F12, incompatible mixed limits | Repaired as a declared contract; settled | README:675 “Every selected mixed stratum must still dominate its specified support stratum”; 686 “proper limits along traits do not establish this requirement”. The five required geometric/rank conditions and matching gap entry exist. The repair's “not actionable in this package” settlement is accepted; no re-raise. |
| A F13, finite-scheme Castelnuovo generality | Repaired | README:597 “For every finite closed X⊂P^r_k”. The earlier full-double-only restriction is gone. The transverse direction has 2=1+1 and the tangent direction 2=0+2; both are now legitimate inputs. |
| A F14, extra residual independence | Repaired | README:991 “form a subscheme of the successful residual setup”; “no extra rank added to the already filled system”. For r=3,d=6,q=21,u=9,e=1, ranks 54 or 55 lie inside the successful rank-56 system. |
| A F15, minor locator | Repaired | README:1155 “pp.491–492: generic rank on p.491 and polynomial minors on p.492”. COU line 242 introduces the polynomial minors; line 195 supplies the matrix criterion. |
| A F16, absent construction Checks | Repaired | README:1143–1145 gives determinant “1”, “−1” and “0”; 1174–1176 gives origin, distinct kernels and Spec k. Recomputed values are 1,−1,0,1; (T)≠(T−1); nr=0 gives kernel 0. Unused scheme wrappers are deleted. |
| A F17, ring/field disagreement | Repaired | README:353,404,424,444,474 all say “commutative ring R”. Lean:53,59,72,86 retain CommRing explicitly. Field hypotheses remain on CRT, rank and well-poisedness. Over ℤ the ideals for 0 and 2 sum to (x,2), so the field-only CRT qualification matters. |
| B F01, nine easy theorem admissions | Repaired | Lean:6 “headline theorems”. None of the nine names remains declared. The eight remaining theorems require interpolation, quotient or polynomial-grid arguments beyond one pinned lemma or unfolding. |
| B F02, admitted prime field | Repaired | Lean:146 “RingHom.ker_isPrime _”. The native theorem at Ideal/Maps.lean:845 requires a domain target, supplied by Field k. At P=0 in one variable the ideal is (T), and 1 is excluded. |
| B F03, TeX displays | Repaired | README:15 “m = n(r+1) ≤ N(r,d) = choose(r+d,d).” No dollar delimiters, TeX control fragments or option overrides remain in README/Lean. |
| B F04, algebraic closure on affine endpoint | Repaired; new order defect S04 | Lean:149 “theorem genericAffinePrincipalOpen … [Field k] [CharZero k]”. The three endpoint/grid/pullback signatures contain no IsAlgClosed. Over ℚ, Δ=1 and P=0 verify the simplest case. The expanded proof has the forward edge recorded in S04. |

## Verified sound

Read all **1,303 README lines** and **184 Lean lines**, all **20 declarations** (6 definitions, 5 abbreviations, 1 instance, 8 theorems), **78 bold mathematical targets**, **59 individual Checks**, and **42 API bullets**. The two additional unbolded constructions, selectedMinor and evaluationPrime, are also included below. All 59 Checks were evaluated; S05 corrects one universal negative-control clause, while the other computed values agree.

Compared every supplied elaborated signature with its actual declaration and README scope. No new Lean elaboration or build was run. All eight admitted statements have their required explicit field, characteristic, injectivity, degree or nonvanishing hypotheses. The 12 supporting constructions have genuine bodies on native carriers. The ring/general-field boundaries, empty indices and zero ring do not give a counterexample to a kept Lean statement.

Verified **24 source-locator groups** against the legal BO v2 and published COU extracts, with all 78 target attribution blocks mapped to those groups below. Some targets are explicitly identified algebraic reformulations or authored finite witnesses; the source does not assert their Lean formulation or contain the new modular certificates. Verified **10 named cross-roadmap supplier exports** at **7 cited sections**: three IdealPullback exports, projectiveSpace_cohomology, bezout_inequality, projectiveBundle/integerTwists, projectiveSpaceCechComparison, rankLocus and hilbertFunctorAsQuot. IntegralLattices' main roadmap owns the general lattice theory attributed to it. There are **zero citations to the 26 supplied sibling roadmaps**; all **52** of their README/Lean files were searched by object. Their first-jet and rational-double-point matches concern different objects.

Ownership searches used the required `roadmaps grep` index, main and Completed, board packages, and the 26 supplied sibling heads. Main DiophantineApproximationAndTranscendence §2.7 is the earlier owner in S01; its open revision was not used as a supplier. Pinned Mathlib has only the univariate Polynomial.homogenize for this purpose. Tau Ceti's homogeneous monomial basis and finrank results in TauCeti/RingTheory/MvPolynomial/Finrank.lean do not already supply the bounded affine/slack-coordinate equivalence. Polynomial jet-algebra/CRT adapters and the actual interpolation arguments remain this roadmap's work. No competing fully qualified declaration name was found.

The arithmetic audit independently produced **22** exact nonzero-minor rank witnesses over F₁₀₁ (15 affine configurations and 7 subspace configurations). For the latter, support vectors were integer combinations of integer frames before reduction; the frame ranks, pair/triple spans, distinct projective supports, outside-support conditions and transverse remainder direction were verified. Thus the witnesses retain the required incidence over ℚ. All 22 ranks equal the required dimensional upper bounds. This is evidence for the finite existence statements, not a formal proof or a positive-characteristic AH assertion.

The integer-division sweep tested **230,128** cases with 2≤r≤40, 4≤d≤16, all q≤min(critical ceiling,500), and both critical counts; it found no failure. **583** critical cases with r≥3,d≥5 had no exceptional predecessor. Plane reduction was tested through d=300 and cubic remainder arithmetic through r=1999. Computed values, including negative u outside the critical range, appear below.

The inspected diff is confined to packages/GenericDoublePointInterpolation: README.md, Suggested.lean, design/plan.json, metadata.toml, the previous repair report, review.json and sources.toml. No package mathematics was edited. No git mutation, Lean command, external post, or source download was performed. Both cited texts were already available legally. No algorithm, `lemma`, `set_option`, sorry'd data, admitted example, free proposition placeholder or process narrative occurs in the mathematical package files.

Dependency checker output, exit 0:

```text
depcheck: 27 roadmaps, 233 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. This checks cross-roadmap edges; it does not detect S04's internal target order.

### Source-locator ledger

| Locator group | Source lines read; verification |
| --- | --- |
| BO Theorem 1.1, p.1 | BO line 22; exceptions at 34–38; characteristic-zero algebraic closure at 23–24. |
| BO univariate remark, p.1 | BO line 39; arbitrary distinct supports. |
| BO Proposition 2.1, p.3 | BO line 127; coordinate tangent/annihilator calculation at 134–138. |
| BO Lemma 2.2, pp.3–4 | BO line 139; incidence differential calculation through 176. |
| BO Lemma 2.3, p.5 | BO line 217; generic-fiber argument at 224–237. Its missing general-position hypothesis is recorded under Source issues. |
| BO Theorem 2.4, p.6 | BO line 245; numerical reduction at 257–277. README correctly uses independent exact sextic witnesses. |
| BO §3 quadrics, p.6 | BO line 279; vector/projective dimension slip noted below. The package's vector dimension is correct. |
| BO §3 sporadic exceptions, pp.6–7 | BO line 300; exceptional cubic discussion at 328 onward. |
| BO Theorem 4.1, pp.7–8 | BO line 374; both matched inequality branches. |
| BO Cartier/global-section sequence, p.8 | BO line 407; only left exactness on global sections at 410. The package's arbitrary finite-scheme extension is explicitly supplier-backed. |
| BO Theorem 5.1, pp.9–12 | BO line 481; cubic remainder and induction at 574–592. |
| BO Proposition 5.2 bases, p.9 | BO line 486; base system dimensions 26,27,27 at 492–497. |
| BO Proposition 5.2 recursion, p.10 | BO line 500; no-quadric kernel and hyperplane restriction. |
| BO Proposition 5.3, p.10 | BO line 514; base dimensions 36,54 at 520–525; codimension-three restriction at 526–538. |
| BO Proposition 5.4, pp.10–11 | BO line 539; remainder length/trace at 546–549 and specializations at 560–573. |
| BO Lemma 6.1, pp.12–14 | BO line 628; local length induction at 637–650 and disjoint support calculation at 651–679. |
| BO Lemma 6.3, pp.15–16 | BO line 765; all three inequalities at 771–781 and proof at 784–797. |
| BO Theorem 6.4, Steps 1–2, p.16 | BO line 798; independent restricted residual at 807–824 and simple-point filling at 825–839. |
| BO Theorem 6.4 first case, pp.17–18 | BO line 848; trace at 858–865, mixed rank at 880–905. The compatible-specialization gap remains an explicit supplier contract. |
| BO Theorem 6.4 second case, pp.18–19 | BO line 913; partial length and selected trace at 924–955. |
| BO final induction, p.19 | BO line 960; quartic special dimensions and counts at 966–977. |
| BO §7.1 opening, p.19 | BO line 983; univariate multiplicity dimension explanation at 987–990. |
| COU §3, pp.491–492 | COU line 179: monomial/chart comparison; 186–204: double points and matrix; 242–248: minor and integer box. BO supplies d=5 beyond COU's stated range. |
| COU coefficient metric, p.493 | COU line 255; orthonormal monomial coordinates and integer lattice at 255–268. |

### Pinned API and supplier ledger

| Object | Verified declaration/file locator; retained qualification |
| --- | --- |
| Bounded polynomial carrier | Mathlib/RingTheory/MvPolynomial/Basic.lean:164 defines restrictSupport on exponent weight ≤d; includes 0, with no field hypothesis. Membership is totalDegree≤d at 174. |
| Monomial basis | Same file:95, basisRestrictSupport; monomial membership at 109 includes the zero-coefficient alternative. No nontriviality is silently assumed for the ring definitions. |
| Derivatives | Mathlib/Algebra/MvPolynomial/PDeriv.lean:61,69,92,110; pderiv_monomial has factor α_j, making the exponent-zero case 0 even though natural subtraction truncates. |
| Evaluation | Mathlib/Algebra/MvPolynomial/Eval.lean:256,267,572,684; aeval has a genuine algebra codomain. |
| Homogeneous/coefficient carriers | Mathlib/RingTheory/MvPolynomial/Homogeneous.lean:87; Mathlib/Algebra/MvPolynomial/Basic.lean:566 (lcoeff). |
| Stars and bars | Mathlib/Data/Finsupp/Multiset.lean:244 (Sym.equivNatSum); Mathlib/Data/Sym/Card.lean:111 (card_sym_eq_choose). The slack coordinate makes the relevant variable type nonempty. |
| Square-zero multiplication | Mathlib/Algebra/TrivSqZeroExt/Basic.lean:452 (inr_mul_inr); the native object is R×M, not a reduced residue field or higher jet. |
| CRT | Mathlib/RingTheory/Ideal/Quotient/Operations.lean:248, quotientInfRingEquivPiQuotient; finite indexing and pairwise IsCoprime, upgraded to an algebra equivalence by the package. |
| Matrix rank | Mathlib/LinearAlgebra/Matrix/Rank.lean:220,285,346; nonzero determinant needs a domain and matrix/range comparisons have their basis arguments. All package uses are over fields. |
| Grid and degree | Mathlib/Combinatorics/Nullstellensatz.lean:62 requires a domain and strictly larger coordinate sets; Mathlib/Algebra/MvPolynomial/Degrees.lean:560 bounds coordinate degree. B+1 nodes, including B=0, are used. |
| Spectrum and affine points | Mathlib/RingTheory/Spectrum/Prime/Topology.lean:504,509; Mathlib/AlgebraicGeometry/Scheme.lean:488,537; Mathlib/AlgebraicGeometry/AffineSpace.lean:151,224. Ring-map direction is k[T]→k, hence Spec k→Spec k[T]. |
| Kernel primality and Euler | Mathlib/RingTheory/Ideal/Maps.lean:845; Mathlib/RingTheory/MvPolynomial/EulerIdentity.lean:73. |
| Tau Ceti bounded APIs | TauCeti/RingTheory/MvPolynomial/RestrictTotalDegree.lean:39,52,72, exactly the three names cited in README:134–136. |
| SF main §0.28 | TauCetiRoadmap/SchemeAndStackFoundations/README.md:1765,1776,1785,1787: affine quotient comparisons and sheafified all-open comparison, with no false global presheaf assertion. |
| SF main §§2.6,5.12 | Same README:3443,7338: projective cohomology and Bézout; the package retains the proper-intersection qualification for equality. |
| Moduli indexed head §§1.1–1.2 | TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:315,333,517: quotient-convention projective bundles, integer twists, natural coefficient/Čech comparison over every commutative ring. |
| Moduli indexed head §§1.7,2.1 | Same README:908,996: finite-locally-free rank equations and flat proper finitely presented Hilbert families. Nilpotent test bases require equations, not just geometric-point rank. |
| Five gap registrations | All five slugs agree between README:149–189 and design/plan.json. cartier-residual and plane-singular-incidence have appropriate specialized uses. mixed-bad-incidence is accepted conditionally, not claimed implemented. S02–S03 concern precision/minimality only. |
### README statement-by-statement computation table

The line locators below are in packages/GenericDoublePointInterpolation/README.md. “Consistent” means the displayed test agrees, not that finite testing proves the general theorem. Geometric rows use characteristic-zero algebraically closed fields and the explicitly declared supplier contracts; ring rows include the zero ring. The finite certificates referenced here are the independently recomputed matrices described above.

| Line / statement | Instances tried and values on both sides | Result / change |
| --- | --- | --- |
| 207 / Binomial count | A(0,2): 1=choose(2,2); A(2,0): 1=choose(2,0); A(2,2): 6=choose(4,2). Wrong coordinatewise bound gives 9. At (0,0), adding a variable still gives 1. | Formula consistent; negative Check S05. |
| 221 / Dimension | Over ℚ, (r,d)=(0,3),(2,0),(2,2): dimensions 1,1,6 equal choose values 1,1,6. The zero polynomial remains in each space. | Consistent. |
| 229 / Coefficient coordinates | 2+3x² at d=3 maps to (2,0,3,0), whose inverse is 2+3x²; at d=0, C7 maps to (7). Over the zero ring both sides are the one-element module. | Consistent. |
| 251 / Homogenization | 1+x at d=2 maps to X₀²+X₀X₁, returning 1+x at X₀=1. H₁(x)H₁(1)=X₀X₁=H₂(x). At r=0, H_d(1)=X₀^d. | Correct construction, existing owner S01. |
| 271 / Forms and sections | On P¹, degree 2 has basis X₀²,X₀X₁,X₁² and chart values 1,x,x²: dimensions 3=3. On P⁰, d=0 and d=2 each give one section, matching one affine monomial. | Consistent. |
| 281 / Gram form | G(x,y)=0, G(x,x)=1; G(2+x,2+x)=4+1=5; d=0 gives G(C2,C3)=6. Wrong coefficient-sum-square norm would give 9 for 2+x. | Consistent. |
| 315 / Jet algebra | At P=0, x↦(0,1), x²↦(0,0), C3↦(3,0). At P=3, x²↦(9,6); in F₂ this is (1,0). Zero ring gives (0,0). | Consistent; negative inequalities correctly restricted. |
| 335 / Kernel and surjectivity | k[x], P=0: ker=(x²), with x↦(0,1)≠0; every (a,b) is jet(a+bx). At r=0, map k→k has kernel 0 and rank 1. | Consistent in characteristics 0,2,3. |
| 343 / Point comaximality | P=0,Q=1: x−(x−1)=1. Squares satisfy (3−2x)x²+(1+2x)(x−1)²=1. P=Q gives sum (x), and over ℤ, P=0,Q=2 gives (x,2)≠top. | Field/distinct hypotheses effective. |
| 353 / Squared union ideal | Empty tuple: top²=top, quotient dimension 0. P=(0,0) in A¹: ideal remains (x²), not (x⁴). Over a nontrivial ring x²≠0 mod (x³); zero ring gives 0=0. | Consistent. |
| 374 / Quotient comparison | P=(0,1), f=x(x−1): image ((0,−1),(0,1)), nonzero with square 0. r=2,n=1: dimensions 3=1+2; n=0: 0=0. | Specified map excludes the reduced-product impostor. |
| 394 / Length | (r,n)=(2,1),(1,2),(3,0): quotient lengths 3,4,0 equal n(r+1). Repeating 0 twice in A¹ instead gives 2≠4. | Injectivity retained. |
| 404 / Bounded jets | One origin in A²,d=1 gives I₃ and rank 3. At d=0 the value/gradient column is (1,0,0), rank 1<3. At 3, J(x²)=(9,6). | Consistent. |
| 424 / Value projection | x at (0,1) has values (0,1); its jets are ((0,1),(1,1)). Empty tuple has zero target and full source kernel. At a single origin, x has value 0 but derivative 1. | Consistent. |
| 444 / Kernel derivatives | At 0, d=1, x is in the value kernel and maps to 1; at d=2, nonzero x² maps to 0. At d=0 the single-point value kernel is 0. | Consistent; nontriviality is explicit where used. |
| 464 / Product surjectivity iff | One origin,d=1: value rank 1, kernel derivative rank r, full jet rank r+1, so both sides true. At d=0,r=1: ranks 1,0,1; both sides false. Empty target: both sides true. | Both directions consistent. |
| 474 / Matrix | At P=0 in A¹,d=1: I₂. At P=3,d=2, columns 1,x,x² are (1,0),(3,1),(9,6); coefficients (2,0,3) map to (29,18)=J(2+3x²). | Consistent. |
| 494 / Rank iff | One point in A²,d=1: rank 3=target 3 and onto. At d=0: rank 1≠3 and not onto. Empty tuple: rank 0=target 0 and onto. | Both directions consistent. |
| 502 / WellPoised | One support in A^r,d=1: rank r+1; r≥1,d=0: rank 1<r+1. Seven collinear plane supports,d=5: rank 11<21. Permuting two univariate supports at d=3 leaves rank 4. | Consistent. |
| 522 / Projective restriction | On P¹ at [1:0], homogeneous degree-2 basis restricts to 1,x,x² with jet columns (1,0),(0,1),(0,0); both ranks are 2. At degree 0 both maps have rank 1. | Chart trivialization has the claimed direction. |
| 544 / Restriction rank | A simple point and constants: 1=1−0; double origin in A²,d=1: 3=3−0; D=0: 0=0−0 despite length 3. | Actual restriction map, not arbitrary rank data. |
| 564 / Disjoint rank | A={0},B={1} in A¹,D=span(1,x): rank 2=1+1. D=constants: rank 1=1+0. B=empty: rank h(A,D)=0+h(A,D). | Correct kernel order. |
| 574 / Residual and trace | A³,H=(z=0): m² gives 4=1+3; (x,y,z²) gives 2=1+1; (y,z,x²) gives 2=0+2; empty X gives 0=0+0. | General finite-scheme contract now covers mixed uses. |
| 597 / Castelnuovo | Double origin in A²,d=1,H=(y=0): h=3≥1+2=3; transverse length-two direction: 2≥1+1; tangent direction: 2≥0+2. Empty X: 0≥0. | Consistent. |
| 609 / Ordinary Horace | Quartics in P⁷,u=30,q=41: trace 210≤210 and residual 118≤120, rank sum 328=min(330,328). q=42: 210≥210,126≥120, rank sum 330=min(330,336). | Both matched branches work. |
| 619 / Sub/superschemes | At the double origin in A¹,d=1, rank 2=length 2; reduced origin has rank 1=length 1. Constants inject at a reduced point and remain inject at its double, both rank 1. | Directions of both monotonicity statements correct. |
| 627 / One-support curvilinear criterion | X=Spec k[x,y]/(x,y)², D=span(1,x,y): rank 3 and every line-direction rank 2. For D=span(1,x), rank 2<3 and the y-direction rank is 1<2. Empty X has 0=0. | Both directions and wrong-system control consistent. |
| 635 / Curvilinear reduction | Two double supports (0,0),(1,0),d=3: full rank 6 and every two-direction subscheme rank 4. At d=1 full rank 3<6 and any length-four direction union has rank ≤3<4. | Consistent. |
| 645 / Rank in flat families | Matrix [t]: rank 1 at t=1, rank 0 at t=0. Over k[ε]/ε², [ε] has geometric rank 0 although its rank-zero ideal (ε) is nonzero. Empty family has rank 0 everywhere. | Open rank locus and specialization direction correct. |
| 653 / Proper direction limits | In A²,H=(y=0), direction (1,t) limits to tangent (1,0): total length 2, trace/residual 2/0. Direction (t,1) limits transverse: total 2, trace/residual 1/1. | Trait limits are sufficient only for this target; S03 makes its supplier precise. |
| 661 / Compatible bad incidence | e=0: rank 0<0 is false, hence W=empty. For constant directions F={1},G={2}, mixed residual lengths 1+2=3 and trace 1+0=1. [s:t] has axis limits [0:1]≠[1:0]. | Conditional gap accepted; no assertion that trait properness constructs the diagram. |
| 720 / Integer rank lifting and Euler | [2] mod101 has rank 1 and rational rank 1; [101] mod101 has rank 0 but rational rank 1, so the implication is one-way. F=X₀²: ΣX_j∂F=2X₀²; degree p in F_p gives 0=0 and cannot recover F. | Correct nonzero degree and characteristic-zero use. |
| 728 / Quadrics | In P²,q=0,1,2,3: kernel dimensions 6,3,1,0 equal choose(4−q,2); q=4 still 0. Two general points give rank 5<6, the expected exception. | Vector dimension normalization correct. |
| 736 / Near-exception ranks | Cubic ranks recomputed: 9,10,20,30,35,120; quartic: 12,15,32,35,65,70. Each equals min(N,(r+1)q) for its listed triple. | All twelve rational witnesses supported. |
| 746 / Veronese tangents | d=1: tangent V and annihilator 0, matching (m²)₁=0. d=2 at e₀ in P²: tangent span(e₀²,e₀e₁,e₀e₂), dimension 3; annihilator span(X₁²,X₁X₂,X₂²), dimension 3. | Uses natural symmetric-power duality; no characteristic-2 inference. |
| 754 / Terracini span | Plane quadrics,q=1: affine tangent rank 3; q=2 independent supports e₀,e₁: span dimension 5, matching double-point rank 5; projective secant dimension is 4=5−1. | Affine/projective dimension shift consistent. |
| 762 / Plane contact | Two general plane supports,d=2: double line through them, contact degree ℓ=1, 2ℓ=2=d and q=2=ℓ(ℓ+3)/2. Five general supports,d=4: doubled conic, 2ℓ=4 and q=5. | Correct with general supports; source's broader wording is not copied. |
| 770 / Plane numerics | d=5: q=7, max ℓ=2 gives 5<7, excluded. d=6: q=9, ℓ=3 gives 9=9. d=8: q=15, ℓ=4 gives 14<15, excluded. Through d=300 allowed degrees are 0,2,4,6. | Consistent with reduction to d≤4 or 6. |
| 778 / Sextic plane | Exact ranks at q=9,10 are 27,28=min(28,27),min(28,30). Integer lifts have distinct supports. | Consistent. |
| 786 / Plane interpolation | d=3,q=3,4 gives ranks 9,10; d=6,q=9,10 gives 27,28. Exceptions: d=2,q=2 rank 5<6; d=4,q=5 has doubled-conic kernel dimension 1, rank 14<15. | Consistent. |
| 796 / Three-space bases | r=5,6,7: computed full-column ranks 56,84,120 equal choose(r+3,3). Frames have ranks 3,4,5 and pair spans 6,7,8. | Incidences and nonzero minors verified. |
| 804 / Three-space recursion | Base r=5 has cubic kernel 56−56=0; r=7 gives 120−120=0. At r=8, three coordinate block ideals of codimension 3 require one factor from each block: quadratic kernel 0, cubic containing-space dimension 3³=27. | Base and residual mechanism consistent. |
| 812 / Two-space bases | r=5,7: exact total ranks 56,120; containing-space dimensions are 36,54 and are killed by the prescribed singularities. Each outside vector increases each frame rank by 1. | Consistent; source P⁵ typo corrected. |
| 820 / Two-space recursion | r=3: two point subspaces plus three ambient supports give five doubles, cubic rank 20=N(3,3). Bases r=5,7 have kernels 0,0. At r=6, trace dimension is 3 and retained support counts are 1 on each trace point plus 3 ambient, matching r=3. | r=4 exclusion effective. |
| 828 / One-space bases | r=5: 3 on L+6 outside, length-two transverse remainder gives rank 56=N(5,3), trace remainder length 1. r=7: 7 on L+8 outside gives rank 120=N(7,3). | Both full-column witnesses verified. |
| 836 / One-space recursion | r=5: (r+1)(r−2)/6=3, outside 6, δ=2 and trace 1; r=7: r(r−1)/6=7, outside 8, δ=0. r=3 gives one on-L plus four outside, rank 20. | Numeric boundaries and base cases consistent. |
| 844 / Cubic remainder | r=2: q=3,δ=10−9=1; coordinate doubles leave X₀X₁X₂ and its value at [1:1:1] is 1. r=5: q=9,δ=56−54=2. r=7: q=15,δ=120−120=0. | Formula passes r=0,…,1999; r=4 correctly excluded geometrically. |
| 852 / Cubic maximal rank | r=2,q=3,4: ranks 9,10; r=4,q=6,8: ranks 30,35. At r=4,q=7, N=35 and a nonzero exceptional cubic remains. | Exceptional triple is not inferred from neighboring ranks. |
| 862 / Quartic P⁵ | n=21: 6·21=126=choose(9,4), computed matrix rank 126; distinct rational affine supports give projective representatives [1:P]. | Consistent. |
| 903 / Trace-size inequality | r=3,d=6,q=21: u=9,e=1, re+u=12≤N(2,5)=21. For q=0: u=−19,e=1, re+u=−16≤21. | Signed division handles the negative dividend. |
| 911 / Residual-size inequality | Same critical case: N(3,4)=35≤11·4=44; q=0 case: 35≤18·4=72. | No natural subtraction in u. |
| 919 / Quartic bound | r=10,d=4,q=91: N=1001, previous N=286, u=71,e=5; q−u−e=15≥11. For q=0, u=−29,e=4, residual count 25≥11. | Consistent with full allowed q range. |
| 927 / Nonnegative critical data | r=3,d=6,q=21: 0≤9≤21 and residual 11≥0. r=3,d=4,q=8: u=4,e=0,residual 4; q=9: u=5,e=1,residual 3. Outside critical range q=0,d=6 gives u=−19. | Critical-range restriction essential. |
| 937 / Mixed residual rank | r=3,d=6,q=21: 11 off-H doubles plus one plane double have length/rank 44+3=47=(q−u)4−e; vanishing dimension 56−47=9=u. | Consistent with BO Step 1, including specialization obligation. |
| 945 / Injective residual restriction | Same setup: degree-four conditions at 11 general doubles have rank 35=N(3,4), kernel 0. Hence the degree-five residual kernel of restriction to H is 0. | Direction of divisibility and degree shift correct. |
| 953 / Simple-point filling | Above residual has dimension 9; nine general simple plane points give evaluation rank 9 and final rank 47+9=56. At u=0, no points and kernel 0. | Consistent. |
| 961 / Underfilled trace | r=3,d=6,q=21: nine plane doubles have rank 27; one additional simple point gives 28=ru+e. Removing it leaves independent length/rank 27. | Simultaneous open choice is explicitly required. |
| 971 / Moving family | δ(t)=(a,t), H_t=(y=t): at t=0 and t=1 full-double bases have 3 elements; restricted bases have 2. After t=s² the ideal is (x−a,y−s²)² on both base-change descriptions. | Length and base-change Checks agree. |
| 991 / Transverse limit rank | r=3,d=6,q=21,F=1,G=0: trace 27+1=28; smaller residual 9+44+1=54, inside rank 56. No additional condition is claimed beyond that filled system. | Earlier defect repaired. |
| 999 / Tangent moving residual | Same setup,F=0,G=1: special smaller residual rank 9+44+2=55≤56; generic mixed residual rank ≥55. Trace is 27, yielding ≥82 in total. | Correct semicontinuity direction, conditional on diagram. |
| 1009 / Underfilled contradiction | Both (f,g)=(1,0),(0,1) give lower rank 54+28=55+27=82; asserted failure is rank<4·20+2=82. | Contradiction arithmetic correct; mixed gap retained. |
| 1017 / Overfilled partial length | Valid predecessor case r=3,d=10,q=72: u=22,e=2,ν=0,Σ=48; partial length (72−2)4+0·4+2·3=286=N(3,10). Ordinary branch r=4,d=5,q=26 has ν=−4. | ν is signed; branches distinguish it correctly. |
| 1025 / Overfilled contradiction | For the preceding ν=0 case, F=0,G=2. Residual lower bound 22+192+4=218 and trace 66 yield 284=280+2·2; failure requires rank<284. Curvilinear criterion then gives the partial scheme's full rank 286. | Restricted directions correctly lie in G. |
| 1035 / Differential step | r=3,d=6,q=21 predecessors are (2,6,9),(3,5,12),(3,4,11), with maximal ranks 27,48,35. Claimed endpoint rank is 84=min(84,84). At exceptional (3,4,9), predecessor (2,4,5) fails. | Hypotheses prevent false exceptional conclusion. |
| 1045 / Univariate Hermite | P=(0,1), d=0,1,2,3 gives ranks 1,2,3,4=min(d+1,4), including F₂. Empty tuple gives rank 0=min(d+1,0). Product (x(x−1))² has degree 4 in every characteristic. | No factorial inversion. |
| 1055 / Quartic P⁷ | u=30 trace rank 210=7·30=N(6,4). Residual counts at q=41,42 are 118,126; their ranks 118,120 give total ranks 328,330. | P⁶ input remains a hypothesis, avoiding a dimension cycle. |
| 1063 / Quartic induction | r=5: 21·6=126. r=9,q=71: (u,e)=(54,4), residual 13≥10; q=72: (55,5), residual 12≥10. r=7 uses ordinary Horace instead. | Consistent. |
| 1071 / Exception schedule | r=3,d=5,q=14: u=7,e=0, predecessors (2,5,7),(3,4,7),(3,3,7), all nonexceptional. r=4,d=5,q=25 gives u=13,e=3, predecessors (3,5,13),(4,4,12),(4,3,9). | 583 critical instances pass. |
| 1081 / Projective endpoint | r=1,d=5,q=1,3,4 gives ranks 2,6,6=min(6,2q). Plane d=5,q=7 generic rank 21; collinear rank 11 shows why only a nonempty open is asserted. | Consistent with BO1.1. |
| 1103 / Dense affine chart | In P¹, [1:0] and [1:1] are distinct affine points; degree-three matrix has rank 4. The infinity point [0:1] is excluded from this chart; dimension of the affine parameter for two points is 2=dimension of the projective product. | Nonempty open intersection has the required field/general-position scope. |
| 1111 / Universal matrix | r=n=d=1 gives [[1,T],[0,1]], determinant 1. At d=0 derivative entries are 0; x² at T=3 has column (9,6), agreeing with specialization. | Consistent over every commutative ring. |
| 1149 / Nonzero minor | r=n=1,d=5, columns (1,x): Δ=1 and Δ(0)=1 over ℚ. For the same range, columns (x⁴,x⁵) give Δ=T⁸, zero at 0 but nonzero at 1. | Existential column choice correct; order S04. |
| 1157 / Degree bound | Columns (1,x): degree 0≤2d. At one point,d=5, columns (x⁴,x⁵): Δ=T⁸, degree 8≤10. Empty determinant 1 and zero determinants both have native total degree 0. | Bound includes total-function junk values correctly. |
| 1180 / Principal-open criterion | Δ=1 gives entire Spec and a full jet; Δ=T⁸ gives membership at P=1 and exclusion at P=0. Repeated two supports give Δ=0, so no tuple lies in its nonvanishing locus. | Domain and direction of evaluation morphism correct. |
| 1188 / Generic affine endpoint | Over ℚ, r=n=1,d=5 has Δ=1, P=0 and rank 2. Plane r=2,n=7,d=5 has generic rank 21 while collinear rank is 11. | Field generality and generic quantifier correct; S04 proof order. |
| 1198 / Integer grid | For one point,d=5, Δ=T⁸ has B=10 and witness 1∈[0,10] with Δ(1)=1. Empty tuple gives Δ=1,B=0 and the empty assignment. r=0,n=1 similarly gives the unique tuple. | Nonzero-minor and characteristic-zero hypotheses sufficient. |
| 1206 / Pullback | Δ=T⁸, θ(u)=u+1, B_u=8: u=0 gives value 1 and a well-poised point. θ=0 makes pullback 0 and is excluded. Empty S with θ=1 gives constant pullback 1 and the unique parameter. | Quantifier order and nonvanishing hypothesis correct. |
| 1216 / Collinear failure | P_i=(i,0), i=0,…,6,d=5: independent value/x slice dimension 6 plus y-derivative slice dimension 5 gives rank 11, recomputed modulo 101; upper bound 11 gives exact rational rank. | Counterexample is consistent with every generic endpoint. |
| 1133 / selectedMinor (unbolded definition) | One-point (1,x) determinant 1; swapped columns −1; two coincident supports determinant 0, while supports 0,1 and columns 1,x,x²,x³ give 1. | Three discriminating Checks. |
| 1165 / evaluationPrime (unbolded definition) | At P=0, ideal (T), T↦0 and 1↦1; P=1 gives (T−1), T↦1. With no variables, kernel 0 in k and exactly one spectrum point. | Three discriminating Checks. |
### Lean declaration/context table

All line locators here mean packages/GenericDoublePointInterpolation/Suggested.lean. There is no section `variable` block: all binders are declaration-local, with universe u for R/k. “Global” means no field/ring parameter is implicit. The supplied elaborated audit agrees with each context below.

| Line / declaration | Kind; layer; full relevant context | Computed instances; result/change |
| --- | --- | --- |
| 25 / Bounded | abbrev; 0; R:Type u, CommRing R, r,d:ℕ | (r,d)=(0,2),(2,0),(2,2): module ranks 1,1,6 over ℚ; zero ring gives the zero module. Native restrictTotalDegree includes 0. |
| 29 / Monomials | abbrev; 0; r,d:ℕ, no coefficients | Cardinalities at (0,2),(2,0),(2,2) are 1,1,6; (1,0) is also 1, exposing S05's negative clause. |
| 33 / monomialsFintype | instance; 0; r,d:ℕ | Same underlying cardinalities 1,1,6. Proof embeds into coordinatewise bounds, whose cardinality at r=d=2 is 9; it restricts to the correct 6-element subtype. No data admission. |
| 50 / JetRows | abbrev; 1; n,r:ℕ | (n,r)=(0,3),(1,0),(2,2): sizes 0,1,6 equal n(r+1); None contributes the indispensable value row. |
| 53 / jetAlgebra | def; 1; CommRing R, r:ℕ, P:Fin r→R | At P=3, x²↦(9,6); P=0 gives x↦(0,1), x²↦0. In F₂, x² at1 maps to (1,0). Zero ring gives 0. |
| 59 / doubleIdeal | def; 1; CommRing R, r,n:ℕ, P | n=0 gives top; P=(0,0) gives (x²); P=(0,1) over a field gives (x²(x−1)²). Over ℤ, 0 and2 are not comaximal. |
| 64 / doublePointQuotient | theorem; 1; Field k, r,n, P, Injective P | n=0: zero algebra≃empty product; r=2,n=1: dimensions3=3. x(x−1) at0,1 has jets ((0,−1),(0,1)), detecting nonreduced multiplication. |
| 72 / firstJetMap | def; 1; CommRing R, r,n,P,d | One origin in A²,d=1 has matrix I₃; d=0 has column (1,0,0). At3, J(2+3x²)=(29,18). Linear-map laws are proved. |
| 86 / firstJetMatrix | def; 1; CommRing R, r,n,P,d | Columns1,x,x² at3 are (1,0),(3,1),(9,6), and n=0 has zero rows. CommRing is retained in the elaborated type. |
| 95 / WellPoised | def; 1; Field k, r,n,P,d | One origin,d=1 is true; r≥1,d=0 is false; empty tuple is true. Definition is actual surjectivity, not an independent proposition field. |
| 102 / nearExceptionRanks | theorem; 3; global finite list, coefficients ℚ | All twelve displayed tuples yield computed ranks 9,10,20,30,35,120,12,15,32,35,65,70. Tuple projections are r=t.1,d=t.2.1,n=t.2.2.1,rank=t.2.2.2. |
| 111 / sexticPlane | theorem; 3; global q∈[9,10], ℚ | Computed ranks 27=min(28,27), 28=min(28,30); all supports distinct. |
| 117 / quarticFive | theorem; 3; global Fin21→Fin5→ℚ | Computed rank126=21·6=choose(9,4); injectivity verified. |
| 125 / univariateHermiteRank | theorem; 4; Field k, n,P,Injective P,d | Over ℚ and F₂, P=(0,1), d=0,…,3: ranks1,2,3,4=min(d+1,4). n=0 gives0. No CharZero binder is needed. |
| 133 / universalJetMatrix | def; 5; global r,n,d, coefficients ℤ[T] | r=n=d=1 gives [[1,T],[0,1]]; d=0 derivatives vanish; x² atT=3 specializes to (9,6). |
| 138 / selectedMinor | abbrev; 5; global r,n,d, injective column embedding | (1,x):1; swapped:−1; two supports0,0:0; two supports0,1:1. Empty row type gives determinant1. |
| 143 / evaluationPrime | abbrev; 5; Field k,r,n,P | One coordinate at0 and1 gives (T),(T−1); nr=0 gives0⊂k. RingHom.ker_isPrime is a real proof field. |
| 149 / genericAffinePrincipalOpen | theorem; 5; Field k,CharZero k,r,n,d, r,n≥1,d≥5,n(r+1)≤choose(r+d,d) | k=ℚ,r=n=1,d=5: Δ=1,P=0,rank2. The IsOpen/basicOpen clause is native; the substantive existential full-rank witness remains. S04 concerns README order. |
| 164 / integerGridForMinor | theorem; 5; Field k,CharZero k,r,n,d,cols,hΔ | One point,d=5,cols x⁴,x⁵: Δ=T⁸ and B=10; P=1 is valid. n=0 or r=0,n=1 gives Δ=1 and box bound0. |
| 173 / parameterPullback | theorem; 5; Field k,CharZero k; S:Type u₂,Fintype S; r,n,d,cols,θ,B,hΔ,hB | Δ=T⁸,θ=u+1,B=8 gives u=0 and value1. Empty S,θ=1 gives unique parameter/value1. Zero pullback θ=0 fails hΔ. Bound B is fixed before u. |

### API identity table

These are the **42** individual API bullets, with their own tests rather than only the surrounding target's test. Line locators refer to packages/GenericDoublePointInterpolation/README.md.

| Line / API assertion | Instance and both values | Result |
| --- | --- | --- |
| 235 / coefficient projection | f=2+3x²: c(f) at exponent2 is3=coeff₂(f). | Consistent. |
| 236 / inverse finite sum | (2,0,3,0) reconstructs2+0x+3x²+0x³=2+3x². | Consistent. |
| 237 / coordinate equality iff | 2+3x² and2+x² have coordinates differing by2 at exponent2 overℚ; both equalities false. Identical polynomials give both true. | Both directions. |
| 257 / homogenized monomial | r=1,d=3,α=2: x²↦X₀X₁²=X₀^(3−2)X₁². | Consistent. |
| 258 / inverse chart evaluation | X₀X₁² atX₀=1 givesx²; homogenizing atdegree3 returnsX₀X₁². | Consistent. |
| 259 / graded multiplication | f=x∈V₁,g=1∈V₁: H₂(fg)=X₀X₁=H₁(f)H₁(g). | Degrees distinguish the wrong identity at a single fixed degree. |
| 287 / Gram formula | f=2+x,g=3−x: G=6−1=5=sum of coordinate products. | Consistent. |
| 288 / Gram positivity | f=2+x: G(f,f)=5>0; f=0 gives0 and is excluded. | Nonzero condition effective. |
| 289 / norm and lattice | 2+x has coordinate norm√5=polynomial norm√5 and integer coordinates; (1/2)x has coefficient1/2∉ℤ. | Metric and lattice discriminated. |
| 321 / scalar jet part | P=3,f=x²: fst=9=eval. | Consistent. |
| 322 / infinitesimal jet part | Same input: snd=6=eval(2x). | Consistent. |
| 323 / generator jet | P=3: x↦(3,1)=(P,e₁). | Consistent. |
| 359 / squared intersection | P=(0,1): intersection(x)∩(x−1)=(x(x−1)), square=(x²(x−1)²). | Consistent. |
| 360 / intersection of squares | Same field input: (x²)∩((x−1)²)=(x²(x−1)²), equal to previous ideal. | Consistent with injectivity. |
| 361 / ideal permutation | Swap0,1: both squared ideals are(x²(x−1)²). | Consistent. |
| 380 / quotient class jet | f=x(x−1),P=(0,1): image((0,−1),(0,1)) on both sides. | Consistent. |
| 381 / quotient multiplication | This class has square0; each infinitesimal jet also squares to(0,0). | Reduced-product convention excluded by nonzero original class. |
| 382 / factor permutation | Swapping supports sends((0,−1),(0,1)) to((0,1),(0,−1)) on both sides. | Consistent. |
| 410 / None coordinate | P=3,f=x²: J(f)(None)=9=eval. | Consistent. |
| 411 / Some coordinate | Same input: J(f)(Some0)=6=eval(pderiv0 f). | Consistent. |
| 412 / monomial column | α=2,P=3: column(9,6)=(3²,2·3); α=0 gives derivative0, includingP=0. | Truncated subtraction is harmless because its coefficient is0. |
| 430 / value-map application | x atP=(0,1): tuple(0,1) on both sides. | Consistent. |
| 431 / value projection | J(x)=((0,1),(1,1)); None projection=(0,1)=valueMap(x). | Consistent. |
| 432 / value-kernel iff | x(x−1) evaluates(0,0), both membership and vanishing true; x evaluates(0,1), both false. | Both directions. |
| 450 / kernel derivative coordinate | x(x−1) at0,1 gives derivatives(−1,1) on both sides. | Consistent. |
| 451 / kernel Some projection | Jets((0,−1),(0,1)) project to(−1,1), the same kernel derivative. | Consistent. |
| 452 / derivative reindexing | Swapping0,1 sends(−1,1) to(1,−1) in both constructions. | Consistent. |
| 480 / matrix value row | α=2,P=3: entry9=3². | Consistent. |
| 481 / matrix derivative row | α=2,P=3: entry6=2·3; α=0 gives0=0. | Consistent. |
| 482 / matrix representation | Columns(1,x,x²),P=3 times(2,0,3) give(29,18)=J(2+3x²). | Consistent. |
| 508 / WellPoised iff | One point,d=1: true↔true; r=1,d=0: false↔false. | Definition, correctly kept out of Lean theorem padding. |
| 509 / WellPoised permutation | Two univariate supports0,1,d=3 have rank4; swapped support matrix also rank4. | Consistent. |
| 510 / degree monotonicity | Same tuple: degree3 and4 ranks both4, targets dimension4. | Consistent. |
| 550 / rank-nullity | Double origin inA²,d=1:3=3−0; constants:1=1−0. | Consistent. |
| 551 / rank bound | Same double point,length3: constants give1≤min(1,3)=1; D=0 gives0≤min(0,3)=0. | Consistent. |
| 552 / empty rank | Empty scheme with constants or D=0: both restrictions have rank0=0. | Consistent. |
| 977 / family origins | δ(t)=(a,t),H_t=(y=t): at0, δ=(a,0),H=(y=0) on both sides. | Consistent. |
| 978 / constant family lengths | At t=0 and1 inA², full basis1,x−a,y−t gives3 and restricted basis1,x−a gives2. | Nonreduced fiber retained. |
| 979 / family base change | t=s² gives squared ideal(x−a,y−s²)² by both constructions; special length3=3. | No flatness of the parameter map assumed. |
| 1117 / universal specialization | Universal x² column evaluated at3 is(9,6)=firstJetMatrix's column at3. | Consistent. |
| 1118 / universal value entry | α=2 atT=3 gives9=3²; α=0 gives1=empty product. | Consistent. |
| 1119 / universal derivative entry | α=2,T=3 gives6=2·3; α=1,T=0 gives1; α=0 gives0. | No division by a coordinate. |
### Individual README Checks

All 59 bullets are accounted for individually. Values use ℚ/ℤ unless the row specifies another ring. The table also records the wrong model or negative control where the Check makes one.

| Check line | Computed values | Result |
| --- | --- | --- |
| 213 | r=0,d=2: 1=choose(2,2); extra coordinate gives3. At d=0 both counts1. | S05 corrects the universal negative clause. |
| 214 | r=2,d=0: only (0,0), count1=choose(2,0). | Consistent. |
| 215 | Exponents (0,0),(1,0),(0,1),(2,0),(1,1),(0,2) have slack2,1,1,0,0,0; count6≠9. | Consistent. |
| 241 | r=2,d=2: basis size6, the stated six monomials. | Consistent. |
| 242 | d=0,C7 has the single coefficient7. | Consistent. |
| 243 | 2+3x² at d=3 has coefficients2,0,3,0. | Consistent. |
| 263 | H₂(1+x)=X₀²+X₀X₁; coefficient of X₀² is1 rather than0 in 1+X₁. Zero ring: both0. | Nontriviality now present. |
| 264 | H₀(C7)=C7. | Consistent. |
| 265 | X₀X₁ atX₀=1 givesx of degree1≤2. | Consistent. |
| 293 | G(x,y)=0; G(x,x)=1. | Consistent. |
| 294 | G(C2,C3)=2·3=6. | Consistent. |
| 295 | 2+x has integral tuple(2,1), squared norm4+1=5. | Consistent. |
| 327 | Origin jet ofx is(0,1)≠0 overℚ, and0 in the zero ring. | Corrected hypothesis. |
| 328 | Jet of C3 is(3,0) at every support. | Consistent. |
| 329 | Origin jet ofx² is0; in a second-order jet quotient x² remains nonzero. | Discriminating. |
| 365 | At the origin, (x²)⊊(x) overℚ; in the zero ring both ideals are0. | Corrected hypothesis. |
| 366 | Empty infimum top, its square top, quotient0 and field-vector dimension0. | Consistent. |
| 367 | x² mod(x²)=0; x² mod(x³)≠0 over every nontrivial coefficient ring. | Consistent. |
| 368 | (x)+(x−2)=(x,2)⊂ℤ[x]; quotientF₂ makes1 nonzero. | Correct ring negative control. |
| 386 | At P=(a,b), basis1,x−a,y−b gives dimension3. | Consistent. |
| 387 | Empty product algebra and quotient bytop each have dimension0. | Consistent. |
| 388 | x(x−1) maps to((0,−1),(0,1)), nonzero with square0, including characteristic2. | Reduced quotient excluded. |
| 416 | Jets of1,x,y at the origin are(1,0,0),(0,1,0),(0,0,1). | I₃. |
| 417 | Constants give zero gradient; target gradient1 has no preimage when1≠0. | Correct nontriviality. |
| 418 | x² at3 gives value9 and derivative6. | Consistent. |
| 436 | x at0,1 gives(0,1). | Consistent. |
| 437 | No supports gives zero target and kernelV_d. | Consistent. |
| 438 | At0, x has value0 and derivative1; the latter differs from0 only in a nontrivial ring. | Corrected hypothesis. |
| 456 | At0,d=1, x belongs to the value kernel and derivative is1. | Consistent. |
| 457 | Constant evaluation at one support is identityR→R, kernel0. | Consistent even for the zero ring. |
| 458 | At0,d=2, x²≠0 over a nontrivial ring, value0 and derivative0. | Corrected hypothesis. |
| 486 | One-point linear matrix is[[1,0],[0,1]]. | Consistent. |
| 487 | d=0 single column has n copies of1 in value rows and0 in derivative rows. | Consistent. |
| 488 | r=n=d=2 gives rows2·3=6, columnschoose(4,2)=6, hence6×6. | Consistent. |
| 514 | Affine linear polynomials a+Σb_j(x_j−P_j) realize all r+1 first-jet coordinates. | Rankr+1. |
| 515 | d=0,r≥1 gives rank1<r+1 at one support. | Consistent. |
| 516 | Seven collinear plane supports give rank11<21=choose(7,5). | Recomputed. |
| 556 | Constants at a simple point give rank1. | Consistent. |
| 557 | Zero source gives rank0 even for target length3. | Consistent. |
| 558 | One double origin,d=1 gives rankr+1, with explicit I₃ at r=2. | Consistent. |
| 589 | A³ double origin: total4, residual1, trace3. | 4=1+3. |
| 590 | (x,y,z²), H=(z): quotientk[z]/z²; residual/trace lengths1/1. | 2=1+1. |
| 591 | (y,z,x²), H=(z): residual empty, tracek[x]/x². Empty scheme gives0. | 2=0+2; 0=0+0. |
| 695 | Fixed transverse line at moving support: total length2 at generic and special points; special trace/residual1/1. | Consistent. |
| 696 | F support onH has residual/trace1/1; G support offH has2/0. | Mixed totals3/1. |
| 697 | Limits of[s:t] alongs=0 andt=0 are[0:1] and[1:0]. Distinct blowup points. | Correct warning embodied in the declared gap. |
| 698 | e=0 gives rank0<0, false. | W is empty. |
| 983 | At t=0,1, δ=(a,0),(a,1), with corresponding H equationsy=0,y=1. | Correct fibers. |
| 984 | Double-origin coordinate algebra has basis1,x−a,y, length3 rather than1. | Discriminating. |
| 985 | Quotient additionally byy−t leaves basis1,x−a, length2. | Consistent. |
| 1123 | [[1,T],[0,1]] has determinant1. | Consistent. |
| 1124 | Derivative of the only monomial1 is0 in every coordinate. | Consistent. |
| 1125 | T=3 in thex² column gives(9,6). | Consistent. |
| 1143 | Ordered columns1,x give determinant1. | Sign fixed. |
| 1144 | Ordered columnsx,1 give determinant−1 overℤ. | Sign discriminating. |
| 1145 | Interleaved value/derivative rows at0,0 give0; at0,1 give determinant3−2=1. | Correct row convention. |
| 1174 | Origin evaluation kills eachT and sends1 to1≠0. | Correct prime kernel. |
| 1175 | T evaluates0 at0 and1 at1; kernels(T),(T−1) differ. | Discriminating. |
| 1176 | With nr=0, evaluation is identityk→k; kernel0 and Spec k has one point. | Correct empty-variable behavior. |

### Conventions, scope and headline coverage

| Convention or boundary | Witness and computed values | Assessment |
| --- | --- | --- |
| Total rather than coordinatewise degree | x²y² at r=2,d=2 has total4>2, although each exponent≤2; counts6 versus9. | Native definition has the intended bound. |
| Formal homogenizing coordinate | 1+x atdegree2 becomesX₀²+X₀X₁, of degree2; settingX₀=1 gives1+x. | Correct; import owner per S01. |
| Symmetric-power duality versus coefficient norm | At e₀,d=2, tangent basis e₀²,e₀e₁,e₀e₂ annihilates exactly the three quadratic monomials in X₁,X₂. Coefficient metric independently gives G(2+x,2+x)=5. | No identification of the Gram form with the Veronese duality is claimed. |
| Value/derivative row order | One support: [[1,T],[0,1]]; two supports0,1: confluent determinant1 with interleaved value/derivative rows. | COU groups rows by derivative type; the package uses an explicit permutation. Rank is unaffected and determinant sign is fixed locally. |
| True derivatives, no factorial division | OverF₂, x² at1 has jet(1,0); overF₃, x³ at1 has jet(1,0). | Algebraic theory remains valid; no positive-characteristic AH inference. |
| Geometric versus affine dimension | Two plane-quadric tangent spaces span vector dimension5 and projective dimension4. | README uses vector rank5. |
| Residual/trace direction | Transverse line:2=1+1; tangent line:2=0+2; fullA³ double:4=1+3. | Degree shift d−1 and trace ambient H agree. |
| Rank specialization | [t] has generic rank1 and special rank0. | Rank cannot increase on specialization. |
| Signed division | r=3,d=6,q=0 gives −56=3(−19)+1. Natural truncation would instead corrupt the equation. | u is explicitly integral. |
| Zero ring / zero module | All polynomial values and all jets are0 over the zero ring; empty finite target has dimension0 and surjective zero restriction. | Negative statements require nontriviality; field theorems exclude the zero ring. |
| Empty parameter type | Empty determinant1; no variables gives totalDegree0 and a unique grid assignment. | No 0/0 or missing nonempty-index premise. |
| Colliding supports | Two copies of0 have squared union ideal(x²), length2, and repeated matrix rows. | CRT length4 requires injectivity; nonzero minors force it. |
| Finite/inseparable fields | F₂'s two distinct univariate supports give degree-three rank4; any injective field extension preserves that rank. Purely inseparable extensions do not enter the char-zero geometric arguments. | No omitted separability premise in the ring/field algebra. |
| Arbitrary parameter schemes | The [ε] matrix over dual numbers has rank-zero geometric fibers but nonzero determinantal ideal(ε). Base change t=s² retains first-order fiber length3. | Native determinantal equations and finite locally free families are retained. |
| Unrelated defect classes | No group, Haar measure, fan, q-parameter, DVR normalization, residue/period factor, topological compactness, or unbounded cardinal index occurs. Fin and Fintype prevent out-of-range indices. | Those adversarial classes have no statement to instantiate here. |

The README's native headline assertions are the double-point quotient; the low-degree neighboring, sextic and quartic witnesses; univariate Hermite rank; nonzero-minor/generic affine interpolation; integer specialization; and polynomial pullback. All eight corresponding Lean theorem declarations were checked. The three groups of subspace base witnesses are additional finite headline inputs and are missing (S06). Their omission is not excused by missing projective-section interfaces.

The genuinely geometric headlines are the plane contact/interpolation argument, codimension-three cubic recursions and resulting cubic input, differential Horace, quartic induction, and generic projective AH rank. The module docstring identifies the missing projective-bundle, twisting-section, residual and relative-incidence interfaces and names their principal theorem families. Those general geometric statements were not forced through free predicates or a weakened signature. The coefficient metric and routine rank/coefficient APIs are not substituted for those headlines.

The one-tactic review found **no remaining padding theorem**: the quotient includes its nonreduced specified map; the finite configurations require nonzero minors; arbitrary-characteristic univariate Hermite rank requires the degree/multiplicity argument; the affine endpoint needs AH; and each grid theorem combines genuine nonzero polynomial evaluation with the actual jet-rank criterion. Their small examples and one-lemma consequences remain solely in the README.

## Not verifiable

- **Fresh Lean elaboration:** prohibited by the read-only brief. The provided 20-declaration elaboration audit was read and compared with the current file; no `#check` was run in this pass. There were no edits requiring a new signature audit.
- **Declared general geometry contracts:** this review accepts the roadmap conditionally on the five supplier gaps, subject to S02–S03's precise contracts. It does not claim that a supplier currently implements them. In particular the mixed-incidence diagram is not established by the rank computations or properness of a direction space; the earlier F12 settlement is respected.
- **Formal proof of finite certificates and unbounded induction:** the computed determinants/ranks and finite arithmetic sweeps are not Lean proofs. Source-backed unbounded conclusions remain roadmap targets.
- **Additional open work beyond the brief:** the supplied 26 sibling heads and the tool's indexed ownership results were used. No independent discovery or freshness check of other authors' live pull requests was attempted. Existing-roadmap revisions were not used as suppliers instead of main.
- **Source text:** no unavailable cited text remains. BO and COU were read from their supplied legal extracts; no reference request is required. Source errors below are distinguished from package defects.

The source-error witnesses can be checked without additional literature. Six distinct plane lines with no three concurrent have fifteen distinct pairwise intersections. Their reduced degree-six product is singular at all fifteen, so the double-point matrix has rank at most27<28 while its divisor has no doubled curve; this refutes BO Lemma2.3 without general-position supports. For the tensor-ideal Hilbert-function issue, take X=Z={p}⊂P², D=I_p(1): the actual restriction has rank0, whereas h⁰(D)=2 and h⁰(I_p⊗I_p(1))=1 give the source expression1. The latter follows from 0→I_p(−1)→I_p⊕I_p→I_p⊗I_p(1)→0 and h¹(I_p(−1))=1. The package correctly uses the actual kernel. For Proposition5.3, let r=5 and L=M be a plane. Cubics containing it have dimension46; six distinct on-plane supports impose at most18 additional conditions and three outside supports at most18, leaving dimension at least10 rather than0. The package correctly requires general subspaces.

## Source issues

- **Misprint** in BO at Proposition 2.1 setup, printed p.3, BO line 116: the source says the projective point ideal is the full evaluation kernel at a representing vector; it should be the homogeneous ideal vanishing degreewise on its line; affects nothing.
- **Error** in BO at Lemma 2.3, printed p.5, BO line 217: the source says any defective union of double supports forces positive-dimensional contact through the supports; it should be restricted to general supports, as its proof requires; affects nothing.
- **Misprint** in BO at §3 quadrics, printed p.6, BO line 282: the source says the quadrics singular at two points have projective dimension choose(n,2); it should be vector dimension choose(n,2), or projective dimension one less; affects nothing.
- **Error** in BO at Proposition 5.3, printed p.10, BO line 514: the source says the two codimension-three subspaces may be arbitrary; it should be stated for general subspaces, excluding coincidence and deficient relative position; affects nothing.
- **Misprint** in BO at Proposition 5.3 proof, printed p.10, BO line 525: the source says the three ambient supports in the n=7 base lie in P⁵; it should be P⁷; affects nothing.
- **Error** in BO at §6 Hilbert-function definition, printed p.12, BO line 608: the source says tensoring the linear-system ideal by I_X computes its vanishing kernel without restrictions; it should be formulated using the actual restriction kernel, or hypotheses making the tensor expression valid; affects nothing.
- **Gap** in BO at Theorem 6.4 first case, printed p.17, BO lines 880–890: the source says pointwise bad direction choices supply compatible partial specializations preserving the rank bound; it should be justified by a common bad-incidence diagram with those mixed strata; affects the proof.
- **Misprint** in BO at Theorem 6.4 first case, printed p.18, BO line 901: the source says to apply Castelnuovo to a scheme with unsquared or residual fixed supports; it should be Φ²∪Σ²∪Z_F(0)∪Z_G(t), as the following inequality does; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "fc55b70f63026c40e3e91fffd051b3e5e5052478", "job": "RT-GenericDoublePointInterpolation~2a", "model": "gpt-6-astra", "worker": "chris-6"} -->
