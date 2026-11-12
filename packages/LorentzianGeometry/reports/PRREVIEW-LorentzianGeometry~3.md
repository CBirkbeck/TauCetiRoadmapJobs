# Review of LorentzianGeometry (pull request #2232 at 14e6374)

**Verdict:** needs changes

## R01 (P3) — The §12.6 determination route uses an unowned existence step and omits a *Needs* item

**Location:** README lines 2025–2027: "or it has a minimum point `q ∈ D \ S`, and on a past-inextendible curve in `U` ending at `q` the segment after the last point of `S` …". *Needs* line 2047.

**Claim:** The route for `futureDomainOfDependenceIn_self` has two gaps.
- Case (b) assumes that some past-inextendible causal curve in `U` ends at `q`. No section, supplier or pinned declaration proves that such curves exist for a continuous metric.
- Case (a) relies on the bullet at lines 1995–1999 ("adding `q` and reparametrizing by auxiliary Riemannian arc length"). That bullet needs a finite `h`-length near `q`, which is §12.4's local length bound, and *Needs* does not list §12.4.

**Witness:** `grep -n inextendible README.md` finds only definitions of inextendible curves (§8.2, line 1337) and no existence result. In case (b), "not past-inextendible in `U`" already provides a nontrivial future causal curve in `U` that ends at `q`.

**Repair:** At lines 2026–2027, replace everything from "or it has a minimum point" to the closing parenthesis with:

"or it has a minimum point `q ∈ D \ S` at which, as the curve is not past-inextendible in `U`, a nontrivial future causal curve `σ` in `U` ends. `σ⁻¹(S)` is closed, so the part of `σ` after its last point in `S` (all of `σ` if it misses `S`) is defined. By concatenation it lies in `D`; it is nontrivial because `q ∉ S`, and it ends at `q`.)"

Append to *Needs* at line 2047: "§12.4 (the local length bound of Galloway–Ling–Sbierski, Lemma 2.1, p. 5)".

## R02 (P3) — Tau Ceti and RiemannianGeometry R1 are cited for each other's results, and one cited Tau Ceti file does not exist

**Location:** README lines 298–299: "the Riemannian warped-product curvature (`.../Curvature/WarpedProd*.lean`)". Lines 682–684: "Schur and Einstein-factor constancy … that RiemannianGeometry R1 states for positive-definite metrics". Line 1219: "RiemannianGeometry R1 for round spheres". Also lines 324, 706 and 1267.

**Claim:**
- The Tau Ceti pin has no file `Curvature/WarpedProd*.lean`.
- Tau Ceti has the warped-product metric and connection. Their curvature is owned by RiemannianGeometry R1.3.
- The Riemannian Schur theorem, the scaling, product and conformal-change laws, and the round sphere's metric and curvature are all in Tau Ceti. RiemannianGeometry cites them and does not state them.

**Witness:** Tau Ceti pin: `Riemannian/WarpedProd.lean`:275, `LeviCivita/WarpedProd.lean`:150, `Curvature/Schur.lean`:213, `Curvature/Conformal.lean`:394, `Curvature/Prod.lean`:124, `Riemannian/Sphere/Basic.lean`:61, `Riemannian/Sphere/Curvature.lean`:209. RiemannianGeometry `README.md` lines 48–62: "already in Tau Ceti … cites them rather than restating them"; line 1042: R1 owns warped-product curvature.

**Repair:**
- Lines 298–299: replace "the Riemannian warped-product curvature (`.../Curvature/WarpedProd*.lean`), whose signature-independent formulas are generalized in §2.5–§2.6" with "the Riemannian warped-product metric `TauCeti.Manifold.IsWarpedProduct` (`TauCeti/Geometry/Manifold/Riemannian/WarpedProd.lean`) with its connection `TauCeti.Manifold.IsWarpedProduct.tangentSpaceProdEquiv_leviCivitaConnection_prodVectorField` (`.../LeviCivita/WarpedProd.lean`), generalized in §2.6; their curvature is RiemannianGeometry R1.3's".
- Lines 682–684: replace "that RiemannianGeometry R1 states for positive-definite metrics, and prove that for positive-definite `g` they agree with R1's" with "that Tau Ceti proves for Riemannian metrics (`CovariantDerivative.hasConstantSectionalCurvature_of_forall_hasSectionalCurvatureAt`, `Bundle.ContMDiffRiemannianMetric.curvatureTensor_leviCivitaConnection_rescale`, `TauCeti.Manifold.tangentSpaceProdEquiv_curvatureTensor_leviCivitaConnection_prod`), and prove that for positive-definite `g` they agree with these".
- Line 706: replace "RiemannianGeometry R1 for the positive-definite comparison" with "these Tau Ceti declarations for the positive-definite comparison".
- Lines 1219 and 1267: replace "RiemannianGeometry R1 for round spheres" (resp. "RiemannianGeometry R1") with "Tau Ceti `TauCeti.sphereRoundMetric` and `TauCeti.hasConstantSectionalCurvature_sphere` for round spheres; RiemannianGeometry R1.3 for warped-product curvature".
- Line 324: replace "R1: curvature identities and the curvature of products, warped products and the round sphere" with "R1: the curvature of warped products (R1.3)".
- Add the seven Tau Ceti declarations named above to `### From Tau Ceti`.

## R03 (P3) — In nine sections, some Checks compute nothing

**Location:** README line 971: "A strong induced tangent metric gives a bounded orthogonal tangent projection." Line 1182: "Minkowski, double-null and acoustical metrics are supplied by the checks of §2.2." Also lines 439, 507–508, 748, 856–857, 972, 1038, 1257 and 1957.

**Claim:** Partly repaired (previous R14). The Checks listed restate their section, point to another section or make a remark. None computes a value or excludes a wrong definition. What remains:
- §3.2 and §4.1 have one computed Check each.
- §1.2, §2.1, §2.7, §5.2, §7.1, §7.3 and §12.5 have two each.

**Witness:**
- Line 972 ("setting `ε = 1` gives the Riemannian specialization") also holds for a Gauss equation with no `ε` at all.
- Line 1957 ("multiplies time separation by the constant factor") gives no value that an unscaled `τ` would get wrong.

**Repair:** Replace these Checks with the following. Each was computed for this review.
- Line 439: "In `diag(−1, 1, 1)` (signature `(2, 1)`), `dx` has `ξ^♯ = e₁` and `ker dx = span(e₀, e₂)` of signature `(1, 1) = (p − 1, q)`; `dt` has `ξ^♯ = −e₀` and `ker dt = span(e₁, e₂)` of signature `(2, 0) = (p, q − 1)`."
- Lines 507–508: "With `Γ = x dy` on the trivial line bundle over `ℝ²`, parallel transport along `s ↦ (1, s)` solves `σ′ = −σ`, so `σ(s) = e^{−s}σ₀`; along `s ↦ (s, 0)` it is constant."
- Line 748: "`(ℝ, −dt²)` has no `C⁰`-extension. Take an isometric embedding into a connected one-manifold with continuous metric `−a(s)² ds²`, `a > 0`. Its image is a proper open arc whose `a`-length is infinite towards each end. A finite endpoint where `a` is continuous gives that end finite length, a contradiction."
- Lines 856–857: "On `ℝ²` with the continuous field `Γ_x(v, v) = (0, −12|x₂|^{1/2} v₁²)`, both `s ↦ (s, 0)` and `s ↦ (s, max(s, 0)⁴)` are geodesics with initial data `(0, e₁)`, since `x₂″ = 12s² = 12|x₂|^{1/2}` for `s > 0`. So the geodesic is not unique." Add also: "For `Γ_x(v, v) = v²` on `ℝ`, the geodesic with `x(0) = 0`, `x′(0) = c > 0` is `log(1 + ct) = γ₁(ct)`: the rescaling law."
- Lines 971–972: "The unit sphere in Euclidean `ℝ³` (`ε = 1`, `k = h`) gets `R^Σ(X, Y, Y, X) = 1`, and the hyperboloid of §9.1 (`ε = −1`, `k = h`) gets `−1`; without `ε` both would get `+1`." Add also: "The timelike cylinder `{x² + y² = r²}` in `ℝ^{1,2}` with outward `ν` (`ε = 1`) has `k(∂_t, ·) = 0` and `k(e_θ, e_θ) = 1/r`. The Gauss equation then gives `R^Σ = 0`, as for the flat induced metric `−dt² + r² dθ²`."
- Line 1038: "Along unit-speed geodesics from a point of the round unit `S²` (`m = 1`, `Ric(u, u) = 1`), `θ = cot r` and `θ′ = −1/sin² r = −θ² − Ric(u, u)`."
- Line 1182: "At `0 < r < 2m` the Schwarzschild formula of §7.2 has diagonal `(−(1 − 2m/r), (1 − 2m/r)^{−1}, r², r² sin²θ)`. Its only negative entry is the `∂_r` one, so it is a `LorentzianMetric` there even though `∂_t` is spacelike."
- Line 1257: "Take `Σ = ℝ`, `c = 1`, `v = 2`. Then `g = −dt² + (dx − 2dt)²` has Gram matrix `[[3, −2], [−2, 1]]` and determinant `−1`. `∂_t` is spacelike while `g(B, B) = −1`, so in supersonic flow `B` orients time and `∂_t` does not."
- Line 1957: "For `ĝ = 4g` on Minkowski `ℝ^{1+1}`, `τ_ĝ(0, (2, 0)) = 4 = 2τ_g(0, (2, 0))`. On the Lorentzian cylinder of §8.3, `τ_ĝ = τ_g = ∞`."

## R04 (P3) — Locators: six sampled targets have none, four O'Neill citations give only a chapter, and one citation is at the wrong regularity

**Location:** §1.2, §2.5, §4.1, §7.1, §7.3 and §9.1 cite no source. "O'Neill, Ch. 5" (lines 890 and 895), "Ch. 7" (715), "Ch. 10" (2136), "Ch. 14" (2191). Line 2085: "(Hawking–Ellis, Prop. 6.5.3, at this regularity)". Line 1760: "Nomizu–Ozeki".

**Claim:** Partly repaired (previous R12).
- Six sampled targets give no locator.
- Four O'Neill citations give only a chapter.
- Line 2085 credits the generator statement for locally Lipschitz metrics to Hawking–Ellis, a text for smooth metrics that does not prove it.

**Witness:**
- minguzzi2019 line 3875 (Theorem 3.24, p. 91) proves the horizon-generator statement for smooth metrics.
- chruscielgrant2012 line 735 (Corollary 1.26, p. 19) transfers to `C^{0,1}` metrics only results without geodesics.
- minguzzi2019 line 431 (Theorem 1.5, p. 10) states Nomizu–Ozeki.

**Repair:**
- Line 2085: "(the locally Lipschitz analogue of Minguzzi 2019, Theorem 3.24, p. 91, by its argument with Chruściel–Grant's limit curves, Theorem 1.6, p. 7, and push-up, Lemma 1.22, p. 17)".
- Line 1760: "Nomizu–Ozeki; Minguzzi 2019, Theorem 1.5, p. 10".
- Line 1177, after "check the signature at one point": "(Tau Ceti's `TauCeti.Manifold.isLocallyConstant_sigPos_sigNeg_of_continuous`)".
- For §1.2, §2.5, §4.1 and §9.1, and for the four chapter-only O'Neill citations, give the numbered lemma, proposition or theorem and its page. `oneill1983` is settled as uncertified, so cite it by locator alone.
- For §7.3, give the locator of the acoustical metric in `christodoulou2007`.

## R05 (P3) — SmoothBundlesConnections is consumed but has no supplier contract

**Location:** `## Exact supplier contracts` (lines 227–351) has no `### From TauCetiRoadmap.SmoothBundlesConnections` subsection. Line 474 says "Use the suppliers from SmoothBundlesConnections B3–B5"; *Needs* line 511; Dependencies line 759.

**Claim:** SmoothBundlesConnections is the only consumed roadmap without a contract. Nothing says which of its sections §2.1 uses, or what it assumes of them.

**Witness:** On main, SmoothBundlesConnections `README.md` has B3.1–B3.3 (lines 871–978), B4.1–B4.2 (979–1071) and B5.0–B5.2 (1072–1209). The description names it as a supplier on main.

**Repair:** After the HopfRinow contract, add:

"### From TauCetiRoadmap.SmoothBundlesConnections (on main)

B3.1–B3.3: principal connections, the Atiyah sequence and induced connections on associated bundles. B4.1: curvature and the exterior covariant derivative. B5.0–B5.2: horizontal lifts, transport and holonomy. §2.1 consumes them for smooth bundles as stated there, and adds the local Banach and finite-regularity extensions."

## Verified sound

| Target | Instances | Roadmap value | Computed or source value | Result |
| --- | --- | --- | --- | --- |
| §1.2 | `diag(−1,1)`, `W = ℝ(1,1)`; `diag(−1,1,1)`, `ξ = dx, dt` | splitting needs nondegenerate `W`; kernels `(p−1,q)`, `(p,q−1)` | `W^⊥ = W`, `W + W^⊥ = W`; `ker dx ≅ diag(−1,1)`: `(1,1)`; `ker dt`: `(2,0)` | sound; R03, R04 |
| §2.1 | `Γ = x dy` on trivial line bundle over `ℝ²` | `R(∂x,∂y) = 1`; transport | `DΓ(∂x)(∂y) = 1`, `DΓ(∂y)(∂x) = 0`; along `(1,s)`: `e^{−s}σ₀` | sound; R03, R05 |
| §2.5 | `−dt² + a²dx²`, `a = cosh t`; `−cosh²x dt² + dx²`; `d = 4, Λ = 3` | `K = 1`; `K = −1`; `Ric = 3g` | `R(∂x,∂t)∂t = −(a″/a)∂x`, `K = (−a″a)/(−a²)`; `K = f″f/(−f²)`; `2Λ/(d−2) = 3` | sound; R02, R04 |
| §2.6 | base `((0,∞), −dt²)`, fibre `(ℝ, dx²)`, `f = t`; `f = e^t` | `K = f″/f` | `0` (Milne); `1` (flat de Sitter slicing); no `Curvature/WarpedProd*.lean` at pin | formulas sound; R02 |
| §2.7 | `(0,1) ⊂ (ℝ, −dt²)`; identity map | extension; not extension | inclusion proper and isometric; `ι(M) = M̃` fails the clause | sound; R03 |
| §3.2 | `Γ = (0, −12\|x₂\|^{½}v₁²)`; `Γ = v²` | predicate without uniqueness; `γ_{cv}(t) = γ_v(ct)` | `(s,0)` and `(s, max(s,0)⁴)` both solve: `x₂″ = 12s²`; `log(1+ct)` | sound; R03 |
| §4.1 | `S² ⊂ ℝ³`; hyperboloid; timelike cylinder in `ℝ^{1,2}` | `R^Σ = R + ε(k(X,X)k(Y,Y) − k(X,Y)²)` | `II = −εkν` derives it; values `1`, `−1`, `0` | sound; R03, R04 |
| §7.1 | `−dt² + t dx²`; Schwarzschild formula, `r < 2m` | Lorentzian iff `t > 0`; index one | `t = −1`: `diag(−1,−1)`; `r < 2m`: one negative entry (`∂_r`) | sound; R03, R04 |
| §7.2 | de Sitter `ℝ ×_cosh S¹`; Schwarzschild base | `K = 1`; `K = 2m/r³` | `cosh″/cosh = 1`; `−F″/2`, `F″ = −4m/r³`; spheres are Tau Ceti's | sound; R02 |
| §7.3 | `c = −1`, `Y = v`; `c = 1`, `v = 2` on `ℝ` | causal iff `\|Y−v\| ≤ \|c\|`; `g(B,B) = −c²` | `g = −1`, `0 ≤ 1`; Gram `[[3,−2],[−2,1]]`, det `−1`, `g(B,B) = −1` | sound (previous R07 repaired); R03, R04 |
| §9.1 | future unit hyperboloid in `ℝ^{1,3}` | constraint `S_Σ + H² − \|k\|² = 0`; Codazzi `= −R(X,Y,Z,ν)` | `−6 + 9 − 3 = 0`; `tan R(X,Y)ν = (∇_X S)Y − (∇_Y S)X`, skew in last pair | sound; R04 |
| §9.4 | `{t=0, \|x\|=r}` in `ℝ^{1,3}`, `ℓ± = ∂t ± ∂r`; `2ℓ+` | `θ± = ±2/r`; `4/r` | `g(ℓ+,ℓ−) = −2`; `tr_S ∇∂r = 2/r`; galloway2004 lines 171–244 (§3, pp. 5–6) | sound |
| §11.1 | Minkowski `0→(2,0)`, `(1,1)`, `(0,1)`; cylinder | `τ = 2, 0, 0`; `∞` | `√4 = 2`; null `0`; unrelated `0`; minguzzi2019 line 1651 (Thm 2.32, p. 39) | sound |
| §11.2 | Minkowski minus a point; cylinder | stably causal, not causally simple; not chronological | chrusciel2011 line 1703 (Prop. 2.7.4, printed p. 40 = PDF 44); minguzzi2019 line 4835 (Prop. 4.18, p. 113) | sound |
| §11.4 | `s ↦ (s, s/n)`; `s ↦ (s/√2)(1,1)` | lengths converge; 1-Lipschitz, `L = 0` | `√(1−1/n²)s → s`; minguzzi2019 lines 2004–2025 (p. 47), 1849 (Thm 2.41, p. 43) | sound; R04 |
| §12.1 | `A = {t=0, \|x\|≤1}`; segment `t = x/2` | `edge = {(0,±1)}`; achronal | `(Δ/2, Δ)`: `−Δ²/4 + Δ² > 0`; minguzzi2019 lines 3243, 3466, 2912, 2591, 3289, 1587, 2085 | sound |
| §12.4 GLS (stated) | Milne; half space `{t<0}`; `(ℝ, −dt²)` | complete + GH ⇒ `C⁰`-inextendible | Milne, half space: GH, incomplete, extendible; `ℝ`: infinite-length ends exclude a proper image | sound; gallowaylingsbierski2018 lines 27, 189, 250, 271, 319, 379 |
| §12.4 Minkowski (stated) | `F = ℝ`; `F = 0` | `IsInextendible 0` | sbierski2018 line 551 (Thm 3.1, p. 13, `d ≥ 1`); `F = 0` by GLS Theorem 1 | sound |
| §12.5 | `ĝ = e^{2t}g`; `ĝ = 4g` | `J⁺` unchanged; `τ_ĝ = cτ_g` | `L_ĝ(0→(1,0)) = e − 1`; `τ_ĝ(0,(2,0)) = 4 = 2·2`; minguzzi2019 line 578 (Cor. 1.13, p. 14) | sound; R03 |
| §12.6 determination (stated) | `U = ℝ^{1+1}`, `S = {t=0, x≥0}`, `D = {x ≥ t ≥ 0}`; point `(0,−1)` in `{t ≥ 0}` | `D⁺_D(S) = D`; one-point curve past-inextendible | past cone meets `t = 0` in `[x−t, x+t] ⊆ [0,∞)` iff `x ≥ t`; `(0,−1) ∉ D⁺` | statement sound; route R01 |
| §12.7 | constant acoustical state; Filippov hull | generators null; LLS definition | `\|Y − v\| = c`; langelytchaksamann2021 lines 254–289 (§3.1, p. 7), line 84 (Thm 1.1, p. 3) | sound; R04 |
| §13.2 | light cone in `ℝ^{1,3}`; flat Robertson–Walker | `θ′ = −θ²/2`; `Ric(∂t,∂t) = −3a″/a` | `θ = 2/r`, `θ′ = −2/r²`; `θ′ + θ²/3 = 3a″/a`; minguzzi2019 lines 6867, 7036, 7156 | sound |
| §13.3 | Milne reversed, `n = 1`; Minkowski sphere | bound `n/\|b\| = t₀`; untrapped | `H = −1/t₀`, geodesic length `t₀`; minguzzi2019 lines 7531 (Thm 6.25, p. 180), 8006 (Thm 6.49, p. 191) | sound; R04 |
| Geroch (stated) | `(ℝ, −dt²)`; `(S¹, −dθ²)` | GH ⇔ Cauchy surface | `{0}` Cauchy, diamonds compact; `S¹`: `J⁺(p) = S¹`, `e^{is}` meets nonempty `S` infinitely often | both sides agree |
| Bernal–Sánchez (stated) | Minkowski `t`; `arctan t` | `∀ a`, level Cauchy | `t` works; `arctan t` temporal, level `{2} = ∅`: forces `t(M) = ℝ`, as minguzzi2019 lines 6210–6216 | sound |
| Avez–Seifert (stated) | Minkowski `0→(2,0)`; minus `(1,0)` | maximizing causal geodesic | `s ↦ (s,0)`, `L = 2 = τ`; minus a point: sup unattained, not GH | sound |
| `neg_of_neg_of_neg` | `u=(1,0), v=(2,1), w=(1,−½)`; `diag(−1,−1,1)`, `e₀, e₀+e₁, e₁` | `b(u,w) < 0` | `−2, −2.5 ⇒ −1`; index two: `−1, −1` but `b(u,w) = 0` | sound; Lorentzian hypothesis needed |

- Gate: the worker's run at 14e6374 is OK. A rerun differs only by `depcheck: NOT IN ORDER: LorentzianGeometry` from the default order, where this roadmap is not yet placed; that is not a finding. Against the candidate order: `depcheck: 206 roadmaps, 1899 edges, 0 problem(s)`. No change outside the folder.
- Elaboration: `lake env lean` gives 0 errors and 7 `sorry` warnings (lines 146, 298, 306, 317, 342, 352, 421). `#check @` on 30 declarations in a scratch copy matches the README statements. The flagged dropped `[FiniteDimensional ℝ E]` is harmless, since `sigNeg = 0` in infinite dimension makes `IsLorentzian` false; no change. The probe `first | rfl | infer_instance | simp` closes none of the 7 theorems.
- Source locators checked against the cached text: 78, all correct (minguzzi2019 44, minguzzi2015convex 7, chruscielgrant2012 6, gallowaylingsbierski2018 6, chrusciel2011 3, sbierski2018 3, langelytchaksamann2021 3, galloway2004 2, kunzingersteinbauerstojkovic2014 2, grafling2018 1, grantkunzingersamannsteinbauer2020 1). The preprint versions match the README's.
- Library declarations opened at the pins: 26 in Mathlib, for example `sigNeg` (`Signature.lean`:98), `exists_isMIntegralCurveAt_of_contMDiffAt` (`ExistUnique.lean`:66, `CompleteSpace`) and `ContMDiffCovariantDerivativeOn` (`CovariantDerivative/Basic.lean`:108); 50 in Tau Ceti. Absent at the pin: `Curvature/WarpedProd*.lean` (R02).
- Cross-roadmap citations resolved. On main: HopfRinow Layer 1 (line 264); RiemannianGeometry R1 (863), R2 (1283), R3 (1511), R4.7 (2320–2363) and R5a (2840); PDE §1.7 (996); LVF6 (1033, 1103); SmoothBundlesConnections B3–B5 (871–1209); DifferentialGeometry Layers 2–3 (1005, 1253); SpinGeometry; PositiveMass. At its open head: RelativisticQuantumFieldTheory §1.1 (README 309; `Suggested.lean` 63, 69, 79, 84).
- Previous review (e8f6039): R01–R11, R13 and R15–R21 are repaired; for example line 212 proves `trans` by `IsLorentzian.neg_of_neg_of_neg`, line 1238 reads "`|Y − v|_h ≤ |c|`", and line 1382 reads "Sbierski 2018, Proposition 2.6, p. 8". R12 and R14 are partly repaired (here R04 and R03). R20's defect recurs for round spheres (here R02).
- Overlap check: read RiemannianGeometry (main; open revisions #2222–#2226 drop no cited id), HopfRinow, RicciFlow, LocalVariationalFieldTheory and RelativisticQuantumFieldTheory. Owners of shared objects: the hyperboloid and `O⁺(n,1)`, R4.7 (cited in §6.2); flat Minkowski `J^±`, RelativisticQuantumFieldTheory §1.1 (cited in §8.3); the nondegenerate Levi-Civita connection, HopfRinow Layer 1 and Tau Ceti; density and divergence, LVF6, whose GlobalDirac takes a time orientation as data without defining it. RicciFlow shares nothing. `roadmaps grep` over main and 434 open heads finds global hyperbolicity, Cauchy surfaces, domains of dependence, trapped surfaces, acoustical metrics and `LorentzianMetric` only here, so this roadmap owns them.

## Not verifiable

- oneill1983, hawkingellis1973, beemehrlicheasley1996 and christodoulou2007 are settled as uncertified, so their chapter and proposition locators were not checked. minguzzi2019 line 2594 ties Hawking–Ellis Prop. 6.3.1 to the hypersurface property, whereas §12.1 cites it for null generators.
- Not in the manifest and not cached: Geroch 1970, Bernal–Sánchez 2003–2007, Minguzzi 2008, Nomizu–Ozeki 1961, Kobayashi–Nomizu Vol. I, Penrose 1965, Hawking 1967, Filippov 1988, Joyce, Bruveris, Michor–Mumford, LeFloch–Mardare.
- Not checked: the PhysLean prior-art sentence (lines 355–357), and the description's "Annals definitions 50 and 51".

## Source issues

- **Misprint** in minguzzi2019 at Theorem 4.120, p. 147: the source gives the lapse β of the metric splitting values in the closed interval from 0 to 1; it should exclude 0 (β > 0), since β = 0 makes −β dt² + h_t degenerate; affects nothing.
