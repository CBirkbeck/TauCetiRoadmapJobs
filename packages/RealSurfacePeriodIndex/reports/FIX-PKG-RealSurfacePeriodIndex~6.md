# FIX-PKG-RealSurfacePeriodIndex~6

Repair of the three findings of the round-5 review (all P3). All three were verified as correct and applied. The F03 pattern search found two more imprecise B19 locators in `Suggested.lean` docstrings, and both were repaired. No Lean signature, target, layer or supplier changed.

Files changed: `packages/RealSurfacePeriodIndex/README.md` (§1.6 fourth Check; §0.13 proof step 3 and a new Check; §7.13 locator), `packages/RealSurfacePeriodIndex/Suggested.lean` (three docstring locators), `packages/RealSurfacePeriodIndex/sources.toml` (EKM locator list gains §98, p. 390). `design/plan.json` and `metadata.toml` are unchanged.

## F01 (P3) — applied

Verified. O = R e₁₁ ⊕ R e₁₂ ⊕ tR e₂₁ ⊕ R e₂₂, so O/tO has dimension 4. For x = [e₁₂] and y = [te₂₁]: x² = y² = 0, and xy = te₁₁ and yx = te₂₂ lie in tO. One-sided products with the idempotents keep span(x, y) inside itself (e₁₁x = x = xe₂₂, e₂₂y = y = ye₁₁, all others 0). So J = span(x, y) is a two-sided ideal with J² = 0, and the quotient is ℂe₁₁ ⊕ ℂe₂₂ ≅ ℂ × ℂ. Entrywise reduction kills y and has the 3-dimensional upper-triangular image.

Old → new (§1.6, fourth Check): "fibre … upper triangular 2 × 2 matrices" became a 4-dimensional fibre with radical J = span(x, y), J² = 0 and quotient ℂ × ℂ, unlike M₂(ℂ) with radical 0. The upper-triangular algebra is named as the entrywise-reduction image, O/tO divided by ℂy. The non-Azumaya conclusion is kept.

Pattern search: "upper triangular", "order", "entrywise" and "fibre at t = 0" occur nowhere else in the README.

## F02 (P3) — applied

Verified. In (a, b) with basis i, j, ij, a trace-zero x = x₁i + x₂j + x₃ij has x² = ax₁² + bx₂² − abx₃², since the cross terms anticommute and (ij)² = −ab. Nrd(x) = −x² (EKM line 20437, printed p. 390). Tau Ceti's `QuaternionAlgebra.pureNormForm_apply_coordinates` (`TauCeti/Algebra/Quaternion/NormForm.lean:183`) gives −a, −b, ab, as does QuadraticFormInvariants Layer 2 (`TauCetiRoadmap/QuadraticFormInvariants/README.md:715`). So ⟨a, b, −ab⟩ is the square form, the negative of the pure norm. The radicand F(√e) matches the square form, so the coefficients, the Albert form and EKM Theorem 98.19 (EKM line 20715, p. 392) stay correct.

Old → new (§0.13 step 3): "pure-quaternion norm forms" became "forms … square forms x ↦ x² on trace-zero quaternions, negatives of the pure reduced norms ⟨−a, −b, ab⟩, ⟨−c, −d, cd⟩" (EKM §98, p. 390). "Common value" became "common nonzero value". New Hamilton Check: i² = −1, Nrd(i) = 1; radicand −1 gives ℂ, 1 gives ℝ.

"Nonzero" is exact. When both factors are division algebras both ternary forms are anisotropic, so an isotropic vector (u, v) of the Albert form has u, v ≠ 0 and q(u) ≠ 0.

Pattern search: the other quaternion norm forms in the README are full norm forms written with the right signs. §0.5 step 3(a) has ⟨1, 1, −f, −f⟩ for (−1, f), and §1.5's Check has ⟨1, −x, −y, xy⟩ for (x, y). Both agree with Nrd ≅ ⟨1, −a, −b, ab⟩ and need no change.

## F03 (P3) — applied

Verified. B19 line 15 opens §0.1 (the general period-index problem). B19 line 36 opens §0.2, and lines 37–39 give the real-surface norm dichotomy ind ∈ {per, 2 per}, both on printed p. 63. README §2.10 already cited §0.2.

Old → new (`Suggested.lean`, docstring of `index_dvd_two_mul_orderOf_of_isRealClosed`): "B19 §0.1, p. 63" → "B19 §0.2, p. 63".

Pattern search, covering every B19 locator in `Suggested.lean` docstrings against the B19 text (page markers checked):

- `index_eq_orderOf_of_forall_isRealClosed`: "§6.4, p. 95" pointed at the start of the u-invariant section. The step the birational form uses (vanishing at all real closures implies vanishing at real points) is at B19 lines 1319–1328, p. 96, where README §7.5 already cites it. Theorem 0.4 itself is deduced in §6.3 at line 1301, p. 95, as README §7.6 cites. New text: "README §§7.5, 7.6; B19 Theorem 0.4, p. 64, its proof in §6.3, p. 95, and the passage from real closures to real points in §6.4, p. 96".
- `exists_common_zero_of_not_isSemireal`: "its proof, p. 96" was wrong, since nothing on p. 96 concerns Theorem 0.13. B19 derives it from Theorem 0.10 by Amer–Brumer in §0.5, lines 143–145, p. 66, and line 1306 on p. 95 refers back there. New text: "B19 Theorem 0.13 and its deduction from Theorem 0.10 by Amer–Brumer in §0.5, p. 66". README §7.13's locator was extended the same way so the two agree.
- These are correct and unchanged:
  - `HasZeroTotalSignature`: B19 §0.5, p. 66, lines 129–131; EKM §36, p. 161.
  - de Jong: Theorem 0.1, p. 63, line 24; Theorem 1.1, p. 69, line 234; CT05 §3, CT05 line 435.
  - Theorem 0.3: p. 64, line 43.
  - Theorem 0.12: p. 66, line 138; proof of u ≥ 4 on p. 96, lines 1329–1338.
  - Theorem 0.10: p. 66, line 123.

## Checks

- **Elaboration.** `lake env lean packages/RealSurfacePeriodIndex/Suggested.lean`, run from the content checkout, exited 0. Its only diagnostics were eight `declaration uses sorry` warnings, at lines 80, 89, 101, 112, 123, 133, 141 and 154; lines shifted after the two docstrings grew by one line each. The three imported Tau Ceti object files (`TauCeti.Algebra.CentralSimple.Index`, `TauCeti.Algebra.BrauerGroup.Group`, `TauCeti.Algebra.BrauerGroup.BaseChange`) were present, so no module build was needed.
- **Signature check.** I put `#check @name` for all nine declarations at the end of a scratch copy of the file, elaborated it once (exit 0), and compared each elaborated type with its README statement. Nothing changed: only docstrings were edited. Every needed binder is still present in its own declaration:
  - `[IsAlgClosed k] [CharZero k]`, `[IsRealClosed R]`, `[Algebra.EssFiniteType _ K]`, the `trdeg` hypotheses and `¬IsSemireal K` where the README requires them;
  - `[Invertible 2]` on the two u-invariant theorems and on `HasZeroTotalSignature`;
  - `[FiniteDimensional K V]` on `HasZeroTotalSignature` and the quadratic-form theorems.
- **Dependency check.** Full output of the prescribed `gate --depcheck` command:

      depcheck: 245 roadmaps, 2240 edges, 0 problem(s)

  There is no UPWARD, CYCLE or moved line.
- **Citations.** `roadmaps resolve` on the README found no cross-roadmap citation and no Lean name that resolves nowhere. The new citation, QuadraticFormInvariants Layer 2 (main), was read directly at `TauCetiRoadmap/QuadraticFormInvariants/README.md:709–719`.
- **Manifest.** `sources.toml` still parses. Only EKM's `locator` changed, gaining "§98 (pure quaternions and the reduced norm, p. 390)". No key was added and nothing was requested, so `needs-references.toml` was not written.
- **House style.** The README has no LaTeX delimiters. All new text is Unicode prose with no process wording, and no `Suggested.lean` line is longer than 100 characters.

## Adversarial pass on new or changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §1.6 Check: fibre of O = [[R,R],[tR,R]], R = ℂ[t]_(t) | O; M₂(R); entrywise image | dim O/tO = 4. x² = 0, y² = t²e₂₁² = 0, xy = te₁₁ ∈ tO, yx = te₂₂ ∈ tO. dim J = 2, J² = 0, quotient dimension 2 = ℂ × ℂ. Entrywise image dimension 3, kernel ℂy. M₂(R) fibre dimension 4, radical 0. Generic fibre of O is M₂(ℂ(t)), since t is a unit in K. | Corrected. Non-simple fibre, so O is not Azumaya. |
| §1.6 Check: the construction in the same example | β = 0, A = M₂(K) | 𝒞 = R (c = 1), D = K (e = 1), r = 1, m = 2, V = K², N = R², 𝒜 = End_R(R²) = M₂(R), degree 2 = d, class 0 = β. | Agrees with steps 1–3 of §1.6. |
| §0.13 step 3: square form versus pure norm | (−1,−1), vector i | i² = −1; Nrd(i) = i·(−i) = 1. Square form ⟨−1,−1,−1⟩(1,0,0) = −1; pure norm ⟨1,1,1⟩(1,0,0) = 1. Tau Ceti coordinates −a·1 − b·0 + ab·0 = 1. | Name corrected. Coefficients kept. |
| §0.13 step 3: common value ↔ common subfield | a = b = c = d = −1 | Common square value −1 gives ℝ(√−1) = ℂ in both factors. ℍ ⊗ ℍ ≅ M₄(ℝ), index 1 ≤ 2. Albert form ⟨−1,−1,−1,1,1,−1⟩ vanishes at (1,0,0,1,0,0): −1 + 1 = 0. Norm value 1 gives ℝ(√1) = ℝ, degree 1. | Consistent with EKM 98.19 (1)⇔(3) and with the first Check. |
| §0.13 step 3: split-factor branch | (−1,−1) ⊗ (1,1) | ⟨1,1,−1⟩ is isotropic at (1,0,1). M₂(ℍ) has index 2 ≤ 2. | Unchanged branch still correct. |
| §0.13 step 3: "nonzero" | Both factors division | A ternary square form q_A(u) = u² = 0 with u ≠ 0 is impossible in a division algebra. An isotropic (u,v) of q_A ⊥ −q_B with u = 0 forces q_B(v) = 0, so v = 0. Hence u, v ≠ 0 and e ≠ 0. | The added word is exact. |
| §0.13 step 1 normal form (recomputed, since step 3 uses it) | φ = ⟨x₁,…,x₆⟩, e = −x₁x₂x₃ | ex₃ = −x₁x₂x₃² ≡ −x₁x₂ ≡ −ab. ex₆ = −x₁x₂x₃x₆ ≡ x₄x₅ ≡ cd iff −x₁⋯x₆ is a square, which is the trivial signed discriminant. | Unchanged. |
| Norm bound locator | B19 lines 15, 36–39 | §0.1 begins at line 15 (general period-index problem); §0.2 begins at line 36, dichotomy at 37–38, p. 63 (page 1 of the article, printed 63). | Lean docstring corrected to §0.2. |
| Theorem 0.4 birational locator | B19 lines 1284, 1301, 1305, 1315–1328 | §6.3 starts at line 1284 (p. 95); Theorem 0.4 deduced at line 1301 (p. 95); §6.4 starts at line 1305 (p. 95); the real-closure argument is at lines 1319–1328, after the p. 96 marker at line 1315. | Docstring now cites §6.3 p. 95 and §6.4 p. 96, as README §§7.5–7.6 do. |
| Theorem 0.13 locator | B19 lines 143–147, 1306, 1316–1338 | Deduction via Amer–Brumer at lines 143–145 (p. 66, page 4 marker at line 113). Page 96 (lines 1316–1338) holds only the proof of Theorem 0.12. | Docstring "its proof, p. 96" replaced. README §7.13 now names the §0.5 deduction. |

## Gate failures

None were listed for this round.

## Notes for the maintainer

- No Lean name changed, so no other roadmap is affected. The only cross-roadmap text added is a citation of QuadraticFormInvariants Layer 2, on main and already a supplier of §0.13.
- Ownership: no construction was added, so nothing new was checked for ownership against open pull requests. The §1.6 order and the §0.13 Hamilton example are Checks, not targets.
- The three supplier gaps (`real-artin-comparison`, `picard-cokernel-torsion-free`, `at2-stratified-pair-transport`) are untouched, and `design/plan.json` is unchanged.
- No suspicious instructions were found in the review text.
