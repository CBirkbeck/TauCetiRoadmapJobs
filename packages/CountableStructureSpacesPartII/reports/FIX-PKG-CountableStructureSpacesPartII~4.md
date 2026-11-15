# FIX-PKG-CountableStructureSpacesPartII~4

This round repairs the two findings of `REV-PKG-CountableStructureSpacesPartII~3`. Both are P3.
I checked each one against the source text and the README, and applied both as the review asked.

Files changed:
- `packages/CountableStructureSpacesPartII/README.md` (three lines);
- `packages/CountableStructureSpacesPartII/sources.toml` (one locator).

Files unchanged:
- `Suggested.lean`;
- `metadata.toml`;
- `design/plan.json`: no supplier gap is needed, so `gaps = []` stays.

No mathematical statement, hypothesis, Lean name or Check changed.

## REV-PKG-CountableStructureSpacesPartII~3/F01 (P3) — applied

Changed:
- **README 4.1, definition of a Borel S∞-space:** "(becker-kechris-bams lines 126–131)" → "(becker-kechris-bams lines 72–73)".
- **README 4.1, third API bullet:** "(Lusin–Souslin, `MeasurableSet.image_of_measurable_injOn`)" → "(Lusin–Souslin, `MeasurableSet.image_of_measurable_injOn`; becker-kechris-bams lines 126–128)".
- **`sources.toml`, becker-kechris-bams:** "§2: Borel G-spaces and Borel embeddings (lines 126-131)" → "§1: Borel G-spaces (lines 72-78), §2: Borel embeddings and universal spaces (lines 126-131)".

Verification. The finding is right. Read in the cached text:
- **becker-kechris-bams line 71:** the heading of §1.
- **Lines 72–73:** define a Borel G-space as a standard Borel space, a Polish group and a Borel
  action of the group on the space. This matches the README's binders: `StandardBorelSpace X`,
  `MulAction (Equiv.Perm ℕ) X`, and `MeasurableSMul₂`, which says the action is measurable on the
  product.
- **Lines 74–78:** Borel isomorphism of G-spaces and Polish G-spaces.
- **Line 125:** the heading of §2.
- **Lines 126–128:** define a Borel embedding (an equivariant Borel injection) and note that its
  image is invariant Borel. This is exactly the first half of the third API bullet. The second half,
  "a Borel reduction of the orbit relations", is the one-line argument
  `f x = g • f y = f (g • y) ⇒ x = g • y`, and it is not attributed to the source.
- **Lines 129–131:** universality and its uniqueness. These stay in the manifest locator under §2.

Pattern search: I checked every other becker-kechris-bams locator in the README against the text:
- lines 159–164 (Convention 4, and 1.1 at README line 473: the logic action, with `g⁻¹` on tuples);
- lines 172–173 (4.2, the language with one `n`-ary symbol for each `n`);
- line 132 (Theorem 2.1);
- lines 174–177 (Corollary 2.2).

Each one states what it is cited for. `Suggested.lean` cites no line numbers of this source. No
other locator points at the definition of a Borel G-space.

## REV-PKG-CountableStructureSpacesPartII~3/F02 (P3) — applied

Changed: in the README's supplier contract for CountableStructureSpaces, the Layer 6.2 entry now
reads "used in Checks of Layers 0.2, 3.3 and 6.4." It used to read "Layers 3.3 and 6.4".

Verification. The finding is right. The base's well-order class appears in three places:
- the third Check of 0.2: its complement is analytic and not Borel, so it is not set reducible to
  the diagonal;
- the Check of 3.3 (`exists_mem_wellOrderClass_type_eq`);
- the `wellOrderClass lt` Check of 6.4.

The Dependencies of Layer 0 already say "CountableStructureSpaces Layer 6.2 (Checks only)". The
Dependencies of Layer 3 and Layer 6 already name 3.3 and 6.4. Nothing else in the README lists
where the base's Layer 6.2 is used. The Scope (README line 75) names the well-order class without
naming the layers that use it, and needed no change.

## Adversarial pass on the touched passages

Only locators and one contract line changed. No statement changed. The pass covers the
mathematics that the changed lines cite or describe.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 4.1 definition of a Borel S∞-space vs. becker-kechris-bams lines 72–73 | `X = ℕ` with `Equiv.Perm.applyMulAction`; `X` standard Borel with the trivial action; a coding space with uncountably many unary symbols | `ℕ` is standard Borel, and `(g, n) ↦ g n` is measurable on the product, which is countable and discrete in the second factor, so it is a Borel G-space with 1 orbit. The trivial action `(g, x) ↦ x` is the measurable projection, and orbits are singletons. The product σ-algebra on `Bool^I`, `I` uncountable, has no measurable singletons, so it is not standard Borel and is not a Borel G-space in the source's sense either | the definition matches the source and the three existing Checks | locator only |
| 4.1 third API bullet (invariant Borel image, reduction) vs. lines 126–128 | an equivariant measurable injection `f`; `f = id` | Image: `g • f x = f (g • x) ∈ f '' X`, so the image is invariant. Borel: Lusin–Souslin on a standard Borel domain. Reduction: `f x = g • f y = f (g • y)` gives `x = g • y` by injectivity, and the converse holds by equivariance. For `f = id` the image is `X` and the reduction is the identity | the source's line 127 states the image claim; the reduction claim is our own one-liner | locator added |
| 0.2 third Check (base well-order class not set reducible to the diagonal) | `B` the diagonal of Cantor space; `A = (wellOrderClass lt)ᶜ` | `B` is closed in `(ℕ → Bool)²`, so it is measurable. A measurable `f` with `A = f ⁻¹' B` would make `A` measurable ("Borelness pulls back"), so `wellOrderClass lt` would be measurable, contradicting `not_measurableSet_wellOrderClass`. Analyticity of `A` is `analyticSet_compl_wellOrderClass` | Check correct; it uses base Layer 6.2 | contract now lists 0.2 |
| Contract line, base Layer 6.2 | each use in the README | 0.2 (README line 447), 3.3 (README line 860), 6.4 (README lines 1336–1346): three uses, and three layers are now listed | agrees with the Dependencies of Layers 0, 3 and 6 | applied |

## Checks run

- **Elaboration.** I ran `lake env lean packages/CountableStructureSpacesPartII/Suggested.lean`
  from the content checkout. No error. There are 15 warnings, all "declaration uses `sorry`", at
  lines 69, 95, 102, 107, 128, 138, 144, 151, 160, 173, 182, 190, 197, 204 and 217. No `TauCeti.*`
  module needed building.
- **Binders.** I put a `#check @name` for each of the 22 declarations in one scratch file after a
  copy of the file and elaborated it once. All 22 elaborated with no error. Each elaborated type
  matches its README statement and the worker's `signatures.md`; for example,
  `not_borelComplete_of_rank_bounded` carries `[∀ n, Countable (L.Relations n)]` and no
  measurability of `K`. `Suggested.lean` is unchanged this round, so nothing changed here.
- **Dependency direction.** Output of the gate:

  ```
  depcheck: 246 roadmaps, 2242 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line.

## Notes for the maintainer

- No name that another roadmap cites changed. No Lean declaration was added, renamed or deleted.
  No supplier citation changed.
- No new construction was stated, so no ownership question arises this round. The citations of
  CountableStructureSpaces Layer 6.2 and NoncompactQuantumSymmetry Layer 4 are unchanged.
- No source was fetched or added, and `needs-references.toml` was not written. The 11 manifest
  entries stand. Only the becker-kechris-bams locator text was corrected.
- The review's "For the human reviewers" section asks two things: whether to rely on the
  friedman-stanley-1989 and mekler-1981 locators, which were written from memory, and about the
  licence of the Montalbán drafts. Following the brief, I made no change for either.
