<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12830#issuecomment-6778892246 -->
Review (codex) of f80740e

Verdict: needs_changes

1. **F01** (P1) The caloric divergence estimate has an inhomogeneous norm

   **Location:** `packages/YangMillsConnectionsAndCaloricGauge/README.md:1801`: “`ℓ¹L² ∩ W^{1,4/3}`”.

   **Claim:** Energy and caloric size uniformly control the full inhomogeneous Sobolev norm of the divergence of every caloric connection.

   **Witness:** For a caloric connection with nonzero divergence h, dilation gives hλ(x)=λ²h(λx), hence ‖hλ‖₄/₃=λ⁻¹‖h‖₄/₃, while E and Q stay fixed. OhTataru-YMHF line 2423 supplies only the homogeneous norm.

   **Repair:** Replace `W^{1,4/3}` by `Ẇ^{1,4/3}`, explicitly using the gradient seminorm and the accompanying L² realization. Cite Lemma 5.30, printed p. 52, as the input to Proposition 7.7. Add the dilation Check below. With this repair both the gradient norm and the ℓ¹L² norm have dilation exponent zero. The inclusion in ℋ survives unchanged.

   For a concrete nonzero h, use small, real Schwartz, divergence-free SU(2) packets near frequencies ξ=e₁ and η=2e₁, with common transverse polarization e₂ and Lie coefficients i and j. Apply the small-data caloric construction to ε times their sum. The identity at OhTataru-YMHF line 2434 gives the quadratic divergence of its caloric representative as the time integral of [eˢΔu, ΔeˢΔu]. At the sum frequency its multiplier is (|ξ|²−|η|²)/(|ξ|²+|η|²)[i,j]=−6k/5. Smooth narrow packets, projected onto ξ⊥, preserve nonvanishing; conjugate packets make the data real. Thus h is not identically zero for sufficiently small nonzero ε. Scaling this one connection by λ=2⁻ᵐ makes the forbidden term grow by 2ᵐ. This also distinguishes the claim from the abelian Check, where h=0 conceals the error.

2. **F02** (P2) General transgression is planned again

   **Location:** `packages/YangMillsConnectionsAndCaloricGauge/README.md:457`: “closed and equals `d T_f(A)`”; ownership is asserted at lines 31–33 and 79–82.

   **Claim:** This roadmap owns curvature evaluation, closedness and the general connection-path transgression construction.

   **Witness:** `TauCetiRoadmap/CharacteristicClasses/README.md:1323` on main already owns curvature evaluation, closedness and explicit affine-path transgression; line 1554 defines the normalized Chern–Simons form and its differential.

   **Repair:** Import CharacteristicClasses C4 item 1 and C5a.3 by their full contracts. Delete the duplicate general construction/proof targets from §1.4. Retain the comparison with this roadmap’s right Maurer–Cartan convention, its explicit SU(2) normalization, and the genuinely new rough/global integration statements of Layer 6. The test A=−dO O⁻¹ gives T=tr(R³)/3 and integral −8π² on the positively identified sphere with either the imported construction or the current formula; no new general transgression theory is needed.

3. **F03** (P2) The nearest-point theorem already has an earlier owner

   **Location:** `packages/YangMillsConnectionsAndCaloricGauge/README.md:376`: “`π_G(M)` is the unique point of `G` nearest to `M`”; lines 380–388 reconstruct the normal-tube inverse.

   **Claim:** §1.2 adds the global smooth nearest-point theorem to the pinned tubular-neighborhood results.

   **Witness:** `TauCetiRoadmap/RiemannianGeometry/README.md:3472` on main, R6, owns normal-tube inversion and smooth nearest-point retraction for closed Euclidean embeddings, with a uniform radius for compact embeddings.

   **Repair:** Cite RiemannianGeometry R6 in Scope, Exact supplier contracts and §1.2. Consume its theorem for the compact embedded matrix group supplied by LieGroups Layer 2. Keep the group-specific derivative comparison and the explicit polar-factor/finite-group Checks; remove the re-planned generic inversion proof. The imported theorem yields π(1+i)=(1+i)/√2 on its domain and derivative a+ib↦ib at 1. Open PR #1506, `TauCetiRoadmap/ManifoldOptimization/README.md:450`, O2.2, also constructs metric projection; citing the owner on main avoids another competing ownership claim and adds no upward edge.

4. **F04** (P2) The general vector Sobolev bridge has two open owners

   **Location:** `packages/YangMillsConnectionsAndCaloricGauge/README.md:547`: “For a finite-dimensional real normed space `V`”; lines 554–556 claim the general coordinate equivalence and basis independence.

   **Claim:** This roadmap constructs the general finite-dimensional vector-valued W^{k,p} bridge.

   **Witness:** Open PR #237, `TauCetiRoadmap/IncompressibleFlows/README.md:154`, Layer 0 items 1–2, owns the same weak-derivative graph/product equivalence and arbitrary-order finite-dimensional bridge.

   **Repair:** Give the general bridge one earlier owner: declare a PDE Layer 1 supplier gap, with the same slug in the design and README, for the finite-dimensional W^{k,p} coordinate equivalence, all integer k≥0 and 1≤p≤∞, on open Euclidean domains, commuting with iterated weak derivatives and independent of the chosen basis. Replace the generic construction here with that contract; retain the nonlinear G-valued subspace and its API. Record the ownership move so that IncompressibleFlows Layer 0 item 2 consumes that same earlier contract rather than owns a second bridge. Do not cite IncompressibleFlows as a supplier and do not narrow the general theorem to avoid settling ownership. For V=ℝ² the witness is (u,v)↦(∂αu,∂αv), with zero off-diagonal coordinate derivatives: both roadmaps currently ask for exactly this equivalence.

5. **F05** (P2) The existing homogeneous Sobolev carrier is omitted

   **Location:** `packages/YangMillsConnectionsAndCaloricGauge/README.md:1377`: “`Ḣ¹ ... is a Banach space in which C_c^∞ is dense`”; the Tau Ceti contracts at lines 220–241 omit D1p0.

   **Claim:** The scalar homogeneous completion/completeness/density core is work to build from the listed inputs.

   **Witness:** `TauCeti/Analysis/Sobolev/D1p0/Basic.lean:117` defines D1p0; lines 128 and 155 give completeness and test-function density; lines 246, 321 and 362 give its injective weak-gradient realization in L^{p*}.

   **Repair:** Cite `TauCeti.D1p0`, `TauCeti.D1p0.denseRange_ofTestFunctionₗ`, `TauCeti.D1p0.sobolevEmbeddingL`, `TauCeti.D1p0.hasWeakFDerivOn_sobolevEmbeddingL`, and `TauCeti.D1p0.sobolevEmbeddingL_injective` in the supplier contract. Build the finite-coefficient comparison with `{u∈L⁴:∇u∈L²}` and the Besov comparison, using native completeness/density instead of replanning that core. Refine Suggested.lean’s missing-carrier explanation to distinguish this existing scalar homogeneous space from the missing full covariant scales. At d=4,p=2,p*=4, the required exponent equality is 1/4+1/4=1/2, and a test function maps to itself with its actual gradient norm. The pin does not by itself supply the converse weak-gradient characterization or the nonlinear Yang–Mills operators; those remain work here.

6. **F06** (P3) The constant-one heat-equation Check is false

   **Location:** `packages/YangMillsConnectionsAndCaloricGauge/README.md:1474`: “the estimate holds with constant `1`”.

   **Claim:** The preceding sum of the L∞L² and L²Ḣ¹ norms is bounded by the initial L² norm with constant one in the free case.

   **Witness:** Set A=G=H=0, J=[0,∞), and take Schwartz b with ‖b‖₂=1. Then supₛ‖eˢΔb‖₂=1 and ∫₀∞‖∇eˢΔb‖₂²ds=1/2. The left sum is 1+1/√2>1.

   **Repair:** Say that the quadratic energy identity has the displayed exact coefficients, and that it implies the sum estimate with constant 1+1/√2 (or an unspecified absolute constant). Keep this normalized b as the Check. No theorem in Suggested.lean is involved.

7. **F07** (P2) The full homogeneous W^{σ,p} space is not defined

   **Location:** `packages/YangMillsConnectionsAndCaloricGauge/README.md:1502`: “strongly continuous in `Ẇ^{σ,p}`”; line 1519 uses its full endpoint norm.

   **Claim:** The roadmap has specified the carrier and topology in which the Lᵖ theorem and its endpoint trace are asserted.

   **Witness:** Conventions at lines 170–178 define H^σ and Besov spaces; §8.1 line 1377 specifies only individual block norms. For b=|D|sign(x₁), the full negative Sobolev norm is 1 and the heat-continuity subspace excludes b.

   **Repair:** Define the full homogeneous Bessel-potential/Sobolev realization used in §8.4, its polynomial/low-frequency convention, coefficient interpretation and norm, with a named target and dependencies for the multiplier/realization results needed to construct it. Specify the full endpoint space separately from its heat-continuity subspace. Supply API and at least three discriminating Checks. Block norms alone also fit Besov summation conventions and do not determine this object. Retest the existing step example: it belongs to the full endpoint space, has norm 1, and its heat difference has norm 1 for every positive time, while fixed blocks converge. A smooth compactly supported datum must belong to the continuity subspace, and the zero distribution must have norm zero. Do not weaken the theorem to a different scale merely to avoid defining its carrier.

Seven findings, six blocking. The package is repairable; its overall scope is appropriate. The source sampling exposed a false, scale-dependent strengthening in §10.3. Ownership checks found generic constructions already supplied elsewhere. No authored package file was changed during this review.

## Verified sound

The review read all 52 numbered sections, their APIs, Checks, routes and Needs lines, the four package inputs, the board package index, the overlap report and the design’s gap entries. There was no earlier review. The main checkout used for resolution was commit `4ec889e8f0480e2cdb21a524eb76e48215c9ad94`. PDE, SmoothBundlesConnections and CharacteristicClasses were also read as upstream shape examples. The report’s mathematical witnesses below cover the seeded sample, all headline families, and every finding; additional short rows retain the other sections’ distinguishing tests.

No route-specific good-group restriction, computational algorithm, copied source exposition, sorry’d data, set_option, process path, PR-number dependency or conflicting Lean namespace was found. The organization works backwards from rough global topology and the caloric manifold through their analytic inputs. It does not promise to follow a source’s chapters. Every layer has Examples and Dependencies. The group is allowed to be disconnected, and the quotient by left/right constants correctly handles that extra generality. The finite-group and abelian controls are substantive.

The §4.3/§4.1 forward reference was examined: the interior estimates and conditional convergence statements can be proved for potentials satisfying the displayed div–curl equations and convergence assumptions before gauge existence is established. It is not necessary to invoke §4.1’s existence theorem to prove those conditional assertions. Accordingly this is not reported as a cycle.

### Elaborating the acceptance test and checking headlines

From the content checkout, `lake env lean` on the package’s Suggested.lean completed with exit status 0 and no warnings. There are zero named declarations and zero sorried theorems, so the exhaustive one-tactic probe and `#check @name` signature audit each have zero cases. There is no padding or silently dropped section hypothesis. The sole import is Mathlib. The empty namespace contains no surrogate headline. Each family below is explicitly accounted for in the module docstring; R05 corrects an overbroad description of what is missing, rather than requiring a dummy theorem.

| README headline family | Docstring coverage | Carrier assessment at pins |
|---|---|---|
| §3.2 finite-energy gauge invariance | Layer 3 paragraph | No native critical matrix-Sobolev gauge action/weak-curvature connection carrier. |
| §§4.1–4.2 arbitrary compact-group Coulomb gauge and removal | Layer 4 paragraph | Rough connection, gauge and critical normal-trace interfaces remain to be constructed. |
| §§5.2,5.4,5.5 good global gauge, locality/invariance and trivial class | Layer 5 paragraph | Gauges at infinity and their disconnected-group quotient are not native HomotopyGroup. |
| §§6.2–6.4 characteristic invariance, Bogomol’nyi, integer/completeness | Layer 6 paragraph | Statements are on finite-energy rough connections, not arbitrary coefficient fields. |
| §§7.2–7.3,7.5,7.7 harmonic regularity/decay, gap and ground state | Layer 7 paragraph | Weak harmonic connection and curvature-energy interfaces are missing. |
| §§8.2–8.4 covariant elliptic and parabolic theory | Layer 8 paragraph | D1p0 exists (R05); full fractional/Besov realizations and covariant operators do not follow from it. |
| §§9.3–9.7 existence, continuation, flat limits, dichotomy and threshold | Layer 9 paragraph | Critical solution, lifespan, caloric-size and bubble interfaces are missing. |
| §§10.1–10.5 caloric representative, ℋ bound/manifold, tangent decomposition | Layer 10 paragraph | Native smooth embeddings do not construct ℋ, the caloric subset or the linearized limiting operator. |

No statable full headline was identified as omitted after distinguishing these analytic carriers from native scalar spaces. The elementary pointwise inequalities and algebraic checks are not substitute acceptance tests. All backticked library identifiers were resolved; mathematical symbols such as Cal and Π_a are not claimed Lean declaration names in this zero-declaration file.

### Seeded source audit

All locators below were read in the legal cached extractions, including their surrounding hypotheses and the indicated proof steps. Printed pages are those marked in these cached preprints, not inferred published pagination. There were no additional locators labeled unverified in the README. The six manifest entries settled as uncertified remain so and are listed separately below.

| Target | Read locator and printed page | Result of comparison |
|---|---|---|
| 1.2 nearest-point retraction | OhTataru-TopClass line 1057, Lemma 3.2 proof, p. 21 | The proof uses smooth nearest-point projection; it does not prove the roadmap’s entire derivative API. The native tube route is valid, but RiemannianGeometry owns the general theorem (R03). |
| 3.2 finite energy | OhTataru-TopClass line 283, §1.3, p. 7; OhTataru-YMHF lines 103–130, pp. 3–4 | Critical gauge regularity and adjoint curvature law agree. The weak extension uses §2.4’s correctly restricted multiplication theorem. |
| 3.4 radii | OhTataru-TopClass lines 337 and 361–365, pp. 7–8 | The universal inner-ball condition and existential center for the outer radius agree; zero and infinite values are handled. |
| 4.1 Uhlenbeck | OhTataru-TopClass lines 1358–1395, Theorem 3.11, pp. 27–28 | Small critical curvature, normal boundary condition, small norm, uniqueness modulo constants and subsequential convergence all appear. Primary Uhlenbeck Theorem 1.3 remains uncertified. Source div–curl typographical errors are not adopted. |
| 5.1 good representative | OhTataru-TopClass lines 382–390, §1.4, p. 8 | The decomposition is supported. Requiring the cutoff to vanish near zero is a sound explicit strengthening of its definition. |
| 5.2 global gauge | OhTataru-TopClass lines 367–375, Theorem 1.5, p. 8; lines 1562–1617, pp. 31–32; OhTataru-Threshold line 1069, Theorem 2.17, p. 25 | The main decomposition is supported. Translation to an exterior center, radius slack, and global higher-regularity input repair issues in the printed statement; the route needs the declared Hardy contract. |
| 5.3 uniqueness | OhTataru-TopClass lines 397–405, Proposition 1.6/Remark 1.7, p. 9; lines 1666–1686, pp. 34–35 | The source’s connected-group formulation is insufficient for arbitrary compact G. The roadmap’s constants and change of potential in the converse are correct and independently justified. |
| 5.4 class | OhTataru-TopClass lines 407–429, Definition 1.8/Proposition 1.9, p. 9; lines 1688–1705, pp. 34–35 | Quotient by constants is the needed disconnected extension. The good-representative condition on perturbations is necessary and is present. |
| 5.6 dimension four | OhTataru-Threshold line 1074, p. 25 | This line identifies a free homotopy class, not the full based/cubical comparison. The displayed normalization H(t,e)⁻¹H(t,x) and AlgebraicTopology Stage 8 provide the missing comparison; connectedness is retained. |
| 7.1 harmonic connections | OhTataru-YMHF lines 124–134, equations (1.1)–(1.4), p. 4; OhTataru-TopClass lines 829–834 | The equation and energy convention agree. Finite energy is an additional hypothesis for the abelian vanishing result, not part of local harmonicity. |
| 8.3 covariant L² | OhTataru-YMHF lines 1187–1345, Theorems 4.3,4.5,4.6 and Corollary 4.4, pp. 27–30 | Coefficient norms and σ ranges match; dyadic ℓ²L¹ is the correct repair of Theorem 4.6. The extra decay argument uses globally integrable coefficient/forcing norms and is valid. R06 concerns its exact-constant Check. |
| 9.2 covariant bounds | OhTataru-YMHF lines 1628–1801, Proposition 5.7/Corollary 5.8, pp. 36–38; lines 1986–2000, Lemma 5.17, p. 43 | Covariant derivative estimates match. The roadmap correctly repairs the ds/s time weight and retains initial-curvature dependence. |
| 9.4 caloric size/continuation | OhTataru-YMHF lines 1878–1948, Theorems 5.10–5.11/Corollaries 5.12–5.14, pp. 40–42 | Constants, linearized σ interval and small-energy estimate agree. The larger-interval conclusion correctly has a finite-endpoint hypothesis and Q>0. |
| 10.2 caloric gauge | OhTataru-YMHF lines 564–592, Definitions/Theorems 2.17–2.20, p. 14; lines 3000–3008, Definition 7.1/Proposition 7.2, p. 64; lines 3213–3278, Propositions 7.4–7.5/Corollary 7.6, pp. 68–69 | Q finiteness, constant ambiguity, normalization at infinity and local C¹ claims are supported; the quotient distance is appropriate. |
| 10.3 caloric ℋ bound | OhTataru-YMHF lines 3286–3290, Proposition 7.7, p. 69, compared with line 2423, Lemma 5.30, p. 52; OhTataru-Threshold lines 912–917, Theorem 2.8, p. 21 | ℋ bound supported; inhomogeneous W strengthening false. R01 repairs the source’s missing homogeneous marker. |

The manifest records all twelve cited works under single keys. No source was newly fetched and no manifest entry was rewritten. The primary sources and source-proof corrections were distinguished from independently supplied arguments; in particular a citation to a paper was not treated as ownership of a library prerequisite.

### Computed adversarial table

In this table i,j,k are quaternion generators, [i,j]=2k, and the SU(2) metric is −tr. A displayed ∞ is an actual divergent integral or extended value, not an uncomputed placeholder. Fourier-mode computations are symbol tests; localized Schwartz packets provide finite-norm tests when needed.

| Statement | Instances tried and computed values on both sides | Result / change |
|---|---|---|
| Conventions, 1.1 | ‖i‖²=2, ‖[i,j]‖²=8, ratio=√2; finite group has Lie algebra 0 and γ₀=0. Rescaling metric by c gives γ₀/√c. | Correct metric and zero-algebra conventions. |
| 1.2 | U(1): nearest value (1+i)/√2, derivative ib; polar shear t=1: squared distance 5−2√5≈0.528, versus Gram–Schmidt distance 1; at matrix 0 every unitary has distance²=N. | Mathematically correct on the tubular domain; R03 ownership. |
| 1.3 | O=exp(x₁i)exp(x₂j): F[−dOO⁻¹]₁₂(0)=0; wrong sign gives 4k. With g=exp(πk/4), derivative of Ad(g exp(x₁i))j is 2k, wrong placement gives 0. | Correct nonabelian signs. |
| 1.4 | A=−R: tr(A dA)+(2/3)tr(A³)=tr(R³)/3; tr(R³)(k,i,j)=−12; sphere integral −24π²/3=−8π². | Correct normalization; R02 ownership. |
| 1.5 | F₁₂=F₃₄=X: ‖F‖²=2‖X‖² and wedge coefficient=2‖X‖²; without the all-index 1/4 factor it is 8‖X‖². F₁₂ alone gives wedge 0. | Correct splitting and equality cases. |
| 1.6 | Pauli triple with scale λ: cubic magnitude 24√2|λ|³ equals the asserted bound; flipping λ reverses its sign. Abelian bracket gives 0. | Correct signed cubic bound. |
| 2.1 | log-log critical gauge: radial integrals ∫₁∞L⁻²dL=1 and ∫₁∞L⁻⁴dL=1/3; no limit at 0. Axis vortex yields ∫₀¹ρ⁻²dρ=∞. Two-coordinate weak derivatives are (∂u,∂v). | Correct regularity discrimination; R04 ownership. |
| 2.2 | Touching half-domains cannot have smooth cutoff values 0 and 1 at their common boundary; a cutoff positive on W tending to 0 there does. Empty W gives difference norm 0. | The variable-radius smoothing repair avoids the source’s cutoff error. |
| 2.3 | Product of constant i,j is k; inverse of i is −i; (ij)⁻¹=−k=j⁻¹i⁻¹, whereas i⁻¹j⁻¹=k. | Correct order of inverse/product. |
| 2.4 | At the permitted critical endpoint d=4,k=1: O=exp(i√log(1/r)), B=j√log(1/r). Individual fourth derivative integrals reduce to ∫₁∞L⁻²dL<∞; product derivative gives ∫dr/r=∞. B bounded removes this obstruction. | Correct extra endpoint boundedness. |
| 2.5 | Constant −1 extends as −1, not as identity; degree-one S³ map has degree 1 versus extendable degree 0. A nonconstant degree-zero homogeneous phase still has exterior gradient integral C∫₂∞dr/r=∞. | Constants, homotopy and exterior integrability distinguished. |
| 3.1 | Fλ=λ²F(λx): critical integral multiplier λᵈλ⁻ᵈ=1; at d=3 its L² norm multiplier is λ¹/². Finite-group potential and curvature both 0. | Correct critical exponent. |
| 3.2 | U(1) gauge A−idφ has F unchanged; nonabelian punctured pure gauge has F=0 despite potential size 1/r. Ad isometry gives equal curvature norms. | Correct weak/gauge distinction. |
| 3.3 | Two flat trivializations with constant transition c patch to potential 0; cocycle products c₁₂c₂₃=c₁₃ yield zero curvature in either trivialization. | Patching respects gauge equivalence; no global bundle topology on the ball is asserted beyond the critical smoothing route. |
| 3.4 | Flat: r_c=∞, R_c=0. BPST ball energy is 8π²r⁴(r²+3)/(1+r²)³, giving 4π² at r=1, 8π² at ∞, and leading term 24π²r⁴ at 0. | Radii and scaling agree. |
| 4.1 | Abelian Neumann equation removes divergence and normal trace. At A=0, Δφ=0 and ∂νφ=0 give ∫|∇φ|²=0, hence constant gauge. | Boundary condition and small-norm uniqueness regime retained. |
| 4.2 | A=−dΦ Φ⁻¹ has F=0 but ∫₀¹r⁻¹dr=∞ for its W¹,² derivative; inverse gauge gives potential 0 and derivative norm 0. | Removal is after gauge change. |
| 4.3 | A_n=n⁻³/²sin(nx₁)i dx²: W¹,² norm O(n⁻¹/²)→0, second derivative L⁴/³ norm ≍n¹/²→∞. The added curvature-derivative assumption also fails by n¹/². | Correct negative control for higher convergence. |
| 4.4 | Flat curvature gives all ball curvature norms 0 and a zero global potential. Rescaling radius R multiplies critical derivative norm by R⁰; noncritical Lᵖ derivative scales R^{d/p−2}. | Correct rescaling and dependence on concentration ratio. |
| 5.1 | Cutoff identically 1 at the origin permits ∫₀¹dr/r=∞; vanishing cutoff removes it. BPST remainder is O(r⁻³), gradient O(r⁻⁴). Finite ±1 gauges both yield potential 0 but different free homotopy classes. | Correct cutoff and disconnected control. |
| 5.2 | Translate BPST by b: r_c,R_c unchanged; choose center b and the same remainder norm. Dilate: r,R both divide by λ, so R/r unchanged. Flat case has B=0. | Correct center and scale quantifiers. |
| 5.3 | Abelian transition identity gives −dθ′+dψ+dθ=0; exchanged order gives 2dψ. Null angular phase exp(ix₁/r) at fixed A=0 needs C∫₂∞dr/r=∞ remainder. | Correct direction and gauge-changing converse. |
| 5.4 | A=−2x₁i dx¹, b=j dx²/(1+r²): b∈Ḣ¹, but curvature has k-term −4x₁/(1+r²), whose squared radial integral grows as ∫r dr=∞. For finite G the double-constant quotient has one element. | Good-representative restriction and quotient are necessary. |
| 5.5 | BPST c₂=1 and L⁴ tail ∫₁∞dr/r=∞; zero potential has class 0 and both homogeneous norms 0. | Both directions consistent. |
| 5.6 | Normalized homotopy at basepoint is H(t,e)⁻¹H(t,e)=1. SU(2) gives π₃=ℤ; U(1) gives 0. | Based/free comparison correct for connected G. |
| 6.1 | Curvature polynomial degree k in d=2k scales λ^{2k}λ^{-d}=1. Degree-two U(1) finite-energy exact curvature gives characteristic number 0. | Integrability/scaling correct. |
| 6.2 | Boundary Φ integral is −8π²; constant boundary map gives 0. Changing cutoff contributes equal boundary values and zero difference. | Transgression boundary normalization correct. |
| 6.3 | E−χ=2‖F⁺‖², E+χ=2‖F⁻‖². Opposite chirality energies u,v give E−|χ|=2min(u,v)>0 when u,v>0. | Equality iff one chirality vanishes. |
| 6.4 | degree(Φ)=1 yields c₂=−1 for its cutoff pure gauge; quaternion conjugation has degree −1 and yields c₂=1, matching BPST. | Sign and integer normalization correct. |
| 7.1 | Constant abelian F=i dx¹²: divergence 0, energy ∞. F=iψ(x₁)dx¹²: divergence component iψ′, nonzero for ψ=x₁. | Local harmonicity does not imply finite energy. |
| 7.2 | BPST ‖F(0)‖=√48 finite; dilation gives DⁿF multiplier λ^{n+2}. Zero curvature produces zero curvature derivatives. | Quantitative regularity scales correctly. |
| 7.3 | BPST |F|=√48/(1+r²)², asymptotic √48r⁻⁴; pure-gauge puncture is removed to zero curvature. | Correct decay/removal witnesses. |
| 7.4 | Self-dual BPST at 0: half-Laplacian of |F|²=−768, |∇_AF|²=0, cubic pairing=768. For u=48¹/⁴/(1+r²), Δu=−8·48¹/⁴/(1+r²)³ equals the claimed lower bound. | Sign and Kato consequence agree. |
| 7.5 | γ₀=√2 gives chiral bound 16π²/2=8π². Opposite SU(2) instantons in two factors give E=16π², χ=0 and attain the non-instanton gap. | Correct metric normalization and product control. |
| 7.6 | Six components each have squared norm 8/(1+r²)⁴, total 48/(1+r²)⁴; radial integral 1/12 gives E=96π²/12=8π². | Explicit instanton agrees with topology and energy. |
| 7.7 | E_GS=16π²/(√2)²=8π²; multiplying the metric by c gives 8π²c on both sides. Abelian nontrivial harmonic set is empty, infimum +∞. | Correct ground-state and empty-set conventions. |
| 8.1 | Gradient blocks with divergence norm 1/k: squared sum π²/6 finite versus sum ∞, hence Ḣ¹ but not ℋ. Zero envelope has norm 0. Native D1p0 test-function embedding has norm ‖∇φ‖₂. | ℋ discrimination correct; R05 imports native core. |
| 8.2 | A=0, frequency ξ≠0: inverse multiplier −1/(4π²|ξ|²), so ΔB=F. Variation of +⟨B,F⟩ gives −ΔB+F=0; negative sign would give −F. | Sign correct; no division at zero frequency. |
| 8.3 | Unit L² datum: energy identity 1=1, time gradient square integral 1/2, but sum estimate LHS 1+1/√2 versus proposed RHS 1. K separated blocks have input norm ≍1 and L¹ heat-gradient norm ≳√K. | R06; ℓ²L¹ repair and qualitative decay otherwise sound. |
| 8.4 | b=|D|sign(x₁): full negative Sobolev norm 1, heat-difference norm 1 for every s>0; fixed blocks tend to 0. β=0 forcing gives B(s)=sG+o(s), exponent 1. | Correct endpoint/exponent tests once full carrier is specified (R07). |
| 9.1 | Constant A₁=i,A₂=j,A₃=k: F₁₂=2k; ∂ₛF₁₂=−32k, Δ_AF₁₂=−16k, difference −16k equals bracket RHS. Abelian Fourier energy derivative is −2 times dissipation. | Covariant sign and energy factor agree. |
| 9.2 | Weight exponent n/2+1−2/q gives dilation factor λ⁰=1. Printed extra 1/4−1/p would give λ^{−1/2+2/p}, hence λ⁻¹/² at p=∞. | Roadmap’s correction is necessary. |
| 9.3 | Abelian a=∇φ+a_df evolves as ∇φ+eˢΔa_df; flat gradient is stationary. Dilation changes lifespan by λ⁻². | Correct degeneracy and local-caloric gauge. |
| 9.4 | Q³ dilation factor λ⁶λ⁻⁴λ⁻²=1. Flat flow has Q=0 and lifespan ∞; static BPST has Q=∞ and L⁴ potential tail ∞. | Continuation/threshold cannot be applied to BPST as Ḣ¹ data. |
| 9.5 | Abelian limit is ∇φ; divergence-free heat part tends to 0 in its homogeneous norm. Fourier multiplier e^{−4π²s|ξ|²} tends to 0 a.e., dominated by 1. | Correct flat limit, not necessarily zero. |
| 9.6 | A nontrivial harmonic bubble has energy ≥E_GS; energy monotonicity gives bubble energy ≤initial energy. Thus initial energy <E_GS excludes the bubble alternative. | Dichotomy consistent with small energy. |
| 9.7 | SU(2) threshold 2E_GS=16π². BPST has 8π² but violates Ḣ¹. In class zero a bubble of characteristic χ needs exterior characteristic −χ and energy ≥|χ|, yielding ≥2E_GS in the instanton case. | Topological threshold has its needed class restriction. |
| 10.1 | Abelian a=i∇φ is gauged to 0 by exp(iφ); a=0 requires constant O, normalized limit gives O=1. | Correct side of gauge normalization. |
| 10.2 | Abelian Cal is the divergence-free projection; a pure gauge maps to 0. Constant conjugation c gives quotient distance d(Ad(c)a,a)=0. | Correct quotient uniqueness. |
| 10.3 | Nonabelian packet quadratic divergence coefficient −6k/5≠0. Dilation λ=2⁻ᵐ: E,Q unchanged, ‖div aλ‖₄/₃=2ᵐ‖div a‖₄/₃; homogeneous derivative and ℓ¹L² exponents both 0. | R01; repaired norm passes same test. |
| 10.4 | At a=0 the Coulomb projection is P=I−∇Δ⁻¹div: P∇φ=0 and Pv=v for div v=0, so P²=P. Curve t↦t³ has derivative 0 and fails immersion despite being a homeomorphism. | Split-submanifold definition excludes the wrong model. |
| 10.5 | Abelian w=∇ψ+w_df gives c=−ψ, b=w_df, w=b−Dc and limiting tangent condition 0. A pure gauge direction Dc₀ yields b=0,c=−c₀. | Nonlinear decomposition has correct sign and gauge kernel. |

### Pinned-library and supplier resolution

The following files/declarations were opened at the pins, not merely matched by name. Paths in this table are relative to the respective library repositories.

| Pinned location | What it supplies / limitation checked |
|---|---|
| `Mathlib/LinearAlgebra/UnitaryGroup.lean:105`, `:278` | Matrix.unitaryGroup and specialUnitaryGroup; algebraic carriers, not the whole compact smooth-group/Sobolev API. |
| `Mathlib/Analysis/Normed/Algebra/Exponential.lean:128`, `:521`; `Mathlib/Analysis/Normed/Algebra/MatrixExponential.lean:145` | NormedSpace.exp, exp_add_of_commute and Matrix.isUnit_exp; matrix completeness/characteristic assumptions apply. |
| `Mathlib/Topology/Homotopy/Basic.lean:333`, `:354`; `Mathlib/Topology/Homotopy/HomotopyGroup.lean:441` | Free continuous homotopy and its equivalence relation; HomotopyGroup uses cubical loops. Neither encodes gauges at infinity. |
| `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:89` | Lp is an a.e.-function subgroup with finite eLpNorm; weak derivatives are additional data. |
| `Mathlib/Analysis/FunctionalSpaces/SobolevInequality.lean:602` | eLpNorm_le_eLpNorm_fderiv_of_eq: compact support, C¹, finite-dimensional domain and target, Sobolev exponent relation. |
| `Mathlib/MeasureTheory/Constructions/HaarToSphere.lean:52`; `Mathlib/Analysis/Normed/Module/Ball/RadialEquiv.lean:71` | toSphere measure and punctured radial homeomorphism; origin is excluded from the latter. |
| `Mathlib/Analysis/Calculus/FDeriv/Defs.lean:123`; `Mathlib/Analysis/Calculus/ContDiff/Defs.lean:1067`; `Mathlib/Analysis/InnerProductSpace/Orientation.lean:170` | HasFDerivAt, ContDiff and Orientation.volumeForm have the claimed native meanings. |
| `Mathlib/Topology/Algebra/Module/Complement.lean:87` | ClosedComplemented uses a continuous linear retraction, not just algebraic direct-sum existence. |
| `Mathlib/Geometry/Manifold/SmoothEmbedding.lean:70`; `Mathlib/Geometry/Manifold/Immersion.lean:802`, `:1008` | Smooth embedding includes immersion and topological embedding; immersion uses a common complement; split derivative conclusion needs n≠0 (here n=1). |
| `Mathlib/Geometry/Manifold/HasGroupoid.lean:284`; `Mathlib/Analysis/Calculus/InverseFunctionTheorem/ContDiff.lean:31`, `:66` | Opens charted-space instance and differentiable inverse with invertible derivative and positive differentiability order. |
| `Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/Basic.lean:366` | Smooth vector-bundle covariant derivative structure; not the critical weak Yang–Mills connection carrier. |
| `TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean:251`, `:302` | HasWeakFDerivOn uses weak directional integration identities and local integrability; finite-dimensional operator reconstruction is available. |
| `TauCeti/Analysis/Sobolev/W1p/Basic.lean:372`; `TauCeti/Analysis/Sobolev/Wkp/Basic.lean:145` | Scalar weak-derivative graphs; finite-dimensional value comparison is not already the general carrier asserted in §2.1. |
| `TauCeti/Analysis/Sobolev/W1p/Morrey.lean:156`; `TauCeti/Analysis/Sobolev/Morrey.lean:181` | morreyRepresentative and the ball estimate require supercritical p, not the critical endpoint of §2.1. |
| `TauCeti/Analysis/Sobolev/D1p0/Basic.lean:100`, `:117`, `:128`, `:155`, `:246`, `:321`, `:362` | Homogeneous gradient closure, completeness, density and injective L^{p*} realization; R05. The embedding guarantees need p*≠∞. |
| `TauCeti/Geometry/Manifold/TubularNeighborhood/Euclidean.lean:351`; `TauCeti/Geometry/Manifold/TubularNeighborhood/LocalInverse.lean:46` | Compact C² normal-tube embedding and local Cⁿ normal retraction from C^{n+1} data; nearest-point uniqueness is not itself in these declarations. |
| `TauCeti/Analysis/InnerProductSpace/HodgeStar/AlternatingForm.lean:76`, `:111`, `:157` | formHodgeStar, wedge characterization and square for even dimension; tested on dx¹² and dx³⁴ above. |
| `TauCeti/Analysis/PDE/HeatKernel/Basic.lean:76` | heatKernel=(4πt)^{-n/2}exp(−‖x‖²/(4t)); meaningful semigroup assertions require t>0, as used here. |

Cross-roadmap citations were resolved against main, or the supplied open heads for new roadmaps. In particular:

- PDE §§1.2,1.4–1.6,2.2–2.3,3.2,6.1,6.3,7.1–7.3 supply the scalar density, embeddings, traces, elliptic/multiplier, weak-maximum, Bochner, heat, dyadic and paraproduct inputs. §7.2 at `TauCetiRoadmap/PDE/README.md:2719` includes the homogeneous Besov realization; it is not a definition of the full W^{σ,p} norm missing in R07. §7.1’s dyadic cutoff places frequency 2ʲ in P_{j−1}, as recorded in Conventions.
- SmoothBundlesConnections B3.1, B4.1 and B4.2 were read on main and at PR #2127. The curvature and inverse-pullback left-action formulas agree: the local section change by g corresponds to this package’s O=g⁻¹. Main B4.1 is at `TauCetiRoadmap/SmoothBundlesConnections/README.md:979`, B4.2 at line 1010. These ids persist at the open head.
- CharacteristicClasses C4 item 1 (`TauCetiRoadmap/CharacteristicClasses/README.md:1323`) supplies more than the package imports; C5a.3 at line 1530 resolves the transgression ownership (R02). RiemannianGeometry R6 at line 3472 resolves nearest-point ownership (R03).
- DifferentialGeometry Layers 0–1, §§5.2–5.4 and §§10.3–10.5 were resolved on main. Degree’s integral formula at `TauCetiRoadmap/DifferentialGeometry/README.md:2716` and homotopy invariance at line 2750 use the same orientation. AlgebraicTopology Stage 6 item 5 and Stage 8 item 3 resolve to its degree comparison and absolute Hurewicz/sphere comparison (lines 2967 and 3334, with the retained stage mapping at lines 879 and 884).
- LieGroups lives at `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md`. Layers 0–2, 5A (line 641) and 6 (line 750) provide exponential, adjoint, closed subgroups, invariant metric/splitting and compact rank-one representatives. Metric extremality is precisely the declared gap, not silently supplied by those sections.
- Yamabe Y2 item 1 at `TauCetiRoadmap/Yamabe/README.md:150` gives a₄=6 and Y(S⁴)=8√6π. Thus its scalar sharp Sobolev coefficient is Y/6=(4√6/3)π, consistent with the curvature-gap constants.
- FourManifolds PR #936 §5.3 supplies a narrower SU(2), four-ball Coulomb theorem and an S⁴ BPST construction. The arbitrary-group/all-dimension local theorem and explicit Euclidean potential here state their differences in Scope; this is not an unacknowledged second copy. InstantonFloerTheory PR #1083 IF1 concerns SU(2)/SO(3) Floer interfaces rather than this general critical Euclidean heat flow. SobolevDifferentialForms PR #1609 owns weak exterior-derivative spaces and compact Picard theory, not matrix-valued W^{k,p} gauges. IncompressibleFlows PR #237 has the exact generic bridge collision R04.

Object searches used `roadmaps grep` across main and indexed open heads, plus the pinned sources and board package context. No native Yang–Mills, caloric, Uhlenbeck or BPST carrier was found. The homogeneous-space search did find D1p0 and was followed through its definitions rather than dismissed on a name mismatch. The overlap report contained no conflicting heads changing this roadmap, no dropped cited ids and no ids available only in an open revision; inspection of the relevant supplier heads did not overturn those results.

### Supplier order and declared contracts

The required dependency command completed successfully with the following output:

```text
depcheck: 236 roadmaps, 2134 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Every Needs line and supplier citation was read; no prohibited roadmap is used as a supplier. R03 can use an owner already on main; R04 explicitly must not be repaired by adding IncompressibleFlows as a dependency.

The four gap slugs match the design’s top-level gaps and the README’s Exact supplier contracts: `lp-neumann-ball` (line 265), `lp-divcurl-normal-ball` (line 268), `hardy-inequality` (line 271), and `compact-su2-subalgebra` (line 316). Each names an eligible supplier and precise hypotheses. The Neumann compatibility condition removes the constant obstruction; on the ball the normal div–curl kernel is zero; p<d makes the Hardy denominator positive; the rank-one metric extremality requires a noncommutative algebra. No supplied theorem with these full conclusions was located at the pins or earlier owners. They are contracts, not unowned prerequisites, and are not findings. Since the verdict is needs changes, no conditional acceptance is recorded.

## Not verifiable

- `Uhlenbeck-LpCurvature`, Theorem 1.3, and `Uhlenbeck-RemovableSingularities`, Theorem 4.1: settled uncertified primary texts. The openly available Oh–Tataru statements and their local proof material were checked, but the original primary pages were not read.
- `FreedUhlenbeck-Instantons`, `DonaldsonKronheimer`, `Bogomolnyi-Stability` and `MimuraToda-TopologyLieGroups`: settled uncertified manifest entries. Their cited original locators cannot be certified from the accessible texts. Explicit instanton/sign/degree calculations and the accessible alternative statements were checked independently.
- Published/preprint numbering agreement is not certified for those unavailable editions. All certified line/page locators in this report refer to the actual cached version read. No settled source was requested again and no missing-reference request was created.

## Source issues

- **Misprint** in OhTataru-TopClass at equation (1.26), printed p. 17 (line 886): the source says the all-index curvature wedge has no prefactor; it should be multiplied by 1/4 with its curvature-component convention; affects a stated result.
- **Gap** in OhTataru-TopClass at Lemma 3.2 proof, printed p. 21 (line 1049): the source says disjoint open sets admit a smooth zero/one separating cutoff; it should use a variable smoothing radius positive on W and vanishing suitably toward V; affects the proof.
- **Error** in OhTataru-TopClass at Lemma 3.4(2), printed p. 22 (line 1116): the source says critical adjoint multiplication preserves the top Sobolev order for arbitrary B; it should require boundedness at that endpoint, or restrict to lower orders; affects a stated result.
- **Misprint** in OhTataru-TopClass at Lemma 3.4(3), printed p. 22 (line 1130): the source says the adjoint encloses the bracket with the right Maurer–Cartan form; it should bracket that form with the already adjoint-transformed B; affects a stated result.
- **Misprint** in OhTataru-TopClass at Proposition 3.9, printed p. 26 (line 1303): the source says the patched potential has the gauge’s kth Sobolev order; it should have order k−1 at the stated curvature regularity; affects a stated result.
- **Misprint** in OhTataru-TopClass at Theorem 3.11 proof, printed p. 27 (line 1375): the source says the right Maurer–Cartan curl has negative bracket sign; it should have positive bracket sign, with the adjoint term placed consistently with the gauge direction; affects the proof.
- **Misprint** in OhTataru-TopClass at Theorem 3.11 proof, printed p. 28 (line 1392): the source says ordinary curl equals curvature; it should subtract the quadratic connection bracket; affects the proof.
- **Misprint** in OhTataru-TopClass at Lemma 3.13, printed p. 29 (line 1423): the source says the concluding exponent involves an unspecified n; it should use the derivative index m; affects a stated result.
- **Error** in OhTataru-TopClass at Remark 3.15, printed p. 29 (line 1472): the source says lower-order convergence supplies the stated higher derivative convergence; it should assume convergence at the required higher curvature/potential orders; affects a stated result.
- **Error** in OhTataru-TopClass at Theorem 1.5, printed p. 8 (line 374): the source says extra curvature regularity on B_R yields global higher regularity; it should assume that extra regularity globally; affects a stated result.
- **Gap** in OhTataru-TopClass at Theorem 1.5 proof, printed pp. 31–32 (lines 1563–1568): the source says radius normalization gives small curvature outside the origin-centered unit ball; it should first translate to an exterior center and allow slack for an unattained infimum; affects the proof.
- **Misprint** in OhTataru-TopClass at Theorem 1.5 proof, printed p. 32 (lines 1573–1575): the source says inversion pulls back the metric by |x|⁴ and has orientation sign (−1)^d; it should use |x|⁻⁴ and sign −1 in every positive dimension; affects the proof.
- **Error** in OhTataru-TopClass at Theorem 1.5 proof, printed p. 32 (line 1591): the source says ordinary differentiation commutes with inversion pullback; it should include derivatives of the inversion Jacobian and control the resulting lower-order term; affects the proof.
- **Gap** in OhTataru-TopClass at the good-representative definition, printed p. 8 (line 386): the source says compact support of 1−χ is the only cutoff restriction; it should also make χ vanish near the singular origin for the decomposition to be automatically locally Sobolev; affects a stated result.
- **Error** in OhTataru-TopClass at Proposition 1.6(1), printed p. 9 (line 401): the source says gauges at infinity always have the same free homotopy class; it should assume connected G or quotient by constant left/right multiplications; affects a stated result.
- **Error** in OhTataru-TopClass at Proposition 1.6(2), printed p. 9 (line 403): the source says every homotopic angular map is a good representative of a fixed potential; it should allow changing that potential by a global gauge; affects a stated result.
- **Misprint** in OhTataru-YMHF at equation (1.19), printed p. 6 (line 243), and Proposition 5.6, printed p. 36 (line 1617): the source says energy dissipation has unit coefficient and the latter formula reverses a curvature index; it should use twice the positive squared covariant divergence with its stated energy normalization; affects a stated result.
- **Error** in OhTataru-YMHF at Theorem 4.6, printed p. 29 (line 1290): the source says the heat-gradient bound has an L¹ homogeneous-Sobolev norm; it should have the dyadic ℓ²L¹ norm established in its proof; affects a stated result.
- **Error** in OhTataru-YMHF at Theorem 4.7, printed p. 30 (line 1356): the source says full-norm heat continuity holds also at p=∞; it should require the heat-continuity subspace there or state a blockwise/distributional trace; affects a stated result.
- **Misprint** in OhTataru-YMHF at Theorem 4.8, equation (4.34), printed p. 33 (line 1522): the source says the time power is 1−α/2 with α unspecified; it should be 1−β as in the L² statement; affects a stated result.
- **Misprint** in OhTataru-YMHF at Proposition 5.7 proof, printed p. 37 (line 1668): the source says the commuted heat operator has a positive Laplacian; it should have the negative Laplacian as in the preceding curvature equation; affects the proof.
- **Error** in OhTataru-YMHF at Corollary 5.8, equations (5.17)–(5.18), printed p. 38 (lines 1774–1800): the source says the ds/s weight includes an extra 1/4−1/p; it should use n/2+1−2/q, which has the required parabolic scaling; affects a stated result.
- **Error** in OhTataru-YMHF at Corollary 5.12, printed pp. 41–42 (lines 1923–1934): the source says the solution extends to a strictly larger interval without a finite-endpoint qualification; it should restrict that extension clause to finite s₀; affects a stated result.
- **Misprint** in OhTataru-YMHF at Proposition 7.7, equation (7.7), printed p. 69 (line 3288): the source says the divergence is uniformly bounded in inhomogeneous W^{1,4/3}; it should be homogeneous Ẇ^{1,4/3}, as in Lemma 5.30; affects a stated result.
- **Error** in GurskyKelleherStreets-GapTheorem at Definition 2.3, printed p. 4 (lines 164–173): the source says both suprema are always attained; it should exclude the zero Lie algebra from attainment and assign its bracket constant zero separately; affects a stated result.
- **Error** in GurskyKelleherStreets-GapTheorem at Lemma 2.4, printed p. 4 (lines 178–196): the source says the supremum in every subalgebra is attained by a Pauli pair; it should distinguish equality in the universal bound from the maximum in an arbitrary subalgebra; affects a stated result.
- **Misprint** in GurskyKelleherStreets-GapTheorem at Lemma 2.6 proof, printed p. 5 (line 218): the source says one factor has power three in a quartic bound; it should have power two; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "f80740ed53cb593cb6aa36b9dd67c7c6e7f25b16", "job": "REV-PKG-YangMillsConnectionsAndCaloricGauge", "model": "gpt-6-astra", "worker": "chris-30"} -->
