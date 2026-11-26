# Review of MarkovDiffusionOperators (pull request #3148 at 5e13b1a)

**Verdict:** needs changes

**Summary.** Changes are needed for one reason: Layer 11 plans Prékopa's theorem as a target this roadmap owns, and the pinned Tau Ceti already proves it in greater generality. Every identity, Check and worked example I recomputed is correct, the four findings of the previous review are repaired, and `Suggested.lean` elaborates with `sorry` as its only warning. There are three small corrections and five format notes, none blocking. The main source [BGL] still could not be read legally, so its locators and its table of contents were not checked; that, a licence question and the library pin are left for the human reviewers.

## R01 (P2) — Prékopa's theorem is planned and owned in Layer 11, and the pinned Tau Ceti already proves a more general form

The last item of Layer 11 (README line 259) is a target: for smooth jointly convex `W` on `ℝᵐ × ℝᵈ` with `∇²_x W` positive definite and an integrability hypothesis on `W` and its derivatives, `t ↦ −log ∫ e^{−W(t, x)} dx` is convex. The Scope section lists "Prékopa's theorem (Layer 11)" among what the roadmap owns (line 285) and the guide to the layers says Layer 11 proves it (line 17). An implementer would formalise a theorem the library has, under hypotheses the library does not need.

The pinned Tau Ceti has `TauCeti.LogConcave.lintegral_prod_right` (`TauCeti/MeasureTheory/Integral/PrekopaLeindler.lean`, line 397): for a measurable log-concave `f : E × F → ℝ≥0∞` and a measure `ν` on `F` with the Prékopa–Leindler property at every weight, `x ↦ ∫⁻ y, f (x, y) ∂ν` is log-concave, with no smoothness, no strict convexity and no finiteness of the integrals. `TauCeti.hasPrekopaLeindler_volume` (same file, line 372) gives the property for Lebesgue measure on every finite-dimensional real inner product space. With `f = e^{−W}` this is the statement of line 259 for every measurable convex `W`. The README cites neither declaration.

The smallest change: name the two declarations under "From Tau Ceti" and in Scope as the owner of Prékopa's theorem, and remove it from the list of what this roadmap owns. The item itself can stay if it says how it differs, as the Gibbs inequalities of Layer 9 do: it is the derivation from the Brascamp–Lieb inequality, and what it adds to the library is the quantitative statement, `∂²_s(−log ∫ e^{−W}) = E[∂²_s W] − Var(∂_s W) ≥ E[∂²_s W − ⟨(∇²_x W)⁻¹ ∇_x ∂_s W, ∇_x ∂_s W⟩] ≥ 0`. Stating that inequality as the target, with the convexity as a corollary that agrees with the library's theorem, would do.

## C01 — The description of the pull request describes an earlier head

"`Suggested.lean` builds with five `sorry`s. It uses `import all` of GaussianIsoperimetryAndClusters' `Suggested.lean`" is no longer true: the file has ten `sorry`s (the fundamental identity, the integrated `Γ₂` identity, the integrated `CD` inequality, Bobkov implies log-Sobolev, and six Gibbs statements including Brascamp–Lieb), imports `Mathlib` and `TauCeti.Probability.Quantile` only, and restates the two-line profile. "A roadmap-for-a-roadmap table" is now a list of six subjects. The description also leaves out three relations the README now states: the semigroup of OptimalTransport §11.9 (a different construction, identification not claimed), OrnsteinUhlenbeckSemigroup (owner of the kernel semigroup, Mehler's formula and the Hermite eigenfunctions) and LogConcaveFunctionalInequalities (owner of the Gibbs Poincaré and logarithmic Sobolev inequalities, proved here a second time).

Text that would be right: "`Suggested.lean` builds with ten `sorry`s; it imports `Mathlib` and `TauCeti.Probability.Quantile` and restates the Gaussian isoperimetric profile of GaussianIsoperimetryAndClusters §1.1", with one sentence naming the three roadmaps above.

## C02 — Two sentences of the README describe an earlier state of the files

In Layer 10 (line 231) the profile is "owned by GaussianIsoperimetryAndClusters §1.1, whose `Suggested.lean` defines `gaussianIsoperimetricProfile` … and which `Suggested.lean` here imports". The file imports no file of that roadmap, and the supplier contract (line 344) says so. In "Downstream consumers" (line 272), "the future roadmaps of the table below" points at a table that is now a list. Replace the first by "which `Suggested.lean` here restates", and "table" by "list".

## C03 — The Ornstein–Uhlenbeck identification uses another roadmap's semigroup that no `*Needs:*` line or supplier contract names

The target of the Ornstein–Uhlenbeck item of Layer 9 (line 210) is `P_t = Q_t` on `L²(γ)`, where `Q_t` is the kernel semigroup of OrnsteinUhlenbeckSemigroup §1.1 (its `ouSemigroup`, in Mehler form). The `*Needs:*` line of Layer 9 (line 227) and the supplier contracts list Mathlib, Tau Ceti, PDE, OperatorTheory and GaussianIsoperimetryAndClusters, but not that roadmap, so the dependency is visible only in the prose and in Scope. Add "OrnsteinUhlenbeckSemigroup §1.1 (the kernel semigroup)" to the `*Needs:*` line and a short "From TauCetiRoadmap.OrnsteinUhlenbeckSemigroup" entry saying what is assumed of `Q_t` (the semigroup law and the Mehler form; the strong continuity on `L²(γ)`, the symmetry and the backward equation on `C_c^∞(ℝᵈ)` are either cited from its §§1.3 and 2.1 or proved here, and the item should say which). Since that roadmap is still an open pull request, the description should name it as a dependency.

## N01 — Seven passages cite a roadmap by its pull-request number

"pull request #2775" and "pull request #2778" appear in Layer 9 (lines 210, 218), Downstream consumers (line 272), Scope (lines 292, 293) and the list of future roadmaps (lines 311, 312). A reader after the merge cannot use the numbers; the roadmap's name and section are enough.

## N02 — One bullet of the Gibbs item has lost its indentation

The bullet "Bounded Lipschitz functions are in `𝒟(ℰ)`" (line 216) starts at the margin, so it closes the Gibbs item and the two bullets after it render as a separate list.

## N03 — The supplier contract narrates the state of the library

"are assumed from Tau Ceti `main`, not from the pinned commit" (line 330) and "because the pinned Tau Ceti does not contain it" (`Suggested.lean`, line 40) will be out of date after the next change of pin. The declarations concerned are absent at the pinned commit and present on the library's main branch, as the README says; four of them (`gaussianIsoperimetricProfile_cdf` and three others, line 335) are written without their namespace `TauCeti.Probability`.

## N04 — [HelfferSjostrand] is cited without a locator

The Helffer–Sjöstrand representation of Layer 11 (line 253) cites the article as a whole; the other references of that layer now carry a theorem or a page.

## N05 — `gibbsMeasure` could be Mathlib's tilted measure

`Suggested.lean` (line 200) builds `μ_V` as a normalised `withDensity`. Mathlib has `MeasureTheory.Measure.tilted` (`Mathlib/MeasureTheory/Measure/Tilted.lean`, line 42), and LogConcaveFunctionalInequalities defines its `gibbsMeasure V` as `volume.tilted (−V)`. The README says the two roadmaps prove the same inequalities for the same measure; with the same definition the two statements would match without a lemma. Offered, not required.

## Questions for the author

- Layer 11 cites "[Hörmander, Theorem 2.2.1]" for the proof of the Brascamp–Lieb inequality. Is that theorem (an existence theorem with weighted `L²` estimates for `∂̄`, as far as I remember the article) cited as the origin of the method, or for the real statement used here? I could not read the article: the open copy I reached had no text.
- Layer 6 says that [BGL, Theorem 3.3.23] states the finiteness of `μ` without ergodicity, and Layer 10 that [BGL, Theorem 8.5.3] is stated for `f ∈ A₀`. The authors' errata of February 13, 2024 has no entry for either theorem (its entries pass from page 158 to page 170, and from page 373 to page 425), which agrees with what the README says of it. Does a standing convention of the book at these theorems (a standard or full triple) supply ergodicity, or the constants? The book itself could not be read.

## Verified sound

Previous findings, at this head: R01 (Brascamp–Lieb absent from `Suggested.lean`) repaired: `gibbs_brascampLieb` (line 276) and the docstring's "Not stated, because each needs the Markov semigroup of Layer 2 and the full triples". R02 (OptimalTransport §11.9) repaired: "OptimalTransport §11.9 constructs … The semigroup here is a different construction … The identification of the two … is not a target" (line 219) and Scope line 291. R03 (open owners) repaired: lines 210, 218, 292, 293 name OrnsteinUhlenbeckSemigroup and LogConcaveFunctionalInequalities with their sections. R04 (future roadmaps keyed to the book's chapters) repaired as far as it can be checked: no chapter or section number remains in lines 304–314; the comparison with the book's contents could not be made. C01 repaired (`CD` is used by `CD.integral_le`, `Bobkov` by `Bobkov.logSobolevInequality`); C02 repaired (no `IsClosed` hypothesis, README "for every `A ⊆ ℝᵈ`"); N01 repaired (no import of another roadmap); N02 partly (see N03); N03 repaired except [HelfferSjostrand]; N04 repaired.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Diffusion triple | `μ = 0`; null `h ∈ A₀`; `k = 0` | `μ = 0` finite, not probability: excluded. `∫Γ(h) = −∫hLh = 0`, so `Γ(h, g) = 0` a.e. `k = 0`: `ψ ≡ 0 ∈ A₀` | sound; locator not read | none |
| 1.2 Fundamental identity | defect `F` against `h`; circle `cos`; two-point chain `f = 1_{1}` | `∫hF`: six terms cancel to `0`. Circle: both sides `−2cos 2x`. Chain: `Γ(f², f) = ½`, `2fΓ(f) = f ∈ {0, 1}` | sound | none |
| 1.2 Linearity of `L` | `D = L(f+f') − Lf − Lf'` | `∫gD = 0` for `g ∈ A₀`, `g = D` gives `D = 0` a.e.; no density needed | sound | none |
| 2.1 Closed form | `f` null in `A₀`; circle | `∫gLf = −∫Γ(f,g) = 0`, `g = Lf`: `Lf = 0` a.e. `ℰ(cos kx) = k²/2` | sound; locator not read | none |
| 2.2 Generator, semigroup | shift `−1`; `sup λe^{−λt}` | pinned `expShift λ = e^{−λt}S(t)`; form semigroup `e^{−t(1−L)}`; product `P_t`. `‖LP_tu‖ ≤ ‖u‖/(et)` | sound | none |
| 2.3 Sub-Markov, `Lᵖ` | convex `φ`, `φ(0) = 0`; heat kernel | supporting lines `αa + β` have `β ≤ 0`, so Jensen holds with `P_t1 ≤ 1`. Kernel `(4πt)^{−1/2}e^{−x²/4t}` for `d²/dx²` | sound | none |
| Layer 3 long-time limit, finite measure | Cauchy identity; `1` under ESA; interval `(0,1)` | `‖P_tf − P_sf‖² = a_t + a_s − 2a_{(t+s)/2} → 0`. `⟨1, Lf⟩ = ∫Lf = 0`, so `1 ∈ 𝒟(L*) = 𝒟(L)`. Interval: `∫f'' = 0`, Dirichlet `P_t1 ≠ 1` | sound | none |
| 4.1 Extended algebra; ESA cutoff | `g = ζ²u` | `λ∫ζ²u² = −∫ζ²Γ(u) − 2∫ζuΓ(u,ζ) ≤ ∫u²Γ(ζ) ≤ ‖u‖²/k` | sound; F3 agrees with BGL-Errata line 102 | none |
| 4.2 `Γ₂`, Hessian, `CD(ρ, n)` | `ℝ`, `L = d²`; `ℝᵈ`; OU `f = x`; `n = ∞` | `H(g)(h,f) = g''h'f'`; `(hf)''g'' = hf''g'' + fh''g'' + 2h'f'g''`. `‖∇²f‖² ≥ (Δf)²/d`. OU: `1 ≥ ρ + x²/n` fails. `(⊤⁻¹).toReal = 0` | sound; Hessian formula agrees with BGL-Errata line 108 | none |
| `integral_gammaTwo`, `CD.integral_le` | `f ∈ A₀` | `½∫LΓ(f) = 0`, `−∫Γ(f, Lf) = ∫(Lf)²`; then `ρ∫Γ + n⁻¹∫(Lf)² ≤ ∫(Lf)²` | sound; neither closes in one tactic | none |
| `CD` on `A₀` extends to `A` | `F = ψ(u_k)f`, `ψ = 1` on `[¼, ∞)` | on `{u_k > ¼}`: `Γ(F) = Γ(f)`, `LF = Lf`, `LΓ(F) = LΓ(f)`; all other terms carry `ψ'`, `ψ''` or `ψ'''` of `u_k` | sound | none |
| Headline: gradient bounds, mass conservation | `ℝ`; OU; `ℝ × ℕ` | `∂ₓP_tf = P_tf'`; OU `e^{−t}P_tf'`. Example: `c_i − c` Schwartz forces `c_i = c` (F9), `μ = ∞`, `L1_{copy} = 0` | sound | none |
| Headline: `Γ₂` on `𝒟(L)`, converse | OU `f = x`; `n < ∞` | `Γ₂ = 1 = ∫x²dγ`. `(Lf)² ≤ n(Γ₂ − ρΓ)` gives `Lf ∈ L²` | sound | none |
| Headline: Poincaré, log-Sobolev under `CD(ρ, n)` | integrated `CD`; `S^{d−1}`; `S²`; OU `e^{ax/2}`; interval | `ℰ ≤ ((n−1)/(ρn))‖Lf‖²`; `(d−2)/((d−2)(d−1)) = 1/(d−1)`; `S²`: `½`; `Ent = 2ℰ = (a²/2)e^{a²/2}`; `Var ≤ ∫f² ≤ π⁻²∫f'²` | sound | none |
| Layer 8 criterion | `Λ(t) = Ent(P_tf)`; `f = c + h²` | `Λ'' ≥ −(2/C)Λ'`; `Ent(f) ≤ (C/2)I(f)`; `I(c + h²) = ∫4h²Γ(h)/(c+h²) ≤ 4ℰ(h)` | sound | none |
| Layer 9 models | `x⁴/4 + x²/2`; `(x²−1)²`; sphere; Gibbs cutoffs | `V'' = 3x²+1 ≥ 1`; `V'' = 12x²−4 ≥ −4`; `Δũ = ‖x‖⁻²w̃`; `‖f∇χ_R‖₂ ≤ ‖f‖₂/R` | sound | C03 |
| Headline: local Bobkov, Bobkov | `α = 1/ρ`; `ρ = 0`; clamp `ψ_j` | `c_α = 1/ρ` for all `t`; limit `2t + α`; `(I²)'' = 2(Φ⁻¹)² − 2`; `Γ(ψ_j∘f_k) ≤ Γ(f_k)` | sound | none |
| `Bobkov.logSobolevInequality` | `f = εg²`; `v = Φ(x)`, `x → −∞`; integrability of the right side | `Γ(εg²) = 4ε²g²Γ(g)`; `I + vΦ⁻¹(v) = φ(x) − |x|Φ(x) ≈ v/√(2 log(1/v))`; order `ε/√(2log(1/ε))`: `ρ Ent(g²) ≤ 2ℰ(g)`. `√(ρI² + Γ) ≤ √ρ I + √Γ`, bounded | sound | none |
| `gibbs_bobkov`, `gibbs_isoperimetric`, `gibbs_enlargement` | `A = ∅`; `μ(A) = 1`; `μ(A) < μ(Ā)`; half-space; `d = 0` | `∅`: `I(0) = 0`, `c < 0`, `cr ≤ 0`; enlargement vacuous. `μ(A_r) − μ(A) ≥ μ(Ā) − μ(A) > 0`. Half-space: `φ(r) = I(Φ(r))`. `(Ā_s)_h ⊆ A_{s+h}` | sound | none |
| Headline: Brascamp–Lieb (`gibbs_brascampLieb`) | `N(0, Σ)`; `V = √(1+x²)`; `V_ε = V + ε‖x‖²/2`; `d = 0` | `Var⟨a,x⟩ = ⟨Σa,a⟩`, equality; `V'' = (1+x²)^{−3/2}`; `μ_{V_ε} ≤ (Z_V/Z_{V_ε})μ_V`; `d = 0`: `0 ≤ 0` | sound | none |
| Helffer–Sjöstrand | commutation; OU `u = e₁`; `A₁ = M`, `A₂ = M − L⃗` | `∂ᵢLf = L∂ᵢf − Σⱼ∂ᵢⱼV∂ⱼf`; `𝐀e₁ = e₁`, `Cov(x₁,x₁) = 1`; `Cov(f,g) = ∫∇g·∇h = ⟨𝐀⁻¹∇f, ∇g⟩` | sound | none |
| Prékopa (Layer 11) | `W = x²/2 + btx + at²/2`; library statement | `−log∫e^{−W} = (a−b²)t²/2 − log√(2π)`; pinned `LogConcave.lintegral_prod_right` needs only measurable log-concave `f` | true, already in the library | R01 |

- Source locators checked against the text: 2 (the Hessian formula of 4.2 and the smooth-composition property F3 of 4.1, against BGL-Errata lines 102–108); none of the seven sampled targets could be checked against [BGL] itself.
- Library declarations opened at the pin: `TauCeti.Semigroups.StronglyContinuousSemigroup.expShift` (`TauCeti/Analysis/Semigroups/ExponentialShift.lean:39`), `ContractionSemigroup` (`Analysis/Semigroups/Basic.lean:211`), `isClosed_generator` (`Analysis/Semigroups/Generator/Closed.lean:91`), `MeasureTheory.Measure.quantile` (`Probability/Quantile.lean:164`), `LogConcave.lintegral_prod_right` and `hasPrekopaLeindler_volume` (`MeasureTheory/Integral/PrekopaLeindler.lean:397, 372`); Mathlib `IsCoercive` (`Analysis/Normed/Operator/NormedSpace.lean:321`), `LipschitzWith.ae_differentiableAt` (`Analysis/Calculus/Rademacher.lean:386`), `Measure.toSphere`, `cdf`, `stdGaussian`, `gaussianPDFReal`, `hermite`, `haarAddCircle`, `Metric.thickening`, `Metric.infDist`, `Measure.tilted`.
- Tau Ceti declarations absent at the pin (commit `2fd255d`) and opened on a newer checkout of the library (commit `ea7f36a`): `IsCoercive.formSemigroup`, `formGenerator`, `formSemigroup_generator` (`Analysis/Semigroups/Generation/Form.lean:268, 96`), `MeasureTheory.Measure.entropy`, `PoincareInequality`, `LogSobolevInequality` (`Probability/Concentration/Poincare/LogSobolev.lean:60, 84`), `poincareInequality_iff_forall_hasCompactSupport`, `poincareInequality_stdGaussian`, `entropy_exp_half_sq_eq_two_energy_gaussianReal`, `gaussianIsoperimetricProfile` and its API; their statements agree with what the README says of them.
- Cross-roadmap citations resolved: on main, UnboundedOperators §4.7 (UO-D06, `existsUnique_selfAdjoint_of_closed_form`), PDE §5.1 (E20), RandomMatrices §2.2, GaussianIsoperimetryAndClusters §1.1 and §§8.1–8.3 (`gaussian_minkowskiContent_ge`), OptimalTransport §11.9, SelfAdjointSpectralTheory SA-E01; at open heads, OrnsteinUhlenbeckSemigroup §§1.1, 1.2, 2.4 and LogConcaveFunctionalInequalities §§2.3–2.4 (its test functions are bounded `C¹` with bounded gradient, as the README says).
- Dependency check: `depcheck: 94 roadmaps, 1055 edges, 0 problem(s)`; no upward or cyclic line. The pull request changes nothing outside the folder.
- Elaboration of `TauCetiRoadmap/MarkovDiffusionOperators/Suggested.lean`: ten `sorry` warnings, nothing else; no `set_option`, no sorried data. `#check @name` on the declarations: every binder is in the signature and the types agree with the README. One-tactic probe (`rfl`, `simp`, `simp_all` with the four predicates unfolded, `infer_instance`): none of the ten theorems closes.
- Headlines: the six of the Summary; Brascamp–Lieb and the Gibbs cases of the fourth and fifth are stated, the others are named in the module docstring with what they lack (the semigroup and the full triples).

Overlap check: read LogConcaveFunctionalInequalities, OrnsteinUhlenbeckSemigroup, GaussianIsoperimetryAndClusters, and the passages of EntropyMethodAndProductConcentration and WienerChaosAndMalliavinCalculus that name the same objects; shared: the Gibbs Poincaré and logarithmic Sobolev inequalities (owner LogConcaveFunctionalInequalities §§2.3–2.4, second proof here), the Ornstein–Uhlenbeck kernel semigroup, Mehler's formula and Hermite eigenfunctions (owner OrnsteinUhlenbeckSemigroup), the Gaussian profile, Bobkov's inequality and isoperimetry for the Gaussian measure (owner GaussianIsoperimetryAndClusters §1.1, Layer 8), the semigroup of `Δ − ∇V·∇` from the Fokker–Planck flow (owner OptimalTransport §11.9); Prékopa's theorem is owned by the pinned Tau Ceti (R01).

Source independence: 2 passages compared with 1 source (BGL-Errata), nothing shared beyond a formula; largest share BGL, 74 of 86 bracketed citations; neither the text of [BGL] nor its table of contents could be read, so wording and contents were not compared with it. By the README's own locators, Layers 1–6 draw on §§3.1–3.3 in the order the dependencies force (triple, form, semigroup, `Γ₂`, extension to the domain, gradient bounds), Layer 5 mixes §§3.1, 3.2 and 3.3, and Layers 7–11 take §§4.2/4.8, 5.1/5.2/5.7, the models, §8.5 and §4.9, not in the book's order.

Research link: Layers 6–8 and 10 are the `Γ₂` results of Bakry–Émery theory in the form of Bakry, Gentil and Ledoux (2014), with the semigroup proof of Gaussian isoperimetry; Layer 11 is the Brascamp–Lieb inequality (1976) by Hörmander's method and the Helffer–Sjöstrand representation (1994). Rests on the README's references; of these only the errata was read.

## Not verifiable

- Every [BGL] locator, including the seven sampled targets (1.1, 1.2, 2.1, 2.2, 2.3, 4.1, 4.2): the book resolves only to a paywalled page, and the publisher's contents page asks for a login.
- The README's two statements that [BGL] is in error (Theorem 3.3.23 without ergodicity; Theorem 8.5.3 on `A₀`): same reason; only the absence of a correction in the errata was confirmed.
- [BrascampLieb, Theorem 4.1], [CorderoErausquin2005, p. 402], [FOT, Theorem 1.4.1], [Davies, §1.3], [HelfferSjostrand]: paywalled or no legal copy found. [Hörmander, Theorem 2.2.1]: the open copy reached had no text.
- Whether the Lean statements resemble the external formalisation named in the Provenance section: not compared.

Automatic checks set aside as false positives: four names in the list of Tau Ceti declarations of the supplier contracts were read as declarations this roadmap claims for its own `Suggested.lean`; they are library declarations, written after `TauCeti.Probability.gaussianIsoperimetricProfile` without repeating its namespace.

## Source issues

- none

## For the human reviewers

- **Not tested.** [BGL] carries 74 of the README's 86 bracketed citations; neither its text nor its table of contents could be read, so wording and arrangement were not compared with it, including the six subjects of README lines 307–312.
- **Licence.** The Provenance section (README line 352) names an Apache-2.0 repository by the pull request's author that formalises [BGL]; `Suggested.lean` was not compared with it.
- **Library pin.** Layer 2 builds the semigroup with `IsCoercive.formSemigroup`, and Layers 7–10 use `PoincareInequality`, `LogSobolevInequality`, `entropy` and the profile; none is at the pinned Tau Ceti commit, all are on the library's main branch (README line 330 says so).
- **Scope.** README lines 304–314 describe six future roadmaps and say "Contributors should not work from it"; whether a roadmap should carry such a plan is not decided here.
