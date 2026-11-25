# Review of LorentzianGeometry (pull request #2232 at 9fead05)

**Verdict:** needs changes

**Summary.** Changes are needed for one sentence: §3.4 asks for convex neighbourhoods of a `C¹` connection whose joining geodesic depends smoothly on its endpoints, and for a `C¹` connection that dependence is only as regular as the connection allows. Everything else that was checked holds: the fifteen sampled targets and the eight `sorry` theorems were recomputed, and every sampled locator was read in its source. There are three small corrections (a citation whose source uses another definition of stable causality, two section pointers in the supplier contracts, and the description of a source's sign convention) and one format note. One question about an unrefereed source is left to the human reviewers.

## R01 (P2) — For a `C¹` connection the geodesic joining two points of a convex neighbourhood does not depend smoothly on the endpoints

In §3.4 (README lines 724–728) the paragraph opens "For a `C¹` connection on a Banach tangent bundle" and asks, in finite dimensions, for a basis of convex neighbourhoods in which any two points "are joined by a unique geodesic in `U`, depending smoothly on the endpoints". An implementer cannot prove this under the stated hypothesis, and §3.3 of the same roadmap gives the flow of a `C^r` connection only `C^r` regularity.

The cited source states the `C¹` conclusion: for a `C¹` connection, `exp` is a `C¹` diffeomorphism from a star-shaped open subset of `TC` onto `C × C` (minguzzi2019 lines 1090–1096, Theorem 2.4, pp. 26–27). A witness that smoothness fails: on `ℝ` take `Γ_x(v, v) = x|x| v²`, which is `C¹` and not `C²`. With `F′ = exp(|x|³/3)`, the geodesics are `t ↦ F⁻¹(at + b)`, so the midpoint of the geodesic from `p` to `1` is `F⁻¹((F(p) + F(1))/2)`. Near `p = 0` this is a smooth function of `F(p)`, and `F‴(x) = 2|x| + O(x⁴)` is not differentiable at `0`, so the midpoint is `C³` and not `C⁴` in `p`.

The smallest change: "depending `C¹` on the endpoints (`C^r` for a `C^r` connection, by §3.3, and smoothly for a smooth one)".

## C01 — The source cited for "stably causal ⇒ strongly causal" defines stable causality differently

§11.2 (README line 1588) defines a stably causal spacetime by a causal metric with strictly wider cones and cites Chruściel, Proposition 2.7.4, p. 40, for the implication to strong causality; §12.3 (line 1757) uses the same locator. That source calls a spacetime stably causal when it has a time function, meaning a differentiable function with timelike past-pointing gradient (chrusciel2011 lines 1699–1703 and 1649), so the proposition proves "a temporal function gives strong causality". To reach the roadmap's statement from it one needs the existence of a temporal function on a stably causal spacetime, which is §11.3 and comes later.

A locator that proves the statement with the roadmap's definition is already in the references: Minguzzi 2019b, Theorem 2.47, p. 59, whose chain contains "stably causal ⇒ strongly causal" for the cone-widening definition (minguzzi2019cone lines 2347–2351, with the definition used at line 3996). Citing it here, or adding "with stable causality defined by a temporal function" to the Chruściel citation, would make the citation match.

## C02 — Two pointers in the supplier contracts name the wrong section

Under "From Mathlib" (README line 2272) "the finite-dimensional Peano lemma is a target of §2.4": the Peano existence lemma is a target of §3.2 (lines 665–668), and §2.4 is the Levi-Civita construction. Four lines below (lines 2276–2277) "§3.2 supplies the strict derivative and approximation estimates for the exponential map": those estimates are the target of §3.4 (lines 743–747). A reader following either pointer finds nothing; the sections to name are §3.2 and §3.4.

## C03 — Barzen–Leymann's curvature tensor has the roadmap's sign; it is their warped-product lemma that carries the opposite one

§2.6 (README lines 533–535) cites Barzen–Leymann, Lemmas 34–36, "whose curvature tensor has the opposite sign", while §2.1 (lines 294–295) cites the same text's Lemma 24, (54), as agreeing with the roadmap's coordinate formula. Both cannot be read literally: the source defines `R(X, Y)Z = ∇_X∇_Y Z − ∇_Y∇_X Z − ∇_[X,Y] Z` (barzenleymann2026 line 1945), the roadmap's convention, and its Theorem 8 is in that convention (lines 2393–2395). Only the formulas of its Lemma 35 are written in the opposite convention (see Source issues). Saying "whose Lemma 35 is written with the opposite sign of the curvature tensor" would tell the implementer exactly what to convert. RiemannianGeometry R1.3 on main has the same phrase.

## N01 — Two sentences left over from an earlier layout

In "Downstream consumers" (README line 2162) "under the scope boundary above" points at the scope section, which now comes below it. Under "From Tau Ceti" (lines 2337–2338) "as whose implementations are generalized" does not parse; "whose implementations are generalized" seems meant.

## Previous findings

- none: the previous review, of `42109b8`, had no finding, no small correction and no format note to repair.

## Verified sound

| Target | Instances | Roadmap value | Computed value | Result |
| --- | --- | --- | --- | --- |
| §1.2 null hyperplanes | `diag(−1,1,1)`: `ξ = dx`, `ξ = dt`; `diag(−1,1)`, `W = ℝ(1,1)` | `ker dx` has `(1,1)`; `ker dt` has `(2,0)`; `W^⊥ = W` | `dx^♯ = e₁`, kernel `span(e₀,e₂)`: `(1,1)`; `dt^♯ = −e₀`, kernel `(2,0)`; `dim W + dim W^⊥ = 2`, sum is `W` | agrees |
| §2.5 curvature and contractions | `−dt² + a²dx²`; `κ` constant; `Λ` in `d = 3, 4` | `K = a″/a`; `Ric = (d−1)κg`; `Ric = 3g`, `2g` | `R(∂_x,∂_t)∂_t = −(a″/a)∂_x`, `K = (−aa″)/(−a²)`; trace `κ(d − 1)`; `2Λ/(d−2) = 3`, `2` | agrees |
| §2.6 warped products | bases `(ℝ, ±dt²)`, fibre `(ℝ, dx²)`, `f = cosh t` | mixed `K = −1` (Riemannian), `+1` (Lorentzian) | `−f″/(f·g(∂_t,∂_t)) = −1` and `+1` | agrees |
| §3.1 reparametrizations | `s ↦ s³`; open interval to bounded | zero velocity at `0`; diffeomorphic to bounded interval | derivative `3s²` vanishes at `0`; `arctan` maps `ℝ` to `(−π/2, π/2)` | agrees |
| §3.2 geodesic flow | `Γ = v²` on `ℝ`; `Γ = (0, −12√|x₂| v₁²)` | `log(1 + ct)`; two geodesics from `(0, e₁)` | `x″ = −c²/(1+ct)² = −x′²`; `(s⁴)″ = 12s² = 12√(s⁴)` | agrees |
| §3.4 Gauss lemma | Minkowski `ℝ^{1+1}`, `p = 0` | `dq = 2g(P, ·)` | `q = −t² + x²`, `dq(w) = −2tw_t + 2xw_x` | agrees |
| §3.4 convex neighbourhoods (R01) | `Γ = x\|x\| v²` on `ℝ` | joining geodesic smooth in endpoints | midpoint `F⁻¹((F(p)+F(1))/2)`, `F‴ = 2\|x\| + …`: `C³`, not `C⁴` at `p = 0` | fails; R01 |
| §5.1 Jacobi fields | constant `κ`; de Sitter timelike; unit sphere | `J″ = −κg(γ′,γ′)J`; `sinh s`; `sin s` | `R(J,γ′)γ′ = κg(γ′,γ′)J` for `J ⊥ γ′`; `J″ = J`; `J″ = −J`, zero at `π` | agrees |
| §6.1 Lorentzian forms | `diag(−1,−1,−1)`; `b = −xy` on `ℝ`; `(2,1)` | not Lorentzian; Lorentzian without null vectors; `−3` | determinant `−1 < 0`, negative definite on planes; `sigNeg = 1`, `b(x,x) = 0` only at `0`; `−4 + 1` | agrees |
| §7.3 acoustical form | `Σ = ℝ`, `c = 1`, `v = 2`; general `c ≠ 0` | Gram determinant `−1`; `g(B,B) = −1`; `g(∂_t,∂_t) = 3` | `[[3,−2],[−2,1]]`: `3 − 4 = −1`; `3 − 8 + 4 = −1`; `g(B,B) = −c²`, `g(B,X) = 0` | agrees |
| §8.2 length | `(s,s)`; `(s,0)` on `[0,2]`; `(2s,0)` on `[0,1]` | `0`, `2`, `2` | `∫√0 = 0`; `∫_0^2 1 = 2`; `∫_0^1 2 = 2` | agrees |
| §9.1 constraints (touches the Hawking convention) | unit hyperboloid in `ℝ^{1,3}`; Codazzi sign | `S_Σ + H² − \|k\|² = 0`; `−R(X,Y,Z,ν)` | `−6 + 9 − 3 = 0`; `g(R(X,Y)ν, Z) = −g(R(X,Y)Z, ν)` | agrees |
| §10.4 affine parameters | `Ω = e^t`, `Ω = exp(−t²)` on the null line `(s,s)` | `ŝ ∈ (−1/2, ∞)`; finite future parameter | `ŝ = (e^{2s} − 1)/2`; `∫_0^∞ e^{−2s²} ds = √(π/8)` | agrees |
| §11.2 causal ladder | Minkowski; Minkowski minus a point; cylinder | causally simple; causally continuous, not simple; not chronological | `J^+(p)` closed; closures of `J^±` are the Minkowski cones minus the point; `p ∈ I^+(p)` | agrees |
| §11.4 limit curves | `(s, s/n)`; `(ns, 0)` on `[0,1]` | lengths `√(1 − 1/n²)s → s`; no convergent subsequence | `√(1 − 1/n²)s`; endpoints `(n, 0)` leave every compact set | agrees |
| §12.1 achronal sets | `A = {t = 0, \|x\| ≤ 1}`; `{t = x/2}` | edge `{(0, ±1)}`; achronal | interior points: curves cross `A`; `−Δ²/4 + Δ² > 0` | agrees |
| §12.5 conformal invariance | `ĝ = 4g`; `ĝ = e^{2t}g` | `τ_ĝ(0,(2,0)) = 4`; length `e − 1` | `2·2 = 4`, not `8`; `∫_0^1 e^s ds = e − 1` | agrees |
| §12.6 domains in subsets | `D = {t ≥ 0}`, `S = {t = 0, x ≥ 0}`; constant acoustical state | `{t ≥ 0, x ≥ t}`; `{x¹ ≥ (v¹ + c)t}` | leftmost past curve reaches `x − t`; `x¹ − (v¹ + c)t ≥ 0`; one-point curve at `(0, x)`, `x < 0`, is past-inextendible | agrees |
| `IsLorentzian.neg_of_neg_of_neg` (§6.2 (b)) | `(1,0)`, `(1,½)`, `(1,−½)`; control `b = −I` on `ℝ²` with `(1,0)`, `(1,1)`, `(−1,2)` | `b(u,w) < 0` | `−1`, `−5/4`, `−1`; control `−1`, `−1`, `+1` | sound; the Lorentzian hypothesis is used |
| `isGloballyHyperbolic_iff_exists_isCauchySurface` | `(ℝ, −dt²)`; circle with `−dθ²`; Minkowski minus a point | both sides agree | both true (`{0}`); both false (a winding curve meets each point repeatedly); both false | sound |
| `exists_cauchyTemporalFunction` | Minkowski with `t`; with `arctan t` | every level set a Cauchy surface | `t`: yes; `arctan t` has empty levels for `\|a\| ≥ π/2`, so the statement selects a surjective function | sound |
| `exists_geodesic_lorentzianLength_eq_timeSeparation` | Minkowski: `q = (2,0)`, `q = (1,1)`; `p = q` | length equals `τ(p,q)` | `2 = 2`; `0 = 0` along the null segment; `p ≠ q` excludes the case with no curve | sound |
| `isInextendible_zero_of_isGloballyHyperbolic` | Milne; `{t < 0}`; `(ℝ, −dt²)` | incomplete ones extend; complete one does not | both incomplete and extendible; arc has infinite length to each end, finite near a boundary point | sound |
| `minkowski_isInextendible_zero` | `F = 0`; `dim F ≥ 1` | inextendible | `F = 0` is `(ℝ, −dt²)`, above; `d ≥ 1` is the source's range (sbierski2018 line 551) | sound |
| `futureDomainOfDependenceIn_self` | proof route, both cases (parameter interval with and without minimum) | `D^+_D(S) = D` | no minimum: limit `q ∈ U ∖ D`, yet concatenation puts `q` in `D`; minimum: `σ` after its last point of `S` lies in `D` | sound |
| `lorentzianLength_le_of_meanCurvature_le` | Milne, time reversed, `n = 1`; dimension one | bound `n/\|b\| = t₀` | `H = −1/t₀`, attained by `t ↦ (t, x₀)`; in dimension one `H = 0`, hypothesis empty | sound and sharp |
| §11.2 citation (C01) | definition in the source | Chruściel proves the implication | source: stably causal means a time function with timelike gradient exists | definition differs; C01 |
| §2.6 sign remark (C03) | flat `(0,∞) ×_r S²` in the source's Lemma 35 (iii) | source's tensor has opposite sign | source's definition (53) is the roadmap's; Lemma 35 (iii) gives the unit sphere `K = −1` in that convention | C03 and a source issue |

- Source locators checked against the text: 80 by number and page in 10 sources, 38 of them read in full (minguzzi2019 44, minguzzi2019cone 8, minguzzi2015convex 7, chruscielgrant2012 6, barzenleymann2026 5, gallowaylingsbierski2018 3, sbierski2018 3, chrusciel2011 2, luoyu2023 1, grantkunzingersamannsteinbauer2020 1); every locator of the fifteen sampled targets that lies in a readable source is among them, and the README flags no locator as unverified.
- Library declarations opened at the pins: 55 names of the supplier contracts, each found under the name and file the README gives; read in full: `sigPos` and `sigNeg` (`Mathlib/LinearAlgebra/QuadraticForm/Signature.lean` lines 65 and 98; `0` in infinite dimension), `CovariantDerivative.curvatureOperator` (`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Basic.lean` line 89, the roadmap's sign), `CovariantDerivative.ricciTensor` (`…/Curvature/Ricci.lean` line 65, `tr(w ↦ R(w,u)v)`), `IsGeodesicCurveOn` (`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Basic.lean` line 102), `IsPiecewiseContMDiffOn` (`TauCeti/Geometry/Manifold/PiecewisePath.lean` line 73), `isLocallyConstant_sigPos_sigNeg_of_continuous` (`…/NondegenerateMetric/Signature.lean` line 104). No Lorentzian, causal or extension object exists in the pinned Mathlib or Tau Ceti.
- Cross-roadmap citations resolved: 9. On main: SmoothBundlesConnections B3.1–B3.3, B4.1, B5.0, B5.2; RiemannianGeometry R1.3, R2, R3, R4.7, R5a; PDE §1.7; LocalVariationalFieldTheory LVF6; DifferentialGeometry Layers 2 and 3; RelativisticQuantumFieldTheory §1.1 (README line 221 there names `Spacetime`, `minkowskiSquare`, `causalFuture`, `causalPast`, and its line 5477 names this roadmap as consumer); HopfRinow Layer 1 (completed). Open: CompressibleEulerEquations and SymmetricHyperbolicSystems, as consumer and as owner of excluded material.
- Dependency check: `depcheck: 124 roadmaps, 1407 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Nothing changes outside the folder.
- Elaboration: `Suggested.lean` gives 0 errors and 8 `sorry` warnings (lines 151, 304, 312, 323, 348, 358, 427, 473), nothing else. Elaborated types compared with the README: the eight theorems keep `[FiniteDimensional ℝ E]` and their own binders; the definitions that drop it (`LorentzianMetric`, `TimelikeVectorField`, `lorentzianLength`, `TimeOrientedLorentzianFieldOn` and its predicates) only become more general, as the Conventions say. One-tactic probe (`rfl`, `simp_all`, `infer_instance`) on a copy: none of the eight closes.
- Automatic checks: every check passed on this head, with the targeted build.
- Overlap check: read CompressibleEulerEquationsPartII, CompressibleEulerEquations, RiemannianGeometry, HopfRinow, RiemannianManifoldsWithConvexBoundary and SymmetricHyperbolicSystems; the acoustical form (§7.3), null hypersurfaces and generators (§9.2–§9.3) and domains of dependence in a subset (§12.6–§12.7) are owned here and cited by both Euler roadmaps; warped-product curvature, Jacobi and immersion objects for positive-definite metrics are RiemannianGeometry's, generalized here with agreement theorems; linear symmetric hyperbolic systems are SymmetricHyperbolicSystems'. No object has two owners, no dropped id, no second copy, no other pull request changes this roadmap. ManifoldOptimization, MinimalSurfaces and the open DifferentialGeometry revision were not read.
- Pull request text read against the head: title, summary block and the four prose paragraphs; the 48 targets (2 + 7 + 4 + 1 + 2 + 3 + 3 + 4 + 4 + 4 + 4 + 7 + 3), the supplier list with RelativisticQuantumFieldTheory on main, the consumer sentence and the lists of stated and not-statable headline theorems all agree with the head.
- Source independence: 26 passages compared with 10 sources, none shared beyond what the mathematics forces (longest run 5 words, in the limit curve statement of §12.7 against chrusciel2011 line 1533); largest share minguzzi2019, 47 of 91 locators; contents compared with minguzzi2019: independent (its Ch. 2 is spread over §3.4 and Layers 8, 10, 11 and 12, its Ch. 4 comes before its Ch. 3 here, and Layers 1–5, 7 and 9 have no counterpart).
- Research link: §12.4 states the `C⁰`-inextendibility theorems of Sbierski (2018) and Galloway–Ling–Sbierski (2018); §12.3 and §13.3 the Bernal–Sánchez (2003–2007) splitting and the Hawking (1967) and Penrose (1965) theorems; §12.6–§12.7 and §7.3 serve Lange–Lytchak–Sämann (2021) and Luo–Yu (2023). Rests on the README's sources and the texts read.

## Not verifiable

- `oneill1983` (Theorem 14.55A; Ch. 7, Propositions 35 and 42, Corollary 43), `hawkingellis1973` (Lemma 6.3.2, Proposition 6.5.3, §6.5), `beemehrlicheasley1996` and `christodoulou2007` are settled as uncertified and were not read; the Milne computation supports the constant and sign of §13.3.
- Kobayashi–Nomizu §III.8, Geroch 1970, the four Bernal–Sánchez papers, Hawking 1967 and 1968, Hawking–Sachs 1974, Penrose 1965, Nomizu–Ozeki 1961, Minguzzi 2008 and Filippov 1988 are cited without a text in the sources cache; they were not read.
- The description's "Annals definitions 50 and 51" names a list that neither the folder nor the repository identifies.
- Locators outside the sample in `galloway2004`, `gourgoulhon2007`, `kunzingersteinbauerstojkovic2014`, `langelytchaksamann2021` and `grafling2018` were not opened.

## Source issues

- **Error** in barzenleymann2026 at Lemma 35 (iii)–(v), p. 62: the source says the fibre and mixed curvature terms of a warped product carry the signs of the convention opposite to its own Definition 43, (53); it should be those formulas with the warping terms negated; affects a stated result.

## For the human reviewers

- **Scope.** `barzenleymann2026` (arXiv:2606.02616) is an unrefereed expository preprint; README lines 295, 496 and 534 cite it for the coordinate curvature formula, constant curvature and warped products, beside O'Neill, which is uncertified. Its Lemma 35 has the sign error recorded above.
