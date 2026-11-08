# Review of AlgebraicTopology (pull request #1663 at a6488e3)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/AlgebraicTopology/README.md` (2970 lines) and `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` (516 lines). The folder changed by 892 lines since `9c71949`.

The repair follows the previous review's R02: Tau Ceti's Brouwer, transfer, tower, Lusternik–Schnirelmann, CW-type, Hurewicz and Whitehead theorems are now consumed rather than restated. But it skips R01, the merge of main that those citations need. The branch still builds against Tau Ceti `358314d4`, where none of the 81 newly cited native names exist. The branch still conflicts with main.

At `358314d4`:
- the gate passes;
- the dependency check prints no problem;
- the file elaborates with `sorry` as its only warning;
- no headline closes in one tactic;
- the 15 sampled locators read as cited.

## R01 (P2) — The README and the `Suggested.lean` docstring cite 81 Tau Ceti declarations that exist only at main's pin; the branch still pins `358314d4` and conflicts with main

**Location.**
- `Suggested.lean` lines 39–56: "Not stated, because Tau Ceti proves them at the pin: … the Brouwer fixed-point theorem … (Stage 2.7; `TauCeti.brouwerFixedPoint_compactConvex` …)".
- Also `Suggested.lean` lines 33–37, 58–69, 176–177, 259 and 340–341.
- `README.md`, the Inventory: lines 277, 285–305, 349 and 362–456.
- `README.md`, the stage items:
  - Stages 2–4: 596–612, 683 and 844–849;
  - Stage 5: 1131–1161 and 1185–1196;
  - Stage 6: 1236–1250, 1361–1373, 1386 and 1537–1544;
  - Stages 7–8: 1962, 1981–2019, 2051–2087, 2190–2191, 2395 and 2622–2624.

**Claim.** The pinned Tau Ceti proves these results. On that basis `Suggested.lean` drops seven headlines it stated at `9c71949`:
- the Brouwer theorem;
- the cellular comparison in arbitrary dimension;
- the cylinder homotopy extension property;
- the finite-cover transfer;
- the connectivity of a relative CW complex;
- absolute Hurewicz;
- Whitehead.

This is the previous review's R01, not repaired and now extended. The previous review's repair was to merge `origin/main` first, then make R02's changes.

**Witness.** `lake-manifest.json` still pins Tau Ceti `358314d4`. There, `grep -rw` finds none of the 81 backticked names (e.g. `HomotopyGroup.bijective_hurewicz`, `TauCeti.CWType`, `TauCeti.MappingTorus.wangδ`). All exist at main's `2fd255d`. `git merge-tree HEAD origin/main` reports three conflicts.

At the pin the branch builds against:
- seven of the nine items in the docstring's "Tau Ceti proves them" list are false;
- the seven deleted headlines are statable there (their previous forms elaborated) and are absent.

**Repair.** Merge `origin/main` into the branch, resolving the three conflicts:
- keep this branch's deletion of `GeneralModelOrientation.lean` and `TopologicalGroupFundamentalGroup.lean`;
- keep this head's `Suggested.lean`.

The manifest then pins Tau Ceti `2fd255d`, Mathlib `1b1ccf4b` and Lean v4.36.0-rc2. Elaborate `Suggested.lean` there and re-run the gate. I checked every cited name at `2fd255d`, with file and line (see Verified sound). I could not elaborate there, because this review may run Lean only at the worktree's pin.

The alternative keeps `358314d4`:
- delete the 81 names;
- restore the seven headlines;
- name in the docstring the theorems whose carriers are absent at that pin.

That route leaves the conflict with main in place.

## R02 (P2) — The relative Hurewicz theorem of 8.4 is neither stated nor named as not statable

**Location.** `README.md` lines 2068–2077: "If `A` and `X` are simply connected and `pi_i(X,A)=0` for `i<n`, prove … that relative Hurewicz is an isomorphism in degree `n` (Hatcher, Theorem 4.37, p. 371, with `A` simply connected)". `Suggested.lean` lines 18–79, the module docstring.

**Claim.** Scope item 6 (README line 41) makes relative Hurewicz a headline. The `9c71949` docstring listed it as not statable, citing "no relative homotopy-group carrier". This head deletes that entry but states nothing in its place.

**Witness.**
- **At `358314d4`.** The carrier is still absent, so the docstring omits a headline that is not statable.
- **At `2fd255d`, where the README now points.** `TauCeti.RelHomotopyGroup` (`AlgebraicTopology/Homotopy/Relative/Basic.lean` 302) and `TauCeti.RelHomotopyGroup.hurewicz` (`Relative/Hurewicz.lean` 324) make it statable.
- **The native theorem is narrower.** `bijective_hurewicz_of_subsingleton_homotopyGroup` (`Hurewicz/Relative.lean` 282) needs `π₂(S²)` trivial for `(D³, S²)` in degree 3. 8.4 needs only simple connectivity there, and `π₃(D³,S²) ≅ π₂(S²) = ℤ ≅ H₃(D³,S²)`.

**Repair.** After R01's merge, state the following, and quote the same statement in 8.4:

```lean
theorem relativeHurewicz_bijective_of_simplyConnected {Y : Type} [TopologicalSpace Y]
    (B : Set Y) (b : B) [SimplyConnectedSpace B] [SimplyConnectedSpace Y] (n : ℕ)
    (hrel : ∀ k ≤ n, Subsingleton (TauCeti.RelHomotopyGroup (Fin k) ⟨TopPair.ofSubset B, b⟩)) :
    Function.Bijective fun a : TauCeti.RelHomotopyGroup (Fin (n + 1)) ⟨TopPair.ofSubset B, b⟩ ↦
      (TauCeti.RelHomotopyGroup.hurewicz (ModuleCat.of ℤ ℤ) (n + 1) a).hom 1
```

Check it on `(D³, S²)` with `n = 1`. This was not elaborated, for the reason given in R01.

If the branch stays at `358314d4`, add "relative Hurewicz (no relative homotopy-group carrier)" to the docstring's list of theorems that are not statable.

## R03 (P3) — At main's pin, Stage 8 plans or takes from DGFloer three results that Tau Ceti proves

**Location.**
- `README.md` lines 2060–2062: "Own the vanishing of reduced integral homology below `n` for an `(n-1)`-connected pointed space".
- Lines 2255–2256: the compact case of 8.7, routed through GeometricTopology's triangulation.
- Line 123 ("its CW approximation is used in 8.11b") and lines 2504–2505 ("consume DGFloer 1.2's CW approximation").

**Claim.**
- 8.3 owns the vanishing.
- 8.7's compact case needs only the triangulation.
- CW approximation has to come from DGFloer.

**Witness.** At `2fd255d`:
- `TauCeti.isZero_singularHomologyFunctor_of_subsingleton_homotopyGroup` (`AlgebraicTopology/Singular/Cubical/Based/Retraction.lean` 383). If `π_k` is trivial for every `k < n`, then `H_m = 0` for `0 < m < n`, for any ring and any universe.
- `TauCeti.IsTriangulable.finiteCWType` (`Topology/Triangulable/FiniteCWType.lean` 41): a compact triangulable space has finite CW type.
- `TauCeti.isWeakHomotopyEquivalence_cwApproximationMap` (`Homotopy/CWApproximation/Basic.lean` 336): CW approximation of a path-connected space.

**Repair** (with R01's merge).
- Delete the vanishing claim from 8.3 and cite the theorem in the Inventory; 8.3 keeps the passage to every universe for the Hurewicz isomorphism.
- In 8.7, route the compact case through `TauCeti.IsTriangulable.finiteCWType`, applied to GeometricTopology's triangulation.
- Cite `TauCeti.cwApproximationMap` with its weak-equivalence theorem at lines 123 and 2505. Keep DGFloer only for spaces that are not path connected, such as `ΩK(A,1)`, whose components are `A`.

## R04 (P3) — MorseTheory consumes from Stage 6 a carrier `normalizedLSCategory` that this roadmap no longer names

**Location.** `README.md` lines 1376–1382: "On a nonempty space define the normalized category as the unnormalized count of the whole space minus 1". The Lusternik–Schnirelmann supplement, lines 1359–1435.

**Claim.** The supplement still provides every carrier its consumers cite.

**Witness.** MorseTheory's README on main (line 510) consumes from AlgebraicTopology Stage 6 "the same `LSCategoricalCover`, `lsCategoryCount`, `normalizedLSCategory` and `lsCupLength` carriers". In this head `normalizedLSCategory` occurs nowhere. The two count carriers are now Tau Ceti's `TauCeti.LSCategoricalCover` and `TauCeti.lsCategoryCount`.

**Repair.** Name the normalized category at lines 1376–1378: "define `normalizedLSCategory X` as `TauCeti.lsCategoryCount X univ − 1`". Under Scope and ownership, add one line saying that the cover and count carriers moved to Tau Ceti under those names, so that MorseTheory can follow.

## R05 (P3) — The order against five conflicting open revisions of this folder is still unstated

**Location.** The pull request description, which still says "Previous roadmap content and dependency pins are preserved" and validates two companion files this branch deleted. Consumption of "CC C1.2a's S0–S4" in `README.md` lines 1449, 1458, 2177–2179, 2848 and 2851.

**Claim.** This is the previous review's R03, not repaired: another open pull request changes this roadmap with a conflicting head and no stated order.

**Witness.** `overlaps.md` lists #1187, #1652, #1797, #1807, #1808 and #1854 as conflicting with this pull request in `README.md` or `Suggested.lean`. At #1854's head (1ccc517, README line 2900), this roadmap owns the compactly supported local-coefficient cochains, and CharacteristicClasses C1.2a consumes them. This head consumes C1.2a S0–S4.

**Repair.**
- State in the description which of #1652, #1797, #1807, #1808, #1854 and #1187 this branch follows, and rebase onto it before either merges.
- If #1854 goes first, replace the C1.2a S0–S4 consumption at the lines above with that ownership.
- Remove the companion-file validation sentence.

## R06 (P3) — The compact-support headline is stated only for smooth, second-countable manifolds, narrower than its source and its untwisted native form

**Location.** `Suggested.lean` lines 254–272: `compactSupportTopClass_existsUnique (R : Type) … [T2Space M] [SecondCountableTopology M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M] [IsManifold … ∞ M]`. `README.md` lines 1524–1536.

**Claim.** The local-coefficient compact-support lemma needs a smooth second-countable manifold.

**Witness.**
- Hatcher Lemma 3.27 (`hatcher` line 10255, p. 236) is stated for topological manifolds.
- The native constant-coefficient form at `2fd255d`, `TauCeti.existsUnique_localHomologyRestriction_eq_of_isCompact` (`Singular/LocalHomology/Compact.lean` 328), assumes only `T2Space` and `ChartedSpace E M`.
- The long line satisfies those two and is excluded by the headline.

**Repair.** Delete `[SecondCountableTopology M]` and the `IsManifold` binder. Say "Hausdorff topological `m`-manifold" in the docstring and at README line 1525. The modified file elaborates at `358314d4`: exit 0, with the 13 `sorry` warnings only.

## Previous findings (review of `9c71949`)

- **R01** (Tau Ceti names absent at the pin; the branch does not merge into main): **not repaired**. The manifest is unchanged, and the absent names grew from 25 to 81 (see R01).
- **R02** (eight headlines and seven definitions restate main's Tau Ceti; four "not statable" reasons false): **repaired as written, but at the wrong pin**.
  - Repaired:
    - the eight headlines and seven definitions are deleted;
    - 2.7, 4.3, 4.5, 5.3, 6.0, 6.2, 8.1 and 8.3–8.5 consume the natives by the names the repair listed;
    - the docstring drops spectral-sequence carriers, absolute Hurewicz and Milnor `lim¹` from the list of theorems that are not statable;
    - `lsCupLength_add_one_le_categoryCount`, `properStrongDeformationRetract_of_inverse` and `finiteSourceMappingCWType` restate the native predicates' defining conditions as binders, equivalently (checked against `LusternikSchnirelmann.lean` 84, `Proper.lean` 41 and `CWType.lean` 38 at `2fd255d`).
  - Not repaired: the merge it presupposed (R01). The list of theorems that are not statable now omits relative Hurewicz (R02 here).
- **R03** (order against conflicting revisions): **not repaired**; carried as R05.
- **R04** (misnamed native declaration; Strøm and Milnor locators): **repaired**.
  - Line 312 reads `TauCeti.exists_iterate_singularSubdivision_factor_small`.
  - Lines 384–385 and 847–849 cite Strøm, Theorem 6, p. 135.
  - Line 843 cites Milnor, *Morse Theory*, §3, Lemmas 3.6–3.7.
  - References lines 2937–2940 list both works.
  - `Suggested.lean` lines 175–177 give Brown's locator, with Tau Ceti's cylinder theorem as the route.

## Verified sound

**Gate and dependency check.** The worker's gate at `a6488e3` reports every scanner 0 and `build=0`; my re-run agrees (`OK`). The dependency check (`gate --depcheck … --movable`) prints:

```
depcheck: 237 roadmaps, 2341 edges, 0 problem(s)
```

It prints no UPWARD, CYCLE or `moved:` line; this roadmap is on main. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicTopology'` is empty. The folder holds `README.md`, `Suggested.lean`, `STATUS.md`, `PROGRESS.md` and `metadata.toml`.

**Elaboration.** `lake env lean` on `Suggested.lean` from the worktree, at Tau Ceti `358314d4`, Mathlib `f6090c70`, v4.35.0-rc3: exit 0 in 38 s. The output was exactly 13 `declaration uses sorry` warnings (lines 165, 179, 261, 313, 342, 357, 380, 393, 422, 448, 471, 486, 505) plus the nine `#check` outputs.

Form:
- `module`, `public import Mathlib` and 14 `public import TauCeti.*` lines, all present and built at the pin;
- one module docstring;
- `namespace TauCetiRoadmap.AlgebraicTopology`;
- `theorem` only, no `lemma`;
- no `set_option`, no sorried data;
- `#check` only on library declarations.

All 36 declarations occur in the README.

**`#check @` pass.** A scratch copy with `#check @` for all 36 declarations (13 theorems, 23 definitions, abbrevs, structures and one inductive) elaborated. Every binder the README states is in the elaborated type:
- `compactSupportTopClass_existsUnique`: `T2Space`, `SecondCountableTopology`, the Euclidean `IsManifold` (R06);
- `poincareDuality_of_fundamentalClass`: `CompactSpace`, `T2Space`, `hp : p ≤ n`;
- `lsCupLength_add_one_le_categoryCount`: `[Nonempty ↑X]`;
- `properStrongDeformationRetract_of_inverse`: `T2Space`, `LocallyCompactSpace`, `hH`, `hK`;
- `finiteSourceMappingCWType`: `CompactSpace X`, `T2Space X`, `T2Space Y`, `T2Space Z`;
- `exists_transverse_circle_classifying_map`: `FiniteDimensional ℝ E`, `I.Boundaryless`, `T2Space`, `SecondCountableTopology`, `CompactSpace`;
- `homologicalWhitehead`: both `SimplyConnectedSpace` and `CWComplex` instances.

No binder was lost.

**One-tactic probe.** In the same copy every `sorry` became `first | rfl | trivial | infer_instance | (simp_all; done) | aesop | sorry`. None of the 13 theorems closes: 6 fall through to `sorry`, and 7 end with aesop's "failed to prove the goal". No declaration restates a definition, mirrors a Check or computes a value.

**Library declarations opened at main's pin `2fd255d`** (the pin the README now cites; file and line):
- `HomotopyGroup.bijective_hurewicz` (`Homotopy/Hurewicz/Absolute.lean` 161, `X : Type`, `π_k` trivial for `k < n+2`).
- `TauCeti.RelHomotopyGroup.bijective_hurewicz_of_subsingleton_homotopyGroup` (`Hurewicz/Relative.lean` 282).
- `ContinuousMap.IsWeakHomotopyEquivalence` (`Topology/Homotopy/HomotopyGroup/WeakHomotopyEquivalence.lean` 78, including the `n = 0` and path-surjectivity fields), with `homotopyEquiv` and `homotopyEquiv_toFun` (`Homotopy/Whitehead.lean` 243, 263, under `[CWType X] [CWType Y]`).
- `TauCeti.CWType` (`Topology/CWComplex/Classical/CWType.lean` 38), with `of_cwComplex_univ` (72) and `ContinuousMap.HomotopyEquiv.cwType` (55).
- `ContinuousMap.HasProperHomotopyInverse` (`Topology/Homotopy/Proper.lean` 41).
- `TauCeti.LSCategoricalCover` and `lsCategoryCount` (`Topology/Homotopy/LusternikSchnirelmann.lean` 84, 264).
- The six Brouwer and no-retraction theorems (`Singular/BrouwerFixedPoint.lean` 71–159; `finiteSpan` takes an arbitrary normed space and a finite-dimensional submodule).
- `TauCeti.HasHomotopyExtensionProperty.prod_univ_union_univ_prod`, `univ_prod` and `zero_one_prod_univ_union_univ_prod` (`Topology/Homotopy/Extension/Prod.lean` 58, 65, 72).
- The transfer:
  - `IsCoveringMap.singularTransfer_comp_chainComplexMap_eq_locallyConstantNsmul` (`Transfer/Degree.lean` 42);
  - `singularTransfer_comp` (`Composition.lean` 42);
  - `singularChainComplexPermutationIso` (`PermutationLocalSystem.lean` 207);
  - `IsQuotientCoveringMap.isColimitMapCoconeSingularChainComplex` and `…Homology` (`Singular/Coinvariants.lean` 120, 128; the latter with `IsIso (card G • 𝟙 R)`, as README line 1155 says).
- The towers:
  - `TauCeti.ModuleTower` (`Tower/Basic.lean` 78);
  - `shift_surjective_of_isMittagLeffler` (`MittagLeffler.lean` 166);
  - `limOneSubsequenceEquiv` (`Subsequence/LimOne.lean` 280);
  - the four `ComplexTower` Milnor theorems (`Milnor/Basic.lean` 311, 501, 518, 532);
  - `homotopyLimitFunctor` (`DerivedLimit.lean` 122).
- The connectivity theorems:
  - `subsingleton_relHomotopyGroup_of_isEmpty_cell`, `surjective_…` and `injective_…` (`Relative/CellDimension.lean` 64, 77, 90, with `k + 1 < n`, `k < n` and `k + 1 < n` as README lines 442–445 say);
  - the three `…_of_comp_eq` forms (110, 124, 136).
- `TauCeti.eulerChar_torus` (`EulerCharacteristic/Torus.lean` 50: `[Finite ι] [Nonempty ι]`, periods `NeZero`, as line 1962 says).
- The cellular comparisons (`Cellular/Comparison.lean` 219, 227).
- The local-homology natives (`LocalHomology/Compact.lean` 242, 328, 341).
- `TauCeti.isZero_singularHomologyFunctor_of_subsingleton_homotopyGroup`, `TauCeti.IsTriangulable.finiteCWType` and `TauCeti.isWeakHomotopyEquivalence_cwApproximationMap` (R03).

Every one of the 81 names absent at `358314d4` resolves at `2fd255d`. The two leads in `citations.md` are module paths that exist there: `AlgebraicTopology/Singular/BrouwerFixedPoint.lean` and `AlgebraicTopology/Homotopy/Relative/CellDimension.lean`.

**Cross-roadmap citations resolved on main (`b67091a7`).**
- CharacteristicClasses C1.2a S0–S5 (lines 512–524), with its sentence that the supported-cellular supplement consumes S0–S4 (66–68).
- DGFloer Layer 1 item 2 consuming native `TauCeti.TopCat.serreFibrations` (140, 230).
- BanachAlgebras 8.2 (line 1962), which consumes "AlgebraicTopology Stage 2, item 7 finite-span Brouwer". That item still exists and names `TauCeti.brouwerFixedPoint_compactConvex_finiteSpan`.
- DifferentialGeometry 10.5 (line 890).
- ClassifyingSpaces lines 74–77.

No other roadmap on main or at the open heads cites the deleted Lean names `whitehead_homotopyEquiv`, `relativeCWConnectivityOfCellDimension`, `CWTypeModel`, `finiteCover_transfer_exists`, `regularCover_push_transfer` or `closedCofibrationCylinderHomotopyExtension` (`roadmaps grep` and grep on main). The one dropped prose name that is cited is R04.

**Overlaps.** I checked each of the six items in `overlaps.md`. No id this README cites is dropped by an open pull request, and none is defined only by an open revision. This pull request drops no id that others cite, apart from the prose name in R04. The six conflicting heads are R05. The closest-vocabulary roadmaps were compared by object, each with its result:
- HomotopySpheres is cited nowhere as a supplier: lines 133–140 describe it as a consumer.
- CharacteristicClasses at #1807, #1808 and #1854 is R05.
- TangentialBordism at its head consumes 8.13's three targets for boundaryless sources (lines 73–76); nothing here consumes it.

**Ownership against open work.** I searched by object (`roadmaps grep`, main and the sibling checkouts) for the objects this head changed:
- relative Hurewicz beyond the native connectivity hypotheses;
- the cup-length bound;
- the proper deformation-retraction theorem;
- the mapping-space CW type.

Each is owned only here, among roadmaps on main and the open heads I could read.

**Sources: the seeded sample** (15 targets; the worker's sample found none by heading). In `hatcher`, printed page = marker − 9; every target reads as cited:
- Corollary 4.12 (line 15308, p. 351).
- Theorem 4.32 (15961, p. 366).
- Theorem 4.37 (16124, p. 371: `π′_n`, equal to `π_n` when `A` is simply connected).
- Theorem 4.5 (15109, p. 346).
- Proposition 4.1 (14929, p. 342).
- The `RP²` versus `S²×RP^∞` example (15167–15172, p. 348).
- Proposition 2.22 (5456, p. 124).
- Proposition 0.19 (867, p. 16: the `f|A = 1` case).
- Lemma 3.27 (10255, p. 236).
- Proposition A.15 (23063, p. 531).
- Appendix Exercise 1 (22952, p. 529).
- Section 4.2:
  - Exercises 13, 16 and 17 (16895–16916, p. 390);
  - Exercises 26 and 28 (16974–16985, p. 391);
  - Exercise 34 (17020, p. 392).

Outside `hatcher`:
- `vogt1972` Proposition (lines 28–31, p. 627).
- `ftw1973`: Theorem 4.2, Lemma 4.3 and Corollary 4.9 (lines 600–614, 752–756).

Also checked: Strøm Theorem 6 (`strom1972` line 181, p. 135, one of `A`, `B` closed) and Milnor 1959 Theorem 3 (`milnor1959` line 209, compact n-ad, both assertions).

**Declared gaps.** None: there is no readable `design/plan.json`, and a revision of a roadmap on main declares none.

**Adversarial table.** It covers the 13 headlines, the definitions they rest on, the sampled native theorems this head now consumes, and every target a finding touches.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| `ordinaryPairQuotientComparison` | `B = ∅`; `(D¹, S⁰)` at `n = 1` and `n = 0`; `B = X` | `H_n(X) → H_n(X₊, ∗) = H_n(X)`; `ℤ → H₁(S¹, ∗) = ℤ`, and `0 → 0`; `H_n(X, X) = 0 → H_n(∗, ∗) = 0` | holds (Prop. 2.22) |
| `ordinaryCofiberSetoid` | `B = ∅`; `B ≠ ∅` | only the added point is collapsed, giving `X₊`; the class of `B ⊔ ∗` has neighbourhoods `U ⊔ ∗` with `U ⊇ B` open, giving the usual `X/B` | it determines `X/B` |
| `homotopyInversePairExtension_left` | `A = A' = ∅`; `e = e₀ = id`, `g₀ = id`, `H₀` constant | a homotopy inverse with a left homotopy; `g = id` and `H` constant on `A` | holds (0.19 is the second case) |
| `compactSupportTopClass_existsUnique` | `K = ∅`; `m = 0`; `S²`, `K = V = S²`, `L = ℤ`; `RP²`, `L = ℤ`; the long line | unique `c = 0 ∈ H_m(M, M) = 0`; `⊕_{x∈K} L_x`, determined by its local values; `c = [S²]`; only `s = 0`, since `H₂ = 0`; excluded by the headline, included by Lemma 3.27 | holds; narrower than its source (R06) |
| `poincareDuality_of_fundamentalClass` | `n = 0`, `M` with `k` points; `M = ∅`; `RP²` over `𝔽₂`, `p = 1`; `RP²` over `ℤ`; `R = 0` | diagonal multiplication by units on `R^k`; `0 → 0`; `𝔽₂ → 𝔽₂`; no datum, since images of `H₂ = 0` span `0 ≠ ℤ` (vacuous); all zero | holds |
| `FundamentalClassDatum` | `S¹`, `μ = [S¹]`; `μ = 2[S¹]` | local images `±1`, which span `ℤ`; `±2`, which span `2ℤ ≠ ℤ` | the wrong model is excluded |
| `lsCupLength_add_one_le_categoryCount` | point; `S¹`; `T²`; `RP^∞` over `𝔽₂`; `R = 0`; `X = ∅` | `0+1 ≤ 1`; `1+1 ≤ 2`, since `S¹` alone is not nullhomotopic; `2+1 ≤ 3`; `⊤ ≤ n` fails, so there is no finite cover (true); `0+1 ≤ n`, `n ≥ 1`; `1 ≤ 0` false, excluded by `[Nonempty X]` | holds |
| binders vs `TauCeti.LSCategoricalCover` | the fields `opens`, `subset_iUnion`, `nullhomotopic` (line 84) | `U`, `hcover` with `A = univ`, `hnull` | equivalent |
| `productBallImages_intersect` | `p = q = 0`; `(1, 0)`; `p = q = 1` with constants `f ≡ (a,0)`, `g ≡ (0,b)`; coefficient at `p = q = 1` | `f 0 = g 0 = (0,0)`; IVT, `f₁(x) = g₁(0)`; `f(−a) = (a,0) ≠ (−a,0)` violates `hf`; `(x,−y)` on the square's boundary has degree `−1 = (−1)¹·1·1` | holds |
| `compactManifoldFiniteCWType` | `S²`; `ℝ`; `n = 0`; `M = ∅` | a finite model; excluded by `CompactSpace`; a finite discrete set; the empty complex | holds |
| `homologicalWhitehead` | `S² → S²` of degree 1; Poincaré sphere `Σ → S³`; `S² ∨ S⁴` versus `CP²` | an equivalence; a homology isomorphism with `π₁Σ` of order 120, excluded; no map induces a homology isomorphism (cup products) | holds; `SimplyConnectedSpace` is necessary |
| `groupClassifyingSpace_isEMOne` | trivial `G`; `ℤ`; `ℤ/2`; `S₃` | contractible; `≃ S¹`; `RP^∞`; nonabelian `π₁ = S₃` | holds |
| `properStrongDeformationRetract_of_inverse` | `A = ∅ ≠ X`; `A = X`; `X = [0,∞)`, `A = {0}`, `g ≡ 0` | no `g : X → ∅`, vacuous; `r = id`; `g⁻¹{0} = [0,∞)` is not compact, so `hg` fails | holds |
| binders vs `HasProperHomotopyInverse` | `Proper.lean` 41 | `hincl`, `g`, `hg`, `H`, `K`, `hH`, `hK` | equivalent |
| `finiteSourceMappingCWType` | `X = ∅`; `X = pt`; `X = Y = S¹`; a Cantor set | `C(∅,Y) = pt`; `C(pt,Y) ≅ Y`; `LS¹ ≃ S¹ × ℤ`; Theorem 3 needs only compactness (`milnor1959` line 209) | holds |
| `exists_transverse_circle_classifying_map` | `M = ∅`; `M = pt`; `M = S¹` with `a = b 0`, `−b 0`, `2 b 0` | vacuous; `a = 0`, `f ≡ −1`; `f = id`; `f = conj`; `f = z²`, `f⁻¹(1) = {±1}`, derivative 2 | holds |
| `elementaryAbelianPair_sphere_action_has_stabilizer` | `p = 2`, `n = 0`; `n = 1`; `p = 3`, `n = 2` | 4 elements cannot act freely on 2 points; free circle actions have cyclic deck groups; `dim H³(B(C₃×C₃);𝔽₃) = 4 > 1` | holds (Ex. 28) |
| 8.4 relative Hurewicz (R02) | `(D³, S²)`, degree 3; `(D², S¹)`, degree 2 | `π₃(D³,S²) ≅ π₂(S²) = ℤ ≅ H₃`, whereas the native theorem needs `π₂(S²) = 0`, false; `S¹` is not simply connected, outside 8.4 (Thm 4.37's `π′₂ = ℤ`) | the general case is not native |
| `HomotopyGroup.bijective_hurewicz` | `S²`, `n = 0`; `S¹` | `π₂ = ℤ ≅ H₂ = ℤ`; `π₁ = ℤ` is not trivial, excluded | holds (Thm 4.32) |
| connectivity (`CellDimension`) | `(D², S¹)`, `λ = 2` | `π₀` bijective; `π₁(S¹) = ℤ → 0` surjective, not injective (`2 < 2` false) | sharp (Cor. 4.12) |
| Whitehead (`IsWeakHomotopyEquivalence.homotopyEquiv`) | `∅ → ∅`; `S¹ ⊔ S¹ → S¹` | an equivalence; `π₀` is not injective, excluded | holds |
| transfer `p_* ∘ t` | `E = ∅` over `B ≠ ∅`; `z ↦ z²` | `0 = 0 • id`; `2σ` | holds |
| Brouwer (`compactConvex`) | `[0,1]`, `1 − x`; `(0,1)`, `x/2`; `S¹` rotation; `∅` | `1/2`; no fixed point, excluded by compactness; none, excluded by convexity; excluded by `hne` | holds |
| `TauCeti.eulerChar_torus` (7.4) | `n = 1`; `n = 2`; `n = 0` | `χ(S¹) = 0`; `χ(T²) = 0`; `χ(pt) = 1`, excluded by `[Nonempty ι]` | as line 1962 says |
| vanishing below `n` (R03) | `S³`, `n = 3` | the native theorem gives `H₁ = H₂ = 0`, exactly 8.3's claim | restated |
| 8.5 example `RP²×S³` vs `S²×RP³` | Künneth in degree 2; the `π₁` action on `π₂ = ℤ` | `0⊕0⊕0`, Tor terms 0, versus `ℤ⊕0⊕0`; `−1` (antipodal, `(−1)³`) versus `+1`; an equivariant `φ` with `φ(−x) = φ(x)` forces `φ = 0` | as stated |

## Not verifiable

- **Elaboration of `Suggested.lean`, and of R02's statement, at main's pin.** Tau Ceti `2fd255d`, Mathlib `1b1ccf4b`, v4.36.0-rc2: not run, because this review may run Lean only at the worktree's pin. The cited names and their hypotheses were checked in the source files at that pin.
- **Sources recorded `uncertified`, cited by locator only:**
  - Lee 2012, Theorems 6.26, 6.35 and 6.36 (8.13);
  - Thom 1954, Chapter II (8.13);
  - Milnor 1963, §3, Lemmas 3.6–3.7 (line 843);
  - Weibel 1994 (5.1, 6.1).
- **The heads of #1652, #1797, #1807, #1808 and #1187.** These are not in this worker's revision checkouts. R05 relies on `overlaps.md` and on `roadmaps show AlgebraicTopology --pr 1854`.

## Source issues

- **Misprint** in milnor1959 at the proof of Corollary 3, p. 277: the source says that "Theorem 4" gives the CW type of the loop-space triad, but the paper has only Theorems 1–3; it should be the n-ad assertion of Theorem 3; affects nothing.
