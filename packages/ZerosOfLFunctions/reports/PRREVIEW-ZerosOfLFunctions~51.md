# Review of ZerosOfLFunctions (pull request #1913 at 2371fdb)

**Verdict:** accepted

:robot: AI-assisted review (Claude Fable 5.2). Incremental re-review: the folder has 0 changed lines since the review of `2371fdb`, and this round reads the pull request's title and description against the head. There are no findings. The folder is ready for a human's final approval.

## Previous findings

- none: the previous report (of `2371fdb`, accepted) raised no finding; its repaired R01 (the `roadmap-summary` block) stands as repaired at this unchanged head.

## Verified sound

### The pull request's title and description against the head

| Sentence or claim of the text | What the head shows | Result |
| --- | --- | --- |
| a revision of the roadmap on main; names and labels kept | folder on `origin/main`; 0 headings removed, 13 added; 0 Lean declarations removed or restated | agrees |
| Layers 0 and 2 split (0.1–0.4, 2.1–2.5); 1.3a, 1.4a; 5.6a; a Provenance section | exactly these 13 headings are added: `### 0.1`–`0.4`, `1.3a`, `1.4a`, `2.1`–`2.5`, `5.6a`, `## Provenance` | agrees |
| "across Layers 0–8"; "Layers 0–9 keep their names, labels and route" | the README diff has no hunk in Layer 9 (head lines 2900–2970); hunks in every layer 0–8 | agrees |
| `Suggested.lean` adds four theorems, one import, one docstring change; every other statement unchanged | diff adds `riemannZeta_zeros_summable_ordinate`, `neg_re_logDeriv_riemannZeta_le`, `dedekindZeta_weilExplicitFormula`, `heckeLFunction_weilExplicitFormula`, the import `TauCeti.NumberTheory.ArithmeticDirichletSeries.VonMangoldt` (file exists at the pin), and rewrites only the docstring of `dirichletLFunction_zeroFreeRegion`; its statement is untouched | agrees |
| Weil formulas summed over the open strip `0 < Re s < 1` | both statements sum an indicator of `Ioo 0 1 ×ℂ univ` | agrees |
| 5.6 proves the coefficient identity for both families; 5.6a confines zeros and gives ordinate summability | README 5.6 second clause ("for every member of the two families, real or not"); 5.6a's two clauses | agrees |
| 8.5 and 8.7 go through ϑ and identify the counts with `TauCeti.primeCount` via `TauCeti.primeCount_eq_card` and `Rat.HeightOneSpectrum.primesEquiv` | README lines 2481–2495 and 2697–2723; `primeCount_eq_card` at the pin, `NumberTheory/ArithmeticDirichletSeries/Counting.lean:648` | agrees |
| Scope: exceptional-zero nonexistence, Siegel, uniform bounds for `1 − β` excluded; constants of 8.5–8.8 not uniform in the modulus; owners named | README "Not owned here", lines 91–101, naming ImaginaryQuadraticClassNumber H2.4 and AnalyticNumberTheoryPartI | agrees |
| Suppliers: LFunctions, ClassFieldTheory, and the completed ArithmeticDirichletSeries, GlobalNumberFields, NumberFieldArithmetic, Chebotarev, ContourIntegration; all on main; ModularForms not a supplier | the same seven roadmaps are linked under "Consumed, not redefined" at main and at the head (none added, none dropped); all seven folders are on `origin/main`; ModularForms appears only as a consumer (line 36) | agrees |
| AnalyticNumberTheoryPartI consumes Layers 0–8 as stated | README line 2982; AnalyticNumberTheoryPartI on main, README line 9 and its contract heading at line 77 | agrees |

The title names four revised layer groups and the kept alternative; the head contradicts none of it. The `depends-on` and `merge-order` blocks are generated and outside this check; they name no prerequisite, as the overlap facts do.

### Adversarial table

The diff changes no statement. Rows for the statements the description's "Why the change is made" paragraph cites, recomputed in double precision:

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 5.6 coefficient identity (reality does not fix `b`; `exp s` raises it by one) | `zetaEntireCompletion`; `f = exp s · zetaEntireCompletion` | `b = −γ/2 − 1 + ½ log 4π = −0.0230957090`; for `f`: `0.9769042910`; `f(1 − s) = exp(1 − 2s) f(s)`, so `f(0) = 1`, `f(1) = e` | true; `f` excluded by the functional equation only | none |
| 2.4 newform comparison (shift `(k − 1)/2`) | `Δ`, `k = 12`, `N = 1`, analytic `s = 1/2` | shifted: `(6 + 3)(7 + 3) = 90`; unshifted at `1/2`: `3.5 · 4.5 = 15.75` | true; the shift cannot be dropped | none |
| 8.5 route through `ϑ_K` (Abel summation of `ψ` weights `𝔭^k` by `1/k`) | `K = ℚ`, `x = 10` | `ψ(10) = log 2520 = 7.8320`, `ϑ(10) = log 210 = 5.3471`; weighted count `4 + 2·½ + ⅓ = 5.3333` against `π(10) = 4` | true; `ψ` gives the prime-power count, not `π` | none |
| 5.6a `riemannZeta_zeros_summable_ordinate` | first pair of zeros, ordinate `14.134725` | `2/(1 + 14.134725²) = 0.0099606`; trivial zeros `−2, −4, …` each contribute `1` over `riemannZeta` | true; statement is over `completedRiemannZeta` | none |

The rows for every other statement stand as in the previous review, of `2371fdb`.

### Counts

- Gate, re-run at `2371fdb`: `gate ZerosOfLFunctions: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's run also reports `build=0`.
- Dependency check: `depcheck: 245 roadmaps, 2207 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean` exits `0` with 23 ``declaration uses `sorry` `` warnings and nothing else.
- Outside the folder: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ZerosOfLFunctions'` lists nothing.
- Signatures and padding: `Suggested.lean` is unchanged since the reviews that ran the `#check @…` comparison and the one-tactic probe (0 of 23 close); the worker's elaborated signatures report no lost binder.
- Library declarations opened at the pin this round: 3 (`TauCeti.primeCount_eq_card`, `Counting.lean:648`; `TauCeti.primeCount_eq_primeTheta_div_log_add_integral`, `AbelSummation.lean:494`; `HeckeRing.GL2.Newform.analyticConductorAt_eq`, `Newforms/AnalyticInvariants.lean:133`). Source locators checked: 0 (no passage changed, none flagged unverified).
- Cross-roadmap citations resolved this round: 10 linked roadmaps, all on `origin/main`; overlap facts list no dropped id, no open revision of this roadmap and no second copy.
- Overlap check: read AnalyticNumberTheoryPartI and LFunctions (main), ExplicitZetaBounds and ExplicitPrimeCounting (open); nothing shared: each cites this roadmap's layers as a consumer or supplier, and the Landau–Siegel exclusion is AnalyticNumberTheoryPartI's (§0.34), deferred to here.
- Source independence: changed passages only; 0 passages changed, so 0 compared; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

Nothing new. The items of the earlier reports stand: Davenport (`davenport2000`, uncertified), Titchmarsh (no open copy), Iwaniec–Kowalski (paywalled), Lagarias–Montgomery–Odlyzko (`lagarias1979`, uncertified), Lang XVII §3 (`lang1994`, uncertified).

## Source issues

- none

## For the human reviewers

- **Licence.** The README's Provenance section (`TauCetiRoadmap/ZerosOfLFunctions/README.md`, lines 2985–3009) maps nine sections to declarations of the Apache-2.0 project PrimeNumberTheoremAnd at a fixed commit and asks that its authors be consulted before porting; this round did not compare `Suggested.lean` with that repository.
