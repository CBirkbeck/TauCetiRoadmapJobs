# Review of GrothendieckTeichmuller (pull request #1058 at c77a80f)

**Verdict:** accepted

Incremental re-review of 3 changed lines since 2742151: `TauCetiRoadmap/GrothendieckTeichmuller/README.md` loses the two-line remark on Grothendieck's working notes that closed §4.3 (and its blank line), and the pull request's description was rewritten. No finding.

## Previous findings

- R01 — repaired: the description now reads "Sources: Drinfeld 1990, Ihara 1991, Lochak–Schneps 1994, Schneps 1997 and Guillot 2014 for the definitions and theorems, with Ribes–Zalesskii 2010 and Herfort–Ribes 1985 … Harbater–Schneps 2000 … (4.5); Ihara 1994, … for the scope". It omits the Montpellier notes, as the head now does.
- R02 — repaired: the description now reads "Layer 2 the six generators `x_{ij}` of the pure braid group `P₄`, its profinite completion `P̂₄` and the pentagon relation (III) there; Layer 3 Drinfeld's relations (I) and (II), the monoid `GT̂^{mon}` cut out by (I)–(III)".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §4.3, `c = (−1, 1) ∈ GT̂`, `c² = 1` (the section the deletion is in) | `λ = −1`, `f = 1` | `m = −1`. (I): `1·1 = 1`. (II): `z⁻¹y⁻¹x⁻¹ = (xyz)⁻¹ = 1`. (III): `1 = 1`. `c·c = (1, β_c(1)) = (1, 1)` | holds | none |
| §4.3 Check, "`(λ, 1)` satisfies (II) exactly for `λ = ±1`" (the case `f = 1` the deleted remark was about) | `λ = 3` and `λ = 5` in the dihedral group of order 6; `λ = ±1` | `λ = 3`: `m = 1`, `r⁻¹ t s = r⁻² ≠ 1`. `λ = 5`: `m = 2`, `r⁻² ≠ 1`. `λ = 1`: `m = 0`, `1 = 1`. `λ = −1`: `r⁰ = 1` | holds | none |
| §4.3 after the deletion: Checks and dangling references | grep of the README for the notes, the folder number and the URL | 0 hits. §4.3 keeps 3 Checks. The References section never listed the notes, so no entry is orphaned | holds | none |
| Description, sources sentence, against the head | grep of each of the 18 sources named | All 18 are cited in the role given: Ihara 1994 only at README:47 (Scope); Harbater–Schneps at :49 (Scope) and :628 (4.5); Herfort–Ribes :213; Grothendieck 1984 :84 | holds | none |
| Description, layer clauses | README §2.4, §3.1, §3.3, §3.5 | (III) is defined in Layer 2; Layer 3 has (I), (II), `GT̂^{mon}`, `GT̂ ⊆ GT̂₀` and the five-term form | holds | none |
| Description, "adds the roadmap"; "15 `sorry`s" | `origin/main...HEAD` on the folder; elaboration | Not on main: 1017 insertions, 0 deletions. 15 warnings, all "declaration uses `sorry`" | holds | none |
| Description, the three supplier citations | BelyiMaps on main; InverseGaloisAndArithmeticFundamentalGroups at its open head | §12.8 at main :4880. §IG.1.2 at :1026 and §IG.5.1 at :5424 of the open head | holds | none |

The rows for statements this change leaves untouched stand as in the previous review, of 2742151.

- **Scope of the change.** The folder diff since 2742151 is 3 deleted lines of README.md (the remark after the §4.3 Checks). No statement, heading, supplier or Lean declaration changed. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Gate.** Rerun at this head: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's run adds `build=0`.
- **Dependency check.** Output: `depcheck: 245 roadmaps, 2229 edges, 0 problem(s)`. It has no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean` on `Suggested.lean`: exit 0, 15 `sorry` warnings, 0 errors. Pins: Tau Ceti 2fd255d9, Mathlib 1b1ccf4b.
- **Source locators checked:** 0. The change adds no locator and removes one (the notes).
- **Cross-roadmap citations resolved:** 3 (above). The overlaps tool finds no dropped id, no id defined only by an open revision, and no other pull request that changes this roadmap.
- **Seeded sample.** Of its targets only §4.3 falls in the changed passage; its two rows are above. The others stand as in the earlier reviews.
- Remark: §4.3 now carries no source locator. Its claims are the direct computations of the first two rows.

Overlap check: read ProfiniteArithmetic, ProfiniteProPGroups and PeripheralActions (main), ProfiniteArithmetic (#775) and InverseGaloisAndArithmeticFundamentalGroups (#850); nothing shared. The owners are as in the previous review: BelyiMaps §12.8 owns the outer Galois action, Tau Ceti owns `ẑ`, `x ^ᶻ a` and `ContinuousOut`, and this roadmap alone owns `GT̂`, `Param`, `β` and relations (I)–(III).

Source independence: changed passages only: the diff adds or changes no passage (it deletes one remark), so 0 passages compared with 0 sources. No layer was added, removed or reordered, so the arrangement was not compared again. Largest share of locators: Schneps 1997, 17 README lines.

## Not verifiable

- No new items. Mel'nikov 1978 (no legal copy) and the source-version limits recorded by earlier reviews still stand. They concern untouched text.

## Source issues

- none

## For the human reviewers

- Not tested this round: wording and arrangement were compared on changed passages only, and the change adds none. Schneps 1997 holds the largest share of locators (17 README lines) and was not reopened.
