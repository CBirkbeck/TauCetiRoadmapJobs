# Review of RiemannianManifoldsWithConvexBoundary (design, round 3)

**Verdict:** needs changes

Five findings: two P1, two P2 and one P3. The design is repairable. The earlier ownership repairs are sound, including the decision to import the collar extension directly from GeometricTopology. No design text, plan or source-manifest entry was changed in this review.

## Previous findings and repairs

Locations in this table are in packages/RiemannianManifoldsWithConvexBoundary/design/README.md unless indicated otherwise. Each repair was checked before the further adversarial pass.

| Round 2 finding | Repaired passage | Assessment |
|---|---|---|
| R01, ownership of interior, collar extension and double | Lines 643–645: “GeometricTopology 1.3's glued manifold”; lines 667–668: “GeometricTopology 1.3's double”. | **Repaired.** Main's GeometricTopology §1.3 states exactly the gluing laws used. AffineMorseLefschetz §4.5 itself consumes GeometricTopology; importing the general construction directly is valid. The retained defining functions and atlas comparison are additional work. |
| R02, already supplied outward normal | Lines 298–302: “Let `ν_out` be the outward unit normal of DifferentialGeometry 12.5”; lines 305–309 give the chart-source extension without second countability. | **Repaired.** Opened the supplier's statement and Lean context. Unit, outward and orthogonality laws determine the normal; chart sources are second countable and the local fields agree. The obsolete gap is absent from both files. |
| R03, dimension-one classifications | Lines 1273–1275: “For `n = 0` … `τ(θ, ±1) = R ∓ θ`”; lines 104–105 restrict mean curvature; lines 496–498 explicitly retain vacuous strict convexity. | **Partly repaired.** Cap, half-space, affine-level, conformal, mean-curvature and small-ball classifications are repaired. The same zero-dimensional pattern remains in the plan's sharp uniform-bound Check, new R04 below. |
| R04, global multiplier changes the domain | Lines 589–591: “`{e^{x₁}(1 − \|x\|²) ≥ 0}`”; lines 592–597 retain the extra half-space as a negative control. | **Repaired.** At x₁=−3 the replacement is −8e⁻³<0; the old multiplier gives +8. The ratio 2+x₁ is now explicitly restricted to the ball in §§1.3 and 2.2. |
| R05, zero tangent velocity | Lines 810–813: “`0 ≠ v ⊥ q`” and “For `v = 0` the constant curve … is a geodesic”. | **Repaired at the cited targets.** The exterior formulas also use t²\|v\|². Searching for this pattern elsewhere finds the plan's separate ball exit-time omission, R02 below. |
| R06, positive radius and semiaxes | Lines 1215 and 1248: “`R > 0`”; line 1236: “`a, b > 0`”; lines 1233–1235 exclude radius zero. | **Repaired.** Both plan and README have the radius assumptions; the ellipse computation now uses positive axes. |
| R07, endpoint versus full Herglotz condition | Lines 1332–1334: “restriction … to the outer boundary” and “for every `r ∈ (0, 1]`”. | **Repaired.** For φ(s)=s²−2s, b′(1)=e⁻¹ but b′(1/√2)=0. The added totally geodesic inner-sphere argument correctly distinguishes the conditions. |

No finding was marked “not actionable in this package”. The alternative implementation of old R01 is accepted for the reason above. No maintainer notes were supplied. The round-2 computed adversarial rows were read; unchanged arguments are reused only where those rows contain actual values. All repaired passages, all 15 sampled targets, the full plan including its Checks, and the headline statements were examined afresh.

## R01 (P1) — An injective normal tube need not be a distance tube

**Location.** packages/RiemannianManifoldsWithConvexBoundary/design/README.md:904–909: “With `ε` and `E := E_{∂M}` from 4.3” and “`r = d_M(·, ∂M)` there”; design/plan.json:1255, target 4.4.

**Claim.** The distance identity holds on the whole positive half of the tube chosen in §4.3. But §4.3 proves it only on a possibly smaller W′, at README:868–872.

**Witness.** In Euclidean ℝ² take ρ(x,y)=x(1−x), M=[0,1]×ℝ, ε=0.9 on x=0 and 0.01 on x=1. At (0.8,0), the normal coordinate is 0.8, but d_M(·,∂M)=0.2.

These two open normal strips are disjoint: their x-ranges are (−0.9,0.9) and (0.99,1.01). They satisfy §4.3's diffeomorphism, sign and Gauss-lemma conclusions; their boundary core is noncompact, so the radii need not be equal. On the first strip E((0,y),r)=(r,y), on the second E((1,y),r)=(1−r,y). The segment from (0.8,0) to (1,0) lies in M and has length 0.2. Taking narrow strips gives the required W′, so the counterexample satisfies the smaller-neighbourhood conclusion too.

**Exact repair.** Before §4.4, choose a smaller positive smooth radius η≤ε whose whole tube lies in W′, and use η in the distance/collar statement. Equivalently strengthen the choice in §4.3 so its final W is contained in the distance neighbourhood. Update target 4.4 and its prerequisite interface accordingly. Keep the Gauss and metric formulas on their stated normal-coordinate domain; they do not require the distance-minimizing property. Add this unequal-strip example as a negative control.

**Repair test.** Radii 0.4 and 0.005 are smaller than the original choices and lie inside the corresponding distance regions. On them the distance is r for r≥0. The refuting point (0.8,0) no longer belongs to the claimed collar. No compactness restriction or exclusion of noncompact boundaries is needed.

## R02 (P2) — Restore unit speed in the plan's exit-time formulas and bounds

**Location.** packages/RiemannianManifoldsWithConvexBoundary/design/plan.json:1964–1967, target 6.1.1: “`τ(x, v) = −⟨x − c, v⟩ + √(⟨x − c, v⟩² + R² − |x − c|²)`”. Its hypotheses give only the Euclidean metric and R>0. Target 6.1.2 at :2000 and README:1223 also leave the domain of the bound τ≤diam D implicit.

**Claim.** The displayed formula is stated for the exit time defined in §5.2, which accepts every tangent vector. The README's ball formula at :1218 correctly says “for unit `v`”; the plan does not.

**Witness.** In the unit ball, x=c=0 and v=0 give τ=∞ but the displayed right side is 1. For v=e₁/4, τ=4 while the right side remains 1 and diam D=2.

**Exact repair.** Explicitly quantify the formula over x∈B̄(c,R), \|v\|=1 in target 6.1.1, and the diameter bound over (x,v)∈SD in target 6.1.2 and the README. Retain the general-speed API of §5.2: for v≠0, obtain the formula by homogeneity, and bound τ(x,v)≤diam D/\|v\|; retain τ(x,0)=∞ separately. Make the analogous domain explicit for the bound in §5.5.1. Add the speed-1/4 computation as a negative control.

**Repair test.** At x=0, a unit vector gives τ=1, exactly the displayed root. Homogeneity gives τ(0,e₁/4)=4 and the general bound 4≤8. The zero vector is outside these finite bounds, agreeing with the repaired §4.1 Check. The native predicate has no speed constraint: TauCeti/Geometry/Manifold/Riemannian/Geodesic/Basic.lean:102–111.

## R03 (P1) — The empty closed manifold satisfies all three non-trapping criteria

**Location.** packages/RiemannianManifoldsWithConvexBoundary/design/plan.json:1792: “Compact M without boundary: no f has Xf > 0”; :1828: “Closed M: all three conditions fail.” These are the closed-manifold Checks of targets 5.5.1 and 5.5.2.

**Claim.** Closedness alone makes the three equivalent conditions false. The README at :1158 correctly adds “nonempty”; the plan loses it.

**Witness.** Let N=ℝ² and ρ≡−1. Then M=∅ is a compact regular domain, SM=∅, non-trapping is true, X on the singleton function space is surjective, and Xf>0 holds vacuously.

**Exact repair.** Add “nonempty” to both plan Checks, matching the README. Add the empty regular domain as a positive degenerate Check: all three conditions hold. Do not exclude empty M from the equivalence theorem. Read the extrema bound of §5.5.1 pointwise on SM; when SM is empty there is no point to bound, and a maximum/minimum witness must not be asserted.

**Repair test.** On the empty domain the truth values are (true,true,true). On any nonempty compact boundaryless positive-dimensional manifold, SM is nonempty compact, Xf=0 at a maximum, Xu=1 is impossible and unit geodesics have τ=∞: the corrected negative Check has (false,false,false).

## R04 (P2) — Sharpness of the unit-ball convexity constant needs positive boundary dimension

**Location.** packages/RiemannianManifoldsWithConvexBoundary/design/plan.json:559, target 2.3.2: “Unit ball: best constant c = 1.” The target permits n=0.

**Claim.** The largest c satisfying II≥c h on the unit-ball boundary is 1 in every permitted dimension.

**Witness.** For the unit ball [−1,1]⊂ℝ, every boundary tangent space is zero. For c=2, II(0,0)=0=c h(0,0), so c=1 is not the best constant.

**Exact repair.** Qualify the sharpness Check by n≥1. Add the n=0 control: every c>0 works, with no largest finite constant. Keep target 2.3.2's existence theorem in all dimensions. This finishes propagation of the previous round's R03, without changing its already correct classification repairs.

**Repair test.** For n≥1 choose a unit boundary tangent u. The inequality becomes 1≥c, and c=1 works. For n=0 it is 0≥0 for every c, including c=2 and c=100.

## R05 (P3) — Choose a nonzero parameter for the slanted-normal negative control

**Location.** packages/RiemannianManifoldsWithConvexBoundary/design/README.md:319–322 and design/plan.json:106: “`|a| < 1`” followed by “`g(e₀, e₁) = a ≠ 0`”.

**Claim.** The coordinate vector fails orthogonality for every allowed a.

**Witness.** At a=0 the metric is the identity, ν_in=e₀ and g(e₀,e₁)=0. Thus e₀ is the correct unit normal in this admitted case.

**Exact repair.** Keep the formula for all |a|<1, but qualify the negative-control sentence by a≠0, or choose a=1/2 there. Apply this to both representations. No theorem restriction is needed.

**Repair test.** At a=1/2, g(e₀,e₁)=1/2 while g((2/√3,−1/√3),e₁)=0; at a=0 the formula reduces to e₀ as it should.

## Verified sound

**Coverage, principles and shape.** Read the complete 1,409-line design README, all 49 targets and 123 plan Checks, and all six manifest entries. The plan has ten definitions, each with an API and at least three Checks; related prose definitions share their subsection's API/Checks. There are six mathematical layers, each ending in Examples and Dependencies. All 136 internal prerequisite edges resolve and the explicit graph is acyclic. All Needs paragraphs were read. No declared supplier gap remains. No route-specific shortcut, re-planning of this named roadmap, forbidden supplier, copied source passage, computational algorithm, process hand-off, HTML anchor or machine path was found in the design. No new source was needed.

GeometricTopology, DifferentialGeometry and RiemannianGeometry on main supplied the house-shape comparisons. The six-layer order is justified by intrinsic II → convexity → regular-domain/metric extension → boundary geodesics → exit/scattering → examples. It is not a copied chapter outline. Layer 5's order also follows its actual dependencies: calculus → fold regularity → σ and Xσ → non-trapping equivalence and scattering. API names in plan.json are prospective names; the README does not attribute undeclared backticked Lean identifiers to this roadmap. Its II, H, τ and related mathematical symbols are notation. The named outward-normal declaration belongs to the supplier and resolves there.

**Dependency check, exact output:**

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 229 roadmaps, 2057 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The reported insertion point is not a supplier claim about MathematicalBilliards. No merge-order file was edited. Citation resolution reported no unresolved cross-roadmap names, but explicitly did not inspect pinned library names; those were checked separately below.

**Supplier and ownership audit.** Main was read directly, and open suppliers were read using `roadmaps show`; object searches used `roadmaps grep`, the available board packages and the pinned libraries. The package index was read before any absence assessment. The supplied overlap report lists no conflicting head, dropped cited id or id available only in an unnamed revision.

| Citation/object | File and line opened | Resolution |
|---|---|---|
| Pointing; metrics; gradient/Hessian; outward normal | TauCetiRoadmap/DifferentialGeometry/README.md:1648, :2801, :2848, :2871, :2936; Suggested.lean:967, :1020 | §§5.1, 12.1–12.3, 12.5 resolve. Normal smoothness, unit length, outwardness and orthogonality are supplied. The second-countable context also carries σ-compact/Borel/continuous metric instances. The local chart-source extension preserves the object. |
| Ambient geodesics, normal domains and variation | Completed/HopfRinow/README.md:264, :427, :444, :495 | Layers 1, 2 and 4 supply the named inputs under boundaryless hypotheses; used on N. |
| Normal jets and immersion geometry | TauCetiRoadmap/RiemannianGeometry/README.md:1384, :1436, :2840, :2870, :2891 | The R1.4 alias is retained at §2.2. R5a supplies B, S, averaged mean curvature, Gauss signs and B=0 iff total geodesicity. |
| Interior, collar, full-boundary gluing/double | TauCetiRoadmap/GeometricTopology/README.md:788, :797, :809, :851, :864, :870 | Main supplies the constructions now imported. The collar extension is the case N=∂M×[0,1). Its new defining function and atlas comparison remain this roadmap's work. |
| Other occurrence of collar extension | TauCetiRoadmap/AffineMorseLefschetz/README.md:19, :134, :841 | Its §4.5 constructs M⁺ from the GeometricTopology contracts; no reason to force an additional supplier edge through this consumer. |
| Seeley extension | TauCetiRoadmap/ComplexKahlerGeometry/README.md:1792–1799 | K5a explicitly includes the half-space extension step. The new manifold extension combines that local result with a partition of unity; it does not claim that K5a separately numbers the step. |
| Uniform normal radii | PR #2127, TauCetiRoadmap/SmoothBundlesConnections/README.md:1306, :1318–1333 | B6.0 supplies given-metric normal and strong-convexity radii over compact sets. §6.4 adds boundary II and non-trapping consequences. |
| Surface normal strips | TauCetiRoadmap/RiemannianGeometry/Surfaces/README.md:269–310 | Earlier surface theory gives a(s,t) and a_t(s,0)=−k_g. The present arbitrary-dimensional boundary metric formula has h_r=a²ds² in this case, hence −h′₀/2=k_g ds². No competing general hypersurface signed-distance/exit-time construction was found. |
| Normal exponential/focal geometry | TauCetiRoadmap/RiemannianGeometry/README.md:3360–3387 | Existing embedding normal exponential is explicitly imported from Tau Ceti; immersion focal/index theory is not planned here. |
| Boundary mean-curvature consumer | PR #956, TauCetiRoadmap/PositiveMass/README.md:949–959 | Its inward averaged sign gives H=1 on the unit ball and H=−1 on the exterior, as here. Its collar extension at :927 concerns spinor sections. |
| Closest open scopes | PR #1506, TauCetiRoadmap/ManifoldOptimization/README.md:12–18, :48–61, :745; PR #1023, TauCetiRoadmap/RicciFlow/README.md:3–38; PR #946, TauCetiRoadmap/CalibratedGeometry/README.md:46–65, :103–110, :1224 | Boundaryless optimization, closed-manifold flow and calibrated volume/deformation theory respectively. They consume immersion/normal-exponential geometry; none owns the boundary exit/scattering library. |

Searches by boundary defining functions, signed distance, exit time, scattering relation, fold/even-function normal forms, collar extension, II and normal exponential found no competing owner for the new general boundary theory. The stochastic and Morse-flow exit-time hits are different constructions; the normal-strip surface case and immersion B were compared above. No duplicate fully qualified declaration can be introduced by this design's absent Lean file. The board's three indexed external packages concern analytic number theory, Lawrence–Venkatesh and logic; the object searches in available package texts supplied no competing geometric construction. No later roadmap was promoted to a supplier.

**Seeded source sample.** The three certified extractions were read at every relevant locator below, including the proof passages used to enlarge a source's statement. Printed book pages differ from extraction page markers. The manifest fixes UV to arXiv v1 and SUV to arXiv v3; the page references below are to those versions. The three settled uncertified books were not requested again.

| Sampled target | Source locator actually read | Support and limits |
|---|---|---|
| 1.2 outward/inward normal | paternain-salo-uhlmann2023 line 2687, pp. 54–55; lee-riemannian2018 Ch. 8 | PSU fixes inward-positive convention. The chart formula and local gluing use the named normal supplier, not a claim that PSU proves that full API. Lee remains uncertified. |
| 1.4 II | paternain-salo-uhlmann2023 line 2732, p. 56; Lemma 3.1.12, line 2781, pp. 57–58; proof line 2838, p. 59 | Correct inward-normal sign. PSU uses normalized ρ; dividing by \|dρ\| gives the design's general defining-function formula. |
| 2.2 Hessian characterization | paternain-salo-uhlmann2023 line 2781 and line 2838; uhlmann-vasy2016 line 499, preprint p. 11 | Negative tangential Hessian, nonzero vectors/covectors. Hamiltonian rescaling changes the first/second derivatives by positive factors, not their signs. |
| 3.1 regular domains | uhlmann-vasy2016 line 25, p. 1; stefanov-uhlmann-vasy2021 line 96, p. 2; paternain-salo-uhlmann2023 line 2770, p. 57 | Ambient positive-superlevel description is supported. Native sublevel atlas for −ρ and metric/connection comparison supply the formal construction. |
| 3.2 level concavity | uhlmann-vasy2016 line 137, p. 3, and line 507, p. 11; stefanov-uhlmann-vasy2021 line 128, p. 3, line 198, p. 4 | Superlevel-side concavity has Hess x positive on ker dx. The sublevel/superlevel II signs computed below agree. |
| 4.1 domain geodesics | paternain-salo-uhlmann2023 line 2645, pp. 53–54, and line 2763, p. 57 | Ambient continuation is explicit. PSU fixes unit speed; the design's all-speed extension is valid by the native connection equation. R02 concerns an omitted speed condition elsewhere. |
| 4.3 signed distance | paternain-salo-uhlmann2023 Lemma 3.1.10, line 2766, p. 57; stefanov-uhlmann-vasy2021 line 99, p. 2; lee-riemannian2018 Chs. 5–6 | PSU states normalized distance near the boundary in a compact closed extension, not on an arbitrary injective tube. General noncompact tubes use the pinned theorem and local distance argument. R01 identifies the later overuse of that neighbourhood. |
| 4.4 boundary normal coordinates | stefanov-uhlmann-vasy2021 line 20, p. 1, and line 220, p. 5; lee-riemannian2018 Chs. 5–6 | SUV discusses normal gauge/coordinate jets, not a full theorem with global tube domain. The metric derivative formula is independently computed below; Lee's detailed theorem remains uncertified. Whole-tube distance equality is false as presently passed from §4.3, R01. |
| 4.5 convexity functions | uhlmann-vasy2016 theorem line 30, p. 1, proof lines 499–524, p. 11; stefanov-uhlmann-vasy2021 lines 128–134, p. 3 | Proof gives −ρ−ε\|z−q\|², confinement \|z−q\|²≤c/ε and positive tangential Hessian. This local argument does not require the ray-transform theorem's dimension restriction. |
| 4.6 enlargement | paternain-salo-uhlmann2023 proof of Prop. 3.3.1, lines 3093–3096, p. 65 | Source uses a slightly larger convex non-trapping domain; the design supplies the compact-boundary tube and cutoff details rather than assuming an arbitrary defining function works. |
| 5.1 sphere strata | paternain-salo-uhlmann2023 lines 2646–2648, 2682–2696, 2931, 3063–3079, pp. 53–55, 61, 65; stefanov-uhlmann-vasy2021 lines 150–163, p. 3 | Inward/outward label reversal is explicit and correct. Flow is global only under completeness/compact ambient assumptions. |
| 5.4 exit regularity | paternain-salo-uhlmann2023 Lemmas 3.2.3, 3.2.6, 3.2.8–3.2.11, lines 2865–3043, pp. 59–64; Remark 3.2.13, line 3046, p. 64; Exercise 3.3.3, line 3110, p. 66 | Compact/non-trapping/strict convexity hypotheses match. Fold lemma needs only local boundary convexity. Positivity of Q_r follows in the proof at line 3000. Continuity is an exercise, with an actual fold proof route supplied here. |
| 5.6 scattering/lens data | paternain-salo-uhlmann2023 Definition 3.3.4/Lemma 3.3.5/Exercise 3.3.6, lines 3114–3127, p. 66; stefanov-uhlmann-vasy2021 lines 150–163, p. 3 | Involution, smoothness, fixed glancing locus and tangential projection agree. Projection is only a homeomorphism at glancing, as the design correctly says. |
| 6.2 half-space/exterior | paternain-salo-uhlmann2023 Definition 2.5.1/Lemma 2.5.2, lines 2449–2473, pp. 46–47 | Source gives the radial surface sign model, not the full higher-dimensional formulas. Those follow directly from the stated Euclidean Hessian and §1.4. Nonzero tangent speed is now explicit. |
| 6.4 small balls | lee-riemannian2018 Ch. 6; paternain-salo-uhlmann2023 Example 3.1.4, lines 2677–2678, p. 54 | PSU supports only the cap instance. General result uses HopfRinow, R1.4 and B6.0; Lee remains uncertified. No claim that Example 3.1.4 proves arbitrary small geodesic balls. |

Also checked the repaired §§3.3–3.5 against PSU Lemma 3.1.8/Exercise 3.1.9 (lines 2749–2762, pp. 56–57); the source gives the compact extension and leaves general doubling as an exercise, while the design imports the needed manifold construction. Checked §6.5 against SUV (1.1), lines 66–72, p. 2, and PSU Lemma 2.5.2/Corollary 2.5.3(a),(c), lines 2462–2481, p. 47. The latter source's endpoint typo is not adopted. All cited works have one manifest key. No additional locator was flagged unverified beyond the three settled uncertified entries.

**Adversarial mathematics table.** These are independently evaluated instances, not elaboration results. Rows cover all sampled sections, all seven headline groups, repaired constructions and every finding. Unchanged ancillary APIs were also compared with the round-2 table's computed rows; no unsupported “sound” summary was treated as a computation.

| Statement | Instances tried | Computed values on each side | Result | Change |
|---|---|---|---|---|
| 1.1 trichotomy and curves | Half-plane, ±e₀, e₁, c(t)=(t²,0); interval | dx⁰ values −1,+1,0; c′(0)=0; boundary tangent dimension 0 on interval | Sign/kernel assertions hold | None |
| 1.2 normal formula and uniqueness | a=1/2 and a=0; [0,1] | g(ν,ν)=4/3−2/3+1/3=1, g(ν,e₁)=0; g(e₀,e₁)=1/2. At a=0 both normals=e₀, pairing=0. Interval ν_out=−1,+1 | Formula sound; negative control needs nonzero a | R05 |
| 1.3 defining functions and ratio | Ball, squared defining function, empty boundary | ρ=1−\|x\|² has \|dρ\|=2; d(ρ²)=0; 2+x₁∈[1,3] on ball; ρ=1 has empty zero set | Regularity and positivity discriminate | None |
| 1.4 II in three descriptions | R=2 ball, exterior, plane, n=0 | −(−2h)/4=h/2=⟨∇ν_out,·⟩; exterior −2h/2=−h; plane −0/1=0; zero-space form=0 | Correct signs and nonzero denominator | None |
| 1.5 shape/mean | Sphere, cylinder, exterior | Eigenvalues 1 give H=1; (1,0) gives H=1/2; −1 gives H=−1; n=0 excluded from average | Sound | None |
| 1.6 conformal law | φ=log 2, −\|x\|², (\|x\|²−1)² | IÎ=2h; e⁻¹(1−2)h=−e⁻¹h, Ĥ=−e; zero first jet gives h. Wrong plus sign gives 3e⁻¹h | Sound | None |
| 2.1 strict/weak convexity | Cylinder, cubic epigraph, half-line | Spectrum (1,0): weak true, strict false; κ=6x/(1+9x⁴)^(3/2) has sign x; T∂[0,∞)=0 gives both strict predicates true | Dimension repair holds | None |
| 2.2 Hessian iff | ρ and (2+x₁)ρ on ball; −ρ | Hess(uρ)\|T=−2u h, \|d(uρ)\|=2u, II=h. Negative multiplier gives sign reversal and fails positivity | Both directions and multiplier law hold | None |
| 2.3 openness and uniformity | Hyperbola epigraph; conformal family; balls n=0,1 | κ=(1+2x²)^(-3/2)→0; e⁻ˢ(1−2s)>0 iff s<1/2; unit tangent gives c≤1 only when n≥1; n=0 gives 0≥0 for c=100 | Main theorems sound; sharpness Check not dimension-free | R04 |
| 3.1 regular domain and multiplier | x=(−3,0); exp(x₁)ρ; ρ³; double cone | Old product=8 versus ρ=−8; exp multiplier gives −8e⁻³; at x₁=−2, dρ′=−(3+y²)dx₁≠0; d(ρ³)=0; cone punctured at vertex has two components | Correct repaired domain and negative controls | None |
| 3.2 level concavity | x=±\|z\|², c=4; affine x; n=0 | Hess=±2g; positive sublevel boundary II=h/2, superlevel II=−h/2; affine Hess=0; ker dx=0 in dimension one | Sign and dimension distinctions hold | None |
| 3.3 collar defining function | [0,1], collar t/2; half-plane; empty boundary | ρ̃=2x near 0, 2(1−x) near 1; dρ̃/dx=±2; half-plane ρ̃=x⁰; empty boundary ρ̃=1, zero fibre empty | New defining-function work sound | None |
| 3.3 patching and double | Positive/negative bicollar t; x³(1−x)³; interval double | χ(t) and s have matching signs; at seam φ₀=1, φ₁=0 and dρ̃(∂t)=1. Cubic endpoint derivatives=0; double has two regular zeros | Wrong sign-only model excluded | None |
| 3.4 extension | √x; (x+.01)dx²; clopen domain | (√x)′→∞; coefficient at −.02 is −.01, requiring positive-metric cutoff; on complement of clopen domain arbitrary smooth data glue | Route/hypotheses sound | None |
| 3.5 realization headline | Interval metric (1+x)²dx²; disc; closed M | Length ∫₀¹(1+x)dx=3/2 in either extension; disc II=h; ρ̃=1 gives full ambient domain and no boundary | Sound | None |
| 3.6 B comparison and Gauss | Sphere, cylinder, exterior | ⟨−h q,−q⟩=h; K=0+1·1−0=1; cylinder K=0+1·0=0; exterior pairing=−h | Matches supplier conventions | None |
| 4.1 domain geodesics | q=(1,0), v=0,(0,1),(0,2) | \|q+tv\|²=1,1+t²,1+4t²; acceleration=0 for all three; only constant curve stays in ball near tangency | Earlier speed repair holds | None |
| 4.2 second-order headline | Unit ball, exterior, y≥x⁴ | ρ∘γ=−t² gives −2=−\|dρ\|II; exterior +t² gives +2; quartic −t⁴ leaves although II=0 | Both directions of Hessian criterion correct; leaving converse excluded | None |
| 4.3 normal tube and distance neighbourhood | Sphere, exterior, unequal strip radii | Sphere E=(1−r)q, r=1−\|x\|, \|grad r\|=1; exterior r=\|x\|−1. Strip r(.8,0)=.8 but distance=.2; on narrow W′ both agree | §4.3's smaller W′ is essential | R01 in consumer |
| 4.3 normalized cutoff | Off tube; transition region; ε<min(ε₁,1) | ρ̂=−1 outside; transition ρ̂≤max(r,−1); ρ̂≥−ε forces r≥−ε>−ε₁, so ρ̂=r | Earlier enlargement repair survives | None |
| 4.4 metric derivative and distance | Ball R=2; exterior; slanted collar; strip | h_r=(1−r/2)²h gives −h′₀/2=h/2; exterior gives −h; slanted cross term=1; strip distance .2≠.8 | Metric formulas sound; distance domain false | R01 |
| 4.5 convexity-function headline | Disc at q=(0,−1), ε=1/2; exterior; interval | Hess x̃=g, dx̃_q=(0,−2)=−dρ_q; K_c has \|z−q\|²≤2c; exterior Hess=−3g; interval x̃=−x−εx², kernel=0 | Compactness/sign route works, also in dimension one | None |
| 4.6 enlargement | Ball ε=.1; cap R=π/4; unnormalized tail | Radius 1.1, II=h/1.1; cap II=cot(π/4+ε)h; (1−r²)e⁻ʳ² minimum −e⁻² and limit 0⁻ creates exterior component, excluded by ρ̂=−1 | Sound normalization and compact-boundary argument | None |
| 5.1 strata/submersion | Disc, interval, unit tangent rotation | Disc ∂SM torus, glancing two circles; interval μ=±1 on four points, glancing empty; μ(cos s·v+sin s·ν)=sin s, derivative 1 | Regularity and label switch correct | None |
| 5.2 exit scaling/reversal | [a,b], ball zero velocity, annulus | τ(x,1)=b−x, τ(x,−1)=x−a; τ(x,2)=(b−x)/2; τ(x,0)=∞; annulus τ=1.5+√3 versus perturbed limit 1.5 | Correct intrinsic object; all-speed definition matters | R02 in consumer |
| 5.3 fold/even functions | y−t², y−t⁴, cos r, r² | Q=r,a=y gives roots ±√y; fourth-order roots ±y^(1/4) have incompatible splitting order; cos r=Σ(−r²)^k/(2k)!; r² corresponds to H(s)=s | Nondegeneracy and evenness used | None |
| 5.4 exit regularity headline | Disc at bottom point | τ=sinθ+\|sinθ\| has derivatives 0 and 2; τ̃=2sinθ smooth; μ/τ̃=1/2=II/2 | Glancing claims correct | None |
| 5.4 smooth σ,T and Xσ | Ball, interval | σ=−2⟨x,v⟩, T=1−\|x\|², positive root (σ+√(σ²+4T))/2=τ; Xσ=−2 for \|v\|=1; interval σ=a+b−2x | Correct unit-bundle headline | None |
| 5.5 criteria and quantitative bound | Unit ball; nonempty closed M; empty M | X⟨x,v⟩=1, bound (1−(−1))/1=2 on SM; nonempty closed SM has Xf=0 at maximum; empty SM yields three true conditions and singleton function space | Equivalence sound, plan negative Checks false at empty input | R03 |
| 5.5 strict boundary versus trapping | φ(s)=s²−2s; S¹ half-circle; S² hemisphere | b′(1)=e⁻¹, b′(1/√2)=0 gives closed geodesic; S¹ τ=π/2∓θ≤π; S² equator τ=∞ | New negative control and dimension repair hold | None |
| 5.6 scattering/lens headline | Ball, disc, interval, glancing | a=⟨x,v⟩ changes to −a, α²=id; fixed iff a=0; disc ℓ=2√(1−\|w\|²), \|L\|=\|w\|; interval swaps endpoints preserving v; glancing ℓ=0,L=id | Involution, fixed locus and domains correct | None |
| 6.1 ball formula/bounds | R=1, x=0, v=0,e₁/4,e₁ | Actual τ=∞,4,1; unqualified formula gives 1,1,1; diameter bound 2 fails at v=e₁/4 | README unit-ball formula right, plan omits its hypothesis | R02 |
| 6.1 radius and ellipse | R=0; a=2,b=1; a=−1,b=1 | Radius zero dρ=0 at singleton; positive ellipse \|dρ\|=1, II=2=a/b²; negative a gives actual 1 versus formula −1 | Earlier positive-parameter repair holds | None |
| 6.2 half-space/exterior | n=0,1; v=0 and unit tangent | II_half=0, strict iff boundary tangent space zero; exterior ρ(q+tv)=0 or t², II=−h; H=−1 only n≥1 | Correct repaired distinctions | None |
| 6.3 caps/hyperbolic domains | S¹ cap R=3π/4; S² hemisphere; upper half-plane | Arc τ=3π/4∓θ≤3π/2; equator τ=∞; cap II=cosR/sinR·h; hyperbolic Hess components (u/y²,0,u/y²), u−1=(x²+(y−1)²)/(2y)≥0 | Correct dimension/radius hypotheses | None |
| 6.4 small balls | Flat torus, S¹, S², hyperbolic | Torus R<.5 gives II=h/R; S¹ d²=θ² smooth for \|θ\|<π and d(d²)=±2R≠0; S² cotR changes sign at π/2; coth1≈1.313 | Sound local existence and examples | None |
| 6.5 radial metric | φ=−s at r=1,1/2; φ=s²−2s; n=0 | b′/r=−e⁻¹ at1 and e⁻¹⁄⁴ at1/2; latter φ gives e^(r⁴−2r²)(2r²−1)²; n=0 II=0 even when b′(1)<0 | Full/endpoint condition distinction correct | None |

**Pinned declarations opened.** Mathlib pin is 1b1ccf4b088b32fa3f23f2de1127433254a81e1e; Tau Ceti pin is 2fd255d997f47c0b5d834ee416c7015d55444ce5, as recorded in lake-manifest.json. Seventy-one explicit library names from the contracts/prerequisites were located and their declaration text opened, with namespace ambiguities resolved to the geometry/calculus declarations. The table below groups their exact locations; it does not rely on the resolver's library-name result.

| Declaration | Pinned file and line |
|---|---|
| `Bundle.ContMDiffRiemannianMetric` | Mathlib/Geometry/Manifold/VectorBundle/Riemannian.lean:245 |
| `Bundle.ContMDiffRiemannianMetric.hessian_rescale` | TauCeti/Geometry/Manifold/Riemannian/Hessian/Conformal.lean:81 |
| `Bundle.ContMDiffRiemannianMetric.leviCivitaConnection_rescale_apply` | TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Conformal.lean:260 |
| `Bundle.ContMDiffRiemannianMetric.pullback` | TauCeti/Geometry/Manifold/Riemannian/Pullback/Basic.lean:158 |
| `Bundle.ContMDiffRiemannianMetric.rescale` | TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Conformal.lean:87 |
| `Bundle.ContMDiffRiemannianMetric.restrictBoundaryTangentSpace` | TauCeti/Geometry/Manifold/Riemannian/Boundary.lean:115 |
| `Bundle.RiemannianBundle` | Mathlib/Topology/VectorBundle/Riemannian.lean:420 |
| `ContDiff.contDiff_hadamardFactor` | TauCeti/Analysis/Calculus/Hadamard.lean:131 |
| `ContDiff.sub_eq_hadamardFactor_apply` | TauCeti/Analysis/Calculus/Hadamard.lean:115 |
| `ContDiffAt.contDiffAt_implicitFunction` | Mathlib/Analysis/Calculus/ImplicitContDiff.lean:91 |
| `ContDiffAt.implicitFunction` | Mathlib/Analysis/Calculus/ImplicitContDiff.lean:55 |
| `CovariantDerivative.IsLeviCivitaConnection.inner_apply_eq_inner_mvfderiv` | TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Immersion.lean:65 |
| `CovariantDerivative.IsLeviCivitaConnection.uniqueness` | Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:256 |
| `CovariantDerivative.isLeviCivitaConnection_leviCivitaConnection` | Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:409 |
| `CovariantDerivative.leviCivitaConnection` | Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:360 |
| `EuclideanHalfSpace` | Mathlib/Geometry/Manifold/Instances/Real.lean:60 |
| `IsContMDiffRiemannianBundle` | Mathlib/Geometry/Manifold/VectorBundle/Riemannian.lean:68 |
| `IsRiemannianManifold` | Mathlib/Geometry/Manifold/Riemannian/Basic.lean:80 |
| `Riemannian structure on an inner product vector space` |  |
| `Manifold.pathELength` | Mathlib/Geometry/Manifold/Riemannian/PathELength.lean:66 |
| `Manifold.riemannianEDist` | Mathlib/Geometry/Manifold/Riemannian/PathELength.lean:208 |
| `ModelWithCorners.boundary` | Mathlib/Geometry/Manifold/IsManifold/InteriorBoundary.lean:112 |
| `ModelWithCorners.interior` | Mathlib/Geometry/Manifold/IsManifold/InteriorBoundary.lean:103 |
| `ModelWithCorners.isClosed_boundary` | Mathlib/Geometry/Manifold/IsManifold/InteriorBoundary.lean:330 |
| `SmoothPartitionOfUnity` | Mathlib/Geometry/Manifold/PartitionOfUnity.lean:123 |
| `TauCeti.IsOutwardPointing` | TauCeti/Geometry/Manifold/Boundary/Orientation.lean:46 |
| `TauCeti.IsRegularValue` | TauCeti/Geometry/Manifold/RegularValue.lean:92 |
| `TauCeti.Manifold.ContMDiffNondegenerateMetricFamily` | TauCeti/Geometry/Manifold/VectorBundle/NondegenerateMetric/Family.lean:73 |
| `TauCeti.Manifold.ContMDiffNondegenerateMetricFamily.contMDiffAt_christoffelSymbol` | TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Nondegenerate/Family.lean:116 |
| `TauCeti.Manifold.IsGeodesicCurveOn` | TauCeti/Geometry/Manifold/Riemannian/Geodesic/Basic.lean:102 |
| `TauCeti.Manifold.IsGeodesicCurveOnFrom` | TauCeti/Geometry/Manifold/Riemannian/Geodesic/Basic.lean:134 |
| `TauCeti.Manifold.contMDiffOn_maximalGeodesic` | TauCeti/Geometry/Manifold/Riemannian/Geodesic/Flow.lean:117 |
| `TauCeti.Manifold.exists_contMDiffAt_localGeodesicFlow` | TauCeti/Geometry/Manifold/Riemannian/Geodesic/Flow.lean:65 |
| `TauCeti.Manifold.expDomain` | TauCeti/Geometry/Manifold/Riemannian/Geodesic/Exponential.lean:98 |
| `TauCeti.Manifold.geodesicInterval` | TauCeti/Geometry/Manifold/Riemannian/Geodesic/Maximal.lean:107 |
| `TauCeti.Manifold.hessian` | TauCeti/Geometry/Manifold/Riemannian/Laplacian.lean:135 |
| `TauCeti.Manifold.hessian_apply_eq_mvfderiv_sub` | TauCeti/Geometry/Manifold/Riemannian/Laplacian.lean:158 |
| `TauCeti.Manifold.hessian_symm` | TauCeti/Geometry/Manifold/Riemannian/Laplacian.lean:197 |
| `TauCeti.Manifold.inner_mgradient` | TauCeti/Geometry/Manifold/Riemannian/Gradient/Basic.lean:85 |
| `TauCeti.Manifold.isGeodesicallyCompleteAt_of_compactSpace` | TauCeti/Geometry/Manifold/Riemannian/Geodesic/Compact.lean:75 |
| `TauCeti.Manifold.maximalGeodesic` | TauCeti/Geometry/Manifold/Riemannian/Geodesic/Trajectory.lean:76 |
| `TauCeti.Manifold.mgradient` | TauCeti/Geometry/Manifold/Riemannian/Gradient/Basic.lean:73 |
| `TauCeti.Manifold.riemannianExp` | TauCeti/Geometry/Manifold/Riemannian/Geodesic/Exponential.lean:104 |
| `TauCeti.ModelWithCorners.mem_boundary_euclideanHalfSpace_iff_of_mem_atlas` | TauCeti/Geometry/Manifold/Boundary/Charts.lean:107 |
| `TauCeti.SmoothEmbedding.exists_isClosedEmbedding_normalExp_norm_le_subset` | TauCeti/Geometry/Manifold/TubularNeighborhood/Riemannian/Noncompact.lean:58 |
| `TauCeti.SmoothEmbedding.exists_partialDiffeomorph_normalExp_subset` | TauCeti/Geometry/Manifold/TubularNeighborhood/Riemannian/Coordinates.lean:89 |
| `TauCeti.SmoothEmbedding.normalExp` | TauCeti/Geometry/Manifold/TubularNeighborhood/Riemannian/Basic.lean:113 |
| `TauCeti.UpperHalfSpace` | TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/UpperHalfSpace/Basic.lean:91 |
| `TauCeti.UpperHalfSpace.hasConstantSectionalCurvature` | TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/UpperHalfSpace/Curvature.lean:139 |
| `TauCeti.UpperHalfSpace.hyperbolicMetric` | TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/UpperHalfSpace/Metric.lean:41 |
| `TauCeti.boundary_scalarRegularSublevel` | TauCeti/Geometry/Manifold/RegularValue/Scalar/Sublevel.lean:652 |
| `TauCeti.contDiff_intervalIntegral` | TauCeti/Analysis/Calculus/ParametricIntegral.lean:211 |
| `TauCeti.exists_isOutwardPointingField` | TauCeti/Geometry/Manifold/Boundary/OutwardExistence.lean:75 |
| `TauCeti.interior_scalarRegularSublevel` | TauCeti/Geometry/Manifold/RegularValue/Scalar/Sublevel.lean:675 |
| `TauCeti.isManifold_boundary` | TauCeti/Geometry/Manifold/Boundary/Charts.lean:321 |
| `TauCeti.isManifold_regularLevel` | TauCeti/Geometry/Manifold/RegularValue/Level.lean:435 |
| `TauCeti.isManifold_scalarRegularSublevel` | TauCeti/Geometry/Manifold/RegularValue/Scalar/Sublevel.lean:639 |
| `TauCeti.isManifold_sphereBundle` | TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Sphere.lean:161 |
| `TauCeti.isOutwardPointing_iff_tangentCoordChange` | TauCeti/Geometry/Manifold/Boundary/Orientation.lean:63 |
| `TauCeti.isSmoothEmbedding_coe_regularLevel` | TauCeti/Geometry/Manifold/RegularValue/Level.lean:485 |
| `TauCeti.isSmoothEmbedding_coe_sphereBundle` | TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Sphere.lean:181 |
| `TauCeti.isSmoothEmbedding_subtypeVal_boundary` | TauCeti/Geometry/Manifold/Boundary/Charts.lean:374 |
| `TauCeti.mfderiv_subtypeVal_boundary` | TauCeti/Geometry/Manifold/Boundary/Derivative.lean:64 |
| `TauCeti.nonempty_contMDiffRiemannianMetric` | TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Existence.lean:69 |
| `TauCeti.regularLevelChartedSpace` | TauCeti/Geometry/Manifold/RegularValue/Level.lean:234 |
| `TauCeti.scalarRegularSublevelChartedSpace` | TauCeti/Geometry/Manifold/RegularValue/Scalar/Sublevel.lean:473 |
| `TauCeti.sphereBundleChartedSpace` | TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Sphere.lean:143 |
| `TauCeti.sphereRoundMetric` | TauCeti/Geometry/Manifold/Riemannian/Sphere/Basic.lean:61 |
| `TauCeti.tangentCoordChange_normal_pos` | TauCeti/Geometry/Manifold/Boundary/TransitionNormal.lean:36 |
| `exists_contMDiffSection_forall_mem_convex_of_local` | Mathlib/Geometry/Manifold/PartitionOfUnity.lean:593 |
| `exists_contMDiff_zero_iff_one_iff_of_isClosed` | Mathlib/Geometry/Manifold/PartitionOfUnity.lean:797 |
| `modelWithCornersEuclideanHalfSpace` | Mathlib/Geometry/Manifold/Instances/Real.lean:200 |

The relevant native definitions do not supply extra hypotheses silently: `EuclideanHalfSpace` constrains coordinate zero; `IsRegularValue` permits empty fibres; `IsGeodesicCurveOn` imposes unique within-derivatives, C² regularity and zero acceleration, but no unit/nonzero speed; `riemannianEDist` is extended-valued and does not impose connectedness; `ContMDiffNondegenerateMetricFamily` does not impose positivity, which §2.3 adds explicitly. The normal-tube theorem's Nonempty binder is only for a total partial inverse and is bypassed by the empty-core case. Global tube/partition arguments use the second-countable hypotheses recorded in plan targets 4.3.1–4.4 and the README's conventions on those arguments. No completeness hypothesis is silently added to the closed-tube theorem. The boundary metric's evaluation law was also opened at TauCeti/Geometry/Manifold/Riemannian/Boundary.lean:146.

**Headline acceptance test and padding.** The Summary explicitly names seven groups: §2.2 Hessian characterization, §3.5 isometric regular-domain realization, §4.2 second-order leaving, §4.5 convexity functions, §5.4 exit-time regularity, §5.5 non-trapping equivalences and §5.6 scattering involution/fixed points. Native half-space manifolds, boundary tangent spaces, Hessians, regular sublevels, geodesic predicates/flow and sphere bundles exist at the pins. Real-bodied boundary-defining/II predicates, a supremum of geodesic witnesses for τ, and derived σ/odd-exit/scattering definitions provide a credible signature route. This is a statement-level feasibility check, not a claim to have elaborated those signatures. At package stage all seven groups need native headline signatures or an individual missing-carrier explanation; examples and API identities are not substitutes.

There is no Suggested.lean in this design. The one-tactic probe therefore has **zero sorried declarations** to test; binder `#check`, import, namespace, declaration-docstring, sorry'd-data and `set_option` audits have zero local Lean declarations to inspect. No padding or missing-signature finding is inferred merely from the absent package-stage file. Elaboration: **not available (this lane does not elaborate; say so in the report)**. No Lean command was run, no passing elaboration is claimed, and no “sorry-only warnings” result is available.

## Not verifiable

- lee-riemannian2018, Chapters 5–8; lee-smooth2012, Theorem 9.25; sharafutdinov1994, Chapter 4: the manifest settles these as uncertified. Their theorem/page contents could not be read. They were not fetched again or put in a new reference request. Computations and named supplier contracts are independent evidence, not certification of these books.
- The arXiv locators were checked against the exact cached versions specified by the manifest, not independently against the typeset journal editions. PSU was checked against the recorded author copy; the manifest's assertion of agreement with the publisher edition was not independently recertified.
- No Lean elaboration or expanded binder types: this is the design lane and it explicitly does not elaborate. Suggested.lean does not exist here.
- Open-work ownership was checked against the available tool index/heads and the supplied package index. Unprovided or later heads were not independently sought. MathematicalBilliards occurs in the merge order but `roadmaps show` provided no main/open text; the design does not cite it as a supplier, so this is no supplier defect.

## Source issues

- **Misprint** in paternain-salo-uhlmann2023 at Corollary 2.5.3(b), printed p. 47 (line 2480): the source says the derivative is tested at radius 1; it should be tested at the outer endpoint r₁; affects a stated result.
- **Misprint** in paternain-salo-uhlmann2023 at Lemma 3.2.11, printed p. 64 (line 3029): the source says the second exit-time factor has argument x−v; it should be the pair (x,−v); affects a stated result.
