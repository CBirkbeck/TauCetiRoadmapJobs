# Review of HamiltonJacobiAndConservationLaws (pull request #2801 at 03ebab4)

**Verdict:** needs changes

**Summary.** Changes are needed: five findings, all P2. Two statements lack a hypothesis and are false as written (the N-wave rate `t^{−1/2}` for a flux that is only `C²`, and the equivalence of the `C^∞` test class for a function with no semicontinuity), and one equivalence in §5.3 fails when the two one-sided limits agree. The finite-horizon control theory of §4.6 and the comparison principle for the Cauchy problem are also owned by the open roadmap OptimalControlAndHamiltonJacobi, which the text does not name, and `Suggested.lean` leaves out headline theorems that its own docstring calls statable. There are three small corrections and one format note. Evans' book, which carries 37 of the 52 locators, could not be read legally, so its locators and the arrangement test are left to the human reviewers.

## R01 (P2) — The N-wave estimate of §5.5 is false for a flux that is only `C²`

In §5.5 (line 786 sets `f ∈ C²` uniformly convex; the N-wave bullet is at lines 790–793) the bound `∫ |u − N| dx ≤ C t^{−1/2}` is claimed for every such flux. An implementer would be asked to prove a rate that does not hold; the rate needs `f''` Lipschitz near `0` (`f ∈ C³` suffices).

Take `0 < a < 1` and `f(u) = u²/2 + |u|^{2+a}/((1+a)(2+a))`. Then `f''(u) = 1 + |u|^a ≥ 1`, so `f` is `C²` and uniformly convex with `θ = 1`, `σ = f'(0) = 0`, `κ = f''(0) = 1`, and for `v ≥ 0` small `G(v) = v − v^{1+a}/(1+a) + O(v^{1+2a})`, with `G(v) < v` for `v > 0`. With `u₀` the indicator of `[0,1]` (the datum of the second Check of §5.5), `p = 0`, `q = 2`, `N = x/t` on `(0, √(2t))`. For large `t` the solution is `G(x/t)` on `(0, s(t))` and `0` elsewhere, and mass conservation `∫₀^{s} G(x/t) dx = 1` with `G(v) < v` gives `s(t) > √(2t)`. Hence on `(0, √(2t))` one has `N − u = x/t − G(x/t)`, and

`∫ |u − N| dx ≥ t ∫₀^{√(2/t)} (v − G(v)) dv = (2^{(2+a)/2}/((1+a)(2+a))) t^{−a/2} (1 + o(1))`,

which is not `O(t^{−1/2})`. The smallest change: state the N-wave bullet for `f ∈ C³` (or `f''` locally Lipschitz), keep `C²` for the decay bullet (where `C = √(2‖u₀‖₁/θ)` works), and add the flux above as a negative-control Check. The Summary's sentence on the N-wave then needs the same hypothesis.

## R02 (P2) — The `C^∞` test class of §4.1 does not give the same predicate for a function with no semicontinuity

The bullet "Equivalent test classes" of §4.1 (lines 446–448) says that test functions "`C¹` on `V`, `C^∞` on `V`, or merely differentiable at `x₀`" define the same predicate. The Conventions (lines 95–96) put no regularity of `u` into the predicate and the layer assumes only that `F` is continuous, so the bullet is a claim about every `u`, and for the `C^∞` class it fails.

On `V = ℝ`, `Ω = (−1, 1)`, `F ≡ 1`: put `u(0) = 0`, `u(y) = |y|^{3/2}` for irrational `y`, and `u(y) = (2 − 1/q)|y|^{3/2}` for `y = p/q ≠ 0` in lowest terms. The `C¹` function `φ(y) = 2|y|^{3/2}` has `u − φ ≤ 0 = (u − φ)(0)`, so `u` is not a subsolution (`F = 1 > 0`). But no `C^∞` function touches `u` from above anywhere: at `y ≠ 0`, `limsup_{z → y} u(z) = 2|y|^{3/2} > u(y)`, so `u − φ` has no local maximum at `y` for continuous `φ`; at `0` a local maximum of `u − φ` forces `φ(y) − φ(0) ≥ |y|^{3/2}`, impossible for a `C²` function, whose increment is `O(y²)` once `φ'(0) = 0`. With `C^∞` tests `u` is therefore vacuously a subsolution of `1 = 0`. The other three classes (differentiable at `x₀`, strict maxima, `u(x₀) = φ(x₀)`) do agree for every `u`, through the differential form. The smallest change: restrict the `C^∞` clause to upper semicontinuous `u` for subsolutions and lower semicontinuous `u` for supersolutions.

## R03 (P2) — The finite-horizon control problem of §4.6 and the Cauchy comparison principle of §4.3 have a second owner, OptimalControlAndHamiltonJacobi

Scope and ownership (lines 972–974) claims "finite- and infinite-horizon deterministic optimal control with the Hamilton–Jacobi–Bellman equation". The open roadmap OptimalControlAndHamiltonJacobi (pull request #2733, a new folder) states the same objects: trajectories for measurable controls (its 1.2), the value function and the dynamic programming principle (2.1–2.2), the Lipschitz bound (2.3), first-order viscosity sub- and supersolutions on space-time (3.1), the value function as viscosity solution of the Hamilton–Jacobi–Bellman equation (3.4), the comparison principle for bounded continuous sub- and supersolutions under the same two conditions as `(S1)`, `(S2)` (4.1), and uniqueness (4.2); its scope section lists exactly these as owned. The README here and the description do not mention that roadmap, so an implementer would build trajectories, the value function and the comparison theorem twice, in two conventions (terminal cost and `−∂ₜv + H = 0` there, initial cost and `∂ₜv + H = 0` here; local extrema relative to `Ω` there, in `V` here).

That roadmap places outside itself the discounted infinite-horizon problem, discontinuous solutions and Perron's method, semiconcavity, characteristics and the Hopf–Lax formula, so those stay here without conflict. The smallest change: add OptimalControlAndHamiltonJacobi to Scope and ownership with one owner for each shared object. Either cite its Layers 1–4 for trajectories, the dynamic programming principle, the Lipschitz bound and the Hamilton–Jacobi–Bellman theorem (the time reversal `t ↦ T − t` is already noted in §4.6) and keep here the discounted problem and the piecewise-constant bullet; or say in one clause each how the statements kept here differ (the comparison of §4.3 is for semicontinuous functions; the predicates of §4.1 are for a general `F(x, u, Du)`), and which of the two is the supplier.

## R04 (P2) — `Suggested.lean` omits headline theorems that are statable at the pins, and its definition `evolutionEquation` is used by no statement

The module docstring (lines 23–26) says: "Not stated here, although statable at the pins: the characteristic system and the local existence theorem of Layer 2, the comparison principles and Perron's method of §4.3–§4.4, the control problem of §4.6 and the one-dimensional theory of Layer 5." The Summary names among its headline theorems the noncharacteristic local existence theorem, the Crandall–Lions comparison principle and the well-posedness of the Cauchy problem, the uniqueness of the semiconcave weak solution, and the Lax–Oleinik and Oleinik theorems. The acceptance test therefore does not test the roadmap's central results, and `evolutionEquation` (line 145) is a definition kept for no theorem.

The carriers exist in the file: the Cauchy comparison is a statement about `IsViscositySubsolution (evolutionEquation H) (Ioo 0 T ×ˢ univ) ↿u` and the matching supersolution, with `UpperSemicontinuousOn`, `LowerSemicontinuousOn` and the two estimates on `H` as hypotheses; Oleinik's uniqueness needs only an integral-solution predicate of the same shape as `IsEntropySolution`. The smallest change: state at least the comparison principle for the Cauchy problem (which gives `evolutionEquation` its use), uniqueness for it, and the Oleinik uniqueness theorem with the Lax–Oleinik existence statement; a headline that is truly not statable is named in the docstring with the carrier it lacks, and the phrase "although statable" goes.

## R05 (P2) — In §5.3 the inequality `u_l ≥ u_r` is not equivalent to `f'(u_l) ≥ ṡ ≥ f'(u_r)`

The last bullet of §5.3 (lines 761–763) says the entropy condition holds across the curve "exactly when `u_l ≥ u_r`, equivalently `f'(u_l) ≥ ṡ ≥ f'(u_r)`". Where `u_l = u_r` the Rankine–Hugoniot condition puts no constraint on `ṡ`: for Burgers' equation, `u ≡ 0` and the curve `x = t`, `u_l = u_r = 0` and the entropy condition holds, but `f'(0) = 0 ≥ ṡ = 1` fails. The equivalence is between the strict inequalities at a genuine jump. The smallest change: "exactly when `u_l ≥ u_r`; at a point where `u_l ≠ u_r` this is `f'(u_l) > ṡ > f'(u_r)`".

## C01 — The description says the Lean file states what is statable and lists the neighbouring open roadmaps without OptimalControlAndHamiltonJacobi

The description reads "`Suggested.lean` states what is statable against the pinned Mathlib and Tau Ceti", while the file's docstring lists five groups of results as statable and not stated (R04). Its list of open roadmaps "on neighbouring ground" has #2442, #2246 and #2498 and not #2733, the closest one (R03). After the repairs, say which headlines the file states, and name OptimalControlAndHamiltonJacobi with the division of ownership.

## C02 — The pinned subsolution inequality covers only data bounded below

§3.2 (lines 388–389) says of the equation at points of differentiability that "the inequality `≤` is the pinned `TauCeti.hopfLax_add_add_smul_le`". That lemma assumes `BddBelow (range φ)` and `BddBelow (range L)` (`TauCeti/Analysis/PDE/HopfLax.lean`, line 146), and the layer's datum is Lipschitz, for instance `g = −‖x‖` in its own Checks, which is not bounded below. The sentence that opens Layer 3 ("this layer works under that hypothesis", line 351) does not say which hypothesis is meant. Say that the pinned lemma gives `≤` for `g` bounded below and that the Lipschitz case is a target of §3.1.

## C03 — The cubic-flux Check of §6.1 calls a jump of speed `1` stationary

The third Check of §6.1 (line 847) speaks of "a stationary-frame jump between `−1` and `1`, with Rankine–Hugoniot speed `1`". The speed `(1 − (−1))/(1 − (−1)) = 1` is right and both computed slopes (`3/4` at `k = ±1/2`) are right; the jump is stationary only in the frame moving with speed `1`. Write "a jump between `−1` and `1` along `x = t`".

## N01 — Several Checks assume `d ≥ 1` without saying so

For `d = 0` the function `‖x‖` is zero, so `D⁺u(0) = {0}` (first Check of §1.2), `‖x‖` is semiconcave (first Check of §1.3) and `H = ‖p‖` is superlinear (fourth Check of §1.1). One clause, "for `d ≥ 1`", in each.

## Questions for the author

- §4.3 cites Bardi–Capuzzo-Dolcetta, Theorem II.3.5, and Evans, §10.2, Theorem 1, for comparison between a bounded upper semicontinuous subsolution and a bounded lower semicontinuous supersolution. The bullet on bounded domains says that the neighbouring Theorem II.3.1 is "for continuous `u`, `v`". Do the two cited theorems state the semicontinuous form, or the continuous (bounded uniformly continuous) one? The statements themselves I checked by the doubling argument with a penalty at infinity and believe true; neither text could be read.
- §6.2 and §6.4 cite Kružkov 1970, Theorems 1, 4 and 5, for a locally Lipschitz flux. Does Kružkov assume continuously differentiable coefficients? If so, the locator should say that the paper treats the smooth case and that the extension is the flux approximation of §6.4. The paper could not be read (the fetch returned an unrelated file).
- The five sections of Layer 5 (integral solutions and Rankine–Hugoniot; Lax–Oleinik; entropy condition and uniqueness; Riemann problem; long-time behaviour) appear to coincide in order and scope with Evans §3.4.1–§3.4.5, and every locator of the layer is to Evans. Is the order of §5.4 and §5.5, which no *Needs* line forces, and the scope of each section the roadmap's own? Locators into Lax 1957, Oleinik 1957 or Dafermos, Chapter XI, already in the References, would settle part of it. Evans' table of contents could not be read.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 Legendre transform, scaling laws | `H = p⁴/4`; `(λH)*`; uniformly convex `θ` | `L = (3/4)|q|^{4/3}`; `(λH)*(q) = λH*(q/λ)`; midpoint defect `≤ ‖q₁−q₂‖²/(8θ)` | holds | none |
| §1.2 Fréchet differentials; Lean `differentiableAt_iff_…` | `‖x‖`, `x sin(1/x)`, `√|x|`; trivial `V` | `D⁺(x sin(1/x))(0)`: needs `p ≥ 1` and `p ≤ −1`, empty; `p ∈ D⁺ ∩ D⁻` forces equality | holds, any normed space | N01 |
| §1.3 semiconcavity; Lean `isSemiconcaveOn_infDist_sq` | `infDist² − ‖x‖² = inf_k (‖k‖² − 2⟪x,k⟫)` | infimum of affine functions, concave; constant `2` sharp on `‖x‖²` | holds | N01 |
| §2.2 local existence | Evans' two examples; `F = p₁`, `g = x₁` | `u = (x₁+4x₂)²/16`: `u₁u₂ = (x₁+4x₂)²/16 = u`; `∂₁u = 0` contradicts `u(x₁,0) = x₁` | holds; uniqueness by ODE uniqueness | none |
| §2.4 breaking time | `u₀ = −arctan`; `g = ∓‖x‖²/2` | `inf c' = −1`, `T* = 1`; `u = −‖x‖²/(2(1−t))`, `‖x‖²/(2(1+t))`; blow-up rate `≥ (T*B)⁻¹/(1−t/T*)` | holds | none |
| §3.1 Lean `lipschitzWith_hopfLax`, `hopfLax_hopfLax` | `g = ±‖x‖`, affine `g`; `d = 0` | Huber function; `−‖x‖ − t/2`; `g(x) − tH(a)`; `d = 0`: `g − tH(0)` additive in `t` | holds | none |
| §3.2 Lean `deriv_hopfLax_add_eq_zero`; pinned `≤` | `g = −‖x‖` | pinned lemma needs `BddBelow (range φ)`; `−‖x‖` unbounded below | theorem holds; sentence imprecise | C02 |
| §3.3 uniqueness example | `ũ = min(|x|−t, 0)`, `H = p²` | `−1 + 1 = 0` a.e.; `D⁻ũ(t,0) ∋ (−1, 0)`, `−1 + 0 < 0` | holds | none |
| §4.1 differential form; Lean iff | arbitrary `u`, `F`; non-open `Ω` | `C¹` touching function from `ρ`-majorant in a Euclidean norm; no continuity used | holds | none |
| §4.1 equivalent test classes | `u = h(y)|y|^{3/2}`, `F ≡ 1` | `C¹` class: fails at `0`; `C^∞` class: no contact point | false for `C^∞` | R02 |
| §4.2 stability Checks | `u^ε = 1−|x|−ε(e^{−|x|/ε}−e^{−1/ε})` | `−εu'' = e^{−x/ε}`, `|u'| = 1 − e^{−x/ε}`, sum `− 1 = 0`; `u''(0±) = −1/ε` | holds | none |
| §4.3 comparison, bounded domain | `λr + H(x,p)` against (3.13), (3.14) | `H(y,α(x−y)) − H(x,α(x−y)) ≤ ω₁(‖x−y‖ + α‖x−y‖²)`; `1 − e^{|x|−1}` solves `u+|u'|−1=0` | holds; CIL Theorem 3.3, p. 18 | none |
| §4.3 Cauchy comparison | usc `u`, lsc `v`; free end `t = T` | terminal-time lemma handles `t = T`; data end has `u(0) ≤ v(0)` | holds; second owner | R03 |
| §4.4 Perron | `W_*(x₀) = (w₊)_*(x₀)` case | then `(w₊)_* − φ` has a minimum at `x₀`, contradiction; bump stays below `w₊` | holds; CIL Theorem 4.1, Lemmas 4.2, 4.4 | none |
| §4.5 Cauchy problem, Hopf formula | `H = −‖p‖²/2`, `g = ‖x‖` | `sup_{‖p‖≤1} ⟪p,x⟫ + t‖p‖²/2 = ‖x‖ + t/2` | holds | none |
| §4.6 control | `ℓ = min(|x|,1)`, `λ = 1` | `∫₀ˣ e^{−s}(x−s) ds = x − 1 + e^{−x}`; `w + |w'| − ℓ = 0` | holds; second owner | R03 |
| §4.7 eikonal; Lean `isViscositySolution_infDist_compl` | ball, square, `E ∖ {0}`; `d = 0` | super: `Dφ·e ≤ −1` along the segment to a nearest point; `d = 0` forces `Ω = ∅` | holds | none |
| §5.1 Rankine–Hugoniot Checks | Burgers, Evans' two data | shock speed `(1/2 − 0)/(1 − 0) = 1/2`; fan `x/t` | holds | none |
| §5.2 one-sided inequality | `G` is `1/θ`-Lipschitz, `y(t,·)` nondecreasing | `u(x+z) − u(x) ≤ z/(θt)` | holds | none |
| §5.3 Lax condition | `u ≡ 0`, curve `x = t` | `u_l = u_r`, `f'(0) = 0 < ṡ = 1` | equivalence fails | R05 |
| §5.4 Riemann problem | Burgers `(1,0)`, `(0,1)` | shock `x = t/2`; fan `x/t` | holds | none |
| §5.5 decay | one-sided bound and mass | `a²θt/2 ≤ ‖u₀‖₁`, so `|u| ≤ √(2‖u₀‖₁/(θt))` | holds | none |
| §5.5 N-wave | `f'' = 1 + |u|^a`, indicator datum | `∫|u−N| ≥ c t^{−a/2}` | false for `C²` | R01 |
| §6.1 entropy solutions; Lean `IsEntropySolution` | stationary Burgers jumps; cubic flux; `T ≤ 0` | `k = 0`: left side `−∫φ(t,0)dt`; slopes `3/4 < 1`; `T ≤ 0` vacuous | holds | C03 |
| §6.2 Lean `lintegral_enorm_sub_le` | `f = 0`; `f = ua`; `u₀ − v₀ ∉ L¹`; `d = 0` | equality; translation; right side `∞`; `u = u₀` | holds | none |
| §6.3 viscous approximation | Burgers travelling wave | `εu' = −sech²/8 = u(u−1)/2` | holds | none |
| §6.4 Lean `exists_isEntropySolution` | `d = 0`; indicator datum | constant in time; `N·TV = 1·2` | holds | none |
| Headlines in `Suggested.lean` | Summary against the 9 theorems | comparison, Cauchy well-posedness, Oleinik, local existence, semiconcave uniqueness absent | statable and absent | R04 |

- Source locators checked against the text: 8, all in Crandall–Ishii–Lions (Theorem 3.3 with (3.13), (3.14), p. 18; Theorem 4.1 and Lemma 4.2, p. 23; Lemma 4.4, p. 24; Lemma 6.1 and Remark 6.2, p. 34; Remark 6.3, p. 35): all correct.
- Library declarations opened at the pin: 15 (Mathlib `Rademacher.lean:386`, `Strong.lean:117`, `PicardLindelof.lean:80`, `ImplicitContDiff.lean:55`, `Order/Monotone.lean:166`; Tau Ceti `HopfLax.lean:89,146`, `Conjugate.lean:119`, `Subdifferential.lean:89`, `Alexandrov.lean:623`, `MongeAmpere/Viscosity.lean:89`, `FDeriv/InfDist.lean:36`, `TotalVariation.lean:100`, `FrechetKolmogorov.lean:322`, `GlobalSolution.lean:207`, `DuhamelPotential/Basic.lean:117`, `HeatKernel/Basic.lean`): each at the cited line.
- Cross-roadmap citations resolved on main: OptimalTransport §2.2, §5.1, §5.2, §6.3, §8.7, §10.4; PDE §1.4, §3.4, §6.3, §6.5, §6.6 and its exclusion of viscosity solutions; GeometricMeasureTheory G3, G4; MarkovDecisionProcesses' exclusion of continuous-time control.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed at this head.
- Elaboration: `Suggested.lean` elaborates with nine `sorry` warnings and nothing else; no `set_option`, no sorry'd data.
- One-tactic probe (`simp`, `rfl`, `exact?`, `aesop` on each of the nine theorems): none closes.
- Duplication: the pinned Mathlib and Tau Ceti have no Fréchet differential, semiconcavity, first-order viscosity or entropy-solution declaration.

Overlap check: read OptimalControlAndHamiltonJacobi, ConvexAnalysisAndDuality, CompressibleEulerEquations, OptimalTransport, PDE; shared with OptimalControlAndHamiltonJacobi: the finite-horizon value function, dynamic programming, the Hamilton–Jacobi–Bellman theorem and the Cauchy comparison principle, no single owner (R03); shared with ConvexAnalysisAndDuality: the gradient of the conjugate under strict and strong convexity (§1.1), stated here as the real-valued superlinear case and left to the human reviewers; nothing shared with the others.

Source independence: 6 passages compared with 1 source (Crandall–Ishii–Lions), none shared; largest share Evans, 37 of 52 locators; contents not compared with Evans, whose text and table of contents could not be read.

Research link: Layer 4 is the first-order viscosity theory of Crandall–Lions (1983), Crandall–Evans–Lions (1984) and Ishii (1987), the base of the second-order theory of Crandall–Ishii–Lions (1992); Layer 6 is Kružkov's (1970) entropy theory, the scalar foundation of hyperbolic conservation laws (Dafermos, 2016). Rests on the README's references and on Crandall–Ishii–Lions.

## Not verifiable

- Evans, *Partial Differential Equations* (37 locators, among them every sampled target of Layers 2, 3 and 5 and of §4.1, §4.5, §4.6): no legal copy; the publisher's page is not open.
- Crandall–Evans–Lions 1984 (Theorems 1.1, 1.2, Proposition 1.1): the publisher's page was not classified as open by the sources service.
- Ishii 1987, Theorem 3.1: no open file at the journal's page.
- Kružkov 1970, Theorems 1, 4, 5: the fetch returned an unrelated document.
- Bardi–Capuzzo-Dolcetta 1997 (Theorems II.3.1, II.3.5, Proposition III.2.8) and Bardi–Evans 1984, Theorem 3.1: paywalled.
- The arrangement of the layers against Evans' table of contents: the contents page could not be fetched.

## Source issues

- none

## For the human reviewers

- Not tested: Evans' book carries 37 of the 52 locators; its text and table of contents could not be read, so the wording and arrangement checks were not made against it. Layer 5's five sections look parallel to its §3.4.1–§3.4.5.
- Ownership: §1.1 (lines 126–131) states the gradient of the conjugate under strict and uniform convexity; ConvexAnalysisAndDuality (pull request #2498) plans the general form in its 4.2–4.3. The author asks the maintainers to decide the owner.
- Ownership: OptimalControlAndHamiltonJacobi (pull request #2733) and this roadmap are both open and neither is on main; which of the two supplies the finite-horizon control theory (R03) fixes their merge order.
