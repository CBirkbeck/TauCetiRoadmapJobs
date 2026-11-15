# FIX-RT-FinitenessAndDualityOfGroups~2: repair of red-team round 2

Two reviews: `RT-FinitenessAndDualityOfGroups~2a` (verdict accepted) states no finding; its round-one
table, ledgers, source issues and "For the human reviewers" section ask for no change, and none was
made because of them. `RT-FinitenessAndDualityOfGroups~2b` states two findings, settled below. Its
"For the human reviewers" section (BrownGTM87 untested; the unused plan gap) lists no finding and
changed nothing.

## RT-FinitenessAndDualityOfGroups~2b/F01 (P1) — applied differently

**What changed.** Old: 5.2–5.4 used universal covers of arbitrary CW complexes, 5.4(a) asserting
semilocal simple connectivity without owner. New: 5.1 paragraph (own *Needs:*) composing
AlgebraicTopology §4.7's local contraction with pinned `of_locallyContractibleSpace`,
`instDeltaGeneratedSpaceOfCWComplexUniv`, `UniversalCover.isQuotientCoveringMap`; one Check
(shrinking wedge); 5.2–5.4 cite 5.1; contracts, Layer 5 dependencies, Hatcher2002 added.

**Why differently.** The finding is right: `TauCeti.cellularResolutionOfIsAspherical`
(`TauCeti/AlgebraicTopology/EilenbergMacLane/Resolution.lean` line 57) needs a quotient covering
`p : E → B` with `E` simply connected, and `TauCeti.UniversalCover.isQuotientCoveringMap`
(`.../UniversalCover/Action.lean` line 162) and `TauCeti.UniversalCover.simplyConnectedSpace`
(`.../Covering.lean` line 183) assume `SemilocallySimplyConnectedSpace X`, which neither pinned
library proves for a general CW complex (searched both pins: the only CW files mentioning it are
`EilenbergMacLane/OneDimensional.lean`, as a hypothesis, and `ClassifyingSpace/Comparison.lean`, for
one specific model). But its claim that no roadmap owns the missing theorem is wrong:
AlgebraicTopology §4.7 on main (`TauCetiRoadmap/AlgebraicTopology/README.md` line 1768) owns "the
cell-neighborhood local contraction API for arbitrary Hausdorff CW complexes" (for `x ∈ U` open, an
open `V ∋ x` inside `U` and a homotopy `V × I → U` from the inclusion to the constant map). Applied
to the interior of a neighbourhood this is exactly Mathlib's `LocallyContractibleSpace`
(`Mathlib/Topology/Homotopy/LocallyContractible.lean` line 81). Stating the reviewer's proposed
target here would plan again what AlgebraicTopology plans, so the repair cites that owner instead
of adding a target, and records the composition once in 5.1. AlgebraicTopology is on main and
already a supplier; no gap is needed and `design/plan.json` is unchanged. The open revisions of
AlgebraicTopology keep the item: at the head of #1807 it is §4.7 with the same text, and at the
draft #1808 it is Stage 4 item 7.

The composed route was elaborated at the pins (scratch probe, not committed): for
`[T2Space X] [CWComplex univ] [PathConnectedSpace X]` and `hlc : LocallyContractibleSpace X`,
`IsQuotientCoveringMap (UniversalCover.proj) (FundamentalGroup X x₀) ∧ SimplyConnectedSpace
(UniversalCover x₀)` follows from `of_locallyContractibleSpace hlc`,
`UniversalCover.isQuotientCoveringMap` and instances (local path-connectedness comes from
`TauCeti.instDeltaGeneratedSpaceOfCWComplexUniv` and Mathlib's instance
`DeltaGeneratedSpace → LocallyPathConnectedSpace`, `Mathlib/Topology/Compactness/DeltaGeneratedSpace.lean`
line 51).

**Pattern.** Every use of a universal cover in the package was checked: 5.2 (route), 5.3 (`Ỹ` and
the cover after attaching cells), 5.4(a) (the cover of `|K|`, whose parenthesis asserted the
property; now cites 5.1 and `isQuotientCoveringMap`), and 6.6 through 5.2 (the finite CW complex
homotopy equivalent to `M`). The 1.4 Check mentions vertices of a universal cover only as an
illustration. Each of 5.2, 5.3, 5.4 now names 5.1 and `TauCeti.UniversalCover.isQuotientCoveringMap`
on its *Needs:* line. Hatcher's Theorem 2C.5, already mentioned in the §8.11a contract, is now
cited under the new manifest key with its page (p. 182), and the gap line
`gap:simplicial-replacement-dimension` gains that locator, since the theorem states the
same-dimension replacement (Hatcher2002 text, Theorem 2C.5, printed p. 182). The slug is unchanged.

**Source.** Hatcher2002 was fetched through the sources service from the author's page (licence
class author-page, status certified): Proposition A.4 at printed p. 522 (each point of a CW complex
has arbitrarily small contractible open neighbourhoods), the shrinking wedge of circles at §1.3,
printed p. 63.

## RT-FinitenessAndDualityOfGroups~2b/F02 (P3) — applied differently

**What changed.** Old: "(a field finitely generated as a ring is finite)" with no named input. New:
residue field of finite type over `ℤ` is a finite `ℤ`-module by `finite_of_finite_type_of_isJacobsonRing`,
`ℤ` Jacobson by `TauCeti.isJacobsonRing_of_quotient_span_singleton`, then not characteristic zero,
so finite (Brown1974 Lemma 2, lines 1303–1310). *Needs:*, Mathlib and Tau Ceti contracts, Layer 7
dependencies updated.

**Why differently.** The finding is right that 7.5 used an unnamed fact, and
`finite_of_finite_type_of_isJacobsonRing` exists (`Mathlib/RingTheory/Jacobson/Ring.lean` line 691).
The proposed repair is incomplete: it takes "`ℤ` being a Jacobson ring" as available, but the pin has
no `IsJacobsonRing ℤ` (a scratch `#synth IsJacobsonRing ℤ` fails at the pinned Mathlib, and neither
library states it). The repair adds the pinned input: Tau Ceti's
`TauCeti.isJacobsonRing_of_quotient_span_singleton` (`TauCeti/RingTheory/Jacobson/Ring.lean`
line 36) with the Jacobson radical of `ℤ` equal to `0` and each `ℤ/n`, `n ≠ 0`, finite, hence
Artinian, hence Jacobson (Mathlib instance, same Jacobson file line 102). The skeleton was elaborated
at the pins (the two elementary side facts left as `sorry` in the scratch probe; the instance
search `IsArtinianRing → IsJacobsonRing` and the application of the Tau Ceti criterion close).
The characteristic step is the reviewer's: a subgroup `ℚ` of a finitely generated abelian group
would be finitely generated.

**Pattern.** No other place in the README or `Suggested.lean` uses finite residue fields, Zariski's
lemma or finite type over `ℤ` (searched for "residue field", "finite type over", "finitely
generated as a ring", "Nullstellensatz", "Zariski").

## Checks

- **Elaboration.** `lake env lean packages/FinitenessAndDualityOfGroups/Suggested.lean` from the
  content checkout: exit 0, 18 warnings "declaration uses `sorry`" (the 18 admitted theorems), no
  error. `Suggested.lean` is unchanged by this round.
- **Signatures.** A scratch copy of `Suggested.lean` with `#check @name` for all 27 declarations was
  elaborated once: 27 types printed, no error; they are the types of the worker's signature file
  (the file is unchanged), each matching its README statement; nothing changed.
- **Dependency check** (command of the brief, run after the last edit):

      depcheck: 245 roadmaps, 2214 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the README lists the same four leads as before this round
  (lines now 723, 737, 1738, 2511: BieriEckmann1974 §3.3, BrownGTM87 §VIII.6, BieriEckmann1973 §1.5,
  which are source keys, and MotivicStructuresInModuliOfCurves §2.1, a board package named only as a
  downstream consumer); "Lean names found nowhere: None". Library names it did not check were
  checked at the pins by `#check` or by reading the file at the cited line:
  `TauCeti.UniversalCover.isQuotientCoveringMap`, `TauCeti.UniversalCover.simplyConnectedSpace`,
  `TauCeti.SemilocallySimplyConnectedSpace.of_locallyContractibleSpace`,
  `TauCeti.instDeltaGeneratedSpaceOfCWComplexUniv`,
  `TauCeti.WedgeSum.instSemilocallySimplyConnectedSpaceCircle`,
  `TauCeti.isJacobsonRing_of_quotient_span_singleton`, `finite_of_finite_type_of_isJacobsonRing`,
  `LocallyContractibleSpace`, `DeltaGeneratedSpace`.
- **Gate failures listed in the brief:** none were listed.

## Ownership

Local contractibility of CW complexes: owner AlgebraicTopology §4.7 (main), cited; found by
`roadmaps grep -i 'locally contractible'` over main and the open heads, which also shows
StableHomotopyKTheory §1.4 (strong local contractibility of realizations of simplicial sets, a
different and narrower carrier, itself built on AlgebraicTopology §4.7). Semilocal simple
connectivity and universal covers: pinned in Tau Ceti. `IsJacobsonRing ℤ`: one application of a
pinned Tau Ceti criterion inside the route of 7.5, not a target. No declaration of `Suggested.lean`
was added or renamed.

## Adversarial pass on the new and changed statements

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 5.1: a Hausdorff CW complex is locally path-connected and locally contractible, hence SLSC | point; `S¹` (one 0-cell, one 1-cell); two-point discrete; `S^∞`; wedge of uncountably many circles | point: `V = U`; `S¹`: arcs; discrete: `V = {x}`; `S^∞`: contractible; wedge: SLSC by the pinned instance for any index type | holds; §4.7's open-`U` form gives Mathlib's form by taking interiors |
| 5.1: path-connected `X` ⇒ `UniversalCover x` simply connected, projection a quotient covering for `π₁(X, x)` | point; `S¹`; two-point discrete (not path-connected); empty | point: cover = point, `π₁ = 1`; `S¹`: `ℝ → S¹`, `ℤ` by translation, `ℝ/ℤ = S¹`; discrete: fibre over the other point empty, so surjectivity fails and the hypothesis is needed; empty: `PathConnectedSpace` includes nonemptiness | holds; universes: `UniversalCover x`, `FundamentalGroup X x : Type u` as `cellularResolutionOfIsAspherical` requires |
| 5.1 Check: shrinking wedge `H` not SLSC, no CW structure | `C_n ⊂ B(0, 2/n)`; retraction `r_n : H → C_n` | `r_n` continuous (pasting on `C_n` and `⋃_{m≠n} C_m`, closed, meeting at `0`); `r_n ∘ loop_n` generates `π₁(C_n) ≅ ℤ`, so `loop_n ≠ 1` in `π₁(H)`; a CW structure would make `H` SLSC | holds; countable wedge with weak topology SLSC (pinned) |
| 5.2 route with 5.1 | `G = 1`, point; `ℤ²`, torus | resolution `R` in degree 0; `0 → Rℤ² → (Rℤ²)² → Rℤ² → R → 0` | unchanged, now with the covering input named |
| 5.3 route with 5.1 | `Y` = `(n−1)`-skeleton, `n ≥ 3` | `Y` path-connected, `π₁(Y) ≅ G` (§8.1, `n − 1 ≥ 2`), Hausdorff CW; after wedging spheres and attaching cells again Hausdorff CW | holds |
| 5.4(a) parenthesis | `|K|` | Hausdorff (`instT2SpaceRealization`), CW on `univ` (`realizationCWComplex`), path-connected (a `K(Γ, 1)`), `π₁(|K|) ≅ Γ` | holds |
| 7.5 residue fields of a finitely generated `S ⊂ K` are finite | `S = ℤ` (`K = ℚ`); `S = ℤ[1/2]`; `S = 𝔽_p[t]` (`K = 𝔽_p(t)`); `S = ℤ[i]` | `𝔽_p`; `𝔽_p`, `p` odd (`2` a unit); `𝔽_{p^d}` for an irreducible of degree `d`; `𝔽_p` or `𝔽_{p²}` | holds; `ℚ` is not of finite type over `ℤ` |
| `ℤ` Jacobson via the Tau Ceti criterion | `x = 1`; `x = 6`; Jacobson radical | `ℤ/1 = 0` (Jacobson); `ℤ/6` finite, Artinian; `⋂_p (p) = 0` (a nonzero `n` misses `(p)` for `p ∤ n`) | holds |
| characteristic step | char `0`; char `p` | `ℚ ⊆ k` would be a finitely generated subgroup, false; `k` a finitely generated `𝔽_p`-module, finite | holds |
| Hatcher2002 locators | Proposition A.4; §1.3; Theorem 2C.5 | source text at printed pp. 522, 63, 182 (PDF pages 531, 72, 191) | hold |

## For the maintainer

- New supplier edge: AlgebraicTopology §4.7 (on main, already a supplier). No Lean name changed;
  no id this roadmap defines changed; no other roadmap is affected.
- `sources.toml` gains Hatcher2002 (certified, author page).
- No suspicious instruction was found in the reviews or fetched texts.
