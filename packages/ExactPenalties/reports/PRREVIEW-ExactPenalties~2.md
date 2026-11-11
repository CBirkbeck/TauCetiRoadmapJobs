# Review of ExactPenalties (pull request #2193 at 62c675e)

**Verdict:** needs changes

Previous review (at b5a8d56), finding by finding:

- R01 (`Suggested.lean` missing): partly repaired. The file exists and builds, but the gate still fails on its imports → R01 below.
- R02 (hypotheses narrower than the theorem): not repaired. README.md:13–16 still reads "The scope is real-valued unit-gap exactness with a global objective-difference bound. General numerical gaps, rescaling, broader scalar types … are outside this roadmap." → R02 below.
- R03 (scope is one elementary lemma): not repaired. README.md:3, "Build a small global exact-penalty API"; the three targets are now also proved in full in `Suggested.lean` → R03 below.
- R04 (README shape, `IsMinOn` anchor): partly repaired. The anchor is now `#L111-L113` and the layer headings exist; `## Conventions` is missing → R06 below.
- R05 (no source locator): repaired in form. README.md:64–65, 71–72, 85–87 cite [B21], Proposition 10.B.1, printed pp. 414–416; the text could not be read (see Not verifiable).
- R06 (Target 2 Checks, membership guard): repaired. README.md:103–106 carries the `D={false}` witness.
- R07 (process narrative, foreign backticked name): repaired, except the sentence at README.md:136 → R06 below.

## R01 (P1) — The gate fails: `Suggested.lean` does not import `Mathlib`

**Location:** `TauCetiRoadmap/ExactPenalties/Suggested.lean:6–10, 21`: "module / public import Mathlib.Basic.Real.Basic / public import Mathlib.Order.Filter.Extr / public import Mathlib.Tactic.Linarith … public section".

**Claim:** The push gate fails three rules (`imports`, `mathlib-subimports` ×3, `no-import-mathlib`): the file must have the single line `import Mathlib`, never `Mathlib.<submodule>` lines.

**Witness:** gate at 62c675e: `imports=1 mathlib-subimports=3 no-import-mathlib=1 … FAIL`.

**Repair:** delete lines 6–10 and line 21 and put the single line `import Mathlib` after the copyright comment. A copy edited this way elaborates at the pins with no message.

## R02 (P2) — The hypotheses are narrower than the theorem: unit gap, ℝ only, a global oscillation bound, and a redundant `0 ≤ B`

**Location:** README.md:47–52, "let `B,ρ : ℝ` satisfy: `0 ≤ B` and `B < ρ`; … `1 ≤ w x` …; `f x - f y ≤ B` for every ordered pair `x,y ∈ D`", and README.md:13–16.

**Claim:** 1.3 holds over any linearly ordered commutative ring, for any gap `δ`, with a threshold at one feasible point; the global bound excludes exact instances. `0 ≤ B` follows from the bound at `x = y` whenever `D` is nonempty.

**Witness:** `D = ℕ`, `P x ↔ x = 0`, `f = id`, `w 0 = 0`, `w n = 1` otherwise, `ρ = 1`: `g 0 = 0`, `g n = n + 1`, both minimizer sets are `{0}`, yet no `B` bounds `n − 0` (proved at the pins).

**Repair:** replace README.md:46–52 with: "Let `R` be a linearly ordered commutative ring (`[CommRing R] [LinearOrder R] [IsStrictOrderedRing R]`; ℝ is the main case), `D : Set α`, `P : α → Prop`, `f w : α → R`, `F = {x ∈ D | P x}`, and `ρ δ : R` with `0 ≤ ρ`, `w x = 0` on `F` and `δ ≤ w x` on `D \ F`."

State 1.1 under "`f y − f x ≤ B` for all `x, y ∈ D` and `B < ρ * δ`".

State 1.2–1.3 under "some `y₀ ∈ F` has `f y₀ − f x < ρ * δ` for every `x ∈ D \ F`", with conclusion `a ∈ D ∧ IsMinOn (fun x ↦ f x + ρ * w x) D a ↔ a ∈ F ∧ IsMinOn f F a`; the present statement is the case `R = ℝ`, `δ = 1`.

Delete the second and third sentences of README.md:13–16 and restate the Lean headline accordingly. This form is proved at the pins, it holds on the ℕ instance, and the README form is derived from it (also proved, without `0 ≤ B`).

## R03 (P2) — The roadmap is one elementary lemma, already proved in full in `Suggested.lean`; nothing remains to build

**Location:** README.md:38–39, "`Suggested.lean` provides suggested interfaces and proofs of the three targets at the pinned dependencies", and `Suggested.lean:27–84` (three theorems, none with `sorry`).

**Claim:** `Suggested.lean` states what the finished roadmap will prove, each with `sorry`. Here every target is already proved in under 60 lines, so the roadmap defines no object and plans no library; the exact-penalization theory of the title is excluded at README.md:14–16.

**Witness:** `lake env lean` on `Suggested.lean` prints nothing (no `sorry` warning). 1.1 closes with one `nlinarith` (R04).

**Repair:** make R02's gap penalty Layer 1 and add layers that need building, each with a source locator, then state their headlines with `sorry`:

- **Layer 2: distance-function exact penalization.** If `C ⊆ S`, `C` closed, `f` is `LipschitzOnWith L` on `S` and `L < K`, then `a ∈ S ∧ IsMinOn (fun y ↦ f y + K * Metric.infDist y C) S a ∧ C.Nonempty ↔ a ∈ C ∧ IsMinOn f C a`.
- **Layer 3: ℓ¹ exactness at a Lagrangian saddle point.** If `λ ≥ 0`, `λᵢ gᵢ x* = 0` and `x*` minimizes `f + Σ λᵢ gᵢ` on `X`, then `x*` minimizes `f + ρ Σ max(gᵢ, 0)` on `X` for every `ρ ≥ maxᵢ λᵢ`; connect it to Mathlib `IsLocalExtrOn.exists_multipliers_of_hasStrictFDerivAt`.

Shrink README.md:13–16 to what is still excluded. If the scope stays at Layer 1 alone, the three proved theorems are a Tau Ceti library contribution, not a roadmap.

## R04 (P3) — `penalized_lt_of_feasible_of_not_feasible` and `feasible_of_isMinOn` are padding

**Location:** `Suggested.lean:27–41` and `45–57`.

**Claim:** 1.1 closes in one tactic and 1.2 is a one-line consequence of it; both are intermediate steps of the headline 1.3, not headlines.

**Witness:** scratch copy at the pins: `nlinarith [hzero y hy hgood, hgap x hx hbad, hcost y hy x hx]` closes 1.1; after `obtain`/`by_contra`, `exact (1.1 …).not_ge (hm hy)` closes 1.2. `grind [isMinOn_iff]` fails on 1.3.

**Repair:** delete both from `Suggested.lean` (the README keeps 1.1 and 1.2 as targets), and state the headline 1.3 in the R02 form with `sorry`.

## R05 (P3) — `Suggested.lean` form: docstring, and Lean names absent from the README

**Location:** `Suggested.lean:13–18`, "# Exact penalties with a unit violation gap: suggested interfaces … These are suggested forms, not an exhaustive checklist. … The proof follows the feasible/infeasible comparison argument in the source."

**Claim:** The module docstring is titled "<title>: target signatures", says the file states the headline theorems against the pinned APIs and which are not statable. No declaration name of the file appears in the README.

**Witness:** `grep -n "isMinOn_penalized_iff\|feasible_of_isMinOn\|penalized_lt" README.md` returns nothing; main `TauCetiRoadmap/RicciFlow/Suggested.lean:9–12` shows the docstring form.

**Repair:** replace the docstring with: "# Exact penalties with a violation gap: target signatures / The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline theorems against the pinned Mathlib, each with `sorry`. Every headline theorem is statable at the pins." Name each kept declaration in backticks at its README target (`isMinOn_penalized_iff` at 1.3).

## R06 (P3) — README shape: no `## Conventions`, a file-description in place of the build order, implementation advice and provenance narrative

**Location:** README.md:32–34, "Use mathematical imports for real numbers and extrema, with the ordinary linear-arithmetic tactic if helpful."; README.md:38–42; README.md:134–136, "## Secondary provenance / The existing formalization is source material, not a prescriptive design."

**Claim:** `## Conventions` is missing (the standing hypotheses sit unnumbered at the top of Layer 1); `## How to read the build` describes the two files instead of the layer order; lines 32–34 and 136 are implementation and process prose; `## Secondary provenance` follows `## References`.

**Witness:** `grep -n "Conventions" README.md` returns nothing; main `TauCetiRoadmap/RicciFlow/README.md` has `## Conventions` between scope and supplier contracts.

**Repair:** move README.md:46–55 (in the R02 form) into a new `## Conventions` after `## Scope and ownership`; replace lines 38–42 with one paragraph giving the layer order and what each layer delivers; delete lines 32–34 and line 136; fold the three provenance links into `## References`.

## R07 (P3) — The pull request description was written for an earlier head

**Location:** description: "The two targets cover …"; "Only the new `TauCetiRoadmap/ExactPenalties/` README and `math.OC` metadata are added. There is no implementation …"; "No Lean file is added here".

**Claim:** The head contradicts all three sentences.

**Witness:** diffstat at 62c675e: `Suggested.lean | 86 +`, with three proved theorems; README.md has targets 1.1, 1.2 and 1.3.

**Repair:** "The three targets (1.1–1.3) cover …"; "The pull request adds the new roadmap folder `TauCetiRoadmap/ExactPenalties/`: `README.md`, `Suggested.lean` (the headline statement against the pinned Mathlib) and `metadata.toml` (`math.OC`)."; delete "No Lean file is added here".

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 Strict comparison (sampled) | Bool, `B = ρ = 1` (Check 1) | `g false = 1 + 1·0 = 1`, `g true = 0 + 1·1 = 1`; not strict | `B < ρ` needed; README consistent |
| 1.1 | `D = ∅`; `B = 0`, `ρ = 1`, `w x = 1`, `f` constant | vacuous; `g y = c < c + 1 = g x` | true; one `nlinarith` → R04 |
| 1.2 Feasibility of a minimizer (sampled) | `P` false, `f = 0`, `w = 1`, `B = 0`, `ρ = 1` (Check 2) | `g ≡ 1`; every point minimizes, none feasible | guard needed; README consistent |
| 1.2 | proved from 1.1 in scratch | `g y < g x` contradicts `g x ≤ g y` | true → R04 |
| 1.3 Exact correspondence (sampled, headline) | `D = ∅` | left false (`a ∈ D`), right false (`a ∈ F`) | true |
| 1.3 | `F = ∅`, `D ≠ ∅` | left false (third conjunct), right false | true |
| 1.3 membership guard | `D = {false}`, `f true = −1`, `a = true` (Check 3) | `g true = −1 ≤ 0 = g false`; `true ∉ F` | guard needed; README consistent |
| 1.3 nonvacuity | Bool, `f = 0`, `w true = 1`, `B = 0`, `ρ = 1` (Check 4) | `g false = 0 < 1 = g true`; `false` minimizes both sides | true |
| 1.3 padding probe | `grind [isMinOn_iff]` | fails | not padding |
| `0 ≤ B` | any `x ∈ D` | `f x − f x = 0 ≤ B` | redundant → R02 |
| global bound `B` | ℕ, `f = id`, `ρ = 1` | `g 0 = 0`, `g n = n + 1`; `n − 0 > B` for `n > B` | exact but excluded → R02 |
| R02 form | `ρ = −1`, `δ = 1`, `w x = 10`, `f x = f y₀ + 2` | `g x = f y₀ − 8 < f y₀`; hypothesis `−2 < −1` holds | `0 ≤ ρ` needed, kept |
| R02 form ↔ | proved at pins; README form derived from it | `δ = 1`, `R = ℝ`, `y₀` any point of `F`, `f y₀ − f x ≤ B < ρ` | true |

- Source locators checked against the text: 0 of 3 ([B21] unreadable, see below); all three sampled targets checked by proof and by the four Checks instead.
- Library declarations opened at the pins: Mathlib `IsMinOn` (`Order/Filter/Extr.lean:111–113`, docstring: membership of `a` not assumed), `isMinOn_iff` (`:129–130`); both README anchors are right. Tau Ceti `Algebra/Order/Ring/LinearPenalty.lean` is a different statement.
- Duplication and ownership: no exact-penalty statement in the pinned Mathlib or Tau Ceti (grep `penalt`), on main or at the open heads (`roadmaps grep`); only OptimalTransport mentions penalties, for other objects. ExactPenalties is the owner.
- Cross-roadmap citations: none. Overlaps: none. Changes outside the folder: none.
- Dependency check: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`.
- Gate: `imports=1 mathlib-subimports=3 no-import-mathlib=1 … build=0 FAIL`.
- Elaboration (`lake env lean`): `Suggested.lean` prints nothing (all three proved, no `sorry`); the three elaborated signatures match README 1.1–1.3, every binder explicit, no section variable.

## Not verifiable

- [B21] Bernal Neira, PhD thesis, Carnegie Mellon University, 2021, Proposition 10.B.1, printed pp. 414–416: the sources service found no legal copy by citation and got HTTP 403 from the KiltHub record (article 19146305); number, pages and hypotheses unchecked.

## Source issues

- none
