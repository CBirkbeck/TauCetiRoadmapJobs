# Review of QuadraticFormInvariants (pull request #1797 at ea37f0f)

**Verdict:** needs changes

This is an incremental re-review of the 43 lines that changed in `TauCetiRoadmap/QuadraticFormInvariants/README.md` since `f925965`. `Suggested.lean` is unchanged, as are the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, toolchain `v4.36.0-rc2`). The changes repair R01, R02 and R04 of the previous review, and the repairs introduce no new defect. R03 (merge order) and R05 (manifest) are not repaired, because neither lives in the folder. They are restated below as R01 and R02. Both are P3.

## R01 (P3) — The order against the other open pull requests that change this folder is still unstated

**Location.** The pull-request description, which is unchanged since `f925965` and names no other pull request. `scratch/overlaps.md` lists four open pull requests that conflict with this one in `TauCetiRoadmap/QuadraticFormInvariants/`: #1215, #617, #1411 and #1187.

**Claim.** When two open heads change the same roadmap, one of them is rebased on the other before either merges, and the order is stated. The previous review found #1215 carrying the same rewrite as this pull request. The two have since diverged.

**Witness.**
- At #1215's head `024927f`, `hilbertSymbol_unramified` is stated as `∃ Δ, ¬ IsSquare Δ ∧ v(Δ) = 0 ∧ ∀ b, …`, and `qfiNativeBrauerCommGroup` is deleted.
- This head keeps the hypothesis form (`Suggested.lean` 134–138) and the instance.
- #617 and #1411 edit main's old text, which this head deletes.

**Repair.** Add one paragraph to the description that does the following:
- Say which of #1797 and #1215 merges first. The other rebases and keeps only the hunks it still needs in this folder.
- In particular, say whether #1215's restatement of `hilbertSymbol_unramified` is adopted here or lands afterwards.
- Say that #617 and #1411 drop their edits to this folder after #1797 merges: #617 rewords README 703–705 and `Suggested.lean` 2525 on main, and #1411 adds two imports to main's `Suggested.lean`.
- Say whether #1187 (the Tau Ceti bump) re-elaborates the 15 declarations at its pin.

The README does not change, because it names no pull request.

## R02 (P3) — Four cited works are still not in the manifest

**Location.** README References:
- 2603, Lam (2005), which carries the locators of Layers 0–5 and 9;
- 2620, O'Meara (1955);
- 2637, Gille–Szamuely (2017), which carries the locators of Layers 2, 5 and 7;
- 2648, Grove (2002).

**Claim.** Every cited work is recorded in the roadmap's `sources.toml`.

**Witness.** `board/packages/QuadraticFormInvariants/sources.toml` has the same eleven keys as at `f925965`: `kahn1984`, `serre1984cmh`, `kozlowski1984`, `milnor1970`, `serre1973cia`, `serre1979lf`, `evens1963`, `guillot2010`, `omeara1963`, `scharlau1985`, `ekm2008`. None of them is Lam, Gille–Szamuely, Grove or O'Meara 1955.

**Repair.** Record the four works as `uncertified` entries, as `omeara1963` and `scharlau1985` already are:
- give each a DOI or "Authors, Title, Year";
- use `locator_scheme = theorem` for Lam and Gille–Szamuely, `section` for Grove and `page` for O'Meara 1955;
- set `cited_for` to the layers listed under Location.

No text needs to be fetched.

## Previous findings

- R01 — repaired: README 541 reads "Mathlib `QuadraticForm.dualProd`, `QuadraticMap.prod`" and line 639 reads "`LinearMap.BilinForm.exists_orthogonal_basis`". Both resolve under `#check @` at the pin. `grep` finds no remaining `QuadraticMap.dualProd` or `…exists_orthogonal_basis` under another namespace.
- R02 — repaired: README 1671–1678 reads "Tau Ceti states the three declarations of this milestone, like `TauCeti.ClassFieldTheory.invMap` itself, for a local field `K : Type` in universe `0` … Milestone 1, the cup compatibility below and `TauCeti.hilbertSymbol_eq_cohomological` are universe-polymorphic."
- R03 — not repaired: the description is unchanged and states no order. Four conflicting heads are now listed, and #1215 has diverged. Written again as R01.
- R04 — repaired: README 799–812 add four `**Checks.**` bullets for `discr` (rank zero, the plain versus signed sign, `⟨1⟩` versus `⟨4⟩`, rank one), and 1506–1520 add four for `localHasse` (the empty product, `![a,−a]`, the O'Meara `i ≤ j` separation over `ℚ_2`, `![−1,−1]` at `2`, `∞`, `3`).
- R05 — not repaired: `sources.toml` still has eleven keys, and none of them is Lam, Gille–Szamuely, Grove or O'Meara 1955. Written again as R02.

## Verified sound

**Gate.**
- The worker's gate at `ea37f0f` passes every check, including `build=0` on the targeted build of this module, `GlobalQuadraticForms.Suggested` and `IntegralLattices.Suggested`.
- I ran the gate myself with `--base origin/main`, without the pull request's folder list. Every check is `0` except `outside-folder=51`. Every one of the 51 files is under `AlgebraicTopology/`, `GeometricTopology/`, `IntegralLattices/`, `ReductiveGroups/` or `RepresentationTheory/LieHighestWeight/`, the folders the brief names as this pull request's own.
- `git diff --stat origin/main...HEAD`, excluding those folders and this one, is empty. `lake-manifest.json` and `lean-toolchain` are untouched.
- Since `f925965` only `AlgebraicTopology/{README.md,Suggested.lean}` changed outside this folder, and this roadmap neither cites nor imports it.

**Dependency check.** `gate --depcheck … --movable` prints `depcheck: 239 roadmaps, 2334 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.

**Elaboration.**
- `lake env lean TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` exits `0` with no diagnostic. The file has no `sorry`, and `git diff f925965 HEAD -- Suggested.lean` is empty.
- I compared each of the 15 elaborated types in `signatures.md` with its README statement. Nothing changed.
- The three "looks dropped" leads (`hilbertSymbol_mul`, `exists_hilbertSymbol_eq_neg_one`, `hasseInvariant_eq_localHasse`) are false: their elaborated types carry `[Invertible 2]`.

**Probe files** (scratch). Two files, elaborated as above, both exit `0` without errors:
- `#check @` of every name the changed lines cite;
- three `example`s on the `discr` Checks;
- three `example`s on the `ℚ_2` symbols of the `localHasse` Checks;
- one `example` for the remark on `hilbertSymbol_unramified` below.

**R01 names at the pin.**
- `QuadraticForm.dualProd : (R M) → QuadraticForm R (Module.Dual R M × M)` is at `Mathlib/LinearAlgebra/QuadraticForm/Dual.lean:85`.
- `LinearMap.BilinForm.exists_orthogonal_basis` is at `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1331`. Its hypotheses are `[Invertible 2]` and `LinearMap.IsSymm B`, and its conclusion is `∃ v, IsOrthoᵢ B v`.

**R02 paragraph, claim by claim, at the pin** (files under `TauCeti/`):
- **Universe `0`.**
  - `TauCeti.ClassFieldTheory.invMap` sits under `variable (K : Type)` (`NumberTheory/ClassFieldTheory/Brauer/Invariant.lean:98, 200`).
  - The same holds for `quaternionSubgroup_eq_twoTorsion`, `invMap_brauerGroupEquivBr_quaternionClass_eq_half_iff` and `h2MuEquivZMod_eq_one_iff_hilbertSymbol_eq_neg_one` (`NumberTheory/LocalField/Quaternion/Invariant.lean:60, 67, 79, 92`). `#check @` confirms `∀ (K : Type)` for all three.
- **Universe-polymorphic: Milestone 1.** `quaternionSubgroup` (`Algebra/Quaternion/Subgroup.lean:27`, `Type*`), `quaternionSubgroupSignEquiv` (`LocalField/Quaternion/Subgroup.lean:38, 114`), `hasseInvariant_mem_quaternionSubgroup` (`Hasse/Basic.lean:84, 133`) and `quaternionSubgroupSignEquiv_apply_hasseInvariant` (`LocalField/QuadraticForm/Brauer.lean:35, 43`).
- **Universe-polymorphic: the cup compatibility.** `brauer2EquivH2_quaternionClass` (`CrossedProduct/CupProduct.lean:67, 362`) and `cup_kummerClass_eq_zero_iff` (`MuTwo/CupNorm.lean:69, 103`).
- **Universe-polymorphic: the sign identity.** `hilbertSymbol_eq_cohomological` (`MuTwo/LocalSymbol.lean:191`, `{F : Type u}`). The other two declarations the milestone names, `hilbertSymbol_eq_hilbertSign_kummerBrauerClass` and `localSymbol_eq_zero_iff_hilbertSymbol_eq_one`, are polymorphic as well.
- **The sign identity in a higher universe.** It holds for every additive `tr : H²(G_F, μ₂) ≃+ ZMod 2`, so "takes the sign identity from `hilbertSymbol_eq_cohomological`" is accurate. Supplying a `tr` above universe `0` is what "restates the invariant-map form there" covers.
- **The universe lift.** `brauerCohomologyEquiv_uliftEquiv` is at `Algebra/CrossedProduct/BaseChange/ULift.lean:228`, stated for `K : Type u` and `ULift.{w} K`. Layer 7B item 5 (README 2004–2017) names it.
- **ClassFieldTheory's universe.** Its "2. Mathematical conventions" on main (README 282–285) fixes universe `0` for `G` and `K`.

**R04 Checks, against the pin.**
- `TauCeti.RegularFormClass.discr` is `Quotient.lift` of `squareClass (∏ i, p.2 i)` (`RegularFormClass/Discriminant.lean:123`).
- `signedDiscr x = (rank x).choose 2 • squareClass (−1) + discr x` (260).
- `multiplicativeSquareClassEquiv_mk` sends `mk u` to `ofAdd (squareClass u)` (`FieldTheory/SquareClassGroup/Multiplicative.lean:96`).
- `omearaLocalHasseSymbol_eq` writes `∏_{i≤j} = localHasse · (discr, −1)` (`NumberTheory/LocalField/QuadraticForm/Hasse.lean:118`), in the same order as the Check.
- `hilbertSymbol_neg_one_neg_one_padicTwo` (`LocalField/QuadraticForm/PadicTwo.lean:145`), `hilbertSymbol_neg_one_neg_one_of_ne_two` (`LocalField/Quaternion/Examples.lean:67`) and `hilbertSymbol_neg_one_neg_one_real` (114) fix the `(−1,−1)` values at `2`, odd `p` and `∞`.

**Seeded sample, where it falls in the change.**
- "Milestone 2" (README 1658–1678) was re-read in full, with all six of its Tau Ceti declarations opened at the pin as above.
- The milestone list of "The classical construction, before any cohomological normalization" (6C item 7, 1496–1520) was re-read together with its new Checks.
- The other eleven targets of the sample are untouched since `f925965`. They are carried from the previous review, which opened each declaration at the pin and read `kahn1984` lines 55, 763–788 and 1044–1059, `serre1984cmh` 556–562 and `kozlowski1984` 34–41 for "The value of the Evens norm on a Kummer class".
- The changed lines add no source locator, so no source was read this round.

**Adversarial table: new rows for the changed passages.**

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `discr` Checks (README 799–812) | rank `0`; `⟨1,−1⟩`, `⟨1,1⟩` over `ℚ`; `⟨1⟩`, `⟨4⟩`; `⟨a⟩` | `discr 0 = [1]` (`discr_zero`); `[1·(−1)] = [−1]`, `[1·1] = [1]` (probe: `discr ⟨1,1⟩ = 0`); signed, with `C(2,2) = 1`: `[−1]+[−1] = 0 = [1]` and `[−1]+[1] = [−1]` (both probes elaborate); `[4] = [2²] = [1]`; `[a⁻¹] = [a·(a⁻¹)²] = [a]` | holds; signed model excluded |
| `localHasse` Checks (1506–1520) | `n = 0, 1`; diagonal model on `![−1]`; `![a,−a]`; `![−1,2]` over `ℚ_2` | empty filter → `+1`, diagonal model → `(−1,−1)_2 = −1`; `−a = 0² − a·1²` → `+1`; `(−1,2)_2 = +1` (`2 = 1²+1²`, probe); `i ≤ j`: `(−1)(+1)(+1) = −1` with `(2,2)_2 = +1` (`2 = 2² − 2·1²`, probe) | holds; O'Meara and diagonal models excluded |
| O'Meara translation in that Check | `d = −2` | `(−2,−1)_2 = (−1,−2)_2 = (−1,−1)_2·(−1,2)_2 = (−1)(+1) = −1`, and directly `x² + 2y² ≡ 1, 3 mod 8` for odd `x`, never `7`; `s·(d,−1) = (+1)(−1) = −1 = ∏_{i≤j}` | holds |
| `![−1,−1]` at `2`, `∞`, `3` | three places | `−1` (`PadicTwo.lean:145`), `−1` (`Examples.lean:114`), `+1` (`−2 ≡ 1 mod 3` is a square in `ℚ_3`, so `−1 = 1² + (√−2)²`); Hamilton's `ℍ` ramifies exactly at `2, ∞` among these | holds |
| Milestone 2 universe (1671–1678) | `#check @` of 13 names | three declarations and `invMap` at `(K : Type)`; Milestone 1, cup, sign identity at `{K : Type u_1}`; ULift lemma for `K : Type u` | holds |
| R01 names (541, 639) | `#check @` | types as quoted above | resolve |

**Adversarial table: rows carried from the previous review of `f925965`** (statements untouched; the values are that report's):

| Statement | Values (previous review) | Result |
|---|---|---|
| `hilbertSymbol_unramified` (Lean 134) | `ℚ_2`, `Δ = 5`: `b = 2` → `−1`, `b = −1` → `+1` | holds (see remark 1) |
| `hilbertSymbol_mul` (144) | `ℚ_2`, `(2,−5) = −1 = (2,5)(2,−1)` | holds |
| `exists_hilbertSymbol_eq_neg_one` (150) | `a = 5`: `b = 2`; `a = −1`: `b = 3` | holds |
| `exists_of_realization` (158) | `(1,[1],−1)`, `(2,[−1],−1)` excluded; `⟨−1,−1⟩`, `⟨−1,−1,1⟩` realize `s = −1` | holds |
| `hasseInvariant_eq_localHasse` (168) | `ε[ℍ] = −1 = (−1,−1)_2`; `ε(1) = (a,−a)` | holds |
| `hilbertSymbol_productFormula` (195) | `(−1,−1)`: `(−1)(+1…)(−1) = 1`; `(2,5)`: `(−1)(−1) = 1` | holds |
| `hilbertSymbol_eq_cohomological` (206) | `a` square: both sides `+1` | holds |
| Four-fold criterion, `(dim,d,s)`, cup-norm, Evens value, relative formula (226–291) | as tabulated there (`ℚ_2(i)`, `a = 1+2i`: `(2)∪(5)`; trace-zero case `0`) | hold |
| Lam V.3.20 exponents, Clifford of `⟨1⟩ⁿ` over `ℝ`, `s(λq)`, `s(q ⊥ r)`, O'Meara's symbol, `c(⟨⟨a,b⟩⟩)` | `C(n−1,2), C(n+1,4) mod 2` for `n = 1..8`; `1,1,[ℍ],[ℍ],[ℍ],[ℍ],1,1` | hold (see remark 4) |
| `I⁰` warning, Serre's `ℚ_2` formula, odd-residue formula, `ℚ_2` defects, local square theorem, index over `ℚ_2(√2)`, `μ₂` action, Pfister slots, bimultiplicativity over `ℚ` | as tabulated there | hold |

**Overlaps.**
- No id this README cites is dropped by an open pull request, and no id is defined only by an open revision. No changed passage renumbers or renames an id.
- The closest roadmaps in vocabulary are unchanged from the previous review. `QuadraticFormInvariantsPartII` (#1834) owns exactly this README's three exclusions.
- The four conflicting heads are R01. I compared their copies of this folder against main and this head with `roadmaps show --pr N`:
  - #617: 5 README lines and 1 Lean comment line differ from main;
  - #1411: two imports differ from main;
  - #1215: 111 README lines and 30 Lean lines differ from this head;
  - #1187: a rewrite of the old file for the pin bump.

**Remarks on untouched text that the previous review passed.** No change is requested and none of these is a finding:
1. **`hilbertSymbol_unramified`** (`Suggested.lean` 134–138). The hypothesis `hΔ` is the conclusion read through `TauCeti.hilbertSymbol_def`: a scratch `example` closes the statement by `rw [hilbertSymbol_def]` and `hΔ b` alone, without using `TauCeti.hilbertSymbol_unramified`. #1215's head states the existence form.
2. **Names GlobalQuadraticForms still cites.** Its README on main cites `signedDiscr` (121), `localHasse_congr` (124, 292) and `discr_mk` (616) as this namespace's names. Main's `Suggested.lean` declares them (467, 475, 1309). This head declares none of them, and the README gives no old → new line; the Tau Ceti names are `TauCeti.RegularFormClass.{signedDiscr, localHasse_congr, discr_mk}`.
3. **No `## Downstream consumers` section.** The README has none (References begins at 2601).
4. **The Clifford example over `ℝ`.** README 1215–1217 says the example over `ℝ` "checks both correction exponents". But `d⟨1,…,1⟩ = [1]` makes `[(−1,d)]` trivial, so only the second exponent is tested.
5. **The local instance.** `qfiNativeBrauerCommGroup` (`Suggested.lean` 48–50) restates the global `instance TauCeti.BrauerGroup.instCommGroup` (`Algebra/BrauerGroup/Group.lean:174`).

## Not verifiable

- These four works have no legal copy in the cache and no manifest entry (R02): T. Y. Lam (2005), P. Gille and T. Szamuely (2017), L. C. Grove (2002) and O'Meara (1955). The changed lines add no locator into them.
- `serre1973cia`, `serre1979lf`, `milnor1970`, `omeara1963` and `scharlau1985` are settled as uncertified and are cited by locator.
- Ownership against open pull requests is not re-checked beyond the change. The change adds no object and no ownership claim. The previous review's check, through the sibling checkouts and the overlap leads, stands.

## Source issues

- none
