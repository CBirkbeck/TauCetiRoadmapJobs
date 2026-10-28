<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1236#issuecomment-6400817967 -->
Red team round 1 pass a (codex) of bb39ab9

Verdict: needs_changes

1. **F01** (P3) Point-removal input is attributed to the arc-removal supplier

   **Location:** packages/FuchsianOrbifoldsPartII/README.md:97, with the use at :522 and dependencies at :526: “Consume L4 … for analytic-arc reflection and removable extension in local discs.”

   **Claim:** ConformalMapping L4 supplies the isolated-singularity removal used to fill punctures above cone points in §3.2.

   **Witness:** TauCetiRoadmap/ConformalMapping/README.md:118–122 supplies reflection and removability across arcs; :14 assigns Riemann point-removability to Mathlib. Mathlib/Analysis/Complex/RemovableSingularity.lean:100 supplies the bounded punctured-neighborhood theorem actually needed.

   **Exact repair text:** Replace the removable-extension part of the L4 contract by: “For removal of isolated cone lifts use Mathlib `Complex.differentiableOn_update_limUnder_of_bddAbove` in `Mathlib/Analysis/Complex/RemovableSingularity.lean`: the coordinate domain is a neighborhood of the deleted point, the lift is holomorphic off that point, and its image lies in a bounded target disc. The theorem constructs the holomorphic extension by assigning the punctured limit.” Add that declaration to §3.2's Needs. Retain ConformalMapping L4 for reflection across the genuine boundary.

   **Repair test:** In the order-two chart u↦u², the identity lift on a deleted unit disc has norm <1; at c=0 the cited theorem extends it with value 0. Reflection across a boundary arc alone does not name this point-removal input. This is a supplier-locator correction, not a counterexample to conformal conjugacy.

   The remaining review is conditional on the two declared AutomorphicSpectralTheory contracts; their absence from that supplier is not a finding.

## Verified sound

Read all 807 README lines and all 103 Suggested.lean lines, including 28 numbered target sections, 8 declarations (3 definitions and 5 theorems), and 60 Check bullets in 18 blocks. The README uses numbered headings rather than bold mathematical target names; the bold headings are Summary, Checks and reference identifiers. The tables below cover the numbered targets, their API claims and the conventions. The text of all 25 target blocks with literature locators was checked, together with the three locally derived Layer 3 routes. Twelve roadmap supplier contracts were resolved; the one point-removal attribution defect is R01.

The supplied elaborated signatures were compared individually with the source and README. No section variables or `include` blocks exist. All theorem hypotheses are explicit; the three definitions have real bodies. No Lean command or build was run. The single Mathlib import and the individual Tau Ceti action import exist at the pins. No padding theorem, sorry'd data, arbitrary predicate standing for missing geometry, `set_option`, `lemma`, or duplicated fully qualified declaration was found.

**Declaration/context table.** All names are in `TauCetiRoadmap.FuchsianOrbifoldsPartII`. The action and measure are the native effective PSL₂(ℤ) action on UpperHalfPlane and invariant volume; no user-supplied topology or measure is quantified over.

| Declaration, source line | Section; entire variable/instance context | Instances and values computed on both sides | Result; change |
| --- | --- | --- | --- |
| AdmissibleCycle, 34 | Layer 1; n : List ℕ; no section instances | [], [2], [2,2] give false; [3], [4], [3,2], [4,4] give true. Sums are 0,2,4,3,4,5,8. Repetition does not imply failure. | Matches §1.1; none |
| cycleGroup, 39 | Layer 1; n : List ℕ; native Subgroup PSL₂(ℤ) | [] generates {T⁰}={1}; [3,6] generates S, T³ST⁻³, T⁹, with centres 0,3 and width 9. [4,4] has centres 0,4 and width 8. | Total raw construction matches §1.1; none |
| cyclePolygon, 49 | Layer 1; n : List ℕ; Set UpperHalfPlane | [] gives x=0,y≥1. [4] gives width 4 and ideal interval (1,3); [3,2] gives intervals (1,2), empty. At y=2 each squared distance from a real centre is ≥4. | Matches §1.2 including both end centres; none |
| cyclePolygon_fundamentalDomain, 56 | Layer 1; n; hn : AdmissibleCycle n; subgroup action, invariant volume | [4]: T⁴ pairs i and 4+i; S fixes i, a null tie. [3,6]: i and 9+i are tied, 3+i is the other elliptic orbit. [] has area-zero polygon and fails coverage, but hn is false. | Native a.e. domain allows null ties; none |
| cycleGroup_presentation, 65 | Layer 1; n, hn; existential marked multiplicative equivalence from ℤ * (C₂)^*length | [4]: positive ℤ generator sends i to 4+i, inverse to −4+i. [3,6]: second involution matrix [[3,−10],[1,−3]] fixes 3+i. [4,4]: SS₁=[[-1,4],[4,−17]], S₁S=[[-17,−4],[−4,−1]], unequal even up to sign. | Correct nonabelian marked presentation; none |
| cycleGroup_cuspStabilizer, 81 | Layer 1; n, hn; equality of subgroups of PSL₂(ℤ) | [4] translation exponents 4ℤ on both sides; [4,4] exponents 8ℤ on both sides although the maximal-height point set has period 4. T⁴ is absent in the latter, as reduced normal form shows. | Full subgroup, not merely generator membership; none |
| cycleGroup_infiniteIndex, 88 | Layer 1; n, hn; native natural-valued index | [4] contains a shallow strip above a positive-length subinterval of (1,3); its area is length·∫₀^εy⁻²dy=∞, versus finite modular mass π/3. Infinite coset space has native index 0. | Matches §1.6; no interpretation as zero finite index; none |
| cycleGroup_conj_iff_isRotated, 97 | Layer 3; n,n′, hn,hn′; φ : PSL₂(ℝ); map via faithful integral embedding | [3,6]→[6,3]: centres {0,3}−3 modulo 9={0,6}, so both sides true. [4] versus [4,4]: widths 4≠8, so both false. [3,4,5] versus [5,4,3]: centres {0,3,7} versus {0,5,9}, no positive cyclic rotation, both false. | Both directions and repetitions retained; none |

**README target table.** Computations are checks and proof-route audits, not claims that finite sampling proves a universal theorem. “None” means no package edit is requested.

| Statement | Instances tried and computed values on each side | Result | Change |
| --- | --- | --- | --- |
| §0.1 limit-set definition and elementary boundary | Trivial group and finite elliptic group: finite orbit, Λ=∅, cardinality 0. ⟨T⁴⟩: 4j+i→∞, Λ={∞}, cardinality 1. z↦4z: orbit limits {0,∞}, cardinality 2. PSL₂(ℤ): full circle. | Nonelementarity excludes all three elementary cases | None |
| §0.1 independence, closedness, conjugacy and hyperbolic endpoints | T-orbits of i and 2i both have limit set {∞}; diag(2,1/2) has endpoints {0,∞}, conjugation by T gives {1,∞}; both sets closed. Modular full circle is perfect but not nowhere dense. | Second-kind qualification necessary and present | None |
| §0.2 hull and half-disc boundary | For ideal hull in [−1,1] with ∞ outside Λ, the retained side is inside the unit circle: i/2 satisfies 1/4≤1; 2i fails 4≤1. S exchanges these sides while fixing i. | Away-side convention and exclusion of boundary elliptic isotropy agree | None |
| §0.2 equivariance, first-kind iff and paired sides | Translate that semicircle by 1: x²+y²≤1 becomes (x−1)²+y²≤1. Modular hull is ℍ and t=0; its two vertical representatives give 0 genuine boundary components. | Native quotient rather than representative boundary | None |
| §0.3 geometric finiteness, cusp/funnel decomposition | Modular group: s=1,t=0, core area π/3. Γ([4]): s=t=1, core area π, full quotient area ∞. Infinite cyclic parabolic has |Λ|=1 and is excluded. | Finiteness and nonelementarity hypotheses retained | None |
| §0.4 capped signature and B | (0;2,3;1;0) gives 2π(−2+1+1/2+2/3)=π/3; permuting 2,3 gives same. (0;2 repeated ℓ;1;1) gives πℓ, including π at ℓ=1. Pair of pants gives 2π; once-punctured sphere gives −2π and is excluded. | Signs, multiplicities and nonempty-core restriction agree | None |
| §0.4 doubling scalar identity | g=0,t=1,s=1,m=[2]: doubled data (0;2,2;2;0), B=2π=2B_original. g=0,t=3 gives doubled genus 2, B=4π=2·2π. At t=0 the natural genus expression is not used for a connected double. | Compatible with later geometric double | None |
| §0.5 bordered Gauss–Bonnet | For the arithmetic lists of lengths 1,2,5, defect sums 1/2,1,5/2 give areas π,2π,5π. Paired edge contributions cancel; each cusp contributes once to s and zero to t. | Positive finite core area distinct from whole-quotient area | None |
| §0.6 primitive funnel representative | T⁴S=[[4,−1],[1,0]] has trace 4, eigenvalue 2+√3, length 2log(2+√3). T has trace 2 and one fixed ideal point, no axis. Squaring T⁴S doubles length and is not the primitive traversal. | Cusp and multiple traversal excluded | None |
| §1.1 admissibility and raw group | [],[2],[2,2] false; [3,2] true despite one 2; [4,4] true despite repetition. S₁ at centre 3 is [[3,−10],[1,−3]], square −I in SL and 1 in PSL. Sℓ=T^mS₀T^−m. | Raw totality and geometric/arithmetic hypotheses separated | None |
| §1.2 polygon, measurability and side pairings | [4]: free length 4−2=2. [3,2]: second free length 2−2=0; tangency at 4 is ideal, not in ℍ. [3,6]: norm-squared of i,3+i,9+i relative to respective centres is 1; T⁹i=9+i. At y=2 all disc inequalities hold. | Closed strip and half-side pairings agree | None |
| §1.3 tiling, presentation, unique cusp and end | [4] has one C₂ factor; [4,4] has two noncommuting factors and translation width 8. In [3,2], tangency 4 maps under S₁ to 2, an endpoint of free interval (1,2); it is not a closed parabolic vertex cycle. Two half-turns at centres distance 2 have product trace −6, not ±2. | Digit 2 does not create an additional cusp; normal-form proof applicable | None |
| §1.4 cyclic invariance and projection | [3,6] rotated once: subtract prefix 3 to get residues {6,0} modulo 9, exactly [6,3]; adding 3 instead gives {3,6}, the wrong normalized centres. Integral T^−3 has trivial action on modular orbit labels. | Conjugation sign and over-M comparison agree | None |
| §1.5 word, primitivity and endpoints | [3,6] word [[17,−3],[6,−1]], determinant 1, trace 16, endpoints (3±√7)/2. First endpoints ≈0.1771,2.8229 lie in (0,1),(2,3); transformed endpoints ≈3.3542,8.6458 lie in (3,4),(8,9). [3,2] gives weak middle equality 4=4. [2,2] has trace 2. | Attracting direction and weak equality at digit 2 agree | None |
| §1.6 second kind, infinite area and infinite index | [4] free point 2 misses Λ; any compact subinterval of (1,3) supports infinite shallow-strip area. Finite-index d would give dπ/3<∞, contradiction. Nontrivial T⁴, S and T⁴S give distinct limit points. | No invalid inference from infinite index alone | None |
| §2.1 finite cutting and orientation | [4]: z=1/2+(√3/2)i, γz=7/2+(√3/2)i; last crossing is endpoint. [3,6]: first crossing 5/2+(√3/2)i; S₁γz=17/2+(√3/2)i; applying S₂ then T^−9 returns z. Above each clockwise axis arc is its left side. | Finite rather than whole-axis crossings, and one traversal | None |
| §2.2 core comparison, properness and cusp cutoff | D=28 principal: area 2π versus target π/3, so no embedding. For [3,6], retained radii √7/2 and √7 have maxima 1.3229 and 2.6458; Y₀=3 exceeds both. At x=3/2,y=6/5, Ford inequalities hold but 36/25<7/4 puts the point outside the core. | Correct cutoff and multiplicity-preserving local maps | None |
| §2.3 lift-spacing definition and formulas | V(0)=0; V(2)=2arsinh(1)≈1.762747, cosh V(2)=3; V(4)≈2.887271, cosh V(4)=9. V(−2)<0 whereas arcosh(3)>0, explaining x≥0. i and 4+i in Γ([4]) have quotient distance 0 but lift distance V(4)>0. | Domain and distinction from quotient distance agree | None |
| §3.1 reflected orbifold double | One-cone core (0;2;1;1) doubles to (0;2,2;2;0), area 2π. Pants (0; ;0;3) double to genus 2, area 4π. With t=0 the two copies have two components, outside hypothesis. Reflection squared fixes each point. | Connectedness, cone multiplicity, signature and area agree | None |
| §3.2 conformal lift and cusp normalization | Identity equivalence gives identity lift at fixed basepoint. In a cone disc u↦u², one turn in u maps to two turns downstairs, so the covering subgroup is 2ℤ, not ℤ. For cusp-fixing az+b, Im(az+b)=a Im z; orientation requires a>0. | Order preservation supplies range inclusion; no coarse unramified cover assumed | R01: name the pinned point-removal theorem |
| §3.3 maximal elliptic lifts | [3,6]: S(3+i)=−3/10+i/10, denominator 10; i,3+i have height 1. Identity fixes 2i but is excluded. [4,4]: maximal set ({0,4}+8ℤ)+i=4ℤ+i, while cusp subgroup is ⟨T⁸⟩. Denominator (cN+d)²+c²=0 would force c=d=0, determinant 0. | Exact subgroup equality cases and nonidentity witness retained | None |
| §3.4 class recovery and raw conjugacy iff | Maximal heights 1 and a force a=1; full cusp widths then agree. [3,6]/[6,3] both conjugate and rotated; [4]/[4,4] neither; [3,4,5]/[5,4,3] have equal width 12 and equal trace 48 but different cyclic gaps. | Avoids false rigidity by trace, width or unmarked point set alone | None |
| §4.1 half-open modular convention and quotient measure | i is included though norm²=1 excludes it from fdo. −1/2+2i included, +1/2+2i excluded. Left order-three endpoint included, right excluded. Boundary difference has measure 0; μ(∅)=μ({π(i)})=0, μ(M)=π/3. Removing isolated cone lifts permits path detours. | Tie convention, nonatomicity and regular-locus connectedness agree | None |
| §4.2 projected core measure | Principal D=28: ν(M)=2π, not ≤π/3 as image-area restriction would require; ν(∅)=0. Reciprocal D=5, period [3]: ν=3μ_mod has mass π, agreeing with πℓ. Rotation changes integrals by 0 via the over-M isometry. | Counts sheets, including reciprocal case | None |
| §4.3 finite-family probability | D=28, S={I,J}: L=2+5=7 and total mass 7π; weights 2/7,5/7. Equal weights instead give ν_I/(4π)+ν_J/(10π), generally different from (ν_I+ν_J)/(7π). Empty family gives mass 0, not 1. Covered set of area a has probability 3a/π. | Positive denominator and correct weighting | None |
| §4.4 complementary measures and signs | D=12: π+2π=3π=9·π/3; cusp widths 4+5=9. D=28: 2π+5π=7π=21·π/3; widths 9+12=21. At A=ι(A), both sides retain factor 2: 2ν_A=6ℓ_Aμ_mod. | Multiplicity and normalization agree | None |
| §4.5 involution-stable and genus coverings | In additive C=ℤ/4 with J=2, ι(0)=2,ι(2)=0,ι(1)=1,ι(3)=3; each square coset is stable. In C=ℤ/2,J=1, singleton square cosets swap. D=12 has divisor 3≡3 mod4; D=136=6²+10² has no such prime. D=5 reciprocal singleton gives ρ=3μ_mod/π. | Whole group, genus and reciprocal cases distinct | None |
| §4.6 small discriminants | D12 words [[4,−1],[1,0]], [[5,−3],[2,−1]] have trace 4 and unit 2+√3. D28 words [[17,−3],[6,−1]], [[23,−18],[9,−7]] have trace 16 and unit 8+3√7. All determinants 1. Norms of 1+√3,3+√7,2+√7 are −2,+2,−3. | Class signs, periods, areas and complementary degrees agree | None |
| §5.1 truncation and one-form | F=1 gives α=0. F=y locally gives α=dz/2 and top integral −m/2. Width m=4,Y=2 tail has area 2=m/Y. For log y on [0,1]×[1,2], boundary integral 1/2−1/4=1/4. | Outward-first orientation, cutoff and derivative form agree | None |
| §5.2 finite Stokes, flux-only limit and λ=0 | dα=−(F_xx+F_yy)dx∧dy/2=(λ/2)F dμ. F=1,λ=0 has I=πℓ and both equation sides 0. Harmonic periodic mean a(Y)=a₀+a₁Y has flux −ia₁/2; limit 0 forces a₁=0 and tail a₀/Y₀. For local y, nonzero constant flux −im/2 violates the assumption. | No division by λ=0 or unstated absolute integrability | None |
| §5.3 completed endpoint and differentiation | Residues at s=1/2+ε: +√y/(2ε),−√y/(2ε) cancel; mean √y(log y+2c_Λ), λ=1/4. Tail m(2logY+4+2c)/√Y→0; flux −im(1+(logY+c)/2)/(2√Y)→0; coefficient λ/2=1/8. | Endpoint distinct from totalized product at Λ(1) | None |
| §5.3 Fourier and supplied specializations | n=±1 contributes 4√yK₀(2πy)cos(2πx); n=±2 contributes 8√yK₀(4πy)cos(4πx). Integer-width integrals are 0; derivatives multiply sine by −2π,−4π. σ₀(1)=1,σ₀(2)=2. Cusp-form mean=0. For t≠0 both Stokes sides multiply by the same finite Λ(1+2it). | Divisor factors, flux and parameter restrictions agree | None |

**Additional convention and API probes.** These include the convention Checks counted in the 60 bullets above.

| Statement | Instances and computed values on both sides | Result | Change |
| --- | --- | --- | --- |
| Left action, effective group and noncommutativity | S(i)=i; S(2i)=i/2; S²(2i)=2i. In SL, S²=−I. ST(i)=−1/2+i/2 while TS(i)=1+i. | Correct effective left action | None |
| Metric, measure and Laplacian | dist(i,2i)=log2; rectangle [0,1]×[1,2] has area 1/2. Δlog y=1, so half its area integral is 1/4. At y=2, Δ(y²)=−8; inverse-square normalization gives −1/2. | Signs and curvature fixed | None |
| Ideal circle and basepoints | Cayley(i)=0, Cayley(iy)=(y−1)/(y+1)→1 at ∞; T-orbits of i and 2i have the same ideal endpoint ∞. | ∞ retained | None |
| Narrow class and unit signs | D12: norms of 2+√3 and 1+√3 are 1 and −2. D8: norm(1+√2)=−1, square 3+2√2 has norm 1; primitive norm-one length is 2log(3+2√2). | Does not use the negative-norm unit as ε_D | None |
| Oriented dictionary | Q=[1,0,−3] maps to I; −Q=[−1,0,3] has the same unoriented lattice but maps to J by the √D clause. −1 is not represented by x²−3y² modulo 3. | Sign correction distinguishes the classes | None |
| Digit-2 finite retained arc | [3,2] has z=5/6+(√11/6)i; first crossing 13/6+(√11/6)i. After S₁ the second retained arc runs from 23/6+(√11/6)i to 25/6+(√11/6)i, distinct points despite the ideal interval being empty. | Tangency does not erase a finite arc | None |
| Reciprocal covering control | D5 has period [3], J=I, ℓ=1,m=3; 2ν=6μ_mod, hence ν=3μ_mod and mass π. Boundary image may retrace but its parametrized multiplicities cancel. | Fixed point of ι handled | None |
| Finite-family mixture | If masses are πL and πR, normalized union coefficients are L/(L+R) and R/(L+R); with L=2,R=5 their sum is 1. Replacing a genus representative by an element of its square coset changes the set by 0. | Native finite sums, no new genus quotient | None |
| Denominators and junk values | Empty n gives m=0 and no elliptic indices; excluded from all geometric theorems. Empty S has L=0 and normalized mass 0; excluded. Cone order 0 or 1 is excluded by m_j≥2. At s=1/2 the separate Λ factors have poles, while the combined Laurent expression has coefficient √y log y. | No hidden totalized division used in a conclusion | None |

**Headline coverage and one-tactic probe.**

| README headline | Acceptance status and reason |
| --- | --- |
| General finite-type Nielsen core and bordered Gauss–Bonnet (§§0.3,0.5) | Named as not statable in module lines 10–11: ideal hull, bordered orbifold and signature carriers absent at the pins. A bare scalar B identity would not express these theorems. |
| Raw Ford domain, marked free product, full cusp subgroup (§1.3) | All three stated, with the actual generated subgroup and actual polygon. None follows by unfolding a definition or by one pinned library lemma: tiling, normal form or a cusp-stabilizer argument remains. |
| Infinite index (§1.6) | Stated. The index-zero library lemma converts the conclusion but does not establish infinite cosets; the infinite-area proof is substantial. |
| Primitive finite-arc partition and arithmetic-core comparison (§§2.1,2.2) | Named as not statable in lines 12–13; missing arithmetic period/axis-cycle and bordered-core carriers. No fabricated predicate substitutes for them. |
| Reflected double, conformal lift and class recovery (§§3.1,3.2,3.4) | Missing bordered conformal-orbifold/double carriers are identified in lines 14–16. Raw subgroup conjugacy classification is stated, including repeated lists; it needs the full cusp and maximal-height arguments, not one-tactic algebra. |
| Complementarity and exact family/genus covering (§§4.4,4.5) | Missing arithmetic surfaces, projections and associated area measures named in lines 17–18. An identity for arbitrary measures would be a stand-in. |
| Flux-only improper Stokes and completed endpoint (§§5.2,5.3) | Missing core-domain and oriented boundary-integral carriers named in lines 18–20. Scalar Laurent algebra is correctly left as a proof ingredient. |

The highest-lift normalization is a proof ingredient for the kept raw conjugacy headline, not an additional acceptance theorem. All three retained definitions are used by the five headlines. There are no admitted examples, small-value theorems, boundary-case theorems, tautological API lemmas or assumed-conclusion fields.

**Supplier resolution and ownership.** The following twelve distinct roadmap contracts were read at main or the specified open head. Paths are relative to the supplying repository; line numbers for the indexed AutomorphicSpectralTheory and AnalyticNumberTheoryPartI texts refer to their README content (excluding the tool's one-line display header).

| Supplier | Exact evidence and hypothesis comparison |
| --- | --- |
| FuchsianOrbifolds | TauCetiRoadmap/FuchsianOrbifolds/README.md:235–261, :263–308, :313–318 and :344–360: local polygon hypotheses, cusp data, cofinite area, topological genus and level-one quotient. The finite-covolume converse is not used on the infinite-area Ford polygon. |
| CongruenceSpectralGap | TauCetiRoadmap/CongruenceSpectralGap/README.md:144–166: effective-action quotient measure, domain independence and mass π/3 at level one. Package §4.1 keeps only its DIT representative comparison, point nullity and regular-locus connectedness. |
| AutomorphicSpectralTheory | TauCetiRoadmap/AutomorphicSpectralTheory/README.md:582–597 (§§0.27–0.28), :1158–1194 (§§1.14–1.15), :1817–1832 (§§2.17–2.18), :2668–2682 (§4.17a), :2685–2691 (§4.18), :2703–2711 (§4.20). Fourier factor 2√y, half-sum normalization, continued endpoint and uncompleted cusp inputs match. The primitive class invariant and parametrized reversal remain declared gaps. |
| AnalyticNumberTheoryPartI | TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:1035–1056, §2.1: core_signature, full core_boundary_period, and core_stokes under integrability and vanishing top flux. The package does not attribute a separate cusp-form theorem to it. Its s(1−s) parameter imposes no loss for complex eigenvalues; the new flux-only existence proof handles λ=0 separately. |
| IntegralLattices | TauCetiRoadmap/IntegralLattices/README.md:1032–1100, B2–B3: nonsquare discriminant, primitive forms, positive/negative leading-coefficient sign clause, narrow Picard group and composition. Read the main version rather than an open revision. |
| GlobalNumberFields | TauCetiRoadmap/GlobalNumberFields/README.md:565–598, Layer 11: invertible proper ideals and narrow Picard quotient; unrestricted maximal-order comparison only at the maximal order. The present package fixes fundamental discriminant, so the specialization is legitimate. |
| MultiquadraticPartII | TauCetiRoadmap/MultiquadraticPartII/README.md:580–600 and :621–641, §§2.3–2.4, including J_square_iff_sumTwoSquares; :737–757 and :909–929, §§3.1–3.2. The positive fundamental-discriminant, quadratic-presentation and prime-discriminant-factorization hypotheses are retained. J square is not confused with J=1. |
| ComplexCurveModuli | TauCetiRoadmap/ComplexCurveModuli/README.md:23–50, D0.1/D0.4, and :152, D6.2: compact oriented smooth classification, smooth conformal double, cusp uniformization and even reflection of the geodesic-cut Fermi metric. Cone-order orbifold extension remains local work here. |
| ConformalMapping | TauCetiRoadmap/ConformalMapping/README.md:107–122, L2/L4: disc automorphisms, Schwarz–Pick equality and analytic-arc reflection. Isolated-point removal is already Mathlib, as :14 says; R01 corrects that attribution. |
| AlgebraicTopology | TauCetiRoadmap/AlgebraicTopology/README.md:289–307 and :1573–1600, Stages 1 and 7: finite-cover presentation consequences and Hausdorff finite-CW Euler invariance/gluing. These do not by themselves supply finite-type Fuchsian ends; §0.3 owns that argument. |
| DifferentialGeometry | TauCetiRoadmap/DifferentialGeometry/README.md:503–545 and :708–740, §§5.3,5.5,5.6.3: compact-support C¹ Stokes, corners, and planar curve/top-form comparison with outward-first orientation. The compact truncation cutoff verifies support; real and imaginary parts reduce the complex form. |
| UniversalCovers | Completed/UniversalCovers/README.md:98–120, Stage 2: based lifting, exact fundamental-group range inclusion, and distinction from unbased conjugacy. The actual lift and deck-conjugation inputs are already pinned declarations. |

Object searches used `roadmaps grep` and `roadmaps show`, main and Completed, board packages, and all 108 README/Suggested files in the 54 specifically supplied sibling folders. Search terms included Nielsen regions/cores, convex cores, Ford polygons, conformal doubles, cusp flux, complementary surfaces, quotient measure and all five headline names. No duplicate fully qualified acceptance declaration was found. Relevant sibling matches were the already cited CongruenceSpectralGap measure and MultiquadraticPartII arithmetic interfaces. Existing-owner arithmetic surfaces, integrable Stokes and smooth doubles remain imported. This package owns the raw-list Ford/conjugacy extension, general second-kind bordered core, cone-orbifold double and the specified comparison/flux extensions. No ownership move or later supplier is required.

The two gap slugs match the plan's top-level gaps and the README verbatim. Both name AutomorphicSpectralTheory §4.17a. Under the standing real-quadratic hypotheses, the first is one period/class interface with its Pell and dictionary compatibility, and the second is the parametrized geometric reversal; neither requests a replacement genus quotient or another form/ideal dictionary. No additional supplier gap is needed for R01 because the input exists at the pin.

**Pinned declarations.** Both checked-out library revisions equal the manifest pins: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The named inputs were located and their relevant types/context read.

| Pinned location | Verified input and limiting hypothesis |
| --- | --- |
| Mathlib/Analysis/Complex/UpperHalfPlane/Measure.lean:38–48; Metric.lean:42,67 | Native positive-height subtype, invariant y⁻² density, distance and cosh formulas; no finite quotient volume assumed. |
| Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:825–830; Analysis/Complex/UpperHalfPlane/MoebiusAction.lean:471; NumberTheory/Modular.lean:370 | S,T integral determinant-one representatives; integral action height denominator; fdo has strict norm and real-part bounds. |
| Mathlib/Algebra/Group/Subgroup/Lattice.lean:329,355; GroupTheory/Coprod/Basic.lean:144; GroupTheory/CoprodI.lean:98,795–813,903; GroupTheory/Index.lean:561 | Generated subgroup, coproducts, all ping-pong hypotheses, natural index 0 iff infinite quotient. The ℤ factor supplies the ≥3-elements alternative even at ℓ=1. |
| Mathlib/Topology/Algebra/ConstMulAction.lean:599 | Finite stabilizer requires ProperlyDiscontinuousSMul; it is supplied for discrete projective subgroups. |
| Mathlib/MeasureTheory/Measure/Map.lean:165–172; Integral/Bochner/Basic.lean:1076 | Pushforward on measurable sets and integral transport with AEMeasurable/AEStronglyMeasurable hypotheses. The roadmap has continuous quotient maps and integrable test functions. |
| Mathlib/NumberTheory/LSeries/RiemannZeta.lean:84–110 | Pole subtraction, entire Λ₀ and residue 1. At 1+u, −1/(1+u)=−1+O(u), so c_Λ=Λ₀(1)−1. |
| Mathlib/MeasureTheory/Group/FundamentalDomain.lean:69–74,630 | A.e. coverage and pairwise a.e. disjointness, with null measurability. quotientMeasure_eq uses countability, invariant measure and measurable constant actions; it gives no mass formula. |
| Mathlib/Topology/Homotopy/Lifting.lean:499–505 | Based lift requires path-connected, locally path-connected source and actual induced-group range inclusion. |
| TauCeti/Analysis/Complex/UpperHalfPlane/PSL/Action.lean:132–160,184; LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup.lean:138 | Effective action, invariant area, representative compatibility and faithful integral embedding. |
| TauCeti/Topology/Compactification/OnePoint/ProjectiveLine.lean:189–196; Analysis/Complex/UpperHalfPlane/ProperAction.lean:58; Analysis/Complex/Fuchsian/ProperAction.lean:31–36; Stabilizer.lean:45 | Ideal-circle action, proper orbit map, inherited proper discontinuity and cyclic stabilizers for discrete subgroups. |
| TauCeti/Analysis/Complex/UpperHalfPlane/Geodesic.lean:87–106; Polygon/Convex/GaussBonnet.lean:215 | Complete unit-speed geodesics and convex polygon area with ideal vertices. |
| TauCeti/NumberTheory/Modular.lean:196,234; Analysis/Complex/UpperHalfPlane/Measure.lean:77–93 | fd=fdo a.e.; effective modular fundamental domain; planar-null transfer, null singletons and cusp-strip area (b−a)/A for A>0. |
| TauCeti/Analysis/Complex/Fuchsian/Covolume.lean:101–117,149; LevelOne/Basic.lean:73; MeasureTheory/Group/FundamentalDomain.lean:322–326 | Discrete-group fundamental domains, cofinite predicate, nested finite-index comparison and ENat-card covolume multiplication; ambient modular cofiniteness. |
| TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean:83,224; Finite.lean:38 | Native narrow group, square of any principal class is 1, and finiteness over a number field. |
| TauCeti/AlgebraicTopology/UniversalCover/Deck/Conjugation.lean:129 | Conjugation requires an over-base homeomorphism; the target is rebased along the doubled equivalence. |
| Mathlib/Analysis/Complex/RemovableSingularity.lean:100–103 | Bounded holomorphic deleted-neighborhood extension, the correction in R01. |

Object searches in both pins found no Nielsen-core, bordered-signature or class-indexed completed-Eisenstein/core-boundary carriers that would make the docstring's omitted headlines directly statable. Ordinary quotient, polygon, action and measure APIs are present and retained as imports.

**Locator audit.** All three manifest entries have unique keys and legal cached texts. Twenty-five target sections have literature-locator blocks; their textual statements and surrounding proofs were read. The following table records each section. The other three sections are explicitly local routes with supplier locators, not alleged passages of DIT16.

| Target | Text examined and scope comparison |
| --- | --- |
| §0.1 | DIT16 line 149; LU23 line 253 and line 262. Ideal accumulation and elementary cases; nowhere density is under the second-kind context. |
| §0.2 | DIT16 line 149 through line 174; SERIES05 line 1126 through line 1149. Closed hull and quotient distinguished; package uses the away-side convention. |
| §0.3 | LU23 line 215 through line 218, line 275 through line 280, line 366 through line 394; SERIES05 line 733 and line 1143. Finite generation/geometric finiteness; LU's torsion-free surgery is not imported without its hypothesis. |
| §0.4 | DIT16 line 157 through line 182. Signature cone multiplicity and s,t signs agree. |
| §0.5 | DIT16 line 174 through line 182, equation (2.8), p.953. Factor 2π agrees. |
| §0.6 | DIT16 line 164 through line 174. Package restricts the simple cone-free representative to funnel peripheral classes. |
| §1.1 | DIT16 line 246 through line 257, (3.1)–(3.2), p.954. Both generator conventions agree. |
| §1.2 | DIT16 line 277 through line 313 and line 333 through line 344. Figures are supplementary; algebraic side-pairing formulas were checked directly. |
| §1.3 | DIT16 line 323 through line 344, Theorem 1 and free product, p.957. Raw repeated lists are a locally proved extension, not attributed as an arithmetic primitive period. |
| §1.4 | DIT16 line 251 through line 257. Translation conjugacy; package computes the sign explicitly. |
| §1.5 | DIT16 line 349 through line 363, (3.4)–(3.6), pp.957–958. Weak inequality at digit 2 and word order agree. |
| §1.6 | DIT16 line 251 through line 257 and line 323 through line 344. Package proves second kind directly from free intervals and infinite index from area. |
| §2.1 | DIT16 line 354 through line 385. Package adds the missing finite-subarc endpoint argument. |
| §2.2 | DIT16 line 258 through line 259, line 323 through line 331, line 381 through line 386. Same hull/surface; height cutoff is a proved refinement rather than an alleged source height-one statement. |
| §2.3 | DIT16 line 394 through line 405. V formula agrees on x≥0; package does not identify selected-lift distance with coarse quotient distance. |
| §3.1 | Local route through ComplexCurveModuli D0.4/D6.2 and FuchsianOrbifolds polygon charts. No unsupported DIT attribution remains. |
| §3.2 | Local route through covering lifts and ConformalMapping L2/L4; the point-removal attribution is R01. |
| §3.3 | Local integral denominator proof using ModularGroup.im_smul_eq_div_normSq and §1.3; no source statement of that proof is claimed. |
| §3.4 | DIT16 line 332, with proof at line 387 through line 406. Arithmetic conclusion matches; package supplies a different normalization proof and a raw-list extension. |
| §4.1 | DIT16 line 195 through line 199. Half-open inequalities and modular mass agree. |
| §4.2 | DIT16 line 416 through line 448. The source's orbit-saturated area counts multiplicities; package formulates its Borel pushforward. |
| §4.3 | DIT16 line 407 through line 425, (4.1)–(4.3). Genus cosets and area-weighted normalization agree. |
| §4.4 | DIT16 line 439 through line 448. Complementary surfaces, opposite boundary orientation and reciprocal case. |
| §4.5 | DIT16 line 439 through line 448. Principal-genus/two-square criterion; wider involution-stable finite family follows by the displayed sum. |
| §4.6 | DIT16 line 260 through line 313. D28 example matches; D12 is explicitly an additional calculation, not claimed printed there. |
| §5.1 | DIT16 line 1038 through line 1051. Height truncation, side cancellation and top boundary. |
| §5.2 | DIT16 line 1025 through line 1055, Lemma 2, p.972. Package states a height-truncated limit and separately proves the harmonic case. |
| §5.3 | DIT16 line 514 through line 524, (5.3)–(5.5), p.962; line 1012 through line 1055, Lemmas 1–2. Regular completed endpoint is derived from the supplier expansion and Laurent cancellation. |

**Direction and policy checks.** The requested read-only dependency command completed with this exact output:

```text
depcheck: 55 roadmaps, 616 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Citation resolution reported no unknown roadmap citation or Lean name; its inability to inspect external Lean names was covered by the direct pin audit above. Its presence-only check does not catch R01's point/arc distinction. Local Needs lines separate raw-list and arithmetic inputs. The doubling scalar compatibility in §0.4 is elementary Euler bookkeeping; §3.1 owns the geometric double, so it need not be read as a reverse proof dependency.

The head is bb39ab9. The diff against origin/main changes eight files, all under packages/FuchsianOrbifoldsPartII; comparing the parsed plan objects shows only `gaps` changed. Neither target file was edited during this pass. No computational algorithm, pull-request number or process history occurs in the README or Lean docstrings. The 103-line acceptance file is below the size limit and all eight own declaration names occur in the README. No settled “not actionable in this package” finding was re-raised; the last repair report marks its findings applied.

## Not verifiable

- No new elaboration was run under the read-only/no-build instruction. The supplied eight elaborated signatures were inspected and compared; this pass does not independently certify elaboration or prove any admitted theorem.
- The two declared AutomorphicSpectralTheory gaps remain future supplier obligations. Their slugs, owner, section, precision and compatibility were checked; their eventual Lean implementation cannot be verified now.
- The cached text extracts identify the cited figures and their surrounding arguments, but the raster figures were not independently viewed. The relevant matrices, crossings, circles and heights were computed directly; figure artwork itself is not certified by this pass.
- Ownership against open work was checked in the 54 provided sibling folders and the indexed search results. Unprovided open pull-request checkouts were not separately obtained or audited. Main revisions of existing roadmaps, rather than open revisions of those roadmaps, are the contracts used here.
- All three directly cited works were available legally; there is no missing-reference request. No search for later published errata was performed. The following source issues concern the versions read, not claims about subsequent corrections.

## Source issues

- **Error** in DIT16 at §2, Nielsen-region paragraph, printed p.952 (DIT16 line 153): the source says the hull uses the half-plane above every complementary-interval geodesic; it should be the half-plane away from that complementary interval, including an interval containing infinity; affects a stated result.
- **Gap** in DIT16 at proof of Theorem 1, printed p.958 (DIT16 line 364): the source says endpoint ordering makes each finite cutting arc reach its next circle; it should be justified by control of the finite endpoint, including the final endpoint crossing; affects the proof.
- **Gap** in DIT16 at proof of Theorem 1, printed p.959 (DIT16 line 390): the source says the selected successive-lift distances are conformal invariants after ordering nearest boundary points; it should be justified by a compatible lift and identification of the selected lifts; affects the proof.
- **Misprint** in DIT16 at §5, Laplacian display, printed p.961 (DIT16 line 511): the source says the Euclidean second derivatives are multiplied by minus the inverse square of height; it should be minus the square of height, as in (7.10) on p.972; affects a stated result.
- **Misprint** in DIT16 at §5, equation (5.4), printed p.962 (DIT16 line 522): the source says the right side of the functional equation omits the spatial argument; it should be E*(z,s), with the same z as on the left; affects nothing.
- **Gap** in DIT16 at Lemma 2, final limit passage, printed p.972 (DIT16 line 1051): the source says vanishing flux permits passage to the area integral; it should be specify height truncation and justify its existence separately when s(1−s)=0; affects the proof.
- **Error** in LU23 at §3.1, Dirichlet-boundary paragraph, printed p.194 (LU23 line 223): the source says two domain points are congruent exactly when both lie on its boundary; it should be distinct congruent representatives lie on the boundary, without the converse for arbitrary boundary points; affects a stated result.
- **Misprint** in LU23 at §3.1, parabolic paragraph, printed p.194 (LU23 line 240): the source says parabolic elements are infinite-order elliptic elements; it should be parabolic elements have one ideal fixed point and are a different isometry type; affects nothing.
- **Misprint** in SERIES05 at Fuchsian paragraph after Proposition 4.60, printed p.33 (SERIES05 line 1143): the source says geometric finiteness is equivalent to finite area of the Nielsen region; it should be finite area of its quotient, or a fundamental region in that Nielsen region; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "bb39ab94e699ddaf1ef552cd0e0a58780c699b8c", "job": "RT-FuchsianOrbifoldsPartII~1a", "model": "gpt-6-astra", "worker": "chris-38"} -->
