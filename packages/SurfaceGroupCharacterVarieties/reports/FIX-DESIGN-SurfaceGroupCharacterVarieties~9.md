# FIX-DESIGN-SurfaceGroupCharacterVarieties~9

This round settles the findings of REV-DESIGN-SurfaceGroupCharacterVarieties~8: two findings, both
P3. Both were verified and applied. Files changed:
`packages/SurfaceGroupCharacterVarieties/design/README.md` and
`packages/SurfaceGroupCharacterVarieties/design/plan.json`. `sources.toml` is unchanged, since no new
source is cited.

## F01 (P3) — applied

What changed:
- **§7.2 second Check and §7.5 third Check.** Added "NonabelianLevelStructures §5.1, which proves
  the isomorphism over every commutative ring".
- **§7.5 Check, extended.** It now shows `Out(F₂)` acting (NonabelianLevelStructures §5.2), with the
  Vieta move, the trivially acting class of `(a, b) ↦ (a⁻¹, b⁻¹)` and a computed witness. Its
  *Needs:* gains NonabelianLevelStructures §5.1 and §5.2 and the Tau Ceti identity.
- **Layer 7 Examples.** "`Out(F₂) ≅ GL₂(ℤ)` acting" → "`Out(F₂)` acting (§5.2) … (the Fricke
  identity, Tau Ceti `Matrix.SpecialLinearGroup.trace_commutatorElement_fin_two`)".
- **Elsewhere.** Added the Scope sentence, a contract subsection *From
  TauCetiRoadmap.NonabelianLevelStructures*, the Tau Ceti item, the Layer 7 Dependencies and the
  `plan.json` entry (7.5 prerequisites and `suppliers`).

Verification:
- **NonabelianLevelStructures at its open head** (a new roadmap folder; in the merge order right
  after MappingClassGroupsAndCanonicalRepresentations).
  - §5.1 (`integral_trace_coordinates`): `R[x, y, z] ≅ O(SL₂ × SL₂)^(GL₂)` through
    `(tr A, tr B, tr AB)` for every commutative ring `R`, compatibly with base change.
  - §5.2: precomposition by `Aut(F₂)` gives polynomial automorphisms of `𝔸³_R`. The moves of
    `r, s, t` are `(x, y, xy − z)`, `(y, x, z)` and `(x, z, y)`. The class γ₋ᵢ of
    `(a, b) ↦ (a⁻¹, b⁻¹)` acts trivially.
  - It does not cite this roadmap, so the new edge makes no cycle.
- **Tau Ceti at the pin** (`2fd255d…`, the rev in `lake-manifest.json`):
  `Matrix.SpecialLinearGroup.trace_commutatorElement_fin_two`, in
  `TauCeti/LinearAlgebra/Matrix/Trace/FinTwo.lean` line 231, inside `namespace Matrix`. It states
  `tr ⁅A, B⁆ = tr A² + tr B² + tr(AB)² − tr A·tr B·tr(AB) − 2` over any `CommRing`, with
  `⁅A, B⁆ = A B A⁻¹ B⁻¹`.

Where I departed from the suggested repair, and why:
1. **The scope sentence's justification is made precise.** It now reads: "the coaction invariants of
   `SL₂` and of `GL₂` agree, both conjugation actions factoring through the faithfully flat quotient
   maps onto `PGL₂`". Proof: let `π : SL₂ → PGL₂` (or `GL₂ → PGL₂`) be the quotient map. The
   coaction is `(π^* ⊗ id) ∘ ρ_PGL`. Over a field `π^*` is injective, being faithfully flat, and so
   is `π^* ⊗ id`. So `ρ(f) = f ⊗ 1` holds exactly when `ρ_PGL(f) = f ⊗ 1`.
   - Negative control: for left multiplication on `M₂`, `det` is `SL₂`-invariant and not
     `GL₂`-invariant. The factorization through `PGL₂` is what matters, and conjugation has it.
2. **"`Out(F₂) ≅ GL₂(ℤ)`" was dropped from the Layer 7 Example.** That isomorphism (Nielsen) has no
   owner on main or at any open head. NonabelianLevelStructures itself requests it from
   MappingClassGroupsAndCanonicalRepresentations as a supplier gap. The example does not need it.
3. **§5.2 is not listed in §7.5's *Needs:* without a use.** The reviewer asked for it there, but
   §7.5 did not use it. The §7.5 Check now uses §5.2, so every contract item sits in some *Needs:*
   line.

Pattern repaired: SymplecticGeometry/HamiltonianReduction R5 is used in a §7.1 Check but was
missing from Layer 7's Dependencies. It is now listed there.

Ownership: `roadmaps grep` over main and the open heads finds the Fricke identity only in Tau Ceti.
It is cited in BelyiMaps, ArithmeticDynamicsPartII and NonabelianLevelStructures. The integral
`F₂`/`SL₂` trace coordinates appear only in NonabelianLevelStructures §5.1. §7.2's general affine
quotient computes no coordinates, so nothing is duplicated.

## F02 (P3) — applied

What changed in §5.2's sketch:

| Before | After |
|---|---|
| "The pullback `φᵢ^*` identifies `O(𝐆ᵢ) ⊗_ℝ ℂ` with `O(H)`, and it carries `O(𝐆ᵢ) ⊗ 1` onto `F`" | "`φᵢ^* : O(H) → O(𝐆ᵢ) ⊗_ℝ ℂ` is an isomorphism …, and its inverse carries `O(𝐆ᵢ) ⊗ 1` onto `F`" |
| `W = φᵢ^*(…)` | `W = (φᵢ^*)⁻¹(…)` |
| `φᵢ^*(O(𝐆ᵢ) ⊗ 1) = F` | `(φᵢ^*)⁻¹(O(𝐆ᵢ) ⊗ 1) = F` |

The composite is now typed: `φ₁^* ∘ (φ₂^*)⁻¹ : O(𝐆₂) ⊗ ℂ → O(𝐆₁) ⊗ ℂ`, "the pullback of `α`". The
sketch also adds the missing step `O(H) = W + iW`. `plan.json` 5.2's "Route" was changed the same
way.

Verification on the section's own Check: `H = GL₁`, with the forms `(𝔾_m, id)` and `(𝔾_m, inv)`.
- `O(H) = ℂ[z^{±1}]` and `φ₂^*(z) = t⁻¹`.
- `f^τ = Σ ā_n z^n`, so `F = ℝ[z^{±1}] = (φ₂^*)⁻¹(ℝ[t^{±1}])`.
- `φ₁^* ∘ (φ₂^*)⁻¹ : t ↦ z⁻¹ ↦ t⁻¹`, so `α = inv`, and `φ₂ ∘ α_ℂ = inv ∘ inv = id = φ₁`.
- `α_ℂ^* = (φ₂⁻¹ ∘ φ₁)^* = φ₁^* ∘ (φ₂^*)⁻¹`, consistent with "`α_ℂ = φ₂⁻¹ ∘ φ₁` is forced".

Pattern search: the README's other pullbacks are consistent and were left unchanged.
- `(f⁻¹)^* a`, §3.4: cohomology pullback. The projection formula gives
  `f_*(a ∩ [Σ]) = (f⁻¹)^* a ∩ f_*[Σ]`.
- `w^*`, §4.1: the coproduct-word map `A → A^{⊗S}` of `w : G^S → G`.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §5.2 sketch, direction of `φᵢ^*` | `GL₁`, `(𝔾_m, id)`, `(𝔾_m, inv)` | `φ₂^*(z) = t⁻¹`; `F = ℝ[z^{±1}]`; composite `t ↦ t⁻¹`; `φ₂ ∘ α = id` | typechecks; `α = inv` as the Check says | F02 |
| §5.2, `O(H) = W + iW` | `GL₁` | `ℂ[z^{±1}] = ℝ[z^{±1}] + iℝ[z^{±1}]` | holds | clause added |
| Scope, `SL₂` = `GL₂` invariants over a field | `ℂ`; `𝔽₂` (kernel `μ₂` nonreduced; `SL₂(𝔽₂) → PGL₂(𝔽₂)` bijective, both of order 6); left multiplication on `M₂` | `tr A` invariant for both; `det` `SL₂`- but not `GL₂`-invariant under left multiplication | holds for conjugation, which factors through `PGL₂` | sentence added |
| §7.2 Check, `F₂`, `SL₂` | `R = ℂ` in NonabelianLevelStructures §5.1; `(I, I)` | `ℂ[x, y, z]`; `(2, 2, 2)` | agrees | citation |
| §7.5 Check, Vieta move | `r = (a⁻¹, b)`, involution, `ρ ∘ r⁻¹ = (A⁻¹, B)` | `tr(A⁻¹B) = tr A tr B − tr AB` (from `A + A⁻¹ = (tr A)I`); `(xy − z)² − xy(xy − z) = z² − xyz` | invariant | Check extended |
| §7.5 Check, `γ₋ᵢ` | `(A⁻¹, B⁻¹)` | `(tr A, tr B, tr((BA)⁻¹)) = (x, y, z)`; abelianization image `−I ≠ I`, so not inner | trivial action on a nontrivial class: not faithful | Check extended |
| §7.5 Check, witness | `A = [[1,1],[0,1]]`, `B = [[1,0],[1,1]]` | `AB = [[2,1],[1,1]]`, triple `(2, 2, 3)`; `ABA⁻¹B⁻¹ = [[3,−1],[1,0]]`, trace `3 = 4+4+9−12−2`; `A⁻¹B = [[0,−1],[1,1]]`, trace `1`, triple `(2, 2, 1)`, `4+4+1−4−2 = 3` | consistent | Check extended |
| Layer 7 Example, commutator convention | `aba⁻¹b⁻¹` against `a⁻¹b⁻¹ab` | conjugate by `ab`; on the witness, `A⁻¹B⁻¹AB = [[3,1],[−1,0]]`, trace `3` | same trace | clause added |
| Tau Ceti contract item | the declaration at the pin | statement as quoted above | exists | item added |

## Checks

- **Dependency check** (`gate --only SurfaceGroupCharacterVarieties`):

  ```text
  candidate: SurfaceGroupCharacterVarieties is not in the merge order yet; checked as if placed after NonabelianLevelStructures (the intake inserts it when its design is accepted)
  depcheck: 246 roadmaps, 2250 edges, 0 problem(s)
  ```

  No UPWARD or CYCLE line.
- **`roadmaps resolve`** on the README: no cross-roadmap citation or Lean name is found nowhere.
  The four TeichmullerGeometry §0.0f names listed in the brief's `citations.md` now resolve at that
  roadmap's head.
- **`plan.json`** parses. Its formatting is unchanged (one-space indent, trailing newline).
- **No `Suggested.lean`** exists at the design stage, so the `#check` elaboration comparison was not
  applicable and was not run.
- **Greps of the added text:** no LaTeX delimiters, no pull-request numbers, no process words. No
  line is over 104 characters after rewrapping.

## For the maintainer

- **Merge-order position.** The design now consumes NonabelianLevelStructures (§§5.1–5.2), an open
  pull request that adds a new roadmap folder and is listed in the merge order. The gate therefore
  places this roadmap after NonabelianLevelStructures instead of after
  MappingClassGroupsAndCanonicalRepresentations. The package's pull request must name
  NonabelianLevelStructures in its merge-order paragraph, together with RealSemisimpleLieGroups
  (already required, not in the merge order).
- **Nielsen's isomorphism has no owner.** `Out(F₂) ≅ GL₂(ℤ)` exists on main and at the heads only as
  a gap that NonabelianLevelStructures requests from MappingClassGroupsAndCanonicalRepresentations.
  This roadmap no longer states it.
- **No renames.** No id or name of this roadmap was renamed or removed. No other roadmap's citation
  is affected.
- **No suspicious text** was found in the review or the files read.
