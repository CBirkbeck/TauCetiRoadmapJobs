# Review of GeneralizedRiemannHypothesisFromWindowBounds (pull request #3027 at 3b77a6a)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/GeneralizedRiemannHypothesisFromWindowBounds/`
**Verdict:** needs changes

**Summary.** A review of the change against `main`: 2292 changed lines since `74a09b7`. I read every added or changed passage of Layers 0–5 (the origin, method and corollary labels, the restated 2.3, the reworded routes, the scope, contracts and references), compared the README at the merge base with the head item by item, resolved the supplier citations at this head and recomputed the numerical Checks; the mathematics that stays is sound and I found nothing new to correct. One finding blocks, and it is the one the previous review raised: the folder's text has not changed since, and the revision still removes Layer 6 (§§6.1–6.32) and §§5.4–5.6 of the README on `main`, with four Lean statements, instead of keeping them under their ids. There are no small corrections and no format notes. The human reviewers decide whether the family owner's decision reported in the description waives that rule; if it does, nothing else stands in the way.

## R01 (P1) — The revision removes Layer 6 and §§5.4–5.6 of the README on `main` instead of keeping them under their ids

A roadmap on `main` is also the record of what it planned: its layer and section ids are what the structure page and any generated status file are keyed by. After this merge "Layer 6" and items 5.4–5.6 of this roadmap no longer exist, and their 35 sections are stated in ConsequencesOfTheRiemannHypothesisForDirichletLFunctions under other numbers.

At the merge base the README has "### 5.4 Completed L-functions" (line 891), 5.5 (line 908), 5.6 (line 935) and "## Layer 6: consequences for the conditional theorems of other roadmaps" with §§6.1–6.32 (from line 1024). At this head Layer 5 ends with "### 5.3 Values and the critical strip" (line 1085) and is followed by `## Downstream consumers` (line 1134). `Suggested.lean` loses `re_eq_half_of_meromorphicOrderAt_completedLFunction_pos`, `meromorphicOrderAt_dedekindZeta_nonpos_of_isAbelianGalois`, `meromorphicOrderAt_heckeLFunctionC_nonpos_of_isAbelianGalois` and `psiAP_isBigO`; all four stand, character for character, in the new roadmap's file. Everything else of the merge-base README survives: Layers 0–5.3 keep every section, Check and example, and the seven remaining Lean statements are unchanged. No roadmap on `main` or at an open head cites the removed ids, so no citation breaks; the loss is to this roadmap's record only. The description gives the full old → new table and says the family's owner decided the move, but a numbering table does not keep the ids, and this review cannot waive the rule.

The smallest repair is unchanged: restore §§5.4–5.6 and Layer 6 here under their ids with their statements (and the conventions, supplier contracts and four declarations they use), and let the new roadmap cite them by these ids. If the human reviewers accept the owner's decision, this finding lapses and the folder is otherwise ready.

## Previous findings

- R01 — not repaired: the folder is byte-for-byte the text the previous review read; Layer 5 still ends with "### 5.3 Values and the critical strip" (line 1085), followed by `## Downstream consumers` (line 1134).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 weighted families (sample) | `single ψ 2`; `single ψ 1 + single ψ (−1)`; `0 • w` | inverse family `single ψ⁻¹ 2`; weight inversion gives `single ψ (1/2)`; sum `0`, empty support | Checks true | none |
| 0.2 cyclic families (sample) | `χ₋₄`; `ψ = χ₋₄φ` mod 20 | squares mod 5: `1,4,4,1`, so `φ² = (·/5)`, `(2/5) = −1`, factor `1 + 2^{−s}`; conductors `1,20,5,20` | Check true | none |
| 0.3 remainder (sample) | `K = ℚ`, `w = single 1 1`, `y = 1, 2` | `G(1) = 1.5772157`; `G(2) = 1.7681370`; with `+y log y`: `4.5407257` | Checks true | none |
| 0.4 Origin (changed): bound `C′y` from the explicit formula | `K = ℚ`, `x = 2` | formula gives `G(x) = −log x + 1 + γ + Σ_ρ + ((x−1)/2)F₁`; non-zero part at 2: `1.8389`; each term `O(x)` | supported | none |
| 0.5 transform (sample), 0.6 Method quotient (changed) | trivial character, `s = 3` | Mellin integral of `G` to `3000`: `0.56607827945`; quotient with `k = 1`: `0.56607827948`; `k = 0` gives `0.2327` | true, `k = 1` | none |
| 0.6 nontrivial quotient | `ψ ≠ 1` | `−L′/L(s)/(s(s−1)) + L′/L(1)/(s−1) = −(L′/L(s) − sL′/L(1))/(s(s−1))`, `k = 0`, analytic at 1 | true | none |
| 0.6 residue Check | first zero, `t = 14.134725` | `1/(1/4 + t²) = 0.00499899` | true | none |
| 1.1 (sample; route reworded) | real zero `β = 0.9` | contribution `y^β/(β(1−β)) = 11.11·y^{0.9} > 0`; contract equals ArithmeticDirichletSeriesPartII §0.1b (line 259) | true | none |
| 1.2 Check | `w = 0`, `θ = 0`, `C = 1` | `0 ≥ −1`; `ζ(1/4) = −0.8133`, `ζ(1/2) = −1.4604`, `ζ(0.9) = −9.4301` | true | none |
| 1.3 (sample) | transform of `ψ_K(y) − y` | `−ζ_K′/ζ_K(s)/s − 1/(s−1)`; residue `−m/ρ`; for `−g`: `m/β > 0` | (a), (b) signs right | none |
| 2.1, 2.2 (sample) | hypotheses against PositivityOfDirichletSeriesWithKernels §§6.8, 6.9(b) (lines 456, 585) | `|G_w| ≤ C y²`, transform on `Re s > 1 ⊇ Re s > 2`, simple poles, positive real residues, `0 < θ < 1` | contract met | none |
| 2.3 restated (changed) | negation of conclusion | gives `Y ≥ max(Y₀,1)` with `[Y, Y^λ] ⊆ {G_w ≤ C y^θ}`, i.e. `HasWindows`; 2.1 then excludes the zero | contrapositive valid over `ℚ` and `K` | none |
| 2.4, 2.5 (sample) | `θ = 0`; `G = −(ψ_K − y)` | extension allows any `θ < A = 1`; `|G| ≤ (C_K+1)y ≤ (C_K+1)y²`; residues `m/ρ > 0` at real poles | true | none |
| 3.3 (sample) | `Re s = 0.51, 0.6, 0.9, 2` in the Method | `θ = 0.505, 0.55, 0.70, 0.75`, each `< Re s`, `< 1`; `w = 0`: both sides hold | true | none |
| 3.4 `*Corollary of:*` | principal character mod 2 | zeros of `1 − 2^{−s}` at `9.0647k·i`, `Re = 0`; AnalyticNumberTheoryPartI §1.6 "Primitive induction" (line 982) | follows | none |
| 3.5 (sample, headline) | functional equation with `s ↦ 1 − s`; `Finset.Iic ⌊y⌋₊` | cosine zero iff `s` even integer; `ζ(0) = −1/2`; term `n = 0` is `Λ(0)·(…) = 0` | Method and Lean consistent | none |
| 4.2 (sample, headline) | `ψ = 1`; `χ₋₄`; cubic mod 7 | family `{1}`; weights `1, 1/7`; `1, 1/10, 1/10`, matching ThetaChainsAndFrobeniusPrimeSums §10.11 (line 1817) | true | none |
| 5.1, 5.2 (sample, headlines) | route via 4.2, 3.4 | §10.11 states (i) for every `ψ`, `ε > 0`; Announcement lines 9–13, 53 | locators true; the theorem itself not verifiable here | none |
| 5.3 (sample, headline) | `s = 1`, `N = 1`; principal mod 2; `s = −2` | `riemannZeta 1 = (γ − log 4π)/2 = −0.9769 ≠ 0`; zeros on `Re s = 0` excluded by `0 < Re s` | true | none |
| R01 removed items | merge-base lines 891–2365 against head line 1085 | 35 sections and 4 declarations absent here; present in the new roadmap (§§0.1–0.3 at its lines 242, 265, 300) | record broken | R01 |

- Source locators checked against the text: 1 (Announcement, p. 1 and footnote 1: lines 9–13 and 53).
- Library declarations opened at the pin: `riemannZeta_one` (Mathlib/NumberTheory/Harmonic/ZetaAsymp.lean:420), `riemannZeta_one_sub` (Mathlib/NumberTheory/LSeries/RiemannZeta.lean:178), `RiemannHypothesis` (same file:185), `DirichletCharacter.LFunction_modOne_eq` (Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:66), `DirichletCharacter.LFunction_ne_zero_of_one_le_re` (Mathlib/NumberTheory/LSeries/Nonvanishing.lean:404), `Real.continuous_mul_log` (Mathlib/Analysis/SpecialFunctions/Log/NegMulLog.lean:45), `TauCeti.primeIdealTheorem`, `TauCeti.dedekindZeta_ne_zero_of_one_lt_re`, `TauCeti.hasSum_idealTerm_vonMangoldt`, `PrimitiveRayClassCharacter.character_inv` (TauCeti/NumberTheory/LFunctions/Hecke/Primitive.lean:208).
- Cross-roadmap citations resolved at this head: 30 section ids in 10 roadmaps and four layers of LFunctions (RiemannHypothesisStatementsAndConsequences §§8.4a, 9.2–9.6, 9.9, 10.2, 10.3, 11.1; ZerosOfLFunctions §§6.5, 7.5, 7.6, 8.6a, 9.1; ArithmeticDirichletSeriesPartII §§0.1, 0.1b, 4.1; PositivityOfDirichletSeriesWithKernels §§6.4, 6.8, 6.9; FrobeniusRestrictedRieszSums §0.5; ThetaChainsAndFrobeniusPrimeSums §10.11; AnalyticNumberTheoryPartI §§1.6, 2.42; ExplicitZetaBounds §0.3; QuasiRiemannHypothesis §§1.1, 5.4, 5.4a; ExplicitNumberFields §0.5; LFunctions Layers 3, 5, 7, 8).
- Merge base against head: Layers 0–5.3 keep all 24 sections with their Checks and examples; the seven kept theorems of `Suggested.lean` are identical to their merge-base text; the four moved ones are identical in the new roadmap's file.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1470 edges, 0 problem(s)`, no UPWARD or CYCLE line. Nothing changes outside the pull request's own folders and the two family indexes.
- Elaboration: `lake env lean` on `Suggested.lean` gives 7 `sorry` warnings only (lines 83, 143, 161, 171, 178, 188, 197). The elaborated signatures were compared with the README statements (3.5, 4.2, 5.1–5.3): same generality, no lost binder.
- Headline theorems: 5.1, 5.2, 5.3 (value and strip forms), 3.5 and 4.2 are stated; 2.1 and 3.3 are named in the docstring as not statable (the ray-class Riesz remainder and the Euler–Kronecker constant are absent at the pins). Padding, decided by reading: every sorried statement is of the strength of the Riemann hypothesis or an equivalence with it, and none follows in one tactic from the library.
- Overlap check: read RiemannHypothesisStatementsAndConsequences, PositivityOfDirichletSeriesWithKernels, RieszSumsOverPrimesAndExceptionalZeros, ZerosOfLFunctions and AnalyticNumberTheoryPartI; each shared object has one owner, cited here: the one-character remainder and the predicates (RiemannHypothesisStatementsAndConsequences §§8.4a, 9.2–9.5), Landau's theorem (ArithmeticDirichletSeriesPartII §0.1b; its one-sided and windowed forms, PositivityOfDirichletSeriesWithKernels Layer 6), the explicit formula (ZerosOfLFunctions §8.6a), primitive induction (AnalyticNumberTheoryPartI §1.6). The three definitions `Suggested.lean` writes out are in this roadmap's own namespace. No open pull request drops a cited id or changes this folder.

Source independence: changed passages only; 4 passages compared with 1 source read (Announcement), none shared; the labels describing FormalProof, Ingham, Landau and Ihara–Murty–Shimura could not be set beside their texts. Largest share FormalProof, 31 of about 55 locators; contents compared with FormalProof: not readable. The one layer removed leaves an order forced by the `*Needs:*` chain 0.6 → 2.1 → 3.3 → 4.2 → 5.1.

Research link: The headlines are the Riemann hypothesis and GRH for Dirichlet L-functions, announced as proved and formalised in Lean by Alpöge (2026) (README Summary; Announcement lines 9–13). Layers 1–3 put the Landau (1905) and Ingham (1932) equivalences in windowed form; the README names Pintz (1980) and Kaczorowski (1984) as nearest published results.

## Not verifiable

- FormalProof: its 31 file and declaration locators and every `*Method of the formal proof:*` label; the archive parts and the repository are not readable through the sources service.
- Landau (1905): the sources service reported network trouble. Pintz (1980), Kaczorowski (1984), Ihara–Murty–Shimura (2009), Ihara (2006): not fetched in this round for the same reason.
- Ingham (1932), Davenport (2000), Montgomery–Vaughan (2007): books with no legal open copy. Knapowski–Turán (1962): publisher paywall.
- The family owner's decision reported in part 3 of the description: a statement of the pull request's text, not checkable from the repository.

## Source issues

- none

## For the human reviewers

- Record rule (R01): the description says the family's owner decided to move Layer 6 and §§5.4–5.6 to ConsequencesOfTheRiemannHypothesisForDirichletLFunctions under new numbers and gives the old → new table; no other roadmap cites the old ids. If you allow it, R01 lapses and no finding remains.
- Scope: the headline is the Riemann hypothesis. It rests on ThetaChainsAndFrobeniusPrimeSums §10.11 and on an unrefereed announcement (Announcement lines 9–13). No refereed source states it, and this review did not read the formal proof.
- Licence: the README cites about 31 file and declaration locators of an external Lean formalisation (FormalProof: archives on the author's site, a GitHub repository), and `Suggested.lean` says three declarations match it binder for binder. Its licence was not read.
- Not tested: FormalProof, the source with the largest share of locators, could not be read, so wording and arrangement were not checked against it.
