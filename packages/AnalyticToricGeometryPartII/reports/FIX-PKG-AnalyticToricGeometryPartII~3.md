# Repair report: AnalyticToricGeometryPartII

## F01 (P2) — applied

Redundant positivity gap → AbelianSchemesAndArithmeticModuli §A2.7 `ampleIntersectionPositive`, verified at head 71ecc01 and STACKS line 4827. Updated Scope, supplier contracts, §6.3 route and Needs, §6.4 Needs, Layer 6 dependencies and STACKS manifest coverage; deleted only that top-level plan gap. Added the zero-dimensional/inseparable Check. SchemeAndStackFoundations retains Chern, degree, Gysin and the separate generic-cuts gap.

## F02 (P3) — applied

Three overlapping §2.4 convolution bullets → one coefficient/convergence/construction/norm bullet, followed by the distinct singleton-product law. All Checks remain. Rechecked §2.2's coefficient, summability, monomial and norm assertions and the Layer 2 examples: these provide distinct conclusions. For D=0, 2χ^(0,1) times 3χ^(0,−1) has coefficient 6 at (0,0), zero elsewhere, and norm |6|=|2||3|.

## F03 (P3) — applied

“Two distinct fibres of type (2,0)” → their union has class (2,0); each fibre of the first projection has class (1,0). The Check computes 1+1=2 and retains disconnectedness. The occurrences in §§6.2, 6.4, Layer 6 Examples and Worked examples agree: one equation, codimension 1, dimension 1. Two individual class-(2,0) divisors would instead have total degree 4.

## F04 (P3) — applied

SCH12's manifest range 249–250 → 249–251. The printed page header is at SCH12 line 237, Lemma 1.16 at SCH12 line 271, and the next page begins at SCH12 line 284. The README's p. 251 locators already agree. The manifest key, versions, URLs, hash and all other SCH12 locators are unchanged.

## Validation and edit boundaries

The required elaboration of `packages/AnalyticToricGeometryPartII/Suggested.lean`, run from the supplied content checkout with its absolute tool argument, exited 0 with no output or warnings. The file remains unchanged: one `import Mathlib`, zero declarations, zero admitted proofs, no data placeholders and no options. No Tau Ceti object build was needed. The declaration inventory is empty, so the requested `#check @name` inventory has no entries; its generated scratch probe containing `import Mathlib` also elaborated once, exited 0 and produced no output. There are no dropped binders or changed Lean names. Both Lean processes finished.

The module docstring still lists the missing carriers for every headline: arbitrary-coefficient toric schemes and divisor modules; toric formal completion and generic fibres; perfected cone algebras and tilts; the actual towers, sites and geometric morphisms; their cohomology pullbacks; integral section domains and homogeneous sharp; operational Chow groups and orbit evaluation; and the approximation zero loci and projection. A free coefficient calculation or integer-matrix kernel would not state those geometric results. None of these repairs makes a previously unavailable carrier available at the pins.

The required dependency command, with the supplied configuration, roadmap name, order and `--movable`, exited 0. Its complete output was:

```text
depcheck: 51 roadmaps, 590 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. AbelianSchemesAndArithmeticModuli is at position 49 and this package at position 180. No merge-order edit is required.

The citation resolver exited 0 and listed no unresolved cross-roadmap citation or Lean name. It reported that its host did not check pinned Lake packages and identified its cached main as 5f173a7; these are limitations of that resolver output. Library declarations were therefore inspected directly at the supplied pins, and main-branch suppliers directly in the supplied content checkout, whose HEAD is 8888d45eea61a0573e32d9b39a00c833f844fc44. The supplied `Chow.gysin` citation lead is resolved by SchemeAndStackFoundations §5.5, lines 6818–6826; it is a supplier target, not a claim that the pinned libraries already declare it.

JSON comparison against the original plan confirms that every key other than top-level `gaps` is identical, and that the only gaps change is deletion of `ample-degree-positivity`. The seven remaining slugs match the seven README contracts. TOML parsing passed. The README has 29 target subsections and 102 Check bullets, with at least three in each subsection. `git diff --check` passed. `Suggested.lean` and `metadata.toml` were not edited. No additional gate failure was listed in the brief.

## Ownership, supplier and source verification

Read the main-branch shape examples `TauCetiRoadmap/AnalyticToricGeometry/README.md`, `TauCetiRoadmap/AdicSpaces/README.md` and `TauCetiRoadmap/AdicSpacesPartIII/README.md`. No layers or untouched targets were reorganized.

Object-based ownership searches used the supplied roadmap index across its 362 open heads and main, plus the board packages. The positivity search finds the earlier §A2.7 owner; it is a new-roadmap dependency, not a revision of a main-branch roadmap. No new construction is introduced here. Other toric-cover search hits concern framed smooth charts and period/cochain comparisons, rather than new ownership of this package's fixed-fan section and approximation results. Existing main-branch suppliers were read on main, rather than using open revisions of those roadmaps. The changed scope remains an extension of AnalyticToricGeometry.

| Contract | Copy and evidence inspected | Outcome |
| --- | --- | --- |
| AnalyticToricGeometry Layer 0 | Main, Layer 0 from line 166, lattice/cone/regular-coordinate/face and fan interfaces | Supplies the integral lattice and complex comparison; arbitrary coefficients remain the C0.16 contract. |
| ShimuraCompactifications C0.6–C0.7, C0.9, C0.16–C0.18 | New-roadmap head 63e3f03, sections at lines 499, 514, 569, 748, 776 and 799 | Closed face projections, open localization, arbitrary-ring gluing, properness and boundary are distinct contracts. |
| AdicSpaces §§2–5 | Main, Layers 2–5 from lines 354, 450, 547 and 624 | Affinoids, rational localization, sheafiness and gluing. |
| AdicSpacesPartII R0–R1 | Main, R0.19.1–R0.19.3, R0.20.1, R1.3 and R1.6 | Constructible compactness, completed-colimit hypotheses, analytification and properness retain their stated scopes. |
| AdicSpacesPartIII R2 | Main, R2.2, R2.3, R2.4, R2.8 and R2.10 | Nonnoetherian rank-one valuation models, generic fibres, good-reduction comparison and fractional section domains. |
| PerfectoidSpaces P1–P3 | Main, P1.30; P2.1–P2.3 and P2.9–P2.12; P3.18 and P3.20 | The polydisc approximation needs the existing cone-extension gap for this application. Perfectoid spaces and their sites use the native adic carrier. |
| PerfectoidSpaces P7 | Main, P7.1–P7.4, P7.11–P7.15, including the completed-colimit input at line 16686 | Chart density and residue-field density remain distinct; the latter follows through the stated conversion. |
| SchemeAndStackFoundations | Main, §§0.7, 0.17–0.18, 0.23a, 0.29, 2.1–2.2, 3.4, 4.13 and 5.1–5.6 | Dimension, ULA-route scheme inputs, divisor classes, Chern/degree/Gysin and smooth intersection contracts remain named. Generic cuts and operational split-orbit duality remain explicit gaps. |
| AbelianSchemesAndArithmeticModuli §A2.7 | New-roadmap head 71ecc01, README lines 1228–1238; STACKS line 4827 | Proper schemes over arbitrary fields, d ample factors and dimension d; use repeated H and add positive component multiplicities. |
| EtaleCohomologyFoundations §F.2.3 | Main, lines 540–553 | Smooth ULA for finite invertible lisse coefficients, with base-change and cospecialization coherence. |
| ClassicalAdicEtaleCohomology §§1.1, 6.2, 8.2 | New-roadmap head dfcb6b7; proper valuation specialization at line 3143 and proper algebraic comparison at line 3601 | Nonnoetherian valuation specialization and proper analytic comparison are available; the separate geometric-morphism cup-pullback gap is retained. |
| WeilConjectures WC.6 | New-roadmap head d90e186, “A smooth proper nonprojective threefold”, from line 1072 | Same seven rays, ten maximal cones, integral model and fixed-fan Chow presentation. |

All four cited works were available in their existing legal source caches. No additional work, manifest key, missing-reference request, waiver or paywall exception was needed. Source text was not copied into package files. The SCH12 and STACKS locator corrections reuse their existing keys and access records.

| Source | Opened locators | Mathematical use |
| --- | --- | --- |
| SCH12 | Theorem 1.5, p. 247, SCH12 line 91; Lemma 1.16, p. 251, SCH12 line 271; Proposition 5.20, p. 280, SCH12 line 1344 | Full affine line, hypersurface neighborhood and perfected-polydisc comparison. |
| SCH12 | Lemma 6.5 and Remark 6.6, p. 288, SCH12 line 1752; Definition 7.14 through Corollary 7.19, pp. 302–303, SCH12 line 2317 through line 2351 | Quantitative homogeneous approximation, residue-field limits, étale descent and torsion continuity. |
| SCH12 | Definition/Proposition 8.4, p. 304, SCH12 line 2381; Theorem 8.5, pp. 304–305, SCH12 line 2414; Propositions 8.6–8.7, pp. 305–306, SCH12 line 2446 and line 2458; Corollary 8.8, p. 307, SCH12 line 2496 | Divisor signs and weights, the five comparisons, prime-to-p cohomology, homogeneous cone algebra and both approximation endpoints. The source's final equation is interpreted as a section of the powered line bundle. |
| FS94 | Proposition 1.1, p. 4, FS94 line 117; Proposition 1.4 and Theorem 2.1, p. 6, FS94 line 176 and line 198; Corollary 2.4 and equation (2.3), p. 7, FS94 line 222 and line 235 | Orbit relations, weights and wall sign; local-equation weights are the negatives of section-generator weights. |
| FS94 | Proposition 3.1, p. 10, FS94 line 373; Theorem 3.2 and proof, pp. 11–13, FS94 line 393 and line 493 through line 508 | Product multiplicities and degree; the proof at FS94 line 506 specifies N/Nγ as the displacement lattice. |
| FS25 | Example 4.1, pp. 7–8, FS25 line 299 through line 322 | Same nonprojective complete regular fan and cyclic primitive relations. |
| STACKS | §33.6, tags 020I and 035X, STACKS line 223 and line 229; Lemma 33.45.6, STACKS line 4784; Lemma 33.45.9, tag 0BEV, p. 104, STACKS line 4827 | Imperfect-field reduction, component multiplicities and arbitrary-field ample positivity. The printed p. 104 header is at STACKS line 4803. |

The directly inspected pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, matching `lake-manifest.json` in the supplied content checkout.

| Pinned object | Repository-relative library locator | Definition/hypothesis boundary read |
| --- | --- | --- |
| `AddMonoidAlgebra` | `Mathlib/Algebra/MonoidAlgebra/Defs.lean:64` | Finite coefficient functions with convolution. |
| `MonoidAlgebra.mapDomainRingHom` | `Mathlib/Algebra/MonoidAlgebra/MapDomain.lean:285` | Exponent homomorphism induces a coefficient-preserving ring map. |
| `ZeroAtInftyContinuousMap` | `Mathlib/Topology/ContinuousMap/ZeroAtInfty.lean:45` | Continuous map with cocompact convergence to zero; discreteness and toric multiplication are additional data. |
| `PointedCone`, `ConvexCone.Salient` | `Mathlib/Geometry/Convex/Cone/Pointed.lean:33`; `Mathlib/Geometry/Convex/Cone/Basic.lean:298` | Nonnegative-scalar submodule and the separate no-line condition. |
| `TauCeti.Toric.Fan`, `TauCeti.Toric.IsToricCone` | `TauCeti/Geometry/Toric/Algebraic/Fan/Basic.lean:83`; `TauCeti/Geometry/Toric/Algebraic/Cone/Basic.lean:147` | Finite cone family without a nonemptiness field; rationality and salience are explicit. |
| Primitive rays and dual monoids | `TauCeti/Geometry/Toric/Algebraic/Ray/Primitive.lean:167`; `TauCeti/Geometry/Toric/Algebraic/DualSemigroup/Basic.lean:53`; `TauCeti/Geometry/Toric/Algebraic/DualSemigroup/Finiteness.lean:76` | Integral-lattice and toric-cone hypotheses; Gordan finiteness is supplied. |
| Complex fan scheme | `TauCeti/Geometry/Toric/Algebraic/AffineScheme.lean:60`; `TauCeti/Geometry/Toric/Algebraic/Fan/Scheme.lean:136` | The coefficient ring is ℂ; arbitrary-ring toric geometry is not silently present. |
| Native Weil divisors and orders | `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Basic.lean:46`; `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Principal.lean:126` | Finitely supported codimension-one coefficients; the order system needs an integral noetherian scheme. |
| Divisor sheaf and equivalence | `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Sheaf.lean:75`, line 82, line 250 and line 642 | Integral, locally noetherian and codimension-one DVR hypotheses; linear equivalence transports the actual sheaves. |
| Native adic condition and restriction | `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Adic.lean:206`, line 231 | Sheafiness and local affinoidness; no toric origin or properness is included. |

## Computed adversarial mathematics pass

Here r=|ϖ| with 0<r<1. Rows concern the actual statements and APIs, including unchanged statements using the repaired objects. “Retain” means that the instance agrees with the hypotheses and conclusion, or is excluded by the stated hypothesis. Boundary computations remain prose; they have no added Lean counterparts.

| Statement | Instances tried | Computed values on the relevant sides | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: finite, nonempty salient fan | Rank 0; rank 1 zero cone; empty fan; full line as a cone | Rank-zero realization Spec k; rank-one zero cone gives k[t,t⁻¹]; empty realization ∅; full line contains 1 and −1 | Last two excluded from nonempty salient targets | Retain |
| Conventions: primitive lattice generator | Positive ray in ℤ | Primitive vector 1 pairs with character 1 to give 1; vector 2 gives 2 | Rescaling changes divisor order | Retain |
| Conventions: divisor and frame signs | ℙ¹, D=D₋ | div(t)=(1,−1); weights (m₊,m₋)=(0,1); frame ratio t⁻¹ | Three signs agree | Retain |
| Conventions: arbitrary coefficient ring | A=k[ε]/ε²; zero ring | ε²=0 with ε≠0 in the first; 1=0 and all coefficient modules 0 in the second | Nilpotents retained | Retain |
| Conventions: p-local denominators | p=2 and p=3 | 1/2∈ℤ[1/2], 1/3∉ℤ[1/2]; 1/3∈ℤ[1/3], 1/2∉ℤ[1/3] | No inversion of other primes | Retain |
| Conventions: pseudouniformizer divisibility | Characteristic p; mixed characteristic with ϖᵖ=p | Quotient 0/ϖᵖ=0; quotient p/ϖᵖ=1; r^(1−ε)<1 for 0<ε<1 | Required integral quotients exist | Retain |
| Conventions: rational threshold | c=1/2 and c=0 | \|t\|≤r^(1/2) iff \|t\|²≤r; c=0 gives \|t\|≤1 | Both directions preserve positive powers; denominator 2>0 | Retain |
| Conventions: sharp | Mixed characteristic p=2; equal characteristic p | (1+1)♯=0 versus 1♯+1♯=2; equal-characteristic sharp sends x to x | Additivity not used across characteristics | Retain |
| Conventions: cohomology coefficients and direction | ℙ¹, p=2, ℓ=3, m=1 | π* goes from untilted H⁰=ℤ/3 to tilted H⁰=ℤ/3 and sends 1 to 1; negative degrees give 0 | Direction and coefficient range agree | Retain |
| Torus and split-orbit hypotheses | Trivial torus; S₃; nonsplit point Spec ℂ/ℝ | Rank-zero torus has one orbit of degree 1; (12)(23)=(123)≠(132)=(23)(12); nonsplit point has degree 2 | Nonabelian S₃ is not a split torus; nonsplit orbit is outside duality contract | Retain |
| §0.1 invariant-divisor coefficients and equality | ℙ¹; zero-cone fan | D₊ has coefficients (1,0), 2D₊ has (2,0); no-ray group is 0 | Multiplicity and injectivity distinguish the objects | Retain |
| §0.1 character order | Character t and t² on ℙ¹ | Orders (1,−1) and (2,−2), equal to primitive-ray pairings | Principal-divisor sign agrees | Retain |
| §0.1 face maps | k[t], zero-cone face | Closed orbit t↦0 has target k; open localization t↦t has target k[t,t⁻¹] | Targets are different | Retain |
| §0.2 global weight inequalities | ℙ¹, D=dD₋, d=0,1,2,−1 | W={0}, {0,1}, {0,1,2}, ∅ respectively; zero-cone W=M | Zero and negative degrees distinguished | Retain |
| §0.2 local Cartier translation | Negative chart of ℙ¹, D=dD₋ | W={u≤d}=d+ℤ≤0 | Local generator weight is +d | Retain |
| §0.2 principal translation | D=D₋ and character t | D+div(t)=D₊; W(D₊)={−1,0}=W(D₋)−1 | Both inclusions compute the same set | Retain |
| §0.2 addition of admissible weights | u=0, w=1 for D=E=D₋ | u+w=1∈W(2D₋)={0,1,2} | Sum lands in the specified target | Retain |
| §0.3 monomial module and coefficient equality | ℙ¹, degrees 0,1,2,−1 | Modules A, A², A³, 0; sections 1 and t have coefficient vectors (1,0) and (0,1) for nonzero A | Actual modules and distinct sections | Retain |
| §0.3 tensor coefficient change | A→B; A=k[ε]/ε²; A=0 | B⊗A A^(d+1)=B^(d+1); S_A(0)=k⊕kε; S_0(D)=0 | No flatness or reducedness used | Retain |
| §0.3 multiplication, unit and associativity | Monomials 2χ⁰, 3χ¹, 5χ⁰ | First product 6χ¹; both bracketings give 30χ¹; χ⁰ times χ¹ gives χ¹ | Convolution, not pointwise support product | Retain |
| §0.3 multiplication need not be an isomorphism | D=E=D₋ on ℙ¹ over a field | Source dimension 2·2=4, target dimension 3 | No isomorphism asserted | Retain |
| §0.4 invariant representative | x² on A¹; t on G_m; t−a on ℙ¹, a≠0 | Orders 2; divisor 0 on G_m; divisor [a]−D₋ on ℙ¹ | Multiplicity 2 survives; [a] has class 1 | Retain |
| §0.5 integral bundle and cocycle | ℙ¹, d=1; trivial divisor | Frames 1,t with transition t⁻¹; reverse transition t; product 1; D=0 transition 1 | Cocycles and sign agree | Retain |
| §0.5 integral frame independence | Unit u with u and u⁻¹ integral; scalar ϖ | \|u\|≤1 and \|u\|⁻¹≤1 force \|u\|=1; \|ϖf\|=r\|f\| | Only integral frame changes fix radius | Retain |
| §0.6 class presentation and principal iff | ℙ¹ | u↦(u,−u), (a,b)↦a+b; sum zero iff (a,b)=(a,−a) | Both directions of exactness | Retain |
| §0.6 incomplete-fan kernel and torsion | Zero-cone rank-one fan; separate rays (1,0),(1,2) | Kernel ℤ for ℤ→0; matrix determinant 2 and cokernel ℤ/2 | Completeness cannot be dropped from free-quotient claim | Retain |
| §0.6 powered nonzero class | ℙ¹, class d≥1, p=2 or 3 | Powered degree 2ᴺd or 3ᴺd, both >0; rank-zero Pic=0 | No killed positive class; rank-zero hypersurface excluded | Retain |
| §1.1 chart and plus ring | Positive ray, zero cone, complete ℙ¹ | Algebras K⟨t⟩, K⟨t,t⁻¹⟩; overlap \|t\|=1; two discs cover ℙ¹ | Disc and unit torus differ | Retain |
| §1.1 multiplicative Gauss norm | (1+ϖt)(1−ϖt); t; ϖ⁻¹ | Product 1−ϖ²t² has norm 1=1·1; ‖t‖=1; ‖ϖ⁻¹‖=r⁻¹>1 | Plus ring excludes the last scalar | Retain |
| §1.1 coefficient extension | K→L isometric, singleton aχᵘ | Extended coefficient still a with norm \|a\| on both charts | Named chart and coefficient agree | Retain |
| §1.2 open comparison | t=ϖ⁻¹ on A¹; ℙ¹ | Norm r⁻¹>1 excludes the unit disc; reciprocal norm r<1 lies in the second ℙ¹ chart | Completeness supplies equality; incomplete fan need not | Retain |
| §1.2 complete nonprojective fixture | FS25's ten maximal cones and three primitive relations | Determinants 1,−1,1,1,−1,−1,1,−1,1,−1; summing the three strict ample inequalities gives 0>0 | Regular complete fixture has no ample divisor | Retain |
| §1.3 powers, identity and composition | q=1,2,3; monomial t | Outputs t,t²,t³; φ₂∘φ₃ gives t⁶=φ₆(t); q=0 would give t↦1 | Positive-q statement and excluded boundary | Retain |
| §1.3 coefficient-linear Frobenius | p=2, a∈𝔽₄ with a²=a+1 | Coefficient-linear image a, absolute-Frobenius image a+1 | Twist and coefficient actions separated | Retain |
| §1.3 divisor pullback and strata | ℙ¹, q=2 | t² has orders (2,−2); zero and infinity map to themselves; φ₂*D₋=2D₋ | Same convention as Layer 0 | Retain |
| §2.1 perfected chart | Positive ray; zero cone; rank zero | Exponents ℤ[1/p]≥0; ℤ[1/p]; {0}, respectively | Inverses occur only in the torus chart | Retain |
| §2.1 projection compatibility | χᵘ at levels n,n+1 | φ* then prₙ₊₁* gives χ^(pu/p^(n+1))=χ^(u/pⁿ) | Correct exponent direction | Retain |
| §2.2 perfected weights and sections | ℙ¹, D=D₋; complete fan D=0 | Weights ℤ[1/p]∩[0,1]; degree-zero module K | Infinite index is not unrestricted support | Retain |
| §2.2 c₀ condition and norm | Coefficients 1; coefficients ϖⁿ at 1/pⁿ | Constant family has infinitely many coefficients ≥1; decaying family has tail norm r^(N+1) | First excluded, second converges | Retain |
| §2.2 dense span and complete target | Truncations of Σϖⁿχ^(1/pⁿ) | Tail norms r^(N+1)→0; limiting support infinite | Incomplete finite-support target cannot contain the limit | Retain |
| §2.2 coefficient, convolution and bound | χ⁰, χ¹ as sections of O(D₋); zero input | Product χ¹ in O(2D₋), norm 1=1·1; zero product has all coefficients and norm 0 | Summability and bounds include the zero case | Retain |
| §2.2 divisor-denominator clearing | p=2, D=(1/4)D₋ and weight 0 | After one power divisor (1/2)D₋; after two powers D₋ | Divisor and weight denominators both matter | Retain |
| §2.3 cone, grading and negative degrees | ℙ¹ D=D₋; complete fan D=0; ray D=0 | Q={0≤u≤j}; Q={0}×ℤ[1/p]; ray's j=0 fibre ℤ[1/p]≥0 | Negative degrees retained and degree-zero claim needs completeness | Retain |
| §2.3 cone addition and p-division | (0,1),(1,1) for D=D₋ | Sum (1,2) satisfies 0≤1≤2; p-division gives (1/p,2/p) | Monoid and grading laws agree | Retain |
| §2.3 principal-divisor reindexing | D′=D₊, D=D₋, m=1 | (u,j)↦(u−j,j), taking 0≤u≤j to −j≤u−j≤0; inverse adds j | Isomorphism in both directions | Retain |
| §2.4 Gauss algebra and tilt | ℙ¹ D=D₋; D=0 | (u,j)↦(u,j−u) gives positive quadrant; D=0 gives perfected Laurent z with degree-zero K | Same monomials over K and K♭ | Retain |
| §2.4 completed grading | Coefficient 1 in every integer degree; one degree-j singleton | Infinite family has infinitely many norm-1 entries and is excluded; singleton has exactly one | Completion is c₀, not a product | Retain |
| §2.4 repaired convolution coefficient and norm | D=0; f=2χ^(0,1), g=3χ^(0,−1) | (f*g)_(0,0)=6, other coefficients 0; ‖f*g‖=\|6\|=\|2\|\|3\|; pointwise product 0 | All surviving claims distinguish convolution | Consolidate F02 |
| §2.4 convolution convergence | f_(0,n)=ϖⁿ, g_(0,−n)=ϖⁿ, n≥1 | Output coefficient at 0 is Σϖ^(2n)=ϖ²/(1−ϖ²), norm r²; denominator has norm 1 | c₀ summation converges even with infinitely many contributing pairs | Consolidate F02 |
| §3.1 toric tilt | Ray; torus; characteristic-p point | t remains noninvertible on the ray; t·t⁻¹=1 on torus; rank-zero chart tilts to itself in characteristic p | Charts and plus rings match | Retain |
| §3.2 completed colimit and density | Disc tower; rank zero | t at level n gives t^(1/pⁿ); every finite exponent denominator appears at some stage; rank-zero limit has one point | No coefficient-one infinite sum is added | Retain |
| §3.2 integral lattice detection | χᵘ coefficient ϖ^a; k-th lattice with k=0,1,2 | Originating and target coefficient norms both r^a; membership iff a≥k | Isometric embeddings detect divisibility | Retain |
| §3.3 inverse-limit homeomorphism | Tilted coordinates x=0,1,∞ and general x | Constant towers 0,1,∞; ((x^(1/p^(n+1)))♯)^p=(x^(1/pⁿ))♯ | Boundary and transition directions agree | Retain |
| §3.4 projective sharp projection | [1:x], scalar λ≠0 | [λ♯:λ♯x♯]=[1:x♯]; 0♯=0, 1♯=1 | Multiplicativity fixes projective scaling | Retain |
| §3.4 nonadditive projection control | p=2, [1:1:0] | Tilted coordinate sum 0, untilted coordinate sum 2; equal-characteristic sum remains 0 | No additive cross-characteristic map inferred | Retain |
| §3.4 field naturality and strata | Isometric K→L; coordinate x; zero and infinity | Image of x♯ equals sharp of image x; boundary coordinates remain 0 and ∞ | Square and stratum preimages agree | Retain |
| §3.5 fibred étale-topos limit | Algebraically closed rank-zero chart; inseparable torus root | Rank-r finite étale algebra K^r corresponds to (K♭)^r, including r=0; pth-root extension has separable degree 1 | Correct site, not pointwise category limit | Retain |
| §3.6 open restriction and direction | U=∅, whole space, \|t−ϖ\|≤r² | Preimages ∅, whole space; t=ϖ satisfies 0≤r² but φₚ(t) has distance r>r² | Restriction uses φₚ⁻ⁿ(U), without stability hypothesis | Retain |
| §3.6 complement of infinity | ℙ¹ minus ∞ | φₚ⁻¹(∞)={∞}, so every finite tower coordinate remains finite | Restricted topos arrow still tilted→untilted | Retain |
| §3.7 full affine line | x=ϖ⁻¹,0,1,∞ | Norm r⁻¹>1 point retained; constant 0,1 towers retained; constant ∞ tower deleted | Full line rather than disc | Retain |
| §4.1 power-map automorphism | ℙ¹, p=2, Λ=ℤ/3; rank-zero point | Groups (Λ,0,Λ(−1)); maps (1,unique zero-group map,2); rank-zero H⁰ map 1 | Automorphism need not be identity | Retain |
| §4.1 excluded coefficients | Mixed characteristic p=2, Λ=ℤ/2 | Top map 2 mod 2=0 on a nonzero group | ℓ=p excluded | Retain |
| §4.2 cohomology and colimit | ℙ¹, p=2, Λ=ℤ/3 | Top transition 1→2→1→2; colimit ℤ/3, not quotient by 2−1 | Level-zero comparison remains an isomorphism | Retain |
| §4.2 cup and field coherence | Unit and hyperplane class α | 1∪α=α on both sides; σ(α)=α in twisted degree 2 | Cup and field pullback conventions agree | Retain |
| §5.1 cofinal section domains | f=t, c=1; f=t² with threshold 2 | \|t\|≤r; \|t²\|≤r² iff \|t\|≤r; unchanged threshold 1 gives \|t\|≤r^(1/2) | Multiplicity scales threshold | Retain |
| §5.1 scaling and empty family | f→ϖf; unit times f; no equations | New inequality \|f\|≤r^(c−1); unit factor 1; empty intersection is whole space | Model and normalization are necessary | Retain |
| §5.1 higher-rank continuity input | Nonzero f(x) and powers of ϖ at an analytic point | Continuity gives an integer n with \|ϖ(x)\|ⁿ<\|f(x)\|; f(x)=0 satisfies every powered bound | Intersection of all tubes is exactly the zero locus | Retain |
| §5.2 quantitative approximation | Exact monomial f=χᵘ, g=χᵘ | Error 0; both truncated maxima max(\|χᵘ\|,rᶜ) | Same section-domain bounds | Retain |
| §5.2 nonzero refinement | p=2, f=ϖ²χᵘ, ε=1/2 | Coarse c=0 allows g=0 since r²≤r^(1/2); c′>2 would demand r²≤r^(5/2), false | Refined threshold excludes zero | Retain |
| §5.2 dense perturbation | Selected coefficient b≠0 with \|b′−b\|<\|b\| | \|b′\|=\|b\|>0; perturbation below rᶜ preserves max with rᶜ | Nonzero equation and tube survive | Retain |
| §5.2 denominator clearing | g₀=a+b t^(1/p), b≠0; p=2 and p=3 | g₀²=a²+b²t, or g₀³=a³+b³t; section classes 2D₋ or 3D₋ | Coefficients stay in k₀; not a global scalar function | Retain |
| §5.3 hypersurface output | Line in ℙ²; doubled line; rank-zero fan | Output class pᴺ, or 2pᴺ, both nonzero; rank-zero nonzero scalar has empty zeros | Nonempty proper output; rank-zero hypothesis has no input | Retain |
| §5.3 nonprojective case | FS25 ray divisor D₄, using maximal cone 123 to split the character map | Class (1,0,0,0) in the remaining four ray coordinates becomes (pᴺ,0,0,0)≠0; three ample inequalities sum to 0>0 | Torsion-free class argument does not require ampleness | Retain |
| §6.1 balancing definition and equality | ℙ¹ and ℙ¹×ℙ¹ | [1,−1](1,1)=0; surface rows send (1,0,1,0) to (0,0) and (1,0,0,0) to (1,0) | Positive and negative controls | Retain |
| §6.1 wall coefficient sign | ℙ¹, D=D₋, both adjacent-cone orders | m₋−m₊=1=1·b₊; reverse difference −1=1·b₋ with b₋=−1 | Degree +1 in both orientations | Retain |
| §6.1 operational evaluation boundary | Split Spec k; Spec ℂ over ℝ | Evaluation multipliers 1 and 2 respectively on ℤ | Split-orbit hypothesis excludes non-unimodular pairing | Retain |
| §6.2 product formula and degree | ℙ¹×ℙ¹ with F,G ruling classes | F²=G²=0, F·G=1; (2F)·(F+G)=2 | Integer formula ad+bc agrees | Retain |
| §6.2 displacement quotient | Rank-two fan, γ a ray | Rank(N/Nγ)=1; using Nγ projects displacement to 0 | Quotient, not subspace, is required | Retain |
| §6.2 lattice multiplicity and empty product | Rays (1,0),(1,2); rank zero | Determinant/index 2; rank-zero empty product degree 1 | Multiplicity not silently 1 | Retain |
| Imported §A2.7 positivity and component sum | Two distinct first-projection fibres on ℙ¹×ℙ¹ | Each H-degree 1; cycle sum degree 1+1=2; empty cycle degree 0 | Nonzero effectiveness required | Adopt F01 owner |
| Imported §A2.7 dimension-zero scope | Rational point; inseparable degree-p point; doubled rational point | Degrees 1, p and 2; p=2,3 give 2,3; no ample factors when d=0 | No perfectness, separability or reduction assumption | Add F01 Check |
| Imported positivity's ample hypothesis | H=O(1,0) on ℙ¹×ℙ¹, V a fibre with class (1,0) | H·V=0, whereas O(1,1)·V=1 | Nonample bundle is excluded | Retain |
| §6.3 proper complete-intersection degree | Two distinct lines in ℙ²; c=0; rank zero | δ=1; δ=deg(Hⁿ); n=0 gives 1 | Correct empty-product and dimension boundaries | Retain |
| §6.3 refined support with excess | s=(ℓ,ℓ) in O(1)⊕O(1) on ℙ² | Z(s)=L, dim 1; excess bundle O(1)\|L has c₁ degree 1; CH₀(∅)=0 | Positive localized degree forces nonempty support | Retain |
| §6.3 powering formula | p=2 or 3, N₁=N₂=1, two line classes | δ′=4 or 9 =p^(1+1)·1 | Same integer over both coefficient fields | Retain |
| §6.3 corrected fibre Check | Union F₁∪F₂ of distinct first-projection fibres | Classes (1,0)+(1,0)=(2,0); H-degree 2; F₁∩F₂=∅; two class-(2,0) inputs would give 4 | Wording now matches computation | Apply F03 |
| §6.4 approximation dimension | Disconnected union of two fibres; distinct versus identical lines in ℙ² | First has c=1, dim 1; distinct lines c=2, dim 0; identical lines codim 1 despite two equations | Hypersurface count must equal codimension | Retain |
| §6.4 excess reduction by ample cuts | Approximate equations share a line L in ℙ²; cut by independent line M | dim L=1; L·M=1; resulting dimension 0=n−c | Cuts preserve nonemptiness and support containment | Retain named contracts |
| §6.4 infinite dense subfield | Hypothetical finite k₀, nontrivial norm, 0<\|ϖ\|=r<1 | Every nonzero element of finite k₀ has norm 1; ball \|x−ϖ\|<r contains neither 0 nor those elements | Finite subfield cannot be dense | Retain |
| §6.4 imperfect-field reduction | k₀=𝔽ₚ(t), xᵖ−t | Field degree p before extension; (x−t^(1/p))ᵖ after extension has length p, reduction length 1 | Algebraic negative control, without claiming this k₀ is dense | Retain |
| §6.4 perfect-field and c=0 controls | Reduced point over perfect field; zero equations | Geometric point remains reduced of length 1; c=0 gives Z₀=X and dim n | Endpoint includes full-variety case | Retain |
| Worked ℙ¹ example across layers | D=D₋ and a+b t^(1/p) | Weights {0,1}, frames 1,t, ratio t⁻¹; perfected weights [0,1]∩ℤ[1/p]; powered equation aᵖ+bᵖt has divisor degree p | All uses share the same sign and bundle | Retain |
| Worked surface example across layers | F₁∪F₂ and H=O(1,1) | Balanced ray vector (1,0,1,0) gives (0,0); total class 2F, degree 2, dimension 1 | Product, positivity and approximation agree | Recompute F01/F03 |
| SCH12 manifest coverage | Theorem 1.13 p. 249; Lemma 1.16 p. 251 | 249∈[249,251] and 251∈[249,251]; 251∉[249,250] | Corrected interval covers both | Apply F04 |

The zero-input convolution cases avoid dividing by a zero norm. For nonzero c₀ factors with bounds M,N>0, a product coefficient of norm at least η requires input norms at least η/N and η/M; each set is finite, so the product family is summable. Thus the consolidated F02 wording has the same generality as the original construction. No altered statement needs regularity, perfectness, separability or projectivity beyond its stated hypotheses.

## Maintainer consequences

All four findings are applied; none is disputed or requires an external decision. The supplier change is SchemeAndStackFoundations' redundant positivity request → AbelianSchemesAndArithmeticModuli §A2.7. SchemeAndStackFoundations' other contracts and all seven remaining gaps are unchanged. No headline, declaration name or downstream consumer interface changed. The independent review remains the next acceptance step. No commit, push, issue, pull-request edit or merge-order change was made.
