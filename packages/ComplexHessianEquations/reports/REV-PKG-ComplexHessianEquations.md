<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17935#issuecomment-6905970176 -->
Review (claude) of 1c0511b

Verdict: needs_changes

1. **F01** (P3) `exists_hessianPair` is said to state sharpness, and states only the lower bound

   **Location.** `packages/ComplexHessianEquations/README.md` line 329: "with `γ = (binom(n, k)^{1/k}/n)^n`,
   which is sharp, attained at `λ = e` (`exists_hessianPair` in `Suggested.lean`)". Also
   `packages/ComplexHessianEquations/Suggested.lean` lines 25–26 ("with its sharp structural constant")
   and lines 222–223 ("which is attained at `λ = (1, …, 1)`").

   **Claim.** The Lean headline carries the sharp constant: the bound and its attainment at `e`.

   **Witness.** `Suggested.lean` lines 224–228: the conclusion ends at
   `P.IsStructural (((n.choose k : ℝ) ^ (1 / (k : ℝ)) / n) ^ n)`, which is `∀ μ ∈ P.cone, γ ≤ ∏ j, ∂_j f(μ)`.
   No conjunct evaluates the product at `e`.

   **Repair.** Add the attainment as a last conjunct of `exists_hessianPair`, leaving README and
   docstrings as they are:

   ```lean
         P.IsStructural (((n.choose k : ℝ) ^ (1 / (k : ℝ)) / n) ^ n) ∧
         ∏ j, fderiv ℝ P.f 1 (Pi.single j 1) = ((n.choose k : ℝ) ^ (1 / (k : ℝ)) / n) ^ n := by
   ```

   Tested: the statement with this conjunct elaborates on a scratch copy at the pins (`sorry` the only
   warning). Value check of the new conjunct: `∂_j σ_k^{1/k}(e) = (1/k)·binom(n,k)^{1/k−1}·binom(n−1,k−1) = binom(n,k)^{1/k}/n`;
   at `(n,k) = (1,1)`: `1 = 1`; `(2,1)`: `1·1 = (2/2)² = 1`; `(2,2)`: `(1/2)² = 1/4 = (1/2)²`;
   `(3,2)`: `(3^{−1/2})³ = 3^{−3/2} = (√3/3)³`.

One finding, P3, none blocking. No previous review of this package and no maintainer notes.
Everything else checked is recorded under `## Verified sound` with the values computed.

## Verified sound

**Elaboration.** `lake env lean` on `packages/ComplexHessianEquations/Suggested.lean` at the pins
(Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…`, both equal to the manifest's revisions and to the README's
"Read at commit" lines): exit 0, 18 warnings, all `declaration uses sorry`, one per theorem. No
`set_option`, no `lemma`, no `#eval`/`#synth`/`#print`, no sorried `def`; `import Mathlib` followed by
six `TauCeti.*` modules, each used.

**Padding probe (all 18 theorems, not a sample).** Each `sorry` replaced by
`first | rfl | (simp; done) | infer_instance | (intros; trivial) | sorry` on a scratch copy: 18 of 18
still report `sorry`. None restates a definition, mirrors a Check or computes a small value. The 14
definitions all have real bodies and each is used by a stated theorem.

**Signatures.** Elaborated types of the 32 declarations compared with the README statements. The five
flagged as losing `[FiniteDimensional ℂ E]` or `[IsManifold 𝓘(ℂ, E) ∞ X]` are the definitions
`hermitianForm`, `ddbarHermitianForm`, `IsRelEigenvalueVector`, `formPow`, `IsNormalizedSolution`,
whose bodies need neither; every theorem keeps both. No change needed.

**Headline theorems.** From the README summary: Lewis's theorem (3 statements), convexity of
spectral domains and concavity of spectral functions, Gårding's theorem (2), `Γ(σ_k, e) = Γ_k`,
concavity of Hessian quotients, the Hessian pair, uniqueness, Yau's theorem, local and global
exponential integrability, and the four `L^∞` estimates (§§8.3, 8.4, 8.6, 8.7). All 18 are stated; the
module docstring says none is unstatable. The intermediate estimates (§§5.x, 6.2–6.5, 8.1, 8.2, 8.5)
are README-only, as "How to read the build" says.

**Dependency check.** Output: `depcheck: 241 roadmaps, 2254 edges, 0 problem(s)`. No UPWARD, CYCLE
or `moved:` line.

**Supplier citations resolved on main.** PDE §3.2 (C13) (strong maximum principle with Gilbarg–Trudinger
Theorem 3.5; the Aleksandrov–Bakelman–Pucci paragraph with Theorem 9.1, same hypotheses as the
contract), §5.4 (E23), §5.6 (E25) (Theorem 6.2, same scaled form); RiemannianGeometry R5c item 4 and
`exists_pos_laplaceBeltrami_eigenvalue_isLeast` (its `Suggested.lean` line 534);
ComplexKahlerGeometry Layers K1, K2, K4, §5.7 (K5a), §6.1 (K6.0, with `Δ_d=2Δ_∂=2Δ_∂̄` and normal
coordinates); PseudodifferentialOperators §§5.4, 6.2; DifferentialGeometry Layers 0, 1, 5, 12;
ComplexManifolds Milestones 1, 2; AffineMorseLefschetz §1.1; OperatorTheory PD-A51, PA-B32, MAJ-A27;
OptimalTransport Layer 6; ComplexComparisonPartII C5.4. At open heads: K3Surfaces §2.1,
ShimuraVarieties §7.0g, NumberFieldEnumeration §1.1. None is a supplier later in the merge order.

**Declared gap `weak-harnack-supersolutions`.** Same slug in `design/plan.json` and in the README,
supplier PDE §5.4 (E23). Precise (dimension, exponent range, weak formulation, essential infimum).
Minimal: PDE §5.4 on main states the weak Harnack inequality only for the homogeneous equation, and
the pin (`TauCeti/Analysis/PDE/Regularity/Harnack.lean` line 284) is the homogeneous supersolution
case, as the README says. Acceptance would be conditional on it.

**Library declarations opened at the pins (file and line).**
Mathlib: `LinearMap.IsSymmetric.eigenvalues` (`Analysis/InnerProductSpace/Spectrum.lean` 277),
`eigenvectorBasis` (297), `eigenvalues_antitone` (309), `det_eq_prod_eigenvalues` (384);
`Matrix.IsHermitian.eigenvalues` (`Analysis/Matrix/Spectrum.lean` 67, through
`Fintype.equivOfCardEq`, as the README says); `selfAdjoint.submodule` (`Algebra/Star/Module.lean` 139);
`Matrix.frobeniusNormedSpace` (`Analysis/Matrix/Normed.lean` 562); `Polynomial.Splits`
(`Algebra/Polynomial/Splits.lean` 35, closure of constants and monic linear factors);
`MvPolynomial.esymm` (`RingTheory/MvPolynomial/Symmetric/Defs.lean` 202);
`HasStrictFDerivAt.toOpenPartialHomeomorph` (`Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean` 118);
`HasStrictFDerivAt.implicitFunction` (`Analysis/Calculus/Implicit.lean` 465, in the
finite-dimensional section); `ConvexOn.map_integral_le` (`Analysis/Convex/Integral.lean` 196);
`ArzelaAscoli.isCompact_closure_of_isClosedEmbedding` (`Topology/UniformSpace/Ascoli.lean` 474).
Tau Ceti: `eigenvalues_eq_iSup_iInf_re_inner` (`Analysis/InnerProductSpace/CourantFischer.lean` 251),
`eigenvalue_mono` (363), `abs_eigenvalue_sub_eigenvalue_le` (440), `abs_eigenvalues_sub_le_opNorm` (479);
`re_trace_comp_le_sum_eigenvalues_mul_eigenvalues` (`…/HoffmanWielandt/Basic.lean` 78);
`sum_re_inner_apply_self_le_sum_eigenvalues` (`…/KyFan.lean` 489); `LinearMap.concaveOn_det_rpow`
(`Analysis/Matrix/MinkowskiDeterminant.lean` 159, on `{A | A.IsPositive}`);
`Real.prod_rpow_add_prod_rpow_le_prod_add_rpow` (`Analysis/MeanInequalities.lean` 68);
`TauCeti.leviForm_apply_self`, `re_leviForm_nonpos_of_isLocalMax` (`Analysis/Complex/LeviForm.lean` 150);
`manifoldLeviForm` (`Geometry/Manifold/Complex/LeviForm.lean` 106) with lines 156, 165, 172, 179, 206,
241, 292; `SmoothTwoForm.Tames`, `Invariant`, `Compatible` (`Geometry/Symplectic/Manifold/TwoForm.lean`
174, 202, 231); `SmoothForm.IsClosed` (`…/DifferentialForm/Closed.lean` 43); `RoughForm.wedge`,
`wedge_apply` (`…/Wedge/Basic.lean` 395, 404, factor `(k!·l!)⁻¹`); `integralTopForm`
(`…/Integration/TopForm.lean` 518, zero unless integrable); `complexManifoldOrientation`
(`Geometry/Manifold/Complex/Orientation.lean` 216; basis order `(b₀, I•b₀, b₁, I•b₁, …)` at
`LinearAlgebra/Complex/Orientation.lean` 156, so `ω^n > 0`); `le_setAverage_ball_of_laplacian_nonneg`
(`…/Harmonic/MeanValue/Basic.lean` 464); `exists_eLpNorm_le_mul_eLpNorm_mgradient_two_add`
(`Geometry/Manifold/Riemannian/Sobolev.lean` 185, hypothesis `2 < finrank ℝ E`).
All README-cited names resolve; every backticked name of the roadmap's own is declared.

**Duplication by object.** Grepped the pins for hyperbolic polynomials, Gårding, Newton/Maclaurin for
`esymm`, derivatives or convexity of eigenvalue functions, plurisubharmonic integrability, complex
Monge–Ampère, Yau. Found only: Schur–Horn, Rado and Davis's eigenvalue-change bound
(`Analysis/InnerProductSpace/SchurHorn.lean`, `DavisEigenvalueChange.lean`), which do not state the
convexity of spectral domains or concavity of spectral functions; Ky Fan sums of singular values
(`kyFanSum_add_le`), which the README correctly separates from eigenvalue sums; `det^{1/n}` concavity,
cited as a Check. No target is already proved at the pins.

Overlap check: read PDE, ComplexKahlerGeometry, CalibratedGeometry, Yamabe (main) and K3Surfaces (open), and searched ShimuraVarieties and NumberFieldEnumeration (open) at the sections cited; one shared object, the Monge–Ampère equation at `n = 2` on a K3 surface (K3Surfaces §2.1), owner of the general theorem: ComplexHessianEquations §6.6 (earlier in the merge order, difference stated in Scope and ownership); nothing else shared.

**Shape.** Eight layers, each ending in `### Examples` and `### Dependencies`; 38 `**Checks.**`
blocks, each definition with API and at least three Checks; no LaTeX delimiters, no process words,
pull-request numbers, anchors or machine paths; layer names are mathematical.

### Adversarial table

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §1.2 Ky Fan gradient | `T = diag(3,1,1)`, `m = 1, 2` | `m=1`: gap `3>1`, gradient `diag(1,0,0)`; `m=2`: `κ_2(T+t·diag(0,1,−1)) = 4+|t|` | sound |
| §1.2 trace bounds | `F=diag(2,1)`, `B=diag(0,3)` | lower `3`, `tr = 3`, upper `6` | sound |
| §1.3 Lewis (Lean) | `n = 0`; `f` symmetric on `ℝⁿ` versus on `Ω` | `n=0`: both sides trivially differentiable; `f(μ) = F(diag μ)` gives `⇒` of the `C¹` form | sound |
| §1.4 concavity (Lean) | `f = σ_2^{1/2}` at `(4,1)`; `A=diag(4,1)`, `B=diag(1,4)` | `∂_1 f = 1/4 ≤ ∂_2 f = 1`; `F(A)=F(B)=2 ≤ F((A+B)/2)=5/2` | sound |
| §2.1 generalized Newton–Maclaurin | `λ=(1,2,3)`; `(r,s,k,l) = (3,2,2,1), (3,1,2,0), (2,0,2,1)` | `18/11 ≤ 11/6`; `1.732 ≤ 1.915`; third (`l>s`) `1.915 ≰ 1.833` | sound, hypothesis needed |
| §2.2 `garding` (Lean) | `N=0`; `p=x₁` on `ℝ²`, `a=(1,0)`, `b=(1,5)`; `m=0` | `N=0`: no homogeneous `p` of degree `≥1` with `p(a)>0`, vacuous; cone `{x₁>0}`, `D_b p = 1 > 0`, same cone for `b`; `m=0` excluded by `hm` | sound |
| §2.2 symmetric control | `p = 2xy − 0.9(x²+y²)` | discriminant `0.76(x₁−x₂)²`; cone `0.627 < x₂/x₁ < 1.595`; `p(1,0.1) = −0.709`; `∂_x p(1,0.7) = −0.4` | sound |
| §2.3 quotient (Lean) | `n=2`, `σ_2/σ_1`; `l=0` | `∂_1 = λ₂²/(λ₁+λ₂)² > 0`; midpoint `1.25 ≥ 0.8`; `l=0` is `σ_k^{1/k}` | sound |
| §2.4 `AdmissiblePair` | `n = 0`; `σ_1 − ε|λ|` | `n=0`: `pos_mem_cone` and `sum_pos_of_mem_cone` (`0<0`) contradict, no pair; `∏∂_j f ≥ (1−ε)^n` with `f<0` somewhere, harmless since `f = c·e^F > 0` on solutions | sound |
| §2.5 Hessian pair (Lean) | `(n,k) = (3,2)`, `(2,2)`, `(n,1)` | `∂_j f(e) = 3^{−1/2}`; `1/4`; `1`; Lemma 4 input `nγ^{1/n} = binom^{1/k}`, Maclaurin `S_k^{1/k} ≥ S_n^{1/n}` | bound sound; see R01 |
| §3.1 `hermitianForm` | `ω = dx∧dy` on `ℂ`; conjugate-linearity | `H(1,1) = ω(1,i) + i·ω(1,1) = 1`; `H(iu,v) = −i·H(u,v)` iff `α(Ju,Jv)=α(u,v)` | sound |
| §3.2 `formPow` normalization | standard `ω` on `ℂ²` | `ω²(∂x₁,∂y₁,∂x₂,∂y₂) = 8/(2!·2!) = 2 = 2!` | sound |
| §3.3 constants | `χ=ω`, `F=0`; `ℂP¹`, `χ=2ω` | `c = binom(n,k)^{1/k}` from `σ_k = c^k`; `c·1 = 2` | sound |
| §4.1 comparison | cone of §1.4 Check, `f = σ_1` / `10σ_1` | `f(1,−0.4) = 6 > f(1.01,0.1) = 1.11` when `Γ+Γ_n ⊄ Γ` | sound, hypothesis needed |
| §4.2 uniqueness (Lean) | `n=0`; convex cone without concavity; two components | vacuous at `n=0`; `Γ` convex cone `⊇ Γ_n` gives `Γ+Γ_n ⊆ Γ`, and `a = ∫∇F_f(h_s)ds > 0` needs only convexity of `Sym_Γ`; `ψ=−1` on `X_2` breaks uniqueness | sound |
| §5.3 | torus, `u = cos 2πx`; `n = 1, 2` | `1/2 = 2π²/4π²`; exponent `2·4/(4−2) = 4`, `2<2` fails at `n=1` | sound |
| §5.4 | `ψ_ε` on `ℂP¹`; divergence form | in `w=1/z`: `(1+ε|w|²)/(1+|w|²)`, smooth, `sup=0` at `∞`; `div(a∇(−φ)) = −2√g·Δ_ωφ ≤ 2A√g` | sound |
| §6.1 identities | torus `n=1`, `q = 1−a cos 2πx` | `x=0`: `q''/(2q) = 2π²a/(1−a) = Δ_ωF`; `x=1/4`: `0 = −2π²a² + 2π²a²`; `Δ'S(0) = q''²/(2q⁴) = 8π⁴a²/(1−a)⁴ = 2·4π⁴a²/(1−a)⁴` | sound |
| §6.1 `ℂP¹` | `g = (1+|z|²)^{−2}` | `Ric = 2ω`, `s = 2`, `B ≡ 2` | sound |
| §6.5 | torus `n=1`, `e^F = 1−a cos 2πx` | `φ = (a/2π²)(cos 2πx − 1)`, `osc = a/π²` | sound |
| §6.6 Yau (Lean) | `n=0`; `F = a` | `n=0`: `X` a point, `∏_∅ = 1 = e^{F+b}` gives `b = −F`, `φ = 0`, unique; `b = −a`, `φ=0` | sound |
| §7.1 one-variable | `v = log(|t−w₀|/2R)`; `v ≡ −A` | `M = 2π ≤ 2π·log4/log(8/7)`; `∫_{D(0,r)}(2R'/|t−w|)^s ≤ 2π(2R')²/(2−s)`; `πr²e^{αA} ≤ C_1` | sound |
| §7.1 local (Lean) | `n=0`; polar formula; quantifier order | `n=0`: `e^{−αu(0)} ≤ e^{αA}`, `α=1/A`, `C=e`; `∫_S∫_D g|t|^{2n−2} = 2π∫_B g`; `C=(5/4)^{2n−2}vol(S^{2n−1})C_1/2π` free of `A` | sound |
| §7.2 global (Lean) | `ℂP¹`, `ψ_ε`; `n=0` | `∫(|z|²+ε)^{−α}` bounded iff `α<1`; `n=0`: integrand `≡ 1` | sound |
| §8.1 | constants of gpt2023 (2.6) | `ε^{n+1} = A(n+1)^n/(n^{2n}γ)`; `Λ = A/((n+1)n^{n−1}γ)` makes `1 − (εn/(n+1))Λ^{−1/(n+1)} = 0` | sound |
| §8.2 | `φ = (1/4)·1_{[0,1/4)}`; `e^{−s}`, `δ_0=0`; `s_0 = 0` | `r/4 < 1/16`; `re^{−r} ≤ 1/e`; steps `s_{j+1}−s_j ≤ 2B_0φ(s_0)^{δ_0}2^{−jδ_0} < 2^{−jδ_0}`; `s=0` follows from right-continuity | sound |
| §8.3 (Lean) | `n=0`; closed versus strict sublevel sets | vacuous at `n=0`; closed-set mass is left-continuous only, strict is right-continuous | sound |
| §8.4 (Lean) | `χ=ω_X`, `F=0`; `φ=−M` | `c^n/V_t = (1+t)^n/((1+t)^nV)`; `E_1(−M) = M`, excluded by the zero of `φ` | sound |
| §8.5 | `n=1` determinant; flat `ℂ³/ℤ⁶`, `q = 1−0.03cos` | `det a = Ĝ²/16`; `V⁻¹∫Fe^{3F} ≈ 7.5·10⁻⁵ > Ent_3 ≈ 4.24·10⁻⁷` | sound |
| §8.6 (Lean) | reduction to §8.3 | `c_1 = 1`, `V_1 = V`, `Ent_n ≤ 1+Ent_p`, `N=1` avoids `n/(n−1)` at `n=1` | sound |
| §8.7 (Lean) | two-valued `F`, `n=1`, `p=q=2`; `k=n` | `0.398 ≤ 1.310`; `4.633 ≰ 4.184` without the first term, `≤ 4.725` with it; `k=n` uses §7.2, `q' < ∞` | sound |
| Conventions | `i∂∂̄|z|²`; `gpt2023` (5.4) | `2ω`, `λ = 2e`; `c_gpt = c/binom(n,k)^{1/k}` | sound |

**Sources: the seeded sample.** All 15 sampled targets checked against the cached texts.
§1.2: lewis1996 line 145–148, 154–159 (Theorem 2.1), spruck2005 line 11089–11091 (Lemma 1.5).
§3.3: gpt2023 line 66–70, 107–111, 974–981; guo-phong2024 line 108–113; tosatti-weinkove2010 line 21–31;
dinew-kolodziej2014 line 56–64. §§4.1–4.2: tosatti-weinkove2010 line 36–47 (Corollary 1). §5.3:
pss2012 line 278–288, 299–303. §5.4: guedj-zeriahi2005 line 255–274 (Proposition 1.7), 138–141; gpt2023
line 689–692. §6.1: pss2012 line 163–164, 837–840, 994–1016, 1046–1064. §6.5: twwy2015 line 134–136;
tosatti-weinkove2010 line 93–99. §7.1: demailly2012 line 1717–1731 (Proposition 4.22, p. 37), line 1534;
pss2012 line 2943–2945; gpt2023 line 287–289. §8.1: gpt2023 line 198–302. §8.2: line 412–426. §8.4:
line 785–850. §8.5: line 458–736. §8.6: line 84–89, 442–457. §8.7: line 861–952. Theorem numbers,
hypotheses and dependence of constants agree; `F` smooth is the source's hypothesis (gpt2023 line 443).
Also read outside the sample: lewis1996 line 77–81, 468–469; spruck2005 line 11072–11100, 11182–11235,
11268–11295, 11303–11314, 11364–11365; guo-phong2024 line 76–104; dinew-kolodziej2014 line 139–172,
259–263; szekelyhidi2018 line 17–31, 183–185; demailly2012 line 15190–15191 (p. 306). The manifest
records all 19 cited works. No locator was flagged by the author as unverified.

**Copyright.** Arrangement: Layer 8 runs gpt2023 §2, §2, §2, §4, §3, §3, §5, an order its `*Needs:*`
lines force (§8.6 needs §§8.3, 8.5; §8.7 needs §§8.3–8.4) and not the source's; Layers 1–7 draw on
other sources. Layer 6 follows the order `C⁰ → C² → C³ → higher`, forced by §6.3 needing §6.2, §6.4
needing §6.3, §6.5 needing §§6.2–6.4. No table, figure or list is taken over. No public formalisation
with matching declarations is known to me; none was searched for outside the pins.

Source independence: 14 passages compared with 8 sources, none shared beyond formulas and statements of a dozen words; largest share gpt2023, 43 of 128 locators; contents compared with gpt2023: independent.

## Not verifiable

- `hormander1990` (Chapter IV), `tian1987`, `yau1978` §2, `szekelyhidi2014` Theorem 3.1,
  `gilbarg-trudinger2001` Theorems 3.5, 6.2, 8.18, 9.1 and Lemma 17.16, `kolodziej1998` §1, `cns1985`,
  `ckns1985`: recorded as uncertified, texts not read. The Gilbarg–Trudinger statements were compared
  only with PDE's own restatements on main.
- The OCR of lewis1996 line 154 (statement of Theorem 2.1) and of spruck2005 line 11090 is garbled;
  the hypotheses were read from the surrounding proof text.
- Ownership against open pull requests was checked with the search tool over their heads, not by
  reading each of the 235 roadmaps.

## Source issues

- **Misprint** in gpt2023 at proof of Lemma 1, p. 7: the source says the determinant of the linearized coefficients is at least γ times the n-th power of f; it should be γ times the inverse n-th power, as its p. 12 states; affects nothing.
- **Gap** in gpt2023 at proof of Lemma 1, p. 6: the source applies Yau's theorem to a right-hand side built from a solution that is only twice differentiable; it should first approximate that right-hand side uniformly by smooth positive functions; affects the proof.
- **Error** in gpt2023 at proof of Theorem 2, p. 9: the source says the mass of the closed sublevel sets is continuous in the level; it should use strict sublevel sets, whose mass is right-continuous, since level sets may have positive measure; affects the proof.
- **Gap** in gpt2023 at proof of Theorem 2, p. 10: the source takes the starting level from Chebyshev's inequality, which gives the smallness condition of Lemma 2 only non-strictly; it should note strictness from the open strict sublevel set; affects the proof.
- **Gap** in gpt2023 at (3.3), p. 11: the source bounds the energy by Hölder's inequality with exponent n/(n−1), undefined in dimension one; it should apply Theorem 3(c) with exponent one directly; affects the proof.
- **Error** in gpt2023 at proof of Theorem 3(c), p. 16: the source says the signed first moment of F is at most the p-entropy for p ≥ 1; it should be at most the 1-entropy, hence one plus the p-entropy; affects the proof.
- **Error** in spruck2005 at Corollary 2.4, p. 289: the source says every symmetric polynomial hyperbolic in the diagonal direction has a cone containing the positive cone, with positive partial derivatives; it should assume the coordinate vectors lie in the closed cone; affects a stated result.
- **Error** in spruck2005 at Proposition 2.7, p. 290: the source says equality in Newton's inequalities forces equal components for every real vector; it should restrict that clause to vectors with positive components; affects a stated result.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1c0511b1a1027dea5b1b42ebe196f8799dc88acb", "job": "REV-PKG-ComplexHessianEquations", "model": "fable", "worker": "chris-x88"} -->
