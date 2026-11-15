# FIX-PKG-ModularFormsPartII~10

Repair of the three findings of REV-PKG-ModularFormsPartII~9 (all P3). All three were verified and applied. One has an extra point: the zero-insertion bullet it cites is false as written, because it leaves out holomorphy. That hypothesis was added wherever the law is used, and a negative-control Check now shows the failure.

## F01 (P3) — applied

Verified at the pin: `TauCeti.qExpansion_nat_mul` (`TauCeti/NumberTheory/ModularForms/QExpansion/Order.lean:70`; `#check` printed `0 < h → 0 < m → Periodic → IsBoundedAtImInfty → MDiff g → qExpansion (m*h) g = expand m (qExpansion h g)`). `QExpansion/Laurent.lean` has no rescaling lemma.

Changed: Tau Ceti contract gains this lemma. §1.2 bullet "For an h-periodic function bounded at `∞` … inserts zeros" → "For a holomorphic h-periodic function … which is Tau Ceti's `TauCeti.qExpansion_nat_mul`", plus the Laurent case proved here. New §1.2 Check (below). `*Needs:*` §1.2, §6.3 (+§1.2), §8.5; Dependencies of Layers 1, 6 and 8.

Pattern: §8.5 API bullet "If it holds with period h, it holds with period rh" → restricted to F with holomorphic components, citing the lemma; the lcm bullet now says "vector-valued forms F and G". §6.3 (:608) and §8.5 (:918) use the law only for weak and vector-valued forms, which are holomorphic, so they need no change. The Conventions sentence (Laurent expansion = `qExpansion h f` for bounded f) holds for every bounded f by unfolding `laurentQExpansion`. Boundedness makes `cuspPoleOrder` 0, and a non-meromorphic cusp function has `meromorphicOrderAt = 0`, so that sentence is unchanged.

Why holomorphy is needed (now a §1.2 Check). Take `f = Q + |Q|²Q̄`, `Q = exp(2πiτ)`. At period 1 the cusp function near 0 is `g(w) = w + |w|²w̄`. Its complex derivative at 0 is 1, because `|w|²w̄/w → 0`. It has none at `w ≠ 0`, since `∂/∂w̄ = 2ww̄ ≠ 0`. Mathlib's `qExpansion` uses `iteratedDeriv`, which is 0 at every point where no derivative exists, so `qExpansion 1 f = X`. At period 2 the cusp function is `w² + w²w̄⁴`, with derivative 0 at 0 and none elsewhere, so `qExpansion 2 f = 0 ≠ X² = expand 2 X`. The same f, with `K = ℚ`, `a₁ = 1`, satisfies `HasCuspidalExpansionOver` at `h = 1` but not at `h = 2`, so the old §8.5 bullet was false for non-holomorphic F.

## F02 (P3) — applied

Verified: CDT25 line 1799 is the heading "A leveraging argument" of CDT §4.3, and the README used the word without defining it. "p-scaling" was also used without a definition (§1.7 heading, §5.2).

Changed: "Layer 5: Leveraging and degree doubling" → "Layer 5: Degree doubling under p-scaling". "5.5 Leveraging contradicts …" → "5.5 Degree doubling contradicts …". The wording at Scope (:7, :24), Layer 4's intro and Examples, and `Suggested.lean:37` changed the same way. A new Conventions bullet defines p-scaling of a function and of a subgroup, with a computed witness.

Section numbers are unchanged. `roadmaps grep ModularFormsPartII` finds only NoncongruenceModularForms (main) citing this roadmap, by W1.x/W6.x ids. Nothing cites the Layer 5 or §5.5 headings. No "leverag" remains in the README or `Suggested.lean`.

## F03 (P3) — applied

Verified: ModularForms (main) has `## Downstream consumers` (:1526), `## Worked examples` (:1549), `## References` (:1585), and NoncongruenceModularForms has the same order. The brief's shape gives the same order.

Changed: the "## Downstream consumers" block moved, unchanged, to just before "## Worked examples". The order is now Downstream consumers, Worked examples, References.

## Checks

- **Elaboration.** `lake env lean packages/ModularFormsPartII/Suggested.lean` from the content checkout exited 0. It gave 13 warnings, all `declaration uses sorry` (lines 75, 97, 145, 164, 171, 181, 195, 211, 242, 257, 285, 309, 324), and no error. The only Lean change is the module-docstring wording (F02). No declaration, binder or import changed.
- **Signatures.** A scratch file (the package's file plus `import TauCeti.NumberTheory.ModularForms.QExpansion.Order`) had `#check @name` for all 22 declarations and for `TauCeti.qExpansion_nat_mul`. It elaborated with exit 0, the same 13 sorry warnings and no error. The file has no section `variable`s, so no binder can be lost. The elaborated types are those of `scratch/signatures.md`, since no statement changed, and they agree with the README statements. The README's new Tau Ceti citation matches the elaborated type of `TauCeti.qExpansion_nat_mul`: `h : ℝ`, `0 < h`, `0 < m`, periodic, bounded, `MDiff`.
- **Direction check** (`gate --depcheck … --movable`):

```text
depcheck: 239 roadmaps, 2261 edges, 0 problem(s)
```

  No UPWARD, CYCLE or moved line.
- **Citations** (`roadmaps resolve`): no cross-roadmap citation and no Lean name found nowhere.
- **Gate failures.** None were listed for this job.
- **Unchanged files.** `design/plan.json`, `sources.toml` and `metadata.toml` are unchanged. No new gap and no new source.

## Adversarial pass on the changed statements

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §1.2 zero insertion (holomorphic) | `Δ`, `h = 1`, `m = 2`; `f = 1`; `m = 1` | `expand 2 (Q − 24Q² + 252Q³) = q² − 24q⁴ + 252q⁶`, matches Layer 8 Examples `Δ = q² − 24q⁴`; `expand 2 1 = 1`; `expand 1 = id` | True | Holomorphy added |
| §1.2 zero insertion without holomorphy | `f = Q + |Q|²Q̄`, `m = 2` | `qExpansion 1 f = X`; `qExpansion 2 f = 0`; `expand 2 X = X²` | False | New negative-control Check |
| §1.2 Laurent zero insertion | `Δ⁻¹`, `h = 1`, `m = 2` | `1/(1 − 24Q + 252Q²) = 1 + 24Q + 324Q²`, so `Δ⁻¹ = Q⁻¹ + 24 + 324Q ↦ q⁻² + 24 + 324q²`; route: `QΔ⁻¹ = 1 + 24Q + ⋯` bounded, apply the lemma, shift by `q⁻²` | True | Stated with holomorphy |
| §8.5 period change | `F = Δ`, `ρ = 1`, `a_m = τ(m)`, `r = 2`; non-holomorphic F | `qExpansion 2 Δ`: coefficient 2 is `τ(1) = 1`, coefficient 4 is `τ(2) = −24`, odd ones 0, `a′₀ = 0`; for `Q + |Q|²Q̄`, coefficient 2 at `h = 2` is `0 ≠ a₁ = 1` | True with holomorphy, false without | Hypothesis added |
| §8.5 lcm bullet | `F = G = Δ`, `h = 1`, `h′ = 2`; `c = d = 0` | `(c + d)Δ` at period 2 has `(c + d)τ(m)` at `q^(2m)`; zero form gives zero sequence | True | "vector-valued forms" made explicit |
| Conventions: p-scaling | `p = 2`, `H = Γ(2)`, `f = λ`; `H = SL₂(ℤ)` | `ATA⁻¹ = [[1, 2], [0, 1]] = T² ∈ Γ(2)`, so `T ∈ H_A`; `λ(2τ + 2) = λ(2τ)`; `A⁻¹γA = [[a, b/2], [2c, d]]`, so `SL₂(ℤ)_A = Γ₀(2)`; `A⁻¹TA = [[1, 1/2], [0, 1]] ∉ SL₂(ℤ)` | True | New bullet |
| §5.5 heading | statement unchanged | `[M₄ : ℚ(λ)] = 4`, `[M₆ : ℚ(λ)] = 12` recomputed: `(64/12)(3/4)`, `(216/12)(3/4)(8/9)` | True | Heading only |

Weight-zero is all the p-scaling bullet claims. In weight k the unnormalised `f(pτ)` is also `H_A`-invariant, because `A⁻¹γA` has lower row `(pc, d)`, so `cAτ + d = (pc)τ + d`. That is a remark, not a defect.

## For the maintainer

- No Lean name changed. Section numbers are unchanged; only the heading text of Layer 5 and §5.5 changed. No roadmap cites those headings: NoncongruenceModularForms cites W1.x and W6.x, and they still resolve.
- `design/plan.json` (outside the gaps list, which this job may not edit) still uses the word "leveraging" in node titles (`W5/leveraging-contradiction`). The README is consistent; the plan's node text belongs to a later design pass.
- Ownership against open pull requests was checked with `roadmaps grep` over the open heads and main, both for the renamed headings and for the new Tau Ceti citation, which is a library declaration and not another roadmap's object. No new construction was added.
- The review's "For the human reviewers" items (SpecialFunctionsTheta's merge order, NoncongruenceModularForms naming this roadmap, the CDT25 licence note, Ihara1994 uncertified) were not acted on, as the brief requires.
