# Review of ExplicitZetaBounds (pull request #1954 at 24991b2)

**Verdict:** accepted

## Previous findings

- R01 — repaired: The description now limits general-record convexity to finite-order-type records and Backlund's lemma to arbitrary holomorphic functions; it states the narrower carriers of the other bounds.
- R02 — repaired: The description now says “owns the bounds its layers state” and names the ExplicitPrimeCounting exceptions, the excluded Ramaré theorem and the quadratic upper bounds assigned to Part II.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §9.3 changed interval comparison, citing §7.9 | `q = 10¹¹`; widths Banks / Guo / Hoffstein | `0.00011844395 < 0.00039481317 < 0.00338691915`; normalized widths `0.003 < 0.01 < 0.085785365` | Guo improves Banks but does not supply Hoffstein's hypothesis | None |
| §9.3 implication negative control | Hypothetical zero `β = 1 − 0.05/log(10¹¹)` | `β = 0.99802593417`; gap `0.05 > 0.01` but `0.05 < 0.085785365` | Guo's gap alone permits a point in Hoffstein's required zero-free interval | None |
| §9.3 `LFunction_one_ge_luZamanZhao` and its cited Check | Primitive quadratic character `χ₋₃`; Hoffstein coefficient comparison | `L(1, χ₋₃) = 0.604599788 ≥ 0.113779903`; `1.507/11.657 = 0.129278545 > 1/8 = 0.125` | Bound and transfer arithmetic agree | None |

The rows for untouched statements stand as in the previous review, of `cea8938`.

- Changed passages: 2; both previous findings repaired; title and all 6 description paragraphs, including `roadmap-summary`, checked against this new-folder addition; no omitted removal, renumbering or supplier change.
- Sources: 5 locators in 4 works checked: `guo2026` lines 54–61 (Theorem 1.1, p. 2), `banks2026` lines 89–107 (Theorem 1.1, pp. 2–3), `luzamanzhao2026` lines 96–99 and 369–371 (Corollary 1.3 and proof, pp. 3, 9), `kadirilumleyng2018` lines 63–66 and 93–95 ((1.5) and footnote 1, p. 2); no other seeded target changed.
- Native declarations opened: 2, `Mathlib/NumberTheory/MulChar/Basic.lean:443` (`IsQuadratic`) and `Mathlib/NumberTheory/LSeries/Nonvanishing.lean:412` (`LFunction_apply_one_ne_zero`); neither supplies the numerical lower bound.
- Ownership citations: all 4 named exceptions resolved in `TauCetiRoadmap/ExplicitPrimeCounting/README.md`, §§2.2, 3.4, 6.6, 7.5 at #1945; §1.7 imports this roadmap's gap. AnalyticNumberTheoryPartI §§0.34–0.34a and ZerosOfLFunctions §6.3 resolved on main; both sieve-name leads resolve in #1495's `TauCetiRoadmap/SieveMethodsAndPrimePatterns/Suggested.lean:225` and `:250`.
- Gate rerun: every reported check `0`, `OK`; worker gate also records `build=0`. Targeted build `lake build TauCetiRoadmap.ExplicitZetaBounds.Suggested` passed.
- Dependency output: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Direct elaboration: exit 0, 43 warnings, all `declaration uses sorry`; scratch `#check @name` probe printed all 72 named declarations, exit 0. The two signatures implicated by the description/Check retain their hypotheses; no signature changed.
- Outside-folder changes: 0 against the base and since `cea8938`; worktree remains clean.

Overlap check: read ExplicitPrimeCounting, ExplicitNumberFields, ExplicitMultiplicativeFunctions, ExplicitCharacterSumsAndSieves, ZerosOfLFunctions (main and open), AnalyticNumberTheoryPartI and LFunctions; records belong to LFunctions, qualitative zero theory to ZerosOfLFunctions, the nonnumerical gap to AnalyticNumberTheoryPartI, explicit analytic bounds and the numerical gap to ExplicitZetaBounds, and the four named exceptions to ExplicitPrimeCounting. Field, multiplicative-function and character-sieve applications remain with their respective consumers. No new ownership conflict.

Source independence: changed passages only; 2 passages compared with 4 sources, no copied expression or reused source material. Largest source-key share: `mty2024`, 16 of 302 citations before References. No layer was added, removed or reordered; arrangement was not rechecked.

## Not verifiable

- Hoffstein's original Lemma 1 was not rechecked directly; its required constants were verified in the quotation at `luzamanzhao2026` lines 369–371. Earlier uncertified/waived citations remain outside this incremental check.

## Source issues

- none

## For the human reviewers

- **Scope.** The instances at `TauCetiRoadmap/ExplicitZetaBounds/README.md:3357` and `:3361` rely on the unrefereed 2026 preprints `banks2026` and `guo2026`; both are labelled there. Whether these sources may carry those targets remains for human review.

