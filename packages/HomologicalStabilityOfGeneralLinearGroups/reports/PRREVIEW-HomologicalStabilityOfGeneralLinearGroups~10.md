# Review of HomologicalStabilityOfGeneralLinearGroups (pull request #2036 at c64538d)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: README line 691 now reads "K3BlochGroups consumes 1.3 and 2.3: its §4.8 uses their specialization to infinite fields …"; "pull request" no longer occurs in the README, and the sentence agrees with lines 76–79 and 519–520.

## Verified sound

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Changed sentence, Downstream consumers (line 691): K3BlochGroups §4.8 uses 1.3 and 2.3, §4.22 uses 2.3 | K3BlochGroups at cf5467c, still open | Its line 117: §1.3 supplies the frame spectral sequence, §2.3 bijectivity for `m ≤ n` along `TauCeti.stabilizeGL`; §4.8 (lines 1372, 1388) for infinite `F`; §4.22 (lines 1792, 1807) for local rings | holds | — |
| 2.3 `homology_stabilization_of_infinite_residueFields`, cited by the changed line | `F` infinite field, `n = m = 1` | `H₁(GL₁F) = Fˣ → H₁(GL₂F) = Fˣ` (determinant of `diag(g, 1)` is `g`; `SL₂(F)` perfect for `|F| > 3`): bijective | holds | — |
| Same | `R = F × F′`, `m = n = 1`; zero ring | `Fˣ × F′ˣ → Fˣ × F′ˣ`, bijective. Zero ring: `MaximalSpectrum` empty, every `GL_n` trivial, `ℤ → ℤ` at `m = 0`, `0 → 0` above | holds | — |
| Same, negative control | `𝔽₂` (excluded by `Infinite`), `n = m = 1` | `H₁(GL₁𝔽₂) = 0 → H₁(GL₂𝔽₂) = H₁(S₃) = ℤ/2`: not onto, so the infinite-residue hypothesis is needed | hypothesis needed, present | — |
| Same, locator | GKRW2025 lines 3331–3336 (Theorem 9.4, arXiv v3 p. 58), 3347–3352 | Connected semilocal, all residue fields infinite: relative `H_d = 0` for `d < n`; `φ` factors through `D_n = H_n(GL_n)` onto `M_n`, giving the surjectivity used for `m = n` | locator exact, hypotheses match | — |
| 1.3 `homology_affineInclusion_bijective`, cited by the changed line | `F` infinite, `n = m = 1`; `n = 0` | `affineGroup F 1 1 = {(a 0; u 1)} ≅ F ⋊ Fˣ`, `H₁ = Fˣ` as `(a − 1)F = F`; `Fˣ → Fˣ` bijective. `n = 0`: both groups trivial | holds | — |
| Same, negative control | `𝔽₃`, `n = m = 1`, `k = 3` | `affineGroup ≅ 𝔽₃ ⋊ 𝔽₃ˣ ≅ S₃`: `H₃(GL₁𝔽₃) = ℤ/2` against `H₃(S₃) = ℤ/6`; not bijective, so finite residue fields are rightly excluded | hypothesis needed, present | — |
| Same, locators | GKRW2025 lines 1212, 1302, 1307 | Definition 5.12 (the Nesterenko–Suslin property), Proposition 5.15 (many units), Example 5.16 (infinite fields) at the cited numbers | locators exact | — |

The rows for statements this round leaves untouched stand as in the previous review, of `2bf5d27`.

- **Gate.** The worker's gate at c64538d: every counter 0, `build=0`, `OK`. Rerun here against the default order: only `depcheck: NOT IN ORDER`, expected (the candidate order lists the roadmap at line 39).
- **Dependency check** (the brief's command): `depcheck: 245 roadmaps, 2236 edges, 0 problem(s)`; no UPWARD and no CYCLE line.
- **Elaboration.** `lake env lean` on `Suggested.lean`: six `declaration uses sorry` warnings (lines 76, 98, 113, 130, 151, 166), nothing else. The diff changes no Lean file; `git diff --stat origin/main...HEAD` outside the folder is empty (the four files changed since `2bf5d27` outside it come from merging main).
- **Source locators checked against the text:** 5 (GKRW2025 Definition 5.12, Proposition 5.15, Example 5.16, Theorem 9.4 and its proof), all in the sampled targets 1.3 and 2.3 that the changed line cites; the other sampled targets fall in no changed passage.
- **Library declarations opened:** `TauCeti.stabilizeGL`, `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Stable.lean` line 79 (`u ↦ u ⊕ 1`).
- **Cross-roadmap citations resolved:** K3BlochGroups §§4.8, 4.22 and its supplier paragraph (line 117) at cf5467c; SchemeKTheoryOperations at 1dfb7dd names this roadmap a later consumer of §6.7 (its ownership paragraph; heading at line 2511).
- **Pull-request text** read against the head: "(open pull request)" for K3BlochGroups is still true (#1430 open); "Nothing outside the folder changes" and "three files" hold; the supplier line and acceptance-test paragraph agree with the head. Nothing contradicted, nothing left unstated. No `<!-- roadmap-summary -->` block.
- **Remark, no change asked.** Line 40 cites "MotivicStructuresInModuliOfCurves §3.4" (untouched text): that roadmap is neither on main nor in an open pull request; it is not cited as a supplier.

Overlap check: read K3BlochGroups (open, cf5467c) and SchemeKTheoryOperations (open, 1dfb7dd) again for the changed passage; AlgebraicKTheory (main), K2SymbolsBrauer, ProjectiveModulesOverPolynomialRings and CohomologyOfGroups stand as read before. Shared objects and owners: frames, hyperhomology and the constant-coefficient `GL_n` theorem, SchemeKTheoryOperations §6.7 (cited here); Suslin's spectral sequence and the semilocal range, this roadmap's 1.3 and 2.3 (consumed by K3BlochGroups 4.8 and 4.22).

Source independence: changed passages only; the changed sentence cites no source, and the two passages it points to (2.3, the 1.3 Nesterenko–Suslin property) were compared with 1 source (GKRW2025 lines 1212–1312, 3331–3352), at most four consecutive words shared, all of them formula or standard name; largest share van der Kallen 1980, 27 of 52 source citations in the body; contents not compared again, since the diff adds, removes and reorders no layer.

## Not verifiable

- Nesterenko–Suslin 1989 and Guin 1989 (2.3) were not opened; they are cited through GKRW2025, Theorem 9.4, as in earlier rounds.

## Source issues

- none

## For the human reviewers

- README lines 724–731: the values `H₁`, `H₂` of `GL_n(ℤ/9)` for `n ≤ 3` have no published source; the README gives a method, and an earlier review recomputed its terms.
- Licence: Dempwolff 1973 was read from the publisher's site (Cambridge Core), which served the PDF without a login; the sources service does not classify that host.
