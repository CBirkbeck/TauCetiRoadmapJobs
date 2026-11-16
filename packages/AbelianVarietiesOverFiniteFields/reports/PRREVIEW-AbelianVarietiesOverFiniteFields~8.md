# Review of AbelianVarietiesOverFiniteFields (pull request #1720 at 1540595)

**Verdict:** accepted

An incremental re-review of the 26 lines changed since `e411d44` (`README.md` only: the *Downstream consumers* paragraph and two passages of *Provenance*), and of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: the description now reads "`Suggested.lean` states the headline theorems that are statable at the pins: Waterhouse's list … (4.6) … the colon criterion (8.6), the Gorenstein criterion (8.4) and the finiteness of the Picard group (8.2)".
- R02 — repaired: the description now reads "the `q`-Frobenius and the Weil estimate from DeligneWeightsAndPurity DWP.1; Tate's theorem and the all-prime lattice classification from ArithmeticStatisticsPartI …; … Honda–Tate from AbelianSchemesAndArithmeticModuliPartII (F1.11, F3.2)".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.3 with DWP.1 §1.4, as the changed Provenance text cites it (`X = A`, `ν = 1`, geometric Frobenius on `H¹ = (V_ℓ A)^∨` is the transpose of `π_A`) | elliptic curve over `𝔽_2` of trace 1 | `P = T² − T + 2`, roots `(1 ± √−7)/2`, `|α|² = 2 = q`: weight 1; arithmetic Frobenius on the dual would give `|α⁻¹| = 2^{−1/2}`, weight −1; `L = 1 − T + 2T²`, `L(0) = 1` | the direction stated (geometric ↔ transpose of `π_A`) is the one of weight `ν = 1`; agrees with Conventions (Frobenius row) and 1.5 | none |
| 1.2, as AbelianSurfacesModularity consumes it (`#A(𝔽_q) = P_A(1)`) | the same curve; `r = 2` | `P(1) = 2 = #E(𝔽_2)`; `α² + ᾱ² = 1 − 4 = −3`, `#E(𝔽_4) = 4 + 1 + 3 = 8 = P(1)·P(−1) = 2·4` | consistent | none |
| First step of the Kummer isomorphism of 1.5 (`H¹(C, μ_n) ≅ Pic(C)[n]`, `k` algebraically closed, `n` invertible) | genus 0; genus 1 with `n = 2`, `p` odd; `n = p` | `Pic(ℙ¹) = ℤ`, torsion 0, `H¹ = 0`; `Pic(E)[2] = E[2] ≅ (ℤ/2)²`, rank `2g = 2`; `n = p`: `μ_p` not étale, excluded by the hypothesis the text states | consistent with the passage's hypotheses | none |

The rows for all other statements stand as in the previous review, of `e411d44`; no Lean statement changed.

- Consumer citations resolved at the open heads (5 of 5): SiegelModularForms (`bee9025c`) cites this roadmap's 1.3 only (its README lines 118, 467, 3318, 3347); AbelianSurfacesModularity (`b20dcf84`) cites 1.2, 6.1–6.3 and 10.3 (its lines 9, 69–71, 602, 665, 678), and 10.3 here states the trichotomy it names; SatoTateGroups (`1cfaabae`) names this roadmap once (its line 159) and cites no section. None of the three is named as a supplier anywhere in this README (lines 108 and 158 are scope deferrals). This also settles the previous review's remark on the SatoTateGroups sentence.
- Supplier citations in the changed text resolved at DeligneWeightsAndPurity's open head: §1.4 is "The Weil estimate for abelian varieties over `𝔽_q`" (its line 960); its Provenance maps `DeligneWeilConjecture.lean` to 4.3 (with 4.4 and 7.15; its lines 3348–3352), as the passage says.
- Provenance links opened at AxiomMath/Weil commit `27cdb204`: the directory `AlgebraicGeometry/EtaleCohomology/Trace` exists and holds `DeligneWeilConjecture.lean` (Frobenius on `H^ν` of a smooth proper scheme over a finite field pure of weight `ν`, `satisfiesWeilEstimate`); `Curves/RootsOfUnityAlgClosed.lean` holds `rootsOfUnityH1AddEquivPicardTorsion` for a smooth projective curve over an algebraically closed field with `n` a unit. The commit's full file tree (not truncated) has no path naming abelian varieties, Jacobians or Tate modules.
- Seeded sample: none of the fifteen sampled sections is in the diff; 6.3 and 10.3 are named by the changed consumer paragraph and were read against the consumer's contract only. The README flags no locator as unverified.
- Description against the head: the summary block's sentence on Siegel modular forms and abelian-surface modularity matches the new consumer paragraph; suppliers named in the prose match *Exact supplier contracts*; 11 layers, 51 milestones, 15 declarations and `metadata.toml` unchanged; the pull request adds the folder (2697 insertions, 0 deletions) and changes nothing outside it.
- Gate, run on this head: every counter 0, `OK` (the worker's run adds `build=0`). The folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- Dependency check: `depcheck: 233 roadmaps, 2228 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` gives four `declaration uses 'sorry'` warnings (lines 38, 89, 115, 148) and nothing else; the one-tactic probe and the `#check` comparison stand as in the earlier reviews, the file being unchanged.

Overlap check: read CurvesOverFiniteFields, QuaternionArithmetic, AbelianSchemesAndArithmeticModuliPartII, SatoTateGroups; Weil polynomials as polynomials — CurvesOverFiniteFields (its Layer 1), their application to `P_A` — this roadmap; Gorenstein and Bass orders — this roadmap for the commutative étale instance (8.4), QuaternionArithmetic for the quaternion instance; Tate's theorem and Honda–Tate — ArithmeticStatisticsPartI and Part II F3.2; nothing shared with SatoTateGroups. `scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id, no second copy.

Source independence: changed passages only — 3 passages compared with 2 sources (the module descriptions of the two AxiomMath/Weil files the diff adds, and DeligneWeightsAndPurity's Provenance), none shared; the arrangement was not compared again (no layer added, removed or reordered); largest share by a rough count `hnr2009`, about 15 of roughly 75 locators.

## Not verifiable

- "The repository's own files contain no result specific to abelian varieties" (Provenance): checked on the file names of the whole tree at the commit, not by reading every file; the tree has a `GroupScheme` directory whose files were not opened.
- "geometric Frobenius" for `DeligneWeilConjecture.lean`: the file's description does not use the word; the weight `+ν` it proves is that of geometric Frobenius (first table row).
- The items of the earlier reviews stand unchanged (Deligne 1969 Theorem 7 page numbers: the cached `deligne1969` text is not the article; the overlines in `marseglia-sqfree` Theorems 5.2 and 5.4; Weil 1957; Lauter 2000 and Howe–Lauter 2003; the locator-only references; "One of 23 roadmaps for the mathematics behind the LMFDB" in the description).

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md`, section *Provenance*, names two public formalisations (formal-arithmetic-geometry/weil-conjectures, AxiomMath/Weil) as proof sources and states both are Apache-2.0; the licence statement was not checked against the repositories, and no declaration of `Suggested.lean` was compared with them.
- **Not tested.** The cached text for `deligne1969` is the volume's front matter, not the article, so the locator "Theorem 7, pp. 240–241" (9.1, 9.2) has not been checked against the text in any round.
