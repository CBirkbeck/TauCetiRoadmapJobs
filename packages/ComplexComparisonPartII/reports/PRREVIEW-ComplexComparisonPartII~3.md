# Review of ComplexComparisonPartII (pull request #848 at 7380744)

**Verdict:** needs changes

## R01 (P2) — Remove the upward GlobalHolomorphicFunctions supply

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:519`: “GlobalHolomorphicFunctions, preparatory Cauchy–Green and GH0.” Also lines 135, 1261 and 1657.

**Claim:** The Cauchy–Green/Runge foundation may be consumed here from GlobalHolomorphicFunctions.

**Witness:** The dependency check reports `ComplexComparisonPartII (#39) -> GlobalHolomorphicFunctions (#207)`. This is a new open roadmap, absent from main. Its README:191 and :562 actually construct the operator and finite-rank approximation being consumed.

**Repair:** Give these prerequisites one earlier owner. Move the required general Cauchy–Green/Runge foundation into this roadmap or another eligible earlier supplier, and coordinate removal of its duplicate ownership in GlobalHolomorphicFunctions. Update every affected contract and Needs line. The test instance is the scalar operator with kernel `1/(π(z−w))`, not merely its parameterized application: both the kernel and its uniform approximation estimate must have an eligible owner. Re-run the dependency check. The statement at README:162–163 that stage ordering need not impose whole-roadmap merge ordering must be replaced by the standing single-direction supply rule.

## R02 (P2) — Remove the upward SmoothBundlesConnections supply

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:567`: “B1.5 supplies the native smooth proper-submersion trivializations to C5.2.” Lines 568–571 also consume B2 and B6.1–B6.4.

**Claim:** The Ehresmann and integral Chern-class inputs are available from this supplier.

**Witness:** The check reports `ComplexComparisonPartII (#39) -> SmoothBundlesConnections (#220)`. The supplier is absent from main; its open README has these constructions. The dependencies occur at README:1369, :2733 and :3336, not just in a downstream-consumer list.

**Repair:** Move the exact smooth prerequisites to an eligible earlier owner and have SmoothBundlesConnections consume that owner; retain the full proper-submersion theorem and integral coefficient comparison. Merely describing a prefix of the later roadmap does not fix the edge. Retest the product family `P¹ × S → S` (trivializations induce identity on degree-zero and degree-two fibre cohomology) and `O(1)` on `P¹` (integral Chern number 1). Keep the same orientation and exponential-sequence normalization after the move.

## R03 (P2) — Remove the upward topological support foundation

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:4084`: “use TopologicalSheafCohomology TS3.1–TS3.3's native topological `j_!`”. The explicit Needs line is at :4106.

**Claim:** C6.1 can build its compact-support and lower-shriek comparisons on this later foundation.

**Witness:** The check reports `ComplexComparisonPartII (#39) -> TopologicalSheafCohomology (#308)` and refuses relocation past that supplier because FormalConnectionsOpers (#40) already consumes this roadmap. TopologicalSheafCohomology is absent from main.

**Repair:** Move the general topological extension-by-zero, c-soft compact-support and required comparison foundation to an eligible earlier owner, with the later roadmap importing it. Do not replace it by an arbitrary functor with the desired properties. Verify the moved contract on `(0,1) ↪ ℝ`: endpoint stalks are 0, compactly supported degree-one cohomology of the constant coefficients is Λ, and the interval boundary is `[1]−[0]`. The dependency output must then contain no genuine upward edge for this roadmap.

## R04 (P2) — Complete the principal-parts ownership move

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:2394`: “FormalConnectionsOpers F2.2 consumes this predicate, the principal parts and their universal property from here rather than defining them again.” See also :139.

**Claim:** The characteristic-free algebraic construction has one owner, here.

**Witness:** `TauCetiRoadmap/FormalConnectionsOpers/README.md:179–207` still constructs the commutator predicate, all-order quotient, jet, universal bijection, composition and localization. Lines 191–195 explicitly name the predicate, relation module, quotient and jet.

**Repair:** Coordinate the ownership move: retain the characteristic-free algebraic leaf here, as required by supply order, and replace the duplicate construction in FormalConnectionsOpers by an import of this leaf. Its symbols, Atiyah sequence and projective Lie–Rinehart PBW can remain there. The two descriptions currently give the same object, not different variants: for `A=k[z]`, both give `P^m=A[t]/(t^(m+1))`, jet `f(z+t)`, and composition parameter `t₁+t₂`. In characteristics 2 and 3 both must retain the Hasse operator sending `z^p` to 1 while the p-fold ordinary derivative is 0. A unilateral assertion that the other file imports the construction does not complete the move. No edit to the sibling is made by this review.

## R05 (P3) — Use a layer label accepted by the gate

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:694`: “Layer C−1: Analytic local foundations”.

**Claim:** This is a valid numbered layer heading.

**Witness:** The supplied gate records `layer-ids=1`; all other text-form counts except dependency checking are zero. The offending identifier contains the Unicode minus sign.

**Repair:** Rename the layer using an accepted identifier, for example `Cminus1`, and update its subsection headings, internal references and Lean documentation consistently. Preserve the ordering before C0. Re-run the gate; the test is `layer-ids=0`, with all references still resolving to the same analytic-foundation layer.

## R06 (P3) — Remove nonexistent API and Check declaration names

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:1575`: “`AnalyticTwist.chartTransition`”; :1584–1585 also names `AnalyticTwist.zero` and `AnalyticTwist.degreeOneSections` as Checks. The pattern recurs throughout the README.

**Claim:** These API and Check labels identify Lean declarations supplied by this roadmap.

**Witness:** `TauCetiRoadmap/ComplexComparisonPartII/Suggested.lean:55`, :66 and :81 contain its only three declarations: Montel, Schwartz and sheaf/singular comparison. There is no `AnalyticTwist` declaration or named Check.

**Repair:** Express the API and Checks as prose, retaining their hypotheses and computed values; do not enlarge Suggested.lean with API padding. For example, keep the transition factor and the computation `dim H⁰(P¹,O(1))=2`, contrasting `O(−1)` with dimension 0 and `O` with dimension 1, without claiming Lean counterparts. Apply the same conversion to the other absent API/Check names. The gate's zero `readme-ids-missing` count does not establish compliance with this explicit acceptance-test rule.

## Verified sound

The review is confined to the two requested files at the stated head. The worktree remains unchanged, and the diff outside this roadmap folder is empty. There is no previous review to reconcile. I read the normative README and CONTRIBUTING, the target files, the supplied gate/signatures/citation leads, and main-roadmap examples including ComplexKahlerGeometry, AlgebraicTopology and EtaleCohomologyFoundations. No copied source passage, executable algorithm, `set_option`, admitted data definition, admitted example or imported sibling roadmap was found. The ownership/order defects above are repairable; they do not justify rejecting the entire scope.

**Build and signature evidence.** `lake env lean` on Suggested.lean succeeds with precisely three `sorry` warnings. A scratch copy with `#check @` for each of its three declarations confirms all intended binders survive: finite-dimensional complex domain for Montel; completeness, Hausdorffness, metrizability, local convexity and the real/complex scalar tower for Schwartz; the actual native local-contractibility predicate and arbitrary abelian coefficients for sheaf/singular comparison. The signature comparison required no change. Nine scratch probes—`simp`, `rfl` and `infer_instance` on each of the three statements—all failed to discharge the targets. Reading the nearest pinned theorems also rules out the apparent one-lemma duplicates: native Montel has one complex domain variable, and the compact-perturbation theorem assumes Banach/Fredholm data. No padding finding is made against these three statements.

**Headlines and statability.** The README's headline list is at lines 45–53. Its groups are:

- Cminus1/C0: holomorphic and analytic spaces; scheme/space analytification; completed stalks; SNC charts; coherent modules/ideals/operations; bundle dictionary; coherent analytification, exchange, fibre loci and étale descent.
- C1/C2: Dolbeault and weighted estimates; Cartan A/B; Schwartz and Cartan–Serre finiteness; twists, their cohomology and analytic Serre theorems; projective/proper scheme/space GAGA; base change and geometric dictionaries.
- C3: quasi-coherator, pseudo-coherence detection, intrinsic derived limits, proper-support existence, coherent/Picard algebraicity, identity components, formal parameters and derived GAGA.
- C4: proper analytic images, Remmert–Stein, nonreduced Chow, proper-support and morphism algebraization, affine-curve connectedness.
- C5: algebraic de Rham, holomorphic Poincaré, sheaf/singular and proper/relative/Artin-base comparisons, Gauss–Manin, Hodge decomposition/structures/bundles, cycle integration/Chern comparison, log structures/chart criterion, Riemann–Hilbert, regular-singular and proper logarithmic comparison.
- C6: stratified topology, coefficient comparison, Riemann existence, ordinary/compact/relative/smooth-trace and integral/rational Artin comparison.

Montel is also explicitly a deep input at C1.6. The three statable targets above occur in Suggested.lean. Its module docstring names the remaining groups and their missing analytic, geometric-cohomology, algebraic-space/moduli, log, or constructible/adic carriers. A bare locally ringed space, arbitrary comparison map or abstract Hodge structure would not state those geometric headlines. I found no additional headline that can be stated at these pins with only a few simple native definitions, and no substitute theorem about unrelated free variables.

**Seeded source verification.** There are no README locators explicitly marked unverified. All 15 seeded targets were examined. “Partial” below distinguishes a verified portion from a source that could not be read; it does not certify the unread portion. Source IDs identify service-fetched texts, not files added to the repository. Page numbers are printed pages unless a version is specified.

| Sample target | Text and locator inspected | Result and scope |
| --- | --- | --- |
| IsDifferentialOperator | ega4 lines 1392–1433, 1452–1456, 1489–1559; IV₄ 16.8.1–16.8.4, 16.8.8–16.8.9, pp. 40–44 | Universal principal parts, commutators and composition support the stated characteristic-free scope. Finite-presentation caveat for localized Hom is retained. R04 is ownership, not a counterexample to this mathematics. |
| holomorphicConnectionDictionary | deligne1970 lines 236–278, 282–399, 422–445; I.2.3–2.15, pp. 6–11; I.2.17–2.19, pp. 12–13 | Leibniz, tensor/Hom/dual, horizontal maps, curvature and flat correspondence agree. The carrier adapter is the roadmap's construction; the source does not mention the Lean carriers. |
| artinDeRhamBetti | deligne1968 lines 678–704; Lemma 5.5.3 and equation 5.5.4, p. 124 | Finite-dimensional local complex Artin algebra, relative differential resolution and length formula are present. The nilpotent filtration argument retains A, rather than reducing coefficients to ℂ. |
| CurrentCalculus | demailly lines 560–640; I.2.1–2.7, pp. 13–15; lines 6463–6485, 6611–6618, 6756–6793 for positivity/mass | Degree convention and transpose sign agree. Demailly's metric-form convention contributes a factor 2; with the README's `ω=(i/2)Σh dz∧dz̄`, the mass normalization is `T∧ω^p/p!`. |
| realComplexCurrentComparison | Same Demailly passages; main GeometricCurrents G1 and ComplexKahlerGeometry K5a | The source supplies current/positivity conventions; the real-linear fixed-point and density-bundle adapter is explicitly constructed here. Direct evaluation checks its sign and complex linearity below. |
| analyticSetLocalFiniteMass | demailly lines 6988–7030; III.2.5–2.7, p. 140 | Local finite mass of a pure-dimensional analytic set is supported. The compact-cover globalization and metric inequalities are elementary consequences explicitly owned here. No compactness of the whole analytic set is inferred. |
| Analytic cotangent and logarithmic differentials | freitag I.2, I.6 and II.2 (quotient charts, including lines 1827–1831); deligne1970 I.2.10–2.15; Kato §§1.7–1.9 requested | Partial: analytic chart and exterior-calculus inputs inspected; Kato's legal copy is image-only and its cited text was not certified. The analytic-chain-rule quotient is an explicit extension, not an assertion that algebraic derivations of convergent germs are automatically analytic. |
| complexAlgebraicTopology | Main AffineMorseLefschetz A4.1, README:353–368; SGA 1 XII local topology; Hironaka pp. 165–185 and BCR 9.2.1 requested | Partial: the compact compatible-triangulation supplier exists and is stronger than a closed-family-only theorem. The Hironaka/BCR source theorem was not read; the noncompact/open-simplex construction is tested below. |
| topologicalCoefficientComparison | sella lines 45–47 and 69–77, theorem and Lemma 0.1, pp. 2–4; native coefficient definitions; Dimca §§2.1–2.5, 3.2, 4.1 requested | Partial: arbitrary abelian constant coefficients and the small-cochain resolution are supported. Full constructible/support assertions are not certified from unread Dimca. Hatcher §3.H was fetched, but its extraction did not permit a reliable locator check. R03 concerns supply order. |
| riemannExistence | sga1 lines 9872–9908; XII Theorem 5.1, retyped pp. 251–252, original pp. 333–334 | The theorem is for locally finite-type complex schemes, with no separatedness or reducedness requirement. The affine-local proof explicitly reduces nilpotents and descends from normalization. Finite type in this roadmap is within that scope. |
| artinComparison | milne lines 5007–5011, 5094–5095, 5142–5183; 21.1, 21.5, 21.7, 21.8, pp. 130–134 | Smooth/lisse induction verified; the positive-dimension restriction repairs the source's dimension-zero omission. The full bounded constructible and nonseparated extension cites SGA 4 XVI §4, which remains uncertified. |
| artinComparisonCompactSupport | SGA 4 XVII §§3–5; SGA 4½ Finitude §§1–2; finite comparison on a compactification | Source text uncertified. Checked the supplied localization/compactification contracts and the compact-support, torsion and conjugation instances below. |
| relativeArtinComparison | SGA 4 XII, XVI §4, XVII §§3–5; main EtaleCohomologyFoundations F.2–F.3 | Source text uncertified. The stated proper/lower-shriek exchanges have the correct direction; affine-base gluing does not assume a nonseparated base is globally Hausdorff. |
| artinSmoothTrace | SGA 4 XVIII 2.8–2.10 and 3.2.5; main EtaleCohomologyFoundations README:1159 | Source text uncertified. The supplier states separated smooth pure-dimensional trace with invertible finite coefficients and degree-one normalization. Explicit identity, affine-line and disconnected-fibre computations agree. |
| adicArtinComparison | bhatt_scholze lines 2294–2339, 2581–2697, 2757–2785; §§6.5, 6.7–6.8, arXiv v2 pp. 49–59 | Derived-complete realization, reduction, finite-Tor requirements and rational coefficients are supported. Topological realization/comparison is the new construction here, not a theorem attributed wholesale to Bhatt–Scholze. The roadmap retains derived limits and uniform bounds. |

The other two Lean headlines have direct source support: multivariable Montel at demailly lines 978–986 (I.3.12, p. 23), and Schwartz at lines 19798–19827 (IX.1.8, pp. 406–407), including the closed-image input from IX.1.7. The source's quasi-epimorphism formulation allows the roadmap's surjection without a finite-kernel assumption.

**Computed adversarial pass: 143 rows.** Each row records an actual calculation or explicit model comparison, rather than inferring truth from a `sorry` build. The “change” column refers to requested changes; none were made to the PR. A successful instance is evidence against the specified wrong model, not a proof of the general theorem. Inapplicable tests (for example residue characteristics for a fixed complex manifold) are replaced by relevant rank, coefficient, nilpotent, support and nonseparated tests.

| Statement/interface | Instances tried | Values on the two sides; wrong-model control | Result; change |
| --- | --- | --- | --- |
| HolomorphicStructureSheaf; convergent local algebra | Point; germ at 0 of ℂ | Point sections/stalk = ℂ; germ z has value 0 but is nonzero; evaluation alone loses z | Pass; R06 names only |
| ComplexAnalyticSpace | Dual point; doubled origin; empty space | ℂ{ε}/ε² has basis 1,ε and length 2; reduction has length 1. Doubled origins have intersecting neighbourhoods and are not Hausdorff; empty model has no points | Pass |
| complexSchemeAnalytification | Spec ℂ[ε]/ε²; principal open z≠0 | Analytic ring ℂ{ε}/ε², ε≠0; z is invertible exactly on ℂ* on both descriptions | Pass |
| analyticRelationLocalChart | Identity étale relation; doubled-origin gluing | Local relation inside each chart is the diagonal; quotient restriction is the identity. Two distinct origins remain globally distinct | Pass |
| completedAnalyticStalkComparison | Node xy=0; dual point | Both node completions = ℂ[[x,y]]/(xy), tangent dimension 2; both dual-point completions have length 2 | Pass |
| SpaceAnalytification; complexSpaceAnalytification | Scheme atlas; identity relation | Quotient of U by its identity relation = U; pulled-back relation = diagonal, including nilpotent sheaf | Pass |
| analytification_descent | Same atlas twice; refinement by two opens | Identity comparison composed with itself = identity; overlap ring restrictions agree in either composite | Pass |
| complex_local_comparison | Smooth line origin; node versus line | Line germ = ℂ{z}, completion = ℂ[[z]]; node tangent dimension 2 versus line 1, so neither germ nor common étale neighbourhood identifies them | Pass |
| analyticPolydisc | Empty boundary; coordinate crossing | b=0 gives Δⁿ; b=2 gives complement (Δ*)²×Δ^(n−2); n=0 gives a point | Pass |
| sncPolydiscChart; snc_exists_polydiscChart | Triangular coordinates (u,v)=(x+y²,y) | Inverse (u−v²,v); both composites are identity. Swapping two boundary labels swaps the two punctured coordinates | Pass |
| CoherentAnalyticModule | O/(z²); zero module | Length 2 and presentation O→O by z²; zero module has rank/length 0. Replacing by reduced support gives length 1 | Pass |
| coherentOperations | Multiplication by z on O/(z²) | Kernel=(z)/(z²)≅ℂ, cokernel≅ℂ; ranks/lengths 1 and 1, not a field-like injective map | Pass |
| CoherentAnalyticIdeal | (z²) versus (z) | Quotient lengths 2 versus 1; same point support, different ideal and space | Pass |
| holomorphicBundleDictionary | Rank 0; ranks 1 and 2 on two components | Section sheaf ranks (1,2); exterior square ranks (0,1); rank-zero determinant = O | Pass |
| CoherentAnalytification | Polynomial line and nilpotent quotient | z² maps to analytic z², not z; quotient retains ε. Entire exp(z) is not in ℂ[z] | Pass |
| coherentAnalytification_faithful | Multiplication by ε on dual point | Algebraic and analytic maps are both nonzero although their reduction is zero | Pass |
| coherentPullbackOperations | Invertible E; zero module | E⊗E∨=O on both sides; Hom(0,F)=0; double dual of locally free E recovers E | Pass |
| HigherImageComparison | Identity map; P¹ with O(−2) | R⁰id_*F=F and higher=0; R¹ΓO(−2)=ℂ algebraically and analytically | Pass |
| analyticSetGeometry | xy=0; doubled point | Node has two 1-dimensional branches, singular locus {0}; doubled point's reduced analytic set has dimension 0 | Pass |
| fibreDimensionLoci | zw:A²→A¹; blow-up A² at 0 | zw fibres all dimension 1; blow-up fibres dimension 0 off 0 and 1 over 0, so dimension≥1 locus={0} | Pass |
| analyticEtaleDescent | Identity cover; disjoint union of two copies | Descent datum is identity in the first case; equal-pair datum in the second recovers exactly one module | Pass |
| SpaceCoherentAnalytification | Scheme considered as space; zero object | Same analytic module under both presentations; zero goes to zero | Pass |
| localDolbeault | Constant function; local coordinate | ∂̄1=0 and ∂̄z=0; ∂̄z̄=dz̄≠0, excluding all smooth functions from the kernel | Pass; R01 supply |
| Hodge-operator normalization | Fourier mode e^(ikx) on a circle | d* d eigenvalue k²≥0; div grad eigenvalue −k². Constant mode gives 0 on both with opposite Laplacian conventions | Pass |
| Chern connection/curvature | Trivial holomorphic line with h=e^(−abs(z)²) | A=−z̄ dz; curvature dz∧dz̄; iΘ/(2π) is nonzero but exact, with cohomology class 0 | Pass |
| weightedDolbeaultEstimate | Scalar curvature eigenvalue 2; zero curvature | Inverse curvature weight is 1/2; eigenvalue 0 has no positive inverse estimate and is excluded by positive-definiteness | Pass; R02 supply |
| StronglyOneComplete | ℂ with abs(z)²; compact P¹ | Exhaustion on ℂ has positive Levi form; a globally strictly psh function cannot attain its maximum on compact positive-dimensional P¹ | Pass |
| StronglyOneComplete.completeKaehlerMetric | ℂ with Euclidean potential | Induced metric is complete; deleting 0 while keeping the Euclidean metric gives finite distance to the puncture and fails completeness | Pass |
| cartanTheoremB | Dual point; O on ℂ; O(−2) on P¹ | Higher cohomology =0 on the first two; H¹(P¹,O(−2))=ℂ, so the Stein/1-complete domain matters | Pass |
| cartanTheoremA | Dual point; rank-zero sheaf | Section 1 generates ℂ[ε]/ε² as its own module, retaining ε; zero needs zero generators | Pass |
| montelTheorem | f_n(z)=z₁^n on a unit polydisc; empty Ω; n=0-dimensional domain | On abs(z₁)≤r<1, sup≤r^n→0; empty Ω imposes no convergence constraints; a point reduces to bounded scalar subsequences. f_n(z)=nz is unbounded on a compact containing z=1 | Pass; no padding |
| frechetOpenMapping | Shift on ℂ^ℕ; c₀₀ with ℓ¹→ℓ² norms | Shift maps basic cylinders to basic cylinders. Vectors with m entries 1/m have ℓ¹ norm 1 and ℓ² norm m^(−1/2), so the incomplete inverse is not continuous | Pass |
| schwartzFiniteness | ℂ, g=id,h=−id; ℂ^ℕ→ℂ coordinate projection,h=0; zero spaces | First range=0, closed, cokernel dimension 1. Second range=ℂ, codimension 0, kernel infinite-dimensional. Zero case codimension 0 | Pass; no finite-kernel assumption |
| cartanSerreFiniteness | P¹,O and O(−2); compact doubled P¹ glued over ℂ | Hausdorff examples have (h⁰,h¹)=(1,0),(0,1). Non-Hausdorff gluing has H¹(O)=O(ℂ)/ℂ, infinite-dimensional | Pass |
| projectiveLerayCover | P¹; repeated chart indices | Two charts are ℂ, intersection ℂ*, repeated chart remains ℂ; all have higher coherent cohomology 0 | Pass |
| AnalyticTwist | P¹, k=1,−1,0 | h⁰=2,0,1 respectively; O(1)⊗O(−1)=O. Reversing the transition factor exchanges the first two | Pass; R06 |
| analyticTwistCohomology | P¹, k=2,−2,−1; P⁰ | P¹ (h⁰,h¹)=(3,0),(0,1),(0,0). On P⁰ every twist has H⁰=ℂ and higher=0 | Pass |
| analyticSerreGeneration | O(−2) on P¹ | Twist k=2 gives O, generated by 1; k=1 gives O(−1), with no generating global section | Pass |
| analyticSerreVanishing | O(−2) on P¹ | H¹ after twist k=0 is ℂ; after k≥1 it is 0 | Pass |
| twistPresentations | O(−2); a point quotient | O(−2) has its one-term free-twist presentation; O(−1)→O→O_point→0 gives the point quotient | Pass |
| projectiveComplexGaga | P¹,O(2); doubled hyperplane | H⁰=ℂ³ on both sides; ideal L² and quotient length 2 transverse to the hyperplane are retained | Pass |
| properSchemeGagaEquivalence/pushforward | Proper dual point; identity | Both coherent categories are finite ℂ[ε]/ε²-modules, with identity morphisms unchanged; identity higher images vanish above 0 | Pass |
| properSpaceComplexGaga | Proper scheme viewed as algebraic space | Same finite-dimensional coherent cohomology; changing the étale presentation does not change the identity exchange | Pass |
| gagaBaseChange | P¹×S, O(−2); arbitrary flat S′→S | R¹f_*O(−2)=O_S; pullback and recomputation both give O_S′ | Pass |
| projectiveGeometricDictionaries | Double hyperplane; O(1) and dual | Ideal L²≠L on both sides; O(1)∨=O(−1), tensor product O | Pass |
| spaceQuasiCoherator | Affine X; empty X; DVR generic-point j_!O | RQ fixes quasi-coherent complexes; empty category=0. j_!O has Γ=0 but generic stalk Frac(A)≠0, so it is not fixed | Pass |
| pseudoCoherenceDetection | X=Spec A; test P=A | RHom(A,M)=M, so finite-free bounded-above detection is exactly the property being detected on this affine test | Pass |
| spaceDerivedLimits | A=k[[t]], tower A/t^n; constant tower; empty X | Intrinsic limit is O_X, with D(t) sections k((t)); ambient ordinary limit has D(t) sections 0. Constant limit=M with identity projections; empty=0 | Pass |
| strongProperSupportExistence | Constant tower; O/(tx−1) on A¹ over k[[t]] | Constant tower returns F₁. tx−1 is a unit modulo every t^n, so all reductions are 0; its nonzero generic support is not proper, excluding it | Pass |
| Strong-existence quasi-separatedness Check | Double Spec(∏ℂ) glued along ⋃D(e_i) | For M=A, A⊕A→∏ℂ is onto. For M=⊕A, diagonal (δ_ij) is not in the image in ∏ᵢ⊕ⱼℂ, so H¹≠0 | Pass |
| cohStack_algebraic | X=B; zero rank; module k on dual numbers | Rank-r component=BGL_r; rank 0 has one automorphism. Ext^n(k,k)=k for all n≥0 over k[ε]/ε², so that module is not perfect | Pass |
| Picard universal-functions comparison | X=B; P¹_B | f_*O=O; relative Picard sheaf is 0 in the first case and locally constant ℤ in the second | Pass |
| relative_picard_algebraicSpace | P¹; elliptic curve | Pic(P¹)=ℤ, Pic⁰=0; Pic⁰ of an elliptic curve with origin is the elliptic curve | Pass |
| Picard obstruction and section splitting | Nonsplit real conic; P¹ with section | Degree-1 geometric class has nonzero order-2 Brauer obstruction on the nonsplit conic; obstruction=0 on P¹ and O(1) represents the class | Pass |
| finite_picard_cartier_torsors | M=0; M=ℤ/n, including characteristic p with n=p | First Hom and torsor sheaves are 0; Cartier dual of ℤ/n is μ_n, and μ_p is retained as a nonreduced finite flat group | Pass |
| picardTorsionComponent | P¹; classical Enriques surface in characteristic≠2 | Pic^τ(P¹)=0; Enriques torsion is ℤ/2 although Pic⁰=0 | Pass |
| picardZeroSheaf | Ordinary Enriques surface in characteristic 2 | Identity component μ₂ has length 2 and one geometric point; reduction has length 1 and is the wrong functor | Pass |
| picardZeroCriterion | Elliptic curve; non-smooth μ₂ component | Elliptic identity component is smooth proper dimension 1; μ₂ has tangent dimension 1 but dimension 0 and fails the smooth-fibre hypothesis | Pass |
| picardParameter_formalEquiv | X=B; elliptic identity class | First relative class functor has one element; its Picard stack still has A× automorphisms. Elliptic completion is k[[t]], with dual-number tangent dimension 1 | Pass |
| derivedGagaProperSpace | Proper point; dual point | A bounded coherent complex has the same modules/differentials analytically; k over dual numbers remains nonperfect on both sides | Pass |
| remmertProperImage | Proper point map; (x,y)↦(x,xy) | Proper image is a closed point; nonproper example has image {x≠0}∪{(0,0)}, not closed | Pass |
| remmertSteinExtension | ℂ* across 0; discrete {1/n} across 0 | First closure=ℂ with larger dimension than the omitted point. Second has accumulating isolated points and is not analytic; strict dimension hypothesis excludes it | Pass |
| projectiveChowNonreduced | Double hyperplane | Analytic and algebraic ideal L² retain multiplicity 2; radical ideal L would give multiplicity 1 | Pass |
| properSupportAlgebraization | Point-supported length-2 sheaf on A¹ | Support is proper and both modules have length 2; O_A¹ has nonproper support and is outside the theorem | Pass |
| properSourceMorphismAlgebraicity | P¹→A¹; dual-point endomorphisms | Maps from P¹ are constants; ε↦0 and ε↦ε are distinct maps algebraically and analytically | Pass |
| algebraicGraphRegular | Polynomial graph; graph of exp | Polynomial map z↦z² has algebraic graph and is regular; exp's graph is not algebraic, so holomorphicity alone does not satisfy the input | Pass |
| familyMorphismInterface | Product proper family; exp on base A¹ | Fibre maps constant along P¹, but exp(s) is not polynomial; the stated relative algebraicity conditions cannot be discarded | Pass |
| affineCurveCompletionInterface | A¹; G_m | Projective completion P¹; boundary respectively {∞}, {0,∞}; the prescribed open is unchanged | Pass |
| puncturedRiemannSurfaceConnected | Sphere minus 0,1,2 points | Connected sphere, ℂ, ℂ* respectively; the punctures do not disconnect the surface | Pass |
| affineCurveConnectedness | A¹; two disjoint A¹'s | Algebraic/analytic connected-component counts 1/1 and 2/2; checks both directions | Pass |
| AlgebraicDeRham | Affine line; zero-dimensional scheme; unbounded disjoint dimensions | d(z²)=2z dz, d²=0; point complex ℂ in degree 0. ⨿Aⁿ has nonzero form degrees arbitrarily high, so smoothness alone is not a uniform bound | Pass |
| HolomorphicDeRham | exp(z); dz/z on ℂ* | d exp=exp dz; residue(dz/z)=1 and circle integral=2πi, so no global holomorphic logarithm exists | Pass |
| holomorphicPoincare | Disc versus ℂ* | dz=d(z) on disc; local primitive of dz/z exists off 0, but its global period on ℂ* is 2πi≠0 | Pass |
| IsDifferentialOperator | Multiplication; ∂z; zero module; p=2,3 | [m_a,m_b]=0; [∂z,z](1)=1; zero operator has every order bound. ∂^p(z^p)=0 while Hasse ∂^[p](z^p)=1 | Math passes; R04 ownership |
| Principal parts, universal jet and composition | k[z], m=0,1,2 | P⁰=A; P¹=A[t]/t², jet(z)=z+t; jet(z²)=z²+2zt+t² in P². Composite parameter t₁+t₂ gives the same expansion | Math passes; R04 |
| DifferentialOperatorAnalytification | ∂z on polynomial and analytic functions | ∂z(z²)=2z on both; analytic extension sends exp(z) to exp(z), which an O-linear extension would not do | Pass |
| boundedOperatorHyperGaga | Relative complex of point; P¹ de Rham | Point: ℂ→0 on both sides; P¹ hypercohomology in degrees 0,2 is ℂ, degree 1 is 0 | Pass |
| SmallSingularCochains | Point; interval with small-open cover | Augmentation sends a to constant degree-zero cochain a; interval boundary [1]−[0] has augmentation 1−1=0 | Pass |
| sheafSingularComparison | Empty space; point with arbitrary A; circle | Empty groups=0; point H⁰=A and H^q=0 for q>0; circle H⁰=H¹=A on both sides | Pass; no padding |
| properDeRhamBetti | P¹; elliptic curve | P¹ Betti/de Rham dimensions (1,0,1); elliptic dimensions (1,2,1), with integration map retaining periods | Pass |
| multiplicativePeriodInterface | Product of two positive loops in (ℂ*)² | Product period of dlog z₁∧dlog z₂ = (2πi)²=−4π²; reversing factors changes sign | Pass |
| holomorphicConnectionDictionary | d+z dw; change g=e^z; projection ℂ²→ℂ | Curvature dz∧dw on both carriers; line connection shifts by dz. Projection preserves trivial connections despite not being invertible | Pass |
| analyticFlatConnectionLocalSystem | Relative d_z+t dz | Horizontal frame e^(−tz), since ∂z e^(−tz)+t e^(−tz)=0; value at z=0 is 1. Zero-rank horizontal fibre=0 | Pass |
| Parameter-dependent horizontal contraction | Same connection and section 1 | Naive untwisted contraction of ∇1=t dz gives tz, whereas 1−ev₀(1)=0. Conjugating by e^(−tz) supplies the stated connection-dependent homotopy | Pass |
| relativePoincare | Product disc over base; relative point | Fibrewise primitives kill positive-degree cohomology locally; relative point complex=base functions in degree 0 | Pass |
| ehresmannFibration | P¹×S→S | Trivialization is projection/product identity; fibre H⁰,H²=ℤ and H¹=0, transport identity | Math passes; R02 supply |
| relativeBettiLocalSystem | Product P¹; finite n-sheeted covering | R⁰,R² constant ℤ in product; finite-cover R⁰ has rank n and loop transport permutes sheet basis | Pass |
| coherentFlatConnection_locallyFree | O/(t) in characteristic 0; O/(t^p) in characteristic p | Leibniz on t·1=0 forces dt=0 in first proposed torsion connection, impossible. d(t^p)=0 in char p permits torsion, excluded by characteristic 0 | Pass |
| GaussManin | Product family and class t·v | ∇(t v)=dt⊗v, not 0; constant v has ∇v=0, curvature 0 | Pass |
| relativeDeRhamBetti | Product P¹ over smooth S | Degree 0 and 2 bundles=O_S, degree 1=0; trivial connection and constant Betti transport agree | Pass |
| artinDeRhamBetti | A=ℂ[ε]/ε², P¹_A; id Spec A | H⁰=H²=A of length 2, H¹=0; identity relative complex=A→0. Reduction gives ℂ of length 1, not the original answer | Pass |
| Elliptic shift/Hodge inputs | P=−∂²−2 on circle | Constant energy=−2‖u‖²; shift λ=1 still negative, λ=3 positive. Kernel of −∂²−1 contains e^(±ix), removed by a positive shift | Pass |
| kaehlerHodgeDecomposition | P¹; elliptic curve | P¹ H²=H¹,¹≅ℂ; elliptic H¹=H¹,⁰⊕H⁰,¹≅ℂ², conjugation interchanges summands | Pass |
| properPureHodge | P¹ degree 2; elliptic degree 1 | P¹ type (1,1), weight 2; elliptic types (1,0),(0,1), weight 1 | Pass |
| relativeHodgeBundles | P¹ over dual numbers | H⁰(O)=A, H¹(Ω¹)=A, other Hodge terms 0; both reductions have rank 1 and retain length 2 before reduction | Pass |
| CurrentCalculus | α=a dx+b dy, η=φ dx+ψ dy | α∧η=(aψ−bφ)dx∧dy; dual-density coefficients (ψ,−φ). Complex extension sends iφ to i times evaluation, without conjugation | Pass |
| Current differential/conjugation | Degree k smooth form; point current | (dT_α)(η)=(−1)^(k+1)∫α∧dη=∫dα∧η; δ_a(f)=f(a), mass 1, derivative above top degree 0 | Pass |
| realComplexCurrentComparison | Disc q=2; segment [0,1] q=1 | Disc sign (−1)^(2−2+1)=−1; segment sign (−1)^(2−1+1)=+1. Testing segment boundary on x gives 1−0=1 | Pass |
| Real/complex mass and density tests | δ_a; ½δ_a; RP² with q=0 | Real and complex masses 1 and ½ respectively; ½δ is not integer rectifiable. V₀=density line, dual-density test=scalar functions even without orientation | Pass |
| closedCurrentExtension | Punctured-disc density abs(z)^−2 | Mass near 0=2π∫₀ʳ dρ/ρ=∞, so no finite-mass extension is asserted. Smooth bounded density has finite mass πr² times its bound | Pass |
| analyticSetLocalFiniteMass | Unit disc in a line; node; metric h=4g | Line mass π, whole line ∞; node branch discs total 2π with atom 0 at node. Complex dimension 1 gives μ_h=4μ_g | Pass |
| AnalyticCycleIntegration | Point; oriented coordinate line; double line | [a](f)=f(a); positive area test gives positive integral; [2L](η)=2[L](η), not [L](η) | Pass |
| AnalyticCycleIntegration.compactKaehler | Curve C and 2C | Complexified evaluation = real integral embedded in ℂ; doubling gives 2 times both sides; node contributes no atom | Pass |
| semipositiveWedge | α=2ω, β=ω on d-dimensional chart | α^d=2^dω^d≥ω^d; d=0 gives equality 1=1 | Pass |
| lelongPoincareSection | z^m; z/(z−1) | Divisor currents mδ₀ and δ₀−δ₁; poles carry negative multiplicity | Pass |
| integralLineBundleChernClass | O(1) on P¹; trivial line | Integral Chern numbers 1 and 0; Gaussian metric on trivial line has nonzero exact curvature but class 0 | Math passes; R02 supply |
| chernFubiniStudyIntersection | Hyperplane on P¹; tensor square | ∫c₁(O(1))=1; ∫c₁(O(2))=2. Poincaré–Lelong integrated over compact base gives 0=degree−Chern number | Pass |
| dghIntegrationApplication | Positive line cycle and multiplicity 2 | Positive test volume scales from v>0 to 2v; replacing by reduced support would leave v and violate the cycle comparison | Pass on integration interface; source-specific bounds not independently re-proved |
| AnalyticLogDifferentials | ℂ{z,ε}/ε² absolute and relative to dual numbers | Absolute Ω=A dz⊕A/(ε)dε, with dε≠0 and εdε=0; relative Ω=A dz with εdz≠0 | Pass |
| Analytic-chain-rule condition | Germ exp(z) | Analytic D gives D(exp z)=exp(z)D(z). Algebraic derivation into Frac(ℂ{z}) can assign D(z)=0,D(exp z)=1 and is excluded | Pass |
| logAnalytification | SNC xy=0; standard log point | Basis dlog x,dlog y on both sides; Res_x(dlog x∧dlog y)=dlog y, Res_y=−dlog x. Relative identity log-point module=0 | Pass |
| PrelogStructure | ℕ→ℂ, n↦0^n | n=0 maps to 1, n=1,2 map to 0; a map into units would exclude this example | Pass |
| LogStructure/ring log condition | Raw ℕ chart; ℂ××ℤ/2→ℂ; zero ring | Raw chart misses unit 2; product chart has two preimages for each unit; zero ring has singleton units and singleton multiplicative monoid | Pass |
| standardLogPoint | Logification of raw chart | Log monoid=ℂ××ℕ, characteristic monoid=ℕ; trivial log has characteristic 0 | Pass |
| AssociatedLog | Trivial monoid; coordinate chart | Trivial chart logifies to O×; coordinate characteristic is ℕ at 0 and 0 off 0; a second logification changes nothing | Pass |
| LogPullback | Divisor restricted off boundary and to origin | Off boundary structure trivial; at origin standard log point; identity pullback returns the same log structure | Pass |
| FineLogChart/IsFineMonoid | ℕ⁰, ℕ², ⟨2,3⟩, ℕ∪{∞} | ℕ⁰ groupification 0; ℕ² groupification ℤ². ⟨2,3⟩ cancellative/f.g.; absorbing ∞ has 0+∞=1+∞ although 0≠1 | Pass |
| Intrinsic saturation | ⟨2,3⟩⊂ℤ; 2ℕ⊂2ℤ | First has 2·1∈P but 1∉P and is not saturated. In 2ℤ every allowed root of an element of 2ℕ is again nonnegative even, so 2ℕ is saturated | Pass |
| DivisorialLog | Empty divisor; one branch; crossing | Characteristic monoids 0,ℕ,ℕ² respectively; multiplying equation by a unit does not change them | Pass |
| Algebraic logDifferentials | Standard point over trivial point; identity | ℂ dlog t versus 0; base relation kills exactly dlog t in the identity case | Pass |
| LogSmooth | Identity; xy=t with diagonal ℕ→ℕ² | Identity is log étale; node relative Ω_log has rank 1 though underlying central fibre is singular | Pass |
| logChartCriterion | Diagonal ℤ→ℤ²; multiplication by p in characteristic p | Diagonal cokernel ℤ, torsion 0, allowing log smooth dimension 1. Multiplication by p has cokernel ℤ/p of noninvertible order and is excluded from log étale | Pass |
| LogDeRham | Log line; crossing; ⨿Aⁿ | dz=z dlog z, d(dlog z)=0; crossing top form dlog x∧dlog y. Disjoint union has unbounded degree despite local smoothness | Pass |
| logDifferentialTransitivitySplit | Identity; A²→A¹; log node | Identity last term 0; ordinary middle module A dx⊕A dy. At node base generator maps to dlog x+dlog y and relative quotient kills that sum | Pass |
| RegularSingular | d on A¹; d+dz | First regular at infinity; second has a double-pole form at infinity and solution e^(−z), so not regular singular despite being analytically trivial | Pass |
| CanonicalLogExtension | Residue 1/4; two residues 3/4 | Monodromy exp(−2πi/4)=−i. Tensor residue sum=3/2, representative in [0,1) is 1/2, requiring an integral lattice shift | Pass |
| Logarithmic-lattice criterion | ℂ* trivial connection with shifted lattices | Residue choice −1 at 0 and 0 at ∞ yields degree-0 and degree-1 logarithmic cohomology ℂ; positive integral residues can destroy the comparison | Pass |
| deligneRiemannHilbert | Rank 0; trivial connection; irregular exponential | Zero corresponds to zero; trivial rank-one monodromy=1. Irregular exponential also has monodromy 1 and is excluded, preventing false full faithfulness | Pass |
| regularSingularDeRhamComparison | ℂ*,d; a nontrivial global log-lattice shift | H⁰=H¹=ℂ for the regular connection. A lattice complex with differential −1 is acyclic, showing arbitrary logarithmic extensions cannot replace the prescribed one | Pass |
| CurveLogComplex | P¹ minus {0,∞}; A¹ | For ℂ*, ordinary H¹=ℂ, compact H¹=ℂ, Hc²=ℂ, parabolic image=0; A¹ has H¹=0,Hc²=ℂ | Pass |
| curveResidueLocalization | dz/z on P¹ | Residues at 0,∞ are 1,−1, sum 0; positive local periods are 2πi,−2πi | Pass |
| properLogGagaMonodromy | Identity standard log point | Relative de Rham complex=ℂ in degree 0; log connecting monodromy N=0 on both algebraic and analytic sides | Pass |
| complexAlgebraicTopology | A¹; nodal curve; doubled origin | A¹ finite CW type=point but noncompact; nodal local model contracts to node; doubled origin is locally contractible but non-Hausdorff and excluded from global Hausdorff triangulation | Pass |
| topologicalCoefficientComparison | ℂ* with F₃ monodromy −1; F₅ monodromy 2 | First coboundary invertible, H⁰=H¹=0; second dual transport=3 and direct first-face transport=3, while actual fibre transport=2 | Pass; R03 supply |
| Constructible/nonprojective coefficient interface | Point, Λ=ℤ/4,M=ℤ/2; skyscraper on a line | Point H⁰=M,H>0=0 on both sides, but Tor_i(M,M)=ℤ/2 for every i≥0. Skyscraper has stalk M at point,0 elsewhere and is not a local system | Pass |
| Compact support/localization interface | (0,1)↪ℝ; oriented interval pair | j_! endpoint stalks=0; relative boundary of interval=[1]−[0], evaluating x gives 1 | Math passes; R03 |
| riemannExistence | z↦zⁿ on ℂ*; nilpotent point; nonabelian cover | Degree n/deck ℤ/n on both sides. Nilpotent point covers=finite sets. π₁(P¹ minus 3 points) surjects onto S₃ via (12),(123), giving a degree-6 regular cover and nonabelian deck S₃ on both sides | Pass |
| artinComparison | Point with ℤ/2 over ℤ/4; ℂ* with ℤ/n | Point comparison=id on ℤ/2 though coefficient is not ctf; ℂ* H¹=ℤ/n and coordinate Kummer class evaluates 1 on positive loop | Pass |
| artinComparisonCompactSupport | A¹; ℂ*; conjugation on P¹ | A¹ Hc⁰=0,Hc²=Λ versus ordinary H⁰=Λ; ℂ* Hc¹=Hc²=Λ. Conjugation top orientation=−1 and root-of-unity coordinate is inverted | Pass |
| relativeArtinComparison | Identity proper map; open immersion | Proper exchange=id; lower-shriek stalk outside open=0, agreeing with topological extension by zero | Pass |
| Finite-coefficient and degree conventions | Zero coefficient ring; trace n=0 and n=1 | Zero ring has only the zero module, so all comparison groups/maps are 0; n=0 is excluded by n>0; n=1 gives ℤ/1=0, hence trace 0=0 | Pass |
| artinSmoothTrace | Identity; P¹; A¹⊔A¹; A²→A¹→point; n=1,2 | Identity trace=id; c₁(O(1))↦1. Two components give (a,b)↦a+b, so (1,1)↦0 mod 2. Product orientation generator has iterated/composite trace 1; mod 1 all values are 0 | Pass |
| adicArtinComparison | P¹; torsion; surjective constant-coefficient tower | H⁰=ℤℓ,H²=ℤℓ(−1); rational ranks both 1. Torsion⊗ℚℓ=0. lim ℤ/ℓⁿ=ℤℓ and lim¹=0 in this ML example; reductions recover each finite comparison | Pass |

**Pinned declarations opened.** These are paths relative to the respective pinned library roots. The following 12 declaration groups were inspected, not merely matched by name:

| Pin/file and line | What the declaration actually supplies; audit consequence |
| --- | --- |
| Mathlib `Topology/Homotopy/LocallyContractible.lean:81` | Neighbourhood inclusion null-homotopy; no Hausdorff, paracompact or nonempty assumption. This matches Sella's semilocal condition, not the stronger contractible-neighbourhood-basis predicate. |
| Mathlib `Analysis/Normed/Operator/Compact/Basic.lean:69` | `IsCompactOperator f` means some compact K has `f⁻¹(K)` a neighbourhood of 0. It imposes no norm or finite-dimensional kernel; the zero operator satisfies it. |
| Mathlib `Analysis/Normed/Operator/Banach.lean:228` | Banach open mapping; it does not cover nonnormable ℂ^ℕ in C1.6. |
| Tau Ceti `Analysis/Complex/Conformal/Montel/Basic.lean:81` | `TauCeti.montel`: source Ω⊆ℂ, proper complex normed target. The README extends the domain dimension, rather than claiming the existing theorem already does that. |
| Tau Ceti `Analysis/Fredholm/CompactPerturbation.lean:87` | `ContinuousLinearMap.IsFredholm.add_of_isCompactOperator` needs a Fredholm operator between Banach spaces. Projection ℂ^ℕ→ℂ has infinite kernel and is not this theorem's instance. |
| Tau Ceti `Topology/Algebra/OpenMapping/Henkel.lean:57` | The open-mapping route here includes nonarchimedean additive-group hypotheses; it is not a generic complex Fréchet replacement. |
| Tau Ceti `AlgebraicTopology/Cohomology/Basic.lean:61`, :94 | Ordinary cochains are linear Yoneda/Hom out of chains; cohomology is their native homology. Taking chain coefficients `ULift ℤ` gives the rank-one free object in the required universe. |
| Tau Ceti `AlgebraicTopology/LocalCoefficient.lean:43`, :252 | A local system is a fundamental-groupoid functor to modules; transport is its action on a path class. It does not include local constancy of a sheaf or finite stalks automatically. |
| Tau Ceti `AlgebraicTopology/Cohomology/Twisted/Basic.lean:79` | Twisted cochains are Hom out of twisted chains. With scalar target they are dual-valued; the direct-cochain supplier and explicit dual/reflexivity distinction are necessary. |
| Tau Ceti `Topology/Sheaves/Flasque.lean:156` | Flasque abelian sheaves have subsingleton positive-degree `Sheaf.H`; no separation assumption is inserted. |
| Tau Ceti `AlgebraicGeometry/FinitelyPresentedSheaf/Basic.lean:48` | Full subcategory selected by finite presentation; the definition does not itself impose locally Noetherian X. The coherent interpretation in the README is conditioned appropriately. |
| Tau Ceti `Algebra/Category/ModuleCat/Sheaf/Quasicoherent/Monoidal.lean:162` | Finite presentation is monoidal, including unit and tensor closure. It does not by itself provide analytic coherence, kernels or the analytic-space category. |

Object searches in both pinned libraries did not find the all-order algebraic operator/principal-parts object already implemented; similarly named principal parts for divisors are a different object. Searches for the three fully qualified target declarations found no competing declaration in the reviewed sibling files. No extra library import is needed by Suggested.lean.

**Cross-roadmap and ownership evidence.** I used the roadmap search/show tools by object, checked the supplied citation leads, and searched the available board package README/Lean files. The supplied resolver reports no cross-roadmap citation found nowhere; its 172 missing-name leads are chiefly proposed API/Check labels and are not evidence that their mathematics is false. The following resolved boundaries are material to this review (paths are `TauCetiRoadmap/<name>/README.md`):

| Supplier snapshot and locator | Resolved contract and ownership boundary |
| --- | --- |
| ComplexKahlerGeometry on main, :517 (K4), K5a, :1301 (K6.1) | Componentwise finite-rank assembly, bundle tests/distributions and chart-local Lelong estimates exist. The present roadmap adds analytic-space and complex-current adapters; it does not need a new manifold connection or test-function substrate. |
| RealAnalyticGeometry on main, :728 (R3.2) and item 0 | Native coherence/finite presentation and coherent manifold Cartan theory exist. Descent through nilpotent analytic quotient charts is the distinct extension here. |
| AlgebraicVectorBundles on main, :215, :228, :254 | L0A–L0C supply closed monoidal sheaf operations, finite locally free objects and polynomial operations; the determinant also handles locally constant rank. |
| DifferentialGeometry on main, Layers 0–2, 5, :816 (Layer 8) | Real forms, orientation, integration/Stokes and de Rham comparison are supplied. Complex type/current comparisons remain here. |
| PDE on main, :303 (Lane D), Lanes A/E | Scalar Sobolev, energy-method and regularity inputs; the README distinguishes them from bundle extensions. |
| AlgebraicCurves on main, :1115 and :1128 | 12B/12C construct regular projective models and the field/curve anti-equivalence. The analytic puncture/connectedness comparison is added here. |
| AffineMorseLefschetz on main, :353–368 (A4.1) | Compact finite triangulation compatible with arbitrary finite semialgebraic families, closed members realized by subcomplexes, subdivisions and dimension comparison. Noncompact open-simplex/gluing consequences are described here. “A4's opening leaf” should be understood as A4.1's opening triangulation construction, not the preceding A4.0 Borel–Moore theory. |
| AlgebraicTopology on main, Stages 2.6, 6.1 and 8 | Generic local systems/direct local cochains, inverse first-edge transport, products and finite CW type. C6.1 owns the sheaf dictionary/resolution, rather than duplicating those cochains. |
| CharacteristicClasses on main, C1.2a S0–S5 and C1.2b (including :468) | Constant-cochain resolution and supported/CW comparisons; the README retains support-enlargement maps and controlled-collar domains. |
| EtaleCohomologyFoundations on main, :441–445, :567, :963 and :1159 | Localization, proper supports, normalized uniform-ctf systems and normalized smooth trace all exist. Sections F.0–F.4 and G.1–G.3 own finite/adic étale foundations and compactification; C6 owns complex-topological comparison. |
| EnhancedDerivedSheaves on main, :494, :1057, :1167 | Coherent derived functors, perfect proper pushforward, and the adjoint-functor input exist. C3's intrinsic quasi-coherent limits are explicitly obtained through its right adjoint, not identified with ambient sheaf limits. |
| AlgebraicModuliForArithmeticGeometry supplied search snapshot, §§7.3, 7.7–7.9, 8.3 (lines 8405, 8802, 8837, 9207) | Finite-type coherent-stack reduction, `spaceDQCoh`, component criterion and generic framed formal parameters exist. Picard-specific representation/completion is a specialization; no new arbitrary parameter functor is substituted. |
| DerivedDeRhamCohomology Layer 2; CrystallineCohomology CR.1 and CR.5 | Shared de Rham complex, ordinary connections and algebraic log structures/differentials are cited as supplied. The analytic-chain-rule quotient and comparison maps are the extensions here. |
| ResolutionOfSingularitiesCharacteristicZero §§1.3, 6.2, 6.4 | Labelled strict-SNC coordinates and compactification retaining the prescribed open supply the algebraic inputs; the polydisc chart construction remains here. |
| GlobalHolomorphicFunctions open head, :191 and :562 | The scalar Cauchy–Green/finite-rank Runge input exists, but is later: R01. |
| SmoothBundlesConnections open head, :171–192 and :633 onward | Proper-submersion theorem includes componentwise bases and disconnected fibres; B6 constructs the integral comparison. These contracts exist but are later: R02. |
| TopologicalSheafCohomology open head, :74–78 and TS3 item 7 | Actual extension by zero, c-soft resolutions, localization and sheaf/singular support bridge exist but are later: R03. |
| FormalConnectionsOpers open head, :179–207 | The algebraic operator/principal-parts construction is still owned there, contradicting the asserted transfer: R04. |

No second owner for the three Lean headlines was found. Ownership against open work whose files were not supplied was not independently checked; an index/search result alone is not treated as a verified conflicting owner. Broad supplier references such as “UniversalCovers” resolve to an existing roadmap, but are less precise than the section-level contracts in the table; this review does not infer additional theorems from those broad names.

Additional source checks support C3's generality: stacks lines 287342–287364 and 287442–287455 (Tags 0CX4–0CX6 and 0CXB) explicitly allow arbitrary surjective ring towers with locally nilpotent transition kernels, separated finitely presented X and flat finitely presented coefficients with proper support. They distinguish intrinsic and ambient derived limits. Stacks lines 332360–332363 (09DS) impose separated finite presentation, not flatness of X/B, for coherent-stack algebraicity; lines 348592–348602 (0DLZ) supply the affine diagonal and quasi-separated/l.f.p. conclusion. These are not Noetherian-only results.

**Dependency check.** The requested check was run with `--movable`. Its complete output is:

```text
not movable: ComplexComparisonPartII consumes TopologicalSheafCohomology (#308) and is consumed by FormalConnectionsOpers (#40), which comes first: moving ComplexComparisonPartII after TopologicalSheafCohomology would put a supplier after a consumer, a cycle through ComplexComparisonPartII
UPWARD: ComplexComparisonPartII (#39) -> AlgebraicCurves (#226) at README lines [586, 2268, 2315, 4537]
UPWARD: ComplexComparisonPartII (#39) -> AlgebraicVectorBundles (#247) at README lines [549, 947, 1026, 1231, 2349, 2375]
UPWARD: ComplexComparisonPartII (#39) -> ComplexKahlerGeometry (#246) at README lines [27, 135, 136, 144, 145, 236]
UPWARD: ComplexComparisonPartII (#39) -> DifferentialGeometry (#221) at README lines [553, 1436, 1657, 2569, 3081, 3178]
UPWARD: ComplexComparisonPartII (#39) -> GlobalHolomorphicFunctions (#207) at README lines [135, 519, 1261, 1657]
UPWARD: ComplexComparisonPartII (#39) -> PDE (#238) at README lines [578, 3966]
UPWARD: ComplexComparisonPartII (#39) -> SmoothBundlesConnections (#220) at README lines [553, 567, 1369, 2733, 3336, 3966]
UPWARD: ComplexComparisonPartII (#39) -> TopologicalSheafCohomology (#308) at README lines [4106]
depcheck: 163 roadmaps, 1189 edges, 8 problem(s)
```

The five lines for AlgebraicCurves, AlgebraicVectorBundles, ComplexKahlerGeometry, DifferentialGeometry and PDE are false positives under this review's explicit permission to consume existing main roadmaps: their cited material exists on main at `c9940702`, as identified above. I did not use their later revision PRs as suppliers. The other three edges are genuine and are R01–R03. The “not movable” line establishes an obstruction to fixing these by moving this roadmap after all its suppliers while retaining the listed consumer positions; it does not, by itself, exhibit a reverse dependency proving a mathematical directed cycle. The repair therefore moves ownership rather than merely asserting a stage order. No declared gap excuses any of these edges, and no merge-order/tooling file was changed.

The supplied push gate is **FAIL**: `layer-ids=1`, `depcheck=8`, `build=0`; all remaining scanner counts, including outside-folder, stray-files, admitted data, imports and options, are zero. The independently successful elaboration does not clear those gate failures. Six findings are recorded, four blocking (P2), with no mathematical falsity established by the computed tests.

## Not verifiable

- **SGA 4** (XII; XVI §4; XVII §§3–5; XVIII §§2–3, especially 2.8–2.10 and 3.2.5) and **SGA 4½** (*Théorèmes de finitude* §§1–2): the sources service resolved the publisher citations as paywalled/uncertified. The full constructible, compact-support, relative and trace source checks are therefore not certified. The legal Grothendieck publication index was also consulted; it did not supply the needed readable SGA 4 text. These are not renewed missing-text requests.
- **Dimca, Sheaves in Topology** and **Bochnak–Coste–Roy, Real Algebraic Geometry**: publisher-only results, recorded by the service as uncertified. In particular Dimca's support/constructible statements and BCR Theorem 9.2.1 were not verified from text.
- **Kato, Logarithmic structures of Fontaine–Illusie**, §§1.7–1.9, pp. 195–196, and the other cited log locators: a legal institutional PDF was fetched, but is image-only. The available extraction has no usable theorem text; the screenshot reader did not expose readable content in this run. The algebraic log source locators remain uncertified here, despite the explicit quotient computations above.
- **Hironaka, Triangulations of algebraic sets**, pp. 165–185: the service found the AMS DOI landing page but no readable legal text. **Whitney, Complex Analytic Varieties**, Theorem 9F, p. 240: no legal text found. These remain in the consolidated missing-reference record.
- **Katz–Oda, On the differentiation of De Rham cohomology classes with respect to parameters**, §§1–3: the Project Euclid DOI page was found but the service could not obtain a PDF. **tom Dieck, Differential Manifolds**, Theorems 2.2.1, 2.2.3 and Corollary 2.2.4, pp. 52–53: the author URL timed out. These locators are not certified.
- **Knutson, Algebraic Spaces**: service result is paywalled/uncertified. **Hatcher, Algebraic Topology**, §3.H, pp. 333–334: the author PDF was fetched, but the extracted text did not permit reliable verification of this precise passage. The native local-coefficient convention was checked directly at the pin and against AlgebraicTopology instead.
- Other fetched nonseed sources were retained for context; fetching alone is not represented as locator verification. In particular this report does not certify every application-specific bound in the DGH, Qian, BKT, Mok–Pila–Tsimerman or Caraiani–Scholze applications. The requested seed checks, the ordinary Lean headlines, and the explicit additional checks above are the certified scope.

Missing texts do not suspend this review. The verdict already follows from the concrete ownership and supply-order defects. No source manifest or source file was added to the PR, and no source passage is copied into this report.

## Source issues

- **Error** in sella at introductory discussion, p. 2, lines 39–42: the source says ranks of degree-zero cohomology count components without finiteness conditions; it should describe products over path components and locally constant functions, respectively; affects nothing.
- **Error** in milne at Proposition 21.8, p. 133, lines 5154–5156: the source says every nonsingular variety has an elementary-fibration neighbourhood of each closed point; it should assume positive dimension and handle zero-dimensional varieties separately; affects a stated result.
- **Misprint** in deligne1970 at II §5.3, p. 94, lines 3068–3077: the source says the subsection label is 4.3; it should be 5.3; affects nothing.

For the first source issue, an infinite discrete countable space has H⁰=∏ℕℤ, whose rank is uncountable, whereas its component count is countable. For the second, Spec ℂ cannot have a dense open immersion into a relative curve over a nonempty base: its dimension is 0. The roadmap already separates dimension zero in C6.3. The third is a numbering slip, and the roadmap already uses the intended II.5.3 locator.
