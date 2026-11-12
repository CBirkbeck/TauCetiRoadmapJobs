# Review of ComplexHessianEquations (design, round 3)

**Verdict:** needs changes

Seven findings: two P1, three P2 and two P3; five blocking. The design is repairable. Reviewed all 48 plan targets (35 theorems, 12 definitions and one example), their APIs, the README, the 19-entry manifest, the previous review and repair report. No design or manifest entry was changed. This is a design review, not a package acceptance or a successful Lean build.

## Previous findings and repairs

The following checks preceded the new adversarial pass. Quotations are from `packages/ComplexHessianEquations/design/README.md` unless another file is named.

| Round-2 finding | Actual repaired passage and verification | Status |
| --- | --- | --- |
| R01, wrong Schauder supplier | Line 92: “§5.6 (E25), the interior Schauder estimate for non-divergence equations”. Main's PDE §5.6 at line 2097 supplies precisely this estimate; §§5.2, 6.5 and the plan use it. | Repaired. |
| R02, duplicate ABP gap | Line 91: “§3.2 (C13), the Aleksandrov–Bakelman–Pucci estimate”; the contract includes global integrability and the boundary shift. The ABP gap is absent from the plan. For the actual compact coordinate-ball application, the weighted forcing is bounded. | Repaired. Removing the unused residual extension is justified: the roadmap still consumes the general supplied ABP theorem. |
| R03, K3 ownership | Line 707: “with its own continuity method and estimates”; line 15 explicitly identifies the specialization and says §6.6 does not import K3Surfaces. Open #1285 still owns that construction at `TauCetiRoadmap/K3Surfaces/README.md:533`. | Not repaired externally; settled as not actionable in this package, as the repair report requires. Its reason is correct: changing that head is outside this worker's authority. No new finding re-raises it. |
| R04, additive constants in full norms | Line 538: “if `sup_X φ = 0`”; the dependence is now on `C³` data and `C^{max(3,k+1),α}` data. The mean-zero adapter is explicit. Constants `φ=M` become zero after supremum normalization. | Repaired. |
| R05, slice factor | Line 578: “`Δ_t v_ξ(t) = 2·H_{i∂∂̄u}(ξ, ξ)`”. The quadratic Check at line 587 gives `4=2·2=4·1`. | Repaired, including the plan. |
| R06, degree and index guards | Line 208: “for `1 ≤ k ≤ n`”; line 222: “degree `m ≥ 1`”; adjacent nesting at line 224 has `2 ≤ k ≤ n`. The constant derivative of a linear polynomial is retained. | Partly repaired. The main statements are correct, but `isHyperbolic_sigma` still lacks its index guard in the plan (new R05). |
| R07, tangent differentiability | Line 246: “a point where `g` is differentiable”. The `min` counterexample and the extension in the other argument to the closed Hessian cone are present. | Repaired. |
| R08, unstated curvature identities | Lines 493–495 now display the trace, logarithmic trace and Calabi identities, including `K`, `G`, `Y`, `Θ` and `Q`. Direct nonconstant tests below agree with the identities. | Partly repaired: the identities are supplied, but the added universal scaling claim is false (new R01). |
| R09, invalid radii and singular controls | Line 582: “`R/2 < r < R' < R`”; line 584 uses outer radius `R/2` after recentering. Lines 585 and 588 now use smooth regularizations. | Repaired. Pole distance, mass and both Hessians were recomputed. |
| R10, hyperbolicity Checks | Lines 236–239 now test `xy`, `x²+y²`, `x+y` and a positive constant. | Repaired. The same missing-README-Checks pattern persists for the admissible-cone definition (new R07). |
| R11, manifest target references | `packages/ComplexHessianEquations/sources.toml:20,153,172` now cite the extant spectral sections. A parsed check of every purely numeric `cited_for` entry found zero unresolved IDs. | Repaired. Separate internal cone-Check references remain stale (new R07). |
| R12, pins and native inequalities | Lines 41 and 53 give the actual Mathlib and Tau Ceti revisions; lines 58–61 name the pinned eigenvalue and submean declarations. Line 55 identifies `SmoothTwoForm` as an abbreviation. | Repaired. Each named declaration was opened at the pin. |

The scope/order qualification for K3 is recorded below without treating an external hand-off as completed. Searches for the other repaired patterns found no recurrence of the factor-four slice identity, unnormalized full Hölder bounds, unqualified spectral monotonicity, or use of closed sublevels as right-continuous functions. The additional plan index occurrence and the remaining Check defects are reported explicitly.

## R01 (P1) — The curvature identities do not all have degree minus one

**Location.** `packages/ComplexHessianEquations/design/README.md:497`: “Each identity holds for every pair of Kähler metrics and is homogeneous of degree `−1`”. Also `packages/ComplexHessianEquations/design/plan.json:1537`.

**Claim.** Every displayed identity scales by `c⁻¹` under simultaneous scaling of the two metrics.

**Witness.** In the torus Check at line 505, put `a=1/2`, `x=0`. Then `Δ' S=32π⁴`; doubling both metrics gives `8π⁴`, whereas the claimed degree gives `16π⁴`.

The discrepancy is exact: `h`, `T` and the connections are unchanged; `S` has degree `−1`, and applying the scaled Laplacian contributes another `c⁻¹`. The Ricci-form identity and the endomorphism-valued curvature-difference identity instead have degree zero. Line 491 already asserts that the Ricci form is invariant under constant scaling.

**Exact repair.** Replace the universal degree claim in both files with the actual dictionary: Ricci forms, endomorphism-valued curvature and `∇̄'T` have degree zero; the trace and logarithmic trace identities have degree `−1`; the Calabi identity has degree `−2`. Keep `S`, scalar curvature and scalar Laplacians of degree `−1`. Explain the source conversion separately for these three groups. Add the doubled-metric torus Check: `32π⁴/4=8π⁴`, and keep the existing CP¹ check `Ric(2ω)=Ric(ω)`. The formulas themselves need no change on this evidence.

## R02 (P1) — The signed entropy moment is not bounded by Ent alone

**Location.** `packages/ComplexHessianEquations/design/README.md:669`: “`V⁻¹ ∫ F e^{nF} ω_X^n ≤ Ent_{p'}(F)`”.

**Claim.** Normalization and `p'≥1` imply the displayed inequality used in the Jensen step.

**Witness.** On the flat complex three-torus take `q=1−0.03 cos(2πx₁)`, `F=(log q)/3`, `p'=3`. The normalized signed moment is approximately `0.00007500844`; `Ent₃(F)` is approximately `0.00000042449`.

This is actual solution data, not an arbitrary probability model: for the Monge–Ampère pair, `φ=0.03(cos(2πx₁)−1)/(2π²)` has supremum zero and determinant density `q=e^{3F}>0`. The normalized volume average of `q` is one. A numerical quadrature is unnecessary to establish the strict inequality: convexity of `q log q−(q−1)` gives the signed moment at least `0.03²/(12·1.03)>0.0000728`, whereas `Ent₃≤(−log(0.97)/3)³<0.00000105`.

The same incorrect step occurs in `gpt2023 line 730–735`, proof of Theorem 3, p.16. It is a source error inherited by the design, not a defect in Jensen's inequality or the headline estimate.

**Exact repair.** Use `V⁻¹∫ F e^{nF}ω_X^n ≤ Ent₁(F) ≤ 1+Ent_{p'}(F)` for normalized `F` and `p'≥1`. The second inequality follows from `|F|≤1+|F|^{p'}`. Carry the additive constant through the Jensen argument and record the smooth small-density example as a negative control. On the witness the repaired right side is `1.00000042449`, so the bound holds and the claimed parameter dependence is preserved. Synchronize the explanation of plan target 8.5 if its proof route is expanded.

## R03 (P2) — The weak-Harnack contract needs representative and exponent hypotheses

**Location.** `packages/ComplexHessianEquations/design/README.md:93`: “`inf_{B_r} u`”; `packages/ComplexHessianEquations/design/plan.json:2286`: “`q > m/2`”.

**Claim.** The contract holds for nonnegative weak supersolutions as written, in every real dimension covered by its sentence.

**Witness.** On `B₄⊂ℝ²`, let `u=1` except `u(0)=0`, `a=I`, `f=0`, `r=1`. It is the constant weak supersolution, but the proposed inequality is `4π≤C·0`.

Weak derivatives and the `L¹` norm ignore the changed point; an ordinary infimum does not. The pinned homogeneous theorem explicitly has an almost-everywhere conclusion, `TauCeti/Analysis/PDE/Regularity/Harnack.lean:283–299`. Main's PDE §5.4 likewise uses essential extrema at `TauCetiRoadmap/PDE/README.md:1998–2002`.

There is a second endpoint omitted by the exact `needs` sentence: in real dimension one, `q=3/4` satisfies `q>m/2`. Set `u_ε(x)=sqrt(x²+ε²)−ε` on `(-4,4)` and `f_ε=u_ε''=ε²(x²+ε²)^(−3/2)`. These are smooth nonnegative solutions with infimum zero. On `(-2,2)` their `L¹` norms tend to `4`, whereas `‖f_ε‖_{L^{3/4}(-4,4)}=O(ε^{1/3})→0`. Thus even replacing the infimum alone does not fix the all-dimensional sentence.

**Exact repair.** Keep the same slug and supplier, and state the principal divergence operator and its sign explicitly: `div(a∇u)≤f`, equivalently `−div(a∇u)≥−f`, weakly on `B_{4r}`, `r>0`, `u∈H¹`, `u≥0` almost everywhere. Require `q≥1` and `q>m/2`, with finite `q` (or a separately stated `q=∞` convention), and use `ess inf_{B_r}u`. Make the uniform constant depend only on dimension, exponent and the ellipticity bounds. Synchronize README and the plan's `detail` and `needs`. This retains every dimension, including the valid one-dimensional `L¹` forcing endpoint. For continuous functions in §5.4, essential and ordinary infima agree. The altered representative now gives `4π≤C·1`; the smooth one-dimensional family is excluded at `q=3/4`, while at `q=1` its forcing norm tends to `2`, not zero.

This is a precision defect in a declared contract, not an unowned-prerequisite finding. The inhomogeneous contract is not discharged by the pinned homogeneous theorem.

## R04 (P2) — The generalized Newton–Maclaurin target is only named

**Location.** `packages/ComplexHessianEquations/design/README.md:208`: “the generalized Newton–Maclaurin inequality of spruck2005 Lemma 2.10”; `packages/ComplexHessianEquations/design/plan.json:363` ends with “generalized Newton–Maclaurin.”

**Claim.** Target 2.1 specifies this general inequality with exact hypotheses.

**Witness.** Neither file states its two sides or its four index conditions. `spruck2005 line 11279–11282`, Lemma 2.10, printed p.290, includes both `r≥k` and `s≥l`.

**Exact repair.** In both files state, in the roadmap's normalized notation, for `λ∈Γ_r`, `0≤s<r≤n`, `0≤l<k≤r` and `l≤s`,

`(S_r/S_s)^{1/(r−s)} ≤ (S_k/S_l)^{1/(k−l)}`.

Take `S₀=1`; all denominators are positive on this domain. At `(1,2,3)`, `(r,s,k,l)=(3,2,2,1)` gives `18/11≤11/6`; at `e` both sides are one. Omitting `l≤s` and using `(2,0,2,1)` instead gives `sqrt(11/3)>11/6`, showing why the omitted index information matters. Add these as positive and negative controls. A locator alone is not the theorem's signature.

## R05 (P2) — One hyperbolicity constructor still accepts the zero polynomial

**Location.** `packages/ComplexHessianEquations/design/plan.json:442`: “`σ_k is hyperbolic in e`”, the `isHyperbolic_sigma` API of target 2.2.1.

**Claim.** This API has no restriction on `k`; its target hypotheses mention only the degree of a general `p`.

**Witness.** At `n=1`, `k=2`, the roadmap's convention is `σ₂=0`. Thus `σ₂(e)=0`, contradicting the definition's strict requirement `p(e)>0`.

**Exact repair.** Add `1≤k≤n` to this constructor, matching README line 224 and plan target 2.2.3. Keep positive constants as the separate degree-zero case already specified. Add the out-of-range negative control to the plan/README hyperbolicity Checks. At `n=k=1`, `σ₁(e)=1>0` and `σ₁(x+te)=x+t` has root `−x`; at `k=2>n`, the repaired constructor is inapplicable. This is the remaining occurrence of round-2 R06's index-guard pattern, not a request to narrow the positive-degree theory.

## R06 (P3) — The torus Check violates the sorted-eigenvalue convention

**Location.** `packages/ComplexHessianEquations/design/README.md:514`: “`λ[ω_φ] = (1 − 2π²ε cos 2πx_1, 1)`”.

**Claim.** This is the decreasingly sorted relative eigenvalue vector fixed in the Conventions.

**Witness.** Set `ε=1/(4π²)` and `x₁=0`. The diagonal entries are `(1/2,1)`, but the sorted vector is `(1,1/2)`, not the vector printed in the Check.

**Exact repair.** Write the unordered spectrum as `{q,1}`, or give the sorted vector `(max(q,1),min(q,1))`, where `q=1−2π²ε cos(2πx₁)`. Retain the determinant density and oscillation calculation. At `x₁=0` the repaired vector is `(1,1/2)`; at `x₁=1/2` it is `(3/2,1)`. The plan's determinant-only Check is already correct.

## R07 (P3) — The admissible-cone Checks are incomplete and contain stale witnesses

**Location.** `packages/ComplexHessianEquations/design/README.md:257,274–278`, the cone definition and its grouped Checks; `packages/ComplexHessianEquations/design/plan.json:659,1293`: “the non-convex cone of 1.5”.

**Claim.** The admissible-cone definition has its own API and three discriminating README Checks, and the plan's cone counterexamples identify the required open-positive perturbation.

**Witness.** The three §2.4 Checks concern pairs/functions; none tests a failure of the cone definition. The cone example is in §1.4, not §1.5. At plan line 1293, `(0,0.25)∉Γ₂`.

**Exact repair.** Bring the cone API and its three tests from plan target 2.4.1 into §2.4 as prose: the Hessian cones are admissible; binary (or nonempty finite) intersections preserve admissibility; every member has positive coordinate sum. Give three actual cone Checks: `Γ₁` contains `(1,−1/2)` with sum `1/2`; `{λ_i>−1}` fails dilation since `(-1/2,1)` belongs but `3(-1/2,1)` does not; and the open symmetric nonconvex cone of §1.4 contains `(1,−0.4)` and `(1,0.1)` but not their midpoint `(1,−0.15)`. Correct both plan references to §1.4. For the failure of `Γ+Γ_n⊆Γ`, replace the increment by `(0.01,0.25)`: both coordinates are strictly positive, and the sum `(1.01,−0.15)` is outside the displayed cone. Thus the revised test directly checks the stated hypothesis, without relying on its separate closed-cone consequence.

## Verified sound

### Principles, scope and shape

The eight layers build a general library: real/complex spectral calculus; general homogeneous hyperbolic polynomials; Hessian and quotient cones; general Hermitian comparison; Kähler linear analysis; Yau existence; local/global exponential integrability; and entropy/energy bounds on fixed and degenerating backgrounds. No route-specific prime/parameter shortcut or computational algorithm was found. No existing ComplexHessianEquations roadmap was located in the supplied main/open indexes. This is new work, with the Hermitian existence and torsion-dependent extensions explicitly assigned to a Part II. The K3 overlap is the settled external matter above.

The organization is mathematical, and its layer order is forced by the named inputs: spectral derivatives before cone applications; those before the equation and comparison; linear analysis before continuity; Yau and exponential integrability before auxiliary-equation estimates. No sentence adopts a source's organization. The source-like C⁰/C²/C³ order has explicit dependencies (§6.3 needs §6.2; §6.4 needs §6.3; §6.5 needs all three). Within Layer 2, §2.1 uses the raw cone definition, whereas §2.2's cone characterization uses the polynomial identities; these are distinct inputs, as plan targets 2.2.2 and 2.2.3 make explicit, rather than a theorem cycle.

All eight layers have Examples and Dependencies, and every target has prerequisites in the plan. All 12 plan definitions have APIs and at least three tests (counts range from 3 to 7); README coverage is grouped by mathematical topic, with R07 the missing cone-definition coverage. The hyperbolicity definition now has its own discriminating examples. R04 is a theorem still lacking its actual statement. No process dates, pull-request IDs, local machine paths, HTML anchors, LaTeX delimiters, executable procedures, or unexplained computational certificates were found in the candidate README. Notation in code spans is mathematical notation, not a claim of an existing Lean declaration. No declaration names of this roadmap are advertised as present in an absent Lean file.

I read the shapes and relevant sections of main's ComplexKahlerGeometry, DifferentialGeometry and Yamabe. Their unrelated deficiencies are not instructions or findings against this candidate. No instructions embedded in inspected source/review/roadmap text were followed.

### Computed adversarial table

Every target and API was read. The preceding round's computed rows were reused only for unchanged claims they actually instantiate; name-only summaries were not treated as evidence. The table below records fresh sampled/changed/headline tests and the principal retained computations. It tests both directions of equivalences, signs, zero and boundary indices, normalization, nonsmooth and disconnected controls. These computations are evidence about the proposed statements, not proofs of their full generality.

| Statement | Instances tried | Computed values on the two sides / defining values | Result; change |
| --- | --- | --- | --- |
| Conventions: Hermitian form, complex Hessian, Laplacian | Standard ℂ, `u=|z|²`, then `u=x²`; metric doubled | First: `H(∂x,∂x)=2`, `Δ_ωu=2`, `Δ_Ru=4`; second: `1,1,2`; doubling the metric changes relative eigenvalue `2→1` | Signs and factor two agree with CKG. |
| §1.1 relative eigenvalues and representing operator | Gram `diag(2,1)`, form `diag(2,3)`; non-Hermitian skew matrix | Relative spectrum `(3,1)` versus Euclidean `(3,2)`; negative form gives `(−1,−3)`; skew matrix gives `±i` | Reference metric and Hermitian restriction discriminate. |
| §1.1 shifts, characteristic polynomial, invariance | `A=diag(1,2,3)`; scalar shift 1; unitary permutation | `det(I+tA)=1+6t+11t²+6t³`; shifted sorted list `(4,3,2)`; permutation preserves `(3,2,1)` | Correct, including constant coefficient 1. |
| §1.1 monotonicity/Lipschitz | `diag(3,0)≤diag(3,1)`; zero versus off-diagonal matrix with entries ε≥0 | `(3,0)≤(3,1)`; eigenvalue distance and operator norm both `ε` | Sup-norm constant 1; cross pairing `3≤1` false. |
| §1.2 trace bounds | `F=diag(2,1)`, `B=diag(0,3)`, then `−B` | `3≤tr(FB)=3≤6`; at `−B`, upper bound `−3≤−3` | Both directions supplied by one native inequality. |
| §1.2 gap, derivative, full rank | `T=diag(3,1,1)`, perturb `t diag(0,1,−1)` | `κ₁=3`, derivative 0; `κ₂=4+|t|`, derivatives −1/+1; `κ₃=tr`, derivative `tr H` | Gap necessary; full-rank case has only projection I. |
| §1.2 subadditivity | `diag(1,0)+diag(0,1)` | `κ₁(sum)=1≤2=κ₁(A)+κ₁(B)` | Strict example. |
| §1.3 Lewis gradient and converse | Determinant at `[[2,1],[1,2]]`; maximum eigenvalue at I | Gradient `[[2,−1],[−1,2]]`, not `diag(1,3)`; maximum along `diag(t,0)` is `1+max(t,0)` | Eigenbasis transport and differentiability iff supported. |
| §1.3 C¹, scalar shifts, quadratic spectral function | `f=Σμ_i²`, `T=[[0,1],[1,0]]`, shift `tI` | `F=2`, gradient `2T`; `F(T+tI)=2+2t²=f(1+t,−1+t)` | Simple smooth test spans repeated/crossing eigenvalues. |
| §1.4 spectral convexity and concavity | `sqrt(det)` at `diag(4,1)`, `diag(1,4)` | Endpoint values `2,2`; midpoint `2.5≥2`; gradient at `(4,1)` is `(1/4,1)` | Concavity and reversed derivative ordering correct. |
| §1.4 monotonicity hypotheses | `S=diag(1,0)≤T=diag(2,0)`; `σ₁`, `−σ₁`, zero | `1<2`; `−1>−2`; `0=0` with `S≠T` | Weak/strict ellipticity guards necessary. |
| §1.4 nonconvex domain | Cone in line 175; two specified diagonal matrices | Endpoints `(1,−.4),(1,.1)` inside; midpoint `(1,−.15)` outside | Convexity assumption discriminates. |
| §1.5 determinant, Euler, trace AM–GM | `sqrt(det)` at `(1,4)`; `A=diag(1,4)`, `B=I,A⁻¹` | Gradient product `1/4`; Euler `1+1=2`; trace bounds `5≥4`, `2=2`; determinant alone gives Euler `8=2·4` | Homogeneity and equality condition correct. |
| §2.1 recurrence, derivative, zero degree | `n=k=1, λ=1`; then `k=0` | Allowed: `1=1·1+0`, derivative `1=1`; unguarded zero index would give `1=2`, `0=1`; actual `Dσ₀=0` | Previous guard repair works. |
| §2.1 Newton, Maclaurin, shift | `(1,2,3)`; `(1,0,0)`; `λ=e,t=1,n=3,k=2` | `12≤121/9`; `2≥sqrt(11/3)≥cuberoot(6)`; off-cone equality `0=0`; shift `12=3+6+3` | Equality restriction to positive cone correct. |
| §2.1 generalized Newton–Maclaurin | `(1,2,3)`, indices `(3,2,2,1)`; omit `l≤s` | `18/11≤11/6`; invalid indices `(2,0,2,1)` give `sqrt(11/3)>11/6` | R04 states the missing target. |
| §2.2 hyperbolicity and degree | `xy`, `x+y`, `x²+y²`, positive constant | Roots at `(2,−1)` for `xy`: `−2,1`; linear derivative `2`; quadratic restriction `t²+1` roots `±i`; constant derivative `0` | Positive-degree claims exclude the constant; linear terminal derivative retained. |
| §2.2 cones and both directions of identification | `(3,3,−1)`, `(2,2,−1)`, `−e` | Symmetrics `(5,3,−9)`; boundary `σ₂=0`; at `−e`, `σ₂=3` but `σ₁=−3` | Positivity of top polynomial alone does not identify Γ₂. |
| §2.2 out-of-range constructor | `n=1,k=2` versus `k=1` | `σ₂(e)=0`, required `>0`; `σ₁(e)=1`, root `−x` | R05. |
| §2.3 quotient concavity and tangent | `σ₂/σ₁` at `(4,1),(1,4)` and midpoint; `sqrt(σ₂)` tangent | `.8,.8,1.25`; tangent `2≤4.25`; at boundary `μ=(1,0)` mixed inequality gives `4≥0` | Positive denominators and closure extension correct. |
| §2.3 nonsmooth tangent | `g=min`, base `(1,1)` then `(1,2)`, target `(2,1)` | Total derivatives at first base would yield `1≤0`; smooth base yields `1≤2` | Added differentiability excludes the bad model. |
| §2.4 cone definition | Positive half-space; shifted quadrant; nonconvex cone | `(1,−.5)` sum `.5`; dilation `(-.5,1)→(-1.5,3)` leaves shifted quadrant; cone midpoint excluded | R07 ports actual discriminating cone Checks. |
| §2.4 pair, structural determinant, combinations | `σ₁−ε|λ|`, `ε=.5`, `λ=(1,−.9)`; MA `(1,4)`; derivative vectors `(1,4),(4,1)` | Value `.1−.5sqrt(1.81)<0`, partials positive; MA product/determinant `1/4=1/4`; combination `sqrt(25)=5≥2+2` | Positivity is correctly restricted to Γ_n; constants agree. |
| §2.5 sharp constants | `n=3,k=2, λ=e`; `k=1,n` | Partials `1/sqrt(3)`, product `3^(−3/2)`; endpoints `1` and `n^(−n)` | Sharp constant attained at e. |
| §2.5 pure quotients | `n=2,(ε,1)`; `n=3,(M,1,1)` | Products `ε²/(1+ε)⁴→0`, `3(M²+M+1)²/(M+2)⁶∼3/M²→0` | Pure quotient not asserted structural. |
| §3.1 chain rule, pullback and maximum | `u=x`, `γ=u²`; `u=−|z|²`; saddle `x²−y²` | Chain term `2i∂x∧∂̄x=dx∧dy`; negative quadratic Hessian `−2h`; saddle Hessian `0` without a maximum | Correct sign and no false converse. |
| §3.2 forms, mixed inequality, volume | `n=2`, eigenvalues `(4,1)` and β=ω; α=0 | `α∧ω/ω²=5/2≥2`; `α²/ω²=4`; `ω²=2dvol`; zero gives `0≥0` | Binomial/factorial normalization consistent. |
| §3.3 equation, positivity iff, constants | `χ=ω,F=0`; `F=a`; `χ=2ω,n=1` | Constants `1`, `binom(n,k)^(1/k)`, `n`; MA `c=e^(−a)`; curve `c=2` | Both equation dictionaries and normalization agree. |
| §3.4 volume, energy, entropy | `χ=0` and `χ=ω_X`; constant F | `V_t=t^nV` or `(1+t)^nV`; MA ratio `1/V`; mass bound `e^{na}≤e^{na}|a|^p+e^n`; energy at zero `0` | `t>0` excludes zero denominators. |
| §§4.1–4.2 comparison and uniqueness | `ψ=−|z|²/4,φ=0,χ=ω`; disconnected constants | Relative values `.5≤1`; on two components both `(0,0)` and `(0,−1)` have supremum 0 | Comparison sign correct; connectedness necessary. |
| §5.1 Laplacian and Green signs | Unit square torus `u=cos(2πx)`; conformal non-Kähler `ρ=u=x₁` | `Δ_ωu=−2π²u`; normalized energy `∫uΔ_ωu=−π²`, `∫|∂u|²=π²`; conformal discrepancy `−e^(−x₁)` | Kähler equality not asserted generally. |
| §5.2 inverse, Schauder and compactness | Cosine; `j^(−α)sin(jx)`; `−u''=|x|^α` | Inverse `−cos/(2π²)`; sup tends 0 but Hölder quotient stays `(2/π)^α`; `[u'']_α=1` | Mean-zero and exponent-loss requirements retained; E25 resolves. |
| §5.3 Poincaré/Sobolev | Circle length `2π`, `u=sin`; real dimension 4 | Squared norms `π=π`, first eigenvalue 1; exponent `2·4/(4−2)=4` | Correct geometric specialization. |
| §5.4 supremum-normalized L¹ | CP¹ logarithmic family; constant `−M` | With area `2π`, limiting integral `2π`; without normalization, integral `2πM` | Local Hermitian proof has correct normalization. |
| Weak-Harnack gap | Change constant at one point; `m=1,q=.75,u_ε` | First proposed sides `4π` and `0`; second `L¹→4`, forcing norm `O(ε^(1/3))→0` | R03; neither test is removed by ellipticity. |
| §6.1 trace identity | Torus `a=.3`, `x=0,.1,.25` | `8.459660915=8.459660915`; `6.326210043=6.326210043`; `0=−1.776528792+1.776528792` | New identity correct in nonconstant cases. |
| §6.1 Calabi identity, including nonzero Θ and Q | Same torus, `x=.1` then `.25` | `−87.22397209=30.55019770+48.16996799−156.13563542−9.80850236`; `−32.26189095=12.62421820+3.15605455−51.19821825+3.15605455` | Signs of both lower-order terms tested, not just T=0. |
| §6.1 curvature/scaling | CP¹, hyperbolic curve; torus a=.5 at x=0 and scale2 | CP¹ `Ric=2ω`, scalar/B `2→1`; curve `K=−1=−Λ·q/q`; Calabi `32π⁴→8π⁴`, not `16π⁴` | R01 corrects universal scaling. |
| §6.2 C⁰ and eigenvalue Check | Torus `ε=1/(4π²)` | `osc=1/(2π²)`, `sup F=log(3/2)`; at x=0 actual sorted eigenvalues `(1,.5)` versus claimed `(.5,1)` | Estimate/data correct; R06 fixes ordering. |
| §6.3 C² | Eigenvalues `(4,1/4)` | Trace `17/4`; determinant 1; lower eigenvalue `1/4=1/4`; reciprocal trace `4/17≤17/4` | Metric-equivalence inference retains lower-density dependence. |
| §6.4 C³ | `q=1−2π²εcos(2πx)` | `∂_zq=2π³εsin(2πx)`, `S=q'²/(2q³)=O(ε²)`; at ε=0, S=0 | Three-derivative data dependence agrees with sources. |
| §6.5 full norms | `F=0,φ=M`; mean-zero `εcos`; k=0,5 | Unnormalized norm ≥`|M|`; supremum normalization gives zero; `sup=ε≤osc=2ε`; required data order `3,6` | Previous norm repair works. |
| §6.6 Yau existence and normalization | Constant F=a; n=1 cosine; two components | `b=−a`, φ=0; `b=−log I₀(ε)=−ε²/4+O(ε⁴)`; unequal component mass ratios need unequal b | Global and curve endpoints consistent; K3 specialization has `e^b=∫ω²/∫V`. |
| §7.1 disc bound and harmonic case | M mass bound; v=−A | `αM/(2π)≤1<2`; kernel integral bound `2π(2R')²/(2−αM/(2π))`; harmonic integral `πr²e^{αA}` | Denominators positive; M=0 handled separately. |
| §7.1 repaired logarithmic examples | R=1,r=.75,R'=.875; recenter at .25 with outer radius .5 | Pole lies in both inner discs; M=`2π`; exponent `.0963225`; recentered product `α₁c=.207519` | Both below integrability threshold 2. |
| §7.1 slicing and radial integration | `u=|z|²−4`; g=1,n=1 | Slice Laplacian `4=2·2`; polar factor `(1/(2π))(2π)(πr²)=πr²` | Correct factor and covering radii `1+.25=1.25<1.5<1.75`. |
| §7.1 smooth positive/negative controls | Log regularization; `−(r²+ε)^(−1/2)` in ℝ⁴ | Log limit integral finite iff `αc<n`; second Δ=`(r²+4ε)/(r²+ε)^(5/2)>0`, radial complex Hessian changes sign at `r²=2ε`; exponential limit diverges | Psh hypothesis discriminates within smooth inputs. |
| §7.2 global exponential bound | CP¹ family, background doubled | Limiting radial integrand `r^(1−2α)`, integrable iff α<1; doubling potential changes threshold to α<1/2 | Correct dependence on background; Hermitian extension uses §§5.4,7.1. |
| §8.1 auxiliary equation, sublevels and denominator | Zero solution; minimum level; explicit curve q=1−a cos | A_s=0 in first two excluded cases; for `φ=a(cos−1)/(2π²)`, choose `s=a/(2π²)` and MA: `A_s=a/(2π³)+a²/(8π²)>0` | Nonzero test as well as excluded 0/0 cases. |
| §8.2 extinction | Step `1_[0,1)`; exponential `e^(−s)` | Step satisfies `rφ(s+r)≤φ(s)`; exponential ratio `r exp(δs−r)/B→∞` for δ>0, but ≤1 at δ=0,B=1 | Strict positive exponent essential. |
| §8.3 degenerating estimate and strict sublevels | Plateau at −ε; p=n,2n; χ=ω_X,F=0 | Closed mass at ε is a>0 versus right limit0; strict mass/right limit both0; δ=0 or `1/(2n)`; constant solution bound0 | Right-continuity fix and critical exponent correct. |
| §8.4 MA specialization | χ=ω_X,F_t=0; arbitrary t>0 | `c_t^n=(1+t)^n`, `V_t=(1+t)^nV`, energy0; ratio `1/V` | Correct uniform volume/energy setup. |
| §8.5 ABP realification | Hermitian coefficient diag(2,3) | Real coefficients diag(1/2,3/4,1/2,3/4); determinant `9/64=4^(−4)·6²` | Dimension/factor in repaired ABP route correct. |
| §8.5 entropy and endpoints | Smooth n=3 solution of R02; p'=n/2,n | Signed moment `.00007500844` versus Ent₃ `.00000042449`; subcritical power2; critical case permits N=1 | R02; theorem's parameter dependence survives +1. |
| §8.6 fixed background | χ=0,t=1,c=1; n=1,F=0 | V₁=V; equation `1+Δφ=e^F`; E=0 and sup absolute value0 | Correct endpoint and energy transfer from §8.5. |
| §8.7 Hessian L^q threshold | n=2,k=1,q=3; k=n | q'=3/2<2; `∫r^(3−2p')dr` finite iff p'<2; k=n permits every finite p' from §7.2 | Correct conjugate threshold. |

For the nonzero §8.1 row, the normalized curve has `φ=A(cos θ−1)`, `A=a/(2π²)`, density `1−a cos θ`, and `s=A`. Integrating `A(−cos θ)(1−a cos θ)` over `cos θ≤0` gives exactly the displayed `A_s`; this also tests the chosen normalization without asserting an unknown numerical value for the theorem's unspecified constant.

### Source sample and manifest

All 15 seeded sections were checked against readable locators where available. All eleven certified texts were opened. The eight uncertified texts remain settled; none was requested again. There are no extra author-flagged unverified locators in the candidate. Every cited work has a manifest key, and no numeric `cited_for` entry is dangling. Preprint references identify the versions actually read, so the page numbers below are those versions, not inferred journal pages.

| Seeded section | Text, locator, hypotheses and outcome |
| --- | --- |
| 1.4 | `spruck2005 line 11066–11100`, Theorem 1.4 and Lemma 1.5, printed pp.285–286. Source treats real symmetric matrices, a symmetric cone and elliptic concave f. The roadmap's general convex-domain and real/complex versions have an explicit trace/separation proof and the native RCLike variational inputs; they are not silently attributed verbatim to Spruck. |
| 2.1 | `spruck2005 line 11257–11293`, Lemma 2.6, Proposition 2.7, Corollary 2.8 and Lemma 2.10, printed pp.290–291; `dinew-kolodziej2014 line 152–159`, p.4. Newton and Maclaurin agree; the equality restriction corrects a source error. Generalized inequality needs R04. |
| 2.2 | `spruck2005 line 11182–11235`, Definition 2.1, Theorem 2.2, Proposition 2.3, Corollary 2.4, pp.288–289; `dinew-kolodziej2014 line 139–164`, pp.3–4. Positive-degree, cone and derivative claims supported. R05 concerns the plan's remaining out-of-range constructor. |
| 2.3 | `spruck2005 line 11295–11320,11347–11365`, Theorem 2.11, Lemma 2.12, Proposition 2.15, Theorem 2.16, pp.291–292; `gpt2023 line 751–756`, p.17; `dinew-kolodziej2014 line 165–172`, p.4. The l=0 case is the already proved root concavity; the positive-l quotient and the differentiable tangent statements agree. |
| 2.5 | `gpt2023 line 90–93,770–776`, pp.3,17; `guo-phong2024 line 91–104`, p.3. The sharp constants are the roadmap's Maclaurin deductions. Domain Γ_max(k,p) and l<k correct the source's quotient example. |
| 3.3 | `gpt2023 line 66–70,107–111`, pp.2,3; `guo-phong2024 line 108–113`, p.3; `tosatti-weinkove2010 line 21–31`, p.1; `dinew-kolodziej2014 line 56–66`, equation (0.2), p.2. The normalized equation, positivity, c-power and binomial factors agree with the form identities. |
| 4.1 | `tosatti-weinkove2010 line 38–47`, Corollary 1, p.1, supplies the MA uniqueness application, not the full general-pair comparison as a separately numbered theorem. The roadmap explicitly proves that extension with the maximum Hessian sign and native monotonicity. |
| 5.4 | `guedj-zeriahi2005 line 255–274`, Proposition 1.7, p.6; `gpt2023 line 689–692`, p.16. GZ is Kähler/pluripotential; the roadmap's Hermitian/continuous-background extension has a local submean and finite-chain route. The Laplacian-subsolution form uses the declared contract, whose precision needs R03. |
| 6.2 | `pss2012 line 245–308`, Theorem 3, pp.8–9; `tosatti-weinkove2010 line 104–106`, p.3. Density is e^F, upper-density-only dependence is supported, n≥2 is explicit, and the curve case is separately linear. R06 only changes a sorted-vector Check. |
| 6.4 | `pss2012 line 1046–1081`, (7.1)–(7.7), Theorem 9, pp.26–27; `twwy2015 line 132–138`, p.3. Smoothness and background curvature/C³-data dependence are retained. New contractions in §6.1 pass the nonzero-Θ/Q calculation; scaling needs R01. |
| 7.1 | `demailly2012 line 1717–1736`, Chapter I §4.B, Proposition 4.22, printed p.37. Green–Riesz and the harmonic bound support the supplied one-variable proof. The local Hörmander text itself is uncertified; the roadmap gives its own disc-and-slicing deduction. |
| 7.2 | `pss2012 line 2946–2955`, Theorem 31, p.74; `gpt2023 line 280–289`, p.8. These give the normalized Kähler bound and attribution. The stronger Hermitian/continuous-background statement follows through the explicitly stated §§5.4,7.1 route, not by dropping a source hypothesis. |
| 8.1 | `gpt2023 line 198–302`, Lemma 1 and (2.3)–(2.11), pp.5–8. Dependence on n, background, χ, γ and energy agrees; the roadmap excludes zero A_s and introduces smooth positive density approximation for C² φ. The approximation must preserve the lower cutoff bound (e.g. approximate from above); this can be done by uniform approximation plus its error, without a new supplier. |
| 8.4 | `gpt2023 line 785–850`, Lemmas 5–6 and Theorem 4, pp.17–18. Mass ratio, Ent₁ energy control and q>n agree. For general χ use χ≤(a₀−1)ω_X as in §8.1; the source's χ≤ω_X reduction is a harmless background rescaling, with constants allowed to depend on χ. |
| 8.6 | `gpt2023 line 84–89,442–476`, Theorem 1 and proof via Theorem 3(c), pp.3,10–11. Smooth normalized F is explicit here, and the critical p'=n,N=1 route covers n=1. The Jensen step inherited by §8.5 requires R02. |

The source locators newly introduced by the repairs were also read: `pss2012 line 994–1016,1046–1064` for the actual curvature identities; `twwy2015 line 134–136` for the three derivatives of data; and `demailly2012 line 1534` for the C² subharmonic criterion. Lewis's headline was checked at `lewis1996 line 77–81,145–159,468–469` (Theorems 1.1/2.1 and the C¹ observation). OCR is imperfect, particularly in displayed Spruck/Lewis equations; readable text and independent calculations are distinguished from unreadable glyphs below.

### Pins, duplication and supplier resolution

The revisions in `lake-manifest.json` agree with the design: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Names were opened in those local pinned trees, not inferred from the resolver. The following is the declaration inventory and the relevant scope evidence:

- `Mathlib/Analysis/InnerProductSpace/Spectrum.lean:277,297,309,314,384`: `LinearMap.IsSymmetric.eigenvalues`, `eigenvectorBasis`, `eigenvalues_antitone`, `hasEigenvalue_eigenvalues`, `det_eq_prod_eigenvalues`. Native finite-dimensional RCLike spaces, a finrank equality, and a decreasing `Fin n` list. `Mathlib/Analysis/Matrix/Spectrum.lean:60,67,143,193,240` supplies the matrix equivalents; the matrix-indexed `eigenvalues` wrapper is a reindexing, while `eigenvalues₀` is sorted.
- `Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean:69,202,216`: `Multiset.esymm`, `MvPolynomial.esymm`, `aeval_esymm_eq_multiset_esymm`. These define the existing elementary symmetric objects; the roadmap uses them rather than declaring a replacement. Their out-of-range value is zero (the same file, line 76). `Mathlib/Analysis/Calculus/LocalExtr/Polynomial.lean:64` gives `Polynomial.card_roots_le_derivative`, with roots counted with multiplicity.
- `Mathlib/Analysis/MeanInequalities.lean:129`: `Real.geom_mean_le_arith_mean_weighted`, nonnegative entries/weights summing to one. `Mathlib/Analysis/Convex/Integral.lean:196`: `ConvexOn.map_integral_le`, probability measure, continuity on a closed convex set, a.e. membership and integrability of both terms. In §7.1, truncation and the kernel integral justify the latter before passing to the limit.
- `Mathlib/Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean:118`: `HasStrictFDerivAt.toOpenPartialHomeomorph` takes a continuous linear equivalence as derivative. `Mathlib/Analysis/Calculus/Implicit.lean:450–465` confirms the separate finite-dimensional-target scope of `implicitFunction`. `Mathlib/Topology/UniformSpace/Ascoli.lean:474` supplies the equicontinuity/pointwise-compactness theorem, not compactness at the same Hölder exponent.
- `Mathlib/Analysis/Convex/Function.lean:59`, `Analysis/Calculus/FDeriv/Defs.lean:123`, `Analysis/Calculus/ContDiff/Defs.lean:471`, `Topology/Order/LocalExtr.lean:69`: `ConcaveOn`, `HasFDerivAt`, `ContDiffOn`, `IsLocalMax`. Concavity contains the convex-domain condition but not differentiability. `Mathlib/Geometry/Manifold/IsManifold/Basic.lean:777` is the chart-transition groupoid class; Hausdorffness, second countability and a boundaryless model are separate requirements, stated in the roadmap.
- `TauCeti/Analysis/InnerProductSpace/CourantFischer.lean:251,363,440,479`: `LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner`, `eigenvalue_mono`, `abs_eigenvalue_sub_eigenvalue_le`, `abs_eigenvalues_sub_le_opNorm`. The kth decreasing eigenvalue uses a supremum over `(k+1)`-dimensional subspaces and an infimum over unit vectors. These match the rewritten contracts, including dimension/index hypotheses.
- `TauCeti/Analysis/InnerProductSpace/HoffmanWielandt/Basic.lean:78`: `LinearMap.IsSymmetric.re_trace_comp_le_sum_eigenvalues_mul_eigenvalues`, two decreasing lists. `TauCeti/Analysis/InnerProductSpace/KyFan.lean:489`: `LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues`, an orthonormal family with its cardinality bounded by dimension. The file's singular-value `kyFanSum` is not the signed-eigenvalue differentiability target.
- `TauCeti/Geometry/Manifold/TwoForm/Basic.lean:37`: `SmoothTwoForm` is literally `SmoothForm I M ℝ 2`. `TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean:174,202,231`: `Tames`, `Invariant`, `Compatible`; the latter has exactly invariance and tameness fields, no closedness or integrability of J. The candidate supplies those separately where needed.
- `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82`: `riemannianVolume`. `TauCeti/Geometry/Manifold/DifferentialForm/Dolbeault/Basic.lean:86,95` and `Dolbeault/ComplexManifold.lean:150–176` supply smooth ∂/∂̄ and their identities. Their smooth carrier does not itself implement the planned C² continuous-form adapter.
- `TauCeti/Analysis/InnerProductSpace/Harmonic/MeanValue/Basic.lean:464`: `le_setAverage_ball_of_laplacian_nonneg`, with C² interior, continuous closure, positive radius and nonnegative Laplacian. `TauCeti/Analysis/PDE/Regularity/Harnack.lean:283`: the homogeneous weak Harnack theorem, with measurable elliptic coefficients, H¹ data, nonnegativity and an a.e. conclusion on enlarged balls. It is not the scalar-forcing contract of R03.
- The DifferentialGeometry names also resolve at the pin: `TauCeti/Geometry/Manifold/DifferentialForm/Integration/BoundarylessStokes.lean:122`, `integralTopForm_mextDeriv_eq_zero`, with compact support and boundarylessness; `TauCeti/Geometry/Manifold/Riemannian/Laplacian.lean:238`, `Manifold.laplaceBeltrami=divergence(mgradient)`; `Riemannian/VolumeForm.lean:55`, `riemannianVolumeForm`; `Riemannian/DivergenceTheorem.lean:312`, `Manifold.integral_mul_laplaceBeltrami`, with the negative energy sign. The candidate's complex-Laplacian and factorial-volume bridges are additional statements, not replicas of these real theorems.

Object searches covered the two pinned libraries, main, the board-package index and open roadmap heads through `roadmaps grep`. The matches for real Monge–Ampère measures/transport, Euclidean Poincaré and measurable continuous functional calculus have different objects from the complex equation, compact-manifold adapter and Lewis derivative. No additional owner of the general Gårding polynomial theory, relative spectral derivative or complex-Hessian entropy estimates was found. The three indexed board packages concern other subjects; no absence claim was based solely on this checkout's package folders.

All cross-roadmap contracts were resolved afresh against the supplied main checkout:

| Supplier | File and section opened | Result |
| --- | --- | --- |
| ComplexManifolds | `TauCetiRoadmap/ComplexManifolds/README.md:172,197`, Milestones 1–2 | Real scalar restriction, atlas transport and canonical complex orientation. |
| ComplexKahlerGeometry | `TauCetiRoadmap/ComplexKahlerGeometry/README.md:145–175,365,453,560,1134,2013,2321` | K-label mapping; native type/Dolbeault calculus; Chern connection with `h⁻¹∂h`; geometric spectral realization; normal coordinates and Kähler identities. The standard `h_T=2g` coefficient convention agrees with the candidate. |
| PseudodifferentialOperators | `TauCetiRoadmap/PseudodifferentialOperators/README.md:1337,1523` | §5.4 Hölder spaces and finite-atlas comparisons; §6.2 smooth-coefficient Schauder and Fredholm theory. Variable Hölder coefficients are correctly routed to PDE E25. |
| DifferentialGeometry | `TauCetiRoadmap/DifferentialGeometry/README.md:1735,2871,2896,2965` and its Layers 0–1 | Wedge/d, Stokes, div-grad sign convention, volume and Green identities; native implementations identified above. |
| Yamabe | `TauCetiRoadmap/Yamabe/README.md:113` | Y1.1 supplies the closed-manifold Sobolev embedding with real dimension at least three. Applying it at 2n excludes n=1, which §6.6 handles linearly. |
| PDE | `TauCetiRoadmap/PDE/README.md:1344,1403,1965,2097` | C13 strong maximum principle/ABP, E23 weak/strong Harnack setting, E25 non-divergence Schauder. R03 concerns the declared extension, not nonexistent section IDs. |
| Scope boundaries | `TauCetiRoadmap/OptimalTransport/README.md:764`; #848 `TauCetiRoadmap/ComplexComparisonPartII/README.md:3706,3751,3761–3768` | Real Monge–Ampère versus positive currents and local psh regularization. These are cited exclusions, not re-owned targets. |

Open-head ownership checks included #1023 RicciFlow (closed-manifold parabolic flow/curvature cones), #946 CalibratedGeometry (calibrations and special Lagrangian deformation), both #1854 and #1807 ComplexKahlerGeometry revisions (complex geometry and linear elliptic theory), and #1614 PDE. Existing-roadmap revisions were not substituted for main as suppliers. Their scope does not newly duplicate this nonlinear Kähler theory. Their historical K-label mappings preserve the candidate's citations. #1028 VariationalMethods, `TauCetiRoadmap/VariationalMethods/README.md:649`, owns an abstract compact-form kernel-orthogonal inequality; §5.3 here supplies the scalar compact-manifold identification using the geometric spectral theorem, not another abstract form construction.

The provided overlaps report lists no conflicting change to this candidate, no dropped cited ID and no ID defined only by an open revision. The direct `roadmaps overlaps ComplexHessianEquations` command cannot produce another report for a design-only candidate: it returned “no roadmap ComplexHessianEquations on main or in an open roadmap pull request”. Thus the provided candidate overlap report and inspection of its named heads are the overlap evidence, not a fabricated successful tool run.

K3 remains the one known ownership overlap: #1285, `TauCetiRoadmap/K3Surfaces/README.md:533`, expressly owns its nonlinear estimates/existence; line 186 excludes them from CKG's inputs. Substituting `n=2`, `F=log(V/ω²)` in §6.6 gives `e^b=∫ω²/∫V=c`. The repair report's external limitation is correct, and its candid replacement text is present. I do not assert the hand-off is complete or require this worker to edit that pull request. The candidate's available placement now precedes K3, so no upward supplier edge is introduced.

The required dependency check completed with exit code zero:

```text
candidate: ComplexHessianEquations is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 232 roadmaps, 2077 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Every Needs line was read, and the plan's target prerequisites resolve. The declared weak-Harnack slug occurs in both intake locations and has supplier PDE §5.4; its inhomogeneous part remains a real contract, subject to R03's corrected formulation. No `none` supplier, extra undeclared gap or cyclic ownership between this candidate's suppliers was found.

`roadmaps resolve` found no cross-roadmap citation or Lean name found nowhere. Its output explicitly says it did not check library names because it could not locate pinned Lake packages; the manual inventory above supplies that verification. Its live main/open index moved during this run, so the supplied local main checkout, specified pins and individually opened heads are the evidence for the exact line references, not a claim that every tool snapshot has the same commit.

### Headline acceptance test and padding

The README's headline inventory is: Ky Fan differentiability and Lewis's derivative/C¹ theorem (§§1.2–1.3); spectral concavity and ellipticity (§1.4); Gårding and Hessian-quotient concavity/structural constants (§§2.2–2.5); global uniqueness (§4.2); Yau existence and uniqueness (§6.6); uniform exponential integrability (§7.2); degenerating/fixed-background and Hessian L∞ estimates (§§8.3,8.6,8.7).

No `Suggested.lean` exists in this design package. Elaboration: **not available (this lane does not elaborate; say so in the report)**. No Lean command was run. There are zero sorried theorems to one-tactic-probe, zero declarations to compare by elaborated `#check`, and no existing import block, sorry'd data or `set_option` to audit. This is not a passing elaboration claim and does not exempt the eventual package.

The finite-dimensional headlines are statable on native polynomial/matrix/self-adjoint carriers with simple definitions and must be considered directly at package stage. The geometric headlines need a native-carrier assessment then; the existing smooth forms, Dolbeault operators, metrics and manifold derivatives above rule out a blanket claim that none of their carriers exists. Missing C² adapters or other genuinely unavailable carriers must be named per headline in the future module docstring. No stand-in or padding declaration is present now, and no absent package file is counted as a design defect.

## Not verifiable

- Eight works are settled as uncertified: `cns1985` §1; `kolodziej1998` §1; `gilbarg-trudinger2001` Theorems 3.5, 6.2, 8.18, 9.1 and Lemma 17.16; `yau1978` §2; `szekelyhidi2014` Chapter 3/Theorem 3.1; `ckns1985` Theorem 1; `tian1987` global α estimate; `hormander1990` Chapter IV. The recorded reasons are paywall, blocked legal PDF or no accessible legal text. Their contents were not guessed or requested again. Readable alternate texts and mathematical deductions are identified in the source table.
- Scrambled OCR glyphs in the Lewis/Spruck scans do not certify an exact displayed transcription. The legible theorem context, indices and independent calculations support the reported outcomes. No new unavailable source was discovered, and no missing-reference request was added.
- Lean elaboration, executable one-tactic probes and mechanically elaborated signature comparisons are unavailable in this design lane.
- External K3 ownership changes and future delivery of the declared PDE contract cannot be certified as completed. This review respects the previous repair report's settled external-action disposition.

## Source issues

- **Error** in spruck2005 at Proposition 2.7, printed p.290: the source says equality in Newton's inequality forces equal coordinates for arbitrary real tuples; it should restrict the equality assertion, since `(1,0,0)` has equality with unequal coordinates; affects a stated result.
- **Error** in gpt2023 at examples after Lemma 4, arXiv v1 p.17: the source assigns the quotient plus `cσ_p^(1/p)` to Γ_k for unrestricted p; it should use Γ_max(k,p), ensuring positivity of σ_p; affects a stated result.
- **Misprint** in gpt2023 at examples after Lemma 4, arXiv v1 p.17: the source allows k=l in the quotient exponent; it should require l<k; affects a stated result.
- **Gap** in gpt2023 at Lemma 1, equation (2.3), arXiv v1 p.6: the source invokes smooth Yau existence for a density constructed from a C² potential; it should use smooth positive approximations with compatible normalization and the needed cutoff inequality; affects the proof.
- **Gap** in gpt2023 at proof of Theorem 2, arXiv v1 p.9: the source calls the closed-sublevel mass continuous; it should use strict sublevels for right-continuity at levels of positive measure; affects the proof.
- **Gap** in gpt2023 at Theorem 1, arXiv v1 p.3 and proof p.10: the source states real F but begins its proof with smooth F; it should state the regularity or supply an approximation argument; affects a stated result.
- **Error** in gpt2023 at proof of Theorem 3(c), arXiv v1 p.16: the source bounds the normalized signed F-moment by Ent_p for every p≥1; it should bound it by Ent₁ and then by 1+Ent_p; affects the proof.
- **Misprint** in gpt2023 at Theorem 5, arXiv v1 p.20: the source omits γ from the bound's parameters; it should retain the structural constant used through Theorem 2; affects a stated result.
- **Misprint** in pss2012 at equation (5.6), arXiv v2 p.21: the source gives inverse relative trace as n plus the primed Laplacian of the potential; it should use n minus that Laplacian; affects the proof.
- **Error** in pss2012 at Appendix A.1 preceding Theorem 31, arXiv v2 p.74: the source claims uniform Lp bounds for arbitrary nonpositive quasi-plurisubharmonic functions; it should normalize their supremum, since negative constants have unbounded norms; affects nothing.
