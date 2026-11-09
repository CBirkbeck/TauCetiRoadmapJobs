# Review of AlgebraicTopology (pull request #1808 at 01872e7)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/AlgebraicTopology/` at 01872e7. The folder is byte-identical to the heads read by earlier reviews of this pull request: `git diff dc47c7e0 HEAD` on the folder is empty. Every finding below was re-derived at this head. Three are new: R01's build break, R04's statable headline and R05's false Prüfer claim. Two outside facts have changed:

- ComplexKahlerGeometry now takes the ℂPⁿ cell structure from the pinned Tau Ceti (its README lines 81–88 and 340–356), so the earlier "ℂPⁿ cells have no owner" finding is resolved. What remains is folded into R03.
- StableHomotopyKTheory (open pull request #1227) now also names DGFloer as the owner of the Serre spectral sequences (R02).

## R01 (P1) — The six orientation companion files no longer compile, so the repository build fails

**Location.** `TauCetiRoadmap/AlgebraicTopology/OrientationComparison.lean` line 1, `import TauCetiRoadmap.AlgebraicTopology.Suggested`. Line 25 uses `twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x)`; line 58 uses `coordinateSimplexPair m`. The other five files import it: `ChartSimplexLocalImage.lean`, `CompactOrientationLaws.lean`, `GeneralModelOrientation.lean`, `BoundaryInteriorComparison.lean` and `BoundaryCarrierOrientation.lean`.

**Claim.** This pull request rewrote `Suggested.lean` (+359/−2817 lines) and deleted the three definitions these unchanged files use. `lakefile.toml` globs every `TauCetiRoadmap.*` module, and CI runs `lake build`, so the `build` check fails at this head. The worker's gate builds only `TauCetiRoadmap.AlgebraicTopology.Suggested`, which is why it reports `build=0`. The files also break the Lean form rules:

- `set_option maxHeartbeats` and `synthInstance.maxHeartbeats` in `OrientationComparison.lean`, `CompactOrientationLaws.lean` and `BoundaryInteriorComparison.lean`;
- an import of another roadmap's module (`TauCetiRoadmap.DifferentialGeometry.Suggested`);
- 42 `sorry`s outside the acceptance file.

**Witness.** In a scratch file that imports the built `TauCetiRoadmap.AlgebraicTopology.Suggested`, `#check @puncturedPair`, `@coordinateSimplexPair` and `@twistedRelativeHomology` each fail with "Unknown identifier". On main each name is defined once. `lakefile.toml` has `globs = ["TauCetiRoadmap.*"]`; `.github/workflows/ci.yml` has `run: lake build`.

**Repair.** Delete the six files. README Stage 6.3 (lines 1402–1746) already states every construction they carry.

## R02 (P2) — The ordinary Serre and Eilenberg–MacLane machinery has three claimants

**Location.** README lines 113–131: "The ordinary Serre and Eilenberg–MacLane machinery is owned here. Stage 4.8 owns … Stage 5.5 owns … [DGFloer] Layer 1 consumes these ordinary targets".

**Claim.** This folder claims Stages 4.8, 5.0, 5.5, 8.8c and 8.8d: CW approximation and connected maps, the filtered-complex spectral sequence, the homotopy sequence of a fibration, the Serre spectral sequences, the functorial `K(A, n)` and Hurewicz modulo a Serre class. DGFloer on main and at its open head claims the same objects in the opposite direction. StableHomotopyKTheory follows DGFloer.

**Witness.**

- DGFloer main, line 232: "AlgebraicTopology Stage 5.5 … consume these targets".
- DGFloer #1798, line 1048: "Own … the spectral sequence consumed by AlgebraicTopology Stage 5.5".
- StableHomotopyKTheory #1227, line 10: "DGFloer Layer 1 item 2's, which AlgebraicTopology 5.5 consumes".

**Repair.** Keep this folder as the owner: DGFloer's supplier block (line 769 at #1798) consumes AlgebraicTopology Stages 2–8, so DGFloer cannot supply Stage 5.5. Do one of the following:

- Add DGFloer to this pull request and replace its Layer 1 items 2–4 by citations of Stages 4.8, 5.0, 5.5, 8.8c and 8.8d.
- Or state in the description that the DGFloer and StableHomotopyKTheory heads are rebased on this pull request and repoint their citations (StableHomotopyKTheory lines 10, 117 and 1442) to this roadmap.

## R03 (P2) — Theorems already in the pinned Tau Ceti are claimed as this roadmap's own work

**Location.** README:

- line 125, "Stage 8.3 owns the degree-one Hurewicz isomorphism", and line 1938, "own the theorem that the induced map `π₁(X)ᵃᵇ→H₁(X;ℤ)` is an isomorphism";
- line 889, "Own CW approximation: every space, and every pair", with lines 883–887 on weak-equivalence invariance;
- line 2197, "own the general higher-cell killing construction";
- line 343, Stage 1.6 (π₁ of a unital topological magma is abelian);
- line 825, Stage 4.6, "Construct its finite CW structure, with one cell in each dimension";
- lines 1824–1839, Stage 7.2–7.4 (product multiplicativity, finite covers, Mayer–Vietoris additivity, `χ(Sⁿ)`, `χ(Tⁿ)`, `χ(ℂPⁿ)`);
- line 2501, the dependency row "7 Euler characteristic | 2--6 and ComplexKahlerGeometry K7 for CPⁿ".

**Claim.** Each passage states, as a target to be proved here, a theorem the pinned Tau Ceti already proves. Stage 7.4 also takes ℂPⁿ from ComplexKahlerGeometry K7.1–K7.2, while that roadmap consumes Stages 4, 5.0, 6 and 6.3 of this one (ComplexKahlerGeometry README lines 432–439). The two roadmaps therefore supply each other, for a value that is pinned.

**Witness.** All at the Tau Ceti pin 2fd255d9:

- `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv` (`Hurewicz/One/Basic.lean`:705);
- `isWeakHomotopyEquivalence_cwApproximationMap` (`CWApproximation/Basic.lean`:336);
- `IsWeakHomotopyEquivalence.isIso_twistedHomologyMap` (`Singular/Homotopy/WeakHomotopyEquivalence.lean`:169);
- `killHomotopyGroups` (`KillHomotopyGroups.lean`:260–400);
- `FundamentalGroup.instCommGroup` (`FundamentalGroup/TopologicalMonoid.lean`:120);
- `RealProjectiveSpace.cwComplex` (`CWComplex/Classical/RealProjective.lean`:427);
- the Euler characteristics `eulerChar_prod`, `eulerChar_eq_mul_of_isCoveringMap`, `eulerChar_union_add_eulerChar_inter`, `eulerChar_sphere`, `eulerChar_torus` and `eulerChar_complexProjectiveSpace`.

**Repair.** At each location, replace "own"/"construct"/"prove" by consumption of the pinned declaration, and list it in the Inventory with its file. Keep as targets only what the pin lacks:

- CW approximation of a pair and of a space that is not path-connected; the `n`-connected models and Hatcher 4.18;
- tom Dieck 9.5.1's `k`-connected comparison and the cohomology form of invariance;
- the naturality laws of 1.6;
- the transport of the pinned ℝPⁿ cells to `Projectivization ℝ (Fin (n+1) → ℝ)` along the sphere-quotient homeomorphism, and the sign system on ℝP²;
- the bundle formula `eulerChar_totalSpace`.

In Stage 7.4 and the dependency table, cite `eulerChar_complexProjectiveSpace` in place of ComplexKahlerGeometry K7.1/K7.2. This also removes the mutual supply between the two roadmaps.

## R04 (P2) — The 8.11b loop comparison can be stated at the pins, but the docstring says it cannot

**Location.** `Suggested.lean` lines 68–69: "Headline theorems that are not statable at the pins … the loop comparison `K(A, n) → ΩK(A, n + 1)` and the cohomology suspension (Stage 8.11b)". README 8.11b, lines 2386–2388.

**Claim.** The loop comparison is listed as a headline. Every carrier it needs exists at the pins: Mathlib's `LoopSpace`, the pinned `HomotopyGroup.pathLoopSpaceMulEquiv` (`Topology/Homotopy/HomotopyGroup/LoopSpace.lean`:321), `ContinuousMap.IsWeakHomotopyEquivalence` and this file's own `OrdinaryEMModel`. It is a statable headline that is missing.

**Witness.** On a scratch copy this elaborates, with `sorry` the only warning:

```lean
theorem exists_loopComparison (A : Type u) [AddCommGroup A] (m : ℕ)
    (K : OrdinaryEMModel A (m + 1)) (K' : OrdinaryEMModel A (m + 2)) :
    ∃ (f : C(K.space, LoopSpace K'.space K'.point)) (hf : f K.point = Path.refl K'.point),
      f.IsWeakHomotopyEquivalence ∧
      ∀ p : HomotopyGroup (Fin (m + 1)) K.space K.point,
        K'.homotopyIdentification
          (HomotopyGroup.pathLoopSpaceMulEquiv m (HomotopyGroup.map f hf p)) =
          K.homotopyIdentification p
```

**Repair.** Add this statement (or a family version over `NormalizedAbelianEMFamily`) with a docstring, importing `TauCeti.Topology.Homotopy.HomotopyGroup.LoopSpace`. Name it in README 8.11b, and drop "the loop comparison" from the docstring's not-statable list.

## R05 (P2) — Stage 8.8d's Prüfer step is false unless d is prime

**Location.** README lines 2240–2242: "use Prüfer's theorem: a group annihilated by d^k is a direct sum of cyclic groups ℤ/d^j with j≤k".

**Claim.** Prüfer's theorem gives a direct sum of cyclic groups whose orders divide `d^k`. The orders need not be powers of `d`, so the stated decomposition fails whenever `d` is not prime.

**Witness.** Take `d = 4`, `k = 1`, `A = ℤ/2`. Then `4·A = 0`, but `A` is not a direct sum of copies of `ℤ/1` and `ℤ/4`. Likewise `d = 6`, `A = ℤ/2`.

**Repair.** Write "a direct sum of cyclic groups whose orders divide d^k". The argument goes through unchanged: transfer kills `H̃_*(K(ℤ/m, 1))` by `m`, and `m` divides `d^k`. Künneth over a finite product then keeps the exponent at the least common multiple of the orders, which divides `d^k`. The docstring of `hurewicz_mod_isKilledBySomePower` already says it correctly ("a bounded abelian group").

## R06 (P3) — Further pinned constructions are restated as targets

**Location.** README lines 958–963 (5.1: Künneth over a field and the hereditary sequence with its splitting), 965 (5.2 Wang), 967–969 (5.3 transfer and `p_* transfer = d * id`), 1146–1152 (5.6–5.7 Čech), 1173–1189 (6.0: lim¹, the six-term sequence, Mittag–Leffler, cofinal subsequences), 1253–1265 (6.1: the universal-coefficient Ext term, the coefficient sequence and the Bockstein), and lines 540, 667, 737, 743 and 1866 (`coordinateCubeQuotientSphereHomeomorph`, `closedCofibrationCylinderHomotopyExtension`, `basedHomotopyInverseOfEquivalence`, `relativeCylinderCW`, `relativeCWConnectivityOfCellDimension`).

**Claim.** These passages state constant-coefficient results that the pin already has, and they do not cite them.

**Witness.** At the pin:

- `isIso_singularHomologyKunneth_of_projective_homology` and `singularHomologyKunnethSplitting` (`Kunneth/Sequence.lean`:251);
- `wang_exact_total` (`MappingTorus/Wang.lean`:104);
- `homologyMap_singularTransfer_comp_homologyMap` (`Transfer/Degree.lean`:76);
- `cechSpectralSequenceAbutmentIso`;
- the `ModuleTower` lim¹ API with `exact_limMap_connecting` and `exact_connecting_limOneMap`;
- `singularExtToCohomology` and `singularCohomologyBockstein`;
- `cubeQuotientHomeomorphSphere`, `HasHomotopyExtensionProperty.zero_one_prod_univ_union_univ_prod`, `exists_basedInverse_homotopicRel`, `relCWComplexCylinder` and `Relative/CellDimension.lean`:64–136.

**Repair.** Cite each pinned declaration in the Inventory. Keep as targets the extensions the pin lacks:

- the local-coefficient forms;
- the Künneth and Ext spectral sequences over a general ring;
- the integer-graded Milnor sequences and the derived-limit cone;
- the sign normalizations against Stage 2.5.

## R07 (P3) — Two docstrings give false necessity witnesses

**Location.** `Suggested.lean` lines 184–186: "for `(D², S¹)` the relative `π₂` is `ℤ` with the nontrivial action of `π₁(S¹)`". Lines 204–205: "the inclusion of a point into the Poincaré homology sphere is a homology isomorphism".

**Claim.** Both examples are false and witness nothing.

**Witness.**

- `(D², S¹)`: `π₂ ≅ π₁(S¹) = ℤ ≅ H₂`, the abelian `π₁(S¹)` acts trivially, and `π₃ = 0 = H₃`, so the map is bijective throughout.
- Poincaré sphere P: `H₃(P) = ℤ ≠ 0 = H₃(pt)`.

**Repair.**

- For 8.4, use `(S¹ ∨ S², S¹)` with `n = 0`: `π₁(X, A) = 0`, `π₂(X, A) ≅ ℤ[t, t⁻¹]`, `H₂(X, A) = ℤ`, and the Hurewicz map is the augmentation.
- For 8.5, use Hatcher Example 4.35: `S¹ ↪ (S¹ ∨ Sⁿ) ∪ eⁿ⁺¹` is a homology isomorphism that is not bijective on `πₙ` (hatcher lines 16042–16057). Alternatively, use the degree-one map from P to `S³`.

## R08 (P3) — `nonempty_ordinaryEMModel` follows in one term from another headline (padding)

**Location.** `Suggested.lean` lines 284–286.

**Claim.** The statement is the `model` field of `nonempty_normalizedAbelianEMFamily` (line 292).

**Witness.** On a scratch copy, the proof term `⟨(Classical.choice nonempty_normalizedAbelianEMFamily.{u}).model (AddCommGrpCat.of A) n⟩` closes it. The file then elaborates with 13 `sorry` warnings.

**Repair.** Delete it from `Suggested.lean`. The README keeps it as the corollary at line 2159.

## R09 (P3) — Locators and references

**Location and witness.**

- `Suggested.lean` line 280, "Hatcher, Example 4.30": there is no Example 4.30. The construction is Example 4.29 (hatcher line 15863); 4.30 is Proposition 4.30, uniqueness (line 15928).
- README lines 357 and 2582, "Brown, Chapters 6--7": the van Kampen theorem is Section 6.7 (brown line 9392). Chapter 7 is *Cofibrations* (brown line 86).
- README line 1720, `homotopySpherePole`: absent from both pins. The pinned point is `TauCeti.spherePole` (`CWComplex/Classical/Sphere/Basic.lean`:61).
- `## References` has no entry for Farrell–Taylor–Wagoner (cited inline at line 2071), Dugundji (2361), Dowker (2354) or Arens–Eells/Wojdysławski (2358). Its Hatcher line omits Sections 2.A, 4.2, 4.3 and the Appendix, although 2A.1, 4.29–4.37, 4.57, A.3 and A.6 are cited.

**Repair.**

- At line 280, write "Example 4.29".
- Write "Section 6.7".
- Name `TauCeti.spherePole`.
- Add the four works with their locators (FTW Theorem 4.2, Lemma 4.3, Corollary 4.9; dugundji1951 Theorem 4.1), and extend the Hatcher section list.

## R10 (P3) — Names this pull request drops are still cited by other roadmaps

**Location.** These seven names occur in main's README of this roadmap and nowhere at this head: `ordinaryEMUniversalClass`, `ordinaryEMRepresentability`, `ordinaryEMRelativeRepresentability`, `ordinaryEMLoopComparison`, `ordinaryCohomologySuspension`, `projectiveEMComparisons`, `compactReducedSuspensionCarrierComparison`.

**Witness.**

- GeneralizedCohomology at this head (part of this pull request), lines 35, 101, 432 and 2094.
- StableHomotopyKTheory (#1227), line 117.
- DGFloer on main, lines 179 and 1575.

**Repair.** Add one old → new line per name to the README, for example `ordinaryEMRepresentability` → `exists_universalClass_ordinaryEMPullback_bijective` (8.10). Also repoint GeneralizedCohomology's four citations in this pull request.

## R11 (P3) — Stale consumer statements, undefined abbreviations, and an internal inconsistency

**Location and witness.**

- README lines 82–85, 1437, 1552 and 1584: "DG9.3 consumes AT6.3's homological orientation system … RelativeTwistedClassDatum". DifferentialGeometry 9.3 on main (line 872) is de Rham `poincareDuality` "by the induction principle from the base cases 6.2 and 6.4" and uses nothing of 6.3.
- Line 1985, "GT3g and Four": GeometricTopology has no item 3g (its Layer 3 is diffeomorphism groups), and "Four" is never defined.
- "CC" (lines 733, 870, 887, 897, 1391–1396, 2019–2025, 2499 and 2502) is CharacteristicClasses (C1.2a, S0–S5), but the README never says so.
- Line 1860, "State relative groups for NDR pairs/cofibrations", contradicts 8.4 and its headline. Both use the pinned `RelHomotopyGroup` on an arbitrary subspace `B`, which is correct: Hatcher 4.37 (line 16124) needs no cofibration.

**Repair.**

- Drop the DG9.3 claims or name DifferentialGeometry's actual consumption.
- Replace "GT3g" and "Four" by roadmap names and sections.
- Write CharacteristicClasses C1.2a.
- Delete the NDR sentence at line 1860 and the NDR proviso at line 1884.

## R12 (P3) — `Suggested.lean` form: two names missing from the README, and incomplete not-statable reasons

**Location.** `continuousHomotopySetoid` and `continuousHomotopyClasses` (lines 383–389) occur nowhere in the README. Docstring lines 61–69 list the Künneth spectral sequence over a general ring (5.1), the torsion linking pairing (6.5) and the normalized nerve comparison (8.8b) without saying which carrier is missing.

**Repair.**

- Name the two definitions in README 8.10.
- For each of the three not-statable items, state what is missing: the Künneth spectral object of a pair of spaces; the linking pairing, which is a construction; and 8.8a's identification `π₁|N(SingleObj π)| ≅ π`.

## R13 (P3) — Process wording in the README

**Location.**

- Line 1726: "Consume Stage 2, item 5's corrected two-case normalization". This sentence is new in this pull request.
- Lines 1700, 1707 and 1718: "current native generator", "actual choice in the current definition".
- Line 1736: "the present native arbitrary-pole generator".
- Line 458: "adopt the upstream class interface when it lands".

**Repair.** Delete "corrected", "current" and "present". Write line 458 as "consume Mathlib's `BrouwerFixedPoint` class interface".

## R14 (P3) — Edits outside the pull request's folders (gate `outside-folder`, FAIL)

**Location.** `Completed/ArithmeticDirichletSeries/README.md` line 331 and `TauCetiRoadmap/SymplecticGeometry/README.md` line 77, one line each.

**Witness.** The worker's gate at 01872e7 reports `outside-folder=2`, FAIL. The `git diff --stat origin/main...HEAD` command of the brief, excluding the fifteen named folders, lists exactly these two files.

**Repair.** Drop the two hunks, or name both folders as the pull request's own.

## R15 (P3) — Conflicting open heads change this folder, and no order is stated

**Location.** The description's merge-order paragraph: "#1101 (ModularCurves) → #1807 (the other loops) → this pull request". The description never mentions the AlgebraicTopology rewrite (README +842/−433 lines, `Suggested.lean` +359/−2817 lines).

**Witness.** `overlaps.md` lists #1652 and #1663 (another author), #1797 and #1854, and #1187 as conflicting with this head in `AlgebraicTopology/{README.md,Suggested.lean,TopologicalGroupFundamentalGroup.lean}`.

**Repair.** In the description, summarize the AlgebraicTopology changes and state which of #1652, #1663, #1797, #1854 and #1187 is rebased on which.

## Verified sound

**Gate, dependency check, build.**

- **Worker's gate at 01872e7.** Every scanner reports 0 except `outside-folder=2` (R14); `build=0` for the targeted module. R01 is a failure of the full repository build that the targeted build does not see.
- **Dependency check.** Run with the brief's command: `depcheck: 238 roadmaps, 2321 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean TauCetiRoadmap/AlgebraicTopology/Suggested.lean` exits 0. It gives 14 `declaration uses sorry` warnings (lines 92, 116, 135, 171, 187, 206, 221, 229, 284, 292, 315, 350, 367 and 415) and nothing else.
- **Signatures.** On a scratch copy I checked `#check @` for all 26 declarations. Every binder is present (no section variables are used). Each type matches the README's generality: 6.4 compact Hausdorff with `HomologicalOrientation`; 7.2 finite CW type of base, fibre and total space; 8.4 path to `B`, `π₀(B) = π₁(B) = 0` and the pair `(n+1)`-connected; 8.10 every T2 CW `X`.
- **Padding probe.** I replaced each `sorry` by `first | rfl | simp | infer_instance | aesop | trivial | exact Function.bijective_id`. The copy exits 0 with all 14 `sorry`s surviving. Only R08 is padding, and it is redundant with another headline rather than closed by one library tactic.
- `TopologicalGroupFundamentalGroup.lean` elaborates with no warning. Its content is pinned (R03).

**Seeded sample.** The worker found no target by heading, so I chose 15 targets from the README and the Lean file and read each in the cache.

| # | target | locator | text read | result |
| --- | --- | --- | --- | --- |
| 1 | 8.3 degree-one Hurewicz | Hatcher Thm 2A.1 | hatcher 7230–7233 | supports, for path-connected X |
| 2 | 3 small chains | Hatcher Prop 2.21 | hatcher 5222–5224 | supports |
| 3 | 4.5 cylinder HEP | Strøm Thm 6 | strom1972 181–185 | the product of cofibered pairs with A closed is cofibered: supports |
| 4 | 4.5 tower normality | Hatcher Prop A.3 | hatcher 22617 | supports |
| 5 | 4.5 based inverse | Hatcher Prop 0.19 | hatcher 867–869 | supports (common A = point) |
| 6 | 4.5 Kelley product | Hatcher Thm A.6 | hatcher 22693–22697 | supports, including the locally compact case |
| 7 | 6.3 compact support | Hatcher Lemma 3.27 | hatcher 10255–10259 | constant coefficients; the local-system form is this roadmap's |
| 8 | 6.3 vanishing above dimension m | Hatcher Prop 3.29 | hatcher 10370–10371 | supports the route |
| 9 | 6.4 triad duality | Hatcher Thm 3.43 | hatcher 10976–10982 | supports |
| 10 | 6.4 headline | Hatcher Thm 3.30 | hatcher 10453–10455 | supports |
| 11 | 8.4 headline | Hatcher Thm 4.37 | hatcher 16124–16126 | π′ is π modulo the π₁(A)-action, equal to π when A is simply connected: supports |
| 12 | 8.5 headline | Hatcher Cor 4.33 | hatcher 16001–16006 | CW form; the weak-equivalence form uses the same proof |
| 13 | 8.5 proper Whitehead | FTW Thm 4.2, Lemma 4.3, Cor 4.9 | ftw1973 600–614, 752–756 | supports |
| 14 | 8.8c existence | Hatcher "Example 4.30", Lemma 4.31 | hatcher 15863, 15928, 15931–15935 | Lemma 4.31 supports; Example 4.30 wrong (R09) |
| 15 | 8.10 headline | Hatcher Thm 4.57 | hatcher 17069–17071 and 17083–17088 | supports, including unbased classes for abelian G |

I also read Milnor 1959 Thm 3 (milnor1959 209–212: compact source, compact-open topology; supports 8.11a), Hatcher 4.6, 4.13 and 4.18 (hatcher 15116, 15375, 15454; 4.8 matches), Hatcher VBKT §3.3 (hatcher-vbkt 35–37), Brown 6.7 versus Ch. 7 (R09), and Hatcher SSAT Thm 1.8 (hatcher-ssat 849–850, the mod-C isomorphism; corroborates 8.8d apart from the degree-(n+1) epimorphism).

**Adversarial table.**

| statement | instances tried | values computed on each side | result | change |
| --- | --- | --- | --- | --- |
| `compactlyGeneratedToTop_isLeftAdjoint` (4.5) | X uncountable with the cocountable topology; X compact T2 | compact subsets finite, kX discrete, counit a bijection but not a homeomorphism; kX = X | true; not at the pins (only the condensed `compactlyGeneratedAdjunction`, Mathlib `Condensed/TopCatAdjunction.lean`:175) | none |
| `bijective_singularCap_fundamentalClass` (6.4) | M=∅; n=0, M = k points; S², p=0,1,2; M=ℝ; ℝP² | 0→0; ℤᵏ→ℤᵏ; ℤ→ℤ, 0→0, ℤ→ℤ; H⁰=ℤ vs H₁=0 (excluded by compactness); H⁰=ℤ vs H₂=0 (excluded: no orientation) | hypotheses exactly needed | none |
| `eulerChar_totalSpace` (7.2) | Hopf S³→S²; Klein bottle→S¹; S²×S²; antipodal mapping torus over S¹; B=∅ | 0=2·0; 0=0·0; 4=2·2; 0=0·2; 0=0·χF | holds with monodromy | none |
| `lsCupLength_add_one_le_lsCategoryCount` | point; Sⁿ; T²; zero ring; ℝPⁿ over 𝔽₂ | 0+1≤1; 1+1≤2; 2+1≤3; 0+1≤count; n+1≤n+1 | holds; equality for ℝPⁿ | none |
| `bijective_relativeHurewicz_of_simplyConnected` (8.4) | (D³,S²), n=1; (D²,S¹); (S¹∨S², S¹), n=0 | π₃=π₂S²=ℤ=H₃; π₂=ℤ=H₂ and bijective; π₂=ℤ[t,t⁻¹]→ℤ by augmentation | statement right; docstring witness wrong | R07 |
| `isWeakHomotopyEquivalence_of_isIso_singularHomologyMap` (8.5) | pt→P (Poincaré sphere); S¹↪(S¹∨S²)∪e³; id S³ | H₃: 0 vs ℤ, so not a homology iso; homology iso but π₂ not iso and S¹ not simply connected; trivial | statement right; docstring witness wrong | R07 |
| `finiteCWType_of_compactSpace_of_isManifold(_halfSpace)` (8.7) | n=0, finite discrete M; M=∅; S¹; [0,1] (half-space, n=1) | finite CW in each case | true; needs GeometricTopology's triangulation (main, line 930, item 1) | none |
| `OrdinaryEMModel` | S¹, A=ℤ, n=1; S², A=ℤ, n=2; ℝP^∞, A=ℤ/2 | satisfies; fails `vanishing` at j=3 (π₃S²=ℤ); satisfies | discriminates | none |
| `NormalizedAbelianEMFamily` | ×2 on ℤ, n=1; ℤ→0 | degree-2 self-map of S¹, π₁ multiplied by 2; constant map | strict laws hold | none |
| `nonempty_ordinaryEMModel` vs family | scratch proof term | closes from `nonempty_normalizedAbelianEMFamily` | redundant | R08 |
| `exists_ordinaryEMModel_iso_doldKanRealization` | A=0; A=ℤ, degree 2 | Γ(0)=point; Γ(ℤ[2]) has one vertex and π₂=ℤ | true for n+2≥2 (also for degree 1; README covers it) | none |
| `hurewiczInt`, `IsSerreIso`, `IsSerreEpi` | f=0 on ℤ; f=×2; class `isKilledBySomePower 3` | ker ℤ: not a torsion-iso; ker 0, coker ℤ/2: torsion-iso; ℤ/2 not killed by any 3ᵏ | discriminate | none |
| `hurewicz_mod_isTorsion` (8.8d) | n=0; S³, n=1; S², n=1 | H₁=0, h₂ iso; π₃=ℤ≅H₃, π₄=ℤ/2→H₄=0 epi; π₂=ℤ not torsion (excluded) | agrees with Serre / SSAT 1.8 | none |
| `hurewicz_mod_isKilledBySomePower` | d=1; d=2, X=K(ℤ/4,2), n=0 | ordinary Hurewicz with h₃ onto; h₂: ℤ/4≅H₂ | holds | none |
| 8.8d Prüfer step | d=4, A=ℤ/2; d=6, A=ℤ/2 | 4A=0 but A ≠ ⊕ℤ/4ʲ; likewise for 6 | false as written | R05 |
| 8.8d fixed dᵐ not a class | 0→ℤ/2→ℤ/4→ℤ/2→0, d=2, m=1 | 2·(ℤ/4)≠0 | README right | none |
| `exists_universalClass_ordinaryEMPullback_bijective` (8.10) | m=0: X=S¹, X=∅, X=S⁰, X=ℝP^∞ with A=ℤ/2; m=1, X=S² | ℤ=H¹; 1 class = 0; 1 class = 0; ℤ/2=H¹; ℤ=H² | holds, unbased (hatcher 17083–17088) | none |
| 8.11b loop comparison statable | scratch statement (R04) | elaborates, exit 0 | statable | R04 |
| 8.11b cone signs at n=0 | X=I, B=∂I, a = indicator of 1 | δa = +1 on [I,∂I]; c_AT*σ_right = −1 on the loop; c_G*σ_left = +1 | δ=(−1)^(n+1)c_AT*σ_right and δ=c_G*σ_left both hold | none |
| 5.0 reindexing | (p,q)=(0,0),(2,1); cohomological (1,2) | (1,−1) deg 0; (−4,1) deg −3; (5,−2) deg 3; i₁=b, i₂=b+1 as in Mathlib `coreE₂Cohomological` (`HasSpectralSequence.lean`:143–148) | consistent | none |
| 4.6/6.1/6.3 ℝP² sign system | cellular d and δ | twisted d₁=±2, d₂=0; δ⁰=±2, δ¹=0, so H⁰=0, H¹=ℤ/2, H²=ℤ; constant H₂=0, H₁=ℤ/2, H₀=ℤ | duality check consistent | none |
| 6.3 ordered simplex | m=1, m general | edge matrix I+J, det 2 and m+1>0; barycentre 0 | right | none |
| 6.3 boundary sign | m=1, m=2 | (−1)^(m−1)·(−1)=(−1)^m; ∂[D¹]=[+1]−[−1]; D² counterclockwise | right | none |
| 6.5 linking symmetry | n=3, i=1 | (i+1)(n−i)=4: symmetric form, matching (p+1)(q+1) with p=i, q=n−i−1 | right | none |
| 8.8c indiscrete colimit | S¹ under z↦z² | open saturated V is invariant under all 2ᵏ-th roots of unity (dense), so V is ∅ or S¹ | right | none |
| Serre/EM ownership | AT lines 113–131; DGFloer main 232; DGFloer #1798 60–69, 1048; StableHomotopyKTheory #1227 line 10 | AT owns vs DGFloer owns, AT consumes | three claimants | R02 |
| pinned theorems | README lines 125, 343, 825, 889, 1824–1839, 1938, 2197 vs the pin | "own"/"construct" vs pinned declarations | duplicated | R03, R06 |
| companion files | `#check @puncturedPair` against the new `Suggested` | Unknown identifier | build broken | R01 |

**Library declarations opened at the pins** (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9):

- `RelHomotopyGroup` and `RelGenLoop` (dimension convention `Fin k` ↦ π_(k+1));
- `hurewiczIntHom` (`Relative/Hurewicz.lean`:388), `bijective_hurewicz_of_subsingleton_homotopyGroup` (`Hurewicz/Relative.lean`:282);
- `HomologicalOrientation` (`Orientation/Homological.lean`:75), `fundamentalClass` (`FundamentalClass.lean`:204);
- `LSCategoricalCover` and `lsCategoryCount` (`LusternikSchnirelmann.lean`:84, 264);
- `isTorsion` and `isKilledBySomePower` (`SerreClass/`), `IsLocallyCollared.isCollared` (`Collar/Brown.lean`:459);
- `pathLoopSpaceMulEquiv`, `exists_isEilenbergMacLaneSpaceOne`, `DoldKan/HomotopyGroups.lean`;
- Mathlib `compactlyGeneratedToTop` and `coreE₂Cohomological`;
- every R03/R06 witness.

A script checked 158 of the 162 dotted backticked names in the README and `Suggested.lean` against declarations at the pins. The remaining four are module paths that exist (`ContCohomology.*`, `Twisted.Relative`) or a file link (`README.md`). `homotopySpherePole` is absent (R09). Hurewicz modulo C, `IsSerreIso`, compactly supported singular cohomology, twisted cellular chains and the k-coreflection are absent at the pins, so those docstring claims are correct.

**Cross-roadmap citations resolved.**

- ClassifyingSpaces Layer 1 items 1.1–1.3: present at this head (its README lines 531–761). ClassifyingSpaces consumes nothing of this roadmap (its line 93), and #1807 is named in the description.
- CharacteristicClasses C1.2a S0–S5: present (its lines 585–597).
- ComplexKahlerGeometry K7.2: pinned ℂPⁿ (R03).
- DifferentialGeometry 9.3: main line 872 (R11).
- GeometricTopology smoothing-and-triangulation item 1: main line 930.
- DGFloer: main and #1798 (R02).
- GeneralizedCohomology lines 35, 101, 432, 2094 (R10).

**Ownership against open pull requests.** I searched by object (cup length, EM models, Hurewicz mod C, the k-coreflection, homological Whitehead, the Euler bundle formula) across main and the 468 open heads:

- MorseTheory (#1682) consumes the cup length.
- HomotopySpheres (#1287) consumes Whitehead and the coreflection, and is not cited here.
- DGFloerPartII (#1799) consumes the coreflection.
- Only the Serre/EM objects have a second owner (R02).
- No `Suggested.lean` declaration repeats a fully qualified name from another roadmap.

## Not verifiable

- Serre 1953, Théorème 1 (README 2252; `Suggested.lean` 344 and 362): Annals 58, paywalled, settled as uncertified. Hatcher SSAT Thm 1.8 confirms the mod-C isomorphism but not the degree-(n+1) epimorphism.
- tom Dieck 9.5.1, Weibel 5.5.1(2) and 5.5.10, Milnor *Morse Theory* Lemmas 3.6–3.7, Freedman–Quinn 7.7, Dowker 1952: paywalled or book-only, uncertified in the manifest.
- May 1967: fetched as an image-only scan, which this worker cannot read (no OCR).
- Eilenberg–Steenrod, G. W. Whitehead, Dold, McCleary, K. Brown: cited at chapter level, not in the cache.

## Source issues

- none
