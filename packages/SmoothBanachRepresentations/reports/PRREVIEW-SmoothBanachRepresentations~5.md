# Review of SmoothBanachRepresentations (pull request #1145 at 22d2666)
Folder: `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/`

**Verdict:** needs changes

:robot: Independent AI full review. The head is the one the previous review read; the folder has not changed since. Three findings, one blocking. The gate passes. No pull-request file was changed.

## R01 (P1) — The real locally convex tensor has no owner

**Location:** `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/README.md:64`, “What NoncommutativeGeometry, Part II must provide (gap:real-locally-convex-tensors)”; consumed at :432 (“Consume NoncommutativeGeometry N1 and the explicit Part II tensor gap over the same 𝕜=ℝ or ℂ”), :434 and :458; announced at :9.

**Claim:** §7.3's completed locally convex projective tensor of two real smooth Fréchet spaces, with the complexification isomorphism and the real balancing quotient, is supplied by a declared gap on “NoncommutativeGeometry, Part II”.

**Witness:** No roadmap folder, board package or open pull request named NoncommutativeGeometryPartII exists (checked the roadmap index of 440 open pull requests, the board package list and main at 929496d). Main's `TauCetiRoadmap/NoncommutativeGeometry/README.md:12` fixes complex scalars (“Algebras are complex”), so its N1 construction at :86–92 is the complex case only. This pull request has no `design/plan.json`, so the slug is registered nowhere; the brief lists this roadmap's declared gaps as none. A dependency on a section that exists nowhere is an unowned prerequisite. The open revision of NoncommutativeGeometry (N1.Tensor) does build the real case, but a revision of an existing roadmap is not a citable supplier.

**Repair:** Move the notion down: own it here. In §7.3 (or a new §7.3a placed before the tensor comparison) state as targets of this roadmap, for real Hausdorff locally convex spaces, the projective seminorms `π_(p,q)(t)=inf Σ p(x_i)q(y_i)`, the Hausdorff completion, the continuous-bilinear universal property into complete spaces, Fréchet completeness for Fréchet factors, agreement with BanachSpaceTheory B4 on Banach factors, and the two scalar-comparison maps (the complex-linear isomorphism from the complexification of `E⊗̂ℝF` onto `Eℂ⊗̂ℂFℂ`, and the real-linear balancing quotient `Eℝ⊗̂ℝFℝ → (E⊗̂ℂF)ℝ` with kernel the closed span of `ix⊗y−x⊗iy`), each with API bullets and at least three Checks; keep N1 as the complex supplier. Delete the Part II paragraph at :64 and the Part II mentions at :9, :432, :434 and :458, and remove the slug. Should NoncommutativeGeometry's real tensor land on main first, a later revision of this roadmap deletes the copy and cites that section; until then this roadmap is the owner.

**Repair test, on the instance that refuted the original:** with the targets owned here, `ℝ⊗̂ℝℝ=ℝ` with `π(1⊗1)=1`, its complexification is `ℂ` and `(1⊗1)⊗1↦1⊗1` under the stated isomorphism; for `E=F=ℂ` viewed over ℝ the balancing map has real dimensions 4→2 and kills `i⊗1−1⊗i`, so it is a quotient, not an isomorphism; `ℝ²⊗̂ℝℝ³` has dimension 6 and the projective seminorm of `e₁⊗e₁` is 1. These Checks already appear at :448 and now test a target of this roadmap instead of a contract nobody holds.

This carries forward the previous review's R01. No repair report marks it “not actionable in this package”.

## R02 (P3) — §7.4 states theorems without a locator

**Location:** `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/README.md:438`, “For the continuous dual define the closed invariant subspace of vectors whose contragredient orbit is norm continuous. Prove its strong action … Compare differentiated pairings and the negative transpose”.

**Claim:** The contragredient targets (closedness of the norm-continuous dual subspace, its strongly continuous action, the negative-transpose pairing) are placed in the literature.

**Witness:** §7.4 and its *Needs:* line cite no source; the Layer 7 introduction at :416 cites Casselman, Proposition 6.1, p.13, which states factorization only (casselman lines 645–649) and says nothing about duals. Every other layer carries a locator at its claims.

**Repair:** Add a locator at the three claims (a standard text on representations on Banach spaces states the norm-continuous contragredient subspace and the transpose of the differentiated action) or say in the section that the proofs are given in full by the route named there (closedness from the Layer 0.1 local bound, strong continuity by definition of the subspace, the transpose by differentiating `λ(π(exp(−tX))x)`). Either form satisfies the rule that every theorem has a locator.

## R03 (P3) — `smooth_inverse` carries a hypothesis it does not use

**Location:** `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/Suggested.lean:180`, `(hπ : HasContinuousOrbits π)`.

**Claim:** Inverse closure of smooth units needs strong continuity of the action.

**Witness:** The statement holds without it: for `a : Aˣ` with smooth orbit `g↦π(g)a`, the hypotheses `h1` and `hmul` give `π(g)(a⁻¹)=(π(g)a)⁻¹`, and `Ring.inverse` is smooth on the open set of units of a complete normed ring, so `g↦π(g)(a⁻¹)` is the composition of a smooth map with a smooth map. Instance: `G=ℝ` acting on `ℂ×ℂ` by the coordinate swap along a discontinuous additive character `ℝ→ℤ/2`; no orbit continuity, yet `a=(1,1)` has constant orbit and `a⁻¹=(1,1)` is smooth. The README at :470 proves the result by the same differentiation of `α(g)(a⁻¹)=α(g)(a)⁻¹`.

**Repair:** Drop `hπ` from `smooth_inverse` (and the words “strongly continuous” from its docstring), or keep it as the roadmap's standing object and say so; either is acceptable. This is a note, not a defect.

## Previous findings

- R01 — not repaired: the folder is unchanged since the previous review; :64 still names a Part II supplier that exists nowhere. Repeated as this report's R01.
- R02 (manifest) — not actionable as written: the repair asked for a `sources.toml` inside the roadmap folder, but the gate's stray-files rule rejects any non-roadmap file there, and no roadmap folder on main carries one. The manifest the tooling reads is the board package's, which a review never edits; the Casselman text is in the sources cache and was read from there. Dropped, with the primary Dixmier–Malliavin text recorded under Not verifiable.

## Verified sound

The repository README's standing checklist and CONTRIBUTING were read. Head is `22d2666b03e78425f05a9d8d6ddf47fa179874d6`, the worktree is clean, the outside-folder diff requested by the brief is empty, and the family index files under `TauCetiRoadmap/RepresentationTheory/` are not touched by the pull request (the diff against `origin/main` lists only the two folder files, 689 insertions).

### Gate, dependency direction and Lean

The worker's gate at this head reports every scanner, the dependency check and the targeted build passing (`build=0 OK`). The movable dependency check run in this review printed exactly:

```text
depcheck: 204 roadmaps, 1652 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The merge order lists AutomorphicFormsOnReductiveGroups directly above this roadmap; CompactGroups, LieGroups, OneParameterSemigroups (Completed), BanachSpaceTheory, BanachAlgebras and NoncommutativeGeometry are on main. LocallyAnalyticDistributions (which owns a nonarchimedean Fréchet open mapping theorem) and SpectralManifolds are later in the order and are not cited; the real/complex Fréchet open mapping theorem of §7.2 is owned here, which is consistent.

`lake env lean` on `Suggested.lean` elaborated with exactly seven “declaration uses `sorry`” warnings and nothing else. A scratch copy with `#check @name` for all 12 declarations elaborated; the printed types agree with the worker's signature file and with the README (details below). On the same copy each of the seven theorems was tried with `simp`, `rfl` and `infer_instance` (and `simp; done`): all seven attempts fail (`simp made no progress` on four; `simp` reorders the existentials of the other three and leaves the goal open, and neither `rfl` nor `infer_instance` can close an existential), so no declaration is padding. No `set_option`, no sorry'd data, one `import Mathlib`, no `lemma`.

Binder check (the six scanner leads): `HasContinuousOrbits`, `LieTestFunction`, `smear`, `IsSmoothLieVector` and `smoothLieVectors` legitimately keep only the instances their bodies need; completeness, Hausdorffness, Borel structure and the Lie-group axioms enter the theorems about them, not the definitions. `scalarParametrix` is a pure real-analysis statement and the `omit` of the group binders is correct. `smooth_inverse` omits the measure-space binders because its statement has no integral. Every theorem about a representation retains `FiniteDimensional ℝ V`, `LieGroup I ∞ G`, `T2Space G`, `BoundarylessManifold I G`, `CompleteSpace E`, and the integral theorems retain `BorelSpace G`, `LocallyCompactSpace G`, `IsHaarMeasure μ`, `Regular μ`, matching the Conventions (:15–:23). `IsManifold I 1 G` is implied by `LieGroup I ∞ G` (Mathlib `Geometry/Manifold/Algebra/Monoid.lean:65`, `ContMDiffMul` extends `IsManifold`, and the `LEInfty` instance at `Geometry/Manifold/IsManifold/Basic.lean:844`); it is redundant but harmless. `LocallyCompactSpace G` follows from the finite-dimensional model by theorems (`IsManifold/Basic.lean:440`, `ChartedSpace.lean:244`), not instances, so carrying it is right.

### Headline inventory

| README headline | Status at this head |
|---|---|
| §2.1 finite-k domain criterion and complete mixed-word topology | Docstring names the missing Fréchet carrier; the finite-k criterion would need the one-parameter generator adapter as a definition with proof obligations, so it is rightly not stated. |
| §3.1 continuous Lie/enveloping action | Docstring names the carrier. The algebraic bracket law alone could be written with `oneParameterSubgroup` and `deriv`, but the headline is the continuous action, which is not statable. |
| §3.3 smoothing | `isSmoothLieVector_smear`, both fields. |
| §4.1 density | `dense_smoothLieVectors`; the smooth-topology refinement is named as not statable. |
| §5.1 scalar parametrix | `scalarParametrix` on native `TestFunction`/`Distribution`; the fixed-support strong-dual comparison and the Banach-vector passage are named as not statable. |
| §6.1 support-controlled factorization | `dixmierMalliavin`, `dixmierMalliavin_function`. |
| §7.2 lifting and exactness | `smooth_lift`; topological exactness named as not statable. |
| §7.3 dense smooth tensor comparison | Not statable (locally convex tensor carrier); its supplier is R01. |
| §8.1 inverse closure | `smooth_inverse`; matrix levels through the general Banach algebra. |
| §8.1 holomorphic closure, torus comparison | Named as not statable (BanachAlgebras A2 calculus and the Fréchet carrier). |

Every backticked name of this roadmap's own in the README is declared in `Suggested.lean` and every Lean name appears in the README (the worker's resolve pass found none missing; confirmed by reading).

### Seeded source sample: all 15 targets

The source is Casselman's author-hosted essay, revision of 24 January 2016, in the sources cache (13 pages; page N starts at the `=== page N ===` marker). Pages 1, 4 and 9–13 were read in full this round. “Background” means the page supplies the convention or the statement the target extends; the extension is proved by the route named in the README, which is checked in the adversarial rows.

| Seeded target | Text and locator checked | Support and limits |
|---|---|---|
| 0.1 Strong actions | casselman lines 11–20 (p.1): continuous representation on a Fréchet space, orbit derivative convention | Background. The compact bound by uniform boundedness is Mathlib `banach_steinhaus` (`Analysis/Normed/Operator/BanachSteinhaus.lean:36`); rows 1–3. |
| 0.2 Two-sided generator comparison | casselman lines 11–14 (two-sided derivative); Tau Ceti `StronglyContinuousSemigroup` (`Analysis/Semigroups/Basic.lean:43`, nonnegative time) | The half-line to two-sided comparison is not in the source; it is owned here and verified in row 4. |
| 0.3 Mixed word domains | casselman lines 14–16 (inductive `V^(n+1)`) | Supports the recursion; rows 5–7. |
| 1.1 General test spaces | casselman lines 21–25 (`C_c^∞(G)`, `π(f)`); AutomorphicFormsOnReductiveGroups §0.1a at its head, README:113–124 (complex, finitely many components) | Real coefficients and arbitrary components are the stated extension; rows 8–12. |
| 1.2 Smooth Haar density | casselman line 21 (left Haar fixed); Tau Ceti `chartVolumeDensity`, `chartVolumeDensity_pos`, `contMDiffOn_chartVolumeDensity` (`VolumeDensity/Basic.lean:46,59,72`), `Homeomorph.measurePreserving_riemannianVolume` (`VolumeDensity/Isometry.lean:177`, Lindelöf source and target) | The source only fixes Haar; the density route is owned here and its Lindelöf localization matches the pinned hypotheses; rows 13–14. |
| 2.1 Finite regularity and real smooth topology | casselman lines 14–20 (iterated domains, Fréchet seminorms `‖π(X)v‖_ρ`) | Supports the all-order topology; the finite-k frame bridge is new and explicitly routed; rows 20–23. |
| 3.1 Real Lie and enveloping action | casselman lines 17–20 (`U(𝔤)` stability); LieGroups Layer 0 (main README:233) | Supports the enveloping action; rows 24–26. |
| 3.3 Smoothing and derivative estimates | casselman lines 26–35 (`π(y)π(f)=π(L_y f)`, `π(X)π(f)v=π(L_X f)v`) | Direct. The source's `L_X` is this roadmap's `−R_X`-free convention check in rows 29–31. |
| 3.4 Modular integration by parts | BanachAlgebras A7, main README:882–883 (`∫f(xg)=c(g)∫f`); casselman p.1 has no nonunimodular formula | Derived from the stated convention; recomputed in rows 32–34 with the sign of `q_X`. |
| 4.1 Real approximation and compact-finite comparison | casselman line 36 (`π(f_n)v→v` for a Dirac sequence); AutomorphicFormsOnReductiveGroups §2.1 README:300–344 and §2.7 README:468–496; CompactGroups Layer 5 main README:318 | Complex density supplied; real comparison by complexification owned here; rows 35–38. |
| 5.1 Scalar parametrix and passage to vectors | casselman Lemma 4.1 lines 492–499 (p.9–10), Lemma 4.2 lines 524–526 (p.10), Lemma 5.1 lines 609–614 and proof 615–637 (p.12), Proposition 6.1 proof lines 650–669 (p.13) | Numbers and pages match. Lemma 5.1 gives small supports and bounds on the coefficients; Lemma 4.1 normalizes `α₀=1`, so the roadmap's free positive `α₀` is weaker and correct. Rows 39–49, including the dilation to support `[−ε,ε]`. |
| 6.1 Prescribed-support factorization | casselman Proposition 6.1 lines 645–649 (statement, `f_j∈C_c^∞(Ω)`) and proof 650–682 | Support in `Ω` is in the statement; the function-support refinement is the roadmap's fixed-support route; rows 50–54. |
| 7.3 Smooth tensor comparison | BanachSpaceTheory B4 main README:167–206; NoncommutativeGeometry N1 main README:84–92 (complex) | Complex supplier resolved; real supplier is R01; rows 57–59. |
| 7.4 Continuous contragredients | No locator (R02) | Mathematics verified in row 60. |
| 8.1 Smooth algebras and spectral invariance | BanachAlgebras A1 main README:75–95 (inversion, resolvent), A2 :161 (holomorphic calculus); NoncommutativeGeometry N6 main README:486–495 (`δ_j(U₁^mU₂^n)=2πi n_j U₁^mU₂^n`, smooth vectors of the gauge action, inverse closure via K3) | Suppliers exist with the stated conventions; the seminorm comparison is new and computed in rows 61–67. |

### Adversarial computations

One row per statement; values computed on both sides.

| # | Statement | Instances and values | Result |
|---|---|---|---|
| 1 | §0.1 compact bound, not global | `π(t)x=e^t x` on ℝ: `sup_(t∈[−1,1])‖π(t)‖=e`; `sup_ℝ=∞`. Joint continuity at `(0,2)`: `e^t x→2`. | Local bound only, as stated; retain. |
| 2 | `HasContinuousOrbits` discriminates | Translation of `1_[0,1]`: `L^∞` difference `=1` for `0<|t|<1`; `L²` difference `=√(2|t|)` (symmetric difference of measure `2|t|`) `→0`. | Rejects the first, accepts the second; retain. |
| 3 | Strong vs operator-norm continuity | `L²` translations: `‖τ_t f−f‖→0` for each `f`, but `‖τ_t−I‖=2` for `t≠0` (take `f=1_[0,|t|/2]−1_[t,t+|t|/2]`-type witnesses). | The README's refusal of norm continuity is necessary; retain. |
| 4 | §0.2 two-sided from half-line | `(π(exp(−tX))v−v)/(−t)=π(exp(−tX))·(π(exp(tX))v−v)/t`; with `‖π(exp(−tX))‖≤C` near `0` the left quotient tends to the right derivative. `e^t x`: both quotients `→x`; realified `e^(it)z`: both `→iz`. | Group inverse suffices; retain. |
| 5 | §0.3 word order | `H=diag(1,0)`, `N=E₁₂`, `v=(0,1)`: `Nv=(1,0)`, `H(1,0)=(1,0)` so `A_H A_N v=(1,0)`; `Hv=0` so `A_N A_H v=0`. | Rightmost-first recursion needed; retain. |
| 6 | Empty word, zero generator | Empty word: `v`. `X=0`: `A₀=0`, domain `E`; any nonempty zero word gives `0`; `n` repeats of `I` give `x` for `n=0,1,2`. | Matches native powers; retain. |
| 7 | Domain membership fails | `L²` step: `‖τ_t f−f‖²/t²=2/|t|→∞`. | Domains are proper; retain. |
| 8 | §1.1 membership | Compact bump: admitted; constant `1`: support ℝ; `|x|`: one-sided derivatives `−1,1`; zero test: support `∅`. | Four cases discriminated; retain. |
| 9 | Fixed-support spaces | `K=∅` or `{0}`: continuous `f` vanishing off a point vanishes at it, `D_K={0}`; bump in `[−1,1]` admitted, excluded from `D_[2,4]`. | Retain. |
| 10 | Derivative seminorms needed | `f_n=b·sin(nx)/n`, `b=1` near `0`: `‖f_n‖_∞≤‖b‖_∞/n→0`, `f_n'(0)=1`. | Retain. |
| 11 | Final topology is not compact convergence | `b(·−n)`: all derivatives eventually `0` on each compact; `Λ(f)=Σ_k k f(k)` is continuous on every `D_K` (finite sum) and `Λ(b(·−n))=n·b(0)=n`. | Retain. |
| 12 | Translation/inversion supports | Bump support `[−1,1]` translated by `3`: `[2,4]`; `x↦−x` fixes `[−1,1]`. | Retain. |
| 13 | §1.2 affine Haar density | `(a,b)(a',b')=(aa',b+ab')`; left translation by `(a₀,b₀)` has Jacobian `a₀²`; density `(a₀a)^(−2)·a₀²=a^(−2)`; values `1` at `a=1`, `1/4` at `a=2`. | Invariant and positive; retain. |
| 14 | Localization without σ-finiteness | Uncountable discrete `G`, `H={1}`, compact `K` finite: `∫1_K=c·|K|<∞` while `μ(G)=∞`. | Retain. |
| 15 | §1.3 `smear` is total | Trivial action, `μ({1})=2`: `smear(f,v)=2f(1)v`; `f≡1` on ℝ: not integrable, integral junk `0`. | Identities require integrability, as the README says; retain. |
| 16 | Local bound | `f≥0` on `[−1,1]`, `π(t)=e^t`: `|∫fe^t|≤e·∫f`, `C_K=e`. | Retain. |
| 17 | §1.4 convolution order | `S₃` counting: `(δ_s*δ_t)(x)=δ_t(s⁻¹x)` so `=δ_(st)`; `s=(12),t=(23)`: `st=(123)`, `ts=(132)`. | Reversed order excluded; retain. |
| 18 | Associativity | ℤ: `δ₁*δ₂=δ₃`, `(δ₁*δ₂)*δ₃=δ₆=δ₁*(δ₂*δ₃)`. | Retain. |
| 19 | Modular factor | Affine right translation by `(a₀,0)`: `∫F(aa₀,b)da db/a²`, substitute `a'=aa₀`: `=a₀∫F`, so `c(a₀,0)=a₀`; agrees with A7's `∫f(xg)=c(g)∫f` and README:170. | Retain. |
| 20 | Involution | A7 `f*(x)=c(x)·conj f(x⁻¹)`: `(f*)*=c(x)c(x⁻¹)f=f`; affine `c(2,0)c(1/2,0)=1`. Unimodular cyclic: `δ_s*=δ_(s⁻¹)`, unitary `π(s)*=π(s⁻¹)`. | Retain. |
| 21 | §1.5 discrete unit | `μ({1})=2`, `u=1_{1}/2`: `(u*u)(1)=u(1)²·2=1/2=u(1)`; unnormalized: `(1_{1}*1_{1})(1)=2`. | Retain. |
| 22 | Mass vs localization | Trivial action: mass-one kernel `1↦1`, mass-zero `1↦0`; a kernel supported away from `1` fails small neighborhoods. | Retain. |
| 23 | §2.1 regularity, both directions | Trivial action: `E^k=E`, `p_m=‖v‖`; zero space: all seminorms `0`. `L²` step: in `E⁰`, not `E¹` (row 7). | Retain. |
| 24 | Smooth topology strictly finer | `C(S¹)`, `v_n=e^(inx)/n`: `p₀=1/n`, `p₁=1/n+1`. | Retain. |
| 25 | Basis change | `e^(ix)`: basis `∂x` gives `p_m=m+1`; basis `2∂x` gives `Σ_(j≤m)2^j=2^(m+1)−1`; `m=2`: `3` vs `7`. | Equivalent topologies, unequal seminorms; retain. |
| 26 | Frame bridge | ℝ, frame `2∂x`, `f=x`: frame derivative `2`, inverse coefficient `1/2`, coordinate derivative `1`. | Retain. |
| 27 | §3.1 bracket | `HN=E₁₂`, `NH=0`, `[H,N]=N`; `[H,N]v=(1,0)`; reversed sign gives `(−1,0)`. | Retain. |
| 28 | Enveloping order/unit | `1·v=v`; `(HN)v=(1,0)`, `(NH)v=0`. | Retain. |
| 29 | Derivative estimate | `X=c∂x` on `e^(ix)`: `p_m(dπ(X)v)=|c|(m+1)≤|c|·p_(m+1)(v)=|c|(m+2)`. | Retain. |
| 30 | §3.2 Ad | `g=diag(2,1)`: `gNg⁻¹=2N`; on `(0,1)` both sides give `(2,0)`. | Retain. |
| 31 | Disconnected covariance | `ℝ⋊{±1}`: reflection conjugates `D` to `−D`; on `f(x)=x` both sides `−1`. | Retain. |
| 32 | §3.3 left/right fields | Affine: `L_H=a∂a`, `L_N=a∂b`, `R_H=a∂a+b∂b`, `R_N=∂b`; `[L_H,L_N]=L_N`, `[R_H,R_N]=−R_N`; `R_H b=b`, `L_H b=0`. | `X↦−R_X` is the Lie map; the supplier's `L_X` (differentiating `f(exp(tX)g)`) is this `R_X`; retain. |
| 33 | Smoothing sign | `e^t`: `dπ(X)π(f)v=∫fe^t·v`; `π(−R_Xf)v=−∫f'e^t=∫fe^t`. Order: `R_HR_N b=0`, `R_NR_H b=1`. | Retain. |
| 34 | §3.4 `q_X` and the formula | From `∫F(xe^(tX))=c(e^(tX))∫F` with `F(x)=f(xe^(−tX))π(x)v`: derivative at `0` gives `π(f)dπ(X)v=π(q_Xf−L_Xf)v`. Affine: `c(e^t,0)=e^t`, `q_H=1=tr(ad H)`; `c(1,t)=1`, `q_N=0=tr(ad N)`; `∫L_Hf dμ=∫∂_af da db/a=∫f/a² da db=∫f`, so `∫(q_Hf−L_Hf)=0` for the trivial action; without `q` the value is `−∫f`. | Sign and `q` term confirmed; retain. |
| 35 | §4.1 approximation | Trivial action: error `0` in every `p_m`. Circle: Fourier tails `Σ_(|n|>N)|n|^m|c_n|→0` for smooth `f`. | Retain. |
| 36 | Generic compact gap | `K=∏C₂`: a function of `r` coordinates has orbit span `≤2^r`; `r=0`: constants, dimension `1`; `K` non-discrete with trivial identity component, not Lie. | Only the supplier's theorem applies; retain. |
| 37 | Complexification/projection | `x↦(x,0)↦x`; `‖Re z‖≤‖z‖`; `Re e^(ix)=cos x`, rotations give `cos(x−θ)=cosθ cos x+sinθ sin x`, real span dimension `2`. | Retain. |
| 38 | Half-line dictionary | `e^t`: `A^n v=v`, one-sided orbit derivative at `0` equals `v`; `X=0`: powers `0` for `n≥1`. | Retain. |
| 39 | §5.1 native derivative and Fourier sign | `D=Distribution.lineDerivCLM 1`: `(D[g])(φ)=−∫gφ'=∫g'φ`, so `D[g]=[g']`; `F(g'')(y)=(2πiy)²ĝ=−4π²y²ĝ`; `(−1)^1α₁D²[g]↔+4π²α₁y²ĝ`; `Σ(−1)^nα_nD^(2n)[g]↔(Σα_n(2π)^(2n)y^(2n))ĝ`, all coefficients positive, `=ϕ_λ(y)ĝ` with `a_n=α_n(2π)^(2n)`. | Alternating signs are forced by the convention; retain. |
| 40 | Multiplier ratio | `y=0`: `1`; `y≠0`: `Σ_(n≤N)a_ny^(2n)/ϕ(y)∈(0,1)`; `λ=2,4`, `y=1`: `ϕ=(5/4)(17/16)=85/64`, `N=0` ratio `64/85`. | Retain. |
| 41 | Tail maximum | `F(λ)=λe^(−2πλ)`: `F'=e^(−2πλ)(1−2πλ)`: `+1/2·e^(−1/2)` at `1/(4π)`, `−e^(−2)` at `1/π`; maximum at `1/(2π)`. | Global monotonicity is false; retain. |
| 42 | Simultaneous bounds | `β₁=1/10`, `D₃=100`: need `α₁≤1/10` and `100α₁≤1`, so `α₁≤1/100`; the maximum `1/10` gives `100·(1/10)=10>1`. | Minimum required; retain. |
| 43 | `α₀` free, `X=0` | `X=0`: `η=α₀v`; identity `α₀(∫g)v=(1+∫h)v`. Pairing the distribution identity with `χ≡1` near `[−ε,ε]`: left `α₀∫g` at every `N` (higher derivatives integrate to `0`), right `χ(0)+∫h=1+∫h`. | No bound on `α₀`; the Lean's `0<n→α n≤β n` is right; retain. |
| 44 | `ε=0` excluded | Supports in `{0}`: `g=h=0`, left `0`, right pairs to `χ(0)=1`. `ε=1`: a bump in `[−1/2,1/2]` is admissible. | `0<ε` is necessary and present; retain. |
| 45 | Vector series signs | `e^t` orbit: `A^(2n)v=v`, `η=Σ(−1)^nα_n v`; pairing with `χ=e^t`: `∫g^(2n)e^t=∫ge^t`, limit `1+∫he^t`; hence `v=π_X(g)η−π_X(h)v`; adding gives `v+2π_X(h)v`. | Subtraction confirmed; retain. |
| 46 | Weak vs norm | `ℓ²`: `e_n⇀0`, `‖e_n‖=1`. | Equicontinuity and the compact paired family are essential, as stated; retain. |
| 47 | Native junk values | `lineDerivCLM` at order `⊤`: condition `⊤+1≤⊤` holds (`TestFunction.lean:582`), no zero branch; smooth compact `g` is locally integrable so `ofFun` is the integral (`Distribution.lean:306`); `delta 0` with `0∈⊤` is evaluation (`Distribution.lean:208`). | Retain. |
| 48 | Dilation to support `ε` | `(μ_cT)(φ)=T(φ(c·))`: `μ_cδ=δ`, `μ_c[g]=[c⁻¹g(·/c)]`, `μ_cD^(2n)=c^(2n)D^(2n)μ_c`, so coefficients become `α_nc^(2n)≤α_n` for `c=ε/3≤1`, `α₀` unchanged. | Lemma 5.1's scaling remark and the Lean bounds agree; retain. |
| 49 | Topology of convergence | The Lean limit is in `𝓓'(ℝ,ℝ)=𝓓(ℝ)→L_c[ℝ]ℝ` (uniform on compact subsets of the LF space, `CompactConvergenceCLM.lean:63`). A pointwise convergent sequence on the barrelled space `𝓓(ℝ)` is equicontinuous, hence uniformly convergent on compact sets; on `D_[−5,5]` the limit has finite order `N` and the partial sums are bounded by one `C‖χ‖_(C^N)`. | Native topology is implied by Casselman's dual convergence; retain. |
| 50 | §6.1 zero and one-point group | `v=0`: `n=0`. Trivial group, `μ({1})=2`: `f(1)=1/2`, `w=v`: `smear=f(1)μ({1})v=v`; functions: `h=φ`, `∫f(y)φ(y⁻¹x)dμ=(1/2)·2·φ(x)=φ(x)`. | Retain. |
| 51 | Discrete `G` in the Lean statements | `1_{1}/μ({1})` is a `LieTestFunction` (any map on a 0-dimensional manifold is smooth; support `{1}` compact); `tsupport={1}⊆U` for every open `U∋1`. | Dimension zero is covered; retain. |
| 52 | Product-chart density | `J=2`: `∫(∏g_i/2)·2dt=∏∫g_i`; omitting `J` doubles. `J>0`, no zero denominator. | Retain. |
| 53 | Function-support refinement | Derivatives of a bump in `[−1,1]` are supported in `[−1,1]`; fixed-support limits vanish at `2`; a translate by `3` can be nonzero at `3`. | Fixed-support route needed, present; retain. |
| 54 | What is not claimed | `supp(f_j*h_j)⊆U·tsupport φ`, larger than `tsupport φ`; the Lean asserts only `tsupport h_j⊆tsupport φ` and the identity. | No overclaim; retain. |
| 55 | §7.2 lifting | Projection `ℝ²→ℝ`, trivial actions: `1` lifts to `(1,0)`, kernel `{0}×ℝ`; zero quotient: `0↦0`. `T=0` is surjective only for `F=0`. | Retain. |
| 56 | Surjectivity, not dense range | `ℓ²`, `x_n↦x_n/n`: dense range, `(1/n)` has no preimage. | `smooth_lift` requires surjectivity; retain. |
| 57 | §7.3 shuffle | `e^t⊗e^(2t)`: orbit `e^(3t)`, first derivative `3=1+2`, second `9=1+2·1·2+4`. | Retain. |
| 58 | Scalar comparisons | `ℝ⊗̂ℝℝ=ℝ`, complexification `ℂ`, `(1⊗1)⊗1↦1⊗1`; balancing `ℂℝ⊗̂ℝℂℝ` (real dimension `4`) `→ℂ` (dimension `2`), `i⊗1−1⊗i↦0`. | Mathematics right; owner missing (R01). |
| 59 | Dense range, no isomorphism | Trivial one-dimensional factors: `1⊗1↦1`, full range; zero factor: both sides `0`. | No injectivity claimed; retain. |
| 60 | §7.4 contragredient | `C(S¹)'`: `‖δ_z−δ₁‖=2` for `z≠1` (test `f` with `f(z)=1`, `f(1)=−1`, `‖f‖=1`), excluded; Haar measure: constant orbit, included; `0` included. `e^t`: `λ↦e^(−t)λ`, derivative pairs as `−λ(x)`. | Correct subspace and negative transpose; retain (locator: R02). |
| 61 | §8.1 units | Trivial action: `2↦1/2`, derivatives `0`. Zero ring: `0` is a unit with inverse `0`, smooth; the Lean `Aˣ` admits it. | Retain. |
| 62 | Noncommutative inverse rule | Conjugation by `diag(e^t,1)`, `a=I+E₁₂`: `π(t)a=I+e^tE₁₂`, derivative `E₁₂`; `a⁻¹=I−E₁₂` (`(I+N)(I−N)=I`), derivative `−E₁₂`; `−a⁻¹E₁₂a⁻¹=−E₁₂` since `E₁₂²=0`. | Retain. |
| 63 | Algebra-action hypothesis | `a↦e^ta`: at `a=b=1`, `e^t` vs `e^(2t)`; `hmul` excludes it. `h1` is needed to see `π(g)a` is a unit with inverse `π(g)(a⁻¹)`. | Retain. |
| 64 | Leibniz vs derivation | `f=h=e^(ix)`: `D²(fh)(0)=−4`; `D²f·h+2Df·Dh+f·D²h=−1−2−1=−4`; derivation-only rule `−2`. | Retain. |
| 65 | Torus star law and seminorms | `δ₁(U₁)=2πiU₁`, `δ₁(U₁*)=−2πiU₁*=(δ₁U₁)*`. `θ=0`, `a=1+U₁`: `Q₀=1`, `P₀=sup_(|z|=1)|1+z|=2`. | Not isometric, as stated; retain. |
| 66 | `Q_k≤C_kP_k` | `|a_(r,s)|≤‖a‖` (coefficient `=τ(a(U₁^rU₂^s)*)`, `τ` a state); `(2π|r|)^k|a_(r,s)|≤‖δ₁^ka‖`; `(1+|r|+|s|)^k≤3^k·max(1,|r|^k,|s|^k)`; `C_k=3^k·max(1,(2π)^(−k))`. | Finite constant exists; retain. |
| 67 | `P_m≤D_mQ_(m+3)` | `‖δ_wa‖≤Σ(2π)^(|w|)|r|^j|s|^l|a_(rs)|≤(2π)^mQ_(m+3)Σ(1+|r|+|s|)^(−3)`; shell `|r|+|s|=n` has `4n` points, `Σ4n(1+n)^(−3)<∞`; exponent `2` diverges. | Loss of three orders suffices; retain. |
| 68 | `smooth_inverse` without `hπ` | Swap action on `ℂ×ℂ` along a discontinuous character: `a=(1,1)` constant orbit, `a⁻¹=(1,1)` smooth; `Ring.inverse` smooth on units of a complete normed ring. | Statement holds without `hπ` (R03). |
| 69 | `dixmierMalliavin_function` as a vector theorem | Left regular action on `C₀(G)`: `φ∈D(G)` is a smooth vector (orbit derivatives `−R_wφ` are bounded continuous); the factorization's inner vectors are series of derivatives of `φ` converging in a fixed-support smooth space, so `h_j∈D(G)`, `tsupport h_j⊆tsupport φ`; evaluating `λ(f_j)h_j` at `x` gives `∫f_j(y)h_j(y⁻¹x)dμ`. | The function headline follows from the vector route; retain. |
| 70 | `smooth_lift` route | `w=Σρ(f_j)w_j`, lift `w_j` to `v_j`, `v=Σπ(f_j)v_j`: `Tv=Σρ(f_j)Tv_j=w` since `T` is continuous and intertwining; `v` smooth by `isSmoothLieVector_smear`. No open mapping theorem is needed for the Lean statement. | Retain. |

### Pinned-library inspection and duplication audit

Pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` (the worktree's `lake-manifest.json`). Paths are relative to the package roots.

| Declaration | File and line | What it provides |
|---|---|---|
| `ContRepresentation`, `ContIntertwiningMap` | `Mathlib/RepresentationTheory/Continuous/Basic.lean:54,80` | A monoid homomorphism into `V →L[R] V`; the file's header says continuity in the group variable is not assumed, which is why `HasContinuousOrbits` is explicit. |
| `TestFunction` | `Mathlib/Analysis/Distribution/TestFunction.lean:67` | Smooth, compact support, support in `Ω`; LF topology at :272. |
| `TestFunction.lineDerivCLM`, `lineDerivCLM_apply_of_le` | same file :560, :582 | Zero map unless `k+1≤n`; at `⊤` the condition holds. |
| `Distribution` | `Mathlib/Analysis/Distribution/Distribution.lean:165` | `𝓓^{n}(Ω,ℝ) →L_c[ℝ] F`, compact-convergence topology. |
| `Distribution.delta`, `.lineDerivCLM`, `.ofFun` | same file :201, :234, :302 | Evaluation; minus the transpose of test differentiation; integration against locally integrable `f`, zero otherwise (:311). |
| `ContMDiffMap` | `Mathlib/Geometry/Manifold/ContMDiffMap.lean:38` | Bundled smooth maps; `LieTestFunction` is its compact-support subtype. |
| `LieGroup`, `ContMDiffMul` | `Mathlib/Geometry/Manifold/Algebra/LieGroup.lean:72`, `Monoid.lean:65` | Smooth inversion and multiplication; extends `IsManifold`. |
| `BoundarylessManifold` | `Mathlib/Geometry/Manifold/IsManifold/InteriorBoundary.lean:165` | As in the Conventions. |
| `IsHaarMeasure`, `Measure.Regular` | `Mathlib/MeasureTheory/Group/Measure.lean:785`, `Measure/Regular.lean:317` | Finite on compacts, left invariant, open-positive; regularity separate, as README:21 says. |
| `Continuous.integrable_of_hasCompactSupport`, `banach_steinhaus` | `Mathlib/MeasureTheory/Function/LocallyIntegrable.lean:622`, `Mathlib/Analysis/Normed/Operator/BanachSteinhaus.lean:36` | As cited at README:42. |
| `ContinuousLinearMap.isOpenMap` | `Mathlib/Analysis/Normed/Operator/Banach.lean:228` | Normed spaces only; the Fréchet version is correctly a target of §7.2. |
| `oneParameterSubgroup`, `contMDiff_oneParameterSubgroup` | `TauCeti/Geometry/Lie/Exponential/Basic.lean:180,207` | As cited. |
| `TauCeti.Semigroups.StronglyContinuousSemigroup`, `smoothVectors` | `TauCeti/Analysis/Semigroups/Basic.lean:43`, `Generator/SmoothVectors.lean:49` | Real semigroups on nonnegative time; `smoothVectors=⨅ domainPow`. |
| `TauCeti.Complexification`, `.reCLM`, `.ofRealLI`, `ContinuousLinearMap.complexify` | `TauCeti/Analysis/Normed/Module/Complexification.lean:80,274,288,356` | Namespaces as cited at README:46. |
| `TauCeti.chartVolumeDensity` and companions; `Homeomorph.measurePreserving_riemannianVolume` | `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Basic.lean:46,59,72`; `Isometry.lean:177` | Positivity on the chart domain; smoothness needs `IsManifold I (n+1)`; the isometry theorem needs Lindelöf source and target, as README:48 states. |

Object search at both pins for a compactly supported scalar parametrix, a Dixmier–Malliavin factorization, a Lie-group smooth-vector predicate or a locally convex projective tensor found nothing; AutomorphicFormsOnReductiveGroups' `Suggested.lean` at its head declares only `compactFinite_dense_locallyConvex` (:48), so no fully qualified name is declared twice. The roadmap grep across main and the 440 open heads for Dixmier–Malliavin finds the Fréchet, support-free statement in AutomorphicFormsOnReductiveGroups §2.7 (README:476) and consumers citing that section (TwistedAutomorphicDescents, AutomorphicLFunctionsAndLocalFactorsPartII); the support-controlled Banach version with real coefficients and the function-support refinement is owned only here. The grep for locally convex projective tensors finds NoncommutativeGeometry N1 (complex, main), AutomorphicSpectralTheory §0.11 consuming N1, LocallyAnalyticDistributions (nonarchimedean), and the open NoncommutativeGeometry revision's N1.Tensor (real, ineligible): hence R01. The Fréchet open mapping theorem over ℝ or ℂ has no earlier owner (LocallyAnalyticDistributions' `naFrechet_openMapping` is over an ultrametric field and later in the order).

### Cross-roadmap citations resolved this round

Main is `929496d4221b974c60787257a3cdc28b600fc49c`. AutomorphicFormsOnReductiveGroups is not on main; it was read at its open head (pull request #1037) through the roadmap tool, and it is earlier than this roadmap in the merge order.

| Citation | Resolved passage | Result |
|---|---|---|
| AutomorphicFormsOnReductiveGroups §0.1a, §2.1, §2.7 | README:113–124, :300–342, :468–496 at its head | Complex `LieTestFunction` with finite components; `compactFinite_dense_locallyConvex`; `IsLieSmoothVector`, word criterion, topology, smoothing, density, Fréchet Dixmier–Malliavin. Its :7 names SmoothBanachRepresentations as a consumer, not a supplier: no cycle. |
| `gap:banach-gfinite-density` | AutomorphicFormsOnReductiveGroups README:52, :302–309; CompactGroups main README:318 (Layer 5, Peter–Weyl) | The gap is AutomorphicFormsOnReductiveGroups' declared contract on CompactGroups; this roadmap's :58 restates it “as required by §2.1” and declares no gap of its own (it has no plan). Consistent; a reader would be helped if :58 said it is the supplier's declared gap. |
| CompactGroups Layer 5 | main README:318 | Representative-function density present. The open CompactGroups revision (:20–24) records the same allocation (§4.1 here owns the real/complex smooth-topology comparison). |
| LieGroups Layers 0–3 | main README:233, :261, :275, :300 (automatic smoothness of continuous homomorphisms at :307) | Present. |
| OneParameterSemigroups Part A | `Completed/OneParameterSemigroups/README.md:90` | Present. |
| BanachSpaceTheory B4 | main README:167–206 | Real/complex completed Banach projective tensor and universal property present. |
| NoncommutativeGeometry N1, N6 | main README:84–92 (complex), :475–495 | N1 complex only (R01); N6's `2πi` derivations, rapid-decay seminorms and smooth-vector identification match §8.1. |
| BanachAlgebras A1–A2, A7 | main README:75–95, :161, :875–928 | Inversion/resolvent, holomorphic calculus, `∫f(xg)=c(g)∫f`, `f*(x)=c(x)·conj f(x⁻¹)`, chosen approximate identity, integrated representations. Its :929 reference to this roadmap is an ownership boundary (“not prerequisites”), not a dependency. |
| NoncompactQuantumSymmetry M0, OperatorKTheory K3 (consumers) | heads given by the brief: NQS README:628 (Layer 3 M0, `−R_X` at :699–700), OKT README:356 (inverse-closed Fréchet subalgebras) | Downstream only; neither is cited as a supplier. |

Every *Needs:* line was read: each names Layers of this roadmap, Mathlib or Tau Ceti declarations, or the suppliers above; none names a later roadmap. Both `*Needs:*` lines of Layer 7 name the Part II gap (R01).

## Not verifiable

- Dixmier–Malliavin, *Factorisations de fonctions et de vecteurs indéfiniment différentiables*, Bull. Sci. Math. 102 (1978), Lemma 2.5 and Theorems 3.1, 3.3: the sources service again found no legal readable copy (`no legal source found`); the request is recorded in the job's `needs-references.toml` under the existing key `dixmier-malliavin`. The README labels these locators uncertified and routes every claim through Casselman, so the review is complete without it.
- The board manifest for this roadmap has no entries; this review edits no manifest. Casselman's text was read from the sources cache (author-hosted copy, revision of 24 January 2016).
- The fixed-support strong-dual comparison and the Banach-vector passage of §5.1 are proof obligations the source does not state; their routes were checked (rows 46, 49) but not their completed proofs.
- Ownership against open pull requests was checked only through the roadmap tool's index and the sibling checkouts the brief lists; the five board packages listed in the brief are arithmetic and logic packages whose contents were not fetched.

## Source issues

- **Misprint** in casselman at proof of Lemma 4.2, printed p.10 (line 509): the source says the derivative of `λ^(n+1)e^(−2πλ)` has a second term without the power of λ and a factor `λ^(n−1)`; it should be `(n+1−2πλ)λ^n e^(−2πλ)`; affects the proof.
- **Misprint** in casselman at proof of Lemma 4.1, printed pp.10–11 (lines 551–561): the source says the positive coefficient series equals `χ_λ(z)` and then divides by `χ_λ`; it should say `ϕ_λ(z)`, the reciprocal of `χ_λ`; affects the proof.
- **Gap** in casselman at proof of Lemma 4.4, printed p.11 (line 578): the source says to take `α_j=1/(j²C*_j)`; it should guard `j=0` and `C*_j=0`, for example `α_j=2^(−j)/max(1,C*_j)`; affects the proof.
- **Gap** in casselman at Lemma 5.1, printed p.12 (lines 609–610): the source says the coefficients satisfy `α_m≤A_m` for every `m` while its proof inherits `α₀=1` from Lemma 4.1; it should restrict the bound to `m≥1` or rescale the limit; affects a stated result.
- **Misprint** in casselman at proof of Lemma 5.1, printed p.12 (line 623): the source says to replace the bounds by a supremum of upper bounds; it should take the minimum so that every upper bound holds; affects the proof.
- **Misprint** in casselman at proof of Proposition 6.1, printed p.13 (lines 654–658, 661–668): the source says the series has coefficients `α_n` without alternating signs; it should carry `(−1)^n` as in Lemma 5.1; affects the proof.
- **Misprint** in casselman at proof of Proposition 6.1, printed p.13 (lines 669–672): the source says `v=π(μ₀)α₀+π(μ₁)α₁` with `α₁=v`; from `π(μ₀)α₀=v+π(μ₁)v` the second term must be subtracted (or `μ₁` negated); affects the proof.
