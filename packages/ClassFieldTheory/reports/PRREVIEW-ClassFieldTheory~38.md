# Review of ClassFieldTheory (pull request #1215 at f62eba2)

**Verdict:** needs changes

This is an incremental re-review of the 101 lines changed in this folder since c408926. Five of the seven previous findings (R01, R02, R05, R06 and R07) are repaired in the folder. Each repair is correct, and none introduces a new defect. The two findings that remain both need a change to the pull-request description, which has not changed. Both are P3.

## R01 (P3) — The merge order against #617 and #1411 is still not stated

**Location.** The pull-request description, titled "ClassFieldTheory: correct hypotheses, conductors and lifting". It has no sentence about #617 or #1411.

**Claim.**
- Two other open pull requests change this roadmap's `README.md` and `Suggested.lean`, and both conflict with this head.
- #1411 states this head's absolute Layer 7 target under another name, and in the closure form that this head has just dropped.

**Witness.**
- `roadmaps overlaps ClassFieldTheory` reports: "#617 and #1215 conflict in … `TauCetiRoadmap/ClassFieldTheory/README.md`, `TauCetiRoadmap/ClassFieldTheory/Suggested.lean`". It reports the same for #1215 and #1411.
- At #1411's head, `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:537` declares `theorem closure_map_artinMap_unitFiltration`.

**Repair.**
- State in the description that this pull request merges first.
- State that #617 and #1411 then rebase on it, keeping only the ClassFieldTheory edits that this head lacks.
- #1411's Layer 7 names are already mapped in this README's name table (lines 280–281). The row for `closure_map_artinMap_unitFiltration` now records the closure-free form, so nothing in the folder needs to change.
- Test: the description names both pull requests and the order.

## R02 (P3) — The pull request edits `Completed/LocalGaloisGroups` without declaring it

**Location.** `Completed/LocalGaloisGroups/Suggested.lean`, with 62 insertions and 50 deletions against main and no change since c408926. An example is line 345: `ClassFieldTheory.cyclotomicCharacter_artinMap p F u hu σ hσ`.

**Claim.**
- The pull request edits a Completed roadmap.
- The brief names only GlobalQuadraticForms and QuadraticFormInvariants as its other folders.
- The edit itself is needed, because that file imports this roadmap's `Suggested.lean` (line 12). It should be declared, not undone.

**Witness.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ClassFieldTheory' ':!TauCetiRoadmap/GlobalQuadraticForms' ':!TauCetiRoadmap/QuadraticFormInvariants'` prints `Completed/LocalGaloisGroups/Suggested.lean | 112`.

**Repair.**
- Declare `Completed/LocalGaloisGroups` in the description as a folder of this pull request.
- Add one sentence saying what the edit does: it re-points that file from this roadmap's former declarations to Tau Ceti's names and to the open target `cyclotomicCharacter_artinMap`.
- Test: with that folder excluded as well, the command above prints nothing.
- I checked that this round's rename does not reach the file. The file uses only `cyclotomicCharacter_artinMap`, whose elaborated type has not changed (see `#check` below).

## Previous findings

- R01 — repaired: README lines 1354–1370 now read "the image of `U(K,n)` … Neither side needs a closure. `U(K,n)` is compact (`isCompact_unitFiltration`) and `artinMap` is continuous … At `n = 0` it is Tau Ceti's `map_artinMap_unitFiltration_zero`". `Suggested.lean:133` has no `.topologicalClosure`.
- R02 — repaired: three additions.
  - README line 614 adds the row "inputs of Layer 7's open targets … `ClassFormation.artinMap_quotient`, `normResidue_mk`, …, `finiteIntermediateField_valuativeExtension`", and line 622 adds the Layer 13 row.
  - Line 602 adds `inertiaSubgroup` and `map_artinMap_unitFiltration_zero` to the absolute Artin map row.
  - Lines 634–645 name the Mathlib inputs with their files.
- R03 — not repaired: the description is unchanged and states no order against #617 and #1411. Carried as R01 above.
- R04 — not repaired: the description still does not declare `Completed/LocalGaloisGroups`. Carried as R02 above.
- R05 — repaired: README line 660 reads "consumed through Mathlib's class `IsNonarchimedeanLocalField` (`Mathlib/NumberTheory/LocalField/Basic.lean`) and the pinned Tau Ceti modules `NumberTheory/LocalField/RamificationGroup.lean`, `FiniteExtension/`, `UnitFiltration/`, `Unramified/`, …".
- R06 — repaired: README lines 1382–1385 read "`−3 ≡ 13 mod 16` acts on `μ₁₆` by exponent `5`, since `13·5 = 65 ≡ 1 mod 16`, while the opposite convention gives `13`". W.3 (lines 2155–2156) and W.5 (lines 2210–2213) say the same.
- R07 — repaired: README line 1255 is now empty, before "**Character conductors, as consequences of the contract.**" (line 1256). The two consequence bullets now start a new list after that paragraph, so they no longer render as open targets.

## Verified sound

**Gate, dependency check and elaboration.**
- I reran the gate with the brief's command. Every check inside the folder is 0. `outside-folder=5`, and all five hits are in GlobalQuadraticForms and QuadraticFormInvariants, which the brief names as this pull request's own. The worker's gate, run with those folders declared, passes every check, the build (`build=0`) included.
- Dependency check (`--movable`): `depcheck: 235 roadmaps, 2259 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `TauCetiRoadmap/ClassFieldTheory/Suggested.lean` gives six `declaration uses 'sorry'` warnings (lines 81, 97, 130, 145, 156, 170) and nothing else.

**Signatures and padding.**
- I ran `#check @` on all seven declarations in a scratch copy. Every elaborated type matches its README statement.
- The changed theorem is `map_artinMap_unitFiltration_eq_upper : ∀ K … [IsNonarchimedeanLocalField K] (n : ℕ), Subgroup.map (artinMap K) (unitFiltration K n) = Subgroup.map (QuotientGroup.mk' (commutator G_K).topologicalClosure) (localAbsoluteUpperRamificationGroup K ⟨↑n, ⋯⟩)`. No binder is lost.
- One-tactic probe on it: `first | rfl | simp | exact map_artinMap_unitFiltration_zero K | infer_instance` fails, so it is not padding.
- Depth-zero test: with the API fact `localAbsoluteUpperRamificationGroup K 0 = inertiaSubgroup K` as a hypothesis, the target at `n = 0` closes by `rw [h]; exact map_artinMap_unitFiltration_zero K`. The Lean claim "At `n = 0` it is Tau Ceti's …" is therefore literally true.

**Library declarations opened at the pins.** All are present with the stated namespaces.

Tau Ceti:
- `Local/Unramified.lean:475` `map_artinMap_unitFiltration_zero`, proved, with no characteristic hypothesis; `:456` `mem_inertiaSubgroup_of_mk_eq_artinMap`.
- `LocalField/Unramified/Inertia/Basic.lean:112` `inertiaSubgroup`, the fixing subgroup of `K^ur`.
- `LocalField/UnitFiltration/Basic.lean:478` `isCompact_unitFiltration`.
- `Local/ArtinMap.lean:248` `continuous_artinMap`, with no characteristic hypothesis.
- `WeilGroup/ArtinMap.lean:111` `not_surjective_artinMap`.
- `Formation/ArtinMap.lean:475` `artinMap_quotient`, in namespace `TauCeti.ClassFieldTheory.ClassFormation`.
- `Local/Reciprocity.lean:173` `normResidue_mk` and `:181` `normResidue_mk_eq_one_iff`.
- `Local/Conductor/UpperNumbering.lean:121` `conductorExponent_le_iff_upperRamificationGroup_eq_bot`.
- `Herbrand/UpperQuotient.lean:98` and `Herbrand/ArtinConductor.lean:83` (both in `TauCeti.LocalFieldsRamification`).
- `Discriminant/Conductor.lean:58` `finsum_artinConductorExponent_eq_discriminantExponent`.
- `FieldTheory/Galois/Restriction.lean:146` `AlgHom.restrictNormalHom_restrictNormalHom`.
- `FiniteExtension/IntermediateField.lean:69, 75, 81, 97` (the four finite-intermediate-field structures).
- `Formation/PrincipalIdeal.lean:67` `ClassFormation.groundInclusion_mem_normSubgroup_of_range_eq_commutator`.
- `Global/LocalArtin/FinitePlace.lean:103` `localArtinAt`.
- The directories `NumberTheory/LocalField/{RamificationGroup.lean, FiniteExtension, UnitFiltration, Unramified, Herbrand, Different, Discriminant}` all exist.

Mathlib:
- `NumberTheory/LocalField/Basic.lean:46` `IsNonarchimedeanLocalField`.
- `RingTheory/Valuation/ValuativeRel/Basic.lean:1252` `ValuativeExtension`.
- `FieldTheory/AbsoluteGaloisGroup.lean:42, 101` `Field.absoluteGaloisGroup` and `Field.absoluteGaloisGroupAbelianization`.
- `NumberTheory/Cyclotomic/CyclotomicCharacter.lean:308` `cyclotomicCharacter`.
- `FieldTheory/Galois/GaloisClosure.lean:35` `FiniteGaloisIntermediateField`.
- `FieldTheory/Normal/Defs.lean:195` `AlgEquiv.restrictNormalHom`.
- `FieldTheory/Galois/Profinite.lean:148` `InfiniteGalois.restrictNormalHom_continuous`.
- `FieldTheory/Galois/Abelian.lean:25` `IsAbelianGalois`.
- `GroupTheory/FiniteAbelian/Duality.lean:63, 107, 133`, in `CommGroup`, plus `_root_.MonoidHom.domRestrict_surjective`.

**Cross-roadmap effects of the changes.**
- The old name `closure_map_artinMap_unitFiltration_eq_upper` is cited nowhere.
  - I grepped main, the 457 open roadmap pull-request heads (`roadmaps grep --fixed`), the local open-head checkouts and the board packages.
  - The only hit outside this folder is a board review report, which is data, not a citation.
  - FunctionFieldArithmetic (open head) cites Layer 7 and Tau Ceti names only.
- The out-of-folder `Completed/LocalGaloisGroups/Suggested.lean` uses only `cyclotomicCharacter_artinMap`, which is unchanged.
- Sibling folders of this pull request at this head:
  - GlobalQuadraticForms §4.2 (line 533) and §4.3 (line 588) still exist and consume `finrank_le_index_range_ideleClassNormMap` and `exists_sq_sub_mul_sq_iff_forall_completion`, as the README lines 2079–2080 say.
  - QuadraticFormInvariants consumes `TauCeti.hilbertSymbol_eq_cohomological` and `TauCeti.hilbertSymbol_productFormula` (its lines 56 and 61).
- Overlap facts: §2.5 and §2.6, cited by AnticyclotomicLocalUnits and EllipticCurveModularityWild3Adic, are still mapped to C.5 and C.6 (line 252). No id this README cites is dropped by an open pull request.

**Source sample.**
- 7.1 is the only sampled target that falls in the changed passages. Its source locators are unchanged.
- I re-read serre1961 lines 931–938 (p. 128, Proposition 3 and the paragraph on passing to the limit). It supports the inverse-limit construction cited in the definition paragraph.
- Serre, *Local Fields*, XV §2 is uncertified (see below). I checked mathematically the statement it is cited for, in the table.

**Remark on untouched text (not a finding).** The route sentence at README line 1248 still writes the unqualified `artinMap_quotient`. The *Needs:* line now uses `ClassFormation.artinMap_quotient`.

**Adversarial table.** "Arithmetic" is the normalization `χ(Art u) = u⁻¹`; "geometric" is the opposite one. Rows marked "r33" are carried unchanged from the previous review, PRREVIEW-ClassFieldTheory~33, for statements the diff leaves untouched.

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| `map_artinMap_unitFiltration_eq_upper` (changed, closure-free) | `n=0`, any `K`; `ℚ₃`, `n=0`, unramified quadratic quotient; `ℚ₂`, `n=1,2`, `ℚ₂(i)` quotient; `ℚ₃(ζ₉)`, `n=2`; `𝔽₂((t))`, `y²−y=t⁻¹`, `n=1,2`; closedness | `n=0`: `Art(𝒪ˣ)` against the image of `G_K^0 = I_K`; it reduces to Tau Ceti's theorem (probe elaborates). `ℚ₉/ℚ₃`: `1 = 1`, while `Art(3)` is the Frobenius of order 2. `ℚ₂(i)`: `U¹ → G` (`−1` is not a norm) `= G¹ = G`; `U² → 1 = G²`. `ℚ₃(ζ₉)`: `1 = G² = 1`, while `#G₂ = 3`. `𝔽₂((t))`: `C₂ = C₂`, `1 = 1`. Closedness: `U(K,n)` is compact and `Art` continuous, so the left side is compact in the Hausdorff `G_K^ab`. By contrast `Art(Kˣ)` is dense and not everything (`not_surjective_artinMap`), so compactness is load-bearing. | holds | none |
| Layer 7 contract, depth-zero bullet (changed) | definitions at the pin | `inertiaSubgroup = Fix(K^ur)`. `⋂_M res⁻¹ I(M/K) = Fix(K^ur)`, since `K^ur = ⋃ (M ∩ K^ur)` and `I(M/K) = Gal(M/M∩K^ur)`. The Tau Ceti statement at `Unramified.lean:475` is exactly as described. | holds | none |
| Layer 7 Check, `μ₁₆` sign witness (changed) | `ℚ₂`, `u=−3, −1`; `ℚ₃`, `u=4` | `(−3)⁻¹ ≡ 5 mod 16` (`−3·5 = −15 ≡ 1`); geometric gives `13`. On `μ₈` both give `5`. `−1 ↦ −1` in both, against `1` for the trivial character. `4⁻¹ ≡ 7 mod 9`; geometric gives `4`. | holds | none |
| Layer 7 Check, `n = 0` (new) | `ℚ₉/ℚ₃` quotient | `Art(U⁰) → 1` and `I → 1`. `Art(3)` is the Frobenius, of order 2. `Art(Kˣ)` and `G^{−1} = G_K` both map onto `C₂`. Agrees with the Layer 6 Check (`4 ↦ 1`, `3 ↦` Frobenius). | holds | none |
| W.3, `p = 2` sentence (changed) | as above | `5` against `13` on `μ₁₆`; `5` against `5` on `μ₈` | holds | none |
| W.5, `ζ₈` sentence (changed) | `ℚ(ζ₈)`, `ℚ(ζ₅)` | `3² = 9`, `5² = 25` and `7² = 49`, all `≡ 1 mod 8`, so the two conventions agree on `ζ₈`. `2⁻¹ ≡ 3 mod 5`: arithmetic gives `ζ₅²`, geometric `ζ₅³`. | holds | none |
| `cyclotomicCharacter_artinMap` (r33) | `ℚ₃`, `u=4`, `μ₉`; `ℚ₂`, `u=−3`, `μ₁₆`; hypothesis-removal route | `7` against `4`; `5` against `13`. `v(1−p) = 0`, so `v(p) > 0`. | holds | none |
| `normResidue_map_unitFiltration` (r33) | `ℚ₃(ζ₉)`, `n=0,1,2`; `ℚ₂(i)`; unramified; `L=K`; `𝔽₂((t))` | Image orders `6,3,1` equal `#G⁰, #G¹, #G²`, while lower numbering gives `6,3,3`. `U¹ → G`, `U² → 1`. `U⁰ → 1 = G⁰`. `C₂` then `1`. | holds | none |
| `localAbsoluteUpperRamificationGroup` (r33) | `ℚ₂(ζ₈)`; `X³−5/ℚ₅`; `ℚ₅(ζ₅)`; `v=−1` | Depths 0–3: `{1,3,5,7}`, `{1,3,5,7}`, `{1,5}`, `{1}`. `S₃`, `C₃`, `1` at depths −1, 0, 1. Depth 0 has order 4, positive depths 1. Depth −1 is all of `G_K`. | determines the object | none |
| `isPrincipal_map_hilbertClassField` (r33) | `ℚ`; `ℚ(√−5)`, `H = K(i)`; `I = ⊥` | `h = 1`. `𝔭² = (2) = ((1+i)²)`, so `𝔭𝒪_H = (1+i)`. `⊥ ↦ ⊥`. | holds | none |
| `count_relDiscr_eq_finsum…` (r33) | `ℚ(i)`, `ℚ(ζ₈)`, `ℚ(ζ₅)`, `ℚ(ζ₉)`, `L=K` | `2 = 0+2`; `8 = 0+2+3+3`; `3 = 0+1+1+1`; `9 = 0+1+2·4`; `0 = 0` | holds | none |
| `abelianConductor_eq_lcm` (r33) | `ℚ(ζ₈)`, `ℚ(√2)`, product/lcm swap | Max 3, giving `(8)·∞`. `(8)` with no `∞`. The swap gives 8 against 3. | holds | none |
| 0.1, 2.1, 4.1 (r33) | `ℤ[C₂]`; cyclic degree 4 and 8; `V₄` | `Ĥ⁰ = 0` against `ℤ/2`. Invariant `1/4`, restriction `1/2`, inflation `2/8`. Three distinct symbols. | holds | none |
| 5.1, 6.1 (r33) | `ℚ₂` with `𝔽₂`, `𝔽₃`; `ℚ₇`, `μ₃`; `ℚ₂(ζ₅)`; `cd₂ 𝔽₂((t))` | `8 = 2·2·2`, `3 = 3·1·1`. Invariant `1/3` against geometric `2/3`. `2 ↦ ζ₅²` against `ζ₅³`. `cd₂ = 1`. | holds | none |
| 7.1 conductors (r33) | `ℚ₂(√2)`, `ℚ₂(ζ₁₂)`, `ℚ_p(μ_p)`, `ℚ₃(ζ₉)` | `f = 3 = δ`. `0+0+2+2 = 4 = f·d`. Sum `p−2`, maximum 1. Discriminant `12−3 = 9`. | holds | none |
| 8.1, 9.1 (r33) | `ℚ₂`, `n=1`; `ℚ₂(i)`; unramified quadratic | `U¹⟨2⟩` has conductor 0. Index 2. `deg_K = 2·deg_L`. | holds | none |
| 10.1, 12.1 (r33) | `ℚ(√13,√17)`; `(−1,−1)/ℚ`; `ℚ(ζ₃)`, `p=3` | lcm of local degrees 2 against degree 4. `½+½ = 0`. `9 = 3^{1+1}`. | holds | none |
| 13.1, 14.1 (r33) | `ℤ+2ℤ[i]`; `p=3`, `q=7` | `h = 2/(1·2) = 1`. `1·(−1) = −1 = (−1)³`. | holds | none |

## Not verifiable

These sources are recorded as uncertified or waived in the manifest, so each is cited by locator only and I did not open it:
- serre-local-fields: XV §2 Theorem 2 and Corollary 3 to Theorem 1, cited by the changed absolute-reciprocity text and docstring; also IV §§1–3 and XIV §3.
- neukirch-ant: V Theorem 6.2 and VI §7.
- nsw.
- artin-tate: XIII and XIV.

Ownership against open pull requests was checked through `roadmaps grep` and `roadmaps overlaps`. The changed passages introduce no new owned object.

## Source issues

- none
