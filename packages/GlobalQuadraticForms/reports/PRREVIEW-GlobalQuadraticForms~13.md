# Review of GlobalQuadraticForms (pull request #1215 at bac57fe)

**Verdict:** needs changes

This is an incremental re-review of the 121 lines changed since `2ed7ba0`. Four of the five previous findings are repaired. Two P3 findings remain: the gate failure carried over from the previous review, and a new merge conflict with #1200.

## R01 (P3) — The gate still fails: this pull request edits `Completed/LocalGaloisGroups/Suggested.lean`, outside its folders

**Location.** The gate's `outside-folder` check. The worker's run at this head and my rerun both flag `Completed/LocalGaloisGroups/Suggested.lean`. `git diff --stat origin/main...HEAD` shows +62 −50 lines for that file, with no change since `2ed7ba0`. My rerun also lists the ClassFieldTheory and QuadraticFormInvariants files, but those two folders belong to this pull request.

**Claim.** This is R02 of the previous review, not repaired. The pull request edits a roadmap folder it does not name as its own. While the gate fails, this folder cannot be accepted.

**Witness.** My gate rerun at `bac57fe` prints `outside-folder: Completed/LocalGaloisGroups/Suggested.lean` and ends in `FAIL`. Every other check is `0`. The repair commit `b94cfcc` touches only this folder.

**Repair.** The fix is outside this folder, and there are two ways to make it:
- name LocalGaloisGroups as one of this pull request's folders, so that the gate and its own review count the edit; or
- move the edit into its own pull request, which merges together with the ClassFieldTheory change.

Either way, `outside-folder` must pass.

## R02 (P3) — This folder now conflicts with #1200's head, and no order is stated

**Location.**
- `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean:145–147`: `theorem injective_wittRing_baseChange_places : Function.Injective (TauCeti.WittRing.globalToLocal K)`.
- `README.md:98–100` (the `invertibleTwo` convention), `:180–181` and `:875–880`.

**Claim.** #1200 ("Fix rank-four discriminant sign comparison") also changes this folder. At the previous head the two copies were byte-identical. At #1200's head `40494aa` the two pull requests change the same targets differently:
- **8.3 in Lean.** #1200's `Suggested.lean:146–152` keeps the hand-built map with the `[Invertible (2 : K)]` binder, which this head replaced when it repaired R04.
- **8.3 in the README.** #1200's README:875–879 says "the Lean statement writes its components out".
- **The instance convention.** #1200's README:99 says "any instance serves" and has no `invertibleTwo` contract.
- **The `H¹` translation.** #1200 moves the translation of 8.4 into `H¹(K, SO(Q))` to Orthogonal Tamagawa and Lattice Mass, at its README:85–87, :899–902 and :939–942.
- **A new note.** #1200 adds a `presentedForm` note at its README:302–305.

Neither description says which pull request is rebased on the other.

**Witness.** `git merge-tree --write-tree HEAD 40494aa` reports `CONFLICT (content)` in `TauCetiRoadmap/GlobalQuadraticForms/README.md` and in `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean`. The overlap report flags the same conflict.

**Repair.** State the order in this pull request's description. I recommend rebasing #1200 on this head:
- keep this head's 8.3 statement on `globalToLocal` (proved equivalent to the old one, see below);
- keep this head's `invertibleTwo` lines;
- carry over from #1200 only what this head does not already change, namely its `H¹`-owner edits and its `presentedForm` note.

The `H¹`-owner edits agree with main's `Completed/OrthogonalSpinGroups/README.md:963–966`, which gives the pointed-set translation of `hasseMinkowski_equivalent` to its successor. Alternatively, drop this folder's edits from one of the two pull requests.

## Previous findings

- R01 — repaired. README:399–404 now reads: "Together these give the other seven inputs … The first inequality is not transported: 4.2 transports its own hypothesis … and conclusion …, and applies the first inequality to the model of `K` in `Type`". The same narrowing appears at :22–24, :92–94, :149–153, :341–343 and :356–361.
- R02 — not repaired. The gate still flags `Completed/LocalGaloisGroups/Suggested.lean` (+62 −50, unchanged since `2ed7ba0`). It is restated above as this report's R01.
- R03 — repaired. README:839–840 now reads "*Needs:* 7.4; Tau Ceti `QuadraticMap.Equivalent.globalInvariants_eq`. The bijection with admissible records additionally needs 7.3." The 5.1 *Needs:* at :560–570 is split item by item: all three results, binary, ternary, and the quaternary consequence.
- R04 — repaired. `Suggested.lean:145–147` states `Function.Injective (TauCeti.WittRing.globalToLocal K)` with no instance binder, and imports `…Global.WittLocalization` (:8). README:879–880 reads "The Lean statement is the injectivity of `TauCeti.WittRing.globalToLocal`."
- R05 — repaired. README:95–96 reads "regular means `QuadraticMap.Nondegenerate` (written `Q.Nondegenerate`…)". From Mathlib :162–165 lists it with `QuadraticMap.radical_eq_ker_polarBilin`.

## Verified sound

**The gate.**
- My rerun at `bac57fe`: every check is `0` except `outside-folder` (R01).
- The worker's run reports `build=0`.

**Elaboration.**
- `lake env lean` on `Suggested.lean` gives 8 warnings, all `declaration uses sorry`, at lines 52, 69, 77, 85, 94, 112, 121 and 145. There are no other warnings or errors.

**Dependency check.** Output: `depcheck: 238 roadmaps, 2321 edges, 0 problem(s)`. There are no UPWARD or CYCLE lines; the README names no roadmap supplier (:141).

**Signatures.**
- I compared all 9 elaborated types in the worker's signature listing with the README; my scratch copy of the file elaborates the same.
- The only changed type is 8.3: `∀ {K : Type u_1} [Field K] [NumberField K], Function.Injective ⇑(TauCeti.WittRing.globalToLocal K)`. It matches README:875–880.
- No section binder is lost.
- The other eight types are unchanged since the previous review.

**Scratch Lean checks** (one scratch copy of the file plus a second scratch file, both elaborated with `lake env lean`; `sorry` is the only warning):
- **8.3 is equivalent to the old statement.** `Function.Injective (globalToLocal K)` is proved `↔` to the previous hand-built statement, by `funext`, `globalToLocal_apply_fst`, `globalToLocal_apply_snd` and `atRealPlace_def`.
- **The instance.**
  - `(inferInstance : Invertible (2 : K)) = invertibleTwo` holds by `rfl`.
  - Any `i : Invertible (2 : K)` equals `invertibleTwo` by `Subsingleton.elim`.
  - Elaborating `globalToLocal K` with explicit printing shows `invertibleTwo` at `K`, at every `v.adicCompletion K` and at `ℝ`. This confirms README:98–100.
- **The From Mathlib examples** (README:165), each through `nondegenerate_iff_radical_eq_bot` and `radical_weightedSumSquares`:
  - `weightedSumSquares ℚ ![1, -1]` is nondegenerate;
  - `weightedSumSquares ℚ ![1, 0]` is not, because `Pi.single 1 1` lies in its radical;
  - the zero form on `Fin 0 → ℚ` is nondegenerate.
- **One-tactic probe on 8.3.** `first | rfl | simp | infer_instance | decide | exact fun _ => by simp_all` fails with `simp_all made no progress`, so 8.3 is not padding. The other seven `sorry`'d statements are unchanged and failed the same probe in the previous review.

**Declarations opened at the pins** (19). Mathlib paths are under `Mathlib/`, Tau Ceti paths under `TauCeti/`.

| Declaration | Location | What I checked |
|---|---|---|
| `QuadraticMap.Nondegenerate` | `LinearAlgebra/QuadraticForm/Radical.lean:115` | fields `radical_eq_bot` and `rank_rad_polar_le` (`≤ 1`), as README:162–163 says |
| `QuadraticMap.radical_eq_ker_polarBilin` | `Radical.lean:126` | under `[Invertible (2 : R)]` |
| `nondegenerate_iff_radical_eq_bot`, `nondegenerate_associated_iff` | `Radical.lean:149`, `:159` | — |
| `QuadraticForm.radical_weightedSumSquares` | `Radical.lean:183` | — |
| `QuadraticForm` | `LinearAlgebra/QuadraticForm/Basic.lean:160` | `abbrev … := QuadraticMap R M R`, as README:96 says |
| `QuadraticForm.equivalent_weightedSumSquares_units_of_nondegenerate'` | `LinearAlgebra/QuadraticForm/IsometryEquiv.lean:177` | hypothesis `(associated Q).SeparatingLeft`, as README:167–168 says |
| `invertibleTwo` | `Algebra/CharP/Invertible.lean:125` | `[DivisionSemiring K] [CharZero K]` |
| `QuadraticForm.discr_atFinitePlace` | `NumberTheory/QuadraticForm/Global/Discriminant.lean:42` | discriminant of `Q_v` is `squareClassMap` of that of `Q` |
| `QuadraticForm.not_anisotropic_iff_discr_eq_neg_one_of_finrank_eq_two` | `LinearAlgebra/QuadraticForm/RegularFormClass/LowRank.lean:173` | `[Field K] [Invertible (2 : K)]`, `finrank = 2`, `¬Anisotropic ↔ discr = [-1]` |
| `TauCeti.RegularFormClass.eq_hyperbolicClass_of_rank_eq_two_of_discr_eq_neg_one` | `RegularFormClass/Discriminant.lean:414` | — |
| `TauCeti.WittRing` | `LinearAlgebra/QuadraticForm/Witt/Ring.lean:218` | takes `[Invertible (2 : K)]` |
| `TauCeti.WittRing.globalToLocal` and its API | `NumberTheory/QuadraticForm/Global/WittLocalization.lean:167–170` | `(RingHom.pi fun _ => baseChange).prod (RingHom.pi atRealPlace)`; `_apply_fst` :175, `_apply_snd` :182, `atRealPlace_def` :101, `atComplexEmbedding_eq_zero_iff` :154, `atComplexEmbedding_eq_of_globalToLocal_eq` :221; the file says it does not prove injectivity (:40–41) |
| `TauCeti.ClassFieldTheory.finrank_le_index_range_ideleClassNormMap` | `NumberTheory/ClassFieldTheory/Global/IdeleClass/FirstInequality.lean:103–109` | `L : Type`; `K : Type` at :68 |
| `QuadraticForm.not_anisotropic_of_isLocallyIsotropic_quaternary` | `Global/Quaternary.lean:137–141` | `hternary : ∀ (L : Type u) …` with `K : Type u` (:67), which confirms "over every number field in the universe of `K`" at README:569 |
| `QuadraticForm.not_anisotropic_of_isLocallyIsotropic_of_five_le_finrank` | `Global/HigherRank.lean:87–91` | `ih` over `RegularFormPresentation K` of rank `n − 1` |
| `exists_apply_ne_zero_locallyRepresentsScalar_neg`, `finite_setOfPred_anisotropic_atFinitePlace` | `ApproximateValue.lean:61`, `AnisotropicPlaces.lean:90` | — |
| `isLocallyIsotropic_of_not_anisotropic`, `IsLocallyIsotropic` | `Predicates.lean:164`, `:51` | — |
| `QuadraticMap.Equivalent.globalInvariants_eq` | `FormInvariants.lean:193` | — |

`Quaternary.lean` and `HigherRank.lean` contain no `sorry`. This supports README:604–607: the higher-rank lemmas are inputs of a proved Tau Ceti step, not of 5.5.

**Changed *Needs:* lines.** Each listed input exists with the stated hypotheses.
- In the ternary route, the diagonalization lemma takes a separating associated form. The bridge from `Q.Nondegenerate` is the pinned `QuadraticMap.nondegenerate_associated_iff`, so the route closes.
- The citation resolver at this head finds no unresolved cross-roadmap citation or Lean name.

**Cross-roadmap citations.**
- ClassFieldTheory at this head (README:196–200 and :2020–2021) says that GlobalQuadraticForms §4.2 consumes Tau Ceti's first inequality and §4.3 the quadratic Hasse norm theorem. This matches the narrowed 4.1: the first inequality is consumed only by 4.2.
- QuadraticFormInvariants at this head (README:27–36) still maps the names this roadmap cites.

**Ownership and overlaps.**
- `roadmaps grep` for Witt injectivity by object finds it only here and in #1200; Tau Ceti does not state it.
- The dropped Layer 3 id cited by MetaplecticAutomorphicForms (#1063) resolves through the section map at README:64–67, which is unchanged.
- The closest roadmaps in vocabulary (QuadraticFormInvariants, IntegralLattices) are unchanged against this folder's scope, as the previous review found.

**Sources: the seeded sample where it falls in the changed passages.**
- 8.3: Milne VIII Theorem 6.3 is at `milne-cft` line 11619, with printed page 252 at line 11607. It is stated for arbitrary forms at all primes, which supports 8.2–8.4.
- 4.1/4.2: Milne VIII Theorem 1.1 is at line 10384, printed p. 229.
- The locators of 5.1 and 5.5 are unchanged; the previous review verified them at lines 10686, 10700–10702 and 10772–10804.
- The sample targets 4.3, 6.1–6.3, 7.2–7.4, 8.2 and 8.4 are unchanged. The previous review checked them against `milne-cft`, or found them uncertified (O'Meara).

**Remark on untouched text** (no change requested in this round). README:85–86, :900–901 and :938–939 still credit Orthogonal and Spin Groups with the `SO` translation of 8.4. Main's `Completed/OrthogonalSpinGroups/README.md:963–966` assigns it to its successor. #1200's head already makes this change (see R02).

**Adversarial table.** First, a row with computed values for each changed statement:

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| Conventions/From Mathlib: regular = `QuadraticMap.Nondegenerate` | `⟨1,−1⟩`, `⟨1,0⟩`, zero form on `Fin 0 → ℚ` | `⟨1,−1⟩`: no zero weight, so the radical is `⊥`, nondegenerate. `⟨1,0⟩`: `Q(e₂) = 0` and `polar(e₂, y) = y₁² − y₁² = 0`, so `e₂ ∈` radical, degenerate. Zero space: radical `⊥`. All three proved in Lean | as README:165 states | none |
| Conventions: the Witt-ring instance | `globalToLocal K` with explicit printing; any `i : Invertible 2` | `invertibleTwo` at `K`, `K_v` and `ℝ`; `inferInstance = invertibleTwo` by `rfl`; `i = invertibleTwo` by `Subsingleton.elim` | as README:98–100 states | none |
| From Mathlib: diagonalization | `⟨1,1,−2⟩` over `ℚ` | hypothesis `(associated Q).SeparatingLeft`: `diag(1,1,−2)` is separating; it is reached from `Q.Nondegenerate` by `nondegenerate_associated_iff` | as README:166–168 states | none |
| From Tau Ceti: binary isotropy criterion | `⟨1,−1⟩/ℚ`; `⟨1,1⟩` over `ℚ`, `ℚ(i)`, `ℚ₅`, `ℚ₃` | `[−1]`: isotropic at `(1,1)`. `ℚ`: `[1] ≠ [−1]`, anisotropic. `ℚ(i)`: `−1 = i²`, isotropic at `(1,i)`. `ℚ₅`: `−1 ≡ 2²`, isotropic. `ℚ₃`: `−1` is a nonsquare, anisotropic | as README:295–296 states | none |
| From Tau Ceti: `discr_atFinitePlace` | `⟨1,1,−3⟩` at `ℚ₇` and `ℚ₃` | global `[−3]`. `ℚ₇`: `−3 ≡ 4 = 2²`, image `[1]`, equal to the local discriminant. `ℚ₃`: valuation 1, nontrivial on both sides | as README:205 states | none |
| 4.1: seven of the eight inputs | binder scan; 4.2's use | first inequality: `K : Type` (:68), `L : Type` (:103). 4.2 applies it to `K₀ = AdjoinRoot (minpoly ℚ α) : Type` and `E = AdjoinRoot (X² − σa) : Type`, with `[E : K₀] = 2` and cyclic Galois group. The other seven go through fact 2 | holds at :22–24, :92–94, :149–153, :356–361, :399–404 | none |
| 5.1 binary *Needs:* | `⟨1,−4⟩/ℚ`; `⟨1,1⟩/ℚ` | `⟨1,−4⟩`: `[−4] = [−1]` at every `ℚ_p`, so `4` is a local square everywhere; 4.2 with `S = ∅` gives `4 = 2²`; hyperbolic, isotropic at `(2,1)`. `⟨1,1⟩`: `[1] ≠ [−1]` at `ℚ₃`, so the hypothesis fails and both sides are false | closes with the listed inputs | none |
| 5.1 ternary *Needs:* | `⟨1,1,−2⟩`, `⟨1,1,−3⟩` | `d = −1` nonsquare, `a = 2 = 1² + 1²`: 4.3 true on both sides, isotropic at `(1,1,1)`. `a = 3`: `(−1,3)_3 = −1`, 4.3 false on both sides, anisotropic at `ℚ₃` | closes with the listed inputs | none |
| 5.1 quaternary *Needs:* | `hternary` binder | `L : Type u` with `K : Type u`; `K(√d) = AdjoinRoot (X² − d)` lies in `Type u` | as README:569–570 states | none |
| 5.5 *Needs:* | `ih` binder; `⟨1,1,1,1,1⟩`, `⟨1,1,1,1,−1⟩` | `ih` is rank `n − 1` over the same `K`; for `n = 5` it is 5.1's quaternary case. Five ones: anisotropic at `ℝ`, false/false. `(1,0,0,0,1)` gives `1 − 1 = 0`: true/true | as README:602–607 states | none |
| 8.1 *Needs:* | `⟨1,1⟩`/`⟨2,2⟩`; `0`/`⟨1⟩` | equal records `(2, [1], s ≡ 1, p = 2)`, isometric through `(x+y, x−y)`; ranks 0 and 1 give false/false. 7.3 is used in neither | as README:839–840 states | none |
| 8.3 `injective_wittRing_baseChange_places` | `ℚ(i)` (no real place): `[⟨1,1⟩]`, `[⟨1,−3⟩]`; `ℚ`: `[⟨1,−2⟩]`, `[⟨1,1,1,1⟩]`, `[4⟨1⟩ ⊥ 4⟨−1⟩]` | `ℚ(i)`, `⟨1,1⟩ ≅ H`: class 0, image 0. `⟨1,−3⟩`: signed discriminant `[3]`, a nonsquare at the inert prime 3: image ≠ 0 and class ≠ 0. `ℚ`, `⟨1,−2⟩`: signature 0, signed discriminant `[2]`, a nonsquare in `ℚ₃`: image ≠ 0 and class ≠ 0. `⟨1,1,1,1⟩`: real signature 4, image ≠ 0. `4⟨1⟩ ⊥ 4⟨−1⟩`: class 0, image 0 | holds; proved `↔` the previous statement | none |

Then the rows carried forward from the previous review for statements the diff leaves untouched (`PRREVIEW-GlobalQuadraticForms~12`, values recomputed there):

| Statement | Instances | Values | Result |
|---|---|---|---|
| plain vs signed discriminant | `H`, `⟨1,1⟩` | `H`: `[−1]` vs `[1]`; `⟨1,1⟩`: `[1]` vs `[−1]` | as stated |
| `i<j` vs `i≤j` | `H`/`ℝ` | `1` vs `(1,1)(1,−1)(−1,−1) = −1` | differ, as stated |
| real symbols | `(−1,−1)_ℝ`, `⟨−1,−1⟩` | `−1`; `(−1)^{C(2,2)} = −1` | as stated |
| `(−1,3)_v` | `v = 3, 2, ∞` | `−1, −1, 1` | two places |
| 4.1 places follow `σ` | `ℚ(i)`, `2 + i` | square at `𝔭̄`, not at `𝔭`; `σ` swaps them | as stated |
| 4.1 model | `ℚ(√5)` | indices `(3,1)` on both models | holds |
| 4.2 | `a = 4, −1, −4`; `16` | `2² = 4`; the hypothesis fails at `p ≡ 3 (4)`; `16` is an 8th power at every odd `p` and at `ℝ`, not in `ℚ` | holds |
| 4.2 idele warning | `(√2)_∞ × 1` | `α = 1`: `√2 > 0` is a real square | as stated |
| 4.3 | `d = −1`: `a = 5, 3, −1`; `d = 2`: `a = −1` | true/true, false/false, false/false, true/true | holds |
| 5.1 binary, ternary | `⟨1,1⟩` over `ℚ(i)` and `ℚ`; `⟨1,1,−2⟩`, `⟨1,1,−3⟩`, `⟨1,1,1⟩` | true/true; false/false; true/true; false/false; `{2, ∞}` | holds |
| 5.5 | rank 0, `⟨a⟩`, `H`, five ones, degenerate | F/F, F/F, T/T, F/F, T/T | holds |
| 5.5 discussion | `U = ⟨1,1⟩`, `W = ⟨1,−1,1⟩` | `b = 1`, `W(y) = −1` | as stated |
| 6.1 | `⟨1,1⟩`: `a = 3, −1`; `H`; `V = 0` | F/F, F/F, T/T, F/F | holds |
| 6.2 | `⟨c⟩ → H`; larger rank; `V = 0` | `((1+c)² − (1−c)²)/4 = c`; F/F; T/T | holds |
| 6.3 | `H`/`⟨2,−2⟩`; `⟨1⟩`/`⟨−1⟩`; `⟨1,1,−3⟩`/`⟨1,1,−1⟩`; `0`/`0` | T/T, F/F, F/F, T/T | holds |
| 7.2 | `⟨1,1,1⟩` with `s₂ = −1`; `⟨−1,−1,−1⟩`; rank 4, `d = [1]` | product `−1`; product `1`; real Hasse `1, −1, 1` | holds |
| 7.3 | `ℚ(√5)` record; rank 1, `|T| = 2`; rank 0 | product `1`, realized by `⟨1,θ,θ⟩`; not admissible; silent | holds |
| 7.4 | Milne's `S` vs `ε` | `S = ε·(−1,d)_v` on both sides | as stated |
| 8.1 | `⟨1,1,−1⟩`/`⟨1,2,−2⟩`; `⟨1,1⟩`/`⟨2,2⟩`; `0`/`⟨1⟩` | equal; equal; F/F | holds |
| 8.2 | `⟨1,−1,2,−2⟩`; `⟨1,1⟩` | hyperbolic everywhere; anisotropic at `ℝ` | holds |
| 8.4 | as in 6.3 | the reverse direction of 6.3 | holds |
| first inequality needs cyclicity | `ℚ(∛2, ζ₃)` | degree 6, norm index 2 | as stated |

## Not verifiable

- **O'Meara** (`omeara`): 58:7, 65:15, 66:1, 66:3, 66:4, 66:5, 71:19, 71:19a and 72:1. The manifest records this source as uncertified, so I did not read it.
- **Serre** (`serre`): Ch. III §1.2 Thm 1, §2.2 Thm 3, Ch. IV §2.1 and §3.2 Thm 8. The manifest also records it as uncertified.

None of the changed passages adds a citation of either source.

## Source issues

- none
