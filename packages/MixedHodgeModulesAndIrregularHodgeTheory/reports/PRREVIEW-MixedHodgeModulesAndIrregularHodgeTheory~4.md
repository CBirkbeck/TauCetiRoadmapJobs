# Review of MixedHodgeModulesAndIrregularHodgeTheory (pull request #2279 at f23e693)

**Verdict:** accepted

No finding. Incremental re-review of the 71 lines changed since `248fdc1` (README only: thirteen `###` headings of Layers 6, 8 and 9 became run-in bold titles with their numbers kept, eight headings were renamed, eight introductory sentences with consumer lists were added), and of the pull request's title and description against this head.

## Deferred findings

- D01 — stands

## Previous findings

- none: the previous report, of `248fdc1`, raised no finding of its own (its R01–R04 bullets recorded repairs of the review before it, and the passages they name are untouched by this change).

## Verified sound

| Statement | Instances tried | Left-side values | Right-side values | Result / change |
|---|---|---|---|---|
| 6.1 introduction: "6.3–6.7, 8.1, 9.4, 9.6 and 10.8 use it" | Reverse index of every `*Needs:*` line citing 6.1 or 6.2 | Claimed: 6.3, 6.4, 6.5, 6.6, 6.7, 8.1, 9.4, 9.6, 10.8 | Computed: 6.1 ← 6.5; 6.2 ← 6.3–6.7, 8.1, 9.4, 9.6, 10.8 | Equal; no change |
| 6.3 introduction: "6.7, 7.1, 7.6, 8.1–8.4, 8.7, 9.2, 9.4 and 9.6 use it" | Reverse index for 6.3, 6.4, 6.5 | Claimed 11 targets | 6.3 ← 6.7, 8.3; 6.4 ← 6.7, 7.6, 8.1, 8.4, 9.4, 9.6; 6.5 ← 7.1, 7.6, 8.1, 8.2, 8.3, 8.7, 9.2 | Union equal; no change |
| 6.6 introduction: classicality exactly when `(FT N)(∗0)` is constant; "7.7, 8.1 and 8.7 use it" | `N = δ_0 ℚ`; `N = δ_a ℚ`, `a ≠ 0`; `N = O` | `FT δ_0 = O`, `O(∗0)` constant of rank 1; `E^{at}(∗0)` not constant; `δ_0(∗0) = 0` | `Π δ_0 ℚ = K = I(ℚ)`; `Π δ_a` not classical (Layer 6 Examples); `Π pℚ = 0`. Consumers: 6.6 ← 8.7; 6.7 ← 7.7, 8.1, 8.7 | Agree with 6.6, 6.7; no change |
| 8.1 introduction: "8.3–8.7, 9.1, 10.1 and 10.3 use it" | Reverse index for 8.1, 8.2; `(G_m, x)`, `(A¹, t)` | `dim H¹_dR(G_m, E^x) = 1`; `H^r_dR(A¹, E^t) = 0` | `ω I(ℚ(−1)) = ℂ`; `Π pℚ_{A¹} = 0`. 8.1 ← 8.3–8.7, 9.1; 8.2 ← 8.3, 8.5, 8.7, 9.1, 10.1, 10.3 | Equal; no change |
| 8.3 introduction: "8.6, 8.8, 10.3, 10.8 and 10.9 use it" | Reverse index for 8.3, 8.4; `(G_m, x)` | Weights: `H¹_c = I(ℚ)` weight 0 ≤ 1, `H¹ = I(ℚ(−1))` weight 2 ≥ 1 | `H¹_mid = 0`, pure of weight 1 vacuously. 8.3 ← 8.6, 8.8, 10.3, 10.9; 8.4 ← 10.8 | Equal; no change |
| 8.5 introduction: "9.1 and 9.2 use the `tg` criterion 8.7" | Reverse index for 8.5–8.8 outside the group; `k = 1` torus sum | `dim H¹_dR(G_m, E^x) = 1` | `1! · vol([0,1]) = 1` (10.6). 8.7 ← 9.1, 9.2; 8.5, 8.6, 8.8 have no consumer outside the group | Equal; no change |
| 9.1 introduction: Fourier cohomology is the costalk at the origin; "9.3 uses it" | `M = pℚ_{A¹}`; `δ_0 V`; `K = j_! pℚ_{G_m}` | `H¹_dR(δ_0) = ℂ`, `H⁰ = 0`; `H⁰_dR(O ⊗ V) = V`; `H⁰_dR = H¹_dR = ℂ` for `O(∗0)` | `i_0^! pℚ = ℚ(−1)[−1]`; `i_0^! δ_0 V = V`; `H⁰ i_0^! K = ℚ`, `H¹ = ℚ(−1)`. 9.2 ← 9.3 only | Equal in every degree; no change |
| 9.3 introduction and renamed heading (seeded sample) | `M = pℚ_{A¹}` smooth at 0, `w = 1`; size-two unipotent block | `H¹(FT M) = ℚ(−1)`, weight 2; `dim gr¹_{F_irr} = 1`; `dim coker N = 1` | `w + 1 = 2`; `rank gr⁰_F M = 1`; generic rank 2 ≠ 1, so smoothness is needed for the rank formula | Agrees with FSY lines 3256–3262; no change |
| 10.6 `twistedDeRham_concentration_finrank` (headline cited by the changed 8.6 Check) | `φ = x`, `n = 1`; `φ = x + x⁻¹`; `n = 0` | `dim H¹ = 1`; `2`; `dim H⁰ = 1` | `1!·vol[0,1] = 1`; `1!·vol[−1,1] = 2`; `0!·vol{0} = 1` | Statement unchanged; elaborates |

The rows for the statements this change does not touch stand as in the previous review, of `248fdc1`.

- Changed passages: all 16 hunks read; the 8 added consumer lists were recomputed from the 67 `*Needs:*` lines and agree item for item; the 7 Layer 6, 8 Layer 8 and 6 Layer 9 entries of the three `### Dependencies` paragraphs still name every number 6.1–6.7, 8.1–8.8, 9.1–9.6.
- Numbering: no number moved; the former-numbering map rows `E`, `C`, `P`, `G`, `T` still point at existing numbers. Remark: 6.2, 6.4, 6.5, 6.7, 8.2, 8.4, 8.6–8.8, 9.2, 9.4–9.6 are now run-in bold titles, not headings; KloostermanMomentsAndPotentialAutomorphy's citations of §§6.2, 6.4–6.5, 6.7, 8.4, 8.7, 8.8, 9.4–9.6 resolve at this head (citation resolver: 0 unresolved).
- Source locators checked in the three sampled sections whose headings changed: 7 — KS lines 1109 (Definition 7, p. 31), 1278 and 1281 (Proposition 4, Lemma 1, p. 36); FSY lines 2996, 3003, 3019 (§A.5, Example A.15, Definition A.18, p. 66) and 3256–3262 (Corollary A.31, p. 72). The other sampled targets lie outside the change.
- Pull request text against the head: title, the `roadmap-summary` block and the prose read sentence by sentence — ten layers and their contents, the one stated headline (10.6), the six gap slugs and their four suppliers, the three files, one `sorry` warning, 0 paths outside the folder: 0 contradictions, nothing a reader must know left unstated (the folder is new; no section number, declaration or supplier was removed).
- Gate at `f23e693`: every scanner 0, `OK`. Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/MixedHodgeModulesAndIrregularHodgeTheory/Suggested.lean`: one warning, `declaration uses sorry` at line 146; the file is unchanged since `248fdc1`, so the 13 signatures and the padding probe stand.
- Overlap check: read KloostermanMomentsAndPotentialAutomorphy, LefschetzPencilsAndVanishingCycles, EtaleDualityAndPerverseSheaves, KloostermanSheavesAndBesselIsocrystals, MappingClassGroupsAndCanonicalRepresentations, EtaleCohomologyFoundations; the change moves no object: Kloosterman connections and their numerics stay with KloostermanMomentsAndPotentialAutomorphy, monodromy filtrations with LefschetzPencilsAndVanishingCycles, the exponential structures, `Π` and pair cohomology here. No open pull request changes this folder; no cited id is dropped.
- Source independence: changed passages only — 8 added sentences and 8 renamed headings compared with 3 sources (KS, FSY, MT) at the locators of their sections, none shared (the sentences are consumer lists and summaries of this README's own targets); largest share FSY, as in the previous review; no layer added, removed or reordered, so the contents comparison with FSY stands.

## Not verifiable

- SZ Theorem 4.20 (cited in 5.6, untouched) is recorded uncertified; its text was not read.

## Source issues

- none

## For the human reviewers

- Licence: `packages/MixedHodgeModulesAndIrregularHodgeTheory/sources.toml` records Sai88, Sai90, Kash86 and AS with `licence_class = "answered-by:CBirkbeck"`; AS is hosted by Cambridge. Their legal status rests on the operator's answer.
- Licence: FSY cites for Theorem A.24 a work listed as "in preparation" (FSY line 3317); the roadmap does not cite it.
- Scope: nothing to flag; the main sources are refereed papers or the arXiv versions of refereed papers.
