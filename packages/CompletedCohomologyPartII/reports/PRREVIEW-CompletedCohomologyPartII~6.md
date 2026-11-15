# Review of CompletedCohomologyPartII (pull request #1035 at e9263dc)

**Verdict:** accepted

Incremental re-review of 2 changed lines since 867beac (one sentence of the §8.4 proof plan), and of the pull request's title and description as they stand now. No finding.

## Previous findings

- R01 — repaired: the description now lists eleven open suppliers by section ("ArithmeticLocallySymmetricSpaces: Layers ALS.0–ALS.4, ALS.5a and ALS.6, and §ALS.F.2 …"), six suppliers on main, and names the three consumers as "consumers, not prerequisites".

## Verified sound

| # | Statement | Instances | Values | Result | Change |
|---|---|---|---|---|---|
| 1 | `TauCetiRoadmap/CompletedCohomologyPartII/README.md` line 1785 (§8.4 proof plan): "…dictionaries of ModularCurvesPartII §§14.1–14.4a and of §8.3 here" | the two cited ids; the statement paragraph and `*Needs:*` line of §8.4 | this README line 1761 `### 8.3 Hilbert finite-level coefficient input`; ModularCurvesPartII head has §§14.1, 14.2, 14.3, 14.4, 14.4a and no Hilbert dictionary; §8.4 statement says "8.3 the Hilbert and quaternionic Shimura-curve one"; `*Needs:*` lists §8.3 | citation now unambiguous and consistent | none |
| 2 | §8.4 comparison (the statement the changed sentence serves), against the Checks of §§8.3–8.4 | noncompact modular curve, `O/ϖ^s`; compact quaternionic Shimura curve; rank-one coefficient with automorphism `u` | `H_c^0 = 0`, `H^0 = O/ϖ^s`: the support comparison cannot be the ordinary one; proper case `H_c = H`; dual carries `u⁻¹`, bidual `u` | Checks agree with the statement | none |
| 3 | `completedHecke_decomposition` (`Suggested.lean` line 59) as the description words it | `J` a point, `F = ℤ/4 × 𝔽₃`, `A₀ = 𝔽₂ × 𝔽₃`, `q` reduction | `ker q = (2) × 0` = Jacobson radical; 2 maximal ideals ↔ 2 of `A₀`; residue fields `𝔽₂`, `𝔽₃`; localisations `ℤ/4`, `𝔽₃`; product `≅ F`; finite discrete, so compact T2 | true; description's hypotheses and conclusions match the Lean binder by binder | none |
| 4 | Description, open suppliers (11 bullets) | each bullet against the README's contract and `*Needs:*` lines | ALS.0–ALS.6 with ALS.5a (line 111), ALS.F.2 (145, 220, 1187); NCEI §§0.2, 0.4, 0.10–0.11, F.1–F.2 (139–141); IHGD §§2.1–2.2 (131); PLL §§0.1, 0.3 (149); AGD §D7.3 (18, 145); DDPA §§7.3, 7.5–7.7, Layer 8 (153); LAD §§0.0–0.3 (157); MCII §§9.11–9.12, 14.1–14.4a, 14.8, 14.11 (161); CCPII C6.1–C6.5 (169); ShimuraVarieties Layers 5–6, §§8.1–8.5, 8.8 (27, 1759); HMVSC §§R18.4.12–13 (1775) | all agree; none on main | none |
| 5 | Description, suppliers on main and the roadmaps "named only to mark what this roadmap does not own" | every roadmap name in the README, tested for a folder on main | on main: AlgebraicTopology (Stages 2, 4–6: line 239), ProfiniteProPGroups, SmoothRepresentationsOfLocalGroups, PadicMeasuresIwasawaAlgebras (Layers 0–1, §5.2: line 1269), DerivedModuleAlgebra, EnhancedDerivedSheaves, ProfiniteCohomology (line 89, §6.2); EtaleDualityAndPerverseSheaves line 27, AutomorphicSpectralTheory lines 1367, 2115, PerfectoidShimuraVarieties line 2208: boundary statements only | agrees | none |
| 6 | Description, first prose paragraph, `Suggested.lean` paragraph, Validation | diff against `origin/main`; module docstring; gate; elaboration | folder added: 3 files, 2323 insertions, 0 deletions, nothing outside; 3 declarations (2 definitions with bodies, 1 `sorry` theorem); docstring names the absent carriers of §§0–4 and the headlines of §§5–8; Scholze comparison ← §8.6 in TorsionCohomologyInfrastructure Layer 2 (lines 31, 2206) | agrees | none |

Rows for the other statements of the folder stand as in the previous review, of `867beac`; the diff changes no statement.

- Gate at e9263dc, run from the worktree: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate adds `build=0`.
- Dependency check with `--movable`: `depcheck: 245 roadmaps, 2243 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean`, 15 s, one warning (`59:8: declaration uses sorry`), no error. The file did not change since `867beac`; the three elaborated types are those of the worker's `signatures.md`, no binder lost.
- Files outside the folder: `git diff --stat origin/main...HEAD` restricted to the rest of the repository is empty.
- Cross-roadmap citations resolved this round: 2 (ModularCurvesPartII §§14.1–14.4a and HilbertModularVarietiesAndShimuraCurves §§R18.4.12–R18.4.13, both at their open heads); the worker's resolver reports no cross-roadmap citation found nowhere. Its five Lean-name leads (`CanonicalTower.*`, `DualitySupport.*`) are suppliers' target names in untouched text: a remark, no change asked.
- Overlaps: no other open pull request changes this roadmap, no cited id is dropped, no id is defined only by an open revision, no second copy on main.
- Source locators: 0 re-read; the changed sentence carries none, and no target of the seeded sample falls in §8.4's proof plan.
- Remark, no change asked: README line 1673 writes "ALS.5" where the contract (line 111) and the description say ALS.5a; untouched text.

Overlap check: no layer or ownership changed, so the scopes of CompletedCohomologyAndLocalGlobalCompatibility, TorsionCohomologyInfrastructure and SelmerIwasawaCohomology were not re-read; the earlier result stands (nothing shared: the first two consume §§8.4, 8.10–8.13 and §8.6), and the third closest-roadmap list is empty.

Source independence: changed passages only; 1 passage compared (the five added words "and of §8.3 here", an internal cross-reference with no source wording) with 0 sources, none shared; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, with author-side red-team passes to follow" in the description: a statement about process that the head neither supports nor contradicts.
- The seeded sample's source locators were not re-read in this incremental round; they stand as checked by the earlier full review.

## Source issues

- none

## For the human reviewers

- Licence: source E11 (Emerton, local–global compatibility manuscript of 23 March 2011) is listed in the README's References (line 2228) as unpublished, read from the author's page; F.1 and Layer 3 cite its Appendices B and C.
