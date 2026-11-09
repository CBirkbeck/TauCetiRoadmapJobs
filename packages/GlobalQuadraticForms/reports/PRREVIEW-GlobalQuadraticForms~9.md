# Review of GlobalQuadraticForms (pull request #1215 at 34c49de)

**Verdict:** needs changes

This is an incremental re-review. This folder has 0 changed lines since `95ba181`. The pull request's own ClassFieldTheory and QuadraticFormInvariants folders changed beneath it. So all 15 earlier findings stand unrepaired, and one new defect comes from the Class Field Theory rewrite (R16). R11 has a new witness, because Quadratic Form Invariants restated `hilbertSymbol_unramified`.

## R01 (P1) — `sorry`'d data makes the classification theorems prove `False`

- **Location.** `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean:188`, `:194` and `:243`: `localizeSquareClass`, `realSquareClassSign` and `globalInvariants` all have the body `sorry` (gate `sorry-data`). They feed `IsAdmissible` (`:225`), `globalInvariants_isAdmissible` (`:250`), and the statements at `:522`, `:529` and `:540`.
- **Claim.** Equal global invariants imply isometry (7.4 and 8.1).
- **Witness.** I re-elaborated this at 34c49de with exit 0. Take a regular `Q` on `ℚ` and a regular `R` on `Fin 2 → ℚ`. Then `equivalent_of_globalInvariants_eq Q hQ R hR rfl` gives `e`, and `e.toLinearEquiv.finrank_eq` simplifies to `1 = 2`.
- **Repair.**
  - Delete the block at `:184–246`.
  - Import `TauCeti.NumberTheory.QuadraticForm.Global.Invariants` and `.FormInvariants`.
  - State 7.3, 7.4 and 8.1 against `QuadraticForm.globalInvariants` (`FormInvariants.lean:77`) and `TauCeti.NumberField.QuadraticForm.GlobalFormInvariants` (`Invariants.lean:90`).
  - With those carriers the two real records have ranks `1 ≠ 2`, so the refuting `rfl` no longer typechecks.

## R02 (P2) — `Suggested.lean` redeclares Tau Ceti's carriers and restates proved Tau Ceti theorems as `sorry`

- **Location.** `Suggested.lean:110–171` and `:297–403`.
- **Claim.** The docstring at `:31` says: "The supplier roadmaps own the declarations and this file consumes them."
- **Witness.** These pinned Tau Ceti declarations exist and were re-opened at this pin:
  - `QuadraticForm.atFinitePlace` and `atRealPlace` (`Global/Localization.lean:90`, `:96`);
  - `QuadraticForm.IsLocallyIsotropic` (`Predicates.lean:51`);
  - `TauCeti.hilbertSymbol_real` (`HilbertSymbol/Archimedean.lean:59`) and `hilbertSymbol_eq_one_of_isAlgClosed` (`IsAlgClosed.lean:36`);
  - `hasFiniteMulSupport_hilbertSymbol_unitAtFinitePlace` (`Global/HilbertSymbol.lean:124`) and `hilbertSymbol_productFormula` (`ProductFormula.lean:67`);
  - `exists_hilbertSymbol_eq_ite` and `exists_pair_hilbertSymbol_eq_ite` (`SignPrescription.lean:154`, `:191`);
  - `isAdmissible_globalInvariants` (`ProductFormula.lean:117`);
  - `anisotropic_baseChange_iff_quaternary` (`QuaternaryDescent.lean:167`).
- **Repair.** Delete each redeclaration and import the Tau Ceti module instead. Then state only the headlines the pin lacks, on Tau Ceti's carriers: 4.2, 5.5, 6.1–6.3, 7.3, 7.4/8.1 and 8.3. The full name-by-name mapping is unchanged from the previous report.

## R03 (P2) — The route suppliers exist only for `K : Type`; the statements use `K : Type u`

- **Location.** `Suggested.lean:269`, `variable {K : Type u}`, for 4.2–4.4, inherited by 5.5–8.4. README 4.2 and 4.4 *Prerequisites* (`README.md:429–431`, `:520–525`).
- **Witness.** At this head, `#check` prints `card_ideleClassNormQuotient : ∀ (K : Type) …`. The pinned sign prescription and product formula also take `K : Type`. So a proof at `Type u` cannot apply them.
- **Repair.** Either state Layers 3–8 for `K : Type`, as the pinned Layer 3–4 declarations are, or add a Layer 0 target, with its own *Needs:* line, that transports along a ring isomorphism `K ≃+* K'` with `K' : Type`.

## R04 (P2) — False claim that the signed discriminant differs from the plain one in dimension four

- **Location.** `README.md:605–606`: "changes it by `(-1)^{n(n-1)/2} = -1` in dimension four". The same claim is in `Suggested.lean:386–387`.
- **Witness.** `4·3/2 = 6` and `(-1)^6 = +1`. Tau Ceti's `signedDiscr_eq_sign_add_discr` (`RegularFormClass/Discriminant.lean:265`) adds `(4 choose 2) • [-1] = 6 • [-1] = 0`.
- **Repair.** Write instead: in dimension four `d± = d`, so the distinction is immaterial here. It matters in ranks 2 and 3; for example, `⟨1,1⟩` has `d = [1]` and `d± = [-1]`.

## R05 (P3) — Imports of other roadmaps' modules (gate: `imports`)

- **Location.** `Suggested.lean:4–7` imports `Completed.GlobalNumberFields.Suggested`, `Completed.NumberFieldArithmetic.Suggested`, `TauCetiRoadmap.ClassFieldTheory.Suggested` and `TauCetiRoadmap.QuadraticFormInvariants.Suggested`. The `#check` block at `:56–72` pins roadmap declarations.
- **Repair.** Import only `Mathlib` and the `TauCeti.*` modules used, and drop the `#check` block. This falls out of R02.

## R06 (P3) — `letI` in signatures (gate: `statement-hygiene`)

- **Location.** `Suggested.lean:119` (`atRealPlace`), `:322` and `:438`.
- **Repair.** These disappear under R02: Tau Ceti's `QuadraticForm.atRealPlace` sets the real algebra internally.

## R07 (P3) — TeX outside a code span (gate: `tex`)

- **Location.** `README.md:507`: `ker φ = Kˣ · N_{E/K}(I_E).` The indented fence inside list item 4 is read as prose.
- **Repair.** Write it as the inline span `` `ker φ = Kˣ · N_{E/K}(I_E)` ``.

## R08 (P3) — Process residue (gate: `residue`)

- **Location.** `README.md:907`: "Do not define a `Prop`-valued stand-in for the Witt ring".
- **Repair.** Delete the sentence; 8.3 already requires the supplier's `wittRing`.

## R09 (P3) — Edit outside the pull request's folders (gate: `outside-folder`)

- **Location.** `Completed/LocalGaloisGroups/Suggested.lean`, 62 insertions and 50 deletions in `git diff origin/main...HEAD`.
- **Witness.** The worker's gate lists this file as its single `outside-folder` hit. The description never mentions LocalGaloisGroups.
- **Repair.** Name `Completed/LocalGaloisGroups` in the description as a consumer this pull request keeps building, or move the edit to its own pull request.

## R10 (P3) — Conflicting open pull request with no stated order

- **Location.** This folder's `README.md` and `Suggested.lean`.
- **Witness.** The overlaps report says: "#1200 and #1215 conflict in `TauCetiRoadmap/GlobalQuadraticForms/README.md`, `…/Suggested.lean`". #1200 is open at `15f0a4c`. Its `Suggested.lean` imports only `TauCeti.*` modules. The description of this pull request names no order.
- **Repair.** State the order. If #1200 merges first, this pull request rebases and drops its hunks in this folder.

## R11 (P3) — Supplier contracts cite the wrong owners, sections or statements

- **`finiteLocalNormMap`, `infiniteLocalNormMap`, `IsFiniteLocalNorm`, `IsInfiniteLocalNorm`.** `README.md:99` and `:436–437` list them as Class Field Theory's. They are Tau Ceti's `TauCeti.GlobalNumberFields.*` (`…/Semilocal/Norm/LocalNorm.lean:57`, `:64`, `:72`, `:79`). The Class Field Theory README at this head never mentions the two maps.
- **`weakApproximation_denseRange`.** `README.md:64` cites it as "Layer 0.2". In Global Number Fields it is Layer 1 (`Completed/GlobalNumberFields/README.md:259–262`). The pinned declaration is `TauCeti`'s (`Global/Approximation/Weak.lean:208`).
- **`hilbertSymbol_comm` at a real place.** `README.md:467–470` and `Suggested.lean:294–296` call it a type error. At this head the supplier's `hilbertSymbol_comm` needs only `[Field K] [Invertible 2]`, and it elaborates over `ℝ` (probe, exit 0). Only `hilbertSymbol_mul` carries `IsNonarchimedeanLocalField`.
- **`hilbertSymbol_unramified` (new witness).** `README.md:126`, `:306` and `:459–460` say that it makes `(unit, unit)_v = 1` outside the dyadic places. At this head it says only this: there is a nonsquare unit `Δ` with `(Δ, b) = (−1)^{v(b)}`.
  - Its hypotheses hold over `ℚ₂`, with `Δ = 5`: `(5,2) = −1` and `(5,−1) = (5,5) = 1`.
  - But over `ℚ₂`, `(−1,−1) = −1` with both arguments units.
  - So the lemma alone cannot give the claim; the count `[U:U²] = 2` at odd residue characteristic is also needed.
  - The pinned `TauCeti.hilbertSymbol_eq_one_of_valued_eq_one` (`Global/HilbertSymbol.lean:75`, hypothesis `v 2 = 1`) is the statement used.
- **`mem_range_ideleNormMap_iff`.** `README.md:103` and `:431` say it is stated against Global Number Fields' coordinates. At `Ideles/Norm/Range.lean:115` it uses Tau Ceti's `v.ideleFiniteCoord` and `v.ideleInfiniteCoord`.
- **`localHasse_congr`, `signedDiscr`, `discr_mk`.** `README.md:123`, `:126`, `:293–294` and `:618` cite them as Quadratic Form Invariants'.
  - Its `README.md:36–46` now records them as Tau Ceti's, old → new: `TauCeti.RegularFormClass.localHasse_congr`, `.signedDiscr` and `.discr_mk`.
  - Its `Suggested.lean` declares none of them.
- **Repair.** Cite each one by its pinned owner and file as above. For the last three, use the names Quadratic Form Invariants now records.

## R12 (P3) — The README plans as open targets work that is done at the pin, and says the pin lacks it

- **Location.** `README.md:184–187`: "At the inspected pin there is no unified number-field localization API … no carrier for admissible global invariant systems".
- **Witness.**
  - `STATUS.md` records Layers 0–3, 4.1, 4.4, 4.5, 5.2–5.4, 7.1, 9.1, 9.4 and 9.5 as done.
  - The carrier is `GlobalFormInvariants` (`Invariants.lean:90`).
  - 4.3 is `exists_sq_sub_mul_sq_iff_forall_completion` (`HasseNorm/Quadratic.lean:45`).
- **Repair.** Delete "What is missing". List each done target, with its name and file, under the supplier contracts "From Tau Ceti". Keep as targets only what the pin lacks.

## R13 (P3) — Undefined `I_K^S` makes the 4.2 warning false under standard notation

- **Location.** `README.md:424–425`: "The identity `I_K = Kˣ · I_K^S` is false — already for `K = ℚ` and `S` the archimedean place".
- **Witness.** Take Neukirch's S-ideles, `∏_{v∈S} K_vˣ × ∏_{v∉S} U_v`. With them the identity holds for `ℚ`, which has class number 1. It fails only for ideles that are 1 on `S`.
- **Repair.** Define it: "`I_K^S`, the ideles whose components at the places of `S` are 1".

## R14 (P3) — README shape, routes, locators and process text

- **House shape.** The README has:
  - no `**Summary.**`, no `## Scope and ownership`, and no `## Exact supplier contracts` with `From …` subsections;
  - layers as `###` headings, with no `### Examples` or `### Dependencies`;
  - no API list or `**Checks.**` for any definition.
- **Mandatory routes.** `:400` ("the one route this roadmap accepts"), `:19–20`, `:489`, `:551–552`, `:776` and `:996–998`.
- **Process text.** `:178–180` and `:184` ("the inspected pin"); `:1008–1010` and `:1047–1049` ("private migration and provenance ledger"); checkboxes at `:984–1010`.
- **Nonexistent name.** `:738` names `TauCeti.NumberField.QuadraticForm.hasseMinkowski_equivalent`, which exists nowhere (resolver lead confirmed by grep at the pin).
- **Missing locators.**
  - The localized product formula has no locator at the claim.
  - Nor do the archimedean symbol, 4.1, 4.5, 6.1 and 8.2–8.4.
  - Lam, Cassels, Neukirch and Milnor–Husemoller are cited without any locator.
- **Repair.**
  - Restructure into the house shape.
  - Turn "Pin this proof" into "*Proof route:*".
  - Delete the process text.
  - Add a locator at each claim. Open alternatives: Milne VIII Thm 1.1 (p. 229) for 4.2, and Thm 3.5 and Cor 3.6 (pp. 235–236) for 5.5 and 6.1.

## R15 (P3) — Padding in `Suggested.lean`

- **Location.**
  - `localHasse_pair` (`:469`), `discr_correctionPlanes` (`:480`, closed by `simp`), `hilbertSymbol_one` (`:487`, which is `TauCeti.hilbertSymbol_one_left`) and `hilbertSymbol_neg_mul` (`:500`).
  - `hilbertSymbol_neg_mul_real` (`:509`).
  - `isSquare_of_isSquare_unitAtFinitePlace` (`:287`), a boundary case.
  - `equivalent_of_locallyEquivalent` (`:550`), which is `.2` of 6.3.
  - The `example`s at `:79`, `:89` and `:566`.
- **Repair.** Delete them from `Suggested.lean`. The README keeps the statements.

## R16 (P3) — Citation of Class Field Theory "§3", a section this pull request removes

- **Location.** `README.md:107–108` and `Suggested.lean:32–33`: "Class Field Theory consumes them under those names (its §3, Layers 12–14)".
- **Claim.** Class Field Theory's §3 lists `cyclicHasseNorm`, `isGlobalNorm_iff_isLocalNormEverywhere`, `hilbertProductFormula` and `card_ideleClassNormQuotient`.
- **Witness.**
  - The pull request's ClassFieldTheory commits renamed main's `## 3. Frozen public interface` (main `README.md:521`) to `## Exact supplier contracts` (head `:531`). No section numbered 3 remains.
  - The four names now sit at head `:570–572`, under `### From Tau Ceti`.
  - The Class Field Theory `Suggested.lean` docstring was rewritten the same way.
- **Repair.** Replace "(its §3, Layers 12–14)" by "(its Exact supplier contracts, From Tau Ceti, and Layers 12–14)" in both places. Head `:570–572` lists exactly these four names, with Layers 12, 13 and 14. Under R05 the `Suggested.lean` occurrence goes with the docstring paragraph.

## Previous findings

- R01 — not repaired: `noncomputable def globalInvariants … : GlobalFormInvariants K := sorry` (`Suggested.lean:243–246`); the refuting probe still elaborates at 34c49de.
- R02 — not repaired: `noncomputable def atFinitePlace (Q : QuadraticForm K V) … := Q.baseChange (v.adicCompletion K)` (`Suggested.lean:110–113`), beside Tau Ceti's `QuadraticForm.atFinitePlace`.
- R03 — not repaired: `variable {K : Type u} [Field K] [NumberField K]` (`Suggested.lean:269`); `card_ideleClassNormQuotient` still takes `K : Type`.
- R04 — not repaired: "Reading `d` as the signed discriminant changes it by `(-1)^{n(n-1)/2} = -1` in dimension four" (`README.md:605–606`).
- R05 — not repaired: `import TauCetiRoadmap.ClassFieldTheory.Suggested` and `import TauCetiRoadmap.QuadraticFormInvariants.Suggested` (`Suggested.lean:6–7`).
- R06 — not repaired: `letI := (InfinitePlace.embedding_of_isReal w.2).toAlgebra` in the type of `atRealPlace` (`Suggested.lean:119`).
- R07 — not repaired: `ker φ = Kˣ · N_{E/K}(I_E).` in an indented fence (`README.md:507`).
- R08 — not repaired: "Do not define a `Prop`-valued stand-in for the Witt ring" (`README.md:907`).
- R09 — not repaired: `Completed/LocalGaloisGroups/Suggested.lean` is still changed. The description does not name it.
- R10 — not repaired: #1200, at `15f0a4c`, still conflicts in both files of this folder. The description of this pull request states no order.
- R11 — not repaired: "`finiteLocalNormMap`, `infiniteLocalNormMap`, `IsFiniteLocalNorm`, `IsInfiniteLocalNorm`, `isGlobalNorm_iff_isLocalNormEverywhere`" under Class Field Theory (`README.md:99`). The `hilbertSymbol_unramified` bullet has a new witness after the supplier restated it.
- R12 — not repaired: "At the inspected pin there is no unified number-field localization API for quadratic forms" (`README.md:184`).
- R13 — not repaired: "The identity `I_K = Kˣ · I_K^S` is false — already for `K = ℚ`" (`README.md:424–425`).
- R14 — not repaired: "Pin this proof. It is the one route this roadmap accepts." (`README.md:400`); layers are still `###` headings.
- R15 — not repaired: `theorem discr_correctionPlanes … := by simp [mul_comm, mul_left_comm]` (`Suggested.lean:480–482`).

## Verified sound

- **Gate.**
  - The worker's run (in `gate.md`) and my rerun fail on exactly the same checks: `tex` 1, `sorry-data` 3, `residue` 1, `imports` 1, `statement-hygiene` 3. These are R07, R01, R08, R05 and R06.
  - The worker's `outside-folder` hit is R09. My rerun lists 6 files there; the other 5 are this pull request's own ClassFieldTheory and QuadraticFormInvariants files.
  - The worker's `build` was 0. My rerun has no build step, but the module's object file is dated after the head commit.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with 22 `sorry` warnings only, the same as at `95ba181`.
- **Signatures.** I elaborated one scratch file with `#check @` of all 40 declarations (exit 0). The supplier edits changed none of the elaborated types. `globalInvariants` and `realSquareClassSign` still drop `[NumberField K]` (part of R01).
- **Depcheck.** Output: `depcheck: 239 roadmaps, 2353 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line. All four suppliers are on main.
- **Cross-roadmap citations resolved at this head.**
  - Class Field Theory `README.md`: `card_ideleClassNormQuotient` (Layer 12, `:1691`); `cyclicHasseNorm` and `isGlobalNorm_iff_isLocalNormEverywhere` (Layer 13, `:1752–1755`); `hilbertProductFormula`, `finiteHilbertInvariantAt` and `infiniteHilbertInvariantAt` (Layer 14, `:1877–1892`).
  - Its scope (`:192–196`) and Downstream consumers (`:1915`) assign Hasse–Minkowski and classification to this roadmap. "§3" no longer resolves (R16).
  - Quadratic Form Invariants: `hilbertSymbol`, `hilbertSymbol_neg_self`, `hilbertSymbol_comm`, `hilbertSymbol_mul`, `hilbertSymbol_unramified` and `exists_hilbertSymbol_eq_neg_one` (its `README.md:28–29`); `formClass`, `discr`, `wittRing` and `toWittRing` (`:27`).
  - In its `Suggested.lean`: `exists_of_realization` (`:160`), `hilbertSymbol_productFormula` (`:197`) and `hilbertSymbol_eq_cohomological` (`:208`).
  - Its Downstream consumers (`:2636–2640`) match this README's table.
- **Library declarations opened at the pin** (Tau Ceti `2fd255d`):
  - `LocalField/QuadraticForm/UnramifiedClass.lean:206,263`;
  - `QuadraticForm/Global/HilbertSymbol.lean:75,124`;
  - `ProductFormula.lean:67,117`;
  - `FormInvariants.lean:77`;
  - `Invariants.lean:90`;
  - `SignPrescription.lean:154,191`;
  - `Localization.lean:90,96`;
  - `Predicates.lean:51`;
  - `QuaternaryDescent.lean:167`;
  - `RegularFormClass/Discriminant.lean:265`;
  - `Ideles/Norm/Range.lean:115`;
  - `Semilocal/Norm/LocalNorm.lean:57–79`;
  - `Approximation/Weak.lean:208`;
  - `ClassFieldTheory/Global/Reciprocity.lean:248`;
  - `HasseNorm/Quadratic.lean:45`;
  - `HilbertSymbol/Archimedean.lean:59`;
  - `IsAlgClosed.lean:36`.
- **Ownership.** I grepped the open heads and main for Hasse–Minkowski statements. Only GlobalQuadraticForms states them, here, at #1200 and on main. IntegralLattices (#1411, #1797) consumes `hasseMinkowski_equivalent`. No second owner.
- **Overlaps.**
  - No id cited here is dropped by an open pull request, and none is defined only by an open revision.
  - The only conflicting head is #1200 (R10).
  - The §3 drop is internal to this pull request and the overlap tool does not see it (R16).
- **Sources (seeded sample).** I re-read milne-cft:
  - VIII Thm 1.1 (line 10384, p. 229);
  - Thm 3.1 (line 10629);
  - Thm 3.5 (line 10686, p. 235);
  - Cor 3.6 and Prop 3.7 (lines 10694–10706, p. 236);
  - the proof of 3.5(b) (lines 10772–10804).

  They support the binary step (3.7b with Thm 1.1), the ternary step (3.7c with the Hasse norm theorem) and the rank-at-least-five step. In that step, `x₁, x₂` are approximated first and `c` is defined from them, as `README.md:646–663` requires. The O'Meara locators of the sample (71:18–19a, 66:1, 58:7, 42:12) are under Not verifiable.
- **Remark on untouched text.** None beyond the carried findings.

### Adversarial table

Rows marked † are carried from the review of `95ba181`, for statements this head leaves untouched. The unmarked rows were computed at `34c49de`.

| Statement | Instances tried | Values (left / right) | Result | Change |
|---|---|---|---|---|
| `hilbertSymbol_unramified` (QFI, restated) as the 2.2/4.4 good-place input | `ℚ₃`, `Δ = 2`; `ℚ₂`, `Δ = 5` | `ℚ₃`: `(2,3) = (2/3) = −1 = (−1)^1`, `(2,2) = 1`. `ℚ₂`: `(5,2) = (−1)^3 = −1`, `(5,−1) = (5,5) = 1`, yet `(−1,−1)₂ = −1` with `v(−1) = 0` | lemma holds at a dyadic place where `(unit, unit) = 1` fails, so it is not a sufficient citation | R11 |
| `hilbertSymbol_comm` at a real place | supplier signature at 34c49de | `[Field K] [Invertible 2]` only; the `ℝˣ` instance elaborates (exit 0) / README says "type error" | **false claim** | R11 |
| `hilbertSymbol_mul` at a real place | supplier signature | needs `IsNonarchimedeanLocalField`; `ℝ` has none / README says type error | holds | — |
| Class Field Theory "§3" | main `:521`; head headings | `## 3. Frozen public interface` / no §3 at head; the table is at `:570–572` | **dangling** | R16 |
| `equivalent_of_globalInvariants_eq` (7.4) | regular `Q` on `ℚ`, `R` on `Fin 2 → ℚ` | hypothesis by `rfl` / `finrank` `1 = 2` → `False` (exit 0) | **false** | R01 |
| Universe of 4.2/4.4 inputs | `card_ideleClassNormQuotient` at 34c49de | `∀ (K : Type)` / used at `K : Type u` | **gap** | R03 |
| Quaternary descent, signed vs plain (rank 4) | `signedDiscr_eq_sign_add_discr` | `C(4,2) • [−1] = 6 • [−1] = 0` / claimed `−1` | **false** | R04 |
| † Localized product formula (4.4) | `ℚ`, `a=b=−1`; `a=2, b=3` | `(−1,−1)₂ = (−1,−1)_∞ = −1`, product `1`; `(2,3)₂ = −1`, `(2,3)₃ = −1`, product `1` | holds | locator (R14) |
| † Archimedean symbol (4.4) | `(−2,−3)`, `(−2,3)`, `(2,−3)` over `ℝ`; `ℂ` | `−1, 1, 1`; `ℂ` gives `1` / formula `−1, 1, 1, 1` | holds | locator (R14) |
| † Sign prescription (71:19a) | `ℚ`, `b=−1`, `T={2,∞}`; `b=2`, `T={3,5}` | `a=−1` gives pattern `T`; `a=15`: `(15,2)₃ = (15,2)₅ = −1`, `(15,2)₂ = 1` | holds | — |
| † Sign prescription, parity / `T=∅` | `T={∞}`, `b=−1`; `T=∅` | odd support impossible; `a=1` with `(1,b)=1` | hypothesis load-bearing; holds | — |
| † Binary (5.1) | `⟨1,−2⟩`, `⟨1,−4⟩` | anisotropic at 3 / not isotropic; `d=[−1]` / hyperbolic | holds | — |
| † Ternary (5.1) | `⟨1,1,−3⟩`, `⟨1,1,−2⟩` | 3 is not a norm from `ℚ₃(i)` / anisotropic; `2=1+1` / isotropic | holds | — |
| † Quaternary, `d=[1]` (42:12) | `⟨1,1,1,1⟩ ⊇ ⟨1,1,1⟩` | both anisotropic at 2 and ∞, both isotropic at 3 | holds | — |
| † Quaternary descent (58:7) | `⟨1,1,1,−7⟩`, `E=ℚ(√−7)` | anisotropic at 2; 2 splits in `E` / anisotropic over `E` | holds | — |
| † Descent, rank-4 hypothesis | `⟨1,2⟩` over `ℚ(i)`, `E=F(√2)` | `−2` nonsquare in `ℚ(i)` / `−2 = (i√2)²` | witness correct | — |
| † Global square theorem (4.2) | `a = −1, 16, 2` over `ℚ` | `−1` nonsquare at `p ≡ 3 (4)`; `16 = 4²` | holds | R03 |
| † 4.2 warning `I_K = Kˣ·I_K^S` | `ℚ`, `S={∞}` | Neukirch S-ideles: true / "trivial on S": false | ambiguous | R13 |
| † HM isotropy (5.5) | ranks 0, 1; `⟨1,1⟩`, `⟨1,−1⟩`, `⟨1,1,−3⟩`, `5⟨1⟩`, `⟨1,1,1,1,−1⟩` | F/F, F/F, F/F, T/T, F/F, F/F, T/T | holds | — |
| † HM, "all but one place" | `⟨1,1,1,7⟩` | isotropic at every finite place, anisotropic at ∞ / anisotropic over `ℚ` | holds | — |
| † Scalar rep (6.1) | `⟨1,1⟩`, `a = 3, 5` | 3: F/F (at 3); `5 = 1+4`: T/T | holds | — |
| † Form rep (6.2) | `⟨1⟩→⟨1,1⟩`; `⟨3⟩→⟨1,1⟩`; dim 3 → dim 2 | T/T; F/F; F/F | holds | — |
| † HM isometry (6.3) | `⟨1,1,−1⟩` vs `⟨1,2,−2⟩`; `⟨1,1,−3⟩` vs `⟨1,1,−1⟩` | T/T; F/F (differ at 3) | holds | — |
| † Real Hasse sign | `q = 0,…,4` | `q(q−1)/2 = 0,0,1,3,6` / `C(q,2) = 0,0,1,3,6` | agree | — |
| † Admissibility small ranks (3.2) | rank 1 `s=−1`; rank 2 `d=[−1]`, `s=−1` | both excluded by the realization conditions | holds | — |
| † 9.3 `ℚ(√5)` | `p = (3,1)`, `s=−1` above 2 | `(−1)·(+1)(−1) = +1` | admissible | — |
| † Correction planes (7.2) | `ℚ`, `β=3`, `R={3,5}`, `α=5` | `d(P') = [−3] = d(P)`; `(5,3)₃ = (5,3)₅ = −1`, `(5,3)₂ = 1` | holds | — |
| † Witt kernel (8.2) | `⟨1,1⟩` over `ℚ` | not hyperbolic at 3 / not hyperbolic | holds | — |

## Not verifiable

- **omeara.** O'Meara, *Introduction to Quadratic Forms*, locators 42:12, 58:7, 63:14, 65:15, 65:21, 65:23, 66:1, 66:3–6, 71:18–19a and 72:1. The manifest settles it as uncertified, so I did not request it. I checked the statements mathematically, against milne-cft, and against the pinned Tau Ceti proofs.
- **serre.** Serre, *A Course in Arithmetic*, Ch. III–IV. Uncertified in the manifest.
- **Lam, Cassels, Neukirch, Milnor–Husemoller.** They are cited without locators (R14), so there is nothing to verify yet.

## Source issues

- **Misprint** in milne-cft at VIII, proof of Thm 3.5(b), p. 237: the source says ranks 3 and 4 follow from Prop 3.7(c, d) and Theorem 1.1; it should be Theorem 3.1, the Hasse norm theorem; affects the proof.
- **Misprint** in milne-cft at VIII, proof of Thm 3.5(b), p. 237: the source says Theorem 3.1b is assumed for rank n−1; it should be Theorem 3.5(b); affects the proof.
