# Review of DerivedModuleAlgebra (pull request #1701 at fba5202)

**Verdict:** needs changes

This is a full review of `README.md` and `Suggested.lean` at `fba52024d5d5`, with pins Mathlib `1b1ccf4b088b` and Tau Ceti `2fd255d997f4`. The gate passes and the dependency check reports no problem. `Suggested.lean` elaborates with 17 `sorry` warnings and nothing else. There are eight findings (two P2, six P3). Most of them come from one source: the pinned Tau Ceti already has more of this roadmap than the file and the README say. Two headlines that the docstring lists as not statable can be stated (R01, R02). Two stated theorems are already at the pin (R03, R04). Three sections restate pinned work without citing it (R05). Separately, this head deletes many intended Lean names that other roadmaps cite (R06).

## R01 (P2) — The §1.3 completion reflector is statable at the pins but is listed as not statable

Location: `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean:49–51`, “the completion reflector with its unit, adjunction and derived Nakayama (§1.3), the Koszul completion tower (§1.4) and the ordinary-quotient comparison (§1.5): all are built from the derived tensor above”. Also README:1815–1817.

Claim: no headline of §1.3 can be stated without a derived tensor product on `D(A)`.

Witness: Stacks Lemma 15.93.10 (StacksMA line 12163, p.264) says that, for finitely generated `I`, the inclusion of derived complete objects into `D(A)` has a left adjoint. That needs only `derivedCompleteness` (in the file), Mathlib's `ObjectProperty.ι` and `Functor.IsRightAdjoint`.

Repair: in Layer 3, after `isDerivedComplete_triangle`, state

```lean
/-- **Derived completion is a reflector** (README 1.3; Stacks, Lemma 15.93.10, Tag 091V): for a
finitely generated ideal `I`, the inclusion of the derived `I`-complete objects into `D(A)` has a
left adjoint. -/
theorem derivedCompleteness_isRightAdjoint (A : Type u) [CommRing A] (I : Ideal A) (hI : I.FG) :
    (ObjectProperty.ι (derivedCompleteness A I)).IsRightAdjoint := by
  sorry
```

Name it in §1.3's prose. Reduce the docstring bullet to derived Nakayama (Stacks 15.93.20 needs `K ⊗^L_A A/I`, StacksMA line 12364) and to §§1.4–1.5, which also need `⊗^L`.

Test: in a scratch copy the theorem elaborates (18 `sorry` warnings, no other message). The degenerate cases agree with §1.3's Checks:
- `I = 0`: every object is complete, and the identity is the left adjoint.
- `I = A`: `Hom(A[n], M) = H^{−n}(M)`, so only zero objects are complete, and the zero functor is the left adjoint.
- `(p) ⊂ ℤ`: the unit sends `ℤ` to `ℤ_p` and `ℤ[1/p]` to `0`.

`hI` matches the source's hypothesis.

## R02 (P2) — The §0.2.2 diagonal comparison is statable against Tau Ceti's bisimplicial API, and the tensor comparison ignores Tau Ceti's Alexander–Whitney map

Location: `Suggested.lean:43–44`, “the bisimplicial diagonal comparison (§0.2.2): the diagonal and double alternating-face comparison functors are not constructed at the pin”. Also README:1010–1012 (*Needs:* Mathlib only) and `Suggested.lean:99–126`.

Claim: the diagonal, the double complex and the comparison map do not exist at the pins.

Witness: Tau Ceti `2fd255d` has `CategoryTheory.SimplicialObject.diag`, `doubleComplex` (total differential `d₁ + (−1)^p d₂`) and the chain map `diagAlexanderWhitney`, at `TauCeti/AlgebraicTopology/SimplicialObject/Bisimplicial.lean:83, 143, 313`. It also has `SimplicialObject.alexanderWhitney` (`AlexanderWhitney.lean:172`, naturality at :222).

Repair:
1. Add `public import TauCeti.AlgebraicTopology.SimplicialObject.Bisimplicial` and state

```lean
/-- **Generalized Eilenberg–Zilber theorem** (README 0.2.2; Dold–Puppe, Satz 2.15): for every
bisimplicial module `Z`, the Alexander–Whitney map from the alternating face complex of the
diagonal to the total complex of the double complex is a chain homotopy equivalence. -/
theorem bisimplicialDiagonalComparison (R : Type u) [CommRing R]
    (Z : SimplicialObject (SimplicialObject (ModuleCat.{u} R))) :
    ∃ e : HomotopyEquiv
        ((AlgebraicTopology.alternatingFaceMapComplex (ModuleCat.{u} R)).obj
          ((SimplicialObject.diag (ModuleCat.{u} R)).obj Z))
        (((SimplicialObject.doubleComplex (ModuleCat.{u} R)).obj Z).total (ComplexShape.down ℕ)),
      e.hom = SimplicialObject.diagAlexanderWhitney Z := by
  sorry
```

2. Add `public import TauCeti.AlgebraicTopology.SimplicialObject.AlexanderWhitney`. In `simplicialTensorComparison`, add the conjunct `∀ X Y : SimplicialObject (ModuleCat.{u} R), (e X Y).inv = SimplicialObject.alexanderWhitney X Y`. This follows the normative "Import existing Tau Ceti APIs" rule.
3. In §0.2.2, name these declarations in both *Needs* lines and in a `From Tau Ceti` supplier row. Delete the docstring bullet.

Test: both forms elaborate in scratch copies (18 `sorry` warnings each). The module `TauCeti.AlgebraicTopology.SimplicialObject.Bisimplicial` was built first with `lake build`. Values checked:
- A constant `P` gives homology `P` in degree 0 on both sides.
- The Alexander–Whitney map is the identity in degree 0.
- Its `(1,1)` component sends `s₁x ⊗ s₀y` to `d₂s₁x ⊗ d₀s₀y = x ⊗ y`. This agrees with the signed shuffle `s₁x ⊗ s₀y − s₀x ⊗ s₁y` that the theorem fixes.
- On unnormalized chains the composite of the two maps differs from the identity by degenerate terms, so only a homotopy equivalence is asserted.

Dold–Puppe Satz 2.15 is DoldPuppe line 567, printed p.217, as the README cites.

## R03 (P3) — `moduleKFlatReplacement` restates pinned Tau Ceti: the termwise-flat clause is at the pin

Location: `Suggested.lean:76–84` and docstring lines 20–22, 36. README:17 (“apart from its termwise-flat clause”), 74 and 750–752 (“the headline `DerivedDeRham.moduleKFlatReplacement` adds that the K-flat complex can be chosen flat in every degree”).

Claim: Tau Ceti lacks the flat-terms clause, so this theorem is a headline.

Witness: Tau Ceti's `CochainComplex.kFlatResolution` comes with three instances in `TauCeti/Algebra/Homology/Monoidal/KFlat/Resolution.lean`: `kFlatResolution.quasiIso_π` (:301), `isKFlat_kFlatResolution` (:308) and `preservesFiniteLimits_tensorLeft_kFlatResolution_X` (:322, flat terms). With Mathlib `Module.Flat.iff_preservesFiniteLimits_tensorLeft`, they prove the theorem.

Repair:
1. Delete `moduleKFlatReplacement` and the now unused import `TauCeti.Algebra.Homology.Monoidal.KFlat.Basic`.
2. At README:17, 74 and 750–752 and in the docstring, cite these four declarations and drop "apart from / without its termwise-flat clause". Keep §0.2's other laws.

Test: in scratch, the statement is proved in ten lines with no `sorry`. The proof uses free covers `X →₀ R`, the three instances, and `(Module.Flat.iff_preservesFiniteLimits_tensorLeft _).2` on the flat-terms instance. This corrects step 2 of the previous review's R02 repair, which read only `exists_quasiIso_isKFlat_moduleCat`.

## R04 (P3) — `isCompletelyFlatModule_of_flat` closes with one `exact`

Location: `Suggested.lean:204–211` (“**A flat module is `I`-completely flat**”); README:1793, 2053–2055 and 2059–2060.

Claim: this is a headline theorem.

Witness: `exact ⟨fun n hn ↦ Nat.succ_pred_eq_of_pos hn ▸ ModuleCat.isZero_Tor_succ_of_flat M _ _, inferInstance⟩` closes it in a scratch copy, leaving 16 `sorry` warnings. The lemma is Tau Ceti `ModuleCat.isZero_Tor_succ_of_flat` (`TauCeti/Algebra/Category/ModuleCat/Monoidal/Tor.lean:233`).

Repair:
1. Delete the theorem from `Suggested.lean`. The README keeps the law and cites `ModuleCat.isZero_Tor_succ_of_flat` and Mathlib's flat base-change instance.
2. Keep `IsCompletelyFlatModule`, which PerfectoidSpaces on main cites (README:10972). Give it the §1.8 converse instead, a real headline (README:2086–2087; [BMS19] Lemma 4.7(2), BMS19 line 918, p.222):

```lean
theorem isCompletelyFlatModule_of_isAdicComplete (A : Type u) [CommRing A] (p : ℕ) (hp : p.Prime)
    (hA : ∃ c : ℕ, ∀ (a : A) (n : ℕ), (p : A) ^ n * a = 0 → (p : A) ^ c * a = 0)
    (M : ModuleCat.{u} A) [IsAdicComplete (Ideal.span {(p : A)}) M]
    (hM : ∃ c : ℕ, ∀ (x : M) (n : ℕ), (p : A) ^ n • x = 0 → (p : A) ^ c • x = 0)
    (hflat : ∀ n : ℕ, 0 < n →
      Module.Flat (A ⧸ Ideal.span {(p : A) ^ n}) ((A ⧸ Ideal.span {(p : A) ^ n}) ⊗[A] M)) :
    IsCompletelyFlatModule A (Ideal.span {(p : A)}) M := by
  sorry
```

Name it in §1.8 and remove `isCompletelyFlatModule_of_flat` at README:1793 and 2059.

Test: the replacement elaborates in scratch (18 warnings). Instances checked:
- `M = ℤ_p` over `ℤ_p` satisfies every hypothesis and is completely flat (`Tor₁(ℤ_p, F_p) = 0`).
- `∏ ℤ/pⁿ` fails `hM`, and it is not completely flat (`Tor₁ = M[p] ≠ 0`), so `hM` is needed.
- `F_p` fails `hflat` at `n = 2`.

## R05 (P3) — §0.K.1 and parts of §§1.M.2 and 0.2.2 are formalised at the pin but not cited

Location: README:16–20 (the list of formalised targets), README:76 (“§0.K.1 constructs the linear-functional Koszul complex and its tensor, homotopy and resolution contracts”), README:606–636, README:2370–2378, and the docstring list at `Suggested.lean:16–28`.

Claim: these targets are this roadmap's to construct, and nothing at the pin covers them.

Witness: the Koszul declarations are in `TauCeti/RingTheory/KoszulComplex/`:
- `TauCeti.koszulComplex` (`Basic.lean:219`), `koszulComplex.map` (:270), `koszulComplex.smulHomotopy` (:331), `koszulComplex.homologyZeroEquivSpan` (:399);
- `koszulComplex.tensorIso` and `koszulComplex.tensorIsoAppend` (`Tensor.lean:319, 340`);
- `koszulComplex.exactAt_of_isWeaklyRegular` (`Regular.lean`).

Repair: name these at §0.K.1 in the form "Tau Ceti formalises … as …". Do the same at §1.M.2 for:
- `TauCeti.exists_isInjectiveEnvelope` (`Algebra/Module/Injective/Envelope/Existence.lean:109`);
- the `R̂`-action `TauCeti.AdicCompletion.torsionModule` (`RingTheory/AdicCompletion/Torsion.lean:95`);
- finite-length biduality `TauCeti.IsInjectiveEnvelope.bijective_applyₗ` (`RingTheory/MatlisDuality/FiniteLength.lean:155`);
- `TauCeti.IsInjectiveEnvelope.isArtinian_of_finite_adicCompletion_linearMap` (`MatlisDuality/Artinian.lean:100`). This is the Artinian criterion, without the torsion hypothesis.

At §0.2.2, also name the R02 declarations. Add all of these to the list at README:16–20, to a `From Tau Ceti` row (row 76 then keeps only what remains, the mapping-cone identification of `K(φ ⊕ y·)`), and to the docstring's list of provided results.

Test: over `ℤ/4`, `K(2)` has `H₁ = ℤ/2` and `(2)` is not weakly regular there. This is consistent with the pinned hypothesis. `STATUS.md` in this folder records the same Koszul result as done.

## R06 (P3) — Deleted Lean names that other roadmaps cite have no old → new line

Location: README:32–37. Only `CompactCoefficients.Tower`, `DerivedDeRham.derivedLimit` and `DerivedDeRham.moduleDerivedHom` are mapped there.

Claim: no citation breaks when this head merges.

Witness: main's EnhancedDerivedSheaves README:451 cites `moduleKInjectiveReplacement` (main's README:558 here); its README:2633 cites `DerivedDeRham.koszulCompletionTower` (README:1800 here). Main's PerfectoidSpaces README:10971 cites `DerivedDeRham.completeNakayama` (README:1766 here). This head has none of them.

The other cited names, by roadmap:
- Main, EnhancedDerivedSheaves: README:2907.
- Main, PerfectoidSpaces: `leftDerivedNonadditive`, `completionAdjunction`, `completeFlatBaseChange`, `boundedTorsionCriterion` and `completeFlatDescent`, at README:10970–10972 and 11003.
- Open head of PadicPeriodRings (#940): `PD.augmentation` and `PD.augmentationIdeal`, at README:38 and 404.
- Open head of HabiroRings (#1425): `DerivedDeRham.completeNakayama`, at README:61.
- Open head of RelativeFarguesFontaine (#1209): `DerivedDeRham.perfectInverseSystemEffectivity`, at README:125.

Repair: extend the line at README:35–37, one entry per name. Map to pinned declarations where they exist:
- `moduleKInjectiveReplacement` → `CochainComplex.exists_quasiIso_isKInjective` and `TauCeti.kInjectiveReplacement`;
- `PD.augmentation` → `DividedPowerAlgebra.augmentation`; `PD.augmentationIdeal` → `DividedPowerAlgebra.augmentationIdeal`;
- `PD.augmentationIdeal_eq_span_dp` → `DividedPowerAlgebra.augmentationIdeal_eq_span`; `PD.map_inf_augmentationIdeal` → `DividedPowerAlgebra.map_algebraMap_inf_augmentationIdeal_eq_mul`;
- `PD.robyRepresentability` → `DividedPowerAlgebra.homogeneousLawEquiv`;
- `DerivedDeRham.IsKFlat` → `CochainComplex.IsKFlat`; `DerivedDeRham.flatModuleFilteredFree` → `TauCeti.flatModuleFilteredFree`.

Map the rest to their sections: `derivedExteriorPower` → §0.14, `leftDerivedNonadditive` → §0.3, `completionAdjunction` and `completeNakayama` → §1.3, `koszulCompletionTower` → §1.4, `completeFlatness` and `completeFlatBaseChange` → §1.7, `boundedTorsionCriterion` → §1.8, `completeFlatDescent` → §1.9, and `perfectInverseSystemEffectivity` → §1.E.1.

Test: each cited line listed above then resolves through the README. The gate's `dropped=0` and the overlap report cover section ids only. These names were found with `roadmaps grep` and confirmed in the main checkout.

## R07 (P3) — Two locators overreach, and one claim of §1.9 has no locator

Location: README:1383, “§9, Lemma 9.1 (Tag 08R5), using §8, Lemma 8.4 (Tag 08R2) for étale maps, pp.18–21”; README:2104–2107, “Complete flatness and fixed finite p-complete Tor-amplitude are detected after this base change … [BMS19], Remark 4.9 and the §3 flat-descent argument, pp.215–218, 223”.

Claim: the page ranges and the source cover the statements as written.

Witness: StacksCt Lemma 8.4 is at line 805 (p.18) and Lemma 9.1 at 847 (p.19); §10 begins at 855, on p.19. BMS19 §3 begins at line 747 (p.217); pp.215–216 cover THH. The detection claim is Lemma 4.5(2) (line 888, p.221).

Repair: write “pp.18–19” at line 1383. At line 2107, write “[BMS19], Theorem 3.1 and assertion (1) of its proof, Lemma 4.5(2) and Remark 4.9, pp.217–218, 221, 223”.

## R08 (P3) — The AlgebraicTopology heading cited exists only at an open revision, and the description is out of date

Location: README:28–29, 70 and 85–86, “(§6.0 *Restriction towers and homotopy-square maps*)”. Pull-request description: “**Merge order.** Independent of the open roadmap pull requests”.

Claim: the citation resolves on main, so no open revision needs naming.

Witness: on main, AlgebraicTopology Stage 6, item 0 is titled “Countable inverse-system algebra” (README:955). The cited title exists only at the head of #1652 (README:1652; renumbering line at README:595). The description also names the deleted `PD.robyRepresentability` and says “`Suggested.lean` is unchanged”.

Repair: in the description's merge-order paragraph, name AlgebraicTopology's open revision as the source of the §6.0 title. Alternatively, cite main's title at the three lines. In the description, replace `PD.robyRepresentability` with `DividedPowerAlgebra.homogeneousLawEquiv` and delete “README only; `Suggested.lean` is unchanged”.

This finishes the part of the previous review's R01 that is still open.

## Previous findings

- **R01 (P2), tower contract: partly repaired.**
  - Done: README:71 adds the `From Tau Ceti module towers` row (“`TauCeti.ModuleTower` … `TauCeti.ModuleTower.derivedLimit` with `TauCeti.ModuleTower.derivedLimitFactors`”), and row 70 narrows AlgebraicTopology to the homotopy-square maps.
  - Done: the *Needs* lines at README:1785, 1835, 1878, 1904, 1985 and 2110 read “Tau Ceti `TauCeti.ComplexTower` (Milnor sequences)”.
  - Done: `Suggested.lean:129–139` states `derivedLimit_isTriangulated` with the import.
  - Open: naming the revision in the merge-order paragraph (R08).
- **R02 (P3), stand-ins: repaired as asked.** The `PD.*`, `moduleKInjectiveReplacement`, `IsKFlat` and `flatModuleFilteredFree` declarations are deleted. README:117–123, 319–322, 448, 533, 662–668 and 800 name the Tau Ceti declarations, and rows 73–74 list them. The one statement the repair kept is itself at the pin (R03).
- **R03 (P3), §S.1 abutment: repaired.** `Suggested.lean:23–27` names `HomologicalComplex₂.columnFiltrationAbutmentIso` and `rowFiltrationSpectralSequencePageXIsoEInfty`. README:847–853 says what §S.1 adds, and row 75 consumes the Tau Ceti spectral sequences.
- **R04 (P3), dropped §1.T.1: repaired.** README:32–34: “Citations of §1.T.1 (*lim and lim¹ of a tower*, … *The Milnor sequence for towers of complexes*) resolve to the Tau Ceti tower declarations”. The names this head drops are R06.
- **R05 (P3), `letI`: repaired.** The theorem is deleted, and the gate reports `statement-hygiene=0`.

## Verified sound

**Heads and gate.** The worktree is at `fba52024d5d519b4dae03e8c2ca449a2f7ecda56`, and no file in it was changed. `git diff --stat origin/main...HEAD` outside the folder is empty. The re-run gate prints every counter as 0, ending in `OK`. Dependency check:

```text
depcheck: 238 roadmaps, 2356 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. `PROGRESS.md`, `STATUS.md` and `metadata.toml` pass `stray-files`.

**Elaboration and probes.**
- `lake env lean` on `Suggested.lean` exits 0 with exactly 17 “declaration uses `sorry`” warnings.
- The 27 elaborated signatures in `signatures.md` lose no binder. `#check` of the four changed declarations (`moduleKFlatReplacement`, `nonempty_bicomplexSecondPageIso`, `derivedLimit_isTriangulated`, and `derivedCompleteness_isRightAdjoint` in scratch) matches the README statements.
- One-tactic probes: replacing every `sorry` by `simp`, `rfl` or `infer_instance` gives 17 errors each time.
- Targeted `exact` probes found R03 and R04.
- Four candidate statements elaborate in scratch: R01, R02 (both parts) and R04's replacement. `TauCeti.AlgebraicTopology.SimplicialObject.Bisimplicial` was built with `lake build` for this, with exit 0.

**Library names.** All 128 Tau Ceti-style names in the README resolve at `2fd255d`. The namespaces were checked by hand where a last-component match was ambiguous: `DividedPowerAlgebra.RobyAlgebra.algHomEquiv` (`RobyAlgebra.lean:521`), `PolynomialLaw.IsHomogeneousOfDegree.add/.comp` (`Homogeneous.lean:103, 112`), `CochainComplex.mappingCocone.mapOfHomotopyHomotopy` (`MappingCocone/Homotopy.lean:93`), `TauCeti.ModuleTower.connecting` (`Tower/Exact.lean:191`). All 139 dotted Mathlib names resolve at `1b1ccf4`. The only exceptions are the namespace `AlgebraicTopology.DoldKan` and the file name `Suggested.lean`.

**Pinned facts checked for the new text.**
- `derivedLimit` has its `CommShift ℤ` instance from `NatTrans.mappingCoconeFunctor` (`Tower/DerivedLimit.lean:310–343`). `NatTrans.CommShift (mappingCoconeFunctorFst τ)` (`MappingCocone/Basic.lean:320`) makes the projection to `∏ K_n` commute with shifts without a sign, as README:1664–1666 says.
- `homotopyLimitLift` has components `(ι, 0)` (`DerivedLimit.lean:244–258`).
- No `IsTriangulated` instance for `derivedLimit` exists at the pin.
- `TauCeti.derivedHom` and `derivedHomHomologyLinearEquiv` match README:1748–1753 (`DerivedHom.lean:69, 148`).
- Tau Ceti's `perfect` (`DerivedCategory/Singularity/Basic.lean:92`) is the thick closure of all projectives in `Dᵇ`, not finite projectives, so `IsPerfect` does not duplicate it.

**Seeded sample.** The README flags no locator as unverified.

| Target | Lines read | Result |
| --- | --- | --- |
| 0.2 | StacksMA 6709 (60.1, p.144), 6725 (60.5), 6741 (60.7, p.145), 6753 (60.8: arbitrary filtered colimits), 6781 (60.10, p.146), 6824 (60.12), 6846 (60.13, p.147) | Exact |
| 0.2.1 | StacksAlg 8891 (10.81.2), 8918 (Thm 10.81.4, p.191) | Exact |
| 0.3 | DoldPuppe 902–966 (§4 from printed p.227; 4.7 on p.228); SAG 62226 (25.2.1.2, p.1698), 62247 (25.2.1.3, p.1699) | Exact |
| 0.4 | StacksCt 89 (Def 3.2, p.3), 193–228 (4.3–4.7, pp.5–6), 360 (Rem 5.5, p.9); BL22 10001, 10013 (B.1–B.2, p.225) | Exact |
| 0.8 | StacksCt 704 (Prop 7.4, p.16) | Exact |
| 0.10 | StacksCt 456 (§6, p.11), 519 (6.2, p.12) | Exact |
| 0.11 | StacksCt 108 (3.4, p.3), 779 (8.1, p.17), 827 (8.6, p.19) | Exact |
| 0.12 | StacksCt 805, 847 | R07 |
| 0.13 | StacksCt 1290 (14.2, Koszul-regular, p.29), 1303 (14.4, p.29) | Exact |
| 0.16 | SAG 62308 (25.2.2.3, p.1700), 62327 (25.2.2.4, p.1701), 62412–62420 (25.2.3.4(3), p.1703); DoldPuppe 1023, 1031 (4.13, (4.14), p.230) | Exact |
| 0.25 | StacksCt 1408 (16.1, p.31), 1676 (21.1, p.37); StacksAlg 11014 (10.99.8, p.233); StacksDefos 56 (2.1, p.2) | Exact |
| 1.1 | StacksMA 10946 (89.1), 10971 (89.3, p.238), 10983 (89.4, p.239), 11108 (89.10, p.241), 11124/11133 (89.11–12, p.242) | Exact |
| 1.3 | StacksMA 12163 (93.10, p.264), 12293 (93.18, p.267), 12364 (93.20), 12374 (93.21, p.268) | Exact |
| 1.8 | BMS19 895 (4.6, p.221), 908 (4.7, pp.221–222), 958 (4.8, p.223) | Exact |
| 1.9 | BMS19 751–765 (Thm 3.1 and assertion (1), p.217), 888 (4.5(2), p.221), 973 (Rem 4.9, p.223) | R07 |

Also read: StacksMA 12005–12125 (§1.2 tags 091P–091U, pp.261–264), 12496–12756 (§1.5 tags, pp.271–276), 8707–8723 (§1.1.1, p.189), 8793–8826, 9085, 9295, 13279, 13310 (Layer 4 tags).

**Cross-roadmap citations and ownership.**
- AlgebraicTopology Stage 6, item 0 resolves on main (README:946, 955, 993) and at the heads of #1663 (README:424) and #1652 (§6.0 at README:1652). See R08.
- §1.3's reflector is consumed, not owned, by CrystallineCohomology, ArithmeticGaloisDuality, DerivedDeRhamCohomology and EnhancedDerivedSheaves (`roadmaps grep`), so this roadmap is its owner.
- `roadmaps grep` finds no other roadmap stating the exactness of the derived limit or the second-page identification.
- No other `Suggested.lean` declares the namespace `TauCetiRoadmap.DerivedModuleAlgebra`.
- `overlaps.md` reports no other open pull request changing this roadmap, and no dropped or revision-only section id other than §1.T.1 (repaired) and the §6.0 title (R08).
- No supplier gap is declared (no readable `design/plan.json`).

**Adversarial table.** Rows marked “here” were computed in this review. Rows marked “carried” repeat values from PRREVIEW-DerivedModuleAlgebra~5 for statements whose text is unchanged; their statements were re-read here.

| Statement | Instances | Values on each side; wrong model excluded | Result | Source |
| --- | --- | --- | --- | --- |
| `derivedLimit_isTriangulated` | `K_n = ℤ`, `×p` | fibre triangle `Rlim → ∏ℤ → ∏ℤ`: `H⁰ = ker δ = 0` (`x₀` divisible by all `pⁿ`), `H¹ = coker δ = ℤ_p/ℤ` | True | here |
| shift convention (new Check) | constant `ℤ[0]` | `Rlim(K[1]) ≅ ℤ[1] ≅ (Rlim K)[1]`; lift `(ι, 0)` commutes with the unsigned `fst` shift, so the shift iso is `id`; a `(−1)^a`-twisted structure gives `−1` and negates third maps | Check correct | here |
| levelwise-split diagram | `A_n = ⊕_{m≥n}k → V → kⁿ` | levels split; `lim A = 0`, `lim V = V`, `lim C = ∏k`, `lim¹A = ∏k/⊕k`; a zero boundary would make `⊕k → ∏k` onto, false (all-ones sequence) | Hypothesis needed | here |
| `nonempty_bicomplexSecondPageIso` | only column 0 is nonzero | LHS at `(−k, 0)`: `H₀(t ↦ H_k(K.X t)) = H_k(C)`; RHS the same | Agree | here |
| same | only row 0 is nonzero | `H_k(K.X t) = 0` for `k > 0`; for `k = 0`, both sides are `H_p` of row 0 | Agree | here |
| same | `ℤ →id ℤ`, columns 1, 0 | page-2 differential is an iso; LHS `0`, RHS `0` | Agree | here |
| page indexing | `d_r` of bidegree `(r, 1−r)` at `(−k−2p, p)` | `r = 2` lands at `(−k−2(p−1), p−1)`: same `k`, column `p−1` | Statement's position right | here |
| §S.1 stabilization bound | pin's conditions `q+2 ≤ r`, `p′+2q+r > 2` at `(−k−2p, p)` | equivalent to `r−1 > p` and `r−1 > k+1`, i.e. classical `r > max(p, q+1)` | README bound = pin's | here |
| `simplicialTensorComparison` with `inv = alexanderWhitney` | degree 0; `(1,1)` | `∇₀ = AW₀ = id`; `AW` of `s₁x⊗s₀y` is `x⊗y`; of `s₀x⊗s₁y` is the degenerate `s₀d₁x ⊗ s₀d₀y` | Consistent (R02) | here |
| R02 headline | constant `P`; `Z = X⊗Y`, `X = Y = A[1]` | homology `P` in degree 0 on both sides; homology `A` in degree 2 on both | Elaborates; true | here |
| R01 headline | `I = 0`, `I = A`, `(p) ⊂ ℤ` | left adjoints `id`, `0`, `ℤ ↦ ℤ_p` and `ℤ[1/p] ↦ 0` | Elaborates; true | here |
| `moduleKFlatReplacement` | proof from the pin; bi-infinite `(ℤ/4, ×2)` | ten-line proof, no `sorry`; the `ℤ/4` complex is termwise free but `⊗F₂` has `H^i = F₂` while `⊗^L F₂ = 0`, so K-flatness is a real clause | Restatement (R03) | here |
| `isCompletelyFlatModule_of_flat` | probe | one `exact`; 16 warnings remain | Padding (R04) | here |
| R04 replacement | `ℤ_p`; `∏ℤ/pⁿ`; `F_p`; `p = 1` | holds; fails `hM` and is not flat (`Tor₁ = M[p]`); fails `hflat` at `n = 2`; `span{1} = ⊤` forces `M = 0` | Hypotheses needed | here |
| §0.K.1 at the pin | `K(2)` over `ℤ/4` | `H₁ = ℤ/2`; `2` is a zero divisor, so `exactAt_of_isWeaklyRegular` does not apply | Consistent (R05) | here |
| §1.M.2 at the pin | `R = k`, `M = kʳ`; `⊕_ℕ k` | `bijective_applyₗ` (length `r`); infinite length excluded | Consistent (R05) | here |
| §1.9 descent | identity; `ℤ_p → ℤ_p×ℤ_p`; `ℤ_p → F_p` | Čech contracts; splits; `Tor₁(F_p,F_p) ≠ 0`, not completely flat | True; locator R07 | here |
| §1.8 amplitude | `ℤ_p[1]`; `∏ℤ/pⁿ` | `[−1,−1]`; ordinary `[0,0]`, complete `[−1,0]`, unbounded torsion | True | here |
| §0.13 regular | `(p) ⊂ ℤ`; `k[X]/(X²)` | `F_p[1]`; `[B →2X B dX]`, zero in characteristic 2 | True | here |
| §0.12 smooth | `A[X]`; `k[ε]/ε²` | `B dX[0]`; `H^{−1} ≠ 0`, so not smooth | True; locator R07 | here |
| §0.10 base change | `ℤ → F_p`, `A′ = F_p` | ordinary pushout gives `0`, `L_{F_p/ℤ}⊗F_p = F_p[1]`; `Tor₁ = F_p` | Hypothesis needed | here |
| §0.8 transitivity | `ℤ → ℤ → ℤ/3` | first term `0`; second map identity on `H^{−1} = ℤ/3` | True | here |
| §0.25 flat case | `ℤ/4 → F₂`, `c = 0`, `B′ = F₂[ε]` | `2B′ = 0`, `B′/JB′ = B′ ≠ B`, not flat | Canonical `c` needed | here |
| `derivedCompleteness` | `I = 0`; `I = A`; `ℚ_p` at `(p)` | `A[1/0] = 0`; `Hom(A[n],M) = H^{−n}M`; `ℤ[1/p] → ℚ_p`, `1 ↦ 1`, nonzero | Correct | carried |
| generators / radical | `s = ∅`; `(p)`, `(p²)` | vacuous; same localizations | Correct | carried |
| cohomology criterion; triangles | `ℤ_p[1]`; `cone(×p on ℤ_p)` | complete; third vertex `F_p` complete | Correct | carried |
| no categorical cokernel | `×2` on `ℤ[0]` | summands of `ℤ[0]` are `0`, `ℤ[0]`; both contradict `ℤ[0] → (ℤ/2)[0]` | `HasColimit` needed | carried |
| unbounded torsion (§1.5) | `A = ℤ_p ⋉ ℚ_p/ℤ_p`, `I = (p)` | Koszul `H^{−1} = T[pⁿ]` (surjective `×p`), limits `ℤ_p`, `ℤ_p`; `Hom(C, R[1]) = Ext¹_A(A,R) = 0`, so non-split | Correct; Source issue | here |
| `IsPerfect`, `IsPseudoCoherent` | `A = k×k`, `eA` | perfect; Euler ranks `(1,0)` exclude bounded free; alternating `1−e`, `e` resolution | Correct | carried |
| closure laws | `cone(×2 on ℤ[0])`; retract | finite free two-term; summand (StacksMA 76.5) | Correct | carried |
| `ringTowerLimit_jacobson` | `k[t]/t^{n+1}`; `k[x_i]/(x_i²)` | `1+t` invertible; locally nilpotent kernel, `x₁⋯x_r ≠ 0` | True | carried |
| `pseudoCoherent_residueCriterion` | `[k[[t]] →t k[[t]]]`; zero ring | fibre `[k →0 k]` in `[−1,0]`; no fields, all modules `0` | True | here |
| effectivity | `A_n = k[t]/tⁿ`, `M_n = [A_n →t A_n]` | `H^{−1}(M_n) = (t^{n−1}) ≅ k`, zero transitions; limit `H^{−1} = 0` | Derived reduction needed | here |
| Matlis biduality | `ℤ_p`, `E = ℚ_p/ℤ_p`; `k[x]_{(x)}`; `R = k`, `⊕k` | `D(E) = ℤ_p`; `End(E) = k[[x]] ≠ R`; `D(⊕k) = ∏k`, evaluation not onto | Hypotheses needed | carried |
| Roby, augmentation, `Γ^d` Checks | `γ₁(1)² = 2γ₂(1)`; `F₂`; `M = ℤ/2` | `γ₂(1) ≠ 0` while the square is `0` over `F₂`; `Γ²(ℤ/2) = ℤ/4` | Checks correct | carried |
| full cotangent complex | `ℤ → ℤ/2`; `k[ε]`, char 2 | `H^{−1} = ℤ/2`; zero differential, `H^{−1} = H⁰ = B` | Correct | carried |
| exterior / divided powers | flat line over `F₂`; `F_p e` | `∧² = 0`, signed coinvariants give `F₂`; `γ_p(e) ≠ 0`, `e^p = 0` | Alternating quotient needed | here |

No restriction to good primes, flat inputs or finite residue fields is introduced. The computations cover the zero ring, the unit and zero ideals, characteristic 2, non-flat modules, noncommutative coefficient rings (towers, perfectness) and unbounded towers.

## Not verifiable

- NSW, Proposition 2.1.1 and Lemma 2.2.4 (cited in §S.1 and in the docstring of `nonempty_bicomplexSecondPageIso`). Through the sources service, the author-page link returns the book's landing page, not the chapter. The second-page identification was instead computed against Tau Ceti's indexing (table rows above).
- IllusieCC, Chapter II, 1.2.6.2 (§0.9): a Springer volume with no open copy. It is outside the seeded sample.
- Ownership against the open pull requests closest in vocabulary was checked only with `roadmaps grep`, for the objects these findings name: DerivedDeRhamCohomology (#868), EnhancedDerivedSheaves (#1630, #1187), CrystallineCohomology (#857) and PrismaticCohomology (#1057). The brief gives no checkout for these.

## Source issues

- **Error** in SAG at Construction 25.2.2.2, p.1700 (repeated in Proposition 25.2.3.4(2), p.1703): the source takes the exterior power to be the tensor power modulo signed permutations and asserts the usual free basis; it should be the quotient by the alternating relations including `x⊗x`, since for a free rank-one module over a ring where 2 is not invertible signed coinvariants give `A/2A`; affects a stated result.
- **Gap** in StacksMA at the opening example of §15.96, Tag 0BKH, printed p.275: the source says the derived completion of `A = ℤ_p ⊕ ℚ_p/ℤ_p` at `(p)` is `ℤ_p[1] ⊕ ℤ_p[0]`, with the computation omitted; it should say this splitting holds only after restriction to `D(ℤ_p)`, since in `D(A)` every map from the completion to `ℤ_p[1]` vanishes; affects a stated result.
