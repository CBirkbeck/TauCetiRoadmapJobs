# Review of SchattenClassesAndSchurMultipliers (pull request #2421 at cc8b39d)

**Verdict:** accepted

## Previous findings

- R01 — repaired: "cyclicity `τ(XY) = τ(YX)`. Nothing else of §2.1 is consumed: the norming element of a nonzero finite-rank `X` with polar decomposition `X = u|X|` is constructed in §1.2 here, as `|X|^{p−1}u*/‖X‖_p^{p−1}`" (`README.md:469–473`).
- R02 — repaired: the description now reads "On main, the roadmap consumes OperatorTheory/OperatorIdeals (Parts A–C), … It declares two supplier gaps: `sigma-finite-hilbert-schmidt-kernels` … and `semifinite-martingale-bmo-interpolation`, requested of a NoncommutativeIntegration, Part II".

## Verified sound

| Target | Instance | Left side | Right side | Result |
|---|---|---|---|---|
| §2.1 contract: norming element `|X|^{p−1}u*/‖X‖_p^{p−1}` (changed) | `X = E₁₂`, `p = 2` | `u = E₁₂`, `|X| = E₂₂`, `Y = E₂₂E₂₁ = E₂₁`, `‖Y‖₂ = 1` | `Tr(XY) = Tr(E₁₁) = 1 = ‖X‖₂`; other order `u*|X| = E₂₁E₂₂ = 0` | sound |
| same (changed), `p ≠ 2`, non-unit values | `X = diag(1, 2)`, `p = 3`; `X = 2E₁₂`, `p = 2` | `Y = diag(1,4)/9^{2/3}`, `‖Y‖_{3/2} = 9^{2/3}/9^{2/3} = 1`; `Y = 2E₂₂E₂₁/2 = E₂₁` | `Tr(XY) = 9/9^{2/3} = 9^{1/3} = ‖X‖₃ ≈ 2.080`; `Tr(|X|²u*u)/‖X‖₂ = 4/2 = 2 = ‖X‖₂` | sound |
| same (changed), `p = 1` and the finite-rank restriction | `X = E₁₂`; `X = diag((j+1)^{−2})` on `ℓ²(ℕ)` | `Y = u* = E₂₁`, `‖Y‖ = 1`, `Tr(XY) = 1 = ‖X‖₁`; `u* = 1`, not compact | `Tr(|X|u*u) = Tr(E₂₂) = 1`; §1.2 compressions: `Tr(XP_d) = Σ_{j<d}(j+1)^{−2} → π²/6` | sound; "finite-rank" is needed |
| §2.1 contract: what is consumed (changed) | NoncommutativeIntegration §2.1 on main (51d880d, README lines 454–462) | contract: `L^{p'} = (Lᵖ)*` for `1 ≤ p < ∞` under `τ(XY)`, plus cyclicity | NI §2.1: `y ↦ (x ↦ τ(xy))` an isometry onto the dual for `1 ≤ p < ∞` (`p = 1`: `L^∞ = M`), cyclicity (Hiai Prop. 5.7) | sound |
| §1.2 norming by finite-rank operators (sample; cited by the change) | `X = 1` on `ℓ²(ℕ)`, `p = 2`; `X = E₁₂`, `‖·‖` | `B = P_d/√d`, `‖B‖₂ = 1`, `Tr(XB) = √d → ∞` | `‖X‖₂ = ∞`; `Tr(X(e₂ ⊗ e₁*)) = ⟨e₁, Xe₂⟩ = 1 = ‖X‖` | sound; caspers-delasalle-2015 lines 638–642, lafforgue-delasalle-2011 line 400 |

The rows for the untouched statements (the other sampled targets and the 19 declarations of `Suggested.lean`) stand as in the previous review, of 7cdcea4.

- Source locators: the 2 locators of §1.2, the section the changed bullet cites, read at their lines: caspers-delasalle-2015 lines 638–642 (bilinear duality `Tr(AB)` between `S_p` and `S_q`) and lafforgue-delasalle-2011 line 400 (estimate (9)). The diff adds or changes no locator.
- Internal consistency: the changed bullet agrees with the §1.2 route (`README.md:680–688`: `Y = Σ_i s_i^{p−1} v_i ⊗ u_i*`, `Tr(XY) = Σ_i s_i^p/‖X‖_p^{p−1}`). It also agrees with the §1.2 *Needs:* line (`README.md:698–699`), which cites NI §2.1 for the duality alone. Every finite-rank `X` maps the finite-dimensional `F = ran X + (ker X)^⊥` into itself and vanishes on `F^⊥`, so it falls under the §1.2 construction.
- Pull-request text: the description's dependency paragraph was checked against the README's supplier ids: OI-A12–OI-C14, V2/V2.RectangularL2/V4.Core/V13b, NI §1.3–§1.5, §2.1, §2.3, §2.5, §2.6, §3.5 and §4.4, C1.6/C3.2 and B4.0. NI §4.3 (`README.md:136`) is named but not consumed. Both gaps are stated, and PDE and UnboundedOperators are not consumed (`README.md:112–119`). The title and summary block still match the head.
- Gate at cc8b39d: every check passed, in the worker's run and in a rerun. Dependency check: `depcheck: 239 roadmaps, 2251 edges, 0 problem(s)`. Nothing changes outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 11 `sorry` warnings and nothing else. `Suggested.lean` is byte-identical to 7cdcea4, so the previous `#check @name` comparison and one-tactic probe stand.
- Overlap check: for the changed bullet, read NoncommutativeIntegration (main) §2.1. Shared object: the `Lᵖ` norming element. NI §2.1 owns the duality, and §1.2 here builds the finite-rank norming element as a route step, because NI's stated form does not norm. Also read SchrodingerOperatorsAndSpectralTypes (open; new to the closest list): it shares only the suppliers AutomorphicSpectralTheory §0.8 and OperatorIdeals, which are consumed, not owned. BochnerSpaces, VonNeumannAlgebras, BanachSpaceTheory, QuantumFoundations, NoncommutativeGeometry and OperatorIdeals stand as in the previous review. `overlaps.md`: no dropped ids, and no other pull request changes this roadmap.
- Source independence: changed passages only. 2 passages compared with 2 sources: the §2.1 contract bullet and the §1.2 construction it points to, against caspers-delasalle-2015 lines 638–642 and lafforgue-delasalle-2011 line 400. Only forced formulas are shared. The largest share is lafforgue-delasalle-2011, 42 of 115 locators, unchanged. Contents were not compared again, because no layer was added, removed or reordered.

## Not verifiable

- None for the changed passages. The seven uncertified (paywalled) citations listed in the previous review, of 7cdcea4, are unchanged and are cited by locator only.

## Source issues

- none

## For the human reviewers

- NoncommutativeIntegration on main (`TauCetiRoadmap/NoncommutativeIntegration/README.md` lines 456–457) states the §2.1 norming element as `u*|x|^(p−1)/‖x‖_p^(p−1)`, which is `0` for `x = E₁₂`. This pull request no longer relies on it, and no pull request repairs that text.
