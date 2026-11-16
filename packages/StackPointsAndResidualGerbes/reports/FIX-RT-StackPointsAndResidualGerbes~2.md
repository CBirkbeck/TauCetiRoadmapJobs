# FIX-RT-StackPointsAndResidualGerbes~2

Repair of red-team round 2 (passes a and b). Files changed: `packages/StackPointsAndResidualGerbes/README.md`,
`packages/StackPointsAndResidualGerbes/Suggested.lean` (module docstring only), and
`packages/StackPointsAndResidualGerbes/sources.toml` (locators and one `cited_for`). `design/plan.json` is
unchanged: no new supplier gap was needed. `gap:inertia-of-presentations`, now also cited by 3.4,
was already declared.

## RT-StackPointsAndResidualGerbes~2a/F01 (P2) — applied

7.4 claimed an equivariant isomorphism but its route only gave one of vector spaces. 7.4 now defines the `Stab_G(x)`-actions on `T_{V,x}` and `T_{G·x,x}` and proves equivariance. The proof restricts *QCoh.presentationEquiv*'s descent datum (stacks-sheaves-on-stacks lines 977–983) along `(G_x ⇉ Spec k) → (G × V ⇉ V)`. *Needs:* gains SchemeAndStackFoundations §1.22. New Check: `𝔾_m` on `𝔸¹` at `0`.

## RT-StackPointsAndResidualGerbes~2a/F02, RT-StackPointsAndResidualGerbes~2b/F01 (P2) — applied

Docstring: "`𝒵_x ≃ BG_x` exactly when `κ(x) → k` is an isomorphism" → "on a decent stack … the canonical morphism `BG_x → 𝒵_x` is an equivalence exactly when …". The 5.3 bullet gains "where it exists". Same pattern fixed in the docstring's 6.4 bullet, README 6.4 (statement, first Check) and the Summary. 6.4's third Check is rewritten with the `ℚ(t)`/`ℚ(√t)` remark.

## RT-StackPointsAndResidualGerbes~2a/F03 (P3) — applied

Verified at stacks-06QB lines 2849–2855: the proof uses Lemma 101.5.1. 3.4's *Needs:* gains gap:inertia-of-presentations, plus Mathlib `AlgebraicGeometry.LocallyOfFinitePresentation.iff_locallyOfFiniteType` with SchemeAndStackFoundations §1.8 `Spaces.EtaleLocal`. Layer 3 Dependencies gains gap:inertia-of-presentations.

## RT-StackPointsAndResidualGerbes~2a/F04 (P3) — applied

6.4's proof: "a section … is a monomorphism, and 3.2 makes it an isomorphism" → "…; `𝒵_x^♭` is reduced, locally Noetherian and one-point (3.4), so it has a surjective, flat, locally finitely presented point (3.1), and 3.2 makes the section an isomorphism". 3.1 is added to the *Needs:*.

## RT-StackPointsAndResidualGerbes~2a/F05 (P3) — applied

3.2 now names `𝒵'` "the *locally Noetherian core* of `𝒵`", and the third Check writes "locally Noetherian core". The bare word "core" occurs nowhere else.

## RT-StackPointsAndResidualGerbes~2a/F06 (P3) — applied

References: "Sections 68.6–68.8, 68.10 (…), 68.11–68.13 and 68.15". Manifest locators: `stacks-decent-spaces` "Sections 68.6-68.8, 68.10-68.13, 68.15" (its `cited_for` is extended), `stacks-sheaves-on-stacks` "Sections 96.6, 96.11-96.12, 96.14-96.15". Pattern: `alper-moduli` "Sections 4.3.4, 4.5.2-4.5.3, 7.4.5" (the reference entry gains §4.3.4 and Exercise 4.5.11), `ahr2020` "Section 1 (Theorems 1.1-1.2), Sections 1.5 and 3.1".

## RT-StackPointsAndResidualGerbes~2b/F02 (P3) — applied

5.1: "(lines 4699–4721", "(lines 4722–4731", "(lines 4732–4735" → each prefixed with "stacks-06RD". The source has Lemmas 48.3, 48.4 and 48.5 at those lines. A script checked every other bare `lines N` locator in the README against the last source id before it; all resolve correctly.

## RT-StackPointsAndResidualGerbes~2b/F03 (P3) — applied

4.5's locator "Lemma 101.51.4; Remark 101.51.3, lines 4866–4869" → "Lemma 101.51.4 and its proof". A new API bullet states the remark's content and cites it: for `𝒳` locally Noetherian, `x` closed and `𝒴` reduced, every `𝒴 → 𝒳` with image in `{x}` factors through `𝒵_x`, by 0.5.

## Checks

**Elaboration.** `lake env lean packages/StackPointsAndResidualGerbes/Suggested.lean`, run from the
content checkout, exits with code 0 and no output. The file has no `TauCeti.*` import.

**`#check` comparison.** `Suggested.lean` declares nothing: one docstring and an empty namespace. So
no `#check` file was needed and no elaborated type differs from the README.

**Dependency check.**

    depcheck: 239 roadmaps, 2249 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line. No notion was moved down from a later roadmap.

**Citations.** `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found
nowhere.

**Gaps.** 17 slugs, the same set in `design/plan.json` and under "Exact supplier contracts".

**Ownership.** No new object was introduced. The equivariance in 7.4 consumes
SchemeAndStackFoundations §1.22 (*QCoh.presentationEquiv*, on main), which the README already
imports. `scratch/overlaps.md` lists no open pull request that changes this roadmap, no dropped id
and no second copy.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 7.4 `N_x ≅ T_{V,x}/T_{G·x,x}` equivariantly | `𝔾_m` on `𝔸¹` at `0` | `J/J²⊗k = k·t` weight `−1`; `T_{𝔸¹,0} = k·∂_t` weight `+1` = `d(t ↦ λt)`; `N_0` weight `+1` | equal characters; the non-contragredient model gives `−1` and is excluded by the new Check | Check added |
| same | `GLₙ` on `𝔸ⁿ` at `0` | `J = 𝔪`, `J/J²⊗k` = dual standard; `T_V/T_{orbit} = kⁿ` standard; `N_0` = standard | holds | Check names the representation |
| same | `SL₂` on binary quadratic forms at `uv`, char ≠ 2 | torus weights on `T_V`: `2, 0, −2`; on `T_{orbit} = 𝔰𝔩₂·uv`: `2, −2`; quotient weight `0`; `J/J²⊗k` spanned by the invariant `disc − 1`, trivial | holds | none |
| same | `E × 𝔾_m` on `E × 𝔸¹` at `(0_E, 0)` | `G_x = 1 × 𝔾_m`; `J = (t)` weight `−1`; quotient `k·∂_t` weight `+1` | holds | none |
| same | `G = 1` acting on `V`, `x ∈ V(k)` | `[V/1] = V`, orbit `{x}` closed, `N_x = (𝔪_x/𝔪_x²)^∨ = T_{V,x}` | agrees with 7.2's scheme bullet | none |
| same | `𝔾_m` on `𝔸¹` by `λ^p` in char `p`, `x = 0` | `t ↦ λ^{−p}t`, `∂_t` weight `p`; differential of `t ↦ λ^p t` is `λ^p` | holds | none |
| 7.4 restriction step | groupoid morphism `g ↦ (g, x)` | `s(g,x) = x`, `t(g,x) = g·x = x` for `g ∈ Stab_G(x)`; the induced `BG_x → [V/G]` sends the trivial torsor to `x` with the identity on `G_x`, as `i` does | well defined | none |
| docstring 6.3 "canonical `BG_x → 𝒵_x` equivalence ⇔ `κ(x) → k` iso" | `Spec ℚ(t)`, `x` given by `σ : t ↦ t²` | canonical map `Spec σ`, not an isomorphism; `σ` not surjective | both sides false | docstring repaired |
| same | `κ = ℚ(t) ⊂ k = ℚ(s)`, `s² = t` | canonical map `Spec k → Spec κ` of degree 2; abstract isomorphism `t ↦ s` exists | both sides false; the abstract form would be wrong | docstring repaired |
| same | `k = κ`, `x = id` | canonical map the identity | both sides true | none |
| same | non-decent `Spec ℚ(t)/ℤ` | `κ(x)` undefined (base not a field, 3.4) | excluded by "on a decent stack" | docstring repaired |
| 6.4 canonical equivalence | `BG_k` at the trivial torsor; `[𝔸¹/𝔾_m]` at `0`; `Bμ_p/𝔽_p(t)` | canonical map `id_{BG}`; `B𝔾_m → B𝔾_m` the identity; `Bμ_p = BG_x` | holds | wording |
| 6.4 section condition (third Check) | `κ = ℚ(t)`, `k = ℚ(s)`, `x : Spec k → Spec κ` | `p∘x = id` would need `κ → k` surjective, false; canonical `Spec k → Spec κ` of degree 2; `ℚ(s) ≅ ℚ(t)` | conclusion fails canonically, holds abstractly | Check rewritten |
| 6.4 proof via 3.1, 3.2 | `𝒳 = Spec k`; `Bμ_p/𝔽_p(t)` | `𝒵^♭ = Spec k`, resp. `Spec 𝔽_p(t)`; section `id`; the flat lfp point is `id` | holds | 3.1 cited |
| 3.2 locally Noetherian core | `U/G` of Example 100.11.6; `BG`; `Spec k` | `Spec ℚ̄`, a proper substack; `BG`; `Spec k` | the term matches all three Checks | term defined |
| 3.4 gerbe clause inputs | `Bμ_p/𝔽_p` | `I ×_𝒵 Spec 𝔽_p = μ_p`, of finite type over `𝔽_p`, hence lfp and flat; 2.4 applies | holds | *Needs:* extended |
| 4.5 API (Remark 101.51.3) | `[𝔸¹/𝔾_m]` at `0` with `Spec k → 0`; `Spec k[ε]`, `t ↦ ε` | factors through `B𝔾_m`; the nonreduced source does not, since `ε ≠ 0` | reducedness needed (0.5's third Check) | bullet added |
| same | `U/G` of Example 100.11.6 (not locally Noetherian), `U → X` | image the closed point; it would factor through `Spec ℚ̄` only through a locally constant `U → G` hitting every element of the infinite `G`, impossible on the quasi-compact `U` | the Noetherian hypothesis is needed (4.5's third Check) | none |
| 5.1 locators | stacks-06RD lines 4699, 4722, 4732 | "Lemma 48.3", "Lemma 48.4", "Lemma 48.5" | correct after the repair | source id added |
| References ch. 68 | grep of the README | cited sections 6, 7, 8, 10, 11, 12, 13, 15; none from 9 or 14 | list matches | locators repaired |

## Notes for the maintainer

- No declaration names, section numbers, targets or headings changed. 4.5 gains an API bullet and
  3.2 a term, so citing roadmaps are unaffected.
- No new target, no new supplier gap, and nothing moved between layers.
- The README now reads 7.4's identification as one of `G_x`-representations, with a route.
  Consumers that use 7.4 for stabiliser weights (MotivicStructuresInModuliOfCurves §§8.4, 8.6) can
  rely on equivariance.
- Nothing suspicious was found in the review texts; they were treated as data.
