# Review of QuadraticFormInvariants (pull request #1797 at c36ff40)

**Verdict:** needs changes

This is an incremental re-review of 0 changed lines since `ad233ac`. `git diff ad233ac c36ff40 -- TauCetiRoadmap/QuadraticFormInvariants` is empty. The three commits since then touch only AlgebraicTopology, ReductiveGroups and LieHighestWeight, and neither file of this folder mentions those roadmaps. Both previous findings are P3, and neither is fully repaired. The answers to them were posted on the pull request as H01–H03:
- H03 (the `ekm2008` record) is settled. The reason given is correct.
- H01 and H02 are re-raised below. Each says why the reason given does not hold.

## R01 (P3) — The order against the four other open pull requests that change this folder is still unstated

Re-raised: H01. That answer says the description is not a file the repair job may edit, so "the worker has to add the paragraph". This assigns the edit to someone else; it does not make the edit unnecessary. The description at `c36ff40` is still the one the previous review read.

**Location.** The pull-request description. Its only paragraph on this folder is about `NativeCompletion.md`. It names none of #617, #1215, #1411 or #1187. `roadmaps overlaps QuadraticFormInvariants` reports that all four conflict with this head in `TauCetiRoadmap/QuadraticFormInvariants/README.md` and `Suggested.lean`.

**Claim.** When two open heads change the same roadmap differently, one is rebased on the other before either merges, and the description says which.

**Witness.** I compared each head's copy of this folder (`roadmaps show QuadraticFormInvariants --pr N`) with this head.

| Head | Lines that differ (Lean / README) | Names kept here that the head does not declare |
|---|---|---|
| #1215 `7498694` | 271 / 390 | 11: `discr`, `wittRing`, `toWittRing`, `hilbertSymbol_neg_self`, `hilbertSymbol_comm`, `hilbertSymbol_mul`, `hilbertSymbol_unramified`, `exists_hilbertSymbol_eq_neg_one`, `exists_of_realization`, `hilbertSymbol_eq_cohomological`, `hilbertSymbol_productFormula` |
| #617 `911db42` | 339 / 423 | 7: `wittRing`, `toWittRing`, `hilbertSymbol_comm`, `hilbertSymbol_unramified`, `exists_of_realization`, `hilbertSymbol_eq_cohomological`, `hilbertSymbol_productFormula` |
| #1411 `8878bc5` (draft) | 253 / 354 | the same 7 as #617. At `69323b7` it still declared every name kept here. |
| #1187 `66ed0d4` | — | It keeps main's 3,873-line file and rewrites it for its own Tau Ceti pin. |

Main still relies on names that some of these heads drop:
- GlobalQuadraticForms `Suggested.lean` imports this module (line 5) and uses `hilbertSymbol_neg_self`, `hilbertSymbol_mul` and `exists_hilbertSymbol_eq_neg_one` (lines 63–66).
- IntegralLattices README (rows 476, 898, 1027, 2229) and ClassicalArithmeticCompletion README (227, 601) cite `hilbertSymbol_productFormula` from this roadmap.
- #1215's own GlobalQuadraticForms `Suggested.lean` no longer mentions this module, so the removals there are consistent within #1215. They still conflict with this head.

**Repair.** Add one paragraph to the description. It should say:
- which of #1797 and #1215 merges first, and that the other rebases onto it. Whichever lands second keeps the names that main's GlobalQuadraticForms, IntegralLattices and ClassicalArithmeticCompletion still cite (above), until those roadmaps cite `TauCeti.*` directly;
- that #617 and #1411 rebase onto whichever lands first. Both now drop `hilbertSymbol_productFormula`, so each has to keep it or wait for IntegralLattices and ClassicalArithmeticCompletion to be repointed;
- whether #1187 re-elaborates this file's 15 declarations at its pin.

The README and `Suggested.lean` do not change.

Tested on the instance that refuted the original: with that paragraph, each of the four conflicting heads in the overlap report has a stated order.

## R02 (P3) — O'Meara (1955) is cited in the References but not recorded in the manifest

Re-raised: H02. That answer said Lam, Gille–Szamuely and O'Meara 1955 "could not be recorded" because the sources service found no legal copy. When there is no legal copy, the work is recorded as `uncertified` with its DOI. Board commit `c2da420a`, made after that answer, did exactly this for `lam2005` and `gilleszamuely2017`. Only O'Meara 1955 is still missing.

**Location.** README 2629–2630: "O. T. O'Meara, *Quadratic forms over local fields*, Amer. J. Math. 77 (1955), no. 1, doi:10.2307/2372423, the paper antecedent of §63."

**Claim.** Every work cited in the README is recorded in the roadmap's `sources.toml`.

**Witness.** `packages/QuadraticFormInvariants/sources.toml` has 15 `[[source]]` tables. The only O'Meara entry is `omeara1963` (the book, doi `10.1007/978-3-642-62031-7`). Neither `10.2307/2372423` nor `1955` occurs in the file.

**Repair.** Choose one of the following:
- Add an entry `omeara1955`: `authors = "O. T. O'Meara"`, the title above, `year = 1955`, `doi = "10.2307/2372423"`, `locator_scheme = "page"`, `status = "uncertified"`, `version_note = "paywalled; cited by its locator without the text"`, `cited_for = ["Layer 6"]`. This is the same shape as `lam2005`.
- Or delete README 2629–2630. No statement in the README relies on the 1955 paper; it carries no locator, and every Layer 6 claim cites the book's §63.

## Previous findings

- R01 — not repaired: the description's paragraph on this folder still reads "`NativeCompletion.md` — deleted (its prose and the full checked Lean block now form the 'Checked native completion interfaces' subsection …)". It names no other pull request. Written again as R01.
- R02 — partly repaired:
  - `sources.toml` now records `lam2005` and `gilleszamuely2017` as `uncertified`.
  - The `ekm2008` part is settled. H03's reason is correct: `sources fetch --help` documents `--add-only` as "an entry the manifest has keeps its values (a review adds, never rewrites)".
  - O'Meara 1955 is still unrecorded. Written again as R02.

## Verified sound

**Change set.**
- `git diff ad233ac c36ff40 -- TauCetiRoadmap/QuadraticFormInvariants` is empty.
- `git diff --stat ad233ac c36ff40` lists six files: the README and `Suggested.lean` of AlgebraicTopology, ReductiveGroups and LieHighestWeight (646+ / 238−).
- `grep -c` for AlgebraicTopology, ReductiveGroups, LieHighestWeight and GeometricTopology gives 0 in both files of this folder. The diff mentions `QuadraticFormInvariants` 0 times.
- `lake-manifest.json` and `lean-toolchain` are unchanged. The pins are Tau Ceti `2fd255d` and Mathlib `1b1ccf4`.
- The brief's diff command, with the pull request's six folders excluded, prints nothing. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` and the generated `PROGRESS.md` and `STATUS.md`.

**Gate.**
- The worker's gate at `c36ff40` passes every check, including `build=0`.
- My run of `gate … --base origin/main` gives 0 on every check except `outside-folder=53`. Filtering `git diff --name-only origin/main...HEAD` against the pull request's six folders leaves 0 paths.

**Dependency check.** `gate --depcheck … --movable` prints `depcheck: 236 roadmaps, 2273 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.

**Elaboration.**
- `lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` exits 0 in 17 s with no diagnostic. The file has no `sorry`.
- A scratch copy ends with `#check @` for the 16 consumer names and `example : @hilbertSymbol = @TauCeti.hilbertSymbol := rfl`. It exits 0.
- `RegularFormClass` and `formClass` elaborate as `TauCeti.RegularFormClass` and `@TauCeti.formClass`, through the `export`.
- The three "looks dropped" leads in `signatures.md` are false. `hilbertSymbol_mul`, `exists_hilbertSymbol_eq_neg_one` and `hasseInvariant_eq_localHasse` each carry `[Invertible 2]` in the elaborated type.
- The same-name hit in `library-matches.md` (`discr`) goes to `NumberField.discr` and `QuadraticMap.discr`. These are different objects. This `discr` is Tau Ceti's `RegularFormClass.discr` (`RegularFormClass/Discriminant.lean` 123), read through `multiplicativeSquareClassEquiv` (`SquareClassGroup/Multiplicative.lean` 84).

**Consumers on main (`3090489`).**
- `git grep -l QuadraticFormInvariants origin/main` gives the same eight roadmaps as the previous review: GlobalQuadraticForms, OrthogonalSpinGroups, ClassicalArithmeticCompletion, IntegralLattices, ClassFieldTheory, ProfiniteCohomology, SpinRepresentations and SchemeAndStackFoundations.
- `git diff 623f5d6 origin/main` and `git diff d72684a origin/main` over those eight folders are both empty.
- This head's IntegralLattices README and `Suggested.lean` equal main's: the two-dot diff touches only `PROGRESS.md` and `STATUS.md`.

**Citation leads (2).** Both resolve on main:
- `LocalFieldsRamification.map_norm_unitFiltration_zero` at `Completed/LocalFieldsRamification/Suggested.lean` 857;
- `ProfiniteCohomology.f2Pairing` at `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean` 5332.

**Pinned declarations opened.**
- `TauCeti.hilbertSymbol_productFormula`: `NumberTheory/QuadraticForm/Global/ProductFormula.lean` 67.
- `TauCeti.galoisEvens2_kummerClass`: `FieldTheory/QuadraticForm/StiefelWhitney/Evens/Kummer/Value.lean` 220.
- `TauCeti.galoisEvens2_kummerClass_of_trace_eq_zero`: the same file, 182.

**Seeded sample.**
- All 13 targets were found at this head: README 1076, 1089, 1115, 1136, 1146, 1169, 1204, 1437, 1447, 1652, 1667, 1689 and 2367. None lies in a changed passage, so their verification carries over from the earlier reviews.
- The README flags no locator as unverified.
- I re-opened one target. "The value of the Evens norm on a Kummer class" (README 2369–2375) matches `kahn1984` lines 763–765, Lemme II.2.1 on printed p. 241, case for case. Its "(2) ∪ (−1) = 0" matches `kahn1984` lines 769–773.

**Overlaps.**
- No cited id is dropped by an open pull request, and none is defined only by an open revision.
- No id of this roadmap is dropped by this pull request.
- The four conflicting heads are R01.
- The vocabulary neighbours (#1834 QuadraticFormInvariantsPartII, #1215, #616, #1200, #1187) involve no change since the previous review, which checked them.

**Adversarial table: rows recomputed in this round.**

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Evens norm on a Kummer class, README 2369–2375 | `a = 1` (`t = 0`) | `Tr = 2`, `N = 1`: `(2)∪(−d) + (2)∪(d) = (2)∪(−1) = 0`. This equals `N^Ev(0) = 0`. | holds |
| same | `a = c ∈ Kˣ` | `(2c)∪(−dc²) + (2)∪(d) = (c)∪(−d)`. This equals `x∪(x+e)` with `x = (c)` and `e = (d)`, the index-2 norm of a restricted class. | holds |
| same | `K = ℝ`, `d = −1`, `a = −1` | `(−2)∪(1) + (2)∪(−1) = 0 + 0`, and `(c)∪(−d) = (−1)∪(1) = 0` | holds |
| same | `a = 1 + t√d`; `a = √d` | `(2)∪(1−dt²)`; `(2)∪(d)`. These are the README's corollaries. | holds |
| Consumer names (Lean docstring 30–37) against main | 16 names × the main consumers | GlobalQuadraticForms Lean 5, 63–66 ✓; IntegralLattices README 476/898/1027/2229 ✓; ClassicalArithmeticCompletion 227/601 ✓; all 16 elaborate (probe) | holds at this head; conflicts with #617, #1215 and #1411 (R01) |
| `hilbertSymbol` alias | `rfl` against `TauCeti.hilbertSymbol` | elaborates | holds |

**Adversarial table: rows carried from PRREVIEW-QuadraticFormInvariants~47 (at `ad233ac`) and its predecessors.** These statements are untouched. The values are those of that report.

| Statement | Values (previous reviews) | Result |
|---|---|---|
| Item 14, the product formula over ℚ | `(−1,−1)`: `−1` at 2, `−1` at ∞, product `+1`<br>`(2,3)`: `−1` at 2, `−1` at 3, product `+1` | holds |
| Characteristic-2 exclusion, EKM II §10 and Ex. 13.5 | §10 is in characteristic 2 (p. 55); Arf invariant `Σ aᵢbᵢ` (p. 62) | holds |
| `hilbertSymbol` alias vs `TauCeti.hilbertSymbol` | `ℝ`: `(−1,−1) = −1`<br>`ℚ`: `(−1,2) = +1`<br>`(a,−a) = +1` | holds |
| `discr` Checks | `discr 0 = [1]`; `⟨1,−1⟩ ↦ [−1]`; `[4] = [1]`; `[a⁻¹] = [a]` | holds |
| `localHasse` Checks | empty product `+1`; `(a,−a) = +1`; `(−1,2)_2 = +1`; `(2,2)_2 = +1` | holds |
| `![−1,−1]` at `2`, `∞`, `3` | `−1`, `−1`, `+1` | holds |
| `hilbertSymbol_unramified` | `ℚ_2`, `Δ = 5`: `b = 2 ↦ −1`, `b = −1 ↦ +1` | holds |
| `hilbertSymbol_mul` | `ℚ_2`: `(2,−5) = −1 = (2,5)(2,−1)` | holds |
| `exists_hilbertSymbol_eq_neg_one` | `a = 5`: `b = 2`<br>`a = −1`: `b = 3` | holds |
| `exists_of_realization` | `(1,[1],−1)` and `(2,[−1],−1)` are excluded; `⟨−1,−1⟩` realizes `s = −1` | holds |
| `hasseInvariant_eq_localHasse` | `ε[ℍ] = −1 = (−1,−1)_2`; `ε(1) = +1` | holds |
| `hilbertSymbol_eq_cohomological` | `a` a square: both sides `+1` | holds |
| Four-fold criterion, `(dim,d,s)`, cup-norm, relative formula | `ℚ_2(i)`, `a = 1+2i`: `(2)∪(5)`; trace-zero case `0` | hold |

**Remarks on untouched text.** These ask for no change and are not findings.
- The description's paragraph on this folder says "No statement changes" and "Lines changed: 375". It also says that `NativeCompletion.md` became a "Checked native completion interfaces" subsection of the README. At this head:
  - `Suggested.lean` has 295 lines against main's 3,873;
  - the README has 2,657 lines against main's 3,445;
  - `grep -ci "native completion"` gives 0 in the README.

  The paragraph describes an earlier state of the folder.
- IntegralLattices README 2319 places `hilbertSymbol_productFormula` in this roadmap's "Layer 5"; here it is 6C item 14. This belongs to the IntegralLattices review.

## Not verifiable

- **O'Meara (1955), Lam (2005) and Gille–Szamuely (2017).** No legal copy is in the cache. Lam and Gille–Szamuely are now settled as `uncertified`, and O'Meara 1955 is R02. No passage relies on the 1955 paper for a locator.
- **`serre1973cia`, `serre1979lf`, `milnor1970`, `omeara1963`, `scharlau1985` and `delzant1962`.** These are settled as `uncertified` and are cited by locator.
- **Ownership against open pull requests.** I re-checked it only through the four heads that change this folder. The change adds no object and no ownership claim.

## Source issues

- none
