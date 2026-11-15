# Review of GanGrossPrasadUnitaryGroups (pull request #1404 at a73dc0c)

**Verdict:** accepted

:robot: Incremental AI re-review of 0 changed lines since a73dc0c; this round reads the pull request's title and description, as they stand now, against the head. No finding. The acceptance is conditional on the 34 declared supplier gaps, and it is of this folder only: a human gives the final approval.

## Previous findings

- R01 — repaired: the description now says “`Suggested.lean` states no declaration: none of the headline theorems (README §§2.2–2.7, 3.1–3.9, 3.11, 4.1–4.3, 5.1a–5.3, 6.1–6.5, 7.1–7.2, 7.4) is statable” and “the targeted Lake build succeeds with no warning”.
- R02 — repaired: the summary block now ends “a named proposition, proved in the literature, whose formal proof belongs to Part II; only the split archimedean prediction in higher codimension stays conjectural.”

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `Suggested.lean` at the head (description: “states no declaration”, “no warning”) | Declaration count; direct elaboration | Lines 59–61: empty namespace, 0 declarations, 0 `sorry`; elaboration exit 0, 0 diagnostics | Description agrees | none |
| Headline list of the description against the module docstring | The nine docstring bullets, section by section | Docstring: 2.2; 2.3–2.6, 3.11; 2.7, 3.3–3.5; 3.1–3.2, 3.6–3.9; 4.1–4.3; 5.1a–5.3; 6.1–6.5; 7.1–7.2; 7.4. Union equals the description's list; §§3.10, 4.4 named at lines 48–54 | Description agrees | none |
| §§3.10–3.11 split range (summary block: “only the split archimedean prediction in higher codimension stays conjectural”) | F=ℝ, r=0; F=ℝ, r=1; F=ℚ₂, r=1 | r=0 archimedean: theorem (line 913); r=1 archimedean: proposition, no exported proof (line 883); nonarchimedean r=1: theorem (line 913) | Description agrees | none |
| §7.4 `GGP.8` coefficient (summary block: “the period constant tracks the constituent count”) | (r_n, r_(n+1)) = (1,1), (2,1) | 2^(−2) = 1/4; 2^(−3) = 1/8; a fixed 1/4 is off by a factor 2 at (2,1) | Agrees with README line 1516 | none |
| §§7.1–7.2 (summary block: “needs no auxiliary supercuspidal place”) | README lines 11, 1450, 1470 | Line 1450: no temperedness or auxiliary-supercuspidal-place hypothesis; line 1470: no split supercuspidal place; line 11: no such restriction on the library | Description agrees | none |
| §4.4 status (description: “proved in the literature … its formal proof belongs to Part II”) | README lines 3, 19, 199; Lean docstring lines 48–54 | All four: named proposition, proved in the literature under the discrete Hermitian base-change hypotheses, formal proof in Part II | Description agrees | none |

Rows for the statements of the folder stand as in the previous review, of `a73dc0c`.

- Description against the head: the title, every sentence of the summary block and of the prose read; 0 wrong. Confirmed at the head: characteristic ≠ 2 with quadratic étale E (line 23); the restrictions not made (line 11); `SignedHermitianSpace`, the split carrier and Mathlib's `Representation.IntertwiningMap` (lines 9, 51); the three consumers and what each uses (lines 1552–1554); Part II's scope (line 19); three files in the folder; the title fits a pull request that adds the folder (not on main; 1660 insertions, 0 deletions); the Validation counts equal the gate's (`readme-ids-missing=0`, `set_option=0`, `sorry-data=0`, `depcheck=0`, `outside-folder=0`).
- Folder: 0 lines changed since a73dc0c; no file changed outside it (`git diff --stat origin/main...HEAD` outside the folder is empty). No statement, locator or layer changed, so the seeded sample (§§1.3, 2.1a, 2.2, 2.3, 2.5, 3.2, 3.5, 3.8, 3.9, 4.1, 4.3, 4.4, 5.5, 6.3a, 7.1) falls in no changed passage and no locator was re-read; the README flags none as unverified.
- Gate at a73dc0c: every counter 0, `build=0`, OK (worker's run); my run gives the same counters, OK. Elaboration of `Suggested.lean`: exit 0, no warning.
- Dependency check: `depcheck: 238 roadmaps, 2243 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Cross-roadmap citations: the resolver lists 0 unresolved citations and 0 unresolved Lean names; the overlap data lists no other open pull request changing this roadmap, no dropped id and no id that only an open revision defines. Citations of this roadmap resolved at the citing heads: TwistedAutomorphicDescents line 11 (§§1.1–1.3, 2.1–2.6, 3.7, 3.9–3.11, 4.1–4.4), AutomorphicSpectralTheoryPartII line 1667 (§§6.2a–6.4, 6.3a); each names this roadmap as the owner.
- Overlap check: read TwistedAutomorphicDescents, AutomorphicSpectralTheoryPartII, AutomorphicLFunctionsAndLocalFactorsPartII, AutomorphicSpectralTheory, ExceptionalThetaCorrespondencesForG2 (open heads) and SmoothRepresentationsOfLocalGroups (main); nothing shared. Unitary relevant pairs, Bessel data, local uniqueness, global periods and the multiplier-matching theorem §6.3a: owner GanGrossPrasadUnitaryGroups, as the first two say; orthogonal Bessel data: TwistedAutomorphicDescents §§0.1–0.3, 1.4; the other four do not name this roadmap or a Bessel model.
- Declared gaps: untouched since a73dc0c (34 slugs); this acceptance is conditional on them.
- Source independence: changed passages only: 0 passages compared with 0 sources (the folder did not change); largest share ggp, 54 of 236 line locators (bpcz 50); arrangement not compared again, no layer added, removed or reordered.

## Not verifiable

- xue-bessel is waived and cited by its recorded locator only.
- The description's “6 independent review rounds and 2 red-team rounds” is a statement about the job board, not about the head; not checked.

## Source issues

- none

## For the human reviewers

- **Licence.** xue-bessel (Xue, Bessel models for unitary groups and Schwartz homology, 2025) is cited by locator with its text waived; wording was never compared with it in any round.
- **Not tested.** `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/Suggested.lean` states no declaration (lines 59–61): every headline is named as not statable at the pins, so the build tests no mathematics of this roadmap.
