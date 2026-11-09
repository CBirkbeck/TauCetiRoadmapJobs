# Review of QuadraticFormInvariants (pull request #1797 at ad233ac)

**Verdict:** needs changes

This is an incremental re-review of the 31 lines of this folder that changed since `872449f`: 19 in `README.md` and 12 in the module docstring of `Suggested.lean`. No Lean statement changed.

- Previous R01 is repaired.
- Previous R02 is not repaired. It is restated as R01 below.
- Previous R03 is partly repaired: the Grove citation is gone. The rest is restated as R02 below.

Both findings are P3. The repairs introduced no new defect.

## R01 (P3) — The order against the four other open pull requests that change this folder is still unstated

**Location.** The pull-request description. It names none of #617, #1215, #1411 or #1187. The overlap report (`roadmaps overlaps QuadraticFormInvariants`) says that all four conflict with this head in `TauCetiRoadmap/QuadraticFormInvariants/README.md` and `Suggested.lean`.

**Claim.** When two open heads change the same roadmap differently, one is rebased on the other before either merges, and the description says which.

**Witness.** I compared each head's copy of this folder (`roadmaps show QuadraticFormInvariants --pr N`, header line excluded) with this head.

- **#1215 (`3ef2860`).** 260 Lean lines and 355 README lines differ. Its `Suggested.lean` does not declare `discr`, `hilbertSymbol_neg_self`, `hilbertSymbol_mul`, `exists_hilbertSymbol_eq_neg_one` or `hilbertSymbol_productFormula`, among twelve names kept here.
  - Main's GlobalQuadraticForms `Suggested.lean` imports this module and uses the first four (lines 63–66 and 367).
  - Main's IntegralLattices README (476, 898) and ClassicalArithmeticCompletion README (227) cite the fifth.
- **#617 (`2670a4e`).** 339 Lean lines and 406 README lines differ. It does not declare `hilbertSymbol_productFormula`, `hilbertSymbol_eq_cohomological`, `exists_of_realization`, `wittRing`, `toWittRing`, `hilbertSymbol_comm`, `hilbertSymbol_unramified` or `qfiNativeBrauerCommGroup`.
- **#1411 (`69323b7`).** It now carries its own 333-line short form: 235 Lean lines and 197 README lines differ. It declares every consumer name kept here.
- **#1187 (`66ed0d4`).** It keeps main's long file (3847 lines) and rewrites it for its own Tau Ceti pin.

This head's commit `df89c5d` hands the IntegralLattices revision to #617. That settles the IntegralLattices folder only, and only in a commit message, not in the description.

**Repair.** Add one paragraph to the description. It should say:
- which of #1797 and #1215 merges first, with the other rebased onto it. Whichever lands second keeps, in this namespace, the names that main's GlobalQuadraticForms, IntegralLattices and ClassicalArithmeticCompletion still use (listed above), until those roadmaps are repointed to `TauCeti.*`;
- that #617 rebases onto whichever of the two lands first, and drops its hunks in this folder that the merged head already contains;
- that #1411 drops its copy of this folder, or rebases it onto #1797, once #1797 merges;
- whether #1187 re-elaborates this file's 15 declarations at its pin.

The README does not change.

## R02 (P3) — Lam, O'Meara (1955) and Gille–Szamuely are still not in the manifest, and the `ekm2008` entry omits the new characteristic-2 locators

**Location.** README References:
- 2612, Lam (2005);
- 2629–2630, O'Meara (1955);
- 2646–2649, Gille–Szamuely (2017);
- 2652–2655, EKM, which now says that "II §10 and Example 13.5 are cited for the characteristic-2 exclusion".

**Claim.** Every cited work, and every locator it is cited for, is recorded in the roadmap's `sources.toml`.

**Witness.** `packages/QuadraticFormInvariants/sources.toml` still has the same 11 `[[source]]` tables (`kahn1984` … `ekm2008`). None of them is Lam, Gille–Szamuely or O'Meara 1955 (doi `10.2307/2372423`). The `ekm2008` entry still has `locator = "II §7"` and `cited_for = ["Layers 0–4"]`.

**Repair.** Grove no longer needs an entry. The rest of the previous repair stands:
- record Lam (`locator_scheme = "theorem"`, Layers 0–5 and 9) and Gille–Szamuely (`"theorem"`, Layers 2, 5 and 7) as `uncertified`;
- record O'Meara 1955 as `uncertified`, with `"page"` and `doi = "10.2307/2372423"`;
- in `ekm2008`, extend `locator` to "II §7, §10, Example 13.5" and add "characteristic-2 exclusion" to `cited_for`.

No text needs to be fetched. Lines 2986–2989 and 3374–3381 of `ekm2008` (the cached copy) already support the new locators; see below.

## Previous findings

- R01 — repaired: README 29–30 now reads "`hilbertSymbol` (`GlobalQuadraticForms`, `OrthogonalSpinGroups`, `ClassicalArithmeticCompletion`)", README 37 adds it to `hilbertSymbol_productFormula`, and README 1577–1578 and `Suggested.lean` 31–32 add it as well.
- R02 — not repaired: the description is unchanged and names none of #617, #1215, #1411 or #1187. All four still conflict in this folder, and #1411 now carries a different short form. Written again as R01.
- R03 — partly repaired: README 46 now reads "EKM Chapter II (§10 on totally singular forms, Example 13.5 for the Arf invariant)", and the Grove reference is deleted. Lam, O'Meara 1955 and Gille–Szamuely are still absent from `sources.toml`. Written again as R02.

## Verified sound

**Change set.**
- `git diff 872449f HEAD` touches this folder in `README.md` (README 29–30, 37, 45–48, 1577–1579, 2652–2655, and the Grove entry deleted) and in the `Suggested.lean` module docstring (31–40). Both are as in the change summary.
- The brief's diff command, with the pull request's six folders excluded, is empty. `git diff --name-only origin/main...HEAD` lists 56 files: AlgebraicTopology 9, GeometricTopology 30, IntegralLattices 2, QuadraticFormInvariants 3, ReductiveGroups 9 and LieHighestWeight 3.
- `grep -ci grove` gives `0` in `README.md`, `Suggested.lean` and `metadata.toml`.

**Gate.**
- The worker's gate at `ad233ac` passes every check, including `build=0`.
- My run of `gate … --base origin/main` gives `0` on every check except `outside-folder=53`. Filtering those 53 paths against the five other folders of the pull request leaves none.

**Dependency check.** `gate --depcheck … --movable` prints `depcheck: 236 roadmaps, 2269 edges, 0 problem(s)`. It has no UPWARD, CYCLE or `moved:` line.

**Elaboration.**
- `lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` exits `0` in 8 s with no diagnostic. The file has no `sorry`.
- A scratch copy ends with `#check @` of the 16 consumer names and of `TauCeti.hilbertSymbol` and `TauCeti.hilbertSymbol_productFormula`, plus `rfl` equalities of `RegularFormClass` and `hilbertSymbol` with their Tau Ceti originals. It exits `0`.
- The elaborated types equal those in `signatures.md`. The three "looks dropped" leads are false: `hilbertSymbol_mul`, `exists_hilbertSymbol_eq_neg_one` and `hasseInvariant_eq_localHasse` each carry `[Invertible 2]`.
- The docstring's list of 16 names is the same set as the README's list at lines 28–37.

**Consumer list (README 26–40) against main (`623f5d6`).** I grepped every roadmap on main for `QuadraticFormInvariants`.
- ClassicalArithmeticCompletion: the 223 heading links to `#6c-the-hilbert-symbol-and-the-local-hasse-invariant`, and this head's heading at 1435 still produces that anchor. Lines 225–227 cite item 1 `hilbertSymbol` and item 14 `hilbertSymbol_productFormula`, and 589 reads `(a, b)_v` as this roadmap's `hilbertSymbol`. Item 10's `serreEps` and `serreOmega` are Tau Ceti's: README 1549 names `TauCeti.serreEps` and `TauCeti.serreOmega`, which are defined at `TauCeti/NumberTheory/Padics/SerreSigns.lean` 72 and 77. They are therefore rightly absent from this namespace's list. The open revision (#1409, `a00d041`) cites the same names at 197–201 and 561.
- IntegralLattices at this head is main's text (`diff` 0 lines). Rows 476, 898, 1027 and 2229 cite `hilbertSymbol_productFormula` from this roadmap. Row 453 takes `hilbertSymbol`, `localHasse`, `exists_of_realization` and `hilbertSymbol_eq_cohomological` from Tau Ceti files, as README 39–41 says. Its `Suggested.lean` mentions this roadmap 0 times.
- GlobalQuadraticForms `Suggested.lean` (5, 63–66, 261, 367, 460) and OrthogonalSpinGroups are unchanged since the previous review.
- ClassFieldTheory, ProfiniteCohomology, SpinRepresentations and SchemeAndStackFoundations cite this roadmap by layer only, never by a name of this namespace.

**6C item 14 (README 1572–1579).** I opened both declarations at Tau Ceti `2fd255d`:
- `TauCeti.hilbertSymbol_productFormula` is at `TauCeti/NumberTheory/QuadraticForm/Global/ProductFormula.lean` 67. Its proof (line 73) goes through `ClassFieldTheory.hilbertProductFormula` and `hilbertSign_zero`.
- `TauCeti.ClassFieldTheory.hilbertProductFormula` is at `.../Global/Hilbert/Reciprocity.lean` 65.

Milestones 1 and 2 of 6C are next to the changed item. `TauCeti.hilbertSymbol` is at `HilbertSymbol/Basic.lean` 47, `hilbertSymbol_def` at 52 and `hilbertSymbol_eq_one_iff_exists_norm_eq` at 70, as cited.

**Characteristic-2 exclusion (README 45–48) and EKM entry (2652–2655).**
- `ekm2008` line 35 gives "Chapter II. Quadratic Forms" on p. 39, and line 39 gives "10. Totally singular forms" on p. 55.
- Lines 2986–2989 say that totally singular forms are zero outside characteristic 2, and that §10 works in characteristic 2.
- Lines 3374–3381 (Example 13.5(2)) give the characteristic-2 discriminant of `[a₁,b₁] ⊥ … ⊥ [aₙ,bₙ]` as `a₁b₁ + … + aₙbₙ` and name it the Arf invariant. Index line 22919 puts this on p. 62.
- The README's "quasilinear" is the usual name for totally singular forms.

**Seeded sample.**
- No target of the seeded sample lies in a changed passage, so their verification carries over from the previous reviews.
- "The symbol", Milestone 1 and Milestone 2 are next to the changed item 14. I re-opened their declarations at the pin (above).
- The README flags no locator as unverified.

**Citation leads.** Neither name is new in this change, and both still resolve on main:
- `LocalFieldsRamification.map_norm_unitFiltration_zero` at `Completed/LocalFieldsRamification/Suggested.lean` 857;
- `ProfiniteCohomology.f2Pairing` at `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean` 5332.

**Overlaps.**
- No cited id is dropped by an open pull request, and none is defined only by an open revision.
- The four conflicting heads are R01.
- `roadmaps grep hilbertSymbol_productFormula` finds the name on main and in #617, #1187, #1200, #1215, #1409, #1411, #1722 and this pull request.
- The changed passages add no object and no ownership claim.

**Adversarial table: rows for the changed passages.**

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Consumer list, README 26–37 and Lean 31–40 | each of the 16 names × each roadmap on main citing it | `hilbertSymbol`: GQF Lean 63/261/460 ✓; OSG ✓; CAC 225/589 ✓ (now listed)<br>`hilbertSymbol_productFormula`: GQF ✓; IL 476/898/1027/2229 ✓; CAC 227 ✓ (now listed)<br>CAC item 10 `serreEps`/`serreOmega` → `TauCeti.*` (SerreSigns.lean 72/77), not this namespace ✓<br>README set = docstring set = 16 names | holds |
| IntegralLattices paragraph, 39–41, with IL at this head equal to main | IL row 453; IL Lean | 4 native names in the Tau Ceti row ✓; `QuadraticFormInvariants` in IL Lean: 0 | holds |
| Item 14, the product formula over ℚ | `a = b = −1`; `a = 2, b = 3` | `(−1,−1)`: `−1` at 2, `−1` at ∞, `+1` at odd p, product `+1`<br>`(2,3)`: at 2, `ε(1)ε(3) + 1·ω(3) = 0 + 1`, so `−1`; at 3, `(2/3) = −1`; at ∞, `+1`; elsewhere `+1`; product `+1` | holds |
| Item 14 alias vs native | `#check @` of both | same statement; `K` implicit in Tau Ceti, `F` explicit in the alias; elaborates | holds |
| Characteristic-2 exclusion, 45–48; EKM entry, 2652–2655 | `ekm2008` table of contents, body, index | Ch. II on p. 39; §10 on p. 55, in characteristic 2; Ex. 13.5(2): disc `= Σ aᵢbᵢ`, the Arf invariant, p. 62 | holds |
| Grove reference deleted | grep README, Lean, metadata | 0 occurrences; no passage cites it | holds |

**Adversarial table: rows carried from the review of `872449f` (PRREVIEW-QuadraticFormInvariants~30).** These statements are untouched. The values are those of that report and its predecessors.

| Statement | Values (previous reviews) | Result |
|---|---|---|
| `hilbertSymbol` alias vs `TauCeti.hilbertSymbol` | `ℝ`: `(−1,−1) = −1`; `ℚ`: `(−1,2) = +1` since `2 = 1² + 1²`; `(a,−a) = +1` via `−a = 0² − a·1²` | holds |
| Evens norm on a Kummer class | `a = 1 + t√d`: `(2)∪(1−dt²)`; `Tr √d = 0`: `(2)∪(d)` | holds |
| `discr` Checks | `discr 0 = [1]`; `⟨1,−1⟩ ↦ [−1]`; `[4] = [1]`; `[a⁻¹] = [a]` | holds |
| `localHasse` Checks | empty product `+1`; `(a,−a) = +1`; `(−1,2)_2 = +1`; `(2,2)_2 = +1` | holds |
| `![−1,−1]` at `2`, `∞`, `3` | `−1`, `−1`, `+1` | holds |
| `hilbertSymbol_unramified` | `ℚ_2`, `Δ = 5`: `b = 2 ↦ −1`, `b = −1 ↦ +1` | holds |
| `hilbertSymbol_mul` | `ℚ_2`: `(2,−5) = −1 = (2,5)(2,−1)` | holds |
| `exists_hilbertSymbol_eq_neg_one` | `a = 5`: `b = 2`; `a = −1`: `b = 3` | holds |
| `exists_of_realization` | `(1,[1],−1)` and `(2,[−1],−1)` excluded; `⟨−1,−1⟩` realizes `s = −1` | holds |
| `hasseInvariant_eq_localHasse` | `ε[ℍ] = −1 = (−1,−1)_2`; `ε(1) = +1` | holds |
| `hilbertSymbol_eq_cohomological` | `a` a square: both sides `+1` | holds |
| Four-fold criterion, `(dim,d,s)`, cup-norm, relative formula | `ℚ_2(i)`, `a = 1+2i`: `(2)∪(5)`; trace-zero case `0` | hold |

**Remarks on untouched text that earlier reviews passed.** These ask for no change and are not findings.
- IntegralLattices README 2319, at this head and on main, places `hilbertSymbol_productFormula` in this roadmap's "Layer 5". It is 6C item 14 here. This belongs to IntegralLattices' own review.
- The remarks of the previous report stand unchanged.

## Not verifiable

- **Lam (2005), Gille–Szamuely (2017) and O'Meara (1955).** No legal copy is in the cache, and there is no manifest entry (R02). No changed passage cites them with a locator.
- **`serre1973cia`, `serre1979lf`, `milnor1970`, `omeara1963` and `scharlau1985`.** These are settled as uncertified and are cited by locator.
- **Ownership against open pull requests.** I re-checked it only for the changed passages, through `roadmaps grep` and the four conflicting heads. The change adds no object.

## Source issues

- none
