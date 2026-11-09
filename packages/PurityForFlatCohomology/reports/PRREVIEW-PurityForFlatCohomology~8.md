# Review of PurityForFlatCohomology (pull request #1840 at 08c5cf2)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/PurityForFlatCohomology/`: `README.md` (2990 lines) and `Suggested.lean` (257 lines, 13 declarations).

The gate fails with `dropped=39`. There are six findings:
- R01 (P1) and R02, R03 (P2) block;
- R04, R05 and R06 are P3.

The previous review's R01, R02 and R04–R06 are repaired. Its R03 was answered by citing GroupSchemesOverABase as a supplier, which is R01 below.

## R01 (P1) — GroupSchemesOverABase is cited as a supplier: the gate fails and §§7.12a–7.12b have no admissible owner

**Location.** `TauCetiRoadmap/PurityForFlatCohomology/README.md` mentions the name on 38 lines:
- line 43 (diagram) and lines 56, 110–115 (Scope);
- lines 280, 312, 447 and 451–469 (contracts, including `### From TauCetiRoadmap.GroupSchemesOverABase`);
- lines 625 and 1939;
- §7.12a (lines 2308–2313), §7.12b (2317–2321), §§7.12c–7.13 (2325–2435);
- the *Needs* of §§7.14, 7.15, 8.2, 8.5, 8.8 and 8.11, and the Layer 7 and Layer 8 Dependencies.

`Suggested.lean` mentions it at lines 73–74. Line 2311 reads: "and its homomorphisms (`Hom(N, M)` over a connected base, locally constant functions in general) are GroupSchemesOverABase §§1.1–1.2, built with the base change of its §0.1".

**Claim.**
- GroupSchemesOverABase is on the project's dropped-names list: other authors' pull requests whose material our roadmaps own themselves. The brief forbids citing it as a supplier, it is not in `ORDER.txt`, and the gate refuses every mention of the name.
- §7.12a and §7.12b now state nothing; they only point to that roadmap.
- §§7.12c–7.12e, 7.13–7.15 and Layer 8 rest on diagonalizable groups, groups of multiplicative type, character sheaves and largest subtori. Their only cited owner is a roadmap this one may never consume. They are unowned.

**Witness.** The gate rerun at 08c5cf2 gives `dropped=39 … FAIL`, first hit "line 43: GroupSchemesOverABase ──→ Layers 7, 8". `grep -c` counts 38 README lines and 1 `Suggested.lean` line. At e5658f9, README lines 2258–2572 owned §§7.12a–7.12e with no occurrence of the name.

**Repair.**
1. Restore §§7.12a–7.12e as they stood at e5658f9 (README lines 2258–2572 there). That text covers:
   - `D_S(M)` with its base change, points, homomorphisms and Checks;
   - smoothness, kernels and exactness;
   - the definitions of groups of multiplicative type and tori, with the étale/fppf/fpqc comparison;
   - the character sheaf;
   - subgroups, quotients and the largest subtorus.
2. While restoring, keep the previous review's R04(a) repair: delete "[CS24] §7.2, p. 91" in its three places.
3. Restore the contract entries that 08c5cf2 deleted:
   - Mathlib: `specULiftZIsTerminal`, `Over.pullbackId`, `Over.pullbackComp`, `Functor.mapGrpIdIso`, `Functor.mapGrpCompIso`, `Scheme.etalePrecoverage`, `Scheme.fpqcPrecoverage`, `Scheme.Hom.fiber`, `LocallyConstant`, `Group.FG`, `CommGroup.torsion`, `IsMulTorsionFree`;
   - Tau Ceti: `TauCeti.FGCommGrpCat` and the `TauCeti.DiagonalizableGroup.*` and `TauCeti.MonoidAlgebra.*` entries.
4. Delete the GroupSchemesOverABase contract, the diagram row and every other mention, and point the *Needs* lines back to §§7.12a–7.12e.
5. In `Suggested.lean` lines 73–74, write "(README §7.12c defines them)" again.

Do not add an importer record that names that roadmap. Any mention trips the dropped-names check, so this also supersedes the sentence the previous review's R03 asked for. Making GroupSchemesOverABase the owner would need a human to change the dropped-names list and the merge order; this folder cannot do it.

**Tested.** At e5658f9, `git show` finds 0 occurrences of the name. The previous review's gate at that head passed `dropped`. I recomputed the restored objects' Checks (adversarial rows for §§7.12c, 7.12d and 7.13 below).

## R02 (P2) — Étale cohomology of the small étale site exists at the pins: CS24 Theorems 3.2.4/6.2.4 are statable for constant coefficients but absent, and the docstring's reason is inaccurate

**Location.** `Suggested.lean` lines 38–47 give the reason as: "They need fppf (and étale) cohomology with supports, or at least restriction maps on fppf cohomology … which the big fppf and étale sites lack at the pin". The affected targets are README §§1.6 (line 1034) and 6.3 (line 1859), and the list of headlines stated in Lean (lines 46–55).

**Claim.** Gabber's bound `H^i_𝔪(R, G) = 0` for `i < vdim(R)` (§1.6 for invertible order, §6.3 for every order) is a statement about étale cohomology. It needs only the small étale site of `Spec R`:
- at the pin that site has sheafification and a Grothendieck-abelian sheaf category, hence `Ext` and `Sheaf.cohomologyPresheaf`;
- the inclusion of Tau Ceti's punctured spectrum is an object of that site.

For the constant group `ℤ/n`, the statement elaborates in the equivalent form "restriction `H^i(Spec R, ℤ/n) → H^i(U_R, ℤ/n)` is injective for `i < vdim` and bijective for `i < vdim − 1`". What the pins lack is only the abelian étale sheaf of a non-constant finite étale group scheme on the small site.

**Witness.** Mathlib provides the instance `Scheme.instHasSheafifyEtaleSmallEtaleTopology`, `isGrothendieckAbelian_sheaf_smallEtaleTopology` (`AlgebraicGeometry/Sites/AffineEtale.lean:151`) with `IsGrothendieckAbelian.hasExt`, and `Scheme.Etale.mk` (`AlgebraicGeometry/Morphisms/Etale.lean:183`). The block below elaborates.

**Repair.** In `Suggested.lean`, Layer 1, add the following and give each declaration a docstring:

```lean
def puncturedSpectrumEtaleHom (R : Type u) [CommRing R] [IsLocalRing R] :
    Scheme.Etale.mk (TauCeti.IsLocalRing.puncturedSpectrum R).ι ⟶
      Scheme.Etale.mk (𝟙 (Spec (CommRingCat.of R))) :=
  (Scheme.Etale.forget _).preimage
    (Over.homMk (TauCeti.IsLocalRing.puncturedSpectrum R).ι (by simp))

theorem etaleDepth_ge_virtualDimension (R : Type u) [CommRing R] [IsLocalRing R]
    [IsNoetherianRing R] (n : ℕ) [NeZero n] (i : ℕ) :
    ((i : ℤ) < virtualDimension R → Function.Injective
      ((((constantSheaf (Spec (CommRingCat.of R)).smallEtaleTopology AddCommGrpCat.{u}).obj
          (AddCommGrpCat.of (ULift.{u} (ZMod n)))).cohomologyPresheaf i).map
            (puncturedSpectrumEtaleHom R).op)) ∧
    ((i : ℤ) + 1 < virtualDimension R → Function.Bijective
      ((((constantSheaf (Spec (CommRingCat.of R)).smallEtaleTopology AddCommGrpCat.{u}).obj
          (AddCommGrpCat.of (ULift.{u} (ZMod n)))).cohomologyPresheaf i).map
            (puncturedSpectrumEtaleHom R).op)) := by
  sorry
```

This is Theorem 6.2.4 for the constant group. Then:
- In README §6.3, add one sentence naming it for `G = ℤ/n` constant, in this injective/bijective form, and add it to the headline list at lines 46–55.
- §1.6 is its case with `n` invertible in `R`, proved in Layer 1.
- Rewrite the docstring item:
  - the constant-coefficient case is stated;
  - for a non-constant finite étale `G` the pins lack the abelian sheaf of a group scheme on the small étale site;
  - the reason for the non-étale fppf headlines (6.2.3, 6.2.7, 7.1.2) is unchanged.

`[NeZero n]` is needed: `ZMod 0 = ℤ` is not a finite group, and Theorem 6.2.4 says nothing about it.

**Tested.**
- The block was added verbatim to a scratch copy of `Suggested.lean` and elaborated with `lake env lean`: 10 `sorry` warnings and nothing else, under default options.
- Values:
  - for `R = k⟦x, y⟧/(xy)` (vdim 1), `H^0` is `ℤ/n ↪ (ℤ/n)²`, injective, as claimed;
  - for a field (vdim 0), `ℤ/n → H^0(∅) = 0` is not injective and is excluded;
  - for `R` regular of dimension 2 with `n` invertible, absolute purity gives the claim.

## R03 (P2) — Two owners for local duality and the local Lefschetz theorem (§§1.4–1.5); each roadmap names the other as importer

**Location.**
- README lines 69–70 (owned here) and 187–188: "The local étale duality statements and the local Lefschetz theorem (§§1.4–1.5): to be imported by EtaleDualityAndPerverseSheavesPartII".
- Downstream consumers, lines 2888–2889.

**Claim.** EtaleDualityAndPerverseSheavesPartII (open pull request #1743, `ORDER.txt` line 384) claims the same objects, and says this roadmap only imports them:
- §7.1 there is the strict-local affine Lefschetz, which is §1.4(a) here;
- §6.11 there is the normalised dualizing complex, §1.4(b) here;
- §6.12 there is local duality, §1.4(c) here;
- §7.3 there is local Lefschetz, §1.5 here.

The board package SchemeAndStackFoundationsPartII (`ORDER.txt` line 253) likewise lists as its own the finite-ideal excision, adic hyperdescent and ample Brauer comparison that Layer 3 and §7.10 own here.

This roadmap is the admissible owner: it is earlier in the order (line 217), so neither later roadmap can supply it. Each object still has two owners.

**Witness.** #1743 `README.md` line 23: "PurityForFlatCohomology takes the local Lefschetz theorem from §7.3 … and owns none of these statements". Its line 1580 repeats this. SchemeAndStackFoundationsPartII package `README.md` line 1055: "PurityForFlatCohomology uses … finite-ideal excision, adic hyperdescent and the ample Brauer comparison".

**Repair.** Nothing in this folder changes; its Scope and Downstream text is the correct side. Before either merges:
- In #1743, replace lines 23 and 1580 by imports of PurityForFlatCohomology §§1.4–1.5, and turn its §§6.11, 6.12, 7.1 and 7.3, where they restate §1.4(a)–(c) and §1.5, into citations.
- In the SchemeAndStackFoundationsPartII package, line 1055 and its corresponding targets should cite Layer 3 and §7.10 here.

**Tested.** I compared each pair of statements: same hypotheses (strictly henselian excellent regular local ring, `ℓ` invertible) and same conclusions.

## R04 (P3) — Gerbes are cited to SchemeAndStackFoundations §1.18, which does not define them

**Location.**
- README line 2010 (§7.3): "Gerbes are those of SchemeAndStackFoundations §1.18".
- Contract line 420: "§1.18 stacks in groupoids and gerbes".
- Scope line 97.
- The §7.3 *Needs* (line 2022), and §7.10 (line 2233, "a torsion class `α` is represented by a `𝔾_m`-gerbe", whose *Needs* cite only SchemeAndStackFoundations).

**Claim.** SchemeAndStackFoundations §1.18 (main, README lines 2745–2950) is "Stacks in groupoids, stackification and 2-fibre products" and never mentions gerbes. Its Layer 1 introduction (line 2067) assigns "banded gerbes and their `H²` classification" to AlgebraicModuliForArithmeticGeometry (`ORDER.txt` line 34, earlier than this roadmap).

**Witness.** AlgebraicModuliForArithmeticGeometry (#853) README line 1873, "### 4.1 Gerbes and relative locality", defines `IsGerbe` on any site. Its §§4.2–4.3 give bandings and the `H²` classification.

**Repair.**
- Line 2010: "Gerbes are those of AlgebraicModuliForArithmeticGeometry §4.1 (`IsGerbe`), with `BG` the classifying stack of SchemeAndStackFoundations §1.21".
- Add a contract `### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry` with §4.1, and §§4.2–4.3 for the `𝔾_m`-gerbes of §7.10.
- Correct line 420 and the Scope bullet.
- Add the citation to the *Needs* of §§7.3 and 7.10 and to the Layer 7 Dependencies.

**Tested.** `grep -i gerbe` over SchemeAndStackFoundations lines 2745–2950 gives no match. AlgebraicModuliForArithmeticGeometry §4.1's Checks include "The classifying stack BA of any sheaf of groups (SchemeAndStackFoundations §1.21) is a gerbe".

## R05 (P3) — LocalPurity §1.1, cited at line 90, is dropped by an open revision

**Location.** README lines 86–90: "already in Tau Ceti at the pin (…; supplier contracts), which realises LocalPurity §1.1".

**Claim.** The revision #1808 of LocalPurity deletes §1.1, so the citation breaks when #1808 merges. It is not a supplier citation (the supply is the pinned Tau Ceti declarations), so it is P3.

**Witness.** LocalPurity at #1808, `README.md` line 215: "There is no Layer 0 and no §1.1". On main, §1.1 is at line 177. #1808 still has §§1.3, 2.1 and 2.2, which this roadmap cites.

**Repair.** Delete ", which realises LocalPurity §1.1" at line 90. The Tau Ceti names already carry the supply, on main and at #1808.

**Tested.** After deleting the clause, every remaining LocalPurity citation (§§1.3, 2.1, 2.2) resolves both on main and at #1808.

## R06 (P3) — Two *Needs* lines omit inputs their routes use

**Location.**
- §3.3, line 1331: *Needs* "PrismaticCohomologyPartIII §6.0 …; §3.2; DerivedModuleAlgebra §0.4; SchemeAndStackFoundations §0.9 (limits)". The route (lines 1328–1330) passes to "the filtered colimit of `R/I′` over finitely generated `I′ ⊂ I`".
- §7.12, line 2287: *Needs* "§§6.2, 6.5, 7.6, 7.10, 7.11; …". The route (line 2283) says "`Pic(R) = Pic(U_R) = 0` (§7.6)".

**Claim.**
- Passing `H^i(−, G)` through the colimit `R/I = colim R/I′` is continuity of flat cohomology, §0.3. [CS24] proof of Corollary 5.2.10 (line 2389, p. 57) uses this "limit formalism".
- §7.6 proves `Pic(U_R) = 0` only for regular `R`; for complete intersections it proves only torsion-freeness. For complete intersections of dimension `≥ 4`, the vanishing that the Kummer identification `Br(U_R)[n] ≅ H²(U_R, μ_n)` needs is DeformationAndDerivedPatchingAlgebra §6.9, recorded in §7.5.

**Witness.** For the three-dimensional node, §7.6 gives `Pic(U_R) ≅ ℤ`, torsion free, with `Pic(U_R)/n = ℤ/n ≠ 0`. So torsion-freeness alone does not give `Br(U_R)[n] ≅ H²(U_R, μ_n)`.

**Repair.**
- §3.3 *Needs*: add "§0.3 (continuity of flat cohomology)".
- §7.12 route: "(§7.6 for regular `R`; §7.5, from DeformationAndDerivedPatchingAlgebra §6.9, for complete intersections of dimension `≥ 4`)".
- §7.12 *Needs*: add §7.5 and DeformationAndDerivedPatchingAlgebra §6.9.

## Previous findings (PRREVIEW~6, head e5658f9)

- **R01 (P3, pinned Tau Ceti declarations) — repaired.**
  - The Tau Ceti contract (lines 348–373) lists `toOpenₗ_injective_of_isSMulRegular`, `toOpenₗ_bijective_of_isWeaklyRegular`, `tilde_toOpen_bijective_of_two_le_depth`, `Spec.presheaf_map_leTop_bijective_of_flat`, `fullyFaithfulPullbackιOfTwoLeDepth(OfIsLocalRing)`, `ModuleCat.projectiveDimension_add_depth_eq_depth` and `IsRegularLocalRing.depth_eq_ringKrullDim`.
  - PurityOfBranchLocus is no longer cited (0 occurrences).
  - §0.1 (lines 642–645): "… and it is not restated as a target here".
  - The §0.5(b) route (lines 799–804) and the §1.8 route (lines 1117–1122) use the pinned declarations. Line 1121: "Applied to `R` itself that declaration would need `depth R ≥ 2`, which `vdim(R) ≥ 2` does not give".
- **R02 (P3, docstring on torsors) — repaired.** `Suggested.lean` lines 59–64: "neither pin restricts torsors along a morphism of sites … and neither has gerbes".
- **R03 (P3, GroupSchemesOverABase record) — not repaired as asked; reversed.** The ownership itself was handed to that roadmap, which is R01 (P1) above. The record that R03 asked for would also have tripped the dropped-names check; R01's repair replaces it.
- **R04 (P3, locators) — repaired.**
  - "[CS24] §7.2, p. 91" no longer occurs.
  - Lines 165–166 read "the unramified residue towers of [CS24] Lemma 3.1.1(a)".
  - Lines 1831–1832 read "the perfectoid tower `R̃_∞` of PerfectoidSpaces §P7.17 ([CS24] Lemma 3.1.1(b))".
- **R05 (P3, narrow statements) — repaired.**
  - Line 934: "every regular local ring `R̃` has an ideal `I` generated by three elements".
  - Lines 2206–2207: "(b) Under the hypothesis of (a), in particular if `X` is regular".
- **R06 (P3, §1.5 Check 2) — repaired.** Lines 1025–1027: "For `f = 0 ∈ 𝔪`, `R/(f) = R` and the map is the identity … `j_!(ℤ/ℓ) = 0`".

## Verified sound

### Gate, dependency check, build and diff

- **Gate rerun.** Every check is `0` except `dropped=39` (R01), so the gate fails.
- **Dependency check.** `gate --depcheck … --movable` prints `depcheck: 238 roadmaps, 2352 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. GroupSchemesOverABase is absent from `ORDER.txt`; the dropped-names check catches it.
- **Build.** `lake env lean TauCetiRoadmap/PurityForFlatCohomology/Suggested.lean` exits 0 with exactly 9 `declaration uses 'sorry'` warnings.
- **Diff.** The diff outside the folder is empty.
- **Pins.** Mathlib is at `1b1ccf4` and Tau Ceti at `2fd255d`, matching `lake-manifest.json` and the README.

### Lean form

- **Signatures.** I ran `#check @…` on all 13 declarations in a scratch copy; each matches the worker's elaborated signatures. There are no section `variable`s, and every hypothesis is in the signature.
- **One-tactic probe.** Replacing each `sorry` by `first | rfl | infer_instance | simp | decide | trivial | aesop | exact inferInstance` gives 9 errors and 0 closures, so there is no padding.
- **Form.** There is no `lemma`, `set_option`, `#eval` or `True`. The file has one `import Mathlib` plus six existing `TauCeti.*` modules, docstrings on every declaration, and Layer section comments in README order.

### Headline theorems

The README's headlines are:
- CS24 3.3.1, 3.2.4/6.2.4, 6.2.3, 6.2.7, 7.1.2, 7.1.3, 7.2.1, 7.2.3, 7.2.5, 7.2.8–7.2.9, 6.1.1–6.1.2;
- C19 1.1–1.4;
- the Katz, Auslander and factoriality inputs.

Stated in Lean: 3.3.1(a)(b), 7.2.1 (both clauses), 7.2.3 (both clauses), Katz, Auslander and factoriality. The constant-coefficient 3.2.4/6.2.4 is statable but absent (R02).

The others lack carriers at the pins:
- fppf cohomology of the big site (no `HasSheafify` at the morphism universe);
- a `𝔾_m` sheaf on the small étale site (`grep` finds none);
- Azumaya Brauer groups of schemes;
- animated rings;
- torsor restriction along morphisms of sites.

### Library declarations opened at the pins (with `#check`)

**Tau Ceti (14).**
- The 10 newly cited declarations: `Spec.presheaf_map_leTop_bijective_of_flat` (with `[Module.Flat A B]`, `2 ≤ depth A`), `StructureSheaf.toOpenₗ_bijective_of_isWeaklyRegular`, `toOpenₗ_injective_of_isSMulRegular`, `tilde_toOpen_bijective_of_two_le_depth`, `FiniteEtaleScheme.fullyFaithfulPullbackιOfTwoLeDepth`, `…OfIsLocalRing`, `ModuleCat.projectiveDimension_add_depth_eq_depth` (carries `[Small R]`, `pd ≠ ⊤`), `IsRegularLocalRing.depth_eq_ringKrullDim`, `CategoryTheory.Sheaf.Torsor` (built with `lake build` first), `isRegularRing_of_isRegularLocalRing`.
- Plus `projectiveDimension_add_depth_le_ringKrullDim`, `IsRegularLocalRing.uniqueFactorizationMonoid` (`ringKrullDim R ≤ 2`) and `IsRegular.uniqueFactorizationMonoid_stalk` (`Scheme/Regular/Scheme.lean:200`, codimension `≤ 2` only). So §7.4 is not a duplicate.
- No Katz or Auslander criterion exists at the pins (`grep`).

**Mathlib (9).**
- `yonedaGrpObj` (`Monoidal/Cartesian/Grp.lean:75`).
- `GrothendieckTopology.subcanonical_over` (`Sites/SubcanonicalOver.lean:25`).
- `fppfTopology.Subcanonical` (`Sites/Fpqc.lean:98`) and `fppfPrecoverage` (`Fpqc.lean:41`).
- `Scheme.Etale`, `Etale.mk`, `smallEtaleTopology`, the small-étale `HasSheafify` instance, and `isGrothendieckAbelian_sheaf_smallEtaleTopology`.

### Seeded sample of sources (all 15 targets)

| Target | Checked against | Result |
|---|---|---|
| 0.2 | CS24 §1.4 (line 321, p. 8), Lemma 7.1.1 (line 3623, p. 86), proof of Lemma 4.1.12 (lines 1647–1650, p. 40); BC22 Lemma 2.3.2 (line 1126) | matches |
| 1.1 | SGA2 XIV 5.2 (line 7398, pp. 198–199), Déf. 5.3, 5.4, 5.5 (lines 7453–7480, p. 200); CS24 (3.2.1.1)–(3.2.1.2) (lines 1328–1331, p. 32) | matches |
| 1.8 | CS24 Thm 3.3.1 (lines 1418–1424, p. 34), proof (pp. 34–35), Rem. 3.3.2 (line 1460, p. 35); SGA1 V 6.9, 6.10 (lines 4650, 4659) | matches |
| 2.1 | CS24 Thm 4.1.8, (4.1.8.2) (lines 1567–1573, p. 38), Cor. 4.1.9 (lines 1589–1594, pp. 38–39) | matches |
| 3.3 | CS24 Cor. 5.2.9, 5.2.10 (lines 2366–2395, p. 57), §5.1.11 (line 2149, p. 52) | statement matches; *Needs* gap R06 |
| 5.4 | CS24 Lemma 4.2.8 (lines 1764–1767, p. 43) | matches |
| 5.8 | CS24 Thm 5.5.1 (lines 2849–2852, p. 68), Thm 1.2.3 (line 220, p. 6) | matches; G of any order as in 5.5.1 |
| 5.10 | CS24 Thm 6.1.2 (lines 3459–3472, pp. 82–83), Thm 1.1.5 (line 130, p. 4), §1.1 (lines 144–159, p. 5) | matches |
| 6.4 | CS24 Rem. 6.2.6 (lines 3562–3564, p. 85) | matches |
| 7.3 | CS24 Thm 7.1.3 and proof (lines 3664–3700, pp. 87–88) | matches; gerbe owner R04 |
| 7.9 | Gro66 Lemme 1.1 (line 101, p. 290), Prop. 1.4 (line 129, p. 291), Lemme 1.6 (p. 292), Cor. 1.8, Lemme 1.9 (lines 161–167, p. 293) | matches |
| 7.12 | CS24 Thm 7.2.5 and proof (lines 3765–3779, p. 90), Rem. 7.2.6 (lines 3780–3793), Thm 1.1.3 (line 92, p. 3) | statement matches; *Needs* R06 |
| 7.14 | CS24 Thm 7.2.8 and proof (lines 3828–3869, pp. 91–92), footnotes 26–27, Lemma 7.2.7 (lines 3796–3827), Thm 1.1.4 (line 122, p. 4) | matches |
| 8.1 | C19 Thm 5.3 (line 464, p. 12) = Thm 1.3 (line 48, p. 2); CS24 Thm 1.1.3(b) and line 116 (p. 4) | matches |
| 8.18 | C19 §1 (lines 26–28, p. 1) citing [DF84, Rem. 3] | matches; DF84 uncertified |

The README flags no locator as unverified.

The §7.14 route differs from CS24's, so I checked it separately. In "lift through `[n] ∘ q` with kernel `T[mn]`", `i ∘ q = [m]` and `i` is a monomorphism, so `ker([n] ∘ q) = ker [mn] = T[mn]`. A class killed by `n` maps to `q_*(nα) = 0` in `H^i(U, S)`, so it lifts.

### Cross-roadmap citations resolved

**Main.**
- SchemeAndStackFoundations: all 25 sections in the Scope, at their headings, and the 30 backticked names.
- LocalPurity §§1.3, 2.1, 2.2 (also at #1808).
- ModularCurves 0B (line 688), 0E (839), 4D (1882), also at #1808.
- EtaleCohomologyFoundations §§F.0.2, F.0.4, F.5.
- DerivedModuleAlgebra §§0.K.1, 0.4, 0.25, 1.5, 1.7.
- EnhancedDerivedSheaves E5:animation.1–4.
- PerfectoidSpaces §§P1.16–P1.18, P1.24–P1.25, P3.7, P4.15.2, P4.15.4, P7.16a, P7.17, with the four italic targets.

**Open heads.**
- DerivedDeRhamCohomology §§0.19 (line 345), 0.21 (412), 1.10 (537), with 3 names.
- DeformationAndDerivedPatchingAlgebra §3.4 (627), §6.9 (1341, `localCI_parafactorial` 1347).
- PrismaticCohomologyPartIII §6.0 (106), with 3 names.
- PrismaticCohomology §2.0 (2280).
- PrismaticCohomologyPartII Layer 4 (716).
- PerfectoidQuotients §§0.1, 0.2, 0.6, with 4 names; `perfectoid_completely_etale_henselization` covers the `p`-completion of `A[1/a]` used in §5.8.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.40, R07.1.41, R07.2.8.
- ArithmeticGaloisDuality §R02.2.4.
- LefschetzPencilsAndVanishingCycles §0.10.
- MotivesAndAlgebraicCycles §0.5b.

**Board package.** PerfectoidQuotientsPartII §§Q5.2, Q5.4, Q6.3–Q6.7, Q7.1, Q7.3, Q10.1 ("Unramified residue towers", Lemma 3.1.1(a)).

The resolver's 7 leads are false positives: one roadmap is a board package, and six names are roadmap names, not pinned declarations.

### Declared gaps

The three slugs in `plan.json` (`prismatic-dieudonne-perfectoid`, `ci-defect-additivity`, `regular-tower-tilt`) appear at README lines 585, 491 and 566, each with a named supplier. Each is minimal:
- DerivedDeRhamCohomology §0.21 has no additivity statement;
- PrismaticCohomologyPartII mentions ALB23 only among its references;
- PerfectoidQuotientsPartII §Q10.1 computes no tilt.

### Ownership against open work

I read #1743, #1522 and #1808 at their heads with `roadmaps show`, and the SchemeAndStackFoundationsPartII and PerfectoidQuotientsPartII board packages.
- The duplicates are R01 (#1522) and R03 (#1743 and the SchemeAndStackFoundationsPartII package).
- The overlaps tool lists one dropped id; it is R05.
- No open pull request changes this roadmap.
- The other LocalPurity revisions (#1807, #1854) mention neither the virtual dimension nor the semilocal punctured spectrum.
- ComplexKahlerGeometry's factoriality target is about analytic germs, not regular local rings in general.

### Adversarial table

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 `virtualDimension`, `IsCompleteIntersection` | `k⟦x⟧ = k⟦x,y⟧/(y)`; `k⟦x,y⟧/(xy)`; `k⟦x,y⟧/(x,y)²`; `𝔽_p⟦x,y,z,t⟧/(x²,y²,xz−yt)`; valuation ring with `𝔪 = 𝔪²` | `2−1 = 1`; `2−1 = 1 = dim`; `2−3 = −1 < 0`; `4−3 = 1 < 2`; completion `R/𝔪`, every presentation gives `dim B − dim B = 0` | presentation-independent; junk value unused | none |
| §1.3(b) | `k⟦x,y⟧`, `I = (x²,xy,y²)`; field, `I = 0`; `k⟦x,y,z⟧`, `I = (x²,xy,xz)` | depth 0, `pd 2`, vdim `−1`; `pd 0 = dim`; depth 0, vdim 0 | holds in all dimensions | none |
| §1.6 / §6.3 | `k⟦x,y⟧/(xy)` | vdim 1: `H^0_𝔪 = 0`, `H^1_𝔪 ≠ 0` (two components) | sharp | R02 |
| `zariskiNagata_full_faithful_connected` | `k⟦x,y⟧`; `k⟦x,y⟧/(xy)`; field; `R̃/I`, `dim R̃ = 5`, `I` triply generated | vdim 2, `U` connected; vdim 1, excluded, 2 components; vdim 0, excluded, `U = ∅`; vdim `≥ 2` at depth 0 | not subsumed by the depth-two Tau Ceti result | none |
| `zariskiNagata_isEquivalence` | `ℂ⟦u,v,w⟧/(uw−v²)`; `k⟦x,y,z,w⟧/(xy−zw)` | vdim 2, `π_1(U) = ℤ/2`, excluded; vdim `4−1 = 3`, covers extend | threshold sharp | none |
| §2.1 key formula | `ℤ/p` over `𝔽_p`, `𝔽̄_p`; `μ_{p^n}`; `α_p` | `𝔽_p, 𝔽_p, 0`; `𝔽_p, 0, 0`; `V^n = p^nφ^{−n} = 0` so `RΓ = 0`; `V − 1 = −1`, `RΓ = 0` | matches flat cohomology | none |
| §3.3 | `α_p`, `𝔽_p[ε]/(ε²)`; `μ_p`, `ℤ/p²`; `𝔾_m`, `k[ε]` | `H^0 = H^1 = 𝔽_pε → 0`; `μ_p(ℤ/p²) = 1+pℤ/p² ≅ ℤ/p → 1`; kernel `1+kε` | ranges `i ≥ 2`, resp. `i ≥ 1`, sharp | R06 |
| §5.4 | `I = ℕ`, `R_i = 𝔽_2`, `M = ⊕𝔽_2`; all `R_i = 0` | the map misses `(1,1,…)`; `0 → 0` | f.p. needed | none |
| §5.10 | `d = 0`, `A = 𝔽_p` | `H^0(𝔽_p, ℤ/p) = ℤ/p ≠ 0` | range sharp | none |
| §6.4 | `xy` in `𝔽_p⟦x,y,z,t⟧/(x²,y²,xz−yt)` | `x·xy = y·xy = 0`, `z·xy = y²t = 0`, `t·xy = x²z = 0`; monomials divisible by `x²,y²,xz,yt` | nonzero class | none |
| `frobeniusSemilinear_exists_fixed_basis` | `M = K`, `F = cφ`; `M = 0`; `𝔽_3(t)^{perf}`, `F = tφ` | `x^{p−1} = c^{−1}`; `Fin 0`; `x² = 1/t`, `v(x) = −1/2 ∉ ℤ[1/3]` | `IsAlgClosed` needed | none |
| `free_of_endomorphisms_iso_pi` | `Rⁿ`; `M = 0`; second syzygy `N` of `k` over `k⟦x,y,z⟧` | `End = R^{n²} ≅ M^n`; `0 ≅ 0^r`; `pd k = 3` so `N` is not free and no `End N ≅ N^r` | consistent | none |
| §7.3 | `(ℤ/2)_k` trivial torsor; `μ_2` over `ℂ⟦x,y⟧^{μ_2}` | `Hom` dimensions `4, 4, 8`; does not extend (normal, not regular) | regularity needed | R04 |
| `isRegularLocalRing_uniqueFactorizationMonoid` | `k⟦x,y,z⟧`; `A_1` | UFD (Tau Ceti covers only `dim ≤ 2`); `xz = y²`, not regular | general case is new | none |
| `localPicard_torsion_eq_one` | node `xy−zw`; `A_1`; Veronese cone | `Pic(U) = ℤ`; `dim 2`, excluded, `ℤ/2`; not CI, excluded | hypotheses needed | none |
| `localPicard_subsingleton` | field; DVR; `k⟦x,y,z⟧` | `U = ∅`; `Pic(Spec K) = 0`; `Pic(U) ⊂ Cl(R) = 0` | holds | none |
| `picard_…_torsion_eq_one` | quadric surface (`n = 3`, `c = 1`); plane cubic | `ℤ²/ℤ(1,1) ≅ ℤ`; `3 ≤ 2` false, excluded | holds | none |
| `picard_…_bijective_zpow` | `ℙ³` (`fs = []`); quadric surface; `f = 1`; `0 ∈ fs` | `0+3 ≤ 3`, `Pic = ℤ`; `1+3 ≤ 3` false; positive degree excludes it; `0` not regular on the nonzero quotient | holds | none |
| §7.9 | DVR; `Spec K` | `Br(R) ↪ Br(K)`; identity of `H²(K, 𝔾_m)` | matches Gro66 1.8 | none |
| §7.12 | `W(k)⟦x,y,z⟧`; `S^{sh}⟦x,y⟧/(xy)`, cubic cone; node | `Br = Br(k)`; dim 3, `Br(R) = 0`, `Br(U)` infinite; `Pic(U)/n = ℤ/n ≠ 0` | Kummer step needs `Pic(U) = 0` | R06 |
| §7.12c (restored) | `𝔾_m ⊔ μ_2` over `Spec(k×k)`; `μ_p/𝔽_p`; circle over `ℝ` | mult. type, not diagonalizable; `𝔽_p[t]/(t−1)^p` not smooth; torus split by `ℂ` | discriminating | R01 |
| §7.12d (restored) | `[n]` on `𝔾_m`; `μ_2 → 𝔾_m`; `1 → μ_2` over `𝔽_2` | `X^*` is `n` (injective) → faithfully flat; `ℤ → ℤ/2` → closed immersion; `ℤ/2 → 0`, not flat | holds | R01 |
| §7.13 | `𝔾_m × μ_n`, `m = n`; `μ_n`; `m = 1` | `S ≅ 𝔾_m`, `(t,ζ) ↦ (t^n,1) = [n](t,ζ)`; `S = D(0)`; `S = T`, not a torus | `m` must kill torsion | none |
| §7.14 | `A_1`, `T = 𝔾_m` | `Pic(U) = ℤ/2 ≠ 0 = Pic(R)`, not geometrically parafactorial | hypothesis needed | none |
| §8.1 | `k⟦x,y⟧`, `k` separably closed; cubic-cone CI | `H²(U, 𝔾_m) = 0`; `Br(U)` infinite, not regular | regularity needed | none |
| §8.18 | `uⁿ = x`, `vⁿ = y`, `uv = ζvu` at `x = 0` | `uvu^{−1} = ζv`, crossed product with `σ(v) = ζv`, `uⁿ = π`; residue the Kummer character of `y ≠ 0`; `n = 1`: trivial | sign as Convention 8 | none |
| `etaleDepth_ge_virtualDimension` (R02 repair) | `n = 0`; `k⟦x,y⟧/(xy)`; field | `ZMod 0 = ℤ`, excluded by `NeZero`; `ℤ/n ↪ (ℤ/n)²`; vdim 0, nothing claimed | elaborates | R02 |

## Not verifiable

- **SGA 3 VIII–X** (uncertified). These back §§7.12a–7.13; I checked them only through the computed Checks above.
- **[Aus62] Theorem 1.3** (uncertified). I could not check whether it assumes the ring unramified (Tor rigidity, extended by Lichtenbaum). CS24 line 3684 cites it for every regular local ring, and the Lean statement is true in that generality.
- **[DF84] Remark 3, [MB85] Lemme 2, [Gab04b], [Gro68], [Bou78] V 4.9, [Avr77] 3.6, [BH] 2.3.1, SGA 4, SGA 5.** All are uncertified. I read them only through CS24 and C19.

## Source issues

- **Error** in CS24 at Theorem 7.1.2, p. 87: the source says the regular clause needs dimension `≥ d − 1`, which admits fields when `d = 1`; it should say dimension `≥ max(d − 1, 1)`, as `Spec k ⊔ Spec k` with `Z` one point shows; affects a stated result.
- **Misprint** in CS24 at the proofs of Theorems 7.2.1 and 7.2.5, pp. 89–90: the source says `n ≥ 0` for the Kummer step; it should say `n ≥ 1`; affects nothing.
- **Misprint** in CS24 at the proof of Theorem 3.3.1(b), p. 35: the source assumes `vdim(R_d) ≥ 3`; it should say `vdim(R) ≥ 3`; affects nothing.
- **Misprint** in CS24 at the proof of Theorem 6.2.7, p. 85: the source writes `(p, x_1, …, x_n)²` with `d` variables; it should say `(p, x_1, …, x_d)²`; affects nothing.
- **Gap** in CS24 at the proof of Theorem 6.2.7, p. 85: the source applies Lemma 4.1.12 with `n = dim R`, which that lemma's hypothesis `n < dim R` excludes; it should drop the hypothesis from Lemma 4.1.12 (p. 40), whose proof never uses it; affects the proof.
- **Gap** in CS24 at Remark 7.2.6, p. 90: the source calls the cone over an elliptic curve a complete intersection; it should restrict to a plane cubic or an intersection of two quadrics, since normal cones of higher degree are not; affects nothing.
- **Gap** in C19 at Proposition 2.2, p. 4: the source infers injectivity of `H^1(V, G) → H^1(V_{R′}, G)` for possibly noncommutative `G` from a trivial-kernel argument; it should assume `G` commutative; affects nothing, since both uses have commutative `G`.
