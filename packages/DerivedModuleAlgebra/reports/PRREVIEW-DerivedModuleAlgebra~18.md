# Review of DerivedModuleAlgebra (pull request #1701 at f8483df)

**Verdict:** needs changes

This is a full review of the head that r17 also read. The folder is byte-identical, so this round re-examined everything, not only a diff. Below, "README" means `TauCetiRoadmap/DerivedModuleAlgebra/README.md` and "Lean" means `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean`.

There are four findings, all P3. None is a false or overclaimed statement. The gate passes, the dependency check is clean, Lean elaborates with only `sorry` warnings, and every headline survived the adversarial pass.

## R01 (P3) — A name that main's EnhancedDerivedSheaves cites is dropped with no mapping

**Location.** README:41–76, the cited-names table ("Other roadmaps cite objects of this roadmap by the Lean names in the left column"). Its rows do not include `test_derived_tensor_unbounded_flat`. The name also no longer appears anywhere in README or Lean.

**Claim.** Main's DerivedModuleAlgebra README:673 defines the §0.2 Check `test_derived_tensor_unbounded_flat`, and this pull request drops the name. Main's EnhancedDerivedSheaves cites it as this roadmap's object, so that citation dangles once this merges. The content survives as the unnamed §0.2 Check at README:845–848. The brief treats a dropped id that another roadmap cites, with no old → new mapping, as P3.

**Witness.**
- Main `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`:545 ends "(DerivedModuleAlgebra §0.2, `test_derived_tensor_unbounded_flat`)".
- The same citation is at the heads of #1187 (line 545), #1330 (line 549) and #1630 (line 643).
- `roadmaps grep --fixed` finds no other definition.

**Repair.** Add this row to the table at README:41–76:

`| `test_derived_tensor_unbounded_flat` | §0.2: the Check on the bi-infinite `ℤ/4` complex with differentials multiplication by `2` |`

**Test.** After the edit, `grep -F test_derived_tensor_unbounded_flat` on README finds the row, and the row points at README:845–848. There the complex is termwise free and acyclic, its termwise tensor with `F₂` has `H^i = F₂` in every degree, and its derived tensor with `F₂` is `0`. That is the content main's EnhancedDerivedSheaves:545 relies on.

I checked all 623 backticked names of main's DerivedModuleAlgebra README and Lean against every README on main. Only three others are dropped and also appear elsewhere, and none of them is cited as this roadmap's object:
- `completedColimit` is PerfectoidSpaces' own definition (its README:11721).
- `derivationDiscrete` is EnhancedDerivedSheaves' own (its README:2873).
- `isMittagLeffler_of_surjective` is a Mathlib lemma (AdicSpacesPartIII README:436).

## R02 (P3) — §S.1 states the second-page headline for modules, but Lean states it for any abelian category

**Location.** README:880–881: "Let `A^{••}` be a first-quadrant double complex of abelian groups (or of modules over a ring)". The homological form (README:913) and the headline sentence (README:908–911) inherit this setting.

**Claim.** The Lean headline is more general than the README:
- `nonempty_bicomplexSecondPageIso` (Lean:119–124) quantifies over `{C : Type u} [Category.{v} C] [Abelian C]`.
- Its docstring says "in an abelian category".
- The phrase "abelian category" occurs in README only at line 715, about K-injective replacements.

The brief requires the README's generality to equal the Lean signature's, in both directions. The Lean statement is true at that generality: the pinned `HomologicalComplex₂.columnFiltrationSpectralSequence` is defined for any abelian `C`.

**Witness.** The elaborated signature (`#check @…nonempty_bicomplexSecondPageIso`) begins `∀ {C : Type u_1} [inst : CategoryTheory.Category.{u_2, u_1} C] [inst_1 : CategoryTheory.Abelian C] (K : HomologicalComplex₂ C (ComplexShape.down ℕ) (ComplexShape.down ℕ)) (p k : ℕ)`.

**Repair.** At README:880–881, replace "double complex of abelian groups (or of modules over a ring)" with "double complex in an abelian category (abelian groups or modules over a ring in the uses of §§0.2.2 and 0.9)".

**Test.** The edited sentence covers the Lean instance `C = ModuleCat R` used by §§0.2.2 and 0.9, and also the general `C` of the signature.

## R03 (P3) — The §0.13 page range overshoots by two pages

**Location.** README:1503: "[StacksCt], §14, Lemma 14.2 and Proposition 14.4; Tags 08SJ, 08SL, pp.29–31."

**Claim.** Both statements and their proofs lie on p.29. Pages 30–31 belong to §15, *Tensor products and the cotangent complex*, which §0.13 does not use.

**Witness.**
- StacksCt line 1290 has Lemma 14.2 (08SJ), and line 1303 has Proposition 14.4 (08SL), whose proof ends at line 1312.
- Page 29 runs from line 1275 to the `=== page 30 ===` marker at line 1315.
- §15 starts at line 1313.

**Repair.** Replace "pp.29–31" with "p.29" at README:1503.

**Test.** StacksCt lines 1275–1314 (p.29) contain both cited statements with their proofs and their hypotheses: a Koszul-regular kernel, and a local complete intersection map.

## R04 (P3) — The pull-request description still describes a README-only amendment

This is r17's R01, raised in earlier rounds as R03 and R02, and it is not repaired. No repair report marks it as not actionable.

**Location.** The pull-request description (data), unchanged:
- **Summary:** "README only; `Suggested.lean` is unchanged";
- **What this roadmap builds:** "Roby representability (`PD.robyRepresentability`)";
- **Why Tau Ceti wants it:** "Thirteen roadmaps consume it".

**Claim.** A human approves on the basis of the description, and three of its statements are false at this head.

**Witness.**
- `git diff --numstat origin/main...HEAD` gives `491 1230` for Lean.
- `robyRepresentability` occurs 0 times in the folder and 0 times in the pinned Tau Ceti.
- README:2684–2689 names eighteen consumers.

**Repair.** Edit the description on GitHub:
1. End **Summary** with: "The head also replaces main's `Suggested.lean` with the roadmap's headline theorems and the few definitions they need."
2. Replace `PD.robyRepresentability` with `DividedPowerAlgebra.homogeneousLawEquiv`. This is declared at the Tau Ceti pin in `TauCeti/RingTheory/DividedPowerAlgebra/Representability.lean`:440, and README:267 uses it.
3. Replace "Thirteen" with "Eighteen".
4. If the title is kept, add to it: "and state the headline theorems in Suggested.lean".

**Test.** All three statements then agree with the numstat, the pinned declaration and README:2684–2689.

## Previous findings

- **r17 R01 (description):** not repaired. The description still contains "README only; `Suggested.lean` is unchanged", `PD.robyRepresentability` and "Thirteen roadmaps consume it". Raised again as R04.
- **r17's folder findings:** none; r17 found the folder clean. R01–R03 above are new. They were found by this full re-read, in passages unchanged since r16:
  - the cited-names table against main's consumers;
  - the §S.1 generality against the elaborated signature;
  - the §0.13 locator, a seeded target this round.

## Verified sound

### Gate, dependency check, elaboration, signatures

- **Gate**, my run at this head (`gate … --base origin/main`), exit 0. Every counter is 0, then `OK`:
  - `set_option`, `blob`, `latex`, `tex`, `prnum`;
  - `sorry-data`, `sorry-examples`, `residue`, `private-paths`;
  - `imports`, `mathlib-subimports`, `no-import-mathlib`, `lean-lines`, `statement-hygiene`, `forbidden`;
  - `dropped`, `readme-ids-missing`, `empty-sections`, `round-labels`, `long-fences`;
  - `layer-ids`, `target-ids`, `depcheck`, `metadata`, `stray-files`;
  - `dirty`, `outside-folder`, `source-material`.

  The worker's record for this head also has `build=0`.
- **Dependency check.** Output, with no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 239 roadmaps, 2335 edges, 0 problem(s)
```

  The only roadmap supplier is AlgebraicTopology, Stage 6, item 0, on main. Its README:954 owns "Homotopy-commuting product squares induce actual cone maps, retaining the specified square homotopies in their composition laws", which is exactly what README:111 and README:129–133 consume. Main has not changed this folder since the merge base `6ee1f204`, so there is no conflict. Nothing outside the folder changed.
- **Elaboration.** `lake env lean` on Lean exits 0 with exactly 29 "declaration uses `sorry`" warnings and no other output.
- **Signatures.** I elaborated a scratch copy of Lean followed by `#check @name` for all 39 declarations: 39 signatures, no error. I compared each with its README statement:
  - Every hypothesis is an explicit binder. `[Module.Flat R N]` is present in both décalages.
  - `[IsNoetherianRing A]` is present in `ordinaryQuotientCompletion` and in `nonempty_…HomologyIso`.
  - `hI : I.FG` is present in `derivedCompleteness_isRightAdjoint` and in `completeNakayama`.
  - `hA` (bounded torsion) is present in all four §1.8 statements.
  - `hnil` is present in `ringTowerLimit_jacobson`.
  - `[IsAdicComplete 𝔪 R]` is present in both Matlis theorems.
  - No binder is lost. The only generality mismatch is R02.
- **One-tactic padding probe.** In a scratch copy, I replaced every `sorry` with `first | rfl | simp | infer_instance | trivial | decide | aesop`. All 29 theorems fail, each with its own error ("unsolved goals" or "aesop failed").
  - No declaration restates a definition, mirrors a Check or treats a boundary case.
  - The closure lemmas of §1.E.0 are genuine statements over noncommutative rings (thickness of `K^b(proj R)`).
  - No padding.
- **Shape.**
  - All 67 `**Checks.**` blocks have at least three bullets (parsed mechanically).
  - Every layer ends with `### Examples` and `### Dependencies`.
  - There are no process words, no `lemma`, no `#eval`, `#print` or `#synth`.
  - Every Lean name appears in README.
  - The nine `TauCeti.*` imports are all used: `IsInjectiveEnvelope`, `columnFiltrationSpectralSequence`, `derivedLimit`, `reductionFunctor`, `alexanderWhitney`, `diag`/`doubleComplex`/`diagAlexanderWhitney`, `homogeneousSubmodule`, `symmetricPower.functor` and `IsKFlat`.

### Seeded source sample (15 targets): number, page, hypotheses, support

| Target | Locators checked (source line, printed page) | Result |
| --- | --- | --- |
| 0.1 | StacksCt Def. 3.1 (08PM) l.81 p.2; Lemmas 4.1–4.3 (08PS–08PU) l.144/169/193 pp.4–5; Remark 5.5 (08QI) l.360 p.9; Lemmas 5.6–5.7 (08QJ, 08QK) l.382/395 pp.9–10 | Correct. Remark 5.5 adds "surjecting onto B" before (1)⇔(2)⇔(3). README's "equivalently" omits it soundly: a quasi-isomorphism already makes `P₀ → B` onto, since `H₀(P) = coker(d₀ − d₁) ≅ B`. |
| 0.2.2 | StacksSites Remark 21.39.11 (08QD) l.4324 p.96 to l.4339 p.97; DoldPuppe Satz 2.9 l.422 p.213, Satz 2.15 l.567 p.217, Bem. 2.16 l.583 p.218 | Correct. The flat hypothesis of 08QD is attached only to the derived identification (README:1025). |
| 0.3 | DoldPuppe §4 4.1 l.919 p.227 through 4.7 l.966 p.228; Satz 1.15 l.301 p.209; Satz 3.31 l.852 p.225; StacksSimp Remark 14.26.4 (019M) l.2128 p.45; SAG Prop. 25.2.1.2 l.62226 p.1698, Cor. 25.2.1.3 l.62247 p.1699 | Correct |
| 0.4 | StacksCt Def. 3.2 (08PN) l.89 p.3; Lemmas 4.3–4.7 (08PU, 08QE–08QH) l.193–228 pp.5–6; §6 (08QL) l.456 pp.11–12; BL22 Constr. B.1 l.10001, Rem. B.2 l.10013 p.225 | Correct |
| 0.5 | StacksDefos Lemma 2.1 (08S5) l.56 p.2, Lemma 2.2 (08S7) l.127 p.3, Lemma 2.3 (0GPT) l.161 p.4, Remark 2.4 (0GPU) l.177 p.4; GR 2.5.4–2.5.7 l.1454–1480 p.30 | Correct. GR's `X + Y := α_*(X⊕Y)^*δ` is README's antidiagonal quotient of `E ×_B F`. |
| 0.7 | StacksCt Lemmas 11.2, 11.3 (08RA, 08RB) l.916/933 p.21; Lemma 13.3 (09CG) l.1146 p.26 | Correct |
| 0.9 | GR Prop. 8.1.7 l.10619 p.219 and proof l.10624–10659 p.220 (`R• := S• ×_S R`, spectral sequence `E¹_ij = H_j(L_{S[i]/R[i]})`); BMS19 §2 l.552 p.212 | Correct. IllusieCC is uncertified (see Not verifiable). |
| 0.13 | StacksCt Lemma 14.2 (08SJ) l.1290, Prop. 14.4 (08SL) l.1303 | Numbers and hypotheses correct, but both are on p.29. R03. |
| 0.17 | DM Lemma 3.3 l.863 p.21, used for cotangent complexes at l.902 p.22; SAG Prop. 25.2.4.2 l.62450 p.1704, proof to l.62541 p.1707; Bhatt12 Prop. 3.22 l.523 pp.11–12, Remark 3.43 l.893 p.18 | Correct |
| 1.1 | StacksMA 15.89.1 (091D) l.10946 p.238, 15.89.3 (0CQD) l.10971 p.238, 15.89.4 (0CQE) l.10983 p.239, Rem. 15.89.10 (091J) l.11108 p.241, 15.89.11–12 (091K, 091L) l.11124/11133 p.242 | Correct |
| 1.2 | StacksMA 15.93.1 (091P) l.12005 p.261, 15.93.2 (091Q) l.12049, 15.93.3 (091R) l.12061 p.262, Def. 15.93.4 (091S) l.12101, Prop. 15.93.5 (091T) l.12115 p.263 | Correct. Lean `derivedCompleteness` is 091P (1) with 091S. |
| 1.4 | StacksMA Situation 15.93.15 (0BKC) l.12260 p.266 (transition is multiplication by `f^{m−n}` on basis wedges), Lemma 15.93.18 (0920) l.12293 p.267 | Correct |
| 1.6 | StacksCt 08PM, 08QI as above; Prisms §1.2 l.351 pp.10–12, footnote 6 l.429–446 p.11; StacksMA 091V l.12163 p.264, 0920 | Correct |
| 1.7 | Prisms §1.2 l.406 p.11; BMS19 Def. 4.1 l.850 p.220, Lemmas 4.4–4.5 l.872/888 pp.220–221, 4.6 l.895 p.221, 4.7 l.908 pp.221–222, Cor. 4.8 l.958 p.223 | Correct. BMS19 Lemma 4.6 and Lemma 4.7(1)/(2) are exactly the three §1.8 headlines, with the same hypotheses. |
| 1.9 | BMS19 Thm 3.1 l.751 p.217, assertion (1) of its proof l.762–765, Remark 3.2 l.784 p.218, Lemma 4.5(2) l.891 p.221, Cor. 4.8(3) l.963, Remark 4.9 l.973 p.223 | Correct |

Outside the sample, I checked the locators behind headlines:
- StacksMA 0921 l.12717 p.275, 0922 l.12739 p.276 and 0A06 l.12756 p.276 (finite cohomology in every degree, as in `hfin`).
- StacksMA 091X l.12496 and 0923 l.12520 p.271 (bounded torsion ⇔ naive = derived).
- StacksMA 062F l.3571 p.76 (no nonvanishing hypothesis, which matches `IsWeaklyRegular`) and 062G l.3591 pp.76–77.
- StacksMA 0G1U l.12364 p.268.
- StacksMA 0658 l.8800, 066R l.8823 and 066S l.8826 p.191; 066W l.8844 p.192; 064T l.7500 p.162; 068V l.9295 p.202; 0CQG l.13310 p.288.

All are correct. README flags no locator as unverified.

### Library declarations opened at the pins (file:line)

**Tau Ceti:**
- Spectral sequences (`Algebra/Homology/SpectralSequence/Bicomplex.lean`): `rowFiltrationSpectralSequence` (:410), `rowFiltrationSpectralSequenceFirstPageXIso` (:426), `columnFiltrationSpectralSequence` (:442) and `columnFiltrationSpectralSequenceFirstPageXIso` (:446).
- Derived limit (`Algebra/Category/ModuleCat/Tower/DerivedLimit.lean`): `homotopyLimitFunctor` (:122), its `CommShift` instance (:165, the mapping-cocone shift for which the projection to `∏ Kₙ` commutes with shifts), `derivedLimit` (:310), `derivedLimitFactors` (:322) and the `derivedLimit` `CommShift` (:329).
- Tower reduction: `ModuleTower.reductionFunctor` (`Tower/Reduction.lean`:377).
- Injective envelopes: the `IsInjectiveEnvelope` structure (`Algebra/Module/Injective/Envelope/Basic.lean`:95; fields: injective ambient module, injective map, essential range) and `exists_isInjectiveEnvelope_submodule` (`…/Envelope/Existence.lean`:59).
- Matlis duality (`RingTheory/MatlisDuality/`): `isArtinian_of_isNoetherian_linearMap` (`Artinian.lean`:91), `IsInjectiveEnvelope.isArtinian_of_finite_adicCompletion_linearMap` (:100) and `IsInjectiveEnvelope.bijective_applyₗ` (`FiniteLength.lean`:155).
- Perfect objects: `DerivedCategory.Bounded.perfect` (`Algebra/Homology/DerivedCategory/Singularity/Basic.lean`:92) and `perfect_iff` (`…/DerivedCategory/Perfect.lean`:192).
- Simplicial sets: `SSet.shuffle` in bidegree (1,1) (`AlgebraicTopology/SimplicialSet/Shuffle.lean`:727–735, `(σ₁x, σ₀y) − (σ₀x, σ₁y)`, the sign README:1016 claims) and `SSet.eilenbergZilberHomotopyEquiv` (`EilenbergZilber.lean`:761).
- Koszul complexes (`RingTheory/KoszulComplex/`): `exactAt_of_isWeaklyRegular` (`Regular.lean`:140), `homologyZeroEquivSpan` (`Basic.lean`:399), `zeroEquiv_koszulDifferential_zero` (`Basic.lean`:122) and `tensorIsoAppend` (`Tensor.lean`:340).
- Divided powers (`RingTheory/DividedPowerAlgebra/`): `homogeneousLawEquiv` (`Representability.lean`:440), `augmentationIdeal_eq_span` (`Augmentation.lean`:165), `map_algebraMap_inf_augmentationIdeal_eq_mul` (:242), `exists_algHom_trivSqZeroExt_dp` (:307) and `dp_two_not_mem_span_dp_one` (:314).
- Flat modules and K-flat resolutions: `flatModuleFilteredFree` (`Algebra/Category/ModuleCat/Flat/FilteredFree.lean`:146), `FiniteFreeOver` (:72) and `kFlatResolution` (`Algebra/Homology/Monoidal/KFlat/Resolution.lean`:283).
- Derived Hom and K-injectives: `derivedHomHomologyLinearEquiv` (`Algebra/Homology/DerivedCategory/DerivedHom.lean`:148) and `kInjectiveReplacementAdjunction` (`…/KInjective.lean`:160).
- Tor and pseudo-coherence: `ModuleCat.isZero_Tor_succ_of_flat` (`Algebra/Category/ModuleCat/Monoidal/Tor.lean`:233) and `IsPseudoCoherentOver.exists_quasiIso_single₀` (`Algebra/Module/PseudoCoherent/ChainComplex.lean`:41).
- Artin–Rees and mapping cocones: `ArtinRees.exists_controlled_lift` (`RingTheory/Ideal/ArtinRees.lean`:85) and `mappingCocone.mapOfHomotopyHomotopy` (`Algebra/Homology/HomotopyCategory/MappingCocone/Homotopy.lean`:93).
- Polynomial laws and towers: `PolynomialLaw.isHomogeneousOfDegree_one_iff` (`RingTheory/PolynomialLaw/Homogeneous.lean`:237), `ComplexTower.limComplexSubsequenceIso` (`Tower/Milnor/Subsequence.lean`:52) and `ModuleTower.isMittagLeffler_of_isArtinian` (`Tower/MittagLeffler.lean`:113).

**Mathlib:** `Arrow.cechConerve` (`AlgebraicTopology/CechNerve.lean`:234). Neither pin has a product totalization of double complexes or a derived tensor bifunctor on `DerivedCategory`, so the docstring's "not statable" bullets for ⊗^L and §1.9 hold.

**All backticked names.** For the 381 backticked dotted names of README and the Lean docstring, the last component of every name is declared at one of the pins, except for three groups:
- this roadmap's own `DerivedDeRham.*` and `Matlis.*`, all declared in Lean;
- the cited-name aliases of README:41–76;
- `[AffineCrystalline]` names, cited as an external repository, and module paths, whose files all exist.

### Duplication and ownership

- **Matlis.** Tau Ceti proves only the converse criteria (`isArtinian_of_isNoetherian_linearMap`, and Artinian from a dual that is finite over `R̂`) and finite-length biduality. `biduality_of_finite` and `biduality_of_artinian` restate neither.
- **Perfect objects.** Tau Ceti's `DerivedCategory.Bounded.perfect` is the thick closure of all projectives in degree 0, with no finiteness: over `ModuleCat R` it contains `R^(ℕ)[0]`. So `DerivedDeRham.IsPerfect`, which requires finitely generated projective terms, is a different object, owned here.
- **Other roadmaps' Lean files.** `roadmaps grep` over the Lean of all 466 open heads and main finds no theorem stating derived Nakayama, Matlis biduality, décalage, Eilenberg–Zilber, derived-limit exactness, perfect closure or complete flatness outside this folder.
- **Other roadmaps' ownership claims.** Searching READMEs for ownership claims on these objects finds deferrals to this roadmap: CrystallineCohomology README:102, DeformationAndDerivedPatchingAlgebra README:17 and EnhancedDerivedSheaves README:15 and :29–30 on main. EnhancedDerivedSheaves owns only the sheaf and point-topos extension, so no object has two owners.
- **Overlaps.** `overlaps.md` reports no other pull request changing this roadmap, and no cited id dropped by, or defined only in, an open revision. The dropped §1.T.1 ids and the `#1t1-towers-lim-and-lim¹` anchor (StableHomotopyKTheory #1227 line 86, and the others listed) keep their old → new mapping at README:34–36. The one unmapped dropped name is R01.
- **Citations.** `citations.md` lists no unresolved cross-roadmap citation.

### Headline theorems

- **Stated in Lean:**
  - §S.1: second page.
  - §0.2.2: Eilenberg–Zilber, simplicial and bisimplicial.
  - §0.3: invariance of levelwise functors.
  - §0.17: both flat décalages.
  - §1.1: exactness of `Rlim`.
  - §1.2: the four completeness laws.
  - §1.3: reflector and Nakayama.
  - §1.5: three ordinary-quotient comparisons and 0A06.
  - §1.8: three BMS theorems.
  - §1.E.0: closure under retract, shift and triangle; perfect ⇒ pseudo-coherent; base change; unit reflection; residue criterion.
  - §1.M: Matlis duality on both sides.
- **Named in the docstring as not statable, with the missing carrier:**
  - `⊗^L` and derived scalar extension;
  - the cohomological edge maps and the five-term and extended sequences;
  - the cotangent complex and deformation theory;
  - `LF`, `L∧ⁿ`, `LSymⁿ`, `LΓⁿ` and the décalage for connective `M`;
  - the tensor–Hom adjunction;
  - the Koszul tower;
  - §1.6;
  - §1.9;
  - §1.E effectivity.
- **Named as already in Tau Ceti:** §§0.DP, 0.K.1, 0.I.1, 0.2 replacement, 0.2.1, the Alexander–Whitney maps, spectral-sequence convergence, `Rlim`, derived Hom, complete flatness of flat modules, and the Matlis inputs.

Each of the "not statable" claims was checked against the pins above.

### Adversarial table

Values computed this round. "Neg." marks a negative control that shows a hypothesis is needed.

| Statement | Instances | Values on each side; wrong model excluded | Result | Change |
| --- | --- | --- | --- | --- |
| `nonempty_bicomplexSecondPageIso` (Lean:119) | generators `a(2,0), b(1,1), c(1,0), e(0,1)`, `d_h a = c`, `d_v b = c`, `d_h b = e`; page-2 differential direction | Page-2 `d` goes `(−k−2p, p) → (−k−2p+2, p−1)`, which is `H_k(col p) → H_k(col p−1)`, so page 3 is classical `E²`. Example: `H₀(col 2) = R a`, `H_*(col 1) = 0`, so page 3 at `(−4, 2)` is `R = H₂(t ↦ H₀(col t))`. Total differential `[[1,1],[0,1]]` is invertible; `d₂[a] = [−e]` | True | R02 (generality only) |
| `simplicialTensorComparison` (Lean:134) | `x ∈ X₁`, `y ∈ Y₁` | `d∇(x⊗y)` and `∇d(x⊗y)` both equal `s₀d₀x⊗y − s₀d₁x⊗y − x⊗s₀d₀y + x⊗s₀d₁y` with `∇ = s₁x⊗s₀y − s₀x⊗s₁y`. Opposite sign fails unless `2 = 0`. Tau Ceti `SSet.shuffle` (1,1) has the same sign | True | none |
| `bisimplicialDiagonalComparison` (Lean:157) | constant `P`; `Z = X_p ⊗ Y_q` with normalized `A[1]` | Both sides `H₀ = P`, higher `0`; both `H₂ = A`, transposition sign `−1` | True | none |
| `quasiIso_whiskering_of_projective` (Lean:174) | Neg.: `Γ₀[ℤ --2→ ℤ] → ℤ/2`, `F = V⊗V` | Source `H₁ = Tor₁(ℤ/2, ℤ/2) = ℤ/2`, target `H₁ = 0`; the target is not projective, so excluded | True | none |
| `exteriorPower_decalage` (Lean:197) | `N = R = F₂`, `n = 2`; `n = 0, 1`; Neg.: `N = ℤ/2` over `ℤ` | `N(∧²X)` ranks: deg 2 `= 1`, deg 3 `= 3−3 = 0`, deg 4 `= 6−12+6 = 0`, so homology `F₂γ₂` although `∧²F₂ = 0`. `n = 0`: `R = Γ⁰`; `n = 1`: `N`. Neg.: `F₂` vs `Γ²_ℤ(ℤ/2) = ℤ/4` (`1·1 = 2γ₂ ≠ 0`, `4γ₂ = γ₂(2) = 0`), so `[Module.Flat]` is needed | True | none |
| `symmetricPower_decalage` (Lean:215) | `N = R`, `n = 2`; `n = 1` | `N(Sym²X)` ranks: deg 1 `= 1`, deg 2 `= 3−2 = 1`, deg 3 `= 6−9+3 = 0`; unit differential, so acyclic `= ∧²R = 0`. `n = 1`: `N = ∧¹N` | True | none |
| `derivedLimit_isTriangulated` (Lean:237) | constant `ℤ[0]`; Neg.: `A_n = ⊕_{m≥n}k → V → kⁿ`, levelwise split | Shift iso is the identity of `ℤ[1]` (a `−1`-twisted structure would give `−1`). Neg.: zero boundary would force `⊕k → ∏k` onto; the all-ones sequence is not in the image. Pinned `CommShift` is the cocone one | True | none |
| `derivedCompleteness` (Lean:262), `isDerivedComplete*` (Lean:268–294) | `I = 0`; `I = A`; `ℚ_p`, `ℤ_p`; `ℤ[−1]` at `I = ℤ`; `ℤ_p --p→ ℤ_p → F_p` | `A[1/0] = 0`, so everything is complete. `Hom(A[n], M) = H^{−n}M`, so only `0` is complete at `I = A`. `ℤ[1/p] → ℚ_p` is nonzero. An `n = 0`-only test admits `ℤ[−1]`, but `n = −1` gives `ℤ`. `(p)`, `(p²)` have the same radical and `ℤ[1/p] = ℤ[1/p²]`. `F_p` is complete as a cone of complete objects | True | none |
| `derivedCompleteness_isRightAdjoint` (Lean:299), `completeNakayama` (Lean:310) | `I = A`, `I = 0`; Neg.: `m ⊂ O_ℂp`; Neg.: `ℤ[1/p]` | Left adjoints are `0` and `id`. `m = m²` is `f`-adically complete and flat, so `m ⊗^L O/m = 0` but `m ≠ 0`; `hI` excludes it. `ℤ[1/p] ⊗^L F_p = 0`, but `hc` fails | True | none |
| `ordinaryQuotientCompletion` (Lean:327) | `ℤ`, `(p)`, `P = ℤ[0]`; Neg.: `A = ℤ_p ⋉ ℚ_p/ℤ_p` | Tower `ℤ/p^{n+1}`, `L = ℤ_p[0]`. Neg.: naive tower `ℤ_p[0]`, but `H^{−1}(Λ A) = lim T[pⁿ] = ℤ_p`; not Noetherian, so excluded | True | none |
| `…_of_boundedTorsion` (Lean:346) | `f = 0` (`c = 1`); `f = 1` (`c = 0`); `k[ε]/ε²`, `f = ε` (`c = 2`) | `L = P`; `L = 0` with both Hom sets singletons; `P/εⁿ⁺¹P = P`, `A[1/ε] = 0` | True | none |
| `…_of_isWeaklyRegular` (Lean:368) | `[]`; `[p, 1]` | `Ideal.ofList [] = ⊥`, `L = P`. `I = ℤ`, tower `0`, `L = 0`. 062F needs no nonvanishing | True | none |
| `nonempty_…HomologyIso` (Lean:389) | `F_p[0]` over `ℤ`, model `[ℤ --p→ ℤ]`; Neg.: `ℚ_p/ℤ_p` over `ℤ_p` | `H^{−1}` levels `pⁿℤ/pⁿ⁺¹` with zero transitions give `0`; `H⁰ = F_p`. Neg.: `H^{−1}(L) = ℤ_p`, but the completion of `0` is `0`, so `hfin` is needed | True | none |
| `IsCompletelyFlatModule` (Lean:406) | `ℤ` over `ℤ`; `F_p` over `ℤ`, `I = (p)` | `Tor_{>0}(ℤ, F_p) = 0`, `F_p` flat: passes. `Tor₁(F_p, F_p) = F_p ≠ 0`: fails. A flat-reduction-only model would pass `F_p`; the Tor clause excludes it | True | none |
| `cohomologicalAmplitude_…` (Lean:418) | `ℤ_p[1]`; Neg.: `ℤ[1/p]` in degree 1; Neg.: `ℤ_p ⋉ ℚ_p/ℤ_p` | Amplitude `[−1,−1]`, conclusion `H^{≠−1} = 0`. Neg.: hamp holds for all `[a,b]` but `H¹ ≠ 0`; `hc` fails. Neg.: `Λ(A[0])` has amplitude `[0,0]` but `H^{−1} = ℤ_p`; `hA` fails | True | none |
| `isAdicComplete_of_…` (Lean:437) | `A = M = ℤ/4`, `p = 2` | Complete; `c = 2`; `M/2 = F₂` over `F₂`, `M/4 = ℤ/4` over `ℤ/4`. `M ⊗ A[2] → M` sends `1⊗2 ↦ 2`, injective with image `M[2] = {0,2}`; `n = 2`: `M ⊗ A → M` is the identity | True | none |
| `isCompletelyFlatModule_of_…` (Lean:456) | Neg.: `A = ℤ/4`, `M = ℤ/2` | `M/2M` flat over `F₂`, but `M/4M = ℤ/2` is not flat over `ℤ/4`, so `hflat` fails at `n = 2`; indeed `Tor₁^{ℤ/4}(ℤ/2, ℤ/2) = ℤ/2 ≠ 0` | True | none |
| `IsPerfect`, `IsPseudoCoherent`, closure lemmas (Lean:479–514) | `eA ⊂ k × k`; `[ℤ --2→ ℤ]` | `eA` is perfect (a retract of `A`), with Euler ranks `(1,0)` against `(χ,χ)` for any finite-free complex, so it has no bounded finite-free model; resolution `⋯ --e→ A --(1−e)→ A --e→ eA`. Shift and cone stay bounded finite projective | True | none |
| `isPerfect_baseChange` (Lean:522) | `[ℤ --2→ ℤ] → F₂`; Neg.: `ℤ/2` over `ℤ/4`; Neg.: bi-infinite `ℤ/4` | `[F₂ --0→ F₂]`, `H^{−1} = H⁰ = F₂`. Neg.: `Tor_i^{ℤ/4}(ℤ/2, F₂) = F₂` for every `i`; `hK` fails. Neg.: not bounded above, so `IsFiniteFreeModel` fails | True | none |
| `ringTowerLimit_jacobson` (Lean:537) | `k[t]/tⁿ⁺¹`; Neg.: `k[t]/tⁿ` | `1+t ↦ 1`, a unit; `t ↦ 0`. Neg.: `A₀ = 0`, `1 ∈ ker(k → 0)` not nilpotent, so `hnil` fails at `n = 0`, and `π₀ t` is a unit while `t` is not | True | none |
| `pseudoCoherent_residueCriterion` (Lean:550) | `[k[[t]] --t→ k[[t]]]`; `k` over `k[ε]/ε²`; `R = 0` | Fibre `[k --0→ k]` needs `[−1,0]` though `H^{−1}(P) = 0`. Fibres of `k` are nonzero in every degree `≤ 0`, so no `[a,b]` exists. `R = 0`: vacuous, `E = 0` | True | none |
| `biduality_of_finite/_artinian` (Lean:574, 587) | `ℤ_p`, `E = ℚ_p/ℤ_p`; Neg.: `ℤ_(p)` | `Hom(ℤ_p, E) = E` Artinian, `End E = ℤ_p`; `Hom(E, E) = ℤ_p` finite. Neg.: `End(ℚ/ℤ_(p)) = ℤ_p ≠ ℤ_(p)`, so completeness is needed. Envelope = injective + injective map + essential (pinned structure) | True | none |
| §0.1 Checks (README:774–784) | constant `A[t] → A[t]/(t²)` | `H₀ = A[t]`, kernel `t²A[t] ≠ 0`, not a resolution | True | none |
| §0.2 Checks (README:834–848) | `F_p ⊗^L F_p`; bi-infinite `ℤ/4` | `H⁰ = H^{−1} = F_p`; termwise `⊗ F₂` gives `F₂` in every degree vs derived `0` | True | R01 (name) |
| §0.3 Checks (README:1143–1160) | `V = ⊕_ℕ F₂`, `F = W**` | `LF(V) = V**[0]`; `V → V**` not onto; the filtered-colimit extension gives the identity | True | none |
| §0.4 Checks (README:1214–1245) | `k[ε]/ε²`, char ≠ 2 and char 2; `ℤ → ℤ/2` | `[B --2ε→ B dε]`, `H^{−1} = εB ≅ k`; char 2: `H^{−1} = H⁰ = B`; `H^{−1} = (2)/(4) = ℤ/2` | True | none |
| §0.5–0.6 Checks (README:1279–1369) | `ℤ/9 → F₃`; `ℚ[X] ⊕ εℚ[X]`; two copies of `ℤ/4 → F₂` | Conormal `3 ↦ 1`, negative class `3 ↦ 2`, order 3. `a+εb ↦ a+ε(b+a′)` fixes quotient and kernel. `Exal = F₂`, so the sum is `0` | True | none |
| §0.7 Check (README:1325) | `k[x,y]/(x,y)²` | `Rel = P r₁ ⊕ P r₂`; `TrivRel = (x r₁, y r₁ + x r₂, y r₂)`; `Rel/TrivRel` has basis `r₁, r₂, y r₁`; kernel to `F⊗B` is `k·y r₁`, so `H^{−2} = k` | True | none |
| §0.8–0.10 Checks (README:1390–1459) | `ℤ → ℤ → ℤ/3`; `ℤ → F_p → F_p` | `H^{−1} = ℤ/3`, second map the identity. `L_{F_p/F_p} = 0` vs `F_p[1]` | True | none |
| §0.9 Check (README:1438) | constant `ℤ → ℤ/2` | `H₁(L^Δ) = ℤ/2` | True | none |
| §0.13 Checks (README:1510–1512) | `(p) ⊂ ℤ`; `k[X]/X²` | `F_p[1]`; `X² ↦ 2X dX`, zero in char 2 | True | R03 (locator) |
| §0.17 Checks (README:1652–1667) | `L = Be ⊕ Bf`, `n = 2` | Graded pieces `0`, `B(e∧f)`, `0`, matching `∧²B² = B` | True | none |
| §0.25 Checks (README:1740–1755) | `k[x]/x³ → k[x]/x² → k`; `F₂[ε]/ε²` over `ℤ/4` | `H^{−1}(L_{A/A′}⊗k) = (x²) ≅ k`; `(x)/(x²)` map is an iso, so the connecting map is onto `k`. `2B′ = 0`, `JB′ = 0`, not flat | True | none |
| §1.1 Checks (README:1846–1877) | `×p` tower; tail removal; `ℤ[0] → ℤ[1]` with `×3` | `δ(x) ↦ x₀ ∈ ℤ` under `Σpⁿaₙ`, so `lim¹ = ℤ_p/ℤ`. `×p` is bijective on `ℤ_p/ℤ`, so tail removal is `(×p^r)^{−1}`. `Σ 9^m = −1/8 ∉ ℤ` | True | none |
| §1.2–1.3 Checks (README:1940–2022) | `Hom(ℤ[1/2], ℤ[1])`; cokernel of `2` on `ℤ[0]` | `Ext¹ = ℤ₂/ℤ ≠ 0`. Epis split, `End ℤ[0] = ℤ` has no nontrivial idempotent, and `ℤ → ℤ/2` contradicts both candidate summands | True | none |
| §1.4 Checks (README:2038–2040) | `K(p^{n+1}) → K(pⁿ)`; `(0)` | `(p, id)`: `id∘p^{n+1} = pⁿ∘p`. Degree −1 transitions are `0`, so `Rlim = M` | True | none |
| §1.5 Checks (README:2092–2128) | `ℤ[x_i]/(px_i)`; `R ⋉ T` | Torsion `(x_i)`, `c = 1`. Telescope inverse `b ↦ (Σ_j p^j b_{n+j})`, kernel `∩ p^kℤ_p = 0`, so `R[1]` is complete; `Hom(C, R[1]) = Ext¹_A(A, R) = 0`; nonsplit | True | none |
| §1.6 Check (README:2233–2239) | standard resolution `P• → 0` | `Hom_S(0, P•) = ∅`, `Hom_S(A, P•) = {*}`; both singletons in `H_A` | True | none |
| §1.7–1.9 Checks (README:2275–2338) | `ℤ`, `ℤ_p`, `F_p`; `ℤ_p → ℤ_p × ℤ_p`; `ℤ_p → F_p` | Completely flat but not complete; faithfully flat; `Tor₁ ≠ 0`. Čech splits. `Tor₁^{ℤ_p}(F_p, F_p) ≠ 0`. The I-power-torsion equivalence holds by dévissage plus filtered colimits | True | none |
| §1.E Checks (README:2394–2553) | `k[x_i]/(x_i²)` tower; `[A_n --t→ A_n]` | `I` is locally nilpotent, `I^r ≠ 0`, limit `B`. `H^{−1}(M_n) = (tⁿ) ≅ k` with zero transitions, while `H^{−1}(M) = 0` | True | none |
| §1.M Checks (README:2602–2666) | `R ⊕ E` over `ℤ_p`; `R = k`, `⊕_ℕ k` | `D(R⊕E) = E⊕R`, evaluation an iso. `D(M) = ∏k`, `M → M**` injective but not onto | True | none |

## Not verifiable

- **NSW, Proposition 2.1.1 and Lemma 2.2.4** (README:960–962: printed pp.99, 105, PDF pp.116, 122). The cached entry for NSW holds only the authors' landing page (41 lines). I did not fetch the PDF, because this review edits no manifest. §S.1 is outside the seeded sample.
- **IllusieCC, Chapter II, 1.2.6.2** (README:1423). The manifest records it as uncertified (Springer LNM 239, paywalled), so it is settled. GR's use of it at GR line 10637 matches README's restatement.

## Source issues

- **Error** in StacksMA at §15.96 opening paragraph, Tag 0BKH, p.275: the source says the derived completion of `A[0]`, for `A = ℤ_p ⊕ ℚ_p/ℤ_p`, `I = (p)`, is `ℤ_p[1] ⊕ ℤ_p[0]`; it should be nonsplit in `D(A)`, since `Hom_{D(A)}(K^∧, ℤ_p[1]) = Ext¹_A(A, ℤ_p) = 0`, splitting only in `D(ℤ_p)`; affects a stated result.
- **Misprint** in StacksMA at Lemma 15.93.21, Tag 0AAJ, proof of (2), p.268: the source says `H^i(C^∧) = 0` for `i < r`; it should be for `i < −r`, as the Koszul complexes sit in degrees `−r, …, 0`; affects the proof.
- **Error** in SAG at Construction 25.2.2.2, p.1700 (also Proposition 25.2.3.4(2), p.1703): the source says `∧ⁿ` is the quotient of `M^{⊗n}` by signed permutations and is free of rank `C(m,n)`; it should be the alternating quotient, since over `ℤ`, `M = ℤ`, `n = 2` the signed coinvariants are `ℤ/2`; affects a stated result.
- **Misprint** in SAG at §25.2.4, p.1705: the source says "Proof of Proposition 25.2.4.1" a second time, heading the argument that follows; it should say "Proof of Proposition 25.2.4.2"; affects nothing.
