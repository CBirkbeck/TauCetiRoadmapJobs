# Review of IntegralLattices (pull request #1411 at a5227b0)

**Verdict:** needs changes

This pull request changes one hunk in this folder: `TauCetiRoadmap/IntegralLattices/Suggested.lean`
lines 1218–1297, which adapts three declarations to its Class Field Theory change. The folder
has not changed since the head the previous round read (`git diff cded4a23 HEAD` is empty
here). The branch forked from main at `eaf17b1`. Main then rewrote this roadmap in `47fc6a3`,
and the head still carries the older copy: README 2468 lines and `Suggested.lean` 1373 lines,
against main's 3092 and 873.

- **R01–R09** concern that stale copy and the pull request itself. R01 cures R02–R08.
- **R10** covers the two other open pull requests that change this folder.
  - #617's head already carries main's text plus repairs of most of main's defects (the Layer B
    native supply, the B3 display, the carrier display, the Allcock–Gal–Mark locator, the
    duplicated headlines). Those repairs are not restated here.
- **R11** is caused by this pull request's Class Field Theory change.
- **R12–R15** are defects in main's text that neither this head nor #617's head repairs.

## R01 (P1) — The folder is the stale copy, and its only hunk conflicts with main

- **Location.** `TauCetiRoadmap/IntegralLattices/Suggested.lean:1221–1297`, the whole diff in this
  folder: "`open TauCetiRoadmap.GlobalNumberFields`", "`TauCeti.GlobalNumberFields.NumberFieldOrder
  K := sorry`", "`⟨ClassFieldTheory.gal_ringClassField_equiv_pic K …⟩`".
- **Claim.** The branch cannot merge. Resolving the conflict toward the head would replace main's
  rewritten roadmap with the older version, which re-plans an existing roadmap. The hunk edits
  three declarations (`orderOfNonsquareBinaryDiscriminant`, `binaryRingClassField`,
  `gal_binaryRingClassField_equiv_pic`) that main's file does not have. Main's file imports no
  roadmap module, so it needs no consumer repair for the Class Field Theory change.
- **Witness.**
  - `git merge-tree --write-tree origin/main HEAD` prints "CONFLICT (content): Merge conflict in
    TauCetiRoadmap/IntegralLattices/Suggested.lean".
  - `git merge-base --is-ancestor 47fc6a3 HEAD` fails.
  - Main's `Suggested.lean` has no `ringClassField`.
- **Defects of the stale text in the sampled passages, which this repair also cures:**
  - "Positive definite, not definite" (head README 324–329) says that a negative definite form has
    an infinite sublevel set `{x | β x x ≤ C}`. In rank 0 the lattice is `{0}` and is vacuously
    negative definite (`IsNegDef := (−Q).PosDef`), so the set is finite. Main 270–277 restricts the
    claim to positive rank.
  - Head README 78 and 485 say that Theta Series imports `TauCetiRoadmap.IntegralLattices.Suggested`.
    Theta Series' `Suggested.lean` on main imports `Mathlib` and 11 `TauCeti.*` modules (lines
    1–12).
  - "Owned here, consumed there" (head 218–230) claims the carrier, the dual and the discriminant
    forms for this roadmap. They are native at the pin (`TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:63`).
- **Repair.** Merge `origin/main` and resolve this folder to main's files:
  `git checkout origin/main -- TauCetiRoadmap/IntegralLattices/README.md TauCetiRoadmap/IntegralLattices/Suggested.lean`.
  The pull request then changes nothing here except, optionally, R11's two sentences.
  - **Tested on scratch copies at this head's pins.** Main's `Suggested.lean` elaborates
    (`lake env lean`, exit 0) with 31 warnings, all `declaration uses 'sorry'`.
  - The dependency check on main's README prints `0 problem(s)`.
  - Main's copy has no `#NNN`, no sorried definition, no `example`, no roadmap import and no
    `set_option`.

## R02 (P1) — Gate `depcheck`: an upward edge to OrthogonalTamagawaAndLatticeMass, and the cycle it closes

- **Location.** `README.md:1762–1764`: "It is `OrthogonalTamagawaAndLatticeMass`'s first
  obligation, and `α_p` as defined above is exactly what it must be shown equal to". Also the
  table row at `README.md:2270`.
- **Claim.** The check reads these lines as a supply edge to a roadmap that comes later in the
  merge order (line 149) and that consumes this one.
- **Witness.** My run prints `UPWARD: IntegralLattices (on main) -> OrthogonalTamagawaAndLatticeMass (#149)
  at README lines [1763, 2270]`, `CYCLE among: IntegralLattices, OrthogonalTamagawaAndLatticeMass`
  and `depcheck: 238 roadmaps, 2331 edges, 2 problem(s)`.
- **Repair.** R01. On main's README the check prints `depcheck: 238 roadmaps, 2334 edges, 0 problem(s)`.

## R03 (P2) — Gate `sorry-data`: twelve sorried definitions, five of which restate Tau Ceti

- **Location.** `Suggested.lean` lines 133, 137, 141, 145, 188, 212, 244, 248, 293, 340, 698 and
  1233. For example, line 212 reads "`noncomputable def expCircle (x : AddCircle (1 : ℚ)) : ℂ := sorry`".
- **Claim.** Sorried data is forbidden. Five of these definitions duplicate definitions that
  exist at the pin.
- **Witness.** At Tau Ceti `2fd255d`:
  - `IntegralLattice.scale` (`LinearAlgebra/IntegralLattice/Scaling.lean:76`), against `formTwist`
    at line 133;
  - `TauCeti.expCircle` (`Analysis/SpecialFunctions/Complex/Circle/Basic.lean:60`);
  - `FiniteQuadraticModule.gaussSign` (`LinearAlgebra/FiniteBilinearModule/GaussSum.lean:514`);
  - `IntegralLattice.localizationToCompletion` (`NumberTheory/IntegralLattice/Localization/Basic.lean:154`);
  - `QuadraticOrder.numberFieldOrder` (`NumberTheory/QuadraticOrder/Field.lean:39`), against the
    hunk's `orderOfNonsquareBinaryDiscriminant`.
- **Repair.** R01. Main's file has no sorried definition.

## R04 (P3) — Gate `sorry-examples`: 27 admitted examples

- **Location.** `Suggested.lean:445–1320`. For example, line 466 is "`example : (CartanMatrix.E 8).det = 1 :=`"
  closed by `sorry`.
- **Witness.** Gate rule `sorry-examples`, 27 hits. Main's file has no `example`.
- **Repair.** R01.

## R05 (P3) — Gate `imports`: seven roadmap modules imported, 34 roadmap declarations `#check`ed

- **Location.** `Suggested.lean:5–11`, from "`import Completed.IntegralLattices.Suggested`" to
  "`import Completed.OrthogonalSpinGroups.Suggested`". Two of these imports are this pull request's
  own Class Field Theory and Quadratic Form Invariants files.
- **Witness.** Gate rule `imports`. `grep -c '^#check'` gives 34. Main's file imports `Mathlib` and
  twenty `TauCeti.*` modules only, and has no `#check`.
- **Repair.** R01.

## R06 (P3) — Gate `prnum`: pull-request numbers in the README

- **Location.**
  - `README.md:7`: "interface already merged in upstream PR #200". Also line 273.
  - `#246` and `#255` appear at lines 40–41, 89, 117, 119, 146, 148, 480, 481, 1707, 1933 and
    2386.
- **Witness.** Gate rule `prnum`. Main's README has no `#NNN`.
- **Repair.** R01.

## R07 (P3) — Gate `residue`: process words in the README

- **Location.**
  - `README.md:169`: "Nothing here is a stand-in for it". Also line 478.
  - "reviewed" at lines 6, 89, 272, 312, 352, 365, 574, 595, 642 and 720.
- **Witness.** Gate rule `residue`, 2 hits. Main's README passes the rule.
- **Repair.** R01.

## R08 (P3) — Gate `statement-hygiene`: the hunk's theorem concludes `Nonempty` of available data

- **Location.** `Suggested.lean:1291–1297`: `gal_binaryRingClassField_equiv_pic` concludes
  "`Nonempty ((binaryRingClassField … ≃ₐ[K] binaryRingClassField …) ≃* TauCeti.GlobalNumberFields.Pic …)`".
- **Witness.** At this head, Class Field Theory's `gal_ringClassField_equiv_pic` is a named
  `MulEquiv`, `(TauCeti.ClassFieldTheory.ringClassArtinEquiv O).symm`
  (`TauCetiRoadmap/ClassFieldTheory/Suggested.lean:741–744`). The hunk wraps it in `⟨…⟩`.
- **Repair.** R01. Main has no such theorem.

## R09 (P3) — A change outside the folders the brief names: `Completed/LocalGaloisGroups/Suggested.lean`

- **Location.** `Completed/LocalGaloisGroups/Suggested.lean`, 2 lines changed (`git diff --stat
  origin/main...HEAD` outside the three named folders).
- **Claim.** The description names this folder as one of the pull request's own, but the board's
  brief names only Class Field Theory, Integral Lattices and Quadratic Form Invariants. Neither
  the worker's gate nor mine lists the file under `outside-folder`. I report it because the brief's
  rule covers it, not because a scanner caught it.
- **Repair.** Either have the board record `Completed/LocalGaloisGroups` as a folder of this pull
  request, or move the two lines into a pull request of their own. Nothing changes in this folder.

## R10 (P3) — #1797 and #617 change this folder; no order is stated for #1797, and #617's repairs must not be duplicated

- **Location.** The description's merge-order paragraph names #617, #1215, #1410 and #1474, and
  not #1797.
- **Witness.**
  - The overlap report says "#1411 and #1797 conflict in `TauCetiRoadmap/IntegralLattices/Suggested.lean`,
    `TauCetiRoadmap/QuadraticFormInvariants/README.md`, `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean`".
  - It also lists #617 as conflicting in this folder's `Suggested.lean`.
  - #617's head (`de94f01`) carries main's text with these repairs, all checked by me at the pin
    (*Verified sound*):
    - Layer B is cited as native, with `posDefProperClassEquivPic`, `properClassEquivNarrowPic`,
      `posDefProperClassEquivGal` and `QuadraticOrder.numberFieldOrder`.
    - The B3 display reads "primitive positive definite forms" (its README 1305).
    - The carrier display has `le_dual` (236).
    - The 3E locator reads "Theorems 6.2 and 6.3, p. 20, and Corollary 6.4, p. 21" (908).
    - The five headlines that close in one term (*Verified sound*, padding probe) are deleted.
- **Repair.**
  - After R01 this pull request has no change in this folder, so it should not repeat #617's edits.
  - State in the description that #1797 rebases onto this pull request, or the reverse. The
    Quadratic Form Invariants conflict remains in either case.
  - State that this folder's text lands with #617.

## R11 (P3) — This pull request's Class Field Theory change falsifies main's ring-class-field contract

- **Location.** Main `README.md:479`: "⚠ Each of these takes an order in a number **field** together
  with `Module.finrank ℚ K = 2`". The same sentence about `ringClassField` is at main 1220–1222.
  The head copy says it at README 478 and 1114–1116.
- **Claim.** After this pull request merges, the cited `ringClassField`, `ringClassArtinMap` and
  `gal_ringClassField_equiv_pic` take only `O : NumberFieldOrder K`, and the last of them is a
  `MulEquiv`, not a theorem. Both sentences become false. The conclusion they support, that
  `ℚ × ℚ` cannot be supplied, still holds through `[Field K] [NumberField K]`.
- **Witness.**
  - At this head, `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:727, 734, 741` re-export Tau Ceti's
    `TauCeti.ClassFieldTheory.ringClassField O` and `(ringClassArtinEquiv O).symm` with no degree
    binder.
  - On main, Class Field Theory's `Suggested.lean:4318–4319` reads
    `ringClassField (O : …) (hK : Module.finrank ℚ K = 2)`.
- **Repair.** In both places, write that each takes a `NumberFieldOrder K` of a number field `K`, so
  `[Field K]` and `[NumberField K]`, with no degree hypothesis, and that B1's nonsquare
  constructor supplies the quadratic `K`. Cite the native
  `TauCeti.ClassFieldTheory.ringClassField` and `ringClassArtinEquiv`
  (`TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RingClass/Field.lean:111, 178`). This is the
  wording #617's head has at its README 468.
  - Either carry those two sentences here, word for word, so that the rebase is trivial, or state
    in the description that #617 merges before this pull request.

## R12 (P3) — 3C Check: the stated reason is false, because 3 and 12 lie in one square class

- **Location.** Main `README.md:824–827`: "a splitting `⟨1⟩ ⊕ ⟨3⟩` would have determinant class
  `3 ≠ 3·4 = 12` and is wrong." #617's head has the same text at its README 878.
- **Claim.** `12/3 = 4 = 2²`, a unit square in `ℤ₃`, so the two determinants agree in
  `ℚ₃ˣ/(ℚ₃ˣ)²`. A Check that compared determinant classes would accept `⟨1⟩ ⊕ ⟨3⟩`. The conclusion
  is right for another reason.
- **Witness.** `A₂` at 3 is `⟨2⟩ ⊕ ⟨6⟩` (basis `e₁, e₁ + 2e₂`, change of basis of determinant 2, a
  3-adic unit). Its constituents have unit determinants `2` and `2`, and those of `⟨1⟩ ⊕ ⟨3⟩` are `1`
  and `1`. Since `(2|3) = −1`, 3C's Jordan invariants differ at both scales.
- **Repair.** Replace the clause by "would have constituent unit determinants `1` and `1` against
  `2` and `2`, with `(2|3) = −1`, although the total determinants `3` and `12` lie in one square
  class; so the total determinant does not detect the error, and the constituent data do".

## R13 (P3) — 3E Check "Oddity fusion" exhibits no fusion

- **Location.** Main `README.md:867–869`: "Oddity fusion: `⟨1⟩ ⊕ ⟨3⟩ ≅ ⟨5⟩ ⊕ ⟨7⟩` (3B) has the
  single symbol `1_4^{−2}`". #617's head has the same text at its README 919.
- **Claim.** Both sides are a single unimodular Jordan constituent, so the Check only says that the
  oddity of one constituent is the trace of any diagonalization. A canonical form without oddity
  fusion, which compares each constituent's oddity separately, passes it too. Fusion concerns
  adjacent type I constituents of one compartment (`allcock-gal-mark2016` lines 857–858: giver
  permutation and conversion change only individual oddities, not compartment oddities).
- **Witness.** `⟨1⟩ ⊕ ⟨14⟩ ≅ ⟨7⟩ ⊕ ⟨2⟩` over `ℤ₂` is a genuine instance:
  - The basis `e₁ + e₂`, `−14e₁ + e₂` has Gram `diag(15, 210)`, and the change of basis has
    determinant 15, a unit.
  - `15/7 ≡ 1` and `105 ≡ 1 (mod 8)`, so `⟨15⟩ ≅ ⟨7⟩` and `⟨210⟩ ≅ ⟨2⟩`.
  - The symbols `1_1^{+1} 2_7^{+1}` and `1_7^{+1} 2_1^{+1}` have equal signs, individual oddities
    `1, 7` against `7, 1`, and compartment oddity `0` in both.
- **Repair.** Replace the Check by this pair, saying that the per-constituent oddities differ and
  only the compartment oddity is an invariant. Keep `⟨1⟩ ⊕ ⟨3⟩ ≅ ⟨5⟩ ⊕ ⟨7⟩` under 3B, where it
  already appears.

## R14 (P3) — 3G Check: `1_1^{−1} 3^{+1}` does not show that the oddity formula is needed

- **Location.** Main `README.md:904–906`: "`1_1^{−1} 3^{+1}` fails the oddity formula, so both
  clauses are needed." #617's head has the same text at its README 963.
- **Claim.** A rank-one 2-adic constituent `⟨u⟩` has sign `+` exactly when `u ≡ ±1 (mod 8)`, and
  its oddity is `u mod 8`. So `1_1^{−1}` is already ill-formed under the local compatibility of
  determinant and oddity that 3G lists first. The example fails both clauses and does not isolate
  the oddity formula.
- **Witness.**
  - `1_5^{−1} 3^{+1}` passes every local clause: `5 ≡ −3` matches sign `−`, the sign matches
    `det = 3 ≡ 3 (mod 8)`, and the unit part `1` at 3 gives `+`.
  - It fails only the oddity formula: `1 + 2 = 3 ≢ 5`.
  - The well-formed symbol is `1_3^{−1} 3^{+1}`, with `1 + 2 = 3`.
- **Repair.** Replace `1_1^{−1} 3^{+1}` by `1_5^{−1} 3^{+1}` in the Check.

## R15 (P3) — The Theta Series consumer contract claims imports that Theta Series does not make

- **Location.** Main `README.md:60` ("it is a **consumer** of Layers 1, 2 and 6 here"); 190–195
  ("From this roadmap it takes the generator classification … (1G), Milgram's theorem … (1I),
  Jordan splittings and the genus (Layer 3), Nikulin's existence theory (Layer 5)"); 487–488; and
  the 8S rows 1G and 1H, 1I (main 2609–2610). #617's head has the same text at its README 64, 192–198
  and 2794–2795.
- **Claim.** A supplier contract stated from the supplier side that the consumer does not sign.
  Theta Series consumes only 6D from this roadmap and states the rest is not needed.
- **Witness.** Theta Series' README on main:
  - line 143: "none of it is needed here except its 6D";
  - lines 161–163: "8E consumes its 6D, and no other milestone here consumes anything of it";
  - its Milgram formula (6C there) is its own, proved by theta asymptotics.
- **Repair.**
  - Say that Theta Series consumes 6D (and may consume 6E) from this roadmap, and the native
    foundation directly from Tau Ceti.
  - Reduce 8S to the native row and the 6D row.
  - Drop "Layers 1, 2 and 6", "1G", "1I", "Layer 3" and "Layer 5" from lines 60, 190–195 and
    487–488.

## Verified sound

**Change set and merge state.**
- `git diff origin/main...HEAD -- TauCetiRoadmap/IntegralLattices` is the single hunk of R01.
- `git diff cded4a23 HEAD -- TauCetiRoadmap/IntegralLattices` is empty.
- Outside the three folders the brief names, the diff is R09's file.

**Gate, my run** (`gate … --base origin/main`):
- `prnum=2 sorry-data=12 sorry-examples=27 residue=2 imports=1 statement-hygiene=1 depcheck=2`,
  as the worker found.
- `outside-folder=5` lists only the Class Field Theory and Quadratic Form Invariants files, which
  the brief names as this pull request's own.
- Every other counter is 0. FAIL.

**Dependency check:**

```text
head README:  UPWARD: IntegralLattices (on main) -> OrthogonalTamagawaAndLatticeMass (#149) at README lines [1763, 2270]
              CYCLE among: IntegralLattices, OrthogonalTamagawaAndLatticeMass
              depcheck: 238 roadmaps, 2331 edges, 2 problem(s)
main README:  depcheck: 238 roadmaps, 2334 edges, 0 problem(s)
```

**Elaboration** (`lake env lean`, at this head's pins, Tau Ceti `2fd255d`, Mathlib `1b1ccf4`):
- Head `Suggested.lean`: exit 0, 69 warnings, all `declaration uses 'sorry'`, plus the output of the
  34 `#check` lines. No error.
- Main's copy: exit 0, 31 warnings, all `sorry`.

**Signatures.** I appended `#check @name` for every declaration to a copy of each file and
elaborated each copy once.
- **Main.** All 65 declarations elaborated. Compared with the README:
  - `vanDerBlij` carries `[FiniteDimensional ℚ V] [L.IsNondegenerate]`.
  - `localDensityCount_eq_of_odd_of_not_dvd` uses `n * (n - 1) / 2` only under `0 < n`.
  - `exists_primitiveEmbedding_iff` uses `lp - S.sigPos` only under `S.sigPos ≤ lp`.
  - `soEuclideanMeasure` keeps its `ContMDiff` and injectivity binders.
  - No binder was lost, and nothing changed.
- **Head.** All 68 extracted names elaborated, exit 0. The hunk's `binaryRingClassField` composes
  with `ClassFieldTheory.ringClassField (O)` with no degree argument.

**Padding probe** (copy of main's file, five native imports added). These five sorries close in
one term or one `simp`, and the `sorry` warnings drop from 31 to 26 with exit 0:
- `vanDerBlij` by `simpa [integralNorm_apply] using TauCeti.IntegralLattice.vanDerBlij L hU hw`;
- `milgram` by `simp [gaussSign_discriminantQuadraticModule_eq_sigPos_sub_sigNeg L hL]`;
- `infinite_isometry_of_isIndefinite` from the native theorem with `finrank_carrier`;
- `exists_isEven_isUnimodular_isPosDef_iff` and `natCard_isometry_typeE₈RootLattice` by the native
  terms.

None of the five is in #617's `Suggested.lean`, which is why this is under R10 and not a finding
here.

**Seeded sample**, each read at main's text (and at the head's where it differs):

| Target | Verified against | Result |
| --- | --- | --- |
| Owned there, and not consumed here | Theta Series README 54–76 (Layers 1–8 owned there) | sound |
| The bridge is theirs | Theta Series Layer 2, `ratModel` (its README 518–559) | sound |
| The bilinear form is the primary datum | `quadraticForm`, `quadraticForm_apply` (`= integralNorm x / 2`), `isEven_iff_exists_polarBilin_eq_integralForm` (`IntegralLattice/Quadratic.lean:34, 54`) | sound |
| Positive definite, not definite | computation (table) | main sound; head false at rank 0 (R01) |
| Rational ambient space and abstract inputs | `ofIntegralForm` on `ℚ ⊗[ℤ] M` with `B.baseChange ℚ` (`Rationalization.lean:118`) | sound |
| Discriminant forms | `discriminantQuadraticMap` via the half-norm (`Discriminant/Quadratic.lean:122`) | sound |
| Finite modules | `IsNondegenerate := Function.Bijective A.pairing` into `CharacterModule` (`Basic.lean:78, 142`); quadratic `IsLagrangian := IsIsotropic ∧ bilinear IsLagrangian` (`Quadratic.lean:727`); `IsMetabolic` (`Metabolic.lean:29`) | sound |
| Two invariants with different names | `gaussSign`: `G(q) = √#A · e^{2πik/8}` (`GaussSum.lean:514`) | sound |
| Genus symbols | `allcock-gal-mark2016` lines 58–76 (p. 2: sign `±1`/`±3 mod 8`, type, oddity), 686 (Thm 5.1, p. 16), 849, 864, 917 (Thms 6.2, 6.3, Cor. 6.4, pp. 20–21), 919–924 (SPLAG's error) | sound; main's 3E locator "Theorem 5.1" names the unimodular theorem (the head's gives none), repaired at #617 (R10) |
| Nikulin's notation | computation only (*Not verifiable*) | sound on `⟨2⟩`, `⟨10⟩`, `ℤ/3` |
| The character of `ℚ/ℤ` | `TauCeti.expCircle`, `r ↦ e^{2πir}` (`Circle/Basic.lean:60`) | sound |
| Mass | `mass`, `properMass` (`Mass.lean:91, 100`); `conway-sloane-mass1988` waived | sound |
| B3 | computation | split branch sound; display missing "positive definite", repaired at #617 (R10) |
| B4 | computation; Cox 3.9 uncertified | sound |
| B8 | computation | sound |

**Adversarial pass.** Values were computed by hand and, for the determinants, automorphism groups,
reduced forms, Gauss sums and density counts, by a brute-force script in exact arithmetic.

| Statement | Instances | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Owned there | `E₈` roots | `r_{E₈}(2) = 240` roots `= 240·σ₃(1)` | pass | none |
| Consumed there, 8S | Theta Series 143, 161 | IntegralLattices lists 1G, 1I, L3, L5, 6D; Theta Series takes 6D only | fails | R15 |
| Primary datum | `⟨2⟩`; `⟨1⟩` | `Q x = x²`, `polarBilin Q x x = 2x² = B(x,x)`; `B(1,1) = 1 ∉ 2ℤ`, no `Q` | pass | none |
| Positive definite, not definite | `E₈(−1)` with `C = 0, −10`; rank 0 | all of `E₈(−1)`, and still infinite since norms tend to `−∞`; `{0}` | main pass, head false at rank 0 | R01 |
| Rational ambient space | `⟨2⟩ = ℤe` | `ℚ ⊗ ℤ ≅ ℚ`, `B(x,y) = 2xy` | pass | none |
| Discriminant forms | `A₂`; `⟨1⟩` | `x = (2e₁+e₂)/3`, `B(x,x) = 2/3`, `q = 1/3`; odd: `q(x+e) − q(x) = B(x,e) + 1/2 ∉ ℤ`, excluded | pass | none |
| Finite modules | `A₁ ⊕ A₁` | `H = ⟨(1,1)⟩ = H^⊥`, `b|_H = 0`, `q(1,1) = 1/2`: bilinear Lagrangian, not quadratic | pass | none |
| Two invariants | `⟨2⟩`, `A₂`, `u(2)`, `v(2)` | `G = 1+i, i√3, 2, −2`; signs `1, 2, 0, 4` | pass | none |
| Genus symbols, 3B/3E sign walking | `⟨1⟩ ⊕ ⟨4⟩` | `P = !![1,−4;1,1]`, `det P = 5`, `PᵀGP = diag(5, 20)`; oddity totals `2 ≡ 10` | pass | none |
| 3E oddity fusion | `⟨1⟩⊕⟨3⟩`; `⟨1⟩⊕⟨14⟩` | one constituent; `diag(15, 210)`, `det P = 15`, compartment oddity `0 = 0` | vacuous | R13 |
| 3G oddity formula | `⟨3⟩`, `⟨5⟩`; `1_1^{−1}`, `1_5^{−1}` | `1+2 = 3`, `1+4 = 5`; `1_1^{−1}` locally ill-formed, `1_5^{−1}` fails only `3 ≢ 5` | Check does not isolate | R14 |
| 3C | `A₂` at 3 | `⟨2⟩⊕⟨6⟩`, total det `12 = 3·2²`, same class as `3`; constituents `2, 2` against `1, 1` | reason false | R12 |
| 3F, 3H | `⟨1⟩⊕⟨5⟩`, `!![2,1;1,3]` | over `ℤ₅` `⟨2⟩⊕⟨10⟩`, `(2|5) = −1`; `(2,10)₂ = (2,10)₅ = −1` | pass | none |
| 3I | `U`, `⟨1⟩`, `⟨2⟩`, `⟨1⟩⊕⟨2⟩` | `N = 2, 1, 2, 2`; `N_Q − N_M = 2−0, 2−1, 3−1, 7−5`; `U` counts mod `2^r`: `6, 16, 32`, stable `α₂ = 4` | pass | none |
| Nikulin's notation | `⟨2⟩`, `⟨10⟩` over `ℤ₂`; `⟨3u⟩` over `ℤ₃` | `q = 1/4` both, dets ratio `5`, nonsquare; `q = 2u/3` distinct for `u = 1, 2` | pass | none |
| Character | `⟨2⟩` | `q = 1/4 ↦ e^{πi/2} = i` | pass | none |
| Mass | `A₂`; rank 1; rank 0 | `m = 1/12`, `m⁺ = 1/6`; `1/2`, `1`; `1`, `1` (`m⁺ = 2m` fails only in rank 0) | pass | none |
| B1 | `A₂`; `x²+y²` on `⟨2e₁, e₂⟩` | `N = 2x²−2xy+2y²`, content 2, `Δ = −3`, `disc N = −12 = −4·3`; `4x²+y²`, content 1 | pass | none |
| B2 | `Δ = −3`, `−4`, `−12`, `−23`; `Δ = 12` | reduced `(1,1,1)`; `(1,0,1)`; `(1,0,3)`; `(1,1,6), (2,±1,3)`; `x²−3y² = −1` impossible mod 3 | pass | none |
| B3 display | `Δ = −4` | `±(x²+y²)`: 2 primitive proper classes, `#Pic ℤ[i] = 1`; positive definite: 1 | fails as written | R10 (#617) |
| B3 split | `m = 5`; `m = 8` | `φ = 4`, squares `{1,4}`, `#{t²=1} = 2`, base 2, 2 genera; `φ = 4`, squares `{1}`, `#{t²=1} = 4`, base 1, 4 genera | pass | none |
| B4 | `A₂`, `!![4,1;1,6]`, `!![2,1;1,12]`, `U`, `I₂` | `(|O|,|SO|) = (12,6), (2,2), (4,2), (4,2), (8,4)`; second basis vector of `!![4,1;1,6]` forces `x ∈ {0, 1/2}` | pass | none |
| B8 | `A₂`; genus of `!![4,1;1,6]` | `1/12`; `h⁺ = 3, a = 1, w = 2`: `1/4 + 1/2 = 3/4 = h⁺/(2w)`, against `h/(2w) = 1/2` | pass | none |
| B6/B7 | `x²+y²`; `x²−3y²`; `U` | `2π/4 = π/2`; `log(2+√3) ≈ 1.317`; split quotient infinite, modulus kernel volume 1 | pass | none |
| 1G | `(ℤ/2)²⊕ℤ/3`; `b₁⊕b₁`, `b₂⊕b₂` on `(ℤ/3)²` | `l = 2`; dets `1, 4` squares mod 3, `(2|3) = −1` | pass | none |
| 1H `nonempty_isometry_iff_gaussSign_eq` | `u(2)`, `v(2)`; `q₁(2)`, `q₅(2)`; `q^{(3)}_1(3)`; `q^{(5)}_{1,2}(5)`; `q^{(7)}_1(7)` | same pairing, signs `0 ≠ 4`; `1/4 ≡ 5/4`; `1+2e(2/3) = −i√3`, sign `6 = −2`; `G = −√5, √5`: signs `4, 0 = −4, −4+4`; `i√7`: `2 = −6` | true; formula `k²(1−p)+4kη` holds | R10 (#617) |
| 1I `milgram` | `⟨2⟩`, `⟨−2⟩`, `A₂` | `1 = 1`, `−1 ≡ 7`, `2 = 2` | true; one `simp` | R10 (#617) |
| 1L `vanDerBlij` | `⟨1⟩`; `⟨2⟩`; `I₈` | `w² ≡ 1`; `2k²` even against 1 (needs unimodular); `8 ≡ 8` | true; one term | R10 (#617) |
| 2F | `⟨a⟩`; `A₂`; `2ℤ⁵+ℤ𝟙` | `2√a ≤ 2√a`; `6.28 ≤ 6.93`; det 256, `λᵢ = 4`, `168.4 ≤ 512` | pass | none |
| 2G `finite_classes_of_posDef` | rank 2, det 3; rank 1, `d ≤ 0` | `[1,0;0,3]`, `[2,1;1,2]`; none | pass | none |
| 4B | `⟨1⟩` | `O(V_p) = K_p = {±1}`; double coset trivial, one class | pass | none |
| 4F | `U ⊕ ⟨1⟩`; `U` | infinite; `|O(U)| = 4`, excluded by rank `≥ 3` | true; one term | R10 (#617) |
| 5A | `E₈²`, `D₁₆⁺`; `I₈` | both `(16,0,0)`, `A = 0`; odd, outside | pass | none |
| 5B `exists_evenLattice_of_lt` | `q = 0`, `(8,0)`; `q_{⟨2⟩}`, `(2,1)` | `l = 0 < 8`, `8 ≡ 0`: `E₈`; `l = 1 < 3`, `1 ≡ 1`: `⟨2⟩ ⊕ U` | pass | none |
| 5G | `(1,0)` into `(1,1)` | `0 = 0`, `1 ≤ 1`, `2 ≤ 2`; `⟨2k⟩ ↪ U` by `(1,k)`, primitive | pass | none |
| 6A | `U⊕E₈⊕E₈(−1)`; `U`, `⟨1⟩⊕⟨−1⟩` | `(9,9)`, so `U⁹`; parity separates | pass | none |
| 6B | `n = 0, 4, 8` | zero lattice; `D₄` det 4; `E₈` | true; one term | R10 (#617) |
| 6C | `I₉`, `E₈⊕I₁`; `D₁₂⁺` | 18 and 2 vectors of norm 1; `h² = 3`, odd, minimum 2 | pass | none |
| 6D | `d16PlusGram` | symmetric, det 1, even diagonal, leading minors `4, 8, …, 60, 1`, all positive; `A₁₅` variant `16(4 − 15/16) = 49` | pass | none |
| 6G | `E₈` | `240·126·23040 = 696729600`; native `card_isometry_typeE₈RootLattice` | true; one term | R10 (#617) |
| 7C | `U` at 3; `I₂` at 3, 5; `⟨1⟩` at 3 | counts `4, 12` against `3^r·4/3`; `8` against `3·8/3` (`ε = −1`) and `5·8/5` (`ε = +1`); `2` | pass | none |
| 7E | `n = 0, 1, 2` | `O(0)`: 1; `O(1)`: `2·1`; `SO(2)`: `2π` | pass | none |
| 9B | `E₈`, `S = {E₈}` | `m = 1/696729600`, sum equal, complete | pass | none |
| Class Field Theory contract | this head, main | no degree binder at head 727; `hK` at main 4318 | prose false after merge | R11 |
| Hunk | `binaryRingClassField` | elaborates; `Nonempty` drops the named `MulEquiv` | data lost | R01, R08 |

**Library declarations opened** (Tau Ceti `2fd255d`, under `TauCeti/`):
- **The carrier and its conventions.**
  - `IntegralLattice` (`LinearAlgebra/IntegralLattice/Basic.lean:63–73`, fields `isLattice`,
    `isSymm`, `le_dual`) and `finrank_carrier` (126).
  - `quadraticForm` (`Quadratic.lean:34`), `ofIntegralForm` (`Rationalization.lean:118`) and
    `discriminantQuadraticMap` (`Discriminant/Quadratic.lean:122`).
  - `FiniteBilinearModule.IsNondegenerate` (`FiniteBilinearModule/Basic.lean:142`), `IsIsotropic`
    (`Quadratic.lean:610`), `IsLagrangian` (727) and `IsMetabolic` (`Metabolic.lean:29`).
  - `gaussSign` (`GaussSum.lean:514`), `expCircle` (`Circle/Basic.lean:60`) and `mass`, `properMass`
    (`NumberTheory/IntegralLattice/Mass.lean:91, 100`).
- **Behind R03, R10 and R11.**
  - `QuadraticAlgebra.instNumberField` (`NumberTheory/NumberField/QuadraticAlgebra.lean:41`) and
    `QuadraticOrder.numberFieldOrder` (`QuadraticOrder/Field.lean:39`).
  - `posDefProperClassEquivPic` (`BinaryQuadraticForm/Ideal/PicEquivalence.lean:55`),
    `properClassEquivNarrowPic` (`Ideal/Narrow/Equivalence.lean:106`) and `posDefProperClassEquivGal`
    (`Ideal/RingClassField.lean:83`).
  - `index_specialOrthogonalGroup_eq_two_iff_reflected` (`IntegralLattice/Binary/Isometry.lean:127`)
    and `finite_narrowPic` (`Orders/NarrowPic/RayClass.lean:297`, an instance).
  - `ringClassField` and `ringClassArtinEquiv` (`ClassFieldTheory/ClassFields/RingClass/Field.lean:111, 178`).
  - `IntegralLattice.scale` (`Scaling.lean:76`) and `localizationToCompletion` (`Localization/Basic.lean:154`).
- **The native headlines.**
  - `vanDerBlij` (`Characteristic/VanDerBlij.lean:141`) and
    `gaussSign_discriminantQuadraticModule_eq_sigPos_sub_sigNeg` (`Milgram.lean:313`).
  - `card_isometry_typeE₈RootLattice` (`TypeE/WeylGroup.lean:272`) and
    `exists_isEven_isUnimodular_isPosDef_iff` (`PosDef/EvenUnimodular.lean:163`).
  - `infinite_isometry_of_isIndefinite` (`IndefiniteIsometry.lean:171`) and `SameGenus`
    (`Genus.lean:77`).
  - `Matrix.localDensityCount` (`LocalDensity/Basic.lean:110`),
    `isEmpty_isometry_e8PowLattice_checkerboardPlusLattice` (`EvenUnimodularGenus.lean:82`) and
    `sum_inv_natCard_isometry_eq_mass_iff` (`Mass.lean:221`).

**Cross-roadmap citations resolved (12).**
- **Class Field Theory.**
  - At this head: `ringClassField` (727), `ringClassArtinMap` (734), `gal_ringClassField_equiv_pic`
    (741) and `hilbertProductFormula` (772).
  - On main: `ringClassField` (4318, with `hK`).
- **Quadratic Form Invariants.** At this head, `hilbertSymbol_productFormula` (196), which this
  pull request keeps.
- **Global Number Fields.** `NumberFieldOrder.isProper_iff_isUnit_of_finrank_eq_two`
  (`Completed/GlobalNumberFields/Suggested.lean:777`). The citation tool's lead on head README 477
  is a false positive.
- **Theta Series on main.** Lines 54–76, 97–108, 143, 161–163 and 518–559.
- **OrthogonalTamagawaAndLatticeMass at its head.** Lines 9 and 18 cite §§2G, 6C, 6D and 7C here.
  These sections exist in main's text, and none is dropped by an open head.

**Overlaps and ownership.**
- The overlap report lists no dropped id and no id that only an open revision defines.
- Of the closest roadmaps in vocabulary, Theta Series and OrthogonalTamagawaAndLatticeMass were
  read as above.
  - LatticePackingsAndPerfectForms and GeometryOfNumbersAndQuadraticArithmetic were not reopened.
    This pull request adds no object to this folder, so it creates no new double owner.
- The double ownership against Tau Ceti in main's text is repaired at #617 (R10).

## Not verifiable

- **Nikulin, *Integral symmetric bilinear forms and some of their geometric applications*
  (1979).** Theorem 1.9.1 is cited for "Nikulin's notation", and Theorems 1.10.1–1.14.4 elsewhere.
  - The work has no manifest key.
  - I fetched it through the sources service without recording anything, from Math-Net.Ru's open
    archive (`mathnet.ru/eng/izv1789`) and from the DOI's landing page. Both timed out ("network
    trouble").
  - Checked mathematically only, on `⟨2⟩`, `⟨10⟩` and `ℤ/3` (table).
- **Cox, *Primes of the form x² + ny²*.** Cited for B2 (Theorem 7.7, p. 137), B4 (Theorem 3.9,
  p. 50) and B5 (Theorems 2.8, 2.13, pp. 27, 29). It is a commercial monograph with no manifest
  key, flagged uncertified in the README. The statements were checked by computation and against
  Tau Ceti's native proofs, whose docstrings cite Cox §7.
- **Other commercial monographs.**
  - `cohen1993` (B2, B5): uncertified in the manifest.
  - Cassels, *An Introduction to the Geometry of Numbers*, Chapter VIII (2F).
  - Conway–Sloane, *SPLAG*, Chapters 15–16 (genus symbols, 6E). Chapter 15 was checked only through
    `allcock-gal-mark2016`.
  - O'Meara, Serre, Milnor–Husemoller and Cho, which were not opened.
- **Settled manifest entries.**
  - `conway-sloane-mass1988` ("Mass", equation (1), and sections 3 and 6) is waived.
  - `kawauchi-kojima1980` (1G) is uncertified.
- **Outside the sample.** `voight2023` (4G) and `boya-sudarshan-tilma2003` (7E) are cached but
  were not opened.
- **Other open pull requests.** #617's head was read from its sibling checkout. #1797's head was
  read only through the overlap report.

## Source issues

- **Error** in Conway–Sloane, *SPLAG* (no manifest key) at Chapter 15, the canonical 2-adic symbol (printed page not checked): the source says a sign can walk the whole length of a train, leaving at most one sign per train; it should allow several signs per train when a bad compartment blocks the walk (`allcock-gal-mark2016` lines 919–924); affects a stated result.
