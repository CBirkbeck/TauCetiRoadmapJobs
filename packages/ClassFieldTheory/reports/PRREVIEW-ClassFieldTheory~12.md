# Review of ClassFieldTheory (pull request #1215 at 024927f)

**Verdict:** needs changes

Eight findings: one P2 and seven P3. This is a full review of the head; the folder changed by 930 lines since `95ba181`. `Suggested.lean` elaborates against the pins with only the seven `sorry` warnings, and the dependency check is clean. The gate still fails on the out-of-folder LocalGaloisGroups edit (R02). The status of the previous review's findings is listed after the findings.

## R01 (P2) — Equal-characteristic unit-filtration reciprocity still has two owners (previous R02, partly repaired)

**Location.** `TauCetiRoadmap/ClassFieldTheory/README.md:183–186`: "The equal-characteristic finite and absolute filtration comparisons in FunctionFieldArithmetic §4.2 are specializations of Layer 7". Also `README.md:1913–1914`: "FunctionFieldArithmetic §4.2 uses the finite and absolute unit-filtration comparisons of Layer 7".

**Claim.** This README now draws the right boundary. ClassFieldTheory is on main, so it is the earlier owner. But FunctionFieldArithmetic, at its open head, still states and proves both comparisons itself, so the object still has two owners. The Downstream consumers sentence ("uses") is false against that head.

**Witness.** In #1474, `TauCetiRoadmap/FunctionFieldArithmetic/README.md:1116–1121` states `Art_{L/K}(U_K^(r)) = Gal(L/K)^r` for every finite abelian `L/K`, and the same for abelian algebraic `E/K`. Lines 1140–1150 prove it by Lubin–Tate. Lines 284–286 say "§§4.1–4.2 prove the ramification comparison".

**Repair.**
1. Keep `README.md:183–186` as written.
2. In #1474, replace lines 1116–1121 and the proof at 1140–1150 with a citation of ClassFieldTheory Layer 7, `normResidue_map_unitFiltration` and `closure_map_artinMap_unitFiltration_eq_upper`. Keep the Lubin–Tate torsion clause of `lubinTate_artin`, and correct its supplier paragraph at 284–286.
3. Name #1474 and this coordination in this pull request's description.

**Test of repair.** Take `y² − y = t⁻¹` over `𝔽₂((t))`. Both passages give `Art(U¹) = C₂ = G¹` and `Art(U²) = 1 = G²`, so the conductor is `2`. After the repair, one cited theorem supplies both uses, including this wild case.

## R02 (P3) — Gate `outside-folder`: `Completed/LocalGaloisGroups/Suggested.lean` (previous R08, not repaired; repair corrected)

**Location.** `Completed/LocalGaloisGroups/Suggested.lean` (62 additions, 50 deletions). For example, line 342 is `= TauCeti.ClassFieldTheory.artinMap F u) :` and line 345 is `ClassFieldTheory.cyclotomicCharacter_artinMap p F u hu σ hσ`.

**Claim.** The pull request edits a folder that is not one of its declared folders, so the gate fails. The previous repair, landing the migration separately first, cannot work: the migrated file does not typecheck against main.

**Witness.** `gate.md` reports `outside-folder=1 … Completed/LocalGaloisGroups/Suggested.lean`. On main, `cyclotomicCharacter_artinMap` takes `hσ` against main's own `artinMap`, which is `sorry` (`TauCetiRoadmap/ClassFieldTheory/Suggested.lean:1925` on main). The migrated `hσ` uses Tau Ceti's `artinMap`.

**Repair.**
1. Keep the edit.
2. Name `Completed/LocalGaloisGroups` in the description as one of this pull request's folders, as GlobalQuadraticForms and QuadraticFormInvariants already are, so that the board records it.
3. Migrate that folder's `README.md` in the same change (R03).

**Test of repair.** Once the folder is recorded, `git diff --stat origin/main...HEAD` restricted to everything outside the four declared folders is empty, and the gate reports `outside-folder=0`.

## R03 (P3) — Names this pull request drops are still cited by roadmaps on main, with no old → new map

**Location.** `README.md:152–169` lists the Tau Ceti names that LocalGaloisGroups now uses. Nowhere does the README map main's ClassFieldTheory names to them. Of the 445 declarations in main's `Suggested.lean`, this head drops 444, and 101 of those have no Tau Ceti declaration of the same name.

**Claim.** Citations on main break at merge.

**Witness.** On main: `Completed/LocalGaloisGroups/README.md:175–194` (`kummerEquiv_mixed`, `h2FpEquivZMod_of_mu`, `cyclotomicCharacter_artinMap_padic`, `scd_p_absoluteGaloisGroup_eq_two`); `ProfiniteCohomology/README.md:2060`; `IntegralLattices/README.md:479`, `:1044` (`gal_ringClassField_equiv_pic`); `ClassicalArithmeticCompletion/README.md:169`.

**Repair.** In Scope and ownership, add one old → new line per cited name:
- `kummerEquiv_mixed` → `kummerEquivOfCharZero`;
- `h2FpEquivZMod_of_mu` → `h2EquivZModOfMuNRepIso`;
- `cyclotomicCharacter_artinMap_padic` and `…_padic_uniformizer` → `localCyclotomicCharacter_artinMap_padic` and `…_padic_uniformizer`;
- `scd_p_absoluteGaloisGroup_eq_two` → `strictCohomologicalDimensionAt_absoluteGaloisGroup_eq_two`;
- `gal_ringClassField_equiv_pic` → `ringClassArtinEquiv`;
- `localSymbol_kummerClass_eq_zero_iff` → `forall_localSymbol_kummerClass_eq_zero_iff`;
- `restrictAbsolute` → the restriction inside `artinMap_restrict`.

Then update `Completed/LocalGaloisGroups/README.md` in this pull request (R02).

**Test of repair.** Every right-hand name exists at the pinned Tau Ceti. For example, `strictCohomologicalDimensionAt_absoluteGaloisGroup_eq_two` is at `NumberTheory/ClassFieldTheory/Local/CohomologicalDimension/Strict.lean:236`, and `ringClassArtinEquiv` is in `ClassFields/RingClass/Field.lean`. Open roadmaps citing the old names, FilteredLocalGaloisGroups (`README.md:183`) and LocalAnabelianGeometry (`README.md:143`), can follow the same lines.

## R04 (P3) — The smoothness warning contradicts Tau Ceti's definition

**Location.** `README.md:997–1000`: "Every duality and Euler-characteristic statement here carries `[DiscreteTopology A.V]` and … `[Fact (IsSmoothDiscrete (ZMod n) A)]`, every point stabilizer open. Neither follows from the other". The same reading appears at `:170–172`.

**Claim.**
- Smoothness implies discreteness by definition.
- The Euler-characteristic theorems carry no `DiscreteTopology` binder.
- Only the converse direction, from discreteness to smoothness, fails.

**Witness.**
- `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:259–262`: `IsSmoothDiscrete` has the field `discreteTopology : DiscreteTopology X.V`.
- `NumberTheory/ClassFieldTheory/Local/EulerCharacteristic/Theorem.lean:98–99`: `eulerCharacteristic_mixed` binds only `hA : Finite A.V` and the smoothness `Fact`.

**Repair.** Restate the warning in three points:
- `IsSmoothDiscrete` is discreteness together with open point stabilizers, so smoothness gives discreteness.
- The duality theorems also carry a redundant `[DiscreteTopology A.V]`; the Euler-characteristic theorems do not.
- Discreteness does not give smoothness. Keep the indiscrete example, and add this one: over `𝔽₂((t))`, the discrete module `ℤ/3` on which `G_K` acts through a discontinuous character onto `{±1}`.

**Test of repair.** In that example, the stabilizer of `1` is the kernel of the character, which is not open. So the module is discrete but not smooth, and the corrected sentence is the true direction.

## R05 (P3) — No stated order with #617 and #1411, and the README cites names that only #1411 defines (previous R05, not repaired)

**Location.** `README.md:1259–1262`: "The finite-level interface map_unitFiltration_normResidue corresponds to `normResidue_map_unitFiltration`; the absolute interface closure_map_artinMap_unitFiltration corresponds to …". Also the pull-request description.

**Claim.**
- #617 and #1411 both change this folder and conflict with this head.
- The description names neither pull request and states no order.
- The two unbackticked names exist only at #1411's head, so this sentence cites a revision that the description does not name.

**Witness.** `overlaps.md`: "#617 and #1215 conflict in … `TauCetiRoadmap/ClassFieldTheory/README.md`, `…/Suggested.lean`" and "#1215 and #1411 conflict …". Main's ClassFieldTheory README and `Suggested.lean` contain neither name (0 occurrences).

**Repair.**
1. In the description, say which of #1215, #1411 and #617 is rebased on which, or which is withdrawn.
2. If #1411 is withdrawn, delete `README.md:1259–1262`.
3. Otherwise, keep those lines as the old → new map, because LocalAnabelianGeometry (`README.md:146`) cites #1411's `map_unitFiltration_normResidue`, and name #1411 in the description.

**Test of repair.** At `ℚ₃(ζ₉)` with `n = 2`, both names denote the same statement, `Art(U²) = G² = 1`. Once the order is stated and the alias matches it, the overlap check has nothing unexplained to report.

## R06 (P3) — The GlobalQuadraticForms consumer description is stale against this pull request's own GlobalQuadraticForms

**Location.** `README.md:192–196` and `:1915–1916`: "GlobalQuadraticForms Layers 3.3, 4.2–4.4 and 5.1 consume … `card_ideleClassNormQuotient` …, `cyclicHasseNorm` … and `hilbertProductFormula`".

**Claim.** At this head, GlobalQuadraticForms has no Layer 3 and no §4.4, and it consumes none of the four named declarations. The overlap check also reports that #1200 drops GlobalQuadraticForms Layer 3.

**Witness.** At this head, `TauCetiRoadmap/GlobalQuadraticForms/README.md` starts at Layer 4 (`:331`), with §§4.1–4.3 only; lines 138–139 consume `finrank_le_index_range_ideleClassNormMap` and `exists_sq_sub_mul_sq_iff_forall_completion`. #1200's head has the same sections.

**Repair.** Rewrite both passages: GlobalQuadraticForms §§4.2–4.3 consume Tau Ceti's first inequality `finrank_le_index_range_ideleClassNormMap` (Layer 10) and the quadratic Hasse norm theorem `exists_sq_sub_mul_sq_iff_forall_completion` (Layer 13).

**Test of repair.** Both declarations exist at the pin: `Global/IdeleClass/FirstInequality.lean:108` and `Global/HasseNorm/Quadratic.lean:45`. Both sections exist at this head and at #1200's head.

## R07 (P3) — Conventions and Worked examples keep stale section numbers that collide with Layers 2 and 5 (previous R07, partly repaired)

**Location.**
- `README.md:239` "### 2.1 Formations" against `:811` "### 2.1 Mathematical interface".
- `:1935` "### 5.1 Trivial layer" against `:944` "### 5.1 Mathematical interface".
- References to these numbers at `:122`, `:479`, `:814`, `:854`, `:1056` and `:1890`.
- "### Acceptance signatures" (`:2103`) and "### Dependency order" (`:2127`) sit under "## Worked examples".

**Claim.** §2.1 and §5.1 each name two subsections, while §k.n otherwise means Layer k.

**Witness.** The seeded targets "2.1 Mathematical interface" and "5.1 Mathematical interface" are the Layer subsections. Other roadmaps cite the Conventions numbers: EndoscopicTransferAndUnitaryTraceComparison (`README.md:90`) cites §2.4, and EllipticCurveModularityWild3Adic (`README.md:77`) cites §2.6.

**Repair.**
1. Number the worked examples W.1–W.8 and the conventions C.1–C.7.
2. Update the six internal references.
3. Add old → new lines "§2.4 → Conventions C.4" and "§2.6 → Conventions C.6" for the two external citers.
4. Promote Acceptance signatures and Dependency order to `##` sections before References.

**Test of repair.** Afterwards, `grep '^### [25]\.1 '` matches only the two Layer subsections, and every § reference resolves to exactly one heading.

## R08 (P3) — Layer 12's Kummer-case degree uses an undefined `r` and does not say which places `S` contains

**Location.** `README.md:1722–1725`: "the idele subgroup `E_S` attached to a finite set `S` of places … the layer cutting out `K(U(S)^{1/p})`, abelian of degree `p^{|S|+r}`".

**Claim.** `r` is defined nowhere. If `S` contains the infinite places, as in the cited Milne VII Lemma 9.3, the degree is `p^{|S|}`.

**Witness.** Take `K = ℚ(ζ₃)`, `p = 3` and `S = {∞, (1 − ζ₃)}`. Then `U(S) = μ₆ × ⟨1 − ζ₃⟩` and `U(S)/U(S)³` has order 9, so `[L : K] = 9 = 3^{|S|}`. This matches milne-cft lines 10221 and 10255. Tau Ceti's `GlobalExistence/Kummer.lean:109` uses finite `S`.

**Repair.** Write "for a finite set `S` of finite places, containing those above `p`, … abelian of degree `p^{|S|+r}`, where `r` is the number of infinite places of `K`", which is Tau Ceti's convention, and use the same `S` in the index count.

**Test of repair.** With `S = {(1 − ζ₃)}` and `r = 1`, the formula gives `3^{1+1} = 9`, which is the degree computed above.

## Previous findings (review of `95ba181`)

- **R01 (finiteness needs invertibility): repaired.** `README.md:79–83` now reads "with `(n : F) ≠ 0` … The mixed-characteristic specialization assumes characteristic zero". `:981–986` cites `tateDualityPairing_perfect` with `IsUnit (n : F)`, and `:1005–1009` adds the `𝔽₂((t))` negative control. These match the pin: `FiniteCohomology/DegreeTwo.lean:97` and `Local/Duality/Perfect.lean:242` and `:280`.
- **R02 (two owners with FunctionFieldArithmetic): partly repaired.** The boundary at `:183–186` is now right, but #1474 still restates and proves the comparison. Repeated as R01.
- **R03 (state the conductor comparison): repaired.** `Suggested.lean:149–156` states `galoisCharacterConductorExp_eq_artinConductorExponent`. The sum and maximum statements are deleted from the Lean file and kept as README consequences (`:1179–1186`).
- **R04 (upper-versus-lower numbering Check): repaired.** `README.md:1276–1284` adds `ℚ₃(ζ₉)`: lower group orders `6,3,3,1`, conductor sum 9 against 13, and different exponent 9.
- **R05 (integration order): not repaired.** The description still names neither #617 nor #1411. Repeated as R05.
- **R06 (locators): repaired.**
  - Conventions §§2.1–2.7 now have locators at `:241`, `:271`, `:311`, `:344`, `:412`, `:461` and `:484`, and worked examples §§5.1–5.8 at `:1937`–`:2084`.
  - The cyclotomic route names `hensels_lemma` and `Valuation.exists_map_pow_eq_map_algebraMap_of_isAlgebraic` (`:1130–1139`).
  - NumberFieldArithmetic §§5.9–5.10 is cited at `:612–614` and `:1811`, and ProfiniteProPGroups Layer 0 at `:134`.
- **R07 (README shape): partly repaired.**
  - Repaired: the top-level headings now follow the house shape; "Frozen public interface" and the stable-name sentence are gone; the open targets have their own *Needs:* lines; every layer ends with Examples and Dependencies; and "four errors" lists four (`:1923–1930`).
  - Remaining: the numbering collision, repeated as R07.
- **R08 (out-of-folder edit): not repaired.** Repeated as R02, with the repair corrected: the migration cannot land before this pull request.

## Verified sound

**Gate, build and form.**
- The worker's gate has every check at 0 except `outside-folder=1`, and `build=0`.
- `lake env lean TauCetiRoadmap/ClassFieldTheory/Suggested.lean` exits 0 with exactly seven `sorry` warnings, at lines 78, 94, 124, 149, 165, 176 and 190.
- The file has no `set_option`, no sorry'd data and no admitted example. It has one module docstring and a single `import Mathlib`, followed by eight individual Tau Ceti modules, each present at the pin.

**Signatures.** I ran `#check @name` for all nine declarations in a scratch copy. Every elaborated type matches the README statement. `localAbsoluteUpperRamificationGroup` and `galoisCharacterConductorExp` keep all the binders their bodies need. `galoisCharacterConductorExp` binds no valuation on `L`, by design, because `normResidue` needs none. No section binder is lost. I made no edit.

**One-tactic probe.** I tried `rfl`, `simp`, `infer_instance` and `simp [galoisCharacterConductorExp, artinConductorExponent]` on every theorem, and `exact localCyclotomicCharacter_artinMap_unit …` on `cyclotomicCharacter_artinMap`. All failed; the last fails to synthesize `ValuativeExtension ℚ_[p] F`. Nothing is padding.

**Dependency check:**

```text
depcheck: 238 roadmaps, 2323 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. ClassFieldTheory is on main. Its suppliers are ProfiniteCohomology, LocalFieldsRamification, GlobalNumberFields, NumberFieldArithmetic and ProfiniteProPGroups, all on main. RamificationOfCompleteDiscretelyValuedFields is named only as a boundary and supplies nothing. No supplier gap is declared.

**Headline theorems.** The README's open headlines are:
- the cyclotomic normalization without the valuation-compatibility hypothesis;
- finite and absolute unit-filtration reciprocity;
- the comparison of the reciprocity conductor with the Artin conductor;
- the principal ideal theorem;
- the product and lcm halves of the global conductor–discriminant formula.

All of them are stated in `Suggested.lean`; none is forced through a stand-in. The headlines that Tau Ceti already proves are listed by name in the module docstring and are not restated. I checked that the open ones are absent at the pin. The pin has only the class-formation principal ideal theorem (`Formation/PrincipalIdeal.lean:67`) and a fixed-field discriminant formula (`NumberField/Discriminant/FixedField.lean:109`). It has no unit-filtration image theorem: the only theorems in `Local/Conductor/UpperNumbering.lean` are the norm-group criteria at `:64`, `:121` and `:130`.

**Pinned declarations opened** (42; paths relative to the library roots):

| File:line | Checked |
|---|---|
| `TauCeti/NumberTheory/ClassFieldTheory/FiniteCohomology/DegreeTwo.lean:97` | `finite_H` takes `(n : F) ≠ 0`, smoothness as an explicit argument, `[Finite A.V]` and `i ≤ 2` |
| `…/ClassFieldTheory/Local/Duality/Perfect.lean:242`, `:280` | the `IsUnit (n : F)` form; the mixed form needs `[CharZero F]` and `n ≠ 0` |
| `…/ClassFieldTheory/Local/EulerCharacteristic/Theorem.lean:98`, `:110` | no `DiscreteTopology` binder (R04) |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:259` | the field `discreteTopology` (R04) |
| `TauCeti/NumberTheory/LocalField/Herbrand/Basic.lean:411`, `:421` | Serre numbering: `φ(m) = (#G₁+…+#G_m)/#G₀`, `G^v = G_{ψ(v)}` |
| `…/LocalField/Herbrand/ArtinConductor.lean:69`, `:83` | `artinConductorExponent` is the `sInf` of `n` with `G^n ≤ ker χ`, with its `≤`-criterion |
| `…/LocalField/UnitFiltration/Basic.lean:104` | `U(K,0) = 𝒪ˣ`, `U(K,i) = 1 + 𝔪^i` |
| `…/ClassFieldTheory/Local/Conductor/UpperNumbering.lean:64`, `:121`, `:130` | the three criteria, with no characteristic hypothesis |
| `…/ClassFieldTheory/Local/Conductor/Basic.lean:89`, `:184` | `conductorExponent`; `characterConductorExp` for `Kˣ →ₜ* ℂˣ` |
| `…/ClassFieldTheory/Local/Reciprocity.lean:162` | `normResidue : Kˣ ⧸ normGroup K L ≃* Abelianization Gal(L/K)` |
| `…/Local/ExplicitCyclotomicSymbol/ArtinMap.lean:311` | the native unit theorem needs `[ValuativeExtension ℚ_[p] F]` |
| `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Cyclotomic/Character.lean:33` | `localCyclotomicCharacter` is Mathlib's `cyclotomicCharacter (AlgebraicClosure K) p` composed with the action |
| `…/ClassFieldTheory/Formation/PrincipalIdeal.lean:67` | the class-formation principal ideal theorem |
| `…/LocalField/Discriminant/Conductor.lean:58` | the local sum `Σ f(χ) = δ` |
| `…/LocalField/Herbrand/UpperQuotient.lean:98` | Herbrand's theorem on quotients |
| `…/LocalField/FiniteExtension/IntermediateField.lean:81` | the valued-extension instance on finite intermediate fields |
| `TauCeti/RingTheory/DedekindDomain/Discriminant/Basic.lean:33` | `relDiscr` |
| `…/Global/AdmissibleModulus/Basic.lean:193`; `…/ClassFields/RayClassField.lean:241` | `abelianConductor`; `hilbertClassField` |
| `…/GlobalExistence/Kummer.lean:109` | `p ^ (S.card + #InfinitePlace K)` (R08) |
| `…/LocalExistence/ArtinMap.lean:113` | `injective_artinMap` assumes `[CharZero K]` |
| `…/WeilGroup/ArtinMap.lean:111`, `:145`, `:154`, `:163` | not surjective; the Weil map is continuous, surjective and open |
| `…/Local/CohomologicalDimension/Strict.lean:224`, `:236` | `scd = 2`, assuming `[CharZero K]` or `ℓ` a unit |
| `…/Global/IdeleClass/FirstInequality.lean:108`; `…/Global/HasseNorm/Quadratic.lean:45`, `Basic.lean:154`, `:170`; `…/Global/Reciprocity.lean:248`; `…/Global/Hilbert/Reciprocity.lean:65` | exist (R06) |
| `Mathlib/NumberTheory/Padics/Hensel.lean:460`; `Mathlib/RingTheory/Valuation/Algebraic.lean:28` | the two Mathlib inputs of the cyclotomic route say what the route uses |

**Cross-roadmap citations resolved.**
- ProfiniteCohomology Layers 0–12, with Layer 4 the colimit (main `README.md:583–2091`).
- ProfiniteProPGroups Layer 0, closed quotients, closed subgroups and inverse limits (`Completed/…/README.md:189–242`).
- GlobalNumberFields Layers 4–11 (`Completed/…/README.md:418–571`).
- NumberFieldArithmetic Layer 2 and §§4.1, 4.2, 5.9, 5.10 (`Completed/…/README.md:615`, `1092`, `1123`, `1687`, `1714`).
- RamificationOfCompleteDiscretelyValuedFields (#1410), Scope: it assigns the local-field absolute filtration to ClassFieldTheory Layer 7 and proves the agreement in §4a.1. The ownership is consistent.
- ArtinRepresentations (#1711, `README.md:151–156`) consumes the abelian conductor–discriminant formula from Layer 13. It owns only the nonabelian formula, assembled from ArithmeticGaloisRepresentations §3.5, so there is no second owner.
- FilteredLocalGaloisGroups (#1795), LocalAnabelianGeometry (#1811), PadicPeriodRings (#940), HigherLocalClassFieldTheory (#1813) and QuadraticFormInvariants (this head, `README.md:71–74` and `306–315`) consume rather than own.

I searched for ownership by object with `roadmaps grep` and `roadmaps show` over the 468 open heads and main.

**Sources checked at their locators** (legal cache):

| Claim | Locator and result |
|---|---|
| Tate's theorem, §2.4 | milne-cft line 3911: II Theorem 3.11, p. 84; restriction generates, line 3919 |
| Frobenius, §§2.6, 5.3 | milne-cft line 4641: III Proposition 1.9, p. 102 |
| Reciprocity, local tower and `H²` lemmas | milne-cft lines 4822, 4844, 4716–4751: III Theorem 3.1 and Lemma 3.2, p. 107; Lemmas 2.3–2.6 |
| Global cyclotomic Artin map, reciprocity | milne-cft lines 7004 and 7041: V Example 3.2, p. 157; Theorem 3.5, p. 158 |
| Principal ideal theorem | milne-cft line 7252: V Theorem 3.17, p. 161 |
| Conductor–discriminant formula | milne-cft lines 7423, 7436, 7443: V Theorem 3.27, Remark 3.28, Example 3.30, p. 165; product of `f₀(χ)` and lcm of `f(χ)` |
| First and second inequality | milne-cft line 9602 (VII §4, p. 211) and line 9665 (Theorem 5.1(c), p. 212) |
| Sum of invariants | milne-cft lines 9996, 10007, 10042, 10059, 10117, 10144, 10175: VII Proposition 7.2, Lemma 7.3, Theorem 8.1(b), Example 8.2, Lemmas 8.4–8.6, pp. 220–223 |
| Existence | milne-cft lines 10189, 10218, 10279, 10287: VII Lemmas 9.1, 9.3, 9.4 and Theorem 9.5, pp. 223–226 |
| Hasse norm theorem and its noncyclic failure | milne-cft lines 10629, 10642: VIII Theorem 3.1, Remark 3.2, p. 234 |
| Global `H²` cyclic of order `[L:K]` | milne-cft line 11011: VIII Theorem 4.7, p. 242 |
| Absolute upper filtration | serre1961 lines 931–938: n° 3.1, Proposition 3 and the paragraph after it, p. 128, for totally ramified extensions (line 863). Also milne-cft lines 2410–2419 (I §4, p. 46), which cite Serre IV §3 Proposition 14 for Herbrand's theorem |
| Local duality, finiteness, Euler characteristic | milne-adt lines 1073, 1138, 1227: I Theorem 2.1 (pp. 26–27), Corollary 2.3 (p. 28), Theorem 2.8 (p. 31); order prime to `char K` |
| Ring class fields of arbitrary orders | kopp-lagarias lines 128, 160, 174: Theorems 1.1–1.3, pp. 3–4 |

**Adversarial pass.** Every row gives computed values.

| Statement | Instance | Values (each side; wrong model) | Result | Change |
|---|---|---|---|---|
| `cyclotomicCharacter_artinMap` | `ℚ₃`, `u = 4` | `χ(Art 4)` acts on `μ₉` by 7; `N(4)⁻¹ = 4⁻¹ ≡ 7 mod 9`; the geometric model gives 4 | holds | none |
| same | `ℚ₂`, `u = −3`, mod 16 | `u ≡ 13`, `u⁻¹ ≡ 5` (13·5 = 65); both sides 5; no inverse gives 13 | holds; `p = 2` separated | none |
| same | unramified quadratic `F/ℚ₃`, `u = 4` | `N(u) = 16 ≡ 7`, inverse `≡ 4 mod 9`; omitting the norm gives 7 | holds | none |
| same, `_hu` | `ℚ₂(i)`, `x = 1 + i` | `v(x) = 1`; `N(x)⁻¹ = 1/2 ∉ ℤ₂ˣ`, while `χ ∈ ℤ₂ˣ` | hypothesis needed | none |
| same, compatibility route | `ℚ₂(i)`: `v(2)`, `v(1−2)`; Hensel at `p = 3`, `ℓ = 2`, `a = 4` | `v(2) = 2 > 0`, `v(−1) = 0`; `\|1−4\|₃ = 1/3 < \|2\|₃² = 1`, root 2 | step sound | none |
| `normResidue_map_unitFiltration` | `L = K` | both sides `⊥` | holds | none |
| same | `ℚ₂(i)`, `n = 1, 2` | `Art(U¹) = G` (`−1 ∉ N`), `G¹ = G`; `Art(U²) = 1`, `G² = G₃ = 1` | holds | none |
| same | `ℚ₂(√2)`, `n = 2, 3` | units in `N` are `±1 mod 8`: `Art(U²) = G = G²`, `Art(U³) = 1 = G³`; `G^{n−1}` gives conductor 2 | holds | none |
| same | `ℚ₃(ζ₉)`, `n = 1, 2` | `Art(U¹) = {a ≡ 1 mod 3}`, order 3, `= G¹ = G₂`; `Art(U²) = 1 = G²`; lower `G₂` has order 3 | holds; lower model fails | none |
| same | unramified of degree 2, `n = 0` | `Art(U⁰) = 1 = G⁰`; `Kˣ` in place of `U⁰` gives order 2 | holds | none |
| same | `𝔽₂((t))`, `y² − y = t⁻¹` | `Art(U¹) = C₂ = G¹`, `Art(U²) = 1 = G²` | holds | R01 |
| same, abelian hypothesis | `X³ − 5` over `ℚ₅` (`S₃`), `n = 0` | in `G^ab = C₂`: units ↦ 1, `G⁰ = C₃` ↦ 1 | would hold without it; follows the sources | none |
| `localAbsoluteUpperRamificationGroup` | depth `−1` | every finite `G^{−1} = G`, so the infimum is `G_K` | holds | none |
| same | `ℚ₂(ζ₈)`, depths 0–3 | `{1,3,5,7}`, `{1,3,5,7}`, `{1,5}`, `{1}` from `Art(1+2ⁿℤ₂)` acting by `u⁻¹` | Check correct | none |
| same, wrong models | tame `S₃`; `ℚ₃(ζ₉)` at depth 2 | `C₃` dies in `S₃^ab`; upper image 1 against lower order 3 | both excluded by Checks | none |
| `closure_map_artinMap_unitFiltration_eq_upper` | `ℚ₃(ζ₉)`, `n = 2`; `𝔽₂((t))`, `n = 1` | projects to `1 = G²`; projects to `C₂ = G¹` | holds in both characteristics | none |
| `galoisCharacterConductorExp` | trivial `χ`; `ℚ₂(i)`; junk `sInf ∅` | 0; 2 (`U¹ ⊄ N ⊇ U²`); the norm group is open, so the set is nonempty | determined | none |
| `…_eq_artinConductorExponent` | `ℚ₃(ζ₉)`, six characters | reciprocity 0,1,2,2,2,2 = Artin 0,1,2,2,2,2; lower model 0,1,3,3,3,3 | holds | none |
| same | `ℚ₂(√2)`; `ℚ₅(μ₅)` | 3 = 3; 1 = 1 | holds | none |
| local sum consequence | `ℚ₂(ζ₁₂)`; `ℚ₃(ζ₉)` | `δ = f·d = 4 = 0+0+2+2`; `Φ₉′(ζ) = 9ζ⁸/(ζ³−1)` gives `12 − 3 = 9 = 0+1+2·4` | holds | none |
| `isPrincipal_map_hilbertClassField` | `ℚ`, `(2)`; `I = ⊥, ⊤` | `H = ℚ`, principal; `(0)`, `(1)` | holds | none |
| same | `ℚ(√−5)`, `𝔭 = (2, 1+√−5)` | `𝔭² = (2) = ((1+i)²)` in `K(i)`, so `𝔭𝒪_H = (1+i)` | holds | none |
| `count_relDiscr_eq_finsum_…` | `L = K`; `ℚ(i)` at 2 | `0 = 0`; `2 = 0 + 2` | holds | none |
| same | `ℚ(ζ₈)` at 2; `ℚ(ζ₅)` at 5 | `8 = 0+2+3+3`; `3 = 0+1+1+1`; an lcm reading gives 3 and 1 | holds | none |
| `abelianConductor_eq_lcm` | `ℚ(ζ₈)`; `ℚ(√2)`; `ℚ(i)` as base | `3 = max`, `∞` via `ℚ(i)`; `∞` in neither side; no real places, vacuous | holds | none |
| 0.1 Nakayama–Rim | `C₂`: `ℤ[C₂]`, trivial `ℤ` | `Ĥ⁰ = 0`; `Ĥ⁰ = ℤ/2` | Check correct | none |
| 1.1 maximal abelian layer | `S₃`, `V = 1` | `V·[G,G]‾ = A₃`, quotient `C₂ = G^ab` | holds | none |
| 2.1 fundamental classes | `C₄` layer | `inv u = 1/4`; restriction `1/2`; inflation to degree 8 gives `2u′`, `2/8 = 1/4` | holds | none |
| 3.1 Tate isomorphism | unramified cubic | `Frob ↦ class(π)`; `2·Frob ↦ class(π²)`, i.e. `2 mod 3` | holds | none |
| 4.1 quadratic test | degree 2; Klein four | one nonzero value; three values | discriminates | none |
| 5.1 `finite_H` hypothesis | `𝔽₂((t))`, `ℤ/2`; `ℚ₂` | `t⁻¹, t⁻³, …` independent, so `H¹` is infinite; `#H¹ = 8` | hypothesis needed | none |
| 5.1 Euler characteristic | `ℚ₂`: `𝔽₂`, `𝔽₃`, `0` | `8 = 2·2·2`; `3 = 3·1·1`; `1 = 1·1·1` | holds | none |
| 5.1 smoothness note | `IsSmoothDiscrete` fields | discreteness is a field, so smooth implies discrete | false as written | R04 |
| 6.1 | unramified quadratic over `ℚ₃`; `cd` | `Art(4) = 1`, `3 ↦ Frob` of order 2; `cd_ℓ G_{ℚ₂} = 2`, `cd₂ G_{𝔽₂((t))} = 1` | holds | none |
| 8.1 conductor | `ℚ₂`, `U¹·⟨2⟩` | `U⁰ = U¹`, so the group is `ℚ₂ˣ`, the class field is `ℚ₂`, conductor 0 | holds | none |
| 9.1 Weil transfer | `t = s²` in characteristic 2; unramified quadratic; `ℚ₂(i)` | index 1 ≠ 2, no `ι`; degree ×2, index 2; degree ×1, index 2 | binder needed | none |
| 10.1 | `(−1,−1)/ℚ`; `ℚ(√13,√17)` | `1/2 + 1/2 = 0`; `17 ≡ 2² mod 13`, `13 ≡ 8² mod 17`, so local degrees ≤ 2 and lcm 2 < 4 | holds | none |
| 11.1 | `ℚ(ζ₅)`, `(2)(3)` | exponents 2·3 = 6 ≡ 1 mod 5 | holds | none |
| 12.1 admissibility | `ℚ(i)`: moduli 1, `(4)`, `(4)∞` | ray groups 1, 1, `C₂`; `Art(3) ≠ 1` | `(4)∞` needed | none |
| 12.1 Kummer degree | `ℚ(ζ₃)`, `p = 3` | `[L:K] = 9 = 3^{\|S\|}` with `∞ ∈ S`; the README reads `3^{\|S\|+r}` | ambiguous | R08 |
| 13.1 ring class fields | `ℤ + 2ℤ[i]`; `ℚ(ζ₇+ζ₇⁻¹)` | disc `−16`, `h = 2/(1·2) = 1`; Minkowski bound `(6/27)·7 = 14/9 < 2` | holds | none |
| 13.1 Hasse | `ℚ(√13,√17)`, 25 | local norm everywhere, not a global norm | cyclic hypothesis needed | none |
| 14.1 | `p = 3`, `q = 7` | `(7/3) = 1`, `(3/7) = −1`, product `−1 = (−1)^{1·3}` | holds | none |

## Not verifiable

These texts are settled as uncertified or waived, so I did not request them:
- **neukirch-ant**: V Theorem 6.2 and VI §7.
- **serre-local-fields**: IV §1; IV §3 Proposition 14, indirectly confirmed by milne-cft line 2414; V §§3 and 6; VI §2; IX §8; XI–XIV; XIV §3; XV §2 Theorem 2 and Corollary 3.
- **artin-tate**: XIII; XIV §§1–6; XV.
- **nsw**: (7.1.8), (7.2.5), (7.2.6) and (7.3.1)–(7.3.4).

For the `ℚ_p` cyclotomic normalization, which is cited only to Serre XIV §3, the readable milne-cft lines 2139–2155 (I Example 3.8 and the definition after it, p. 40) support `ζ ↦ ζ^{u⁻¹}` and could be added.

## Source issues

- **Misprint** in milne-cft at VII Theorem 9.5, printed p. 226: the source says every finite-index subgroup of `C_K` is a norm group; it should say every open subgroup of finite index, as the section's opening sentence (line 10185) does; affects nothing.
- **Gap** in milne-cft at V Theorem 3.27, printed p. 165: the source states the discriminant product formula and omits its proof as a local statement; it should give the local deduction or a reference; affects the proof.
