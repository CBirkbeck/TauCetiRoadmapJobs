# Repair of ComplexHessianEquations (design, round 6)

This round settles the four findings of the round-5 review (`REV-DESIGN-ComplexHessianEquations~5`). All four are correct and all four are applied. Where a repair also covers other places with the same pattern, the section names them.

Files edited:
- `packages/ComplexHessianEquations/design/README.md`
- `packages/ComplexHessianEquations/design/plan.json`
- `packages/ComplexHessianEquations/sources.toml`: the locator of `guedj-zeriahi2005` now reads "Proposition 1.7, with the standing hypotheses of §1", because the README now cites line 138–141 as well. No work was added.

## F01 (P2) — applied

- §3.1: chartwise `i∂∂̄u`, the chart-independence target, the maximum lemma, and the sum, composition and pullback API → `H_{i∂∂̄u} = 2·L_u`, with `L_u = TauCeti.manifoldLeviForm` and `i∂∂̄u = Im H`. The chart formula is now a value. Continuity of the section, `i∂∂̄c = 0`, agreement with K2 and `Δ_ω` stay as targets. The rest is cited.
- Also changed: the Conventions, the Tau Ceti contract (new bullet), the K2 contract bullet, Scope, §4.1's route, and the Needs lines of §§4.1, 6.3, 6.4, 7.1 and 8.1.
- plan.json: target 3.1.2 rewritten (four API entries removed, Tau Ceti prerequisites added); 3.1.3 deleted.

**Evidence.** I opened the declarations at the Tau Ceti pin `2fd255d9…`:
- `TauCeti.leviForm`: `Analysis/Complex/LeviForm.lean:119`, with `Re = (D²f(v,w) + D²f(Iv,Iw))/4` and `Im = (D²f(Iv,w) − D²f(v,Iw))/4`.
- `TauCeti.manifoldLeviForm`: `Geometry/Manifold/Complex/LeviForm.lean:106`.
- In the same file: `isSymm_manifoldLeviForm` (165), `manifoldLeviForm_add` (172), `manifoldLeviForm_neg` (179), `manifoldLeviForm_scalar_comp_apply` (206), `manifoldLeviForm_comp_apply` (241), and `leviForm_comp_symm_apply_of_mem_maximalAtlas` (292, which needs `IsManifold 𝓘(ℂ, E) 2 M`).
- `re_leviForm_nonpos_of_isLocalMax`: `Analysis/Complex/LeviForm.lean:150`.
- `re_leviForm_mfderiv_nonpos_of_isLocalMax`: `MaximumPrinciple.lean:64`.
- `leviForm_re_eq_zero`: line 270 of the same `Analysis/Complex/LeviForm.lean`.
- `leviForm_norm_sq`: `QuadraticLeviForm.lean:187`.
- `toMatrix₂_leviForm`: `Wirtinger/LeviForm.lean:79`.

The factor `2`, computed with `H_α(v, w) = α(v, Jw) + i·α(v, w)` and `α = i∂∂̄u`:
- `α(v, Jw) = (1/2)(D²u(Jv, Jw) + D²u(v, w)) = 2·Re L_u(v, w)`;
- `α(v, w) = 2·Im L_u(v, w)`;
- so `H = 2L`, conjugate-linear in the first slot.

Instances:
- `x_1²` gives `(i∂∂̄)(∂_x, ∂_y) = 2·(1/2) = 1`.
- `|z|²` gives `H = 2h` and `λ = 2e`.
- `Re z_1²` gives `0`.

Pattern repair: AffineMorseLefschetz §1.1 on main plans this Levi form, and Tau Ceti implements it at the pin. Scope now says it is consumed. The Dependencies of Layers 3, 4, 6, 7 and 8 name the declarations they use.

## F02 (P3) — applied

- §2.4: "(spruck2005 line 11314)" → "(Tau Ceti `Real.prod_rpow_add_prod_rpow_le_prod_add_rpow` at the weights `1/n`; spruck2005 line 11314), applied to `x_j = a∂_jf_1`, `y_j = b∂_jf_2`".
- §2.3's Lemma 2.12 step now names the same declaration at the weights `1/N`.
- The declaration is added to the Needs lines of §§2.3 and 2.4, to the Layer 2 Dependencies (formerly "Mathlib only"), to the Tau Ceti contract, and to plan targets 2.3 and 2.4.4.
- §1.4's first Check now cites `LinearMap.concaveOn_det_rpow` for `𝕜 = ℝ`.

**Evidence.**
- `TauCeti/Analysis/MeanInequalities.lean:68`: weights `w_i ≥ 0` summing to `1`, families `a, b ≥ 0`.
- `TauCeti/Analysis/Matrix/MinkowskiDeterminant.lean:159`: concavity on positive operators of a real inner product space.
- spruck2005 line 11309–11314: the Lemma 2.12 proof uses exactly this superadditivity.

## F03 (P3) — applied

- §2.1 Needs: "; §2.2 for the description of `Γ_l` used by Maclaurin" → deleted.
- §2.1 Check: "(§2.2)" → "`σ_1 = 3 > 0` and `σ_2 = 0`, while by the shift expansion `σ_2(λ + εe) = 0 + 2·3ε + 3ε² > 0` and `σ_1(λ + εe) = 3 + 3ε > 0`".

**Evidence.** Maclaurin on `Γ_l` uses only the definition of `Γ_l` in the Conventions. The added clause shows `(2, 2, −1)` is in the closure; at `ε = 1`, `σ_2(3, 3, 0) = 9 = 6 + 3`. The plan already had 2.1 without 2.2.

## F04 (P3) — applied

- §5.4: the guedj-zeriahi2005 locator now adds "for a closed form `ω̂` with continuous local potentials on a compact Kähler manifold, line 138–141; the route below needs neither closedness of `ω̂` nor the Kähler condition".
- Pattern repair in §7.2: pss2012 Theorem 31 and gpt2023 line 283–289 now carry the same qualifier, which replaces "No Kähler hypothesis is needed".
- Plan targets 5.4.1 and 7.2 take the same qualifiers.

**Evidence.**
- guedj-zeriahi2005 line 138–141: a compact connected Kähler manifold and a closed real (1,1)-current with continuous local potentials.
- pss2012 line 2946: "Let ω_0 be a Kähler form".
- gpt2023 line 282: "for any Kähler class χ̂".

## Checks run

**Dependency check** (exit 0):

```text
candidate: ComplexHessianEquations is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2231 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

**Citations.**
- `roadmaps resolve` on the README reports no cross-roadmap citation and no Lean name found nowhere. Its library check was unavailable on this host.
- I grepped every Tau Ceti name I added at the pin, 18 in all; each exists at the file and line given above.

**plan.json.**
- It parses and has 47 targets (3.1.3 deleted).
- No `target:` prerequisite dangles or points forward, and the `gaps` entries are unchanged.
- The formatting is preserved: the original file round-trips exactly.

**Suggested.lean and Lean.** This design package has no `Suggested.lean`. No Lean name of this roadmap is advertised, no `#check` file was elaborated, and no Lean command was run.

**Gate failures.** None were listed for this round.

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values computed (two sides) | Result; change |
| --- | --- | --- | --- |
| `H_{i∂∂̄u} = 2L_u`, `i∂∂̄u = Im H` | `x_1²`; `|z|²`; `Re z_1²`; `n = 1`, `|z|²` | `1 = dx∧dy(∂_x,∂_y)`; `2h`, `λ = 2e`; `0`; `Δ_ω = 2 = 2n` | Holds |
| Wrong model `H = L` | `|z|²`, `x_1²` | `λ = e ≠ 2e`; `i∂∂̄x_1² = 1/2·dx∧dy` | Excluded; Check added |
| `J`-invariant and alternating | `L(Iv,Iw) = conj(i)·i·L = L`; `Im L(w,v) = −Im L(v,w)` | both identities hold | Holds |
| Composition rule | `γ = t²`, `u = |z|²` on `ℂ`; `γ` constant | `4|z|²·i dz∧dz̄ = 2|z|²·(…) + 2|z|²·(…)`; `0 = 0` | Holds |
| Pullback rule | `g = 2z`; non-holomorphic `g = z̄`, `u = |z|²` | `4i dz∧dz̄ = 4i dz∧dz̄`; `i dz̄∧dz = −i dz∧dz̄ ≠ +` | Holomorphy needed, as cited |
| Sign at a maximum | `−|z|²`; saddle `x_1² − y_1²`; constant | `−2h ≤ 0`; `0` without max; `0` | Holds; no converse |
| §4.1 route via `L_{ψ−φ}` | `ψ = φ + c`; `ψ = −|z|²/4`, `φ = 0`, `χ = ω` | equal; `λ = 1/2 ≤ 1` | Holds |
| §7.1 slice `Δ_t = 2H = 4L` | `u = |z|² − 4`, `ξ = 1` | `D²(1,1) + D²(i,i) = 4 = 2·2 = 4·1` | Holds |
| Superadditivity, weights `1/n` | `(1,4)`, `(4,1)`; `a = 0`; weights summing to `1/2` | `2 + 2 ≤ 5`; equality; `1 + 1 ≤ √2` fails | Sum `1` needed |
| §2.4 combination constant | `f_1 = f_2 = σ_1`, `a = b = 1` | `∏∂_jf = 2^n = (1 + 1)^n` | Holds, sharp |
| §1.4 Check, `det^{1/2}` at `ℝ` | `diag(4,1)`, `diag(1,4)` | `2, 2`; midpoint `5/2 ≥ 2` | Agrees with the pin |
| §2.1 boundary point | `(2,2,−1)`; `ε = 1` | `σ = (3, 0)`; `σ_2(3,3,0) = 9 = 6 + 3` | Holds |
| §5.4, §7.2 locators | guedj-zeriahi2005 line 138–141; pss2012 line 2946 | Kähler and closed in the source; Hermitian and continuous here | Qualified |

## Ownership and overlaps

- **Levi form.** It is owned by the pinned Tau Ceti, which implements AffineMorseLefschetz §1.1 on main.
- **Superadditivity of the geometric mean.** It is owned by the pinned Tau Ceti. This roadmap keeps only the continuous section `i∂∂̄u` and its agreement with ComplexKahlerGeometry K2.
- **Search against open pull requests.** `roadmaps grep 'manifoldLeviForm|TauCeti\.leviForm'` finds nothing on main or at the 474 open heads. `roadmaps grep -i 'levi form'` finds only AffineMorseLefschetz (main) and other objects: the contact Levi form of SymplecticGeometry and a mention in ComplexComparisonPartII.
- **`scratch/overlaps.md`.** No open pull request changes this roadmap, and no id this roadmap cites is dropped.

## Sources

Nothing was fetched and `needs-references.toml` was not created. The lines I read in the cache are guedj-zeriahi2005 line 136–175 and 225–290, pss2012 line 2930–2960, gpt2023 line 278–292 and spruck2005 line 11295–11325.

## For the maintainer

- **Plan target 3.1.3 (`iddbar_nonpos_of_isLocalMax`) is deleted.** Its consumers 4.1 and 8.1 now take `tauceti:TauCeti.re_leviForm_nonpos_of_isLocalMax`. No README section number moved, and no other roadmap cites 3.1.3.
- **AffineMorseLefschetz may be read as a supplier.** It is now named on the Scope paragraph that mentions the Tau Ceti supplier contract, so the dependency check may count it as an edge. It is on main, so the edge is allowed.
