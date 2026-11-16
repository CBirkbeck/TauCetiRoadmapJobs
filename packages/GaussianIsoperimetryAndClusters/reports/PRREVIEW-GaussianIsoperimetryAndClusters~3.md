# Review of GaussianIsoperimetryAndClusters (pull request #2420 at c490eeb)

**Verdict:** accepted

No findings. The head is the one the previous review read (no change in the folder), and that review listed no finding to re-check; everything below was recomputed for this review.

## Verified sound

`φ`, `Φ`, `I` are the README's; numbers are recomputed to six places. "L" is the Lean declaration, "R" the README statement.

| Statement | Instances tried | Left side computed | Right side computed | Result |
|---|---|---|---|---|
| §2.3 frontier bound, convex sets, explicit perimeters (sample) | disc `n=2`; `n=1` ball; quadrant; closed segment; half-space `s=0,1` | `e^{−1/2}=0.606531`; `2φ(1)=0.483941`; `2·0.199471=0.398942`; `P_γ=0`; `φ(0)`, `φ(1)=0.241971` | ball formula `0.606531`, `0.483941`; `I(1/4)=0.317777` below; frontier `0.136177`; `I(1/2)`, `I(Φ(1))` | holds; openness needed |
| §2.6 weighted coarea (sample) | `f=‖x‖` on `ℝ²`; `u=χ_U`; `u(t)=t` on `ℝ`; `n=0` | `∫‖∇f‖dγ=1`; `V_μ(χ_U)`; `∫φ d|Du|=1`; `0` | `∫_0^∞ r e^{−r²/2}dr=1`; `∫_0^1 P_μ(U)dt`; `∫φ(s)ds=1`; `0` | holds; L = R(b) |
| §3.1 clusters (sample) | three intervals; `(E,∅)`; `q=0`; `q=1`; `n=0`, `q=2` | `½(φ(a)+φ(a)+φ(b)+φ(b))`; `0`; cover fails, `volume(E)>0`; `(E)` only; vectors `(1,0),(0,1)` only | `φ(a)+φ(b)`; `0`; no `0`-cluster; perimeter `0`; no cluster at `(½,½)` | holds; L structure = R |
| §3.3 interface form (sample) | three intervals; `(E,∅,∅)`; `q=2` | `φ(a)(a_1−a_2)²+φ(b)(a_2−a_3)²=0` only at `a=0` on `E^{(2)}`; `L_A=0`; `L_A u=2A_12 u` | graph `1–2–3` connected; vertex excluded by `int Δ`; `A_12>0` | holds; Poincaré route needs no Gaussian input |
| §3.4 profile (sample) | vertex `(1,0)`; `q=1`; `ρ=c(1+y²)e^{−x²(1+y²)⁴}`; disc bound | `0`; `0`; `∫ρ dx=c√π/(1+y²)`, line `{x=0}` length `∞`; `0.606531` | padding bound `0`; `I_μ^{(0)}(1)=0`; slab `{|x|<a}` finite; `I(0.393469)=0.384633` below | holds |
| §4.1 model cluster (sample) | `q=2`; `q=3`, `x=0`; conormals; `q=1` | `A_12(tu)=φ(t)`; `A_ij=1/(2√(2π))=0.199471`; `η` sum `=0`, norms `1`; `μHE[q−2]` junk | cell measure `Φ(−t)`; `P=0.598413`; `120°`; no pair `i<j` read | holds |
| §4.3 `modelMeasureMap_diffeomorph` | `q=2`, `x=0.7u`; `q=3`, `x=0`; tie `y−x=(1,1,−2)` | `dΨ_1/dt=−φ(0.7)=−0.312254`; `DΨ=−3A/√2=−0.423142 Id`; `Ψ_1(y)<Ψ_1(x)` | `−(L_A u)_1/√2=−0.312254`; same; maximal-coordinate inclusion strict | holds; sign `+` excluded |
| §4.6 `modelProfile_hessian` (sample) | `q=2` at `x=tu`; `q=3`, `v=(⅓,⅓,⅓)` | `Dg(0)u=I′(Φ(−t))/√2=t/√2`; `H(2Au,u)=2A·(−1/(2A))=−1`; `∇²I_m=−1.671086 Id` | `⟨x,u⟩/√2=t/√2`; `−⟨u,u⟩=−1`; `−tr[(∇²)⁻¹]=1.196827=2·0.598413` | holds; L = R |
| §4.7 `isoperimetricProfile_le_modelProfile` | `n=0,q=1`; `q=0`; `n=1,q=3`; `n=0,q=2` | `0≤0`; `Σ∅=0≠1` vacuous; `0.727200>0.598413`; `∞>0.398942` | — ; — ; excluded by `q≤n+1`; excluded by `q≤n+1` | holds; hypothesis `q≤n+1` necessary |
| §5.2 shifting intervals (sample) | `(0,1)→(0.408796,∞)`; `(−1,0)→(−0.9,0.063724)`, `(−0.5,0.385003)` | `0.366963`; `0.664218`, `0.722510` | `0.640913` (smaller ✓); `0.640913` (larger: `a+b<0` control) | holds; derivative `−φ(a′)(a′+b′)` |
| §6.5 upper bound for symmetral (sample) | `{x_2<a}`; `{x_2<1+x_1}`; unit disc | `φ(a)`; `0.310697`; `0.517483` | `0+φ(a)`; `0.219696+0.219696=0.439391`; `0.386129+0.252249=0.638378` | holds |
| §6.5 against the source's (4.10) | `{x_2<1+x_1}` in the source's normalisation | `e^{−1/4}=0.778801` | printed: `0.219696+0.550695=0.770391`; with `√(2π)` on the variation term `1.101391` | README's correction confirmed |
| §6.6 `gaussianPerimeter_gaussianSymmetral_le` | disc; `n=1`, `(−1,1)`; `∪(1/(2k+1),1/(2k))` | `0.517483`; `0.356343`; `I(0.116140)=0.195467` | `0.606531`; `0.483941`; `∞` | holds; L = R |
| §7.3 `gaussian_isoperimetric` | `n=0`; `∅`; disc; slab; half-space; conull `U` | `I=0`; `0`; `0.384633`; `0.356343`; `φ(s)`; `I(1)=0` | `0`; `0`; `0.606531`; `0.483941`; `φ(s)`; `0` | holds; both directions of the iff |
| §7.4 `isoperimetricProfile_two_eq`, `Cluster.perimeter_eq_iff_halfSpaces` (sample) | `v=(½,½)`; `v=(1,0)`; `n=0` | `0.398942`; `0` by `(E,∅)`; profile `∞` | `I(½)`; `I(1)=0`; excluded by `[Nontrivial E]` | holds; uniqueness only in the interior |
| §8.1 `borell_sudakov_tsirelson` (sample) | half-space; disc `r=1`; `n=0`; `γ*(A)=1` | `Φ(a+r)`; `1−e^{−2}=0.864665`; `1`; closure `=E`, `1` | `Φ(a+r)`; `Φ(0.729712)=0.767217`; `≤1`; `≤1` | holds |
| §8.1 `…_multivariateGaussian` | `S` not PSD; `S=diag(1,0)`, `A=(−∞,0]×{0}`; `A` off `L` | `δ_m(A)=1`; `Φ(r)`; `0` | `Φ(a+r)≤1`; `Φ(0+r)`; no admissible `a` | holds; outer-measure step `(T_*γ)(X)≥γ(T⁻¹X)` right way round |
| §8.2 `gaussian_minkowskiContent_ge` (sample) | half-space; disc; `ℚ²`; Bernstein set | `φ(a)`; `0.606531`; `∞`; `0.398278`, `0.398936 → 0.398942` | `I(Φ(a))`; `0.384633`; `0`; `I(½)=0.398942` | holds in `[0,∞]` |
| §8.3 `bobkov_inequality` | `Φ(x)`; `Φ(2x)`; `min(x²,1)`; constant; `n=0` | `I(½)=0.398942`; same; `I(0.516059)=0.398619`; `I(c)`; `I(c)` | `0.398942`; `0.398942`; `0.647406`; `I(c)`; `I(c)` | holds; equality on half-space subgraphs |
| §8.4 `gaussian_concentration_median` (sample) | `f=x_1`, `r=2`; `L=0`; `r=0`, constant `f` | `0.022750`; `0`; `γ{f>m}=0` | `1−Φ(2)=0.022750 ≤ ½e^{−2}=0.067668`; `1−Φ(r)`; `½` | holds; strict set needed at `r=0` |
| §8.5 `gaussian_max_concentration` | `S=I_2`, `r=2`; `S=0`; `S=[[1,2],[2,1]]` | `1−Φ(2.544952)²=0.010899`; `0`; `δ_0`-measure `0` | `0.022750`; `1−Φ(r)`; `1−Φ(r)` | holds; row norm of `√S` is `√(S_ii)` |
| §9.2 one-dimensional symmetrisation (sample) | Hessian of `g` at `(−1,1)`, `(0,2)`, `(−3,−0.5)`, `(0.5,0.6)` | `g_aa=g_bb=−0.459912`; determinants `0.163502`, `0.015519`, `0.000142`, `15.648788` | negative definite at all four; `g(−1,1)=0.475233` | holds |
| §9.3 planar approximation | directions `u_j`; closed unit disc | `90°, 135°, 157.5°, 168.75°`; limit `{⟨x,u_1⟩≥0.270288}` | cones increase to `{⟨x,u_1⟩≥0}`; measure `0.393469` | matches the source's Théorème 1.6 hypotheses |
| §9.4 convexity in every dimension (sample) | composition law on `N⊕G_1⊕G_2⊕ℝu`; ball in `ℝ³` | second-step section measure `∫v_1(n,g_2)dγ(g_2)`, independent of `g_1`; `Φ⁻¹(0.198748)=−0.846102` | `v_{F_1+F_2}(n)`; one-step symmetral `{x_3≤−0.846102}` | holds |
| §9.5 `ehrhard_inequality_convex`, `convex_closedGaussianSymmetral` | `[−1,1]`,`[−3,3]`,`θ=½`; `θ=0`; `n=0`; `θ=0.9` Borell limit | `1.690143`; `γ(B)`; `1`; `1.690143` | `1.628704` (PL bound `0.825134<0.948312`); `Φ(b)`; `≤1`; `1.554146`, limit `1.475233` | holds |
| §1.1–1.2, Conventions | `I(⅓)`; `I″(0.3)`; tails at `1`, `2`; `q=3` marginal | `0.363600`; `−2.876104`; `0.158655<0.241971`, `0.158655≤0.303265`; `0.110336` | `φ(0.430727)`; `−1/I(0.3)`; `0.022750≤0.067668`; reciprocal factor `0.207108` | holds |
| §7.2 negative control | strips `{|x_1−2^{−k}|<4^{−k}}`, `ρ=1/4`, `1/16` | missing-section proportion `0.208333`, `0.052083`; area fraction at `1/16`: `0.032981` | `(5/6)ρ`; bound `(256/27)ρ³` holds since `2^{−k_0}<(4/3)ρ` | holds |

- Source locators read at their lines: 27 of MilmanNeeman2022, 19 of CianchiFuscoMaggiPratelli2011, 11 of Ehrhard1983, 9 of Ledoux1999, 3 of Ledoux1993, 2 of Borell1975, the Maggi2012 contents and synopsis lines; all support the statements, hypotheses included (the sample's 15 targets and the rest).
- Library declarations opened at the pins: 108 names of the supplier contracts match their cited file and line; the definitions relied on were read (`TauCeti.variationMeasure` VariationMeasure.lean:136, `TauCeti.reducedBoundary` ReducedBoundary.lean:95, `TauCeti.essentialBoundary` EssentialBoundary.lean:143, `ProbabilityTheory.multivariateGaussian` Multivariate.lean:166, `MeasureTheory.Measure.quantile` Quantile.lean:164).
- Cross-roadmap citations resolved on main: GeometricMeasureTheory G2, G5, G6 (README lines 148, 248, 275), Isoperimetry I1, I2, I4 (lines 104, 144, 223), RandomMatrices 2.2 (line 503), BanachSpaceTheory B7 (line 1264). The one citation lead, `Cluster.perimeter_eq_iff_halfSpaces`, is this roadmap's own declaration.
- Duplication by object: no Gaussian isoperimetric, Ehrhard, Borell, Bobkov, weighted-perimeter or cluster statement in the pinned Mathlib or Tau Ceti (Tau Ceti's Gaussian `Maximum.lean` is the expected-maximum lower bound, not §8.5), nor in any roadmap on main or open.
- Gate: every check passes. Dependency check: `depcheck: 240 roadmaps, 2252 edges, 0 problem(s)`; the merge order lists the roadmap at line 433; no change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 20 warnings, all `sorry`, no error. One-tactic probe (`rfl`, `simp`, `infer_instance`) on a scratch copy: none of the 20 theorems closes. `#check @name` for all 37 declarations compared with the README: generality agrees; the binders flagged as dropped are instance arguments that the bodies of `weightedPerimeter`, `weightedMeasure`, `gaussianWeight` and the two symmetrals do not use, and no theorem loses a hypothesis.
- Headlines: the eleven end theorems of §§7.3–9.5 and the nine layer theorems of §§2.2–6.6 are all stated; the 17 definitions have real bodies and each is used by a stated theorem.
- Pull request text: title and description agree with the head (new roadmap, suppliers G2, G5, G6, I4, Layer 2 sections §2.1–§2.7).

Overlap check: read RandomizedSmoothing, MathematicalStatisticsAsymptotic, MathematicalStatisticsNonparametric, MathematicalStatisticsSemiparametric, SchattenClassesAndSchurMultipliers, Isoperimetry, GeometricMeasureTheory, OptimalTransport; nothing shared (RandomizedSmoothing's Gaussian shift inequality is a Neyman–Pearson statement about translates, not an enlargement or perimeter inequality).

Source independence: 22 passages compared with 6 sources, none shared; largest share MilmanNeeman2022, 27 of 85 locators; contents compared with MilmanNeeman2022 (Sections 1–12): independent (its Section 2 is Layer 4, its Sections 3–4 (i) are Layers 2–3, in the opposite order, and Layers 5–9 have no counterpart there).

## Not verifiable

- Bobkov1997 Corollary 1, inequality (10), and the argument after Corollary 2: the cached text is unreadable OCR; §8.3 was checked against Ledoux1999 line 296–313 instead.
- Maggi2012 Theorem 15.9, Proposition 12.15, Theorem 12.26, Exercise 29.7 and the bodies of Sections 13.1 and 18.1–18.3: the cached extract holds only the contents (line 79, 99–101) and the Part IV synopsis (line 716–725).
- SudakovTsirelson1974, CarlenKerce2001, AmbrosioFuscoPallara2000, Bogachev1998: settled as uncertified, cited by locator.
- Borell1975 Theorem 3.1: read in OCR (line 85–99); whether the star on the measure is a subscript (inner measure) cannot be told from it.

## Source issues

- **Gap** in MilmanNeeman2022 at Lemma 2.1, proof of injectivity, p.11: the source says a point `y ≠ x` lies in some open translated cell `x + Ω_i`; it should be that `i` maximises `(y − x)_i`, which gives the strict inclusion of cells also at ties; affects the proof.
- **Error** in CianchiFuscoMaggiPratelli2011 at Lemma 4.4, equation (4.8), preprint p.12: the source says the gradient of the section measure is the boundary sum with weights `e^{−y²/2}`; it should be with weights `(2π)^{−1/2} e^{−y²/2}`, as the section measure is a probability; affects a stated result.
- **Error** in CianchiFuscoMaggiPratelli2011 at Lemma 4.5, inequality (4.10), preprint p.13: the source says the surface-normalised perimeter of the symmetral is at most the unscaled variation term plus the section term; it should be with `√(2π)` on the variation term (the tilted half-plane gives `0.778801 > 0.770391`); affects a stated result.

## For the human reviewers

- none
