# Review of OptimalTransport (pull request #950 at 75e39cd)

**Verdict:** accepted

This is an incremental re-review of the 105 lines of `TauCetiRoadmap/OptimalTransport/README.md` changed since `9b14026` (6.8, 6.11, 13.13 and one References entry). `Suggested.lean` is unchanged. This report has no finding: the three findings of the previous review are repaired, the repairs introduce no new problem, and the gate passes.

## Previous findings

- R01 — repaired: `README.md:2736–2779` states three examples: the Tau Ceti discontinuity example; Wang's `W²,p` counterexample (survey, p. 18); `‖x'‖^a(1+x₁²)`, `a = 2-2/n`, on the slab `x₁² < ρ² < (n-2)/(3n-2)`, with the corrected determinant and five Checks.
- R02 — repaired: `README.md:2645–2663` gives each part its own hypotheses; the covering lemma carries `λ dx ≤ MA_u ≤ Λ dx`, `θ = 1 + CΛ/λ`, the set `D`, the height `H`, `4θh_i ≤ H`, `2θ²h_i ≤ H`, and the constant `√(A(2θ²)ⁿΛ/λ)`.
- R03 — repaired: `README.md:4921–4930` cites arXiv:1011.2564v1, Theorem 3.9, p. 17 (Schilder), Proposition 3.4, p. 14, Theorem 3.6, p. 15, Theorem 3.7, pp. 15–16, and Dembo–Zeitouni Theorem 5.2.3; References (`:5844–5847`) name the version.

## Verified sound

**Gate, build, dependency check.**
- The worker's gate on this head: every counter `0`, `build=0`, `OK`.
- `lake env lean` on `Suggested.lean` at the branch pin: exit 0, with exactly eight `declaration uses 'sorry'` warnings, at `:116, :140, :169, :205, :229, :253, :270, :292`.
- `git diff --stat 9b14026 HEAD` lists `README.md` only, so `Suggested.lean` is byte-identical to the file the previous review elaborated; its `#check` comparison of all eight signatures and its one-tactic probe (none closes) carry over unchanged.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/OptimalTransport'` is empty.
- The dependency check printed `depcheck: 233 roadmaps, 2263 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- `overlaps.md` and `citations.md` list no conflicting head, no dropped id, no unresolved citation or name. The diff adds no cross-roadmap citation and no new backticked name.

**6.8, against Tau Ceti at `2fd255d` (four declarations opened).**
- `TauCeti/Analysis/Convex/MongeAmpere/Section.lean:345` (lower volume estimate): `IsOpen Ω`, `ConvexOn`, `x ∈ Ω`, section bounded with closure in `Ω`, any linear slope. The README's "for every slope" and "centred in `Ω`" are its hypotheses.
- `…/Section.lean:382` (upper volume estimate): adds the supporting slope at the centre and `λ μ ≤ MA_u` on `Ω`. The README says so. (It does not ask for `x ∈ Ω`; the README's common clause "centred in `Ω`" is a harmless extra.)
- `…/Engulfing.lean:166`: supporting slope at `x`, `S(x,2h)` bounded with closure in `Ω`, `0 < λ`, both density bounds; conclusion for every `y ∈ S(x,h)` and every supporting slope at `y`, with height `(1 + CΛ/λ)h`. The README matches clause by clause.
- `…/Vitali.lean:246`: the hypotheses in order are open `Ω`, convex `u`, the condition on `D` and `H` for every supporting slope, `0 < λ`, the two density bounds, centres in `Ω`, supporting slopes, `S_i ⊆ D`, `0 < h_i`, `4θh_i ≤ H`, `2θ²h_i ≤ H`; the conclusion is a countable pairwise disjoint subfamily with `μ(⋃_t S_i) ≤ √(A(2θ²)ⁿΛ/λ) μ(⋃_s S_j)`. The README sentence has every one of them and nothing more.

**6.11, against `depf-survey`.**
- Wang's counterexample: lines 740–741 (p. 18), for every `p > 1`, with `0 < λ(p) ≤ f ≤ 1/λ(p)`. The README's two cross-references are right: 6.9 (`README.md:2697–2700`) asks for continuity of `f` for `W²,p_loc` (survey Theorem 2.20 and the localization after it, lines 734–739), and 6.8 stops at `W²,1+ε`.
- The function (2.26): lines 709–714 (p. 18), `n ≥ 3`, class `C^{1,1-2/n}`. The two-dimensional strict-convexity theorem: lines 719–720. The README's determinant and domain differ from the printed ones, and the README says so; the recomputation is in the table and under Source issues.
- 6.9's `C^{0,α} ⇒ C^{2,α}` tier, which item 3 says fails without strict convexity, is the survey's Theorem 2.19 (lines 725–727); the example has a smooth right-hand side between positive bounds on the slab and is not `C²`, so it is a counterexample to exactly that tier.
- `README.md:833` still calls the Tau Ceti example "Layer 6.11"; it is item 1 there.

**13.13, against `leonard-schrodinger-mk` (arXiv:1011.2564v1).**
- Proposition 3.4: line 730, p. 14. Theorem 3.6: line 770, p. 15. Theorem 3.7: line 797, p. 15, continuing on p. 16.
- Theorem 3.9: lines 859–869, p. 17. The process is `x + √(1/k) B` on `ℝᵈ` (line 856); the space is `C([0,1],ℝᵈ)` with uniform convergence; the scale is `k`; the rate is `∫|ω̇ₜ|²/2 dt` for absolutely continuous `ω` with `ω₀ = x` and `∞` otherwise; the proof is referred to Dembo–Zeitouni, Theorem 5.2.3 (line 869). The README's statement is this one with `k = 1/ε`.
- The package manifest has both works under one key each (`leonard-schrodinger-mk`; `dembo-zeitouni`, uncertified, locator Theorem 5.2.3).

**The seeded sample.** None of this round's fifteen sampled targets lies in a changed passage. Two are cited by one: 6.9 (checked above, as 6.11 depends on it) and 6.10 (named only in the unchanged sentence about item 7's target). The other thirteen were not re-read; they are untouched text.

**Ownership.** The changed passages add no construction: 6.8 describes four pinned Tau Ceti declarations, 6.11 adds two examples to this roadmap's own Monge–Ampère layer, 13.13 adds locators. The previous review's ownership search of main and the open heads stands for the untouched text.

**Adversarial table.** Rows for the changed statements carry values computed this round. The remaining rows are carried from the previous report (PRREVIEW-OptimalTransport~10, at `9b14026`), whose statements the diff leaves untouched.

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| 6.8 lower and upper volume estimates (changed) | `u = ‖x‖²/2`, supporting slope | `S = B(x,√(2h))`, `\|S\| = ω_n(2h)^{n/2}`, `MA_u(S) = \|S\|`: `\|S\|·MA_u(S) = ω_n² 2ⁿ hⁿ`; both estimates scale as `hⁿ` with `λ = 1` | hold |
| 6.8 lower estimate, "every slope" (changed) | `u = x²/2` on `ℝ`, `x = 0`, slope `ℓ = 1` | `S = {y²/2 − y < h} = (1 − √(1+2h), 1 + √(1+2h))`, bounded, `\|S\| = 2√(1+2h) ≥ 2√(2h)` | holds without a supporting slope |
| 6.8 engulfing (changed) | `u = ‖x‖²/2`, `y ∈ B(x,√(2h))` | `B(x,√(2h)) ⊆ B(y,√(2θh))` needs `√(2θh) ≥ 2√(2h)`, i.e. `θ ≥ 4`; no `θ < 4` works at a boundary point | a constant `C ≥ 3` is necessary, consistent with `∃ C` |
| 6.8 covering lemma (changed) | `u = ‖x‖²/2`, `Ω = D = ℝⁿ`; `S(0,k)`, `k ≥ 1` | `λ = Λ = 1`, `θ = 1 + C`, radii `√(2h_i) ≤ √(H/(2θ))` from `4θh_i ≤ H`; nested balls: disjoint subfamily is one ball, `∞ ≤ c·ω_n(2k)^{n/2}` false | holds; height bound necessary, as the new Check says |
| 6.8 covering constant (changed) | `Λ/λ → ∞` | `θ → ∞`, `1/√(A(2θ²)ⁿΛ/λ) → 0` | "not uniform over convex `u`" is right |
| 6.11 item 3, block determinant (changed) | `g = r^a`, `h = 1 + x₁²` | `2r^a · a(a−1)r^{a−2}h − (2a x₁ r^{a−1})² = 2a r^{2a−2}((a−1) − (a+1)x₁²)` | matches |
| 6.11 item 3, power of `r` (changed) | general `n` | `(n−2)(a−2) + 2a − 2 = na − 2n + 2`; zero iff `a = 2 − 2/n`; positivity iff `x₁² < (a−1)/(a+1) = (n−2)/(3n−2)` | matches |
| 6.11 item 3 (changed) | `n = 3`: `x₁ = 1/3`, `1/2`; `n = 2` | `a = 4/3`, `(32/27)(1+x₁²)(1−7x₁²)`: `(32/27)(10/9)(2/9) = 640/2187`; `(32/27)(5/4)(−3/4) = −10/9`; `a = 1`: `−4x₁²` | matches the Checks; the survey's `B_{1/2}` is too large |
| 6.11 item 3, convexity and the Aleksandrov measure (changed) | the segment `{x' = 0}`, codimension `n−1 ≥ 2` | `u ∈ C¹` (`a > 1`), `∇u = 0` there, `∂u(segment) = {0}`, measure `0`; positive semidefinite Hessian off a set of codimension `≥ 2` plus continuity gives convexity on the slab | holds |
| 6.11 item 3, regularity (changed) | `r → 0` | `∂²u/∂r² = a(a−1)r^{a−2}h → ∞` since `a < 2`; `\|∇_{x'}u\| = a r^{a−1}h`, Hölder exponent `a − 1 = 1 − 2/n` exactly | `C^{1,1−2/n}`, not `C²` |
| 6.11 item 2 (changed) | against 6.8 and 6.9 | Wang: bounds `λ(p) ≤ f ≤ 1/λ(p)` only; 6.9 adds continuity for all `p`; 6.8 gives `1+ε` | consistent |
| 13.13 Schilder (changed) | `n = 1`, `x = 0`: `γ = 2t`; `γ = 2t²`; generator `εΔ` | `∫₀¹ 4/2 = 2 = \|2−0\|²/2`; `∫₀¹ 16t²/2 = 8/3 > 2`; variance `2ε` gives rate `∫\|ω̇\|²/4`, value `1` | holds; convention pinned |
| 13.13 scale (changed) | `k = 1/ε` | `x + √(1/k)B = x + √ε B`, covariance `εt`, generator `(ε/2)Δ` as in 13.12's Check | consistent with 13.12 |
| H1 Gangbo–McCann | `h = x²/2`, `U[0,1] → U[1,2]`; `d = 0` | `T = x+1`, cost `1/2`; one point, cost `0` | holds (carried) |
| H2 Caffarelli | `X = (0,1)`, `Y = (0,2)`, `f = 1`, `g = 1/2` | `T = 2x`, exponent `1` | holds (carried) |
| H3 De Philippis–Figalli | `c = 2 − ⟨x,y⟩`; `c ≡ 0` | `−Dₓc = y` injective; `−Dₓc ≡ 0` | twist excludes `c ≡ 0` (carried) |
| H4 McCann | `M = ℝ`, `U[0,1] → U[1,2]` | `T = x+1`, cost `1/2` | holds (carried) |
| H5 Figalli | `U[0,1] → U[1,2]`, `c = \|x−y\|` | `x+1` costs `1`; `2−x` costs `1` | existence only (carried) |
| H6 Agueh–Carlier | two segments in `ℝ²`; `n = 0` | two midpoint laws of value `1/6`; `dimH univ = 0` forces mass `0` | excluded by the hypothesis; vacuous at `n = 0`, as the docstring says (carried) |
| H7 Gaussian | `n = 1`, `C = (1,4)`, `w = (1/2,1/2)` | `√S = 3/2`, `S = 9/4` | holds (carried) |
| H8 Schrödinger potentials | one-point spaces | `dπ/dR = 1`, `φ + ψ = 0` | holds (carried) |
| 6.1 | `‖x‖²/2`; `‖x‖` on `ℝ²`; `\|x\|` on `ℝ` | Lebesgue; `π δ₀`; `2δ₀` | hold (carried) |
| 6.2 | `Ω = (−1,1)`, `u = x²−1`, `v = \|x\|−1` | masses `4 ≥ 2`, `v(1/2) = −1/2 > −3/4 = u(1/2)` | holds (carried) |
| 10.5 | `Φ = x²/2`; `−x⁴`; `−x²` | `(1+t/k)^{−k} → e^{−t}`; infimum `−∞`; `(1−2t/k)^{−k} → e^{2t}` | hold (carried) |
| 11.8 | `n = 3`; `n = 1`, `m = 1/4` | `2/3 > 3/5`; moment `5`, `∫ρ^{1/4} = ∞` | hold (carried) |
| 13.13 identity | `π = N(0,I₂)`, `ε = 1` | `1 − log(2πe) + (1/2)log(2π) = −(1/2)log(2π)` on both sides | holds (carried) |

The other rows of the previous report's table (1.2, 1.4, 1.5, 1.6, 2.5, 5.7, 8.3, 8.4, 10.3, 11.2, 11.3, 12.1, 12.3, 12.4) concern untouched statements and stand as recorded there.

## Not verifiable

- **Dembo–Zeitouni**, Theorem 5.2.3: settled as uncertified; the number is confirmed only through `leonard-schrodinger-mk` line 869.
- **X.-J. Wang's counterexample** and **Alexandrov's two-dimensional strict-convexity theorem**: read only as quoted in `depf-survey`, p. 18, which is how the README cites them.
- **Villani 2003 and 2009**, **Ambrosio–Gigli–Savaré 2008**, **Kechris**, **Huang**, **Lisini 2007**: as in the previous report; none is cited by a changed passage.
- **Elaboration at main's pin** was not run: Lean is run only from the pull-request worktree, which pins Tau Ceti `a91d3aa`. The four Tau Ceti declarations of 6.8 were read as source text at `2fd255d`.

## Source issues

- **Error** in depf-survey at (2.26), p. 18: the source says `|x'|^{2-2/n}(1+x₁²)` has Hessian determinant `c_n(1+x₁²)^{n-2}(1-x₁²)`, positive in `B_{1/2}`; it should be `c_n(1+x₁²)^{n-2}(1 - ((3n-2)/(n-2))x₁²)`, positive only for `x₁² < (n-2)/(3n-2)`; affects a stated result.
