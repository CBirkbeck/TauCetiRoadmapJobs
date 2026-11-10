# Review of DysonBrownianMotion (pull request #2118 at 55687d0)

**Verdict:** accepted

This is an incremental re-review of the 85 lines changed since 54a3228. This head repairs both
findings of the previous review, and the repairs add no new defect. No finding remains. The
folder is ready for a human's final approval.

## Previous findings

- R01 — repaired: `Suggested.lean` lines 42–50 have the integrable-drift `IsDysonSolution` with
  `∀ t, 0 < t → StrictAnti (X t ω)`. Line 57 has `(hx : Antitone x)` and line 124
  `(hd : Antitone d)`. The module docstring (lines 20–23) no longer excludes closed-chamber
  starts. README lines 186–192 and 285–288 match.
- R02 — repaired: the description's Layer 0 entry now reads "Consumes StochasticCalculus (S1.2–S1.3,
  S3.2–S3.4, S4.1–S4.3, S5.1, S5.5, S9.1–S9.3)", which matches README lines 99, 145 and 164.

## Verified sound

**Gate and build.** The worker's gate on 55687d0 passes every check. I ran
the brief's gate command again. Every counter is 0 except `depcheck=1`, which reads "NOT IN ORDER:
DysonBrownianMotion (insert it after its last supplier)". The previous round got the same
result. The configured board order does not list this roadmap yet, and under the brief's rule a
roadmap the order does not list is placed after its last supplier, so this is not a finding.
Nothing changes outside the folder: `git diff --stat origin/main...HEAD` outside the folder is
empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.
`lake env lean` on `Suggested.lean` gives four `sorry` warnings and nothing else, at lines 56,
111, 123 and 142. The branch pins equal main's: Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`. No
line in either file exceeds 100 characters. That resolves the previous report's remark about
line 105, whose docstring is now wrapped at lines 107–110.

Dependency check against the candidate order. It lists this roadmap at line 213, directly after
StochasticCalculus at line 212:

```text
depcheck: 234 roadmaps, 2264 edges, 0 problem(s)
```

**Signatures.** In one scratch file I ran `#check @` on `IsDysonSolution`,
`dysonSystem_exists_unique`, `matrixBrownian_eigenvalues_dyson`,
`matrixBrownian_eigenvalues_strictAnti` and `matrixBrownian_hydrodynamic_limit`, and compared
each with the README.
- `IsDysonSolution` takes `[MeasurableSpace Ω] β n x P B X`.
- `dysonSystem_exists_unique` keeps `[MeasurableSpace Ω]`, `1 ≤ β`, `Antitone x`,
  `[IsProbabilityMeasure P]`, `hB` and `hindep`.
- `matrixBrownian_eigenvalues_dyson` keeps `β = 1 ∨ β = 2`, `Antitone d`,
  `[IsProbabilityMeasure P]`, `hB` and `hindep`.

No binder was lost. The generality matches README §1.1 ("states both cases") and §2.2 ("a start
with decreasing entries, coincident ones included").

**Padding probe.** On a scratch copy I replaced the two changed theorems' `sorry` by
`first | (simp [IsDysonSolution]; done) | rfl | infer_instance | (exact ⟨⟨fun _ _ ↦ x, …⟩, …⟩) | (aesop; done)`.
Both stay open. `dysonSystem_exists_unique` leaves the existence and the uniqueness goals, and
`matrixBrownian_eigenvalues_dyson` leaves its `∃ W` goal. These are AGZ Proposition 4.3.5 and
Theorem 4.3.2, so neither is padding.

**Headlines.**
1. Dyson's theorem: noncollision from every real diagonal start, and now the equation from every
   decreasing diagonal start, coincident entries included. Stated.
2. Existence and uniqueness for real `β ≥ 1` from the closed chamber. Stated, without
   adaptedness. Continuity in the start (the last clause of AGZ Proposition 4.3.5) is not in the
   Summary's list of end theorems. README line 187 qualifies "both cases" by "as pathwise
   existence and uniqueness", so its absence is not an overclaim.
3. The hydrodynamic limit. Stated.
4. `ν ⊞ SC_t`. Named in the docstring as not statable, since the pins have no free convolution
   of measures.

The docstring's remaining bullet (adaptedness, uniqueness in law) is only rewrapped, and the
previous review passed it.

**Adversarial table.** Rows for the changed statements, with computed values:

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| `IsDysonSolution`, coincident start | `n = 2`, `β = 2`, `x = (0,0)` | `StrictAnti` is required only for `t > 0`, so `X 0 = (0,0)` is admitted. The drift of `λ₁` is `r⁻¹/2`, and the gap `r` is BES(3) from 0. `E r_s⁻¹ = s^(−1/2)·E[1/χ₃] = √(2/(πs))`, so `E∫₀ᵗ r⁻¹ = 2√t·√(2/π) = 2√(2t/π)`. Lean's junk `(0−0)⁻¹ = 0` occurs only at `s = 0`, a null set. | admitted, as intended |
| `IsDysonSolution`, integrability clause | any continuous path that satisfies the identity on every `[ε, t]` | For each `k`, the pairs inside `{1..k}` cancel, so `∑_{i≤k} Fᵢ = n⁻¹∑_{i≤k<j}(λᵢ−λⱼ)⁻¹ > 0`. Its integral over `[ε,t]` is `∑_{i≤k}(λᵢ(t)−λᵢ(ε)−σ(Bᵢ(t)−Bᵢ(ε)))`, which converges as `ε → 0`. By monotone convergence each pair term `(λᵢ−λⱼ)⁻¹` with `i < j` (the `k = i` sum) is integrable on `[0,t]`. With `n = 3` and `k = 2`, `F₁+F₂ = ⅓((λ₁−λ₃)⁻¹+(λ₂−λ₃)⁻¹)`. | the clause asks nothing that AGZ's solution lacks |
| same | role of the clause | Lean's `∫` of a non-integrable integrand is 0. The clause makes `D = X − Y = ∫(F(X)−F(Y))` a genuine Lebesgue integral, which the uniqueness argument needs. | needed |
| `dysonSystem_exists_unique`, `hx` | `n = 2`, `x = (0,1)` | Continuity forces `X₁ − X₂ → −1` as `t → 0`, but `StrictAnti` at `t > 0` needs it to be `> 0`. So no solution exists, and `hx` is necessary. | sharp |
| same | `n = 0`; `n = 1`; `β = 1/2` | `n = 0`: every clause is trivial and `√(2/(β·0)) = 0`. `n = 1`: the sum is empty, `X = x + √(2/β)B`, and `X − Y = 0`. `β = 1/2`: the gap is √2·BES(3/2), which hits 0, so `hβ` is needed. | true |
| Monotonicity identity, README line 190 | `n = 2`, `x = (2,0)`, `y = (1,0)` | `F(x) = (1/4,−1/4)` and `F(y) = (1/2,−1/2)`, so `⟨F(x)−F(y), x−y⟩ = −1/4`. On the right, `a = 2`, `b = 1`, and `−½·1/2 = −1/4`. | agrees |
| same | `n = 3`, `x = (3,1,0)`, `y = (2,1,0)` | `F(x) = (5/18, 1/6, −4/9)` and `F(y) = (1/2, 0, −1/2)`, so the left side is `−4/18 = −2/9`. On the right, `a = (2,3,1)`, `b = (1,2,1)`, and `−⅓(1/2 + 1/6 + 0) = −2/9`. In general `⟨F(x), z⟩ = n⁻¹∑_{i<j}(zᵢ−zⱼ)/(xᵢ−xⱼ)`, which gives the formula, and `aᵢⱼbᵢⱼ > 0` in the open chamber. | agrees |
| Uniqueness route, README lines 190–192 | two solutions driven by the same path | `D(0) = 0`. `D` is absolutely continuous with `D' = F(X)−F(Y)` a.e., so `|D(t)|² = 2∫₀ᵗ⟨D, F(X)−F(Y)⟩`. At `s > 0` both points lie in the open chamber, so the integrand is `≤ 0`. No adaptedness is used. | valid |
| `matrixBrownian_eigenvalues_dyson` | `β = 2`, `n = 2`, `d = (0,0)` | `gap² = (g₁₁−g₂₂)²/2 + g₁₂² + g₂₁²`, the squared norm of a 3-dimensional standard Brownian motion. `σ = √(2/4)` and `W = (W₁−W₂)/√2` give `dr = dW + r⁻¹dt`, which is BES(3). `eigenvalues₀(diag 0) = (0,0) = d`. | true; now admitted |
| same | `β = 1`, `n = 2`, `d = (0,0)` | The noise is `[[g₁₁, g₁₂/√2],[g₁₂/√2, g₂₂]]`, so the gap is `√((g₁₁−g₂₂)² + 2g₁₂²)`, which is √2·BES(2). The system gives `dr = √2 dW + r⁻¹dt`, and `E∫₀ᵗ r⁻¹ = (1/√2)·√(π/2)·2√t = √(πt)`. | true |
| same, `hd` | `d = (0,1)`; `d = (1,1,0)` | For `(0,1)` the eigenvalues at `t = 0` are `(1,0) ≠ d`, so `hd` is needed. `(1,1,0)` is antitone and `eigenvalues₀(diag d) = (1,1,0) = d`. | sharp |
| New §1.1 Checks, lines 197–200 | as stated | Monotonicity: `−1/4` on both sides, recomputed above. Coincident start: `√(4/(βn)) = 1` and `2/(nr) = r⁻¹`, so the dimension is `1 + 2·1 = 3`, and `2√(2t/π)` as above. "The previous Check" at line 203 still refers to the `n = 2` Bessel Check. | correct |
| README §2.2, lines 285–288; module docstring, lines 12–14 | wording vs Lean | "decreasing entries, coincident ones included" = `Antitone d`, and "ordered start" = `Antitone x` in the closed chamber of Convention 2. No "strictly ordered", "open-chamber case", "closed-chamber" or "Gronwall" is left (grep). | agrees |

Rows carried forward from the previous report for untouched statements, with the values it
computed:

| Statement | Values (previous report) | Result |
|---|---|---|
| Convention 3 / §2.1 bracket | `(2/(βn))² (βn/2) tr(AB) t = (2/(βn)) tr(AB) t` | agrees |
| `matrixBrownianNoise` vs AGZ Def. 4.3.1 | Off-diagonal variance `t/n` for both β; diagonal variance `2t/n` (`β = 1`) and `t/n` (`β = 2`) | agrees |
| Convention 6 | `G = −m` turns `∂_t G = −G∂_zG` into `∂_t m = m∂_z m` | correct |
| §0.1 Checks, Example | `t`; `2t`; `[B/√2] = t/2`; `[B₁, B₁+B₂] = t` | correct |
| §1.1 `n = 1` and `n = 2` Checks | Empty sum; dimension `1 + 2(2/n)/(4/(βn)) = β + 1` | correct |
| §1.2 Checks and locator | `(2/β)/(2·½) = 2/β`; drift `= (βn)⁻¹∇log p`; `N(0,1)` at `β = 2, n = 1`; (4.3.40) at `t = 1` | correct |
| §2.1 Checks | `2t`, `t`; `(2/4)·2t = t`; `Var Re H₁₂ = t/4` | correct |
| §2.2 Checks, Example | Drift `1/(2(λ₁−λ₂))`; `n − 1 + 2/β`; gap √2·BES(2) | correct |
| §3.1, §3.2 Checks, coupling, time change | `tG² − zG + 1 = 0`; merge at `t = 1`; `1 − e^(−t)`; one space, no joint law (AGZ Prop. 4.3.10); interaction `e^(−t/2)·e^t·e^(−t/2) = 1` | correct |
| `matrixBrownian_eigenvalues_strictAnti` | `n = 0, 1`; coincident `d` allowed by Theorem 4.3.2 | true |
| `matrixBrownian_hydrodynamic_limit` | `t = 0`; integrand bounded by `1/|Im z|`; no coupling needed | true |

**Sources, seeded sample, where it falls in the changed passages.** I fetched the authors'
online copy (`agz`) through the sources service; the printed page is the file page − 14.
- §1.1, Lemma 4.3.3 (agz lines 12588–12591, p. 252): hypotheses `β ≥ 1` and a start in the
  open chamber; a unique strong solution in `C(ℝ₊, Δ_N)`; uniqueness of the weak solution.
- §1.1, Proposition 4.3.5 (lines 12952–12957, pp. 259–260): a closed-chamber start; a unique
  strong solution; open chamber for `t > 0`; continuous in the start. This is now the docstring
  citation of `dysonSystem_exists_unique`.
- Definition H.3(iii) (lines 21553–21555, p. 464): drift integrability. It is the new
  `IntervalIntegrable` clause.
- §2.2, Theorem 4.3.2 and the remark after it (lines 12556–12575, p. 251): the start need not
  be in the open chamber (line 12573). Coincident starts are handled in the proof (lines
  12936–12949, p. 259).

After Convention 2's order reversal, hypotheses and conclusions agree with README §§1.1 and 2.2
and with both theorems. The other sampled targets (§§0.1, 1.2, 2.1, 3.1, 3.2) are unchanged, and
the previous report verified them at the agz lines it lists. The README flags no locator as
unverified.

**Library declarations opened at the pins.**
- `ProbabilityTheory.IsBrownianReal` (`Mathlib/Probability/BrownianMotion/Basic.lean:302`).
- `IsPreBrownianReal.eval_zero_ae_eq_zero` (`:99`), which gives `X 0 = x` a.s. from the identity.
- `Matrix.IsHermitian.eigenvalues₀` (`Mathlib/Analysis/Matrix/Spectrum.lean:60`).

Loogle and LeanSearch find nothing at the pins that states the
changed declarations.

**Cross-roadmap citations resolved.**
- StochasticCalculus at its open head (6d441403), which the module docstring names as the
  supplier of the filtration-relative notions: S1.3 (README line 953), S9.3 (line 2990), and
  `IsFilteredBrownian` (`Suggested.lean` line 53).
- RandomMatrices on main (641eaf3): §1.2 (line 308) and §5.1 (line 662), cited in §2.2's
  *Needs:* line.
- The overlap report lists no dropped id, no revision-only id and no other pull request that
  changes this folder.

**Ownership.** `roadmaps grep -i 'IsDysonSolution|dysonSystem|Dyson system|eigenvalues_dyson'`
over main and all open heads hits only this folder.

## Not verifiable

- Potters–Bouchaud chs. 8–9: paywalled, and no legal copy was found. It is cited for orientation
  only, and no changed passage rests on it.
- Tao §3.1: not reopened in this incremental round. No changed passage rests on it.

## Source issues

- **Gap** in agz at Proposition 4.3.5, proof, printed page 261: the source says the limit is the claimed strong solution once it lies in the open chamber for `t > 0`, but never checks drift integrability near `t = 0` (Definition H.3(iii)); it should be argued: each drift sum over the top `k` particles, `n⁻¹∑_{i≤k<j}(λᵢ−λⱼ)⁻¹`, has one sign and a convergent improper integral, so every pair term is integrable; affects the proof.
