# Review of AlgebraicTopology (pull request #1652 at 4e825d6)

**Verdict:** needs changes

Incremental re-review of the 40 lines the folder changed since c686921 (`README.md` only, 19 insertions and 21 deletions; `Suggested.lean` is byte-identical). The commit declares the pin the supplier section is read at, softens the two DerivedModuleAlgebra consumer sentences to the form the previous report proposed, and removes every mention of HomotopySpheres. The gate passes with every counter zero, the dependency check reports no problem, the 17 admitted theorems elaborate with `sorry` as the only warning, and every supplier-section name resolves at the declared revisions. What remains is the pull-request description: it still states no order among the open pull requests that touch this folder, and none with #1701, on whose merge the DerivedModuleAlgebra sentences depend. Both remaining findings are P3 and need no change in the folder.

## R01 (P3) — The DerivedModuleAlgebra consumer sentences hold only after #1701 merges, and the description does not say so

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md:137`–`:138` ("DerivedModuleAlgebra §1.1's localization of the derived limit consumes it for its exact-functor comparison") and `:3373`–`:3374` ("DerivedModuleAlgebra §1.1's localization of the derived limit consumes §6.0's homotopy-square maps for its exact-functor comparison"); the pull-request description (`scratch/pull-request.md`, unchanged since the previous review).

**Claim.** DerivedModuleAlgebra §1.1 consumes §6.0's homotopy-square maps.

**Witness.** On main, DerivedModuleAlgebra's supplier table (`TauCetiRoadmap/DerivedModuleAlgebra/README.md:30`) records the inputs it takes from AlgebraicTopology as "None: the module-tower foundation uses no topological results" and exports the square-homotopy maps from its own §§1.T.1/1.1; `:1418` says that foundation is exported to AlgebraicTopology, not imported from it. The sentence is true at the head of #1701 (CBirkbeck, `712f383`), whose DerivedModuleAlgebra lines 19–25 and 57 take "the shifted-cone model, cofinal comparisons and specified homotopy-square maps" from "AlgebraicTopology, Stage 6, item 0" and keep only the localization and exact-functor comparison in §1.1. The description names neither #1701 nor an order. The wording itself is now the one the previous report asked for and is kept.

**Repair.** One sentence in the pull-request description, not in the README: #1652 merges before #1701, which rewrites DerivedModuleAlgebra to consume Stage 6 item 0 (§6.0 under the numbering map at `:447`–`:462`), after which `:137` and `:3373` hold on main; or, if #1701 lands first, that this branch is rebased on it. No file change in the folder. Re-raised from the previous report's R02 (its second half).

## R02 (P3) — Conflicting open pull requests on this folder with no stated order

**Location.** The pull-request description (`scratch/pull-request.md`), unchanged since the previous review.

**Claim.** Implicitly, that this head merges independently of the other pull requests changing the same files.

**Witness.** `scratch/overlaps.md` (heads of 2026-11-08) lists #1663 (kim-em, `8029fe9`, same folder: README and `Suggested.lean`), #1797 (CBirkbeck, `84818d4`), #1807, #1808 and #1854 (CBirkbeck; README, `Suggested.lean`, `GeneralModelOrientation.lean`, `TopologicalGroupFundamentalGroup.lean`) as conflicting with #1652, and #1187 (kim-em, the Tau Ceti bump to `ab00ba39`) as conflicting in `Suggested.lean`, `TopologicalGroupFundamentalGroup.lean` and `lake-manifest.json`. The description names none of them.

**Repair.** State in the description which of #1652 and #1663 merges first and that the other is rebased onto it; that #1797, #1807, #1808 and #1854 are rebased onto whichever lands (or the reverse); and the relation to #1187. No file change in the folder. Re-raised from the previous report's R03.

## Previous findings

- R01 — repaired: `:220`–`:223` now declares the pin ("read at the revisions the content repository's manifest records: Tau Ceti `2fd255d9…` and Mathlib `1b1ccf4b…`"); main's `lake-manifest.json` records exactly those, and all 160 names of the section resolve there (details under Verified sound).
- R02 — partly repaired: `:137`–`:138` and `:3373`–`:3374` carry the softened sentence the report proposed; the description still names no order with #1701 (R01 above).
- R03 — not repaired: the description still names no order among #1663, #1797, #1807, #1808, #1854 and #1187 (R02 above).

## Verified sound

**Scope.** Incremental: `git diff --stat c686921..HEAD` is `README.md | 40 ++++++++++++++----------------` (19 insertions, 21 deletions), matching `scratch/changes.md`; `git diff --stat origin/main...HEAD` outside the folder is empty. Read in context: the Scope bullets at `:119`–`:127` and `:129`–`:141`, the supplier-section opening at `:218`–`:223` and every backticked name of that section to `:370`, the §4.4 passages at `:930`–`:948` and `:978`–`:996`, the Downstream-consumers block at `:3348`–`:3380`, and every remaining mention of HomotopySpheres (none: `grep -n HomotopySpheres README.md` returns nothing) and of DerivedModuleAlgebra (two, both in the diff).

**The pin declaration (the changed passage that governs the whole supplier section).** Main at `3b3f7ef` (2026-11-07) records Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` and Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` in `lake-manifest.json`, the hashes the README states. The branch's own `lake-manifest.json` is unchanged since `0d209833` and pins Tau Ceti `358314d4` and Mathlib `f6090c70` (merge base `a0ad405e` precedes main's bump); since the pull request carries no manifest change, the merged state is main's pin, and the README now says which revision its citations are read at. Precedent: READMEs on main already carry Tau Ceti revision hashes (`TauCetiRoadmap/HeegaardFloer/README.md:2198`, `TauCetiRoadmap/PseudoholomorphicCurveAnalysis/README.md`, three under `Completed/`). Every one of the 160 backticked items of `:218`–`:370` was looked up in the content checkout's `.lake/packages` at those revisions (`git rev-parse HEAD` there: `2fd255d9…` and `1b1ccf4b…`): the four cited file paths exist; the 2 hashes and 1 formula are not names; every `TauCeti.*` name and every unprefixed Tau Ceti name (`DiskSphere`, `DiscretePair`, `Additivity`, `Singular.EilenbergZilber`, `TopPair.twistedCochainComplex`, `mayerVietoris_exact₁`, `cellularChainGroupIso`, …) occurs in the Tau Ceti tree at `2fd255d9`; the Mathlib names (`CompactlyGenerated`, `compactlyGeneratedToTop`, `fullyFaithfulCompactlyGeneratedToTop`, …) occur in Mathlib at `1b1ccf4b`. 26 of the Tau Ceti names exist only at `2fd255d9` and not at the branch pin `358314d4`: `TauCeti.TopCat.serreFibrations` and its seven lemmas (`Topology/Homotopy/SerreFibration/{Basic,FiberBundle,RelativeCube}.lean`, directory absent at `358314d4`), `TauCeti.ModuleTower` and `TauCeti.ComplexTower` with their fifteen cited members, `IsCoveringMap.mem_serreFibrations`, `DeformationRetract`, and the two cellular instances `isIso_singularHomologyMap_skeletonBasePairToComplex_succ_of_{finiteDimensional,hasExactColimitsOfShape}` (`AlgebraicTopology/Cellular/Comparison.lean:227` at `2fd255d9`, with `cellularSingularHomologyIso` at `:244` in every dimension). `Suggested.lean` imports `Mathlib` and four `TauCeti.*` modules (`Cohomology.Cap.Basic`, `Cohomology.Cup`, `EilenbergMacLane.Basic`, `Topology.Homotopy.HomotopyGroup.Map`), each present at both revisions, so the file builds at the branch pin (the worker's gate) and at main's.

**Gate and dependency check.** The worker's gate at 4e825d6 prints every counter zero (`set_option=0 … sorry-data=0 … imports=0 … readme-ids-missing=0 … depcheck=0 … stray-files=0 dirty=0 outside-folder=0 … build=0 OK`). The dependency check re-run here:

```text
depcheck: 244 roadmaps, 2466 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line for this roadmap. The diff adds no `*Needs:*` line; naming DerivedModuleAlgebra as a consumer adds no edge.

**Elaboration, signatures, padding.** `lake env lean TauCetiRoadmap/AlgebraicTopology/Suggested.lean` from the checkout (11 s): exactly 17 `declaration uses `sorry`` warnings and no other output. The file is byte-identical to c686921 and bd4f35d, so the previous reports' one-tactic probe (none of the 17 closes by `rfl`, `simp`, `infer_instance`, `decide` or `trivial`), the 30 `#check @name` comparisons with `scratch/signatures.md` (0 lost binders; no section `variable`s) and the form checks (module header, `import Mathlib` plus four existing `TauCeti.*` modules, one docstring naming the non-statable headlines, `theorem` throughout, no `set_option`, `lemma`, `#eval`, `True` placeholder or sorried data) carry over unchanged; `readme-ids-missing=0` confirms every backticked own name is declared.

**Headline theorems.** Unchanged: Brouwer, transfer, LS cup length, Poincaré–Lefschetz (2 = 0 form), Euler characteristic (four), Whitehead (four), proper deformation retraction, finite CW type of compact manifolds and the homology-sphere corollary (three), K(G,1), mapping-space CW type are stated; Wang/Künneth/Cartan–Leray/Serre, Hurewicz, twisted and boundary duality, representability, obstruction theory and the restriction-tower adapter are named in the docstring as lacking carriers. The cellular comparison in every dimension is native at the declared pin (`Comparison.lean:227`, `:244`), so its absence is right.

**Seeded source audit** (hatcher cache, printed page = page marker − 9). The sampled sections are untouched by the diff except where the Scope bullet describes §6.0; locators in or next to the touched passages, re-opened this round:

| Target | Locator and text checked | Assessment |
|---|---|---|
| 4.4 sphere/quotient signs (`:992`–`:995`, the sentence after the touched one) | Proposition 2.22 (hatcher line 5456, marker 133 → p.124: quotient of a good pair computes relative homology); Proposition 3B.1 (line 11612, marker 278 → p.269: product boundary formula); Theorem 3.11 (line 9099, marker 219 → p.210: graded-commutativity sign (−1)^{kℓ}) | Correct |
| 6.0 Topological adapters (Scope `:129`–`:141` describes it) | Proposition A.1 (line 22534, marker 529 → p.520); Theorem 3.5 (line 8799, marker 212 → p.203) | Correct |
| 6.0 Tau Ceti citations | `TauCeti.ModuleTower.homotopyLimitFunctor`, `derivedLimit`, `limOneSubsequenceEquiv`, `ComplexTower.limComplexSubsequenceIso` and the naturality lemmas: present at `2fd255d9` (`Algebra/Category/ModuleCat/Tower/`), absent at `358314d4` | Resolve at the declared pin |
| 1.5, 2.4, 2.5, 3.2, 3.3, 4.7, 5.4, 6.5, 7.1, 7.3, 8.2, 8.3, 8.7, 8.11 | untouched by the diff | Carried from PRREVIEW-AlgebraicTopology~48/~56 |

**Adversarial computations.** The rows of PRREVIEW-AlgebraicTopology~48 (17 rows) and ~56 (five rows, the §6.0 homotopy-dependence, composite-homotopy and adapter rows recomputed there) carry forward for every statement the diff leaves untouched; the diff touches no mathematical statement, only ownership and consumer prose and the pin sentence, and one row is added per changed statement.

| Statement | Instances tried | Values on the two sides / discriminating value | Result; change |
|---|---|---|---|
| Pin sentence `:220`–`:223` | main `lake-manifest.json` at `3b3f7ef`; branch manifest; the 160 names of `:218`–`:370` | main: Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b` = README; branch: `358314d4`/`f6090c70`, PR diff outside the folder empty; names at `2fd255d9`/`1b1ccf4b`: 160/160 resolve, 26 Tau Ceti names at `2fd255d9` only, 0 missing | True; no change |
| Scope bullet `:121`–`:124` "Pointed cones, Puppe sequences and stabilization are consumers of this foundation" | the removed consumer name; §4.8 and §4.4 ownership lines | No named consumer remains; §4.8 owns the suspension–loop adjunction, §4.4 the raw-quotient comparisons (`:941`–`:944`); no supplier is cited | Consistent; no change |
| §4.4 consumer sentence `:988`–`:990` "RiemannianGeometry R3 consumes these homeomorphisms and the explicit generator comparisons" | RiemannianGeometry on main | `TauCetiRoadmap/RiemannianGeometry/README.md:126`–`:127`: "AT4.4 supplies the raw reduced-suspension quotient and its normalized sphere homeomorphism; R3 constructs its curried …"; `:511` R3 consumes no separate smash/suspension comparison | Agrees; no change |
| DerivedModuleAlgebra sentences `:137`–`:138`, `:3373`–`:3374` | DerivedModuleAlgebra on main; at #1701 `712f383` | main `:30`: inputs from AlgebraicTopology "None", exports square-homotopy maps from §§1.T.1/1.1; `:1418` exports the foundation to AlgebraicTopology; #1701 lines 19–25, 57: consumes "Stage 6, item 0" for "the shifted-cone model, cofinal comparisons and specified homotopy-square maps", keeps §1.1's localization and exact-functor comparison | True at #1701's head, not on main (R01, P3) |
| Downstream bullet `:3375`–`:3377` "FuchsianOrbifolds (Layer 5) and HeegaardFloer consume §8.7's `compactManifoldFiniteCWType` and `FiniteCWTypeModel`, and §7.1's `finiteCWEulerCharacteristic`" | both roadmaps on main | FuchsianOrbifolds `:81`–`:82`: `compactManifoldFiniteCWType` in real dimension two, transports `finiteCWEulerCharacteristic`; HeegaardFloer `:2347`: `compactManifoldFiniteCWType` supplies the finite model, identified with the alternating Betti sum | Agrees; no change |
| Downstream paragraph `:3350`–`:3353` (HomotopySpheres clause removed) | the three remaining consumers | CharacteristicClasses, DGFloer, DifferentialGeometry clauses unchanged from c686921 and resolved in PRREVIEW-AlgebraicTopology~48 | No change |

**Cross-roadmap citations resolved.** DerivedModuleAlgebra on main `:30`, `:1418` and at #1701's head lines 19–25, 57 (`roadmaps show DerivedModuleAlgebra --pr 1701`); RiemannianGeometry on main `:113`, `:122`, `:126`–`:127`, `:511`; FuchsianOrbifolds on main `:81`–`:82`; HeegaardFloer on main `:2347`; the numbering map `:447`–`:462` (Stage 6 item 0 = §6.0). `scratch/citations.md`: no cross-roadmap citation and no Lean name found nowhere. The never-cite list names HomotopySpheres; the README no longer mentions it anywhere.

**Overlaps.** `scratch/overlaps.md`: the DifferentialGeometry Layer 9/10 ids that #886 drops at its head are citations of a roadmap on main by a pull request that revises it (cite main; not a finding); the four `#stage-k-…` anchors this pull request drops are covered by the old → new map at `:447`–`:462`; the six conflicting pull requests are R02; the closest open roadmaps (CharacteristicClasses #1807/#1808/#1854, HomotopySpheres #1287, StableHomotopyKTheory #1227) claim none of this folder's objects beyond what earlier rounds recorded. Ownership against the board packages (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory): unrelated by subject.

**Remark on untouched text (no change requested).** The pin sentence names the revisions "the content repository's manifest records"; at the next pin bump the apposition goes stale like every file-and-line citation in the section, and a bump revises it with them.

## Not verifiable

- Unchanged from the previous report: Conway–Friedl–Herrmann (6.5), Hatcher *Vector Bundles and K-Theory* (8.9), the spine references eilenberg-steenrod, whitehead, dold, may, mccleary, brown-cohomology, serre1951, and the manifest's uncertified thom1954, lee, tomdieck2008, serre1953, fq1990, milnor1963, weibel. None is touched by the diff.

## Source issues

- none
