# Review of ModularityAndLanglandsExtensions (pull request #1180 at 6d60dea)

**Verdict:** accepted

**Summary.** Accepted: this was an incremental re-review of the 2 lines changed since `123b48a`, and no finding remains. The one changed sentence, in the scope section, now says that the further consequences of `SP_n` (Newton–Thorne's Theorem 6.5, the holomorphy of `L(s, Sym^n π)` for non-CM Hilbert modular forms, and the entireness of `Λ(Sym^n E, s)` for non-CM `E/ℚ`) are stated and proved in ModularityAndLanglandsExtensionsPartII §§13.11–13.13 and 14.6; each of those four sections exists at that roadmap's open head and states what the sentence says. The previous small correction is repaired in the description. There are no small corrections and no format notes; three points carried from the previous review are left for the human reviewers.

## Previous findings

- C01 — repaired: the description now reads "Section numbers 2.30 and 2.52 are not used, and §2.29 is the residual criterion … with no height-density statement", names the two roadmaps that should drop their pointers, and cites SerreModularityByCompatibleSystems, Layers S6–S7.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Scope sentence: further consequences of `SP_n` are in Part II §§13.11–13.13, 14.6 | the four sections at Part II's open head; source statements | §13.11 = NT Hilbert Thm A = 6.5(1), totally real, every place; §13.12 = 6.5(2), CM, RAECSDC non-induced; §13.13 entireness of `L(s,Sym^n π)`, `n≥1`; §14.6 = NT II Cor. B, `n≥2`. Source: newton-thorne-hilbert lines 2355–2369; newton-thorne-II line 47 | all four resolve and match | none |
| "no target here uses them" | every mention of entireness, Thm 6.4/6.5 and Cor. B in this README | Thm 6.4 only at line 427 (the induction's shape, in §1.12) and in the scope; §4.17's entireness bullet is conditional ("if `Sym^nπ_E` exists"); §4.34 uses potential automorphy (§2.39), not `SP_n` | true | none |
| 4.17 completed `Λ(Sym^n E, s)` (sampled; cited by the changed sentence and by Part II §14.6) | `n=0`, `n=1`; shift | `n=0`: `N₀=1`, `γ₀=Γ_ℝ`, so `π^{−s/2}Γ(s/2)ζ(s)`, poles at 0 and 1; `n=1`: `Γ_ℂ(s)=2(2π)^{−s}Γ(s)`, gives `N^{s/2}·2(2π)^{−s}Γ(s)L(E,s)`; Part II uses the same identity `N_n^{s/2}Λ_AL(Sym^nπ_E, s−n/2)` | agrees on both sides | none |
| 4.22 reductions (cited by the changed sentence) | what Part II §§13.11–13.12 take from it | §13.11 takes Thorne §8 (8.1/8.3) all-place and mixed parity "as specified in §4.22"; §13.12 takes CT 7.6; both are stated in §4.22 at this head | consumer's use matches | none |

The rows of the previous review for untouched statements stand as in the previous review, of `123b48a`.

- Source locators checked against the text: 3, in 2 sources (newton-thorne-hilbert Theorems 6.4 and 6.5, lines 2335 and 2355–2369; newton-thorne-II Corollary B, line 47).
- Cross-roadmap citations resolved: ModularityAndLanglandsExtensionsPartII §§12.7, 13.5–13.6, 13.10, 13.11–13.13, 14.1–14.3 and 14.6 at its open head (headings at its README lines 1358, 1641, 1661, 1818, 1845, 1860, 1878, 1923–1964, 2123). It is later in the merge order and is named as a consumer, not a supplier; its sections cite §§1.12, 1.15, 4.15, 4.17, 4.22 here, one direction only.
- Dependency check: `depcheck: 200 roadmaps, 2225 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed at this head. Elaboration of `Suggested.lean`: `sorry` (line 65) the only warning. No change outside the roadmap folder.
- Library declarations: none newly opened; the diff changes no Lean statement.
- Pull request text: read against this head; no sentence contradicted. It says the all-rank proof and its specialisations over ℚ are in the second part and unused here, which the changed sentence extends consistently.
- Overlap check: read ModularityAndLanglandsExtensionsPartII (open; §§13.10–13.13 and 14.6 in full), and, as in the previous review, PotentialAutomorphyInfrastructurePartII, PotentialAutomorphyInfrastructure, PotentialModularityAndCompatibleSystems, LocalLanglandsCorrespondenceForG2 (open), AutomorphicGaloisRepresentationsPartII, EndoscopicTransferAndUnitaryTraceComparison, GL2AutomorphicRepresentationsAndTransfer (main). Shared: `SP_n` for all n and its consequences (Theorem 6.5, holomorphy, entireness of `Λ(Sym^n E, s)`) — owner ModularityAndLanglandsExtensionsPartII; the statement `SP_n`, its cases `n≤5`, the one-prime criterion, the reductions and the definition of `Λ(Sym^n E, s)` — owner this roadmap (§§1.12, 1.15, 4.15, 4.22, 4.17). The other shared objects stand as in the previous review.

Source independence: changed passages only; 1 passage compared with 2 sources (the scope sentence with newton-thorne-hilbert and newton-thorne-II), none copied; no layer added, removed or reordered, so the arrangement was not compared again (previous reviews: largest share blggt-2014-v4, contents independent).

Research link: §4.34 is Sato–Tate for non-CM `E/ℚ` by potential automorphy (Allen et al. 2023, Cor. 7.2.4; Barnet-Lamb–Gee–Geraghty–Taylor 2014); §§4.33, 4.38, 4.42 are Boxer–Calegari–Gee–Newton–Thorne 2025; §§1.12, 4.22 feed Newton–Thorne 2026. Rests on the README's references and the texts read.

## Not verifiable

- Thorne 2024, §8 (Theorem 8.1, Proposition 8.3), which §4.22 and Part II §13.11 cite: not opened; untouched by this change.
- The items of the previous review (Bellaïche–Chenevier; Kaletha–Mínguez–Shin–White; Snowden; Arthur; Atobe–Gan–Ichino–Kaletha–Mínguez–Shin; Xu; Marshall; Harder; Emerton, Nakamura, Hellmann–Schraen; Clozel–Thorne; Geraghty): not opened; untouched by this change.

## Source issues

- none

## For the human reviewers

- Scope: Caraiani–Newton's refereed theorem is not stated here; modularity over imaginary quadratic and CM fields is left to EllipticCurveModularityImaginaryQuadratic §8.6 and its second part §2.5, which rest on a preprint in a public code repository dated 4 October 2026.
- Wording: the statements of §§4.19, 4.22 and 4.33 track their sources' theorem statements clause by clause (bcgnt-2025 lines 2898, 3412; newton-thorne-hilbert line 2127), longest shared run 8 words; treated as forced by the mathematics.
- Reuse: §1.2 (README line 174) says its separation of cofinite Hecke agreement from all-place matching follows the API pattern of the Imperial College London FLT project; no declaration of `Suggested.lean` is taken from it.
