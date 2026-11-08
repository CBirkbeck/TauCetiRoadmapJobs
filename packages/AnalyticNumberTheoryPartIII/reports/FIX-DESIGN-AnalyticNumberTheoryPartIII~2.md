# FIX-DESIGN-AnalyticNumberTheoryPartIII~2

Repair of the eight findings of `REV-DESIGN-AnalyticNumberTheoryPartIII` on the design of
`AnalyticNumberTheoryPartIII`. Files edited: `packages/AnalyticNumberTheoryPartIII/design/README.md`
and `packages/AnalyticNumberTheoryPartIII/design/plan.json`. `sources.toml` is unchanged: the new
locators (kontorovichtao-pntplus Theorems 9.1.34, 9.1.36, lines 3336 and 3353–3363) fall inside its
recorded §9.1 locator, and 11.3 is already in its `cited_for`.

## REV-DESIGN-AnalyticNumberTheoryPartIII/F01 (P2) — applied

Evidence: Part I §0.33a `riemannZeta_deriv_logDeriv_bound` (at the head of Part I's new-roadmap pull
request) is the `K = ℚ`, `χ = 1` case. With `c = β`, `R_c` lies in Part I's open region, since
`log(|t|+3) > log(|t|+2)`.

Changed: supplier contract "§0.33 … a Check" → "§0.33a, consumed, not restated". 10.3's first Check `log³`
remark → agreement with §0.33a. Scope now names §0.33a and how 10.3 differs. The `K = ℚ` 10.3 statement left
the `Suggested.lean` plan. Also: 10.2 Check, Layer 10 Example, *Needs*, Dependencies, plan.json.

## REV-DESIGN-AnalyticNumberTheoryPartIII/F02 (P2) — applied

Evidence: Part I §3.24a `riemannZeta_pow_four_eq_mul_LSeries_divisor_sq` is a named target
(`ζ⁴ = ζ(2s) Σ τ(n)² n^{−s}`, `Re s > 1`).

Changed: 11.3's `τ²` corollary → a Check of agreement with §3.24a; the `τ(n²)` corollary is kept (locator now
Theorems 9.1.36, 9.1.50). Scope "§§0.11c, 1.2a and 3.24 are examples" → §§0.11c, 1.2a plus the two `ζ`
statements. Owned list drops `τ²`. Contract §3.24 → §3.24a. Also *Needs*, Dependencies, plan.json 11.3 and
supplier.

## REV-DESIGN-AnalyticNumberTheoryPartIII/F03 (P3) — applied

Evidence: edges computed numerically (right `π/2`, left `−π/2`, bottom `iπ/2`, top `−iπ/2`). Mathlib's
expression gives `2πi`, and `π/2 = −π/2 + (top − bottom)/i + 2π`, so the term is `−π`.

Changed: "the two horizontal edges divided by `i`" → `(∫ f(x+iT)dx − ∫ f(x−iT)dx)/i`. A Check now pins the
sign on the finite-height identity (`1/s` is not integrable on the line). plan.json 8.1b statement and a
new test match.

## REV-DESIGN-AnalyticNumberTheoryPartIII/F04 (P3) — applied

Evidence at the pins: `TauCeti.Contour.residue` (`TauCeti/Analysis/Contour/Residue/Basic.lean`, line 80);
`TauCeti.LFunctions.heckeLFunctionC` (`TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean`, line 74);
`TauCeti.GlobalNumberFields.RayClassCharacter` (abbrev `RayClassGroup 𝔪 →* ℂˣ`).

Changed: "How to read the build": "8.1 and 10.3 … are stated in this README" → `Suggested.lean` plans 8.1
(on `TauCeti.Contour.residue`, with Mathlib's edge expression) and the general 10.3 (on
`heckeLFunctionC χ`), importing those Tau Ceti modules. There is no `Suggested.lean` at the design stage.

## REV-DESIGN-AnalyticNumberTheoryPartIII/F05 (P3) — applied

Evidence: the steep-width witness was recomputed. Correction: it needs `a₀ = 1/2` and `T₀ ≥ 6`, not
`a₀ = 1`, because `η(3) = 1/2 < 1/log²3`. At `T₀ = 10¹²`, the old saving is `0.930` and `ω = 27.70`.

Changed: route "`log T = η(T) log x` … once `η(3) log x > log 3`" → `log T = η(T+3) log x`, which exists
once `η(6) log x > log 3`, with `log T ≥ (ω − log 2)/2` and left-edge saving `1/T`. The witness is now a Check
and plan.json test `steep_width`.

## REV-DESIGN-AnalyticNumberTheoryPartIII/F06 (P3) — applied

Changed: ", the filed form" deleted from the second Check of 10.2. A search for other process words
("filed", "round", "checkpoint" and the like) found none.

## REV-DESIGN-AnalyticNumberTheoryPartIII/F07 (P3) — applied differently

Evidence: the review's clause calls the carrier "unit-circle-valued". At the pin,
`TauCeti.MultiplicativeIdealWeight` (`TauCeti/NumberTheory/ArithmeticDirichletSeries/Weight.lean`, line 116)
is a complex `Ideal (𝓞 K) →*₀ ℂ` that kills finitely many primes; `TauCeti.UnitaryIdealWeight` is the
unit-modulus subtype.

Changed: a Scope clause with the correct description, the meeting at `K = ℚ` through `TauCeti.normCoeff`, and
11.1's extra generality. New 11.1 Check: the `≡ 1 mod 4` prime-factor indicator vanishes at infinitely many
primes.

## REV-DESIGN-AnalyticNumberTheoryPartIII/F08 (P3) — applied

Evidence: ArithmeticDirichletSeriesPartII §5.1 (`LSeriesHasSum_zeta_pow`, `k ∈ ℕ`) sits at merge-order line 91.
The gate places this roadmap right after AnalyticNumberTheoryPartI (line 49), so this roadmap is the earlier
owner. The general `z ∈ ℂ` series has no other owner.

Changed: Scope now says the series of `d_k = ζ^k` is the `z = k` instance of 11.2, owned here, and that
ArithmeticDirichletSeriesPartII keeps the partial-sum asymptotic. plan.json consumer entry reworded.
ArithmeticDirichletSeriesPartII's own text needs a revision outside this package (see the maintainer notes).

## Checks run

Dependency gate (after all edits):

    candidate: AnalyticNumberTheoryPartIII is not in the merge order yet; checked as if placed after AnalyticNumberTheoryPartI (the intake inserts it when its design is accepted)
    depcheck: 235 roadmaps, 2421 edges, 0 problem(s)

No UPWARD or CYCLE line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name
found nowhere. `plan.json` parses, with its original one-space indentation. Every new line is in
backticked Unicode, with no LaTeX delimiters and no machine paths.

`#check` elaboration: not applicable. The design stage has no `Suggested.lean`, so no Lean was run.

Ownership against open pull requests: checked against the brief's sibling roadmaps through
`roadmaps show` / `roadmaps grep`. This round adds no new construction. The only new ownership
statements are F01, F02 (deferring to Part I) and F08 (this roadmap owns the general `d_z` series).

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 8.1 U-form horizontal term | `1/s`, `σ₁ = −1`, `σ₂ = 1`, `T = 1` | edges `π/2, −π/2, iπ/2, −iπ/2`; Mathlib expression `6.28319i = 2πi`; `(top−bottom)/i = −3.14159`; `L + X + 2π = 1.570796 = R`; clockwise `+π` | top minus bottom is correct | F03 |
| 10.2 route, choice of `T` | steep `η`, `T₀ = 10, 10³, 10⁶, 10¹²`, `log x = 2 log T₀` | `ω = 3.26, 7.20, 13.96, 27.70` (≥ `log T₀`); old saving `0.497, 0.749, 0.865, 0.930`; new `T = 7.53, 997.0, 999997, T₀ − 3`; `log T ≥ (ω − log 2)/2` in every case; hypotheses hold with `a₀ = 1/2` | route repaired; theorem unchanged | F05 |
| 10.2 route, existence of `T` | `h(t) = η(t+3) log x − log t` at `t = 3` | `h(3) = η(6) log x − log 3 > 0` in all four cases; `h` strictly decreasing, `→ −∞` | condition `η(6) log x > log 3` | F05 |
| 10.3 at `K = ℚ` vs Part I §0.33a | `c = β`, `t = 0, 1, 10, 10⁶`, `β = 0.3` | `1 − β/log(t+3) > 1 − β/log(t+2)` at all four; `log(t+2) ≤ log(t+3)`; residue of `−ζ′/ζ` at `1` is `+1` | instance holds | F01 |
| 11.3 at `α = β = 0` vs Part I §3.24a | local factors | `(1−X)^{−4}(1−X²)`: `1, 4, 9, 16, 25, 36`; `(1−X)^{−4}`: `1, 4, 10, 20, 35`; `(1−X)^{−3}(1−X²)`: `1, 3, 5, 7, 9` | agrees; `τ(n²)` corollary kept | F02 |
| 11.1 vs finite-bad-set carrier | indicator `g` of prime factors `≡ 1 mod 4` | `g(ab) = g(a)g(b)` for all `a, b < 300`; `g(1) = 1`, `g(65) = 1`, `g(15) = 0`, `g(0) = 0` | infinitely many zero primes admitted | F07 |
| Scope: `normCoeff` at `K = ℚ` | ideals of `ℤ` of norm `n` | exactly one, `nℤ`, so `normCoeff χ n = χ(nℤ)`, `= 1` at `n = 1`, `= 0` at `n = 0` | completely multiplicative | F07 |

## For the maintainer

- ArithmeticDirichletSeriesPartII §5.1 (`LSeriesHasSum_zeta_pow`) states, for `k ∈ ℕ`, the series this
  roadmap's 11.2 owns. That roadmap should cite 11.2 for the series and keep `zetaPow_counting` (F08).
  It needs a revision outside this package; when it cites 11.2 it must merge after this roadmap.
- This roadmap now depends on two AnalyticNumberTheoryPartI targets that exist only at the head of
  Part I's new-roadmap pull request: §0.33a and §3.24a. Part I is earlier in the merge order (line 49), so
  this is a supplier relation, not a revision dependency.
- No names that other roadmaps cite were changed. No target was renamed, added or deleted. 11.3's
  statement lost its `τ²` corollary, which other roadmaps take from Part I §3.24a.
- No suspicious instructions were found in the review text.
