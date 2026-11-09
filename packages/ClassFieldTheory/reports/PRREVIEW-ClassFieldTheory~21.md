# Review of ClassFieldTheory (pull request #1411 at 303ce50)

**Verdict:** needs changes

This is an incremental re-review of the 38 lines changed since `46e4ab9`. The previous report's R02, R03 and R04 are repaired, and the repairs introduce no new defect. Its R01, the gate's `outside-folder` failure on `Completed/LocalGaloisGroups/Suggested.lean`, is unchanged. It is restated below as this report's only finding. While the gate fails, the folder cannot be accepted.

## R01 (P3) — The gate still fails `outside-folder` on `Completed/LocalGaloisGroups/Suggested.lean`

This is the previous report's R01 (and the R02 before it). It is still failing, and this head does not touch it.

**Location:** `Completed/LocalGaloisGroups/Suggested.lean:326`, `⟨ClassFieldTheory.h2MuEquivZMod_mixed p F n hn⟩`, and `:485`, `⟨ClassFieldTheory.h2FpEquivZMod_of_mu p F _ (muNRepIsoTrivialFp p F ζ hζ)⟩`.

**Claim:**
- The pull request edits a completed roadmap's certificate. That folder is not one the brief names as this pull request's own.
- The edit is forced and correct. Here `h2MuEquivZMod_mixed` and `h2FpEquivZMod_of_mu` are Tau Ceti's canonical equivalences, where main had `Nonempty` theorems. The two lines wrap them in `⟨…⟩`.
- No edit inside `TauCetiRoadmap/ClassFieldTheory/` clears the check.

**Witness:**
- The worker's gate at `303ce50` reports `… stray-files=0 dirty=0 outside-folder=1 source-material=0 build=0 FAIL`, listing this file.
- My run reports `outside-folder=3`. The other two files are `TauCetiRoadmap/IntegralLattices/Suggested.lean` and `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean`, which the brief names as the pull request's own.

**Repair:**
- Keep the two lines. One of two things has to happen:
  - a maintainer approves the `Completed/LocalGaloisGroups` change as a certificate update forced by its supplier; or
  - the worker records that folder as one of this pull request's own, as the description already does ("this pull request's folders are ClassFieldTheory, IntegralLattices, QuadraticFormInvariants and Completed/LocalGaloisGroups").
- Tested: `lake env lean` on that file at this head exits 0 with no error. Its warnings are the `sorry`s and the `concreteInstances` linter only. So keeping the lines is safe.

## Previous findings

- R01 — not repaired: `Completed/LocalGaloisGroups/Suggested.lean:326` and `:485` are unchanged. The worker's gate still reports `outside-folder=1` on that file. This report's R01.
- R02 — repaired:
  - README lines 1101–1105 now read: "Tau Ceti states the Euler characteristic, through its class `FinitePadicExtension`, and the cyclotomic normalization `localCyclotomicCharacter_artinMap_unit` … Its `finite_H` needs only `(n : F) ≠ 0` and its `tateDualityPairing_perfect_mixed` only `CharZero F`".
  - `Suggested.lean:509–511` no longer names local duality.
- R03 — repaired: README lines 2177–2178 read "through Tau Ceti's `MonoidHom.transfer_commutator_eq_one`, Furtwängler's group-theoretic theorem, in `TauCeti/GroupTheory/Transfer/Commutator.lean`".
- R04 — repaired:
  - README lines 2083–2088 read "for a finite set `S` of finite primes … abelian of degree `[U(S) : U(S)^p] = p^{|S|+r₁+r₂}`, where `r₁` and `r₂` are the numbers of real and complex places".
  - Two new Checks follow at lines 2117–2121.

## Verified sound

**Gate.** My run at `303ce50`:

```text
gate ClassFieldTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=3 source-material=0 FAIL
```

Only `outside-folder` fails (R01). The worker's run adds `build=0`.

**Dependency check** (`--movable`):

```text
depcheck: 238 roadmaps, 2323 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The diff adds no roadmap supplier. Its new citations are to Tau Ceti (`GroupTheory/Transfer/Commutator.lean`, `GlobalExistence/Kummer.lean`) and to `milne-cft`.

**Elaboration:**
- `lake env lean TauCetiRoadmap/ClassFieldTheory/Suggested.lean` exits 0. The only warnings are six `declaration uses 'sorry'`, at lines 512, 688, 701, 750, 897 and 907. Each sits one line below its previous position, because the edited docstring grew by one line.
- The diff changes no Lean signature, only the docstring of `algebraMap_vle_algebraMap_iff_of_finite_padic`.
- The worker's `#check @` transcript of 72 declarations flags the same two binder-drop leads as before. They are `restrictAbsolute` (line 615) and `absoluteGaloisGroupExtend` (line 632), Galois-theoretic maps that correctly drop the local-field binders.
- The transcript's entries `below`, `on` and `field` are parser artefacts: words after "instance", "structure" and "class" in docstrings at lines 66, 735 and 818. They are not declarations.
- `Completed/LocalGaloisGroups/Suggested.lean`, which imports this module, elaborates against this head with exit 0 and no error.

**The repaired Layer 5 paragraph** (README lines 1101–1107, `Suggested.lean:502–511`), checked against the pinned Tau Ceti:

| Claim | Pinned declaration | Result |
|---|---|---|
| Euler characteristic "through its class `FinitePadicExtension`" | `EulerCharacteristic/Theorem.lean:39–41`, section variable `[FinitePadicExtension F p]`, used by `eulerCharacteristic_mixed` (`:98`) and `eulerCharacteristic_finrank_fp` (`:110`); `FinitePadicExtension` bundles `algebra`, `toModuleFinite` and `toValuativeExtension` (`LocalField/AbsoluteRamificationIndex.lean:64–71`) | true |
| cyclotomic normalization `localCyclotomicCharacter_artinMap_unit` takes `ValuativeExtension ℚ_[p] F` | `ExplicitCyclotomicSymbol/ArtinMap.lean:311–313`: `[Algebra ℚ_[p] F] [FiniteDimensional ℚ_[p] F] [ValuativeExtension ℚ_[p] F]` | true |
| `finite_H` needs only `(n : F) ≠ 0` | `FiniteCohomology/DegreeTwo.lean:97`, `(hn : (n : F) ≠ 0)`; section variables (`:49–50`) are the local-field structure only | true |
| `tateDualityPairing_perfect_mixed` needs only `CharZero F` | `Local/Duality/Perfect.lean:280`, `[CharZero F]`, no `ℚ_p`-algebra, no `ValuativeExtension` | true |
| "both of which the `ℚ_p`-algebra structure gives" | the aliases at `Suggested.lean:520–527` and `540–552` carry `hn : n ≠ 0` and build `CharZero F` from `charZero_of_injective_algebraMap`; then `Nat.cast_ne_zero.mpr hn` gives `(n : F) ≠ 0` | true, with the aliases' `n ≠ 0` |
| only `eulerCharacteristic_finrank_fp` and `cyclotomicCharacter_artinMap` take the hypothesis from the open target | `Suggested.lean:568` and `802`, the only two uses of `algebraMap_vle_algebraMap_iff_of_finite_padic`; agrees with README lines 559–566 and the module docstring, lines 66–69 | true |

The docstring's "(its `finite_H` and local duality need only `CharZero F`)" gives the sufficient hypothesis the aliases actually supply. It agrees with the README's exact one, since `CharZero F` and `n ≠ 0` give `(n : F) ≠ 0`.

**The repaired Layer 12 Kummer passage** (README lines 2081–2093), checked against `milne-cft` and Tau Ceti:
- `milne-cft` line 10218 is Lemma 9.3, on p. 224 (page marker at line 10194, running head 224).
  - Its proof (lines 10221–10271, pp. 224–225) puts the infinite primes into `S`.
  - It gets `(U(S) : U(S)^p) = p^s` from Dirichlet's `S`-unit theorem (line 10255).
  - It gets the index `p^s` of `K^×E` from the local indices and the product formula (lines 10260–10270).
  - With `S` of finite primes, `s = |S| + r₁ + r₂`, which is the README's formula and its parenthetical "Milne puts the archimedean places into `S`".
- Tau Ceti's `GlobalExistence/Kummer.lean` agrees:
  - line 35 has "index `p ^ (#S + r₁ + r₂)`";
  - lines 79–83 have `S` "a finite set of finite places";
  - `E_S` consists of ideles that are "`p`-th powers at `S` and at every infinite place and units elsewhere", word for word the README's description of `E_S`.
- `kummerLayer` (`KummerLayer.lean:65`) and `exists_abelianLayer_globalNormSubgroup_eq_of_pow_mem` (`GlobalExistence/Kummer.lean:127`) exist at the pin.

**The repaired Layer 13 *Needs* line:**
- `MonoidHom.transfer_commutator_eq_one` is at Tau Ceti `GroupTheory/Transfer/Commutator.lean:303`, whose docstring at line 299 names Furtwängler.
- `Formation/PrincipalIdeal.lean:9` imports that module, and `groundInclusion_mem_normSubgroup_of_range_eq_commutator` is at `:67`.
- `grep` for the name over the pinned Mathlib finds 0 occurrences.

**Seeded sample, where it falls in the changed passages:**

| Target | Checked against | Result |
|---|---|---|
| The `p`-adic valuation on a finite extension of `ℚ_p` | the five pinned signatures above; `jahnke-koenigsmann` line 113 is Theorem 2.1 (after F. K. Schmidt), on p. 3 (page marker at line 96), cited as background only; the proof route is unchanged and was checked step by step in the previous report | sound |
| The principal ideal theorem | `milne-cft` line 7252, V Theorem 3.17, printed p. 161 (marker at line 7226, running head 161); line 7323, Theorem 3.19, printed p. 163 (marker at line 7310); the new attribution, above | sound |
| Exit criterion, Layer 5 (line 1195) | unchanged; the names it lists (`finite_H`, `tateDualityPairing_perfect_mixed`, `eulerCharacteristic_mixed`, `eulerCharacteristic_finrank_fp`, `algebraMap_vle_algebraMap_iff_of_finite_padic`) agree with the repaired paragraph | sound |
| Exit criterion, Layer 12 (line 2100) | unchanged; the Kummer case feeding it was checked against `milne-cft` lines 10218–10271 above | sound |

The other sampled targets lie outside the diff: "Implemented in Tau Ceti", the coefficient objects, local units and the `H²` bound, the coordinates of `H²(F, μ_n)`, the Hilbert symbol, the absolute upper ramification groups, unit-filtration reciprocity, global Herbrand quotients and fixed points, and the other Exit criteria. The diff does not touch them. The previous report verified them, and its table holds at this head. The README flags no locator as unverified.

**Adversarial table.** The rows marked "carried" are the previous report's (`46e4ab9`), for statements this diff leaves untouched. The other rows were computed for this head.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Layer 5 hypothesis inventory (README 1101–1107, `Suggested.lean:508–511`) | `F = ℚ_2`, `n = 3`; `F = 𝔽_2((t))`, `n = 3`; `n = 0` | `(3 : ℚ_2) ≠ 0`, so `finite_H` applies, and so does perfectness (`CharZero ℚ_2`); over `𝔽_2((t))`, `(3 : F) = 1 ≠ 0`, so Tau Ceti's `finite_H` applies although `CharZero` fails, which shows `(n : F) ≠ 0` is the exact hypothesis and `CharZero` only sufficient; `n = 0` gives `(0 : F) = 0`, excluded, and the aliases carry `hn : n ≠ 0` | sound |
| Kummer degree `[U(S) : U(S)^p] = p^{|S|+r₁+r₂}` (README 2085) | `ℚ`, `p = 2`, `S = {(2)}`; `ℚ(ζ_3)`, `p = 3`, `S = {(1 − ζ_3)}`; `ℚ(i)`, `p = 2`, `S = {(1+i)}`; `ℚ(√2)`, `p = 2`, `S = {(√2)}` | `U(S) = ±2^ℤ`: `2·2 = 4 = 2^{1+1+0}`. `U(S) = μ_6 × (1−ζ_3)^ℤ`: `[μ_6 : μ_2]·3 = 9 = 3^{1+0+1}`. `U(S) = μ_4 × (1+i)^ℤ`: `[μ_4 : μ_2]·2 = 4 = 2^{1+0+1}`. `U(S) = ±1 × (1+√2)^ℤ × (√2)^ℤ`: `2·2·2 = 8 = 2^{1+2+0}`. Wrong models: `p^{|S|+r₁}` gives `3` at `ℚ(ζ_3)`; `p^{|S|+r₂}` gives `2` at `ℚ`; Milne's `p^{|S|}` with finite `S` gives `p` in all four cases | sound |
| Index of the image of `E_S` in `C_K` (README 2087–2091) | `ℚ`, `p = 2`, `S = {(2)}`; `ℚ(ζ_3)`, `p = 3` | `[ℚ_2ˣ : ℚ_2ˣ²] = 8 = 4/‖2‖_2`, `[ℝˣ : ℝˣ²] = 2 = 4/‖2‖_∞`, product `16 = 2^{2·2}`, divided by `[U(S) : U(S)²] = 4` gives `4 = [ℚ(ζ_8) : ℚ]`, equal to the norm index; `[ℚ_3(ζ_3)ˣ : cubes] = 81 = 9·9 = 9/‖3‖_v`, the complex place gives `9/‖3‖_ℂ = 9/9 = 1`, and `81/9 = 9 = 3^{1+0+1}` | sound |
| Layer 12 new Check, Kummer field over `ℚ` (README 2117–2118) | `K(U(S)^{1/2})`, `U(S) = ±2^ℤ` | `ℚ(√−1, √2) = ℚ(ζ_8)`, degree `4`; Kummer theory gives `[U(S) : U(S) ∩ ℚˣ²] = [U(S) : U(S)²] = 4`, since a square root of an `S`-unit is an `S`-unit | sound |
| Layer 13 *Needs* attribution (README 2177–2178) | pinned Tau Ceti and Mathlib; `C_4 ⊃ ⟨g²⟩`; Klein four | Tau Ceti `Commutator.lean:303` exists, Mathlib has 0 occurrences; transfer `g ↦ g²` is onto `H` (carried); the Klein four transfer is trivial while the quotient map is not (carried) | sound |
| `algebraMap_vle_algebraMap_iff_of_finite_padic` (docstring only changed) | carried: `ℚ_2(i)`, `a = 2`, `b = 1`; trivial relation on `F`; 3-adic valuation extended to `ℚ_5` | normalized `2` against `1`, both `2 <ᵥ 1`; `1 ≤ᵥ p` in `F` but not in `ℚ_p`, excluded by `IsNontrivial`; `u(6) = u(3) < 1`, excluded by `valueGroupWithZeroIsoInt` | carried, sound |
| `map_unitFiltration_normResidue` | carried: `ℚ_p(ζ_p)`, `n = 0, 1`; `ℚ_2(√2)`, `n = 2, 3`; `𝔽_p((t))`, Artin–Schreier | `p − 1 = #G^0`, then `1`; `(5,2)_2 = −1`, image `G = G^2`, and `1 = G^3`; break 1 | carried, sound |
| `closure_map_artinMap_unitFiltration` | carried: unramified quotient, `n = 0`; `ℚ_2`, `n = 0` against `1` | both trivial; `U^0 = U^1` over `𝔽_2` | carried, sound |
| `sup_norm_unitFiltration_eq_of_upper_eq_top` | carried: `K = L`; `ℚ_2(√2)`, `r = 2, 3` | `N(U^0) = U^0`; `N(1+√2) = −1 ∉ 1+4ℤ_2`; `G^3 = 1 ≠ G` | carried, sound |
| `localAbsoluteUpperRamificationGroup` | carried: `u = −1`; `u ∈ (−1, 0]`; `ℚ_2(ζ_8) ⊃ ℚ_2(√2)` at depth 3 | `G_K`; trivial at the unramified level, where the floor model gives `ℤ/f`; `σ_5(√2) = −√2` but `Gal(ℚ_2(√2)/ℚ_2)_3 = 1` | carried, sound |
| `conductorExponent_eq_sInf_upperRamificationGroup` | carried: unramified; `ℚ_5(ζ_5)`; `ℚ_2(√2)`; `ℚ_2(ζ_8)` | `0`; `1`; `3`; `3` | carried, sound |
| `isPrincipal_map_hilbertClassField` | carried: `ℚ(√−5)`, `I = (2, 1+√−5)` | `H = K(i)`, `I𝒪_H = (1+i)` | carried, sound |
| `relDiscr_eq_finprod_abelianConductor` | carried: `ℚ(i)`; `ℚ(ζ_5)`; `ℚ(i,√5)` | `4 = 1·4`; `5³ = 1·5·5·5`; `400 = 1·4·5·20` | carried, sound |
| `cyclicHasseNorm` | carried: `ℚ(i)/ℚ`, `x = 3, 5`; `ℚ(√13,√17)` | both sides false; both true; not cyclic, so excluded | carried, sound |
| `hilbertProductFormula` | carried: `(−1,−1)`, `(5,5)`, `(3,7)` over `ℚ` | `1+1 = 0`; all `0`; `1+1 = 0` | carried, sound |
| `card_ideleClassNormQuotient` | carried: `ℚ(i)/ℚ`; `L = K` | `2 = 2`; `1 = 1` | carried, sound |
| `scd_p_absoluteGaloisGroup_eq_two` | carried: `ℓ = p`, `ℓ ≠ p`; `𝔽_p((t))` | `2`, `2`; `cd_p = 1`, excluded by `[Algebra ℚ_[p] K]` | carried, sound |
| `eulerCharacteristic_finrank_fp` | carried: `ℚ_2`, `𝔽_2`; `ℚ_p`, `𝔽_p`; `ℚ_3(ζ_3)`, `𝔽_3` | `3 = 1+1+1`; `2 = 1+0+1`; `4 = 1+1+2` | carried, sound |
| `tateDualityPairing_perfect_mixed`, `finite_H` | carried: `μ_3` over `ℚ_2`; the zero pairing | `H¹ = 3 = #ℚ_2ˣ/(ℚ_2ˣ)³`; zero pairing excluded by naming the pairing | carried, sound |
| `cyclotomicCharacter_artinMap` | carried: `ℚ_2`, `u = −1`; `u = −3` on `μ_16`; `ℚ_2(i)`, `u = i` | `χ = −1 = u⁻¹`; `(−3)⁻¹ ≡ 5 mod 16`; `N(i) = 1`, `χ = 1` | carried, sound |
| Layers 2, 3, 5, 6, 7, 8, 10, 11, 13 Checks and examples | carried: the previous report's rows | as recorded there | carried, sound |

**Library declarations opened at the pin for this diff:**
- Tau Ceti:
  - `finite_H` (`FiniteCohomology/DegreeTwo.lean:97`);
  - `tateDualityPairing_perfect_mixed` (`Local/Duality/Perfect.lean:280`);
  - `localCyclotomicCharacter_artinMap_unit` (`Local/ExplicitCyclotomicSymbol/ArtinMap.lean:311`);
  - `FinitePadicExtension` (`LocalField/AbsoluteRamificationIndex.lean:64–71`);
  - `eulerCharacteristic_mixed` and `eulerCharacteristic_finrank_fp` (`Local/EulerCharacteristic/Theorem.lean:98, 110`; section variables at `:39–41`);
  - `MonoidHom.transfer_commutator_eq_one` (`GroupTheory/Transfer/Commutator.lean:303`);
  - `ClassFormation.groundInclusion_mem_normSubgroup_of_range_eq_commutator` (`Formation/PrincipalIdeal.lean:67`);
  - `globalNormSubgroup_kummerLayer_sUnits` (`GlobalExistence/Kummer.lean:83`);
  - `exists_abelianLayer_globalNormSubgroup_eq_of_pow_mem` (`:127`);
  - `kummerLayer` (`KummerLayer.lean:65`).
- Mathlib: none is named in the diff. Searching the pinned Mathlib for `transfer_commutator_eq_one` returns 0 hits.

**Overlaps and citations:**
- `overlaps.md` is unchanged in substance.
  - #617 and #1215 revise this roadmap and conflict with this head. The description states which one rebases.
  - The dropped ids §2.4–§2.6, cited by #999, #1692 and #1484, keep their old → new lines at README lines 194–196.
- The three `citations.md` leads (`cd_p_le_of_isClosed`, `cd_p_le_scd_p`, `cd_p_eq_of_isProPSylow`) are in untouched text. They are ProfiniteCohomology and ProfiniteProPGroups README names, which the previous report resolved on main.
- The diff adds no object that another roadmap could own. The Kummer degree and the transfer theorem are Tau Ceti's at the pin, and the README cites them as such.

## Not verifiable

Unchanged from the previous report. The diff cites no new source.
- `serre-local-fields`, `neukirch-ant` and `nsw` (uncertified) and `artin-tate` (waived), at the locators the previous report lists.
- Texts the manifest does not hold:
  - Tate 1952 and Nakayama 1957;
  - Rim 1959, Brown VI §8 and Lang III 7.1;
  - Cox §7 and Theorem 9.18;
  - Tate's Corvallis article and Weil 1951;
  - Serre's *Galois Cohomology* and *A Course in Arithmetic* III;
  - Cassels–Fröhlich.

## Source issues

- none
