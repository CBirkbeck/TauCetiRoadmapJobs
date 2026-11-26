# Review of SemiRiemannianFoundations (pull request #3176 at 5874876)

**Verdict:** needs changes

**Summary.** The mathematics holds up under computation: every Check, convention witness and sampled locator I recomputed or read is correct, and the second-countable reduction for inextendibility in `Suggested.lean` is true as stated. One finding blocks acceptance. `Suggested.lean` says the Levi-Civita theorem of §2.4 cannot be stated at the pins, but a statement of it elaborates against Mathlib's covariant-derivative API, so the acceptance test leaves out a headline it can state. There are seven small corrections (among them, the finite-dimensional strongness theorem follows in one line from Tau Ceti) and two format notes. The humans have a licence question about one source copy and a scope note about one expository source.

## R01 (P2) — The Levi-Civita theorem of §2.4 is statable at the pins, but `Suggested.lean` calls it unstatable and leaves it out

Because of this, the acceptance test states none of the roadmap's Banach or finite-regularity theorems, and the docstring tells an implementer that a carrier is missing when none is. The module docstring (`Suggested.lean`, lines 23–29) puts "the Levi-Civita connection of a strong `C^k` metric" on its list of headlines that cannot be stated. The reason it gives is that Tau Ceti's Levi-Civita connection is finite-dimensional and smooth. That describes how the library builds the connection, not what the statement needs.

Every carrier the statement uses exists at the pins:

- Mathlib's `CovariantDerivative I E (fun x ↦ TangentSpace I x)` and `CovariantDerivative.ContMDiffCovariantDerivative cov l`, which is graded by `ℕ∞ω` (`Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/Basic.lean:366` and `:412`);
- `VectorField.mlieBracket`;
- the file's own `ContMDiffNondegenerateMetric` and `IsStrong`.

I added the following statement to a copy of the file, and it elaborates at the pins with only `sorry` warnings. Assume `[CompleteSpace E]`, `g : ContMDiffNondegenerateMetric (l + 1)` and `g.IsStrong`. Then there is a `cov` such that:

- `ContMDiffCovariantDerivative cov l` holds;
- `cov Y x (X x) − cov X x (Y x) = VectorField.mlieBracket I X Y x` for fields differentiable at `x`;
- `mfderiv I 𝓘(ℝ) (fun y ↦ g y (Y y) (Z y)) x v = g x (cov Y x v) (Z x) + g x (Y x) (cov Z x v)`. This is Tau Ceti's `IsMetricCompatible` (`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Nondegenerate/Basic.lean:185`) written for this carrier.

In finite dimensions, Mathlib's `cov.torsion = 0` (`.../CovariantDerivative/Torsion.lean:74`, which needs `FiniteDimensional`) can replace the bracket identity. That variant elaborates too.

The smallest change is to add this theorem to `Suggested.lean`, with uniqueness on differentiable fields if wanted (as in Tau Ceti's `IsLeviCivitaConnection.uniqueness`). Then name it in §2.4 and take it off the docstring's list of headlines that cannot be stated.

## C01 — The finite-dimensional strongness theorem follows in one line from Tau Ceti, so as a target it asks for nothing

`isStrong_of_finiteDimensional` (`Suggested.lean`, line 111) is closed by the single term `fun x ↦ ContinuousLinearMap.isInvertible_of_separatingLeft (E := E) (g.nondegenerate x).1`. That lemma is in Tau Ceti at `TauCeti/Topology/Algebra/Module/BilinearForm.lean:149`, and I checked the term on a copy of the file that imports that module. Tau Ceti also states the smooth case, as `TauCeti.Manifold.ContMDiffNondegenerateMetric.isInvertible` (`.../NondegenerateMetric/Musical.lean:58`). Even so, §2.2 (line 273) asks for it to be proved, and the From Tau Ceti contract cites neither declaration. I would cite both under From Tau Ceti. Then either mark the Lean theorem as a sanity check of the carrier, or make it a §2.2 Check.

## C02 — The Banach-level constructions have no source locator

None of these carries a locator:

- §2.4's construction of the Levi-Civita connection of a strong metric on a Banach manifold;
- §3.2's Banach geodesic flow, and the finite-dimensional Peano lemma;
- §2.2's regularity of the inverse metric.

The References give Bruveris for this material, but with no section or theorem number. I would add a locator at each of these targets.

## C03 — §2.3 points to a `C^{1,1}` hypothesis in §3.2 that is not there

Line 342 says that `C^{1,1}_loc` "supplies the `C^{1,1}` metric hypothesis of §3.2". §3.2 has no metric hypothesis. The `C^{1,1}` metric hypotheses are in the last paragraph of §2.4 and in §3.4. I would change "§3.2" to "§2.4 and §3.4".

## C04 — `flat` and `sharp` are not in the file the contract names

From Tau Ceti (line 970) places `flat` and `sharp` in `.../NondegenerateMetric/Musical.lean`. At the pin they are in `.../NondegenerateMetric/Basic.lean` (lines 351 and 361). `Musical.lean` holds `contMDiff_sharp` and `isInvertible`.

## C05 — §2.3's chart-change lemma partly overlaps HolderMapsBetweenManifolds §1.1, and neither roadmap mentions the other

In §2.3 (lines 331–334), chart independence of `C^{k,α}_loc` rests on composing a `C^{k,α}` representative with a `C^∞` diffeomorphism of relatively open subsets of `range I`. For finite-dimensional models, this is the smooth-inner-map case of the local Hölder chain rule on `Set.range I ∩ U`. That chain rule is owned by the open roadmap HolderMapsBetweenManifolds, §1.1, which works with finite-dimensional `E` by its Conventions. I would add one sentence under Scope and ownership: this roadmap owns the Banach-model statement, and its finite-dimensional case is HolderMapsBetweenManifolds §1.1's. That gives the finite-dimensional case one owner.

## C06 — The docstring calls Tau Ceti's covariant acceleration smooth, but it is defined for every connection

Line 27 says that Tau Ceti's covariant acceleration is "finite-dimensional and smooth". `CovariantDerivative.accelerationWithin` (`.../CovariantDerivative/AlongCurve/Acceleration.lean:77`) is defined for every connection on a finite-dimensional `C¹` manifold. I would keep "finite-dimensional" and drop "smooth".

## C07 — The Kunzinger–Steinbauer–Stojković locators are cited for more generality than that paper proves

§3.4 (lines 677–683) cites Kunzinger–Steinbauer–Stojković, Theorems 2.1 and 4.1, next to Minguzzi for locally Lipschitz connections. Kunzinger–Steinbauer–Stojković assume a `C^{1,1}` pseudo-Riemannian metric (KunzingerSteinbauerStojkovic2014 lines 76 and 382). Their Theorem 4.1 gives totally normal neighbourhoods, not convex ones. I would add "for `C^{1,1}` metrics" after that locator.

## N01 — The Summary states no headline theorem with its hypotheses

The opening overview lists topics only. One or two sentences stating, say, §2.4's Levi-Civita theorem and §3.4's `C^{1,1}` Gauss lemma with their hypotheses would let a reader place the roadmap.

## N02 — Three Lean names appear only in prose in the README

`IsStrong`, `isStrong_of_finiteDimensional` and `isInextendible_iff_forall_secondCountable` are described in prose (§2.2, lines 268 and 273; §2.7, lines 500–505) but never named. Naming them there would let a reader match the Lean file to the text.

## Questions for the author

- Can existence and uniqueness of Jacobi fields from initial data, along a geodesic of a smooth finite-dimensional nondegenerate metric, be stated with Tau Ceti's `CovariantDerivative.alongCurveWithin` (`.../AlongCurve/Basic.lean:127`), `leviCivitaConnection` and `curvatureTensor`? I did not elaborate such a statement, so I cannot tell whether the docstring's claim for §5.1 holds.
- Has mathlib4#38194, cited under Prior work, had substantive activity in the last six months? If it has, the repository's rule on deferring to Mathlib would ask Layer 1 to follow the shape of its `IndefiniteMetric`. I did not check that pull request's history.

## Verified sound

| Statement | Instances tried | Values computed (roadmap side / independent side) | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 characters and signature Checks | `diag(−1,−1,1)`; `x₁y₂+x₂y₁` | `b(e₀)=−1`, `b(e₀+e₂)=0`, `b(e₂)=1`; values `−1, 1` on `(e₁∓e₂)/√2`, cross term `0`, so `(1,1)` | true | none |
| §1.2 hyperplane rules | `diag(−1,1,1)` with `dx`, `dt`; `diag(−1,1)` | `dx♯=e₁`, kernel `(1,1)=(p−1,q)`; `dt♯=−e₀`, kernel `(2,0)=(p,q−1)`; null line has `W^⊥=W` | true | none |
| §2.1 trivialised curvature, transport | `Γ = x dy` on `ℝ²` | transport along `(1,s)`: `e^{−s}σ₀`; `R(∂x,∂y)=1−0+0=1`; BL (54) uses (53)'s convention, same as roadmap | true | none |
| §2.2 carrier Checks | weighted `ℓ²`; double null; acoustical | dual norms `1/(j+1)²→0`; `det=−4Ω⁴`; `g(B,B)=−c²`, `g(B,∂ᵢ)=0` | true | none |
| §2.3 Hölder Checks | `t|t|^α`, `t|t|^{1/2}` | derivative `(1+α)|t|^α`, `α`-Hölder, not differentiable at 0; `1+t|t|^α>0` on `(−½,½)` | true | none |
| §2.4 Christoffel and conformal Checks | `−dt²+a²dx²`; `e^{2t}(−dt²+dx²)` | `Γ^t_xx=aa′`, `Γ^x_tx=a′/a`; `∇̂_{∂x}∂x=∂_t`; direct `Γ̂^t_xx=1` | true | none |
| §2.4 headline: Levi-Civita at `C^{l+1}` | probe statement, Banach with `CompleteSpace`; finite-dimensional with Mathlib torsion | both elaborate at pins, `sorry` warnings only | statable | R01 |
| §2.5 curvature Checks | `a=cosh t`, `a=t`; `f=cosh x`; `Λ=3,1` | `R(∂x,∂t)∂t=−(a″/a)∂x`, `K=1,0`; `K=−f″/f=−1`; `Ric=2Λ/(d−2) g` gives `3g`, `2g` | true | none |
| §2.5 constant curvature (BL Thm 8) | dimension 2 | `Ric=(d−1)κg`, `S=d(d−1)κ`; `S=2K=2a″/a` for the `−dt²+a²dx²` check | true | none |
| §2.6 warped-product Checks | base `±dt²`, `f=cosh t`; `f=t` | `K=−cosh t/(cosh t·(±1))=−1,+1`; Milne `K=0`; computed `R(V,X)Y=−f⁻¹Hess f V`, so BL L35(iv) reversed | true (source erratum) | none |
| §2.7 headline: second-countable reduction | `ι(M)∪U` construction; long line; line with two origins | union open, connected, T2, second countable; `ConnectedSpace` gives nonempty; T2 binder excludes non-Hausdorff target | true | none |
| §2.7 Checks | `(ℝ,−dt²)`; identity map | infinite length to each end vs finite length near an endpoint; `range = univ` excluded | true | none |
| §2.2 headline: finite-dimensional strongness | one-term probe | closes by `isInvertible_of_separatingLeft (g.nondegenerate x).1` | padding | C01 |
| §3.1 reparametrisations | `s ↦ s³`; increasing AC homeomorphism | velocity `0` at `s=0`; inverse is AC iff `φ′>0` a.e. | true | none |
| §3.2 predicate and examples | `Γ=(0,−12|x₂|^{1/2}v₁²)`; `Γ=v²` | `x₂=s⁴`: `x₂″=12s²=12|x₂|^{1/2}`; `log(1+ct)=γ₁(ct)`; `c log(1+t)` fails for `c≠1` | true | none |
| §3.2 iff with `IsGeodesicCurveOn` | Tau Ceti `Geodesic/Basic.lean:102` | fields `UniqueDiffOn`, `ContMDiffOn 2`, `accelerationWithin = 0` match README predicate | true | none |
| §3.3 exponential domain | `Γ=v²` on `ℝ` | `γ_v(t)=log(1+vt)`; `exp_0` defined iff `v>−1`; derivative `1` at `0` | true | none |
| §3.4 Gauss lemmas | Minkowski `p=0`; Minguzzi Thm 5 | `q=−t²+x²`, `dq(w)=−2t w_t+2x w_x=2g(P,w)`; source: `q` is `C^{1,1}`, `dq=2g(P,·)` | true | none |
| §3.4 `C^{1,1}` Check | `−dt²+(1+max(t,0)²)dx²` | `K=0` for `t<0`, `K→1` as `t→0⁺`: curvature discontinuous | true | none |
| §4.1 Gauss equation with `ε` | sphere in `ℝ³`; hyperboloid and de Sitter in `ℝ^{1,2}` | `R^Σ=0+1=1`; `0−1=−1`; `K=1`; Gourgoulhon `K=−k` with (2.92) gives `ε=−1` | true | none |
| Conventions: hypersurfaces | hyperboloid in `ℝ^{1,n}`; R5a's `B` | `ε=−1`, `k=h`, `H=n`; `B=−εkν` gives R5a's `B=−gν` on the unit sphere | true | none |
| §5.1 Jacobi Checks | constant `κ`; de Sitter, sphere; Minkowski | `J″=−κg(γ′,γ′)J`; `sinh s`, `sin s` (zero at `π`); `J(1)=∂x` | true | none |
| §5.2 Riccati Checks | `S²`; radial `ℝ³`; `diag(−1,1)` | `θ′=−1−θ²` for `θ=cot r`; `θ′=−2/r²=−θ²/2`; `σ` self-adjoint, `tr σ²=−2` | true | none |
| §2.3 chart change vs HolderMaps §1.1 | finite-dimensional model | HolderMaps §1.1: chain rule on `range I ∩ U`, finite-dimensional `E`; §2.3: Banach | partial overlap | C05 |

- Source locators checked against the text: 18 of them in 5 sources. Minguzzi2019 §1.3 p. 7, Thm 2.4 pp. 26–27, Thm 2.6 p. 27, Prop 6.3 p. 159, p. 160, Prop 6.5 p. 163. BarzenLeymann2026 Lemma 24 (54) p. 42, Thm 8 p. 50, Lemmas 34–36 pp. 61–62. Minguzzi2013Convex Thms 3–5 pp. 11–14. KunzingerSteinbauerStojkovic2014 Thms 2.1 and 4.1, pp. 2 and 10. Gourgoulhon2007 (2.43), (2.92), (2.96), (2.101).
- Mathlib declarations opened at the pin, about 20: `BilinearForm/Orthogonal.lean:132, 240, 246, 267`; `QuadraticForm/Signature.lean:65, 98, 232, 251`; `QuadraticForm/Real.lean:78`; `SmoothEmbedding.lean:70`; `Immersion.lean:802`; `IntegralCurve/ExistUnique.lean:66`; `InverseFunctionTheorem/FDeriv.lean:118, 150`; `CovariantDerivative/Basic.lean:92, 366, 412`; `Torsion.lean:74`; `ArzelaAscoli.lean:113`.
- Tau Ceti: every cited name was found, about 45 of them. Among them: `NondegenerateMetric/Basic.lean:73, 211, 277, 351, 361`; `Musical.lean:58, 113`; `Signature.lean:63–166`; `Restriction.lean:75`; `LeviCivita/Nondegenerate/{Existence:102, 118; Basic:109, 185, 239, 280; Christoffel:248; Regularity:221}`; `Curvature/{Ricci:65; Scalar:64; Bianchi:83, 102; SecondBianchi:127; Schur:213; Einstein:162}`; `Riemannian/Geodesic/{Basic:102; Spray:104; Exponential:98, 104; Normal/Basic:89}`; `Analysis/Holder/{Normed:60; Iterated:98}`.
- Cross-roadmap citations resolved on main: RiemannianGeometry R1.3 (README line 260), R2 (530), R3 (758) and R5a (2260); SmoothBundlesConnections B3.1–B5.2 (lines 1104–1446); PDE §1.7 (1019); LocalVariationalFieldTheory LVF6; HopfRinow Layer 1 (Completed); SpinGeometry and PositiveMass exist. LorentzianGeometry, at the head of its open pull request, cites this roadmap's §§1.1–5.2 as its supplier.
- Dependency check: `depcheck: 113 roadmaps, 1289 edges, 0 problem(s)`. The worker's gate reported every check passed. Nothing changes outside the roadmap folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives two `sorry` warnings (lines 111 and 139) and nothing else. I put `#check @name` for all 10 declarations in one file; each elaborated type matches its README statement, and no section binder is lost.
- Probes on a copy of the file: the one-term proof of `isStrong_of_finiteDimensional` closes it; both Levi-Civita statements elaborate.
- Overlap check: I read LorentzianGeometry, HolderMapsBetweenManifolds, ManifoldOptimization, CompressibleEulerEquationsPartII, RiemannianGeometry, HopfRinow and RiemannianManifoldsWithConvexBoundary.
  - Lorentzian specialisations are owned by LorentzianGeometry, which cites this roadmap.
  - The Riemannian warped-product curvature, Jacobi, index and immersion results are owned by RiemannianGeometry (R1.3, R2–R3, R5a), which this roadmap cites.
  - The finite-dimensional Hölder chain rule is owned by HolderMapsBetweenManifolds §1.1, and the Banach chart-change lemma by this roadmap (C05).
  - Nothing else is shared.

Source independence: 23 passages compared with 5 sources: the 18 verified locators, plus 5 prose passages (vector characters, normal neighbourhood, Riccati identity, `C^{1,1}` Gauss lemma, warped-product metric). Nothing is shared beyond formulas and standard definitions. Largest share: Minguzzi2019, 7 of 16 locators. Contents compared with Minguzzi2019 (a causality review: §1 spacetimes, §2 convex neighbourhoods and causal curves, §6 Riccati and singularity theorems): independent. O'Neill's chapters as the README lists them (2, 3, 4, 7, 10) run parallel to Layers 1, 2, 4, 2.6 and 5, but warped products sit in Layer 2, Layer 3 has no counterpart there, and the *Needs* lines of §4.1 and §5.1 force this order.

Research link: §3.4 states the `C^{1,1}` bi-Lipschitz exponential map and the low-regularity Gauss lemma of Kunzinger–Steinbauer–Stojković (2014) and Minguzzi (2015). These are inputs to current low-regularity causality theory, here consumed by LorentzianGeometry. The strong and weak metrics of §2.2–§2.4 are those of Michor–Mumford (arXiv 2004) and Bruveris (2018). This line rests on the README and the texts read.

## Not verifiable

- O'Neill 1983, Ch. 7, Props 35 and 42 and Cor 43 (§2.6): a book with no legal open copy. The sources service returned none (its arXiv search was rate-limited; the publisher is paywalled). The numbering is corroborated only indirectly, by BarzenLeymann2026's own citations on pp. 61–62.
- Kobayashi–Nomizu 1963, Vol. I, §III.8 (§3.4): a book with no legal open copy; the service returned none.

Automatic checks set aside as false positives: the citation resolver reported that `ContMDiffNondegenerateMetric.toSmoothMetric` (README line 281) occurs nowhere, but this roadmap's own `Suggested.lean` declares it (line 99).

## Source issues

- **Error** in BarzenLeymann2026 at Lemma 35 (iii)–(v), p. 62: the source gives the warping terms with O'Neill's curvature sign, although its own curvature (53), p. 42, is `∇_X∇_Y − ∇_Y∇_X − ∇_[X,Y]`; for example, (iv) gives `R(V,X)Y = +f⁻¹ Hess f(X,Y) V`; it should be `−f⁻¹ Hess f(X,Y) V`, with the signs of (iii) and (v) reversed likewise; affects a stated result.

## For the human reviewers

- Licence: the Minguzzi2019 text (Living Rev. Relativ. 22:3, marked © The Author(s) and open access) was read from the sources cache copy fetched from inspirehep.net, a host outside the project's list of open repositories.
- Scope: BarzenLeymann2026 (arXiv:2606.02616v1) is an expository "guided tour", posted 2026. It is the only located source for §2.1's coordinate curvature formula and for §2.5's constant-curvature identities.
