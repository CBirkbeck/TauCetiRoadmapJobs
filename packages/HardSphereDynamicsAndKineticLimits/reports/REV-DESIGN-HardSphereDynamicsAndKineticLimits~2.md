# Review of HardSphereDynamicsAndKineticLimits (design, round 2)

**Verdict:** needs changes

13 findings: 3 P1, 7 P2, 3 P3; 10 blocking. The design is repairable within its stated scope. No design or source-manifest entry was edited. This is a design review: no `Suggested.lean` exists, and elaboration is **not available (this lane does not elaborate; say so in the report)**. No Lean command was run.

## Previous findings, checked first

Locations below refer to `packages/HardSphereDynamicsAndKineticLimits/design/README.md` unless another file is named. The prior review and repair report are `packages/HardSphereDynamicsAndKineticLimits/reports/REV-DESIGN-HardSphereDynamicsAndKineticLimits.md` and `packages/HardSphereDynamicsAndKineticLimits/reports/FIX-DESIGN-HardSphereDynamicsAndKineticLimits~2.md`.

| Prior finding | Status | Repaired passage and verification |
|---|---|---|
| F01, pair-map chart domain | Repaired | Line 467: “with `ε + 4Rδ < ρ`”; line 480 repeats that restriction. For ε=.3, R=1, δ=.045, the near-pair maximum .39 plus .09 travel is .48 < .5. The old δ=.09 example is excluded. Plan 6.2–6.3 agree. R03 below concerns a different problem in the product of these maps. |
| F02, quotient-measure duplication | Repaired | Line 116: “The rest is Mathlib's and is cited, not proved here”. The carrier is expressly `E ⧸ L.toAddSubgroup`. The direct fundamental-domain pushforward theorem at `Mathlib/MeasureTheory/Group/FundamentalDomain.lean:801` avoids the circular invariance hypothesis of the previous proposed route. The opposite-subgroup adapter, measure choice, covolume and local Euclidean normalization remain legitimate adapters. |
| F03, FTC endpoints | Repaired | Line 597: “`intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le` on each closed piece”. Opened the pinned declaration at `Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean:1140`: continuity on the closed interval and derivatives only in its interior. The replacement is correct. The newly added example is not admissible as written; that is R06. |
| F04, cross-section locator | Repaired | Line 178: “The value is an elementary computation of this roadmap”. The involution, Jacobians and kernel now have separate locators. The polar computation gives π, 2 and 1 times the speed in dimensions 3, 2 and 1, respectively; the widened dimension-one statement is correct. |
| F05, stale pins | Repaired | Lines 35, 62: “at the pinned Mathlib” / “at the pinned Tau Ceti”. Plan baseline equals `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. |
| F06, scattering padding | Repaired | Line 158: “they are API of the definition, not headline theorems”. Line 77 no longer promises the three scattering API theorems as acceptance declarations. The reflection/determinant argument remains in the README. |

None was marked “not actionable in this package”; no settled finding is re-raised. Changed passages and their dependent uses were reviewed anew. The earlier computed table was used only for unchanged individual assertions with explicit values, not as approval of entire sections. In particular, its free-flow row did not check boost commutation, and its correlation row did not check N < n.

## R01 (P1) — Free transport does not commute with a velocity-only boost

**Location:** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:261`, “commutes … with the Galilean boost `V ↦ V + c`”; also plan target 3.4, API `measurePreserving_freeFlow`.

**Claim:** `S_t B_c = B_c S_t` for `B_c(X,V)=(X,V+c)`.

**Witness:** One particle on ℝ, x=v=0, t=c=1: `S_1 B_1(0,0)=(1,1)`, whereas `B_1 S_1(0,0)=(0,1)`.

**Exact repair:** Replace commutation with `S_t B_c = A_{π(tc)} B_c S_t`, where `A_a` translates all positions by a. Keep ordinary commutation for relabelling and common position translations. Add the displayed one-particle counterexample as a Check and mirror the correction in the plan. On the witness, the repaired right side is `(1,1)`. The trajectory boost in §5.3 already uses the correct time-dependent position translation.

## R02 (P2) — Physical identities need membership in the good set

**Location:** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:514`, “`T_t = S_t` on configurations with no contact”; line 538, “`T_t(X, V + c) = (X' + π(t c), V' + c)`”; plan 7.1 and 7.3.

**Claim:** These identities hold for the total flow, which is the identity outside G.

**Witness:** ε=1, x₁=(2,1), x₂=0, v₁=(−1,0), v₂=0: grazing occurs at time 2, so Z∉G. No contact occurs during [0,1], but `T₁Z=Z` while `S₁Z` has x₁=(1,1).

**Exact repair:** Add `Z ∈ G` to the free-motion identity and to Galilean covariance. Retain the exact total group law, reversal, relabelling, common position translations and conservation laws. State the covariance a.e. on the hard-core set as a corollary if needed. On the same witness, boosting by c=(1,0) leaves both initial states outside G: the left side fixes positions `(2,1),0`, whereas the currently claimed right side has `(3,1),(1,0)`. The new membership hypothesis excludes both failures without altering the identity extension.

## R03 (P2) — Full pair maps cannot be composed as disjoint pair blocks

**Location:** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:355`, “leave the other particles to free transport”; line 467, “the product of the pair maps `P^{ij}_δ` … and free transport on the others”.

**Claim:** A product of the specified full N-particle maps gives one time step when the near pairs form a matching.

**Witness:** On ℝ take ε=R=δ=1, positions `(0,2,20,22)`, all velocities .1. The near pairs are {1,2},{3,4}; no collision occurs. Composing the two P-maps moves every position by .2; the trajectory moves it by .1.

**Exact repair:** Make the block operation explicit. One clean choice is to change §4.5 so the pair map fixes all other particle coordinates, then define §6.2 as the product over the disjoint pair blocks and one free step on each unmatched coordinate. Alternatively explicitly restrict each old P-map to its pair output before forming the block product; do not compose the full maps. State the source and image measure for the restricted chart map. Update plan 4.5/6.2 and add the four-particle Check. Both repaired constructions give `(0.1,2.1,20.1,22.1)`. The repaired chart inequality from F01 remains correct.

## R04 (P1) — The factorial-moment formula counts the empty configuration

**Location:** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:703`, “`∫ F_n(t) = μ^{−n} E[N!/(N − n)!]`”; plan 9.5. Related index boundaries: lines 615 and 627.

**Claim:** The factorial quotient counts injections for every random particle number N.

**Witness:** Take μ=1, f⁰=0, n=1. Then Z=1, N=0 almost surely and F₁=0. Natural subtraction gives `0!/(0−1)!=1`, so the asserted equality is `0=1`. BGSS2023 line 249 includes `δ_{N≥n}`.

**Exact repair:** Use `Nat.descFactorial N n` (cast to the scalar type), or `1_{N≥n} N!/(N−n)!`, throughout. The pinned definition is `Mathlib/Data/Nat/Factorial/Basic.lean:332`, with zero for n>N at line 367. State s≤N in §8.4 and s<N in the marginal recursion of §8.3; W_N^(s+1) is unavailable at s=N. Add N=0,n=1 and N=1,n=2 Checks; the repaired counts are 0 in both cases, while N=3,n=2 remains 6. Even for positive-mass f⁰, the old n=1 formula is wrong by the strictly positive vacuum probability 1/Z.

## R05 (P1) — Compact positions do not give finite phase volume

**Location:** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:555`, “finite-measure `𝒟̄` (torus)”; line 574, “preserves the finite measure `λ_N|𝒟̄`”.

**Claim:** The hard-core phase measure is finite on a torus, making constant functions Lp examples.

**Witness:** N=d=1 on the unit circle has no exclusion: `𝒟̄₁=X×ℝ`. Its measure is `1·∞=∞`; the constant 1 has infinite p-th integral for every finite p.

**Exact repair:** State σ-finiteness, and finiteness after an energy cutoff, rather than finite total phase mass. Replace the constant Lp Check by the invariant function `1_{H≤R²/2}` on a torus. For N=d=1,R=1 its p-th integral is 2 and it is fixed by U_t. Keep the full infinite-measure Koopman theorem, which does not need finite total mass. Recheck every use of “finite measure”: the position-space hypotheses in §9.2–9.5 are appropriate; the integrations over velocities still require their Gaussian factors (R08).

## R06 (P2) — The test-function API and repaired witness violate admissibility

**Location:** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:602`, “multiplication by functions of `(t, P, H)`”; line 608, “admissible, since `σ_M` moves no position”; plan 8.2.

**Claim:** Preserving the specular condition is sufficient for the stated multiplier closure and for the new collision-time test to be admissible.

**Witness:** Choose χ(1)=1, χ′(1)=0, ψ′(1)=1, x₁−x₂=e₁, v₁=M e₁, v₂=0. The proposed test has `Lφ(1,Z)=M`, unbounded. Multiplying the admissible χ(t) by H also makes φ unbounded.

**Exact repair:** Multiply the collision-time witness by a bounded smooth energy cutoff θ(H), compactly supported in H and equal to 1 near H=1/2. This preserves the head-on values and derivatives ±1 when χ is locally 1 near time 1, but bounds every velocity entering Lφ. Restrict the multiplier API to measurable bounded multipliers a(t,P,H) with bounded measurable time derivative, differentiable in t; then `L(aφ)=a Lφ+(∂_t a)φ`. Require ψ measurable in the χ(t)ψ(H) Check at line 606. Mirror these conditions in the plan. The FTC replacement itself is correct, and the weak-Liouville proof for the defined admissible class survives.

## R07 (P2) — Gaussian estimates omit positive inverse temperature

**Location:** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:749`, “for measurable `g` with `|g(x, v)| ≤ C exp(−β|v|²/2)`”; plan 10.2 hypotheses.

**Claim:** The displayed bound alone guarantees absolute convergence of the collision integral and its gain/loss decomposition.

**Witness:** d=2, β=0, C=1, `g(v)=1_{|v|≥1}`, v=0. For w=r e₁ and ω=(1,1)/√2, r>√2, both outgoing speeds are r/√2 and the nonnegative gain integrand is r/√2; open cones give an infinite integral.

**Exact repair:** State C≥0 and β>0 explicitly, with measurable g; for the weak form require measurable ψ of polynomial growth. Put the same hypotheses in the plan, rather than relying on the phrase “Gaussian-bounded”. The witness fails β>0. With that hypothesis, energy conservation bounds the gain by `C² exp(−β(|v|²+|w|²)/2)`, and the remaining velocity integral of `(1+|w|)` is finite. Likewise make β₀>0 explicit in §9.5's Gaussian estimate.

## R08 (P2) — Integrating out particles loses a Gaussian-volume factor

**Location:** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:703`, “by `μ^{n+m} C₀^{n+m} exp(−β₀|V_n|²/2)/Z` after integrating out `m` particles”.

**Claim:** The pre-integration bound remains unchanged after integrating out m position/velocity coordinates.

**Witness:** Unit circle, ε=.1, μ=C₀=β₀=1, f⁰(v)=exp(−v²/2), n=m=1, v₁=0, t=0: the actual marginal is `.8√(2π)/Z ≈ 2.0053/Z`, exceeding the claimed `1/Z`.

**Exact repair:** Bound the integrated density by

`μ^{n+m} C₀^{n+m} exp(−β₀|V_n|²/2) [μ_X(X)(2π/β₀)^{d/2}]^m / Z`.

Distinguish this from the unintegrated bound, which retains `exp(−β₀|V_{n+m}|²/2)`. Then justify absolute convergence of the inversion series using the factorial denominator and the finite constant in brackets. On the witness the repaired bound is `√(2π)/Z ≈ 2.5066/Z ≥ 2.0053/Z`. Add this Check to §9.5; the finite-position-space hypothesis does not make velocity space finite.

## R09 (P2) — The equilibrium law of large numbers fails in dimension one

**Location:** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:794`, “the hypotheses hold with `f = M`”; line 802, “satisfies the law of large numbers unconditionally”; plan 10.5 equilibrium Check. The standing dimension is d≥1.

**Claim:** The Maxwellian equilibrium in the chosen Boltzmann–Grad scaling always satisfies §10.5's diverging-intensity hypothesis.

**Witness:** d=1 gives `μ_ε=ε⁰=1`. On the unit circle with f⁰=M, Z_ε→e and P(N=1)→e⁻¹. For h=1, δ=1/2, `P(|π(1)−1|≥δ)→1−e⁻¹≈.63212`, not 0.

**Exact repair:** Add d≥2 to these equilibrium applications and the Layer 10 example, keeping the general theorem under its explicit hypothesis μ_ε→∞. Add the dimension-one non-example. The limit of Z follows by dominated convergence of each excluded-volume integral to 1 and domination of the partition series by Σ1/N!. In d≥2, μ_ε⁻¹=ε^(d−1)→0, so the variance argument applies as intended. This is a necessary hypothesis for this application, not a restriction of the general microscopic library.

## R10 (P2) — Zero density and zero diameter need separate grand-canonical clauses

**Location:** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:673`, “given `N`, the particles are i.i.d. with law `f⁰/∫f⁰`”; `packages/HardSphereDynamicsAndKineticLimits/design/plan.json:1780`, “finite sum on flat tori”.

**Claim:** The conditional probability law is normalized for all permitted integrable f⁰≥0; the plan also asserts finite torus partition sums throughout ε≥0.

**Witness:** f⁰=0 gives `f⁰/∫f⁰=0/0`, the zero density under Lean's division convention, with mass 0 rather than 1. Separately, ε=0, μ=1, ∫f⁰=1 on a torus gives positive terms 1/N! for every N.

**Exact repair:** Preserve the general construction at zero density: state that it is the vacuum law when ∫f⁰=0. Require ∫f⁰>0 only for the conditional i.i.d. law `f⁰/∫f⁰`; condition on positive-probability particle-number events. In plan 9.3 qualify finite truncation by `0<ε<ρ`, matching the README. Add both boundary Checks. The repaired cases give P(N=0)=1 and Z=1 for f⁰=0, and the genuinely infinite series Z=e for ε=0, μ=1, ∫f⁰=1.

## R11 (P3) — Replace the random finite-difference claim by a mathematical Check

**Location:** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:336`, “At random points … a finite-difference Jacobian … determinant `1.000000`”; plan 4.3 Check.

**Claim:** An unspecified numerical experiment is a reproducible check of the Jacobian convention.

**Witness:** At ε=1, a=(2,0), u=(−1,0), in coordinate order (a₁,a₂,u₁,u₂), `DC=[[-1,0,0,0],[0,-1,0,-2],[0,0,-1,0],[0,2,0,3]]`; its determinant is exactly 1. No sampled points or step sizes are supplied.

**Exact repair:** Replace the numerical assertion by this explicit derivative and determinant, and compare a fixed-time B_s (e.g. s=3). Specify that s is fixed when differentiating. In dimension one the variable-time map `B_{τ(a,u)+.7}(a,u)=(1−.7u,−u)` on a>1,u<0 has determinant 0, whereas fixed-time B_s has determinant 1. This Check distinguishes the two meanings and removes the unverifiable experiment without introducing a computational procedure into the roadmap.

## R12 (P3) — The mild-solution definition has no API and its sign Check is not discriminating

**Location:** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:761`–769; line 767, “the wrong characteristic direction … is not a solution”; `packages/HardSphereDynamicsAndKineticLimits/design/plan.json:2101`, target 10.3 has `api: []`.

**Claim:** The definition has the required API and the claimed non-example excludes the positive transport sign.

**Witness:** For spatially constant f⁰=M, both `f⁰(x+tv,v)` and `f⁰(x−tv,v)` equal M(v), and both solve the free equation. The adjacent Maxwellian Check supplies this counterexample.

**Exact repair:** Give the definition an API, including the a.e. initial identity and restriction from [0,T] to [0,S] for 0≤S≤T. State T≥0 in the README as in the plan, and mirror the README's existential C,β>0 in the plan. Replace the sign Check by the unit-circle datum `f⁰(x,v)=(1+.5 cos(2πx))M(v)`: at x=0,v=1,t=1/4, the wrongly signed candidate along the characteristic is `.5 M(1)` instead of `1.5 M(1)`. Keep these APIs and Checks in prose, not as acceptance-file padding.

## R13 (P3) — Proposition 4.3 is attributed to the wrong source

**Location:** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:492`, “Lanford1975 Proposition 4.3, as attributed in GST2013 line 855”; line 830; plan line 1202; `packages/HardSphereDynamicsAndKineticLimits/sources.toml:96`.

**Claim:** GST2013 attributes this finite-system existence proposition to Lanford1975.

**Witness:** GST2013 line 855 cites reference [2], Proposition 4.3. Its bibliography identifies [2] as Alexander1976 at lines 5439–5440; Lanford1975 is reference [34] at lines 5507–5508.

**Exact repair:** Attribute Proposition 4.3 to Alexander1976, explicitly through GST2013 if retaining the secondary locator. Remove the claimed GST attribution from Lanford1975's manifest locator and from its README reference; retain that key for the convergence theorem. Reuse the existing Alexander1976 key and its settled uncertified status; do not request the source again. This repair is checked directly against the bibliography, not inferred from the unavailable originals. The reviewer has left both recorded manifest entries untouched.

## Verified sound

### Scope, sources and repair coverage

Read all 45 plan targets, all README target/API/Check paragraphs, all 45 `Needs:` blocks, the 10 layer dependency paragraphs, and all 9 source entries. The plan has 145 Checks. Every target has at least three planned Checks, but their correctness and discriminating power have the exceptions above. There are no declared gaps. No route-specific arithmetic or geometric restriction, re-planned hard-sphere roadmap, copied source passage, sorry'd datum, `set_option`, or executable algorithm was found in the design. R11 is an unsuitable numerical Check rather than a mathematical construction algorithm.

All six previous repairs were verified. All changed assertions were re-evaluated, including the quotient/opposite-group adapter, polar integral in dimension one, step-radius inequalities and the new collision-time example. Untouched assertions covered by the earlier computed rows were recomputed where sampled, where used by a changed claim, or where the prior row omitted the relevant API clause. Previously summary-only targets 1.2, 3.1, 3.5, 5.1, 5.2 and 5.4 were read in full and evaluated on the examples below. This report is not a passing Lean certificate.

All cited works already have a unique manifest entry; no new fetch or missing-reference request was necessary. The three available texts are precisely the arXiv versions named in the manifest (GST v2, BGSS v2, Deng–Hani–Ma v3). Checks below use their printed pages, not assumed published-edition pagination. No author-flagged unverified locator occurs in the design; the six uncertified source entries are listed separately under Not verifiable. R13 is a manifest error, not an access problem.

### Seeded source checks (all 15)

| Target | Text opened, number and printed page | Support and limits |
|---|---|---|
| 2.2 Pre/post variables | GST2013 lines 394–400, (2.1.3), p.11; lines 432–437, (2.2.1), p.12; lines 674 and 1264–1268, pp.19,33 | Involution, conservation and unit absolute Jacobians support the changes of variables; positive-part kernel is explicit. The cross-section value is correctly presented as a new elementary calculation. |
| 3.4 Free transport | GST2013 lines 833–841, (4.1.1), p.27; BGSS2023 lines 119–123, (1.1.1), p.1 | Supports free dynamics on Euclidean space and the torus, respectively. Neither supports velocity-only boost commutation (R01). |
| 4.3 Collision map/Jacobian | GST2013 line 883, proof of Prop.4.1.1, p.28; DengHaniMa2024 lines 182–188, Prop.1.2(3), p.4; BGSS2023 lines 132–137, p.1 | These use/assert flow invariance, not the explicit differential formula. The roadmap supplies its own correct two-reflection determinant argument; R11 concerns the Check. |
| 5.2 Uniqueness/gluing | DengHaniMa2024 lines 182–188, Prop.1.2, p.4; GST2013 lines 848–854, p.27 | Source uniqueness is a.e. The exact trajectory uniqueness and gluing with disjoint simultaneous collisions are the roadmap's elementary extension, with the involution and local finite-contact argument stated. |
| 6.1 Near triples | GST2013 lines 864–874, Lemma4.1.1, p.28 | Source assumes bounded Euclidean positions/velocities and δ<ε/2, and bounds a collision event by two shells. The roadmap's geometric event and explicit N³ bound follow from Fubini, at the stated local-radius restriction. It does not merely drop the source's hypotheses. |
| 6.2 Short steps | GST2013 lines 875–887, p.28 | Supports the collision-exclusion step and null grazing remainder. The chart radius is the roadmap's torus adaptation; correctly repaired. Full pair-map composition still needs R03. |
| 6.4 Alexander | GST2013 lines 862–910, Prop.4.1.1 and proof, pp.28–29; BGSS2023 lines 132–139, p.1; DengHaniMa2024 lines 182–188, p.4 | A.e. finite-N dynamics supported. Borel realization, identity extension and matching-contact convention are the roadmap's additions. GST line 855's Proposition4.3 attribution is R13. |
| 7.5 Grand phase space | BGSS2023 lines 158–181, (1.1.5)–(1.1.6), p.2; DengHaniMa2024 lines 199–223, Def.1.3, p.5 | Supports the disjoint union and 1/N! convention. The explicit base measure Λ and its componentwise invariance are correctly derived. |
| 8.1 Transported densities | BGSS2023 lines 145–157, (1.1.3)–(1.1.4), p.2; GST2013 lines 1138–1140, (4.3.5), p.32; DengHaniMa2024 lines 233–234, (1.10), p.5 | Negative-time pullback and specular transport agree. Real-valued integral identities need the stated integrability or nonnegativity interpretation. |
| 8.3 Marginals | GST2013 lines 929–938, (4.2.2)–(4.2.3), p.29 | Supports integration, recursion and specular trace. The recursion is between existing levels: s<N (R04). |
| 9.3 Grand canonical measures | BGSS2023 lines 167–181, (1.1.5)–(1.1.6), p.2; DengHaniMa2024 lines 199–223, Def.1.3, p.5 | Both sources start with probability densities and positive diameter. The extension to arbitrary finite mass and ε=0 is mathematically natural, but the zero-mass conditional law and plan's truncation clause require R10. |
| 9.4 Invariance | BGSS2023 lines 479–483, equilibrium discussion, p.7; line 3539, p.59; lines 267–268, p.3 | Maxwellian product identity and transport supported. General β,u,c invariance follows from energy, momentum and finite normalization. |
| 9.5 Correlations | BGSS2023 lines 218–288, (1.1.9)–(1.1.11), p.3; DengHaniMa2024 lines 235–244, (1.11), p.5 | μ^−n and 1/p! agree. Source explicitly has the N≥n indicator (R04); inversion is given at BGSS lines 229–237. The roadmap's integration estimate needs R08. |
| 9.6 Initial chaos/scaling | BGSS2023 lines 211–217, (1.1.8), p.3; DengHaniMa2024 lines 246–252, (1.12), p.5 | Scaling and O(ε) claim supported. The explicit two-sided estimate is the roadmap's empty-ball/union-bound derivation; constants checked below. |
| 10.3 Mild solutions | BGSS2023 lines 292–312, (1.2.1)–(1.2.3), p.4; GST2013 lines 380–393, (2.1.1)–(2.1.2), p.11 | The PDE and collision signs agree; the characteristic integral formulation is the roadmap's own definition. No source claim supplies its missing API (R12). |

Additionally reopened the weak-Liouville class at GST2013 lines 941–958 (smooth compact support in the source), BGSS Theorem1 at lines 316–321, GST Theorem4 at lines 668–674 and Theorem8 at lines 2069–2080, and the LLN proof at BGSS2023 lines 352–371. The generalized LLN uses bounded continuous tests and explicit weak convergence, so its proof does not rely on unjustified integration of bare a.e. convergence. Lanford's theorem is only defined as a proposition here; its proof is expressly outside this roadmap.

### Adversarial table

Every row records evaluated values or symbolic expressions on both sides. “Sound” applies to the named assertion, not unrelated API assertions in the same target. This table covers the seeded sample, planned headline theorems, repairs, and every target touched by a finding.

| Statement | Instances tried | Values computed on the two sides | Result / change |
|---|---|---|---|
| 1.1 flat-space axioms | ℝ, ℝ²/ℤ², sup-norm torus | π=id gives lift a=a; Euclidean quotient at (.5,.5) is √.5≈.7071; sup norm is .5. At (.1,.1), shortest Euclidean lift has length .1414, exceeding sup norm .1. | Sound; wrong metric excluded. |
| 1.2 Euclidean instance | ε=1, xᵢ=e₁,xⱼ=0; one free particle | ν=e₁/1=e₁; radius-one volume in d=3 is 4π/3; S₂(0,e₁)=(2e₁,e₁). | Sound. |
| 1.3 repaired quotient measure | ℝ/ℤ, domains [0,1), [−.5,.5); 2ℤ×ℤ | Both domains push to mass1; right and left translation by k are x+k=k+x. Rectangular covolume2; local quarter-ball area π/16, versus π/32 under unwanted probability rescaling. | Sound. |
| 1.3 non-domain Check | Ball B(0,.5), d=2 and d=1 | d=2 massπ/4<1, so it cannot tile; d=1 mass1, missing only a null congruence class. | Sound with d≥2 qualification. |
| 1.4 shells/packing | d=2 unit torus, ε=.4; d=1 r₁=.4,r₂=.6 | Packing cells .04π; 8·.04π≈1.0053>1. Circle shell actual .2 versus formula .4 outside the radius hypothesis. | Sound. |
| 2.1 removed headline APIs | ν=e₁,v=(0,.9),w=(.9,0) | σ(v,w)=((.9,.9),0); momentum (.9,.9) both sides, squared energy1.62 both sides; σ²=id; det−1 gives Haar factor1. | Sound API, correctly removed from acceptance list. |
| 2.2 Θ/kernel | Same v,w,ω=e₁ | (w−v)·ω=.9; (w′−v′)·(−ω)=.9; applying Θ twice returns (v,w,ω). | Sound. |
| 2.2 polar cross-section | d=1,2,3; k=0 | Ball integral ω_(d−1)/(d+1) multiplied by d+1 gives 1,2,π for unit k; k=0 gives 0=0. Probability sphere in d=3 would give 1/4 instead of π. | Sound repaired computation. |
| 3.1 hard-core set | N=0,1,2, ε=1 on ℝ | No pairs for N≤1, hence full space. Positions0,1: closed predicate true, open false; 0,.5: both false. | Sound. |
| 3.2 normals/matchings | Torus positions .1,.8, ε=.3; positions0,±1 | Short difference .3 gives ν=+1, versus representative −.7. Second example has two edges sharing the central particle, so not a matching. | Sound. |
| 3.3 scattering/reversal | x₁=e₁,x₂=0,V=(e₁,0) | σV=(0,e₁), ℛV=(0,−e₁); outgoing relative normal speed remains1; momentum changes e₁ to−e₁ under ℛ as expressly stated. | Sound. |
| 3.4 free flow/boost | N=1, x=v=0,t=c=1 | S₁B₁=(1,1); B₁S₁=(0,1); adding position translation1 repairs equality. | R01. |
| 3.5 collision invariants | Oblique example; N=0 | P=(.9,.9) and H=.81 before/after; empty sums P=0,H=0. Separate velocity reflection preserves H but changes P=e₁ to−e₁. | Sound. |
| 4.1 first contact | a=(2,0),u=(−1,0); a=(1,3),u=(0,−1) | D=1,τ=1,q=(1,0),q·u=−1; tangent D=0,τ=3. At a=(2,3), D=−3, no root. | Sound; denominator nonzero from a·u<0. |
| 4.2 reflected path | Head-on at s=3; oblique q=(.8,.6) | B₃=((3,0),(1,0)); wrong initial-point continuation gives(5,0). R_qu=(.28,.96), squared norm .0784+.9216=1. | Sound. |
| 4.3 Jacobian | Head-on ε=1, fixed s=3 | DC matrix in R11 has determinant (−1)(−1)(−3+4)=1; free shear also det1. Variable-time d=1 B_(τ+.7) has determinant0. | Theorem sound; R11 fixes Check. |
| 4.4 measure preservation | Collision/free pieces, d=1 | Head-on C(a,u)=(2−a,−u), determinant1; free map (a+su,u), determinant1. At s=0 incoming boundary alone is changed, a null set. | Sound; boundary convention checked. |
| 4.5/6.2 pair blocks | Four particles in R03 | Each full P translates all positions by .1; composition gives .2. Disjoint pair-output product gives .1. | R03. |
| 5.1 trajectories | Head-on t=1; wrong continuation | x₁(1)=1,x₂(1)=0; right velocities(0,−1), left(−1,0); specular map exchanges them. Unreflected distance at t=1.5 is .5<ε. | Sound definition discriminates. |
| 5.2 uniqueness/gluing | Outgoing contact state on [0,2]; overlapping head-on pieces | Both free continuations give x₂(2)=−2. Restriction/gluing of [0,2] and [1,3] gives x₁(3)=1,x₂(3)=−2 on both pieces. | Sound, using local finite contacts and involution. |
| 5.3/5.4 symmetries/convention | Head-on reversed and left-continuous | At t=1 left velocities(−1,0), right(0,−1), σ²=id. Reversed state at −3 has positions(1,−2), velocities(0,1); at0 returns positions(2,0), velocities(1,0). | Sound on trajectories; §7.3 needs R02 for total extension. |
| 5.5 good configurations | u=0, separation>ε; future tangent example | Constant separated path belongs to G; a=(2,1),u=(−1,0) has D=4−4=0 and τ=2, so not in G. | Sound; provides R02 negative control. |
| 6.1 near triples | N=3,d=1,K=unit circle,ε=.1,η=.01,R=1; N=2 | Two shells each mass .02. RHS=27·(.02)²·(4π/3)=.0452389; Fubini ordered-triple bound6·(.02)²·(4π/3)=.0100531≤RHS. N=2 event has mass0. | Sound explicit bound. |
| 6.2 repaired chart range | ρ=.5,ε=.3,R=1,δ=.09/.045 | Old case near distance .47 plus .18=.65≥.5; repaired case near max .39 plus .09=.48<.5. | F01 repaired; independent R03 remains. |
| 6.3 iteration | δ=t/m; bounded positions K | m·Cδ²=Ctδ→0; jRδ≤Rt, so neighborhood-volume constants independent of m. For arbitrary δ, number of steps is ceil(t/δ), bounded by t/δ+1. | Sound small-step estimate; use δ=t/m in the null-set proof. |
| 6.4 Alexander/null set | N=0,1; N=2 Euclidean | First two G are whole spaces, complement mass0. For N=2, tangency cylinder and boundary contact states both mass0 by Fubini; corrected step bounds give inf_m Ct²/m=0. | Sound core route after R03; locator R13. |
| 7.1 total group law/free identification | Head-on T₋₃T₃; tangent example | Head-on returns initial (2,0;−1,0). Off G every composition fixes Z, so group law exact; tangent example T₁ fixes(2,1) while S₁ gives(1,1). | Group law sound; R02 for free identification. |
| 7.2 preservation | Collision chart; complement of G | Absolute Jacobian1 on step charts; identity on Gᶜ has factor1. Two-body inelastic map instead has a lower-dimensional image with measure0. | Sound route after corrected step map. |
| 7.3 reversal/boost | Head-on; future-grazing state with c=e₁ | ℛT₃Z and T₋₃ℛZ both have positions(1,−2), velocities(0,1). Off G boost formula compares positions(2,1),0 with(3,1),(1,0). | Reversal sound; covariance R02. |
| 7.4 Koopman | Torus N=d=1; finite-p energy cutoff; p=∞ shift | ∫1=∞. ∫1_(H≤1/2)=2 and invariant. Shifted interval indicator has L∞ difference1 for small nonzero t. | General group sound; R05 fixes false finite-mass Check. |
| 7.5 grand phase space | N=0,1; d=2,ε=.4 torus | Λ(empty configuration)=1/0!=1; N=1 component has mass∞ and weight1; N≥8 components mass0 by packing. | Sound definition and invariance. |
| 8.1 transport | N=1, t=1,x=v=e₁ | W(1)(e₁,e₁)=W⁰(0,e₁); W⁰∘T₁ instead evaluates at2e₁. | Sound sign and duality. |
| 8.2 Liouville/FTC | χ(t)ψ(H); repaired collision witness | ∫χ′=−χ(0), so weak sum0. At χ(1)=1,χ′(1)=0 head-on derivatives−1,+1; unrestricted test Lφ=M→∞ on high-speed states, cut off H makes it bounded. | Theorem/FTC route sound; API and Check R06. |
| 8.3 marginal/recursion | N=2 unit circle,ε=.1,∫g̃=1 | W₂^(1)=.8g(z₁), versus g(z₁) without exclusion. At s=N the marginal equals W_N; there is no level N+1. | Sound marginal; boundary hypothesis R04. |
| 8.4 symmetric expectations | N=3,s=2,h=1; N=1,s=2 | Injection counts6 and0; unrestricted maps9 and1. Descending factorial gives6 and0; naive latter factorial quotient gives1. | R04 supplies exact index range/count. |
| 9.1 Maxwellian | d=1,β=1,u=0; d=3 | M(0)=.39894228; ∫exp(−|v|²/2)=(2π)^(3/2)=15.74960995. Covariance β⁻¹I gives the same Tau Ceti density. | Sound normalization. |
| 9.2 canonical | N=1 unit torus; d=2,ε=.4,N=8 | Position normalization1 versus0; first measure probability1, second expressly excluded by Zcan>0. | Sound. |
| 9.3 grand canonical | ε=0,μ=2,∫f⁰=1; f⁰=0 | Z=e², P₁=2e⁻²=.27067057; zero density gives Z=1, vacuum mass1, normalized zero density mass0. | Partition/probability sound; conditional law R10. |
| 9.4 equilibrium | β,u general; radial indicator at oblique collision | Σ|vᵢ−u|²=2H−2u·P+N|u|² both sides. Radial indicator product changes1 to0 because |(.9,.9)|≈1.2728. | Sound Maxwellian invariance. |
| 9.5 factorial identity/inversion bound | Vacuum n=1; circle Gaussian n=m=1 | Correct injection expectation0, naive quotient1. Integrated Gaussian factor .8√(2π)=2.0053 versus claimed1; corrected upper factor√(2π)=2.5066. | R04 and R08. |
| 9.6 chaos/scaling | d=3,ε=.01,ρ⁰=1; coincident positions | ω₃ε=.04188790, so ε²E[N]∈[.95811210,1]; off diagonals deficit≤nω_dε·product; on x₁=x₂ indicator=0. | Sound. |
| 10.1 empirical moments | h=1; empty population | π(1)=N/μ, square=N²/μ²; decomposition N²=N+N(N−1). N=0 gives zero measure, not a probability empirical measure. | Sound, with corrected falling factorial in supplier identity. |
| 10.2 collision operator | Maxwellian; β=0 profile in R07 | Maxwellian gain−loss=0; d=3,v=0 loss=M(0)π√(8/π). At β=0,v=0, open cones give radial divergent gain ∫r^d dr=∞. | R07. |
| 10.3 mild equation | Spatial constant M; circle cosine datum | Constant M gives both signs=M; cosine datum at x=0,v=1,t=.25 gives .5M(1) for wrong sign versus1.5M(1). | Equation sign sound; Check/API R12. |
| 10.4 Lanford proposition | Maxwellian datum, d≥2, admissible C₀ | Q(M,M)=0; invariant correlations and initial estimate give first marginal error≤ω_dεM, tending0; tensor convergence off diagonals. | Consistent proposition; proof is not owned here. |
| 10.5 LLN | μ→∞; d=1 equilibrium; incorrect F₂ limit | E[(π(h)−m)²]→0+m²−2m²+m²=0; F₂→2f⊗f instead gives m². d=1,μ=1,h=1 gives probability limit .63212056, not0. | General theorem sound; application R09. |

The marginal and correlation equalities are evaluated as nonnegative lower-integral statements first; real versions require the stated finiteness assumptions. Dimension zero is excluded by the standing d≥1; empty particle index sets are not excluded and were tested. Tangency D=0, u=0, contact-at-endpoint, zero density, zero diameter, finite versus infinite volume, and natural-subtraction junk values were all inspected. No group-theoretic characteristic-p or DVR test is relevant to these real Euclidean statements.

### Pinned-library audit

The following declarations were opened at the pinned sources, including their signatures and nearby hypotheses. Paths are repository-relative library paths. Generated additive names were checked against the `to_additive` declarations and existing uses where available, not asserted to have been elaborated.

| Object consumed | Pinned location and checked content |
|---|---|
| Euclidean carrier/ball volume | `Mathlib/Analysis/InnerProductSpace/PiL2.lean:114`: `PiLp 2`; `Mathlib/MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean:308`: ofReal-radius volume formula. |
| Quotient metric and Borel structure | `Mathlib/Analysis/Normed/Group/Quotient.lean:168`, `:222`: infDist formula and closed-subgroup normed instance, additive versions; `Mathlib/MeasureTheory/Constructions/Polish/Basic.lean:649`: Polish topological group, normal closed subgroup. |
| Discrete lattice and domain | `Mathlib/Topology/Algebra/OpenSubgroup.lean:377`: discrete subgroup closed in T1 group; `Mathlib/Algebra/Module/ZLattice/Basic.lean:93`, `:434`, `:645`, `:652`: domain, spanning class with separate discreteness assumption, fundamental-domain theorem, countability. |
| Covolume | `Mathlib/Algebra/Module/ZLattice/Covolume.lean:73`, `:85`: real-valued covolume and equality to measure.real of a fundamental domain. ENNReal total mass requires the finite-measure conversion. |
| Quotient Haar normalization | `Mathlib/MeasureTheory/Group/FundamentalDomain.lean:731`, `:755`, `:801`; `Mathlib/MeasureTheory/Measure/Haar/Quotient.lean:75`, `:222`: pushforward typeclass, independence, quotient-map preservation, finite quotient Haar theorem; opposite-subgroup action is explicit. |
| Product-circle comparison | `Mathlib/Topology/Instances/AddCircle/Real.lean:55`: function type of circles; `Mathlib/Analysis/Fourier/AddCircleMulti.lean:173`: measure-preserving coordinate-domain equivalence. Does not identify Euclidean and sup norms. |
| Change of variables | `Mathlib/MeasureTheory/Function/Jacobian.lean:1096`, `:1184`: measurable domain, within derivative and injectivity. No unsupported global smooth flow is imported. |
| Reflection/determinant | `Mathlib/Analysis/InnerProductSpace/Projection/Reflection.lean:52`; `Mathlib/Analysis/InnerProductSpace/Projection/FiniteDimensional.lean:59`; `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:734`; `Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean:231`: reflection, determinant, triangular blocks, nonzero-determinant Haar pushforward. |
| Null sets/Haar | `Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean:172`, `:527`: proper submodule and sphere nullity, with finite dimension/nontriviality; `Mathlib/MeasureTheory/Group/Measure.lean:773`: finite-on-compacts, invariance and positive-on-open fields, not finite total mass. |
| Sphere normalization | `Mathlib/MeasureTheory/Constructions/HaarToSphere.lean:52`, `:88`: dimension times cone measure and total mass d·vol(B). |
| Gaussian/Poisson | `Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:330` requires positive b; `Mathlib/Probability/Distributions/Gaussian/Real.lean:47`; `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:166`, `:170`; `Mathlib/Probability/Distributions/Poisson/Basic.lean:40`. Invalid covariance gives a Dirac law, not a density. |
| Product measures and measurable sums | `Mathlib/MeasureTheory/Constructions/Pi.lean:732`; `Mathlib/MeasureTheory/MeasurableSpace/Constructions.lean:871`; `Mathlib/MeasureTheory/Measure/Sum.lean:30`. |
| Measure-preserving and continuous flow carriers | `Mathlib/Dynamics/Ergodic/MeasurePreserving.lean:44`: measurability and map equality only; `Mathlib/Dynamics/Flow.lean:85`: joint continuity required. Hard-sphere dynamics cannot be a native continuous Flow on the unreconciled collision states. |
| Lp operators/density | `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:595`, `:611`; `Mathlib/MeasureTheory/Function/ContinuousMapDense.lean:142`: continuous compact-support approximation for p≠∞, regular measure and locally compact separation hypotheses. |
| Calculus/probability | `Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean:1140`, `:1148`; `Mathlib/Probability/Moments/Variance.lean:398`: finite measure, MemLp 2 and positive threshold. |
| Falling factorial repair | `Mathlib/Data/Nat/Factorial/Basic.lean:332`, `:367`: recursive descending product and vanishing when n>N; avoids truncated-subtraction quotient. |
| Tau Ceti Gaussian density | `TauCeti/Probability/Distributions/Gaussian/Density.lean:82`, `:88`, `:265`: real/ENNReal densities and withDensity identity for positive-definite covariance. |
| Tau Ceti C₀ group | `TauCeti/Analysis/Semigroups/Group/Basic.lean:74`: real normed space, continuous linear operators for every real time, zero/addition laws and strong continuity at zero; completeness imposed by later results, not this carrier. |
| Tau Ceti empirical law | `TauCeti/Probability/Process/EmpiricalMeasure.lean:224`, with binders at line217: Fintype and Nonempty. N=0 cannot use this probability-measure constructor. |
| Tau Ceti Lipschitz flow | `TauCeti/Dynamics/Flow/OfLipschitz.lean:59`, binders at line54: complete real normed space and globally Lipschitz field. Applies to the free vector field, not collisions. |

The generic imported objects are cited rather than re-owned. Object searches in both pinned libraries for hard spheres, BBGKY, Lanford, specular scattering, flat tori and grand canonical constructions found no competing microscopic theory. “Boltzmann” hits in Tau Ceti concern entropy and the Gaussian radial distribution, not this collision operator or particle flow. The quotient Haar theory is already owned by Mathlib; F02 now respects that distinction.

### Cross-roadmap ownership, overlaps and order

Read `scratch/board-packages-index.txt` before the ownership conclusion: its other packages are AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory. Read the supplied overlap/citation reports and ran `roadmaps grep` and `roadmaps show` against main and the indexed open heads. The search `hard.sphere|BBGKY|Lanford` returned “no match on main or in any open roadmap pull request”; the local package search returned this design. This supports ownership of the microscopic theory, not a claim that unrelated generic measure theory is absent.

Resolved the scope mentions of StandardDistributions at `TauCetiRoadmap/StandardDistributions/README.md:547` (Layer5, including §5.2 Gaussian density) and OneParameterSemigroups at `Completed/OneParameterSemigroups/README.md:35` (C₀ groups). Both are consumed through the specific pinned declarations, not through new roadmap dependencies. Read those main READMEs for upstream shape as well.

The five closest open heads were read by scope and relevant object:

- PointProcesses, pull request #417, `TauCetiRoadmap/PointProcesses/README.md:936` (factorial/Janossy measures), `:1176` (Poisson densities), `:1200` (hard-core density): it owns intrinsic unlabelled locally finite point measures and finite-window Poisson-density theory. This design owns the labelled finite-particle phase union and its deterministic hard-sphere evolution. It does not declare the other roadmap's generic carriers or Papangelou operators. No supplier edge to this forbidden supplier is introduced.
- RelativisticQuantumFieldTheory, #1772, `TauCetiRoadmap/RelativisticQuantumFieldTheory/README.md:5`: correlation distributions, relativistic field/scattering constructions and Fock carriers, not classical labelled hard spheres.
- HamiltonianSystems, #480, `TauCetiRoadmap/HamiltonianSystems/README.md:19`: smooth Hamiltonian/moment-map mechanics, not instantaneous specular collision dynamics. No dependency is claimed.
- RandomMatrices, #1971, `TauCetiRoadmap/RandomMatrices/README.md:19`: spectral ensembles, logarithmic gases and their empirical laws; no hard-sphere flow or Boltzmann–Grad target.
- OptimalTransport, #950, `TauCetiRoadmap/OptimalTransport/README.md:3`: couplings, transport geometry and gradient flows; no hard-sphere billiard flow or correlation scaling ownership.

The broader object search also found IncompressibleFlows #237, `TauCetiRoadmap/IncompressibleFlows/README.md:266`, whose Koopman construction assumes a continuous measure-preserving flow. The collision flow here is discontinuous in its native phase coordinates; this roadmap's concrete strong-continuity proof for its Lp action is distinct. Per-time composition is already Mathlib's operator and is cited. Completed/Exchangeability likewise points to that native Lp operator rather than owning a second hard-sphere group.

`scratch/overlaps.md` reports no conflicting head changing this roadmap, no dropped cited id, and no id available only in an open revision. Inspection found no such dependency hidden in the design. No foreign Suggested declaration is copied. Ownership against other open pull requests without supplied files was not individually checked; the indexed object grep is the extent of that broader coverage.

Dependency gate output, run without changing the merge order:

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after SobolevMapsBetweenManifolds (the intake inserts it when its design is accepted)
depcheck: 224 roadmaps, 2036 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `suppliers: []` and `gaps: []` agree with the README. All target references in the plan resolve internally and run forward in layer order; same-layer dependencies are to earlier targets. No missing supplier contract was identified. The step-map defect is an internal construction error, not an excuse to introduce a later supplier. The resolver returned no unresolved roadmap citations, but explicitly said it had not checked library names because it could not locate pinned Lake packages; the library claims above were therefore opened manually at the supplied pins.

### Shape, acceptance statements and padding

The required major headings and all 10 Examples/Dependencies endings are present. The design uses Unicode mathematics, per-target Needs blocks and prose, with no local machine paths, pull-request numbers, dates, HTML anchors or target-numbering catalogue. The source locators use cached line numbers plus numbered results where available. R13 corrects one wrong attribution; R12 records the empty API and nondiscriminating Check. Short definitions with their facts embedded in prose (momentum, energy, empirical measure) were counted as having mathematical APIs, rather than insisting on a literal API heading.

The README's intended acceptance names comprise 13 definitions/classes and 11 theorems after F06. The promised theorems are:

1. `HardSphere.IsTrajectory.eqOn` — exact trajectory uniqueness (§5.2).
2. `HardSphere.volume_hardCoreSet_diff_goodSet` — Alexander's null exceptional set (§6.4).
3. `HardSphere.flow_add` — total group law (§7.1).
4. `HardSphere.measurePreserving_flow` — preservation (§7.2).
5. `HardSphere.flow_reversal` — reversal (§7.3).
6. `HardSphere.weak_liouville` — specular weak equation (§8.2).
7. `HardSphere.grandCanonical_flow_invariant` — equilibrium (§9.4).
8. `HardSphere.lintegral_sum_distinct_eq_correlation` — correlation/expectation identity (§9.5).
9. `HardSphere.boltzmannGrad_scaling` — initial scaling estimate (§9.6).
10. `HardSphere.tendsto_empirical_of_correlation` — LLN under weak correlation convergence (§10.5).
11. `HardSphere.LanfordStatement.tendsto_empirical` — consequence of the fully stated Lanford proposition (§10.5).

The summary also promises the concrete strongly continuous Koopman group (§7.4). At package stage its acceptance treatment must be assessed along with the above; no Lean file or module docstring exists to inspect now. The particle/density predicates and measures use native Euclidean, quotient, function and measure carriers, so they are not inherently unavailable merely because their proofs are deep. No missing theorem is excused here by an invented free Prop carrier or a sorry'd definition. Actual simplicity of the supporting definitions and the elaborated binder lists remain package-stage checks.

All 17 “Lean names found nowhere” in the supplied citation report are intended new roadmap declarations listed or described by the design, not claimed pinned library declarations. Their absence is not a missing-library finding. No actual sorried theorem exists in this design, so there are zero one-tactic probes to run and no #check output to compare. Reading-based padding audit confirms that the three removed scattering identities are API and that the remaining claimed headline results require substantive constructions/arguments, rather than computing a README Check. This does not certify the as-yet unwritten acceptance file's imports, binders, defaults, warnings or padding.

## Not verifiable

- Alexander1976, pp.217–232 and the Proposition4.3 attribution through GST2013: the manifest records bot protection; original text is settled uncertified. Its attribution in GST's bibliography is readable and was checked (R13).
- AlexanderThesis1975, Chapter1: the manifest records an institutional HTTP403; settled uncertified. GST2013 identifies it as reference [1] and attributes the complete proof there; the original was not read.
- Lanford1975, convergence theorem; CIP1994, Chapters2 and4; Spohn1991, PartI: settled uncertified/paywalled. No renewed request was made. Lanford's alleged Proposition4.3 locator cannot be certified and its claimed secondary attribution is demonstrably wrong.
- Uchiyama1988, pp.245–297: settled uncertified after bot protection. Used only as background here.
- Lean elaboration, one-tactic execution, inferred #check signatures and “sorry is the only warning”: **not available (this lane does not elaborate; say so in the report)**. There is no `Suggested.lean` in the package. No passing build is claimed.
- The random finite-difference experiment at §4.3 cannot be reproduced: no inputs or step sizes are recorded. It should be replaced (R11), not taken as evidence.
- The full Lanford convergence proof in GST Chapters5–6 and the original works was not independently reconstructed. The relevant statements and hypotheses, the variance implication, and the equilibrium specialization were checked. The design only owns the proposition and its consequence.

## Source issues

- **Gap** in GST2013 at Proposition4.1.1 proof, printed p.28: the source uses invariance of phase volume during the step construction without establishing it there; it should justify preservation for the two-body step before iteration; affects the proof.
- **Gap** in BGSS2023 at Corollary1.2.1 proof, (1.2.7), printed p.5: the source infers convergence of integrated moments from almost-everywhere correlation convergence alone; it should also invoke uniform integrability, supplied by suitable correlation bounds and controlled tests; affects the proof.
- **Error** in DengHaniMa2024 at Proposition1.2(3), printed p.4: the source calls the fixed-time hard-sphere maps diffeomorphisms after deleting one closed null set; it should assert measure-preserving bijections with smooth collision-itinerary pieces and account for velocity jumps; affects a stated result.
- **Error** in BGSS2023 at Remark6.1.2, printed p.59: the source calls the inhomogeneous equilibrium transport-collision semigroup self-adjoint; it should say contraction semigroup, with transport skew-adjoint and the collision part self-adjoint; affects a stated result.
