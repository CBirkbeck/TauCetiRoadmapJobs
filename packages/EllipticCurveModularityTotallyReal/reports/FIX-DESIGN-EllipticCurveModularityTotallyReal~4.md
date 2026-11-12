# FIX-DESIGN-EllipticCurveModularityTotallyReal~4

The review has three findings. I checked each against the roadmap's own conventions and by direct computation. All three are correct and all three are applied as asked.

Files edited:
- `packages/EllipticCurveModularityTotallyReal/design/README.md`
- `packages/EllipticCurveModularityTotallyReal/design/plan.json`

`sources.toml` is unchanged: no new work is cited. The new witnesses are standard computations and need no locator.

This is the design stage, so there is no `Suggested.lean`. Nothing was elaborated, and the `#check @name` pass does not apply. No Lean name, cross-roadmap citation or supplier contract changed.

## F01 (P1) — applied

**Verified.** Write the twist datum as `φ ∘ ᵍφ⁻¹ = a_g`, so `ᵍφ = a_g⁻¹ ∘ φ`.
- Naturality of the Galois action on `H¹` gives `ρ_{X′}(g) ∘ φ^* = (ᵍφ)^* ∘ ρ_X(g)`. By contravariance, `(a_g⁻¹ ∘ φ)^* = φ^* ∘ (a_g⁻¹)^*`. So the transported action on `H¹(X)` is `(a_g⁻¹)^* ∘ ρ_X(g)`, not `a_g^* ∘ ρ(g)`.
- Duality gives the same answer. The transported Tate action is `a_g ∘ ρ_T(g)`, and `(AB)^{−T} = A^{−T}B^{−T}` gives `(a_g⁻¹)^* ∘ ρ_{H¹}(g)`.
- The new rule is a group action. Using `ρ(g)α^*ρ(g)⁻¹ = (ᵍα)^*` and `a_{gh} = a_g ∘ ᵍa_h`, it composes to `(a_{gh}⁻¹)^*ρ(gh)`. The old rule composes to `(ᵍa_h ∘ a_g)^*ρ(gh)`, which is not `(a_{gh})^*ρ(gh)` for noncommuting values.
- I recomputed the review's cubic witness with `ω = dx/(2y)`. `a_g(x,y) = (ζ₃⁻¹x, y)`, `φ^*ω = bω′`, and the transported action gives `ζ₃ω`. The new rule gives `ζ₃ω`; the old one gives `ζ₃⁻¹ω`.

**Change.**
- Conventions: old "on `H¹(X)` by `a_g^* ∘ ρ(g)`" → new "`(a_g⁻¹)^* ∘ ρ(g)`". Added: the naturality derivation, the Tate-module form `a_g ∘ ρ(g)`, and the involutive specializations `(w^*)^{e(g)}ρ(g)` and `δ(g)ρ(g)`.
- New Convention witness: the cubic twist over `ℚ(ζ₃)`.
- §1.2(5): one sentence saying its formula is this rule, since `w^{e(g)}` is its own inverse.
- plan.json §1.2: new test "inverse cocycle on H^1".

**Pattern search.** The only cocycles in the roadmap are the reflection cocycle `w^{e(g)}` (§1.2 statement and items 1, 2 and 5, plan 1.2) and quadratic twists by δ and `χ_{h(t)}` (§§1.6, 4.1). Both are involutive, so their formulas stand:
- §1.2(2), `ᵍu′_ζ = φ⁻¹ w^{e(g)} u_{g(ζ)} w^{e(g)} φ`, recomputed from `(ᵍφ)⁻¹ = φ⁻¹a_g`: correct.
- The point rule `g ⋆ x = a_g(gx)`: recomputed and correct.
- No supplier states a cohomological cocycle formula (`roadmaps grep` on `a_g^*` and on `φ ∘ ᵍφ⁻¹`: no match on main or at the open heads).

## F02 (P3) — applied

**Verified.** For `k = ℚ(√−3)`, n = 3: `M = k(μ₃) = k` and `L = k(−1) = k`, so `Ind_{G_M}^{G_L} 1 = 1`. Then `W_θ ⊗ Ind 1` has rank 2, while the displayed `W_θ ⊕ W_θ ⊗ δ` has rank 4.

**Change (README §1.3 Check and plan test "induction").** Old: the unconditional `W_θ ⊗ Ind 1 = W_θ ⊕ W_θ ⊗ δ`. New:
- In general the induction is `W_θ ⊗ Ind 1`, of rank `2[M:L]`.
- When δ is nontrivial, `[M:L] = 2`, `Ind 1 = 1 ⊕ δ` and the induction is `W_θ ⊕ (W_θ ⊗ δ)`, of rank 4.
- When `M = L`, the induction is `V_θ = W_θ`, of rank 2, not `W_θ ⊕ W_θ`.

**Pattern search.** No other unconditional decomposition breaks at `M = L`:
- §1.6, `W_η ⊕ W_{η⁻¹}`: here `η ≠ η⁻¹` because n is odd.
- §4.3, `ψ ⊕ ψ^c`: KT/K is always quadratic.

## F03 (P2) — applied

**Verified.** Take n = 15 (p = 5), t ∈ U(k), `J = Pic⁰(C_15(t))` and `k′ = k(μ₁₅, J[3])`.
- Over k′, `M = L = k′` and δ is trivial.
- By Kummer theory, `H¹(C_{k̄}, μ₃) ≅ J[3]`, so `H¹(C_{k̄}, 𝔽₃) ≅ J[3] ⊗ μ₃^{⊗−1}`. This is a trivial `G_{k′}`-module.
- Each `T^δ_θ/𝔪` is a rank-two quotient of its scalar extension to κ, so it is `κ²` with trivial action. Hence `W_χ ≡_3 W_η`, although `χ̄ = ψ̄` has order 5 in characteristic 3 and `η̄ = 1`.

The sources assert only the positive congruences (LeHung26 lines 243–247; OpenAI26 lines 547–578).

**Change (README §1.5 Check; plan test "reversed primes" → "labels versus congruence at 3", plus a new plan test "accidental congruence").** Old: "`χ̄ = ψ̄ ≠ 1 = η̄`, so `W_χ ≡_3 W_ψ` and not `W_η`". New:
- The argument gives `W_χ ≡_3 W_ψ` and gives no congruence `W_χ ≡_3 W_η`.
- Unequal labels do not exclude such a congruence.
- The k′ example is added as a positive control.

The main congruence statement of §1.5 is unchanged.

**Pattern search.** Searches for `≢`, "not congruent", "and not W", "revers" and "cannot be" found no other noncongruence assertion.
- §1.5 "why three cannot be the seed prime" explains the route; it asserts no non-isomorphism.
- §2.1 "Labels" Check says that replacing ψ by ψ² gives a Galois-conjugate system and breaks the comparison argument. That is a claim about the deduction, not a claim of non-isomorphism.

## Checks run

**Dependency check (exact command from the brief), complete output:**

```text
candidate: EllipticCurveModularityTotallyReal is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2152 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. That the roadmap is not yet in the merge order is expected at the design stage.

**Other checks.**
- `plan.json` parses as JSON. Its formatting is preserved: one-space indent, no trailing newline.
- Elaboration was not run, because there is no `Suggested.lean` at the design stage.
- No gate failures were listed for this round.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| Twist rule `(a_g⁻¹)^* ∘ ρ(g)` on `H¹` | Cubic twist over `ℚ(ζ₃)`, `g(b) = ζ₃b` | Transported ω ↦ `ζ₃ω`; new rule `ζ₃ω`; old rule `ζ₃⁻¹ω` | New rule correct; old rule refuted |
| Same | Trivial cocycle (`g(b) = b`, `a_g = id`) | Both give `ρ(g)` | Consistent |
| Same | Quadratic twist, `a_g = [−1]^{e(g)}` | `([−1]⁻¹)^* = −1` on `H¹`; at 5 for `y² = x³ − x + 1` by 2: trace `−(−2) = 2` = twist's `a₅` | Matches the existing witness |
| Same | Group-action test `T(g)T(h) = T(gh)` | New: `((a_g ∘ ᵍa_h)⁻¹)^*ρ(gh) = (a_{gh}⁻¹)^*ρ(gh)`; old: `(ᵍa_h ∘ a_g)^*ρ(gh)` | New rule is an action for any cocycle |
| Tate-module form `a_g ∘ ρ_T(g)` | Dualize | `(a_gρ_T)^{−T} = a_g^{−T}ρ_T^{−T} = (a_g⁻¹)^*ρ_{H¹}` | Agrees with the `H¹` rule |
| §1.2(5) `(w^*)^{e(g)}ρ(g)` | `δ(g) = ±1` | `w⁻¹ = w`, so `((w^{e})⁻¹)^* = (w^*)^{e}`; at `δ(g) = 1` this is `ρ(g)` | Unchanged formula, now justified |
| §1.2(2) `ᵍu′_ζ` | `δ(g) = −1` | `φ⁻¹ a_g u_{ζ⁻¹} a_g⁻¹ φ = φ⁻¹ w u_{ζ⁻¹} w φ = u′_ζ` | Correct |
| Induction Check, δ nontrivial | k = ℚ, n = 3; k = ℚ(i), n = 3 | `[M:L] = 2`, `Ind 1 = 1 ⊕ δ`, rank `2·2 = 4` | Correct |
| Induction Check, `M = L` | `k = ℚ(√−3)`, n = 3 | `Ind 1 = 1`, rank `2·1 = 2`; old display gave 4 | Repaired |
| Labels versus congruence at 3 | n = 15, p = 5 | `η̄ = 1`, `ψ̄` of order 5 (5 ∤ 3), `χ̄ = ψ̄` | The argument gives `W_χ ≡_3 W_ψ` only |
| Accidental congruence control | n = 15, `k′ = k(μ₁₅, J[3])` | M = L = k′, δ = 1, `H¹(C,𝔽₃) ≅ J[3] ⊗ μ₃^{−1}` trivial, `T/𝔪 = κ²` trivial; trace 2, determinant 1, polynomial `(X−1)²` for every g on every θ | `W_χ ≡_3 W_η ≡_3 W_1` over k′: the old negative claim is refuted |
| Same, against §1.5's main statement | Same k′ | The positive congruences `W_η ≡_p W_χ ≡_3 W_ψ ≡_p W_1` hold, all reductions being trivial at 3 | No contradiction with the theorem |

## Notes for the maintainer

- **Changed names.** No Lean name, section number or cross-roadmap citation changed. Other roadmaps need no update.
- **Plan test names.** The test "reversed primes" of plan target 1.5 is renamed "labels versus congruence at 3". Two tests are added: "accidental congruence" (1.5) and "inverse cocycle on H^1" (1.2).
- **Supplier wording.** Per the review, the informal "reversing these primes" language in the sources (and in any supplier) is subject to the same finite-extension control. Its actual theorems assert only positive congruences. Nothing here cites that language.
- **Ownership.** No new construction was introduced, so no ownership search against open pull requests was needed this round. The repairs only correct Checks and a convention inside this roadmap.
- **Untrusted text.** The review contained no instruction beyond its findings. Nothing suspicious was quoted or acted on.
- **Resolver leads.** The resolver's three leads (`GaloisRep.IsOdd`, `GaloisRep.iso_of_frobenius_charpoly_eq`, `TateModule.residualRep`) are untouched by this round. They are names planned by ArithmeticGaloisRepresentations §§4.1, 5.3 and 6.1, as the README's supplier contracts say. They are not pinned declarations.
