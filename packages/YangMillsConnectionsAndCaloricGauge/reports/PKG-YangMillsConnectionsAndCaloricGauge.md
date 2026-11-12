# Package report: YangMillsConnectionsAndCaloricGauge

The package is `packages/YangMillsConnectionsAndCaloricGauge/README.md`,
`packages/YangMillsConnectionsAndCaloricGauge/Suggested.lean`,
`packages/YangMillsConnectionsAndCaloricGauge/metadata.toml` and
`packages/YangMillsConnectionsAndCaloricGauge/sources.toml`. Only the top-level `gaps` value of
`packages/YangMillsConnectionsAndCaloricGauge/design/plan.json` changes. A structural comparison
with its original JSON confirms that every other value is identical.

The plan-generated skeleton was compared against the accepted prose before expanding it. The
README retains all 52 target sections, all design Checks and all worked examples, in ten layers,
each with Examples and Dependencies. Additional negative controls make the corrections below
reviewable. The shape was compared with PDE, SmoothBundlesConnections and LieGroups on main.
`topic = "math.AP"` follows the repository's one-field metadata form.

## Headline inventory, established before writing Suggested.lean

Each entry is **not statable at the pins**, at the full regularity and generality promised in
the README, under the rule allowing only a few simple definitions. There are no stated substitutes.
The module docstring records every entry. The restriction here is the acceptance file's definition
budget, not a claim that these mathematical objects cannot eventually be encoded in Lean.

| Headline | Status and missing carrier |
| --- | --- |
| §3.2 Gauge invariance of weak curvature and finite energy | Not statable: critical local matrix-Sobolev connections and their gauge action/weak curvature. |
| §4.1 Uhlenbeck's Coulomb gauge, uniqueness and continuity for all compact G, d ≥ 3 | Not statable: those rough carriers, their critical normal trace and curvature norm. |
| §4.2 Critical point removal | Not statable: rough bundles and gauges on punctured domains, with the same trace/curvature interface. |
| §5.2 Quantitative good global gauge | Not statable: rough connection, homogeneous remainder and gauge at infinity. |
| §5.4 Topological class, gauge invariance and locality | Not statable: the quotient built from rough gauges at infinity, including disconnected G. |
| §5.5 Characterisation of the trivial class | Not statable: that class and its homogeneous potential carrier. |
| §6.2 Characteristic-number transgression and topological invariance | Not statable: weak curvature, evaluation of invariant polynomials and the topological-class carrier. |
| §6.3 Integrated Bogomol'nyi bound and equality characterisation | Not statable: the energy and characteristic number of a rough finite-energy connection. An inequality for six unrelated fields would omit the connection carrier. |
| §6.4 Integrality and classification by the SU(2) instanton number | Not statable: that characteristic integral and the rough topological-class quotient. |
| §§7.2–7.3 Harmonic regularity, point removal and decay | Not statable: critical weak harmonic connections and their gauge/curvature data. |
| §7.5 Sharp energy gap | Not statable: the same harmonic-connection and energy carriers. |
| §7.7 Ground state energy and attainment | Not statable: the set of nontrivial finite-energy weak harmonic connections and its energy. |
| §8.2 Covariant elliptic invertibility | Not statable: realised homogeneous Sobolev/Besov spaces and the covariant Laplacian on their distribution domains. |
| §§8.3–8.4 Covariant parabolic estimates and decay | Not statable: those spaces, mixed dyadic time norms and the covariant evolution problem. |
| §§9.3–9.4 Local well-posedness, stability and continuation | Not statable: the homogeneous connection space, local-caloric solution carrier and maximal lifespan/caloric size. |
| §9.5 Flat limits of nonlinear and linearised flows | Not statable: the flow and limit operators on the same spaces. |
| §9.6 Dichotomy Theorem | Not statable: maximal critical flow and harmonic-bubble convergence. |
| §9.7 Threshold Theorem | Not statable: flow, ground state and caloric-size carriers. |
| §§10.1–10.2 Pure gauges and the caloric-gauge theorem | Not statable: flat homogeneous connections, their critical gauges and the caloric subset. |
| §§10.3–10.4 Caloric bounds and C¹ split caloric manifold | Not statable: the Banach graph space ℋ and its caloric subset; the native embedding predicate alone is insufficient. |
| §10.5 Tangent spaces and nonlinear div–curl decomposition | Not statable: those carriers and the linearised flow/limit/projection operators. |

Why the native APIs do not fill these gaps: `TauCeti.Wkp` is a scalar inhomogeneous graph space;
its finite products give coefficient Sobolev spaces, but do not give a rough gauge action,
curvature, topological class or flow. `CovariantDerivative` is a smooth vector-bundle connection
operator, not the critical rough principal connection of §3.1. Native alternating maps, the Hodge
star and `Lp` could express the algebraic bound on arbitrary curvature-shaped fields; replacing
§6.3 by that algebraic statement would fail the actual-object requirement. Building a weak
matrix connection, its derivatives, admissible gauge action and evaluated characteristic forms
inside Suggested.lean would be an ad hoc reconstruction of Layers 1–3, rather than a few simple
definitions. Smooth-only statements would omit the critical weak regularity. None was substituted.

## Corrections and limits of support

1. **Critical exponent.** The source expressly fixes p = d/k > 1 (OhTataru-TopClass line 991).
   The critical theorems now bind 1 ≤ k < d. The underlying Sobolev definitions retain every
   integer order and every p ≥ 1. The design had allowed k ≥ d without support for its route.
2. **Gauge sign witness.** The plus-sign affine formula is itself an action, so composing it
   with its inverse is not a negative control. The replacement computes curvature: for
   O = exp(x₁i)exp(x₂j), R = dO O⁻¹ has F₁₂[R](0) = 4k, whereas F[−R] = 0.
3. **Zero algebra and rescaling.** γ₀ is a closed-unit-ball maximum. This supplies the zero
   algebra with an attaining pair, avoids an empty nonzero-pair maximum, and explicitly requires
   c > 0 for metric rescaling. The cubic equality uses the absolute value for negative λ.
4. **Adjoint derivative.** The action on W⁰,p remains continuous; its almost-everywhere derivative
   identity is asserted for k′ ≥ 1, where a weak derivative exists.
5. **Top-order adjoint action.** The endpoint k′=k needs B in Wᵏ,d/k∩L∞,
   with the intersection topology. For d=4,k=1, O=exp(√log(1/r) i),
   B=√log(1/r) j each have fourth-power derivative integral proportional to
   ∫₁∞L^−2dL=1, but the rotating derivative of Ad(O)B has size 1/r and infinite
   L⁴ integral. The unqualified endpoint printed in OhTataru-TopClass line 1116–1123
   is false. The lower-order range used for rough connections is unchanged.
6. **Exterior Sobolev maps.** §2.5 uses local G²,d/2 and globally Lᵈ first derivative. A unitary map
   has Frobenius norm √N, so the previous inhomogeneous exterior condition had no elements.
   The same correction is made in §5.3's use of this result. Annulus radii and its collar δ are positive.
7. **Quantitative global gauge centre.** R_c is an infimum over centres. §5.2 chooses a centre
   x₀ and radius 2R, then states the formula in y = x − x₀. This does not assume attainment of
   that infimum or silently fix its centre at the origin. The bounds still depend only on R/r.
8. **Perturbation chart.** In §5.4 the addition A+b and homogeneous approximation use a good
   representative. A = −2x₁i dx¹ is smooth and flat, b = j dx²/(1+|x|²) belongs to Ḣ¹, but
   [A,b] has nonintegrable curvature energy. Thus the unrestricted assertion in an arbitrary
   rough global gauge is false. The good-representative hypothesis is precisely what Hardy's
   inequality in §6.1 uses. The source's surrounding convention is a good global potential
   (OhTataru-TopClass line 376–386), before its perturbation assertion at line 412–418.
9. **Elliptic variational sign.** With Δ_A = D^jD_j the functional for Δ_AB = F is
   ½‖DB‖² + ⟨B,F⟩. The minus sign at OhTataru-YMHF line 974 produces Δ_AB = −F instead.
10. **Envelope degeneracies.** Zero data admit the zero envelope; slow variation is written
   without division. The convolution enlargement requires finite defining sums; d ∈ ℓ² and
   0 < σ̃ < σ(1−ε) suffice. The printed Lemma 3.5 lacks this qualification
   (OhTataru-YMHF line 922–929).
11. **Heat endpoint trace.** General p = ∞ data have a distributional and dyadic initial trace.
    Full norm continuity is asserted on the heat-semigroup-continuous subspace. For σ = −1,
    b = |D|sign(x₁) gives a norm difference of 1 for every positive heat time, contradicting
    the unrestricted endpoint at OhTataru-YMHF line 1356. The full dyadic estimate is retained.
12. **Weighted bounds.** The ds/s weight in §9.2 is s^(n/2+1−2/q). The extra 1/4−1/p printed
    in OhTataru-YMHF line 1792–1800 is incompatible with parabolic scaling. The stated bound
    follows by weighted covariant Sobolev interpolation from Proposition 5.7; its finite
    constants depend on the initial curvature norm as well as Q, including the dynamic norm.
13. **Finite endpoints.** Only finite s₀ admits a strictly larger interval in §9.4; require a
    positive bound Q for its factor 2Q. Infinite s₀ gives the limit theorem. A zero flat flow
    tests the distinction. The lifespan Check now says what scaling actually proves for a
    finite lifespan, without assuming existence of finite-time singularities.
14. **Threshold proof.** Local convergence does not preserve total characteristic number.
    The route uses the opposite characteristic integral on the exterior, so the total energy
    is at least ℰ_e(Q)+|χ(Q)| ≥ 2E_GS (OhTataru-YMHF line 2942–2988).
15. **Other precision.** E_GS is explicitly extended nonnegative real; the orbit formula is a
    pseudometric until taking constant-conjugation orbits; the L² tangent closure means the
    closure of T_a𝒞∩L²; and bubbling gauges act in the rescaled coordinate. The self-dual BPST
    square-root-curvature computation fixes the cubic sign. Layer 8 follows Layer 1, and §4.3
    precedes its use in §4.1, correcting the introductory build-order sentence.

16. **Curvature operator and index order.** With §1.6’s actual definition of 𝔉,
    the harmonic Weitzenböck term is −⟨F⁺,𝔉(F⁺)⟩. At the centre of the
    self-dual BPST solution, half the Laplacian of its squared curvature norm is −768,
    its covariant gradient is zero, and the pairing is +768. The accepted plus sign
    would be false. The corrected sign agrees with GurskyKelleherStreets-GapTheorem line 142.
    The heat-curvature identities are written with all-lower indices to fix which pair
    is reversed: A₁=i,A₂=j,A₃=k gives ∂sF₁₂−Δ_AF₁₂=−16k,
    whereas reversing the first curvature pair on the right would give +16k.
17. **Higher convergence.** §4.3 explicitly requires convergence of the covariant curvature
    derivatives at the corresponding orders before upgrading the Coulomb potentials.
    Higher convergence of the gauges also requires ordinary higher convergence of the
    original potentials. The base W¹,² convergence alone is insufficient: the Coulomb
    fields n^(−3/2)sin(nx₁)i dx² converge there, but their second derivatives grow
    as n^(1/2). The angular operators, all exponents and interior domains are now written out.
    The dynamic A₀ equations are also written explicitly; their additive freedom is
    described in the infinitesimal reconstruction with B changing by DC, rather than
    as a change of A₀ alone in a fixed full dynamic connection.

18. **Representative in the converse at infinity.** §5.3’s converse produces a
    gauge-equivalent global potential with the prescribed homotopic angular gauge. It does not
    change the angular gauge of one fixed matrix potential while keeping that potential fixed.
    For A=0 and O∞=exp(i x₁/abs x), the remainder required by the latter assertion would have
    Lᵈ integral C∫₂∞dr/r=∞. A global pure gauge with smoothly extended phase gives the actual
    converse. This resolves the ambiguity between an abstract connection and its chosen potential.

The accepted source corrections are retained: disconnected-group Ad invariance and the two-sided
constant quotient; the corrected adjoint Leibniz rule; positive rather than unit cut-offs on
possibly touching sets; the cut-off vanishing at the origin; the form-pairing factor; the global
higher-regularity hypothesis; the dyadic ℓ²L¹ estimate; the justified negative-index flat-limit
range; the factor 2 in dissipation; and the ℋ bound and complemented-chart route in §10.4.
The full C¹ chart condition remains Mathlib's `Manifold.IsSmoothEmbedding`, as required by the
accepted review; it was not replaced by a merely injective derivative or a C¹ parametrisation.

No theorem text was fetched anew. All six certified texts supplied in the brief were read at the
locators used. The six uncertified works remain settled, cited by locator only. No source text
was copied into a deliverable. The manifest keeps its twelve original keys and records the
arXiv numbering actually read. No published-numbering comparison is claimed.

## Duplication and ownership sweep

The sweep used the roadmap service over main and the open heads, the board's package files, and
both pinned libraries. Searches were by objects: critical group-valued Sobolev maps, rough
connections, gauge covariance, Uhlenbeck and BPST, invariant metrics and compact splitting,
compact real roots and rank-one subalgebras, nearest-point tubes, transgression/Cartan forms,
Hodge star/self-duality, homogeneous Sobolev and Besov spaces, frequency envelopes, covariant
elliptic/parabolic equations, and split Banach submanifolds. Source files behind the important
hits were read, rather than relying on name matches.

| Object excluded from independent ownership | Existing owner and exact consumed boundary | Package action |
| --- | --- | --- |
| Generic matrix groups and exponential | Mathlib `Matrix.unitaryGroup`, `Matrix.specialUnitaryGroup`, `NormedSpace.exp`, `Matrix.isUnit_exp` | Consume their native carriers. §1.1 bundles a compact subgroup and prescribed metric; it does not define a competing unitary group or exponential. |
| Generic Lie algebra, Ad/ad and closed-subgroup theorem | LieGroups Layers 0–2 | §1.1 is the matrix/trivialisation specialisation. |
| Compact invariant metric, skew-adjointness and centre/derived splitting | LieGroups Layer 5A on main | Deleted the standalone orthogonal-ideal/splitting API bullet in §1.1; added its supplier contract. Matrix trace evaluation and compatibility remain. |
| Compact real root planes and normalised root su(2) subalgebras | LieGroups Layer 6, “Compact real roots and the Weyl comparison”, “Rank-one representatives” | Deleted their reconstruction from the supplier request. The same gap slug now asks only for metric extremality, which that section does not state. |
| Smooth principal connection, curvature, Bianchi and gauge action | SmoothBundlesConnections B3.1, B4.1–B4.2 on main | §1.3 proves agreement of local Euclidean formulas, used at weak regularity in §3.2; the generic smooth constructions are consumed. |
| Scalar Wᵏ,p and weak derivatives | Tau Ceti Sobolev graph spaces; PDE §§1.2, 1.4–1.6 | §2.1 uses finite products, with basis-independent coefficient comparison and G-valued membership. No new scalar hierarchy. |
| Tubular neighbourhood/local normal retraction | Tau Ceti's normalTube and normalRetraction theorems | §1.2 adds the globally unique nearest-point property and derivative formula, neither supplied by the local retraction alone. |
| Pointwise scalar Hodge star and Gram pairing | Tau Ceti `Orientation.formHodgeStar` and paired wedge | §1.5 gives the coefficient-valued self-dual/Bogomol'nyi specialisation; no new star construction. |
| Invariant symmetric polynomials and bundle Chern–Weil classes | CharacteristicClasses C4 item 1 | Euclidean transgression, Cartan forms and critical noncompact characteristic numbers remain, without a new bundle-class comparison. |
| General forms, integration, Stokes, degree | DifferentialGeometry Layers 0–1, §§5.2–5.4, 10.3–10.5 | Consume, including the integral degree normalisation. |
| Sphere/cube homotopy comparison, Hurewicz, homological degree | AlgebraicTopology Stage 8 item 3 and Stage 6 item 5, mapped on main to §§8.3 and 6.5 | Consume; retain the valid former-numbering citations supported by its explicit mapping. |
| Scalar dyadic blocks, homogeneous Besov, paraproduct decomposition and heat semigroup | PDE §§6.1, 6.3, 7.1–7.3 | Narrowed Layer 8's ownership to finite-dimensional coefficient specialisations, ℋ and covariant results. The L² product estimates are application estimates from the supplied decomposition. |
| Sharp scalar Sobolev constant | Yamabe Y2 item 1 | Consume the scalar theorem, not reconstruct its sharp-constant proof. |
| Compact/closed-base SU(2) instanton moduli and S⁴ BPST | FourManifolds Layer 5 and §5.3; InstantonFloerTheory IF1 | Not suppliers. The kept Euclidean/all-compact-group critical results differ in group, dimension, roughness and noncompact domain; the explicit ℝ⁴ potential is needed by the heat flow. |
| Generic real weak exterior forms and Hilbert de Rham complex | SobolevDifferentialForms Layers 1–7 | Not consumed or rebuilt. This package uses coefficient derivatives, rough gauge algebra and critical curvature instead. |

Those are all duplication removals: one explicit generic splitting API bullet, the generic
root/rank-one construction in the gap, and generic-construction wording for smooth connections,
scalar Sobolev and homogeneous Besov spaces. No numbered target or Check was deleted; compatible
specialisations remain and their difference is explicit in Scope and ownership.

The closest open scopes were read: FourManifolds (compact/local SU(2), closed-base moduli),
InstantonFloerTheory (SO(3) adapters, three-dimensional and cylindrical/perturbed Floer theory),
SobolevDifferentialForms (real weak exterior forms), IncompressibleFlows (velocity, Leray and
Stokes), and PDE's revision. None supplies the critical Euclidean Yang–Mills heat-flow or caloric
manifold carrier. IncompressibleFlows is never a supplier; abelian Leray projections occur only as
explicit Fourier Checks of our covariant decomposition. The generic split Banach subset notion
is not owned by the LieGroupoidsPoisson path-space assertion: that roadmap uses such a property
for one particular path space rather than defining the general notion. No second owner was found
for the remaining gauge-specific targets.

Ownership against the available open heads was checked. The overlaps data reports no shared
change to this roadmap and no broken cited id; no dependency is defined only by an open revision.
The main numbering of all suppliers was used. The accepted design's mention of missing root
subalgebras was corrected against the actual main LieGroups text, not remembered from its review.
There are no copied fully qualified declaration names in Suggested.lean, which declares no objects.

No new notion was moved from a later roadmap. The general Euclidean weak gauge theory, its
pointwise coefficient identities and its homogeneous covariant operators are owned here and need
no later FourManifolds, InstantonFloerTheory, SobolevDifferentialForms or fluid theorem. The
closed-base Yang–Mills theory stays outside this package. The mathematical content already placed
here by the accepted design is preserved.

## Supplier and pin audit

The manifest pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti
`2fd255d997f47c0b5d834ee416c7015d55444ce5`. The content HEAD is `4ec889e8`.
The resolver found no missing cross-roadmap citation or Lean name, but explicitly did not inspect
library names. Those were therefore checked separately at these pins.

All file references in the following table are relative to the appropriate pinned package root.

| Native API inspected | File and line; actual scope |
| --- | --- |
| Matrix.unitaryGroup; Matrix.specialUnitaryGroup | Mathlib `LinearAlgebra/UnitaryGroup.lean:105,278`; submonoids, with the inherited unitary group structure, not a specified compact subgroup G. |
| NormedSpace.exp; NormedSpace.exp_add_of_commute; Matrix.isUnit_exp | Mathlib `Analysis/Normed/Algebra/Exponential.lean:128,521`; `Analysis/Normed/Algebra/MatrixExponential.lean:145`. |
| ContinuousMap.Homotopic and its equivalence relation | Mathlib `Topology/Homotopy/Basic.lean:333,354`; quotient relation on continuous maps. |
| HomotopyGroup | Mathlib `Topology/Homotopy/HomotopyGroup.lean:441`; a cubical homotopy quotient, not spherical degree classification. |
| MeasureTheory.Lp | Mathlib `MeasureTheory/Function/LpSpace/Basic.lean:89`; Lp classes, not a gauge group or homogeneous Sobolev space. |
| MeasureTheory.eLpNorm_le_eLpNorm_fderiv_of_eq | Mathlib `Analysis/FunctionalSpaces/SobolevInequality.lean:602`; finite-dimensional real codomain, compact support and C¹, p ≥ 1 and positive domain dimension. No density or completed homogeneous-space realisation is included. |
| MeasureTheory.Measure.toSphere; homeomorphUnitSphereProd | Mathlib `MeasureTheory/Constructions/HaarToSphere.lean:52`; `Analysis/Normed/Module/Ball/RadialEquiv.lean:71`; polar-coordinate measure and punctured radial homeomorphism. |
| ContDiff; HasFDerivAt; Orientation.volumeForm | Mathlib `Analysis/Calculus/ContDiff/Defs.lean:1067`, `Analysis/Calculus/FDeriv/Defs.lean:123`, `Analysis/InnerProductSpace/Orientation.lean:170`; checked by elaborating their full explicit types. |
| Submodule.ClosedComplemented | Mathlib `Topology/Algebra/Module/Complement.lean:87`; existence of a continuous projection to the submodule. Closedness of the chart model E is also required explicitly. |
| Manifold.IsSmoothEmbedding; Manifold.IsImmersion | Mathlib `Geometry/Manifold/SmoothEmbedding.lean:70`; `Geometry/Manifold/Immersion.lean:802`; immersion plus topological embedding, with one complement type for the immersion. |
| Manifold.IsImmersion.isDiffImmersionAt | Mathlib `Geometry/Manifold/Immersion.lean:1008`; requires differentiability order nonzero and supplies a continuous derivative left inverse. It is not the converse. |
| TopologicalSpace.Opens.instChartedSpace | Mathlib `Geometry/Manifold/HasGroupoid.lean:284`; open-subset chart structure. |
| ContDiffAt.toOpenPartialHomeomorph; ContDiffAt.to_localInverse | Mathlib `Analysis/Calculus/InverseFunctionTheorem/ContDiff.lean:31,66`; RCLike scalars, complete domain, invertible derivative and nonzero differentiability order. |
| TauCeti.HasWeakFDerivOn | TauCeti `Analysis/Sobolev/WeakDeriv/Basic.lean:251`; native definition is directional weak differentiation in every direction. Local integrability follows from its weak-line derivative data; it does not impose global Lp membership. |
| TauCeti.W1p; TauCeti.Wkp | TauCeti `Analysis/Sobolev/W1p/Basic.lean:372`; `Analysis/Sobolev/Wkp/Basic.lean:145`; scalar weak-derivative graph spaces, with p ≥ 1 and finite-dimensional real Euclidean domain/Haar measure. |
| TauCeti.W1p.morreyRepresentative; TauCeti.enorm_sub_le_of_mem_ball_of_finrank_lt | TauCeti `Analysis/Sobolev/W1p/Morrey.lean:156`; `Analysis/Sobolev/Morrey.lean:181`; scalar representative and complete-codomain smooth Morrey estimate, used through PDE's extension/embedding theory. |
| TauCeti.exists_isOpenEmbedding_normalTube | TauCeti `Geometry/Manifold/TubularNeighborhood/Euclidean.lean:351`; compact boundaryless C² manifold, injective immersion, finite-dimensional inner-product target, positive tube radius. |
| TauCeti.exists_contMDiffOn_normalRetraction | TauCeti `Geometry/Manifold/TubularNeighborhood/LocalInverse.lean:46`; a local normal retraction, requiring C^(n+1), n ≥ 1 and injective derivative. No global nearest-point uniqueness is asserted. |
| Orientation.formHodgeStar; wedge identity; even-degree involution | TauCeti `Analysis/InnerProductSpace/HodgeStar/AlternatingForm.lean:76,111,157`; real alternating forms with degree sum equal to finite dimension. The coefficient-valued application is componentwise. |
| TauCeti.heatKernel | TauCeti `Analysis/PDE/HeatKernel/Basic.lean:76`; the native Gaussian, consumed through PDE §6.3's semigroup theory. |

No claim to port an existing Yang–Mills formalisation is made. Object searches found no rough
Yang–Mills connection, critical caloric solution, realised homogeneous Besov scale or caloric
subset in either pinned source tree; the concrete native definitions above explain the gaps,
rather than relying solely on absent declaration names.

The four supplier gaps are all in the README and the plan with the same slug, full one-sentence
needs, supplier and section: PDE's Neumann ball problem, normal-boundary div–curl estimate and
Hardy inequality; LieGroups' metric extremality of longest-root subalgebras. The first three
requests retain their accepted content. The fourth is narrowed by the newly resolved existing
owner. No gap has an unspecified supplier. PDE's main Layer 5 contains interior/Dirichlet
regularity, not those Neumann/Gaffney statements; its Hardy–Littlewood maximal theorem is not
Hardy's weighted inequality. LieGroups Layer 6 supplies the rank-one construction but does not
state the γ₀/root-length norm comparison.

## Adversarial mathematics pass

The rows below cover the definitions, conventions and substantive assertions, including their
API clauses and routes. Expressions are computed directly, with exact small matrix/quaternion,
radial and Fourier computations also evaluated in scratch. Each multi-clause target has separate
rows for its distinct assertions. “Retained” means the computed instance agrees; it is not a
proof from a successful sorry build. Empty, abelian and nonabelian cases are included where they
are meaningful. Rings of characteristic p, primes, ramification and inseparable extensions are
outside the explicitly real Euclidean setting, rather than silently quantified inputs.

| Statement | Instances tried | Computed values on the relevant sides | Result | Change |
| --- | --- | --- | --- | --- |
| Dimension and critical exponents | d=2,3,4; k=1,2,d,d+1 | d/2=1,3/2,2; d/k=1 at k=d and <1 at k>d | Endpoint route unsupported outside p>1 | Critical k<d made explicit |
| Real coefficients, group size and zero rank | N=1, finite subgroup; N=0 | U(1) has Lie algebra iℝ; {±1} has dimension 0; N=0 excluded by N≥1 | Zero Lie algebra remains allowed | Explicit universe/real convention |
| Dilation convention | λ=1,2; λ=0 | A₁=A; F₂(x)=4F(2x); Jacobian 2^−d cancels curvature power 2^(d); λ=0 is not invertible | Positive scaling required | λ>0 explicit |
| Right Maurer–Cartan/gauge sign | O=exp(x₁i)exp(x₂j), A=0 | dR=R∧R; F[−R]=0; F₁₂[R](0)=2[i,j]=4k | Negative sign fixed by curvature | Replaced invalid inverse-composition witness |
| Form norm and paired wedge | F=X dx12; F=X(dx12+dx34), norm X=1 | Norms²=1,2; paired wedge coefficients=0,2; all-index wrong coefficient=8 | Correct factor is 2 | Retained normalisation |
| S³ orientation and quaternion matrix map | Positive frame (e₂,e₃,e₄) at e₁ | dΦ frame=(k,i,j); tr(kij)=−2; cubic form=−12; integral=−24π² | Boundary orientation fixes sign | Retained |
| Initial time and weighted measure | J=[0,1), [0,∞); s=0 | Both have initial trace at 0; ds/s norms integrate only s>0; no weighted value is assigned by dividing by s=0 | Domains and traces distinct | Initial interval and positive-time measure explicit |
| Fourier/heat normalisation | Frequency ξ with norm 1 | Δ multiplier=−4π²; heat multiplier=e^(−4π²s); squared multiplier=e^(−8π²s) | Signs and 2π agree | Retained in all layers |
| Homogeneous vs inhomogeneous spaces | Constant scalar; u in L⁴ with gradient L² | Nonzero constant has L⁴ norm ∞; its gradient is 0 | Quotient ambiguity excluded by realisation | Retained |
| Mixed dyadic-time norm | K disjoint heat scales, H^−1 amplitude K^−1/2 | ℓ² block sum=1; L¹ time norm ≥c√K | ℓ²L¹ cannot be reversed to L¹ℓ² | Retained corrected norm |
| Neumann supplier compatibility | u=norm x²; f=2d; V=2x | Δu=2d; ∂νu=2; ∫f=2d Vol B=2 Area S; u+7 gives same derivatives | Necessary compatibility and constant ambiguity | Gap preserved |
| Normal div–curl supplier | a=∇x₁; a=0 | da=0, div a=0, but ν·a=x₁≠0; zero field gives both sides 0 | Boundary condition excludes kernel | Gap preserved |
| Hardy supplier | d=4,p=2; radial u=r^−α with cut-offs | Sharp constant p/(d−p)=1; radial quotient near α=1 tends to 1; p=d has denominator 0 | p<d essential | Gap preserved |
| Longest-root metric supplier | su(2) trace metric; metric c=4 | γ₀²=2, root length²=2; after rescaling both γ₀ and root length become 1/√2 | Metric extremality is exact missing input | Gap narrowed to this equation |
| §1.1 Structure-group data and Lie algebra | U(1), SU(2), {±1} | Lie algebras iℝ, span(i,j,k),0; exp(tX) stays in the indicated group | Correct compact matrix specialisation | Generic construction consumed |
| §1.1 Trace metric and adjoint isometries | i,j,k in SU(2); g=exp(πk/4) | Each norm²=2; Ad(g)i=j preserves 2; [i,j]=2k and inner(2k,k)=4=−inner(j,−2j) | Isometry and skew-adjoint signs agree | Retained specialised checks |
| §1.1 Disconnected invariance | T²⋊C₂ with diagonal metric (1,2) | ad=0; permutation takes e₁ to e₂ and changes norm² 1→2 | ad invariance alone insufficient | Ad(G) assumption retained |
| §1.1 Subgroups and products | {1}≤U(1); U(1)×SU(2) | Restricted algebra=0; product norm²=norm X²+norm Y² and bracket=(0,[Y,Y′]) | Trace/product specialisation agrees | Generic splitting bullet deleted |
| §1.2 Retraction value and tangent derivative | Circle z=1+it; tangent ib, normal a | π(z)=z/√(1+t²); derivative at 1 sends a+ib→ib | Retraction and tangent law both discriminate | Explicit API bullets added |
| §1.2 Unique nearest point vs QR | M=[[1,1],[0,1]] | Polar distance²=5−2√5=0.527864045; QR distance²=1 | QR not nearest | Retained |
| §1.2 Degenerate/global domains | {±1}; U(N) at M=0 | Derivative 0 on either finite-group patch; distance²(0,g)=N for all g | Local domain essential | Retained |
| §1.3 Action and curvature covariance | Abelian A=i x₁dx₂, O=e^(iφ); central constant | Gauge potential=A−i dφ; F₁₂=i on both sides; central constant fixes A | Correct local comparison | Generic smooth action consumed |
| §1.3 Nonabelian Leibniz rule | X=i,Y=j,g=exp(πk/4) | Correct derivative Ad(g)[i,j]=2k; printed alternative Ad(g)[j,j]=0 | Printed alternative false | Accepted repair retained |
| §1.3 Product/inverse Maurer–Cartan | U(1), O=e^(ix), O′=e^(2ix) | (OO′);x=3i=i+2i; inverse derivative=−i | Both directions agree | Retained |
| §1.3 Commutator and Bianchi | Constant A₁=i,A₂=j,A₃=0; test B=i | F₁₂=2k; [D₁,D₂]i=[2k,i]=4j; cyclic covariant sum=0 | Nonabelian commutator sign fixed | Retained |
| §1.4 Invariant polynomial evaluation and bound | k=1; k=2, F₁₂=F₃₄=X | Abelian f(F) invariant; tr(F∧F)=2tr(X²)vol=−2 norm X² vol | Degree and trace sign agree | k≥1 explicit |
| §1.4 Transgression | Pure gauge A=−R | dA=−R²; F=0; tr(A dA)+(2/3)tr(A³)=(1/3)tr(R³) | Correct 1/3 coefficient | Retained |
| §1.4 Cartan period | O=Φ on boundary-oriented S³ | (1/3)(−12)(2π²)=−8π²; constant map gives 0 | Translation invariant homotopy period with fixed sign | Retained |
| §1.5 Orthogonal splitting | F=X dx12, norm X=1 | F±=(X/2)(dx12±dx34); each squared norm=1/2; sum=1; cross inner=0 | Orthogonal projection, not rescaling | Retained |
| §1.5 Equality and orientation reversal | SD and ASD pair; mixed simple form | SD (E,χ)=(2,−2); ASD=(2,2); simple (1,0); reversing orientation swaps ± | Both equality directions discriminate | Retained |
| §1.6 Bracket maximum | Zero algebra; su(2) i,j | Zero ball maximum=0; norm bracket²=8, norms²=2,2, quotient²=2 | Defined also at rank zero | Closed-ball definition |
| §1.6 Metric scaling and products | c=4; two su(2) factors with metric weights 1,4 | γ₀ becomes √2/2; product maximum=max(√2,√2/2)=√2 | Inverse square-root scaling | c>0 and empty-factor convention explicit |
| §1.6 Cubic bound | ωᵃ=λ(i,j,k), λ=1,−1; abelian | norm²=6λ²; absolute cubic=24√2 abs λ³; upper bound same; abelian both=0 | Sharp with either sign λ | Absolute value repaired |
| §2.1 Coefficient Sobolev and component constancy | Real 2-space under a basis swap; finite G | Coordinate sum of derivative norms unchanged under orthogonal swap; finite-group weak derivative=0 on a connected domain | Finite-product bridge, not a new scalar space | Scalar ownership narrowed |
| §2.1 Critical discontinuity | d=4, O=exp(log log(1/r)X) | ∫₀^(1/e)dr/(r log²(1/r))=1; fourth-power integral=1/3; phase unbounded | Critical Sobolev does not force continuity | Retained |
| §2.1 Vortex exclusion | U(1) vortex in d=3 | First-derivative critical integral contains ∫₀¹ρ^−2dρ=∞; second derivative to power 3/2 has same divergent radial power | Not in either critical class | Retained |
| §2.2 Localised approximation | U=W=B₁,V=∅; touching half-balls; V=U,W=∅ | Standard bump positive on B₁, zero off; half-ball bump is 0 on x₁≤0 and positive on x₁>0; last norm difference=0 | Unit cut-off impossible for touching closures | Accepted positive-cut-off route retained |
| §2.3 Product and inverse continuity | U(1) phases x and 2x; SU(2) i,j | Product phase 3x and inverse −x; quaternion ij=k but ji=−k | Pointwise group order and inverse agree | Retained |
| §2.4 Maurer–Cartan and adjoint action | e^(iφ); same nonabelian g example; k′=0 | O;x=i dφ; adjoint derivative=2k vs wrong 0; Lp datum has no required derivative at k′=0 | Separate action from derivative law | Derivative hypothesis explicit |
| §2.4 Top-order action | d=4,k=k′=1; O=exp(√L i),B=√L j; bounded B=j | Input derivative integrals ∫₁∞L^−2dL=1; unbounded B gives output ∫₀^(1/e)dr/r=∞; B=j gives finite ∫₁∞L^−2dL | Printed endpoint false | Require top-order B bounded in the intersection topology |
| §2.5 Sphere class and extension iff | Constants ±1; degree-one Φ | Both constants extend; +1 and −1 not homotopic in finite G; degree 1 cannot equal extension boundary degree 0 | Constant class rather than identity value | Retained disconnected correction |
| §2.5 Local constancy/product | Sphere maps q→q^m and q→q^n | Degree product under pointwise multiplication=m+n; sufficiently uniform-close maps have equal degree | Correct group operation on classes | Retained |
| §2.5 Exterior class | Constant map; Φ(x/r) | Constant derivative integral=0; homogeneous degree-one integral=C∫₁^∞dr/r=∞; inhomogeneous norm of any unitary map=∞ | Derivative condition is nonvacuous | Exterior hypothesis repaired |
| §3.1 Cocycles and gauge compatibility | One-set cover; constants on a two-set cover; finite G | Identity cocycle 1·1=1; transformed F₁=Ad(c)F₂ preserves norm; finite-group A=F=0 | Refinement preserves curvature norm | Retained |
| §3.1 Curvature integrability and scaling | d=3,4 and λ=2 | F₂=4F(2x); critical powers cancel 2^d·2^−d; d=3 L² norm scales by √2 | Critical exponent correctly varies with d | Retained |
| §3.1 Line-singularity exclusion | A=i dθ around a line in d=3 | F=0 away from line but derivative power integral ∫ρ^−2dρ=∞ | Zero curvature alone does not imply allowed rough potential | Retained |
| §3.2 Gauge invariance | U(1), A=0 with angular SU(2) gauge | Abelian F unchanged; angular potential=−O;x has F=0; energy 0=0 | Gauge derivative need not be bounded | Retained |
| §3.3 Global patching | Constant transitions cαcβ^−1; a noncontractible sphere as excluded base | Choose gauges cα^−1 and transitions become 1; ball cocycle trivial; nontrivial clutching on S^d has nonzero class | Contractible base essential | Ball/whole-space scope retained |
| §3.4 Radius definitions | F=0; total critical norm≤ε | Inner supremum=∞; exterior infimum=0 when F=0; small total norm gives every inner radius | Extended values needed | Retained |
| §3.4 BPST radius and monotonicity | r=0,1,2,∞; λ=2 | Energy fraction=0,1/2,112/125,1; small r energy=24π²r⁴+O(r⁶); radii divide by 2 | Correct ε², not ε, at d=4 | Retained |
| §4.1 Coulomb existence and uniqueness | U(1) A=i dφ; A=0 | Neumann correction φ leaves potential 0; any zero-curvature Coulomb potential under the norm bound is 0; gauges constants | Small-norm clause needed for uniqueness | Retained |
| §4.1 Linearisation and continuity | O=exp(tψ), t→0 | Coulomb equation to first order Δψ=0, ∂νψ=0; ∫norm ∇ψ²=0, so ψ constant | Constant ambiguity, not pointwise gauge uniqueness | Retained |
| §4.2 Puncture | A=−dΦ Φ^−1 in d=4; finite curvature | Potential derivative integral ∫₀¹dr/r=∞; gauge inverse sends it to 0; curvature norm on shrinking balls→0 | Gauge change essential | Retained |
| §4.3 Interior div–curl regularity | Constant abelian F₁₂=i, A=(i/2)(x₁dx₂−x₂dx₁) | div A=0; curl A=i; first derivatives constant, higher derivatives 0; endpoint d/(m+2)=1 excluded | Differential orders agree | Retained |
| §4.3 Strong higher convergence | Abelian Coulomb fields n^−3/2 sin(nx₁)i dx² | W¹,² norm=O(n^−1/2)→0, second derivative L^4/3 norm≈n^1/2→∞; derivative curvature has the same growth | Base convergence insufficient | Strong curvature derivative hypotheses and original-potential hypotheses for gauges explicit |
| §4.3 Angular and continuity assertions | Flat O constant; U(1) smooth radial φ on a ball away from 0 | Constant O has all derivatives 0; normalised angular derivatives of radial φ=0; O;x=0 has Besov sum 0 and continuous O | Normalisation cannot divide by norm x at origin | Away-from-origin restriction retained |
| §4.4 Ball good gauge | Small F; dilation R,r→R/λ,r/λ | Small-F bound C norm F; ratio (R/λ)/(r/λ)=R/r | Scale-invariant quantitative dependence | Retained |
| §5.1 Good representative | Φ(x/r), cut-off 1 versus vanishing near 0 | No cut-off gives ∫₀¹dr/r=∞; vanishing cut-off removes that integral; BPST remainder at infinity=O(r^−3), derivative O(r^−4) | Cut-off law determines allowed potential | Retained |
| §5.1 Constant ambiguity | Finite G={±1}; multiply O∞ on right by h | A=0 has either constant; d(Oh)(Oh)^−1=dO O^−1 | Right constants genuinely indistinguishable by potential | Retained |
| §5.2 Quantitative global theorem | Flat F; translated BPST at b; λ=2 | Flat remainder=0; centre b restores the identical radial remainder norm; R/r unchanged; some radius below 2R exists even if infimum not attained | Origin cannot be fixed silently | Centre and slack radius explicit |
| §5.2 Inversion route | ι(x)=x/r², covariant two-form F | Magnitude multiplier=r^−4; absolute Jacobian=r^−2d; power d/2 gives r^−2d on both sides | Curvature norm conformally invariant | Retained |
| §5.3 Uniqueness at infinity | Abelian phases θ,θ′,ψ with dθ′=dθ+dψ | Derivative of O′^−1PO=i(−dθ′+dψ+dθ)=0; swapped formula=2i dψ | Order of gauges matters | Retained corrected order and exterior norm |
| §5.3 Homotopy/constants converse | Constant h; A=0 with O∞=exp(i x₁/abs x) | Right multiplication adds derivative 0; fixed-potential remainder has Lᵈ integral C∫₂∞dr/r=∞; smooth phase extension gives a global gauge-equivalent pure gauge | Abstract connection may retain class while its potential changes | Converse explicitly changes global potential |
| §5.4 Topological quotient | Finite group; U(1), d≥3; O(4) | Two constant finite-group maps become one orbit; π_(d−1)(S¹)=0; reflection swaps (1,0) with (0,1) in π₃SO(4) | Free homotopy alone insufficient for disconnected G | Retained |
| §5.4 Addition and approximation | Good A=−ηO∞;x+B, A+tb; bad flat gauge −2x₁i dx¹ | Good chart changes B→B+tb, fixes class; bad example adds curvature k term −4x₁/(1+r²) with energy ∫r dr=∞ | General untransformed perturbation false | Good-representative hypothesis added |
| §5.4 Path connectedness/locality | Fixed O∞ and B₀,B₁; identical A=A′ | Linear path B_t=(1−t)B₀+tB₁ fixes class; difference norm 0≤ε_* | Gauge chart and common coordinates essential | Retained |
| §5.5 Trivial class iff | Zero; cut-off Φ pure gauge; connected G | Zero has representative (1,0); cut-off Φ has χ=−8π², impossible in Ḣ¹ where χ=0 | Both directions distinguished | Retained |
| §5.6 Free vs based maps | H(t,x), based endpoints; SU(2),U(1) | H(t,e₁)^−1H(t,x) equals 1 at e₁; π₃SU(2)=ℤ, π₃U(1)=0 | Connectedness permits translating base value | Retained |
| §6.1 Absolute convergence/continuity | k=2; zero F; F′=tF | Integral scales t²; difference bounded by (abs t+1)abs(t−1) norm F²; zero gives 0 | Degree k and k−1 factor agree | Retained |
| §6.1 Gauge/dilation and perturbation | Ad isometry; Fλ=λ²F(λx); homogeneous angular gauge | In d=2k, λ^(2k)λ^−d=1; [O∞;x,b] bounded by C abs b/r, controlled by Hardy | Convergence uses good representative | Retained |
| §6.2 Sphere transgression | O∞=Φ, constant; smooth compact remainder | χ=−8π²,0 respectively; Stokes boundary independent of exhaustion radius because O∞ degree 0 | Correct noncompact characteristic invariant | Retained |
| §6.2 Degree parity | d odd, k integer | Form degree 2k never equals odd d | Only top-degree characteristic integral claimed | Retained |
| §6.3 Integrated identities | SD, ASD, mixed fields of squared masses a,b>0 | E=a+b, χ=b−a; E−χ=2a, E+χ=2b; E−abs χ=2min(a,b)>0 | Pointwise equality insufficient for integrated equality | Retained |
| §6.3 Homogeneous vanishing | Smooth compact A; approximating Ḣ¹ A | Boundary transgression 0; characteristic integrals converge to 0 by the curvature estimate | χ=0 is a theorem, not a field | Retained |
| §6.4 Sign/integrality/classification | O∞=Φ, conjugate Φ, constant; power n | Degrees 1,−1,0,n give c₂=−1,1,0,−n | Sign fixed across Layers 1,6,7 | Retained |
| §7.1 Weak harmonic equation/variation | Abelian A=(i/2)(x₁dx₂−x₂dx₁); variable F₁₂=iψ(x₁) | Constant F has divergence 0, infinite energy; variable divergence=iψ′; first variation=−2∫inner(D^jF_jk,φ_k) | Harmonic does not imply finite energy | Retained |
| §7.1 Symmetries and SD stationarity | Flat; ASD BPST; abelian L² harmonic field | F=0 gives weak integral 0; Bianchi implies D*F=0 for ASD; Fourier support of L² harmonic field would be {0}, so F=0 | Finite energy is required in abelian vanishing | Retained |
| §7.2 ε-regularity | Zero; small abelian constant curvature on unit ball; scaled BPST | Zero derivatives=0; abelian DⁿF=0 for n≥1; concentrated BPST has total norm √(8π²), exceeding small ε | Interior estimate has correct smallness scale | Retained |
| §7.3 Removal and decay | Pure gauge singularity; BPST | Gauge inverse gives 0; norm F=√48/(1+r²)² ∼√48 r^−4; inversion converts bounded curvature near 0 to r^−4 | Potential singularity need not be curvature singularity | Retained |
| §7.4 Kato and Weitzenböck | Constant abelian SD form; self-dual BPST | Constant case both derivative terms=0; at BPST centre half Δabs F²=−768, covariant gradient=0, pairing with 𝔉=768; for u=48^(1/4)/(1+r²), Δu=−8·48^(1/4)/(1+r²)³ and RHS same | Pairing must be subtracted | Weitzenböck sign repaired; explicit equality witness |
| §7.5 Energy gap | SU(2); two factors with opposite charges; abelian | γ₀²=2; first gap=8π²; opposite pair E=16π²,χ=0,32π²/γ₀²=16π²; abelian γ₀=0 | Noncommutative hypothesis avoids dividing by zero | Retained |
| §7.5 Sobolev route | d=4, u=abs F⁺^1/2 | Y(S⁴)=8√6π; 6(√6/3)γ₀=2√6γ₀; division gives norm F⁺₂≥4π/γ₀ | Squared bound 16π²/γ₀² | Retained |
| §7.6 BPST definition/curvature | x=0 and r→∞ | A(0)=0; F_i=2(dx12−dx34); norm F²=48/(1+r²)^4; remainder O(r^−3) | ASD sign and gauge at infinity agree | Retained |
| §7.6 BPST energy and charge | Radial integral; reflection; metric c | ∫₀∞r³/(1+r²)^4dr=1/12; 96π²/12=8π²; reflection c₂=−1; metric c gives 8π²c | Scale/translation/reflection laws agree | Retained |
| §7.7 Ground state | SU(2); c=4; abelian | 16π²/2=8π²; c=4 gives 32π²; abelian infimum of empty energy set=+∞ in extended nonnegative reals | Empty set must not use real sInf | Codomain explicit |
| §7.7 Attainment and dichotomy | Longest-root copy with metric c; opposite instantons | γ₀²=2/c, so 16π²/γ₀²=8π²c; opposite pair E=2E_GS and χ=0 | Constructed embedding attains lower bound | Consumes root construction; norm gap only |
| §8.1 Spaces and Banach graph | Gradient blocks of divergence amplitude 1/k for k≥1; solenoidal field | Sum of squares Σ1/k² finite; Σ1/k infinite; solenoidal ℋ norm equals Ḣ¹ norm | Strict inclusion ℋ⊊Ḣ¹ | Retained |
| §8.1 Slow variation and admissibility | One isolated block; c_k=2^k to k=0 then 1 | Geometric decay envelope has ℓ² norm C times block amplitude; c_k/c_j=2^(k−j) violates lower bound 2^−(1−ε)(j−k) | Rate restriction discriminates | Retained |
| §8.1 Zero and convolution enlargement | u=0; d_j=1,j<0; σ̃=0 | Zero envelope norm=0; convolution at 0 is Σ1=∞; for d∈ℓ² and σ̃>0 the geometric kernel has finite ℓ² norm | Finiteness cannot be implicit | Zero and finiteness clauses added |
| §8.2 Covariant inverse/variational sign | A=0, unit Fourier frequency; zero F | B=−F/(4π²), ΔB=F; minimiser of wrong-sign functional gives +F/(4π²), ΔB=−F; F=0 gives B=0 | Variational sign repaired | Plus linear term |
| §8.2 Pure gauge and diamagnetic | A=−O;x; B≠0 | Δ_AAd(O)B=Ad(O)ΔB; derivative norm=inner(B,D_jB)/norm B since inner(B,[A_j,B])=0 | Gauge conjugation preserves equation | Retained |
| §8.3 L² energy estimate | A=0, G=H=0 | norm B(s)²+2∫norm ∇B²=norm b² | Dissipation sign positive | Retained |
| §8.3 Scaling and index range | σ=0 under parabolic dilation; σ=2 | Forcing factor λ⁴λ^−2λ^−2=1; endpoint F·B would require an unprovided H² product | Scale invariant interior range | Retained open endpoints |
| §8.3 Envelope and ℓ²L¹ bounds | K separated dyadic blocks | RHS norm≈1; ℓ²L¹ derivative norm≈1; false L¹L² version≥c√K | Source's non-dyadic bound fails | Accepted repair retained |
| §8.3 Decay and lack of uniform rate | Free heat Fourier datum; low-frequency datum at scale 2^−m | e^−(8π²s norm ξ²)→0 a.e.; at s=4^m multiplier≥e^−16π² on indicated support | Qualitative, not uniform decay | Retained |
| §8.3 Non-decaying excluded data | Static BPST and B_i=ξ^kF_ki | B∈L², stationary nonzero; norm F_(L²_sḢ¹_x)=∞ and A∉Ḣ¹ | Does not meet hypotheses | Retained negative control |
| §8.3 Decay interpolation route | Exponents −1/2,0,1 | 0=(2/3)(−1/2)+(1/3)·1; norm B(s_n)_H¹→0 and bounded H^−1/2 imply L²→0 | Interpolation weights correct | Retained |
| §8.4 Homogeneous/inhomogeneous block bound | A=0; one block k; β=0; forcing cut off at 4^−k | Heat factor≤C_N(1+4^ks)^−N; at small s, Duhamel B≈sG matches 4^ks·4^−kG; forcing vanishes for s≫4^−k | Time exponent 1−β correct and example satisfies decay hypothesis | Accepted correction retained; forcing specified near 0 |
| §8.4 Infinity trace | σ=−1,p=∞, b=abs D sign(x₁) | Initial norm=1; for every s>0 difference norm=1; fixed blocks converge | Full L∞-based norm continuity false | Dyadic/distribution trace, norm-continuous subspace |
| §9.1 Flow and gauge fixing | U(1); flat A; general heat-time gauge | F_sj=∂sA_j−∂jA_s; for O′=OA_s, transformed A_s=OA_sO^−1−OA_sO^−1=0; flat RHS=0 | Left action and ODE order agree | Retained |
| §9.1 Curvature evolution and dynamic reconstruction | Spatially constant A₁=i,A₂=j,A₃=k,A₄=0; auxiliary A₀+C | F₁₂=2k,F₁₃=−2j,F₂₃=2i; ∂sF₁₂=−32k,Δ_AF₁₂=−16k; −2[F₁₃,F₂₃]=−16k; fixed F₀j plus A₀+C changes B by DC | Correct lower-index order and actual reconstruction freedom | Index placement repaired, A₀ equations expanded |
| §9.1 Energy identity | Transverse abelian unit Fourier mode, unit amplitude | E′=−32π⁴e^−8π²s; squared tension=16π⁴e^−8π²s; E′=−2 tension² | Factor 2 essential | Accepted repair retained |
| §9.1 Linearisation/de Turck | Abelian group | Local-caloric B′=ΔB−∇div B; residual gradient is stationary; A_s=div A gives A′=ΔA | Correct transport/parabolic split | Retained |
| §9.2 Weighted curvature bounds | n=0,1; p=∞,q=4; λ=2 | Correct scaling exponent 2+n−4/q−2(n/2+1−2/q)=0; old exponent=−1/2, giving factor 2^−1/2 | Source weight incompatible with ds/s | Explicit corrected weight |
| §9.2 Potential bound/local version | Flat nonzero a; F=0 | All curvature bounds 0, but sup norm A=inf norm A=norm a | infimum term cannot be dropped | Retained |
| §9.3 Solution/uniqueness/stability | Flat a; U(1); dilation | Flat A(s)=a; abelian A(s)=∇φ+e^sΔa_df; lifespan scales λ^−2; difference of two abelian flows bounded by data difference | Nonzero flat limit allowed | Lifespan implication qualified |
| §9.4 Caloric size and small energy | Flat; scaled solution; stationary BPST | Q=0; λ⁶ curvature-cube cancels λ^−4λ^−2; static nonzero curvature integrates to ∞ in time | Gauge/scaling invariance | Retained |
| §9.4 Continuation endpoint | s₀=1 with finite Q>0; global flat flow | First has extension to 1+δ; second already has interval [0,∞), with no larger interval | Finite/infinite distinction necessary | Finite-endpoint qualification |
| §9.5 Flat nonlinear/linear limits | Abelian gradient+solenoidal splitting; pure gauge; σ=−1/2 | Limits ∇φ, a,∇ψ; solenoidal squared norm integral contains e^−8π²s norm ξ²→0; projection norm≤1 | Negative-index range tested explicitly | Retained |
| §9.5 Product/limit route | σ=−1/2,0,1; commuting coefficients | For σ<1 the product indices sum to σ; at σ=1 use separate div–curl route; commuting bracket contribution=0 | Endpoint not passed by an invalid product estimate | Retained |
| §9.6 Bubbling/scaling | r_n²≤s_n; small energy initial data | Rescaled s∈[−1,0] gives physical time≥0; curvature factor r_n²; bubble energy≤initial energy<E_GS rules it out | Coordinate and time domains fixed | Rescaled coordinate made explicit |
| §9.7 Threshold and characteristic balance | SU(2); bubble charge 1 with total charge 0 | Bubble energy≥8π²; exterior energy≥8π²; total≥16π²; BPST alone has 8π² but A∉Ḣ¹ | Local charge need not be zero | Exterior balance replaces global continuity claim |
| §10.1 Flat gauges and uniqueness | U(1) a=i∇φ; a=0; constant c | O=e^iφ gives O^−1dO=a; a=0 forces O constant; (cO)^−1d(cO)=a | Left multiplication, not conjugation, is ambiguity | Retained |
| §10.1 Frequency action bound | O constant; nonconstant low/high blocks | Constant multiplier gives zero between disjoint frequency supports and bounded overlap; factor 2^−(4/p)abs(j−k) is 1 at j=k | Decay bound has correct normalisation | Retained |
| §10.2 Caloric gauge and size | U(1), pure gauge, constant conjugation | Cal=P_df; pure gauge maps to 0; d(Ad(c)a,a)=0 even if fields differ | Orbit pseudometric is not a metric on fields | Quotient distinction explicit |
| §10.2 Scaling and flow invariance | Caloric a and its time shift A(s₁) | New limit=0; tail Q≤Q(a); spatial scaling keeps Q invariant | Caloric subset invariant | Retained |
| §10.3 Caloric ℋ bound | Abelian divergence-free a | div a=0; ∫norm curl a²=∫norm ∇a²−∫abs div a²=norm ∇a² | Energy controls homogeneous norm via Sobolev | Retained |
| §10.4 Split-submanifold definition | Empty, whole Banach space, point | Empty condition vacuous; whole chart id with complement0; point has model0 and complement ambient space | Rank zero cases correct | Native embedding condition retained |
| §10.4 Chart vs homeomorphic parametrisation | Unit sphere; cross; graph abs x | Sphere chart derivative inclusion; cross puncture has4 branches vs line2; (t³,abs t³) derivative0 at0 | Topological/C¹ image alone insufficient | Accepted four Checks retained |
| §10.4 Derivative complement API | T with continuous left inverse ℓ | (Tℓ)²=Tℓ; range=T(E); kernel=ker ℓ; Φ′(h,k)=Th+k invertible on range⊕complement | Correct split condition and IFT input | Retained |
| §10.4 Chart independence | Two normal-form charts | Transition derivative gives range Dφ₁⊆range Dφ₂ and reverse; both equal tangent space | Tangent well defined | Retained |
| §10.4 Caloric slice and projection | U(1); h∈E_a; g=D(a)Δ_a^−1f | P=Leray; Ph=h; Pg=0; D(a)·Ph=0 | Slice and gauge directions complementary | Retained |
| §10.4 Lower bound and harmonic uniqueness | Lb=b−D(a)c; z→0 at∞, Δ_az=0 | PLb=b; Δabs z²=2abs Dz²≥0; ball maximum≤ε then z=0 | No circular inverse or missing complement | Accepted ℋ bound retained |
| §10.4 Product estimate used in route | Dyadic amplitudes u_j,v_k in ℓ² | Low/high kernel sum Σ_(j<k)2^(j−k)≤1; high/high sum Σ_(k≤j)4^(k−j)=4/3; Cauchy–Schwarz bounds Σu_jv_j | ℓ¹L² product bound follows from PDE decomposition | Retained |
| §10.5 Tangent and closure | Abelian a; solenoidal w; gradient w=D(a)c₀ | Tangent=solenoidal fields; for solenoidal w, c=0,b=w; for gradient w, c=−c₀,b=0 | Both projection range and kernel tested | Closure means intersection with L² |
| §10.5 Nonlinear decomposition and sign | W∞=−∇c; w=b−D(a)c | b=w+D(a)c; linearised flow of added gauge direction tends to ∇c; total limit −∇c+∇c=0 | Minus sign and uniqueness coherent | Retained |
| §10.5 Leading scalar potential/bundle | U(1); a=0; w arbitrary | c=−Δ^−1div w; L(0,w)=0; Π₀w=w−∇Δ^−1div w; image pairs are (a,Π_aw) | Correct source/target and zero nonlinear correction | Retained |

All API identities and Checks were compared with their own section's hypotheses and with every
later use of the same sign/normalisation. No counterexample remains among the instances above.
The detailed accepted chart repair was recomputed: the ℋ bound follows from ∂[a,c]=[∂a,c]+[a,∂c]
using L²·L∞ and L⁴·L⁴, and its divergence is f−[a,D_ac] in ℓ¹L². Thus the route needs ℋ, not the
stronger ℓ¹Ḣ¹ norm printed in the source. Every route input is a local target, a stated supplier
section, or a native declaration; no route assumes a headline conclusion as a field.

## Elaboration and mechanical verification

`Suggested.lean` was elaborated with `lake env lean` on its absolute file argument, from the
content repository, using the pinned manifest. Exit status: **0**. Exact number of `sorry`
warnings: **0**. Other warnings: **0**. Errors: **0**. Other messages: **none**; stdout and stderr
were empty. No TauCeti import is used and no targeted TauCeti build was needed.

The file contains the required first line `module`, one `import Mathlib`, one module docstring,
and the required namespace. There are zero theorem or data declarations. This follows the
explicit rule for an acceptance file whose full headline statements need constructed carriers;
it is not a count-based omission or a set of weakened controls.

The explicit-binder audit mechanically enumerated every declaration in Suggested.lean: the list
is empty, so there are no own `#check @name` entries and no dropped hypotheses. One scratch file
was elaborated with full `#check @...` applications of the 23 Mathlib declarations consulted,
including all matrix/homotopy/embedding/inverse-function APIs; it exited 0 with no errors or
warnings. The printed inverse-function types include completeness and the nonzero-order
hypothesis, and the printed immersion type confirms the left-inverse direction. No binder repair
was required in Suggested.lean. The unrelated complex sl₂ triple declaration was also inspected;
it is not a substitute for the compact real metric extremality supplied through LieGroups.

Mechanical content checks give:

- ten layers, 52 numbered target sections, ten Examples and ten Dependencies subsections;
- at least three Checks in every definition target;
- all four gap sentences identical in the README and plan, with a named supplier and section;
- the plan unchanged outside its top-level gaps;
- twelve unique original source keys and valid TOML for sources and metadata;
- zero own Lean declarations and zero missing own Lean identifiers;
- no absolute machine paths, set-option directives or extra imports in deliverables.

The citation resolver reports no cross-roadmap citation found nowhere and no Lean name found
nowhere. Its library-check limitation was handled by reading the pinned sources and the scratch
elaboration above. Old AlgebraicTopology Stage citations are supported by the mapping on main;
no citation is justified solely by an open revision's numbering.

The required dependency check, with the supplied merge order and `--movable`, reports:

```text
depcheck: 235 roadmaps, 2123 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line and no merge-order edit. Every actual supplier is on main or at
the pins. Later open roadmaps occur only as ownership boundaries or comparisons, never as a
premise of a target. No process remains running. No GitHub write was performed. No suspicious
instruction embedded in the material read was acted upon, and none required a separate incident
report. No additional reference request is outstanding.
