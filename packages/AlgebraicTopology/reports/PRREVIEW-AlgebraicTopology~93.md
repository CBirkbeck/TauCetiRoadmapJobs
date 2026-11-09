# Review of AlgebraicTopology (pull request #1807 at e444d15)

**Verdict:** needs changes

This is an incremental re-review. No line of `TauCetiRoadmap/AlgebraicTopology/` has changed since 64a16e1. The two commits since then change four files, all outside this folder:

- `TauCetiRoadmap/AlgebraicCurves/README.md` and its `Suggested.lean`;
- `TauCetiRoadmap/RigidAnalyticGeometry/README.md` and its `Suggested.lean`.

Neither roadmap cites AlgebraicTopology, before or after the change, and this README cites neither of them. The lines they add name none of this roadmap's objects. So no passage of this roadmap changed or was made wrong, and this round has no new finding.

All 14 findings of the previous review (r84) are still open, and each is written again below with the same number. Every witness was re-read at this head or at the current copy of the sibling it cites.

The gate fails as it did at 64a16e1:

- `depcheck=2`: an UPWARD edge and a CYCLE, both through HomotopySpheres;
- `build=1`, `set_option=1`, `sorry-data=69`, `statement-hygiene=22`;
- `dropped=12`, `readme-ids-missing=2`, `tex=1`.

## R01 (P1) — The dependency cycle through HomotopySpheres is not cut

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md`:

- line 126: "owns the compact-generation coreflection and CW comparison consumed by" 4.5's kified CW product, 8.10 and 8.11a/b (the sentence starts at 125 with HomotopySpheres §3A.1);
- line 783: "single k coreflection/CW compact-generation API of HomotopySpheres §3A.1";
- table rows 2411, 2429 and 2430;
- prose lines 123, 581, 636, 1864, 2265, 2304 and 2367.

**Claim.** Stages 4.5, 8.10 and 8.11a/b consume two things from HomotopySpheres §3A: the coreflection k, and the pointed suspension–loop adjunction. HomotopySpheres is on the never-cite list.

**Witness.**

- The dependency check, run today, prints `UPWARD: AlgebraicTopology (on main) -> HomotopySpheres (#45) at README lines [2411, 2429, 2430]` and `CYCLE among: AlgebraicTopology, HomotopySpheres, IndexTheory, StringOrientation, TangentialBordism`.
- The gate reports `dropped=12` on these lines.
- CharacteristicClasses in this pull request (lines 25–27 and 436, unchanged) consumes "AlgebraicTopology Stage 4.5's compact-generation coreflection k". This README says it does not own k.

**Repair.**

- Own k in Stage 4.5, together with its CW and locally-compact product comparisons. Define it as `TopologicalSpace.compactlyGenerated`, the right adjoint of the inclusion of Mathlib's `CompactlyGenerated`, with counit the identity on points.
- Own the based suspension–loop adjunction on 8.11b's fixed-interval loops.
- Delete every HomotopySpheres mention, including the consumer clauses.

Tested: #1854's AlgebraicTopology README does exactly this (lines 139–144: "Stage 4.5 owns the compact-generation interface: the coreflection k from `TopologicalSpace.compactlyGenerated` …"). The dependency check on a scratch copy of it prints `depcheck: 238 roadmaps, 2320 edges, 0 problem(s)` today.

## R02 (P1) — The gate's build check fails on a non-`sorry` warning

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` line 486: `noncomputable def chartAt [IsManifold I ∞ M] :`.

**Witness.** `lake env lean` today exits 0 in 22 s with 215 `declaration uses sorry` warnings and one other warning: `486:18: warning: Overlapping instance parameters in chartAt: … There are 2 [IsManifold I ∞ M] instances; one is sufficient.`

**Repair.** Drop the duplicate binder. The declaration is sorry'd data, so R05's repair deletes it in any case.

## R03 (P2) — Two owners: DGFloer still owns what this pull request moves here, and consumers still cite DGFloer

**Location.** README 102–122 ("The ordinary Serre and Eilenberg–MacLane machinery is owned here … DGFloer Layer 1 consumes these ordinary targets"), 907–910, 1146–1147 and 1911–1917.

**Witness.** Each line below was re-read today.

- **DGFloer on main (e7bcd5e), lines 231–232.** Item 2 "owns the multiplicative/local-pairing construction …; AlgebraicTopology Stage 5.5 and GeneralizedCohomology consume these targets".
- **DGFloer at #1798's head (3166898).**
  - Line 153: "AlgebraicTopology Stage 5.5 consumes the same Serre-fibration predicate".
  - Lines 1048–1049: "Own … the spectral sequence consumed by AlgebraicTopology Stage 5.5".
- **ReductiveGroups 2111, in this pull request:** "[DGFloer Layer1.2]'s based fiber sequence".
- **Consumers on main.** MorseNovikov 161, MorseTheory 885, RiemannianGeometry 786, SmoothBundlesConnections 59 and HeegaardFloer 1137 all cite DGFloer Layer 1.
- **StableHomotopyKTheory at #1227.** Its supplier list ("DGFloer, Layer 1 items 1–4, supplies degree-one Hurewicz, CW approximation, …") and its §3.34 ("Use DGFloer Layer 1 item 4's Serre-class carrier").
- **AlgebraicTopologyPartII at #1694.**
  - Line 12: "DGFloer Layer 1 item 2 owns CW approximation, the fibration homotopy exact sequence …".
  - Line 13 names StableHomotopyKTheory §§3.36–3.37 as owner of Hurewicz modulo Serre classes, which is this README's 8.8d.

**Repair.**

- In #1798, make DGFloer Layer 1 items 1–4 cite Stages 4.8, 5.0, 5.5, 8.3, 8.8c and 8.8d, and make its lines 153 and 1048–1049 state this README's direction.
- Repoint ReductiveGroups 2111 to Stage 5.5 in this pull request.
- Repoint the five consumers on main in a follow-up that the description names.
- State the order of this pull request and #1798 in both descriptions.
- Settle 8.8d against StableHomotopyKTheory §3.36: either that roadmap cites 8.8d, or this one cites it.

## R04 (P2) — This roadmap and CharacteristicClasses still supply each other

**Location.**

- README 1393: "Stage4 cellular data, ordinary6.1–6.2, and CC C1.2a's S0–S4 interfaces";
- README 1970: "Consume CC C1.2a's generic compact-relative support diagram";
- table rows 2419 and 2422.

**Witness.** CharacteristicClasses at this head is unchanged since e473a36:

- lines 64–66: "C1.5a's Eilenberg–MacLane identification … consumes AT8.5";
- lines 71–72: "The separate AT supported-cellular supplement consumes C1.2a S0–S4".

That gives the cycle AT 8.5 → CC C1.2a → AT supplement. The dependency check misses it because it does not resolve the abbreviation "CC".

**Repair.** State S0–S4 here as targets of the supported-cellular supplement after 6.2, and let CharacteristicClasses C1.2a consume them. The targets are:

- compactly supported local-coefficient cochains as a support colimit, with enlargement and cofinality;
- proper pullback;
- open extension;
- jointly proper homotopy invariance.

Tested: #1854's README line 162 reads "CharacteristicClasses C1.2a consumes the compactly …", and its dependency check prints 0 problems.

## R05 (P2) — `Suggested.lean` is an API catalogue with 69 sorry'd data bodies and a `set_option`

**Location.** `Suggested.lean`:

- the module docstring, lines 26–32: "not exhaustive … suggest Lean forms for load-bearing interfaces";
- line 910: `set_option maxHeartbeats 800000 in`;
- the sorry'd `def`s, among them line 160 `cellularToSingular`, 955 `poincareDualityMap`, 1112 `relativeHurewicz`, 1640 `absoluteHurewicz` and 1802 `relativeObstructionCochain`.

**Witness.**

- The gate, re-run today, reports `sorry-data=69`, `set_option=1` and `statement-hygiene=22`.
- Several headlines are stated about sorry'd maps, so they cannot be refuted: `poincareDualityMap_isIso` (963), `relativeHurewicz_isIso` (1133) and `ordinaryEMRepresentability` (1712).
- `relativeObstructionCochain` lost `[SimplyConnectedSpace Y]`. The worker's signatures transcript is unchanged and flags the same 10 declarations.

**Repair.** Replace the file by the acceptance test:

- `import Mathlib` and the `TauCeti.*` modules it uses;
- a docstring that lists the headline theorems, and those not statable at the pins with what each lacks;
- the headlines stated on native carriers (`HomotopyGroup.hurewiczHom`, `RelHomotopyGroup.hurewicz`, `TopCat.singularCap`);
- no sorry'd data and no `set_option`.

#1854's head carries such a file: 772 lines, with the docstring paragraph "Headline theorems not statable at the pins, and what each lacks" (its line 111) and no `set_option`. Bring it here, or merge after #1854 and say so.

## R06 (P2) — The headlines this pull request adds are statable but absent

**Location.**

- README 41: "Relative homotopy groups, Hurewicz, Hurewicz modulo a Serre class, Whitehead …";
- README 899–902: CW approximation of every space and every pair;
- README 2176–2180: 8.8d.

`Suggested.lean` states none of these, and its docstring names no headline.

**Witness.** Everything both statements need is at the pins:

- `HomotopyGroup.hurewiczHom` (Tau Ceti `Homotopy/Hurewicz/Basic.lean` 652);
- `ObjectProperty.IsSerreClass` (Mathlib `CategoryTheory/Abelian/SerreClass/Basic.lean` 45, re-opened today);
- `TopCat.CWComplex` and `ContinuousMap.IsWeakHomotopyEquivalence`.

#1854's head states both: `exists_cwApproximation` (its line 352) and `hurewicz_isCIso` (683), both re-read today.

**Repair.** In the R05 rewrite, state:

- `exists_cwApproximation` for arbitrary X;
- `hurewicz_isCIso`, with these hypotheses:
  - X simply connected;
  - `[C.IsSerreClass]`, together with Serre's axioms as a hypothesis structure;
  - `π_i X ∈ C` for `1 ≤ i < n`.

Name the Serre spectral sequences and the fibration boundary map in the docstring as not statable, each with its missing carrier.

## R07 (P2) — The roadmap owns objects the pinned Tau Ceti proves, and its degree-one Hurewicz sign contradicts the native map

**Location.** README 1911–1917 ("own the degree-one Hurewicz theorem: … sending a loop to its positively oriented singular", 1911–1913), 825–831, 899–907, 1049–1061 and 2162–2171.

**Witness (sign).** The pinned `HomotopyGroup.hurewiczHom_hom_one_eq_neg_hurewicz₁` (`Hurewicz/One/Comparison.lean` 160, re-opened today) says the native degree-one Hurewicz map is *minus* the loop class. The README's normalisation gives plus.

**Witness (duplicates at the pin).** The pin already has:

- `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv` (`Hurewicz/One/Basic.lean` 705, re-opened today);
- `TauCeti.ComplexProjectiveSpace.cwComplex` (`Classical/ComplexProjective.lean` 419);
- `exists_homotopicRel_range_subset` (`Classical/Compression.lean` 63);
- `isIso_singularHomologyMap` (`WeakHomotopyEquivalence.lean` 110);
- CW approximation (`CWApproximation/Basic.lean` 336);
- `IsHurewiczFibration` (`HurewiczFibration/Basic.lean` 58);
- `AddCommGrpCat.isTorsion` (`SerreClass/Torsion.lean` 41);
- the finite K(A,1) axiom (`ClassifyingSpace/Torsion.lean` 66).

`lake-manifest.json` has not changed since these were opened.

**Repair.** Consume these native declarations by name. Keep as targets only what the pins lack:

- the comparison of the 8.3 map with `hurewiczHom`, with sign −1 in degree one;
- `ComplexProjectiveSpace n ≃ₜ Projectivization ℂ (Fin (n+1) → ℂ)`;
- CW approximation of arbitrary spaces and pairs;
- the cohomology and pair forms of the weak-equivalence comparison;
- the fibration long exact sequence;
- the bar-model K(A,1) transport.

#1854's README consumes `hurewiczHomologyAddEquiv` at lines 316, 470 and 2283.

## R08 (P3) — The roadmap still plans and states what the pins prove

**Location.**

- README 407–431: "Own the single generic no-retraction and finite-dimensional Brouwer theorem";
- README 686–690 and 756–761;
- `Suggested.lean` lines 2439, 2444, 2486, 2492, 2499, 2576 and 2645.

**Witness.** The file is unchanged since r64. r64's `exact` probe closes these seven declarations from native lemmas. For example, `noRetraction_diskBoundary` closes by `TauCeti.noRetraction_diskBoundary` (`Singular/BrouwerFixedPoint.lean` 71, re-opened today).

**Repair.**

- Delete the seven declarations from `Suggested.lean`.
- At those README places, consume the native names and files: `wang_exact₁`, `singularTransfer`, `relCWComplexCylinder`, `RealProjectiveSpace.cwComplex` and the others r64 lists.
- Keep as targets only the local-coefficient, relative or bar-model extensions that the native files lack.

## R09 (P3) — Backticked names of the roadmap's own that nothing declares, and a consumer cites one

**Location.** README names that no `.lean` file of this folder declares:

- 392 `coordinateCubeReferenceChain_eq_shuffle`;
- 698 `cofibrationTowerHomotopyEquivalence`;
- 756 `basedHomotopyInverseOfEquivalence`;
- 767 `cwProductKelley`;
- 859 `standardCellBallToOrderedSimplex`;
- 984 `isQuotientCoveringMap_iff_isCoveringMap_and`;
- 1880 `kanCubicalHomotopyComparison`;
- 2056 `groupCohomologyCup`;
- and the others r64 lists.

**Witness.**

- The gate, re-run today, reports `readme-ids-missing=2`: lines 392 and 984 above.
- `isQuotientCoveringMap_iff_isCoveringMap_and` is Mathlib's (`Topology/Covering/Quotient.lean` 339, re-opened today), but the README writes it as if it were this roadmap's own.
- TopologicalKTheory T1.6d, in this pull request at line 836 (unchanged), cites "AT4.5's `cofibrationTowerHomotopyEquivalence`". `grep` finds that name in none of the eight `.lean` files of this folder.

**Repair.**

- State each such fact in prose without the name, or declare the name in `Suggested.lean` if it is a headline.
- The tower equivalence is not a headline: call it "Stage 4.5's cofibration-tower homotopy equivalence" here, and have TopologicalKTheory 836 cite it the same way.
- Attribute the Mathlib lemma to Mathlib, with its file.

## R10 (P3) — TeX outside a code span

**Location.** README line 1400: "Construct C_c^{cell,n}(X,A;ℤ) as the direct sum …".

**Witness.** The gate reports `tex=1` at this line.

**Repair.** Put it in a code span: `` `C_c^(cell,n)(X,A;ℤ)` ``.

## R11 (P3) — Locators and References for the newly cited theorems

**Location.**

- README 907: "equivalence (Hatcher 4.18)";
- README 902: "(Hatcher 4.13), with the n-connected CW-model and n-connected-pair forms";
- README 2177: "Serre 1953, Theorem 1";
- README 689: "(Strøm's product theorem)";
- References, lines 2500–2521.

**Witness.** Re-read today:

- hatcher line 15476 is Corollary 4.19, uniqueness of n-connected CW models up to homotopy equivalence rel A. Proposition 4.18 (line 15454) is about maps between models.
- strom1972 line 181 is Theorem 6, the product of cofibered pairs with A closed.
- Serre 1953 restarts its theorem numbering in each chapter, so "Theorem 1" does not locate the result.
- The References list none of tom Dieck 2008, Serre 1953, Strøm 1972, Farrell–Taylor–Wagoner 1973 or Milnor 1963.

**Repair.**

- Cite Corollary 4.19, and Example 4.14 with Proposition 4.15.
- Write "Serre 1953, Chapter III, Theorem 1" and "Strøm 1972, Theorem 6".
- Add the missing works to the References, together with Hatcher Sections 2.A, 4.2 and the Appendix.

## R12 (P3) — Vocabulary and internal-order slips in the 8.8c/8.8d and 4.5 text

**Location.**

- README 2162–2164: "A Serre class is a class of abelian groups closed under subgroups, quotients and extensions and satisfying Serre's axioms for ⊗, Tor and …";
- README 2177–2178: "if π_i(X)∈C for i<n";
- README 2116 ("uses only 8.1–8.8b") against 116–117 ("uses only 8.1–8.8a");
- README 791, inside item 4.5: "Prove it on Stage 4.7's realization CW structures".

**Witness.**

- Mathlib's `ObjectProperty.IsSerreClass` (45) means only the closure properties. The README gives that name to a stronger notion.
- π₀ is not a group, so `i < n` cannot start at 0.
- The two input lists for 8.8c disagree.
- Item 4.5 consumes the later item 4.7.

**Repair.**

- Keep "Serre class" for Mathlib's notion, and state Serre's axioms separately (#1854's `SatisfiesSerreAxioms`).
- Write `1 ≤ i < n`.
- Make the two 8.8c input lists agree.
- Either move the realization-product comparison after 4.7, or say that it consumes 4.7.

## R13 (P3) — The description orders none of the other open pull requests that change this folder, and makes false claims

**Location.** The description's merge-order paragraph ("No open pull request must merge before this one") and its list of changes.

**Witness.**

- **Order.** The overlap index of today lists #1187, #1652, #1663, #1797, #1808 and #1854 as also changing this folder. #1652, #1663, #1797 and #1808 conflict with this pull request in `TauCetiRoadmap/AlgebraicTopology/README.md`. The description orders none of them.
- **Folders.** The list of changes claims rewrites in ArithmeticDirichletSeries and SymplecticGeometry, but `git diff --name-only origin/main...HEAD` touches neither.
- **Loops.** The description says every loop but one is cut, but R01's cycle remains.
- **`Suggested.lean`.** "No Suggested.lean changes" is false: the diff changes eight `Suggested.lean` files. AlgebraicCurves' changed again at e444d15 (125 lines) and RigidAnalyticGeometry's at 62d686c (139 lines).

**Repair.**

- State which of these pull requests is rebased on which, in particular this one against #1854.
- Correct the list of changes, the loop count and the `Suggested.lean` sentence.

## R14 (P3) — Stage 4.6 still says ComplexKahlerGeometry K7 consumes its projective topology, which K7 takes from the pin

**Location.** README 829–831: "onto ℂPᵏ⁻¹. ComplexKahlerGeometry K7 consumes that topology and this cell structure."

- "That topology" is the one item 4.6 owns at 822: "Own #44117's generic quotient topology on native `Projectivization 𝕜 V`".
- Lines 285–288 call that interface "absent".

**Claim.** ComplexKahlerGeometry K7 consumes only Stage 4.6's CW structure. The topology is at the pin.

**Witness.**

- **ComplexKahlerGeometry at this head (unchanged since 64a16e1).**
  - Lines 2190–2193 use "the pinned quotient topology … `Projectivization.instTopologicalSpace` … on which AlgebraicTopology Stage 4.6 builds the CW structure".
  - Line 2228 needs "AlgebraicTopology Stage 4.6 (the CW structure)".
- **Mathlib at the pin.** `Topology/Algebra/Projectivization.lean`, re-opened today, has:
  - `instTopologicalSpace` (44);
  - `isQuotientMap_mk'` (47);
  - `isOpenQuotientMap_mk'` (83);
  - the rest of the quotient-map API between those lines.

**Repair.**

- At 829–831 write "ComplexKahlerGeometry K7 consumes this cell structure", and at 1821 write "Stage 4.6's cell structure on the native carrier".
- In 4.6 (822–824), consume Mathlib's `Projectivization.instTopologicalSpace` and its quotient-map API by name and file, instead of owning them.
- Delete the mathlib4#44117 bullet at 280–288: its whole interface is at the pin.

Tested on the refuting instance: with these edits, both consumer sentences of Stage 4.6 (830 and 1821) agree with ComplexKahlerGeometry 2190–2193, 2228 and 2249. ComplexKahlerGeometry's own supplier contract at line 405 still lists "Stage 4.6: the quotient topology". That line is for its own review.

## Previous findings

- R01 — not repaired: README 125–126 still has HomotopySpheres §3A.1 owning "the compact-generation coreflection and CW comparison". The dependency check prints the same UPWARD and CYCLE. CharacteristicClasses 25–27 and 436 cite Stage 4.5 for k.
- R02 — not repaired: `Suggested.lean` 486, `noncomputable def chartAt [IsManifold I ∞ M] :`, still has two `[IsManifold I ∞ M]` binders. The linter warning was reproduced today.
- R03 — not repaired: DGFloer on main 231–232 and at #1798 (3166898) 153 and 1048–1049 still own the Serre machinery. ReductiveGroups 2111 still cites "DGFloer Layer1.2's based fiber sequence".
- R04 — not repaired: README 1393 still reads "CC C1.2a's S0–S4 interfaces". CharacteristicClasses 64–66 and 71–72 are unchanged.
- R05 — not repaired: `Suggested.lean` is byte-identical: `sorry-data=69`, `set_option` at 910, `statement-hygiene=22`.
- R06 — not repaired: `Suggested.lean` has no `hurewicz_isCIso` or `exists_cwApproximation`, and its docstring (26–32) names no headline.
- R07 — not repaired: README 1911–1913 still sends "a loop to its positively oriented singular" circle class. The native map is its negative.
- R08 — not repaired: README 407 still reads "Own the single generic no-retraction and finite-dimensional Brouwer". `Suggested.lean` 2439–2645 is unchanged.
- R09 — not repaired: the names at README 392, 698 and 984 are unchanged, the gate reports `readme-ids-missing=2`, and TopologicalKTheory 836 still cites the undeclared `cofibrationTowerHomotopyEquivalence`.
- R10 — not repaired: README 1400 still reads "Construct C_c^{cell,n}(X,A;ℤ) as the direct sum"; the gate reports `tex=1`.
- R11 — not repaired: README 907 still reads "equivalence (Hatcher 4.18)". References 2500–2521 are unchanged.
- R12 — not repaired: README 2162–2164, 2177–2178 ("π_i(X)∈C for i<n"), 2116 against 116–117, and 791 are unchanged.
- R13 — not repaired: the merge-order paragraph is unchanged. "No Suggested.lean changes" is still false: eight files, and AlgebraicCurves' and RigidAnalyticGeometry's changed again this round.
- R14 — not repaired: README 830 still says "ComplexKahlerGeometry K7 consumes that topology and this cell" structure, and 822 still owns the #44117 quotient topology.

## Verified sound

**The change.**

- `git diff --stat 64a16e11 e444d155` lists four files:
  - AlgebraicCurves: README (4257 lines) and `Suggested.lean` (125);
  - RigidAnalyticGeometry: README (1324) and `Suggested.lean` (139).
- None of them is in this folder, `lake-manifest.json` or `lean-toolchain`.
- `grep -i AlgebraicTopology` finds 0 hits in all four files, at both 64a16e1 and e444d15, and 0 hits in the added or removed lines of their diff.
- This README and its `.lean` files name neither AlgebraicCurves nor RigidAnalyticGeometry.
- The added lines of that diff mention none of: singular homology, fundamental group, CW, covering space, Euler characteristic, homotopy, Hurewicz, Poincaré duality, orientation, simplicial. So the change creates no second owner of an object of this roadmap.

**Gate, dependency check, elaboration at e444d15.**

- **Gate.** Re-run with the brief's command, without the build step. Its counts match the worker's `gate.md` line for line: `set_option=1 tex=1 sorry-data=69 statement-hygiene=22 dropped=12 readme-ids-missing=2 depcheck=2`.
  - It also reports `outside-folder=21`. Those 21 files lie in the 13 folders the brief names as the pull request's own: two each in AlgebraicCurves, BordismFormalGroups, CharacteristicClasses, ClassifyingSpaces, ComplexKahlerGeometry, PadicFunctionalAnalysis, RigidAnalyticGeometry and TopologicalKTheory, and one each in GeneralizedCohomology, LocalPurity, PurityOfBranchLocus, ReductiveGroups and SchemeAndStackFoundations.
  - The diff that excludes those folders and this one is empty. Stray files: 0.
- **Dependency check.** Output, verbatim:

  ```text
  UPWARD: AlgebraicTopology (on main) -> HomotopySpheres (#45) at README lines [2411, 2429, 2430]
  CYCLE among: AlgebraicTopology, HomotopySpheres, IndexTheory, StringOrientation, TangentialBordism
  depcheck: 238 roadmaps, 2321 edges, 2 problem(s)
  ```

  A scratch copy of #1854's AlgebraicTopology README prints `238 roadmaps, 2320 edges, 0 problem(s)`.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 22 s, with 215 `declaration uses sorry` warnings and the one linter warning of R02.
- **Elaborated signatures.** The worker's transcript (362 declarations; the same 10 flagged, the `FreshInteriorRechart` data and `relativeObstructionCochain`) is the same as last round. I did not re-run `#check`, because the file is byte-identical.
- **Padding probes.** r64's probes stand, since the file is unchanged: the one-tactic probe closes no body, and the `exact` probe closes seven (R08).

**Seeded sample.** With 0 changed lines, none of the 15 sampled targets falls in a changed passage, so r64's verification of them stands:

- Hatcher 4.13, 4.6, 4.18, 2A.1, 4.30, 4.31, A.3, A.6, 0.19, 2.21, 3.27, 3.29 and 3.43;
- Milnor 1959, Theorem 3;
- FTW 1973, Theorem 4.2, Lemma 4.3 and Corollary 4.9.

I re-read the two that R11 touches: hatcher lines 15454 (Proposition 4.18) and 15476 (Corollary 4.19), and strom1972 line 181 (Theorem 6). The README flags no locator as unverified.

**Cross-roadmap witnesses re-read at their current copies.**

- **This pull request.**
  - CharacteristicClasses 25–27, 64–73 and 436;
  - ReductiveGroups 2111;
  - TopologicalKTheory 836;
  - ComplexKahlerGeometry 82, 405, 2190–2193, 2228, 2249 and 2282.
  - Each is unchanged since 64a16e1.
- **Main (e7bcd5e).**
  - DGFloer 229–232;
  - MorseNovikov 161, MorseTheory 885, RiemannianGeometry 786, SmoothBundlesConnections 59 and HeegaardFloer 1137.
- **Open heads.**
  - DGFloer at #1798 (3166898): 153 and 1048–1049.
  - StableHomotopyKTheory at #1227: its supplier list and §3.34, through `roadmaps show`.
  - AlgebraicTopologyPartII at #1694: 10–13.
  - AlgebraicTopology at #1854, through `roadmaps show`:
    - README lines 139–144 (k), 162 (S0–S4 to CharacteristicClasses), 316, 470 and 2283 (`hurewiczHomologyAddEquiv`);
    - `Suggested.lean` lines 111, 352 and 683.

**Library declarations re-opened at the pins.**

- Tau Ceti:
  - `HomotopyGroup.hurewiczHom_hom_one_eq_neg_hurewicz₁` (`AlgebraicTopology/Homotopy/Hurewicz/One/Comparison.lean` 160);
  - `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv` (`…/Hurewicz/One/Basic.lean` 705);
  - `TauCeti.noRetraction_diskBoundary` (`AlgebraicTopology/Singular/BrouwerFixedPoint.lean` 71).
- Mathlib:
  - `ObjectProperty.IsSerreClass` (`CategoryTheory/Abelian/SerreClass/Basic.lean` 45);
  - `isQuotientCoveringMap_iff_isCoveringMap_and` (`Topology/Covering/Quotient.lean` 339);
  - `Projectivization.instTopologicalSpace`, `isQuotientMap_mk'` and `isOpenQuotientMap_mk'` (`Topology/Algebra/Projectivization.lean` 44, 47, 83).

**Adversarial table.** No statement of this folder changed, and the changed files state nothing that this roadmap consumes or supplies, so there is no new row. The rows below are carried from r84, which carried r74's and r64's computed values.

| statement (README or Lean line) | instances | values each side | result |
| --- | --- | --- | --- |
| 4.6 CPⁿ cells (826–830), r64 | n = 0, 1, 2 | {e⁰}; e⁰ ∪ e² = S²; e⁰ ∪ e² ∪ e⁴. Native `nat_card_cell_cwComplex` gives 1 iff m even and m ≤ 2n | correct; native (R07) |
| 7 χ(CPⁿ) = n+1 (1819), r64 | n = 0, 1, 2 | 1 = 1; 2 = χ(S²); 3 = 1+1+1 | correct |
| 8.3 degree-one Hurewicz (1911), r64 | S¹; S¹∨S¹; S¹⊔pt | ℤ ≅ ℤ; ℤ² ≅ ℤ² with aba⁻¹b⁻¹ ↦ 0; π₁ = 0 but H₁ = ℤ | path-connected hypothesis needed and present |
| 8.3 sign (1913), r64 | loop t ↦ e^{2πit} | README h: +[γ]; native `hurewiczHom`: −[γ] | opposite signs (R07) |
| 4.8 connected-map comparison (888–893), r64 | pt⊔pt → pt; S¹ → pt | H₀: ℤ² → ℤ onto; H₁: ℤ → 0 onto | as stated |
| 4.8 weak equivalences (893–897), r64 | Warsaw circle → pt | π_* bijective; H_* equal | as stated; native |
| 4.8 compression (903–904), r64 | (D¹,S⁰) → (S¹,pt), degree 1 | π₁(S¹) = ℤ, not 1-connected; no compression | hypothesis needed |
| 4.8 CW approximation (899–902), r64 | ∅; two points; Warsaw circle | ∅; two 0-cells; a point, weak but not homotopy equivalence | as stated |
| 5.0 homological reindexing (946–947), r64 | (0,0); (2,1) | (1,−1), degree 0; (−4,1), degree −3 | agrees |
| 5.0 cohomological reindexing (949–950), r64 | (0,0); (1,2) | (1,−1), degree 0; (5,−2), degree 3 | agrees |
| 5.0 lower bound (932–933), r64 | F_p C = C for all p | E¹ = 0 but H(C) ≠ 0 | hypothesis needed and present |
| 5.5 homological Serre (1062–1072), r64 | Hopf S¹ → S³ → S² | E² = ℤ at (0,0), (2,0), (0,1), (2,1); d² an isomorphism | consistent |
| 5.5 cohomological finiteness (1078–1080), r64 | CP^∞, id | H^{2k}(CP^∞) → H^{2k}(CP^k) injective | as stated |
| 5.5 E₂ sign (−1)^{qp′} (1120–1122), r64 | q = 0; p′ = 0 | +1; +1 | agrees |
| 5.5 Leibniz (1124), r64 | Hopf, d₂x = a | d₂(ax) = a² = 0 | consistent |
| 5.5 weakly contractible fibres (1044–1047), r64 | ℝ → S¹; ∅ → pt | fibre ℤ; empty fibre, π₀ not onto | nonemptiness needed and present |
| 5.5 mapping-path fibre (1055–1060), r64 | f = id; pt → X | contractible; `Path x₀ x` | as stated; native |
| 8.8c models (2102–2107), r64 | A = ℤ, n = 1, 2 | S¹ with π₁ = ℤ; π₂ = ℤ, others 0 | as stated |
| 8.8c colimit counterexample (2121), r64 | S¹ →(z²) S¹ → ⋯ | ℝ/ℤ[1/2] dense, so the topology is indiscrete | correct |
| 8.8c ΩK(A,n) ≃ K(A,n−1) (2155), r64 | n = 2; n = 1 | ΩCP^∞ ≃ S¹; ΩS¹ ≃ ℤ, disconnected | n ≥ 2 needed and present |
| 8.8d torsion ⇔ ⊗ℚ = 0 (2165), r64 | ℚ/ℤ; ℤ | 0; ℚ | holds |
| 8.8d fixed dᵐ (2166–2168), r64 | d = 2; d = 1 | ℤ/2 → ℤ/4 → ℤ/2, not closed under extensions; {0} | d ≥ 2 needed and present |
| 8.8d K(A,1) axiom (2168–2171), r64 | ℤ/2 | H̃_odd(RP^∞) = ℤ/2, killed by 2 | as stated; native |
| 8.8d Hurewicz mod C (2176–2180), r64 | C = torsion; S² with n = 2; S³ with n = 3 | h₂ an isomorphism, h₃: ℤ → 0 a C-epimorphism; h₃ an isomorphism, h₄: ℤ/2 → 0 | as stated; i starts at 1 (R12) |
| 8.12 circle (2376–2383), r64 | bar edge +1 | degree +1 loop; π₁ = ℤ on both sides | as stated |
| 4.5 realization product (787–800), r64 | Δ[0]×Δ[0]; Δ[1]×Δ[1] | a point; I² with two shuffle 2-simplices | as stated |
| `relativeHurewicz_isIso` (Lean 1133), r64 | (D³,S²); (D²,S¹) | π₃ = ℤ = H₃; S¹ excluded | hypotheses right; carrier sorry'd (R05) |
| `homologicalWhitehead` (Lean 1214), r64 | Poincaré sphere → S³ | H_* isomorphic, π₁ ≠ 0 | hypothesis needed and present |
| `noRetraction_diskBoundary` (Lean 2439), r64 | n = 0; n = 1 | ∂D⁰ = ∅; S⁰ is not a retract of [−1,1] | true; native (R08) |
| `closedCofibrationCylinderHomotopyExtension` (Lean 2645), r64 | A = ∅; A = X | {0,1}×X; I×X | native (R08) |
| 4.5 kified product (797–798), r74 | ℝ×ℝ; ℚ×ℚ | k(ℝ²) = ℝ², since ℝ is locally compact; ℚ² is first countable so k(ℚ²) = ℚ², although neither factor is locally compact | a sufficient condition, stated as such; owner of k unresolved (R01) |
| 4.5 tower equivalence (698–708), r84 | constant tower X_n = X with f_n = id; Dⁿ ⊂ Dⁿ⁺¹ → pt; levelwise identities with bonding maps homotopic through a path in SO(2n+2) | colim id = id_X; D^∞ → pt with D^∞ contractible; the telescope map is an equivalence by 706–708, the raw colimit map needs strict squares (708) | supports the consumer's use; name undeclared (R09) |
| 5.5 based homotopy sequence (1035–1043), r84 | i = 0, V(ℝ^∞) → BO(1); i = 0, SO; i = 1, O | π₁(BO(1)) = ℤ/2 = π₀(O(1)) = {±1}; π₁(BSO) = 0 = π₀(SO); π₂(BO) = ℤ/2 = π₁(O) | at i = 0, pointed exactness gives only the trivial kernel; the bijection needs the component action owned at 1041–1043; consistent |
| 4.6 projective quotient topology (822–824), r84 | V = 0; V = ℝ²; K = ℍ, V = ℍ² | ℙ K 0 = ∅ on both sides; ℙ¹(ℝ) ≅ S¹, coinduced from ℝ²∖0 on both sides; division rings allowed on both sides | the same object as Mathlib's `instTopologicalSpace` (44); owned twice (R14) |

**Overlaps.** The overlap index (main 39d3d60; open heads as of 2026-11-09T05:16:54Z) lists:

- no ids this README cites that an open pull request drops;
- no ids that only an open revision defines;
- no ids of this roadmap that this pull request drops;
- six pull requests that change this folder (R13);
- as closest in vocabulary: CharacteristicClasses at #1808 and #1854 (R04), StableHomotopyKTheory at #1227 (R03), HomotopySpheres at #1287 (R01) and DGFloer at #963 (R03).

**Ownership against open work.** This round adds no object. The checks behind R01, R03, R04 and R14 used:

- the sibling checkouts for #1798 and #1694;
- `roadmaps show` for #1227 and #1854;
- this pull request's own copies of CharacteristicClasses, ReductiveGroups, TopologicalKTheory and ComplexKahlerGeometry.

**Remark on untouched text** (not a finding). Stage 4.6 (README 822) and the section at 276–288, both on main, refer to the Mathlib pull request mathlib4#44117 by number. R14's repair removes both references.

## Not verifiable

- **Uncertified in the manifest, so not read:** tom Dieck 9.5.1 (README 885), Weibel 5.5.1(2) and 5.5.10 (939, 953), Serre 1953 Theorem 1 (2177), and Milnor, *Morse Theory*, Lemmas 3.6–3.7 (685).
- **Milnor 1959, Theorem 4 (README 2268):** the cached text refers to it at milnor1959 line 221, but I could not find its statement by its label in the extracted text.
- **The Brown collar theorem (README 1592):** it is cited through the native `TauCeti.IsLocallyCollared.isCollared`. The manifest's `brown` entry has no title, so I did not read the locator.
- **May 1967 (4.7, 8.2):** fetched, but the scan is image-only and this worker has no OCR. It is listed in `needs-references.toml`. No finding of this report depends on it.

## Source issues

- none
