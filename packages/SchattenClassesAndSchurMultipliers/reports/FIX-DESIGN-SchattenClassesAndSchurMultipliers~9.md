# FIX-DESIGN-SchattenClassesAndSchurMultipliers~9

Review settled: `REV-DESIGN-SchattenClassesAndSchurMultipliers~8` (one finding).

## F01 (P2) — applied

§1.4 bullet "Interpolation: `log ‖T^{(m)}‖_p` and `log ‖T‖_{cb,p}` are convex in `1/p`" → for
`1 ≤ p₀, p₁ ≤ ∞`, `0 < θ < 1`, if both endpoint norms of `T^{(m)}` (resp. `‖T‖_{cb,p_j}`) are finite
then `‖·‖_{p_θ} ≤ ‖·‖_{p₀}^{1−θ}‖·‖_{p₁}^θ`, with the truncation route; new Check (the witness); plan
api `cbNorm_interpolation` restated, plan test `interpolation_needs_finite` added.

Verification of the claim. On `S₂(ℓ²(ℕ))` take `w₀ = diag(1/(j+1))`: `Σ (j+1)^{−4/3} < ∞` and
`Σ (j+1)^{−1} = ∞`, so `w₀ ∈ S_{4/3} ∖ S₁`. The linear `T` fixing `w₀` and vanishing on `S₁` and on
an algebraic complement of `S₁ ⊕ ℂw₀` has `‖T‖₁ = 0` (every `A ∈ S₂` with `‖A‖₁ ≤ 1` lies in `S₁`),
`‖T‖₂ = ∞` (a bounded map vanishing on the dense subspace `S₁` of `S₂` is `0`, and `T w₀ = w₀ ≠ 0`),
and `‖T‖_{4/3} ≥ 1`. With `p₀ = 1`, `p₁ = 2`, `θ = 1/2`: `1/p_θ = 1/2 + 1/4 = 3/4`, and in `[0, ∞]`
`0^{1/2} · ∞^{1/2} = 0 · ∞ = 0 < 1`. The old bullet, read as the inequality §4.2 uses, is false;
read as convexity of an extended-real function it has `log ‖T‖₁ = −∞` and `log ‖T‖₂ = +∞` at once,
where convexity has no meaning. The finding is right.

Verification of the repair (the reviewer's wording, checked and kept with the route spelled out).
Let `C_j = ‖T^{(m)}‖_{p_j} < ∞` and `q = max(p₀, p₁) ≥ p_θ`. (i) §1.3 applies to `T^{(m)}` on the
finite-rank operators of `H^m` with these constants, so `‖T^{(m)} B‖_{p_θ} ≤ C₀^{1−θ}C₁^θ ‖B‖_{p_θ}`
for finite-rank `B`. (ii) For `A ∈ S₂(H^m)` with `‖A‖_{p_θ} ≤ 1`, `A ∈ S_q` with
`‖A‖_q ≤ ‖A‖_{p_θ}` (§1.1); its Schmidt truncations `A_k` have finite rank, `‖A_k‖_{p_θ} ≤ ‖A‖_{p_θ}`,
and `‖A − A_k‖_q → 0` (tail of `Σ sₙ^q` for `q < ∞`; `= s_k → 0` at `q = ∞`, `A` being compact).
(iii) `A − A_k ∈ S₂`, so `‖T^{(m)}(A − A_k)‖_q ≤ C_q ‖A − A_k‖_q → 0` by the definition of the norm as
a supremum over `S₂`; the operator norm is at most every extended gauge, so `T^{(m)} A_k → T^{(m)} A`
in operator norm. (iv) Lower semicontinuity of the gauge (§1.1) gives
`‖T^{(m)} A‖_{p_θ} ≤ liminf ‖T^{(m)} A_k‖_{p_θ} ≤ C₀^{1−θ}C₁^θ`. The completely bounded form follows
because `‖T^{(m)}‖_{p_j} ≤ ‖T‖_{cb,p_j}` and the supremum over `m` is taken last. Nothing in the
route uses `p_θ ≤ 2` or `p_θ ≥ 2`; the three configurations `p_θ ≤ 2 ≤ p₁`, `2 < p_θ ≤ p₁`,
`p_θ ≤ p₁ ≤ 2` are covered by the single choice `q = max(p₀, p₁)`.

Pattern searched (the same `[0, ∞]` interpolation law elsewhere in the roadmap):

- §4.2 (Schur multipliers, `‖S_M‖_{p_θ} ≤ ‖S_M‖_{p₀}^{1−θ}‖S_M‖_{p₁}^θ` with no finiteness
  hypothesis). The statement is true in `[0, ∞]`, as the reviewer says, but its route cited only
  "§1.3 at every amplification level", which needs finite constants. Repaired: the finite case is
  now the §1.4 law for `T = S_M` and `S_{M_m}` (§3.5); a zero endpoint norm forces `S_M = 0` on the
  finite-rank operators, hence on `S₂` (bounded there, §3.1; density, §1.1), hence `M = 0` (§3.1),
  so `0 · ∞` never occurs and an infinite endpoint makes the right side `∞`. The statement itself is
  unchanged; `[0, ∞]` is now said explicitly; *Needs:* gains §1.1, §3.1, §3.5; plan target 4.2 gains
  the `θ`, `p_θ` quantifiers, the same clause, and prerequisites `target:1.1`, `target:3.1`,
  `target:3.5`.
- Summary, "log-convex in `1/p`" (Schur multipliers only): kept. For `M ≠ 0`,
  `‖S_M‖_p ≥ ‖S_M‖₂ = ‖M‖_∞ > 0`, so the logarithms lie in `(−∞, ∞]` and convexity has its usual
  meaning; for `M = 0` every norm is `0`. No `(−∞) + (+∞)` arises.
- §1.3: unchanged. Its constants are real (`C₀, C₁ ≥ 0` in the plan) and `T` is defined only on
  finite-rank operators; even with `C₁ = ∞`, `C₀ = 0` forces `T = 0` on its whole domain, so the
  `[0, ∞]` reading is also true.
- §10.4 operator form: unchanged; it already requires finite constants `C₂, C_∞ ≥ 0` and treats
  zero constants by `ε`.
- NoncommutativeIntegration §2.3 contract (`‖T‖_θ ≤ ‖T‖₀^{1−θ}‖T‖₁^θ`): bounded operators between
  couples, finite norms; unchanged.

## Adversarial pass

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.4 interpolation (new), witness | `T` fixing `w₀ = diag(1/(j+1))`, `0` on `S₁`; `p₀ = 1`, `p₁ = 2`, `θ = 1/2` | `‖T‖₁ = 0`, `‖T‖₂ = ∞`, `‖T‖_{4/3} ≥ 1`; old right side `0^{1/2}∞^{1/2} = 0` | hypothesis fails, nothing asserted | new Check |
| §1.4 interpolation, zero endpoint with finite other | `T` bounded on `S₂` with `‖T‖₁ = 0`, `p₁ = 2`, `p_θ = 4/3` | `T = 0` on the dense `S₁`, bounded, so `T = 0`; left side `0`, right side `0^{1/2}‖T‖₂^{1/2} = 0` | holds | none |
| §1.4 interpolation, cb level | transpose `t` on `M_n`, `p₀ = 1`, `p₁ = ∞`, `θ = 1/2` (`p_θ = 2`) | `‖t‖_{cb,2} = 1 ≤ n^{1/2} n^{1/2} = n` | holds | none |
| §1.4 interpolation, cb level | transpose `t` on `M_n`, `p₀ = 2`, `p₁ = ∞`, `θ = 1/2` (`p_θ = 4`) | right side `1^{1/2} n^{1/2} = √n` | finite bound, consistent with `‖t‖_{cb,4} ≥ ‖t‖_4 ≥ 1` | none |
| §1.4 interpolation, identity | `T = id` on `S₂(ℂ²)`, any `p₀, p₁, θ` | every `‖id‖_p = 1`; `1 ≤ 1^{1−θ}1^θ = 1` | equality | none |
| §1.4 truncation step, `q = ∞` | `A = diag(1/(j+1))`, `p₀ = 1`, `p₁ = ∞`, `p_θ = 2` | `‖A − A_k‖ = 1/(k+1) → 0`; `‖A_k‖₂² = Σ_{j<k}(j+1)^{−2} ≤ π²/6 = ‖A‖₂²` | converges | none |
| §1.4 truncation step, `q < ∞` | `A = w₀`, `p₀ = 1`, `p₁ = 2`, `p_θ = 4/3` | `‖w₀ − A_k‖₂² = Σ_{j≥k}(j+1)^{−2} → 0`; `‖A_k‖_{4/3} ≤ ‖w₀‖_{4/3}` | converges | none |
| §1.4 degenerate | `p₀ = p₁` | `p_θ = p₀`, bound `‖T‖_{p₀} ≤ ‖T‖_{p₀}` | trivial | none |
| §1.4 zero space | `H = K = 0` | all norms `0`; `0 ≤ 0` | holds | none |
| §4.2, `M = 0` | any `p₀, p₁` | all norms `0`; `0 ≤ 0^{1−θ}0^θ = 0` | holds | route clause |
| §4.2, zero endpoint forces `M = 0` | `{1, 2}`, `M = 1_{(1,2)}` | `S_M(E₁₂) = E₁₂`, so `‖S_M‖₁ ≥ 1 ≠ 0`, consistent with `M ≠ 0` | holds | none |
| §4.2, infinite endpoint | `‖S_M‖_∞ = ∞`, `‖S_M‖₂ = ‖M‖_∞ = a > 0`, `θ = 1/2` | right side `a^{1/2} ∞^{1/2} = ∞` | holds | route clause |
| §4.2, finite endpoints | triangular truncation on `M₂`, `p₀ = 2`, `p₁ = ∞`, `p_θ = 4` | right side `1^{1/2}(2/√3)^{1/2} = 1.0746`, left side `≥ ‖S_M‖₂ = 1` | holds | none |
| §4.2, cb zero endpoint | `‖S_M‖_{cb,p₀} = 0` | `‖S_M‖_{p₀} ≤ ‖S_M‖_{cb,p₀} = 0`, so `M = 0` | holds | clause added |
| Summary "log-convex" | `M ≠ 0`; `M = 0` | `‖S_M‖_p ∈ [‖M‖_∞, ∞]`, logs in `(−∞, ∞]`; constant `−∞` | meaningful | none |
| §1.3, `[0, ∞]` reading | `C₀ = 0`, `C₁ = ∞` | `T = 0` on finite rank, left side `0` | holds | none |

## Checks run

Dependency check (`gate --only SchattenClassesAndSchurMultipliers`), after the edits:

```
candidate: SchattenClassesAndSchurMultipliers is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2245 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

`plan.json` parses as JSON after the edit; its formatting is preserved (one-space indent, UTF-8).

There is no `Suggested.lean` at the design stage, so no `#check` audit or elaboration was run and no
Lean name was added or removed; the plan's internal names (`cbNorm_interpolation`,
`SchattenClasses.schurMultiplier_interpolation`) are unchanged.

## Gate failures

None were listed for this round.

## For the maintainer

- No target, supplier, gap, citation or `sources.toml` entry was added or changed; no new source was
  read beyond lafforgue-delasalle-2011 lines 244–252 (Remark 1.4), whose statement concerns Schur
  multipliers only and is consistent with the §4.2 wording.
- No new construction was introduced, so no new ownership question arises; the ownership checks of
  earlier rounds stand. No name that another roadmap cites changed.
- The general `T` law of §1.4 now carries an explicit finiteness hypothesis; the Schur-multiplier law
  of §4.2 keeps none, and the README says why.
