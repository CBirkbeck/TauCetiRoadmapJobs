# Review of GlobalQuadraticForms (pull request #1200 at 4fffe86)

**Verdict:** needs changes

AI-assisted independent review of `TauCetiRoadmap/GlobalQuadraticForms/` at `4fffe864d2f38ed8026f5ee1d1db70d3c5522c43`. This is a full review, not an incremental one. There are six findings, three of them blocking (one P1, two P2). The previous review's nine findings are re-checked first.

## Status of the previous review's findings

| Previous | Passage at this head | Status |
|---|---|---|
| R01 (P1) rank-zero realization | README.md:586–587 now says a record is admissible “exactly when it is the record of a regular form of positive rank”. Conventions (:95–100) put positive rank and finite support under `IsAdmissible`. | Repaired |
| R02 (P1) build gate | Suggested.lean:1 now starts with `module`. The worker's gate reports `build=0 … OK`. | Repaired |
| R03 (P2) higher-rank step with T = ∅ | README.md:414–419 now consumes `exists_apply_ne_zero_locallyRepresentsScalar_neg` and works through the instance U = ⟨1,1⟩, W = ⟨1,−1,1⟩. | Repaired |
| R04 (P2) re-planned Tau Ceti content | Layers 0–3, 4.1, 4.4, 4.5, 5.2–5.4 and 7.1 are gone. README.md:33–48 consumes them “through the supplier contracts below”. | Repaired in substance, but the contracts cite declarations missing at this branch's pin (new R01) |
| R05 (P2) form-level 72:1 headline | README.md:590–594 derives the local isometries from the record theorem. The pinned `IsLocalRealization.equivalent_atFinitePlace` and `equivalent_atRealPlace` (`Global/Classification.lean:181`, `:193`) take `Q.globalInvariants hQ = I` and return them. | Repaired: the form-level statement is one step from `exists_globalForm_of_isAdmissible` |
| R06 (P3) shape and Checks | The README now has the house shape: Summary, Scope, Conventions, supplier contracts, How to read the build, Checks per section, and Examples and Dependencies per layer. The roadmap defines nothing of its own, so the three-Checks-per-definition rule is vacuous. | Repaired |
| R07 (P3) locators | The Global Number Fields “Layer 0.2” row is gone and the Serre locators are now precise (README.md:754–757). Sections 5.1, 8.2 and 8.3 still have no source locator. | Partly repaired (see R05 below) |
| R08 (P3) delete `equivalent_of_locallyEquivalent` | Still at Suggested.lean:130–137. | Not repaired, and not re-raised. On main, `TauCetiRoadmap/IntegralLattices/Suggested.lean:7` imports this module and line 403 `#check`s the name. The gate builds that module, so deleting the declaration would break a roadmap on main. |
| R09 (P3) mandatory route | README.md:284 now reads “A route through the idele-class norm index”. | Repaired |

## R01 (P1) — The supplier contracts cite 16 declarations and 10 files that do not exist at the branch's pinned Tau Ceti

**Location:** `TauCetiRoadmap/GlobalQuadraticForms/README.md:120–121`, “There is no roadmap supplier. Every input below is a declaration of Mathlib or Tau Ceti at the pins.” The same applies to the contracts at lines 175–260 and to the *Needs:* lines of 4.2, 4.3, 7.2, 7.3, 8.2 and 8.3.

**Claim:** every cited input exists at the pins of this head.

**Witness:** `lake-manifest.json` pins Tau Ceti `358314d`. At that pin, a search finds none of the following: `hilbertSymbol_productFormula`, `finrank_le_index_range_ideleClassNormMap`, `exists_sq_sub_mul_sq_iff_forall_completion`, `exists_locallyRepresents_prod`, `globalToLocal`, or 11 more names. `Global/ProductFormula.lean`, `SignPrescription.lean` and eight other cited files are also absent.

**Repair:** merge current main into the branch. Main's manifest pins Tau Ceti `2fd255d`, Mathlib `1b1ccf4` and `lean4:v4.36.0-rc2`. Then rerun the gate, including its targeted build, at those pins.

Tested at `2fd255d`: all 16 names and 10 files are present (listed under Verified sound). Suggested.lean's five imports exist there. `GlobalFormInvariants`, `IsAdmissible` and `Predicates.lean` are unchanged, and the other imported files only gain declarations.

The Mathlib path at README.md:131, `RingTheory/DedekindDomain/AdicValuation/Completion.lean`, also exists only at `1b1ccf4`. At `f6090c7`, `adicCompletion` lives in `RingTheory/DedekindDomain/AdicValuation.lean`.

The 16 missing names are:
- `IsLocalRealization.exists_locallyRepresents_prod`
- `isAdmissible_ofLocalForms`
- `isLocalRealization_ofLocalForms`
- `exists_discr_eq_equivalent_of_isRepresentedBy_prod`
- `globalInvariants_hasseProduct_eq_one`
- `isAdmissible_globalInvariants`
- `locally_formClass_eq_nsmul_hyperbolicClass_iff`
- `exists_sq_sub_mul_sq_iff_forall_completion`
- `finrank_le_index_range_ideleClassNormMap`
- `Sqrt5.exists_admissible_rank_three`
- `exists_anisotropic_and_not_anisotropic_away_from_realPlace`
- `exists_hilbertSymbol_eq_ite`
- `exists_pair_hilbertSymbol_eq_ite`
- `WittRing.globalToLocal`
- `WittRing.globalToLocal_eq_zero_iff`
- `hilbertSymbol_productFormula`

## R02 (P2) — Eight route inputs exist only for `K : Type`, but every headline is stated for `K : Type u`

**Location:** README.md:76, “`K` is a number field (`[Field K] [NumberField K]`, in any universe)”. `Suggested.lean:46`, `:63` and `:106` declare `{K : Type u}`.

**Claim:** the routes of 4.2 and 4.3 (and through them 5.1, 5.5, 6.1–6.3, 8.1–8.3), and of 7.2/7.3, prove the stated headlines in every universe.

**Witness:** at main's pin, the following bind `{K : Type}`:
- `ClassFieldTheory/Global/HasseNorm/Quadratic.lean:41` and `IdeleClass/FirstInequality.lean:68,103`
- `Global/PrescribedLocalForms.lean:69`, `ProductFormula.lean:61` and `SignPrescription.lean:72`

`Global/Quaternary.lean:140` needs the ternary case over every `L : Type u`. For u ≥ 1 the 4.3 supplier cannot be instantiated.

**Repair:** own a transport target in Layer 4, and add it to the *Needs:* lines of 4.2, 4.3 and 7.2. The target states two things:
- every number field `K : Type u` is isomorphic to one in `Type`, for example `AdjoinRoot` of the minimal polynomial over ℚ of a primitive element;
- `IsSquare (v.unitAtFinitePlace a)`, the four local predicates, `globalInvariants`, `IsAdmissible` and the Witt components are invariant under ring isomorphisms of number fields.

The alternative is to state the Conventions and all eight headlines for `K : Type`, matching the suppliers. Test: with either repair, the ternary route over `L = K(√d)` applies `exists_sq_sub_mul_sq_iff_forall_completion` to a field in `Type`.

## R03 (P2) — The first-inequality contract drops the cyclic hypothesis, and as written it is false for S₃ extensions

**Location:** README.md:208–209, “`finrank_le_index_range_ideleClassNormMap` (for a Galois extension `L/K` of number fields, `[L : K] ≤ [C_K : N(C_L)]`)”. Also README.md:286, “a quadratic, hence Galois, extension”.

**Claim:** the inequality holds for every Galois extension.

**Witness:** the declaration (`FirstInequality.lean:103–108`, main's pin) assumes `[IsGalois K L] [IsCyclic Gal(L/K)]`. Take L = ℚ(∛2, ζ₃), whose Galois group is S₃. Then [L : ℚ] = 6, while N(C_L) = N(C_{ℚ(√−3)}) has index 2, and 6 ≤ 2 is false.

**Repair:** write “for a cyclic extension `L/K` of number fields in `Type`, `[L : K] ≤ [C_K : N(C_L)]`”, and at line 286 write “quadratic, hence cyclic”. Test: E = K(√a) has Galois group ℤ/2, which is cyclic, and the route needs 2 ≤ index. The S₃ case is excluded by the hypothesis.

## R04 (P3) — Renamed headings and the dropped Layer 3 break citations in open roadmaps

**Location:** README.md:328, “### 4.3 The quadratic Hasse norm theorem as a representation statement”, and README.md:698, “### 8.4 The isometry corollary for orthogonal groups”. README.md:264–266, “the foundations it numbered 0–3 … are Tau Ceti declarations”. The section map at :50–59 covers only 4.4.

**Witness:** OrthogonalSpinGroups (#1181 head) links `#43-the-quadratic-hasse-norm-adapter` at `Completed/OrthogonalSpinGroups/README.md:350` and `#84-the-form-theoretic-so-kernel-consequence` at `:1445`. MetaplecticAutomorphicForms (#1063) cites “GlobalQuadraticForms Layer 3” at `README.md:1625`, `1627` and `1828`.

**Repair:**
- Restore the heading texts “4.3 The quadratic Hasse norm adapter” and “8.4 The form-theoretic `SO` kernel consequence”, keeping the new bodies.
- Replace the sentence at 264–266 with section-map lines, one per dropped id that others cite. At least: “Layer 3, admissible systems: `TauCeti.NumberField.QuadraticForm.GlobalFormInvariants`, `GlobalFormInvariants.IsAdmissible`, `QuadraticForm.globalInvariants`”.

This also removes the history wording “numbered”. Test: the slug of the restored 8.4 heading is `84-the-form-theoretic-so-kernel-consequence`, which is exactly the cited anchor.

## R05 (P3) — Sections 5.1, 8.2 and 8.3 state theorems without a source locator

**Location:** README.md:369–390 (5.1, a seeded target), 658–668 (8.2) and 677–690 (8.3).

**Witness:** these three sections cite no source. Every other theorem section carries an O'Meara paragraph: 4.2 is 65:15, 5.5 is 66:1, 6.1–6.3 are 66:3–66:4, 7.2 is 72:1 and 8.1 is 66:5.

**Repair:** attach a numbered source statement with its page, checked against the text:
- for 5.1, the binary and ternary step of the Hasse–Minkowski proof that the route follows;
- for 8.2–8.3, the local-global principle for Witt classes in a text you can read.

Test: every theorem section from 4.2 to 8.3 then carries a locator, as 4.2 and 5.5 already do.

## R06 (P3) — The *Needs:* line of 4.2 cites form-value lemmas that cannot give the square-class step

**Location:** README.md:290–292, “By weak approximation at the places of `S` and the openness of square classes, some `α ∈ Kˣ` has `i_v / α` a square”. The *Needs:* line at :306–307 cites `exists_isOpen_isSquare_div_atFinitePlace` and `…_atRealPlace`.

**Witness:** these lemmas (`Global/Continuity.lean:76` and `:91` at the pin) control the ratio `Q_v(z)/Q_v(x)` near a local vector x of a global form Q. For ⟨1⟩ on K that ratio is (z/x)², which is always a square, so the lemmas say nothing about `i_v/α` for an arbitrary `i_v ∈ K_vˣ`.

**Repair:** at finite places, cite `TauCeti.isOpen_range_powMonoidHom` (`NumberTheory/LocalField/PowerSubgroup/Open.lean:42`) with n = 2, which needs (2 : K_v) ≠ 0. At real places, cite that ℝ_{>0} is open. Test: for i₃ = 3 ∈ ℚ₃ˣ, the open set 3·(ℚ₃ˣ)² contains α = 12, and 12/3 = 2².

## Verified sound

**Gate and dependencies.**
- The worker's gate passes every check at this head, `build=0` included. My rerun of the gate command passes every text check (`… source-material=0 OK`).
- `git diff origin/main...HEAD` outside the folder is empty.
- The dependency check printed exactly `depcheck: 237 roadmaps, 2424 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. The README declares no roadmap supplier, so there are no `gap:` contracts to check.

**Lean checks.**
- `lake env lean` on `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` exits 0 with exactly 8 `sorry` warnings, at lines 51, 68, 76, 84, 93, 111, 120 and 145.
- I put `#check @name` for all 9 declarations in one scratch file and elaborated it. Every needed binder is in each declaration's own signature: `NumberField`, `FiniteDimensional` on both carriers, `Nondegenerate` on both forms, `a ≠ 0`, and `[Invertible (2 : K)]`. V and W are in separate universes. Nothing changed relative to the README statements.
- One-tactic probe on a scratch copy: `simp`, `rfl`, `infer_instance` and `exact?` each fail on all 8 sorried theorems.
- Form: no `set_option`, no sorry'd data, no `lemma`, no roadmap import; the five imported `TauCeti.*` modules exist at the pin. `Nondegenerate` is Mathlib's `QuadraticMap.Nondegenerate` (`LinearAlgebra/QuadraticForm/Radical.lean:115`), which in characteristic 0 means a trivial radical, so it matches “regular”.

**Headline theorems from the README, and their place in the file.**
- Global square theorem (4.2), Hasse–Minkowski for isotropy (5.5), for scalars (6.1), for forms (6.2) and for isometry (6.3), realization of admissible records (7.3), classification (8.1) and Witt injectivity (8.3): stated.
- The 8.4 corollary: stated and proved from 6.3, kept for the IntegralLattices consumer on main.
- Form-level 72:1 (7.2) and global hyperbolicity (8.2): one-step corollaries of 7.3 and 6.3 via the pinned lemmas, so they are not required.
- No stand-in carriers are used.

**Library declarations opened at the branch pin.** The list gives file and line under `TauCeti/` (Tau Ceti `358314d`) or `Mathlib/` (Mathlib `f6090c7`). It covers 35 declarations; the 16 under R01 were checked by search instead.

- `Global/Predicates.lean`:
  - :51 `IsLocallyIsotropic`, :66 `LocallyRepresents`, :85 `LocallyRepresentsScalar` and :147 `LocallyEquivalent`: each quantifies over every finite and every real place, through actual base change.
  - :105 `LocallyRepresentsScalar.isLocallyIsotropic_smul_sq_prod`, :164 `isLocallyIsotropic_of_not_anisotropic`, :177 `LocallyRepresents.of_isRepresentedBy`, :189 `LocallyRepresentsScalar.of_represents`, :201 `LocallyEquivalent.of_equivalent`, :311 `LocallyEquivalent.finrank_eq` and :319 `LocallyRepresents.finrank_le`.
- `Global/Localization.lean`:
  - :41 `unitAtFinitePlace`, :65 `unitAtRealPlace`, :88 `atFinitePlace`, :94 `atRealPlace` and :103 `atComplexEmbedding`.
  - :167 `Nondegenerate.atFinitePlace`, :175 `Nondegenerate.atRealPlace` and :196 `Equivalent.atFinitePlace`.
- `Global/Invariants.lean`:
  - :90 `GlobalFormInvariants`: rank in ℕ, `SquareClassGroup` discriminant, `finiteHasse` with values in ℤˣ, real positive index.
  - :178 `IsAdmissible` has the seven clauses the README lists.
  - :267 `isAdmissible_rankOne_iff_eq_empty` and :287 `isAdmissible_rankTwo_iff_eq_empty`.
- `Global/FormInvariants.lean` :77 `globalInvariants`, :165 `isAdmissible_globalInvariants_iff` (positive rank and Hasse product one), and :193 `Equivalent.globalInvariants_eq`.
- `Global/Classification.lean` :110 and :129 (the classification criteria), :155 `LocallyEquivalent.of_globalInvariants_eq`, and :181/:193 (`IsLocalRealization.equivalent_atFinitePlace` and `equivalent_atRealPlace`).
- `Global/LocalRealization.lean` :91 `IsLocalRealization` and :243 `IsAdmissible.exists_isLocalRealization`.
- `Global/Quaternary.lean:137`: the ternary hypothesis over every `L : Type u`.
- `Global/HigherRank.lean:87`: the rank-(n−1) hypothesis.
- `Global/ApproximateValue.lean:61`: it needs `U ≠ 0` and concludes `U x ≠ 0`.
- `Global/AnisotropicPlaces.lean:84`: dimension ≥ 3, and no regularity is needed.
- `Global/Continuity.lean` :76 and :91.
- `NumberTheory/HilbertSymbol/Basic.lean:46` `hilbertSymbol`: equal to 1 exactly when b = x² − a y² is solvable.
- `NumberTheory/HilbertSymbol/Archimedean.lean:59`: equal to −1 exactly when both arguments are negative.
- `NumberTheory/LocalField/QuadraticForm/Hasse.lean:91` `localHasse`: product over i < j.
- `LinearAlgebra/QuadraticForm/Representation.lean:44` `Represents` (∃ v, Q v = a, with v allowed to be 0) and :47 `IsRepresentedBy` (an injective isometry).
- `LinearAlgebra/QuadraticForm/RegularFormClass/Discriminant.lean:380`.
- `NumberTheory/NumberField/Global/Ideles/Norm/Range.lean:115`: no Galois hypothesis.
- Mathlib `NumberTheory/NumberField/AdeleRing.lean:91` and `:117`, and `NumberTheory/NumberField/Completion/InfinitePlace.lean:330`.

**At main's pin (`2fd255d`), the 16 names of R01 with their location.**
- `Global/PrescribedLocalForms.lean:140`
- `Global/LocalRealization.lean:309` and `:331`
- `Global/Existence.lean:169`
- `Global/ProductFormula.lean:67`, `:107` and `:117`
- `Global/Hyperbolicity.lean:116`
- `Global/SignPrescription.lean:154` and `:191`
- `Global/WittLocalization.lean:167` and `:203`
- `Global/WorkedExamples/Sqrt5.lean:178`
- `Global/DefiniteObstruction.lean:68`
- `ClassFieldTheory/Global/HasseNorm/Quadratic.lean:45`
- `ClassFieldTheory/Global/IdeleClass/FirstInequality.lean:108`

I read each statement against the README's description. Apart from R02 and R03, they agree. For example:
- `exists_locallyRepresents_prod` returns W on `Fin I.rank → K` and a, b with ⟨a, −ab⟩ locally represented by ⟨1, −b⟩ ⊥ W.
- `globalToLocal_eq_zero_iff` describes the kernel by dimension mod 2, signed discriminant, Clifford invariant and signature.

**Cross-roadmap citations resolved.**
- On main:
  - `Completed/OrthogonalSpinGroups/README.md:947`, `:965` cite `hasseMinkowski_equivalent`, which is kept.
  - `TauCetiRoadmap/IntegralLattices/Suggested.lean:402–403` checks both names, which are kept.
  - `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:189`, `:804` and `:2607` link `#layer-4-global-square-norm-and-approximation-lemmas`, which matches the kept heading. Their “4.4” citations go through the section map.
- At open heads:
  - GL2AutomorphicRepresentationsAndTransfer (#931) cites §4.4 `exists_hilbertSymbol_eq_neg_one_iff_pair`, which is mapped.
  - QuaternionArithmetic (#1722) cites 4.4, 5.5, 6.1 and 6.3.
  - K3Surfaces (#1285) cites §5.5.
  - GeometryOfNumbersAndQuadraticArithmetic (#851) cites Layers 5–6.
  - IntegralLattices (#1239) cites both Lean names.
  - All resolve. The exceptions are R04.
- Ownership: ClassFieldTheory (main `README.md:216`) and QuadraticFormInvariants (main `README.md:187`) assign Hasse–Minkowski and global classification to this roadmap. Searching all open heads and main for Hasse–Minkowski, the global square theorem, 72:1 and Witt injectivity found no second owner.
- The overlap file reports no other pull request changing this roadmap and no dropped id that this roadmap cites. Neither Tau Ceti pin proves any headline: the only “global square” hits are docstrings, and `ideleHilbertCharacter_eq_one_iff` is a different statement.

**Adversarial table.** The notation is H = ⟨1,−1⟩ and (a,b)_v = 1 exactly when b = x² − a y² is solvable. Each sampled target, each headline and each finding appears below.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Conventions: plain vs signed discriminant | H, ⟨1,1⟩ | H: plain [−1], signed (−1)^1·[−1]=[1]; ⟨1,1⟩: [1] and [−1] | Check correct | none |
| Conventions: Hasse sign i<j vs i≤j | H over ℝ | i<j: (1,−1)=1; i≤j: (1,1)(1,−1)(−1,−1)=−1 | Check correct | none |
| Conventions: real symbol | (−1,−1), (−1,1), ⟨−1,−1⟩ | −1=x²+y² has no solution → −1; 1=1²+0 → 1; real Hasse with q=2: (−1)^1=−1 | correct | none |
| Conventions: (−1,3) at all places | v=3, 2, ∞, p∤6 | (−1/3)=−1; 2-adic ε(−1)ε(3)=1·1 → −1; 3>0 → 1; units → 1; product 1 | correct | none |
| Conventions: zero form record | 0-dim form | rank 0, d=[1], s_v=1, p_w=0; 1≤0 false | realized, not admissible | none |
| 4.2 global square [sample/headline] | a=4, S=∅; a=1 | 4=2² in every ℚ_p and in ℚ | T/T | none |
| 4.2, hypothesis fails | a=−1; a=2; a=−4 | −1 is a non-residue at p=3, 7, 11, …; 2 at p=3, 5, 11, 13; −4 like −1 | hypothesis false (no finite S) | none |
| 4.2, eighth-power control | 16 over ℚ | p=3: −2≡1 is a residue → root of x²+2; p=5: −1≡4; p=7: 2≡9; 16=2⁴ is not an 8th power in ℚ | analogue false with S={2} | none |
| 4.2 route step 5 | nonsquare a, E=K(√a) | surjective norm on idele classes ⇒ index 1; needs 2 ≤ 1 | contradiction | none |
| First-inequality contract | L=ℚ(∛2,ζ₃), group S₃; E quadratic | [L:ℚ]=6 vs index [ℚ(√−3):ℚ]=2; E: 2 ≤ 2 | Galois form false, cyclic form true | R03 |
| 4.2 step 3 inputs | ⟨1⟩, i₃=3 | (z/x)² always a square; α=12: 12/3=4 | cited lemma vacuous here; power-subgroup lemma works | R06 |
| 4.3 [sample] | d=−1, a=5; d=−1, a=3; d=2, a=−1; d=−1, a=−1 | 5=1²+2² T/T; (−1,3)₃=−1 F/F; 1−2=−1 T/T; x²+y²=−1 fails at ℝ F/F | correct; d=1 excluded (square) | none |
| 4.3 universe | supplier `{K : Type}`, headline `Type u` | for u=1 the supplier's K cannot be instantiated | route gap | R02 |
| 5.1 binary [sample] | ⟨1,1⟩/ℚ, ⟨1,1⟩/ℚ(i), H | −det=−1 is a nonsquare at ℚ₃ → anisotropic F/F; 1+i²=0 T/T; −det=1 is a square → (1,1) T/T | correct | locator, R05 |
| 5.1 ternary [sample] | ⟨1,1,−2⟩, ⟨1,1,−3⟩, ⟨1,1,1⟩, ⟨1,−1,−5⟩ | (1,1,1) is a zero; (−1,3)₃=−1 → F/F; anisotropic exactly at {2,∞} (even count); d=1 → (1,1,0) | correct; nonsquare d forces z≠0 (x²=2y² only at 0) | none |
| 5.5 isotropy [sample/headline] | ranks 0, 1; H; ⟨1,1,−3⟩; ⟨1,1,1,1,1⟩; ⟨1,1,1,1,−1⟩ | F/F, F/F, T/T, F/F (at 3), F/F (at ℝ), T/T via (1,0,0,0,1) | correct | none |
| 5.5 without regularity | ⟨1,0⟩ | radical e₂: Q(e₂)=0 globally and after base change | T/T, so hQ costs nothing | none (README says so) |
| 5.5 higher-rank step, T=∅ | U=⟨1,1⟩, W=⟨1,−1,1⟩ | x=(1,0), b=1, y=(0,1,0), W(y)=−1=−b; x=0 gives singular ⟨0⟩⊥W | repaired route correct | none |
| 5.5, one real place | ℚ(√5), ⟨1,1,1,1,ε⟩ with ε>0 at w₀, ε<0 at w₁ | anisotropic at w₀; isotropic at w₁ and at every finite place | all-but-one does not suffice | none |
| 6.1 scalars [sample/headline] | ⟨1,1⟩ with a=5, 3, −1; H; 0-dim with a=1; a=0 | T/T; F/F at 3; F/F at ℝ and 2; ((1+a)/2,(1−a)/2) T/T; F/F; a=0: Q(0)=0 T/T | correct; a≠0 needed only by the route | none |
| 6.2 forms [sample/headline] | ⟨1⟩→H; ⟨1,1⟩→⟨1⟩; ⟨3⟩→⟨1,1⟩; 0-dim→any | T/T; F/F (2>1); F/F (at ℚ₃); T/T | correct | none |
| 6.2 cancellation step | ⟨1⟩⊥H into ⟨1⟩⊥H⊥⟨2⟩, c=1 | complements H into H⊥⟨2⟩, ranks 2 ≤ 3 | correct | none |
| 6.3 isometry [sample/headline] | H vs ⟨2,−2⟩; ⟨1⟩ vs ⟨−1⟩; ⟨1,1,−3⟩ vs ⟨1,1,−1⟩; ⟨1,1⟩ vs ⟨2,2⟩ | T/T; F/F (p 1 vs 0); F/F (−3/−1=3 is a nonsquare in ℚ₃); T/T via (x+y, x−y) | correct | none |
| 7.2 existence [sample] | ⟨1⟩ data; rank 3, d=[1], ⟨1,1,1⟩ with s₂=−1; ⟨−1,−1,−1⟩ | T; product (−1)·1=−1 → excluded; s₂=(−1)³=−1, real (−1)³=−1, product 1 | correct | none |
| 7.2 correction plane | α=2, β=5 | d(P)=[−5], d(P′)=[−20]=[−5]; (2,5)₅=−1, (2,5)₂=(−1)^{(25−1)/8}=−1, (2,5)_∞=1 | flips exactly {2,5} | none |
| 7.2 vs O'Meara's ∏_{i≤j} | form-level product | S_v = s_v·(d,−1)_v and ∏_v (d,−1)_v = 1 | the two product conditions are equivalent | none |
| 7.3 realization [sample/headline] | record of ⟨1⟩; zero record; rank 1 with s=−1 at {2,3}; rank 2, d=[−1], s=−1 at {2,3} | T↔T; realized but inadmissible (1≤0); product 1 yet inadmissible; product 1 yet inadmissible | correct with positive rank | none |
| 7.3 Lean witness | ⟨1⟩ on `Fin 1 → ℚ`, H on `Fin 2 → ℚ` | records (1,[1],1,1) and (2,[−1],1,1) | exist | none |
| 7.4 uniqueness [sample] | ⟨1,1⟩, ⟨2,2⟩ | both (2,[1],s=1 since 2=2²−2·1²,p=2) | isometric | none |
| 8.1 classification [sample/headline] | ⟨1,1,−1⟩ vs ⟨1,2,−2⟩; ⟨1⟩ vs ⟨−1⟩; two zero forms | d: −1, −4 → [−1]; s: 1, (1,2)(1,−2)(2,−2)=1; p 2, 2 → T/T; p 1≠0 → F/F; T/T | correct | none |
| 8.2 hyperbolicity [sample] | ⟨1,−1,2,−2⟩; ⟨1,1⟩ | m=2: d=[4]=2•[−1], s_v=(−1,2)(−1,−2)=(−1,−1)_v, p=2 → T/T; d=[1]≠[−1] → F/F | correct | locator, R05 |
| 8.3 Witt injectivity [sample/headline] | 0, [H], [⟨1⟩], [⟨1,1⟩], [⟨1,1,−3⟩⊥⟨−1,−1,1⟩] | 0, 0; odd at every v; real signature 2; nonzero at ℚ₃ | no spurious kernel | locator, R05 |
| 8.3 complex places | [⟨1⟩] in W(ℂ)=ℤ/2 | 1, already detected by dim mod 2 at any finite place | omission justified | none |
| 8.4 corollary [sample] | H vs 2H; ⟨1⟩ vs ⟨−1⟩ | hypothesis T → T; hypothesis F at ℝ | correct (proved from 6.3) | none |
| Worked example ℚ(√5) | θ=(1+√5)/2 | θ₁≈1.618, θ₂≈−0.618; signatures (3,0), (1,2); d=[θ²]=[1]; (θ,−1): real 1, −1, odd 1 ⇒ 𝔭₂: −1; product (−1)·1·(−1)=1; x²−x−1 is irreducible over 𝔽₂ | admissible; 2 inert | none |
| Degenerate cases | characteristic p, inseparable extensions, the zero ring | excluded: K is a number field (characteristic 0); ℚ₂ and 𝔽₄ residue fields tested above | n/a | none |

## Not verifiable

- **O'Meara, *Introduction to Quadratic Forms*** (DOI 10.1007/978-3-642-62031-7). The sources service reported a paywalled Springer DOI prefix (`uncertified`). The sampled locators are therefore unchecked against the text: 65:15 (4.2), 66:1 (5.5), 66:3 (6.1, 6.2), 66:4 (6.3), 72:1 (7.2, 7.3), 66:5 (8.1), and 58:7, 71:19 and 71:19a. Their numbering, pages and hypotheses are not certified. The mathematics of each was checked directly in the table above.
- **Serre, *A Course in Arithmetic*** (DOI 10.1007/978-1-4684-9884-4): paywalled, `uncertified`. The Hasse-sign convention (Ch. IV §2.1, product over i<j) agrees with the pinned `localHasse`.
- **4.3, 5.1, 7.4, 8.2, 8.3, 8.4** carry no source locator (R05 covers 5.1, 8.2 and 8.3; the others are derived), so there was nothing to fetch.
- **Elaboration at main's pins** after R01's merge was not run, because building against the main checkout is outside the commands this review may run. Comparing the five imported files at the two pins shows only added declarations, and the carriers used by the statements are unchanged.

## Source issues

- none
