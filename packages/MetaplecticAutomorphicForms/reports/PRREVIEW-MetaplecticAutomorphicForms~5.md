# Review of MetaplecticAutomorphicForms (pull request #1063 at 0639793)

**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the 10 lines changed since `bc0cc87` (the consumer of Layer 8 renamed to RankOneConverse §4.1 in five sentences) and a first reading of the pull request's title and description against this head found no finding. The renamed citation resolves, and the title and description state nothing the head contradicts. There is no small correction and one format note carried from the previous round, not blocking; one item remains for the human reviewers.

## N01 — The overview's "Jacobi theta function" is not normalised

The identity `θ(i/2) = √2·θ(2i)` at the end of the fourth-result paragraph (line 13, unchanged) holds for `θ(τ) = Σ exp(πi n² τ)` (both sides 1.4194955), the function the Check of 8.24 names; for `θ(τ) = Σ exp(2πi n² τ)` the two sides are 1.0864 and 1.4142. Adding the series, or "Mathlib's `jacobiTheta`", would fix the reading.

## Previous findings

- none — the previous report, of `bc0cc87`, raised no finding. Its small correction C01 is repaired: lines 15, 3379, 3387, 3423 and 3427 now read "RankOneConverse" or "RankOneConverse §4.1", and "RankZeroOneBSD" occurs nowhere in the folder or in the description. Its format note N01 is unchanged and is written again above.

## Verified sound

| # | Statement | Instance | Left | Right | Result | Change |
|---|---|---|---|---|---|---|
| 1 | 8.85, "At `m=N rad(N), r=1` these supply RankOneConverse §4.1", against 8.86's hypotheses `8M∣N, N∣m, 4m∣N²` | `M=1,N=8`; `M=3,N=24`; general `N` with `8∣N` | `N=8`: `m=16`, `4m=64`; `N=24`: `m=144`, `4m=576` | `N²=64`; `N²=576`; in general `4m∣N²` iff `4·rad(N)∣N`, true when `8∣N` | the specialisation satisfies 8.86's level conditions, with equality `4m=N²` in both instances | none |
| 2 | 8.85 and "Scope and ownership": §4.1 of RankOneConverse "owns twist residues, positivity, noncancellation, simultaneous local conditions and infinitude" | RankOneConverse at its open head, §4.1 (lines 253–263) and its scope section (line 458) | README: five items handed to §4.1; 8.87 concludes "no nonvanishing theorem under all local conditions" | §4.1 states the two infinitude theorems with split conditions at `S₀`, and claims twist-residue, positivity, noncancellation, infinitude and local prescriptions as its own | one owner; nothing stated twice | none |
| 3 | Direction of the renamed edge | merge order; `*Needs:*` of RankOneConverse §4.1 | this roadmap at position 162, RankOneConverse at 409; named here only under consumers | RankOneConverse §4.1 `*Needs:*` cites §§8.85–8.87 of this roadmap | downward edge; no supplier citation of a later roadmap | none |
| 4 | Description: "`Suggested.lean` states smooth Stone–von Neumann (§1.1), the unitary … classification with its Hilbert multiplicity theorem (§1.2) and the genus-two theta inversion formula (§8.24)"; "four `sorry` warnings" | the file at this head, elaborated | theorems `smooth_stoneVonNeumann`, `unitary_stoneVonNeumann`, `unitary_stoneVonNeumann_multiplicity`, `theta_fourier_transform` | warnings at lines 113, 150, 172, 218 and nothing else; 11 declarations, 7 of them definitions | agree | none |
| 5 | Description: Howe duality "for orthogonal–symplectic and unitary pairs … in every characteristic other than two, dyadic residue fields included"; quaternionic pairs separate | 3.7 (line 706) | description: two families, characteristic ≠ 2, residue characteristic 2 allowed | 3.7: the same pairs and field hypotheses; quaternionic full duality a separate clause through 3.16 | description claims no more than 3.7 | none |
| 6 | Description: the cover's topology is not given by Rao coordinates; the rank-one circle cover is reused | 2.4b (line 438); "Prerequisites and boundaries" (line 3441) | description: Bruhat section discontinuous; GL2AutomorphicRepresentationsAndTransfer's cover not redefined | 2.4b: the discontinuous section defines no product topology; line 3441: rank-one instances are abbreviations of R17.4.13a | agree | none |

The rows for untouched statements stand as in the previous review, of `bc0cc87`.

- Automatic checks at this head, run again: every check 0, `OK`, the targeted build included. Elaboration of `Suggested.lean`: four `declaration uses sorry` warnings, nothing else. The diff touches no line of `Suggested.lean`; the elaborated signatures are those compared in the earlier rounds, and the one-tactic probe was not repeated.
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD or CYCLE line. The diff adds no supplier and no `*Needs:*` line.
- No file outside the roadmap folder differs from `origin/main`; the folder holds `README.md`, `Suggested.lean` and `metadata.toml`, as the description says.
- Cross-roadmap citations resolved for the changed passages: RankOneConverse §4.1 exists at its open head ("General quadratic nonvanishing with local prescriptions") and cites §§8.85–8.87 of this roadmap (its lines 263, 339, 458). The other consumers the description names resolve: GrossZagierAndArithmeticHeights and ModularityAndLanglandsExtensions are open roadmaps, QSeriesPartitionsAndMockModularForms is on main and cites §4.7 of this roadmap.
- Pull request text against the head: the title is the README's title; the description says the pull request adds a roadmap folder (it does: 295 headings and 11 declarations added, none removed), names the three stated headlines and the layer of each end theorem (the eight layer headings agree), and names RankOneConverse as the consumer of the genus-two export. No sentence is contradicted and no removal, renumbering or supplier change is left unstated.
- Seeded sample: none of the fifteen sampled targets lies in a changed passage; 8.87 is cited by one (as part of "8.85–8.87") and its statement is unchanged. They were not reopened in this incremental round.
- Library declarations opened: none new; the diff changes no library citation.

Overlap check: read GrossZagierAndArithmeticHeights, ExceptionalThetaCorrespondencesForG2, AutomorphicLFunctionsAndLocalFactorsPartII, and RankOneConverse for the changed passages; nothing shared (RankOneConverse §4.1 owns the final nonvanishing deductions and this roadmap the exports of 8.85–8.87, each citing the other's part); no shared roadmap, dropped id or second copy is listed for this head.

Source independence: changed passages only; the 5 changed sentences alter a roadmap name and add no wording taken from a source, so 0 passages were compared with 0 sources; largest share not recomputed; arrangement not compared again (no layer added, removed or reordered).

Research link: the headline targets are Weil's metaplectic representation (Weil 1964), Howe duality as proved by Gan–Takeda (2016), the regularized Siegel–Weil and Rallis formulas of Gan–Qiu–Takeda (2014), and the Bump–Friedberg–Hoffstein nonvanishing theorem (1990), used by the Gross–Zagier roadmaps; rests on the README's overview and References.

## Not verifiable

- Weil64: recorded as uncertified and not read; as in the previous round, "open at Project Euclid" was confirmed as to the host only.
- Z21: the published text behind the DOI was not opened; the physical-page locators at line 610 were not checked.
- EZ85 §6: paywalled; cited by its locator alone.
- The description's sentence on AI assistance and "author-side red-team passes" describes the author's process and cannot be checked against the head.

## Source issues

- none

## For the human reviewers

- Not tested: the source with the largest share of the locators was not recomputed and the arrangement was not compared in this incremental round; the diff adds, removes and reorders no layer.
