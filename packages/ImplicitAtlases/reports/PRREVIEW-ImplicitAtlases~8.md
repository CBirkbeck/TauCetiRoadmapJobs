# Review of ImplicitAtlases (pull request #974 at 8352e53)

**Verdict:** accepted

🤖 Independent AI review, incremental: 17 changed lines in the folder since `d4d479c` (the invariance-of-domain supplier moved from a roadmap citation to the Tau Ceti pin), plus the pull request's title and description read against this head. No finding. This review changes no pull-request file.

## Previous findings

- R01 — repaired: "`IsOpen.image_of_continuousOn_of_injOn` and `Topology.IsOpenEmbedding.finrank_le_of_isEmbedding` (TauCeti/AlgebraicTopology/Singular/InvarianceOfDomain.lean) … Used in §6.2"; the AbelianSchemesAndArithmeticModuliPartII subsection and every §B2.9 citation are gone; description: "Every roadmap supplier is on main."

## Deferred findings

- D01 — stands

## Verified sound

**The changed passages.** `README.md:24`, `:68`, `:710`, `:722`, `:774` and `Suggested.lean:37–38` read against the pin (Tau Ceti `2fd255d`). `README.md:68` states both declarations with their hypotheses as the pin has them: the variable block at `InvarianceOfDomain.lean:151–153` has `ChartedSpace E M`, `ChartedSpace F N`, `FiniteDimensional` on both models and no `T2Space` or countability instance; `:160–162` takes `IsOpen U`, `ContinuousOn f U`, `InjOn f U`, `finrank ℝ E = finrank ℝ F`; `:272–273` takes `[Nonempty X]`, an open embedding into F and an embedding into E. The repair cites `finrank_le_of_isEmbedding` where the previous report proposed `Continuous.isOpenEmbedding_of_injective`: the first is what the dimension bound of §6.2 needs (pardon2016 lines 2007–2009 use exactly "m ≤ n, with equality iff open"), and the second is the first declaration with U the whole space, so nothing is lost. "Manifolds with boundary are not covered" is correct, and `README.md:24` keeps the boundary consequences (the doubling step of pardon2016 line 2012) as Layer 6's own work. No mention of AbelianSchemesAndArithmeticModuliPartII remains in the folder.

**The description against the head.** Title: the folder is not on main and is added (914 insertions, 3 files: `README.md`, `Suggested.lean`, `metadata.toml`). Summary block and prose read sentence by sentence against `README.md:3`, `:19–26`, `:60–92`, `:861–863` and `Suggested.lean:8–38`: the four roadmap suppliers and their sections agree with `README.md:70–92`; "Every roadmap supplier is on main" agrees with the supplier contracts; "invariance of domain and of dimension (`IsOpen.image_of_continuousOn_of_injOn`, `Topology.IsOpenEmbedding.finrank_le_of_isEmbedding`), used in §6.2" agrees with `README.md:68` and `:722`; the consumers and the fiber-product sentence agree with `README.md:863`; "`Suggested.lean` declares nothing" agrees with the empty namespace. No sentence is contradicted and no change of the pull request is left unstated.
- Remark, no change asked of the author: the generated `depends-on` and `merge-order` blocks still list #1405 (AbelianSchemesAndArithmeticModuliPartII), which the README no longer cites; they are tool output and regenerate.

**Adversarial calculations.** The diff changes no statement of this roadmap; the rows are for the two library statements the changed text cites and the §6.2 consequences that consume them.

| Statement | Instances | Values computed | Result; change |
| --- | --- | --- | --- |
| `IsOpen.image_of_continuousOn_of_injOn` as restated at `README.md:68` | m = 0; ℝ → ℝ², t ↦ (t, 0); [0, ∞) ↪ ℝ; t ↦ t² on U = ℝ | m = 0: finrank 0 = 0, point ↦ open point. ℝ → ℝ²: image not open, excluded by 1 ≠ 2. Half-line: not `ChartedSpace ℝ`. t²: image [0, ∞) not open, excluded by `InjOn` | Agrees with the pin; none. |
| `Topology.IsOpenEmbedding.finrank_le_of_isEmbedding` as restated at `README.md:68` | X = pt, F = ℝ⁰, E = ℝⁿ; X = ℝ, F = ℝ, E = ℝ⁰; X = ∅, F = ℝ⁵, E = ℝ⁰ | pt: 0 ≤ n holds. ℝ → ℝ⁰ is no embedding, so 1 ≤ 0 is not claimed. ∅: both maps exist and 5 ≤ 0 fails; "nonempty" in the README excludes it | Agrees with the pin, direction F ≤ E correct; none. |
| §6.2 local consequences (Pardon, Lemma 6.1.5 (ii), (iii)) from the two declarations | [0, 1] with {0} < (0, 1) > {1}; quadrant ℝ_≥0² | interior stratum (0,1): dim 1 = 1, open in the interior. Point strata: 0 ≤ 1, not open, as equality fails. Quadrant open face: 2 = 2, open; edges 1 ≤ 2; origin 0 ≤ 2 | Dimension bound uses `finrank_le`, openness uses the image theorem; none. |

Rows for all other statements stand as in the previous review, of `d4d479c`.

- Gate, re-run at this head with `--base origin/main`: every check 0, `OK`; the worker's gate adds `build=0`.
- Dependency check with `--movable`: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line (two edges fewer than at `d4d479c`: the dropped supplier).
- Elaboration: `lake env lean` on `TauCetiRoadmap/ImplicitAtlases/Suggested.lean`, exit 0, no output. No declaration: no `#check` comparison, no one-tactic probe, no padding.
- Library declarations opened at the pin: 4 (`TauCeti/AlgebraicTopology/Singular/InvarianceOfDomain.lean:160`, `:201`, `:272`, `:295`, with the variable blocks at `:151–153` and `:266`).
- Source locators checked against the text: 1 in the changed passage (Lemma 6.1.5, p. 47: pardon2016 lines 1998–2020, page marker at line 1979), correct; the five consequences listed at `README.md:710` are its items (ii)–(v).
- Cross-roadmap citations: the changed passages cite none; the four suppliers on main are unchanged; `scratch/citations.md` lists nothing found nowhere. Files changed outside the folder: none.
- Overlap facts (`scratch/overlaps.md`): no other open pull request changes this roadmap, no dropped id, no id only an open revision defines, no second copy on main.

Overlap check: read TopologicalSheafCohomology, SymplecticFieldTheory, Orbifolds (main) and GromovWittenTheory, AnalyticStableMaps, AlgebraicTopologyPartII (open) as in the previous review; the open-cover Čech colimit is shared with TopologicalSheafCohomology and its owner is Tau Ceti's `TauCeti.Topology.cechCohomology` with TS1.2 for the extensions; invariance of domain and of dimension are owned by Tau Ceti and now cited there; nothing else shared.

Source independence: changed passages only; 2 passages compared with 1 source (`README.md:68` and `README.md:710` with pardon2016 lines 1998–2020), none shared, longest common run 3 words ("invariance of domain", the theorem's name); largest share pardon2016, 95 of 97 locators; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- The general proofs of §6.5 and §7.3 are constructions of this roadmap; the small-instance values of earlier reviews test their conventions, not the proofs.
- "Closes #972" and the authorship line of the description are outside what the head shows.

## Source issues

- none

## For the human reviewers

- **Scope.** Two headlines are stated by no refereed source: the product formula of §6.5 and the fiber-product identity of §7.3. `README.md:778` says both are this roadmap's constructions; Pardon (§5 introduction, p. 40) names the second as wanted and unproved.
- **Not tested.** The arrangement was not compared with pardon2016's table of contents in this round (incremental, no layer changed).
