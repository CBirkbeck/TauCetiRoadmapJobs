# FIX-DESIGN-StackPointsAndResidualGerbes~12

This round repairs the findings of the round-11 design review: three findings, all P3. Each was
checked against the cited sources, the roadmap's own targets, SchemeAndStackFoundations on main and
the pinned Mathlib. All three are right and all three are applied. Files changed:
`packages/StackPointsAndResidualGerbes/design/README.md` and
`packages/StackPointsAndResidualGerbes/design/plan.json`. `sources.toml` is unchanged, because
every locator added is in a source already recorded.

## F01 (P3) — applied

**Verified.** "`ker θ_x` = image of `T_{BG_x}`" plus "`T_{BG_x} = 0` iff `G_x` is smooth" gives only
smooth ⇒ isomorphism. The converse, and the leading `0` of the Summary's sequence, need `di`
injective.

**Why `di` is injective.** `i` is a closed immersion, hence a monomorphism (0.3), hence fully
faithful on fibre categories (0.2). So an isomorphism `i∘τ ≅ i∘τ'` that respects the framings is
`i` of a unique `τ ≅ τ'`, and faithfulness makes that isomorphism respect the framings too. The
chart route gives the same thing independently: `ker θ_x = T_{W,u}/im T_{U_x,u} ≅ T_{BG_x}`.

**Old → new.** 7.3 "surjective, with kernel the image of `T_{BG_x}`" → "surjective; that the
differential `di : T_{BG_x} → T_{𝒳,x}` is injective with image the kernel of `θ_x`, so that
`0 → T_{BG_x} → T_{𝒳,x} → N_x → 0` is exact", followed by the full-faithfulness argument. *Needs*
gains 0.2 and 0.3. The plan statement gains the same clause, and the plan prerequisites gain
`target:0.2` and `target:0.3`. The build paragraph's Layer 7 list gains 0.2.

**New Check (README) and plan test `A1mup`.** `[𝔸¹/μ_p]` at `0` in characteristic `p`:
- `T ≅ k²`, the framed deformations being `(z^p = 1 + aε, t ↦ bεz)`.
- `im di` is the line `b = 0`, equal to `T_{Bμ_p} ≅ k`.
- `N_0 ≅ k` and `θ_0(a, b) = b`.
- The flat but non-smooth atlas `𝔸¹` sees only the line `a = 0`.

**Pattern.**
- The Summary's sequence (README line 25) is now justified by 7.3.
- The plan API `exact` already stated the sequence.
- No other target states a kernel without the matching injectivity.

## F02 (P3) — applied

**Verified.** alper-moduli lines 16541–16542 assume a Noetherian stack and a finite type point.
6.2 named only "Noetherian". Its route (2.1, 2.2, and full faithfulness of `𝒵_x → 𝒳`, from 0.2)
uses neither hypothesis.

**Old → new.** "(…, Exercise 7.4.40 (1), for Noetherian stacks)" → "(…, for a finite type point of
a Noetherian stack; neither hypothesis is used: the route is 2.1, 2.2 and full faithfulness of
`𝒵_x → 𝒳`)", in the README and in the plan locator.

**Two new Checks (README) and plan tests `non_finite_type_point`, `non_noetherian`.**
- The generic point `η` of `𝔸¹_k`, which is not a finite type point.
- `Spec ℚ(t)/ℤ`, which is not quasi-separated and so not Noetherian, at its finite type point.

**Pattern.** 6.3 cited alper-moduli lines 6998–6999 and 16539–16540 without their hypotheses. It
now names them: a rational point with smooth affine stabiliser of a Noetherian stack of finite type
over a field, and a rational point of a quasi-separated stack of finite type over a field. It also
points to 6.4, which needs none of them. Changed in the README and the plan locator.

The other secondary-source locators already name their hypotheses:
- 5.3 (Proposition 7.4.39; Theorem B.2);
- 6.4 (Proposition 4.5.16 (2));
- 7.2–7.4 (ahr2020 §3.1).

## F03 (P3) — applied

**Verified.** 5.1's *Needs* names SchemeAndStackFoundations §§1.19–1.20, but Layer 5's
Dependencies line named no SchemeAndStackFoundations section. 7.4's *Needs* names
`.baseChangeImage`, which was missing from the §1.20 contract. On main, `.baseChangeImage` is in
SchemeAndStackFoundations §1.20 (its README line 3656).

**Old → new.**
- Layer 5 Dependencies: "Layers 0 and 2–4; Mathlib …" → "Layers 0 and 2–4; SchemeAndStackFoundations
  §§1.19–1.20; Mathlib …".
- §1.20 contract: `.baseChangeImage` added between `.pullbackSurjective` and `.atlasOpenSurjective`.

**Pattern.** I compared, by script, every backticked supplier name in a *Needs* line against the
contracts. One more omission turned up: Mathlib `finite_of_finite_type_of_isJacobsonRing` (used by
5.5) was not in "From Mathlib". It is now added there, with its pin location
`Mathlib/RingTheory/Jacobson/Ring.lean:691` (root namespace, `[IsJacobsonRing R] [Field S]
[Algebra.FiniteType R S]`). A field is Jacobson through the Artinian-ring instance at line 102 of
the same file.

The per-layer unions of supplier sections in the *Needs* lines are now contained in every
Dependencies line. Layers 1, 2 and 4 also list §1.12, §1.16 or §1.21; these come from their Checks,
which is not an omission.

## Checks run

**Dependency gate:**

    candidate: StackPointsAndResidualGerbes is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
    depcheck: 246 roadmaps, 2242 edges, 0 problem(s)

No UPWARD and no CYCLE line.

**Consistency (by script):**
- Every target has as many README Checks as plan tests, at least three each. The total is now 142
  against 142; it was 139.
- Every *Needs* line equals its plan prerequisites in target numbers and gap slugs: 0 mismatches.
- `plan.json` parses, and its formatting is unchanged apart from the edited entries.
- The added lines have no LaTeX delimiters, machine paths or process words.

**Lean.** A design has no `Suggested.lean`, so there was no `#check` comparison and no elaboration.

**Gate failures.** None were listed for this round.

## Adversarial pass on changed statements

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 7.3 `di` injective, `im di = ker θ_x` | `Bμ_p` over `𝔽_p` (`i = id`) | `di = id` on `T ≅ k`; `N = 0`; `ker θ = k = T_{BG}`; `dim Lie − dim G = 1 − 0` | holds |
| same | `[𝔸¹/μ_p]` at `0`, char `p` | framed isomorphisms `z ↦ (1+cε)z` with `(1+cε)^p = 1`; `b ε(1+cε) = bε`, so `T = k²`; `im di = {b = 0} ≅ k`; `θ(a,b) = b`; `2 = 1 + 1` | holds; new Check |
| same | `[𝔸¹/𝔾_m]` at `0` | `T_{B𝔾_m} = 0` (`1 − 1`), `θ_0` bijective onto weight-one `N_0` | holds |
| same | cusp, `G_x = 1` | `T_{B1} = 0`, `θ` the identity on a 2-dimensional space | holds |
| 7.3 route vs non-smooth chart | flat atlas `𝔸¹ → [𝔸¹/μ_p]` | image of `T_{𝔸¹,0} = k` is `{a = 0}`, not all of `T = k²` | the route needs a smooth chart, as stated |
| 6.2 without finite type point | `η ∈ 𝔸¹_k`, `K = k(t)` and `K ⊇ k(t)` of infinite transcendence degree | `𝒵_η = Spec k(t) = 𝒵_η^♭`; `Spec k(t) ×_{k(t)} Spec K = Spec K`; `G_x = 1`, `BG_x = Spec K` | holds; new Check |
| 6.2 without Noetherian | `X₀ = Spec ℚ(t)/ℤ`, `x` étale | `ℤ × U → U × U` is not quasi-compact, so `X₀` is not quasi-separated; `X₀ ×_{X₀} Spec ℚ(t) = Spec ℚ(t) = B1`; not decent, so only the first form applies | holds; new Check |
| 6.2 earlier Checks (recomputed) | `[Spec ℂ/(ℤ/4)]`; `BG_k` with `G = ℤ/2, μ_p, 1`; finite `k/κ` | `B(ℤ/2)_ℂ`; three products `BG`, `Spec k`, `G`; `Spec k = B1` | unchanged |
| 6.3 locator | alper-moduli lines 6993, 6998–6999, 16539–16540 | Noetherian, finite type over `k`, `x ∈ X(k)`, smooth affine `G_x`; quasi-separated, finite type over `k`, `x ∈ X(k)` | hypotheses now named |
| Mathlib contract: Zariski's lemma | `R = κ(x)` a field, `S = k` | the instance `[IsArtinianRing R] : IsJacobsonRing R` (line 102) applies; `Module.Finite R S` | holds at the pin |
| §1.20 `.baseChangeImage` | SchemeAndStackFoundations main, README line 3656 | the image of a base change of `h` along `Z → X` is the preimage of `|h|`'s image, as 7.4 uses it | present |

## Ownership and overlaps

No construction was added, so ownership is unchanged from the reviewed design. No cross-roadmap
citation was added: `.baseChangeImage` was already cited in 7.4 and is now listed in the contract.
No Lean name of this roadmap changed, and no id that other roadmaps cite was renumbered.

## For the maintainer

- No name that other roadmaps cite changed.
- The review's "For the human reviewers" section (licences of `alper-moduli` and `sga3-vi-a`;
  ownership notes about VirtualFundamentalClasses and FunctionFieldArithmeticPartII) lists no
  finding, so nothing was changed because of it.
- No suspicious instructions were found in the review text.
