# Review of EchoStatesAndRandomFeatures (pull request #2990 at 1a32c3c)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement and every numerical Check was recomputed (degenerate index sets, `r = 0`, `K = 0`, `δ = 0`, the two-fixed-point matrix, the mass-64 counterexample to Rahimi–Recht's Lemma 1) and all hold as written; the supplier citations resolve at the open heads of FractalGeometry and IterativeMethodsForLinearSystems. There are one small correction (a page locator) and two format notes, none blocking. Jaeger's report could not be read from a legal copy, so its locators and the misprint the README attributes to it are unverified; that and the status of the copy are left to the human reviewers.

## C01 — Lemma 4 of Rahimi–Recht and its bound (16) are on p. 6, not p. 7

A reader who opens p. 7 for the statement finds only the proof. In the copy on Recht's own page, Appendix A opens at the foot of p. 6 with the statement of Lemma 4 and eq. (16); p. 7 carries the proof, eqs. (17)–(20). The README gives p. 7 for the lemma in the sources paragraph of 4.1 (line 385), for "Lemma 4, eq. (16)" in 4.2 (line 429), and in the References (line 591); the pull request description repeats it. I could not read the papers.nips.cc copy the README names, so if its pagination differs, say which copy the pages refer to; otherwise write "Lemma 4 and eq. (16), p. 6; proof with eqs. (17)–(20), p. 7".

## N01 — 1.3 has no Check that boundedness of `A` is needed

It is needed: on `A = ℝ` with `F₁ = F₂ = x/2`, the solutions `x₁ k = 2^k` and `x₂ = 0` are at distance `2^k > 0 = δ/(1 − r)`. The Check of 3.1 already uses this sequence; a line in 1.3 would tell an implementer the hypothesis is not decorative.

## N02 — the `iff` of 2.3 carries no `[DecidableEq ι]` while 2.2 and the supplier's statement do

`hasEchoStates_linearReservoir_iff` elaborates because Mathlib's `spectralRadius` asks only for a non-unital ring (it is the supremum over the quasispectrum, equal to the unital one by `spectralRadius_eq_of_unital`). The value is the same, so nothing is wrong; adding the binder would make the statement match 2.2 and IterativeMethodsForLinearSystems 1.2 syntactically.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 existence on compact invariant sets | `A=(0,1]`, `x/2`; `[0,1]` with `F 0=1`; `tanh(2x)`; `U` empty | `x 0 ≤ 2^(−k)` forces `0 ∉ A`; `x k = 2^k x 0` leaves `[0,1]`; `tanh(1/5) > 1/10` iff `e^(2/5) > 11/9` | holds; three Checks true | none |
| 1.2 contraction, echo function, modulus | `F = r x + (1−r)u`; `r = 0`; `tanh(2x+u)`, `u ∈ [3,4]`; `A = ∅`; `U` empty | `E z − E z' = r^n` exactly; `0^0·diam = diam`; `tanh(1)² ≈ 0.58 > 1/2` iff `e² > 3+2√2 ≈ 5.83`; continuity: `e_0 ≤ r^n diam + η/(1−r) < ε` | holds | none |
| 1.3 internal approximation | `x/2` vs `x/2+1` on `[0,2]`; `δ = 0`; unbounded `A = ℝ` | distance `2 = 1/(1−1/2)`; unbounded case `2^k > 0` so boundedness needed; Lean `1 − ↑r` is real subtraction | holds | N01 |
| 2.1 echo state network, `‖A‖ < 1` | `W = [[3/2,1],[−2,−3/2]]`, `u = (−1,10)`; `A = 0`; `ι` empty | `tr 0`, `det −1/4`, eigenvalues `±1/2`; `WᵀW` trace `19/2`, det `1/16`; box images `[0.7499,1.5]`, `[6.5,7.50015]`, `[−1.5001,−0.75]`, `[9.5,10.50015]`; `e^13 ≈ 442413 ≥ 19999` | holds; counterexample correct | none |
| 2.2 echo series of a linear reservoir | `A = 0`; nilpotent `2×2`; scalar `1/2` | `A x(k+1) + C z k = x k` termwise; `Σ 2^(−j) = 2`; `‖A^k‖ ≤ 2^(−q) max‖A^s‖`, `q > k/m − 1` | holds | none |
| 2.3 spectral `iff` | `A = 1`; rotation; nilpotent; `ι` empty; `Re v = 0` case | `y 1 = (Im λ/|λ|²) b ≠ 0`; rotation: `A^(−k) e₁` bounded; empty: quasispectrum `{0}`, radius `0`, unique state | both directions hold | N02 |
| 3.1 solutions are shifts of the coding map | `x/2` with `x k = 2^k`; ternary system; `U` empty | unbounded solution exists, so boundedness needed; `E z = Σ 2 z_j 3^(−(j+1))`; distance `≤ r^m M → 0` | holds without completeness | none |
| 3.2 reachable states are the attractor | `r = 1/3`, `r = 1/2`; `U` empty; incomplete `X` | images `[0,r] ∪ [1−r,1]` cover iff `r ≥ 1/2`; empty `U`: no attractor, vacuous; restriction to `K` gives complete space | holds | none |
| 4.1 mean squared error identity and bound | Rademacher example; mass 4; mass 64, `K = 1`; `K = 0`; `Y` empty | `C²/K`; `4C² > C²`; min squared distance `C²/4` at `t = C/2`, so `≥ 4C > C(1+√(2 log 2)) ≈ 2.18C`; `K = 0`: left `C²μ(Y)`, right `0` | holds; `μ(Y)` factor needed | C01 (locator) |
| 4.2 high-probability bound | `δ = 0`; `δ ≥ 1`; `K = 1, 2`; `C = 0` | proxy `K(C/K)² = C²/K`; `exp(−Kε²/(2C²)) = δ`; `K = 2`: error `C` w.p. `1/2`, `C > C/√2`; `δ ≥ 1`: left side `0` | holds | C01 (locator) |
| Definitions `IsSolution`, `HasEchoStates`, `esnMap`, `linearReservoir`, `rksTarget`, `rksApprox` | time direction; state-first argument order; `0⁻¹` | `x k = F (x (k+1)) (z k)` matches `x_t = F(x_{t−1}, z_t)` under `z k = z(−k)`; `dense (A,b) x = A *ᵥ x + b` at the pin | intended objects | none |
| `IFS`, coercion, `IFS.IsAttractor` | compared field by field with FractalGeometry 1.1 at its head | identical fields, binders and bodies; distinct namespaces | verbatim copy, owner cited | none |

- Source locators checked against the text: 9 in Grigoryeva–Ortega 2018 (Definition 2.5 p. 7, Theorem 2.6 p. 8, Theorem 3.1(i)–(iii) p. 11, proofs pp. 12–14 with (3.4), Corollary 3.2 p. 14, proof p. 24, Theorem 4.1); 7 in Rahimi–Recht 2008 (Lemma 1 and (9) p. 3, Lemma 4 and (16), (17)–(20), Theorem 1); 0 of 7 in Jaeger.
- Library declarations opened at the pins: 30 Mathlib (all found under the cited files; `spectralRadius` at `Mathlib/Analysis/Normed/Algebra/Spectrum.lean:81`, `IsCompact.mem_uniformity_of_prod` at `Mathlib/Topology/UniformSpace/HeineCantor.lean:120`, `Matrix.l2_opNorm_mulVec` at `Mathlib/Analysis/CStarAlgebra/Matrix.lean:220`) and 3 Tau Ceti (`dense` at `TauCeti/Geometry/Neuromanifold/Dense.lean:84`, `tanhActivation` at `TauCeti/Geometry/Neuromanifold/Activation.lean:101`, `hasSubgaussianMGF_of_bounded_differences_fin` at `TauCeti/Probability/McDiarmid.lean:383`, proxy `n (c/2)²`).
- Cross-roadmap citations resolved: FractalGeometry 1.1 and 1.4 (`existsUnique_codingMap`, `range_codingMap`, the latter without completeness, as 3.2 uses it); IterativeMethodsForLinearSystems 1.2; borders LinearSystemsAndControl 1.3, 5.1, 5.4, UniversalApproximation 4.1, Neuromanifolds §2: all present with the stated content.
- Dependency check output: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`. Both open suppliers add new roadmap folders.
- Automatic checks: all passed. `Suggested.lean` elaborates with `sorry` as the only warning (10 theorems). Elaborated types compared with the README statements for all 18 declarations: generality equal; `rksApprox` does not mention the measurable structures and needs none.
- One-tactic probe (`simp` on each of the 10 theorems): none closes; none is a restated definition. All headline theorems of the summary are stated; none is declared not statable.

Overlap check: read FractalGeometry, UniversalApproximation, KernelsAndSpectralMethods (and LinearSystemsAndControl); nothing shared. FractalGeometry owns `IFS`, attractors and the coding map (cited); KernelsAndSpectralMethods 11.4 owns random Fourier features (excluded here by the scope section); UniversalApproximation 4.1 owns Maurey's lemma (existence, not sampling).

Source independence: 10 passages compared with 2 sources, none shared; largest share Rahimi–Recht 2008, about 9 of 22 locators; contents compared with Rahimi–Recht 2008 (and Grigoryeva–Ortega 2018): independent. Jaeger's text and contents could not be read.

Research link: Layer 1 is the echo-state, fading-memory and internal-approximation theorem (Theorem 3.1) that Grigoryeva–Ortega 2018 use for universality of echo state networks (their Theorem 4.1); Layer 4 is the approximation lemma behind the excess-risk theorem of Rahimi–Recht 2008 (Theorem 1). Rests on the two sources read.

## Not verifiable

- Jaeger 2001 (GMD Report 148, corrected 2010): no legal copy could be read (the research-group page the README links is not accepted as an author's own page, and a search by title found none). Unverified: Definition 1 and eq. (3), p. 6; Proposition 3(a), p. 8, and Appendix C, p. 41; the scalar example, p. 9; the description of the proof of Proposition 3(b); and the sentence in the Checks of 1.2 that the hint on p. 9 is a misprint. No theorem rests on this source alone: 1.2 and 2.1 also cite Grigoryeva–Ortega, which was read.
- The papers.nips.cc copy of Rahimi–Recht 2008 named in the References: not read; the same paper was read on Recht's own page.

## Source issues

- **Error** in RahimiRecht2008 at Lemma 1, p. 3: the source says the bound (9) holds for any measure on the input space; it should be for a probability measure, or carry the factor of the square root of the total mass; affects a stated result.
- **Gap** in GrigoryevaOrtega2018 at Theorem 3.1(iii), p. 11, proof pp. 13–14: the source says the filters differ by strictly less than ε, while the proof ends with at most ε; it should apply (3.4) with the actual sup distance of the maps, which gives the strict bound; affects nothing.

## For the human reviewers

- Scope: the subject is reservoir computing and random-feature approximation (topic `math.DS`); two of the three sources are refereed (Neural Networks 2018, NIPS 2008), the third, Jaeger 2001, is an institute technical report.
- Licence: Jaeger's report is linked on a research-group page (README line 581) that the sources service does not classify; its text was not read, so its seven locators and the claimed misprint are untested.
- Licence: the README names papers.nips.cc as the open copy of Rahimi–Recht 2008 (line 591); the sources service does not classify that host. The review read the copy on an author's page.
