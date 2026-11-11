# FIX-PKG-AmenableTracesOnCStarAlgebras~4

Findings of `REV-PKG-AmenableTracesOnCStarAlgebras~3`: one finding, P3. It was checked against the
pinned Tau Ceti source before it was applied.

## F01 (P3) — applied

Verified at Tau Ceti `2fd255d9…`: `TauCeti/Analysis/CStarAlgebra/CharacterSpaceMeasure.lean`
line 134 states `LinearMap.exists_isFiniteMeasure_integral_characterSpace_eq` for
`[CommCStarAlgebra A]` (unital: it extends `CStarAlgebra`) with
`[MeasurableSpace (characterSpace ℂ A)] [BorelSpace …]`. It takes `f : A →ₗ[ℂ] ℂ` with
`0 ≤ f (star a * a)` and gives a finite, inner regular `μ` with `f a = ∫ ω, ω a ∂μ`. Its proof is
`gelfandStarTransform` followed by `RealRMK.rieszMeasure`. That is the route §7.1 had rebuilt.

What changed:
- `### From Tau Ceti`: added a bullet for the theorem. It gives the hypotheses, notes that the
  mass is `τ(1)` (so a state gives a probability measure), and says the theorem asserts nothing
  for nonunital algebras or about uniqueness.
- §7.1 route: "unital `A ≅ C(Ω)` (`gelfandStarTransform`), a state is a regular Borel probability
  measure `μ` (`RealRMK.rieszMeasure`)" → "unital `A`, a state is `a ↦ ∫ ω(a) dμ(ω)` for a
  probability measure `μ` on the character space `Ω` (Tau Ceti …; `A ≅ C(Ω)` by
  `gelfandStarTransform`)".
- §7.1 *Needs:* and Layer 7 Dependencies: `RealRMK.rieszMeasure` is replaced by the Tau Ceti
  theorem.

**Same pattern elsewhere.** I searched the README for measure, Gelfand, `C(Ω)` and `C(X)`. No
other passage derives a measure from the Gelfand transform. The §1.1 Check on `C(X)` applies
`RealRMK.rieszMeasure` to `C(X, ℝ)` directly, with no Gelfand step. It keeps that citation, as do
the Mathlib contract bullet and the Layer 1 Dependencies. No statement, Check, Lean declaration or
manifest entry changes. The docstring of `isQuasidiagonalTrace_of_commute` names no route.

### Adversarial pass on the changed text

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Contract bullet: positive `τ` is `∫ ω(a) dμ`, mass `τ(1)` | `ℂ ⊕ ℂ`, `τ = (1/3, 2/3)` | `Ω` = two characters, `μ = (1/3)δ₁ + (2/3)δ₂`; `τ(s, t) = s/3 + 2t/3 = ∫ω(s,t)dμ`; mass `1 = τ(1)` | holds | none |
| same | `C[0,1]`, Lebesgue `τ` | `Ω ≅ [0,1]`, `μ` Lebesgue, mass `1`; `f(x) = x` gives `1/2`, the limit of the §7.1 Riemann-sum Check `(n + 1)/(2n)` | holds, consistent with the Check | none |
| same, degenerate | `A = ℂ`; zero algebra | `Ω` = one point, `μ = δ`, mass `1`; for `A = 0`, `1 = 0` so `Ω = ∅`, only `f = 0`, `μ = 0`, mass `0 = τ(1)`; no state exists | holds; "probability measure when `τ` is a state" is vacuous there | none |
| same, positivity | `f(s, t) = s − t` on `ℂ²` | `f((0,1)*(0,1)) = −1 < 0`: hypothesis fails; `f` is the signed measure `δ₁ − δ₂` | positivity is needed | none |
| "Nothing is asserted for nonunital algebras" | `c₀` | not a `CommCStarAlgebra`; §7.1 goes through the unitization `c`, `Ω = ℕ ∪ {∞}`, `τ̃(x + λ) = Σ w_n x_n + λ` gives `μ = Σ w_n δ_n`, mass `1` | the unitization step (§3.2) is still needed | none |
| "nothing about uniqueness" | — | the pinned conclusion is `∃ μ, IsFiniteMeasure μ ∧ μ.InnerRegular ∧ …`, with no uniqueness clause | accurate | none |
| §7.1 route, mass | state `τ` on unital commutative `A` | `τ(1) = ∫ ω(1) dμ = μ(Ω)`, and `ω(1) = 1` for every character | `μ` is a probability measure | none |
| §7.1 *Needs:* | — | the Tau Ceti theorem replaces RMK; `PartitionOfUnity` is still used for the finitely supported approximants; `gelfandStarTransform` is still used for `A ≅ C(Ω)` | complete | none |

## Checks

- **Elaboration.** `lake env lean packages/AmenableTracesOnCStarAlgebras/Suggested.lean`, run
  from the content checkout: exit 0 in 14 s. There are 21 warnings, all "declaration uses
  `sorry`" (one per theorem), and no other message. `Suggested.lean` is unchanged this round. No
  `TauCeti.*` module needed building.
- **Signatures.** I put `#check @name` for all 44 declarations into one scratch copy and
  elaborated it once: exit 0, and the types are as in `signatures.md`. The four flagged
  declarations are `IsFaithfulTrace`, `IsHypertrace` and `IsFoelnerTrace` (each drops
  `[StarOrderedRing A]`) and `IsAF` (drops both order classes). Their bodies use neither class:
  `A →P[ℂ] ℂ` needs only `[PartialOrder A]`, and `IsAF` mentions no order. Every theorem that uses
  them keeps the instances. No change.
- **Dependency check** (output):

      depcheck: 207 roadmaps, 1918 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the README reports no cross-roadmap citation and no Lean
  name found nowhere.

## Notes for the maintainer

- No names that other roadmaps cite were changed. No supplier gap was added: `design/plan.json` is
  unchanged.
- The Tau Ceti declaration cited is new to the contract and exists at the pinned commit the README
  names. No new source was fetched and `sources.toml` is unchanged.
- Ownership: the measure representation is owned by the pinned Tau Ceti and is now cited, not
  restated. No ownership question against open pull requests arises from this edit.
