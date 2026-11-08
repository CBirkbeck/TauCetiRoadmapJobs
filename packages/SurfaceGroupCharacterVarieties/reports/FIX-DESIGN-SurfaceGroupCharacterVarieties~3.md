# FIX-DESIGN-SurfaceGroupCharacterVarieties~3

Repair of the design of `SurfaceGroupCharacterVarieties` against the review
`REV-DESIGN-SurfaceGroupCharacterVarieties~2` (two findings). Files changed:
`packages/SurfaceGroupCharacterVarieties/design/README.md`,
`packages/SurfaceGroupCharacterVarieties/design/plan.json`. `sources.toml` is unchanged: every
locator used is already recorded.

## F01 (P2) — applied differently

Old (§3.5, plan 3.5): "the action does not lift to `Hom`". That is false for actions on sets. New: the
based `Mod(S*)`-action `ρ ↦ ρ ∘ (f_const)⁻¹` makes `Hom → Rep` equivariant through `Forget`, and it
factors through `Forget` iff every `ρ` has commutative image (MLV §§5.19–5.20). Added a proof
sketch, the `S₃` push Check and the set-lift Check. Dropped the review's "in particular" clause.

Why the review's repair is changed. Its "in particular, no action by precomposition with lifts of
`Ψ_x` exists when `Ψ_x` has no homomorphic lift" is not exact. Lifts `s(f)` act by `ρ ↦ ρ ∘ s(f)⁻¹`
as soon as each `(s(f)s(g))⁻¹ s(fg)` fixes every `ρ`, that is, moves each `γ` only inside
`⋂_ρ ker ρ`. So a family of lifts can act although `s` is not a homomorphism. The
one-directional statement is now an "iff", with `2g − 2 + n > 0` used for `ker Forget = Push(π₁)`.
The source qualifier "naturally" (LandesmanLitt2024 lines 49–50) is now in the locator.

## F02 (P3) — applied

§3.4's sign step now cites MLV §5.5 for `+1`. For `−1` it uses `f = (f∘r)∘r`, with `r` the polygon
reflection `k ↦ 3 − k mod 4g` (TeichmullerGeometry §4.3), which acts by `−1` on cellular `H₂`
(AlgebraicTopology Stage 4 items 2–3). §3.4's *Needs:* gains MLV §§5.5, 5.19; §3.2's gains §5.19.
The contracts, plan 3.4 and the suppliers list match.

Evidence for the edit. MLV §5.1 (at the head of its pull request) defines orientation as atlas data
and makes homology a consequence; it says nothing about `H₂`. MLV §5.5 introduces `[S]` and proves
that the intersection form is invariant under orientation-preserving homeomorphisms "by naturality
of cap products". It does not state `f_*[S] = [S]` as a separate claim, so the MLV contract now
records that fact under "Assumed:". The cellular step had no supplier, so AlgebraicTopology Stage 4
items 2–3 (on main) were added.

## Checks run

Dependency gate, verbatim:

```text
candidate: SurfaceGroupCharacterVarieties is not in the merge order yet; checked as if placed after TeichmullerGeometry (the intake inserts it when its design is accepted)
depcheck: 231 roadmaps, 2351 edges, 0 problem(s)
```

The gate printed no UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the README found no
cross-roadmap citation and no Lean name missing everywhere.

The design stage has no `Suggested.lean`, so no `#check` scratch file was elaborated and no Lean name
changed. `plan.json` still parses as JSON and keeps its original layout, with no trailing newline.
Style grep: no LaTeX delimiters, machine paths or process words in the README. Touched lines stay
within the house width.

## Adversarial pass (changed or added statements)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §3.5 non-descent, "if" direction (nonabelian image ⇒ no factoring) | `(0,3)`, `F₂ = ⟨a,b⟩`, `H = S₃`, `ρ(a) = (1 2)`, `ρ(b) = (2 3)`, `α = a`; `(1,1)` with the handle basis | `Push(a)·ρ(b) = ρ(a)⁻¹ρ(b)ρ(a) = (1 2)(2 3)(1 2) = (1 3) ≠ (2 3)`; on `(1,1)`, `π₁ = F₂` (`χ = −1`), same values | `Push(a) ∈ ker Forget` (MLV §5.19) moves `ρ` | stated; Check added |
| §3.5 non-descent, "only if" direction | `H = ℤ/3`; `H = 1`; any `ρ` with commutative image | `MulAut.conj(ρ[α])⁻¹ ∘ ρ = ρ` because `ρ[α]` centralizes `ρ(π₁)`; `Hom(F₂, 1)` is one point | `ker Forget = Push(π₁)` for `χ < 0` (MLV §5.20) acts trivially, and `Forget` is onto, so the action factors | stated with `2g − 2 + n > 0` |
| hypothesis `2g − 2 + n > 0` | `(0,0)`, `(0,1)`, `(0,2)`, `(1,0)` | `π₁ = 1, 1, ℤ, ℤ²`, all abelian; `χ = 2, 1, 0, 0` | the "if" direction is vacuous there; the "only if" direction needs MLV §5.20, which assumes `χ < 0` | hypothesis kept |
| §3.5 equivariance and left action | `f, g ∈ Mod(S*)`; `δ = const` | `[f]·([g]·ρ) = ρ∘g_c⁻¹∘f_c⁻¹ = ρ∘(f_c g_c)⁻¹ = ρ∘(fg)_c⁻¹` (§3.1 composition with constant paths); `π([f]·ρ) = [ρ∘f_c⁻¹] = [Forget f]·[ρ]` since `Ψ_x[Forget f] = [f_c]` | left action, equivariant | sketch added |
| §3.5 set-lift Check | `(0,3)`, `H = S₃` | `|Hom(F₂,S₃)| = 36`; `|Rep| = (36 + 3·4 + 2·9)/6 = 66/6 = 11`; fibre over `[ρ∘φ⁻¹]` is `H/Z_H(ρ(Γ))`, the same as over `[ρ]`; transport `m·β_c(x) = β_{mc}(x)` gives `m'·(m·β_c(x)) = β_{m'mc}(x)` | a lift of sets always exists; the old literal claim was false | Check added |
| §3.5 commutative-`H` Check | `H = ℤ/3` on `(0,3)` | `Hom = Rep = (ℤ/3)²`, 9 points; push acts trivially | the based action factors through `Forget` | reworded |
| §3.4 `+1` clause | torus shear `[[1,0],[1,1]]`; genus-two hyperelliptic involution | `det = 1`, `[T²]` fixed; hyperelliptic: `+1` on `H₂`, `−1` on `H₁` | orientation-preserving ⇒ `f_*[Σ] = [Σ]` (MLV §5.5, assumed fact recorded) | citation fixed |
| §3.4 reflection `r : k ↦ 3 − k mod 4g` | `g = 1`; `g = 2` | `g = 1`: pairs `{0,2} ↦ {3,1}`, `{1,3} ↦ {2,0}`; `g = 2`: `{0,2}↦{3,1}`, `{1,3}↦{2,0}`, `{4,6}↦{7,5}`, `{5,7}↦{6,4}`; vertex gluings `v_{4i} ~ v_{4i+3}`, `v_{4i+1} ~ v_{4i+2}` go to `v_{4j+4} ~ v_{4j+1}`, `v_{4j+3} ~ v_{4j+2}` (b-gluings) for `3 − 4i = 4j + 3`; other axes `c ≡ 0, 1, 2 mod 4` break the pairing for `g ≥ 2` | `r` descends to a cellular involution, degree `−1` on the 2-cell, `∂₂ = 0` | named in the sketch |
| §3.4 `−1` clause `f = (f∘r)∘r` | `f = diag(1,−1)` on `T²`; general reversing `f` | `r² = id`; `(f∘r)_* = +1` by index two (§2.1), `r_* = −1`, product `−1`; torus `det diag(1,−1) = −1` | consistent with the torus Check | stated |
| §3.4 inner automorphisms act trivially | `g ≥ 2`, `α` nonseparating; torus | `MulAut.conj[α] = (Push α)_const` (§3.2), `Forget(Push α) = 1` (MLV §5.19); torus: `Push` trivial and `Inn(ℤ²) = 1` | trivial on `H₂` | MLV §5.19 added to *Needs:* |
| §3.4 degenerate `g = 0` | sphere | `H₂(π₁; ℤ) = H₂(1; ℤ) = 0` | the clause stays restricted to `g ≥ 1` | none |
| §3.2 *Needs:* line | point-push Check | the Check states `f_const = MulAut.conj[α]` = MLV §5.19's `γ ↦ α*γ*α⁻¹`; it needs `Push` | README now agrees with `plan.json` | MLV §5.19 added |

## Pattern repairs (other places)

- "lift" across the README: the Scope bullet "the non-lifting theorem (Layer 3)" now names the
  non-descent theorem for `Mod(S*)`. The commutative-`H` Check of §3.5 now says "factors through
  `Forget`". `plan.json` 3.5 has the new statement, hypothesis, locator, prerequisites
  (MLV §§5.19, 5.20), the reworded `abelian_target` test and two new tests.
- The Summary ("compatibly with … the action on conjugacy classes of all representations") claims
  nothing about lifting and is true as written, so it is unchanged. §1.3's non-descent theorem is
  about `MulAut Γ` versus `Out(Γ)`, is exact, and is unchanged. §7.4 cites LandesmanLitt2024
  lines 47–50 only for semisimple classes, which is correct, so it is unchanged too.
- Citations of MLV §5.1: the other uses (Conventions, §2.2 orientation data, Scope) cite §5.1 for
  orientation as data, which is right. Only §3.4 used it for the `H₂` sign.
- Layer 3's *Dependencies* now lists MLV §§5.5 and 5.20, AlgebraicTopology Stage 4 and
  ClassifyingSpaces Stages 3–4. The Scope deferral list now includes MLV §5.5 (fundamental class and
  duality) and AlgebraicTopology Stage 4 (cellular homology).

## Ownership and sources

- The non-descent statement for the based `Mod(S*)`-action has no other owner. A `roadmaps grep` for
  "factors through Forget", "naturally act on the representation variety" and "non-descent" over
  main and the open heads found only unrelated uses (AInfCohomology Nygaard, CMRankZeroConverse).
- Citations resolved this round:
  - MordellLawrenceVenkatesh §§5.1, 5.5, 5.19, 5.20, at the head of its open pull request (a new
    roadmap, earlier in the merge order).
  - TeichmullerGeometry §4.3, at the head of its open pull request: the oriented `4g`-gon with word
    `∏ a_i b_i a_i⁻¹ b_i⁻¹`.
  - AlgebraicTopology Stage 4 items 2–3, on main: naturality of the cellular differential and the
    cellular–singular comparison, with orientation reversal negating the cell generator.
- No citation depends on an open revision.
- Sources: LandesmanLitt2024 lines 41–50 read in the cache. Line 49–50's remark that `Mod_{g,n}` does
  not *naturally* act on the representation variety is the locator now quoted. No fetch was needed,
  and no `needs-references.toml` was written.
- Ownership against the other open pull requests: checked by object through `roadmaps grep` as above.

## For the maintainer

- No Lean name changed, and no id that other roadmaps cite was renumbered.
- This roadmap now consumes AlgebraicTopology Stage 4 items 2–3 and MordellLawrenceVenkatesh §5.5.
  Both are earlier in the order (AlgebraicTopology is on main), and the gate is clean.
- The MordellLawrenceVenkatesh contract records one assumption: an orientation-preserving
  homeomorphism of a closed oriented surface fixes `[S]`. MLV §5.5 relies on this fact without
  stating it separately. MLV could state it explicitly in §5.5.
- Elaboration: not applicable at the design stage (no `Suggested.lean`).
