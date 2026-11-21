# Review of PositivityOfDirichletSeriesWithKernels (pull request #2903 at 3ff7b08)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/PositivityOfDirichletSeriesWithKernels/`
**Verdict:** needs changes

**Summary.** Needs changes, for two findings, both in Layer 8: the "Gauss factor" of 8.2 (a) is the Weil index that MetaplecticAutomorphicForms §2.1 on main already owns, defined again under a new name (R01), and Layer 8 cites no source while its routes leave unproved the steps that carry 8.1 (c) and 8.2 (b)–(d) (R02). I recomputed the Layer 6 theorems, Layer 7, the four `Suggested.lean` statements and every Check and worked example, including the numerical Check of 8.1 (c), and found nothing false. There are four small corrections and one format note, none blocking. The human reviewers have a scope question and a licence question, because the windowed theorem's only source is a formal proof announced on 20 November 2026 that I could not read from a legal source.

## R01 (P2) — The "Gauss factor" of 8.2 (a) is the Weil index of MetaplecticAutomorphicForms §2.1, planned a second time under another name

As written, two roadmaps build the same invariant under different names, and BesselPoincareSeriesAndGramBounds §5.17c would consume the second copy. MetaplecticAutomorphicForms is on main. Its §2.1 (README lines 360–378) defines `weilIndex` γ_ψ(q) for a nondegenerate quadratic form over any nondiscrete local field of characteristic ≠ 2. It states three properties:

- `weilIndex_norm`: |γ| = 1;
- `weilIndex_isometry`: isometric forms have the same index;
- `weilIndex_gaussSum`: for a ψ∘q-trivial lattice L, γ is the unit normalisation of `vol(L) Σ_{L′/L} ψ(q(x))`.

8.2 (a) (lines 630–636, 650) defines γ_ψ(M) = `|det M|^(1/2) ∫_{L^m} ψ(½ ξᵀMξ) dξ` for admissible L. It then proves the modulus is 1, the value does not depend on L, and `γ(ab²) = γ(a)`. Put `q(ξ) = ½ ξᵀMξ`; its polar form is M. An admissible `L^m` is then the dual of the q-trivial lattice `M^(−1)(L^⊥)^m`, so the integral is the normalised Gauss sum of `weilIndex_gaussSum`. `γ(ab²) = γ(a)` is `weilIndex_isometry` for `ξ ↦ bξ`. The two definitions give the same numbers. On ℚ₂ with ψ = `e^(−2πi{·})`, q = x² and L = ½ℤ₂, the formula of 8.2 (a) gives `2^(−1/2)·½ Σ_{η mod 4} e^(−2πiη²/4) = (1 − i)/√2`, which is the value of the Check in §2.1. On ℚ₃ with M = (2/3), both give i. Over K = ∏K_i everything factors, so the factor over K is the product of the factors' Weil indices.

The smallest repair has four parts:
- cite MetaplecticAutomorphicForms §2.1 in 8.2, under `## Exact supplier contracts` and in the Dependencies;
- define the factor over K as the product over the factors of the Weil indices of `q(ξ) = ½ ξᵀMξ`;
- call it the Weil index, as the literature does;
- keep as 8.2 (a) only what §2.1 does not state: the lattice-integral identity over admissible lattices of K, its value at `H_m(a)`, and the admissibility of a fixed lattice for `H_m(zt)` when t is small.

## R02 (P2) — Layer 8 cites no source, and its routes leave unproved the steps that carry 8.1 (c) and 8.2 (b)–(d)

These are not textbook statements. 8.1 (c) has constants uniform in `(r, Λ)` over all holomorphic phases. 8.2 (d) is an exact p-adic formula for one phase. With no source and no complete route, a reader cannot check them and an implementer has nowhere to find the missing arguments. The References (lines 763–768) cite sources only for 6.1, 6.3, 6.4 and 6.5–6.8, and neither 8.1 nor 8.2 names a source anywhere. Both routes list steps whose "proofs are not given here" (lines 602–605 and 672–675):

- in 8.1 (c), the integration-by-parts bound in the symbol classes, and the interpolation of the phase with the bounds of its two error terms;
- in 8.2, the local Morse lemma "from which (b) follows", and "the details of (c), whose route is a sketch".

I checked everything here that can be computed and found nothing false:
- 8.1 (a), (d)(i), (d)(ii) and (d)(iv);
- the algebra of the Morse lemma route in 8.2 (b), for m = 1 and m = 2;
- the Checks of 8.2, including (d) at t = 9 and t = 3;
- the numerical Check of 8.1 (c), reproduced as 1.40|t|² and 0.554|t|².

So the defect is support, not truth. Give each of 8.1 (b), (c) and 8.2 (a)–(d) an exact locator. If the formal proof is where these are proved, that means its file and declaration name. For the standard steps, a published text would also do, for instance a treatment of stationary phase with explicit remainder bounds such as Hörmander's *The Analysis of Linear Partial Differential Operators I* for the real-variable estimates. I have not checked that text's numbering against these statements.

## C01 — Three sentences of the description do not match this head

Quoted sentence: "is carried, with identical content, by every pull request of the family". The family index at this head differs from the one at the heads of #2881, #2883 and #2887. At #2881 and #2887 the overview adds that the statement for Dedekind zeta functions is not a statement of the formal proof, and that a section keeps its number, and the entry for ChowFormsAndHeightsOfSubvarieties differs. At #2883 the overview omits the links to the announcement and the repository, and several entries, this roadmap's among them, differ. These pull requests add the same file with different content, so every one after the first to merge will conflict. The description would say which version of the index is authoritative and that the others rebase on it.

Quoted sentence: "its docstring says which other headlines are not statable and which carriers they lack". The docstring says that all four headlines are statable and stated. Right text: "its docstring says that all four headlines are statable, and names the targets it leaves out (6.3, 6.4 (b), 6.9 (c), 6.10, 7.1 (b), 8.1, 8.2)".

Quoted sentence: "Sub-roadmaps of the family and other roadmaps that are still in open pull requests merge first." The suppliers of this roadmap (ArithmeticDirichletSeriesPartII, AnalyticNumberTheoryPartII, the completed ArithmeticDirichletSeries) are all on main, and the depends-on block says none. Right text: "All suppliers are on main; no open pull request needs to merge first."

## C02 — Scope and ownership does not name three overlapping statements in other roadmaps

- SpecialFunctionsGamma §10.1, an open roadmap not in the merge order, states Landau's theorem for `∫ w g^s` with w ≥ 0 on a measure space. Its case g = e^(−u) is 6.3.
- AsymptoticExpansions §4.4 (2.4.2–2.4.3), on main, states that the transform is holomorphic on Re z > c under an extra differentiability hypothesis. 6.1 (a) is the general form.
- QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups §1.3 (i), earlier in the merge order, states non-stationary phase on ℝⁿ with constants controlled by ε and derivative bounds. 8.1 (b) is a holomorphic, scale-explicit variant.

None of these makes a statement here wrong. A reader still cannot tell which roadmap owns Landau's theorem for nonnegative integrands, or why the variants are kept. One clause each in `## Scope and ownership` would settle it: this roadmap, the one in the merge order, owns 6.3, and the clause says how each kept variant differs.

## C03 — The formal proof is cited for 6.5–6.8 as a whole repository

The entry [FormalProof] (line 767) and the *Source* line of 6.8 (line 367) name a repository with no file or declaration. A reader cannot find which statement of the formal proof corresponds to 6.5, 6.6, 6.7 or 6.8. The routes of 6.5–6.8 are complete, and I verified them, so nothing is unsupported. Naming the file and declaration for each item would make the citation an exact locator.

## C04 — Layer 8 has no statement in `Suggested.lean`

Layer 8 is a terminal layer of this roadmap, and its results are what BesselPoincareSeriesAndGramBounds consumes. 8.1 (c) is statable at the pins. ℂⁿ is `Fin n → ℂ` with its sup norm, and ψ_β, the scaled Lebesgue product measure, `ContDiff`, `iteratedFDeriv` and the determinant of the complex Hessian all exist in Mathlib. As the file stands, the acceptance test covers nothing of Layer 8. The author could state 8.1 (c), or say in the module docstring why Layer 8, unlike Layer 7, is left out.

## N01 — The title names only the subject of Layer 6

Layers 7 and 8 (Laplace's method in several variables, stationary phase over ℂⁿ and over non-archimedean rings) use nothing of Layer 6, and the title gives no hint of them. One clause in the first sentence of the overview would let a reader find them.

## Questions for the author

- Why do the layers start at 6, with no Layers 0–5? If the numbers are those of the formal proof's parts, the arrangement follows that source. I could not read the formal proof (below), so I could not check this.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| 6.1 (b) coefficient formula | g = 1, Re z > 0 | `(−1)^k Φ^(k)/k! = z^(−k−1)`; `∫u^k e^(−zu)/k! = z^(−k−1)`; without sign: `(−1)^k z^(−k−1)` | holds | none |
| 6.1 (c) normal form | g = 1, A = 0, θ = −1, Φ̃(−1/2) = 0 | order at −1/2 is 0, not analytic; normal form 1/s | holds | none |
| 6.2 (a), (d) kernel | k = 0; λ = 4, τ = 1 | `1/a = a^(−1)`; q₄ = max(0.824, 0.935); U₄(1) = 1.207; `k ≤ τλ^(3/4)U ⇔ U ≥ U_λ(τ)` | holds | none |
| 6.2 vs `gammaPDFReal` (Gamma.lean:45) | a > 0; a = 0, k = 0 | `a^(−k−1)·a^(k+1)u^k e^(−au)/k! = w_k^a`; at a = 0 kernel 1, `gammaPDFReal 1 0 = 0` | holds | none |
| 6.3 Landau | f = 1, e^(−u), sin u | 1/s singular at 0; 1/(s+1), σ_c = −1; 1/(s²+1) analytic at 0, `∫|sin u| = ∞` | holds, sign needed | none |
| 6.4 (c), `rightmost_pole_real_of_le` | −e^(βu); −ue^(βu); e^(βu)cos γu | coeff −1; residue 0, coeff −1; poles β ± iγ, no bound `Ce^(θu)` | holds | none |
| 6.4 (c) sign step | H = C/(s−θ) − Φ, σ ↓ β | H(σ) ≥ −∫₀^(u₀)\|h\| bounded below; `(σ−β)^(−m) > 0` ⇒ c_H > 0, coeff of Φ = −c_H | holds | none |
| 6.5 (a) | 1_(0,1), A = −1, σ = k = 0; g = −1 | 2 ≤ 2; at γ ≠ 0: `\|σ+iγ\|^(−k−1) − σ^(−k−1) < 0 ≤ 0` | holds | none |
| 6.5 (b) | general | `q(σ−θ′) ≤ σ−A′ ⇔ σ ≥ (A′−qθ′)/(1−q)`; off-window ≤ `I(σ−A′)^(−k)q^k ≤ I(σ−θ′)^(−k)` | holds | none |
| 6.6 (b) | `(s−ρ)^(−1)`, `(s−ρ)^(−2)` | `(z−ρ)^(−k−1)`, M = 0; `(k+1)(z−ρ)^(−k−2) = C(k+1,1)(z−ρ)^(−k−2)` | holds | none |
| 6.7 dichotomy | Z = {β ± iγ₀}; Z = {β}; D = σ−θ | (B) impossible; (A) needs d ≥ σ−β ≥ r > d; D = σ−θ forces Re w ≤ θ, so β > θ | holds | none |
| 6.8 `windowedLandau` | −ue^(βu); ue^(βu); −e^u + 2e^(bu)cos cu; bounded windows | coeff −1; window integral ~e^((β−θ)U) fails; rightmost pole 1, coeff −1; poles β ± iγ | holds | none |
| 6.8 case (A) | η = ½log(r′/d), k ≥ U | `½\|c_m\|d^(−m)e^(2ηU)` against `M′ + 2e^(ηU) + 2I` | contradiction for large U | none |
| 6.9 (a) `HasWindows` Check | ⋃_{j≥1}[2^(2^j), 2^(2^j+1)] | gaps since 2^j+1 < 2^(j+1); inside one interval Y^(λ−1) ≤ 2; j = 0 gives [2, 8] = [2, 2³] | holds | none |
| 6.9 (b) `windowedLandau_mellin` | U = log Y, window in {G ≤ Cy^θ} | `∫_U^(κU) g⁺e^(−θu) = ∫_Y^(Y^κ) G⁺y^(−θ−1) ≤ C⁺(κ−1)log Y ≤ Y^η` | holds | none |
| 6.9 (c) | c = log n, A = 1 | `∫₁^∞ y log y·y^(−σ−1) = (σ−1)^(−2)`; Tonelli bound needs σ > 0, given by A ≥ 0 | holds | none |
| 6.10 | c = 1; n^(σ_a−1)/log²(n+1) | ζ(s)/s singular at 1; Σ 1/(n log²(n+1)) < ∞, diverges below σ_a | holds | none |
| 7.1, `tendsto_integral_of_laplaceMethod` | e^(−(1+i)tY²); (1+Y²)^(−t); e^(−tY²) − e^(−t(Y−t)²); E = 0 | both `(π/(1+i))^(1/2)`, modulus 2^(−1/4)√π; t = 1: π = π; integral 0, majorant fails at Y = t; E = 0: μ{0} both | holds | none |
| 8.1 (a) | β = 2, a = 1, δ = 1; a = 0 | 1/√2 = 2/√8; a = 0: \|β\|/(2δ) both sides | holds | none |
| 8.1 (c) numerical Check | x + 1/x, r = 0.4, \|t\| = 0.02, 0.01 | grids 1201², 1801²: 5.609·10⁻⁴ = 1.402\|t\|², 5.543·10⁻⁵ = 0.554\|t\|² | holds | none |
| 8.1 (d) (i), (ii), (iv) | n = 1, 2; general | det `(n+1)z^(−n)`; (ii) `\|x_k − z\| ≤ 3.72η\|z\| ≤ 6η\|z\|`; (iv) `\|∂^α(D/∏x)\| ≤ (1+‖∇g‖)α!ρ^(−j)` | holds | none |
| 8.2 (a) Check, ℚ₃, M = (2/3) | ℤ₃, 3⁻¹ℤ₃, 3ℤ₃ | `(1+2e^(2πi/3))/3 = i/√3`; `3·3^(3/2)i/27 = i/√3`; 1/3, `{1/12}₃ = 1/3` so not admissible | holds | none |
| 8.2 (a) against Weil index (R01) | ℚ₂, ψ = e^(−2πi{·}), q = x², L = ½ℤ₂ | 8.2: (1 − i)/√2; MetaplecticAutomorphicForms §2.1 Check: (1 − i)/√2 | same object | cite §2.1 |
| 8.2 (b) identity | m = 1, 2 | m = 1: y²/(1+y) both; m = 2: both ×(1+y₁)(1+y₂) give y₁²+y₂²+y₁y₂+y₁²y₂+y₁y₂² | holds | none |
| 8.2 (c), (d) | ℚ₃, m = 1, D = 1, A = 1_{ℤ₃^×} | t = 9: (2/3)cos(4π/9) both; t = 3: −1/3 against 1; B = 9ℤ₃, t = 9: rest gives (4/9)cos(4π/9) ≠ 0 | V needed, as stated | none |
| Layer 8 sources (R02) | References; 8.1, 8.2 | sources only for 6.1, 6.3–6.8; omitted steps at lines 602–605, 672–675 | unsupported | add locators |

- Source locators checked against the text: none of the cited theorems. Only the Announcement was readable (author's page, 4 pages, no statement of Layers 6–8).
- Library declarations opened at the pins: 28 in Mathlib. Examples: `meromorphicTrailingCoeffAt_congr_nhdsNE` (Analysis/Meromorphic/TrailingCoefficient.lean:186), `gammaPDFReal` (Probability/Distributions/Gamma.lean:45), `integral_comp_exp_Ioi` (MeasureTheory/Integral/IntegralEqImproper.lean:1157), `DifferentiableOn.hasFPowerSeriesOnBall` (Analysis/Complex/CauchyIntegral.lean:716).
- Tau Ceti at the pin: `TauCeti.Contour.exists_laurent_data_of_meromorphicAt` (Analysis/Contour/MeromorphicLaurent.lean:223) and `TauCeti.LSeries.landau` (NumberTheory/LSeries/Landau.lean:296). Neither Mathlib nor Tau Ceti has `HasLaplace`, Laplace's method or stationary phase.
- 21 cross-roadmap citations resolved: ArithmeticDirichletSeriesPartII Conventions, §§0.1, 0.2, 4.1; AnalyticNumberTheoryPartII §4.5c; completed ArithmeticDirichletSeries 8.1; AsymptoticExpansions Layers 5, 6 and §5.2. Downstream ids also exist at their heads: GeneralizedRiemannHypothesisFromWindowBounds §§1.1–1.3, 2.1–2.5, 3.1; ThetaChainsAndFrobeniusPrimeSums §§10.7, 10.10, 10.11; BesselPoincareSeriesAndGramBounds §§5.13d, 5.17c, 5.18d.
- Automatic checks: all passed at this head. Dependency check output: `depcheck: 171 roadmaps, 1990 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: four `declaration uses 'sorry'` warnings and nothing else. `#check @name` for all five declarations, elaborated once, matches the README statements; no binder is lost (the file has no `variable` block).
- One-tactic probe, decided by reading: none of the four theorems follows from a library lemma or by unfolding, and `HasWindows` has a real body. No padding.
- Ownership against open pull requests: object searches (Landau's theorem, Weil index or Gauss factor, stationary phase, Laplace's method) across all open roadmap heads and main.

Overlap check: read GeneralizedRiemannHypothesisFromWindowBounds, the RiemannHypothesisForDirichletLFunctions family index, ArithmeticDirichletSeriesPartII, AnalyticNumberTheoryPartIII and AsymptoticExpansions. Shared objects and their owners:
- the transform `HasLaplace`: ArithmeticDirichletSeriesPartII §0.1 (cited);
- Landau's theorem for weighted families: GeneralizedRiemannHypothesisFromWindowBounds, which cites 6.4 and 6.8;
- holomorphy of the transform: AsymptoticExpansions §4.4 in a narrower form (C02).

Outside these lists, the object search also found MetaplecticAutomorphicForms §2.1, owner of the Weil index (R01), SpecialFunctionsGamma §10.1 and QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups §1.3 (C02).

Source independence: 7 passages compared with 1 readable source (the Announcement), none shared; largest share FormalProof, 4 of 10 target citations; contents not compared, because FormalProof could not be read.

Research link: Layer 6 extends Landau's theorem (Landau 1905) to one-sided bounds on windows, in the line of the localized oscillation theorems of Kaczorowski and Pintz (1986, 1987); 6.8–6.9 are the step by which the family, following Alpöge's announced formal proof (2026), passes from window bounds to the Riemann hypothesis for Dirichlet L-functions. Rests on the README's References and Downstream consumers.

## Not verifiable

- [FormalProof], the GitHub repository cited for 6.5–6.8: the sources service does not classify the host, and no author-hosted copy of the text was fetched.
- Landau 1905, *Math. Ann.* 61 (6.3, 6.4): the DOI resolves to a paywalled publisher, and the service found no legal copy.
- Widder 1941, Chapter II (6.1, 6.3): the service found no legal source.
- Montgomery–Vaughan 2007, §15.1 (6.4): Cambridge landing page, paywalled.
- Kaczorowski–Pintz 1986/1987 (context for 6.8): paywalled.

## Source issues

- none

## For the human reviewers

- Scope: the windowed theorem 6.5–6.8 rests only on a Lean formalization announced on 20 November 2026 (Announcement, the author's page, read; it states no theorem of Layer 6). No refereed source states 6.8 as written, and Layer 8 cites no source.
- Licence: the FormalProof repository (github.com/leanprover-community/riemann-hypothesis) could not be read, so its licence is unknown and `Suggested.lean` was not compared with its declarations.
- Not tested: FormalProof has the largest share of locators (4 of 10). Wording and arrangement were not checked against it.
