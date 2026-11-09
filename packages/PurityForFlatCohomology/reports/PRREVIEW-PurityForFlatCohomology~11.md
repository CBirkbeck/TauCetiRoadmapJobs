# Review of PurityForFlatCohomology (pull request #1840 at ebfcd46)

**Verdict:** needs changes

## R01 (P2) — Two headlines are statable but missing: CS24 Theorem 6.2.4 for every finite étale `G`, and C19 Theorem 6.1 for tori

**Location.**
- `TauCetiRoadmap/PurityForFlatCohomology/Suggested.lean` lines 51–53 give the reason the general Theorem 6.2.4 is not stated: "the pins have no functor taking a commutative finite étale group scheme over `Spec R` to an abelian sheaf on the small étale site of `Spec R`".
- Lines 88–93 give the same reason for tori ("no functor from group schemes over `X` to abelian sheaves on the small étale or the big fppf site of `X`").
- `etaleDepth_ge_virtualDimension` (lines 191–209) is stated for `ZMod n` only.
- README §6.3 (lines 2003–2009) and §8.6 (lines 3050–3055) state the general results.

**Claim.**
- On the small étale site the missing construction is the one this file already uses for `𝔾_m` in `gmSmallEtale`: restrict `T ↦ Hom_S(T, G)` to the small étale site and sheafify. It is a short definition with a real body.
- With it, two headlines become statable:
  - CS24 Theorem 6.2.4, at the generality of README §6.3;
  - C19 Theorem 6.1 for tori, README §8.6. Tori are smooth, so their small-étale cohomology is the fppf cohomology the theorem is about (SchemeAndStackFoundations §2.10).
- So the docstring's reason fails for both, and each headline is statable but absent.

**Witness.**
- Mathlib `MonObj.comp_one` and `MonObj.comp_mul` (`Mathlib/CategoryTheory/Monoidal/Cartesian/Mon.lean` lines 436 and 440) and `Hom.commGroup` (`…/Cartesian/Grp.lean` line 310) make `T ↦ Additive (T ⟶ G)` a presheaf of abelian groups.
- Both statements below elaborate at the pins with `sorry` as the only warning.

**Repair.**
1. Add these definitions before `etaleDepth_ge_virtualDimension`, with `open MonObj` added to the file's `open` line:

```lean
/-- The presheaf `T ↦ Hom_S(T, G)` of abelian groups (written additively) for a commutative group
`G` over `S`. README §6.3. -/
def homPresheaf {S : Scheme.{u}} (G : Over S) [GrpObj G] [IsCommMonObj G] :
    (Over S)ᵒᵖ ⥤ AddCommGrpCat.{u} where
  obj T := AddCommGrpCat.of (Additive (T.unop ⟶ G))
  map f := AddCommGrpCat.ofHom
    { toFun := fun x ↦ Additive.ofMul (f.unop ≫ x.toMul)
      map_zero' := MonObj.comp_one f.unop
      map_add' := fun x y ↦ MonObj.comp_mul f.unop x.toMul y.toMul }
  map_id T := by
    refine AddCommGrpCat.hom_ext (AddMonoidHom.ext fun x ↦ ?_)
    exact congrArg Additive.ofMul (Category.id_comp (Additive.toMul x))
  map_comp f g := by
    refine AddCommGrpCat.hom_ext (AddMonoidHom.ext fun x ↦ ?_)
    exact congrArg Additive.ofMul (Category.assoc g.unop f.unop (Additive.toMul x))

/-- The abelian sheaf on the small étale site of `S` represented by a commutative group `G` over
`S`. README §6.3. -/
def smallEtaleSheaf {S : Scheme.{u}} (G : Over S) [GrpObj G] [IsCommMonObj G] :
    Sheaf S.smallEtaleTopology AddCommGrpCat.{u} :=
  (presheafToSheaf S.smallEtaleTopology AddCommGrpCat.{u}).obj
    ((Scheme.Etale.forget S).op ⋙ homPresheaf G)
```

2. Restate `etaleDepth_ge_virtualDimension` for every commutative finite étale `G`:
   - replace `(n : ℕ) [NeZero n]` by `(G : Over (Spec (CommRingCat.of R))) [GrpObj G] [IsCommMonObj G] [IsFinite G.hom] [Etale G.hom]`;
   - replace the constant sheaf by `smallEtaleSheaf G`;
   - make the constant case `G = (ℤ/n)_R` a Check of README §6.3.
3. Add to Layer 8 the torus predicate and C19 Theorem 6.1 (README §8.6), importing `TauCeti.Algebra.AlgebraicGroup.DiagonalizableGroup.Scheme.Basic` and `TauCeti.Algebra.AlgebraicGroup.Torus.Basic`:

```lean
/-- `T` is a torus: over the members `Spec Aᵢ → X` of a jointly surjective étale family it becomes
isomorphic to the split torus `Spec Aᵢ[ℤ^r]`. README §7.12c. -/
def IsTorus {X : Scheme.{u}} (T : Grp (Over X)) : Prop :=
  ∃ (I : Type u) (A : I → CommRingCat.{u}) (f : ∀ i, Spec (A i) ⟶ X),
    (∀ i, Etale (f i)) ∧ (∀ x : X, ∃ i, x ∈ Set.range (f i).base) ∧
    ∀ i, ∃ r : ℕ, Nonempty ((Over.pullback (f i)).mapGrp.obj T ≅
      TauCeti.DiagonalizableGroup.groupScheme (A i) (TauCeti.SplitTorus.characterGroup (ULift.{u} (Fin r))))

/-- Česnavičius, *Purity for the Brauer group*, Theorem 6.1. README §8.6. -/
theorem etaleCohomology_torus_purity (X : Scheme.{u}) (T : Grp (Over X)) [IsCommMonObj T.X]
    (hT : IsTorus T) (U : X.Opens) [QuasiCompact U.ι]
    (hZ : ∀ z : X, z ∉ U → IsRegularLocalRing (X.presheaf.stalk z) ∧
      2 ≤ ringKrullDim (X.presheaf.stalk z)) :
    (∀ q ≤ 2, Function.Bijective
      (((smallEtaleSheaf T.X).cohomologyPresheaf q).map (openEtaleHom U).op)) ∧
    Function.Injective (((smallEtaleSheaf T.X).cohomologyPresheaf 3).map (openEtaleHom U).op) := by
  sorry
```

4. In the module docstring:
   - Delete the first item (lines 51–53).
   - In the item on lines 88–93, give the real reason for CS24 Theorems 7.2.8–7.2.9 with general `T`. For a group of multiplicative type that is not smooth, small-étale cohomology is not fppf cohomology. For example, `μ_p` has only the trivial section over every reduced étale `V` in characteristic `p`. So `H¹_ét(𝔽_p⟦x⟧, μ_p) = 0`, while `H¹_fppf = R^×/R^{×p}` contains the nonzero class of `1 + x`. The fppf site has no `cohomologyPresheaf`.
   - For C19 Theorem 1.4 (§8.3), the only notion left missing is a field of dimension `≤ 1` (C19 Definition A.1). State the theorem if that predicate is short; otherwise name it as the missing carrier.
5. In the README, name the new declarations in §6.3, §8.6 and the headline list (lines 46–62).

**Tested.**
- Both blocks, with `virtualDimension` and `openEtaleHom` copied, elaborate under `lake env lean` from the worktree. `sorry` is the only warning, and there is no `set_option` or `haveI`.
- The general theorem restricts correctly in two cases:
  - for `G` trivial, the sheaf is `0` and both clauses hold;
  - for `G = (ℤ/n)_R = ⊔_{ℤ/n} Spec R`, `Hom(V, G)` is the locally constant functions `V → ℤ/n`, which recovers the present statement.
- `[Etale G.hom]` excludes `μ_p` over an `𝔽_p`-algebra.

## R02 (P2) — Groups of multiplicative type over a base also have an owner in ReductiveGroups (#1676)

**Location.**
- README Scope, lines 85–88 and 205–209.
- §§7.12a–7.12e, lines 2484–2800.
- Downstream consumers, lines 3315–3317: "A later roadmap on group schemes over a base is to import diagonalizable groups, groups of multiplicative type and tori over a base…".
- The README never names ReductiveGroups.

**Claim.**
- ReductiveGroups as revised at #1676 (head 7b018ef) now plans the same objects as its own theory over a base.
- This review's rules treat one object with two open owners as P2.
- ReductiveGroups on main treats these groups over a field only (main `ReductiveGroups/README.md` lines 434–437).

**Witness.** ReductiveGroups `README.md` at #1676 head 7b018ef:
- line 3741 cites "this layer's multiplicative-type theory over `S` (below)";
- lines 3797–3801 plan the anti-equivalence `H ↦ Hom_(S-gp)(H, 𝔾_m)` from `S`-groups of multiplicative type, which is §7.12d(b) here;
- line 3790 plans Conrad B.1.3, which is §7.12e(b) here.

**Repair.** This roadmap keeps ownership. #1676 revises a roadmap on main, so it is never a dependency: this folder cannot cite its Layer 9D. In this folder:
- In Scope, after line 209, add: "ReductiveGroups owns diagonalizable groups and groups of multiplicative type over a field (its Layer 4); their theory over an arbitrary base scheme (§§7.12a–7.12e) is owned here."
- In Downstream consumers, lines 3315–3317, replace "A later roadmap on group schemes over a base" with "ReductiveGroups, for its relative theory of reductive group schemes (étale-local splitting, the anti-equivalence with twisted constant sheaves, closed immersions from monomorphisms, subgroups of multiplicative type)".

Outside this folder, #1676 replaces its restatement by imports of §§7.12c–7.12e once this roadmap is on main, or narrows it to the field case.

**Tested.** The two statements compute the same object for the circle torus `x² + y² = 1`:
- §7.12d's Check, over `ℝ`, gives the character sheaf `ℤ` with conjugation acting by `−1`, with sections `0` over `ℝ` and `ℤ` over `ℂ`;
- #1676 line 3906, over `ℚ`, gives `ℤ` with `Gal(ℚ(i)/ℚ)` acting by `−1`.

## Previous findings (PRREVIEW~10, head 96339c0)

- **R01 (P1, GroupSchemesOverABase cited): repaired.**
  - Both files name GroupSchemesOverABase 0 times, and the gate reports `dropped=0`.
  - §§7.12a–7.12e are owned again (README lines 2484–2800).
  - `Suggested.lean` line 90 reads "(README §7.12c defines them)".
  - The folder equals 643f30e apart from the R03 repair.
  - The pull-request description no longer lists #1522, either under depends-on or in the merge-order chain.
- **R02 (P2, two owners with EtaleDualityAndPerverseSheavesPartII and SchemeAndStackFoundationsPartII): settled, not re-raised.**
  - The repair report (H02) says this roadmap is the single owner and that the repair lies in the two later roadmaps. That reason is correct:
    - `ORDER.txt` puts this roadmap at line 220, ahead of lines 256 and 388;
    - README lines 191–203 and 3308–3314 already tell both roadmaps to import.
  - The other side is unchanged:
    - #1743 at head c8b9b83, line 23, still says "…owns none of these statements";
    - the SchemeAndStackFoundationsPartII package, line 1055, is unchanged.
- **R03 (P3, `IsQuasiAffine`): repaired.**
  - Line 2403 reads "Mathlib's `AlgebraicGeometry.Scheme.IsQuasiAffine`, which extends `CompactSpace`".
  - A new contract bullet (lines 321–326) cites `Mathlib/AlgebraicGeometry/QuasiAffine.lean`: line 29 opens `namespace AlgebraicGeometry.Scheme`, and lines 34–35 declare the class (`extends CompactSpace X, IsImmersion X.toSpecΓ`).
  - The added locator, [EGA2] Proposition 5.1.2, p. 94 (EGA2 lines 3631–3640), states that for quasi-compact `X`, quasi-affine (a) is equivalent to `𝒪_X` ample (c′). Mathlib's immersion condition gives criterion b′), and an immersion into the separated `Spec Γ` makes `X` separated.

## Verified sound

### Gate, dependency check, build and diff

- **Gate rerun.** Every counter is 0 and the gate prints `OK`, including `dropped=0`, `depcheck=0` and `outside-folder=0`.
- **Dependency check.** `gate --depcheck … --movable` prints `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Merge order.** In `ORDER.txt`:
  - DeformationAndDerivedPatchingAlgebra is at line 78;
  - PrismaticCohomologyPartIII is at line 84;
  - PerfectoidQuotientsPartII is at line 219;
  - this roadmap is at line 220.
- **Build.** `lake env lean TauCetiRoadmap/PurityForFlatCohomology/Suggested.lean` exits 0 in 13 s with exactly 13 `declaration uses 'sorry'` warnings, at lines 149, 160, 173, 199, 217, 227, 234, 247, 279, 295, 324, 340 and 352.
- **Diff and pins.**
  - The diff outside the folder is empty.
  - `metadata.toml` reads `topic = "math.AG"`.
  - The pins are Mathlib `1b1ccf4` and Tau Ceti `2fd255d`, matching README lines 276 and 364.

### Lean form, signatures, padding

- **Signatures.** One scratch copy of `Suggested.lean` ends in `#check @…` for all 19 declarations, and all 19 elaborate.
  - There is no `variable`, `include` or `omit`; the only section is `GlobalCompleteIntersection`, with a local instance. So no binder is lost.
  - Each elaborated type matches its README statement (§§1.1, 1.8, 5.6, 6.3, 7.2, 7.4, 7.6, 7.8, 7.14, 8.1, 8.7, Convention 7).
- **One-tactic probe.** Replacing every `sorry` by `first | rfl | infer_instance | decide | trivial | exact inferInstance | simp | aesop` gives 13 errors and 0 closures, so there is no padding.
- **Form.** There is no `lemma`, `set_option`, `#eval` or `True` placeholder. The file has one `import Mathlib` and seven existing `TauCeti.*` modules, a docstring on every declaration, and Layer comments in README order.
- **Duplication at the pins.** No `CompleteIntersection`, `virtualDimension`, `CohenPresentation` or small-étale `𝔾_m` exists in either library.
  - Tau Ceti proves factoriality only in dimension `≤ 2` (`TauCeti.IsRegularLocalRing.uniqueFactorizationMonoid`, `RingTheory/RegularLocalRing/UniqueFactorization.lean` line 59).
  - `TauCeti/Algebra/CharP/Frobenius/Fixed.lean` has fixed subrings, not Katz's basis theorem.

### Library declarations opened at the pins

- An indexer over the pinned sources resolves all 69 `TauCeti.*` names the README backticks, for example:
  - `puncturedSpectrum` (`AlgebraicGeometry/PuncturedSpectrum.lean` line 52);
  - `Proj.isInvertible_twistingSheaf_of_iSup_eq_top` (`…/TwistingSheaf/LocalTriviality.lean` line 212);
  - `Scheme.Gm` and `Scheme.isLimitMuKernelFork` (`Sites/Big/StructureSheaf.lean` lines 126 and 230);
  - `ModuleCat.projectiveDimension_add_depth_eq_depth` (`Depth/AuslanderBuchsbaum.lean` line 148);
  - `CategoryTheory.Sheaf.Torsor` (`…/NonabelianCohomology/Torsor.lean` line 61);
  - `TauCeti.DiagonalizableGroup.groupScheme : Grp (Over (Spec R))` (`…/Scheme/Basic.lean` line 86).
- The Mathlib names resolve as well:
  - `Over.pullback`, `pullbackId` and `pullbackComp` (`Comma/Over/Pullback.lean` lines 59, 105 and 109);
  - `Functor.mapGrp`, `mapGrpIdIso` and `mapGrpCompIso` (`Monoidal/Grp.lean` lines 598, 644 and 651);
  - `Grp.forget` (line 401);
  - `specULiftZIsTerminal` (`AlgebraicGeometry/Limits.lean` line 50);
  - `Scheme.etalePrecoverage`, `fppfPrecoverage` and `fpqcPrecoverage` (`Sites/Etale.lean` line 32, `Sites/Fpqc.lean` lines 41 and 61);
  - `IsRegularRing.isRegularLocalRing_localization` (a field of the class, `RegularLocalRing/Defs.lean` line 94).

### Seeded sample of sources (all 15 targets)

| Target | Checked against | Result |
|---|---|---|
| 1.4 | ILO14 line 10362 (XV Cor. 1.2.4, p. 220: strictly local quasi-excellent, affine `U`, `q > d`); line 12220 (XVII Thm 0.9 of arXiv v1, p. 257; line 12231: constant sheaf dualizing on regular schemes); line 11520 (XVI Thm 3.1.1, Gysin isomorphism); CS24 lines 1356–1380 (Lemma 3.2.3 and proof, p. 33, (3.2.3.2)) | matches; SGA4 XVIII 3.1.8(iii) and SGA5 I 1.12(a), (4.2.2) are uncertified and read through CS24 lines 1367–1379 |
| 1.8 | CS24 lines 1418–1461 (Thm 3.3.1(a)(b), pp. 34–35; proof; Remark 3.3.2); SGA2 line 3390 (X Thm 3.4(ii)) | matches; the route through `fullyFaithfulPullbackιOfTwoLeDepth` on `R̃` replaces EGA IV₂ 5.10.5 (CS24 line 1451) on the same codimension-2 complement |
| 3.2 | CS24 lines 2279–2296 (§5.2.5, p. 55, `RΓ(U_A, G)`); line 2564 (Cor. 5.3.8 defines `RΓ_Z` "as in §5.2.5"); line 2256 (Prop. 5.2.4, p. 54); lines 2318–2327 (Thm 5.2.6, p. 56) | matches |
| 5.3 | CS24 lines 1717–1752 (Lemma 4.2.6 and Prop. 4.2.7, pp. 42–43) | matches; the README route goes through `ξ`-adic layers instead of `A♭`, and is correct since `ξ` is a nonzerodivisor and `A_inf` is `(p, ξ)`-complete |
| 5.6 | Kat73 lines 2301–2345 (Prop. 4.1.1, printed pp. 142–145, `n = 1` case); CS24 lines 1837–1848 (Claim 4.2.10.1, p. 45) | matches |
| 5.8 | CS24 lines 2849–2891 (Thm 5.5.1 and proof, pp. 68–69); line 220 (Thm 1.2.3, p. 6) | matches; `perfectoid_completely_etale_henselization` at PerfectoidQuotients #1042 line 985 covers the `p`-completion of the étale `A[1/a]` |
| 5.9 | CS24 lines 3430–3456 (Thm 6.1.1, (6.1.1.1), p. 82); line 141 ((1.1.6), p. 4); line 764 (Lemma 2.2.3, p. 19) | matches |
| 7.1 | CS24 lines 3630–3660 (Thm 7.1.2 and proof, p. 87) | matches with the corrected regular bound (Source issues) |
| 7.9 | Gro66 lines 101–105 (Lemme 1.1, printed p. 290), 129–133 (Prop. 1.4, p. 291), 150 (Lemme 1.6, p. 292), 161–167 (Cor. 1.8, Lemme 1.9, p. 293); C19 lines 248–251 (Lemma 3.2, p. 7) | matches (printed page = PDF page + 285) |
| 7.11 | CS24 lines 3775–3779 (proof of Thm 7.2.5, p. 90); C19 line 51 (Thm 1.3 case (i), p. 2) | matches; Gro68 is uncertified |
| 7.12c | SGA3 IX 1.1, X §1, X §§3–4, X 4.5 | uncertified; mathematics checked in rows 12–13; C19 line 504 also cites SGA3 X 4.5 for étale-local splitting |
| 7.12d | SGA3 X 5.1, X §5 | uncertified; mathematics checked in row 13 |
| 7.14 | CS24 lines 3828–3869 (Thm 7.2.8 and proof, pp. 91–92; footnote 26 at line 3833, p. 91; footnote 27, p. 92); line 122 (Thm 1.1.4, p. 4); lines 3796–3802 (Lemma 7.2.7) | matches |
| 8.8 | C19 lines 520–522 (Thm 6.2, condition (6.2.1), p. 13); lines 537–550 (Remark 6.3, p. 14) | matches |
| 8.14 | Poo17 lines 8099–8123 (Prop. 6.8.1 and construction, pp. 196–197); line 8125 (Warning 6.8.2); C19 lines 551–554 (Remark 6.4, p. 14) | matches; sign of Convention 8 recomputed in row 16 |

The README flags no locator as unverified. I also read CS24 Thms 7.1.3, 7.2.1, 7.2.5, Cor. 7.2.3, Remarks 7.2.4, 7.2.6 and Thm 7.2.9 (lines 3664–3893), C19 Thms 1.1, 1.2, 6.1 (lines 30–32, 45–49, 493–518), and Corollaries 5.2.9–5.2.10 and 5.3.7–5.3.8 (lines 2366–2383, 2540–2565).

### Cross-roadmap citations resolved (main 3090489 and open heads)

- **Main.**
  - SchemeAndStackFoundations: all 24 cited sections (headings at lines 551–5383) and all 29 cited names. The revisions #1276 (618343f) and #1656 (1bfff38) keep the same heading texts and names.
  - LocalPurity §§1.3, 2.1, 2.2 (lines 218, 259, 302) and its three names. The revisions #1807, #1808 and #1854 keep all six.
  - ModularCurves 0B, 0E, 4D (lines 688, 839, 317) and `ringKrullDim_adicCompletion`, `isRegularLocalRing_adicCompletion_iff` (line 1911).
  - EtaleCohomologyFoundations F.0.2, F.0.4, F.5.
  - DerivedModuleAlgebra 0.K.1, 0.4, 0.25, 1.5, 1.7 and `Algebra.CotangentComplex` (line 583).
  - EnhancedDerivedSheaves E5:animation.1–4.
  - PerfectoidSpaces: all 10 sections and the 6 italic targets (lines 65–17489).
- **Open heads.**
  - #853 AlgebraicModuliForArithmeticGeometry §§4.1–4.3 (lines 1863, 1937, 2064) and `IsGerbe`, `AbelianBanding`, `classifyingAbelianGerbe`, `h2Classification`.
  - #1070 PrismaticCohomologyPartIII §6.0 (line 106): `perfectDieudonneComparison`, `pContinuity` and `excision`. The deformation fibre sequence and the Bégueri reduction are in its proof route, line 135.
  - #868 DerivedDeRhamCohomology §§0.19, 0.21, 1.10 and its 3 names.
  - #1034 DeformationAndDerivedPatchingAlgebra §3.4 (line 627) and §6.9 `localCI_parafactorial` (line 1347, dimension `≥ 4`).
  - #1057 PrismaticCohomology §2.0 (line 2280).
  - #1065 PrismaticCohomologyPartII Layer 4 (line 716).
  - #1042 PerfectoidQuotients §§0.1, 0.2, 0.6 and its 4 names.
  - #879 FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.40, R07.1.41, R07.2.8.
  - #858 ArithmeticGaloisDuality §R02.2.4 (line 1523).
  - #873 LefschetzPencilsAndVanishingCycles §0.10 (line 726).
  - #1313 MotivesAndAlgebraicCycles §0.5b.
- **Board package.** PerfectoidQuotientsPartII §§Q5.2, Q5.4, Q6.3–Q6.7, Q7.1, Q7.3, Q10.1 (lines 382–1395).
- **Resolver leads.** All 7 are false positives: the board package above and six names of other roadmaps.

### Declared gaps

- `plan.json` has `prismatic-dieudonne-perfectoid`, `ci-defect-additivity` and `regular-tower-tilt`. README lines 710–719, 616–618 and 691–697 state them with the same slugs.
- All three are still minimal:
  - PrismaticCohomologyPartII Layer 4 (lines 716–1104) has no Dieudonné functor of finite locally free groups, and it cites ALB23 only for prismatic cohomology;
  - DerivedDeRhamCohomology §0.21 is Avramov's criterion, not additivity;
  - PerfectoidQuotientsPartII §Q10.1 computes no tilt.

### Ownership against open work

- The Bégueri resolution is planned nowhere else (`roadmaps grep`).
- FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.4 (#879 line 809) only uses finite groups of multiplicative type as a hypothesis.
- FunctionFieldArithmeticPartII's "character sheaves" are ℓ-adic.
- No second owner exists for `gmSmallEtale`, `openEtaleHom`, the virtual dimension or the Layer 0–6 targets.
- R02 records the one new overlap.

### Adversarial table

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | §1.4(a)(c) | separably closed field (`d = 0`); `𝔽₂`, `ℓ = 3`, `i = 1`; strictly henselian DVR, `K = j_!ℤ/ℓ`; regular `R`, `K = ℤ/ℓ` | linear duality; `H¹ = ℤ/3` against `0`; `0, ℤ/ℓ, ℤ/ℓ(−1)` both ways; `H^{2d}_𝔪 = ℤ/ℓ(−d)` = dual of `μ^{⊗d}` in degree `−2d` | consistent; strict henselianity needed | none |
| 2 | §1.5 | `f = 0`; DVR, `f = π`; `k⟦x,y⟧`, `f = x`, `i = 2` | identity; `0 → ℤ/ℓ` injective, not onto; `0 → ℤ/ℓ(−1)` not onto | range sharp | none |
| 3 | `zariskiNagata_*` (§1.8) | `A_1`; node `xy−zw`; `k⟦x,y⟧/(xy)`; dimension 0 | vdim 2, `π₁(U) = ℤ/2`; vdim 3, covers extend (SGA2 line 3392); vdim 1, `U` disconnected; `U = ∅`, unfaithful | thresholds sharp; `vdim ≥ 2 ⇒ U ≠ ∅` as `ConnectedSpace` needs | none |
| 4 | §3.2 | `A = k ⊕ k[1]`, `𝔾_a`, `Z = ∅`; `𝔽_p ⊕ 𝔽_p[1]`, `μ_p` | `RΓ_∅ = fib(id) = 0` against classical `k[1]`; `H⁰ = Ext¹(e^*L, 𝔽_p) = 𝔽_p ≠ 0 = μ_p(𝔽_p)` | matches Cor. 5.2.9's range `i ≥ 1` | none |
| 5 | §5.3 | `𝕄(ℤ/p) = A_inf/p`; `A_inf/ξⁿ` | `p` on `p`-torsion-free `A_inf(A′)` stays injective; `ξ^kA_inf/ξ^{k+1} ≅ A′`, `n` layers | route correct | none |
| 6 | Katz (§5.6) | `𝔽̄₂²`, `F(x,y) = (y²,x²)`; `𝔽₃(t)^perf`, `F = tφ`; `F = cφ`; `M = 0` | fixed `(a, a²)`, `a ∈ 𝔽₄`: an `𝔽₂`-plane; `x² = 1/t` needs `v = −1/2 ∉ ℤ[1/3]`; line spanned by a root of `x^{p−1} = 1/c`; empty basis | `IsAlgClosed`, bijectivity needed | none |
| 7 | §5.8 | `π^{1/p^m} ↠ π^{1/p^{m+1}}`; `𝒪_C`, `μ_p` | `p − 1` steps, step `k` square-zero iff `2k ≥ k+1`; whole map square-zero iff `p = 2`; `μ_p(𝒪_C/p) = 1 + p^{1/p}𝒪_C/p ≠ 1 = μ_p(k̄)` | route correct | none |
| 8 | §5.9 | perfect `A`, `ξ = p`, `ℤ/p`, `Z = Spec A`; `A = 𝔽̄_p` | `A^{φ=1}`, `A/(φ−1)A`; `𝔽_p, 0, 0` | matches §2.1 | none |
| 9 | §7.1 | `Spec k ⊔ Spec k`, `d = 1`, `ℤ/2`; `𝔾_m/k̄`, `Z = {1}`, `μ_p`; regular dimension 2, `d = 3` | `(ℤ/2)² → ℤ/2` not injective, excluded by `max(d−1,1)`; `ℤ/p ↪ (ℤ/p)²` not onto; injective `i < 3`, bijective `i < 2` | correction needed and made | none |
| 10 | §7.9 | `Spec K`; DVR; `𝔸²_ℂ` | (b) identity; `Br R ↪ Br K`; `H² ↪ Br ℂ(x,y)` torsion | matches Gro66 1.4, 1.8 | none |
| 11 | §7.11 | `k⟦x,y⟧`; `k⟦x,y,z⟧`; `A_1` | bundles trivial; syzygy `N` of rank 2 not free (`pd k = 3`); `(x,y)` nontrivial | dimension 2 and regularity needed | none |
| 12 | §7.12c | `α_p`; circle over `ℝ`; `𝔾_m ⊔ μ₂` over `k×k`; `μ_n`, `n ≥ 2` | dual `α_p` not étale; `ℤ_sign^{G} = 0`, not diagonalizable; same-fibre `D(M)` excluded; torsion `ℤ/n`, not a torus | definitions discriminate | none |
| 13 | §7.12d | `X^*(μ_p)/𝔽_p`; circle; `X^*(D(M))` | `ℤ/p` while reduced points are trivial; sections `0` over `ℝ`, `ℤ` over `ℂ`; `Hom(D(M), D(ℤ))` = locally constant `S → M` | consistent | none |
| 14 | `etaleCohomology_two_gm_torsion_purity` (§7.14) | `U = X`; `U = ∅`; Segre `R` (dimension 4); cubic-cone `R` (dimension 3) | identity; generic local ring of dimension 0 excluded; torsion `0 = 0`, `H²(U_R) ≠ 0` nontorsion; excluded, `Br(U_R)` infinite | matches CS24 line 122 | none |
| 15 | §8.8 | `𝔾_m^r`; `Spec K`; `ℙ¹_ℝ`, norm-one torus; `Res_{X′/X}𝔾_m` | holds; `V = X`; fails (C19 (6.3.3)); `H²(V,T) = H²(V′,𝔾_m)`, `V′ ≠ ∅` integral | consistent | none |
| 16 | Convention 8, §8.14 | `(L/K, σ, π)`; `σ⁻¹`; `ℂ⟦t⟧`; `k⟦t⟧`, `k` imperfect | factor set `π^{[i+j≥n]}`, `δχ = [i+j ≥ n]` for `χ(σ) = 1/n`, so `∂ = χ`; `−χ`; `∂ = 0`; `Br[p] ≠ 0` excluded | sign pinned | none |
| 17 | `virtualDimension`, `IsCompleteIntersection` | `k⟦x,y⟧/(y)`; `(x,y)²`; `x², y², xz−yt`; non-regular source; valuation ring with `𝔪 = 𝔪²` | `2−1 = 1`; `2−3 = −1 < 0`; `4−3 = 1 < 2`; excluded; junk `0`, every theorem Noetherian | presentation-independent | none |
| 18 | `etaleDepth_ge_virtualDimension` | LES both directions; `k⟦x,y⟧/(xy)`, `i = 0`; field | `H^i_𝔪 = 0 (i < v)` ⟺ injective `i < v`, bijective `i+1 < v`; diagonal `ℤ/n → (ℤ/n)²`; `i : ℕ`, nothing claimed | correct; general `G` statable | R01 |
| 19 | `free_of_endomorphisms_iso_pi` | `r = 0`; `Rⁿ`; syzygy `N`; `A_1` | `End = 0 ⇒ M = 0`; `r = n`; `N` reflexive non-free; not regular | consistent with CS24 line 3686 | none |
| 20 | `isRegularLocalRing_uniqueFactorizationMonoid` | DVR; `A_1` | factorial; `xz = y²`, not regular | Tau Ceti has only dimension `≤ 2` | none |
| 21 | `localPicard_torsion_eq_one` | node; `A_1`; cubic cone; Veronese cone | `Pic(U) = ℤ`; dimension 2 excluded; dimension 2 excluded; vdim `6−6 = 0 ≠ 3` | matches CS24 line 3707 | none |
| 22 | `localPicard_subsingleton` | field; DVR; `k⟦x,y⟧` | `U = ∅`; `Pic K = 0`; factorial | consistent | none |
| 23 | `picard_globalCompleteIntersection_*` | quadric surface; `ℙ³`; quadric threefold; cuspidal cubic; `fs = [1]` | `ℤ²/ℤ(1,1) = ℤ`; `ℤ`; `n = 4, c = 1`, `Pic = ℤ`; torsion `ℤ/3`, `1+2 ≤ 2` false; `0 < d` excludes | matches CS24 lines 3737–3739 | none |
| 24 | `gmSmallEtale`, `openEtaleHom` | `Spec k`; `Spec ℝ`; `U = ⊤`; `U = ∅` | `kˣ` (`𝔾_a` gives `k`); `H² = ℤ/2`; identity; zero map | determines `𝔾_m` | none |
| 25 | `…_puncturedSpectrum_subsingleton` (§8.1) | `k⟦x,y⟧`; `k⟦t⟧` imperfect; `d ≥ 3` | `0`; dimension 1 excluded, `Br[p] ≠ 0`; `H²(R,μ_n) = 0 = H³_𝔪(μ_n)` | `2 ≤ dim` needed | none |
| 26 | `etaleCohomology_gm_purity_regular` (§8.7) | `U = ⊤`; `𝔸²_ℂ` minus axes | identities; axes' generic points of dimension 1 excluded | matches C19 line 30 | none |
| 27 | R01, general 6.2.4 | trivial `G`; `(ℤ/n)_R`; `μ_p/𝔽_p` | sheaf `0`; `Hom(V, ⊔ Spec R)` = locally constant `V → ℤ/n`; not étale, excluded | elaborates (scratch) | R01 |
| 28 | R01, C19 6.1 for tori | rank 0; norm-one `T` over `ℝ⟦x,y⟧`; `μ_p` | zero sheaf; `H¹(R,T) = H¹(U_R,T) = ℤ/2`; `H¹_ét = 0 ≠ R^×/p = H¹_fppf` | tori statable, non-smooth not | R01 |
| 29 | R02, §7.12d against #1676 B.3.4 | circle torus over `ℝ` here, over `ℚ` in #1676 | character sheaf `ℤ` with the conjugation acting by `−1` in both (#1676 line 3906) | same object, two owners | R02 |
| 30 | §7.12a–b | `D_ℤ(ℤ/3)` fibres; `ℤ/4 ↠ ℤ/2`; `2ℤ ⊂ ℤ` | `ℚ×ℚ(ζ₃)`, `𝔽₂×𝔽₄`, `𝔽₃[t]/(t−1)³`; closed immersion `μ₂ → μ₄`; squaring, kernel `μ₂`, étale over `S[1/2]` | consistent | none |
| 31 | §7.13 | `𝔾_m × μ_n`, `m = n` and `m = 1`; `L` construction | `(t,ζ) ↦ (tⁿ,1) = [n]`; `S = T` not a torus; `0 → K → L → X^* → 0` with `nX^* ≅ X^*/tors` free | consistent | none |

## Not verifiable

- **SGA3 VIII–X** (uncertified; the manifest says never request) back the §§7.12a–7.12e locators. I checked them through Tau Ceti's affine declarations and rows 12, 13, 30 and 31. C19 line 504 cites SGA3 X 4.5 for the same splitting.
- **Aus62 Theorem 1.3** (uncertified) backs `free_of_endomorphisms_iso_pi`. I read it only through its use at CS24 lines 3684–3686.
- **SGA4 XVIII 3.1.8(iii), SGA5 I 1.12(a) and (4.2.2), Gro68 III 6.1 b), BH 2.3.1, Avr77 3.6, DF84 Remark 3, MB85 Lemme 2, Bou78 V 4.9 and Gab04b** (all uncertified). I read them only through CS24 and C19.
- **ALB23, Lau13, BS22, BC22, Čes15, Bég80, SGA1, EGA42, EGA44, STACKS, CTS87, dJ02 and Koh72** are in the cache but outside this round's sample. I did not open them this round.

## Source issues

- **Error** in CS24 at Theorem 7.1.2, p. 87: the source allows regular local rings of dimension `≥ d − 1`, which admits fields when `d = 1`, and then injectivity fails; it should require dimension `≥ max(d − 1, 1)`; affects a stated result.
- **Misprint** in CS24 at the proof of Theorem 3.3.1(b), p. 35: the source writes the hypothesis as the virtual dimension of `R_d` being at least 3; it should be that of `R`; affects nothing.
- **Misprint** in CS24 at the proofs of Theorems 7.2.1 and 7.2.5, pp. 89–90: the source takes the Kummer exponent `n ≥ 0` (lines 3726, 3774); it should be `n ≥ 1`; affects nothing.
- **Gap** in CS24 at Remark 7.2.6, p. 90: the source calls the cone over an arbitrary complex elliptic curve a complete intersection (line 3781); it should restrict to a plane cubic or an intersection of two quadrics; affects nothing.
