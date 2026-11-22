# Review of UniformWildKernelBounds (pull request #2892 at 112cb9d)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/UniformWildKernelBounds/`
**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the five lines changed since `8f4ea0c`, together with a first reading of the title and description against this head. The two changed sentences (the supplier contract for ModularityAndLanglandsExtensions §2.43 and the References entry for Theorem 5.5.2) now carry the hypothesis of extremely regular weight and agree with the supplier; the description agrees with the head sentence by sentence. Two format notes remain from the previous review, neither blocking, and the questions for the humans who approve are unchanged: [FormalProof], which holds nearly all the locators, could not be read from a legal place.

## N01 — The family index still says "The family follows the formal Lean proof" (index `README.md`, line 10), and the References of this README still say that the window bound and case analysis of [FormalProof] "are reconstructed in Layers 1–7" (line 3684); the description repeats the first sentence. The project's rule is that a roadmap does not say it follows a source. If the mathematical route and not the arrangement is meant, wording such as "the family states, as targets, the theorems that the formal proof establishes" would say so; the index is shared by the family's pull requests, so a change there is made in all of them.

## N02 — 1.1 is still stated "for every `e ≠ 0`" (line 262, and the Checks at lines 276 and 370), while the Conventions define `Ш¹(F, ℓ, e)` as the group of BernoulliBoundsForClassGroupEigenspaces §6.17, which is defined for `e ≥ 1`. Either say in the Conventions that the same definition is used for every integer `e ≠ 0` in 1.1, or state 1.1 for `e ≥ 1`, the range every later target uses.

## Questions for the author

- Carried from the previous review, the text being unchanged: in the Check of 4.3 (line 2414), is `diag(Ψ′, 1, Ψ′⁻¹)`, `Ψ′ = ψχ_ℓ^{−28}`, a point of the ring `R_ℓ = 𝔘/P` of 4.1 at `ℓ = 29`? What stopped the check: 4.1 (local chart)(ii) characterises only the points that reduce to the diagonal lift over a finite local algebra, and this point does not, so its lying on the component `P` needs an argument the README does not give.

## Previous findings

The previous review, of `8f4ea0c`, had no finding; its two small corrections and two format notes are accounted for here.

- C01 — repaired: "§2.43 (irreducibility of `r_{ℓ,ι}(π)` for a density-one set of `ℓ`, for `π` a regular algebraic polarizable cuspidal representation of `GL_n` over a CM field, of extremely regular weight, …)" (line 3575); the References entry likewise (lines 3737–3738). No new problem.
- C02 — repaired: the description now reads "the clauses (w1), (w2) of the automorphy statements 3.22(c), 4.2(b), (c) and 4.5(b)", as the Summary (line 55) has it.
- N01 — not repaired: written again above as N01.
- N02 — not repaired: written again above as N02.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Contract for ModularityAndLanglandsExtensions §2.43 (changed; cited by 3.20(f), 4.2(d), 4.4, 4.8) | §2.43 at its open head; AG2.6 on main; weights `(e+1, e, 1, 0)`; rank 2, weights `(k−1, 0)` | Supplier: CM `F`, extremely regular RAC polarizable `GL_n`, density-one `ℓ`: same four hypotheses. `{e+1, 0}`, `{e, 1}` both sum to `e+1`: not extremely regular, so the hypothesis is needed; rank 2: one-element sums `k−1 ≠ 0`. | exact |
| "which proves … `ExtremelyRegularIrreducibility n` for every `n ≥ 2`" (same sentence) | AG2.6's definition (main, line 2085) | Premise asks one prime `ℓ′` for conjugate-self-dual `Π₁` of extremely regular weight over imaginary CM `F₁`; a density-one set is nonempty, conjugate-self-dual is a polarizable case | holds |
| References entry, Theorem 5.5.2 (changed) | against the contract sentence and §2.43's title, which names Theorem 5.5.2 | Same hypotheses in both sentences: regular algebraic, polarizable, cuspidal, CM field, extremely regular weight | consistent |

The rows for the untouched statements stand as in the previous review, of `8f4ea0c`.

- Changed passages: 2 sentences (5 lines), both in the bookkeeping (supplier contracts, References); no layer, target, Check or Lean statement changed.
- Cross-roadmap citations resolved for the changed text: ModularityAndLanglandsExtensions §2.43 at its open head (heading "2.43 Irreducibility of `r_{l,ı}(π)` for density-one l (Theorem 5.5.2)"), AutomorphicGaloisRepresentationsPartII AG2.6 on main (lines 2085–2090).
- Source locators: Barnet-Lamb–Gee–Geraghty–Taylor, Theorem 5.5.2, was read by the previous review (arXiv v4, text lines 3787–3792) and not fetched again; the changed wording was compared with that record and with §2.43. None of the fifteen seeded targets falls in the changed passages.
- Description against the head, sentence by sentence: the definition of `Ш¹` and the statements over `ℚ` and `ℚ(μ_ℓ)` (Summary, lines 3–11); the total `V` and host fields (lines 14–20); headings 7.3–7.6 and Layers 1–7; 5.1 with ExplicitNumberFields §§0.3, 5.3 (lines 2985–2995); the list of statements without a route (line 55 and 7.6); the declaration named at 7.6; the consumers (Downstream consumers); the family index's three files and its list in merge order; `Suggested.lean` declaring nothing. No sentence is contradicted, and the pull request adds the roadmap, so nothing removed or renumbered is left unstated.
- Dependency check: `depcheck: 168 roadmaps, 1987 edges, 0 problem(s)`; no UPWARD or CYCLE line. Outside the folder the pull request changes only the family index (three files).
- Automatic checks: all passed. Elaboration: `lake env lean` on `Suggested.lean` ends with no message; the file declares nothing, so there is no signature to compare and no one-tactic probe to run.
- Headlines: 7.3 (with 7.2), 7.4 with its budget form 7.6, and 7.5; none statable at the pins, each named in the docstring with what it lacks. Unchanged.

Overlap check: read HeckeIdealsAndTaylorWilesRelations, ReducibilityIdealsAndUltrafilterPatching, BernoulliBoundsForClassGroupEigenspaces, PotentialAutomorphyInfrastructurePartII, ExplicitNumberFields (open), ClassicalSerreModularity, AutomorphicGaloisRepresentationsPartII, GlobalGaloisDeformations (main) in the previous review; nothing shared. The change adds no object: it restates the hypotheses of a theorem that ModularityAndLanglandsExtensions §2.43 owns and this roadmap cites. No open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only; 2 passages compared with 1 source (Barnet-Lamb–Gee–Geraghty–Taylor, Theorem 5.5.2, as recorded by the previous review) and with the supplier section, none shared: the added clause is a list of hypotheses. Largest share [FormalProof], about 165 of about 170 locators; its text and contents could not be read, so wording and arrangement were not compared with it. No layer was added, removed or reordered.

Research link: an unconditional substitute for Vandiver-type vanishing of `K_{2e}(𝒪_F){ℓ}` (Soulé 1979, 2003), through Ferrero–Washington (1979), Kato (2004) and residually reducible automorphy lifting (Skinner–Wiles 1999, Thorne 2015, Allen–Newton–Thorne 2020, Newton–Thorne 2023); it is the "weakening of Vandiver" of the announcement (line 181). Rests on the README's Summary and References and on the announcement.

## Not verifiable

- [FormalProof], for every statement attributed to it: no legal copy of its text could be read (the repository's host is in no licence class known to the sources service). Unchanged from the previous review; the changed passages do not cite it.
- Kato 2004, Theorem 14.2, and Deligne–Serre 1974, Lemme 6.11: not read, as in the previous review; untouched by the change.

## Source issues

- none

## For the human reviewers

- Scope: the main source is [FormalProof], an unpublished, unrefereed Lean development announced on 20 November 2026 (README line 3684). The four-page announcement states none of the bounds 7.3–7.6, and no refereed source states them.
- Licence: the family index (line 13) records that the repository of [FormalProof] says the proof was published without a license and is mirrored for verification only. The README cites about 165 of its declaration names and file paths.
- Not tested: [FormalProof] holds nearly all the locators. Its text and table of contents were not read, so neither its wording nor its arrangement was compared with the roadmap; the index says the family "follows" that proof (N01).
