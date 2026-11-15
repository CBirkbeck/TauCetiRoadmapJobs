# Review of OrdinaryAutomorphicFormsAndModularityLifting (pull request #1066 at e2406a3)

**Verdict:** needs changes

Incremental re-review of the 4 changed lines since `d7f95e2` (README §2.1, first paragraph reworded; README §2.12 Check on the excluded pairs), and the first check of the pull request's title and description against this head. The folder's two changes are correct and the gate passes; both findings are in the description, which was written for a head before `cde3e6f` moved the Skinner–Wiles route to ClassicalSerreModularity §I.1.

## R01 (P3) — the description's opening paragraph describes a roadmap this head no longer is

**Location.** Pull request description, first paragraph after the `roadmap-summary` block: "…ending with the Skinner–Wiles lifting theorems… The reducible-residual route uses permissible Eisenstein maximal ideals and pro-modularity; the irreducible-residual route uses a chosen distinguished ordinary quotient and an existing modular residual seed."

**Claim.** The roadmap builds both Skinner–Wiles routes (permissible ideals, pro-modularity, the lifting theorems) and keeps them apart from tensor and prescribed-component automorphy for BLGG and Newton–Thorne applications.

**Witness.** README 7: "this roadmap has no permissible-ideal, deformation-datum, pseudo-deformation, pro-modularity, nice-prime, patching-axiom, localized `R = T`, Theorem A, Main Theorem or SW01 Theorem 5.1 target". The head has no tensor or prescribed-component automorphy passage.

**Repair.** Replace the paragraph by: "Supply the inputs and refinements that the Skinner–Wiles ordinary deformation–Hecke route uses and no earlier roadmap states: definite quaternionic pairings, traces and Hilbert realization; nearly ordinary representations, Ihara lemmas, the Newton–Thorne weight change and three Eisenstein inputs; local ordered-flag refinements and Waldschmidt's unit-rank bound; Cohen–Macaulay connectedness, solvable descent and the numerical criterion; Hypothesis H, Theorem B, the conditional full-scope lifting, Washington's theorem and the χ₂-good seed; Hida-family membership and level-lowering base change. The route itself (nearly ordinary Hecke algebras, pseudo-deformation rings, pro-modularity, Theorem A, SW01 Theorem 5.1, exact level) is ClassicalSerreModularity §I.1's and is imported by name, not planned here."

## R02 (P3) — the summary says the factorial-powers idempotent is in Tau Ceti

**Location.** Pull request description, `roadmap-summary` block, "Approach and generality": "its ordinary projector is the factorial-powers idempotent that Tau Ceti already has."

**Claim.** The ordinary idempotent `lim tⁿ!` exists in the Tau Ceti library.

**Witness.** README 15: "the ordinary idempotent is the factorial-powers idempotent of TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants, Layer 2"; README 122 compares with PadicFamilies §0a.14. Both are roadmaps still in pull requests; the pinned Tau Ceti has no such declaration (grep for `idempotent` with `factorial`/`ordinary`: no hit).

**Repair.** Write "its ordinary projector is the factorial-powers idempotent of IntegralHeckeAndGaloisDeterminants Layer 2 and PadicFamilies §0a.14; §1.1 only compares Skinner–Wiles' exponent with it."

## Previous findings

- R01 — repaired: README 377 now reads "the regularised series is `−Σ_{e | rad 𝔞} μ(e)E₂(ez)/24 + (8πy)⁻¹Σ_{e | rad 𝔞} μ(e)/e`, whose non-holomorphic part `(8πy)⁻¹Σ_{e | rad 𝔞} μ(e)/e = (8πy)⁻¹Π_{q | 𝔞}(1 − q⁻¹)` is again nonzero" (the second form of the requested repair). No new problem.

## Verified sound

| Statement | Instance | Computed | Result |
|---|---|---|---|
| Check README 377, `𝔞 ≠ 1`, `𝔟 = 1` (changed) | `E₂* = E₂ − 3/(πy)`, general `𝔞` | `−μ(e)E₂*(ez)/24 = −μ(e)E₂(ez)/24 + μ(e)/(8π·e·y)`; sum over `e ∣ rad 𝔞` gives the stated expression; `Σ μ(e)/e = Π(1 − q⁻¹)` | ✓ |
| same | `𝔞 = (2)` | series `(E₂(2z) − E₂(z))/24 + 1/(16πy)`: constant `0`, coefficient at `m = 1` is `1`, at `m = 2` is `σ₁(2) − σ₁(1) = 2 = Σ_{r ∣ 2} φ₁(2/r)r`; non-holomorphic part `1/(16πy) ≠ 0` | ✓ |
| same | `𝔞 = (6)` | `Σ_{e ∣ 6} μ(e)/e = 1 − 1/2 − 1/3 + 1/6 = 1/3 = (1 − 1/2)(1 − 1/3)` | ✓ |
| §2.1 first paragraph (reworded): uniqueness of a v-good line | `F = ℚ`, `k = 2`, unramified principal series | `T₀(p)`-eigenvalues are the roots of `X² − a_pX + p`, product of valuation `1`: at most one unit root | ✓ |
| §2.1 existence criterion | `X₀(11)`: `p = 3`, `p = 2`, `p = 11` | `a₃ = −1` unit: line exists; `a₂ = −2`, both roots of `X² + 2X + 2` of valuation `1/2`: none; `p = 11` special, `U₁₁`-eigenvalue `a₁₁ = 1`: line exists | ✓ |
| §2.1 existence criterion, excluded case | `π_v` supercuspidal | no nonzero `T₀(p_v)`-eigenvalue on the `U_{a,v}`-invariants, so no unit eigenline; the criterion lists only principal series and special | ✓ |
| §2.1 reworded quantifiers | definition versus the two API bullets "Nearly ordinary" and "Uniqueness" | "every `v ∣ p` admits a v-good line"; "No `v ∣ p` carries more than one": same quantifiers as the bullets and as sw99 925–938; the unit condition applies to both the principal-series and the special case, as at sw99 933 | ✓ |

Rows for every untouched statement stand as in the previous review, of `d7f95e2`.

- Source locators checked against the text: 1 (sampled target 2.1: sw99 lines 925–941, printed pp. 30–31, re-read; the reworded paragraph states the same definition, uniqueness, criterion and notation `Π^ord_k(U_a)`, with `[H3, Corollary 2.2]` cited at README 275). The other fourteen sampled targets lie outside the changed passages.
- Wording: the old paragraph followed sw99 925–938 clause by clause; the new one reorders it (definition, near ordinarity, uniqueness, criterion) and shares no run longer than four words with the source.
- Library declarations opened: none new (the diff names none). Pinned Tau Ceti searched for a factorial-powers or ordinary idempotent: absent (R02).
- Cross-roadmap citations: the diff adds none; the worker's citation scan lists nothing dangling; IntegralHeckeAndGaloisDeterminants "Factorial powers" found at its open head (its README 3075).
- Gate, rerun on this head: every check 0, `OK`. Dependency check: `depcheck: 245 roadmaps, 2251 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Changes outside the folder: none.
- Elaboration: `lake env lean` on a scratch copy of `Suggested.lean` (unchanged since `cde3e6f`): four `declaration uses sorry` warnings (lines 44, 56, 82, 112), no error; `#check @IsCohenMacaulayLocal` and `#check @cyclotomic_classGroup_primary_stabilizes` print the signatures of the worker's file.
- Description otherwise agrees with the head: title equals the README's; the summary's layer contents, the consumers (README 114, 854), `CMComponentSupport` (README 458, 638), "every totally real field" (README 367) and unit stabiliser weights (README 106) all check.
- Overlap check: read GL2ModularityLifting, ClassicalSerreModularity, PadicFamilies (scope as resolved in the review of `cde3e6f`; the diff adds no object); nothing shared.
- Source independence: changed passages only; 2 passages compared with 1 source (sw99), none shared (the §2.12 Check is a computation with no source counterpart); arrangement not compared again, since the diff adds, removes or reorders no layer.

## Not verifiable

- Hida [H3] Corollary 2.2 (README 275, behind the reworded §2.1): not read; cited through sw99 line 934, as in the earlier reviews.
- Shimura 1978 Proposition 3.4, Chai 1990 §4.5, Wiles 1986 Proposition 1.6: paywalled, untouched by the diff.

## Source issues

- none

## For the human reviewers

- none
