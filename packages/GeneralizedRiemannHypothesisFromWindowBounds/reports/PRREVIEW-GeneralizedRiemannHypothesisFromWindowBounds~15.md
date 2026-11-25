# Review of GeneralizedRiemannHypothesisFromWindowBounds (pull request #3027 at 2ac59b9)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/GeneralizedRiemannHypothesisFromWindowBounds/`
**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of 38 changed lines since `094da69`, all in section 0.4 and the supplier contracts that serve it. The change makes the bound `C y²` the statement, moves the bound `C′ y` to a remark, and proves the integrability of `|G_w(y)| y^{−σ−1}` for `σ > 1` by a new route that no longer uses `C′ y`; the new route is correct and its inputs exist where cited. There are no findings, no small corrections and no format notes. The scope and licence questions of the earlier reviews remain for the human reviewers.

## Previous findings

- The previous report, of `094da69`, has no finding of its own.
- R01 (carried there from an earlier round) — repaired: settled by a decision of the human reviewers. This head still lacks Layer 6 and §§5.4–5.6 and nothing else; the change since `094da69` touches only 0.4 and its contracts.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.4 integrability of `|G_w| y^{−σ−1}` on `[1, ∞)`, `σ > 1` (new route) | `σ = 2`, `σ = 3/2`; whether `C y²` alone would do | `∫_1^∞ (1 + log y) y^{−σ} dy = 1/(σ−1) + 1/(σ−1)²`: `2` and `6`; `y²·y^{−σ−1} = y^{1−σ}` is not integrable for `σ ≤ 2`, so the Riesz-sum route is needed | true; route sound | none |
| 0.4 route step: Riesz sum of `‖a_ψ‖` bounds that of `a_ψ` | `K = ℚ`, `ψ = χ₋₄`, `y = 4` | `rieszSum a_ψ 4 = −(log 3)/3 = −0.3662`; with norms `log 2 + (log 3)/3 = 1.0593`; `0.3662 ≤ 1.0593` (`y/n − 1 ≥ 0` for `n ≤ y`) | true | none |
| 0.4 route step: `‖a_ψ(m)‖ ≤ [K:ℚ] Λ(m)` | `m = p^k`; `K = ℚ(i)`, `m = 5`, `m = 9`, `m = 3` | primes over `p` with `f ∣ k` contribute `f log p`, `Σ f ≤ [K:ℚ]`; `m = 5`: `2 log 5 ≤ 2 log 5`; `m = 9`: `2 log 3 ≤ 2 log 3`; `m = 3`: `0` | true | none |
| 0.4 size `|G_w(y)| ≤ C_w y²`, `y ≥ 1` (now the statement) | `K = ℚ`, `w = single 1 1`, `y = 1, 2` | `G(1) = 1 + γ = 1.5772`, `G(2) = 2(1 + γ − log 2) = 1.7681`; termwise bound `y·y + (|log y| + 1 + γ) y ≤ C y²` | true | none |
| 0.4 remark `|G_w(y)| ≤ C′_w y` and its attribution | the formal proof's statement at the two cited locators | `Formalism.GzLipschitz` bounds `|Gz t| ≤ K t` for `t ≥ 1/2`, trivial character only; `zetaPrimeSumErrorLipschitz` proves it; supplier's remark to the size clause states `C′_ψ y` | as the remark says | none |
| "nothing later uses it" (remark) | every later use of 0.4 | 0.5: absolute convergence on `Re s > 1` (integrability); 2.1: `C_w y²`; 2.4: "measurable and integrable"; no later occurrence of `C′` outside the contracts | true | none |

The rows for the untouched statements stand as in the previous review, of `094da69`.

- Supplier clauses opened at this head: RiemannHypothesisStatementsAndConsequences §8.4a(a) has the Mellin-transform clause as the contract quotes it (integrable on `(1, ∞)` for `Re s > 1` under `LSeriesSummable a σ` for every `σ > 1`); §8.4a(b) has the size clause `C_ψ y²` and, as a remark, `C′_ψ y`; ZerosOfLFunctions §8.6a and PositivityOfDirichletSeriesWithKernels §6.9(b) with its extension exist.
- Library declarations opened at the pin: `ArithmeticFunction.LSeriesSummable_vonMangoldt` (`Mathlib/NumberTheory/LSeries/Dirichlet.lean` line 384, `1 < s.re`), `integrableOn_Ioi_rpow_of_lt` (`Mathlib/Analysis/SpecialFunctions/ImproperIntegrals.lean` line 130, `a < −1`, `0 < c`).
- Source locators checked: the two new ones into FormalProof (`Formalism/StatementU.lean`, `Formalism/ZetaNonvanishing/GzLipschitz.lean`), both present at the repository's first commit, with the declarations named.
- Seeded sample: none of its targets (0.1, 0.6, 1.3, 2.1–2.5, 3.1, 3.3, 3.4, 4.1, 4.2, 5.1, 5.3) lies in a changed passage; 2.1 and 2.4 cite 0.4 and their citations agree with its new form.
- Cross-roadmap citations: none found nowhere; no open pull request drops a cited id or changes this folder; no other roadmap cites §0.4.
- Automatic checks: all passed for the folder. Dependency check: `depcheck: 122 roadmaps, 1392 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 7 `sorry` warnings only (lines 83, 143, 161, 171, 178, 188, 197); the file is unchanged since `094da69`.
- Pull request's text against this head: the description states the change (the bound `C·y²` of 0.4 is the statement, the stronger form a remark); its part 3 and the family index entry still describe the folder. Every path the pull request changes lies in a folder it owns.
- Overlap check: read RiemannHypothesisStatementsAndConsequences, PositivityOfDirichletSeriesWithKernels, RieszSumsOverPrimesAndExceptionalZeros and ZerosOfLFunctions; each shared object has one owner, cited here: the one-character remainder with its size bounds and Mellin clause (RiemannHypothesisStatementsAndConsequences §8.4a), the windowed Landau theorem (PositivityOfDirichletSeriesWithKernels Layer 6), the explicit formula (ZerosOfLFunctions §8.6a).

Source independence: changed passages only; 2 passages (the remark of 0.4 and its route) compared with 1 source, FormalProof at its two new locators, none shared; largest share FormalProof, about 33 of 57 locators; no layer is added, removed or reordered since `094da69`, so the arrangement was not compared again.

Research link: The headlines are the Riemann hypothesis and GRH for Dirichlet L-functions, announced as proved and formalised in Lean by Alpöge (2026) (README Summary; Announcement lines 9–13). Layers 1–3 put the Landau (1905) and Ingham (1932) equivalences in windowed form; the README names Pintz (1980) and Kaczorowski (1984) as nearest published results.

## Not verifiable

- FormalProof: its locators other than the two added in 0.4, and the `*Method of the formal proof:*` labels, were not read in this round (no other passage changed).
- Landau (1905), Pintz (1980), Kaczorowski (1984), Ihara–Murty–Shimura (2009), Ihara (2006): not read in the earlier rounds and not fetched in this one; the change adds no locator into them.
- Ingham (1932), Davenport (2000), Montgomery–Vaughan (2007): books with no legal open copy. Knapowski–Turán (1962): publisher paywall.

## Source issues

- none

## For the human reviewers

- Decision applied: the move of Layer 6 (§§6.1–6.32) and §§5.4–5.6 to ConsequencesOfTheRiemannHypothesisForDirichletLFunctions Layers 0–4 was not raised; the head removes those sections, their supplier contracts and four declarations, and nothing else.
- Scope: the headline is the Riemann hypothesis. It rests on ThetaChainsAndFrobeniusPrimeSums §10.11 and on an unrefereed announcement (Announcement lines 9–13). No refereed source states it.
- Licence: the README cites about 33 file and declaration locators of an external Lean formalisation (FormalProof), and `Suggested.lean` says three declarations match it binder for binder. Its licence was not read.
- Not tested: of FormalProof, the source with the largest share of locators, only the two locators added in 0.4 were read in this round; wording and arrangement of the untouched text were not compared with it.
