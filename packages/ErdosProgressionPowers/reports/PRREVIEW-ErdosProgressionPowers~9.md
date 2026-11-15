# Review of ErdosProgressionPowers (pull request #1336 at fb24264)

**Verdict:** accepted

Incremental re-review of 0 changed lines in the folder since 3e1048c; this round read the pull request's title and description against the head. No finding.

## Previous findings

- none: the review of 3e1048c raised no finding (its R01 of the round before was recorded there as repaired, and `README.md:84`, 623, 674–692 still cite ExplicitZetaBounds §§0.2–0.4).

## Verified sound

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| Description: "has yd=0 or ℓ ≤ exp(10^k)", "n, d, y of either sign" against `effective_prime_bound` (`Suggested.lean:143`, README §6.2) | d = 0; y = 0; (n,d,k) = (1,24,3) | d = 0: gcd forces n = ±1, product (±1)^k, left disjunct; y = 0: left disjunct; 1·25·49 = 1225 = 35², ℓ = 2 ≤ e^1000 | description and Lean agree; binders are ℤ |
| Description: "finitely many nontrivial solutions with any exponent ≥ 2" against `fixed_length_finiteness` (`Suggested.lean:164`, §6.5) | n = y = 1, d = 0; y = 0, d = ±1, n = ∓i; y = ±1, d ≠ 0, k ≥ 5 | 1 = 1^ℓ for every ℓ: infinite, excluded by y·d ≠ 0; 0 = 0^ℓ for every ℓ: excluded; k distinct terms cannot all be ±1 | "nontrivial" = y·d ≠ 0, as the Lean states |
| Description: "Layer 7 separately proves the Erdős–Selfridge theorem `consecutiveProduct_not_perfectPower`" against `Suggested.lean:172`, §7.1 | n = 1, k = 2; n = 8, k = 1; n = 0 | 2 ≠ 1, 4; 8 = 2³ excluded by k ≥ 2; 0 = 0^ℓ excluded by n > 0 | declared; §7.2 defines ErdosThreshold as a predicate, not proved |
| Description: "No GRH enters: numerical estimates remain explicit hypotheses or declared gaps" against `README.md:621`–629, 674–692, 1467 | the five rows of the AnalyticNumberTheoryPartI table | four `gap:` slugs; the zero-line clause is the bounded-height records GRH(4, 10⁴), GRH(8, 10⁴), RH(10⁹) of ExplicitZetaBounds; l.629 "No GRH assumption" | agrees |
| Description: "Roadmap folder … (README, `Suggested.lean`, `metadata.toml`)", "the Lean imports none of them" | folder listing; import lines | three files, 2564 insertions, 0 deletions; `import Mathlib` and two `TauCeti.*` modules, no roadmap module | agrees |

The statements the description does not quote stand as in the previous review, of `3e1048c`.

- Title and description: every sentence of the summary block and of the prose was read against the head. The pull request adds the folder (not on main); no section, headline or declaration is removed. The twelve suppliers of the README that are not on main (NeronModelsAndSemistableAbelianVarieties, EllipticCurveModularity, SerreWeightAndLevelOptimisation, AutomorphicGaloisRepresentations, WeightsInEtaleCohomology, HeightsRationalPointsAndObstructions, MordellLawrenceVenkatesh, EllipticLegendreCharacterInterfaces, ArithmeticGaloisRepresentations, EllipticCurveModularityPartII, ExplicitZetaBounds, SieveMethodsAndPrimePatterns) are the twelve open entries of the `depends-on` block; the eight others (EllipticCurves, ModularForms, ModularCurves, ClassicalArithmeticCompletion, ImaginaryQuadraticClassNumber, AlgebraicCurves, EtaleCohomologyFoundations, AnalyticNumberTheoryPartI) are on main. The hand-written supplier list the previous review remarked on is no longer in the description.
- Description against README: "two Frey families" (§§1.2, 1.5), "comparison curve with full two-torsion" (§1.12), "forced trace zero" (§1.13), "one primitive quadratic character per triple" (§2.7), the two endgames (Layers 3–4 and 5), "Legendre models … over every commutative ring" (`README.md:71`–72), the exports (`README.md:2278`). 7 claims resolved, none contradicted.
- Gate: the worker's gate at this head reports every check 0, `build=0 OK`. Re-run with the configured order it prints 12 UPWARD lines (ErdosProgressionPowers at #54) and all other checks 0; with the job's merge order (ErdosProgressionPowers line 283, after EllipticCurveModularityPartII at 282 and ExplicitZetaBounds at 275) the dependency check prints `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `Suggested.lean` gives exactly eight `declaration uses sorry` warnings (l.94, 105, 130, 143, 149, 155, 164, 172). The file is byte-identical to the one read at 3e1048c; signatures and one-tactic probes stand.
- Outside the folder: `git diff --stat origin/main...HEAD` is empty; `git diff 3e1048c..HEAD` on the folder is empty.
- Seeded sample: no seeded target lies in a changed passage (there is none); 0 source locators re-read.
- Cross-roadmap: PolynomialGaloisGroupsPartII (open) cites ErdosProgressionPowers §0.9, which exists at `README.md:901`; `scratch/overlaps.md` lists no dropped id and no other pull request changing this roadmap. No `Suggested.lean` at an open head declares a name in this roadmap's namespace.
- Remark on untouched text (no change requested): `README.md:19` says "The development follows Bennett–Siksek [BS20], Theorem 2"; the layers are not named after that source's sections.

Overlap check: read EllipticLegendreCharacterInterfaces, EllipticCurveModularityPartII, SieveMethodsAndPrimePatterns, AnalyticNumberTheoryPartI; Legendre models — EllipticLegendreCharacterInterfaces; full-two-torsion predicate, Kraus thresholds, removed-prime bound — EllipticCurveModularityPartII; Gram inequalities — SieveMethodsAndPrimePatterns §0.4; Landau–Siegel exclusion and prime estimates — AnalyticNumberTheoryPartI; each cited here, none owned twice.

Source independence: changed passages only; the diff is empty, 0 passages compared with 0 sources; largest share BS20 (87 of about 140 source mentions); contents not compared again, since no layer was added, removed or reordered.

## Not verifiable

- Green2026: no legal copy known; consumed only through AnalyticNumberTheoryPartI §0.34c.
- IwaniecKowalski2004, RosserSchoenfeld1962, Tenenbaum1995, RahmanRoth: waived, cited by locator. Faltings1983: the cached scan was not re-read this round.
- Gap registration: the board package has no `design/plan.json`, so the announcement of the four `gap:` slugs on the supplier's job could not be checked.
- The description's sentence that author-side red-team passes follow before the draft is marked ready describes process outside the repository.

## Source issues

- none

## For the human reviewers

- **Scope/Licence.** `README.md:2386`–2387 cite two 2026 preprints, OpenAI2026 ("open repository") and Green2026 ("Hexagon 2610.00311"), for the uniform exclusion of Landau–Siegel zeros; both analytic routes rest on it through AnalyticNumberTheoryPartI §0.34. Neither is a refereed publication.
- **Not tested.** BS20, the source with the largest share of locators, is not among the texts listed for this round; wording and arrangement were not compared against it again (no passage changed).
