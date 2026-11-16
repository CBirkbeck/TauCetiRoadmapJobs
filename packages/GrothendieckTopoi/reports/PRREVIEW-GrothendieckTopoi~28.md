# Review of GrothendieckTopoi (pull request #1520 at 353b75c)

**Verdict:** needs changes

## R01 (P2) — the covering topology of a frame has two owners

**Location:** `TauCetiRoadmap/GrothendieckTopoi/README.md` lines 79–82: "0-topoi and the covering topology of a locale (§18.3) … This roadmap owns the 1-categorical statements and supplies them there: … target 7.1 to its §18.3.1".

**Claim:** The paragraph lists the covering topology of a locale under InfinityTopoi §18.3. But 7.1 defines the same topology (`Frame.grothendieckTopology`, `Suggested.lean` line 553). InfinityTopoi §18.3.1 defines it again and does not take 7.1. The result is one object with two owners.

**Witness:** #2270, `InfinityTopoi/README.md` line 3163: "the Grothendieck topology on the category U", with S covering u when ⋁S = u. *Needs:* (line 3180): §8.1.1, §18.1.1 and Mathlib only. Line 64: "for this Part's own use".

**Repair:** Replace README lines 78–82 with: "The n- and ∞-categorical theory of topoi is InfinityCategoryTheory, InfinityTopoi: its n-categorical Giraud theorem (§§17.5, 19.2, 19.4), 0-topoi (§18.3) and the localic reflection for 0 ≤ m ≤ n ≤ ∞ (§20.2). This roadmap owns the 1-categorical statements: at n = 1, §19.4 recovers Giraud's theorem 1.4 for presentable categories, on nerves, and at m = 0, n = 1, §20.2 recovers the localic reflection of 7.2; InfinityTopoi records both as Examples. The covering topology of a locale is `Frame.grothendieckTopology` of 7.1, owned here; InfinityTopoi §18.3.1 reads the same topology on the nerve `N(U)`."

## R02 (P3) — a supply that InfinityTopoi does not take

**Location:** `TauCetiRoadmap/GrothendieckTopoi/README.md` lines 80–82: "supplies them there: target 1.4 to the case n = 1 of its §19.4, … and target 7.2 to the case m = 0, n = 1 of its §20.2."

**Claim:** InfinityTopoi consumes neither 1.4 nor 7.2. Its n = 1 comparisons are Examples, and its *Needs:* lines name no GrothendieckTopoi target. This README's own Downstream consumers (lines 1625–1634) do not list InfinityTopoi either.

**Witness:** #2270, `InfinityCategoryTheory/README.md` line 15 says each member consumes "only roadmaps above it, Mathlib, Tau Ceti, the ModelCategoryTheory family and DGAInfinity". `InfinityTopoi/README.md` never names GrothendieckTopoi; lines 3415 and 3515 state the n = 1 comparisons as Examples.

**Repair:** Use the replacement paragraph of R01. Its second sentence replaces the supply claim with the specialization, which is true at that head.

## Previous findings

- none: the review of ff38c29 raised no finding.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.4 `isGrothendieckTopos_iff_giraudAxioms` against InfinityTopoi §19.4 at n = 1 | `Type u`; `AddCommGrp` | `Type u`: 1-efficient groupoids are the equivalence relations, effective on both sides. `AddCommGrp`: pulling `0` back along `ℤ → 0` gives `ℤ`, not initial; both reject it | Agree. §19.4 assumes presentability, 1.4 a small separating family: §19.4 at n = 1 is 1.4 for presentable categories | R02 wording |
| 7.1 `Frame.grothendieckTopology` against InfinityTopoi §18.3.1 | one-element frame; `Opens ℝ` with `(−∞,0)`, `(0,∞)`; subspaces of `ℝ²` (not a frame) | ⊥ = ⊤: `sSup ∅ = ⊥` covers; `Sh` degenerate, `Shv(N(U)) = Δ[0]`. ℝ: join `ℝ ∖ {0}`, neither covers. Lines a, b, c: pullback join `{0} ≠ a`; both need a frame | Same rule on the same carrier, defined twice | R01 |
| 7.2 localic reflection against InfinityTopoi §20.2 at (m, n) = (0, 1) | `E = Type u` with `M` the Sierpiński frame `{∅ < {o} < X}`; `B G` with `G` nontrivial | `FrameHom M Prop` = {h_o: {o}↦⊤, h_c: {o}↦⊥}; h_o ≤ h_c in 7.3; (h_o)_*⊥ = ∅ ≤ {o} = (h_c)_*⊥: 2-cell o ⟶ c both sides. `B G`: `Sub 1 = Prop` | Agree, with the same direction of 2-cells | R02 wording |

The rows for untouched statements stand as in the previous review, of ff38c29.

- **Gate:** the worker's gate at 353b75c passes every check, build included.
  - A local run gives 0 on every check except `depcheck: NOT IN ORDER: GrothendieckTopoi (insert it after its last supplier)`. That comes from the public order file and is not a finding.
  - With the candidate order and `--movable`: "depcheck: 261 roadmaps, 2596 edges, 0 problem(s)". The paragraph adds no supplier edge.
- **Elaboration:** `lake env lean TauCetiRoadmap/GrothendieckTopoi/Suggested.lean` exits 0 with 44 `sorry` warnings and nothing else. `Suggested.lean` is unchanged since ff38c29, and `git diff --stat origin/main...HEAD` shows nothing outside the folder.
- **Citations resolved at the head of #2270 (a6d7928):** all six sections exist with the content the paragraph names.
  - InfinityTopoi §17.5 (n-categorical Giraud axioms, line 3067) and §18.3 / 18.3.1 (0-topoi, covering topology, lines 3161 and 3163).
  - §19.2 (n-categorical Giraud theorem, line 3260), §19.4 (characterization of n-topoi, line 3355) and §20.2 (localic reflection for 0 ≤ m ≤ n ≤ ∞, line 3452).
- **Locators:** the changed passage carries no source locator. None of the 15 seeded targets is named by it.
- **Pull request text:** "Adds the folder … changes nothing outside it" and "44 `sorry` warnings and nothing else" hold. The description states no supply to InfinityTopoi, and the change contradicts no sentence of it.
- Remark (no change asked here): InfinityTopoi §18.3.1 restates the topology of 7.1 without citing it. That citation is for InfinityTopoi to add.

Overlap check: the change bears only on InfinityTopoi, which I read at the head of #2270. The covering topology of a frame is GrothendieckTopoi 7.1's, earlier in the order; InfinityTopoi §18.3.1 defines it again (R01). HypercompletenessAndCoherence, also in #2270, leaves classical Deligne to AdicEtaleGeometry A1.15, as this roadmap does. TotallyDistributiveTopoi, ClassifyingTopoi, ToposTheoreticBridges, DiamondsAndVStacks and AdicEtaleGeometry stand as read in the review of ff38c29.

Source independence: changed passages only. I compared 1 passage (README lines 78–82) with the InfinityTopoi text it describes (scope lines 56–64; §§18.3.1, 19.4 and 20.2). They share only standard names ("localic reflection", "0-topoi", "covering topology"), and the passage carries no source locator. The largest share is SGA 4, 26 of 96 locators, unchanged. No layer was added, removed or reordered: contents independent, as before.

Research link: Giraud's and Deligne's theorems (1.4, 6.4) are the topos foundations of étale cohomology (Artin–Grothendieck–Verdier, SGA 4, 1972), and 6.4 relaxes AdicEtaleGeometry A1.15. 6.6 states Caramello's (2012) rigid-topology criterion. 1.4 and 7.2 are the n = 1 cases of Lurie's n-topoi (HTT §6.4, 2009). This rests on the README and the InfinityTopoi README.

## Not verifiable

- SGA 4, the locators of 2.4 (IV 4.9), 3.1 (III §5, IV §5) and 9.1 (IV 11.3.1–11.3.2): it is a paywalled Springer LNM with no manifest entry, and the change does not touch these locators.

## Source issues

- none

## For the human reviewers

- Licence: README line 1639 names AxiomMath, *The Stacks Project in Lean* (Apache 2.0 at c496df0). `Suggested.lean` line 356, `GeometricMorphism.IsEmbedding`, matches its `Subtopos/Embedding.lean` line 37, `MorphismOfTopoi.IsEmbedding`, up to field and namespace names.
- Coordination: the description says AxiomMath's maintainers "have not been contacted about this roadmap". The project README (*Porting existing work*) asks a roadmap that develops the same mathematics independently to cite the existing work and to coordinate where possible.
