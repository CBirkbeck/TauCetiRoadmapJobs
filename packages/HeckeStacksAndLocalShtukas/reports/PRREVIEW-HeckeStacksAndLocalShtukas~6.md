# Review of HeckeStacksAndLocalShtukas (pull request #1252 at 025265d)

**Verdict:** needs changes

Incremental re-review of the 4 lines changed since 5775c9b, and the first check of the pull request's title and description against the head. The folder's two repairs are correct; the three findings are all in the pull request's text.

## R01 (P3) — The description says the Lean file states definitions and theorems; it declares nothing

**Location:** pull request description, paragraph “Roadmap folder …”: “the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti, every target is in the README.”

**Claim:** `Suggested.lean` contains definitions and theorems.

**Witness:** `TauCetiRoadmap/HeckeStacksAndLocalShtukas/Suggested.lean` lines 36–38: an empty namespace; its docstring (line 8) says “None of them is statable at the pins, so nothing is declared here.” The worker's change summary: Lean declarations added, 0.

**Repair:** “Roadmap folder `TauCetiRoadmap/HeckeStacksAndLocalShtukas` (README, `Suggested.lean`, `metadata.toml`). No headline theorem is statable against the pinned Mathlib and Tau Ceti, so `Suggested.lean` declares nothing: its module docstring names the six headline groups (HS1.5 and HS1.9; HS1.0; HS2.15; HS2.18; HS3.5, HS3.6 and HS3.8; HS4.1) with the carrier each lacks. Every target is in the README.”

## R02 (P3) — The validation sentence reports a `sorry` warning the build does not emit, and red-team passes “to follow” that have happened

**Location:** pull request description, paragraph “Validation”: “the targeted Lake build succeeds with `sorry` as the only warning; … AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, with author-side red-team passes to follow.”

**Claim:** The build warns of `sorry`; the red-team passes are still to come.

**Witness:** `lake env lean` on `TauCetiRoadmap/HeckeStacksAndLocalShtukas/Suggested.lean` at this head: exit 0, no output (no declaration, so no `sorry`). The branch history carries “red-team repairs” and five rounds of review repairs.

**Repair:** “Validation: the targeted Lake build succeeds with no warning (the file declares nothing); README identifiers absent from Lean, Check labels, round labels and empty Lean sections are all zero; no `set_option` overrides; the dependency gate shows no upward edge for this roadmap. AI assistance: GPT-6 (Codex) for the port from the accepted explorer package; author-side red-team and review repairs are included.”

## R03 (P3) — The pull request's title is not the roadmap's title

**Location:** pull request title: “Roadmap: Hecke stacks and local shtukas”.

**Claim:** The title names the roadmap it adds.

**Witness:** `TauCetiRoadmap/HeckeStacksAndLocalShtukas/README.md` line 1: “# Roadmap: Hecke stacks and local shtuka cohomology” (changed at 5775c9b; `Suggested.lean` line 4 has the same title).

**Repair:** Title the pull request “Roadmap: Hecke stacks and local shtuka cohomology”.

## Previous findings

- R01 — repaired: `README.md` line 996 reads “the automorphism `γ_i∘Frob^(−deg_ar(γ_i))` in the `i`-th leg”; no unbound `τ_i` remains in HS1.9 (the `τ` of lines 162, 1738, 1774 is a bound single Weil element).
- R02 — repaired: `README.md` line 2375 ends “is excluded because the uniform transport of HS1.9 must be a left action of `W_E^I` for every `G`; on a torus alone both signs are homomorphisms.”

## Verified sound

| Statement | Instance | Values | Result |
| --- | --- | --- | --- |
| HS1.9, `g_γ` in the bound variable (line 996) | `γ, γ′ ∈ W_E`, `deg_ar` additive, `Frob` central | `(γγ′)∘Frob^(−deg(γγ′)) = (γ∘Frob^(−deg γ))∘(γ′∘Frob^(−deg γ′))`; `γ = 1`: identity. Left action, same map as Conventions line 162 and HS2.18 line 1738 | agree |
| HS4.2 torus Check, exclusion clause (line 2375) | `ρ(γ) = ψ_γ∘g_γ^*`; torus; `GL_2` | `ρ(γ)ρ(γ′) = ρ(γ′γ)`: right action. Torus: `χ(rec)^{±1}` both multiplicative since `Λ^×` is abelian. `GL_2`, non-commuting images: `ρ(γ′γ) ≠ ρ(γγ′)` | agree |
| HS4.2 torus Check, value (line 2375, unchanged part) | `γ_2 = 1`; `γ_1 = γ_2` | `χ(rec_HS(γ_1))`; `χ(rec_HS(1)) = 1`, matching the API bullet `(γ,γ)∘create_V = create_V` | agree |
| HS4.2 against HS1.9 (cited by the changed clause) | cocycle at a fixed point | `ψ_(γγ′) = ψ_(γ′)ψ_γ`, so `γ ↦ ψ_γ⁻¹` is the homomorphism for every `G`: the “left action for every `G`” the new clause invokes is what HS1.9 line 999 states | agree |

Rows for untouched statements stand as in the previous review, of `5775c9b`.

- Gate rerun on this head: `OK`, every counter 0, exit 0. `lake env lean` on `Suggested.lean`: exit 0, no output; no declaration, so no signature probe and no padding probe.
- Dependency check: `depcheck: 246 roadmaps, 2258 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Merge order: AutomorphicGaloisRepresentationsPartII 173, BunGAndNewtonStrata 195, this roadmap 197.
- `git diff --stat origin/main...HEAD` outside the roadmap folder: empty. Diff 5775c9b..025265d: `README.md` only, 2 insertions, 2 deletions, both the replacement texts of the previous report.
- The diff changes no source locator, no cross-roadmap citation, no supplier and no Lean statement; the seeded sample has no target in the changed passages. Cross-references resolved inside the README: HS1.9 (line 995), HS2.18 (line 1738), Conventions (line 162).
- Description, summary block against the head, 14 claims checked and consistent: three directions of extension (Summary, lines 3–6); `ℤ_ℓ[√q]`-algebras, `ℓ ≠ p` (lines 131, 273, 572); solid-dual Demazure generation and no Iwahori retract or good-prime hypothesis (lines 690–721, 841–842); pinned-action finite quotient (lines 135, 581); equal characteristic (line 15); AdmissiblePairsAndPadicHodgeStructures as consumer of HS2.12 and HS2.15 (line 2599); Lubin–Tate, Drinfeld and unramified PEL inputs (lines 21–24); HS4.2–HS4.6 operations (lines 2300–2479); `CategoryTheory.ExactPairing` reuse (lines 170, 2302). “Adds a roadmap” matches the change (not on main, 2689 insertions, 0 removed headings).
- Overlaps: no other open pull request changes this roadmap, no cited id is dropped, none is defined only by an open revision (the worker's list, unchanged since r5; the diff adds no construction). Overlap check: read IgusaVarietiesAndTorsionConcentration, GeometricSatakeAndFusion, VStackSheavesAndLisseCategories (scope as cited in `README.md` lines 13–70); nothing shared — the changed passages own no object.
- Source independence: changed passages only — 2 passages compared with 1 source (FS, at lines 12908–12932, the torus computation), none shared; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- The sign Fargues–Scholze intend in Proposition IX.6.5 (FS lines 12915–12931) is not stated in the text; the README's value rests on its own transport convention in HS1.9, checked above.
- The description's generated blocks (`depends-on`, `merge-order`) are outside this check.

## Source issues

- none

## For the human reviewers

- none
