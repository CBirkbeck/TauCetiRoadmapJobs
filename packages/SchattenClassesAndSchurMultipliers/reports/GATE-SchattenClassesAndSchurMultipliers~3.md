# GATE-SchattenClassesAndSchurMultipliers~3: answers to human review

One review was unanswered: kim-em, 2026-11-26, on head 5e643e9. It made four points and a
recommendation, numbered H01–H05 below. The repair commit is 1bd55650, on top of 5e643e9. It
changes only `TauCetiRoadmap/SchattenClassesAndSchurMultipliers/README.md` (21 insertions, 22
deletions); `Suggested.lean` is unchanged.

## H01 (kim-em) — answered

Confirmed at 5e643e9, and nothing changed. The *Needs:* line of §2.1 (README line 476) lists
"§1.1 (the class `S₂` and the density of finite-rank operators in it)". "How to read the build"
says that "§2.1 and §2.3 use §1.1" (line 83) and that "Layer 5 needs §1.1 and Layers 2 and 3"
(line 87). The *Needs:* line of §5.2 begins "§1.1, §2.5, …", and the Layer 5 Dependencies begin
"Layer 1 (§1.1)".

## H02 (kim-em) — answered

Confirmed, and nothing changed. §3.5 (lines 806–809) says that the definition needs only §3.1 and
§3.3 on the spaces `Ω × Fin m`, and through them §1.1, §1.4, §2.1 and §2.2. It says that the
statements also use the identification `L²(Ω × Fin m) = L²(Ω)^m`, §3.2 and §3.4. The *Needs:*
line (lines 843–846) is itemised the same way: §3.1 and §3.3; then §1.4 with VonNeumannAlgebras
V2.RectangularL2; then §3.2; then §3.4 with `Matrix.kroneckerMap`. "How to read the build"
(lines 84–86) gives the same list for the definitions §3.1, §3.3 and §3.5.

## H03 (kim-em) — answered

Agreed, and nothing changed. The roadmap specifies the whole of this definition for σ-finite `μ`
and every `1 ≤ p ≤ ∞`:
- §3.1: the multiplier `S_M` on `S₂(L²(Ω, μ))`;
- §3.3: its norm on `S_p` and its unique bounded extension;
- §3.5: its completely bounded norm, through the amplified symbols on `Ω × Fin m`.

In `Suggested.lean`, `schurNorm` and `schurCbNorm` are defined for any measure. Every theorem
about them carries `[SigmaFinite μ]` (checked against the elaborated types in `signatures.md`).

## H04 (kim-em) — disputed

BochnerSpaces is on main (commit 95799564), and two of the three sections this roadmap cited from
it say what is cited:
- **§7.4** constructs the `L^∞` contraction as the adjoint of the `L¹` projection. It proves
  positivity, the tower law, agreement with `condExpL2` on `L^∞ ∩ L²` and identification with the
  native `L¹` conditional expectation, over `𝕜 = ℝ` or `ℂ`.
- **§4.2** constructs the Fubini isometry `Lᵖ(μ; Lᵖ(ν; X)) ≃ Lᵖ(μ × ν; X)` for σ-finite `μ`, `ν`,
  with a.e. section formulas.

The third does not. §7.1 used **BochnerSpaces §7.5** for Sierpiński's theorem: for a finite
atomless measure, every value `t ν(A)` with `0 ≤ t ≤ 1` is the measure of a measurable `B ⊆ A`.
On main, §7.5 is "Universality of the unit interval [0,1]". It normalises the atomless part of a
measure and then applies VonNeumannAlgebras V2's classification of *separable* nonatomic
probability measure algebras. It never states Sierpiński's theorem, so a supplier gap remained.

No other owner exists:
- On main and in all open roadmap pull requests, `roadmaps grep` finds no statement of it.
- The pinned Mathlib has nothing like it.
- Tau Ceti has it only on standard Borel spaces under null singletons:
  `MeasureTheory.Measure.exists_subset_measure_eq_of_nullSingleton`, in
  `TauCeti/MeasureTheory/Measure/AtomlessStandardBorel/Transport.lean`, line 115.

So this roadmap now owns it.

The repair:
- **§7.1, Sierpiński bullet.** Old: "This is BochnerSpaces §7.5 applied to the finite measure
  `μ.restrict A` … with the ratio `t/μ(A)` …". New: a proof here, citing the splitting used in
  lafforgue-delasalle-2011 lines 513–515. Every non-null `E ⊆ A` contains subsets of arbitrarily
  small positive measure, by repeated halving: `E` is not an atom. A greedy exhaustion then builds
  `B`: `B_{k+1} = B_k ∪ F_k` with `μ(F_k) ≥ s_k/2`, so `s_k → 0`. If `μ(B) < t`, a small
  `G ⊆ A \ B` would keep every `s_k ≥ μ(G)`, which is impossible.
- **§7.1, Checks.** Deleted the Check "`A = [0, 2]`, `t = 1/2`, ratio `1/4`". It tested only the
  translation into the removed supplier's ratio form.
- **§7.1 *Needs:*** Old: "…; BochnerSpaces §7.5". New: "…, `MeasureTheory.measure_iUnion`,
  `MeasureTheory.tendsto_measure_iUnion_atTop`". Both are in the `MeasureTheory` namespace at the
  pin.
- **Layer 7 Dependencies.** Dropped "BochnerSpaces §7.5".
- **Scope and ownership, list of what this roadmap owns.** Added "Sierpiński's theorem for
  atomless measures on an arbitrary measurable space" to Layer 7.
- **Scope and ownership, BochnerSpaces bullet.** Removed "the divisibility of atomless finite
  measures (its §7.5)" and "§7.1 applies BochnerSpaces §7.5 …".
- **From Tau Ceti.** "§7.1 takes the version … from BochnerSpaces §7.5" now reads "§7.1 proves the
  version …".
- **From TauCetiRoadmap.BochnerSpaces.** Deleted the §7.5 bullet. Its point that atomlessness in
  the `IsAtom` sense, not null singletons, is the right hypothesis was already made by the
  Conventions and by the Checks of §7.1.

## H05 (kim-em) — answered

The approval recommendation was made against 5e643e9. The head is now 1bd55650, which changes
only the passages listed under H04: §7.1, the Layer 7 Dependencies, and the BochnerSpaces and
Tau Ceti lines of the scope section and of the supplier contracts. Those are what a re-read
needs to cover.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Sierpiński: atomless `μ`, `μ(A) < ∞`, `0 ≤ t ≤ μ(A)` ⇒ measurable `B ⊆ A`, `μ(B) = t` | `μ = 0` | `μ(A) = 0` forces `t = 0`; every `s_k = 0`, `B = ∅`, `μ(B) = 0 = t` | holds | none |
| same | `t = 0`, Lebesgue `[0, 1]` | `s_k = 0`, `B` null, `μ(B) = 0` | holds | none |
| same | `t = μ(A) = 1`, Lebesgue `[0, 1]` | if `μ(B) < 1`, a `G` of measure `≤ 1 − μ(B)` exists, so `s_k ≥ μ(G) > 0`, contradicting `Σ μ(F_k) ≤ 1` | holds, `μ(B) = 1` | none |
| same | Lebesgue `[0, 1]`, `t = 1/3` | `[0, 1/3]` is a witness; the route gives some `B` with `μ(B) = 1/3` | holds | none |
| same (negative) | counting measure on `{1, 2}`, `t = 1/2` | subsets have measure `0`, `1` or `2`, none `1/2`; `{1}` is an atom, so the hypothesis fails | excluded by the hypothesis | none |
| same (negative) | countable–cocountable on an uncountable set, `t = 1/2` | null singletons hold; values are only `0` and `1`; the whole space is an atom | excluded by `IsAtom`, as the existing Check says | none |
| Halving step: non-null `E ⊆ A` has subsets of measure in `(0, μ(E)/2]` | `E = [0, 1]` | not an atom: `F = [0, 1/3]`, `μ(F) = 1/3`, `μ(E \ F) = 2/3`; the smaller has `1/3 ≤ 1/2` | holds | none |
| Greedy step stays within `t` | `μ(B_0) = 0`; inductively `μ(B_{k+1}) = μ(B_k) + μ(F_k) ≤ t` | `F_k` is disjoint from `B_k` by construction | holds | none |
| `s_k → 0` | `Σ μ(F_k) = μ(B) ≤ t < ∞` (finite, since `t ≤ μ(A) < ∞`) | `μ(F_k) → 0` and `s_k ≤ 2μ(F_k)` | holds; uses `μ(A) < ∞` | none |
| `n` equal pieces | `n = 1` | no splits; the piece is `A` | holds | none |
| same | `n = 3`, `μ(A) = 1` | split `1/3` off `A` (remainder `2/3`), then `1/3` off that (remainder `1/3`) | three pieces of `1/3` | none |
| Check "zero measure atomless, `n` null pieces" | `μ = 0` | no set of positive measure, so no atom; pieces `A, ∅, …, ∅`, all measure `0 = μ(A)/n` | holds | kept |
| Deleted Check (ratio `t/μ(A)`) | `A = [0, 2]`, `t = 1/2` | it tested the conversion `(1/4) · 2 = 1/2` into the supplier's ratio form, which is gone | tests nothing now | deleted |
| BochnerSpaces §7.4 contract | main's §7.4 text and API | `L^∞` adjoint of `E₁`; positivity; tower law; agreement with `condExpL2` and `condExp`; `𝕜 ∈ {ℝ, ℂ}` | matches | none |
| BochnerSpaces §4.2 contract | main's §4.2 | σ-finite `μ, ν`, `1 ≤ p < ∞`, isometry onto with a.e. section formulas; we use its inverse at `p = 2` | matches | none |

The Sierpiński statement needs no σ-finiteness, and none is assumed: §7.1 has no standing
hypothesis. Its generality, an arbitrary measurable space, matches the new line of the scope
section.

## Ownership, sources, Lean

- **Ownership.** Sierpiński's theorem for `IsAtom`-atomless measures on an arbitrary measurable
  space has no owner. Searched by object, not by name:
  - main's BochnerSpaces §7.5 and VonNeumannAlgebras V2 (separable nonatomic measure algebras
    only);
  - `roadmaps grep` over main and the open heads;
  - the pinned Mathlib;
  - the pinned Tau Ceti (standard Borel version only).

  This roadmap owns it in §7.1.
- **Sources.** No new work is cited. The added locator is lafforgue-delasalle-2011 lines 513–515,
  where the proof of Theorem 1.18 splits each atom of a finite σ-algebra into `n` sets of measure
  `μ(A)/n` (read in the cached text). `needs-references.toml` was not written.
- **Lean.** `Suggested.lean` is unchanged, so no `#check @name` pass was rerun. The 19 elaborated
  types in `signatures.md` were compared with the README for the declarations H03 concerns:
  `schurNorm`, `schurCbNorm` and `schurNorm_two_eq` (the last with `[SigmaFinite μ]`). They agree.
- **Untrusted text.** The review contains no instructions beyond its review points; nothing
  suspicious.

## Build and gate

- **Build:** `lake build TauCetiRoadmap.SchattenClassesAndSchurMultipliers.Suggested` reports
  "Build completed successfully (18354 jobs)". There are 11 `declaration uses 'sorry'` warnings,
  one per theorem, and no errors.
- **Gate (after the commit):**
  `gate SchattenClassesAndSchurMultipliers: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- **Dependency check:** `depcheck: 2 roadmaps, 10 edges, 0 problem(s)`, with no UPWARD or CYCLE
  line.
