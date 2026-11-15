# Review of MetaplecticAutomorphicForms (pull request #1063 at 1dab48e)

**Verdict:** accepted

Incremental re-review of the 129 lines changed since `ebe857f`, plus the pull request's title and description. No finding; the gate passes.

## Previous findings

- R01 — repaired: every `PDFn` is gone from the Weil64 and GZ86 locators, e.g. "(Weil64, III.§§38–40, printed188–193)" and "printed274; proof275"; the remaining `PDF` numbers belong to other sources.
- R02 — repaired: "(Weil64, I.§§2–4, printed147–149 (dual Haar measures, the module of an automorphism, module one for symplectic automorphisms, the group `A(G)`); Kudla96, I.2 pp.6–10 …)".
- R03 — repaired: `5.5` is in one Layer 7 `*Needs:*` line only, 7.49 ("5.3, 5.5, 7.1, 7.2; AutomorphicFormsOnReductiveGroups §7.2; …"); 7.34 now reads "7.20a, 7.28, 7.29a, 7.33".
- R04 — repaired: line 6 "# Metaplectic groups, Weil representations and automorphic theta kernels: target signatures"; `/-! ## Layer 0 … -/`, `/-! ## Layer 1 … -/`, `/-! ## Layer 8 … -/` at lines 55, 82, 194, titles as in the README.
- R05 — repaired: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, followed by author-side red-team passes."; the description also names the three stated headline theorems.

## Verified sound

| # | Statement | Instance | Left | Right | Result | Change |
|---|---|---|---|---|---|---|
| 1 | 0.14, symplectic automorphisms preserve the product Haar measure (locator changed) | `W=F²`, `σ=diag(a,a⁻¹)`; control `diag(ϖ,1)` | module `|a|·|a⁻¹|=1`; control `|ϖ|=q⁻¹≠1`, not symplectic (`det≠1`) | README: module one for symplectic automorphisms, Weil64 I.§3 inside the cited §§2–4 | agree | none |
| 2 | 7.21 Checks (sampled; its consumers' `*Needs:*` changed) | `d=1, d′=5, c=4`; `b²≡5 mod 4` gives `b=1,3`; phase `e(2mb/c)=(−1)^m` | `S₀=2`, `S₁=−2`, `S₂=2`; mod `2a=2`: one root, value `(−1)^m` | README: 2, −2, 2; factor 1/2 between the two sums | agree | none |
| 3 | 7.8 normalisation (sampled; `*Needs:*` changed) | index `[PSL₂(Z):Γ₀(4)]=6` | `6·π/3=2π`; `(3/π)·2π=6`; `2π/4=π/2`; `12/6=2` | README: `‖θ‖²=2π`, 6, `‖θ/2‖²=π/2`, coefficient 12 to 2 | agree | none |
| 4 | Pins sentence (changed) | `lake-manifest.json` | Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…` | README line 39: the same two revisions | agree | none |
| 5 | Layer 7 Dependencies, "Layers 3 and 5" (changed) | in-roadmap ids outside Layer 7 in its `*Needs:*` lines | 3.7, 5.6 (7.29a); 5.3, 5.5 (7.49); no 2.x | README: Layers 3 and 5 | agree | none |
| 6 | 7.34 `*Needs:*` (changed) | order of ids | 7.20a, 7.28, 7.29a, 7.33 all precede 7.34; the statement's inverse eigenline is the companion of 7.29a | README line 2291 | agree | none |

The rows for untouched statements stand as in the previous review, of `ebe857f`.

- Gate at this head: every check 0, `OK` (build included). `lake env lean` on `Suggested.lean`: four `declaration uses sorry` warnings (lines 113, 150, 172, 218), nothing else; the diff changes comments and the module docstring only, no signature.
- Dependency check: `depcheck: 245 roadmaps, 2243 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- No file outside the roadmap folder differs from `origin/main` (`git diff --stat origin/main...HEAD` outside the folder is empty).
- `*Needs:*` lines read: all 50 of Layer 7; `5.5` occurs once (7.49). Headings: none removed or renumbered by the diff, so the ids other roadmaps cite (3.2a, 3.3, 3.15, 6.2, 6.10a, 6.15, 6.16, 6.22) stand.
- Pull request text against the head: adds the roadmap (folder absent from main); `Suggested.lean` states 1.1, 1.2 with the multiplicity theorem, and 8.24, as the description says; four `sorry` warnings; kernel-of-`λ₂` topology and the discontinuous Bruhat section (2.4b); Gan–Sun route for quaternionic pairs (3.7); consumers as in "Downstream consumers". No sentence is contradicted and no change is left unstated.
- Remark (untouched text): the Layer 7 Dependencies line does not list GL2AutomorphicRepresentationsAndTransfer R16.0.1 (7.29a), IntegralLattices Layer B or GlobalNumberFields (7.20a, 7.32-raw), which its `*Needs:*` lines name.
- Overlap check: read ExceptionalThetaCorrespondencesForG2, AutomorphicLFunctionsAndLocalFactorsPartII, GrossZagierAndArithmeticHeights; nothing shared (each cites this roadmap's sections as a supplier and owns none of them); the overlap tool lists no shared roadmap, dropped id or second copy.
- Source independence: changed passages only; 1 passage compared (the 0.14 locator gloss, 15 words of section labels) with 1 source, Weil64, as recorded in the review of `ebe857f` (its text was not readable this round), none shared; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- Weil64: not in the sources cache this round (recorded as uncertified); the printed pages of 0.14 and 4.6 (III.§§38–40, printed 188–193) rest on the reading recorded in the review of `ebe857f`.
- EZ85 §6: paywalled; cited by its locator alone.

## Source issues

- none

## For the human reviewers

- Licence: Weil64 is linked at a third party's personal page on an Edinburgh university host (`TauCetiRoadmap/MetaplecticAutomorphicForms/README.md` line 3473); the host's right to carry the Acta Mathematica scan was not established.
- Licence: BFH90 is linked at a third party's site, wstein.org (References section of the same README), as a scan of a Springer journal article; its status there was not established.
- Not tested: the source with the largest share of the locators was not recomputed and the arrangement was not compared in this incremental round.
