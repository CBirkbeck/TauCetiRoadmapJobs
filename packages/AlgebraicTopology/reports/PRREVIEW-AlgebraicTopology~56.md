# Review of AlgebraicTopology (pull request #1652 at c686921)

**Verdict:** needs changes

Incremental re-review of the 8 lines the folder changed since bd4f35d (README.md only: the ownership sentence of the scope bullet at `:135`–`:138` and a new Downstream-consumers bullet at `:3374`–`:3376`; `Suggested.lean` is byte-identical). The gate passes with every counter zero, the dependency check reports no problem, the 17 admitted theorems elaborate with `sorry` as the only warning, and every seeded locator that falls in or near the changed passages is correct in the cached texts. The commit addresses the previous R02 by naming DerivedModuleAlgebra a consumer of §6.0 instead of a supplier; main's own AlgebraicTopology already owns the homotopy-square cone maps at Stage 6 item 0, so that direction is right, but the new wording describes DerivedModuleAlgebra as it is at an open revision and not on main (R02, now P3). The pin (R01, P2) and the pull-request ordering (R03, P3) are unchanged.

## R01 (P2) — The Tau Ceti supplier citations still do not exist at this pull request's pin

**Location.** `lake-manifest.json` at c686921 (Tau Ceti `rev` `358314d4`), and the passages the previous report listed: `TauCetiRoadmap/AlgebraicTopology/README.md:306`–`:352` (the Serre-fibration and tower-algebra supplier bullets), `:870`–`:873` ("Consume native `TauCeti.cellularSingularHomologyIso`, which holds in every CW dimension … `_of_hasExactColimitsOfShape`"), `:1586`–`:1592` (§6.0 *Needs:*), `:1633`–`:1646` (the four `TauCeti.ComplexTower.*` and `TauCeti.ModuleTower.limOneSubsequenceEquiv` citations), `:461` ("the generic tower algebra other than the homotopy-square maps is Tau Ceti's `TauCeti.ModuleTower`"), and `TauCetiRoadmap/AlgebraicTopology/Suggested.lean:46`–`:47`.

**Claim.** The README consumes `TauCeti.TopCat.serreFibrations` and its eight lemmas, `TauCeti.ModuleTower`, `TauCeti.ComplexTower` and their Milnor, subsequence and derived-limit API, and the all-dimensions instance behind `TauCeti.cellularSingularHomologyIso`, as pinned declarations; on their strength the cellular-comparison headline is absent from `Suggested.lean`.

**Witness.** The head's `lake-manifest.json` still pins Tau Ceti `358314d4ab97` (Mathlib `f6090c70`); `git diff --stat origin/main...HEAD` outside the folder is empty, so the branch never took main's bump to `2fd255d9` (main `a891cd19`, 2026-11-05). In the worktree's `.lake/packages/TauCeti/TauCeti` at that revision there is no `Algebra/Category/ModuleCat/Tower/` and no `Topology/Homotopy/SerreFibration/` directory, and `grep -rl 'serreFibrations|ModuleTower|ComplexTower|isIso_singularHomologyMap_skeletonBasePairToComplex_succ'` over the tree returns 0 files; `cellularSingularHomologyIso` there (`AlgebraicTopology/Cellular/Comparison.lean:106`–`:111`) is documented and proved for a finite-dimensional relative CW complex only. The README declares no pin of its own (no manifest hash anywhere in it; its supplier section opens "The development starts from these pinned APIs"), so the brief's pin, the worktree manifest, is the one the citations are held against. All 33 names exist at `2fd255d9` with the statements the README describes (file and line list in the previous report, re-opened for `homotopyLimitFunctor_map` at `Tower/DerivedLimit.lean:131`–`:135`).

**Repair.** Unchanged from the previous report: merge main into the branch so that `lake-manifest.json` carries `2fd255d9` (keep this branch's README and `Suggested.lean` text at the conflicts). After the merge every citation resolves, the targeted build still passes (the file imports none of these modules) and the deletion of the cellular-comparison headline is justified. No other change in the folder is needed for this finding.

## R02 (P3) — The DerivedModuleAlgebra consumer bullets describe that roadmap at an open revision, not on main

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md:135`–`:138` ("its algebraic consumers, DerivedModuleAlgebra §1.1's localization of the derived limit among them, take it from 6.0") and `:3374`–`:3376` ("DerivedModuleAlgebra (§1.1's localization of the derived limit … ) consumes §6.0's homotopy-square maps, with their composite and second-homotopy laws, alongside Tau Ceti's tower algebra").

**Claim.** DerivedModuleAlgebra §1.1 consumes the homotopy-square cone maps from §6.0 here.

**Witness.** DerivedModuleAlgebra on main consumes nothing from this roadmap and owns the object itself: its supplier table (`TauCetiRoadmap/DerivedModuleAlgebra/README.md:29`–`:30`) exports "maps retaining specified square homotopies" from "§§1.T.1/1.1" and records the inputs it takes from AlgebraicTopology as "None"; `:1420`–`:1421` says the specified-homotopy-square comparisons are owned by §1.1 there; `:1627`–`:1633` states `derivedLimit_homotopySquare` with the fibre map `(x,y) ↦ (ux, vy+hx)`, the composite `h₂u₁ + v₂h₁` and the second-homotopy law. The sentence is true only at the head of the open pull request #1701 (CBirkbeck, `712f383`), whose DerivedModuleAlgebra lines 19–25, 50, 57 and 1592 cite "AlgebraicTopology, Stage 6, item 0" for "the shifted-cone model, cofinal comparisons and specified homotopy-square maps" and keep only the localization and exact-functor comparison in §1.1. Neither this pull request's description nor its README names that revision. The direction itself is sound and not a duplication introduced here: main's AlgebraicTopology Stage 6 item 0 (`TauCetiRoadmap/AlgebraicTopology/README.md:46` on main, `:980`–`:983`, `:993`–`:994`) already owns "Homotopy-commuting product squares induce actual cone maps, retaining the specified square homotopies in their composition laws … as part of this stage's own scope", so the two-owner state between main's AlgebraicTopology and main's DerivedModuleAlgebra pre-dates this pull request and #1701 resolves it in this folder's favour. The previous report's R02 read DerivedModuleAlgebra as the sole owner on main; that was incomplete, and its repair (consume §1.1 from DerivedModuleAlgebra) is withdrawn.

**Repair.** State the order in the pull-request description (not in the README): #1652 merges before #1701, which rewrites DerivedModuleAlgebra to consume Stage 6 item 0 (§6.0 under the numbering map at `:461`) and after which the two bullets hold on main; or, if #1701 lands first, that this branch is rebased on it. Optionally soften `:3374`–`:3376` to the fact that is true on main as well: "DerivedModuleAlgebra §1.1's localization of the derived limit consumes §6.0's homotopy-square maps for its exact-functor comparison" is fine once the order is stated; until then a reader of main's DerivedModuleAlgebra finds the opposite direction at its `:30`.

## R03 (P3) — Conflicting open pull requests on this folder with no stated order

**Location.** The pull request description (quoted in `scratch/pull-request.md`, unchanged since the previous review).

**Claim.** Implicitly, that this head merges independently of the other pull requests changing the same files.

**Witness.** The overlap index (heads of 2026-11-08) lists #1663 (kim-em, `8029fe9`, same folder, README and `Suggested.lean`), #1797 (CBirkbeck, `84818d4`) and #1807, #1808, #1854 (CBirkbeck; README, `Suggested.lean`, `GeneralModelOrientation.lean`, `TopologicalGroupFundamentalGroup.lean`) as conflicting with #1652, and #1187 (kim-em, the Tau Ceti bump to `ab00ba39`) as conflicting in `Suggested.lean`, `TopologicalGroupFundamentalGroup.lean` and `lake-manifest.json`. The description names none of them.

**Repair.** State in the description which of #1652 and #1663 merges first and that the other is rebased onto it; that #1797/#1807/#1808/#1854 are rebased onto whichever lands (or the reverse); and the relation to #1187 and to #1701 (R02). No file change in the folder.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `358314d4`; the 33 cited declarations and the all-dimensions cellular instance are absent there (R01 above).
- R02 — partly repaired: §6.0 keeps the ownership main's Stage 6 item 0 already has (right), but `:135`–`:138` and `:3374`–`:3376` describe DerivedModuleAlgebra at #1701's head, not on main (R02 above, P3).
- R03 — not repaired: the description still names no order among #1663, #1797, #1807, #1808, #1854, #1187 (R03 above).

## Verified sound

**Scope.** Incremental: the diff since bd4f35d (`git diff --stat bd4f35d..HEAD`: `README.md | 8 ++++++--`, 6 insertions, 2 deletions, matching `scratch/changes.md`), both changed passages in context (`:125`–`:142`, `:3360`–`:3380`), the §6.0 block they describe (`:1585`–`:1700`), the Dependency-order rows `:3401`–`:3402`, the numbering map `:447`–`:462`, every mention of DerivedModuleAlgebra in the README (two, both in the diff), DerivedModuleAlgebra on main and at #1701's head, main's AlgebraicTopology Stage 6 item 0, and `git diff --stat origin/main...HEAD` outside the folder (empty).

**Gate and dependency check.** The worker's gate at c686921 prints every counter zero (`set_option=0 … sorry-data=0 … imports=0 … readme-ids-missing=0 … depcheck=0 … stray-files=0 dirty=0 outside-folder=0 … build=0 OK`). The dependency check re-run here:

```text
depcheck: 243 roadmaps, 2458 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line for this roadmap. Naming DerivedModuleAlgebra under Downstream consumers adds no `*Needs:*` edge; main's DerivedModuleAlgebra `*Needs:*` lines cite only its own §1.T.1 and Mathlib, so no cycle arises in either direction.

**Elaboration, signatures, padding.** `lake env lean` on `Suggested.lean` from the checkout (22 s): exactly 17 `declaration uses 'sorry'` warnings and no other output. The file is byte-identical to bd4f35d, so the previous report's one-tactic probe (none of the 17 closes by `rfl`, `simp`, `infer_instance`, `decide` or `trivial`), its 30 `#check @name` comparisons with `signatures.md` (0 lost binders; the file has no section `variable`s) and its form checks (module header, `import Mathlib` plus four existing `TauCeti.*` modules, one docstring naming the non-statable headlines, `theorem` throughout, no `set_option`, `lemma`, `#eval`, `True` placeholder or sorried data) carry over unchanged. Every Lean name appears in the README and the gate's `readme-ids-missing=0` confirms the converse.

**Headline theorems.** Unchanged since bd4f35d: Brouwer, transfer, LS cup length, Poincaré–Lefschetz (2 = 0 form), Euler characteristic (four), Whitehead (four), proper deformation retraction, finite CW type of compact manifolds and the homology-sphere corollary (three), K(G,1), mapping-space CW type are stated; Wang/Künneth/Cartan–Leray/Serre, Hurewicz, twisted and boundary duality, representability, obstruction theory and the restriction-tower adapter are named in the docstring as lacking carriers. The cellular comparison in every dimension is statable at the head's pin and absent: R01.

**Seeded source audit** (hatcher cache, printed page = page marker − 9). Locators in or next to the changed passages and in the sampled sections that carry Hatcher theorem numbers, all re-opened this round:

| Target | Locator and text checked | Assessment |
|---|---|---|
| 6.0 Topological adapters | Proposition A.1 (hatcher line 22534, marker 529 → p.520: a compact subspace of a CW complex lies in a finite subcomplex); Theorem 3.5 (line 8799, marker 212 → p.203, running head 203: cellular cochain complex is the Hom-dual of the cellular chain complex) | Correct |
| 6.0 Tau Ceti citations (`TauCeti.ModuleTower`, `ComplexTower`, `homotopyLimitFunctor`, the four naturality/subsequence names) | at main's pin `2fd255d9`: `Tower/DerivedLimit.lean:118`–`:135` (`homotopyLimitFunctor := NatTrans.mappingCoconeFunctor (complexShift R)`, `_map` for a strict `f : K ⟶ L` only; no declaration in `Tower/` mentions a square homotopy); at the head's pin `358314d4`: directory absent | "the one generic tower construction the library lacks" is true at main's pin; absent at the head's pin (R01) |
| 2.4 Homology axioms | Theorem 2.10 (line 4863 → p.111), Corollary 2.25 (line 5521 → p.126) | Correct |
| 2.5 Coordinate orientations | Proposition 3B.1 (line 11612 → p.269) | Correct |
| 2.7 Brouwer | Corollary 2.15 (line 5005 → p.114) | Correct |
| 3.5 Sphere calculations | Proposition 2.21 (line 5222 → p.119; cited without a page) | Correct |
| 4.5 Cofibrations | Theorem 4.8 (line 15205 → p.349) | Correct |
| 5.4 Torus homology | Theorem 3B.6 (line 11898 → p.275), Example 3.16 (line 9388 → p.216) | Correct |
| 6.3 Fundamental classes | Lemma 3.27 (line 10255 → p.236; cited without a page), Proposition 3.29 (line 10370 → p.239) | Correct |
| 2.6, 3.1, 3.3, 3.4, 4.3, 5.2, 8.10 | no Hatcher theorem number in the section (Section 2.1 pp.121–122 for 3.1; native Tau Ceti carriers for 4.3; the rest cite earlier layers); untouched by the diff | Carried from PRREVIEW-AlgebraicTopology~8/~11/~15/~48 |

**Adversarial computations.** The rows of the previous report (PRREVIEW-AlgebraicTopology~48, its table of 17 rows: §5.5 three Checks, §6.0 adapter, composite, homotopy dependence and Milnor hypothesis, §4.3, §5.3, §6.2, §6.4, §7.2, §8.7, §8.5, §8.8, §4.8, numbering map) carry forward for the statements the diff leaves untouched; the §6.0 rows were recomputed here since the diff describes §6.0, and one row is added for the changed statement.

| Statement | Instances tried | Values on the two sides / discriminating value | Result; change |
|---|---|---|---|
| §6.0 homotopy dependence Check (`:1689`–`:1696`), recomputed | K = ℤ[0] constant, L = ℤ[−1] with ×3 transitions, f = 0, hₙ = rₙ | lim¹(ℤ, ×3) ≅ ℤ₃/ℤ via (aₙ) ↦ Σ3ⁿaₙ; rₙ = 1: (1 − 3)·Σ3ⁿ = 1 so Σ3ⁿ = −1/2 ≠ 0 mod ℤ; DMA's even-n choice: (1 − 9)·Σ9ᵐ = 1 so Σ9ᵐ = −1/8 ≠ 0 | Both Checks agree with each other and with main's DerivedModuleAlgebra Check at `:1655`–`:1658`; no change |
| §6.0 composite homotopy (`:1684`–`:1688`), recomputed | fₙ = gₙ = n·id on R → R, hₙ = kₙ = s | (n+1)² − n² = 2n+1; (n+1)s + ns = (2n+1)s; (n+1)s alone covers n+1, wrong for n ≥ 1 | Agrees with `h₂u₁ + v₂h₁` read levelwise; no change |
| §6.0 adapter correction term (`:1677`–`:1683`), recomputed | same, fₙ = n·id, hₙ = s | (δ∘∏f − ∏f∘δ)(x)ₙ = (n xₙ − (n+1)xₙ₊₁) − (n xₙ − n xₙ₊₁) = −xₙ₊₁ | Forced; no change |
| Ownership sentence `:135`–`:138` and consumer bullet `:3374`–`:3376` (the changed statement) | DerivedModuleAlgebra on main; at #1701 `712f383`; main's AlgebraicTopology Stage 6 item 0 | main DMA `:30`: inputs from AT "None", exports square-homotopy maps from §§1.T.1/1.1; `:1627` owns `derivedLimit_homotopySquare`; #1701 lines 20–25, 57, 1592: consumes "AlgebraicTopology, Stage 6, item 0" for "specified homotopy-square maps"; main AT `:980`–`:983`, `:993`–`:994`: owns the cone maps "as part of this stage's own scope"; numbering map `:461`: Stage 6 item 0 = §6.0 | True at #1701's head, false on main; direction consistent with main's AT (R02, P3) |
| Dependency-order row `:3401` "6.0 homotopy-square maps / Tau Ceti tower algebra and Mathlib mapping cones only" | the §6.0 *Needs:* line `:1586`–`:1592` | *Needs:* lists `TauCeti.ModuleTower`, `ComplexTower`, `homotopyLimitFunctor`, Mathlib `mappingCone`, `Homotopy`, `HomologicalComplex.extend`; nothing of DMA | Row agrees with the *Needs:* line; no change |

**Cross-roadmap citations resolved.** DerivedModuleAlgebra on main `:30`, `:1418`–`:1421`, `:1627`–`:1633` and at #1701's head lines 19–25, 50, 57, 1575, 1592, 1601 (read with `roadmaps show --pr 1701`); main's AlgebraicTopology `:44`–`:46`, `:975`–`:996`; the numbering map `:447`–`:462` sends Stage 6 item 0 to §6.0, so #1701's citation of "Stage 6, item 0" follows the map. The remaining consumer bullets (`:3360`–`:3380`: MorseTheory M2/M4, CharacteristicClasses C2.0, GeneralizedCohomology, BanachAlgebras A8, AffineMorseLefschetz A4, FuchsianOrbifolds, HeegaardFloer, HomotopySpheres) are untouched since bd4f35d and were resolved in the previous report. `scratch/citations.md`: no cross-roadmap citation and no Lean name found nowhere.

**Overlaps.** `scratch/overlaps.md`: the DifferentialGeometry Layer 9/10 ids that #886 drops at its head are citations of a roadmap on main by a pull request that revises it (cite main; not a finding); the four `#stage-k-…` anchors this pull request drops are covered by the old → new map at `:447`–`:462`; the six conflicting pull requests are R03; the closest open roadmaps (CharacteristicClasses #1807/#1808/#1854, StableHomotopyKTheory #1227, HomotopySpheres #1287) claim none of this folder's objects beyond what earlier rounds recorded. Ownership against the board packages (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory): unrelated by subject.

## Not verifiable

- Unchanged from the previous report: Conway–Friedl–Herrmann (6.5), Hatcher *Vector Bundles and K-Theory* (8.9), the spine references eilenberg-steenrod, whitehead, dold, may, mccleary, brown-cohomology, serre1951, and the manifest's uncertified thom1954, lee, tomdieck2008, serre1953, fq1990, milnor1963, weibel. None is touched by the diff.

## Source issues

- none
