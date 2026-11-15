# Review of HeckeStacksAndLocalShtukasPartII (pull request #1844 at 236bae3)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 236bae3. This round reads the pull request's title and description against the head. One sentence of the description states the final theorem with a hypothesis missing; the folder itself needs no change.

## R01 (P3) — The description's summary states the shrunken-chamber theorem without the double-flat Newton bound

**Location:** pull request description, block `roadmap-summary`, first paragraph: "for shrunken w with a strict Newton gap, X_w(b) is nonempty exactly when κ(w)=κ(b) and the finite part η_σ(w) has full σ-support, and then has dimension d_w(b)."

**Claim:** The head proves the equivalence under two Newton hypotheses, not one. `TauCetiRoadmap/HeckeStacksAndLocalShtukasPartII/README.md` §8.1 (line 1818) assumes λ^♦ − ν_b strictly positive on every simple coroot and (λ_w^♭♭)^♦ ≥ ν_b; line 1876 names them separately.

**Witness:** Split adjoint A₂, w = x t^(3ρ∨) w₀, ν_b = 2ρ∨: λ − ν_b = α₁∨+α₂∨ is strictly positive, κ agrees, but λ_w^♭♭ = 3ρ∨ − 2ρ∨ = ρ∨ ≱ 2ρ∨. §8.1 and he21 line 480–482 assert nothing here.

**Repair:** Replace the clause by: "for shrunken w with λ^♦ − ν_b strictly positive on every simple coroot and (λ_w^♭♭)^♦ ≥ ν_b (both hold when λ^♦ ≥ ν_b + 2ρ∨), X_w(b) is nonempty exactly when κ(w)=κ(b) and the finite part η_σ(w) has full σ-support, and then has dimension d_w(b)."

## Previous findings

- none: the previous report, of 236bae3, had no finding (its R01 and R02 concerned e1a397e and were recorded there as repaired; the passages are unchanged at this head).

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §8.1 hypotheses, against the description's summary (R01) | split adjoint A₂, y=w₀, J=S, λ=3ρ∨, ν_b=2ρ∨ | ρ_J∨=η_J∨=ρ∨; λ_w^♭♭=ρ∨; gap α₁∨+α₂∨>0; ρ∨−2ρ∨=−ρ∨ not ≥0; κ: 3ρ∨, 2ρ∨∈Q∨ | README needs both hypotheses; summary names one |
| §8.1, rank one: the two hypotheses coincide | adjoint A₁, y=s, λ=kω∨, ν_b=nω∨ | κ match: k≡n mod 2; gap k>n gives k≥n+2; λ^♭♭=(k−2)ω∨≥nω∨ | no separation in A₁; rank 2 needed |
| §8.4 implies both hypotheses (description: "large-translation specialisations") | adjoint A₁, λ=α∨=2ρ∨, b=1 | (λ^♭♭)^♦=0≥0; gap 2ρ∨; dimension (3+1)/2=2 | holds; he21 line 535–537 |
| Description: "`ExtendedSemiModule.chartIndices_bound`" and "its attainment" | `Suggested.lean` lines 122, 132 | both declared; (h,m,μ)=(2,1,(0,1)): right side (−1·0+1·1)−1=0, V=∅ | text agrees with head |

Rows for the statements of the folder stand as in the previous review, of 236bae3.

- The description against the head, sentence by sentence: 1 sentence wrong (R01). Checked and agreeing: the title (the pull request adds the folder: 2096 insertions, 0 deletions, three files); base roadmap's stopping point (README lines 13–16); consumers (lines 1907–1912); spherical formula (§3.8, line 1035); all-classes Levi obstruction with the erratum (§7.5, lines 1753–1762); no good-primes restriction (lines 55–57); reused `DoubleCoset` and `CoxeterSystem.parabolic` declarations (lines 88–109); "one headline statable" (lines 266–267 and the module docstring); the Lean imports only `Mathlib`.
- Description's validation line, recomputed: gate all checks 0; `git diff --stat origin/main...HEAD` outside the folder empty; no `set_option`; no sorried data.
- Description's "4 independent review rounds and 2 red-team rounds": the board holds 4 package reviews and 2 red-team rounds for this roadmap.
- Source locators read this round: he21 Theorem 1.1 (line 66–68), Theorem 6.1 (480–482), Remark 6.2 (483–485), Corollary 6.4 (535–537).
- Gate at 236bae3: every check passed (`build=0`, `depcheck=0`, `statement-hygiene=0`, `outside-folder=0`, `stray-files=0`).
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with the two `declaration uses sorry` warnings (lines 122, 132) and nothing else; the seven elaborated signatures are those of the previous review, no binder lost.
- Dependency check, exact output: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. Citation resolver: no cross-roadmap citation found nowhere. Overlap tool: no pull request changes this roadmap, no dropped id, no revision-only id, no second copy.
- Remark, no change asked: the pinned Tau Ceti has `TauCeti.IsUnramified.residueBasis` (a basis of a residue field extension), a different object in a different namespace from this file's `residueBasis`.

Overlap check: read BunGAndNewtonStrata, GeometricSatakeAndFusionPartII, GeometricSatakeAndFusion, HeckeStacksAndLocalShtukas, GlobalShtukasAndFunctionFieldLanglands, ReductiveGroupsPartII, RootSystemsPartII, RootSystems; nothing shared (the third list is empty; affine Deligne–Lusztig loci, semi-modules and cordial elements occur in the other roadmaps only in their reference lists).

Source independence: changed passages only; the folder did not change, so 0 passages compared with 0 sources; largest share he21, 37 of 134 source citations in the layers; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- None.

## Source issues

- none

## For the human reviewers

- none
