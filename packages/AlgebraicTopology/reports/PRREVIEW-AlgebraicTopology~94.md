# Review of AlgebraicTopology (pull request #1797 at 250bf7b)

**Verdict:** needs changes

Thirteen findings: two blocking (P2), eleven P3. Both blocking findings are about ownership: this
revision moves targets into Stages 4.8, 5.0, 5.5, 8.8c, 8.8d and 8.7 that other roadmaps still own.

## R01 (P2) — Stages 4.8, 5.0, 5.5, 8.8c and 8.8d re-plan DGFloer Layer 1 items 2–4, which DGFloer still owns

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 116–137 ("Stage 5.5 owns the fibration homotopy long exact sequence … DGFloer Layer 1 consumes these ordinary targets"), and lines 1258, 1295, 1462, 2774, 2840 and 3201–3204. In `Suggested.lean`: `exists_cwApproximation` (line 363), `SatisfiesSerreAxioms` (671), `hurewicz_isoModSerre` (689).

**Claim.** The README says AT owns the following, and that DGFloer, GeneralizedCohomology G2/G5 and TopologicalKTheory T1.5 consume them from AT:
- CW approximation of arbitrary spaces;
- the filtered-complex spectral sequence;
- the fibration exact sequence and the Serre spectral sequences;
- the functorial K(A,n) family;
- Serre classes and Hurewicz modulo a class.

On main, AT consumed all of these from DGFloer.

**Witness.** DGFloer README on main, line 140: "Layer 1 item 2 … owns the fibration homotopy exact sequence and ordinary homology Serre spectral sequence consumed by AT5.5". DGFloer #1798 keeps §§1.2–1.4 (line 769). GeneralizedCohomology lines 36/44 and TopologicalKTheory line 55 cite DGFloer.

**Repair.** Settle a single owner. There are two ways to do it.
- Restore main's direction. AT 4.8 (arbitrary spaces), 5.0, 5.5, 8.8c and 8.8d consume DGFloer Layer 1 items 2–4 by name and section, as main's README lines 102–112 and 915–925 do. Delete `exists_cwApproximation`, `SatisfiesSerreAxioms` and `hurewicz_isoModSerre` from `Suggested.lean`, its docstring bullets and the Summary's headline list.
- Complete the move, which keeps the AT ↔ DGFloer edge acyclic. Add to this pull request the DGFloer revision that deletes those targets from its §§1.2–1.4 and cites AT instead. Repoint GeneralizedCohomology lines 36/44 and TopologicalKTheory line 55, and give the old → new map.

Test: after the repair, DGFloer line 140 and AT line 135 no longer both claim the Serre spectral sequence.

## R02 (P2) — "Compact smooth manifolds have finite CW type" is owned twice in this pull request

**Location.** `README.md` line 2695 (`compactManifoldFiniteCWType`, Stage 8.7) and `Suggested.lean` line 623. Against these: `TauCetiRoadmap/GeometricTopology/README.md` line 3139, also changed by this pull request.

**Claim.** AT 8.7 owns the theorem and proves it from GeometricTopology 12.1 and the native `TauCeti.IsTriangulable.finiteCWType`.

**Witness.** GeometricTopology 12.1 line 3139 lists as its own target: "Compact smooth manifolds have finite CW type (`TauCeti.FiniteCWType`), through 11.2". Line 3132 says AT consumes the item for that same result. The same theorem therefore appears in two owners' target lists.

**Repair.** In GeometricTopology 12.1, replace the line 3139 bullet with "consumed by AlgebraicTopology Stage 8.7 (`compactManifoldFiniteCWType`)". Keep the triangulation (smooth triangulability) as 12.1's target.

## R03 (P3) — Names dropped from Stages 8.8 and 8.10–8.12 that other roadmaps cite, with no old → new entry

**Location.** `README.md` lines 518–542 (the former-names paragraph).

**Claim.** That paragraph maps the dropped declaration names for roadmaps that cite them.

**Witness.** `ordinaryEMRelativeRepresentability`, `ordinaryEMLoopComparison`, `ordinaryCohomologySuspension` and `projectiveEMComparisons` (GeneralizedCohomology on main, line 35) and `mapsToGroupClassifyingSpaceEquiv` (StableHomotopyKTheory #1227, line 117) occur on main's AT README and 0 times here.

**Repair.** Add one line for each to the paragraph:
- the relative representability of 8.10;
- the EM loop comparison of 8.11b;
- σ_right of 8.11b;
- 8.12 together with CharacteristicClasses C1.5;
- the bijection `[X,Bπ]_*≃Hom(π₁X,π)` of 8.8b.

## R04 (P3) — The nerve-model comparison is handed to ClassifyingSpaces, which plans it only in unnamed open revisions

**Location.** `README.md` lines 102–110 and 2737–2742 ("ClassifyingSpaces … owns … the identity-on-π₁ normalized comparison of the nerve/bar model").

**Claim.** ClassifyingSpaces owns that comparison.

**Witness.** ClassifyingSpaces on main has no occurrence of "nerve". Only its revisions in #1807, #1808 and #1854 add "The nerve model … Layer 1 of this roadmap". On main, AT 8.8b owned the comparison. StableHomotopyKTheory #1227 line 119 consumes it as "AlgebraicTopology 8.8".

**Repair.** Either name that ClassifyingSpaces revision as a dependency in this pull request's description and merge-order paragraph, or keep the comparison in 8.8b until the revision merges.

## R05 (P3) — Six open pull requests whose heads conflict with this one, and no stated order

**Location.** The pull request description.

**Claim.** The description states no merge order.

**Witness.** The overlaps report shows #1652 and #1663 (another author, AT content revisions), #1807, #1808, #1854 and the pin bump #1187 all conflict with this head in `AlgebraicTopology/README.md` and/or `Suggested.lean`.

**Repair.** In the description, say which pull request merges first and which ones rebase onto it. For example: this one first, then #1652 and #1663 re-applied to the new stage text.

## R06 (P3) — Padding: `relativeCWPushout_base_isClosedEmbedding` follows from one native lemma

**Location.** `Suggested.lean` lines 326–331.

**Claim.** The declaration states that Z embeds as a closed subspace of Z ∪_a Y.

**Witness.** In a scratch copy, it closes with a single term: `TauCeti.TopCat.isClosedEmbedding_of_isPushout (IsPushout.of_hasPushout _ _).flip (RelCWComplex.isClosedBase (C := Set.univ)).isClosedEmbedding_subtypeVal`. The native lemma is at `Topology/Category/TopCat/ClosedEmbedding.lean` line 93, and both `T2Space` binders are unused.

**Repair.** Delete it from `Suggested.lean`. At README line 974, cite the native lemma (pushouts of closed embeddings) instead of owning the statement.

## R07 (P3) — `twistedRelativeSingularChainComplex` and `twistedRelativeHomology` restate native definitions

**Location.** `Suggested.lean` lines 411–418; `README.md` lines 2004–2006.

**Claim.** Both are presented as roadmap definitions.

**Witness.** The native `TopPair.twistedHomology` (`Singular/Twisted/Relative.lean` line 388) is `(P.twistedChainComplex L).homology k`, which is the same body. The first alias is literally `P.twistedChainComplex L`.

**Repair.** Delete both aliases. Use `P.twistedChainComplex L` and `P.twistedHomology L n` in `supportedTwistedHomology`, `twistedSupportLocalMap` and `LocallyRepresentedTopSection`, and name the natives in the README.

## R08 (P3) — Stage 5.0 restates the native convergence theory of filtered complexes

**Location.** `README.md` lines 1295–1331.

**Claim.** Stage 5.0 owns strong convergence for exhaustive, degreewise-bounded filtrations (Weibel 5.5.1), the description of the first differential and naturality.

**Witness.** All three are proved at the pin in `Algebra/Homology/SpectralSequence/Filtered/`:
- `exists_mem_range_filtrationAbutmentFiltrationι` and `CochainComplex.filtrationSpectralSequencePageXIsoGradedOfExhaustive` (`Exhaustive.lean` lines 102, 177);
- `spectralSequence_first_page_d_eq` (`FirstPage.lean` line 89);
- `filtrationFunctorMap` (`Naturality.lean`).

The Tau Ceti supplier list does not name them.

**Repair.** List them under From Tau Ceti. Reduce 5.0 to the homological regrading adapter and the complete-convergence form (Weibel 5.5.10). Whichever roadmap keeps 5.0 under R01 does this.

## R09 (P3) — `ordinaryPairQuotientComparison`: README generality ≠ Lean generality

**Location.** `README.md` lines 1143–1148 ("for closed CW/cofibration-NDR pairs"); `Suggested.lean` lines 287–303 (`[T2Space X] [RelCWComplex Set.univ B]`).

**Claim.** The README states the comparison for closed cofibration (NDR) pairs, while the Lean file states it only for Hausdorff relative CW pairs.

**Witness.** The cofibration hypothesis is statable at the pin (`IsClosed B` together with `TauCeti.HasHomotopyExtensionProperty B`), yet the Lean statement is the CW case only, as its own docstring says.

**Repair.** Either narrow README line 1144 to "Hausdorff relative CW pairs" and make the closed-cofibration form a separate README target with its own locator, or state that form in Lean.

## R10 (P3) — `homotopyInversePairExtension_left` has no locator

**Location.** `README.md` lines 1005–1011; `Suggested.lean` lines 333–336.

**Claim.** A prescribed one-sided inverse g₀ with homotopy H₀ extends with H|A×I = H₀.

**Witness.** Neither file cites a source. Brown 7.4.2 Addendum (brown line 11034, pp. 285–286) extends K₀+g₀H₀f₀−g₀f₀K₀, not H₀. Exactly H₀ also needs Vogt 1972, Proposition (vogt1972 line 28, p. 627), then Strøm Theorem 6. The claim holds by that route.

**Repair.** Cite Brown 7.4.2 with its Addendum, Vogt's Proposition and Strøm Theorem 6 at README line 1005 and in the docstring, and add Brown 7.4 and Vogt to References.

## R11 (P3) — Definitions without Checks: `capProduct`, `relativeCWPushoutCarrier`, `ordinaryEMPullback`

**Location.** `Suggested.lean` lines 383, 316, 734; README Stages 6.2, 4.5 and 8.10.

**Claim.** Each has a real body but no `**Checks.**` list in the README.

**Witness.** The README has seven Checks blocks (lines 854, 1829, 2013, 2639, 2713, 2890, 2994), none for these three. The circle example at line 2384 is insensitive to the cap convention.

**Repair.** Add three Checks each.
- **`capProduct`.** For the ordered 2-simplex [v₀,v₁,v₂] and φ dual to [v₀,v₁], σ⌢φ=[v₁,v₂]; a back-face convention gives 0. Capping with 1∈H⁰ is the identity. For p=q, a⌢c is ⟨a,c⟩ times the point class.
- **`relativeCWPushoutCarrier`.** B=∅ gives Z⊔Y; B=Y gives Z; (D¹,S⁰) attached to a point gives S¹.
- **`ordinaryEMPullback`.** id_K ↦ ι; a constant map ↦ 0; naturality under X′→X.

## R12 (P3) — Two locator descriptions overstate or misstate Hatcher

**Location.** `README.md` line 1235 (Proposition 4.21 cited for the local-coefficient isomorphism `isIso_twistedHomologyMap`). `README.md` line 2959 and `Suggested.lean` line 747 (Theorem 4.57 "there for basepoint-preserving maps of connected complexes").

**Witness.** Hatcher Proposition 4.21 (hatcher line 15508, p. 356) is stated for coefficient groups G only. Theorem 4.57 (hatcher line 17069, p. 393) is stated "for all CW complexes X", with no connectedness.

**Repair.** Cite 4.21 for constant coefficients only, and cite the native file for the local-coefficient form. Delete "connected" from the 4.57 description in both files.

## R13 (P3) — Process wording

**Location.** `README.md` line 1004 ("the theorem the earlier interface called …") and line 1082 ("the theorem the earlier interface, AT8.5 and TopK T7.0 call …").

**Witness.** "Earlier interface" narrates a previous revision. The former-names paragraph (lines 518–542) already maps both names.

**Repair.** Delete both clauses.

## Verified sound

**Gate and build.**
- The worker's gate passes every check. My re-run without the pull request's folder list reports only `outside-folder=46`, exactly the 46 files of the five other folders this pull request owns.
- `lake env lean …/Suggested.lean` takes 21 s, with only the 22 expected `sorry` warnings.
- `#check @name` on all 52 declarations gives 0 errors, and the types match signatures.md. The two "looks dropped" leads are the abbrevs `relativeCWPushoutInclusion` and `relativeCWPushoutCarrier`, whose bodies need no `T2Space`; the theorems about them keep it.
- No `set_option`, no sorried data, a single `import Mathlib` plus 61 existing `TauCeti.*` modules.

**Dependency check.** `depcheck: 238 roadmaps, 2319 edges, 0 problem(s)`: no UPWARD or CYCLE line. The suppliers resolve:
- UniversalCovers (Completed);
- DifferentialGeometry Layer 2, 2.4, 5.1 and 10 on main;
- GeometricTopology 12.1 and Layer 11 at this head.

**Sampled locators (15, seed 94).** Fourteen match their text and pages as written. Hatcher 4.21 is R12.
- Hatcher 2.21, p. 119 (Hatcher line 5222);
- Hatcher Lemma 3.27, p. 236 (10255);
- Hatcher 4.18, p. 355 (15454);
- Hatcher 4.21, p. 356 (15508): see R12;
- Hatcher 4.32, p. 366 (15961);
- Hatcher 4.37, p. 371 (16124). It gives the claim through π′_n = π_n for simply connected A;
- Hatcher Lemma 4.31, p. 366 (15931);
- Hatcher Theorem 4.5, p. 346 (15109);
- Hatcher Example 0.6, p. 6 (453);
- Hatcher Proposition A.3, p. 522 (22617);
- Hatcher §3.G, p. 321;
- Brown 8.4.1 and 9.1.2 (brown lines 12849, 13039);
- Milnor 1959 Theorem 3 and Corollary 3 (milnor1959 lines 209, 218), including the "Theorem 4" misprint at line 221;
- Strøm Theorem 6, p. 135 (strom1972 line 181);
- FTW 4.2, 4.3 and 4.9 (ftw1973 lines 600, 610, 752).

**Headline locators outside the sample.** Hatcher 2.22 (5456), Hatcher Theorem 3.30 (10453), Hatcher Corollary 4.33 (16001) and Hatcher Proposition 4.13 (15375) all match. Hatcher 4.57 (17069) supports the statement but its description is wrong (R12).

**Native declarations opened at the pin.**
- `HomotopyGroup.hurewiczHom` (Hurewicz/Basic.lean 652): index n gives π_{n+1} → H_{n+1}. This matches the degree claims of `hurewicz_isoModSerre` and `ordinaryEMRepresentability`.
- `RelHomotopyGroup.hurewicz` and `bijective_hurewicz_of_subsingleton_homotopyGroup` (Relative.lean 199, 282).
- `TauCeti.lsCategoryCount` / `LSCategoricalCover` (LusternikSchnirelmann.lean 84, 264).
- `CWType` and `FiniteCWType` (both Hausdorff-ambient CW models).
- `HomologicalOrientation` and `fundamentalClass` (FundamentalClass.lean 204).
- `IsEilenbergMacLaneSpaceOne` (EilenbergMacLane/Basic.lean 123).
- `HasProperHomotopyInverse` (Proper.lean 41; it includes properness of f).
- `TopCat.singularCap` (front p-face cochain value times back q-face, Hatcher's convention, with the boundary sign (−1)^p as in the README Conventions).
- `t2Space_of_isPushout` (needs regularity, so `relativeCWPushout_t2Space` is not one tactic).
- 21 further README-cited natives found (e.g. `singularHomologyKunnethShortComplex`, `mul_comm_of_subsingleton`, `finiteCWType_addCircle`, `exists_isOpen_superset_lsCategoryCount_le_encard`).

**Statability.** Headlines not stated are named in the docstring. I confirmed that the pins have no compactly supported singular cohomology, which is the reason given for proper Whitehead.

**Ownership.** Checked against DGFloer (main and #1798), GeneralizedCohomology, TopologicalKTheory, ClassifyingSpaces (main and #1807/#1808/#1854), GeometricTopology, AlgebraicTopologyPartII #1694 and StableHomotopyKTheory #1227. The defects are R01–R04.

### Adversarial table

| Statement | Instances | Values (left / right) | Result |
| --- | --- | --- | --- |
| `ordinaryPairQuotientComparison` | B=∅; B=X; (D¹,S⁰) | H_n(X)/H̃_n(X₊)=H_n(X); 0/H̃_n(pt)=0; ℤ/H̃₁(S¹)=ℤ | true; generality R09 |
| `ordinaryPairQuotientCohomologyComparison` | (D²,S¹); B=∅ | ℤ/H̃²(S²)=ℤ; H^n(X)/H^n(X) | true |
| `relativeCWPushout_t2Space` | B=∅; B=Y; (D¹,S⁰)→pt | Z⊔Y T2; pushout≅Z T2; S¹ T2 | true |
| `relativeCWPushout_base_isClosedEmbedding` | one-term proof | closes; T2 unused | padding R06 |
| `homotopyInversePairExtension_left` | A=X; A=A′=∅; A=pt well-pointed | g=g₀,H=H₀; plain inverse exists; based inverse (Hatcher 0.19) | true; locator R10 |
| `exists_cwApproximation` | X=∅; X=ℚ; Warsaw circle | Z=∅; Z=ℚ discrete (π₀ bijective, πₖ=0); Z=pt | true; owner R01 |
| `compactSupportTopClass_exists` | m=0, K finite; K=∅ | ⊕_{x∈K}L_x ∋ (s(x)); c=0 | true |
| `compactSupportTopClass_unique` | m=0; ℝ, K=[0,1], L=ℤ | projections jointly injective; H₁(ℝ,ℝ∖K)=ℤ, each local map iso | true |
| `poincareDuality_zmodTwo` | RP²; 3 points (n=0); ∅ | ranks 1,1,1/1,1,1; (ℤ/2)³/(ℤ/2)³; 0/0 | true |
| `poincareDuality_int` | S¹; S¹⊔S¹; RP² | ℤ/ℤ in both degrees; ℤ²/ℤ²; no `o` exists (H⁰=ℤ, H₂=0) | true |
| `lsCupLength_add_one_le_categoryCount` | pt; Sⁿ; T²; RPⁿ mod 2; ∅ | 1≤1; 2≤2; 3≤3; n+1≤n+1; 1≤0 false, excluded by `Nonempty` | true |
| `relHurewicz_bijective_of_simplyConnected_subspace` | (D³,S²) n=0; (CP²,CP¹) n=1; extra component | π₃=ℤ/H₃=ℤ; π₄(CP²,S²)=ℤ/H₄=ℤ, π₂(CP²)=ℤ so native n/a; H_n gains summand, π_n not, so `PathConnectedSpace` needed | true |
| `homologicalWhitehead` | S²→S² deg 1; deg 2; acyclic non-simply-connected X→pt | h.e.; hyp fails (×2); excluded by simple connectivity | true |
| `HasProperHomotopyExtensionProperty.cylinderBoundary` | A=∅; A=X | (I×X,∂I×X); pair is all of I×X | true |
| `properStrongDeformationRetract_of_inverse` | A=X; A={0}⊂[0,∞) | r=id, H const (proper, I compact); constant inverse not proper, hyp fails | true |
| `compactManifoldFiniteCWType` | Sⁿ; n=0; ∅ | finite CW; finite discrete; empty complex | true; owner R02 |
| `compactManifoldWithBoundaryFiniteCWType` | Dⁿ; n=0 | finite CW; excluded by `NeZero` | true |
| `groupClassifyingSpace_isEMOne` | G=1; ℤ; ℤ/2 | point; ≃S¹; H₁=ℤ/2, H₂=0 (RP^∞) | true |
| `hurewicz_isoModSerre` | C=0, n=0; X=S², C=finite, n=0; n=1 | H₁=0, π₂≅H₂, π₃↠H₃; coker(ℤ→0)=0; π₂=ℤ∉C, vacuous | true; owner R01 |
| `ordinaryEMRepresentability` | A=0; A=ℤ, n=0, K=S¹; X=∅; −ι | [X,pt]=pt/0; [X,S¹]≅H¹, ⟨ι,loop⟩=1; one class/0; gives −1, excluded | true |
| `finiteSourceMappingCWType` | K=∅; K=X=S¹ | C(∅,X)=pt; LS¹≃S¹×ℤ | true |
| `basedLoopCWType` | S¹; S² | ΩS¹≃ℤ; ΩS² CW type (Milnor Cor. 3) | true |
| `ordinaryPairQuotient` (Checks) | B=∅; B=X; D⁰/∅ | X₊ (collapse-only model loses ℤ in H̃₀); point; S⁰ | sound |
| `LocallyRepresentedTopSection` (Checks) | ℝ with sign flip at 0 | not represented | sound |
| `lsCupLength` | degree-0 factor | excluded by `hd`/`hq` (else 1=1⌣1 nonzero, infinite length) | sound |
| `OrdinaryEMModel` (Checks) | S² for (ℤ,2); 2 points | π₃(S²)=ℤ, rejected; not path connected, rejected | sound |
| `SatisfiesSerreAxioms` (Checks) | 0; torsion; finite; fixed dᵐ | axioms hold; extension ℤ/dᵐ→ℤ/d²ᵐ→ℤ/dᵐ leaves the class | sound |
| Conventions | simplex v₀=−Σeᵢ; linking sign; χ; RP² twisted | barycentre 0, det(I+J)=1+m>0; n=3,i=1: (−1)⁴=+1 symmetric; χ(Sⁿ)=1+(−1)ⁿ, χ(CPⁿ)=n+1; δ⁰=±2, δ¹=0 gives H⁰=0, H¹=ℤ/2, H²=ℤ = H₂, H₁, H₀(RP²;ℤ) | sound |
| `capProduct` sign | native vs README | front face p, ∂(c⌢φ)=(−1)^k(∂c⌢φ−c⌢δφ) agree | sound; Checks R11 |

## Not verifiable

- Serre 1953, Chapter III, Theorem 1 (`hurewicz_isoModSerre`) is settled as uncertified in the manifest. It is cited by locator only; I did not read it.
- May 1967 (Stages 4.7 and 8.2): the cached scan is image-only and OCR is unavailable here. Not used for any finding.
- tom Dieck 9.5.1, Freedman–Quinn §7.7, Milnor 1963 Lemmas 3.6–3.7, Weibel 5.5.1/5.5.10 and Lee are settled as uncertified and were not read.

## Source issues

- **Misprint** in milnor1959 at the proof of Corollary 3, p. 276: the source says Theorem 4 gives the triad's CW homotopy type; it should be Theorem 3, since the paper has no Theorem 4; affects nothing.
