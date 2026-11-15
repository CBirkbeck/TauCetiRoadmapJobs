# Review of ImplicitAtlases (pull request #974 at d4d479c)

**Verdict:** needs changes

🤖 Independent AI review, incremental: 4 changed lines in the folder since `81fc759` (the Summary's attribution sentence and the opening paragraph of Layer 7), plus the pull request's title and description read against the head. The changed passages and the rewritten description are correct as written. The one finding is a supplier citation that an open pull request changed under this roadmap after the previous review; it is raised here, although the README lines are untouched, because the cited section was present when the review of `81fc759` read it and is gone now, and because the description names it as the pull request's only open dependency. This review changes no pull-request file.

## R01 (P3) — §B2.9 no longer exists at the supplier's open head; invariance of domain is at the Tau Ceti pin

**Location:** `TauCetiRoadmap/ImplicitAtlases/README.md:24`, `:93–95` ("### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuliPartII — §B2.9: … Used in §6.2"), `:713`, `:725`, `:777`; `Suggested.lean:37–38`; description: "One supplier is an open roadmap pull request that merges first: AbelianSchemesAndArithmeticModuliPartII §B2.9".

**Claim:** AbelianSchemesAndArithmeticModuliPartII §B2.9 states invariance of domain, so this roadmap must merge after that open pull request.

**Witness:** That roadmap's open head `6684834`: headings go B2.8 (`README.md:1553`) to B2.10 (`:1565`); `:51–54` says invariance of domain "is already in Tau Ceti" and B2.9 citations resolve to it. At this pull request's pin: `TauCeti/AlgebraicTopology/Singular/InvarianceOfDomain.lean:160`, `:201`.

**Repair:** Cite the pin and drop the roadmap supplier.
- Delete the subsection `### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuliPartII` and the scope bullet at `README.md:24`. Add under `### From Tau Ceti (commit 2fd255d)`: "`IsOpen.image_of_continuousOn_of_injOn` and `Continuous.isOpenEmbedding_of_injective` (TauCeti/AlgebraicTopology/Singular/InvarianceOfDomain.lean): for spaces M, N charted on finite-dimensional real normed spaces E, F with `finrank ℝ E = finrank ℝ F`, the image of an open set under a map continuous and injective on it is open, and a continuous injection M → N is an open embedding. Dimension 0 is included; manifolds with boundary are not. Used in §6.2."
- `:713`: "From invariance of domain (Tau Ceti `Continuous.isOpenEmbedding_of_injective`) derive …"; `:725`: "*Needs:* §6.1, §3.1; Tau Ceti `IsOpen.image_of_continuousOn_of_injOn`, `Continuous.isOpenEmbedding_of_injective`."; `:777`: "Layers 0–5; AlgebraicTopology Layer 6; Tau Ceti's invariance of domain."
- `Suggested.lean:37–38`: "Invariance of domain, which Layer V6.2 uses, is Tau Ceti's `Continuous.isOpenEmbedding_of_injective` and is not a headline of this roadmap."
- Description: replace the sentence by "Every roadmap supplier is on main." and add the two declarations to the "At the pins" sentence; the `depends-on` and `merge-order` blocks then regenerate without #1405.

## Previous findings

- R01 — repaired: "`Suggested.lean` declares nothing: no headline theorem is statable at the pinned Mathlib and Tau Ceti. Its module docstring names each headline … and the carriers each one lacks." Agrees with `Suggested.lean:8–10` and its empty namespace.
- R02 — repaired: "Suppliers on main: TopologicalSheafCohomology (TS1.1, TS1.2, §1.4), AlgebraicTopology (Layers 2, 3 and 6, §5.1), CharacteristicClasses (§C1.2b, §C2 items 1, 3 and 4) and DGAInfinity (Layer 0). One supplier is an open roadmap pull request …" Matches `README.md:69–95`; its last sentence is now R01 above.

## Deferred findings

- D01 — stands

## Verified sound

**The changed passages.** `README.md:3` "implicit atlases and the algebraic construction of virtual fundamental cycles from them are due to Pardon": pardon2016 line 14 (the abstract introduces the notion). `README.md:781`, each locator read at the text: Proposition 4.4.2 is stated on p. 39 and its proof ends on p. 40 (pardon2016 lines 1646–1689); Lemmas 5.2.1 (subatlas), 5.2.2 (shrinking), 5.2.3 (disjoint union), 5.2.4 (boundary) are on p. 42 and 5.2.5 (pushforward annihilates the boundary class) on p. 43 (lines 1759–1805); Definition 6.3.1 runs pp. 50–51 and Definition 6.3.2 on p. 51 states a product map compatible with the obstruction-chain map (4.2.12) and the stabilisation map (4.2.14) and associative (lines 2151–2174), which is what "associative, trace-compatible" says; §6.3 ends there with no external product on Čech cohomology and no product formula for the class, so "constructions of this roadmap" is right for §6.5; the §5 introduction, p. 40, names the fiber-product formula as wanted and unproved (lines 1698–1702). The paragraph agrees with the locators already at `README.md:599`, `:613`, `:628`, `:743`.

**The description against the head.** Title: the folder is not on main and is added (917 insertions, 3 files). Summary block and prose read sentence by sentence: "The Čech external product with the product formula (§6.5) and the fiber-product identity (§7.3) go beyond the source's proved results: Pardon constructs the product atlas and its chain map" agrees with `README.md:781`; the suppliers on main and their sections agree with `README.md:69–91`; the Tau Ceti carrier and "the singular-chain, Eilenberg–Zilber and Koszul-sign declarations" agree with `README.md:62–67`; the `Suggested.lean` paragraph agrees with the file. The only sentence that fails is the one in R01.

**Adversarial calculations.** The diff changes no statement; the rows are for statements the changed paragraph cites and for the one R01 touches.

| Statement | Instances | Values computed | Result; change |
| --- | --- | --- | --- |
| §5.2 boundary law and pushforward (cited at `:781` as Lemmas 5.2.4–5.2.5) | X = [0,1], regular, d = 1, outward-first | ∂[X] = (+1 at 1, −1 at 0); pushforward to Čech⁰(X)∨ on the class 1: +1 − 1 = 0; with inward-first both signs flip, sum still 0, but ∂[X] = −[∂X] | Retain; the sign is fixed by 5.2.4, not by 5.2.5. |
| §5.3 disjoint union (Lemma 5.2.3) | X = pt, Y = pt with Γ = ℤ/2, d = 0 | Čech⁰(X ⊔ Y; ℚ) = ℚ²; Φ(a, b) = a + b/2 = Φ_X(a) + Φ_Y(b); a functional weighting by the total group order would give (a + b)/2 | Retain. |
| §6.4 product map, "associative, trace-compatible" (Definitions 6.3.1–6.3.2) | (pt, ℤ/2)², (pt, ℤ/2)³ | orders 4 and 8; classes 1/4 = ½·½ and 1/8 = (½·½)·½ = ½·(½·½); obstruction ranks add, m = m₁ + m₂, so the trace generator of E₁ ⊕ E₂ is the product of generators | Retain. |
| Invariance of domain as consumed in §6.2 (R01), against the pinned `Continuous.isOpenEmbedding_of_injective` | m = 0; ℝ → ℝ², t ↦ (t, 0); [0, ∞) ↪ ℝ | m = 0: `finrank` 0 = 0, a point maps onto an open point. ℝ → ℝ²: image not open, excluded by 1 ≠ 2. Half-line: image not open, excluded since `ChartedSpace E M` has no boundary | The pin covers both sentences of `README.md:95`; cite it (R01). |

Rows for all other statements stand as in the previous review, of `81fc759`.

- Gate, re-run at this head with `--base origin/main`: every check 0, `OK`; the worker's gate adds `build=0`.
- Dependency check with `--movable`: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. ImplicitAtlases is at `ORDER.txt:220`.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ImplicitAtlases/Suggested.lean`, exit 0, no output. No declaration: no `#check` comparison, no one-tactic probe, no padding.
- Source locators checked against the text: 5 (Proposition 4.4.2; Lemmas 5.2.1–5.2.5; Definitions 6.3.1–6.3.2; §5 introduction; the abstract for the Summary's attribution), all correct.
- Library declarations opened at the pin: 2 (`TauCeti/AlgebraicTopology/Singular/InvarianceOfDomain.lean:160`, `:201`, with the variable block at `:151–153`).
- Cross-roadmap citations: the four suppliers on main are present on main; `scratch/citations.md` lists nothing found nowhere; AbelianSchemesAndArithmeticModuliPartII §B2.9 is R01. Files changed outside the folder: none.
- Overlap facts (`scratch/overlaps.md`): no other open pull request changes this roadmap, no second copy on main; the tool lists no dropped id because the supplier maps B2.9 to Tau Ceti, which is the fact R01 acts on.

Overlap check: read TopologicalSheafCohomology, SymplecticFieldTheory, Orbifolds (main) and GromovWittenTheory, AnalyticStableMaps, AlgebraicTopologyPartII (open) as in the previous review; the open-cover Čech colimit is shared with TopologicalSheafCohomology and its owner is Tau Ceti's `TauCeti.Topology.cechCohomology` with TS1.2 for the extensions; invariance of domain is owned by Tau Ceti (R01); nothing else shared.

Source independence: changed passages only; 3 passages compared with 1 source (`README.md:3` with pardon2016 lines 14–20; `README.md:781` with lines 1690–1702 and with lines 2150–2174), none shared, longest common run 3 words ("product implicit atlas" is the source's term, the README writes "product atlas"); largest share pardon2016, 95 of 97 locators (the 92 of 94 of the previous review and the 3 the change adds); contents not compared again (no layer added, removed or reordered).

## Not verifiable

- The general proofs of §6.5 and §7.3 are constructions of this roadmap; the small-instance values test their conventions, not the proofs.
- "Closes #972" and the authorship line of the description are outside what the head shows.

## Source issues

- **Misprint** in pardon2016 at Definition 6.3.1, p. 50: the source writes the regular locus of the product chart with a factor named Y₂; it should be X₂, as in the line before; affects nothing.
- **Misprint** in pardon2016 at Lemma 5.2.5, p. 43: the source writes the domain of the pushforward as the dual of a group decorated "vir" on Čech cohomology of ∂X; it should be the dual of Čech cohomology of ∂X with coefficients in its orientation sheaf; affects nothing.

## For the human reviewers

- **Scope.** Two headlines are stated by no refereed source: the product formula of §6.5 and the fiber-product identity of §7.3. `README.md:781` says both are this roadmap's constructions; Pardon (§5 introduction, p. 40) names the second as wanted and unproved.
- **Not tested.** The arrangement was not compared with pardon2016's table of contents in this round (incremental, no layer changed).
