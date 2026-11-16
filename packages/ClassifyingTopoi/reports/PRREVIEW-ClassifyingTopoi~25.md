# Review of ClassifyingTopoi (pull request #1997 at 8ab628d)

**Verdict:** needs changes

## R01 (P3) — Stacks tags 00XA and 00XC swapped in the provenance map

**Location:** `TauCetiRoadmap/ClassifyingTopoi/README.md:1414–1416`: "defines morphisms of topoi (Tag 00XC, `MorphismOfTopoi.lean`), the morphism of sheaf topoi of a morphism of sites (Tag 00XA, `ToposDefs.lean`)".

**Claim:** The tags are the wrong way round. The second item also names the wrong file: `ToposDefs.lean` does not construct the morphism of a morphism of sites.

**Witness:** Stacks Tag 00XA is Definition 7.15.1 (morphisms of topoi and their composition) and Tag 00XC is Lemma 7.15.2 (a morphism of sites gives a morphism of topoi). At c496df0, `ToposDefs.lean` puts `@[stacks 00XA]` on `SheafToposMorphism` and `.comp`, and `MorphismOfTopoi.lean` puts `@[stacks 00XC]` on `IsMorphismOfSites.morphismOfTopoi`.

**Repair:** Replace lines 1414–1416 up to "This roadmap" with: "`StacksFrontier/CategoryTheory/Sites/Topos` defines morphisms of topoi and their composition, in particular between sheaf topoi (Tag 00XA, `MorphismOfTopoi.lean`, `ToposDefs.lean`), the morphism of sheaf topoi of a morphism of sites (Tag 00XC, `MorphismOfTopoi.lean`) and 2-morphisms (Tag 04I9, `TwoMorphismOfTopoi.lean`)."

## R02 (P3) — the provenance map leaves out the ring-object files, which are the commutative-ring case of 1.4

**Location:** `TauCetiRoadmap/ClassifyingTopoi/README.md:1417–1418`: "No file name or tag there treats geometric logic or its semantics (Layer 1)".

**Claim:** The same directory carries sheaves of commutative rings along inverse images. That is 1.4's `CatStructure.map` for the theory of commutative rings, and the ring part of the Examples of Layer 1 (README 600–601). The section claims it maps the existing code, yet it says nothing of these files.

**Witness:** At c496df0, `Topos/MorphismOfTopoiRing.lean` builds `inverseImageRing ⊣ pushforwardRing` (Stacks 00YV, Proposition 7.44.3). `Topos/InverseImageCommRingObj.lean` proves that a functor preserving finite products sends a sheaf of commutative rings to a ring object equal to its inverse-image ring sheaf.

**Repair:** After "maps the same files." insert: "`MorphismOfTopoiRing.lean` carries sheaves of commutative rings along the inverse and direct images of a morphism of topoi (Tag 00YV), and `InverseImageCommRingObj.lean` identifies that inverse image with the ring object transported along a functor that preserves finite products. Together they give 1.4 for the theory of commutative rings, without the local-ring sequent of the Examples of Layer 1." Then replace "geometric logic or its semantics (Layer 1)" with "geometric formulas or their interpretation in a topos for an arbitrary theory (Layer 1)".

## Previous findings

- none: the review of `373af3b` raised no finding of its own.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Provenance tag pairing (README 1414–1416) | Stacks 00XA, 00XC, 04I9; the `@[stacks]` attributes of the three files at c496df0 | 00XA = Def. 7.15.1 ↔ `SheafToposMorphism`, `.comp`; 00XC = Lemma 7.15.2 ↔ `IsMorphismOfSites.morphismOfTopoi`; 04I9 = §7.36 ↔ `hcomp` (04IA on the definition) | 00XA and 00XC are swapped; 04I9 is correct | R01 |
| 1.4 `CatStructure.IsModel.map` restricted to rings (README 457–466, 600–601), touched by R02 | `T` = commutative rings, then local rings; `F = X ↦ X × X` on `Type u` (preserves finite products, not a left adjoint); `M = ℤ_(2)` | `F M = ℤ_(2)²` satisfies the eight ring equations componentwise. Local sequent at `x = (1,0)`: `x·(a,b) = (a,0) ≠ 1` and `(1−x)·(a,b) = (0,b) ≠ 1` | Ring equations survive any functor preserving finite products (the setting of the AxiomMath files). The local sequent needs 1.4's left adjoint, so those files are only the Horn case | R02 wording |
| GrothendieckTopoi 2.4 `GeometricMorphism.ofContinuous`, cited at README 1417 | `G = 𝟭 C`; `G = Opens.map y` for `y : PUnit → X` | `𝟭 C`: inverse and direct images are the identity, matching 00XC with `u = id`. `y`: the inverse image is the stalk `F ↦ F_y` (GrothendieckTopoi 2.4, Checks) | Crediting the morphism of topoi of a morphism of sites to GrothendieckTopoi 2.4 holds | — |

The rows for the statements this change does not touch stand as in the previous review, of `373af3b`.

- **Gate:** rerun at 8ab628d with every check 0 and OK; the worker's gate has `build=0`. Dependency check: `depcheck: 234 roadmaps, 2228 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder is empty, and `git diff 373af3b HEAD` touches only `README.md` (+29).
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 28 `sorry` warnings and nothing else. `Suggested.lean` last changed at `258f897`, so the one-tactic probe and the `#check @` comparison stand.
- **External code opened, AxiomMath at c496df0:** `README.md` (Apache-2.0; `StacksFrontier` "written by AI agents", review needed before `StacksCore`, no `sorry`); `lean-toolchain` v4.35.0 and Mathlib `inputRev` v4.35.0; the `Topos/` listing (62 files); six files read.
- **External code opened, LeanPool at f8b9b72:** `lean-toolchain` v4.35.0 and Mathlib v4.35.0. `InfinitaryLogic/Imports.lean` has MorleyHanf, ErdosRado and 28 `Descriptive.*` modules, and no Topos, Sheaf, Site or Geometric module. Our pin is v4.36.0-rc2, so "earlier than our pin" holds.
- **Stacks locators checked against the text:** 5 (00XA, 00XC, 04I9, 00YV, 04I6).
- **Cross-roadmap citations:** resolved in GrothendieckTopoi at its open head: 2.1 (its README 404), 2.2 (434), 2.4 (479), and its provenance section (1632–1646) maps the same three files. README 77–78 takes 2.1–2.2 and 2.4. Remark: GrothendieckTopoi's README 1644–1645 has the same 00XC/00XA pairing.
- **Description against the head:** its Provenance paragraph agrees with README 1404–1424 and 1456–1462 (commits, versions, Apache-2.0, not a dependency, nothing adapted). "Nothing outside the folder changes" holds; three files with `topic = "math.CT"`; 28 theorems. The seeded sample has no target in the changed passage.
- **Overlap check:** read ToposTheoreticBridges (README 47–49 leave geometric theories, classifying sites and Morita equivalence to this roadmap), GrothendieckTopoi (README 1628–1630) and LocallyPresentableCategories (README 90, 984), plus InfinitaryModelExistence, InfinitaryLogic, CountableModelCounting and TotallyDistributiveTopoi. Nothing is shared, and this roadmap owns its objects. No other pull request changes this roadmap, and no id is dropped.
- **Source independence:** changed passages only. 4 passages compared with 3 sources (AxiomMath README and file docstrings, Stacks 00XA/00XC/04I9, LeanPool `Imports.lean`), with at most 4 consecutive words shared ("written by AI agents"). Largest share Elephant, 15 of 58 locators. No layer added, removed or reordered, so the comparison of contents stands: independent.

## Not verifiable

- none for this change. The paywalled texts (Elephant, Mac Lane–Moerdijk, Makkai–Reyes, Hakim 1972) are cited only in passages this change does not touch.

## Source issues

- none

## For the human reviewers

- **Not tested.** Elephant has the largest share of the locators (15 of 58) and Mac Lane–Moerdijk has 11. Neither text could be read, so the wording of 1.1–1.5, 2.1–2.3 and 3.2–3.4 and the page ranges were not compared with them.
- **Scope.** The route of 2.4 through the site of definable objects of a classifying site (`TauCetiRoadmap/ClassifyingTopoi/README.md` lines 772–793) is the roadmap's own argument. The cited sources prove definability only on the syntactic site.
- **Licence.** README 1406–1424 maps two AI-written Lean repositories: AxiomMath Stacks (Apache-2.0, its README) and LeanPool (Apache-2.0 in its file headers; README 1460–1462 states no licence). Nothing in `Suggested.lean` is adapted from either.
