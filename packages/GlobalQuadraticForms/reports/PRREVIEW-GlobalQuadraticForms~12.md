# Review of GlobalQuadraticForms (pull request #1215 at 2ed7ba0)

**Verdict:** needs changes

## R01 (P2) — 4.1 claims to carry all eight `Type`-only inputs to every universe, but its transports cannot carry the first inequality

**Location.** `TauCetiRoadmap/GlobalQuadraticForms/README.md:375`: "Together these give each of the eight inputs for number fields in every universe: transport the data to a model in `Type` by the first fact, apply the input there, and transport the conclusion back by the second." The same claim appears at :22–23, :91–92 and :144–145.

**Claim.** The second fact of 4.1 (:343–373) transports places, completions, units, Hilbert symbols, norm equations, forms, records and local forms. One of the eight inputs, `TauCeti.ClassFieldTheory.finrank_le_index_range_ideleClassNormMap`, is a statement about a second field `L`, the instances `IsGalois` and `IsCyclic`, idele classes, and the index of the range of `ideleClassNormMap K L`. 4.1 transports none of these, so "each of the eight" is an overclaim. Nothing depends on the overclaim: 4.2 (:417–419) already transports its own hypothesis and conclusion and uses the first inequality only for `K` in `Type`.

**Witness.** `TauCeti/NumberTheory/ClassFieldTheory/Global/IdeleClass/FirstInequality.lean:103–109` takes `(L : Type) [IsGalois K L] [IsCyclic Gal(L/K)]` and concludes `finrank K L ≤ (ideleClassNormMap K L).range.index`. 4.1 item 2 names no extension, no idele group, no norm map and no index.

**Repair.** At :375, write: "Together these give the other seven inputs for number fields in every universe … The first inequality `finrank_le_index_range_ideleClassNormMap` is not transported: 4.2 transports its own hypothesis and conclusion and applies it to `K` in `Type`." Narrow :22–23, :91–92 and :144–145 the same way ("seven of the eight inputs"). The alternative is to add to 4.1 the transport of a finite extension `L/K` with `IsGalois` and `IsCyclic`, of `IdeleGroup` and `IdeleClassGroup`, of `ideleClassNormMap`, and the invariance of the index of its range. I checked the narrowing on the refuting input: after it, 4.2's route (:417–433) still closes, because it never transports the first inequality.

## R02 (P3) — Gate fails: the pull request edits `Completed/LocalGaloisGroups/Suggested.lean`, which is outside its folders

**Location.** The gate's `outside-folder` check flags `Completed/LocalGaloisGroups/Suggested.lean` (+62 −50 lines). Both the worker's run and my rerun list it. My rerun also lists the ClassFieldTheory and QuadraticFormInvariants files, but those two folders are this pull request's own.

**Claim.** The pull request edits a roadmap folder it does not name as its own. While this gate check fails, the folder cannot be accepted.

**Witness.** The edit is forced by this pull request. The file imports `TauCetiRoadmap.ClassFieldTheory.Suggested`, and main's version used `ClassFieldTheory.H`, `muNRep` and `kummerEquiv_mixed` (main `ClassFieldTheory/Suggested.lean:630, 747, 987`). The head's `ClassFieldTheory/Suggested.lean` defines none of them.

**Repair.** The fix is not in this folder. Either name LocalGaloisGroups as one of the pull request's folders, so the gate and its review count the edit, or move the edit into its own pull request that merges together with the ClassFieldTheory change. The gate's `outside-folder` check must pass.

## R03 (P3) — Two *Needs:* lines put a target behind results its statement does not use

**Location.** README:803: "*Needs:* 7.3, 7.4; Tau Ceti `QuadraticMap.Equivalent.globalInvariants_eq`." README:533–535: one *Needs:* line ("4.2, 4.3; …") covers three results of 5.1.

**Claim.**
- `equivalent_iff_globalInvariants_eq` needs only `QuadraticMap.Equivalent.globalInvariants_eq` for the forward direction and 7.4 for the reverse. 7.3 serves only the bijection remark at :800–801, and listing it puts 8.1 behind 7.2 and behind the local-form transport of 4.1.
- In 5.1, each result needs something different:
  - the binary case needs only 4.2 and `TauCeti.RegularFormClass.eq_hyperbolicClass_of_rank_eq_two_of_discr_eq_neg_one`;
  - the ternary case needs only 4.3;
  - the unconditional quaternary consequence needs the ternary case and `QuadraticForm.not_anisotropic_of_isLocallyIsotropic_quaternary`.

**Witness.** README:798–799: "The forward direction is `QuadraticMap.Equivalent.globalInvariants_eq` and the reverse is 7.4."

**Repair.**
- At :803: "*Needs:* 7.4; Tau Ceti `QuadraticMap.Equivalent.globalInvariants_eq`; the bijection with admissible records additionally needs 7.3."
- At :533–535, split the line item by item:
  - binary: 4.2 and `TauCeti.RegularFormClass.eq_hyperbolicClass_of_rank_eq_two_of_discr_eq_neg_one`;
  - ternary: 4.3;
  - unconditional quaternary: the ternary case and `QuadraticForm.not_anisotropic_of_isLocallyIsotropic_quaternary`;
  - all three: `QuadraticForm.IsLocallyIsotropic`.

## R04 (P3) — The Witt-injectivity headline rebuilds `TauCeti.WittRing.globalToLocal` by hand and adds an instance binder it does not need

**Location.**
- `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean:145–152`: `theorem injective_wittRing_baseChange_places [Invertible (2 : K)]`, whose map is assembled from `@TauCeti.WittRing.baseChange K ℝ _ _ (InfinitePlace.embedding_of_isReal w.2).toAlgebra _ _ x`.
- README:842: "This map is `TauCeti.WittRing.globalToLocal`; the Lean statement writes its components out."

**Claim.** The map already exists at the pin, so the headline should be stated on it. The hand-built version duplicates it. The binder `[Invertible (2 : K)]` duplicates the instance that Tau Ceti already supplies for number fields, which is the one `globalToLocal` uses.

**Witness.** `TauCeti/NumberTheory/QuadraticForm/Global/WittLocalization.lean:167–170` defines `globalToLocal := (RingHom.pi fun _ => baseChange).prod (RingHom.pi atRealPlace)`. By `atRealPlace_def` (:101), `atRealPlace` is `baseChange` along `embedding_of_isReal`.

**Repair.** Add `public import TauCeti.NumberTheory.QuadraticForm.Global.WittLocalization` and state:

```lean
theorem injective_wittRing_baseChange_places :
    Function.Injective (TauCeti.WittRing.globalToLocal K) :=
  sorry
```

I elaborated this in a scratch copy of the file; `sorry` is the only warning. In the same file I proved it equivalent (`↔`) to the current statement, taken at the canonical instance, using `funext`, `globalToLocal_apply_fst`, `globalToLocal_apply_snd` and `atRealPlace_def`. At README:842, replace the sentence with: "the Lean statement is the injectivity of `TauCeti.WittRing.globalToLocal`."

## R05 (P3) — `QuadraticForm.Nondegenerate` is not a declaration at the pin

**Location.** README:93: "regular means `QuadraticForm.Nondegenerate`." The From Mathlib contract (:147–175) does not list the notion that every headline assumes.

**Claim.** The pinned declaration is `QuadraticMap.Nondegenerate`; `Q.Nondegenerate` reaches it through `QuadraticForm = QuadraticMap R M R`. The name the README gives does not resolve.

**Witness.** At the head, `#check @QuadraticForm.Nondegenerate` reports an unknown constant. The pinned notion is `Mathlib/LinearAlgebra/QuadraticForm/Radical.lean:115`, `structure Nondegenerate` with the fields `radical_eq_bot` and `rank_rad_polar_le`.

**Repair.**
- At :93, write: "regular means `QuadraticMap.Nondegenerate` (written `Q.Nondegenerate`)".
- Add to From Mathlib: "`QuadraticMap.Nondegenerate` (`LinearAlgebra/QuadraticForm/Radical.lean`): the radical is trivial and the polar kernel has rank at most one. When `2` is invertible, the radical is the polar kernel (`radical_eq_ker_polarBilin`, :126), so this is the usual regularity. The zero form on the zero space satisfies it."

## Verified sound

**Gate, build and dependencies.**
- I reran the gate. Every check except `outside-folder` is 0 (R02). The worker's run also reports `build=0`.
- `lake env lean` on `Suggested.lean` gives 8 warnings, all `declaration uses sorry` (lines 51, 68, 76, 84, 93, 111, 120, 145), and nothing else.
- Depcheck prints `depcheck: 238 roadmaps, 2321 edges, 0 problem(s)`. The roadmap is on main and names no roadmap supplier, so there are no UPWARD or CYCLE lines.

**Elaborated signatures.** I put `#check @` for all 9 declarations in one scratch file. Every type matches its README statement:
- `K : Type u_1`, `V : Type u_2`, `W : Type u_3`;
- `[FiniteDimensional K V]` and `[FiniteDimensional K W]` present;
- `Nondegenerate` hypotheses on both forms;
- `a ≠ 0` in 6.1;
- `1 ≤ rank` coming from `IsAdmissible` in 7.3.

No section binder was lost.

**One-tactic probe.** I replaced each `sorry` with `first | rfl | simp | infer_instance | decide | exact fun _ => by simp_all`. All 8 fail: unsolved goals at lines 70, 78, 88, 97 and 152, and a type mismatch with `simp_all made no progress` at 55, 115 and 126. None is padding.

`equivalent_of_locallyEquivalent` is not `sorry`'d: it is the term `(hasseMinkowski_equivalent Q hQ R hR).2 h`. I keep it rather than call it padding. It is the exact-name interface consumed by IntegralLattices on main (README:477, 916, 1028), and the open IntegralLattices revision `#check`s it. Deleting it would drop a cited id.

**Headlines.** The README names four end theorems (`hasseMinkowski_equivalent`, `exists_globalForm_of_isAdmissible`, `equivalent_iff_globalInvariants_eq`, `injective_wittRing_baseChange_places`). The docstring lists nine headlines (4.2, 5.5, 6.1, 6.2, 6.3, 7.3, 8.1, 8.3, 8.4). All are stated on Tau Ceti carriers. The other targets are steps rather than headlines:
- 4.3 is a step towards 5.1;
- 7.2 is 7.3 combined with `IsLocalRealization.equivalent_atFinitePlace`/`equivalent_atRealPlace`;
- 7.4 is the reverse direction of 8.1;
- 8.2 is equivalent to 8.3 through `globalToLocal_eq_zero_iff`.

**Names resolved at the pins.** I resolved 127 backticked external names by parsing the namespaces of the pinned Mathlib and Tau Ceti sources. All exist except `QuadraticForm.Nondegenerate` (R05). The four flagged by a plain grep exist with `_root_`:
- `QuaternaryDescent.lean:119`;
- `ApproximateValue.lean:61`;
- `HigherRank.lean:87`;
- `HasseSupport.lean:39`.

**Library declarations I opened and checked against the README's description** (Tau Ceti paths under `TauCeti/`; 31 in all):

| Declaration | Location | What I checked |
|---|---|---|
| `Predicates.lean` | :51, :66, :85, :147 | the four predicates, each a finite-place clause and a real-place clause |
| `Invariants.lean` | :90, :178–195 | the record; `IsAdmissible` has exactly the clauses listed at README:213–221 |
| `globalInvariants`, `isAdmissible_globalInvariants_iff` | `FormInvariants.lean:77`, :165 | any universe; admissible iff `1 ≤ rank` and Hasse product one |
| `hilbertSymbol_productFormula`, `globalInvariants_hasseProduct_eq_one`, `isAdmissible_globalInvariants` | `ProductFormula.lean:61`, :67, :100, :107, :117 | `K : Type` |
| `exists_hilbertSymbol_eq_ite`, `exists_pair_hilbertSymbol_eq_ite` | `SignPrescription.lean:72`, :154, :191 | `K : Type` |
| `exists_locallyRepresents_prod` | `PrescribedLocalForms.lean:69`, :140 | `K : Type`; the conclusion is as described at README:293–295 |
| `exists_sq_sub_mul_sq_iff_forall_completion` | `ClassFieldTheory/Global/HasseNorm/Quadratic.lean:41–51` | `K : Type`; nonsquare `d` |
| `finrank_le_index_range_ideleClassNormMap` | `FirstInequality.lean:103–109` | `K L : Type`, Galois, cyclic |
| `mem_range_ideleNormMap_iff` | `Ideles/Norm/Range.lean:115` | an idele is a norm iff each coordinate is a norm |
| `exists_fieldUnit_isSquare_div_at_places` | `Approximation/SquareClass.lean` | `Type*`; finite sets `S`, `T` |
| `not_anisotropic_of_isLocallyIsotropic_quaternary` | `Quaternary.lean:137–141` | ternary hypothesis over every `L : Type u` |
| higher-rank step | `HigherRank.lean:87–91` | induction hypothesis at rank `n − 1` |
| `exists_apply_ne_zero_locallyRepresentsScalar_neg` | `ApproximateValue.lean:61–68` | |
| `finite_setOfPred_anisotropic_atFinitePlace` | `AnisotropicPlaces.lean:90` | `3 ≤ finrank` |
| `exists_atFinitePlace_ne_zero_eq_neg` | `LocalValues.lean:51` | |
| `LocallyEquivalent.of_globalInvariants_eq` | `Classification.lean:81–83` | `V`, `W` in independent universes |
| `localHasse` | `LocalField/QuadraticForm/Hasse.lean:89–93` | product over `i < j` |
| `hilbertSymbol` | `HilbertSymbol/Basic.lean:47` | `1` iff `b = x² − a y²` |
| `hilbertSymbol_real` | `HilbertSymbol/Archimedean.lean:59` | |
| `atRealPlace`, `globalToLocal`, `globalToLocal_eq_zero_iff` | `WittLocalization.lean:94`, :167, :203 | |
| `locally_formClass_eq_nsmul_hyperbolicClass_iff` | `Hyperbolicity.lean:116` | |
| `exists_anisotropic_and_not_anisotropic_away_from_realPlace` | `DefiniteObstruction.lean` | `4 ≤ n`, rank `n + 1` |
| `isAdmissible_rankOne_iff_eq_empty`, `isAdmissible_rankTwo_iff_eq_empty` | `Invariants.lean:263–300` | |
| `valuation_ringEquivOfRingEquiv`, `adicCompletionCongr` | `AdicValuation/Transport.lean:119`, :140 | |
| `asIdeal_equivOfRingEquiv` | `Ideal/Basic.lean:279` | |
| `represents_of_nondegenerate_of_not_anisotropic` | `Representation.lean:332` | |
| `QuadraticMap.Nondegenerate` | Mathlib `Radical.lean:115` | see R05 |

**The count of `Type`-only inputs.** I scanned every cited Tau Ceti file for `(K : Type)` binders. Exactly the eight inputs listed at README:137–144 are `Type`-only; `CohomologicalSymbol.lean` is also `Type`-only, but it is not cited.

**Cross-roadmap citations.**
- Every roadmap named under Scope resolves on main: QuadraticFormInvariants, ClassFieldTheory, `Completed/GlobalNumberFields`, `Completed/NumberFieldArithmetic`, `Completed/OrthogonalSpinGroups`, IntegralLattices and ClassicalArithmeticCompletion.
- ClassFieldTheory at this head says GlobalQuadraticForms owns Hasse–Minkowski (README:195–198) and excludes it from its own scope (:236–237).
- QuadraticFormInvariants defers global form theory to this roadmap (README:64–66).

**Ownership.**
- No Mathlib or Tau Ceti declaration states the global square theorem, Hasse–Minkowski, global existence, global classification or Witt injectivity. I searched by name and by object.
- No other roadmap, on main or in an open pull request, declares these theorems. `roadmaps grep` over the Lean files finds them only here and in #1200.
- No roadmap plans a universe transport of number fields.

**Open pull requests that touch this roadmap.**
- #1200 carries a `README.md` and a `Suggested.lean` for this folder that are byte-identical to this head, and the two heads merge cleanly. Nothing needs ordering.

**Ids this pull request drops.**
- Layer 3, 4.4 and main's Lean names are mapped to Tau Ceti by the section map at README:52–74.
- I checked every citing roadmap. On main: ClassicalArithmeticCompletion (4.4, and the Layer 4 anchor, which still resolves), IntegralLattices and OrthogonalSpinGroups.
- At open heads: MetaplecticAutomorphicForms (Layers 3, 4, 7, 8), GL2AutomorphicRepresentationsAndTransfer and QuaternionArithmetic (`exists_hilbertSymbol_eq_neg_one_iff_pair`, mapped), K3Surfaces and K3SurfacesAndSymplecticBoundedness (§5.5), LatticePackingsAndPerfectForms (§6.1), GeometryOfNumbersAndQuadraticArithmetic (Layers 5–6), its Part II (§§8.1–8.3), HeightsRationalPointsAndObstructions (Layer 5) and OrthogonalSpinGroups (4.3, 6.1, 6.3).
- Every one of these resolves at this head.

**Sources: the seeded sample against `milne-cft`.**

| Target | Locator in the README | Where it is in `milne-cft` | What I confirmed |
|---|---|---|---|
| 4.2 | Thm 1.1, p. 229 | line 10384 | holds for `n = 2` since `−1 ∈ K` |
| 4.2 | Exercise 1.3, p. 229 | line 10397 | 16 is an 8th power in `ℝ` and in `ℚ_p` for odd `p`, but not in `ℚ` |
| 4.3 | Thm 3.1, p. 234 | line 10629 | stated for cyclic extensions |
| 5.1 | Thm 3.5, p. 235 | line 10686 | |
| 5.1 | Prop 3.7(b),(c), p. 236 | lines 10700–10702 | |
| 5.1 | proof of 3.5(b), p. 237 | lines 10772–10804 | |
| 8.2 | Prop 6.2, p. 251 | line 11574 | |
| 7.4, 8.2–8.4 | Thm 6.3, p. 252 | line 11619 | holds for all primes and for arbitrary forms |
| — | Hasse invariant over `i ≤ j` | line 11668 | factor `(−1, d)` in Remark 6.6, line 11691 |
| 7.2, 7.4 | Thm 6.10 and Prop 6.11, p. 255 | lines 11745, 11758 | |
| 7.2 | real remarks, p. 256 | line 11783 | |

**Adversarial table.** Rows I recomputed by hand:

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| Conventions: plain vs signed discriminant | `H`; `⟨1,1⟩` | `H`: plain `[−1]`, signed `(−1)^1·[−1] = [1]`. `⟨1,1⟩`: plain `[1]`, signed `[−1]` | as stated | none |
| Conventions: `i<j` vs `i≤j` | `H` over `ℝ` | `i<j`: `(1,−1)=1`. `i≤j`: `(1,1)(1,−1)(−1,−1) = −1` | differ, as stated | none |
| Conventions: real symbols | `(−1,−1)_ℝ`; `⟨−1,−1⟩` | `−1 = x²+y²` has no real solution, so `−1`. Real Hasse `(−1)^{C(2,2)} = −1` | as stated | none |
| Conventions: `(−1,3)_v` | `v = 3, 2, ∞` | `v=3`: Legendre `(−1/3) = −1`. `v=2`: `ε(−1)ε(3) = 1·1` is odd, so `−1`. `v=∞`: `3 > 0`, so `1`. Two places | as stated | none |
| 4.1 places follow `σ` | `ℚ(i)`, conjugation, `2+i` | Mod `(2−i)`: `i ≡ 2`, `2+i ≡ 4 = 2²`, so a square in `K_𝔭̄`. Valuation 1 at `𝔭`, so not a square there. `σ(2+i) = 2−i` is a square in `K_𝔭` | the transport must move places | none |
| 4.1 model in `Type` | `ℚ(√5)` → `ℚ[X]/(X²−X−1)` | `θ ↦ 1.618` gives `⟨1,+,+⟩`, `p = 3`. `θ ↦ −0.618` gives `⟨1,−,−⟩`, `p = 1`. Same on both models | holds | none |
| 4.1 "each of the eight" | the first inequality | no transport of `L`, ideles, norm map or index is listed | overclaim | R01 |
| 4.2 | `ℚ`: `a = 4, −1, −4`; 8th powers | `4`: hypothesis holds, `2² = 4`. `−1`, `−4`: hypothesis fails at every `p ≡ 3 (4)`; conclusion false. `16`: an 8th power at all odd `p` and `ℝ`, not in `ℚ` | holds; analogue fails as stated | none |
| 4.2 ⚠ idele | `(√2)_∞ × 1` | `α = √2 ∉ ℚ` is impossible. `α = 1`: `√2/1 > 0`, a real square | as stated | none |
| 4.2 Check `x⁸ − 16` | factorization | `(x²+2x+2)(x²−2x+2) = x⁴+4` and `(x²−2)(x²+2) = x⁴−4` | as stated | none |
| 4.3 | `d = −1`: `a = 5, 3, −1`; `d = 2`: `a = −1` | `5 = 1²+2²`: both true. `3`: `(−1,3)_3 = −1`, both false. `d=2, a=−1`: `1−2 = −1`, both true. `d=−1, a=−1`: the real place fails, both false | holds | none |
| 5.1 binary | `⟨1,1⟩` over `ℚ(i)` and over `ℚ` | `ℚ(i)`: `d = [1] = [−1]`, isotropic at `(1, i)`, both true. `ℚ`: anisotropic at `ℚ₃`, both false | holds | none |
| 5.1 ternary | `⟨1,1,−2⟩`, `⟨1,1,−3⟩`, `⟨1,1,1⟩` | `−2`: `d = −1`, `a = 2 = 1²+1²`, both true. `−3`: `(−1,3)_3 = −1`, both false. `1,1,1`: `(−1,−1) = −1` exactly at `{2, ∞}`, two places | holds; parity matches | none |
| 5.5 `hasseMinkowski_isotropic` | rank 0, `⟨a⟩`, `H`, `⟨1,1,1,1,1⟩`/`ℚ`, degenerate | rank 0: LHS false; RHS false, since the finite places are nonempty and each local form is anisotropic. `⟨a⟩`: both false. `H`: both true. Five ones: anisotropic at `ℝ`, so both false. Degenerate: a radical vector makes both true | holds | none |
| 5.5 discussion | `U = ⟨1,1⟩`, `W = ⟨1,−1,1⟩` | `x = (1,0)`: `b = 1`; `y = (0,1,0)`: `W(y) = −1` | as stated | none |
| 6.1 `represents_iff_locallyRepresents` | `⟨1,1⟩`: `a = 3, −1`; `H`; `V = 0` | `3`: fails at `2`, `3`, both false. `−1`: fails at `ℝ`, `ℚ₂`, both false. `H`: both true. `V = 0`, `a ≠ 0`: both false | holds | none |
| 6.2 `represented_iff_locallyRepresented` | `⟨c⟩ → H`; rank `Q >` rank `R`; `V = 0` | `((1+c)²−(1−c)²)/4 = c`; the vector's coordinates sum to 1, so it is nonzero and the map injective. Larger rank: both false. `V = 0`: both true | holds | none |
| 6.3 `hasseMinkowski_equivalent` | `H`/`⟨2,−2⟩`; `⟨1⟩`/`⟨−1⟩`; `⟨1,1,−3⟩`/`⟨1,1,−1⟩`; `0`/`0` | true/true. Real `p = 1` vs `0`: false/false. Signature `(2,1)` on both; at `ℚ₃` one is anisotropic and the other isotropic: false/false. `0`/`0`: true/true | holds | none |
| 7.2 | `ℚ`, rank 3, `d = [1]`, `R = ⟨1,1,1⟩`, `s₂ = −1`; `⟨−1,−1,−1⟩` | First: product `(−1)·1 = −1`, so the hypotheses fail. Second: `s₂ = (−1,−1)₂³ = −1`, real `(−1)^{C(3,2)} = −1`, product `1` | holds | none |
| 7.2 real classes | rank 4, `d = [1]` | `q = 0, 2, 4` give real Hasse `1, −1, 1` | three classes, as stated | none |
| 7.3 `exists_globalForm_of_isAdmissible` | `ℚ(√5)` record; rank 1 with `T` of size 2; rank 0 | `ℚ(√5)`: real Hasse `1` and `(−1)^{C(2,2)} = −1`; `s_(2) = (θ,−1)_2 = −1` by reciprocity, since `(θ,−1)` is `−1` only at the second real place; product `1`; realized by `⟨1,θ,θ⟩`. Rank 1: product `1`, but `s_v ≠ 1` makes it not admissible. Rank 0: not admissible, so the statement is silent | holds | none |
| 7.4 | Milne's `S` vs `ε` | `S = ε·(−1,d)_v` with the same `d` on both sides | as stated | none |
| 8.1 `equivalent_iff_globalInvariants_eq` | `⟨1,1,−1⟩`/`⟨1,2,−2⟩`; `⟨1,1⟩`/`⟨2,2⟩`; `0`/`⟨1⟩` | First pair: both `(3,[−1],1,2)`, isometric. Second pair: `[1] = [4]`, `(2,2) = 1` since `4−2 = 2`, isometric by `(x+y, x−y)`. Third: ranks differ, false/false | holds; 7.3 is not needed (R03) | R03 |
| 8.2 | `⟨1,−1,2,−2⟩`; `⟨1,1⟩` | First: hyperbolic everywhere. Second: `d = [1] ≠ [−1]`, anisotropic at `ℝ` | holds | none |
| 8.3 `injective_wittRing_baseChange_places` | `ℚ(i)` (no real place); `⟨1,1⟩`; `⟨1⟩`; `⟨1,1,−3⟩ ⊥ ⟨−1,−1,1⟩` | `ℚ(i)`: a kernel class has even dimension, so it is locally hyperbolic everywhere, hence zero. `⟨1,1⟩`: real signature 2. `⟨1⟩`: odd dimension at every `v`. Last: differs at `ℚ₃`, so its image is nonzero | holds; same proposition as `Injective (globalToLocal K)` | R04 |
| 8.3 `[Invertible 2]` | two instances | `Subsingleton (Invertible 2)` | equivalent to the unconditional statement | R04 |
| 8.4 `equivalent_of_locallyEquivalent` | as in 6.3 | the reverse direction of 6.3 | holds | none |
| Supplier note: the first inequality needs cyclicity | `ℚ(∛2, ζ₃)` | degree 6; norm index `[ℚ(ζ₃):ℚ] = 2` | as stated | none |

## Not verifiable

- **O'Meara** (`omeara`): 58:7, 65:15, 66:1, 66:3, 66:4, 66:5, 71:19, 71:19a and 72:1. The manifest records this source as `uncertified` (paywalled, DOI 10.1007/978-3-642-62031-7), so I did not read the text. Each restated statement agrees with the standard theorem.
  - `milne-cft` itself states several of these targets, and its locators would be certified: 5.5 (Thm 3.5(b), p. 235); 6.1 (Cor 3.6, p. 236, line 10694, where "represents" uses a nonzero vector); 6.3 (Thm 6.3, p. 252); and 7.2 (Thm 6.12, p. 256, line 11792, with the `i ≤ j` Hasse invariant and all primes).
  - Adding these is optional.
  - 71:19 and 71:19a now appear only under References.
- **Serre** (`serre`): Ch. III §1.2 Thm 1, Ch. III §2.2 Thm 3, Ch. IV §2.1 and Ch. IV §3.2 Thm 8. The manifest records it as `uncertified`, so I did not read it.

## Source issues

- **Misprint** in milne-cft at VIII, proof of Theorem 3.5(b), p. 237: the source says the cases n = 3, 4 follow from Proposition 3.7(c,d) and Theorem 1.1; it should be Theorem 3.1, the Hasse norm theorem, as in the proof of 3.5(a); affects nothing.
- **Misprint** in milne-cft at VIII, proof of Theorem 3.5(b), p. 237: the source says the induction assumes Theorem 3.1b for n − 1; it should be Theorem 3.5(b) for n − 1; affects nothing.
- **Gap** in milne-cft at VIII, proof of Theorem 3.5(b), p. 237: the source takes c = a x₁² + b x₂² from approximations on S and never excludes c = 0, for instance when S is empty; it should choose x₁, x₂ with c ≠ 0, so that cY² − r is nondegenerate; affects the proof.
- **Misprint** in milne-cft at VIII, proof of Theorem 6.3, p. 252: the source names the two complements q₁ and q₂ and then compares q₁ with q₂; the second should be q₁′, the complement inside q′; affects nothing.
