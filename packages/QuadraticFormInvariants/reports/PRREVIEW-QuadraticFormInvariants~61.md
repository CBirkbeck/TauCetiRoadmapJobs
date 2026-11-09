# Review of QuadraticFormInvariants (pull request #1797 at 85b5c37)

**Verdict:** needs changes

This is an incremental re-review of 36 changed lines since `c36ff40`. All 36 lines are in the generated `PROGRESS.md` and `STATUS.md`, and they came in with the merge of main:
- `git diff origin/main HEAD` over both files is empty. Both files equal main at `3090489`, last written by main's "progress: QuadraticFormInvariants report".
- `README.md`, `Suggested.lean` and `metadata.toml` are byte-identical to `c36ff40`.
- `lake-manifest.json` and `lean-toolchain` are unchanged. The pins are Tau Ceti `2fd255d` and Mathlib `1b1ccf4`.

Of the two previous findings, R02 is repaired. R01 is not, and it is the one finding below. It is P3 and concerns the pull-request description, not the folder's text.

## R01 (P3) — The description still states no merge order against the four other open pull requests that change this folder

**Location.** The pull-request description.
- Its paragraph on this folder still reads "`NativeCompletion.md` — deleted (its prose and the full checked Lean block now form the 'Checked native completion interfaces' subsection …)".
- The paragraph added since, "Scope after the merge of main", names #617 only as the owner of the IntegralLattices revision.
- Neither paragraph says which of #617, #1187, #1215 and #1411 merges first, or which rebases on which.

**Answer to the previous review.** H01 replied "The review is right that the description must state the order against #617, #1187, #1215 and #1411". It did not mark the finding not actionable, so this is an unrepaired finding, not the re-raise of a settled one. The description at `85b5c37` does not yet have the paragraph that the answer agrees is needed.

**Claim.** When two open heads change the same roadmap differently, one is rebased on the other before either merges, and the description says which.

**Witness.** `roadmaps overlaps QuadraticFormInvariants` reports that all four heads conflict with this head in `TauCetiRoadmap/QuadraticFormInvariants/`. I fetched each head's copy of the folder with `roadmaps show QuadraticFormInvariants --pr N` and diffed it against this head:

| Head | Lines that differ (Lean / README) | Declarations here that the head lacks |
|---|---|---|
| #1215 `12aa8f1` | 272 / 391 | `discr`, `wittRing`, `hilbertSymbol_neg_self`, `hilbertSymbol_comm`, `hilbertSymbol_mul`, `hilbertSymbol_unramified`, `exists_hilbertSymbol_eq_neg_one`, `exists_of_realization`, `hilbertSymbol_eq_cohomological`, `hilbertSymbol_productFormula` |
| #617 `b560d38` | 340 / 435 | `wittRing`, `hilbertSymbol_comm`, `hilbertSymbol_unramified`, `exists_of_realization`, `hilbertSymbol_eq_cohomological`, `hilbertSymbol_productFormula` |
| #1411 `5d0d7c6` (draft) | 269 / 399 | the same six as #617 |
| #1187 `66ed0d4` | 3,986 / 5,631 | none: it keeps main's 3,847-line file at its own Tau Ceti pin |

Main (`3090489`) still uses names that some of these heads drop:
- GlobalQuadraticForms `Suggested.lean` imports this module (line 5) and uses `hilbertSymbol_neg_self`, `hilbertSymbol_mul` and `exists_hilbertSymbol_eq_neg_one` (lines 63–66 and 498–499).
- The READMEs of IntegralLattices, ClassicalArithmeticCompletion and GlobalQuadraticForms cite `hilbertSymbol_productFormula`.

**Repair.** Add one paragraph to the pull-request description. It should say:
- which of #1797 and #1215 merges first, and that the other rebases onto it. Whichever lands second keeps the names that main's GlobalQuadraticForms, IntegralLattices and ClassicalArithmeticCompletion still use, until those roadmaps cite `TauCeti.*` directly;
- that #617 and #1411 rebase onto whichever lands first. Both drop `hilbertSymbol_productFormula`, so each has to keep it or wait until the three citing roadmaps are repointed;
- whether #1187 re-elaborates this file's 15 declarations at its own pin.

`README.md` and `Suggested.lean` do not change.

Tested on the instance that refuted the original: with that paragraph, each of the four conflicting heads in the overlap report has a stated order.

## Previous findings

- R01 — not repaired: the description's only paragraph on this folder still concerns `NativeCompletion.md`. The new "Scope after the merge of main" paragraph names #617 only for IntegralLattices. No order is stated against #617, #1187, #1215 or #1411. Written again as R01.
- R02 — repaired: `packages/QuadraticFormInvariants/sources.toml` now has 16 `[[source]]` tables. Line 224 holds `omeara1955`: `doi = "10.2307/2372423"`, `status = "uncertified"`, `cited_for = ["Layer 6"]`. README 2629–2630 keeps the citation.

## Verified sound

**Change set.**
- `git diff --stat c36ff40 HEAD -- TauCetiRoadmap/QuadraticFormInvariants` shows `PROGRESS.md` (+9) and `STATUS.md` (+12/−15) only.
- `git diff --quiet c36ff40 HEAD` holds for the README, `Suggested.lean` and `metadata.toml`.
- `git diff --quiet origin/main HEAD` holds for `PROGRESS.md` and `STATUS.md`.
- The pull request's own change to this folder against main is unchanged since the previous review: `NativeCompletion.md` is deleted, and the README and `Suggested.lean` are rewritten.

**The merged generated text agrees with the README at this head.**
- `STATUS.md` now says that the upward-`ULift` square for `Br(K) ≅ H²` is proved. README Layer 7B item 5 (lines 2014–2025) and 6E's paragraph on universes (1686) already cite that square as proved.
- I opened the pinned declarations and elaborated them with a scratch `#check` probe (exit 0):
  - `TauCeti.brauerExplicitH2Equiv_uliftEquiv` at `TauCeti/Algebra/CrossedProduct/BaseChange/ULift.lean` 205;
  - `TauCeti.brauerCohomologyEquiv_uliftEquiv` at the same file, 228;
  - `TauCeti.BrauerGroup.uliftEquiv` at `TauCeti/Algebra/BrauerGroup/ULift.lean` 116;
  - `RingEquiv.unitsH2Congr` at `TauCeti/FieldTheory/GaloisCohomology/Congr.lean` 91.
- Each has only `{K : Type u} [Field K]` in scope (file variables at lines 56 and 78). The `Small.{u} B` at `BrauerGroup/ULift.lean` 97 is derived inside a proof. This bears out the README's "No smallness hypothesis enters".
- Other Tau Ceti names in `PROGRESS.md` that the README cites are at the pin:
  - `TauCeti.Padic.hilbertSymbol_formula_of_ne_two` (README 1545) at `NumberTheory/LocalField/QuadraticForm/OddResidue/Padic.lean` 106;
  - `Module.Basis.exists_norm_eq_iff_exists_quotient_normForm_of_defectExponent_eq` (README 1398) at `NumberTheory/LocalField/QuadraticForm/Norm/Residue.lean`;
  - `TauCeti.sw2Class_pfisterFormClass_two` (README 2221) at `FieldTheory/QuadraticForm/StiefelWhitney/Pfister.lean`.
- `brauer2EquivH2_quaternionPairing`, named in `PROGRESS.md`, is not at the pin. The README does not cite it.

**Gate.**
- The worker's gate at `85b5c37` passes every check, including `build=0`.
- My run of `gate … --base origin/main` gives 0 on every check except `outside-folder=23`. Every one of those 23 paths is in AlgebraicTopology, GeometricTopology, ReductiveGroups or RepresentationTheory/LieHighestWeight, the folders the brief names as the pull request's own.
- The brief's diff command, with those five folders excluded, prints nothing.

**Dependency check.** `gate --depcheck … --movable` prints `depcheck: 236 roadmaps, 2277 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.

**Elaboration.**
- `lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` exits 0 in 16 s with no diagnostic.
- The three "looks dropped" leads in `signatures.md` are false: `hilbertSymbol_mul`, `exists_hilbertSymbol_eq_neg_one` and `hasseInvariant_eq_localHasse` each carry `[Invertible 2]` in the elaborated type.
- The file is unchanged, so the previous rounds' headline and padding audit carries over.

**Main consumers.** GlobalQuadraticForms `Suggested.lean` at main `3090489` imports this module (line 5) and `#check`s `hilbertSymbol`, `hilbertSymbol_neg_self`, `hilbertSymbol_mul` and `exists_hilbertSymbol_eq_neg_one` (lines 63–66). All four are declared at this head.

**Citation leads (2).** Both resolve on main, as in the previous round:
- `LocalFieldsRamification.map_norm_unitFiltration_zero` at `Completed/LocalFieldsRamification/Suggested.lean` 857;
- `ProfiniteCohomology.f2Pairing` at `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean` 5332.

**Overlaps.**
- No cited id is dropped by an open pull request, and none is defined only by an open revision.
- This pull request drops no id that another roadmap cites.
- The four conflicting heads are R01.
- Of the vocabulary neighbours (#1834, #1215, #616, #1200, #1187), none touches a changed passage.

**Seeded sample.**
- All 13 targets are at the same README lines as in the previous review: 1076, 1089, 1115, 1136, 1146, 1169, 1204, 1437, 1447, 1652, 1667, 1689 and 2367. None lies in a changed passage.
- The README flags no locator as unverified.
- I re-checked the Hasse-invariant target (1114–1132) by computation; see the table.

**Adversarial table: rows computed this round.**

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Layer 7B item 5, `brauerExplicitH2Equiv_uliftEquiv` | `K = ℝ`, `x = [ℍ]` | `Br(ℝ) ≅ ℤ/2` and `H²(Gal(ℂ/ℝ), ℂˣ) ≅ ℝˣ/ℝ_{>0}`. Both have order 2.<br>LHS: the class of `ℍ ⊗ ULift ℝ`, which is nonzero.<br>RHS: the transport of the nonzero class `[−1]`, which is nonzero. | holds |
| same | `x = 1` | Both sides are `0`, since both maps are additive equivalences. | holds |
| same, direction | the source and target of each map | `uliftEquiv : Br K ≃* Br (ULift K)`, and `unitsH2Congr` runs along `ULift.ringEquiv.symm : K ≃+* ULift K`. Both go from `K` to `ULift K`. | holds |
| 6C item 9, `TauCeti.Padic.hilbertSymbol_formula_of_ne_two` | `p = 3`, `a = b = 3` | formula: `((−1)^1)^1 = −1`<br>direct: `(3,3) = (3,−1) = χ(−1 mod 3) = −1` | holds |
| same | `p = 5`, `a = 5`, `b = 2` (`α = 1`, `β = 0`) | formula: `χ(2 mod 5) = −1`, the squares mod 5 being 1 and 4<br>direct: `(5,2)_5 = (2/5) = −1` | holds |
| same, README's `χ = legendreSym` | Mathlib pin | `legendreSym p a := quadraticChar (ZMod p) a` (`LegendreSymbol/Basic.lean` 109–110), the character the pinned statement uses | holds |
| Hasse scaling `s(λq)` (README 1123–1124) | `n = 2`, `q = ⟨a,b⟩` | direct: `(λa,λb) = (λ,−1)(λ,ab)(a,b)`<br>formula: `s·(λ,−1)^1·(λ,ab)^1`, the same | holds |
| same | `n = 3` | direct: `(λ,λ)^3 · (λ,d)^2 · s = (λ,−1)·s`<br>formula: `(λ,−1)^3 · (λ,d)^2 · s = (λ,−1)·s` | holds |
| O'Meara `S = s·(d,−1)` (README 1129–1130) | `⟨a⟩` | `S = (a,a) = (a,−1)` and `s = 1`, so `s·(a,−1) = (a,−1)` | holds |

**Adversarial table: rows carried from PRREVIEW-QuadraticFormInvariants~56 (at `c36ff40`) and its predecessors.** These statements are untouched, so the values are those of the cited reports.

| Statement | Values (previous reviews) | Result |
|---|---|---|
| Evens norm on a Kummer class, README 2369–2375 | `a = 1`: `(2)∪(−1) = 0 = N^Ev(0)`<br>`a = c ∈ Kˣ`: `(c)∪(−d)`<br>`K = ℝ`, `a = −1`: `0` | holds (~56) |
| Product formula over ℚ (item 14) | `(−1,−1)`: `−1` at 2, `−1` at ∞<br>`(2,3)`: `−1` at 2, `−1` at 3<br>both products `+1` | holds (~47) |
| `hilbertSymbol` alias | `rfl` against `TauCeti.hilbertSymbol`<br>`ℝ`: `(−1,−1) = −1` | holds (~56, ~47) |
| `discr` Checks | `discr 0 = [1]`<br>`⟨1,−1⟩ ↦ [−1]`<br>`[4] = [1]` | holds (~47) |
| `localHasse` Checks | the empty product is `+1`<br>`(−1,2)_2 = +1`<br>`(2,2)_2 = +1` | holds (~47) |
| `hilbertSymbol_unramified` | `ℚ_2`, `Δ = 5`: `b = 2 ↦ −1` and `b = −1 ↦ +1` | holds (~47) |
| `hilbertSymbol_mul` | `ℚ_2`: `(2,−5) = −1 = (2,5)(2,−1)` | holds (~47) |
| `exists_hilbertSymbol_eq_neg_one` | `a = 5`: `b = 2`<br>`a = −1`: `b = 3` | holds (~47) |
| `exists_of_realization` | `(1,[1],−1)` and `(2,[−1],−1)` are excluded<br>`⟨−1,−1⟩` realizes `s = −1` | holds (~47) |
| `hasseInvariant_eq_localHasse` | `ε[ℍ] = −1 = (−1,−1)_2`<br>`ε(1) = +1` | holds (~47) |
| `hilbertSymbol_eq_cohomological` | `a` a square: both sides `+1` | holds (~47) |
| Four-fold criterion, `(dim,d,s)`, cup-norm, relative formula | `ℚ_2(i)`, `a = 1+2i`: `(2)∪(5)`<br>trace-zero case: `0` | holds (~47) |
| Characteristic-2 exclusion (EKM §10, Ex. 13.5) | §10 is in characteristic 2 (p. 55)<br>Arf invariant `Σ aᵢbᵢ` (p. 62) | holds (~47) |

**Remarks on untouched text.** These ask for no change and are not findings.
- `STATUS.md` (generated, equal to main) says that "the README still records the roadmap as incomplete". That describes main's README. At this head the README has no completion audit and already records the square (2014–2025). The file is regenerated after the merge.
- The description still says "Lines changed: 375" and refers to a "Checked native completion interfaces" subsection. That text occurs 0 times in the README at this head, as the previous review noted.

## Not verifiable

- **`omeara1955`, `lam2005`, `gilleszamuely2017`, `serre1973cia`, `serre1979lf`, `milnor1970`, `omeara1963`, `scharlau1985` and `delzant1962`.** These are settled as `uncertified` and are cited by their locators. No changed passage relies on any of them.
- **Ownership against open pull requests.** I re-checked it only through the four heads that change this folder and the five vocabulary neighbours. The change adds no object and no ownership claim.

## Source issues

- none
