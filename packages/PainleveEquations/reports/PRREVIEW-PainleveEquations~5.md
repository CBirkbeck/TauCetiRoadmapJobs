# Review of PainleveEquations (pull request #1955 at 693f9f7)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 693f9f7: the folder is unchanged, and this round reads the pull request's title and description against the head. One point in the description; nothing in the folder.

## R01 (P3) — The description names one of the two declared GIT gaps

**Location:** pull request description, paragraph on suppliers: "The relative projective GIT input for the connection and Stokes incidence quotients is recorded as `gap:reductive-connection-git` to AlgebraicModuliForArithmeticGeometry (#853)."

**Claim:** The head records the GIT input as two gaps to that supplier; the description, written before commit 693f9f7 added the second, leaves `gap:relative-hilbert-mumford` unstated.

**Witness:** `TauCetiRoadmap/PainleveEquations/README.md` line 87 (`gap:reductive-connection-git`) and line 89 (`gap:relative-hilbert-mumford`); `git log -S'gap:relative-hilbert-mumford'` gives 693f9f75 only.

**Repair:** Replace the sentence with: "The relative projective GIT inputs for the connection and Stokes incidence quotients are recorded as two gaps to AlgebraicModuliForArithmeticGeometry (#853): `gap:reductive-connection-git` (the relative invariant Proj and the geometric quotient of the stable locus) and `gap:relative-hilbert-mumford` (the relative Hilbert–Mumford numerical criterion used in §§1.3 and 4.2–4.4)."

## Previous findings

- none: the previous report (of 693f9f7) accepted and listed no finding.

## Verified sound

| Statement | Instances | Computed values (both sides) | Result | Change |
|---|---|---|---|---|
| Description: "55 targets across eight layers" | README table, lines 11–20, and headings `### k.n` | 8+6+4+12+9+6+5+5 = 55; general 8+6+4+1 = 19, application 36; headings counted per layer agree | holds | — |
| Description: gap sentence | README lines 87, 89 | description: 1 gap; head: 2 gaps, same supplier | differs | R01 |
| Description: ComplexComparisonPartII §§C3.2d.2–C3.2d.3, C3.2f.1–C3.2f.2 | that roadmap at its open head a021e44 | lines 2488, 2506, 2572, 2590: `relative_picard_algebraicSpace`, diagonal and separatedness, `picardZeroSheaf`, `picardZeroCriterion` | resolve | — |
| Description: framed Artinian lifting interface of AlgebraicModuliForArithmeticGeometry | that roadmap at e5f9c4c | §7.3 at line 9079, `picard_infinitesimal_lifting` at line 9181; README line 147 cites §7.3 | resolves | — |
| Description: ordinary and formal connection suppliers | CrystallineCohomology at b97c462; FormalConnectionsOpers at 4b3f57b | §CR.1.3 at line 1121; F1.1 line 511, F2.4 line 827, F3.4 line 1123 | resolve | — |
| Description: §1.5 "smooth determinant map", with the dimension it yields | r = 2, g = 0, deg P = 4 | unfixed 2·4·(−1)+2+2·4 = 2; fixed 2·3·(−1)+2·4 = 2; equal in genus zero as line 581 says | holds | — |
| Description: "PVI signature takes a holomorphic universal cover as input" (`painleveVI_meromorphic_extension`) | α=β=γ=δ=0, q ≡ 2, ball centre 5 radius 1, any cover p with p s₀ = 5 | `hdom`: t ≠ 0, 1, q ≠ 0, 1, t all hold; q″ = 0, right side 0 (first two terms carry q′, last bracket is 0); f ≡ 2 is meromorphic and equals q∘p | consistent; cover is the hypotheses `hcover`, `hsimple`, `hp`, `hregular` | — |
| Description: "six scalar meromorphic continuation signatures in §7.2", topic `math.AG` | `Suggested.lean`, README lines 1526–1535, `metadata.toml` | 6 theorems, all 6 named in the §7.2 table; `topic = "math.AG"` | holds | — |
| Description: "elaborate with auto-implicit binders disabled" | scratch copy with `autoImplicit false` | 6 `sorry` warnings, no error | holds | — |
| Description: scope exclusions | README line 37 | confluence, "boundary-value asymptotics and connection constants" both listed as excluded | holds | — |

The rows of the previous review for the roadmap's own statements stand as in the previous review, of 693f9f7; the diff changes no statement.

- Description, layer by layer: each of the eight layer sentences was read against the layer's introduction and headings at the head (lines 189–216, 429–443, 628–634, 730–738, 985–991, 1199–1230, 1324–1332, 1445–1474, 1551–1581); none is contradicted. Title "Add a roadmap": the folder is not on main (1852 insertions, 0 deletions).
- Gate at 693f9f7 with the candidate merge order: every scanner 0, `depcheck=0`, `outside-folder=0`, OK. `git diff --stat origin/main...HEAD` outside the folder is empty.
- Dependency check: `depcheck: 245 roadmaps, 2216 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. Order: CrystallineCohomology 25, AlgebraicModuliForArithmeticGeometry 36, ComplexComparisonPartII 41, FormalConnectionsOpers 42, PainleveEquations 43.
- Elaboration of `Suggested.lean` at the pins: six `sorry` warnings (lines 26, 33, 40, 54, 64, 78), nothing else. The six elaborated signatures equal those recorded last round; no binder lost.
- Cross-roadmap citations resolved this round: 4 (the four open suppliers the description names); the other suppliers of the contracts are on main (ComplexKahlerGeometry, SmoothBundlesConnections, DifferentialGeometry, ComplexCurveModuli, SchemeAndStackFoundations, AlgebraicVectorBundles, JacobianChallenge, FormalLaurentPuiseux, OperatorTheory/OperatorIdeals, OperatorTheory/ToeplitzOperators, RandomMatrices, Completed/UniversalCovers), so the description's list of open suppliers is complete.
- Seeded sample: no sampled target falls in a changed passage (0 changed lines); no source locator was re-read this round.
- Overlaps: no open pull request changes this roadmap, no cited id is dropped or defined only by an open revision. `roadmaps grep` for isomonodromy, Okamoto, Stokes data and meromorphic connections: FormalConnectionsOpers Layer 8 (isomonodromy groupoid of opers on the formal disc) and MappingClassGroupsAndCanonicalRepresentations §5.3 (isomonodromic deformation of one regular-singular flat bundle over Teichmüller space) are different objects from the connection on moduli of §2.4.
- Overlap check: read ComplexComparisonPartII, FormalConnectionsOpers, RelativisticQuantumFieldTheory, HeegaardFloer, ComplexCurveModuli, SymplecticGeometry/HamiltonianReduction; nothing shared.
- Source independence: changed passages only; the diff changes no passage, so 0 passages compared with 0 sources; largest share I23, 33 of 162 locators (VDPS09 32); contents not compared again, no layer added, removed or reordered.

## Not verifiable

- MFK94, GR84 and JK94 (paywalled) remain unread, as in the previous review; no changed passage depends on them.

## Source issues

- none

## For the human reviewers

- Not tested: no report of this roadmap that I was given records a comparison of the README's arrangement with the contents of I23 (33 of 162 locators); this incremental round does not compare it either.
- Licence: the description states "GPT-6 via Codex assisted with drafting, revision and dependency checks"; no formalisation other than the pinned libraries was found matching the six declarations of `Suggested.lean` (library near-matches: 0 same-name hits).
- The pull request is marked draft in the open-roadmap index.
