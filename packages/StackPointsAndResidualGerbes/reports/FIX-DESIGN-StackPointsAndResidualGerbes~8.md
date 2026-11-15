# FIX-DESIGN-StackPointsAndResidualGerbes~8

Repair of the design `packages/StackPointsAndResidualGerbes` against the four findings of
`REV-DESIGN-StackPointsAndResidualGerbes~7` (all P3). All four were verified against the sources
and the cited roadmaps and are applied. Each repair was also made wherever the same omission
appeared elsewhere in the roadmap (listed under each finding). Files changed:
`design/README.md`, `design/plan.json`, `sources.toml`. No source was fetched: every text needed
was already in the cache, and `needs-references.toml` was not written.

## F01 (P3) — applied

Verified: stacks-06RD lines 4786–4807 (Definition 101.50.1, Lemma 101.50.2 (2)) and
stacks-decent-spaces lines 1094–1096 (Theorem 68.10.2) say what the review says.

Old → new: 5.4 "Algebraicity of points with quasi-compact diagonal" (Rydh only) → "Algebraicity of
points". The new first statement covers a decent `𝒳` with quasi-compact `I_𝒳` and gives an open
`𝒵 ∋ ξ` of the reduced closure, a gerbe over an integral affine `Z`, an immersion, with
`κ(ξ) = K(Z)` and `𝒵_ξ = 𝒵 ×_Z Spec κ(ξ)`. Rydh's statement is kept and is derived from it.

The route is the review's. The input "a decent space has a dense open subscheme" now replaces
gap:quasi-separated-space-schematic-locus (§1.9) by gap:decent-space-schematic-locus (§1.7,
Theorem 68.10.2, with Proposition 66.13.3 as its quasi-separated case). Keeping both would have
been a redundant contract. The quasi-compactness of `𝒵 → 𝒳` under a quasi-compact diagonal was
asserted before and is now argued: `|𝒵 × T| ≅ |Z × T|` (2.5), plus a base change of the diagonal.

Checks: the glued non-quasi-separated scheme of 5.1 at its generic point (only the first
statement applies; for the choice `Z` = one copy, `𝒵 → X` is not quasi-compact). The `𝔸¹_ℚ/ℤ`
Check now explains why decency is needed: its only nonempty open subspace is itself, which is not
a scheme.

Other places changed for the same repair: Summary, Scope, Layer 5 Examples and Dependencies,
References (§§101.50, 68.10), the plan's 5.4 (statement, hypotheses, locator, prerequisites, tests),
the gap list, and the `sources.toml` `cited_for` of stacks-06RD, stacks-decent-spaces and
stacks-properties-spaces (and the stacks-decent-spaces locator).

## F02 (P3) — applied

Verified: 6.1 applies to an arbitrary locally finite type `x`, which needs cancellation and base
change of local finite type (stacks-06RD lines 1527–1528, Lemma 101.17.8; 1481–1483, Lemma
101.17.3). 7.4's `G_x = Stab_G(x)` is 1.3's presentation bullet (Lemma 101.5.7).

Old → new: 6.1 *Needs* gains 1.3 (stabiliser bullet), Mathlib `iff_locallyOfFiniteType` and
gap:stack-morphism-permanence. 7.4 *Needs* gains 1.3, 2.3 (`BG_x → Spec k` smooth) and
gap:stack-morphism-permanence (the route's "W is smooth" step). The gap's `neededBy` gains 6.1 and
7.4.

Same pattern elsewhere, found by a script that compares the target numbers and gap names cited in
each statement and route with that target's *Needs* line:
- 0.1: its "open substacks" API bullet now lists 0.3 and gap:stack-morphism-permanence.
- 5.3: "monomorphism, hence separated (0.2)" now lists 0.2.
- 6.2: the automorphism group in `𝒵_x` is `G_x` because `𝒵_x → 𝒳` is fully faithful, so 0.2 is listed.
- 7.2: the field-extension bullet uses `G_{x'} = G_x ×_k k'`, so 1.3 is listed.
- Layer 6 *Dependencies* "Layers 2–5" → "Layers 0–5" plus the Mathlib lemma.
- Layer 7 *Dependencies* "Layers 0, 1, 2, 4, 6" → "Layers 0–4 and 6" (7.1 already used 3.4).

After the edits the script reports no omissions. README and plan agree on every target's target
and gap prerequisites (38 of 38), and every gap's `neededBy` equals its users.

## F03 (P3) — applied

Verified: `TauCetiRoadmap/EquivariantIntersectionTheory/README.md` on main has no "residual",
"closed point" or `BG_x`; its stabilisers (lines 525, 561) are only in Checks. GroupSchemesOverABase
at its open head never mentions quotient stacks or residual gerbes: its stabilisers are of Weyl
chambers, Galois modules and rational functions (lines 231, 540, 1004, 1114). Neither roadmap names this one.

Old → new: the EquivariantIntersectionTheory/GroupSchemesOverABase bullet and its two plan
`consumers` entries are deleted. MotivicStructuresInModuliOfCurves is narrowed to "stabilisers at
points of its quotient stacks (central `μ₂` stabilisers of its §7.3; quadric stabilisers of §§8.4,
8.6), through 1.3 and 7.4".

Note for the reviewer: the package's `design/README.md` line 737 does say "residual gerbe", but in the
sense of the gerbe left after rigidification, not a residual gerbe at a point. The package
`README.md` has no occurrence. The other consumer lines still resolve: LanglandsParameterStacks
lines 523–524, FunctionFieldArithmeticPartII lines 53 and 7366, and the VirtualFundamentalClasses
board package §1.2.

## F04 (P3) — applied

Verified: `TauCetiRoadmap/SchemeAndStackFoundations/README.md` lines 6658–6661 on main (§4.8)
defines *Scheme.formalCompletion X I* with `toScheme n : V(I^{n+1}) → X`. The open revision of
SchemeAndStackFoundations keeps §4.8 with the same text (its line 5560), so no id is dropped.

Old → new: 0.4's scheme bullet "the closed subscheme of the `(n+1)`-st power ideal" → "the
level-`n` term `toScheme n : V(I^{n+1}) → 𝒳` of SchemeAndStackFoundations §4.8's
*Scheme.formalCompletion*; both indexings start with `V(I)` at `n = 0`". §4.8 is added to 0.4's
*Needs*, the supplier contract, Scope, Layer 0 Dependencies and the plan (prerequisite, a new API
entry `neighbourhood_scheme`, supplier sections).

Same pattern elsewhere: 7.1's scheme bullet (`Spec O_{X,x}/𝔪^{n+1}`, the level-`n` term along the
ideal of `x`) and Convention 6 now cite §4.8 too. §4.8 is added to 7.1's *Needs* and Layer 7
Dependencies.

## Checks run

Dependency check (after the last edit):

    candidate: StackPointsAndResidualGerbes is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
    depcheck: 245 roadmaps, 2230 edges, 0 problem(s)

No UPWARD or CYCLE line. Every new edge points to an earlier target: 0.1 → 0.3, 5.3 → 0.2,
6.1 → 1.3, 6.2 → 0.2, 7.2 → 1.3, 7.4 → 1.3 and 2.3, 5.4 → 0.1, 2.1, 2.3, 2.4 and 3.3. None of
these closes a cycle; 0.3 depends only on 0.2.

Citation resolver: the only lead is "VirtualFundamentalClasses §1.2: no roadmap … on main or in an
open pull request". That is a downstream-consumer citation of the board package
`packages/VirtualFundamentalClasses` (merge order line 408, after this roadmap), not a supplier. No
Lean name was flagged.

Lean: a design has no `Suggested.lean`, so there was nothing to elaborate and no `#check`
comparison to run.

Shape, after the edits: 38 targets, 136 Checks against 136 plan tests, at least three per target,
16 gaps with the same slugs in README and plan, `plan.json` and `sources.toml` parse (25 sources),
and no machine paths or LaTeX.

Ownership: Lemma 101.50.2 ("gerbe over an integral scheme", "integral algebraic stack", 0GWC) and
"decent space has a dense open subscheme" (68.10.2) appear nowhere on main, at any open head or in
any board package. So 5.4 stays here and the schematic locus is a gap on SchemeAndStackFoundations
§1.7, where gap:decent-algebraic-spaces already places decent spaces. Integral algebraic stacks are
not defined here: Definition 101.50.1 is cited only for the hypotheses of the reduced closure, and
integral closed substacks remain VirtualFundamentalClasses' objects.

## Adversarial pass (new or changed statements)

| Statement | Instances | Values on each side | Result / change |
|---|---|---|---|
| 5.4 first statement | `[𝔸¹/𝔾_m]` at `0`, `1` | `𝒳' = B𝔾_m`, gerbe over `Z = Spec k`, `𝒵_0 = B𝔾_m`, `κ = k`; `𝒳' = 𝒳`, dense open gerbe `Spec k = Z`, `𝒵_1 = Spec k` | holds |
| 5.4 first statement | generic point of `𝔸¹_k`; DVR `R` at both points; `Spec k[ε]` | `Z = 𝔸¹` or `D(f)`, `κ = k(t)`; `Z = Spec R/𝔪`, `Z = Spec R` or `Spec K`; the reduced closure is `Spec k` | holds (the reduced closure absorbs nonreducedness) |
| 5.4 first statement | `Bμ_p/𝔽_p`; `[Spec ℂ/(ℤ/4)]/ℝ` | `Z = Spec 𝔽_p`, `𝒵 = Bμ_p`; `Z = Spec ℝ`, `𝒵_ξ = 𝒳`, `κ = ℝ` (agrees with 5.3's Check) | holds |
| 5.4 first statement | glued scheme `X` of 5.1, generic `ξ` | decent, trivial inertia, diagonal not qc; `𝒵 = Z = Spec A`, `𝒵_ξ = Spec k(x₁, …)`; the preimage of the other copy is `⋃ D(xᵢ)`, not qc | holds; new Check (the second statement is silent) |
| 5.4 first statement | `𝔸¹_ℚ/ℤ` | qc inertia, reduced, irreducible, not decent; only `ℤ`-stable opens of `𝔸¹_ℚ` are `∅`, `𝔸¹` (`P(t+n)` has `t^{d−1}`-coefficient `a + dn ≠ a`); no schematic open | conclusion fails: decency needed; Check rewritten |
| 5.4 first statement | `Bℤ` over `k` | not decent (`ℤ_k` not qc), inertia not qc, yet a gerbe over `Spec k` | the hypotheses are sufficient, not necessary |
| 5.4 second statement | `[𝔸¹/𝔾_m]` at `1`; generic point of `𝔸¹` | `Spec k → [𝔸¹/𝔾_m]` pulls back to `D(t) ⊂ T`, qc; `Spec k(t) → 𝔸¹` affine, hence quasi-affine | holds |
| gap:decent-space-schematic-locus | Theorem 68.10.2; Proposition 66.13.3 | read at stacks-decent-spaces lines 1094–1096 and stacks-properties-spaces lines 799–802 | the `needs` sentence is supported |
| 6.1 *Needs* | `B𝔾_m/ℚ`, `x` over `k = ℚ(√2)` | `x` is lft (finite then smooth); `Spec k → 𝒵_x = B𝔾_m` is lft by Lemma 101.17.8; `R_x = 𝔾_m × Spec(k ⊗_ℚ k)`, two components, lft over `k` by Lemma 101.17.3, hence lfp; `G_x = 𝔾_{m,k}` is the diagonal part | each step is a clause of the gap, of 1.3 or of the Mathlib lemma |
| 7.4 *Needs* | `SL₂` on binary quadratics at `uv`, char `≠ 2` | stabiliser = torus (antidiagonal sends `uv ↦ −uv`); `W → B𝔾_m` smooth (base change of the `SL₂`-atlas), `B𝔾_m → Spec k` smooth (2.3); `dim W = 3 − 1 = 2` | holds |
| 7.4 *Needs* | `𝔾_m` on `𝔾_m` by `λ·t = λ^p t`, char `p` | stabiliser `μ_p`; `[V/G] = Bμ_p`; `W = V = 𝔾_m` smooth (`Bμ_p → Spec k` smooth by 2.3); `N_x = 0` | holds; 2.3 is needed even for non-smooth `G_x` |
| 0.1 open-substack bullet | `[𝔸¹/𝔾_m] ⊃ Spec k`; `𝔸² ⊃ V(xy)` | reduced open stays reduced; the regular `𝔸²` has the non-regular closed `V(xy)` | holds only for open, i.e. smooth, maps, as stated |
| 6.2 *Needs* | `B(ℤ/2)_ℝ`; `[Spec ℂ/(ℤ/4)]` over `ℂ` | `Aut_{𝒵_x}(x) = G_x = ℤ/2` in both | holds |
| 7.2 *Needs* | `[𝔸¹/𝔾_m]` at `0`, `k ⊂ k'` | `G_{x'} = 𝔾_{m,k'}`, `N' = N ⊗ k'` of weight one | holds |
| 0.4 scheme bullet | `I = (t) ⊂ k[t]`; `I = 0`; `I = (1)`; `(ε) ⊂ k[ε]` | §4.8 levels `V(t^{n+1})` of lengths `1, 2, 3` = 0.4's lengths; all levels `X`; all `∅` (§4.8's Checks `I = ⊥`, `⊤`); `Spec k`, then `X` for `n ≥ 1` | indexings agree |
| 7.1 scheme bullet | `𝔸²` at the origin, `n = 1` | `V(𝔪²) = Spec k[x, y]/(x, y)²`, length 3 = `Spec O_{X,0}/𝔪²` | holds |
| Consumer list | EquivariantIntersectionTheory (main), GroupSchemesOverABase (head), MotivicStructuresInModuliOfCurves (board) | no residual gerbe or point stabiliser in the first two; `μ₂` stabilisers (§7.3), quadric stabilisers (§§8.4, 8.6) in the third | two entries deleted, one narrowed |

## For the maintainer

- Gap renamed and moved: `gap:quasi-separated-space-schematic-locus` (§1.9) is now
  `gap:decent-space-schematic-locus` (§1.7), still needed by 5.4 only. No other roadmap cites the
  old slug. The SchemeAndStackFoundations supplier sections gain §4.8.
- The consumer list no longer names EquivariantIntersectionTheory or GroupSchemesOverABase.
- No target id, layer or heading that another roadmap could cite was renumbered. 5.4's heading text
  changed, but no roadmap cites it.
- The review's "For the human reviewers" items (alper-moduli and sga3-vi-a licences, and the
  closed-substack text still restated in the VirtualFundamentalClasses package) were left unchanged,
  as the brief requires.
- No fetched or reviewed text contained instructions; nothing suspicious to report.
