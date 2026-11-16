# FIX-PKG-SchrodingerOperatorsAndSpectralTypes~2

The review `REV-PKG-SchrodingerOperatorsAndSpectralTypes` has three findings, all P3. All three are
correct and have been repaired. No Lean signature changed: only the module docstring and one
declaration docstring changed in `Suggested.lean`.

## F01 (P3) — applied

README §3.7, first item: "its dimension (a cardinal) is the number of connected components of
finite volume" → "its Hilbert dimension (the cardinality of an orthonormal basis, which is the
vector-space dimension when finite) is the number of connected components of finite volume, since
the normalised indicators `vol_g(X_j)^{−1/2} 1_{X_j}` … form an orthonormal basis". The reviewer's
witness `⊔_{j∈ℕ} S¹_j` is added as a fourth Check of 3.7.

Verification. On `X = ⊔_ℕ S¹_j` (circles of length `2π`; complete, since each component is complete
and different components are at distance `∞`), `‖Σ c_j 1_{S¹_j}‖² = 2π Σ|c_j|²`, so
`ker Δ_X ≅ ℓ²(ℕ)`. Its Hilbert dimension is `ℵ₀`. Its Hamel dimension is `2^ℵ₀`: by Baire, an
infinite-dimensional Banach space has no countable Hamel basis, and `|ℓ²(ℕ)| = 𝔠`. The new Check
also records values that follow from the same object. Every eigenvalue `n²` has infinite
multiplicity, so `0 ∈ σ_ess` (under UO-C02's formula an isolated point with an
infinite-dimensional kernel is not removed). Every min–max value is `0`. And
`λ₁⁺ = inf{1, 4, 9, …} = 1 ≠ 0 = λ₁`, which shows that the last item of 3.7 needs its
connected, finite-volume hypotheses.

Pattern search: the README's other uses of a possibly infinite "dimension" are fine.
- §3.8's eigenspace identity, "complex dimension equal to the real dimension": correct for Hamel
  and Hilbert dimension alike, because a real basis (or orthonormal basis) of `K` gives a complex
  one of `K ⊕ iK`.
- §1.6's `finrank` count: finite there, as the review's row 6 already checked.

No other change.

## F02 (P3) — applied

`Suggested.lean` module docstring: "Every headline theorem of the roadmap is statable at the pins
and is stated below" → "Every headline theorem of the roadmap that is statable at the pins is stated
below". After the list, a new paragraph names three Summary clauses that are not statable at the
pins (two from the review plus a third, below) and says what each lacks. No declaration changed.

The repair covers the pattern, not only the review's two clauses. Checking the whole Summary turned
up a third clause with the same missing carrier: §4.2's "form domain of `H₀` is `H¹(ℝ^d)`" also
needs UO-D06's form domain (square-root domain).

Evidence at the pins:
- `TauCeti/Geometry/Manifold/Riemannian/Sobolev.lean` proves `C¹` inequalities only. Its main
  results are `exists_eLpNorm_le_mul_eLpNorm_mgradient_add` and
  `exists_eLpNorm_le_mul_eLpNorm_mgradient_two_add`, at lines 151 and 185. It defines no `H¹`
  space of a manifold.
- No file under `TauCeti/Geometry` mentions `LinearPMap`. So neither RiemannianGeometry R5c's
  closed realisation nor K5a's `H²` realisation is a declaration.
- No `LinearPMap` file of Tau Ceti mentions a square root or a form domain (grep for
  `sqrt|square root|form domain|formDomain`: 0 hits).

## F03 (P3) — applied

Docstring of `exists_mem_domain_closure_eq_zero_iff`: "(Yau's `L²` Liouville theorem; Hide–Magee
state the finite-area hyperbolic case)" → "(Hide–Magee state the finite-area hyperbolic case; the
general case is the kernel route of README §3.7)".

The attribution was mathematically right: Yau 1976 proves that `L^p` harmonic functions on a
complete manifold are constant for `1 < p < ∞`. But the README and `sources.toml` do not record
the paper. Rather than add an uncertified source with a guessed locator, the docstring now matches
the README.

Pattern search: "Yau" occurs nowhere else in the package.

Both directions of the statement were rechecked by the kernel route:
- If `u ∈ dom Δ_X` and `Δ_X u = 0`, then `‖du‖² = ⟪u, Δ_X u⟫ = 0` by the 3.6 form identity, so
  `u` is locally constant.
- If `f = Σ c_j 1_{X_j}`, then `∫ f Δφ = Σ c_j ∫_{X_j} Δφ = 0` for every test function `φ` by
  Green's formula, so `f ∈ dom Δ_max = dom Δ_X` with `Δ_X f = 0`.

## Adversarial pass (on every statement added or changed)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Hilbert dim `ker Δ_X` = number of finite-volume components (3.7) | `X = ∅`; `ℝ`; `S¹`; two circles; `S¹ ⊔ ℝ`; a point; countable discrete `ℕ` (dimension 0, counting measure); `⊔_ℕ S¹` | `0 = 0`; `ker = 0`, `0 = 0`; constants, `1 = 1`; `2 = 2`; `span 1_{S¹}`, `1 = 1`; `ℂ`, `1 = 1`; `ker = ℓ²(ℕ)` (3.2's `Δ₀ = 0`), `ℵ₀ = ℵ₀`; `ℵ₀ = ℵ₀` (Hamel `2^ℵ₀`) | holds for the Hilbert dimension; Hamel fails on the last two | wording (F01) |
| Orthonormal basis `vol_g(X_j)^{−1/2} 1_{X_j}` | `S¹` of length `2π`; two circles of lengths `1`, `3` | `‖(2π)^{−1/2}1‖² = 1`; `⟪1_{X_1}, 1_{X_2}⟫ = 0`, norms `1` after scaling by `1^{−1/2}`, `3^{−1/2}` | holds; infinite-volume components carry no `L²` constant except `0` | added |
| New Check `⊔_ℕ S¹_j` | — | `‖Σ c_j 1_j‖² = 2πΣ|c_j|²`; `σ = {n² : n ≥ 0}`, each eigenvalue of infinite multiplicity; `σ_ess = σ`, `inf σ_ess = 0`; `μ_n = 0` for all `n` (any `n − 1` obstacles leave a unit kernel vector), consistent with `minMax_principle` (`c < 0`: `0 = finrank ⊥`); `λ₁⁺ = 1`, `λ₁ = 0` | consistent with 1.6, 3.7 items 3–4 and UO-C02's formula | added |
| Module docstring: three clauses not statable | Sobolev on manifolds; form domain; R5c/K5a operators | pin greps: `Sobolev.lean` gives `C¹` inequalities only; `LinearPMap` in `TauCeti/Geometry`: 0 files; square root or form domain in `LinearPMap` files: 0 hits | the three carriers are absent | added |
| `exists_mem_domain_closure_eq_zero_iff` docstring | `S¹`; `ℝ`; `⊔_ℕ S¹` | `u = 1`: `Δ1 = 0` and `1` locally constant; only `0` on both sides; `ℓ²` of constants on both sides | the statement holds, and the attribution now matches the README | docstring only |

## Checks

- **Elaboration.** `lake env lean packages/SchrodingerOperatorsAndSpectralTypes/Suggested.lean`,
  run from the content checkout, exits 0. It gives 11 warnings, all ``declaration uses `sorry` ``,
  at lines 86, 112, 122, 153, 171, 190, 214, 244, 271, 315 and 341. These are the review's 11
  `sorry` sites, shifted by 10 lines by the new docstring paragraph. Imports are unchanged:
  `import Mathlib` and 11 `TauCeti.*` modules.
- **Signatures.** I put `#check @name` for all 18 declarations into one scratch file and elaborated
  it once. After whitespace normalisation, each elaborated type is identical to the one in
  `signatures.md`: 18 of 18 the same, no binder lost or changed. The README statements are
  unchanged, so they still agree with the Lean.
- **Dependency check**, run on the final README:

  ```
  depcheck: 239 roadmaps, 2248 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line.
- **Gate failures.** None were listed.

## Notes for the maintainer

- No cross-roadmap citation was added. The Lean docstring now cites ComplexKahlerGeometry K5a,
  UnboundedOperators UO-D06 and RiemannianGeometry R5c, which the README already cites in its
  supplier contracts.
- No supplier gap was added.
- No source was fetched and `needs-references.toml` was not written. Yau 1976 was deliberately not
  added to `sources.toml` (F03).
- No construction or target was added, so no ownership question arises. Ownership against open
  pull requests is as the review recorded it.
- No declaration name changed, so no other roadmap is affected.
- The review's "For the human reviewers" points (the licences of `teschl`, `kato57` and `lp80`) are
  for the humans and were not acted on.
- No suspicious instruction was found in the review text.
