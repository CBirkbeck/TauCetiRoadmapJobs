# Repair of MetaplecticAutomorphicFormsPartII (package, round 3)

The review lists two findings (R01, P2; R02, P3). Both are correct and both are applied. The four statement-hygiene gate hits are also cleared. Files changed: `packages/MetaplecticAutomorphicFormsPartII/Suggested.lean` and `packages/MetaplecticAutomorphicFormsPartII/README.md`. `metadata.toml`, `sources.toml` and `design/plan.json` (gaps stay `[]`) are unchanged.

## R01 (P2) — applied

Old: the module docstring listed §4.2 tensor compatibility as not statable at the pins. New: `isNormalizedWeil_pi_tensor` states it for a finite family `Xᵢ` with blockwise `g`. It uses `[Finite k]`, not the review's `[Fintype k]`, to satisfy the gate. The docstring, README "How to read the build", §4.2 (new statement paragraph, API bullet, a computed Check) and the Mathlib contracts (`LinearMap.single`) are updated to match.

Verification of the claim. The review's block hypothesis says that `g` is the block-diagonal map `⊕ gᵢ`, through the identification `Dual(∏ Xᵢ) ≅ ∏ Dual(Xᵢ)`, `y ↦ (y ∘ single i)ᵢ`. This identification is valid for finite `ι`.

- **Satisfiable.** Every family `gᵢ` gives such a `g`. Set `(gv)₁(i) = (gᵢ(vᵢ))₁` and `(gv)₂(z) = Σᵢ (gᵢ(vᵢ))₂(zᵢ)`. The form is `Σᵢ ωᵢ(vᵢ, vᵢ′)`, because `y′(x) = Σᵢ y′(single i xᵢ)`, so `g` is an isometry.
- **True.** I proved it independently, not from the review's sketch. On pure tensors, `π(t, (x, y))(⊗fᵢ) = ψ(t) ⊗ πᵢ(0, (xᵢ, yᵢ))fᵢ`, so `⊗Wᵢ(gᵢ)` satisfies Egorov covariance for `g`. By Schur (§1.3), `W(g) = a · ⊗Wᵢ(gᵢ)`. Covariance makes each `Wᵢ(gᵢ)` commute with parity, so `αᵢ := det(Wᵢ(gᵢ)|Sᵢ⁺)` equals `det(Wᵢ(gᵢ)|Sᵢ⁻)`. The space `S⁺` is the sum, over sign vectors with an even number of minus signs, of `⊗Sᵢ^{εᵢ}`. For each `i`, the even sign vectors match the sign choices on the other factors one to one. So the exponent of `αᵢ` in `det(⊗|S⁺)` is `N/nᵢ`, where `N = ∏ nⱼ`, and `det(⊗) = ∏ αᵢ^{2N/nᵢ} = det(⊗|S⁺)²`. Then the identity for `W(g)` gives `a^{N − 2N⁺} = a^{−1} = 1`.
- **Not one tactic.** The statement needs Schur and the uniqueness of §2.2.
- **Not a duplicate.** I searched the open heads and main for tensor compatibility of Weil representations. MetaplecticAutomorphicForms README line 600 (the local orthogonal cover), EndoscopicTransferAndUnitaryTraceComparison and AutomorphicCongruences treat local or adelic objects, not this finite statement.

**Same pattern, §3.3.** The docstring's reason for not stating §3.3 relied on the claim R01 refutes: that it needs "the normalized Weil–Heisenberg representation as a constructed object". I rewrote that reason. The real blocker, checked at the pin, is that no action of an isometry group on a factor-set extension exists:
- a grep of the pinned Tau Ceti finds no such action;
- `TauCeti.FactorSet.trivialMulEquiv` (`GroupExtension/Of/FactorSet.lean:508`) treats only the trivial factor set;
- so there is no group `P ⋉ H(V)` and no subgroup `P ⋉ H(I^⊥)` to induce from. The action is MetaplecticAutomorphicForms §0.8.

The README's How-to-read paragraph gives the same reason. The §3.3 target itself is unchanged.

## R02 (P3) — applied

Old (§3.4, last Check): "`θ_U` is the inflation along `H(I^⊥) → H(V̄)`". New: in the Heisenberg case, `Q = H(I^⊥)` and `HU = {(t, i)}`, and `θ_U(t, i) = ψ(t)` is a one-dimensional character. `η_U` is the inflation of `S_{ψ,V̄}`, and it is `θ_U`-isotypic on `HU`. For a line in `𝔽₃⁴`: `3² · 9 = 81`, while a one-dimensional `E^U` gives `9 ≠ 81`.

Verification:
- `[(t, v), (0, i)] = (ω(v, i), 0)`. The map `i ↦ ω(v, i)` is linear on `I`, and `ψ` is nontrivial. So `ψ(ω(v, i)) = 1` for all `i ∈ I` exactly when `v ∈ I^⊥`, which gives `Q = H(I^⊥)`.
- `(t, 0)(0, i) = (t, i)`, and `U ∩ H = 1`.
- `|HU| = 3 · 3 = 9`, `|Q| = 3 · 3³ = 81`, `dim η_U = √(81/9) = 3`.
- Other mentions of `θ_U` are already correct: README §3.4 statement and API, and the Lean docstring of `fullyRamified_isotropicInvariants`, which says "fully ramified representation of `Q` attached to `θ_U`". No other place confuses the two.

## Adversarial pass on the new and changed statements

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| `isNormalizedWeil_pi_tensor` (new) | two `𝔽₃` planes, `g = J⊕J`, `J⊕u(1)`, `u(1)⊕1`, `(−1)⊕J`; two `𝔽₅` planes, `J⊕J`, `m(2)⊕J`, `u(1)⊕m(2)` | Normalized `W` built from averaged intertwiners `Σ_v π(gv)Aπ(−v)` with `κ = det μ/det(μe + 1 − e)²`; 9×9 and 25×25 matrices. Max `|W(g) − W₁(g₁)⊗W₂(g₂)|` ≤ 1.0·10⁻¹⁴; covariance error ≤ 1.3·10⁻¹²; determinant-identity error ≤ 9.3·10⁻¹⁵ | Sound. |
| same, value | `𝔽₃`, `J⊕J` on `δ₍₀,₀₎` | Left: `κ = (det F_ψ)⁶ = (−i)⁶ = −1`, times `3⁻¹ · 1`, giving `−0.333333` in every entry (computed). Right: `(−i/√3)² = −1/3`. With `κ = 1` on the sum: `+1/3` | Agrees; added as a §4.2 Check. |
| same, degenerate | `ι = ∅`; one `Xᵢ = 0`; `ι` a singleton | Empty: `∀ i, X i` is a point, its dual is 0 and `Sp` is trivial, so `W g = W 1 = id`; both sides are the constant 1. `Xᵢ = 0`: `Wᵢ = id` on `ℂ` (§2.2 Check `n = 0`), so the factor `fᵢ(0)` is a scalar on both sides. Singleton: the statement is uniqueness (§2.2) transported along `X ≅ X_{i₀}` | Sound. |
| same, hypotheses | common `ψ`; `ψ = 1`; characteristic 2 | Different `ψᵢ` cannot occur: a single `ψ` is in the signature (§4.2 Check: `ψ₁(t)ψ₂(−t) ≠ 1`). `ψ = 1`, `X ≠ 0`, `g = J`: covariance would force a translation by `y ≠ 0` to equal the identity, so no normalized `W` exists and the statement is vacuous; `hψ` is kept because the uniqueness route uses it. Characteristic 2: `y(x)/2` takes the junk value 0, excluded by `hk` | `hk` and `hψ` are needed by the route. |
| `isNormalizedWeil_lagrangian_fixed`, `IsSquare` form | `𝔽₃`: `m(1)`, `m(2)`. `𝔽₅`: `m(1)`–`m(4)`, all on `L = {0} × X*`. `𝔽₉`: `g = −1`. `X = 0` | Computed eigenvalues on `δ₀` against `det(g|_L) = a⁻¹`. `𝔽₃`: `+1` (det 1, square), `−1` (det 2, non-square). `𝔽₅`: `+1, −1, −1, +1` for det `1, 3, 2, 4`; the squares are `{1, 4}`. `𝔽₉`: `−1 = i²` is a square and `W(−1) = χ₉(−1)R = R` fixes `δ₀`; reading the sign as `χ₃(−1)` gives `−δ₀`. `X = 0`: det 1 is a square, `W = id` | Sound. `det(g|_L) ≠ 0` because `g` is injective on the finite-dimensional `L`, so the junk `IsSquare 0` never occurs. Added the `𝔽₉` Check to §4.1. |
| `finite_stoneVonNeumann(_exists)`, `existsUnique_isNormalizedWeil` with `[Finite k]` | `𝔽₃` plane; `V = 0` | `Nat.card V = 9 = 3²` (`d = 3`); `V = 0`: `Nat.card = 1 = 1²`. `Finite V` follows from `Finite k` and `FiniteDimensional k V`. The statements use no `Fintype` data | Mathematics unchanged. |
| Conventions: `χ` versus `IsSquare` | `a ≠ 0` in `𝔽₅` | `quadraticChar_one_iff_isSquare` (Mathlib `NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:134`, with hypothesis `a ≠ 0`) and `quadraticChar_neg_one_iff_not_isSquare` (line 159). `χ₅(2) = −1`, and 2 is not in `{1, 4}` | Sound. Both names are added to the supplier contracts. |
| §3.4 Check (R02) | line in `𝔽₃⁴`; Lagrangian line in `𝔽_p²` | `3² · 9 = 81 = |Q|`; Lagrangian: `Q = HU`, `1 · p² = p²` (the existing Check, recomputed) | Sound. |

## Checks

- **Elaboration.** `lake env lean` on the package `Suggested.lean`, run from the content checkout, exits 0. It prints exactly eight warnings `declaration uses 'sorry'`, at lines 78, 90, 115, 129, 200, 222, 257 and 287: the seven earlier theorems and `isNormalizedWeil_pi_tensor`. There are no errors, no `set_option` and no new imports. No Tau Ceti object file needed building.
- **Signatures.** I appended `#check @…` for all 14 declarations to a scratch copy, elaborated it once and compared the result with the worker's `signatures.md`. The six definitions and five of the theorems are unchanged. The differences are:
  - `[Fintype k]` becomes `[Finite k]` in `finite_stoneVonNeumann_exists`, `finite_stoneVonNeumann` and `existsUnique_isNormalizedWeil`;
  - `isNormalizedWeil_lagrangian_fixed` loses `[Fintype k] [DecidableEq k]` and its conclusion becomes the `IsSquare` conjunction;
  - the new `isNormalizedWeil_pi_tensor` keeps every binder (`Fintype ι`, `DecidableEq ι`, `Finite k`, the `FiniteDimensional` family, `hk`, `hψ`, `hW`, `hWᵢ`, `hg`).

  No section binder is dropped, and each type matches its README statement.
- **Dependency check** (exact output):

```text
depcheck: 236 roadmaps, 2138 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or moved line. The edge count rose by one because §4.2 now names Mathlib `LinearMap.single`.
- **`roadmaps resolve`** on the README: no cross-roadmap citation and no Lean name is unresolved. I checked the new Mathlib names myself at the pin: `LinearMap.single` (`Mathlib/LinearAlgebra/Pi.lean:110`), and `quadraticChar_one_iff_isSquare` and `quadraticChar_neg_one_iff_not_isSquare` (lines 134 and 159 of the file above).
- **Sources.** No new source is cited. The §4.2 docstring locators are F21 line 1178 (p. 30) and F21 lines 1286–1293 (p. 32), checked against the page markers. `needs-references.toml` was not written.
- **Ownership and overlaps.** Tensor compatibility was already this roadmap's §4.2. I re-checked ownership against the open heads and main through the `roadmaps grep` index; I did not check open pull requests outside that index. `scratch/overlaps.md` lists no dropped or revision-only ids.

## Gate failures

The rule is: `[Finite k]`, not `[Fintype k]`, beside `[Field k]`.

- **Line 79, `finite_stoneVonNeumann_exists`:** `[Fintype k]` becomes `[Finite k]`.
- **Line 91, `finite_stoneVonNeumann`:** `[Fintype k]` becomes `[Finite k]`. `Nat.card V` already gives the cardinality.
- **Line 201, `existsUnique_isNormalizedWeil`:** `[Fintype k]` becomes `[Finite k]`.
- **Line 256, `isNormalizedWeil_lagrangian_fixed`:** Mathlib's `quadraticChar` needs `[Fintype F] [DecidableEq F]` (pinned `QuadraticChar/Basic.lean:64,120`). Swapping the binder alone would therefore not elaborate, and `letI`, `Fintype.ofFinite` or `open Classical` would only work around the rule. So the scalar `χ(det(g|_L))` at the nonzero determinant is written out:
  - `IsSquare d → W g f = f`, and `¬ IsSquare d → W g f = −f`;
  - the binders are now only `[Finite k]`;
  - QuadraticCharactersAndReduction on main states its finite-field targets through `IsSquare` with `[Finite F]` in the same way;
  - README §4.1 (statement, API bullet, Needs), Conventions and the Mathlib contracts say this, and a new 𝔽₉ Check fixes the convention.

The new theorem puts `[Fintype ι]` (the index type, needed for `∏ i`) on its own line, apart from `[Field k] [Finite k]`. A grep finds no remaining `Fintype` beside `Field k`.

## For the maintainer

- **Changed names other roadmaps might cite.**
  - `isNormalizedWeil_lagrangian_fixed` keeps its name but now concludes with the `IsSquare` conjunction instead of `quadraticChar` scalar multiplication.
  - `finite_stoneVonNeumann_exists`, `finite_stoneVonNeumann` and `existsUnique_isNormalizedWeil` now take `[Finite k]`.
  - `isNormalizedWeil_pi_tensor` is new.
  - `roadmaps grep` finds no other roadmap citing any of these names.
- **A mention of this roadmap elsewhere.** The board package SmoothRepresentationsOfLocalGroupsPartII (README line 1888) says that "MetaplecticAutomorphicFormsPartII uses relative isolation and the isolated-summand theorem". This roadmap cites no such result and does not name that roadmap. The sentence belongs to that package and should be checked there; nothing here depends on it.
- **No suspicious instructions.** No text in the review or the sources tried to direct the work.
