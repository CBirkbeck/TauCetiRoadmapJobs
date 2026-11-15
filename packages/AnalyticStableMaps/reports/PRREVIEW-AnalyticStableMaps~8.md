# Review of AnalyticStableMaps (pull request #987 at 41557ba)

**Verdict:** needs changes

Incremental re-review: the folder has 0 changed lines since the previous review (also of 41557ba), and nothing outside it changed. The folder's files stand as accepted. The three findings are all about the pull request's description, which was written for head 9045e48 and not updated through the eight later commits. No file in the folder needs to change.

## R01 (P3) — Description names a superseded head and calls the change README-only

**Location:** pull request description, "Validation" paragraphs: "This amendment is README-only; Suggested.lean, metadata, toolchain and dependency pins are unchanged." and "Current head 9045e4847e74f74ef4313673d6a2c677cd61c6d7 has its own build".

**Claim:** The head is 41557ba, and `Suggested.lean` was rewritten after 9045e48.

**Witness:** `git diff --stat 9045e48 41557ba`: `Suggested.lean` 222 lines changed, `README.md` 1192. `nodeDifference`, `matchedSections`, `isClosed_matchedSections`, `expectedDimension` are gone; three headline theorems and `IsSomewhereInjective` are stated; README restructured from `## M0.`–`## M13.` into Layers 0–13 with numbered subsections.

**Repair:** Replace both paragraphs with: "The pull request adds `README.md`, `Suggested.lean` and `metadata.toml` under `TauCetiRoadmap/AnalyticStableMaps/`. `Suggested.lean` states the headline theorems `exists_isSomewhereInjective_comp_finiteHolomorphicMap`, `existsUnique_biholomorph_of_isSomewhereInjective` and `finite_isotropy_iff`, with the definition `IsSomewhereInjective`; its docstring names the headlines not statable at the pins." Drop the head hashes and "(60 roadmaps)".

## R02 (P3) — Description cites section labels the README does not have

**Location:** pull request description: "M0.1 constructs normalization of every nonconstant curve", "M2.5 extends only the closed-source smooth-simple branch", "M2.6 works out product-class curves", "M3.1 constructs the explicit CP² conic degeneration".

**Claim:** None of M0.1, M2.5, M2.6, M3.1 is a label in the README at this head.

**Witness:** `grep -o 'M[0-9]+\.[0-9a-z]+' README.md` gives only M2.0 (§2.4) and M2.0a (§2.5). Normalization is §0.5 (line 182), the arbitrary-target branch §2.18–§2.22 (lines 482–530), product-class rigidity §2.23 (line 542), the conic limit §3.8 (line 663).

**Repair:** Replace "M0.1" by "§0.4–§0.5", "M2.5" by "§2.18–§2.22", "M2.6" by "§2.23", "M3.1" by "§3.8"; in "The noncompact target branch uses M2.5's compact-image carrier" write "§2.18's"; in "M0 and the nodal/virtual M3+ development" write "Layers 0 and 3–13".

## R03 (P3) — Supplier paragraph does not match the head's suppliers

**Location:** pull request description: "The analytic domain supplier is ComplexCurveModuli #982. Other proposal inputs include HeegaardFloer #957, ComplexKahlerGeometry #953, ImplicitAtlases #974, TopologicalSheafCohomology #973, and Orbifolds #969, alongside the stated DG/AT/CC/GT/PDE contracts."

**Claim:** Two suppliers are unstated, one named input is not consumed, and all but one named supplier are on main, not proposals.

**Witness:** README line 21 and line 75 (`### From TauCetiRoadmap.PseudoholomorphicCurveAnalysis`); line 30 (FuchsianOrbifolds Layer 5 items 1 and 3); line 26: "Neither TopologicalSheafCohomology nor §C1.2b is consumed here directly". Only ImplicitAtlases is absent from main.

**Repair:** "Suppliers on main: ComplexCurveModuli (nodal domains), PseudoholomorphicCurveAnalysis (PH1, PH3–PH7), HeegaardFloer (F0–F2), PDE, ComplexKahlerGeometry, Orbifolds, MorseNovikov, FuchsianOrbifolds, DifferentialGeometry, CharacteristicClasses, AlgebraicTopology, GeometricTopology. The one open supplier is ImplicitAtlases (#974). TopologicalSheafCohomology is used only through ImplicitAtlases." In the next paragraph, "MorseNovikov #890" becomes "MorseNovikov".

## Previous findings

- none: the previous review, of this same head, raised no finding.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `finite_isotropy_iff` (named in the description's summary; §1.2) | degree-one sphere, no marks, `ι` a point | left: Möbius maps with `u∘e = u`, `u` injective, so `{id}`, finite; right: no constant component, vacuous | both sides true | none |
| same | constant sphere with 2 marks | left: `ℂ*` fixing two points, infinite; right: fixing subgroup of 2 points infinite | both sides false | none |
| same | constant sphere with 3 marks | left: `{id}`; right: `{id}` | both sides true | none |
| §0.5 genus identity (R02's "M0.1") | `z ↦ z²` onto a line: d = 2, g₀ = 0, R = 2 | `2g − 2 = 2·(−2) + 2 = −2`, g = 0 | match | none |
| §2.22 escape test (R02's "M2.5") | `{a} × S²` in `ℝ² × S²`: n = 2, g = 0, `c₁ = 2` | `d_0 = (2 − 3)·2 + 2·2 = 2` = dim of the `a`-plane | match; description's "supplies no global compactness" agrees with line 532 | none |
| §2.23 (R02's "M2.6") | class `[Σ × {p}]` | first projection degree 1, second energy `area(Σ) − area(Σ) = 0`, constant; unmarked quotient F, one-marked `Σ × F` | description's sentence agrees | none |
| §3.8 (R02's "M3.1") | `XY = εZ²`, `ε → 0` | class `2L = L + L`; energy `2 = 1 + 1`; both components nonconstant, 0 ghosts | description's sentence agrees | none |

Rows for all other statements stand as in the previous review, of `41557ba`.

- Gate at this head: every check 0, "OK", exit 0. Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line; ImplicitAtlases at merge-order line 220, AnalyticStableMaps at 221.
- `lake env lean` on `TauCetiRoadmap/AnalyticStableMaps/Suggested.lean`: exit 0; only output three `sorry` warnings (lines 105, 128, 161).
- `git diff --stat origin/main...HEAD` outside the folder: empty.
- Description sentences checked against the head and found consistent: the summary block (main results, consumers DGFloer, TaubesGromov, HamiltonianFloerOperations at README line 1128, approach); title "Add analytic stable-map roadmap" (the roadmap is not on main; 3 files, 1319 insertions); "Only TauCetiRoadmap/AnalyticStableMaps/ changes, topic math.SG" (`metadata.toml`).
- Cross-roadmap citations: `citations.md` lists none unresolved (main 2248bbb, 475 open heads). GromovWittenTheory's open head (its lines 26 and 78) cites §3.7, §4.1, §4.3, §6.2–§6.3, §7.3, §9.2 here, all present.
- Seeded sample: no sampled target lies in a changed passage, as the folder did not change; none re-read this round.
- Overlap check: read GromovWittenTheory (open), ComplexCurveModuli and HeegaardFloer (main); nothing shared. GromovWittenTheory consumes the stable-map data and owns operations and axioms; ComplexCurveModuli (its line 227) and HeegaardFloer (its lines 4129–4130) hand the arbitrary-genus closed stable-map carrier to this roadmap. `overlaps.md` lists no dropped id, no revision-only id and no other pull request changing this folder.
- Source independence: changed passages only; 0 passages changed, so 0 compared; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- McDuff–Salamon, *J-holomorphic Curves and Symplectic Topology*, and Robbin–Ruan–Salamon (Math. Z. 2008): paywalled, settled as uncertified, cited by locator only; nothing this round depends on them.
- The CI runs the description links (for heads 666a8d6 and 9045e48) were not opened; they concern superseded heads (R01).

## Source issues

- none

## For the human reviewers

- none
