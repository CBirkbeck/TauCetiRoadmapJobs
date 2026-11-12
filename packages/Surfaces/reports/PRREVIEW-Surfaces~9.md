# Review of Surfaces (pull request #2225 at a2913c5)
Folder: `TauCetiRoadmap/RiemannianGeometry/Surfaces/`
**Verdict:** accepted

## Previous findings

- R01 — repaired: `Suggested.lean` 297–348 now has `logCutoffProfile` and the 6.1 and 6.2 theorems. Docstring lines 25–27 name only Layer 2.2 as not statable. README 804–805 and 882 give the Lean names.
- R02 — repaired: README 930–931 now reads "RiemannianGeometry R1, R2, R3, R4.2, R4.9.6a and R6 supply this sub-roadmap and take nothing back."

## Verified sound

| Statement | Instances | Computed values (left / right) | Result | Change |
|---|---|---|---|---|
| `logCutoffProfile`, docstring values | ε = 1, δ = 4 (so `4ε = δ`); r = 0.5, 1, 2, 3, 4, 5 | 0, 0, 0.5, 0.9311, 1, 1. The values ψ(1) = 0, ψ(2) = 1/2 = log 2/log 4 and ψ(4) = 1 are proved in a scratch copy | matches the docstring and README 791–793 | none |
| `logCutoffProfile`, junk branch and r → 0 | r ≤ 0; 0 < r ≤ ε | the `if` branch gives 0; for 0 < r ≤ ε, τ(log₂(r/ε)) = 0 and τ(log₂(δ/r)) = 1 because δ/r ≥ 4. So ψ ≡ 0 on (−∞, ε] | smooth at 0, so χ_ε is smooth at p | none |
| `logCutoffProfile`, wrong model | linear cutoff `(r−ε)/ε` on [ε, 2ε] in the plane | energy 3π for every ε, against 2π/Λ → 0 | the C/Λ² bound excludes it | none |
| 6.1 `exists_abs_integral_norm_mgradient_logCutoff_sub_le`, plane | δ = 1; Λ = log 4, 3, 5, 10, 20 | `(E − 2π/Λ)Λ² = 3.8397` at every Λ. This equals `4π log 2 (I − 1)` with `I = ∫₀¹(τ+vτ′)² = 1.4408` | bounded, so a C independent of ε exists | none |
| 6.1, curved | unit sphere and ℍ², δ = 1, same Λ | `(E − 2π/Λ)Λ²` ranges over 3.25–3.28 (sphere) and 4.42–4.45 (ℍ²). A C/Λ³ form would need 3.84Λ → ∞ | C/Λ² holds and is sharp | none |
| 6.1 quantifiers and denominators | `∃ C, ∀ ε` with δ fixed | Λ ≥ log 4 = 1.386 > 0. The integrand lies in the closed δ-ball, which is compact (hcpt). A junk integral 0 would force C ≥ 2πΛ, which is unbounded | not vacuous, not junk | none |
| 6.1 hypotheses against the README and 1.1 | hdom, hbij, hdist, hcpt; `0 < 4ε ≤ δ < R` | identical to `polar_jacobian_ode` lines 57–60. hδ and hR follow from `0 < ε`, `4ε ≤ δ < R`, so the statement is equivalent with or without them | generality equal | none |
| 6.1 smoothness | cover {d < R} ∪ {d > δ} | δ < R, so the two sets cover M. Radial geodesics minimize up to R, so there are no conjugate points and d(p,·) is smooth on the punctured R-ball | holds | none |
| 6.2 `integral_mul_sq_le_integral_norm_mgradient_sq_of_finite`, degenerate | B = ∅; k = 1 and k = ⊤ | `Disjoint (tsupport φ) ∅` holds, so the hypothesis is the conclusion. `k : ℕ∞` admits C¹ and C^∞ and excludes ω | holds | none |
| 6.2, dimension | line, B = {0}, V = 1/(4 max(1, x²)), C¹ ramp with T = 20 | Hardy gives the hypothesis. `∫φ′² ≤ 8/T = 0.4 < 0.5 ≤ ∫Vφ²` | fails in dimension 1; `hE` excludes it | none |
| 6.2, convergence of the V-term | φ_ε = χ_ε^B φ | `|φ_ε| ≤ |φ|` and φ_ε → φ off B, so dominated convergence gives ∫Vφ_ε² → ∫Vφ². Energy convergence follows from the `W^(1,2)` bound | holds | none |
| Module docstring and README 249–250 | Layer 2.2; Layer 6 | only 2.2 is named as not statable. "The Lean name at each target is its signature" now holds for 6.1 and 6.2 | consistent | none |
| Downstream consumers (README 930–931) | parent README 4039–4041; PositiveMass README:148 on main | the parent says Surfaces "supplies nothing to this roadmap". PositiveMass consumes S3 | consistent | none |
| 6.1 locator | Chodosh2025 line 766, printed p. 20 | the cutoff `2 − log r/log ε` on [ε², ε] gives `2π/|log ε|` by computation; the source prints `1/|log ε|` | supports the README's statement | none |
| 6.2 locator | Chodosh2025 line 3576, printed p. 81 | one point, smooth φ, stability form; φ_j → φ pointwise, energies converge | matches "for one point, smooth φ" | none |

Rows for untouched statements (Layers 1–5 and the README Checks of 6.1–6.2) stand as in the previous review, of `0ba7c9c`.

- **Gate:** the worker's gate at a2913c5 is all 0, with `build=0`. My rerun flags only `outside-folder: TauCetiRoadmap/RiemannianGeometry/README.md`, the parent index that the brief names as this pull request's own; the exclusion diff is empty. Dependency check, verbatim: `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`.
- **Elaboration:** `lake env lean` gives 10 `sorry` warnings (lines 56, 77, 102, 130, 165, 210, 236, 285, 322, 338) and nothing else. In a scratch copy, `#check @` of the three Layer 6 declarations shows that every binder is kept (`[I.Boundaryless]`, `IsRiemannianManifold`, `IsContMDiffRiemannianBundle`, the measure binders). Nothing changed.
- **Padding probe:** `first | rfl | simp | infer_instance | exact le_rfl | …` fails on both theorems: 6.1 leaves the smoothness and energy goal, 6.2 the integral inequality. `logCutoffProfile` has a real body and is needed to state 6.1.
- **Source locators checked against the text (2):** Chodosh2025 (author page, dated 15 September 2025, line 33): Lemma 5.8 at line 766 (printed p. 20) and Lemma 33.5 at line 3576 (printed p. 81).
- **Library:** Mathlib `Real.smoothTransition.zero_of_nonpos` and `.one_of_one_le` are used in the scratch proofs. Of the near-match leads, `exists_contMDiffMap_one_nhds_of_subset_interior` has no energy bound and the `SobolevInequality` lemmas are Euclidean, so neither proves a target.
- **Cross-roadmap citations resolved (3):** PositiveMass README:148 (main); the parent README 4039–4041 (head); MinimalSurfaces README 171–182 (#2226 head), which states S6 with `0 < 4ε ≤ δ`, the energy `2π/Λ + O(Λ⁻²)` and the finite-set extension, matching both Lean statements.
- **Pull request text:** the Edits paragraph names `logCutoffProfile`, both headlines, the Downstream consumers change (main's text said no roadmap on main consumes it) and the parent sentence. The supplier-contract hunks are present. The `Suggested.lean` docstring is unchanged against main.
- **Overlap check:** read RiemannianGeometry (main and head), MinimalSurfaces (#2226), PositiveMass, GeometricCurrents and HopfRinow (main), and CanonicalModelsAndGonality (#1726). The cutoff at infinity belongs to PositiveMass §3.3 and the cutoff at a point to this roadmap (S6), consumed by MinimalSurfaces. CanonicalModelsAndGonality uses it inside proofs and owns nothing. No other `Suggested.lean` declares the three names.

## Not verifiable

These are unchanged since the previous review, and none of them is cited by the changed passages:

- do Carmo, *Differential Geometry of Curves and Surfaces* (1976): the sources service found no legal copy.
- Lee, *Introduction to Riemannian Manifolds*, 2nd ed.: the DOI 10.1007/978-3-319-91755-9 is paywalled (uncertified).
- Chavel, *Riemannian Geometry*, 2nd ed.: only the CUP landing page is reachable.
- do Carmo, *Riemannian Geometry* (1992): the Springer DOI is paywalled (uncertified).

## Source issues

- **Misprint** in Chodosh2025 at the proof of Lemma 5.8, printed p. 20: the source says the planar log-cutoff between the radii ε² and ε has Dirichlet energy `1/|log ε|`; it should be `2π/|log ε|`, since the factor 2π of the integral just before it is dropped; affects nothing.
