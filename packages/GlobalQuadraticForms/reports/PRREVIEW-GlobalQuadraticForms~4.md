# Review of GlobalQuadraticForms (pull request #1200 at 7aaec79)

**Verdict:** needs changes

AI-assisted independent full review of `TauCetiRoadmap/GlobalQuadraticForms/` at `7aaec79e7948194014c022eac2dd35acab1c0442`. There are four findings: one is blocking (P1) and three are P3. The P1 is the previous review's R01, still open. The previous review's six findings are re-checked first.

## Status of the previous review's findings

| Previous | Passage at this head | Status |
|---|---|---|
| R01 (P1) cited declarations missing at the branch pin | `lake-manifest.json` still pins Tau Ceti `358314d`, Mathlib `f6090c7` and `lean4:v4.35.0-rc3`. All 16 names are still absent there. | **Not repaired** (R01 below) |
| R02 (P2) universe of the route inputs | New section 4.1 (README.md:326–370). Conventions :91–92: “the Tau Ceti inputs stated for number fields in `Type` reach every universe through 4.1”. The *Needs:* lines of 4.2, 4.3, 7.2 and 7.3 now cite 4.1. The list of eight `Type`-only inputs at :137–144 is exact (Verified sound). | Repaired, except for local realizations (R02 below) |
| R03 (P2) cyclic hypothesis | :255–257: “for a cyclic extension `L/K` of number fields in `Type`, that is `[IsGalois K L]` and `[IsCyclic Gal(L/K)]`”, with the S₃ counterexample. Also :397–398 (“hence Galois with cyclic Galois group of order `2`”) and :408. | Repaired |
| R04 (P3) renamed anchors, dropped Layer 3 | :439 “### 4.3 The quadratic Hasse norm adapter”, :826 “### 8.4 The form-theoretic `SO` kernel consequence”. The section map at :54–74 now covers Layers 0–3 and 4.4. | Repaired: every citing anchor resolves (Verified sound) |
| R05 (P3) no locator in 5.1, 8.2, 8.3 | 5.1 (:485–498) cites Milne VIII 3.5(b), 3.7(b),(c), 1.1 and 3.1. 8.2 (:787–788) cites Thm 6.3 and Prop 6.2. 8.3 (:809) cites Thm 6.3. | Repaired: each locator checked against the text |
| R06 (P3) 4.2 square-class step | Step 3 (:401–405) and the *Needs:* line (:418) cite `TauCeti.GlobalNumberFields.exists_fieldUnit_isSquare_div_at_places`. | Repaired |

## R01 (P1) — The branch still pins Tau Ceti `358314d`, where 16 cited declarations do not exist, and it no longer merges cleanly with main

Re-raised: R01 of the previous review. The round-2 repair report (GATE~2, “Which pin”) answered it only with “this job may not touch the manifest”.

**Location.** `TauCetiRoadmap/GlobalQuadraticForms/README.md:136–137`: “There is no roadmap supplier. Every input below is a declaration of Mathlib or Tau Ceti at the pins.” The same claim underlies the contracts at :147–308 and the *Needs:* lines of 4.2, 4.3, 7.2, 7.3, 8.2 and 8.3.

**Claim.** Every cited input exists at the pins of this head.

**Witness.** At `7aaec79`, `lake-manifest.json` pins Tau Ceti `358314d`. At that pin, `hilbertSymbol_productFormula`, `finrank_le_index_range_ideleClassNormMap`, `WittRing.globalToLocal` and 13 more cited names are absent. A test merge of `origin/main` conflicts in this folder's `Suggested.lean`.

The 16 names are absent at `358314d` (0 hits each) and present at main's pin `2fd255d`. Their locations there, under `TauCeti/`:
- `PrescribedLocalForms.lean:140`
- `LocalRealization.lean:309` and `:331`
- `Existence.lean:169`
- `ProductFormula.lean:67`, `:107` and `:117`
- `Hyperbolicity.lean:116`
- `SignPrescription.lean:154` and `:191`
- `WittLocalization.lean:167` and `:203`
- `WorkedExamples/Sqrt5.lean:178`
- `DefiniteObstruction.lean:68`
- `ClassFieldTheory/Global/HasseNorm/Quadratic.lean:45`
- `ClassFieldTheory/Global/IdeleClass/FirstInequality.lean:108`

Two cited paths also exist only at main's pins:
- the Mathlib path `RingTheory/DedekindDomain/AdicValuation/Completion.lean` (:155); at `f6090c7` the file is `AdicValuation.lean`;
- the Tau Ceti path `RingTheory/DedekindDomain/Ideal/Basic.lean` (:242); at `358314d` the file is `Ideal.lean`.

Main's Tau Ceti pin bump (commit `a891cd1`) changed one `simp` argument in this folder's `Suggested.lean`, at merge-base line 488. That line is inside the Layers 7–8 block that this branch rewrote, so `git merge-tree` reports a conflict there.

**Why the round-2 reason fails.** Merging main edits nothing by hand. Afterwards `git diff origin/main...HEAD` outside the folder is still empty, and the pull request stops lagging main's `lake-manifest.json` without changing it. The merge is also the only way to clear the conflict in the folder's own file.

**Repair.**
1. Merge `origin/main` into the branch.
2. Resolve the single conflict in `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` by keeping this branch's file.
3. Rerun the gate, with its targeted build, at Tau Ceti `2fd255d`, Mathlib `1b1ccf4` and `lean4:v4.36.0-rc2`.

What was tested at those pins:
- All 16 names and both paths exist.
- Between the two pins, the five imported Tau Ceti files differ only by added theorems: two in `Global/Localization.lean` and three in `Witt/BaseChange.lean`. The carriers used by the nine statements are therefore unchanged.
- Main's `IntegralLattices/Suggested.lean` no longer imports this module, so the second build target does not depend on it.

## R02 (P3) — 4.1 does not transport local realizations, and 7.2 needs them in every universe

**Location.** README.md:358–360: “Together these give each of the eight inputs for number fields in every universe … This is how 4.2, 4.3, 7.2 and 7.3 reach the generality of their statements.” The 7.2 *Needs:* line at :682–683 says the same.

**Claim.** The facts listed in 4.1(2) carry `GlobalFormInvariants.IsLocalRealization.exists_locallyRepresents_prod` to `K : Type u`.

**Witness.** Its hypothesis `I.IsLocalRealization U R` (`Global/LocalRealization.lean:108`, main pin) has forms `U v` over `v.adicCompletion K`. 4.1(2) transports only global forms, their localizations, global Hilbert symbols and records; nothing carries a form over `K_v` to `K'_(σ v)`.

**Repair.** Choose one of the following.
- Add to 4.1(2): “a family `(U, R)` realizing `I` transports to a family realizing the reindexed record. `U_v` is carried to `K'_(σ v)` by scalar extension along `adicCompletionCongr`, which preserves regularity and the local Hasse invariant and maps the local discriminant. `R_w` is unchanged.”
- Or reorder the routes:
  1. Prove 7.2 and 7.3 for `K` in `Type`.
  2. Carry 7.3 to `Type u` through the reindexing of records that 4.1 already lists.
  3. Derive 7.2 in `Type u` from 7.3 with the universe-polymorphic `GlobalFormInvariants.isAdmissible_ofLocalForms`, `GlobalFormInvariants.isLocalRealization_ofLocalForms`, `IsLocalRealization.equivalent_atFinitePlace` and `IsLocalRealization.equivalent_atRealPlace` (`LocalRealization.lean:309` and `:331` with `K : Type*`; `Classification.lean:187` and `:226` with `K : Type u`).

Test: for a model of `ℚ(√5)` in `Type 1`, the second route needs only to reindex the admissible record of the worked examples (rank 3, positive indices 3 and 1, `s = -1` only at the prime above 2), and 4.1 lists that reindexing.

## R03 (P3) — The 4.2 warning uses an undefined `I_K^S` and is false under the textbook meaning

**Location.** README.md:414–416: “The identity `I_K = Kˣ · I_K^S` is false already for `K = ℚ` and `S` the archimedean place, so step 4 cannot pass through it”.

**Claim.** The identity fails for `ℚ` and `S = {∞}`.

**Witness.** With the usual `I_K^S = ∏_{v∈S} K_vˣ × ∏_{v∉S} 𝒪_vˣ`, the identity holds for ℚ, because ℚ has class number one. For an idele `i`, put `q = ∏_p p^(v_p(i_p))`; then `q⁻¹ i` is a unit at every prime.

**Repair.** Define the group where it first appears: “write `I_K^S` for the ideles whose components at the places of `S` are `1`”. Test: the idele with component `√2` at ∞ and `1` at every prime is then not of the form `q · j` with `j_∞ = 1`, since that would need `q = √2 ∉ ℚ`. With this definition the sentence is true.

## R04 (P3) — The 7.2 remark on local classes is false at real places from rank four on

**Location.** README.md:677–679: “A dimension and a discriminant leave at most two local classes, separated by the Hasse sign, except in rank one and in rank two with discriminant `[-1]`”.

**Claim.** At every place, rank and discriminant leave at most two classes, and the Hasse sign tells them apart.

**Witness.** Over ℝ, in rank 4 with discriminant `[1]`, the signatures (4,0), (2,2) and (0,4) give three classes. Both (4,0) and (0,4) have Hasse sign `(-1)^0 = (-1)^6 = 1`. Milne makes the same remark (milne-cft line 11784, p. 256).

**Repair.** Write instead: “At a finite place, a dimension and a discriminant leave at most two classes, separated by the Hasse sign, except …; at a real place the class is fixed by the positive index `p_w`, which the record carries.” Test: the two rank-four real forms above have `p_w = 4` and `p_w = 0`.

## Verified sound

**Gate and dependencies.**
- The worker's gate passes every check, `build=0` included. My rerun of the gate command at this head printed `… depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GlobalQuadraticForms'` is empty. The folder's `PROGRESS.md`, `STATUS.md` and `metadata.toml` pass the stray-files check.
- The dependency check printed exactly `depcheck: 237 roadmaps, 2341 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- The README declares no roadmap supplier and no `gap:` contract. Every roadmap it defers to is on main: ClassFieldTheory, QuadraticFormInvariants, IntegralLattices, ClassicalArithmeticCompletion, and Completed GlobalNumberFields, NumberFieldArithmetic and OrthogonalSpinGroups.

**Lean checks, at the branch pins.**
- `lake env lean` on `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` exits 0 with exactly 8 `sorry` warnings, at lines 51, 68, 76, 84, 93, 111, 120 and 145.
- I elaborated `#check @name` for all 9 declarations in one scratch file. Each type matches its README statement:
  - `K : Type u_1` throughout, and `V`, `W` in separate universes;
  - `Nondegenerate` on both forms and `FiniteDimensional` on both carriers;
  - `a ≠ 0` in 6.1 and `[Invertible (2 : K)]` in 8.3.

  Nothing changed relative to the README statements.
- One-tactic probe on a scratch copy: all 8 sorried theorems fail `rfl`, `simp`, `infer_instance` and `aesop` (each required to close the goal), and `exact?` fails on each. No padding.
- `equivalent_of_locallyEquivalent` (8.4) restates the reverse direction of 6.3 in one term. It is kept on purpose: IntegralLattices' README on main cites it by name (lines 477, 916 and 1028), and the branch's `IntegralLattices/Suggested.lean:403` `#check`s it.
- Form: the module docstring is “…: target signatures” and names the README; `namespace TauCetiRoadmap.GlobalQuadraticForms`; layer section comments; no `set_option`, no sorry'd data, no `lemma`, no roadmap import. The five `TauCeti.*` imports exist at both pins.

**Headline theorems from the README.**
- Stated: 4.2, 5.5, 6.1, 6.2, 6.3, 7.3, 8.1 and 8.3. The 8.4 corollary is stated and proved from 6.3.
- Not stated, as corollaries one step from a stated headline: the form-level 72:1 (7.2) and global hyperbolicity (8.2). They follow through the pinned `IsLocalRealization.equivalent_atFinitePlace` / `equivalent_atRealPlace`, and `QuadraticForm.locally_formClass_eq_nsmul_hyperbolicClass_iff` with 6.3.
- 4.3, 5.1 and 7.4 are route steps subsumed by stated headlines.
- No stand-in carriers are used. No pin already proves a headline: `ideleHilbertCharacter_eq_one_iff` (`Global/IdeleCharacter.lean:200`) asks for a square at every finite place and positivity at every real place, which is a different statement.

**Sources checked at their locators (milne-cft, certified).** Each matches the README's use.
- VIII Theorem 1.1, p. 229 (line 10384): the n-th-power local–global statement for fields containing μ_n, here n = 2.
- Exercise 1.3, p. 229 (line 10397): 16 is an 8th power in ℝ and in ℚ_p for odd p.
- Theorem 3.1, p. 234 (line 10629): the Hasse norm theorem for cyclic L/K.
- Theorem 3.5, p. 235 (line 10686): isotropy, nondegenerate forms.
- Proposition 3.7(b),(c), p. 236 (line 10698).
- The proof of 3.5(b), p. 237 (lines 10772–10804): binary through 3.7(b) and 1.1; ternary through 3.7(c).
- Proposition 6.2, p. 251 (line 11574): Witt cancellation.
- Theorem 6.3, p. 252 (line 11619): isometry over all v.
- Theorem 6.10, p. 255 (line 11745): rank, discriminant and Hasse invariant classify forms over a nonarchimedean local field.
- Remark 6.6 (line 11677): Milne's `S = ε·(-1, d)`, so 7.4's conversion is right.

7.2's statement also agrees with Milne VIII Theorem 6.12, p. 256 (line 11792), once the i ≤ j product is converted to i < j.

**Library declarations opened** (`TauCeti/` at `2fd255d` unless marked).

Tau Ceti, universe binders of the route inputs:
- `Global/ProductFormula.lean:61` and `:100` are `{K : Type}`.
- `Global/PrescribedLocalForms.lean:69` and `Global/SignPrescription.lean:72` are `{K : Type}`.
- `ClassFieldTheory/Global/HasseNorm/Quadratic.lean:41` is `{K : Type}`; at `:45` it assumes a nonsquare `d` and quantifies over all infinite places.
- `ClassFieldTheory/Global/IdeleClass/FirstInequality.lean:68` and `:103–108` take `K L : Type` with `[IsGalois K L] [IsCyclic Gal(L/K)]`.
- These are exactly the README's eight inputs, plus the worked example `Sqrt5.lean:57`.
- Everything else cited is `Type*` or `Type u`:
  - `LocalRealization.lean:97` and `Existence.lean:64`;
  - `HigherRank.lean:53` and `ApproximateValue.lean:52`;
  - `Classification.lean:81` and `FormInvariants.lean:71`;
  - `Hyperbolicity.lean:89` and `WittLocalization.lean:86`;
  - `Quaternary.lean:67`, whose `:137` hypothesis is the ternary case over every `L : Type u`.

Tau Ceti, statements read:
- `Global/Invariants.lean:90` (the record) and `:178` (`IsAdmissible`, the seven clauses the README lists).
- `Global/LocalRealization.lean:108` (`IsLocalRealization`) and `:271` (`ofLocalForms`).
- `Global/ApproximateValue.lean:60`: needs `U ≠ 0` and regular `W`, and concludes `U x ≠ 0`.
- `Global/AnisotropicPlaces.lean:90`: rank ≥ 3.
- `Global/DefiniteObstruction.lean:68`: rank `n + 1 ≥ 5` and one real place `w₀`.
- `NumberField/Global/Approximation/SquareClass.lean:40`.
- `NumberField/Global/Ideles/Norm/Range.lean:115`: no Galois hypothesis.
- `RingTheory/DedekindDomain/AdicValuation/Transport.lean:119` (`valuation_ringEquivOfRingEquiv`, for `σ = IsFractionRing.ringEquivOfRingEquiv e`) and `:140` (`adicCompletionCongr`).
- `RingTheory/DedekindDomain/Ideal/Basic.lean:279` (`asIdeal_equivOfRingEquiv`).
- `NumberTheory/HilbertSymbol/Basic.lean:47`: `1` exactly when `b = x² - a y²` is solvable.
- `Archimedean.lean:59`: `-1` exactly when both arguments are negative.
- `NumberTheory/LocalField/QuadraticForm/Hasse.lean:93`: `localHasse` is the product over i < j.

Mathlib at `1b1ccf4`, all also present at `f6090c7`:
- `NumberTheory/NumberField/InfinitePlace/Ramification.lean:45` (`comap`), `:82` (`isReal_comap_iff`, for a `≃+*`) and `:90` (`comap_embedding_of_isReal`).
- `NumberTheory/NumberField/Basic.lean:193` (`RingOfIntegers.mapRingEquiv`).
- `RingTheory/DedekindDomain/Ideal/Lemmas.lean:592` (`equivOfRingEquiv`, `v ↦ comap e.symm v`).
- `FieldTheory/IntermediateField/Adjoin/Basic.lean:423` (`adjoinRootEquivAdjoin`, needs `IsIntegral`).
- `FieldTheory/PrimitiveElement.lean:209`.

**Cross-roadmap citations resolved.**

On main:
- ClassicalArithmeticCompletion `README.md:189`, `:804` and `:2607` link `#layer-4-global-square-norm-and-approximation-lemmas`, which matches the heading at :324.
- Completed OrthogonalSpinGroups `README.md:947` and `:965` cite `hasseMinkowski_equivalent`.
- IntegralLattices cites both Lean names.
- QuadraticFormInvariants `:187` and ClassFieldTheory `:216` assign Hasse–Minkowski and the global classification to this roadmap.

At open heads:
- OrthogonalSpinGroups (#1181) links `#43-the-quadratic-hasse-norm-adapter`, `#61-scalar-representation`, `#63-hasseminkowski-isometry` and `#84-the-form-theoretic-so-kernel-consequence`. All four match.
- MetaplecticAutomorphicForms (#1063) cites Layer 3 (lines 52, 1626, 1628, 1829), which the section map resolves at :63–66, and the real symbol of Layer 4.4 (line 427), resolved at :68–69. This is the overlap file's “dropped Layer 3” lead; the README gives the old → new map, so it is not a finding.
- GL2AutomorphicRepresentationsAndTransfer (#931) cites `exists_hilbertSymbol_eq_neg_one_iff_pair`, mapped at :72–73.
- GeometryOfNumbersAndQuadraticArithmeticPartII (#1691) cites §§8.1–8.3, §§2–4 and §4.4.
- GeometryOfNumbersAndQuadraticArithmetic (#851), AdelicAlgebraicGroups (#792), HeightsRationalPointsAndObstructions (#1017) and ArithmeticStatisticsPartV (#1175) cite Layers 5–6.
- All of these resolve.

Ownership:
- Searching main and every open head for number-field universe transport (`adicCompletionCongr`, “number field in `Type`”) finds only this README.
- QuadraticFormInvariantsPartII (#1834) has no Hasse–Minkowski hit, and the other close roadmaps cite this one. No object has two owners.

**Adversarial table.** Notation: `H = ⟨1,−1⟩`; `(a,b)_v = 1` exactly when `b = x² − a y²` is solvable. The table covers every sampled target, every headline and every finding.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Conventions: plain vs signed discriminant | `H`, `⟨1,1⟩` | `H`: plain `[−1]`, signed `(−1)^1·[−1] = [1]`; `⟨1,1⟩`: `[1]` and `[−1]` | Check correct | none |
| Conventions: Hasse i<j vs i≤j | `H` over ℝ | i<j: `(1,−1) = 1`; i≤j: `(1,1)(1,−1)(−1,−1) = −1` | correct | none |
| Conventions: real symbol and real Hasse sign | `(−1,−1)_ℝ`, `⟨−1,−1⟩` | `x²+y² = −1` unsolvable → `−1`; q = 2: `(−1)^1 = −1` | correct | none |
| Conventions: `(−1,3)` at all places | v = 3, 2, ∞, p∤6 | `(−1/3) = −1`; 2-adic `(−1)^(ε(−1)ε(3)) = −1`; `3 > 0` → 1; units → 1 | `−1` at two places, product 1 | none |
| Conventions: zero-form record | 0-dim form | `(0, [1], s ≡ 1, p ≡ 0)`; `1 ≤ 0` false | realized, not admissible | none |
| 4.1 places follow σ [sample] | conjugation on ℚ(i), `2+i` | mod `(2−i)`: `i ≡ 2`, `2+i ≡ 4 = 2²` in 𝔽₅ → square in `K_𝔭̄`; `v_𝔭(2+i) = 1` → nonsquare in `K_𝔭`; `σ𝔭̄ = 𝔭` | Check correct; a place-fixing transport is refuted | none |
| 4.1 real places [sample] | ℚ(√5), `⟨1,θ,θ⟩` and its model | `θ ↦ 1.618`: p = 3; `θ ↦ −0.618`: p = 1; the same at `X̄ ↦` the same reals | correct | none |
| 4.1 model in `Type` [sample] | K ≅ ℚ; ℚ(√5) | α = 0: `AdjoinRoot X ≅ ℚ`; α = θ: `AdjoinRoot (X²−X−1)` | correct | none |
| 4.1 local realizations | `exists_locallyRepresents_prod` at `Type u` | hypothesis forms `U_v` over `K_v`; listed transports cover global forms, localizations, global symbols and records only | not covered | R02 |
| 4.2 global square [sample/headline] | a = 4, S = ∅ | `4 = 2²` in every ℚ_p and in ℚ | T/T | none |
| 4.2, hypothesis fails | a = −1, 2, −4, 17 over ℚ | −1 nonresidue at p ≡ 3 (4); 2 at p ≡ ±3 (8); −4 as −1, also at 2; 17 ≡ 1 (8) but 17 ≡ 2 (3) is a nonresidue | hypothesis F, conclusion F | none |
| 4.2, eighth powers | 16 over ℚ | p = 3: −2 ≡ 1 is a square; p = 5: −1 ≡ 4; p = 7: 2 ≡ 9; `v₂(16) = 4` is not ≡ 0 (mod 8) | analogue false, S = {2} | none |
| 4.2, route step 3 | `i₃ = 3`, α = 12 | `12/3 = 4 = 2²` | the cited lemma supplies such an α | none |
| 4.2, route step 5 | nonsquare a, `E = K(√a)` | Gal = ℤ/2, cyclic; surjective norm → index 1; `2 ≤ 1` false | contradiction | none |
| First-inequality contract | `L = ℚ(∛2, ζ₃)`, Galois group S₃ | `[L:ℚ] = 6` vs norm index `[ℚ(√−3):ℚ] = 2` | cyclic hypothesis needed and stated | none |
| 4.2 warning | ℚ, S = {∞} | usual `I^S`: `q = ∏ p^(v_p(i_p))`, `q⁻¹i ∈ I^S` → identity true; “1 at S”: `i_∞ = √2` → `q = √2 ∉ ℚ` → false | truth depends on undefined notation | R03 |
| 4.3 [sample] | d=−1, a=5; d=−1, a=3; d=2, a=−1; d=−1, a=−1 | `5 = 1²+2²` T/T; `(−1,3)₃ = −1` F/F; `1 − 2 = −1` T/T; `−1 = x²+y²` fails at ℝ F/F | correct; d = 1 excluded | none |
| 5.1 binary [sample] | `⟨1,1⟩` over ℚ, `⟨1,1⟩` over ℚ(i), `H` | `−det = −1` nonsquare in ℚ₃ F/F; `−1 = i²` T/T; `−det = 1` T/T | correct | none |
| 5.1 ternary [sample] | `⟨1,1,−2⟩`, `⟨1,1,−3⟩`, `⟨1,1,1⟩` | (1,1,1) is a zero T/T; `(−1,3)₃ = −1` F/F; `(−1,−1)_v = −1` exactly at {2, ∞} F/F, an even count | correct | none |
| 5.1 nonsquare-d step | z = 0 in `x² − d y² − a z²` | `x² = d y²` forces x = y = 0 | correct | none |
| 5.5 isotropy [sample/headline] | rank 0, `⟨a⟩`, `H`, `⟨1,1,−3⟩`, `⟨1,1,1,1,1⟩`, `⟨1,1,1,1,−1⟩` | F/F, F/F, T/T, F/F (ℚ₃), F/F (ℝ), T/T via (1,0,0,0,1) | correct | none |
| 5.5 without regularity | `⟨1,0⟩` | radical `e₂`: `Q(e₂) = 0` over K and after every base change | T/T; the README notes it | none |
| 5.5 higher-rank step, T = ∅ | `U = ⟨1,1⟩`, `W = ⟨1,−1,1⟩` | x = 0: b = 0, `⟨0⟩ ⊥ W` singular; x = (1,0): b = 1, y = (0,1,0), `W(y) = −1` | pinned lemma has `U x ≠ 0` | none |
| 5.5, one real place | ℚ, `⟨1,1,1,1,1⟩` | isotropic at every ℚ_p (rank 5), anisotropic at ℝ | matches the Tau Ceti example | none |
| 6.1 scalars [sample/headline] | `⟨1,1⟩` with a = 3, −1; `H`; 0-dim with a = 1 | F/F (ℚ₃); F/F (ℝ, ℚ₂); `((1+a)/2, (1−a)/2)` T/T; `Q(0) = 0 ≠ 1` F/F | correct | none |
| 6.1 with a = 0 | any Q | `Q(0) = 0` on both sides | T/T; `a ≠ 0` only keeps `⟨−a⟩ ⊥ Q` regular | none |
| 6.2 forms [sample/headline] | `⟨3⟩ → ⟨1,1⟩`; `⟨1,1⟩ → ⟨1,1,1,1⟩`; `⟨c⟩ → H`; 0-dim → R; rank 2 → rank 1 | F/F; T/T; `((1+c)² − (1−c)²)/4 = c` T/T; T/T; F/F | correct | none |
| 6.3 isometry [sample/headline] | `H` vs `⟨2,−2⟩`; `⟨1⟩` vs `⟨−1⟩`; `⟨1,1,−3⟩` vs `⟨1,1,−1⟩`; ranks 1 vs 2 | T/T; F/F (ℝ); F/F (ℚ₃: `−3/−1 = 3` nonsquare); F/F | correct | none |
| 7.2 existence [sample] | `⟨1⟩` data; rank 3, d = [1], `R = ⟨1,1,1⟩`, `s₂ = −1`; `⟨−1,−1,−1⟩` | T; product `(−1)·1 = −1` → excluded; `s₂ = (−1,−1)₂³ = −1`, real `(−1)^3 = −1`, product 1 | correct | none |
| 7.2 correction plane | α = 2, β = 5 | `d(P) = [−5] = d(P′) = [−20]`; `(2,5)₅ = −1`, `(2,5)₂ = (−1)^((25−1)/8) = −1`, `(2,5)_∞ = 1` | flips exactly {2, 5} | none |
| 7.2 vs Milne 6.12 | product over i ≤ j | `S_v = s_v·(−1,d)_v` and `∏_v (−1,d)_v = 1` | product conditions equivalent | none |
| 7.2 local-class remark | ℝ, rank 4, d = [1] | (4,0), (2,2), (0,4): Hasse 1, −1, `(−1)^6 = 1` | three classes, two with one sign | R04 |
| 7.3 realization [sample/headline] | `⟨1⟩` record; zero record; rank 1 with s = −1 at {2,3}; rank 2, d = [−1], s = −1 at {2,3} | T↔T; realized, `1 ≤ 0` false; product 1, inadmissible; product 1, inadmissible (local form hyperbolic) | correct with positive rank | none |
| 7.3 at `Type u` | route through 7.2 | needs `exists_locallyRepresents_prod` (`K : Type`) | 4.1 list incomplete | R02 |
| 7.4 uniqueness [sample] | `⟨1,1⟩`, `⟨2,2⟩` | both `(2, [1], s = 1` since `2 = 2² − 2·1²`, `p = 2)`; Milne's factor `(−1,1) = 1` on both | isometric | none |
| 8.1 classification [sample/headline] | `⟨1,1,−1⟩` vs `⟨1,2,−2⟩`; `⟨1⟩` vs `⟨−1⟩`; two zero forms; zero vs `⟨1⟩` | d `[−1]`, `[−4] = [−1]`; s 1, 1; p 2, 2 → T/T; p 1 ≠ 0 → F/F; T/T; rank 0 ≠ 1 → F/F | correct | none |
| 8.2 hyperbolicity [sample] | `⟨1,−1,2,−2⟩`; `⟨1,1⟩`; `⟨1⟩` | m = 2 → T/T; `[1] ≠ [−1]` → F/F; odd rank → F/F | correct | none |
| 8.2 Witt version | Q = `⟨1,1,−3⟩`, R = `⟨1,1,−1⟩` | `Q ⊥ (−R) ∼ ⟨1,−3⟩`; at ℚ₃, `−(1·−3) = 3` is a nonsquare → not hyperbolic | F/F | none |
| 8.3 Witt injectivity [sample/headline] | 0, [H], [⟨1⟩], [⟨1,1⟩], [⟨1,1,−3⟩ ⊥ ⟨−1,−1,1⟩] | 0/0; 0/0; odd dimension at every v; real signature 2; `⟨1,−3⟩` nonzero at ℚ₃ | no spurious kernel | none |
| 8.3, complex places | [⟨1⟩] in `W(ℂ) = ℤ/2` | 1 = dimension mod 2, already seen at every finite place | omission justified | none |
| 8.4 corollary [sample] | `H` vs `⟨2,−2⟩`; `⟨1⟩` vs `⟨−1⟩` | hypothesis T → conclusion T; hypothesis F at ℝ | correct (proved from 6.3) | none |
| Worked example ℚ(√5) | `θ = (1+√5)/2`, `⟨1,θ,θ⟩` | θ a unit (`θ(θ−1) = 1`); signatures (3,0), (1,2); `d = [θ²] = [1]`; `s = (θ,−1)`: real 1, −1; odd v 1; 𝔭₂ forced to −1; product 1; `x²−x−1` irreducible mod 2 | admissible, 2 inert | none |
| Supplier pin | the 16 names at `358314d` vs `2fd255d` | 0 hits each vs 16 found | absent at the branch pin | R01 |
| Degenerate cases | characteristic p, inseparable extensions, the zero ring | excluded: K is a number field (characteristic 0); 𝔽₂-residue places tested above via ℚ₂ and ℚ(√5) at 2 | n/a | none |

## Not verifiable

- **O'Meara, *Introduction to Quadratic Forms*** (DOI 10.1007/978-3-642-62031-7). The manifest records it as `uncertified` (paywalled). The locators 58:7, 65:15, 66:1, 66:3, 66:4, 66:5, 71:19, 71:19a and 72:1 (for 4.2, 5.5, 6.1–6.3, 7.2, 7.3 and 8.1) are therefore not checked against the text. The mathematics of each was checked directly in the table, and 4.2, 5.5, 6.3, 7.2 and 8.1 also have Milne counterparts that I read (VIII 1.1, 3.5, 6.3, 6.12, 6.3 with 6.10).
- **Serre, *A Course in Arithmetic*** (DOI 10.1007/978-1-4684-9884-4): `uncertified` (paywalled). The i<j Hasse convention it is cited for agrees with the pinned `localHasse`.
- **Elaboration at main's pins** (`2fd255d`, `1b1ccf4`, `v4.36.0-rc2`), after the merge requested in R01, was not run: this review may run Lean only in this worktree, at its own pins. The carriers used by the statements are unchanged between the pins (see R01).

## Source issues

- **Misprint** in milne-cft at VIII, proof of Theorem 3.5(b), p. 237 (line 10777): the source says the cases n = 3, 4 follow from 3.7(c),(d) and Theorem 1.1; it should be Theorem 3.1, the Hasse norm theorem, since Theorem 1.1 concerns n-th powers; affects the proof.
- **Misprint** in milne-cft at VIII, proof of Theorem 3.5(b), p. 237 (line 10788): the source says the induction assumes Theorem 3.1b for n − 1; it should be Theorem 3.5(b); affects nothing.
- **Gap** in milne-cft at VIII, proof of Theorem 3.5(b), p. 237 (lines 10794–10804): the source picks c = a x₁² + b x₂² near c_v for v in S but never ensures c ≠ 0 when S is empty; it should choose x₁, x₂ with c ≠ 0 so that cY² − r is nondegenerate; affects the proof.
- **Misprint** in milne-cft at VIII, proof of Theorem 6.3, p. 252 (lines 11626–11627): the source names the complements q₁ and q₂ and concludes q₁ ≅ q₂; it should read q′₁ for q₂, the complement of aZ² in q′; affects nothing.
