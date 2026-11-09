# Review of QuadraticFormInvariants (pull request #1797 at 872449f)

**Verdict:** needs changes

This is an incremental re-review of the 29 lines of `TauCetiRoadmap/QuadraticFormInvariants/README.md` that changed since `f2f59c7`. `Suggested.lean` is unchanged. Previous R01 is repaired. Its repair widens the consumer list's claim to the names other roadmaps "import or cite", and under that claim the list misses one roadmap on main (R01, new). Previous R02 and R03 are not repaired; they are restated as R02 and R03. All three findings are P3.

## R01 (P3) — The consumer list omits ClassicalArithmeticCompletion, which cites `hilbertSymbol` and `hilbertSymbol_productFormula`

**Location.** `TauCetiRoadmap/QuadraticFormInvariants/README.md`:
- 24–26: "declares, as aliases of Tau Ceti declarations or proved from them, the names that other roadmaps import or cite from this namespace";
- 29: "`hilbertSymbol` (`GlobalQuadraticForms`, `OrthogonalSpinGroups`)";
- 35–36: "`hilbertSymbol_productFormula` (`GlobalQuadraticForms`, `IntegralLattices`)".

**Claim.** The list now covers cited names as well as imported ones, but it leaves out a roadmap on main that cites two of them. The README never names ClassicalArithmeticCompletion (`grep -c` gives `0`).

**Witness.**
- Main's `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md` 223 opens a supplier block "From TauCetiRoadmap.QuadraticFormInvariants, 6c the hilbert symbol and the local hasse invariant".
- Line 227 of that file consumes "hilbertSymbol … (item 1)" and "`hilbertSymbol_productFormula` (item 14)". Line 589 reads `(a, b)_v` as "Quadratic Form Invariants 6C's norm-equation symbol hilbertSymbol".
- Items 1 and 14 of this README's 6C (lines 1483 and 1572) are exactly these two names.
- The roadmap's open revision cites them the same way, at README 200 of its head (`a00d041`).

**Repair.**
- README 29 becomes: `hilbertSymbol` (`GlobalQuadraticForms`, `OrthogonalSpinGroups`, `ClassicalArithmeticCompletion`).
- README 35–36 becomes: `hilbertSymbol_eq_cohomological` (`GlobalQuadraticForms`) and `hilbertSymbol_productFormula` (`GlobalQuadraticForms`, `IntegralLattices`, `ClassicalArithmeticCompletion`).
- To keep the other two consumer lists in agreement:
  - add `ClassicalArithmeticCompletion` to the module docstring of `Suggested.lean` 30–31 ("`GlobalQuadraticForms`, `IntegralLattices` and `OrthogonalSpinGroups` import or cite …");
  - add it to README 1576–1577 ("It is an export to `GlobalQuadraticForms` and `IntegralLattices`").

**Check of the repair.** After this repair, the list names every roadmap on main that cites one of the names this namespace declares: GlobalQuadraticForms, OrthogonalSpinGroups, IntegralLattices and ClassicalArithmeticCompletion. I found these with a grep of main for `QuadraticFormInvariants`. The rows are in the table below.

## R02 (P3) — The order against the other open pull requests that change this folder is still unstated

**Location.** The pull-request description. It still names none of #1215, #617, #1411 or #1187. The overlap report (`roadmaps overlaps QuadraticFormInvariants`) says that all four conflict with this pull request in this folder.

**Claim.** When two open heads change the same roadmap, one is rebased on the other before either merges, and the description says which.

**Witness.** I read each copy of this folder with `roadmaps show QuadraticFormInvariants --pr N`. Line counts exclude the tool's header line.

- **#1215 (now `71f4111`).** It now carries a short form of this folder: its `Suggested.lean` differs from this head's in 113 lines, and its README in 224.
  - It deletes ten declarations this head keeps: `discr`, `wittRing`, `toWittRing`, `hilbertSymbol_neg_self`, `hilbertSymbol_comm`, `hilbertSymbol_mul`, `hilbertSymbol_unramified`, `exists_hilbertSymbol_eq_neg_one`, `exists_of_realization` and `qfiNativeBrauerCommGroup`.
  - It writes a different consumer list, which names QuaternionArithmetic.
- **#617 (now `e2fb851`).** It also carries a short form. It differs from this head in 328 Lean lines (docstrings, and it drops `qfiNativeBrauerCommGroup`) and in 245 README lines.
- **#1411 (now `303ce50`).** It adds two imports to main's 3873-line `Suggested.lean`, a file this head replaces. Its README is the same as main's.
- **#1187 (`66ed0d4`).** It rewrites main's file for its Tau Ceti bump: 41 Lean lines and 152 README lines against main.

**Repair.** Add one paragraph to the description. It should:
- say which of #1797 and #1215 merges first, with the other rebased onto it. If #1797 merges first, #1215's consumer list must keep ClassicalArithmeticCompletion (R01) and the aliases that main's GlobalQuadraticForms `Suggested.lean` still uses (63–66, 367, 498–499) until #1215's own GlobalQuadraticForms rewrite lands;
- say that #617 rebases onto whichever of the two lands first, and drops its hunks in this folder that the merged head already contains;
- say that #1411 drops its two import lines in this folder once #1797 merges;
- say whether #1187 re-elaborates the 15 declarations here at its pin.

The README does not change.

## R03 (P3) — Four cited works are still not in the manifest

**Location.** README References:
- 2610, Lam (2005);
- 2627–2628, O'Meara (1955);
- 2644, Gille–Szamuely (2017);
- 2655, Grove (2002).

**Claim.** Every cited work is recorded in the roadmap's `sources.toml`.

**Witness.** `packages/QuadraticFormInvariants/sources.toml` still has the same 11 `[[source]]` tables (`kahn1984` … `ekm2008`). A case-insensitive `grep` for `lam`, `gille`, `grove`, `1955` or `2372423` finds nothing.

**Repair.** Record the four works as `uncertified` entries, as `omeara1963` already is:
- `locator_scheme = "theorem"` for Lam (Layers 0–5 and 9) and for Gille–Szamuely (Layers 2, 5 and 7);
- `"section"` for Grove (the characteristic-2 exclusion);
- `"page"` for O'Meara 1955, with `doi = "10.2307/2372423"`, the DOI this head now prints. Crossref resolves it to Amer. J. Math. 77, no. 1, starting at p. 87.

In the same edit, add the characteristic-2 exclusion (II §10, Example 13.5) to `ekm2008`'s `cited_for`, which lists only "Layers 0–4". No text needs to be fetched.

## Previous findings

- R01 — repaired. README 33–36 now reads "`localHasse` (`GlobalQuadraticForms`, `OrthogonalSpinGroups`) … `hilbertSymbol_eq_cohomological` (`GlobalQuadraticForms`)", and 38–40 say that IntegralLattices takes these from Tau Ceti. The widened "import or cite" claim is the new R01.
- R02 — not repaired. The description still names none of #1215, #617, #1411 or #1187. #1215 now deletes ten declarations kept here. Written again as R02.
- R03 — not repaired. `sources.toml` still has the same 11 keys, and none of them is Lam, Gille–Szamuely, Grove or O'Meara 1955. Written again as R03.

## Verified sound

**Change set.**
- `git diff --stat f2f59c7 HEAD` touches this folder only in `README.md` (18+/11−). Its other files are AlgebraicTopology `{README.md,Suggested.lean}` and LieHighestWeight `{README.md,Suggested.lean}`, both among the pull request's own folders.
- `git diff --name-only origin/main...HEAD` has 56 files. Three are in this folder and 53 in the pull request's own folders: AlgebraicTopology 9, GeometricTopology 30, IntegralLattices 2, ReductiveGroups 9 and LieHighestWeight 3, including the deleted `TypeAHaarTargets.lean`.
- The brief's diff command, with those folders excluded, is empty.

**Gate.**
- The worker's gate at `872449f` passes every check, including `build=0`.
- My own run of `gate … --base origin/main`, without the folder list, gives `0` on every check except `outside-folder=53`. Filtering those 53 paths against the five folders of the pull request leaves none.

**Dependency check.** `gate --depcheck … --movable` prints `depcheck: 239 roadmaps, 2332 edges, 0 problem(s)`. It has no UPWARD, CYCLE or `moved:` line.

**Elaboration.**
- `lake env lean` on `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` exits `0` in about 10 s with no diagnostic. The file has no `sorry`.
- A scratch copy ends with `#check @` of all 16 consumer names (15 declarations plus the exported `RegularFormClass`) and of 7 Tau Ceti names, plus `example : @RegularFormClass = @TauCeti.RegularFormClass := rfl`. It exits `0`.
  - The 7 Tau Ceti names are `TauCeti.hilbertSymbol`, `TauCeti.RegularFormClass.localHasse`, `TauCeti.hilbertSymbol_eq_cohomological`, `TauCeti.RegularFormClass.signedDiscr`, `TauCeti.RegularFormClass.discr_mk`, `TauCeti.RegularFormClass.localHasse_congr` and `TauCeti.hilbertSymbol_productFormula`.
  - The elaborated types match `signatures.md`.
  - The three "looks dropped" leads are false: `hilbertSymbol_mul`, `exists_hilbertSymbol_eq_neg_one` and `hasseInvariant_eq_localHasse` each carry `[Invertible 2]`.

**The new IntegralLattices paragraph (README 38–40).** It holds.
- At this head, IntegralLattices README 475 lists `hilbertSymbol`, `localHasse` and `hilbertSymbol_eq_cohomological` in its Tau Ceti table, with `NumberTheory/HilbertSymbol/Basic.lean`, `NumberTheory/LocalField/QuadraticForm/Hasse.lean` and `FieldTheory/GaloisCohomology/MuTwo/LocalSymbol.lean`.
- At the pin these are `TauCeti.hilbertSymbol` (Basic.lean 47), `TauCeti.RegularFormClass.localHasse` (Hasse.lean 93) and `TauCeti.hilbertSymbol_eq_cohomological` (LocalSymbol.lean 191).
- `grep -c QuadraticFormInvariants TauCetiRoadmap/IntegralLattices/Suggested.lean` gives `0`. Its only row naming this roadmap is 503 (`hilbertSymbol_productFormula`).

**The new EKM locator (README 45–47).** It is correct.
- `ekm2008` line 35 gives "Chapter II. Quadratic Forms", and line 39 gives "10. Totally singular forms" on p. 55.
- The section opens at line 2986 and says that it works in characteristic 2.
- Example 13.5(2), lines 3374–3381, names the characteristic-2 discriminant as the Arf invariant. The index at line 22919 puts it on p. 62.
- The old wording "Part II" was wrong: line 91 gives "Part 2. Algebraic cycles".

**The new O'Meara (1955) reference (README 2627–2628).** Crossref's record for `doi:10.2307/2372423` is "Quadratic Forms Over Local Fields", O. T. O'Meara, American Journal of Mathematics 77, issue 1, first page 87, 1955. This matches the README.

**Seeded sample.**
- None of the thirteen targets lies in a changed passage. Their verification is carried from the previous reviews, which read them at their locators and opened the native declarations at the pin.
- "The symbol" (6C, 1436–1442) depends on the new paragraph, which names `TauCeti.hilbertSymbol`. I re-read that definition at Basic.lean 47–48: `if ∃ x y, b = x² − a y² then 1 else −1`, as the README states. The alias is an `abbrev` with the same elaborated type.
- The README flags no locator as unverified.

**Citation leads.** Both still resolve on main:
- `LocalFieldsRamification.map_norm_unitFiltration_zero` (README 296) at `Completed/LocalFieldsRamification/Suggested.lean` 857;
- `ProfiniteCohomology.f2Pairing` (README 321) at `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean` 5332.

**Overlaps.**
- No cited id is dropped by an open pull request, and none is defined only by an open revision.
- The four conflicting heads are R02.
- QuadraticFormInvariantsPartII (`eda79c7c`) is the closest roadmap in vocabulary. It treats the characteristic-2 material that the changed exclusion bullet leaves out (its README 620 and 1335, the Arf class).
- The changed passages add no object and no ownership claim.

**Adversarial table: rows for the changed statements.**

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Consumer list, README 24–37 | each listed name × the roadmaps on main that cite it | `RegularFormClass`: GQF README 121 ✓<br>`formClass`, `discr`: GQF 121 and its `Suggested.lean` 367 ✓<br>`wittRing`, `toWittRing`: GQF 129 and 909 ✓<br>`hilbertSymbol`: GQF 125 and its Lean 63/261/460 ✓; OSG Lean 84 ✓; ClassicalArithmeticCompletion 225/589 ✗ (unlisted)<br>`hilbertSymbol_neg_self`/`_comm`/`_mul`, `exists_hilbertSymbol_eq_neg_one`: GQF 125 and its Lean 63–66 ✓<br>`hilbertSymbol_unramified`: GQF 124 ✓<br>`exists_of_realization`: GQF 126 ✓<br>`localHasse`: GQF 124 ✓; OSG 85 ✓; IL 0 (correctly dropped)<br>`hasseInvariant_eq_localHasse`: OSG 86 ✓<br>`hilbertSymbol_eq_cohomological`: GQF 128 ✓; IL native row only<br>`hilbertSymbol_productFormula`: GQF 128 ✓; IL 476 on main / 503 here ✓; ClassicalArithmeticCompletion 227 ✗ (unlisted) | R01 |
| IntegralLattices paragraph, 38–40 | IL README and Lean at this head; the pin | 3 names in the Tau Ceti row 475 ✓; declarations at Basic.lean 47, Hasse.lean 93, LocalSymbol.lean 191 ✓; `QuadraticFormInvariants` in IL Lean: 0 | holds |
| Characteristic-2 exclusion, 43–47 | `ekm2008` table of contents, body and index | Ch. II = "Quadratic Forms" (p. 39); §10 on p. 55, characteristic 2; Ex. 13.5(2): `disc([a₁,b₁] ⊥ … ⊥ [aₙ,bₙ]) = a₁b₁ + … + aₙbₙ`, called the Arf invariant, p. 62; Part 2 = "Algebraic cycles" | holds |
| O'Meara 1955 reference, 2627–2628 | Crossref record of the DOI | AJM vol. 77, issue 1, first page 87, year 1955, author O. T. O'Meara | holds |
| `hilbertSymbol` alias (Lean 98) vs `TauCeti.hilbertSymbol` | `ℝ`: `(−1,−1)`; `ℚ`: `(−1,2)`; any `K`: `(a,−a)` | `−1 = x² + y²` has no real solution, so `−1`; `2 = 1² + 1²`, so `+1`; `−a = 0² − a·1²`, so `+1`; the alias and native types agree | holds |

**Adversarial table: rows carried from the review of `f2f59c7`.** These statements are untouched; the values are those reports'.

| Statement | Values (previous reviews) | Result |
|---|---|---|
| Evens norm on a Kummer class (2358–2368 there) | `a = 1 + t√d`: `(2)∪(1−dt²)`; `Tr √d = 0`: `(2)∪(d)` | holds |
| `hilbertSymbol_productFormula` alias vs native | `a = b = −1` over `ℚ`: `(−1)·(−1)·∏_{p odd}(+1) = 1` | holds |
| `discr` Checks | `discr 0 = [1]`; `⟨1,−1⟩ ↦ [−1]`; `[4] = [1]`; `[a⁻¹] = [a]` | holds |
| `localHasse` Checks | empty product `+1`; `(a,−a) = +1`; `(−1,2)_2 = +1`; `(2,2)_2 = +1` | holds |
| `![−1,−1]` at `2`, `∞`, `3` | `−1`, `−1`, `+1` | holds |
| `hilbertSymbol_unramified` (Lean 134) | `ℚ_2`, `Δ = 5`: `b = 2 ↦ −1`, `b = −1 ↦ +1` | holds |
| `hilbertSymbol_mul` (144) | `ℚ_2`: `(2,−5) = −1 = (2,5)(2,−1)` | holds |
| `exists_hilbertSymbol_eq_neg_one` (150) | `a = 5`: `b = 2`; `a = −1`: `b = 3` | holds |
| `exists_of_realization` (158) | `(1,[1],−1)` and `(2,[−1],−1)` excluded; `⟨−1,−1⟩` realizes `s = −1` | holds |
| `hasseInvariant_eq_localHasse` (168) | `ε[ℍ] = −1 = (−1,−1)_2`; `ε(1) = +1` | holds |
| `hilbertSymbol_eq_cohomological` (206) | `a` a square: both sides `+1` | holds |
| Four-fold criterion, `(dim,d,s)`, cup-norm, relative formula (226–291) | `ℚ_2(i)`, `a = 1+2i`: `(2)∪(5)`; trace-zero case `0` | hold |

**Remarks on untouched text that earlier reviews passed.** No change is requested, and none of these is a finding.
1. **GlobalQuadraticForms on main** (README 121, 124, 292, 616) still names `signedDiscr`, `localHasse_congr` and `discr_mk` under this roadmap, and this namespace declares none of them. They are `TauCeti.RegularFormClass.*`, and this README cites them that way (lines 794–795 and 1508). Both open revisions of GlobalQuadraticForms (`40494aa` and #1215's `71f4111`) drop these citations.
2. **IntegralLattices row 475** also takes `exists_of_realization` from Tau Ceti. The new paragraph lists three names and claims nothing beyond them.
3. **The open roadmap QuaternionArithmetic** (#1722, README 231–232) cites `hilbertSymbol_eq_cohomological` and `hilbertSymbol_productFormula`. It becomes a consumer once it merges.
4. The remarks of the previous report stand unchanged: `hilbertSymbol_unramified`'s hypothesis form, no `## Downstream consumers` section, the Clifford example over `ℝ`, `qfiNativeBrauerCommGroup`, and the ClassFieldTheory "Layer 3" citation.

## Not verifiable

- **Lam (2005), Gille–Szamuely (2017) and Grove (2002).** No legal copy is in the cache, and no manifest entry exists (R03). The only changed line that touches them is the Grove mention in the exclusion bullet, which carries no locator.
- **O'Meara (1955).** It is on JSTOR behind a paywall. Only its bibliographic record was checked, through Crossref. The README cites it with no locator inside the paper.
- **`serre1973cia`, `serre1979lf`, `milnor1970`, `omeara1963` and `scharlau1985`.** These are settled as uncertified and are cited by locator.
- **Ownership against open pull requests.** I re-checked it only for the changed passages, by searching for the cited aliases across the open heads (`roadmaps grep`). The change adds no object.

## Source issues

- none
