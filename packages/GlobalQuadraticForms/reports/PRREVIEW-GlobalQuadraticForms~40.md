# Review of GlobalQuadraticForms (pull request #1215 at 6aa9b5b)

**Verdict:** accepted

This is an incremental re-review of 0 changed lines since 693a416. `TauCetiRoadmap/GlobalQuadraticForms/` is byte-identical at 6aa9b5b: `git diff 693a416..HEAD` touches only `TauCetiRoadmap/QuadraticFormInvariants/README.md` (+22/−8) and `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` (−26), and `lake-manifest.json` is unchanged, so the pins are the same. I checked those two changes wherever this roadmap relies on them, reran the gate, the dependency check, the elaboration, the signature check and the one-tactic probe, and spot-checked eight `milne-cft` locators.

I found no defect, so this report lists no finding.

## Previous findings

- None. The previous review (`~39`, at 693a416) recorded no finding, so nothing needed repair.

## Verified sound

### The change outside the folder (QuadraticFormInvariants)

- **Deleted Layer 6D `example`.** The deleted `example` restated Tau Ceti's `QuadraticForm.equivalent_iff_finrank_eq_and_discr_eq_and_localHasse_eq`. This roadmap does not cite that name or the `example`.
  - It cites the class-level `TauCeti.RegularFormClass.eq_iff_rank_eq_and_discr_eq_and_localHasse_eq` (README line 355) directly from Tau Ceti.
  - That declaration is at `NumberTheory/LocalField/QuadraticForm/Classification.lean:132` at the pin. The element-level form is at line 190.
  - Layer 6D is still a section of QuadraticFormInvariants' README (`### 6D`, line 1668), so the README's deferral at lines 88–90 ("the classification over one nonarchimedean local field: Quadratic Form Invariants, whose results used here are Tau Ceti declarations") still points somewhere real.
- **`h2MuEquivZMod` re-attribution.** The change moves `h2MuEquivZMod` from ClassFieldTheory to Tau Ceti. This README never mentions `h2MuEquivZMod`, `h2MuToBr` or `invMap` (grep: 0 hits), so nothing here is affected.
- **Ownership in QuadraticFormInvariants.** It still assigns Hasse–Minkowski, local–global isotropy and isometry, and global classification and realization to this roadmap:
  - Scope, lines 90–93;
  - Downstream consumers, line 2732, which says this roadmap uses 6C, 6D and the product formula "through the Tau Ceti declarations".

  This matches this README, which names no roadmap supplier.
- **Grep of this README.** There is no "QuadraticFormInvariants" link and no citation of a QuadraticFormInvariants section number that the change could have moved. The only mention is the prose name at line 89.

### Gate, dependency check and elaboration

- **Gate.** The worker's gate at 6aa9b5b reports "Every check passed", including `build=0`.
  - My rerun of `gate … --base origin/main` fails only on `outside-folder=5`.
  - The five files are `TauCetiRoadmap/ClassFieldTheory/{README.md,Suggested.lean}` and `TauCetiRoadmap/QuadraticFormInvariants/{NativeCompletion.md,README.md,Suggested.lean}`, all in folders this brief names as the pull request's own, so none is a finding here.
  - Every other count is 0, including `set_option`, `sorry-data`, `sorry-examples`, `statement-hygiene`, `imports`, `stray-files`, `readme-ids-missing`, `layer-ids`, `target-ids` and `depcheck`.
- **Dependency check.** The output is exactly `depcheck: 234 roadmaps, 2263 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
  - The counts differ from the previous run (235, 2268) only because the content repository's main moved.
  - The README names no roadmap supplier. Every input is a Mathlib or Tau Ceti declaration.
- **Elaboration.** `lake env lean TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` exits 0. Its only warnings are 8 × "declaration uses `sorry`", at lines 53, 70, 78, 86, 95, 113, 122 and 135.
- **Signatures.** I appended `#check @…` for all 8 declarations to a scratch copy and elaborated it.
  - Each elaborated type matches `signatures.md`, up to the namespaces the file opens.
  - `[FiniteDimensional K V]` and `[FiniteDimensional K W]` appear wherever `V` or `W` occur. `Nondegenerate` and `a ≠ 0` appear where the README states them.
  - No section binder is lost. Nothing changed.
- **One-tactic probe.** On a scratch copy I replaced each `sorry` with `first | rfl | (simp; done) | infer_instance | decide | exact?`. All 8 fail with "`exact?` could not close the goal", at lines 57, 73, 81, 91, 100, 117, 128 and 137. There is no padding.

### Library declarations and citations

- **Tau Ceti declarations at the pin.** These are at the same file and line as in the previous report:
  - `finrank_le_index_range_ideleClassNormMap` (`Global/IdeleClass/FirstInequality.lean:108`);
  - `exists_sq_sub_mul_sq_iff_forall_completion` (`Global/HasseNorm/Quadratic.lean:45`);
  - `ideleClassNormMap_surjective_of_forall_range_normUnits_eq_top` (`Global/Ideles/Norm/Surjective.lean:198`);
  - `globalToLocal` (`WittLocalization.lean:167`);
  - `not_anisotropic_of_isLocallyIsotropic_quaternary` (`Quaternary.lean:137`);
  - `not_anisotropic_of_isLocallyIsotropic_of_five_le_finrank` (`HigherRank.lean:87`);
  - `IsAdmissible` (`Invariants.lean:178`);
  - `exists_hilbertSymbol_eq_ite` (`SignPrescription.lean:154`);
  - `locally_formClass_eq_nsmul_hyperbolicClass_iff` (`Hyperbolicity.lean:116`).

  The other 166 resolved names of the previous report are unchanged with the pin.
- **Cross-roadmap citations.** `roadmaps resolve` on this README reports none found nowhere, against main (be0b3b1) and 454 open heads.
- **Ownership.** A `roadmaps grep --lean-only` for `hasseMinkowski`, `injective_wittRing`, `globalToLocal`, `exists_globalForm_of_isAdmissible` and `isSquare_of_isSquare_unitAtFinitePlace` finds only this roadmap: on main (8 hits), at #1200 (6), which revises this folder, and at this head (7). There is no second owner.
- **Overlap with #1200.** `roadmaps overlaps` still reports a conflict with #1200 in both files. The order is stated twice:
  - the description says "#1200 also revises GlobalQuadraticForms. It is rebased onto this revision and keeps only what this head does not already carry";
  - the generated merge-order block reads "`GlobalQuadraticForms`: **this pull request** → #1200".

  The overlaps report finds no dropped ids in either direction.
- **`Completed/LocalGaloisGroups/Suggested.lean`.** It is unchanged since 693a416 (62+/50− against main) and is still declared in the description: "That file imports ClassFieldTheory's `Suggested.lean` and uses `cyclotomicCharacter_artinMap`, so it has to follow this revision."

### Headline theorems

- **Stated in `Suggested.lean`:** 4.2 (line 53), 5.5 (70), 6.1 (78), 6.2 (86), 6.3 (95), 7.3 (113), 8.1 (122) and 8.3 (135).
- **Named in the docstring:** 8.4, the reverse direction of 6.3, at lines 31–32.
- **Remark carried from the previous report, no change asked:** 8.2 is not named in the docstring. It is a corollary of 6.3 for forms, and its Witt-class version is 8.3.

### Sources: seeded sample (spot-check)

The sampled targets are unchanged, so the previous report's table (L1–L11) stands. I re-read these locators in `milne-cft`, and each still says what the README cites it for:
- Thm 1.1 (line 10384, p. 229, needs a primitive `n`-th root of 1);
- Thm 3.1 (line 10629, p. 234, cyclic `L/K`);
- Cor. 3.6 (line 10694, p. 236, nondegenerate `q`, `c ∈ K`);
- Prop. 6.2 (line 11574, p. 251);
- Thm 6.3 (line 11619, p. 252, proof reduces to nondegenerate forms);
- Thm 6.10 and Prop. 6.11 (lines 11745 and 11758, p. 255);
- Lemma 6.13 (line 11812, p. 256, `T` even, `b` nonsquare on `T`).

I re-read no new passage, so the three `milne-cft` misprints of the previous report are not repeated below.

### Adversarial table

No statement changed, so every row is carried from the previous report (`~39`), with the values computed there. I recomputed the rows marked † for this report and got the same values.

| # | Statement | Instance | Values (left / right) | Result | From |
|---|---|---|---|---|---|
| C1 | Plain vs signed discriminant | `⟨1,-1⟩`, `⟨1,1⟩` | plain `[-1]`, `[1]`; signed `[1]`, `[-1]` | Distinguished | ~39 |
| C2 | Hasse product over `i < j` | `H` over `ℝ` | `i<j`: `1`; `i≤j`: `-1` | Distinguished | ~39 |
| C3 | Real Hasse sign `(-1)^C(q,2)` | `q = 0…4` | `1, 1, -1, -1, 1` | Rank-four non-determination ✓ | ~39 |
| C4 | `(-1,3)` over `ℚ` | `ℚ₃`, `ℚ₂`, `ℝ` | `-1`, `-1`, `1` | Even ✓ | ~39 |
| C5 | Zero record | Zero form | rank `0`; `one_le_rank` fails | Realized, not admissible ✓ | ~39 |
| T1 | 4.1, finite places | `ℚ(i)`, conjugation, `2+i` | `2+i ↦ 4 = 2²` in `𝔽₅` at `(2-i)`; `v_(2+i)(2+i) = 1` | Follows `σ` ✓ | ~39 |
| T2 | 4.1, local forms | `⟨1,-(2+i)⟩` at `(2-i)` | isotropic; image isotropic at `(2+i)`; anisotropic there unmoved | Lands at `σv` ✓ | ~39 |
| T3 | 4.1, real places | `ℚ(√5)`, `σθ = 1-θ` | `θ ↦ 1-1.618 = -0.618` | Other real place ✓ | ~39 |
| T4 | 4.1, indices | `⟨1,θ,θ⟩` | indices `1` and `1`, versus `3` without `σ` | Follows `σ` ✓ | ~39 |
| T5† | 4.1 (71:19a) | `ℚ`, `b=-1`, `S={3}`, `T={∞}`, `a=-3` | `ℝ`: `-1`; at `3`: `(-1/3) = -1`; at `2`: `ε(-3)ε(-1)` even, `1`; product `1` | Holds ✓ | ~39 |
| T6 | 4.1, nonsquare hypothesis | `S={5}` | `-1 = 2²` in `ℚ₅` | Hypothesis needed ✓ | ~39 |
| T7 | 4.1 (71:19), parity | `S={2}`, `T={∞}` vs `S={3}` | `(-1,-1) = -1` at `2` and `∞` only | Parity needed ✓ | ~39 |
| G1 | 4.2 (line 53) | `a=4`, `S=∅` | `2² = 4` | Both true | ~39 |
| G2 | 4.2 | `a=-1` over `ℚ` | nonsquare at every `p ≡ 3 mod 4` | Both false ✓ | ~39 |
| G3† | 4.2 | `ℚ(√5)`, `θ = (1+√5)/2` | above 11: `√5≡4` gives `θ≡8` (nonsquare); `√5≡7` gives `θ≡4` (square) | Consistent ✓ | ~39 |
| G4 | 4.2, exponent 2 only | `16`, 8th powers | `v₂(16) = 4`; `x⁸-16` has no root in `ℚ` | Analogue false ✓ | ~39 |
| G5 | 4.2 route | `E = K(√a)` | index `1` against `2 ≤ index` | Contradiction ✓ | ~39 |
| G6 | Cyclic hypothesis | `ℚ(∛2, ζ₃)` | `S₃`; index `2 < 6` | Needed ✓ | ~39 |
| H1–H4 | 4.3 | `(d,a) = (-1,5)`, `(-1,3)`, `(5,2)`, `(2,-1)` | `1²+2²`; `(-1,3)_3 = -1`; `(5,2)_5 = -1`; `1-2 = -1` | Both sides agree ✓ | ~39 |
| B1–B5 | 5.1 | `⟨1,-2⟩`, `⟨2,-8⟩`, `⟨1,1,-2⟩`, `⟨1,-2,-3⟩`, `⟨1,1,1⟩` | `2` nonsquare at `ℚ₃`; `16 = 4²`; `2 = 1²+1²`; `(2,3)_3 = -1`; anisotropic at `2`, `∞` | Both sides agree ✓ | ~39 |
| I1–I2 | 5.5 (line 70) | Rank 0; `⟨a⟩` | anisotropic globally and locally | Both false | ~39 |
| I3† | 5.5 | `⟨1,1,1,-7⟩` | `-7 ≡ 1 mod 8`, so `7 ≡ -1` in `ℚ₂ˣ/ℚ₂ˣ²`, not represented by `⟨1,1,1⟩` | Both false ✓ | ~39 |
| I4 | 5.5 | `⟨1,1,1,1,1⟩` | definite at `ℝ` | Both false ✓ | ~39 |
| I5–I6 | 5.5, `hQ` and route | `⟨1,0⟩`; `U=⟨1,1⟩` | radical `(0,1)`; `U(x) ≠ 0` needed | `hQ` used ✓ | ~39 |
| R1–R4 | 6.1 (line 78) | `⟨1,1⟩` with `a=3`, `a=-1`; `⟨1,2⟩` with `3`; zero space | `(-1,3)_3 = -1`; fails at `ℝ`; `1+2 = 3`; `0 ≠ a` | Both sides agree ✓ | ~39 |
| P1–P5 | 6.2 (line 86) | `⟨1,1⟩` into `4⟨1⟩`; `⟨3⟩` into `⟨1,1⟩`; `⟨c⟩` into `H`; zero form; rank too large | inclusion; `ℚ₃` obstruction; `c`; zero map; none | Both sides agree ✓ | ~39 |
| E1, E3 | 6.3 (line 95) | `⟨1,1,-3⟩` vs `⟨1,1,-1⟩`; `⟨1⟩` vs `⟨-1⟩` | `[-3] ≠ [-1]`; signatures differ | Both false | ~39 |
| E2† | 6.3 | `⟨1,1⟩` vs `⟨5,5⟩` | `5 = 1²+2²`, so `⟨1,1⟩ ≅ ⟨5, 1/5⟩ ≅ ⟨5,5⟩` | Both true ✓ | ~39 |
| X1, X3, X4 | 7.2 | rank 3, `d=[1]`, `s_2=-1`; correction planes; vs Milne 6.12 | product `-1`; flip exactly where `(a,b) = -1`; `ε = S·(-1,d)` | Consistent ✓ | ~39 |
| X2† | 7.2 | `⟨-1,-1,-1⟩` | `s_2 = (-1)^3 = -1`; real `(-1)^C(3,2) = -1`; product `1` | Realizes itself ✓ | ~39 |
| A1–A6 | 7.3 (line 113) | `⟨1⟩`; `(2,[1],-1,0)`; rank 0; rank-1 and rank-2 exclusions; `ℚ(√5)` example | admissible; `⟨-1,-1⟩`; `one_le_rank` fails; clauses fail; product `1` | Consistent ✓ | ~39 |
| U1, U3 | 8.1 (line 122) | `⟨1,1,-1⟩` vs `⟨1,2,-2⟩`; zero forms | `[-1] = [-4]`, `(2,-2) = 1`, `p = 2`; ranks `0,0` vs `0,1` | Both directions ✓ | ~39 |
| U2† | 8.1 | `⟨1,1⟩` vs `⟨2,2⟩` | `(x+y)²+(x-y)² = 2x²+2y²` | Equal records, isometric ✓ | ~39 |
| W1–W3 | 8.2 | `⟨1,-1,2,-2⟩`; `⟨1,1,-3,-3⟩`; `⟨1,1⟩` | hyperbolic; `(-3,-1)_3 = -1`; `[1] ≠ [-1]` | Consistent ✓ | ~39 |
| K1–K4 | 8.3 (line 135) | `⟨1,1⟩`; `⟨1⟩`; `⟨1,1,-3⟩ ⊥ ⟨-1,-1,1⟩`; `W(ℂ)` | real signature `2`; odd dimension; not isometric at `ℚ₃`; `ℤ/2` | Nonzero images ✓ | ~39 |
| Q1 | 8.4 | Reverse of 6.3 | Milne Thm 6.3 | Consistent ✓ | ~39 |

## Not verifiable

- **O'Meara**, *Introduction to Quadratic Forms* (`omeara`) is settled as uncertified (paywalled). Its numbers 58:7, 65:15, 66:1, 66:3–66:5, 71:19, 71:19a and 72:1 could not be read. Certified Milne locators (above) support the statements that cite it.
- **Serre**, *A Course in Arithmetic* (`serre`) is settled as uncertified. Its locators are cited only as a companion source.
- **`Completed/LocalGaloisGroups/Suggested.lean`** was not built, because that command is outside this brief. The file is unchanged since the previous review.

## Source issues

- none
