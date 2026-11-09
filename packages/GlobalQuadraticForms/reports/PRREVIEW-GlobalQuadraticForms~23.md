# Review of GlobalQuadraticForms (pull request #1200 at a6625dc)

**Verdict:** needs changes

This is an incremental re-review of the 70 lines of `TauCetiRoadmap/GlobalQuadraticForms/` that changed between `40494aa` (read by r17) and `a6625dc`. R03 and R04 of r17 are repaired, and neither repair introduces a new defect. R01 and R02 are not repaired and are restated below. No passage changed by the diff has a new defect.

## R01 (P1) — The branch still pins Tau Ceti `358314d`, where 17 cited declarations and 12 cited files do not exist, and it does not merge with main

Re-raised: R01 (repair report GATE~2, "Which pin").

**Location.** `TauCetiRoadmap/GlobalQuadraticForms/README.md:143–144`: "There is no roadmap supplier. Every input below is a declaration of Mathlib or Tau Ceti at the pins." Since this head, the sentence also covers the new Scope citation of `TauCeti.NonabelianH1` at README:86–87, which the R04 repair added.

**Claim.** Every cited input exists at this branch's pins.

**Witness.** `lake-manifest.json` pins Tau Ceti `358314d` and Mathlib `f6090c7`. Main pins `2fd255d` and `1b1ccf4`. `TauCeti.NonabelianH1` and `WittRing.globalToLocal` occur in no file at `358314d`. At `2fd255d` they are at `Nonabelian/Basic.lean:190` and `WittLocalization.lean:167`.

**Full list.** I grepped both library trees this round.
- Tau Ceti declarations absent at `358314d` and present at `2fd255d`. There are 17: the 16 listed in r17 (they are still absent) and `TauCeti.NonabelianH1`.
- Cited files absent at the branch pins. There are 12:
  - Tau Ceti `NumberTheory/QuadraticForm/Global/{DefiniteObstruction, Hyperbolicity, PrescribedLocalForms, SignPrescription, WittLocalization, ProductFormula, Existence, WorkedExamples/Sqrt5}.lean`;
  - Tau Ceti `NumberTheory/ClassFieldTheory/Global/{HasseNorm/Quadratic, IdeleClass/FirstInequality}.lean`;
  - Tau Ceti `RepresentationTheory/Homological/ContCohomology/Nonabelian/Basic.lean` (new, README:87);
  - Mathlib `RingTheory/DedekindDomain/AdicValuation/Completion.lean` (README:172).
- Merge state:
  - `origin/main` (`1bea835`) is not an ancestor of the head, whose merge base with main is `fa41b37`.
  - `git merge-tree --write-tree HEAD origin/main` reports one content conflict, in this folder's `Suggested.lean`.
  - Since `fa41b37`, main has changed this folder in a single commit (`a891cd19`, the pin bump), by one line inside a declaration that this head deletes.

**Why the reason fails.** The repair report says the job may not touch `lake-manifest.json`. The repair needs no manifest edit:
- `git diff --stat origin/main...HEAD -- lake-manifest.json lean-toolchain` is empty.
- The merged tree's manifest is main's, byte for byte (see "Tested").

What blocks the merge is a content conflict inside this folder, and only this pull request can resolve it. If the repair job may not merge main, the pull request's author or an operator must do it.

**Repair.**
1. Merge `origin/main` into the branch.
2. Resolve the single conflict in `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` by keeping this branch's file.
3. Rerun the gate and its targeted build, now at main's pins.

**Tested.** `git merge-tree --write-tree -X ours HEAD origin/main` gives tree `62b0890`:
- it differs from `origin/main` only in this folder's `README.md` and `Suggested.lean`;
- its copy of this folder is byte-identical to this head's;
- its `lake-manifest.json` and `lean-toolchain` are main's.

Between the pins, the five Tau Ceti modules that `Suggested.lean` imports change only by additions (r17; those modules are the same at both pins as they were then). So no statement changes meaning after the merge. At main's pin every name in the new Scope bullet resolves: `TauCeti.NonabelianH1` is the quotient of continuous `1`-cocycles (`Nonabelian/Basic.lean:186–191`).

## R02 (P3) — #1215 carries a different copy of this folder, the two heads conflict, neither description states an order, and this description does not describe this head

**Location.** The pull request's description: "Fix rank-four discriminant sign comparison … The update incorporates current main and retains its `Completed.NumberFieldArithmetic.Suggested` import."

**Claim.**
- This pull request can merge independently of #1215.
- Its description describes this head.

**Witness.** `git merge-tree --write-tree HEAD 8f8c72c` (the head of #1215; merge base `fa41b37`) reports content conflicts in this folder's `README.md` and `Suggested.lean`. The copies differ by `+220/−106` lines. This head's `Suggested.lean` imports no roadmap module, and main is not an ancestor of it.

**What differs.**
- This head adopted #1215's wording for 5.1, 5.5 and the Scope bullet (the R03 and R04 repairs).
- #1215 has since moved from `c408926` to `8f8c72c`. Its commit `f62eba23` rewrites 4.1, the *Needs* lines of 6.2–8.3 and the gloss on `comap_embedding_of_isReal`.
- #1215 still drops `equivalent_of_locallyEquivalent` (8.4) from `Suggested.lean`, states 8.3 on `TauCeti.WittRing.globalToLocal` and imports `WittLocalization`.

**Repair.**
1. Choose one order and state it in both descriptions:
   - either #1215 merges first, and this pull request then keeps in this folder only what #1215's copy lacks (closing it if nothing remains);
   - or this pull request merges first (after R01), and #1215 drops its copy of this folder and re-applies only its differences.
2. Rewrite this description to describe this head:
   - both files rebuilt on Tau Ceti carriers;
   - nine declarations and no roadmap import;
   - Layers 0–3 and 4.4 resolved by the section map at README:53–75.

**Tested.** I reproduced the conflict from the two heads alone. Nothing in this folder's text is at issue in this finding.

## Previous findings

- R01 — not repaired: "There is no roadmap supplier. Every input below is a declaration of Mathlib or Tau Ceti at the pins." The manifest still pins `358314d`/`f6090c7`, and main `1bea835` is not an ancestor. Restated as R01.
- R02 — not repaired: the description still says it "incorporates current main and retains its `Completed.NumberFieldArithmetic.Suggested` import". #1215 is now at `8f8c72c` and still conflicts in both files. Restated as R02.
- R03 — repaired: "So run the induction on these forms, which are regular (`TauCeti.nondegenerate_presentedForm`), and carry the result to a form on any `V` through `TauCeti.exists_presentedForm_equivalent`" (README:605–609). The *Needs* lines of 5.1 (:581–583) and 5.5 (:621–626) name all five inputs.
- R04 — repaired: "nonabelian cohomology and the localization kernel of `H¹(K, SO(Q))`: this roadmap defines no `H¹`. The pointed set `H¹(G, A)` of continuous cocycles is Tau Ceti's `TauCeti.NonabelianH1`" (README:85–90). The citation resolves at main's pin only, which is recorded under R01.

## Verified sound

**Gate and dependency check.**
- My rerun of the gate printed every check at 0, ending `source-material=0 OK`. The worker's line adds `build=0`, and my elaboration agrees.
- The three-dot diff outside the folder is empty.
- The dependency check printed exactly `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. There is no roadmap supplier and no `gap:` contract.

**Lean at the branch pins.**
- `lake env lean` on `Suggested.lean` exits 0. The only warnings are 8 `sorry` warnings, at lines 51, 68, 76, 84, 93, 111, 120 and 147. Line 147 was line 146 before: the 8.4 docstring gained a line.
- I put `#check @name` for all 9 declarations in one scratch file. The elaborated types are identical to r17's and to the signature listing:
  - `K : Type u_1`;
  - `V` and `W` sit in independent universes;
  - `hQ` and `hR` are `QuadraticMap.Nondegenerate`;
  - 8.3 carries `[Invertible 2]`;
  - no binder is lost.

  The diff changes no Lean type, only the 8.4 docstring.
- One-tactic probe on a copy of the file: each `sorry` was replaced by `first | rfl | simp | infer_instance | aesop | decide`. That gave 8 errors at the 8 sites, so none of the 8 sorried theorems closes.
- The repaired routes, elaborated in a scratch file at the branch pins with no errors:
  1. **5.5 transport.** For `K : Type` and `V : Type 1`, a statement on every `presentedForm p` gives `¬ Q.Anisotropic` for a regular, locally isotropic `Q` on `V`. The proof uses `exists_presentedForm_equivalent`, `QuadraticMap.Equivalent.anisotropic_iff` and `QuadraticForm.QuadraticMap.Equivalent.isLocallyIsotropic_iff`.
  2. **5.5 induction step.** For `5 ≤ n`, `p.1 = n` and the case `n - 1` on presented forms, `not_anisotropic_of_isLocallyIsotropic_of_five_le_finrank` applies to `presentedForm p` with `nondegenerate_presentedForm p`. The rank side condition `finrank K (Fin p.1 → K) = p.1` closes by `simp`.
  3. **5.1 quaternary.** A ternary theorem for every `L : Type u` and every `X` discharges `hternary` through `nondegenerate_presentedForm`, with `Invertible 2` from `invertibleOfNonzero two_ne_zero`.

**Library declarations opened** (Tau Ceti at `358314d` unless noted; paths under `TauCeti/`).
- `LinearAlgebra/QuadraticForm/RegularFormClass/Basic.lean`:
  - `:105` `presentedForm p : QuadraticForm K (Fin p.1 → K)`;
  - `:139` `nondegenerate_presentedForm [Invertible (2 : K)]`;
  - `:641` `exists_presentedForm_equivalent`, giving `Q.Equivalent (presentedForm p)` under `[Invertible (2 : K)]` (`:637`);
  - all three in `namespace TauCeti`.

  This matches README:309–313.
- `LinearAlgebra/QuadraticForm/Representation.lean:123`: `QuadraticMap.Equivalent.anisotropic_iff`, over any commutative semiring, in `namespace QuadraticMap`. This matches README:287.
- `NumberTheory/QuadraticForm/Global/Predicates.lean:277`: `QuadraticForm.QuadraticMap.Equivalent.isLocallyIsotropic_iff`. This matches README:211.
- `NumberTheory/QuadraticForm/Global/Quaternary.lean:137–141`: `hternary` quantifies over `L : Type u`, the universe of `K`, on `presentedForm p` with `p.1 = 3`. This matches README:305–307 and :567–570.
- `NumberTheory/QuadraticForm/Global/HigherRank.lean:87–91`: `ih` is stated on `presentedForm p` over `K` with `p.1 + 1 = finrank K X`. This matches README:308–309 and :602–605.
- `RepresentationTheory/Homological/ContCohomology/Nonabelian/Basic.lean` (main's pin `2fd255d` only):
  - `:68–72`: `G` and `A` are topological groups with `[MulDistribMulAction G A]`;
  - `:75–79`: `Cocycle` requires `continuous_toFun`;
  - `:186–191`: `NonabelianH1` is the quotient of continuous `1`-cocycles, a pointed set.

  This matches README:86–87.

**Cross-roadmap citations resolved** (the changed passages).
- Orthogonal and Spin Groups on main, `Completed/OrthogonalSpinGroups/README.md`:
  - `:925` names the successor `OrthogonalTamagawaAndLatticeMass`;
  - `:947` imports `GlobalQuadraticForms.hasseMinkowski_equivalent`;
  - `:965–966` makes the pointed-set translation the successor's work, since this supplier defines no `H¹(K, SO(Q))`.

  This matches Scope (README:88–90), 8.4 (:921–924) and Downstream consumers (:961–964). "And so of its corollary 8.4" is this README's own inference, which 8.4's *Needs:* 6.3 supports.
- Orthogonal Tamagawa and Lattice Mass at its head `e35529e` still never mentions `H¹` or `hasseMinkowski_equivalent`. The README says only that the work is assigned there, not that it is planned there, so this is not a finding here. It is not a supplier edge either: no *Needs:* line cites it, and the dependency check is clean.
- Integral Lattices on main still cites `equivalent_of_locallyEquivalent` (`TauCetiRoadmap/IntegralLattices/README.md:477`, `:916`, `:1028`). This is why r17 kept the declaration.

**Sources, for the changed sections, against milne-cft.** Printed page = page marker − 9.
- Theorem 3.1 (line 10629–10631, p. 234): the Hasse norm theorem.
- Theorem 3.5 (line 10686–10689, p. 235).
- Proposition 3.7(b), (c) (line 10698–10702, p. 236).
- Proof of 3.5(b), `n = 2` through 3.7 and Theorem 1.1 (line 10772–10776, p. 237).
- Theorem 6.3 (line 11619–11621, p. 252), the 8.4 locator.

Each supports 5.1, 5.5 and 8.4 as written. The rest of the seeded sample (4.1–4.3, 6.1–6.3, 7.2–7.4, 8.1–8.3) is untouched text, verified in r17.

**Adversarial table.** The rows for changed statements were computed this round. Rows marked "r17" carry r17's values for untouched statements.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Scope / 8.4: `H¹(K, SO(Q))` ↔ twists of equal discriminant | `Q = ⟨1,1⟩` over `ℚ`, twists `⟨a,a⟩` | reflection in `(1,0)` has `det = −1`, so `H¹(SO) → H¹(O)` is injective; `H¹(ℚ, SO(Q)) ≅ ℚ*/N(ℚ(i)*)`, `a ↦ ⟨a,a⟩` (`det = a² ∈ [1]`) | identification correct | none |
| Scope / 8.4: localization kernel trivial via 8.4 | `a = 2, 3, −1` | `2 = 1²+1²`, `⟨2,2⟩ ≅ ⟨1,1⟩` by `(x+y, x−y)`: trivial; `a = 3`: `(3,3)₃ = (3,−1)₃ = −1 ≠ (1,1)₃ = 1`, not in kernel; `a = −1`: negative definite at `ℝ`, not in kernel | kernel `{1}`, as 8.4 gives | none |
| Contract: `QuadraticMap.Equivalent.anisotropic_iff` | `⟨1,1⟩ ≅ ⟨2,2⟩`; `H ≅ ⟨2,−2⟩` | anisotropic T/T (positive definite); F/F (`(1,1) ↦ 0`) | gloss correct | none |
| Contract: `…Equivalent.isLocallyIsotropic_iff` | same pairs | locally isotropic F/F (fails at `ℝ`); T/T | gloss correct | none |
| 5.1 quaternary paragraph | `⟨1,1,1,−3⟩`, `⟨1,1,1,−7⟩` over `ℚ`; `hternary` binder | `1+1+1−3 = 0`: T/T; `7w²` with `w` scaled odd `≡ 7 (mod 8)` is not a sum of three squares, `−7 ≡ 1 (8)` makes it `⟨1,1,1,1⟩` over `ℚ₂`, anisotropic: F/F; `disc = [−7]`, so `L = ℚ(√−7) : Type`, the universe of `ℚ` | `hternary` discharged (Lean probe 3) | none |
| 5.5 route (universe) | `K = ℚ : Type`, `V = ULift.{1} (Fin 5 → ℚ)`, `Q = ⟨1,1,1,1,−1⟩` | `p = ⟨5, ![1,1,1,1,−1]⟩`; `ih` needs rank 4 on `Fin 4 → ℚ : Type`, supplied by induction on presented forms; `Q(1,0,0,0,1) = 0`: T/T; `⟨1,1,1,1,1⟩`: F/F at `ℝ` | route complete (Lean probes 1, 2) | none |
| 5.5 induction junk values | `n = 5`; ranks 0, 1 | `n − 1 = 4 ≥ 0`, no truncation (`5 ≤ n`); ranks 0 and 1 are not locally isotropic, so vacuous | correct | none |
| 8.4 Lean docstring | `Suggested.lean:132` | type unchanged; body `(hasseMinkowski_equivalent Q hQ R hR).2 h` elaborates | correct | none |
| Downstream consumers | OSG `:925`, `:947`, `:965–966` | imports 6.3 by name; translation is the successor's | matches | none |
| Supplier pin (R01) | manifest vs main | `358314d`/`f6090c7` vs `2fd255d`/`1b1ccf4`; 17 names, 12 files absent; 1 conflict | not repaired | R01 |
| #1215 overlap (R02) | heads `a6625dc` vs `8f8c72c` | 2 conflicting files; `+220/−106` | not repaired | R02 |
| Conventions: discriminants (r17) | `H`, `⟨1,1⟩` | plain `[−1]`, signed `[1]`; plain `[1]`, signed `[−1]` | correct | none |
| Conventions: `i<j` vs `i≤j` (r17) | `H` over `ℝ` | `1` vs `1·1·(−1) = −1` | differ, as stated | none |
| Conventions: zero form (r17) | rank 0 | record `(0,[1],1,0)`, fails `1 ≤ n` | realized, not admissible | none |
| 4.1 transport (r17) | conjugation on `ℚ(i)`; `ℚ(√5)` | `2+i ≡ 4` mod `2−i`; indices `3`, `1` | correct | none |
| 4.2 [headline] (r17) | `a = 4, −1, 2, −4`; `16` for `n = 8` | square; nonsquare at `p ≡ 3 (4)`; at `p ≡ ±3 (8)`; as `−1`; `16` not an 8th power in `ℚ₂` | true; `n = 8` analogue false | none |
| 4.2 contract (r17) | `ℚ(∛2, ζ₃)/ℚ` | degree `6`, norm index `2` | cyclic hypothesis needed | none |
| 4.3 (r17) | `d = −1`, `a = 5, 3, −1`; `d = 2`, `a = −1` | T/T; F/F (`ℚ₃`); F/F (`ℝ`); T/T | agree | none |
| 5.1 binary and ternary (r17) | `⟨1,1⟩`; `⟨1,1,−2⟩`, `⟨1,1,−3⟩`, `⟨1,1,1⟩` | isotropic over `ℚ(i)`; T/T; F/F (`ℚ₃`); `−1` at `ℝ`, `ℚ₂` only | correct | none |
| 5.5 [headline] (r17) | rank 0, 1; `H`; `⟨1,1,−3⟩`; `⟨1,1,1,1,1⟩`; `⟨1,0⟩` | F/F; F/F; T/T; F/F; F/F; T/T | holds | none |
| 5.5 split (r17) | `U = ⟨1,1⟩`, `W = ⟨1,−1,1⟩` | `x = 0 ⇒ b = 0`, singular; `x = (1,0) ⇒ b = 1`, `W(0,1,0) = −1` | correct | none |
| 6.1 [headline] (r17) | `⟨1,1⟩`, `a = 3, −1`; `H`; zero form; `a = 0` | F/F; F/F; T/T; F/F; excluded by `ha` | holds | none |
| 6.2 [headline] (r17) | `⟨3⟩ → H`; `⟨3⟩ → ⟨1,1⟩`; rank 2 into rank 1 | `(2,−1) ↦ 3`; F/F (`ℚ₃`); F/F | holds | none |
| 6.3 [headline] (r17) | `H` vs `⟨2,−2⟩`; `⟨1⟩` vs `⟨−1⟩`; `⟨1,1,−3⟩` vs `⟨1,1,−1⟩` | T/T; F/F (`ℝ`); F/F (`ℚ₃`) | holds | none |
| 7.2 (r17) | `⟨−1,−1,−1⟩`; rank 3, `s₂ = −1`, `R = ⟨1,1,1⟩` | product `1`; product `−1` fails | correct | none |
| 7.3 [headline] (r17) | `⟨1⟩`; zero form; rank 1 and rank 2 (`d = [−1]`), `T = {3,5}` | admissible; not; not; not | correct | none |
| 7.4 convention (r17) | `⟨3⟩` over `ℚ₃` | `−1` vs `1`, factor `(−1,3)₃ = −1` | as stated | none |
| 8.1 [headline] (r17) | `⟨1,1,−1⟩` vs `⟨1,2,−2⟩`; `⟨1,1⟩` vs `⟨2,2⟩`; zero forms | equal records; isometric; equal | holds | none |
| 8.2 (r17) | `⟨1,−1,2,−2⟩`; `⟨1,1⟩`; odd rank | `≅ 2H`; `d ≠ [−1]`; rank `≠ 2m` | correct | none |
| 8.3 [headline] (r17) | `[⟨1,1⟩]`, `[H]`, `[⟨1⟩]`; `ℚ(i)` | signature `2`; `0`; odd; `[⟨1,1⟩] = 0` over `ℚ(i)` | holds | none |
| `ℚ(√5)` example (r17) | record `(3,[1], −1 at (2), 3, 1)` | `(−1)·1·(−1) = 1` | admissible | none |

**Headline theorems.** The README's headlines are 4.2, 5.5, 6.1, 6.2, 6.3, 7.3, 8.1, 8.3 and 8.4. All nine are stated in `Suggested.lean`. The diff adds and removes none.

**Remarks on untouched text** (r17 passed this text; not findings, no change requested).
- README:190–191 glosses `comap_embedding_of_isReal` as "the pulled-back real embedding is the composite". At the pin (`Ramification.lean:90–91`) the lemma equates complex embeddings `K →+* ℂ`, under a reality hypothesis.
- Conventions (README:96–98) and the contracts (:151–152) say that seven Type-only inputs reach every universe through 4.1. Four of them appear in no *Needs:* line, only in the section map and the contracts: `hilbertSymbol_productFormula`, `globalInvariants_hasseProduct_eq_one`, `exists_hilbertSymbol_eq_ite` and `exists_pair_hilbertSymbol_eq_ite`.
- `equivalent_of_locallyEquivalent` is a one-term corollary of 6.3. #1215 deletes it, and this head keeps it for Integral Lattices; settling this is part of R02's choice of order.
- The overlap tool lists "GlobalQuadraticForms Layer 3" (cited by MetaplecticAutomorphicForms) as dropped. The section map at README:64–67 resolves it, unchanged since r17.

**Ownership.** Checked against #1215, Orthogonal Tamagawa and Lattice Mass (`e35529e`) and Orthogonal and Spin Groups on main. The new Scope bullet assigns nothing to this roadmap and claims no `H¹` object.

## Not verifiable

- **O'Meara, *Introduction to Quadratic Forms*** (`omeara`, uncertified): 66:1 (5.5) and 58:7 (the quaternary step) were not read. The changed passages of 5.1 and 5.5 were checked against milne-cft Theorem 3.5(b) and Proposition 3.7 instead, and against the pinned Tau Ceti statements.
- **Serre, *A Course in Arithmetic*** (`serre`, uncertified): not needed for the changed passages.
- **Elaboration at main's pins.** The brief allows Lean only in this worktree. That `TauCeti.NonabelianH1` resolves after the R01 merge rests on reading its declaration at `2fd255d`.

## Source issues

- **Misprint** in milne-cft at VIII, proof of Theorem 3.5(b), p. 237: the source says ranks 3 and 4 follow from Proposition 3.7(c), (d) and Theorem 1.1; it should be Theorem 3.1, the Hasse norm theorem, since 3.7(c), (d) reduce to norms from quadratic extensions; affects the proof.
