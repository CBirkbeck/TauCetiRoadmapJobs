<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/937#issuecomment-6397203020 -->
Red team round 1 pass a (codex) of 5a0a8bd

Verdict: needs_changes

1. **F01** (P1) Integral positivity cannot hold for an invariant polynomial representative

   **Location:** packages/CountingBundlesAndHallAlgebrasOfCurves/README.md:1447; propagated at lines 1563 and 1692. “represented by a Weyl-invariant polynomial with nonnegative integer coefficients in the α_j”.

   **Claim:** The representative itself is invariant in the polynomial ring, has nonnegative integral coefficients, degree 2D, and monic diagonal specialization.

   **Witness:** Take g=2,r=2,d=1: D=5. Monicity forces one degree-10 monomial. W-invariance forces its four exponents equal, making its degree divisible by four. Thus 10=4e is impossible.

   **Exact repair text:** “In the paired-coordinate affine-cone ring, A(−α) is W-invariant and has a representative with nonnegative integer coefficients. The representative need not be W-invariant before imposing the paired-coordinate relations. Its diagonal specialization is monic of degree 2D.” Add the g=2,r=2 degree-10 obstruction as a negative-control Check. Apply the same distinction in §§10.5 and 11.6 and replace the claimed independence of polynomial representatives in §9.2 by independence of their class on the cone. An equivalent invariant presentation may keep q as an additional variable of weight two.

   **Repair test:** At g=2,r=2, the leading class q⁵ has the positive representative α₁⁵α₂⁵; pair interchange gives α₃⁵α₄⁵, equal on the cone. Their invariant average requires coefficients 1/2. Keeping q gives the invariant monomial q⁵, weighted degree 10 and leading coefficient 1. S16 line 198 has the same overly strong representative wording; its positivity argument must be read in the quotient monomial ring.

2. **F02** (P2) Scheme-theoretic nilpotent fibre is not the reduced Lagrangian core

   **Location:** packages/CountingBundlesAndHallAlgebrasOfCurves/README.md:1148, 1156, 1435. “Its zero fibre Λ is projective Lagrangian”; the later BB decomposition uses this same Λ.

   **Claim:** The entire scheme-theoretic zero fibre is Lagrangian and has the opposite-action affine-bundle strata used in §9.1, in every characteristic.

   **Witness:** In characteristic 2, take an elliptic curve, r=2,d=1. For stable E, θ=a·Id has characteristic polynomial t²+a². The Hitchin zero fibre is locally Pic¹×Spec k[a]/(a²), not its smooth reduced core.

   **Exact repair text:** “Write Λ_sch=h⁻¹(0) for the scheme-theoretic fibre and Λ=(Λ_sch)_red for its reduced support. Prove that Λ is projective Lagrangian of pure dimension D. The opposite-action BB strata and their affine-bundle descriptions refer to Λ. Identify the rational points, geometric components and étale cohomology of Λ_sch with those of Λ.” Add the characteristic-two elliptic example as a negative-control Check. Propagate this distinction to §§8.7 and 9.1–9.4 and to the nilpotence characterization, retaining Λ_sch for families of nilpotent fields.

   **Repair test:** In this example D=1, Λ=Pic¹ is Lagrangian and is the rank-zero opposite stratum over Pic¹. Λ_sch has the additional nilpotent a-direction; the ambient symplectic form locally du∧da does not vanish on it. Reduction preserves all point counts and cohomological formulas. No characteristic is discarded.

3. **F03** (P1) The supplied two-frame chart and zero-level comparison are constructed again

   **Location:** packages/CountingBundlesAndHallAlgebrasOfCurves/README.md:1170 and 1191; ownership assertion at line 7. “Define ... Q°°”; “[μ⁻¹(0)/G] identifies with the canonical Higgs stack”.

   **Claim:** These are new constructions owned here, beyond the supplier's carrier and good-line existence.

   **Witness:** TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:1280 already constructs the smooth two-framing Quot chart, its cotangent moment map and the quotient identifying the Higgs stack on the bounded coherent open.

   **Exact repair text:** “Use the two-framing Quot chart Q₁₂ and its cotangent moment map from EndoscopicTransferAndUnitaryTraceComparison §3.7. Identify its fixed-source strongly generated open with the explicit open described here. Prove the displayed tangent sequence and compatibility of that supplied zero-level quotient with the natural coherent duality contract.” Remove the claim to a second chart and zero-level construction from Scope. Retain the numerical fixed-source bound, Kronecker embedding, character-stability comparison and central deformation as new targets.

   **Repair test:** For a line on a genus-g curve, the imported zero-moment fibre and the displayed exact sequence both give Ext¹(L,L)* of dimension g. No new carrier or second zero-level equivalence is required. The added explicit evaluation-surjectivity condition can be specified as the comparison property of the supplied strongly generated chart.

4. **F04** (P3) Several definitions lack three discriminating Checks

   **Location:** packages/CountingBundlesAndHallAlgebrasOfCurves/README.md:768, 964, 1519, 1611, 1649 and 1683.

   **Claim:** Each definition has at least three discriminating Checks.

   **Witness:** §4.6 puts generators in the generated algebra; §§5.9 and 10.1 repeat constant terms. §11.1 excludes an input, §11.3 gives no example, and §11.5 repeats primitive laws. These leave fewer than three discriminating Checks per definition.

   **Exact repair text:** Retain useful existing Checks and add the following computed tests (replace the tautological bullets rather than count them).

   | Definition | Additional discriminating Check text |
   |---|---|
   | §4.6 spherical subalgebra | “On P¹/F₂, the degree-zero line generator squared takes value 3√2 on O², whereas the degree-zero rank-two characteristic takes value 1. The torsion degree-one generator takes value 1 on κ(x) and 0 on O. In class (2,0), O(m)⊕O(−m) for all m≥0 gives infinitely many classes, so the total characteristic requires the completion.” |
   | §5.9 kernels | “For λ=(2), H_λ(z)=1/(1−z²), whose z coefficient is 0 and z² coefficient is 1; H_(1)(z)=1/(1−z) has both coefficients 1. This excludes replacing weighted partition size by multiplicity length.” |
   | §10.1 Mellit kernel | “At g=1,q=2,a=−1, H₁(z)=3(z+1), so H₁(1)=6 and H₁(0)=3. Swapping a with q/a=−2 gives H₁(z)=2(z+2), still H₁(1)=6 but H₁(0)=4. Reciprocal invariance is asserted at z=1, not for the whole two-variable kernel.” |
   | §11.1 quasi-parabolic objects | “On P¹, let V=O² with three marked rational points and chosen lines ke₁,ke₂,k(e₁+e₂) in its fibres. A constant endomorphism preserving all three flags is scalar, so this flagged object is absolutely indecomposable although V is decomposable. With only the first two flags it splits into the two flagged lines.” |
   | §11.3 exact HN counts | “On a genus-two curve with rational P, the nonzero class in Ext¹(O,O(P))=k gives a nonsplit bundle E of class (2,1). Its exact HN factors are O(P),O of slopes 1,0; E is absolutely indecomposable. The split extension has the same HN type and fails absolute indecomposability.” |
   | §11.5 Euler Hall operations | “On P¹_C, the torsion degree-one characteristic is primitive. With quotient-left convolution, its product with the degree-d line characteristic has value χ(P¹)=2 on O(d+1): the sublines O(d+1)(−x) are parametrized by x∈P¹. The reversed product has value 0 since a line has no torsion subsheaf. The commutator has value 2.” |

   **Repair test:** The displayed values distinguish the characteristic from a generator product, weighted from unweighted size, full-kernel from specialized reciprocal invariance, underlying from flagged decomposability, HN filtration from direct sum, and opposite Hall order. All are within the original hypotheses, including the three flags on P¹/F₂.

5. **F05** (P3) Equal slopes do not form two HN factors

   **Location:** packages/CountingBundlesAndHallAlgebrasOfCurves/README.md:784. “HN types (O,O) and (O(1),O(−1))”.

   **Claim:** (O,O) is a fixed HN type with one rational class.

   **Witness:** The standing convention at line 23 requires strictly decreasing HN slopes. O² has one semistable HN factor of numerical class (2,0), not two factors of slope zero. The alleged two-step HN stratum is empty.

   **Exact repair text:** “On P¹ the HN types ((2,0)) and ((1,1),(1,−1)) each have one rational bundle class, O² and O(1)⊕O(−1), respectively. The types ((1,m),(1,−m)), m>0, together with ((2,0)), give infinitely many classes in total class (2,0).”

   **Repair test:** The one-step type has slope 0; the other types have m>−m. Their class counts are each 1. The original equal-slope two-step type has count 0.

## Verified sound

Read all 1,758 README lines and all 100 Suggested.lean lines: **5 declarations**, **80 numbered target subsections**, and **85 Checks blocks containing 178 bullets**. The computed ledger below has **84 target rows** (the independent definitions and HN statement in §0.2 are separated), plus **5 declaration rows**. A successful finite test is not a proof of its general theorem. The failed and nondiscriminating Checks are identified above.

Resolved **84 distinct source-line anchors** in the README and checked their surrounding statements in the ten available source texts; separately checked WII (3.5.3). The three locator-only works remain uncertified below. Checked contracts against **24 named supplier roadmaps**, with the current supplied heads used for ClassicalGroupsPartII, GlobalShtukasAndFunctionFieldLanglands, FunctionFieldArithmetic, HabiroNahmSeries and QSeriesPartitionsAndMockModularForms. Object searches used the roadmap index, supplied main and Completed trees, board packages, supplied sibling checkouts and pinned libraries. No duplicate fully qualified name of the five Lean declarations was found.

The supplied content checkout equals its origin/main at 8888d45. Its Mathlib checkout and manifest both give 6b7abb3c7686292736be2955bd3eb9ebf63b456a; Tau Ceti gives a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The indexed citation resolver's older main label was not treated as evidence of absence: the three supplier texts also present in the supplied main were compared directly and agree after removing the tool's heading.

### Lean signatures and acceptance coverage

All declarations are in TauCetiRoadmap.CountingBundlesAndHallAlgebrasOfCurves. There are no section variables or include directives to lose. For the bundle definitions, k : Type u and X : Scheme.{u} share the universe, [Field k] and [X.Over (Spec k)] are explicit, and r : Nat is the fixed rank. The supplied elaborated signatures retain exactly these binders. No source or signature was changed, and no Lean command was run.

| Declaration; layer; line | Explicit context and native carrier | Computed instances, both sides | Assessment |
|---|---|---|---|
| bundleDegree; 0; 55 | k,X as above; {r : Nat}; E : FixedRank X r; result Int | P¹: O(1) gives 2−1=1; O(1)⊕O(−1) gives (2+0)−2=0; genus-two O² gives −2−2(−1)=0 | A real definition needed for the count; no assertion of cohomological finiteness on arbitrary schemes. |
| IsAbsolutelyIndecomposable; 0; 62 | Same k,X,r,E; pullback along X×Spec(kbar)→X; native Indecomposable of the sheaf | O has no nontrivial projector and is nonzero: true; O² has diag(1,0): false; zero is excluded: false | Native Indecomposable includes nonzeroness. The map points from the base-changed curve to X. |
| absIndecCount; 0; 71 | Same k,X; r : Nat, d : Int; Nat.card of Skeleton of the degree-and-indecomposability full subcategory | P¹ over F₃: ranks 0,1,2 give 0,1,0 in degrees −1 and 1; a line contributes 1, not its mass 1/2 | Actual isomorphism classes, not presentations or weighted classes; finiteness is a README target. |
| nilpotent_matrix_count; 1; 83 | K : Type u, [Field K], [Finite K], n : Nat; Matrix (Fin n) (Fin n) K | q=2,n=0,1,2: 1=2⁰, 1=2⁰, 4=2²; q=3,n=2: 9=3² | Natural subtraction is harmless at n=0 because n(n−1)=0. This is the full enumeration theorem, not padding. |
| absIndecCount_eq_of_degree; 10; 93 | k,X as above; [Finite k], [IsProper f], [SmoothOfRelativeDimension 1 f], [GeometricallyConnected f], f:X→Spec k; r : Nat, d,d' : Int | P¹ ranks 0,1,2: 0=0,1=1,0=0; elliptic rank one: #Pic⁰=#Pic⁰ in all degrees | All curve hypotheses survive elaboration. Smooth proper geometrically connected curves over a field are projective; no smaller characteristic range is encoded. |

The two statable headlines are the nilpotent-matrix enumeration (§1.4) and degree independence of the native absolute bundle count (§10.4). Both occur. The remaining headline families are: nilpotent-pair exponential and Jordan fibre masses (§§2.3,2.7); Green and spherical HN theorems (§§3.2,4.7); generic spherical form and universal counts (§§4.8–4.9); partition generating/residue formulas (§§5.10,6.1–6.3); origin constants (§§6.5–6.6); canonical stable Higgs geometry and central deformation (§§7.3,8.6–8.8); all-characteristic Higgs counts (§8.10); purity and compact Poincaré polynomial (§§9.1–9.3); cone traces/components (§9.4); Mellit integrality and universal degree independence (§§10.3–10.4); positivity (§10.5); parabolic/slope universality (§§11.2,11.4); constructible spherical Hopf and Lie theory (§11.5). Every family is named in the module docstring with its missing curve carrier, universal count, compatible series calculus, or geometric/cohomological construction. No replacement theorem on unrelated free variables is used. The three definitions serve the kept count theorem. The one-tactic probe found no theorem to delete as padding.

Native declarations checked include Mathlib's CategoryTheory.Indecomposable (Mathlib/CategoryTheory/Limits/Shapes/BinaryBiproducts.lean:1096), Skeleton (Mathlib/CategoryTheory/Skeletal.lean:74), ObjectProperty.FullSubcategory, Matrix.card_GL_field (Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Card.lean:120), IsArtinianRing.isNilpotent_jacobson_bot (Mathlib/RingTheory/Artinian/Ring.lean:54), IsArtinianRing.isSemisimpleRing_iff_jacobson (Mathlib/RingTheory/Artinian/Module.lean:641), and Finite.isDomain_to_isField. Tau Ceti's FixedRank and pullback are in TauCeti/AlgebraicGeometry/VectorBundle/FixedRank.lean:69 and :104; trivial is in TauCeti/AlgebraicGeometry/LineBundle/Basic.lean:131. The Euler-characteristic definition uses the finite truncation and integer alternating sum. The Krull–Schmidt endomorphism theorem at TauCeti/RingTheory/KrullSchmidt/Indecomposable.lean:266 needs finite length, which §1.1 supplies for its module transfer; it is not applied to coherent sheaves as finite-length objects. The direct-sum uniqueness theorem is at TauCeti/RingTheory/KrullSchmidt/DirectSum.lean:154. Native arm/leg definitions at TauCeti/Combinatorics/Young/HookLength/Basic.lean:136 and :140 use natural subtraction; the roadmap only evaluates them on diagram boxes.

### Supplier and convention checks

| Supplier contracts checked | Witness and scope conclusion |
|---|---|
| AlgebraicVectorBundles L0A–L2B; QuiverRepresentations Layers 1–2; ArtinAlgebras Layer 0 | Bundle pullback, left modules and categorical decomposition remain supplied. Hom(M,−) uses End(M)^op: for M=k², its endomorphisms commuting with M₂(k)^op are k. |
| SchemeAndStackFoundations §§1.18–1.21,2.20,3.3,3.6–3.7,4.14; AlgebraicModuliForArithmeticGeometry §§1.3,4.19 | Degree/Quot/Picard and coherent Grassmannian interfaces exist. Strong generation requires both H¹ vanishing and surjective evaluation: O(−1) on P¹ has H¹=0 but H⁰=0, so it is not generated by O. Character GIT is explicitly a gap, not claimed from the existing affine-gerbe factorization. |
| GlobalShtukasAndFunctionFieldLanglands §§0.1,0.5–0.6,0.13; FunctionFieldArithmetic §§0.2–0.3,5.1–5.4 | HN slopes decrease, χ((1,0),(1,1))=2 on P¹, reversed χ=0. Degree-one divisors need not be effective. P¹/F₂ torsion degree-one mass is 3; a degree-two point contributes 2 to N₂ and 0 to N₁. |
| EndoscopicTransferAndUnitaryTraceComparison §§3.6–3.7; AutomorphicSpectralTheory §§6.22c,6.24 | The actual two-frame zero-level presentation is already supplied (R03). The §3.7 projective-line Check explicitly states that indecomposables are lines; together with §1.2 this supplies the genus-zero splitting input. Canonical self-Ext² of (O,0) has dimension 1, so a higher-twist unobstructedness theorem is not substituted. |
| WeilConjectures WC.1; ReductiveGroupsPartII RG2.3.7 | Mass(BS₃)=1/6, and the S₃-action on three letters has mass 3/6=1/2. Lang for G_m/F₃ is geometrically onto via z↦z²; on rational points it is constantly 1. Neutrality of nonabelian H² is a distinct target. |
| ClassicalGroupsPartII CG.0.4–CG.0.5,CG.2.4–CG.2.6 | Coordinates t,z map to q,a. The flip is a↦q/a, fixing q; q=2,a=3 gives invariant sum 11/3. At g=0 the ring retains q±1. The full character ring is used, not a positive tensor subring. |
| HabiroNahmSeries §5.1; HabiroCyclotomicCompletions §1.1; QSeriesPartitionsAndMockModularForms §§2.4,3.5 | Ordinary log(1+T) has second coefficient −1/2; Exp(T) has second coefficient 1. At q=2, ψ₂((q−1)⁻¹)=1/3. Complete Adams and Macdonald theory remain declared extensions. |
| ArithmeticStatisticsPartVIII §5.17; LefschetzPencilsAndVanishingCycles §5.11; DeligneWeightsAndPurity §10.5 | Auxiliary ℓ≥5 avoids the genus-one mod-3 lifting exception. Normalized multiplier is 1, but the radial coordinate remains q₀^m. Fixing that coordinate would leave the nonzero vanishing polynomial q−q₀. |
| DeligneWeightsAndPurity §§0.10,0.12,0.16–0.18,1.7,7.15,8.8–8.11; EtaleDualityAndPerverseSheaves §§0.4,0.6–0.7 | A¹ contributes eigenvalue q in degree 2, not q⁻¹. Two exchanged components have top dimension 2 and first trace 0. An affine bundle of rank a needs shift 2a and twist −a; the general comparison is a declared gap. |
| CohomologicalPointCounting combined endpoint; CompactSupport Layers 6–8; EllAdicRealization Layers 7–9; TraceFormula Layers 11–12; ComplexComparisonPartII C6.3–C6.6 | Compact traces of A¹ and G_m are q and q−1. Finite-type constructibility plus a chosen lisse open compares ranks of the specified spread-out fibres; the comparison does not canonically identify unrelated complex curves. |

All eight supplied gap slugs occur both in design/plan.json and the README's exact contracts, with the same named supplier: coherent-ext-serre-duality, degree-only-strong-generation, fixed-source-good-lines, reductive-character-git, complete-adams-series, macdonald-admissibility, universal-curve-weil-density and affine-bundle-compact-shift. Their objects and hypotheses distinguish them from the current narrower interfaces; none has supplier “none”. Their absence from suppliers is not a finding. R03 concerns a construction outside the missing portion of its gap.

The dependency command returned:

```text
moved: CountingBundlesAndHallAlgebrasOfCurves moved in the merge order from #172 to #269, right after its last supplier ClassicalGroupsPartII (HabiroNahmSeries also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 51 roadmaps, 597 edges, 0 problem(s)
```

There is no UPWARD or CYCLE result. The proposed move is not a defect. The reviewed diff contains eight files, all within packages/CountingBundlesAndHallAlgebrasOfCurves. Suggested.lean has one Mathlib import and three existing Tau Ceti imports, no sorry'd data, no set_option, no lemma declarations and no admitted examples. Its two theorem bodies use sorry. No computational algorithm or process narrative was found in the README or Lean docstrings.

### Source locator ledger

| Source | Locations inspected and relevant conclusion |
|---|---|
| S16 | All 67 distinct README line anchors, with §§1–8 and Appendix B around their claims. In particular lines 118–203 (headlines), 428–450 (origin residue), 628–645 (radical and nilpotent masses), 820–944 (Jordan data), 952–1218 (Hall/generic form), 1720–1729 (regional expansion), 2036–2199 (weighted Jordan/partition products), 2402–2580 (Higgs/Quot/moment), 2726–2954 (stability/BB), 2969–3088 (cohomology), 3096–3220 (refinements), 3322–3373 (density). Corrections and limitations are recorded under Source issues. |
| MS14 | Lines 58–115,219–290,386–595: Theorem 1.2, coherent two-term derived comparison, canonical specialization, HN integration and the large-degree cutoff. Positive rank, slope-cut and canonical-twist hypotheses were retained. |
| HN10 | Lines 46–115,184–240,379–380: Hall conventions and completion; Theorem 3.1 and Corollary 3.5 give semistable and HN characteristic membership. |
| SV12 | Lines 659–705, §1.11: generic construction is over the torus fraction field. The package explicitly undertakes descent to its invariant coefficient ring, rather than pretending this source supplies that entire descent. |
| M18 | Lines 1287–1453, Theorem 7.1 and Corollary 7.2: HLV admissibility and integral Laurent coefficients; the generic theorem is a supplier contract. |
| WII | Lines 2813–2857, (3.5.1)–(3.5.3), printed pp.210–211: degree-fibre equidistribution and geometric Frobenius. |
| ACK07 | Lines 1088–1200, Lemma 5.5 and its bounded regularity conditions: the tight-submodule argument must be transported to the numerical curve framing, as the package's own comparison target does. |
| LIN15 | Lines 232–339,468–529,986–1017,1686–1702: quasi-parabolic category, Euler correction, HN membership and shuffle map. On P¹ two line flags jumping in steps 1 and 2 give Euler values 0 and 1 in opposite orders. |
| BTL12 | Lines 766–900, §§4.2–4.4: finite-dimensional-module setting, Euler convolution and algebraic coproduct only on the specified subalgebra. The package explicitly owns the coherent extension. |
| SPR66 | Lines 6715–6756, Theorem 3.5: neutrality over perfect fields of dimension at most one; connected Lang-H¹ uniqueness is a separate step. |

### Computed target ledger

All rows use the standing finite-field smooth projective geometrically connected curve conventions unless stated otherwise. Nonfields, nonproper curves and arbitrary nonflat base changes are outside these targets.

| Statement | Instances | Values computed | Result/change |
|---|---|---|---|
| 0.1 | g=0; g=1, q=2,a=3; ψ₂ | (R₀, swapped trace, denominator)=(Q[q±1],3+2/3=11/3,1/3), versus Q,3,1 | pass |
| 0.2 degree | P¹ O(1), O(1)⊕O(−1); genus2 O² | 2−1=1; (2+0)−2=0; −2−2(−1)=0 | pass |
| 0.2 absolute predicate | O,O²,0; degree2 skyscraper | indecomposable truth=(true,false,false,false); projector ranks in O²=(1,1); geometric skyscraper summands=2 | pass |
| 0.2 counts | P¹ over F₃, ranks0,1,2; d=−1,1 | counts (0,1,0) in each degree; line mass=1/2 versus count1 | pass |
| 0.2 decorated counts | P¹/F₂; torsion degrees 1,2; rank-one d=−1,0 with ν=0 | absolute torsion counts 3,3 (one length-d object per rational point); a degree-two closed support splits geometrically into 2 summands; lower-cut line counts 0,1 | pass; torsion counts are separate from native rank-zero bundle count 0 |
| 0.2 HN extension | O(2)⊕O(−1); degree2 skyscraper; zero | HN slopes (2,−1)=(2,−1), +∞=+∞, empty=empty after extension | pass |
| 0.3 | u=1, h⁻¹,h⁻²,1 | (rRes,dRes)=(1,−1),(0,−1),(0,0) | pass |
| 1.1 | M=O² on P¹; N=O; M=0 | End(M)=M₂(k); Hom(M,N)=k², End over M₂(k)^op=k=End(N); zero maps to0 | pass |
| 1.2 | 0,O,O²; F₂[t]/t² | numbers of summands0,1,2; local residue fields k,k; M₂(k) nonlocal; t²=0,(1+t)²=1 | pass |
| 1.3 | N=k[t]/t²; M=N² over F₂ | radical dimensions1,4; quotient cardinal16; N=tI has square0 and image0 | pass |
| 1.4 | n=0,1,2 at q=2; n=2,q=3 | counts1,1,4,9; q^(n(n−1))=1,1,4,9; GL counts1,1,6,48 | pass |
| 1.5 | 0; O/F₃; O²/F₂; k[t]/t²/F₂ | ratios1,1/2,4/6,2/2; residue products1,1/2,2/3,1 | pass |
| 1.6 | G_m/F₃; dual-number units/F₂; constant C₂/F₃ | neutral H² classes all; numbers of forms1,1,2; rational units2,2,2 | pass |
| 1.7 | Frobenius orbit size2, extensions1,2 | fixed absolute classes0,2; divisor sums0,2; descended class2α | pass |
| 1.8 | (r,d)=(2,1); residue degree e | e divides1 so e=1; in k[t]/t², c+bt has scalar c and nilpotent bt, End dimension2 not1 | pass |
| 1.9 | rank1,d=−1,0,1; g2 r2 d3 | cutoff0,1,1; bound3>2; adjacent gap≤2; genus1 gap≤0 | pass; projective-line classification is stated in the supplier’s §3.7 Check |
| 1.10 | P¹ ranks1,2; d=−1,0,1 | counts1,0 at all d; dual and twist give1=1,0=0 | pass using that classification and Krull–Schmidt |
| 2.1 | Id:BS₃→BS₃; S₃ on3 letters; empty | fibre mass1, Fubini1/6=1/6; action3/6=1/2; empty0 | pass |
| 2.2 | zero; line/F₃; length2 torsion/F₂ | masses1,1/2,1; Id on line is not nilpotent since Id^m=Id≠0 | pass |
| 2.3 | one absolute species,q=2, multiplicities0,1,2 | Euler coefficients1,1,2/3; exp coefficients1,1,1/2+1/6=2/3 | pass |
| 2.4 | θ=0; size2 Jordan block; length2 torsion | α₁=[F]; (r₁,r₂)=(0,1), weighted rank2; torsion weighted degree2 despite all ranks0 | pass |
| 2.5 | one step; zero step; O(−1)⊂O(−1)⊕O(1) | one-step fibre1, repeated step contributes0 class; total degree0 but minimum slope−1, cutofffalse | pass |
| 2.6 | zero endomorphism; size2 block; positive total sheaf | flags H₁=H and (H₁,H₂)=(0,H); positive F iff positive H, zero gives true=true | pass |
| 2.7 | α₁=O; α₂=O; α₁=O,α₂=O(1) on P¹ | exponents(0,0,0); (−1,−1,0); (d,d′,d″)=(−3,−3,0), masses q⁻³,q⁻³,1 | pass |
| 3.1 | O,O on P¹/F₂; zero; reversed O,O(1) | product3v; coproduct v/2; unit coefficient1; Euler exponents2,0 | pass |
| 3.2 | same O,O example | pairing3v/6=v/2; tensor pairing v/2=v/2 | pass |
| 3.3 | rank2 torsion length1; negative torsion degree | Hall coefficient v² times v⁻²=1; empty class indicator0 | pass |
| 3.4 | O⊂O², P¹/F₂ | flag mass3/6=1/2; v⁻¹(v/2)=1/2 | pass |
| 4.1 | r=0; rank1 degrees−1,0,1 | E₀^vec=1; coefficients of E₁^vec all Pic indicators1; torsion first coefficient on κ(x)=1 | pass |
| 4.2 | r=0,1,2; q=2 | zeta arguments empty,2⁻¹ᐟ²z/w,(z/(2w),z/w); empty product1 | pass |
| 4.3 | r=0; split1+1,g0 | E₀ coproduct coefficient at κ(x),0=1; factor q⁻¹ᐟ², arguments q¹ᐟ²z,q⁻¹ᐟ²z | pass |
| 4.4 | r=1; r2 g1; simple pole | prefactor V₁⁻¹V₁=1; rRes h⁻¹=1 versus dRes−1 | pass |
| 4.5 | O(1)⊕O(−1),P¹ | Euler3; external q⁻¹ᐟ² and shifts q⁻¹ combine with Hall q³ᐟ² to1 | pass |
| 4.6 | line/torsion generators; unbounded class(2,0) | generator degrees(1,d),(0,1); O(m)⊕O(−m),m≥0 gives infinitely many classes | pass, Check coverage R04 |
| 4.7 | HN types(2,0) semistable; (1,1),(1,−1),P¹ | one class each, but sum over m≥0 is infinite | R05; equal-slope two-step stratum has 0 classes, corrected one-step stratum has 1 |
| 4.8 | one-line mass q2,3 | P(1)/(q−1)=P(1),P(1)/2; q¹ᐟ² flag factor canceled by q⁻¹ᐟ² | pass scalar normalization; full generic descent not independently proved |
| 4.9 | P¹/F₂, classes(0,1),(1,1) | N₀=1+3z; [T]N=1+4z; [Tz](N/N₀)=4−3=1 | pass |
| 5.1 | one-line positive/negative expansions | coefficients V₁ for d≥0 and V₁ for d<0; wrong positive fraction at infinity gives−V₁ | pass |
| 5.2 | one rank1 slot q2; X=P¹ | first torsion coefficient #X/(q(q−1))=3/2; unshifted wrong coefficient3 | pass |
| 5.3 | (r₁,r₂)=(1,2); s1 | shifts q⁻¹,q¹ᐟ²; one-slot coefficient V_r in every degree | pass |
| 5.4 | 1/(1−z) at0,∞ | multiply expansions by1−z gives1 and1; their difference gives0 rationally | pass |
| 5.5 | s1; s2 | positive V₁/(1−zw), negative−V₁/(1−zw); negative-region coefficient V₁; sign(−1)²=1 | pass |
| 5.6 | tuples(1),(2),g2 | a=0,−1/2; first complete prefactor1; chain ratio q⁻¹; b(2)=0 | pass |
| 5.7 | r₂=1; degree component d₂=1; all ranks0 | weighted exponents T²z²; unweighted wrong Tz; empty generic type has torsion coefficient #X/(q−1) | pass |
| 5.8 | λ=(1),(2),(1,1),(3) | products1,ζ(q⁻¹z),1,ζ(q⁻¹z)ζ(q⁻¹z²); exponent for(3)=X(q⁻¹z+q⁻¹z²) | pass |
| 5.9 | empty,(1),(2),(1,1); formal g1,q2,α=(−1,−2) | J_empty H_empty=1; J₁=6,H₁=(1−z)⁻¹; multiplicity lengths1,2 and residue counts0,1 | pass, Check coverage R04 |
| 5.10 | empty,one box, P¹/F₂ | empty torsion series1+3z; one box factor1/(1−z); raw coefficient[Tz]=4 | pass |
| 6.1 | T⁰,T¹ on P¹/F₂ | constant1; rank1 factor1/(1−z); uncanceled torsion would add3z to constant | pass |
| 6.2 | r2,b=(2,3),K=Q; char2 | residues−5/2,1/2; extraction even2,odd3; char2 denominator(1−z)² | pass |
| 6.3 | r1 | A(z)=P(1)/(1−z); residue−P(1); extractionP(1) | pass |
| 6.4 | q2,g0; q2,α=(−1,−2) | 0=1/3−1/12−1/4; P6,U15,V0,S5/6 yields6(5−4)=6 | pass |
| 6.5 | r1; q⁻¹; α₁α₂=q | origin value1; q⁻¹ undefined; paired products0=0 | pass |
| 6.6 | r1,g1,2; g2 ranks2,3,4; g3 ranks3,4 | r1 residues−1; constants2,6,22; g3 values15,95 | pass |
| 7.1 | line,L²; torsion κ(x); elliptic fields0,η | stable true,false; torsion Ext dimensions(1,2,1), naive(1,1,0); commutator Id↦η gives1 not−1 | pass |
| 7.2 | W=ke₁; matrices[[1,1],[0,2]],[[1,0],[1,2]] | lower-left0,1; preservation true,false; image criterion true,false | pass |
| 7.3 | r1,g2; r2,d1,g1,p2 | dimensions4,3,cone2; in char2 t²+a² gives scheme fibre a²=0 versus reduced a=0 | R02 |
| 7.4 | g2 r2d1 d₁5; bad evaluation L₁M⊕B | l₁9, kernel rank7 degree−46; Hom dimensions1+8=9 but first evaluation not surjective | R03 ownership, mathematical tests pass |
| 7.5 | line genusg; zero covector | kernel dimensiong; zero moment0; duplicated supplied Higgs fibre dimensiong | R03 |
| 7.6 | scalar1-arrow x=2,y=3; char2 x=y=1 | moments(6,−6), (1,1); total traces0,0; zero y gives(0,0) | pass |
| 8.1 | g2r2d1; elliptic r1d0; bounded vectors | B=−3/2,d₁5,l₁9,d₂24,l₂47,C423; elliptic(2,2,7,7,C14); δ zero only0/full | pass |
| 8.2 | (l₁,l₂)=(2,3); actual(9,47), subline deg1 | δ(1,1)=−1,δ(1,2)=1; δ(5,24)=216−235=−19 | pass |
| 8.3 | local End dimensionh; proper projector | fibre q^(h−χ); automorphisms(q−1)q^(h−1); contribution q^(1−χ); projector determinant≠0 for p>C | pass |
| 8.4 | elliptic r1d0 p2; scalar doubled model(1,2),p3 | weights≤−3,−2dimU₂; moment(2,−I₂); full differential rank4, restricted rank1 | pass modulo chart ownership |
| 8.5 | g2r2d1; sublines deg1,0 | section determinant−19,+19; slope deviations+1/2,−1/2 | pass |
| 8.6 | r1g2; t≠0 | all fibre countsq²P(1); t⁻¹t=1 on cotangent coordinates; relative dimension4 | pass |
| 8.7 | Y=A¹×A² over F₃; nonreduced core test | 27=3·9; 9=9 for fibres; rank drop3→2; scheme core in R02 has an extra nilpotent direction | R02 qualification for opposite core |
| 8.8 | r1g2; P¹r1,r2 | q²P(1)=q^D A; 1=1; 0=0 | pass |
| 8.9 | r1g1,q2; unequal slopes | I⁺=2A⁺, Ω⁺/(q−1)=2A⁺; Hom(high,low)=0 hence Ext²(low,high)=0 | pass |
| 8.10 | E:y²+y=x³ at q2,4 | A=3,9; Ω=#H=6,36; stack masses6,12 | pass |
| 9.1 | r1g2; char2 r2g1 thickening | m2,b0,D2; shifts4,−2; same étale groups after reduction, but no reduced affine stratum for thickened core | R02 |
| 9.2 | g1r1; g2r2d1 | positive(1+α₁)(1+α₂); g2 D5, top degree10 not divisible4 | R01 |
| 9.3 | r1g1,2; point/two points | signed t²(1−t)²,t⁴(1−t)⁴; compact ranks1,2,1; H⁰ ranks1 versus2 | pass |
| 9.4 | r1g2; two permuted components | q²∏(1−α⁻¹)=P(1); top dim1; permutation top dimension2 trace0 | pass with R02 reduction |
| 10.1 | empty; one box | Ω₀=1,H₀=0; H₁=∏(z−a)(1−q/a), H₁(1)=P(1) | pass, Check coverage R04 |
| 10.2 | empty; constant regular sequence | f_empty=1; f_(n+1)(1,x)=1=f_n(qx); u⁰ coefficient1 | only elementary controls; M20 uncertified |
| 10.3 | r1; 1/(1+z) | H₁ Laurent polynomial; control value1/2 at1 but pole−1 | M18 integrality read; M20 deformation uncertified |
| 10.4 | P¹ r0,1,2; genus1 all r; periodic control2,3 | counts0,1,0 independent of d; genus1P(1); control pole−1 so excluded | pass |
| 10.5 | g2r2 d0,1 | A equal; origins2=2; invariant polynomial top obstruction10≠4e persists | R01 |
| 11.1 | no marks; r1; p_i1; degree2 mark | ordinary countP(1); unique rank1 flags; residue degree2 outside rational-mark hypotheses | pass, Check coverage R04 |
| 11.2 | no marks; rank1; two-step parabolic lines on P¹ | valuesA,P(1); Euler flag orders0,1; localized(2−1)⁻¹=1 but q1 pole | pass |
| 11.3 | rank1 d−1,0 at ν0; O(1)⊕O(−1) | cut counts0,P(1); latter HN slopes1,−1 but absolute count0 | pass, Check coverage R04 |
| 11.4 | ν0, rank1, degrees−1,0; dualdegrees1,0 | lower counts0,P(1)=upper counts0,P(1) | pass |
| 11.5 | c·1; primitive x,y | Δ(c1)=c(1⊗1), primitive RHS2c(1⊗1), so c0; mixed coefficients1−1=0 | pass, Check coverage R04 |
| 11.6 | rank1; p₁1; q⁻¹ | proposed root multiplicity1=origin1; parabolic countP(1); q⁻¹ has no origin value | conjectures only; R01 representative distinction |


## Not verifiable

- M20, Theorem 1.1, Proposition 3.1, §4, Lemma 5.1 and Theorem 5.2: settled locator-only source. Its full deformation proof and published numbering were not independently read. The native degree-independence signature was checked for meaning and boundary values, not proved.
- FH58, Theorem 1: settled locator-only source. The count was independently computed for n=0,1,2 over F₂ and F₃, and S16 line 644 identifies the general theorem; the original proof remains uncertified.
- HES81, Theorem 5.7: settled locator-only source. S16's application and the package's dimension and twist conventions were checked; the original BB theorem's text remains uncertified. No new source request is required for these three settled works.
- No fresh Lean elaboration or build was run, as required by the read-only brief. Binder comparison used the supplied five elaborated signatures and the pinned source definitions. No claim of a new build result is made.
- The source and instance audit does not prove the generic invariant Hall descent, every higher-rank ordered residue identity, or the new all-characteristic geometric constructions. The ledger records concrete tests and identified proof inputs, not complete formal proofs.
- Ownership against additional open pull requests whose files the brief did not provide was not independently checked beyond the supplied roadmap index. The named suppliers were resolved with the roadmap tools; no further sibling checkout was fetched. No claim about inaccessible sibling contents is made.

## Source issues

- **Misprint** in S16 at Corollary 1.4(i), printed p.301 (S16 line 191): the source says the reciprocal cone trace has prefactor q^(2D); it should be q^D, as rank-one genus-two Picard counts show; affects a stated result.
- **Misprint** in S16 at Corollary 1.4(ii), printed p.301 (S16 line 194): the source says the component-count cohomological degree is D; it should be 2D; affects a stated result.
- **Error** in S16 at Corollary 1.5, printed pp.301–302 (S16 line 198): the source says positivity has an invariant integral polynomial representative before quotienting paired coordinates; it should be positivity of a representative whose class is invariant, since g=2,r=2 gives degree 10 and monic diagonal; affects a stated result.
- **Misprint** in S16 at Corollary 1.9, printed p.305 (S16 line 445): the source says the differential-residue extraction has positive sign; it should be the negative residue sum, giving 1 rather than −1 in rank one; affects a stated result.
- **Misprint** in S16 at Lemma 2.4, equation (2.1), printed p.309 (S16 line 635): the source says a repeated indecomposable contributes n copies of its radical; it should be the n-by-n matrix radical, contributing n² copies; affects a stated result.
- **Misprint** in S16 at Lemma 2.6 proof, printed p.311 (S16 line 759): the source says the descended orbit sum has no proper Galois-invariant submodule; it should be no nonzero proper Galois-invariant direct summand; a line has proper subbundles with torsion quotient; affects the proof.
- **Misprint** in S16 at §4.2, printed p.316 (S16 line 1010): the source says the bundle–torsion Hall factor is q^(−l/2); it should be q^(−rl/2); rank two and torsion length one otherwise leave an unwanted square-root factor; affects a stated result.
- **Misprint** in S16 at Corollary 4.5 proof, printed p.320 (S16 line 1205): the source says the first HN slope suffices for the nonnegative cutoff; it should be the last slope, since slopes decrease and O(1)⊕O(−1) fails that cutoff; affects the proof.
- **Misprint** in S16 at §5.6, printed p.332 (S16 line 2047): the source says the Jordan generating exponent is the unweighted sum of the α_i; it should be the sum of iα_i, making a size-two block contribute rank two; affects a stated result.
- **Error** in S16 at §6.2, printed p.337 (S16 line 2416): the source says the canonical Higgs stack has dimension 2(g−1)r²; it should be distinguished from virtual dimension: the nonempty coprime stable stack has dimension 2(g−1)r²+1; affects a stated result.
- **Misprint** in S16 at §6.6, equation (6.6), printed p.343 (S16 line 2674): the source says the split-sequence dimension sum uses Hom(L₂,ker φ₂); it should be Hom(L₂,ker φ₁), the kernel in the split sequence (6.4); affects the proof.
- **Error** in S16 at §6.8, printed p.345 (S16 line 2761): the source says equivariance descends the moment map from the whole semistable quotient to the central line; it should be restricted to the inverse image of that invariant central line before descending; affects the proof.
- **Error** in S16 at Lemma 6.5 proof, printed p.345 (S16 line 2776): the source says the descended moment map is submersive onto the full dual Lie algebra; it should be the ambient map to the scalar annihilator, followed by restriction and quotient of central levels; affects the proof.
- **Misprint** in S16 at §6.11, printed p.351 (S16 line 3050): the source says all Hitchin-base coordinates have scaling weight one; it should be weight i on the degree-i characteristic coefficient; affects the proof.
- **Misprint** in S16 at equations (6.11)–(6.12), printed pp.351–352 (S16 line 3074 and S16 line 3080): the source says the compact cohomological shifts are the affine ranks D and b_i; it should be twice those ranks, 2D and 2b_i, with twists −D and −b_i unchanged; affects a stated result.
- **Gap** in S16 at Theorem 7.1 and §7.2, printed pp.352–353 (S16 line 3118 and S16 line 3123): the source says the parallel Hall proof gives the unlocalized invariant ring; it should be supplemented by denominator removal, since the cited parallel theorem gives only K_g; affects the proof.
- **Error** in S16 at §8.3, printed p.354 (S16 line 3191): the source says unrestricted constructible Hall functions form an algebraic Hopf algebra; it should be a product-function coproduct first, with algebraic tensor closure proved for the chosen subalgebra, as BTL12 line 876 specifies; affects a stated result.
- **Misprint** in S16 at Appendix B, printed p.357 (S16 line 3350): the source says equidistribution (3.5.3) is in the first Weil-conjecture paper; it should be WII (3.5.3), printed pp.210–211; affects nothing.
- **Misprint** in LIN15 at §1.2, equation defining slope, PDF p.6 (LIN15 line 317): the source says arbitrary real parabolic weights give a rational-valued slope; it should be real-valued unless the weights are restricted to rationals; affects a stated result.
- **Error** in LIN15 at Lemma 1.1, PDF p.6 (LIN15 line 328): the source says the coherent parabolic category has enough injectives; it should be formulated using an ambient category for injective resolutions; unmarked coherent sheaves on a smooth projective curve already lack enough injectives; affects a stated result.
- **Error** in S16 at Corollary 1.5, printed p.302 (S16 line 201): the source says the diagonal polynomial is monic of degree 2D for every coprime class; it should be restricted to g≥1 or r=1; genus zero and rank two give the zero polynomial and D=−3; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "5a0a8bde640b2f0ab1dea2a88897697911b4d916", "job": "RT-CountingBundlesAndHallAlgebrasOfCurves~1a", "model": "gpt-6-astra", "worker": "chris-6"} -->
