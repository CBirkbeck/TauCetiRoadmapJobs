# FIX-PKG-LieGroupsPartII~4

The review lists one finding (F01, P3). Its section "For the human reviewers" is not a finding, and nothing was changed because of it.

## F01 (P3) — applied

The finding is correct. AdelicAlgebraicGroups is on main, and its §2.1 (`TauCetiRoadmap/AdelicAlgebraicGroups/README.md`, scope at line 44, Conventions at lines 251–254, target at lines 1714–1735) owns `A_G(ℝ)^0`, built from the largest `ℚ`-split central torus of `Res_{F/ℚ} G`. Its Check at line 1739 gives dimension `1` for `𝔾_m` over a number field, against `r₁ + r₂`. The scope section did not name it.

Changes:

- "The roadmap does not own:" gains a bullet. It says that AdelicAlgebraicGroups §2.1 owns the rational split component `A_G(ℝ)⁰`, with the rational characters and `H_G`. It says that this roadmap's split component (`A_G = lieExp(𝔷_𝔭)` in §1.1, `A_L` in §5.1, `exp(V)` in §7.4) is the real-group one, cut out by all continuous positive characters. It also says that on §8.1's real points it can be strictly larger.
- §7.4 gains a Check: `ℝ^× × ℝ^×`, with `F = V` of dimension 2 against 1 for the rational one, and `diag(2, 1/2)`.
- The §7.4 Examples line gains the same example.

The pattern was looked for at every other use of `A_G` or of the split component: §1.1 (line 154), §1.1 Checks (line 163), §5.1, §7.4, §8.1 and the GL_n worked example. The new scope bullet covers §§1.1, 5.1 and 7.4. The Check for `ℝ^×` in §1.1, the Check for `GL_n` in §5.1 and the worked example are cases where the real and rational components coincide (both have dimension 1), so they needed no change. No statement, Lean name or dependency changed. AdelicAlgebraicGroups is named but not consumed, so it has no supplier contract and no `*Needs:*` entry.

### Adversarial pass on the added text

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| §7.4 new Check: `G` = invertible diagonal 2×2 matrices is a self-adjoint linear group | closedness, transpose, components | the off-diagonal entries `= 0` form a closed condition in `GL_2(ℝ)`; `gᵀ = g`; the sign patterns `(±,±)` give 4 components, so `Finite (ConnectedComponents G)` holds | holds |
| `linearLieAlgebra G` | `X` diagonal; `X = E₁₂` | `exp(tX)` is diagonal for every `t`; `exp(tE₁₂) = 1 + tE₁₂` is not diagonal | the diagonal algebra, dimension 2 |
| `F` (symmetric, commuting with `linearLieAlgebra G` and with `G`) | `X = diag(a, b)` | symmetric; diagonal matrices commute with one another and with `G` | `F = V` = diagonal, dimension 2 |
| `⁰G` = `positiveCharacterKernel G` | `χ(x, y) = s log|x| + t log|y|`; the torsion `diag(±1, ±1)` | a continuous `χ : ℝ^× × ℝ^× → ℝ` kills the torsion, and on `ℝ_{>0}² ≅ ℝ²` (through `log`) it is linear; at `diag(2, 1/2)` with `s = 1, t = 0` the value is `log 2 ≈ 0.693 ≠ 0` | `⁰G = {diag(±1, ±1)}`, order 4 |
| `positiveCharacterKernel_mul_exp` at `g = diag(2, 1/2)` | `l = 1`, `X = diag(log 2, −log 2)` | `exp X = diag(2, 1/2)`; `X ∈ F`; uniqueness: `l·exp X = l'·exp X'` gives `exp(X − X') = l⁻¹l' ∈ {diag(±1, ±1)}` with positive entries, so `X = X'` | holds, with exponent nonzero |
| AdelicAlgebraicGroups §2.1 for `𝔾_m` over a real quadratic `E` | largest `ℚ`-split central torus of `Res_{E/ℚ}𝔾_m` | the scalars `𝔾_m ⊂ Res 𝔾_m`; real points `(t, t)`; identity component `t > 0`, dimension 1; `diag(2, 1/2)` is not scalar | dimension 1 against 2, matching its Check (line 1739) and its idele `(2, 1/2)` (line 1743) |
| Rational reading of `⁰G` | rational characters of `Res_{E/ℚ}𝔾_m` | `X*_ℚ = (ℤ²)^{Gal} = ℤ·(1, 1)`, the norm `(x, y) ↦ xy`; at `diag(2, 1/2)`, `|xy| = 1` | `{|xy| = 1}` contains `diag(2, 1/2)`; the Check discriminates |
| §8.1 setting for the Check | `S = {x₁₂, x₂₁}`, `Gℂ = (ℂ^×)²` | connected, transpose-stable; `K = G ∩ O(2) = {diag(±1, ±1)}`, `𝔞` = diagonal, `M = K` meets all 4 components | consistent with `isSelfAdjointLinearGroup_of_zeroLocus` (component condition holds) |
| Scope bullet: "can be strictly larger" | the same group | real split component of dimension 2 ⊋ rational of dimension 1; containment in general: `θ` acts by inversion on the identity component of the maximal `ℝ`-split central torus (its fixed points there are compact, hence trivial), so `Lie(A_G(ℝ)⁰) ⊆ 𝔷 ∩ 𝔭` | holds ("can be", not "is") |
| Scope bullet: `GL_n` over `ℚ` (degenerate agreement) | `n = 1, 2` | real `ℝ_{>0}·1`; rational `ℝ_{>0}·1`; both dimension 1 | agree, so the bullet does not claim strictness always |

## Checks run

- **Elaboration.** `lake env lean packages/LieGroupsPartII/Suggested.lean` from the content checkout: exit 0, wall time 3.1 s, thirteen `declaration uses sorry` warnings (lines 65, 174, 200, 221, 238, 255, 269, 284, 308, 325, 341, 357, 377), nothing else. `Suggested.lean` is unchanged this round.
- **Signatures.** A scratch copy of `Suggested.lean` with `#check @name` for all 26 declarations elaborated with exit 0. I read each elaborated type against its README statement. The only section variable is `{n : ℕ}`, and every hypothesis is an explicit binder; for example, `positiveCharacterKernel_mul_exp` carries `IsSelfAdjointLinearGroup G` and has the four `F` clauses of §7.4. No binder was lost and nothing changed.
- **Dependency check.** Output: `depcheck: 240 roadmaps, 2259 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The one extra edge is the new mention of AdelicAlgebraicGroups, which is on main.
- **Citations.** `roadmaps resolve` on the README finds no unresolved cross-roadmap citation and no unresolved Lean name. The two leads in the worker's list (`LocallySymmetric.IsCartanInvolution.transposeInverse`, `LocallySymmetric.realPoints_lieGroup`) are ArithmeticLocallySymmetricSpaces names at its open head (its README lines 1187 and 581).
- **Style.** The README has no LaTeX delimiters and no process words in the added text.

## Ownership and overlaps

This round adds no new object. The split component's second owner is AdelicAlgebraicGroups §2.1 (on main), which is now named in the scope section with how this roadmap's notion differs. `roadmaps grep 'split component'` also finds ArithmeticLocallySymmetricSpaces §2.1 and EndoscopicTransferAndUnitaryTraceComparison. Both use `A_G` and cite AdelicAlgebraicGroups or the standard notion; neither owns a real-group split component. No overlap item was listed for this roadmap.

## For the maintainer

- No declaration name changed. No other roadmap cites LieGroupsPartII.
- No supplier gap was added: `design/plan.json` is unchanged.
- No source was fetched, and `needs-references.toml` was not written.
