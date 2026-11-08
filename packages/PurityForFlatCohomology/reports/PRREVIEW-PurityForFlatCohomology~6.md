# Review of PurityForFlatCohomology (pull request #1840 at e5658f9)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/PurityForFlatCohomology/` (`README.md`, 3153 lines; `Suggested.lean`, 252 lines, 13 declarations). The gate passes and nothing blocks. Six P3 findings remain:
- citations of pinned Tau Ceti declarations are missing;
- the docstring gives an inaccurate reason in one item;
- an ownership record is missing (previous R05, not repaired);
- some locators point to texts that do not contain the statement;
- two statements are narrower than their sources;
- one Check is vacuous.

## R01 (P3) — Pinned Tau Ceti already proves the Auslander–Buchsbaum formula, affine Hartogs and depth-two full faithfulness; the README takes them from roadmaps or restates them

**Location.**
- `README.md` line 118: "*The Auslander–Buchsbaum formula*: PurityOfBranchLocus §0.3." The same source is cited in the contract (lines 465–469), the §7.2 *Needs:* (line 1947), the diagram (line 41) and the Layer 7 Dependencies (line 2673).
- §0.1, lines 648–649, an API bullet marked "(each a target)": "For `R` Noetherian local of depth `≥ 2`, restriction `Γ(Spec R, 𝒪) → Γ(U_R, 𝒪)` is bijective (SchemeAndStackFoundations §0.6, `coherent_hartogs`)."
- The §0.5(b) route (lines 781–785) re-derives the Koszul argument.
- The §1.8 route (lines 1088–1090) says "Hartogs (SchemeAndStackFoundations §0.6) extends them" for morphisms of finite étale schemes over the regular `R̃`.

**Claim.** All of these are proved at the Tau Ceti pin. The README says it defers to the libraries (Scope, "Each object has one owner"), yet it cites none of these declarations.

**Witness.**
- `TauCeti/RingTheory/Depth/AuslanderBuchsbaum.lean:148`, `ModuleCat.projectiveDimension_add_depth_eq_depth`: `pd M + depth M = depth R` for nonzero finite `M` of finite projective dimension.
- `TauCeti/AlgebraicGeometry/PuncturedSpectrum/Sections.lean:89`, `TauCeti.AlgebraicGeometry.Spec.presheaf_map_leTop_bijective_of_flat`. With `B = A` this is the §0.1 bullet.
- `TauCeti/AlgebraicGeometry/Modules/Tilde/Hartogs.lean:134`, `TauCeti.AlgebraicGeometry.StructureSheaf.toOpenₗ_bijective_of_isWeaklyRegular`: `M → M~(U)` is bijective when `D(a), D(b) ⊆ U` for a weakly `M`-regular pair. There is no Noetherian hypothesis, so this is the step at the end of the §0.5(b) route.
- `TauCeti/AlgebraicGeometry/FiniteEtale/FullyFaithful.lean:105`, `TauCeti.FiniteEtaleScheme.fullyFaithfulPullbackιOfTwoLeDepth`: restriction of finite étale schemes to `W` is fully faithful when `depth R_𝔭 ≥ 2` for every `𝔭 ∉ W`. Line 120 has the local variant `…OfIsLocalRing`.

**Repair.**
1. Add the four declarations to `### From Tau Ceti`, with their files.
2. Line 118 and lines 465–469: replace PurityOfBranchLocus §0.3 by `ModuleCat.projectiveDimension_add_depth_eq_depth`. Do the same at lines 1947 and 2673, and delete the PurityOfBranchLocus contract, its diagram row (line 41) and its dependency entries. Nothing else is taken from that roadmap.
3. §0.1: move the depth-two bullet out of the target list and cite `Spec.presheaf_map_leTop_bijective_of_flat` (with `B = R`, `W = U_R`).
4. §0.5(b): replace the Koszul paragraph by "at a generic point `z` of the non-extension locus, apply Tau Ceti `toOpenₗ_bijective_of_isWeaklyRegular` to `Spec 𝒪_{X,z}`, `U` its punctured spectrum and the regular pair `m_1, m_2`".
5. §1.8 route and *Needs:*: "Tau Ceti `fullyFaithfulPullbackιOfTwoLeDepth` extends them". Note that it does not prove §1.8(a) itself: vdim `≥ 2` does not imply depth `≥ 2` (§1.3).

**Tested.** All five names elaborate with `#check` in a scratch file importing their modules, with the signatures quoted. For `R = k⟦x, y⟧` (depth 2), `presheaf_map_leTop_bijective_of_flat` with `B = R` gives `Γ(U_R, 𝒪) = R`, which is §0.1 Check 3.

## R02 (P3) — The docstring's reason why purity for torsors is not statable is inaccurate at the pins

**Location.** `Suggested.lean` lines 59–60: "there are no torsors under, or gerbes banded by, a finite locally free group scheme over a scheme."

**Claim.** The pins can state `G`-torsors under a finite locally free `X`-group `G`:
- Tau Ceti defines torsors under any sheaf of groups on a site.
- Mathlib turns a group object into a presheaf of groups, and the fpqc topology (hence fppf) is subcanonical.

What is actually missing for [CS24] Theorem 7.1.3 is restriction of torsors along `X ∖ Z → X` (no pullback or functoriality in the torsor file) and gerbes (the word occurs in neither pin). The conclusion "not statable" stands; the stated reason does not.

**Witness.**
- `TauCeti/CategoryTheory/Sites/NonabelianCohomology/Torsor.lean:61`, `structure Torsor (G : Sheaf J GrpCat.{w})`, with `NonabelianH1` (line 226).
- Mathlib `CategoryTheory/Monoidal/Cartesian/Grp.lean:75`, `yonedaGrpObj`.
- `AlgebraicGeometry/Sites/Fpqc.lean:17–26`: "The fpqc topology is subcanonical."

**Repair.** Replace lines 59–60 by: "Tau Ceti has torsors under a sheaf of groups on a site (`CategoryTheory.Sheaf.Torsor`), but neither pin restricts torsors along a morphism of sites, and neither has gerbes."

**Tested.** `grep -i gerbe` over both pins gives no match. `Torsor.lean` declares no map between torsor categories of different sites.

## R03 (P3) — GroupSchemesOverABase claims §§7.12a–7.12e as its own, and the Scope still does not record it (previous R05, not repaired)

**Location.**
- `README.md` lines 167–179: "Two roadmaps later in the merge order plan statements of this roadmap". The two are SchemeAndStackFoundationsPartII and EtaleDualityAndPerverseSheavesPartII.
- Downstream consumers, lines 3041–3052.
- No line of the README mentions GroupSchemesOverABase.

**Claim.** One object has two owners. This roadmap owns diagonalizable groups, groups of multiplicative type, tori, character sheaves and largest subtori over a base (Scope lines 77–80, §§7.12a–7.12e). The open pull request #1522 claims the same objects. This roadmap is the right owner: GroupSchemesOverABase may not be a supplier and is absent from `ORDER.txt`, while this roadmap is at line 219. The duplicate itself is for #1522 to remove; what this folder lacks is the record that it owns these objects and that GroupSchemesOverABase is to import them.

**Witness.** GroupSchemesOverABase (#1522), README line 107: "PurityForFlatCohomology §§7.12a–7.12e restate diagonalizable groups, … This roadmap owns them (1.1–1.4, 2.1–2.3, 2.7)".

**Repair.**
1. Under lines 171–179 add: "Diagonalizable groups, groups of multiplicative type and tori over a base, with character sheaves, subgroups, quotients and largest subtori (§§7.12a–7.12e): to be imported by GroupSchemesOverABase (its 1.1–1.4, 2.1–2.3, 2.7), which is not a supplier of this roadmap."
2. Change "Two roadmaps later in the merge order" to "Three roadmaps".
3. Add the same bullet under Downstream consumers.

## R04 (P3) — Locators into texts that do not contain the statement

**Location.**
- (a) `[CS24] §7.2, p. 91` at line 2270 (§7.12a, the definition of `D_S(M)` and its base change), line 2418 (§7.12c, "the étale, fppf and fpqc versions agree by the theorem below") and line 2576 (§7.13, the definitions).
- (b) PerfectoidQuotientsPartII:
  - line 551, "§Q10.1 the towers of [CS24] Lemma 3.1.1";
  - lines 154–155;
  - line 1796, "§Q10.1(a)";
  - line 1797, "the perfectoid tower `R̃_∞` of §Q10.1(b)".

**Claim.**
- (a) CS24 p. 91 only uses "finite type X-group of multiplicative type" in the statement of Theorem 7.2.8. It defines neither `D_S(M)` nor the predicate, and it does not compare étale, fppf and fpqc covers.
- (b) PerfectoidQuotientsPartII §Q10.1 is "Unramified residue towers". It states only [CS24] Lemma 3.1.1(a) and has no parts (a)/(b). The perfectoid tower is PerfectoidSpaces §P7.17.

**Witness.**
- CS24 line 3828 (p. 91) and line 3871 (p. 92) are the only occurrences of "multiplicative type" in CS24.
- PerfectoidQuotientsPartII package README lines 1395–1401: §Q10.1 proves Lemma 3.1.1(a); "The perfect-residue-field tower of Lemma 3.1.1 (b) is PerfectoidSpaces P7.17."

**Repair.**
- (a) Delete "[CS24] §7.2, p. 91" at lines 2270 and 2418. At line 2576 keep only "SGA 3 IX, 1.1 and X, 4.5". The CS24 use in §7.13(a), "[CS24] proof of Theorem 7.2.8, p. 92" (line 2581), is correct: CS24 line 3852 is on p. 92.
- (b) Line 551: "§Q10.1 the unramified residue towers ([CS24] Lemma 3.1.1(a))". Lines 154–155: "the unramified residue towers of [CS24] Lemma 3.1.1(a)". Line 1796: "PerfectoidQuotientsPartII §Q10.1". Line 1797: "the perfectoid tower `R̃_∞` of PerfectoidSpaces §P7.17 ([CS24] Lemma 3.1.1(b))".
- Leave the gap sentence (lines 553–559) as declared in `plan.json`.

## R05 (P3) — Two statements are narrower than their sources

**Location.**
- `README.md` line 911, §1.3(b): "every regular local ring `R̃` of dimension `≥ 3` has an ideal `I` generated by three elements with `pd_{R̃}(R̃/I) = dim R̃`".
- Line 2161, §7.9(b): "If `X` is regular, `H²_ét(X, 𝔾_m) → H²_ét(K, 𝔾_m)` is injective".

**Claim.**
- Kohn's Theorem A, and CS24 Remark 3.2.2 which applies it, hold for every Noetherian ring and every regular local ring. "Of dimension `≥ 3`" is a hypothesis the statement does not need.
- Gro66 Corollaire 1.8 gives the injectivity of (b) under the hypothesis of (a), that strict henselizations are factorial, not only for regular `X`.

**Witness.**
- Koh72 lines 28–30 (Theorem A, p. 55): any finite module of projective dimension `h` over a Noetherian ring has a triply generated `I` with `pd(R/I) = h`.
- Gro66 line 161 (p. 293): Cor. 1.8 holds "sous les conditions de 1.4", which are the factorial strict henselizations of line 129.
- Instances: for `R̃ = k⟦x, y⟧`, `I = (x², xy, y²)` gives `pd = 2 = dim` and depth `0`. `k⟦x_1, …, x_5⟧/(Σ x_i²)` over a separably closed `k` of characteristic `≠ 2` is factorial and strictly henselian but not regular.

**Repair.**
- §1.3(b): delete "of dimension `≥ 3`". Check 3 already explains why only `dim R̃ ≥ 4` separates the invariants.
- §7.9(b): "(b) Under the hypothesis of (a), in particular if `X` is regular, … is injective".

## R06 (P3) — §1.5 Check 2 tests a case the hypothesis excludes

**Location.** `README.md` line 998: "For `f` a unit, `R/(f) = 0` and the claim says `H^i_𝔪(R, ℤ/ℓ) = 0` for `i < dim R`".

**Claim.** §1.5 assumes `f ∈ 𝔪` (line 984), so a unit `f` is outside the statement. The claim says nothing about it, and the Check is vacuous.

**Witness.** Line 984: "for a regular local ring `(R, 𝔪)`, `f ∈ 𝔪` and a prime `ℓ` invertible in `R`". CS24 line 1356 has the same hypothesis.

**Repair.** Replace it with: "For `f = 0`, `R/(f) = R`, the map is the identity and bijective in every degree, and `j_!(ℤ/ℓ) = 0` because `Spec R[1/0] = ∅`."

**Tested.** With `f = 0 ∈ 𝔪`, the route's `H^i_𝔪(R, j_!ℤ/ℓ) = 0` holds for all `i`.

## Previous findings (PRREVIEW~5, head 0306f55)

- **R01 (P2, Corollary 7.2.3) — repaired.** It is now stated as two theorems:
  - `picard_globalCompleteIntersection_torsion_eq_one` (lines 224–235): "If `n − c ≥ 2`, the quotient `Pic(X) / ℤ·[𝒪(1)]` is torsion free";
  - `picard_globalCompleteIntersection_bijective_zpow` (lines 240–246), "SGA 2, Exposé XII, Corollaire 3.7".

  `classTwistingSheafOne` (line 205) uses a `ULift.{u}` index. The Tau Ceti contract now lists the twisting-sheaf declarations (lines 353–363), and §7.8 names both theorems (lines 2123–2126).
- **R02 (P3, punctured spectrum and π_1 reason) — repaired.**
  - Headlines use `TauCeti.IsLocalRing.restrictPunctured` and `puncturedSpectrum`.
  - The docstring now says the π_1 clauses "are equivalent, through Tau Ceti's Galois category … to the clauses on the restriction functor stated here".
  - §0.1 compares the semilocal carrier with Tau Ceti's (lines 626–628).
- **R03 (P3, SGA 3 catalogue) — repaired.** `Suggested.lean` has 13 declarations, none from SGA 3. The README has no backticked `diagonalizableGroup`, `IsMultiplicativeType` or `IsTorus`, and line 57 says "supporting theory, specified here only".
- **R04 (P3, statement-hygiene) — repaired.** The gate shows `statement-hygiene=0`.
- **R05 (P3, GroupSchemesOverABase record) — not repaired.** This is R03 above.
- **R06 (P3, §7.12b) — repaired.** Line 2348: "over `Spec A` this is Tau Ceti's `TauCeti.DiagonalizableGroup.kernelCoordinateIso`". The five names are in the contract (lines 324–334).
- **R07 (P3, SchemeAndStackFoundations sections) — repaired.** Scope line 100 lists "§§0.3, …, 0.21, …, 4.7, 4.8", and the contract (lines 409, 419–420, 433–434) names them.
- **R08 (P3, locators) — repaired as asked.** "[C19] §2" is gone from §§7.12a–7.13. Line 2085 reads "([CS24] Remark 7.2.6, p. 90)". The CS24 p. 91 locator that remained is R04(a).
- **R09 (P3, §7.9 Check 3) — repaired.** Lines 2175–2178: "(a) says that `H^i(K, 𝔾_m)` is torsion for `i ≥ 2` … in (b) the map is the identity … `H^1(K, 𝔾_m) = 0` is Hilbert 90".

## Verified sound

### Gate, dependency check, build and diff

- The gate rerun (`gate … --base origin/main`) prints every check `=0` and `OK`. It has no `build` field; `gate.md` records `build=0`.
- `gate --depcheck … --movable` prints `depcheck: 229 roadmaps, 2316 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. The suppliers' `ORDER.txt` lines (DeformationAndDerivedPatchingAlgebra 77, PrismaticCohomologyPartIII 83, PerfectoidQuotientsPartII 218) all precede this roadmap at 219.
- `lake env lean TauCetiRoadmap/PurityForFlatCohomology/Suggested.lean` exits 0 with exactly 9 `declaration uses 'sorry'` warnings and nothing else.
- The diff outside the folder is empty, and the worktree is clean.
- The pins match `lake-manifest.json`: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`.

### Lean form

- **Signatures.** I appended `#check @…` for all 13 declarations and elaborated once; each type matches `signatures.md`. There are no section `variable`s. Every hypothesis is in the signature: `IsNoetherianRing` on the four local headlines, `IsAlgClosed` and `FiniteDimensional` for Katz, `Module.Finite` and `Module.IsReflexive` for Auslander, positive degree and `IsWeaklyRegular` for the global complete intersections. The README statements in §§1.8, 5.6, 7.2, 7.4, 7.6 and 7.8 have the same generality.
- **One-tactic probe.** I replaced every `sorry` by `first | rfl | infer_instance | simp | decide | trivial | aesop`: 9 errors, 0 closures.
- **Form.** There is no `lemma`, `set_option`, `#eval` or `True`. The file has one `import Mathlib` plus six existing `TauCeti.*` modules, docstrings on every declaration, and Layer section comments in README order.

### Headline theorems

The README's headlines are:
- Theorems 6.2.3 and 6.2.7;
- Theorem 3.2.4 / 6.2.4;
- Theorem 7.1.2;
- Theorem 7.1.3;
- Theorems 7.2.1, 7.2.3, 7.2.5 and 7.2.8–7.2.9;
- Theorem 3.3.1;
- C19 Theorems 1.1–1.4 with the residue sequences;
- Katz, Auslander and Auslander–Buchsbaum factoriality.

Theorems 3.3.1, 7.2.1 and 7.2.3 and the three classical inputs are stated. The other headlines are named in the docstring with their missing carrier. I rechecked those carriers at the pin:
- Tau Ceti has only Zariski cohomology of `𝒪_X`-modules (`Cohomology/Basic.lean`: `cohomologyOn`, `cohomologyOnRes`) and no fppf or étale cohomology with supports.
- The Brauer group is defined over fields only (`Algebra/BrauerGroup/*`).
- Torsor restriction is absent (R02).
- There are no animated rings.

### Library declarations opened at the pins

All of these resolve with `#check` in scratch files.
- **Mathlib (14):** `IsRegularLocalRing`, `Scheme.IsQuasiAffine`, `Int.csInf_empty`, `specULiftZIsTerminal`, `hopfSpec`, `Scheme.fppfTopology`, `etaleTopology`, `smallEtaleTopology`, `Sheaf.cohomologyPresheaf`, `PreGaloisCategory.functorToContAction`, `Submodule.spanFinrank`, `Functor.mapGrpIdIso`, `Functor.mapGrpCompIso`, `WittVector.fontaineTheta`.
  - `Scheme.IsQuasiAffine` (`AlgebraicGeometry/QuasiAffine.lean:34`) extends `CompactSpace`, as §7.10 says.
  - `Int.csInf_empty` gives `sInf ∅ = 0`, as §1.1 says.
- **Tau Ceti (46):** every name in the contract, among them:
  - `restrictPunctured_faithful_iff : … Faithful ↔ 0 < ringKrullDim R`;
  - `free_of_isReflexive`, which carries `ringKrullDim A ≤ 2`;
  - `uniqueFactorizationMonoid`, which carries `ringKrullDim R ≤ 2`;
  - `hasProjectiveDimensionLE`, which carries `[Small R]`.

  Plus the five names of R01.
- `…/DiagonalizableGroup/Scheme/MultiplicativeType.lean` has no object file at this worktree's build, so I confirmed its theorem by `grep` in the source.

### Seeded sample of sources

| Target | Checked against |
|---|---|
| 1.3 | CS24 Remark 3.2.2 (lines 1346–1352, p. 33); Koh72 Theorem A (lines 28–30, p. 55). The generality issue is R05. |
| 1.5 | CS24 Lemma 3.2.3 and proof (lines 1356–1380, p. 33). The route through (3.2.3.1)–(3.2.3.2), ILO14 XV 1.2.4 and XVII Théorème 0.2 matches. In the cached arXiv v1 of ILO14 these are line 10362 and Théorème 0.9 at line 12220, as the README says. |
| 5.5 | CS24 Prop. 4.2.9 (lines 1768–1777, p. 43) and Lemma 4.2.8 (line 1764). |
| 5.9 | CS24 Thm 6.1.1 and (6.1.1.1) (lines 3430–3456, p. 82); (1.1.6) (line 141, p. 4); Lemma 2.2.3 (line 764, p. 19). The route (products, a single `a`, Thm 5.5.1, Prop. 4.2.7) matches. |
| 7.2 | CS24 proof of Thm 7.1.3 (lines 3684–3686, p. 88) uses [Aus62, Thm 1.3] with exactly the hypothesis `Hom(M, M) ≅ M^{⊕r}`. Aus62 itself is under Not verifiable. |
| 7.3 | CS24 Thm 7.1.3 and proof (lines 3664–3700, pp. 87–88). The Hom identification at lines 3689–3693 matches the README's. |
| 7.4 | SGA2 XI Théorème 3.13(i) (line 3755, printed p. 105). |
| 7.7 | CS24 Remark 7.2.2 (lines 3727–3736, p. 89). |
| 7.9 | Gro66 Lemme 1.1, Prop. 1.4, Lemme 1.6, Cor. 1.8, Lemme 1.9 (lines 101–170, pp. 290–293); C19 Lemma 3.2 (lines 248–251, p. 7); CS24 proof of Thm 7.2.9 (lines 3887–3893, p. 93). The generality issue is R05. |
| 7.12c | The definitions rest on SGA 3, which is uncertified. The Checks are computed below. The CS24 locator fails (R04). |
| 7.12d | SGA 3 X §5 is uncertified. The Checks are computed below. |
| 7.13 | C19 proof of Thm 6.1 (line 504, p. 13, citing SGA 3 X 4.5); CS24 proof of Thm 7.2.8 (line 3852, p. 92). |
| 8.3 | C19 Thm 1.4 (lines 87–89, p. 3), §5.4 (lines 484–489, p. 13), Def. A.1 and Lemma A.2 (lines 568–580, p. 15). |
| 8.6 | C19 Thm 6.1 and proof (lines 493–518, p. 13). |
| 8.10 | C19 Thm 1.2 (lines 45–46, p. 2), Thm 6.2 (lines 520–535, pp. 13–14), Lemma 3.2 (p. 7). |

Also checked:
- CS24 Thm 3.3.1 (lines 1418–1424, p. 34), Thm 7.2.1 (lines 3707–3726, pp. 88–89), Cor. 7.2.3 (lines 3737–3755, p. 89) and Remarks 7.2.4–7.2.6 (lines 3758–3793, p. 90). Cor. 7.2.3 holds over any field `k`, as the Lean states.
- SGA2 XII Cor. 3.7 (line 4319, printed p. 121; "Pic(X) est le groupe libre engendré par … OX(1)", over a field) and XIV Prop. 5.2 (line 7398, printed p. 198).
- Kat73 Prop. 4.1.1 (line 2310, printed p. 142; the field case at pp. 143–145) and its use in CS24 line 1844.
- ILO14 XVIII-A Lemma 2.2 and (2.a) (lines 16269–16279, printed p. 333).
- C19 Lemma 2.1 and Props 2.2–2.3 (lines 111–157, pp. 3–4).

No README locator is flagged as unverified.

### Cross-roadmap citations resolved

Each section was found as a heading, at main or at the open head.
- **SchemeAndStackFoundations (main):** §0.6 `coherent_hartogs` (line 707), and the sections listed in the Scope.
- **LocalPurity (main):** §§1.1 (line 177), 1.3 (218), 2.1 (259), 2.2 (302).
- **PurityOfBranchLocus (main):** §0.3 `auslander_buchsbaum` (line 185).
- **DerivedDeRhamCohomology (#868):** §0.19 (line 345) with `DerivedDeRham.cohenFactorization` (367), §0.21 (412) with `absoluteCompleteIntersection` (424), §1.10 (537) with `ordinaryFlatnessFromCompleteFlatness` (549). The resolver's leads on these three names are false positives: they are roadmap names, not pinned declarations.
- **DeformationAndDerivedPatchingAlgebra (#1034):** §3.4 (line 627), with the prefix, presentation-independence, CM and flat-local clauses; §6.9 `localCI_parafactorial` (line 1347).
- **PrismaticCohomologyPartIII (#1070) §6.0 (line 106):**
  - `perfectDieudonneComparison` (108);
  - `pContinuity` and `FlatCohomology.excision` (125);
  - the animated flat cohomology, the deformation fibre sequence and the Bégueri resolution in its route (line 135).

  The resolver's leads on `pContinuity` and `perfectDieudonneComparison` are false positives.
- **Other open heads:**
  - PrismaticCohomology §2.0 (line 2280);
  - PrismaticCohomologyPartII Layer 4 (line 716);
  - PerfectoidQuotients §§0.1 (549), 0.2 (617), 0.6 (921), with its four names (lines 933–985);
  - FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.40 (2637), R07.1.41 (2664);
  - ArithmeticGaloisDuality §R02.2.4 (1523);
  - LefschetzPencilsAndVanishingCycles §0.10 (701);
  - MotivesAndAlgebraicCycles §0.5b (161). It covers smooth varieties over a field only, so §8.4's closed-support version is a legitimate variant.
- **PerfectoidQuotientsPartII (board package):** §§Q5.2 (382), Q5.4 (449), Q6.3–Q6.7 (633–734), Q7.1 (814), Q7.3 (883), Q10.1 (1395). The resolver's "no roadmap" lead is a false positive. The (a)/(b) labels are R04(b).
- **PerfectoidSpaces (main):** §§P7.16a (line 17397) and P7.17 (17487), with their italic targets.
- **SchemeAndStackFoundations §2.22:** `SchemeBrauerGroup.toCohomologicalBrauer` is a roadmap name, cited as such.

### Declared gaps

- The three slugs in the README (lines 479, 553, 572) are the brief's three.
- Each is minimal:
  - DerivedDeRhamCohomology §0.21 (line 412) states Avramov's criterion but not additivity;
  - PrismaticCohomologyPartII Layer 4 has no Dieudonné equivalence over perfectoids;
  - PerfectoidQuotientsPartII §Q10.1 does not compute any tilt.
- None has supplier `none`.

### Ownership against open work

I read #1522, #1743 and #1070 at their heads with `roadmaps show`, and the SchemeAndStackFoundationsPartII package on the board. Two conflicts leave this folder correct, with the change belonging on the other side:
- **EtaleDualityAndPerverseSheavesPartII (#1743, `ORDER.txt` line 385).** It also claims the affine Lefschetz case, local duality and local Lefschetz (its README line 24 and line 1571, "PurityForFlatCohomology takes the local Lefschetz theorem from §7.3"). This roadmap is earlier in the order and records #1743 as importer (lines 176–177), so the change belongs in #1743. §1.4 takes the "notion moves down" route: Gabber's affine Lefschetz and the existence of dualizing complexes are targets here without a route. #1743 Layers 0–6 is the only plan of the machinery behind them, and my search of main and the open heads found no earlier one.
- **SchemeAndStackFoundationsPartII (package, `ORDER.txt` line 255).** Its line 1055 lists finite-ideal excision, adic hyperdescent and the ample Brauer comparison (its §1.2) as what this roadmap "uses". This roadmap owns them (Layer 3, §7.10) and records that roadmap as importer (lines 171–179), so the change belongs in that package.

Further:
- The GroupSchemesOverABase conflict is R03.
- `scratch/overlaps.md` lists no dropped id and no conflicting head; I found none either.
- The LocalPurity revisions (#1807, #1808, #1854) mention neither the virtual dimension nor the semilocal spectrum.

### Adversarial table

Sampled targets, headlines and the targets of findings.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 `virtualDimension`, `IsCompleteIntersection` | `k⟦x⟧` presented as `k⟦x,y⟧/(y)`; `𝔽_p` presented over `ℤ_p` and over `𝔽_p`; `k⟦x,y⟧/(x,y)²`; valuation ring with `𝔪 = 𝔪²` | `2−1 = 1 = 1−0`; `1−1 = 0 = 0−0`; `2−3 = −1 < 0 = dim`; completion is `R/𝔪`, CI holds and vdim `0` | independent of the presentation; the junk value is used by no theorem (all of them assume Noetherian) | none |
| §1.3 depth vs vdim | `k⟦x,y,z⟧`, `I = (x²,xy,xz)`; twisted cubic cone; `k⟦x,y⟧`, `I = 𝔪²` | depth `0`, vdim `0`; depth `2 > 1 =` vdim; `pd = 2 = dim`, depth `0` | (b) holds in dimension 2 | R05 |
| §1.5 local Lefschetz | DVR, `f = π`; `k⟦x,y⟧`, `f = x`; `f` a unit; `f = 0` | `0 ↪ ℤ/ℓ` in degree 0; degrees `≤ 1`: `0 = 0`, degree 2: `0 → ℤ/ℓ(−1)`; outside `f ∈ 𝔪`; identity map | statement sharp; Check 2 vacuous | R06 |
| `zariskiNagata_full_faithful_connected` | `k⟦x,y⟧`; `k⟦x,y⟧/(xy)`; field; `R̃/I` with `dim R̃ = 5`, `I` triply generated | vdim `2`, `U` connected; vdim `1`, two components, excluded; vdim `0`, `U = ∅`, excluded; vdim `≥ 2` at depth `0`, so the Tau Ceti depth-two result does not cover it | the headline is not subsumed | none |
| `zariskiNagata_isEquivalence` | `A_1`; 3-fold node `xy−zw` | vdim `2`, `π_1(U) = ℤ/2`, excluded; vdim `4−1 = 3`, covers extend (SGA2 X 3.4) | threshold sharp | none |
| §5.5 products | `I` a singleton; `I = ∅`; `μ_{p^n}` | identity; `0 = 0` over the zero ring; `∏ A_inf(A_i)/p^n` with `V = ξφ^{-1}` on both sides | holds | none |
| §5.9 key formula | `A = 𝔽̄_p`, `ℤ/p`, `Z = Spec A`; `A = 𝔽_p`; `μ_p`, `A` perfect | `H^0 = 𝔽_p`, `H^1 = 0`; `H^0 = H^1 = 𝔽_p`; `V = p·φ^{-1} = 0`, fibre `0`, and `μ_p(A) = 1` | matches flat cohomology | none |
| `frobeniusSemilinear_exists_fixed_basis` | `M = K`, `F = cφ`; `𝔽_3(t)^{perf}`, `F = tφ`; `M = 0` | `x^{p−1} = c^{-1}` solvable; `x² = 1/t` needs `v(x) = −1/2 ∉ ℤ[1/3]`, excluded by `IsAlgClosed`; empty basis indexed by `Fin 0` | holds | none |
| §7.2 / `free_of_endomorphisms_iso_pi` | `Rⁿ`; second syzygy `N` of `k` over `k⟦x,y,z⟧`; `M = 0` | `End = R^{n²} = M^n`; `N` reflexive of rank 2, not free since `pd k = 3`, so no `End N ≅ N^r`; `End 0 = 0 = 0^r` | consistent | none |
| §7.3 torsors | `ℤ/n`, `k⟦x,y⟧`; `μ_2` over `ℂ⟦x,y⟧^{μ_2}`; trivial `(ℤ/2)_k` | Zariski–Nagata; the torsor does not extend (normal, not regular); Hom dimensions `4`, `4`, `8` | regularity needed | docstring R02 |
| §7.4 / `isRegularLocalRing_uniqueFactorizationMonoid` | `ℤ_p⟦x⟧`; `A_1` | UFD; `xz = y²`, two factorizations, not regular | holds | none |
| `localPicard_torsion_eq_one` | node `xy−zw`; `A_1`; Veronese cone (`n = 3`); cubic cone | `Pic(U) = ℤ`, torsion free; dim 2, excluded, `ℤ/2`; not CI, excluded, `⊇ ℤ/2`; dim 2, excluded, infinite torsion | hypotheses needed | none |
| `localPicard_subsingleton` | field; DVR; `k⟦x,y,z⟧` | `U = ∅`; `Pic(Spec K) = 0`; `Pic(U) ⊂ Cl(R) = 0` | holds | none |
| §7.7 CM failure | `n = 3`; `n = 2` | Veronese cone, 6 quadrics, dim 3, not CI; `H^1(R, μ_2) = R^×/R^{×2} = 0`, so the class injects into `H²_𝔪`; `A_1` allowed by §7.6 | holds | none |
| `picard_…_torsion_eq_one` | quadric surface (`n = 3`, `c = 1`); plane cubic (`n = 2`, `c = 1`); `fs = []`, `n = 2`; `0 ∈ fs` | `ℤ²/ℤ(1,1) ≅ ℤ`, torsion free; `1+2 ≤ 2` false, excluded, `E[m]` torsion; `Pic(ℙ²)/ℤ = 0`; `0` is not a nonzerodivisor on the nonzero quotient | holds | none |
| `picard_…_bijective_zpow` | cubic threefold; `ℙ³`; quadric surface; `f_1 = 1` | `ℤ`; `ℤ`; `1+3 ≤ 3` false, `Pic = ℤ²`; excluded by positive degree, which would make `X = ∅` | holds over any `k` (SGA2 XII 3.7) | none |
| §7.9 | `Spec K`; DVR; `k⟦x_1..x_5⟧/(Σx_i²)` | (a) torsion in degrees `≥ 2`, (b) the identity; `Br(R) ↪ Br(K)`; factorial, not regular, Gro66 1.8 applies | (b) narrower than Gro66 | R05 |
| §7.12c mult. type | circle over `ℝ`; `Spec(k×k)`, `𝔾_m ⊔ μ_2`; `α_p` | torus, only the trivial character over `ℝ`; mult. type, not diagonalizable; dual `α_p` not étale | definitions discriminate | R04 |
| §7.12d character sheaf | `μ_p/𝔽_p`; circle | `X^* = (ℤ/p)_S`, `μ_p(reduced) = 1`; sections `0` over `ℝ`, `ℤ` over `ℂ` | holds | none |
| §7.13 kernel of tori | `𝔾_m × μ_n`, `m = n`; `μ_n`, `m = n`; `m = 1` | `S ≅ 𝔾_m`, composite `(t^n, 1) = [n](t, ζ)`; `S = D(0)`; `S = T`, not a torus | `m` killing torsion needed | none |
| §8.3 tori, small residue fields | `ℤ_p⟦x⟧`, `𝔾_m`; `ℝ⟦x,y⟧`, norm-one torus | `H²(U, 𝔾_m) = 0`; `H^1(U, T) = ℝ^×/Nℂ^× = ℤ/2`, and `H²(ℝ, ℤ/2) = ℤ/2` so `ℝ` is not of dimension `≤ 1` | hypothesis needed | none |
| §8.6 tori purity | `𝔸²_ℂ ⊃ {0}`; `Z = V(x)`; `d = 3` | `Br′` unchanged; `H^1_Z(𝔾_m) = ℤ`, codimension 1, excluded; iso for `q ≤ 2` vs §7.15's `q ≤ 1` | holds | none |
| §8.10 Brauer intersection | `Spec ℤ`; `𝔸²_ℂ` cyclic class | `Br(ℤ) = 0 = ⋂_p Br(ℤ_(p))` (Hamilton quaternions ramify at 2); residue along `x = 0` is `[y] ≠ 0` | holds | none |
| §0.1 depth-two bullet | `k⟦x,y⟧` | `Spec.presheaf_map_leTop_bijective_of_flat` with `B = R` gives `Γ(U_R, 𝒪) = R` | at the pin | R01 |
| A–B formula | `k` over `k⟦x,y,z⟧` | `pd 3 + depth 0 = 3 = depth R`, `ModuleCat.projectiveDimension_add_depth_eq_depth` | at the pin | R01 |

## Not verifiable

These sources are settled as uncertified, so I could not read them. I checked them only through the computations above and through the citing sources.
- **SGA 3 VIII 1.1–3.4, IX 1.1, 2.11 and X 4.5, §5.** These back §§7.12a–7.13, including the sampled §§7.12c, 7.12d and 7.13.
- **[Aus62] Theorem 1.3**, for §7.2. CS24 line 3684 cites it with exactly the README's hypothesis. I could not check whether the published statement assumes the ring unramified (Tor rigidity, later extended by Lichtenbaum). The Lean statement is true for all regular local rings.
- **[MB85] Lemme 2; [Gab04b] Conjectures 2–3; [Gro68] Brauer III 2.1, 6.1 b); [Bou78] V 4.9.** I read these only through CS24 lines 3764 and 3777–3790.
- **SGA 4 VII 5.7, X 5.1, XVIII 3.1.8; SGA 5 I 1.12 and (4.2.2); [BH] 2.3.1; [DF84] Remark 3; [Avr77] 3.6.**

## Source issues

- **Error** in CS24 at Theorem 7.1.2, p. 87: the source says the regular clause needs dimension at least `d − 1`, which admits fields when `d = 1`; it should say dimension at least `max(d − 1, 1)`, as `Spec k ⊔ Spec k` with `Z` one point shows; affects a stated result.
- **Misprint** in CS24 at the proofs of Theorems 7.2.1 and 7.2.5, pp. 89–90: the source says `n ≥ 0`; it should say `n ≥ 1`; affects nothing.
- **Gap** in CS24 at Remark 7.2.6, p. 90: the source says the cone over an elliptic curve is a complete intersection; it should restrict to a plane cubic or an intersection of two quadrics, since normal cones of degree at least 5 are not; affects nothing.
- **Gap** in C19 at Proposition 2.2, p. 4: the source infers injectivity of `H^1(V, G) → H^1(V, Res)` for possibly noncommutative `G` from lifting points of the quotient; it should assume `G` commutative; affects nothing, because both uses have `G` commutative.
