# Review of SpecialFunctionsSU11MatrixElements (pull request #2934 at b03f076)

**Verdict:** accepted

**Summary.** Accepted: no finding, no small correction and no format note. This is an incremental re-review of the 22 lines changed since `9186656`: the one format note of the previous review is repaired (5.3 now lists 2.1), and the new links and section numbers for SpecialFunctionsLegendre, which is now on main, resolve to sections that say what is cited. As before, none of the four cited books could be read legally, so locators and wording were not compared with a source; that is left to the human reviewers.

## Previous findings

The previous report had no finding (R); its one format note is accounted for here.

- N01 — repaired: 5.3 ends "*Needs:* 1.1, 1.3, 2.1, 4.2, 5.2; NoncompactQuantumSymmetry M4.P." and "How to read the build" says "5.3 uses 1.1, 1.3, 2.1, 4.2 and 5.2".

## Verified sound

Values computed by me from the circle integral of Conventions (4096-point trapezoid rule, double precision). The diff changes no statement; the rows are for the statements the changed text cites.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.3 Laplace's integral, with SpecialFunctionsLegendre 8.2 and 1.1 (`boostMatrixElement_zero_zero`) | `τ = −1/2 + 0.8i`, `t = 0.9`; `τ = 0.23 + 0.4i`, `t = 1.3` | circle integral, Laplace integral, `F(τ+1, −τ; 1; (1 − cosh t)/2)`: `0.8331690033235` all three; `1.03508270600 + 0.23663618376i` all three | holds; the README's Check value `0.83316 90033` agrees | none |
| 2.1 bound as 5.3 now cites it (`norm_boostMatrixElement_le_one`, `n = 0`) | `ρ = 0, 0.3, 0.9, 2.1, 5`; `t = 0.2, 0.9, 1.7, 4`; `m = 1, 2, 3, −1, −4` | maximum of the 100 values of the modulus of `𝔓^{−1/2+iρ}_{m0}(cosh t)`: `0.5437` | holds, so the inversion integral of 5.3 has the bound it uses | none |
| 5.3 Check on the kernel | `ρ = 0.9`, `t = 1.2`, `m = 1` | squared modulus of `𝔓^{−1/2+iρ}_{10}`: `0.2061643714`; README `0.20616 43714` | agrees | none |

The rows for the untouched statements stand as in the previous review, of `9186656`.

- Source locators checked against the text: 0 (see Not verifiable).
- Cross-roadmap citations resolved: the five sections of SpecialFunctionsLegendre, read on main. 1.1 defines `P^μ_ν` on the domain containing `(1, ∞)`; 1.4 has the recurrences 14.10.6–14.10.7 for `P^μ_ν` on `(1, ∞)`; 4.5 has the limiting forms as `x → ∞`; 8.2 states Laplace's first integral for `Re z > 0` and all `ν`; 10.2 states the addition theorems for general degree. Its scope lists the Mehler–Fock transformation as not owned, so the transform has one owner, this roadmap. The three new links point to `TauCetiRoadmap/SpecialFunctionsLegendre/README.md`, which exists on main.
- Library declarations opened at the pin: none new; the change touches no library name.
- Dependency check: `depcheck: 106 roadmaps, 1217 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file is changed outside the folder.
- Elaboration: `Suggested.lean` (unchanged since `9186656`) elaborates with 44 `declaration uses sorry` warnings and no error; single import of Mathlib; no `set_option`, no sorried data. The one-tactic probe and the signature comparison stand as in the previous review, the file being unchanged.
- Pull-request text against this head: SpecialFunctionsLegendre is listed under "On main" with sections 1.1, 1.4, 4.5, 8.2, 10.2, which is now the case; the two suppliers still open (SpecialFunctionsGroupModels, SpecialFunctionsSU2MatrixElements) are named with their sections; 44 theorems. No correction.

Overlap check: read SpecialFunctionsLegendre (main, at this round's main), and, as scoped in the previous review, SpecialFunctionsGroupModels, SpecialFunctionsRankOneSymmetricSpaces, SpecialFunctionsMotionGroupsBessel, SpecialFunctionsAffineHeisenbergGroups, SpecialFunctionsHigherSpheres, SpecialFunctionsSU2MatrixElements (open), SpecialFunctionsAppell, SpecialFunctionsBessel (main); the change adds no object and moves no ownership. Owners unchanged: models, general matrix elements and Euler factorization are SpecialFunctionsGroupModels'; `P^μ_ν`, Laplace's integral and the addition theorem for general degree are SpecialFunctionsLegendre's; the Jacobi-function identification is SpecialFunctionsRankOneSymmetricSpaces'; `𝔓^τ_{mn}` and the Mehler–Fock transform are owned here only. The files of the open pull requests of SpecialFunctionsGroupModels and SpecialFunctionsSU2MatrixElements were not among those given this round and were not read again.

Source independence: changed passages only; 0 passages compared with 0 sources, because the change adds no source-derived wording (links, two `*Needs:*` entries) and none of VK, W, D, M could be read legally; largest share VK, 37 of 64 locators; contents not compared with VK's text (the change adds, removes and reorders no layer).

Research link: The targets are the `SU(1,1)` matrix-element identities and Mehler–Fock inversion of Vilenkin–Klimyk (1991), Wawrzyńczyk (1984), Dieudonné (1980) and Miller (1968); SpecialFunctionsRankOneSymmetricSpaces uses them for Jacobi-function harmonic analysis on rank-one symmetric spaces. Rests on the README's References and Downstream consumers, not on a source text.

## Not verifiable

- The source locators of the sampled sections (1.1–5.3), and the README's list of misprints: as in the previous reviews, none of [VK], [W], [D], [M] could be read legally; they were not fetched again.
- The Checks of 2.1 quoted "to `10⁻²⁵`" and "to `10⁻²⁰`" were confirmed to double precision only in the previous review.

Automatic checks set aside as false positives: a section comment at the end of the Lean file was reported as having no declaration under it; it heads the `#check` pins of library declarations, which are its content and which the file rules allow.

## Source issues

- none

## For the human reviewers

- **Not tested.** [VK] carries 37 of the 64 locators; neither its text nor its table of contents could be read, and [W], [D], [M] could not be read either. Wording and arrangement were not compared with any source.
- **Licence.** The README ("Prior formalization") says the Lean names and statements are those of the author's public repository `bjbraams/lean-SFVK` (Apache-2.0), directory `SFVK/SU11/`; I did not open that repository.
- **Licence.** `Suggested.lean` contains 20 definitions copied verbatim from the `Suggested.lean` of SpecialFunctionsGroupModels, an open pull request by the same author.
