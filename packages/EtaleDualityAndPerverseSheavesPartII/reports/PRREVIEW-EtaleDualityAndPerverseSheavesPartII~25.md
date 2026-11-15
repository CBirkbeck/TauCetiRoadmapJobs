# Review of EtaleDualityAndPerverseSheavesPartII (pull request #1743 at b826e54)

**Verdict:** accepted

Incremental re-review of the 2 lines changed since 5818348 (the author of the `ILO-final-XIII` reference entry), plus the check of the pull request's title and description against this head. No finding.

## Deferred findings

- D01 — stands

## Previous findings

- R01 — repaired: the summary block now reads "Part I stops at separated finite-type schemes over a field or an excellent regular base of dimension at most one", which agrees with `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:7`.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| References, `ILO-final-XIII` entry (`README.md:1684`), the changed line | author, title, pages, locator against the cached text | ILO-final-XIII lines 6 and 23: Fabrice Orgogozo; line 9: exp. XIII, pp. 261–275; Théorème 2.2.2 at line 99 and §2.2.3 at line 109, both on PDF page 4 = printed p. 263 | Entry now correct |
| §2.4 (cites the entry), X = Spec R, R a strictly henselian DVR, Z = {s} | constant hypercover X_i = X | X regular, affine, connected; U_T = Spec K = complement of the snc divisor {s}, r = 1 branch | Holds |
| §2.4, the empty case | X = Spec k[x], Z = {0}, a term T = Spec k over 0 | U_T = ∅ and T lies over Z, as the statement requires; Z = X is excluded by "dense complement" | Holds |
| §4.1 (cites the entry), j : Spec K → Spec R as above, F = ℤ/ℓ, ℓ invertible | stalks of R^q j_*ℤ/ℓ at s | q = 0: ℤ/ℓ; q = 1: Hom(ℤ_ℓ(1), ℤ/ℓ) = ℤ/ℓ(−1), rank 1; q ≥ 2: 0 (cd_ℓ K = 1). Ranks (1,1), as the Layer 4 example for r = 1 | Constructible; agrees |

The rows for all other statements stand as in the previous review, of `5818348`.

- Source locators checked against the text: 4 (ILO-final-XIII lines 6, 9, 23 for author and pages; lines 99 and 109 for Théorème 2.2.2 and §2.2.3, p. 263). The other mentions of Exposé XIII in the README (`:634`, `:826`, `:830`, `:848`, `:862`) name no author, and `Suggested.lean` does not mention it; nothing else depends on the changed line.
- Gate on this head, run again: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (exit 0); the worker's run adds `build=0`. No file changed outside the folder.
- Dependency check (`--movable --pr 1743`), full output: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/Suggested.lean` exited 0; the only warnings are nine "declaration uses `sorry`" (lines 84, 107, 200, 244, 281, 301, 316, 339, 361). The diff does not touch the Lean file, so the binder check of the earlier reviews stands.
- Title and description read against the head: a new roadmap (2081 lines added, nothing removed; folder holds README, `Suggested.lean`, `metadata.toml`); nine headline theorems (9 `theorem` declarations: 3 Cohen–Gabber, 2 partial algebraization, 1 + 1 + 1 + 1); the five suppliers named as on main are on main; the ten other suppliers are the ten `From TauCetiRoadmap.*` headings not on main, all earlier in the merge order (latest AdicCoefficientsAndComparisonsPartII, line 396 against 397); PerfectoidQuotientsPartII §§Q5.1–Q5.3, Q6.2–Q6.7 as at `README.md:158`, `:1652`; PurityForFlatCohomology named only as a consumer (`README.md:23`, `:1656`) and its §§1.4–1.5 still present at its open head; summary block agrees with `README.md:7` and the layer headings. No sentence is contradicted and no change is left unstated.
- Overlap check: read PurityForFlatCohomology (open head a825987) and the scope of EtaleDualityAndPerverseSheaves this round; AdicCoefficientsAndComparisonsPartII, ClassicalAdicEtaleCohomology, LefschetzPencilsAndVanishingCycles, EtaleCohomologyFoundations, SchemeAndStackFoundations, ResolutionOfSingularitiesCharacteristicZero were read in the previous reviews and the diff changes no ownership; nothing shared except §§6.11, 6.12, 7.1, 7.3 with PurityForFlatCohomology §§1.4–1.5, owner this roadmap (D01). The worker's overlap listing reports no pull request changing this roadmap and no dropped or revision-only id.
- Source independence: changed passages only; 1 passage (a bibliographic entry) compared with 1 source (ILO-final-XIII lines 6–9, 23), nothing shared beyond the author's name and the title; no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- Ill03, Epp73 and Ser65 are settled as uncertified and cited by locator; none is cited in the changed passage.
- The description's sentence on AI assistance (the number of review and red-team rounds) is not a statement about the head and was not checked.

## Source issues

- none

## For the human reviewers

- **Ownership.** PurityForFlatCohomology at a825987 still states §1.4 and §1.5 (`README.md:1123`, `:1176`) and says this roadmap "is to import" them (`:3497`), while this roadmap owns §§6.11–7.3 (`README.md:23`). The repair lies in that roadmap; the merge order lists it first (line 224 against 397).
