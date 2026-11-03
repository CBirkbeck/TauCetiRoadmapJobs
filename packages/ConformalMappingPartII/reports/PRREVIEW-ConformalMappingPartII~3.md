# Review of ConformalMappingPartII (pull request #1407 at 62e73fb)

**Verdict:** needs changes

## R01 (P2) — Remove the redundant Little Picard gap

**Location:** `packages/ConformalMappingPartII/design/plan.json:2–8`; compare `TauCetiRoadmap/ConformalMappingPartII/README.md:259` and the supplier contracts at lines 39–129. The plan requests “an independent modular-uniformization proof”.

**Claim:** `gap:little-picard` remains a prerequisite requested from ModularForms Layer 10, although §1.1 supplies it independently, no target consumes the request, and the README has no matching gap contract.

**Witness:** Section 1.1 supplies a disc cover of ℂ∖{0,1}. An entire h omitting b≠c lifts through it after normalization (h−b)/(c−b). The bounded entire lift, and therefore h, is constant by Liouville.

**Exact repair:** Delete the obsolete gap entry, leaving `gaps: []`. Retain the ModularForms scope attribution at README line 25. Do not create an unused supplier contract to match the obsolete request.

This repair works for arbitrary b≠c: the denominator c−b is nonzero, the normalized function omits 0 and 1, and the lift has norm less than 1. The pinned `IsCoveringMap.existsUnique_continuousMap_lifts` (`Mathlib/Topology/Homotopy/Lifting.lean:477`) supplies the based continuous lift; inverse covering charts make it holomorphic; `Differentiable.exists_eq_const_of_bounded` (`Mathlib/Analysis/Complex/Liouville.lean:126`) makes it constant. As controls, h=2 omits 0,1 and has derivative 0; exp(z) has derivative 1 at zero but omits only one value and fails the premise.

Re-raised: FIX-RT-ConformalMappingPartII~1 F07. That repair disposition treated the absent supplier proof as something only ModularForms could supply. The independent metric-to-disc construction now in §1.1 removes the need for that input. The finding is the redundant request, not the absence of its implementation.

## Previous findings

The previous review read this same head; `changes.md` reports no changed lines. Its sole finding, R01, is **not repaired**: the plan still requests “an independent modular-uniformization proof”, while README §1.1 says “the twice-punctured-plane metric” supplies the disc model used to exclude the plane alternative. The finding remains R01 above.

The earlier findings recorded as repaired in that review remain repaired: `Suggested.lean:103–126` contains the finite-puncture headline, including “Subgroup.IsCofinite Γ” and the primitive-chart derivative condition; the ConformalMapping links resolve to the actual “Layers (each a discharge-gated milestone)” heading on main. This review rereads the entire roadmap rather than inheriting the previous incremental verdict.

## Verified sound

**Coverage and limits.** All 95 numbered targets, their definitions/APIs/Checks, layer dependencies, conventions, and all 26 Lean declarations were reviewed. The table below has 112 computed rows, covering all targets, all 14 Lean headlines, the sampled source targets, and R01. Algebraic checks were recomputed; decimal checks use ordinary floating-point Gamma/digamma and hypergeometric series, with an 8192-point midpoint circle sample for the N=2 theta cover. These are falsification checks, not interval certificates or proofs of the universal bounds. No further blocking mathematical defect was found.

**Principles and shape.** This extends the completed ConformalMapping roadmap's planar mapping/continuation work to analytic universal covers, explicit punctured-plane invariants and uniform value-distribution estimates. The abstract surface construction and disc-local characteristic are distinguished from existing planar and globally meromorphic APIs. The proof route retains arbitrary hyperbolic plane domains, finite-puncture comparison, and all N≥2; it does not substitute only large N for the final theorem. Definitions retain API bullets and at least three discriminating Checks; layers have Examples and Dependencies. There is no computational-algorithm deliverable, copied source passage identified, sorry-valued data, or `set_option`. No later supplier construction was moved into this package.

**Mechanical evidence.** HEAD is 62e73fbea5f43d549283fd898a59ecf000c27c7e. The worktree status and outside-folder diff are empty. The worker's head-specific gate passes every scanner, dependency check and targeted build (`build=0 OK`); there are no gate findings. Fresh direct `lake env lean` elaboration of `TauCetiRoadmap/ConformalMappingPartII/Suggested.lean` exits 0 with exactly 14 warnings, all `sorry`. No missing imported object remained.

A scratch copy with `#check @name` for **all 26 declarations** also elaborates. Every required binder remains, including the Hausdorff/second-countable surface assumptions, finite-cardinality guard, actual deck-group characterization, discreteness, covering and surjectivity conditions. The signatures and README agree; nothing was changed. Replacing each of the **14** admitted theorem bodies by `simp` yields **14 unsolved goals**, not a successful padding proof. Reading their definitions and the pinned APIs supplied no `rfl`, `infer_instance` or single-existing-lemma witness; those other tactics were assessed by reading, not claimed as executed tests.

The fresh dependency command reports exactly:

```text
depcheck: 204 roadmaps, 1641 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Every `*Needs:*` and supplier citation was read. In particular, the metric-to-disc route uses ComplexCurveModuli D0.4 and RiemannianGeometry R4.3/R4.7 without depending on the later symmetric polygon construction. The obsolete plan-only gap is separately addressed in R01.

**Headline coverage.** The 14 stated headlines are global initial values (§0.4); a noncompact simply connected surface coordinate and hyperbolic-domain disc covers (two §1.1 theorems); finite-puncture cusp comparison (§1.7); the roots inverse Schwarzian (§2.8); quotient representation (§3.7); inverse-ratio germ matching (§4.5); exact Gamma radius (§5.5); positive radius expansion (§5.8); half rotation (§6.7); the translated local first main theorem (§7.8); large-N maximum growth (§8.7); normalized logarithmic derivative (§9.4); and uniform mean growth (§9.19). The module docstring names the marked-polygon/presentation and continued-branch/uniform-cusp-asymptotic headlines whose carriers are missing. No statable headline was found omitted or replaced by an unrelated predicate. Its 12 auxiliary declarations have real bodies and serve these signatures.

**Source sample: 15 of 15 locators reopened.** The source version checked is the cached journal version for CDT; DLMF equation numbers are web locators without printed pages. The following distinguishes direct statements from proof steps and extensions this roadmap must prove.

| Target | Locator read | Result |
|---|---|---|
| 1.3 pointed conformal radius | CDT-journal line 2349 through 2385, Definition 5.1.1 / Theorem 5.1.4, p.668 | Normalization and derivative radius agree. The source's roots specialization is extended by based covering uniqueness; it does not itself state every domain variant. |
| 1.5 monotonicity | `Mathlib/Analysis/Complex/Schwarz.lean:261,291` | The pinned derivative Schwarz bound applies to the based lift; norm and scaling give the claimed inequality. |
| 2.8 rational Schwarzian | CDT-journal line 2420 through 2435, (5.1.8), p.669; line 2491 through 2550, pp.670–671 | Double-pole coefficient, numerator and denominator agree; omitted punctures and local inverse conditions are retained. |
| 4.8 uniform remainder | CDT-journal line 2876 through 2900, proof of Lemma 5.2.9, p.676; DLMF-15-8 line 516, (15.8.10), and DLMF-15-2 line 145, (15.2.2) | Corrected coefficient bound supports the value remainder. Parameter differentiation is an explicit additional target, justified by uniform coefficient-tail estimates; it is not asserted to be a separately printed theorem. |
| 5.1 explicit radius | CDT-journal line 2382 through 2395, Theorem 5.1.4, p.668 | Gamma formula and N≥2 agree. |
| 5.3 alternative expression | CDT-journal line 2669 through 2730, proof of Theorem 5.1.4, pp.672–673 | Reflection/duplication and positive Gamma arguments give the displayed alternative. |
| 6.2 primitive translation | CDT-journal line 2795 through 2828, §5.2, p.674 | Width 2cot(π/(2N)) and full stabilizer, rather than an arbitrary parabolic power, agree. |
| 7.2 local characteristic | CDT-journal line 3030 through 3051, §6.1, p.679 | Definition includes the centre pole term. It can be negative at small radii, which the roadmap permits. |
| 7.6 inversion | CDT-journal line 3064 through 3072, (6.1.3), p.680 | The Laurent leading coefficient and sign agree, including a pole at the centre. |
| 8.1 cusp asymptotic | CDT-journal line 2870 through 2900, Lemma 5.2.9, p.676 | Roadmap uses the corrected −2γ and k+1 conventions, not the printed errors listed below. |
| 8.3 transformed horoball | CDT-journal line 2939 through 2950, Lemma 5.2.15, p.677 | Diameter formula and tangent point agree with determinant one; the boundary tangency is excluded from the open horodisc. |
| 9.3 logarithmic mean | CDT-journal line 3154 through 3185, proof of Lemma 6.1.7, p.681 | The entropy step works for general nonnegative integrable H; the bound p log(1/p)≤1/e gives the stated constant. |
| 9.4 logarithmic derivative | CDT-journal line 3084 through 3098 and 3124 through 3185, Lemma 6.1.7, pp.680–681 | Normalization g(0)=1, nonvanishing, nested radii, kernel factors and normalized measure agree. Replacing strict inequality by ≤ is valid. |
| 9.16 pivot upper bound | CDT-journal line 3420 through 3438, (6.2.15), p.684; line 3236 through 3243, (6.2.7), p.682 | Holomorphic factors justify replacing characteristic by proximity and combining the two derivative estimates. |
| 9.18 finite completion | CDT-journal line 3017 through 3026, Theorem 6.0.1, p.679, and line 3443, p.684; Tsu52 line 610, Theorem 11, printed p.25 | Finite maximum is valid conditional on effective all-radius fixed-level bounds. The roadmap explicitly owns that strengthening in §9.11. Tsuji's scanned formula gives coefficient 1/(p−2) and O(1), not an explicit all-radius constant. |

Tsuji's displayed formula is absent from the extraction, so the cached scan at printed page 25 was inspected directly. Additional readings were TeschlODE line 6243, Theorem 4.7, p.130 (global analytic linear ODE continuation); Uniformization line 39, Theorem 1, p.2, line 152, Theorem 6, p.4, and line 213, Proposition 9, pp.5–6 (surface route, with the Green-domain restriction below); McMullenRS line 318, Theorem 2.9, p.9, and line 5348, §16, p.147 (reflection and hyperbolic normalization); DLMF-15-10 line 76, (15.10.1); DLMF-5-7 line 127, (5.7.3), and line 254, (5.7.6). DLMF's log-Gamma expression yields the roadmap's series after adding the elementary log(1+z) series on abs(z)<1. The quotient-representation proof at CDT-journal line 711 through 840 was also reread, including its phase and boundary-factor problems.

**Pinned-object audit.** These are actual pinned declarations/definitions opened or located and read in their surrounding API, not conclusions from the citation scanner. The scanner's two unresolved source-key headings, TeschlODE and McMullenRS, are not missing roadmap suppliers. Its host-side inability to check Lean names was superseded by local pin searches and the 26 elaborated signatures.

| Object | Declaration and pinned file/line | Scope checked |
|---|---|---|
| Lift and Liouville | `IsCoveringMap.existsUnique_continuousMap_lifts`, `Mathlib/Topology/Homotopy/Lifting.lean:477`; `Differentiable.exists_eq_const_of_bounded`, `Mathlib/Analysis/Complex/Liouville.lean:126` | Simply connected locally path-connected source, chosen base lift; entire bounded scalar map. |
| Schwarz inequality | `norm_deriv_le_one_of_mapsTo_ball`, `Mathlib/Analysis/Complex/Schwarz.lean:261`; equality case at 291 | Pointed derivative norm and the affine/rotation equality case; radius factors are not dropped. |
| Canonical decomposition | `Complex.CanonicalDecomp`, `Mathlib/Analysis/Complex/CanonicalDecomposition.lean:232`; existence at 314, boundary divisor at 390 | Meromorphic normal form, nonvanishing in the interior and codiscrete agreement; boundary zeros need smoothing. |
| Jensen | `MeromorphicOn.circleAverage_log_norm`, `Mathlib/Analysis/Complex/JensenFormula.lean:307` | Closed-disc meromorphy, nonzero radius; local leading coefficient and divisor contributions. |
| Divisor and removable germ | `MeromorphicOn.divisor`, `Mathlib/Analysis/Meromorphic/Divisor.lean:40,111,388,405,430`; `MeromorphicAt.analyticAt`, `Mathlib/Analysis/Meromorphic/Order.lean:333`, and extension criterion at 320 | Infinite order is totalized to zero in the divisor. Analyticity of the assigned function needs continuity, not merely a removable punctured germ. |
| Proximity/counting/characteristic | `ValueDistribution.proximity`, `Mathlib/Analysis/Complex/ValueDistribution/Proximity/Basic.lean:49,76,296`; `logCounting`, `LogCounting/Basic.lean:97,354`; `characteristic`, `CharacteristicFunction.lean:53,99` (same ValueDistribution directory) | Proximity and powers are reusable; native general nonnegativity is restricted to r≥1. The roadmap must own its local small-radius variant. |
| Global first main theorem | `characteristic_sub_characteristic_inv_of_ne_zero`, `Mathlib/Analysis/Complex/ValueDistribution/FirstMainTheorem.lean:65` | Assumes globally meromorphic f, so does not already discharge the disc-local headline. |
| Log integrability | `Mathlib/Analysis/SpecialFunctions/Integrability/Log.lean:122`; `PosLog.lean:65` in that directory | Meromorphy on the circle; isolated zeros are compatible with the totalized scalar logarithm. |
| Ordinary hypergeometric function | `ordinaryHypergeometric_eq_tsum`, `Mathlib/Analysis/SpecialFunctions/OrdinaryHypergeometric.lean:105`; values/termination at 116,149,154; convergence at 204 | Native series and terminating cases, with denominator-parameter restrictions; not the continued branch carrier. |
| Gamma/digamma | `Complex.digamma`, `Mathlib/Analysis/SpecialFunctions/Gamma/Digamma.lean:48,56,72,94`; `Real.Gamma_pos_of_pos`, `Gamma/Basic.lean:443`; reflection/duplication `Gamma/Beta.lean:490,596` | ψ(1)=−γ, recurrence and reflection pole guards, and positive real Gamma arguments. |
| Log-Gamma limit | `tendsto_log_gamma`, `Mathlib/Analysis/SpecialFunctions/Gamma/BohrMollerup.lean:293` | Positive-real pointwise limit; the locally uniform complex Taylor argument is still a roadmap target. |
| Poisson/Herglotz | `Mathlib/Analysis/Complex/Poisson.lean:252,301`; `TauCeti/Analysis/Complex/Herglotz.lean:123` | Normalized circle kernels and the imaginary constant term. Dropping the latter would lose the phase. |
| Universal-cover manifold | `TauCeti/Geometry/Manifold/Instances/UniversalCover.lean:64,68,72,102`; `TauCeti/AlgebraicTopology/UniversalCover/Covering.lean:58,183` | Native cover and lifted atlas; needed separation/countability are supplied explicitly through R4.3. |
| Cusp compactification | `Subgroup.CompactifiedQuotient`, `TauCeti/Analysis/Complex/Fuchsian/Compactification/Basic.lean:74`; atlas `Compactification/Manifold.lean:120,260` | Coarse quotient and cusp orbits are separate constructors; discreteness is present in the analytic atlas. |
| Primitive cusp charts | `Subgroup.CuspDatum`, `TauCeti/Analysis/Complex/Fuchsian/Cusp/Datum.lean:167`; `cuspRadius`, `cuspChart`, `Compactification/Cusp/Chart.lean:69,118,230` in that Fuchsian directory | Positive width and equality with the full stabilizer; radius exp(−2πA/w), inverse at zero is the cusp. |
| Cofiniteness and sphere chart | `Subgroup.IsCofinite`, `TauCeti/Analysis/Complex/Fuchsian/Covolume.lean:114`; `OnePoint.affineChart`, `invChart`, chart/manifold instances, `TauCeti/Geometry/Manifold/Instances/OnePoint.lean:68,121,214,218,230` | Actual finite covolume plus discreteness; preferred coordinate X at finite points and 1/X at infinity. |
| Root descent | `TauCeti/Analysis/Complex/RootsOfUnity/Descent.lean:67,92,144`; `Quotient.lean:147` in that directory | Positive level, descent identity and differentiability; descended map need not itself be unramified. |
| Shimizu and horodiscs | `TauCeti/Analysis/Complex/Fuchsian/Shimizu.lean:249,269,310`; `Cusp/Horodisc.lean:209,224` in that Fuchsian directory | Nonzero lower-left entry and separate full-stabilizer case; two-width and height forms. |

**Cross-roadmap suppliers and ownership.** All nine supplier roadmaps and the ModularForms attribution were resolved afresh on main. For existing roadmaps, a revising open pull request was not substituted for main. Completed ConformalMapping, completed UniversalCovers, and FuchsianOrbifolds also supplied the shape comparison.

| Supplier | Main location | Contract resolved |
|---|---|---|
| ConformalMapping | `Completed/ConformalMapping/README.md:102,111–132` | L1–L4: normal families, automorphisms/metric, planar maps, continuation/reflection. |
| UniversalCovers | `Completed/UniversalCovers/README.md:63,89,98` | Stages 0–2: cover carrier, deck action, based lifts. |
| DifferentialGeometry | `TauCetiRoadmap/DifferentialGeometry/README.md:357` | §2.3: lifted atlas and regularity. |
| FuchsianOrbifolds | `TauCetiRoadmap/FuchsianOrbifolds/README.md:193,235,263,286` | Layers 0,2,3,4: projective action, polygons, primitive cusps, generic compactification. |
| ClassicalArithmeticCompletion | `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:12529` | §6.20 radius on proper simply connected domains. Part II's wider pointed-cover radius has the explicit compatibility clause. |
| DiophantineApproximationAndTranscendence | `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:3004` | §5.1 scalar/system initial values on discs, not global continuation. |
| RiemannianGeometry | `TauCetiRoadmap/RiemannianGeometry/README.md:657,733` | R4.3 cover topology/completeness/curvature; R4.7 normalized disc and Killing–Hopf. |
| PDE | `TauCetiRoadmap/PDE/README.md:285` | Lane C 12–15 and barriers for boundary attainment. |
| ComplexCurveModuli | `TauCetiRoadmap/ComplexCurveModuli/README.md:50` | D0.4 complete conformal finite-area metric; not dependent on this disc-uniformization theorem. |
| ModularForms | `TauCetiRoadmap/ModularForms/README.md:1024` | Layer 10 scope attribution; the independent Picard request is redundant as explained in R01. |

Object searches used `roadmaps grep` over indexed main/open work, the board packages, and both pinned libraries, covering analytic uniformization, pointed radius, Schwarzian, hypergeometric continuation, cusp compactification, Blaschke products and local Nevanlinna quantities. The relevant open competitors were then read: `TauCetiRoadmap/FormalConnectionsOpers/README.md:1635–1668`, §5.1, owns the formal Aut(O) Schwarzian action on opers, not this analytic scalar covering theorem; its Suggested.lean was also read. `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:1690–1701`, PS8.10, treats a j-specific Schwarzian; `TauCetiRoadmap/ZerosOfLFunctions/README.md:899–917`, §4.6, treats global meromorphic counting. `TauCetiRoadmap/DiophantineApproximationAndTranscendencePartII/README.md:55,343` consumes this extension. None establishes a competing owner for these general analytic targets or the same fully qualified Lean declarations. Generic Fuchsian compactification, planar radius, local IVP and native special functions remain cited suppliers. This is an object search plus focused reading of matches, not a claim that every unrelated open roadmap was read in full.

**Adversarial table.** “Keep” records that the instance did not refute the stated claim; it is not a proof. Each numbered section has its own row; additional rows isolate surface and cusp construction clauses. Source conventions and nonexamples are included.

| Statement | Instances and computed values on each side | Result; change |
|---|---|---|
| Conventions: Cayley, derivative jet, Haar measure | C(0)=i, C(1/2)=3i and C⁻¹(3i)=1/2; jet of z² through order 2 is (0,0,2); mean of 1 is 1, not 2π. | Agree; keep. |
| 0.1 equation/companion/solution | y′+y=0: y=e⁻ᶻ gives −e⁻ᶻ+e⁻ᶻ=0, y=1 gives 1≠0. For y″=0, A(1,z)=(z,0) differs from (1,z)′=(0,1); correct vector (u+vz,v) gives both (v,0). n=0 fails 0<n. | Both positive and negative controls discriminate; keep. |
| 0.2 germ/jet equivalence | y″=0, x₀=0: jet(2+3z)=(2,3); inverse(2,3)=2+3z. For y‴=0, jet z²=(0,0,2), inverse returns z², not 2z². | Agree; keep. |
| 0.3 continuation | y′+y=0 continued once around a circle returns e⁻ᶻ, multiplier 1. For y′−y/(2z)=0 on ℂ∖{0}, continuation multiplies √z by −1, while still solving the same equation. | Continuation is not single-valuedness; keep. |
| 0.4 global initial values | y″=0, jet (2,3) at 0 gives y=2+3z and uniqueness difference has jet (0,0), hence zero. The √z example has monodromy −1 and is excluded by simple connectivity. | Agree; keep. |
| 0.5 meromorphic basis | zy′+y=0 has basis 1/z, order −1, monodromy 1. z²y′+y=0 has e^(1/z), also monodromy 1 but infinitely many negative Laurent powers. | Stronger basis condition is essential; keep. |
| 0.6 pole clearing | At α=0, p=z² and basis 1/z³: q(t)=t² gives q(p)/z³=z. q(t)=t gives 1/z and fails. For α=√2, q(t)=(t²−2)² clears a double pole and also vanishes at −√2. | Orders 4−3=1 and 2−3=−1; keep. |
| 1.1 noncompact coordinate | M=𝔻 and M=ℂ admit id with derivative 1 and inverse derivative 1. Sphere fails noncompactness; constant map has derivative 0 and cannot be a biholomorphism. | Sound cases; keep. |
| 1.1 surface Perron | Family of constants ≤3 has envelope 3, Laplacian 0, and is stable under replacement/maxima. Singleton {Re z²} has harmonic replacement itself, envelope Re z² with Δ=0. | Agree; keep. |
| 1.1 Dirichlet | Unit-circle data Re z extend to Re z, boundary error 0. Annulus 1≤abs(z)≤2 has u=log abs(z)/log2 with boundary values 0,1 and Δu=0. Zero extension fails outer value 1. | Agreement; keep. |
| 1.1 Green pole | Radius 2, pole 0: G=log(2/abs(z)); at abs(z)=1, G=log2; at abs(z)=2, G=0; G+log abs(z)=log2. Opposite sign is negative inside. | Sign and regular part agree; keep. |
| 1.1 bordered embedding | Radius-R closed disc has interior map z/R to 𝔻; derivative 1/R and inverse derivative R have product 1. A constant map has product 0 and is excluded. | Keep. |
| 1.1 exhaustion | Closed discs of radii 1−1/n, n≥2, have nested interiors, union 𝔻 and one boundary circle each. Radii 1/n instead have union the radius-1/2 disc and fail exhaustion. | Keep. |
| 1.1 normalized limit | On ℂ, rescaling radius-n maps z/n to derivative 1 gives id, image ℂ and derivative 1 in the limit. Without normalization z/n tends to 0 with derivative 0. | Normalization excludes constant limit; keep. |
| 1.1 metric adapter/isometry comparison | Standard disc squared metric at 0 is 4; conjugation has real determinant −1, id determinant +1. Cylindrical ℂ∖{0} metric has K=0, not −1. Three-punctured quotient area 2π, universal-disc area ∞. | Hypotheses distinguish wrong models; keep. |
| 1.1 two omitted values/existence | h(z)=2 omitting 0,1 has constant affine lift and derivative 0. exp z has h′(0)=1 and omits only 0, so misses the second omitted-value premise. The disc identity yields a cover with derivative 1. | General lifting route works; remove redundant gap, current R01. |
| 1.2 cover uniqueness/lifts | F=z,G=iz gives unique rotation i, derivative norms 1=1. F=2z, f=z lifts to z/2; derivative norms 2 and 1. z² has derivative 0 at 0 and is not a cover. | Surjectivity/local-cover conditions discriminate; keep. |
| 1.3 radius | Disc at 0: singleton derivative-norm set {1}, sInf=1. Radius-2 disc: {2}, sInf=2, reciprocal domain-to-disc derivative 1/(1/2)=2. Affine dilation 3 changes 2 to 6. | Normalization and covariance agree; keep. |
| 1.4 extremality | Cover F=2z into radius-2 disc; φ=z gives 1<2, lift derivative 1/2. φ=2iz gives 2=2, lift iz a rotation; constant φ=0 gives 0<2. | Both equality directions discriminate; keep. |
| 1.5 monotonicity | 𝔻⊂2𝔻 gives radii 1≤2; identity inclusion gives 1=1. Reversing the inequality fails 1≤2. | Agree; keep. |
| 1.6 projective deck realization | Disc identity has trivial deck group. Annulus cover strip→annulus by exp has translations 2πik: exp(z+2πi)=exp z, derivative multiplier 1, no fixed interior point for k≠0. | Generality includes noncofinite annuli; keep. |
| 1.7 finite-puncture comparison / Lean headline | S={0,1,∞}: three cusp images and area 2π; four punctures give four cusp images and area 4π. Equality of the cusp image with S and injectivity of e give both directions of the bijection. | Guards match the native-carrier theorem; keep. |
| 1.8 oriented roots cover | N=2 target excludes ±1 but contains 0; derivative a=γ₂≈4.37687923. F(iz) has derivative ia, real part 0 and imaginary part a, so fails orientation. | Keep. |
| 1.9 derivative nonvanishing | F₂′(0)=γ₂≈4.37687923≠0; candidate z² has derivative 0 at 0 and violates the covering premise. | Keep. |
| 1.10 equivariance | F₂(−0.1)=−0.417567904=−F₂(0.1). At N=3, r̃(2i)=(3√3+8i)/13; inverse Cayley gives −1/6−i√3/6=ζ₃⁻¹/3. | Correct inverse rotation; keep. |
| 1.11 descent | F=az+O(z^(N+1)) gives F(z)^N=a^N z^N+O(z^(2N)), so G(w)=a^Nw+O(w²). At nonzero F-zero, source power derivative Nz^(N−1)≠0 and descended zero order N. | G has derivative 0 there, not a cover; keep. |
| 1.12 descended derivative | N=2, a≈4.37687923: G′(0)=a²≈19.15707180; exactly norm G′(0)=a²=norm(F′(0))². Rotating a by i changes G′ to −a² but not its norm. | Phase distinction agrees; keep. |
| 2.1 Schwarzian definition | S(2z+1)=0; S(z²)(1)=−3/2; S(1/z)(1)=6−(3/2)·4=0. At a critical point totalized formula can be 0, with no geometric claim. | Keep. |
| 2.2 chain rule | f=g=z² at z=1: S(z⁴)=−15/2; RHS (−3/2)·2²−3/2=−15/2. | Squared derivative essential; keep. |
| 2.3 Möbius invariance | M(w)=1/w, f=z², z=1: S(z⁻²)=−3/2=S(z²); determinant −1 and denominator 1 are nonzero. Constant M has determinant 0. | Guards discriminate; keep. |
| 2.4 Schwarzian ODE | w=eᶻ: S=−1/2; v₁=e^(z/2),v₂=e^(−z/2), so v″−v/4=0 and v₁/v₂=eᶻ. Q=−1/4 gives 2Q=−1/2. | Sign/factor agree; keep. |
| 2.5 accessory formula | N=2 companion S={0,−1,1}, X=2: double-pole sum 49/72; simple-pole sum −1/2; total 13/72. Rational formula (1+3X²)/(2X²(X²−1)²)=13/72. | Keep. |
| 2.6 infinity constraints | Same S: m₀=0,m₋=3/4,m₊=−3/4. Sums are 0; 1−1/2−1/2=0; (−1+3/4)+(1−3/4)=0. | X⁻¹, X⁻², X⁻³ cancel; keep. |
| 2.7 symmetric parameters | N=2 coefficient −(1/2+1/4)=−3/4; m₋=3/4,m₊=−3/4. N=3 gives c=−2/3 and 1+3(2c+1)=0. | Keep. |
| 2.8 roots Schwarzian | N=2,x=0 gives 3/2. J₂=z+z³/4+… gives J₂‴/J₂′=3/2. N=3,x=0 gives 0 on both sides. x=1 is excluded. | Keep. |
| 2.9 inverse ODE | N=2,x=0 gives 4y″+3y=0. η₂=1−3x²/8+… gives −3+3=0; η₁=x−x³/8+… yields quotient x+x³/4+…. | Keep. |
| 3.1 boundary Blaschke factor | b₀(z)=z; b₁(1)=−1, whereas raw rational division gives 0; b₋₁(z)=1. At a=1/2,z=−1, b=−1 and norm 1. | Boundary extension discriminates; keep. |
| 3.2 finite product | Empty product 1; (a=0,m=2) gives z², at z=1/2 norm 1/4; boundary-only (a=1,m=1) gives −1, norm 1, not <1. | Keep. |
| 3.3 normalized log | g=eᶻ,R=1: L=z, L(0)=0; boundary log modulus cosθ. Kernel Fourier integral is z, at z=1/2 equals 1/2. g=1 gives both 0. | Keep. |
| 3.4 derivative Herglotz | g=eᶻ gives g′/g=1; differentiated boundary integral also 1. g=2eᶻ has same derivative ratio; constant log2 contributes integral derivative 0. | Keep. |
| 3.5 phase | G=i: integral 0, exponential 1; G·abs(G(0))/G(0)=1. Multiplication by phase i reconstructs i. G=2i gives exponential 2 and phase i. | Keep. |
| 3.6 smoothing | g=z−1: b₁=−1 gives residual 1−z with boundary zero at 1. On radius 1+δ the zero is interior and no longer lies on the integration circle. g=0 permits h=1 and both totalized logs 0. | Boundary-zero and zero-function cases distinguished; keep. |
| 3.7 quotient representation | g=1,h=1 gives logarithms 0, RHS ε>0. g=2,h=1 gives max(0,log2)=log2≤log2+ε. g=0,h=1 gives 0≤ε. | No contradiction from totalized log; keep. |
| 3.8 optimality | g=2,h=1 gives equality log2=log2; g=h=1 gives 0=0. If h=0 were allowed, bound would fail for g=2; h(0)=1 excludes it. | Keep. |
| 4.1 Gauss equation | a=0,b=c=1: y=1, residual 0. a=−1,b=c=1: y=1−x, residual −(1−x)+(1−x)=0, also at x=2. c=0 excludes the ab/c pole. | Keep. |
| 4.2 variable change | N=2,x=0 indicial expression is ρ(ρ−1)+(1/2)ρ=ρ(ρ−1/2); exponents 0,1/2 become 0,1 under x=u². | Derivative factors agree; keep. |
| 4.3 two solutions | N=2: √(1−x)F(1/4,1/4;1/2;x)=1−3x/8+…; the other is x^(1/2)(1−x/8+…). Substituting x=u² gives η₂,η₁ above. | Keep. |
| 4.4 inverse ratio | N=2: numerator coefficient 3/8, denominator 1/8; J₂=u+u³/4+…, J₂(0)=0,J₂′(0)=1,J₂‴(0)=3/2. Identity germ has third derivative 0. | Keep. |
| 4.5 actual inverse | Let a=γ₂. F₂(z)=az−a³z³/4+…; ψ(u)=a⁻¹(u+u³/4+…). Both compositions have linear coefficient 1 and cubic coefficient 0. | Prefactor and both directions agree; keep. |
| 4.6 continuation | a=1/2: k=0 term is −log x+4log2 because ψ(1)=−γ and ψ(1/2)=−γ−2log2. At x=.01 this term is 7.377759; adding the normalized tail .013515818 gives 7.391275; multiply by Γ(1)/Γ(1/2)²=1/π for ordinary F. | Sign and Gamma normalization agree; keep. |
| 4.7 coefficient bound | a=1/2,k=1 gives 2log2−1≈0.386294361; k=2 gives ≈0.219627694; common bound at a=1/4,k=1 is ≈0.650237868. Wrong ψ(k) index gives −0.613705639 at k=1,a=1/2. | Positive/index controls agree; keep. |
| 4.8 uniform remainder | x=.01, a=.25,.5,.75: normalized tails .003704052,.013515818,.028085352; finite-difference parameter derivatives .028153925,.049471020,.066500353. Common scale x(1+abs(log x))=.056051702. | Finite samples consistent with a common bound; not a proof of uniformity; keep. |
| 5.1 Gamma radius | N=2,3,10 give 4.37687923045,2.58105653984,1.32030638266; alternative expressions give the same. Native N=1 has Γ(0)=0, hence radius expression 0. | Domain restriction discriminates; keep. |
| 5.2 positivity | At N=2 denominator Γ(3/4)²Γ(3/2)>0; all arguments lie in [1/2,3/2]. N=1 numerator includes Γ(0)=0. | Positive versus excluded zero; keep. |
| 5.3 alternative expression | N=2: both 4.37687923045; N=3: both 2.58105653984. Positive denominators permit reflection/duplication cancellations. | Keep. |
| 5.4 inverse-ratio boundary | N=2 leading logarithmic coefficient ratio is Γ(3/2)Γ(1/4)²/(Γ(1/2)Γ(3/4)²)=4.37687923045; division by γ₂ gives boundary modulus 1. | Keep. |
| 5.5 geometric radius | Theta formula has F₂′(0)=Γ(1/4)⁴/(4π²)≈4.37687923045, matching γ₂. Rotated cover derivative ia has the same norm a. | Keep. |
| 5.6 log Gamma | z=0 gives 0=0. Coefficients through z³ are −γ, ζ(2)/2, −ζ(3)/3; expansion of DLMF's −log(1+z)+z(1−γ) gives exactly these. | Sign and branch agree; keep. |
| 5.7 odd-zeta series | Expanding log-Gamma in log γ_N−(log16)/N cancels the linear residual and every even power. First coefficients are ζ(3)/(2N³), 3ζ(5)/(8N⁵); at N=2 the logarithmic residual is 1.476335966−1.386294361=.090041605>0. | Cancellation and positive coefficients agree; keep. |
| 5.8 positive expansion | N=2,3,10: E=.006939754,.000432456,2.115999e−7; N⁶E=.444144258,.315260758,.211599896, positive. The new exponential coefficient is ζ(3)²/8>0. | Sign/order controls; no universal C certified numerically; keep. |
| 6.1 ideal polygon | N=2 has four ideal vertices 1,i,−1,−i, area (4−2)π=2π. N=3 has six, area 4π. Trivial group cannot supply these finite-area Dirichlet domains. | Keep. |
| 6.2 primitive cusp | N=2 gives h=2cot(π/4)=2; N=3 gives h=2√3. Replacing translation 2 by 4 gives subgroup 4ℤ strictly inside full 2ℤ. | Full-stabilizer law discriminates; keep. |
| 6.3 free deck presentation | N=2: t=[[1,2],[0,1]], u=rtr⁻¹=[[1,0],[−2,1]]. tu=[[-3,2],[-2,1]], ut=[[1,2],[-2,-3]], different projectively. Rank 2 is not cyclic; r fixes i and is excluded from deck group. | Nonabelian control; keep. |
| 6.4 power stabilizer | N=2 quotient generated by r has r²=1 projectively and order 2; area ratio 2π/π=2. For N=3 ratio 4π/(4π/3)=3. | Index/action agree; keep. |
| 6.5 full invariance | F₂(−z)²=F₂(z)². Half rotation gives at z=.1: F₂(z)²≈.174362953, F₂(iz)²≈−.211185962, unequal, so it lies outside Φ₂. | Larger supergroup is excluded; keep. |
| 6.6 quadrilateral | N=2 area 2π−2π/2=π; N=3 area 4π/3. Under C, exp(±πi/2) map to ∓1 and 0 maps to i. | Signs are unordered vertex orientation only; keep. |
| 6.7 half rotation | N=2,z=.1: 1−F₂(iz)²≈1.21118596231 and (1−F₂(z)²)⁻¹≈1.21118596231. At z=0 both 1. | Nontrivial and basepoint cases agree; keep. |
| 6.8 supergroup triangle | N=2 angle π/2 gives area π/2, quadrilateral/triangle area ratio 2; N=3 angle π/3 gives 2π/3. s²=r and s has projective order 2N. Reflection reverses orientation. | Keep. |
| 7.1 pole count | r=1/2: f=1/z gives N_D=log(1/2)=−log2; f=1 or 0 gives 0. Pole at a=1/2 has weight log(r/abs a)=0. | Centre term and boundary exclusion correct; keep. |
| 7.2 characteristic | r=1/2: f=1/z has m=log2,N=−log2,T=0; f=1/(4z) has m=0,N=−log2,T=−log2. Constants 0,1,2 give 0,0,log2. | No false general nonnegativity; keep. |
| 7.3 regular-centre positivity | f=1/(z−1/4), r=1/2 gives N=log2≥0. f=1/z gives −log2 and violates the regular-centre premise. | Keep. |
| 7.4 vanishing criterion | Pole at 1/2, r=1/2: N=0 and no interior pole. Pole at 1/4: N=log2>0. Assigned f(0)=2,f(z)=1 otherwise: N=0, order 0, punctured limit 1≠2. | Both directions and continuity guard checked; keep. |
| 7.5 Jensen | f=2z,r=1/4: mean logabs=log(1/2)=−log2. RHS zero-count log(1/4)+log2=−log2. f=1/z gives mean −log r=0−log r+log1. | Signs/centre coefficient agree; keep. |
| 7.6 inversion | f=1/(4z),r=1/2: T(f)=−log2, T(1/f)=log2; difference −log4=logabs(1/4). | Regular centre is unnecessary; keep. |
| 7.7 translation | Constants f=0,a=2: abs(m(f−a)−m(f))=log2≤log2+log2. f=a=0 gives 0≤log2. | Totalized zero poses no problem; keep. |
| 7.8 translated main theorem | f=2,a=1: T(f)=log2,T(1/(f−a))=0,logabs c=0; absolute residual log2 equals RHS log2. f=a has infinite order and is excluded. | Sharp simple case and exclusion agree; keep. |
| 7.9 powers | f=2 constant,n=3 gives log8=3log2. n=0 gives T(1)=0=0·T(f). For f=1/(4z),r=1/2,n=2 gives −2log2 on both sides. | Keep. |
| 7.10 radial monotonicity | h=2z: m(1/4,h)=0,m(3/4,h)=log(3/2)>0; h=2 constant gives equality log2. | Keep. |
| 8.1 cusp asymptotic | N=2,x=e⁻²: normalized ratio .3205160833, principal term .3016725678; N·error/x≈.27847. N=10,x=e⁻¹⁰: .9252469816 versus .9252429071; scaled error≈.89747. | Correct −2γ sign; finite samples consistent; keep. |
| 8.2 small cusp height | N=10,x=e⁻¹⁰ inverse ratio z≈.9252469816 gives Im C(z)≈25.75477; N²/π²≈10.13212 for ε=1/2,M=1. No numerical N₀ is inferred from this one case. | Height scale/sign consistent; keep. |
| 8.3 horoball diameter | g=id,D=1 gives E=1, centre 1/2. g=diag(2,1/2),D=1 gives E=2/5, centre 4/5. g sends height≥1 to height≥4, whose inverse-Cayley bottom is 3/5. | Endpoints/centre agree; keep. |
| 8.4 Shimizu | N=2,h=2: id has h(abs a+abs c)=2; r=[[0,−1],[1,0]] also gives 2. Replacing a lift by its negative changes neither value. c=0 requires its separate case. | Keep. |
| 8.5 exceptional set | N=2,M=1: at 0, abs(F²−1)=1>e⁻². Pick F=t with t²=1−e⁻²/2: residual e⁻²/2<e⁻². Pick F=4: residual 15>e⁻², rotated preimage residual 1/15<e⁻². | Positive/negative/rotated membership all discriminate; keep. |
| 8.6 horoball exclusion | h_N≤4N/π gives 4h_N²/D≤64/M. N=100,r=1/2,M=200 gives ≤.32<.5=1−r, once the independent height threshold is also met. | Explicit geometric A=64 works; keep. |
| 8.7 maximum growth | Theta cover N=2,r=.5 has sampled max logabs≈2.63133 and N/(1−r)=4; ratio≈.657833. The theorem only promises sufficiently large N, so this is a scale control, not evidence N₀=2. | No threshold overclaim; keep. |
| 9.1 kernel mean | R=1,r=1/2,w=1: Fourier expansion constant term is 1/(1−1/4)=4/3. R=2,r=1 gives 1/3, respecting inverse-square scaling. | Keep. |
| 9.2 log L1 | g=eᶻ,R=1: mean abs(cosθ)=2/π; m=1/π, twice m=2/π. g=1 gives both 0. | Keep. |
| 9.3 log mean | H=e on Haar-measure 1/e and 0 elsewhere: mean H=1, mean log⁺H=1/e, RHS=1/e. H=0 gives 0≤1/e. | Constant 1/e attained; keep. |
| 9.4 log derivative | g=eᶻ,R=1,r=1/2: m(g′/g)=0; RHS log(4/π)+log2+1/e≈1.30259110. g=1 gives 0≤log2+1/e. | Guards/nonzero function correct; keep. |
| 9.5 small radii | r=.1 gives ρ=.25,R=.55,R−ρ=.30≥.225. r=.75 gives ρ=.75,R=.875,difference .125≥.0625. Wrong R=(1−r)/2=.125<r. | Keep. |
| 9.6 omitted-value derivative | F=az+… gives f(0)=1, f′/f=−Na^N z^(N−1)+…; N=2 gives −2a²z+…, with no centre pole. | Sign/holomorphy agree; keep. |
| 9.7 pivot definition | N=2,x=0: p=0,u=−1,1+u=0. x=2: p=4/3,u=1/3. At x=1, totalized p=0,1+u=1, so the omitted-root guard is essential. | Keep. |
| 9.8 partial fractions | N=2,x=2: (2/2)(1+1/3)=4/3=p₂(2). x=0 gives 0·(−1+1)=0. Removing 1/N would give 8/3 at x=2. | Keep. |
| 9.9 chain identity | Near 0: F/(NF′)=z/N+… and f′/f=−Na^N z^(N−1)+…; product −a^N z^N matches pivot leading term. At 0 both exactly 0. | Keep. |
| 9.10 lower bound | N=2,r=.25: T(pF)≈.283883177 versus 2T(F)−log4≈−1.102411184. At r=.5: 1.566660996≥.180366635. | Power and lower-bound constants agree; keep. |
| 9.11 fixed-level bound | N=2,r=.25,.5: T(F²)≈.283883177,1.566660996; log(2/(1−r))≈.980829253,1.386294361. Tsuji p=3 gives coefficient 1 in T(F), hence 2 after squaring. | Samples respect scale; effective all-radius C₂ remains a proof target; keep. |
| 9.12 three estimates | N=2,r=.25: T(F²),T(pF),T(uF)≈.283883177,.283883177,.380360200, largest difference .096477023<log4. At r=.5: 1.566660996,1.566660996,1.477009881, largest difference .089651115<log4. | All three pairs agree with bound; keep. |
| 9.13 omitted value one | g=1−F: g(0)=1; F′/(1−F)=a+O(z), with a≈4.37687923 at N=2. The sign change from g′/g is −1 and norm unchanged. | Keep. |
| 9.14 logarithmic-derivative divisor | At any simple zero, F=a(z−z₀)+…, F′/F=(z−z₀)⁻¹+…, 1/F=a⁻¹(z−z₀)⁻¹+…; both pole orders 1. F/F′ has zero order 1. | Multiplicity, not residue, matters; keep. |
| 9.15 reciprocal derivative bound | At 0, F/F′=z+O(z^(N+1)), so centre pole count 0; F′/F has trailing coefficient 1 and inversion centre term log1=0. | No erroneous log a centre term; keep. |
| 9.16 upper bound | N=2,r=.5: T(pF)−T(F)≈.783330498; log(2/(1−r))≈1.386294361 and L₂(r)≥0, so C=1 suffices for this instance. At 0, (F/(2F′))(f′/f) has leading term (z/2)(−2a²z)=−a²z², exactly the pivot. | Both numeric inequality and product regularity agree; not a universal C; keep. |
| 9.17 large-level absorption | Lower minus upper gives (N−1)T(F)≤error+log4. N=2 gives factor N/(N−1)=2; N=10 gives 10/9; neither can be replaced by an unguarded N=1 expression. | Keep. |
| 9.18 finite completion | Test N₀=4,C=5,C₂=7,C₃=3 gives C*=max(5,7,3)=7, bounding each entry. N₀=2 has empty small-level list, giving C*=C. | No maximum of an empty list needed; keep. |
| 9.19 uniform mean | N=2,r=.25: means .283883177,.283883177,.380360200 versus logratio .980829253; r=.5: 1.566660996,1.566660996,1.477009881 versus 1.386294361. C=2 covers these samples. A source rotation changes the integration variable and leaves each mean equal. | Quantifier keeps C independent of N,r,F; keep. |
| cusp-datum contract, README 73 | Width w=2, generator τ↦τ+2: generated translations are 2ℤ. Its square generates 4ℤ, missing translation 2. Thus equality with the full stabilizer holds only for the first choice. | native field excludes the nonprimitive model. |
| cusp-chart domain contract, README 73/334 | w=A=2 gives q-disc radius exp(−2π)≈0.001867442732>0; q(2i)=exp(−2π) is on the boundary and excluded, while q(3i)=exp(−3π)≈0.000080699518 lies inside. The inverse at 0 is the cusp. | A≥w and the open target protect the germ from junk values. |
| finite-puncture coordinate clause and Check | p=3, X(q)=3+2q+3q²: u(0)=3, u′(0)=2. At q=.001, u=3.002003; the Taylor expression gives 3.002003. Its inverse germ has derivative 1/2, product 1. | the affine chart is not centred, but differentiation and the stated expansion agree. |
| infinity-coordinate clause and Check | Let X(q)=1/(2q+3q²) for q≠0, X(0)=∞. The native infinity chart gives u=2q+3q², u(0)=0, u′(0)=2; at q=.001, u=.002003. The affine chart instead has a pole and cannot give an analytic germ. | reciprocal normalization is necessary and correctly used. |
| all-primitive-charts quantifier | For width w=2, replacing σ by σ+1 gives q′=−q. Then X=p+2q+3q² becomes p−2q′+3q′²: first coefficient −2≠0. By contrast q=q₂² gives X−p=2q₂²+3q₂⁴, derivative 0 and order 2. | native scaling changes preserve nonzero coefficients; a proper-power generator fails the full-stabilizer field. |
| actual-deck-group and surjectivity hypotheses | For the three-punctured model, deck matrices t=[[1,2],[0,1]], u=[[1,0],[−2,1]] give tu=[[-3,2],[-2,1]], ut=[[1,2],[-2,-3]], distinct projectively. Γ=1 misses these deck elements. Constant f=2 has fibre over 3 empty and fails surjectivity. | arbitrary or trivial Γ and constant maps are excluded. |
| finite-cardinality guard; dependent Schwarzian | Cardinalities 0,1,2 fail 3≤card S. For a primitive inverse τ=α log(X−p), α≠0, τ‴/τ′=2/(X−p)² and (3/2)(τ″/τ′)²=3/(2(X−p)²); difference 1/(2(X−p)²). | excluded degeneracies and the dependent §2.5 coefficient agree. |
| 1.1 completeness and curvature guards | Scaling the standard metric tensor by 2 changes K=−1 to −1/2. Pullback by z↦z/2 has radial length to the unit boundary log3<∞, hence is incomplete; the standard radial length diverges. | Curvature and completeness exclude two plausible wrong models; keep. |

## Not verifiable

- **Hem88**, Theorem 3.1 and Lemma 3.3, pp.97–115, remains settled as waived. Its primary text is not in the supplied cache and was not requested again. CDT-journal line 2491 supports the accessory-parameter specialization, not independent certification of Hempel's full finite-puncture locator.
- **KR16**, §1, remains settled as uncertified/paywalled. Its locator is retained; no new request was made. Tsu52 was readable, but its asymptotic theorem alone does not certify the effective all-radius strengthening explicitly assigned to §9.11.
- The uniform quantitative constants and convergence estimates remain mathematical proof targets. Numerical sampling does not certify them; neither the passing admitted build nor the table is represented as such a proof.

All nine supplied readable source texts relevant to this audit were used. No additional unread source was needed, no manifest was edited, and no missing-reference request was created.

## Source issues

The following issues were checked against the source text this round. They are source errata, not additional findings against the roadmap, which has corrected or restricted the affected uses.

- **Misprint** in CDT-journal at Lemma 5.1.2, equation (5.1.3), p.668 (line 2358): the source says its displayed matrix induces multiplication by ζ_N; it should be the inverse rotation under the standard left action; affects a stated result.
- **Error** in CDT-journal at Lemma 5.1.20, equation (5.1.21), p.672 (line 2654): the source says to exclude only nonpositive integral a; it should also exclude denominator poles of 2a and x=0, or state a meromorphic parameter identity; affects a stated result.
- **Misprint** in CDT-journal at Lemma 5.2.9, equation (5.2.10), p.676 (line 2873): the source says to use +2γ in the logarithmic constants; it should use −2γ because ψ(1)=−γ; affects a stated result.
- **Error** in CDT-journal at proof of Lemma 5.2.9, p.676 (lines 2891–2892): the source says to maximize abs(ψ(k)−ψ(k+a)) at a=1/4; it should bound ψ(k+1)−ψ(k+a), whose maximum is ψ(2)−ψ(5/4); affects the proof.
- **Gap** in CDT-journal at proof of Lemma 5.2.18, p.678 (lines 2969–2979): the source says its matrix estimate for Γ_N but uses every Φ_N translate; it should establish the estimate for the full power stabilizer Φ_N; affects the proof.
- **Error** in CDT-journal at proof of Lemma 5.2.18, p.678 (lines 2980–2981): the source says to put large covering values inside S(M,N); it should put them inside its half-rotated translate sS(M,N); affects the proof.
- **Error** in CDT-journal at proof of Lemma 2.3.1, p.640 (lines 742–750): the source says every listed finite Blaschke product is open-disc valued; it should allow boundary-only or empty products of constant modulus one; affects the proof.
- **Error** in CDT-journal at equation (2.3.2), pp.640–641 (lines 758–793): the source says to reconstruct complex G using only its boundary modulus; it should multiply by G(0)/abs(G(0)); affects the proof.
- **Misprint** in CDT-journal at proof of Lemma 2.3.1, p.641 (line 820): the source says to bound sup abs(h) by a logarithmic mean; it should bound sup log abs(h); affects the proof.
- **Misprint** in McMullenRS at §16, p.147 (lines 5350–5351): the source says the radial distance using denominator x−1 and maps (−1,1) to positive reals; it should use 1−x, with absolute distance for negative x; affects nothing.
- **Error** in Uniformization at Proposition 9, pp.5–6 (lines 213–219): the source says noncompact boundaryless K=ℂ has a positive logarithmic Green function; it should assume a Greenian domain, or restrict to compact bordered K with nonempty boundary; affects a stated result.
- **Misprint** in CDT-journal at proof of Corollary 6.2.11, p.684 (line 3418): the source says to choose outer radius (1−r)/2; it should choose (1+r)/2, which exceeds r; affects the proof.
- **Misprint** in McMullenRS at proof of Theorem 2.9, p.9 (line 322): the source says the developed covering has domain the original triangle T; it should have domain the full upper half-plane reached by reflection; affects nothing.
