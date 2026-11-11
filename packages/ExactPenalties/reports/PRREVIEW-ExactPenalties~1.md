# Review of ExactPenalties (pull request #2193 at b5a8d56)

**Verdict:** needs changes

## R01 (P1) — `Suggested.lean` is missing; the gate fails and a statable headline has no acceptance test

**Location:** `TauCetiRoadmap/ExactPenalties/` holds only `README.md` and `metadata.toml`.

**Claim:** The push gate fails (`missing-files`), so `lake build TauCetiRoadmap.ExactPenalties.Suggested` has nothing to build. The headline, Target 1.3, can be stated at the pins (`IsMinOn`, `Set`, an ordered ring) but is stated nowhere.

**Witness:** gate: `missing-files: TauCetiRoadmap/ExactPenalties/Suggested.lean`. Target 1.3 as written elaborates at Mathlib `1b1ccf4b` and is proved in full in a scratch file.

**Repair:** add `TauCetiRoadmap/ExactPenalties/Suggested.lean` with exactly this text. It elaborates at the pins, and its only warning is `declaration uses 'sorry'`. It states the R02 form; if R02 is declined, state the README form with the same docstring shape.

```lean
import Mathlib

/-!
# Exact penalties with a violation gap: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorem against the pinned Mathlib, with `sorry`. Every headline theorem of the roadmap is
statable at the pins.
-/

namespace TauCetiRoadmap.ExactPenalties

/-- **Exact penalty with a violation gap.** Let `F = {x ∈ D | P x}`, let `w` vanish on `F` and be
at least `δ` on `D \ F`, let `0 ≤ ρ`, and let some `y₀ ∈ F` satisfy `f y₀ - f x < ρ * δ` for every
`x ∈ D \ F`. Then `a` lies in `D` and minimizes `x ↦ f x + ρ * w x` on `D` exactly when `a`
lies in `F` and minimizes `f` on `F`. -/
theorem mem_isMinOn_add_mul_iff {α R : Type*} [CommRing R] [LinearOrder R]
    [IsStrictOrderedRing R] {D : Set α} {P : α → Prop} {f w : α → R} {ρ δ : R} (hρ : 0 ≤ ρ)
    (hw₀ : ∀ x ∈ D, P x → w x = 0) (hwδ : ∀ x ∈ D, ¬ P x → δ ≤ w x)
    {y₀ : α} (hy₀D : y₀ ∈ D) (hy₀ : P y₀) (hgap : ∀ x ∈ D, ¬ P x → f y₀ - f x < ρ * δ)
    (a : α) :
    (a ∈ D ∧ IsMinOn (fun x ↦ f x + ρ * w x) D a) ↔
      (a ∈ {x ∈ D | P x} ∧ IsMinOn f {x ∈ D | P x} a) := by
  sorry

end TauCetiRoadmap.ExactPenalties
```

## R02 (P2) — The hypotheses are narrower than the theorem: unit gap, ℝ only, and a global oscillation bound

**Location:** README.md:9–14, "Fix `B,ρ : ℝ` with: `0 ≤ B` and `B < ρ`; … `f x - f y ≤ B` for all `x,y ∈ D`", and line 18, "General numerical gaps, rescaling and broader ordered scalar types are outside this roadmap."

**Claim:** Target 1 holds in any linearly ordered commutative ring, for any gap `δ`, under a threshold that involves a single feasible point. The bound `f x − f y ≤ B` on all of `D` excludes exact instances. `0 ≤ B` is redundant, since it follows from the bound at `x = y`.

**Witness:** `D = ℕ`, `P x ↔ x = 0`, `f = id`, `w = 0` at `0` and `1` elsewhere, `ρ = 1`. The penalized minimizers and the feasible minimizers are both `{0}`, yet no `B` bounds `x − y` on ℕ. Both facts are proved at the pins.

**Repair:** replace lines 9–14 with: "Let `R` be a linearly ordered commutative ring (`[CommRing R] [LinearOrder R] [IsStrictOrderedRing R]`; ℝ is the main case). Let `D : Set α`, `P : α → Prop`, `f w : α → R` and `F = {x ∈ D | P x}`, and let `ρ δ : R` satisfy `0 ≤ ρ`, `w x = 0` for `x ∈ F` and `δ ≤ w x` for `x ∈ D \ F`."

Restate 1.1 as: "If `f y − f x ≤ B` for all `x, y ∈ D` and `B < ρ * δ`, every point of `F` has strictly smaller penalized value than every point of `D \ F`."

Restate 1.2–1.3 as: "If some `y₀ ∈ F` satisfies `f y₀ − f x < ρ * δ` for every `x ∈ D \ F`, then every penalized minimizer in `D` lies in `F`, and for every `a`, `a ∈ D ∧ IsMinOn (fun x ↦ f x + ρ * w x) D a ↔ a ∈ F ∧ IsMinOn f F a`. The unit-gap real statement is the case `R = ℝ`, `δ = 1`, with `y₀` any point of `F`."

Delete line 18 and the first two sentences of line 30. This form is proved at the pins, including the ℕ instance above, and it recovers the README form.

## R03 (P2) — The scope is a single elementary lemma and leaves out the exact-penalization theory the title names

**Location:** README.md:5, "It does not cover continuous residual penalties without a positive gap, multiplier/error-bound theory, algorithms, QUBO compilation or a whole-thesis port."

**Claim:** The finished roadmap would be one lemma with two intermediate steps. It defines no object and builds no library, contrary to "Build the library, don't race to the theorem" in the repository README.

**Witness:** all of Target 1 (1.1–1.3, README form) is proved at the pins in about 25 lines of `nlinarith`/`simp` (scratch `readme_headline`). Target 2 consists of examples.

**Repair:** make R02's gap penalty Layer 1 and add two more layers, each with a source locator:

- **Layer 2: distance-function exact penalization.** If `C ⊆ S`, `C` is closed, `f` is `LipschitzOnWith L` on `S` and `L < K`, then `a ∈ S ∧ IsMinOn (fun y ↦ f y + K * Metric.infDist y C) S a ∧ C.Nonempty ↔ a ∈ C ∧ IsMinOn f C a`. This elaborates at the pins.
- **Layer 3: ℓ¹ exactness at a Lagrangian saddle point.** If `λ ≥ 0`, `λᵢ gᵢ x* = 0` and `x*` minimizes `f + Σ λᵢ gᵢ` on `X`, then `x*` minimizes `f + ρ Σ max(gᵢ, 0)` on `X` for every `ρ ≥ maxᵢ λᵢ`. Connect it to Mathlib `IsLocalExtrOn.exists_multipliers_of_hasStrictFDerivAt`.

Then shrink line 5's exclusions to what is still outside the roadmap.

## R04 (P3) — The README does not have the roadmap shape, and the `IsMinOn` link points at the wrong line

**Location:** README.md:1, "# Exact penalties with a unit violation gap". The headings are `## Purpose`, `## Target 1`, `## Target 2` and `## Dependencies and conventions for implementation`. Line 16 links to `Extr.lean#L109`.

**Claim:** These parts are missing: a `# Roadmap:` title, the `**Summary.**` paragraph, `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build`, `## Layer k` sections ending in `### Examples` and `### Dependencies`, `## Downstream consumers` and `## References`. Lines 44–47 list modules rather than declarations.

**Witness:** in the pinned `Mathlib/Order/Filter/Extr.lean`, line 109 is the body of `IsExtrFilter`; `IsMinOn` and its docstring are lines 111–113.

**Repair:**

- Retitle the README `# Roadmap: exact penalties with a violation gap` and open it with a `**Summary.**` paragraph.
- Rename `## Purpose` to `## Scope and ownership`.
- Replace lines 42–50 with `## Exact supplier contracts` and its `### From Mathlib` subsection listing `IsMinOn`, `isMinOn_iff` (`Mathlib/Order/Filter/Extr.lean`) and `Set.Nonempty`, plus `Metric.infDist` and `LipschitzOnWith` if R03 is adopted.
- Turn the Targets into `## Layer 1: gap penalties` with `### 1.1`–`### 1.3`, `### Examples` and `### Dependencies`.
- Add `## How to read the build`, `## Downstream consumers` and `## References`.
- Change the anchor to `#L111-L113`.

## R05 (P3) — No target has a source locator

**Location:** README.md:22–28, Targets 1.1–1.3, which cite nothing. Lines 66–68 link two GitHub trees and a registry entry.

**Claim:** Every target needs a locator into a mathematical source. The links point to prior Lean code and a registry record, which contain declarations rather than a cited theorem.

**Witness:** the README has no `## References`. `routing-penalty-adapters@95f2a288`, `Chapter10IntegerPenalty.lean`, lines 18–32, holds the Lean declarations `penalty_every_bad_gt` and `penalty_minimizers_exact`, not a source text.

**Repair:** add a `## References` section and, after each of 1.1–1.3, a parenthesised locator (source, theorem number, printed page). Keep the three links under the secondary provenance section.

## R06 (P3) — Target 2 is a list of Checks, and its third bullet never tests the membership guard in 1.3

**Location:** README.md:38, "A native `IsMinOn` comparison over an empty set is vacuous even for a point outside it." Line 40: "do not count as additional research contributions."

**Claim:** In 1.3, `F.Nonempty` forces `D ≠ ∅`, so an empty-set example never shows why `a ∈ D` is needed on the left. Target 2 is not a target, and line 40 is process prose.

**Witness:** take `D = {false} ⊆ Bool`, `P` always true, `f false = 0`, `f true = −1`, `w = 0`, `B = 0`, `ρ = 1`. Then `IsMinOn g D true` holds and `F ≠ ∅`, but `true ∉ F` (proved at the pins).

**Repair:** move the bullets of lines 36–38 into a `**Checks.**` list under Layer 1. Replace the third bullet with the witness above ("dropping `a ∈ D` admits the outside point `true`"), and delete line 40.

## R07 (P3) — Process narrative, and a backticked Lean name from another project

**Location:** README.md:70, "The source formalization and this roadmap were prepared with AI assistance under David E. Bernal Neira's direction." Line 62: `Chapter10.Algebra.penalty_minimizers_exact`.

**Claim:** How the roadmap was prepared is process narrative; the pull-request description already records it. A backticked name reads as a Lean declaration, and this one resolves nowhere in the pins.

**Witness:** `roadmaps resolve` lists README line 62, `penalty_minimizers_exact`, as found nowhere in the pinned sources. It is at `routing-penalty-adapters@95f2a288`, `Chapter10IntegerPenalty.lean:32`.

**Repair:** delete line 70. At line 62, replace the backticked name with a link to `Chapter10IntegerPenalty.lean#L32` at commit `95f2a288a6c50ea6eaabde90c2515885197796cf`.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 feasible beats infeasible | Bool, `B = ρ = 1` | `g false = 1 + 0 = 1`, `g true = 0 + 1 = 1`: equal, not strict | strict `B < ρ` needed; README consistent |
| 1.1 | `D = ∅` | no points | vacuous, true |
| 1.2 feasibility of minimizer | `F = ∅`, `f = 0`, `w = 1`, `B = 0`, `ρ = 1` | `g ≡ 1`; every point of `D` minimizes and none is feasible | guard needed; README consistent |
| 1.3 ↔, README form | proved at pins (`readme_headline`) | → via 1.2 and `g = f` on `F`; ← via 1.1 | true |
| 1.3 | `D = ∅` | left side false (`a ∈ D`), right side false (`a ∈ F`) | true |
| 1.3 membership guard | `D = {false}`, `f true = −1`, `a = true` | `g true = −1 ≤ 0 = g false`; `true ∉ F` | guard needed → R06 |
| `0 ≤ B` | any `x ∈ D` | `f x − f x = 0 ≤ B` | redundant → R02 |
| oscillation bound `B` | ℕ, `f = id`, `ρ = 1` | `g 0 = 0`, `g n = n + 1`; `n − 0` unbounded | exact, but excluded → R02 |
| R02 form, `ρ < 0` | `ρ = −1`, `δ = 1`, `w x = 10`, `f x = f y₀ + 2` | `g x = f y₀ − 8 < f y₀`; hypothesis `−2 < −1` holds | `0 ≤ ρ` needed, kept |
| R02 form ↔ | proved at pins (`mem_isMinOn_add_mul_iff`) | `δ = 1`, `R = ℝ` gives the README form | true |
| Target 2, bullet 1 | as 1.1 row | `1 = 1` | correct |
| Target 2, bullet 3 | `IsMinOn f ∅ a` | `∀ x ∈ ∅` is vacuous, so true for every `a` | true but off-target → R06 |
| Headline padding probe | `simp [isMinOn_iff]; grind`; `aesop` | both fail | not padding |

- Source locators checked: 0, because the README cites no source with a locator. All 3 targets and the 3 Target 2 examples were checked by computation instead; the seeded sample found no targets by heading.
- Library declarations opened at the pins: Mathlib `IsMinOn` (`Order/Filter/Extr.lean:111–113`), `isMinOn_iff` (`:129`), `IsMinOn.of_subset` (`:272`), `LipschitzOnWith` (`Topology/EMetricSpace/Lipschitz.lean:63`), `Metric.infDist` (`Topology/MetricSpace/HausdorffDistance.lean:464`), `IsLocalExtrOn.exists_multipliers_of_hasStrictFDerivAt` (`Analysis/Calculus/LagrangeMultipliers.lean:108`), and module `Mathlib.Basic.Real.Basic` (present; `Mathlib.Data.Real.Basic` is deprecated since 2026-08-27); Tau Ceti `TauCeti.le_and_le_of_add_mul_le_add_mul` (`Algebra/Order/Ring/LinearPenalty.lean:33`) is monotonicity in the penalty, not this statement.
- Duplication and ownership: the pins contain no exact-penalty statement (grep for `penalt` and `feasib`), and neither do main or the 419 open roadmap heads (`roadmaps grep`). GraphConnectivityAndFlows §3.2 (capacity capping) is a different statement. ExactPenalties is the owner.
- Cross-roadmap citations: none. Overlaps: none. Files outside the folder: none (`git diff --stat` is empty).
- Dependency check: `depcheck: 207 roadmaps, 1914 edges, 0 problem(s)`.
- Gate, reproduced: `gate ExactPenalties: missing-files=1 FAIL`.
- Elaboration (`lake env lean`): scratch proofs of the README form and the R02 form pass; the proposed `Suggested.lean` (R01) and the Layer 2 statement (R03) each give only the `sorry` warning; the proposed theorem carries every binder in its own signature, so no section variable is lost.

## Not verifiable

- García, Ayodele and Moraglio, "Exact and sequential penalty weights in quadratic unconstrained binary optimisation with a digital annealer", GECCO '22 Companion, DOI 10.1145/3520304.3528925. This is a candidate source for R05; the sources service got HTTP 403 from the Exeter repository and found no other legal copy.
- Palomar registry record PALOMAR-2026-11-08-000006: not fetched. It is a provenance record, not a mathematical source.

## Source issues

- none
