# Review of HilbertModularVarietiesAndShimuraCurves (pull request #1005 at afb8391)

**Verdict:** needs changes

This is an incremental re-review of the 12 lines changed since 388e2e6. Only `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md` changed: two BC91 page spans and four subscript rewrites. `Suggested.lean` is byte-identical and nothing changed outside the folder. Three of the four subscript rewrites are correct. The fourth misreads a list of two variables as a double subscript, which is the one finding below. The previous R01 is settled by the last repair report.

README means `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md` at afb8391.

## R01 (P3) — §R18.4.35: `d_{i,b}` is not a symbol of the tensor formula, and the twist `b` is no longer declared an integer

**Location.** README:4296, the standing hypothesis of §R18.4.35 Quaternionic and inner-cohomology purity: “In the raw tensor formula `n_i` are nonnegative integers and `d_{i,b}` are integers; negative determinant exponents are inverse line powers over the rational coefficient field.”

**Claim.** At 388e2e6 this line read “`d_i,b` are integers”. That meant the exponents `d_i` and the Tate twist `b`, both of which occur in the theorem's formula. The rewrite treats it as a double subscript. As a result the sentence types a family `d_{i,b}` that occurs nowhere in the README, leaves `d_i` untyped, and no longer requires `b` to be an integer. That requirement matters: a half-integral Tate twist is not defined for ℓ-adic coefficients without choosing a square root of the residue cardinality.

**Witness.** README:4288 states “`⊗_i Sym^(n_i)V_i⊗det(V_i)^(d_i)(b)` has weight `r=Σ_i n_i+2Σ_i d_i−2b`”, whose parameters are `n_i`, `d_i` and `b`. A search of the README for `d_{i` finds only line 4296.

**Repair.** At README:4296 write: “In the raw tensor formula the `n_i` are nonnegative integers and the `d_i` and `b` are integers; negative determinant exponents are inverse line powers over the rational coefficient field.”

**Test of the repair.** Take one factor with `n₁=2, d₁=−1, b=1`. The coefficient `Sym²V₁⊗det(V₁)^(−1)(1)` has `r=2+2(−1)−2·1=−2`, so by the theorem H¹ has weight −1. Every symbol of the formula is now typed, and `b=1/2` is excluded.

## Previous findings

- R01 — not repaired: ArithmeticFuchsianGroups is still at 5fdb26da, and its §1.2 *Needs:* line (README:620–623 there) still does not name this roadmap. This finding is **settled** and not re-raised. The last repair report (H01) marks it `not actionable in this package`: the edit belongs in ArithmeticFuchsianGroups' folder, and this roadmap (merge-order line 161) cannot cite ArithmeticFuchsianGroups (line 286). Both facts were rechecked at this head, so the reason holds. The ArithmeticFuchsianGroups review is where the missing citation of §R18.5.16a item 1 belongs.

## Verified sound

### Gate, dependency check, elaboration

- **Gate.** The worker's gate at afb8391 has every rule at 0, including `build=0`, and reports `OK`. I reran it on this head: `gate HilbertModularVarietiesAndShimuraCurves: set_option=0 … source-material=0 OK`, exit 0.
- **Dependency check.** Output, exactly: `depcheck: 236 roadmaps, 2293 edges, 0 problem(s)`, exit 0. There is no UPWARD, CYCLE or moved line. This roadmap is at merge-order line 161.
- **Elaboration.** `lake env lean` on `Suggested.lean` from the worktree root exits 0 with no output. The diff of the file since 388e2e6 is 0 lines. It still declares nothing: `module`, `public import Mathlib`, an empty namespace. The docstring names each headline group and the carrier it lacks: Čerednik–Drinfeld §R18.5.15; Ihara §§R18.4.32–R18.4.33; definite Ihara §R18.3.8; paired torsion twists §§H6.2–H6.8. No `set_option` and no `sorry`. The `#check @` comparison and the one-tactic padding probe are therefore vacuous.
- **Outside the folder.** `git diff --stat origin/main...HEAD` restricted to paths outside the folder lists nothing.

### The changed passages and their locators

| README line | Target | Change | Checked at |
| --- | --- | --- | --- |
| 1906 | §R18.5.7a Theorem | BC91 Part III §§5.1–5.3.2, pp.139–143 (was 142) | Chapitre III opens at BC91 line 4440. §5 opens at line 5053, on the page whose footer reads 139 (line 5062). Théorème (5.2) is at line 5091 (footer 140, line 5095); 5.3.1 at line 5131 (footer 141, line 5138). 5.3.2 runs over lines 5161–5183, crossing footer 142 (line 5178) and ending on the page with footer 143 (line 5218). 5.3.3 opens at line 5184 and is not cited. The span is exact. |
| 2023 | §R18.5.7 Construction | the same span | As above. 5.3.1 gives finitely many orbits and the union of Mumford-type quotients; 5.3.2 gives the passage to a normal small subgroup of finite index. These support the API bullets at README:2012–2015. |
| 3866, 3877 | §R18.4.22 Construction and API | `σ_ps,k` → `σ_{ps,k}` | MS19 §3.5, lines 802–830 on p.17. The type is induced from `χ⊗χ⁻¹`, with an E-model by the Schur index. Equation (2) at line 829 is the nonsplit sequence with trivial submodule and Steinberg quotient. MS19 sets `σps_A=σps_O⊗A`, so `σ_{ps,k}` is MS19's `σps_F`. |
| 4160 | §R18.4.29 Check | `M_∞(σ_ps,k)` → `M_∞(σ_{ps,k})` | MS19 lines 1906–1907 (p.37): the patched sequence `0→M∞(1_F)→M∞(σps_F)→M∞(St_F)→0`, in the README's order. |
| 4296 | §R18.4.35 hypothesis | `d_i,b` → `d_{i,b}` | Wrong reading of the formula at README:4288; see R01. The locator is unchanged: Sai09 Lemma 3 at line 1274 on p.30 (`q₀=(2g−1)(w−2)`, the projector, the CM factor `χ₀^((g−1)(w−2))`); Lemma 4 at line 1389, pp.32–33. |

The seeded sample falls in the changed passages at §R18.4.22 Construction, §R18.5.7 Construction, §R18.5.7a Theorem and §R18.4.35 Theorem. Each is verified in the rows above. The other sampled labels (Definition, Comparison, Finite-level comparison) fall in untouched text, which the previous reviews verified.

### Adversarial pass

Rows for the untouched statements carry forward from the previous report: its 12 new rows at 388e2e6 and the 60 rows at 7c9252d it carried. The folder outside the 12 changed lines is byte-identical. New rows for every changed statement:

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §R18.5.7a valuation-zero `Γ_g`, even displacement | `diag(π,π⁻¹)`, `diag(π,1)`, `π·id` in `GL₂(F_v)` | `ord_v det` = 0, 1, 2. Displacements of the standard vertex are 2, 1, 0. Only the first is in `Γ_g`, and its displacement is even. `π·id` is central with trivial homography and `ord ≠ 0`. | Correct; span pp.139–143 matches lines 5053–5183 |
| §R18.5.7 free-level node chart; non-small level | edge chart coordinates `ζ`, `π/ζ`; BC91 5.3.2 | Product of the coordinates is `π`, so the chart is `xy=π`. At non-small `U_p`, BC91 passes to a normal small subgroup and then to a finite quotient. This matches the API “nested tame levels give finite quotient maps” and the Check excluding a nontrivial vertex stabiliser. | Correct |
| §R18.4.22 splitting, residual orientation | `q=11,l=5`; `q=7,l=3`; `q=3,l=2` | `11≡1 (5)`: `#P¹(𝔽₁₁)=12`, dimensions 1, 11, 12, and `12≡2 (5)` is a unit. `7≡1 (3)`: `q+1=8≡2`, a unit. `ζ_l≡1 mod λ`, so the semisimplification of `σ_{ps,k}` is `1_k⊕St_k`. The orientation agrees with MS19 (2). For `l=2,q=3`, `q+1=4` is not a unit, as the Check says. | Correct |
| §R18.4.29 patched type sequence | exact `M_∞` applied to MS19 (2) | `0→M_∞(1_k)→M_∞(σ_{ps,k})→M_∞(St_k)→0`, the same order as MS19 line 1907 | Correct |
| §R18.4.35 raw and normalized weights | `n₁=2,d₁=−1,b=1`; `g=2,w=4` | Raw weight is `2−2−2=−2`, so H¹ has weight −1. For `g=2,w=4`: `q₀=6`, `H^(q₀+1)` has weight 7, the CM weight is `2a=2(g−1)(w−2)=4`, and `7−4=3=w−1`, as the Check says. | Theorem correct; the hypothesis sentence is wrong (R01) |

### Citations, overlaps, ownership

- **Overlaps.** No other open pull request changes this roadmap, and no cited id is dropped. AlgebraicTopology Layer 6 (README:46, 3607, 3615) exists only in the AlgebraicTopology revision #1652. The pull request's merge-order paragraph names #1652, as the rule requires.
- **Resolve leads.** The six Lean names in the worker's citations list (README:78, 95, 101, 133, 1314) are the ones earlier reviews resolved. None is in a changed line.
- **Ownership.** The changed lines add no object. QuaternionArithmetic at 4a6edeb8 still cites this roadmap (20 occurrences). ArithmeticFuchsianGroups is at 5fdb26da with no citation of it; see Previous findings.

### Remarks on untouched text (not findings)

- README:4174 (§R18.4.30 Theorem) still writes `M_∞(σ_ps,O)`, the comma-subscript form now written `σ_{ps,k}` at README:3866, 3877 and 4160.

## Not verifiable

- **EGS15 Lemma 4.1.1** (§R18.4.22) and **Del80 Corollaries 3.3.4–3.3.6** (§R18.4.35) are not in the source cache. Their locators are unchanged and were not rechecked here.
- **Tay02, PRR23 §1.4.2 and the Voi21 printed pages** are as in the previous reviews: an image-only scan, a paywalled edition, and a paywalled host respectively. None is cited in a changed line.

## Source issues

- none new in the changed locators. The three items of earlier reports (MS19 p.35 misprint `g(xω)`; CDN20 §1.2 ball centres; KW09 Lemma 7.2 gap) stand and were not rechecked here.
