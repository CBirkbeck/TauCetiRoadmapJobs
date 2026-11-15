# Repair of StackPointsAndResidualGerbes (design, round 7)

These are the findings of `reports/REV-DESIGN-StackPointsAndResidualGerbes~6.md`: one P1, three P2 and three P3.
Each was checked against the cached sources, the board package of VirtualFundamentalClasses, main
(`1a19c9f`) and the open heads. All seven are correct, and all seven are applied in this package.
Files edited: `packages/StackPointsAndResidualGerbes/design/README.md`,
`packages/StackPointsAndResidualGerbes/design/plan.json` and
`packages/StackPointsAndResidualGerbes/sources.toml`.

## R01 (P1) — applied

Old (6.2 Check and plan test `base_vs_fibre`): "`𝒵_x ×_𝒳 Spec k = Spec k ×_{BG} Spec k = G`".
New: three products for `BG_k` at the trivial torsor: `𝒵_x ×_{Spec k} Spec k ≃ BG`,
`𝒵_x ×_𝒳 Spec k ≃ Spec k` and `Spec k ×_𝒳 Spec k = R_x = G`. The second holds for every
representative, since a monomorphism with a section is an isomorphism. Values are given for `ℤ/2`, `μ_p` and `1`.

Pattern search: every other `×_𝒳`, `×_{BG}` and `×_{𝒵_x}` product was checked. The products in
Convention 5, 0.2, 1.3, 2.2, 3.5, 6.1 and 7.3 are correct, so nothing else changed.

## R02 (P2) — applied

Old (0.4 and the plan API `closedSubstackEquivIdeal`): the all-modules kernel "is a different sheaf,
which is not quasi-coherent". New: by Lemma 96.15.1 (3), stacks-sheaves-on-stacks line 1072, it
"need not be quasi-coherent"; when it is not, it differs from `ℐ_𝒵`. When the unit is split (open
and closed immersions), the two kernels agree. There is a new Check and plan test `split_component`
(`Spec(k × k)`; identity immersion).

## R03 (P2) — applied

Old (5.1 and the plan API `of_representable`): only "representable by algebraic spaces and
quasi-separated". New: "either representable by schemes … or representable by algebraic spaces and
quasi-separated", following stacks-06RD lines 4699–4701. The definition is Algebraic Stacks
§94.6, stacks-algebraic-stacks lines 106–112. *Needs* gains §1.19. There is a new Check and plan test
`nonQuasiSeparatedScheme`: the non-quasi-separated doubled `Spec k[x₁, x₂, …]`, and
`𝔸¹_ℚ/ℤ → Spec ℚ` as the negative control.

The other uses of Lemma 101.48.3 (5.2 step 1 and 5.3) apply it to closed immersions and
monomorphisms. These fall in the second alternative and are unchanged.

## R04 (P3) — applied

Old (0.4 Check): "an indexing by `ℐ^n` would give length `n` and `𝒳^{[0]} = 𝒳`". New: "lengths
`1, 2, 3` … an indexing by `ℐ^n` would give lengths `0, 1, 2`, its zeroth term being
`V(ℐ⁰) = V(O_𝒳) = ∅` rather than `𝒵` (the whole of `𝒳` is `V(0)`)". The plan test `A1_origin`
carries the same control. Convention 6 and 7.1 already say `𝒳^{[0]} = 𝒵`, which is correct.

## R05 (P3) — applied

Old (6.1 *Needs*): "0.2, 3.2, 3.4, 4.1; …". New: the same list followed by "2.4 and 5.3 (for the last API
bullet: Lemma 101.28.10 (3) for the gerbe `𝒵_x → Spec κ(x)` of a decent stack)". The plan's 6.1
prerequisites gain `target:2.4` and `target:5.3`. Both are earlier targets, so no cycle is
created: 5.3 needs only Layers 2–5. Item (3) of the lemma was read at stacks-06QB lines 2779–2782.

## R06 (P3) — applied

Old (gap:algebraic-stacks-satisfy-rs): field change cited to "Artin's Axioms, Section 98.8". New:
the gap cites Lemma 98.7.1 (stacks-artin lines 354–392), Lemma 98.6.1 with Remark 98.6.2 for (S2)
(lines 323–348), and Formal Deformation Theory Lemma 90.29.3 (stacks-formal-defos lines
3512–3528). §98.8 (lines 393–415) is kept for the definition only. Lemma 98.7.1 has no
separability hypothesis, so the contract now asks for finite extensions; 7.3 uses separable ones.
The plan gap, the manifest and the References were updated to match.

## R07 (P2) — applied

Old (Scope): "No other roadmap states any of these objects." New: closed substacks, their
presentation description, their ideals, the reduced induced structure and the reduced-source
factorisation are owned here for every algebraic stack (0.3–0.5). VirtualFundamentalClasses §1.2
consumes them for finite-type DM stacks and owns intersections, integral substacks, components,
dimension and cycles.

Pattern: the VirtualFundamentalClasses consumer line, in the README and in the plan, claimed that it
uses 1.3, 4.2, 4.5 and 5.3. That contradicts its own boundary ("residual gerbes are not used",
packages/VirtualFundamentalClasses/README.md lines 102–105). Both now name 0.3–0.5.

Why this roadmap is the owner: on the board, VirtualFundamentalClasses is at `merge-order/ORDER.txt`
line 408. The gate places this design after AlgebraicModuliForArithmeticGeometry (line 36), so
this roadmap is the earlier one. Its §1.2 is at packages/VirtualFundamentalClasses/README.md line 508
and design/README.md line 372.

Object searches:

- On main, "closed substack" has no hit in any README.
- In the open pull requests, `roadmaps grep` found only users that do not define the notion:
  AlgebraicModuliForArithmeticGeometry §5.4 (schematic images), ModularCurvesPartII,
  LocalGaloisDeformationRings, VirtualFundamentalClass (singular) and others.
- Among the board packages, only VirtualFundamentalClasses defines closed substacks.
- Searches for residual gerbes, decent stacks and monomorphisms of stacks found no second owner.

Ownership against the open pull requests was checked with the `roadmaps grep` tool over their heads.

## Checks

**Dependency gate** (the command of the brief, run after the last edit):

```
candidate: StackPointsAndResidualGerbes is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2230 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

**Citations** (`roadmaps resolve` on the edited README; main `1a19c9f` and 474 open heads):

- Lean names found nowhere: none.
- Cross-roadmap citations found nowhere: one, README line 52, "VirtualFundamentalClasses §1.2".
  This is a consumer citation of a board package that is neither on main nor in an open pull request.
  I verified it against the board copy (§1.2 "Closed substacks and integral substacks", line 508).
  It creates no supplier edge.
- The nine leads the worker listed are supplier-plan names. `roadmaps resolve` no longer reports them.

**Shape** (checked by script):

- 38 subsections against 38 plan targets.
- 135 Checks against 135 plan tests: 133 before, plus one new Check each in 0.4 and 5.1. They are
  equal target by target.
- The README and the plan have the same 16 gap slugs, and each `neededBy` equals the set of its users.
  The seventeenth README slug is FunctionFieldArithmeticPartII's, as before.
- *Needs* lines and plan prerequisites agree. The only reported difference, "8.3" in 7.3, is a false
  positive: it is AlgebraicModuliForArithmeticGeometry §§8.1, 8.3.
- No LaTeX, process words or machine paths. No added line exceeds 102 characters.

**Lean.** This design package has no `Suggested.lean`, so there was no `#check` binder comparison.
The brief names no Lean command, and nothing was elaborated.

**Sources.**

- No new fetch was needed. All texts used are in the manifest, which still has 25 entries.
- Manifest changes: locators for `stacks-artin` and `stacks-formal-defos`, `stacks-algebraic-stacks`
  extended to Section 94.6, and `cited_for` of `stacks-sheaves-on-stacks` extended to Lemma 96.15.1 (3).
- The References section now lists all seven chapters added in round 6.
- No `needs-references.toml` was written.

## Adversarial pass (every statement added or changed)

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| 6.2 Check, three products (R01) | `BG_k`, trivial torsor, `G = ℤ/2` over `k = k̄`; `G = μ_p`, char `p`; `G = 1`; `𝒳 = Spec ℝ`, `x : Spec ℂ → Spec ℝ` | `ℤ/2`: `BG` (1 point, automorphism group of order 2), `Spec k` (1 point), `G` (2 points). `μ_p`: `R_x = Spec k[u]/(u^p)`, 1 point of length `p`. `G = 1`: all `Spec k`. `Spec ℝ`: `𝒵_x = Spec ℝ`, `𝒵_x ×_𝒳 Spec ℂ = Spec ℂ`, `R_x = Spec(ℂ ⊗_ℝ ℂ)` (2 points), `𝒵_x ×_ℝ ℂ = Spec ℂ = B1` | holds; the general claim follows from a monomorphism `m` with section `s`: `m∘(s∘m) = m`, so `s∘m = id` |
| 0.4 kernel warning (R02) | origin of `𝔸¹_k`; first component of `Spec(k × k)`; identity immersion | Origin: kernel among all modules `(t)` over `𝔸¹` and `0` over `Spec k`. The `QCoh` value there is `(t) ⊗ k = k·t → k`, the zero map, so not injective. Component: over `T = T₁ ⊔ T₂` the kernel is `O(T₂) = (0 × k) ⊗ O(T)`, quasi-coherent, and the kernels agree. Identity: both `0` | holds; the "never quasi-coherent" wording is replaced |
| 0.4 "differs ⇔ not injective on some test scheme" | affine `T → 𝒳` | The kernel among all modules on `T` is the ideal of `T ×_𝒳 𝒵`. By 0.4's base change this is the image of `x^*ℐ → O_T`. So `ℐ(T) → K(T)` is onto, and it is bijective on every affine `T` iff `ℐ → O_𝒳` is injective there | holds |
| 0.4 Check, indexing (R04) | `ℐ = (t) ⊂ k[t]`, `n = 0, 1, 2` | `V(ℐ^{n+1})`: lengths 1, 2, 3. `V(ℐ^n)`: lengths 0, 1, 2, with `V(ℐ⁰) = V(k[t]) = ∅`; `V(0) = 𝔸¹` | holds |
| 5.1 scheme-representable alternative (R03) | `X` = two copies of `Spec k[x₁, x₂, …]` glued along `U = ⋃D(xᵢ)`; `X × BG_k → BG_k`; `𝔸¹_ℚ/ℤ → Spec ℚ`; empty source; immersion | `U` is not quasi-compact: the prime `(x₁, …, xₙ)` lies in `U` and outside `D(x₁) ∪ … ∪ D(xₙ)`. `X →` Spec k is representable by schemes and not quasi-separated. Pulling back the diagonal of `X × BG_k → BG_k` along `Spec k → BG_k` gives `Δ_X`, which is not quasi-compact. The first alternative gives `X × BG_k` decent. For `𝔸¹_ℚ/ℤ`, the diagonal pullback is `⊔_ℤ 𝔸¹_ℚ`, which is not quasi-compact. Its fibre is not a scheme, the target is decent and the source is not, so neither alternative can be dropped. The empty stack is decent. An immersion is a monomorphism, hence separated, so it falls in the second alternative | holds; Check added |
| 6.1 `R_x → Spec(k ⊗_{κ(x)} k)` with new Needs (R05) | `Spec ℝ` at `ℂ`; `BG_k`; `[Spec ℂ/(ℤ/4)]` over `ℝ` at `ℂ` | Identity of `Spec(ℂ ⊗_ℝ ℂ)` (2 points). `G → Spec k`, flat lfp and surjective. `R_x = ℤ/4 × Spec ℂ` (4 points) `→ ℤ/2 × Spec ℂ` (2 points) is finite étale with fibres of size `2 = |G_x|` | holds; needs 2.4 (Lemma 101.28.10 (3)) and 5.3 (`κ(x)`, gerbe); no cycle |
| RS gap, field change (R06) | `𝔸¹_k` at 0 with `l/k` quadratic separable; `k = 𝔽_p(s)`, `l = k(s^{1/p})`; `Bμ_p` and `B𝔾_m` | `𝔸¹`: `T_k ⊗ l = l = T_l` (dimension 1 both ways), also for the inseparable `l`. `Bμ_p`: `T = k`, base change `l`. `B𝔾_m`: `T = 0` on both sides. Lemma 98.7.1 assumes only `l/k` finite; Lemma 90.29.3 needs (S2), which Remark 98.6.2 gives under (RS) | holds for finite extensions; the contract is widened to the source's generality |
| Scope boundary (R07) | `B(ℤ/2)`; `[𝔸¹/μ₂]`, char ≠ 2; `[V(x² − 1)/μ₂]` | `|B(ℤ/2)|` is one point, and the only nonempty closed substack is `B(ℤ/2)` (0.5: full support on a reduced stack). `[V(t²)/μ₂]_red = [V(t)/μ₂] = Bμ₂`. `V(x² − 1) = {±1}` is one free `μ₂`-orbit, giving `Spec k`, the residual gerbe at that point (trivial stabiliser); `Bμ₂` at 0 | same objects as VirtualFundamentalClasses §1.2; the ownership boundary is stated |
| Zero-dimensional integral substacks are residual gerbes (consumer line) | DM stack of finite type over `k` | An étale atlas of a zero-dimensional `𝒱` is a zero-dimensional scheme locally of finite type, so `|𝒱|` is discrete; irreducible implies one point. `𝒱` is then reduced, locally Noetherian and one-point with a closed immersion, which is the residual gerbe by 3.3 uniqueness | holds |

## For the maintainer

- **VirtualFundamentalClasses** (board package):
  - Its §1.2 still restates closed substacks, the presentation correspondence, the reduced induced
    substack and the reduced-source factorisation.
  - Its worker must replace these by a citation of StackPointsAndResidualGerbes §§0.3–0.5 and keep
    its integral substacks, intersections and unions, components and cycles.
  - It sits later in the merge order (line 408), so it can consume this roadmap.
  - No edit of this package can make that change.
- **This roadmap's consumer line for VirtualFundamentalClasses** now names 0.3–0.5. It no longer
  names 1.3, 4.2, 4.5 and 5.3, which that roadmap explicitly does not use.
- **Section ids and names.** No section id, target number or proposed name changed, so no other
  roadmap's citation breaks.
- **Untrusted text.** No suspicious instruction was found in the review, the sources or the other
  packages read.
