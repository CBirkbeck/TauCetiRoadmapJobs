# Review of HyperbolicDynamicsAndThermodynamicFormalism (design, round 2)

**Verdict:** needs changes

Reviewed the 65 targets, their APIs and Checks, the 11 layers, all supplier contracts, the plan and the manifest. There are 27 findings: 4 P1, 13 P2 and 10 P3. The architecture is repairable. The principal new obstruction is the false open-cover pressure formula, not the choice of the Bowen-criterion route. No design or source-manifest entry was changed.

## Previous findings, checked individually

Locations below are in `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/README.md`, abbreviated **D** in the rest of this report. **P** abbreviates `packages/HyperbolicDynamicsAndThermodynamicFormalism/design/plan.json`. These abbreviations always denote these repository-relative files.

| Previous finding | Repaired passage and verification | Result |
|---|---|---|
| F01 | D:621: “If T is expansive and ε is below an expansivity constant”. This excludes the identity of an interval. However, the newly supplied smaller-scale containment has the wrong translation, and the new ε=1 Check uses closed-ball arithmetic for open balls. | Partly repaired; R02, R15. |
| F02 | D:692: “the shadowing point is unique when 2β ≤ δ*”. At δ*=1/2, β=1/4 gives 2β=δ*, whereas β=1 permits every point of the two-shift. | Repaired. |
| F03 | D:80: “the inequality for two arbitrary finite partitions is §3.2 of this roadmap”; D:386 states the join argument. The general inequality is now owned here. P:3084 still attributes “sup over finite partitions and conditional inequality” to ArithmeticDynamics without distinguishing the truncation case. The repair also re-owns its supplier's conditioning-monotonicity theorem. | Partly repaired; R06, R07. |
| F04 | D:1072: “a nonempty locally maximal hyperbolic set”. The basic-set targets exclude ∅, consistently in P. Searching for the same pattern finds missing nonemptiness elsewhere. | Repaired at the original locations; R09 covers the remaining pattern. |
| F05 | D:185: “An entropy-expansive map of a compact metric space has finite entropy”; D:204 explicitly concludes finite flow entropy; D:1103 supplies it before §4.9. BowenEntropyExpansive1972 lines 192–201 support the scale equality. | Repaired; R07 identifies an already available ingredient of its proof. |
| F06 | D:544: “No finiteness of h_top(T) is assumed”. The upper-semicontinuous extended-valued maximum argument works. The new illustrative sequence is not correctly specified. | The theorem is repaired; new Check defect R16. |
| F07 | D:315 distinguishes “Theorem 9.7” from “Theorem 9.8”. The requested textual change is present. Walters1982 is still settled as uncertified. | Textually repaired; numbering not independently certified. |
| F08 | D:163: “Its API”; D:119: “closed, and compact when X is compact”. These repair the shape and hypothesis. The added assertion about ℝ is false. | Partly repaired; R14. |
| F09 | D:928: “it concerns an equilibrium, not a sequence of maps, and is not consumed”. Opened Tau Ceti's LyapunovPerron/Basic.lean:529 and Local.lean:154 at the manifest pin. Both named constructions exist. | Repair report's dispute is justified and settled; not re-raised. |
| F10 | D:51–55 include `MeasureTheory.MeasurePreserving`, the regular representative, `Continuous.inner_bundle`, `extChartAt`, `fderiv` and `ContractingWith`. Their pinned definitions were opened. | Repaired. |
| F11 | D:98–99 contain both gap slugs; P has the same slugs and the connection-map initial data and domain conditions. The sphere embedding is actually supplied at the pin. | Declaration/hypotheses repaired; minimality fails, R26. |
| F12 | D:23: “the open d_T-balls of radius ε about its points are pairwise disjoint”. This is now an explicit convention, with the factor-two comparison. | Repaired. |
| F13 | D:161,165: “nonempty compact Hausdorff”; empty-space t=0 is explicitly excluded. EReal gives 0·⊥=0, whereas the empty-space entropy is ⊥. | Repaired. |

## R01 (P1) — The supremum over open covers gives the wrong pressure

**Location:** D:306, §2.2; P:590, target 2.2. Quote: “the supremum over finite open covers 𝒰”.

**Claim:** Taking that supremum of weighted subcover growth, with a supremum of the potential on each member, equals separated-set pressure.

**Witness:** Let X={p} ⊔ {0,1}^ℤ, T(p)=p, and φ(p)=2, φ|shift=0. The cover U_i={p}∪{x:x₀=i} has weighted growth 2+log 2; separated pressure is max(2,log 2)=2.

**Repair:** Use the limit over arbitrarily fine finite open covers, with an explicit entourage/oscillation criterion, rather than the supremum over all covers. Preserve the full compact Hausdorff statement. In this example the refining cover separating p from the two shift cylinders has sum e^(2n)+2^n and growth 2. Update the definition/comparison in P and the §2.2 Checks.

## R02 (P1) — Two orbit-window translations have the wrong sign

**Location:** D:119 and D:621. Quotes: “T^{−n}B_{2n+1}(T^n x, ε)” and “T^{−N}B_{n+2N}(T^{−N}x, ε)”.

**Claim:** The first intersection describes two-sided closeness; the second containment transfers Gibbs bounds to smaller scales.

**Witness:** For the left two-shift, x=0 and y with its sole 1 at coordinate −1, the first intersection at ε=1/2 contains y, but d(T⁻¹x,T⁻¹y)=1. Its windows are [n,3n], not [−n,n].

**Repair:** Write Γ_ε(x)=⋂_(n≥0) T^n(closed B_(2n+1)(T^(−n)x,ε)). In §5.1 use T^N B_(n+2N)(T^(−N)x,ε)⊆B_n(x,ε′), with N chosen by uniform expansivity. Its window is [−N,n+N−1]. Add explicit shift-window Checks and update corresponding plan APIs. The corrected Γ excludes y; the corrected smaller-scale set excludes a discrepancy at time 0. The existing two-sided-ball expression later in D:621 already has the correct sign.

## R03 (P2) — A continuous metric does not define the geometric potential

**Location:** D:27,1137–1151; P:2844. Quote: “Norms on tangent spaces come from a continuous Riemannian metric”.

**Claim:** For the permitted metric, −d/dt log λ_t exists and is Hölder for every C² flow.

**Witness:** On a cat suspension rescale a smooth metric by e^(2u), u(s)=|sin(2πs)|. Along its one-dimensional unstable bundle, log λ_t=at+u(s+t)−u(s). At s=0 its left/right derivatives are a−2π and a+2π.

**Repair:** Explicitly use a smooth Riemannian metric for the differential geometric potential and distortion statements in Layer 11, as BowenRuelle1975 line 92 does. Keep metric-independence of hyperbolicity for continuous metrics. State the regularity needed for the metric-change coboundary, and update P's hypotheses. The cusp metric then remains valid for §7 but is excluded from the derivative assertion; smooth u gives the required derivative.

## R04 (P2) — Metric-truncated stable sets need not be smooth closed discs

**Location:** D:932,944 and the metric-ball descriptions in D:936,1019; P:2255. Quote: “the set W^s_ε(x) ... is an embedded C^r disc”.

**Claim:** Cutting a stable manifold by all the specified closed distance inequalities gives a smoothly embedded closed disc, in the fixed smooth metric.

**Witness:** For the sink B=((1/2,1),(0,1/2)), let v be the unit vector proportional to (1,√7−2). Then |v|=|Bv|=1, |B²v|≈0.764618; the two active boundary normals have determinant √7/4≠0.

**Repair:** State existence of smooth local plaques, with W^s_(ε₁)(x) contained in the plaque and the plaque contained in W^s_(ε₂)(x), plus contraction, tangency, invariance and continuous dependence. Do not identify a smooth closed-ball parametrisation with an arbitrary metric cutoff. Apply the same distinction to strong/weak flow plaques and §9.1. For the displayed sink, every sufficiently small cutoff has the same corner after scaling, while an appropriately chosen ellipsoidal plaque is smooth. This also avoids the corners of a closed weak plaque formed as a product of a strong disc and a closed time interval.

## R05 (P2) — Bounded distortion leaves the plane tolerance unquantified

**Location:** D:1155; P:2899. Quote: “a plane E* at y tangent to a disc close to the unstable disc”.

**Claim:** The stated orbit tolerance alone gives distortion between e^(−θ) and e^θ for the unspecified nearby plane.

**Witness:** At y=x for the linear suspension, take a plane spanned by (1,b) in unstable/stable coordinates. The ratio is √(1+b²e^(−4aT))/√(1+b²). For b=0.1 its limit 0.995037 is below e^(−0.001)=0.9990005.

**Repair:** Quantify a Grassmann/cone tolerance depending on θ, and state the precise chart and orbit/cone hypotheses, including T≥0 and the dimension of E*. BowenRuelle1975 A.4, lines 718–733, uses the tangent plane of a specified chart slice and verifies its iterated closeness. Own any wider cone variant as a precise theorem. On the test plane, choosing b²≤e^(2θ)−1 gives the required lower bound; shrinking only the base-orbit tolerance does not.

## R06 (P1) — The finite-entropy supplier name has disappeared at its head

**Location:** D:72,399,480 and P:3084. Quote: “`finitePartitionEntropy`”.

**Claim:** GeometryOfNumbersAndQuadraticArithmetic §4.2 supplies that named declaration; the plan still attributes an unrestricted conditional inequality to ArithmeticDynamics.

**Witness:** PR #851, `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md`:1362, imports finite entropy as ProbabilisticAndMetricNumberTheory §5.1a's labelEntropy/condLabelEntropy. No finitePartitionEntropy occurs at that head. PR #1335, `TauCetiRoadmap/ArithmeticDynamics/README.md`:2518, states its inequality only for truncations.

**Repair:** Cite the finite-label objects and chain rule from ProbabilisticAndMetricNumberTheory §5.1a, PR #1421's `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md`:6743, and keep countable entropy, rate and measure entropy at GeometryOfNumbersAndQuadraticArithmetic §4.2. Correct every contract/Needs occurrence and P's supplier summary; the arbitrary finite-partition rate inequality remains §3.2 here. A fair-bit label then computes log 2 through the actual supplier names. Both suppliers precede this candidate.

## R07 (P2) — The repair re-plans supplied conditioning monotonicity

**Location:** D:386 and D:185. Quote: “decreases when the conditioning is refined ... proved here”.

**Claim:** Conditioning monotonicity is newly proved here; the finite entropy at a fixed scale is also reconstructed instead of citing its pinned statement.

**Witness:** PR #1335, `TauCetiRoadmap/ArithmeticDynamics/README.md`:2562, already states that enlarging the conditioning σ-algebra decreases entropy. Mathlib `Dynamics.coverEntropyEntourage_finite_of_isCompact_invariant`, `Mathlib/Dynamics/TopologicalEntropy/CoverEntropy.lean`:418, already supplies fixed-scale finiteness.

**Repair:** Import the conditioning monotonicity from ArithmeticDynamics §2.7 and the exact native fixed-scale theorem. Remove their ownership/proof promises here, add them to the contracts and Needs, and retain the genuinely new rate inequality and entropy-expansive equality. The fair-bit comparison remains H(P|trivial)=log 2≥H(P|P)=0; fixed-scale entropy for the identity remains 0<∞.

## R08 (P1) — Newhouse is an unowned proof input

**Location:** D:557,1212; P:1272. Quote: “State, without proof, Newhouse's theorem”.

**Claim:** A finished library can supply this theorem to downstream consumers while its proof and all Yomdin inputs remain outside the roadmap and have no named owner.

**Witness:** P target 4.7 has only targets 3.1 and 4.6 as prerequisites and explicitly says “Proof outside the roadmap”. Those targets define invariant measures and deduce existence from upper semicontinuity; neither proves upper semicontinuity for smooth maps.

**Repair:** Make §4.7 a genuine theorem with explicit owned local-entropy/Yomdin milestones and their prerequisites, or obtain a precise named supplier contract for that proof. A source citation is not a formal supplier. Remove the “without proof” promise. The identity, whose entropies are 0, remains a Check; it cannot discharge the general smooth-map theorem. This is a local ownership repair, not grounds to reject the whole roadmap.

## R09 (P2) — Nonemptiness was repaired only for basic sets

**Location:** D:557,573,896,1032 and D:229. Quote: “it is nonempty and compact when ... upper semicontinuous”.

**Claim:** Equilibrium measures exist for a flow on any compact metric space satisfying upper semicontinuity; related nonmixing/non-Anosov assertions also allow empty carriers.

**Witness:** On X=∅, M(g)=ES_g(F)=∅ and upper semicontinuity holds vacuously. On the empty manifold both Anosov definitions hold vacuously, and the empty suspension is topologically mixing because there are no nonempty open sets.

**Repair:** Add nonemptiness precisely to the existence clauses of §§4.7–4.8, the assertion that a time map of an Anosov flow is not Anosov, and the nonmixing suspension claims. Keep the definitions and empty-space pressure conventions general. Mirror the hypotheses in P. The empty instance then remains available to definitions but no longer receives a nonexistent probability measure or a false nonmixing conclusion.

## R10 (P2) — Zero radii and a zero Lipschitz constant break the ball API

**Location:** D:22,111–118; P:16. Quote: “h maps B^S_n(x, ε) into B^T_n(hx, Lε)”.

**Claim:** The open-ball and entourage identities and transport statements hold with no positive-radius or positive-L guard; the flow/time-map comparison has no n≥1 guard.

**Witness:** For a constant semiconjugacy, L=0, n=1, ε=1, its nonempty image cannot lie in B_1(hx,0)=∅. At ε=0 the metric B_0 is empty but dynEntourage at n=0 is universal.

**Repair:** Specify ε>0 throughout this API; require L>0 for the exact open radius Lε, or use any larger positive bound. Require n≥1 in the flow/time-map containment and t≥0 for d_t. Distinguish map d_0=0 from flow d_0=d: the latter's ball is the ordinary ε-ball. Test the constant map using L′=1 and the singleton at radius zero. These changes preserve the intended positive-scale entropy limits.

## R11 (P2) — The inverse-sequence conclusion lacks invertibility

**Location:** D:920; P:2219. Quote: “applying this to the inverse sequence gives the stable family”.

**Claim:** The stated C¹ maps admit inverse sequences satisfying the corresponding graph-transform assumptions.

**Witness:** f_n(x,y)=(2x,0) has A_n=2, B_n=0, zero nonlinearities, μ=2 and λ=1/2. It satisfies every displayed hypothesis, but sends all (0,y) to (0,0) and has no inverse.

**Repair:** Keep the unstable theorem for its stated map class. State the stable conclusion separately for local diffeomorphisms whose inverse sequences satisfy the corresponding bounds, with domains specified. This is exactly the additional restriction in ClimenhagaPesin2016 Remark 11.2, lines 1841–1843. The witness continues to have its unstable graph y=0 and receives no inverse-sequence conclusion.

## R12 (P2) — A smooth observable need not be differentiable along a continuous flow

**Location:** D:591. Quote: “on a manifold every C¹ function ψ qualifies”.

**Claim:** Under §4.9's standing assumption of only a continuous flow, every C¹ observable has continuous L_gψ=dψ(X).

**Witness:** Conjugate circle rotation by a homeomorphism whose local coordinate is s↦s^(1/3). Then g^t(0)=t^(1/3) near zero. A smooth observable equal to the local coordinate has no finite derivative along that orbit at zero.

**Repair:** Qualify the clause by a C¹ flow, or by existence of a continuous generator and differentiable orbit maps. Keep the general continuous-flow theorem with its already explicit differentiability-along-g hypothesis. For ordinary rotation and ψ=sin(2πs), L_gψ=2πcos(2πs); for the conjugated flow the extra clause no longer applies.

## R13 (P2) — Infinite entropy invalidates the component-at-least-average step

**Location:** D:496. Quote: “some ergodic component has free energy at least that of μ”.

**Claim:** Entropy integration always supplies such a component, including when hμ=∞.

**Witness:** Compactify disjoint full shifts on 2^(2^n) symbols, n≥1, by one fixed point, with component diameters tending to zero. Give their uniform measures weights 2^(−n). Each component entropy is finite; the mixture entropy is Σ log 2=∞.

**Repair:** Prove the ergodic supremum using every finite threshold a below the free energy: some component has free energy greater than a. Do not assert attainment at an infinite average. The example has components exceeding every finite a, so the desired supremum equality survives without narrowing the theorem to finite entropy.

## R14 (P3) — The new noncompactness Check is false

**Location:** D:119. Quote: “For the identity of ℝ it is the closed ε-ball, closed but not compact”.

**Claim:** A finite-radius closed ball in ℝ is not compact.

**Witness:** For ε=1 and x=0, Γ_1(0)=[−1,1], a compact interval. Noncompactness of the ambient space does not imply noncompactness of its closed balls.

**Repair:** Keep the repaired compact-X theorem. Replace this negative control by the identity on ℓ²: the closed unit ball contains the unit vectors at pairwise distance √2 and is not compact. Alternatively use the identity on ℚ and its bounded closed rational interval. Change the corresponding plan Check if added there.

## R15 (P3) — The new Gibbs Check uses a closed ball at an open radius

**Location:** D:629; P target 5.1's added test. Quote: “ε = 1, every Bowen ball is [0, 1]”.

**Claim:** At that scale every probability measure on [0,1] is Gibbs with K=1.

**Witness:** For the identity and x=0, B_n(0,1)=[0,1). The measure δ₁ assigns it mass 0, contradicting the claimed lower bound 1.

**Repair:** Use ε=2. All open balls then equal [0,1], the Gibbs product is exactly 1, and δ₀ and δ₁ are the required mutually singular Gibbs measures. This retains the intended negative control for F01.

## R16 (P3) — The infinite-entropy sequence does not specify a collapsing support

**Location:** D:551. Quote: “product measures on 2^k equally spaced values ... converging to a point mass”.

**Claim:** The natural uniform grids in [0,1] yield that weak limit.

**Witness:** Uniform grids j/(2^k−1), 0≤j<2^k, have coordinate second moment tending to 1/3 and first moment 1/2. Their limit is Lebesgue, not a point mass, whose second moment would be 1/4 at mean 1/2.

**Repair:** Specify the alphabet {j/2^(2k):0≤j<2^k}. Its maximum tends to 0, its uniform Bernoulli measure has entropy k log 2, and the product measures converge to δ_(0^ℤ). This supplies the claimed failure of upper semicontinuity without changing the repaired existence theorem.

## R17 (P3) — Arbitrary period-n orbit measures do not approach the fair Bernoulli measure

**Location:** D:431, §3.4. Quote: “The normalised orbit measures of the periodic points of period n ... converge”.

**Claim:** These orbit measures converge to Bernoulli(1/2,1/2) as the period grows.

**Witness:** The orbit of (10^(n−1))^ℤ has least period n and assigns mass 1/n to {x₀=1}. Its measures converge to δ_(0^ℤ), not the fair Bernoulli measure, which assigns mass 1/2.

**Repair:** Say “the uniform probability on Fix(T^n)”, or specify an appropriate equidistributing sequence of individual orbits. For the first repair, every fixed finite word of length m has probability 2^(−m) once n≥m; each approximating measure has entropy 0 and the limit entropy is log 2. Mirror the Check in P.

## R18 (P3) — The irrational linear flow satisfies F3 vacuously

**Location:** D:751,800; P target 6.5. Quote: “fails (F3)”.

**Claim:** Preserved transverse distances violate the contraction axiom for the strong stable/unstable sets defined using convergence.

**Witness:** For the irrational translation flow on the flat two-torus, both strong sets are {x}. F3 tests only y=x and reads 0≤ce^(−κt)·0=0. F2 fails for nearby points off the same orbit segment.

**Repair:** Replace “fails F3” by “satisfies F3 vacuously but fails F2” in the Check and layer example. Retain the convergence condition in the definition. This makes the example distinguish the product axiom from exponential contraction.

## R19 (P3) — Suspension examples silently assume a special metric

**Location:** D:1148,1171,1196,1203. Quotes: “with the flat metric” and “the normalised Riemannian volume itself”.

**Claim:** The chosen arbitrary metric on the cat mapping torus has λ_t=exp(at), constant geometric potential and invariant product volume.

**Witness:** Rescale a compatible suspension metric by e^(2u(s)), u(s)=0.1sin(2πs). Then λ_t=exp(at+u(s+t)−u(s)), φ^u=−a−u′(s), and three-dimensional volume has density e^(3u(s)), which rotation of s does not preserve.

**Repair:** Specify a smooth compatible metric in stable/unstable eigen-coordinates: ds²+e^(2as)du²+e^(−2as)dv², a=log((3+√5)/2). It descends under the mapping-torus gluing, has product volume and yields λ_t=e^(at). Do not call it flat. Under arbitrary smooth metrics retain the coboundary relation and equality of measure classes, not equality with normalised Riemannian volume. Record which ratio defines ψ, so φ_new=φ_old−L_g log(volume_new/volume_old).

## R20 (P3) — The toral example omits the zero-dimensional case

**Location:** D:1026; P target 9.1. Quote: “hyperbolic toral automorphisms need n ≥ 2”.

**Claim:** The matrix hypotheses exclude every dimension below 2.

**Witness:** The 0×0 matrix has determinant 1 and no eigenvalues. The torus (ℝ/ℤ)^0 is a point; its identity is analytic, mixing and Anosov with zero tangent space, and the entropy sum is 0.

**Repair:** Retain n=0 in the general theorem. Say that positive-dimensional hyperbolic toral automorphisms require n≥2, and add the point-torus Check with determinant 1 and entropy 0. Dimension 1 remains excluded by the eigenvalues ±1.

## R21 (P2) — Definition targets and their later API proofs form hidden dependency cycles

**Location:** D:675,705,816,868 and the corresponding P prerequisites. Quote: “coincide by §6.2's expansivity”.

**Claim:** Each target, including its API, is supplied in the stated dependency order.

**Witness:** Target 6.1's bracket-uniqueness API invokes 6.2, whose Needs includes 6.1. Likewise 7.1's finite-union API invokes 7.4, whose Needs includes 7.1. P omits both forward API edges rather than resolving them.

**Repair:** Separate definitions from these derived APIs, or move the requisite direct proofs earlier. For example, prove the δ* expansivity estimate directly from A3 in 6.1 before bracket uniqueness; have 6.2 import it. Move finite unions after splitting uniqueness. Update P to the actual acyclic target graph. For two bracket points the direct calculation d(y,y′)≤cλ^nδ*→0 removes the later dependency.

## R22 (P3) — A defined object lacks an API and a theorem lacks a locator

**Location:** D:956 and D:980. Quotes: “Call a hyperbolic set Λ of f locally maximal” and “Prove: (a) if f is a C¹ Anosov diffeomorphism”.

**Claim:** All definitions and theorems satisfy the required shape.

**Witness:** Section 8.4 introduces locally maximal sets but has no API list for that definition. Section 8.6 gives an original proof programme and Checks, but no literature locator for its nontriviality theorem.

**Repair:** Give local maximality a prose API (isolating neighbourhood, restriction/conjugacy behaviour, and the product-structure comparison), keeping its existing discriminating Checks. Supply an exact legal-source locator for §8.6, or a precisely identified derivation from named earlier targets with each new intermediate estimate explicitly owned. For a point sink the local maximality API must hold although the global Anosov nontriviality conclusion does not apply.

## R23 (P2) — The plan changes conditional absolute continuity into existence

**Location:** P:3023, target 11.5, compared with D:1191. Quote: “the only absolutely continuous invariant probability”.

**Claim:** The SRB measure itself is always an absolutely continuous invariant probability.

**Witness:** BowenRuelle1975 lines 470–472, Remark 5.2, printed p.192, assumes an absolutely continuous invariant probability and concludes that it equals the equilibrium measure. It does not assert that such a probability exists. D:1191 correctly preserves this implication.

**Repair:** Make P agree with D: every invariant probability absolutely continuous with respect to m equals μ⁺; no absolute continuity of μ⁺ is asserted. The product-volume suspension satisfies the implication with equality. The statement must also allow the absence of any absolutely continuous invariant probability.

## R24 (P3) — The adapted-metric Check uses a rate that is not a hypothesis instance

**Location:** D:890. Quote: “The rate itself cannot be kept”.

**Claim:** The Jordan example disproves retaining the given hyperbolicity rate λ.

**Witness:** For J=((1/2,1),(0,1/2)), 2^n|J^n(0,1)|=√(4n²+1) is unbounded. Thus λ=1/2 is not a rate with any finite C in the premise. At λ=3/4, a suitable inner product does give a one-step contraction.

**Repair:** Reword the Check as the distinction between spectral radius and an admissible uniform rate. Do not present it as a counterexample under the theorem's hypotheses. For instance, scaling the first coordinate sufficiently makes the off-diagonal entry small and the operator norm less than 3/4; λ′>3/4 then satisfies the stated theorem.

## R25 (P2) — Abstract local product structure supplies no linear time-shift modulus

**Location:** D:776, §6.7. Quote: “with |v| ≤ Cε”.

**Claim:** F2 and F3 give a time shift bounded linearly by ambient distance for every continuous flow in §6.5.

**Witness:** On a circle conjugate rotation by H with H(s)=s³ near 0. Strong sets are singletons, so F2 and F3 hold. For x=0 and z=g^v x, d(x,z)=|v|³; no fixed C bounds |v| by C|v|³.

**Repair:** Use F2 with a chosen δ and its e(δ), obtaining |v|≤δ. The coboundary-in-time error is then at most 2δ·max|φ|, sufficient for the Bowen property, alongside the geometric integral estimates. Keep the abstract continuous-flow generality. The cubic example satisfies the corrected bound without acquiring a false Lipschitz time coordinate.

## R26 (P2) — The sphere-bundle gap asks for an existing pinned construction

**Location:** D:98; P gap `sphere-bundle-embedding`. Quote: “the inclusion is a smooth embedding”.

**Claim:** The supplier must newly provide the smooth sphere-bundle manifold and embedding.

**Witness:** At Tau Ceti pin 2fd255d9, `TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Sphere.lean`:143,161,181 defines sphereBundleChartedSpace and proves isManifold_sphereBundle and isSmoothEmbedding_coe_sphereBundle for a positive smooth radius, including radius 1.

**Repair:** Import these constructions by exact names and hypotheses. Narrow the declared gap to any still-missing smooth corestriction theorem for this native atlas; do not ask TangentialBordism to rebuild the embedding. Closedness follows from the continuous squared-norm equation. On a rank-two trivial bundle the native unit sphere is the usual circle with its smooth inclusion; rank zero gives the empty regular level. Keep the connection-map gap, which this audit did not find supplied.

## R27 (P3) — Two certified source descriptions point to different mathematics

**Location:** D:111,739. Quote: “BowenRuelle1975, lines 99–101, use closed balls with k ∈ [0, n]”.

**Claim:** That passage gives the discrete convention; lines 303–307 support the abstract flow product axioms.

**Witness:** BowenRuelle1975 lines 99–101 define continuous-time distance and closed flow balls, printed p.183. Lines 303–307 concern exceptional sets of the symbolic coding map, printed p.188, not F2/F3.

**Repair:** Cite lines 163–164, printed p.184, for the discrete separated-set indexing, and 99–101 for flow balls. Cite 96–108 only for stable/unstable-set notation; identify F2/F3 explicitly as this roadmap's abstraction and give the proper local-product/contraction locator for its verification in §8.5. Do not silently certify the currently uncertified FH2019 text. The corrected citations still support the n=1 versus n=2 doubling-map Check.

## Verified sound

**Coverage and principles.** All 65 target statements and their plan counterparts were read; the plan contains 201 Checks and 20 targets classified as definitions, plus constructions inside theorem targets. The 11 layer endings each have Examples and Dependencies; there are 65 Needs lines. The preceding review's computed rows were used only for unchanged assertions with actual values or formulas, and the sampled sections and all repair additions were recomputed. In particular, the prior rows about the closed real interval and the Gibbs ε=1 example were not accepted as evidence: their computations are wrong. New constructions not adequately covered by that table were inspected, including §2.2's weighted cover formula and §§8.2–8.3's precise plaque claim.

The general ownership and weak-specification route are appropriate; they preserve nonmixing systems. No copied source passages, executable algorithm targets, forbidden supplier, machine path, pull-request number, `set_option`, or sorry'd data was found in the design. R07, R08, R21 and R26 are the ownership/proof-order exceptions. A reference to a proof in a book was not treated as a formal supplier.

**Computed adversarial table.** Here T is the left shift; a=log((3+√5)/2)=0.9624236501. These rows cover all 15 seeded targets, headline theorems and every finding's target. A “pass” is for the assertion tested, not approval of every other sentence in the same section.

| Statement | Instances tried | Computed left/right values | Result; change |
|---|---|---|---|
| §1.1 map distance/indexing | doubling circle, ε=1/8, n=1,2 | radii 1/8 and 1/16; k≤n would give 1/16 and 1/32 | Pass for positive radius. |
| §1.1 Γ formula | x=0, y has 1 only at −1 | displayed intersection accepts y: d(T^k x,T^k y)=2^(−k−1)≤1/2 for k≥0; Γ rejects: distance at k=−1 is 1 | R02. |
| §1.1 smaller-scale Gibbs containment | x=0, y has 1 at 0, N=3, ε=1/2, ε′=1/8, n=1 | wrong translated ball tests k≥3 and sees distances ≤1/8<1/2; target B_1 sees 1>1/8 | R02; T^N image tests time 0. |
| §1.1 boundary API | singleton; ε=0; constant h, L=0 | metric B_0(0)=∅ versus entourage ball X; image {pt} versus B_1(pt,0)=∅ | R10. |
| §1.1 flow n=0 | circle rotation, ε<diameter | B_flow,0 is ordinary ε-ball, B_map,0=X | R10; n≥1. |
| §1.1 compactness control | id on ℝ, ε=1; id on ℓ² | [−1,1] compact; ℓ² unit vectors have pairwise distance √2 | R14. |
| §1.2 open-cover entropy | two-shift, coordinate cover; identity | N(U^n)=2^n, log N/n=log 2; id has fixed N, limit 0 | Pass. |
| §1.3 and §1.4 rescaling | empty X, t=0; roof-one two-shift, t=2 | empty lhs ⊥ versus 0·⊥=0; nonempty h(g²)=2log 2=2h(g) | F13 repaired. |
| §1.5 entropy-expansivity | identity interval and two-shift | interval h(Φ_ε)=0 and h_top=0, but infinitely many fixed points; shift h_top=log 2 and #Fix(T^n)=2^n | F05 repaired; distinguishes ordinary expansivity. |
| §1.6 time maps | period-one orbit | time-one map=id, h=0, every finite orbit segment has covering growth log C/n→0 | Pass; finiteness now explicit. |
| §1.7, §1.8 | two-point swap; empty suspension | matching (a,1),(a,1) needs 1+τ even, matching (a,1),(b,1) needs it odd; empty mixing is vacuous true | Weak/fixed gaps distinguished; R09 for empty claim. |
| §1.9 Bowen property | φ=x₀ on two-shift; coboundary ψ∘T−ψ with ψ=x₀ | close cylinders give sum difference 0; telescoped sum lies in [−1,1] | Pass. |
| §2.1 pressure | point with φ=3; empty X | Z_n=e^(3n), P=3; Z_n=0, P=⊥ | Pass. |
| §2.2 weighted-cover comparison | fixed point plus two-shift, φ=(2,0) | bad cover sum 2^n e^(2n), rate 2.693147; separated sum e^(2n)+O(2^n), rate 2 | R01. |
| §2.3 power/coboundary | two-shift, φ=x₀, k=2 | P=log(1+e)=1.313262; P_(T²)(x₀+x₁)=2.626523=2P; coboundary adds 0 pressure | Pass, locators uncertified. |
| §2.4 flow pressure | circle period p; speed factor 2 | P(F)=p⁻¹∫_0^p F; P_(g₂)(2F)=2P_g(F) | Pass. |
| §3.1 invariance | swap; circle period 1 | swap M={½δ_a+½δ_b}; circle M(g)={time measure}, M(g¹)=all probabilities | Pass; distinguishes flow invariance. |
| §3.2 conditional inequality | fair shift, P=x₀,Q=trivial; P=(x₀,x₁),Q=x₀ | log 2≤0+log 2; log 2≤log 2+log 2 | F03's new rate theorem sound; R06–R07 change ownership. |
| §3.2 conditioning/affinity | fair bit conditioned on itself; ½B(½)+½B(⅓) | H(P|P)=0≤log 2; mixture entropy 0.664831, averaged Bernoulli entropy 0.679193 | Pass mathematics; conditioning supplied elsewhere. |
| §3.3 fine partitions | fair shift, coordinates [−k,k] | diam=2^(−k−1)→0; every rate=log 2=hμ | Pass. |
| §3.4 generator and USC | fair shift, coordinates −1,0,1; uniform Fix(T^n) | diameter 1/4<1/2; rate log 2; finite-support entropy 0, limit entropy log 2 | Pass with corrected periodic Check, R17. |
| §3.4 erroneous orbit Check | orbit (10^(n−1))^ℤ | mass{x₀=1}=1/n→0, versus 1/2 for claimed limit | R17. |
| §3.5 entropy of expansive flows | roof-one fair-shift suspension; period-one orbit | hμ(g¹)=log 2=partition rate at fine scale; periodic flow entropy=0 | Pass; source ergodicity restriction handled by decomposition. |
| §3.6 Abramov | roof-two fair-shift suspension, t=2,0,−1 | h(g²)=log 2=2·(log 2)/2; h(g⁰)=0; h(g⁻¹)=(log 2)/2 | Pass. |
| §§4.1–4.2 variational principle | two-shift, potential x₀; identity {a,b}, φ=(1,0) | weights (1,e)/(1+e), free energy log(1+e)=P; midpoint energy 1/2<1=P | Pass for separated pressure; repair comparison R01. |
| §4.3 ergodic supremum | mixture of shrinking shifts, weights 2^(−n), alphabets 2^(2^n) | component h_n=2^n log 2<∞; weighted sum ∞; supremum components ∞ | Theorem survives; R13 fixes false attainment step. |
| §4.4 equilibrium | identity {a,b}, φ=(1,0); swap | ES={δ_a}; swap M has one element and ES=M | Pass. |
| §4.5 face/extreme structure | disjoint two-shifts with φ=0 | each component FE=log 2; midpoint FE=log 2, nonergodic; identity midpoint FE=1/2<1 | Both directions of face/extreme claims pass. |
| §4.6 extended maximum | continuous bounded φ, P=∞ | finite ∫φ gives FE=∞ iff hμ=∞; closed sets {FE≥n} have nonempty nested intersection | Repaired theorem sound. |
| §4.6 collapsing sequence | alphabet j/2^(2k), 0≤j<2^k | max<2^(−k)→0, h=klog 2→∞, limit entropy 0 | R16's corrected Check. |
| §§4.7–4.8 existence at ∅ | empty manifold/flow | M=∅, USC=true, #ES=0, promised #ES≥1 | R09; §4.7 also lacks proof owner, R08. |
| §4.8 flow variational principle | period-one orbit, F(s)=sin(2πs) | F₁=0, P=0; flow time measure has FE=0; every δ_s maximises for g¹ but is not flow invariant | Pass for the stated invariant carriers. |
| §4.9 time change/coboundary | same circle, t=2; add constant 5 | FE_(g²,F₂)=2·0=0 and P=0; ∫L_gψ=0; new P=5 | Pass; μ∈M(g) necessary. |
| §4.9 smooth observable clause | cube-root-conjugated rotation, ψ local coordinate | (ψ(g^t0)−ψ(0))/t=|t|^(−2/3), no finite limit | R12. |
| §5.1 Gibbs | fair shift ε=1/2; identity interval ε=1,2 | cylinder mass 2^(−n−2), Gibbs product 1/4; δ₁(B_n(0,1))=0; at ε=2 product=1 | Main Check passes; R15. |
| §5.2 uniqueness | full shift with φ=x₀; swap; disjoint shifts | Bernoulli weights 1/(1+e),e/(1+e); swap state weights 1/2,1/2; disjoint shifts have a segment of maximisers | Criterion passes; weak specification excludes last case. |
| §5.3 flow criterion | period-one orbit; two disjoint periodic orbits | one time measure versus all convex mixtures of the two time measures | Pass; weak specification fails on the union. |
| §6.1 bracket uniqueness | two bracket points, 2δ≤δ* | d(y,y′)≤cλ^nδ*→0 | Direct proof fixes R21's dependency. |
| §6.2 expansivity/shadowing | shift δ*=1/2, β=1/4 and 1 | 2β=δ* gives uniqueness; β=1 exceeds all distances so every point shadows | F02 repaired; source closing checked. |
| §6.3 specification | swap and two disjoint shifts | swap has 2 cyclic pieces and h=0; union has 2 fixed pieces and no connecting orbit | Pass. |
| §6.4 Hölder bound | C=1,c=1,δ=1/4,λ=1/2,θ=1 | 2C(cδ)^θ/(1−λ^θ)=1; constant potential gives 0 | Pass. |
| §6.5 product axioms | circle orbit; irrational torus translation | circle W^s=W^u={x}, v=height difference; torus F3 is 0≤0 and transverse F2 intersection is empty | R18 corrects the negative control. |
| §6.6 closing/specification | circle orbit of period 1, T=n+η | choose T′=n: |T′−T|=|η|; same orbit shadows with distance 0; gluing time<1 | Pass on finite-orbit boundary case. |
| §6.7 shift modulus | cubic-conjugated circle rotation | d(0,g^v0)=|v|³, ratio |v|/d=1/v²→∞; corrected integral error≤2δ||φ|| | R25. |
| §6.8 abstract uniqueness | swap; periodic circle | map h=0 with unique uniform measure; flow h=0 with unique time measure | Pass. |
| §§7.1–7.2 hyperbolicity | diag(2,1/2); diag(2,1); periodic circle | stable/unstable rates 2^(−n); neutral eigenvector norm 1 cannot decay; circle E^s=E^u=0, centre dimension 1 | Pass; distinguishes flow centre. |
| §7.3 metric independence | scale metric by 4; Gram ((2,1),(1,1)) | K₁K₂=2·(1/2)=1; second product=(3+√5)/2=2.618034, rate stays 1/2 | Pass. |
| §7.4 characterisation | diag(2,1/2), v=(1,0),(0,1),(1,1) | norms 2^n,2^(−n),√(4^n+4^(−n)); bounded iff unstable coordinate=0 | Pass. |
| §7.5 continuity/rank | separate saddle and sink components | stable ranks 1 and 2, locally constant; saddle projections have norm 1 | Pass; no claim of global constant rank. |
| §7.6 adapted norm | contraction 1/2, λ′=3/4 | norm-squared factor Σ(4/9)^n=9/5; one-step norm ratio 1/2≤3/4 | Theorem passes; Jordan Check R24. |
| §7.7 iterates/empty exception | diag(2,1/2)^2; empty flow | stable rate 1/4; empty time map satisfies Anosov vacuously | R09. |
| §8.1 graph theorem | diag(2,1/2); (2x,0) | unstable graph y=0, expansion 2 in both; second map has infinitely many preimages of 0 | R11. |
| §8.2 literal stable cutoff | sink B and unit v above | |v|=|Bv|=1, |B²v|≈0.764618; normal determinant≈0.661438≠0 | Corner at every rescaled cutoff; R04. |
| §8.3 weak closed plaque | product stable interval and time interval | boundary has four corners, versus smooth boundary required of a smoothly embedded closed disc | Use plaques/inclusions, R04. |
| §§8.4–8.5 local maximality | full Anosov set and a periodic orbit | U=M gives ⋂g^tU=M; bracket remains in Λ; periodic orbit local bracket is a singleton | Pass mathematics; definition API R22. |
| §8.6 nontriviality | point map; periodic circle; cat torus | ranks (0,0), dimension 0; ranks (0,0), centre 1; ranks (1,1), dimension 2 | Pass these boundary controls; locator R22. |
| §8.7 Hölder bundle | cat torus | bundle-distance 0≤C d^θ for all θ>0 | Constant case consistent. |
| §9.1 toral theorem | cat matrix; shear; empty matrix | det=1, eigenvalues 2.618034/0.381966, entropy a; shear entropy 0; n=0 determinant 1 and entropy 0 | Main theorem passes; R20. |
| §9.2 suspensions/time change | cat roof 1; constant speed 2 | entropy a; return time 1/2 and entropy 2a=1.9248473 | Pass; nonmixing requires nonempty carrier. |
| §9.3 geodesic example | K=−1,0,+1 | unstable J=e^tE and Sasaki norm ratio e^t; flat J=p+tq; sphere J=sin(t)E | Hyperbolic versus nonhyperbolic controls pass, subject to supplier contracts. |
| §10.1 basic sets | ∅; one hyperbolic orbit | ∅ has 0 invariant probabilities, now excluded; orbit has 1 flow-invariant time measure | F04 repaired. |
| §10.2 Bowen | cat φ=0 and φ=−a | Haar free energies a and 0; pressures a and 0 | Pass after foundational repairs. |
| §10.3 Bowen–Ruelle | cat suspension F=0; periodic orbit; F+5 | entropy/pressure a; periodic pressure p⁻¹∫F; adding 5 changes P by 5 and state by 0 | Pass; finiteness now supplied. |
| §10.4 maximal entropy | cat; periodic orbit | a>0; 0 for the exceptional single orbit | Pass these controls. |
| §11.1 differentiability/metric | smooth conformal u versus cusp | φ_new=−a−u′; cusp left/right derivatives differ by 4π | R03, R19. |
| §11.2 plane distortion | b=0 and b=0.1 | ratio 1 for b=0; tends to 0.995037 for b=0.1 | R05. |
| §11.3 volume | compatible cat suspension; T=0 | Bowen volume×e^(aT) comparable to ε³; λ_0=1 and ordinary ball volume>0 | Pass after fixing example metric. |
| §11.4 pressure | cat; curvature −1 surface; saddle periodic orbit | a−a=0; 1−1=0; −p⁻¹log λ_p<0 when λ_p>1 | Source proposition matches. |
| §11.5 SRB | compatible cat suspension; rescaled metric | invariant product probability unchanged; m_new density e^(3u)/∫e^(3u) is nonconstant and not invariant | Theorem conditional on AC is sound; R19, R23. |
| supplier sphere gap | trivial rank 2, radius 1; rank 0 | norm equation gives S¹ and empty set respectively; native atlas/embedding exist | R26 narrows the gap. |

**Seeded sources, locators and hypotheses.** All 17 cited works have manifest entries: 11 cached certified texts and 6 settled uncertified texts. No new fetch or manifest mutation was needed. Source passages were read in their legal cached extractions; printed pages below are distinguished from extraction page markers. No uncertified book was silently treated as read.

| Seeded target | Text opened and outcome |
|---|---|
| 1.1 | BowenRuelle1975 lines 96–103, printed p.183, gives flow distances/closed balls; lines 163–164, p.184, gives discrete separated sets. ClimenhagaThompson2016 lines 167–177, v2 p.4, gives t≥0 and δ>0. The definition is supported after the convention corrections; R02, R10, R27. |
| 1.2 | BowenGroupEndomorphisms1971 lines 110–114, printed p.403, records agreement on compact metric spaces. The nonmetrizable compact Hausdorff extension is the roadmap's cover/entourage argument, not a theorem stated at these lines. Walters Chapter 7 is uncertified. |
| 3.4 | ClimenhagaThompson2016 Theorem 3.2, lines 504–509, v2 p.12, assumes compact metric, homeomorphism and ergodic invariant μ. BowenEntropyExpansive1972 Theorem 3.5, lines 297–299, printed p.330, assumes finite dimension. The roadmap explicitly accounts for these restrictions and gives its generator/USC route. Walters Theorem 8.2 remains uncertified. |
| 3.5 | Same CT theorem and Propositions 3.3–3.4, lines 513–535, p.12; BowenEntropyExpansive1972 Example 1.6, lines 117–133, pp.325–326. Orbit segments have entropy zero; uniform expansivity gives the pointwise conclusion before decomposing arbitrary time-one invariant measures. This avoids incorrectly assuming their flow invariance. |
| 4.5 | BCS2022 Definition 1.1 and line 56, v2 p.2, support maximizing measures and their ergodic components in that paper's surface setting. General face/extreme claims are proved from the imported affine/decomposition APIs; Walters Theorem 9.13 is uncertified. |
| 4.8 | BowenRuelle1975 lines 182–201, printed p.185, supports pressure, time-one averaging and the flow variational principle. TsujiiZhang2023 Definition 3.5, lines 485–495, v1 p.11, is in its Anosov setting. It is not the source of the general existence assertion; R09. |
| 4.9 | BowenRuelle1975 lines 213–227, p.186, concern special flows and their equilibrium measures; Remark 4.5, lines 409–413, p.191, concerns rescaling and metric change. TsujiiZhang2023 lines 106–109, v1 p.3, introduces ν_(g,F) for smooth transitive three-dimensional Anosov flows. The general coboundary and time-map statements need the roadmap's displayed elementary calculation, not an attribution of that generality to these source passages; R12. |
| 6.2 | BowenPeriodicPoints1971 Lemmas 2.3–2.4 and construction 2.5, lines 96–104, printed p.379, read with A1–A3 at lines 66–85, p.378. The source has periodic density as a standing assumption; the roadmap's separate shadowing route is needed to remove it. Bowen1975 Chapter 3 and KH §18.1 are uncertified, so the full shadowing proof at that locator was not certified. |
| 6.5 | BowenRuelle1975 lines 96–108, p.183, gives stable/unstable sets; 303–307, p.188, does not give F2/F3. The abstract axioms are this design's construction, with realization assigned to §§8.3–8.5. FH2019 Part II is uncertified; R18, R27. |
| 6.6 | BowenEntropyExpansive1972 Example 1.6*, lines 134–135, p.326, concerns basic/Axiom A flows, not arbitrary F2/F3 systems. Abstract closing/specification must use the design's bracket proof. BowenWalters1972, FH2019 Part II and KH §18.1 are uncertified. |
| 7.3 | BowenRuelle1975 Remark 4.5, lines 409–413, p.191, discusses derived equilibrium data under metric change; it does not state the CK₁K₂ estimate. That estimate was recomputed above. KH §6.4 is uncertified. |
| 7.5 | BowenRuelle1975 line 13, p.181, assumes continuous bundles. It does not prove their continuity from the weaker definition here. The displayed closed-graph/rank argument was inspected; KH §6.4 is uncertified. |
| 9.1 | Smale1967 §I.3, lines 381–473, printed pp.757–760; BowenGroupEndomorphisms1971 Theorem 15, lines 313–316, p.408, and Corollary 16, lines 332–336, p.409; BowenPeriodicPoints1971 Proposition 7.1, line 667, p.394. Entropy eigenvalue multiplicities and toral/Haar setting match. R20 handles rank zero. |
| 10.3 | BowenRuelle1975 Theorem 3.3, lines 272–277, printed p.187, basic hyperbolic set and positive Hölder exponent; Proposition 3.1, lines 213–222, p.186, supplies the special-flow Gibbs statement used there. The source's terminology requires no fixed points and a smooth metric. CT supplies the abstract route; the design's nonempty and C¹ hypotheses are explicit. |
| 11.4 | BowenRuelle1975 Proposition 4.4(a),(b), lines 377–407, printed p.190, read with the volume lemmas and smooth-metric convention. The pressure is nonpositive; positive local-stable volume gives zero and the entropy identity. The exact saddle-orbit value and the attractor zero value were recomputed. |

Other repaired-source checks: BowenEntropyExpansive1972 Corollary 2.3 and Theorem 2.4, lines 188–201, printed pp.326–327, support the new entropy-expansive bridge. ClimenhagaThompson2016 Theorem 5.5, lines 1717–1724, v2 p.37, supports the homeomorphism criterion with weak specification at every scale; its Theorem A supports the flow criterion. Misiurewicz1976 equations (1)–(3) and the variational principle, lines 88–121, printed p.149, use separated sets, not R01's supremum over all weighted covers. ClimenhagaPesin2016 Theorem 11.1 and Remark 11.2, lines 1822–1843, v1 p.40, were opened for the inverse-map and indexing conditions. Buzzi2014 Corollary 1, lines 114–116, v1 p.3, supports the finite-regularity nonexistence Check.

**Supplier and duplication audit.** The package index was read. Its three board packages have unrelated scopes. Object searches over main and 434 indexed open heads covered pressure, equilibrium states, Anosov/hyperbolic sets, Gibbs/SRB measures, local product structure, stable manifolds, entropy-expansivity and specification. The nearest open scopes were read: ArithmeticDynamics #1335, ProbabilisticAndMetricNumberTheory #1421, ProbabilisticAndMetricNumberTheoryPartII #1838 and RicciFlow #1023; OptimalTransport was read on main because it is an existing roadmap. The Part II transfer-operator pressure is on its countable-branch spectral family, not this compact-system definition. Ricci-flow and transport entropies are also different objects. OperatorAlgebraDynamics D8–D9 concerns quantum equilibrium/pressure; GeometricTopology's Anosov bundles and TaubesGromov's cat matrix are examples, not owners of the general hyperbolic theory. No other duplicate owner of that general theory was found. R07 is a concrete duplicate prerequisite; R06 is concrete supplier drift.

The overlap file reports no conflicting head, dropped cited section ID, open-revision-only section ID, or incoming dropped ID. The cited section numbers were resolved again rather than inferred from that empty result. Its closest-roadmap comparisons were completed. R06 is a declaration-level change within a surviving §4.2, which that section-ID overlap list did not catch. Open pull requests for which no accessible file/head was provided were not independently checked beyond the supplied index/service results.

Resolved supplier passages (file line numbers below exclude the roadmap service's one-line wrapper):

- `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md`:1360–1364 at #851: subordinate/countable entropy, conditional entropy, itinerary labels, rate as infimum, measure entropy into [0,∞], conjugacy and inverse. The finite-label supplier is now §5.1a of ProbabilisticAndMetricNumberTheory; R06.
- `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md`:4650 and 4692 at #1421: nonergodic pointwise conditional-expectation limit and ergodic integral limit, on arbitrary probability spaces; :6743–6753 supplies finite entropy and its chain rule.
- `TauCetiRoadmap/ArithmeticDynamics/README.md`:2492–2546 and :2548–2664 at #1335: finite-partition supremum, conditional σ-algebra entropy including monotonicity, SMB, metric topological-entropy bound, null-boundary partitions, and standard-Borel ergodic decomposition with an extended entropy integral. In particular that integral explicitly permits ∞, making R13 relevant.
- `TauCetiRoadmap/DifferentialGeometry/README.md`:1280–1294 on main: compact completeness and finite-dimensional global flow are now named Tau Ceti inputs, with “toFlow” retained as a consumer alias; :2802 supplies/identifies smooth Riemannian metrics. No missing alias is alleged.
- `TauCetiRoadmap/RiemannianGeometry/README.md`:863 (R1), :1283 (R2), :2066 onward (R4) on main: curvature, initial-value Jacobi fields, Rauch/model comparison, radial Riccati comparison and Cartan–Hadamard. No connection-map/geodesic-flow derivative identification was found there.
- `TauCetiRoadmap/TangentialBordism/README.md`:944–977 at #942: B1.5 sphere/disc bundles and comparisons with literal carriers. The stronger native embedding is R26, rather than a new task for this supplier.
- Consumer sections ArithmeticDynamics §§2.67,2.85,2.90,2.92 resolve at #1335; TaubesGromov's cat example is `TauCetiRoadmap/TaubesGromov/README.md`:439; GeometricTopology's Anosov-torus-bundle examples are on main at :7402 and :7533. They do not supply the requested dynamics.

**Pinned library evidence.** The manifest revisions are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`; the Tau Ceti checkout HEAD was also checked. The following native declarations were opened, including their relevant binders, rather than trusting the resolver's availability warning:

- `Mathlib/Dynamics/TopologicalEntropy/DynamicalEntourage.lean`:52,59,62: `dynEntourage`, `mem_dynEntourage`, `mem_ball_dynEntourage`. Its body is the intersection over k<n; it does not assume continuity, nonemptiness or a metric and is universal at n=0.
- `Mathlib/Dynamics/TopologicalEntropy/CoverEntropy.lean`:79,212,338,418,434,441,488,502: covers, minimum cardinal, fixed-entourage entropy, its compact invariant finiteness, cover entropy, liminf version, empty entropy and their equality. `coverEntropy` itself is a uniform-space definition; compactness and nonemptiness are not fields of that definition.
- `Mathlib/Dynamics/TopologicalEntropy/NetEntropy.lean`:69,103,254,348: dynamical nets, maximum cardinal, net entropy and comparison. The defining condition is pairwise disjoint inverse-entourage balls, not pairwise distance greater than ε. `Mathlib/Dynamics/TopologicalEntropy/Semiconj.lean`:190,195 supplies restriction and uniformly continuous image comparison. `Mathlib/Analysis/Asymptotics/ExpGrowth.lean`:41 is limsup(log(u_n)/n) into EReal.
- `Mathlib/Dynamics/Flow.lean`:85,143,196,301,335: `Flow`, `fromIter`, `toAddAction`, `toHomeomorph`, `reverse`; restriction and invariance are in the same file. A Flow has joint continuity and the action laws; it has no differentiability field or generator, which is why R12 matters. The native Birkhoff sum and transitivity predicates were also read in `Mathlib/Dynamics/BirkhoffSum/Basic.lean` and `Mathlib/Dynamics/Transitive.lean`.
- `Mathlib/Dynamics/Ergodic/MeasurePreserving.lean`:44: invariance; `Mathlib/Dynamics/Ergodic/Extreme.lean`:90 and its `iff_mem_extremePoints`: uniqueness under absolute continuity and extreme-point characterization. The latter is for invariant probability measures, with no built-in topological compactness. `Mathlib/Dynamics/Ergodic/Action/Basic.lean` contains `ErgodicVAdd`; `Mathlib/Dynamics/Ergodic/EmpiricalMeasure.lean` contains the nonempty compact-Hausdorff invariant-probability theorem. Prokhorov and Portmanteau provide the cited compactness and null-frontier convergence APIs, not entropy upper semicontinuity.
- `Mathlib/MeasureTheory/Integral/RieszMarkovKakutani/Real.lean`:451: the regular representative with equal bounded-continuous integrals. `Mathlib/Topology/VectorBundle/Riemannian.lean`:128: `Continuous.inner_bundle`; the continuous and smooth metric structures are in this file and `Mathlib/Geometry/Manifold/VectorBundle/Riemannian.lean`. `Mathlib/Geometry/Manifold/IsManifold/ExtChartAt.lean`:437, `Mathlib/Analysis/Calculus/FDeriv/Defs.lean`:162 and `Mathlib/Topology/MetricSpace/Contracting.lean`:42 supply the chart, derivative and contraction predicate added by F10. Diffeomorph, manifold derivatives, Hölder maps, upper semicontinuity and the Euclidean Jacobian theorem were located in their cited pinned modules.
- `TauCeti/Analysis/ODE/LyapunovPerron/Basic.lean`:529, `Graph.lean`:87, `Local.lean`:154,393: the four disputed constructions exist. The local stable graph explicitly uses a projection-coordinate truncation, rather than asserting that every raw metric cutoff has smooth boundary.
- `TauCeti/Geometry/Manifold/Instances/MappingTorus.lean`:245,395,431,493: native mapping torus, flow, time-one formula and joint regularity, with the differentiability index carried in the diffeomorphism. `TauCeti/Geometry/Manifold/Instances/AddCircle.lean`:258 supplies the circle manifold. `TauCeti/Dynamics/CatMap.lean`:43,56,61 gives the matrix, determinant 1 and reversed characteristic polynomial 1−3X+X².
- `TauCeti/Geometry/Manifold/Riemannian/Geodesic/Flow.lean`:106, `Compact.lean`:75 and `ConstantSpeed.lean`:109 supply smooth local geodesic flow, compact completeness and speed conservation. `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean`:82,87 and `Measure.lean`:113,256 supply the volume and positive chart density.
- `TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Sphere.lean`:143,161,181 supplies the positive-radius sphere-bundle atlas, manifold and embedding, under finite-dimensional, boundaryless bundle/manifold hypotheses and C^n metric/radius with 1≤n. Constant radius 1 and the tangent bundle satisfy the requested example's hypotheses. R26 corrects the previous absence claim.

Object searches at these pins did not locate general measure entropy, topological pressure, expansive/specification predicates, hyperbolic-set/Anosov structures or SRB theorems. The native flow-stable-set and equilibrium-of-an-ODE constructions are narrower and are not claimed absent. The pressure/entropy comparisons already native are imported, rather than made new headline targets.

**Dependency check output** (the requested command, unmodified candidate and merge order):

    candidate: HyperbolicDynamicsAndThermodynamicFormalism is not in the merge order yet; checked as if placed after ArithmeticDynamics (the intake inserts it when its design is accepted)
    depcheck: 228 roadmaps, 2065 edges, 0 problem(s)

There is no UPWARD or CYCLE line. This is an inter-roadmap check; it does not resolve R21's intra-target/API edges. Neither the order file nor any tooling was edited.

**Gaps.** Both slugs occur consistently in P and D. The connection-map contract has a named supplier, initial data, domain of time, connection and smoothness hypotheses, and describes one coherent comparison construction; it remains a valid declared contract. The sphere contract is not minimal because of R26. Its residual corestriction requirement can remain declared against the native atlas. No absence of a declared future supplier result was counted as an unowned prerequisite.

**Headline and Lean checks.** This is a design, with no `Suggested.lean`. Elaboration: **not available (this lane does not elaborate)**. No Lean command was run. There are zero sorried Lean theorems to subject to the one-tactic probe, zero declarations to `#check`, and no module docstring whose omissions can yet be audited. This is not a claimed passing package build.

The package-stage headline inventory from D:3 is: map/flow variational principles (§§4.2–4.3,4.8), existence and structure (§§4.5–4.6), Bowen criteria (§§5.2–5.3), linear hyperbolic theory (§7), Hadamard–Perron/local manifolds (§8), the three Anosov examples (§9), Bowen and Bowen–Ruelle (§§10.2–10.3), Bowen–Margulis (§10.4), and the geometric-potential/SRB theorems (§11). Native Flow, Diffeomorph, tangent and metric carriers permit geometric headlines with honest simple predicates. Thermodynamic headlines need the nonnative measure-entropy API and must be named as unstatable unless actually made statable under the definition rule. No boundary-case padding should replace them. No backticked identifier presented as a new declaration of this roadmap was found in D; names in P are proposed catalogue names, not claims about an existing Lean file.

## Not verifiable

- Walters1982, including Theorems 4.12, 8.1–8.3, 8.6, 9.7–9.8, 9.10, 9.13 and Chapter 7: settled uncertified. The repaired 9.8 locator was not confirmed from the text.
- Bowen1975 Chapters 1,3,4 and Theorem 4.1; KatokHasselblatt1995 §§6.2,6.4,18.1,18.4,19.1 and Chapter 17; FH2019 Part II; BowenWalters1972; Newhouse1989 Theorem 1: settled uncertified and not requested again. Claims relying only on these texts received mathematical and interface scrutiny, but not source-text certification. In particular the full abstract closing/shadowing and smooth-bundle continuity source locators cannot be certified here.
- The Bowen–Ruelle extraction loses some displayed formulas, especially the inequality in Theorem 3.3. Its hypotheses and prose conclusions are legible, and Proposition 3.1 supplies a legible Gibbs formulation. I have not treated corrupted glyphs as source errors.
- No elaboration or mechanical expanded-binder comparison is available in this lane, and no Lean acceptance file exists at this stage. Package-stage statability/padding remains a required check, not evidence of success in this review.

## Source issues

- **Misprint** in ClimenhagaPesin2016 at Theorem 11.1, arXiv v1 printed p.40: the source says maps are indexed by n≤0 but the invariant family by all integers; it should use a consistent index set for maps and family; affects a stated result.
