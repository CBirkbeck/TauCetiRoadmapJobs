# Review of DiamondsAndVStacksPartII (pull request #1830 at ab59491)

**Verdict:** accepted

Incremental re-review of the 128 lines of `TauCetiRoadmap/DiamondsAndVStacksPartII/README.md` changed since d2165a4 (64 insertions, 64 deletions; `Suggested.lean` and `metadata.toml` unchanged), and of the pull request's title and description against this head. No finding.

## Previous findings

- none to account for: the review of d2165a4 was an acceptance with no finding (its `## Previous findings` recorded R01–R04 of the first review as repaired, and the passages it quoted are unchanged at this head).

## Verified sound

**Adversarial pass** (statement | instances | values computed | result | change).

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| D7.3 (reworded) | identity; cuspidal `t ↦ (t², t³)`; `Spa L → Spa K`, `L/K` finite of degree 2 | identity gives `id`; cusp: residue degree 1, diamonds equal; `Spa L → Spa K`: 1 point → 1 point but 2 points after base change to `C`, so not universal, and `Spd L → Spd K` has degree 2 | same hypotheses and conclusion as before the rewording; SW20 line 3120 | none |
| D8.13 (reworded) | `A = ℤ_p`: `F = Spd 𝔽_p`, `F = Spd ℤ_p`, `F = ∅`; non-example `Spd ℚ_p` | `J = (p)`, `(p)`, `(1)`, each open; `(F^red)^⋄ = Spd 𝔽_p`, `Spd 𝔽_p`, `∅`; `Spd ℚ_p → Spd ℤ_p` is open, not closed, so excluded | holds; GLE line 1367 | none |
| D10.13 (2) (reworded) | `𝔛 = Spf O_E`; cuspidal `Spf O_E⟨x,y⟩/(y² − x³)` | `End = {id}` on both sides; cusp is flat, separated, topologically of finite type, not seminormal (`y/x`), and by (1) has the v-sheaf of `Spf O_E⟨t⟩`: fullness fails without the fourth hypothesis | the four hypotheses equal AGLR line 725–726 | none |
| D11.11 (reworded) | `(Spd O_E, Spd E)`; nonzero perfect discrete `k`-algebra with `D = ∅`; `Spd(L, L⁺)` of rank 2 | reduction a point, `sp` 1 → 1, `Spd E` cJ, valuative: rich; `sp : ∅ → ≥ 1 point` not surjective: not rich; rank-2 pair not cJ: not rich | the four conditions equal GLE line 1857–1858, reordered | none |
| 12 new section openings (D8.1, D8.3, D8.8, D9.2, D9.4, D9.8, D9.10, D9.12, D11.1, D11.5, D11.8, D11.11) | each of the 68 consumer claims against the consumer's `*Needs:*` line | 67 appear in the named target's `*Needs:*` line; the 68th (D11.15 applies D11.8) is in D11.15's proof sketch ("cJ by Huber's density theorem (D11.8)") | consistent | none |
| 24 targets demoted from `###` headings to bold labels (D8.2, D8.4–D8.7, D8.9–D8.13, D9.3, D9.5, D9.6, D9.9, D9.11, D9.13, D11.2–D11.4, D11.6, D11.9, D11.10, D11.12, D11.13) | every `D8.*`, `D9.*`, `D11.*` id in `*Needs:*`, Dependencies and Downstream consumers; GeometricSatakeAndFusionPartII's citations at its open head (§D10.12, D10.13, D10.15, D11.4, D11.5, D11.18–D11.20) | all 24 labels present once each with statement, proof sketch, Checks, locator and `*Needs:*` unchanged; every cited id resolves to a heading or a label | no id dropped | none |
| D9.1 `exists_tate_specialization` (cited by the changed D9.2 and D9.4 openings) | elaborated signature | `∀ {A} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] [Huber.IsTateRing A] (P : Huber.Pair A), ∃ sp, (∀ x a, a ∈ (sp x).asIdeal ↔ x.valuation a < 1) ∧ Surjective sp ∧ IsSpectralMap sp ∧ IsClosedMap sp` | equals D9.1 | none |

Rows for the untouched statements stand as in the previous review, of d2165a4.

**The pull request's text against this head** (step 8): title and every sentence of the description's prose and summary block read against the README and `Suggested.lean`.

| Sentence of the description | At the head | Result |
|---|---|---|
| adds a roadmap; folder holds README, `Suggested.lean`, `metadata.toml` | folder not on main; exactly these three files; outside-folder diff empty | agrees |
| "past DiamondsAndVStacks D6" | Scope: "DiamondsAndVStacks stops at D6.9" | agrees |
| recovery of flat normal formal schemes locally formally of finite type and proper flat normal schemes over a complete mixed-characteristic DVR | D10.11, D10.12 over `O_E` (Conventions: complete, discretely valued over `ℚ_p`, perfect residue field) | agrees |
| quotient theorem, `π₀` bijection, specialization triples | D11.13, D11.14, D11.18 | agrees |
| explicit hypotheses: closed specializations; algebraically closed residue field | D11.14 and D11.20 state both | agrees |
| every `p`; no finiteness or separatedness; no finite-type hypothesis; no noetherianity | Conventions; D7.6 ("No finiteness or separatedness hypotheses"); D7.3; D9.7 | agrees |
| `Valuation.ltIdeal`, `constructibleTopology` | Scope, fourth paragraph | agrees |
| consumers GeometricSatakeAndFusionPartII, HeckeStacksAndLocalShtukas | Downstream consumers names both with the same uses | agrees |
| one headline statable (Tate specialization); the others wait for the v-site and formal schemes | `Suggested.lean`: one theorem, one real-bodied definition; docstring lists 23 non-statable entries | agrees |
| validation counts all 0 | gate at ab59491: every counter 0 | agrees |

The description names no section number, so the regrouping of sections since d2165a4 leaves it accurate; no headline, declaration or supplier was added or removed since d2165a4.

- Gate at ab59491 (worker): every counter 0, `build=0 OK`. Dependency check re-run: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Outside-folder diff `origin/main...HEAD`: empty.
- Elaboration: a scratch copy of `Suggested.lean` with `#check @reductionSpectrum` and `#check @exists_tate_specialization` elaborated under `lake env lean` with `sorry` the only warning; both elaborated types equal those of `scratch/signatures.md` and D9.1; no `variable` block, so no binder lost. The file is byte-identical to d2165a4, so the one-tactic probe of the earlier review stands.
- Seeded sample, where it falls in the changed passages (4 targets, locators read in the text): D8.12 — GLE Lemma 3.30 at line 1354 (p. 27), Lemma 3.32 at line 1376 (p. 28); D9.13 — GLE Definition 4.26 at line 1639 (p. 33), Step 3 of the proof of Theorem 4.27 at line 1665 (p. 34); D11.4 — GLE Proposition 4.17 at line 1516 (p. 30), Proposition 4.31 at line 1683 (p. 34), Remark 4.37 at line 1716 (p. 35); D11.12 — GLE Definition 4.52(3) with footnote 7 at lines 1860–1861 (p. 37). All agree with the README.
- Source locators checked against the text this round: 13 (the 9 above; GLE Lemma 3.31 line 1367; GLE Definition 4.52(1)–(2) line 1857; AGLR Theorem 2.16 line 725; SW20 Proposition 10.2.1 line 3120).
- Cross-roadmap citations in the changed lines: AdicSpacesPartII R0.18 with `gap:completed-residue-fields-general-universal-homeomorphisms` (D7.3) and SchemeAndStackFoundations §0.26 with `gap:absolute-weak-normality-formal` (D10.13), both unchanged declared gaps with the slugs of the plan. The citations tool's one lead, `FormalScheme.FSC`, is AdicSpacesPartIII R2.9's name, as in the earlier reviews.
- Overlap check: read GeometricSatakeAndFusionPartII (open), DiamondSixOperations (open), DiamondsAndVStacks (main); nothing shared. Kimberlites, the olivine spectrum, scheme-theoretic v-sheaves and v-closures are stated only here; GeometricSatakeAndFusionPartII imports D10.8–D10.15 and D11 by section, and the overlaps tool lists no dropped id, no second copy and no pull request changing this folder.
- Source independence: changed passages only; 8 passages compared with 3 sources (GLE, AGLR, SW20), none shared (longest common run 4 words, a standard name); largest share GLE, 59 of 141 locator lines; the diff adds, removes or reorders no layer, so the contents were not compared again. The new groups do not track GLE's subsections: the D8.3 group runs across GLE §3.1 and §3.2.
- Remark (untouched text, no change asked): D11.15's proof sketch cites D11.8 but its `*Needs:*` line lists it only through D11.11.
- Remark (another pull request's contract, no change asked here): GeometricSatakeAndFusionPartII at its open head declares `gap:general-tube-cohomology` against D11 of this roadmap; this head states no such target.

## Not verifiable

- The description's sentence on the number of review and red-team rounds before the port: it describes the job board's history, which is not in the folder or the brief's files.
- KPZ printed pagination (Forum of Mathematics, Pi): only arXiv v3 is cached; not touched by this change.

## Source issues

- none

## For the human reviewers

- Licence: LOU17 is cited as arXiv:1711.06903v1 with no journal reference, and BHA17 as lecture notes on the author's page (README, References); both are read from open copies, and neither is recorded there as published.
- Scope: GLE, the source with the largest share of the locators, is cited in the README's References as arXiv:2012.05483v4 only, without a journal reference.
