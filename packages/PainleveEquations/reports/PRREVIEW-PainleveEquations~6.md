# Review of PainleveEquations (pull request #1955 at 693f9f7)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 693f9f7: the folder is unchanged; the rewritten title and description were read against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads "Two gaps to AlgebraicModuliForArithmeticGeometry (#853) specify the relative projective GIT inputs", and names `gap:reductive-connection-git` and `gap:relative-hilbert-mumford` with what each requests.

## Verified sound

| Statement | Instances | Computed values (both sides) | Result | Change |
|---|---|---|---|---|
| Description: "Two gaps to AlgebraicModuliForArithmeticGeometry" | README lines 87, 89 | description: 2 gaps, both slugs; head: 2 gaps, same slugs, same supplier | agree | — |
| Description: `gap:reductive-connection-git` "requests the relative invariant Proj and its comparison with the geometric quotient on the stable locus when stability and semistability coincide" | README line 87 | head: invariant Proj projective over X₀//G; geometric quotient of the stable locus "wherever stable equals semistable" | agree | — |
| Description: `gap:relative-hilbert-mumford` "used in §§1.3 and 4.2–4.4" | `*Needs:*` lines of §§1.3, 4.2, 4.3, 4.4; lines 537, 1053, 1085 | all four cite the reductive-GIT supplier; numerical criterion applied at lines 537 (§1.3) and 1053 (§4.3), its linearization reused at 1085 (§4.4) | agree | — |
| `gap:relative-hilbert-mumford`, weight convention of line 91 | 𝔾_m on ℙ¹, t·(x,y) = (t⁻¹x, ty), ℒ = O(1), X₀ a point | [1:1]: limits [1:0], [0:1], weights on ℒ +1, +1, stable; [1:0]: weights +1, −1, unstable; invariants (xy)^k vanish at [1:0] | criterion and invariants agree | — |
| Both gaps: not already provided by the supplier | AlgebraicModuliForArithmeticGeometry on main | grep for Hilbert–Mumford, invariant Proj, linearly reductive: 0 hits | gaps stand | — |
| Description: "55 targets across eight layers" | README table, lines 11–20 | 8+6+4+12+9+6+5+5 = 55; 19 general + 36 application | holds | — |
| Description: ComplexComparisonPartII §§C3.2d.2–C3.2d.3, C3.2f.1–C3.2f.2 | that roadmap on main | headings at lines 2498, 2516, 2582, 2600; `picardZeroCriterion` at 2602 | resolve | — |
| Description: "framed Artinian lifting interface of #853", §1.5 "line-connection torsor and the smooth determinant map" | AlgebraicModuliForArithmeticGeometry on main; README line 147 and §1.5 | §7.3 at line 9078, `picard_infinitesimal_lifting` at 9180; §1.5 proves "smoothness of the determinant map", line 147 "constructs the line-connection torsor" | resolve, agree | — |
| Description: ordinary and formal connection suppliers | CrystallineCohomology, FormalConnectionsOpers on main | CR.1.3 at line 1120; F1.1 line 511, F2.4 line 827, F3.4 line 1123 | resolve | — |
| Description: "PVI signature takes a holomorphic universal cover as input" (`painleveVI_meromorphic_extension`) | α = γ = 1, β = −4, δ = 0, q ≡ 2, ball centre 5 radius 1 | `hdom` holds (t ≠ 0, 1, 2); q″ = 0; bracket at t: 1 − t + (t − 1) = 0, at t = 5: 1 − 5 + 4 = 0; f ≡ 2 meromorphic, equals q∘p | consistent; cover is `hcover`, `hsimple`, `hp`, `hregular` | — |
| Description: "six scalar meromorphic continuation signatures in §7.2", topic `math.AG` | `Suggested.lean`, `metadata.toml` | 6 theorems; `topic = "math.AG"` | holds | — |
| Description: "elaborate with auto-implicit binders disabled" | scratch copy with `autoImplicit false` | 6 `sorry` warnings, no error | holds | — |
| Description: Layer 4 sentence (projective forgetful morphism, irreducible realization and closedness, fixed decorated data) | README line 991, lines 1087, 1091 | same three proof routes, same order of conclusions (properness, surjectivity, complete transport) | agree | — |
| Description: scope exclusions | README line 37 | confluence; "boundary-value asymptotics and connection constants" | holds | — |

The rows of the previous reviews for the roadmap's own statements stand as in the previous review, of 693f9f7; the diff changes no statement.

- Description, the other layer sentences (0–3, 5–7) read against lines 191–195, 433–443, 628–634, 730–738, 1205–1230, 1328–1332, 1449 and the §7.1–§7.5 headings: none contradicted. Title "Add a roadmap": the folder is not on main (1852 insertions, 0 deletions).
- Gate at 693f9f7: every scanner 0, `depcheck=0`, `outside-folder=0`, `build=0`, OK. `git diff --stat origin/main...HEAD` outside the folder is empty.
- Dependency check: `depcheck: 261 roadmaps, 2601 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration of `Suggested.lean` at the pins: six `sorry` warnings (lines 26, 33, 40, 54, 64, 78), nothing else; the six elaborated signatures are as recorded, no binder lost.
- Cross-roadmap citations resolved this round: 4 roadmaps, 11 section or declaration ids, all on main now (CrystallineCohomology, AlgebraicModuliForArithmeticGeometry, ComplexComparisonPartII, FormalConnectionsOpers have merged; the citation resolver lists nothing missing).
- Remark: the generated `depends-on` block still heads its list "suppliers still open"; its four entries are ticked and all four are on main.
- Seeded sample: no sampled target falls in a changed passage (0 changed lines); no source locator was re-read this round.
- Overlaps: no open pull request changes this roadmap; no cited id is dropped or defined only by an open revision.
- Overlap check: read ComplexComparisonPartII, FormalConnectionsOpers, HeegaardFloer, RelativisticQuantumFieldTheory, StableReductionPartII, PadicDifferentialEquationsAndRigidCohomology; nothing shared.
- Source independence: changed passages only; the diff changes no passage, so 0 passages compared with 0 sources; largest share I23, 33 of 162 locators; contents not compared again, no layer added, removed or reordered.
- Research link: the roadmap constructs the Painlevé equations as isomonodromic connections on moduli of decorated meromorphic connections (Inaba 2023; van der Put–Saito 2009; Inaba–Iwasaki–Saito 2006) and proves the Painlevé property through the Riemann–Hilbert comparison; rests on the README's summary and references.

## Not verifiable

- MFK94, GR84 and JK94 (paywalled) remain unread, as in the previous reviews; no changed passage depends on them.

## Source issues

- none

## For the human reviewers

- Not tested: no report of this roadmap that I was given records a comparison of the README's arrangement with the contents of I23 (33 of 162 locators); this incremental round does not compare it either.
- Licence: the description states "GPT-6 via Codex assisted with drafting, revision and dependency checks"; no formalisation other than the pinned libraries was found matching the six declarations of `Suggested.lean` (library near-matches: 0 same-name hits).
- Gaps: `gap:reductive-connection-git` and `gap:relative-hilbert-mumford` are addressed to AlgebraicModuliForArithmeticGeometry, which is now on main and states neither (README lines 87, 89).
