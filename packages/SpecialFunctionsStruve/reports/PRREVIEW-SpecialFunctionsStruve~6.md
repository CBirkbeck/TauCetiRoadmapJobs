# Review of SpecialFunctionsStruve (pull request #2129 at 83a3d1d)

**Verdict:** accepted

No findings. This round is an incremental re-review of 0 changed lines since `83a3d1d`; it checks the pull request's title and description against the head.

## Previous findings

- none: the previous review, of `83a3d1d`, had no findings.

## Verified sound

| Statement | Instances and values | Result |
|---|---|---|
| Description: 11.7.6 last term is `z^{2ν+2}/2^{ν+1}`, DLMF's `(z²/2)^{ν+1}` wrong for `|ph z| > π/2` (README 675–679) | `ν = ½`, `z = e^{i}`: residual `9.7×10⁻¹⁷` with either form. `z = e^{2i}`: `1.1×10⁻¹⁶` with the README's form, `0.26596` with DLMF's (the two terms differ by the factor `−1`) | as described |
| Description: 11.11.8 holds only in `|ph ν| ≤ π − arctan(−μ(λ)/π) − δ` for `0 < λ < 1` (README 986–988, `isBigO_angerWeberA_scaled`) | `λ = ½`: `μ = −0.4509325`, `θ = 0.1425625`, edge `π − θ = 2.9990301`; the same formula stands at README 988 | as described |
| Description: "26 headlines"; local copies of `Y_ν`, `I_ν`, `Hi`, Fresnel, Gauss `F` | `Suggested.lean`: 26 `theorem`, 20 `def` (8 supplier copies: `besselY`, `besselI`, `scorerHi`, `fresnelC`, `fresnelS`, `eulerIntegral`, `IsEulerContinuation`, `gaussHypergeometric`); 26 `sorry` warnings | counts agree |
| Description: imports only Mathlib and Tau Ceti's `RegularizedHypergeometric` | `Suggested.lean` lines 3–4: `Mathlib`, `TauCeti.Analysis.SpecialFunctions.RegularizedHypergeometric`; nothing else | agrees |
| Description: the 8 layers and their contents | 8 `## Layer` headings; 26 subsections match the 8 list items one by one (3.2 has 11.5.8 at README 520; 8.4 has Scorer's `Hi`) | agrees |
| Description: corrected 11.4.15, 11.7.12, 11.11.6, 11.11.18–11.11.19; 11.11.8 separately | README 39–40 and 1129–1131 list the same four; 11.11.8 at 986 | agrees |
| Description: suppliers and what each is used for | README 42–53 and 207–279: Bessel (every layer; Debye for 4.3 and 11.11.13_5 in 8.3, README 228–229), Airy (8.4), EiLi (7.3), AsymptoticExpansions (Watson 4.2, Laplace 5.2–5.5, stationary phase 6.2, line shift 8.2), ZerosOfLFunctions (1.2, 1.3), Hypergeometric (6.3) | 6 of 6 agree |
| Description: "Outside the roadmap" | README 1109–1123: off-sheet values, §11.9(iii) uniform expansions, §11.5(ii) loop integrals, order integrals, §11.8, §§11.12–11.16 | agrees |

The rows for the statements of the folder stand as in the previous review, of `83a3d1d`.

- **Pull request text.** Title "new roadmap": the folder is not on `origin/main` (1548 insertions, 0 deletions, 52 headings and 46 declarations added, none removed). No sentence of the description is contradicted by the head, and no change is left unstated.
- **Library declarations opened at the pin: 4.** `Complex.regularizedHGFun` (Mathlib `Analysis/SpecialFunctions/RegularizedHypergeometric.lean` 192), `radius_regularizedHGFunSeries_eq_top` (249), `analyticAt_regularizedHGFun_of_card_le` (287), `Complex.besselJ` (Mathlib `Analysis/SpecialFunctions/Bessel.lean` 55). No Struve, Lommel, Anger or Weber function in either pinned library.
- **Cross-roadmap citations.** The five suppliers the description places on main are on main. SpecialFunctionsBessel is an open new roadmap, as the description says; its head has every cited section (1.1–1.4, 1.7–1.8, 2.2, 2.4, 2.6, 3.1, 4.3, 5.1–5.2, 6.1, 8.1, 8.2, 8.4, 9.1–9.2) and names this roadmap as consumer of 10.22.2 and 10.43.2.
- **Gate.** The worker's gate at this head: every check `0`, `build=0`, `OK`. Rerun without the candidate order, it reports only `NOT IN ORDER` (the roadmap is placed after its last supplier; not a defect). Nothing changed outside the folder.
- **Dependency check** (the brief's command): `depcheck: 247 roadmaps, 2236 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean` on `Suggested.lean`: exit 0, 26 `declaration uses sorry` warnings, no other warning, no error.
- Overlap check: read SpecialFunctionsBessel, SpecialFunctionsGeneralizedHypergeometric, SpecialFunctionsAiry; nothing shared (both open ones name SpecialFunctionsStruve as owner of the Struve, Lommel and Anger–Weber functions; no other roadmap mentions them).
- Source independence: changed passages only; 0 passages changed, so 0 compared; largest share DLMF Chapter 11; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- The description's account of earlier local reviews and their finding counts (five, seven, thirteen, four) is history outside this head; I did not check it.

## Source issues

- **Error** in DLMF-11.7 at 11.7.6, §11.7(i): the source writes the last numerator as a principal power of `z²/2`; it should be `z^{2ν+2}/2^{ν+1}`, which differs where `|ph z| > π/2`; affects a stated result.
- **Misprint** in DLMF-11.4 at the sentence after 11.4.15, §11.4(ii) (DLMF-11.4 lines 505–506): the source takes `|ν₀ + 3/2|` as the smallest of `|ν + 3/2|`, `|ν + 5/2|`, `|ν + 9/2|`, …; it should be `|ν + 3/2|`, `|ν + 5/2|`, `|ν + 7/2|`, …; affects nothing.
- **Error** in DLMF-11.7 at 11.7.12, §11.7(ii) (DLMF-11.7 line 413): the source requires only `Re(μ + ν) > 0`; it should also require `Re μ > −3/2` and `Re ν > −3/2` (at `μ = 3`, `ν = −2` the integral diverges); affects a stated result.
- **Error** in DLMF-11.11 at 11.11.6, §11.11(ii) (DLMF-11.11 line 266): the source puts `O(ν^{−2})` in the bracket for complex `ν`; it should be `O(e^{π|Im ν|} ν^{−2})`; affects a stated result.
- **Error** in DLMF-11.11 at 11.11.8, §11.11(iii) (DLMF-11.11 line 351): the source gives the sector `|ph ν| ≤ π − δ` for every fixed `λ > 0`; it should be `|ph ν| ≤ π − arctan(−μ(λ)/π) − δ` for `0 < λ < 1`; affects a stated result.
- **Error** in DLMF-11.11 at 11.11.18–11.11.19, §11.11(iii) (DLMF-11.11 lines 919–922): the 1.1.2 clarification extends them to `|ph ν| ≤ π − δ`; they should hold only as `ν → +∞` through real values, since `sin(νπ) 𝐀_ν(ν)` dominates off the axis; affects a stated result.
- **Misprint** in DLMF-11.11 at the proof sketch of 11.11.18–11.11.19 (DLMF-11.11 line 908): the source writes "Dervivable"; it should be "Derivable"; affects nothing.

## For the human reviewers

- **Licence.** README 1125–1150 names the author's `lean-DLMF` (Apache-2.0) as prior formalization with a per-layer counterpart table; whether `Suggested.lean` statements are adapted from it, and the attribution owed, was not compared.
- **Scope/arrangement.** README 62–69 ties Layers 1–8 to DLMF §§11.2, 11.4, 11.5, 11.6, 11.7, 11.9, 11.10, 11.11, in that order; DLMF Chapter 11 is the source of nearly every locator.
