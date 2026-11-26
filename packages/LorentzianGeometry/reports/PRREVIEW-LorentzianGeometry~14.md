# Review of LorentzianGeometry (pull request #2232 at 43acb00)

**Verdict:** accepted

**Summary.** Accepted: a full review of the renumbered head, with every Check and worked example recomputed, the eight `sorry` statements of `Suggested.lean` read against the README and against the pinned definitions, and about ninety source locators opened, finds no false or unsupported statement and no supplier defect. There are two small corrections (a source section number that the renumbering changed, and one identity of §1.3 that SemiRiemannianFoundations §1.2 already states) and three format notes, none blocking. One point about prior art is left to the human reviewers, and one deferred point about the RiemannianGeometry README stands outside this folder.

## C01 — The timelike Raychaudhuri equation is cited to "§1.2" of Minguzzi 2019, which is the notation section

In §8.2 (README line 1319) the locator reads "Minguzzi 2019, §1.2, pp. 161–163". A reader who opens §1.2 finds "Notation and terminology" on p. 6. The pages are right and the section is not: the contents list "6.2 The Raychaudhuri equation: timelike case" (minguzzi2019 line 105), and that section begins on p. 161 (minguzzi2019 line 6766). The number changed with the roadmap's own renumbering, where §6.2 became §1.2; it is the only source locator that the renumbering altered. Write "§6.2, pp. 161–163".

## C02 — §1.3 asks for a proof of `(ker ξ)^⊥ = ℝ ξ^♯`, which SemiRiemannianFoundations §1.2 already states

In §1.3 (README line 225), "Prove `(ker ξ)^⊥ = ℝ ξ^♯` and the hyperplane trichotomy" makes the first identity a target here. SemiRiemannianFoundations §1.2 states the same identity for every signature, with the Mathlib lemma that gives it, and also that `ker ξ` is degenerate exactly when `ξ^♯` is null, with radical that line. Two roadmaps would then each prove it. §1.3 already lists SemiRiemannianFoundations §1.2 under *Needs*, so the smallest change is "By SemiRiemannianFoundations §1.2, `(ker ξ)^⊥ = ℝ ξ^♯`; prove the hyperplane trichotomy", leaving the Lorentzian trichotomy as this roadmap's statement.

## N01 — Two prime characters for the same metric in §6.2

The definition of stable causality writes `g'` (README line 822) and the citation four lines below, like §6.3, writes `g′` (lines 826 and 857). One character for both would do. This is the format note of the previous review, at its new place.

## N02 — Three sections state theorems with no source locator

§1.3 (causal type of subspaces and the hyperplane trichotomy), §2.2 (curvature of the model spacetimes) and §4.2 (the equivalent forms of a null hypersurface, optical functions and double null foliations) cite no source, while the References list O'Neill's Ch. 5 for the first. A locator at each would let a reader check the statements as elsewhere in the README.

## N03 — The equivalence of §6.3 could be stated in `Suggested.lean`

The equivalence of stable causality with the existence of a time function and of a smooth temporal function (§6.3) uses only objects the file already defines (`LorentzianMetric I M 0`, `IsCausalSpacetime`, `IsFutureCausalCurve`), with two short predicates. The module docstring neither states it nor lists it as not statable. If the author counts it among the headline theorems, it would be stated there; if not, nothing changes.

## Deferred findings

- D01 — stands

## Previous findings

- N01 — not repaired: the two characters `g'` and `g′` are still both used for the wider metric, now in §6.2 (lines 822 and 826); raised again as N01.
- D01 was the previous report's only other open item; it is accounted for above.

## Verified sound

| Target | Instances | Roadmap value | Computed value | Result |
| --- | --- | --- | --- | --- |
| §1.2 reverse inequalities | `v=(1,0)`, `w=(2,1)`; `(1,1)`, `(1,−1)`; `dim V = 1` | `3 ≤ 4`; `√8 ≥ 1+√3`; null pair `b = −2` | `(−1)(−3)=3`, `b(v,w)²=4`; `2.83 ≥ 2.73`; `−1−1=−2`; `dim 1`: cones `ℝ_{>0}`, `ℝ_{<0}` | agrees |
| §1.2 (b), `IsLorentzian.neg_of_neg_of_neg` | `(1,0)`, `(2,1)`, `(1,½)`; `(1,0)`, `(−1,0)` | `b(u,w) < 0` | `b = −2, −1.5, −1`; opposite cones give `b = +1`, hypothesis fails | agrees |
| §1.3 causal type of subspaces | `ξ = dt, dx, dt−dx` in `ℝ^{1+2}`; `diag(−1,−1,1,1)`; `W = 0` | `ξ^♯ = −∂_t`, `(−1,−1,0)`; quotient signature `(1,1)` | solving `b(u,·)=ξ` gives `(−1,0,0)`, `(−1,−1,0)`; induced form `diag(0,1)`; `W=0` is spacelike | agrees |
| §2.2 model spacetimes | dS₂, AdS₂; `F = 1−2m/r`, `1−2m/r²`; flat Robertson–Walker | `K = 1, −1, 2m/r³`; `Ric(∂_t,∂_t) = −3a″/a` | `cosh″/cosh = 1`; `−cosh″/cosh = −1`; `−F″/2 = 2m/r³`; `(rF)′ = 1+2m/r² ≠ 1` | agrees |
| §2.3 acoustical metrics | `Σ=ℝ`, `c=1`, `v=2`; `c=0`; constant `c`, `v` | Gram `[[3,−2],[−2,1]]`, `det −1`, `g(B,B) = −1` | `3−4 = −1`; `3−8+4 = −1`; `c=0`: `g(B,·)=0`; pullback of `−dT²+dX²` by `(ct, x−vt)` is `g` | agrees |
| §3.1 time orientations | Minkowski; two copies; Möbius quotient; acoustical `∂_t` | 2, 4, 0 orientations; `∂_t` future timelike iff `c² > |v|²` | transitivity is §1.2 (b); deck map sends `∂_t` to `−∂_t`; `g(∂_t,∂_t)=|v|²−c²`, `g(∂_t,B)=−c²` | agrees |
| §3.2 causal curves and length | `(s,s)`; `(s,0)` on `[0,2]`; `(2s,0)` on `[0,1]`; `(|s|,0)` | `L = 0, 2, 2`; last not future causal | `∫√0 = 0`; `∫₀²1 = 2`; `∫₀¹2 = 2`; velocity `(−1,0)` pairs `+1` with `∂_t` | agrees |
| §3.3 causal relations | Minkowski; cylinder; RelativisticQuantumFieldTheory's flat sets at `K = {p}` | `J⁺(0) = {t ≥ |x|}`; cylinder `I⁺(p) = M` | flat `causalFuture {p} = {x : p₀ ≤ x₀, q(x−p) ≥ 0}`, contains `p`: equals `J⁺(p)` | agrees |
| §4.1 Gauss, Codazzi, constraints | unit hyperboloid of `ℝ^{1,3}` | `R^Σ = −1`; `S+H²−|k|² = 0`; Codazzi with `−R(X,Y,Z,ν)` | `0−(1·1−0) = −1`; `−6+9−3 = 0`; derived sign from `∇_Y Z = ∇^Σ_Y Z + k(Y,Z)ν` | agrees |
| §4.2 null hypersurfaces | `u = t−|x|`; `t∓r`; quadrant with `u = x+y`, `g = −dx²+dy²` | `g⁻¹(du,du) = 0`; `g⁻¹(du,du̲) = −2`; fibre `{(0,0)}` | `−1+1 = 0`; `−1−1 = −2`; `L = (1, x/|x|)`; `x+y = 0` only at the corner | agrees |
| §5.1 local causality | broken curve through `(1, 0.5)`; `q = (1,2)` | lengths `2` and `√3`; `q ∉ J⁺(0)` | `2√(1−¼) = √3 < 2`; `g(q,q) = −1+4 = 3 > 0` | agrees |
| §5.4 conformal null geodesics | `Ω = e^t`, `exp(−t²)` on `(s,s)` | `ŝ ∈ (−½, ∞)`; finite future parameter | `∫e^{2s}ds = (e^{2s}−1)/2 → −½`; `∫₀^∞ e^{−2s²}ds = √(π/8)` | agrees |
| §6.1 time separation | Minkowski; minus `(1,0)`; cylinder | `τ(0,(2,0)) = 2`, `τ(0,(1,1)) = 0`; not attained; `∞` | `√4 = 2`; null gives `0`; the maximizer passes through the removed point; loops iterate | agrees |
| §6.4 limit curves | `(s, s/n)`; `(ns, 0)`; null line in `h`-arc length | lengths `√(1−1/n²)s → s`; no uniform limit; `L = 0` | `|(1,1)/√2| = 1`; `−½+½ = 0`; endpoints `(n,0)` unbounded | agrees |
| §7.1 achronal sets | `A = {t=0, |x| ≤ 1}`; `{t = x/2}`; `∂I⁺(0)` | edge `{(0,±1)}`; segment achronal | differences `(Δ/2, Δ)`: `−Δ²/4+Δ² > 0`; near `(0,±1)` timelike curves pass beside `A` | agrees |
| §7.2 domains of dependence | `A` as above; hyperboloid `t = √(1+x²)` | `D⁺ = {0 ≤ t ≤ 1−|x|}`; curve `x = √(t²+1)` misses it | `dx/dt = t/√(t²+1) < 1`; `t² = 1+x² = t²+2` impossible | agrees |
| §7.3 global hyperbolicity; Geroch | AdS `p=(0,0)`, `q=(π+ε,0)`; `(ℝ,−dt²)`; `(S¹,−dθ²)` | diamond contains slice `t = π/2+ε/2`; iff | `∫₀^∞ dr/cosh r = π/2`; `ℝ`: a point is Cauchy, diamonds compact; `S¹`: not causal, no Cauchy set | agrees |
| §7.3 Bernal–Sánchez (Lean) | `t`, `arctan t` on Minkowski | every level set Cauchy | `t` works; `arctan t` is temporal but level `π` is empty, not Cauchy: the statement forces surjectivity, as intended | agrees |
| §7.3 Avez–Seifert (Lean) | Minkowski minus `(1,0)`; endpoints of `Icc` | geodesic of length `τ`; hypothesis needed | sup `2` unattained without global hyperbolicity; `accelerationWithin` on `Icc` with `C²` assumed carries no junk value | agrees |
| §7.4 Galloway–Ling–Sbierski (Lean) | `{t<0}`; Minkowski | completeness must fail on `{t<0}` | `γ(s) = (s−1, 0)` on `(−1,1)`: a global `C²` extension would reach `t = 0`; none, hypothesis false | agrees |
| §7.4 Sbierski (Lean) | `dim F = 0`; `dim F ≥ 1` | no `C⁰`-extension | `dim 0`: image arc has infinite length to each end, a continuous target metric gives finite length; `d ≥ 1`: source theorem | agrees |
| §7.6 determination (Lean) | `D = {t ≥ 0}`, `S = {t=0, x ≥ 0}`; one-point curve; no-minimum case; no Hausdorff hypothesis | `D⁺_D(S) = {x ≥ t ≥ 0} = D⁺_{D'}(S)` | proof followed through each clause of past-inextendibility; uses charts, closedness of `σ⁻¹(S)` and finite dimension, which the signature carries | agrees |
| §7.7 horizons of `C¹` metrics | `−dt²+e^{2|t|}dx²`; `−dt²+(1+t|t|^α)dx²` | `Γ(w,w) = (sgn t·e^{2|t|}w_x², 2 sgn t·w_t w_x)`; `C¹`, not `C^{1,1}` | `Γ^t_xx = ½∂_t g_xx`, `Γ^x_tx = sgn t`; hull at `((0,s),(0,1))` contains `0`; `(1+α)|t|^α` not Lipschitz | agrees |
| §8.2 Raychaudhuri | light cone; flat Robertson–Walker; `σ = [[0,1],[−1,0]]` for `diag(−1,1)` | `θ = 2/r`; `Ric = −3a″/a`; `tr σ² = −2` | `−2/r² = −θ²/2`; `−θ′−θ²/3 = −3a″/a`; `ησ` symmetric, `σ² = −1` | agrees |
| §8.3 Hawking (README and Lean) | Milne, time reversed; `n = 0`; sign of `ν`; Ricci convention | bound `n/|b| = t₀`, attained | `div ∂_t = 1/t`; geodesic on `(0,t₀]` has length `t₀`; `g(grad t, v) = dt(v) > 0`, so `−grad t` is future; `n=0` vacuous | agrees |
| §8.2 locator (C01) | contents of Minguzzi 2019 | "§1.2, pp. 161–163" | §1.2 is on p. 6; §6.2 begins on p. 161 | wrong section number |
| §1.3 identity (C02) | SemiRiemannianFoundations §1.2 at its open head | "Prove `(ker ξ)^⊥ = ℝ ξ^♯`" | the same identity is stated there with its Mathlib lemma | stated twice |

- Source locators checked against the text: about 90 in 13 sources (minguzzi2019 47, minguzzi2019cone 8, chruscielgrant2012 6, gallowaylingsbierski2018 6, gourgoulhon2007 6, minguzzi2015convex 4, chrusciel2011 3, sbierski2018 3, langelytchaksamann2021 3, galloway2004 2, grafling2018, grantkunzingersamannsteinbauer2020 and luoyu2023 1 each); one is wrong (C01). Chruściel's printed pages are the file's pages minus 4, consistently.
- Library declarations opened at the pins: `sigNeg` (Mathlib `LinearAlgebra/QuadraticForm/Signature.lean` line 98, zero in infinite dimension), `LipschitzWith.ae_differentiableAt_real` (`Analysis/BoundedVariation.lean` line 287), `BoundedContinuousFunction.arzela_ascoli`, `Manifold.IsImmersion`, `Manifold.IsSmoothEmbedding`, `EMetricSpace.ofRiemannianMetric`; Tau Ceti `accelerationWithin` (`AlongCurve/Acceleration.lean`), `IsPiecewiseContMDiffOn` (`PiecewisePath.lean` line 73), `ricciTensor` (`Curvature/Ricci.lean` line 65), `isLocallyConstant_sigPos_sigNeg_of_continuous` (`NondegenerateMetric/Signature.lean` line 104), `hasConstantSectionalCurvature_sphere`, `roundMetricCircle`, `OrientationCover`, `nonempty_contMDiffRiemannianMetric`. No Lorentzian, causal or time-orientation declaration exists at either pin, so nothing is restated.
- Cross-roadmap citations resolved: SemiRiemannianFoundations §1.1, §1.2, §2.2–§2.7, §3.1–§3.4, §4.1, §5.1, §5.2 at its open head; RelativisticQuantumFieldTheory §1.1, RiemannianGeometry R2 and R4.7, DifferentialGeometry Layers 2 and 3, HopfRinow (completed), LocalVariationalFieldTheory LVF6 and SpinGeometry on main; SymmetricHyperbolicSystems and CompressibleEulerEquations at their open heads. All are where they are cited. Both Euler roadmaps already cite this roadmap by the new section numbers.
- Dependency check: `depcheck: 111 roadmaps, 1271 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Nothing changes outside the folder.
- Elaboration: `Suggested.lean` gives 0 errors and 8 `sorry` warnings (lines 151, 304, 312, 323, 348, 358, 427, 473), nothing else; no `set_option`, no `sorry` in a definition. One-tactic probe (`simp`, `rfl`, `infer_instance`, `simp_all`) on a copy: none of the eight closes. Elaborated types compared with the README: the definitions drop `[FiniteDimensional ℝ E]` where their types do not mention it, and every theorem carries it, so no statement changes. The automatic checks all passed on this head.
- Headline theorems: Geroch, Bernal–Sánchez, Avez–Seifert, Galloway–Ling–Sbierski, Sbierski, determination (§7.6) and Hawking are stated; Penrose, the two focusing lemmas and the generator theorems of §7.7 are named in the module docstring with the missing carrier. The one further theorem, §1.2 (b), is used in the body of `TimelikeVectorField.setoid` and is not padding.
- Pull request text read against the head: the title, the summary block and the prose use the head's section numbers, list its suppliers and its `Suggested.lean` contents; no sentence is contradicted and no change is left unstated.
- Overlap check: read SemiRiemannianFoundations, CompressibleEulerEquations, CompressibleEulerEquationsPartII, RiemannianGeometry, RiemannianManifoldsWithConvexBoundary, HopfRinow; shared-signature carriers, vector characters, connections, geodesics, immersions and Jacobi fields are SemiRiemannianFoundations'; the acoustical form, causal curves and domains of dependence in a subset, null hypersurfaces and horizons are owned here and cited by both Euler roadmaps; positive-definite objects are RiemannianGeometry's. The one statement made twice is C02.

Source independence: 14 passages compared with 8 sources (the edge of an achronal set, the two domains of dependence, the reverse inequalities, the limit curve theorems, the Filippov condition, the maximal-curve theorems, the extension lemma, four docstrings of `Suggested.lean`), none shared beyond formulas and definitions that can be written one way; largest share minguzzi2019, 40 of about 80 locators; contents compared with minguzzi2019: independent (its chapter on domains of dependence precedes its causal ladder, here the order is reversed; Layers 2 and 4 and §7.4, §7.6, §7.7 have no chapter there, and its chapter 5 has no layer here).

Research link: §7.4 states the `C⁰`-inextendibility theorems of Sbierski (2018) and Galloway–Ling–Sbierski (2018); §7.7 rests on Lange–Lytchak–Sämann (2021) and Graf–Ling (2018); §7.3 and §8.3 state the Bernal–Sánchez (2003–2007) splitting and the Hawking (1967) and Penrose (1965) theorems; §2.3 and §7.6 serve Luo–Yu (2023). Rests on the README's references and the texts read.

## Not verifiable

- `oneill1983`, Theorem 14.55A (§8.3) and `hawkingellis1973`, §6.5, Lemma 6.3.2 and Proposition 6.5.3 (Conventions, §7.1, §7.2) are settled as uncertified and were not read. The length bound `n/|b|` of Hawking's theorem rests on O'Neill alone; Minguzzi 2019, Theorem 6.49, gives incompleteness for a compact contracting hypersurface.
- Geroch 1970, Bernal–Sánchez 2003–2007, Hawking 1967 and 1968, Penrose 1965, Hawking–Sachs 1974, Nomizu–Ozeki 1961, Minguzzi 2008, Filippov 1988 and Joyce have no text in the sources cache; each statement they are cited for also carries a locator that was read, except that every smooth spacelike Cauchy surface is a level set of a Cauchy temporal function (Bernal–Sánchez 2006, §7.3).
- The description of PhysLean and of the Mathlib pull request named under "Prior work and coordination" was not checked against those repositories.

## Source issues

- none

## For the human reviewers

- **Licence.** The README names PhysLean (Apache-2.0) as prior art for Layer 1 (README lines 132–137). Its files were not compared with `Suggested.lean`, whose Layer 1 declarations are one-line predicates on Mathlib bilinear forms (lines 135–147).
