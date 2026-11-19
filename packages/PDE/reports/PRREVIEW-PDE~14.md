# Review of PDE (pull request #1614 at f71f994)

**Verdict:** needs changes

**Summary.** Changes are needed for three findings, all of one kind: the roadmap's account of the pinned Tau Ceti is out of date, so that six headline statements of `Suggested.lean` (trace, extension, Rellich and Poincaré–Wirtinger on Lipschitz domains; the Calderón–Zygmund `Lᵖ` and weak-`(1,1)` bounds) are theorems the pinned library already proves on its own carriers, and four entries of the "not statable" list name carriers or theorems as missing that the pin has. The two findings of the previous review are repaired, and the new §1.8, §4.5 and §4.6 statements were recomputed and hold as stated. There are four small corrections and no format note; the human reviewers are asked about three points, the first being that the findings concern text of main that this pull request does not change.

## R01 (P2) — The trace, extension, Rellich and Poincaré–Wirtinger theorems on bounded Lipschitz domains, and the predicate itself, are in the pinned Tau Ceti, which §1.5–§1.6 never cite

An implementer who follows §1.6 rebuilds the boundary-chart theory from the hyperplane model, and a reader is told the library lacks it: the supplier section says "Tau Ceti has no … Lipschitz-domain predicate or domain trace on `EuclideanSpace ℝ (Fin (n+1))`" (line 648), and §1.6 says "construct the bounded trace" and "Construct the bounded extension operator" (lines 952–958). At the pin `2fd255d`, on `WithLp 2 (ℝ × E)` for every finite-dimensional inner product space `E` (so for `E = EuclideanSpace ℝ (Fin n)`):

- `Set.IsLipschitzDomain (Ω : Set F) E` (`TauCeti/Analysis/Sobolev/LipschitzDomain/Basic.lean:290`) is stated for every real normed space `F`, hence on `EuclideanSpace ℝ (Fin (n+1))`; after the coordinate isometry its chart condition is the one `IsLipschitzDomain` of `Suggested.lean` writes out (a rigid chart centred at the frontier point, an open cylinder, the strict epigraph of a Lipschitz graph). `Set.IsLipschitzDomainWith` (`:482`) is its uniform form, with the finite covers (`:682`, `:725`), rigid-motion and dilation invariance (`:604`, `:649`) that §1.6 asks to "supply";
- `TauCeti.W1p.frontierTrace` with `frontierTrace_ae_eq_of_continuousOn` and `W1p.ker_frontierTrace` (`LipschitzDomain/Trace/Frontier.lean:219,229,448`): the trace into `Lᵖ(frontier Ω, μHE[finrank E])` for finite `p`, its agreement with restriction, and `ker = W^{1,p}_0`. This is `exists_trace`;
- `TauCeti.W1p.exists_extensionL_of_isLipschitzDomainWith` (`LipschitzDomain/GlobalExtension.lean:94`), for every `1 ≤ p ≤ ∞`. This is `exists_extension`;
- `TauCeti.W1p.isCompactOperator_valueL_of_isLipschitzDomainWith` and `W1p.exists_eLpNorm_value_sub_setAverage_le_of_isLipschitzDomainWith` (`LipschitzDomain/RellichKondrachov.lean:53,71`), finite `p`. These are `isCompactOperator_valueL_of_isLipschitzDomain` for `p ≠ ∞` and `exists_poincare_wirtinger`.

The README already knows the route: §1.8 (line 1121) transports the pinned density theorem "along the linear isometry `ℝ^{n+1} ≃ ℝ × ℝⁿ`", and the module docstring names `TauCeti.W1p.frontierTrace`. The smallest change: cite the declarations above in the Tau Ceti supplier section and in §1.5–§1.6 in place of "construct" and "prove", correct the clause of line 648, and state as targets what the pin does not give: the transport of these theorems to `EuclideanSpace ℝ (Fin (n+1))` and an arbitrary additive Haar measure, Rellich at `p = ∞`, the graph-measure density formula, the target ranges of the compact embedding. In `Suggested.lean`, either define `IsLipschitzDomain` as the pinned `Set.IsLipschitzDomain Ω (EuclideanSpace ℝ (Fin n))` (or state the equivalence), and say in the four docstrings that the statement is the transport of the named pinned theorem, or keep only what the pin lacks (the `p = ∞` case of Rellich). The §1.8, §4.5 and §4.6 statements are unaffected: they need the predicate and these four theorems, not their proofs.

## R02 (P2) — The Calderón–Zygmund theorem, its decomposition, the `L^∞ → BMO` bound and John–Nirenberg are in the pinned Tau Ceti; §2.3–§2.4 ask to prove them and say the library has none

`CalderonZygmundOperator.eLpNorm_le` and `CalderonZygmundOperator.weakType_one` are listed as what the finished roadmap must prove, and the supplier section says "Tau Ceti has no Riesz–Thorin theorem, no Calderón–Zygmund operator" (line 648). At the pin, `MeasureTheory/Integral/CalderonZygmund/InnerProductSpace.lean:453` (`exists_eLpNorm_le_of_norm_sub_le_mul_rpow`) proves, for a bounded operator `T` on `L²(V; H)` of a finite-dimensional inner product space `V` with `T` and its adjoint represented off the support by kernels with the size bound `C₀|x−y|^{−n}` and the Hölder bound `C|y−y'|^δ|x−y'|^{−(n+δ)}` for `|x−y'| > 2|y−y'|`, that `‖Tf‖_p ≤ C‖f‖_p` for `1 < p < ∞`; `:382` (`exists_mul_volume_lt_enorm_le_of_norm_sub_le_mul_rpow`) is the weak-`(1,1)` bound. The same directory has the decomposition at height `t` (`Decomposition.lean:86,265,320`), which is §2.3's first target, and the `L^∞ → BMO` bound (`BoundedMeanOscillation.lean:285`); `MeasureTheory/Integral/JohnNirenberg.lean:444,692` is §2.4's John–Nirenberg inequality on cubes and balls.

The structure of `Suggested.lean` packages exactly these hypotheses (one kernel with smoothness in both variables gives the adjoint's kernel `conj K(y,x)` with the same bounds; a complex-linear operator is real-linear), so the two headlines are the pinned theorems after an adapter. The smallest change: cite these declarations in the supplier section and in §2.3–§2.4, correct line 648, and either drop the two theorems from `Suggested.lean` (naming the pinned ones in the docstring, as was done for Meyers–Serrin) or keep `CalderonZygmundOperator` as a bundling whose two statements are marked as the pinned theorems in that packaging. What remains a target of §2.3 is what the pin does not have in this form: Mihlin–Hörmander as a bounded operator on `Lᵖ`, the Riesz transforms as instances, and of §2.4 Gehring, the commutator theorem and VMO.

## R03 (P2) — Four entries of the "not statable" list, and three further clauses of the closing "Tau Ceti has no …" bullet, are false at the pin

The module docstring is where a reader learns which headlines the acceptance test omits and why; here it gives reasons the pinned library contradicts, and the README plans as targets what is proved there. Each was opened at `2fd255d`:

- "§1.3 (Calderón's agreement …): … the general-`p` statement needs the real Bessel-potential carrier of §1.3." `MeasureTheory.Lp.memSobolev_natCast_iff_exists_wkp_value_eq` (`TauCeti/Analysis/Sobolev/BesselPotential/Basic.lean:133`) is the theorem, for every `k` and `1 < p < ∞`, on Mathlib's `MemSobolev`. §1.3's "Prove Calderón's agreement" asks for nothing; the declaration the README cites instead, `…exists_w1p_value_eq_of_memSobolev_one`, no longer exists.
- "§6.2 (Galerkin existence …): the Bochner Sobolev space `H¹(0,T;V*)` with its embedding into `C([0,T];H)` … are themselves targets". `TauCeti.EvolutionSpace` with `EvolutionSpace.toContinuousMap` and the energy identity `norm_sq_sub_norm_sq_eq_integral` (`Analysis/Sobolev/EvolutionSpace/Basic.lean:344,377`) is §6.1; existence and uniqueness of the weak solution of the parabolic Dirichlet problem with time-dependent measurable coefficients are `TauCeti.PDE.exists_hasWeakLineDerivOn_gelfandDual_energyFormH1` and `eqOn_of_hasWeakLineDerivOn_gelfandDual_energyFormH1` (`Analysis/PDE/Parabolic/DirichletProblem.lean:285,377`).
- "§6.3 … a bounded convolution operator on `Lᵖ` [is a target]", and the README's "no heat convolution as a bounded operator on `Lᵖ` or on a space of uniformly continuous functions". `TauCeti.heatSemigroup` (`Analysis/PDE/HeatKernel/Semigroup.lean:88`) is the strongly continuous contraction semigroup on `Lᵖ`, `1 ≤ p < ∞`, with `generator_heatSemigroup` on `C²_c` (`HeatKernel/Generator.lean:147`); `heatCauchyPotentialBUC` (`HeatKernel/UniformContinuous.lean:60`) is the `BUC` operator. The `Lᵖ` contraction, strong continuity and semigroup law that §6.3 lists as "the targets" are proved; the identification of the full domain is not, and is statable.
- "§6.4–§6.9 …: the bundled parabolic Hölder spaces are targets of §6.4", and the README's "no Hölder space of parabolic type". `TauCeti.ParabolicC2HolderSpace` (`Analysis/PDE/Parabolic/Holder/Two.lean:119`, complete at `:544`) is `C_b^{2+α,1+α/2}` on a slab, with the seminorm comparison (`Parabolic/SpaceTime/Holder.lean`), the operator `parabolicOperatorL` (`Holder/Operator.lean:92`), the reduction of a constant matrix to the heat operator (`Holder/ConstantCoefficient.lean:64`) and the time-reversal equivalence of §6.6 (`Holder/Backward.lean:169`). The order-two isomorphisms of §6.5–§6.6 are statable on it.
- "no classical maximum principle or Hopf lemma for variable principal coefficients" (line 652, a sentence this pull request rewrote). `TauCeti.PDE.le_of_mul_le_sum_mul_fderiv_fderiv_add_fderiv_le_frontier` (`Analysis/PDE/MaximumPrinciple/NonDivergence.lean:267`) is the classical weak maximum principle for `aⁱʲ∂ᵢⱼ + bⁱ∂ᵢ − c` with variable `a`, with comparison and uniqueness at `:363,395`; §3.2's "Prove them for variable symmetric principal coefficients" restates it. The Hopf clause is true.

The smallest change: correct these four docstring entries and the bullet of lines 648–652; in §1.3, §3.2, §6.1–§6.4 replace "Prove"/"Define" by a citation for what the pin proves and keep as targets what it does not (for example the full generator domain, the spaces of every order `k`, the variable-coefficient isomorphism, the strong maximum principle and Hopf lemma for variable `a`); and for each headline that has become statable, either state it or say in the docstring that it is statable and deliberately left to a later revision of this file.

## C01 — The Tau Ceti supplier section still cites declarations and files that the pinned revision does not have, and three places still say `n ≥ 3`

Partly repaired since the previous review. The header (line 281) says the line numbers are those of `2fd255d`; there, `Analysis/Sobolev/BesselPotential.lean`, `Analysis/PDE/Spectrum.lean`, `Analysis/PDE/Regularity/LocalBoundedness.lean`, `Analysis/PDE/FundamentalSolution/Planar.lean` and `Analysis/PDE/MaximumPrinciple/Parabolic.lean` are directories, and `TauCeti.sq_le_integral_Ioi_sq_add_deriv_sq`, `TauCeti.sq_le_integral_sq_add_deriv_sq` (lines 353, 1013) and `…_of_inv_add_eq_inv` (lines 471, 2320) are declared nowhere (the trace estimate is `norm_sq_add_norm_sq_le_integral_norm_sq_add_norm_deriv_sq`, `Analysis/Sobolev/Trace/Estimate.lean:44`).

Lines 466–480, 494, 2263–2265 and 2315–2320 still say the Hölder theorem, local boundedness and oscillation decay are pinned "for `n ≥ 3`" and that "the targets are the same bound for `n = 1, 2`". The pinned statements carry `[Nonempty ι]` only (`Regularity/HolderContinuity.lean:184`, `LocalBoundedness/Basic.lean:969,1003`, `Oscillation.lean:714`), so those `n = 1, 2` targets ask for nothing; §5.4's remaining target is the passage to the inverse-coercive, ratio-uniform ball statements.

## C02 — The docstring of `harnack_of_isStrongSolution_ball` cites Theorem 9.22 where §5.5 now cites Corollary 9.25

§5.5 (line 2365) was changed to "Corollary 9.25 with no lower-order terms"; the Lean docstring (line 625 of `Suggested.lean`) still reads "Gilbarg–Trudinger, Theorem 9.22, with no lower-order terms". One of the two is the wrong locator for the same statement; would make the docstring agree with the README.

## C03 — The description still describes an earlier head

Not repaired since the previous review. The description says "Adds Lane G to the PDE roadmap … built on A.6's Lipschitz charts … Lane G builds on Lanes A and D". The head has no Lane G, no A.6 and no Lanes, and the description does not say that two declarations of main's `Suggested.lean` are removed.

Text that would be right: "Revises the PDE roadmap on main: adds §1.8 (A8: admissible boundary parts, `W^{1,p}_Γ(Ω)`, Lipschitz shears, the trace characterization, Poincaré–Friedrichs) to Layer 1, and §4.5 (D20: mixed and Neumann problems) and §4.6 (D21: their spectra) to Layer 4. No section of main is removed or renumbered. `Suggested.lean` gains the definitions `w1pVanishingOnSubmodule`, `IsMixedEigenvalue` and `mixedEigenvalue` and thirteen theorems, and loses `dense_contDiffOn_representatives_wkp` and `exists_wkp_two_of_lipschitz_coefficients`, which the pinned Tau Ceti proves and the README now cites. The off-diagonal Marcinkiewicz statement of §2.2, several locators and the account of the pinned library are corrected; Brezis is added to the references. No roadmap supplier is added or dropped."

## C04 — In §4.4 the resolvent is written for `λ ∉ {−λ_k}` while the operator realized is `−Δ` with spectrum `{λ_k}`

Lines 1927–1929: "Realize `−Δ` with Dirichlet condition as a self-adjoint `LinearPMap` … with resolvent `(λI − A)⁻¹` for `λ ∉ {−λ_k}`, and identify its spectrum with `{λ_k}`." If `A` is the realized `−Δ`, the resolvent exists for `λ ∉ {λ_k}`, and at `λ = λ₁ ∉ {−λ_k}` it does not; the sentence is right only if `A` silently means the heat generator `Δ` of the Conventions. §4.6 writes the parallel statement without the ambiguity ("spectrum `{λₖ}`"). Would write "for `λ ∉ {λ_k}`", or name `A = Δ` in the sentence.

## Questions for the author

- `CalderonZygmundOperator` has no measurability field for `kernel`, while the pinned theorem assumes `StronglyMeasurable (Function.uncurry k)` for the kernel and for the adjoint's. Is the statement intended, and true, for a non-measurable kernel (where `∫ y, kernel x y * f y` takes the junk value `0` when the integrand is not integrable)? I could neither prove nor refute it without measurability; a field `StronglyMeasurable (Function.uncurry kernel)` would remove the question.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 interval classes (sample) | `x`, `x²` on `(0,1)` | `∫xφ' = −∫φ`; `∫x²φ' = −∫2xφ`; endpoint values `(0,1)` | true | none |
| §1.4 embeddings (sample) | `\|x\|^{−a}`; `x(1−x)` | `ap* < n ⇔ ap < n − p ⇔ (a+1)p < n`; `1/4 ≤ 1/2` | true | none |
| §1.3 Calderón agreement | pinned `BesselPotential/Basic.lean:133` | statement for every `k`, `1 < p < ∞`, on `MemSobolev` | already pinned | R03 |
| `IsLipschitzDomain`, `exists_trace`, `exists_extension`, Rellich, `exists_poincare_wirtinger` | `n = 0`: `(0,1) ∪ (1,2)` at `x = 1`; `p = ∞` Rellich; pinned `Frontier.lean:448`, `GlobalExtension.lean:94`, `RellichKondrachov.lean:53,71` | both sides in `Ω`, `1 ∉ Ω`: chart fails; equi-Lipschitz plus Arzelà–Ascoli; pinned on `WithLp 2 (ℝ × E)`, `volume` | true; pinned up to transport | R01 |
| `w1pVanishingOnSubmodule_frontier` | `Ω = ℝ^{n+1}`, `Ω = ∅`, `p = ∞` | `tsupport φ ∩ closure Ω` compact inside `Ω`; both sides closure of `C_c^∞` | true | none |
| `exists_poincare_friedrichs` | `(0,1)`, `Γ = {0}`, `Γ = ∅`; rooms | `(∫x^{p−1})^{1/p} = p^{−1/p} ≤ 1`; sharp `2/π`; `2^{k(p−1)}·2^{−k(p+2)} = 2^{−3k}`, `(4/3)4^{−k}` | true | none |
| §2.3 (sample); `CalderonZygmundOperator.eLpNorm_le`, `.weakType_one` | `x·f(x)`; `n = 0`; pinned `InnerProductSpace.lean:382,453` | `R² + R + 1/3 → ∞`; `t·1 ≤ \|c\|\|f\|`; same hypotheses plus kernel measurability | true; pinned up to an adapter | R02, question |
| §3.2 (sample); `hopf_boundary_point` | `−(x+1)`; `r^s sin θ`; pinned `NonDivergence.lean:267` | quotient `1`; `s²r^{s−2} sin θ − s²r^{s−2} sin θ = 0`; weak principle pinned for variable `a` | Hopf true; README clause false | R03 |
| §3.4 potentials (sample) | ball of `ℝ³`, `f = 1`; half-line | `−Δ(3−\|x\|²)/6 = 1`, trace `1/3`, `(1−\|x\|²)/6`; `c₁ = Γ(1)/π` | true | none |
| §4.3 (sample); `fredholm_compatibility` | `[[1,1],[0,0]]`; `−u''−u = sin 2x` | `ker Lᵀ = span(0,1)`, range `span(1,0)`; `3A = 1` | true | none |
| §4.4 realization | `λ = λ₁` | `λ₁ ∉ {−λ_k}` yet no resolvent of `−Δ` there | ambiguous | C04 |
| `existsUnique_weakSolution_mixed`, `neumann_solvable_iff` | `−u'' = 1`: `Γ = {0}`; `Γ = ∅`, `h(1) = −1` | `x − x²/2`; `∫(−x)v' = ∫v − v(1)`; `v = 1`: `∫f + ∫h = 0` | true | none |
| `mixedEigenvalue`, `isLeast_mixedEigenvalue`, `mixedEigenvalue_spectrum`, eigenbasis | `(0,1)`: `Γ = ∅`, `{0}`; square | `m²π²`; `(m+½)²π²`; `min(9π²/4, π²/4 + π²) = 5π²/4`; infinite-dimensional `W` has `finrank 0` | true | none |
| `neumann_kernel_iff_isLocallyConstant` | `Ω = ∅`; `(0,1) ∪ (2,3)` | `v = u` gives `∇u = 0`; kernel dimension `2` | true on every open set | none |
| `finite_connectedComponents_of_isLipschitzDomain` | shrunk chart `(Lip γ)r' < h` | `γ(0) = 0`, `\|γ\| < h` on the base, every fibre a nonempty interval: connected | true; sketch repaired | none |
| `isLeast_rayleigh_meanZero_mixedEigenvalue_one` | `(0,1)` | `cos πx`: `π²`; `x − ½`: `12 > π²` | true | none |
| `exists_isSelfAdjoint_mixedLaplacian`, `isMixedEigenvalue_frontier_iff` | `(0,1)`, `Γ = ∅`; `Γ = frontier Ω` | resolvent eigenvalues `1/(1+m²π²)`; same formula on `W1p0` | true | none |
| §5.2 Meyers (sample) | planar example; `meyers-1963` | `p(1−μ) < 2`; Theorem 1 on p. 198, Theorem 2 on p. 200, §5 on p. 204 | true | none |
| §5.4 ball theorems | `u = x₁`; pinned `[Nonempty ι]` | `r^{−α−n/2}·r^{1+n/2} = r^{1−α}`; pin holds for `n ≥ 1` | true; text says `n ≥ 3` | C01 |
| §5.5 Krylov–Safonov pair | `n = 1`; locator | `\|u'(x) − u'(y)\| ≤ ‖f‖₁/λ`; 9.22 in Lean against 9.25 in README | true; locators differ | C02 |
| §6.3 heat semigroup (sample) | `2π` witness; `\|x\|^{−1}χ` in `ℝ³`; pinned `Semigroup.lean:88` | `∂ₜ exp(−4π²t\|ξ\|²) = −4π²\|ξ\|²`; `∫\|x\|^{−2} r² dr < ∞`; `Lᵖ` semigroup pinned | true; already pinned in part | R03 |
| §7.1 blocks (sample) | `\|ξ₀\| = 2^j` | `ψ(2) = 1`, `ψ(1) = ψ(4) = 0`: block `P_{j−1}` | true | none |
| §7.2 Besov (sample) | single block; `δ₀` | `2^{js}`, factor `4` at `j = 2`; `2^{jd/p'}` gives `−d/p'` | true | none |
| §7.3 paraproducts (sample) | `f = 1` | `Σ_{j≥2}P_j g + 0 + P_0 g + P_1 g = g` | true | none |
| §8.2 Schrödinger (sample) | `(4,∞)`, `(2,6)`; `tao-dispersive` line 3856 | `1/2`; `3/2`; Theorem 2.3 on printed p. 74 | true | none |
| §8.3 wave (sample) | `d = 4`, `(2,6)`; forcing weight; line 4023 | `3/4`; `s = 5/6`; `2^{js}·2^{−j}·2^{js̃}`; Theorem 2.6 on printed p. 77 | true | none |
| §9.1 (sample) | `x(1−x)/2`; `\|x\|^{−γ}`, `d = 3` | `1/8 + 1/2 ≤ 1`; `Δ\|x\|^{2−γ} = (2−γ)(3−γ)\|x\|^{−γ}` | true | none |
| §9.3 (sample) | bootstrap; §9.2 interval map | `C^β → C^{1,β} → C^{2,min(α,β)} → C^{2,α}`; `∫\|c−s\| ≤ 1/2` | true | none |
| Schauder, lifting | `x₁²`; `−u'' = 1`, `g = x` | `0 ≤ C(4r^{−α} + 2r^{−α})`; `x(1−x)/2 + x` | true | none |

- Source locators checked against the text: 10 (`tao-dispersive` lines 3676, 3688, 3826, 3856–3871, 4023; `meyers-1963` lines 62–82, 264, 300, 397; `krylov-vmo` lines 193–198, 203–208; `bauer-pauly-schomburg` lines 414, 1110–1117).
- Library declarations opened at the pin `2fd255d` (under `TauCeti/`): `Analysis/Sobolev/LipschitzDomain/Basic.lean:84,144,290,482`, `LipschitzDomain/Trace/Frontier.lean:190,219,448`, `LipschitzDomain/GlobalExtension.lean:94`, `LipschitzDomain/RellichKondrachov.lean:53,71`, `MeasureTheory/Integral/CalderonZygmund/InnerProductSpace.lean:382,453`, `MeasureTheory/Integral/JohnNirenberg.lean:444`, `Analysis/Sobolev/BesselPotential/Basic.lean:133`, `Analysis/Sobolev/EvolutionSpace/Basic.lean:344,377`, `Analysis/PDE/Parabolic/DirichletProblem.lean:285,377`, `Analysis/PDE/HeatKernel/Semigroup.lean:88`, `HeatKernel/Generator.lean:147`, `HeatKernel/UniformContinuous.lean:60`, `Analysis/PDE/Parabolic/Holder/Two.lean:119,544`, `Holder/Backward.lean:169`, `Analysis/PDE/MaximumPrinciple/NonDivergence.lean:267`, `Analysis/PDE/Regularity/HolderContinuity.lean:184`, `Regularity/LocalBoundedness/Basic.lean:969,1003`, `Regularity/Harnack.lean:178,328`.
- Automatic checks: all pass at this head. Dependency check: `depcheck: 200 roadmaps, 2203 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changed outside the folder (two files, `README.md` and `Suggested.lean`).
- Elaboration: `lake env lean` on `Suggested.lean` gives 26 diagnostics, all `declaration uses sorry`. One-tactic probe (`first | rfl | simp | infer_instance`) on a copy: none of the 26 closes.
- Signatures: the elaborated types of the declarations read against the README; the §1.8 and §4.5–§4.6 declarations carry `[mu.IsAddHaarMeasure]` and their domain hypotheses in their own binders; none lost a binder.
- Cross-roadmap citations: none unresolved; no roadmap supplier added. Three cited library names and five cited files are not found at the pin (C01, R03).
- Previous findings: R01 (finiteness sketch) repaired at lines 2053–2057 ("each shrunk by §1.6's chart restriction to a radius `r' ≤ r` with `(Lip γ) r' < h`"); R02 (two pinned headlines) repaired: both theorems removed and cited (lines 746–751, 2129–2134, docstring lines 35–38); C02, C03, C04, N01 repaired; C01 partly (C01 here); C05 not (C03 here). Both earlier questions answered in the text.
- Overlap check: read ComplexHessianEquations, SobolevPolynomialApproximation, YangMillsConnectionsAndCaloricGauge (main), CompressibleEulerEquations, IncompressibleFlows, SchrodingerOperatorsAndSpectralTypes (open); nothing shared. No second owner of `W^{1,p}_Γ`, Poincaré–Friedrichs or the mixed and Neumann problems; YangMillsConnectionsAndCaloricGauge requests an `Lᵖ` Neumann theorem on the ball of PDE Layer 5, which this text leaves to a later part (see the human reviewers).

Source independence: 8 passages compared with 4 sources (`tao-dispersive`, `meyers-1963`, `krylov-vmo`, `bauer-pauly-schomburg`), none shared beyond formulas and the admissibility condition, which can be written in one way; largest share Gilbarg–Trudinger, 29 of about 120 locators, its text and table of contents not read; contents compared with the chapter list the README's References give for it (Layer 1 against Chapter 7, Layer 3 against Chapters 2–3, Layers 4–5 against Chapters 8, 6, 9, not in its order; Layers 2 and 6–9 outside it): independent.

Research link: §1.8 extends to every dimension and finite `p` the density and Poincaré–Friedrichs results of Bauer–Pauly–Schomburg (2016, Lemma 3.1, Theorem 4.8); §5.2 and §5.7 state Meyers (1963) and Krylov (2007); Layer 8 states the Strichartz estimates of Keel–Tao (1998) and Tao (2006). Rests on the README's References and the four texts read.

## Not verifiable

- Evans, Gilbarg–Trudinger, Leoni, Brezis, Grafakos (both books), Stein (both books), Adams–Fournier, Giaquinta–Martinazzi, Grisvard, Lieberman, Bahouri–Chemin–Danchin: books with no legal open copy read here; their locators were not checked, including Gilbarg–Trudinger 9.22 against 9.25 (C02).
- Keel–Tao, Theorem 1.2 (p. 956): cited by its locator, the text not read.
- Krylov: the published numbering (Comm. PDE 32) was read from the arXiv version only.
- Gehring, Coifman–Rochberg–Weiss, Sarason, Meyers–Serrin, Rosales, Lunardi, Axler–Bourdon–Ramey: not reopened in this round.

## Source issues

- none

## For the human reviewers

- **Scope of this pull request.** R01–R03 and C01 concern main's text (§1.3, §1.5–§1.6, §2.3–§2.4, §3.2, Layer 6, the supplier section), unchanged here except line 652. The pinned Tau Ceti `2fd255d` implements far more of Layers 1–6 than main's README records; other sections were not compared in full.
- **A request from another roadmap.** YangMillsConnectionsAndCaloricGauge on main (`README.md` line 385) asks PDE Layer 5 for the `W^{2,p}` Neumann problem on the unit ball; this README (lines 48–52) leaves Neumann boundary regularity to "a later PDE part".
- **Not tested.** Gilbarg–Trudinger and Evans carry the largest shares of locators (29 and 20 of about 120); neither text nor contents page was read, so wording and arrangement were not compared against them. `README.md` lines 3464–3470 describe names from `scottnarmstrong/DeGiorgi` (stated Apache-2.0); the repository was not opened.
