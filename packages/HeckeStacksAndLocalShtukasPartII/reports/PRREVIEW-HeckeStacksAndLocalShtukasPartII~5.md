# Review of HeckeStacksAndLocalShtukasPartII (pull request #1844 at 754645e)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 236bae3. This round reads the pull request's title and description against the head. No finding.

## Previous findings

- R01 — repaired: the description's summary now reads "shrunken w=x t^λ y with λ^♦−ν_b strictly positive on every simple coroot and (λ_w^♭♭)^♦≥ν_b (both hold if λ^♦≥ν_b+2ρ∨)", the two hypotheses of README §8.1 (line 1818).

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Description's summary of §§8.1–8.2, on the instance that refuted the earlier wording | split adjoint A₂, y=w₀, λ=3ρ∨, ν_b=2ρ∨ | gap α₁∨+α₂∨>0; λ_w^♭♭=3ρ∨−2ρ∨=ρ∨; ρ∨−2ρ∨=−ρ∨ not ≥0 | excluded by the summary's second hypothesis, as by §8.1; he21 line 480–482 |
| Summary's parenthesis "both hold if λ^♦≥ν_b+2ρ∨" (§8.4) | A₂, y=w₀, λ=4ρ∨, ν_b=2ρ∨; A₁, λ=α∨, b=1 | A₂: gap 2α₁∨+2α₂∨>0, λ^♭♭=2ρ∨≥2ρ∨. A₁: λ^♭♭=0≥0, dimension (3+1)/2=2 | holds; README line 1876, he21 line 535–537 |
| Summary: "F-simple quasi-split G" | G=Res_(E/F)PGL₂, λ=(α∨,0), b=1 | λ^♦=(α∨/2,α∨/2), coefficients (1/2,1/2)>0 although λ has a coefficient 0 | the σ-average in the summary is the right one; README §8.3 Check |
| Description: "the chart bound `ExtendedSemiModule.chartIndices_bound`" and "its attainment by the cyclic extended semi-module" | (h,m,μ)=(2,1,(0,1)); (3,2,(0,1,1)); (3,2,(0,0,2)) | right sides 1−1=0; 2−2=0; 4−2=2, so the index set has at most 0, 0, 1 elements | both declared (`Suggested.lean` lines 122, 132); text agrees with head |

Rows for the statements of the folder stand as in the previous review, of 236bae3.

- The description against the head, sentence by sentence: none wrong, no change left unstated. The title and "Roadmap folder … (README, `Suggested.lean`, `metadata.toml`)" match the change (the pull request adds the folder: 2096 insertions, 0 deletions, three files, 75 headings, 7 declarations); base roadmap's stopping point (README lines 13–16); spherical formula (§3.8); corrected Levi obstruction (§7.5); no good-primes restriction (lines 55–57); basic and large-translation specialisations (§§8.3–8.4); one statable headline (lines 266–267 and the module docstring).
- Description's validation line, recomputed: the outside-folder diff against the base is empty; the folder is unchanged since 236bae3 (the head is a merge of main); no `set_option`, no sorried data.
- Description's "4 independent review rounds and 2 red-team rounds": the board holds 4 package reviews and 2 red-team rounds for this roadmap.
- Source locators read this round: he21 Theorem 1.1 (line 66–68), Theorem 6.1 (line 480–482, printed p. 13), Remark 6.2 (line 483–485), Corollary 6.4 (line 535–537, printed p. 14); the sampled §§8.1 and 8.2 agree with them. The other sampled sections are unchanged and stand as previously verified.
- Gate at 754645e: every check passed (`build=0`, `depcheck=0`, `statement-hygiene=0`, `outside-folder=0`, `stray-files=0`).
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with the two `declaration uses sorry` warnings (lines 122, 132) and nothing else; the seven elaborated signatures are unchanged, no binder lost.
- Dependency check, exact output: `depcheck: 240 roadmaps, 2243 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. Citation resolver: no cross-roadmap citation found nowhere (the three Lean names it lists are this file's own declarations). Overlap tool: no pull request changes this roadmap, no dropped id, no revision-only id, no second copy.

Overlap check: read BunGAndNewtonStrata, GeometricSatakeAndFusionPartII, GeometricSatakeAndFusion, HeckeStacksAndLocalShtukas, GlobalShtukasAndFunctionFieldLanglands, ReductiveGroupsPartII, RootSystemsPartII, RootSystems; nothing shared (the third list is empty; a search of every open head and of main finds affine Deligne–Lusztig loci, semi-modules and cordial elements in the other roadmaps only in their reference lists).

Source independence: changed passages only; the folder did not change, so 0 passages compared with 0 sources; largest share he21, 37 of 134 source citations in the layers; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- None.

## Source issues

- none

## For the human reviewers

- none
