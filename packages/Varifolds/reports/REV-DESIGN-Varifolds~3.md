# Review of Varifolds (design, round 3)

**Verdict:** needs changes

Ten findings: one P1, four P2 and five P3. Both findings of the preceding review are repaired. These are new findings, not re-raised settled findings. The design's scope remains appropriate; it does not need replanning. No design or manifest entry was edited.

## R01 (P2) — The Grassmannian homeomorphism needs a surjective isometry

**Location:** `packages/Varifolds/design/README.md:287`, “A linear isometry U : E → F induces the homeomorphism P ↦ U P U⁻¹ of G(E, k) onto G(F, k)”; also `packages/Varifolds/design/plan.json:45`, the isometry-action API.

**Claim:** Every linear isometry between the stated finite-dimensional spaces supplies this homeomorphism.

**Witness:** E = ℝ, F = ℝ², k = 1, U(t) = (t,0). G(E,1) is a singleton; G(F,1) contains both coordinate lines. U has no inverse on F; the vertical plane projection is not in the image.

**Exact repair:** Say “linear isometry equivalence” (or explicitly assume surjectivity) for the homeomorphism and update the plan. Retain the general embedding case as P ↦ UPU*, a homeomorphism onto the planes contained in range U. Add the inclusion ℝ → ℝ² as a negative control. On that inclusion the image is precisely {diag(1,0)}; on a rotation of ℝ² the inverse exists and conjugation reaches every line. The new image-plane formula at 291–296 already handles the inclusion correctly.

## R02 (P1) — Constancy differentiates the wrong coordinate density

**Location:** `packages/Varifolds/design/README.md:1049`, “the distributional derivatives of θ times the volume density vanish against all test functions”.

**Claim:** Stationarity makes the coordinate density θ√det g constant.

**Witness:** Take W = Σ = ℝ, g = e^(2t)dt², V = [W], θ = 1. For compactly supported X, δV(X) = ∫(e^tX)'dt = 0, but (θ√det g)' = e^t ≠ 0.

**Exact repair:** Write w = √det g in a chart and use div_g X = w⁻¹∑ᵢ∂ᵢ(wXⁱ). Stationarity gives ∫θ∑ᵢ∂ᵢ(wXⁱ)dt = 0. Choose Xⁱ = φ/w, all other components zero, to obtain ∫θ∂ᵢφ dt = 0. Apply GeometricCurrents G1 to θ against coordinate Lebesgue measure, not θw. Add this nonconstant-volume-density Check. In the witness, ∫φ' = 0 gives θ = 1, while w remains e^t. Simon1983 line 7725–7732 (printed p. 242, scan inspected) uses the coordinate multiplicity itself.

## R03 (P2) — Compactness assumes the convergence it should produce

**Location:** `packages/Varifolds/design/README.md:1104`, the standing setting includes “and V_i → V there”; `packages/Varifolds/design/README.md:1199` starts compactness “In the standing setting”.

**Claim:** The compactness headline supplies a convergent subsequence from the mass, variation and density bounds, but the inherited hypothesis already requires convergence of the entire sequence. This is narrower than plan target 7.4 and Simon's theorem.

**Witness:** Alternate multiplicity-one lines y₂ = 0 and y₂ = 1. Their first variations are 0, densities are 1, and masses in B_R are ≤ 2R. A compact test has alternating integrals 1,0: no full-sequence convergence.

**Exact repair:** Keep only the common bundle and g_i → g in the standing setting. Put V_i → V explicitly in 7.1. State 7.4 for an arbitrary sequence with the listed bounds and conclude existence of a strictly increasing subsequence and its limit; use that subsequence in the variation lim inf. Let 7.6 inherit this corrected setting. The alternating sequence then qualifies and has the even and odd constant subsequences. This restores Simon1983 42.7, printed p. 247, rather than narrowing it.

## R04 (P2) — Radial tests cannot prove dilation invariance of the weight

**Location:** `packages/Varifolds/design/README.md:1155`, “the weighted identity 6.1 with h(y) = f(|y|)-type weights gives dilation invariance of the weight, as in Simon1983 19.3”.

**Claim:** Radial weights establish the equality of measures under every dilation.

**Witness:** In polar coordinates let dμ = (1 + ½sin(log r)cos θ)dr dθ. Then μ(B_ρ) = 2πρ, but λ⁻¹∫_{B_λ}cos θ dμ is −π/4 at λ = 1 and +π/4 at λ = e^π.

**Exact repair:** Use arbitrary angular tests, as Simon1983 line 3461–3481 (19.3, printed pp. 98–99) does, or use arbitrary compactly supported C¹ h in stationarity of X(y) = h(y)y. Radial tangency gives ∫(kh + y·∇h)d‖C‖ = 0. Differentiating λ⁻k∫h(y/λ)d‖C‖ then gives 0, hence invariance by measure extensionality. The witness passes all radial mass tests but fails the angular one, so the repair excludes it. This is a defect in the supplied proof step, not a counterexample to the stationary tangent theorem.

## R05 (P2) — The stated build order puts vector-field Riesz after its consumer

**Location:** `packages/Varifolds/design/README.md:731`, “*Needs:* Layer 4.1, Layer 4.3”; `packages/Varifolds/design/plan.json:766`, target 4.2's prerequisites.

**Claim:** The numbered targets are in build order, but 4.2 already uses 4.3 to construct ‖δV‖ and its open-set supremum formula.

**Witness:** The plan contains 4.2 → 4.3. Target 4.3 depends only on the named scalar Riesz/Radon–Nikodym suppliers; it has no dependency on 4.2. This is the sole forward-numbered target edge among the 34 targets.

**Exact repair:** Put vector-field Riesz representation before the locally bounded first-variation/total-variation target, updating local section numbers, plan prerequisites and citations consistently. If numbering changes, give an old-to-new mapping. For the circle, first construct the representing measure H¹⌞C and then use it in the bounds and semicontinuity API. No mathematical cycle exists; the roadmap order needs to reflect the actual dependency.

## R06 (P3) — The constant-conformal-factor Check drops the connection term

**Location:** `packages/Varifolds/design/README.md:825`, the Check bounds the difference by “k|c^k − 1| sup|DX| ‖V‖(K)”.

**Claim:** This bound holds for arbitrary smooth g in 4.5's standing setting.

**Witness:** Set N = k = 1, g = e^(4t)dt², h = 4g, V = δ_(0,1), K = [−1,1], X(t) = (1−t²)² on K and 0 outside. The claimed sides are 2 and 8/(3√3) < 2.

**Exact repair:** Make this particular bound a flat-metric Check (g = e), or retain the covariant derivative and the metric-dependent norm comparison/Christoffel term. Keep the general comparison theorem unchanged. Here Γ_g = 2 and X'(0) = 0, hence div_g X(0) = 2; for g = e the same δV(X) is 0, so the flat Check passes. Add the variable-metric case as a control against dropping the C¹-metric/sup|X| term.

## R07 (P3) — Zigzag variation omits the endpoint atoms

**Location:** `packages/Varifolds/design/README.md:1211`, “‖δV_i‖ is √2 times the number of corners”.

**Claim:** This is the total first variation of the finite zigzag graph over [0,1].

**Witness:** In W = ℝ² use the graph through (0,0), (½,½), (1,0). Its unit tangents are (1,±1)/√2. The corner atom has norm √2; each endpoint atom has norm 1. Total variation is √2+2, not √2.

**Exact repair:** State √2 times the number of interior corners plus 2, or explicitly restrict the calculation to an open strip excluding the endpoints. Retain the conclusion that the variations are unbounded and the nonrectifiable limit. On the one-corner witness the corrected total is √2+2. The plan's qualitative zigzag Check does not need an additional mathematical change.

## R08 (P3) — The multiplicity lemma's source has squared smallness bounds

**Location:** `packages/Varifolds/design/README.md:1224`, “hypotheses of Simon1983 42.9 … ‖δ_h W‖ at most ε and ∫ ‖P_S − p‖ dW at most ε”; also `packages/Varifolds/design/plan.json:1464`, target 7.5.

**Claim:** These are the source's hypotheses with its slab parameter ε.

**Witness:** Simon1983 line 7991–8000, 42.9, printed p. 250: the scan gives both first variation and the integral of the unsquared tilt norm strictly less than ε²; the slab width is ε.

**Exact repair:** Record the source's ε₀² bounds accurately and explain any reparameterization. In the flat case choose a final ε ≤ ε₀²/2: bounds ≤ ε imply the source's strict bounds, and the counted ε-slab is contained in its ε₀-slab. For h ≠ e identify the separate metric-error argument and which slab scale T it uses; do not attribute it directly to 42.9. Alternatively state the theorem with the squared bounds, including suitably small metric error, and adjust its proof route and plan. For ε₀ = 1/10, ε ≤ 1/200 gives ≤ .005 < .01 and a smaller slab. The existential flat theorem is recoverable; this is an attribution/parameter-accounting correction, not a disproved compactness theorem.

## R09 (P3) — The Dirac Riesz Check divides by zero

**Location:** `packages/Varifolds/design/README.md:749`, “L(X) = ⟨X(0), v⟩ gives ‖L‖ = |v| δ_0 and η(0) = v/|v|”; also `packages/Varifolds/design/plan.json:840`.

**Claim:** The pointwise normalization is asserted without v ≠ 0.

**Witness:** For v = 0, L = 0 and ‖L‖ = 0; v/|v| is 0/0. The polar field is unconstrained at 0 because that point is ‖L‖-null. Uniqueness only holds almost everywhere.

**Exact repair:** Guard the displayed normalized vector by v ≠ 0. State separately that v = 0 gives the zero measure and arbitrary polar-field values on its null set. On v = 2e₁ the answer is 2δ₀ with η(0) = e₁; on v = 0 it is the zero measure without a normalized-vector assertion. Update the plan's Check.

## R10 (P3) — An empty singular set does not force the chosen carrier to be closed

**Location:** `packages/Varifolds/design/README.md:1433`, “In Simon's theorem with K = ∅, sing^∞[Σ] = ∅ and Σ is closed”.

**Claim:** Closedness follows from the version of Simon's theorem actually stated in 9.4, which does not require Σ to equal the regular set of its closure.

**Witness:** Choose n = 3, m = 5, ℓ = 1, f = 1 and Σ = (ℝ⁸×{0})∖{0} in ℝ⁹. Then [Σ] = [ℝ⁸×{0}] is stationary with empty singular set, but Σ is not closed.

**Exact repair:** Include Simon's convention Σ = reg^∞[Σ] when stating this existential example, citing Simon2023 line 77–83, or remove the closedness conclusion from the Check. With the convention, K = ∅ gives Σ = spt‖[Σ]‖, hence closed. The punctured plane fails the added convention because its regular set includes the missing origin. The cone-notation repair remains correct.

## Verified sound

### Previous review, finding by finding

| Prior finding | Repaired passage | Status and independent test |
|---|---|---|
| REV-DESIGN-Varifolds~2/F01 | `packages/Varifolds/design/README.md:291`: “L injective on range P … L need not be injective on E”; the formula is Q(Q*Q+1−P)⁻¹Q*. | **Repaired.** L = diag(1,0), P = diag(1,0) gives Q = P, A = 1, QA⁻¹Q* = P. For P = 0, A = 1 and output 0; for L(t) = (t,t), output ½[[1,1],[1,1]]. Plan 1.1 agrees; 3.1 now cites 1.1. R01 concerns a different, unchanged isometry bullet. |
| REV-DESIGN-Varifolds~2/F02 | `packages/Varifolds/design/README.md:1042`: “either V = 0, or Σ is closed in W … and V = θ_0 [Σ] … θ_0 > 0”. | **Repaired.** For graph sin(1/t), length ≥ ∫₁^∞abs(cos u)du = ∞ and V = 0 takes the first branch, without [Σ]. For v(L,3), area in B_R is 2R and θ₀ = 3. Plan 6.4 agrees. R02 concerns the coordinate proof, not the repaired conclusion. |

The added image-plane boundary Check gives diag(1,0) and diag(0,1) as the two path limits, so no extension exists across the killed line. The additional 9.4 repair is also sound: ∇(q|x|²−p|y|²) = (2qx,−2py) is nonzero off 0, the smooth locus has dimension n, and Hⁿ({0}) = 0. Thus v(C_{p,q},1) = [C_{p,q}∖{0}]. The same-pattern search covered all [Σ] occurrences, image-plane transports, the uses of constancy in 7.3 and 9.1, and the singular-set example; R10 records the remaining distinct carrier issue. No finding was marked not actionable in the last repair report.

### Principles, scope, shape and the plan

Read all 34 targets, their API bullets, Checks, proof routes, standing conventions and dependency lines. The two main-branch examples used for shape were `TauCetiRoadmap/GeometricMeasureTheory/README.md` and `TauCetiRoadmap/GeometricCurrents/README.md`, with `Completed/HopfRinow/README.md` also read. The design has the required Summary, ownership, conventions, supplier contracts, build explanation, nine mathematical layers, Examples/Dependencies endings, downstream consumers and references. There are 34 Checks blocks, and each definition has at least three listed Checks and an API. R06, R07, R09 and R10 correct particular Checks rather than a missing quota.

The organisation is mathematical: projection bundle, rectifiability, push-forward, variation, smooth comparisons, monotonicity, compactness and tangents. The introduction's reference to the generality of Simon Chapter 8 does not say to follow its organisation; submanifolds and metric comparison are separately placed by their mathematical uses. No layer is named after a source chapter. The general manifold theory includes arbitrary Radon varifolds, degenerate k = 0 before Layer 6, and k = N; there is no route-specific “good case” library. The two 9.4 statements are expressly consumer examples, not a narrowing of the library to those cones or dimensions.

The plan parses, contains 34 distinct target ids, has no internal dependency cycle and has the same library hashes as the pins. The single forward-numbered edge is R05. The compactness setting mismatch is R03. No declared gaps exist. No algorithm, copied source passage, prohibited supplier, local machine path, pull-request number, HTML anchor or operational hand-off narrative was found in the design. The recorded source titles are bibliographic metadata. No suspicious instruction was treated as authority.

### Computed adversarial table

The entries below cover every seeded target, every headline, every target touched by a finding, and the remaining sections for which the preceding report supplied no numerical check. Previously computed unchanged cases were also read against the current text; no bare “sound” assertion from the earlier report was treated as proof. Values are hand computations, not Lean elaboration. Algebraic tests involving primes or rings are inapplicable to these real differential-geometric carriers; the relevant degeneracies are zero mass, zero/top dimension, nonproper maps, zero Jacobians, nonrectifiable lifts, disappearing mass and missing boundary terms.

| Statement | Instances tried | Values on the two sides / discriminating computation | Result; change |
|---|---|---|---|
| Conventions: Hausdorff normalization and trace curvature | Unit disc, circle, S^k | H²(B₁) = π; H¹(S¹) = 2π; averaged H = −x, trace H = −kx; δ[S^k](x) = kHᵏ(S^k) = −∫⟨−kx,x⟩ | Correct. |
| 1.1 projection carrier, complements and norm | P = [[1,t],[0,0]]; diagonal projections | P² = P, but P* ≠ P for t ≠ 0; orthogonal P has eigenvalues 0,1, tr P = k, norm 1 for k > 0; k = 0 gives P = 0 and norm 0 | Correct carrier; wrong idempotents excluded. |
| 1.1 plane distance | ℓ₀, ℓ_θ | P_θ−P₀ = [[−s²,cs],[cs,s²]], square s²I, operator norm abs(s); θ = π/2 gives 1, Frobenius √2 | Correct. |
| 1.1 isometry and image-plane formulas | Inclusion ℝ→ℝ²; L = diag(1,0); L = 2id | Inclusion image contains only horizontal line, not vertical; Q*Q+1−P = I in the rank-one singular-map example; for L = 2id, QA⁻¹Q* = 2·¼·2 = 1, whereas QQ* = 4 | Prior repair correct; R01. |
| 1.2 metric change and compact fibres | h = diag(1,4), u = (1,1); h = 4g; k = 0,N | P_h(e₁) = u/5 versus P_g(e₁) = u/2; conformal rescaling leaves P unchanged; fibres at 0,N are {0},{1} | Correct; compact fibres make projection proper. |
| 1.3 weights, extensionality and restriction | Horizontal/vertical lifts of H¹ on horizontal axis; Dirac; empty restriction | Both weights give B₁ mass 2; χ·tr(Pdiag(1,0)) integrates to ∫χdH¹ versus 0; Dirac weight mass at x is 1; V⌞∅ = 0 | Correct; weight alone cannot determine V. |
| 1.4 convergence, Portmanteau and local bounds | δ_(1/j,P), escaping δ_(je₁,P), jδ_(0,P) | First tends to δ_(0,P); on {0}, 0 ≤ 1; escaping total masses 1 but limit 0; compact test = 1 near 0 gives integral j for the unbounded sequence | Correct; vague convergence does not preserve total mass. |
| 2.1 tangent normalization | μ = H¹⌞L, 2H¹⌞L, area measure, δ₀ | Rescaled B₁ masses 2,4,πλ,λ⁻¹ respectively; alternative powers give 2λ→0 or 2/λ→∞ instead of 2 | Correct; positivity and finite multiplicity are essential. |
| 2.1 criterion, converse, charts, uniqueness | φ = 2id; zero measure; two crossing lines | φ_*H¹⌞L = ½H¹⌞L and θ/J = 1/2; zero measure has Γ = ∅; crossing blow-up has two distinct rays of planes and is not θH¹⌞T; distinct plane supports exclude equality | Correct. |
| 2.2 rectifiable/integral carrier | L with θ = 1,½; k = 0; countable Γ with k > 0 | Densities 1,½: only first integral; H⁰ counts points and weight is ∑θδ; countable Γ has Hᵏ = 0 for k > 0; crossing-line masses add to 4ρ | Correct; no integrality of fractional multiplicity. |
| 2.3 submanifold, support and area | Circle; open half-line; two disjoint circles; top dimension | Mass 2π, support S¹; half-line B₁ mass 1 with support including 0; two circles mass 4π; H^N = volume | Correct, local area required; figure-eight has two tangents at crossing and is not embedded. |
| 3.1 push-forward and zero Jacobian | Dilation 2id, projection killing vertical line, fold t² | Segment mass 1→2, not 1; killed line J = 0 and output 0; fold gives 2∫₀¹φ, hence density 2; infinitely many collapsed parallel segments give infinite compact mass | Correct, including proper-support guard. |
| 3.2 blow-ups | Segment, line, great circle at x | Segment mass λ⁻¹; line gives 2ρ in B_ρ; great circle also gives 2ρ when λρ < π; composing scales λ,μ gives (λμ)⁻¹ | Correct. |
| 3.3 fibre measures and first rectifiability | Correct/vertical lifts of same line; crossing; density-point subset D' | Correct νˣ = δ_horizontal; vertical νˣ = δ_vertical, so wrong lift cannot tend to v(L,1); crossing mass 4ρ but two plane atoms; on D' small-ball ratio→3^k < 3^k+1 | Correct; prior density-point repair remains necessary. |
| 4.1 variation, flow and zero dimension | Circle dilation; vertical lift X = ψy₂e₂; k = 0,N | d(2πe^t)/dt at 0 = 2π = δ[C](X); vertical lift gives ∫ψ despite X = 0 on weight support; tr(0DX)=0; full-dimensional volume gives ∫div X = 0 | Correct; derivative support and connection hypotheses in scope. |
| 4.2 stationarity and local variation bounds | Line; circle; X_n = n⁻¹ψ sin(ny₂)e₂ on vertical lift | δ line = 0; circle variation = H¹⌞C with total 2π; sup‖X_n‖≤1/n but δV(X_n)=∫ψ>0, so no finite C_K | Correct mathematics; R05 orders its prerequisite. |
| 4.3 Riesz polar decomposition | v = 2e₁, v = 0; cancellation; density e₁+e₂ | Variation 2δ₀ and polar e₁; zero gives variation 0 and 0/0 formula; cancelling terms yield 0, not 2H¹; vector (1,1) has norm √2, not 2 | R09 only. |
| 4.4 Riesz decomposition and both iff directions | Half-line; θ(t)=1+t² on L; constant θ; zero V | Half-line δ(X)=−X¹(0), H=0, σ=δ₀, η=−e₁; variable θ gives H=2t/(1+t²)e₁ and ‖H‖θ=2abs(t); constant θ gives H=σ=0, hence δ=0; zero gives zero measures | Correct, including tangential H for variable multiplicity. |
| 4.4 scaling | Circle radius R, dilation λ⁻¹ | New radius R/λ, ‖H‖=λ/R; k=1 total variation remains 2π = λ⁰·2π; half-line boundary atom remains mass 1 | Correct signs and powers. |
| 4.5 metric comparison | g=e^(4t), h=4g, Dirac, polynomial cutoff | Γ_g=Γ_h=2, δ_g=2, δ_hV^h=4; difference 2 versus claimed derivative-only bound 8/(3√3) | General estimate includes metric derivative and survives; R06 fixes Check. |
| 4.5 normal blow-up scaling | g̃_λ(y)=g̃(λy), constant rescaling, great circle | Dg̃_λ=λDg̃, D²g̃_λ=λ²D²g̃; mass λ⁻kμ(B_λR); variation λ^(1−k)‖δV‖(B_λR); great-circle Euclidean variation 0 | Correct; first-derivative error cannot give a general metric-change preservation theorem by itself. |
| 5.1 submanifold formula | Sphere; half-line; k=N | Sphere δ(X)=kHᵏ(S^k), H_V=−kx; half-line H=0 but boundary atom mass 1; full dimension B=0 and δ=0 | Correct, closedness matters. |
| 5.2 intrinsic/ambient comparison | Great S^k in S^N; affine ambient; k=0 | Intrinsic H=0, tr_S B_M=−kx, ambient H=−kx; affine B=0 so variations agree on tangent tests; k=0 traces and both variations 0 | Correct sign, fibre averaging, singular-measure transport and density normalization. |
| 6.1 monotonicity identity and boundary radii | Offset line a=1, σ<1<ρ=2; circle with same radii; circle σ=1 | Offset line LHS=√3, perpendicular integral=√3, δ=0; circle LHS=π, perpendicular integral=2π, variation integral=π; at σ=1 open-ball mass is 0 and the same annulus calculation holds | Correct minus sign and open/closed endpoint convention. |
| 6.1 weighted identity | Unit circle, h=1, ρ>2 | I=2π, derivative of ρ⁻¹I=−2π/ρ²; perpendicular-cutoff derivative=0, δ(X_ρ)=2π, so RHS=−2π/ρ² | Correct roadmap; source 40.4 has a sign misprint. |
| 6.2 Riemannian monotonicity | κ=0 flat; S² great circle κ=1 | Flat correction k√κ=0; circle mass 2ρ, ratio 2, exponential ratio 2e^ρ increasing; (1−x cot x)/x at π/2 is 2/π | Correct using the continuous κ=0 limit of the comparison coefficient. |
| 6.3 density existence and semicontinuity | Crossing lines; triple junction; step θ=1,2; half multiplicity | Densities at vertex 2,3/2,3/2 respectively; nearby values 1,1,2; step σ=δ₀ with η=−e₁ violates domination, and USC fails; θ=½ gives density ½ | Correct hypotheses; lower bound does not apply to θ=½. |
| 6.3 convergence of density bounds | Two parallel lines approaching one; shrinking circles | Limit density 2 ≥ 1 from either approaching line; shrinking-circle H=i has no common Λ, so their density 1 may disappear with mass→0 | Correct uniform domination guard. |
| 6.4 constancy statement and route | Zero on oscillating graph; v(L,3); W=ℝ, g=e^(2t)dt² | Graph area∞ but zero branch valid; v(L,3) gives θ₀=3; coordinate θ=1 constant while (θ√g)'=e^t | Previous repair sound; R02 fixes route. |
| 6.5 convex hull | Segment endpoints; unit circle with K={0}; Dirac with K={0}; k=0 control | Segment support equals endpoint hull and variation is two unit atoms; circle variation total 2π off K, so excluded; Dirac support=hull={0}; k=0 Dirac is stationary everywhere, showing why Layer 6 assumes k≥1 | Correct general-varifold extension of the radial test. |
| 7.1 density semicontinuity | i separated segments length 1/(2i); θ=½ line; g_i=(1+1/i)²e | Segment masses ½, variation 2i→∞, limit density ½; half line sequence fails density≥1; metric line weight factor 1+1/i, geodesic ball radius factor reciprocal, density stays 1 | Correct guards. |
| 7.2 tangent existence and weight invariance | Crossing, triple junction, diffuse lift, oscillatory angular measure | Tangent densities 2,3/2,0 and diffuse B₁ mass πλ→0; angular witness always μ(B_ρ)/ρ=2π but normalized cos θ moment flips −π/4→π/4 | Headline sound; R04 repairs proof route. |
| 7.3 rectifiability | Diffuse lift; vertical lift; triple junction; fractional line | Diffuse mass πr² gives Θ¹=πr/2→0; vertical lift Θ=1 but no bounded variation; triple junction θ=1 a.e.; fractional line θ=½>0 | Correct; each omitted-hypothesis control fails the relevant assumption. |
| 7.4 compactness hypothesis and Checks | Alternating parallel lines; one-corner zigzag; shrinking circles | Alternation has test integrals 1,0 but convergent even subsequence; zigzag total √2+2; shrinking circle mass 2π/i→0 and variation 2π | R03 and R07. |
| 7.5 multiplicity bound | m-plane; two sheets at ±ε/2; source parameter ε₀=.1 | m ≤ (1+δ)m+δ; two-sheet k=1 ratio is 2√(1−ε²/16), tending to 2; ε=.005 gives ε<ε₀²=.01 | Plane/slab tests sound; R08 records actual source powers. |
| 7.6 integral compactness | Coalescing integer lines; fractional line; half-filled segments | Limit of two lines has θ=2∈ℤ; constant fractional line has θ=½∉ℤ and fails integrality; half-filled segments have variation 2i→∞ | Correct statement after R03; integer truncation must be min, as the roadmap writes. |
| 8.1 rectifiable cones | Two planes; fractional plane; step multiplicity | Dilation returns original two-plane V; fractional plane has r⁻¹μ({Θ<1}∩B_r)=1≠0 but is nevertheless a cone; step r⁰‖δV‖(B_r)=1 | Correct sufficiency and vanishing-variation guards. |
| 8.2 integral cones | Smooth minimal plane; crossing planes; C_(1,1) | Densities 1,2; C_(1,1) link area 2π², ball mass 2π²/3, ω₃=4π/3, hence density π/2 and unchanged under dilation | Correct; integrality concerns a.e. multiplicity, not integer vertex density. |
| 9.1 regular/singular definitions and invariance | Crossing; abs(t)^(3/2) graph; V=0; fractional line | Crossing singular set {0}; derivative of graph 0 at 0, second derivative diverges as (3/4)abs(t)⁻½; zero reg=sing=∅; fractional line reg=L | Correct; support regularity does not encode multiplicity. |
| 9.2 locality and scaling | Circle restricted to open arc; dilation; rotations | Arc retains curvature magnitude 1 and σ=0 inside its open domain; dilation gives λ/R and density 1; rotating a crossing keeps density 2 | Correct, restriction interpreted in the new open ambient. |
| 9.3 current comparison | Oriented plane multiplicity 2; opposite orientation; cancellation | Both orientations give weight 2Hᵏ; T+(−T)=0 yields varifold 0, whereas v(P,1)+v(P,1)=v(P,2) | Correct comparison, not additivity of current-to-varifold assignment. |
| 9.4 consumer statements and cone repair | K=∅; punctured plane; V_i=V=v(C_(p,q),1) in B₁ | Punctured plane has same varifold and empty sing but missing origin; cone off 0 has dimension p+q+1=n, Hⁿ({0})=0, singular set {0}, and y_i=0 | The theorem translations and repaired cone notation are supported; R10 fixes closedness Check. |

### Source verification at the requested locators

All eight cited works are recorded under their existing manifest keys. The five accessible texts were read locally; no source needed fetching and the manifest was left unchanged. Printed page numbers below are distinguished from PDF page indices (Simon scan indices are printed page + 12). Version-specific references use exactly the arXiv versions recorded in the manifest. No extra unverified flag appears in README/plan; the preceding review's unread 42.9 hypothesis was additionally checked from its page image.

| Seeded target | Source and exact text opened | Outcome |
|---|---|---|
| 1.3 | Simon1983 line 7308–7326, §38, p. 229; AgnolettoCorreaHoyosDaSilvaNardulli2025 line 151–175, Definitions 2.1–2.3, pp. 3–4 | Radon measure on the plane bundle, projected weight, mass and restriction match. Manifold generality comes from the bundle construction; the auxiliary paper's complete/connected ambient is not silently claimed to prove the full local extension. |
| 1.4 | Simon1983 line 1038–1045, Theorem 4.4, p. 22; line 7336–7340, p. 230; line 7733–7774, pp. 242–243 | Locally bounded masses and compactly supported continuous tests match vague compactness and the specified convergence. |
| 2.1 | Simon1983 line 2276–2374, 11.4–11.9, pp. 60–63 | Positive locally integrable multiplicity, weighted approximate tangent, the measure criterion and its converse match; chart factor θ/J is the roadmap's change-of-variables consequence. |
| 2.2 | Simon1983 line 2861–2897, §15, pp. 77–78; line 7318–7326, p. 229; AgnolettoCorreaHoyosDaSilvaNardulli2025 line 166–175, p. 4 | Rectifiable lift uses the tangent of the weighted measure, allowing countably rectifiable carriers without unweighted local finiteness. Integral multiplicity is an a.e. condition. |
| 2.3 | Simon1983 line 2861–2867, p. 77; line 1855–1859, §8 graph area, p. 48; EdelenSpolaor2023 line 130–131, p. 4 | Multiplicity-one terminology and graph-area input support the construction; local finite area and embeddedness are explicitly retained. |
| 4.4 | Simon1983 line 7486–7509, 39.3–39.4, pp. 234–235; AgnolettoCorreaHoyosDaSilvaNardulli2025 line 269–303, Proposition 2.10, pp. 5–6 | Lebesgue decomposition, L¹_loc mean curvature and singular polar term match; roadmap's outward conormal sign is tested independently. |
| 5.2 | Simon1983 line 2005–2016, 9.6, p. 52; line 2954–2971, 16.4, p. 81; line 7675–7682, 41.2(3), p. 240 | Sources concern submanifolds/rectifiable or supported varifolds. The roadmap's general formula is the displayed tangential-divergence calculation, with proper inclusion and compactly supported tangent fields, not an unsupported direct quotation of an arbitrary-varifold theorem. |
| 6.1 | Simon1983 line 3016–3076, 17.2–17.5, pp. 83–84; line 7513–7547, 40.1–40.4, pp. 235–236; page images inspected | Identity and exponential correction agree. The roadmap correctly has −δV in the weighted identity despite the source misprint listed below. |
| 6.3 | Simon1983 line 7550–7565, 40.5, p. 237; line 3119–3152, 17.8–17.9, pp. 86–87; AgnolettoCorreaHoyosDaSilvaNardulli2025 line 1448–1546, pp. 14–15, and line 1680–1691, Theorem 2.30, p. 16 | A.e. existence and uniform-dominance USC are supported by monotonicity. The roadmap does not copy the auxiliary paper's stronger, false a.e.-USC assertion under only locally bounded variation. |
| 6.5 | Simon1983 line 3373–3400, 19.1–19.2, pp. 95–96; page images inspected | Source is in the rectifiable chapter. Its nonnegative radial test extends to arbitrary plane-bundle measures exactly as computed in the roadmap; k≥1 is essential and in scope. |
| 7.3 | Simon1983 line 7775–7790 and 7806–7881, 42.4–42.5 and proof, pp. 243–247; page image resolves omitted OCR hypothesis; AgnolettoCorreaHoyosDaSilvaNardulli2025 line 1796–1810, Theorem 2.32, pp. 17–18 | Positive density and locally bounded variation match. The intrinsic extension uses the roadmap's varying-metric/blow-up route; the source's unproved chart-preservation assertion is not used. |
| 7.4 | Simon1983 line 7882–7898, 42.7, p. 247, page image inspected | Density exceptions, uniform local mass/variation bounds and subsequence conclusion match the intended plan; R03 removes the additional convergence assumption from the README. |
| 7.6 | Simon1983 line 7899–7985, 42.8 and proof, pp. 247–250, including page 250 image | Integrality and the truncated fibre-multiplicity argument match. The roadmap correctly writes min. The supporting 42.9 scan now resolves R08. |
| 9.1 | AgnolettoCorreaHoyosDaSilvaNardulli2025 line 89–92, Definition 1.2, p. 2; Simon2023 line 73–83, p. 2 | Support-based regularity matches, with C¹ versus smooth explicitly distinguished. Simon's maximal-regular-carrier convention matters for R10. |
| 9.4 | Simon2023 line 84–96, Theorem 1.1, p. 2, and line 432–441, Theorem 3.7, p. 6; EdelenSpolaor2023 line 104–135, Definition 1.1.1/Remark 1.2/Theorem 1.4, pp. 3–4 | Dimensions, metric coefficients, smallness, closed K, stationary integral sequence and multiplicity-one minimizing cone match the stated consumer examples. For n≥8 the source explicitly supplies minimizing cones. R10 concerns the additional Check. |

Scharrer2022 line 823–854 (Lemma 2.7, p. 17), line 1120–1127 (Lemma 3.3, p. 20) and line 1184–1203 (Remark 3.4, p. 21) were also reopened for the Riemannian headline: the normal-ball domain and κ-radius restriction give exactly the bounded curvature correction used in 6.2.

The auxiliary paper's Remark 2.7 (line 256–263) introduces continuous-field extension before Definitions 2.8–2.9, so their use of continuous tests was not recorded as a source misprint. Its Proposition 2.6 proof does contain a separate flow error: in Euclidean space with X(y) = y near y = 1, exp₁(tX(1)) = 1+t has derivative 1, whereas X(1+t) = 1+t; the actual local flow is e^t. A compact cutoff does not change this witness near t = 0. The roadmap correctly uses the native flow.

A further source counterexample was computed: on a 2-plane take θ = 1+1_O, where O is dense open in a disc, has area less than half the disc and finite perimeter (choose balls with summable radii). Then |δv(P,θ)| = |D1_O| is locally finite. Density is 1 at almost every point of the positive-area complement but 2 inside O, so its lim sup is 2 there. This refutes the a.e.-USC clause of the auxiliary paper's Theorem 2.30, not this roadmap's correctly guarded 6.3.

### Pinned declarations and duplication by object

Both checked-out HEADs equal the manifest and plan: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The README has 50 identifier-only code tokens naming 49 distinct declarations (`normDet` is an abbreviated repeat). These resolve at the pins; none is a new declaration claimed by this design. The declaration files were opened, including the following substantive definitions and hypotheses:

| Object | Pinned declarations opened | Contract verified |
|---|---|---|
| Projections | `Mathlib/Algebra/Star/StarProjection.lean:29`; `Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean:131`; `Mathlib/Analysis/InnerProductSpace/Adjoint.lean:507`, 513 | Idempotence plus self-adjointness, projection onto a submodule, characterization by range; finite-dimensional completeness discharges the projection assumptions. |
| Radon measure ingredients | `Mathlib/MeasureTheory/Measure/MeasureSpaceDef.lean:77`; `Map.lean:96`; `Restrict.lean:50`; `Typeclasses/Finite.lean:343`; `Regular.lean:1183` in the same directory | Measure itself includes no topological separation or local finiteness. `IsFiniteMeasureOnCompacts` supplies compact finiteness; regularity instance needs pseudometrizability, σ-compactness and Borel structure, supplied by 1.2. |
| Scalar Riesz and extensionality | `Mathlib/MeasureTheory/Integral/RieszMarkovKakutani/Real.lean:66`, 341, 408 | Positive functional representation and equality on compactly supported real tests; regularity and finite-on-compact contexts retained. |
| Signed Riesz | `TauCeti/MeasureTheory/Integral/RieszMarkovKakutani/Signed.lean:160`, 205, 262 | `posPart`, `negPart`, and difference of their integrals for an order-bounded functional. These are cited rather than redefined. |
| Lebesgue decomposition/disintegration | `Mathlib/MeasureTheory/Measure/Decomposition/Lebesgue.lean:73`, 80; `Mathlib/Probability/Kernel/Disintegration/StandardBorel.lean:361` | Singular part and Radon–Nikodym density; conditional kernel takes a finite product measure. 3.3 explicitly uses finite chart restrictions before gluing. |
| Differentiation | `Mathlib/MeasureTheory/Covering/Besicovitch.lean:155`, 1020, 1077, 1088; `BesicovitchVectorSpace.lean:500`; `Vitali.lean:460`; `Differentiation.lean:856` | Closed-ball differentiation, finite-dimensional covering, and Vitali doubling at every point of its carrier; D' in 3.3 meets that last requirement. |
| Hausdorff/Jacobian | `Mathlib/Geometry/Euclidean/Volume/Measure.lean:68`, 191; `Mathlib/Analysis/InnerProductSpace/NormDet.lean:69`, 433 | Native normalized measure on extended metric spaces; equality with volume; norm determinant is zero on noninjective maps and scales Hausdorff image measure. |
| Manifold carriers | `Mathlib/Geometry/Manifold/IsManifold/Basic.lean:164`, 777, 1033; `Mathlib/Topology/VectorBundle/Riemannian.lean:420`; `Mathlib/Geometry/Manifold/Riemannian/Basic.lean:80` | `ModelWithCorners`, `IsManifold`, `TangentSpace`, fibre metrics and equality of edist with Riemannian edist. `IsManifold` alone supplies neither Hausdorffness nor second countability; Conventions supplies both. |
| Connection and divergence | `Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:360`; `TauCeti/Geometry/Manifold/Riemannian/Laplacian.lean:55`; `DivergenceTheorem.lean:225` in that Tau Ceti directory | C² manifold/C¹ metric for the connection and divergence; smooth, Hausdorff, σ-compact, boundaryless manifold and compactly supported C¹ field for the manifold integral theorem. |
| Volume and flat divergence | `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82`; `TauCeti/MeasureTheory/Integral/DivergenceTheorem/CompactSupport.lean:30` | Chart density √det g; flat divergence theorem in positive dimension. The C² submanifold route uses the flat theorem in charts. |
| Flows | `TauCeti/Geometry/Manifold/IntegralCurve/GlobalFlow.lean:60`, 147, 190; `TauCeti/Geometry/Manifold/Flow/Complete.lean:144` | Complete field, C¹ or specified higher regularity, Hausdorff boundaryless manifold; compact-support completeness also needs complete model space, supplied by finite dimension. |
| Rectifiability and compactness | `TauCeti/Geometry/MeasureTheory/Rectifiable/Basic.lean:44`, 74, 78, 122, 135; `TauCeti/MeasureTheory/Measure/Prokhorov.lean:52` | Countable Lipschitz patches modulo normalized-Hausdorff null sets, with no measurability in the predicate; tight finite-measure sets with bounded mass. Extra measurability is explicit in 2.1–2.2. |
| Other Grassmannian | `Mathlib/RingTheory/Grassmannian.lean:66` | Algebraic projective-quotient/rank carrier, not the metric projection bundle; correctly not used as its substitute. |

Object searches at both pins found no varifold or approximate-tangent-plane carrier. `TauCeti/Analysis/Distribution/Mass/Measure.lean:16` and its mass-measure construction were also inspected: it treats Euclidean vector-valued test functions and domination, not the polar representation on the nontrivial tangent bundle of 4.3. The latter remains a legitimate manifold extension built from the scalar suppliers, rather than a second generic scalar Riesz theorem.

### Suppliers, current heads, overlaps and direction

All four roadmap suppliers resolve on main, content HEAD `83bb79f5`; no open revision is needed for their section ids:

- `TauCetiRoadmap/GeometricMeasureTheory/README.md:148`, G2, supplies tangents of locally finite rectifiable sets, their measurability, graph agreement and weighted/tangential area formula. Its scope at line 12 excludes varifolds.
- `TauCetiRoadmap/GeometricCurrents/README.md:219` and 229, G1, supplies constancy and the arbitrary-distribution derivative criterion. G2 at 240–275 supplies chart transport, current representation, mass and smooth volume comparison; G5 at 638 supplies local area minimization. G6 at 668–690 supplies the unoriented bundle, its compactness and auxiliary current varifold. Varifolds 1.2 transports that bundle; 9.3 compares the objects, so supply runs from GeometricCurrents to Varifolds.
- `TauCetiRoadmap/RiemannianGeometry/README.md:2108`, R4 item 1, supplies radial Hessian zero and transverse lower/upper curvature bounds. R5a at 2840 and R5a.2 at 2997–3037 supply B, the averaged curvature, its sphere sign and first variation. R5b at 3216 exists but is only an excluded consumer feature in this design.
- `Completed/HopfRinow/README.md:229`, 264, 427, Layers 0–2, supplies reconciled distance, exponential map, local logarithm, Gauss lemma and the local distance identity. Connectedness is only needed to replace an extended distance globally by a finite one; the design retains extended distance and uses small normal balls.

`roadmaps resolve` reports no missing cross-roadmap citation. Its output explicitly says its own library-name check was unavailable; that was not counted as pin verification. The direct file checks above supply that evidence instead.

Read the board package index before the absence claims. Its three entries (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) do not own these geometric objects. The supplied open-roadmap index and `roadmaps grep` were used for varifolds, approximate tangents, Grassmann bundles, Riesz representation and metric Lie derivatives. No open head owns a conflicting general varifold library. Relevant nearby heads were read:

| Open roadmap | File and location | Ownership resolution |
|---|---|---|
| #956 PositiveMass | `TauCetiRoadmap/PositiveMass/README.md:18` | Owns AE geometry, ADM mass and positive-mass theorems; imports current/minimal-hypersurface geometry. No ownership of general varifold carriers or Allard compactness. |
| #946 CalibratedGeometry | `TauCetiRoadmap/CalibratedGeometry/README.md:43` | Owns oriented frame-quotient Grassmannian/calibration interfaces. The projection presentation compared through GeometricCurrents G6 is a different adapter, with the earlier owner's quotient retained. |
| #1506 ManifoldOptimization | `TauCetiRoadmap/ManifoldOptimization/README.md:10` | Consumes GeneralizedCohomology's smooth Grassmannian and adds Riemannian optimization geometry. It does not build this unoriented plane-measure theory. |
| #1023 RicciFlow | `TauCetiRoadmap/RicciFlow/README.md:16` | Owns metric-family/parabolic theory on closed manifolds. The local first-variation calculation in Varifolds is not a second generic metric-flow carrier. |
| #417 PointProcesses | `TauCetiRoadmap/PointProcesses/README.md:554` | Owns general locally finite/random measure and vague-topology interfaces. Varifolds uses specialized convergence on the earlier G6 bundle and pinned measure carriers; it neither cites this prohibited supplier nor rebuilds its random-measure carrier. |

The additional approximate-tangent hit in #1609 SobolevDifferentialForms is a trace on rectifiable boundaries, not another tangent-plane construction. The supplied overlap report records no conflicting change, dropped cited id or revision-only citation. A fresh `roadmaps overlaps Varifolds` returned “no roadmap Varifolds on main or in an open roadmap pull request”, as expected for this board design; this is not treated as evidence of an empty ownership search. The supplied overlap leads were checked as above.

The required dependency gate output was:

```text
candidate: Varifolds is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 229 roadmaps, 2056 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The design's absence from the order is not a defect. This cross-roadmap gate does not catch the internal ordering problem R05.

### Headlines, Lean form and padding

The Summary's headline list is: Riesz decomposition (4.4); Euclidean/Riemannian monotonicity (6.1–6.2); densities and semicontinuity (6.3); Allard rectifiability (7.3); rectifiable/integral compactness (7.4, 7.6); varifold tangents and rectifiable/integral cones (7.2, 8.1–8.2); constancy (6.4); intrinsic/ambient comparison (5.2); and comparison with the auxiliary current varifold (9.3). The convex hull theorem 6.5 is an additional substantial target. The two 9.4 consumer examples are expressly not headline targets.

This is a design package: no `Suggested.lean` exists. Thus no sorried theorem, import, binder, sorry'd data, `set_option`, padding declaration or own backticked Lean name exists to test. The one-tactic probe and mechanical `#check @name` comparison have zero declarations to act on; they were not claimed to pass. Elaboration: **not available (this lane does not elaborate; say so in the report)**. No Lean command was run.

For the package, native continuous-linear-map projections, measures, Hausdorff measure, connection and countable rectifiability support simple definitions for the Euclidean/general-varifold statements: 4.4, 6.1–6.3, 6.5, 7.2 and the measure/variation part of compactness should not be replaced by elementary stand-ins. The submanifold/constancy/embedded-comparison statements need actual submanifold predicates and induced geometry; rectifiable and integral lift/cone statements need weighted approximate tangents, which are not present at these pins. The current comparison additionally needs the supplier's locally integral current and auxiliary varifold. A package must state each headline that its retained simple definitions make expressible and name the precise missing carriers for the others in its module docstring. This design review does not pre-approve an absent Lean file or certify a future decision to omit a statable theorem.

## Not verifiable

- Federer1969 §§2.5, 2.8, 3.2; Allard1972 §§3–6, 8; Maggi2012 Part II: settled as uncertified/paywalled. No text was requested again, and no new missing-reference entry was created.
- Full source certification of the C²-varying-metric extension of 7.5: Simon's lemma is Euclidean; no cited accessible theorem states the extension. Its metric comparison and scaling were checked, but the design supplies only a proof sketch, with parameter accounting requiring R08. The missing OCR formula itself is now verified from the scan and is no longer an access limitation.
- Lean elaboration, tactic probes and elaborated binder types: unavailable in this design lane and there is no Lean file. No claim of a successful build or “sorry only” warnings is made.

## Source issues

- **Misprint** in Simon1983 at 40.4, printed page 236: the source says the weighted radial identity adds the first variation; it should be subtracting the first variation under its definition δV(X) = ∫div_S X; affects a stated result.
- **Misprint** in Simon1983 at 42.8 proof, printed page 250: the source says max{ψ_i,N} converges to θ₀ in L¹ for N > θ₀; it should be min{ψ_i,N}; affects the proof.
- **Error** in AgnolettoCorreaHoyosDaSilvaNardulli2025 at Proposition 2.6 proof, arXiv v3 page 5: the source says exp_x(tX(x)) solves the vector-field flow equation; it should be using the actual flow, or only the first-order variation furnished by this exponential map; affects the proof.
- **Error** in AgnolettoCorreaHoyosDaSilvaNardulli2025 at Theorem 2.30, arXiv v3 page 16: the source says locally bounded first variation implies pointwise upper semicontinuity of density at almost every point; it should be retaining a.e. density existence and adding a local domination hypothesis for this upper-semicontinuity assertion; affects a stated result.
- **Gap** in AgnolettoCorreaHoyosDaSilvaNardulli2025 at Theorem 2.32 proof, arXiv v3 pages 17–18: the source says smooth bi-Lipschitz chart push-forward preserves locally bounded first variation without an argument; it should be supplying a valid metric-aware rectifiability argument, since metric comparison introduces a derivative-of-test-field error; affects the proof.
