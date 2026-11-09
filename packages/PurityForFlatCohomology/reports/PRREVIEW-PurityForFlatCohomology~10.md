# Review of PurityForFlatCohomology (pull request #1840 at 96339c0)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/PurityForFlatCohomology/`: `README.md` (3233 lines) and `Suggested.lean` (362 lines, 19 declarations). The gate fails with `dropped=45`. There are three findings:
- R01 (P1) and R02 (P2) block;
- R03 is P3.

Of the previous review's findings, R01, R03 and R04 are repaired. R02 is not, because its repair lies in two other roadmaps; it is R02 below. R01 below is a regression: the last commit, 96339c0, brought back the GroupSchemesOverABase citation that PRREVIEW~8 R01 had removed.

## R01 (P1) — GroupSchemesOverABase is cited as a supplier again: the gate fails and §§7.12a–7.15 and Layer 8 have no admissible owner

**Location.**
- `TauCetiRoadmap/PurityForFlatCohomology/README.md` names the roadmap on 44 lines:
  - line 43 (diagram), lines 64–66, Scope lines 128–133;
  - contracts lines 334, 362, 365, 535 and `### From TauCetiRoadmap.GroupSchemesOverABase` (lines 538–561);
  - line 726, the Layer 7 introduction (lines 2085–2090);
  - §§7.12a–7.12e (lines 2462–2609);
  - the *Needs* of §§7.13–7.15, 8.2, 8.5, 8.8 and 8.11, and the Layer 7 and Layer 8 Dependencies (lines 2738, 3116).
- `Suggested.lean` line 90 names it too.
- Line 2467 says that `D_S(M)` "is GroupSchemesOverABase §1.1's", and line 2471 says that "This roadmap proves only the description of points that matches these groups".

**Claim.**
- GroupSchemesOverABase is on the project's dropped-names list. This review's rules forbid citing it as a supplier. It is not in `ORDER.txt`, and the gate refuses every mention of it.
- Commit 96339c0 deleted the owned theory of §§7.12a–7.12e and replaced it with citations of that roadmap. The deleted theory covers:
  - `D_S(M)` and its homomorphisms;
  - smoothness, kernels and exactness;
  - the definitions of groups of multiplicative type and tori over a base, with the étale/fppf/fpqc comparison;
  - the character sheaf and the anti-equivalence;
  - subgroups, quotients and the largest subtorus.
- It also deleted the matching Mathlib and Tau Ceti contract entries (`specULiftZIsTerminal`, `Scheme.etalePrecoverage`, `TauCeti.FGCommGrpCat`, the `TauCeti.DiagonalizableGroup.*` and `TauCeti.MonoidAlgebra.*` entries) and the Downstream-consumers bullet for a later group-scheme roadmap.
- §§7.13–7.15 and Layer 8 rest on these objects, and their only cited owner is a roadmap this one may never consume. They are unowned.
- No roadmap on main owns them either. ReductiveGroups on main treats diagonalizable groups and tori over a field only (its README lines 432–441).
- The dependency check does not see this edge: it skips names that are not in `ORDER.txt`. The dropped-names scan is what catches it.

**Witness.**
- Gate rerun at 96339c0: `… dropped=45 … FAIL`, with first hit "line 43: GroupSchemesOverABase ──→ Layers 7, 8".
- `grep -c GroupSchemesOverABase` gives 44 README lines and 1 `Suggested.lean` line. At 643f30e it gives 0 in both files.

**Repair.**
1. Restore the folder to 643f30e: `git checkout 643f30e -- TauCetiRoadmap/PurityForFlatCohomology/`. The diff 643f30e..96339c0 in this folder is exactly this delegation:
   - §§7.12a–7.12e (README lines 2477–2793 at 643f30e);
   - the contract, Scope, Layer 7 and *Needs* lines;
   - `Suggested.lean` line 90, which is then "(README §7.12c defines them)" again.

   643f30e already carries the previous review's R03 repair: `AlgebraicGeometry.Scheme.Gm`, `mu`, `powHom`, `muToGm` and `isLimitMuKernelFork` are named in §§7.12a–7.12b and in the Tau Ceti contract.
2. In the pull-request description, remove #1522 from the depends-on list and from the merge-order chain.

Another reviewer's verdict is not a reason to keep this citation. The board's reviews of #1522 ask this roadmap to cite it (PRREVIEW-GroupSchemesOverABase~9, "the citation that settles the duplicate belongs on PurityForFlatCohomology's side"). That review runs against a candidate order that places #1522 at line 66, but #1522 is on the dropped-names list that governs this folder. Which roadmap owns groups of multiplicative type over a base is a decision on that list and on `ORDER.txt`, and it belongs to a human. This folder cannot settle it by citing a dropped roadmap.

**Tested.**
- I grepped 643f30e's two files for all 15 names on the never-cite list and found 0 occurrences, so `dropped` becomes 0.
- 643f30e's `Suggested.lean` differs from the head only in the docstring line 90, so the build (13 `sorry` warnings, below) is unchanged.
- I recomputed the restored §§7.12a–7.12e Checks: rows 31–33 of the table.

## R02 (P2) — Local duality, local Lefschetz, Layer 3 and §7.10 each still have two owners

This is still open from the previous review's R02 (and PRREVIEW~8 R03). Nothing in this folder needs to change.

**Location.**
- README lines 196–208: "Two roadmaps later in the merge order plan statements of this roadmap; each is owned here".
- Downstream consumers, lines 3121–3132.

**Claim.**
- This roadmap owns four groups of statements:
  - §1.4(a)–(c), affine Lefschetz on principal punctured opens, the dualizing complex and local duality on excellent regular local rings;
  - §1.5, local Lefschetz;
  - Layer 3, finite-ideal excision and fpqc hyperdescent of animated flat cohomology;
  - §7.10, the ample Brauer comparison.
- Two later roadmaps still claim the same objects as their own and say that this roadmap imports them:
  - EtaleDualityAndPerverseSheavesPartII (`ORDER.txt` line 388);
  - SchemeAndStackFoundationsPartII (line 256).
- This roadmap (line 220) cannot import from either, so each object has two owners.

**Witness.**
- EtaleDualityAndPerverseSheavesPartII `README.md` line 23 (pull request #1743, head 36a358a): "PurityForFlatCohomology takes the local Lefschetz theorem from §7.3 … and owns none of these statements". Its line 1642 repeats this.
- SchemeAndStackFoundationsPartII board package `README.md` line 1055: "PurityForFlatCohomology uses … finite-ideal excision, adic hyperdescent and the ample Brauer comparison".

**Repair.** Before either roadmap merges:
- In #1743:
  - replace the ownership sentence of line 23 and line 1642 by imports of PurityForFlatCohomology §§1.4–1.5;
  - make its §6.11, §6.12, §7.1 and §7.3 cite §1.4(a)–(c) and §1.5 wherever they restate them.
- In the SchemeAndStackFoundationsPartII package, make line 1055 and the corresponding targets cite Layer 3 and §7.10 here.

**Tested.** I compared the hypotheses pair by pair:
- strictly henselian excellent regular local ring, `ℓ` invertible, `f ∈ 𝔪`: §1.4(a) here against #1743 §7.1;
- the same hypotheses: §1.5 here against #1743 §7.3;
- strictly local excellent: §1.4(c) here against #1743 §6.12.

The statements coincide.

## R03 (P3) — `IsQuasiAffine` is cited by a short name and is missing from the Mathlib contract

**Location.** README §7.10, lines 2381–2382: "(Mathlib's `IsQuasiAffine` includes `CompactSpace`)". The Mathlib contract (lines 273–342) does not list it.

**Claim.** §7.10's hypothesis and its quasi-compactness Check depend on what this Mathlib class includes. What exists at the pin is cited in the contracts by its exact name and file, and the declaration is `AlgebraicGeometry.Scheme.IsQuasiAffine`, not `IsQuasiAffine`.

**Witness.** `Mathlib/AlgebraicGeometry/QuasiAffine.lean` line 29 opens `namespace AlgebraicGeometry.Scheme`, and line 34 reads `class IsQuasiAffine (X : Scheme.{u}) : Prop extends CompactSpace X, IsImmersion X.toSpecΓ`. A `#check @IsQuasiAffine` under `open AlgebraicGeometry` fails.

**Repair.**
- In §7.10, write `AlgebraicGeometry.Scheme.IsQuasiAffine`.
- Add a Mathlib contract bullet: "`AlgebraicGeometry.Scheme.IsQuasiAffine` (`Mathlib/AlgebraicGeometry/QuasiAffine.lean`): quasi-compact with `X → Spec Γ(X, ⊤)` an immersion; it extends `CompactSpace X` (§7.10)."

**Tested.** At the pin, `#check @AlgebraicGeometry.Scheme.IsQuasiAffine` elaborates, and `example (X : Scheme) [X.IsQuasiAffine] : CompactSpace X := inferInstance` elaborates.

## Previous findings (PRREVIEW~9, head adbbf28)

- **R01 (P2, statable 𝔾_m headlines) — repaired.**
  - `Suggested.lean` lines 306–358 now declare `gmSmallEtale`, `etaleCohomology_two_gm_torsion_purity`, `etaleCohomology_two_gm_puncturedSpectrum_subsingleton` and `etaleCohomology_gm_purity_regular`, with `openEtaleHom` at line 188.
  - The docstring (lines 80–94) keeps CS24 Theorem 7.2.5, C19 Theorems 1.2 and 6.2, and general `T` as not statable, each with its missing carrier.
  - README lines 54–58, Convention 7 (lines 245–257) and §§7.14, 8.1, 8.7 name the new declarations. Convention 7 calls `gmSmallEtale` the Lean form of SchemeAndStackFoundations §2.9's `GmEtale`.
- **R02 (P2, two owners) — not repaired; R02 above.** #1743 and the package are unchanged.
- **R03 (P3, Tau Ceti sheaves) — repaired.**
  - Scope lines 118–121 and the Tau Ceti contract lines 406–431 list `bigStructureSheaf`, `Ga`, `Gm`, `mu`, `powHom`, `muToGm`, `isLimitMuKernelFork`, `isSheaf_Γ` and the two henselization algebras with their instances.
  - §7.12a (line 2480) and §7.12b (line 2513) use the full names.
- **R04 (P3, §5.8 route) — repaired.**
  - Lines 1842–1855 now run the deformation fibre sequence along `A′/^L pⁿ ↠ A′/^L p^{n−1}` and along the `p − 1` square-zero steps between `A′/^L π^{1/p^m}` and `A′/^L π^{1/p^{m+1}}`, pass to the colimit `(A′/p)_red`, and say why §3.3 does not replace these steps.
  - The *Needs* (line 1856) and the Layer 5 Dependencies (line 1917) add PrismaticCohomologyPartIII §6.0.

## Verified sound

### Gate, dependency check, build and diff

- **Gate rerun.** Every counter is `0` except `dropped=45` (R01), so the gate prints `FAIL`.
- **Dependency check.** `gate --depcheck … --movable` prints `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. In `ORDER.txt`:
  - this roadmap is at line 220;
  - PerfectoidQuotientsPartII is at line 219;
  - SchemeAndStackFoundationsPartII is at line 256;
  - EtaleDualityAndPerverseSheavesPartII is at line 388.
- **Build.** `lake env lean TauCetiRoadmap/PurityForFlatCohomology/Suggested.lean` exits 0 in 19 s with exactly 13 `declaration uses 'sorry'` warnings, at lines 150, 161, 174, 200, 218, 228, 235, 248, 280, 296, 325, 341 and 353.
- **Diff.** The diff outside the folder is empty. `metadata.toml` reads `topic = "math.AG"`. `lake-manifest.json` pins Mathlib `1b1ccf4` and Tau Ceti `2fd255d`, matching README lines 275 and 346.

### Lean form

- **Signatures.** I ran `#check @…` on all 19 declarations in one scratch file and compared each elaborated type with its README statement (§§1.1, 1.8, 5.6, 6.3, 7.2, 7.4, 7.6, 7.8, Convention 7, 7.14, 8.1, 8.7). All match. There are no section `variable`s, so no binder is lost. Some generality checks:
  - `etaleCohomology_two_gm_torsion_purity` requires `[IsNoetherian X]`, as CS24 line 122 does;
  - `etaleCohomology_gm_purity_regular` requires `[IsLocallyNoetherian X]`, as C19 line 30 does;
  - §8.1's statement carries `HenselianLocalRing` and `IsSepClosed (ResidueField R)`, as C19 line 48 does.
- **One-tactic probe.** Replacing each `sorry` by `first | rfl | infer_instance | decide | trivial | exact inferInstance | simp | aesop` gives 13 errors and 0 closures, so there is no padding.
- **Form.** There is no `lemma`, `set_option`, `#eval` or `True`. The file has one `import Mathlib` and seven existing `TauCeti.*` modules, docstrings on every declaration, and Layer comments in README order.
- **Duplication.** The new definitions `gmSmallEtale` and `openEtaleHom` duplicate nothing at the pins:
  - Mathlib has only `Scheme.Etale.mk` (`AlgebraicGeometry/Morphisms/Etale.lean` line 183);
  - no Tau Ceti file mentions `smallEtaleTopology`;
  - `roadmaps grep` finds no other roadmap using these constructions.
- **Docstring claims.**
  - Neither pin has an Azumaya Brauer group of a scheme or a ring: Mathlib `BrauerGroup` is over fields (`Algebra/BrauerGroup/Defs.lean` line 100), and Tau Ceti's `Algebra/BrauerGroup/*` likewise.

### Headline theorems

- **Stated:**
  - [CS24] 3.3.1(a)(b);
  - 6.2.4 for `ℤ/n`;
  - 7.2.1 (both clauses);
  - 7.2.3 (both clauses);
  - 1.1.4;
  - [C19] 1.1 and 1.3;
  - Katz, Auslander and factoriality.
- **Named as not statable, with the missing carrier:**
  - 6.2.3, 6.2.7 and 7.1.2;
  - 6.2.4 for non-constant `G`;
  - 4.1.8, Layer 3, 5.5.1, 6.1.1–6.1.2, 7.1.3 and 7.2.5;
  - [C19] 1.2 and 6.2 with the residue sequences;
  - 7.2.8–7.2.9 and [C19] 1.4 and 6.1 for general `T`.
- [CS24] 1.1.2 is absolute purity, owned by LefschetzPencilsAndVanishingCycles §0.10, and is not a headline here.

### Library declarations opened at the pin

- One scratch file imports the 44 Tau Ceti modules that the README's contract paths name, and runs `#check @…` on 204 backticked names. 153 elaborate. The 51 failures are:
  - prose tokens (`U_R`, `D_S`, `vdim`);
  - other roadmaps' names;
  - `TauCeti.TorusAffineGroupSchemeCat` and `TauCeti.torusAffineGroupSchemeProperty`, whose module I did not import (they are declared at `TauCeti/AlgebraicGeometry/AffineGroupScheme/Torus.lean` lines 82 and 59);
  - `IsQuasiAffine` (R03).
- All 72 `TauCeti.*`, `AlgebraicGeometry.Scheme.{Gm,mu,…}`, `HomogeneousIdeal.*` and `ModuleCat.*` names the README backticks exist at the pin.

### Seeded sample of sources (all 15 targets)

| Target | Checked against | Result |
|---|---|---|
| 0.1 | C19 §1.5 (line 91, p. 3) | `U_R` is the complement of the closed points of a semilocal ring: matches |
| 0.4 | CS24 Prop. 4.1.13 proof (lines 1654–1670, p. 40); Thm 6.1.2 proof (lines 3463–3472, pp. 82–83) | decreasing induction on a regular sequence vanishing on `Z`: matches |
| 1.1 | CS24 (3.2.1.1)–(3.2.1.2) (lines 1323–1331, p. 32); SGA2 XIV Prop. 5.2 (line 7398, p. 198), Déf. 5.3 and Prop. 5.4 (lines 7453–7460, p. 200), Prop. 5.5 (line 7466) | Prop. 5.2 allows any regular `B`, not only complete ones, as `CohenPresentation` does: matches |
| 1.3 | CS24 Remark 3.2.2 (lines 1346–1352, p. 33); Koh72 Theorem A (line 28, p. 55) | every Noetherian ring; three generators; matches |
| 1.4 | CS24 proof of Lemma 3.2.3 (lines 1361–1380, p. 33); ILO14 XV Cor. 1.2.4 (line 10362: strictly local quasi-excellent, affine `U`, `q > d`); XVII Thm 0.9 of arXiv v1 (line 12220); XVI Thm 3.1.1 (line 11520) | matches; SGA 4 XVIII and SGA 5 I are uncertified |
| 1.6 | CS24 Thm 3.2.4 and proof (lines 1381–1408, pp. 33–34); SGA2 XIV Thm 5.6 (line 7481) | the `R_1`, `R_2`, `R_{12}` reduction and the hypersurface case: matches |
| 5.4 | CS24 Lemma 4.2.8 (lines 1764–1767, p. 43) | matches |
| 7.5 | EGA44 Déf. 21.13.7 (line 13005, p. 316), Prop. 21.13.8 (line 13007), Ex. 21.13.9(i)(ii) (lines 13020–13024, p. 317), Cor. 21.13.6(iii) (line 12964), Prop. 21.13.10 (line 13115), 21.13.12.1 (line 13184); SGA2 XI Déf. 3.1–3.2 (lines 3604–3611, p. 101), Lemme 3.6 (line 3636, p. 102), Thm 3.13(i)(ii) (line 3754, p. 105); CS24 footnote 26 (line 3833, p. 91) | matches |
| 7.8 | CS24 Cor. 7.2.3 and proof (lines 3737–3755, p. 89); SGA2 XII Cor. 3.6–3.7 (lines 4304–4321, p. 121) | 3.7 holds for an algebraic complete intersection of dimension `≥ 3` in `ℙ^r_k` over any field: matches |
| 7.11 | CS24 proof of Thm 7.2.5 (lines 3775–3779, p. 90); C19 Thm 1.3 case (i) (line 51, p. 2) | matches; Gro68 is uncertified |
| 8.2 | C19 Lemma 2.1 (line 111, p. 3), Props 2.2–2.3 (lines 130–157, p. 4), Cor. 2.4 (line 172, p. 5), Def. A.1 and Lemma A.2 (lines 568–575, p. 15) | matches; (b) is narrowed to commutative `G` with the source gap stated |
| 8.4 | ILO14 XVIII-A Lemma 2.2 and (2.a) (lines 16269–16281, p. 333); C19 proof of Thm 6.1 (lines 509–513) | matches |
| 8.5 | C19 proof of Thm 6.1 (lines 497–518, p. 13) | the reduction to `H^q_Z(X, T) = 0` for `q ≤ 3` and the strictly local endgame: matches |
| 8.13 | Poo17 §6.8.1 construction (lines 8105–8113, pp. 196–197) and Lang's `C_1` (lines 633–643) | matches |
| 8.14 | Poo17 Prop. 6.8.1 (line 8099, p. 196), construction (lines 8105–8123, pp. 196–197), Warning 6.8.2 (line 8125); C19 Remark 6.4 (lines 551–559, p. 14) | matches |

The README flags no locator as unverified.

I also read:
- CS24 Theorems 1.1.1–1.1.5 and 1.3.1 (lines 66–130, 288);
- CS24 Theorems 7.2.1, 7.2.5, 7.2.8 and 7.2.9 with footnotes 26–28 and Remark 7.2.6 (lines 3707–3893);
- C19 Theorems 1.1–1.4, 6.1 and 6.2 (lines 30–89, 493–535).

### Cross-roadmap citations resolved

**Main (1bea835).**
- SchemeAndStackFoundations: 24 cited sections (headings at lines 551–5383) and all 29 backticked names.
- LocalPurity §§1.3, 2.1, 2.2 (lines 218, 259, 302) and its 3 names.
- ModularCurves 0B, 4D (lines 688, 1882) and its 2 names.
- EtaleCohomologyFoundations F.0.2, F.0.4, F.5.
- DerivedModuleAlgebra 0.K.1, 0.4, 0.25, 1.5, 1.7.
- EnhancedDerivedSheaves E5:animation.1–4.
- PerfectoidSpaces: 10 sections and its 6 italic targets.

**Open heads.**
- #853 AlgebraicModuliForArithmeticGeometry §§4.1–4.3 (lines 1861, 1935, 2062) and its 4 names.
- #1070 PrismaticCohomologyPartIII §6.0 and its 3 names.
- #868 DerivedDeRhamCohomology §§0.19, 0.21, 1.10 and its 3 names.
- #1034 DeformationAndDerivedPatchingAlgebra §§3.4, 6.9 and `localCI_parafactorial`.
- #1057 PrismaticCohomology §2.0.
- #1065 PrismaticCohomologyPartII Layer 4.
- #1042 PerfectoidQuotients §§0.1, 0.2, 0.6 and its 4 names.
- #879 FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.40, R07.1.41, R07.2.8 and its 2 names.
- #858 ArithmeticGaloisDuality §R02.2.4.
- #873 LefschetzPencilsAndVanishingCycles §0.10.
- #1313 MotivesAndAlgebraicCycles §0.5b.

**Board package.** PerfectoidQuotientsPartII §§Q5.2, Q5.4, Q6.3–Q6.7, Q7.1, Q7.3, Q10.1 (lines 382–1395).

**Resolver leads.** All 7 are false positives. PerfectoidQuotientsPartII is the board package at `ORDER.txt` line 219, and the six Lean names are the other roadmaps' names found above.

**Overlaps.** `overlaps.md` lists no pull request that changes this roadmap and no dropped id; I confirmed both. Every id other roadmaps cite here (§§1.6, 7.12a–7.12e, Layer 3, §7.10) still exists at this head.

### Declared gaps

`plan.json` has `prismatic-dieudonne-perfectoid`, `ci-defect-additivity` and `regular-tower-tilt`. They appear at README lines 686, 592 and 667. Each is still minimal:
- PrismaticCohomologyPartII mentions ALB23 only in its references (line 2052);
- DerivedDeRhamCohomology §0.21 states Avramov's criterion, not additivity;
- PerfectoidQuotientsPartII §Q10.1 computes no tilt.

### Ownership against open work

- I read:
  - #1743 at its sibling checkout and the SchemeAndStackFoundationsPartII board package (R02);
  - #1522's latest board review (R01);
  - ReductiveGroups on main (field case only).
- `roadmaps grep` for "character sheaf" and "groups of multiplicative type" finds the base-scheme theory only here and in #1522.
- No second owner exists for `gmSmallEtale`, `openEtaleHom`, the virtual dimension or the Layer 0–6 targets.

### Adversarial table

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | §0.1 `U_R` | `k × k`; `k⟦x,y⟧`; DVR `R` | `U = ∅`; `U = D(x) ∪ D(y)`, `Γ = R`; `U = Spec K`, `Γ = R[1/π] ≠ R` | semilocal carrier needed; depth 2 needed for Hartogs | none |
| 2 | §0.4 | `k[x_1..x_d]`, `Z` the origin; `Z = Spec A`, `d = 1` | `H^{<d}_Z = 0`, `(x_1⋯x_d)^{-1} ∈ H^d_Z ≠ 0`; `H^0_Z(A) = A ≠ 0` | sharp; vanishing on `Z` needed | none |
| 3 | `virtualDimension`, `IsCompleteIntersection` | `k⟦x,y⟧/(y)`; `k⟦x,y⟧/(x,y)²`; `𝔽_p⟦x,y,z,t⟧/(x²,y²,xz−yt)`; non-regular identity "presentation" of `k⟦x,y⟧/(xy)` | `2−1 = 1`; `2−3 = −1 < 0 = dim`; `4−3 = 1 < 2`; `2−0 = 2 ≠ 1` | presentation-independent; regularity of `B` needed | none |
| 4 | §1.3 | `k⟦x,y⟧`, `I = (x²,xy,y²)`; `k⟦x,y,z⟧`, `(x²,xy,xz)`; twisted cubic cone | depth 0, `pd = 2`, vdim `−1`; depth 0, vdim `0 = 3−3`; vdim `1 < 2 = depth` | incomparable both ways | none |
| 5 | §1.4(a)(c) | separably closed field (`d = 0`); `𝔽₂`, `ℓ = 3`, `i = 1`; strictly henselian DVR, `K = j_!ℤ/ℓ` | linear duality; `ℤ/3` against `0`; `0, ℤ/ℓ, ℤ/ℓ(−1)` both ways | strict henselianity needed; consistent | none |
| 6 | §1.5 | `f = 0`; DVR, `f = π`; `k⟦x,y⟧`, `f = x`, `i = 2` | identity; `0 → ℤ/ℓ` injective, not onto; `0 → ℤ/ℓ(−1)` not onto | range sharp | none |
| 7 | §1.6 | `k⟦x,y⟧/(xy)` (vdim 1) | `H^0_𝔪 = 0`, `H^1_𝔪 = coker(ℤ/ℓ → (ℤ/ℓ)²) = ℤ/ℓ` | sharp | none |
| 8 | `etaleDepth_ge_virtualDimension` | `n = 1`; a field (vdim 0); `𝔽_p⟦x,y,z,t⟧/(x²,y²,xz−yt)`, `n = p`, `i = 0` | `ZMod 1 = 0`: both sides 0; `ℤ/n → 0`, nothing claimed; `R_red = 𝔽_p⟦z,t⟧`, `ℤ/p → ℤ/p` bijective | equivalent to `H^{<v}_𝔪 = 0` through `0 → coker_{i−1} → H^i_𝔪 → ker_i → 0` | none |
| 9 | `zariskiNagata_*` | `A_1`; node `xy−zw`; `k⟦x,y⟧/(xy)`; dimension 0 | vdim 2 with `π₁(U) = ℤ/2`; vdim 3 with covers extending; vdim 1 with `U` disconnected; vdim `≤ 0`, unfaithful functor excluded | thresholds 2 and 3 sharp | none |
| 10 | Katz | `𝔽̄₂²`, `F(x,y) = (y²,x²)`; `𝔽₃(t)^perf`, `F = tφ`; `F = 0` | fixed vectors `(a,a²)` with `a ∈ 𝔽₄`, an `𝔽₂`-plane; `x² = 1/t` impossible; no fixed basis | `IsAlgClosed` and bijectivity needed | none |
| 11 | §5.4 | `⊕_ℕ 𝔽₂` over `∏ 𝔽₂`; `M = R`; all `R_i = 0` | misses `(1,1,…)`; identity; `0 → 0` | finite presentation needed | none |
| 12 | `free_of_endomorphisms_iso_pi` | `r = 0`; `Rⁿ`; second syzygy `N` over `k⟦x,y,z⟧`; `(x,y)` over `A_1` | `End = 0` forces `M = 0`; `r = n`; `pd k = 3`, so `N` is not free; regularity fails | consistent | none |
| 13 | factoriality | DVR; `A_1` | factorial; `xz = y²` gives two factorizations, and `A_1` is not regular | consistent | none |
| 14 | `localPicard_torsion_eq_one` | node; `A_1`; cubic cone; Veronese cone | `Pic = ℤ`, torsion free; dimension 2 excluded; dimension 2 excluded; not CI (vdim `6−6 = 0 ≠ 3`) | hypotheses needed | none |
| 15 | `localPicard_subsingleton` | field; DVR; `k⟦x,y⟧` | `U = ∅`, one class; `Pic(K) = 0`; factorial, so 0 | consistent | none |
| 16 | `picard_globalCompleteIntersection_*` | quadric `xw−yz` (`n = 3`, `c = 1`); `fs = [1]`; `ℙ³`; plane cubic; cuspidal cubic | `Pic/ℤ[𝒪(1)] = ℤ`, torsion free, (b) not claimed; excluded by `0 < d`; `Pic = ℤ`; `1 + 2 ≤ 2` false; torsion `ℤ/3` excluded | matches CS24 lines 3737–3763 | none |
| 17 | `gmSmallEtale` | `Spec k`; `Spec ℝ`; `Spec k^sep` | `H^0 = kˣ` (`Ga` would give `k`); `H² = ℝˣ/ℝ_{>0} = ℤ/2`, a Zariski model gives 0; `H² = 0` | determines `𝔾_m` | none |
| 18 | `openEtaleHom` | `U = ⊤`; `U = ∅` | isomorphism of the site; source empty, map zero | consistent | none |
| 19 | `etaleCohomology_two_gm_torsion_purity` | `U = ⊤`; `U = ∅`; Segre `R` (dimension 4); cubic-cone `R` (dimension 3) | vacuous, iso; generic stalk of dimension 0 excluded; torsion `0 = 0` while `H²(U) ≠ 0`; dimension 3 excluded (`Br(U)` infinite) | matches CS24 line 122; torsion = `IsOfFinAddOrder` on Noetherian `X` | none |
| 20 | `etaleCohomology_two_gm_puncturedSpectrum_subsingleton` | `k⟦x,y⟧`; `k⟦t⟧`, `k` separably closed and imperfect; route for `d ≥ 3` | `H²(U) = 0`; dimension 1 excluded, `Br(k((t)))[p] ≠ 0` (Poo17 line 8125); `H²(R,μ_n) = 0`, `H³_𝔪(μ_n) = 0` | `2 ≤ dim` needed | none |
| 21 | `etaleCohomology_gm_purity_regular` | `U = ⊤`; `𝔸²_ℂ` minus the axes | identities; generic points of the axes have dimension 1, excluded; §8.18's class is not in the image | matches C19 line 30 | none |
| 22 | §7.5 | `k⟦x,y⟧`; DVR; `A_1`; node; `x₁x₂−x₃x₄` in 5 variables | parafactorial; depth 1, no; depth 2, `Pic(U) = ℤ/2`, no; `Pic(U) = ℤ`, no; `Pic(U) = 0`, depth 4, yes | matches EGA44 21.13.8–21.13.9 | none |
| 23 | §7.11 | `k⟦x,y⟧`; `k⟦x,y,z⟧`; `A_1` | vector bundles trivial; syzygy bundle not free (dimension 3); `(x,y)` gives a nontrivial line bundle | dimension 2 and regularity needed | none |
| 24 | §8.2 | `R′ = R`; `ℝ`; `R′ ⊗ R′` | identities; `H²(ℝ, ℤ/2) = ℤ/2`, dimension `> 1`; product of regular rings of dimension `≥ 2`, `Pic = 0` | matches C19 lines 111–182 | none |
| 25 | §8.4 | `Z` a closed point | `E_1` sits in the single column `a = dim 𝒪_{X,x}` | excision; matches ILO14 line 16281 | none |
| 26 | §8.5 | `Z = V(x) ⊂ 𝔸²`; strictly local regular, `dim = 2` | `H^1_Z = x^ℤ ≅ ℤ`; `H²_𝔪 = Pic(U) = 0`, `H³_𝔪 = H²(U) = 0` | codimension 2 needed | none |
| 27 | §8.13 | `ℚ_p`; `k((t))`, `k` separably closed and imperfect | `K^unr` is `C_1`, `Br = 0`; `K^unr = K`, `Br[p] ≠ 0` | perfectness needed for `ℓ = p` | none |
| 28 | Convention 8 / §8.14 | `(L/K, σ, π)`; `𝔽_q⟦t⟧`; `ℂ⟦t⟧` | the valuation of the factor set is `[i+j ≥ n] = δχ̃` with `χ(σ) = 1/n`; Frobenius gives `χ`, its inverse gives `−χ`; `∂ = 0` | sign pinned | none |
| 29 | Convention 6 | `𝕄(ℤ/pⁿ)`, `𝕄(μ_{pⁿ})` | `FV = φ(ξ)`, `VF = ξ` both; `ξ = p` gives `(pφ, φ⁻¹)`, `(φ, pφ⁻¹)` | matches CS24 Ex. 4.1.2, 4.2.2 | none |
| 30 | §5.8 route | `π^{1/p^m} → π^{1/p^{m+1}}` | `p−1` steps; kernel square `π^{2k/p^{m+1}} ∈ (π^{(k+1)/p^{m+1}})` iff `k ≥ 1`; the whole map is square-zero iff `p = 2` | route correct | none |
| 31 | §7.12a–b at 643f30e (R01 repair) | `D_ℤ(ℤ/3)` fibres; `Spec(k×k)`; `ℤ → ℤ/2`; `2ℤ ⊂ ℤ` | `ℚ×ℚ(ζ₃)`, `𝔽₂×𝔽₄`, `𝔽₃[t]/(t−1)³`, all of degree 3; locally constant `±1` is not `D_S(φ)`; `μ₂ → 𝔾_m` not flat, trivial kernel; squaring, kernel `μ₂`, étale over `S[1/2]` | consistent | R01 |
| 32 | §7.12c–e at 643f30e | `α_p`; `𝔾_m × μ₂` over `k × k`; `𝔾_m × μ₃`, `m = 3`; `V(2(t−1)) ⊂ μ₂/ℤ` | characters `α_p(𝔽̄_p) = 0`, not of multiplicative type; of multiplicative type, not diagonalizable; `G[3] = μ₃²` of rank 9, `Gᵗᵒʳ = 𝔾_m`; fibre trivial over `ℚ`, all of `μ₂` over `𝔽₂`, not flat | consistent | R01 |
| 33 | §7.13(b), §7.15 | `𝔾_m × μ_n`, `m = n` and `m = 1`; node with `d = 3` | `(t,ζ) ↦ (tⁿ,1) = [n]`; `S = T` is not a torus; `H^1(R) = 0` against `Pic(U) = ℤ` | `m` must kill torsion; factoriality needed | none |
| 34 | §§1.4–1.5 against #1743 (R02) | strictly henselian excellent regular, `ℓ` invertible, `f ∈ 𝔪` | §1.4(a) = #1743 §7.1; §1.5 = §7.3; §1.4(c) = §6.12 | two owners | R02 |
| 35 | §7.10 `IsQuasiAffine` (R03) | `U_R` for `k⟦x,y⟧`; for `k[x₁,x₂,…]` localized | quasi-compact, applies; not quasi-compact, excluded by `CompactSpace` | hypothesis correct; name inexact | R03 |

## Not verifiable

- **[Aus62] Theorem 1.3** (uncertified) backs `free_of_endomorphisms_iso_pi`. I checked it only through its use at CS24 lines 3684–3686.
- **SGA 3 VIII–X** (uncertified) back the restored §§7.12a–7.12e. I checked them through the Tau Ceti affine declarations and the computed rows 31–33.
- **SGA 4 XVIII 3.1.8(iii) and SGA 5 I 1.12(a), (4.2.2)** (uncertified). I read them only through CS24 lines 1367–1380.
- **[Gro68] Brauer III 6.1 b), [BH] 2.3.1, [Avr77] 3.6, [DF84] Remark 3, [MB85] Lemme 2, [Bou78] V 4.9 and [Gab04b]** (all uncertified). I read them only through CS24 and C19.
- **[Kat73], [ALB23], [Lau13], [BS22], [BC22], [Čes15], [Bég80], [SGA1], [EGA2], [EGA42], [STACKS], [CTS87], [Gro66] and [dJ02].** These are in the cache but outside this round's sample; I did not open them this round.

## Source issues

- **Misprint** in CS24 at the proofs of Theorems 7.2.1 and 7.2.5, pp. 89–90: the source takes `n ≥ 0` for the Kummer step (lines 3726, 3774); it should say `n ≥ 1`; affects nothing.
- **Gap** in CS24 at Remark 7.2.6, p. 90: the source calls the cone over an arbitrary elliptic curve a complete intersection (line 3781); it should restrict to a plane cubic or an intersection of two quadrics; affects nothing.
