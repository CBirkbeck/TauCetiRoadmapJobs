# Review of QuadraticFormInvariants (pull request #1797 at f925965)

**Verdict:** needs changes

Full re-review of the repaired head. The folder changed by 9880 lines since `a285fd7`: `README.md` 3626 → 2610 lines, `Suggested.lean` 3873 → 295 lines, and the pull request's own `TauCetiRoadmap/IntegralLattices/Suggested.lean` gains the consumer example of the product formula on Tau Ceti's norm-equation symbols (lines 742–753). Pins unchanged: Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…`, toolchain `v4.36.0-rc2`. Every finding of the previous review is repaired (below). What remains is five P3 items: two Mathlib names that do not exist at the pin, a universe restriction that Tau Ceti imposes on 6E's second milestone and the README does not state, the unstated merge order against the other open pull request that changes this folder, missing `**Checks.**` lists for the roadmap's two own definitions, and four cited works absent from the manifest.

## R01 (P3) — Two Mathlib names that do not exist at the pin

Location: `TauCetiRoadmap/QuadraticFormInvariants/README.md` line 541 (`*Needs:* … Mathlib `QuadraticMap.dualProd``) and line 639 (Layer 1 Dependencies, ``QuadraticMap.exists_orthogonal_basis``).

Claim: both are Mathlib declarations.

Witness: a scratch file with `#check @QuadraticMap.dualProd` and `#check @QuadraticMap.exists_orthogonal_basis` elaborated against the pinned Mathlib prints `Unknown constant` for both. The pin's names are `QuadraticForm.dualProd` (`Mathlib/LinearAlgebra/QuadraticForm/Dual.lean:85`) and `LinearMap.BilinForm.exists_orthogonal_basis` (`Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1331`, inside `namespace LinearMap.BilinForm`; `QuadraticForm.exists_orthogonal_basis` is also unknown).

Repair: write `QuadraticForm.dualProd` at 541 and `LinearMap.BilinForm.exists_orthogonal_basis` at 639. The other 677 dotted names of the README resolve at the pin (Verified sound).

## R02 (P3) — Milestone 2 of 6E is consumed at a generality Tau Ceti does not provide

Location: README 1627–1640, `**Milestone 2.** ε is the degree-two local invariant. Precisely, Q(K) = Br(K)[2] (TauCeti.BrauerGroup.quaternionSubgroup_eq_twoTorsion …)`, with `invMap_brauerGroupEquivBr_quaternionClass_eq_half_iff` and `h2MuEquivZMod_eq_one_iff_hilbertSymbol_eq_neg_one`.

Claim: the milestone holds for the roadmap's `K`, which the conventions take as an arbitrary field with `[Invertible (2 : K)]` (and Layer 7B item 5 says "no field is replaced by an equivalent field in universe 0").

Witness: at the pin all three declarations sit under `variable (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]` (`TauCeti/NumberTheory/LocalField/Quaternion/Invariant.lean:60–92`), because `TauCeti.ClassFieldTheory.invMap` is itself declared for `K : Type` (`TauCeti/NumberTheory/ClassFieldTheory/Brauer/Invariant.lean:200`, under `variable (K : Type)`). Milestone 1 and the cup compatibility (`quaternionSubgroupSignEquiv`, `brauer2EquivH2_quaternionClass`) are universe-polymorphic.

Repair: say in Milestone 2 that Tau Ceti states it for a local field in universe `0`, which is the universe of Class Field Theory's local invariant, and that a consumer in a higher universe reaches it through the universe-change comparison of Layer 7B item 5 (`TauCeti.brauerCohomologyEquiv_uliftEquiv`) or restates it there. One sentence; no Lean change.

## R03 (P3) — The other open pull request that changes this folder has no stated order

Location: the pull-request description (data), which names no other pull request; `scratch/overlaps.md` lists #1215 (ClassFieldTheory: correct hypotheses, conductors and lifting) as conflicting with #1797 in `TauCetiRoadmap/QuadraticFormInvariants/README.md` and `Suggested.lean`.

Claim (the overlap rule): when two open heads change the same folder, one is rebased on the other before either merges, and the order is stated.

Witness: `roadmaps show QuadraticFormInvariants --pr 1215` prints the folder in its old form (3452-line `Suggested.lean` importing `TauCetiRoadmap.ProfiniteCohomology.Suggested` and `Completed.LocalFieldsRamification.Suggested`); its diff against main (251 Lean lines, 146 README lines) replaces the `TauCetiRoadmap.ClassFieldTheory.Suggested` import by `TauCeti.NumberTheory.ClassFieldTheory.{Global.Hilbert.Reciprocity,Local.Symbol}` and repoints the class-field-theory contract at `TauCeti.ClassFieldTheory`. This head already contains everything that edit achieves (no roadmap import, native class-field-theory names), so the two change the same target differently.

Repair: state in the pull-request description that this head's folder supersedes #1215's edits to it and that #1215 rebases on #1797 and drops its changes to this folder (or the reverse, if the author prefers; then this folder is re-applied on top). Nothing in the README changes: the README names no pull request.

## R04 (P3) — The roadmap's own definitions carry no `**Checks.**` lists

Location: README 785–797 (Layer 3, "This roadmap's `discr` is the plain discriminant read in `Kˣ ⧸ (Kˣ)²` … declared in `Suggested.lean`") and 1481–1484 (6C item 7, "This roadmap's `localHasse` is the same product on a diagonal tuple"); `Suggested.lean` 71–74 and 104–106 give them real bodies. `grep -c 'Checks' README.md` prints 0.

Claim: the house shape gives every definition at least three discriminating Checks.

Witness: `discr` and `localHasse` are the only declarations of this roadmap with bodies of their own (the rest are `abbrev`s, an `export`, or theorems proved by native terms). Each plausible wrong model is excluded only by values that the layer Examples state in passing: for `localHasse`, O'Meara's `∏_{i≤j}` on `![−1, 2]` over `ℚ_2` is `(−1,−1)(−1,2)(2,2) = −1` while the `i<j` product is `(−1,2) = +1`; for `discr`, the signed discriminant on `⟨1,1⟩` is `[−1]` while `discr` is `[1]`.

Repair: add a `**Checks.**` list to each. For `localHasse`: ranks `0` and `1` give `1` (empty filter); `localHasse ![a, −a] = 1` by `−a = 0² − a·1²`; `localHasse ![−1, 2]` over `ℚ_2` is `+1`, which separates it from O'Meara's `∏_{i≤j}` (value `−1`) and from any product that includes the diagonal; `localHasse ![−1, −1]` over `ℚ_2` is `−1` and over `ℚ_3` is `+1`, which separates it from the constant `1`. For `discr`: `discr (formClass ⟨1, −1⟩) = [−1]`; rank `0` gives `1`; on `⟨1,1⟩` the value is `[1]` while `signedDiscr` is `[−1]`, which excludes the signed convention; agreement with `TauCeti.RegularFormClass.discr` through `TauCeti.multiplicativeSquareClassEquiv_mk` on `⟨a⟩`.

## R05 (P3) — Four cited works are not in the manifest

Location: README References 2564 (Lam 2005, marked PRIMARY), 2581 (O'Meara 1955), 2598 (Gille–Szamuely 2017, "the reference of record for Layers 5 and 7"), 2609 (Grove 2002). Lam carries the locators of Layers 0–5 and 9 (I.2–I.7, II.1–3, III.2.7, III.2.11, V.3.12–3.21, VII.1, X), Gille–Szamuely those of Layers 2, 5 and 7 (1.1.9, 1.5.2, 4.4, 4.7).

Witness: `board/packages/QuadraticFormInvariants/sources.toml` has eleven keys (`kahn1984`, `serre1984cmh`, `kozlowski1984`, `milnor1970`, `serre1973cia`, `serre1979lf`, `evens1963`, `guillot2010`, `omeara1963`, `scharlau1985`, `ekm2008`); none is Lam, Gille–Szamuely, Grove or O'Meara 1955.

Repair: record the four as `uncertified` entries (DOI or "Authors, Title, Year", `locator_scheme = theorem` for Lam and Gille–Szamuely, `section` for Grove, `page` for O'Meara 1955, and `cited_for` the layers above), as `omeara1963` and `scharlau1985` already are. No text need be fetched: every statement cited to them was checked here against the pinned declarations and by computation.

## Previous findings

- R01 — repaired. `Suggested.lean` 1–17 import `Mathlib` and sixteen `TauCeti.*` modules only; no roadmap module. `grep -c sorry Suggested.lean` prints 0. The two headlines are the examples at 262–276 (`TauCeti.galoisEvens2_kummerClass σ hdeg d hx hx2 a t ht`) and 278–291 (`TauCeti.sw2Class_formClass_traceTransfer_smul_sq σ hfin a ha h1`). README 305–316 now says the ProfiniteCohomology prototypes `cup`, `f2Pairing`, `inhomogeneousCochain2`, `homClass`, `cochainClass`, `galoisF2Iso` "are that roadmap's prototypes … Layers 7 to 9 are therefore stated on Tau Ceti's native operations listed above, never on those prototypes"; re-checked against `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean` on main (sorry'd `def`s at 431, 3868, 5145, 5332, 5537, 5846).
- R02 — repaired. 15 declarations remain, every one proved by a native term; the file's docstring (31–39) lists them as the names the three consumers use, and each is used on main (Verified sound).
- R03 — repaired. The `(dim, d, s)` classification is the example at 239–249, discharged by `QuadraticForm.equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq Q hQ hR`.
- R04 — repaired. No `def`, `abbrev` or `instance` has a `sorry` body; `grep -c set_option` prints 0; gate `sorry-data=0 set_option=0`.
- R05 — repaired. `grep` for `Completion audit`, `#print axioms`, `B11a`, `a91d3aa`, `/absolute/path`, `migration and provenance` prints nothing.
- R06 — repaired. `NormControl.lean` and `RegularFormClass/Matrix.lean` are gone; the Pfister names are the pin's `_iff` forms (README 271, 979); "canonical owner", "in both halves", "frozen declaration" and "exported to Global Quadratic Forms" are gone; 6C item 14 now says the product formula is Tau Ceti's and "consumed under this roadmap's name".
- R07 — repaired. My gate run (`--build`) prints `tex=0 sorry-examples=0 imports=0 readme-ids-missing=0 build=0`.
- R08 — repaired. The fused labels are gone; the README has `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, 72 `*Needs:*` lines, and `### Examples` / `### Dependencies` in each of the ten layers.
- R09 — repaired. `lake env lean` on `Suggested.lean` at this head: exit 0 in 196 s with no diagnostic at all.

## Verified sound

**Gate and dependency check.** My gate run at this head with `--build`: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=51 source-material=0 build=0 FAIL`; every `outside-folder` line is under `AlgebraicTopology/`, `GeometricTopology/`, `IntegralLattices/`, `ReductiveGroups/` or `RepresentationTheory/LieHighestWeight/`, the folders the brief names as the pull request's own. `git diff --stat origin/main...HEAD` outside those folders and this one is empty; `lake-manifest.json` and `lean-toolchain` are unchanged. `gate --depcheck … --movable` prints `depcheck: 238 roadmaps, 2356 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` from the worktree: exit 0, 196 s, no warning. The worker's `signatures.md` flags `[Invertible (2 : K)]` as "looks dropped" on `hilbertSymbol_mul`, `exists_hilbertSymbol_eq_neg_one` and `hasseInvariant_eq_localHasse`; the elaborated types it prints carry `[Invertible 2]`, so these are false leads. Each of the 15 elaborated types agrees with its README statement: `discr : RegularFormClass K → Kˣ ⧸ Subgroup.square Kˣ` (README 125–133), `localHasse` the `i<j` product (1481–1484), `hilbertSymbol_unramified` with the norm-equation hypothesis on `Δ` (1341–1343), `hilbertSymbol_mul` and `exists_hilbertSymbol_eq_neg_one` over a nonarchimedean local field with `2` invertible (1472–1480), `exists_of_realization` with `h₁`, `h₂` (1565–1570), `hasseInvariant_eq_localHasse` as an injective sign homomorphism on `Subgroup.closure` of the quaternion classes (1612–1620), `hilbertSymbol_productFormula` for `F : Type` a number field (1534–1539), `hilbertSymbol_eq_cohomological` over every field with `2` invertible (1527–1533).

**Names at the pin.** The 695 dotted backticked names of the README were resolved by full namespace against the pinned `TauCeti/` and `Mathlib/` trees (a namespace-aware index of every `theorem/def/abbrev/instance/structure/class` line): 677 resolve exactly as written. Of the 18 others, 10 are the LocalFieldsRamification and ProfiniteCohomology prototypes, which the README calls prototypes and which exist on main (`Completed/LocalFieldsRamification/Suggested.lean` 708, 720, 857, 870; `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean` 431, 3868, 5145, 5332, 5537, 5846); `Algebra.GrothendieckAddGroup`, `AddSubgroup.closure`, `Ideal.Cotangent`, `Ideal.Quotient`, `Quotient.mk`, `QuadraticForm.discr'_weightedSumSquares` and `QuadraticForm.exists_equivalent_hyperbolicPresentation_prod` exist (Mathlib probe, or `_root_` declarations in Tau Ceti); the remaining two are R01. The 245 cited file paths (after brace expansion) all exist in the pinned trees. The worker's two citation leads are the roadmap prototypes above, not defects.

**Seeded sample, each passage read at this head and its declarations opened at the pin** (files under `TauCeti/`):

- "Quaternion algebras are central simple" (README 1053–1064): `instIsCentral` and `instIsSimpleRing` (`Algebra/Quaternion/CentralSimple.lean:151, 69`) under `[Field K] [Invertible (2 : K)]`; `isSimpleRing_of_j_sq_mul_discr_ne_zero` with `c * QuadraticAlgebra.discr a b ≠ 0` (81), `isCentral_of_j_sq_ne_zero_or_discr_ne_zero` (198); `completeSquareEquiv a b c : ℍ[R,a,b,c] ≃ₐ[R] ℍ[R, discr a b, 0, c]` (`SymbolEquiv.lean:104`), and Mathlib's `QuadraticAlgebra.discr a b = b ^ 2 + 4 * a` (`#print`), so "(b² + 4a, c)" is right.
- "The quaternion symbol in `Br(K)`" (1066–1090): `quaternionClass_comm` (173), `_mul_sq_right` (177), `_sq` (212), `_mul` (255), `_mul_left` (271), `_one_sub` with `(1 : K) − a ≠ 0` (244), `_neg_self` (230), `quaternionClassOnSquareClasses` (327), `_congr` from `⟨a,b⟩ ≅ ⟨c,d⟩` (380), `_self` (285), all in `Algebra/Quaternion/BrauerClass.lean`.
- "The Hasse invariant" (1092–1111): `hasseInvariant_add` with the `[(d(x), d(y))]` term (`Hasse/Basic.lean:241`); `hasseInvariant_mk_rankOne_mul` with exponents `(rank x).choose 2` and `rank x − 1` (253); `omearaHasseSymbol_eq` as `∏_{i≤j} = s · [(d, −1)]` (144); `hasseInvariant_mem_quaternionSubgroup` (133).
- "Classification in dimension at most three" (1113–1120): `eq_iff_discr_eq_and_hasseInvariant_eq` with `hrank : x.rank = y.rank` and `h3 : x.rank ≤ 3` (`LowRank.lean:126`); the form-level version with `hdim` and `h3 : finrank ≤ 3` (158).
- "The Clifford invariant" (1123–1144): `cliffordInvariant_eq_hasseInvariant_mul` with exponents `(x.rank − 1).choose 2` on `[(−1, d)]` and `(x.rank + 1).choose 4` on `[(−1,−1)]` (`RegularFormClass/Clifford.lean:570`); the `I²` form with `m.choose 2` (597); the central-simplicity theorems in `CliffordAlgebra/CentralSimple/{Basic,Even}.lean`.
- "The `I²` homomorphism" (1146–1179): the six steps are `cliffordInvariant_add_of_signedDiscr_eq_zero` (657), `WittRing.cliffordInvariant_add_of_mem_fundamentalIdeal_sq` (`Witt/Clifford.lean:93`), `cliffordInvariant_pfisterFormClass_two = quaternionClass a b` (`Pfister/Clifford.lean:72`), `_three = 1` (116), `cliffordInvariant_eq_one_of_mem_fundamentalIdeal_cube` (111), `cliffordHomI2 : ↥(fundamentalIdeal K ^ 2) →+ Additive (BrauerGroup K)` (142) with `_pfisterClass` (157), `_two_torsion` (163), `_eq_zero` (167), `cliffordHomI2Bar` on the quotient by `fundamentalI3InI2` (187) with `_mk` (193).
- "Base change and the remaining API" (1181–1191): `hasseInvariant_baseChange` (`Hasse/BaseChange.lean:43`), `cliffordInvariant_baseChange` (`Clifford.lean:708`), `baseChange_quaternionClass` (`Quaternion/BaseChange.lean:201`), `hasseInvariant_eq_one_of_rank_le_one` (169).
- "The symbol" (1414–1421): `hilbertSymbol` over any field (`HilbertSymbol/Basic.lean:47`), `hilbertSymbol_def` (52); `hilbertSymbol_congr_sq` and `hilbertSymbol_neg_self` need no `Invertible` (147, 102), `hilbertSymbol_comm` does (251).
- "The classical construction, before any cohomological normalization" (1424–1453): `algebraicExtensionValuativeRel`, `algebraicExtensionNormedFieldTopology` (`AlgebraicExtension/Basic.lean:130, 86`), `finiteExtension_isNonarchimedeanLocalField` (`FiniteExtension/Basic.lean:54`), `algebraicExtension_valuativeExtension` (147); Mathlib's `QuadraticAlgebra.det_toLinearMap_eq_norm` (`Mathlib/Algebra/QuadraticAlgebra/NormDeterminant.lean:30`); `quadraticNormSubgroup_index_eq_two_of_not_isSquare` under `(2 : K) ≠ 0` (`Bimultiplicativity.lean:82`); `index_normGroup_of_isCyclic : (normGroup K L).index = finrank K L` (`ClassFieldTheory/Brauer/LocalH2Bound.lean:70`), which is `2` in degree two; `hilbertSymbol_mul_iff_quadraticNormSubgroup_index_dvd_two` (`NormSubgroup.lean:266`).
- "Milestone 1" (1612–1625): `quaternionSubgroupSignEquiv : quaternionSubgroup K ≃* ℤˣ` (`LocalField/Quaternion/Subgroup.lean:114`), `natCard_quaternionSubgroup = 2` (90), `quaternionSubgroupSignEquiv_apply_hasseInvariant` (`QuadraticForm/Brauer.lean:43`), which is exactly what `hasseInvariant_eq_localHasse` in `Suggested.lean` 168–183 repackages.
- "Milestone 2" (1627–1640): the three declarations of R02 and `hilbertSymbol_eq_hilbertSign_kummerBrauerClass` (`MuTwo/LocalSymbol.lean:213`), `localSymbol_eq_zero_iff_hilbertSymbol_eq_one` (169); all match the README's statements apart from the universe.
- "Compatibility with the cup product" (1641–1646): `brauer2EquivH2_quaternionClass` (`CrossedProduct/CupProduct.lean:362`) and `cup_kummerClass_eq_zero_iff_hilbertSymbol_eq_one` (`MuTwo/CupNorm.lean:132`); with Milestone 1 the composite sends `(a) ∪ (b)` to `(a,b)_K`, as stated.
- "The value of the Evens norm on a Kummer class" (2321–2336): `galoisEvens2_kummerClass` (`StiefelWhitney/Evens/Kummer/Value.lean:220`), `_of_trace_eq_zero` (182), `_one_add` with `1 − t²d ≠ 0` (329), `_sqrt` (204), `_eq_cup_add_cup` (77). Source: `kahn1984` line 763–765, Lemme II.2.1: `N((a)) = (Tr a, −d·N a) + (2, d)` if `Tr a ≠ 0`, `= (2, d)` if `Tr a = 0`; its proof (776–788) is Serre's Théorème 1′ plus the basis `1, √d/a`, with `(2,2) = (2,−1) = 0` noted at 769. `serre1984cmh` line 560–562, Théorème 1′: the `(2)(d_E)` term, with the remark that `d_E` and not `d(Q_{E,a})` enters. `kahn1984` line 55, Théorème 2: `w(T(q)) = N(w(q))·w(T(1))^r`; line 1044–1059, Proposition II.3.5: the quadratic, rank-one case, whose proof reduces to Lemme II.2.1 exactly as README 2486–2500 does. `kozlowski1984` line 34–41, Theorem 1.1: the transfer for 2-coverings commutes with the total class.

**Consumers and overlaps.** On main, `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` imports this module (line 5) and uses `hilbertSymbol`, `hilbertSymbol_neg_self`, `hilbertSymbol_mul`, `exists_hilbertSymbol_eq_neg_one` (63–66, 498–499), `formClass`, `discr` (367), `localHasse` (460, 468); its README cites `wittRing`, `toWittRing` (129, 909), `hilbertSymbol_unramified` (124, 313), `hilbertSymbol_comm`, `exists_of_realization`, `hilbertSymbol_eq_cohomological`, `hilbertSymbol_productFormula`. `Completed/OrthogonalSpinGroups/Suggested.lean` `#check`s `hilbertSymbol`, `localHasse`, `hasseInvariant_eq_localHasse` (84–86). `TauCetiRoadmap/IntegralLattices` on main cites `hilbertSymbol_productFormula` and Layer 6D in its README only (476, 898, 1027, 2229, 2305); the pull request's own copy applies `hilbertSymbol_productFormula ℚ a b` at 753 and builds (gate `build=0` on the targeted build that includes it). Every name a consumer cites is declared here; the 288 declarations of the old file that are gone are cited by no consumer. Overlap leads: no dropped id, no id defined only by an open revision, no second owner; #1187 (the Tau Ceti bump) conflicts in `Suggested.lean` and shares no target; #1215 is R03. The closest open roadmaps: `QuadraticFormInvariantsPartII` (#1834) says it "continues `QuadraticFormInvariants` past the point where it stops" and owns exactly the three exclusions of this README's Scope (characteristic two, deep Pfister theory, cohomological invariants beyond Stiefel–Whitney); the open `GlobalQuadraticForms` head (#1200) mentions this namespace nowhere. The board's packages index lists no other quadratic-form package.

**Supplier citations resolved on main.** ClassFieldTheory `### Layer 3` (838), `### Layer 5` (920; `localSymbol`, `kummerCupPairing`, `invMap`, `h2MuEquivZMod`, `muNRep`, `kummerClass` occur there), `### Layer 14` (1872; `hilbertProductFormula`, `finiteHilbertInvariantAt`, `infiniteHilbertInvariantAt`); LocalFieldsRamification Layers 0–2 (72, 281, 576); ProfiniteCohomology Layers 0–4, 8, 9, 10 (corestriction occurs 13 times in 1549–1739), 12, 13 (`D₁₆`, wreath, pullback occur in 2163–2300); SemisimpleAlgebras Layers 4–6 (249, 274, 293); `Completed/Multiquadratic/README.md` exists. All are earlier in the merge order or on main; the depcheck confirms.

**Adversarial table.**

| Statement | Instances | Values | Result |
|---|---|---|---|
| `discr` (Lean 71) | `⟨1,−1⟩`; rank `0`; `⟨1,1⟩` | `[−1]`; `1`; `discr = [1]`, `signedDiscr = (−1)^1·1 = [−1]` | holds; signed model excluded (R04 Check) |
| `localHasse` (104) | `n = 0, 1`; `![a,−a]`; `![−1,2]` over `ℚ_2` | empty filter → `1`; `(a,−a) = 1` by `−a = 0² − a·1²`; `i<j`: `(−1,2) = +1` (`2 = 1² + 1²`); `i≤j`: `(−1,−1)(−1,2)(2,2) = (−1)(+1)(+1) = −1` | holds; O'Meara model excluded |
| `hilbertSymbol_unramified` (134) | `ℚ_2`, `Δ = 5`, `b = 2`; `b = −1` | `v(2) = 1` odd → `−1`, and `(2,5)_{ℚ_2} = −1`; `v(−1) = 0` → `+1`, and `−1 = 2² − 5·1²` | holds |
| `hilbertSymbol_mul` (144) | `ℚ_2`: `a = 2, b = 5, c = −1` | `(2,−5)`: `u = 1, v = 3`: `ε(1)ε(3) + 1·ω(3) + 0 = 1` → `−1`; `(2,5)(2,−1) = (−1)(+1) = −1` | holds |
| `exists_hilbertSymbol_eq_neg_one` (150) | `ℚ_2`: `a = 5`; `a = −1` | `b = 2` → `−1`; `b = 3` → `−1` (`3` not a sum of two squares in `ℚ_2`) | holds |
| `exists_of_realization` (158) | `(1,[1],−1)`; `(2,[−1],−1)`; `(2,[1],−1)` over `ℚ_2`; `(3,[1],−1)` | excluded by `h₁`; by `h₂`; `⟨−1,−1⟩`: `d = [1]`, `s = (−1,−1) = −1`; `⟨−1,−1,1⟩`: `d = [1]`, `s = (−1)(+1)(+1) = −1` | holds |
| `hasseInvariant_eq_localHasse` (168) | `ℚ_2`: `![−1,−1]`; `![a,−a]` | `ε[ℍ] = −1 = (−1,−1)_{ℚ_2}`; `ε(1) = 1 = (a,−a)` | holds |
| `hilbertSymbol_productFormula` (195) | `ℚ`: `(−1,−1)`; `(2,5)` | `(−1,−1)_2 = −1`, odd `p`: `+1`, `ℝ`: `−1` → product `1`; `(2,5)_2 = −1`, `(2,5)_5 = (2/5) = −1`, others `+1` → `1` | holds |
| `hilbertSymbol_eq_cohomological` (206) | `a` a square | `(a) = 0`, local symbol `0`, sign `+1`; `b = x² − a y²` solvable with `y = 0` | holds; vacuous (no `tr`) when `H²(μ₂) ≠ ZMod 2`, as the hypothesis says |
| Four-fold criterion (226) | `a = c²` | (1) splits; (2) norm from `K×K` onto; (3) `x − cy = 1, x + cy = b` (2 invertible); (4) `(c,1,0)`; (5) isotropic | all five hold, as README 716–717 say |
| `(dim,d,s)` classification (239) | `ℝ`: `⟨1⟩⁴`, `⟨−1⟩⁴` | `d = 1, 1`; `s = 1, (−1)⁶ = 1`; not isometric | local hypothesis needed, as README 1601 says |
| Cup-norm (254) | `a` a square | cup `0` ⇔ `b = x² − a y²` solvable (`y = 0`) | both directions hold |
| Evens value (265) | `ℚ_2`, `d = −1`, `a = 1+2i`; `a = i` | `Tr = 2`, `N = 5`: `(2)∪(5) + (2)∪(−1) = (2)∪(5) ≠ 0`; trace zero: `(2)∪(−1) = 0 = (2)∪(d)` (`−1 = 1² − 2·1²`) | holds; agrees with `_sqrt` |
| Relative formula, degree 2 (282) | `Tr a = 0`, `a = t√d` | lhs `w₂⟨1,−1⟩ = 0`; rhs `(2)∪(d) + (2)∪(d) + (d)∪(−dt²) = 0 + (d)∪(−d) = 0` | holds |
| Degree 1 (README 2486) | general `a` | `w₁(Tr⟨a⟩) = (d·N a)`, `w₁(Tr⟨1⟩) + cor(a) = (d) + (N a)` | holds |
| Kahn basis (2250) | `a = 1+2i` over `ℚ_2(i)` | `Tr⟨a⟩ ≅ ⟨2, −2/5⟩ ~ ⟨2,−10⟩`; `w₂ = (2)∪(−10) = (2)∪(−1) + (2)∪(2) + (2)∪(5) = (2)∪(5)`; `(Tr a)∪(−d N a) = (2)∪(5)` | holds |
| `w₂(Tr⟨1⟩)` (2489) | `⟨2,2d⟩` | `(2)∪(2d) = (2)∪(2) + (2)∪(d) = (2)∪(−1) + (2)∪(d) = (2)∪(d)` | holds |
| Lam V.3.20 exponents (README 157, 1135) | `n = 1..8` | `C(n−1,2) mod 2 = 0,0,1,1,0,0,1,1`; `C(n+1,4) mod 2 = 0,0,1,1,1,1,0,0`; gives `c = s; s; s(−1,−d); s(−1,−d); s(−1,−1); s(−1,−1); s(−1,d); s(−1,d)` | holds (Lam's eight cases) |
| Clifford invariant of `⟨1⟩ⁿ` over `ℝ` (1200) | `n = 1..8` | `C(n+1,4)` odd for `n = 3..6` → `1,1,[ℍ],[ℍ],[ℍ],[ℍ],1,1`; algebras `ℝ, M₂(ℝ), ℍ, M₂(ℍ), M₂(ℍ), M₄(ℍ), M₈(ℝ), M₁₆(ℝ)` (odd `n`: even part) | holds |
| `s(λq)` formula (1102) | general `n` | `∏_{i<j}(λa_i,λa_j) = (λ,λ)^{C(n,2)}(λ,∏_{i<j}a_ia_j)·s = (λ,−1)^{C(n,2)}(λ,d)^{n−1}s` | holds; `n = 0`: both sides `1` (junk `0 − 1 = 0`) |
| `s(q ⊥ r)` (1101) | `⟨a⟩ ⊥ ⟨b⟩` | `[(a,b)]` vs `1·1·[(a,b)]` | holds |
| O'Meara's symbol (1107) | general | `∏_{i≤j} = s·∏_i(a_i,a_i) = s·∏_i(a_i,−1) = s·(d,−1)` | holds |
| `c(⟨⟨a,b⟩⟩) = [(a,b)]` (1158) | `⟨1,−a,−b,ab⟩` | `s = (−a,−a)(−b,ab) = (−a,−1)(−b,a) = (−1,−1)(a,b)`; `c = s·(−1,1)^3·(−1,−1)^5 = (a,b)` | holds; `I²` form `c = s(−1,−1)^{C(2,2)}` agrees |
| `I⁰` warning (949) | `ℚ` | `⟨2⟩ ∉ ℤ·⟨1⟩` in `W(ℚ)` (signature `1` forces `⟨1⟩`, not isometric) | holds |
| Serre's `ℚ_2` formula (1690) | `(2,5),(−1,−1),(5,5),(2,−1),(−1,5),(2,2),(−1,2)` | `ε(1,3,5,7) = 0,1,0,1`, `ω = 0,1,1,0`; exponents `1,1,0,0,0,0,0` | `−1,−1,+1,+1,+1,+1,+1`, as README 1690 |
| Odd-residue formula (1688) | `a = π^α u`, `b = π^β u'` | `(π,π)^{αβ}(π,u')^α(u,π)^β(u,u')`, `(u,u') = 1`, `(π,π) = (π,−1) = χ(−1)` | holds; matches `hilbertSymbol_oddResidue_formula` |
| Defects over `ℚ_2` (1325, 1402) | `5`; `−1`; `−5` | `5 − ξ² ≡ 4 mod 8` for odd `ξ` → `δ = 2 = 2e`; `−1 − ξ² ≡ −2 mod 8` → `δ = 1`; `−5 − ξ² ≡ −6 mod 8` → `δ = 1`, so `𝔡(−5) = 2ℤ_2 ≠ 8ℤ_2` | holds |
| Local square theorem sharpness (1282) | `ℚ_2` | `5 ∈ U(2) = 1 + 4ℤ_2`, `5` not a square; `1 + 8ℤ_2 ⊆` squares | holds |
| Ramified-base control (1672) | `K = ℚ_2(π)`, `π² = 2`, `a = 5` | `(π + ½)² − 5·¼ = 2 + π + ¼ − 5/4 = 1 + π`; `u²(1 − 5t²) ≡ 1 mod π²` for unit members (`t = 2s + t₁π` gives `t² ≡ 2t₁² mod 4`), while `1 + π ↦ 1 + ε` | holds |
| Index of `U(K,2e−d+1)(𝒪ˣ)²` (1396) | `ℚ_2(√2)`, `d = 1`, `e = 2` | `(1 + π²y)² = 1 + π⁴(y + y²) ∈ U(5)`, so `U(4) ⊄ (𝒪ˣ)²`; `#𝒪ˣ/(𝒪ˣ)² = 8`; index `8/2 = 4` | "4 or more" holds |
| `μ₂` action (1738) | `n = 2`; `n = 3` over `ℚ` | `{±1} ⊆ K` fixed; `μ₃ ⊄ ℚ`, action nontrivial | holds |
| Pfister slot formula (180, 979) | `n = 2`, `k = 3` | `S = {0,1}`, slot `(−a)(−b) = ab`; `⟨1,−a,−b,ab⟩` | holds |
| Bimultiplicativity over `ℚ` (1542) | `a = −1`; `b = 3, c = 7` | `3, 7, 21` not sums of two rational squares | fails over `ℚ`, as stated |

**One-tactic probe.** Not applicable: the file has no `sorry`; every theorem is closed by the native term its docstring names, and the five examples are the headlines (the README names them at 10–15 and 347–348).

**Sources read in the cache this round:** `kahn1984` lines 55, 763–788, 1044–1059; `serre1984cmh` 556–562; `kozlowski1984` 34–41. Each supports the README statement citing it. No `needs-references.toml` was written.

## Not verifiable

- T. Y. Lam, *Introduction to Quadratic Forms over Fields* (2005); P. Gille and T. Szamuely, *Central Simple Algebras and Galois Cohomology* (2017); L. C. Grove (2002); O'Meara (1955): no legal copy in the cache and none in the manifest (R05). Every statement cited to them in the seeded sample was checked against the pinned declarations and by the computations in the table; the numbering (Lam V.3.16–3.21, III.2.7, III.2.11; Gille–Szamuely 1.1.9, 1.5.2, 4.4, 4.7) is cited on the author's authority.
- `serre1973cia`, `serre1979lf`, `milnor1970`, `omeara1963`, `scharlau1985`: settled as uncertified; cited by locator.
- Ownership against open pull requests: checked through the brief's sibling checkouts (`QuadraticFormInvariantsPartII` #1834, `GlobalQuadraticForms` #1200, `ClassFieldTheory` #1215, `ProfiniteCohomology` #616), the overlap leads and the board's packages index. No second owner of this roadmap's objects was found.

## Source issues

- none
