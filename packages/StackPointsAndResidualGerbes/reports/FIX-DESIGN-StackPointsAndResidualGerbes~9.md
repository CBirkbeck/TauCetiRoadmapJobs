# FIX-DESIGN-StackPointsAndResidualGerbes~9

Repair of the design `packages/StackPointsAndResidualGerbes` against the four findings of
`REV-DESIGN-StackPointsAndResidualGerbes~8` (all P3). All four were checked against the sources,
SchemeAndStackFoundations on main and the pinned Mathlib. All four are right, and all four are
applied. Each repair was also made wherever the same defect appeared elsewhere in the roadmap
(listed under each finding). Files changed: `design/README.md`, `design/plan.json`, `sources.toml`.
No source was fetched: every text needed was already in the cache, and `needs-references.toml` was
not written. The design has no `Suggested.lean`, so nothing was elaborated and there was no
`#check` comparison.

## F01 (P3) — applied

Verified: the route of 4.4 (README §4.4) concludes that the projections of `R' = u ×_𝒳 u` are
locally of finite presentation. It gets this from local finite type over the field `κ(u)`, which
is the Mathlib lemma `AlgebraicGeometry.LocallyOfFinitePresentation.iff_locallyOfFiniteType`
(`Mathlib/AlgebraicGeometry/Noetherian.lean:271`, `[IsLocallyNoetherian Y]`) combined with §1.8's
square-independence. The route also concludes "`[u/R']` is the residual gerbe", which goes through
0.2's equivalence (a fully faithful morphism is a monomorphism) and 3.4. The source does the same
(stacks-06RD lines 3120–3129).

Old → new: 4.4 *Needs* "0.3, 3.3, 3.4; §1.20, §1.21; gaps" → "0.2 (fully faithful ⇒
monomorphism), 0.3, 3.3, 3.4; §1.20, §1.21, §1.8; Mathlib `iff_locallyOfFiniteType`,
`IdealSheafData.vanishingIdeal` (reduced closure of `u`); gaps". The contract sentence now reads
"the case used in 3.2, 4.1, 4.2, 4.4 and 6.1". The plan's prerequisites of 4.4 are updated to match.

Same pattern elsewhere:
- 4.1's route also says "maps fully faithfully to `𝒳`, and is the residual gerbe by 3.4" without
  listing 0.2. 0.2 is now in 4.1's *Needs* and in its plan prerequisites.
- 4.4's route uses "the reduced closure of `u`" in the scheme `U`, which is Mathlib's
  `vanishingIdeal`. It is now in 4.4's *Needs* and in Layer 4's Dependencies.
- The other routes that pass through a fully faithful functor (2.2, 3.5, 6.2) were also checked.
  2.2 concludes an equivalence (fully faithful and essentially surjective), 3.5 uses the quotient
  descriptions of 3.2, and 6.2 already lists 0.2. None needs the monomorphism step.

The added edges 4.4 → 0.2 and 4.1 → 0.2 point to an earlier layer, so they create no cycle.

## F02 (P3) — applied

Verified: the targets named in the *Needs* lines of 7.1–7.4, minus Layer 7's own (the "8.3" is
AlgebraicModuliForArithmeticGeometry §8.3), are exactly `{0.3, 0.4, 1.3, 2.2, 2.3, 3.4, 4.5, 6.4}`.
Layer 7's Dependencies read "Layers 0–4 and 6".

Old → new: "Layer 7 uses Layers 0, 4 and 6 … Layers 4 and 5 both use 3; … Layer 7 uses 0.4, 4.5 and
6.4" → "Layer 7 uses Layers 0–4 and 6 … Layer 4 uses 3; Layer 5 uses 3 and 4; … Layer 7 uses 0.3,
0.4, 1.3, 2.2, 2.3, 3.4, 4.5 and 6.4".

Same pattern: the paragraph's "Layers 4 and 5 both use 3" hid Layer 5's use of Layer 4 (5.2 needs
4.2, 4.3 and 4.4; 5.3 needs 4.1, 4.3 and 4.4; Layer 5's Dependencies say "Layers 0–4"). It now says
so. "Layer 6 uses 4 and 5" holds (6.1 → 4.1, 6.4 → 4.1 and 4.5, Layer 6 → 5.3).

## F03 (P3) — applied

Verified: stacks-morphisms-spaces lines 904–905 is Lemma 67.10.8 (tag 06MG). The old sketch took
"an étale atlas `W → T` with `W` a nonempty affine scheme". Only a quasi-compact `T` has such an
atlas, and quasi-compactness is not known before the conclusion.

Old → new: the locator "Morphisms of Spaces, Lemma 67.10.8, used at stacks-06ML line 1204" →
"stacks-morphisms-spaces lines 904–905, Lemma 67.10.8". The new sketch takes a nonempty affine open
`V` of an étale cover of `T`, with open image `T'`. It deduces `T' ≅ Spec k`. Then `T → Spec k` is a
monomorphism with the section `Spec k ≅ T' ⊆ T`, so it is an isomorphism.

The new route was checked step by step:
- `V ×_{T'} V = V ×_T V`, because `T' → T` is a monomorphism.
- That relation equals `V ×_k V`, because the diagonal `T → T ×_k T` of a monomorphism is an
  isomorphism.
- `pr₁ : V ×_k V → V` is étale, as a base change of `V → T`.
- Mathlib's instance `DescendsAlong @Etale (@Surjective ⊓ @Flat ⊓ @QuasiCompact)`
  (`Mathlib/AlgebraicGeometry/Morphisms/LocalFlatDescent.lean:48`) then makes `V → Spec k` étale.
  Here `V → Spec k` is flat because `k` is a field, surjective because `V ≠ ∅`, and quasi-compact
  because `V` is affine.
- `V` is then an étale atlas of both `T'` and `Spec k` with the same relation, so `T' ≅ Spec k`.
- A monomorphism `f` with `f ∘ s = id` satisfies `f ∘ (s ∘ f) = f ∘ id`, so `s ∘ f = id`.

The route's inputs are now listed in 0.2's *Needs*: §1.7 (`points_atlas_surjective`, `opensEquiv`),
§1.8 (`spacePresentation`), and the Mathlib instance. The instance is also in the Mathlib contract
and in Layer 0's Dependencies. The plan's prerequisites of 0.2 gained §1.7 and
`CategoryTheory.MorphismProperty.DescendsAlong`, and its locator gained the direct line numbers.
In the rigidity sketch, the old `W` is renamed `V`, because 0.2's equivalence criterion already
uses `W` for an algebraic space over `𝒴`.

Same pattern (an indirect locator): gap:generic-flatness-spaces cited Proposition 67.32.1 and
Proposition 29.28.2 without lines. It now cites stacks-morphisms-spaces lines 3050–3057 and
stacks-morphisms-schemes lines 2319–2326. The source states "of finite type", which is the gap's
"quasi-compact, locally of finite type". This is updated in the README, the plan gap `detail`,
`sources.toml` (locator and `cited_for` of `stacks-morphisms-schemes`; locator of
`stacks-morphisms-spaces`) and the README's References.

## F04 (P3) — applied

Verified: stacks-06QB lines 2699–2701 share the README's 17-word clause list, in the same order.

Old → new: "`𝒳 → 𝒴` is a gerbe iff there are an algebraic space `U`, a group algebraic space `G` flat and
… `U → 𝒴` with `𝒳 ×_𝒴 U ≅ [U/G]`" → "`𝒳 → 𝒴` is a gerbe iff it becomes a classifying stack
fppf-locally on `𝒴`: for some surjective, flat, locally finitely presented `U → 𝒴` from an algebraic
space, `𝒳 ×_𝒴 U ≅ [U/G]` over `U` with `G` a flat, locally finitely presented group algebraic space
over `U`". The statement is unchanged.

Same pattern: a shared-run scan of the README against all cached source texts found two more long
runs.
- The opening of 0.1 shared 12 words with stacks-04XE lines 651–652. It is now "Fix a smooth-local
  property `P` of schemes (one that is local in the smooth topology)".
- gap:decent-space-schematic-locus shared 15 words with stacks-decent-spaces lines 1069–1070. In
  the README and in the plan gap's `needs` it now reads "every decent algebraic space contains a
  dense open subspace representable by a scheme".

The runs that remain (at most 12 tokens, counted across math symbols) are standard phrases ("the
following are equivalent", "surjective, flat and locally of finite presentation") and hypothesis
lists in standard names.

## Checks run

Dependency check (`gate --candidate … --only StackPointsAndResidualGerbes`), after all edits:

    candidate: StackPointsAndResidualGerbes is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
    depcheck: 245 roadmaps, 2232 edges, 0 problem(s)

There is no UPWARD or CYCLE line. The edge count rose from 2230 to 2232 because of the new Mathlib
and §1.7 prerequisites.

Citation resolver (`roadmaps resolve`) on the edited README: the only cross-roadmap citation it
cannot find is "VirtualFundamentalClasses §1.2". That is a consumer line naming a board package
with no open pull request, as before. It reports no Lean name found nowhere. The new names
`points_atlas_surjective` and `spacePresentation` are in SchemeAndStackFoundations §1.7 and §1.8
on main. `CategoryTheory.MorphismProperty.DescendsAlong` is at
`Mathlib/CategoryTheory/MorphismProperty/Descent.lean:32`, and its étale instance at
`Mathlib/AlgebraicGeometry/Morphisms/LocalFlatDescent.lean:48` (pin `1b1ccf4b`).

Other checks:
- `plan.json` parses and round-trips in its own format.
- `sources.toml` parses, with 25 entries.
- The edited files contain no machine path.
- The Check count is unchanged (no Check was added or removed).

Ownership: this round adds no target, construction or gap. The new inputs are a Mathlib instance
and two SchemeAndStackFoundations names, all cited from their owners. So no new ownership search
was needed, and none was run against the open pull requests. `overlaps.md` reports no shared
roadmap, no dropped id and no second copy.

## Adversarial pass (new or changed statements)

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 0.2 rigidity, new sketch | `T = Spec k`; `T = Spec k ⊔ Spec k`; `Spec k → Spec k[ε]`; `T` not quasi-compact; `T = ∅` | `V = Spec k`, `V ×_k V = Spec k`, `T' = T`; `T ×_k T` has 4 points ≠ 2, so not a monomorphism and excluded; `V = Spec k → Spec k[ε]` is not flat, so descent does not apply and the monomorphism is not an isomorphism (the 0.2 Check); one affine open `V` suffices and `T = T'` follows from the section; `V` cannot be chosen, and the hypothesis "nonempty" excludes it | holds; uses the field and nonemptiness exactly where stated | sketch and *Needs* rewritten |
| 0.2 "monomorphism with a section is an isomorphism" | `f ∘ s = id` | `f ∘ (s ∘ f) = f = f ∘ id`, mono gives `s ∘ f = id` | holds | — |
| 4.4 route inputs | `X₀ = Spec ℚ(t)/ℤ`; DVR `Spec R` at the generic point; `[𝔸¹/𝔾_m]` at `1` | `u = U = Spec ℚ(t)`, `E = {u}`, `R' = ⊔_ℤ Spec ℚ(t)` with projections isomorphisms on components (lft and not quasi-compact over the field, so lfp by the Mathlib lemma), `[u/R'] = X₀`, the identity is fully faithful and hence a monomorphism; `U = Spec R`, `u = Spec K`, closure `Spec R` meets `E = {η}` in `η`, `R' = Spec K`; `u = {1}`, `R' = Spec k`, `[u/R'] = Spec k` open | holds | *Needs* completed |
| 4.1 route inputs | `[𝔸¹/𝔾_m]` at `1`; `Spec ℤ_(p)` at `η` | `u ×_𝒳 u = Spec k`, `[u/Spec k] = Spec k`, fully faithful and a monomorphism (0.2), equal to `𝒵_1`; `u = Spec ℚ`, `R = Spec ℚ`, `𝒵 = Spec ℚ` | holds | 0.2 added to *Needs* |
| 2.3 reworded criterion | `Bμ_p → Spec 𝔽_p`; `Spec k → B𝔾_m`; `[Spec ℂ/(ℤ/4)] → Spec ℝ`; empty stack | `U = Spec 𝔽_p`, `G = μ_p` (flat, finitely presented), the base change is `Bμ_p`; every base change is a `𝔾_m`-torsor `P → U`, which has trivial inertia, so `P ≅ [U/G]` forces `G = 1` and `P ≅ U`, false, so this is not a gerbe; along `Spec ℂ → Spec ℝ` the base change is `B(ℤ/2)_ℂ`, which is a gerbe although there is no real point; over `∅` both sides hold | holds in both directions; "fppf-locally" is needed (ℝ-case) | wording only |
| 0.1 reworded opening | reduced, regular, locally Noetherian | the same three properties are smooth local (Remark 100.7.3) | unchanged | wording only |
| gap:decent-space-schematic-locus reworded | `𝔸¹_ℚ/ℤ` (not decent); a quasi-separated space | the only nonempty open is the space itself, which is not a scheme, so decency is needed; Proposition 66.13.3 is the special case | unchanged | wording only |
| gap:generic-flatness-spaces locator | Proposition 67.32.1 hypotheses | `Y` reduced, `f` of finite type, which is the gap's "quasi-compact, locally of finite type over a reduced base" | agrees | lines added |
| Build paragraph | the *Needs* lines of Layers 4–7 | Layer 7: `{0.3, 0.4, 1.3, 2.2, 2.3, 3.4, 4.5, 6.4}`; Layer 5 → 4.1–4.4; Layer 6 → 4.1, 4.5 and 5.3 | agrees with each Dependencies line | rewritten |

## For the maintainer

- No name that another roadmap cites changed. No target, gap slug or section number was added,
  removed or renumbered.
- The new dependency edges all point to earlier targets or to suppliers already named: 4.4 → 0.2,
  4.1 → 0.2, 0.2 → SchemeAndStackFoundations §1.7, and Mathlib `DescendsAlong` and `vanishingIdeal`.
- The three human questions of the review (the `alper-moduli` and `sga3-vi-a` licences, and
  VirtualFundamentalClasses' own closed-substack text) were left as they are, as the brief says.
- No untrusted text contained instructions.
