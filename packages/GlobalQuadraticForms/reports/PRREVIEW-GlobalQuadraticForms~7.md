# Review of GlobalQuadraticForms (pull request #1215 at 95ba181)

**Verdict:** needs changes

This pull request changes this folder in 20 README lines and 38 `Suggested.lean` lines, re-pointing citations after its own Class Field Theory and Quadratic Form Invariants rewrites. As the brief requires, this is a review of the whole folder at this head. Most of the defects below are already on main. Open pull request #1200 rewrites this folder into the form that R01–R02, R05–R06 and R12 ask for (see R10).

## R01 (P1) — `sorry`'d data makes the classification theorems prove `False`

- **Location.** `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean:188`, `:194` and `:243`: `localizeSquareClass`, `realSquareClassSign` and `globalInvariants` all have the body `sorry`. These are the gate's three `sorry-data` failures. They are used by `IsAdmissible` (`:225`) and by `globalInvariants_isAdmissible` (`:250`), `exists_globalForm_of_isAdmissible` (`:522`), `equivalent_of_globalInvariants_eq` (`:529`) and `equivalent_iff_globalInvariants_eq` (`:540`).
- **Claim.** Equal global invariants imply isometry (7.4 and 8.1).
- **Witness.** The body ignores the form, so `globalInvariants Q hQ = globalInvariants R hR` holds by `rfl`. For `⟨1⟩` and `⟨1,1⟩` over `ℚ`, `equivalent_of_globalInvariants_eq _ hQ _ hR rfl` gives `finrank ℚ ℚ = finrank ℚ (Fin 2 → ℚ)`, which proves `False` (probe elaborated at the pins).
- **Repair.**
  - Delete the block at `:184–246` (`SquareClass`, `localizeSquareClass`, `realSquareClassSign`, `realHasseSign`, `GlobalFormInvariants`, `HasseProductCompatible`, `IsAdmissible`, `globalInvariants`).
  - Import `TauCeti.NumberTheory.QuadraticForm.Global.Invariants` and `.FormInvariants`.
  - State 7.3, 7.4 and 8.1 against `QuadraticForm.globalInvariants` (`FormInvariants.lean:77`) and `TauCeti.NumberField.QuadraticForm.GlobalFormInvariants.IsAdmissible` (`Invariants.lean:178`).
  - Tested: `Q.Equivalent R ↔ Q.globalInvariants hQ = R.globalInvariants hR` and the existence statement elaborate against these carriers. For `⟨1⟩` and `⟨1,1⟩` the real records have ranks `1 ≠ 2` (closed by `simp`), so the refuting `rfl` no longer typechecks.

## R02 (P2) — `Suggested.lean` redeclares Tau Ceti's carriers and restates proved Tau Ceti theorems as `sorry`

- **Location.** `Suggested.lean:110–171` and `:297–403`.
  - Redeclared definitions: `atFinitePlace`, `atRealPlace`, `unitAtFinitePlace`, `unitAtRealPlace`, `IsLocallyIsotropic`, `LocallyEquivalent`, `LocallyRepresentsScalar`.
  - Theorems left `sorry` here although the pin proves them: `not_anisotropic_complex`, `equivalent_of_finrank_eq_complex`, `hilbertSymbol_real`, `hilbertSymbol_complex`, `finite_hilbertSymbol_ne_one`, `hilbertSymbol_localized_productFormula`, `exists_hilbertSymbol_eq_neg_one_iff`, `…_pair`, `globalInvariants_isAdmissible` and quaternary descent.
- **Claim.** The docstring at `:31` says "The supplier roadmaps own the declarations and this file consumes them."
- **Witness.** The pin has `QuadraticForm.atFinitePlace` (`Global/Localization.lean:90`), `QuadraticForm.IsLocallyIsotropic` (`Global/Predicates.lean:51`), `exists_hilbertSymbol_eq_ite` (`Global/SignPrescription.lean`) and `QuadraticForm.isAdmissible_globalInvariants` (`Global/ProductFormula.lean:117`). Six of the `sorry`'d theorems close with one `exact` (probe).
- **Repair.** Delete each declaration and import the Tau Ceti module instead, then state only the headlines the pin lacks (4.2, 5.5, 6.1–6.3, 7.3, 7.4/8.1, 8.3) on Tau Ceti's carriers. Tested: 4.2, 5.5, 7.3 and 8.1 elaborate in that form (probe). The pinned replacement for each declaration (Tau Ceti, paths under `TauCeti/`):
  - `atFinitePlace`, `atRealPlace`: `QuadraticForm.atFinitePlace`, `QuadraticForm.atRealPlace` (`NumberTheory/QuadraticForm/Global/Localization.lean:90`, `:96`).
  - `unitAtFinitePlace`, `unitAtRealPlace`: `HeightOneSpectrum.unitAtFinitePlace`, `TauCeti.unitAtRealPlace` (same file, `:43`, `:67`).
  - The three predicates: `QuadraticForm.IsLocallyIsotropic`, `LocallyEquivalent`, `LocallyRepresentsScalar` (`…/Global/Predicates.lean:51–147`).
  - `not_anisotropic_complex`, `equivalent_of_finrank_eq_complex`: `QuadraticForm.not_anisotropic_of_isSepClosed`, `QuadraticForm.equivalent_of_finrank_eq_of_isSepClosed` (`LinearAlgebra/QuadraticForm/SepClosed.lean:147`, `:74`).
  - `hilbertSymbol_real`, `hilbertSymbol_complex`: `TauCeti.hilbertSymbol_real` (`NumberTheory/HilbertSymbol/Archimedean.lean:59`), `TauCeti.hilbertSymbol_eq_one_of_isAlgClosed` (`…/IsAlgClosed.lean:36`).
  - `finite_hilbertSymbol_ne_one`: `TauCeti.hasFiniteMulSupport_hilbertSymbol_unitAtFinitePlace` (`…/Global/HilbertSymbol.lean:124`).
  - `hilbertSymbol_localized_productFormula`: `TauCeti.hilbertSymbol_productFormula` (`…/Global/ProductFormula.lean:67`).
  - `exists_hilbertSymbol_eq_neg_one_iff`, `…_pair`: `TauCeti.NumberField.QuadraticForm.exists_hilbertSymbol_eq_ite`, `exists_pair_hilbertSymbol_eq_ite` (`…/Global/SignPrescription.lean`).
  - `globalInvariants_isAdmissible`: `QuadraticForm.isAdmissible_globalInvariants` (`…/ProductFormula.lean:117`).
  - `not_anisotropic_of_not_anisotropic_baseChange_quaternary`: `QuadraticForm.anisotropic_baseChange_iff_quaternary` (`LinearAlgebra/QuadraticForm/QuaternaryDescent.lean:167`).

## R03 (P2) — The route suppliers exist only for `K : Type`; the statements use `K : Type u`, and no target transports between them

- **Location.** README 4.2 and 4.4 *Prerequisites* (`README.md:429–431`, `:520–525`). `Suggested.lean:269`: `variable {K : Type u}` for 4.2–4.4. This is inherited by 5.5–8.4, whose binary and ternary cases need 4.2 and 4.3.
- **Claim.** These statements are proved from `card_ideleClassNormQuotient`, `isGlobalNorm_iff_isLocalNormEverywhere` and `hilbertProductFormula`.
- **Witness.** The `#check` output shows that all three take `K : Type`, as do the pinned sign prescription and product formula (`SignPrescription.lean:72`, `ProductFormula.lean:61`). At `{K : Type u}`, `@card_ideleClassNormQuotient K` fails: "K has type Type u … expected Type" (probe).
- **Repair.** Either state Layers 3–8 for `K : Type`, as the pinned Layer 3–4 declarations already are. Or add a Layer 0 target, with its own *Needs:* line, that transports places, completions, localized forms, Hilbert symbols and invariant records along a ring isomorphism `K ≃+* K'` with `K' : Type`. Tested: at `K : Type` the norm index instantiates (probe).

## R04 (P2) — False claim that the signed discriminant differs from the plain one in dimension four

- **Location.** `README.md:605–606`: "changes it by `(-1)^{n(n-1)/2} = -1` in dimension four and breaks the computation". The same claim is in `Suggested.lean:386–387`.
- **Claim.** Hypothesis `hd` must use the plain discriminant, because the signed one differs by `-1` in rank four.
- **Witness.** `4·3/2 = 6` and `(-1)^6 = +1`. Tau Ceti's `RegularFormClass.signedDiscr_eq_sign_add_discr` adds `(4 choose 2) • [-1] = 6 • [-1] = 0`, so in rank four `d± = d`.
- **Repair.** Replace both passages with this: in dimension four `d± = d`, so the distinction is immaterial here. It matters in ranks 2 and 3; for example, for `⟨1,1⟩` the plain discriminant is `[1]` and the signed one is `[-1]`.

## R05 (P3) — Imports of other roadmaps' modules (gate: `imports`)

- **Location.** `Suggested.lean:4–7` imports `Completed.GlobalNumberFields.Suggested`, `Completed.NumberFieldArithmetic.Suggested`, `TauCetiRoadmap.ClassFieldTheory.Suggested` and `TauCetiRoadmap.QuadraticFormInvariants.Suggested`. Lines `:56–72` `#check` roadmap declarations.
- **Witness.** Gate rule `imports` fails on line 1. `#check` may only pin a library declaration.
- **Repair.** Import only `Mathlib` and the `TauCeti.*` modules used, and drop the `#check` block. This falls out of R02.

## R06 (P3) — `letI` in signatures (gate: `statement-hygiene`)

- **Location.** `Suggested.lean:119` (`atRealPlace`), `:322` and `:438`.
- **Repair.** These disappear under R02: Tau Ceti's `QuadraticForm.atRealPlace` sets the real algebra internally, and 6.2 becomes `Q.IsRepresentedBy R ↔ Q.LocallyRepresents R`.

## R07 (P3) — TeX outside a code span (gate: `tex`)

- **Location.** `README.md:507`: `ker φ = Kˣ · N_{E/K}(I_E).` The fence is indented inside list item 4, and the scanner reads it as prose.
- **Repair.** Write it as the inline span `` `ker φ = Kˣ · N_{E/K}(I_E)` ``.

## R08 (P3) — Process residue (gate: `residue`)

- **Location.** `README.md:907`: "Do not define a `Prop`-valued stand-in for the Witt ring".
- **Repair.** Delete the sentence. 8.3 already requires the supplier's `wittRing` carrier.

## R09 (P3) — Edit outside the pull request's folders (gate: `outside-folder`)

- **Location.** `Completed/LocalGaloisGroups/Suggested.lean`, 62 insertions and 50 deletions (renames to `TauCeti.ClassFieldTheory.*`).
- **Witness.** The brief names only ClassFieldTheory, QuadraticFormInvariants and this folder as the pull request's own.
- **Repair.** Name `Completed/LocalGaloisGroups` in the description as a consumer this pull request keeps building, or move the edit to its own pull request.

## R10 (P3) — Conflicting open pull request with no stated order

- **Location.** This folder's `README.md` and `Suggested.lean`.
- **Witness.** Overlaps: "#1200 and #1215 conflict in `TauCetiRoadmap/GlobalQuadraticForms/README.md`, `…/Suggested.lean`". At its head, #1200's `Suggested.lean` imports only `TauCeti.*` modules (lines 3–8). The description of this pull request names no order.
- **Repair.** State the order. If #1200 merges first, this pull request rebases and drops its hunks in this folder: #1200's file no longer imports the Class Field Theory or Quadratic Form Invariants modules that this pull request rewrites.

## R11 (P3) — Supplier contracts cite the wrong owners, sections or statements

- `README.md:99` and `:436–437` list `finiteLocalNormMap`, `infiniteLocalNormMap`, `IsFiniteLocalNorm` and `IsInfiniteLocalNorm` as Class Field Theory's. They are Tau Ceti's `TauCeti.GlobalNumberFields.*` (`NumberTheory/NumberField/LocalGlobal/Semilocal/Norm/LocalNorm.lean:57–85`), and the Class Field Theory head README never mentions the two maps.
- `README.md:64` cites `weakApproximation_denseRange` as "Layer 0.2". In Global Number Fields it is Layer 1 (`Completed/GlobalNumberFields/README.md:258`). Tau Ceti's own `TauCeti.GlobalNumberFields.weakApproximation_denseRange` (`Weak.lean:208`) is the declaration to cite.
- `README.md:467–470` and `Suggested.lean:294–296` say that every Layer 6C symbol theorem carries `IsNonarchimedeanLocalField`, so that `hilbertSymbol_comm` at a real place is "a type error". At the Quadratic Form Invariants head `hilbertSymbol_comm` needs only `[Invertible 2]`, and it elaborates over `ℝ` (probe).
- `README.md:306` says that `hilbertSymbol_unramified` makes `(unit, unit)_v = 1`. The supplier lemma assumes that the norms from `K(√Δ)` are exactly the elements of even valuation. The pinned lemma that does give `(unit, unit)_v = 1` is `TauCeti.hilbertSymbol_eq_one_of_valued_eq_one` (`Global/HilbertSymbol.lean:75`).
- `README.md:103` and `:431` say that `mem_range_ideleNormMap_iff` is stated against Global Number Fields' `ideleFiniteCoord`. At `Ideles/Norm/Range.lean:115` it uses Tau Ceti's `v.ideleFiniteCoord` and `v.ideleInfiniteCoord`.
- `localHasse_congr`, `signedDiscr` and `discr_mk` (`:123`, `:126`, `:293`, `:618`) are `TauCeti.RegularFormClass.*` and are not declared by Quadratic Form Invariants.
- **Repair.** Cite each one by its pinned owner and file, as above.

## R12 (P3) — The README plans as open targets work that is done at the pin, and says the pin lacks it

- **Location.** `README.md:184–187`: "At the inspected pin there is no unified number-field localization API … no carrier for admissible global invariant systems".
- **Witness.** `STATUS.md` records Layers 0–3, 4.1, 4.4, 4.5, 5.2–5.4, 7.1, 9.1, 9.4 and 9.5 as done in Tau Ceti. 4.3 is `TauCeti.ClassFieldTheory.exists_sq_sub_mul_sq_iff_forall_completion` (`ClassFieldTheory/Global/HasseNorm/Quadratic.lean`).
- **Repair.** Delete "What is missing". List each done target under the supplier contracts "From Tau Ceti", with its name and file, and keep as targets only what the pin lacks.

## R13 (P3) — Undefined `I_K^S` makes the 4.2 warning false under standard notation

- **Location.** `README.md:424–425`: "The identity `I_K = Kˣ · I_K^S` is false — already for `K = ℚ` and `S` the archimedean place".
- **Witness.** With Neukirch's S-ideles `∏_{v∈S} K_vˣ × ∏_{v∉S} U_v`, the identity holds for `ℚ`, because the class number is 1. It fails only if `I_K^S` means ideles with component 1 on `S`.
- **Repair.** Define it: "`I_K^S`, the ideles whose components at the places of `S` are 1". Then `ℚˣ → ℝˣ` is not onto, and the warning is true.

## R14 (P3) — README shape, routes, locators and process text

- The README is not in house shape:
  - no `**Summary.**`, no `## Scope and ownership`, and no `## Exact supplier contracts` with `From Mathlib`, `From Tau Ceti` and `From TauCetiRoadmap.X` subsections;
  - layers are `###` headings, with no `### Examples` or `### Dependencies`;
  - no definition (`atFinitePlace`, the four predicates, `GlobalFormInvariants`, `IsAdmissible`, `globalInvariants`) has an API list or `**Checks.**`.
- Mandatory routes: `:400` "It is the one route this roadmap accepts", and also `:19–20`, `:489`, `:551–552`, `:776` and the acceptance criteria `:996–998`.
- Process text and private references: `:178–180` and `:184` ("the inspected pin"); `:1008–1010` and `:1047–1049` ("private migration and provenance ledger"); checkboxes at `:984–1010`.
- `:738` names `TauCeti.NumberField.QuadraticForm.hasseMinkowski_equivalent`, which exists nowhere.
- Missing locators: the localized product formula (O'Meara 71:18 is not given at the claim), the archimedean symbol, 4.1, 4.5, 6.1, 8.2–8.4, and Lam, Cassels, Neukirch and Milnor–Husemoller, which are cited without any locator.
- **Repair.** Restructure to the house shape. Turn "Pin this proof" into "*Proof route:*". Delete the process text. Add a locator to each claim. Open alternatives exist: Milne VIII Thm 1.1 (p. 229) for 4.2, Thm 3.5 and Cor 3.6 (pp. 235–236) for 5.5 and 6.1.

## R15 (P3) — Padding in `Suggested.lean`

- **Location.**
  - Proved small computations or restatements: `localHasse_pair` (`:469`), `discr_correctionPlanes` (`:480`, closed by `simp`), `hilbertSymbol_one` (`:487`, which is `TauCeti.hilbertSymbol_one_left`) and `hilbertSymbol_neg_mul` (`:500`).
  - The 7.2 step `hilbertSymbol_neg_mul_real` (`:509`).
  - The boundary case `isSquare_of_isSquare_unitAtFinitePlace` (`:287`).
  - `equivalent_of_locallyEquivalent` (`:550`), which is `.2` of `hasseMinkowski_equivalent`.
  - The `example`s at `:79`, `:89` and `:566`.
- **Repair.** Delete them from `Suggested.lean`. The README keeps them as statements and as 8.4.

## Verified sound

- **Gate.** I reran it with the same failures. `outside-folder` lists 6 files; 5 of them are this pull request's own folders, which the brief names. `build=0` on the worker's run.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with 22 `sorry` warnings only.
- **Signatures.** One scratch file with `#check @` of all 40 declarations and the `IsAdmissible` constructor. Binders match the README, except that `globalInvariants` and `realSquareClassSign` dropped `[NumberField K]` (R01). `not_anisotropic_complex` carries an unused `hQ`; Tau Ceti's version needs none.
- **Depcheck.** `depcheck: 238 roadmaps, 2352 edges, 0 problem(s)`. The suppliers (Global Number Fields, Number Field Arithmetic, Class Field Theory, Quadratic Form Invariants) are on main.
- **Ownership.** No open roadmap owns Hasse–Minkowski or global classification. Class Field Theory's head (`README.md:178`) assigns them here. OrthogonalSpinGroups' anchor `#63-hasseminkowski-isometry` and ClassicalArithmeticCompletion's "layer 4 global square norm and approximation lemmas" resolve at this head.
- **Cross-roadmap citations resolved:**
  - Class Field Theory §3 and Layers 12–14;
  - Quadratic Form Invariants Layers 0, 1 (including Witt's extension theorem, line 593), 6A (local square theorem, line 1270), 6C and 6D, and its 16 consumer names;
  - Number Field Arithmetic 5.1 and 5.2 (`isNonarchimedeanLocalField_adicCompletion`, `completionAlgHom`);
  - Global Number Fields `IdeleGroup`, `IdeleClassGroup`, `ideleFiniteCoord` and `ideleInfiniteCoord`.
- **Library declarations opened at the pin** (Tau Ceti unless noted): `Global/Localization.lean:43,67,90,96`; `Predicates.lean:51–147`; `Invariants.lean:90,178`; `FormInvariants.lean:77`; `ProductFormula.lean:67,117`; `SignPrescription.lean` (`exists_hilbertSymbol_eq_ite`, `exists_pair_…`); `HilbertSymbol.lean:75,124`; `QuaternaryDescent.lean:117–172`; `SepClosed.lean:74,147`; `Archimedean.lean:59`; `IsAlgClosed.lean:36`; `HilbertSymbol/Basic.lean:272`; `RegularFormClass/Discriminant.lean:260`; `Ideles/Norm/Range.lean:115`; `LocalNorm.lean:57–85`; `HasseNorm/Basic.lean:154,170`; `HasseNorm/Quadratic.lean`; `Global/Reciprocity.lean:248`; `Hilbert/Reciprocity.lean:65`; Mathlib `NumberField.IdeleGroup.unitEmbedding`.
- **Sources read.** milne-cft, the only one of the cited works that can be read legally: VIII Thm 1.1 (milne-cft line 10384, p. 229), Thm 3.1 (line 10629, p. 234), Thm 3.5 (line 10686, p. 235), Cor 3.6 and Prop 3.7 (lines 10694–10706, p. 236), and the proof of 3.5(b) (lines 10772–10804, p. 237). They support 4.2, the binary step (3.7b with Thm 1.1), the ternary step (3.7c with the Hasse norm theorem) and the rank-at-least-five step, which approximates the vector before defining the scalar, as `README.md:646–663` requires.

### Adversarial table

| Statement | Instances tried | Values (left / right) | Result | Change |
|---|---|---|---|---|
| Localized product formula (4.4) | `ℚ`, `a=b=-1` | `(-1,-1)_2=-1`, `(-1,-1)_∞=-1`, odd p `1`; product `1` / `1` | holds | locator (R14) |
| Localized product formula | `ℚ`, `a=2`, `b=3` | `(2,3)_2=-1` (ω(3)=1), `(2,3)_3=(2/3)=-1`, ∞ `1`; product `1` / `1` | holds | — |
| Archimedean symbol (4.4) | `(-2,-3)`, `(-2,3)`, `(2,-3)` over ℝ; any pair over ℂ | `x²+2y²=-3` unsolvable → `-1`; `1+2=3` → `1`; `1-2·2=-3` → `1`; ℂ `1` / formula `-1, 1, 1, 1` | holds | locator (R14) |
| Archimedean symbol: "comm is a type error" | QFI `hilbertSymbol_comm` at ℝ | elaborates (exit 0) / claimed type error | **false** | R11 |
| Sign prescription (71:19a) | `ℚ`, `b=-1`, `T={2,∞}` | `a=-1`: `(-1,-1)_2=-1`, `(-1,-1)_∞=-1`, else `1` / pattern `T` | holds | — |
| Sign prescription | `ℚ`, `b=2`, `T={3,5}` | `a=15`: `(15,2)_3=(2/3)=-1`, `(15,2)_5=(2/5)=-1`, `(15,2)_2` exponent `7·0+0+1·28` even → `1` / pattern `T` | holds | — |
| Sign prescription, parity | `T={∞}`, `b=-1` | product formula forces even support / no `a` | hypothesis load-bearing | — |
| Sign prescription, `T=∅` | any `b` | `a=1`: `(1,b)=1` (`b=((b+1)/2)²-((b-1)/2)²`) / empty | holds | — |
| Binary (5.1) | `⟨1,-2⟩`, `⟨1,-4⟩` over ℚ | anisotropic at 3 (2 nonresidue) / not iso; `d=[-4]=[-1]` / hyperbolic | holds | — |
| Ternary (5.1) | `⟨1,1,-3⟩`, `⟨1,1,-2⟩` | 3 not a norm from `ℚ_3(i)` (odd valuation) / anisotropic; `2=1+1` / isotropic `(1,1,1)` | holds | — |
| Quaternary, `d=[1]` (42:12) | `⟨1,1,1,1⟩` ⊇ `⟨1,1,1⟩` | at 2 and ∞ both anisotropic; at 3 both isotropic | holds | — |
| Quaternary descent (58:7) | `⟨1,1,1,-7⟩`, `E=ℚ(√-7)` | anisotropic at 2 (7 ≡ 7 mod 8); 2 splits in E so `E_w=ℚ_2` / anisotropic over E | holds | — |
| Descent, rank-4 hypothesis | `⟨1,2⟩` over `ℚ(i)`, `E=F(√2)` | `-2` nonsquare in `ℚ(i)` / `-2=(i√2)²` | witness correct | — |
| Descent, "signed differs by -1" | rank 4 | `(-1)^(4·3/2)=(-1)^6=+1` / claimed `-1` | **false** | R04 |
| Descent, `hgen` | `[E:F]=2`, `s∉F` | `F(s)=E` forced / pinned theorem has no `hgen` | redundant (note) | — |
| Global square theorem (4.2) | `a=-1`, `16`, `2` over ℚ | `-1` nonsquare at all `p≡3 (4)` / not a square; `16=4²` / square; 8th-power analogue fails for 16 (Milne Ex 1.3) | holds | R03 |
| 4.2 warning `I_K=Kˣ·I_K^S` | `ℚ`, `S={∞}` | Neukirch S-ideles: true (h=1) / "trivial on S": false (`ℚ→ℝ` not onto) | ambiguous | R13 |
| HM isotropy (5.5) | ranks 0, 1; `⟨1,1⟩`, `⟨1,-1⟩`, `⟨1,1,-3⟩`, `5⟨1⟩`, `⟨1,1,1,1,-1⟩` | F/F, F/F, F/F (∞), T/T, F/F (3), F/F (∞), T/T | holds | — |
| HM, "all but one place" counterexample | `⟨1,1,1,7⟩` | `d=7` nonsquare at 7 and at 2 → isotropic; odd `p≠7` `s=1≠-1` → isotropic; ∞ anisotropic / anisotropic over ℚ | holds | — |
| Scalar rep (6.1) | `⟨1,1⟩`, `a=3, 5`; rank 0, `a=1` | 3: F / F (3); `5=1+4`: T/T; F/F | holds | — |
| Form rep (6.2) | `⟨1⟩→⟨1,1⟩`; `⟨3⟩→⟨1,1⟩`; dim 3 → dim 2 | T/T; F/F (3); F/F | holds | — |
| HM isometry (6.3) | `⟨1,1,-1⟩` vs `⟨1,2,-2⟩`; `⟨1,1,-3⟩` vs `⟨1,1,-1⟩`; `⟨1⟩` vs `⟨1,1⟩` | T/T (both `⟨1⟩⊥H`); F / F (differ at 3); F/F | holds | — |
| `equivalent_of_globalInvariants_eq` (Lean) | `⟨1⟩`, `⟨1,1⟩` over ℚ | hypothesis by `rfl` / gives `1 = 2` → `False` | **false** | R01 |
| Same, Tau Ceti carrier | same | rank `1` / rank `2` (`simp`) | hypothesis fails | repair tested |
| Real Hasse sign | `q=n-p=0,1,2,3,4` | `q(q-1)/2 = 0,0,1,3,6` / `C(q,2) = 0,0,1,3,6` | agree | — |
| Admissibility small ranks (3.2) | rank 1 `s=-1`; rank 2 `d=[-1]`, `s=-1` | empty product `=1`; `(a,-a)=1` / both excluded | holds | — |
| 9.3 `ℚ(√5)` system | `p=(3,1)`, `s=-1` at the place above 2 | finite `-1` × real `(+1)(-1)` = `+1`; disc signs `+,+` with `d=[1]` | admissible | — |
| Correction planes (7.2) | ℚ, `β=3`, `R={3,5}`, `α=5` | `d(P')=[-25·3]=[-3]=d(P)`; `(5,3)_3=(2/3)=-1`, `(5,3)_5=(3/5)=-1`, `(5,3)_2=(-1)^{2·1}=1` / flips exactly on R | holds | — |
| Witt kernel (8.2) | `⟨1,1⟩` over ℚ | hyperbolic at `p≡1 (4)`, not at 3 / not hyperbolic | holds | — |
| Universe of route inputs | `card_ideleClassNormQuotient` at `K : Type u` | type mismatch / used at `Type u` | **gap** | R03 |

## Not verifiable

- **omeara**: O'Meara, *Introduction to Quadratic Forms*, locators 42:12, 58:7, 63:14, 65:15, 65:21, 65:23, 66:1, 66:3–6, 71:18–19a and 72:1. The manifest settles it as uncertified (paywalled, DOI 10.1007/978-3-642-62031-7). I did not request it. Statements were checked mathematically and against milne-cft and the pinned Tau Ceti proofs instead.
- **serre**: Serre, *A Course in Arithmetic*, Ch. III–IV. Uncertified in the manifest.
- Lam (GSM 67), Cassels, Neukirch and Milnor–Husemoller are cited without locators (R14), so there is nothing to verify until locators are given.

## Source issues

- **Misprint** in milne-cft at VIII, proof of Thm 3.5(b), p. 237 (line 10777): the source says that ranks 3 and 4 follow from Prop 3.7(c, d) and Theorem 1.1; it should be the Hasse norm theorem, Theorem 3.1; affects the proof.
- **Misprint** in milne-cft at VIII, proof of Thm 3.5(b), p. 237 (line 10788): the source says that Theorem 3.1b is assumed for rank n−1; it should be Theorem 3.5(b); affects the proof.
