# Review of BilinearComplexityAndBorderRank (pull request #3124 at 49ed086)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired, and the contract for `abstractRank_restrictLE` now reads as AsymptoticSpectra 3.1 states it, an equality of two infima that also holds with no party. The two library attributions are corrected, and the Wigderson–Zuiddam reference now names the dated copy its page numbers refer to. There are no findings, no small corrections and no format notes. For the humans: Bläser's survey, which carries 28 of the 31 source citations, is still unread, so its locators, wording and table of contents remain unchecked, and the page number in the newly named copy of the Wigderson–Zuiddam survey could not be confirmed.

## Previous findings

- R01 — repaired: "3.1 `abstractRank_restrictLE` (any finite set of parties: the least `r` with `t ≤ ⟨r⟩` is `R(t)`): 3.1." This is the supplier's equality `abstractRank restrictLE t = tensorRank t`; no equivalence is asserted.
- C01 — repaired by the alternative offered: the References now say "final version 2025 from A. Wigderson's page (the PDF in the Bulletin's format, created 23 August 2025); pages of that PDF", keeping p. 53. That copy was not read (see Not verifiable).
- N01 — repaired: `Fin.divNat`, `Fin.modNat` are attributed to Batteries (`Batteries/Data/Fin/Basic.lean`) in the *Needs* line of 1.1 and in the Mathlib contract; `Real.logb` carries `Mathlib/Analysis/SpecialFunctions/Log/Base.lean`.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Supplier contract, `abstractRank_restrictLE` (changed) | no party over `ℚ`: `t = 1/2`, `t = 1`, `t = 0`; no party over `𝔽₂`, `t = 1`; three parties, `t = ⟨1,1,1⟩` | `1/2`: no `r` with `r·1 = 1/2`, both infima `sInf ∅ = 0`. `t = 1`: least `r` is `1`, `R = 1`. `t = 0`: `0 = 0`. `⟨1,1,1⟩ ≈ ⟨1⟩`: `1 = 1`. | equality true in every case; agrees with the supplier's Lean statement |
| 3.1 disjoint copies (cites the changed contract) | `f = k = m = n = 1`; `kmn = 0`; `f = 0` (control) | `g = R(⟨1,1,1⟩) = 1`, set of `r` with `t ≤ ⟨r⟩` is `{r ≥ 1}`, infimum attained; `1^(ω/3) = 1 ≤ ⌈1/1⌉ = 1`. `kmn = 0`: `0 ≤ ⌈g/f⌉`. `f = 0`: `1 ≤ ⌈0/0⌉ = 0` fails, excluded by `1 ≤ f`. | true; the route uses the contract only for three parties, with nonemptiness proved from the Archimedean law |

The rows for the statements the change does not touch stand as in the previous review, of `046e674`.

- Source locators checked against the text: none new (the change adds no locator; it adds a version description to one reference).
- Library declarations opened at the pin: 3 (`Fin.divNat`, `Batteries/Data/Fin/Basic.lean:133`; `Fin.modNat`, same file, line 137; `Real.logb`, `Mathlib/Analysis/SpecialFunctions/Log/Base.lean:47`); a search of the pinned Mathlib finds no `Fin.divNat` or `Fin.modNat` declared there.
- Cross-roadmap citations resolved: AsymptoticSpectra 3.1 `abstractRank_restrictLE` at its open head (README line 587: "the rank of `t` for restriction is `tensorRank t`, for any finite set of parties"; `Suggested.lean` line 392: `abstractRank restrictLE t = tensorRank t`).
- Automatic checks: rerun on this head, all passed. Dependency check output: `depcheck: 122 roadmaps, 1385 edges, 0 problem(s)`.
- Elaboration: `Suggested.lean` (unchanged since `046e674`) elaborates; 10 `sorry` warnings and nothing else.
- Pull request text read against the head: the title and description still describe the folder (new roadmap, 10 theorems, the declared dependency on AsymptoticSpectra, the copied declarations, the Wigderson page copy); the change alters nothing they state. No file changed outside the folder.
- Overlap check: read GroupTheoreticMatrixMultiplication, AsymptoticSpectra, InformationTheoreticCryptography, AlgebraicCircuitsAndValiantsClasses; nothing shared (GroupTheoreticMatrixMultiplication, open, lists rectangular matrix multiplication tensors, the asymptotic sum inequality and border rank as not treated and declares none of this roadmap's own names; it copies the same AsymptoticSpectra definitions in its own namespace; AsymptoticSpectra owns tensors, rank, flattening ranks, `mmTensor` and `ω`).

Source independence: changed passages only; 3 passages compared with 2 sources (WigdersonZuiddam2025, ShpilkaYehudayoff2010), none shared (the changed lines are library attributions, one supplier contract and one bibliographic description); largest share Bläser 2013, 28 of 31 source citations; its text and table of contents could not be read, so the contents comparison was not made; the change adds, removes or reorders no layer.

Research link: The targets are the border-rank bound of Bini, Capovani, Lotti and Romani (1979) and Schönhage's τ-theorem (1981), the inputs to the laser method and later bounds on `ω`; Wigderson and Zuiddam (2025, §4.2 and §9.1) rederive and extend the τ-theorem by asymptotic spectra. Rests on the README and WigdersonZuiddam2025 lines 2216–2239, 3843–3855.

## Not verifiable

- That Theorem 4.12 and footnote 51 of the Wigderson–Zuiddam survey are on p. 53 of the copy the README now names (Bulletin format, created 23 August 2025, on A. Wigderson's page): that copy is not in the sources cache; in the copy of 5 August 2025 on J. Zuiddam's page they are on p. 51 (WigdersonZuiddam2025 lines 2225–2239).
- Every locator into Bläser, *Fast matrix multiplication* (2013), and the README's statements about that text: no copy was obtainable through the legal-source service, as in the previous review.
- Strassen 1973, Bini–Capovani–Lotti–Romani 1979, Schönhage 1981: not read; the README attributes them without locators.
- Ownership against open pull requests was checked by object search over the open heads and main; no package on the board beyond those was read.

## Source issues

- **Misprint** in WigdersonZuiddam2025 at footnote 51, p. 51: the source says the hypothesis is a bound on the sum over `i` of the border ranks of the rectangular tensors; it should be a bound on the border rank of their direct sum, as in its Theorem 4.12 and Theorem 9.4; affects nothing.

## For the human reviewers

- Not tested: Bläser 2013 carries 28 of 31 source citations; its text and contents page were not read. By the README's own locators, Layer 2 draws on its pp. 25–28 and Layer 3 on pp. 29–34; wording and arrangement against it are unchecked.
- Licence: the host of Bläser's survey (the journal Theory of Computing, which the README calls open) is in no licence class known to the sources service; a human can classify it.
- Licence: `TauCetiRoadmap/BilinearComplexityAndBorderRank/README.md` lines 609–611 name a 2026 preprint and its public Lean repository (`openai/math`, Apache-2.0) and say no declaration is taken from it; the repository was not opened.
- Scope: `Suggested.lean` copies 13 declarations verbatim from AsymptoticSpectra (still an open pull request) and AlgebraicCircuitsAndValiantsClasses (on main), labelled as copies, to make its headlines statable.
- Not tested: the page number p. 53 refers to a copy of the Wigderson–Zuiddam survey (A. Wigderson's page, created 23 August 2025) that was not read; the copy read places the same theorem on p. 51.
