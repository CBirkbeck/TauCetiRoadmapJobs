# Review of RootSystemsPartII (pull request #1731 at bdea2b9)

**Verdict:** needs changes

This is an incremental re-review of the 2 lines changed since 799ac1d. The change itself, `def foldedIndices` → `noncomputable def foldedIndices`, is correct and necessary. The head also merges main, and that merge changes two things the README depends on:

- The Tau Ceti pin moves from 358314d4 to 2fd255d9 (Mathlib f6090c70 → 1b1ccf4b; toolchain v4.35.0-rc3 → v4.36.0-rc2).
- The RootSystems revision that adds its Layers 4–6 arrives on main at 4bf4f654.

The new RootSystems §6.1 owns the component decomposition that §3.3 here still states as its own target (R01). The new Tau Ceti pin moves one supplier file (R02). The merge creates both findings; neither comes from the folder diff.

## R01 (P2) — §3.3 restates the component decomposition that RootSystems §6.1 on main now owns

**Location.** `TauCetiRoadmap/RootSystemsPartII/README.md`:

- line 13: "The decomposition of a finite based root pairing into irreducible components, on which the component cycles of §3.3 rest, is a target of §3.3: no roadmap states it".
- line 7: "(its Layers 1–3)".
- line 57: "RootSystems stops at its Layer 3 … none of its targets is an input here … the decomposition into irreducible components is §3.3's own target".
- line 69: "decomposes a based system into its irreducible components".
- line 243: "First prove the decomposition …".
- the API bullets at lines 247–251 and the *Needs:* line at 278.

**Claim.** These passages were true against main at 799ac1d. They are false at this head:

- RootSystems on main now has Layers 4–6.
- Its §6.1 states the same decomposition under the same hypotheses: a finite reduced crystallographic spanning real pairing and base.
- Its Scope assigns that object to RootSystems.

The decomposition therefore now has two owners, and RootSystems is planned again here. The previous review recorded this as the expected edit once that revision merged ("§3.3's statement becomes a citation of RootSystems §6.1 … an edit of whichever pull request merges second"). This pull request is merging second.

**Witness.** `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md` on main (bebc607):

- §6.1, lines 1037–1060, proves:
  - the internal direct sum, with each root in exactly one component;
  - irreducible restricted pairings;
  - transport by every root-pairing equivalence;
  - orthogonality under every positive-definite invariant form;
  - with the locators Milne C.23 and C.55 (lines 25102 and 25585).
- Lines 39–42 of its Scope: "owned here; … the component cycles of RootSystemsPartII §3.3, consume it".

**Repair.**

1. **§3.3.** Replace the decomposition target in the first paragraph, and API bullets 1, 2 and 5, with a citation of RootSystems §6.1. Note that `RootPairing.RootForm` is one of its positive-definite invariant forms, positive definite by `RootPairing.posRootForm_rootFormIn_posDef`.
2. **What stays in §3.3.** Keep here only what §6.1 does not state:
   - the restricted base of support K, with Cartan matrix the K-block, and the root-form restriction "with no factor";
   - σ's induced component permutation, which is its index permutation on simple indices;
   - a power of σ fixing a component restricts to a based automorphism of that component's pairing.
3. **Dependencies.** Add "RootSystems §6.1" to §3.3's *Needs:* and to Layer 3's Dependencies.
4. **Other passages.**
   - Line 7: drop "stops at … (its Layers 1–3)".
   - Line 13: replace the last sentence with "is RootSystems §6.1, consumed in §3.3".
   - Line 57: say that §6.1 is consumed and the remaining layers are not.
   - Line 69: change "decomposes" to "applies RootSystems §6.1's decomposition".

**Tested.** On A₁ ⊕ A₁ with the component swap σ, the cited §6.1 gives components {1} and {2}, with blocks {±α₁} and {±α₂}. The equivalence σ: P ≃ P carries this partition to {{2},{1}}, and RootForm(α₁, α₂) = 0. These are the values the cycle paragraph at line 261 consumes. The direction is downward: RootSystems is on main and lists this roadmap only as a consumer (its line 60: "None of these is an input here").

## R02 (P3) — the Tau Ceti base-change declarations are cited in a file that no longer exists at the pin

**Location.** `TauCetiRoadmap/RootSystemsPartII/README.md` line 53: "`TauCeti.isReduced_rootPairingBaseChange`, in `TauCeti/LinearAlgebra/RootSystem/BaseChange.lean`, supply the real base change of that dot-product datum".

**Claim.** At the pinned Tau Ceti 2fd255d9 the path does not exist. The merge's pin bump moved the file.

**Witness.**

- `git ls-tree 2fd255d9 TauCeti/LinearAlgebra/RootSystem/` has a directory `BaseChange/` holding `Basic.lean` and `Pi.lean`, and no `BaseChange.lean`.
- `Environment.getModuleIdxFor?` puts all six declarations in `TauCeti.LinearAlgebra.RootSystem.BaseChange.Pi`, for example `def rootPairingBaseChange` at `BaseChange/Pi.lean` line 127.
- The old and new files differ only by one docstring hunk.

**Repair.** Replace the path by `TauCeti/LinearAlgebra/RootSystem/BaseChange/Pi.lean`.

**Tested.** All six names elaborate with `#check` and report that module. Their statements are unchanged: `isReduced_rootPairingBaseChange` still needs only `[FaithfulSMul R S] [IsDomain S] [P.IsReduced]`, which ℤ → ℝ satisfies.

## Previous findings

- none: the report at 799ac1d raised no finding. Its account of the round-2 finding ("owning the decomposition here, against main, is the repair") was correct against the main it read. RootSystems §6.1 has since merged, and R01 above is the follow-up that review anticipated.

## Verified sound

### Gate, dependency check and elaboration

**The gate.** Rerun on this head:

    gate RootSystemsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

The worker's gate at this head reports `build=0` as well.

**The dependency check.**

    depcheck: 238 roadmaps, 2322 edges, 0 problem(s)

There is no UPWARD or CYCLE line. `git diff --stat origin/main...HEAD` outside the folder is empty: the many files outside the folder that changed since 799ac1d all arrive with the merge from main.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/RootSystemsPartII/Suggested.lean` at the new pins took 9.6 s and gave 10 warnings, all `declaration uses sorry` (lines 35, 95, 113, 125, 142, 154, 168, 182, 204, 230), and 0 errors.

### The changed line

- **The old form fails.** A scratch copy with the old `def foldedIndices` fails on the new toolchain at 59:4 with `lean.dependsOnNoncomputable` ("depends on 'orbitSum', which is 'noncomputable'"). The change is the minimal repair and changes no type or value.
- **Signatures.** The `#check @name` output for all 15 declarations, in one scratch file at the new pins, is identical to the worker's elaborated list after normalising universe names. No section binder is lost. `foldedIndices` is still `P.Aut → Set M` and still occurs as the index type of `OrbitSumRealization.pairing`.
- **One-tactic probe.** Each `sorry` was replaced by `first | simp | rfl | infer_instance | aesop | decide`. All 10 theorems fail (errors at lines 42, 106, 119, 136, 147, 162, 176, 197, 224, 251), so there is no padding at the new pins.
- **Ownership.** `roadmaps grep foldedIndices` finds the name only in this folder (README lines 128 and 145, `Suggested.lean` lines 59 and 68). The overlaps listing reports no open pull request changing this roadmap and no dropped id.

### Library contracts at the moved pins

- **Names.** All 73 library names the README backticks were checked:
  - 67 were elaborated by `#check` in one scratch file (Mathlib plus the 18 cited Tau Ceti modules).
  - The defining module of each of the 68 names in that list was printed with `getModuleIdxFor?`.
  - The three `TauCeti.DynkinType.eq_one_of_cartanMatrix_{B2,G2,F4}` were read at `SpecialNodePermutations.lean` lines 248, 259 and 273, in `namespace TauCeti.DynkinType`; that module has no build at the pin.
- **Paths.** Every cited path resolves to the stated file except the R02 file. That covers the 14 Mathlib paths, all present, and the 17 other Tau Ceti paths.
- **Statements unchanged.** `git diff` of the cited Tau Ceti files (358314d4..2fd255d9) and Mathlib files (f6090c70..1b1ccf4b) removes no line of a cited statement; the removals are docstrings, proofs and uncited lemmas. Values read at the pins:
  - `TauCeti.posRootCone := AddSubmonoid.closure (P.root '' b.support)` (`Positive.lean` line 319).
  - `RootPairing.dominantChamber := {x | ∀ i ∈ b.support, 0 ≤ P.coroot' i x}` (`Chamber.lean` line 141).
  - `RootPairing.isIrreducible_of_connected_diagramGraph_cartanMatrix`, now at `FiniteType/Irreducible.lean` line 179 (it was line 255), with `[Field K] [CharZero K] [P.IsCrystallographic] [P.IsRootSystem]`.
  - `TauCeti.diagramGraph_adj`: `Adj i j ↔ i ≠ j ∧ A i j ≠ 0 ∧ A j i ≠ 0`.
  - `RootPairing.pairing_eq_zero_iff`: `[NeZero 2] [IsDomain R] [Module.IsTorsionFree R M]`.
  - `Module.Dual.eq_of_preReflection_mapsTo`: `[CharZero R] [IsDomain R] [Module.IsTorsionFree R M]`.
  - `RootPairing.Base.IsPos.induction_on_reflect`: `[CharZero R] [Finite ι] [IsDomain R] [P.IsCrystallographic] [P.IsReduced]`.
  - The `IsBalanced` instance is in `section Field` of `Finite/Nondegenerate.lean` with `[Fintype ι]` (lines 63, 284, 322), as the README says.

### Cross-roadmap citations, against main bebc607

- ReductiveGroups §9A.1b: line 1290, unchanged.
- ReductiveGroupsPartII §RG2.1.4: heading at line 2137, with the topic *Minuscule coweights and the dominance order* at line 2421.
- ReductiveGroupsPartII §RG2.4.3: heading at line 5992, with the topic *Dominant inertia-coinvariant cocharacters* at line 5994.
- ReductiveGroupsPartII Layer RG2.4: line 5509. Its only README change since 799ac1d is the `AlgHom.mapValue` renaming.
- LieHighestWeight Layer 6: line 773.
- RootSystems: the Layer 1–3 titles cited at lines 7 and 57 still match lines 428, 614 and 685. Its new §§4.1–4.3, 5.1–5.3 and 6.2 were read for overlap; only §6.1 duplicates a target here (R01).

### Sources

- §2.1, the seeded target the changed line belongs to: Stem08 line 24 (p. 1) partitions the index set into σ-orbit blocks and sums each block's simple roots once. This supports the "distinct, each once" definition.
- §3.3, touched by R01: Milne17 line 25102 (C.23, printed p. 612) and line 25585 (Proposition C.55, printed p. 625, running head at line 25580) were re-read. They are the same locators RootSystems §6.1 uses.
- The other 11 sampled targets lie outside the changed passages; the previous reports' readings carry forward.

### Remark on untouched text (no change requested)

The RootSystems downstream list (its line 1164) says this roadmap consumes RootSystems §2.1 and §§5.1–5.2. This README (line 57) uses neither: it uses simple generation of the Weyl group and an explicit based hypothesis on σ. That is a statement in RootSystems' text and no edge is missing here.

### Adversarial table

Rows 1–33 are carried from the previous report, PRREVIEW-RootSystemsPartII~3. That report carried rows 1–25 from ~2 and ~1 and computed rows 26–33 for §3.3. Their statements and Lean are unchanged, and the carriers they use are unchanged at the new pins (row 35). Rows 34–38 are new.

| # | Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1–33 | §§1.1–4.4, conventions, §3.3 component paragraph | as in the previous reports | as in the previous reports (e.g. A₂ entries −1, −1; RootForm(α₁, α₂) = −6 and RootForm(α₁, α₁) = 12; A₁ ⊕ A₁ RootForm(α₁, α₂) = 0; 3-cycle factor c = 3 giving 24 = 3·8) | unchanged | none |
| 34 | `foldedIndices` = `Set.range (orbitSum P σ)`, now `noncomputable` | A₂ reversal; identity on A₂; ι = ∅; A₄ reversal | A₂ reversal: 6 indices, 4 orbits, images ±(α₁+α₂), size 2. Identity: 6 singletons, 6 distinct roots, 0 ∉. ∅ gives ∅. A₄ reversal: positive orbits {α₂₃}, {α₁₄}, {α₁,α₄}, {α₂,α₃}, {α₁₂,α₃₄}, {α₁₃,α₂₄} with sums α₂+α₃, f₁, α₁+α₄, α₂+α₃, f₁, α₁+2α₂+2α₃+α₄. That is 6 positive orbits (12 in all) and 4 distinct positive vectors (8 in all); f₁ has a singleton lift and a two-member lift, and 2f₁ is absent. Type `P.Aut → Set M` with and without `noncomputable`. | agrees with Checks at lines 135–137 | none |
| 35 | headline carriers at the new pins | PGL₂ check; A₁ chamber | `posRootCone` is the closure of simple roots: in ℤ with coroot 2, 2 ∈ Q⁺ and 1 ∉ Q⁺. `dominantChamber` A₁: x dominant ⟺ ⟨x, α∨⟩ ≥ 0, so walls included. Definitions are byte-identical to 358314d4. | unchanged | none |
| 36 | connected-diagram irreducibility at the new pin | A₁ ⊕ A₁; A₂; B₂ | A₁ ⊕ A₁: entries 0, 0, graph disconnected, hypothesis fails. A₂: −1, −1, connected, irreducible. B₂: −2, −1, connected. Hypotheses `[Field K] [CharZero K]`, crystallographic root system, as line 53 says. | as cited | none |
| 37 | §3.3 decomposition against RootSystems §6.1 | A₂; A₁ ⊕ A₁; empty; A₁ swap | §3.3: one component with a 6-root block; {1}, {2} with α₁+α₂ in neither block; no components; swap exchanges components. §6.1: one 2-dimensional component containing (1,1); two 1-dimensional components with (1,1) not a root; dimension 0; any equivalence carries the partition. Same hypotheses and same Milne lines 25102 and 25585. | two owners | R01 |
| 38 | Tau Ceti base-change contract | `isReduced_rootPairingBaseChange` along ℤ → ℝ | `FaithfulSMul ℤ ℝ` ✓, `IsDomain ℝ` ✓. Module `…BaseChange.Pi`; `BaseChange.lean` is absent at 2fd255d9. | statement holds, path stale | R02 |

## Not verifiable

- none. Every text consulted was read: Stem08 and Milne17 in the cache, RootSystems, ReductiveGroups, ReductiveGroupsPartII and LieHighestWeight on main, and both libraries at the pins and at the previous pins.

## Source issues

- none
