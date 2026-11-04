# Review of ConformalMappingPartII (pull request #1407 at 62e73fb)

**Verdict:** needs changes

## R01 (P2) — Two headlines the docstring calls unstatable are statable at the pins

**Location:** `TauCetiRoadmap/ConformalMappingPartII/Suggested.lean:18–23`, the module docstring: “The symmetric polygon and group-presentation headlines are not statable at the pins … The continued zero-balanced connection formula and uniform cusp asymptotic likewise lack the constructed continued hypergeometric branch.” Compare README §6.2 (line 756), §6.3 (line 762) and §4.6 (line 646).

**Claim:** The docstring designates the deck-group presentation (§§6.2–6.3) and the zero-balanced connection formula (§4.6) as headline theorems and says neither is statable at the pins. Both are statable with the carriers the file already uses, so the acceptance test omits two statable headlines.

**Witness:** A scratch file importing `TauCetiRoadmap.ConformalMappingPartII.Suggested` elaborates both statements below with `sorry` as the only warnings (exit 0). The deck group is encoded exactly as `finite_puncture_cusp_comparison` already encodes it (`g ∈ Γ ↔ ∀ τ, f (g • τ) = f τ`); the generators are the pinned `Matrix.ProjectiveSpecialLinearGroup.upperRightHom` and `Matrix.SpecialLinearGroup.rotation`; `FreeGroup.lift`, `Complex.digamma`, `Complex.Gamma`, `ascPochhammer` and `ordinaryHypergeometric` are native.

```lean
/-- The half-plane form of a roots cover through the inverse Cayley map. -/
def halfPlaneForm {N : ℕ} (F : RootsCover N) (τ : UpperHalfPlane) : ℂ :=
  F.toFun (((τ : ℂ) - I) / ((τ : ℂ) + I))

/-- §§6.2–6.3: the deck group of the roots cover is free on the N conjugates of the
primitive translation, whose integer powers are the full stabilizer of infinity. -/
theorem free_presentation {N : ℕ} (F : RootsCover N) :
    ∃ Γ : Subgroup PSL(2, ℝ),
      (∀ g : PSL(2, ℝ), g ∈ Γ ↔ ∀ τ, halfPlaneForm F (g • τ) = halfPlaneForm F τ) ∧
      let t : PSL(2, ℝ) :=
        Matrix.ProjectiveSpecialLinearGroup.upperRightHom (2 / Real.tan (Real.pi / (2 * N)))
      let r : PSL(2, ℝ) := (Matrix.SpecialLinearGroup.rotation (-Real.pi / N) : PSL(2, ℝ))
      let φ : FreeGroup (Fin N) →* PSL(2, ℝ) :=
        FreeGroup.lift (fun k ↦ r ^ (k : ℕ) * t * (r ^ (k : ℕ))⁻¹)
      Function.Injective φ ∧ φ.range = Γ ∧
      ∀ g : PSL(2, ℝ), (g ∈ Γ ∧ g • (OnePoint.infty : OnePoint ℝ) = OnePoint.infty) ↔
        ∃ n : ℤ, g = t ^ n := by sorry

/-- §4.6 on the lens where both sides converge, with the principal logarithm. -/
theorem zero_balanced_connection (a : ℂ) (ha : 0 < a.re) {x : ℂ}
    (hx : ‖x‖ < 1) (hx1 : ‖1 - x‖ < 1) :
    ordinaryHypergeometric a a (2 * a) (1 - x) =
      Complex.Gamma (2 * a) / Complex.Gamma a ^ 2 *
        ∑' k : ℕ, (Polynomial.eval a (ascPochhammer ℂ k)) ^ 2 / ((k.factorial : ℂ) ^ 2) *
          x ^ k * (-Complex.log x + 2 * (Complex.digamma (k + 1) - Complex.digamma (k + a))) := by
  sorry
```

The lens identity is the whole content of §4.6: the series is analytic on the slit punctured disc, the native series is analytic on `‖1 − x‖ < 1`, and agreement on the lens identifies the series as the continuation. The identity was checked numerically at (a, x) = (1/2, 0.01), (1/4, 0.05), (3/4, 0.2): both sides 2.352715816780, 1.390163183039, 1.702460198286. The presentation was checked at N = 2: u = r t r⁻¹ = [[1,0],[−2,1]], tu = [[−3,2],[−2,1]] ≠ ut = [[1,2],[−2,−3]] projectively, so the image is non-abelian as a free group of rank 2 must be; at N = 3 the width 2cot(π/6) = 2√3 and the word search below give h₃(|a|+|c|) ≥ h₃ on all words of length ≤ 6.

**Exact repair:** Add the two theorems above to `Suggested.lean` (Layer 4 and Layer 6 sections, in README order), and reword the module docstring so that it names as unstatable only what still lacks a carrier: the marked polygon as a fundamental domain can be stated through `TauCeti.dirichletDomain` and `MeasureTheory.IsFundamentalDomain` as well, so if the author keeps it out, the docstring should say which carrier (the ideal-polygon region) it lacks rather than the deck subgroup. §8.1 is statable the same way once the zero-balanced series is a real-bodied definition (the `tsum` above); state it or name the series definition as the only missing piece. Add the two new Lean names to README §§4.6 and 6.3 so the gate's README–Lean agreement check sees them.

## R02 (P3) — Two horodisc theorems cited without their namespace

**Location:** `TauCetiRoadmap/ConformalMappingPartII/README.md:107`: “Consume its `disjoint_smul_horodisc_horodisc` and `mem_stabilizer_of_mem_horodisc_of_smul_mem_horodisc` in `TauCeti.Analysis.Complex.Fuchsian.Cusp.Horodisc`”.

**Claim:** Every other library declaration in the supplier contracts is cited by its fully qualified name; these two are not, and `#check @Subgroup.disjoint_smul_horodisc_horodisc` fails at the pin.

**Witness:** `TauCeti/Analysis/Complex/Fuchsian/Cusp/Horodisc.lean:78,209,224` at the pin: the namespace is `TauCeti.Subgroup.CuspDatum`, so the names are `TauCeti.Subgroup.CuspDatum.disjoint_smul_horodisc_horodisc` and `TauCeti.Subgroup.CuspDatum.mem_stabilizer_of_mem_horodisc_of_smul_mem_horodisc`, both taking `[DiscreteTopology Γ]` and `D.width ≤ A`.

**Exact repair:** Write the two names with the `TauCeti.Subgroup.CuspDatum.` prefix at README line 107 (and at the §8.3/§8.5 *Needs:* lines that cite “`TauCeti.Analysis.Complex.Fuchsian.Cusp.Horodisc` precise invariance”), noting the discreteness and `width ≤ A` hypotheses they carry.

## Previous findings

The previous review (round 3) read this same head; `changes.md` records zero changed lines in the folder. Its sole finding, R01 (P2, the redundant `gap:little-picard` request in `packages/ConformalMappingPartII/design/plan.json`), is **repaired** outside the folder: the board commit a347ff81 of 2026-11-03 (“retire the redundant little-picard gap”) leaves `{"gaps": []}`, and this round's brief lists no declared gap. README line 25 keeps the ModularForms Layer 10 attribution, as that finding asked. No finding of any earlier round was marked “not actionable” except F06 of the second red-team repair (a merge-order edit outside the package), which does not recur: the outside-folder diff `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ConformalMappingPartII'` is empty at this head.

## Verified sound

**Mechanical evidence.** HEAD is 62e73fbea5f43d549283fd898a59ecf000c27c7e; the worktree is clean and the outside-folder diff is empty. The worker's gate at this head passes every scanner, the dependency check and the targeted build (`build=0 OK`). Fresh `lake env lean` on `TauCetiRoadmap/ConformalMappingPartII/Suggested.lean` exits 0 in 19.5 s with exactly 14 warnings, all `declaration uses sorry`, at lines 57, 67, 87, 103, 145, 155, 173, 188, 195, 205, 225, 236, 248, 259. A scratch file with `#check @name` for all 26 roadmap declarations and 95 cited library names elaborated; every roadmap signature keeps its binders (the `T2Space`/`SecondCountableTopology`/`SimplyConnectedSpace`/`NoncompactSpace` instances on `noncompactCoordinate`, `3 ≤ S.card`, the covering and surjectivity hypotheses, `2 ≤ N`, `0 < r → r < 1`, `D.width ≤ A`) and agrees with its README statement; nothing was changed. Three library names did not resolve as I first wrote them and all three exist at the pin under other spellings: `TauCeti.IsAnalyticContinuationAlong` is the structure at `TauCeti/Analysis/Complex/Conformal/Continuation/Basic.lean:190` (namespace `TauCeti`, module not named in the README, no finding), and the two horodisc theorems are R02. Replacing each of the 14 `sorry` bodies by `simp` leaves 14 errors (unsolved goals at the same 14 lines); reading the definitions and the pinned lemmas gave no `rfl`, `infer_instance` or single-lemma `exact` witness, so no declaration is padding. No `set_option`, no sorried data, no `lemma`, imports are `import Mathlib` plus three existing `TauCeti.*` modules.

The dependency command reports exactly

```text
depcheck: 204 roadmaps, 1657 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line. `ConformalMappingPartII` is line 229 of the merge order; all ten supplier roadmaps are on main (`Completed/ConformalMapping`, `Completed/UniversalCovers`, `TauCetiRoadmap/{DifferentialGeometry, FuchsianOrbifolds, ClassicalArithmeticCompletion, DiophantineApproximationAndTranscendence, RiemannianGeometry, PDE, ComplexCurveModuli, ModularForms}`), so no open pull request is a supplier and the open revisions of those roadmaps were not substituted for main.

**Principles.** The route keeps the general objects: arbitrary hyperbolic plane domains in §1.1 (infinitely many complementary components allowed), every N ≥ 2 in the final theorem (large N by Layer 8, the finite list by §§9.11 and 9.18), the general finite-puncture comparison in §1.7 before any roots-specific polygon. Nothing re-plans a roadmap on main: the planar Riemann map, normal families, covering carrier and atlas, Fuchsian compactification, planar conformal radius and disc initial-value theorem are consumed by name and section. No computational algorithm, no copied passage, no process narrative. Chart conventions (`OnePoint.chartAt_coe` is the affine chart, `chartAt_infty` the inverted chart, `TauCeti/Geometry/Manifold/Instances/OnePoint.lean:203,214,218`) match README §1.7's “X at finite points and 1/X at infinity”.

**Source sample: 15 of 15 reopened.** CDT-journal printed page = PDF page + 626 (page marker line 2346 is printed 668).

| Target | Locator read | Result |
|---|---|---|
| 0.3 continuation | TeschlODE line 6243, Theorem 4.7, printed p.130 (page marker line 6259 = 131) | Linear analytic system on a simply connected domain has a unique solution on all of Ω; its proof is continuation along paths plus the monodromy theorem, exactly the route §0.3–0.4 state. |
| 1.5 monotonicity | `Mathlib/Analysis/Complex/Schwarz.lean:261` (`norm_deriv_le_one_of_mapsTo_ball`, `MapsTo f (ball c R) (closedBall (f c) R)`), equality case at 291 | Applied to the based lift of the inclusion composed with the cover of Ω, it gives R(Ω,a) ≤ R(Ω′,a). |
| 1.11 descended map | CDT-journal line 2552, Definition 5.1.15, p.671 | G_N(z^N) = F_N(z)^N into ℂ∖{1}, well defined by Lemma 5.1.2; derivative, omitted value and ramification are the roadmap's own additions, stated as such. |
| 2.7 accessory parameters | CDT-journal lines 2495–2547, proof of Lemma 5.1.8, pp.670–671 | p₀ = 0, p_k = ζ^k, m_k = c ζ^{−k} with c = −1/2 − 1/(2N), m₀ = 0, from the three constraints (5.1.14); agrees with the README. |
| 4.5 inverse matching | CDT-journal lines 2560–2651, Lemma 5.1.16 and proof, pp.671–672 | ψ_N(x) = |F′_N(0)|⁻¹ s_N(x^N), φ_N = δ_N⁻¹ s_N^N, δ_N = |F′_N(0)|^N, parameters (N±1)/(2N) with c = 1 ± 1/N. |
| 4.6 continuation | CDT-journal line 2654, Lemma 5.1.20, p.672; DLMF-15-8 line 516 (15.8.10 at m = 0, b = a) with DLMF-15-2 line 145 (15.2.2, bold F = F/Γ(c)) | The DLMF form with z = 1 − x gives Γ(2a)/Γ(a)² Σ (a)_k² x^k/(k!)² (−log x + 2ψ(k+1) − 2ψ(k+a)); hypotheses on 2a and x = 0 are the roadmap's addition (and a source gap below). |
| 6.2 primitive translation | CDT-journal line 2795, Proposition 5.2.1, p.674 | Stabilizer of i∞ generated by τ ↦ τ + 2cot(π/2N); the proof derives the width from finite covolume and N + 1 cusps. |
| 6.3 free presentation | same, lines 2802–2803 | Free on N generators t̃_N and its conjugates by powers of r̃_N. |
| 6.4 power stabilizer | CDT-journal line 2830, Definition 5.2.3, p.674 | Φ̃_N = ⟨Γ̃_N, r̃_N⟩ = ⟨r̃_N, t̃_N⟩. |
| 6.7 half rotation | CDT-journal line 2848, Lemma 5.2.6, p.675 | 1 − F̃_N^N(s̃τ) = 1/(1 − F̃_N^N(τ)) for s̃ of order 2N with s̃² = r̃_N. |
| 7.2 characteristic | CDT-journal lines 3030–3046, §6.1.1, p.679 | T = m + N with N(r,f) = Σ_{0<|ρ|<r} ord⁻ log(r/|ρ|) + ord⁻₀ log r; the centre term can be negative, as the README says. |
| 7.10 radial monotonicity | CDT-journal lines 3262–3264, proof of Corollary 6.2.9, p.683 | Uses that m(r, f′/f) = T(r, f′/f) is increasing in r for the holomorphic f′/f. |
| 8.5 exceptional set | CDT-journal lines 2962–2981, proof of Lemma 5.2.18, p.678 | S(M,N), M = N/(1−r), M₀ = 2, ε = 1/2, D = N²M/π²; large values placed by Lemma 5.2.6 (source writes S, the roadmap's sS is the correct set, see Source issues). |
| 8.7 maximum growth | CDT-journal line 2957, Lemma 5.2.18, p.678 | “N ≫ 1”, absolute constants; the roadmap keeps the threshold. |
| 9.13 omitted value one | CDT-journal lines 3279–3419, Corollary 6.2.11 and proof, pp.683–684 | Lemma 6.1.7 applied to g = 1 − F_N; the proof chain m(F/F′) = m(F′/F) + N(1/F) ≤ m(F′/(1−F)) + T(F) + log 2 uses |F′_N(0)| > 1, which is why §9.15 needs §5.7. |

Also reread: Uniformization line 39 (Theorem 1, p.2), 152–156 (Theorem 6, p.4), 213–219 (Proposition 9, pp.5–6); McMullenRS line 318 (Theorem 2.9, p.9) and 5348–5351 (§16, p.147); DLMF-15-10 line 76; `TauCeti/Analysis/Complex/UpperHalfPlane/Rotation.lean:19` for the convention `rotation θ = !![cos θ, sin θ; −sin θ, cos θ]`, which makes README §1.10's “r̃_N is `rotation (−π/N)`” correct.

**Pinned objects opened.** `Subgroup.IsCofinite` is a structure with fields `discreteTopology` and `covolume_ne_top` (`TauCeti/Analysis/Complex/Fuchsian/Covolume.lean:114`); `Subgroup.CuspDatum` has fields `cusp`, `scaling`, `generator`, `width`, `width_pos`, `zpowers_generator : zpowers generator = stabilizer Γ cusp`, `scaling_mul_generator_mul_inv` (`Cusp/Datum.lean:167–177`), so a nonprimitive generator cannot be packaged; `cuspRadius D A = exp(−2πA/width)` and the q-coordinate `exp(2πi σ(z)/w)` (`Compactification/Cusp/Chart.lean:16,69,230`), inverse at 0 the cusp (`cuspChartInv` line 118); `OnePoint.affineChart`/`invChart` (`OnePoint.lean:68,121`) with `invChart ∞ = 0` and `invChart x = x⁻¹`; `Matrix.ProjectiveSpecialLinearGroup.upperRightHom` is the transvection `!![1, x; 0, 1]` (`LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup/FinTwo.lean:137`); `MeromorphicOn.circleAverage_log_norm` is the closed-disc Jensen formula with the closed-ball divisor, a separate centre term and `meromorphicTrailingCoeffAt` (signature printed by `#check`), matching `discCounting`'s closed-ball divisor, zero weight on the circle and centre term; `ordinaryHypergeometric_eq_tsum` has the `ascPochhammer` coefficients used in R01; `Complex.digamma_one = −γ`, `digamma_apply_add_nat` with the pole guard; `Real.Gamma_mul_Gamma_add_half` and `Gamma_mul_Gamma_one_sub` as cited; `IsCoveringMap.existsUnique_continuousMap_lifts` and `Differentiable.exists_eq_const_of_bounded` as cited for the §1.1 lift. All seven `TauCeti.*` modules named in the README exist at the pin.

**Cross-roadmap citations resolved on main.** ConformalMapping `#layers-each-a-discharge-gated-milestone` (`Completed/ConformalMapping/README.md:102`, L1–L4 at 111–127; line 15 and 167 assign Picard to the modular-forms roadmap, as README line 25 says); UniversalCovers Stage 0/1/2 (`Completed/UniversalCovers/README.md:63,89,98`); DifferentialGeometry 2.3 “Smooth structures on covers” (`README.md:341,357`); FuchsianOrbifolds Layers 0, 2, 3, 4 (`README.md:193,235,263,286`); ClassicalArithmeticCompletion §6.20 (`README.md:12527–12531`, cr(Ω,p) = 1/|φ′(p)| on proper simply connected domains, 0 outside, exactly as §1.3 compares); DiophantineApproximationAndTranscendence §5.1 (`README.md:2972–3011`, the scalar disc initial-value theorem with solution space of dimension m at line 3008); RiemannianGeometry R4.3 (`README.md:657–675`: Hausdorff second-countable universal-cover manifold, complete pullback metric, curvature preserved) and R4.7 (`README.md:717–774`: Killing–Hopf classification, disc metric `4|dx|²/(1−|x|²)²`, K = −1); PDE Lane C 12–15 (`README.md:285–300`); ComplexCurveModuli D0.4 (`README.md:25–26`, complete finite-area curvature −1 metric with explicit cusp metric); ModularForms Layer 10 (`README.md:1024`).

**Ownership.** `roadmaps grep` over main and the 441 open heads for finite Blaschke products, the quotient representation, conformal radius, Schwarzian, zero-balanced continuation, Perron, the roots-of-unity cover and disc-local Nevanlinna quantities: ClassicalArithmeticCompletion §6.51 (`README.md:13376–13380` on main) uses specific real-coefficient Blaschke products as a tool without defining the interface; FormalConnectionsOpers §5.1 owns the formal oper Schwarzian; PeriodsAndSpecialValues PS8.10 a j-specific one; ModularCurves' “First Main Theorem” is Katz–Mazur's; the open GlobalHolomorphicFunctions head has no Blaschke, Jensen, Nevanlinna or Herglotz target; Completed ConformalMapping has none of these objects. No open pull request declares any of this roadmap's 26 fully qualified names. Ownership against open pull requests was checked through the index and the sibling checkouts named in the brief.

**Adversarial table.** Values computed in exact rational arithmetic (power series) or IEEE double precision; the N = 2 cover is F₂ = 2λ∘C − 1 with λ the modular lambda function from theta series (this realization has F₂′(0) < 0, so it is the oriented cover precomposed with z ↦ −z; every identity below is phase-independent or was corrected by the phase). Circle means use 8192 midpoint samples. “Keep” means the instance did not refute the statement; the uniform constants are not certified numerically.

| Statement | Instances and values | Result |
|---|---|---|
| Conventions: Cayley, jet, Haar | C(0) = i, C(1/2) = 3i, C⁻¹(3i) = 1/2; jet of z² at 0 to order 2 is (0,0,2); mean of 1 is 1. | keep |
| 0.1 equation, companion | y′ + y = 0: e^{−z} gives 0, the constant 1 gives 1 ≠ 0; n = 0 excluded by `positiveOrder`. | keep |
| 0.2/0.4 `global_initial_value` | y″ = 0, jet (2,3) at 0: y = 2 + 3z; a second solution with the same jet has jet (0,0) difference, hence is 0 on Ω. √z on ℂ∖{0} has monodromy −1, excluded by `SimplyConnectedSpace`. | keep |
| 0.3 continuation | y′ − y/(2z) = 0 on ℂ∖{0}: continuation around 0 multiplies √z by −1 yet still solves the equation. | keep |
| 0.5/0.6 | zy′ + y = 0: basis 1/z, pole bound 1; z²y′ + y = 0: e^{1/z} single valued, no meromorphic basis; q(t) = t² clears 1/z³ at p = z² (orders 4 − 3 = 1). | keep |
| 1.1 `noncompactCoordinate` | 𝔻 and ℂ admit id; the sphere is compact (excluded); Green function on the radius-2 disc is log(2/|z|): G(1) = 0.6931, G(2) = 0; annulus data 0/1 give log|z|/log R. | keep |
| 1.1 `exists_cover` | Ω = ℂ∖{0,1}, b = 0, c = 1 (c − b = 1 ≠ 0); h = 2 omitting 0,1 lifts to a constant; exp omits one value only and is excluded by the premise. | keep |
| 1.2 cover uniqueness | F = z, G = iz: rotation i, derivative norms 1 = 1; z² has derivative 0 at 0 and is not a cover; a constant map has an empty fibre and fails `surjective` (Mathlib's `IsCoveringMap` allows empty fibres). | keep |
| 1.3 `conformalRadius` | 𝔻 at 0: set {1}, sInf 1; D(0,2): {2}; empty set gives sInf ∅ = 0 with no geometric claim (README says so). | keep |
| 1.4/1.5 extremality, monotonicity | Cover 2z of D(0,2), φ = z: 1 < 2; φ = 2iz: equality, lift iz a rotation; 𝔻 ⊂ 2𝔻: 1 ≤ 2. | keep |
| 1.7 `finite_puncture_cusp_comparison` | S = {0,1,∞}: three cusp orbits, area 2π = 2π(N − 1) at N = 2; card 0,1,2 fail `3 ≤ S.card`; chart test X = p + 2q + 3q²: u(0) = p, u′(0) = 2; at ∞, X = 1/(2q + 3q²) in `invChart` gives u = 2q + 3q², u′(0) = 2; the affine chart has a pole there. Width-2 datum: generator τ + 2 gives 2ℤ; its square generates 4ℤ ≠ stabilizer, excluded by `zpowers_generator`. | keep |
| 1.8 `RootsCover` | N = 2 target ℂ∖{±1}; F₂(0) = −2·10⁻¹⁶; the theta realization has F₂′(0) = −4.3768790 (phase −1), so `oriented` picks F₂(−z). | keep |
| 1.9/1.10 | F₂(−z) = −F₂(z) at z = 0.3 + 0.2i: both 1.13229615 + 0.13705698i (sign flipped). N = 3: r̃₃·2i = 0.39970 + 0.61538i, C⁻¹ gives −1/6 − 0.288675i = ζ₃⁻¹/3, so r̃_N is multiplication by ζ_N⁻¹ (the source writes ζ_N). | keep; source misprint |
| 1.11/1.12 descent | F = az + O(z^{N+1}) gives G(w) = a^N w + O(w²); at N = 2 the two roots ±z give the same F² value: F₂(−z)² = F₂(z)². | keep |
| 2.1 `schwarzian` | S(2z + 1) = 0; S(z²)(1) = −3/2; S(1/z)(1) = 6 − 6 = 0; S(z⁴)(1) = −15/2 = (−3/2)·4 − 3/2 (chain rule 2.2). | keep |
| 2.5–2.7 accessory parameters | Constraints Σm_k, Σ(2m_kp_k + 1), Σ(m_kp_k² + p_k) are 0 to 10⁻¹⁶ for N = 2, 3, 5 with m₀ = 0, m_k = −(1/2 + 1/(2N))ζ^{−k}. S_X(1/x)·x⁻⁴ equals the §2.8 formula at N = 2, x = 0.3 + 0.1i (1.79183391 + 0.27031142i), N = 3 (1.85801885 − 1.56356317i), N = 4 (0.37884374 + 3.77376244i). | keep |
| 2.8 `roots_inverse_schwarzian` | Exact power series of J_N (Fractions): S(J_N) agrees with the formula through x²¹ for N = 2, 3, 4, 5; S(J₂)(0) = 3/2, S(J₃)(0) = 0. x → ∞ gives 1/(2x²), the parabolic cusp at ∞, as it must since ∞ ∈ ℙ¹∖(ℂ∖μ_N) is punctured. | keep |
| 2.9 inverse ODE | N = 2 at x = 0: 4y″ + 3y = 0; η₂ = 1 − 3x²/8 + … gives −3 + 3 = 0. | keep |
| 3.1/3.2 Blaschke | b₀(z) = z; b₁ ≡ −1 (raw 0/0 at z = 1 would give 0); b₋₁ ≡ 1; |b_{1/2}(−1)| = 1; empty product 1; a = 0, m = 2 gives z². | keep |
| 3.3–3.5 Herglotz, phase | g = e^z: L = z, boundary modulus cos θ, kernel integral z; G = i: integral 0, exponential 1, phase i restores i. | keep |
| 3.7 `quotient_representation` | g = 0: h = 1 gives log 1 = 0 ≤ ε and log‖0‖ = 0 ≤ ε (totalized); g = 2: h = 1 gives 0 and log 2 ≤ log 2 + ε; g = 1/2: m = 0, log(1/2) ≤ ε. | keep |
| 3.8 optimality | g = 2, h = 1: log 2 = log 2; without h(0) = 1, h = 0 would break it. | keep |
| 4.1 Gauss | a = 0: ₂F₁ ≡ 1; a = −1, b = c = 1: 1 − x solves it for all x; c = 0 excluded. | keep |
| 4.4 `inverseRatio` | Exact coefficients: J₂ = u + u³/4 + 2u⁵/15 + 17u⁷/192; J₃ = u + u⁴/6 + 103u⁷/1260; J₄ = u + u⁵/8; J₅ = u + u⁶/10; so J_N′(0) = 1, J₂‴(0) = 3/2. | keep |
| 4.5 `inverseRatio.cover_inverse` | F₂(F₂′(0)⁻¹ J₂(x)) = 0.2000000094 at x = 0.2 and 0.1000000054 + 0.3000000148i at x = 0.1 + 0.3i (finite-difference derivative error 5·10⁻⁸). | keep |
| 4.6 connection formula | (a, x) = (1/2, 0.01), (1/4, 0.05), (3/4, 0.2): native series at 1 − x equals the zero-balanced series to 12 digits (2.352715816780, 1.390163183039, 1.702460198286); k = 0 coefficient at a = 1/2 is −log x + 4 log 2 since −2γ − 2ψ(1/2) = 2.772589 = 4 log 2. | keep; see R01 |
| 4.7 digamma control | ψ(2) − ψ(5/4) = 0.650238; at a = 1/4: 0.650238, 0.350238, 0.239127, 0.074048 for k = 1, 2, 3, 10; a = 1/2: 0.386294, …; a = 3/4: 0.175312, …; decreasing in k and a, all in [0, 0.650238]; the wrong index ψ(k) − ψ(k + a) at k = 1 is negative (−0.349762 at a = 1/4). | keep |
| 4.8 remainder | Tail scale x(1 + |log x|) = 0.0561 at x = 0.01; tails at a = 1/4, 1/2, 3/4 are 0.0037, 0.0135, 0.0281 (from the 4.6 series). | keep |
| 5.1–5.3 `gammaRadius` | N = 2, 3, 10: 4.376879230453, 2.581056539840, 1.320306382656 from the definition, the alternative expression and the boundary limit alike; Γ(1/4)⁴/(4π²) = 4.376879230453, Γ(1/6)³/(12π^{3/2}) = 2.581056539840; N = 1: Γ(0) = 0 in Mathlib gives 0. | keep |
| 5.4 boundary limit | Γ(1 + 1/N)Γ(a₋)²/(Γ(1 − 1/N)Γ(a₊)²) equals γ_N at N = 2, 3, 10 (values above). | keep |
| 5.5 `roots_conformal_radius` | |F₂′(0)| = 4.37687902 from theta series versus γ₂ = 4.37687923 (difference is the finite-difference error); the singleton set gives sInf = γ_N. | keep |
| 5.6 log-Gamma series | log Γ(1.3) = −0.1081748095 versus −γz + Σ_{k=2}^{11}(−1)^kζ(k)z^k/k = −0.1081748442 (tail 0.3¹²/12 ≈ 4·10⁻⁸). | keep |
| 5.7 odd-zeta series | N = 3: log γ₃ − (log 16)/3 = 0.024002585926, five terms give 0.024002479136; N = 2: 0.090041605 versus 0.090017601 (tail from k ≥ 6 is 2.4·10⁻⁵). Coefficients c₁ = ζ(3)/2, c₂ = 3ζ(5)/8, c₃ = 9ζ(7)/32, all positive. | keep |
| 5.8 `positive_expansion` | E_N = 6.94·10⁻³, 4.32·10⁻⁴, 2.12·10⁻⁷, 1.19·10⁻¹¹, 2.37·10⁻¹⁵ at N = 2, 3, 10, 50, 200; N⁶E_N = 0.444, 0.315, 0.212, 0.186, 0.152 → ζ(3)²/8 = 0.1806. Positivity holds for every N ≥ 2 because exp of a series with positive coefficients minus 1 + c₁N⁻³ + c₂N⁻⁵ leaves only positive terms. | keep |
| 6.1 ideal polygon | Area (2N − 2)π = 2π(N − 1): 6.283, 12.566, 25.133 at N = 2, 3, 5, equal to −2πχ(ℙ¹ minus N + 1 points). | keep |
| 6.2 width | h₂ = 2, h₃ = 2√3 = 3.464102. | keep |
| 6.3 free presentation | N = 2: u = rtr⁻¹ = [[1,0],[−2,1]], tu = [[−3,2],[−2,1]] ≠ ut = [[1,2],[−2,−3]]; r fixes i and is not a deck element. | keep; see R01 |
| 6.4 index | Area ratios polygon/quadrilateral = 2.000, 3.000, 5.000 at N = 2, 3, 5; r̃_N has projective order N. | keep |
| 6.5 largest invariance group | F₂(iz)² = −0.211186 ≠ F₂(z)² = 0.174363 at z = 0.1, so s ∉ Φ₂ and S(M,N) is r-invariant but not s-invariant. | keep |
| 6.6/6.8 areas | Quadrilateral 2π − 2π/N = π at N = 2 (angles 2π/N, 0, 0, 0); triangle π − π/N = π/2 (angles π/N, 0, 0); s̃² = r̃_N. | keep |
| 6.7 `half_rotation_involution` | N = 2: 1 − F₂(iz)² and 1/(1 − F₂(z)²) are 1.2111859623 at z = 0.1; −1.58939533 + 1.87350926i at z = 0.3 + 0.2i; −89.0060 − 79.1839i at z = −0.5 + 0.1i. Phase-independent: F(z) = G(e^{iθ}z) satisfies the identity whenever G does. | keep |
| 7.1 `discCounting` | 1/z: N_D = log r < 0 (Lean's log(r·‖0‖⁻¹) = log 0 = 0 is restored by the centre term); constants and 0 give 0; a pole on |z| = r has weight log(r/r) = 0 (closed-ball divisor as in the pinned Jensen formula). | keep |
| 7.2 `discCharacteristic` | 1/z at r = 1/2: m = log 2, N_D = −log 2, T = 0; 1/(4z): m = 0, N_D = −log 2, T = −log 2 (negative, allowed); constants c: log⁺|c|. | keep |
| 7.3/7.4 | 1/(z − 1/4), r = 1/2: N_D = log 2 ≥ 0; pole at 1/2 with r = 1/2: N_D = 0; the representative 2 at 0, 1 elsewhere: order 0, count 0, discontinuous. | keep |
| 7.5/7.6 Jensen, inversion | f = 2z, r = 1/4: mean log|f| = −log 2 = log(1/4) + log 2; 1/(4z), r = 1/2: T(f) − T(1/f) = −log 2 − log 2 = log|1/4|. | keep |
| 7.7 translation | f = 0, a = 2: |m(f − a) − m(f)| = log 2 ≤ log 2 + log 2. | keep |
| 7.8 `local_first_main_translation` | f = 2, a = 1: |log 2 − 0 − 0| = log 2 ≤ 0 + log 2 (sharp); f = 3, a = 2.9: c = 0.1, |log 3 − log 10 + log 10| = 1.0986 ≤ 1.065 + 0.693; f = 1/z, a = 1: T(f) = 0, 1/(f − a) = z/(1 − z) with m(0.9, ·) ≈ 0.26 ≤ log 2; f = 2z, a = 0, r = 1/2: 0 − (−log 2) − log 2 = 0; f = a excluded by `h0`. | keep |
| 7.9 power law | f = 2: T(f³) = 3 log 2; n = 0: 0 = 0. | keep |
| 7.10 monotonicity | h = 2z: m(1/4) = 0 ≤ m(3/4) = log(3/2); h = 2: equality. | keep |
| 8.1 cusp asymptotic | Using the verified zero-balanced series: N·|s_N(1−x)/γ_N − principal|/x = 0.444, 0.589 (N = 2, M = 2, 4), 0.658 (N = 3, M = 2), 0.950 (N = 10, M = 2); for N ≥ 10 with M ≥ 4 the difference is below double precision (x < 10⁻¹⁷) and not a test. Sign −2γ confirmed: +2γ would move the k = 0 term by 4γ = 2.31. | keep; see R01 |
| 8.2 cusp height | x = e^{−MN}/2: Im C(ψ_N(1 − x)) = 47.2, 1048.0, 24457 at (N, M) = (10, 2), (50, 2), (200, 3) versus 2N²M(1 − ε)/π² = 20.3, 506.6, 12158.5 at ε = 1/2; the ratio to 2N²M/π² is 1.17, 1.03, 1.006. | keep |
| 8.3 horoball | g = id, D = 1: E = 1, centre 1/2, tangent 1; diag(2, 1/2): E = 2/5; a = c = 1, D = 2: E = 2/5, tangent −i. | keep |
| 8.4 Shimizu | N = 3: minimum of h₃(|a| + |c|) over all words of length ≤ 6 in r̃₃^{±1}, t̃₃^{±1} is 3.464102 = h₃ (attained at t̃₃), r̃₃ alone gives 4.732; so ≥ 1 with room. | keep |
| 8.5 exceptional set | M > 0: |F(0)^N − 1| = 1 > e^{−MN}, so 0 ∉ S; |F| > e^M + 1 gives |F^N − 1| > e^{MN}, hence |1 − F(sz)^N| < e^{−MN}: z ∈ s⁻¹S = sS (S is r-invariant, s² = r). | keep |
| 8.6 exclusion | h_N ≤ 4N/π gives 4h_N²/D ≤ 64/M; N = 100, r = 1/2, M = 200: 0.32 < 0.5. | keep |
| 8.7 `large_n_max_growth` | N = 2 theta cover: sup_{|z|=r} log|F₂| = 0.424, 2.631, 8.916, 17.293 at r = 0.25, 0.5, 0.75, 0.85 versus N/(1 − r) = 2.67, 4, 8, 13.3; linear growth in 1/(1 − r), constant ≈ 1.3 at N = 2 (the theorem only promises N ≥ N₀). | keep |
| 9.1 kernel mean | r = 1/2, R = 1, w = 1: 1.3333333333 = 1/(1 − 1/4). | keep |
| 9.2/9.3 | g = e^z: mean|cos θ| = 2/π = 2m; H = e on mass 1/e: ∫log⁺H = 1/e = 0 + 1/e, the extremal case of p log(1/p) ≤ 1/e. | keep |
| 9.4 `normalized_log_derivative` | (g, R, r) and lhs ≤ rhs: (e^z, 1, 0.5): 0 ≤ 1.3026; (e^{50z}, 1, 0.5): 3.912 ≤ 5.215; (1 + 0.9z, 1, 0.5): 0.102 ≤ 1.209; (1 + 0.9z, 1, 0.95): 0.239 ≤ 2.870; (e^{20z²}, 1, 0.9): 3.584 ≤ 5.320; (e^{8z}, 2, 0.01): 2.079 ≤ 7.299. Consistency of the constant: the kernel mean gives ∫|g′/g| ≤ 4R m(R,g)/(R² − r²) ≤ 2R m(R,g)/(r(R − r)) because 4r ≤ 2(R + r), so log 2 (not log 4) is right. If m(R,g) = 0 then |g| ≤ 1 on the circle with g(0) = 1 forces g ≡ 1 and lhs = 0. | keep |
| 9.5 small radii | r = 0.1: ρ = 1/4, R = 0.55, R − ρ = 0.30 ≥ 0.225; r = 0.75: ρ = 0.75, R = 0.875, 0.125 ≥ 0.0625; (1 − r)/2 = 0.125 < r would fail r < R. | keep |
| 9.6/9.13 | N = 2, G = F₂(−z): m(r, G′/(1 − G)) = 1.865, 2.519 and m(r, f′/f) = 2.953, 3.594 at r = 0.5, 0.75, versus log(2/(1 − r)) + L₂(r) = 3.574, 5.147 (C = 1 suffices here). | keep |
| 9.7/9.8 `pivotMap` | p₂(0) = 0, p₂(2) = 4/3 = (2/2)(1 + 1/3); N = 5, x = 0.3 + 0.8i: partial fractions and x⁵/(x⁵ − 1) both −0.74150336 + 0.31549224i. | keep |
| 9.9 chain identity | Near 0: (F/(NF′))(f′/f) = (z/N)(−Na^Nz^{N−1}) = −a^Nz^N = p_N(F) + O(z^{2N}). | keep |
| 9.10/9.12 three means | N = 2: m(F²), m(p∘F), m(u∘F) = 0.2839, 0.2839, 0.3804 (r = 0.25); 1.5667, 1.5667, 1.4770 (0.5); 3.0234, 3.0234, 2.9853 (0.75); 4.1401, 4.1357, 4.1366 (0.85): pairwise differences ≤ 0.0965 < log 4. | keep |
| 9.11/9.17 fixed level, absorption | Tsuji at p = 3 gives m(r, F₂) ≈ log(1/(1 − r)) + O(1), so m(r, F₂²)/log(2/(1 − r)) = 1.13, 1.45, 1.60 at r = 0.5, 0.75, 0.85, tending to N/(N − 1) = 2: the absorption factor is needed and bounded by 2 for all N ≥ 2. | keep |
| 9.14/9.15 | Simple zero: F′/F and 1/F both have a simple pole; F/F′ = z + O(z^{N+1}) at 0, centre count 0; c(F′/F, 0) = 1 so the inversion identity has no centre term; N(1/F) ≤ T(F) − log γ_N ≤ T(F) needs log γ_N > 0 (§5.7). | keep |
| 9.16 upper bound | N = 2, r = 1/2: T(p∘F) − T(F) = 0.783 versus log 4 + L = 1.386 + L. | keep |
| 9.18/9.19 `uniform_mean_growth` | N₀ = 4, C = 5, C₂ = 7, C₃ = 3: C* = 7; the N = 2 samples above need C ≥ 1.6 at r = 0.85 and tend to 2; the statement's C is existential and absolute. A source rotation leaves each mean unchanged. | keep |

**Not statable claims re-examined.** The module docstring's claim for the marked polygon, presentation, connection formula and cusp asymptotic was tested rather than accepted: see R01.

## Not verifiable

- **Hem88**, Theorem 3.1 and Lemma 3.3, pp.97–115: settled as waived; cited by locator only. CDT-journal lines 2491–2512 attribute the accessory-parameter form and the three constraints to it, which is what §§2.5–2.6 restate.
- **KR16**, §1: settled as uncertified (paywalled); cited by locator only.
- **Tsu52**, Theorem 11 (printed p.25): I did not reopen the scan this round; the previous review's reading (coefficient 1/(p − 2) and O(1), no explicit all-radius constant) is consistent with what CDT-journal line 3004 quotes, and §9.11 explicitly owns the effective all-radius strengthening.
- The uniform constants and thresholds (C(M₀), N₀, A, the absolute C of §9.19) are proof targets; the sampled values above are falsification checks, not certificates.

## Source issues

- **Misprint** in CDT-journal at Lemma 5.1.2, (5.1.3), printed p.668 (line 2357): the source says the displayed matrix r̃_N induces multiplication by ζ_N; under the standard left action it induces ζ_N⁻¹ (N = 3 at τ = 2i gives ζ₃⁻¹/3); affects a stated result.
- **Gap** in CDT-journal at Lemma 5.1.20, (5.1.21), printed p.672 (line 2654): the source says only that a is not a nonpositive integer; it should also exclude nonpositive integers 2a (the Γ(2a) factor) and x = 0; affects a stated result.
- **Misprint** in CDT-journal at Lemma 5.2.9, (5.2.10), printed p.676 (line 2873): the source says +2γ in both logarithmic constants; it should say −2γ, since ψ(1) = −γ; affects a stated result.
- **Gap** in CDT-journal at proof of Lemma 5.2.18, printed p.678 (lines 2969–2978): the source says the Shimizu estimate for elements of Γ̃_N and applies it to every translate by Φ_N; it should establish it for Φ̃_N (it holds there); affects the proof.
- **Error** in CDT-journal at proof of Lemma 5.2.18, printed p.678 (lines 2980–2981): the source says the large values |F_N| > e^M + 1 lie in S(M,N); they lie in its half-rotated translate sS(M,N), and S is not s-invariant; affects the proof.
- **Misprint** in CDT-journal at proof of Corollary 6.2.11, printed p.684 (line 3418): the source says to apply Lemma 6.1.7 with R = (1 − r)/2; it should say (1 + r)/2, which exceeds r; affects the proof.
- **Misprint** in McMullenRS at §16, printed p.147 (lines 5350–5351): the source says d(0, x) = log((x + 1)/(x − 1)) maps (−1, 1) to (0, ∞); it should say (1 + x)/(1 − x); affects nothing.
- **Gap** in Uniformization at Proposition 9, pp.5–6 (lines 213–219): the source says a not necessarily compact subsurface with smooth boundary has a nonnegative Green function vanishing on the boundary; for K = ℂ with empty boundary no such function exists (the mean of G + log|z| over |z| = R would exceed log R for every R); it should assume nonempty boundary or a Greenian K; affects a stated result.
