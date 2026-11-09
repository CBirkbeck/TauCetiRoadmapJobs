# Review of QuadraticFormInvariants (pull request #617 at 2670a4e)

**Verdict:** needs changes

Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`. This is a full review: the folder changed by 176 lines since `39e8628`, the head the previous review read. Four of the previous seven findings are repaired (R02, R04, R05, R06); three are not (R01, R03, R07), and they are the three findings below. All three are P3 and none is about the mathematics: the adversarial pass, including a row-by-row recomputation of the new `ℚ_2(√5)` table, found no false statement, missing hypothesis or wrong convention, and the new values are all correct.

## Previous findings, one by one

- **R01 (gate, outside-folder) — not repaired.** The gate at this head still fails on the same five files under `Completed/`. Restated as R01 below.
- **R02 (`hilbertSymbol_productFormula` padding) — repaired.** The declaration and the import of `TauCeti.NumberTheory.QuadraticForm.Global.ProductFormula` are gone from `Suggested.lean`; the eleventh old → new line is at README 69–72; README 103–104 now says "a consumer cites both by their Tau Ceti names"; 6C item 14 (1667–1673) keeps the statement and says "the name they cite is the Tau Ceti one"; the module docstring (39–41) and the consumer list (2747–2749, 2754–2757) attribute the name to Tau Ceti. `lake env lean` on the file exits 0 with no diagnostics, and the worker's targeted build of `GlobalQuadraticForms.Suggested` passed (`build=0`). IntegralLattices at this head cites the name as a Tau Ceti declaration (`TauCetiRoadmap/IntegralLattices/README.md` 505, 1007 "T `hilbertSymbol_productFormula`").
- **R03 (merge order against the other open pull requests) — not repaired.** The description is unchanged. Restated as R02 below.
- **R04 (supplier contracts) — repaired, all four items.** (1) README 344–345 now reads "(its README, §6 *Downstream consumers*, table *Names imported from `Suggested.lean`*)", and ClassFieldTheory's README at this head has "## 6. Downstream consumers" (1113) and "### Names imported from `Suggested.lean`" (1139). (2) README 375–382 reads "[Layers 4 to 6] … Skolem–Noether (Layer 5) … `TauCeti/Algebra/CentralSimple/SkolemNoether.lean`", and the file exists at the pin; Semisimple Algebras on main has "Layer 5: Skolem-Noether and the centralizer theorem" (274). (3) README 326–333 lists *Finite extensions* with `TauCeti.algebraicExtensionValuativeRel` and `TauCeti.finiteExtension_isNonarchimedeanLocalField`, which `Completed/LocalFieldsRamification/README.md` at this head lists under that item (156–158); 6C's first bullet (1552–1553) cites the item. (4) README 349 adds `TauCeti.ClassFieldTheory.brauerGroupEquivBr` with its file `Brauer/CentralSimple/Basic.lean`, where it is defined (line 55 at the pin).
- **R05 (`LinearMap.BilinForm.IsOrthoᵢ`) — repaired.** README 501 reads "Mathlib `LinearMap.IsOrthoᵢ`", which exists (`Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean`:59; `#check` resolves).
- **R06 (acceptance item without a statement; owned examples without values) — repaired.** The "Finite dyadic specialization" bullet is deleted. The Layer 8 table (2325–2330) and the `ℚ_2(√5)` example (2687–2716) now state their values. Every value was recomputed; see the adversarial table.
- **R07 (sources manifest) — not repaired.** `packages/QuadraticFormInvariants/sources.toml` still has the same eleven keys. Restated as R03 below.

## R01 (P3) — The gate fails on five files outside the folders this review may count as the pull request's own

**Location.** The pull request as a whole. The gate's `outside-folder` list: `Completed/LocalFieldsRamification/COMPLETION.md`, `Completed/LocalFieldsRamification/README.md`, `Completed/LocalFieldsRamification/Suggested.lean`, `Completed/LocalGaloisGroups/README.md`, `Completed/LocalGaloisGroups/Suggested.lean`.

**Claim.** The gate fails, so the folder cannot be accepted, and the failure is not repairable inside `TauCetiRoadmap/QuadraticFormInvariants/`. The folders this review's brief names as the pull request's own are `ClassFieldTheory` and `IntegralLattices`; the five files above belong to neither.

**Witness.** The worker's gate at this head: `outside-folder=5 … FAIL`, every other count `0`, `build=0`. My run (`gate … --base origin/main`): `outside-folder=9` (the five above plus the four ClassFieldTheory and IntegralLattices files, which the brief does name), every other count `0`. `git diff --stat origin/main...HEAD` outside the three folders lists exactly the five files (958 insertions, 3167 deletions). The pull request's title is "fix(LocalFieldsRamification)" and its metadata declares `"roadmap": "LocalFieldsRamification"`, but that roadmap lives under `Completed/` on main, so the own-folder list does not include it. The `LocalGaloisGroups` hunks are ClassFieldTheory's consumer repair: `Completed/LocalGaloisGroups/Suggested.lean` 321–326 and 482–485 change `h2MuEquivZMod_mixed` and `h2FpEquivZMod_of_mu` to the renamed Tau Ceti signatures, and 2106–2111 replace `LocalFieldsRamification.tameInertiaEquiv` by `TauCeti.quotientWildInertiaSubgroupEquiv`. This README's Layer 6 citations (326–333, 1552–1553, 1844) point at sections that exist only in the pull request's version of `Completed/LocalFieldsRamification/README.md` ("Exact supplier contracts" at 136 and *Finite extensions* at 156; on main that file has no such heading), so the files cannot simply be dropped.

**Repair.** The pull request's description names `Completed/LocalFieldsRamification` and `Completed/LocalGaloisGroups` as its own folders (the first as its subject, the second as ClassFieldTheory's consumer repair for the renames), so that the gate's own-folder list covers them; or those edits move to a pull request that merges first and is named in this one's merge-order paragraph. Nothing in `TauCetiRoadmap/QuadraticFormInvariants/` changes: its citations are correct against the pull request's version of Local Fields Ramification.

## R02 (P3) — No merge order is stated against the four other open pull requests that change this folder

**Location.** The pull request description. Its only merge-order sentence is "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1410".

**Claim.** Four other open pull requests change `TauCetiRoadmap/QuadraticFormInvariants/README.md` and `Suggested.lean`, their heads conflict with this one, and the description says nothing about which lands first. Whichever merges second silently rewrites the other's version of this folder.

**Witness.** `scratch/overlaps.md` (index of 2026-11-09): #1187 (Tau Ceti bump), #1215 and #1411 (ClassFieldTheory) and #1797 each conflict with #617 in both files of this folder. Against the #1215 checkout available to me (head `93570aa5`), `diff` of its copy of this README with this head gives 542 differing lines, and of `Suggested.lean` 264 differing lines. The reviews of this folder on #1215 (its R02) and #1797 (its R01) raise the same point from their side, so the three descriptions are currently silent on the same question.

**Repair.** One sentence in the description, for example: "#617 merges first; #1215, #1411, #1797 and #1187 rebase their `QuadraticFormInvariants` changes onto it." Or the converse order with this pull request rebasing. The README does not change.

## R03 (P3) — Three cited works are still not recorded in the sources manifest

**Location.** README References 2768–2774 (Lam, "PRIMARY"), 2794–2797 (Delzant 1962) and 2804–2808 (Gille–Szamuely, "The reference of record for Layers 5 and 7"). Lam is cited at about forty locators, Gille–Szamuely at four (1.1.9, 1.5.2, 4.4, 4.7), Delzant at two (Conventions 234, Layer 8 2247).

**Claim.** Every cited work is recorded in the roadmap's `sources.toml` with its locator and status. These three are not, so their locators carry no status, and Lam's are the most numerous in the README.

**Witness.** `packages/QuadraticFormInvariants/sources.toml` has the keys `kahn1984`, `serre1984cmh`, `kozlowski1984`, `milnor1970`, `serre1973cia`, `serre1979lf`, `evens1963`, `guillot2010`, `omeara1963`, `scharlau1985`, `ekm2008`, and the board's history shows no change to the file since 2026-11-07.

**Repair.** Record Lam (AMS GSM 67, 2005) and Gille–Szamuely (CUP, 2nd ed. 2017) as `uncertified`, each with its DOI, `locator_scheme = "theorem"`, with the README's locators and `cited_for` Layers 0–5, 9 and Layers 2, 5, 7 respectively. Fetch Delzant, C. R. Acad. Sci. Paris 255 (1962) 1366–1368, through the sources service from an open archive of the Comptes rendus (Gallica), or record it as `uncertified` with `locator_scheme = "page"`.

## Verified sound

**Gate and dependencies.** My gate run: every count `0` except `outside-folder` (R01); the worker's run adds `build=0`. The dependency check: `depcheck: 236 roadmaps, 2270 edges, 0 problem(s)`, no UPWARD and no CYCLE line. This roadmap is on main and is not in `ORDER.txt` (only its Part II is, at line 389); its suppliers ClassFieldTheory, ProfiniteCohomology, RepresentationTheory/SemisimpleAlgebras and Completed/LocalFieldsRamification are all on main.

**Elaboration.** `lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` exits 0 with no output at all: no `sorry`, no `set_option`, no `lemma`, a single `import Mathlib` followed by 11 `TauCeti.*` modules, all present at the pin.

**Signatures.** A scratch file importing the 149 cited Tau Ceti files that have object files plus the module itself, with `#check @` of the 7 declarations, the 2 exported constants and 127 cited library declarations, elaborated with exit 1 only on four names my import list missed; all four exist in the Tau Ceti source at the pin (`Module.Basis.reflTransGen_isOrtho_isContiguous`, `Diagonal/Contiguous/Connected.lean`:70; `Module.Basis.diagonalChain_tail_of_isOrtho_of_apply_eq`, `Contiguous/Basic.lean`:74; `TauCeti.quadraticDefect_neg_five_padicTwo`, `Defect/PadicTwo.lean`:296; `TauCeti.RegularFormClass.localInvariants_neg_one_neg_one_padicTwo`, `Invariants.lean`:196). The elaborated types of the 7 declarations agree with `scratch/signatures.md` and with the README: `discr` carries `Invertible 2` and lands in `Kˣ ⧸ Subgroup.square Kˣ` (Layer 3); `hilbertSymbol` is over every field (6C item 1); `hilbertSymbol_mul` and `exists_hilbertSymbol_eq_neg_one` carry the local-field instances and `Invertible 2` (6C items 5–6); `hasseInvariant_eq_localHasse` is the 6E Milestone 1 statement on diagonal tuples. No section binder is lost.

**New supplier declarations, at the pin.**
- `TauCeti.algebraicExtensionValuativeRel K M` and `TauCeti.algebraicExtensionNormedFieldTopology K M` take `[Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]` and `[Field M] [Algebra K M] [Algebra.IsAlgebraic K M]`, as README 1545–1548 says; `TauCeti.finiteExtension_isNonarchimedeanLocalField K M` needs `[Module.Finite K M]` (1549–1551); `TauCeti.algebraicExtension_valuativeExtension` gives `ValuativeExtension K M`.
- `TauCeti.ClassFieldTheory.brauerGroupEquivBr F : Additive (BrauerGroup F) ≃+ Br F`, universe-polymorphic; `TauCeti.ClassFieldTheory.invMap K`, `TauCeti.BrauerGroup.quaternionSubgroup_eq_twoTorsion` and `invMap_brauerGroupEquivBr_quaternionClass_eq_half_iff` take `K : Type`, as 6E Milestone 2 says (1761–1776).
- `TauCeti.index_normGroup_of_isCyclic (K L : Type)` with both fields local, `[ValuativeExtension K L] [Module.Finite K L] [IsGalois K L] [IsCyclic Gal(L/K)]`, concluding `(normGroup K L).index = finrank K L`, which is 6C's "index 2" for a quadratic extension (1561–1566).
- `TauCeti.QuaternionAlgebra.isSimpleRing_of_j_sq_mul_discr_ne_zero` has hypothesis `c * QuadraticAlgebra.discr a b ≠ 0`, and Mathlib's `QuadraticAlgebra.discr a b = b ^ 2 + 4 * a` (`Mathlib/Algebra/QuadraticAlgebra/Discriminant.lean`:52), which is the README's `c·(b² + 4a) ≠ 0` (1142).
- `TauCeti.hilbertSymbol_productFormula {K : Type} [NumberField K] (a b : Kˣ)`: finite places through `unitAtFinitePlace`, real places through `TauCeti.unitAtRealPlace`, product `1` (6C item 14).

**Paths.** All 150 `TauCeti/….lean` paths and every `TauCeti/…/` directory the README cites exist at the pin.

**Cross-roadmap citations resolved.**
- ClassFieldTheory at this head: §6 *Downstream consumers* (1113) and its table *Names imported from `Suggested.lean`* (1139), which names the Layer 5 and 14 objects this README lists.
- Completed/LocalFieldsRamification at this head: *Exact supplier contracts* (136) with items *Finite extensions* (156), *Valuations and `e`, `f`* (164), *Units* (173), *Power classes* (181), *Unramified extensions* (185); *Names imported by other roadmaps* (591).
- SemisimpleAlgebras on main: Layers 4, 5 (Skolem–Noether), 6 at 249, 274, 293.
- ProfiniteCohomology on main: `ProfiniteCohomology.f2Pairing` is declared at `Suggested.lean`:5332, which resolves the `citations.md` lead.
- GlobalQuadraticForms on main uses `hilbertSymbol`, `hilbertSymbol_neg_self`, `hilbertSymbol_mul`, `exists_hilbertSymbol_eq_neg_one` (63–66, 498–499), `formClass`, `discr` (367), `localHasse` (460, 468): all declared, and the module built at this head. Its prose cites `hilbertSymbol_comm`, `exists_of_realization` and `hilbertSymbol_eq_cohomological`, which are covered by the old → new lines.
- IntegralLattices at this head consumes `hilbertSymbol_productFormula` as a Tau Ceti name (README 505, 1007, 1148).
- QuadraticFormInvariantsPartII (#1834) cites this roadmap's Layers 1, 4, 7B (its README 67, 1207, 1360, 1424) and owns nothing this roadmap owns.

**Ownership and duplication.** Every milestone is a cited Tau Ceti declaration; the roadmap owns only its worked examples and declares no second carrier (`RegularFormClass` and `formClass` are `export`ed). No `Suggested.lean` of another roadmap I can read declares a name in `TauCetiRoadmap.QuadraticFormInvariants`. The closest open roadmaps (Part II, GlobalQuadraticForms, ProfiniteCohomology) consume this one.

**Headlines and padding.** The five headlines (Layer 2 four-fold criterion, 6D classification, 7C cup-norm theorem, Layer 9 Evens value and relative formula) are stated as `example`s closed by their Tau Ceti theorems, and the docstring correctly says none is unstatable. The three one-term aliases `hilbertSymbol_neg_self`, `hilbertSymbol_mul`, `exists_hilbertSymbol_eq_neg_one` would close under the one-tactic probe, but GlobalQuadraticForms' Lean file uses them, so deleting them would break that build; they are not findings. `hasseInvariant_eq_localHasse` has a real proof and a Lean consumer (OrthogonalSpinGroups). The padding declaration of the previous review is gone.

**Seeded sample, 13 targets.** The nine targets located by a Tau Ceti declaration were checked against the elaborated declaration at the pin: "Quaternion algebras are central simple" (`instIsCentral`, `instIsSimpleRing`, the `c·(b² + 4a) ≠ 0` theorems, `completeSquareEquiv`); "The quaternion symbol in `Br(K)`" (the eleven `quaternionClass_*` statements); "The Hasse invariant" (`hasseInvariant`, `_add`, `_mk_rankOne_mul`, `omearaHasseSymbol_eq`, `quaternionClass_self`); "Classification in dimension at most three" (`eq_iff_discr_eq_and_hasseInvariant_eq`, `QuadraticForm.equivalent_iff_discr_eq_and_hasseInvariant_eq`); "The Clifford invariant" (the two central-simplicity pairs, `evenEquivOfIsometry`, `cliffordInvariant` with its two `formClass` computations and the Lam V.3.20 comparison); "The `I²` homomorphism" (all six steps' declarations); "Base change and the remaining API" (six declarations); "The symbol" (`hilbertSymbol`, `hilbertSymbol_def`); "The classical construction" (the five extension declarations above and `det_toLinearMap_eq_norm`, `normGroup`, `normUnits`, `quadraticNormSubgroup`, its index theorem). "Milestone 1" and "Milestone 2" against `quaternionSubgroup`, `quaternionSubgroupSignEquiv`, `hasseInvariant_mem_quaternionSubgroup`, `quaternionSubgroupSignEquiv_apply_hasseInvariant`, and the three universe-0 invariant statements; "Compatibility with the cup product" against `cup_kummerClass_eq_zero_iff` and `localSymbol_eq_zero_iff_cup`; "The value of the Evens norm on a Kummer class" against `galoisEvens2_kummerClass` and `_of_trace_eq_zero` and against `kahn1984` lines 763–765 (Lemme II.2.1, printed p. 241: the two cases `Tr a ≠ 0` and `Tr a = 0` exactly as written) and `serre1984cmh` lines 560–562 (Théorème 1′, with the `(2)(d_E)` term and the remark that it is `d_E` and not `d(Q_{E,s})` that enters, which README 2574 restates). Lam and Gille–Szamuely locators are under Not verifiable.

**Other locators read.** `ekm2008` lines 2986–2989 (II §10, totally singular forms, characteristic 2) and 3374–3381 (Example 13.5 (2), the Arf invariant), as cited for the characteristic-2 exclusion; `kozlowski1984` lines 34–41 (Thm 1.1); `kahn1984` line 776 (Kahn's proof of II.2.1 cites Serre's th. 1′, which the README's Layer 9 follows at `n = 2`).

**Adversarial table.** Values computed on each side; `(x,y)` is the Hilbert symbol over `ℚ_2` unless stated, computed with Serre's formula `(−1)^{ε(u)ε(v) + αω(v) + βω(u)}` and cross-checked by hand where noted; `ν = (2) ∪ (5) ≠ 0` is the nonzero element of `H²(G_ℚ₂, 𝔽₂)`.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| H1 four-fold criterion (`Suggested` 57) | `(2,5)`, `(5,5)` over `ℚ_2`; `a` a square | `x² − 2y²` with `x` a unit is `1` or `7 mod 8`, never `5`, so all five fail; `5 = 5² − 5·2²`, all hold; `a = c²`: `b = ((b+1)/2)² − c²((b−1)/(2c))²`, all hold | holds |
| H2 local classification (`Suggested` 129) | `⟨1,1⟩` vs `⟨5,5⟩`; `⟨1,1⟩` vs `⟨−1,−1⟩`; `ℝ` control | `d = [1],[1]`, `s = +1, (5,5) = +1`, and `5 = 1² + 2²` gives the isometry; `s = +1` vs `(−1,−1) = −1`, not isometric; over `ℝ`, `⟨1⁴⟩`, `⟨−1⁴⟩` share `(4,[1],+1)` and are not isometric, excluded by the local instance | holds |
| H3 cup-norm (`Suggested` 176) | `(2,5)`, `(5,5)` over `ℚ_2`; `(−1,−1)` over `ℝ` | `(2)∪(5) ≠ 0` iff `5 ≠ x² − 2y²`; `(5)∪(5) = 0` by `5 = 25 − 20`; `(−1)∪(−1) ≠ 0` iff `−1 ≠ x² + y²` | holds |
| H4 Evens value (`Suggested` 187) | `d = −1`, `a = 1 + 2i`; `a = 1`; `a = c ∈ K` | `Tr = 2`, `N = 5`: `(2)∪(5) + (2)∪(−1) = ν + 0`; `a = 1`: `(2)∪(−d) + (2)∪(d) = (2)∪(−1) = 0 = N(0)`; `a = c`: `(2c)∪(−dc²) + (2)∪(d) = (c)∪(c) + (c)∪(d) = N(res(c))` by `TauCeti.galoisEvens2_galoisRes1` | holds |
| H5 relative formula (`Suggested` 206) | `Tr a = 0`; degree 1 | LHS `w₂⟨1,−1⟩ = 0`; RHS `(2)∪(d) + (2)∪(d) + (d)∪(N a) = 0` since `N a = u² − dv²`; degree 1: `(d·N a) = (d) + (N a)` | holds |
| `ℚ_2(√5)` table (README 2701–2710), square classes | `𝒪[L]ˣ/(𝒪[L]ˣ)²` | order `16/2 = 8`; `N(±1) = 1`, `N(±ω) = −1`, `N(±√5) = −5`, `N(±√5ω) = 5`, four distinct unit classes of `ℚ_2` (`1, 7, 3, 5 mod 8`); `−1 ∉ L²` since `−1, −5 ∉ ℚ_2²`; so the eight listed classes are distinct and exhaust the unit classes | holds |
| `ℚ_2(√5)` table, `Tr`, `N`, `w₁` columns | all eight rows | `Tr ω = 1`, `Tr √5ω = √5(ω − ω') = 5`, `N(√5ω) = (−5)(−1) = 5`; `w₁ = (5·N a)`: `(5), (5), (−5), (−5), (−25) = (−1), (−1), (25) = 0, 0` | holds |
| `ℚ_2(√5)` table, `N^Ev` column | all eight rows | `(2,−5) = −1` (`ω(3) = 1`), so row `1`: `ν + ν = 0`; `(−2,−5) = +1` (`ε(7)ε(3) = 1`, `ω(3) = 1`), row `−1`: `0 + ν = ν`, agreeing with `N(res(−1)) = (−1)∪(−1) + (5)∪(−1) = ν`; rows `±ω`: `(±1)∪(5) = 0`, so `ν`; rows `±√5`: `Tr = 0`, `ν`; row `√5ω`: `(5)∪(−25) = (5)∪(−1) = 0`, so `ν`; row `−√5ω`: `(−5,−1) = −1` (`ε(3)ε(7) = 1`), so `ν + ν = 0` | holds |
| `ℚ_2(√5)` table, `w₂` column, both sides | all eight rows | RHS `ν + N^Ev + (5)∪(N a)` with `(5, N a) = +1` (norms from `K(√5)`): `ν, 0, 0, 0, 0, 0, 0, ν`. LHS on `⟨Tr a, 5·Tr a·N a⟩`: `⟨2,10⟩`: `(2)∪(2) + (2)∪(5) = 0 + ν`; `⟨−2,−10⟩`: `(−2)∪(−1) + (−2)∪(5) = ν + ν = 0` (`(−2,−1) = −1`, `(−2,5) = −1`); `⟨1,−5⟩`, `⟨−1,5⟩`: `0`; `±√5`: hyperbolic, `0`; `⟨5,5⟩`: `(5)∪(−1) = 0`; `⟨−5,−5⟩`: `(−5)∪(−1) = ν`. Both sides agree in every row | holds |
| `ℚ_2(√5)` table, separation claim (2714–2716) | each row | dropping `w₂(Tr_*⟨1⟩) = ν` or the `(2)∪(5)` term of `N^Ev` shifts the RHS by `ν ≠ 0`, so each row refutes each single variant | holds |
| Layer 8 table (2325–2330) | `a ∈ {±1, ±5, ±2, ±10}` | `w₂⟨a,a⟩ = (a)∪(−1)`: `(a,−1) = −1` for `a = −1, −5, −2, −10` (`ε(7)ε(7)`, `ε(3)ε(7)`, `ε(7)ε(7)+ω(7)·0`, product), `+1` for `1, 5, 2, 10` (sums of two squares `1, 1+4, 1+1, 9+1`); `w₂⟨1,a⟩ = 0`; `w₂⟨2,5⟩ = ν`; `w₂⟨1,−1⟩ = 0` while `∏_{i≤j}` gives `(−1)∪(−1) = ν` | holds |
| `discr` (`Suggested` 78; Layer 3 Checks) | rank 0; `⟨1,−1⟩`; `⟨1,1⟩`; `⟨1⟩`, `⟨4⟩` over `ℚ` | `[1]`; `[−1]` (`d± = [1]`); `[1]` (`d± = [−1]`); both `[1]` | holds |
| `localHasse` (`Suggested` 100; 6C Checks) | `![−1]`, `![−1,2]`, `![−1,−1]` over `ℚ_2`; `![−1,−1]` over `ℝ`, `ℚ_3` | `+1` (empty); `(−1,2) = +1` (`2 = 1 + 1`) while O'Meara's `(−1)(+1)(+1) = −1 = s·(−2,−1)`; `−1`; `−1`; `+1` (`1 + 1 ≡ −1 mod 3` lifts) | holds |
| `hasseInvariant_eq_localHasse` (`Suggested` 146) | `n = 0, 1`; `![−1,−1]` over `ℚ_2` | `ε(1) = 1 =` empty product; `s_Br = [ℍ(−1,−1)] = [D]`, `ε[D] = −1 = (−1,−1)` | holds |
| S1 central simple (1139) | `ℍ[K,a,0,b]`; `a = 0` control | `c·(0² + 4a) = 4ab ≠ 0`; `a = 0` gives `i² = 0`, not simple, excluded by `a : Kˣ` | holds |
| S2 symbol in `Br(K)` (1152) | `⟨2,−1⟩ ≅ ⟨1,−2⟩`; `(−1,3), (−1,7), (−1,21)` over `ℚ` | `2·1 − 1 = 1` represented, discriminants both `−2`, so `quaternionClass_congr` forces `β([2],[−1]) = 1`; over `ℚ` the three values are `−1, −1, −1`, so the pairing is not bilinear there, which is why bilinearity is a `Br(K)` statement and not a field-wise sign statement | holds |
| S3 Hasse invariant (1178) | `⟨a⟩ ⊥ ⟨b⟩`; scaling | `[(a,b)] = 1·1·[(a,b)]`; `∏_{i<j}(λaᵢ, λaⱼ) = (λ,−1)^{C(n,2)}(λ,d)^{n−1}s` | holds |
| S4 dimension ≤ 3 (1199) | `ℝ`: `⟨1,1⟩` vs `⟨−1,−1⟩`; dimension 4 control | same `d`, `s = 1` vs `[ℍ]`, not isometric; `⟨1⁴⟩`, `⟨−1⁴⟩` share `d, s` and differ, so `≤ 3` is needed | holds |
| S5 Clifford invariant (1209) | `⟨1ⁿ⟩` over `ℝ`, `n = 1..8`; `⟨−1,−1,−1⟩` | `C(n+1,4) = 0,0,1,5,15,35,70,126` gives `1,1,ℍ,ℍ,ℍ,ℍ,1,1`, matching `ℝ, M₂ℝ, ℍ, M₂ℍ, M₂ℍ, M₄ℍ, M₈ℝ, M₁₆ℝ`; `C₀ ≅ ℍ`, formula `[ℍ]³ = [ℍ]` | holds |
| S6 `I²` homomorphism (1232) | `ℝ`: `⟨1⁴⟩ ⊥ ⟨1³⟩`; `⟨1,1⟩ ⊥ ⟨1⟩` | `c(⟨1⁷⟩) = 1 = [ℍ][ℍ]`; `[ℍ]` vs `1·1` when neither summand is in `I²` | holds |
| S7 base change, rank ≤ 1 (1269) | hyperbolic plane; rank 0, 1 | `s⟨1,−1⟩ = [(1,−1)] = 1`; empty products | holds |
| S8 the symbol (1516) | `(1,b)`; `𝔽₂(t)`; `(−1,3)` over `ℚ_2`, `ℚ_5`, `ℚ` | `((b±1)/2)` witness; `(t,1) = +1`, `(1,t) = −1` since `x² − y² = (x+y)²`; `−1, +1, −1` | holds |
| S9 classical construction (1540) | split `a`; signature of the index theorem | `K × K` has surjective norm; `index = finrank = 2` with the hypotheses as stated | holds |
| S10, S11 Milestones 1, 2 (1746, 1761) | `ℚ_2` | `Q = {1, [ℍ(−1,−1)]}`, `ε[D] = −1 = localHasse ![−1,−1]`; `inv = 1/2 ⟺ (2,5) = −1`, true; the three invariant statements have `K : Type` | holds |
| S12 cup compatibility (1783) | `(2)∪(5)`, `(5)∪(5)` | `≠ 0 ⟺ −1`; `= 0 ⟺ 5 = 5² − 5·2²` | holds |
| 6A counts (1352) | `ℚ_2`; `ℚ_2(√5)`; `ℚ_2(√2)` | `4·2 = 8`; `4·4 = 16`; `4·2² = 16` | holds |
| 6B defects (1396, 1415, 1478) | `ℚ_2`: `1, 5, −1, −5, 5/4` | `δ = ∞, 2, 1, 1, 0`; `𝔡(−5) = 2ℤ_2 ≠ 8ℤ_2` | holds |
| 6B ramified control (1814) | `K = ℚ_2(π)`, `π² = 2`, `a = 5` | `(π + ½)² − 5/4 = π² + π + ¼ − 5/4 = 1 + π`; the `(1,√5)`-families are `≡ 1 mod (2)` while `1 + π` is not | holds |
| 6C table (1654) | basis `{−1, 2, 5}` | Gram rows `(1,0,0), (0,0,1), (0,1,0)`, determinant `1` over `𝔽₂` | holds |
| 6D realization (1699) | `(2,[1],−1)`; `(2,[−1],−1)` | `⟨−1,−1⟩` has `d = [1]`, `s = −1`; `⟨a,−a⟩` has `s = (a,−a) = +1`, so the exception is forced | holds |
| Layer 9 Evens corollaries (2475) | `1 + 2i`, `d = −1`; `√d` | `(2)∪(1+4) = (2)∪(5)` with `(2)∪(−1) = 0`; `Tr = 0` gives `(2)∪(d)` | holds |
| Layer 9 `SD₁₆` control (2678) | `d = −1`, `t = 2` | `(2)∪(5) + (−1)∪(−1) = ν + ν = 0 ≠ ν` | holds |

## Not verifiable

- **Lam, *Introduction to Quadratic Forms over Fields*, GSM 67 (2005).** Every Lam locator (I.2.3, I.3.4–3.5, I.4.1–4.9, I.5.1–5.2, I.7, II.1, II.3, III.2.2, III.2.7, III.2.11, III.4.2, V.3.4, V.3.12, V.3.16–3.21, p. 119, p. 120, VII §1, Ch. X). Not in the manifest (R03) and paywalled by the AMS; no legal open copy known to me. This affects seeded targets 2–6, whose mathematics was recomputed in the table instead.
- **Gille–Szamuely, *Central Simple Algebras and Galois Cohomology*, 2nd ed. (2017).** Locators 1.1.9, 1.5.2, 4.4, 4.7. Not in the manifest; paywalled by CUP.
- **Serre, *A Course in Arithmetic*; O'Meara §63; Serre, *Local Fields*; Scharlau; Milnor 1970.** Settled as `uncertified`; cited by locator. The Serre III Thm 1 formula and the IV Thm 6, Thm 7 and Prop. 6 statements were recomputed in the table.
- **Delzant 1962.** Not in the manifest, and this job edits no manifest, so it was not fetched; `kahn1984` lines 727–729 confirm that Kahn takes the definition of the total class from Delzant.

## Source issues

- none
