# Review of ClassFieldTheory (pull request #1215 at b94cfcc)

**Verdict:** needs changes

Six findings, all P3; none is blocking. This is a full review, because the folder changed by 211 lines since `024927f`.
- `Suggested.lean` elaborates against the pins with exactly the seven `sorry` warnings.
- The dependency check is clean.
- The gate still fails on the out-of-folder LocalGaloisGroups edit (R02).

Of the previous review's eight findings, five are repaired, one is repaired with two leftover gaps (R04), and two are not repaired (R02, R03). The table after the findings gives the detail.

## R01 (P3) — The conductor comparison in `Suggested.lean` restates Tau Ceti's `conductorExponent_fixedField_ker`

**Location.** `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:137–156` (`galoisCharacterConductorExp` and `galoisCharacterConductorExp_eq_artinConductorExponent`). Also `README.md:1174–1175`: "the conductor exponent of the fixed field of `ker χ` is the Artin conductor of `χ` (`conductorExponent_fixedField_ker`)". The open-target lists repeat it at `:92–94`, `:661`, `:1219–1229`, and in the module docstring at `:50–52`.

**Claim.**
- Tau Ceti already proves the reciprocity-conductor comparison, so it is not an open headline.
- The only open content left is the norm-kernel identity below. It is quotient functoriality of reciprocity, already used inside the route of `normResidue_map_unitFiltration`.
- The README itself demotes the sum and maximum formulas to consequences (`:1238–1245`). The comparison is a consequence of the same kind.

**Witness.**
- `Local/Conductor/UpperNumbering.lean:130`: `conductorExponent K (fixedField χ.ker) = artinConductorExponent K M χ`, for every finite abelian `M/K` and every `χ` into any `MulOneClass`.
- Let `F = L^{ker χ}`. Then `χ(Art_{L/K} x) = 1` exactly when `Art_{F/K} x = 1`, by `artinMap_restrict`, which is exactly when `x ∈ N(Fˣ)`, by `normResidue_mk_eq_one_iff` (`Local/Reciprocity.lean:181`).
- So the two sets `{n | U(K,n) ≤ ker}` are equal, and `galoisCharacterConductorExp K L χ = conductorExponent K F`.

**Repair.**
1. Delete `galoisCharacterConductorExp` and `galoisCharacterConductorExp_eq_artinConductorExponent` from `Suggested.lean`.
2. In Layer 7, move the comparison into the consequences paragraph (`:1238–1245`). There, read the reciprocity conductor of `ψ` as `conductorExponent K (fixedField ψ.ker)` through the kernel identity above, and cite `conductorExponent_fixedField_ker`.
3. Remove the comparison from the open-target lists at `:92–94`, `:661`, `:665–669` and `:1177–1179`, and from the module docstring.

This reverses an earlier request to state the comparison in Lean. That request predates the check that `conductorExponent_fixedField_ker` is pinned.

**Test of repair.** Take `ℚ₃(ζ₉)/ℚ₃` and `ψ` of order 3.
- `ker ψ = {±1}`, and `F` is the cubic subfield.
- `Art(U¹)` maps onto `Gal(F/ℚ₃)` and `Art(U²) = 1`, so `c(F/ℚ₃) = 2`.
- The Artin conductor of `ψ` is 2, and so is the reciprocity conductor.

The pinned theorem gives the value the deleted declaration stated.

## R02 (P3) — Gate `outside-folder`: `Completed/LocalGaloisGroups/Suggested.lean` (previous R02, not repaired)

**Location.** `Completed/LocalGaloisGroups/Suggested.lean` (62 additions, 50 deletions). For example, `ClassFieldTheory.kummerEquiv_mixed p F n hn` becomes `TauCeti.ClassFieldTheory.kummerEquivOfCharZero F hn`.

**Claim.**
- The edit is needed: main's LocalGaloisGroups checks name declarations that this head drops.
- But the folder is not declared as one of this pull request's own, so the gate fails. The roadmap cannot be accepted while it fails.

**Witness.** `scratch/gate.md` (the worker's gate run) shows `outside-folder=1`, on `Completed/LocalGaloisGroups/Suggested.lean`. The description's metadata block still declares only `"roadmap": "ClassFieldTheory"`.

**Repair.** Keep the edit. Declare `Completed/LocalGaloisGroups` as one of this pull request's folders, as GlobalQuadraticForms and QuadraticFormInvariants are.

**Test of repair.** Restrict `git diff --stat origin/main...HEAD` to everything outside the four declared folders. The result is empty, and the gate reports `outside-folder=0`.

## R03 (P3) — No stated order with #617 and #1411, which both change this roadmap (previous R05, not repaired)

**Location.** The pull-request description. Also `README.md:268–269`, which maps #1411's names `map_unitFiltration_normResidue` and `closure_map_artinMap_unitFiltration`.

**Claim.**
- Two other open heads change `TauCetiRoadmap/ClassFieldTheory/README.md` and `Suggested.lean`, and both conflict with this head.
- #1411's `Suggested.lean` also declares the same fully qualified `TauCetiRoadmap.ClassFieldTheory.localAbsoluteUpperRamificationGroup`.
- Nothing states which pull request is rebased on which.

**Witness.**
- `scratch/overlaps.md`: "#617 and #1215 conflict in … `TauCetiRoadmap/ClassFieldTheory/README.md`, `…/Suggested.lean`", and "#1215 and #1411 conflict …".
- `roadmaps grep` at #1411's head: `ClassFieldTheory/Suggested.lean:813 noncomputable def localAbsoluteUpperRamificationGroup`.

**Repair.** In the description, name #617 and #1411 and say which is rebased on which, or which is withdrawn. If #1411 is withdrawn, the alias rows at `:268–269` stay: FunctionFieldArithmetic (#1474, `README.md:1121`) and LocalAnabelianGeometry (#1811, `README.md:145`) cite #1411's names.

**Test of repair.** With the order stated, the overlap report's two conflicts each have a recorded resolution. The fully qualified name `localAbsoluteUpperRamificationGroup` then has one surviving declaration.

## R04 (P3) — The section and name correspondence misses two ids that other roadmaps cite, and one row misstates its difference

**Location.** `README.md:242–269` ("Section and name correspondence").

**Claim.**
- (a) This head no longer numbers the items of Layer 0. An open roadmap cites main's Layer 0 item 4.
- (b) Main's LocalGaloisGroups README cites a namespaced name that exists neither here nor at the pin.
- (c) The `sumLocalInv_eq_zero` row says "none", but the carrier changed.

**Witness.**
- (a) #999, `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:90`: "ClassFieldTheory §2.4 and Layer 0, item 4 (Tate–Nakayama with a free coefficient lattice)".
- (b) Main, `Completed/LocalGaloisGroups/README.md:180`, `:854` and `:857`: `TateCohomology.projective_ker_of_isZero_res`. At the pin this theorem is `Rep.projective_ker_of_isZero_res`, in `namespace Rep` at `TateCohomology/NakayamaRim.lean:73` (declared at `:117`).
- (c) Main's `sumLocalInv K x` takes `x : Br K`. Tau Ceti's theorem is `sumLocalInv K (brLocalization K x) = 0` (`Global/Brauer/SumFormula.lean:142`).

**Repair.** Add two rows and correct one:
- "Layer 0, item 4" → the Layer 0 bullets "The Tate–Nakayama theorem" and "The theorem of Nakayama and Rim".
- `TateCohomology.projective_ker_of_isZero_res` → `Rep.projective_ker_of_isZero_res`, difference "namespace".
- In the `sumLocalInv_eq_zero` row, change the difference to "stated on `brLocalization K x`".

**Test of repair.**
- Every right-hand name resolves at the pin.
- #999's citation and main's LocalGaloisGroups citation each map to exactly one target.

## R05 (P3) — The QuadraticFormInvariants boundary credits it with comparisons that Tau Ceti proves

**Location.** `README.md:202–205`: "`QuadraticFormInvariants` owns the norm-equation and quaternion presentations of local Hilbert symbols and proves that they agree with Tau Ceti's cohomological `localSymbol` and with the Hilbert invariants". Similar text at `:1958–1960`: "proves that its norm-equation and quaternion symbols agree with these invariants and inherits the product formula".

**Claim.** The comparisons and the sign-form product formula are Tau Ceti theorems. QuadraticFormInvariants, at this head, uses them under alias names and states that Tau Ceti proves them.

**Witness.**
- `TauCeti/FieldTheory/GaloisCohomology/MuTwo/LocalSymbol.lean:191`: `hilbertSymbol_eq_cohomological`.
- `NumberTheory/QuadraticForm/Global/CohomologicalSymbol.lean:72`, `:90`: the comparisons with `finiteHilbertInvariantAt` and `infiniteHilbertInvariantAt`.
- `QuadraticFormInvariants/README.md:74–78` at this head: "this roadmap's `hilbertSymbol_eq_cohomological` and `hilbertSymbol_productFormula` are their aliases".

**Repair.** Rewrite both passages. QuadraticFormInvariants owns the norm-equation and quaternion presentations. Their agreement with `localSymbol` and with the Hilbert invariants is Tau Ceti's:
- `TauCeti.hilbertSymbol_eq_cohomological`;
- `hilbertSymbol_unitAtFinitePlace_eq_hilbertSign`;
- `hilbertSymbol_unitAtRealPlace_eq_hilbertSign`.

The sign-form product formula is `TauCeti.hilbertSymbol_productFormula`, which Tau Ceti derives from `hilbertProductFormula`. QuadraticFormInvariants consumes these under its own names.

**Test of repair.** Over `ℚ₃`, `(−1,3)₃ = −1`, and `localSymbol` of the Kummer classes of `−1` and `3` is `1 ∈ ZMod 2`. This equality is a Tau Ceti theorem at the pin, so the corrected sentence names its actual prover.

## R06 (P3) — Layer 5 names a carrier, `ProfiniteCohomology.TopRep`, that the pin does not have

**Location.** `README.md:1003`: "`GalRep n F` is `ProfiniteCohomology.TopRep (ZMod n) G_F`". Against it, `:1051`: "`GalRep n F` is Mathlib's `TopRep`".

**Claim.** The two sentences disagree. The first is a backticked Lean expression whose head does not exist at the pins.

**Witness.**
- `TauCeti/NumberTheory/ClassFieldTheory/MuNRep.lean:130–131`: `abbrev GalRep … := TopRep.{u} (ZMod n) (Field.absoluteGaloisGroup F)`.
- `TopRep` itself is Mathlib's `structure TopRep` (`Mathlib/RepresentationTheory/Continuous/TopRep.lean:31`).

**Repair.** At `:1003`, write "`GalRep n F` is Mathlib's `TopRep (ZMod n) (Field.absoluteGaloisGroup F)`, the carrier of ProfiniteCohomology Layer 1".

**Test of repair.** `#check @TauCeti.ClassFieldTheory.GalRep` unfolds to Mathlib's `TopRep`, and both Layer 5 sentences then name it.

## Previous findings (review of `024927f`)

- **R01 (two owners with FunctionFieldArithmetic): repaired.** This README now says FunctionFieldArithmetic imports the comparisons rather than proving them (`:185–189`, `:1987–1991`). At #1474's head, FunctionFieldArithmetic does exactly that (`README.md:1119–1122`: "are consumed from ClassFieldTheory Layer 7 (`map_unitFiltration_normResidue` and `closure_map_artinMap_unitFiltration`)"). The proof at its `:1255` cites them too.
- **R02 (out-of-folder edit): not repaired.** Repeated as R02.
- **R03 (dropped names): repaired, with two residual gaps.** The table at `:252–269` maps 17 old names. Every right-hand name exists at the pin, and every "Difference" entry matches main's signature, except `sumLocalInv_eq_zero`. The gaps are R04.
- **R04 (smoothness warning): repaired.**
  - `:170–174` and `:1047–1060` now say smoothness contains discreteness, that the duality theorems carry a redundant `[DiscreteTopology A.V]`, and that the Euler-characteristic theorems do not.
  - This matches `SmoothDiscrete/Basic.lean:259–262`, `Local/Duality/Perfect.lean:242`, `:280` and `EulerCharacteristic/Theorem.lean:98`.
  - The new `𝔽₂((t))` example is correct; see the table.
- **R05 (integration order with #617 and #1411): not repaired.** Repeated as R03.
- **R06 (GlobalQuadraticForms consumers): repaired.** `:195–201` and `:1992–1993` now name the first inequality (Layer 10) and the quadratic Hasse norm theorem (Layer 13). GlobalQuadraticForms at this head consumes exactly these (`README.md:474`, `:498–505`, `:143–146`).
- **R07 (numbering): repaired.**
  - The conventions are C.1–C.7 and the worked examples W.1–W.8.
  - `grep '^### [25]\.1 '` matches only `:861` and `:994`.
  - `:244–247` give the old → new section numbering.
  - Dependency order is a `##` section.
  - The acceptance signatures are `### Headline acceptance signatures` under Exact supplier contracts.
- **R08 (Kummer degree): repaired.** `:1779–1791` fixes `S` as finite places and defines `r`. It notes that Milne counts infinite places in `S`, and adds the `ℚ(ζ₃)` Check; the values are recomputed in the table.

## Verified sound

**Gate, build and form.**
- The worker's gate (`scratch/gate.md`) has every check at 0 except `outside-folder=1`, and `build=0`. My own gate run reports the same file, plus the two folders the brief names as this pull request's own.
- `lake env lean TauCetiRoadmap/ClassFieldTheory/Suggested.lean` exits 0. Its only output is seven `sorry` warnings, at lines 78, 94, 124, 149, 165, 176 and 190.
- The file has no `set_option`, no `lemma`, no sorry'd data and no admitted `example`. It has one module docstring and a single `import Mathlib`, followed by eight `TauCeti.*` modules, each present at the pin.
- The README has no LaTeX and no process wording.

**Signatures.**
- I ran `#check @name` for all nine declarations in one scratch copy, and compared each elaborated type with its README statement. They agree.
- `localAbsoluteUpperRamificationGroup` and `galoisCharacterConductorExp` keep every binder their bodies use; the latter binds no valuation on `L`, which `normResidue` does not need. No section binder is lost, and I made no edit.

**One-tactic probe.** On a scratch copy I replaced every `sorry` with `first | (rfl; done) | (simp; done) | (infer_instance; done) | (decide; done) | (simp [galoisCharacterConductorExp, artinConductorExponent]; done) | exact localCyclotomicCharacter_artinMap_unit …`. Every alternative failed on all seven theorems. Run alone on `cyclotomicCharacter_artinMap`, the `exact` alternative fails with "failed to synthesize `ValuativeExtension ℚ_[p] F`". No declaration closes in one tactic. R01 is a duplication of a pinned theorem found by reading the pin, not by the probe.

**Dependency check:**

```text
depcheck: 238 roadmaps, 2320 edges, 0 problem(s)
```

- There is no UPWARD or CYCLE line.
- The suppliers are ProfiniteCohomology, LocalFieldsRamification, GlobalNumberFields, NumberFieldArithmetic and ProfiniteProPGroups, all on main.
- No supplier gap is declared, and there is no readable `design/plan.json`.

**Headline theorems.**
- The README's open headlines are:
  - the cyclotomic unit normalization without the compatibility hypothesis;
  - finite and absolute unit-filtration reciprocity;
  - the reciprocity-versus-Artin conductor comparison;
  - the principal ideal theorem;
  - the product and lcm halves of the conductor–discriminant formula.
- All are stated, none through a stand-in.
- The comparison is already at the pin up to the norm-kernel identity (R01).
- I checked that the others are absent at the pin:
  - only the class-formation principal ideal theorem exists (`Formation/PrincipalIdeal.lean:67`);
  - `Discriminant/FixedField.lean:109` is a double-coset formula, not the conductor product;
  - `Conductor/UpperNumbering.lean` has no image theorem.

**Pinned declarations opened** (paths relative to the library roots):

| File:line | Checked |
|---|---|
| `TauCeti/NumberTheory/ClassFieldTheory/Local/Conductor/UpperNumbering.lean:64`, `:121`, `:130` | the norm and upper-numbering criteria; `conductorExponent_fixedField_ker` for every `χ` into a `MulOneClass` (R01) |
| `…/Local/Conductor/Basic.lean:89`, `:184` | `conductorExponent` is `Nat.find` over `U(K,n) ≤ normGroup`; `characterConductorExp` is the `sInf` for `Kˣ →ₜ* ℂˣ` |
| `…/Local/Reciprocity.lean:181`, `:226` | `normResidue_mk_eq_one_iff`; `comap_normUnits_normGroup` |
| `…/Local/ArtinMap.lean:132` | `artinMap_restrict` through `ι.restrictNormalHom` |
| `TauCeti/FieldTheory/Galois/Restriction.lean:73` | `AlgHom.restrictNormalHom` (the `restrictAbsolute` row) |
| `…/Local/Duality/Perfect.lean:242`, `:280`; `…/Local/EulerCharacteristic/Theorem.lean:98`, `:110`; `…/FiniteCohomology/DegreeTwo.lean:97` | binders exactly as `:170–174`, `:1031–1036` |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:259` | `IsSmoothDiscrete` has the fields `discreteTopology` and `stabilizer_isOpen` |
| `…/ClassFieldTheory/MuNRep.lean:130`, `:150`, `:154`, `:165`, `:189`, `:211`, `:300`, `:358` | `GalRep` (R06) and the correspondence rows |
| `…/Brauer/RootsOfUnity.lean:156`; `…/Local/HilbertPairing.lean:61`; `…/Local/Symbol.lean:364` | `h2EquivZModOfMuNRepIso` takes `IsUnit (n : F)` and `e : muNRep n F ≅ T`; nondegeneracy in the second variable; `localSymbol_antisymm` |
| `…/Local/CohomologicalDimension/AbsoluteGaloisGroup.lean:104`; `…/Strict.lean:236` | both with `[CharZero K]` |
| `…/Global/Brauer/SumFormula.lean:135`, `:142`; `…/Global/InvariantSum.lean:145` | `brLocalization` and the sum formula on it (R04c) |
| `…/ClassFields/RingClass/Field.lean:178` | `ringClassArtinEquiv : Pic O ≃* Gal(ringClassField O/K)` |
| `…/Global/HasseNorm/Quadratic.lean:45` | the quadratic case as described at `:1827–1830`, with `¬ IsSquare d` and both kinds of place |
| `…/Global/IdeleClass/FirstInequality.lean:108`; `TauCeti/NumberTheory/QuadraticForm/Global/ProductFormula.lean:67` | the inequality; `hilbertSymbol_productFormula` derived from `hilbertProductFormula` |
| `TauCeti/FieldTheory/GaloisCohomology/MuTwo/LocalSymbol.lean:191`; `…/QuadraticForm/Global/CohomologicalSymbol.lean:72`, `:90`, `:112` | the comparisons of R05 |
| `TauCeti/RepresentationTheory/Homological/TateCohomology/NakayamaRim.lean:73`, `:117`; `…/PrimaryComponent.lean:58`, `:81` | the namespaces `Rep` and `TauCeti.TateCohomology` (R04b) |
| `…/Formation/ClassFormation.lean:96–112` | the fields `subsingleton_h1`, `inv_restrict`, `inv_infl`, `inv_conj` |
| `…/Formation/PrincipalIdeal.lean:67`; `TauCeti/NumberTheory/NumberField/Discriminant/FixedField.lean:109` | the class-formation principal ideal theorem; the double-coset discriminant formula |
| `Mathlib/RepresentationTheory/Continuous/TopRep.lean:31`; `Mathlib/NumberTheory/Padics/Hensel.lean:460`; `Mathlib/RingTheory/Valuation/Algebraic.lean:28`; `Mathlib/FieldTheory/Normal/Defs.lean:195` | `TopRep`; the two inputs of the cyclotomic route; `AlgEquiv.restrictNormalHom` |

I also resolved all 536 backticked Lean-like names of the README against the pinned Mathlib and Tau Ceti. The leftovers are namespace-qualified names, structure fields (checked above), roadmap names (ProfiniteCohomology's `cup_add_left`) and this roadmap's nine declarations.

**Cross-roadmap citations resolved.**
- ProfiniteCohomology Layers 0–12 (main `README.md:583–2091`).
- ProfiniteProPGroups Layer 0 (main `Completed/…/README.md:189`).
- GlobalNumberFields Layers 0–11 (`:241–571`).
- NumberFieldArithmetic Layer 2 and §§4.1, 4.2 (with localization at `:1147`), 5.9 and 5.10 (`:615`, `:1092`, `:1123`, `:1687`, `:1714`).
- FunctionFieldArithmetic §4.2 (#1474, `:1104`).
- GlobalQuadraticForms §§4.2–4.3 (this head, `:437`, `:492`).
- RamificationOfCompleteDiscretelyValuedFields (#1410, `:115–129`): it assigns the local-field absolute filtration to ClassFieldTheory Layer 7, so the object has one owner.
- FilteredLocalGaloisGroups (#1795, `:51–61`) consumes the filtration and does not define it.
- PadicPeriodRings (#940, `:118`) and LocalAnabelianGeometry (#1811, `:145`) consume the comparison.
- I swept main and the 468 open heads with `roadmaps grep` for the 90 names that this head drops from main's `Suggested.lean`. They are cited only in this pull request's own folders, in #1187's QuadraticFormInvariants (`muNRepCoeffDictionary_*`, mapped at `:258`), and at the two spots of R04.
- The overlap ids §2.5 and §2.6 (#1692, #1484) are covered by the numbering line at `:244`.

**Sources checked at their locators** (legal cache):

| Claim | Locator and result |
|---|---|
| C.4 Tate's theorem | milne-cft line 3911: II Theorem 3.11 |
| C.6 and W.3 uniformizer normalization | milne-cft line 4641: III Proposition 1.9 |
| C.5 and W.2 reciprocity, local tower | milne-cft lines 4822, 4844: III Theorem 3.1, Lemma 3.2 |
| W.5 cyclotomic Artin map, reciprocity law | milne-cft lines 7004, 7041: V Example 3.2, Theorem 3.5 |
| 13.1 principal ideal theorem | milne-cft line 7252: V Theorem 3.17 |
| 13.1 conductor–discriminant formula | milne-cft lines 7423–7430, 7436, 7443: V Theorem 3.27 (product of `f₀`, lcm of `f`), Remark 3.28, Example 3.30 |
| 10.1 inequalities and sum of invariants | milne-cft lines 9602, 9665, 9996, 10007, 10042, 10059, 10117, 10144, 10175: VII §4, Theorem 5.1, Proposition 7.2, Lemma 7.3, Theorem 8.1, Example 8.2, Lemmas 8.4–8.6 |
| 12.1 existence, Kummer case | milne-cft lines 10189, 10218–10271, 10279, 10287. Lemma 9.3 takes `S ⊇ S_∞`, so `[L:K] = p^s` with infinite places in `S`, and `(I_S : E) = p^{2s}` by the product formula. This is what `:1788` now says |
| 13.1 Hasse norm theorem, its noncyclic failure, quadratic case | milne-cft lines 10629–10644: VIII Theorem 3.1 and Remark 3.2 on printed p. 234 (the PDF page 244 header reads 235); 25 is the counterexample |
| 10.1 global `H²` | milne-cft lines 10937, 11011: VIII Theorems 4.2 and 4.7 |
| 5.1 duality, finiteness, Euler characteristic | milne-adt lines 1073, 1138, 1227, 1266, 1350: I Theorem 2.1 (printed p. 26), Corollary 2.3 (p. 28), Theorem 2.8 (p. 31), Lemmas 2.10 and 2.12. The order is prime to `char K`, matching `IsUnit (n : F)` |
| 7.1 absolute filtration | serre1961 lines 860–863, 931–938: n° 3.1 restricts to totally ramified extensions; Proposition 3 and the limit paragraph after it, printed p. 128 (line 924) |
| 13.1 ring class fields | kopp-lagarias lines 128, 160, 174: Theorems 1.1–1.3, pp. 3–4, for any order and any number field (arXiv v3) |

Subsections 0.1, 1.1, 2.1, 3.1, 4.1, 8.1, 9.1, 11.1 and 14.1 carry no source locator of their own. Each consumes Tau Ceti declarations, and the conventions they rely on are located in C.1–C.7, which I checked above.

**Adversarial pass.** Every row gives computed values.

| Statement | Instance | Values (each side; wrong model) | Result | Change |
|---|---|---|---|---|
| `cyclotomicCharacter_artinMap` | `F = ℚ₃`, `u = 4`, on `μ₉` | LHS exponent `4⁻¹ ≡ 7 (mod 9)` (4·7 = 28); RHS `N(4)⁻¹ ≡ 7`; the geometric model gives 4 | holds | none |
| same | `ℚ₂`, `u = −3`, mod 16 | `−3 ≡ 13`, `13⁻¹ ≡ 5` (13·5 = 65); both sides 5; dropping the inverse gives 13 | holds; `p = 2` separated | none |
| same | unramified quadratic `F/ℚ₃`, `u = 4` | `N(4) = 16 ≡ 7`, inverse `≡ 4 (mod 9)`; omitting the norm gives 7 | holds; norm needed | none |
| same, `_hu` | `F = ℚ₃`, `u = 3` | LHS in `ℤ₃ˣ`; RHS `1/3 ∉ ℤ₃ˣ` | hypothesis needed | none |
| same, route | `ℓ = 2`, `a = 4 ∈ 1 + 3ℤ₃`, `X² − 4` at 1; `v(1 − p)` | `\|1 − 4\|₃ = 1/3 < \|2\|₃² = 1`, root 2; `v(p) < 0` would force `v(1 − p) = v(p) ≠ 0` | steps valid; residue characteristic `≠ p` is impossible | none |
| `normResidue_map_unitFiltration` | `L = K` | both `⊥` | holds | none |
| same | `ℚ₂(i)`, `n = 1, 2` | `−1 ∉ N`, so `Art(U¹) = G`; `ψ(1) = 1`, `G¹ = G₁ = G`; `U² = 1 + 4ℤ₂ ⊆ N`, `ψ(2) = 3`, `G² = G₃ = 1` | holds | none |
| same | `ℚ₃(ζ₉)`, `n = 2` | `Art(U²) = 1`; `ψ(2) = 8`, `G² = G₈ = 1`; the lower `G₂` has order 3 | holds; lower model fails | none |
| same | unramified quadratic, `n = 0` | `Art(𝒪ˣ) = 1 = G⁰`; `Kˣ` in place of `U⁰` gives order 2 | holds | none |
| `localAbsoluteUpperRamificationGroup` | depth `−1`; `ℚ₂(ζ₈)`, depths 0–3 | every finite `G^{−1} = G`, so the infimum is `G_K`; images `{1,3,5,7}`, `{1,3,5,7}`, `{1,5}`, `{1}` | Check correct | none |
| same, wrong model | `X³ − 5` over `ℚ₅` | depth 0 image `C₃ ⊂ S₃`, trivial in `S₃^ab = C₂` | abelian-only model excluded | none |
| `closure_map_artinMap_unitFiltration_eq_upper` | `ℚ₃`, `n = 2`, projected to `ℚ₃(ζ₉)`; `𝔽₂((t))`, `n = 1, 2`, projected to `y² − y = t⁻¹` | `1 = G²`; `C₂ = G¹` and `1 = G²` | holds in both characteristics | none |
| `galoisCharacterConductorExp` | trivial `χ`; `ℚ₂(i)` character; junk `sInf ∅` | 0; 2; the set is nonempty because `N` is open | determined | none |
| `…_eq_artinConductorExponent` | `ℚ₃(ζ₉)`, six characters | reciprocity 0,1,2,2,2,2 = Artin 0,1,2,2,2,2 = `conductorExponent` of the fixed fields 0,1,2,2,2,2; lower model 0,1,3,3,3,3 | holds; equals the pinned theorem | R01 |
| `isPrincipal_map_hilbertClassField` | `ℚ`, `(2)`, `⊥`; `ℚ(√−5)`, `𝔭 = (2, 1+√−5)` | `H = ℚ`, `(0)`; `𝔭² = (2) = ((1+i))²` in `K(i)`, so `𝔭𝒪_H = (1+i)` | holds | none |
| `count_relDiscr_eq_finsum_…` | `L = K`; `ℚ(i)` at 2; `ℚ(ζ₈)` at 2; `ℚ(ζ₅)` at 5 | `0 = 0`; `2 = 0+2`; `8 = 0+2+3+3`; `3 = 0+1+1+1`; an lcm reading gives 3 and 1 | holds | none |
| `abelianConductor_eq_lcm` | `ℚ(ζ₈)`; `ℚ(√2)`; `K = ℚ(i)` | `3 = max(0,2,3,3)`, `∞` via `ℚ(i)`; `∞` on neither side; no real place, so vacuous | holds | none |
| 0.1 Nakayama–Rim Check | `C₂`: `ℤ[C₂]`, trivial `ℤ`; `⊕ 2ℤeᵢ` | `Ĥ⁰ = ℤ(1+g)/ℤ(1+g) = 0`; `Ĥ⁰ = ℤ/2`; free on `{2eᵢ}`, infinite rank | Checks correct | none |
| 1.1 | `S₃`, `V = 1`; `V = G` | `V·[G,G]‾ = A₃`, quotient `C₂`; degree 1, norm quotient 0 | holds | none |
| 2.1 | `C₄` layer; restriction to degree 2; inflation to degree 8 | `inv u = 1/4`; `2·1/4 = 1/2 = inv(cor res u) = inv(2u)`; `inf u = 2u′`, `2/8 = 1/4` | consistent | none |
| 3.1 | unramified cubic | `Frob ↦ [π]`; `2·Frob ↦ [π²]`, i.e. 2 mod 3 | holds | none |
| 4.1 | degree 2; Klein four | one nonzero value; three distinct nonzero values off the norms | discriminates | none |
| 5.1 `finite_H` | `𝔽₂((t))`, `ℤ/2`; `ℚ₂` | odd-pole classes independent in `F/℘F`, so `H¹` is infinite; `#ℚ₂ˣ/ℚ₂ˣ² = 8` | hypothesis needed | none |
| 5.1 Euler characteristic | `ℚ₂`: `𝔽₂`, `𝔽₃`, `0` | `8 = 2·2·2¹`; `3 = 3·1·2⁰` (`−3 ≡ 5 mod 8`, so `μ₃(ℚ₂) = 1`); `1 = 1·1·1` | holds | none |
| 5.1 smoothness note | `ZMod 3` over `𝔽₂((t))` through a discontinuous `G_F → {±1}` | stabilizer of 1 = kernel, index 2; if it were open, the character would vanish on some `∏_{i>N}` and on `⊕`, hence everywhere | discrete, not smooth: correct | none |
| 5.1 Tate dual Check | `ℚ₂`, `−1` unramified action on `ℤ/3` | `≅ μ₃` (Frobenius acts by `ζ ↦ ζ²`); `Hom(μ₃, μ₃)` trivial, `#H⁰ = 3` against 1 | correct | none |
| 6.1 | `ℚ₂(ζ₅)`, `π = 2`; `cd` | `ζ₅ ↦ ζ₅²` (geometric `ζ₅³`); `cd₂ G_{𝔽₂((t))} = 1` against 2 | holds | none |
| 7.1 conductors | `ℚ₂(ζ₁₂)`; `ℚ₂(√2)`; `ℚ₅(μ₅)` | `δ = 2·2 = 4 = 0+0+2+2`; units `≡ ±1 mod 8`, so `3 = δ`; `δ = 3`, sum 3, maximum 1 | holds | none |
| 8.1 | `ℚ₂`, `U¹·⟨2⟩` | `U⁰ = U¹`, so the group is `ℚ₂ˣ`; class field `ℚ₂`, conductor 0 | holds | none |
| 9.1 | `t = s²` in characteristic 2; unramified quadratic; `ℚ₂(i)` | no `ι`, index 1 ≠ 2; degree ×2, index 2; degree ×1, index 2 | binder needed | none |
| 10.1 | `(−1,−1)/ℚ`; `ℚ(√13,√17)` | `1/2 + 1/2 = 0`; `(17/13) = (4/13) = 1`, 2 unramified, local degrees ≤ 2, lcm `2 < 4` | holds | none |
| 11.1 | `ℚ(ζ₅)`, `(2)(3)` | `2·3 = 6 ≡ 1 mod 5` | holds | none |
| 12.1 Kummer degree | `ℚ(ζ₃)`, `p = 3`, `S = {(1−ζ₃)}` | `#U(S)/U(S)³ = 3·3 = 9`; local indices `81` and `1`; `81/9 = 9 = 3^{1+1}`; dropping `r` gives 3 | holds | none |
| 12.1 admissibility | `ℚ(i)`: `(4)`, `(4)∞` | `(ℤ/4)ˣ/±1 = 1`; `(ℤ/4)ˣ = C₂`, `Art(3) ≠ 1` | `(4)∞` needed | none |
| 12.1 meet formula | two `D₄`-fields over one `V₄`-field | fibre product of order 16, commutator subgroup `⟨(r², r²)⟩`, abelianization 8 against 4 | Check correct | none |
| 13.1 quadratic Hasse | `ℚ`, `d = −1`: `a = 5, 3`; `ℚ(√2)`, `a = d = −1` | `5 = 1+4`; `(−1,3)₃ = (−1/3) = −1`; `(−1, N(−1))₂ = 1` at `(√2)`, `−1` at both real places | infinite places needed | none |
| 13.1 ring class | `ℤ + 2ℤ[i]`; `ℚ(ζ₇+ζ₇⁻¹)` | `2/(1·2) = 1`; `(6/27)·7 = 14/9 < 2` | holds | none |
| 14.1 | `p = 3`, `q = 7` | `(7/3) = 1`, `(3/7) = −1`, `(−1)^{1·3} = −1` | holds | none |
| R04 name rows | `h2FpEquivZMod_of_mu`; `localSymbol_kummerClass_eq_zero_iff`; `sumLocalInv_eq_zero` | main: `ζ`, `Nonempty (μ_p ≅ T)`, `Nonempty` result; pin: `IsUnit (p : F)` holds in characteristic 0, `e`, data. Main: first variable; pin: second. Main: `x : Br K`; pin: `brLocalization K x` | two rows right, one wrong | R04 |
| R05 boundary | `(−1, 3)` over `ℚ₃` | norm-equation symbol −1; `localSymbol` 1 in `ZMod 2`; the comparison is `TauCeti.hilbertSymbol_eq_cohomological` | Tau Ceti proves it | R05 |

## Not verifiable

These texts are settled as uncertified or waived, so I did not request them:
- **neukirch-ant**: V Theorem 6.2 and VI §7.
- **serre-local-fields**: IV §§1–3 and IV §3 Proposition 14 (Herbrand is indirectly confirmed by serre1961 line 931); V §§3 and 6; VI §2; IX §8; XI–XIV; XIV §3; XV §2 Theorem 2 and Corollary 3 to Theorem 1.
- **artin-tate**: XIII; XIV §§1–6; XV.
- **nsw**: (7.1.8), (7.2.5), (7.2.6) and (7.3.1)–(7.3.4).

**Ownership against open pull requests.** I checked this with `roadmaps grep`, `roadmaps show` and `roadmaps overlaps` over the 468 open heads in the index of 2026-11-09. The index lists #1215 at `2ed7ba0`, one commit behind this head; that last commit changes only GlobalQuadraticForms, which I read in this worktree.

## Source issues

- **Misprint** in milne-cft at VII Theorem 9.5, printed p. 226: the source says every finite-index subgroup of `C_K` is a norm group; it should say every open subgroup of finite index, as the section's opening sentence (line 10185) does; affects nothing.
- **Gap** in milne-cft at V Theorem 3.27, printed p. 165: the source states the discriminant product formula without deducing it from the local statement; it should give the local deduction or a reference; affects the proof.
