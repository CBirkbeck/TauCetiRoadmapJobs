# Review of SingularHermitianMetricsAndL2Methods (pull request #2884 at dbae182)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SingularHermitianMetricsAndL2Methods/`
**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, Check and worked value I recomputed holds, every locator I could open supports its statement, and the ownership finding of the previous review (the uniform Bergman asymptotic against HeightsRationalPointsAndObstructions §5.17c) is repaired, as are its five small corrections and its format note. There are two small corrections (the second form of 4.2 has neither a route nor a locator; a sentence in 8.3 reads as if GeometricQuantization consumed it) and one format note, none blocking. The provenance and licence of the cited formal proof remain for the human reviewers.

## C01 — The second form of 4.2 is the only target stated without a route and without a locator

An implementer of the second form of 4.2 (lines 1294–1301: sections `s_1, …, s_n` with finite transverse common zero set, the weight `ψ = n·log Σ_k|s_k|²`, the bound `(34/δ)·c_n`) is told only "It is the form that [FormalProof] proves". Every other statement taken from that proof names a file and a declaration (3.4, 3.8, 3.9, 3.10, 7.7, 7.8), and the *Route* of 4.2 (lines 1303–1312) and its locator [AMAG] Th. 13.6 concern the first form only; the text itself says that the second form "is not a case of 4.2". The statement is consistent where I tested it: on `ℙ¹` with `L = O(1)`, `E = O(d)`, the hypothesis reads `d ≥ 1 + δ`, so `K ⊗ E = O(d − 2)` has a section with a prescribed value at the point, and the weight `|z|^{−2}/(1 + 4δ²log²|z|)` has the finite integral `π²/(2δ)` near the zero, of the order `1/δ` of the constant.

The smallest change: add to the second form the file and declaration of [FormalProof] as in the other targets, and one sentence of route (the twisted estimate 3.2 with the weight `ψ` and twists that are functions of `ψ`, or the published theorem it is a case of, with its number).

## C02 — "that GeometricQuantization §6.2 uses" in 8.3 reads as if that roadmap consumed 8.3

In 8.3 (lines 2233–2235) the text says that 8.3 for `L^m ⊗ K_X^{−1}` "gives, for `m` large independently of the points, the separation of points and first jets by `H⁰(X, L^m)` that GeometricQuantization §6.2 uses for the Kodaira embedding". GeometricQuantization is on main, earlier in the merge order, and does not cite this roadmap: its §6.2 (`TauCetiRoadmap/GeometricQuantization/README.md`, lines 958–966) proves that separation itself, by peak sections with ComplexKahlerGeometry K5b and K6. The mathematics of the sentence is right (the weight `(n + 1)·log|z − x|²` has Lelong number `2(n + 1)`, so `J ⊆ m_x²` by 1.2(c) with `s = 1`), but a reader takes 8.3 for a supplier of that section.

The smallest change: "…the separation of points and first jets by `H⁰(X, L^m)` that GeometricQuantization §6.2 proves by its own peak-section route for the Kodaira embedding".

## N01 — 5.1, 5.2 and 3.1 carry no locator at the statement

5.1 and 5.2 are Mumford 1977, §1, Proposition 1.1 and the definition of good forms with Proposition 1.2, pp. 241–242 (Mumford1977 lines 106–123); 5.3 and 5.4 already give their numbers from the same section. 3.1 names its sources only in the References.

## Questions for the author

- Is the second form of 4.2 the case of Demailly's extension theorem for weights with log canonical singularities (the one whose constant is `34/δ`)? I did not open that paper, so I could not check the statement or supply its theorem number; if it is, its locator belongs at the statement (C01).
- In 7.4 the functions `φ_r` are indexed by `0 < r < r₀/2` and bounded by `sup_{B(x,ar)}φ` with `a = 2A ≥ 2`, so `ar` ranges up to `A·r₀ ≥ r₀`, while the charts are only said to contain the balls `B(x, r₀)` used for `λ_r`. Is the range meant to be `r < r₀/(2a)`, or are the chart balls assumed to have radius `A·r₀`? The proof of this form is not given, so I could not decide which.

## Deferred findings

- D01 — stands

## Previous findings

- R01 — repaired: "Scope and ownership" now reads "HeightsRationalPointsAndObstructions §5.17c: the Bergman density of a positive hermitian line bundle on a compact projective manifold for the curvature probability volume, its uniform asymptotic `bergmanDensity_uniform`", keeps 9.2 "as the variant for an arbitrary smooth positive volume form `dV`… proved by its own peak-section route without §5.17c", and the roadmap is no longer listed under "Downstream consumers". §5.17c at that roadmap's head has both names.
- C01 — repaired: 7.3 "1992, Proposition 3.7, and [AMAG] Th. 14.12, pp. 142–143"; 7.4 "1994, Theorem 4.1"; 6.2 "[AMAG] Prop. 5.7, p. 37"; 3.10(a) "[CADG] chapter VIII, Th. 9.10, p. 392"; 3.8 "[CADG] chapter VIII, Th. 6.1, p. 376"; 3.2a(a) "[CADG] chapter V, Th. 14.3 and 14.5"; 5.3 and 5.4 "Mumford 1977, Proposition 1.3, p. 242", "Theorem 1.4, pp. 242–243". All opened and found as cited. What remains is N01.
- C02 — repaired: "A constant `A` need not exist on a noncompact `X`".
- C03 — repaired: "for closed `γ` on compact Kähler `X`, Guedj and Zeriahi 2005, Proposition 1.7"; in 2.2 the locator now follows the definition and precedes "it is *neat* when `w` extends smoothly".
- C04 — repaired: 3.2a(b) assumes "`k` is negative definite on a smooth sub-bundle `W ⊂ S^{⊥k}` containing the image of every `σ_j`" and says that for `w ≥ 2` "`W = S^{⊥k}` is not available".
- C05 — repaired: 8.3 is stated "in the setting of 8.2".
- N01 — repaired: 7.5's Check writes "`2 log ε + 2c_ρ`".

## Verified sound

| Statement | Instances tried | README side | Source or computation | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 2.2 (sample) | `c·log(|z₁|² + |z₂|²)` at `0` | `ν = 2c·min ord = 2c` | `liminf c·log|z|²/log|z| = 2c`; AMAG Def. 1.10, line 329, p. 8: `(α/2)log Σ|f_j|² + v`, `v` locally bounded | holds | — |
| 3.1 (sample) | `ℂ`, `φ = |z|²`, `g = dz̄`; (a) from (b) | equality `π = π`; constant `1` in (a) | `∫|z|²e^{−|z|²} = π`; weight `φ + 2log(1 + |z|²)` gives `½∫|g|²e^{−φ} ≤ ∫|g|²e^{−φ}` | holds; source unread | N01 |
| 3.8 (sample) | same example; `θ = i∂∂̄|z|²` | `|v|²_θ = Σ|v_k|²`; equality | `π = π`; CADG VIII Th. 6.1, line 18365, p. 376: `‖f‖² ≤ ∫⟨A^{−1}g, g⟩` | holds | — |
| 3.8a (sample) | (i) `x = s√κ = ½`; (ii) disc, `s = ½` | `πe^{x²}(1 + x²)` vs `πe^{x²}(1 − x)^{−2}`; `π/((1−s)(2−s))` vs `π/(s(1−√s)²(3−s))` | `1.25 ≤ 4`; `4.19 ≤ 29.3`; `∫₀¹t(1−t)^{−s}dt = 1/((1−s)(2−s))`, `∫₀¹(1−t)^{2−s}dt = 1/(3−s)` | holds; sources unread | — |
| 4.2 (sample) | disc, `s = z/e`, `f = c·dz` | `C₁ ≥ 4π` | `∫₀¹dr/(r(1 − log r)²) = 1`, so `2e²|c|²·2π = 4πe²|c|²` against `e²|c|²`; AMAG Th. 13.6, lines 6286–6312, pp. 125–126 | holds | — |
| 4.2, second form | `ℙ¹`, `L = O(1)`, `E = O(d)` | hypothesis for `α ∈ [1, 1 + δ]` | `2π(d − α)ω_FS ≥ 0` iff `d ≥ 1 + δ`; `2π∫₀¹dr/(r(1 + 4δ²log²r)) = π²/(2δ)` | consistent; no locator | C01 |
| 4.3 (sample) | disc of radius `r` at `0` | `c_D² ≤ πK_D`, equality | `c = 1/r`, `K(0) = 1/(πr²)`: `1/r² = π/(πr²)` | holds; source unread | — |
| 5.2 (sample) | circle `|z| = ε` | boundary term `O(1/|log ε|)` | Poincaré growth: `|η| ≤ C·ε dθ/(ε|log ε|)`, integral `2πC/|log ε| → 0`; Mumford Prop. 1.2, line 122, p. 241 | holds | N01 |
| 6.5 (sample) | `φ = ψ = log|z|²` on `ℂ` | `(z²) ⊆ (z)(z)` | `|z|^{2k−4}` integrable iff `k ≥ 2`; AMAG Th. 15.2(b), line 7905, p. 159 | holds | — |
| 6.6 (sample) | `n = 1`; `c·log|z|²` on `ℂ²`, `1 ≤ c < 2` | condition `ν − 2ord f < 2`; `1 ∈ J(φ)`, `1 ∉ J(φ|_H)` | `2c < 4`, `2c ≥ 2`; Guan–Zhou Th. 1.1, GuanZhou2015 line 31, pp. 1–2 | holds | — |
| 7.1 (sample) | weight doubling; `φ = 0`, `m = 1` on the disc | loss `2n/m`; `C₂ = n!/π^n`; `1/(π(1 − |z|²)²)` | AMAG Th. 14.2, lines 6810–6825: `n/m` for half the weight; `Σ(k + 1)|z|^{2k}/π` | holds | — |
| 7.4 (sample) | `ρ = (3/π)(1 − |w|²)²`; `ν = b = 1`, `r₀ = ½` | `c_ρ = −11/12`, `m₂ = ¼`; `0.73, 0.85, 0.94` | `6(−¼ + ⅛ − 1/36)`; `6/24`; `1 − (¼ − r²)/log(1/(2r))`; Demailly1994 Th. 4.1, lines 809–831 | holds; own form unproved in source | question |
| 7.5 (sample) | `Ψ` on `B(x, 4r)`; `log|z|²` in charts `z`, `2z` | factor `4^{−n}`; difference `log 4`; `S(4r) − S(r) = log 16` | `vol B(x,r)/vol B(y,2r) = 4^{−n}`; `2log ε + 2c_ρ` against `2log ε + 2c_ρ − log 4` | holds; sources unread | — |
| 9.1 (sample, headline) | Fock space, `φ = k|z|²`, `r = C/√k` | `B ≥ c·k` | `ε = 2k` for `ω_eucl`, `osc = C²`, `c₁r^{−2}e^{−C²} = c′k` against `k/π` | holds; sources unread | — |
| 9.2 (sample, headline) | `ℙ¹`, `O(1)`; `ℂ`, `dV = ½dλ` | `k^{−1}(k + 1) → 1`; `2/π` | `∫B = k + 1`; `(1/π)/(½) = 2/π` | holds; sources unread | — |
| 9.3 (sample) | model weight `λ|w|²` | limit `λ/(πc)`; `0` for `λ ≤ 0` | `∫_ℂ e^{−λ|w|²} = π/λ`, `∫_{|w|<R} → ∞` for `λ ≤ 0`; Berman Th. 1.1, Berman2004 line 104, p. 3 | holds | — |
| 8.1 (headline) | `ℂ`, `ω = i dz∧dz̄`, `φ = a|z|²`, `g = dz∧dz̄` | `(1/a)(2π/a)` | least `u = z̄dz`: `∫|z|²e^{−a|z|²}·2dλ = 2π/a²`; AMAG Cor. 5.3, line 1634, p. 35 | holds, sharp | — |
| 6.2, 8.2 (headline) | `ℙ¹`, `O(1)`, `h_FS^{1−a} ⊗ |s|^{−2a}` | `a < 1`: `H¹ = 0`; `a = 1`: `ℂ` | `ν = 2a < 2`, `H¹(O(−1)) = 0`; `J = O(−p)`, `H¹(O(−2)) = ℂ`; AMAG Th. 5.11, p. 39 | holds | — |
| 4.1 (headline) | unit polydisc, `f = 1`; disc of radius `r` | `π` sharp; `πr²` | mean value: `∫|F|² ≥ π·vol`; `G = log(|w|/r)`, `c = 1/r` | holds; source unread | — |
| 3.10 | `g = (z₁, z₂)`, `f = z₁`, `α = 3/2`; iteration | `c(2,1) = 3`; `I = π²`; product of `(β + i)/(β + i − q)` | `(3/2)/(½)`; `½·2π²∫₀¹dr`; CADG VIII Th. 9.10, line 19138: `1 + m/ε = α/(α − 1)` | holds | — |
| 8.3 | `ℙⁿ`, `O(n+1)`; weight `(n + 1)log|z − x|²` | `J = m_x`; first jets | `|z|^{−2n}` not integrable; `ν = 2(n + 1) ≥ 2(n + s)`, `s = 1`; AMAG Cor. 5.12, p. 40 | holds; wording on GeometricQuantization | C02 |
| 9.2 against HeightsRationalPointsAndObstructions §5.17c | `dV = c₁ⁿ/∫c₁ⁿ` | limit `∫c₁ⁿ/n!` | `= lim N_k/kⁿ`, that roadmap's `B_n/N_n → 1`; now stated in Scope | one owner, variant kept | — |
| 3.2a(b) | weight 2, `S = H^{2,0}` | `W = H^{1,1}` | signs `+, −, +`; `k(σs, t) + k(s, τt) = 0` gives `Θ_S = −σ*∧σ` | holds | — |
| 0.3a | `log|z|` on the disc; mass bound | `μ = 2πδ₀`; `c_n(r^{2−2n} − R^{2−2n})` | `M(R) − M(r) ≥ μ(B_r)∫_r^R dt/(σt^{2n−1})`, `c_n = 1/(σ(2n − 2))` | holds | — |
| 0.4 | `f_j = 2^{−j}(3 + cos 4^j x)` | decreasing, `f_j″(0) = −2^{3j}` | `f_j ≥ 2^{1−j} ≥ f_{j+1}`; `−2^{−j}·16^j` | holds | — |
| 1.1–1.3 | `log|z|² − |z|²`; `z₁^a z₂^b` | mass `2 − 2r²`; `1/(a+b) ≤ 1/max ≤ 2/(a+b)` | `2δ₀ − (2/π)dλ`; `ν = 2(a + b)` | holds | — |
| 3.7 | `A = −1`, `φ = −|z|²`; (b) | `1 − e^{−1} < 1`; `e^{Ac′r²}(M/c^n)` | `(1/π)e^{−1}π(e − 1)`; `F*ω ≤ c′ω_eucl = (c′/2)i∂∂̄|w|²` | holds | — |
| 5.5 | `0 < |z| < ½` | area `4π/log 2` | `2·2π·[−1/log r]₀^{1/2}` | holds; sources unread | — |
| 7.3 | `φ = 0`, discs `a`, `a³`, levels `m`, `2m` | `(log(1/a) + ½log π)/m` | `−(1/2m)(log π + 6log a) + (1/m)(log π + 2log a)`; Demailly1992 Prop. 3.7, line 860 | holds | — |
| 7.8 | shells; model weight; `u_b` | `16`; mass `1/log(1/ρ)`; `½` | `Σ(j+1)(j+2)2^{−j} = 2/(½)³`; `r f′(r)/2`; `r²/(r² + b²)` at `r = b` | holds | — |

- Source locators checked against the text: 38 (AMAG 18: Def. 1.10, (3.11), Th. 5.2, Cor. 5.3, Lemma 5.6, Prop. 5.7, Th. 5.11, Cor. 5.12, Remark 5.17, Def. 6.16, Th. 6.17, Th. 13.6, Cor. 13.9, Th. 14.2, Cor. 14.3, Th. 14.12, (15.1), Th. 15.2; CADG 7: I Th. 5.5–5.11 (pages), Def. 5.22, Th. 5.24, V Th. 14.3, Th. 14.5 with (14.6)–(14.7), VIII Th. 6.1, Th. 9.10; Mumford 3; Demailly 1982 3; Demailly 1994 2; Demailly 1992, Skoda 1972, Guan–Zhou, Berman, Guedj–Zeriahi 1 each).
- Library declarations opened at the pins: `TauCeti.leviForm` (`TauCeti/Analysis/Complex/LeviForm.lean:119`), `TauCeti.IsStrictlyPlurisubharmonicAt` (`TauCeti/Analysis/Complex/Pseudoconvex.lean:82`), `TauCeti.IsManifoldStrictlyPlurisubharmonicAt` (`TauCeti/Geometry/Manifold/Complex/LeviForm.lean:343`), `TauCeti.SubharmonicOn` (`TauCeti/Analysis/InnerProductSpace/Harmonic/Subharmonic.lean:74`), `planarGreenKernelDisk`, `ballGreenKernel`, `holomorphicStructureSheaf`, `delBar`; Mathlib `Real.circleAverage` (`Mathlib/MeasureTheory/Integral/CircleAverage.lean:55`), `TestFunction`, `Distribution`, `HilbertBasis`, `ContMDiffRiemannianMetric`, `ContMDiffVectorBundle`, `ContMDiffSection`. Neither library defines plurisubharmonic functions with values in `[−∞, ∞)` or pseudoconvex domains; Mathlib has no file on subharmonic functions.
- Cross-roadmap citations resolved: on main, ComplexComparisonPartII C-1.1, C-1.4 (`sncPolydiscChart`, `snc_exists_polydiscChart`), C1.3–C1.5, C2.2, C5.4 (six names); ComplexKahlerGeometry K2–K7.2; RealAnalyticGeometry R3.0–R3.1; ComplexHessianEquations §§5.4, 7.1; PDE §§3.1, 3.4; ClassicalArithmeticCompletion §§6.18, 6.20, 6.40; CharacteristicClasses §§4.1–4.2; AlgebraicModuliForArithmeticGeometry §§1.6, 9.10; ResolutionOfSingularitiesCharacteristicZero §§5.1, 5.2, 7.7; ArakelovGeometryAndAbelianHeights §5.1; GeometricQuantization §6.2; BallQuotientsAndComplexHyperbolicLattices §9.1. At open heads: MultiplierIdealsOfPairsAndPointSeparation §§9.10b, 9.10c, 9.12, 9.12b, 9.12c; ArithmeticDynamics §2.4; ArakelovGeometryAndAbelianHeightsPartII §0.1; HeightsRationalPointsAndObstructions §5.17c; the consumers' sections.
- Dependency check: `depcheck: 171 roadmaps, 1992 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` of `Suggested.lean` exits 0 with no output. The file declares nothing, so the `#check` comparison and the one-tactic probe had nothing to test; its docstring names the four headlines with the carriers each lacks, and its claims about the two libraries hold at the pins.
- Automatic checks: the worker's run passed every check.
- The pull request's text agrees with the head: it adds the folder, says that `Suggested.lean` declares nothing, and its merge-order paragraph names the open roadmaps the README cites. No file outside the folder and the family index is changed.

Overlap check: read HeightsForLogSingularMetrics, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties (open), ComplexHessianEquations, ComplexComparisonPartII, ComplexKahlerGeometry (main), and, outside the lists, HeightsRationalPointsAndObstructions, MultiplierIdealsOfPairsAndPointSeparation and GeometricQuantization. Shared objects: the uniform Bergman asymptotic for the curvature volume, owner HeightsRationalPointsAndObstructions §5.17c, now stated in Scope; multiplier ideals and Nadel vanishing for pairs, owner MultiplierIdealsOfPairsAndPointSeparation, cited; log-log singular metrics on arithmetic varieties and their regularisations as metrics, owner HeightsForLogSingularMetrics §0.4, which cites 7.7 and 7.8 for the complex analysis; the Kodaira-embedding separation of points, owner GeometricQuantization §6.2 (C02); `C²` plurisubharmonic estimates, owner ComplexHessianEquations, cited. Nothing else is shared.

Source independence: 16 passages compared with 9 sources (2.2, 4.2, 6.5, 7.1, 7.3, 8.1 against DemaillyAMAG; 3.8, 3.10 against DemaillyCADG; 5.2–5.4 against Mumford1977; 7.3 against Demailly1992; 7.4 against Demailly1994; 6.6, 9.3, 1.2, 0.4, 3.3 against GuanZhou2015, Berman2004, Skoda1972, GuedjZeriahi2005, Demailly1982); none shares more than forced hypothesis lists and standard names; largest share DemaillyAMAG, 17 of 40 locator citations; contents compared with DemaillyAMAG: independent (the Ohsawa–Takegoshi layer precedes multiplier ideals and Nadel vanishing follows approximation, against its sections 13, 5 and 14; Layers 5 and 9 and the division theorem of Layer 3 have no counterpart there). [FormalProof] was not opened, so nothing was compared with it.

Research link: Layers 4, 6 and 8 hold the Ohsawa–Takegoshi theorem with Błocki's constant (2013), Guan–Zhou strong openness (2015) and Nadel vanishing (1990); Layer 9 the Bergman asymptotics of Tian (1990) and Berman (2004); 7.7–7.8 feed arithmetic intersection theory of log-log singular metrics (HeightsForLogSingularMetrics). Rests on the README's References and Downstream consumers.

## Not verifiable

- Hörmander 1965 and his book (3.1, sampled): not in the sources cache; 3.1(a) was derived from (b) and the Check recomputed.
- Donnelly–Fefferman 1983 and Berndtsson 1996 (3.8a, sampled): not in the cache; 3.8a is derived in its route from 3.8, and I checked that derivation and its Checks.
- Błocki 2013 and Suita 1972 (4.1, 4.3, sampled): no legal copy found by earlier rounds; not fetched again. The Checks were recomputed.
- Błocki–Kołodziej 2007 and Fornæss–Narasimhan 1980 (7.5, sampled): not in the cache; the route of 7.5 was checked step by step.
- Tian 1990, Bouche 1990, Zelditch 1998, Catlin 1999 (9.1, 9.2, sampled): not in the cache; the Checks were recomputed.
- The form of 7.4 with the chart secant `λ_r` and the explicit `ε_r`: Demailly 1994, Theorem 4.1 has the scale derivative of the corrected mean and an unspecified error `δ(t) → 0`; the README says that the proof of its own form is not given.
- [FormalProof] and [Announcement]: not opened; the file paths and declaration names cited from it (3.4, 3.8, 3.9, 3.10, 7.7, 7.8) and the description of its analytic part in the References could not be checked.
- Kobayashi 1984, Cheng–Yau 1980, Demailly 2000, Siu 1974, Ma–Marinescu 2007, Lazarsfeld: as in the previous review.

## Source issues

- none

## For the human reviewers

- Provenance: the README records statement forms from a formal proof of the Riemann hypothesis for Dirichlet L-functions announced on 20 November 2026 (References, [FormalProof], [Announcement]; Conventions, "Statements of the formal proof"). Neither was opened in this review.
- Licence: the licence of the cited repository was not read, and its declaration names are quoted in 3.4, 3.8, 3.9, 3.10, 7.7 and 7.8 (README lines 908–909, 1029–1033, 1140–1144, 1173–1177, 1980–1981, 2064–2065).
- Provenance: the second form of 4.2, the second route of 7.7 and the restricted case of 7.8 rest on [FormalProof] alone; no published locator stands beside them (README lines 1294–1301, 1975–1982, 2631–2645).
