# FIX-DESIGN-SurfaceGroupCharacterVarieties~11

This round settles the findings of REV-DESIGN-SurfaceGroupCharacterVarieties~10. There are two
findings, both P3. Both were checked against the source and both hold. F01 is applied with a corrected
proof sketch. F02 is applied as asked, plus one Check.

Files changed:
- `packages/SurfaceGroupCharacterVarieties/design/README.md`
- `packages/SurfaceGroupCharacterVarieties/design/plan.json`
- `packages/SurfaceGroupCharacterVarieties/sources.toml` (the BohmLafuente2021 locator now covers the
  two passages the repaired §5.4 cites)

## F01 (P3) — applied differently

What changed:
- **§5.4 (iii)**, old → new:
  - old: "there is `α ∈ 𝔭` such that `lim_{t→∞} exp(tα) v` exists and lies outside `G v`"
  - new: "there is `α ∈ 𝔭` such that `w = lim_{t→∞} exp(tα) v` exists and `G w` is closed, so that
    `w ∉ G v`"
- **§5.4 locator.** Added "with the proof of its clause (ii) at lines 580–583" and "Lemma 6.2, line 504".
- **New fourth Check (`(ℝ_{>0})²` on `ℝ²`).** `diag(−1, 0)` gives the limit `(0, 1)`, whose orbit is not
  closed. `diag(−1, −1)` gives `0`, whose orbit is closed. In general `diag(a, b)` has a limit exactly
  when `a, b ≤ 0`, and that limit has a closed orbit exactly when `a, b < 0`.
- **`plan.json` 5.4.** The same clause; the `where` field gets the two new locators; new test
  `quadrant_limit`.

Why "differently". The suggested repair says to add, after "produces `α` in (iii)", that `Y` is "the
orbit of a norm minimizer of the closure, which is closed by (ii)". The sketch then proves (ii) only
afterwards, by convexity, from that same limit. Read as suggested, the sketch becomes circular: (iii)
uses (ii), and (ii) uses (iii).

The sketch now follows the source's order:
1. The weak limit, lying in some closed invariant `Y` disjoint from `G v`, gives (ii) by convexity.
2. The argument is then rerun with `Y = G v̄`, where `v̄` minimizes the norm on the closure of `G v`.
   - The closure is invariant, so `v̄` is minimal in its own orbit. By (ii), `G v̄` is closed.
   - `G v̄` is disjoint from `G v`, since otherwise `G v = G v̄` would be closed.

Evidence:
- BohmLafuente2021 lines 81–82: in clause (ii) of the source's Theorem 1.1, the limit has a closed
  orbit.
- Lines 580–583: the proof picks `v̄` of minimal norm in the closure, gets `G v̄` closed by Corollary 6.4
  (line 562), and reruns the proof of Lemma 6.3 (line 518) with that orbit.
- Lemma 6.2 (line 504) supplies the closed invariant `Y` used in the first pass.

The review's witness holds. Take `G` the positive diagonal matrices: they form a closed subgroup of
`GL₂(ℝ)`, with `K = G ∩ O(2) = 1`, `𝔭 = 𝔤` the diagonal matrices, and `G = exp(𝔭)`. With `α = diag(−1, 0)`,
`exp(tα)(1, 1) = (e^{−t}, 1) → (0, 1)`. Its orbit `{0} × ℝ_{>0}` has `0` in its closure, so the old
clause accepts this `α` and the source's clause rejects it.

Same pattern searched elsewhere:
- §6.5 and the Scope already use the strong form: "a closed orbit reached by a cocharacter limit" (from
  ArithmeticGaloisRepresentations §1.11).
- §§6.6, 7.1 and 7.2 cite §5.4 only for (ii), (iv), (v) and `G = K T K`.
- No other weak limit clause occurs.

## F02 (P3) — applied

What changed:
- **§4.2's real clause.**
  - old: "For a real reductive datum `(𝐆, G^ℝ)`, prove that …"
  - new: "For an affine group scheme `𝐆` of finite type over `ℝ` and an open subgroup `G^ℝ ⊆ 𝐆(ℝ)` (in
    particular for every real reductive datum `(𝐆, G^ℝ)` of the Conventions), prove that …"
  - It also gives the reason for clopenness: a finite intersection over `s ∈ S` of preimages of the
    open-and-closed `G^ℝ`.
- **New fourth Check** (`𝔾_a`; disconnected `μ₂`).
- **`plan.json` 4.2.** The statement, the hypotheses and the test `nonreductive_disconnected`.
- **No *Needs:* line changed.**

How this differs from the suggested wording: it points to the Conventions, where the datum is
defined, instead of to §5.1. A Layer 4 statement then names no Layer 5 section, so it does not even
look like an upward edge.

Evidence:
- Before the repair, §5.1 defined the object that §4.2 named, but §4.2's *Needs:* and `plan.json` did
  not list §5.1. Layer 4 precedes Layer 5.
- The clause holds at the wider generality:
  - For an affine `ℝ`-scheme `X = Spec A`, a point `φ : A → ℂ` is fixed by conjugation iff `φ(A) ⊆ ℝ`,
    so `X(ℂ)^{conj} = X(ℝ)`.
  - `Hom(Γ, G^ℝ) = ⋂_{s ∈ S} ev_s⁻¹(G^ℝ)`, and an open subgroup is closed.
  - Conjugation is continuous on `𝐆(ℝ)^S`, and it preserves `Hom(Γ, G^ℝ)` because `G^ℝ` is a subgroup.

Same pattern searched elsewhere:
- A grep of Layers 1–4 for §5–§7 sections, "reductive", "Cartan", "minimal", `𝒳` and `Hom^red` finds
  only supplier sections (MordellLawrenceVenkatesh §5.x, TeichmullerGeometry §5.4).
- A mechanical scan of `plan.json` finds no `target:` prerequisite in a later layer.

## Adversarial pass (changed statements)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §5.4 (iii), new | `(ℝ_{>0})²` diagonal on `ℝ²`, `v = (1,1)` | `exp(t·diag(a,b))(1,1) = (e^{ta}, e^{tb})`. Limit iff `a, b ≤ 0`, equal to `(δ_{a0}, δ_{b0})`. Closed orbit iff the limit is `0` iff `a, b < 0`. `diag(−1,0)` gives `(0,1)`, orbit `{0}×ℝ_{>0}`, not closed. `diag(−1,−1)` gives `0`. | the new clause rejects the first and accepts the second | Check added |
| §5.4 (iii), new | `ℝ_{>0}` scaling `ℝ`, `v = 1`; `v = 0`; compact `G` (`𝔭 = 0`) | `α = −1`: `e^{−t} → 0`, `{0}` closed. `α = 1`: no limit. `v = 0`: orbit closed, clause vacuous. Compact: every orbit closed, vacuous. | holds | none |
| §5.4 (iii), new | `ℝ_{>0}` on `ℝ²` with weights `(1, −1)`, `v = (1, 0)` | `𝔭 = ℝ·diag(1,−1)`. `α = −diag(1,−1)`: `(e^{−t}, 0) → 0`, closed. `α = +diag(1,−1)`: diverges. | holds, as the first Check says | none |
| §5.4 (iii), new | `SL₂(ℝ)` on `M₂(ℝ)`, `v = [[1,1],[0,1]]` | `α = diag(−1,1)`: `[[1, e^{−2t}],[0,1]] → I`, orbit `{I}` closed. `α = diag(1,−1)`: `[[1, e^{2t}],[0,1]]` diverges. | holds, as the second Check says | none |
| §5.4 (iii), "so that `w ∉ G v`" | `w` in the closure of `G v` | if `w ∈ G v`, then `G v = G w` is closed, a contradiction | the implication is valid | none |
| §5.4 sketch, (ii) from the weak limit | minimal `v`, `α ∈ 𝔭`, `v = Σ v_i` in `α`-eigenspaces | `d/dt‖exp(tα)v‖²` at `0` is `2Σλ_i‖v_i‖² = 0`. The limit exists, so `v_i = 0` for `λ_i > 0`. Hence `Σ_{λ_i<0} λ_i‖v_i‖² = 0`, so `v ∈ ker α` and the limit is `v ∈ G v`, contradicting limit `∈ Y` | not circular | sketch reordered |
| §5.4 sketch, (iii) from (ii) | `v̄` minimizing the norm on the closure of `G v` | the closure is `G`-invariant, so `‖v̄‖ ≤ ‖g v̄‖`; `G v̄` is closed by (ii); `G v̄ ∩ G v = ∅`, otherwise `G v` is closed | valid; matches lines 580–583 | sketch |
| §4.2 real clause, widened | `𝐆 = 𝔾_a`, `G^ℝ = ℝ`, `Γ = ℤ/2` | relator ideal `(2t)`, so `ℝ[t]/(2t) = ℝ` is one point `0`; conjugation fixes it; `Hom(ℤ/2, ℝ) = {0}` | holds without reductivity | Check added |
| §4.2 real clause, widened | `𝐆 = μ₂`, `Γ = ℤ`, `G^ℝ = {1}` and `{±1}` | `Hom(ℤ, μ₂)(ℂ) = {±1}`, conjugation fixes both points; `{1}` is clopen in the discrete `{±1}` | holds for disconnected `𝐆` | Check added |
| §4.2 real clause | `𝐆 = GL₁`, `G^ℝ = ℝ_{>0}`, `Γ = ℤ`; `𝐆 = O(2)`, `G^ℝ = SO(2)`, `Γ = F₂` | fixed set of conjugation on `ℂ^×` is `ℝ^×`, and `ℝ_{>0}` is clopen in it; `Hom(F₂, O(2)) = O(2)²` has 4 components, and `SO(2)²` is one of them | holds | none |
| §4.2, finiteness of `S` | `Γ = F_∞`, `𝐆 = GL₁`, `G^ℝ = ℝ_{>0}` | `(ℝ_{>0})^ℕ ⊆ (ℝ^×)^ℕ` is closed but not open: every basic open set constrains finitely many coordinates | finite generation (§4.1's finite `S`) is needed and is in scope | none |
| §4.2 existing Checks | `Hom(ℤ, GL₁(ℝ))`; `Hom(ℤ/2, SO(2))`; `Hom(F₂, G(ℂ))` | `ℝ^×` with component `ℝ_{>0}`; `{±1}`; `G(ℂ)²` | unchanged by the widening | none |

## Checks run

- **Dependency check** (gate command of the brief), output:

  ```text
  candidate: SurfaceGroupCharacterVarieties is not in the merge order yet; checked as if placed after NonabelianLevelStructures (the intake inserts it when its design is accepted)
  depcheck: 246 roadmaps, 2250 edges, 0 problem(s)
  ```

  There is no UPWARD or CYCLE line.
- **`roadmaps resolve` on the README.** It reports no cross-roadmap citation and no Lean name found
  nowhere.
- **`plan.json`.** It parses as JSON; the diff touches only targets 4.2 and 5.4. No `target:`
  prerequisite points to a later layer.
- **`Suggested.lean` / `#check` comparison.** Not applicable: the design stage has no `Suggested.lean`,
  and no Lean was elaborated.
- **Gate failures.** None were listed for this round.

## For the maintainer

- No id, heading or target name changed, and no cross-roadmap citation was added or removed.
- §5.4 (iii) is now stronger, matching the source. No roadmap cites SurfaceGroupCharacterVarieties.
- §4.2's real clause is now stated for every affine `ℝ`-group of finite type with an open subgroup of
  its real points. That object is already this roadmap's own: Layer 4 owns the representation scheme
  of a finitely generated group into an affine group scheme. No other owner was found.
- Sources:
  - No new source was fetched.
  - The two added BohmLafuente2021 passages (Lemma 6.2 at line 504, and the proof of Theorem 1.1 (ii)
    at lines 580–583) were read in the cached text. The manifest locator now lists them.
  - No `needs-references.toml` was written.
- Ownership against open pull requests was not rechecked this round: no new object was introduced.
