# Review of KatoEulerSystems (pull request #1804 at 88ffcc3)

**Verdict:** accepted

Incremental re-review of 2 changed lines since 7a6112e (one sentence removed from `## Downstream consumers`), and of the pull request's title and description as they stand now. No finding.

## Previous findings

- R01 — repaired: "ModularIwasawaMainConjectures, ModularIwasawaMainConjecturesPartII, AutomorphicCongruences, CMRankZeroConverse and HeegnerPointEulerSystems consume it by name, and RankZeroOneBSDPartII can use its finiteness of Sel_(p^∞)(E/ℚ) when L(E,1) ≠ 0."; summary block: "RankZeroOneBSDPartII can use its Selmer finiteness".

## Verified sound

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| Removed sentence "`HeegnerPointEulerSystems` §6.9 uses 6.6, 7.4 and 7.7" | HeegnerPointEulerSystems at its open head e9fc187, §6.9 (README line 1068) and its *Needs:* (line 1074) | *Needs:* names ModularIwasawaMainConjectures §§1.3, 1.7, SelmerIwasawaCohomology, GrossZagierAndArithmeticHeights; `KatoEulerSystems §` occurs 0 times in that README | the removed claim was false; removal correct | none |
| Description "… CMRankZeroConverse and HeegnerPointEulerSystems consume it by name" | occurrences of `KatoEulerSystems` at the open heads | ModularIwasawaMainConjectures 51; PartII 16; AutomorphicCongruences 38; CMRankZeroConverse 17; HeegnerPointEulerSystems 6 (supplier subsection, line 227, `gap:kato-distinguished-lattice`) | true for all five | none |
| Description and README line 3219 "RankZeroOneBSDPartII can use" | RankZeroOneBSDPartII at 27e8ab0 | 0 occurrences of `KatoEulerSystems`; "can use" claims no citation | agrees | none |
| 7.9 blochKatoSelmer_finite, cited by the changed sentence ("finiteness of `Sel_(p^∞)(E/ℚ)` at every p when `L(E,1) ≠ 0`") | E/ℚ: `k = 2`, `K = ℚ`, χ trivial | clause (1): `1 ≤ r ≤ 1`, `r ≠ 1` is empty; clause (2): `r = 1`, `G = 1`, `I_χ = ker(ℤ → ℂ) = 0`, `M^(χ) = M`; `m = 1`, `S = ∅`, `L_S = L`; E admissible at every p (7.9, 4.1) | the sentence is clause (2) at these values; Kato2004 lines 4590–4608 state (1), (2), the χ-part and `L_S` as the README does | none |
| Summary block "Why Tau Ceti wants it" vs `## Downstream consumers` (lines 3215–3221) | item by item | morphisms ↔ Layer 5; regulator comparison ↔ 6.2–6.4; bounds ↔ 4.3, 7.2; Selmer finiteness ↔ 7.9 | agrees | none |

Rows for the folder's other statements stand as in the previous review, of `7a6112e`; the diff changes no statement.

- Changed passage: 1 sentence removed, none added; `Heegner` now occurs 0 times in the README, so nothing else cites the removed claim.
- Description against the head: title ("roadmap": the folder is not on main; 3 files, 3398 insertions, 80 headings and 3 Lean declarations added, none removed); the summary block's 3 paragraphs; the prose paragraph's consumer sentence; the folder, dependency and validation sentences. None contradicted; the change since 7a6112e removes no section, declaration or supplier, so nothing is left unstated.
- Cross-roadmap citations resolved: 6 consumer roadmaps at their open heads (counts above); `scratch/citations.md` lists none found nowhere.
- Gate rerun on this head: every check 0, `OK`, exit 0; the worker's gate, build included, passed. No file changed outside the folder.
- Dependency check: `depcheck: 238 roadmaps, 2248 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `TauCetiRoadmap/KatoEulerSystems/Suggested.lean`: two `declaration uses sorry` warnings (lines 50, 75), nothing else. Elaborated signatures: 3 declarations, no lost binder.
- Source locators checked: 1 (Kato Theorem 14.2, p. 235, Kato2004 lines 4590–4608). No seeded-sample target falls in the changed passage.
- Remark (untouched text): Kato2004 lines 4591–4599 state the finiteness of 14.2 at every finite place λ; 7.9 states it for `(f,λ)` admissible over K, the range in which 5.1 supplies the zeta morphism.

Overlap check: read the passages on this roadmap of HeegnerPointEulerSystems (supplier contract, §6.9) and CMRankZeroConverse (ownership paragraph, supplier contract) at their open heads, and counted the citations of ModularIwasawaMainConjectures, ModularIwasawaMainConjecturesPartII and AutomorphicCongruences; each cites `KatoEulerSystems` by section or as a gap it declares; nothing shared. The scopes of PadicFamilies and of the roadmaps on main (IntegralIwasawaTheory, ModularForms, CyclotomicClassGroupsAndStickelberger) were not read again: the change adds no object. `scratch/overlaps.md` lists no dropped id, second copy or conflicting head.

Source independence: changed passages only: 0 passages compared (the diff adds no text; it removes one sentence); arrangement not compared again, no layer added, removed or reordered.

## Not verifiable

- The description's "5 independent review rounds and 2 red-team rounds on the job board": the board's history is outside what this review reads.
- `Serre1972`, `FontaineMessing1987` (waived) and `PerrinRiou1990`, `PerrinRiou1994`, `Schneider1985`, `JacquetShalika1976`, `Rohrlich1984`, `Rohrlich1988`, `Ribet1980`, `BlochKato1990`, `DiamondShurman2005` (uncertified): cited by locator only, as in the previous reports.

## Source issues

- none

## For the human reviewers

- none
