# Review of ComplexHessianEquations (design, round 2)

**Verdict:** needs changes

Reviewed the design README, all 48 targets in eight layers of the plan, and all 19 source entries. There are 12 findings: eight blocking (three P1, five P2) and four P3. No design or source-manifest entry was edited. The defects are repairable; the scope does not warrant rejection.

## Previous findings and repairs

The nine previous findings were checked first, against the actual files rather than the repair report's assertions. Quotations below are from `packages/ComplexHessianEquations/design/README.md` unless otherwise specified.

| Previous finding | Repaired passage and verification | Status |
| --- | --- | --- |
| F01, ownership of min–max/Weyl | Line 62: “nothing of Milestone A7 is re-proved here.” The separate min–max/Weyl targets are gone; §1.1 transports supplied inequalities to relative forms. PD-A51–A53 still exist on main. | Repaired. Native versions have since reached the pins; see R12. |
| F02, trace inequality/Ky Fan ownership | Line 149 attributes the upper/lower trace bounds to PA-B32 and the maximum principle to MAJ-A27; line 151 retains uniqueness at a gap and differentiability. | Repaired. The retained eigenvalue sum differs from the supplier's singular-value sum; no new duplicate triangle theorem was inferred merely from the shared name. |
| F03, ellipticity | Line 180: “If moreover `∂_i f ≥ 0` on `Γ`”; strictness separately requires `∂_i f > 0`. Line 189 retains the negative controls. | Repaired. At `diag(1,0) ≤ diag(2,0)`, `−σ₁` gives `−1 > −2`, and the revised hypotheses exclude it. |
| F04, sublevel continuity | Line 630 uses “the strict sublevel function” and explains its right-continuity. | Repaired. A plateau of mass `a>0` at `−ε` gives closed-sublevel mass `a` at `ε` and zero just above it; the strict version has zero at and above `ε`. |
| F05, implicit-function input | Line 47: “the inverse function theorem in Banach spaces”; line 550 applies `HasStrictFDerivAt.toOpenPartialHomeomorph`. | Repaired. Its native derivative is a continuous linear equivalence, as §5.2 supplies. The finite-dimensional implicit theorem is only mentioned to distinguish it. |
| F06, Ricci dictionary | Line 35: “`Ric_PSS = (1/2)·Ric`” for the same form, and the Einstein constant doubles. | Repaired, correctly differing from the previous suggested wording. On the stated Fubini–Study form, `Ric_PSS=ω` and `Ric=2ω`. |
| F07, gap needs | `plan.json` now puts the displayed weak-Harnack and ABP bounds, including operator and function hypotheses, in `needs`. | Repaired as wording. The ABP contract repeats main’s theorem without isolating its residual scope (R02). The inhomogeneous weak-Harnack extension remains a genuine contract. |
| F08, entropy | Line 378: “For every `F ∈ C⁰(X)` and `p > 0`”. | Repaired. For a constant `a`, the two sides are `e^{na}` and `e^{na}\|a\|^p+e^n`, without normalization. |
| F09, local integrability inputs | Line 571 explicitly supplies the disc estimate via Demailly Proposition 4.22; line 573 gives the slicing construction. | Repaired as ownership/locator coverage. The new proof and Checks introduce R05 and R09; they are not a recurrence of the old unnamed-Lelong-input defect. |

No previous finding was marked “not actionable in this package”; none is being re-raised on that basis. I also searched the remaining design for the repaired patterns: unqualified monotonicity, finite-dimensional implicit-function use, normalized-only mass bounds, and closed-sublevel applications of De Giorgi. They did not recur.

## R01 (P1) — The non-divergence Schauder input is attributed to the wrong supplier target

**Location.** `packages/ComplexHessianEquations/design/README.md:101`, quoted: “Lane E item 22: the interior Schauder estimate”; also lines 442 and 534 and `packages/ComplexHessianEquations/design/plan.json:1354,1646`.

**Claim.** PDE E22 supplies the `C^{2,α}` estimate for non-divergence equations used by §§5.2 and 6.5.

**Witness.** `TauCetiRoadmap/PDE/README.md:1927` on main labels §5.3 E22 and gives divergence-form `C^{1,β}` estimates. Its non-divergence `C^{2,α}` result is §5.6 E25, line 2097.

The difference is mathematical, not merely a renumbering. With `a(x)=1+|x|^α` and `u'=1/a`, `−(au')'=0`, while `u''` is unbounded near zero for `0<α<1`. E22 cannot provide the claimed conclusion. The supplier's own Check makes this distinction at line 1950. The resolver finds the ID, but does not check this mismatch.

**Exact repair.** Replace the non-divergence E22 citations in the contract, target prerequisites, layer dependencies and supplier list by **PDE §5.6 (E25)**, preserving the coefficient, ellipticity, radius and Hölder-norm hypotheses. E25's model `−u''=|x|^α` gives `u''=−|x|^α∈C^{0,α}`, exactly the required conclusion; the divergence-form counterexample is no longer being used as an input of that type. This is a citation to main, not a dependency on the open PDE revision.

## R02 (P2) — The ABP gap does not distinguish the theorem already owned on main

**Location.** `packages/ComplexHessianEquations/design/README.md:103`, quoted: “PDE on its main branch plans no such statement”; `packages/ComplexHessianEquations/design/plan.json:2222`, gap `abp-maximum-principle`.

**Claim.** An additional PDE Part II contract is needed for the ABP estimate.

**Witness.** `TauCetiRoadmap/PDE/README.md:1403` on main states the ABP estimate on bounded open sets for positive-definite measurable coefficients and `W^{2,n}_loc∩C(Ω̄)` strong solutions, with determinant weight and upper contact set.

It supplies the smooth, uniformly elliptic case used in §8.5. Its boundary term is `sup∂Ω u⁺`; applying it to `v=u−sup∂Ω u` gives the requested boundary term. Here `Lv=Lu`, the contact set and Hessian are unchanged, and `sup∂Ω v⁺=0`. Main additionally assumes `f/(det a)^{1/m}∈L^m(Ω)`. The gap omits this hypothesis; a genuinely wider contact-only integrability extension must be identified as that extension, rather than asserting main has no ABP theorem.

**Exact repair.** Cite **PDE §3.2 (C13), ABP estimate** for the existing theorem and §8.5 use, with its integrability hypothesis and the constant-shift adapter. Correct the claim that main lacks ABP. To preserve the gap’s full advertised generality, narrow its `needs` to the residual extension: for measurable symmetric positive-definite `a` and `C²∩C⁰(Ω̄)` functions, allow finite `L^m(Γ⁺)` norm of `(Lu)⁻/(det a)^{1/m}` without assuming global integrability of `Lu/(det a)^{1/m}`; retain the displayed bound and name PDE §3.2 as its base. Keep any such extension in the named PDE Part II contract, importing main §3.2 rather than requesting its construction anew. On `u=−2+(1−|x|²)`, `a=Id`, on the unit ball, `Lu=Lv=−2m`, the contact set is unchanged, and the boundary terms are `−2` and `0`; the main theorem already gives this case. Keep the separate weak-Harnack gap.

## R03 (P2) — K3Surfaces still owns the same nonlinear construction

**Location.** `packages/ComplexHessianEquations/design/README.md:15`, quoted: “it is a later consumer of Layer 6”; also line 701 and the plan's K3Surfaces consumer entry.

**Claim.** The dimension-two continuity method and nonlinear estimates in K3Surfaces are imports of this roadmap's general theorem.

**Witness.** Open PR **#1285**, `TauCetiRoadmap/K3Surfaces/README.md:533`, explicitly owns the continuity path, C⁰/second/higher estimates and existence. Its line 187 excludes nonlinear existence from its supplied CKG inputs.

I read that head. It does not import ComplexHessianEquations. Its normalized equation at line 531 is the dimension-two specialization of §6.6: set `F=log(V/ω²)` and shift the potential from mean zero to supremum zero. The resulting form is unchanged. Thus both roadmaps currently own the same estimates and existence construction. Moreover `merge-order/ORDER.txt:135` already lists K3Surfaces, whereas the candidate gate currently places this design after SobolevMapsBetweenManifolds. Calling K3 a later consumer does not establish that order.

**Exact repair.** Retain the general theorem in ComplexHessianEquations and settle the shared ownership explicitly: K3Surfaces §2.1 must consume §6.6 for existence and the nonlinear estimates, retaining only its Ricci-flat/K3-specific consequences and parameter refinements. Arrange ComplexHessianEquations before that consumer after resolving its actual suppliers; record the coordinated ownership/order requirement instead of claiming the hand-off already exists. This requires coordination with PR #1285, not an unauthorized edit by this review. The specialization above verifies the transfer without losing the K3 theorem or narrowing the general theorem.

## R04 (P1) — The full Hölder norms are unbounded without normalizing the potential

**Location.** `packages/ComplexHessianEquations/design/README.md:534`, quoted: “`‖φ‖_{C^{2,α}} ≤ C`”; the second norm bound there and the Check at line 538; `packages/ComplexHessianEquations/design/plan.json:1629`.

**Claim.** The full norms are bounded by the background and `F`. Layer 6's standing assumptions at line 485 impose the equation and positivity, but no normalization on `φ`.

**Witness.** On a fixed flat complex torus take `F=0` and `φ=M` constant. Then `ω_φ=ω`, `S=0`, and `osc φ=0`, but `‖φ‖_{C^{k,α}}≥|M|→∞`. The Check “F=0 gives φ=0” is false too.

**Exact repair.** Require `sup_X φ=0` for the two quantitative bounds, or state them for `φ−sup_X φ`; carry the same condition in the plan and Check. Do not require a normalization for the qualitative smoothness assertion. For the mean-zero openness route, explain that changing between the two normalizations preserves the equation and controls the full norm. The refuting family then becomes identically zero. Also retain the C³-data dependence of §6.4 in the bootstrap constants: the displayed dependence only on `‖F‖_{C^{k+1,α}}` for small `k` is not obtained from that route. A safe explicit version from the stated inputs uses `‖F‖_{C^{max(3,k+1),α}}`; a stronger dependence needs its own supplied estimate. `twwy2015 line 135–138` distinguishes these regularity requirements.

## R05 (P1) — The repaired slicing proof doubles the complex Hessian

**Location.** `packages/ComplexHessianEquations/design/README.md:573`, quoted: “`Δ_t v_ξ = 4·H_{i∂∂̄u}(ξ, ξ)`”.

**Claim.** The real planar Laplacian of the slice is four times the Hermitian form defined in the Conventions.

**Witness.** Take `n=1`, `u(z)=|z|²−4`, `x₀=0`, `ξ=∂x`. Line 31 gives `H(ξ,ξ)=2`; the slice Laplacian is `4`, whereas the displayed right side is `8`.

This example is nonpositive, smooth and plurisubharmonic on the required ball, so it tests the actual proof inputs.

**Exact repair.** Write `Δ_t v_ξ=2H_{i∂∂̄u}(ξ,ξ)` for real tangent vectors representing the complex line. The alternative coefficient-matrix identity is `Δ_t v_ξ=4Σu_{j k̄}ξ_j overline(ξ_k)`; distinguish it from `H`. Add the displayed quadratic test. The corrected equation reads `4=2·2`; the sign and the rest of the slicing bound are unchanged.

## R06 (P2) — Positive-degree and cone-index hypotheses are missing

**Location.** `packages/ComplexHessianEquations/design/README.md:218,229–233`, quoted: “`D_b p > 0`”; `packages/ComplexHessianEquations/design/plan.json:401,516` and its `hessianCone_antitone` API.

**Claim.** All homogeneous hyperbolic polynomials satisfy the strict derivative and proper-half-space assertions, and the entire displayed nesting applies at `k=1`.

**Witness.** `p≡1`, degree `m=0`, satisfies the stated hyperbolicity definition. Its cone is `ℝ^N`, `D_b p=0`, `D_a p=0` is not hyperbolic, and the cone contains `−e`. Also `Γ₀` is outside the declared `1≤k≤n` carrier.

If extended by the defining empty conjunction, `Γ₀=ℝⁿ`, so `Γ₀⊆Γ₁` is false (`−e` again). The previous table tested only positive-degree elementary symmetric polynomials. A related index omission is in §2.1: the recurrence and derivative identities contain `k−1` without `k≥1`. At `n=1`, `k=0`, `λ=1`, natural subtraction gives respectively `1=2` and `0=1`; an integer subscript instead leaves σ₋₁ undefined.

**Exact repair.** Keep a degree-zero convention if desired, but restrict `p^{1/m}`, strict directional positivity, the symmetric proper-half-space conclusion, and the derivative-hyperbolicity rule to `m≥1`. For a linear `p`, allow its nonzero constant derivative as the degree-zero terminal case without applying the positive-degree conclusions to it. State adjacent nesting for `2≤k≤n`, with `Γ₁={σ₁>0}` separately. Add `1≤k≤n` to the recurrence/derivative identities in §2.1, or give the zero-degree formulas separately with an explicit σ₋₁ convention; retain σ₀=1 and its derivative zero as a Check. At `k=1`, `n=1`, `λ=1`, the identities then read `1=1·1+0` and `1=1`. At `p=x+y`, `a=(1,1)`, `D_a p=2` has cone `ℝ²`; the corrected statements handle both the linear endpoint and the constant counterexample.

## R07 (P2) — The tangent inequality lacks differentiability

**Location.** `packages/ComplexHessianEquations/design/README.md:249`, quoted: “for `g` concave and positively homogeneous of degree one”; `packages/ComplexHessianEquations/design/plan.json:535`.

**Claim.** These hypotheses suffice for `g(μ)≤Σ μ_i ∂_i g(λ)`.

**Witness.** On the positive quadrant, `g(x,y)=min(x,y)` is concave and homogeneous. At `λ=μ=(1,1)`, both coordinate derivatives fail to exist; with Lean's total `deriv`, both are zero and the bound reads `1≤0`.

The zero convention is explicit at `Mathlib/Analysis/Calculus/Deriv/Basic.lean:240`, `deriv_zero_of_not_differentiableAt`. The cited `gpt2023 line 751–756` works with the differentiable function in Lemma 4, not every concave homogeneous function.

**Exact repair.** Add differentiability of `g` at `λ` (or C¹ on the cone) and keep `λ,μ∈Γ`. Add the `min` negative control. Its nonsmooth base point is excluded; at `λ=(1,2)`, `∇g=(1,0)` and for `μ=(2,1)` the corrected inequality is `1≤2`. For a fully nonsmooth version, separately quantify a supporting supergradient instead of nonexistent partial derivatives.

## R08 (P2) — Two central curvature targets are named but not stated

**Location.** `packages/ComplexHessianEquations/design/README.md:492–493`, quoted: “the formula for `Δ_{ω_φ} tr h`” and “the formula for `Δ_{ω_φ} S`”; `packages/ComplexHessianEquations/design/plan.json:1488` repeats those descriptions.

**Claim.** §6.1 specifies the identities used by the C² and C³ estimates.

**Witness.** Neither file supplies either right-hand side or defines `Λ` beyond its name and source locator. The three Checks use constant relative endomorphisms, so their derivative terms vanish and cannot distinguish a wrong sign or factor.

**Exact repair.** State both identities with contractions, connection/curvature conventions and coefficient normalizations, and define the bisectional lower bound `Λ`; identify the nonnegative expression in the logarithmic trace inequality separately. Use `pss2012 line 994–1016` and `1046–1064`, converted to the roadmap's metric/Laplacian conventions, rather than making the reader reconstruct the target from a citation. Add a nonconstant Check: on a flat one-dimensional torus let `q=1−a cos(kx)`, `0<a<1`, `k=2π`, `ω_φ=qω`. At `x=0`, `Δ_{ω_φ}tr h=ak²/(2(1−a))`, the gradient term vanishes, and `Δ_ω log q` has that same value. Also `S=q'²/(2q³)` and `Δ_{ω_φ}S=a²k⁴/(2(1−a)^4)` there. These values test the missing identities and the factor conversion. Keep the exact hypotheses and these targets in the plan.

## R09 (P3) — The new logarithmic Checks do not satisfy their claimed radius conditions

**Location.** `packages/ComplexHessianEquations/design/README.md:577,579`; `packages/ComplexHessianEquations/design/plan.json:1722`, tests `disc_point_mass` and `disc_centre_hypothesis`.

**Claim.** For every `r<R'<R`, the point mass at `R/2` gives `M=2π`, the integral on `D_r` is finite exactly for `α<2`, and the permitted exponent is below two. Recentering at `R/4` retains the original radii.

**Witness.** Choose `R=1`, `R'=1/16`, `r=1/32`. The pole `1/2` is outside both discs: `M=0`, the integral is finite for every exponent, and `α₁=2`; the alleged mass bound is `2π≤π`.

Recentering a radius-`R` disc at `R/4` also leaves the original domain. In the higher-dimensional Checks, the logarithmic pole and `−1/|x|` are not C² at zero and hence do not themselves test the C² theorem.

**Exact repair.** For the point-mass Check require `R/2<r<R'<R`, for example `r=3R/4`, `R'=7R/8`. Then `M=2π`, the pole lies in the integration region, and `α₁=log(8/7)/log4<2`. For the recentered Check at `R/4`, use outer radius `R/2`, intermediate radius `3R/8`, inner radius `5R/16`; all lie inside the original disc and the permitted exponent is `log(4/3)/(c log4)`. Replace the singular C² controls by `c log((|z|²+ε)/(4+ε))` and `−(|x|²+ε)^{−1/2}`, or explicitly take their smooth limits. The latter has real Laplacian `(r²+4ε)/(r²+ε)^{5/2}>0` in dimension four, while its radial complex Hessian is negative for `r²>2ε`; its exponential integrals diverge as `ε↓0`. The negative control then respects the theorem's regularity.

## R10 (P3) — The README omits the hyperbolicity definition's discriminating Checks

**Location.** `packages/ComplexHessianEquations/design/README.md:237–245`; compare `packages/ComplexHessianEquations/design/plan.json:401`.

**Claim.** Every definition has its API and at least three discriminating README Checks.

**Witness.** The §2.2 API and all three Checks concern `Γ_k`. The plan has separate `IsHyperbolic` tests, including `sum_squares_not_hyperbolic`, which never appear in the README.

**Exact repair.** Add the hyperbolic-polynomial API and three explicit Checks to §2.2, carrying R06's degree guards: `xy` along `(1,1)` at `(2,−1)` gives roots `−2,1`; `x²+y²` along `(1,0)` at `(0,1)` gives `t²+1` with roots `±i`, so is excluded; `x+y` along `(1,1)` has root `−(x+y)/2` and cone `x+y>0`. These distinguish real-rootedness from merely `p(a)>0` and retain the linear endpoint. The existing Γ_k Checks remain.

## R11 (P3) — Source-manifest target IDs were not migrated

**Location.** `packages/ComplexHessianEquations/sources.toml:20,153,172`, the `cited_for` arrays of `gpt2023`, `spruck2005` and `lewis1996`.

**Claim.** The manifest identifies the targets for which each work is cited.

**Witness.** `gpt2023` still cites `1.6`, and `lewis1996` still cites `1.4.1` and `1.4.2`; none exists in the repaired plan. Spruck's old `1.3` and `1.5` no longer identify the original topics.

**Exact repair.** Have the fix worker migrate these author-recorded target references using the repair's numbering: old `1.6→1.5`, old `1.3→1.2`, old `1.5→1.4`, old `1.4.1→1.3.1`, old `1.4.2→1.3.2`; remove an obsolete locator's use where its old target was deleted, and retain actual present citations. Preserve keys, fetch metadata and settled access status. Retest that every numeric `cited_for` value resolves to an extant target/section and that it names the topic the source actually supports. I did not rewrite these entries.

## R12 (P3) — The supplier inventory still describes the previous library pins

**Location.** `packages/ComplexHessianEquations/design/README.md:42,54,60–70`; `packages/ComplexHessianEquations/design/plan.json:6`.

**Claim.** The recorded baseline is Mathlib `f6090c7` and Tau Ceti `358314d`, and the finite-dimensional variational inputs are supplied solely as roadmap targets.

**Witness.** `lake-manifest.json` pins Mathlib `1b1ccf4` and Tau Ceti `2fd255d`. At those pins, `TauCeti/Analysis/InnerProductSpace/CourantFischer.lean:251,363,440` and `KyFan.lean:489` already supply the consumed min–max, monotonicity, Weyl and Ky Fan inequalities.

**Exact repair.** Refresh the design baseline and exact supplier contracts to those actual pins; cite `LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner`, `eigenvalue_mono`, `abs_eigenvalue_sub_eigenvalue_le` (or its operator-norm variant), and `sum_re_inner_apply_self_le_sum_eigenvalues` at their native files. Preserve historical roadmap ownership in Scope if useful, but do not represent implemented inputs as missing library work. The witnesses `diag(3,0)≤diag(3,1)` and `T=diag(3,1,1), w=e₂` give respectively `(3,0)≤(3,1)` and `1≤3` in the native signatures. Also record that `SmoothTwoForm` is now the generic `SmoothForm` abbreviation, which matters to the subsequent headline-statability audit.

## Verified sound

**Coverage and principles.** Read all eight layers and the plan's 48 targets, including 12 definitions, their hypotheses, APIs, tests, prerequisites and gaps. Read three main-roadmap shapes (ComplexManifolds, ComplexKahlerGeometry and OperatorTheory/PolarDecomposition). The design has the required opening, ownership, conventions, supplier contracts, ordered layers, examples, dependencies, downstream section and references. There is no computational algorithm, route-specific restriction on dimension or right-hand side, copied source passage found in the sampled comparisons, `set_option`, sorry'd data, machine path, HTML anchor or PR number in the design README. The general Kähler theorem and the separate Hermitian Part II boundary remain mathematically coherent. Formula-level completeness and definition Checks have the exceptions above. Plan-only proposed names are not claims of present Lean declarations; the README's backticked native identifiers were checked separately.

The apparent §2.1/§2.2 cross-reference is not a mathematical cycle when resolved at target level: Maclaurin needs the already given inequalities defining Γ_l, not Gårding's theorem; Gårding uses the elementary shift identity. The plan's target graph is acyclic (48 vertices, 101 internal prerequisite edges, checked by depth-first traversal). Keep that distinction when implementing. Every cross-roadmap supplier is on main; no banned supplier is named. The shared K3 ownership/order is R03, not a claimed UPWARD output from the gate.

**Adversarial evidence.** The earlier review's numerical rows were used only for unchanged statements they actually evaluated. I re-read all remaining APIs and recomputed the repaired passages, all 15 seeded targets, the headline cases and the findings. Rows below are representative finite computations and boundary tests, not substitutes for general proofs. Grouped rows identify the statements being tested; the larger target ledger is retained in scratch.

| Statement | Instances tried | Computed left side / right side or defining values | Result and change |
| --- | --- | --- | --- |
| Conventions, relative form and Laplacian | Standard ℂ, `u=\|z\|²`, `u=x²`; metric doubled | `H_u(∂x,∂x)=2`, `Δ_ωu=2`, `Δ_Ru=4`; for x²: `1,1,2`; doubling ω gives eigenvalue 1 | Convention sound; R05 fixes its later use. |
| §1.1 relative eigenvalues, sign and determinant | Gram `diag(2,1)`, form `diag(2,3)`; `A=diag(1,2,3)` | Relative `(3,1)`, Euclidean `(3,2)`, negative `(−1,−3)`; determinant polynomial `1+6t+11t²+6t³` on both sides | Sound; supplied inequalities are F01/R12. |
| §1.2 trace bounds | `F=diag(2,1)`, `B=diag(0,3)`, then −B | `3≤tr(FB)=3≤6`; at −B, `−3≤−3` | F02 repaired. |
| §1.2 gap, uniqueness and derivative | `T=diag(3,1,1)`; perturb `t diag(0,1,−1)` | m=1: value 3, derivative 0, gradient `diag(1,0,0)`; m=2: `4+\|t\|`, left/right derivatives −1/+1 | Gap discriminates correctly. |
| §1.2 subadditivity and endpoint | `diag(1,0)+diag(0,1)`; m=n | `κ₁(sum)=1≤2`; `κ_n=tr`, derivative `tr H`, sole rank-n projection I | Sound, includes full-rank endpoint. |
| §1.3 Lewis derivative and converse | determinant at `[[2,1],[1,2]]`; max at I | det=3, gradient `[[2,−1],[−1,2]]`; max along `diag(t,0)` is `1+max(t,0)` | Correct eigenbasis dependence and nonsmooth converse. |
| §1.4 concavity/gradient ordering | sqrt(det) at `(4,1),(1,4)` | endpoint values 2, midpoint 2.5; gradient `(1/4,1)`; tangent increment 2.25 ≥ value increment 0 | Sound after ellipticity repair. |
| §1.4 monotonicity and cone closure | `S=diag(1,0)≤T=diag(2,0)`; f=σ₁, −σ₁, 0 | `1<2`; `−1>−2`; `0=0` despite S≠T; shift `(1−ε,−1/2−ε)+(ε,1/2+ε)=(1,0)` | Weak/strict hypotheses now correct. |
| §1.5 Euler, determinant, AM–GM | sqrt(det) at `(1,4)`; A=(1,4), B=I or A⁻¹ | gradient `(1,1/4)`, determinant 1/4, Euler trace 2=F; `5≥4`, `2=2`; det alone gives 8=2F | Correct degree and equality normalization. |
| §2.1 Newton/Maclaurin and shift | `(1,2,3)`, `(1,0,0)`, `e+t e` | `12≤121/9`; roots `2≥sqrt(11/3)≥cuberoot6`; `0=0` off positive cone; n=3,k=2,t=1: 12=3+6+3 | Correct restriction of equality; source issue below. |
| §2.1 zero index | n=1,k=0,λ=1; natural subtraction | recurrence `1=1+1` and derivative `0=1` fail; at k=1 both sides are 1 | R06 adds the index guards. |
| §2.2 general hyperbolicity | p=1; p=x+y; p=x²+y², a=(1,0), x=(0,1) | constant: no roots, cone all space, derivative 0; linear root `−(x+y)/2`; quadratic roots ±i | R06/R10. |
| §2.2 Γ_k and boundary | `(3,3,−1)`, `(2,2,−1)`, −e in ℝ³ | σ=(5,3,−9); σ₂=0; σ₁(−e)=−3 but σ₂(−e)=3 | Γ₂ needs lower inequalities; Γ₁ endpoint needs R06. |
| §2.3 quotient and tangent | σ₂/σ₁ at `(4,1),(1,4), midpoint`; sqrtσ₂ tangent | `.8,.8,1.25`; `g(4,1)=2≤4.25` | Smooth instances sound. |
| §2.3 nonsmooth tangent | g=min, λ=μ=e; λ=(1,2), μ=(2,1) | total coordinate derivatives at e are 0: `1≤0` false; at smooth λ: `1≤2` | R07. |
| §2.4 pair, positivity and structural equivalence | σ₁−ε‖λ‖ at `(1,−1+δ)`; sqrtσ₂ at `(1,4)` | derivatives ≥1−ε>0, value negative for small δ; product and gradient determinant both 1/4 | No unsupported positivity off Γ_n. |
| §2.4 positive combinations | n=2 derivative vectors x=(1,4), y=(4,1) | sqrt product of x+y is 5 ≥ 2+2=4 | Structural-combination lower bound correct. |
| §2.5 constants and pure quotient | n=3,k=2 at e; n=2 quotient at `(ε,1)` | derivatives `1/√3`, product `3^(−3/2)`; quotient product `ε²/(1+ε)^4→0`; n=3 at `(M,1,1)` tends as `3/M²` | Sharp Hessian constant; no pure-quotient overclaim. |
| §3.1 pullback/chain/max test | u=x²−y², −\|z\|²; u=x, γ(u)=u² | first Hessian 0 with no max; second −2h; chain term `2i∂x∧∂̄x=dx∧dy` | Correct signs; no converse claimed. |
| §3.2 wedge/mixed/volume | n=2, α=(4,1), β=ω; α=0 | α∧ω/ω²=5/2≥sqrt4=2; ω²=2dvol; zero mixed terms 0≥0 | Correct factorials and closure boundary. |
| §3.3 solution constants | χ=ω,F=0; χ=2ω on CP¹; F=a | c=1, binom(n,k)^(1/k), n for the three pairs; c=2 on CP¹; c=e^(−a) | Form and normalization dictionaries agree. |
| §3.4 degeneration, energy and entropy | χ=0 or ω_X; F=a, V=1 | V_t=t^nV or (1+t)^nV; MA c_t^n/V_t=1/V; mass bound `e^{na}≤e^{na}\|a\|^p+e^n`; F=0 gives entropy/energy 0 | F08 repaired; denominators positive for t>0. |
| §§4.1–4.2 comparison/uniqueness | χ=ω, ψ=−\|z\|²/4; two components | local eigenvalues 1/2≤1; componentwise constants 0 and −1 both have sup 0 | Comparison sound; connectedness/normalization are necessary. |
| §5.1 integration and sign | unit flat torus u=cos(2πx) | Δ_ωu=−2π²u; normalized ∫uΔ_ωu=−π²; gradient energy π²; conformal ρ=u=x₁ gives discrepancy −e^(−x₁) | Correct Kähler/sign hypotheses. |
| §5.2 inverse and compactness | torus cosine; `j^(−α)sin(jx)` | inverse `−cos/(2π²)`; α-Hölder quotient `(2/π)^α` while sup→0 | Mean-zero and exponent loss matter; supplier R01. |
| §5.3 Poincaré/Sobolev | circle length 2π; real dimension four | squared norms of sin and its derivative both π; λ₁=1; exponent 2·4/(4−2)=4 | Correct constants and dimension range. |
| §5.4 L¹ bounds | CP¹ log family; unnormalized −M | with ω_FS area 2π, ∫−ψ_ε→2π; constant −M gives 2πM | Sup normalization essential; Hermitian proof uses local submean argument. |
| §6.1 Ricci and missing differential identities | CP¹; torus q=1−a cos(kx) at 0 | Ric=2ω, Ric_PSS=ω; Δ' tr h=`ak²/(2(1−a))`; Δ'S=`a²k⁴/(2(1−a)^4)` | Ricci dictionary fixed; R08 supplies the missing equations. |
| §6.2 C⁰ | flat torus φ=εcos(2πx₁) | eigenvalues `(1−2π²εcos,1)`; density same first entry, mean density 1; osc=2ε, sup F=log(1+2π²ε) | Positive when ε<1/(2π²); no lower-F bound used. |
| §6.3 C² | λ=(4,1/4), λ=e | trace 17/4; eigenvalue lower bound 1/4=1/4; inverse-trace bound 4/17≤17/4; at e: 1/n≤n | Correct. |
| §6.4 C³ | q=1−2π²εcos(2πx) | ∂_zq=2π³εsin; S=q'²/(2q³)=O(ε²) | Metric-equivalence and C³-data dependence retained. |
| §6.5 norm estimate | F=0, φ=M | mixed derivatives 0, full norm ≥\|M\| | R04. |
| §6.6 Yau | F=0,a; n=1 F=εcos; two components | b=0,−a; b=−log I₀(ε)=−ε²/4+O(ε⁴); unequal component mass ratios need unequal b | Correct generality and explicit normalization. |
| §7.1 disc estimate itself | M≤2πA/log(R/R'); harmonic −A | β=αM/(2π)≤1; kernel integral ≤`2π(2R')²/(2−β)`; harmonic integral `πr²e^{αA}` | Constants follow after integrability/Fubini; R09 concerns the example radii. |
| §7.1 point-mass Check | R=1,R'=1/16,r=1/32,w₀=1/2 | actual M=0; asserted 2π≤π; α₁=2; pole-free integral finite even at α=3 | R09. |
| §7.1 local slicing | u=\|z\|²−4; n=1; g=1 polar identity | slice Δ=4 vs stated 8; polar RHS `(1/2π)(2π)(πρ²)=πρ²` | R05; polar formula sound. |
| §7.2 global α bound | CP¹ ψ_ε near 0, then background doubled | limiting radial integral `2π∫r^(1−2α)dr` finite iff α<1; doubling ψ halves admissible α | Correct background dependence; Hermitian extension comes from the local proof. |
| §8.1 auxiliary comparison | φ_t=0; level equality; positive strict sublevel | A_s=0 for zero solution at s>0; level contribution `(−φ_t−s)=0`; open strict sublevel has positive weighted mass | Zero denominator is excluded. |
| §8.2 De Giorgi | `1_[0,1)`, e^(−s), δ=0 | step satisfies rφ(s+r)≤φ(s); exponential ratio `r e^(δs−r)/B→∞` for δ>0; for δ=0 it is ≤1 with B=1 | Correct extinction hypothesis. |
| §8.3 strict sublevels and exponent | plateau at −ε; p=n or p=2n | closed mass a>0 versus right limit 0; strict mass/right limit both 0; δ=0 or 1/(2n) | F04 fixed; critical p excluded. |
| §8.4 MA energy | χ=ω_X,F_t=0 | φ_t=0, E=0, c_t^n=(1+t)^n, V_t=(1+t)^nV | Correct degeneration ratio. |
| §8.5 energy exponents | p'=n/2; p'=n; n=1 | exponent 2 in (a); all finite N at endpoint; n=1 endpoint allows N=1 | Correct endpoint route; ABP for this use supplied by main after R02. |
| §8.6 fixed bound | n=1; c=1,t=1,χ=0 | equation `1+Δφ=e^F`; E=V⁻¹∫−φ e^F; for F=0 both E and sup\|φ\| are 0 | Correct linear endpoint. |
| §8.7 Hessian estimate | n=2,k=1; q=3; k=n | q'=3/2<2; radial ∫r^(3−2p')dr finite iff p'<2; k=n uses all finite p' from §7.2 | Correct conjugate threshold and k=n treatment. |

**Source sample, read at the locators.** All eleven certified texts were opened. The following covers all 15 seeded targets and the revised disc proof. Page numbers for preprints are the page numbers in the cached version, not inferred journal pagination. The manifest and References explicitly identify the arXiv versions; no published-version numbering was silently substituted.

| Target | Readable locator and result |
| --- | --- |
| 1.2 | `lewis1996 line 145–159`, Theorem 2.1, printed p.579: differentiability at a gap, m=n vacuous condition. `spruck2005 line 11089–11100`, Lemma 1.5, printed p.286: lower trace inequality. The main-roadmap suppliers supply the full real/complex variational forms. |
| 2.2 | `spruck2005 line 11182–11235`, Definition 2.1, Theorem 2.2, Proposition 2.3, Corollary 2.4, pp.288–289; `dinew-kolodziej2014 line 139–164`, pp.3–4. Positive-degree theory supported; R06 makes the endpoint restriction explicit. |
| 2.3 | `spruck2005 line 11295–11320,11347–11365`, Theorem 2.11, Lemma 2.12, Proposition 2.15, Theorem 2.16, pp.291–292; `gpt2023 line 751–756`, p.17; `dinew-kolodziej2014 line 165–172`, p.4. Quotient concavity supported; the tangent argument needs R07. |
| 2.4 | `gpt2023 line 71–86,744–769`, pp.2–3,17; `guo-phong2024 line 76–104`, pp.2–3; `szekelyhidi2018 line 29–31,183–185`, §§1–2. The general pair deliberately does not impose f>0 off Γ_n. The lower-bound proof only evaluates positive μ and does extend to this formulation. |
| 2.5 | `gpt2023 line 90–93,770–776`, pp.3,17. The README's sharp constants are derived from Maclaurin, rather than quoted as the source's constants. Its Γ_max(k,p) repairs the source domain issue noted below. |
| 3.4 | `gpt2023 line 82–83,101–119,450–451,785–803`, pp.3–4,11,17–18. Energy, entropy and volume ratio agree. Splitting at \|F\|=1 proves the p>0 extension of the source's p≥1 mass estimate. |
| 5.1 | Plan's `pss2012 line 871–875`, p.21, is notation for the complex Laplacian and relative trace, not the full integration identity; its inverse-trace sign has a source misprint below. The actual bridge follows from the stated conventions and CKG K6.0 / DifferentialGeometry Layer 12. Those supplier citations, already listed with the target, support the integration bridge; the source line range only supports the notation. |
| 5.3 | `pss2012 line 278–303`, p.9, gives the Sobolev exponent and uses Poincaré. The general geometric inputs were separately opened in Yamabe Y1.1 and CKG K5a. |
| 5.4 | `guedj-zeriahi2005 line 255–274`, Proposition 1.7, p.6; `gpt2023 line 689–692`, p.16. GZ is a compact Kähler pluripotential statement, not literally the claimed Hermitian/continuous-background version. The README supplies the local submean/finite-chain extension; no Kähler integration is used there. The second proof uses the declared inhomogeneous weak-Harnack contract. |
| 6.1 | `pss2012 line 163–164`, (2.2), p.5; `837–840`, (5.4), p.20; `994–1016`, (6.2)–(6.6), pp.24–25; `1046–1064`, (7.1)–(7.4), p.26. Source formulas exist, but R08 requires them to become actual target statements. |
| 6.2 | `pss2012 line 245–308`, Theorem 3, pp.8–9; `tosatti-weinkove2010 line 104–106`, p.3. PSS's density is the roadmap's e^F. Upper-density dependence translates to sup F; the dimension-one case is separately linear. |
| 6.3 | `pss2012 line 981–1031`, Theorem 8, pp.24–25. Boundary terms and derivatives in φ vanish in this compact boundaryless, fixed-F specialization. Lower ΔF and upper density/curvature dependence retained. |
| 6.4 | `pss2012 line 1046–1081`, Theorem 9 and (7.5)–(7.7), pp.26–27; `twwy2015 line 132–138`, pp.3–4. C³-data dependence and background C¹ curvature bound are present. |
| 7.2 | `pss2012 line 2946–2955`, Theorem 31, p.74; `gpt2023 line 283–289`, p.7. These state/attribute the Kähler estimate. The stronger Hermitian/continuous-background assertion is justified by §§5.4 and 7.1, subject to fixing that proof, not by dropping the source's hypothesis unnoticed. |
| 8.7 | `gpt2023 line 861–952`, Lemmas 7–8 and Theorem 5, pp.19–20. Checked Hölder exponents, integration by parts, positivity of mixed forms, finite-p endpoint and the missing γ dependency in the source. The roadmap includes γ and the background domination step. |
| Revised 7.1 | `demailly2012 line 1717–1736`, Chapter I §4.B, Proposition 4.22, printed p.37, gives Green–Riesz and the harmonic bound. The mass estimate follows from the center formula and log(R/\|w\|)≥log(R/R'); the exponential estimate is the roadmap's deduction. R05/R09 are defects in that deduction's text/Checks, not Demailly's proposition. |

There are no additional author-flagged unverified locators beyond the eight explicitly settled uncertified works listed below. Every cited work has one manifest key. No new source had to be fetched, and no settled text was requested again.

**Pins and declarations opened.** The actual pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. I inspected declarations and their surrounding hypotheses, not only name matches:

- `Mathlib/Analysis/InnerProductSpace/Spectrum.lean:277,297,309,314,384`: `LinearMap.IsSymmetric.eigenvalues`, `eigenvectorBasis`, `eigenvalues_antitone`, `hasEigenvalue_eigenvalues`, `det_eq_prod_eigenvalues`; finite-dimensional RCLike inner-product spaces, sorted `Fin n` list with a finrank witness.
- `Mathlib/Analysis/Matrix/Spectrum.lean:60,67,143,193,240`: matrix eigenvalues, spectral theorem, determinant and trace. The sorted list is `eigenvalues₀`; the `eigenvalues` wrapper reindexes onto the matrix index type and is not automatically an ordered list.
- `Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean:69,202,216`: multiset and polynomial elementary symmetric functions and evaluation comparison; these provide σ_k, not Gårding concavity. `Mathlib/Analysis/Calculus/LocalExtr/Polynomial.lean:64` is `Polynomial.card_roots_le_derivative`.
- `Mathlib/Analysis/MeanInequalities.lean:129`: weighted real AM–GM, nonnegative weights of total one and nonnegative entries. `Mathlib/Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean:117`: strict derivative a continuous linear equivalence, complete domain. `Mathlib/Analysis/Calculus/Implicit.lean:450–464` retains the separate finite-dimensional target section for `implicitFunction`.
- `Mathlib/Analysis/Convex/Function.lean:59`, `Analysis/Calculus/FDeriv/Defs.lean:123`, `Analysis/Calculus/ContDiff/Defs.lean:471`, and `Topology/Order/LocalExtr.lean:69`: `ConcaveOn`, `HasFDerivAt`, `ContDiffOn`, `IsLocalMax`. Concavity does not include differentiability (R07). `Mathlib/Geometry/Manifold/IsManifold/Basic.lean:777` is the chart-transition groupoid condition; it does not itself require Hausdorffness, second countability, nonemptiness or a boundaryless model. The README separately states the needed manifold assumptions.
- `Mathlib/Analysis/Convex/Integral.lean:196`: `ConvexOn.map_integral_le` requires a probability measure, a closed convex set, continuity, a.e. membership and integrability of both the function and its convex composition. For the logarithmic-potential use, justify integrability by truncation/Fubini before applying this real-valued integral theorem. `Mathlib/Topology/UniformSpace/Ascoli.lean:474` gives the compactness input; it does not give compactness at the same Hölder exponent.
- `TauCeti/Geometry/Manifold/TwoForm/Basic.lean:37`: `SmoothTwoForm` is `SmoothForm I M ℝ 2`. `TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean:174,202,231`: `Tames`, `Invariant`, `Compatible`. The last bundles invariance and positivity; it adds neither closedness nor integrability of J, nonemptiness, or a topology on a new manifold.
- `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82`: `riemannianVolume`, chart-density measure for the native continuous Riemannian structure. `TauCeti/Geometry/Manifold/DifferentialForm/Dolbeault/Basic.lean:86,95` and `Dolbeault/ComplexManifold.lean:150–176` provide smooth ∂/∂̄ and their identities. A C² real-form adapter remains different from this smooth API.
- `TauCeti/Analysis/InnerProductSpace/CourantFischer.lean:251,363,440` and `KyFan.lean:489`: native versions of the supplied finite-dimensional inequalities (R12). `KyFan.lean:387` is the singular-value triangle inequality, not a duplicate of the signed-eigenvalue sum's derivative.
- `TauCeti/Analysis/PDE/Regularity/Harnack.lean:283`: homogeneous weak Harnack for every s>0 with `(m−2)s<m`, nonnegative H¹ supersolutions, measurable uniformly elliptic coefficients, on an enlarged ball. It has no scalar forcing term. Thus the **inhomogeneous** `q>m/2` extension in `gap:weak-harnack-supersolutions` is not discharged merely by this newly available homogeneous theorem.

Object searches covered hyperbolic polynomials, Newton/Maclaurin identities, signed versus singular Ky Fan sums, spectral derivatives, complex Hessians, Monge–Ampère, subharmonic integrability, ABP and Harnack in both pinned libraries and through `roadmaps grep` at main/open heads. No second owner of the general spectral derivative, Gårding polynomial theory or general complex-Hessian entropy estimates was located. Relative-form adapters remain this roadmap's work. Already supplied objects are distinguished above; R01–R03 and R12 are the actionable supplier/ownership changes.

**Cross-roadmap resolution and overlaps.** Read the board-package index before making ownership claims. It lists three other board packages; none owns these analytic objects. Checked the overlap file: no other head changes this roadmap and no dropped/only-open ID is listed. Also read the closest heads' scope and ownership: RicciFlow #1023 (closed-manifold parabolic theory), PDE #1614 (a revision, not used instead of main), VariationalMethods #1028 (abstract compact-form and kernel-orthogonal Poincaré theory), ComplexKahlerGeometry #1854 (a revision, main is the supplier), PositiveMass #956 (AE/weighted theory). Those scopes do not duplicate the new complex-Hessian theory. K3Surfaces #1285 does, as R03 records. Open files were available through the prescribed roadmap tools; this was not an ownership audit based only on remembered titles.

Resolved contracts against main: OperatorTheory/PolarDecomposition PD-A51–A53 at lines 254–261; PrincipalAngles PA-B32 at 272–273; Majorization MAJ-A27 at 176–178; ComplexManifolds Milestones 1–2 at 172 and 197; ComplexKahlerGeometry's K-label mapping at 363–366, K1/K2 native type calculus, K4 connection, K5a geometric elliptic realization at 2013–2044, K6.0 at 2321–2405; PseudodifferentialOperators §5.4 at 1337–1390 and §6.2 at 1523–1565; Yamabe Y1.1 at 113–130; DifferentialGeometry Layer 5's Stokes citation at 1742 and Layer 12's Laplace/volume/Green citations at 2874–2971. Their sign conventions agree with the torus and CP¹ rows above. PDE C12/C13/E23 resolve to §3.1/§3.2/§5.4; E22 is R01. ComplexComparisonPartII C5.4 at PR #848, lines 3707,3752–3768, owns positive-current and psh regularization; OptimalTransport Layer 6 at main line 764 is the real Monge–Ampère theory.

The required dependency check completed with exit code zero:

```
candidate: ComplexHessianEquations is not in the merge order yet; checked as if placed after SobolevMapsBetweenManifolds (the intake inserts it when its design is accepted)
depcheck: 228 roadmaps, 2065 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. `roadmaps resolve` reported no cross-roadmap ID or Lean name found nowhere. Its output explicitly said it did not check the library names because it could not locate Lake packages; the manual pin audit above supplies that check. Neither tool detects R01's wrong theorem under an existing ID or R03's competing ownership.

**Headline acceptance test and padding.** This is a design, not a package: no `Suggested.lean` exists. Elaboration: **not available (this lane does not elaborate; say so in the report)**. No Lean command was run. There are zero sorried declarations to one-tactic-probe, zero section-variable signatures to `#check`, and no import/header, sorry-data or `set_option` issue to assess in an absent file. This is not a passing elaboration claim.

The headline inventory is: Ky Fan differentiability and Lewis's derivative/C¹ theorem (§§1.2–1.3); spectral concavity/ellipticity (§1.4); Gårding and quotient concavity with structural constants (§§2.2–2.5); global uniqueness (§4.2); Yau existence/uniqueness (§6.6); uniform exponential integrability (§7.2); and the fixed, degenerating and Hessian L∞ estimates (§§8.3,8.6,8.7). The finite-dimensional headlines are statable using native polynomial/matrix/self-adjoint carriers and simple predicates, so the package must not replace them by determinant arithmetic or individual Checks. The geometric headlines need an explicit native-carrier assessment at the package stage. The previous review's blanket assertion that the pins lack smooth form/Dolbeault infrastructure is no longer usable: that infrastructure now exists. In particular a smooth-form formulation of Yau must be assessed using it before claiming non-statability. C² continuous-form and eigenvalue adapters still require attention. No absent package file is counted as a design finding.

## Not verifiable

- The eight manifest entries settled as uncertified remain settled: `cns1985` §1; `kolodziej1998` §1; `gilbarg-trudinger2001` Theorems 2.1, 3.5, 8.18, 9.1 and Lemmas 9.2, 17.16; `yau1978` §2; `szekelyhidi2014` Chapter 3/Theorem 3.1; `ckns1985` Theorem 1; `tian1987` global α estimate; `hormander1990` Chapter IV. Paywall/block/no legal text was already recorded. Their actual pages were not guessed or requested again; readable alternate proofs/locators were checked where available.
- The Lewis and Spruck cached scans are OCR. Their theorem numbers and relevant legible statements were read; scrambled parts of displayed formulas were not treated as trustworthy transcriptions. The report's computations independently test the cited formulas.
- No elaboration, one-tactic execution or mechanically elaborated signature comparison is available in this design lane. The algebraic witnesses and native declarations above are reading/computation evidence, not a Lean build.
- Coordinated ownership changes to K3Surfaces and future gap delivery are not facts of the present heads. They require the stated fixes/contracts.

## Source issues

- **Error** in spruck2005 at Proposition 2.7, printed p.290: the source says equality in Newton's inequality forces equal coordinates on all real tuples; it should restrict that equality assertion, since `(1,0,0)` gives zero on both sides with unequal coordinates; affects a stated result.
- **Error** in gpt2023 at the examples after Lemma 4, arXiv v1 p.17, lines 770–776: the source assigns the quotient plus `cσ_p^(1/p)` to Γ_k for unrestricted p; it should use Γ_max(k,p), since σ_p can vanish inside Γ_k when p>k; affects a stated result.
- **Misprint** in gpt2023 at the examples after Lemma 4, arXiv v1 p.17, line 773: the source permits k=ℓ in the quotient exponent 1/(k−ℓ); it should require ℓ<k; affects a stated result.
- **Gap** in gpt2023 at Lemma 1's auxiliary equation (2.3), arXiv v1 p.6: the source invokes smooth Yau existence for data built from a merely C² potential; it should smooth the positive density with compatible normalization and pass the estimates to the limit; affects the proof.
- **Gap** in gpt2023 at the proof of Theorem 2, arXiv v1 p.9, line 407: the source calls the closed-sublevel mass continuous; it should use strict sublevels to obtain right-continuity when a level has positive measure; affects the proof.
- **Gap** in gpt2023 at Theorem 1, arXiv v1 p.3 and its proof p.10: the source states real F but uses smooth F in the proof; it should state the regularity or provide the approximation argument; affects a stated result.
- **Misprint** in gpt2023 at Theorem 5, arXiv v1 p.20: the source's list of bound parameters omits γ; it should include the structural lower-bound constant used through Theorem 2; affects a stated result.
- **Misprint** in pss2012 at (5.6), arXiv v2 p.21, line 875: the source gives inverse relative trace as n plus the primed Laplacian of the potential; it should be n minus that Laplacian; affects the proof.
