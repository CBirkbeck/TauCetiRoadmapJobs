# FIX-PKG-SchattenClassesAndSchurMultipliers~2

One review, four findings (all P3), each verified against the README, the sibling roadmaps on
main and the pinned libraries. All four are right and are applied; each was also repaired
wherever the same construction occurs in the roadmap.

## F01 (P3) — applied

Verified: the V2.RectangularL2 contract named §1.4 and §3.7. §3.7 uses no tensor product, and
§1.4 uses an abstract Hilbert tensor `H ⊗ L` with no supplier. The sections that actually cite
V2.RectangularL2 are §2.4, §3.5 and §3.6. VonNeumannAlgebras on main, Layer 2, the paragraph
"Construct completed Hilbert tensor products …" with `E⊗̂F = UniformSpace.Completion (E ⊗[ℂ] F)`,
supplies the missing object.

Changed:
- Contract: "of §1.4 and §3.7" → "§2.4 (`L²(𝒜 ⊗ 𝒜) = L²(𝒜) ⊗̂ L²(𝒜)`), §3.5 (`L²(Ω × Fin m)`),
  §3.6".
- New contract bullet "V2 (completed Hilbert tensor products)": the inner product on elementary
  tensors and the density of elementary tensors.
- Scope gains "(V2)". §1.4 *Needs:* and Layer 1 Dependencies gain V2 and Mathlib `lp`.
- §1.4 stabilisation now derives `H ⊗̂ L ≅ ℓ²(β; H)` and `H ⊗̂ ℂ^m = H^m` from V2.
- The Mathlib `lp` contract adds the Hilbert sum.

Same pattern, also repaired:
- (a) The CStarAlgebras contract claimed that C1.6 gives `M_m(K(H)) = K(H ⊗ ℂ^m)`. C1.6 on main
  does not state it. The contract now says §1.4 proves `M_m(K(H)) = K(H^m)` (an operator is
  compact exactly when each of its blocks is), and §1.4's last bullet says the same.
- (b) §9.3 `L²(F) ⊗ ℂ^k` → `L²(F)^k = L²(F) ⊗̂ ℂ^k` (§1.4); §1.4 added to its *Needs:* and to the
  Layer 9 Dependencies.
- (c) The §1.4 Check `S₂(H ⊗ ℓ²(ℕ))` → `S₂(H ⊗̂ ℓ²(ℕ)) = S₂(ℓ²(ℕ; H))`.

## F02 (P3) — applied

Verified: §3.4 referred to `M_m` (defined in §3.5) and to the change-of-measure invariance (§3.7),
and §3.3's last bullet referred to `‖S_M‖_{cb,p}` (§3.5), none of them on its *Needs:* line. Adding
edges would make cycles (§3.5 needs §3.3), so the sentences move.

Changed:
- The Kronecker sentence → a §3.5 API bullet (rows indexed by `ι × Fin m`). §3.5 *Needs:* gains
  §3.4 and `Matrix.kroneckerMap`; §3.4 loses `Matrix.kroneckerMap`.
- The point-mass sentence → a §3.7 Check with computed values; §3.7 *Needs:* gains §3.4.
- The null-set invariance of the cb norm → a §3.5 bullet with its proof (`M_m` changes on a null
  set).
- Conventions "(§3.3, §6.2)" → "(§3.3, §3.5, §6.2)"; the Kronecker contract line gains §3.5.

The §3.4 locators support the Hadamard identification that stays in §3.4, so they stay there.

## F03 (P3) — applied

Verified: the §6.4 route used `L²(μ; K) = L²(μ) ⊗̂ K` and `A ⊗ 1_K`, which no layer, contract or
*Needs:* line supplies. VonNeumannAlgebras V2 says only "the identification with vector-valued
L²", with no measure hypotheses, so I used the reviewer's coordinate route, which needs no
supplier.

Changed: the §6.4 upper bound now reads `⟨g, S_M(A) f⟩ = Σ_j ⟨c_j g, A(d_j f)⟩`. It uses the
coordinates `c_j`, `d_j` of `ξ`, `η` (named so as not to clash with the `ξ_n` of the lower-bound
route), Fubini, dominated convergence for series and Cauchy–Schwarz, and holds at every level. The
`0·∞` cases are handled in the text.
- *Needs:* gains §2.1, §3.5, `MeasureTheory.integral_prod` and
  `MeasureTheory.hasSum_integral_of_dominated_convergence`; both are in the Mathlib contracts.
- Layer 6 Dependencies gain §2.1.

Same pattern, also repaired: §6.3 used the same `V_ξ* (A ⊗ 1_K) V_η` with no tensor supplier. It is
now the finite coordinate form `S_M(A) = Σ_n D_{ξ(n)}* A D_{η(n)}`.

Worked examples recomputed:
- `[[1, 2], [2, 1]]` in §6.3: the coordinate form gives `(3/2)A − (1/2)D_v A D_v`, bound `2`.
- `cos(x − y)` in §6.4: an average of two unitary conjugations, bound `1`.

## F04 (P3) — applied

Verified at `n = 0` against the definitions:
- Volume: `volume_euclideanSpace_eq_dirac` (pinned Mathlib, `MeasureTheory/Measure/Haar/InnerProductSpace.lean`) makes the volume on `ℝ⁰` the point mass at `0`; Lean accepted `volume_euclideanSpace_eq_dirac` for `Fin 0`.
- Fourier side: Tau Ceti's `fourierMultiplierCLM` is `𝓕⁻ ∘ (m •) ∘ 𝓕`, so `T_m = m(0)·id`.
- Both sides: the level `0` gives `0` and every level `k ≥ 1` gives `|m(0)|`.

Changed:
- Removed the `(hn : 1 ≤ n)` binder from `schurCbNorm_toeplitz_eq_fourierMultiplierCbNorm`, and
  rewrote its docstring for every `n`.
- README: removed "`n ≥ 1`" from the Summary bullet. The Layer 9 standing hypothesis now notes
  the exception.
- §9.5 gained a paragraph proving the `n = 0` case, a Check (`m = 2i` gives `2`), and
  `volume_euclideanSpace_eq_dirac` in its *Needs:* and in the Mathlib contracts.

Same pattern, kept unchanged: `schurNorm_le_hmsNorm` keeps `hn`. At `n = 0` it holds trivially
(`hmsNorm = 2|M(0,0)|`, both norms `|M(0,0)|`, `C ≥ 1/8`), but its route needs `n ≥ 1`: on `ℝ⁰`
the point is an atom, so §7.3 does not apply, and matrix BMO is not definite (README Check of
§10.2).

## Checks run

- `lake env lean packages/SchattenClassesAndSchurMultipliers/Suggested.lean` from the content
  repository: 11 warnings, each "declaration uses `sorry`"; no error and no other message.
- Signature comparison: I copied the file to the scratch directory, added `#check @name` for all
  19 declarations and elaborated it once. Every type matches its README statement. The only change
  from the earlier signatures is that the transference theorem lost `1 ≤ n →`. No section binder
  was lost.
- Mathlib names newly cited were checked with `#check` at the pin:
  `MeasureTheory.hasSum_integral_of_dominated_convergence`, `volume_euclideanSpace_eq_dirac`,
  `MeasureTheory.integral_prod`, `Matrix.kroneckerMap`, `lp.instInnerProductSpace`.
- Dependency check (after the last edit):

      depcheck: 245 roadmaps, 2243 edges, 0 problem(s)

  There is no UPWARD, CYCLE or moved line. The only new supplier citation is VonNeumannAlgebras V2,
  which is on main.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name was found missing.
- There were no gate failures to fix. `design/plan.json` is unchanged; no gap was added.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.4 `ℓ²(β; H) ≅ H ⊗̂ L` | `d = 0`; `L = ℂ`; `H = ℂ`, `L = ℂ²`, `h = (1, 1)`; `H = 0`; projective norm as wrong model | `0 = 0`; `h ↦ h ⊗ 1`, norm `‖h‖`; `‖e₁⊗e₁ + e₂⊗e₂‖² = 2 = 1 + 1`; `0`; projective norm `2 ≠ √2` | holds for V2's Hilbert norm only | contract says "inner product" |
| §1.4 `M_m(K(H)) = K(H^m)` | `m = 0`; `m = 1`; `H = ℓ²(ℕ)`, `m = 2`, `diag(1, 0)` blockwise; `[[0, K], [0, 0]]` with `K` compact | `0`; `K(H)`; block `(1,1) = 1` not compact, operator not compact; compact | holds both ways | proved in §1.4, not taken from C1.6 |
| §1.4 Check, block-diagonal `A` | `‖B_k‖₂ ≤ 2^{−k}`, `‖T B_k‖₂ ≥ 1` | `‖A‖₂² ≤ Σ 4^{−k} = 4/3`, `Σ ‖T B_k‖₂² = ∞` | holds | notation only |
| §3.5 cb norm on null sets | `N` null for `μ ⊗ μ`; `[0,1]`, `M = 1` against `1 + 1_{x=y}` | `(μ⊗#)²(N_m) = m²·0 = 0`; both cb norms `1` | holds | moved from §3.3 |
| §3.5 Kronecker | `M = [[1,2],[2,1]]`, `m = 2`; `m = 1`; `m = 0`; order `J ⊗ M` | rows `(1,0),(1,1),(2,0),(2,1)`: `[[1,1,2,2],[1,1,2,2],[2,2,1,1],[2,2,1,1]]`; `M`; empty; `[[1,2,1,2],…]` belongs to the index order `Fin m × ι` | holds with rows `ι × Fin m` | index order pinned |
| §3.7 point-mass Check | masses `(1, 3)`, `M = [[1,2],[2,1]]`; masses `(1, 0)` | kernel → `[[k₁₁, √3k₁₂],[√3k₂₁, 3k₂₂]]`, Hadamard by `M` commutes (`(1,2)` entry `2√3k₁₂` both ways); `ν⊗ν` masses `1,3,3,9 > 0`, `‖S_M‖₂ = 2`; `‖S_M‖_∞ = 2`; with `(1,0)` the norm is `1` (existing Check) | holds | new Check |
| §6.3 coordinate form | `[[1,2],[2,1]]` with §6.2 factors; `ξ₁ = (i)`, `η₁ = (1)`; empty `ι` | `(3/2)A − (1/2)D_vAD_v`: `(1,1)` `A₁₁`, `(1,2)` `2A₁₂`; bound `√2·√2 = 2`; `M = conj(i) = −i`, form `D_ξ* A D_η = −iA` (without `*` it would be `+iA`); `0 = ⨆ ∅` | holds; the star is needed | route rewritten |
| §6.4 coordinate route | `cos(x−y)`, `ξ = η = (e^{ix}, e^{−ix})/√2`; elementary `f(x)g(y)`, `ξ = conj f`, `η = g`; `μ = 0`; `ξ = 0`, `η` unbounded; levels `m ≥ 1` | `Σ_j conj c_j(x) d_j(y) = (e^{i(y−x)} + e^{−i(y−x)})/2 = cos(x−y)`, `Σ_j |c_j|² = 1`, bound `1`; `D_f A D_g`, bound `‖f‖_∞‖g‖_∞`; `0`; `0·∞ = 0` with `M = 0` a.e.; `‖ξ(·,i)‖_∞ = ‖ξ‖_∞` | holds; integrability from `∫∫|g||k||f| ≤ ‖k‖₂‖g‖‖f‖` | route rewritten |
| §9.5 at `n = 0` | `m = 2i`; `m = 0`; `p ∈ {1, 2, ∞}`; levels `0`, `1`, `2` | volume on `ℝ⁰` is `δ₀` (checked in Lean); both sides `2`; `0`; same for every `p`; level `0` gives `0`, levels `≥ 1` give `|m(0)|` | holds | `hn` dropped |
| `schurNorm_le_hmsNorm` at `n = 0` | `M ≡ c` on `ℝ⁰` | `hmsNorm = 2|c|` (`k = 1` term `0·…`), norms `|c|`, needs `C ≥ 1/8`; §7.3 needs atomless, but `{0}` is an atom | statement true, route needs `n ≥ 1` | `hn` kept |
| §9.3 `L²(F)^k` | `k = 1` | `L²(F)` | holds | notation, §1.4 in *Needs:* |

## For the maintainer

- No Lean name changed. `schurCbNorm_toeplitz_eq_fourierMultiplierCbNorm` lost the binder `hn`. A
  consumer that passes `hn` positionally must drop it; no roadmap on main or in the open pull
  requests cites the name.
- No section id changed or moved, and no notion moved down from a later roadmap.
- New supplier dependency: VonNeumannAlgebras V2 (completed Hilbert tensor products), on main and
  earlier in the merge order.
- `design/plan.json` still lists `n >= 1` among the hypotheses of target 9.5. Only its `gaps` list
  may be edited in this round. The README and `Suggested.lean` state the case `n = 0`.
- Ownership: no new object was introduced. The identification `ℓ²(β; H) ≅ H ⊗̂ L` and both
  coordinate estimates are proof steps derived here from V2 and Mathlib.
