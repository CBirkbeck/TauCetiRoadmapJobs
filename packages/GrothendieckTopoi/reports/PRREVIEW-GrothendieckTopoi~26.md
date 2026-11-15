# Review of GrothendieckTopoi (pull request #1520 at a0bf576)

**Verdict:** needs changes

## R01 (P3) — Provenance: Stacks tags 00XC and 00XA attached to the wrong content and file

**Location:** `TauCetiRoadmap/GrothendieckTopoi/README.md` lines 1642–1646: "define a morphism of topoi as an adjunction with left exact inverse image (Tag 00XC, `MorphismOfTopoi.lean`), the morphism of sheaf topoi of a morphism of sites and its composition (Tag 00XA, `ToposDefs.lean`) … the content of 2.1 and 2.2"

**Claim:** 00XC is not the definition and `ToposDefs.lean` has no morphism-of-sites construction. That construction is the content of 2.4 (`GeometricMorphism.ofContinuous`), not of 2.1–2.2.

**Witness:** Stacks 00XA is Definition 7.15.1 (morphism of topoi of sites, with composition); 00XC is Lemma 7.15.2 (a morphism of sites gives one). At c496df0: `@[stacks 00XC]` is on `IsMorphismOfSites.morphismOfTopoi` (`MorphismOfTopoi.lean` line 98); `ToposDefs.lean` lines 37, 52 tag 00XA.

**Repair:** replace the sentence with: "Its `Topos/` files define, in `MorphismOfTopoi.lean`, a morphism of topoi as an adjunction with left exact inverse image, with identity and composition, and the morphism of topoi of a morphism of sites (Tag 00XC); in `ToposDefs.lean`, the same notion between topoi of sites with its composition (Tag 00XA); and in `TwoMorphismOfTopoi.lean`, 2-morphisms with their horizontal composition (Tag 04I9): the content of 2.1 and 2.2 for topoi of sites, without the existence criterion of 2.1 or the 2-category of 2.2, and the construction of 2.4's `GeometricMorphism.ofContinuous`." This matches the two files' tags at the lines above.

## R02 (P3) — Provenance misstates how the external repository describes its review

**Location:** `TauCetiRoadmap/GrothendieckTopoi/README.md` line 1636: "the repository records it as unreviewed by humans"

**Claim:** The repository does not say this. It contrasts `StacksFrontier` with its human-reviewed `StacksCore` tier, and it says that maintainers review every pull request to either tier.

**Witness:** AxiomMath README at c496df0, *Structure*: the tiers "differ in who has reviewed the code", and `StacksCore` is "human-reviewed". *Contributing*, step 4: "The maintainers review every pull request, to either tier."

**Repair:** replace the clause with "the repository keeps it apart from its human-reviewed `StacksCore` tier". This is the wording the InverseGaloisAndArithmeticFundamentalGroups provenance section uses for the same repository (its open head, README line 7551).

## R03 (P3) — Description: the Provenance paragraph has the same tag pairing as R01

**Location:** pull-request description, **Provenance.**: "morphisms of topoi and of sheaf topoi of sites (Tags 00XC, 00XA) and 2-morphisms (04I9) to 2.1–2.2"

**Claim:** This pairs 00XC with the definition of morphisms of topoi. It also omits that the morphism of topoi of a morphism of sites corresponds to 2.4.

**Witness:** As for R01: Stacks 00XC is Lemma 7.15.2, and 00XA is Definition 7.15.1. The construction corresponds to `GeometricMorphism.ofContinuous` (`Suggested.lean` line 269, Layer 2.4).

**Repair:** replace with "morphisms of topoi and of topoi of sites with their composition (Tag 00XA) and 2-morphisms (04I9) to 2.1–2.2, and the morphism of topoi of a morphism of sites (Tag 00XC) to 2.4".

## Previous findings

- none: the review of 46fa6f3 raised no finding.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.4 `GeometricMorphism.ofContinuous` (touched by R01; external `IsMorphismOfSites.morphismOfTopoi`, Stacks 00XC) | `G = 𝟭 C`; `G = Opens.map f` for `f : pt → Sierpiński` at `o` and at `c` | `𝟭`: identity. At `o`: `S ↦ (S → S, id)`; at `c`: `S ↦ (S → 1)`. Both libraries: `C ⥤ D` gives `Sh(D) → Sh(C)` | Same three fields as the external 00XC declaration (pushforward, `sheafPullback`, `sheafAdjunctionContinuous`); its content is 2.4's | R01, R03 |
| 4.1 `GeometricMorphism.IsEmbedding` (external `MorphismOfTopoi.IsEmbedding`, Stacks 08LU) | identity of `Type u`; global sections of `Sh(Sierpiński)`; points `o`, `c` | identity: embedding. `Γ(A → B) = A`: identity and swap on `(∅ → Bool)` both map to `id_∅`, so not faithful. Points `o`, `c`: `Hom = T^S`, embeddings | The two predicates agree on all four instances; they are the same up to field names | none (see human reviewers) |
| 4.3 closed subtopos `c(U)` (external `IsClosedSubtopos`, Stacks 08LZ via 7.43.5) | Sierpiński with `U = ℓ{o}` (`U(X) = ∅`, `U({o}) = 1`); `Type u` with `U = ∅`, `PUnit` | `G ⨯ U → U` iso iff `G({o})` is a singleton: the image of point `c`. `Type u`: `c(∅)` everything, `c(PUnit)` singletons | README 4.3, its Checks and Stacks 7.43.5 agree; the map from `Closed.lean` to 4.3 holds | none |

The rows for untouched statements stand as in the previous review, of 46fa6f3.

- **Gate:** the worker's gate at a0bf576 passes every check, build included. A local run against the public order file gives 0 everywhere except `depcheck: NOT IN ORDER: GrothendieckTopoi`, which is not a finding. On the candidate order with `--movable`: "depcheck: 237 roadmaps, 2241 edges, 0 problem(s)" (DiamondEtaleCohomology is line 82, GrothendieckTopoi line 83).
- **Elaboration:** `lake env lean TauCetiRoadmap/GrothendieckTopoi/Suggested.lean` exits 0 with 44 `sorry` warnings and nothing else. Since 46fa6f3, `Suggested.lean`, `lake-manifest.json` and `lean-toolchain` are unchanged and only the README changed; nothing changed outside the folder. The elaborated types of the two declarations touched by R01 carry their binders (`[G.IsContinuous J K] [RepresentablyFlat G]`).
- **External repository at c496df0, 21 files opened:**
  - Every path the section names exists in the 3946-file `Sites` tree.
  - Tags: 04I9 (`TwoMorphismOfTopoi.lean` line 182), 04IU and 04IW (`LocalizationAndMorphismsOfTopoi.lean` lines 434, 807), 08LV with SGA 4 IV 9.1 (`Subtopos/Defs.lean` line 49), 08LZ (`Closed.lean` line 45), 00Y4 with SGA 4 IV 6.1 (`Point/Defs.lean` line 26).
  - Pins and licence: `lean-toolchain` v4.35.0, `lakefile.toml` Mathlib `v4.35.0`, LICENSE Apache 2.0, "no `sorry`" (README). Our pin is v4.36.0-rc2.
- **Stacks tags read at the Stacks Project site (12):** 00XA (Def. 7.15.1), 00XC (Lemma 7.15.2), 04I9 (§7.36), 04IU, 04IV, 04IW (Lemmas 7.31.2–7.31.4), 08LV (Def. 7.43.2), 08LW, 08LY, 08LZ (Def. 7.43.6), 08M0, 00Y4 (Def. 7.32.1).
- **Negative claim:** no file name in the `Sites` tree mentions Giraud, Diaconescu, power objects, locales or frames, hyperconnected, locally connected, essential, local or connected morphisms, or fibre products of topoi. The `Pullback…Topos` hits are derived pullback functors, and `Subtopoi.lean` covers only 08LW and 08LY.
- **Target mapping:** these correspondences hold:
  - 3.1 ↔ `SliceTopos/`; 3.3 ↔ `SubterminalSlice*.lean` (5 files);
  - 4.1, 4.3 ↔ `Subtopos/`; 6.1, 6.2, 6.4 ↔ `Point/` (`DeligneCriterion.lean` is Stacks 00YQ);
  - Layer 9 ↔ `LocalizationShriekExact.lean`, which proves `j_!` exact on abelian sheaves over `C/K`, as 9.1 does over `C/c`.
- **Description against the head:** these hold: "adds the folder … changes nothing outside it", "then Downstream consumers, Provenance and References", and "not adapted in `Suggested.lean`". Remark (no change asked): "Checks run locally" is as the previous review read it.
- **Seeded sample:** the new text names 1.4, 2.5, 6.1, 6.4 and Layers 5, 7 and 8 only by number, and each number resolves to a heading at this head. Their locators are unchanged and stand as checked through 46fa6f3.
- Remark (no change asked): ClassifyingTopoi's provenance section (its open head, README lines 1415–1417) repeats the 00XC/00XA pairing of R01 for the same files.

Overlap check: the change adds no object and no ownership claim, so the scopes of TotallyDistributiveTopoi, ClassifyingTopoi, ToposTheoreticBridges, InfinityTopoi, HypercompletenessAndCoherence, DiamondsAndVStacks and AdicEtaleGeometry stand as read in the review of 46fa6f3: nothing shared. Five open roadmaps cite GrothendieckTopoi, and the change neither renumbers nor removes anything they cite. Among the other roadmaps that map AxiomMath, only ClassifyingTopoi maps `CategoryTheory/Sites`, and it cites GrothendieckTopoi as owner.

Source independence: changed passages only. I compared 7 passages of the new section and its reference with 2 sources (the 12 Stacks tags above, and the AxiomMath README and the module docstrings of the files named); they share only standard names and short forced phrases. Largest share: SGA 4, 26 of 96 locators, as in the review of 46fa6f3; the new section adds only attributions (8 Stacks tags, 2 SGA 4 items). No layer was added, removed or reordered, so the contents comparison stands: independent.

## Not verifiable

- SGA 4 IV 9.1 and IV 6.1, which the new section attaches to `Subtopos/Defs.lean` and `Point/Defs.lean`: SGA 4 is paywalled and not in the sources cache, as in earlier rounds. The external files do carry these `sga` attributes, and Stacks 08LV and 00Y4 give the same definitions.

## Source issues

- none

## For the human reviewers

- Licence: README line 1633 names AxiomMath, *The Stacks Project in Lean* (Apache 2.0 at c496df0). `Suggested.lean` line 356, `GeometricMorphism.IsEmbedding`, matches its `Subtopos/Embedding.lean` line 37, `MorphismOfTopoi.IsEmbedding`, up to field and namespace names.
- Coordination: the description says AxiomMath's maintainers "have not been contacted about this roadmap". The project README (*Porting existing work*) asks an independent development of the same mathematics to cite the existing work and coordinate where possible.
