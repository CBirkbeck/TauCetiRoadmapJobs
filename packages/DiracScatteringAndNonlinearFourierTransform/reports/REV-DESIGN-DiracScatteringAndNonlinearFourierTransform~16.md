<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16338#issuecomment-6904027687 -->
Review (claude) of 55c1974

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §5.4: the cross term is not controlled by the `L²` norms of `ρ₁`, `ρ₂`

   Location: `packages/DiracScatteringAndNonlinearFourierTransform/design/README.md` line 1418–1420: "where the last
   integral tends to `0` because `‖ρ₂‖²_{L²} ≤ π‖q‖²_{L²(T,∞)}` (§5.3 applied to the tail, with `r² ≤ −log(1 − r²)`) and
   `‖ρ₁‖²_{L²} ≤ π‖q‖²`".

   Claim: the two `L²` bounds make `∫ |log|1 + uρ₂ conj ρ₁|| dx → 0`.

   Witness. Where `|ρ₁| = |ρ₂| = 0.999` and `uρ₂ conj ρ₁ = −0.998001`, the integrand is `6.21511` while
   `|ρ₁ρ₂| < 1`; a set of measure `δ` adds at most `δ` to each `L²` norm and `6.2δ` (unboundedly more as the moduli
   tend to `1`) to the integral. The statement is true: the route has the stronger logarithmic bounds.

   Repair. Replace the quoted clause by: "where the last integral tends to `0`: with `L(r) = −log(1 − r²)`,
   `|log|1 + uρ₂ conj ρ₁|| ≤ −log(1 − |ρ₁||ρ₂|) ≤ (L(|ρ₁|) L(|ρ₂|))^{1/2}` (Cauchy–Schwarz on the series
   `Σ (ab)ⁿ/n`), so by Cauchy–Schwarz in `x` the integral is at most `(∫ L(|ρ₁|) · ∫ L(|ρ₂|))^{1/2} ≤
   π‖q‖_{L²(0,T)} ‖q‖_{L²(T,∞)}`, by §4.4 for `ρ₁` and by §5.3 applied to the tail for `ρ₂`." Tested on the instance:
   `a = b = 0.999` gives `−log(1 − ab) = 6.21511 = (L(a)L(b))^{1/2}` (equality); `a = 0.999`, `b = 0.3` gives
   `0.35625 ≤ 0.76561`; `a = 0.1`, `b = 0.9` gives `0.09431 ≤ 0.12919`. If target 5.4 of `design/plan.json` carries
   the route sentence, mirror it there; no hypothesis, prerequisite or *Needs:* line changes (§4.4 is reached through
   §5.3; add `§4.4` to the *Needs:* line of §5.4 for exactness).

2. **F02** (P3) §7.2: the second locator states a weaker constant

   Location: `packages/DiracScatteringAndNonlinearFourierTransform/design/README.md` line 1849–1851: "`0 < ε < 1` …
   zero in the disc `{ζ : |ζ − x| < 3|y − x|/ε}` (poltoratski2024 Lemma 1 line 332–360; mauth2022 Lemma 29 line 1624)".

   Claim: both locators support the statement as written.

   Witness. poltoratski2024 line 332–334 has `1 > ε > 0` and radius `3|y − x|/ε`, as stated. mauth2022 line 1624–1627
   has `0 < ε < ε₀` for a small fixed `ε₀` and radius `4|y − x|/ε`.

   Repair. Write "(poltoratski2024 Lemma 1 line 332–360; mauth2022 Lemma 29 line 1624–1627 with radius `4|y − x|/ε`
   for small `ε`)". The README's statement stands: `1/(√(1+ε) − 1) = (√(1+ε) + 1)/ε < 2.4143/ε < 3/ε` for `0 < ε < 1`.

The one finding of round 15 is repaired, and the repaired passage holds. The README was read in full this round
(2506 lines) and every section recomputed, including those the earlier table did not cover (§1.2–§1.5, §1.7, §2.2,
§2.4, §2.5, §2.7, §4.1, §4.5, §5.2–§5.4, §5.6, §6.1, §6.2, §7.1, §7.3, §8.1–§8.3, §8.5, §8.6, §8.9). No statement,
hypothesis, id or supplier is in question. Two findings (P3) remain, each with a repair, so the verdict asks for changes: one step of the
route of §5.4 gives a reason that does not suffice (the statement is true and the repair uses only inputs the route
already has), and one secondary locator of §7.2 states a weaker constant. The dependency check shows no UPWARD or
CYCLE line. Declared supplier gaps: none. Elaboration: not available (this lane does not elaborate); the design
stage has no `Suggested.lean`, so the one-tactic probe and the `#check` comparison do not apply. Maintainer notes for
this round: none.

## Verified sound

**Repair of round 15, finding by finding.**

- **F01 (P3), §9.3, the null set must not depend on `C` — repaired.** Line 2314–2319: "off the union of these null
  sets over `m = 1, 2, …`, `ℓₙ(s)/2ⁿ → 0`. That null set depends on `C` … The length `ℓₙ(s)` is nondecreasing in
  `C` … Hence the statement for `C = 1, 2, 3, …`, off the union of the corresponding null sets, gives it for every
  `C > 0`, by comparison with `C′ = ⌈C⌉`." Rederived: `Q(s, C/t) ⊆ Q(s, C′/t)` for `C ≤ C′` (Conventions, line 189);
  `K` is fixed by §8.8 at `s` and `T₁(s, K)`, `T̃₁(s, K)` (§8.1) do not involve `C`; so `ℓₙ^C ≤ ℓₙ^{⌈C⌉}`, and a
  countable union of null sets is null. The added Check (line 2337–2341) was recomputed: the point
  `s + 2.7/t − 2i/t` has `2.7 ≤ 3`, `2 ≤ 3`, `2.7 > 2.5`, and height `−2/t < −1/t`, so `ℓₙ = 2ⁿ` at `C = 3` and `0` at
  `C = 2.5` and `C = 2`; it concerns one `n` and does not contradict `ℓₙ/2ⁿ → 0`. `design/plan.json` target 9.3
  carries the same statement and the new test.
- **The repaired pattern elsewhere.** Every "for almost every `s` and every `C`/`D`" statement was read (§8.2–§8.7,
  §9.5, §9.6): in §8.2–§8.5 the admissible `s` are fixed by conditions without `C` (`w(s) > 0`, a Lebesgue point,
  a nontangential limit); §8.6 and §8.7(3) rest on §8.5 at `s`; §9.5–§9.6 quantify `D`, `C` at a fixed
  resonance-free point off a null set `N_f`, `N′_f` built without them. No other instance.

**Principles.** No route-specific shortcut (Layers 1–2 at full generality: Banach-space values, Poisson-finite
measures; Layers 1–6 for complex potentials); nothing re-planned (three suppliers cited by section, resolved below);
one direction of supply (gate below); own words; no algorithm; no `Suggested.lean`, hence no sorry'd data and no
`set_option`.

**Gate** (run this round):

```
candidate: DiracScatteringAndNonlinearFourierTransform is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
depcheck: 234 roadmaps, 2230 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

**Supplier citations resolved this round.** AnalyticNumberTheoryPartI §0.23 (main, `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md`
line 644, "### 0.23 Finite-order Hadamard factorization"; merge order line 50). OperatorTheory/UnboundedOperators
§4.8 (main, `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md` line 836, "(UO-D07)"; line 861–863 has
`Ju′+V(r)u`, `J=[[0,−1],[1,0]]`, locally integrable Hermitian `V`, and asks for the analogous endpoint
classification by the first-order integral system). AutomorphicSpectralTheory §0.5 (open head, a new roadmap
folder, line 182–184: unique triple, `a = Re F(i)`, `b ≥ 0`, `dν = (1+t²)dρ`; merge order line 98). Non-supplier
mentions: OperatorTheory/ToeplitzOperators Layers 2–5 (main, headings at line 273, 400, 567, 713),
StochasticCalculus 6.5 (main, line 2246), PDE §6.2 (main, line 2252). None is on the never-cite list.
`scratch/citations.md`: nothing unresolved. All 55 `*Needs:*` lines were read: each names earlier sections, pinned
declarations or one of the three suppliers; a script over `design/plan.json` finds no prerequisite pointing forward.

**Pinned declarations.** All 114 backticked library names of the README were searched at the pins by script and
found; those with a common last component were opened at the cited file and line: Mathlib
`AbsolutelyContinuousOnInterval` (`MeasureTheory/Function/AbsolutelyContinuous.lean` 155; `.add` 206,
`.continuousOn` 261, `.smul` 273, `.boundedVariationOn` 358), `LipschitzWith.comp_absolutelyContinuousOnInterval`
(344), `AddCircle.homeomorphCircle'` (`Analysis/SpecialFunctions/Complex/Circle.lean` 421), `EuclideanSpace.equiv`
(`Analysis/InnerProductSpace/PiL2.lean` 296), `HasFDerivAt.comp_hasDerivAt` (`Analysis/Calculus/Deriv/Comp.lean`
375), `HasFDerivAt.restrictScalars` (54), `LinearIsometryEquiv.measurePreserving`
(`MeasureTheory/Measure/Haar/InnerProductSpace.lean` 151), `Measure.singularPart` and `Measure.rnDeriv`
(`MeasureTheory/Measure/Decomposition/Lebesgue.lean` 73, 80), `DifferentiableOn.analyticAt`
(`Analysis/Complex/CauchyIntegral.lean` 723), `hasFDerivAt_integral_of_dominated_of_fderiv_le`
(`Analysis/Calculus/ParametricIntegral.lean` 222), `VitaliFamily.ae_tendsto_rnDeriv` (658),
`WeakDual.isCompact_closedBall` (270, with `[ProperSpace 𝕜]`), `ODE_solution_unique_of_mem_Ioo` (279), the Borel
structure of `Circle` (`MeasureTheory/Group/Circle.lean` 32, 34), the scope `Matrix.Norms.L2Operator`
(`Analysis/CStarAlgebra/Matrix.lean` 183), `InformationTheory.klDiv` (56; body
`if μ ≪ ν ∧ Integrable (llr μ ν) μ then ENNReal.ofReal (∫ llr + ν.real univ − μ.real univ) else ∞`, as §6.7 reads
it), `MeasureTheory.measure_limsup_atTop_eq_zero` (62; one hypothesis `∑' i, μ (s i) ≠ ∞`, no measurability); Tau
Ceti `MeasureTheory.AEStronglyMeasurable.apply_of_forall_of_continuous`
(`MeasureTheory/Function/StronglyMeasurable/Caratheodory.lean` 41), `TauCeti.boundaryCayley`
(`Analysis/Complex/UpperHalfPlane/Cayley.lean` 316), `TauCeti.bijOn_sub_I_div_add_I_upperHalfPlaneSet` (171),
`TauCeti.rouche_exists_eq_zero_iff` (359), `Matrix.hasFDerivAt_det` (110, hypothesis `IsUnit A.det`),
`Matrix.det_exp` (75), `TauCeti.HardySpace` (43). The other names sit at the lines the README gives.

**Sources, the seeded sample** (each locator read at its line; the author flags none as unverified).

- §1.1: coddingtonlevinson1955 only (waived); recomputed (table).
- §1.2: romanov2014 line 212–224 (fundamental solution, `det ≡ 1`, real entire with values in `C[0, x]`, chain
  rule): as cited, for the canonical-system case; coddingtonlevinson1955 waived.
- §1.7: coddingtonlevinson1955 only (waived); the local form and its Checks were recomputed (table).
- §2.1: poltoratski2024 line 250–254 (Poisson measure, Poisson-finite), 610–614 (Poisson extension); mauth2022
  line 378–392 (kernel, Poisson-finite, Lemma 3): as cited.
- §2.6: mauth2022 line 337–358 (definition, `1 < p < ∞`), Lemma 1 line 359–369, Lemma 2 line 370–377 (constant
  `(2/(πy))^{1/p}`, weaker, as the README says), Lemma 9 line 469–471 (one direction): as cited.
- §3.2: poltoratski2024 line 186–190 (definitions), 192–195 (free case), (2.2) line 205–208, (2.5) line 293,
  273–275 (bound on `ℝ`), (2.6)–(2.7) line 295–306; mauth2022 line 182–183, Corollary 2 line 596, Lemma 15 line
  612, Lemma 17 line 646: as cited.
- §5.3, §5.5: poltoratski2024 line 518–548 (existence of the limit, convergence in `Π`-measure, (5.5)), 569–577
  (`a` outer with modulus `(1 − |f⌃|²)^{−1/2}`, `b = a f⌃`); mauth2022 Lemma 19 line 711: as cited; the
  concatenation law and the bound `4π` are the README's, recomputed (table).
- §6.4: romanov2014 Theorem 15 line 2217–2219, its proof to line 2261, Lemma 23 line 2370: as cited.
- §7.2: poltoratski2024 Lemma 1 line 332–360: as cited; mauth2022 Lemma 29 line 1624: R02.
- §7.3: poltoratski2024 §4 line 361–468: `θ_H = H#/H` (369–371), (4.1) line 403, initial values `1` and `−1`
  (409–410), (4.2)–(4.3) line 425–439, resonances as conjugates of zeros (435–436): as cited.
- §8.4: poltoratski2024 Lemma 4 (6.6) line 756–792 (the function `e^{itz}GΔ`, two points on either side, the
  rhombus and the reflection); mauth2022 Lemma 22 line 1129–1135: as cited.
- §8.6: poltoratski2024 (7.4) line 849, Lemma 6 line 850–862, Remark 3 line 863–865, `A = iC = β` line 869–870,
  `2|β|²w(s) = (1 + o(1)) sinh 2ty` line 900, Corollary 2 line 911–917; mauth2022 Lemma 23 line 1258, Lemma 32 line
  1765: as cited.
- §9.3: poltoratski2024 Lemma 9 line 1350–1377 (no restriction to `T₁`, as the README says), Lemma 8 with
  `1 < ty < 2C` at line 1127–1128; mauth2022 Corollary 7 line 1525: as cited.
- §9.4: poltoratski2024 line 97–101, 1173–1176; mauth2022 line 1893–1894: as cited.

**Adversarial table** (values computed this round, by hand or in plain Python; the rows of round 15 with computed
values are relied on for §2.3, §2.8, §3.1, §3.3, §4.2–§4.4, §6.5, §6.7, §8.7, §8.8, §9.2).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 | `α = −1`, `β = 1`, `u = −e^t`; `β = −1` | `−1 + ∫₀ᵗ(−e^s) = −e^t` (equality, negative `α`); `½ > e^{−1}` | holds; `β ≥ 0` needed | none |
| §1.2 | `P = t^{−1/2}`; `P = 1/t`; indicator of `(2, 3)` | `y₀e^{2√t}`, `∫₀¹ t^{−1/2} = 2`; `Y = ct` all solve; two solutions agree on `[0, 1]`, differ at `5/2` | holds | none |
| §1.3, §1.4 | `A`, `B` nilpotent; `A = [[1,1],[0,1]]` | `e^B e^A = [[1,1],[1,2]]`, `det = 1 = e^0`; `det e^{tA} = e^{2t}` | holds | none |
| §1.5 | `p = 0`, `p′ = 1` | `e − 1 = 1.718 ≤ e = 2.718` | holds | none |
| §1.7 | `x²` from `1`, `r = 1`, `τ = 0.1`; boundary case `r = 1`, `τ = 2` | `0.1e^{0.4} = 0.149 ≤ 1`, `1/(0.9) = 1.11`; `(∫m)e⁰ = 1 = r`, second solution `1 + (t−1)²` leaves `B` | holds; strictness needed | none |
| §2.1 | `C(z)` bound; `z = 2i`, `x = 1`; `h = 1/(1+x²)` | `(1+x²)/((x−a)²+y²) ≤ 2(1+a²)max(1, y⁻²)`; `w = 1/3`, `ζ = −i`, `(8/9)/(10/9)/(2π) = 2/(5π)`; `Re(i/(z+i)) = (y+1)/|z+i|²` | holds | none |
| §2.2 | `u = P[δ₀]`; `u = Im z` | `πy·y/(πy²) = 1 = ν(ℝ)`; `i·(−i) = 1 = F′` | holds | none |
| §2.3 | `1_{[0,1]}` at `2 + i` | `(arctan 2 − π/4)/π = 0.10242 ≤ 3/4`; `((1+√5)/2)² = 2.61803` | holds | none |
| §2.6 | `1/(z+i)`; `𝓕(1/(x+i))` | `‖F‖² = sup π/(y+1) = π = 2π·½`; `¼ = π/(4π)`; residue `−2πi e^{−2πw}`, `w > 0` | holds | none |
| §2.7 | `φ = 1_{[−t,t]}`; `λ = iy` | `F(0) = 2t = ∫ 2sin²(tx)/(πx²)`; `sin(2ity)/(2πiy) = sinh(2ty)/(2πy)` | holds | none |
| §3.2 | derivative of `E`; phase; kernel identity | `E′ = −izE + (f+ig)(A+iC)`; `Re`, `Im` of `−ix + qe^{−2iφ}`; `A(z)conj C(w) − C(z)conj A(w) = (conj w − z)∫Θ*Θ` | holds | none |
| §4.1 | concatenation; modulation; dilation; `q = c` | `ΛG₂Λ⁻¹G₁`, row 2: `e^{2izs}b₂a₁# + a₂b₁`, `e^{2izs}b₂b₁# + a₂a₁`; `e^{2izt}qe^{2iξt}`; `λW(λt, z/λ)`; `N² = (|c|² − z²)1`, `a = e^{ixT}(cos κT − ix sin κT/κ)` | holds | none |
| Layer 4 example (two kicks) | real `c₁`, `c₂` | `|a|² − |b|² = cosh²c₂ − |e^{2izs}|² sinh²c₂` (cross terms cancel) | holds | none |
| §4.5 | `(a, β)` system | `∂ₜ(|a|² − |β|²) = 4 Im z|β|²`; `r′ = 2izr + conj q − qr²`; `ρ′ = qe^{2izt}/a²`; `tanh F` | holds | none |
| §5.1 | Young; tail | `2·(1/(2y))‖q‖ = ‖q‖/y`; `e^{−2yt}/(2√y)`; `y|∫q(r − r_lin)| ≤ ‖q‖⁴/(2y) → 0` | holds | none |
| §5.3 | `ρ₁ = ρ₂ = ½`, `u = 1`; law on `ℝ` | `4/5`, both sides `9/25`; `(uρ₂ + ρ₁)/(1 + uρ₂ conj ρ₁)` from `a₁# = conj a₁` | holds | none |
| §5.4 statement | scaling; `q = 0.3e^{2iξs}1_{[0,400]}` | `λπ‖q‖²`; `∫h = 56.5475` against `(π/2)·36 = 56.5487`; `I = 12.5417`, `21.7049`; `I/π = 3.99216` | holds | none |
| §5.4 route | `|ρ₁| = |ρ₂| = 0.999`, product `−0.998001`; `(0.999, 0.3)`; `(0.1, 0.9)` | `6.21511` against `|ρ₁ρ₂| < 1`; `−log(1−ab) ≤ √(L(a)L(b))`: `6.21511 = 6.21511`, `0.35625 ≤ 0.76561`, `0.09431 ≤ 0.12919` | reason insufficient; statement true | R01 |
| §5.5 | bound; `1/a₂` | `|ρ₂|(1−|ρ₁|²)/(1−|ρ₁|) ≤ 2|ρ₂|`, so `4π`; `|1−g|² ≤ 2 − 2Re g`, `∫Re(1−g)dΠ = π Re(1−g(i))` | holds | none |
| §5.6 | `L = 0.4006` | `sinh L − L + L(cosh L − 1) = 0.04338`; `w = −x/π` | holds | none |
| §6.1 | `E = z + i` | numerator `2i(conj w − z)`, `K = 1/π`, `‖1/π‖² = 1/π` | holds | none |
| §6.2 | lower bound | `|a| − |b| ≥ 1/(|a| + |b|) ≥ e^{−L} ≥ 1/(2cosh L)` | holds | none |
| §6.3 | derivative of the weight | `−2Re(q conj E/(E|E|²)) = −2Re(q/E²)`; `|F|² = FF#` on `ℝ` | holds | none |
| §6.4 | disc; limit point; `f ≡ 1` | `h(0) = −Im w`; `1/(2y∫cosh 2sy) = 1/sinh 2ty`; `1 ≤ |Θ||Φ|` at `z = 0`; `z/(1 − iκ) = (1 + iκ)/z`, `m(i) = (√2 − 1)i` | holds | none |
| §6.6 | uniqueness | `e^{iax}k_ε ∈ PW_{ε+|a|}`; `(1 + x²)|F|²` extends by `0` at `1` | holds | none |
| §6.8 | truncation bound | `−2π log 2 − 2∫log|a|dΠ ≥ −2π log 2 − π‖q‖²` since `dΠ ≤ dx`, `log|a| ≥ 0` | holds | none |
| §7.1 | `E = z + i`; free | `ψ′ = 1/(1+x²)`, `|θ′| = 2/(1+x²)`; `ψ = tx`, `c = 2t` | holds | none |
| §7.2 | `b_{10i}`, `ε = ½`; Apollonius | `0.2`, `0.16`, `0.1`; radius `60`; `(√(1+ε) + 1)/ε < 2.4143/ε` | holds | R02 (locator) |
| §7.3 | Riccati; motion; `θ̃(0)` | `(E#′E − E#E′)/E² = 2izθ + f(1 − θ²)`; `ζ′ = −f/∂_zθ`; `i/(−i) = −1` | holds | none |
| §8.1 | `γ` | `2(sin²a + sinh²p)/sinh 2p ∈ [tanh p, coth p]`; `γ(1) = 0.7426` | holds | none |
| §8.3 | wrong normalisation | `S(1/w − 2/√w + 1) = S(1/√w − 1)²`; right one: `S/w − 2S/w + S/w = 0` | holds | none |
| §8.6 | zero `z₀`; `ty → 0` | `D(·, z₀) = iβE`; `D(conj z₀, z₀) = 2i|β|²`; `|β|² = πyK_t(z₀, z₀) = (1 + o(1)) sinh 2p/(2w)` by §8.2, a relative bound, so the error is `ηγ√w = o(γ)` also for small `p` | holds | none |
| §8.9 | determinant; heights | `i|κ|² sinh 2ty′`; `2 sinh 3.04/sinh 3 = 2.08202`, `2 sinh 3.2/sinh 3 = 2.44481`; `|cos| ≤ cosh 5C` | holds | none |
| §9.1 | `t₁ = 0`; `t₁ = t₂` | `(E + iẼ)/2`; `(EẼ# − ẼE#)/(2i) = 1` | holds | none |
| §9.3 (repair) | `C = 2.5` against `3`; `C = 0.4` | `ℓₙ^{2.5} ≤ ℓₙ^{3}`; `⌈0.4⌉ = 1`; Check: `2ⁿ`, `0`, `0` | holds | none |
| §9.4 | `Ω`-conjugation; `f ≡ 1` | `ΩMΩ⁻¹ = [[D, −C],[−B, A]]`, `ΩQΩ⁻¹ = −Q`, `E_{−f} = iẼ_f`, `m_{−f} = −1/m_f`; zero of `Ẽ` near `−2ie^{−10} = −9.0800·10⁻⁵ i`; `|E(10, ½)| = 6434.48`; `d₁₂ = 0.0027860`, `d₂₃ = 0.0028445` | holds | none |
| §9.5, §9.6 (headline) | (2.2) on `ℝ`; free | `(conj β − β)/√(ww̃) = 2i`; `(1/w + 1/w̃ + 2)/4`; `α = i`, `β = −i` give `E = e^{−itz}`, `Ẽ = −ie^{−itz}` | holds | none |

**Duplication audit.** `roadmaps grep` over main and the open heads, by object, this round: "Hermite–Biehler",
"Paley–Wiener space", "non-linear Fourier", "Poisson-finite", "meromorphic inner", "Szegő condition", "Fatou's
theorem": no match. "de Branges": only the de Branges–Wilson integral (SpecialFunctionsGamma §6.4), another object.
"Weyl function": Weyl functional equations (AutomorphicSpectralTheory, FunctionFieldArithmetic). "Carathéodory":
the conformal boundary theorem (PlanarTopology), another object. "Liouville's formula": IncompressibleFlows (line
259), the Jacobian of a smooth flow, not cited. "Grönwall": StochasticCalculus (main, line 2958–2960) proves inside
its SDE route a constant-kernel inequality with a variable forcing term, `f ≤ g + c∫f`, almost everywhere; §1.1 has
an integrable kernel and a constant `α`, and neither contains the other; PDE and RicciFlow use Mathlib's.
"Hardy space": the disc space (OperatorTheory/ToeplitzOperators, which the scope paragraph names) and harmonic
Hardy spaces on balls (StochasticCalculus, named). BochnerSpaces (open) plans measurability, Bochner spaces, the
Pettis integral and the Radon–Nikodým property; its §5.1 Young inequality is not consumed here (this roadmap uses
the pinned Tau Ceti one), and it has no absolutely continuous curves, no Carathéodory differential equation and no
propagator. At the pins: Tau Ceti `Analysis/ODE` has the essentially bounded Carathéodory theorem, the
constant-kernel Grönwall inequality and the Dyson series of a continuous path, which the README cites and records
as Checks; `TauCeti.HardySpace` is the disc space. `scratch/overlaps.md`: no other pull request changes this
roadmap, no cited id is dropped or defined only by an open revision, no second copy. The board packages index has
no related package. This roadmap owns the integrable-coefficient linear theory, the half-plane Hardy and
Paley–Wiener theory and the Dirac scattering objects because no roadmap on main or open states them. Ownership
against open pull requests was checked through `roadmaps grep` and `roadmaps show` at the indexed heads.

Overlap check: read PDE, OptimalTransport, StochasticCalculus (main), MathematicalStatisticsAsymptotic, AutomorphicSpectralTheory, RelativisticQuantumFieldTheory, BochnerSpaces (open) and OperatorTheory/UnboundedOperators (main); Weyl's alternative for `Ju′ + Vu`: owner OperatorTheory/UnboundedOperators §4.8, cited; the subtracted-kernel Herglotz representation: owner AutomorphicSpectralTheory §0.5, cited; nothing else shared.

**Shape.** 55 numbered sections, 55 `**Checks.**` blocks, 55 `*Needs:*` lines, nine `### Examples`, nine
`### Dependencies`. `design/plan.json`: nine layers, 55 targets, each with at least three tests, `gaps: []`, three
suppliers; every target and test statement occurs in the README (script, whitespace normalised). Layers are named
by their mathematics and no sentence says the roadmap follows a source. `grep` over the README: no LaTeX delimiter,
pull-request number, round label, machine path, HTML anchor, "deferred", "optional", "removed"; "lemma" occurs
only in prose names of results. `sources.toml`: 13 entries; every work in References has one.

**Headline theorems for the package stage:** pointwise convergence at resonance-free points (§9.6) with §9.5; the
non-linear Plancherel identities (§4.4, §5.4); the Szegő condition (§6.8); the isometric embedding and uniqueness
of the spectral measure (§6.6); the linear Carathéodory theorem with holomorphic dependence (§1.2, §1.6); the
outer-multiplier theorem (§2.8).

**Copyright, licences and scope.** Wording: 14 passages set beside the sources at the locators of the sample
(§1.2, §2.1 twice, §2.6, §3.2, §5.3, §6.4, §7.2, §7.3, §8.4, §8.6, §9.3, §9.4 twice). No run of more than six words
is shared; what coincides is formulas, the definition of a Poisson-finite measure and the statement of the
zero-localisation lemma, which can be written one way. Arrangement: poltoratski2024 §1–§9 (contents at line
102–125) against Layers 1–9: Layers 1–2 ↔ none; Layer 3 ↔ §1 and part of §2; Layers 4–5 ↔ §5, placed before Layer
6 ↔ the rest of §2; Layer 7 ↔ §3–§4; Layer 8 ↔ §6–§8; Layer 9 ↔ part of §9. Not one to one, and the order of Layers
7–9 is forced (the Dependencies lines of Layer 8 name Layer 7, those of Layer 9 name Layer 8). Reuse: no table,
figure or list is taken over.

Source independence: 14 passages compared with 3 sources, none shared; largest share poltoratski2024, 57 of 151 citations in the layers; contents compared with poltoratski2024: independent.

## Not verifiable

- garnett2007 (paywalled, `uncertified`) and coddingtonlevinson1955, debranges1968, remling2018, krein1955
  (waived): cited by locator only. §1.1 and §1.7 of the sample have no other locator; both were recomputed.
- poltoratski2024 line 200–202 (the formulas for `A` and `C` through `E`, `E#`) and line 1253–1317: the displays are
  garbled by OCR. The README's forms were recomputed (`E# − E = 2iC`; §9.2's identities in round 15).
- The published version of poltoratski2024 (Ann. of Math. 199): not read; locators are to arXiv version 14.
- AutomorphicSpectralTheory is not among the checkouts listed with files; it was read through `roadmaps show`.
- Elaboration: not available (this lane does not elaborate; no `Suggested.lean` at the design stage).

## Source issues

- **Gap** in poltoratski2024 at Lemma 9, printed p. 35 (line 1350–1359): the source says the bound holds for any zero in the box; it should restrict to zeros below height `−1/t`, as formula (9.2) rests on Lemma 8; affects a stated result.
- **Gap** in poltoratski2024 at Lemma 6, printed p. 24 (line 899–901): the source says the determinant relation fixes the modulus of the constant up to a relative error; it should derive that relative bound from the kernel-norm universality when the height tends to zero; affects the proof.
- **Gap** in mauth2022 at Lemma 9, printed p. 10 (line 469–470): the source says a square-integrable function is an `H²` boundary function if its transform vanishes on the negative half-line; it should state the equivalence; affects nothing.

## For the human reviewers

- **Scope.** The headline §9.6 is conditional on the set `R(f)` (README line 114–118). For compactly supported and for integrable `f` its conclusion is already §5.2; no source read here shows `R(f)` non-null for another `f`.
- **Scope.** README line 119–123 and 2475–2479 state that §9 of arXiv version 14 of poltoratski2024 cannot exclude a resonance. That is this project's computation (§9.4, fourth Check), not a published statement.
- **Scope.** The routes of §8.7(1), §8.8 and §9.3 are this project's arguments; poltoratski2024 line 931–934, 1028–1040, 1350–1377 argue differently.
- **Scope.** OperatorTheory/UnboundedOperators §4.8 (main, README line 861–863) asks for an "analogous" endpoint classification for `Ju′ + Vu` without writing the alternative out; §6.4 here relies on it as spelled out in the contracts.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "55c19742ed0967905fbcfd1371a280eedd4fce20", "job": "REV-DESIGN-DiracScatteringAndNonlinearFourierTransform~16", "model": "fable", "worker": "chris-x29"} -->
