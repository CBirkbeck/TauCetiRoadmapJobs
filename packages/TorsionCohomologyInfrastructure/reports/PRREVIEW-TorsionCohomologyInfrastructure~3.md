# Review of TorsionCohomologyInfrastructure (pull request #1087 at 264642f)

**Verdict:** needs changes

## R01 (P3) — The description's AI-assistance sentence predates the red-team and review rounds

**Location.** Pull request description, the paragraph beginning "Validation:": "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, with author-side red-team passes to follow."

**Claim.** At this head the red-team passes are still to come, and the port is the only AI-assisted work.

**Witness.** `git log origin/main..HEAD`: four commits titled "red-team repairs" (c7bcbc4a, dc678ea0, 6a6dc6c8, 5844ca18) and two review-repair commits (2199ac58, 264642f6) follow the port 1f397e91. `CONTRIBUTING.md` line 125: "Use descriptions that reflect the work actually done."

**Repair.** Replace the sentence by one that describes the head, naming the models actually used, for example: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package; author-side red-team passes (four repair commits) and the repairs of two AI review rounds were then applied with <model(s)>."

## Previous findings

- R01 — repaired: the bullet "**AutomorphicGaloisRepresentationsPartII** (its nonselfdual existence layer) uses Layer 3a …" is deleted; `## Downstream consumers` now lists IgusaVarietiesAndTorsionConcentration and the generic CM-field bullet only. No other passage names it as a consumer.

## Verified sound

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| §3a.2 `twisted_product_separation` (cited by the deleted bullet) | `n=1`, ℚ, `u=2`, `P=1−aX`, `Q=1−bX`, swapped pair | `PQ` equal; weighted products equal iff `a/2+2b = b/2+2a`, i.e. `(3/2)(b−a)=0`, `a=b`; `1−u²=−3` a unit | true | none |
| §3a.2, negative control | ℤ/9, `u=2`, `(P,Q)=(1+3X,1)`, `(P′,Q′)=(1,1+3X)` | `u⁻¹=5`; both weighted products `1+6X`; `P≠P′`; `1−u²=6` not a unit, hypothesis fails | consistent | none |
| §3a.2, negative control | ℤ/8, `u=3`, `(1−X,1)` vs `(1,1−X)` | `u²=1`, `u⁻¹=3`; both weighted products `1−3X`; `1−u²=0` | consistent | none |
| Conventions / §4.3 `P_v` (cited by the remaining consumer bullets and the description's summary) | exponents; `n=1`, `U_1=1` | `i(i+1)/2 + i(n−i)/2 = i(n+1)/2`, the two forms agree; `P_v = 1−q_vX` | true | none |
| Deleted bullet against the merge order and the citing roadmaps | ORDER.txt; `roadmaps grep TorsionCohomologyInfrastructure` | AutomorphicGaloisRepresentationsPartII at line 170, this roadmap at 189; its head has no citation of this roadmap; no open roadmap cites §3a | deletion breaks nothing | none |

The rows for untouched statements stand as in the previous review, of `2199ac5`.

- Change since `2199ac5`: one deleted line in `TauCetiRoadmap/TorsionCohomologyInfrastructure/README.md`, nothing outside the folder; no statement, locator, `*Needs:*` line or Lean declaration changed, so the seeded sample falls in no changed passage.
- Gate at 264642f: every check passed. Dependency check re-run: `depcheck: 245 roadmaps, 2247 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/TorsionCohomologyInfrastructure/Suggested.lean`: five `sorry` warnings (lines 53, 75, 84, 104, 144), nothing else; the eleven elaborated signatures equal those read at `2199ac5`.
- Description against the head, sentence by sentence: the summary block (uniform `N([F:ℚ], n)`, determinant of `G_{F,S}` with `P_v`, integral, residual and local forms, four-route compatibility, Scholze's all-prime formal models against the Pilloni–Stroh form at `p = 2`, the CM branch through Shin and `(EC)_{≤n}` otherwise) agrees with README lines 116, 349, 687, 806, 840; the prose paragraph is the README's Summary; folder contents (three files), eleven real-bodied declarations, single `import Mathlib`, no `set_option` and the validation counts agree with the gate. It names no consumer that the head dropped. Only the sentence of R01 fails.
- Roadmaps named in the README, 24: 7 on main, 14 in the description's dependency block, IgusaVarietiesAndTorsionConcentration as consumer; PerfectoidQuotients §2.1 is named at line 109 only as "not an input here" (remark, no change asked).
- Citation resolver's one lead ("IntegralHeckeAndGaloisDeterminants has no Layer 3", line 57) is the false positive recorded in the previous review: the text cites Layer 3a.
- Overlap check: read PerfectoidShimuraVarieties, IgusaVarietiesAndTorsionConcentration, PotentialAutomorphyInfrastructure, PerfectoidSpaces; nothing shared (the first and last are cited suppliers, the other two cite §§2–4 here as consumers).
- Source independence: changed passages only; the change adds no text, 0 passages compared; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- Unchanged from the previous review: Huber, Proposition 2.5.8; Atobe–Gan–Ichino–Kaletha–Mínguez–Shin §§0.3–0.4; Labesse, Pilloni–Stroh and Milne (used through suppliers); the published pagination of Caraiani–Le Hung. No source was needed for this change.
- Which models produced the red-team and review-repair commits: the repository does not record it, so the repair of R01 leaves the model names to the author.

## Source issues

- none

## For the human reviewers

- none
