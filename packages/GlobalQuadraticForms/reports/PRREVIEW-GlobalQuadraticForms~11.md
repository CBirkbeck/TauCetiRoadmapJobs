# Review of GlobalQuadraticForms (pull request #1200 at 15f0a4c)

**Verdict:** needs changes

This is an AI-assisted full review of `TauCetiRoadmap/GlobalQuadraticForms/` at `15f0a4cd2a54a454c23c678aacfa861baff271f4`. It is the same commit the previous review read, and the folder has 0 changed lines. There are six findings:

- one P1, re-raised from the previous review;
- one new P2;
- four new P3.

## R01 (P1) — The branch still pins Tau Ceti `358314d`, where 16 cited declarations do not exist, and it does not merge with main

Re-raised: R01 (repair report GATE~2, "Which pin").

**Location.** `TauCetiRoadmap/GlobalQuadraticForms/README.md:136–137`: "There is no roadmap supplier. Every input below is a declaration of Mathlib or Tau Ceti at the pins." The contracts at :147–315 and the *Needs:* lines of 4.2, 4.3, 7.2, 7.3, 8.2 and 8.3 rest on this sentence.

**Claim.** Every cited input exists at this branch's pins.

**Witness.** `lake-manifest.json` pins Tau Ceti `358314d` and Mathlib `f6090c7`. Sixteen cited names (for example `finrank_le_index_range_ideleClassNormMap` and `WittRing.globalToLocal`), 11 cited Tau Ceti files and Mathlib's `AdicValuation/Completion.lean` exist only at main's `2fd255d`/`1b1ccf4`. `git merge-tree HEAD origin/main` reports a conflict in `Suggested.lean`.

**Why the reason fails.** The reason is right that the repair job cannot do this. But the finding does not ask anyone to edit the manifest:
- It asks for a merge of `origin/main`, which brings main's manifest along with main's history.
- The only conflict is inside this folder's `Suggested.lean`.
- The head is the same commit as at the previous review, so nothing has moved.

Until the worker or a human makes that merge, the sentence at :136–137 is false at the branch pins, and the pull request cannot merge.

**Repair.**
1. Merge `origin/main` into the branch.
2. Resolve the conflict by keeping this branch's `Suggested.lean` and `README.md`.
3. Rerun the gate and its targeted build at main's pins.

Repairing R02–R05 first does not change how the merge resolves.

**Tested.** `git merge-tree --write-tree -X ours HEAD origin/main` gives tree `2c386ad`:
- its folder is byte-identical to this head;
- its `lake-manifest.json` is main's blob `770a950`;
- it differs from main only in this folder's two files.

All 16 names, the 11 files and the Mathlib path exist at `2fd255d`/`1b1ccf4` (listed under Verified sound). Elaboration at main's pins was not run (see Not verifiable).

## R02 (P2) — 4.1 is said to carry all eight `Type`-only inputs to every universe, but it cannot carry the first inequality

**Location.** `README.md:375–377`: "Together these give each of the eight inputs for number fields in every universe: transport the data to a model in `Type` by the first fact, apply the input there, and transport the conclusion back by the second." The same claim is made at :22–23, :91–92, :144–145, :321–322 and :335–337.

**Claim.** The two facts of 4.1 transport each of the eight inputs, including `TauCeti.ClassFieldTheory.finrank_le_index_range_ideleClassNormMap`.

**Witness.** At main's pin (`TauCeti/NumberTheory/ClassFieldTheory/Global/IdeleClass/FirstInequality.lean`, variables at :68 and :103, theorem at :108), the inequality takes `K L : Type` with `[IsGalois K L]`. It concludes `finrank K L ≤ (ideleClassNormMap K L).range.index`. 4.1 transports no second field, no idele class group, no norm map and no index.

**Consequence.** No target breaks. 4.2 (:417–419) already takes the right route: it transports its own hypothesis and conclusion, then applies the inequality to `K` in `Type`. The defect is the universe-general first inequality that the six passages promise and that no target delivers.

**Repair.** At the six places above, say two things:
- 4.1 carries seven of the eight inputs: the quadratic Hasse norm theorem, the reduction of 72:1, the product formula, the Hasse product of a form, admissibility of a form's record, and the two sign prescriptions.
- The first inequality is applied only inside 4.2. There it is applied to a model of `K` in `Type` and to a quadratic extension also in `Type`, after 4.2 has transported its hypothesis (local squares outside `S`) and its conclusion (a global square).

**Tested.** Take `K : Type 1` and `a ∈ Kˣ` that is a square at every `v ∉ S`.
1. The first fact gives the model `K₀ = AdjoinRoot (minpoly ℚ α) : Type`.
2. The second fact carries `a` and `S` to `a₀` and `σS`.
3. `E₀ = K₀(√a₀)` lies in `Type`, so the inequality applies there and gives `IsSquare a₀`.
4. `IsSquare a₀` transports back to `IsSquare a`.

Every step uses only what 4.1 lists, so the repaired text matches the route.

## R03 (P3) — #1215 now changes this folder differently, the two heads conflict, and the description neither states an order nor describes this head

**Location.** The pull request's description. It names no order with #1215, and it describes "the rank-four plain/signed discriminant comparison", saying that "the theorem statement and proof obligations are unchanged" and that the branch "retains its `Completed.NumberFieldArithmetic.Suggested` import".

**Claim.** The description describes this change, and the change can merge independently of #1215.

**Witness.**
- `git merge-tree --write-tree HEAD b94cfccc` (the head of #1215) reports content conflicts in both `README.md` and `Suggested.lean`, with merge base `fa41b37`.
- Against #1215's previous head `024927f` the merge is clean. `b94cfccc` (06:54:44Z) postdates the overlap index (06:53:48Z), which is why the overlap report says clean.
- At this head, `Suggested.lean` imports only Mathlib and five Tau Ceti modules.

**Repair.**
1. State the order in this pull request's description: this pull request merges first, after R01's merge, and #1215 rebases onto it. #1215 then keeps in this folder only what this pull request does not change.
2. #1215's folder edits since `024927f` (77 insertions, 44 deletions) are mostly the repairs requested as R02, R04 and R05. Once those are made here, they drop out of #1215's rebase.
3. Rewrite the description to describe this head:
   - both files are rebuilt on Tau Ceti carriers;
   - `Suggested.lean` has nine declarations and no roadmap import;
   - Layers 0–3 and 4.4 are resolved by the section map at :52–74.

**Tested.** `git merge-tree HEAD 024927f` is clean, so the conflict comes only from #1215's latest commit, `b94cfccc`.

## R04 (P3) — 5.1's *Needs:* line covers three results and omits the inputs of the binary and ternary routes

**Location.** `README.md:533–535`: "*Needs:* 4.2, 4.3; Tau Ceti `TauCeti.RegularFormClass.eq_hyperbolicClass_of_rank_eq_two_of_discr_eq_neg_one`, `QuadraticForm.not_anisotropic_of_isLocallyIsotropic_quaternary`, `QuadraticForm.IsLocallyIsotropic`."

**Claim.** This one line lists what the binary, ternary and quaternary statements and their routes need.

**Witness.** The binary route (:516–520) reads isotropy over each `K_v` as discriminant `[-1]`. That needs two lemmas, neither of which is listed here or in the contracts:
- `QuadraticForm.not_anisotropic_iff_discr_eq_neg_one_of_finrank_eq_two` (`RegularFormClass/LowRank.lean`);
- `QuadraticForm.discr_atFinitePlace` (`Global/Discriminant.lean:42`).

The diagonalization used by the ternary route is also missing.

**Repair.** Split the line into one item per result:
- **Binary:** 4.2 with `S = ∅`, the two lemmas above, and `eq_hyperbolicClass_of_rank_eq_two_of_discr_eq_neg_one`.
- **Ternary:** 4.3 and Mathlib `QuadraticForm.equivalent_weightedSumSquares_units_of_nondegenerate'` (`LinearAlgebra/QuadraticForm/IsometryEquiv.lean`).
- **Quaternary consequence:** the ternary case over every number field in the universe of `K`, plus `not_anisotropic_of_isLocallyIsotropic_quaternary`.

Add the three new names to the supplier contracts.

**Tested.** All three names exist at both pins:
- the LowRank lemma at `:177` on the branch and `:173` on main;
- `discr_atFinitePlace` at `:42`;
- the Mathlib lemma at `:177`.

The quaternary theorem's `hternary` binder quantifies over `L : Type u` (`Quaternary.lean:140`), the universe of `K`, which 5.1's ternary case covers.

## R05 (P3) — The Conventions name the regularity predicate `QuadraticForm.Nondegenerate`, which is not a declaration

**Location.** `README.md:93`: "regular means `QuadraticForm.Nondegenerate`."

**Claim.** `QuadraticForm.Nondegenerate` is the library's regularity predicate.

**Witness.** In a scratch file at the branch pin, `#check @QuadraticForm.Nondegenerate` fails with "Unknown constant". The predicate is Mathlib's `QuadraticMap.Nondegenerate` (`LinearAlgebra/QuadraticForm/Radical.lean:115`, at both pins). It is absent from "From Mathlib" although every headline assumes it.

**Repair.**
1. At :93, name `QuadraticMap.Nondegenerate`.
2. Add a "From Mathlib" bullet for it, saying:
   - it means: the radical is `⊥` and the polar kernel has rank at most one;
   - when `2` is invertible the radical is the polar kernel (`QuadraticMap.radical_eq_ker_polarBilin`), so this is regularity in the usual sense;
   - `⟨1, -1⟩` satisfies it, `⟨1, 0⟩` does not, and the zero form on the zero space does.

Theorem names such as `QuadraticForm.Nondegenerate.atFinitePlace` are correct and stay.

**Tested.** At the branch pin, `example (Q : QuadraticForm ℚ (Fin 2 → ℚ)) : Q.Nondegenerate = QuadraticMap.Nondegenerate (Q := Q) := rfl` elaborates. With `pp.explicit`, the `hQ` and `hR` of `equivalent_iff_globalInvariants_eq` print as `QuadraticMap.Nondegenerate … Q` and `… R`.

## R06 (P3) — The translation of 8.4 into `H¹(K, SO(Q))` is credited to Orthogonal and Spin Groups, which assigns it to its successor

**Location.** `README.md:84–85`: "nonabelian cohomology, `H¹(K, SO(Q))`, torsors and Tate–Shafarevich sets: Orthogonal and Spin Groups, which translates 8.4 into a statement about `SO`". The same credit is given at :862–863 and at :900–901 ("owns the translation to `SO` torsors").

**Claim.** Orthogonal and Spin Groups owns the translation of 8.4 into `H¹(K, SO(Q))`.

**Witness.**
- `Completed/OrthogonalSpinGroups/README.md:965–966` on main: translating the Hasse principle into a pointed-set statement "is the successor's work".
- The same file at :49 names that successor: `OrthogonalTamagawaAndLatticeMass`.
- The open revision of that file (#1181, :1497–1501) says the same.

**Repair.** At :84–85, :862–863 and :900–901, name `OrthogonalTamagawaAndLatticeMass` as the roadmap that translates 8.4 into a statement about `H¹(K, SO(Q))`. Keep Orthogonal and Spin Groups as a consumer of 6.3. That roadmap's open head (#1222) does not yet state the translation, but that belongs to that roadmap.

**Tested.** `grep` of `Completed/OrthogonalSpinGroups/README.md` on main finds `GlobalQuadraticForms` only at :68, :947 and :965, all as inputs that the successor consumes.

## Previous findings

- **R01 (P1)**: not repaired. The head is the same commit as at the previous review, and every value in its witness is unchanged:
  - Tau Ceti pin `358314d`;
  - the 16 names absent there;
  - `a891cd19` not an ancestor;
  - the conflict with `origin/main` in `Suggested.lean`.

  Re-raised as R01.

## Verified sound

**Gate and dependencies.**
- The gate rerun at this head reports every check 0 and ends with `OK`, and the worker's run reports `build=0`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The dependency check printed exactly `depcheck: 238 roadmaps, 2320 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- There is no roadmap supplier and no `gap:` contract.

**Lean at the branch pins.**
- `lake env lean` on `Suggested.lean` exits 0 with exactly 8 `sorry` warnings, at lines 51, 68, 76, 84, 93, 111, 120 and 145.
- `#check @name` for all 9 declarations in one scratch file: every type matches its README statement.
  - `K : Type u_1`, with `V` and `W` in their own universes.
  - `pp.explicit` shows that each regularity hypothesis is about its own form (`hQ` about `Q`, `hR` about `R`).
  - 6.1 carries `a ≠ 0` and 8.3 carries `[Invertible 2]`.
  - No binder is lost and nothing changed.
- One-tactic probe on a scratch copy: all 8 sorried theorems fail `rfl`, `(simp; done)`, `infer_instance`, `aesop`, `decide` and `exact?`.
- `equivalent_of_locallyEquivalent` (8.4) is one term from 6.3. It is kept because main cites it by name: `TauCetiRoadmap/IntegralLattices/README.md:477`, `:916`, `:1028`, and the open OrthogonalSpinGroups revision (:1497–1499).
- The five `TauCeti.*` imports are all used. `unitAtFinitePlace` comes from `Global/Localization.lean:41`.
- `WittRing.baseChange` has identical binders at both pins (`Witt/BaseChange.lean:211`/`:210`, variables :156–158). The inline 8.3 map is therefore `TauCeti.WittRing.globalToLocal K` at main's pin: `atRealPlace` is `baseChange` along `embedding_of_isReal` (`WittLocalization.lean:94–99`). This is a pin-neutral spelling of the same map, not a stand-in.

**Headline theorems.** The README's headlines are 4.2, 5.5, 6.1, 6.2, 6.3, 7.3, 8.1, 8.3 and 8.4, and all nine are stated.
- 8.2 (global hyperbolicity) is the restriction of 8.3 to classes of forms.
- 7.2 is 7.3 combined with the pinned `IsLocalRealization` lemmas.

Neither is a missing headline.

**Native at the pins?** None of the headlines is native at either pin:
- I grepped `TauCeti/` at `358314d` and `2fd255d` by docstring.
- `WittLocalization.lean:40` at main's pin says that injectivity is not proved there.
- `LocalWittClass.lean:35` and `Classification.lean:31` defer the global square theorem.
- No binary, ternary or 4.3 adapter theorem exists in `Global/`.
- No other open roadmap owns these objects: `roadmaps grep` for Hasse–Minkowski found only this pull request and #1215, and QuadraticFormInvariantsPartII (#1834) treats function fields and henselian fields.

**Library declarations opened**, with file and line at the branch pin unless marked main:
- **Mathlib:**
  - `QuadraticMap.Nondegenerate` (`Radical.lean:115`) and `radical_eq_ker_polarBilin` (`:126`);
  - `QuadraticMap.Anisotropic` (`Basic.lean:1056`) and `QuadraticMap.Equivalent` (`IsometryEquiv.lean:46`);
  - `equivalent_weightedSumSquares_units_of_nondegenerate'` (`IsometryEquiv.lean:177`);
  - `InfinitePlace.comap` (`Ramification.lean:45`), `isReal_comap_iff` (`:82`) and `comap_embedding_of_isReal` (`:90`);
  - `adjoinRootEquivAdjoin` (`Adjoin/Basic.lean:418`, main `:423`), `RingOfIntegers.mapRingEquiv` (`NumberField/Basic.lean:192`) and `HeightOneSpectrum.equivOfRingEquiv` (`Ideal/Lemmas.lean:592`);
  - `ringEquivRealOfIsReal` (`Completion/InfinitePlace.lean:330`).
- **Tau Ceti:**
  - `QuadraticMap.Represents` (`Representation.lean:44`, `∃ v, Q v = a`) and `IsRepresentedBy` (`:47`);
  - `IsLocallyIsotropic` (`Predicates.lean:51`), `LocallyRepresents` (`:66`), `LocallyRepresentsScalar` (`:85`) and `LocallyEquivalent` (`:147`);
  - `GlobalFormInvariants` (`Invariants.lean:90`) and `IsAdmissible` (`:178`; its five clauses match :214–216);
  - `globalInvariants` (`FormInvariants.lean:77`) and `TauCeti.hilbertSymbol` (`HilbertSymbol/Basic.lean:46`, matching Conventions :107–108);
  - `not_anisotropic_of_isLocallyIsotropic_quaternary` (`Quaternary.lean:137`) and `not_anisotropic_of_isLocallyIsotropic_of_five_le_finrank` (`HigherRank.lean:87`).
- **Tau Ceti at main's pin:**
  - `finrank_le_index_range_ideleClassNormMap` (`FirstInequality.lean:108`) and `exists_sq_sub_mul_sq_iff_forall_completion` (`HasseNorm/Quadratic.lean:45`, `K : Type` at :41, all infinite completions);
  - `IsLocalRealization.exists_locallyRepresents_prod` (`PrescribedLocalForms.lean:140`; the clause at :293–295 is exact);
  - `hilbertSymbol_productFormula` (`ProductFormula.lean:67`), `globalInvariants_hasseProduct_eq_one` (`:107`) and `isAdmissible_globalInvariants` (`:117`), all `K : Type`;
  - `exists_pair_hilbertSymbol_eq_ite` (`SignPrescription.lean:191`);
  - `IsLocalRealization.equivalent_atFinitePlace` and `equivalent_atRealPlace` (`Classification.lean:187` and `:226`; the clause at :298–299 is exact);
  - `globalToLocal` (`WittLocalization.lean:167`) and `globalToLocal_eq_zero_iff` (`:203`).

**The 16 names absent at `358314d` and present at `2fd255d`:**
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

**The 11 cited Tau Ceti files that exist only at `2fd255d`:**
- `Global/ProductFormula`
- `Global/SignPrescription`
- `Global/PrescribedLocalForms`
- `Global/Existence`
- `Global/Hyperbolicity`
- `Global/WittLocalization`
- `Global/DefiniteObstruction`
- `Global/WorkedExamples/Sqrt5`
- `RingTheory/DedekindDomain/Ideal/Basic`
- `ClassFieldTheory/Global/IdeleClass/FirstInequality`
- `ClassFieldTheory/Global/HasseNorm/Quadratic`

A script over all 170 backticked tokens resolved 126 at some pin. No name present at the branch pin is missing at main's pin.

**Cross-roadmap citations resolved.**
- **On main:**
  - ClassicalArithmeticCompletion "Global Quadratic Forms 4.4" (:165, :589, :591, :783, :793) resolves through the section map at :67–74.
  - IntegralLattices `hasseMinkowski_equivalent` and `equivalent_of_locallyEquivalent` (:477, :916, :1028, :1762, :2229, :2306) resolve.
  - Completed/OrthogonalSpinGroups `GlobalQuadraticForms.hasseMinkowski_equivalent` (:947, :965) resolves.
- **At open heads:**
  - MetaplecticAutomorphicForms (#1063): Layers 3, 4, 4.4, 7 and 8 resolve through :63–74. This settles the overlap report's "Layer 3" item.
  - GL2AutomorphicRepresentationsAndTransfer (#931): §4.4, including `exists_hilbertSymbol_eq_neg_one_iff_pair`, resolves (:72–73).
  - K3Surfaces (#1285) and K3SurfacesAndSymplecticBoundedness (#1375): §5.5 resolves.
  - LatticePackingsAndPerfectForms (#1723): §6.1 resolves.
  - QuaternionArithmetic (#1722): §4.4 resolves.
  - GeometryOfNumbersAndQuadraticArithmeticPartII (#1691): §4.4 and §§8.1–8.3 resolve.
  - OrthogonalSpinGroups (#1181): the anchors `#43-the-quadratic-hasse-norm-adapter`, `#61-scalar-representation` and `#63-hasseminkowski-isometry` match the headings.

**Ownership against open pull requests** was checked with `roadmaps grep`, `roadmaps overlaps` and the sibling checkouts of #1215, #1834, #1222 and #1181. The only object with two owners is this folder itself, which #1215 also changes (R03).

**Sources (seeded sample).** I read every Milne VIII locator in its cached text, checking the theorem number, the page, the hypotheses and that the source supports the statement as written:

| Locator | Text at | Supports |
|---|---|---|
| Thm 1.1 (with `n = 2`), p. 229 | milne-cft line 10384 | 4.2; "all but finitely many primes" imposes nothing at the archimedean places |
| Ex 1.3, p. 229 | line 10397 | 4.2's eighth-power Check |
| Thm 3.1, p. 234 | line 10629 | 4.3 (cyclic extension) and the ternary case of 5.1 |
| Thm 3.5, p. 235 | line 10686 | 5.5 |
| Prop 3.7(b), (c), p. 236 | lines 10698–10702 | the binary and ternary cases of 5.1 |
| Proof of 3.5(b), p. 237 | lines 10772–10804 | 5.1 and 5.5 |
| Prop 6.2, p. 251 | line 11574 | 8.2 (Witt cancellation) |
| Thm 6.3, p. 252 | line 11619 | 7.4, 8.2, 8.3 and 8.4 |
| Thm 6.10, p. 255 | line 11745 | 7.2 and 7.4 |
| Prop 6.11, p. 255 | line 11758 | 7.2's one-class exceptions |
| Remarks before 6.12, p. 256 | lines 11781–11790 | 7.2's real-place remark |

Milne's Hasse invariant is the product over `i ≤ j` (line 11667) and his `ε` is the product over `i < j` (line 11680), as :928 and :770–771 say. 4.1 cites no source; it is a transport-of-structure target.

**Adversarial table.** Computed for each sampled target, each headline, each Convention, and every target that a finding touches.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 4.1: the eight `Type`-only inputs reach every universe | `K : Type 1`, `L = K(√-1)` | seven inputs are about `K`, its places, forms and symbols; `finrank_le_index_range_ideleClassNormMap` takes `K L : Type` and concludes `finrank K L ≤ (ideleClassNormMap K L).range.index`; 4.1 lists no transport of `L`, `C_L` or the index | 7 of 8 transported | R02 |
| 4.1: places follow σ | `ℚ(i)`, complex conjugation, `𝔭 = (2+i)` | mod `(2−i)`: `i ≡ 2` and `2+i ≡ 4 = 2²`, so `2+i` is a square in `K_𝔭̄`; `v_𝔭(2+i) = 1`, so it is not a square in `K_𝔭`; `2−i ≡ 4` mod `𝔭` | Check correct | none |
| 4.1: real places | `ℚ(√5)`, `θ ↦ (1±√5)/2` | `⟨1,θ,θ⟩`: `θ ≈ 1.618` gives `p = 3`; `θ ≈ −0.618` gives `p = 1` | correct | none |
| 4.2: global square theorem [headline] | `ℚ`: `a = 4, −1, 2, −4`; `16` as an eighth power | `4 = 2²`; `−1` is a nonsquare at `p ≡ 3 (4)` (3, 7, 11, …); `2` at `p ≡ ±3 (8)` (3, 5, 11, 13); `−4` fails wherever `−1` does; `x⁸−16 = (x²−2)(x²+2)(x²+2x+2)(x²−2x+2)`; `16` is not an eighth power in `ℚ` | true (Milne VIII 1.1, `n = 2`) | none |
| 4.2: warning | `ℚ`, `S = {∞}`, idele `(√2, 1, 1, …)` | the global element would be `√2 ∉ ℚ`; with `α = 1`, `√2 > 0` is a real square | correct | none |
| 4.2: route step 5 | `E = K(√a)`, surjective norm on idele classes | index `1 < 2 = [E:K]` | contradiction obtained in `Type` | R02 (wording only) |
| 4.3: quadratic Hasse norm adapter | `d = −1`: `a = 5`, `a = 3`; `d = 2, a = −1`; `d = −1, a = −1` | `5 = 1+4`; `(−1,3)₃ = (−1/3) = −1`; `1−2 = −1`; `x²+y² = −1` has no real solution | both sides agree in all four | none |
| 5.1: binary | `⟨1,1⟩` over `ℚ(i)` and over `ℚ` | `d = [1] = [−1]` since `−1 = i²`, and `1 + i² = 0`; over `ℚ` it fails at `ℚ₃` | correct; route needs the LowRank criterion and `discr_atFinitePlace` | R04 |
| 5.1: ternary | `⟨1,1,−2⟩`, `⟨1,1,−3⟩`, `⟨1,1,1⟩` | `d = −1`, `a = 2 = 1+1`; `(−1,3)₃ = −1` and `(−1,3)₂ = (−1)^(1·1) = −1`; `(−1,−1) = −1` only at `ℝ` and `ℚ₂` | anisotropic places come in even numbers | none |
| 5.5: Hasse–Minkowski isotropy [headline] | rank 0, rank 1, `H`, `⟨1,1,−3⟩`, `⟨1,1,1,1,1⟩`, degenerate `⟨1,0⟩` | F/F; F/F; T/T; F/F (`ℚ₃`); F/F (`ℝ`); without `hQ`, the radical vector `e₂` gives T/T | holds; `hQ` kept at the source's generality | none |
| 6.1: scalars [headline] | `⟨1,1⟩` with `a = 3, 5, −1`; zero-dimensional form; `a = 0` | F/F (`ℚ₃`); T/T; F/F (`ℝ`, and `ℚ₂` where `(−1,−1)₂ = −1`); F/F; `a = 0` is T/T at the zero vector | holds; `ha` serves the route only (:612–613) | none |
| 6.2: forms [headline] | `⟨3⟩→⟨1,1⟩`; `⟨c⟩→H`; `⟨1,1⟩→⟨1,1,1,1⟩`; rank 2 into rank 1 | F/F (`ℚ₃`); `((1+c)/2)² − ((1−c)/2)² = c`; inclusion; F/F by `finrank_le` | holds | none |
| 6.3: isometry [headline] | `⟨1,1⟩` vs `⟨2,2⟩`; `⟨1⟩` vs `⟨−1⟩`; `⟨1,1,−3⟩` vs `⟨1,1,−1⟩`; two rank-0 forms | `(x+y)²+(x−y)² = 2x²+2y²`; signatures `1` vs `−1` at `ℝ`; same `(2,1)` but they differ at `ℚ₃`; T/T | holds | none |
| 7.2: existence | `⟨−1,−1,−1⟩`; rank 3, `d = [1]`, `⟨1,1,1⟩`, `s = −1` only at 2; real rank 4 with `d = [1]` | `s₂ = (−1,−1)₂³ = −1`, real `(−1)^3 = −1`, product `1`; `(−1)·1 = −1`, excluded; `q = 0, 2, 4` give `s = 1, −1, 1` | correct (Milne VIII 6.11 and p. 256) | none |
| 7.2: correction planes | `P = ⟨1,−b⟩`, `P' = ⟨a,−ab⟩` | `d(P) = [−b] = [−a²b] = d(P')`; `s(P') = (a,−a)(a,b) = (a,b)`; `s(P) = 1` | correct | none |
| 7.3: realization [headline] | `ℚ(√5)` record; `⟨1⟩`; rank 0; rank 1 with two `−1` signs | real Hasse signs `1` and `(−1)^1 = −1`, finite `−1`, product `1`; real discriminants `(−1)^0 = (−1)^2 = 1 = [1]`; rank 0 fails `1 ≤ n`; rank 1 fails the rank-one clause | correct | none |
| 7.4: convention factor | `⟨3⟩` over `ℚ₃` | `i<j` gives `1`; `i≤j` gives `(3,3)₃ = (3,−1)₃ = (−1/3) = −1 = (−1,d)₃`; in general `∏_{i≤j} = s·(−1,d)` | correct | none |
| 8.1: classification [headline] | `⟨1,1,−1⟩` vs `⟨1,2,−2⟩`; `⟨1,1⟩` vs `⟨2,2⟩`; zero form vs `⟨1⟩` | `[−1] = [−4]`; `s = 1` on both sides since `(2,−2) = 1`; `p = 2, 2`; `2 = 2² − 2·1²` gives `(2,2) = 1`; ranks `0 ≠ 1` | equal records ⇔ isometric | none |
| 8.2: hyperbolicity | `⟨1,−1,2,−2⟩`; `⟨1,1⟩`; odd rank | `≅ 2H`; `d = [1] ≠ [−1]` and anisotropic at `ℝ`; odd rank is never `m·H` | correct | none |
| 8.3: Witt injectivity [headline] | `[⟨1⟩]`, `[⟨1,1⟩]`, `[H]`, complex places | odd dimension makes it nonzero at every `v`; signature `2` at `ℝ`; `0` everywhere; `W(ℂ) = ℤ/2` is seen by the dimension modulo two at any finite place | holds | none |
| 8.4: corollary [headline] | `⟨1,1⟩` vs `⟨2,2⟩` | `(hasseMinkowski_equivalent Q hQ R hR).2 h` elaborates | proved from 6.3 | none |
| 8.4 and Scope: `SO` translation | OrthogonalSpinGroups on main (:49, :965–966) and #1181 (:1497–1501) | both assign it to OrthogonalTamagawaAndLatticeMass; this README assigns it to Orthogonal and Spin Groups | misattributed | R06 |
| Conventions: plain vs signed discriminant | `H`, `⟨1,1⟩` | plain `[−1]` and `[1]`; signed `(−1)^1·d` gives `[1]` and `[−1]` | correct | none |
| Conventions: `i<j` vs `i≤j` | `H` over `ℝ` | `(1,−1) = 1` vs `(1,1)(1,−1)(−1,−1) = −1` | correct | none |
| Conventions: `(−1,3)` | `ℚ₃`, `ℚ₂`, `ℝ` | `−1`, `(−1)^(ε(−1)ε(3)) = −1`, `1` | exactly two places | none |
| Conventions: regularity name | `#check @QuadraticForm.Nondegenerate` | "Unknown constant"; `QuadraticMap.Nondegenerate` is at `Radical.lean:115` | wrong name | R05 |
| Contract: first-inequality counterexample | `ℚ(∛2, ζ₃)/ℚ` | degree `6`; `Gal = S₃` with abelianization `C₂`, so the norm index is `2 < 6` | correct | none |
| Supplier pin | 16 names and 12 paths at `358314d`/`f6090c7` vs `2fd255d`/`1b1ccf4` | 0 present vs all present; merge with main has 1 conflict; with `-X ours` the folder equals this head and the manifest equals main's | absent at the branch pin | R01 |

## Not verifiable

- **O'Meara, *Introduction to Quadratic Forms*.** The manifest settles it as `uncertified` (paywalled), so I checked these locators only for the mathematics stated at them, not against the text:
  - 58:7 (contracts :282);
  - 65:15 (4.2);
  - 66:1 (5.5);
  - 66:3 (6.1, 6.2);
  - 66:4 (6.3);
  - 66:5 (8.1);
  - 72:1 (7.2, 7.3);
  - 71:19 and 71:19a (References only).
- **Serre, *A Course in Arithmetic*.** Also `uncertified`. I did not check Ch. IV §2.1 (Conventions :104) against the text, nor the References' Ch. III §1.2, III §2.2 and IV §3.2.
- **Elaboration at main's pins** (`2fd255d`, `1b1ccf4`, `v4.36.0-rc2`). This review may run Lean only in this worktree, at its own pins. Instead I checked by reading the source at main's pin:
  - the five imported modules exist there;
  - every name `Suggested.lean` uses exists there;
  - `WittRing.baseChange` has the same binders;
  - the diffs of the five imported modules between the pins add declarations and imports and change no signature this file uses.

## Source issues

- **Misprint** in milne-cft at VIII, proof of Theorem 3.5(b), p. 237: the source says the cases n = 3, 4 follow from Proposition 3.7(c, d) and Theorem 1.1; it should be Theorem 3.1, the Hasse norm theorem those propositions reduce to; affects the proof.
- **Misprint** in milne-cft at VIII, proof of Theorem 3.5(b), p. 237: the source calls the induction hypothesis Theorem 3.1b; it should be Theorem 3.5(b); affects nothing.
- **Gap** in milne-cft at VIII, proof of Theorem 3.5(b), p. 237: the source does not ensure that the common values c_v, and c when S is empty, are nonzero, so cY² − r may be degenerate; it should choose them nonzero, possible because the represented nonzero values form a nonempty open set; affects the proof.
- **Misprint** in milne-cft at VIII, proof of Theorem 6.3, p. 252: the source names the complements q₁ and q₂ after introducing q₁ and q₁′; it should read q₁ and q₁′ throughout; affects nothing.
