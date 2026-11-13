# FIX-PKG-KloostermanMomentsAndPotentialAutomorphy~7

This round settles the single finding of `REV-PKG-KloostermanMomentsAndPotentialAutomorphy~6`. The
finding is correct, and it is applied.

Files changed:
- `packages/KloostermanMomentsAndPotentialAutomorphy/README.md`: the Mathlib supplier contract, §0.2
  API bullets, §0.2 Checks and the §0.2 `*Needs:*` line;
- `packages/KloostermanMomentsAndPotentialAutomorphy/Suggested.lean`: the docstring of `traceChar`
  only. No signature changed, and no Lean name was added, removed or renamed.

Unchanged: `metadata.toml`, `sources.toml`, `design/plan.json`. The repair uses only pinned Mathlib
declarations, so no new source and no new supplier gap was needed. Nothing was added to
`needs-references.toml`.

## REV-PKG-KloostermanMomentsAndPotentialAutomorphy~6/F01 (P3) — applied

**Verification.** The old bullet composed `traceChar p m` with the inclusion `𝔽_{p^m} → 𝔽_{p^{m′}}`.
That is ill-typed, because the domain of `traceChar p m` is the smaller field. It also said only
"relates to". The correct law goes through the relative trace `Tr_ι : 𝔽_{p^{m′}} → 𝔽_{p^m}`:
`ψ_{m′} = ψ_m ∘ Tr_ι`. The review's witness holds: over `𝔽₄/𝔽₂`, `Tr(1) = 1 + 1 = 0`. So
`ψ₂(ι 1) = 1`, while `ψ₁(1) = −1`.

At the pin, `Algebra.trace_trace` is in `Mathlib/RingTheory/Trace/Defs.lean:137` and
`Algebra.trace_algebraMap` is at `:110`. The existence of `ι` comes from
`FiniteField.nonempty_algHom_of_finrank_dvd` (`Mathlib/FieldTheory/Finite/GaloisField.lean:287`) with
`GaloisField.finrank` (`:79`). The relative degree comes from `Module.finrank_mul_finrank`
(`Mathlib/LinearAlgebra/Dimension/Free.lean:76`), and the power from `AddChar.map_nsmul_eq_pow`
(`Mathlib/Algebra/Group/AddChar.lean:131`).

I proved both laws in a scratch Lean file at the pins. These are verification only, and nothing was
added to `Suggested.lean`:
- the composition law, for every `m`, `m′` and every `𝔽_p`-algebra map `ι`;
- the restriction power `traceChar p m′ (ι x) = traceChar p m x ^ (m′ / m)`, for `m, m′ ≠ 0`.

**Change, old → new.** In README §0.2, "for `m ∣ m′` its composition with the inclusion … relates to
`traceChar p m′`" becomes three things:
- the nontriviality bullet, kept as it was;
- a tower-law bullet: `traceChar p m′ = traceChar p m ∘ Tr_ι` for positive `m ∣ m′` and an
  `𝔽_p`-embedding `ι`;
- a restriction bullet: `traceChar p m′ ∘ ι = (traceChar p m)^{m′/m}`. This restriction is trivial
  exactly when `p ∣ m′/m`. The bullet also gives the explicit relative-trace formula.

Six pinned names were added to the Mathlib contract and to §0.2's Needs. There are four new Checks:
- `𝔽₄/𝔽₂`: the negative control;
- `𝔽₉/𝔽₃`: the restriction is a nontrivial square;
- degree one with the Frobenius: `Tr_ι = ι⁻¹`;
- `m′ = 0`: shows that the exponent needs positivity.

**Pattern repair.** The `traceChar` docstring in `Suggested.lean` said only "compatible in towers".
It now states the same law, through the relative trace. I searched README and Lean for other uses
of a trace character along an inclusion (`tower`, `inclusion`, `restrict`, `ψ ∘ Tr`, `Tr_{`).
- README §1.4 (trace of `F_p^m` on `Sym^k Kl₂`) uses only `traceChar p m = ψ₁ ∘ Tr_{𝔽_{p^m}/𝔽_p}`,
  which is the definition.
- The CongruenceSpectralGap §4.2b contract line ("`L_ψ` with trace `ψ ∘ Tr`") is correctly directed.

Neither needed a change. No other occurrence was found.

## Adversarial pass (new and changed statements)

Here `ψ_m = traceChar p m`, `ζ₃ = e^{2πi/3}`, and `𝔽₄ = 𝔽₂(ω)` with `ω² = ω + 1`.

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| Composition law `ψ_{m′} = ψ_m ∘ Tr_ι` | `𝔽₄/𝔽₂` at `1`, `ω`; `𝔽₉/𝔽₃` at `1`; `m′ = 0` | At `1`: `ψ₂(1) = e^{πi·0} = 1` and `ψ₁(Tr_ι 1) = ψ₁(0) = 1`. At `ω`: `Tr(ω) = ω + ω² = 1`, so both sides are `−1`. `𝔽₉`: `ψ₂(1) = stdAddChar(2) = ζ₃²` and `ψ₁(2) = ζ₃²`. `m′ = 0`: degree `1`, both sides `e^{2πi/p}` at `1`. Lean: proved for every `m`, `m′`, `ι`. | Holds without positivity; stated for positive `m ∣ m′`, the case the API uses. |
| Restriction power `ψ_{m′}(ι x) = ψ_m(x)^{m′/m}` | `𝔽₄/𝔽₂`, `𝔽₉/𝔽₃`, degree one (Frobenius), `m = 1` with `m′ = 0` | `1 = (−1)²`; `ζ₃² = (ζ₃)²`; `ψ(ω²) = −1 = ψ(ω)¹`. At `m′ = 0`: LHS `e^{2πi/p}`, while the formula gives `(e^{2πi/p})⁰ = 1`. Lean: proved for `m, m′ ≠ 0`. | Positivity of `m′` is necessary; added as a negative-control Check. |
| "Trivial exactly when `p ∣ m′/m`" | `𝔽₄/𝔽₂` (`d = 2`, `p = 2`); `𝔽₉/𝔽₃` (`d = 2`, `p = 3`); `𝔽₈/𝔽₂` (`d = 3`); `𝔽₂₇/𝔽₃` (`d = 3`, `p = 3`) | `𝔽₄`: values at `0`, `1` are `1`, `1` (trivial). `𝔽₉`: value at `1` is `ζ₃²` (nontrivial). `𝔽₈`: `Tr(1) = 3·1 = 1`, value `−1` (nontrivial). `𝔽₂₇`: `Tr(1) = 0`, `Tr(2) = 6 = 0`, values `1`, `1` (trivial). | Sound. It needs `ψ_m` nontrivial, i.e. `m ≥ 1`, which is in the hypothesis. |
| Existence of `ι` needs `m ∣ m′` | `𝔽₄ → 𝔽₈` | `[𝔽₄:𝔽₂] = 2 ∤ 3`. `𝔽₈ˣ` has order `7`, so it has no element of order `3 = #𝔽₄ˣ`: no embedding. | Divisibility hypothesis necessary; kept. |
| Explicit trace `Tr_ι(y) = Σ_{i<m′/m} y^{p^{mi}}` | `𝔽₄/𝔽₂` at `1`, `ω`; `𝔽₉/𝔽₃` at `1` | `1 + 1 = 0`; `ω + ω² = 1`; `1 + 1³ = 2` | Matches `FiniteField.algebraMap_trace_eq_sum_pow` with `#K = p^m`. |
| Direction of `Tr_ι` (convention witness) | degree-one tower with `ι` = Frobenius on `𝔽₄` | On the basis `{1}`, multiplication by `y` has matrix `[ι⁻¹ y]`, so `Tr_ι(ω) = ι⁻¹(ω) = ω²` (as `Frob(ω²) = ω⁴ = ω`), not `ω`. The law then reads `ψ(ω) = ψ(ω²)`: both `−1`. | `Tr_ι = ι⁻¹`; recorded as a Check. |
| `GaloisField p 0` has degree `1` (used in the `m′ = 0` Check) | `X^{p⁰} − X = X − X = 0` | Splitting field of `0` is generated by the empty root set, so it is `⊥ = ⊤`; `finrank = 1`. Lean: proved at the pins via `IsSplittingField.adjoin_rootSet` and `Subalgebra.bot_eq_top_iff_finrank_eq_one`. | Check correct. |
| Contract hypotheses | `Algebra.trace_trace`, `Algebra.trace_algebraMap` on `ZMod p → 𝔽_{p^m} → 𝔽_{p^{m′}}` | `trace_trace` needs `Module.Free`, `Module.Finite` at both steps and `IsScalarTower` (fields, finite types; the tower comes from `ι.commutes`). `trace_algebraMap` needs `StrongRankCondition` (fields) and `Module.Free`. | All satisfied; stated in the contract prose. |
| `traceChar` docstring (Lean) | elaborated type | `traceChar : (p : ℕ) → [Fact (Nat.Prime p)] → (m : ℕ) → AddChar (GaloisField p m) ℂ`, as before | Docstring now matches the README bullets; type unchanged. |

## Checks run

- **Elaboration of `Suggested.lean`.** Command: `lake env lean` on its absolute path, from the content
  checkout. Exit `0`. There are exactly four warnings, all "declaration uses `sorry`", at lines
  `92`, `111`, `193` and `208`. Those are `momentSeries_weights`, `momentSeries_eq_intPolynomial`,
  `oddMoment_functionalEquation` and `evenMoment_functionalEquation`. Each moved down two lines
  because the docstring grew. There are no `TauCeti.*` imports, so nothing was built.
- **Mechanical signature check.** A scratch copy carried `#check @name` for all 21 declarations. It
  elaborated with exit `0`. Each elaborated type is identical to the elaborated signature the worker supplied
  for this round, and to the README statements as checked in the previous round. No
  binder changed or was lost. The same scratch file proved the three verification lemmas in the
  table above.
- **Dependency check** (`gate --depcheck … --movable`), complete output:

  ```text
  depcheck: 240 roadmaps, 2194 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line.
- **Citation resolver** (`roadmaps resolve` on the README): "Cross-roadmap citations found nowhere:
  None. Lean names found nowhere: None." The six new Mathlib names were opened at the pin directly,
  at the files and lines given above.
- **Ownership.** The repair adds no construction, only API prose and Checks about the existing
  `traceChar` on Mathlib carriers. So no ownership question arises. The overlaps file lists nothing
  that this change touches.
- **Gate failures.** None were listed for this round.

## For the maintainer

- No name that another roadmap could cite changed. No section or target was renumbered.
- The review's human-reviewer item (Saito-orthogonal settled `uncertified`) required no change.
- The review contained no instruction-like text addressed to the worker.
