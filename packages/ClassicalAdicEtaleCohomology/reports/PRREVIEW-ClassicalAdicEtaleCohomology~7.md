# Review of ClassicalAdicEtaleCohomology (pull request #875 at 4b7a299)

**Verdict:** needs changes

## R01 (P3) — The consumer sentence names the wrong object of Section 5.4

**Location:** `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md` line 5833: "`DeligneWeightsAndPurityPartII` uses the valuation nearby cycles of Sections 4.5, 5.2 and 5.4".

**Claim:** What `DeligneWeightsAndPurityPartII` takes from Section 5.4 is the general-base theory (oriented products, the stalk formula, the plurinodal alteration theorem, the uniform amplitude bound), which Section 5.4 itself distinguishes from the valuation statement. Only Sections 4.5 and 5.2 are used for valuation nearby cycles.

**Witness:** `DeligneWeightsAndPurityPartII` README at its open head, line 627: "the general-base nearby-cycle functor of ClassicalAdicEtaleCohomology §5.4"; line 666: "§5.4 (oriented products, the nearby-cycle stalk formula, the plurinodal alteration theorem, the uniform amplitude bound)". All 8 of its §5.4 citations are of this kind.

**Repair:** "`DeligneWeightsAndPurityPartII` uses the valuation nearby cycles of Sections 4.5 and 5.2 and the general-base nearby cycles of Section 5.4, with its oriented products, stalk formula, plurinodal alteration theorem and uniform amplitude bound, and `VStackSheavesAndLisseCategories` uses …" (the rest of the sentence unchanged).

## Previous findings

- R01 — repaired: the description now reads "The analytic étale and pro-étale sites, their geometric points and strict localizations are taken from AdicEtaleGeometry (layers A1, A2 and A4). On them the roadmap builds …" and lists Layers 1–11.
- R02 — repaired: the supplier paragraph now has "LPV.6 §6.2", CrystallineCohomology (CR.5.1 and CR.6.1), ResolutionOfSingularitiesCharacteristicZero (§5.6), AdicSpaces, AlgebraicCurves (layer 12), JacobianChallenge (layer B), EllipticCurves (layer 4), StableReduction (layers 1–3), ProfiniteCohomology (Layers 9 and 11).
- R03 — repaired: "The README names DiamondEtaleCohomology, DiamondSixOperations, DeligneWeightsAndPurityPartII, VStackSheavesAndLisseCategories, TropicalAndBerkovichArithmetic and PadicHodgeTheory (P8) as consumers"; the README names each (5831, 5833, 382) and no longer names `GeneralBasesFourierAndCorrespondences`. The repair's Section 5.4 wording is R01 above.

## Verified sound

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 5831: `DiamondEtaleCohomology` uses §§2.1–2.5, 6.1–6.3, 3.1, Layer 7, 10.1–10.4, 11.2 | that roadmap's citations at its open head | its supplier row (line 19): "§§2.1–2.5, 3.1, 6.1–6.3, 7.1–7.3, 10.1–10.4 and 11.2"; 20 citations, none outside this list | agrees |
| 5833: `DeligneWeightsAndPurityPartII` uses §§4.5, 5.2, 5.4 | its citations at its open head | §§4.5, 5.2: 3 citations (with 8.3–8.4), valuation/microbial; §5.4: 8 citations, all general-base (oriented product, plurinodal, amplitude) | sections right, object of 5.4 wrong (R01) |
| 5833: `VStackSheavesAndLisseCategories` uses §5.6 | its citations at its open head; README 3351, 3361 | 6 citations of §5.6, "universal local acyclicity and relative correspondence duality"; 5.6 has targets of exactly these two names | agrees |
| 11.2 `field_cohomological_dimension_transcendence` (cited by the changed sentence) | `K = 𝔽_q, L = 𝔽_q(t), ℓ ≠ p`; `K = ℂ, L = ℂ(x, y)`; `K = 𝔽_p, L = 𝔽_p(t), ℓ = p`; `L/K` algebraic; `K = ℝ, ℓ = 2` | `2 ≤ 1 + 1`; `2 ≤ 0 + 2`; `1 ≤ 1 + 1`; `cd L ≤ cd K + 0` (closed subgroup); right side `⊤` | holds; sharp in the first two |

The rows for untouched statements stand as in the previous review, of `fc1c03a`.

- **Gate and direction.** Gate at 4b7a299: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's run with the build has `build=0`. `--movable` depcheck: `depcheck: 245 roadmaps, 2218 edges, 0 problem(s)`, no UPWARD or CYCLE line. No file changed outside the folder.
- **Elaboration.** `lake env lean` on `Suggested.lean` (8 s): exactly four `sorry` warnings, at lines 78, 96, 114, 125. No Lean statement changed; the 5 elaborated signatures keep every binder.
- **Changed passages.** 2 sentences (README 5831, 5833), each checked against the named consumer at its open head: `DiamondEtaleCohomology` (20 citations), `DeligneWeightsAndPurityPartII` (40), `VStackSheavesAndLisseCategories` (10). The sections they name exist at this head (2.1–2.5, 3.1, 4.5, 5.2, 5.4, 5.6, 6.1–6.3, 7.1–7.3, 10.1–10.4, 11.2). The seeded sample falls in no changed passage.
- **Pull request text.** Title, the 3 summary paragraphs and the 3 prose paragraphs checked against the head: the 11 layer descriptions match the layer headings; the 4 headline theorems are at README 1120, 4581, 4589, 5698 and in `Suggested.lean`; the 18 suppliers "on main" are on main (3 under `Completed/`), with the cited layers present in the README; the 4 open suppliers precede this roadmap in the merge order (25, 58, 62, 70 against 76); the 6 consumers are named at README 382, 5831, 5833. No sentence is contradicted.
- **Overlap check:** read DiamondEtaleCohomology, DeligneWeightsAndPurityPartII, EtaleCohomologyFoundations (open) and AdicEtaleGeometry (main); nothing shared. The three consumers cite Sections 2–11 here and restate none; the sites stay with AdicEtaleGeometry A1.
- **Source independence:** changed passages only. 2 sentences compared with 0 sources (they cite roadmaps, not texts), none shared. Largest share Huber (1996), about 178 of 1052 locators; contents not re-compared, since no layer was added, removed or reordered.
- **Remark (untouched text).** README 38 and 2519 give LPV §0.8a as "Nearby-cycle and inertia comparison" and §2.8 as "complex Milnor fibres"; at LPV's head the headings are "Nearby-cycle and Betti comparison" and "The Picard–Lefschetz formula for a proper family".

## Not verifiable

- Huber (1996), the book: paywalled, no local text; its locators are cited by locator alone, as in the previous review.
- Berkovich 1990 (Section 3.7) and Prestel 1986 (Section 9.2): no legal text.

## Source issues

- none

## For the human reviewers

- **Not tested:** Huber (1996), the source with the largest share of locators (about 178 of 1052), is paywalled with no local text. The roadmap's wording and its arrangement were not compared against it in this round (2 changed sentences, neither citing it).
