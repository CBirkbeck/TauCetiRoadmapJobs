# FIX-DESIGN-AmenableTracesOnCStarAlgebras~3: repairs for REV-DESIGN-AmenableTracesOnCStarAlgebras~2

Four findings (three P2, one P3). I checked all four against the pinned libraries, the
VonNeumannAlgebras roadmap on main and brown2006, and found all four correct. All four are
applied. Files edited: `packages/AmenableTracesOnCStarAlgebras/design/README.md` and
`packages/AmenableTracesOnCStarAlgebras/design/plan.json`. `sources.toml` needed no change: no
work was added or dropped, and every `cited_for` list still matches the sections that cite the
work. This is the design stage, so there is no `Suggested.lean`; no Lean statement changed and
no `#check` pass was run.

## REV-DESIGN-AmenableTracesOnCStarAlgebras~2/R01 (P2) — applied

**Verified.** `content/lake-manifest.json` lines 10 and 22 pin Tau Ceti
`2fd255d997f47c0b5d834ee416c7015d55444ce5` and Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`.
I opened the following at those pins:

- `KMS/Basic.lean`: `isKMSState_zero_iff` (any action, nonunital allowed), `IsKMSState.comp`,
  `IsKMSState.comp_of_surjective`, `IsKMSState.restrict`.
- `KMS/StateSpace.lean`: `kmsStates`, `convex_kmsStates`, `closure_kmsStates_inter_subset`
  (needs norm one), `isClosed_kmsStates` and `isCompact_kmsStates` (both unital only).
- `KMS/Dense.lean`: `isKMSState_trivial_iff`.
- `CStarAlgebra/GNS.lean`: `gnsVector`, cyclicity, recovery, `norm_gnsVector`.
- `KMS/Separating.lean`: `IsKMSState.eq_zero_of_apply_toPreGNS_one_eq_zero` (unital, any β).
- `Matrix/Frobenius.lean`: works over `RCLike`.
- `TraceFunctional/Radical.lean`: unital and algebraic only.
- `Matrix/Trace/Duality.lean`.

The design's claim "No Tau Ceti module is consumed" was false.

**Changed.**
- Pins: refreshed in the README and in the plan `baseline`.
- "From Tau Ceti": rewritten as 9 bullets, each giving declarations, files and what they do not
  include.
- Scope: now says what Tau Ceti supplies and what this roadmap owns.
- Conventions: `T(A) = kmsStates trivial 0`, `Ω = gnsVector`, `M_τ = VonNeumannAlgebra.adjoin`.
- §1.1: convexity, closure/compactness and general pullback are no longer targets. They are cited
  as native, through the 0-KMS identification. Polarization, unitary invariance and unital pullback
  remain targets. Added a pullback-norm Check.
- §1.2: bridges `N_τ` to `LinearMap.traceRadical` for unital `A`. Added a Check.
- §1.4: the native cyclicity, recovery, unit-norm and separating results are cited. Traciality of
  `τ''` is now routed through the Tau Ceti density theorem, with Kaplansky as an alternative.
- §1.5: uniqueness of `tr_k` via trace duality. Frobenius normalization with a Check.
- Also updated: Layer 1 Dependencies, the V0 bullet, the Mathlib GNS bullet, the §4.3 cyclic
  citation, the downstream line, and plan targets 1.1/1.2/1.4/1.5.

## REV-DESIGN-AmenableTracesOnCStarAlgebras~2/R02 (P2) — applied

**Verified.** In `TauCetiRoadmap/VonNeumannAlgebras/README.md`, the V13a text at main says
"contractive projection … of norm one when M≠0". In its `Suggested.lean`, `IsInjective` uses
`‖P‖ ≤ 1` and `tomiyama` needs `‖P‖ = 1`.

**Changed.** The V13a bullet changes from "equivalent to a norm-one projection `B(H) → M`" to:
"equivalent, for `M ⊆ B(H)` in a faithful normal representation, to a contractive projection
(`IsInjective`, `‖P‖ ≤ 1`), of norm one when `M ≠ 0`". I added the `H = 0` control: the zero
map has norm 0 and is contractive, but it is not a norm-one projection.

**Pattern check.** Grepped "norm-one"/"projection". Where Tomiyama's theorem is applied (§1.6,
§4.6), the range contains the unit of a nonzero algebra. §4.6 and §5.1 build u.c.p. projections,
which are contractive. The bullet now says this, and the plan's supplier `what` matches.

## REV-DESIGN-AmenableTracesOnCStarAlgebras~2/R03 (P2) — applied

**Verified.** The old §1.3 got traciality of the ideal extension from "the normal vector trace of
the weak closure of `π_τ(I)`", which is a §1.4 result. §1.4's nonunital case went back through
§1.3, so the route formed a loop.

**Changed.** I used the finding's second option: an independent elementary proof with its inputs
stated. Traciality is now proved directly:
`γ(ab) = lim τ((ea)(be)) = lim τ((be)(ea)) = lim γ(be²a) = γ(ba)`.
It uses only traciality on `I`, the GNS class map and `π_τ(e²) → 1` strongly.
- The §1.3 *Needs* line drops V1/V4 and adds the Tau Ceti `toGNS` items and Mathlib
  `tendsto_nhds_opNorm`.
- §1.4 now transports through "the unitization extension of §1.3 (its ideal-extension part is not
  used)".
- The API now gives the formula `γ(a) = lim τ(eae)`. Added two Checks.
- Plan 1.3 updated (statement, prerequisites, two tests).

The route is now unitization → GNS, with no edge back.

## REV-DESIGN-AmenableTracesOnCStarAlgebras~2/R04 (P3) — applied

**Verified.** Multiplicities `(N,0)` give `ρ(a,b) = a·1_N`, so `ρ(1,1) = 1_N` (unital) and
`ker ρ = 0 ⊕ ℂ` (not injective).

**Changed.** The §1.6 Check changes from "would make ρ non-unital and non-injective" to "unital,
`tr_N ∘ ρ = γ` exactly, but not injective; positive multiplicities make ρ an embedding". The
plan test "zero weight" is updated to match. Grepping "multiplicit" found no other occurrence of
this claim.

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §1.1 `T(A) = kmsStates trivial 0` | `M_2`, `ℂ²`, `c₀`, zero algebra | `tr_2(e₁₂e₂₁) = tr_2(e₂₁e₁₂) = 1/2`; `x₁₁` gives 1 vs 0; `ℂ²` gives `{t pr₁ + (1−t)pr₂}`; `T(0) = ∅` (no norm-one functional) | Holds; the native predicate includes norm one |
| §1.1 relative closure | `c₀`, `δ_n → 0` | limit norm 0 ≠ 1, so `0 ∉ T(c₀)`; the native theorem has a norm-one hypothesis | Kept the hypothesis; sharpened the Check |
| §1.1 unital pullback | `λ ↦ λe₁₁` vs `λ ↦ λ·1` into `M_2` | `tr_2∘ι = λ/2`, norm 1/2 (not a state) vs `id_ℂ`, norm 1 | Added a Check; the norm condition is necessary |
| §1.2 `N_τ = traceRadical τ` (unital) | `ℂ², pr₁`; `M_2, tr_2` | radical `{x : x₁y₁ = 0 ∀y} = 0⊕ℂ = N`; `ker tr_2 ∋ e₁₂` but `e₂₁e₁₂ = e₂₂` gives 1/2 ≠ 0; `N_{tr_2} = 0` | Holds; the kernel ≠ the radical (Check). Nonunital case stays ours |
| §1.3 `γ(a) = lim τ(eae)` | `M_2⊕0 ⊂ M_2⊕ℂ`, `e = (1,0)`; `c₀ ⊂ c`, `e_m = 1_{[1,m]}` | `tr_2(x)`; `Σ_{n≤m}2⁻ⁿx_n → Σ2⁻ⁿx_n = τ̃(x)` | Agrees with the unitization Check and §6.5 |
| §1.3 traciality chain | non-tracial `x₁₁` on `M_2`, `e = 1`, `a = e₁₂`, `b = e₂₁` | `(ea)(be) = e₁₁` → 1; `(be)(ea) = e₂₂` → 0 | The step needs traciality (Check) |
| §1.3 norm of `γ` | `e² ≤ e` | `‖Ω_I‖² = lim τ(e²) ≤ lim τ(e) = 1`, and `‖γ‖ ≥ ‖τ‖ = 1` | γ is a state |
| §1.3 uniqueness | `(1−e)² ≤ 1−e` for `0 ≤ e ≤ 1`; `c₀ ⊂ c`, `e_m` | `|γ(a) − γ(ea)|² ≤ (1 − τ(e_m))‖a‖² = 2⁻ᵐ‖a‖²` | Holds |
| §1.4 traciality via density | `M_2, tr_2`, `x = e₁₂`, `b = e₂₁` | `⟪Ω, x b̂⟫ = tr_2(e₁₂e₂₁) = 1/2`; `⟪(b*)^, xΩ⟫ = ⟪ê₁₂, ê₁₂⟫ = tr_2(e₂₁e₁₂) = 1/2` | Agree; the route needs only finitely many vectors |
| §1.4 nonunital transport | `c₀`, `τ = Σ2⁻ⁿδ_n` | `‖1̂ − ê_m‖² ≤ 1 − τ(e_m) = 2⁻ᵐ` | Uses only unitization (R03) |
| §1.5 `tr_k(x*y) = k⁻¹⟪x,y⟫_F` | `e₁₁ ∈ M_2`; `k = 1` | 1/2 vs `2⁻¹·1`; at `k = 1` both equal `x̄y` | Holds; Check added |
| §1.5 trace-duality uniqueness | `tr_2`, `x₁₁`, `k = 0` | `ρ = ½·1` (scalar) vs `ρ = e₁₁` (not scalar); `k = 0`: `ρ` empty, `τ(1) = 0 ≠ 1` | Uniqueness needs `k ≥ 1` (existing Check) |
| §1.6 `(N,0)` multiplicities | `N = 1`, `N = 3` | `ρ(1,1) = 1_N`, `ρ(0,1) = 0`, `tr_N(a·1_N) = a = γ(a,b)` | R04 Check corrected |
| V13a contract | `H = 0`; `H = ℂ` | zero map: `‖P‖ = 0 ≤ 1`, not `= 1`; identity on `B(ℂ)`: norm 1 | Matches `IsInjective`/`tomiyama` |

## Checks run

**Dependency gate.**

```text
candidate: AmenableTracesOnCStarAlgebras is not in the merge order yet; checked as if placed after CStarClassification (the intake inserts it when its design is accepted)
depcheck: 234 roadmaps, 2112 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The new suppliers are all Tau Ceti declarations at the pin, not
roadmaps.

**`roadmaps resolve`.** No cross-roadmap citation and no TauCetiRoadmap Lean name found nowhere.
The tool did not scan the pinned packages, so I checked every newly cited Tau Ceti and Mathlib
name, with its namespace, at the pins by hand. All exist.

**`plan.json`.** Parses as valid JSON.

## For the maintainer

- **No renamed headings.** No README section or plan target id changed, so other roadmaps'
  citations are unaffected.
- **Plan API names in 1.1 and 1.4.** In plan 1.1, the API items "convexity" and "closure and
  compactness" are gone and "pullback" became "unital pullback". In plan 1.4, "cyclic_separating"
  became "cyclic_rightRep". These were future names and are declared nowhere.
- **Ownership.** The duplication R01 found is with the pinned Tau Ceti, not with another
  roadmap; it is resolved by citing the library. Ownership against the open roadmap pull requests
  was not re-searched in this round: the brief's overlaps file reports no change to this roadmap.
- **Untrusted text.** Nothing in the review asked for actions outside the job.
