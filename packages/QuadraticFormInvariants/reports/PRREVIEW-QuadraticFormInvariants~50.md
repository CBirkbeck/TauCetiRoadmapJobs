# Review of QuadraticFormInvariants (pull request #1411 at 37bd865)

**Verdict:** needs changes

Ten findings: one P2 and nine P3. `Suggested.lean` elaborates with no warning, the dependency check is clean, and every computed Check holds except the two in R05. The P2 is a README sentence that states a Tau Ceti comparison theorem more generally than its signature. The P3s are re-exports that no roadmap uses in Lean, consumer bookkeeping, slips in how the README describes consumed declarations, missing locators, the stated merge order, one edit outside the reviewed folders, and the sources manifest.

## R01 (P2) — The cohomological comparison is stated "over every field", but it needs an identification `H²(G_F, μ₂) ≃+ ZMod 2`

Location: `TauCetiRoadmap/QuadraticFormInvariants/README.md` line 1618 (6C item 13): "over every field in which `2` is invertible. The comparison runs through Layer 7C's cup-norm theorem". The same phrase is at `Suggested.lean` lines 204–207, the docstring of `hilbertSymbol_eq_cohomological`.

Claim: the norm-equation symbol is the sign of Class Field Theory's Kummer-cup local symbol over every field in which `2` is invertible.

Witness: `TauCeti.hilbertSymbol_eq_cohomological` (`FieldTheory/GaloisCohomology/MuTwo/LocalSymbol.lean:191`) and `Suggested.lean` line 210 both take `tr : H²(G_F, μ₂) ≃+ ZMod 2`. Over `𝔽₃`, `cd G = 1`, so `H²(G_{𝔽₃}, μ₂) = 0`. No `tr` exists there, so there is no local symbol.

Repair: in both places, replace "over every field in which `2` is invertible" with "for a field `F` in which `2` is invertible, given an additive identification `tr : H²(G_F, μ₂) ≃+ ZMod 2` (one exists over a nonarchimedean local field and over `ℝ`, where that group has two elements)". Tested: over `ℝ` a `tr` exists, and `(−1,−1)_ℝ = −1 = hilbertSign 1` because `(−1) ∪ (−1) ≠ 0`. Over `𝔽₃` the restated sentence claims nothing.

## R02 (P3) — Nine re-exports in `Suggested.lean` have no Lean consumer: an API catalogue, not the acceptance test

Location: `Suggested.lean` line 68 (`RegularFormClass` in the `export`); 95–103 (`wittRing`, `toWittRing`); 138–152 (`hilbertSymbol_comm`, `hilbertSymbol_unramified`); 170–174 (`export TauCeti (hilbertSign)`); 189–202 (the sign-form `hilbertSymbol_productFormula`); 204–216 (`hilbertSymbol_eq_cohomological`); 237–247 (`exists_of_realization`). Lines 26–28 also say the file "restates nothing that Tau Ceti already has".

Claim: these are "the names other roadmaps import or cite", and so they belong in the acceptance test.

Witness: each is a re-export or one Tau Ceti term. `simp only [TauCeti.hilbertSymbol_def, hΔ b]` closes `hilbertSymbol_unramified` (its hypothesis, read through the definition). One `simp` closes the sign form. No roadmap's Lean code uses the nine; nothing cites `hilbertSign`.

The sign-form `hilbertSymbol_productFormula` also shares its short name with `TauCeti.hilbertSymbol_productFormula` (`NumberTheory/QuadraticForm/Global/ProductFormula.lean:67`), which states something different: the product of the norm-equation symbols in the completions. Deleting the sign form removes that clash.

Repair: delete the nine from `Suggested.lean`, and write `TauCeti.RegularFormClass K` in the signature of `discr`.

Keep the eight names that consumers on main use in Lean:
- `GlobalQuadraticForms/Suggested.lean` lines 63–66, 261, 367, 460–499 use `formClass`, `discr`, `hilbertSymbol`, `localHasse`, `hilbertSymbol_neg_self`, `hilbertSymbol_mul` and `exists_hilbertSymbol_eq_neg_one`.
- `Completed/OrthogonalSpinGroups/Suggested.lean` lines 84–86 use `hasseInvariant_eq_localHasse`.

Replace lines 26–28 of the docstring with a sentence saying these eight are kept because those two roadmaps import this module and use them.

In the README's scope list (lines 22–36) and in Downstream consumers, record the old → new names:
- `RegularFormClass` → `TauCeti.RegularFormClass`;
- `wittRing` and `toWittRing` → `TauCeti.WittRing` and `TauCeti.WittRing.mk`;
- `hilbertSymbol_comm` → `TauCeti.hilbertSymbol_comm`;
- `hilbertSymbol_unramified` → `TauCeti.hilbertSymbol_unramified`, with `TauCeti.exists_unramified_class` supplying `hΔ`;
- `exists_of_realization` → `TauCeti.RegularFormClass.exists_of_realization`;
- `hilbertSymbol_eq_cohomological` → `TauCeti.hilbertSymbol_eq_cohomological`;
- `hilbertSign` → `TauCeti.hilbertSign`;
- the sign-form `hilbertSymbol_productFormula` (6C item 14, cited by `GlobalQuadraticForms` and `ClassicalArithmeticCompletion`) → `TauCeti.ClassFieldTheory.hilbertProductFormula` read through `TauCeti.hilbertSign_sum`. In norm-equation form it is `TauCeti.hilbertSymbol_productFormula`.

Tested: a scratch copy with the nine deleted (260 lines) elaborates under `lake env lean` with no output. It keeps the six headline examples and the eight consumed names.

## R03 (P3) — `signedDiscr` and `localHasse_congr` are dropped although GlobalQuadraticForms on main cites them, and no old → new line is given

Location: README lines 2696–2702, the `GlobalQuadraticForms` bullet of Downstream consumers, which lists what that roadmap imports and cites.

Claim: the listed names are everything `GlobalQuadraticForms` takes from this namespace.

Witness: `TauCetiRoadmap/GlobalQuadraticForms/README.md` line 121 cites `signedDiscr`, and lines 124 and 292 cite `localHasse_congr`, as this roadmap's declarations. Main's `Suggested.lean` declared both (lines 475 and 1309); this head declares neither.

Repair: add to that bullet: "its `signedDiscr` is Tau Ceti's additive `TauCeti.RegularFormClass.signedDiscr`, read through `TauCeti.multiplicativeSquareClassEquiv` where a multiplicative value is wanted, and its `localHasse_congr` is `TauCeti.RegularFormClass.localHasse_congr`, stated on the classes `⟦⟨m, w⟩⟧`". Both `#check` at the pin (`LinearAlgebra/QuadraticForm/RegularFormClass/Discriminant.lean:260`, `NumberTheory/LocalField/QuadraticForm/Hasse.lean:108`).

## R04 (P3) — IntegralLattices is listed as importing this module, and it does not

Location: README lines 2703–2705: "`IntegralLattices` imports `Suggested.lean` for `hilbertSymbol`, `localHasse`, `hilbertSign` and `hilbertSymbol_productFormula`". The same claim is in the scope list (lines 29, 33, 35–36) and in `Suggested.lean` lines 45–50.

Claim: IntegralLattices consumes these four names from this namespace.

Witness: `TauCetiRoadmap/IntegralLattices/Suggested.lean` lines 1–5 import only Mathlib and Tau Ceti modules. Its README lines 504–505 cite `TauCeti.hilbertSymbol_productFormula`, `hilbertSymbol` and `localHasse` as Tau Ceti declarations. `hilbertSign` occurs nowhere in that folder.

Repair: remove `IntegralLattices` from the four consumer lists, and replace the bullet with: "`IntegralLattices` consumes Layers 6C and 6D through Tau Ceti's own declarations (`TauCeti.hilbertSymbol`, `TauCeti.hilbertSymbol_productFormula`, `QuadraticForm.equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq`) and imports nothing from this namespace."

## R05 (P3) — Two Checks do not discriminate what they claim to

(a) Location: README lines 1243–1245: "The Clifford invariant of `⟨1,…,1⟩` over `ℝ` for `n = 1, …, 8` … this checks both correction exponents of Lam V.3.20."

Witness: `d(n⟨1⟩) = [1]` for every `n`, so `[(−1, d)] = 1` and the exponent `(n−1)(n−2)/2` is never exercised. The formula with that factor deleted gives the same eight values `1, 1, [ℍ], [ℍ], [ℍ], [ℍ], 1, 1`.

Repair: add `⟨1, 1, −1⟩` over `ℝ`, where `n = 3`, `s = 1` and `d = [−1]`:
- `C₀` is generated by `e₁e₂` (square `−1`) and `e₁e₃` (square `+1`), which anticommute, so `C₀ ≅ ℍ[ℝ, −1, 1] ≅ M₂(ℝ)`.
- The formula gives `c = 1 = s · [(−1,−1)] · [(−1,−1)]`.
- With the first factor dropped it would give `[ℍ]`.

(b) Location: README lines 821–824, the fourth `discr` Check, ending "so the two square-class dictionaries cannot disagree here".

Witness: by its own text, the Check holds for both candidate readings, `[a]` and `[a⁻¹]`, so it excludes nothing.

Repair: delete it. The other three `discr` Checks discriminate: rank zero gives `[1]`, `⟨1,−1⟩` gives `[−1]` where the signed discriminant gives `[1]`, and `⟨1⟩` and `⟨4⟩` both give `[1]`.

## R06 (P3) — The README misdescribes four consumed declarations or names

(a) Location: lines 1513–1519 describe `TauCeti.index_normGroup_of_isCyclic` "for `L/K` with both fields local, `[ValuativeExtension K L]`, …". Witness: at the pin (`NumberTheory/ClassFieldTheory/Brauer/LocalH2Bound.lean:70`) it is stated for `K L : Type` only. Repair: add "for `K L : Type`; for `K : Type u` only the first proof applies".

(b) Location: lines 1193–1200: additivity of `c` holds "when the Witt classes of both summands lie in `TauCeti.fundamentalIdeal K ^ 2`". Witness: `TauCeti.RegularFormClass.cliffordInvariant_add_of_signedDiscr_eq_zero` (`RegularFormClass/Clifford.lean:657`) and `TauCeti.WittRing.cliffordInvariant_add_of_mem_fundamentalIdeal_sq` (`Witt/Clifford.lean:93`) need only the first summand in `I²`. Repair: say "when one summand lies in `I²`". Tested: `⟨1,−1⟩ ∈ I²` and `⟨1⟩ ∉ I²`. `C₀⟨1,−1,1⟩ ≅ ℍ[K,1,−1]` is split, so `c = 1 = c⟨1,−1⟩ · c⟨1⟩`.

(c) Location: line 273, the supplier table's Layer 1 row, names `OrthogonalGroup.lean`. Witness: no such file exists under `TauCeti/LinearAlgebra/QuadraticForm/` at the pin. The file is `OrthogonalGroup/Basic.lean`, as line 593 says. Repair: write `OrthogonalGroup/Basic.lean`.

(d) Location: line 976, "Mathlib `Algebra.GrothendieckAddGroup`, `Ideal.Quotient`". Witness: `#check @Ideal.Quotient` fails with "unknown constant"; it is a namespace. Repair: cite `Ideal.Quotient.mk`.

## R07 (P3) — Six sampled milestones carry no source locator

Location: README lines 1096–1104 (quaternion algebras are central simple), 1224–1232 (base change and the remaining API), 1494–1527 (the classical construction), 1721–1733 (6E Milestone 1), 1738–1758 (Milestone 2) and 1760–1764 (compatibility with the cup product).

Claim: each is a theorem, and each needs a locator.

Witness: each names only Tau Ceti declarations. For example, lines 1096–1104 give `TauCeti.QuaternionAlgebra.instIsCentral` and `instIsSimpleRing` with no source.

Repair: add the source at each claim.
- Central simplicity: EKM §98.E, p. 389 (`ekm2008` line 20422), for `(L/F, b)` with `L` a quadratic field. The square case is split, by Layer 2's `TauCeti.QuaternionAlgebra.oneEquivMatrix` after rescaling.
- The index-two norm subgroup: O'Meara 63:11–13, already cited in 6B.
- Milestone 1: the uniqueness of the quaternion division algebra, O'Meara 63:17–18 and Serre *CiA* IV Thm 7 cor., already cited in 6D.
- Milestone 2 and the cup compatibility: Serre, *Local Fields* XIV §2, with its proposition number.
- Base change: the source's statement that `(a,b)_K ⊗_K L ≅ (a,b)_L`, with its locator.

## R08 (P3) — No order is stated against #1797 and #1187, whose heads conflict with this one in this folder

Location: the "Merge order" paragraph of the pull request description, which names only #1410, #1474, #617 and #1215.

Witness: #1797's head rewrites this folder differently (197 differing README lines; its `Suggested.lean` has 296 lines against 332 here). #1187's head carries main's 3873-line `Suggested.lean`, re-pinned. Both conflict with this head.

Repair: state in the description which of #1411 and #1797 merges first, and that the other is then rebased onto it without restating its changes. Do the same for #1187.

## R09 (P3) — An edit outside the folders this review counts as the pull request's own

Location: `Completed/LocalGaloisGroups/Suggested.lean` lines 326 and 485.

Witness: `git diff --stat origin/main...HEAD` lists `Completed/LocalGaloisGroups/Suggested.lean | 4 ++--`. The folders reviewed as this pull request's own are ClassFieldTheory, IntegralLattices and QuadraticFormInvariants, and the gate's outside-folder check does not report this file.

Repair: keep `ClassFieldTheory.h2MuEquivZMod_mixed` and `h2FpEquivZMod_of_mu` at the types the completed roadmap already uses, so that it needs no edit. Otherwise, move the two-line adaptation into a pull request that has `Completed/LocalGaloisGroups` reviewed as its own folder.

## R10 (P3) — Two cited works are missing from the sources manifest, and Delzant is cited with no reference entry

Location: README lines 2745–2746 (O'Meara, *Amer. J. Math.* 77 (1955)) and 2773–2774 (Grove, GSM 39); Delzant is cited at lines 197 and 2218.

Witness: `packages/QuadraticFormInvariants/sources.toml` has 14 entries, none for O'Meara 1955 or Grove. `delzant1962` is recorded, cited for the Conventions and Layer 8, but References lists no Delzant item.

Repair: record O'Meara 1955 (doi:10.2307/2372423) and Grove (2002) in the manifest, by locator if no open copy exists. Add "A. Delzant, *Définition des classes de Stiefel-Whitney d'un module quadratique sur un corps de caractéristique différente de 2*, C. R. Acad. Sci. Paris 255 (1962) 1366–1368" to References.

## Verified sound

**Gate and build.**
- The worker's gate at this head passes every check.
- My re-run with `--base origin/main` gives `outside-folder=4 FAIL`. It lists only `TauCetiRoadmap/ClassFieldTheory/{README.md,Suggested.lean}` and `TauCetiRoadmap/IntegralLattices/{README.md,Suggested.lean}`, which are this pull request's own folders, and every other listed check is 0. It did not reach the build, so I elaborated the file directly.
- `lake env lean` on `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` exits 0 with no output. The file has no `sorry`, no `set_option`, and imports only `Mathlib` and 16 `TauCeti.*` modules, each present at the pin.
- Dependency check: `depcheck: 236 roadmaps, 2271 edges, 0 problem(s)`. The roadmap is on main, and its suppliers (ClassFieldTheory, ProfiniteCohomology, LocalFieldsRamification, RepresentationTheory/SemisimpleAlgebras) are all on main.

**Signatures.**
- One scratch file of `#check @name` for the 15 declarations elaborates without error.
- The types equal those in signatures.md, and none lost a section binder.
- Each matches its README statement except where R01 notes the README omits `tr`.

**Library names.**
- I `#check`ed every backticked dotted name of the README against the pinned Mathlib and Tau Ceti: 690 names, with 683 Tau Ceti modules imported. 689 resolve; `Ideal.Quotient` does not (R06d).
- The roadmap prototype names resolve in the roadmaps on main:
  - `ProfiniteCohomology/Suggested.lean`: `f2Pairing` 5332, `homClass` 5537, `cochainClass` 431, `inhomogeneousCochain2` 5145;
  - `Completed/LocalFieldsRamification/Suggested.lean`: `map_norm_unitFiltration_zero` 857, `square_eq_range_powMonoidHom` 720, `card_squareClasses_dyadic` 708.
- All 172 `TauCeti/…` paths in the README exist at the pin, brace groups expanded. The supplier table's relative paths also exist, except `OrthogonalGroup.lean` (R06c).

**Declarations opened at the pin.** Paths are under `TauCeti/`:

| Declaration | File and line |
|---|---|
| `hilbertSymbol` | `NumberTheory/HilbertSymbol/Basic.lean:47` |
| `hilbertSymbol_unramified` | `NumberTheory/LocalField/QuadraticForm/UnramifiedClass.lean:263` |
| `exists_unramified_class` | `NumberTheory/LocalField/QuadraticForm/UnramifiedClass.lean:206` |
| `hilbertSymbol_eq_cohomological` | `FieldTheory/GaloisCohomology/MuTwo/LocalSymbol.lean:191` |
| `localSymbol_eq_zero_iff_cup` | `FieldTheory/GaloisCohomology/MuTwo/LocalSymbol.lean:157` |
| `index_normGroup_of_isCyclic` | `NumberTheory/ClassFieldTheory/Brauer/LocalH2Bound.lean:70` |
| `RegularFormClass.cliffordInvariant_eq_hasseInvariant_mul` | `LinearAlgebra/QuadraticForm/RegularFormClass/Clifford.lean:570` |
| `RegularFormClass.cliffordInvariant_add_of_signedDiscr_eq_zero` | `LinearAlgebra/QuadraticForm/RegularFormClass/Clifford.lean:657` |
| `WittRing.cliffordInvariant_add_of_mem_fundamentalIdeal_sq` | `LinearAlgebra/QuadraticForm/Witt/Clifford.lean:93` |
| `RegularFormClass.hasseInvariant_mk_rankOne_mul` | `LinearAlgebra/QuadraticForm/RegularFormClass/Hasse/Basic.lean:231` |
| `RegularFormClass.eq_iff_discr_eq_and_hasseInvariant_eq` | `LinearAlgebra/QuadraticForm/RegularFormClass/LowRank.lean:126` |
| `RegularFormClass.localHasse_congr` | `NumberTheory/LocalField/QuadraticForm/Hasse.lean:108` |
| `RegularFormClass.signedDiscr` | `LinearAlgebra/QuadraticForm/RegularFormClass/Discriminant.lean:260` |
| `hilbertSymbol_productFormula` | `NumberTheory/QuadraticForm/Global/ProductFormula.lean:67` |
| `finprod_hilbertSymbol_mul_prod_hilbertSymbol_eq_hilbertSign` | `NumberTheory/QuadraticForm/Global/CohomologicalSymbol.lean:112` |
| `ClassFieldTheory.hilbertProductFormula` | `NumberTheory/ClassFieldTheory/Global/Hilbert/Reciprocity.lean:65` |
| `hilbertSign` | `Data/ZMod/IntUnitsPower.lean:62` |
| `RegularFormClass.quaternionSubgroupSignEquiv_apply_hasseInvariant` | `NumberTheory/LocalField/QuadraticForm/Brauer.lean:43` |
| `QuaternionAlgebra.nonempty_algEquiv_matrix_tfae` | `Algebra/Quaternion/SplittingCriterion.lean:156` |
| `cup_kummerClass_eq_zero_iff` | `FieldTheory/GaloisCohomology/MuTwo/CupNorm.lean:103` |
| `galoisEvens2_kummerClass` | `FieldTheory/QuadraticForm/StiefelWhitney/Evens/Kummer/Value.lean:220` |
| `sw2Class_formClass_traceTransfer_smul_sq` | `FieldTheory/QuadraticForm/StiefelWhitney/QuadraticExtension.lean:153` |
| `QuadraticForm.equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq` | `NumberTheory/LocalField/QuadraticForm/Classification.lean:190` |

Two scope claims also hold at the pin:
- Milestone 2's three declarations take `K : Type`, as the README says.
- `TauCeti.brauerCohomologyEquiv_uliftEquiv` and `TauCeti.brauer2EquivH2_baseChange` exist, as Layer 7B item 5 claims.

**Cross-roadmap citations resolved.**
- Outgoing:
  - ClassFieldTheory Layers 5 and 14: lines 920 and 1872 on main, 941 and 2343 at this head. The contract names it lists are declared at this head, for example `kummerClass_eq_kummerCocycleClass` in `ClassFieldTheory/Suggested.lean:301`.
  - ProfiniteCohomology Layers 0–4, 8–10, 12 and 13: README lines 583–2163.
  - LocalFieldsRamification Layers 0–2: lines 72, 281, 576.
  - SemisimpleAlgebras Layers 4–6: lines 249, 274, 293.
- Incoming:
  - On main, every qualified Lean reference to this namespace in GlobalQuadraticForms and OrthogonalSpinGroups names a declaration at this head (nine distinct names).
  - SpinRepresentations' anchor `#layer-1-hyperbolic-planes-and-witt-theory` resolves.
  - ClassicalArithmeticCompletion's anchor `#6c-the-hilbert-symbol-and-the-local-hasse-invariant` resolves, with 6C items 1, 9, 10 and 14 matching its descriptions.
  - K2SymbolsBrauer (#1302) cites main's heading "Native interfaces and remaining comparisons", stages 1–3; README lines 2711–2718 map them.
  - QuadraticFormInvariantsPartII (#1834) cites Layers 1, 4, 7A, 7B and 9, all present.
- The overlap tool reports no dropped ids beyond R03, which I found by comparing main's declarations with consumers' citations.

**Ownership.** Every object is Tau Ceti's, and the README cites it there. No declaration here has the fully qualified name of a declaration in another roadmap I could read: QuadraticFormInvariantsPartII uses its own namespace, and `roadmaps grep` over main and the open heads finds no second `TauCetiRoadmap.QuadraticFormInvariants.*` declaration.

**Headlines.** The README's high points are the four-fold criterion, the local classification, and Kahn's relative formula through the Evens value. With 6C's product formula and 7C's cup-norm theorem, all six are stated in `Suggested.lean` as examples closed by the named Tau Ceti theorem. Each closes by one `exact`. That is expected when the roadmap's content is native at the pin, and they are the acceptance test, so I do not count them as padding.

**Sources read.**
- `kahn1984` lines 763–765 (p. 241), Lemme II.2.1: the two-case value `N((a)) = (Tr a, −d·N a) + (2,d)` if `Tr a ≠ 0`, else `(2,d)`, for `E/F` quadratic of discriminant `d`. This is exactly README lines 2457–2459.
- `kahn1984` line 55, Théorème 2 (the total-class form), and lines 1044–1059 (p. 248), Prop. II.3.5 (rank one). Its degree-2 part is README line 2604.
- `serre1984cmh` lines 560–562 (p. 668), Théorème 1′, with the remark that `d_E`, not `d(Q)`, enters. This is README lines 2551–2552. Its second proof, lines 582–600 (pp. 669–670), is the route README line 2472 names.
- `kozlowski1984` line 34, Thm 1.1. `evens1963` §§4–5 (lines 75, 168), the norm map. `ekm2008` §98.E (line 20422, p. 389).

**Adversarial table.** 29 rows; values are computed on each side.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Four-fold criterion (L2; `Suggested.lean` 76) | ℚ₂ (5,5), (2,5); `a = 1` | (5,5): `5 = 5² − 5·2²`, and `⟨1,−5,−5⟩` vanishes at (5,1,2) since 25−5−20 = 0, so all five hold. (2,5): Serre exponent `ε(1)ε(5)+ω(5) = 1`, symbol −1, all five fail. `a = 1`: `b = ((b+1)/2)² − ((b−1)/2)²` | holds | none |
| Product formula (6C14; 182) | ℚ, a=b=−1; a=b=1 | (−1,−1) is −1 at 2 and at ∞, +1 at odd p, so product +1; a=b=1 gives all +1 | holds | none |
| Local classification (6D; 225) | ℚ₂ and ℝ: ⟨1,1,1,1⟩ vs ⟨−1,−1,−1,−1⟩; rank 0 | ℚ₂: both (4,[1],+1), both anisotropic, so isometric. ℝ: same triple ((−1,−1)_ℝ six times), signatures 4 and −4, so not isometric; the local hypothesis is needed. Rank 0: both sides true | holds | none |
| Cup-norm (7C; 287) | ℝ (−1,−1); ℚ₂ (5,5), (2,5) | ℝ: `−1 = x²+y²` unsolvable and cup ≠ 0; (5,5): cup 0 with the witness; (2,5): cup ≠ 0 | holds | none |
| Evens value (L9; 302) | ℚ₂, d=−1, a=1+2i; a=i | Tr 2, N 5: `(2)∪(5)+(2)∪(−1) = (2)∪(5) ≠ 0`, since (2,5)₂=−1 and (2,−1)₂=+1. The candidate with `(d)∪(−1)` gives 0. a=i: Tr 0, value `(2)∪(−1) = 0`. Same as Kahn II.2.1 | holds | none |
| Relative `w₂` (L9; 319) | a=1; a=v·x (Tr 0) | a=1: LHS `(2)∪(d)`, RHS `(2)∪(d)+(2)∪(−1)+0 = (2)∪(d)`. Tr 0: LHS `w₂⟨1,−1⟩=0`, RHS `(2)∪(d)+(2)∪(d)+(d)∪(−dv²) = 0` | holds | none |
| `discr` (L3; 88) | rank 0; ⟨1,−1⟩; ⟨1⟩,⟨4⟩/ℚ; ⟨a⟩ | [1]; [−1] (signed [1]); [1],[1]; [a]=[a⁻¹] under both readings | holds; 4th Check inert | R05b |
| `localHasse` (6C7; 119) | ![−1,−1] at ℚ₂, ℝ, ℚ₃; ![−1,2] at ℚ₂ | −1, −1, +1. ![−1,2]: s=+1, while O'Meara's `∏_{i≤j} = (−1)(+1)(+1) = −1 = s·(−2,−1)₂` | holds | none |
| `hasseInvariant_eq_localHasse` (6E; 262) | ℚ₂, ![−1,−1]; wrong model `localHasse ≡ 1` | [ℍ] ≠ 1 maps to −1 under the injective ε; a constant model forces ε[ℍ] = ε(1), contradicting injectivity | holds, discriminates | none |
| `hilbertSymbol_eq_cohomological` (6C13; 208) | ℝ; 𝔽₃; ℚ | ℝ: tr exists, `−1 = hilbertSign 1`. 𝔽₃: H² = 0, no tr. ℚ: H² is not ZMod 2, no tr | Lean true; prose overclaims | R01 |
| `hilbertSymbol_unramified` (6B; 147) | ℚ₃, Δ=−1, b=3; probe | (−1,3)₃ = −1 = (−1)^1. `simp only [hilbertSymbol_def, hΔ b]` closes it | hypothesis is the conclusion via the definition | R02 |
| Sign-form product formula (6C14; 196) | ℚ, a=b=−1; reversed dictionary | support {2}, invariants 1 at 2 and at ∞, so (−1)(−1)=+1. With `0 ↦ −1`, a=b=1 would give −1. One `simp` closes it | true; padding | R02 |
| `exists_of_realization` (6D; 241) | ℚ₂ (2,[1],−1), (2,[−1],−1), (1,·,−1) | ⟨−1,−1⟩ realizes (2,[1],−1); ⟨a,−a⟩ has s=+1; rank 1 is the empty product | holds | R02 |
| Hasse formulas (L5) | ⟨a⟩⊥⟨b⟩; λ•⟨a,b⟩ | sum: `[(a,b)] = 1·1·[(a,b)]`. Scaling: `(λa,λb) = s·(λ,−1)·(λ,ab)`, matching `s·[(λ,−1)]^1·[(λ,d)]^1` | holds | none |
| Clifford formula (L5) | n⟨1⟩/ℝ, n=1..8; ⟨a,b,c⟩; ⟨1,1,−1⟩ | `C(n+1,4)` = 0,0,1,5,15,35,70,126, giving 1,1,ℍ,ℍ,ℍ,ℍ,1,1 = ℝ, M₂ℝ, ℍ, M₂ℍ, M₂ℍ, M₄ℍ, M₈ℝ, M₁₆ℝ. n=3: `(−ab,−ac) = s(−1,d)(−1,−1)`. ⟨1,1,−1⟩: c=1, but [ℍ] without the first factor | formula holds; Check misses an exponent | R05a |
| Dim ≤ 3 classification (L5) | ℝ ranks 3 and 4 | rank 3: ⟨1,1,1⟩ ([1],1), ⟨1,1,−1⟩ ([−1],1), ⟨1,−1,−1⟩ ([1],[ℍ]), ⟨−1,−1,−1⟩ ([−1],[ℍ]): four classes, four invariants. Rank 4: ⟨±1⁴⟩ share ([1],1) and are not isometric, so the bound is sharp | holds | none |
| I² homomorphism (L5) | ⟨⟨a,b⟩⟩; ⟨1,−1⟩⊥⟨1⟩ | `s⟨⟨a,b⟩⟩ = (−1,−1)(a,b)`, so `c = s·(−1,−1) = (a,b)`. `c⟨1,−1,1⟩ = 1 = 1·1` with one summand in I² | holds; prose narrower than the library | R06b |
| Quaternion central simple (L5) | ℍ[ℚ,−1,−1]; ℍ[ℚ,1,b] | division (`not_nonempty_algEquiv_matrix_neg_one_neg_one_rat`); ≅ M₂(ℚ) (`oneEquivMatrix`) | holds | R07 |
| Base change, remaining API (L5) | ⟨−1,−1⟩ along ℝ→ℂ; ⟨1,−1⟩; rank ≤ 1 | [ℍ]↦[ℍ⊗ℂ]=1=s over ℂ; `s=(1,−1)=1=c`; empty products | holds | R07 |
| The symbol (6C) | (1,b); ℚ₂ (−1,−1) vs `x²+ay²`; ℚ (−1,3),(−1,7),(−1,21) | +1 via the identity above; −1 vs +1 (`−1 = 0²−1²`); −1, −1, −1, which is not (−1)(−1) | holds, discriminates | none |
| Classical construction, index (6C) | ℚ₂(i)/ℚ₂ | norms include 1, 2=1+1, 5=1+4, 10=1+9; exclude −1, 3; index 8/4 = 2; cyclic route needs `K L : Type` | holds | R06a, R07 |
| Milestone 1 (6E) | ℚ₂ | `natCard_quaternionSubgroup = 2`; ε[ℍ] = −1 = (−1,−1)₂ | holds | R07 |
| Milestone 2 (6E) | ℚ₂, ℚ₃ at (−1,−1) | inv = 1/2 ↔ −1 (ℚ₂); inv = 0 ↔ +1 (ℚ₃); the declarations take `K : Type` as stated | holds | R07 |
| Cup compatibility (6E) | ℚ₂ (2,5), (5,5) | `(2)∪(5) ≠ 0 ↔ −1`; `(5)∪(5) = 0 ↔ +1` | holds | R07 |
| Defect Checks (6B) | ℚ₂: 5/4, 20, −5, 2; ℚ₃: −1 | δ(5/4)=0 via ξ=1/2 (−2 if ξ∈ℤ₂); δ(20)=4, so 16ℤ₂; 𝔡(−5)=2ℤ₂≠8ℤ₂; 𝔡(2)=2ℤ₂; ℤ₃ | holds | none |
| ℚ₂ Gram matrix (6C12) | basis −1, 2, 5 | entries 1,0,0 / 0,0,1 / 0,1,0, from (−1,−1)=−1, (2,5)=−1, others +1; det 1 over 𝔽₂ | holds | none |
| Square-class count (6A) | ℚ₂, ℚ₂(√2), ℚ₃, 𝔽₃((t)) | 4·2=8, 4·2²=16, 4, 4 | holds | none |
| Stiefel–Whitney Checks (L8) | ℚ₂ ⟨−1,2⟩; ⟨1,−1⟩ | `w₂ = (−1)∪(2) = 0`, and the `i≤j` version adds `(−1)∪(−1) ≠ 0`; `w₁⟨1,−1⟩ = (−1) ≠ 0`, where the signed version gives 0 | holds | none |
| Ramified-base control (6E examples) | ℚ₂(√2), a=5 | `(π+½)² − 5/4 = 2+π+¼−5/4 = 1+π`; unit members of `u²(1−5t²)` and `−5u²(1−5t²)` are ≡ 1 mod 2, while 1+π ↦ 1+ε | holds | none |

## Not verifiable

These works are recorded as uncertified in the manifest (`lam2005`, `gilleszamuely2017`, `serre1973cia`, `serre1979lf`, `omeara1963`, `scharlau1985`, `milnor1970`, `delzant1962`). None has a legal open copy, so I did not read them:
- Lam I.2.3–V.3.21, pp. 119–120, which carries the sampled locators for the quaternion symbol (III.2.11), the Hasse invariant (V.3.16, V.3.18, p. 119), classification in dimension ≤ 3 (V.3.21), the Clifford invariant (V.3.12, V.3.20, the p. 120 caution) and the `I²` homomorphism (V.3.4);
- Gille–Szamuely 1.1.9, 1.5.2, 4.4, 4.7;
- Serre *CiA* III and IV;
- Serre *Local Fields* X and XIV §2 Props 4–5;
- O'Meara §63 and 71:18;
- Scharlau Ch. 2 §5;
- Milnor §4;
- Delzant.

I checked the mathematics these locators carry by computation instead (table rows 1–3, 7–29). One numbering is worth confirming against Lam when the text is available: the scaling formula for `s` is cited as V.3.16, before V.3.17, which the README gives as the place `s` is defined.

## Source issues

- none
