# Review of HamiltonJacobiAndConservationLaws (pull request #2801 at 9e27a20)

**Verdict:** needs changes

**Summary.** Changes are needed: three findings, all P2, each repaired by a sentence or one statement. The Summary claims the semiconcave uniqueness theorem for every convex superlinear `H` and Lipschitz `g`, where the Hopf–Lax function need not be semiconcave (`H = p⁴`, `g = |x|`); the entropy-pair equivalence of §6.1 is false for an entropy flux that is not locally Lipschitz; and `Suggested.lean` states only the uniqueness half of the Cauchy well-posedness headline. The five findings of the previous review are all repaired. There is one small correction and no format note. Evans' book, which carries 35 of the 50 locators, could not be read legally, so its locators and the arrangement of Layer 5 are left to the human reviewers.

## R01 (P2) — The Summary states the semiconcave uniqueness theorem without the hypotheses under which the Hopf–Lax function is semiconcave

The Summary (lines 18–21) says: "For a convex superlinear Hamiltonian `H` and Lipschitz `g`, the Hopf–Lax formula … is Lipschitz, satisfies the equation almost everywhere, and is the only such solution that is semiconcave in the sense of Evans." A reader takes from this that the Hopf–Lax function is always a semiconcave weak solution; §3.3 claims that only when `g` is semiconcave or `H` is uniformly convex, and uniqueness only for `H ∈ C²`.

Take `d = 1`, `H(p) = p⁴`, `g(x) = |x|`. Then `L(q) = 3(|q|/4)^{4/3}`, and `y = 0` minimizes `|y| + t L((x − y)/t)` exactly when `|L'(x/t)| ≤ 1`, that is `|x| ≤ t/16`. So `u(t,x) = 3t(|x|/(4t))^{4/3}` near `x = 0`, and `u(t,z) − 2u(t,0) + u(t,−z) = 6t(|z|/(4t))^{4/3}`, which is not `≤ C(1 + 1/t)z²` for small `z`. This `H` is convex, superlinear and `C²`, and `g` is Lipschitz, yet the Hopf–Lax function is not semiconcave in the sense of §3.3. The smallest change: in the Summary, "for `H` of class `C²` it is the only such solution that is semiconcave in the sense of Evans, when `g` is semiconcave or `H` is uniformly convex". The example would serve as a Check in §3.3 that the alternative hypothesis of the existence bullet cannot be dropped.

## R02 (P2) — The entropy-pair equivalence of §6.1 fails for an entropy flux that is not locally Lipschitz

The second bullet of §6.1 (lines 865–867) quantifies over "every convex `η ∈ C¹(ℝ)` and `q : ℝ → E` with `q' = η' f'` almost everywhere". In this layer `f` is only locally Lipschitz, and the condition as written admits singular `q`; an implementer who states the bullet as written states something false.

Take `E = ℝ`, `f = 0`, `u₀(x) = min(max(x, 0), 1)`, `u(t,x) = u₀(x)`. This is the entropy solution: the defining expression is `∫ |u₀ − k| (∫₀ᵀ ∂ₜφ dt + φ(0,x)) dx = 0`. Take `η = 0` and `q = c`, the Cantor function extended by `0` and `1`; then `q' = 0 = η' f'` almost everywhere. The inequality of the bullet reads `∫₀ᵀ ∫ c(u₀(x)) ∂ₓφ dx dt ≥ 0`, and the left side is `−∫₀ᵀ ∫ φ(t,x) dc(x) dt < 0` for `φ > 0` on `[0,T/2] × [0,1]`. The smallest change: "and `q : ℝ → E` locally Lipschitz with `q' = η' f'` almost everywhere" (or `q(u) = ∫₀ᵘ η'(s) f'(s) ds`).

## R03 (P2) — `Suggested.lean` states uniqueness for the Cauchy problem and not existence, which the Summary names as a headline and which is statable

The Summary (lines 24–25) lists among the headline theorems that "the Cauchy problem with bounded uniformly continuous data has exactly one bounded continuous viscosity solution (Ishii's form of Perron's method)". The Lean file has the comparison principle and `eqOn_of_isViscositySolution_evolutionEquation`, both of which hold when no solution exists; the existence half, which is what Perron's method and all of §4.4–§4.5 are built for, is absent, and the module docstring does not name it. Every carrier is in the file: under the hypotheses of `eqOn_of_isViscositySolution_evolutionEquation` on `H` together with `∃ C, ∀ x, |H x 0| ≤ C`, and for `g` bounded and uniformly continuous, there is `u` with `ContinuousOn ↿u (Ici 0 ×ˢ univ)`, bounded on each `Icc 0 T ×ˢ univ`, `u 0 = g`, and `IsViscositySolution (evolutionEquation H) (Ioi 0 ×ˢ univ) ↿u`. The smallest change is to add that one statement.

## C01 — The opening of Layer 3 says the layer assumes `g` not bounded below

Line 354 reads "This layer assumes `g` Lipschitz and not bounded below", which taken literally excludes `g = ‖x‖`, the datum of the layer's first Check, and the sentence ends by returning to data that are bounded below. What is meant is that `g` is Lipschitz and need not be bounded below: "This layer assumes only that `g` is Lipschitz; it need not be bounded below".

## Questions for the author

- §4.3 cites Evans, §10.2, Theorem 1 for the Cauchy comparison between semicontinuous functions on `[0,T)`. The description says that theorem is, as far as recalled, for bounded uniformly continuous solutions. If so, would the locator say so, as the bounded-domain bullet does for Bardi–Capuzzo-Dolcetta ("for continuous `u`, `v`")? The statement itself I checked (penalty `η/(T − t)` at the free end, a penalty at infinity absorbed by the Lipschitz bound in `p`); the book could not be read.
- §5.5 states the N-wave estimate without a hypothesis `p, q > 0`. I checked the case `p = 0` for Burgers' equation directly (for `x` left of the support `u = 0 = N`; elsewhere `u = x/t + O(1/t)`), and the Check with the indicator datum is such a case. Does Evans, §3.4.5, Theorem 6 assume `p, q > 0`? If so the locator would say that the theorem is stated there for that case.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 Legendre transform | `H = p⁴/4`; uniform convexity `θ`; scalings | `L = (3/4)|q|^{4/3}`; midpoint defect `‖q₁−q₂‖²/(8θ)` from concavity of `L − ‖q‖²/(2θ)`; `(λH)*(q) = λH*(q/λ)` | holds | none |
| §1.2 and Lean `differentiableAt_iff_…` | `√|x|`, `x sin(1/x)`; `p ∈ D⁺`, `p' ∈ D⁻` | `(p' − p)(y − x) ≤ 2ε‖y − x‖` forces `p = p'`; `D⁻√|x|(0) = ℝ` | holds in any normed space | none |
| §1.3 and Lean `isSemiconcaveOn_infDist_sq` | `infDist² − ‖x‖²` | `inf_k (‖k‖² − 2⟪x,k⟫)`, an infimum of affine functions | holds | none |
| §2.2 and Lean local existence | Evans' two examples; `F = p₁`, `g = x₁`; `d = 0, 1` | `u₁u₂ = (x₁+4x₂)²/16 = u`; `∂_θ(g(r)e^θ) = u`; `hnc` forces `∇γ(x₀) ≠ 0` | holds; uniqueness by ODE uniqueness on `Γ`-data | none |
| §2.4 breaking time | `u₀ = −arctan`; `g = ∓‖x‖²/2`; `inf c'` not attained | `T* = 1`; `−‖x‖²/(2(1−t))`, `‖x‖²/(2(1+t))`; crossing characteristics carry different values past `T*` | holds | none |
| §3.1 and Lean `lipschitzWith_hopfLax`, `hopfLax_hopfLax` | `g = ±‖x‖`, affine; `d = 0` | Huber function; `−‖x‖ − t/2`; `g − tH(a)`; lower bound `g − t max_{‖p‖≤K} H`; minimizer has `(x−y)/t ∈ ∂H(p)`, `‖p‖ ≤ K` | holds | C01 |
| §3.1 power cost Check | `L = ‖w‖^s` | `L* = (s−1)(‖p‖/s)^{s/(s−1)}` | holds | none |
| §3.2 and Lean `deriv_hopfLax_add_eq_zero` | classical solution of §2.4 | `D²u = D²g (I + tD²H D²g)⁻¹`, bounded by `B/(1 − tAB)`: semiconcave, so §3.3 applies | holds | none |
| §3.3 and Lean `IsSemiconcaveWeakSolution.eqOn` | `ũ = min(|x|−t, 0)`; `T ≤ 0` | `−1 + 1 = 0` a.e., convex kink; `T < 0` vacuous, `T = 0` gives `u 0 = g = v 0` | holds | none |
| Summary, Hopf–Lax sentence | `H = p⁴`, `g = |x|` | `u = 3t(|x|/(4t))^{4/3}` for `|x| ≤ t/16`; second difference `6t(|z|/4t)^{4/3}` | not semiconcave | R01 |
| §4.1 and Lean differential form | arbitrary `u`; the rational-weight function with `F = 1` | `C¹` majorant from `sup (u(y)−u(x)−p(y−x))⁺/‖y−x‖`; `2|y|^{3/2}` touches at `0`; no `C²` contact | holds | none |
| §4.1 final-time Check | `u = 0` for `t < T`, `1` at `T`, `H = 0` | `u − t` maximal at `{T} × E`, `∂ₜφ = 1 > 0` | holds | none |
| §4.2 stability | `u^ε = 1−|x|−ε(e^{−|x|/ε}−e^{−1/ε})` | `−εu'' + |u'| − 1 = e^{−x/ε} + 1 − e^{−x/ε} − 1 = 0`; `u''(0±) = −1/ε` | holds; CIL Lemma 4.2, Lemma 6.1 | none |
| §4.3 bounded domain | `λr + H(x,p)` in CIL (3.13), (3.14) | `γ = λ`; `H(y,α(x−y)) − H(x,α(x−y)) ≤ ω₁(‖x−y‖ + α‖x−y‖²)`; `1 − e^{|x|−1}`: `u + |u'| = 1` | holds | none |
| §4.3 Cauchy and Lean comparison | usc/lsc on `[0,T)`; `T ≤ 0`; non-monotone `ω` | `u − η/(T−t)` keeps maxima off `t = T`; limit points at `t = 0` give `u(0,x̄) − v(0,x̄) ≤ 0`; `ω(0) ≥ 0` from `x = y` | holds | none |
| §4.4 Perron | `g ± Ct` in §4.5 | `−C + H(x,p) ≤ 0` for `‖p‖ ≤ K`; `W*(0,·) = g = W_*(0,·)` | holds; CIL Theorem 4.1, Lemma 4.4 | none |
| §4.5 Cauchy problem | Hopf formula, `H = −‖p‖²/2`, `g = ‖x‖`; semiconcave weak solution | `sup_{‖p‖≤1} ⟪p,x⟫ + t‖p‖²/2 = ‖x‖ + t/2`; limiting gradients all `(−H(p₀), p₀)` | holds | none |
| §4.6 control | `ℓ = min(|x|,1)`, `λ = 1`; time reversal | `x − 1 + e^{−x}`, `w + |w'| = x = ℓ`; `V_t + min{b·DV + ℓ} = 0` | holds; consumed sections exist | none |
| §4.7 and Lean eikonal | ball, square, `E ∖ {0}`; `v = 1 − e^{−u}` | `Dφ·e ≤ −1` toward a nearest point; `v + ‖∇v‖ = 1`; `‖x‖` fails at `0` with `φ = 0` | holds | none |
| §5.1 | Evans' two Burgers data | shock `x = (1+t)/2`; `u₁`, `u₂` both integral solutions | holds | none |
| §5.2 and Lean `exists_isOleinikEntropySolution` | `G` is `1/θ`-Lipschitz, `y(t,·)` nondecreasing | `u(x+z) − u(x) ≤ z/(θt) ≤ C(1 + 1/t)z` | holds | none |
| §5.3 and Lean `ae_eq` | `u ≡ 0` across `x = t`; unbounded `u₀` | strict Lax inequalities only where `u_l ≠ u_r`; proof uses bounds on `u`, `v` only | holds | none |
| §5.5 | indicator datum; `f'' = 1 + |u|^a`; `p = 0` | `s(t) = √(2t)` from `t = 2`; `∫N = (q−p)/2 = ∫u₀`; `t·(2/t)^{(2+a)/2}/((1+a)(2+a))` | holds for `C³` | none |
| §6.1 definition and Lean `IsEntropySolution` | Burgers stationary jumps; `u³`; `T ≤ 0`; `u₀` only `L¹_loc` | `−∫φ(t,0)dt`; slopes `3/4 < 1`; `φ(0,·) = 0` when `T ≤ 0`; `u(τ) → u₀` in `L¹_loc` forces `|u₀| ≤ M` | holds | none |
| §6.1 entropy pairs | `f = 0`, `η = 0`, `q` the Cantor function | `−∫∫ φ dc dt < 0` | false as written | R02 |
| §6.2 and Lean contraction | `f = 0`; `f = ua`; `u₀ − v₀ ∉ L¹`; `d = 0` | equality; translation, `N = ‖a‖`; right side `∞`; `u = u₀` | holds | none |
| §6.3 | Burgers travelling wave; heat kernel at the pin | `εu' = −sech²/8 = u(u−1)/2`; `(4πt)^{−n/2}e^{−‖x‖²/4t}` solves `∂ₜ = Δ` | holds | none |
| §6.4 and Lean `exists_isEntropySolution` | indicator datum; `d = 0` | `N·TV = 1·2`; constant in time | holds | none |
| Headlines in `Suggested.lean` | Summary against the 15 theorems | Cauchy existence absent; control named in docstring as on carriers not at the pins | one half absent | R03 |

- Earlier findings: R01 (N-wave) repaired, "if `f ∈ C³` and `u₀` is bounded with compact support", with the negative Check; R02 repaired, "the same subsolutions among upper semicontinuous `u`"; R03 repaired, "Section 4.6 consumes Layers 1–4 and owns only the passage to the initial-value form"; R04 repaired except for the existence half now raised as R03; R05 repaired, "at a point where `u_l ≠ u_r` this is `f'(u_l) > ṡ > f'(u_r)`". C01–C03 and N01 are done.
- Source locators checked against the text: 8, all in Crandall–Ishii–Lions (Theorem 3.3 with (3.13), (3.14), p. 18, CrandallIshiiLions1992 lines 891–908; Theorem 4.1 and Lemma 4.2, p. 23, lines 1120–1130; Lemma 4.4, p. 24, line 1199; Lemma 6.1, p. 34, line 1656; Remarks 6.2, 6.3, p. 35, lines 1669–1682): all correct.
- Library declarations opened at the pin: 53 (every locator of the supplier contracts, 26 in Mathlib and 27 in Tau Ceti): each is at the cited file and line. `hopfLax` (`TauCeti/Analysis/PDE/HopfLax.lean:89`) is a real infimum, so the layer's lower bounds are what make it the honest one; `hopfLax_add_add_smul_le` (`:146`) assumes `BddBelow (range φ)`.
- Cross-roadmap citations resolved: OptimalTransport §2.2, §5.1, §5.2, §6.3, §8.7, §10.4, Layer 7; PDE §1.4, §3.4, §6.3, §6.5, §6.6 and its exclusion of viscosity solutions; GeometricMeasureTheory G3, G4; MarkovDecisionProcesses; SymplecticGeometry/IntegrableSystems I3; OptimalControlAndHamiltonJacobi 1.2, 2.1–2.3, 3.1, 3.4, 4.1, 4.2 at its open head.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes nothing outside the folder.
- Automatic checks: all passed at this head. Elaboration: `Suggested.lean` elaborates with 15 `sorry` warnings and nothing else; no `set_option`, no sorry'd data. `#check @name` on the five declarations that use section variables: no binder lost.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `trivial`, `aesop` on each of the 15 theorems): none closes.
- Duplication: the pinned Mathlib and Tau Ceti have no Fréchet differential, semiconcavity predicate, first-order viscosity predicate, integral or entropy solution; no other roadmap, open or on main, states the Lax–Oleinik or Kružkov theory.

Overlap check: read OptimalControlAndHamiltonJacobi, ConvexAnalysisAndDuality, CompressibleEulerEquations, OptimalTransport, PDE; shared with OptimalControlAndHamiltonJacobi: the finite-horizon value function, dynamic programming, the Hamilton–Jacobi–Bellman theorem and comparison for continuous functions, owner OptimalControlAndHamiltonJacobi, consumed here by section; viscosity predicates, there for one equation and here for a general `F`, with their agreement a target of §4.6; shared with ConvexAnalysisAndDuality: the gradient of the conjugate under strict and strong convexity (its 4.2–4.3), stated here as the real-valued superlinear case, left to the human reviewers; nothing shared with the others.

Source independence: 5 passages compared with 1 source (Crandall–Ishii–Lions), none shared; largest share Evans, 35 of 50 locators; contents not compared with Evans, whose text and table of contents could not be read.

Research link: Layer 4 is the first-order viscosity theory of Crandall–Lions (1983), Crandall–Evans–Lions (1984) and Ishii (1987), the base of the second-order theory of Crandall–Ishii–Lions (1992); Layer 6 is Kružkov's (1970) entropy theory, the scalar foundation of Dafermos (2016). Rests on the README's references and on Crandall–Ishii–Lions.

## Not verifiable

- Evans, *Partial Differential Equations* (35 locators, among them every sampled target of Layers 1, 2, 3 and 5 and of §4.1, §4.5): no legal copy; the publisher's pages are not open.
- Crandall–Evans–Lions 1984 (Theorems 1.1, 1.2, Proposition 1.1; sampled in §4.1, §4.2): the publisher's page was not classified as open.
- Ishii 1987, Theorem 3.1 (sampled in §4.4): no open file at the journal's page.
- Kružkov 1970, Theorems 1, 4, 5 (sampled in §6.2, §6.4): the fetch returned an unrelated document.
- Bardi–Evans 1984, Theorem 3.1 (sampled in §4.5) and Bardi–Capuzzo-Dolcetta 1997: paywalled.
- The arrangement of the layers against Evans' table of contents: the contents page could not be fetched.

## Source issues

- none

## For the human reviewers

- Not tested: Evans' book carries 35 of the 50 locators; its text and contents could not be read. The author states that §5.1–§5.5 follow the order of Evans §3.4.1–§3.4.5, and that no dependency forces the order of §5.4 and §5.5.
- Ownership: §1.1 (README lines 129–134) states the gradient of the conjugate under strict and uniform convexity; ConvexAnalysisAndDuality (open, 4.2–4.3) plans the general form. Neither is on main; the author asks the maintainers to name the owner.
- Ownership: this roadmap consumes OptimalControlAndHamiltonJacobi (open) for §4.3 and §4.6, so it merges after it; both define first-order viscosity sub- and supersolutions, one for a single equation and one for a general `F`.
