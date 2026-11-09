# Review of QuadraticFormInvariants (pull request #1797 at f2f59c7)

**Verdict:** needs changes

This is an incremental re-review. Since `ea37f0f`, `TauCetiRoadmap/QuadraticFormInvariants/` has changed by 0 lines. `git diff --stat ea37f0f HEAD` lists only `TauCetiRoadmap/IntegralLattices/README.md` and `TauCetiRoadmap/IntegralLattices/Suggested.lean`. The pins are unchanged.

That IntegralLattices change makes one sentence of this README wrong (R01, new). The two findings of the previous review are not repaired, because neither lives in the folder; they are restated as R02 and R03. All three findings are P3.

## R01 (P3) — The consumer list in Scope names IntegralLattices for two aliases it no longer takes from this namespace

**Location.** `TauCetiRoadmap/QuadraticFormInvariants/README.md` 31–34: "`localHasse` (`GlobalQuadraticForms`, `IntegralLattices`, `OrthogonalSpinGroups`) and `hasseInvariant_eq_localHasse` (`OrthogonalSpinGroups`); `hilbertSymbol_eq_cohomological` and `hilbertSymbol_productFormula` (`GlobalQuadraticForms`, `IntegralLattices`)."

**Claim.** The list names "the names that other roadmaps import from this namespace" (README 23–25). At `ea37f0f` this was true. Since this pull request's IntegralLattices change, IntegralLattices takes only `hilbertSymbol_productFormula` from this namespace. It cites `localHasse` and `hilbertSymbol_eq_cohomological` as Tau Ceti declarations.

**Witness.**
- At this head, `TauCetiRoadmap/IntegralLattices/README.md` 475 lists `localHasse` and `hilbertSymbol_eq_cohomological` under "From Tau Ceti" (heading at 431), with their Tau Ceti files.
- Its only Quadratic Form Invariants row under "From other roadmaps" (503) is `hilbertSymbol_productFormula`.
- `grep -c QuadraticFormInvariants TauCetiRoadmap/IntegralLattices/Suggested.lean` gives `0`.
- At `ea37f0f` that file imported this module (line 6) and had `#check QuadraticFormInvariants.localHasse` (line 400).
- Main's `TauCetiRoadmap/IntegralLattices/README.md` 476 has the same single row.

**Repair.** Rewrite README 31–34 as follows:

- `localHasse` (`GlobalQuadraticForms`, `OrthogonalSpinGroups`) and `hasseInvariant_eq_localHasse` (`OrthogonalSpinGroups`);
- `hilbertSymbol_eq_cohomological` (`GlobalQuadraticForms`) and `hilbertSymbol_productFormula` (`GlobalQuadraticForms`, `IntegralLattices`).

I checked every consumer the rewritten list names on main or at this head:

- `localHasse`: GlobalQuadraticForms README 291 and `Completed/OrthogonalSpinGroups/Suggested.lean` 85;
- `hasseInvariant_eq_localHasse`: the same OrthogonalSpinGroups file, line 86;
- `hilbertSymbol_eq_cohomological`: GlobalQuadraticForms README 373 and its `Suggested.lean` 309;
- `hilbertSymbol_productFormula`: GlobalQuadraticForms README 128 and IntegralLattices README 503.

README 1569–1570 ("an export to `GlobalQuadraticForms` and `IntegralLattices`") concerns `hilbertSymbol_productFormula` alone, so it stays as it is. So does the `Suggested.lean` module docstring (lines 31–32: "import or cite"), because IntegralLattices still cites the namespace.

## R02 (P3) — The order against the other open pull requests that change this folder is still unstated

**Location.** The pull-request description. It names none of #1215, #617, #1411 or #1187. Since `ea37f0f` the only change to it is a closing paragraph about GeometricTopology. `scratch/overlaps.md` still reports that all four conflict with this pull request in this folder.

**Claim.** When two open heads change the same roadmap, one of them is rebased on the other before either merges, and the order is stated.

**Witness.** Each copy of this folder was read with `roadmaps show QuadraticFormInvariants --pr N`:
- **#1215 (`024927f`).** Its `Suggested.lean` differs from this head's in 30 lines. It deletes `qfiNativeBrauerCommGroup` (here 48–50). It also restates `hilbertSymbol_unramified` as `∃ Δ, ¬ IsSquare Δ ∧ v(Δ) = 0 ∧ ∀ b, …`, where here (131–138) the statement is the hypothesis form. Its README differs in 111 lines.
- **#617 (`b254b25`) and #1411 (`0333060`).** They edit main's 3873-line `Suggested.lean`, which this head replaces with 295 lines: #617 changes 2 Lean lines and 5 README lines against main, and #1411 changes 2 Lean lines.
- **#1187 (`66ed0d4`).** It rewrites main's file for its Tau Ceti bump.

**Repair.** Add one paragraph to the description. It should:
- say which of #1797 and #1215 merges first, with the other rebased so that it keeps only the hunks it still needs in this folder;
- say whether #1215's existence form of `hilbertSymbol_unramified` is adopted here or lands afterwards;
- say that #617 and #1411 drop their edits to this folder once #1797 merges;
- say whether #1187 re-elaborates the 15 declarations at its pin.

The README does not change.

## R03 (P3) — Four cited works are still not in the manifest

**Location.** README References:
- 2603, Lam (2005);
- 2620, O'Meara (1955);
- 2637, Gille–Szamuely (2017);
- 2648, Grove (2002).

**Claim.** Every cited work is recorded in the roadmap's `sources.toml`.

**Witness.** `board/packages/QuadraticFormInvariants/sources.toml` still has 11 `[[source]]` tables: `kahn1984`, `serre1984cmh`, `kozlowski1984`, `milnor1970`, `serre1973cia`, `serre1979lf`, `evens1963`, `guillot2010`, `omeara1963`, `scharlau1985` and `ekm2008`. A case-insensitive `grep` for `lam`, `gille`, `grove` or `1955` finds nothing.

**Repair.** Record the four works as `uncertified` entries, as `omeara1963` already is:
- `locator_scheme = theorem` for Lam (Layers 0–5 and 9) and Gille–Szamuely (Layers 2, 5 and 7);
- `section` for Grove (the characteristic-2 exclusion);
- `page` for O'Meara 1955.

No text needs to be fetched.

## Previous findings

- R01 — not repaired: the description still names none of #1215, #617, #1411 or #1187; only a GeometricTopology paragraph was added. #1215's `Suggested.lean` still differs here in 30 lines. Written again as R02.
- R02 — not repaired: `sources.toml` still has the same 11 keys, and none of them is Lam, Gille–Szamuely, Grove or O'Meara 1955. Written again as R03.

## Verified sound

**Change set.**
- `git diff --stat ea37f0f HEAD` touches only `TauCetiRoadmap/IntegralLattices/{README.md,Suggested.lean}` (2442+/2299−), and nothing in this folder.
- `git diff --name-only origin/main...HEAD` has 55 files:
  - 3 in this folder (README, `Suggested.lean` and the deleted `NativeCompletion.md`);
  - 52 in the pull request's own folders: AlgebraicTopology 9, GeometricTopology 30, IntegralLattices 2, ReductiveGroups 9 and RepresentationTheory/LieHighestWeight 2.
- With those folders excluded, the brief's diff command is empty. `lake-manifest.json` and `lean-toolchain` are untouched.
- What the IntegralLattices change does to this roadmap is R01. Its remaining citations into this README resolve: `hilbertSymbol_productFormula` (6C item 14, 1565–1570), and "Layer 6D" for `QuadraticForm.equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq` (1590).
- A note for IntegralLattices' own review, not a finding here: its README 2380, inherited from main's 2319, puts `hilbertSymbol_productFormula` in this roadmap's "Layer 5". It is in Layer 6 (6C).

**Gate.**
- The worker's gate at `f2f59c7` passes every check, including `build=0` on the targeted build of this module and `GlobalQuadraticForms.Suggested`.
- I also ran `gate … --base origin/main` myself, without the folder list. Every check is `0` except `outside-folder=52`, and those are exactly the 52 files above.

**Dependency check.** `gate --depcheck … --movable` prints `depcheck: 239 roadmaps, 2335 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.

**Elaboration.**
- `lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` exits `0` in about 7 s with no diagnostic. The file has no `sorry`.
- A scratch copy with `#check @` of all 15 declarations, plus 4 Tau Ceti and Mathlib names, exits `0` with no error.
- The 15 elaborated types match `signatures.md`, and so match the README statements the previous reviews compared.
- The three "looks dropped" leads (`hilbertSymbol_mul`, `exists_hilbertSymbol_eq_neg_one`, `hasseInvariant_eq_localHasse`) are false: each elaborated type carries `[Invertible 2]`.
- `TauCeti.RegularFormClass.localHasse`, `TauCeti.hilbertSymbol_eq_cohomological`, `TauCeti.hilbertSymbol_productFormula` and `QuadraticForm.equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq` all resolve at the pin. These are the native names IntegralLattices now cites.

**Citation leads.**
- `LocalFieldsRamification.map_norm_unitFiltration_zero` (README 289) is declared at main's `Completed/LocalFieldsRamification/Suggested.lean` 857.
- `ProfiniteCohomology.f2Pairing` (README 314) is declared at main's `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean` 5332.
- The README calls both of them that roadmap's names, and that is accurate.

**Overlaps.**
- No cited id is dropped by an open pull request, and none is defined only by an open revision.
- The four conflicting heads are R02.
- `QuadraticFormInvariantsPartII` (#1834) is the closest roadmap in vocabulary. It is unchanged since the previous review, which found it owns exactly this README's exclusions.

**Seeded sample.**
- No target of the sample falls in a changed passage, so the thirteen targets are carried from the previous reviews. Those opened each Tau Ceti declaration at the pin and read `kahn1984`, `serre1984cmh` and `kozlowski1984` at their locators.
- I re-read one target as a spot check, "The value of the Evens norm on a Kummer class" (README 2358–2368), against `kahn1984` lines 763–765 (Lemme II.2.1, printed p. 241). It gives the two cases `Tr a ≠ 0` and `Tr a = 0` exactly as the README states them.
- The README flags no locator as unverified.

**Adversarial table: rows recomputed this round.**

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| README 31–34 consumer list | 5 aliases × named consumers, on main and at this head | `localHasse`: GlobalQuadraticForms 291 ✓, OrthogonalSpinGroups `Suggested.lean` 85 ✓, IntegralLattices 0 ✗; `hasseInvariant_eq_localHasse`: OrthogonalSpinGroups 86 ✓; `hilbertSymbol_eq_cohomological`: GlobalQuadraticForms 373 ✓, IntegralLattices 0 ✗ (native row 475 only); `hilbertSymbol_productFormula`: GlobalQuadraticForms 128 ✓, IntegralLattices 503 ✓ | R01 |
| Evens norm on a Kummer class (2358–2368) | `a = 1 + t√d`; `a = √d` | `Tr = 2`, `N = 1 − dt²`: `(2)∪(−d(1−dt²)) + (2)∪(d) = (2)∪(−1) + (2)∪(1−dt²) = (2)∪(1−dt²)`, since `(2,−1) = 0` (`kahn1984` line 769, `−1 = 1² − 2·1²`); `Tr √d = 0` gives `(2)∪(d)` | holds; both corollaries agree |
| `hilbertSymbol_productFormula` alias vs native | elaborated types | alias `∀ (F : Type)` explicit, native `∀ {K : Type}` implicit; same product over `HeightOneSpectrum` and real places; `a = b = −1` over `ℚ`: `(−1)·(−1)·∏_{p odd}(+1) = 1` | holds |
| Binder audit (15 declarations) | `#check @` | `[Invertible 2]` present in the three flagged types; the alias types are the native ones with the namespace swapped | holds |

**Adversarial table: rows carried from the previous review of `ea37f0f`** (statements untouched; values are that report's):

| Statement | Values (previous review) | Result |
|---|---|---|
| `discr` Checks (799–812) | `discr 0 = [1]`; `⟨1,−1⟩ ↦ [−1]`, `⟨1,1⟩ ↦ [1]`; signed: `[−1]+[−1] = 0`; `[4] = [1]`; `[a⁻¹] = [a]` | holds |
| `localHasse` Checks (1506–1520) | empty product `+1`; `(a,−a) = +1`; `(−1,2)_2 = +1`, `(2,2)_2 = +1`; `i ≤ j` product `−1` | holds |
| `![−1,−1]` at `2`, `∞`, `3` | `−1`, `−1`, `+1` | holds |
| Milestone 2 universe (1671–1678) | three declarations and `invMap` at `(K : Type)`; Milestone 1, cup and sign identity universe-polymorphic | holds |
| `hilbertSymbol_unramified` (Lean 134) | `ℚ_2`, `Δ = 5`: `b = 2 → −1`, `b = −1 → +1` | holds (remark 1) |
| `hilbertSymbol_mul` (144) | `ℚ_2`: `(2,−5) = −1 = (2,5)(2,−1)` | holds |
| `exists_hilbertSymbol_eq_neg_one` (150) | `a = 5`: `b = 2`; `a = −1`: `b = 3` | holds |
| `exists_of_realization` (158) | `(1,[1],−1)`, `(2,[−1],−1)` excluded; `⟨−1,−1⟩` realizes `s = −1` | holds |
| `hasseInvariant_eq_localHasse` (168) | `ε[ℍ] = −1 = (−1,−1)_2`; `ε(1) = (a,−a) = +1` | holds |
| `hilbertSymbol_eq_cohomological` (206) | `a` square: both sides `+1` | holds |
| Four-fold criterion, `(dim,d,s)`, cup-norm, relative formula (226–291) | `ℚ_2(i)`, `a = 1+2i`: `(2)∪(5)`; trace-zero case `0` | hold |
| Lam V.3.20 exponents, `s(λq)`, `s(q ⊥ r)`, O'Meara's symbol, `c(⟨⟨a,b⟩⟩)` | `C(n−1,2)`, `C(n+1,4) mod 2` for `n = 1..8` | hold (remark 4) |

**Remarks on untouched text that earlier reviews passed.** No change is requested and none of these is a finding:
1. **`hilbertSymbol_unramified`** (`Suggested.lean` 131–138). Its hypothesis `hΔ` is the conclusion read through `TauCeti.hilbertSymbol_def`.
2. **Names GlobalQuadraticForms still cites.** Its README on main cites `signedDiscr` (121), `localHasse_congr` (124, 292) and `discr_mk` (616) under this namespace, and this head declares none of them.
3. **No `## Downstream consumers` section.**
4. **The Clifford example over `ℝ`** (1215–1217) tests only the second correction exponent, because `d⟨1,…,1⟩ = [1]`.
5. **`qfiNativeBrauerCommGroup`** (`Suggested.lean` 48–50) restates `TauCeti.BrauerGroup.instCommGroup`.
6. **ClassFieldTheory Layer 3** is cited in README 1689–1691 ("Layers 3 and 5 for the local invariant …") and 1740 ("Layers 3, 5 and 14"). On main, ClassFieldTheory's Layer 3 is Tate's theorem for a class formation (its README 838). `invMap`, `Br` and `localSymbol` are all Layer 5 (920, exit criterion 1216). This text is unchanged since `f925965`.

## Not verifiable

- The four works of R03 (Lam 2005, Gille–Szamuely 2017, Grove 2002, O'Meara 1955) have no legal copy in the cache and no manifest entry. No changed line adds a locator into them.
- `serre1973cia`, `serre1979lf`, `milnor1970`, `omeara1963` and `scharlau1985` are settled as uncertified and are cited by locator.
- Ownership against the open pull requests was re-checked only for this change. The change adds no object and no ownership claim, and the previous review's check through the sibling checkouts stands.

## Source issues

- none
