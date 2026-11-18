# Review of MetaplecticAutomorphicForms (pull request #1063 at bc0cc87)

**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the 126 lines changed since `1dab48e` (the new opening overview, the scope and supplier-contract sections moved to the end, three reference links) found no finding. Every statement of the new overview agrees with the layer that makes it, and its worked value for the theta inversion was recomputed. There is one small correction (a consumer roadmap named in the overview that exists nowhere) and one format note, neither blocking; the licence questions of the previous round are removed by the new links, and one item remains for the human reviewers.

## C01 — The overview names RankZeroOneBSD as the consumer of the last layer, and no roadmap of that name exists

A reader who follows the overview's sentence "RankZeroOneBSD uses the genus-two coefficients and local tests of the last layer for its nonvanishing argument for quadratic twists" (line 15) finds nothing: there is no folder of that name on main and none among the open roadmap pull requests. The open roadmap RankZeroOneBSDPartII says in its own scope section that "there is no separate RankZeroOneBSD roadmap", and the open roadmap RankOneConverse cites MetaplecticAutomorphicForms §§8.85–8.87 in its supplier list (and in the `*Needs:*` lines of its §4.1) and states that the twist-residue, positivity and noncancellation deductions "are owned by §4.1 here".

The smallest change is to write RankOneConverse §4.1 in that sentence. The same name stands in the untouched text (8.85, 8.86, "Downstream consumers", the first paragraph of "Scope and ownership") and in the pull request's description ("RankZeroOneBSD completes quadratic-twist nonvanishing from the genus-two export"); the same replacement makes those true as well. No supplier edge is involved: the roadmap is named only as a consumer.

## N01 — The overview's "Jacobi theta function" is not normalised

The identity `θ(i/2) = √2·θ(2i)` at the end of the fourth-result paragraph (line 13) holds for `θ(τ) = Σ exp(πi n² τ)` (both sides 1.4194955), which is the function the Check of 8.24 names; for `θ(τ) = Σ exp(2πi n² τ)` the two sides are 1.0864 and 1.4142. Adding the series, or "Mathlib's `jacobiTheta`", would fix the reading.

## Previous findings

- none — the previous report, of `1dab48e`, raised no finding (R01–R05 of the round before it were recorded there as repaired; the passages it quoted for them are unchanged at this head, apart from the Weil64 and BFH90 links treated below).

## Verified sound

| # | Statement | Instance | Left | Right | Result | Change |
|---|---|---|---|---|---|---|
| 1 | Overview, fourth result (8.24 and `GenusTwo.theta_fourier_transform`) | `Z=iI₂`, `a=1`, `W=ν=0`; `−Z⁻¹=iI₂`, `−det Z=1` | `Σ_{R∈(2ℤ)²} e^{−π|R|²/2} = θ(2i)² = 1.00748372` | `½·Σ_{R∈ℤ²} e^{−π|R|²/2} = ½θ(i/2)² = 1.00748372` | agree; `θ(i/2)=1.4194955=√2·θ(2i)` | N01 |
| 2 | Overview, branch "positive at `Z=iY`" | `Z=X+iI₂`, `X` with real eigenvalues `λ₁,λ₂` | `det Z=(λ₁+i)(λ₂+i)`, argument in `(0,2π)` | `−det Z` never a negative real; at `X=0` it is 1 | principal root holomorphic, as in the Lean statement | none |
| 3 | Overview, uniqueness of the character that is `z↦z²` on the circle (2.4b) | `W=0`; `F=ℂ`; `F` nonarchimedean | `W=0`: normalizer `U(1)`, one such character, kernel `{±1}` | two such characters differ by a continuous character of `Sp(W)`, trivial since `Sp(W)` is perfect over an infinite field | agrees with 2.4b's uniqueness bullet | none |
| 4 | Overview, no continuous splitting for `W≠0`, `F≠ℂ`; `W=ℝ²` | `SO(2)⊂SL₂(ℝ)`; `F=ℂ` | preimage of `SO(2)`: connected double cover of the circle | over `ℂ` 2.4b gives `Sp(W)×μ₂`, split, excluded by the overview | agrees with 2.4b | none |
| 5 | Overview, smooth Stone–von Neumann (1.1, `smooth_stoneVonNeumann`) | hypotheses side by side; `W=0` | overview: nonarchimedean, characteristic ≠ 2, `ψ` nontrivial continuous unitary, irreducible smooth; both conclusions | 1.1 and Lean: `h2`, `hnψ`, `hψ`, `IsIrreducible`, `hsmooth`; isomorphism and scalar endomorphisms; `W=0`: `ρ=ψ`, model `ℂ` | same hypotheses, same two conclusions | none |
| 6 | Overview, unitary Stone–von Neumann and multiplicities (1.2) | `H=0` | overview says "nonzero irreducible"; Lean has `[Nontrivial H]` | `H=0` has no isometry onto `L²(X)≠0`; in the multiplicity form `H=0` gives the empty index set | agree | none |
| 7 | Overview, Howe duality (3.5, 3.7) | hypotheses side by side | overview: orthogonal–symplectic and unitary pairs, nonarchimedean, characteristic ≠ 2, residue characteristic 2 allowed; `θ(π)` zero or irreducible; injectivity on nonzero lifts | 3.7: the same pairs and field hypotheses; quaternionic case a separate clause that the overview does not claim | overview claims no more than 3.7 | none |
| 8 | References, BFH90 link and the sentence on its cover sheet | the linked scan | 77 physical pages; page 1 a terms sheet; printed 543 is physical 2 | locators "printed551, PDF10" (5.x line 1750, 8.87 line 3405): `551−543+2=10` | agree | none |
| 9 | References, Weil64 and Z21 links | DOI and arXiv id | `10.1007/BF02391012` redirects to Project Euclid; arXiv:1909.02697 is Wei Zhang's paper of that title, "to appear in Ann. of Math." | README: "open at Project Euclid"; "preprint arXiv:1909.02697" | agree (openness of the Euclid copy not confirmed, below) | none |
| 10 | Moved sections: directional pointers | every "above"/"below" in the README | "The next section orders the targets" precedes "How to read the build"; "The contracts below" stands inside the supplier contracts | no sentence of the moved sections points at the layers as "below" | consistent | none |

The rows for untouched statements stand as in the previous review, of `1dab48e`.

- Automatic checks at this head, run again: every check 0, `OK`, the targeted build included. Elaboration of `Suggested.lean`: four `declaration uses sorry` warnings (lines 113, 150, 172, 218), nothing else. The diff touches no line of `Suggested.lean`, so the elaborated signatures are those compared in the previous round.
- Dependency check: `depcheck: 206 roadmaps, 2239 edges, 0 problem(s)`; no UPWARD or CYCLE line. The diff adds no supplier and no `*Needs:*` line; the moved supplier contracts are identical, line for line, to those at `1dab48e`.
- No file outside the roadmap folder differs from `origin/main`.
- Seeded sample: none of the fifteen sampled targets lies in a changed passage or is cited by one; they were not reopened in this incremental round.
- Cross-roadmap citations resolved for the overview: GrossZagierAndArithmeticHeights cites §6.22 and §§6.7–6.9 of this roadmap at its open head (its lines 1439, 1474, 2086); RankOneConverse cites §§8.85–8.87 (its lines 253, 329, 448); RankZeroOneBSD: not found (C01).
- Pull request text against the head: the title and description describe a new roadmap, the three stated headline theorems and the four `sorry` warnings, all as at this head; the reordering of the README's sections changes nothing they state. The only sentence the head does not bear out is the one named in C01.
- Headings: the diff moves `## Scope and ownership`, `### Prerequisites and boundaries`, `## Exact supplier contracts` and its two subsections, and `## How to read the build`; no layer or numbered section is added, removed or renumbered, so the ids other roadmaps cite stand.

Overlap check: read ExceptionalThetaCorrespondencesForG2, AutomorphicLFunctionsAndLocalFactorsPartII, GrossZagierAndArithmeticHeights; nothing shared (each cites this roadmap's sections as a supplier and owns none of them); no shared roadmap, dropped id or second copy is listed for this head.

Source independence: changed passages only; 3 passages of the new overview (the uniqueness sentence, the scalar ambiguity of the intertwiners, the largest isotypic quotient) compared with 1 source, Kudla96 lines 88–89, 106 and 1256, none shared (longest common run five words, a standard phrase); largest share not recomputed; arrangement not compared again (no layer added, removed or reordered).

Research link: the headline targets are Weil's metaplectic representation (Weil 1964), Howe duality as proved by Gan–Takeda (2016), the regularized Siegel–Weil and Rallis formulas of Gan–Qiu–Takeda (2014), and the Bump–Friedberg–Hoffstein nonvanishing theorem (1990), used by the Gross–Zagier roadmaps; rests on the README's overview and References.

## Not verifiable

- Weil64: recorded as uncertified and not read; the DOI now redirects to Project Euclid, whose page returned no text to this review, so "open at Project Euclid" was confirmed as to the host only.
- Z21: the published text behind the DOI was not opened; that the locators "PDF70–71" and "PDF108–109" (line 610) are physical pages of the published file, as "Page numbers refer to the linked version" requires, was not checked.
- EZ85 §6: paywalled; cited by its locator alone.

## Source issues

- none

## For the human reviewers

- Not tested: the source with the largest share of the locators was not recomputed and the arrangement was not compared in this incremental round; the diff adds, removes and reorders no layer.
