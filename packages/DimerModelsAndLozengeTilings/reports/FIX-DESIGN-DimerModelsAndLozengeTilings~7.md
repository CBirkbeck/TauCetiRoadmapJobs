# FIX-DESIGN-DimerModelsAndLozengeTilings~7

Repair of the three findings of `REV-DESIGN-DimerModelsAndLozengeTilings~6` (all P3). Files edited:
`packages/DimerModelsAndLozengeTilings/design/README.md` and
`packages/DimerModelsAndLozengeTilings/design/plan.json`. `sources.toml` is unchanged; no new source
was cited and none was fetched.

## F01 (P3) — applied

Verified at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, equal to `lake-manifest.json`):
`ProbabilityTheory.iIndepFun_infinitePi` (`Mathlib/Probability/Independence/InfinitePi.lean:124`)
and `MeasureTheory.Measure.infinitePi_map_piCongrLeft` (`Mathlib/Probability/ProductMeasure.lean:494`,
inside `namespace MeasureTheory.Measure`, with `[∀ i, IsProbabilityMeasure (μ i)]` in scope).

Old → new: the "From Mathlib" `infinitePi` bullet named no route lemma → it now names both, with file,
line and a prose statement, and the two glue lemmas of the reindexing,
`ProbabilityTheory.iIndepFun.precomp` (`Independence/Basic.lean:323`) and
`ProbabilityTheory.iIndepFun_iff_iIndep` (`:231`). The same four names were added to the 4.3
*Needs:* line and to the plan's 4.3 `prerequisites`.

Applied with two more names than asked (pattern, not line): the review's "once reindexed along `e`"
is itself a step with a pinned input. `iIndepFun_infinitePi` gives independence indexed by `I`.
`iIndepFun.precomp e.injective` restricts it along `e : ℕ ≃ I`, and `iIndepFun_iff_iIndep` turns it
into `iIndep (fun n => comap (ω ↦ ω (e n)))`. The `limsup … atTop` of those σ-algebras is by
definition Tau Ceti's `tailProcess (fun n ω => ω (e n))` (`TauCeti/Probability/Process/Tail/Basic.lean:47`),
and 4.1 identifies that with `𝓣`. With these four the route of 4.3 names every input it uses. A search
of the rest of the README for route inputs that are used but not named turned up nothing new: 6.3
uses 4.3 for the block measure `β` (as a product over pair indices with alphabet `{0,1}²`), not a new
Mathlib lemma.

## F02 (P3) — applied

Verified: `sources.toml` gives `georgii2011` the status `uncertified`. `thurston1990`, which has the
same status, is cited at README §2.9 without the word.

Old → new: "georgii2011 Theorem 14.15 (uncertified), restated as …" in 4.2 → "georgii2011 Theorem
14.15, restated as …". "georgii2011 Theorem 14.15, uncertified;" in 4.6 → "georgii2011 Theorem
14.15;". The References entry ("cited by bibliographic data") stays. The touched 4.2 line, which was
120 characters long, was rewrapped. No other occurrence is left in the README or the plan.

## F03 (P3) — applied

Verified: 6.2 gives `δ_{M₁}` as the only invariant measure of slope `(1,0)`, and that slope is a point
of the edge `t = 0`. So "two distinct ergodic Gibbs measures of every edge slope" is false at the
three corners. 6.3(f) has the hypothesis `0 < s < 1`.

Old → new: Summary "of every edge slope (6.3)" → "of every non-corner edge slope (6.3)".

The same pattern was repaired in two more places. In 6.3(f), "by `ρ` the same holds on the edges
`s = 0` and `s + t = 1`" → "… at the non-corner points of the edges …". In the plan's 6.3 statement,
"likewise on the other edges by ρ" → "likewise at the non-corner points of the other edges by ρ".
Computation: `ρ` acts on slopes by `(s,t) ↦ (1−s−t, s)`. It sends `(s,0)` with `0<s<1` to `(1−s, s)`
and then to `(0, 1−s)`, which are exactly the open edges. It permutes the corners as
`(1,0) ↦ (0,1) ↦ (0,0) ↦ (1,0)`.

## Adversarial pass on the changed text

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | `infinitePi_map_piCongrLeft` read as `Γ`-invariance | `I = Γ = ℤ`, `ν = Bern(1/2)`, `γ = 1`, `e = (· + 1)`; `f = 1_{0}` | `piCongrLeft e f (e a) = f a` (`Equiv.piCongrLeft_apply_apply`, `Logic/Equiv/Basic.lean:870`), so `(piCongrLeft e f)(i) = f(i − 1)`, which sends `1_{0}` to `1_{1}`. This is `(γω)(i) = ω(γ⁻¹i)`, and it matches the 4.x witness "the action of `1` moves `1_{0}` to `1_{1}`". With the constant family, `μ (e a) = ν = μ a`, so `ν^{⊗ℤ}` is invariant | holds | none |
| 2 | Independence of the coordinates along `e` | `I = ℤ`, `e : ℕ ≃ ℤ`; `ν = δ_a` | `iIndepFun_infinitePi` with `f i = id` (measurable) gives `iIndepFun (fun i ω => ω i) ν^{⊗ℤ}`. `precomp e.injective` gives the family indexed by `ℕ`. `iIndepFun_iff_iIndep` gives `iIndep s` with `s n = comap (ω ↦ ω (e n))`. `h_le`: a coordinate is measurable for the product σ-algebra. For `δ_a` every event has measure `0` or `1`, so the law is consistent | holds | none |
| 3 | `limsup s atTop = 𝓣` | `I = ℤ`, the event "infinitely many ones" vs `{ω(0)=1}` | `tailProcess X = limsup (comap (X k)) atTop` by definition (`Tail/Basic.lean:47`, `tailProcess_eq_limsup` by `rfl`). The first event lies in `⨅ n, tailFamily n`; the second is not in `tailFamily 1` once `e 0 = 0` | holds | none |
| 4 | Degenerate index set | `I = ∅` | No `e : ℕ ≃ ∅` exists, but then `Ω` is a point, `ν^{⊗∅} = δ_pt` and ergodicity is trivial. 4.1 already notes that properness forces `I` infinite unless `I = ∅` | statement holds; route is for infinite `I` | none |
| 5 | Summary and 6.3 "non-corner edge slope" | `(1,0)`, `(1/2,0)`, `(1/2,1/2)`, `(0,1/2)` | `(1,0)`: the fibre is `{δ_{M₁}}` (6.2), excluded. `(1/2,0)`: `P(ε₀=ε₁=1)` is `1/4` under `Bern(1/2)` and `(1/2+1/4)/2 = 3/8` under `β_{1/2}`, so the measures differ. `ρ(1/2,0) = (1/2,1/2)` and `ρ(1/2,1/2) = (0,1/2)`, both non-corner. `s² = (s+s²)/2` iff `s ∈ {0,1}` | holds | wording only |
| 6 | Deletion of the status word | 4.2, 4.6, References | Locator "Theorem 14.15" kept at both citations. The References entry is unchanged | holds | none |

No Check or worked example uses the changed wording: the 6.3 Checks already compute `1/4` against
`3/8` and treat the corners as degenerate. They agree with the new text.

## Checks run

Dependency check (output verbatim):

```text
candidate: DimerModelsAndLozengeTilings is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2229 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

`roadmaps resolve` on the README after the edits: no cross-roadmap citation and no Lean name found
nowhere.

`plan.json` parses as JSON after the edits. The README has no LaTeX delimiters, machine paths or
manifest status words.

`Suggested.lean`: this design stage has none, so no `#check @name` comparison was run and no Lean
command was run. No backticked name of this roadmap's own was added or removed.

## Gate failures

None were listed for this round.

## For the maintainer

- No name of this roadmap changed; no consumer is affected. No supplier, gap, layer or target was
  added. Ownership is unchanged: the edits add only pinned Mathlib names to existing supplier
  contracts.
- No new source was cited; `needs-references.toml` was not written.
- No text in the review asked for any action outside this job.
