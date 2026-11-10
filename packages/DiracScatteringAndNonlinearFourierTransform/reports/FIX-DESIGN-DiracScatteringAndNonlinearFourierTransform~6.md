# Repair of the DiracScatteringAndNonlinearFourierTransform design, round 6

Findings settled: the two findings of `REV-DESIGN-DiracScatteringAndNonlinearFourierTransform~5` (both P3).
Files edited: `packages/DiracScatteringAndNonlinearFourierTransform/design/README.md`,
`packages/DiracScatteringAndNonlinearFourierTransform/design/plan.json`,
`packages/DiracScatteringAndNonlinearFourierTransform/sources.toml`.

## F01 (P3) — applied

Verified: denisov2006 line 3256–3290 is the Volterra equation (195)–(196) for `P∗(r, λ)` and its
Grönwall bound. Neither is a Riccati equation. Denisov's Riccati equation is Lemma 9.1, (157)–(158),
line 2510–2521. Lemma 9.2 (line 2544–2556) solves it as `y₁/y₂` for a linear system. That system is
the same in form as §4.5's `(β, a)`: `y₁ ↔ β`, `y₂ ↔ a`, `A ↔ conj q`.

Changes (old → new):

- **§4.5:** "`det G = 1` (denisov2006 (195) line 3256–3290 for the Krein-system analogue)" → the route now says that `r = β/a` satisfies the Riccati equation, then cites "denisov2006 §9 Lemma 9.1 (157)–(158) line 2510–2521, and Lemma 9.2 line 2544–2556".
- **plan.json:** 4.5 `statement` and `locator` mirror the README.
- **sources.toml:** the denisov2006 `locator` drops (195), which is now cited nowhere, and adds §9 Lemmas 9.1–9.2.
- **References:** the same change as sources.toml.

Departure from the suggested repair: the citation now sits on the Riccati claim, not on the
`det G = 1` step. Lemma 9.2 is added because it is the analogue of the route itself (ratio of a linear
system), not only of the equation.

Pattern search: (195) was cited only at §4.5 and in the References. The other denisov2006 citations
were re-read at their lines and are correct as cited: Theorem 11.1 and (194) at line 3246–3255; §13
(245)–(248) at line 4219–4258; the dictionary at line 4230.

## F02 (P3) — applied

Verified with the reviewer's instance (`[0, 1]`, `P = F = 0`, `y₀ = 0`: `Y ≡ 0` and `1_{(2,3)}` both
solve). Tau Ceti `TauCeti.eqOn_of_forall_mem_Icc_eq_picard` (`Analysis/ODE/Caratheodory.lean` line
219) concludes `EqOn x₁ x₂ (Icc a b)`.

Changes (old → new):

- **§1.2:** "exactly one `Y : ℝ → E`" → "a `Y : ℝ → E` … and any two such functions agree on `[a, b]`". The converse clause "is this solution" → "agrees on `[a, b]` with these solutions". This was the same defect, repaired as part of the pattern. The norm bound is now stated "for `t ∈ [a, b]`".
- **§1.2 Checks:** a new Check records the reviewer's boundary instance.
- **§1.7:** the global clause gets the same wording, on `I`.
- **plan.json:** 1.2 and 1.7 `statement` and `tests` mirror the README. A 1.7 hypothesis line was added for the local form.

**A false statement found in the same sentence.** The adversarial pass on the changed text found that
§1.7's local form was false as stated. It claimed "a unique solution on `[t₀, t₀ + τ]`" under
`(∫m) exp(∫L) ≤ r`. Counterexample (now a §1.7 Check):

- Data: `E = ℝ`, `x₀ = 0`, `r = 1`, `τ = 2`.
- Field: `F = 1` for `t < 1`, and `F = 2√(max(x − 1, 0))` for `t ≥ 1`.
- On `B = [−1, 1]`: `L = 0`, `m = 1_{[0,1)}`, so `(∫m)e⁰ = 1 = r`.
- Two solutions: `min(t, 1)` and the function equal to `t` on `[0, 1]` and `1 + (t − 1)²` on `[1, 2]`.

Restated:

- Existence of a solution with values in `B`.
- Uniqueness among solutions with values in `B`.
- When the inequality is strict, uniqueness among all solutions. Route: a solution leaving `B` meets the sphere at a first time `t*`, and 1.1 bounds `‖Y(t*) − x₀‖ < r`.
- "Solution on `[t₀, t₀ + τ]`" is now defined, with `s ↦ F(s, Y(s))` integrable.

Nothing in the roadmap uses the local form. The existing `F = x²` Check has `0.149 < 1`, so it is
unaffected.

## Checks run

**Dependency check** (run on the candidate README after the edits):

```
candidate: DiracScatteringAndNonlinearFourierTransform is not in the merge order yet; checked as if placed after SobolevMapsBetweenManifolds (the intake inserts it when its design is accepted)
depcheck: 233 roadmaps, 2091 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

The placement line differs from round 5's ("after AnalyticNumberTheoryPartI"), but my edits did not
cause it. The unmodified README, run against the same order file, gives the identical line. The only
cross-roadmap supplier is unchanged: AnalyticNumberTheoryPartI §0.23, consumed in §7.1. The placement
looks like a change in how the tool positions a design-stage candidate (SobolevMapsBetweenManifolds is
the last line of the order file), not a new edge. The maintainer may want to confirm this.

**README and plan.json agreement:** a script compared every plan.json target statement, API entry and
test (360 strings) with the README, up to whitespace. Result: 0 mismatches. The TOML still parses.

**Stale text:** `(195)`, `3256`, "exactly one" and "is this solution" no longer occur in any edited
file.

**Suggested.lean:** there is no `Suggested.lean` at the design stage, so no `#check` scratch
elaboration was run.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.2 uniqueness on `[a, b]` | `[0, 1]`, `P = F = 0`, `y₀ = 0`; `Y₁ ≡ 0`, `Y₂ = 1_{(2,3)}` | `Y₁ = Y₂ = 0` on `[0, 1]`; `Y₁(5/2) = 0 ≠ 1 = Y₂(5/2)` | unique on `[a, b]` only | wording; new Check |
| §1.2 degenerate interval | `a = b = t₀` | the equation forces `Y(a) = y₀`, nothing else | holds | none |
| §1.2 bound on `[a, b]` | `E = ℂ`, `P = 1`, `F = 0`, `y₀ = 1`, `t = 1` | `‖Y(1)‖ = e = 2.71828`; bound `(1 + 0)e¹ = 2.71828` | holds, with equality | none |
| §1.2 converse | AC `Y` with `Y′ = PY + F` a.e. | `Z = Y − y₀ − ∫(PY + F)` is AC with `Z′ = 0` a.e. and `Z(t₀) = 0`, so `Z = 0` on `[a, b]` (Mathlib `AbsolutelyContinuousOnInterval.const_of_ae_hasDerivAt_zero`); `PY + F` is integrable since `Y` is bounded on `[a, b]` | holds on `[a, b]` | wording |
| §1.7 global uniqueness on `I` | `F = 0`, `x₀`; `Y₁ ≡ x₀`, `Y₂ = x₀` on `I`, arbitrary off `I` | agree on `I`, differ off `I` | unique on `I` only | wording |
| §1.7 local, `≤ r`, uniqueness of all solutions | the counterexample above | residual `Y(t) − ∫₀ᵗ F(s, Y(s)) ds` for `Y₁`: `0, 0, 0` at `t = 0.5, 1, 2`; for `Y₂`: `0, 0, −4·10⁻¹⁶`; at `t = 1.5`: `2.5·10⁻⁶` for both, from the one quadrature cell across the jump at `1` (2·10⁵ midpoints); `Y₁(2) = 1`, `Y₂(2) = 2 ∉ B` | **false as stated** | restated; new Check |
| §1.7 local, uniqueness in `B` | same data | `Y₂` leaves `B`; on `B`, `L = 0` and Grönwall forces any two `B`-valued solutions to agree | holds | none |
| §1.7 local, strict inequality | same `F`, `τ = 0.9` | `∫₀^{0.9} m = 0.9 < 1`; `Y = t` stays in `[0, 0.9] ⊂ B`, and it is the only solution | holds | none |
| §1.7 local, existence with `≤ r` | `F = x²`, `x₀ = 1`, `r = 1`, `τ = 0.1` | `τe^{4τ} = 0.1491825 ≤ 1`; `1/(1 − t) ≤ 1.1111` on `[0, 0.1]` | holds (strict, so also unique) | none |
| §1.7 local, Picard iterates stay in `B` | `φ(t) = (∫m)exp(∫L)` | `φ′ = m e^{∫L} + Lφ ≥ m + Lφ`, `φ(t₀) = 0`, so `∫(m + Lφ) ≤ φ ≤ r` | holds | none |
| §1.7 local, degenerate `r = 0` | `B = {x₀}` | `≤ 0` forces `m = 0` a.e., so `Y ≡ x₀`; the strict case is empty | holds | none |
| §4.5 `r = β/a` solves the Riccati equation | algebra | `r′ = β′/a − βa′/a² = 2izr + conj q − q r²` | holds | route sentence |
| §4.5 numerics | `q = 0.5 + 1.2i` on `[0, 0.7]`, `z = 0.6 + 0.25i`, RK4 with 20 000 steps | `β/a = 0.4071193 − 0.4670915i` = Riccati `r(0.7) = 0.4071193 − 0.4670915i`; `a = 1.3742706 + 0.1024829i` = `exp∫qr = 1.3742706 + 0.1024829i`; `max\|r\| = 0.6196 < 1`; `\|r(0.7)\| = 0.6196 ≤ 2\|q\|(1 − e^{−2yT})/(2y) = 1.5356`; `\|a\|² − \|β\|² = 1.1700 ≥ 1` | holds | none |
| §4.5 Denisov analogue | Lemma 9.2 system `y₁′ = −iλy₁ + Ay₂`, `y₂′ = Āy₁` (the bar is lost in the OCR; it is restored from (157)'s structure) | with `A = conj q`, `−iλ ↔ 2iz`, it is the system `β′ = 2izβ + conj q a`, `a′ = qβ`; the ratio gives (157)'s Riccati form | analogue right | locator |

## Sources

No new source was fetched. Every locator quoted above was read in the cached denisov2006 text at the
stated lines. `needs-references.toml` was not written.

## For the maintainer

- No Lean name, section number or target id changed. No other roadmap cites the changed sentences.
- Ownership against open work: the repair adds no construction. `roadmaps grep` for Carathéodory
  solutions and Riccati equations over main and the open heads finds:
  - AsymptoticExpansions, which consumes the pinned Tau Ceti `Analysis/ODE`;
  - Riccati equations for other objects (PainleveEquations, RiemannianGeometry, SpecialFunctionsAiry).

  None owns the integrable-coefficient Carathéodory theorems of Layer 1 or the Dirac Riccati
  representation. `scratch/overlaps.md` lists no open pull request that changes this roadmap, no
  dropped id, and no id that only an open revision defines.
- The dependency check places the candidate after SobolevMapsBetweenManifolds; see "Checks run". This
  is a change in the tool's placement, not in this roadmap's suppliers.
