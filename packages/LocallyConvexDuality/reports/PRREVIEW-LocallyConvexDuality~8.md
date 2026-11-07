# Review of LocallyConvexDuality (pull request #1782 at 7bdf7f3)

**Verdict:** accepted

This is an incremental re-review of the 42 lines changed since 714da0c (21 insertions, 21 deletions, all in `TauCetiRoadmap/LocallyConvexDuality/README.md`; `Suggested.lean` is byte-identical to the file read at 32064cd). Both findings of the previous review are repaired, and the repairs introduce no new problem. No finding remains, new or carried.

## Previous findings

- R01 — repaired: §5.4 (lines 631–635) now reads "(Grothendieck 1952, Ch. II, no. 3, the remark after Théorème 3, p. 102, with the remark closing Ch. I, no. 7, p. 87; Pietsch 1972, Chapter 5)". grothendieck1952 lines 1160–1183 (marker page 31, printed p. 102) are Ch. II, no. 3, Théorème 3 and the remark that assertions 2° and 5° can be proved from criterion (c), a fundamental family of equicontinuous sets with Hilbert `E′_A`, and the remark closing Ch. I, no. 7; lines 580–588 (marker page 16, printed p. 87) are that remark: restricting the codomain of a nuclear map to a complemented, for instance Hilbert, subspace keeps it nuclear.
- R02 — repaired: the three "Not a target" paragraphs are gone (`grep "Not a target"` on the README is empty). The 0.2 remark is now a Layer 0 `### Examples` bullet (lines 207–213) with the hypothesis "barrelled locally convex" and citations of Mathlib `SchauderBasis.exists_norm_proj_le` and Tau Ceti `SchauderBasis.hasBoundedApproximationProperty`; the 2.3 remark is a Layer 2 `### Examples` bullet (lines 397–399) on Mathlib's `TestFunction.topologicalSpace`; the three-space remark is in the "not in this roadmap" sentence of Scope and ownership (lines 54–58).

## Verified sound

**Gate, dependency check, elaboration.**

- The worker's gate at 7bdf7f3 passed every check (`build=0`, `depcheck=0`, `statement-hygiene=0`, `readme-ids-missing=0`, `outside-folder=0`).
- I reran the full gate with `--base origin/main`: every check is 0 except `depcheck: NOT IN ORDER: LocallyConvexDuality (insert it after its last supplier)`, which comes from the configured order not listing this roadmap yet; under the brief that is not a finding.
- The dependency check with the candidate merge order:

  ```
  depcheck: 240 roadmaps, 2431 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line. In the candidate order AutomorphicSpectralTheory is line 88, SpectralManifolds line 231, LocallyConvexDuality line 232.
- `git diff --stat origin/main...HEAD` outside the folder is empty; `git diff 714da0c5..HEAD --stat` is the README only.
- `lake env lean` on `Suggested.lean` exited 0 with exactly thirteen `declaration uses 'sorry'` warnings (lines 73, 100, 108, 118, 152, 160, 167, 183, 193, 220, 228, 236, 243) and nothing else. The worker's signature listing is unchanged from the previous round; its one "looks dropped `[TopologicalSpace E]`" lead on `barrelledSpace_of_bornologicalSpace` is false, as before: that theorem binds `[UniformSpace E] [IsUniformAddGroup E]` itself and its elaborated type carries `[CompleteSpace E] [PolynormableSpace 𝕜 E] [T2Space E]`. The three "found nowhere" Lean names of the citation leads (`DFSpace.continuous_of_continuousOn`, `DFSpace.completeSpace_strongDual`, `DFSpace.firstCountableTopology_strongDual`) are declared at `Suggested.lean` lines 228, 236 and 243.
- Headline list, one-tactic probes and the "not statable" docstring entries for 5.1–5.4: unchanged, carried forward from the reviews of 32064cd and fb54a01.

**Pinned declarations cited by the new text** (file and line at the pins).

| Citation (README line) | At the pin | Hypotheses it carries |
|---|---|---|
| `SchauderBasis.exists_norm_proj_le` (210) | `Mathlib/Analysis/Normed/Module/Bases.lean`:319 | `[NormedAddCommGroup X] [NormedSpace 𝕜 X] [CompleteSpace X]`, `b : SchauderBasis 𝕜 X`: a uniform bound on `‖b.proj n‖` |
| `SchauderBasis.hasBoundedApproximationProperty` (211) | `TauCeti/Analysis/Normed/Module/Bases/Approximation.lean`:64 | `[CompleteSpace E]`, `b : SchauderBasis 𝕜 E` |
| `TestFunction.topologicalSpace` (397) | `Mathlib/Analysis/Distribution/TestFunction.lean`:274 | over `ℝ`, `F` a real normed space, `Ω : Opens E`; the finest locally convex topology coarser than the inductive-limit topology of the `𝓓_K`, with `IsTopologicalAddGroup`, `ContinuousSMul ℝ`, `LocallyConvexSpace ℝ` instances at lines 280–293 |

So "the Banach case" (completeness is the only extra hypothesis) and "an (LF) space" (the locally convex inductive limit over the compacts of `Ω`, cofinally a strict sequence of Fréchet spaces for `n = ⊤`) describe these declarations correctly; Mathlib does not state barrelledness of `𝓓(Ω, F)`, which the example derives from 1.5 (README lines 290–292 state the (LF) case).

**Sources for the changed passages** (printed page = marker page + offset: bourbaki1950 + 3, ds1949 + 59, grothendieck1952 + 71).

| Target | Locator at this head | Source lines | Result |
|---|---|---|---|
| 5.4 route, subspace clause | G1952 Ch. II, no. 3, remark after Théorème 3, p. 102 | grothendieck1952 1160–1161 (no. 3 begins), 1165–1174 (Théorème 3, marker page 31 = p. 102), 1175–1183 (the remark) | correct |
| 5.4 route, the Hilbert restriction step | G1952 remark closing Ch. I, no. 7, p. 87 | grothendieck1952 580–588 (marker page 16 = p. 87; no. 8 begins at 589) | correct |
| 5.4 statement | G1952 Ch. II, Théorème 3, p. 102 | grothendieck1952 1165–1174 | correct, unchanged |
| Layer 0 example (0.2 applied) | Bourbaki 1950 Théorème 1 and Corollaire 2, p. 7 | bourbaki1950 94–96, 105–109 (marker page 4 = p. 7): a countable-basis filter of continuous linear maps from a barrelled `E` to a separated locally convex `F`, converging pointwise, converges uniformly on precompact sets | correct; the example now states "locally convex" for `E`, which the codomain needs |
| Layer 2 example, (LF) is barrelled | 1.5, from Bourbaki 1950 §2, p. 6 | bourbaki1950 75–76 (marker page 3 = p. 6) | correct |
| Layer 2 example, Mackey topology of 𝒟 | D–S 1949, n° 7, Théorème 3 and Corollaire, p. 76 | ds1949 621–634 (marker page 17 = p. 76) | correct |
| Scope, three-space property | Dierolf–Roelcke 1981, Proposition 3.8; Wengenroth 2003 | not readable (below) | not verifiable; an exclusion, not a claim the roadmap proves |

The remaining seeded targets (0.1, 0.3, 1.1–1.5, 2.1, 2.2, 2.4, 3.2–3.4, 4.2, 4.3, 4.5, 5.2, 5.3) are untouched by the diff; their locators carry forward from the tables of the previous reviews.

**Adversarial table.** Rows with computed values for the changed statements; untouched statements cite the previous reports.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Layer 0 example: partial-sum projections in a barrelled locally convex space with a Schauder basis are equicontinuous and converge uniformly on precompact sets | `ℓ²`, unit-vector basis; `K = {eₙ/n} ∪ {0}`; the unit ball | `P_N x → x` for every `x`, so `{P_N}` is pointwise bounded and 0.2 gives equicontinuity; `‖P_N‖ = 1`; on `K`, `x − P_N x = 0` for `n ≤ N` and `‖eₙ/n‖ = 1/n ≤ 1/(N+1)` for `n > N`, so `sup_K = 1/(N+1) → 0`; on the unit ball `‖e_{N+1} − P_N e_{N+1}‖ = ‖e_{N+1}‖ = 1` for every `N`. Negative control: `c₀₀` (not barrelled) with the unit vectors, where `fₙ(x) = n xₙ` shows pointwise bounded ≠ equicontinuous (0.2 Checks), so barrelledness is used. | true; the three values in the bullet are as computed; "precompact, not bounded" is sharp | none |
| Layer 2 example: `𝒟(Ω, F)` is (LF), barrelled, bornological, and carries `τ(𝒟, 𝒟′)` | `Ω = (0,1)`, `F = ℝ`, `𝒟 = ⋃ 𝒟_{[1/m, 1−1/m]}` | each `𝒟_K` is Fréchet (seminorms `sup \|φ^{(j)}\|`, `j ≤ k`), the inclusions are closed embeddings, so the limit is strict (LF); 1.5 gives barrelled and bornological, 2.3 gives `τ`. Not metrizable (Baire along the strictly increasing sequence), so 1.2 does not apply and the route through 1.5 is the one needed. Mathlib's topology is the limit over all compact `K ⊆ Ω`; the sequence `[1/m, 1−1/m]` is cofinal, so the two agree. | true | none |
| Scope: three-space property of nuclearity excluded | `0 → 𝕜^ℕ → E → s → 0` | the roadmap proves nothing about such `E`; 5.4's clauses (subspaces, quotients, products, sums, `⊗̂π`, duals) never pass through an extension. Consistent with the exclusion. | consistent | none |
| 5.4 subspace route | `E = s`, Hilbertian `p_k(x) = (Σ n^{2k}\|xₙ\|²)^{1/2}`, `M = c₀₀` (dense) or a closed subspace | `Ê_{p_{k+2}} → Ê_{p_k}` is diag(`1/n²`), nuclear norm `π²/6`; restricting to `M̂_{p_{k+2}}` and projecting orthogonally onto `M̂_{p_k}` (the step of grothendieck1952 585–588) is nuclear with norm ≤ `π²/6`, so `M` satisfies criterion (c) | the route reaches 2°, and its locator is now the text that states it | none |
| 5.4 product route, `⊗̂π`, dual clauses; 5.1; 13 theorems and 7 definitions of `Suggested.lean`; 1.1–1.5, 2.1–2.4, 3.1–3.4, 4.1–4.5, 5.2, 5.3 | as in the previous reports | unchanged by the diff; the rows of the reviews of 714da0c, 32064cd and fb54a01 stand | carried forward | none |

**Cross-roadmap citations resolved.**

- SpectralManifolds SM3 at its open head (README line 26 lists the finite-sum, closed-subspace and Hilbert-scale criteria; line 91 consumes AutomorphicSpectralTheory §0.11): what README lines 124–125 and 628 attribute to it. The diff does not change these citations.
- The overlap report lists no open pull request that changes this roadmap, drops an id it cites, or defines an id it cites. The closest roadmaps by vocabulary (SmoothBanachRepresentations, BanachSpaceTheory) own no object of the changed text: `roadmaps grep` for "approximation property" and "Schauder basis" finds Banach-space ownership only (BanachSpaceTheory B3/B4), which the new example cites through the pinned declarations rather than restating.
- No pinned library has a locally convex injective tensor product (Mathlib `PiTensorProduct/InjectiveSeminorm.lean` and Tau Ceti `TensorProduct/*` are normed), so the ε-product of 5.1 keeps a single owner. Ownership against the open pull requests listed in the brief was checked for the objects of the changed text; the rest carries forward.

**House style of the changed lines.** No LaTeX delimiters, process words, "Not a target" labels, pull-request numbers or machine paths. Grothendieck 1955 is still cited at line 600, so its reference entry (line 690) is not orphaned; Kalton, Dierolf–Roelcke and Wengenroth keep their entries (lines 721–724, 745–746) with locators.

**Declared gaps.** None are declared, and none are needed.

## Not verifiable

- **Dierolf–Roelcke 1981**, Proposition 3.8: the cached `dierolf-roelcke1981` text is the EuDML landing page (300 lines of navigation, no article text), as in the previous reviews. The locator stands as cited for an exclusion.
- **Kalton 1970**, Definition 2.2 and Theorem 2.7, p. 388: no legal open copy (Cambridge Core), as before; the claim is checked above from Bourbaki 1950, Théorème 1 and Corollaire 2.
- **Pietsch 1972**, Chapter 5 and Chapters 5–6: settled as uncertified; cited by locator only.
- **Wengenroth 2003; Grothendieck 1954, 1950; Köthe; Schaefer–Wolff; Trèves; Bourbaki 1955 and 1981; Waelbroeck; Floret; Gel'fand–Vilenkin; Meise–Vogt**: as in the previous reviews.

## Source issues

- none
