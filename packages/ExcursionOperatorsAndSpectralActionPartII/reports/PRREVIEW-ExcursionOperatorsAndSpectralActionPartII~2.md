# Review of ExcursionOperatorsAndSpectralActionPartII (pull request #1832 at cc4ec51)

**Verdict:** needs changes

Incremental re-review: the folder is unchanged since the review of `cc4ec51`; this round reads the pull request's title and description against the head.

## R01 (P3) — The description has a sentence that announces a list and stops

**Location:** pull request description, first paragraph after the `<!-- /roadmap-summary -->` block: "Build Hansen's theory of the stable Bernstein centre on top of the Fargues–Scholze geometric spectral action. The roadmap covers:"

**Claim:** "The roadmap covers:" ends in a colon and nothing follows it; the next paragraph ("Roadmap folder `TauCetiRoadmap/ExcursionOperatorsAndSpectralActionPartII` …") is about the files, not about what the roadmap covers.

**Witness:** `TauCetiRoadmap/ExcursionOperatorsAndSpectralActionPartII/README.md` line 158–160 ("How to read the build") names seven layers, 0 to 6; the description lists none of them after the colon.

**Repair:** Replace the paragraph by: "Adds the new roadmap ExcursionOperatorsAndSpectralActionPartII, which builds Hansen's theory of the stable Bernstein centre on top of the Fargues–Scholze geometric spectral action imported from AutomorphicGaloisRepresentationsPartII AG2.6. Its layers: 0 stable and very stable central distributions; 1 Hecke operators on character spaces; 2 quantitative stable averaging; 3 very stability of the Fargues–Scholze centre; 4 atomic characters and L-packets; 5 centres of extended pure inner forms; 6 stable transfer compatibility." (Or delete "The roadmap covers:".)

## Previous findings

- The previous report (of `cc4ec51`) had no finding; there is nothing to account for.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| Description: "highest weight 4mρ̂ approach stable averaging at rate C/m" against §2.2, §2.4(a) and `weightPushforward_sum_abs_sub_uniform_le` | A₁, φ: ℤα→ℤ/2, α↦1; m=1, 2; m=0 | Weights jα, −2m≤j≤2m, dim 4m+1; masses (2m+1)/(4m+1), 2m/(4m+1); ℓ¹ error 1/(4m+1): 1/5, 1/9 ≤ (1/4)/m; m=0: error 1, excluded by 1≤m | description, README and Lean agree | none |

The rows for the other statements stand as in the previous review, of `cc4ec51`; no statement changed.

- Folder diff since `cc4ec51`: 0 lines; files changed outside the folder: none (`git diff --stat origin/main...HEAD` outside the folder is empty).
- Gate at `cc4ec51` (worker's run): every check passed (`build=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`, `set_option=0`, `sorry-data=0`, `statement-hygiene=0`).
- Dependency check rerun with `--movable`: `depcheck: 240 roadmaps, 2243 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration of `Suggested.lean` rerun with `lake env lean`: one warning, `declaration uses 'sorry'` at line 51; nothing else.
- Description sentences checked against the head, 11, all but R01 agree: Ψ_G imported from AG2.6 (README line 3, 7); every connected reductive G over every finite E/ℚ_p and any ℓ ≠ p (Conventions); τ_G surjective with Levi, transfer and matching compatibilities (§§5.2, 5.3, 6.1, 6.2); weight 4mρ̂ and rate C/m (§§2.2, 2.4, 2.5); rank induction (§3.3); z-embedding reduction for every G (§0.0(b), gap:general-parabolic-excursion-comparison); the SmoothRepresentationsOfLocalGroupsPartII consumer sentence (Downstream consumers); three files in the folder; one Lean theorem, no definition, no `set_option`; 0 outside paths; 4 review and 2 red-team rounds (the board's reports).
- The title and the "Roadmap folder …" paragraph present the folder as a roadmap of its own and name no roadmap on main as revised; the head agrees (the folder is not on `origin/main`, 796 insertions, 0 deletions).
- Overlaps: no other open pull request changes this roadmap, no cited id is dropped or defined only by an open revision, no second copy on main. `roadmaps grep` for "stable Bernstein cent", "atomically stable" and "very stable central/distribution" over the open heads and main finds only this roadmap and one bibliography entry (GeometricSatakeAndFusionPartII, reference HAI14).
- Overlap check: read HeckeStacksAndLocalShtukas, IgusaVarietiesAndTorsionConcentration, GlobalShtukasAndFunctionFieldLanglandsPartII (equal characteristic; imports its parent's excursion operators), SmoothRepresentationsOfLocalGroups (main); the third list is empty; nothing shared.
- Source independence: changed passages only; 0 passages changed, so 0 compared; largest share H26 and the contents comparison stand as in the previous review of `cc4ec51`; no layer added, removed or reordered.

## Not verifiable

- H26's references Var24, Kot88, Art93/Art96 and BDK86 are cited through H26 only; the README cites none of them directly.
- The description's generated blocks (`depends-on`, `merge-order`) are outside this check.

## Source issues

- none (none new; those of the previous review of `cc4ec51` stand)

## For the human reviewers

- **Licence/scope.** FU25 (Fu, arXiv:2501.00652v1, README reference list) is cited as a preprint with no published version named; the single `Suggested.lean` theorem's Fourier bound is deduced from its Lemma 3.1.2 and Proposition 3.3.1. H26 and HKW22 are published in Forum of Mathematics, Pi.
