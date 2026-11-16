# Review of GrothendieckTopoi (pull request #1520 at ff38c29)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: "Its `Topos/` files define, in `MorphismOfTopoi.lean`, a morphism of topoi as an adjunction with left exact inverse image, with identity and composition, and the morphism of topoi of a morphism of sites (Tag 00XC); in `ToposDefs.lean`, the same notion …" (README lines 1642–1648)
- R02 — repaired: "the repository keeps it apart from its human-reviewed `StacksCore` tier" (README line 1636)
- R03 — repaired: description, **Provenance.**: "morphisms of topoi and of topoi of sites with their composition (Tag 00XA) and 2-morphisms (04I9) to 2.1–2.2, and the morphism of topoi of a morphism of sites (Tag 00XC) to 2.4"

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.1 `GeometricMorphism`, `id`, `comp` (external `MorphismOfTopoi`, `id`, `comp`; `SheafToposMorphism`, Stacks 00XA) | `Over.forget Bool ⊣ Over.star Bool` in `Type u`; the identity; a composite with the identity | `Over.forget` sends terminal `𝟙 Bool` to the 2-element `Bool`: both reject it. Both identities are `𝟭`. Our `comp f g` is the external `comp g f`, direct image `f_* ⋙ g_*` | Same four fields; `comp` takes its arguments in diagrammatic order here and applicative order there | none |
| 2.2 `GeometricMorphism.Hom`, `homEquivInverse` (external `TwoMorphismOfTopoi`, Stacks 04IA; `hcomp`, 04I9) | Points `o`, `c` of Sierpiński `{o, c}`, `{o}` open | `o ⇒ c` corresponds to `stalk_c ⟶ stalk_o`: the restriction `F(X) → F({o})`. `c ⇒ o`: the sheaf `F(X) = ∅`, `F({o}) = 1` needs a map `1 → ∅`: none | Both orient 2-cells `f_* ⟶ g_*`. The external file builds no 2-category (it cites Stacks 00XB), as the README says | none |
| 2.4 `GeometricMorphism.ofContinuous` (external `IsMorphismOfSites.morphismOfTopoi`, Stacks 00XC) | `G = 𝟭 C`; `G : Discrete (Fin 2) ⥤ Discrete PUnit` with `K` trivial; the same `G` with the empty sieve covering | `𝟭`: both give the identity. Trivial `K`: the pullback is `A ⊕ B`, which is not left exact, so neither applies. Empty cover: `u_s` is exact (one-object target) but `G` is not flat | The fields are the same (`sheafPushforwardContinuous`, `sheafPullback`, `sheafAdjunctionContinuous`). 00XC also covers the empty-cover instance; 2.4 does not | none (remark below) |
| 3.1 `nonempty_sheafOverEquiv` (external `SliceTopos/`, 04IU) | `Discrete {c, d}` with the empty sieve covering `d`; `Type u` over `Bool` | `Sh ≃ Type u`. `ℓ c` is terminal; `ℓ d` is initial (`∅` at `c`). At `c` both sides are `Type u`; at `d` both have one object. `Over Bool ≃ Type u × Type u` | The equivalence holds on each instance; the mapping of `SliceTopos/` to 3.1 is unchanged | none |
| 9.1 `preservesFiniteLimits_sheafPullback_overForget` (external `Topos/LocalizationShriekExact.lean`) | Sierpiński with `U = {o}`; `ℝ` with `U = (0, ∞)`; `Type u` with étale `Bool` | `j_!ℤ` has stalk `ℤ` at `o` and `0` at `c`. At `0 ∈ ℝ`, `j_*ℤ` has stalk `ℤ` and `j_!ℤ` has stalk `0`. On `Type u`, `(A, B) ↦ A ⊕ B` is exact | Exactness agrees with the external file over `C/K`, and the Checks agree with each other | none |

The rows for untouched statements stand as in the previous review, of a0bf576.

- **Gate:** the worker's gate at ff38c29 passes every check, build included. A local run gives 0 on every check except `depcheck: NOT IN ORDER: GrothendieckTopoi (insert it after its last supplier)`, which comes from the public order file and is not a finding; that run prints no build field. With the candidate order and `--movable`: "depcheck: 257 roadmaps, 2433 edges, 0 problem(s)". DiamondEtaleCohomology is on line 83 and GrothendieckTopoi on line 84.
- **Elaboration:** `lake env lean TauCetiRoadmap/GrothendieckTopoi/Suggested.lean` exits 0 with 44 `sorry` warnings and nothing else. Since a0bf576, `Suggested.lean`, `lake-manifest.json` and `lean-toolchain` are unchanged, and nothing outside the folder changed. The elaborated type of `GeometricMorphism.ofContinuous` keeps `[G.IsContinuous J K]` and `[RepresentablyFlat G]`.
- **External repository at c496df0, 14 files opened:**
  - `MorphismOfTopoi.lean`: line 39 (structure), 64 (`id`), 74 (`comp`), 98–99 (`@[stacks 00XC]` `IsMorphismOfSites.morphismOfTopoi`).
  - `ToposDefs.lean`: lines 37–38 (00XA (1)) and 52–53 (00XA (2), `comp`).
  - `TwoMorphismOfTopoi.lean`: lines 54 (04IA) and 182 (04I9).
  - `LocalizationAndMorphismsOfTopoi.lean`: lines 434 (04IU) and 807 (04IW).
  - The `SubterminalSlice*.lean` files (5, no tags), `LocalizationShriekExact.lean`, and README lines 7, 11, 13–14 (the tiers).
  - `lean-toolchain` (v4.35.0), LICENSE (Apache 2.0), and `Subtopos/Embedding.lean` line 37 (`MorphismOfTopoi.IsEmbedding`).
- **Stacks tags and the pinned Mathlib:**
  - Stacks tags read at the site: 00XA is Definition 7.15.1 (morphisms of topoi of sites and their composition); 00XC is Lemma 7.15.2 (a morphism of sites gives `(u_s, u^s)`).
  - Mathlib declarations opened: `Sites/Pullback.lean` lines 56, 60 and 121, `Sites/Continuous.lean` line 358, and `Adjunction/AdjointFunctorTheorems.lean` line 119.
  - The pin has no `IsMorphismOfSites`.
- **Description and seeded sample:**
  - The Provenance paragraph of the description now agrees with the README.
  - "Adds the folder … changes nothing outside it" holds, and "44 `sorry` warnings and nothing else" matches this elaboration.
  - Of the 15 seeded targets, the changed text names 2.1, 3.1 and 9.1, each by number only (rows above).
- Remark (no change asked): 2.4 asks for `RepresentablyFlat G`, whereas Stacks 00XC and SGA 4 IV 4.9 need only that `u_s` be exact; README line 533 calls flatness sufficient. In the empty-cover instance of row 3, 00XC applies and 2.4 does not.
- Remark (no change asked): the existence criterion of 2.1 has no source locator, only its Mathlib route (`isLeftAdjoint_of_preservesColimits_of_isSeparating`).
- Remark (no change asked): ClassifyingTopoi, at its open head, still has the wording that R01 and R02 replaced here (README lines 1409 and 1416).

Overlap check: the change adds no object and no ownership claim. TotallyDistributiveTopoi and ClassifyingTopoi cite GrothendieckTopoi as the owner of what they consume. ToposTheoreticBridges, InfinityTopoi, HypercompletenessAndCoherence, DiamondsAndVStacks and AdicEtaleGeometry stand as read in the review of 46fa6f3: nothing shared. No open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only. I compared 4 passages (the two rewritten README sentences, the R02 clause and the description's Provenance sentence) with 2 sources: Stacks 00XA and 00XC, and the AxiomMath README and module docstrings. They share only standard names ("morphism of topoi", "human-reviewed"). Largest share: SGA 4, 26 of 96 locators, as in the review of 46fa6f3; the change keeps the same tags. No layer was added, removed or reordered, so the contents comparison stands: independent.

## Not verifiable

- SGA 4, the locators of 3.1 (III §5, IV §5), 9.1 (IV 11.3.1–11.3.2) and 2.4 (IV 4.9): it is a paywalled Springer LNM. The sources cache holds only isbell1972, isbell1981 and hofmann-lawson1978, and the manifest has no SGA 4 entry.

## Source issues

- none

## For the human reviewers

- Licence: README line 1634 names AxiomMath, *The Stacks Project in Lean* (Apache 2.0 at c496df0). `Suggested.lean` line 356, `GeometricMorphism.IsEmbedding`, matches its `Subtopos/Embedding.lean` line 37, `MorphismOfTopoi.IsEmbedding`, up to field and namespace names.
- Coordination: the description says AxiomMath's maintainers "have not been contacted about this roadmap". The project README (*Porting existing work*) asks a roadmap that develops the same mathematics independently to cite the existing work and to coordinate where possible.
