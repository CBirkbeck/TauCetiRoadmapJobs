# Review of RigidAnalyticGeometry (pull request #1808 at 400e9ea)

**Verdict:** needs changes

This is an incremental re-review. Between a96d197 and 400e9ea, `TauCetiRoadmap/RigidAnalyticGeometry/` and `lake-manifest.json` are unchanged (0 lines), so the pins are the same: Tau Ceti `2fd255d`. The five commits since a96d197 change only AlgebraicCurves, AlgebraicTopology, BordismFormalGroups, CharacteristicClasses, ComplexKahlerGeometry, LocalPurity, ModularCurves, PadicFunctionalAnalysis, PurityOfBranchLocus and ReductiveGroups.

I re-checked every finding of the previous review against this head, current main (1bea835) and the pins. None is repaired, and the gate still fails. The fourteen findings are restated below with the same numbers and freshly checked witnesses.

## R01 (P1) — Supply cycle: §8.2 and §8.3 need AdicSpacesPartII R1.7, which says it is supplied by them

- **Location.** `TauCetiRoadmap/RigidAnalyticGeometry/README.md`:
  - line 1033 (§8.2 *Needs:*): "AdicSpacesPartII R1.7";
  - line 1057 (§8.3 *Needs:*): "finite type morphisms); AdicSpacesPartII R1.7; [Huber-FR] §4.";
  - line 1096 (Layer 8 Dependencies).
- **Claim.** §§8.2–8.3 consume AdicSpacesPartII R1.7.
- **Witness.** `TauCetiRoadmap/AdicSpacesPartII/README.md` on main (1bea835):
  - R1.7 starts at line 9806;
  - line 9819 says it is "Supplied by RigidAnalyticGeometry";
  - its *Needs:* (lines 9849–9853) list *classical-points-constructible-density* (RigidAnalyticGeometry §8.2).

  That is a two-node cycle. The depcheck does not test pairs of roadmaps that are both on main.
- **Repair.**
  - Delete "AdicSpacesPartII R1.7" from the *Needs:* lines of §8.2 and §8.3, from both Sources lines and from the Layer 8 Dependencies.
  - Cite the pinned classical-point map instead: `TauCeti.ValuationSpectrum.maximalSpectrumToSpa` (`TauCeti/AlgebraicGeometry/AdicSpace/Spa/MaximalIdealPoint.lean:237`), with injectivity from `eq_maximalSpectrumToSpa_iff` (line 261).
  - To make the whole relation with Part II one-way, also replace the other Part II citations with pinned declarations:
    - for "R0.3" (lines 321, 341, 389), cite `TauCeti.Huber.CompletedTensor` (`RingTheory/Huber/TensorProduct/Completion.lean:73`);
    - for "R0.4" (lines 469, 544), cite `TauCeti.IsAffinoidAlgebra.supSeminorm_eq_smoothingFun` (`RingTheory/Affinoid/SpectralRadius.lean:140`).

## R02 (P2) — Two-way supply with AdicSpacesPartIII, which also plans Part III's theorems again in Layer 7 and §8.4

- **Location.**
  - README line 46, the supplier-table row "AdicSpacesPartIII R3.1–R3.7".
  - Line 920 (§7.4): "*Needs:* AdicSpacesPartIII R3.6; §6.3 (Kiehl properness); §7.1 (Banach".
  - Lines 321, 389, 518, 544, 824, 897, 970 and 1081.
  - `Suggested.lean` docstring lines 21–22.
- **Claim.** Part III supplies §§1.3, 2.3, 7.1, 7.3, 7.4 and 8.4.
- **Witness.** `TauCetiRoadmap/AdicSpacesPartIII/README.md` on main:
  - line 112 lists "RigidAnalyticGeometry (roadmap on main) Layers 1–8" among its dependencies;
  - R3.6's *Needs:* (line 11042) is "RigidAnalyticGeometry §7.5, principal filtrations and formal functions";
  - in this README, §7.5 needs §7.4, and §7.4 needs R3.6.
- **Repair.** This roadmap supplies Part III, so it cites nothing from Part III.
  1. Delete the Part III restatements: items 1–4 of §7.1, the quasi-Stein paragraph of §7.3, §7.4 and §8.4. Replace them with one Scope sentence naming AdicSpacesPartIII R3.1–R3.7.
  2. Move §7.5 to R3.6, which already states it as *proper-cohomology-adic-completion*. Add the line "§7.5 → AdicSpacesPartIII R3.6 *proper-cohomology-adic-completion*".
  3. In §2.3, delete the almost-noetherian contract. Part III owns it at line 11176, as `IntegralAffinoidPresentation.almost_noetherian` and `.fg_of_discrete`.
  4. In §1.3, own the complete field extension here: Conrad line 274, Lemma 1.1.5(1), p. 6.
  5. Remove Kiehl finiteness, Theorem B and proper GAGA from the docstring's list of this roadmap's headlines.

## R03 (P2) — `Suggested.lean` redefines objects that Tau Ceti already defines at the pin

- **Location.** `Suggested.lean`:
  - line 67, `def IsAffinoidAlgebra`;
  - line 148, `def pointNorm`;
  - line 155, `def supSeminorm`;
  - line 231, `def IsPresentationRing`;
  - line 274, `def IsSlopeLE`;
  - line 283, `def IsSlopeDecomposition`.
- **Witness.** Each object is already defined at the pin:
  - `TauCeti.IsAffinoidAlgebra` (`RingTheory/Affinoid/Basic.lean:30`);
  - `TauCeti.pointNorm` and `TauCeti.supSeminorm` (`RingTheory/Affinoid/SupSeminorm.lean:96, 103`);
  - `Polynomial.IsSlopeLE` (`Analysis/Normed/Unbundled/Slope.lean:64`);
  - `ContinuousLinearMap.IsSlopeDecomposition` (`Analysis/Normed/Operator/SlopeDecomposition.lean:51`).
- **Repair.**
  - Import the `TauCeti.RingTheory.Affinoid.*` modules and `TauCeti.Analysis.Normed.Operator.SlopeDecomposition`.
  - Delete the six definitions, and `IsStrictRadius` (line 71) with them.
  - State the remaining headlines on the pinned carriers. `integralClosure_finite` becomes `TauCeti.Ring.IsJapanese (TateAlgebra K n)` (`RingTheory/Japanese.lean:125`).
  - Cite the pinned names in §7.2 and in Downstream consumers.

## R04 (P2) — Four headlines are statable at the pin but missing, and the docstring calls them not statable

- **Location.** `Suggested.lean` lines 18–28. One entry reads: "classical Tate acyclicity and the sheaf property of the structure presheaf (Layer 5): no `Sp A` with its rational basis and structure presheaf". Another: "excellence of affinoid algebras … no excellence predicate in Mathlib".
- **Witness.** Each needed carrier exists at the pin:
  - `TauCeti.AffinoidSubdomain.weakGTopology` (`AlgebraicGeometry/Rigid/Affinoid/Site.lean:63`) and `.presheaf` (`Presheaf.lean:130`);
  - `TauCeti.Excellence.IsGRing` (`RingTheory/RegularLocalRing/GRing.lean:57`);
  - `TauCeti.rationalDomain` (`RingTheory/Affinoid/Subdomain/Rational.lean:79`);
  - `maximalSpectrumToSpa`, together with `constructibleTopology`.

  None of the four theorems is proved at the pin.
- **Repair.** Add these four headlines, with locators:
  - Tate acyclicity, as `Presheaf.IsSheaf` for the weak G-topology (BGR 8.2.1; KiehlAB);
  - `IsGRing A` for affinoid `A` (Conrad lines 129–136);
  - Gerritzen–Grauert: every affinoid subdomain is a finite union of rational domains (BGR 7.3.5);
  - constructible density of the classical points (HuberCV line 818, Corollary 4.2).

  Then rewrite the docstring list so that it names only the headlines that are not statable: `RigidSpace`, rigid analytification, the rigid–adic functor and J-2.

## R05 (P3) — Padding: eighteen sorried theorems are already proved at the pin

- **Location.** `Suggested.lean` lines 79, 83, 88, 94, 100, 107, 121, 129, 158, 164, 171, 176, 182, 195, 200, 215, 236 and 297.
- **Witness.** On the pinned carriers, each closes with a single `exact`. Examples:
  - `IsAffinoidAlgebra.exists_finite_injective` (`RingTheory/Affinoid/NoetherNormalization.lean:163`);
  - `isJacobsonRing` (`MaximalSpectrum.lean:53`);
  - `continuous_algHom` (`Continuity.lean:46`);
  - `isClosedEmbedding_of_finite_injective` (`FiniteMap.lean:61`);
  - `exists_pointNorm_eq_supSeminorm` (`MaximumModulus.lean:156`).

  The full list is in R05 of review r37.
- **Repair.** Delete them from `Suggested.lean`. The README keeps the statements and cites the pinned names.

## R06 (P3) — The README does not cite the pinned affinoid library, and plans it again as open targets

- **Location.** README lines 118–130 ("Existing library interfaces"). They name only the Tate-algebra basics and end with "Missing results are required in Tau Ceti in these interfaces." The targets of Layers 1–4, §6.1 and §7.2 are written as open work.
- **Witness.** The following are pinned under `TauCeti/RingTheory/Affinoid/`:
  - `ContractiveRenorming.lean:60`
  - `Restricted.lean:73, 171`
  - `RationalFraction.lean:326`
  - `Subdomain/Flat.lean:62, 89`
  - `Subdomain/Cover.lean:59`
  - `Reduction.lean:127–382`
  - `SpectralRadius.lean:107`

  Also pinned: `Slope.lean:83, 98` and `TauCeti/Topology/GTopology/*`.
- **Repair.** Add a "From Tau Ceti" contract that lists these declarations with their files. Say in Scope that they are already in the library, and delete the targets they discharge.

## R07 (P3) — Gate: `letI` in theorem signatures

- **Location.** `Suggested.lean`:
  - line 90 (`exists_finite_injective`): "(letI := π.toRingHom.toAlgebra; Module.Finite (TateAlgebra K d) A)";
  - line 133 (`isClosedEmbedding_of_finite_injective`).
- **Witness.** The gate's `statement-hygiene` check, re-run at this head, reports both lines. The rule is: no `letI`/`haveI` in a signature.
- **Repair.** Use `AlgHom.Finite`, as the pinned statements do. Both theorems are deleted under R05 anyway.

## R08 (P3) — Gate: edits outside the pull request's folders

- **Location.**
  - `Completed/ArithmeticDirichletSeries/README.md` line 331: "`LFunctions` consumes this package and supplies its own character-specific continuation."
  - `TauCetiRoadmap/SymplecticGeometry/README.md` line 77.
- **Witness.** Excluding the fifteen folders that this brief names as the pull request's own, `git diff --stat origin/main...HEAD` lists exactly these two files, one line each. The gate's `outside-folder` check reports both.
- **Repair.** Do one of the following:
  - revert both one-line edits;
  - move them to a pull request that owns those folders;
  - declare those two folders as this pull request's own.

## R09 (P3) — A conflicting open revision, with no stated order

- **Location.** The merge-order paragraph of the pull request description: "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**."
- **Witness.** The overlap index of 2026-11-09T15:58 says: "#1808 and #1854 conflict in … `TauCetiRoadmap/RigidAnalyticGeometry/README.md`, `TauCetiRoadmap/RigidAnalyticGeometry/Suggested.lean`". #1854 is open at 200e4f3, and its copy of this README (946 lines) differs from this head's (1195 lines).
- **Repair.** State in that paragraph which of #1808 and #1854 is rebased on the other.

## R10 (P3) — Locators that do not support the statement as written

1. **§7.5, line 940.** It cites "[Kiehl-E] Theorem 3.4 and the argument preceding Theorem 3.7". The formal-functions isomorphism is itself KiehlE Theorem 3.7 (line 809, p. 210), a corollary stated under the hypotheses of 3.4. **Repair:** cite Theorem 3.7.
2. **§7.3, line 895.** It cites "[Conrad] §§1–2". **Repair:** cite KiehlAB line 601 (Def. 2.3), KiehlAB line 615 (Satz 2.4) and Conrad line 554 (Lemma 2.1.4, p. 12).
3. **§7.2 and `Suggested.lean` lines 273 and 279.** They cite "[Urban] 2.3.1", but Urban line 869 defines slope decompositions only over a finite extension L/ℚ_p. Also, the 2.3.2–2.3.3 cited for the projector are functoriality and uniqueness (lines 883, 900). **Repair:** say that the affinoid version is this roadmap's extension.
4. **§2.3, line 511, and `Suggested.lean` line 211.** They cite FK B.1.3(1), but FK line 10032 does not contain the reduced-quotient criterion. **Repair:** cite it for the boundedness step only.
5. **§6.3, lines 736–742.** Kiehl properness is defined "over each admissible affinoid of the base". KiehlE line 500 (Def. 2.3, p. 202) asks only for some admissible affinoid covering. **Repair:** define it as the source does, or cite the theorem that the two definitions agree.

## R11 (P3) — RestrictedPowerSeries is cited for statements it does not make

- **Location.**
  - README lines 164–166: "RestrictedPowerSeries §§2.4 and 5 (Gauss norm, polynomial density, reduction, evaluation, …".
  - Lines 248–249: "RestrictedPowerSeries Layer 4 (restricted series over Banach rings, `A⟨X⟩`)".
- **Witness.** `TauCetiRoadmap/RestrictedPowerSeries/README.md` on main (1bea835):
  - Gauss norm and density are §1.1 (line 247), evaluation is §2.1 (line 306) and reduction is §3.3 (line 424);
  - §2.4 is "Identity and maximum principles" (line 364);
  - Layer 4 is "Weierstrass theory over Banach rings" (line 452).
- **Repair.** Cite §§1.1, 2.1, 2.4, 3.3, Layer 4 and §5 item by item, and add §§1.1, 2.1 and 3.3 to the supplier-table row.

## R12 (P3) — Backticked names of this roadmap's own that nothing declares

- **Location.** README lines 49–50, 698, 805, 825 and 1129–1130: `Sp`, `RigidSpace`, `RigidSpace K` and `rigidToAdic`.
- **Witness.** None of these names is declared in `Suggested.lean` (it mentions them only in its docstring, lines 19–23) or in the pinned Tau Ceti.
- **Repair.** Write them in prose or in italics, for example "the rigid category of §6.2" or "the functor r of §8.3".

## R13 (P3) — §7.3's classical identity principle has no Checks

- **Location.** README lines 882–886: "On a connected normal rigid space, any nonempty admissible open is analytically Zariski dense."
- **Repair.** Add these Checks:
  - on `Sp K⟨T⟩`, a function that vanishes on `|T|≤|ϖ|` is zero;
  - on `Sp K⟨x,y⟩/(xy)`, `x` vanishes on `|y|≥|ϖ|` without being zero, so normality is needed;
  - on `Sp(K×K)`, `(1,0)` vanishes on one component, so connectedness is needed;
  - `K⟨T⟩/(T)` restricts to zero on `|T|≥|ϖ|`, so the statement fails for coherent sheaves.

## R14 (P3) — A reference link is mislabelled

- **Location.** README line 1153: "[Author text](https://www.math.purdue.edu/~tongliu/seminar/rigid/Bosch.pdf)".
- **Witness.** Bosch lines 5 and 40–47 show that this is the copyrighted Springer LNM 2105 volume, hosted on a third party's seminar page. It is not an author's text.
- **Repair.** Cite DOI 10.1007/978-3-319-04417-0.

## Previous findings

- R01 — not repaired: README line 1033 still cites "AdicSpacesPartII R1.7". AdicSpacesPartII line 9819 on main still says "Supplied by RigidAnalyticGeometry".
- R02 — not repaired: README line 920 still reads "*Needs:* AdicSpacesPartIII R3.6; §6.3 (Kiehl properness)". Part III R3.6 (line 11042) still needs §7.5.
- R03 — not repaired: `Suggested.lean` line 67, `def IsAffinoidAlgebra`, and lines 148, 155, 231, 274 and 283 are unchanged.
- R04 — not repaired: `Suggested.lean` lines 19–20 still say "no `Sp A` with its rational basis and structure presheaf".
- R05 — not repaired: the eighteen sorried theorems at lines 79–297 are unchanged.
- R06 — not repaired: README line 130 still ends with "Missing results are required in Tau Ceti in these interfaces."
- R07 — not repaired: the gate still reports `letI` at `Suggested.lean` lines 90 and 133.
- R08 — not repaired: `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md` are still changed, one line each.
- R09 — not repaired: the merge-order paragraph still names only #1101 and #1807. #1854 (now at 200e4f3) still conflicts in this folder.
- R10 — not repaired: line 940 still reads "[Kiehl-E] Theorem 3.4 and the argument preceding Theorem 3.7". Lines 511, 736–742 and 895 are unchanged.
- R11 — not repaired: lines 164–166 still read "RestrictedPowerSeries §§2.4 and 5 (Gauss norm, polynomial density, reduction, evaluation".
- R12 — not repaired: lines 49–50 still read "`Sp`, affinoid subdomains, classical Tate acyclicity, `RigidSpace`, rigid analytification and `rigidToAdic`".
- R13 — not repaired: lines 882–886 still have no Checks.
- R14 — not repaired: line 1153 still reads "[Author text](https://www.math.purdue.edu/~tongliu/seminar/rigid/Bosch.pdf)".

## Verified sound

**Scope of this round.**
- `git diff a96d197 400e9ea` is empty for `TauCetiRoadmap/RigidAnalyticGeometry/`, `lake-manifest.json` and `lean-toolchain`. There are no changed passages, so no statement needed a new review, and no seeded-sample target falls inside a change.
- The commits since a96d197 change other folders of this pull request. One of them, PadicFunctionalAnalysis, is cited by this README, so I re-resolved those citations at this head (below).
- Main moved from 28c3fca to 1bea835. In the roadmaps this README cites, that move changed only `PROGRESS.md`/`STATUS.md` of AdicSpacesPartIV and SchemeAndStackFoundations.

**Gate and build.**
- I re-ran the full gate at this head. Result: FAIL.
  - `statement-hygiene=2`, at lines 90 and 133 (R07).
  - `outside-folder`: 29 raw entries. Excluding the pull request's own fifteen folders leaves 2 (R08).
  - Every other counter is 0: `set_option`, sorry-data, imports, latex, prnum, round-labels, layer-ids, target-ids, depcheck, stray-files and the rest.
- `lake env lean` on `Suggested.lean` exits 0, with 22 warnings, all `declaration uses 'sorry'`, and no errors.
- The signature listing has 31 declarations, 9 of them flagged:
  - The flags are the same 9 as before, all on `def`/`abbrev`s: `weightedTate`, `TateAlgebra`, `IsAffinoidAlgebra`, `IsStrictRadius`, `pointNorm`, `supSeminorm`, `IsPresentationRing`, `IsSlopeLE` and `IsSlopeDecomposition`.
  - Their bodies do not use `[CompleteSpace K]`/`[IsUltrametricDist K]`, and the pinned counterparts omit those binders too.
  - All 22 theorems keep `[CompleteSpace K]`.
  - The file is unchanged, so I did not run a new `#check @` pass.

**Dependency check.**
- Output: `depcheck: 236 roadmaps, 2267 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- R01 and R02 are mutual citations between roadmaps that are both on main, which the tool does not test.
- RigidAnalyticGeometry is on main and is not listed in `ORDER.txt`, which is expected.

**Witnesses re-checked at this head and on main 1bea835.**
- AdicSpacesPartII lines 9806, 9819 and 9849–9853.
- AdicSpacesPartIII lines 112, 11042 and 11176.
- RestrictedPowerSeries headings at lines 247, 306, 364, 424 and 452.
- README lines 46, 49–50, 164–166, 248–249, 321, 341, 389, 469, 511, 518, 544, 698, 736–742, 805, 824–825, 882–886, 895, 897, 920, 940, 970, 1033, 1057, 1081, 1096, 1129–1130 and 1153.
- `Suggested.lean` lines 18–28, 67, 71, 88–90, 129–133, 148, 155, 211, 231, 273–283.

**Pinned declarations re-opened at Tau Ceti 2fd255d (18).** All are under `TauCeti/`:
- `RingTheory/Affinoid/Basic.lean:30`
- `RingTheory/Affinoid/SupSeminorm.lean:96, 103`
- `Analysis/Normed/Unbundled/Slope.lean:64`
- `Analysis/Normed/Operator/SlopeDecomposition.lean:51`
- `RingTheory/Affinoid/NoetherNormalization.lean:163`
- `RingTheory/Affinoid/MaximalSpectrum.lean:53`
- `RingTheory/Affinoid/Continuity.lean:46`
- `RingTheory/Affinoid/FiniteMap.lean:61`
- `RingTheory/Affinoid/MaximumModulus.lean:156`
- `AlgebraicGeometry/AdicSpace/Spa/MaximalIdealPoint.lean:237, 261`
- `AlgebraicGeometry/Rigid/Affinoid/Site.lean:63`
- `AlgebraicGeometry/Rigid/Affinoid/Presheaf.lean:130`
- `RingTheory/RegularLocalRing/GRing.lean:57`
- `RingTheory/Huber/TensorProduct/Completion.lean:73`
- `RingTheory/Japanese.lean:125`
- `RingTheory/Affinoid/SpectralRadius.lean:140`

**Source locators re-read for the repairs above (3).**
- KiehlE line 809: Theorem 3.7 is the a-adic completion statement under the hypotheses of 3.4.
- HuberCV line 818: Corollary 4.2, density of Max A in the constructible topology of Spa.
- Conrad line 274: Lemma 1.1.5(1), faithful flatness and the complete tensor comparison.

**Citations into folders this pull request changes.** PadicFunctionalAnalysis changed in this pull request since a96d197. This README cites it at lines 180, 195, 216, 249, 320, 387, 638, 652, 785, 822 and 969. At this head:
- §1.2 is "Mapping theorems" (open mapping, closed graph);
- Layer 1 has §1.4, "Finite Banach modules" (finite-module topology, strictness);
- §2.2 is "Bases and property (Pr)", including the lifting characterisation and the `C₀(I,R)` model isometry;
- §2.4 is "Countable type and strict splitting".

These headings and contents are the ones they were at a96d197 and on main, so every citation still resolves. SchemeAndStackFoundations §0.20 (line 1439) and §0.21 (line 1531) also resolve at this head. None of this pull request's other folders cites RigidAnalyticGeometry.

**Adversarial table.** No statement changed, so every row is carried forward from review r43 (at a96d197), which carried them from r37 (at c9403e2), with their computed values. "Pinned" means already proved at the pin (R05).

| Statement | Instances | Values computed | Result (carried from r43/r37) |
|---|---|---|---|
| `IsAffinoidAlgebra` | 0; `K`; `K⟨T⟩/(T²)` | `T₀→0`, `T₀=K`; the quotient map is surjective in each case | true; duplicate (R03) |
| `IsStrictRadius` | `p^(−1/2)` over ℚ_p; `r=0` | `(p^(−1/2))²=\|p\|` with m=2; `0<r` excludes 0 | true |
| `integralClosure_finite` | n=0; `Frac T₁(√T)`; char p with `T^(1/p)` | the closure is `L`; `K⟨S⟩` with S²=T has rank 2; `K⟨T^(1/p)⟩` has rank p | true; restate as `IsJapanese` |
| `exists_finite_injective` | 0; cusp; `K×K` | no injective `T_d→0` (hypothesis needed); the cusp is free on 1, Y over `K⟨X⟩`; `K→K×K` is finite with d=0 | true; pinned |
| `finite_residue` | `ℚ_p⟨T⟩/(T²−p)` | residue field `ℚ_p(√p)`, dimension 2 | pinned |
| `height_eq_…_of_isDomain` | `K`; `K⟨T⟩×K` | height 0 = dim 0; ht(`K⟨T⟩×0`) = 0 ≠ dim 1, so the domain hypothesis is needed | pinned |
| `weightedTate_isAffinoid_iff` | n=0; ρ=`p^(−1/2)` | both sides true; `S↦T²/p` has weighted norm 1; coefficients `\|a_{2k}\|p^(−k)→0` | pinned |
| `continuous_algHom_…` | `K×K` | `⋂ₙ(K×0)ⁿ = K×0 ≠ 0`; closed graph | pinned |
| `isClosedEmbedding_…` | `K⟨T⟩→K⟨T/ϖ⟩` | injective, with dense image that is not closed; not finite, so the finiteness hypothesis is needed | pinned |
| `pointNorm`/`supSeminorm` | 0; `K×K` at `(a,b)` | `⨆∅=0`; the two points give `\|b\|` and `\|a\|`, so the sup is the max | duplicate (R03) |
| `supSeminorm_pow` | n=0 on 0; ℚ_p(√p) with n=2 | LHS 0 vs RHS 1, so `hn` is needed; `p^(−1)=\|p\|` | pinned |
| `supSeminorm_eq_zero_iff` | `K⟨T⟩/(T²)` | `T` is nilpotent with sup 0 | pinned |
| `exists_uniform_valueGroup_exponent` | `ℚ_p⟨T⟩/(T²−p)` | the sup of T is `p^(−1/2)`; m=1 fails, m=2 gives `\|p\|` | pinned |
| `powerBounded_iff`/`topologicallyNilpotent_iff` | in `ℚ_p⟨T⟩`: T, T/p, pT | sups 1, p, 1/p; power-bounded yes/no/yes; topologically nilpotent only pT | pinned |
| `banachFunctionAlgebra` | `K⟨T⟩/(T²)`; `K×K` with the max norm | `‖T‖=1` but sup 0, so `IsReduced` is needed; C=1 | true; not pinned (keep) |
| `mem_iff_…_of_isReduced` | `ℤ_p⟨T⟩` with ϖ=p; `ℚ_p⟨T,S⟩/(S²−p²T)` | `𝔽_p[T]` is reduced, so B=A°; `S/p∉B` but `(S/p)²=T` | pinned |
| `integral_iff_…` | 0; the same quadratic; `K⟨T⟩/(T²)` | `{0}`; `S/p` is a root of `X²−T` with sup 1; `cT` is nilpotent with sup 0 | pinned |
| `exists_fg_smul_le_…` | ℂ_p, `𝒪`, N=𝔪, ε=½ | `N'=x𝒪` with ½<\|x\|<1; ε=1 would force 𝔪 to be finitely generated | true; owned by Part III (R02) |
| `isNoetherian_…_discrete` | ℚ_p; ℂ_p | a quotient of `ℤ_p⟨X⟩`; the hypothesis fails for ℂ_p | true; owned by Part III |
| `IsSlopeLE` | `X−c` with 0<\|c\|<1 and r=1; `1−cT`; Q=0 | root c fails; root `1/c` passes; root 0 fails | sound; duplicate |
| `IsSlopeDecomposition`/`exists_projection` | `c·id` with \|c\|=r; U=0; M=0 | M₁=M via `X−c`; M₁=0; trivial | duplicate; the projector just unpacks the definition |
| §1.3 field extension | `A=K⟨T⟩`, `M=A/(T)` | `L⟨T⟩/(T) = L = K⊗̂L` | matches Conrad Lemma 1.1.5(1) |
| §2.1 monic bound | `f²−p=0` | the bound `p^(−1/2)` is attained; exponent 1 would give `p^(−1)` | Check correct |
| §2.2 annulus | `XY=c` | sup X = 1, but sup XY = \|c\| ≠ 1·1 | Check correct |
| §6.1 cover | closed disc = open disc ∪ circle | gluing 0 and 1 contradicts the identity principle | Check correct |
| §7.1 `h(Σaₙ Tⁿ)=Σaₙϖⁿ Tⁿ` | truncation at N | `‖h−h_N‖≤\|ϖ\|^N`; cokernel K | Checks correct |
| §7.2 convention | r=\|p\|^h | `\|λ\|≥\|p\|^h ⟺ v(λ)≤h` | consistent |
| §7.5 filtration | a=0; a=1; id of Sp A | `R₀=M` and `Rₙ=0`; `Rₙ=M`; `Rₙ=aⁿM` | matches KiehlE Theorem 3.4 |
| §8.2 | `L_A` | the same definition as HuberCV line 766 | sound |

**Cross-roadmap citations.** The citation resolver finds no unresolved citation and no unresolved Lean name in this README (checked against main 1bea835 and 456 open heads). The overlap report lists:
- no id that this README cites and an open pull request drops;
- no id that only an open revision defines;
- no dropped id of this roadmap.

**Ownership against open pull requests.** Checked by object:
- the slope interfaces, against LocallyAnalyticDistributions at its open head and CompactOperators §4.3 on main;
- the rigid carriers, against AdicSpacesPartII;
- the folders this pull request changed since a96d197, for affinoid, rigid, sup-seminorm and slope objects: none found.

The R03 duplicates are with the pinned Tau Ceti, not with another roadmap.

**Remark on untouched text.** #1807, at edec751 and ordered before this pull request, carries its own rewritten copy of this folder, reviewed separately as review r51. #1854 carries a third copy. The copy at this head is older than both.

## Not verifiable

- **[BGR]** is recorded as uncertified (paywalled) and was not read. Its locators for §§0.2, 1.4, 1.5, 2.1, 2.2, 2.3, 6.1 and in the `Suggested.lean` docstrings are listed in review r37.
- **§8.4 (Proper GAGA)**, a seeded target, gives no source locator, so there is nothing to check (R02).
- **[Huber-FR] Proposition 4.5** (§8.3, a seeded target) was not read in this incremental round. The passage is unchanged, and the previous reviews did not read it either.

## Source issues

- none
