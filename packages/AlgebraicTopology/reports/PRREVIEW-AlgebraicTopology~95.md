# Review of AlgebraicTopology (pull request #1854 at c104061)

**Verdict:** needs changes

This is an incremental re-review of 0 changed lines since 56715a5. `git diff --quiet 56715a5 c104061 -- TauCetiRoadmap/AlgebraicTopology` reports the folder identical. The four commits since 56715a5 (63ceb102, 30817b18, 81fee5f3, c1040618) touch only AlgebraicCurves, LocalPurity, ReductiveGroups and BanachSpaceTheory, and none of their added or removed lines mentions AlgebraicTopology. Nothing in the pull request touches ClassifyingSpaces, CharacteristicClasses, DGFloer, the two out-of-folder hunks or the description, so all six findings of the previous report stand unrepaired. They are carried below as R01–R06. R06's witness now also names #1187, which the overlap index lists as conflicting with this head in both of the folder's Lean files.

The gate at this head fails only on `outside-folder=2`. The dependency check prints `depcheck: 238 roadmaps, 2318 edges, 0 problem(s)`. `Suggested.lean` elaborates with 21 `sorry` warnings and nothing else, and the one-tactic probe closes none of them.

## R01 (P2) — This folder and ClassifyingSpaces, in the same pull request, both state and own the classification of pointed maps into an aspherical space

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 105–107 ("ClassifyingSpaces consumes that classification for its uniqueness and model comparisons and owns no second proof of it") and 2498–2502; `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` lines 636–645 (`exists_mapOfEq_eq_of_isAspherical_cwComplex`).

**Claim.** Stage 8.8b is the single owner of Hatcher's Proposition 1B.9, and ClassifyingSpaces consumes it.

**Witness.** At this head, `TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` line 76 states `exists_continuousMap_mapOfEq_eq_of_isAspherical` with the same binders and conclusion as the headline here. Its README line 295 (item 11) owns that theorem and cites no 8.8b, and line 106 says "no target here is an input to any of its layers". Carried from the previous R01.

**Repair.** In this pull request:
- `TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` drops `exists_continuousMap_mapOfEq_eq_of_isAspherical`, and its module docstring lists the classification among the consumed results.
- Item 11 becomes consumption of AlgebraicTopology Stage 8.8b, with a `*Needs:*` citation of `exists_mapOfEq_eq_of_isAspherical_cwComplex`.
- Line 106 names Stage 8.8b among its inputs.

This folder needs no change; the sentence at lines 105–107 is then true.

## R02 (P2) — Two owners of the Serre machinery, CW approximation and Hurewicz modulo a class: this folder and DGFloer

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 109–137: the Serre and Eilenberg–MacLane machinery "is owned here", and "DGFloer Layer 1 consumes these ordinary targets".

**Witness.** DGFloer on main (folder last changed at 6aa0bc9c), lines 140–142 read "owns … ordinary homology Serre spectral sequence consumed by AT5.5", and lines 230–232 read "AlgebraicTopology Stage 5.5 and GeneralizedCohomology consume these targets". The open DGFloer revision at 3166898, lines 1048–1049, still owns the CW-base homological Serre spectral sequence "consumed by AlgebraicTopology Stage 5.5". Carried from the previous R02.

**Repair.** As before: DGFloer's README cites Stages 4.8, 5.0, 5.5, 8.8c and 8.8d instead of building Layer 1 items 2 and 4 and its spectral sequences. Do this either in this pull request, which then names the DGFloer folder as its own, or in DGFloer's revision, with the order stated in both descriptions.

## R03 (P2) — CharacteristicClasses at this head still builds the compactly supported local-coefficient cochains this README owns

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 156–163, the supported-cellular supplement after Stage 6.2 (from line 1675), and the build table row at line 2899 ("owns the compactly supported local-coefficient cochains").

**Witness.** At this head, `TauCetiRoadmap/CharacteristicClasses/README.md` lines 71–72 read "The separate AT supported-cellular supplement consumes C1.2a S0–S4". Its line 585, **S0**, builds `C_c^*(X,A;L)` as the degreewise filtered colimit and defines `H_c^n` from it. The folder last changed at c07dda78. Carried from the previous R03.

**Repair.** As before: C1.2a S0–S4 become consumption of AlgebraicTopology's supported-cellular supplement after Stage 6.2. C1.2a keeps only the support excision, the collared-pair triangle and the comparison, and lines 71–75 state this direction.

## R04 (P3) — The 8.8b uniqueness route restates the pinned single-`0`-cell theorem and misdescribes the cells of `X×I`

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 2489–2490 ("uniqueness is the same extension over the cells of X×I relative to X×∂I∪{x}×I, all of dimension at least two") and 2498–2502, the native pieces named.

**Witness.** Pinned Tau Ceti, `AlgebraicTopology/EilenbergMacLane/Homotopic.lean`:
- Line 220, `TauCeti.homotopicRel_singleton_of_mapOfEq_eq_of_cwComplex`. With `hx₀ : skeletonLT univ 1 = {x₀}` and higher homotopy groups of `Y` vanishing at every point, it gives `f.HomotopicRel g {x₀}`. `TauCeti.IsAspherical.of_basepoint` (`Basic.lean` 90) supplies that hypothesis.
- Line 138, `homotopicRel_skeletonLT_one_of_forall_homotopicRel`.

Neither is cited in the folder. Counterexample: take `X = S¹` with two `0`-cells `x, v`. The cell `v×(0,1)` of `X×I` has dimension 1.

**Repair.** Cite both pinned theorems in the Inventory and at lines 2498–2502 as the uniqueness half for a complex whose `0`-skeleton is the base point. Then replace "all of dimension at least two" by the reduction to that case:
1. Choose a maximal tree `T`.
2. Homotope `g` relative to `x` so that it agrees with `f` on `T`, by the homotopy extension property of `(X, T)`.
3. Apply the pinned theorem.

The headline stays.

## R05 (P3) — Edits outside the pull request's named folders

**Location.** `git diff --stat origin/main...HEAD`, excluding the sixteen folders named as the pull request's own:
- `Completed/ArithmeticDirichletSeries/README.md`, line 331 (1+/1−), from commit b96ce18d;
- `TauCetiRoadmap/SymplecticGeometry/README.md`, lines 76–78 (3+/3−), from commit 0d80dc9d.

**Witness.** The worker's gate at c104061 reports `outside-folder=2` and lists exactly these two files. Carried from the previous R05.

**Repair.** Either name the two folders as the pull request's own, or drop the hunks.

## R06 (P3) — Pull-request description: no stated order with the other open pull requests that change this folder

**Location.** The merge-order paragraph of the description ("#1101 → #1807 → this pull request … #1808 is independent of this pull request"), unchanged.

**Witness.** The overlap index lists these open pull requests as conflicting with this head:
- #1652, #1663 and #1797, in `README.md`, `Suggested.lean` and `TopologicalGroupFundamentalGroup.lean` of this folder;
- #1808, in those three files and in ClassifyingSpaces and CharacteristicClasses, which contradicts "independent";
- #1187, the Tau Ceti pin bump, in `Suggested.lean`, `TopologicalGroupFundamentalGroup.lean`, `lake-manifest.json` and `lean-toolchain`.

Carried from the previous R06.

**Repair.** State which of #1187, #1652, #1663, #1797, #1808 and this pull request is rebased on which. If #1187 merges first, re-elaborate both Lean files of this folder against its pins.

## Previous findings

- R01 — not repaired: ClassifyingSpaces `Suggested.lean` line 76 still states `exists_continuousMap_mapOfEq_eq_of_isAspherical`, and README item 11 (line 295) still owns it; no ClassifyingSpaces file changed since 56715a5 (R01 above).
- R02 — not repaired: DGFloer on main (6aa0bc9c) lines 140–142 and 230–232, and DGFloer's open revision lines 1048–1049, still own the Serre spectral sequence "consumed by AT5.5" (R02 above).
- R03 — not repaired: CharacteristicClasses lines 71–72 ("supplement consumes C1.2a S0–S4") and 585 (S0 colimit, `H_c^n`) are unchanged since c07dda78 (R03 above).
- R04 — not repaired: README lines 2489–2490 still say "all of dimension at least two" and cite neither pinned `homotopicRel_*` theorem; the folder is byte-identical to 56715a5 (R04 above).
- R05 — not repaired: the gate still lists `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md` under `outside-folder` (R05 above).
- R06 — not repaired: the description still reads "#1808 is independent of this pull request" and names no order with #1652, #1663, #1797 or #1187 (R06 above).

## Verified sound

**Gate at c104061.**
- The worker's gate (`gate.md`) shows `outside-folder=2` (R05) and every other scanner at 0, including `build=0`, `dropped=0`, `readme-ids-missing=0`, `statement-hygiene=0`, `sorry-data=0`, `set_option=0`, `stray-files=0`, `depcheck=0` and `metadata=0`.
- The gate command as given in the brief, run today, reports `outside-folder=28`, because it counts the pull request's own sixteen other folders. Every other scanner it prints is 0.

**Dependency check.** The brief's command, run today, prints `depcheck: 238 roadmaps, 2318 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/AlgebraicTopology/Suggested.lean`, from the worktree, exits 0. Its only diagnostics are 21 `declaration uses 'sorry'` warnings at lines 278, 286, 309, 315, 325, 351, 451, 467, 484, 514, 528, 541, 567, 580, 598, 623, 636, 682, 742, 753 and 762, plus the output of the file's `#check` pins. There is no error.

**One-tactic probe.** On a scratch copy, each of the 21 `sorry`s was replaced by `first | (rfl; done) | (simp; done) | (infer_instance; done) | (decide; done) | (trivial; done) | sorry`. The copy elaborates with exit 0 and all 21 `declaration uses 'sorry'` warnings remain. The linter reports that each alternative leaves the goal unchanged, so none of the 21 statements is padding.

**Signatures.** The worker's transcript of 57 declarations flags the same two abbreviations as in earlier rounds, `relativeCWPushoutInclusion` and `relativeCWPushoutCarrier`. Their types do not mention `T2Space`, and the theorems about them (for example `relativeCWPushout_t2Space`, line 309) carry `[T2Space Y] [T2Space Z]` explicitly. This was settled in the previous reviews. The transcript's "elaboration errors" at lines 800–821 lie beyond the file's 771 lines; they come from the checker's own generated file.

**Pinned declarations opened (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b).**
- `TauCeti.IsAspherical` (`EilenbergMacLane/Basic.lean` 59): `PathConnectedSpace X ∧ ∀ n, Subsingleton (π_(n+2) X x)`.
- `TauCeti.IsAspherical.of_basepoint` (same file, line 90).
- `TauCeti.homotopicRel_singleton_of_mapOfEq_eq_of_cwComplex` (`EilenbergMacLane/Homotopic.lean` 220): hypotheses `[CWComplex univ]`, `hY : ∀ y n, Subsingleton (π_(n+2) Y y)` and `hx₀ : skeletonLT univ 1 = {x₀}`; conclusion `f.HomotopicRel g {x₀}`.
- `homotopicRel_skeletonLT_one_of_forall_homotopicRel` (same file, line 138).

The headline's binders at `Suggested.lean` 636–645 (`[T2Space X] [CWComplex univ] [PathConnectedSpace X]`, `TauCeti.IsAspherical Y y`) are unchanged from the previous review.

**Adversarial table.** The folder is unchanged, so every row is carried from the previous report (r83), which carries older rows by round label. The r95 row was recomputed today for R04.

| statement | instances | values each side | result | round |
| --- | --- | --- | --- | --- |
| 8.8b uniqueness route (R04) | `X = S¹` with `0`-cells `x, v` and `1`-cells `e₁, e₂`; `X = S¹` with one `0`-cell | Cells of `X×I` outside `X×∂I∪{x}×I`: `v×(0,1)` (dim 1), `e₁×(0,1)` and `e₂×(0,1)` (dim 2). One `0`-cell: the only remaining cell is `e×(0,1)` (dim 2), and `skeletonLT univ 1 = {x}`, so the pinned theorem applies. | The route sentence is false with several `0`-cells; the pinned theorem covers one `0`-cell | r95 |
| `exists_mapOfEq_eq_of_isAspherical_cwComplex` | `X = pt`; `X = S¹`, `Y = S¹`, `φ = ×k`; Warsaw circle → `S¹`; `X = Y = S²`; `X = S¹ ⊔ pt` | `f = const y` is forced; `z ↦ z^k`, and maps of the same degree are homotopic rel the base point. Constant and winding map both induce `0`, not homotopic: excluded by `CWComplex`. `id` and `const` both induce `0` while `π₂ = ℤ`: excluded by `IsAspherical`. Degrees 0 and 1 on the circle component: excluded by `PathConnectedSpace` | Hypotheses needed and present | r83 |
| `relHurewicz_bijective_of_simplyConnected_subspace` | `n = 0`, `(S², pt)`; `n = 1`, `(S³, pt)`; `Y = S² ⊔ S²`; `(S¹∨S², S¹)` | `ℤ → ℤ` bijective; `ℤ → ℤ` bijective; `π₂ = ℤ` vs `H₂ = ℤ²`: excluded by `PathConnectedSpace`; `ℤ[t,t⁻¹] → ℤ` not injective: excluded by `hB` | Hypotheses needed and present | r83 |
| 8.8c tower bounds | `n = 2`, tower from 3; `n = 1`, presentation complex, tower from 2 | Cells of dimension `≥ 4`, `π_k` kept for `k < 3`, killed for `k ≥ 3`; cells of dimension `≥ 3`, giving `cellularClassifyingSpace` | Matches the pin | r83 |
| `hurewicz_isCIso`, `IsCIso`, `IsCEpi`, `SatisfiesSerreAxioms` | `C` = torsion, `C = 0` | Values as in r71 | As stated | r71 |
| `exists_cwApproximation`, `ordinaryPairQuotientComparison`, `relativeCWPushout_*`, `homotopyInversePairExtension_left`, `compactManifoldFiniteCWType`, `OrdinaryEMModel`, `basedLoopCWType` | As in r63 | Values as in r63 | As stated | r63 |
| `compactSupportTopClass_unique`/`_exists`, `poincareDuality_zmodTwo`, `lsCupLength_add_one_le_categoryCount`, `homologicalWhitehead`, `groupClassifyingSpace_isEMOne`, `ordinaryEMRepresentability` | As in r52/r63 | Values as in r52/r63 | As stated | r52, r63 |
| 8.8b normalisation; 5.3 transfer `p_*τ = d·id` | `G = 1`, `G = ℤ`; `d = 0, 2` | Constant, generator ↦ edge `+1`; `0 = 0`, `τ(σ) = σ̃₁ + σ̃₂` | As stated | r42, r63 |
| 5.0 reindexing, 5.5 sign, 4.6 `RPⁿ` differential, 2.5 `S⁰`, 6.3 boundary, 6.5 linking, 7 Euler values, 1.6 `π₁` abelian | As in r31 | Values as in r31 | As stated | r31 |

**Cross-roadmap citations resolved today.**
- ClassifyingSpaces at this head: `Suggested.lean` line 76; README lines 104–107 and 295–312 (R01).
- CharacteristicClasses at this head: lines 64–75 and 585 (R03).
- DGFloer on main (6aa0bc9c): lines 140–143 and 224–232; DGFloer's open revision at 3166898: lines 153 and 1048–1049 (R02).
- ReductiveGroups line 2234 cites this roadmap's interfaces. The line is unchanged.
- The ReductiveGroups changes since 56715a5 add braid groups as fundamental groups of configuration spaces. This README mentions neither braid groups nor configuration spaces, so there is no second owner.
- The citation resolver and the overlap index find no dropped ids and no id defined only by an open revision.

**Sources.** No passage changed, so no seeded target falls in a changed passage, and the README flags no locator as unverified. The Hatcher locators for the passages these findings touch were read in the previous review: Proposition 1B.9 at hatcher 3905–3907 (p. 90), with its one-`0`-cell case and maximal-tree reduction at 3932–3940.

## Not verifiable

- Serre 1953, Chapter III, Theorem 1 (README Stage 8.8d, Lean 650–657): settled as uncertified in the manifest; the text is unchanged.
- tom Dieck 9.5.1, Weibel 5.5.1(2) and 5.5.10, Milnor *Morse Theory* 3.6–3.7, Freedman–Quinn §7.7, Lee, Thom 1954: settled as uncertified; none is in a changed passage.
- May 1967 (README 4.7, 8.2): only an image scan exists and this worker has no OCR. It is listed in `needs-references.toml`; the passages citing it are unchanged.

## Source issues

- none
