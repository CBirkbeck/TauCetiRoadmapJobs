# FIX-DESIGN-SchrodingerOperatorsAndSpectralTypes~7

This round repairs the design files `packages/SchrodingerOperatorsAndSpectralTypes/design/README.md` and
`design/plan.json` against the three findings of REV-DESIGN-SchrodingerOperatorsAndSpectralTypes~6. `sources.toml` is
unchanged. I checked each finding against the cited text before acting on it, and all three hold.
The review's "For the human reviewers" item (the licence of `teschl`) lists no finding, so nothing was changed for it.

## F01 (P2) — applied

**What changed.** 3.8 now identifies `L²(X; ℂ)` with `WithLp 2 (TauCeti.Complexification L²(X; ℝ))` through `κ : u ↦ Re u + i•Im u`. It takes the self-adjoint `(L_D)_ℂ` from UO-D06 and proves the eigenspace identity `ker(A_ℂ − μ) = ι ker(A − μ) + i•ι ker(A − μ)`. 3.9 uses both for smooth `V`. The R5c "Used:" sentence is gone, and UO-D06 is added to the Needs lines, the contracts and the plan.

**Evidence.**
- Main `TauCetiRoadmap/RiemannianGeometry/README.md` §R5c (lines 3715–4048) has no complexification.
- Main `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md` §4.7 (UO-D06), "real unbounded spectral restriction" paragraph (lines 744–760), gives `A_ℂ` on `WithLp 2 (TauCeti.Complexification H)`. Its domain is `ι_H(dom A) + I•ι_H(dom A)` and it is "densely defined, closed and self-adjoint".
- At the pin:
  - `TauCeti.Complexification` is at `TauCeti/Analysis/Normed/Module/Complexification.lean:82`, with scalar action `smul_re` and `smul_im` at lines 136 and 140.
  - `WithLp.instComplexificationInnerProductSpace` is at `TauCeti/Analysis/InnerProductSpace/Complexification.lean:159`. Its inner product `⟪x,u⟫ + ⟪y,v⟫ + i(⟪x,v⟫ − ⟪y,u⟫)` equals `∫ conj(u)v` on `L²(X; ℂ)`.

**The same pattern elsewhere.**
- The two Scope bullets: UnboundedOperators now lists the complexification under UO-D06, and R5c says the complexification comes from UO-D06.
- The UO-D06 contract entry.
- A new From Tau Ceti entry for `TauCeti.Complexification` and its inner product.
- The 3.8 route ("both operators are self-adjoint" now cites UO-D06 and the unitarity of `κ`).
- The 3.9 statement and route.
- Layer 3 Dependencies.
- Plan: the statements of 3.8 and 3.9, their prerequisites, and the UnboundedOperators supplier entry.

**How the repair differs from the review's wording.**
- The eigenspace identity is stated once, for every real self-adjoint `A`, and applied to both `L_D` and `L_{D,V}`.
- It also covers the orthonormal-basis transfer used for R5c's smooth eigenbasis.
- The circle Check is recomputed against the identity.

## F02 (P3) — applied

**What changed.** A new Scope bullet, "Min–max in the compact and finite-dimensional cases", now sits before the R5c bullet. It says how 1.6 differs from VariationalMethods 4.4 (indexing from `0`, junk value `0`) and from the finite-dimensional theorem (decreasing order). It gives the dictionaries `μ_{n+1} = λₙ` and `μ_{n+1}(T) = eigenvalues(d − 1 − n)`. 1.6 gains the `diag(1, 3, 5)` index Check, and the plan gains test 1.6a `index_conventions`.

**Evidence.**
- Main `TauCetiRoadmap/VariationalMethods/README.md` §4.4 (lines 782–833): `rayleighMinMax`, the junk value `0` when `dim L ≤ n`, eigenvalues indexed from `0`. §5.1 defines the operator of a compact form pair.
- Tau Ceti `LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner` (`TauCeti/Analysis/InnerProductSpace/CourantFischer.lean:251`).
- Mathlib `LinearMap.IsSymmetric.eigenvalues_antitone` (`Mathlib/Analysis/InnerProductSpace/Spectrum.lean:309`): the eigenvalues are listed in decreasing order.

**How the repair differs from the review's wording.**
- The index dictionary names Mathlib's `eigenvalues`, which the Tau Ceti theorem characterises.
- The wrong-model values are split: dropping the shift gives `3`, and reading index `0` as the bottom eigenvalue gives `5`.

## F03 (P3) — applied

**What changed.** In the parabolic-cylinder worked example, "the funnel `y < 1` has infinite area" became "the part `y < 1` has area `∫_0^1 dy/y² = ∞`".

**The same pattern elsewhere.** "funnel" appears in one other place: the README at Layer 3 Examples and plan test `<z -> 2z>\H`. That is the hyperbolic cylinder, whose closed geodesic (the image of the imaginary axis, length `log 2`) bounds two genuine funnel ends, so it is kept.

## Adversarial pass (new and changed statements)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `κ` complex-linear isometric | `u = a + ib`, `v = c + id`; `iu` | `conj(u)v = ac + bd + i(ad − bc)`, which is the pinned `inner` formula; `κ(iu) = (−b) + i•a`; Tau Ceti `smul` with `c = i`: re `= −b`, im `= a` | holds |
| `κ Δ_X κ⁻¹ = (L_D)_ℂ` (3.8) | `C^∞(X; ℂ)` in both domains; circle | `Re u, Im u ∈ C^∞ ⊂ H² = dom L_D`; both act as `Δ`; both self-adjoint, and `Δ₀` is essentially self-adjoint (3.6) | equal |
| Eigenspace identity | circle, `μ = 1`; `X = S²`, `μ = 2`; `μ` nonreal | `ι span_ℝ(cos, sin) + i•ι span_ℝ(cos, sin) = span_ℂ(e^{±iθ})`, dimension 2 = 2; `Y₁ᵐ` real basis of 3 functions, complex dimension 3; nonreal `μ`: `A_ℂ` self-adjoint, so the kernel is `0` (the identity is stated for real `μ` only) | holds |
| Orthonormal basis transfer | real ONB `(e_k)` of `H` | `⟪ιe_j, ιe_k⟫ = δ_jk + i·0`; the closed `ℂ`-span contains `ι(H) + i•ι(H) = H_ℂ` | holds |
| 3.9, smooth `V` | circle, `V = 1`; `dim X = 0` | `(L_{D,V})_ℂ` has domain `H²(ℝ) + iH²(ℝ) = H²(ℂ)` and acts as `Δ + 1`; eigenvalues `1, 2, 2, 5, 5` with real and complex multiplicities `1, 2, 2`; `dim X = 0` is excluded from the clause | holds |
| 1.6 index Check | `diag(1, 3, 5)` | `μ₁..μ₄ = 1, 3, 5, +∞`; VariationalMethods `λ₀..λ₂ = 1, 3, 5`, `rayleighMinMax ⊤ 3 = sInf ∅ = 0`; Mathlib `eigenvalues 0, 1, 2 = 5, 3, 1`; unshifted reading gives `μ₁ = λ₁ = 3` | holds |
| Scope dictionary `μ_{n+1}(T) = eigenvalues(d−1−n)` | `d = 3`, `n = 0, 1, 2` | indices `2, 1, 0` give `1, 3, 5` = `μ₁, μ₂, μ₃` | holds |
| Scope "`+∞` beyond the dimension" | `ℂ³`, `n = 3` | three obstacles spanning `ℂ³` leave an empty admissible set, so `inf ∅ = +∞` | holds |
| F03 area | `(ℝ/ℤ) × (0, 1)` | `∫_0^1 ∫_0^1 dx dy/y² = ∫_0^1 dy/y² = ∞` | holds |

## Checks run

**Dependency check** (the prescribed command), output:

```
candidate: SchrodingerOperatorsAndSpectralTypes is not in the merge order yet; checked as if placed after QuantumFoundations (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2234 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Every new edge goes to UnboundedOperators or VariationalMethods, both on main.

**Other checks.**
- `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name that is missing everywhere.
- I checked the Tau Ceti and Mathlib names by hand at the pins: `TauCeti.Complexification`, `WithLp.instComplexificationInnerProductSpace`, `WithLp.instComplexificationCompleteSpace`, `LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner` and `LinearMap.IsSymmetric.eigenvalues`.
- `plan.json` parses.
- The added text contains no TeX delimiter, process word or machine path.

**Lean.** This is the design stage, so there is no `Suggested.lean`. No `#check` scratch file was elaborated and no Lean command was run.

**Ownership.**
- Two things are owned here because I found no other owner: the identification of `L²(X; ℂ)` with the Hilbert complexification of `L²(X; ℝ)`, and the eigenspace identity.
- I searched with `roadmaps grep`, over main and all open heads, for the complexification of an `L²` space; the only hit is UO-D06's own synonym identification. Tau Ceti has no `Lp` complexification.
- UO-D06 states `A_ℂ` and its self-adjointness but not the eigenspace identity, so both are cited from it rather than restated.

**Sources.** Nothing was fetched, `sources.toml` is unchanged and no `needs-references.toml` was written.

## Notes for the maintainer

- No id or heading of this roadmap changed name or number, so no other roadmap's citation is affected.
- The new consumption of UO-D06's complexification is an edge to a roadmap on main.
- VariationalMethods 4.4 and 5.1 are named in Scope and in a Check only; no target needs them.
