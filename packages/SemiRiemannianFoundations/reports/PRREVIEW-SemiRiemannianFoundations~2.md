# Review of SemiRiemannianFoundations (pull request #3176 at f9c2742)

**Verdict:** accepted

**Summary.** Accepted: no finding. The one blocking finding of the previous review is repaired: `Suggested.lean` now states the existence half of the Levi-Civita theorem of §2.4, and that statement is true as written, including at `l = 0`, on manifolds with corners and without Hausdorff or paracompactness hypotheses. Every Check, convention witness and readable source locator was recomputed or reread and holds. There are two small corrections (the uniqueness half of the Levi-Civita headline is statable in the same vocabulary; Mathlib's own `C¹` Riemannian Levi-Civita connection is not cited) and three format notes, none blocking. Two questions are left for the human reviewers, on one source copy and one expository source.

## C01 — The uniqueness half of the Levi-Civita headline is statable with the same carriers, and the file states only existence

The overview's first headline ends "unique on vector fields differentiable at the base point", and §2.4 asks for uniqueness "on differentiable section germs", for weak metrics too. `Suggested.lean` states `exists_leviCivitaConnection` only, so the acceptance test does not ask an implementer for the half that makes the connection *the* Levi-Civita connection.

I added the following to a copy of the file and it elaborates at the pins with only the `sorry` warning. For `g : ContMDiffNondegenerateMetric k` with `1 ≤ k` (no strongness, no completeness) and two covariant derivatives `cov`, `cov'` that each satisfy the bracket identity and the compatibility identity of `exists_leviCivitaConnection`, one has `cov Y x v = cov' Y x v` whenever `MDiffAt (T% Y) x`. It is true by the Koszul formula at the point `x`, which uses only injectivity of `g x` and the fields constant in the chart at `x`; Tau Ceti proves the smooth finite-dimensional case as `IsLeviCivitaConnection.uniqueness` (`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Nondegenerate/Basic.lean:280`). The author would add it beside the existence statement and name it in §2.4, or say in the module docstring that the uniqueness half is left to the README.

## C02 — Mathlib at the pin already constructs the Levi-Civita connection of a `C¹` Riemannian metric, and neither §2.4 nor the Mathlib contract cites it

§2.4 says "Generalize the existing Koszul construction of HopfRinow Layer 1 to finite order" (line 388), and the Mathlib contract lists for connections only `CovariantDerivative`, `IsCovariantDerivativeOn`, `ContMDiffCovariantDerivative` and the torsion API. A reader concludes that no finite-order Levi-Civita connection exists at the pins. One does: `CovariantDerivative.leviCivitaConnection` with `isLeviCivitaConnection_leviCivitaConnection` and `IsLeviCivitaConnection.uniqueness` (`Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:360`, `:409`, `:256`), for a finite-dimensional manifold of class `C²` whose tangent bundle carries a Riemannian metric of class `C¹` (`IsContMDiffRiemannianBundle I 1`). It has no regularity theorem (its header says so), no indefinite signature and no Banach model, so the target of §2.4 stands.

The smallest change: add these three names to the connections bullet of the Mathlib contract, and one clause to §2.4 that for a positive-definite finite-dimensional metric the connection agrees on differentiable fields with Mathlib's, as Tau Ceti's `isLeviCivitaConnection_ofRiemannianBundle_leviCivitaConnection` (`.../LeviCivita/Nondegenerate/Basic.lean:313`) does for smooth metrics.

## N01 — The four-argument curvature `R(X,Y,Y,X)` of §4.1 is never defined

The Gauss equation (line 767) and its Checks use `R(X,Y,Y,X)`; the Conventions define only `R(X,Y)Z` and `K`. The Checks show `R(X,Y,Z,W) = g(R(X,Y)Z, W)` is meant (the unit sphere gives `+1`); one clause in the Conventions would pin it.

## N02 — §3.4 refers to itself

"with agreement with §3.4 for smooth metrics" (line 717) stands inside §3.4; "with the smooth Gauss lemma above" is what is meant.

## N03 — Four definitions of `Suggested.lean` serve no stated theorem

`IsTimelike`, `IsNull`, `IsCausal` and `toSmoothMetric` appear in neither sorried statement. They have real bodies and are harmless; the author would keep them as the carriers LorentzianGeometry imports by name, or leave them to the README.

## Verified sound

| Statement | Instances tried | Values computed (roadmap side / independent side) | Result | Change |
| --- | --- | --- | --- | --- |
| §2.4 headline `exists_leviCivitaConnection` | `l = 0`; `l = ∞`; corners; `E = 0`; empty `M`; non-Hausdorff `M` | `g` `C¹` gives `Γ` `C⁰`, `σ` `C¹` gives `∇σ` `C⁰`; `∞+1 = ∞`; pointwise chart formula, no partition of unity; `Γ` symmetric gives bracket identity | true | none |
| §2.4 uniqueness half (probe) | weak metric, `1 ≤ k` | Koszul at `x` with chart-constant fields; injectivity of `g x` suffices; probe elaborates | statable | C01 |
| §2.4 one-tactic probe | `simp`, `rfl`, `infer_instance`, anonymous constructor | all fail; Mathlib's Levi-Civita needs `RiemannianBundle`, `FiniteDimensional` | not padding | C02 |
| §2.7 headline second-countable reduction | `ι(M) ∪ U`; `dim E = 0`; line with two origins | union open, connected, T2, second countable, universe `u`; dimension 0: no extension either side; T2 binder present | true | none |
| §2.7 one-tactic probe | `simp`, `rfl`, `tauto`, `aesop` | all fail, reverse direction needs the construction | not padding | none |
| §1.1 characters, signature | `diag(−1,−1,1)`; `x₁y₂+x₂y₁` | `−1, 0, 1` on `e₀, e₀+e₂, e₂`; values `−1, 1`, cross term `1−1 = 0`: `(1,1)` | true | none |
| §1.2 hyperplanes | `diag(−1,1,1)`, `dx`, `dt`; null line in `diag(−1,1)` | `dx♯ = e₁`, kernel `(1,1) = (p−1,q)`; `dt♯ = −e₀`, kernel `(2,0) = (p,q−1)`; `W^⊥ = W` | true | none |
| §2.1 curvature in a trivialisation | `Γ = x dy` | antisymmetrised `∇∇`: `DΓ(u)(v) − DΓ(v)(u) + [Γ(u),Γ(v)]`; `R(∂x,∂y) = 1`; transport `e^{−s}σ₀` | true | none |
| §2.2 carrier Checks | double null; acoustical; weighted `ℓ²` | `det = −4Ω⁴`; `g(B,B) = −c²`, `g(B,∂ᵢ) = 0`; dual norms `1/(j+1)² → 0` | true | none |
| §2.3 Hölder Checks | `t|t|^α`; `t|t|^{1/2}` | derivative `(1+α)|t|^α`; `(3/2)|t|^{1/2}`, constant `3/2`; `1 + t|t|^α > 0` on `(−½,½)` | true | none |
| §2.4 Christoffel, conformal Checks | `−dt²+a²dx²`; `e^{2t}(−dt²+dx²)` | `Γ^t_xx = aa′`, `Γ^x_tx = a′/a`; formula `∂_t`, direct `Γ̂^t_xx = −½(−e^{−2t})(2e^{2t}) = 1` | true | none |
| §2.5 curvature Checks | `a = cosh t`, `a = t`; `f = cosh x`; `Λ = 3, 1` | `R(∂x,∂t)∂t = −(a″/a)∂x`, `K = a″/a = 1, 0`; `K = −1`; `Ric = 2Λ/(d−2) g = 3g, 2g` | true | none |
| §2.5 constant curvature | trace of `w ↦ κ(g(u,v)w − g(w,v)u)` | `Ric = (d−1)κ g`, `S = d(d−1)κ`; source Theorem 8 same | true | none |
| §2.6 warped Checks | base `±dt²`, `f = cosh t`; `f = t` | `K = −f″/(f·g(∂t,∂t)) = −1, +1`; Milne `0`; `ℝ⁺ ×_r S^{n−1}` flat fixes sign of fibre term | true | none |
| §3.1 reparametrisations | `s ↦ s³` | velocity `3s² = 0` at `0`; inverse absolutely continuous iff `φ′ > 0` a.e. | true | none |
| §3.2 pregeodesic, Checks | `ψ″ = fψ′`; `Γ = (0, −12|x₂|^{1/2}v₁²)`; `Γ = v²`; two origins | `ψ′ = exp∫f > 0`; `x₂″ = 12s²`; `x″ = −c²/(1+ct)² = −x′²`; geodesics differ only at `s = 1` | true | none |
| §3.3 exponential | `Γ = v²` on `ℝ` | `exp₀(v) = log(1+v)`, domain `v > −1`, derivative `1` at `0` | true | none |
| §3.4 Gauss lemmas (sample-adjacent headline) | Minkowski, `p = 0`; `a² = 1 + max(t,0)²` | `dq(w) = −2t w_t + 2x w_x = 2g(P,w)`; `K = 1/a⁴ → 1` at `0⁺`, `0` for `t < 0` | true | none |
| §4.1 Gauss equation | sphere; hyperboloid; de Sitter surface; `B = −εkν` | `g(B(X,X),B(Y,Y)) = εk k`; values `1, −1, 1`; R5a's sphere `B = −⟨X,Y⟩ν` agrees | true | N01 |
| §5.1 Jacobi | constant `κ`; de Sitter; sphere | `R(J,γ′)γ′ = κ g(γ′,γ′)J`; `J″ = J`: `sinh s`; `J″ = −J`: `sin s`, zero at `π` | true | none |
| §5.2 Riccati | derivation; `S²`; `ℝ³`; `diag(−1,1)` | `(∇_u B)X = −R(X,u)u − B²X`; `−1/sin² = −cot² − 1`; `−2/r² = −θ²/2`; `ησ` symmetric, `tr σ² = −2` | true | none |
| Conventions: hypersurfaces | hyperboloid in `ℝ^{1,n}` | `g(x,x) = −1`, `∇_X ν = X`, `k = h`, `H = n`; mean-curvature vector `−ε(H/m)ν` | true | none |

- Source locators checked against the text: 20 in 6 sources. Bruveris2018 line 394 (§2.3, formula (1), p. 9) and line 422 (§2.5, p. 9); KunzingerSteinbauerStojkovic2014 lines 76 and 382 (Theorems 2.1, 4.1, pp. 2, 10); Minguzzi2013Convex lines 460, 500, 561 (Theorems 3–5, pp. 11, 12, 14); Minguzzi 2019 §1.3 p. 7, Theorems 2.4 and 2.6 pp. 26–27, Proposition 6.3 p. 159, Wronskian p. 160, Proposition 6.5 p. 163; Barzen–Leymann Lemma 24 (54) p. 42, Theorem 8 p. 50, Lemmas 34–36 pp. 61–62; Gourgoulhon (2.43), (2.92), (2.96), (2.101), pp. 24, 35, 36.
- Mathlib declarations opened at the pin: `ContDiff/Operations.lean:870`; `ODE/ExistUnique.lean:57, 252`; `ArzelaAscoli.lean:113`; `VectorField/LieBracket.lean:70`; `IntegralCurve/ExistUnique.lean:66`; `BilinearForm/Orthogonal.lean:132, 267`; `QuadraticForm/Signature.lean:232`, `Real.lean:78`; `SmoothEmbedding.lean:70`; `CovariantDerivative/Basic.lean:92, 366, 412`, `Torsion.lean:71–74` (finite-dimensional), `LeviCivita.lean:202, 256, 360, 409`.
- Tau Ceti declarations opened at the pin: `AlongCurve/Acceleration.lean:64, 77` and `AlongCurve/Basic.lean:87, 127` (finite-dimensional, as the docstring says); `Curvature/Tensor.lean:43, 152`; `NondegenerateMetric/Basic.lean:73, 211, 277, 351, 361`; `Musical.lean:58`; `LeviCivita/Nondegenerate/Basic.lean:185, 239, 280, 313`; `Topology/Algebra/Module/BilinearForm.lean` (`isInvertible_of_separatingLeft`); `Riemannian/Geodesic/{Basic:102, Spray:104, Exponential:98, 104, Normal/Basic:89}`; `Analysis/InnerProductSpace/SecondFundamentalForm.lean:82`.
- Cross-roadmap citations resolved on main: RiemannianGeometry §1.3 (its R1.3, line 260, warped formulas line 289), R2 (530), R3 (758), R5a (2260, second fundamental form 2311); SmoothBundlesConnections B3.1–B5.2 (1104–1446); PDE §1.7 (1019); LocalVariationalFieldTheory Layer 6 (950, ownership of the divergence 1020); HopfRinow Layer 1 (completed, 264). LorentzianGeometry at its open head cites §§1.1–5.2 of this roadmap and hands it the shared objects.
- Dependency check output: `depcheck: 100 roadmaps, 1123 edges, 0 problem(s)`; no UPWARD or CYCLE line. The automatic checks all passed. Nothing changes outside the roadmap folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives two `sorry` warnings (lines 127 and 163) and nothing else. `#check @name` for all 10 declarations in one file: each elaborated type matches its README statement; `exists_leviCivitaConnection` keeps `[CompleteSpace E]`, and `IsExtension`, `IsInextendible` and the reduction keep `[FiniteDimensional ℝ E]`; nothing changed.
- Previous review: R01 repaired ("states the existence half of the first of these theorems"); C01 repaired (theorem removed, both Tau Ceti lemmas cited in §2.2 and the contract); C02 repaired (Bruveris §2.3 and §2.5, Mathlib inversion, Picard–Lindelöf and Arzelà–Ascoli names); C03 repaired ("hypotheses of §2.4 and §3.4"); C04 repaired (`flat`, `sharp` under `Basic.lean`); C06 repaired ("assume a finite-dimensional model"); C07 repaired ("for `C^{1,1}` metrics, Kunzinger–Steinbauer–Stojković"); N01, N02 repaired. C05 not taken up and not raised again: this roadmap is the earlier one, so the citation is HolderMapsBetweenManifolds' to make.
- Overlap check: read LorentzianGeometry, CompressibleEulerEquations, CompressibleEulerEquationsPartII, ManifoldOptimization, HolderMapsBetweenManifolds, RiemannianGeometry, HopfRinow, RiemannianManifoldsWithConvexBoundary. Lorentzian specialisations: LorentzianGeometry (cites this roadmap). Riemannian warped-product curvature, Jacobi, index and immersion objects: RiemannianGeometry (cited here). Flow of a locally Lipschitz connection: this roadmap (CompressibleEulerEquationsPartII cites §3.1–§3.3). Finite-dimensional Hölder chain rule: HolderMapsBetweenManifolds §1.1; Banach chart change of §2.3: this roadmap. Nothing else shared.

Source independence: 26 passages compared with 6 sources (the 20 locators and 6 prose passages: weak-metric remark, strongness, vector characters, low-regularity Gauss lemma, Riccati identity, the Levi-Civita docstring), none shared beyond formulas and standard definitions; largest share Minguzzi 2019, 7 of 18 locators; contents compared with Minguzzi 2019 (Introduction, preliminaries, domains of dependence, causal ladder, Lorentzian distance, geodesic congruences): independent. O'Neill's text and contents could not be read.

Research link: §3.4 states the bi-Lipschitz exponential map and low-regularity Gauss lemma of Kunzinger–Steinbauer–Stojković (2014) and Minguzzi (2015), inputs of low-regularity causality theory, consumed by LorentzianGeometry; §2.2–§2.4 use the strong and weak metrics of Bruveris (2018) and Michor–Mumford. Rests on the README and the texts read.

## Not verifiable

- O'Neill 1983, Ch. 7, Propositions 35 and 42 and Corollary 43 (§2.6): a book with no legal open copy; corroborated only by Barzen–Leymann's own citation of Ch. 7, Cor. 43, at their Lemma 36.
- Kobayashi–Nomizu 1963, Vol. I, §III.8 (§3.4): a book with no legal open copy.
- Barzen–Leymann Lemma 24: the extraction shows formulas (53) and (54) and the page; the lemma's hypothesis line is an image and was not read.

Automatic checks set aside as false positives: the citation lead list reported four names of §2.2, §2.4 and §2.7 (`IsStrong`, `exists_leviCivitaConnection`, `isInextendible_iff_forall_secondCountable`, `toSmoothMetric`) as found nowhere; all four are declared in this roadmap's own `Suggested.lean`.

## Source issues

- **Error** in BarzenLeymann2026 at Lemma 35 (iii)–(v), pp. 61–62: the source says the warping terms carry O'Neill's signs, for instance (iv) gives `R(V,X)Y = +f⁻¹ Hess f(X,Y) V`, under its own curvature (53); it should be `−f⁻¹ Hess f(X,Y) V`, with (iii) and (v) reversed likewise; affects a stated result.

## For the human reviewers

- Licence: Minguzzi 2019 (Living Rev. Relativ. 22:3, open access) was read from a cached copy fetched from inspirehep.net, a host outside the project's list of open repositories.
- Scope: Barzen–Leymann (arXiv:2606.02616v1, 2026) is an expository "guided tour"; it is the only located source for §2.1's coordinate curvature formula and §2.5's constant-curvature identities.
- Not tested: O'Neill 1983 is named for five chapters in the References and located once; its text and table of contents could not be read, so wording and arrangement were not compared with it.
