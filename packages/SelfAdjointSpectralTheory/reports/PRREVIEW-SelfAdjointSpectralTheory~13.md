# Review of SelfAdjointSpectralTheory (pull request #1854 at 9288dee)
Folder: `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/`
**Verdict:** accepted

**Summary.** An incremental re-review of 0 changed lines since `9288dee`, reading the pull request's title and description against this head; accepted. The description's account of this roadmap agrees with the head in its suppliers, its 274 items, its dropped sections and references and its `Suggested.lean` declarations, with two exceptions: the number of items carrying an *In Mathlib:* line is 11, not 10, and Part C does not end with the compact normal spectral theorem. Two small corrections and one format note (carried from the previous review), none blocking; the licence question for the human reviewers stands as before.

## C01 — The description counts 10 items naming Mathlib declarations; the head has 11

The description says "154 items name their realising Tau Ceti declarations on *In Tau Ceti:* lines … and 10 name Mathlib's". A reader who counts to check the record finds 154 for Tau Ceti, as stated, but 11 items with an *In Mathlib:* line: SA-A19, SA-C01–SA-C04, SA-C08–SA-C10, SA-C39, SA-C41 and SA-C43 (README lines 199, 905–929, 1014, 1027, 1037; the twelfth occurrence, line 70, is the sentence in How to read the build that explains the line). Writing "and 11 name Mathlib's" makes the sentence true.

## C02 — The description says Part C ends with the compact normal spectral theorem; it ends with the finite Euclidean operator norms

The description lists "closed operators on `LinearPMap`, ending with the spectral theorem for compact normal operators (Part C)". At the head the compact normal theorem is C.8 (SA-C86, Milestone C4), and Part C ends with C.9, Finite Euclidean operator norms (SA-C87, Milestone C5, README line 1250). "with the spectral theorem for compact normal operators and the finite Euclidean operator norms (Part C)" would describe the Part as it is.

## N01 — "the integral has norm one" in SA-E37 reads as a statement about `C_{B,c}`

In SA-E37 (line 1709) the sentence "The bound holds because the integral has norm one" means that the map from bounded Borel symbols to operators has norm one (Teschl2009, Theorem 3.1, line 3687); read literally it speaks of the operator `C_{B,c}`, and on `H = 0` the map has norm `0`. "because the integral is norm-decreasing on bounded symbols, `‖∫ f dP‖ ≤ sup |f|`" would say what is used, as SA-E40 already does. Carried from the previous review; the folder is unchanged.

## Previous findings

- The previous review, of `9288dee`, had no finding (R) and no small correction.
- N01 — not repaired: SA-E37 still reads "The bound holds because the integral has norm one (Teschl2009, Theorem 3.1, p. 90, line 3687)"; written again above as N01.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| SA-E27 with SA-E16 (the description's "Yosida convergence a theorem") | `H = ℂ`, `A = a`; `a = 1`, `n = 1`; `n = 0` | `R(±in) = (±in − a)⁻¹`, sum `= −2a/(n² + a²)`, so `S_n = n²a/(n² + a²)`; `a=1,n=1`: `1/2`; `n=0`: `0`; `S_n → a`, `exp(itS_n) → exp(ita) = U(t)` | true; matches the Lean `yosidaApproximant` body | none |
| SA-E43 (description: spectral representation headline) | `A = 1` on `ℂ`, `t = π/2`; `t = 0` | left `exp(iπ/2)|ξ|² = i|ξ|²`, right `∫ exp(iπs/2) d(|ξ|²δ₁) = i|ξ|²`; `t = 0`: both `|ξ|²` | true | none |
| SA-E37 (N01) | `A = diag(0,1)`, `B = {1}`, `c = 0`, `r = 1`; `H = 0` | `C = e₂₂`, norm `1 ≤ 1`; `H = 0`: symbol map has norm `0`, not `1` | bound true; wording | N01 |
| Description: item counts | README at head, split by item label | 274 labels (274 at the merge base, none missing); *In Tau Ceti:* 154 items; *In Mathlib:* 11 items; *Supplied by:* 29 items (25 V2, 2 V4.0, 2 V10) | 154, 29, 274 as stated; 10 is 11 | C01 |
| Description: suppliers | README at merge base against head | `V4.0.Fields` 6 → 0 mentions, `OrthogonalGeometry` 2 → 0, `A8` 4 → 0; head has V2.BorelCalculus, V4.0.Multiplication, V10.ClosedOperators, BanachSpaceTheory §5.4, BanachAlgebras §8.1 | as stated | none |
| Description: `Suggested.lean` | file at head | 6 theorems, 2 definitions, the `spectrum` export; 70 declarations of main absent; docstring names B.5, C.8, E.1, E.3–E.6 and the eight item ids | as stated | none |

The rows for the untouched statements stand as in the previous review, of `9288dee`.

- Folder diff since the previous review: empty; no file changed outside the pull request's own folders (seven files changed against main, all in BanachSpaceTheory, MorseNovikov, the OperatorTheory index and this folder).
- Seeded sample: no sampled milestone lies in a changed passage (there is none); no source locator was reopened this round.
- Pull request text checked against the head: the summary block's sentence on this roadmap (Stone generator SA-A02 on `stoneGenerator`, generated group SA-E26 by Stone uniqueness, SA-E27 a theorem), the loop paragraph (SA-B58 and SA-B81–SA-B84 each with an *In Tau Ceti:* line; §5.4 for SA-B63 and SA-B65; Goldstine from Tau Ceti), the roadmap's own paragraph, and the OperatorTheory index paragraph (prerequisites row line 82, dependency-minimal paragraph lines 96–106, ownership note lines 125–129, Completed link line 135).
- References at head: Teschl2009, Conway1990, Schmudgen2012; Reed–Simon, Rudin, Weidmann and Engel–Nagel occur at the merge base and not at the head, Kato only in "Kato–Rellich".
- Automatic checks: all passed on this head. Dependency check: `depcheck: 129 roadmaps, 1438 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line.
- Elaboration: `Suggested.lean` exits 0 with 6 warnings, all `sorry`; the file is unchanged, so the signature comparison and the one-tactic probe stand as in the previous reviews.

Overlap check: read SchrodingerOperatorsAndSpectralTypes (open), OneParameterSemigroups (open and completed), VonNeumannAlgebras, UnboundedOperators, SpectralSubspacePerturbation and the OperatorTheory index, as in the previous review; nothing changed. Shared objects as before: bounded Borel calculus and representation measure, owner VonNeumannAlgebras; weighted regular measures (SA-B64) and the resolvent predicate of the spectral measure, owner this roadmap; support equal to spectrum, owner UnboundedOperators §1.6; Sylvester solvability, owner SpectralSubspacePerturbation. QuantumHarmonicOscillator and the open revision of VonNeumannAlgebras were not read again.

Source independence: changed passages only; the folder has none, so 0 passages compared with 0 sources this round; largest share Teschl2009; arrangement not compared, no layer added, removed or reordered. Conway1990 and Schmudgen2012 could not be read.

Research link: the spectral theorem and Stone's theorem in the form of Teschl 2009 (Theorems 3.7, 5.1, 5.2) and Schmüdgen 2012 (Theorem 5.7); prerequisites of the Davis–Kahan and Rosenblum theorems of SpectralSubspacePerturbation and of UnboundedOperators. Rests on the README's scope section and Teschl2009.

## Not verifiable

- Conway1990, Theorem IX.1.14: recorded as uncertified, no legal open copy.
- Schmudgen2012, Theorem 5.7: recorded as uncertified, no legal open copy.
- The part of the description after the cut in the quoted text (the end of "Statements whose content differs from main") was not available and is outside this check.

## Source issues

- none

## For the human reviewers

- Licence: `Suggested.lean` carries the header "Copyright (c) 2026 Kitware, Inc." and the README's References name the AIQ DKPS formalization (Kitware, Apache-2.0) and the Spectra project (Adam Bornemann, Apache-2.0) as prior formalisations; both were on main already.
