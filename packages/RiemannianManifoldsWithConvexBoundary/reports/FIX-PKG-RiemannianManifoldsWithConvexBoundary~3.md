# FIX-PKG-RiemannianManifoldsWithConvexBoundary~3

One review settled: `REV-PKG-RiemannianManifoldsWithConvexBoundary~2` (two findings). Its section
"For the human reviewers" (licence of `paternain-salo-uhlmann2023`) lists no finding and changed
nothing. The two "Source issues" it records (misprints in the source) are not findings either. The
docstrings here already write the second factor of `T` as `τ(x, −v)`, not the misprinted `τ(x − v)`.

## REV-PKG-RiemannianManifoldsWithConvexBoundary~2/F01 (P2) — applied

Verified. Lemma 3.2.11 (`paternain-salo-uhlmann2023` lines 3027–3030) asserts that both `σ` and
`T` are smooth on `SM`. README §5.4 has both, but `Suggested.lean` stated only `σ`. Knowing that
`σ` is smooth and `τ` is continuous does not make `T` smooth, so the identity
`τ = (σ + √(σ² + 4T))/2` (Remark 3.2.13, lines 3046–3055) was not reached.

Changes:
- `Suggested.lean`: new theorem `exists_contMDiff_eq_exitTime_mul_exitTime_neg`, placed after the
  `σ` theorem, with the reviewer's statement. Its docstring cites Lemma 3.2.11 and Remark 3.2.13.
  The Layer 5 item of the module docstring now reads "the regularity of the exit time, the
  smoothness of `σ` and `T` and the identity `Xσ = −2` (§5.4)".
- README §5.4, bullet "Intrinsic reading on `TM`": adds "there is a smooth `G` on `TM` equal to `T`
  on `SM` (`exists_contMDiff_eq_exitTime_mul_exitTime_neg`); with `F` it gives
  `τ = (F + √(F² + 4G))/2` on `SM`".
- README §5.4 Checks, bullet `M = [a, b]`: now also gives `T = (b − x)(x − a)` and its vanishing on
  `∂SM` under strict convexity, and recomputes Remark 3.2.13's formula.
- README Summary: "Lemmas 3.2.3–3.2.11" → "Lemmas 3.2.3 and 3.2.11". These are the end theorems now
  stated in Lean. Lemma 3.2.6 is the restriction of `σ` to `∂SM` (Remark 3.2.7). Under the global
  hypotheses, Lemma 3.2.9 follows from `σ` and `T` by Remark 3.2.13. Lemma 3.2.8 needs `μ` and
  stays a target of §5.4.

The new theorem is genuine, not padding. A one-tactic probe (`rfl`, `trivial`, `tauto`, `simp`,
`simp [exitTime, …]`, the constant `0`, and the `σ` theorem followed by `simp_all`) leaves the goal
unsolved.

Ownership: the product of the exit times of the geodesic flow of a manifold with boundary is
planned only here. `roadmaps grep -i 'exit ?time'` over main and the open heads finds only stopping
times (DysonBrownianMotion, StochasticCalculus) and the flow exit time of
SymplecticGeometry/IntegrableSystems §I5.3, which are different objects. `T` was already a §5.4
target, so this round adds no target.

Pattern search (any other headline result where the Lean file states only part of what the source
asserts): Lemma 3.1.8 (realisation), Lemma 3.1.12 (Hessian characterisation), Lemmas 3.1.12–3.1.13
(leaving), Proposition 3.3.1 (all three conditions are in `isNonTrapping_tfae`) and Lemma 3.3.5
(diffeomorphism through local smoothness plus involution, fixed points, the exchange `∂± ↔ ∂∓`)
are each stated in full. No other case.

## REV-PKG-RiemannianManifoldsWithConvexBoundary~2/F02 (P3) — applied

Verified against the text:
- Lemma 3.2.3 (line 2865) gives continuity on `SM` and smoothness off `∂₀SM`; Exercise 3.2.4 is at
  line 2891.
- Lemma 3.2.6 (line 2896) is the odd extension on `∂SM`.
- Remark 3.2.7 (lines 2926–2929) identifies `σ|∂SM` with `τ̃`.
- Lemma 3.2.8 (lines 2935–2939) is the extension of `μ/τ̃`. Neither theorem states it.

Changes:
- `contMDiffOn_exitTime`: "Lemmas 3.2.3 and 3.2.6, Exercise 3.2.4" → "Lemma 3.2.3, Exercise 3.2.4".
- `exists_contMDiff_eq_exitTime_sub_exitTime_neg`: "Lemmas 3.2.8, 3.2.9 and 3.2.11, Exercise 3.3.3"
  → "Lemma 3.2.11 by the fold form of Lemma 3.2.9, Remark 3.2.7 and Lemma 3.2.6 for the restriction
  to `∂SM`, Exercise 3.3.3". This cites the same set as the reviewer's repair, with Lemma 3.2.9
  labelled as the route rather than as the statement.

Pattern search: README §5.4's opening locator list cites Lemmas 3.2.3, 3.2.6, 3.2.8, 3.2.9 and
3.2.11, Remark 3.2.13 and Exercise 3.3.3. Each of these has its own bullet in §5.4, so the list is
correct. No other docstring or README passage cites Lemma 3.2.6 or 3.2.8.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `exists_contMDiff_eq_exitTime_mul_exitTime_neg` | closed unit ball | `τ(x, ±v) = ∓⟨x, v⟩ + √(⟨x, v⟩² + 1 − |x|²)`; product `1 − |x|²`; `G(x, v) = 1 − |x|²` is smooth on `TM` | true | — |
| same | `M = [a, b]` (`n = 0`) | `τ(x, 1) = b − x`, `τ(x, −1) = x − a`, `G(x, v) = (b − x)(x − a)` at `v = ±1` | true | Check extended |
| same | closed half-circle `[−π/2, π/2]` of `S¹` | `τ(θ, ±1) = π/2 ∓ θ`, `T = π²/4 − θ²`, smooth | true | — |
| same | `M = ∅`; closed nonempty `M` | `TM = ∅`, any `G` works; `τ ≡ ∞` on `SM`, so `IsNonTrapping` fails and the statement is vacuous | true | — |
| same | wrong model `G ≡ 0` | ball at `x = 0`: `T = 1 ≠ 0` | excluded | — |
| same | context | elaborated type keeps `[T2Space M] [CompactSpace M]`, the `C¹` and the `∞` metric binders, `hconv`, `htrap`; on unit `z`, `‖−z.snd‖ = 1`, so both exit times are finite and `toReal` loses nothing | sound | — |
| `τ = (F + √(F² + 4G))/2` on `SM` (README §5.4) | disc at `(0, −1)`: inward `v = (0, 1)`, outward `(0, −1)`, glancing `(1, 0)`; ball at `x = 0` | inward: `σ = 2`, `T = 0`, value `2 = τ`; outward: `σ = −2`, `T = 0`, value `0 = τ`; glancing: `0`; `x = 0`: `σ = 0`, `T = 1`, value `1 = τ`; in general `σ² + 4T = (τ + τ′)²` and the larger root of `t² − σt − T` is `max(τ, −τ′) = τ` | true | — |
| `[a, b]` Check, `σ² + 4T = (b − a)²` | `p = b − x`, `q = x − a`; `x = a`; `x = (a + b)/2` | `(p − q)² + 4pq = (p + q)²`; `T = 0` and value `b − a = τ(a, 1)`; `T = ((b − a)/2)²`, `σ = 0`, value `(b − a)/2` | true | — |
| `T = 0` on `∂SM` under strict convexity (Check) | disc at `(0, −1)`, `v_θ`; annulus `1 ≤ |x| ≤ 2` at `(0, −1)` on the inner circle, `v = ±e₁` (negative control) | disc: `τ(v_θ) = 2 sin θ` on `[0, π]` and `τ(−v_θ) = 0` there, product `0`; annulus (inner boundary concave): `|(±t, −1)|² = 1 + t²`, outer circle at `t = √3`, `T = 3 ≠ 0` | true with the hypothesis; the hypothesis is needed | hypothesis stated in the Check |
| `contMDiffOn_exitTime` docstring locator | source lines 2865–2867, 2891, 2896–2902 | Lemma 3.2.3 is continuity on `SM` and smoothness off `∂₀SM`; Exercise 3.2.4 is continuity; Lemma 3.2.6 is `τ̃` on `∂SM`, which this theorem does not state | corrected | F02 |
| `σ` theorem docstring locator | lines 2926–2929, 2935–2939, 2955–2966, 3027–3030, 3110–3113 | Remark 3.2.7: `σ|∂SM = τ̃`; Lemma 3.2.8: `μ/τ̃`, not stated; Lemma 3.2.9: the route; Lemma 3.2.11: smoothness; Exercise 3.3.3: `Xσ = −2` | corrected | F02 |
| Summary end theorem "Lemmas 3.2.3 and 3.2.11" | the Lean statements | 3.2.3 + Exercise 3.2.4 → `contMDiffOn_exitTime`; 3.2.11 → the `σ` and `T` theorems; with Remark 3.2.13, `Q = (σ + t)/2` and `a = σ² + 4T` recover the fold form (ball: `a = 4(⟨x, v⟩² + 1 − |x|²)`, matching the existing Check) | consistent | — |

## Checks

- **Elaboration**: `lake env lean packages/RiemannianManifoldsWithConvexBoundary/Suggested.lean`,
  run from the content checkout. Exit 0. Eleven warnings, all `declaration uses sorry`, at lines
  113, 150, 179, 190, 213, 278, 294, 311, 326, 347 and 365. No other output. No `set_option`, no
  sorried data, and the imports are unchanged (`import Mathlib` plus six `TauCeti.*` modules).
- **Signatures**: I put `#check @name` for all 22 declarations in one scratch file and elaborated it
  once. The only change is the new theorem, whose elaborated type matches its README statement and
  carries `[T2Space M] [CompactSpace M]`, both metric binders and both hypotheses. The other 21
  declarations are textually unchanged (only two docstrings were edited), and their types are as in
  `scratch/signatures.md`. The one lead flagged there, `IsBoundaryDefiningFunctionOn` without
  `IsManifold`, needs no such binder: `ContMDiffOn` and `mfderiv` use only the charted space.
- **One-tactic probe of the new theorem**: the scratch `example` with the probe chain ends in
  `unsolved goals`, so the theorem is not padding.
- **Direction check**: `gate --depcheck … --movable` printed
  `depcheck: 250 roadmaps, 2364 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Citations**: `roadmaps resolve` on the README found no unresolved cross-roadmap citations and no
  unresolved Lean names.

No supplier changed. `design/plan.json`, `metadata.toml` and `sources.toml` are untouched: no gap
is needed, and every locator added is in `paternain-salo-uhlmann2023`, which the manifest already
records. There were no gate failures to repair.

## For the maintainer

- New Lean name `TauCetiRoadmap.RiemannianManifoldsWithConvexBoundary.exists_contMDiff_eq_exitTime_mul_exitTime_neg`.
  No name was renamed or removed, and no section id changed, so no other roadmap's citation is
  affected.
- Ownership against open pull requests was checked with `roadmaps grep` (exit time) over the 462
  open heads and main. No second owner.
