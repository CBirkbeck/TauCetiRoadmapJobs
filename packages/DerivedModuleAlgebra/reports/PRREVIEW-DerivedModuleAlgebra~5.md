# Review of DerivedModuleAlgebra (pull request #1701 at 69e20e7)

**Verdict:** needs changes

This is an incremental re-review of the 35 README lines changed since `063c374`. The gate fails on one statement-hygiene rule, and there are five findings (one P2, four P3). The merge of main since `063c374` also moved the pins in `lake-manifest.json`: Tau Ceti `358314d` → `2fd255d`, Mathlib `f6090c7` → `1b1ccf4`, and a new Lean toolchain. A pin move is a change outside the folder, so it is checked as in a full review. Library claims that held at the old pins and fail at the new ones count as text the change makes wrong. At `2fd255d`, Tau Ceti implements a large part of what the changed passages and `Suggested.lean` still treat as missing. R01–R03 come from that.

## R01 (P2) — The changed tower contract hands to AlgebraicTopology, and keeps in §1.1, what the pinned Tau Ceti already provides

Location: `TauCetiRoadmap/DerivedModuleAlgebra/README.md:18–21`, “has one owner, AlgebraicTopology Stage 6, item 0. Section 1.1 here adds only the localization of that complex-level model on the derived category of strict diagrams and its exact-functor comparison”. The same claim is at line 54 and lines 65–70 (“sole owner”), and at `Suggested.lean:23–26` (“no derived limit … functor on `DerivedCategory (ℕᵒᵖ ⥤ ModuleCat R)` … exists at the pin”).

Claim: the generic theory of countable module towers is owned only by a roadmap. §1.1 constructs the derived-limit functor, its localization comparison and its shift compatibility. None of these is statable at the pin.

Witness: Tau Ceti `2fd255d` has `TauCeti.ModuleTower.derivedLimit : DerivedCategory (ModuleTower R) ⥤ DerivedCategory (ModuleCat R)` (`TauCeti/Algebra/Category/ModuleCat/Tower/DerivedLimit.lean:310`), `derivedLimitFactors : Q ⋙ Rlim ≅ holim ⋙ Q` (:322), its `CommShift ℤ` instance (:329) and `derivedLimitIsoLimComplex` (:394).

Beyond the witness, the rest of the contract is also at the pin. `ModuleTower` (`Tower/Basic.lean:78`, any `[Ring R]`) has `shift` (δ, :160), `lim` (:170) and `limOne` (:174). The six-term sequence is `connecting` with `exact_limMap_connecting` and `exact_connecting_limOneMap` (`Tower/Exact.lean:191, 213, 226`). Mittag–Leffler vanishing is `subsingleton_limOne_of_isMittagLeffler` (`Tower/MittagLeffler.lean:191`). The Milnor sequences are `ComplexTower.limOneToHomology_injective`, `exact_limOneToHomology_homologyToLim` and `homologyToLim_surjective` (`Tower/Milnor/Basic.lean:501, 518, 532`). Cofinal reindexing is `limSubsequenceEquiv` (`Tower/Subsequence.lean:86`), and the shifted cone is `homotopyLimitFunctor` (`Tower/DerivedLimit.lean:122`). The pin does not have the homotopy-square cone maps or the exactness of `derivedLimit`. Both open revisions of AlgebraicTopology already read item 0 this way. The head of #1663 (README:1236) consumes Tau Ceti's tower algebra. The head of #1652 renames the stage to `Layer 6`, and its §6.0 *Restriction towers and homotopy-square maps* (README:1631) keeps only the homotopy-square maps (its supplier contract, README:437–457, lists the same Tau Ceti names). So the id `AlgebraicTopology Stage 6, item 0`, cited as a supplier, is renamed at the head of #1652.

Repair:
1. Add a supplier row `From Tau Ceti module towers` naming the declarations above, with their files. Narrow the AlgebraicTopology row and the subsection at lines 63–70 to the homotopy-square cone maps. Cite that as “AlgebraicTopology Stage 6, item 0 (§6.0 *Restriction towers and homotopy-square maps* in its open revision)”, and name that revision in the merge-order paragraph.
2. In the scope paragraph and in §1.1, keep as this roadmap's own only the exactness of `TauCeti.ModuleTower.derivedLimit` (preservation of distinguished triangles, and the cone comparison for chain maps), plus its intertwining with the Milnor, cofinal and homotopy-square maps.
3. Repoint “AlgebraicTopology Stage 6, item 0 (Milnor sequences)” in the *Needs* lines at 1598, 1679, 1729, 1772, 1798, 1879 and 2004 to Tau Ceti's `TauCeti.ComplexTower` Milnor sequences.
4. In `Suggested.lean`, add `import TauCeti.Algebra.Category.ModuleCat.Tower.DerivedLimit` and state the remaining §1.1 headline:

```lean
/-- **The derived limit is exact** (README 1.1; Stacks, Lemmas 15.89.3–15.89.4, Tags 0CQD, 0CQE). -/
theorem derivedLimit_isTriangulated (R : Type u) [Ring R]
    [HasDerivedCategory.{w} (TauCeti.ModuleTower.{u} R)] [HasDerivedCategory.{w} (ModuleCat.{u} R)] :
    (TauCeti.ModuleTower.derivedLimit R).IsTriangulated := by
  sorry
```

   Reduce the docstring bullet at lines 23–26 to the unbounded derived Hom (§1.1.1).

Test of the repair: the statement elaborates at the pin in a scratch copy, with one `sorry` warning. For `K_n = ℤ` with multiplication-by-`p` transitions, the fibre triangle `Rlim → ∏ℤ → ∏ℤ` gives `H⁰ = 0` and `H¹ = ℤ_p/ℤ`, as §1.1's Check says. The levelwise-split diagram of §1.1's Checks is not distinguished in the derived category of towers, so `IsTriangulated` asserts nothing about it.

## R02 (P3) — `Suggested.lean` restates pinned Tau Ceti results behind private stand-ins

Location: `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean:57–121, 129–133, 139–161`; README:276, 283, 332, 376, 402, 406, 485, 613, 693–694, 741 (for example, “that code is pinned to an earlier Mathlib, so the target stays”).

Claim: these definitions are “the few real-bodied definitions those statements need”, and these theorems are headlines the finished roadmap will prove.

Witness: `PD.augmentation` is `rfl`-equal to Tau Ceti `DividedPowerAlgebra.augmentation` (`TauCeti/RingTheory/DividedPowerAlgebra/Augmentation.lean:74`). One `exact` of `DividedPowerAlgebra.map_algebraMap_inf_augmentationIdeal_eq_mul` closes `PD.map_inf_augmentationIdeal`. One `exact` of `CochainComplex.exists_quasiIso_isKInjective` (with `Exists.imp`) closes `moduleKInjectiveReplacement`.

The full correspondence at Tau Ceti `2fd255d`:

| `Suggested.lean` | Tau Ceti at the pin |
| --- | --- |
| `PD.IsHomogeneous` | `PolynomialLaw.IsHomogeneousOfDegree` (`RingTheory/PolynomialLaw/Homogeneous.lean:73`) |
| `PD.homogeneousPiece` | `DividedPowerAlgebra.homogeneousSubmodule` (`RingTheory/DividedPowerAlgebra/Homogeneous.lean:51`) |
| `PD.robyRepresentability` | `DividedPowerAlgebra.gamma`, `isHomogeneousOfDegree_gamma`, `ground_gamma_apply`, `gamma_toFun_sum_tmul` (`UniversalLaw.lean:101, 112, 152, 123`), `homogeneousLawEquiv` (`Representability.lean:440`) |
| `PD.augmentation`, `PD.augmentationIdeal` | `DividedPowerAlgebra.augmentation`, `augmentationIdeal` (`Augmentation.lean:74, 132`) |
| `PD.augmentationIdeal_eq_span_dp` | `DividedPowerAlgebra.augmentationIdeal_eq_span` (:165; `n ≠ 0` for `0 < n`) |
| `PD.map_inf_augmentationIdeal` | `DividedPowerAlgebra.map_algebraMap_inf_augmentationIdeal_eq_mul` (:242) |
| `moduleKInjectiveReplacement` | `CochainComplex.exists_quasiIso_isKInjective` (`Algebra/Homology/ModuleCat/KInjective.lean:147`) |
| `DerivedDeRham.IsKFlat` | `CochainComplex.IsKFlat` (`Algebra/Homology/Monoidal/KFlat/Basic.lean:89`) |
| `DerivedDeRham.flatModuleFilteredFree` | `TauCeti.flatModuleFilteredFree` (`Algebra/Category/ModuleCat/Flat/FilteredFree.lean:146`) |

The normative README (“Import existing Tau Ceti APIs”) says to prototype against such implementations, not to restate them behind a stand-in.

Repair:
1. Delete the rows above from `Suggested.lean`, and with them the `## Layer 0` section comment.
2. Keep the §0.2 headline, but only for the termwise-flat clause that Tau Ceti's `CochainComplex.exists_quasiIso_isKFlat_moduleCat` (`Algebra/Homology/ModuleCat/KFlat.lean:39`) does not state. Add `import TauCeti.Algebra.Homology.ModuleCat.KFlat` and use `∃ P (f : P ⟶ K), QuasiIso f ∧ P.IsKFlat ∧ ∀ i, Module.Flat R (P.X i)`. This was tested in scratch: it elaborates with one `sorry` warning, and without the last clause it is exactly the library theorem.
3. In the README, replace each “`Suggested.lean` declares `PD.…`” sentence and each backticked deleted name with the Tau Ceti name.
4. At lines 283, 376 and 406, after the AffineCrystalline citation, name the pinned Tau Ceti declaration that formalises the target.
5. List all of these under a `From Tau Ceti` row in Exact supplier contracts.

(At this pin, the grading and the base change that the previous R02 proposed stating are also Tau Ceti theorems: `isInternal_homogeneousSubmodule`, `Grading.lean:133`; `baseChangeEquiv`, `BaseChange.lean:100`.)

## R03 (P3) — The docstring and README say the §S.1 abutment is missing; the pinned Tau Ceti has it

Location: `Suggested.lean:33–34`, “Mathlib's spectral object records the pages, and the abutment filtration and edge maps are targets”; README:789–790, “The abutment and its filtration are part of the statement, since Mathlib's spectral sequence of a spectral object records only the pages.”

Claim: no convergent first-quadrant double-complex spectral sequence with abutment exists at the pins.

Witness: Tau Ceti `2fd255d` has `HomologicalComplex₂.rowFiltrationSpectralSequence` (`TauCeti/Algebra/Homology/SpectralSequence/Bicomplex.lean:410`) for first-quadrant bicomplexes, with `rowFiltrationAbutmentIso` (:476) and `rowFiltrationSpectralSequencePageXIsoEInfty` (:497). Their module docstring states convergence to the homology of the total complex.

Repair: in the docstring bullet, name these declarations as the supplied convergence and abutment. List as missing only what has no carrier at the pin: the identification of the second page with iterated homology, the edge maps and the five-term sequence. If any of these elaborates against `rowFiltrationSpectralSequence`, state it instead. In §S.1, consume the Tau Ceti construction through a `From Tau Ceti` contract, and replace the “records only the pages” reason with what §S.1 adds. Test: for a bicomplex concentrated in row 0, the row filtration has one step and `E¹ = E∞ = H(Tot)`, which is what `rowFiltrationAbutmentIso` records.

## R04 (P3) — The dropped id §1.T.1 has no old → new line

Location: README:18–22, the passage that moves the tower theory out of this roadmap.

Claim: the tower theory now lives elsewhere, and readers are pointed to it.

Witness: main's README:1403 has `### 1.T.1 Towers, lim and lim¹`; this head has no §1.T.1. On main it is cited by AdicSpacesPartIII README:114, 406, 988; PerfectoidSpaces README:46, 62, 576, 3264; EtaleCohomologyFoundations README:43, 961; and EnhancedDerivedSheaves README:152, 490. Open heads cite it too, including StableHomotopyKTheory (#1227 line 86, anchor `#1t1-towers-lim-and-lim¹`).

Repair: add one line to Scope and ownership: “Citations of §1.T.1 (*lim and lim¹ of a tower*, *Mittag-Leffler towers*, *The six-term sequence of lim and lim¹*, *The Milnor sequence for towers of complexes*) resolve to the Tau Ceti tower declarations listed in Exact supplier contracts.” Test: each of the four named targets maps to a declaration listed in R01. The gate's `dropped=0` did not catch this id; the overlap report and the main checkout did.

## R05 (P3) — Gate failure: `letI` in the signature of `flatModuleFilteredFree`

Location: `Suggested.lean:158`, `∃ (J : Type uFlat) (inst : SmallCategory J), letI := inst ∃ (_ : IsFiltered J) …`.

Claim: the file passes the statement-hygiene rule.

Witness: the gate at this head reports `statement-hygiene=1 … FAIL`, with “line 158: P3 `letI` in the signature of theorem `flatModuleFilteredFree`”.

Repair: deleting the theorem under R02 removes the hit. If it is kept, write `∃ (J : Type uFlat) (_ : SmallCategory J) (_ : IsFiltered J) (P : J ⥤ ModuleCat.{uFlat} R) (c : Cocone P), …`. A binder whose type is a class is a local instance, and this form elaborates in a scratch copy at the pin with one `sorry` warning.

## Previous findings

- R01 — repaired: README:392–396 now has one **Checks.** list (“For `M = 0`, every element is scalar … For z=3+dp(2,m)·dp(1,m′) … For a scalar z=algebraMap(r) the remainder is 0”), and so do the other five targets. The repeated bullets at the old lines 319 and 453 are deleted.
- R02 — repaired: `Suggested.lean` is unchanged, which the finding's second branch (“or leave the file as it is”) allowed. At the new pin both results are Tau Ceti theorems, so stating them would now be a restatement (see R02 above).

## Verified sound

**Heads and scope.** The worktree is at `69e20e74084c5c0a7d22d79dca0586efdd4601f7`. `git diff --stat origin/main...HEAD` outside the folder is empty, so the pull request changes only its own folder. The folder diff since `063c374` is the 35 README lines of the change summary; `Suggested.lean` is byte-identical to the previous head. No file in the worktree was changed. The pins at this head are Mathlib `1b1ccf4b088b`, Tau Ceti `2fd255d997f4` and toolchain `v4.36.0-rc2`.

**Gate and elaboration.** I re-ran the gate. Every counter is zero except `statement-hygiene=1` (R05), with `depcheck=0` and `dropped=0`. Dependency check:

```text
depcheck: 238 roadmaps, 2356 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. `lake env lean` on `Suggested.lean` exits 0 with exactly 20 “declaration uses `sorry`” warnings and nothing else. The 35 elaborated signatures in `signatures.md` match the README statements and the previous review's `#check` pass; the file is unchanged, and no binder is lost. One-tactic probe on three scratch copies: replacing every `sorry` by `simp`, by `rfl` or by `infer_instance` gives 20 errors each time. Library `exact` probes close `moduleKInjectiveReplacement` and `PD.map_inf_augmentationIdeal` (R02). For these probes I built the missing Tau Ceti object files (`lake build` of five `TauCeti.*` modules, exit 0).

**Changed passages.** I checked the new AlgebraicTopology contract against main's AlgebraicTopology README:954–996. All nine items it lists are present there: δ, `lim`/`lim¹`, the six-term sequence, Mittag–Leffler vanishing, the cochain and chain Milnor sequences in every degree, the shifted cone, cofinal comparison and homotopy-square maps. Nothing in item 0 uses commutativity, so “any unital ring” is accurate. “Used directly in §§1.1–1.6 and 1.9” matches the *Needs* lines at 1598, 1679, 1729, 1772, 1798, 1879 and 2004. §§1.7–1.8 cite no tower supplier (*Needs* at 1951, 1985). “Through §1.1 in Layer 4” matches the Layer 4 *Needs* lines citing §1.1 (2121, 2176). The six merged **Checks.** lists keep 5, 4, 3, 3, 4, 3, 3, 3 and 3 bullets, every one recomputed below.

**Seeded sample, where it falls in the changed passages** (§§1.2, 1.3 and 1.9 are named by the new contract; §0.2 by R02). §1.2: StacksMA line 12005 (Lemma 15.93.1, 091P), 12049 (091Q), 12061 (091R), 12101 (Definition 15.93.4, 091S) and 12115 (Proposition 15.93.5, 091T), on printed pp. 261–263, as cited. §1.3: StacksMA line 12163 (15.93.10, 091V, p. 264), 12293 (15.93.18, 0920, p. 267: `Rlim(K ⊗^L K_n)` is the left adjoint), 12344 (0G1U) and 12374 (0AAJ), p. 268, as cited. §1.9: BMS19 (published text) line 751 (Theorem 3.1, p. 217), 784 (Remark 3.2, p. 218, hyperdescent open), 888 (Lemma 4.5, p. 221) and 973 (Remark 4.9, p. 223: limit over `A/pⁿ → B/pⁿ`), matching “pp. 215–218, 223”. §0.2: StacksMA line 6709 (Definition 15.60.1, 06XZ, `M ⊗ K` with `M` acyclic, the README's side) and 6781 (Lemma 15.60.10, 06Y4, termwise flat K-flat resolution, the clause R02 keeps).

**Pinned declarations opened** (Tau Ceti `2fd255d` unless marked): `Algebra/Category/ModuleCat/Tower/{Basic,Exact,MittagLeffler,Subsequence,DerivedLimit,KInjective}.lean` and `Tower/Milnor/{Basic,Naturality}.lean` at the lines in R01; `Algebra/Homology/ModuleCat/{KInjective,KFlat}.lean:147, 180, 39`; `Algebra/Homology/Monoidal/KFlat/Basic.lean:89–361`; `Algebra/Category/ModuleCat/Flat/FilteredFree.lean:50–146`; `RingTheory/DividedPowerAlgebra/{Augmentation,Homogeneous,Grading,UniversalLaw,Representability,BaseChange}.lean` at the lines in R02; `RingTheory/PolynomialLaw/Homogeneous.lean:73`; `RingTheory/KoszulComplex/{Basic,Regular}.lean:219, 140`; `RingTheory/MatlisDuality/{FiniteLength,Artinian}.lean`; `Algebra/Homology/DerivedCategory/Perfect.lean:192`; `Algebra/Homology/SpectralSequence/Bicomplex.lean:289–497`; `AlgebraicTopology/SimplicialSet/EilenbergZilber.lean:761`; and Mathlib `1b1ccf4` `RingTheory/PolynomialLaw/Basic.lean` and `RingTheory/DividedPowerAlgebra/Init.lean`. Grep at the pins for derived completeness, complete flatness, derived tensor and Hom on `D(R)`, `Matlis` biduality over complete local rings, and Eilenberg–Zilber for arbitrary simplicial modules finds nothing. So the remaining docstring entries (derived tensor, bisimplicial diagonal, cotangent complex, completion reflector, descent, effectivity) still hold.

**Cross-roadmap citations resolved.** AlgebraicTopology Stage 6, item 0: on main, README:954; at the head of #1663, README:1236 (consumes `TauCeti.ModuleTower`); at the head of #1652, renamed `Layer 6`, §6.0 at README:1631 (R01). The §1.T.1 citations on main are listed in R04. `overlaps.md` reports no other open pull request changing this roadmap. Its dropped-id list (§1.T.1) is R04. Its vocabulary neighbours (DerivedDeRhamCohomology, PrismaticCohomology, CrystallineCohomology and EnhancedDerivedSheaves) were not re-read: this diff changes no object they share. The 28 “found nowhere” leads in `citations.md` are this file's own declarations (all declared; `readme-ids-missing=0`) and the AffineCrystalline names that the previous review verified. Every `*Needs:*` line that the changed passage names was read, and none cites a roadmap later in the merge order. No gap is declared (no `design/plan.json`).

**Remarks on untouched text (no change requested in this review):**
- `Suggested.lean:195` declares `local instance moduleDerived : HasDerivedCategory.{u+1} (ModuleCat.{u} R)`. The statement-hygiene rule text excludes local `HasDerivedCategory` instances, but the scanner did not flag it.
- At the pinned Tau Ceti, the README's §0.K.1 Koszul targets (`TauCeti.koszulComplex`, `exactAt_of_isWeaklyRegular`), the §0.DP.2 grading and base change, the finite-length Matlis inputs of §1.M.2 and the simplicial-set Eilenberg–Zilber equivalence are implemented, as `STATUS.md` records.
- The merged Checks lists keep a blank line after their first bullet, which is cosmetic.
- The pull-request description says “README only; `Suggested.lean` is unchanged”, but against main the folder diff changes `Suggested.lean` by 1471 lines.

**Adversarial table.** The first 21 rows are new: they cover the changed statements and the targets of the findings. The 76 rows after them are carried forward unchanged from the previous report (PRREVIEW-DerivedModuleAlgebra~4, “Adversarial table”), for statements this diff leaves untouched.

| Statement | Instances | Values on each side; excluded wrong model | Result | Source |
| --- | --- | --- | --- | --- |
| Changed contract: AlgebraicTopology item 0 contents | main AlgebraicTopology README:954–996 | `δ(x)_n = x_n − f_n(x_(n+1))`; `lim = ker δ`, `lim¹ = coker δ`; six-term; ML and surjective vanishing; `0→lim¹H^(k−1)→H^k(lim)→limH^k→0` for every `k`; shifted cone; cofinal; homotopy squares | All nine present on main | this review |
| The same contract against the pin | Tau Ceti `2fd255d` | eight of the nine items are declarations (R01); the homotopy-square cone maps are absent | R01 | this review |
| “over any unital ring” | `R = M₂(k)`, left modules | `ModuleTower (R) [Ring R]`; δ, kernel, cokernel and cone are additive; no commutativity | True | this review |
| §1.1 localization comparison | README 1569–1573 vs `derivedLimitFactors` | README: quotient then `Rlim` ≅ product cone then `Q`; pin: `Q ⋙ derivedLimit R ≅ homotopyLimitFunctor R ⋙ Q` | Same functors; R01 | this review |
| §1.1 exactness (proposed headline) | `K_n = ℤ`, `×p`; the levelwise-split `A → B → C` with `⊕k` | fibre triangle: `H⁰ = ker δ = 0` (an element of `lim` is divisible by every `pⁿ`), `H¹ = coker δ = ℤ_p/ℤ`; the levelwise-split diagram is not distinguished in `D(towers)` | Elaborates; consistent with §1.1 Checks | this review |
| Surjective-tower comparison | `K_n = ℤ/pⁿ`, reductions | `derivedLimitIsoLimComplex` needs termwise `lim¹ = 0`: transitions surjective, so `Rlim = ℤ_p[0]` | At the pin; matches §1.1 Check | this review |
| Merged Checks: augmentation | `3+dp(2,m)`, `dp(1,m)`, ℚ lift, `dp(0,0)`, `algebraMap r` | `3`; `0`; lift sends `dp(2,1) ↦ 1²/2! = 1/2 ≠ 0 = ε`; `1`; `r` | 5 Checks; repeat deleted | this review |
| Merged Checks: augmentation ideal | `dp(2,m)`; `1` in `Γ_ℤ(ℤ)`; `Γ_F₂(F₂)` | `ε = 0`, member; `ε(1) = 1`, not a member; `dp(2,1) ∈ ker ε`, the detector kills `span dp(1,a)` and sends `dp(2,1) ↦ inr 1 ≠ 0` | 4 Checks | this review |
| Merged Checks: remainder | `M = 0`; `z = 3+dp(2,m)dp(1,m′)`; scalar `r` | `Γ_R(0) = R`, remainder `r − r = 0`; `ε(z) = 3`, `z − 3 ∈ H`; `0` | 3 Checks | this review |
| Merged Checks: generators | `M = 0`; `R = M = ℤ`; `Γ_F₂(F₂)` | `dp(n,0) = 0` for `n > 0`, both ideals `0`; `ε(dp(0,m)) = 1`; `dp(1,1)² = 2dp(2,1) = 0`, `dp(2,1)` outside | 3 Checks | this review |
| Merged Checks: splitting | `r`; `u ∈ Γ₊`; `algebraMap r + u`; `3+dp(2,m)` | `(r,0)`; `(0,u)`; `(r,u)`; `(3,dp(2,m))` | 4 Checks; repeat deleted | this review |
| Merged Checks: base-ideal remainder | `I = R`; `I = 0`; `ℤ, (2), z = 2+2dp(1,1)` | `IΓ·Γ₊ = Γ₊`; `z = 0`; `ε(z) = 2`, `z − 2 = 2·dp(1,1) ∈ (2)Γ·Γ₊` | 3 Checks | this review |
| Merged Checks: intersection | `ℤ, (2)`: `2`, `2dp(1,1)`; `I = 0, R` | `2 ∈ IΓ`, `ε(2) = 2 ≠ 0`, so it is in neither side; `2dp(1,1)` is in both; `0 = 0`; `Γ₊ = Γ₊` | 3 Checks | this review |
| Merged Checks: detector | `dp(0,a)`, `dp(4,1)`, `dp(1,a)`, `dp(2,1)²` | `1`; `0`; `0`; `inr(1)² = 0 = f(6·dp(4,1))` | 3 Checks | this review |
| Merged Checks: degree one | `M = 0`; `F₂⟨x⟩`; ℚ | `Γ₊ = 0`; `x·x^[n] = (n+1)x^[n+1]`, so `(x)` is spanned by odd `x^[m]` and `x^[2]` is outside; `dp(2,m) = ½dp(1,m)²` | 3 Checks | this review |
| R02 identifications | the table in R02 | `augmentation`: `rfl`; span sets agree since `0 < n ↔ n ≠ 0` on ℕ; `CommRing S` vs `CommSemiring S` are the same class over a ring (`−s = algebraMap(−1)·s`) | Restatements | this review |
| K-flat predicates | bi-infinite `(ℤ/4, ×2)` | acyclic and termwise free; `⊗F₂` has zero differentials, `H^i = F₂`; rejected by `N ⊗ P` (here) and `K ⊗ A` (Tau Ceti), which agree by symmetry of `⊗` | Same predicate | this review |
| Lazard at the pin | `ℚ` and `ℤ/2` over ℤ | `FiniteFreeOver ℤ ℚ` is filtered (flat instance), with colimit `ℚ`; `ℤ/2` is not flat, so no instance | Tau Ceti covers the headline | this review |
| §S.1 at the pin | bicomplex in row 0 only | one-step row filtration: `E¹ = H(row 0) = H(Tot) = E∞` | Docstring claim false; R03 | this review |
| Dropped §1.T.1 | main README:1403 vs head | heading on main, absent here; four main roadmaps cite it | R04 | this review |
| Binder repair for `letI` | `(_ : SmallCategory J) (_ : IsFiltered J)` | elaborates with one `sorry` warning; class-typed binders are local instances | R05 repair tested | this review |
| `IsHomogeneous`, zero and identity laws | `0`, `id`, `s = 2`, `x` over ℤ | `0 = 2ⁿ·0` for every `n`; `id(2x) = 2x = 2¹x`; `id(2x) ≠ 4x` so degree 2 fails for `id` | Retained; degree is not unique for `0` | PRREVIEW-DerivedModuleAlgebra~4 |
| Homogeneity needs scalar extensions | `x^p y − xy^p` over `F_p`, `p = 2, 3` | ground values `0`; at `(T, 1)` over `F_p[T]`: `T² − T`, `T³ − T ≠ 0` | Retained; the new Check at README:192 | PRREVIEW-DerivedModuleAlgebra~4 |
| Composition of homogeneous laws | square then cube | `(sx)^6 = s^6 x^6`: degrees multiply, `2·3 = 6 ≠ 5` | Retained | PRREVIEW-DerivedModuleAlgebra~4 |
| `homogeneousPiece`, `d = 0, 1, 2` | `M = 0`; free line; `M = ℤ/2` | `d = 0`: only `∑ n_j = 0`, so the set is `{1}` and the span is `A·1`; `d = 1`: span of `dp 1 m`; `Γ²(ℤ/2) = ℤ/4` (four maps to `ℤ/4`, two for `Sym² = ℤ/2`) | Retained; no freeness | PRREVIEW-DerivedModuleAlgebra~4 |
| Grading and directness | `Γ_ℤ(ℤ)`, `F₂` | `γ₁(1)² = 2γ₂(1)`; over `F₂` this is `0` while `γ₂(1) ≠ 0`, so directness is not division by `2` | Retained (R02 notes it is statable) | PRREVIEW-DerivedModuleAlgebra~4 |
| Coefficient formula, `r = 0` | any `M`, `d = 0` and `d > 0` | `piAntidiag ∅ 0 = {()}`: value `1 ⊗ 1`; `piAntidiag ∅ d = ∅` for `d > 0`: value `0` | Retained; README:190 Check correct | PRREVIEW-DerivedModuleAlgebra~4 |
| Coefficient formula, `r = 1` | `s ⊗ m` | single tuple `(d)`: `s^d ⊗ dp d m`, the homogeneity law | Retained | PRREVIEW-DerivedModuleAlgebra~4 |
| Coefficient formula, repeated vectors | `s₁ ⊗ m + s₂ ⊗ m`, `d = 2` | formula: `s₁² γ₂ + s₁s₂ γ₁γ₁ + s₂² γ₂ = s₁²γ₂ + 2s₁s₂γ₂ + s₂²γ₂`; direct: `(s₁+s₂)²γ₂(m)`; equal by `dp_mul` | Retained | PRREVIEW-DerivedModuleAlgebra~4 |
| Mixed coefficient normalization | rank two, `d = 2` | coefficient of `UV` is `γ₁(x)γ₁(y)` with factor `1`; the `(Ux+Vy)²/2` model gives `2·(1/2)` and fails over `F₂` | Retained | PRREVIEW-DerivedModuleAlgebra~4 |
| Unique factorization, `d = 0` | homogeneous of degree `0`, `s = 0` | `f_S(x) = f_S(0·x) = f_S(0) = 1 ⊗ f_A(0)` by naturality; `l(1) := f_A(0)` works and `Γ⁰ = A·1` forces uniqueness | Retained | PRREVIEW-DerivedModuleAlgebra~4 |
| Uniqueness over all `S` | `S = A[T_1, …, T_r]` | coefficients of `γ_S(∑ T_j ⊗ m_j)` are all `∏ dp(n_j, m_j)`, which span `Γ^d`; a map agreeing on these agrees everywhere | Retained; ground values alone do not suffice (row 2) | PRREVIEW-DerivedModuleAlgebra~4 |
| Universes in the headline | `A, M, N, S : Type u` | matches `PolynomialLaw.toFun'` (`Mathlib/RingTheory/PolynomialLaw/Basic.lean:77`); README:177–178 says the same | Agree | PRREVIEW-DerivedModuleAlgebra~4 |
| Zero ring | `A = 0` | every module, piece and law is zero; `1 ⊗ 1 = 0` | No false vacuity | PRREVIEW-DerivedModuleAlgebra~4 |
| Augmentation | `3 + dp 2 m`, `dp 0 m`, rational lift | `ε = 3`, `1`; the `RatAlgebra` lift sends `dp 2 1` to `1/2 ≠ 0` | Retained real body | PRREVIEW-DerivedModuleAlgebra~4 |
| Augmentation ideal equals positive span | `M = 0`; `Γ_{F₂}(F₂)` | both ideals `0`; `dp 2 1 ∈ ker ε` but not in the ideal of degree-one generators (detector `dp 2 1 ↦ ε ≠ 0`, `dp 1 a ↦ 0`) | Retained Lean headline | PRREVIEW-DerivedModuleAlgebra~4 |
| Base ideal intersection | `I = 0, A, (2)` on `Γ_ℤ(ℤ)` | both sides `0`, `Γ₊`, and the positive-degree elements with even coefficients; `2·dp 1 1` is in both, scalar `2` in neither | Retained Lean headline | PRREVIEW-DerivedModuleAlgebra~4 |
| Koszul complex | `()`, `(0)`, `(1)`, `(2)` over ℤ, `(2)` over `ℤ/4` | `A[0]`; `[A →0 A]` with `H₁ = A`; `[A →1 A]` acyclic; `H₁ = 0`; `H₁ = ℤ/2` | Weak regularity needed | PRREVIEW-DerivedModuleAlgebra~4 |
| Koszul signs | `(x, y)` | `d(e₁∧e₂) = x e₂ − y e₁`, `d² = xy − yx = 0`; plus sign gives `2xy` | Retained | PRREVIEW-DerivedModuleAlgebra~4 |
| K-injective replacement | `ℤ[0]`, a field, `0` | `[ℚ → ℚ/ℤ]`: `H⁰ = ℤ`; `RHom(F_p, ℤ)` has `H¹ = F_p`; zero replaces zero | Retained unbounded headline | PRREVIEW-DerivedModuleAlgebra~4 |
| `IsKFlat` versus termwise flat | bi-infinite `(ℤ/4, ×2)` | acyclic, termwise free; `⊗ F₂` has zero differentials and `H^i = F₂` for every `i`; `⊗^L F₂ = 0` | Predicate tests every acyclic complex | PRREVIEW-DerivedModuleAlgebra~4 |
| K-flat closure | `cone(id_A)`, shifts, filtered colimits | contractible tensor is contractible; two-of-three in triangles (StacksMA 60.5); colimits termwise (60.8) | Retained | PRREVIEW-DerivedModuleAlgebra~4 |
| Lazard | `0`, `Aⁿ`, `ℚ/ℤ`, `ℤ/2` over ℤ | one-object diagrams for `Aⁿ` including `n = 0`; `ℚ = colim (ℤ, ×(e/d))`; `×2` injective on ℤ but zero on `ℤ/2`, so `ℤ/2` is excluded | Retained, no finite generation | PRREVIEW-DerivedModuleAlgebra~4 |
| Simplicial tensor comparison | constant flat `P, Q`; `A[1] ⊗ A[1]` | degree zero `P ⊗ Q`, identity; (1,1)-shuffles `(0;1)` sign `+`, `(1;0)` sign `−`: `s₁x ⊗ s₀y − s₀x ⊗ s₁y`; transposition gives `−1` on `H^{−2} = A`, `+1 = −1` over `F₂` | Lean component matches | PRREVIEW-DerivedModuleAlgebra~4 |
| Flat models in the derived identification | free resolution of `ℤ/2` versus constant `ℤ/2` | `H⁰ = H^{−1} = ℤ/2` versus only `H⁰` | Retained | PRREVIEW-DerivedModuleAlgebra~4 |
| Derived non-additive functor | `F = id`, constant `R′`, `X ↦ X ⊗ X` on `ℤ/2` | `M`; `R′[0]` even at `M = 0`; `Tot([ℤ→2ℤ]⊗[ℤ→2ℤ])` has `H⁰ = H^{−1} = ℤ/2`, `H^{−2} = 0` | Retained | PRREVIEW-DerivedModuleAlgebra~4 |
| Finite-projective extension condition | `V = ⊕_ℕ F₂`, `F = (−)**` | colimit of finite double duals is `V`; `V → V**` not onto | Hypothesis retained | PRREVIEW-DerivedModuleAlgebra~4 |
| Full cotangent complex | identity; `A[t]`; `ℤ → F_p`; `k[ε]/ε²` | `0`; `A[t]dt[0]`; `F_p[1]`; `[B →2ε Bdε]` with `H^{−1} ≠ 0`, and zero differential in characteristic 2 | Retained all characteristics | PRREVIEW-DerivedModuleAlgebra~4 |
| `H^{−2}` of `k[x,y]/(x,y)²` | LS complex over `P = k[x,y]` | `Rel` free on `σ₁ = ye₁ − xe₂`, `σ₂ = ye₂ − xe₃`; `TrivRel = ⟨xσ₁, yσ₁ + xσ₂, yσ₂⟩ ⊊ 𝔪·Rel`; `H₂ = 𝔪·Rel/TrivRel` is cyclic on `(y, 0)`, killed by `𝔪`, nonzero (`∂_y a − ∂_x b` at `0` is well defined and equals `1`), so `≅ k` | README:1158 Check correct | PRREVIEW-DerivedModuleAlgebra~4 |
| Square-zero extensions | `B ⊕ M`; `ℤ/4 → ℤ/2`; `ℤ/9 → ℤ/3`; `ℚ[ε]` | `(b,m)(c,n) = (bc, bn + cm)`, class `0`; no ring section, class `≠ 0` of order `2`, `3`; class `0` | Retained identified kernel | PRREVIEW-DerivedModuleAlgebra~4 |
| Universal property | `A → A`; `A[t]`; `ℤ → F_p`, `M = F_p` | all zero; `Hom = M`, `Exal = 0`; `Hom = 0`, `Exal = Ext¹(F_p[1], F_p) = F_p` | Retained | PRREVIEW-DerivedModuleAlgebra~4 |
| Conormal normalization | `ℤ/9 → F₃`, inclusion `1 ↦ 3` | `3 mod 9 ↦ 1 mod 3`; the negative class gives `2` | Sign pinned | PRREVIEW-DerivedModuleAlgebra~4 |
| Transitivity | `A = B`; `B = C`; `ℤ → ℤ → F₃` | first map `0`, second iso; second map `0`; second map nonzero on `H^{−1} = F₃` | Retained | PRREVIEW-DerivedModuleAlgebra~4 |
| Base change | identity square; `ℤ → ℤ[X]`, `A′ = F₂`; `ℤ → F_p` self-square | identity; `dX ↦ dX` invertible; ordinary pushout `L = 0` versus `F_p[1]` with `Tor₁ = F_p` | Tor independence needed; §0.9 supplies the derived pushout | PRREVIEW-DerivedModuleAlgebra~4 |
| Localization and colimits | invert `1`; `k[t] → k[t,t⁻¹]`; `A[X₁,…,Xₙ]` | identity, `0`; relative `0`, `dt` retained; `⊕ B dX_i`, not `∏` | Retained | PRREVIEW-DerivedModuleAlgebra~4 |
| Smooth and regular | `A[∅]`; `A[X]`; `(t²) ⊂ k[t]`; `F_p(s)[t]/(t^p − s)` | `0`; `dX ≠ 0`, no negative cohomology; `[B →2t Bdt]`, zero in characteristic 2; derivative `0` so `H^{−1} = B ≠ 0`, not smooth | Hypotheses retained | PRREVIEW-DerivedModuleAlgebra~4 |
| Derived exterior powers | `0`; flat line over `F₂`, `ℤ`; `n = 0, 1` | `B`, `0`; `∧²(line) = 0` while signed coinvariants give `F₂`, `ℤ/2`; weight `0` is `B`, weight `1` is `M` | Alternating quotient required | PRREVIEW-DerivedModuleAlgebra~4 |
| Divided powers, flat line | `F_p e`, `ℤ e` | `γ_p(e) ≠ 0`, `e^p = p!γ_p(e) = 0`; `e·e = 2γ₂(e)`; invariants of `e^{⊗2}` are `ℤ e⊗e ↔ γ₂(e)` | Retained | PRREVIEW-DerivedModuleAlgebra~4 |
| Décalage | `ℤ[1]`, `n = 2` | `L∧²(ℤ[1]) = Γ²(ℤ)[2] = ℤ[2] ≠ 0`; `LSym²(ℤ[1]) = ∧²(ℤ)[2] = 0` | Two distinct formulas | PRREVIEW-DerivedModuleAlgebra~4 |
| Obstruction theory | `ℤ/4 → F₂`, `B = F₂[t]`, canonical `c`; `c = 0`, `B = F₂` | lift `ℤ/4[t]`, kernel `F₂[t]`, `Tor₁ = 0`; `B′ = F₂[ε]`, `2B′ = 0`, `B′/JB′ = B′ ≠ B`, not flat | Flat case needs canonical `c`; StacksAlg 051C matches | PRREVIEW-DerivedModuleAlgebra~4 |
| S.1 cohomological four-generator complex | `a, b, c, e` at `(0,1),(1,0),(1,1),(2,0)` over `R` | `d′a = c`: `p+1` ✓; `d″b = c`: `q+1` ✓; `d′b = e` ✓; total differential `(a,b) ↦ (c, e)` is `[[1,1],[0,1]]`, `H(Tot) = 0`; vertical cohomology `R` at `(0,1)`, `(2,0)`; `d(a − b) = −e` so `d₂[a] = [−e]`; `E₃ = 0` over ℤ and `F₂` | README:878–883 correct | PRREVIEW-DerivedModuleAlgebra~4 |
| S.1 homological four-generator complex | same at `(2,0),(1,1),(1,0),(0,1)` | `d′a = c`: `(2,0) → (1,0)` ✓; `d″b = c`: `(1,1) → (1,0)` ✓; `d′b = e`: `(1,1) → (0,1)` ✓; same matrix; `d₂ : (2,0) → (0,1)`, i.e. `(p−2, q+1)` ✓ | README:884–887 correct | PRREVIEW-DerivedModuleAlgebra~4 |
| S.1 stabilization bound, both indexings | `d_r` degrees | cohomological: outgoing `(p+r, q−r+1)` dies for `r > q+1`, incoming from `(p−r, …)` for `r > p`; homological: outgoing `(p−r, q+r−1)` dies for `r > p`, incoming from `(p+r, q−r+1)` for `r > q+1` | `r > max(p, q+1)` in both | PRREVIEW-DerivedModuleAlgebra~4 |
| S.1 abutment filtration | single row; single column; homological | decreasing: `FⁿHⁿ = Hⁿ`, `F^{n+1} = 0`; `F⁰ = Hⁿ`, `F¹ = 0`; increasing: `F_{n−1}H_n = 0`, `F_n = H_n`; `F_{−1} = 0`, `F_0 = H_n` | README:876–877, 888–891 correct | PRREVIEW-DerivedModuleAlgebra~4 |
| S.1 `n ≥ 1` in the extended sequence | only `A^{00} = ℤ`, `n = 0` | both edge maps are `id`; image of the first equals `E⁰ ≠ 0 =` kernel of the second | Bound necessary | PRREVIEW-DerivedModuleAlgebra~4 |
| S.1 chain map as a double complex | `R →id R` in degrees `1, 0` | `E¹ = C`, `E² = 0`, `H_*(Tot) = 0`; reindexed to `−1, 0` the same | Retained | PRREVIEW-DerivedModuleAlgebra~4 |
| S.1 signs | anticommuting `d′, d″` versus Mathlib's commuting `HomologicalComplex₂` | `d_h + (−1)^p d_v` squares to zero iff the two differentials commute | Convention sentence at README:840–843 is right | PRREVIEW-DerivedModuleAlgebra~4 |
| S.1 Needs | the eight Mathlib names | all exist at the pin (`HasSpectralSequence.lean`, `SpectralSequence.lean`, `HomotopyCategory/SpectralObject.lean`, `Triangulated/SpectralObject.lean`, `TotalComplex.lean`) | Resolved | PRREVIEW-DerivedModuleAlgebra~4 |
| Derived limits | constant `K`; `(ℤ, ×p)`; `K_n = [ℤ → ℤ/p^{n+1}]` | `K`; `lim = 0`, `lim¹ = ℤ_p/ℤ`; transitions surjective but `H⁰(K_n) = p^{n+1}ℤ` not Mittag–Leffler, `H¹(Rlim) = ℤ_p/ℤ` | All degrees retained | PRREVIEW-DerivedModuleAlgebra~4 |
| Strict versus levelwise triangles | `V = ⊕_ℕ k`, `A_n = ⊕_{m≥n} k`, `C_n = kⁿ` | `lim A = 0`, `lim V = V`, `lim C = ∏ k`; boundary `∏k → (∏k)/(⊕k) ≠ 0`; the all-ones sequence is not in `⊕ k` | Strict diagrams needed | PRREVIEW-DerivedModuleAlgebra~4 |
| Homotopy-square fibre map | `h_n = x₀` for even `n`, transitions `×3` | `Σ 9^m = 1/(1−9) = −1/8 ∉ ℤ`, nonzero in `ℤ₃/ℤ` | Retained | PRREVIEW-DerivedModuleAlgebra~4 |
| Unbounded Hom | `L = A`, `F_p`, `ℤ[1/p]`, `M = ℤ` | `M`; `H¹ = F_p`; `H¹ = ℤ_p/ℤ`, `H⁰ = 0` | Non-perfect input retained | PRREVIEW-DerivedModuleAlgebra~4 |
| `derivedCompleteness` | `I = 0`; `I = A`; `ℤ_p`, `ℚ_p` at `(p)` | `A[1/0] = 0`, every `M` complete; `A[1/1] = A` forces `M = 0`; `ℤ_p` passes; `ℤ[1/p] → ℚ_p`, `1 ↦ 1`, is a nonzero class | Native predicate correct | PRREVIEW-DerivedModuleAlgebra~4 |
| Generators and radical laws | `s = ∅`; `(p)` versus `(p²)` | both sides vacuously true; both localizations are `ℤ[1/p]` | Lean laws consistent (StacksMA 93.1, 93.2) | PRREVIEW-DerivedModuleAlgebra~4 |
| Cohomology criterion | `ℤ_p[1]`; `cone(×p on ℤ_p)` | only `H^{−1} = ℤ_p`; only `H⁰ = F_p`; each complete (StacksMA 93.6(2), any ideal) | Retained | PRREVIEW-DerivedModuleAlgebra~4 |
| Triangle and shift closure | `cone(×p on ℤ_p)`, shift `n` | third vertex `F_p`, complete; shifts preserve `Hom(A_f[m], −) = 0` | Retained | PRREVIEW-DerivedModuleAlgebra~4 |
| Reflector and Nakayama | `ℤ`, `F_p`, `ℤ[1/p]` at `(p)`; `I = 0`; `I = A` | `ℤ_p`, `F_p`, `0`; identity; `0`; `ℤ[1/p]` has zero reduction but is incomplete and nonzero | Completeness needed in Nakayama | PRREVIEW-DerivedModuleAlgebra~4 |
| No categorical cokernel | `×2` on `ℤ[0]`, `I = 0` | a cokernel is a split epimorphism onto a summand of `ℤ[0]`, i.e. `0` or `ℤ[0]`; both contradict `ℤ[0] → (ℤ/2)[0]` killing `2` | `HasColimit` hypothesis retained | PRREVIEW-DerivedModuleAlgebra~4 |
| Koszul tower | `f = p`; `f = 0`; empty tuple | degree `−1` transition `×p`, degree `0` identity; zero `−1` transition, limit `M`; limit `M` | Retained | PRREVIEW-DerivedModuleAlgebra~4 |
| Quotient-tower comparison | `(p) ⊂ ℤ`; `k[x,y]/(xy)`, `(x,y)` | `ℤ_p`; `k[[x,y]]/(xy)` (Noetherian, not regular) | Retained | PRREVIEW-DerivedModuleAlgebra~4 |
| Unbounded-torsion counterexample | `A = ℤ_p ⋉ (ℚ_p/ℤ_p)`, `I = (p)` | Koszul `H^{−1} = T[pⁿ]` (`×p`, surjective), `H⁰ = ℤ_p/pⁿ`; limits `ℤ_p`, `ℤ_p`; quotient tower `ℤ_p[0]` | Retained | PRREVIEW-DerivedModuleAlgebra~4 |
| Non-splitting in `D(A)` | `C = ΛA`, `R = ℤ_p` | `RHom_A(A[1/p], R) = RHom_ℤ(ℤ[1/p], R) = 0` (`A[1/p] = A ⊗^L_ℤ ℤ[1/p]`), so `R[1]` is complete; `Hom(C, R[1]) = Hom(A, R[1]) = Ext¹_A(A,R) = 0`; a splitting would give a nonzero projection | README:1822–1827 correct; Source issues | PRREVIEW-DerivedModuleAlgebra~4 |
| Simplicial-algebra completion | `P• → 0`, `P₀ = A[t]` | `Hom_{S_A}(0, P•) = ∅`, `Hom_{S_A}(A, P•)` a singleton; after localization both singletons | Adjunction only in `H_A` | PRREVIEW-DerivedModuleAlgebra~4 |
| `IsCompletelyFlatModule` | `ℤ`, `ℤ_p`, `F_p` over ℤ at `(p)`; `I = A` | `Tor₁ = 0`, reductions `F_p` flat; `Tor₁(F_p, F_p) = F_p` excluded; `I = A`: `A/I = 0`, every module qualifies while completeness would force `M = 0` | Predicate separate from completeness, as the README says | PRREVIEW-DerivedModuleAlgebra~4 |
| Torsion-test equivalence | `N` killed by `Iⁿ`, `I` finitely generated | dévissage to `A/I`-modules `N′`: `M ⊗^L N′ = (M ⊗^L A/I) ⊗^L_{A/I} N′` discrete; filtered colimits commute | README:1942–1943 “equivalently” holds for finite `I` | PRREVIEW-DerivedModuleAlgebra~4 |
| Bounded torsion and amplitude | `ℤ_p[1]`; `∏ ℤ/pⁿ` | amplitude `[−1,−1]`; `M ⊗^L F_p = [M →p M]` has `H^{−1} = M[p] ≠ 0`, unbounded torsion, ordinary amplitude `[0,0]` | Restricted conclusion retained | PRREVIEW-DerivedModuleAlgebra~4 |
| Descent | identity; `ℤ_p → ℤ_p × ℤ_p`; `ℤ_p → F_p` | Čech complexes contract to `M`; `Tor₁(F_p, F_p) ≠ 0` so not completely flat | Retained | PRREVIEW-DerivedModuleAlgebra~4 |
| `IsPerfect`, `IsPseudoCoherent` | `A = k × k`, `eA` | finite projective, ranks `(1,0)`; no bounded finite-free model (Euler ranks differ); resolution with differentials `1−e, e, 1−e, …` is bounded above finite free | Both predicates as stated | PRREVIEW-DerivedModuleAlgebra~4 |
| Closure laws | `cone(×2 on ℤ[0])`; shifts; retract `i ≫ r = 𝟙` | two finite free terms, `H⁰ = F₂` need not be projective; supports move; `K` is a summand of `L` (StacksMA 76.5) | Retained | PRREVIEW-DerivedModuleAlgebra~4 |
| `IsRingTowerLimit` and unit reflection | `k[t]/t^{n+1}`; `B = k[x_i]/(x_i²)`, `I = (x_i)` | `1 + t` has inverse `Σ(−t)ⁿ`; `t ↦ 0` at stage 0 is not a unit; `I` locally nilpotent, `x₁⋯x_r ≠ 0` for every `r` | Locally nilpotent, not nilpotent | PRREVIEW-DerivedModuleAlgebra~4 |
| Unit-reflection proof | lift `u` of a unit `v`, `w` lift of `v⁻¹` | `τ(uw − 1) = 0`, so `uw − 1` nilpotent and `uw` a unit; inverses compatible, limit element `s` with `π_n(rs) = 1` for all `n`, `rs = 1` by uniqueness | True as stated | PRREVIEW-DerivedModuleAlgebra~4 |
| Residue criterion | `[k[[t]] →t k[[t]]]`; `k` over `k[ε]/ε²` | fibre `[k →0 k]`, interval `[−1,0]` although `H^{−1} = 0`; `Tor_i(k,k) = k` for all `i`, no interval; maximal ideals suffice (StacksMA 79.2(3)) | Lean quantifier over surjections onto fields is exactly 79.2(3) | PRREVIEW-DerivedModuleAlgebra~4 |
| Effectivity | `A_n = k[t]/tⁿ`, `M_n = [A_n →t A_n]` | limit `[k[[t]] →t k[[t]]]`, `H^{−1} = 0`; `H^{−1}(M_n) = (t^{n−1}) ≅ k` with zero transitions; derived reduction recovers `M_n` | Cohomology-level compatibility excluded | PRREVIEW-DerivedModuleAlgebra~4 |
| Matlis, arithmetic | `R = ℤ_p`, `E = ℚ_p/ℤ_p` | `D(R) = E`, `D(E) = R` (`End(E) = R̂ = R`); `D(R ⊕ E) = E ⊕ R` | Retained | PRREVIEW-DerivedModuleAlgebra~4 |
| Matlis, general residue field | `R = k`, `M = kʳ`, `r = 0, 1, 2`; `⊕_ℕ k` | dual dimension `r`, evaluation `I_r`; `D(⊕k) = ∏k`, evaluation not onto | Finiteness binders needed | PRREVIEW-DerivedModuleAlgebra~4 |
| Completeness necessity | `R = k[x]_{(x)}` | `End(k(x)/R) = k[[x]] ≠ R` | `IsAdicComplete` needed | PRREVIEW-DerivedModuleAlgebra~4 |
| Equivariant convention | `S₃` on `k³`, `s = (12)`, `t = (123)` | `st ≠ ts`; dual matrices `(P^{-1})^T` compose contravariantly; double dual restores `P_s, P_t` | Contragredient action retained | PRREVIEW-DerivedModuleAlgebra~4 |

The computations cover the zero module, the unit and zero ideals, characteristic two, torsion and non-flat modules, a noncommutative coefficient ring and unbounded towers. No restriction to good primes, flat inputs or finite residue fields is introduced by the changed text or by the repairs above.

## Not verifiable

- No new item this round. The previous report's entries were not re-examined because they lie outside the changed passages: NSW (Proposition 2.1.1 and Lemma 2.2.4, cited in §S.1; only the landing page was reachable), IllusieCC (Chapter II, 1.2.6.2; no open copy), and Stacks Tag 079P and Simplicial Methods beyond Remark 14.26.4 (checked by tag only).
- Ownership against the open pull requests was checked through the brief's sibling checkouts for the roadmaps the changed passages name (AlgebraicTopology at the heads of #1663 and #1652) and through `overlaps.md`. The other open heads were not re-read, because the diff changes no object they share with this roadmap.

## Source issues

- none
