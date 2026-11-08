# FIX-DESIGN-StackPointsAndResidualGerbes~5

Findings of `REV-DESIGN-StackPointsAndResidualGerbes~4`: one review with one P2 finding and two P3
findings. I checked each against the cited sources and found all three correct.

Files edited:
- `packages/StackPointsAndResidualGerbes/design/README.md`
- `packages/StackPointsAndResidualGerbes/design/plan.json`
- `packages/StackPointsAndResidualGerbes/sources.toml` (`cited_for` only)

## F01 (P2) — applied

Old → new (1.2, API bullet 3): "Two objects over `k` have the same image iff they become isomorphic
over some extension of `k`" → same image iff there are a field `Ω` and field homomorphisms
`a, b : k → Ω` with `(Spec a)^*x ≅ (Spec b)^*y` (stacks-04XE lines 341–350, with `K = L = k`). One
extension suffices for "if" but not for "only if". New Check: `Spec ℚ(i)` with `id` and `σ`.

**Verification.**
- stacks-04XE lines 341–350 define the equivalence of `p : Spec K → 𝒳` and `q : Spec L → 𝒳` through
  a field `Ω` with two independent morphisms to `Spec K` and to `Spec L`.
- Convention 1 makes objects over `Spec k` absolute, so the reviewer's instance applies:
  - Over `Spec ℚ(i)`, the objects `x = id` and `y = σ` represent the single point, through `(a, b) = (σ, id)`, since `σ ∘ id = σ = id ∘ σ`.
  - After any single `ι : ℚ(i) → Ω`, they become `ι` and `ι ∘ σ`. These differ at `i`, since `2ι(i) ≠ 0`.

**Differences from the suggested wording.**
- The embeddings are called `a, b` instead of `i, j`, so they do not clash with the imaginary unit in
  the Check.
- The Check says "isomorphism classes of objects of a scheme over `Spec Ω` are its morphisms from
  `Spec Ω`" instead of "isomorphic objects are equal". Convention 1 views schemes as stacks in
  setoids, and the reworded form holds for both readings.

**`plan.json`.**
- 1.2's `fibre` API statement is restated.
- Test `two_embeddings` is added (non-example).

**Repairing the pattern.** I searched the README and `plan.json` for "isomorphic over", "become
isomorphic", "common extension", "same image" and "same point". The only other place is 1.3's API
bullet 2: "the base-change formula applied to a common extension of two representatives" (proof of
Lemma 101.19.2).
- That bullet compares representatives over two fields `k` and `k'`, so it already uses two
  embeddings, one of `k` and one of `k'`, as Lemma 100.4.1 does. It is correct and unchanged.
- No other target uses the 1.2 bullet:
  - 4.5 uses 1.2 only for "closed ⇒ finite type".
  - 3.4's "every field-valued point in the class `x` factors through `𝒵_x`" is Lemma 100.11.11, which uses the Stacks relation itself.

## F02 (P3) — applied differently

Old → new (1.1): the vacuous API bullet "If `x` is a finite type point, every representative which is
locally of finite type is one; the property is attached to the point" is deleted. Its intended content
is now a 1.1 Check:
- the point of `Spec ℚ` is of finite type through `id`, while `Spec ℚ̄ → Spec ℚ` is not locally of
  finite type;
- an "every representative" definition would admit no finite type points.

**Why "differently".** The review suggested a replacement API bullet. I made it a Check instead, for
three reasons:
- The content is a non-example, and its "conversely one locally finite type representative suffices"
  half restates Definition 101.18.2 (stacks-06RD lines 1567–1569).
- `plan.json` 1.1 has no API entry for it. Its three entries are `iff_closedPoint`, `map` and
  `dense`, which now match the README's statement and two API bullets one for one.
- As a Check it rules out a plausible wrong definition, the "every representative" one, by a
  computation:
  - For any representative `Spec k → 𝒳`, the composite `Spec k(t) → Spec k → 𝒳` is another representative.
  - It is not locally of finite type. Otherwise `Spec k(t) → Spec k` would be, by cancellation
    (Lemma 101.17.8, stacks-06RD lines 1527–1528, no hypothesis on the second morphism; part of
    gap:stack-morphism-permanence, already in 1.1's `*Needs:*`).
  - `k(t)` is not a finitely generated `k`-algebra.
- `ℚ̄` is not a finitely generated `ℚ`-algebra: by Zariski's lemma it would then be finite over `ℚ`.

`plan.json`: test `representative_not_lft` is added to 1.1 (non-example). The other three Checks of
1.1 are unchanged.

## F03 (P3) — applied

Old → new (5.2): the one-sentence route is now three numbered reductions. Each says why its object
keeps the hypotheses:
1. `𝒳'` (reduced closure):
   - decent by 5.1 (Lemma 101.48.3);
   - locally Noetherian by 0.5's API (Lemma 101.17.5);
   - quasi-compact inertia, since `I_{𝒳'} = I_𝒳 ×_𝒳 𝒳'` (0.2, Lemma 101.5.6).
2. `𝒰` (dense open gerbe), the open substack through which `f` factors:
   - decent by 5.1, or locally Noetherian by 0.1;
   - a residual gerbe of `𝒰` is one of `𝒳`.
3. Base `U`:
   - decent by 5.1 (Lemma 101.48.5);
   - locally Noetherian by 0.1's descent along the smooth surjective gerbe `π` (2.3, Lemma 101.33.8);
   - its residual space exists by 4.2.

**Verification.**
- stacks-06RD lines 4861–4863 handle decency of the base by Lemmas 101.28.13 and 101.48.4, which
  together are Lemma 101.48.5. They give local Noetherianity of the base only as "fppf descent
  (details omitted)".
- 2.3 already proves that a gerbe is smooth and surjective (stacks-06RD lines 3351–3352).
- 0.1's API descends a smooth-local property along a smooth surjective morphism. For an algebraic
  space it is the property of the space.
- So the route's input exists in the roadmap but was not cited, as the review says.

**The same omission inside 5.2, also repaired.**
- The route did not say why `𝒳'` keeps decency and quasi-compact inertia. The source says so at
  lines 4853–4856.
- The space case (Decent Spaces, Lemmas 68.13.9–68.13.10, stacks-decent-spaces lines 1565–1590) is
  stated for a morphism of algebraic spaces, while `𝒴` is a stack. The route now checks the
  factorisation on a reduced smooth atlas `V → 𝒴` (0.1). The check is legitimate because
  `𝒵_u → U` is a monomorphism (0.2), and the residual space comes from 4.2.

**New `*Needs:*`.**
- Added: 0.1, 0.2, 0.3, 2.3, 4.2 and gap:stack-morphism-permanence (base change of quasi-compact
  morphisms, as in 4.3).
- `plan.json` 5.2's prerequisites match. The gap's `neededBy` gains 5.2.

**Repairing the pattern elsewhere.** Two other routes pass to the reduced closure without saying why
the hypotheses survive:
- **4.3** (Lemma 101.31.1, stacks-06RD lines 3050–3053, which invokes Lemma 101.5.6): now names `𝒳'`
  and says its inertia is the base change `I_𝒳 ×_𝒳 𝒳'` (0.2's API). 0.2 is added to `*Needs:*` and
  to `plan.json`.
- **5.4**: "(its diagonal and inertia remain quasi-compact)" → "(its diagonal and inertia are base
  changes of those of `𝒳`, by 0.2's API, Lemmas 100.8.6 and 101.5.6, so they remain
  quasi-compact)". 0.2 is added to `*Needs:*` and to `plan.json`.
  - Lemma 100.8.6 with `𝒴 = Spec ℤ` makes `Δ_{𝒳'}` the base change of `Δ_𝒳` along `𝒳' × 𝒳' → 𝒳 × 𝒳`, since `𝒳' ×_𝒳 𝒳' ≃ 𝒳'`.
- 3.4's base is already locally Noetherian with 0.1 and 2.3 in its `*Needs:*`, so it is unchanged.
- 4.4 does not pass through a base, so it is unchanged.

**`sources.toml`.** The `cited_for` of `stacks-04XE` and `stacks-06RD` now list 5.4 (Lemmas 100.8.6
and 101.5.6). They also list Lemmas 101.17.4, 101.17.5 and 101.17.8 for 0.5, 1.1 and 5.2. No new
source was needed.

## Checks run

**Dependency gate** (the command of the brief, on the final README):

```
candidate: StackPointsAndResidualGerbes is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
depcheck: 237 roadmaps, 2343 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line, and no supplier was added.

**Citation resolver** (`roadmaps resolve` on the README; main at 87608f1, 471 open heads):
- "Cross-roadmap citations found nowhere: None".
- "Lean names found nowhere: None".

**`*Needs:*` ↔ `plan.json` script** (targets with ranges expanded, gap slugs, Checks per target):
- 38 README subsections and 38 plan targets.
- The only reported difference is at 7.3, where "8.3" is AlgebraicModuliForArithmeticGeometry
  §§8.1, 8.3 (a roadmap section the script reads as a target number). So no target differs.
- Gap `neededBy` sets equal the citing subsections for all 16 gaps.
- 131 README Checks against 131 plan tests, equal per target (129 before, plus one each in 1.1 and
  1.2).
- `plan.json` parses as JSON and `sources.toml` as TOML.

**Style scan** of the added lines:
- no LaTeX delimiters, process words, round labels or machine paths;
- no backticked name of this roadmap's own was added.

**Elaboration / `#check` comparison**: not applicable. The design stage has no `Suggested.lean`, and
no Lean statement changed.

**Sources**: every passage cited by the new text is in a cached manifest source and was read at the
lines given:
- stacks-04XE lines 341–350 and 424–437;
- stacks-06RD lines 1478–1543, 3040–3056, 3335–3357, 4686–4735 and 4829–4869;
- stacks-decent-spaces lines 1565–1601.

No text is missing, so there is no `needs-references.toml`.

**Ownership against open work.** This round adds no construction, carrier or comparison, only a
corrected API bullet, two Checks and route steps through this roadmap's own targets. So no new
ownership question arises. The review's duplication greps (main and 470 open heads) stand.

## Adversarial pass (new and changed statements)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.2 fibre: same image ⇔ `∃ Ω, a, b : k → Ω`, `a^*x ≅ b^*y` | `Spec ℚ(i)`, `x = id`, `y = σ`; `Spec 𝔽₄`, `id` vs Frobenius `F`; `Spec ℂ`, `id` vs conjugation; `B(ℤ/2)_ℝ` trivial vs `Spec ℂ`; `x = y`; `𝒳 = ∅` | `(σ, id)`: `σ∘id = σ = id∘σ`, while one `ι` gives `ι(i)` vs `−ι(i)`, `2ι(i) ≠ 0`; `(F, id)` works, one `ι` gives `ι(ω)` vs `ι(ω)² ≠ ι(ω)` (`ω ∉ 𝔽₂`), so char 2 also needs two embeddings; same over `ℂ`; `a = b = (ℝ ⊂ ℂ)` trivialises both torsors (one extension suffices here); `a = b = id`; vacuous | holds; one-extension version false | bullet restated, Check added |
| 1.1 Check: finite type is a property of the point | `Spec ℚ` with `id` and `Spec ℚ̄`; `Spec 𝔽_p` with `Spec 𝔽̄_p`; "every representative" variant on any `Spec k → 𝒳` | `id` is of finite type; `ℚ̄` f.g. ⇒ finite (Zariski), but `[ℚ̄:ℚ] = ∞`; `[𝔽̄_p:𝔽_p] = ∞`; `Spec k(t) → 𝒳` lft ⇒ `Spec k(t) → Spec k` lft (Lemma 101.17.8) ⇒ `k(t)` f.g. over `k`, false; so the variant has no finite type points, contradicting 1.1's density bullet | holds | bullet → Check |
| 5.2 step 1: `𝒳'` decent / locally Noetherian / quasi-compact inertia | `[𝔸¹/𝔾_m]` at `0`; at `1`; `Spec ℚ(t)/ℤ`; `[Spec k[ε]/𝔾_m]` at its point | `𝒳' = B𝔾_m`, affine diagonal, Noetherian atlas `Spec k`, inertia with fibre `𝔾_m` over `Spec k → B𝔾_m`, affine hence quasi-compact; `𝒳' = 𝒳`; `𝒳' = 𝒳`, locally Noetherian, not decent; `𝒳' = B𝔾_m` (the reduction, 0.5 Check), and `f` from a reduced `𝒴` factors through it, while `Spec k[ε] → 𝒳` does not | holds | route made explicit |
| 5.2 step 2: `x ∈ |𝒰|`, `𝒰` keeps the hypotheses | `[𝔸¹/𝔾_m]` at `1`; `Bμ_p/𝔽_p`; `[Spec k[x₀, x₁, …]/𝔾_m]` at its generic point | dense open gerbe `Spec k ∋ 1`; `𝒰 = 𝒳`; the stratum `x₀ ≠ 0` contains the generic point; a nonempty open subset of `{x}‾` contains `x` | holds | — |
| 5.2 step 3: base `U` locally Noetherian by smooth descent along `π` | `Spec ℚ(t)/ℤ` (`π = id`); `B𝔾_m → Spec k`; `Bμ_p → Spec 𝔽_p`; `Bℤ → Spec k` (excluded) | `U = 𝒳`, locally Noetherian through the étale atlas `Spec ℚ(t)`; only Lemma 68.13.9 applies, since `U` is not decent (5.1 Check); `U = Spec k`; `π` is smooth although `μ_p` is not (2.3 Check), `U = Spec 𝔽_p`; inertia `ℤ` is not quasi-compact, so hypothesis (2) excludes it (Remark 101.51.3) | holds | 0.1, 2.3 in `*Needs:*` |
| 5.2 step 3: factorisation checked on a reduced atlas `V → 𝒴` | `𝒴 = B𝔾_m → [𝔸¹/𝔾_m]` at `0`; `𝒴 = Spec k[ε]` (non-reduced) | `V = Spec k`, `V → U = Spec k` factors through `𝒵_u = Spec k`, hence `𝒴 → 𝒵_u ×_U 𝒰 = B𝔾_m`; `V = Spec k[ε]` is not reduced and Lemma 68.13.9 is not available, matching the `needs_reduced` Check | holds | 0.1, 0.2, 4.2 in `*Needs:*` |
| 4.3: `I_{𝒳'} = I_𝒳 ×_𝒳 𝒳'` quasi-compact | `[𝔸¹/𝔾_m]`, `𝒳' = B𝔾_m`; `Bℤ` | `I_𝒳 ×_𝒳 B𝔾_m` = inertia of `B𝔾_m`, fibre `𝔾_m`, quasi-compact; inertia fibre `ℤ`, not quasi-compact, so the first clause (gerbe) is used instead | holds | 0.2 in `*Needs:*` |
| 5.4: `Δ_{𝒳'}` base change of `Δ_𝒳` | `𝒳 = [𝔸¹/𝔾_m]`, `𝒳' = B𝔾_m`; `𝒳 = 𝔸¹_ℚ/ℤ` (excluded) | `(𝒳'×𝒳') ×_{𝒳×𝒳} 𝒳 = 𝒳' ×_𝒳 𝒳' ≃ 𝒳'` (monomorphism); `Δ_{B𝔾_m}` has fibres `𝔾_m`-torsors, affine; non-quasi-compact diagonal is excluded by hypothesis (5.4 Check) | holds | 0.2 in `*Needs:*` |

Context and generality:
- No statement changed its hypotheses or conclusion except 1.2's API bullet. That bullet is now at
  the generality of stacks-04XE §100.4, for absolute stacks (Convention 1).
- The 5.2 statement is unchanged. Only its route and `*Needs:*` line changed.
- The Checks of 1.2 (`B(ℤ/2)_ℝ`, `𝔸¹_ℝ`, absolute versus relative) and of 5.2 were recomputed against
  the restated bullet and route, and agree.

## For the maintainer

- No id, heading or target was renamed or renumbered. No roadmap cites StackPointsAndResidualGerbes.
- No supplier, gap or merge-order dependency was added. gap:stack-morphism-permanence (on
  SchemeAndStackFoundations §1.20) now also lists 5.2 in `neededBy`. Its contract text is unchanged,
  since base change of quasi-compact morphisms is already in it.
- Nothing cited here is defined only by an open revision.
