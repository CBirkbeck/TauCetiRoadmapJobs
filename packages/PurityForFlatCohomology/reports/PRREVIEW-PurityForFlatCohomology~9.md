# Review of PurityForFlatCohomology (pull request #1840 at adbbf28)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/PurityForFlatCohomology/`: `README.md` (3291 lines) and `Suggested.lean` (295 lines, 15 declarations). The gate passes and the dependency check shows no problem. There are four findings:
- R01 and R02 (P2) block;
- R03 and R04 are P3.

Of the previous review's findings, R01, R02, R04, R05 and R06 are repaired. R03 is not, because its repair lies in two other roadmaps; it is R02 below.

## R01 (P2) — Česnavičius's Brauer purity and CS24 Theorem 1.1.4 are statable at the pins but absent; the docstring's reason is inaccurate

**Location.**
- `Suggested.lean` lines 71–75 give the reason: "there is no Brauer group of Azumaya algebras on a scheme and no sheaf `𝔾_m` on the small étale site, so no étale cohomology of `𝔾_m` with restriction maps".
- The targets are README §8.1 (line 2837), §8.7 (line 2942) and the `𝔾_m` clause of §7.14(b) (lines 2753–2754), plus the headline paragraph (lines 46–61).

**Claim.**
- The pinned Tau Ceti has the big-site sheaf `AlgebraicGeometry.Scheme.Gm S : Sheaf (fpqcTopology.over S) AddCommGrpCat`.
- Restricting it along `Scheme.Etale.forget S` and sheafifying on `S.smallEtaleTopology` gives the étale `𝔾_m`. The pin has the `HasSheafify` instance there, and the restriction is already an étale sheaf, so sheafification changes it only up to isomorphism.
- `Sheaf.cohomologyPresheaf` then gives `H^i_ét(−, 𝔾_m)` with restriction along open immersions. Three headlines become statable in exactly the generality of their sources:
  - [C19] Theorem 1.3 (§8.1);
  - [C19] Theorem 1.1 (§8.7);
  - [CS24] Theorem 1.1.4 (CS24 line 122), the torsion-`H²` purity for `𝔾_m` that §7.14(b) records.
- The Summary (lines 16–19) and Layer 8 name them as end theorems. They are not weakened stand-ins: both C19 theorems are about `𝔾_m` itself.

**Witness.** The block below, placed in a scratch copy of `Suggested.lean` with the extra import, elaborates with 13 `sorry` warnings and nothing else. Tau Ceti `TauCeti/AlgebraicGeometry/Sites/Big/StructureSheaf.lean` line 126 defines `Gm`.

**Repair.**

1. Add `public import TauCeti.AlgebraicGeometry.Sites.Big.StructureSheaf`.
2. After `picard_globalCompleteIntersection_bijective_zpow` (Layer 7), add `openEtaleHom`, `gmSmallEtale` and the CS24 1.1.4 theorem. Under a new `/-! ## Layer 8: Purity for the Brauer group and for tori on regular schemes -/`, add the two C19 theorems. Give each declaration a full docstring.

   ```lean
   def openEtaleHom {X : Scheme.{u}} (U : X.Opens) :
       Scheme.Etale.mk U.ι ⟶ Scheme.Etale.mk (𝟙 X) :=
     (Scheme.Etale.forget _).preimage (Over.homMk U.ι (by simp))

   def gmSmallEtale (S : Scheme.{u}) : Sheaf S.smallEtaleTopology AddCommGrpCat.{u} :=
     (presheafToSheaf S.smallEtaleTopology AddCommGrpCat.{u}).obj
       ((Scheme.Etale.forget S).op ⋙ (Scheme.Gm S).obj)

   theorem etaleCohomology_two_gm_torsion_purity (X : Scheme.{u}) [IsNoetherian X] (U : X.Opens)
       (hZ : ∀ z : X, z ∉ U →
         (IsCompleteIntersection (X.presheaf.stalk z) ∧ 4 ≤ ringKrullDim (X.presheaf.stalk z)) ∨
         (IsRegularLocalRing (X.presheaf.stalk z) ∧ 2 ≤ ringKrullDim (X.presheaf.stalk z))) :
       (∀ x, IsOfFinAddOrder x →
           ((gmSmallEtale X).cohomologyPresheaf 2).map (openEtaleHom U).op x = 0 → x = 0) ∧
         ∀ y, IsOfFinAddOrder y → ∃ x, IsOfFinAddOrder x ∧
           ((gmSmallEtale X).cohomologyPresheaf 2).map (openEtaleHom U).op x = y := by
     sorry

   theorem etaleCohomology_two_gm_puncturedSpectrum_subsingleton (R : Type u) [CommRing R]
       [IsRegularLocalRing R] [HenselianLocalRing R] [IsSepClosed (IsLocalRing.ResidueField R)]
       (h : 2 ≤ ringKrullDim R) :
       Subsingleton (((gmSmallEtale (Spec (CommRingCat.of R))).cohomologyPresheaf 2).obj
         (Opposite.op (Scheme.Etale.mk (TauCeti.IsLocalRing.puncturedSpectrum R).ι))) := by
     sorry

   theorem etaleCohomology_gm_purity_regular (X : Scheme.{u}) [IsLocallyNoetherian X] (U : X.Opens)
       (hZ : ∀ z : X, z ∉ U → IsRegularLocalRing (X.presheaf.stalk z) ∧
         2 ≤ ringKrullDim (X.presheaf.stalk z)) :
       Function.Bijective (((gmSmallEtale X).cohomologyPresheaf 2).map (openEtaleHom U).op) ∧
         Function.Injective (((gmSmallEtale X).cohomologyPresheaf 3).map (openEtaleHom U).op) := by
     sorry
   ```

3. Rewrite the docstring item (lines 71–75). Keep as not statable:
   - [CS24] Theorem 7.2.5 (§7.12): no Azumaya Brauer group of a scheme;
   - [C19] Theorem 1.2 and the residue sequences (§§8.10, 8.16): `Spec 𝒪_{X,x} → X` and `Spec K → X` are not morphisms of the small étale site of `X`, and the pins have no pullback of small-étale cohomology along them;
   - [CS24] Theorems 7.2.8–7.2.9 and [C19] Theorems 1.4 and 6.1 for a general `T` (lines 76–80): groups of multiplicative type over a base.

   Add the three new statements to the stated list (lines 22–38), and add `𝔾_m` as a definition the file needs (lines 15–20).
4. In the README:
   - name the new declarations in §8.1, §8.7 and §7.14(b) and in the headline paragraph (lines 46–61);
   - in §8.1, say that `gmSmallEtale` is the Lean form of SchemeAndStackFoundations §2.9's `GmEtale`, as §1.1 does for `IsCompleteIntersection`, and that the sheafification map is an isomorphism (`Gm_restrict_small` there);
   - add the Tau Ceti contract entry of R03.

**Tested.**
- [C19] Theorem 1.3 (C19 line 48) requires strictly henselian regular `R` of dimension `≥ 2`. A strictly henselian discrete valuation ring is excluded by `h`. It must be: for `k⟦t⟧` with `k` separably closed and imperfect, `H²(k((t)), 𝔾_m)[p] ≠ 0` (§8.14 Checks).
- [C19] Theorem 1.1 (C19 line 30):
  - with `U = ⊤` the hypothesis is vacuous and both maps are identities;
  - with `U` the complement of the coordinate axes in `𝔸²_ℂ`, the generic points of the axes have local rings of dimension 1 and are excluded, as §8.18 requires.
- [CS24] Theorem 1.1.4 (CS24 lines 122–125):
  - the node `k⟦x,y,z,w⟧/(xy − zw)` has dimension 3 and is excluded;
  - the Segre example of §7.12 Checks (dimension 4) satisfies it with torsion groups `0 = 0`, although `H²(U_R, 𝔾_m) ≠ 0`. This is consistent with a claim that concerns torsion only.
  - On a Noetherian `X`, "killed by a locally constant function" is `IsOfFinAddOrder`, because there are finitely many components.

## R02 (P2) — Local duality, local Lefschetz, Layer 3 and §7.10 each still have two owners

This is still open from the previous review's R03. Nothing in this folder needs to change.

**Location.**
- README lines 179–191: "Two roadmaps later in the merge order plan statements of this roadmap; each is owned here".
- Downstream consumers, lines 3181–3187.

**Claim.**
- This roadmap owns:
  - §1.4(a)–(c), local étale duality on excellent regular local rings;
  - §1.5, the local Lefschetz theorem;
  - Layer 3: supports, finite-ideal excision and fpqc hyperdescent of animated flat cohomology;
  - §7.10, the ample Brauer comparison.
- At their current heads, two later roadmaps still claim these objects and say that this roadmap imports them:
  - EtaleDualityAndPerverseSheavesPartII (open pull request #1743, `ORDER.txt` line 386);
  - the SchemeAndStackFoundationsPartII board package (line 254).
- This roadmap (line 218) cannot import from either, so each object has two owners.
- No earlier roadmap owns them: EtaleDualityAndPerverseSheaves (line 107) treats bases of dimension `≤ 1` only, and `roadmaps grep` finds no other owner of Gabber's affine Lefschetz theorem.

**Witness.**
- EtaleDualityAndPerverseSheavesPartII `README.md` line 23 (#1743 head 7fede29): "PurityForFlatCohomology takes the local Lefschetz theorem from §7.3 … and owns none of these statements". Its line 1586 repeats this.
- SchemeAndStackFoundationsPartII package `README.md` line 1055: "PurityForFlatCohomology uses … finite-ideal excision, adic hyperdescent and the ample Brauer comparison".

**Repair.** Before either roadmap merges:
- In #1743:
  - replace lines 23 and 1586 by imports of PurityForFlatCohomology §§1.4–1.5;
  - turn its §6.11, §6.12, §7.1 and §7.3 into citations wherever they restate §1.4(a)–(c) or §1.5.
- In the SchemeAndStackFoundationsPartII package, make line 1055 and the corresponding targets cite Layer 3 and §7.10 here.

The text of this folder (lines 179–191 and 3181–3187) is already the correct side.

**Tested.** I compared the hypotheses pair by pair:
- strictly henselian excellent regular local ring, `ℓ` invertible: §1.4 here against #1743 §§6.11–6.12 and §7.1;
- `f ∈ 𝔪`: §1.5 here against #1743 §7.3.

The statements coincide.

## R03 (P3) — Objects of the pinned Tau Ceti are cited only through roadmaps

**Location.**
- README line 489 (contract): "§2.9 `Ga`, `Gm`, `mu`, `powHom`, `mu_eq_ker_pow`, `bigSheaf_isSheaf`".
- §7.12a API, lines 2431–2432: "`D_S(ℤ)` represents SchemeAndStackFoundations §2.9's `Gm S`, … its `mu S n` … its `powHom S n`".
- §7.12b API, line 2522: "`mu_eq_ker_pow` of §2.9 there".
- Scope, line 112: "*Strict henselization and its completion*: ModularCurves Layer 4D".

**Claim.** These objects exist at the pinned Tau Ceti, and the "From Tau Ceti" contract (lines 319–466) lists none of them:
- `AlgebraicGeometry.Scheme.bigStructureSheaf`, `Ga`, `Gm`, `mu` (every `n`), `powHom` and `isLimitMuKernelFork` (`μ_n` is the kernel of `powHom`), with `CategoryTheory.GrothendieckTopology.isSheaf_Γ`;
- `TauCeti.StrictHenselization.algebra` and `TauCeti.Henselization.algebra`.

What exists at the pin is cited in the contracts by its exact name and file.

**Witness.**
- `#check @AlgebraicGeometry.Scheme.Gm` gives `(S : Scheme) → Sheaf (fpqcTopology.over S) AddCommGrpCat` (`TauCeti/AlgebraicGeometry/Sites/Big/StructureSheaf.lean` line 126); `mu` is at line 202 and `isLimitMuKernelFork` at line 230.
- `TauCeti/RingTheory/StrictHenselization/Algebra.lean` line 75.

**Repair.**
- Add a "From Tau Ceti" bullet:
  - the six `AlgebraicGeometry.Scheme.*` names and `CategoryTheory.GrothendieckTopology.isSheaf_Γ` (`TauCeti/AlgebraicGeometry/Sites/Big/StructureSheaf.lean`): `𝔾_a`, `𝔾_m` and `μ_n` (every `n`) on the big fpqc site over `S`, the power map, and `μ_n` as its kernel;
  - `TauCeti.StrictHenselization.algebra` and `TauCeti.Henselization.algebra` (`TauCeti/RingTheory/StrictHenselization/Algebra.lean`, `TauCeti/RingTheory/Henselization/Algebra.lean`).
- In §7.12a, write `AlgebraicGeometry.Scheme.Gm S`, `AlgebraicGeometry.Scheme.mu S n` and `AlgebraicGeometry.Scheme.powHom S n`.
- In §7.12b, write `AlgebraicGeometry.Scheme.isLimitMuKernelFork`.
- Keep SchemeAndStackFoundations §2.9 for `bigSheaf`, `bigSheaf_isSheaf` and `GmEtale`, and ModularCurves 4D for the completion clauses.

**Tested.** The six `AlgebraicGeometry.Scheme.*` names `#check` at the pin. I read `isSheaf_Γ` (`StructureSheaf.lean` line 72) and the two henselization algebras (`StrictHenselization/Algebra.lean` line 75, `Henselization/Algebra.lean` line 43) in the pinned source.

## R04 (P3) — §5.8: the passage to `(A′/p)_red` is not §3.3, and the *Needs* line omits the deformation fibre sequence

**Location.** README lines 1793–1797: "for `p`-power order use §3.4, pass from `A′/^L pⁿ` to `A′/^L p` by §3.3 and to `(A′/p)_red`, … and conclude by §2.1 and §5.3". *Needs* (line 1797): "§§2.1, 3.3–3.5, 5.3; …".

**Claim.**
- §3.3 compares cohomology groups degree by degree, in a range: surjective for `i ≥ 1` and bijective for `i ≥ 2` for finite locally free `G`. That does not carry hyperdescent from one functor to the other, because the fibre in degrees `≤ 1` is nonzero.
- [CS24] proves this step another way (CS24 lines 2873–2886):
  - it applies the deformation fibre sequence (Theorem 5.2.8) along `A′/^L π^{1/p^{n+1}} → A′/^L π^{1/p^n}`;
  - it uses hyperdescent of `A′ ↦ A′/^L π^{1/p^n}` (Lemma 4.2.6, carried by §5.3 here);
  - it passes to the colimit, which is `(A′/p)_red` by (2.1.2.3) and (2.1.3.2).
- PrismaticCohomologyPartIII §6.0, the supplier of the deformation fibre sequence, is missing from the §5.8 *Needs* and from the Layer 5 Dependencies (line 1853).

**Witness.** For `A′ = 𝒪_C` and `G = μ_p`:
- `μ_p(𝒪_C/p) = 1 + p^{1/p}𝒪_C/p ≠ 1`;
- `(𝒪_C/p)_red = k̄`, so `μ_p(k̄) = 1`.

So `RΓ(A′/p, μ_p) → RΓ((A′/p)_red, μ_p)` has a nonzero fibre in degree 0, which §3.3 says nothing about.

**Repair.**
- Replace the sentence by: "for `p`-power order use §3.4 to pass to `A′ ↦ RΓ(A′/^L pⁿ, G)`. Choose a unit multiple `π` of `p` with compatible `p`-power roots. The deformation fibre sequence of PrismaticCohomologyPartIII §6.0, along the square-zero extensions `A′/^L p^{n} → A′/^L p^{n−1}` and `A′/^L π^{1/p^{m+1}} → A′/^L π^{1/p^m}`, identifies the fibres of the hyperdescent comparison maps. Their cotangent terms satisfy hyperdescent by §5.3 ([CS24] Lemma 4.2.6). Then `colim_m A′/^L π^{1/p^m} ≅ (A′/p)_red`, a perfect `𝔽_p`-algebra (PerfectoidQuotients §0.1; [CS24] (2.1.2.3), (2.1.3.2)), and §2.1 and §5.3 conclude ([CS24] proof of Theorem 5.5.1, pp. 68–69)."
- In the §5.8 *Needs*, replace "3.3–3.5" by "3.4–3.5; PrismaticCohomologyPartIII §6.0 (the deformation fibre sequence)".
- Add PrismaticCohomologyPartIII §6.0 to the Layer 5 Dependencies.

**Tested.** The replacement follows CS24 lines 2873–2891 step by step. Each input now has an owner: §3.4, §5.3, PrismaticCohomologyPartIII §6.0 (`roadmaps show`, #1070 head 057c513, `### 6.0` present), and PerfectoidQuotients §0.1 (#1042).

## Previous findings (PRREVIEW~8, head 08c5cf2)

- **R01 (P1, GroupSchemesOverABase) — repaired.**
  - `grep -c GroupSchemesOverABase` gives 0 in both files.
  - §§7.12a–7.12e are owned again (lines 2391–2705). Lines 193–197 read "are likewise owned here".
  - The Mathlib and Tau Ceti contract entries are restored (lines 294–313, 337–375).
  - "[CS24] §7.2, p. 91" occurs 0 times.
  - `Suggested.lean` line 80 reads "(README §7.12c defines them)".
- **R02 (P2, constant étale-depth bound) — repaired.**
  - `etaleDepth_ge_virtualDimension` and `puncturedSpectrumEtaleHom` are at `Suggested.lean` lines 173–197.
  - README §6.3 (lines 1923–1930) and the headline paragraph (lines 51–53) name them.
  - The docstring item (lines 42–44) names the missing functor for non-constant `G`.
- **R03 (P2, two owners) — not repaired; R02 above.** The other two roadmaps are unchanged.
- **R04 (P3, gerbes) — repaired.**
  - §7.3 (lines 2088–2091) reads "Gerbes are AlgebraicModuliForArithmeticGeometry §4.1's `IsGerbe`".
  - The contract is at lines 516–523, the Scope at lines 110–111, the *Needs* of §§7.3 and 7.10 at lines 2103 and 2318, and the Layer 7 Dependencies at line 2807.
  - "SchemeAndStackFoundations §1.18" no longer occurs for gerbes.
- **R05 (P3, LocalPurity §1.1) — repaired.** Lines 89–96 no longer cite §1.1 (0 occurrences).
- **R06 (P3, *Needs*) — repaired.**
  - The §3.3 *Needs* (line 1390) reads "§§0.3 (continuity of flat cohomology), 3.2".
  - The §7.12 route (lines 2365–2367) reads "§7.6 for regular `R`; §7.5, from DeformationAndDerivedPatchingAlgebra §6.9, for complete intersections of dimension `≥ 4`"; the *Needs* is at line 2371.

## Verified sound

### Gate, dependency check, build and diff

- **Gate rerun.** Every check is `0`, ending "OK".
- **Dependency check.** `gate --depcheck … --movable` prints `depcheck: 238 roadmaps, 2322 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. The positions in `ORDER.txt` are: this roadmap 218; its suppliers DerivedDeRhamCohomology 22, AlgebraicModuliForArithmeticGeometry 34, DeformationAndDerivedPatchingAlgebra 78, PrismaticCohomologyPartII/III 83/84, PerfectoidQuotientsPartII 217; its consumers SchemeAndStackFoundationsPartII 254, EtaleDualityAndPerverseSheavesPartII 386.
- **Build.** `lake env lean TauCetiRoadmap/PurityForFlatCohomology/Suggested.lean` exits 0 with exactly 10 `declaration uses 'sorry'` warnings.
- **Diff.** The diff outside the folder is empty.
- **Pins.** `lake-manifest.json` pins Mathlib `1b1ccf4` and Tau Ceti `2fd255d`, matching README lines 247 and 321.

### Lean form

- **Signatures.** I ran `#check @…` on all 15 declarations in one scratch file and compared each elaborated type with its README statement (§§1.1, 1.8, 5.6, 6.3, 7.2, 7.4, 7.6, 7.8). All match. There are no section `variable`s, so no binder is lost. I changed nothing.
- **One-tactic probe.** Replacing each `sorry` by `first | rfl | infer_instance | decide | trivial | exact inferInstance | simp | aesop` gives 10 errors and 0 closures, so there is no padding.
- **Form.** There is no `lemma`, `set_option`, `#eval` or `True`. The file has one `import Mathlib` and six existing `TauCeti.*` modules, docstrings everywhere, and Layer comments in README order.

### Headline theorems

The README's headlines, and their status in `Suggested.lean`:
- Stated: [CS24] 3.3.1(a)(b), 6.2.4 for `ℤ/n` (3.2.4 for invertible `n`), 7.2.1 (both clauses) and 7.2.3 (both clauses); Katz, Auslander and factoriality.
- Statable but absent: [C19] 1.1 and 1.3 and [CS24] 1.1.4 (R01).
- Named as not statable, correctly:
  - [CS24] 6.2.3, 6.2.7 and 7.1.2 (fppf with supports);
  - 6.2.4 for non-constant `G` (Mathlib's `yonedaCommGrpGrpObj` is only on `(Grp C)ᵒᵖ`, so there is no `Cᵒᵖ ⥤ CommGrpCat` for a group scheme);
  - 4.1.8, Layer 3, 5.5.1 and 6.1.1–6.1.2;
  - 7.1.3 (no restriction of `Sheaf.Torsor` along morphisms of sites);
  - 7.2.5 (Azumaya Brauer group);
  - 7.2.8–7.2.9 for general `T`, and [C19] 1.2, 1.4 and 6.1 (the pins have no pullback functor between small étale sites).

### Library declarations opened at the pin

- **Tau Ceti.** All 55 `TauCeti.*` names the README backticks, and 17 more (`HomogeneousIdeal.quotientGrading`, `mk_X_mem_quotientGrading`, `iSup_basicOpen_eq_top`, `Proj.twistingSheaf`, `isInvertible_twistingSheaf_of_iSup_eq_top`, `lineBundleClass_twistingSheaf_eq_zpow`, `ModuleCat.projectiveDimension_add_depth_eq_depth`, `…_le_ringKrullDim`, `Module.IsCohenMacaulay`, `CategoryTheory.Sheaf.Torsor`, `Sheaf.NonabelianH1` and the six of R03), `#check` with 0 errors. One module (`DiagonalizableGroup/Scheme/MultiplicativeType`) and one other (`Sites/Big/StructureSheaf`) were built first with `lake build`.
- **Hypotheses read.**
  - `schemeFunctor_full` needs `[ConnectedSpace (PrimeSpectrum R)]`;
  - `schemeFunctor_faithful` needs `[Nontrivial R]`;
  - `smooth_iff_isUnit_card` is over a field with `[Finite G]`;
  - `restrictPunctured_faithful_iff` states `↔ 0 < ringKrullDim R`.

  These are as README lines 340–370 and 1204 state.
- **Mathlib.** 49 names `#check` with 0 errors, among them: `Scheme.etalePrecoverage`, `fppfPrecoverage`, `fpqcPrecoverage`, `Scheme.Hom.fiber`, `specULiftZIsTerminal`, `Over.pullbackId`/`Comp`, `Functor.mapGrpIdIso`/`CompIso`, `IsCommMonObj`, `hopfSpec`, `yonedaGrpObj`, `GrothendieckTopology.subcanonical_over`, `CommGroup.torsion`, `IsMulTorsionFree`, `Order.krullDim_eq_bot`, `IsRegularRing.isRegularLocalRing_localization`, `Scheme.Etale.forget`, `isGrothendieckAbelian_sheaf_smallEtaleTopology`, `HenselianLocalRing`. `IsQuasiAffine` extends `CompactSpace X` (`AlgebraicGeometry/QuasiAffine.lean` line 34), as §7.10 says.

### Seeded sample of sources (all 15 targets)

| Target | Checked against | Result |
|---|---|---|
| 0.4 | CS24 Prop. 4.1.13 proof (lines 1663–1670, p. 40); Thm 6.1.2 proof (lines 3463–3472, pp. 82–83) | matches; decreasing induction on a regular sequence |
| 1.4 | CS24 Lemma 3.2.3 proof (lines 1361–1380, p. 33); ILO14 XV Cor. 1.2.4 (line 10362, p. 220); XVII Thm 0.9 of arXiv v1 (line 12220); XVI Thm 3.1.1 (line 11520) | matches; SGA 4 XVIII and SGA 5 I are uncertified |
| 3.4 | CS24 Thm 5.3.5 (line 2444, p. 59); Cor. 5.3.7 (lines 2537–2556, p. 61); Cor. 5.3.8 (lines 2560–2582, pp. 61–62) | matches, both `p`-henselian hypotheses kept |
| 4.1 | CS24 Ex. 4.1.10 (lines 1598–1603, p. 39) | matches |
| 4.3 | CS24 Lemma 4.1.12 (lines 1636–1650, p. 40) | matches; dropping `n < dim R` is justified by the proof (Source issues) |
| 5.8 | CS24 Thm 5.5.1 (lines 2849–2891, pp. 68–69); Thm 1.2.3 (line 220, p. 6) | statement matches; route R04 |
| 6.2 | CS24 Thm 6.2.3 (lines 3491–3538, pp. 83–84), footnote 25 (line 3542); Thm 1.1.1 (line 66) | matches |
| 7.9 | Gro66 Lemme 1.1 (line 101, p. 290), Prop. 1.4 (line 129, p. 291), Lemme 1.6 (line 150, p. 292), Cor. 1.8, Lemme 1.9 (lines 161–167, p. 293); C19 Lemma 3.2 (line 248, p. 7); CS24 line 3889 | matches; PDF page 2 is printed p. 287 |
| 7.10 | dJ02 Thm 1.1 (lines 8–11): ample `L` per EGA II 4.5.3; CS24 lines 3770–3772 | matches |
| 7.12a | SGA 3 VIII (uncertified); Tau Ceti `DiagonalizableGroup.*` at the pin | Tau Ceti side matches; SGA 3 under Not verifiable |
| 7.12b | EGA IV 17.5.1 (EGA44 line 2493); SGA 3 VIII 2.1, 3.1, 3.2 (uncertified) | EGA matches; criteria recomputed below |
| 7.15 | CS24 Thm 7.2.9 (lines 3871–3893, pp. 92–93), footnote 28 (line 3882) | matches, route included |
| 8.8 | C19 Thm 6.2 (6.2.1) (line 522, p. 13); Remark 6.3 (line 537, p. 14) | matches |
| 8.9 | C19 Thm 6.2 and proof (6.2.2) (lines 520–535, pp. 13–14) | matches |
| 8.12 | C19 (6.3.3) (lines 543–550, p. 14); CTS87 Lemma 2.4 (line 605, p. 164) | matches |

The README flags no locator as unverified.

Also checked:
- CS24: Thm 7.2.1, Cor. 7.2.3, Remarks 7.2.2, 7.2.4 and 7.2.6, Thm 7.2.5, Lemma 7.2.7, Thm 7.2.8 with footnotes 26–27 (lines 3707–3869), and Examples 4.1.2/4.2.2 (lines 1495–1499, 1694–1697).
- CTS87: §0.5 (p. 155), Def. 1.2 (p. 157) and Thm 2.2(ii) (p. 161).
- C19: Thms 1.1–1.3 (lines 30–49), Thm 6.1 (line 493), Remark 6.4 (line 551), Cor. 2.4 (line 172) and Lemma A.2 (line 574).
- EGA IV 21.13.7–21.13.9 (p. 316, EGA44 lines 13005–13024).

### Cross-roadmap citations resolved

**Main (a169c04).**
- SchemeAndStackFoundations: all 26 cited sections (headings at lines 551–5383) and 34 backticked names (31 counted by `grep`; `Ga`, `Gm`, `mu` read in §2.9).
- LocalPurity §§1.3, 2.1, 2.2 (lines 218, 259, 302; also at #1854).
- ModularCurves 0B, 0E, 4D (lines 688, 839, 1882; also at #1808).
- EtaleCohomologyFoundations F.0.2, F.0.4, F.5.
- DerivedModuleAlgebra 0.K.1, 0.4, 0.25, 1.5, 1.7.
- EnhancedDerivedSheaves E5:animation.1–4.
- PerfectoidSpaces: 9 sections and 4 italic targets.

**Open heads.**
- AlgebraicModuliForArithmeticGeometry §§4.1–4.3 with `IsGerbe`, `AbelianBanding`, `classifyingAbelianGerbe`, `h2Classification` (#853, lines 1873–2248).
- PrismaticCohomologyPartIII §6.0 with its 3 names (#1070).
- DerivedDeRhamCohomology §§0.19, 0.21, 1.10 with its 3 names (#868).
- DeformationAndDerivedPatchingAlgebra §§3.4, 6.9, `localCI_parafactorial` (#1034).
- PrismaticCohomology §2.0 (#1057).
- PrismaticCohomologyPartII Layer 4 (#1065).
- PerfectoidQuotients §§0.1, 0.2, 0.6 with its 4 names (#1042).
- FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.40, R07.1.41, R07.2.8 (#879).
- ArithmeticGaloisDuality §R02.2.4 (#858).
- LefschetzPencilsAndVanishingCycles §0.10 (#873).
- MotivesAndAlgebraicCycles §0.5b (#1313). It is cited only to delimit scope, not as a supply edge.

**Board package.** PerfectoidQuotientsPartII §§Q5.2, Q5.4, Q6.3–Q6.7, Q7.1, Q7.3, Q10.1 (package lines 382–1395).

**Resolver leads.** The 7 leads are false positives: one names a board package, and six are roadmap names, all found above.

### Declared gaps

`plan.json` has `prismatic-dieudonne-perfectoid` (PrismaticCohomologyPartII Layer 4), `ci-defect-additivity` (DerivedDeRhamCohomology §0.21) and `regular-tower-tilt` (PerfectoidQuotientsPartII §Q10.1). They appear at README lines 639, 545 and 620. Each is still minimal:
- §0.21 at #868 states Avramov's criterion, not additivity;
- PrismaticCohomologyPartII cites ALB23 only for Nygaard and prism results;
- §Q10.1 computes no tilt.

### Ownership against open work

- I read #1743 at its sibling checkout, LocalPurity at #1854 and ModularCurves at #1808 with `roadmaps show`, and the SchemeAndStackFoundationsPartII and PerfectoidQuotientsPartII board packages. `roadmaps grep` for Gabber's affine Lefschetz theorem and local duality found no other owner.
- The only two-owner objects are those of R02.
- #1522 (GroupSchemesOverABase) is on the dropped-names list, so §§7.12a–7.12e being owned here is the policy. The README names it nowhere.
- No open pull request changes this roadmap, and none drops an id it cites (`overlaps.md`, checked).

### Adversarial table

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `virtualDimension`, `IsCompleteIntersection` (§1.1) | `k⟦x⟧ = k⟦x,y⟧/(y)`; `k⟦x,y⟧/(x,y)²`; `𝔽_p⟦x,y,z,t⟧/(x²,y²,xz−yt)`; valuation ring with `𝔪 = 𝔪²` | `2−1 = 1`; `2−3 = −1`; `4−3 = 1 < 2 = dim`; completion `R/𝔪`, every presentation gives `0` | presentation-independent; non-Noetherian value unused | none |
| §0.4 | `k[x,y]`, `Z` the origin; `Z = Spec A`, `d = 1` | `H⁰_Z = H¹_Z = 0`, `H²_Z ⊇ k·x⁻¹y⁻¹ ≠ 0`; `H⁰_Z(A) = A ≠ 0` | sharp; vanishing on `Z` needed | none |
| §1.4(c) | `d = 0`, separably closed `R`; `R = 𝔽₂`, `ℓ = 3`, `i = 1` | linear duality; `H¹(𝔽₂, ℤ/3) = ℤ/3` vs `0` | strict henselianity needed | none |
| §1.4 Check, `d = 1` | `K = j_!ℤ/ℓ` | dual of `H^{2−i}(L, μ_ℓ)`: `0, ℤ/ℓ, ℤ/ℓ(−1)`; same from the `j_!` sequence | consistent | none |
| `zariskiNagata_full_faithful_connected` | regular of dimension 2; `k⟦x,y⟧/(xy)` | vdim 2, `U` connected; vdim 1, two components | threshold needed | none |
| `zariskiNagata_isEquivalence` | `A_1`; node `xy − zw` | vdim 2, `π₁(U) = ℤ/2`; vdim 3, covers extend | sharp | none |
| `etaleDepth_ge_virtualDimension` | `k⟦x,y⟧/(xy)`, `i = 0`; field; `n = 1`; `𝔽_p⟦x,y,z,t⟧/(x²,y²,xz−yt)` | `ℤ/n ↪ (ℤ/n)²`, not onto; vdim 0, nothing claimed; `ZMod 1 = 0`, trivial; `R_red = 𝔽_p⟦z,t⟧`, `U` connected, `ℤ/p ≅ ℤ/p` | equivalent to `H^i_𝔪 = 0` for `i < vdim` by the long exact sequence | none |
| §3.4 (Cor. 5.3.7/5.3.8) | `𝔽_p(s)`; `ℤ_p`, `μ_{p^n}`; `ℤ → ℤ_p`, odd `p` | `H²(μ_p) = Br[p] ≠ 0`; `H² = 0`; `H¹ = 0` vs `ℤ/p` | perfectness and henselianity needed | none |
| §4.1 | `𝔽_p⟦x⟧/(x²)`; `𝔽_p⟦x,y⟧` | `x ∈ α_p(R)` killed by `𝔪`, depth 0; `H⁰ = H¹ = 0` | consistent | none |
| §4.3 | `R′ = R`; `k⟦t⟧ → k⟦t^{1/p}⟧` | tautology; tensor powers `k⟦s⟧[u]/(u−s)^p`, local CI of dimension 1 | consistent | none |
| §5.6 Katz (`frobeniusSemilinear_exists_fixed_basis`) | `M = 𝔽̄₂²`, `F(x,y) = (y²,x²)`; `𝔽₃(t)^perf`, `F = tφ` | fixed `(a,a²)`, `a ∈ 𝔽₄`, basis det `ω²−ω = 1`; `x² = 1/t` impossible | `IsAlgClosed` needed | none |
| §5.8 route | `A′ = 𝒪_C`, `μ_p` | `μ_p(𝒪_C/p) = 1+p^{1/p}𝒪_C/p ≠ 1 = μ_p(k̄)` | §3.3 insufficient | R04 |
| §6.2 | `W(k)⟦x,y⟧/(p−xy)`, `μ_p`; Veronese cone, `n = 3` | dimension 2, `H⁰ = H¹ = 0`; `H²_𝔪(μ₂) ⊇ ℤ/2` with `2 < 3` | CI needed | none |
| `free_of_endomorphisms_iso_pi` | `r = 0`; second syzygy `N` over `k⟦x,y,z⟧` | `End M = 0` gives `M = 0`; `pd k = 3`, so `N` is not free and no `End N ≅ Nʳ` exists | consistent | none |
| `localPicard_torsion_eq_one`, `…_subsingleton` | node; `A_1`; Veronese cone; field; DVR | `Pic(U) = ℤ`; excluded (`dim 2`), `ℤ/2`; not CI (vdim `6−6 = 0`); `U = ∅`; `U = Spec K` | hypotheses needed | none |
| `picard_globalCompleteIntersection_*` | quadric (`n = 3`, `c = 1`); plane cubic; `fs = [1]`; `ℙ³` | `ℤ²/ℤ(1,1) = ℤ`; `1+2 ≤ 2` false; positive degree excludes it; `Pic = ℤ` | matches CS24 lines 3737–3739 | none |
| §7.9 | DVR; `Spec K` | `Br R ↪ Br K`; identity | matches Gro66 1.4, 1.8 | none |
| §7.12 Checks (Segre) | `S` cone over `ℙ¹×ℙ¹` (dimension 3), `R = S^sh⟦x,y⟧/(xy)` | dimension 4, CI; `Br R = 0 = Br U`; nonzero `H²(U)` classes nontorsion | consistent with CS24 lines 3791–3793 | none |
| §7.12b | `ℤ → ℤ/2`; `0: ℤ → ℤ`; `2ℤ ⊂ ℤ`; `ℤ × ℤ/4` | kernel `D(0)` trivial; `D(ℤ) = 𝔾_m`; `t ↦ t²` with kernel `μ₂`; smooth over `ℤ[1/2]`, not over `ℤ`, never étale | consistent | none |
| §7.12a | `D_ℤ(ℤ/3)` fibres; `Spec(k×k)` | `ℚ×ℚ(ζ₃)`, `𝔽₂×𝔽₄`, `𝔽₃[t]/(t−1)³`, all of degree 3; locally constant `±1` | connectedness needed | none |
| §7.12e (b) Check | `V(2(t−1)) ⊂ μ₂/ℤ` | `Δ(2(t−1)) = 2((t−1)⊗t + 1⊗(t−1))`, counit 0, `S(t) = t`; trivial fibre over `ℚ`, all of `μ₂` over `𝔽₂` | Hopf ideal, not flat | none |
| §7.13(b) | `𝔾_m×μ_n`, `m = n`; `m = 1` | composite `(t,ζ) ↦ (t^n,1) = [n]`; `S = T`, not a torus | `m` must kill torsion | none |
| §7.15 | node, `d = 3` | `Pic(R) = 0` vs `Pic(U) = ℤ` | factoriality needed | none |
| §8.8–8.9 | `Res_{X′/X}𝔾_m`; `ℙ¹_ℝ` norm-one torus | Shapiro gives `H²(K, Res) = H²(K′, 𝔾_m)`; nonzero generically trivial class | hypothesis needed | none |
| §8.11 | `ℤ_sign`, `G = ℤ/2` | `Ext¹(ℤ_sign, ℤ) = H¹(G, ℤ_sign) = ℤ/2`; `Ext¹(ℤ_sign, ℤ[G]) = 0` | permutation modules needed | none |
| §8.12 | `H¹(ℝ, T)` | `ℝ^×/N(ℂ^×) = ℤ/2`; over `ℂ`, `Pic(𝔾_m) = 0` | consistent | none |
| Convention 6 | `𝕄(ℤ/p^n)`, `𝕄(μ_{p^n})` | `FV = φ(ξ)`, `VF = ξ` for both; `ξ = p` gives `(pφ, φ⁻¹)`, `(φ, pφ⁻¹)` | matches CS24 lines 1495–1499, 1694–1697 | none |
| Convention 8 | `(L/K, Frob, t)` vs `(L/K, Frob⁻¹, t)` | residues `χ`, `−χ`, inverse classes | sign pinned | none |
| R01 C19 1.3 | `k⟦x,y⟧`, `k` separably closed; strictly henselian DVR | `H²(U, 𝔾_m) = 0`; excluded, `Br(k((t)))[p] ≠ 0` | statable and true | R01 |
| R01 C19 1.1 | `U = ⊤`; complement of the axes in `𝔸²_ℂ` | identity maps; dimension-1 points excluded (§8.18) | statable | R01 |
| R01 CS24 1.1.4 | node; Segre `R` (dimension 4) | excluded; torsion groups `0 = 0` | statable | R01 |

## Not verifiable

- **SGA 3 VIII–X** (uncertified). These back §§7.12a–7.12e. I checked them only through the Tau Ceti affine statements and the computed Checks above.
- **[Aus62] Theorem 1.3** (uncertified). CS24 line 3684 cites it for every regular local ring. I could not check whether the printed statement assumes `R` unramified.
- **[DF84] Remark 3, [MB85] Lemme 2, [Bou78] V 4.9, [Gab04b], [Gro68], [Avr77] 3.6, [BH] 2.3.1, SGA 4 VII/X/XVIII, SGA 5 I** (all uncertified). I read them only through CS24 and C19.
- **[Koh72], [Kat73], [ALB23], [Lau13], [BS22], [BC22], [Čes15], [Bég80], [Poo17], [SGA1], [SGA2], [EGA2], [EGA42], [STACKS].** These are in the cache but outside the sample; I did not open them this round.

## Source issues

- **Error** in CS24 at Theorem 7.1.2, p. 87: the source says the regular clause needs dimension `≥ d − 1` (CS24 line 3632), which admits fields when `d = 1`; it should say dimension `≥ max(d − 1, 1)`, as `Spec k ⊔ Spec k` with `Z` one point shows; affects a stated result.
- **Misprint** in CS24 at the proofs of Theorems 7.2.1 and 7.2.5, pp. 89–90: the source says `n ≥ 0` for the Kummer step (lines 3726, 3774); it should say `n ≥ 1`; affects nothing.
- **Misprint** in CS24 at the proof of Theorem 3.3.1(b), p. 35: the source assumes `vdim(R_d) ≥ 3` (line 1453); it should say `vdim(R) ≥ 3`; affects nothing.
- **Misprint** in CS24 at the proof of Theorem 6.2.7, p. 85: the source writes `(p, x_1, …, x_n)²` with `d` variables (line 3578); it should say `(p, x_1, …, x_d)²`; affects nothing.
- **Gap** in CS24 at Lemma 4.1.12, p. 40: the source assumes `n < dim R` (line 1637), yet the proof of Theorem 6.2.7 applies it in degree `dim R` (lines 3576–3579); it should drop that hypothesis, which its proof (lines 1643–1650) never uses; affects the proof.
- **Gap** in CS24 at Remark 7.2.6, p. 90: the source calls the cone over an arbitrary elliptic curve a complete intersection (line 3781); it should restrict to a plane cubic or an intersection of two quadrics; affects nothing.
- **Gap** in C19 at Proposition 2.2, p. 4: the source infers injectivity on `H¹` for a possibly noncommutative `G` from a trivial-kernel argument (lines 140–146); it should assume `G` commutative or argue for all twists; affects nothing, since both uses have commutative `G`.
