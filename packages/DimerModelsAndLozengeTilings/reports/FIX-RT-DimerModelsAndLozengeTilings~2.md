# FIX-RT-DimerModelsAndLozengeTilings~2: repair of red-team round 2 (passes a and b)

Three findings, all P3, all verified against the pinned libraries and the cached sources and all
applied. No finding overlaps another. The files changed are `packages/DimerModelsAndLozengeTilings/README.md`,
`Suggested.lean` and `sources.toml`. `design/plan.json` is unchanged and no gap is declared.

## RT-DimerModelsAndLozengeTilings~2a/F01 (P3) — applied

Verified at the pin: `ErgodicSMul.iff_mem_extremePoints` (`TauCeti/MeasureTheory/Group/ErgodicExtreme.lean:239`)
and `TauCeti.MeasureTheory.ergodicSMul_iff_forall_smul_invariant` (`TauCeti/MeasureTheory/Group/CountableAction.lean:68`).
5.3 route: "face property and `iff_mem_extremePoints`" → names both lemmas and what each gives.
5.3 *Needs:* now also lists `ErgodicSMul.iff_mem_extremePoints`. Layer 5 Dependencies: both lemmas
and `IsExtreme` are now under 5.3. No statement changed.

Same pattern elsewhere (a statement or route names a library declaration that its *Needs:* line
omits), now fixed: 1.5 (`SimpleGraph.Subgraph.IsPerfectMatching`, used in the statement of
`tilingSubgraph_bijOn`), 6.3 (`Set.BijOn`, used in `slopeEdge_ergodicGibbs_equiv`), 8.1 (the
`NeZero` binders of `twistedKasteleyn`; the README calls it a Lean core class because it is
defined in core `Init/Data/NeZero.lean`, not in Mathlib). A script compared every section's prose
with its *Needs:* line in both directions. Nothing else was missing: the other unmatched names were
bound variables, or names given in long form in one place and short form in the other.

## RT-DimerModelsAndLozengeTilings~2b/F01 (P3) — applied

`Suggested.lean`: both Layer 4 face theorems drop `[Finite S]`, `[DiscreteTopology S]`,
`[DiscreteMeasurableSpace S]`; docstrings say "any alphabet". README: 4.6 puts no hypothesis on
`S` and (c) assumes finite discrete `S`; the preamble limits finiteness to 4.4, quasilocality and
4.6(c); the 4.4 bullet says "for every `S`"; the route explains how 4.2 reaches `X`; the summary
drops "finite-alphabet"; two Checks.

Evidence that the general statement is true. The proof of (b) uses `S` only in three places, and
each holds for every `S`. (i) The action is measurable: each coordinate of `γ • ω` is a coordinate
of `ω`. (ii) 4.2, which is already stated for any measurable `S`. It is applied to the push-forward
`ι_*μ` of `μ` to `Ω`. That measure is invariant because `gX = X`. An invariant event `A = X ∩ A'`
of `X` has `ι_*μ(g⁻¹A' Δ A') = μ(g⁻¹A Δ A) = 0`. So `A` is `μ`-a.e. equal to `X ∩ T` for a tail
event `T`, and `X` need not be measurable in `Ω`. (iii) Properness of each kernel, which is a
structure field. The source supports the wider statement: sheffield2005 Lemma 3.2.2 (line 1367) is
stated over the spin spaces `ℝ^m` and `ℤ^m` (lines 256–263). The reviewer cited lines 24–27; the
README cites lines 256–263, where the setting is defined.

The reviewer suggested a separate Check for `S = ℤ`. It is folded into the existing
independent-specification Check instead of being added beside it. The Check on the trivial
σ-algebra on `{0,1}` is new.

## RT-DimerModelsAndLozengeTilings~2b/F02 (P3) — applied

Verified: cohn-kenyon-propp2001 lines 404–423 prove the lattice property for domino height
functions, using the fact that their values are fixed modulo 4. The lozenge statement is in gorin2021
footnote 1 (lines 765–769), which is already cited in 2.8. 2.8 now proves min/max closure in one clause, cites
gorin2021 footnote 1 (Gorin's maximum of `x + y − 3H` is the minimum here) and calls the CKP passage the
domino counterpart. The trailing CKP citation is removed. The CKP entries in References and
`sources.toml` now give lines 404–423 and say "domino".

The suggested repair was applied in substance, with two changes. Its phrase "the same lattice
structure" is replaced, because the domino and lozenge structures are not the same. The lozenge
statement is now cited to the source that contains it, gorin2021 footnote 1.

## Checks run

- **Elaboration**: `lake env lean packages/DimerModelsAndLozengeTilings/Suggested.lean`, run from
  the content checkout. Exit code 0, about 7 s. The output is 18 `declaration uses 'sorry'`
  warnings, one per theorem (lines 113, 166, 182, 196, 232, 243, 323, 334, 371, 402, 414, 436,
  449, 480, 517, 530, 550, 580), with no errors and no other messages. The imported module
  `TauCeti.MeasureTheory.Group.ErgodicExtreme` already had its object file, so nothing had to be
  built first.
- **`#check @` on all 59 declarations**: a scratch copy of the file had `#check @…` appended for
  every `theorem`, `def`, `abbrev` and `structure`. It elaborated with exit code 0, and every type
  was compared with the worker's `signatures.md`. Only two types changed:
  `gibbsInvariant_isExtreme` and `gibbsInvariant_extreme_iff_ergodic`. Each lost exactly
  `[Finite S]`, `[DiscreteTopology S]` and `[DiscreteMeasurableSpace S]` and keeps
  `[TopologicalSpace S] [MeasurableSpace S]`, as README 4.6 now says. The other 57 types are
  unchanged. No section binder was lost: the file has no `variable` line.
- **Dependency check** (the brief's command), full output:
  `depcheck: 235 roadmaps, 2233 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Citation resolver** (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean
  name found nowhere.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `gibbsInvariant_isExtreme`, generalised alphabet | `I = ∅`, `X = ∅`; `I = ∅`, `X` a point; `Γ = I = ℤ`, `S = ℤ`, `X = Ω`, independent specification with `ν{n} = 2^{−n−1}`; `S = {0,1}` with the trivial σ-algebra, `X = {0̄,1̄}`; trivial action of `ℤ` on `{pt}` | `𝔓_inv = ∅ = 𝒢_inv`; `{δ} ⊆ {δ}`; `𝒢_inv = {ν^{⊗ℤ}}` with `ν^{⊗ℤ}{ω(0) = ω(1) = 0} = 1/4`, ergodic, hence extreme, so a one-point face; trace σ-algebra `{∅, X}` (2 sets against 4 Borel sets), `𝔓_inv` a single point; trivial action: `hproper` fails (`{g : pt ∈ F, pt ∈ F'} = ℤ`), and indeed `𝒢_inv = {½δ₀ + ½δ₁}`, the midpoint of the non-Gibbs `δ₀`, `δ₁` | true; properness needed | binders dropped; new Check |
| `gibbsInvariant_extreme_iff_ergodic` | identity specification on `X₀`; `S = ℤ` independent; trivial σ-algebra | `δ_{0̄}` extreme and ergodic; midpoint gives `{1̄}` mass `1/2`, neither; `ν^{⊗ℤ}` both; the one point both (every event `∅` or `X`) | true | binders dropped |
| 4.6 route, 4.2 transported from `Ω` to `X` | `X = {0̄,1̄} ⊆ {0,1}^ℤ`, `A = {1̄} = X ∩ {ω(0) = 1}` | `A' Δ (1·)⁻¹A' = {ω(0) ≠ ω(1)}`, which misses `X`, so it is `ι_*μ`-null; saturation `{ω has a 1}` meets `X` in `{1̄}`; with the trivial σ-algebra `X` is closed but not in `{∅, Ω}`, and the route does not need it to be | sound | route sentence added |
| 4.4 API, `MeasurableConstSMul` for every `S` | `S = ℤ`, `γ = 1` on `I = ℤ` | `{ω : (1•ω)(0) = a} = {ω(−1) = a}`, a cylinder | true | "for every `S`" |
| 4.6(c) scoped to finite discrete `S` | trivial σ-algebra on `{0,1}` | `{1̄}` clopen and not measurable, so `X` is not `OpensMeasurableSpace` and weak closedness has no setting | the hypothesis is needed | hypothesis now stated in (c) |
| 5.3 ergodicity route | `ℤ`, `Γ = 2ℤ` | `δ_even`: extreme in the segment, invariant event "edge `{0,1}` present" has mass `1`; midpoint: mass `1/2`, neither extreme nor ergodic | true | lemmas named |
| 2.8 min/max closure | unit hexagon `T_a`, `T_b` (`H(0) = 0`, `−1`, other values equal); edges `0 → (1,1)` and `(−1,−1) → 0`; Gorin's convention; average | min equals `H_{T_b}`, max equals `H_{T_a}`; increments of the minimum `0 − (−1) = 1` and `−1 − (−1) = 0`, both in `{0,1}`; Gorin heights at `0`: `0` and `3`, maximum `3` is `T_b`, i.e. our minimum; average `−1/2 ∉ ℤ` (the lattice is min/max, not convex) | true | proof clause and correct locators |
| *Needs:* additions (1.5, 6.3, 8.1) | the Lean statements | `{P \| P.IsPerfectMatching}` at `Suggested.lean:114`; `Set.BijOn` at `:437`; `[NeZero n₁] [NeZero n₂]` at `:503`, `:518`; `IsPerfectMatching` at Mathlib `Combinatorics/SimpleGraph/Matching.lean:236`; `NeZero` in core `Init/Data/NeZero.lean:29` | used, now listed | Needs lines |

Recomputed Checks on the changed objects: all 6 Checks of 4.6, 2 of them new or extended (values
above); the 4 Checks of 5.3 (the segment check above; the others do not involve the changed text);
the 3 Checks of 2.8 (unit hexagon values above; the 3-cycle and the torus Check are unaffected).
None is contradicted.

## Notes for the maintainer

- **Statement change**: `gibbsInvariant_isExtreme` and `gibbsInvariant_extreme_iff_ergodic` now
  hold for any alphabet. No name changed. No roadmap on main or in the open pull requests cites
  these names; the previous rounds' greps found no consumer outside this package. Every consumer
  inside this roadmap uses `S = Bool`, which is still covered.
- **Ownership**: no new object or target was added, only the generality of two existing targets.
  Ownership against the open pull requests was not checked again this round. The round 2 reviewers
  checked it against the 2026-11-15 index and found no other owner.
- **Sources**: `sources.toml` locators were refined for sheffield2005 (lines 256–263 added) and
  cohn-kenyon-propp2001 (lines 404–423, "domino"). No new source was fetched, and
  `needs-references.toml` was not written.
- **Not done**: no source text was missing, and nothing was left out.
