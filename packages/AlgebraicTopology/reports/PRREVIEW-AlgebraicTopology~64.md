# Review of AlgebraicTopology (pull request #1807 at 70140e6)

**Verdict:** needs changes

Full review. In this folder the pull request changes only `README.md` (+418/−99). It moves into this roadmap the ordinary Serre machinery (Stages 4.8, 5.0, 5.5), the abelian Eilenberg–MacLane family and Serre classes (8.8c, 8.8d), the degree-one Hurewicz theorem (8.3), the cell structure of CPⁿ (4.6) and the simplicial-realization product comparison (4.5). It narrows 8.12 to the native circle comparison. `Suggested.lean` and the six companion `.lean` files are main's, unchanged. The worker's gate fails: `depcheck=2` (UPWARD and CYCLE through HomotopySpheres), `build=1`, `set_option=1`, `sorry-data=69`, `statement-hygiene=22`, `dropped=12`, `readme-ids-missing=2`, `tex=1`. I reproduced the dependency check, the elaboration and the sorry'd-data count. The previous review (r63) read the same folder in #1854 at d723ba1, a sibling revision that rewrote `Suggested.lean`. Measured against this head, one of its nine findings is repaired and eight are not. New: the moves leave DGFloer and six consumers on main citing DGFloer as owner. They also re-own six objects the pinned Tau Ceti already proves, one of them (degree-one Hurewicz) with a sign opposite to the native map.

## R01 (P1) — The dependency cycle through HomotopySpheres is not cut

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` table rows 2411, 2429, 2430 ("HomotopySpheres §3A.1 for kified CW products and raw quotient/k-counit comparisons"; "§3A.1 compact-generation/product API and §3A.2 adjunction"), and prose 123–127, 581, 636, 783, 1864, 2265, 2304, 2367.

**Claim.** Stages 4.5, 8.10 and 8.11a/b consume the compact-generation coreflection and the pointed suspension–loop adjunction from HomotopySpheres §3A.

**Witness.** The brief's dependency check prints `UPWARD: AlgebraicTopology (on main) -> HomotopySpheres (#71) at README lines [2411, 2429, 2430]` and `CYCLE among: AlgebraicKTheory, AlgebraicTopology, HilbertModules, HomotopySpheres, IndexTheory, OperatorKTheory, StringOrientation, TangentialBordism`. HomotopySpheres is on the never-cite list. The gate also fails `dropped=12` on these lines.

**Repair.** Own the coreflection k (`TopologicalSpace.compactlyGenerated` as right adjoint to the inclusion of native `CompactlyGenerated`, with its counit, products and CW comparison) in Stage 4.5. Own the based suspension–loop adjunction on the native fixed-interval loops in 8.11b. Then delete every HomotopySpheres mention, consumer clauses included. Tested: #1854's AlgebraicTopology README does exactly this (its lines 132–133 and 2769, no HomotopySpheres mention). The brief's dependency check on a scratch copy of it prints `depcheck: 239 roadmaps, 2428 edges, 0 problem(s)`.

## R02 (P1) — The gate's build check fails on a non-`sorry` warning

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` line 486 (`noncomputable def chartAt [IsManifold I ∞ M] :`).

**Witness.** `lake env lean` on the file exits 0 with 215 `declaration uses 'sorry'` warnings. It also prints `486:18: warning: Overlapping instance parameters in chartAt: There are 2 [IsManifold I ∞ M] instances`. The gate's build rule allows `sorry` as the only warning.

**Repair.** Drop the second `[IsManifold I ∞ M]` binder. Once R05 is repaired, the declaration (sorry'd data) is deleted anyway.

## R03 (P2) — Two owners: DGFloer still builds everything this pull request moves here, and consumers on main still cite DGFloer

**Location.** README 102–122 ("The ordinary Serre and Eilenberg–MacLane machinery is owned here … DGFloer Layer 1 consumes these ordinary targets"), 907–910, 1146–1147, 1916–1917.

**Witness.** DGFloer on main still owns these objects: eaf17b10 lines 231–232 ("AlgebraicTopology Stage 5.5 and GeneralizedCohomology consume these targets"), 470 and 659. So does #1798's head, which the description names as DGFloer's side: line 1037 ("Own, for every path-connected CW base, the spectral sequence consumed by AlgebraicTopology Stage 5.5"), 1142 and 1196.

Consumers that still cite DGFloer for these objects:

- in this pull request: ReductiveGroups line 2111 ("DGFloer Layer1.2's based fiber sequence");
- on main: MorseNovikov 161, MorseTheory 885, RiemannianGeometry 786, SmoothBundlesConnections 59 and HeegaardFloer 1137;
- in open pull requests: StableHomotopyKTheory (#1227) line 120 and §3.34, and AlgebraicTopologyPartII (#1694) line 12.

This is the previous review's R01, not repaired.

**Repair.** Complete the move in one ordered set of pull requests:

- DGFloer Layer 1 items 1–4 cite Stages 4.8, 5.0, 5.5, 8.3, 8.8c and 8.8d, and its line 232 states this README's direction. This means fixing #1798, whose head still owns them.
- ReductiveGroups 2111 cites Stage 5.5 in this pull request.
- MorseNovikov, MorseTheory, RiemannianGeometry, SmoothBundlesConnections and HeegaardFloer are repointed in a named follow-up.

State the order in the descriptions of this pull request and #1798. Until then, keep DGFloer's ownership sentences out of this README.

## R04 (P2) — This roadmap and CharacteristicClasses still supply each other

**Location.** README 1393 ("ordinary6.1–6.2, and CC C1.2a's S0–S4 interfaces"), 1970 ("Consume CC C1.2a's generic compact-relative support diagram"), table rows 2419 and 2422.

**Witness.** `TauCetiRoadmap/CharacteristicClasses/README.md` at this head, lines 55–73: "AlgebraicTopology Stages2–6,8.1–8.7 owns singular chains …; C1.5a … consumes AT8.5 …; The separate AT supported-cellular supplement consumes C1.2a S0–S4". So AT 8.5 → CC C1.2a and CC C1.5a → AT 8.5. The roadmaps cite each other. The dependency check misses this because it does not resolve the abbreviation "CC". This is the previous review's R03, not repaired.

**Repair.** State S0–S4 here, as targets of the supported-cellular supplement after 6.2: compactly supported local-coefficient cochains as a support colimit, with enlargement and cofinality, proper pullback, open extension and jointly proper homotopy invariance. Then let CharacteristicClasses C1.2a consume them. Tested: #1854's README line 156 ("CharacteristicClasses C1.2a consumes the compactly supported local-coefficient cochains of the supported-cellular supplement after Stage 6.2"). Its dependency check prints 0 problems.

## R05 (P2) — `Suggested.lean` is an API catalogue with 69 sorry'd data bodies and a `set_option`

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean`: the module docstring ("This file is not the roadmap and is not exhaustive … suggest Lean forms for load-bearing interfaces"); line 910 `set_option maxHeartbeats 800000 in`; sorry'd `def`s, among them 160, 955 `poincareDualityMap`, 1112 `relativeHurewicz`, 1640 `absoluteHurewicz`, 1675 `ordinaryEMUniversalClass`, 1802 `relativeObstructionCochain`.

**Witness.**

- Gate `sorry-data=69`, `set_option=1`, `statement-hygiene=22`. I recounted: 69 `def`/`abbrev`/`instance` bodies contain `sorry`.
- The headline theorems that follow are stated about these sorry'd maps: `poincareDualityMap_isIso` (963), `relativeHurewicz_isIso` (1133), `ordinaryEMRepresentability` (1712). They cannot be refuted.
- The worker's `#check @name` transcript shows that `relativeObstructionCochain` lost `[SimplyConnectedSpace Y]`, and seven `FreshInteriorRechart` declarations lost `[IsManifold I ∞ M]` or `[FiniteDimensional ℝ E]`.

**Repair.** Replace the file by the acceptance test. Use a module header and a single `public import Mathlib` plus the `TauCeti.*` modules used. Give it a docstring listing the headline theorems and those not statable at the pins, with what each lacks. State the headlines on native carriers (`HomotopyGroup.hurewiczHom`, `RelHomotopyGroup.hurewicz`, `TopCat.singularCap`). Keep no sorry'd data and no `set_option`; this also removes the 22 statement-hygiene hits (`letI` in signatures, `eqToHom` conclusions, `Classical.choose` bodies). #1854's head carries such a file (749 lines, docstring line 108 "Headline theorems not statable at the pins"). Bring it into this pull request, or merge this one after #1854 and say so.

## R06 (P2) — The headlines this pull request adds are statable but absent

**Location.** README 41 ("Relative homotopy groups, Hurewicz, Hurewicz modulo a Serre class, Whitehead …", added here), 899–902 (CW approximation of every space and pair) and 2176–2180 (8.8d). `Suggested.lean` states neither and its docstring names no headline.

**Witness.** Everything both need is at the pins:

- Hurewicz modulo a class: `HomotopyGroup.hurewiczHom` (`TauCeti/AlgebraicTopology/Homotopy/Hurewicz/Basic.lean` 652), Mathlib `ObjectProperty.IsSerreClass` (`CategoryTheory/Abelian/SerreClass/Basic.lean` 45) and a two-line kernel/cokernel predicate.
- CW approximation: the native `TopCat.CWComplex` with `T2Space` and `ContinuousMap.IsWeakHomotopyEquivalence` (`TauCeti/Topology/Homotopy/HomotopyGroup/WeakHomotopyEquivalence.lean` 78).

#1854's head states both (its `hurewicz_isCIso` line 660, `exists_cwApproximation` line 349).

**Repair.** In the R05 rewrite, state `hurewicz_isCIso`:

- inputs: X simply connected, `[C.IsSerreClass]` together with Serre's tensor/Tor/K(A,1) axioms as a hypothesis structure, and `π_i X ∈ C` for `1 ≤ i < n`;
- conclusions: `H̃_i ∈ C` for `i < n`, the C-isomorphism in degree n and the C-epimorphism in degree n+1.

Also state `exists_cwApproximation` for arbitrary `X`. Name the Serre spectral sequences and the fibration exact sequence's boundary map in the docstring as not statable, saying which carrier is missing.

## R07 (P2) — The pull request moves into the roadmap objects the pinned Tau Ceti already proves; the degree-one Hurewicz sign then contradicts the native map and DGFloer

**Location.** README 1911–1917 ("own the degree-one Hurewicz theorem: … sending a loop to its positively oriented singular circle class. Prove it directly on singular chains"), 825–831, 899–907, 1049–1061, 2162–2171.

**Witness (sign).** Pinned `HomotopyGroup.hurewiczHom_hom_one_eq_neg_hurewicz₁` (`Hurewicz/One/Comparison.lean` 160) says the native Hurewicz map in degree one is *minus* the loop class. #1798's head line 924 records "AlgebraicTopology Stage 8.3's Hurewicz map in degree one is its negative". The README's sphere-normalized `h` (1909) gives +.

**Witness (duplicates at the pin).**

| README target | Pinned Tau Ceti declaration (file, line) |
| --- | --- |
| degree-one Hurewicz | `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv`, `Homotopy/Hurewicz/One/Basic.lean` 705 |
| CPⁿ CW structure with the same characteristic maps | `TauCeti.ComplexProjectiveSpace.cwComplex`, `cellMap`, `nat_card_cell_cwComplex`, `finiteCWType`, `Topology/CWComplex/Classical/ComplexProjective.lean` 419, 271, 452, 468 (on the sphere-quotient carrier) |
| compression lemma (Hatcher 4.6) | `exists_homotopicRel_range_subset`, `Classical/Compression.lean` 63 |
| weak equivalences give homology isomorphisms | `isIso_singularHomologyMap` and `isIso_twistedHomologyMap`, `Singular/Homotopy/WeakHomotopyEquivalence.lean` 110 and 169 |
| CW approximation of path-connected spaces, natural up to homotopy | `CWApproximation/Basic.lean` 336, `Naturality.lean` 84 |
| path and mapping-path fibrations | `IsHurewiczFibration`, `HurewiczFibration/Basic.lean` 58 and 90; `MappingPath/PathFibration.lean` 160 |
| the Serre-class instances | `AddCommGrpCat.isTorsion` and `isKilledBySomePower`, `SerreClass/Torsion.lean` 41 and 49, `PowerTorsion.lean` 33 and 44 |
| the finite K(A,1) axiom | `ClassifyingSpace/Torsion.lean` 66 and 91 |

**Repair.** Consume each native declaration by name. Keep as targets only what is missing at the pin:

- the comparison of the sphere-normalized 8.3 map with `hurewiczHom`, with its sign (−1 in degree one), so that DGFloer and 8.10 use one normalization;
- the homeomorphism `ComplexProjectiveSpace n ≃ₜ Projectivization ℂ (Fin (n+1) → ℂ)`;
- CW approximation of arbitrary spaces and pairs;
- the cohomology and pair forms of the weak-equivalence comparison;
- the fibration long exact sequence;
- the bar-model transport of the K(A,1) axiom.

Tested: #1854's README lines 2258–2267 consume `hurewiczHom` and `hurewiczHomologyAddEquiv` and own only the comparison and its sign.

## R08 (P3) — The roadmap still plans and states what the pins prove

**Location.** README 407–431 ("Own the single generic no-retraction and finite-dimensional Brouwer theorem … First prove `noRetraction_diskBoundary`"), 686–690, 756–761. `Suggested.lean` 2439, 2444, 2486, 2492, 2499, 2576, 2645.

**Witness.** I made a scratch copy importing `Singular.BrouwerFixedPoint`, `Extension.Prod` and `Extension.HomotopyEquivRel`, with each of these seven `sorry`s replaced by `first | (exact <native>) | sorry`. It elaborates with exit 0, and the seven warnings disappear (215 → 208). For example, `noRetraction_diskBoundary` closes by `exact fun ⟨r, hr⟩ => (TauCeti.noRetraction_diskBoundary n).false ⟨_, r, hr⟩`. The previous review's R04 and R05 are not repaired. Its list is still at the pin with the same lines:

- `wang_exact₁` (`MappingTorus/Wang.lean` 203)
- `singularTransfer` (`Transfer/Basic.lean` 179)
- `openCoverSingularBicomplex` (`Cech/DoubleComplex.lean` 65)
- `relCWComplexCylinder` (`Classical/Cylinder.lean` 252)
- `RealProjectiveSpace.cwComplex` (`RealProjective.lean` 427)
- `toSSetPiMulEquivHomotopyGroup` (`SingularSet.lean` 282)
- `doldKanPiAddEquivHomology` (`DoldKan/HomotopyGroups.lean` 46)
- `singularCohomologyIsoGroupCohomology` (`Cohomology/GroupCohomology.lean` 248)
- `circleHomotopyEquivClassifyingSpace` (`ClassifyingSpace/Circle.lean` 122)
- `HasHomotopyExtensionProperty.exists_basedInverse_homotopicRel` (`Extension/HomotopyEquivRel.lean` 166)

**Repair.** Delete the seven declarations from `Suggested.lean`. In those README places write "consume" with the native name and file, keeping as targets only the local-coefficient, relative or bar-model extensions the native files lack.

## R09 (P3) — 44 backticked names of the roadmap's own are declared nowhere

**Location.** README 392 `coordinateCubeReferenceChain_eq_shuffle`, 859 `standardCellBallToOrderedSimplex`, 984 `isQuotientCoveringMap_iff_isCoveringMap_and`, and others, e.g. 756 `basedHomotopyInverseOfEquivalence`, 767 `cwProductKelley`, 1880 `kanCubicalHomotopyComparison`, 2056 `groupCohomologyCup`.

**Witness.** The gate shows `readme-ids-missing=2`. A mechanical pass over all 202 single-identifier code spans found 44 that occur in no file of this folder and nowhere in Mathlib or Tau Ceti at the pins. The gate skips names followed by an argument. `isQuotientCoveringMap_iff_isCoveringMap_and` is Mathlib's (`Topology/Covering/Quotient.lean` 339) but is written as if it were the roadmap's own. The previous review's R08 (`standardCellBallToOrderedSimplex`) is not repaired.

**Repair.** State each such API fact in prose without the name, or declare it in `Suggested.lean` where it is a headline. Pin the Mathlib lemma with `#check` or name its file.

## R10 (P3) — TeX outside a code span

**Location.** README line 1400 ("Construct C_c^{cell,n}(X,A;ℤ) as the direct sum …").

**Witness.** Gate `tex=1`.

**Repair.** Write it as `` `C_c^(cell,n)(X,A;ℤ)` `` in a code span.

## R11 (P3) — Locators and References for the newly cited theorems

**Location.** README 885 (tom Dieck 9.5.1), 902 ("(Hatcher 4.13), with the n-connected CW-model and n-connected-pair forms"), 907 ("unique up to homotopy equivalence (Hatcher 4.18)"), 1914 (Hatcher 2A.1), 2131 and 2141 (Hatcher 4.30–4.31), 2177 ("Serre 1953, Theorem 1"), 689 ("Strøm's product theorem"); References 2500–2521.

**Witness.**

- Uniqueness up to homotopy equivalence is Corollary 4.19 (hatcher line 15476), not 4.18.
- The pair and n-connected forms are Example 4.14 and Proposition 4.15 (hatcher 15379).
- Serre 1953 numbers its theorems from 1 in each chapter, so "Theorem 1" needs its chapter.
- Strøm's result is Theorem 6 (strom1972 line 181).
- The References list none of tom Dieck 2008, Serre 1953, Strøm 1972, Farrell–Taylor–Wagoner 1973 or Milnor 1963, nor Hatcher Sections 2.A, 4.2 and the Appendix.

**Repair.**

- Cite Corollary 4.19 for uniqueness, and Example 4.14 and Proposition 4.15 for the pair and n-connected forms.
- Write "Serre 1953, Chapter III, Theorem 1".
- Write "Strøm 1972, Theorem 6".
- Add the missing works and sections to the References.

## R12 (P3) — Vocabulary and internal-order slips in the new 8.8c/8.8d and 4.5 text

**Location.** README 2162–2164 ("A Serre class is a class of abelian groups closed under subgroups, quotients and extensions and satisfying Serre's axioms for ⊗, Tor and the homology of K(A,1)"); 2177 ("if π_i(X)∈C for i<n"); 2116 ("The construction uses only 8.1–8.8b") against 116–117 ("The 8.8c constructor uses only 8.1–8.8a") and table row 2425; 791 ("Prove it on Stage 4.7's realization CW structures") inside item 4.5.

**Witness.**

- Mathlib's `ObjectProperty.IsSerreClass` (pin, 45) is only closure under subobjects, quotients and extensions. The native `AddCommGrpCat.isTorsion` instance is in that sense. The README gives the same name to a stronger notion.
- π₀ is a pointed set, not a group in C.
- 8.8c's stated inputs disagree (8.8a against 8.8b).
- Item 4.5 depends on the later item 4.7.

**Repair.**

- Keep "Serre class" for Mathlib's notion and state Serre's ⊗/Tor/K(A,1) axioms as separate hypotheses, as #1854 does with `SatisfiesSerreAxioms`.
- Write `1 ≤ i < n`.
- Make the three 8.8c input statements agree.
- Move the realization-product comparison after 4.7, or say that it consumes 4.7.

## R13 (P3) — Pull-request description: order with the other open revisions and stale claims

**Location.** Description, merge-order paragraph ("No open pull request must merge before this one") and the change list.

**Witness.**

- The overlap index lists #1652, #1663, #1797, #1808, #1854 and #1187 as other open pull requests changing this folder; the description orders none of them. #1854 carries a superset of this folder's README change, and #1797 and #1854 each rewrite `Suggested.lean`.
- The description says consumer sentences were rewritten in ArithmeticDirichletSeries and SymplecticGeometry. That is not so: `git diff --stat origin/main...HEAD` touches neither.
- It says all loops but one are cut, but R01's loop remains.

This is the previous review's R09, not repaired.

**Repair.** State which of these pull requests is rebased on which (in particular whether this one merges before #1854 or is folded into it), and correct the change list and the loop count.

## Previous findings

The previous review (r63) read this folder in #1854 at d723ba1. Status at this head:

- R01 (DGFloer second owner) — not repaired: DGFloer main 231–232, #1798 1037; R03 above.
- R02 (relative Hurewicz and Hurewicz mod C statable but called not statable) — not repaired: this head's docstring names no headline; Hurewicz mod C is absent and relative Hurewicz is stated on the sorry'd `relativeHurewicz` (1112). See R05 and R06.
- R03 (CharacteristicClasses two-way) — not repaired: README 1393, 1970, 2419, 2422 and CharacteristicClasses 70–73; R04.
- R04 (native Brouwer and cofibration theorems) — not repaired: seven close by `exact` at 2439–2645; R08.
- R05 (README plans native constructions) — not repaired, and extended by this pull request; R07 and R08.
- R06 (HomotopySpheres on the dropped-names list) — not repaired, 12 lines; R01.
- R07 (edits outside the folders) — repaired: `git diff --stat origin/main...HEAD` outside the 14 named folders is empty.
- R08 (`standardCellBallToOrderedSimplex`) — not repaired (README 859); R09.
- R09 (description order) — not repaired; R13.

## Verified sound

**Gate, dependency check, build, probes at 70140e6.**

- The brief's dependency check, run today, prints the UPWARD and CYCLE lines of R01 and `depcheck: 239 roadmaps, 2429 edges, 2 problem(s)`. Main's README gives the same CYCLE with four UPWARD rows (2096, 2109–2111); this pull request removes the 8.10 row only.
- A scratch copy with "CC C1.2a" spelled out still prints only those two problems. A scratch copy of #1854's README prints 0 problems.
- `lake env lean` on `Suggested.lean`: exit 0 in 28 s, 215 `sorry` warnings and the one linter warning of R02.
- One-tactic probe: every `sorry` replaced by `first | (rfl; done) | (simp; done) | (infer_instance; done) | sorry` elaborates with exit 0 and the same 215 warnings. None of the 218 bodies closes that way, so nothing there is one-tactic padding.
- The `exact` probe of R08 closes seven.
- Out-of-folder diff: empty. Stray files: none (gate 0).
- Elaborated signatures: I used the worker's `#check @name` transcript (362 declarations) and read the ten flagged ones. The `FreshInteriorRechart` defs and instances are data whose types do not mention the manifold structure; the obstruction cochain loses simple connectivity (R05). I did not re-run the `#check` file, since `Suggested.lean` is unchanged from the transcript.

**Seeded sample (15 readable numbered locators), read at the locator.**

| target (README line) | source line | verdict |
| --- | --- | --- |
| Hatcher Prop 4.13 (902) | hatcher 15375–15378 | every space has a CW approximation; as stated; the pair and n-connected forms need Ex 4.14/Prop 4.15 (R11) |
| Hatcher Lemma 4.6 (904) | hatcher 15116–15118 | cellwise compression rel A, B nonempty; the README's "dimension ≤ n into n-connected pair" is a special case; supported |
| Hatcher Prop 4.18 (907) | hatcher 15454–15460 | existence and rel-A uniqueness of maps between models: supports "natural up to homotopy"; uniqueness of models is Cor 4.19 (R11) |
| Hatcher Thm 2A.1 (1914) | hatcher 7230–7233 | path-connected X, h onto with kernel the commutator subgroup: as stated |
| Hatcher Prop 4.30 (2141) | hatcher 15928–15929 | CW K(G,n) unique up to homotopy type; the README's weak-equivalence form for arbitrary path-connected Z follows from Lemma 4.31 |
| Hatcher Lemma 4.31 (2131) | hatcher 15931–15935 | n ≥ 1, Y path-connected, every ψ on π_n realized: as stated |
| Hatcher Prop A.3 (725) | hatcher 22617 | CW complexes are normal, hence Hausdorff: as stated |
| Hatcher Thm A.6 (781) | hatcher 22693–22697 | product cells give a CW structure on k(X×Y), equal to X×Y if either factor is locally compact: as stated at 781 and 798 |
| Hatcher Prop 0.19 (760) | hatcher 867–869 | HEP pairs, an equivalence fixing A is one rel A: applied to basepoints (native, R08) |
| Hatcher Prop 2.21 (509) | hatcher 5222–5224 | small-chain inclusion is a chain homotopy equivalence: as stated |
| Hatcher Lemma 3.27 (1475) | hatcher 10255–10258 | compact A, unique class with prescribed local images: the local-system form is the README's own extension |
| Hatcher Prop 3.29 (1737) | hatcher 10370–10371 | connected noncompact n-manifold, H_i = 0 for i ≥ n; the README uses its route for i > m |
| Hatcher Thm 3.43 (1775) | hatcher 10976–10980 | compact R-orientable M, ∂M = A ∪ B, cap with [M] an isomorphism: the five-lemma route as cited |
| Milnor 1959 Thm 3 (2268) | milnor1959 209–212 | A ∈ W_n, C a compact n-ad ⇒ the function n-ad is in W_n: `finiteSourceMappingCWType` is the pair case |
| FTW Thm 4.2, Lemma 4.3, Cor 4.9 (1998–2024) | ftw1973 600–606, 610–614, 752–756 | finite-dimensional countably based locally finite C with C and its dual acyclic; controlled filling; simply connected and SC at infinity: as stated |

**Adversarial table.** The values each side were computed today.

| statement (README or Lean line) | instances | values each side | result |
| --- | --- | --- | --- |
| 4.6 CPⁿ cells (826–830) | n = 0, 1, 2 | {e⁰}; e⁰ ∪ e², ∂D² → CP⁰ a point, giving S²; e⁰ ∪ e² ∪ e⁴; native `nat_card_cell_cwComplex` gives 1 iff m even and m ≤ 2n | correct; native (R07) |
| 7 χ(CPⁿ) = n+1 (1819) | n = 0, 1, 2 | 1 = 1; 2 = χ(S²); 3 = 1+1+1 | correct |
| 8.3 degree-one Hurewicz (1911) | S¹; S¹∨S¹; S¹⊔pt | ℤ → ℤ iso; F₂ᵃᵇ = ℤ² → ℤ², aba⁻¹b⁻¹ ↦ 0; π₁(·,pt) = 0 but H₁ = ℤ | path-connectedness needed and present |
| 8.3 sign (1913) | loop t ↦ e^{2πit} | README's h, with [I,∂I] = [t↦t] sent to +generator: +[γ]; native `hurewiczHom`: −[γ] | opposite signs (R07) |
| 4.8 connected-map comparison (888–893) | k = 0, pt⊔pt → pt; k = 1, S¹ → pt | H₀: ℤ² → ℤ onto; H₀ iso and H₁: ℤ → 0 onto | as stated |
| 4.8 weak equivalences (893–897) | Warsaw circle W → pt | π_* bijective; singular H_*(W) = H_*(pt) | as stated; native |
| 4.8 compression (903–904) | (D¹,S⁰) → (S¹,pt), degree 1, n = 1 | π₁(S¹,pt) = ℤ, so (S¹,pt) is not 1-connected; the map does not compress | hypothesis needed; native |
| 4.8 CW approximation (899–902) | ∅; two points; Warsaw circle | ∅; two 0-cells; a point, a weak equivalence but no homotopy equivalence | as stated; the arbitrary-space form is genuine (native is path-connected only) |
| 5.0 homological reindexing (946–947) | (p,q) = (0,0), (2,1) | (a,b) = (1,−1), deg 0; (−4,1), deg −3 = −(p+q) | agrees |
| 5.0 cohomological reindexing (949–950) | (0,0), (1,2) | (1,−1), deg 0; (5,−2), deg 3 = p+q | agrees |
| 5.0 lower bound (932–933) | F_p C = C for every p | E¹ = 0 everywhere, H(C) ≠ 0 | convergence fails without it; present |
| 5.5 homological Serre (1062–1072) | Hopf S¹ → S³ → S² | E² = ℤ at (0,0), (2,0), (0,1), (2,1); H₁(S³) = H₂(S³) = 0 forces d² iso | consistent; constant E² without collapse (2459) |
| 5.5 cohomological finiteness (1078–1080) | B = CP^∞, p = id | H^{2k}(CP^∞) → H^{2k}(CP^k) injective, so F^{2k+1}H^{2k} = 0 | finite in each degree, as stated |
| 5.5 E₂ sign (−1)^{qp′} (1120–1122) | q = 0; p′ = 0 | +1 (base cup); +1 (fibre cup) | agrees |
| 5.5 Leibniz (1124) | Hopf, d₂x = a, a ∈ E^{2,0} | d₂(ax) = d₂(a)x + (−1)^{2} a·a = a² = 0 | consistent |
| 5.5 weakly contractible fibres (1044–1047) | ℝ → S¹; ∅ → pt | fibres ℤ, not a weak equivalence; empty fibre, π₀ not onto | nonemptiness needed and present |
| 5.5 mapping-path fibre (1055–1060) | f = id; f : pt → X | fibre = paths ending at x, contractible; fibre = `Path x₀ x` | as stated; native (R07) |
| 8.8c models (2102–2107) | A = ℤ, n = 1, 2 | \|N(SingleObj ℤ)\| ≃ S¹, π₁ = ℤ; \|Γ(ℤ[2])\| has π₂ = ℤ, the others 0 | as stated |
| 8.8c colimit counterexample (2121) | S¹ → S¹ → ⋯, z ↦ z² | colimit set ℝ/ℤ[1/2], a dense subgroup, so the topology is indiscrete | correct |
| 8.8c ΩK(A,n) ≃ K(A,n−1), n ≥ 2 (2155) | n = 2, A = ℤ; n = 1 | ΩCP^∞ ≃ S¹; ΩS¹ ≃ ℤ discrete, not connected | n ≥ 2 needed and present |
| 8.8d torsion ⇔ ⊗ℚ = 0 (2165) | ℚ/ℤ; ℤ | ℚ/ℤ ⊗ ℚ = 0, torsion; ℤ ⊗ ℚ = ℚ | holds |
| 8.8d fixed dᵐ (2166–2168) | d = 2, m = 1; d = 1 | ℤ/2 → ℤ/4 → ℤ/2 with ℤ/4 not killed by 2; d = 1 gives {0}, a class | "d ≥ 2" needed and present |
| 8.8d finite K(A,1) axiom (2168–2171) | A = ℤ/2 | H̃_odd(RP^∞;ℤ) = ℤ/2, killed by 2 | as stated; native |
| 8.8d Hurewicz mod C (2176–2180) | C torsion; S², n = 2; S³, n = 3 | h₂ ℤ → ℤ iso, h₃ ℤ → 0 C-epi; h₃ iso, h₄ ℤ/2 → 0 with kernel in C | as stated; i starts at 1 (R12) |
| 8.12 circle (2376–2383) | bar edge +1 | loop t ↦ t mod ℤ of degree +1; π₁ = ℤ on both sides | as stated |
| 4.5 realization product (787–800) | K = L = Δ[0]; K = L = Δ[1] | a point; I² compact so k(I²) = I², with 2 = C(2,1) shuffle 2-simplices | as stated |
| `relativeHurewicz_isIso` (Lean 1133) | (D³,S²), n = 3; (D²,S¹) | π₂(D³,S²) = π₁(S²) = 0, π₃ = π₂(S²) = ℤ = H₃(D³,S²); S¹ excluded by simple connectivity | hypotheses right; carrier sorry'd (R05) |
| `homologicalWhitehead` (Lean 1214) | Poincaré sphere P → S³ | H_* iso, π₁(P) ≠ 0, not an equivalence | hypothesis needed and present |
| `noRetraction_diskBoundary` (Lean 2439) | n = 0; n = 1 | ∂D⁰ = ∅ with no map pt → ∅; S⁰ is not a retract of [−1,1] | true; native (R08) |
| `closedCofibrationCylinderHomotopyExtension` (Lean 2645) | A = ∅; A = X | {0,1}×X; I×X | native, same hypotheses (R08) |

**Library declarations opened at the pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9).**

- Mathlib:
  - `isQuotientCoveringMap_iff_isCoveringMap_and` (`Topology/Covering/Quotient.lean` 339)
  - `ObjectProperty.IsSerreClass` (`CategoryTheory/Abelian/SerreClass/Basic.lean` 45)
  - `CompactlyGenerated` and `compactlyGeneratedToTop` (`Topology/Category/CompactlyGenerated.lean` 49, 78); no coreflection there, so R01's repair is a genuine target
  - `TopCat.toSSet` monoidal instance (`AlgebraicTopology/SimplicialSet/TopAdj.lean` 30); no realization-product comparison at either pin, so 4.5's is genuine
- Tau Ceti: the declarations of R07 and R08 at the lines given, plus:
  - `HomotopyGroup.hurewiczHom_hom_one_eq_neg_hurewicz₁` (`Hurewicz/One/Comparison.lean` 160)
  - `serreFibrations` and its instances and `mem_serreFibrations_pullbackFst` (`SerreFibration/Basic.lean` 107–179)
  - `TauCeti.TopCat.mem_serreFibrations_iff_cube` (143)
  - `IsHurewiczFibration.mem_serreFibrations` (`HurewiczFibration/Basic.lean` 90)
  - `AddCircle.isEilenbergMacLaneSpaceOne` (`UniversalCover/Circle/EilenbergMacLane.lean` 47)
  - `TauCeti.ComplexProjectiveSpace` (`Topology/ComplexProjectiveSpace/Basic.lean` 58, with no `Projectivization` comparison in the folder)
  - `SerreClass/TensorTor.lean` 51, 65, 76
  - no fibration homotopy long exact sequence at the pin (the `Relative/Exact.lean` sequence is for pairs), so 5.5's is genuine

**Cross-roadmap citations resolved today.**

- DGFloer on main (eaf17b10) lines 198, 231–232, 470, 621, 659; #1798 head 918–945, 1037–1038, 1060, 1142, 1196, 1218; #963 line 686.
- In this pull request:
  - CharacteristicClasses lines 55–75
  - GeneralizedCohomology lines 36 and 44 (consume 8.8c, 8.8d, 4.8, 5.5) and 539 (owns `IsHurewiczFibration`, which is native: its own review's concern)
  - TopologicalKTheory 139, 412, 468 (4.6, 5.5)
  - ComplexKahlerGeometry 1964–2124 (4.6, 5.0)
  - BordismFormalGroups 985 (5.5)
  - ReductiveGroups 2111 (R03)
- On main: MorseNovikov 161 and 405, MorseTheory 885, RiemannianGeometry 786, SmoothBundlesConnections 59, HeegaardFloer 1137, 1145, 4834.
- Open pull requests: StableHomotopyKTheory #1227 lines 120 and 1398–1420; AlgebraicTopologyPartII #1694 lines 12–13; #1854's AlgebraicTopology README 122, 132–133, 149–159, 2258–2267, 2769 and its `Suggested.lean` 83, 108, 349, 525, 625–666.
- The consumer sentences this pull request adds for GeneralizedCohomology, TopologicalKTheory, ComplexKahlerGeometry, BordismFormalGroups and CharacteristicClasses are matched by citations in those READMEs at this head.

**Ownership against open pull requests.** Checked by object for the moved targets: the Serre machinery, CW approximation, the abelian EM family and Serre classes (DGFloer main, #1798 and #963, StableHomotopyKTheory #1227 §3.34–3.35; R03); the compact-generation coreflection (HomotopySpheres, on the never-cite list; R01); compact-support cochains (CharacteristicClasses; R04); the realization-product comparison (GeneralizedCohomology now consumes it; no other owner among the sibling checkouts); the CPⁿ cell structure (native; R07). The overlap index found no dropped or revision-only ids.

**Shape.** The README keeps the Stage form it has on main, as #1854's head does. Like the earlier reviews of these decycling revisions, this one does not ask for a recast into Layer and `**Checks.**` form. The `TopologicalGroupFundamentalGroup.lean` companion is unchanged from main.

## Not verifiable

- tom Dieck 9.5.1 (README 885), Weibel 5.5.1(2) and 5.5.10 (939, 953), Serre 1953 Theorem 1 (2177), Milnor *Morse Theory* Lemmas 3.6–3.7 (685): settled as uncertified in the manifest; not read.
- Milnor 1959 Theorem 4 (2268): the cached text refers to it at milnor1959 line 221, but its statement is not findable by its label in the recognised text.
- The Brown collar theorem (1592): cited through the native `TauCeti.IsLocallyCollared.isCollared`; the manifest's `brown` entry has no title, so the locator was not read.

## Source issues

- none
