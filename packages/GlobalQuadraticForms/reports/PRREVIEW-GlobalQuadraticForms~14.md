# Review of GlobalQuadraticForms (pull request #1215 at 71f4111)

**Verdict:** needs changes

This is an incremental re-review. The folder has 0 changed lines since `bac57fe`; the only change in the pull request since then is in QuadraticFormInvariants. Of the two previous findings, the gate failure is resolved. The conflict with #1200 is not, and it is this report's only finding (P3, not blocking).

## R01 (P3) — This folder still conflicts with #1200's head, and the pull request states no order

**Location.**
- `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean:145–147`: `theorem injective_wittRing_baseChange_places : Function.Injective (TauCeti.WittRing.globalToLocal K)`.
- `README.md:85–86`, `:96–100`, `:180–181`, `:875–880`, `:899–901` and `:938–939`.

**Claim.** This is the previous report's R02, not repaired. #1200 ("Fix rank-four discriminant sign comparison") also changes this folder, and its head `40494aa` has not changed since the previous review. The two heads give different text for the same targets, and neither description says which pull request is rebased on the other. Whichever merges second will conflict with the first or revert its edit.

**Witness.** `git merge-tree --write-tree HEAD 40494aa` reports `CONFLICT (content)` in both files: 7 hunks in `README.md` and 4 in `Suggested.lean`. On this folder, `git diff HEAD 40494aa` changes 39 README lines and 28 Lean lines:
- **8.3 in Lean.** #1200 keeps the hand-built map under an `[Invertible (2 : K)]` binder. This head states injectivity of `TauCeti.WittRing.globalToLocal`.
- **The instance convention.** #1200 says "any instance serves: they are all equal". This head names `invertibleTwo` (README:96–100 and :180–181).
- **The `H¹` owner.** #1200 assigns the `H¹(K, SO(Q))` translation to Orthogonal Tamagawa and Lattice Mass (its README:85–87, :899–902 and :939–942). This head still assigns it to Orthogonal and Spin Groups.
- **A new note.** #1200 adds a `presentedForm` note (its README:302–305).

The diff contains no rank-four discriminant text, so the fix named in #1200's title already reads the same on both heads. This pull request's description does not mention #1200.

**Repair.** State the order in this pull request's description. Either of two orders removes the conflict:
- **Fold #1200 in here.** Carry its two remaining edits into this folder, namely the `H¹`-owner lines and the `presentedForm` note, then close #1200, whose title fix this head already carries. The `H¹`-owner lines agree with main's `Completed/OrthogonalSpinGroups/README.md:963–966`, which leaves the pointed-set translation of `hasseMinkowski_equivalent` to its successor.
- **Rebase #1200 on this head.** Keep this head's 8.3 statement and its `invertibleTwo` lines, and say so in both descriptions.

Check of the repair: after either order, `git merge-tree --write-tree` of the two heads, or the overlap report, shows no conflict in `TauCetiRoadmap/GlobalQuadraticForms/`.

## Previous findings

- R01 — repaired, by the project's gate configuration rather than by a change here: its `outside_folder_allow` now lists exactly `Completed/LocalGaloisGroups/Suggested.lean`. The worker's gate passes and my rerun no longer flags that file. The edit itself (+62 −50) is unchanged.
- R02 — not repaired: `git merge-tree --write-tree HEAD 40494aa` still reports `CONFLICT (content)` in `README.md` and `Suggested.lean`. Both heads are unchanged in this folder, and the description names no order. It is restated above as R01.

## Verified sound

**The gate.**
- The worker's run at `71f4111` passes every check, including `build=0` and `outside-folder=0`.
- My rerun (`gate … --base origin/main`, without the review lane's allowances for this pull request's own folders) gives `0` on every check except `outside-folder=5`. The five paths are the two ClassFieldTheory files and the three QuadraticFormInvariants files, which the brief names as this pull request's own. `Completed/LocalGaloisGroups/Suggested.lean` is no longer listed.

**The outside edit** (unchanged; now allowed). It switches `Completed/LocalGaloisGroups/Suggested.lean` to names that exist at the pin. Paths are under `TauCeti/`:
- `TauCeti.ClassFieldTheory.artinMap`: `NumberTheory/ClassFieldTheory/Local/ArtinMap.lean:114`, namespace at :102;
- `TauCeti.absoluteGaloisGroupExtend`: `FieldTheory/Galois/AbsoluteGaloisGroup/FiniteExtension.lean:252`, namespace at :131;
- `TauCeti.ClassFieldTheory.muNRep` and `kummerEquivOfCharZero`: `NumberTheory/ClassFieldTheory/MuNRep.lean:137` and `:358`, namespace at :117;
- the added import `NumberTheory/ClassFieldTheory/Local/CohomologicalDimension/Strict.lean`, which exists.

Main's `ClassFieldTheory.kummerEquiv_mixed` (main's file, line 322) is declared nowhere at the pin. The edit therefore keeps a consumer building.

**Elaboration.**
- `lake env lean` on `Suggested.lean` gives 8 warnings, all `declaration uses sorry`, at lines 52, 69, 77, 85, 94, 112, 121 and 145. There are no other warnings or errors.
- In a scratch copy, `#check @` of all 9 declarations prints types identical to the worker's signature listing. No section binder is lost, and each type matches its README statement.

**Dependency check.** Output: `depcheck: 238 roadmaps, 2320 edges, 0 problem(s)`. There are no UPWARD or CYCLE lines.

**One-tactic probe** (scratch copy, each `sorry` replaced by `first | rfl | simp | infer_instance | decide | simp_all`). The probe closes none of the 8 statements:
- `simp_all` makes no progress at 4.2, 7.3, 8.1 and 8.3;
- `simp` leaves goals unsolved at 5.5, 6.1, 6.2 and 6.3.

None of them is padding. 8.4 is proved in place as the `.2` of 6.3. Other roadmaps cite it by name: IntegralLattices (`Suggested.lean:403` at #1411's head) and Orthogonal and Spin Groups (`README.md:1499` at #1181's head).

**Library citations: all 35 `TauCeti.*` names backticked in the README resolve at the pin.**
- **27 by `#check`**, in one scratch file that elaborates with no error. These include `TauCeti.ClassFieldTheory.finrank_le_index_range_ideleClassNormMap`, `…exists_sq_sub_mul_sq_iff_forall_completion`, `TauCeti.WittRing.globalToLocal`, `…globalToLocal_eq_zero_iff`, `TauCeti.RegularFormClass.discr`, `.localHasse`, `.exists_of_realization`, `TauCeti.hilbertSymbol_productFormula`, `TauCeti.NumberField.QuadraticForm.GlobalFormInvariants` and `…exists_pair_hilbertSymbol_eq_ite`.
- **8 by declaration line and enclosing namespace:**

| Name | Location |
|---|---|
| `TauCeti.GlobalNumberFields.exists_fieldUnit_isSquare_div_at_places` | `Approximation/SquareClass.lean:40` |
| `TauCeti.NumberField.QuadraticForm.Sqrt5.exists_admissible_rank_three` | `WorkedExamples/Sqrt5.lean:178` |
| `…anisotropic_sumTwoSquaresSubThreeSq` | `TernaryObstruction.lean:147` |
| `…not_equivalent_sumTwoSquaresSubThreeSq_sumTwoSquaresSubSq` | `TernaryObstruction.lean:191` |
| `…equivalent_sumTwoSquaresSubSq_sqAddTwoSqSubTwoSq` | `HyperbolicIsometry.lean:68` |
| `…exists_anisotropic_and_not_anisotropic_away_from_realPlace` | `DefiniteObstruction.lean:68` |
| `…infinite_anisotropic_sumTwoSquares_atFinitePlace` | `BinaryObstruction.lean:80` |
| `TauCeti.NumberField.exists_one_tmul_mem_of_mem_nhds` | `Approximation/Vector.lean:127` |

- `roadmaps resolve` on the README lists no cross-roadmap citation and no Lean name that is found nowhere.

**Ownership.**
- Tau Ceti at the pin has no Hasse–Minkowski declaration (grep for `hasseMinkowski`).
- Tau Ceti also does not prove injectivity of `globalToLocal`. `WittLocalization.lean:40–41` says so. `globalToLocal_eq_zero_iff` (:203) describes the kernel by dimension parity, signed discriminant, Clifford invariant and signatures, which is not injectivity.
- `roadmaps grep` (Lean files) finds the headline names only here, at #1200's head, on main (this roadmap's own earlier version) and in consumers' `#check` lines.

**The QuadraticFormInvariants change** (the only change in the pull request since the previous review).
- It drops from its namespace the aliases `discr`, `wittRing`, `toWittRing`, `hilbertSymbol_neg_self`, `hilbertSymbol_comm`, `hilbertSymbol_mul`, `exists_hilbertSymbol_eq_neg_one`, `hilbertSymbol_unramified` and `exists_of_realization`, and maps each old → new to a Tau Ceti name.
- This README cites none of the dropped aliases. Every Quadratic Form Invariants result it uses is cited by its Tau Ceti name, as its scope line at README:79–81 says. The new consumer line in Quadratic Form Invariants for this roadmap ("through the Tau Ceti declarations") agrees.
- ClassFieldTheory has not changed since `bac57fe`. Its README:2020 still says that this roadmap's §4.2 consumes the first inequality.

**Overlaps.**
- #1200 is R01.
- The dropped Layer 3 id is cited by MetaplecticAutomorphicForms (#1063 README:52, :1628 and :1829). It resolves through the section map at README:53–75: Layer 3 maps to `GlobalFormInvariants`, `IsAdmissible` and `globalInvariants`.
- The §4.4 citations in GL2AutomorphicRepresentationsAndTransfer (#931 README:408), QuaternionArithmetic (#1722 README:541) and GeometryOfNumbersAndQuadraticArithmeticPartII (#1691 README:564) are covered by the map's 4.4 entries (README:68–75).
- The closest roadmaps in vocabulary are QuadraticFormInvariants (#1797, #617, #1187 and #1411) and IntegralLattices (#1797). Ownership against them is unchanged.

**Sources.** The seeded sample lies entirely in untouched text; earlier rounds verified it. This round I spot-checked `milne-cft`, where printed page = PDF page − 9 (the PDF page 238 marker at line 10375 precedes printed p. 229):
- VIII Theorem 1.1 at line 10384, p. 229. Its hypothesis, a primitive `n`-th root of 1, is automatic for `n = 2`; the conclusion allows finitely many exceptional primes. This supports 4.2.
- Exercise 1.3 at line 10397, p. 229: 16 is an 8th power in ℝ and at the odd primes but not in ℚ.
- Theorem 3.1 (Hasse norm theorem, cyclic `L/K`) at line 10629, p. 234 (header at line 10604).
- Theorem 3.5 at line 10686 and Proposition 3.7 at line 10698.
- Theorem 6.3 at line 11619, p. 252 (header at line 11607).
- Theorem 6.10 at line 11745 and Proposition 6.11 at line 11758.

**Remark on untouched text** (no change requested on its own). README:85–86, :899–901 and :938–939 still credit Orthogonal and Spin Groups with the `SO` translation of 8.4. Main's `Completed/OrthogonalSpinGroups/README.md:963–966` assigns it to its successor. #1200 carries this change, so it lands with R01's repair.

**Adversarial table.** No statement changed. The first table holds rows I recomputed this round for the nine headlines and for the convention R01 touches:

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 4.2 `isSquare_of_isSquare_unitAtFinitePlace_of_notMem` | ℚ: `a = 4, −1, 2`, `S = ∅`; ℚ(i): `a = −1` | `4 = 2²` at every `ℚ_p` and in ℚ: T/T. `−1 ≡ 2 (mod 3)` is a non-residue, so it is not a square in `ℚ₃`, nor in ℚ: F/F. `2` is a non-residue mod 3: F/F. In ℚ(i), `−1 = i²`: T/T | holds | none |
| 5.5 `hasseMinkowski_isotropic` | `⟨1,1,1⟩`, `⟨1,1,−3⟩`, `⟨1,−1⟩`, `V = 0`, `⟨1,1,1,1,−1⟩` | `⟨1,1,1⟩`: anisotropic at ℝ, F/F. `⟨1,1,−3⟩`: `(−1,3)₃ = (−1/3) = −1`, F/F. `⟨1,−1⟩`: `(1,1)`, T/T. `V = 0`: `Anisotropic` holds vacuously and the localization is anisotropic, F/F. `(1,0,0,0,1) ↦ 0`: T/T | holds | none |
| 6.1 `represents_iff_locallyRepresents` | `⟨1,1⟩/ℚ` with `a = 5, 3, −1`; `V = 0`, `a = 1` | `5 = 1² + 2²`: T/T. `3`: `(−1,3)₃ = −1`, F/F. `−1`: definite at ℝ, F/F. `V = 0`: `Q 0 = 0 ≠ 1`, F/F | holds | none |
| 6.2 `represented_iff_locallyRepresented` | `⟨1⟩ → ⟨1,1⟩`, `⟨3⟩ → ⟨1,1⟩`, `⟨1,1,1⟩ → ⟨1,1⟩`, `0 → ⟨1⟩` | `x ↦ (x,0)`: T/T. `3` is not represented at `ℚ₃`: F/F. No injective map from rank 3 to rank 2: F/F. The zero map is injective: T/T | holds | none |
| 6.3 `hasseMinkowski_equivalent` | `⟨2,2⟩` vs `⟨1,1⟩`; `⟨1⟩` vs `⟨−1⟩`; `⟨1⟩` vs `⟨1,1⟩` | `(x+y)² + (x−y)² = 2x² + 2y²`: T/T. They differ at ℝ: F/F. Ranks 1 and 2, and base change keeps the rank: F/F | holds | none |
| 7.3 `exists_globalForm_of_isAdmissible` | the record of `⟨−1,−1,−1⟩/ℚ`; one with `s₃ = −1` only, positive definite; rank 0 | `(3, [−1], s₂ = (−1,−1)₂³ = −1, s_∞ = −1, p_∞ = 0)`: product of the signs `= 1`, realized by the form itself. With `s₃` only: product `−1`, not admissible, so the theorem says nothing. Rank 0: excluded by `1 ≤ n` | holds | none |
| 8.1 `equivalent_iff_globalInvariants_eq` | `⟨1,1⟩`/`⟨2,2⟩`; `⟨1⟩`/`⟨2⟩`; `0`/`⟨1⟩` | Discriminants `[1]` and `[4] = [1]`; `(2,2)_p = (2,−1)_p = 1` (witness `2·1² − 1² = 1²`); indices `(2,0)` on both: T/T. `[1] ≠ [2]`: F/F. Ranks differ: F/F | holds | none |
| 8.3 `injective_wittRing_baseChange_places` | ℚ: `[⟨1,−2⟩]`, `[⟨1,1,1,1⟩]`, `[⟨1,−1⟩]` | `⟨1,−2⟩`: `2` is a nonsquare in `ℚ₃`, so it is not hyperbolic there: image ≠ 0, and the class ≠ 0 because the form is anisotropic over ℚ. Signature 4 at ℝ: image ≠ 0, class ≠ 0. `H`: class 0, image 0 | holds | none |
| 8.4 `equivalent_of_locallyEquivalent` | `⟨1,1⟩`, `⟨2,2⟩` | locally equivalent at every place, and globally equivalent through `(x+y, x−y)`: T ⇒ T | holds | none |
| Conventions: the Witt-ring instance (touched by R01) | any `i : Invertible (2 : K)` | equal to `invertibleTwo` by `Subsingleton.elim`; `globalToLocal` uses `invertibleTwo` at `K`, `K_v` and ℝ (proved in the previous round) | as README:96–100 states | none |

The second table carries rows forward unchanged from `PRREVIEW-GlobalQuadraticForms~13`, whose own rows and the rows it carried from `~12` were computed there:

| Statement | Instances | Values | Result |
|---|---|---|---|
| regular = `QuadraticMap.Nondegenerate` | `⟨1,−1⟩`, `⟨1,0⟩`, zero form on `Fin 0 → ℚ` | radical `⊥`; `e₂` lies in the radical; radical `⊥` | as stated |
| diagonalization hypothesis | `⟨1,1,−2⟩` | separating, reached through `nondegenerate_associated_iff` | as stated |
| binary isotropy criterion | `⟨1,1⟩` over ℚ, ℚ(i), `ℚ₅`, `ℚ₃` | F; T at `(1,i)`; T since `−1 ≡ 2²`; F | as stated |
| `discr_atFinitePlace` | `⟨1,1,−3⟩` at `ℚ₇`, `ℚ₃` | `−3 ≡ 2²`, so `[1]`; valuation 1, nontrivial | as stated |
| 4.1, inputs transported | first inequality binders | `K : Type` (:68), `L : Type` (:103); used only inside 4.2 | as stated |
| 5.1 binary, ternary, quaternary *Needs:* | `⟨1,−4⟩`, `⟨1,1⟩`, `⟨1,1,−2⟩`, `⟨1,1,−3⟩`; `hternary` | T/T, F/F, T/T, F/F; `L : Type u` | closes |
| 5.5 *Needs:* | `ih` at rank `n − 1` | rank 5 uses 5.1's quaternary case | as stated |
| 8.1 *Needs:* | `⟨1,1⟩`/`⟨2,2⟩` | 7.3 not used | as stated |
| 8.3 | ℚ(i): `⟨1,1⟩`, `⟨1,−3⟩`; ℚ: `4⟨1⟩ ⊥ 4⟨−1⟩` | 0/0; ≠0/≠0 (at the inert 3); 0/0; proved `↔` the hand-built form | holds |
| plain vs signed discriminant | `H`, `⟨1,1⟩` | `[−1]` vs `[1]`; `[1]` vs `[−1]` | as stated |
| `i<j` vs `i≤j` | `H` at ℝ | `1` vs `−1` | differ |
| real symbols | `(−1,−1)_ℝ` | `−1` | as stated |
| `(−1,3)_v` | `v = 3, 2, ∞` | `−1, −1, 1` | two places |
| 4.1, places follow `σ` | ℚ(i), `2 + i` | square at `𝔭̄` only; `σ` swaps the two | as stated |
| 4.2 | `16` | an 8th power at every odd `p` and at ℝ, not in ℚ | as stated |
| 4.2, idele warning | `(√2)_∞ × 1` | `√2 > 0` | as stated |
| 4.3 | `d = −1`: `a = 5, 3, −1`; `d = 2`: `a = −1` | T/T, F/F, F/F, T/T | holds |
| 5.5 discussion | `U = ⟨1,1⟩`, `W = ⟨1,−1,1⟩` | `b = 1`, `W(y) = −1` | as stated |
| 7.2 | `⟨1,1,1⟩` with `s₂ = −1`; `⟨−1,−1,−1⟩`; rank 4, `d = [1]` | products `−1`, `1`; real Hasse `1, −1, 1` | holds |
| 7.3 | the ℚ(√5) record; rank 1 with `|T| = 2`; rank 0 | realized by `⟨1,θ,θ⟩`; not admissible; silent | holds |
| 7.4 | Milne's `S` vs `ε` | `S = ε·(−1,d)_v` | as stated |
| 8.2 | `⟨1,−1,2,−2⟩`; `⟨1,1⟩` | hyperbolic everywhere; anisotropic at ℝ | holds |
| first inequality needs cyclicity | `ℚ(∛2, ζ₃)` | degree 6, norm index 2 | as stated |

## Not verifiable

- **O'Meara** (`omeara`): 58:7, 65:15, 66:1, 66:3, 66:4, 66:5, 71:19, 71:19a and 72:1. The manifest records it as uncertified, so I did not read it.
- **Serre** (`serre`): Ch. III §1.2 Thm 1, §2.2 Thm 3, Ch. IV §2.1 and §3.2 Thm 8. The manifest also records it as uncertified.

No passage changed in this round, so no new citation of either source was added.

## Source issues

- none
