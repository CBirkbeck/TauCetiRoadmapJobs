# Review of NoncommutativeIntegration (pull request #864 at b8cc926)

**Verdict:** needs changes

The gate passes at this head (every check OK, build of `TauCetiRoadmap.NoncommutativeIntegration.Suggested` with the five intended `sorry` warnings only). The depcheck reports `depcheck: 200 roadmaps, 1312 edges, 0 problem(s)`; note that the README has no `*Needs:*` lines, so the check sees no edges of this roadmap (see R03). The mathematics of the README verified against the sources at every sampled locator (table below). The blocking finding is in `Suggested.lean`: two deep results the roadmap is built to reach are statable on its own matrix carriers and are absent.

## R01 (P2) — Statable headline theorems absent from `Suggested.lean`

Location: `TauCetiRoadmap/NoncommutativeIntegration/Suggested.lean` lines 7–13 (module docstring) and lines 100–106 (`matrix_khintchine_high`).

Claim: the file states, as its only deep theorem, the p ≥ 2 Khintchine inequality on `CStarMatrix (Fin d) (Fin d) ℂ` with constants uniform in d and n. The README's remaining headline estimates in the same finite-dimensional setting are statable with the file's own definitions and are not stated: (a) the low range 1 ≤ p < 2 of noncommutative Khintchine (README I7, "for 1<p<2, `A_p inf(C_p+R_p) ≤ K_p ≤ inf(C_p+R_p)`"), including the p = 1 theorem of I6 with its explicit constant 3^(−1/2), which the README calls a principal milestone; (b) the Ball–Carlen–Lieb inequality of I5, `(‖x+y‖_p²+‖x−y‖_p²)/2 ≥ ‖x‖_p² + (p−1)‖y‖_p²` for 1 < p ≤ 2 and its reverse for 2 ≤ p < ∞, which Ball–Carlen–Lieb proved exactly for matrices and Ricard–Xu (rx14 line 63, Theorem 2) extend to every von Neumann algebra. Both need only `matrixLpGauge`, `columnSquare`, `rowSquare`, `randomSumGauge` and an `sInf` over decompositions `a = b + c`.

Witness: `matrix_khintchine_high` has hypothesis `2 ≤ p`; no declaration in the file mentions `p < 2`, `p = 1`, or a sum of two gauges; the docstring (lines 7–13) names no headline as not statable. Source for the p = 1 constant: pisierGT line 1403 (Theorem 9.1) with the proof at lines 1496–1519 giving c₁ = √3; hm07 line 705 (Theorem 2.11) states 3^(−1/2) for Rademachers with matrix coefficients.

Repair: add, on the same matrix carriers, (i) `matrix_khintchine_low`: for `1 ≤ p < 2`, `∃ A > 0, ∀ d n a, A * sInf {C_p(b) + R_p(c) : a = b + c} ≤ K_p(a) ∧ K_p(a) ≤ sInf {…}`, with the p = 1 case stated separately with the constant `Real.sqrt 3⁻¹`; (ii) `matrix_ball_carlen_lieb` for `1 < p ≤ 2` and its reverse for `2 ≤ p`. Make the module docstring say that Haagerup's reduction theorem, Burkholder–Gundy, the H¹–BMO duality, the Lp duality and interpolation isomorphisms and the Haagerup Lp construction are not statable at the pins because neither Mathlib nor Tau Ceti has traces, τ-measurable operators or Lp(M) for a von Neumann algebra (only `VonNeumannAlgebra`/`WStarAlgebra` exist, `Mathlib/Analysis/VonNeumannAlgebra/Basic.lean` lines 45 and 67).

## R02 (P3) — Padding in `Suggested.lean`

Location: `Suggested.lean` lines 27–53 (`CompatibleCouple`, `sumCarrier`, `kFunctional`, `kFunctional_nonneg`, `kFunctional_subadditive`), 89–98 (`matrixLpGauge_two`, `randomSumGauge_two`), 110–128 (`adaptedSequenceProjection`, `differenceSequenceProjection`, `differenceSequenceProjection_previous_mean`).

Claim: none of these is a headline or needed to state one. `kFunctional_nonneg` closes in one step; `kFunctional_subadditive` is an API lemma of the K-functional; `matrixLpGauge_two` computes the Frobenius identification that the README lists as the finite-dimensional formula; `randomSumGauge_two` is the p = 2 boundary case ("At p=2 both square functions give the same norm", README I6); `differenceSequenceProjection_previous_mean` is proved in place by `simp` from its definition; the two sequence-projection definitions and the couple structure serve no stated theorem.

Witness: on a scratch copy, `exact Real.sInf_nonneg (by rintro r ⟨x₀, x₁, -, rfl⟩; positivity)` closes `kFunctional_nonneg` (probe elaborated, the `sorry` alternative never reached); line 122–128 is already a `simp` proof.

Repair: delete these ten declarations from `Suggested.lean`; the README keeps the K-functional, its subadditivity, the p = 2 identities and the Stein/difference projections as targets and Checks.

## R03 (P3) — README shape: no `*Needs:*` lines, no Checks lists, no layer dependencies; Lean names absent from the README

Location: `README.md` throughout (sections I1–I8, lines 73–630); `Suggested.lean` line 18 (`namespace NoncommutativeIntegration`).

Claim: the README is prose per section but carries none of the form the checklist asks for: no `*Needs:*` line on any target, so the dependency check has nothing to verify (its output above is vacuous for this roadmap); no `**Checks.**` lists (the only computed checks are the Ky Fan matrix check in I1, the Pauli fourth-moment check in I6, the two-point expectation counterexample in I4 and the matrix-unit sequences in I6); no `### Examples`/`### Dependencies` per layer, no `## Exact supplier contracts` naming consumed declarations, no `## Downstream consumers`. Most theorems have no locator at the claim: locators appear only in the reference list (lines 571–680), and some targets have none at all (Kosaki's interpolation theorem in I4; the dual-weight characterization in I3; the Clarkson moduli and type/cotype constants in I5 and I7; UMD and its one-exponent-to-all-exponents implication in I8). None of the fifteen names declared in `Suggested.lean` occurs in the README, so the README/Lean agreement rule fails in both directions; the namespace is not `TauCetiRoadmap.NoncommutativeIntegration`; the docstring is not of the "<title>: target signatures" form.

Witness: `grep -c '\*Needs:\*' README.md` gives 0; `grep -n 'matrixLpGauge\|CompatibleCouple\|randomSumGauge' README.md` gives nothing; `depcheck … 0 problem(s)` with no edge for NoncommutativeIntegration.

Repair: give each target a `*Needs:*` line (Mathlib and Tau Ceti declarations, VonNeumannAlgebras V-sections, BanachSpaceTheory B1–B2, CStarAlgebras C3–C5, OperatorIdeals, Majorization MAJ-A28/A31, PDE), at least three discriminating Checks per definition (singular numbers, measure topology, Haagerup Lp, Kosaki couple, row/column spaces, BMO), a locator at each claim, an `## Exact supplier contracts` section, and per-layer Examples and Dependencies; mention the kept Lean names in the README; rename the namespace and docstring.

## R04 (P3) — Locators and attributions to correct

Location: `README.md` lines 455–459 and 640–648 (Haagerup–Musat attribution); 573–576 (Fack–Kosaki locators); 657–661 (Haagerup 1978); 61–64 (PDE for Marcinkiewicz); 41–43 (BanachSpaceTheory).

Claims and witnesses:
- The README attributes "the L⁴-to-L¹ method" to Haagerup–Musat, *The Effros–Ruan conjecture*, Invent. Math. 174 (2008). That paper contains no Khintchine inequality (hm08 lines 9–20: Tomita–Takesaki theory and Powers factors; `grep -i khintchine` finds nothing). Pisier attributes the fourth-moment estimate (Lemma 9.2, pisierGT line 1432) to Pisier 1978 and Haagerup 1985 ([118], [51], lines 3840 and 3696) and the √3 truncation route to Haagerup–Musat 2007 ([54], line 1423–1430); that paper proves it as Theorem 2.11/Proposition 2.12 by estimating `E(Y*Y)` and `E((Y*Y)²)` (hm07 lines 705–734). Repair: attribute the method and the constant to Haagerup–Musat 2007 (Theorem 2.11, Proposition 2.12) and Pisier 1978/Haagerup 1985 for the fourth-moment lemma; drop the Invent. Math. paper or cite it for what it proves.
- Fack–Kosaki: the concave integrated inequality of I1 is Theorem 4.7(i) (fk86 line 808–810), the K-functional formula `∫₀ᵗ μ_s = inf(‖x₁‖₁ + t‖x₂‖_∞)` is stated after Theorem 4.4 (lines 702–724), the projection variational formula with the diffuse hypothesis is Lemma 4.1 (lines 562–567), the absolute-value estimate is Lemma 4.3 (line 675), and the p-triangle proof route of I3 is the proof of Theorem 4.9(iii) (lines 877–881). The README cites only Proposition 2.2, Lemma 2.5, Lemma 3.4, Theorems 3.5–3.6 and 4.9. Repair: add these locators at the claims.
- Haagerup 1978 II is cited for "the invariant-weight characterization" without a locator; its Theorems 1.1 and 3.1 (haagerup78b lines 123–133, 409–425) construct the operator-valued weight and the dual weight; the characterization of dual weights as the invariant ones is not visible in Part II. Repair: give the theorem number (Part I or Takesaki II) and cite Part II, Theorem 3.1, for the operator-valued weight used in I3.
- "PDE owns scalar Riesz–Thorin and Marcinkiewicz": the pinned Tau Ceti already has Marcinkiewicz interpolation (`TauCeti/MeasureTheory/Integral/Marcinkiewicz/Basic.lean` and `General.lean`, e.g. `lintegral_rpow_le_of_meas_ofReal_lt_le` at General.lean line 416); Riesz–Thorin is indeed absent from both pins. Repair: cite the pinned declarations for Marcinkiewicz and PDE item 9 (PDE README line 273) for Riesz–Thorin only.
- BanachSpaceTheory on main, B2 (README line 100–103), already states Milman–Pettis with "the standard uniform convexity estimates for Lᵖ, 1<p<∞". I5's Clarkson/uniform convexity development should cite it for the scalar case and say in one clause that I5 proves the noncommutative version.

## Verified sound

**Principles.** No route-specific shortcut (the p = 1 Khintchine route is stated for every von Neumann algebra and every finite family in M_*); no re-planned roadmap (I1 extends V10's tracial Lp to 0 < p < 1 and singular numbers, which V10 at #889 does not own: `grep -i 'measure topology'` in that README finds nothing in Layer 10); no copied passages; no algorithms; no sorry'd data; no `set_option`; the two `local instance` lines are needed (a scratch copy without them fails to synthesize the CFC instances at lines 64, 69, 74). Cross-roadmap ownership was checked with `roadmaps grep` on Khintchine, Burkholder, "Haagerup L", K-functional, Clarkson, UMD, "measurable operator", "singular number", BMO, "compatible couple", Riesz–Thorin, Lorentz: no other open roadmap or roadmap on main states these objects (StochasticCalculus #1030 owns the commutative Burkholder–Davis–Gundy inequality, a different object; BanachSpaceTheory #1121 is a revision pull request of a roadmap on main, so main's B2 is cited).

**Supplier citations resolved.** VonNeumannAlgebras at the head of #889 (the merge order lists VonNeumannAlgebras at line 4; #1041 is a second open pull request with the same folder name containing only V0–V4, which this README does not depend on): V2 = Layer 2 (line 486), V4 = Layer 4 (896), V5 = Layer 5 (1202), V6 = Layer 6 (1350), V7 = Layer 7 (1499), V8 = Layer 8 (1772, canonical expectation of the discrete crossed product at 1915), V10.TracialLp (2167: Lᵖ(M,τ), 1 ≤ p < ∞, completeness, Hölder, L¹ = M_*, L² = GNS), V11: Pedersen–Takesaki (2866), Takesaki's expectation theorem (2888, which names NoncommutativeIntegration I4 as the consumer of the Lp inclusions), tensor-product weights (2672), dual-action fixed-point theorem (3083), continuous core with `θ_s(u_t)=exp(i s t)u_t`, `Tr∘θ_s=exp(s)Tr` and the weight-independence cocycle isomorphism (3093–3098): the README's conventions agree. BanachSpaceTheory on main B1 (line 41), B2 (74). CStarAlgebras at the head of #860: C3 (459), C4 (497), C5 (546). OperatorTheory/OperatorIdeals on main (Schatten scale S_p for 1 ≤ p ≤ ∞, lines 51, 97). OperatorTheory/Majorization on main MAJ-A28 (line 179), MAJ-A31 (185: `K_k(A+B) ≤ K_k(A)+K_k(B)`). PDE on main item 9 (line 273). Depcheck: `depcheck: 200 roadmaps, 1312 edges, 0 problem(s)`; NoncommutativeIntegration is at line 276 of the merge order, after VonNeumannAlgebras (line 4); CStarAlgebras is not in the merge order yet and is placed after its suppliers (not a finding).

**Library declarations opened at the pins.** Mathlib: `LinearMap.singularValues` (`Analysis/InnerProductSpace/SingularValues.lean` line 94, an `ℕ →₀ ℝ`, zero-indexed as the README says), `Complex.HadamardThreeLines` (`Analysis/Complex/Hadamard.lean`), `CStarMatrix` (`Analysis/CStarAlgebra/CStarMatrix.lean` line 44), `ENNReal.HolderTriple` (`Basic/ENNReal/Holder.lean` line 42), `UniformConvexSpace` (`Analysis/Convex/Uniform.lean` line 39), `MeasureTheory.Filtration` (`Probability/Process/Filtration.lean` line 50), `CFC.nnrpow` and `CFC.sqrt` (`…/ContinuousFunctionalCalculus/Rpow/Basic.lean` lines 86, 231), `CStarAlgebra.instNonnegSpectrumClass'` (`…/ContinuousFunctionalCalculus/Basic.lean` line 430), `IsSelfAdjoint.instNonUnitalContinuousFunctionalCalculus` (`…/Instances.lean` line 216), `WStarAlgebra`, `VonNeumannAlgebra` (`Analysis/VonNeumannAlgebra/Basic.lean` lines 45, 67). No Riesz–Thorin, Khintchine, Kahane, Clarkson, cotype or interpolation-space declaration in Mathlib. Tau Ceti: Marcinkiewicz modules present (see R04); no Riesz–Thorin, Schatten, Khintchine or noncommutative Lp module.

**Lean.** `lake env lean` on `Suggested.lean`: five `sorry` warnings, nothing else. `#check @name` for all fifteen declarations on a scratch file: each elaborated type agrees with `signatures.md`; no section binder is lost (the `[T2Space Z] [IsTopologicalAddGroup Z] [ContinuousSMul ℂ Z]` binders are carried by `CompatibleCouple` itself). One-tactic probe: `kFunctional_nonneg` closes (R02); `simp` does not close `kFunctional_subadditive`, `matrixLpGauge_two`, `randomSumGauge_two`. Junk values: `matrixLpGauge 0 x = 1` (cfcₙ of a function with f(0) ≠ 0 is 0, then `0 ^ (1/0) = 1`), harmless since every theorem has p ≥ 2; `matrixLpGauge` for d = 0 is 0.

**Sources verified at their locators (seeded sample, 18 targets).**
1. fk86 Definition 2.1 (line 189): projection-cut definition `inf{‖TE‖ : τ(1−E) ≤ t}` ✓ I1.
2. fk86 Proposition 2.2 (206–210): equivalence with `inf{s ≥ 0 : λ_s(T) ≤ t}`, infimum attained ✓.
3. fk86 Lemma 2.5 (249–260): (i) right continuity, (ii) homogeneity, (iv) `μ_t(f(|T|)) = f(μ_t(T))` for continuous increasing f with f(0) ≥ 0, (v) `μ_{t+s}(T+S) ≤ μ_t(T)+μ_s(S)`, (vii) `μ_{t+s}(TS) ≤ μ_t(T)μ_s(S)` ✓.
4. fk86 Proposition 2.7 (300–302): `τ(T) = ∫₀^∞ μ_t(T) dt` ✓ (layer cake).
5. fk86 Lemma 3.4 (440–445), Theorem 3.5 (463–468): Fatou for μ_t and τ ✓.
6. fk86 Theorem 3.6 (481–495): dominated convergence; the README's form (`|x_n| ≤ y`, one y ∈ Lp, 0 < p < ∞) is the case S_n = S = y, noted at line 485 ✓.
7. fk86 Theorem 4.2 (605–609): Hölder for all p, q, r > 0 with `1/p+1/q = 1/r`, constant one, and log-submajorization ✓ I1.
8. fk86 Theorem 4.4(ii) (680–683): `Φ_t(T+S) ≤ Φ_t(T)+Φ_t(S)` (integrated Ky Fan) ✓; K-functional formula (702–724) ✓ I2.
9. fk86 Theorem 4.7(i) (808–810): `∫₀ᵗ g(μ_s(T+S)) ≤ ∫₀ᵗ g(μ_s(T)) + ∫₀ᵗ g(μ_s(S))` for increasing concave g with g(0) = 0 ✓ I1 (locator missing, R04).
10. fk86 Lemma 4.8 (855–857) and Theorem 4.9 (863–881): `μ_t(T) = t^(−1/p)‖T‖_p`, Hölder, triangle for p ≥ 1, p-triangle for 0 < p < 1 with the `g(s) = s^{p'}`, `p' ↑ p` route ✓ I3.
11. pisierGT Theorem 9.1 (1403–1418) and its proof (1448–1519): sign-cube duality, `[x]`, orthogonality (9.11), truncation with c = √3/2 and `|f_c(t)|² ≤ (4c)^(−2)t⁴`, c₁ = √3 ✓ I6 (every step of the README's bullet list).
12. pisierGT Lemma 9.2 (1432–1435): `‖(∫S⁴)^(1/4)‖ ≤ 3^(1/4)‖(∑x_k²)^(1/2)‖` for self-adjoint x_k in a C*-algebra ✓ (equivalent to `‖E(S⁴)‖ ≤ 3‖∑x_k²‖²`).
13. pisierGT Theorem 9.5 (1582–1587): lower constant 1 for 2 ≤ p < ∞, upper constant 1 for 1 ≤ p ≤ 2 ✓ (matches README I7 and `matrix_khintchine_high`); Definition 9.6 (1591) cotype 2 ✓.
14. hjx Theorem 2.1 (295–301): σ-finite M, faithful normal state, R_n finite, union w*-dense, Φ_n with `φ̂∘Φ_n = φ̂` and modular commutation ✓; Lemma 2.4 (344–350) periodicity and R_n ⊆ R_{n+1} ✓; Lemma 2.7 (521) σ-strong convergence ✓.
15. hjx Remark 2.8 (535–548): directed family, units p_i, `φ̂∘Φ_i = p_i φ̂ p_i`, `Φ_iΦ_j = Φ_i` for i ≤ j ✓ I5; Theorem 3.1 (564–583): 0 < p < ∞, quasi-Banach for p < 1, 1-complemented for 1 ≤ p < ∞ ✓; Remarks 3.2–3.4 (608–640) ✓; Theorem 6.8 (1367), Lemmas 6.10–6.12 (1430, 1448, 1461) ✓ I8.
16. px97 Theorem 2.1 (371–374): BG for 1 < p < ∞, finite algebra with normalized faithful trace, filtration generating M ✓; Theorem 2.3 (397–402) Stein ✓; Lemma 2.5 (419) randomized double sum from BG ✓; Lemmas 2.6–2.7 (468–513) fourth-power estimates ✓; Theorem 2.8 (717–735) Khintchine with second moments ✓ (the README notes the moment difference).
17. px97 Appendix (1422–1461, 1637–1642): BMO_C with `E_{−1} = 0`, BMO = BMO_C ∩ BMO_R with max norm, pairing `φ_a(x) = τ(a*x)`, `(1/√3)‖a‖_BMO_C ≤ ‖φ_a‖ ≤ √2‖a‖_BMO_C`, `‖x‖₁ ≤ √2‖x‖_{H¹}` ✓ I8.
18. rx14 Theorem 2 (63–65): BCL inequality for every von Neumann algebra, 1 < p ≤ 2, reversed for 2 < p < ∞ ✓ I5. cwikel Definition 1.1, sum/intersection norms, Definition 1.3 regular couple (75–110), §2 Calderón's theorem and the upper method (288–1111) ✓ I2. moslehian §3 (56–99): `s(A+B) ≺_w s(A)+s(B)` attributed to Fan 1951 ✓. hm07 Theorem 2.11 (705–709): constant 1/√3 for Rademachers with matrix coefficients ✓.

**Adversarial pass.** One row per statement; values computed on each side.

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| I1 `μ_t(x) = s_⌊t⌋(x)` on M_d(ℂ), unnormalized trace | d = 2, x = diag(3,1), t ∈ [0,1), [1,2), ≥ 2 | `d_x(λ) = #{j : s_j > λ}`; `inf{λ : d_x(λ) ≤ t}` = 3, 1, 0 = s₀, s₁, s₂ (finsupp value 0 beyond d) | ✓ | none |
| I1 normalized trace tr/d | same x, t = 1/2 | `d_x(λ)/2 ≤ 1/2` ⟺ `#{s_j>λ} ≤ 1` ⟹ μ = s₁ = s_⌊2·(1/2)⌋ | ✓ `μ_t = s_⌊dt⌋` | none |
| I1 Ky Fan check x = e₁₁, y = e₂₂ | k = 1, 2 | s(x+y) = (1,1), s(x) = s(y) = (1,0): 1 ≤ 2, 2 ≤ 2; pointwise s₁: 1 ≤ 0 false | ✓ both claims | none |
| I1 shifted pointwise `μ_{s+t}(x+y) ≤ μ_s(x)+μ_t(y)` | x = y = e₁₁, s = t = 1/2 | μ₁(2e₁₁) = 0 ≤ 1+1 | ✓ | none |
| I1 `x_n = n^{1/p}1_(0,1/n)` | p = 1, 2 | `‖x_n‖_p^p = n·(1/n) = 1`; measure of support 1/n → 0 so x_n → 0 in measure; `‖x_n‖_p = 1 ↛ 0` | ✓ converse fails | none |
| I1 concave integrated inequality (Thm 4.7) | x = e₁₁, y = e₁₂ in M₂, g = √·, t = 1 | s(x+y) = (√2, 0): √(√2) = 1.19 ≤ 1 + 1 | ✓ | none |
| I1 concave inequality is not weak submajorization | a = (1,1) ≺_w b = (2,0), g = √· | ∑g(a) = 2 > ∑g(b) = 1.41: the proof must go through Lemma 4.3 and Prop 4.6, as FK do | ✓ README cites the positive-sum reduction | none |
| I1 finite-trace inclusion `‖x‖_p ≤ τ(1)^{1/p−1/q}‖x‖_q` | M = ℂ², τ = counting, x = (1,1), p = 1, q = 2 | 2 ≤ 2^{1/2}·√2 = 2 | ✓ | none |
| I2 duality p = 1 | M = ℓ∞, τ = counting | (ℓ¹)* = ℓ∞ = M; L¹ = M_* ≠ M* = (ℓ∞)* | ✓ README distinguishes | none |
| I2 `[Lp₀,Lp₁]_θ = Lp`, `1/p = (1−θ)/p₀+θ/p₁` | p₀ = 1, p₁ = ∞, θ = 1/2 | 1/p = 1/2, p = 2 | ✓ | none |
| I2 sequence identity with q_j = ∞ | index set of size 2, E₀ = E₁ = ℂ, q₀ = ∞, q₁ = 2, θ = 1/2 | 1/q = 0 + 1/4, q = 4: `[ℓ∞₂, ℓ²₂]_{1/2} = ℓ⁴₂` (Riesz–Thorin on ℂ²) | ✓ | none |
| I3 covariance sign | h_ω ∈ L¹, `Tr∘θ_s = e^s Tr`, dual weight θ-invariant | `Tr(h θ_s y) = Tr(h y)` and `= e^s Tr(θ_{−s}(h) y)` ⟹ `θ_s(h) = e^{s} h = e^{s/1}h` | ✓ `θ_s(x) = e^{s/p}x` | none |
| I3 `Tr(1_(λ,∞)(|x|)) = λ^{−p}‖x‖_p^p` and `μ_t = t^{−1/p}‖x‖_p` | p = 2, ‖x‖₂ = 1, λ = 2, t = 4 | `d(2) = d_{|x|²}(4) = 1/4 = 2^{−2}`; `μ_4 = inf{λ : λ^{−2} ≤ 4} = 1/2 = 4^{−1/2}` | ✓ | none |
| I3 `Tr(|x|^p) = ∞` for x ≠ 0 | p = 1 | `∫₀^∞ μ_t dt = ∫ ‖x‖₁/t dt = ∞` | ✓ | none |
| I3 triangle for p > 1 from Thm 4.4(ii) | p = 2, t = 1 | `∫₀¹ s^{−1/2} ds = 2`: `2‖x+y‖₂ ≤ 2‖x‖₂+2‖y‖₂`; p = 1: `∫ s^{−1} = ∞`, no information | ✓ README uses predual norm at p = 1 | none |
| I3 p-triangle for 0 < p < 1 | p = 1/2, r = 1/4 | `∫₀¹ s^{−r/p} ds = ∫ s^{−1/2} = 2` finite; `‖x+y‖^{1/4} ≤ ‖x‖^{1/4}+‖y‖^{1/4}`, r ↑ p gives the p-triangle | ✓ | none |
| I4 `j_φ(x) ↔ x h^{1/p}` | pairing `ω_a(y) = tr(a y)` | `φ(yx) = tr(h y x) = tr((x h) y)`, `x h = (x h^{1/p}) h^{1−1/p}` ∈ L^p h^{1−1/p} = Kosaki's space | ✓ | none |
| I4 p = 2 GNS compatibility | — | `‖x h^{1/2}‖₂² = tr(h^{1/2}x*x h^{1/2}) = φ(x*x)` | ✓ | none |
| I4 no contractive expectation for p < 1 | Ω = {1,2} uniform, N = ℂ, f = (1,0), p = 1/2 | `‖f‖_p^p = 1/2`, `‖Ef‖_p^p = (1/2)^{1/2} = 0.707 > 0.5` | ✓ counterexample valid | none |
| I5 `σ^{φ̂}_g = Ad λ(g)` and period of φ_n | b_n = f(λ(2^{−n})), `f(e^{iθ}) = θ` | `e^{ib_n} = λ(2^{−n})`; `σ^{φ_n}_{2^{−n}} = Ad(e^{−ib_n})Ad(λ(2^{−n})) = id` | ✓ | none |
| I5 Hölder for the 0 < p < 1 density step | `1/p = 1/2 + 1/r`, p = 2/3 | r = 2, `‖h^{1/2}‖₂ = tr(h)^{1/2} = 1` | ✓ | none |
| I5 Clarkson moduli | `δ(ε) ≥ (p−1)ε²/8`, p = 2 | BCL at p = 2: parallelogram law gives δ(ε) = 1 − √(1−ε²/4) ≥ ε²/8 | ✓ | none |
| I6 column/row realization | a = (a_k), X = ∑ a_k ⊗ e_{k1} | `X*X = ∑a_k*a_k ⊗ e₁₁`, `‖X‖_p = ‖(∑a_k*a_k)^{1/2}‖_p` with unnormalized trace | ✓ | none |
| I6 matrix units (e_{1k})_{k≤n} | n = 4, p = 1, 4 | `C_p = ‖I_n‖_p = n^{1/p}` = 4, 1.41; `R_p = ‖n e₁₁‖_p^{1/2}… = √n = 2`; `K_p = √n = 2` | ✓ one square function alone fails | none |
| I6 pairing expansion `E(S⁴) = A+B+C−2D` | x₁ = x₂ = 1 | S ∈ {2,0,0,−2}: E(S⁴) = 8; A = 4, B = 4, C = 4, D = 2: 4+4+4−4 = 8 | ✓ | none |
| I6 Pauli check | x₁ = σ_x, x₂ = σ_z | S² = 2 so E(S⁴) = 4; A = B = 4, C = 1+1+(σ_xσ_z)²+(σ_zσ_x)² = 2−2 = 0, D = 2: 4+4+0−4 = 4; commutative formula 12−4 = 8 ≠ 4 | ✓ | none |
| I6 `E(S⁴) = 3n²−2n` for x_k = 1 | n = 2, 3 | 8, 21 = 3·9−6 | ✓, ratio → 3 | none |
| I6 bound `‖E(S⁴)‖ ≤ 3‖∑x_k²‖²` | T = ∑x_k² | A = T² ≤ ‖T‖²; B = ∑x_iTx_i ≤ ‖T‖T ≤ ‖T‖²; operator C–S with u_{ij} = v_{ij} = x_ix_j: ∑uu* = ∑v*v = B so ‖C‖ ≤ ‖T‖²; D ≥ 0 | ✓ | none |
| I6 truncation `(|t|−c₀)₊² ≤ t⁴/(16c₀²)` | c₀ = √3/2, t = 2c₀ = √3 | LHS = 3/4, RHS = 9/12 = 3/4 (equality at |t| = 2c₀); 16c₀² = 12 | ✓ | none |
| I6 iteration constant | geometric series | `[x] ≤ c₀(1 + 1/2 + 1/4 + …) = 2c₀ = √3`, so c = 3^{−1/2} | ✓ matches pisierGT 1517–1519 | none |
| I6 self-adjoint reduction | z_k = [[0,x_k],[x_k*,0]] | `z_k² = diag(x_kx_k*, x_k*x_k)`; `‖∑z_k²‖ = ‖x‖_RC²` | ✓ | none |
| I6 orthogonality | Φ = ∑ε_k y_k + Φ′, E(ε_kΦ′) = 0 | `E(Φ*Φ) = ∑y_k*y_k + E(Φ′*Φ′) + 0 ≥ ∑y_k*y_k` | ✓ | none |
| I7 identity for `x_n*x_n` | n = 1, x₋₁ = 0 | `(dx₀+dx₁)*(dx₀+dx₁) = dx₀*dx₀ + dx₁*dx₁ + dx₁*x₀ + x₀*dx₁` | ✓ | none |
| I7 constants 1 in Khintchine | p ≥ 2 lower, p ≤ 2 upper | `E τ((S*S)^{p/2}) ≥ τ((E S*S)^{p/2}) = C_p(a)^p` by convexity of x ↦ τ(x^{p/2}) for p ≥ 2; reversed for p ≤ 2 (Jensen); agrees with pisierGT Theorem 9.5 | ✓ | none |
| `matrix_khintchine_high` degenerate cases | n = 0; d = 0; p = 2 | n = 0: columnSquare = sqrt 0 = 0, S = 0, K = ((0)/1)^{1/2} = 0: 0 ≤ 0 ∧ 0 ≤ B·0; d = 0: all gauges 0; p = 2: S = K (randomSumGauge_two), any B ≥ 1 works | ✓ | none |
| `randomSumGauge_two` | a = (e₁₁, e₂₂) in M₂ | K₂² = (1/4)∑_ε ‖ε₁e₁₁+ε₂e₂₂‖₂² = 2; columnSquare = sqrt(I) = I, ‖I‖₂ = √2 | ✓ | none (padding, R02) |
| I8 BMO constants | px97 Appendix | `(1/√3)‖a‖ ≤ ‖φ_a‖ ≤ √2‖a‖` ⟺ README's `‖φ_a‖ ≤ √2‖a‖`, `‖a‖ ≤ √3‖φ_a‖` | ✓ | none |
| I3 claim "h_ω Tr-measurable iff ω bounded" | ω = τ on L∞(ℝ) (τ(1) = ∞) | `Tr(1_(λ,∞)(h)) = ω(1)/λ = ∞` for every λ: not measurable; ω bounded: finite | ✓ | none |

**Definitions checked for the wrong model.** `matrixLpGauge`: `CFC.nnrpow (CFC.sqrt (star x * x)) p` is `|x|^p`; a wrong model using `x * star x` gives the same trace (unitary invariance), a wrong model omitting `.re ^ (1/p)` fails the p = 2 Frobenius check; the normalized trace is excluded by `Matrix.trace` (unnormalized), which the README's Ky Fan check pins. `columnSquare`/`rowSquare`: `star (a k) * a k` versus `a k * star (a k)` are distinguished by (e_{1k}) (values n^{1/p} versus √n above). `randomSumGauge`: averaging over `Fin n → Bool` with the uniform weight `1/2^n`; the wrong model without the division gives 2^{n/p} times the right value. `CompatibleCouple.kFunctional`: `sInf` over decompositions in the sum carrier; for x ∈ sumCarrier the set is nonempty and bounded below by 0, so the Real `sInf` is the K-functional (no junk).

## Not verifiable

- Bergh–Löfström, *Interpolation Spaces* (Theorems 4.3.1, 4.5.1, 4.6.1, 5.1.2, 5.6.3 for the complex-method statements of I2): Springer book, DOI 10.1007/978-3-642-66451-9, paywalled; cited by locator only. Cwikel's notes (fetched) cover Calderón's duality theorem and the upper method but not the reiteration with endpoints.
- Pisier–Xu, *Non-Commutative Lp-Spaces*, Handbook of the Geometry of Banach Spaces 2: Elsevier, DOI 10.1016/S1874-5849(03)80041-4, paywalled.
- Takesaki, *Theory of Operator Algebras II* (VIII.3.14, IX.4.2, X.2.3): book, not online.
- Haagerup, *Lp spaces associated with an arbitrary von Neumann algebra* (Colloques CNRS 274, 1979; Theorems 1.2–1.3, Definition 1.4, Proposition 1.5): not available online; fk86 Lemma 1.7 (line 174) and Lemma 4.8 restate the density lemma, which is what I3 uses.
- Ball–Carlen–Lieb, Invent. Math. 115 (1994): Springer, DOI 10.1007/BF01231769, paywalled; the statement was checked through rx14 lines 56–65.
- Lust-Piquard–Pisier, Ark. Mat. 29 (1991): Springer, DOI 10.1007/BF02384340, paywalled; the README's description of its two proofs (cotype 2 of M_* and the H¹(M_*) factorization) agrees with pisierGT lines 1419–1422.
- Ky Fan, PNAS 37 (1951): pnas.org returns HTTP 403 and PMC (PMC1063464) serves a captcha page; the inequality is confirmed from moslehian line 99 with the attribution. Listed in `needs-references.toml`.
- Haagerup, *On the dual weights for crossed products of von Neumann algebras I* (Math. Scand. 43, 99–118): not fetched; the README cites only Part II, which was read (haagerup78b).

## Source issues

- none
