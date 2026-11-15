# Review of GrossZagierAndArithmeticHeights (pull request #1487 at 9d72f01)

**Verdict:** accepted

Incremental re-review of the 10 lines changed since 7aec75d, and of the pull request's title and description. No finding.

## Previous findings

- R01 — repaired: `README.md:5505` now reads “by PadicHodgeRegulators §1.9 (⟨log_BK κ(P), ω⟩ = log_ω(P) for an abelian variety over a finite extension of ℚ_p, with no reduction assumption), applied to the semistable Jacobian J₀(N)”; :5511 lists “PadicHodgeRegulators §1.9”.
- R02 — repaired: `README.md:5035`, :5085 and :5187 now cite `AutomorphicLFunctionsAndLocalFactors:AL.4.2.4`; `AL.3.3` no longer occurs in the README.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| 9.12 outline and `*Needs:*` (changed) | N = p = 37; a_p = ±1 at p = 5 | X₀(37) has genus 2, so J₀(37) is not elliptic; PadicHodgeRegulators §1.9 takes any abelian variety over finite K/ℚ_p, fourth bullet is ⟨log_BK κ(P), ω⟩ = log_ω(P); factors 16/25, 36/25, valuation −2 | sound; citation resolves |
| 9.12 “p-adic completion F of H” (added) | Castella's Theorem 3.2 proof | castella-multiplicative line 441 defines F so; line 451 is AJ_F(Δ)(ω_f) = log_(ω_f)(Δ); line 455 the push to E | agrees with the source |
| 8.11, 8.15 `*Needs:*`, Layer 8 Dependencies (changed) | weight-two form (w₀ = 1), finite-order χ (w₁ = 0) | AL.4.2.4: motivic s ↔ unitary s − (w₀+w₁)/2 = s − 1/2; motivic 1 ↔ unitary 1/2, which is §0.3 | sound; citation resolves |
| Supplier rows for the changed citations | `README.md:107`, :138 | :107 lists AL.4.2 (parent of AL.4.2.4); :138 lists PadicHodgeRegulators §1.9 with log_BK∘κ = log_A at arbitrary reduction | consistent |

The rows for untouched statements stand as in the previous review, of `7aec75d`.

- Source locators checked against the text: 1 (Castella, Theorem 3.2 and its proof, castella-multiplicative lines 433–455). No target of the seeded sample falls in a changed passage.
- Cross-roadmap citations resolved at the open heads: 3 (AutomorphicLFunctionsAndLocalFactors AL.4.2.4 and AL.3.6; PadicHodgeRegulators §1.9). PadicHodgeRegulators is line 339 of the merge order, this roadmap line 353.
- Gate at 9d72f01, run again: every counter 0, OK. Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean` (file unchanged; pins moved with the merge of main): one warning, `Suggested.lean:43:8: declaration uses sorry`; the signature in the worker's `#check` output equals README §0.2. The diff changes no Lean statement.
- No file changed outside the folder against the base.
- The pull request's title and description were read against this head: the summary block, the prose, the three files and the validation counts agree; PadicHodgeRegulators is already in its dependency list; the change adds or drops no supplier, section or declaration. Nothing to correct.
- Overlap check: read HeegnerPointEulerSystems, RankOneConverse (open), ModularForms, AnalyticNumberTheoryPartII (main); nothing shared: the first two take §§0a and the height identities from this roadmap by citation, the last two name none of its objects; no id dropped, no second copy.
- Source independence: changed passages only; 1 passage compared with 1 source (castella-multiplicative), nothing shared beyond the formula; largest share gz86, 156 of 486 linked locators; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- `yzz-book` and `yzz-draft` (waived), `argos` and `blr` (uncertified): not read; no changed passage cites them.
- The description's sentence on review and red-team rounds on the job board: not checkable from the files of this review.

## Source issues

- none

## For the human reviewers

- Not tested: `yzz-book` and `yzz-draft` are waived in the manifest, so the 31 locators into the Yuan–Zhang–Zhang book (`TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md`, e.g. :5033) were never compared with its text.
