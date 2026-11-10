# Review of GlobalQuadraticForms (pull request #1200 at bf7aba3)

**Verdict:** needs changes

This is a full review of the head. It finds two P3 findings and nothing blocking. The mathematics, the locators I could read, the Tau Ceti and Mathlib names, the cross-roadmap citations and the build all check out (details under *Verified sound*).
- R01 is in `Suggested.lean` (8.3).
- R02 is in the pull-request description's generated merge-order block.

## R01 (P3) — 8.3 re-encodes `TauCeti.WittRing.globalToLocal` on a second `Invertible 2` instance

**Location.** `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean:147–153`:
- `theorem injective_wittRing_baseChange_places [Invertible (2 : K)] : Function.Injective fun x : TauCeti.WittRing K => (… baseChange (L := v.adicCompletion K) x, … @TauCeti.WittRing.baseChange K ℝ _ _ (embedding_of_isReal w.2).toAlgebra _ _ x)`

The README says the same in three places:
- `README.md:115–116`: "any instance serves: they are all equal".
- `README.md:1092–1093`: "This map is `TauCeti.WittRing.globalToLocal` …; the Lean statement writes its components out".
- The module docstring, `Suggested.lean:23`.

**Claim.** The statement is the injectivity of Tau Ceti's global-to-local map.

**Witness.** At the pin, `TauCeti.WittRing.globalToLocal K` (`NumberTheory/QuadraticForm/Global/WittLocalization.lean:167`) takes no `Invertible` argument: it lives on `@WittRing K _ invertibleTwo`. The head's map lives on the local `inst`, and `example : (head's map) = ⇑(globalToLocal K) := rfl` fails with a type mismatch. Its real component is also an inline copy of `TauCeti.WittRing.atRealPlace` (`:94`).

The two statements are equivalent, but only after:
- `obtain rfl : inst = invertibleTwo := Subsingleton.elim _ _`, and
- rewriting with `globalToLocal_apply_fst`, `globalToLocal_apply_snd` and `atRealPlace_def`.

So a consumer cannot combine the headline with `globalToLocal_wittClass_formClass` or `globalToLocal_eq_zero_iff` directly.

**Repair.**
- `Suggested.lean`:
  - Replace the import `TauCeti.LinearAlgebra.QuadraticForm.Witt.BaseChange` by `TauCeti.NumberTheory.QuadraticForm.Global.WittLocalization`.
  - Replace the statement by `theorem injective_wittRing_baseChange_places : Function.Injective (TauCeti.WittRing.globalToLocal K) := sorry`, keeping the name.
  - At line 23, write "the Witt ring `TauCeti.WittRing` with its global-to-local map `TauCeti.WittRing.globalToLocal`".
- `README.md:115–116`: write "the Witt ring of a number field carries Mathlib's instance `invertibleTwo`, the one `TauCeti.WittRing.globalToLocal` uses".
- `README.md:1092–1093`: write "The Lean statement is the injectivity of `TauCeti.WittRing.globalToLocal`, a ring homomorphism".
- The description's *Relation with #1215* then no longer needs the sentence "This head instead writes that map's components out".

This is #1215's text for 8.3, so it also removes one conflict with #1215.

Tested on a scratch copy with exactly these `Suggested.lean` edits: `lake env lean` exits 0 with eight `sorry` warnings and nothing else. In a second scratch file, the head's statement follows from the repaired one by the three steps above, and that file also elaborates.

## R02 (P3) — The generated `merge-order` block omits #617, which now carries #1215's copy of this folder

**Location.** The description's `<!-- merge-order -->` block: "**Shared folders.** … `GlobalQuadraticForms`: #1215 → **this pull request**."

**Claim.** #1215 is the only other open pull request that changes this folder.

**Witness.** #617's head `dec9d6b8` ("Merge main and the ClassFieldTheory revision of #1215") has #1215's head `6aa9b5bf` as an ancestor. Its `TauCetiRoadmap/GlobalQuadraticForms/README.md` and `Suggested.lean` are byte-identical to #1215's, and both differ from main.

A three-way `git merge-file` of this head's files with #617's copies, both against main's version, gives 26 conflict hunks in `README.md` and 4 in `Suggested.lean`. #617 merged #1215 at 04:21. The overlap index read in this job dates from 04:10, so it does not list #617.

**Repair.** Regenerate the block so that the shared-folder line reads `GlobalQuadraticForms`: #1215 → #617 → **this pull request**. In *Relation with #1215*, add one sentence: #617 carries #1215's copy of this folder unchanged, and this branch is rebased onto whichever of the two merges first.

## Previous findings

- **Previous R01 — repaired.** It concerned the description's *Pins* and *Relation with #1215* sections.
  - *Pins* now reads: "This branch contains main, and its manifest is main's (Tau Ceti `2fd255d`, Mathlib `1b1ccf4b`). The pull request does not change the manifest, and `Suggested.lean` builds at those pins."
  - *Relation with #1215* now reads: "This head instead writes that map's components out; `TauCeti.WittRing.globalToLocal` exists at the pins, and the README's 8.3 names it as the map."
  - Both are true at the head. `git diff HEAD origin/main -- lake-manifest.json lean-toolchain` is empty: main has moved five commits since the merge base `4452ffa3`, without touching the manifest or this folder.
  - The second sentence is the text R01 above asks to retire.

## Verified sound

**Gate, dependency check, scope.**
- **Gate.** The gate rerun on this head prints every check at 0 and `OK`; the worker's gate adds `build=0`.
- **Dependency check.** Output: `depcheck: 233 roadmaps, 2259 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line, no roadmap supplier and no `gap:` contract. This roadmap is on main and consumes only Mathlib and Tau Ceti, as required.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GlobalQuadraticForms'` is empty.
- **Changes inside the folder.** Only `README.md` and `Suggested.lean` change. `PROGRESS.md`, `STATUS.md` and `metadata.toml` are main's.
- **Process words.** No process words, LaTeX delimiters, `lemma`, `set_option`, `#eval` or placeholders in either file.

**Lean.**
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 at Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, with 8 `sorry` warnings at lines 51, 68, 76, 84, 93, 111, 120 and 147 and nothing else.
- **Signatures.** A scratch file with `#check @…` for all 9 declarations elaborated, and each type matches its README statement:
  - `FiniteDimensional` and both `Nondegenerate` hypotheses on 5.5, 6.1, 6.2, 6.3, 8.1 and 8.4;
  - `a ≠ 0` on 6.1;
  - independent universes for `V` and `W`;
  - `K` in any universe.

  No section binder is lost, and I changed nothing.
- **One-tactic probe.** On a scratch copy, each `sorry` was replaced by `first | rfl | infer_instance | (simp; done) | (simp_all; done) | exact?`. All 8 failed (`exact?` could not close the goal).
- **8.4.** `equivalent_of_locallyEquivalent` is proved in one term from 6.3, not from the library. I keep it because Integral Lattices on main cites it backticked (`IntegralLattices/README.md:477`, `:916`, `:1028`). It is not padding by the criteria.
- **Headlines.** The headline theorems are 4.2, 5.5, 6.1, 6.2, 6.3, 7.3, 8.1, 8.3 and 8.4, and all nine are stated. The README targets with no Lean statement do not need one:
  - 4.3, 5.1 and 7.4 are route steps;
  - 7.2 and 8.2 are corollaries of 7.3 and 8.3 plus Tau Ceti lemmas.
- **Ownership by object in Tau Ceti.** I grepped for Hasse–Minkowski, the global square theorem, an injectivity statement for `globalToLocal`, and `LocallyEquivalent → Equivalent`. What exists is conditional only:
  - quaternary and higher-rank steps (`Quaternary.lean:129`, `HigherRank.lean:83`);
  - `globalToLocal_eq_zero_iff`, which describes the kernel but does not prove it trivial;
  - `WittLocalization.lean:40` says injectivity is not proved there.

  The uncited files `RankOne.lean`, `DiagonalApproximation.lean`, `SummandExchange.lean`, `Discrepancy.lean`, `IdeleCharacter.lean`, `CohomologicalSymbol.lean` and `Continuity.lean` are inputs of the existence reduction or special cases; none states a headline.

**Library names: 175 `#check`ed at the pins.**
- **Coverage.** Every backticked dotted name in the README was `#check`ed in one scratch file importing the 70 Tau Ceti modules involved. All resolve. The only misses are prose short forms of names given in full nearby: `IsLocallyIsotropic`, `RegularFormClass.localHasse`, `adicCompletionCongr`, `equivOfRingEquiv`, `mem_range_ideleNormMap_iff`.
- **Inputs stated only for `K : Type`.** Exactly eight, as the contract says:
  - `exists_locallyRepresents_prod`;
  - `globalInvariants_hasseProduct_eq_one`;
  - `isAdmissible_globalInvariants`;
  - `exists_sq_sub_mul_sq_iff_forall_completion`;
  - `finrank_le_index_range_ideleClassNormMap`;
  - `exists_hilbertSymbol_eq_ite`;
  - `exists_pair_hilbertSymbol_eq_ite`;
  - `hilbertSymbol_productFormula`.

  Every other input is universe-polymorphic.
- **Statements read against the README's descriptions.**
  - `IsLocallyIsotropic`, `LocallyRepresents`, `LocallyRepresentsScalar` and `LocallyEquivalent` are conjunctions over finite and real places (`Predicates.lean:51`, `:66`, `:85`, `:147`).
  - `GlobalFormInvariants` and `IsAdmissible` (`Invariants.lean:90`, `:178`): the seven clauses match `README.md:274–276`.
  - `localHasse` uses the product over `i < j` (`LocalField/QuadraticForm/Hasse.lean:78`).
  - The quaternary step needs the ternary case over every `L` in the universe of `K`, for `presentedForm p` with `p.1 = 3`. The rank-at-least-five step needs rank `n − 1` for `presentedForm`. Both match 5.1 and 5.5.
  - `ideleClassNormMap_surjective_of_forall_range_normUnits_eq_top` is about norms from `K_v ⊗[K] L` (`Ideles/Norm/Surjective.lean:198–201`), as 4.2 says.
  - `exists_fieldUnit_isSquare_div_at_places` matches its contract line.
  - `QuadraticMap.Nondegenerate` is the radical being `⊥` plus a rank bound on the polar kernel (Mathlib `LinearAlgebra/QuadraticForm/Radical.lean:115`), as the contract says.
  - The diagonalization input of 5.1 needs Mathlib `QuadraticMap.nondegenerate_associated_iff` (`Radical.lean:159`) to pass from `Nondegenerate` to a separating form. Tau Ceti's `exists_presentedForm_equivalent` (`RegularFormClass/Basic.lean:656–659`) does exactly this, and 5.5 already cites it, so no change is needed.
- **Mathlib paths.** All 16 files the Mathlib contract names exist at the pin and contain the named declarations. `injective_iff_map_eq_zero` is the additive form of `Algebra/Group/Hom/Basic.lean:193`.

**Cross-roadmap citations resolved.**
- **Consumers on main.**
  - Integral Lattices cites `hasseMinkowski_equivalent` and `equivalent_of_locallyEquivalent` (`:477`).
  - Completed/OrthogonalSpinGroups cites `GlobalQuadraticForms.hasseMinkowski_equivalent` (`:947`, `:965`).
  - Classical Arithmetic Completion cites Layer 4's real symbol and product formula (`:165`, `:189`, `:783`, `:793`). Its anchor `#layer-4-global-square-norm-and-approximation-lemmas` resolves.
- **Consumers at open heads.**
  - OrthogonalSpinGroups (#1181) cites 4.3, 6.1, 6.3 and 8.4 with anchors `#43-…`, `#61-…`, `#63-hasseminkowski-isometry` and `#84-the-form-theoretic-so-kernel-consequence`. All resolve here. "Orthogonal and Spin Groups consumes 4.3 and 6.1" (`README.md:1167`) is true of that open revision, not of the completed text on main.
  - K3Surfaces, K3SurfacesAndSymplecticBoundedness, AdelicImagesAndModularCurves, QuaternionArithmetic, GeometryOfNumbersAndQuadraticArithmetic and HilbertModularVarietiesAndShimuraCurves cite 5.5, Layer 5, Layer 6, 6.1, 6.3 or 4.4. All resolve.
- **Dropped Lean name.** Main's `exists_hilbertSymbol_eq_neg_one_iff_pair` is cited by GL2AutomorphicRepresentationsAndTransfer (#931, `README.md:408`, `:2265`) and QuaternionArithmetic (#1722, `README.md:288`). `README.md:86–87` maps it to `exists_pair_hilbertSymbol_eq_ite`, whose statement is main's with `= if … then -1 else 1` in place of `= -1 ↔ ∈`.
- **Dropped section ids.** No roadmap on main or at an open head cites main's 4.1, 4.5, 5.2–5.4, 7.1 or Layer 9 (`roadmaps grep`).
- **Ownership against open pull requests.** I checked every open pull request with `roadmaps grep` for Hasse–Minkowski, the global square theorem and sign prescription, and read QuadraticFormInvariantsPartII's scope. All of them consume this roadmap; none owns these objects.

**Sources: milne-cft read at every Milne locator in the README.** Printed page = PDF page − 9.
- **Theorem 1.1, p. 229** (milne-cft line 10384). `K` contains a primitive `n`-th root of 1, so for `n = 2` this is 4.2. Exercise 1.3, same page (line 10397), is the eighth-power check.
- **Theorem 3.1, p. 234** (line 10629): cyclic Hasse norm theorem, for 4.3 with `K(√d)/K`.
- **Theorem 3.5, p. 235** (line 10686), **Proposition 3.7(b),(c), p. 236** (line 10698), and the proof of 3.5(b), p. 237 (lines 10772–10778): for 5.1. The README correctly uses Theorem 3.1 for the ternary step where the printed proof says 1.1 (see *Source issues*).
- **Proposition 6.2, p. 251** (line 11574): Witt cancellation, for 8.2.
- **Theorem 6.3, p. 252** (line 11619): forms equivalent at all places are equivalent, for 7.4, 8.2, 8.3 and 8.4. Its "all primes" includes complex places, which Tau Ceti makes automatic.
- **Theorem 6.10 and Proposition 6.11, p. 255** (lines 11745, 11758): with the `i ≤ j` sign. The factor `(−1, d)` that 7.4 states is right: `∏_{i≤j} = ∏_{i<j} · (d, −1)`.
- **p. 256 remarks** (line 11785): `d` and `S` determine `t` only in rank at most 3, as 7.2 says.

**Adversarial table.** Values were computed in this review. "G/L" means global side/local side and "H/C" hypothesis/conclusion.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Conventions: discriminants | `H = ⟨1,−1⟩`; `⟨1,1⟩` | plain `[−1]`, signed `(−1)^1·[−1] = [1]`; plain `[1]`, signed `[−1]` | as stated | none |
| Conventions: Hasse sign | `H` over ℝ | `i<j`: `(1,−1) = 1`; `i≤j`: `(1,1)(1,−1)(−1,−1) = −1` | conventions differ, as stated | none |
| Conventions: real sign | `⟨−1,−1⟩`; `p⟨1⟩⊥q⟨−1⟩` | `(−1,−1)_ℝ = −1 = (−1)^(2·1/2)`; pairs of negatives `C(q,2)` | agree | none |
| Conventions: product formula | `(−1,3)` over ℚ | `(−1/3) = −1` at 3; `(−1)^(1·1) = −1` at 2; `+1` at ℝ | two places, product 1 | none |
| 4.1 finite places | ℚ(i), `σ` = conjugation, `𝔭 = (2+i)` | mod `𝔭̄`: `i ≡ 2`, `2+i ≡ 4 = 2²`, unit; `v_𝔭(2+i) = 1`; mod `𝔭`: `2−i ≡ 4` | square moves to `σ𝔭̄ = 𝔭` | none |
| 4.1 real places | ℚ(√5), `σθ = 1−θ`, `w': θ ↦ 1.618` | `σ` is an automorphism (`(1−θ)² = 2−θ = (1−θ)+1`); `w'.comap σ: θ ↦ −0.618`; `p(⟨1,1−θ,1−θ⟩, w') = 1 = p(⟨1,θ,θ⟩, w'.comap σ)`; fixed place gives 3 | correspondence needed | none |
| 4.2 [headline] | ℚ, `a = 4`, `S = ∅`; ℚ(i), `a = −1` | H true; C `2² = 4`. H true; C `i² = −1` | T/T | none |
| 4.2 [headline] | ℚ, `a = −1`; `a = 2`; `a = −3` | H fails at all `p ≡ 3 (4)`; at `p ≡ ±3 (8)`; at `p ≡ 2 (3)`, infinitely many each | F/F | none |
| 4.2, exponent 8 | ℚ, 16, `S = {2}` | `x⁸−16 = (x²−2)(x²+2)(x²+2x+2)(x²−2x+2)`; one of `2, −2, −1` is a square mod odd `p`; `16^(1/8) ∉ ℚ` | analogue false, matches Milne Ex. 1.3 | none |
| 4.3 | ℚ: `d = −1, a = 5`; `d = −1, a = 3`; `d = 5, a = −1`; `d = 3, a = −1` | `1+4` T/T; `(−1,3)_3 = −1` F/F; `4−5 = −1` T/T; `(3,−1)_3 = (−1/3) = −1` F/F | holds | none |
| 4.3 junk | `d = 0`, `d = 1` | `0 = 0²`, `1 = 1²`: excluded by `¬IsSquare d` | excluded | none |
| 5.1 binary | ℚ: `⟨1,1⟩`, `⟨1,−2⟩`, `⟨1,−4⟩`; ℚ(i): `⟨1,1⟩` | F/F (at 3); F/F (2 nonresidue mod 3); `2²−4 = 0` T/T; `d = [1] = [−1]` T/T | holds | none |
| 5.1 ternary | `⟨1,1,−2⟩`; `⟨1,1,−3⟩`; `⟨1,1,1⟩` | `d = −1, a = 2 = 1+1` T/T; anisotropic exactly at 2, 3 (`(−1,3)_v = −1`) F/F; `(−1,−1) = −1` exactly at 2, ℝ, F/F | holds; even number of places | none |
| 5.5 [headline] | rank 0; `⟨a⟩`; `H` | F/F; F/F; T/T | holds | none |
| 5.5 [headline] | ℚ, `⟨1,1,1,−7⟩` | G: 7 ≡ 7 (8) is not a sum of 3 squares, F; at 2, `−7 ≡ 1 (8)` is a square, form ≅ `⟨1,1,1,1⟩`, anisotropic over ℚ₂ | F/F | none |
| 5.5 [headline] | `⟨1,1,1,1,−1⟩`; `⟨1,1,1,1,1⟩` | `(1,0,0,0,1)` T/T; F/F (at ℝ) | holds | none |
| 5.5 regularity | `⟨1,0⟩` | radical vector `e₂` isotropic globally and after base change: T/T | `hQ` used by the route and 6.1 only | none |
| 6.1 [headline] | `⟨1,1,1⟩`, `a = 7`; `a = 3` | Milne 6.9(c) at 2: `a = −d`, `(−1,−1)_2 = −1 ≠ S = 1`, F/F; `1+1+1` T/T | holds | none |
| 6.1 [headline] | zero form, `a = 1`; `⟨1,1⟩`, `a = −1` | no vector, F/F; F at ℝ and 2, F/F | holds | none |
| 6.2 [headline] | `⟨7⟩ → ⟨1,1,1⟩`; `⟨1,1⟩ → ⟨1,1,1,1⟩`; `⟨c⟩ → H` | F/F (at 2); inclusion T/T; `((1+c)/2,(1−c)/2) ↦ c` T/T | holds | none |
| 6.2 [headline] | zero `Q` into any `R`; rank `Q` > rank `R` | zero map injective, T/T; `finrank_le` gives F/F | holds | none |
| 6.3 [headline] | `⟨1,1⟩` vs `⟨2,2⟩`; vs `⟨21,21⟩` | `(x+y, x−y)`, T/T; `s_3(⟨21,21⟩) = (21,−1)_3 = (3,−1)_3 = −1 ≠ 1`, F/F | holds | none |
| 6.3 [headline] | `⟨1,1,1,1⟩` vs `⟨1,1,7,7⟩` | `d = [1]` both; `s = (7,−1)`: `(−1/7) = −1` at 7, `(−1)^(1·1) = −1` at 2 | F/F | none |
| 7.2 | ℚ, rank 3, `d = [1]`, `R = ⟨1,1,1⟩`, `s_2 = −1` | product `(−1)·1 = −1` | H fails, consistent | none |
| 7.2 | local data of `⟨−1,−1,−1⟩` | `s_2 = (−1,−1)_2³ = −1`, real `(−1)^C(3,2) = −1`, product 1 | realized by the form | none |
| 7.3 [headline] | ℚ, rank 2, `d = [1]`, `p = 2`, `s_3 = s_7 = −1` | `−1` is a nonsquare in ℚ₃ and ℚ₇, so the rank-two clause is void; product `(−1)²·1 = 1`; `⟨21,21⟩`: `s_3 = −1`, `s_7 = (3,−1)_7(7,−1)_7 = 1·(−1) = −1`, `s_2 = 1` (21 ≡ 1 (4)) | admissible and realized | none |
| 7.3 (control) | same with `s_3 = s_5 = −1` | `−1` is a square in ℚ₅, so the rank-two clause forces `s_5 = 1` | not admissible | none |
| 7.3 junk | rank 0; rank 1 with `s = −1` at two places | `1 ≤ n` fails; `isAdmissible_rankOne_iff_eq_empty` | not admissible | none |
| 7.4 / 8.1 [headline] | `⟨1,1,−1⟩` vs `⟨1,2,−2⟩` | `d`: `[−1]`, `[−4] = [−1]`; `s`: `(1,1)(1,−1)(1,−1) = 1`, `(1,2)(1,−2)(2,−2) = 1`; `p = 2` both | equal records, isometric | none |
| 8.1 [headline] | rank 0 vs rank 0; zero form vs `⟨1⟩` | `(0,[1],1,0)` both, T/T; ranks differ, F/F | holds | none |
| 8.2 | `⟨1,−1,2,−2⟩`, `m = 2` | `d = [4] = 2•[−1]`; `s = (−1,2)(−1,−2) = (−1,−4) = (−1,−1)^C(2,2)`; `p = 2` | locally `2H`, globally `2H` | none |
| 8.3 [headline] | `[⟨1,1,−3⟩] − [⟨1,1,−1⟩]`; `[H]`; `[⟨1⟩]` | at ℚ₃ the first is anisotropic and the second isotropic, so nonzero; 0 everywhere; odd dimension, nonzero at every `v` | consistent with injectivity | none |
| 8.3 Lean form (R01) | head's map vs `⇑(globalToLocal K)` | `rfl`: type mismatch (`inst` vs `invertibleTwo`); `Subsingleton.elim` + 3 rewrites: equal | equivalent but not the native map | R01 |
| 8.4 [headline] | `⟨1,1⟩`, `⟨2,2⟩` | locally isometric, so isometric by 6.3 | holds | none |
| Worked ℚ(√5) record | `⟨1,θ,θ⟩`, `N(θ) = −1` | `d = [θ²] = [1]`; `s_{(2)} = (θ,−1) = (N θ, −1)_{ℚ₂} = (−1,−1)_2 = −1`; real `p = 3, 1`; real signs `1, −1`; product 1 | admissible, as stated | none |

## Not verifiable

- **O'Meara** (`omeara`): 58:7, 65:15, 66:1, 66:3, 66:4, 66:5, 71:19, 71:19a and 72:1, cited by 4.2, 5.5, 6.1–6.3, 7.2, 7.3 and 8.1. **Serre** (`serre`): Ch. III §1.2 Thm 1, §2.2 Thm 3; Ch. IV §2.1, §3.2 Thm 8. Both are settled in the manifest as uncertified, so I did not request them. Milne supports the statements of 4.2, 5.5 (Thm 3.5(b)), 6.1 (Cor. 3.6, p. 236), 6.3 (Thm 6.3) and 7.2 (Thm 6.12, p. 256). 6.2 and 8.1 rest on O'Meara alone.
- **4.1** has no literature locator: it is a transport construction.
- **Descriptions of #1215 and #617** are not readable with this job's tools. Their folders were read at their heads (`6aa9b5bf`, `dec9d6b8`).

## Source issues

- **Misprint** in milne-cft at VIII, proof of Theorem 3.5(b), p. 237: the source says the cases with three and four variables follow from Proposition 3.7(c),(d) and Theorem 1.1; it should be Theorem 3.1, the Hasse norm theorem, since 3.7(c),(d) reduce isotropy to norms from quadratic extensions; affects the proof.
- **Misprint** in milne-cft at VIII, proof of Theorem 3.5(b), p. 237: the source calls the induction hypothesis Theorem 3.1b; it should be Theorem 3.5(b) for one fewer variable; affects the proof.
- **Misprint** in milne-cft at VIII, proof of Theorem 6.3, p. 252: the source names the two complements of the line `aZ²` as `q₁` and `q₂` and compares those; it should be `q₁` and `q′₁`, the complements in `q` and `q′`; affects the proof.
