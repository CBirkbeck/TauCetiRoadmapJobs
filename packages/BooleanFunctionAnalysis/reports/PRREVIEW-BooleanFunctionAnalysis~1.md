# Review of BooleanFunctionAnalysis (pull request #2519 at a29d55d)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every stated inequality and identity was recomputed on small cubes (all sign-valued functions in dimensions 0 to 3, samples in dimension 4, random real functions for the norm inequalities) and every locator into the three sources was read at its place; nothing failed, and the two routes that go beyond the sources (the constant `1/5` and the closeness `2ε`) were rederived by hand. There are no small corrections and two format notes, neither blocking. One licence classification is left to the human reviewers.

## N01 — Five definitions carry a decidability instance they do not use

`walshCoeff`, `variance`, `cubeNorm`, `noise` and `noiseStability` in `TauCetiRoadmap/BooleanFunctionAnalysis/Suggested.lean` (lines 42, 58, 62, 111, 121) take `[DecidableEq ι]` from the `variable` line at 38, although only `Pi.single` in `influence` (line 76) needs it. A later user who has a different decidability instance in scope must unify instances for no reason. Would it suit to keep `variable [Fintype ι]` at line 38 and add `[DecidableEq ι]` where Layer 2 begins?

## N02 — Two sentences describe how the text was written

"were not consulted" in the References (README line 832) and "proved here" used as a status label read as authoring notes. The first could say only that the papers are named for attribution; the second is fine where it tells the reader that the cited source gives no proof.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 classification | `ι = Fin 2`; `ι = ℕ` | `walsh {0,1}` = 1, −1, −1, 1; `ψ(x)² = ψ(0) = 1` forces values ±1; ℕ: uncountably many characters, countably many `S` | holds; `[Finite ι]` needed | none |
| 1.3 Plancherel, variance, norms | single −1 on `Fin 2`; majority on `Fin 3`; `walsh S` | coefficient squares 4·(1/4) = 1; variance 3/4 = 4·(1/4)·(3/4); `cubeNorm p (walsh S)` = 1 | holds | none |
| 1.4 convolution | 600 random pairs, n ≤ 3 | coefficient of convolution minus product of coefficients: below 1e-9 in all | holds | none |
| 2.1 influences | `walsh {i}`; single −1 on `Fin 2`; all sign-valued f, n ≤ 3 | 1 and 0; 1/2, 1/2; `influence ≤ variance` in 6804 of 6804 cases | holds | none |
| 2.2 spectral formulas | majority on `Fin 3`; all sign-valued f, n ≤ 3, 1500 samples n = 4 | 1/4 + 1/4 = 1/2; total 3/2; both formulas agree in 6804 and 1778 cases | holds | none |
| 2.3 Poincaré with equality case | `walsh {0} + 2 walsh {1}`; all sign-valued f, n ≤ 3 | 5 = 5; 3/4 ≤ 1; equality ⇔ degree ≤ 1 in 1778 of 1778 | holds, both directions | none |
| 2.4 edge-isoperimetric | n = 0; α = 0, 1 (junk `logb`); `Fin 2` all 16; subcube codim k | 0 ≤ 0; equality in exactly 10 of 16; (3/2)log₂(4/3) = 0.6226 ≤ 1; k·2^(1−k) both sides | holds, also for α > 1/2 | none |
| 3.1 operator | n = 1, ρ = 1/2 and ρ = 2; n = 0 | rows (3/4, 1/4); (3/2, −1/2), sum 1; empty product gives `noise ρ f = f` | holds | none |
| 3.2 action on expansion | 605 random f with ρ of both signs; ρ = −1 | coefficients `ρ^|S| f̂(S)` to 1e-9; kernel at −1 is 1 exactly at `y = x + 𝟙` | holds | none |
| 3.3 stability | majority at 1/2 and −1/3; single −1 at 1/2; kernel versus spectrum, 278 f | 13/32; −7/27; 9/16; direct and spectral values agree | holds | none |
| 3.4 coordinates maximise | all mean-zero sign-valued f, n ≤ 3, at ρ = 1/2; `walsh {0,1}` at ρ < 0 | ≤ 1/2 in 401 of 401, equality ⇔ ±`walsh {i}`; ρ² > ρ | holds; `0 < ρ` needed | none |
| 4.1 two-point | p = 2, q = 4, ρ² = 1/3 and 1/2; p = q = 1, ρ = 2 | 1 + 2b² + b⁴/9 ≤ (1 + b²)²; 1.030025 > 1.0201; 2 > 1 | holds; `1 < q` needed | none |
| 4.2 hypercontractivity (headline) | 605 random f, n ≤ 4, p ∈ {1, 1.3, 2, 3}, q − p ∈ {0, .5, 2, 5}, ρ = ±√((p−1)/(q−1)) | `‖T_ρ f‖_q ≤ ‖f‖_p` in all; `walsh S`: `|ρ|^|S|` ≤ 1 | holds | none |
| 4.3 bounded degree | `walsh {0} + walsh {1}`; point indicator; 640 random truncations | 2^(1/4) ≤ √3; 2^(n/2) ≤ e^n; both bullets hold in all; Hölder exponent recomputed `(2−p)(2+ε)k/(2εp)` | holds | none |
| 4.4 small sets | all {−1,0,1}-valued f, n ≤ 2; 2100 samples n = 3, 4; ρ ∈ {0, .2, .5, .9, 1} | 21465 of 21465; subcube k = 1, ρ = 1/3: 1/3 ≤ 0.3536; `2·1` at ρ = 1: 4 > 2 | holds; value hypothesis needed | none |
| 4.5 level-k | all {0,1}-valued f, n ≤ 4, every admissible k | 58604 of 58604; point of 2-cube: 3/16 ≤ 0.471; α ∈ (1/2, e^(−1/2)] allowed and holds | holds | none |
| 5.1 damped weight | all sign-valued f, n ≤ 3, ρ ∈ {0, 1/3, 1/2, 1} | 27216 of 27216; majority at ρ = 0: 1/4 = 1/4; ρ = 1: both `influence` | holds | none |
| 5.2 KKL, edge form | all nonconstant sign-valued f, n ≤ 3; majority; normalised sum | 1770 of 1770; r = 3/2: 4/27 ≤ 1/2; non-sign f: 1/n < 1 | holds; sign hypothesis needed | none |
| 5.3 KKL (headline) | n = 1; `Fin 2` single −1; tribes 710 × 10; constants of the route | 0 ≤ ·; 0.052 ≤ 1/2; 0.000977 vs 0.000250; c = 0.5606 ≥ 2/5, (3/c)³ ≤ 421.9 ≤ 1125 | holds | none |
| 5.4 junta | all sign-valued f, n ≤ 3, ε ∈ {.05, .3, 1, 2.5}, k ≤ n + 1 | cardinality and weight bounds 41440 of 41440; `sgn g` within 2ε in 15211 of 15211 | holds, also for ε > 1 | none |
| 6.1 linearity test | all sign-valued f, n ≤ 3; n = 0, f = −1 | acceptance = 1/2 + (1/2)Σf̂³; single −1: 1/4, reject 3/8, distance 1/4; n = 0: 1 ≤ 1 | holds | none |
| 6.2 Kalai's formula (headline) | n = 0…3, all sign-valued f | 6^n profiles; majority 17/18; n = 0: 0 = 0; formula exact in 278 of 278 | holds | none |
| 6.3 Arrow (headline) | n = 0…3, all sign-valued f; f(0) = 0, f(1) = 5 | hypothesis holds for 0, 2, 4, 6 functions, all ±`walsh {i}`; non-sign f escapes | holds | none |

- Source locators read at the text: every one in the README (46 citations of O'Donnell's arXiv edition, 7 of de Wolf, 4 of Garban and Steif); all support the statements as written, including where the README says the source proves less.
- Library declarations opened at the pins: 34 in Mathlib (file and line as in the supplier contracts) and 3 in Tau Ceti (`TauCeti/Data/ZMod/IntUnitsPower.lean` 62 and 90, `TauCeti/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean` 22); all exist with the stated content.
- Cross-roadmap citations resolved on main: RandomMatrices 2.1 and 2.2, BanachSpaceTheory B4.0 and B6, GaussianIsoperimetryAndClusters Layer 8 (8.3); all scope deferrals, no supplier edge.
- Dependency check: `depcheck: 200 roadmaps, 2183 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: exit 0, 25 `sorry` warnings and nothing else; no `set_option`, single `import Mathlib`, 10 definitions with real bodies.
- One-tactic probe (`simp`, `rfl`, `simp` with the definitions unfolded) on all 25 theorems: none closes.
- Elaborated types compared with the README statements for all 35 declarations: generality agrees; nothing lost from the `variable` block (see N01 for an instance carried in excess).
- Automatic checks: all passed.

Overlap check: the three closest-roadmap lists are empty; read RandomMatrices (2.1, 2.2), BanachSpaceTheory (B4.0, B6), GaussianIsoperimetryAndClusters (Layer 8) and the open MarkovChainMixing (its spectral gap `1/n` of the lazy hypercube walk is a Check there, equivalent to 2.3 here); nothing shared. The cube case of the Poincaré inequality is kept here with its equality case; RandomMatrices 2.1 owns Efron–Stein.

Source independence: 10 passages compared with 3 sources, none shared; largest share ODonnell, 46 of 57 source citations; contents compared with ODonnell: independent (Layer 4 starts from §10.1 before the Chapter 9 special cases, Layer 6 joins §1.6 and §2.5 after Chapter 9, §2.2–2.4 are split over two layers; the order of Layers 1, 2, 3 is forced by the *Needs* lines of 2.2 and 3.3).

Research link: the headline targets are the theorems of Bonami (1970), Kahn, Kalai and Linial (1988), Friedgut (1998) and Kalai (2002) as the README's References name them; they are the standard inputs to sharp-threshold and noise-sensitivity results (Garban and Steif 2012, Chapter I). Rests on the README and on GarbanSteif.

## Not verifiable

- The six original papers named in the References (Bonami, Kahn–Kalai–Linial, Friedgut, Blum–Luby–Rubinfeld, Kalai, Harper) were not opened: the README cites them for attribution only and gives no locator into them.

## Source issues

- none

## For the human reviewers

- **Licence.** de Wolf's survey was read from the journal's own site `theoryofcomputing.org`, which the sources service lists in no licence class; it was classed as a publisher's open archive after reading the journal header (deWolf lines 5–7).
- **Licence.** The arXiv edition of O'Donnell's book carries a notice allowing copies for noncommercial personal use only (ODonnell lines 11–12); the roadmap cites it by locator and no passage was found reproduced.
