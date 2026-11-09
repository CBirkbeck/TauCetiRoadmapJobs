# Review of GlobalQuadraticForms (pull request #1215 at 1abcd32)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/GlobalQuadraticForms/` at `1abcd32c3285bc2ce2b2f372d7d7184bbc88628f`, covering main's text plus this pull request's 20 README lines and 38 Lean lines. It has 13 findings: two P1, two P2 and nine P3. The push gate fails. Most of the findings concern text that this pull request inherits from main. The open pull request #1200 rewrites this folder and conflicts with this head. Its files do not have the defects of R01–R04 and R06–R10 (checked under R05), so the order of the two pull requests (R05) is the cheapest repair for most of them.

## R01 (P1) — Three definitions whose bodies are `sorry` make the existence, uniqueness and classification headlines false

**Location.** `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean:243–246`: "noncomputable def globalInvariants … GlobalFormInvariants K := sorry". The same holds for `localizeSquareClass` (:188–190) and `realSquareClassSign` (:194–196). They are used by 7.3 (:522–526), 7.4 (:529–536), 8.1 (:540–546) and the `IsAdmissible` fields (:228–236).

**Claim.** `equivalent_of_globalInvariants_eq`: two regular forms with equal invariant records are isometric.

**Witness.** The body ignores the form: `globalInvariants Q hQ = globalInvariants R hR := rfl` elaborates. With `⟨1⟩` on `ℚ¹` and `⟨1,1⟩` on `ℚ²`, the theorem yields an isometry across dimensions 1 and 2; a scratch proof of `False` elaborates warning-free.

The same `rfl` makes 7.3 imply that any two admissible records are equal; that consequence also elaborates in a scratch file. It also makes `realSquareClassSign K w d` independent of the real place `w`. Then `real_discr_sign` rejects every admissible record whose negative indices differ in parity at two real places, for example `⟨1, 1, √5⟩` over `ℚ(√5)`, with positive indices 3 and 2. Separately, the elaborated `globalInvariants` has lost `[NumberField K]`.

**Repair.**
1. Delete `SquareClass`, `localizeSquareClass`, `realSquareClassSign`, `realHasseSign`, `GlobalFormInvariants`, `HasseProductCompatible`, `IsAdmissible` and `globalInvariants`.
2. State 3.3, 7.3, 7.4 and 8.1 against Tau Ceti's `TauCeti.NumberField.QuadraticForm.GlobalFormInvariants` and `GlobalFormInvariants.IsAdmissible` (`TauCeti/NumberTheory/QuadraticForm/Global/Invariants.lean:90`, `:178`) and `QuadraticForm.globalInvariants` (`…/Global/FormInvariants.lean:77`). These have real bodies: the discriminants come from `RingHom.squareClassMap`, the Hasse signs from `finiteHasse`, the indices from `realPositiveIndex`.

Tested on the refuting instance: with Tau Ceti's `globalInvariants`, `QuadraticForm.globalInvariants_rank` gives ranks 1 and 2, and a scratch proof that the two records differ elaborates (exit 0).

## R02 (P1) — The README says the signed and plain discriminants differ by `−1` in dimension four; they agree

**Location.** `README.md:605–606`: "Reading `d` as the signed discriminant changes it by `(-1)^{n(n-1)/2} = -1` in dimension four and breaks the computation." Also `Suggested.lean:386–387`: "not the signed one, which differs by `-1` in dimension four".

**Claim.** In dimension four the signed discriminant is `−d`.

**Witness.** `n(n−1)/2 = 4·3/2 = 6`, so the factor is `(−1)^6 = 1`; for `⟨1,1,1,1⟩` both classes are `[1]`. The factor is `−1` only for the residual plane `P` (`n = 2`): its plain discriminant is `[−1]` and its signed one `[1]`.

**Repair.** Replace the README bullet with:

> **The discriminant is the plain one** fixed in the conventions. In dimension four the signed discriminant `(-1)^(n(n-1)/2)·d = (-1)^6·d` equals it, so `d` is the same under either reading. The convention matters for the residual plane `P`: its plain discriminant `[-1]` makes it hyperbolic, while its signed discriminant is `[1]`.

Rewrite the `hd` bullet of the docstring at `Suggested.lean:386–387` the same way. Tested: the factor is `(−1)^6 = 1` at `n = 4` and `(−1)^1 = −1` at `n = 2`, and `H = ⟨1,−1⟩` has plain discriminant `[−1]` and signed discriminant `[1]`.

## R03 (P2) — Layers 0 and 2–4, and parts of Layers 5 and 7, restate what Tau Ceti proves at the pin

**Location.** `Suggested.lean:108–171`, `:184–254`, `:292–365`, `:375–403`. README 0.1–0.3, 2.1–2.2, 3.1–3.3, 4.4, 4.5, 5.1 (quaternary descent and the quaternary step), 5.3–5.4 and 7.1. `README.md:184–186` says: "At the inspected pin there is no unified number-field localization API … no carrier for admissible global invariant systems".

**Claim.** This roadmap owns these carriers and theorems, and the library lacks them.

**Witness.** Tau Ceti `2fd255d` contains `TauCeti/NumberTheory/QuadraticForm/Global/`: 42 files with no `sorry`, two of which name this README as their provenance. It holds the declarations in the table below, at the namespace this README prescribes (`README.md:39–40`).

| Here (`Suggested.lean`) | Tau Ceti at the pin |
|---|---|
| `atFinitePlace` :110, `atRealPlace` :117 | `QuadraticForm.atFinitePlace`, `atRealPlace`: `Global/Localization.lean:90`, `:96` |
| `unitAtFinitePlace` :127, `unitAtRealPlace` :132 | `HeightOneSpectrum.unitAtFinitePlace`, `TauCeti.unitAtRealPlace`: `Localization.lean:43`, `:67` |
| `IsLocallyIsotropic` :137, `LocallyRepresentsScalar` :151, `LocallyEquivalent` :142 | `QuadraticForm.IsLocallyIsotropic`, `LocallyRepresentsScalar`, `LocallyEquivalent`: `Global/Predicates.lean:51`, `:85`, `:147` (and `LocallyRepresents` :66) |
| `not_anisotropic_complex` :158, `equivalent_of_finrank_eq_complex` :164 | `QuadraticForm.not_anisotropic_of_isSepClosed`, `equivalent_iff_finrank_eq_of_isSepClosed`: `LinearAlgebra/QuadraticForm/SepClosed.lean:147`, `:87` |
| `SquareClass` :184, `localizeSquareClass` :188, `realSquareClassSign` :194, `realHasseSign` :200 | `SquareClassGroup` (`FieldTheory/SquareClassGroup/Basic.lean:45`), `RingHom.squareClassMap` (`Multiplicative.lean:181`), `GlobalFormInvariants.discrAtRealPlace`, `realHasse` (`Invariants.lean:121`, `:142`) |
| `GlobalFormInvariants` :206, `HasseProductCompatible` :214, `IsAdmissible` :225 | `Invariants.lean:90`, `hasseProduct` :155, `IsAdmissible` :178 (the same seven conditions) |
| `globalInvariants` :243, `globalInvariants_isAdmissible` :250 | `QuadraticForm.globalInvariants` (`FormInvariants.lean:77`), `isAdmissible_globalInvariants` (`ProductFormula.lean:117`) |
| `hilbertSymbol_real` :297, `finite_hilbertSymbol_ne_one` :307 | `hilbertSymbol_unitAtRealPlace_eq_neg_one_iff` (`ArchimedeanSymbol.lean:102`), `hasFiniteMulSupport_hilbertSymbol_unitAtFinitePlace` (`Global/HilbertSymbol.lean:124`) |
| `hilbertSymbol_localized_productFormula` :318 | `hilbertSymbol_productFormula` (`ProductFormula.lean:67`) |
| `exists_hilbertSymbol_eq_neg_one_iff` :339, `…_pair` :356 | `exists_hilbertSymbol_eq_ite`, `exists_pair_hilbertSymbol_eq_ite` (`SignPrescription.lean:154`, `:191`) |
| `not_anisotropic_of_not_anisotropic_baseChange_quaternary` :392 | `QuadraticForm.anisotropic_baseChange_iff_quaternary` (`LinearAlgebra/QuadraticForm/QuaternaryDescent.lean:167`) |
| README 5.1 quaternary step, 5.4 | `not_anisotropic_of_isLocallyIsotropic_quaternary` (`Global/Quaternary.lean:137`, which takes the ternary theorem over every number field as a hypothesis); `not_anisotropic_of_isLocallyIsotropic_of_five_le_finrank` (`Global/HigherRank.lean:87`, which takes rank `n − 1` as a hypothesis) |
| `discr_correctionPlanes` :480, `hilbertSymbol_neg_mul` :500 | `discr_formClass_weightedSumSquares_neg_self_mul`, `finiteHasse_weightedSumSquares_neg_self_mul` (`Global/CorrectionPlanes.lean:80`, `:114`) |

**Repair.**
1. Delete these declarations from `Suggested.lean` and import the Tau Ceti modules instead.
2. In the README, list each item under `## Scope and ownership` as Tau Ceti's at the pin, with its name and file, and delete the restated targets.
3. Keep as targets only what the pin lacks: the global square theorem, the binary and ternary cases and Hasse–Minkowski in every rank, 6.1–6.3, 7.2–7.4, 8.1–8.3 and the worked examples. A grep of Tau Ceti `NumberTheory/QuadraticForm/` for `hasseMinkowski`, a global-square theorem and an unconditional ternary step finds none.

## R04 (P2) — Every class-field input is stated for `K : Type`, but the targets built on them are stated for `K : Type u` with no transport step

**Location.** `README.md:100–101`: the contract rows for `hilbertProductFormula` and `card_ideleClassNormQuotient` state no universe. `Suggested.lean:269` has `variable {K : Type u}` (4.2–4.4), and :105, :409, :517 do the same. The ternary step of 5.1 uses `isGlobalNorm_iff_isLocalNormEverywhere`.

**Claim.** 3.3, 4.2, 4.3, 4.4, the ternary case of 5.1, and everything after them, follow from the cited suppliers for a number field in any universe.

**Witness.** Elaborated at the pin: `card_ideleClassNormQuotient : ∀ (K : Type) …`, `isGlobalNorm_iff_isLocalNormEverywhere (K : Type)` and `hilbertProductFormula {K : Type}`. Quadratic Form Invariants' `hilbertSymbol_productFormula (F : Type)` is the same (its `Suggested.lean:2548`). The 4.4 statements here elaborate with `{K : Type u_1}`.

**Repair.** Add a target and cite it in the *Prerequisites* of 3.3, 4.2, 4.3, 4.4, 5.1 and 7.2. The target: for a number field `K : Type u`, there is a `K₀ : Type` with `σ : K ≃+* K₀`. Take `K₀ = AdjoinRoot (minpoly ℚ θ)` for a primitive element `θ`, via Mathlib's `IntermediateField.adjoinRootEquivAdjoin` (`FieldTheory/IntermediateField/Adjoin/Basic.lean:423`). The isomorphism `σ` carries:
- finite places, by `comap`;
- completions, by Tau Ceti's `adicCompletionCongr` and `adicCompletionCongr_algebraMap` (`RingTheory/DedekindDomain/AdicValuation/Transport.lean:140`, `:160`);
- real places, unit localizations and the norm-equation symbol.

Each statement proved for `Type` then transports. Alternatively, state Layers 3–8 for `K : Type`, as Tau Ceti does, and say so under Conventions. Tested: `AdjoinRoot (minpoly ℚ θ)` lies in `Type` because `ℚ : Type`.

## R05 (P3) — Open pull request #1200 rewrites this folder and conflicts with this head, and no order is stated

**Location.** Both files of the folder. This pull request's description does not mention Global Quadratic Forms or #1200.

**Witness.** The `roadmaps overlaps` output says "#1200 and #1215 conflict in `TauCetiRoadmap/GlobalQuadraticForms/README.md`, `…/Suggested.lean`". At #1200's head `15f0a4c`, `Suggested.lean` imports only `Mathlib` and five `TauCeti.*` modules, and its README states "There is no roadmap supplier."

**Repair.** State the order in this pull request's description.
- **Recommended:** #1200 merges first, and this pull request drops its edits to `TauCetiRoadmap/GlobalQuadraticForms/`. #1200's files cite no Class Field Theory or Quadratic Form Invariants roadmap declaration, so nothing here needs to touch them.
- **Otherwise:** this pull request merges first, and #1200 rebases and keeps its own two files.

I checked #1200's files at `15f0a4c`:
- `Suggested.lean` declares no definition and contains no `letI`, `#check` or `example`;
- its README has a universe-transport section (4.1);
- its README states the plain-versus-signed discriminant correctly (lines 123–124);
- its README does not use `I_K^S`.

## R06 (P3) — `Suggested.lean` imports four roadmap modules (gate check `imports`)

**Location.** `Suggested.lean:4–7`: "import Completed.GlobalNumberFields.Suggested … import TauCetiRoadmap.QuadraticFormInvariants.Suggested".

**Witness.** The gate reports: "Suggested.lean imports: `import Mathlib` first, then only the individual `TauCeti.*` modules used". The file also contains no `TauCetiRoadmap.ClassFieldTheory` name apart from its import at :6.

**Repair.** Import `Mathlib` and only the `TauCeti.*` modules whose declarations the remaining statements use. After R03 these are `TauCeti.NumberTheory.QuadraticForm.Global.Localization`, `.Predicates`, `.Invariants` and `.FormInvariants`, plus `TauCeti.LinearAlgebra.QuadraticForm.Witt.BaseChange` for 8.3.

## R07 (P3) — `letI` in three signatures (gate check `statement-hygiene`)

**Location.** `Suggested.lean:119` (`atRealPlace`), `:322` (`hilbertSymbol_localized_productFormula`) and `:438` (`represented_iff_locallyRepresented`).

**Witness.** The gate reports "P3 `letI` in the signature of …" for each. Tau Ceti's `QuadraticForm.atRealPlace` installs the real algebra inside its body (`Localization.lean:96–101`). Tau Ceti's `hilbertSymbol_productFormula` writes `∏ w : {w : InfinitePlace K // w.IsReal}` with no `letI` (`ProductFormula.lean:67–71`).

**Repair.** State :438 against `QuadraticForm.atRealPlace` and `QuadraticMap.IsRepresentedBy`, which removes both its `letI` and that of :119. Drop the `letI` at :322, since the instance is found, or delete that theorem under R03.

## R08 (P3) — The supplier labels contradict the README's own key and the module docstring

**Location.**
- `README.md:99` attributes `finiteLocalNormMap`, `infiniteLocalNormMap`, `IsFiniteLocalNorm` and `IsInfiniteLocalNorm` to Class Field Theory.
- `:374`, `:429`, `:442` and `:520–521` mark `hilbertProductFormula`, `card_ideleClassNormQuotient` and `cyclicHasseNorm` "R Class Field Theory".
- `:460–462` calls `finiteHilbertInvariantAt` "Class Field Theory's".
- `:65` cites Global Number Fields' `IdeleGroup` and `IdeleClassGroup`.
- `:114` gives the chain "ClassFieldTheory → QuadraticFormInvariants → GlobalQuadraticForms".

**Witness.** Lines 105–108, changed by this pull request, call those names Tau Ceti's; the key at :46–49 reserves R for roadmaps. The local-norm names are `TauCeti.GlobalNumberFields.*` (`NumberTheory/NumberField/LocalGlobal/Semilocal/Norm/LocalNorm.lean:50`, `:79`). The norm maps use Mathlib's `IdeleGroup (𝓞 K) K` (`AdeleRing.lean:104`).

**Repair.**
- Mark each of these items T, with its Tau Ceti name and file.
- Cite Mathlib's `IdeleGroup` and `IdeleClassGroup` (`Mathlib/NumberTheory/NumberField/AdeleRing.lean:104`, `:130`) as the carriers of `ideleNormMap` and `card_ideleClassNormQuotient`.
- Replace the Class Field Theory table with one sentence: Class Field Theory consumes the same Tau Ceti names (its §3, Layers 12–14).
- Delete the chain at :113–115.
- The completed suppliers' names also exist in Tau Ceti: `TauCeti.GlobalNumberFields.weakApproximation_denseRange` (`NumberTheory/NumberField/Global/Approximation/Weak.lean:208`), `isNonarchimedeanLocalField_adicCompletion` (`RingTheory/DedekindDomain/AdicValuation/ValuativeRel.lean:242`) and `HeightOneSpectrum.completionAlgHom` (`NumberTheory/NumberField/LocalGlobal/Completion.lean:64`). Cite these instead of the stubs of the completed roadmaps checked at `Suggested.lean:56–60`.

Test: after the edit, no "R Class Field Theory" item remains (4 now, at :374, :429, :442 and :520).

## R09 (P3) — The warning that `I_K = Kˣ · I_K^S` fails for `K = ℚ` is wrong under the standard notation

**Location.** `README.md:423–425`: "The identity `I_K = Kˣ · I_K^S` is false — already for `K = ℚ` and `S` the archimedean place".

**Witness.** milne-cft line 7636 (V, p. 170) defines this group as `∏_{v∈S} K_vˣ × ∏_{v∉S} O_vˣ`. Take `S = {∞}` and an idele `i` of `ℚ`. Dividing `i` by `∏ p^{v_p(i_p)} ∈ ℚˣ` makes every finite component a unit, so the identity holds.

**Repair.** Define the group in words:

> The identity `I_K = Kˣ · J`, where `J` is the group of ideles whose components at the places of `S` are `1`, is false. For `K = ℚ` and `S = {∞}`, the idele with `i_∞ = √2` and `i_p = 1` would need `α = √2 ∈ ℚ`.

Tested: both computations above.

## R10 (P3) — `Suggested.lean` contains padding

**Location.**
- **One-step proofs from Tau Ceti.** `not_anisotropic_complex` (:158) and `equivalent_of_finrank_eq_complex` (:164).
- **A boundary case.** `isSquare_of_isSquare_unitAtFinitePlace` (:287) is 4.2 with `S = ∅`.
- **Small identities proved in place.** `localHasse_pair` (:469), `discr_correctionPlanes` (:480), `hilbertSymbol_one` (:487) and `hilbertSymbol_neg_mul` (:500).
- **Small computations.** `hilbertSymbol_complex` (:302) follows from Tau Ceti's `hilbertSymbol_eq_one_of_isSquare_left` (`NumberTheory/HilbertSymbol/Basic.lean:266`), because every complex number is a square. `hilbertSymbol_neg_mul_real` (:509) is similar.
- **A catalogue of names.** The `#check` block at :56–77 checks nine roadmap declarations.
- **Examples that restate cited theorems.** The `example`s at :79–84, :89–99 and :566–572.

**Claim.** Each declaration is a headline theorem or a definition that a headline needs.

**Witness.** The one-tactic probe closes :161 by `exact QuadraticForm.not_anisotropic_of_isSepClosed Q h` and :171 by `simp_all only [QuadraticForm.equivalent_iff_finrank_eq_of_isSepClosed]`. The rest are small identities proved in place, the `S = ∅` case of 4.2, `#check` lines or `example`s.

**Repair.** Delete all of these from `Suggested.lean`. The README keeps 0.3, the corollary of 4.2, 4.4 and the plane calculation of 7.2. Keep `equivalent_of_locallyEquivalent` (:550): Integral Lattices (`README.md:477`, `:916`) and Orthogonal and Spin Groups cite it by name.

## R11 (P3) — Gate text checks: TeX at `README.md:507` and process residue at `:907`

**Location.** `:507`: "ker φ = Kˣ · N_{E/K}(I_E)." (an indented fenced block inside list item 4). `:907`: "Do not define a `Prop`-valued stand-in for the Witt ring".

**Claim.** The README passes the gate's text checks.

**Witness.** The gate reports `tex: line 507: ker φ = Kˣ · N_{E/K}(I_E).` and `residue: line 907`. The same expression inside an inline span at :412 passes.

**Repair.**
- Replace :506–508 with the inline text "this forces `ker φ = Kˣ · N_{E/K}(I_E)`." (inline spans pass the scanner, as :412 shows).
- At :907, write "a `Prop`-valued placeholder for the Witt ring". The word "placeholder" passes at :131.

## R12 (P3) — The pull request edits a folder outside its roadmap folders: `Completed/LocalGaloisGroups/Suggested.lean`

**Location.** `Completed/LocalGaloisGroups/Suggested.lean`, 62 lines added and 50 removed.

**Claim.** The pull request changes only its roadmap folders: Class Field Theory, Quadratic Form Invariants and this one.

**Witness.** The gate reports `outside-folder: Completed/LocalGaloisGroups/Suggested.lean`. The diff renames `ClassFieldTheory.artinMap` to `TauCeti.ClassFieldTheory.artinMap` and adds an import. The description names neither this folder nor the reason.

**Repair.** Move the edit to its own pull request. Alternatively, have the description list `Completed/LocalGaloisGroups` among this pull request's folders, as a consumer kept building after the Class Field Theory renames, so that the next review is briefed with it.

## R13 (P3) — The README is not in the house form, and most targets have no locator

**Location.** The whole of `README.md`.

**Claim.** Every definition has at least three Checks, every theorem has a locator, and every layer lists its examples and dependencies.

**Witness.** Counts in the README:

| Item | Count |
|---|---|
| `**Checks.**` | 0 |
| `### Examples` | 0 |
| `### Dependencies` | 0 |
| `*Needs:*` | 0 |
| `*Prerequisites:*` | 32 |
| `*Source:*` | 8, of 37 subsections |

The headline 5.5 and the sampled archimedean symbol have no locator. The README also has an `## Acceptance criteria` checklist (:984–1010) and a "private migration and provenance ledger" (:1009, :1048).

**Repair.**
1. Use the house shape: `**Summary.**`, `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build`, `## Layer k` with `### k.n` subsections, `*Needs:*`, and `**Checks.**`, `### Examples` and `### Dependencies` in every layer.
2. Remove the checklist, the ledger references, and the mandatory-route wording: "Pin this proof. It is the one route this roadmap accepts." (:400) and "is rejected" (:421, :486).
3. Give every target a locator. For the sampled targets, these certified Milne locators fit as written (verified):
   - 4.2: VIII Thm 1.1, p. 229 (line 10384);
   - the localized product formula: V Ex. 5.4, p. 179 (line 8142);
   - sign prescription: VIII Lemma 6.13, p. 256 (line 11812);
   - binary and ternary: VIII Thm 3.5 and Prop 3.7(b)–(c), pp. 235–236 (lines 10686, 10698–10701);
   - 5.5: Thm 3.5(b), p. 235;
   - 6.3: Thm 6.3, p. 252 (line 11619);
   - 7.2: Thm 6.12, p. 256 (line 11792).

## Previous findings

The previous review read pull request #1200 at `f6c50f2`. Neither of its findings applies to this branch.

- **Its R01 (the branch pins Tau Ceti `358314d` and conflicts with main): does not arise here.** At this head, `lake-manifest.json` pins Tau Ceti `2fd255d`, Mathlib `1b1ccf4` and `v4.36.0-rc2`. `git diff origin/main HEAD -- lake-manifest.json lean-toolchain` is empty. Main has not touched this folder since the branch's merge base: 18 commits, none in it. That finding stays open on #1200.
- **Its R02 ("`TauCeti.RegularFormClass.discr`, `TauCeti.RegularFormClass.localHasse`" missing from the contracts): not applicable.** The 4.1 passage it read exists only in #1200; this head's 4.1 is "Vector weak approximation", and both names occur 0 times here.

## Verified sound

**Gate and dependencies.**
- My gate rerun reports the worker's failures exactly: tex 1, sorry-data 3, residue 1, imports 1, statement-hygiene 3, and `outside-folder: Completed/LocalGaloisGroups/Suggested.lean`. All other checks are 0. It also lists the Class Field Theory and Quadratic Form Invariants files, which this brief names as the pull request's own. The worker's gate records `build=0`.
- The dependency check printed exactly `depcheck: 238 roadmaps, 2352 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- There are no `gap:` contracts.

**Lean at the pins.**
- `lake env lean` on `Suggested.lean`: exit 0, with 22 `sorry` warnings (lines 158, 164, 188, 194, 243, 250, 279, 297, 302, 307, 318, 339, 356, 392, 417, 423, 429, 445, 509, 522, 529, 540) and no other warning.
- `#check @` of all 41 declarations elaborates. Every 4.x–8.x statement is at `K : Type u_1`. `globalInvariants` and `GlobalFormInvariants` carry no `[NumberField K]`. `V` and `W` share one universe in 0.2, 6.2, 6.3, 7.4 and 8.1. `a ≠ 0` is in 6.1. The quaternary descent carries `hdim`, `hd`, `hdsq`, `hdeg`, `hs` and `hgen`.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `aesop`, `exact?`) on all 19 sorried theorems: 2 close (:161 and :171, see R10) and 17 fail. Under plain `import Mathlib`, `aesop` closes neither of the two.

**Library declarations opened** (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`):
- the Tau Ceti declarations in the R03 table, the Tau Ceti and Mathlib declarations in R04 and R08, and `Mathlib/NumberTheory/NumberField/AdeleRing.lean:104`, `:110`, `:130`;
- `TauCeti/NumberTheory/ClassFieldTheory/Global/Reciprocity.lean:100` and `:248`;
- `NumberTheory/NumberField/Global/Ideles/Norm/Range.lean:115` (`mem_range_ideleNormMap_iff`: an arbitrary idele, both directions, no Galois hypothesis, as the changed row :103 says);
- `…/Ideles/Norm/LocalNorm.lean:42` (`unitEmbedding_mem_range_ideleNormMap_iff`);
- `NumberTheory/HilbertSymbol/Basic.lean:47` (`TauCeti.hilbertSymbol` is the norm-equation symbol, and Quadratic Form Invariants' `hilbertSymbol` is an abbreviation of it);
- `QuaternaryDescent.lean:113` (`[Algebra.IsQuadraticExtension F E]`, so this roadmap's `hgen` is implied by `hdeg` and `hs`; noted, not a finding).

**Cross-roadmap citations resolved at this head.**
- **Class Field Theory.** §3 is at `README.md:497`. Its rows :535–537 list `card_ideleClassNormQuotient` (Layer 12), `cyclicHasseNorm` and `isGlobalNorm_iff_isLocalNormEverywhere` (Layer 13), and `hilbertProductFormula`, `finiteHilbertInvariantAt` and `infiniteHilbertInvariantAt` (Layer 14) as consumed from Tau Ceti. :178–182 names this roadmap's 3.3, 4.2–4.4 and 5.1 as consumers. This matches the changed :105–108.
- **Quadratic Form Invariants** (`Suggested.lean` lines):

  | Name | Line |
  |---|---|
  | `hilbertSymbol` | 1179 |
  | `localHasse` | 1186 |
  | `hilbertSymbol_neg_self` | 1200 |
  | `hilbertSymbol_comm` | 1214 |
  | `hilbertSymbol_unramified` | 1220 |
  | `hilbertSymbol_mul` | 1237 |
  | `exists_hilbertSymbol_eq_neg_one` | 1304 |
  | `localHasse_congr` | 1313 |
  | `exists_of_realization` | 1323 |
  | `discr` | 464 |
  | `discr_mk` | 471 |
  | `signedDiscr` | 479 |
  | `wittRing` | 664 |
  | `toWittRing` | 670 |
  | `hilbertSymbol_eq_cohomological` | 2520 |
  | `hilbertSymbol_productFormula` | 2548 |

  Its Layers 0, 1, 6A, 6C and 6D are at `README.md:924`, `:1063`, `:1617`, `:1989` and `:2173`.
- **Completed Global Number Fields.** `weakApproximation_denseRange` (:34), and `IdeleGroup` and `IdeleClassGroup` (:358, :360), which are abbreviations of Mathlib's carriers.
- **Consumers of this roadmap.** Integral Lattices `README.md:477`, `:916` and `:1028`, and Orthogonal and Spin Groups `README.md:947` and `:965` (`hasseMinkowski_equivalent`, `equivalent_of_locallyEquivalent`). Classical Arithmetic Completion `README.md:165` and `:189` (4.4, Layer 4). All of these resolve here.
- **Ownership.** `roadmaps grep` finds the headline names only in this folder: on main, at #1200 and at this head. No other open roadmap owns them.

**Adversarial table.** Values are computed on each side. "[S]" marks a sampled target and "[H]" a headline.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Real Hasse sign `(-1)^(q(q-1)/2)`, `q = n−p` | `q = 0..4` | exponents `0,0,1,3,6` → `1,1,−1,−1,1`; direct `∏_{i<j}` over `q` copies of `−1`: `(−1)^C(q,2)` = same | agree; `p > n` gives junk `1`, excluded by `real_index_le` | none |
| 3.2 real discriminant sign | `p⟨1⟩⊥q⟨−1⟩`, `q = 0..3` | `sign det = +,−,+,−`; field: `if Even q then 1 else −1` = same | agree on paper; the Lean field uses the `sorry` sign | R01 |
| 3.2 small-rank exceptions | `⟨a⟩`; `⟨a,−a⟩` | rank 1: empty product `1`; rank 2, `d=[−1]`: `(a,−a)=1`; Milne Thm 6.12 (b) in the `i≤j` convention, times `(d,−1)`, gives `1`, `1` | agree | none |
| 3.2 without the small-rank clauses (wrong model) | rank 1, `d=[1]` over ℚ, `s_2=s_3=−1`, `p_∞=1` | finite support yes; product `(−1)(−1)·1 = 1`; real sign `+`; but every rank-1 form has `s ≡ 1` | clauses load-bearing | none |
| 3.2 product condition | `⟨−1,−1,−1⟩` over ℚ | `s_2 = (−1,−1)_2^3 = −1`, `s_p = 1` (odd `p`); real `q = 3` → `−1`; product `1` | holds | none |
| `globalInvariants` (body `sorry`) [H 7.4] | `⟨1⟩` on `ℚ¹`, `⟨1,1⟩` on `ℚ²` | LHS records equal by `rfl`; RHS isometry ⇒ `1 = 2` | `False` derived in Lean | R01 |
| `realSquareClassSign` (body `sorry`) | `ℚ(√5)`, `d = [√5]`, indices 3 and 2 | `sorry`: same value at both places (`rfl`); true signs `+` (`2.236`), `−` (`−2.236`) | admissible record rejected | R01 |
| 7.3 existence [H] | any admissible `I`, `J` | with the `sorry` body, `I = J` elaborates | vacuous or false | R01 |
| Repair of R01 | the same `⟨1⟩`, `⟨1,1⟩` | Tau Ceti `globalInvariants_rank`: ranks `1 ≠ 2` | records differ (exit 0) | R01 repair tested |
| 4.2 global square theorem [H] | ℚ: `a = −1`, `2`, `4` | `−1` nonsquare at all `p ≡ 3 (4)`; `2` nonsquare at `p ≡ ±3 (8)`; `4` square everywhere and in ℚ | consistent; = Milne VIII Thm 1.1 at `n = 2` | R04 (universe) |
| 4.2 route, steps 2–4 | real `v ∈ S`, `a < 0` | `E⊗ℝ = ℂ`, norms `ℝ_{>0}`; `i_v/α ∈ (ℝˣ)²` is a norm; at `v ∉ S` the algebra is split, so the norm map is onto the units | correct | none |
| 4.2 warning, `I_K = Kˣ·I_K^S` | ℚ, `S={∞}`, Milne's `I^S` | `i / ∏ p^{v_p(i_p)}` has unit finite components ⇒ identity true; with ideles trivial on `S`: `i_∞ = √2` needs `α = √2 ∉ ℚ` | false only under the undefined reading | R09 |
| Localized product formula [S] | ℚ: `(−1,−1)`; `(2,3)` | `(−1,−1)`: `∞: −1`, `2: (−1)^{ε(−1)²} = −1`, odd `p: 1` → `1`. `(2,3)`: `∞: 1`, `2: (−1)^{ω(3)} = (−1)^1 = −1`, `3: (2/3) = −1` → `1` | holds; = Milne V Ex. 5.4 | R03, R04 |
| Archimedean symbol [S] | `(2,−3)`, `(−2,3)`, `(−2,−3)` over ℝ | `a = 2 > 0`: `b = (x−√2y)(x+√2y)` solvable → `1`; `x²+2y² = 3` at `(1,1)` → `1`; `x²+2y² ≥ 0 ≠ −3` → `−1`; formula gives `1,1,−1` | holds | R03, R13 (no locator) |
| Complex symbol | `(i, −1)` | `i = ((1+i)/√2)²`, so `b = (x−√i y)(x+√i y)` is solvable → `1` | holds; one-step computation | R10 |
| Sign prescription [S] | ℚ, `b = −1`, `T = {2, ∞}` | `a = −1`: `(−1,−1)_∞ = −1`, `(−1,−1)_2 = −1`, `(−1,−1)_p = 1`; `b` nonsquare at 2 (`−1 ≡ 7 mod 8`) and at ∞ | witness exists; = Milne VIII Lemma 6.13 | R03 |
| Sign prescription, odd `T` | ℚ, `b = −1`, `T = {∞}` | product formula: `∏_v (a,−1)_v = 1` forces even support | `hpar` needed | none |
| Sign prescription, `b` a local square | `b = 2`, `v = 7` | `2 ≡ 3² mod 7` ⇒ `(a,2)_7 = 1` for all `a` | `hbf` needed | none |
| Sign prescription route, step 2 | `φ(i) = ∏(i_v, b_v)` | multiplicative in the first slot needs `comm` + `mul`; both are cited at :523 | correct | none |
| Binary [S] | `⟨1,1⟩`, `⟨1,−1⟩` over ℚ | `−d = −1` nonsquare at `p ≡ 3 (4)` ⇒ not locally isotropic, globally anisotropic; `⟨1,−1⟩` isotropic at `(1,1)` | correct; Milne VIII 3.5(b), `n = 2` | none |
| Ternary [S] | `⟨1,1,−3⟩`, `⟨1,1,−2⟩` over ℚ | `a = 3`, `d = −1`: `(−1,3)_3 = (−1/3) = −1` ⇒ `3` not a norm from `ℚ_3(i)` ⇒ anisotropic at 3; `2 = 1²+1²` ⇒ `(1,1,1)` isotropic | correct; Milne Prop 3.7(c) and Thm 3.1 | none |
| Quaternary, `d = [1]` step (42:12) [S] | `Q = U ⊥ ⟨d(U)⟩` | `Q` isotropic ⇒ `U` isotropic, or `U` represents `−d(U)` ⇒ `U = ⟨−d(U)⟩⊥P`, `d(P) = d(U)/(−d(U)) = [−1]` ⇒ hyperbolic | correct | none |
| Quaternary descent [S] | residual plane | `d(⟨ε,−dε⟩⊥P) = −d·d(P) = d` ⇒ `d(P) = [−1]` ⇒ `P` hyperbolic | correct | R03 (in Tau Ceti) |
| Descent, dimension witness | `⟨1,2⟩` over `ℚ(i)`, `E = ℚ(i,√2)` | `(a+bi)² = −2` forces `b² = 2` (no solution); over `E`, `−2 = (i√2)²` | witness correct | none |
| Descent, signed vs plain | `n = 4` | `(−1)^{n(n−1)/2} = (−1)^6 = 1`; README says `−1` | README false | R02 |
| 5.2 binary-complement trap | `⟨1,1⟩` over `ℚ_p`, `p ≡ 3 (4)` | `x²+y² ≡ 0 (p)` ⇒ `p ∣ x,y` ⇒ anisotropic; real: definite | infinite set | none |
| 5.5 HM isotropy [H] | rank 0; rank 1; `⟨1,1,−3⟩` | rank 0: no nonzero vector on either side; rank 1: anisotropic on both sides; `⟨1,1,−3⟩`: isotropic at ∞, anisotropic at 3, globally anisotropic | holds; Milne VIII Thm 3.5 | none |
| 0.2 without the real clause (wrong model) | `⟨1,1,1,1,1⟩` over ℚ | isotropic at every `p` (rank ≥ 5), anisotropic at ∞ and over ℚ | real clause load-bearing | none |
| 6.1 scalars [H] | `⟨1,1⟩`, `a = 3` and `5` | `3`: `v_3(x²+y²)` even, `v_3(3) = 1` ⇒ not represented at 3 nor over ℚ; `5 = 1+4` on both sides | holds | none |
| 6.2 forms [H] | `⟨3⟩` by `⟨1,1⟩` | same obstruction at 3 on both sides | holds | none |
| 6.3 HM isometry [H] | `⟨1,1,−1⟩` vs `⟨1,2,−2⟩`; `⟨1,1⟩` vs `⟨1⟩` | both `⟨1⟩⊥H`, equivalent on both sides; ranks 2 ≠ 1 on both sides | holds; Milne VIII Thm 6.3 | none |
| `LocallyEquivalent` without the real clause (wrong model) | `⟨1,1,1,1⟩` vs `⟨−1,−1,−1,−1⟩` | `d = [1]` both; Hasse `1` vs `(−1,−1)_v^6 = 1` at every `p`; real: positive vs negative definite | real clause load-bearing | none |
| 7.2 correction planes | `P = ⟨1,−β⟩`, `P' = ⟨α,−αβ⟩` | `d(P) = −β`, `d(P') = −α²β ≡ −β`; `s(P) = (1,−β) = 1`; `s(P') = (α,−α)(α,β) = (α,β)` | correct | R10 (Lean copies) |
| 7.2 parity of `R` | `R ⊆` finite places outside `T` | `∏_v s_v(W)s_v(U) = 1`, and the factors agree on `T` ⇒ `#R` even; `T` contains every archimedean place, so step 7's "two classes" is used only at finite places | correct | none |
| 9.3 `ℚ(√5)` record | `n = 3`, `d = [1]`, `p = 3, 1`, `s = −1` above 2 | 2 inert (`x²−x−1` has no root mod 2); real Hasse `q = 0 → 1`, `q = 2 → −1`; product `(−1)·1·(−1) = 1`; real signs `+`, `+` | admissible | none |
| Universe of suppliers | `card_ideleClassNormQuotient`, `hilbertProductFormula`, `isGlobalNorm_iff_…` vs 4.4 here | `K : Type` vs `{K : Type u_1}` | no transport target | R04 |
| Supplier labels | :105–108 vs :429 | "Tau Ceti's" vs "R Class Field Theory" | inconsistent | R08 |

## Not verifiable

- **O'Meara, *Introduction to Quadratic Forms*** (`omeara`, uncertified, paywalled). The locators 42:12, 58:7, 63:14, 65:15, 65:21, 66:1–66:6, 71:18–71:19a and 72:1 are cited by number only. I checked the mathematics of every sampled target directly (table above) and against the certified milne-cft text at the lines given in R13.
- **Serre, *A Course in Arithmetic*** (`serre`, uncertified). Cited for conventions only.
- **Lam, Neukirch, Cassels, and Milnor–Husemoller.** Listed under References with no locator and used by no sampled target. All are paywalled books, not in the manifest, and not requested.
- **Elaboration of #1200's files** was not run; R05 relies on reading them through `roadmaps show`.

## Source issues

- none new. The Milne VIII §3 issues recorded in earlier reviews still stand (the misprint "Theorem 1.1" for the Hasse norm theorem at milne-cft line 10777, and "Theorem 3.1b" for 3.5(b) at line 10788). I re-read both while checking the binary and ternary routes and am not repeating them as new entries.
