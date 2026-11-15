# Review of SpecialFunctionsBessel (pull request #1987 at 2022935)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since `2022935`; this round reads the pull request's title and description against the head. One P3 finding, in the description only; the folder needs no change.

## R01 (P3) — the description counts seven supplier roadmaps; the head has eight

**Location:** pull request description, the paragraph after the supplier list: "The README links into all seven. `Suggested.lean` imports none of them".

**Claim:** The sentence is contradicted by the head and by the description's own list, which names eight supplier roadmaps; SpecialFunctionsHypergeometric was added as the eighth without updating the count.

**Witness:** `TauCetiRoadmap/SpecialFunctionsBessel/README.md`, `## Exact supplier contracts`, has eight `### From [<roadmap>]` subsections (lines 334–458), the last being SpecialFunctionsHypergeometric; the description's "Merge after" line lists eight pull requests.

**Repair:** Replace the sentence with: "The README links into all eight. `Suggested.lean` imports none of them: it imports only Mathlib, `TauCeti.Analysis.SpecialFunctions.BesselI` and `TauCeti.Analysis.SpecialFunctions.RegularizedHypergeometric`."

## Previous findings

- The previous report (`PRREVIEW-SpecialFunctionsBessel~7`, at `2022935`) had no finding. Its remark that the description says "all seven" against eight suppliers is R01 above, now that the description is checked against the head.

## Verified sound

**Adversarial table: statements the description cites** (`Suggested.lean` lines 131–134, 356–366; computed numerically, Simpson's rule and 40-term series).

| Statement | Instance | Left side | Right side | Result |
|---|---|---|---|---|
| `besselK_ofReal_eq_positiveAxisBesselK` | `ν = ½`, `x = 1` | 10.27.4: `½π (I_{−1/2}(1) − I_{1/2}(1)) = (π/2)^{1/2} e⁻¹ = 0.4610685044479` | `½ ∫₀^∞ e^{−(u+1/u)/2} u^{ν−1} du = 0.4610685044479` | agrees |
| the same | `ν = 0.3`, `x = 1` | `0.4350760242088` | `0.4350760242088` | agrees |
| `besselY_eq_schlafli` (10.9.7) | `ν = 0.3`, `z = 1` | 10.2.3: `−0.24570419535650` | the two integrals: `−0.24570419535648` | agrees; fixes the sign of the second integral and the factor `cos νπ` |

The rows for the other statements stand as in the previous review, of `2022935`: the diff changes no statement.

**The description against the head** (each sentence read against `README.md` and `Suggested.lean`; only R01 fails):

| Sentence of the description | At the head | Result |
|---|---|---|
| adds the roadmap; "a substantial part of Chapter 10 … not all of it" | not on main; 2342 insertions, 0 deletions; README lines 34–47 | agrees |
| the nine topic bullets (two kinds of error bound, Debye uniform and fixed order, 10.22.49 on its full domain, 10.22.64 with three cases) | 5.3; 6.1 (10.41.3–10.41.6 uniform, 10.41.12–10.41.13 as `z → +∞`); `Suggested.lean` lines 538–560 | agrees |
| deferred material "in two groups" | README lines 40–47 and the section at line 1584 | agrees |
| 11 layers, with their titles | `## Layer 1` … `## Layer 11`, README lines 517–1515 | agrees |
| AnalyticNumberTheoryPartI §2.1a and §3.23b | on main: `### 2.1a The K-Bessel kernel` (line 1216), §3.23b under `### 3.23` (line 2698) | resolves |
| AutomorphicSpectralTheory §0.25 | at its open head: `### 0.25 Bessel functions J_ν and I_ν` | resolves |
| LaguerreJacobi `Polynomial.gegenbauer` (F2), F1 | at its open head: `Polynomial.gegenbauer (lam : R) (n : ℕ) : R[X]` | resolves |
| SpecialFunctionsHypergeometric §§1.2–1.4 | on main: `### 1.2`, `### 1.3`, `### 1.4` (lines 322, 374, 402); `Complex.regularizedGaussHypergeometric` | resolves |
| SpecialFunctionsAiry: Kummer's second transformation, the `J₀` integral | on main: its 1.7 (`exp_neg_mul_kummer_two_mul`, line 458), its 8.3 (line 1342) | resolves |
| SpecialFunctionsEiLiErfIncompleteGamma: Pincherle | on main: `### 4.1 Pincherle's theorem` (line 700) | resolves |
| "`besselK_ofReal_eq_positiveAxisBesselK` (against a roadmap-local copy …) and `besselY_eq_schlafli`" | `Suggested.lean` lines 131, 356, 364 | agrees |
| imports: Mathlib, `…BesselI`, `…RegularizedHypergeometric` | `Suggested.lean` lines 3–5 | agrees |
| Existing libraries: `Complex.besselJ`, `Real.besselI` (owned by StandardDistributions) | README lines 472–478 and 460–465 | agrees |
| pins Tau Ceti `2fd255d997`, Mathlib `1b1ccf4b08`, those of `main`; 49 warnings | `lake-manifest.json` identical to `origin/main`'s; 49 warnings | agrees |
| topic `math.CA` | `metadata.toml` | agrees |
| `lean-DLMF` "cited in a secondary provenance section" | `## Prior formalization`, README lines 1618–1642 | agrees |
| "The README links into all seven" | eight | R01 |

- Gate at `2022935` (the worker's, with the candidate merge order): every rule `0`, `OK`. My run without that order differs only in `depcheck: NOT IN ORDER: SpecialFunctionsBessel (insert it after its last supplier)`, the placement of a roadmap the order does not list at that point (not a finding).
- Dependency check with the candidate order and `--movable`: `depcheck: 245 roadmaps, 2212 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean` of `TauCetiRoadmap/SpecialFunctionsBessel/Suggested.lean`: 49 warnings, all `declaration uses sorry`; no error. The file is unchanged, so the one-tactic probe and the comparison of the 86 elaborated signatures (0 lost binders) stand as reported before.
- Cross-roadmap citations resolved this round: 8 (the rows above); 6 of the 8 suppliers are on main (AsymptoticExpansions, AnalyticNumberTheoryPartI, SpecialFunctionsAiry, SpecialFunctionsParabolicCylinder, SpecialFunctionsEiLiErfIncompleteGamma, SpecialFunctionsHypergeometric), 2 are open new roadmaps (AutomorphicSpectralTheory, LaguerreJacobi).
- The pull request changes nothing outside the folder. Overlaps: no open pull request changes this roadmap, drops an id it cites, or cites an id it drops.
- Seeded sample: the folder is unchanged, so no sampled target falls in a changed passage; none was re-read. The README flags no locator as unverified.
- Overlap check: read SpecialFunctionsStruve, SpecialFunctionsConfluent, SpecialFunctionsLegendre (open), SpecialFunctionsAiry, SpecialFunctionsEiLiErfIncompleteGamma, SpecialFunctionsParabolicCylinder (main); nothing shared. 10.22.2 and 10.43.2 are SpecialFunctionsStruve's, and 9.6.21–9.6.24, 10.16.6–10.16.8 and 10.39.6–10.39.8 are SpecialFunctionsConfluent's; this README excludes all of them (lines 189–193). Sturm comparison, which SpecialFunctionsConfluent consumes, is owned here (7.1).
- Source independence: changed passages only; 0 passages changed, so none compared; the arrangement was not compared again (no layer added, removed or reordered).
- Remark (no change requested): the description's "Merge after" and "Depends on" lines name six pull requests that have since merged; the generated depends-on block already shows them ticked.

## Not verifiable

- **Watson 1944**, p. 411 (DLMF's source for 10.22.74–10.22.75): no legal open copy; not read (carried; untouched text).
- `check_roadmap_topics.py` "passes" (description): the script was not run; the gate's `metadata` rule reports `0`.
- Ownership against open pull requests was checked this round only against the closest roadmaps named in the overlap line.

## Source issues

- **Error** in DLMF-Bessel at 10.22.74, §10.22(iv), online Release 1.2.8: the source says the triple-product integral is zero whenever `A ≤ 0`, for all `Re ν > −½`; it should say `A < 0`, with `A = 0` giving zero only for `Re ν > ½` (divergent at `ν = 0`, half the `A > 0` value at `ν = ½`); affects a stated result.

## For the human reviewers

- **Licence.** The description and README (`## Prior formalization`, lines 1618–1642) name the author's own `lean-DLMF` (Apache-2.0, `github.com/bjbraams/lean-DLMF`) as source material; `Suggested.lean` was not compared with that repository.
