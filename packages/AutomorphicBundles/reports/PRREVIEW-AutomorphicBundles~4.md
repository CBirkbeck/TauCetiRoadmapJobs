# Review of AutomorphicBundles (pull request #1069 at 1de5571)

**Verdict:** accepted

Incremental re-review of 0 changed lines in the folder since `fd74684` (the head merges main; the folder's three files are identical). This round read the pull request's title and description against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads "From a Shimura datum it uses the shared coefficient group of ShimuraData §4.9 to construct the associated bundles of its torsors", as the README's Summary, Scope and 0.1 do.
- R02 — repaired: the Validation paragraph now reads "with author-side red-team passes, and Codex for `Suggested.lean`; Claude Fable 5.1 for corrections of target numbering, supplier citations, …"; "to follow" is gone.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `finiteTensorStabilizer` (the one Lean statement the description cites) | trivial group on `V = 0`; trivial group on `V = k`; `𝔾_m` on `V = k` by scalars; `SL₂` on `k²` | `V = 0`: `g = id` only, both sides true for any `t`. Trivial on `k`: `t = ι(v,0)`, `g·(1⊗v) = 1⊗v` forces `g = 1` in `A^×`, also for nonreduced `A`. `𝔾_m`: `n = 0`, stabilizer `GL₁`. `SL₂`: `e₁e₂ − e₂e₁ ↦ det(g)·` itself, stabilizer `SL₂(A)` | agrees | none |
| `mixedTensorAction` convention (same statement) | `g` on `ι(v,φ)` | `ι(v,φ) ↦ ι(gv, φ∘g⁻¹)`; pairing `φ(v) ↦ (φ∘g⁻¹)(gv) = φ(v)` invariant, so the dual is the contragredient, not the transpose | agrees with the docstring | none |
| Description: "the `sorry` of `finiteTensorStabilizer` as its only declaration warning" | `lake env lean` on `TauCetiRoadmap/AutomorphicBundles/Suggested.lean` at this head | one line of output: `79:8: warning: declaration uses sorry` | true | none |
| Description: "Roadmaps on main are cited by name; everything else named in the README is a consumer" | the 34 roadmaps of the README's supplier contracts, against main (`1a19c9f`) and the description's dependency list | 15 on main (two of them, AdelicAlgebraicGroups and PerfectoidTowers, ticked in the list); the other 19 are exactly the 19 unticked entries; none unaccounted | true | none |

The rows for all other statements stand as in the previous review, of `fd74684`; the folder did not change.

- Gate at `1de5571` (worker's run): every rule 0, `build=0`, `depcheck=0`, `outside-folder=0`, "Every check passed". Dependency check re-run: `depcheck: 245 roadmaps, 2253 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line; the roadmap is at line 185 of the merge order.
- Elaboration: `sorry` the only warning; the three elaborated signatures agree with the worker's file (`[CharZero k]`, `[FiniteDimensional k V]`, the comodule instance and `IsFaithful` present; no section binder lost).
- Change against the base: `git diff --stat origin/main...HEAD` outside the folder is empty; `git diff fd74684 HEAD` on the folder is empty; folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- Pull request text, read against the head (title, summary block and prose): 14 claims checked, all agree. Title = README title. It adds a roadmap (not on main; 0 headings and 0 declarations removed). Summary block: reflex-field canonical bundle, Hodge-parabolic bundles, full-group realizations, canonical and subcanonical extensions (Scope, Layers 0–6); good-prime PEL and ramified Hilbert models, `p = 2` (README lines 59, 3220, Layers 7, 11, 12); consumers named match Downstream consumers; `SlashAction` adapter and "no second modular-form carrier" (11.4, line 111); finite tensors, central-isogeny descent, no family of motives (1.1, 1.9, lines 1245, 1254); central units at neat level (lines 162, 470, 485); parabolic representations get no flat connection (lines 27, 633); `HodgeLineFJ` reused from ShimuraCompactifications §7.15 (lines 95, 360). "The Lean imports none of them": imports are `Mathlib` and two `TauCeti.*` modules.
- Cross-roadmap citations resolved this round: 34 supplier names against main and the open list (above); sections as resolved in the review of `fd74684`, no folder change since.
- Seeded sample: none of its fifteen targets lies in a changed passage (there is none); source locators checked this round: 0.
- Overlap check: read ShimuraCompactifications, HodgeTateAndCanonicalSubgroups, PerfectoidShimuraVarieties (owners as in the review of `fd74684`: scalar `HodgeLineFJ` — ShimuraCompactifications §7.15; `Gᶜ` — ShimuraData §4.9; canonical subgroups — CohomologyComparisons §6.2; Layer 10 towers and `VB⁰` — this roadmap); the overlap list at this head has no dropped id, no second copy, no other pull request changing this folder.
- Source independence: 0 passages compared (changed passages only: the folder has none); largest share Milne90, 39 of 202 locators; contents not compared again (no layer added, removed or reordered).

Remark (untouched text, no change asked): Downstream consumers names AutomorphicGaloisRepresentationsPartII, PadicFamilies and IntegralIwasawaTheory, which the merge order places before this roadmap.

## Not verifiable

- The description's attribution of AI assistance (which model did which pass) is not checkable from the repository.
- The items of the earlier reviews' lists (FC90, HarrisLoc, the Annals pages of CS and AG, DLLZ, DLLZRH, LLZ) stand as there; nothing changed depends on them.

## Source issues

- none

## For the human reviewers

- none
