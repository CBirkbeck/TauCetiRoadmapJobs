# Review of AlgebraicTopology (pull request #1808 at 1e85c71)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/AlgebraicTopology/` at 1e85c71. The folder changed by 741 lines since 01872e7: README +480/−261 and `Suggested.lean`. Every passage was read, changed or not.

## Status of the previous review's findings (r92, at 01872e7)

| r92 | status | evidence at this head |
| --- | --- | --- |
| R01 companion files break the build | **not repaired** | `OrientationComparison.lean` line 27 still reads `twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x)`. Now R01. |
| R02 three owners of the Serre/EM machinery | **not repaired** | README 112: "The ordinary Serre and Eilenberg–MacLane machinery is owned here". DGFloer is unchanged on main and at #1798. Now R03. |
| R03 pinned theorems claimed as own | repaired | 126–128: "is the pinned `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv`". 4.6 (913–916) and 7.2–7.4 (1944–1967) consume the pin; 7.4 no longer cites ComplexKahlerGeometry. |
| R04 loop comparison statable but absent | repaired | `exists_ordinaryEMModel_loopComparison` (`Suggested.lean` 453); README 2519–2528. |
| R05 Prüfer step false for non-prime d | repaired | 2367–2369: "a direct sum of cyclic groups whose orders divide d^k". |
| R06 further pinned constructions restated | repaired | Inventory 339–371; 5.1–5.7 and 6.0–6.1 consume the pin. New duplicates are in R05 below. |
| R07 false necessity witnesses | repaired | `Suggested.lean` 200–203 now uses `(S¹ ∨ S², S¹)`; 221–225 uses `P → S³` and Hatcher Example 4.35. |
| R08 `nonempty_ordinaryEMModel` padding | repaired | Deleted. |
| R09 locators | repaired | "Example 4.29" (302); "Section 6.7" (441, 2751); `TauCeti.spherePole` (1840); FTW, Dugundji and Dowker added to References. "Section 0.4" remains (R07). |
| R10 dropped names cited elsewhere | repaired | `## Renamed targets` (2731–2747) gives one old → new line per name. |
| R11 stale consumers, undefined abbreviations | repaired | DG9.3 claims dropped (78–88). "CC", "GT3g" and "Four" are gone. The NDR proviso is replaced (1981). |
| R12 names missing from the README; not-statable reasons | repaired | 8.10 heading (2429–2431); docstring 63–85. |
| R13 process words | repaired | 1847, 1838 and 1856 no longer say "corrected", "current" or "present". |
| R14 edits outside the folders | **not repaired** | Gate `outside-folder=2`. Now R09. |
| R15 no merge order for the conflicting heads | **not repaired** | The description is unchanged. Now R10. |

## R01 (P1) — The six companion files still use definitions this pull request deletes, so `lake build` fails

**Location.** `TauCetiRoadmap/AlgebraicTopology/OrientationComparison.lean`:

- line 1: `import TauCetiRoadmap.AlgebraicTopology.Suggested`;
- line 27: `twistedRelativeHomology ℤ (puncturedPair (TopCat.of M) x)`;
- line 58: `coordinateSimplexPair m`.

`ChartSimplexLocalImage.lean`, `CompactOrientationLaws.lean`, `GeneralModelOrientation.lean`, `BoundaryInteriorComparison.lean` and `BoundaryCarrierOrientation.lean` import it.

**Claim.** This is r92 R01, unchanged. This pull request removes `puncturedPair`, `twistedRelativeHomology` and `coordinateSimplexPair` from `Suggested.lean`. `lakefile.toml` globs `TauCetiRoadmap.*`, and `.github/workflows/ci.yml` line 131 runs `lake build`. The worker's targeted build of `Suggested` cannot see the failure. The files also break the form rules:

- `set_option maxHeartbeats` in `OrientationComparison.lean` 14–15, `CompactOrientationLaws.lean` 14–15 and `BoundaryInteriorComparison.lean` 15–16;
- an import of another roadmap's module, `TauCetiRoadmap.DifferentialGeometry.Suggested`;
- 42 `sorry`s.

`TopologicalGroupFundamentalGroup.lean` compiles, but it re-proves the pinned `FundamentalGroup.instCommGroup` and `FundamentalGroup.cast_map_prod_mul` under the same `[MulOneClass] [ContinuousMul]` hypotheses. README 1.6 now consumes those pinned declarations.

**Witness.** A scratch file importing the built `TauCetiRoadmap.AlgebraicTopology.Suggested` gives "Unknown identifier" for `#check @puncturedPair`, `@twistedRelativeHomology` and `@coordinateSimplexPair`. Main's `Suggested.lean` defines them at lines 352 and 361.

**Repair.** Delete the seven files. README 1.6 and 6.3 state everything they carry.

## R02 (P1) — Stage 8.3's comparison of the native Hurewicz map with the sphere map has the wrong sign in degree one

**Location.** README 2050–2055: "Consume the native absolute Hurewicz map `HomotopyGroup.hurewiczHom` … compare it with the descended sphere map: g descends through the Stage 4.4 quotient q to a pointed sphere map g', and `h[g]=g'_*[S^n]` on the outward-first normalized generator."

**Claim.** The native map pushes forward the pinned generator `(singularHomologyCubeBoundaryPairIso R n).inv`. In degree one that generator is −[t↦t], as README 2062 itself says. Three passages of this README fix the other sign:

- Stage 2.5 (462–463) fixes [I,∂I] = +[t↦t], with boundary [1]−[0].
- Stage 4.4 (687–689) makes the cube quotient q send that class to the normalized generator with coefficient +1.
- Stage 8.6 (2198–2200) does the same.

So for every loop g, h[g] = −g'_*[S¹], and the stated equation is false at n = 1. For n ≥ 2 the README asserts coefficient +1 without computing it. The same unsigned identification feeds:

- 8.2's "normalized Hurewicz image" (2024);
- 8.8c's normalization (2335–2340);
- the degree-one statements of 8.10 (2438–2439: "Fix degree-one identification by the bar's oriented one-simplex labelled a");
- 8.12 (2612–2613: "pairing to +1 with that loop").

`exists_universalClass_ordinaryEMPullback_bijective` normalizes with the native `hurewiczHom`. Through the pinned sign, that gives ⟨ι,[σ_a]⟩ = −a on the bar edge simplex σ_a labelled a, read as the loop it traces.

**Witness.** `TauCeti.singularHomologyCubeBoundaryPairIso_one_inv` (`TauCeti/AlgebraicTopology/Singular/IntervalGenerator.lean`:295) gives the native generator `-cubeRelClass`, where `cubeRelClass` is t↦t with boundary [1]−[0]. Take X = S¹, g = q, g' = id: then h[q] = −[S¹] ≠ [S¹].

**Repair.**

- In 8.3, write `h[g] = η_n·g'_*[Sⁿ]`. Here η_n ∈ ℤˣ is the coefficient of `(singularHomologyCubeBoundaryPairIso ℤ n).inv` on Stage 2.5's coordinate cube class. η₁ = −1 by the pinned lemma; make computing η_n for n ≥ 2 a target.
- Define 8.2's and 8.8c's normalized Hurewicz map as η_n·h.
- In 8.10, state that the Lean normalization gives ⟨ι,[σ_a]⟩ = −a. Alternatively, normalize by the loop-as-cycle map.
- In 8.12, say which map "pairing to +1" refers to.

Test on the refuting instance: h[q] = −[S¹] = η₁·[S¹].

## R03 (P2) — The Serre and Eilenberg–MacLane machinery has two owners (re-raised from r92 R02)

**Location.** README 112–113 and 131: "The ordinary Serre and Eilenberg–MacLane machinery is owned here. … [DGFloer] Layer 1 consumes these ordinary targets". Stages 4.8 (969–1002), 5.5 (1126, 1166, 1177, 1235) and 8.8c–8.8d (2272–2390) claim ownership.

**Claim.** On main this roadmap consumed DGFloer Layer 1 items 1–4 (main README 102, 915, 922, 1688–1690, 1913). This pull request moves those targets here but leaves DGFloer untouched, and DGFloer still owns them in both versions:

- on main: lines 196–232, "this roadmap owns: … the fibration homotopy exact sequence and ordinary homological and multiplicative cohomological Serre sequences …; Serre classes";
- at its open head #1798: 60–70, 1048, 1081 and 1215–1224, including "Hurewicz modulo a Serre class, the functorial Eilenberg–MacLane models `K(A, n)`".

StableHomotopyKTheory (#1227, line 121) takes the same objects from DGFloer. The depcheck is silent because the two roadmaps no longer cite each other as suppliers. They duplicate each other instead.

**Witness.** DGFloer main line 232: "AlgebraicTopology Stage 5.5 and GeneralizedCohomology consume these targets." DGFloer #1798 line 1048: "Own, for every path-connected CW base, the spectral sequence consumed by AlgebraicTopology Stage 5.5".

**Repair.** Keep this roadmap as the owner: DGFloer consumes AlgebraicTopology Stages 2–8 (#1798 line 182). Then either:

- add DGFloer to this pull request and replace its Layer 1 items 2–4 by citations of Stages 4.8, 5.0, 5.5, 8.8c and 8.8d; or
- state in the description that #1798 and #1227 are rebased on this pull request with those citations repointed (#1227 lines 10, 117 and 121).

## R04 (P2) — DGFloerPartII owns the same compact-generation coreflection

**Location.** README 138–145: "Stage 4.5 owns the compact-generation coreflection `k`, the right adjoint of Mathlib's inclusion … (`compactlyGeneratedToTop_isLeftAdjoint`) … consumes it rather than constructing a second one." `Suggested.lean` 108–109 states it at `.{u, u}`.

**Claim.** DGFloerPartII (#1799, a new roadmap) consumes Stages 2, 4, 6 and 8 of this roadmap (its README 100 and 410). Yet its 1.0 constructs and states the same coreflection for all universes. It also identifies "the one through which AlgebraicTopology Stage 4.4 states its compact reduced-suspension carrier comparison" with its own (479–481). That makes two owners of one object.

Separately, this file narrows the statement to `w = u`. The `.{u, w}` statement elaborates (scratch check, exit 0) and is true, since the k-ification topology exists in any universe.

**Witness.** DGFloerPartII #1799 `Suggested.lean` 91–92: `theorem compactlyGeneratedToTop_isLeftAdjoint : (CompactlyGenerated.compactlyGeneratedToTop.{u, w}).IsLeftAdjoint`. Its README 473–474: "(`compactlyGeneratedToTop_isLeftAdjoint`), for all universes `u` and `w`".

**Repair.**

- State the theorem at `.{u, w}` here, with a second universe in the file and in README 4.5.
- Record in the description that #1799 replaces its 1.0 coreflection and its `Suggested.lean` line 91 by a citation of AlgebraicTopology Stage 4.5.

## R05 (P2) — Theorems of the pinned Tau Ceti are still stated as this roadmap's targets

**Location.**

- README 532–537: "Own the two remaining specializations: the closed-ball case of every radius r≥0 …, and the fixed-point theorem for a nonempty compact convex C lying in a specified finite-dimensional submodule V".
- README 2032: "Own simplicialGroupKan: every simplicial group is a native `SSet.KanComplex`."

**Claim.** These and the further passages listed under the repair restate declarations that exist at the Tau Ceti pin 2fd255d9, without citing them.

**Witness.** `TauCeti.brouwerFixedPoint_closedBall` (`TauCeti/AlgebraicTopology/Singular/BrouwerFixedPoint.lean`:149) and `TauCeti.brouwerFixedPoint_compactConvex_finiteSpan` (:159). `SSet.kanComplex_of_group` (`SimplicialSet/KanComplex/SimplicialGroup.lean`:186).

**Repair.** Consume each pinned declaration below, list it in the Inventory, and delete the target. Keep only the residual named in each item.

- **2.7 (532–542).** The two Brouwer specializations are the pinned `TauCeti.brouwerFixedPoint_closedBall` and `TauCeti.brouwerFixedPoint_compactConvex_finiteSpan`.
- **4.5 (724–725), cellular approximation.** It is `TauCeti.exists_isCellular_homotopicRel`, for relative CW complexes rel the base (`Topology/CWComplex/Classical/CellularApproximation.lean`:94). Keep only the rel-subcomplex form.
- **4.5 (858, 875–876), compact generation of Hausdorff CW complexes.** It follows by instance search from the pinned `TauCeti.instDeltaGeneratedSpaceCWComplex` (`DeltaGenerated.lean`:61), Mathlib's `DeltaGeneratedSpace → SequentialSpace` (`DeltaGeneratedSpace.lean`:58) and `SequentialSpace → UCompactlyGeneratedSpace` (`CompactlyGeneratedSpace.lean`:211).
- **5.3 (1111–1117), nonregular finite covers.** The permutation local system and the composition and componentwise transfer formulas are pinned:
  - `IsCoveringMap.singularChainComplexPermutationIso` and `IsCoveringMap.transfer_comp_singularChainComplexPermutationIso_inv` (`Singular/Transfer/PermutationLocalSystem.lean`:207, 266);
  - `IsCoveringMap.singularTransfer_comp` (`Composition.lean`:42);
  - `IsCoveringMap.homologyMap_singularTransfer_comp_homologyMap_eq_locallyConstantNsmul` (`Degree.lean`:54).
- **5.4 (1118–1120), torus homology as exterior powers, natural in torus homomorphisms.** It is `TauCeti.bijective_pontryaginExteriorPower_torus`, `TauCeti.torusExteriorPowerEquiv` (`Singular/Torus/Exterior.lean`:325, 343) and `TopCat.pontryaginExteriorPower_naturality` (`Singular/Pontryagin/Exterior.lean`:416).
- **8.2 (2019–2021, 2032).** Kan homotopy groups with their group law are `SSet.KanComplex.π` (`SimplicialSet/KanComplex/HomotopyGroup.lean`). The Kan property of `TopCat.toSSet.obj X` is `TopCat.kanComplex_toSSet_obj` (`SimplicialSet/KanComplex.lean`:48). The natural cubical comparison is `TopCat.toSSetPiEquivHomotopyGroup` with `_map` (`Homotopy/SingularSet.lean`:164, 208). Moore's theorem is `SSet.kanComplex_of_group`. Keep the nonabelian Moore formula and the realization unit.
- **8.8d (2361–2364), the `K(A,1)` axiom for finite A.** It is `TauCeti.natCard_nsmul_classifyingSpace_singularHomology_eq_zero`, `TauCeti.isAddTorsion_classifyingSpace_singularHomology` and `TauCeti.isKilledBySomePower_classifyingSpace_singularHomology` (`ClassifyingSpace/Torsion.lean`:66, 73, 91), on Milnor's model. Transport them through 8.8b, and keep the directed-union and Prüfer uniform-exponent passage for infinite A. DGFloer #1798 line 1222 already records that these axioms are pinned.

## R06 (P3) — The definitions that `Suggested.lean` declares have no Checks in the README

**Location.** README 8.8c (2272–2306), 8.8d (2350–2390), 8.10 (2429–2449) and 6.2 (1458–1465), which define `OrdinaryEMModel`, `NormalizedAbelianEMFamily`, `ordinaryDoldKanSimplicialModel`, `ordinaryDoldKanBasepoint`, `hurewiczInt`, `IsSerreIso`, `IsSerreEpi`, `continuousHomotopySetoid`, `continuousHomotopyClasses`, `ordinaryEMPullback`, `LSPositiveCupProduct` and `lsCupLength`.

**Claim.** No definition has a list of at least three discriminating Checks. 6.2's "Basic checks" test the bound, not `lsCupLength` against a wrong definition.

**Witness.** README 2272–2306 contains no Check on `OrdinaryEMModel`. A model without `vanishing` would accept S² with A = ℤ, n = 2, although π₃(S²) = ℤ.

**Repair.** Add a Checks list to each item. The values below were computed for this review:

- **`OrdinaryEMModel`.** S¹ with A = ℤ, n = 1 is a model. RP^∞ with A = ℤ/2, n = 1 is a model. S² with A = ℤ, n = 2 fails `vanishing` at j = 3.
- **`NormalizedAbelianEMFamily`.** f = ×2 on ℤ, n = 1, acts by 2 on π₁. f : ℤ → 0 gives a map to a weakly contractible model. A field that sends f to the map induced by −f fails `map_id`.
- **`IsSerreIso` and `IsSerreEpi`, torsion class.** ×2 : ℤ → ℤ is a C-isomorphism but not an isomorphism (kernel 0, cokernel ℤ/2). ℤ → 0 is a C-epimorphism but not a C-isomorphism. With `isKilledBySomePower 2`, ℤ/3 → 0 is not a C-isomorphism.
- **`hurewiczInt`.** On S², degree 2 is ℤ ≅ ℤ. In degree one it is minus the loop-as-cycle map (pinned `HomotopyGroup.hurewiczHom_hom_one_eq_neg_hurewicz₁`). π₄(S³) = ℤ/2 maps to H₄(S³) = 0.
- **`lsCupLength`.** A point gives 0; Sⁿ with ℤ gives 1; T² gives 2. RP² gives 2 over 𝔽₂ but 1 over ℤ (H¹ = 0, H² = ℤ/2). The zero ring gives 0.
- **`continuousHomotopyClasses`.** X = ∅ has one class; [S¹, S¹] ≅ ℤ; [pt, S⁰] has two classes.
- **`ordinaryEMPullback`.** For K = X = S¹ with A = ℤ, the degree-d map pulls ι back to d·ι.
- **`ordinaryDoldKanSimplicialModel`.** A = 0 gives a point. For A = ℤ in degree 2, there is one vertex, only degenerate 1-simplices, and the 2-simplices are ℤ.

## R07 (P3) — A nonexistent Hatcher section, and four headline theorems without a locator

**Location.**

- README 1004: "Hatcher, Sections 0.4 and 2.2, supplies CW pairs, cellular approximation, and cellular homology". References 2755: "Sections 0.4, 1.2, …".
- `compactlyGeneratedToTop_isLeftAdjoint` (README 852–862; `Suggested.lean` 102–107).
- `eulerChar_totalSpace` (1944–1952; 144–150).
- `lsCupLength_add_one_le_lsCategoryCount` (1458–1486; 181–186).
- `exists_ordinaryEMModel_iso_doldKanRealization` (2285–2290; 324–328).

**Claim.** Hatcher's Chapter 0 has unnumbered sections, so "0.4" does not exist. Cellular approximation is Theorem 4.8 in §4.1. Each of the four statements, in the README and in its docstring, cites no source and theorem number.

**Witness.** hatcher lines 9–12: the Chapter 0 contents are unnumbered, with "The Homotopy Extension Property 14". hatcher line 15205: "Theorem 4.8. Every map f: X→Y of CW complexes is homotopic to a cellular map."

**Repair.**

- At 1004, write "Hatcher, Chapter 0 (cell complexes, homotopy extension), Theorem 4.8 and Section 2.2". In References, write "Chapter 0" for "0.4".
- Add a source with a theorem number to each of the four statements, checked at its text. Candidates, not verified here:
  - Strickland, *The category of CGWH spaces*, for the coreflection;
  - Cornea–Lupton–Oprea–Tanré, *Lusternik–Schnirelmann Category*, Proposition 1.5, for the cup-length bound;
  - May 1967 Chapter V or Goerss–Jardine III.2 for the Dold–Kan realization;
  - Spanier Chapter 9 for the bundle formula.

## R08 (P3) — `hurewicz_mod_isKilledBySomePower` assumes `0 < d`, which the statement does not need

**Location.** `Suggested.lean` 381: `theorem hurewicz_mod_isKilledBySomePower (d : ℕ) (_hd : 0 < d) …`

**Claim.** At d = 0 the pinned class contains every abelian group, so all three conclusions hold without the hypothesis. The hypothesis only narrows the statement.

**Witness.** `AddCommGrpCat.isKilledBySomePower d M` is `∃ n, Module.IsTorsionBy ℤ M ((d : ℤ) ^ n)` (`SerreClass/PowerTorsion.lean`:33). At d = 0, n = 1 kills every M.

**Repair.** Drop `_hd`, and say in the docstring and in README 8.8d that d = 0 gives the class of all groups. Test: at d = 0 each conclusion holds by `⟨1, …⟩`.

## R09 (P3) — Edits outside the pull request's folders; the gate fails (re-raised from r92 R14)

**Location.** `Completed/ArithmeticDirichletSeries/README.md` line 331 and `TauCetiRoadmap/SymplecticGeometry/README.md` line 77, one line each.

**Witness.** The worker's gate at 1e85c71 reports `outside-folder=2`, FAIL. The brief's `git diff --stat`, excluding the fifteen named folders, lists exactly these two files.

**Repair.** Drop the two hunks, or name both folders as the pull request's own.

## R10 (P3) — No merge order is stated for the conflicting open heads, and the description omits this roadmap's change (re-raised from r92 R15)

**Location.** The description's merge-order paragraph: "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**." The description does not mention AlgebraicTopology.

**Claim.** Five open heads conflict with this one in `AlgebraicTopology/{README.md, Suggested.lean, TopologicalGroupFundamentalGroup.lean}`: #1652 and #1663 (@kim-em), and #1797, #1854 and #1187. No order is stated for any of them. The ownership moves of R03 and R04 also need to be stated there.

**Witness.** `overlaps.md` lists all five conflicts against this head.

**Repair.**

- Summarize the AlgebraicTopology change: the pinned Tau Ceti is consumed, the loop-comparison headline is added, and the Serre/EM ownership moves from DGFloer.
- For each of #1652, #1663, #1797, #1854 and #1187, state which one is rebased on which.

## Verified sound

**Gate, dependency check, elaboration.**

- **Worker's gate.** Every scanner reports 0 except `outside-folder=2` (R09). The targeted build passes. A rerun of the gate without the folder list reports the same two files among the pull request's own folders.
- **Dependency check.** `depcheck: 238 roadmaps, 2317 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. AlgebraicTopology and CharacteristicClasses supply each other at roadmap level, but the item graph is acyclic: AT's supported-cellular supplement uses C1.2a S0–S4, and C1.2a uses only AT 2–4 and 6.1–6.2. The check accepts this.
- **Elaboration.** `lake env lean TauCetiRoadmap/AlgebraicTopology/Suggested.lean` exits 0 in 5 s, with 14 `declaration uses sorry` warnings (lines 108 to 453) and nothing else.
- **Signatures.** I ran `#check @` on all 26 named declarations in one scratch file. Every binder is present; no section variables are used. Each type matches the README's generality:
  - 6.4: compact T2 manifold with `HomologicalOrientation`, p + q = n;
  - 8.4: π_i(Y,B) = 0 for i ≤ n+1, with `Fin k` ↦ π_{k+1} (pinned `hurewiczIntHom`, `Relative/Hurewicz.lean`:388);
  - 8.8d: π_i ∈ C for 2 ≤ i < n+2;
  - 8.10: every T2 CW `X`;
  - 8.11b: the loop coordinate last, as in `pathLoopSpaceMulEquiv` (`LoopSpace.lean`:321, via `piLoopSpaceMulEquiv m 1`).

  The "structure `as`" entry in `signatures.md` is a parse of the local instance's docstring ("structure as a category"), not a declaration.
- **Padding probe.** Each `sorry` was replaced by `first | rfl | infer_instance | trivial | simp | aesop | decide | exact ⟨Classical.choice inferInstance⟩`. All 14 still fail, so no declaration closes in one tactic. `compactlyGeneratedToTop_isLeftAdjoint` is not at the pin: Mathlib has only the `GeneratedByTopCat` coreflection (`Topology/Convenient/Category.lean`:277–289) and the condensed one.

**Seeded sample.** The worker found no target by heading, so I chose 15 and read each in the cache.

| # | target | locator | text read | result |
| --- | --- | --- | --- | --- |
| 1 | 8.4 headline | Hatcher Thm 4.37 | hatcher 16124–16126 | π′ = π for simply connected A; n ≥ 2, path-connected spaces: supports |
| 2 | 8.5 headline | Hatcher Cor 4.33 | hatcher 16001–16011 | supports the CW form; the weak-equivalence form follows by CW approximation |
| 3 | 8.5 docstring witness | Hatcher Ex 4.35 | hatcher 16042–16057 | holds for n > 1 (the docstring omits n > 1; harmless) |
| 4 | 8.10 headline | Hatcher Thm 4.57 | hatcher 17069–17088 | supports, including free classes for abelian G |
| 5 | 8.11b route | Hatcher Lemma 4.31 | hatcher 15931–15935 | ψ: π_n(X) → π_n(Y) realized for Y path-connected: supports |
| 6 | 8.8c uniqueness | Hatcher Prop 4.30 | hatcher 15928 | supports |
| 7 | 8.8c existence (docstring) | Hatcher §4.2, Cor 1.28, Ex 4.29, Ex 4.16 | hatcher 15901–15906, 15863–15879, 2353 | supports |
| 8 | 6.4 headline | Hatcher Thm 3.30 | hatcher 10453–10455 | closed R-orientable manifold: supports |
| 9 | 6.4 triad duality | Hatcher Thm 3.43 | hatcher 10976–10982 | supports; the local-system form is this roadmap's own |
| 10 | 8.1 pinned connectivity | Hatcher Thm 4.3, Cor 4.12 | hatcher 15007, 15308–15310 | LES on an arbitrary pair; cells of dimension > n give an n-connected pair: supports |
| 11 | 4.8 extensions | Hatcher Ex 4.14, Props 4.15, 4.17, 4.18, Cor 4.19 | hatcher 15379–15480 | supports (an n-connected CW model presumes A a CW complex, as in Hatcher's definition) |
| 12 | 8.11a | Milnor 1959 Thm 3 | milnor1959 209–212 | compact n-ad source, A ∈ W_n: supports |
| 13 | 8.5 proper Whitehead | FTW Thm 4.2, Lemma 4.3, Cor 4.9 | ftw1973 600–614, 752–756 | supports; the derivation of Cor 4.9 is left to the reader (757–758), as the README's own target anticipates |
| 14 | 8.11a | Dugundji Thm 4.1 (p. 357), Cor 4.2 (p. 358), §7 and Thm 7.1 (p. 363) | dugundji1951 155–158, 201–202, 342–350, 357–362 | pages and statements agree |
| 15 | 4.5 cylinder HEP | Strøm, Note on cofibrations II, Thm 6 | strom1972 181–185 | the product of cofibered pairs with A closed is cofibered: supports (the text is the 1968 paper the README cites) |

Also read:

- Hatcher VBKT Prop 3.19 (hatcher-vbkt 3908–3916) supports 8.9's coset and extension statements. Its trivial-monodromy assumptions (3845–3854) are lifted by the README's own local-coefficient target.
- Brown §6.7 (brown 9392).
- Hatcher Thm 2A.1 (7230–7233), Prop 0.19 (867–869), Lemma 3.27 (10255–10259), Prop 3.29 (10370), Prop A.3 (22617) and Thm A.6 (22693–22697).
- Hatcher SSAT Thm 1.8 (849–850) gives the mod-C isomorphism, not the degree-(n+1) epimorphism.

**Adversarial table.**

| statement | instances tried | values computed on each side | result | change |
| --- | --- | --- | --- | --- |
| `compactlyGeneratedToTop_isLeftAdjoint` | X uncountable with the cocountable topology; X compact T2; `.{u, w}` | compact sets finite, so kX is discrete and the counit is a continuous bijection but not a homeomorphism; kX = X; the two-universe form elaborates | true; narrowed to `w = u`; second owner | R04 |
| `bijective_singularCap_fundamentalClass` | M = ∅; M = 2 points, n = 0; S², p = 0, 1, 2; M = ℝ | 0→0; ℤ²→ℤ² via the signs ±1; ℤ→ℤ, 0→0, ℤ→ℤ; H⁰ = ℤ vs H₁ = 0 (excluded by compactness) | true, hypotheses needed | none |
| `eulerChar_totalSpace` | Hopf S³→S²; Klein bottle→S¹; S²×S²; B = 2 points, F = S²; B = ∅ | 0 = 2·0; 0 = 0·0; 4 = 2·2; 4 = 2·2; 0 = 0·χF | true with monodromy | locator R07 |
| `lsCupLength_add_one_le_lsCategoryCount` | point; S¹ over ℤ; T²; zero ring; RP^∞ over 𝔽₂; X = ∅ | 0+1 ≤ 1; 1+1 ≤ 2; 2+1 ≤ 3; 0+1 ≤ count ≥ 1; ⊤+1 ≤ ⊤; for ∅, 0+1 ≤ 0 fails, so `[Nonempty X]` is needed | true | locator R07 |
| `bijective_relativeHurewicz_of_simplyConnected` | (D³,S²), n = 1; n = 0; (S¹∨S², S¹); Y = B ⊔ S², n = 0 | π₃ = π₂S² = ℤ ≅ H₃; at n = 0, π₁(Y) = 0 follows, which is the pinned case; π₂ = ℤ[t,t⁻¹] → ℤ (augmentation) with hB failing; π₂(Y,B,b) = 0 vs H₂ = ℤ, so h₀ is needed | true; docstring witness right | none |
| `isWeakHomotopyEquivalence_of_isIso_singularHomologyMap` | degree-1 map P→S³; S¹ ↪ (S¹∨Sⁿ)∪eⁿ⁺¹; id S³ | H_* isomorphic, π₁(P) of order 120 (excluded); Hatcher 4.35 (excluded); trivial | true | none |
| `finiteCWType_of_compactSpace_of_isManifold(_halfSpace)` | n = 0, finite discrete M; M = ∅; S¹; [0,1] and D² (half-space) | finite CW in each case; no smooth triangulation at the pin (only `isTriangulable_of_chartedSpace_zero`) | true; needs GeometricTopology's comparison item 1 | none |
| `OrdinaryEMModel` | S¹ (ℤ,1); S² (ℤ,2); RP^∞ (ℤ/2,1) | satisfies; fails `vanishing` at j = 3; satisfies | discriminates | Checks R06 |
| `NormalizedAbelianEMFamily` | ×2 on ℤ; ℤ→0; f ↦ map of −f | acts by 2 on π₁; constant map; fails `map_id` | laws exclude the wrong model | Checks R06 |
| `exists_ordinaryEMModel_iso_doldKanRealization` | A = 0; A = ℤ, degree 2 | Γ(0) is a point; one vertex, Γ₁ degenerate, Γ₂ = ℤ, π₂ = H₂(ℤ[2]) = ℤ (pinned `DoldKan/HomotopyGroups`) | true | locator R07 |
| `hurewiczInt`, `IsSerreIso`, `IsSerreEpi` | ×2 on ℤ; ℤ→0; ℤ/3→0 with `isKilledBySomePower 2` | ker 0, coker ℤ/2 (C-iso); ker ℤ (not a C-iso); ℤ/3 killed by no 2ᵏ | discriminate | Checks R06 |
| `hurewicz_mod_isTorsion` | n = 0 with S²; S³, n = 1; K(ℤ/2,2), n = 1 | H₁ = 0, h₂ iso, π₃ = ℤ → H₃ = 0 onto; π₃ = ℤ ≅ H₃, π₄ = ℤ/2 → 0 onto; H₂ = ℤ/2, h₃: 0 → 0, coker of h₄ is ℤ/4 (torsion) | true | none |
| `hurewicz_mod_isKilledBySomePower` | d = 1; d = 0; d = 2, X = K(ℤ/4,2), n = 0 | trivial class, i.e. classical Hurewicz with h onto in degree n+3; all groups, so trivially true; h₂: ℤ/4 ≅ H₂ | true; `0 < d` unneeded | R08 |
| 8.8d Prüfer step | d = 4, A = ℤ/2; ⊕_ℕ ℤ/d | summand order 2 divides 4; finite stages need d^i, the uniform exponent comes from Prüfer | right | none |
| `exists_universalClass_ordinaryEMPullback_bijective` | m = 0 with X = S¹, ∅, S⁰; m = 1 with X = S²; Kronecker map | ℤ = H¹; 1 class = 0; 1 class = H¹(S⁰) = 0; ℤ = H²; Ext(H₀ = ℤ) = 0, so ι is unique | true; degree-one sign must be stated | R02 |
| `exists_ordinaryEMModel_loopComparison` | A = 0; A = ℤ, K = S¹, K′ = CP^∞; f inducing −1 | weakly contractible both sides; π₁(ΩCP^∞) = π₂(CP^∞) = ℤ, identity; −1 violates the normalization | true | none |
| 8.3 h[g] = g′_*[Sⁿ] | n = 1, X = S¹, g = q | native h[q] = −[t↦t] = −[S¹] (pinned); g′_*[S¹] = q_*(+[t↦t]) = +[S¹] (2.5, 4.4, 8.6) | **false** | R02 |
| 8.10/8.12 degree-one pairing | bar edge σ₁ labelled 1 | Lean: ⟨ι, h(p₁)⟩ = 1, so ⟨ι,[σ₁]⟩ = −1; 8.12 says "+1 with that loop" | ambiguous | R02 |
| 2.7, 4.5, 5.3, 5.4, 8.2, 8.8d | pinned declarations at 2fd255d9 | targets vs `brouwerFixedPoint_closedBall`, `exists_isCellular_homotopicRel`, `singularTransfer_comp`, `bijective_pontryaginExteriorPower_torus`, `kanComplex_of_group`, `isKilledBySomePower_classifyingSpace_singularHomology` | duplicated | R05 |
| 5.1 non-natural Künneth splitting | f: RP²→S² collapsing the 1-skeleton | H₃(RP²×RP²) = Tor(ℤ/2,ℤ/2) = ℤ/2 generated by e₂×e₁+e₁×e₂ (d(e₂×e₂) = 2·it); its image e₂′×e₁ generates H₃(S²×RP²) = ℤ/2; a natural splitting gives 0 | right | none |
| 6.1 non-natural UCT splitting | same f, coefficients ℤ/2 | f*: H²(S²) = ℤ/2 → H²(RP²) = ℤ/2 is an isomorphism; Hom summand of RP² is 0, Ext summand of S² is 0 | right | none |
| 4.6 / 6.1 / 6.3 RP² | cellular d; sign system ε | constant: d₂ = ±2, d₁ = 0; twisted: d₂ = 0, d₁ = ±2; H⁰(ε) = 0, H¹ = ℤ/2, H² = ℤ, matching H₂ = 0, H₁ = ℤ/2, H₀ = ℤ | consistent | none |
| 7.3 inclusion–exclusion | k = 0; k = 2 | 0 = 0 (empty space); reduces to the pinned two-set law | right | none |
| 7.4 values | S², S¹, T², CP² | 2; 0; 0; 3 | right | none |
| 6.3 S⁰ pole | `TauCeti.spherePole` for a one-element index | Mathlib's `onePointEquivSphereOfFinrankEq` uses v = single (arbitrary ι) 1 = +1 | right | none |

**Library declarations opened at the pins** (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9), with the witnesses above:

- `hurewiczIntHom`; `bijective_hurewicz_of_subsingleton_homotopyGroup` (`Hurewicz/Relative.lean`:282);
- `pathLoopSpaceMulEquiv`; `isKilledBySomePower`, `isTorsion`;
- `IsTriangulable.finiteCWType` (`Topology/Triangulable/FiniteCWType.lean`:41); `TriangulationConjecture.lean`;
- `HomologicalOrientation.fundamentalClass` (universe 0); `integralCohomology` (`IntegralCup.lean`:145);
- `LSCategoricalCover` and `lsCategoryCount` (`LusternikSchnirelmann.lean`:84, 264);
- `FundamentalGroup.instCommGroup` (`TopologicalMonoid.lean`:120);
- `GenLoop.hurewicz` (`Hurewicz/Basic.lean`:157); `singularHomologyCubeBoundaryPairIso_one_inv`; `cubeRelClass`;
- the classifying-space and Serre-class modules; `DoldKan/HomotopyGroups.lean`; Mathlib's `CompactlyGeneratedSpace.lean` and `Convenient/Category.lean`.

A namespace-aware script resolved 183 of 215 dotted backticked names in the README against the pins. The other 32 are module paths, each of which exists (checked by file), and Mathlib's `CWComplex.*` names. The one name `citations.md` flags, `HomotopyGroups`, is the module `TauCeti/AlgebraicTopology/DoldKan/HomotopyGroups.lean`, which exists. Every pinned name in the module docstring resolves.

**Cross-roadmap citations resolved.**

- ClassifyingSpaces Layer 1 items 1.1–1.3 exist at this head (its README 539, 612, 704).
- CharacteristicClasses C1.2a S0–S5 (585–597) and C1.5a (790) exist at this head. Both folders belong to this pull request, and #1807 is named in the merge-order paragraph.
- GeometricTopology smoothing-and-triangulation item 1 exists on main (line 930).
- FourManifolds §3.4 consumes `SimplyConnectedAtInfinity` (#936, lines 1236, 1291).
- DGFloer main and #1798, DGFloerPartII #1799 and StableHomotopyKTheory #1227: see R03 and R04.
- The old → new names in `## Renamed targets` cover every citation in GeneralizedCohomology (35, 101, 432, 2094) and DGFloer main (179, 1575).

**Ownership against open pull requests.** I searched by object, in the Lean files of main and all open heads, for: the fibre-bundle Euler formula; cap with the fundamental class; homological Whitehead; `OrdinaryEMModel`; Hurewicz mod C; cup length; and finite CW type of manifolds. Only this roadmap states them. The compact-generation coreflection has a second owner (R04), and the Serre/EM objects have a second owner (R03). No `Suggested.lean` declaration repeats a fully qualified name from another roadmap.

## Not verifiable

- **Serre 1953, Théorème 1** (README 2380; `Suggested.lean` 358, 376). Annals 58, paywalled and settled as uncertified. The degree-(n+1) C-epimorphism is not in Hatcher SSAT 1.8 (hatcher-ssat 849–850).
- **Other uncertified texts in the manifest.** tom Dieck 9.5.1; Weibel 5.5.1(2) and 5.5.10; Milnor *Morse Theory* Lemmas 3.6–3.7; Freedman–Quinn 7.7; Dowker 1952.
- **May 1967.** Fetched as an image-only scan; OCR is not available on this worker.
- **Not in the cache, cited at chapter level.** Eilenberg–Steenrod, G. W. Whitehead, Dold, McCleary, K. Brown, Serre 1951.
- **The candidate locators suggested in R07.** Not read.

## Source issues

- none
