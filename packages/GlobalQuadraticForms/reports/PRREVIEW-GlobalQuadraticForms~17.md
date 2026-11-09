# Review of GlobalQuadraticForms (pull request #1200 at 40494aa)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/GlobalQuadraticForms/` at `40494aa10828a28812bb127ca8a1e234cb98f09f`. The head is the one the previous review (r15) read, with 0 changed lines. Both of its findings stand, re-checked against today's `origin/main` (`01daf25`) and the current head of #1215 (`c408926`). The full pass found two new P3 findings (R03, R04). Both are in passages that #1215's copy of this folder has already repaired.

## R01 (P1) — The branch pins Tau Ceti `358314d`, where 16 cited declarations and 11 cited files do not exist, and it does not merge with main

Re-raised: R01 (repair report GATE~2, "Which pin").

**Location.** `TauCetiRoadmap/GlobalQuadraticForms/README.md:140–141`: "There is no roadmap supplier. Every input below is a declaration of Mathlib or Tau Ceti at the pins." The contracts at :154–335 and the *Needs:* lines of 4.2, 4.3, 7.2, 7.3, 8.2 and 8.3 rest on this sentence.

**Claim.** Every cited input exists at this branch's pins.

**Witness.** `lake-manifest.json` pins Tau Ceti `358314d` and Mathlib `f6090c7`. At those pins `finrank_le_index_range_ideleClassNormMap`, `WittRing.globalToLocal` and `hilbertSymbol_productFormula` occur in no file. At main's `2fd255d` they are at `FirstInequality.lean:108`, `WittLocalization.lean:167` and `ProductFormula.lean:67`.

**Full list, checked by grep of both library trees.**
- Tau Ceti declarations absent at `358314d` and present at `2fd255d`:
  - `IsLocalRealization.exists_locallyRepresents_prod`, `isAdmissible_ofLocalForms`, `isLocalRealization_ofLocalForms`;
  - `exists_discr_eq_equivalent_of_isRepresentedBy_prod`, `globalInvariants_hasseProduct_eq_one`, `isAdmissible_globalInvariants`;
  - `locally_formClass_eq_nsmul_hyperbolicClass_iff`, `exists_sq_sub_mul_sq_iff_forall_completion`, `finrank_le_index_range_ideleClassNormMap`;
  - `Sqrt5.exists_admissible_rank_three`, `exists_anisotropic_and_not_anisotropic_away_from_realPlace`;
  - `exists_hilbertSymbol_eq_ite`, `exists_pair_hilbertSymbol_eq_ite`, `WittRing.globalToLocal`, `WittRing.globalToLocal_eq_zero_iff`, `hilbertSymbol_productFormula`.
- Cited files absent at the branch pins:
  - Tau Ceti `NumberTheory/QuadraticForm/Global/{DefiniteObstruction, Hyperbolicity, PrescribedLocalForms, SignPrescription, WittLocalization, ProductFormula, Existence, WorkedExamples/Sqrt5}.lean`;
  - Tau Ceti `NumberTheory/ClassFieldTheory/Global/{HasseNorm/Quadratic, IdeleClass/FirstInequality}.lean`;
  - Mathlib `RingTheory/DedekindDomain/AdicValuation/Completion.lean` (README:169; `f6090c7` has `AdicValuation.lean` only).
- Merge state: `origin/main` is not an ancestor of the head (merge base `fa41b37`). `git merge-tree --write-tree HEAD origin/main` reports one content conflict, in this folder's `Suggested.lean`.

**Why the reason fails.** The repair report says the job may not touch `lake-manifest.json`. The repair does not author a manifest change:
- `git diff --stat origin/main...HEAD -- lake-manifest.json lean-toolchain` is empty, and it stays empty after a merge of main.
- The merged tree's manifest is byte-identical to main's (tested below).

What blocks the merge is a content conflict inside this folder, and only this pull request can resolve it. Main's whole change to the folder since the merge base is one line of `#1800`'s pin bump, at main's `Suggested.lean:488`, inside `hilbertSymbol_one`, a declaration this head deletes. If the repair job may not merge main, the finding needs the pull request's author or an operator. The manifest rule does not settle it.

**Repair.**
1. Merge `origin/main` into the branch.
2. Resolve the single conflict in `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` by keeping this branch's file.
3. Rerun the gate and its targeted build, now at main's pins.

**Tested.** `git merge-tree --write-tree -X ours HEAD origin/main` gives tree `64edbac`:
- it differs from `origin/main` only in this folder's `README.md` and `Suggested.lean`;
- its copy of this folder is byte-identical to this head's;
- its `lake-manifest.json` is main's.

The five Tau Ceti modules `Suggested.lean` imports change between the pins only by additions:
- `Predicates.lean`: identical;
- `Invariants.lean`: one import line;
- `FormInvariants.lean`: two proof steps;
- `Localization.lean` and `Witt/BaseChange.lean`: new lemmas only.

So no statement in `Suggested.lean` changes meaning after the merge.

## R02 (P3) — #1215 carries a different copy of this folder, the two heads conflict, and neither description states which merges first

**Location.** The pull request's description. It names no order with #1215. It describes the change as "the rank-four plain/signed discriminant comparison", and says the branch "retains its `Completed.NumberFieldArithmetic.Suggested` import".

**Claim.** This pull request can merge independently of #1215, and its description describes this head.

**Witness.** `git merge-tree --write-tree HEAD c408926` (the head of #1215; merge base `fa41b37`, also this branch's) reports content conflicts in this folder's `README.md` and `Suggested.lean`. The two copies differ by 74 insertions and 60 deletions. Neither head contains the other.

The copies differ in content:
- #1215 states 8.3 on `TauCeti.WittRing.globalToLocal`;
- #1215 deletes the Lean declaration `equivalent_of_locallyEquivalent` (8.4);
- #1215 carries the repairs of R03 and R04 below.

At this head `Suggested.lean:3–8` imports Mathlib and five Tau Ceti modules and no roadmap module.

**Repair.**
1. Choose one order and state it in both descriptions:
   - either #1215 merges first and this pull request then keeps in this folder only what #1215's copy lacks (closing it if nothing remains);
   - or this pull request merges first (after R01) and #1215 drops its copy of this folder and re-applies only its differences.
2. Rewrite this pull request's description to describe this head:
   - both files rebuilt on Tau Ceti carriers;
   - nine declarations and no roadmap import;
   - Layers 0–3 and 4.4 resolved by the section map at README:53–75.

**Tested.** The conflict is reproduced from the two heads alone. Nothing in this folder's text is at issue in this finding.

## R03 (P3) — The routes of 5.1 (quaternary) and 5.5 do not say how Tau Ceti's lower-rank hypotheses, stated on `presentedForm p` in the universe of `K`, are discharged

**Location.** `README.md:589–590`: "rank `n ≥ 5` follows by strong induction from `QuadraticForm.not_anisotropic_of_isLocallyIsotropic_of_five_le_finrank`". The same gap is in the *Needs:* lines at :569–570 (quaternary item of 5.1) and :602–604 (5.5).

**Claim.** The ternary case and the induction hypothesis of 5.5 feed the Tau Ceti quaternary and higher-rank theorems directly.

**Witness.** In `TauCeti/NumberTheory/QuadraticForm/Global/HigherRank.lean:87–91`, `ih` covers only `presentedForm p : QuadraticForm K (Fin p.1 → K)`, which lives in `K`'s universe. `hasseMinkowski_isotropic` takes `V : Type v` (`Suggested.lean:64`). So when `v ≠ u`, induction on the rank of `V` gives no hypothesis about `presentedForm p`.

The quaternary theorem's `hternary` (`Quaternary.lean:137–141`) is likewise stated for `presentedForm p` with `p.1 = 3` over `L : Type u`. Applying 5.1's ternary case to it needs these forms to be regular (`TauCeti.nondegenerate_presentedForm`), which no *Needs:* line names. The contracts mention it only in a parenthetical at :303–305.

**Repair.**
1. In 5.5, after "strong induction from …", add: "run the induction on the forms `TauCeti.presentedForm p` over `K`, which are regular by `TauCeti.nondegenerate_presentedForm`. Carry the result to a form on any `V` through `TauCeti.exists_presentedForm_equivalent`; isometry preserves anisotropy (`QuadraticMap.Equivalent.anisotropic_iff`) and local isotropy (`QuadraticForm.QuadraticMap.Equivalent.isLocallyIsotropic_iff`)."
2. Add these five names to 5.5's *Needs:*.
3. Add `TauCeti.presentedForm` and `TauCeti.nondegenerate_presentedForm` to the quaternary item of 5.1's *Needs:*.

#1215's copy has exactly this text (its README:606–613, :584–587, :625–630). Adopting it verbatim also shrinks R02's conflict.

**Tested.** All five names exist at both pins:
- `RegularFormClass/Basic.lean:139` and `:641` at `358314d`, `:145` and `:656` at `2fd255d`;
- `Representation.lean:123` and `:140`;
- `Predicates.lean:277` at both pins.

On `K = ℚ` and `V = ULift.{1} (Fin 5 → ℚ)` with `Q = ⟨1, 1, 1, 1, -1⟩`:
- the higher-rank step asks for rank 4 on `presentedForm p` over `Fin 4 → ℚ : Type`;
- the repaired route proves exactly that, in `Type`, and reaches `Q` through `exists_presentedForm_equivalent` (`Q ≅ presentedForm ⟨5, ![1, 1, 1, 1, -1]⟩`).

## R04 (P3) — Scope assigns generic nonabelian cohomology and torsors to Orthogonal Tamagawa and Lattice Mass

**Location.** `README.md:85–87`: "nonabelian cohomology, `H¹(K, SO(Q))`, torsors and Tate–Shafarevich sets: Orthogonal Tamagawa and Lattice Mass, to which Orthogonal and Spin Groups … assigns the translation of 6.3".

**Claim.** Orthogonal Tamagawa and Lattice Mass owns nonabelian cohomology and torsors.

**Witness.**
- At main's Tau Ceti pin `2fd255d`, `TauCeti.NonabelianH1` (continuous cocycles) is native, at `RepresentationTheory/Homological/ContCohomology/Nonabelian/Basic.lean:190`.
- Torsors under a sheaf of groups are native as well (`CategoryTheory/Sites/NonabelianCohomology/Torsor.lean`).
- Orthogonal Tamagawa and Lattice Mass's README at its head `e35529e` never mentions nonabelian cohomology, `H¹` or torsors.

**Repair.** Replace the bullet with #1215's wording (its README:84–90), which is valid at main's pin, where R01 puts the branch:
- keep for Orthogonal Tamagawa and Lattice Mass only the localization kernel of `H¹(K, SO(Q))` and Tate–Shafarevich sets, with the assignment by Orthogonal and Spin Groups;
- state that the pointed set `H¹(G, A)` is Tau Ceti's `TauCeti.NonabelianH1` (`RepresentationTheory/Homological/ContCohomology/Nonabelian/Basic.lean`).

**Tested.** A case-insensitive grep of the head's README (686 lines) for `nonabelian`, `cohomolog`, `torsor`, `H¹`, `Hasse–Minkowski` and `GlobalQuadraticForms` finds one line, `:11`. That line uses "cohomological defect" for central isogenies. The assignment itself rests on Orthogonal and Spin Groups on main, `Completed/OrthogonalSpinGroups/README.md:963–966`, which this README cites correctly.

## Previous findings

- **R01 (r15)**, "The branch still pins Tau Ceti `358314d`, where 16 cited declarations do not exist, and it does not merge with main": not repaired.
  - The head is unchanged and the manifest still pins `358314d` and `f6090c7`.
  - `origin/main` (now `01daf25`) is not an ancestor, and the merge conflict is the same one.
  - Re-raised as R01.
- **R02 (r15)**, "#1215 changes this folder differently, the two heads conflict, and the description neither states an order nor describes this head": not repaired.
  - The description is the same.
  - #1215 moved from `47ea9559` to `c408926` and still conflicts in both files.
  - Restated as R02.

## Verified sound

**Gate and dependencies.**
- My rerun of the gate at this head printed every text scanner and the dependency check at 0, ending `source-material=0 OK`. Its line has no `build` field; the worker's line adds `build=0`, and my own elaboration below agrees.
- The three-dot diff outside the folder is empty.
- The dependency check printed exactly `depcheck: 237 roadmaps, 2310 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- There is no roadmap supplier and no `gap:` contract.

**Lean at the branch pins.**
- `lake env lean` on `Suggested.lean` exits 0. The only warnings are 8 `sorry` warnings, at lines 51, 68, 76, 84, 93, 111, 120 and 146.
- `#check @name` for all 9 declarations in one scratch file: every elaborated type matches its README statement.
  - `K : Type u_1`, and `V`, `W` sit in independent universes.
  - `hQ`, `hR` are `QuadraticMap.Nondegenerate`, and `ha : a ≠ 0` appears in 6.1.
  - 8.3 carries `[Invertible 2]`.
  - No binder is lost.
- One-tactic probes on a copy of the file: `first | rfl | simp | infer_instance | aesop | decide | (constructor <;> simp)`, and separately `exact?`. Each failed on all 8 sorried theorems (8 errors each, at the 8 `sorry` sites).
- `equivalent_of_locallyEquivalent` (8.4) is one term from 6.3. It stays because main's Integral Lattices README cites it by name (`TauCetiRoadmap/IntegralLattices/README.md:477`, `:916`), so deleting it would drop an id another roadmap cites. Main's Integral Lattices `Suggested.lean` no longer imports this module (0 grep hits).

**Library declarations opened** (Tau Ceti at `2fd255d` unless noted; paths under `TauCeti/`).
- 4.2 and 4.3 inputs:
  - `FirstInequality.lean:103–109`: `K L : Type`, `[IsGalois K L] [IsCyclic Gal(L/K)]`, `finrank K L ≤ (ideleClassNormMap K L).range.index`. This matches README:271–273 and :359–361.
  - `HasseNorm/Quadratic.lean:45–55`: `K : Type`, `hd : ¬ IsSquare d`, `a : Kˣ`, finite places through `adicCompletion` and every infinite place through `w.Completion`. This matches 4.3, including the complex discharge at :502–503.
  - `Approximation/SquareClass.lean:40–47`: `K : Type*`, finitely many finite and real places, `x / a_v` and `x / b_w` squares. This matches README:251–256 and step 3 of 4.2.
  - `Ideles/Norm/Range.lean:115–124`: a norm at every finite and every infinite coordinate from `K_v ⊗[K] L`. This is step 4 of 4.2.
- 7.2 and 7.3 inputs:
  - `LocalRealization.lean:309`, `:331`: `1 ≤ n`, discriminants equal to the image of `d` at finite and real places, finite support, and product with `(-1)^(q choose 2)` equal to 1. These are exactly 7.2's hypotheses.
  - `PrescribedLocalForms.lean:69` (`K : Type`) and `:140–150`: this matches README:313–315.
  - `ProductFormula.lean:105–121` (`K : Type`): `isAdmissible_globalInvariants (hn : 1 ≤ finrank)` is the reverse direction of 7.3.
- 8.2 and 8.3 inputs:
  - `Hyperbolicity.lean:116–131`: rank `2m`, discriminant `m • [-1]`, finite sign `(-1,-1)^(m choose 2)`, positive index `m`. This is the input of 8.2's route.
  - `WittLocalization.lean:93`, `:167`: `globalToLocal` is `(pi baseChange).prod (pi atRealPlace)` and `atRealPlace` is `baseChange` along `embedding_of_isReal`. So `Suggested.lean:146–152` states injectivity of this map. `:40` says injectivity is not proved there.
- 5.1 and 5.5 inputs: `Quaternary.lean:137–141` and `HigherRank.lean:87–91` (R03).
- Worked examples:
  - `DefiniteObstruction.lean`: `4 ≤ n`, rank `n + 1` (the 5.5 Check).
  - `Invariants.lean:267`, `:287`: the rank-one and rank-two exceptions, with trivial discriminant and `[-1]`, positive index 1 (the 7.3 Checks).
  - `WorkedExamples/Sqrt5.lean:178`.
- Definitions behind the Checks:
  - `Predicates.lean:51`, `:66`, `:85`, `:147` are identical at both pins and match the Conventions.
  - `Representation.lean:46` defines `Represents Q a := ∃ v, Q v = a`, so `a = 0` is represented by the zero vector, as 6.1 says.
- **Universe audit.** Of the cited Tau Ceti theorems, exactly the eight listed at README:141–148 sit under `variable {K : Type}`. The others are universe-polymorphic:
  - `LocalRealization.lean:97`, `Existence.lean:64` and `HigherRank.lean:53` use `Type*`;
  - `Classification.lean:81`, `Hyperbolicity.lean:89`, `Quaternary.lean:67` and `FormInvariants.lean:71` use `Type u`.

  So the list of eight is complete.
- **Mathlib contracts**, at both pins:
  - `IdeleGroup` and `IdeleClassGroup` (`AdeleRing.lean:91`, `:117` and `:104`, `:130`);
  - `RingOfIntegers.mapRingEquiv` (`NumberField/Basic.lean:192`, `:193`);
  - `HeightOneSpectrum.equivOfRingEquiv` (`Ideal/Lemmas.lean:592`);
  - `InfinitePlace.comap_embedding_of_isReal` (`Ramification.lean:90`);
  - `Completion.ringEquivRealOfIsReal` (`Completion/InfinitePlace.lean:330`, `:336`);
  - every other Mathlib name in the README: present once at both pins.

**Cross-roadmap citations resolved.**
- Orthogonal and Spin Groups on main, `Completed/OrthogonalSpinGroups/README.md`:
  - `:925–966` names Orthogonal Tamagawa and Lattice Mass as the successor;
  - `:945–947` imports `GlobalQuadraticForms.hasseMinkowski_equivalent`;
  - `:963–966` gives the pointed-set translation to the successor.

  This matches README:85–87, :899–902 and :939–941.
- README:942, "Orthogonal and Spin Groups consumes 4.3 and 6.1": true at the open revision's head (`Completed/OrthogonalSpinGroups/README.md:82–83`, `:319–320`, `:349`); on main that roadmap names only 6.3. This is a downstream remark, not a supplier citation, so no change is needed.
- Classical Arithmetic Completion on main (`README.md:165`, `:783`, `:793`) cites "Global Quadratic Forms 4.4". The section map at README:68–75 resolves it.
- MetaplecticAutomorphicForms cites "GlobalQuadraticForms Layer 3", which README:64–67 resolves.
- `roadmaps grep` over main and all open heads finds this roadmap cited as Layers 3–7, §4.2, §4.3, §4.4, §5.5, §6.1 and §6.3. Every one exists here or is mapped.
- Ownership against open pull requests:
  - checked against #1215, Orthogonal Tamagawa and Lattice Mass (`e35529e`), Orthogonal and Spin Groups (#1181), Quadratic Form Invariants Part II (#1834) and the Quadratic Form Invariants revisions;
  - no other roadmap claims Hasse–Minkowski, 72:1 or Witt injectivity over number fields.

  Observation for Orthogonal Tamagawa and Lattice Mass's own review: its head does not yet plan the `H¹(K, SO(Q))` translation that Orthogonal and Spin Groups assigns to it.

**Sources (seeded sample), against milne-cft.** Printed page = page marker − 9; for example, line 10411 reads "229" just before marker 239.
- Theorem 1.1 (line 10384–10386, p. 229): a number field containing the `n`-th roots of 1; local `n`-th power almost everywhere implies global. For `n = 2` this is 4.2.
- Exercise 1.3 (line 10397–10398, p. 229) is 4.2's eighth-power Check.
- Theorem 3.1 (line 10629–10631, p. 234) is the Hasse norm theorem for cyclic `L/K`, used by 4.3 and 5.1.
- Theorem 3.5 (line 10686–10689, p. 235) is 5.5's reverse direction.
- Corollary 3.6 (line 10694–10695, p. 236) is 6.1.
- Proposition 3.7(b), (c) (line 10700–10702, p. 236) is 5.1.
- The proof of 3.5(b) (line 10772–10776, p. 237) does `n = 2` through 3.7 and Theorem 1.1, as 5.1 says.
- Proposition 6.2 (line 11574–11575, p. 251) is Witt cancellation (8.2).
- Theorem 6.3 (line 11619–11621, p. 252) is isometry everywhere locally implying globally, used by 7.4, 8.2, 8.3 and 8.4.
- Remark 6.6 (line 11677–11691) confirms Serre's product over `i < j` and `S = ε · (-1, d)`, which is 7.4's convention factor.
- Theorem 6.10 and Proposition 6.11 (line 11745–11763, p. 255): one local class in rank 1 and in rank 2 with `d = -1`, as 7.2 says.
- Page 256 (line 11781–11785): `d` and `S` determine `t` for `r ≤ 3` only, as 7.2 says.
- Each supports the statement as written.

**Adversarial table.** All values were computed this round.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Conventions: discriminants | `H`, `⟨1, 1⟩` | `H`: plain `[-1]`, signed `(-1)^1·[-1] = [1]`; `⟨1,1⟩`: plain `[1]`, signed `[-1]` | Check correct | none |
| Conventions: `i<j` vs `i≤j` | `H` over `ℝ` | `(1,-1) = 1`; `(1,1)(1,-1)(-1,-1) = 1·1·(-1) = -1` | differ, as stated | none |
| Conventions: `(-1, 3)` | `ℚ₃`, `ℚ₂`, `ℝ`, `p ≥ 5` | `(-1/3) = -1`; `ε(-1)ε(3) = 1 ⇒ -1`; `3 > 0 ⇒ 1`; units `⇒ 1` | product `1` | none |
| Conventions: zero form | rank 0 | record `(0, [1], 1, 0)`; regular (radical `⊥`); fails `1 ≤ n` | realized, not admissible | none |
| 4.1 transport | `σ` = conjugation on `ℚ(i)` | mod `2 - i`: `i ≡ 2`, `2 + i ≡ 4 = 2²` (square in `ℚ₅`); valuation of `2 + i` at `(2 + i)` is 1; `σ(2 + i) = 2 - i ≡ 4` mod `2 + i` | places must follow `σ` | none |
| 4.1 transport | `ℚ(√5)`, `⟨1, θ, θ⟩` | `θ ↦ 1.618`: `p = 3`; `θ ↦ -0.618`: `p = 1` | indices `3`, `1` | none |
| 4.2 [headline] | `a = 4`; `-1`; `2`; `-4`; `16` (8th powers) | `4 = 2²`; `-1` nonsquare at `p ≡ 3 (4)`; `2` at `p ≡ ±3 (8)`; `-4` square in `ℚ_p` iff `-1` is; `x⁸ - 16 = (x²-2)(x²+2)((x+1)²+1)((x-1)²+1)`, `16 = 2⁴` not an 8th power in `ℚ₂` | true; analogue for `n = 8` false at `{2}` | none |
| 4.2 contract | `ℚ(∛2, ζ₃)/ℚ` | degree `6`; norm index = degree of max abelian subextension `ℚ(ζ₃)` = `2` | `6 ≤ 2` false: cyclic hypothesis needed | none |
| 4.3 | `d = -1`, `a = 5, 3, -1`; `d = 2`, `a = -1` | `5 = 1 + 4` T/T; `(-1,3)₃ = -1` F/F; `-1 = x² + y²` fails at `ℝ` F/F; `1 - 2 = -1` T/T | both sides agree | none |
| 5.1 binary | `⟨1,1⟩` over `ℚ(i)` and `ℚ` | `ℚ(i)`: `-1 = i²`, `1 + i² = 0`; `ℚ`: anisotropic at `ℚ₃` | correct | none |
| 5.1 ternary | `⟨1,1,-2⟩`, `⟨1,1,-3⟩`, `⟨1,1,1⟩` | `d = -1, a = 2 = 1+1` T/T; `(-1,3)₃ = -1` F/F; `(-1,-1)_v = -1` at `ℝ`, `ℚ₂` only (even count) | correct | none |
| 5.1 quaternary *Needs* | `hternary` binder | `∀ L : Type u, p.1 = 3`, on `presentedForm p`; regularity needs `nondegenerate_presentedForm` | input missing from *Needs* | R03 |
| 5.5 [headline] | rank 0, 1; `H`; `⟨1,1,-3⟩`; `⟨1,1,1,1,1⟩`; `⟨1, 0⟩` | F/F; F/F; T/T; F/F (`ℚ₃`); F/F (`ℝ`); T/T (radical vector) | holds | none |
| 5.5 route | `K = ℚ : Type`, `V : Type 1`, rank 5 | `ih` asks rank 4 on `Fin 4 → ℚ : Type`; induction on `V : Type 1` gives `Type 1` forms only | route incomplete | R03 |
| 5.5 split | `U = ⟨1,1⟩`, `W = ⟨1,-1,1⟩` | `x = 0 ⇒ b = 0`, `⟨0⟩ ⊥ W` singular; `x = (1,0) ⇒ b = 1`, `W(0,1,0) = -1` | correct | none |
| 6.1 [headline] | `⟨1,1⟩`, `a = 3, -1`; `H`; zero form; `a = 0` | F/F (`ℚ₃`); F/F (`ℝ`, `ℚ₂`); T/T; F/F; `a = 0`: T/T (excluded by `ha`) | holds | none |
| 6.2 [headline] | `⟨c⟩ → H`, `c = 3`; `⟨3⟩ → ⟨1,1⟩`; rank 2 into rank 1 | `(2, -1)`: `4 - 1 = 3`; F/F at `ℚ₃`; F/F by rank | holds | none |
| 6.3 [headline] | `H` vs `⟨2,-2⟩`; `⟨1⟩` vs `⟨-1⟩`; `⟨1,1,-3⟩` vs `⟨1,1,-1⟩` | T/T; F/F (`ℝ`); `d = [3]` vs `[-1]`, F/F (`ℚ₃`) | holds | none |
| 7.2 | `⟨-1,-1,-1⟩`; rank 3, `s₂ = -1`, `R = ⟨1,1,1⟩`; Milne 6.12 convention | `s₂ = (-1)³ = -1`, real `(-1)^3 = -1`, product `1`; product `(-1)·1 = -1` fails; `S_v = s_v (-1, d)_v`, `∏_v (-1, d)_v = 1` | correct, matches Milne 6.12 | none |
| 7.3 [headline] | `⟨1⟩`; zero form; rank 1 with `T = {3, 5}`; rank 2, `d = [-1]`, `T = {3, 5}` | admissible; rank `0` not admissible; product `1`, not admissible; real `q = 1`, sign `1`, product `1`, not admissible | correct | none |
| 7.4 convention factor | `⟨3⟩` over `ℚ₃` | `i ≤ j`: `(3,3)₃ = (3,-1)₃ = -1`; `i < j`: `1`; factor `(-1,3)₃ = -1` | as stated | none |
| 8.1 [headline] | `⟨1,1,-1⟩` vs `⟨1,2,-2⟩`; `⟨1,1⟩` vs `⟨2,2⟩`; zero forms | `d = [-1] = [-4]`, `(2,-2) = 1`, `p = 2`; `(2,2)₂ = (2,-1)₂ = 1`, `(x+y)² + (x-y)² = 2x² + 2y²`; `(0,[1],1,0)` both | holds | none |
| 8.2 | `⟨1,-1,2,-2⟩`; `⟨1,1⟩`; odd rank | `≅ 2H`; `d = [1] ≠ 1•[-1]`; rank `≠ 2m` | correct | none |
| 8.3 [headline] | `[⟨1,1⟩]`, `[H]`, `[⟨1⟩]` over `ℚ`; `ℚ(i)` (no real place) | signature `2`; `0`; odd dimension; `[⟨1,1⟩] = [H] = 0` over `ℚ(i)` | holds | none |
| 8.4 [headline] | `Suggested.lean:138` | `(hasseMinkowski_equivalent Q hQ R hR).2 h` elaborates | from 6.3 | none |
| Rank-four real classes | `d = [1]`, rank 4 | `q ∈ {0, 2, 4}`: signs `1, -1, 1` | 3 classes, 2 signs | none |
| `ℚ(√5)` worked example | record `(3, [1], s = -1 at (2), p = 3, 1)` | real signs `1`, `(-1)^1 = -1`; product `(-1)·1·(-1) = 1`; `(θ, -1)₂ = -1` by reciprocity | admissible | none |
| Supplier pin (R01) | manifest vs main | `358314d`/`f6090c7` vs `2fd255d`/`1b1ccf4`; 16 names, 11 files absent; 1 conflict | unchanged | R01 |
| #1215 overlap (R02) | heads `40494aa` vs `c408926` | 2 conflicting files; `+74/-60` | unchanged | R02 |
| Scope ownership (R04) | `TauCeti.NonabelianH1`; OTLM head | native at `2fd255d`; 0 mentions of nonabelian cohomology or torsors | misattributed | R04 |

**Headline theorems.** The README's headlines are 4.2, 5.5, 6.1, 6.2, 6.3, 7.3, 8.1, 8.3 and 8.4, and all nine are stated in `Suggested.lean`. 8.2 is covered by 8.3: its Witt-class form is the injectivity. None of the headlines is native at either pin. I grepped both trees for the local–global statements, and `WittLocalization.lean:40` says injectivity is not proved.

## Not verifiable

- **O'Meara, *Introduction to Quadratic Forms*** (`omeara`, uncertified): 58:7, 65:15, 66:1, 66:3, 66:4, 66:5, 71:19, 71:19a and 72:1 were not read. For the sampled targets whose only locator is O'Meara, I verified the statement against milne-cft instead:
  - 5.5: Theorem 3.5(b);
  - 6.1: Corollary 3.6;
  - 6.3: Theorem 6.3;
  - 7.2 and 7.3: Theorem 6.12 (line 11792–11796, p. 256), through the convention conversion in the table;
  - 8.1: Theorem 6.3 with Theorem 6.10.

  6.2 (66:3, representation of forms) has no open locator, so it was checked by computation only.
- **Serre, *A Course in Arithmetic*** (`serre`, uncertified): the `i < j` convention of Ch. IV, §2.1 was cross-checked through Milne's Remark 6.6.
- **Elaboration at main's pins.** The brief allows Lean only in this worktree. The post-merge claim of R01 rests on the diff of the five imported modules, quoted there.

## Source issues

- **Misprint** in milne-cft at VIII, proof of Theorem 3.5(b), p. 237: the source says ranks 3 and 4 follow from Proposition 3.7(c), (d) and Theorem 1.1; it should be Theorem 3.1, the Hasse norm theorem, since 3.7(c), (d) reduce to norms from quadratic extensions; affects the proof.
- **Misprint** in milne-cft at VIII, proof of Theorem 3.5(b), p. 237: the source says the induction assumes Theorem 3.1b for `n − 1` variables; it should be Theorem 3.5(b); affects nothing.
- **Misprint** in milne-cft at VIII, proof of Theorem 3.5(b), p. 237: the source says that outside a finite set `S` the form `R` represents 0; it should be `r`, the complement of `aX₁² + bX₂²`; affects nothing.
- **Gap** in milne-cft at VIII, proof of Theorem 3.5(b), p. 237: the source picks `c_v` represented by both summands and `c = a x₁² + b x₂²` near `c_v`, never requiring `c_v` and `c` nonzero, nor treating empty `S`; it should choose them nonzero so that `cY² − r` is nondegenerate; affects the proof.
- **Misprint** in milne-cft at VIII, proof of Theorem 6.3, p. 252: the source writes the complements as `q₁` and `q₁′`, then calls them `q₁` and `q₂` and compares `q₁` with `q₂`; it should read `q₁′` for `q₂` throughout; affects nothing.
