# FIX-PKG-SchattenClassesAndSchurMultipliers~3

All three findings are right, and all three are applied. Only `packages/SchattenClassesAndSchurMultipliers/README.md` changed. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are untouched: no new gap, no new source, no Lean name added, renamed or deleted.

## F01 (P3) — applied

Verified. The old route went "`A` commutes with every `U_z`, hence with `L^∞(ℝⁿ)`, hence is a multiplication operator". It used two facts that nothing in the roadmap supplies: the characters generate `L^∞(ℝⁿ)`, and `L^∞(ℝⁿ)` is its own commutant. VonNeumannAlgebras states its MASA theorem only for finite measures.

Old → new (§10.2, third bullet): the commutant argument → a kernel argument.
- `BMO_c = 0` gives `⨍_Q ‖(π(A) − π(A)_Q)h‖² = 0`, so the continuous `π(A)` is constant and `U_zAU_z* = A`.
- The kernel is `e^{2πi⟨z,x−y⟩}k_A`, by §3.1's elementary symbols. Kernel uniqueness (§2.1) then gives `(e^{2πi⟨z,x−y⟩} − 1)k_A = 0` a.e.
- Over `z ∈ ℚⁿ` this forces `x = y` (the rational `t` is spelled out). The diagonal is null by Mathlib `MeasureTheory.Measure.measure_prod_null`, so `A = 0`.

Other edits:
- The §10.2 `*Needs:*` is now "§2.1, §3.1, §10.1; Mathlib `MeasureTheory.Lp`, `MeasureTheory.Measure.measure_prod_null`".
- Layer 10 Dependencies and How to read the build now say "Layers 1, 2 (§2.1) and 3".
- The Mathlib contract has a `measure_prod_null` bullet.
- The `n = 0` Check now says why the route gives nothing there.
- New §10.2 Check: the review's `n = 1` witness, `u = 1_{[0,1]}`, `z = 1/2`.

## F02 (P3) — applied

Verified. §2.1 gives only `S₂(L²(ℝⁿ)) ≅ L²(ℝⁿ × ℝⁿ)`. The step `L²(μ; L²(ν)) ≅ L²(μ ⊗ ν)` had no supplier.

BochnerSpaces §4.2 (another author's open new-roadmap pull request, already a supplier here) states it as `exists_fubiniEquiv`:
- hypotheses: σ-finite `μ`, `ν`, `p ≠ ∞`, complete `X`;
- conclusion: `Lp X p (μ.prod ν) ≃ₗᵢ Lp (Lp X p ν) p μ`, with the nested a.e. section formula.

Old → new:
- §11.3 identification: "through §2.1" → the §2.1 kernel unitary applied pointwise in `z` (Mathlib `ContinuousLinearMap.compLp`), then the Fubini isometry `L²(ℝⁿ_z; L²(ℝⁿ_x × ℝⁿ_y)) ≅ L²(ℝⁿ_z × ℝⁿ_x × ℝⁿ_y)` of BochnerSpaces §4.2.
- §11.3 `*Needs:*`: added §3.1, §11.1, BochnerSpaces §4.2 and `ContinuousLinearMap.compLp`.
- Layer 11 Dependencies: added BochnerSpaces §4.2.
- BochnerSpaces contract: new §4.2 bullet.
- Scope and ownership: the BochnerSpaces bullet now names the Fubini isometry (§4.2).
- Mathlib contract: new `compLp` bullet.

## F03 (P3) — applied

Verified. `J_k` belongs to §10.3 and the inequality to §10.4, and both need §10.2.

Old → new:
- The `n = 0` Check of §10.2 keeps only the BMO and definiteness facts (plus the route remark of F01).
- New §10.3 Check: at `n = 0`, `|x − y| = 0 < 2^{−k}`, so `J_k = 0`, and `‖1‖_p ≤ liminf‖J_k 1‖_p` reads `1 ≤ 0`.
- New §10.4 Check: at `n = 0`, `Ψ(z) = e^{−Rz}` gives `e^{−R/2} ≤ 4C_n e^{−R}`, which fails for `R > 2 ln(4C_n)`.

No new edges.

## Same patterns elsewhere (repair the pattern)

I checked every `### k.n` section and every Examples block mechanically: each `§` reference was compared with its section's `*Needs:*` and with the section order. Repaired:

**Forward statements (F03 pattern):**
- **§3.2:** the sentence "The isometry, with its completely bounded form of §3.5, is `schurNorm_two_eq`" stated a fact about §3.3's `schurNorm` and §3.5's `schurCbNorm`. It moved into the existing `p = 2` bullet of §3.5, with its reason: `‖S_M‖₂` is the §3.1 norm, and `‖M_m‖_∞ = ‖M‖_∞` for `m ≥ 1`. §3.1 was added to the §3.5 `*Needs:*`. The Lean docstring "(README §3.2, §3.5)" stays accurate: §3.2 proves the isometric `*`-homomorphism, §3.5 names the theorem.
- **§1.4:** deleted "For a Schur multiplier `T = S_M` these norms are `schurNorm` and `schurCbNorm` (§3.3, §3.5)". §3.3 and §3.5 already say this where those norms are defined.
- **Layer 4 Examples:** deleted "Positive definite symbols (§6.1): all norms equal". It is a Layer 6 result and already appears in the Layer 6 Examples.
- **Layer 10 Examples:** "Toeplitz multipliers act on `π(A)` as Fourier multipliers in `z` (§11.3)" → restated from §10.2 alone: `π(S_{M_m}A)(z) = S_{M_m}(π(A)(z))`, and each character `e^{2πi⟨z, x−y⟩}` is multiplied by `m(x − y)`.

**Missing `*Needs:*` items (F02 pattern):**
- §2.3 cites §1.4 for completely bounded norms, but its `*Needs:*` lacked §1.4 and nothing reached it transitively; §1.4 is added. How to read the build and the Layer 2 Dependencies already listed it.
- §11.4 cites §3.1 in its statement; §3.1 is added.

**Left unchanged, on purpose:**
- Usage pointers that state nothing about a later object: §1.2 "used by §3.3 and §5.2", §2.3 "used in §4.1", §11.2 "used in §11.4".
- Checks that cite an earlier layer's result without feeding the statement or the route: the §7.3 Check citing §6.3, and the §11.5 Check citing §9.5. Both are earlier in the build, so there is no upward edge.
- References already reachable transitively: §3.7 → §3.1, §4.1 → §3.4, §8.2 → §3.5, §9.1 → §1.1.

## Checks

**Elaboration.** `lake env lean packages/SchattenClassesAndSchurMultipliers/Suggested.lean`, run from the content repository: exit 0. There are 11 warnings, all "declaration uses `sorry`" (lines 97, 107, 120, 130, 143, 165, 177, 196, 207, 247, 276), and no other message.

**Signatures.** I elaborated a scratch copy with `#check @name` for all 19 declarations. Each type agrees with its README statement, and no binder is lost:
- `schurNorm_two_eq` keeps `[SigmaFinite μ]` and `MemLp M ∞ (μ.prod μ)`, matching the new §3.5 sentence;
- the two continuous-symbol theorems keep their five Radon binders;
- `schurNorm_le_hmsNorm` keeps `1 ≤ n`.

Nothing changed in the Lean file.

**New Mathlib names.** `#check` at the pin:
- `MeasureTheory.Measure.measure_prod_null`: `[SFinite ν]`, measurable `s`, `μ.prod ν s = 0 ↔` a.e. null sections; in `Mathlib/MeasureTheory/Measure/Prod.lean` line 406.
- `ContinuousLinearMap.compLp`, `coeFn_compLp` and `norm_compLp_le`: in `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean` line 775.
- `inferInstance` finds `NullSingletonClass` for the volume on `EuclideanSpace ℝ (Fin 1)`.

**Dependency check** (after all edits):

    depcheck: 243 roadmaps, 2250 edges, 0 problem(s)

There is no UPWARD, CYCLE or moved line.

**Citations.** `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. The Mathlib names were checked at the pin, as above.

## Adversarial pass (changed and added statements)

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §10.2 definiteness, kernel route | `n = 1`, `A = u ⊗ u*`, `u = 1_{[0,1]}`, `z = 1/2`; `n = 0`, `A = 1`; `x_j − y_j = √2` and `3` | Kernel of `U_zAU_z* − A` is `(e^{πi(x−y)} − 1)1_{[0,1]²}`, nonzero off the diagonal, which has measure 1; at `n = 0` the factor is `e⁰ − 1 = 0` and the diagonal has mass `δ₀ ⊗ δ₀ = 1`; `t = 1/2` gives `0.707 ∉ ℤ`, `t = 1/6` gives `0.5 ∉ ℤ` | holds exactly for `n ≥ 1`, the layer's standing hypothesis | new route, new Check |
| §10.2 "any two points lie in a common cube" | `x = 0`, `y = (3, −1)` | the cube `[−1, 3]²` has side `4 > max|x_j − y_j| = 3` | holds | none |
| §10.3 new `n = 0` Check | `k = 0, 5`; `A = 1` on `ℂ` | `|x − y| = 0 < 1`, `0 < 1/32`, so `J_k = 0`; `‖1‖_p = 1 > 0 = liminf` | the inequality fails, so `n ≥ 1` is needed | moved here |
| §10.4 new `n = 0` Check | `p = 4`, `R = 10`, `C_n = 1` | `Ψ(1/2) = e^{−5} = 6.7·10^{−3}`; right side `4e^{−10} = 1.8·10^{−4}`; threshold `2 ln 4 = 2.77` | fails, so `n ≥ 1` is needed | moved here |
| §11.3 identification | `{1, 2}` with counting measure in place of `ℝⁿ`; `N = 1` | dimensions `2·4 = 8 = 2³`; `‖f‖² = Σ_z Σ_{x,y} |k_{f(z)}(x, y)|²` on both sides; identity ↦ identity | isometric; section formula `(eF)(s)(t) = F(s, t)` agrees with BochnerSpaces §4.2 | wording, `*Needs:*`, contracts |
| `ContinuousLinearMap.compLp` with a unitary `U` | `U`, then `U⁻¹` | `‖U.compLp f‖ ≤ ‖U‖‖f‖ = ‖f‖` both ways; the composite is a.e. `f` by `coeFn_compLp` | isometric isomorphism | contract bullet |
| §3.5 `p = 2` bullet / `schurNorm_two_eq` | `M = [[1,2],[3,4]]`, `m = 1, 2`; `μ = 0`; Lean level `m = 0` | `‖S_M‖₂ = 4` at `E₂₂`; `‖M_m‖_∞ = 4`; zero measure gives `0 = 0`; level 0 contributes `0` | holds; the cb form needs §3.1 only | moved from §3.2 |
| Layer 10 Toeplitz Example | `m(ξ) = e^{2πi⟨a, ξ⟩}` | entry becomes `e^{2πi⟨z + a, x − y⟩}k_A`, i.e. `π(A)(z + a)`, the translation `T_m f = f(· + a)` of Conventions | consistent with the Fourier convention | restated |
| §2.3 + §1.4 | cycle test | §1.4 `*Needs:*` (§1.1–§1.3, Mathlib, VonNeumannAlgebras V2, CStarAlgebras, NoncommutativeIntegration) contains no Layer 2 item | no cycle | `*Needs:*` |

## For the maintainer

- No name that other roadmaps cite has changed. The README now consumes BochnerSpaces §4.2 in addition to §7.4 and §7.5. BochnerSpaces is another author's open new-roadmap pull request and was already a supplier, so the dependency check is unchanged.
- The §3.2 → §3.5 move changes only where the README names `schurNorm_two_eq`; the Lean declaration is unchanged.
- No suspicious instructions were found in the review text.
