# Review of SpecialFunctionsLegendre (pull request #2121 at ba0e38a)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: 7.3, lines 812–814, "at `l = n` both integrals vanish while the printed right side of 14.17.7 is `(−1)^m/(l + ½) ≠ 0`, and at `l ≠ n` 14.17.7 fails as well, `∫₋₁¹ 𝖯²₃ 𝖯⁻²₁ dx = −4`".
- R02 — repaired: 11.3 *Needs:* (lines 1144–1147) names `TauCeti.sphereRoundMetric`, `TauCeti.riemannianVolume`, `TauCeti.setIntegral_riemannianVolume_of_subset` and Mathlib `MeasureTheory.integral_image_eq_integral_abs_det_fderiv_smul`; the Tau Ceti contract (lines 283–287) and the Layer 11 Dependencies (lines 1156–1160) list them with their two files.
- R03 — repaired: the description's Build paragraph says "(42 headline theorems)"; the file declares 42 theorems.
- R04 — repaired: the description's Dependencies name RiemannianGeometry R8.2 and its use in 11.3, and its list of corrections has the range of 14.20.10 and the restriction of 14.17.7 to `m ≤ n`.

## Verified sound

Values were computed exactly by hand from `𝖯²₃ = 15x(1 − x²)`, `𝖯⁻²₁ = (1 − x)(2 + x)/(6(1 + x))`, `𝖯²₁ = 0`, `𝖯¹₁ = −(1 − x²)^{1/2}`, `𝖯₁ = x`. Entries are left side / right side.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 7.3 parenthetical, 14.17.7 at `m > n`, `l ≠ n` | `(l, m, n) = (3, 2, 1)` | integrand `(5/2)(2x − 3x² + x⁴)`; integral `(5/2)(−2 + 2/5) = −4`; printed side `0` | text right | — |
| 7.3 parenthetical, 14.17.7 at `m > n`, `l = n` | `(1, 2, 1)` | `𝖯²₁ = 0`, integral `0`; printed side `(−1)²/(3/2) = 2/3` | text right | — |
| 7.3 `integral_ferrersP_mul_ferrersP` (14.17.6, `m ≤ n`) | `(1, 0, 1)`, `(1, 1, 1)`, `(3, 1, 1)` | `∫x² = 2/3` / `1!/(1!·(3/2)) = 2/3`; `∫(1 − x²) = 4/3` / `2!/(0!·(3/2)) = 4/3`; `0` / `0` | holds | — |
| 11.3 change of variables to `S²` | `(θ, φ) = (1, 0.5)`; total mass | `‖∂_θ × ∂_φ‖ = sin 1 = 0.8414709848`; `∫∫ sin θ dθ dφ = 4π`, the area of `S²` | holds; inputs now named | — |

The rows for untouched statements stand as in the previous review, of `84b0c9f`.

- Changed passages: all four hunks of the 24-line diff were read (the Tau Ceti and Mathlib contracts, 7.3, the 11.3 *Needs:* line and the Layer 11 Dependencies). `Suggested.lean` is unchanged since `84b0c9f`. Nothing outside the folder changed.
- Library at the pins: `TauCeti.sphereRoundMetric` (`Geometry/Manifold/Riemannian/Sphere/Basic.lean:61`), `TauCeti.riemannianVolume` (`Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82`), `TauCeti.setIntegral_riemannianVolume_of_subset` (same file, line 124: a measurable set inside one chart source, the integral read in the chart with the chart density) and Mathlib `MeasureTheory.integral_image_eq_integral_abs_det_fderiv_smul` (`MeasureTheory/Function/Jacobian.lean:1214`) were opened; names, namespaces and files are as the README cites them.
- Sources: the seeded target 11.3 falls in the changed text, and its changed line cites only library declarations. 7.3's changed parenthetical was checked against DLMF 14.17.7 and 14.7.16 by the computation above. The other seeded targets are untouched.
- Cross-roadmap citations: RiemannianGeometry R8.2 on main (README line 3840) resolved; no open pull request changes it or this roadmap.
- Overlap check: read SpecialFunctionsHypergeometric, SpecialFunctionsAiry, SpecialFunctionsEiLiErfIncompleteGamma (main), SpecialFunctionsBessel, SpecialFunctionsConfluent, SpecialFunctionsGeneralizedHypergeometric, SpecialFunctionsStruve, SpecialFunctionsAppell (open); nothing shared. SpecialFunctionsHypergeometric assigns 15.9.16–15.9.23 to this roadmap, and SpecialFunctionsBessel leaves its Legendre-function formulas to neither, as this README's Downstream section says.
- Gate rerun at `ba0e38a`: every check `0`, OK. Dependency check: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- Elaboration (`lake env lean`): 42 warnings, all "declaration uses `sorry`", and nothing else.
- Description: read against this head; the supplier list, the import sentence (Mathlib and one Tau Ceti file), the headline count and the list of corrected DLMF statements agree with it.

## Not verifiable

- Hobson (1931, pp. 386–389, 399–401), cited in the untouched 9.1: no open copy was fetched, as in the previous review.

## Source issues

- **Error** in DLMF 1.2.8 at 14.17.7, §14.17(iii): the source states the integral of `𝖯^m_l 𝖯^{−m}_n` for all `l, m, n ∈ ℕ`; it should require `m ≤ n` (at `(1, 2, 1)` the integral is `0`, not `2/3`; at `(3, 2, 1)` it is `−4`, not `0`); affects a stated result.
