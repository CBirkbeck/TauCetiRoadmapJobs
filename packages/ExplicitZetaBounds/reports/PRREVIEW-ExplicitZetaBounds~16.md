# Review of ExplicitZetaBounds (pull request #1954 at cea8938)

**Verdict:** needs changes

Incremental re-review: the folder has 0 changed lines since `cea8938`, which the previous review accepted. This round reads the pull request's title and description against the head. Both findings are in the description's hand-written prose (after `<!-- /roadmap-summary -->`); neither asks for a change to the roadmap's files.

## R01 (P3) — the description says every bound is proved for a general record

**Location:** pull request description, second "Approach and generality" paragraph: "Each bound is proved once for a general record (a function of finite order with a growth type) and the classical constants are instances."

**Claim:** The head proves two statements at that generality, not each bound. The exponential-sum bounds, zero-free regions, densities and `L(1, χ)` bounds are stated for `ζ` and `L(s, χ)` directly.

**Witness:** `README.md` line 1229 (3.2: records "of *finite-order type*") and line 2125 (5.1: "stated for an arbitrary holomorphic `f`"); `Suggested.lean` has one record-level theorem, `norm_continuedL_le_rademacher`. The description's own summary block says this correctly.

**Repair:** Replace the sentence with: "Rademacher's convexity bound is proved once for an analytic record of finite-order type, and Backlund's argument lemma for records of any degree; `ζ` and primitive Dirichlet characters are instances. The exponential-sum bounds, zero-free regions, densities and `L(1, χ)` bounds are stated for `ζ` and `L(s, χ)` directly."

## R02 (P3) — the description says this roadmap is the single owner of the explicit bounds for `ζ` and `L(s, χ)`

**Location:** pull request description, second "Why Tau Ceti wants it" paragraph: "this roadmap is the single owner of those bounds, so the other explicit roadmaps quote them instead of re-deriving them."

**Claim:** The head's "Not owned here" hands several explicit bounds for `ζ` and Dirichlet L-functions to other roadmaps.

**Witness:** `README.md` lines 165–174 (quadratic `L(1, χ)` bounds to a Part II; Liu and Wang's four-zero bound to `ExplicitPrimeCounting`), 192–195 (Johnston–Yang density constants), 196–198 (the `0.28 log T` zero count). ExplicitPrimeCounting's README states the first at line 4234 of its open head `62095a2`.

**Repair:** Replace with: "this roadmap owns those bounds, except the forms its 'Not owned here' section names (three that ExplicitPrimeCounting states with the theorems that use them, and the quadratic `L(1, χ)` bounds of a Part II); the other explicit roadmaps quote the rest instead of re-deriving them."

## Previous findings

- none: the previous report (of `cea8938`) had no findings.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 3.2 `norm_continuedL_le_rademacher` at `riemannZetaData`, `η = 1/2` (cited by R01) | `s = −1/2`; `s = 1/2`; `s = 0`; pole factor dropped at `s = 1.01` | `0.2078862250 = ζ(3/2)/(4π) = 0.2078862250` (attained); `1.460355 ≤ 11.487718`; `0.5 ≤ 1.974795`; `1.975898 < ζ(1.01) = 100.577943`, so the factor is needed | ✓ |

The rows for all other statements stand as in the previous review, of `cea8938`: the folder did not change.

- **Description against the head, sentences checked and found consistent:** the summary block's three paragraphs (consumers ExplicitPrimeCounting, ExplicitNumberFields, ExplicitCharacterSumsAndSieves, ExplicitMultiplicativeFunctions at README lines 3822–3861; Euler–Maclaurin for real Banach spaces at line 49; Fiori's principle with its monotonicity hypotheses in 3.1; convexity on finite-order-type records and Backlund's lemma at any degree; the Tau Ceti suppliers at lines 323–357); the prose paragraph "What this roadmap builds"; "Numerical verifications … are propositions that theorems take as hypotheses" (Conventions, Records). The title says the pull request adds a roadmap, as the head does (not on main; 0 headings and 0 declarations removed).
- **Gate** (run here): every check `0`, `OK`; the worker's `gate.md` records `build=0`.
- **Dependency check** (run here): `depcheck: 244 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Elaboration** (run here): `lake env lean` on `Suggested.lean` exits 0 with 43 warnings, all ``declaration uses `sorry` ``, no error.
- **Outside the folder:** `git diff --stat origin/main...HEAD` outside `TauCetiRoadmap/ExplicitZetaBounds` prints nothing.
- **Citations resolved again:** the two leads of `citations.md` are at the open head `66e58fc` of SieveMethodsAndPrimePatterns: `SieveTaper.sharp_additive_largeSieve` (`Suggested.lean` line 225, namespace at 209) and `SieveApplications.sharp_primitive_largeSieve` (line 250, namespace at 245), its §2.9 (README line 2403). LFunctions, ZerosOfLFunctions and AnalyticNumberTheoryPartI are on main.
- **Overlaps:** `overlaps.md` lists no other pull request changing this roadmap, no dropped id and no id only an open revision defines. Overlap check: read ExplicitPrimeCounting (open head `62095a2`, the Liu–Wang bound only); the scopes of the other closest roadmaps were not re-read this round, the folder being unchanged since the review that read them.
- **Source independence:** changed passages only; the folder did not change, so 0 passages were compared and the arrangement was not compared again.

## Not verifiable

- Nothing new this round. The items of the previous report stand: the image-only scans `chirrehelfgott2025`, `leeLeong2022`, `leong2026`, `hoffstein1981`, `cullyhugilljohnston2025`, and the works cited by locator only (uncertified or waived in the manifest).

## Source issues

- **Misprint** in bellottiwong2025 at Theorem 1.1, p. 1 (line 38): the source says the first estimate is the sharper one from `T = exp(447.981)` on; it should be from `exp(447.98114)`, since at `log T = 447.981` the second is still smaller by `1.6·10⁻⁶`; affects nothing.

## For the human reviewers

- **Scope.** Two instances of 7.9 (README lines 3357 and 3361) rest on 2026 arXiv preprints, `banks2026` and `guo2026`; the References (line 3953) mark `guo2026` as unrefereed. Whether unrefereed sources may carry these targets is yours to decide.
