# Review of AlgebraicTopology (pull request #1807 at e473a36)

**Verdict:** needs changes

This is an incremental re-review: 0 lines of `TauCetiRoadmap/AlgebraicTopology/` changed since 70140e6. Since then the pull request has changed only the CharacteristicClasses README and `Suggested.lean` and the ClassifyingSpaces README.

All 13 findings of the previous review (r64) are still open, and each is carried forward below. Two of them have new witnesses:

- **R01.** CharacteristicClasses now cites this roadmap's Stage 4.5 as the owner of the compact-generation coreflection k (its lines 25–27 and 436). This README still gives k to HomotopySpheres §3A.1, so those citations do not resolve.
- **R13.** The description's "No Suggested.lean changes" is now false.

The gate still fails exactly as before:

- `depcheck=2` (UPWARD and CYCLE through HomotopySpheres)
- `build=1`, `set_option=1`, `sorry-data=69`, `statement-hygiene=22`
- `dropped=12`, `readme-ids-missing=2`, `tex=1`

I re-ran the gate, the dependency check and the elaboration on this head.

## R01 (P1) — The dependency cycle through HomotopySpheres is not cut, and CharacteristicClasses now cites Stage 4.5 for the coreflection this README gives away

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md`:

- line 126: "HomotopySpheres §3A.1 owns the compact-generation coreflection and CW comparison consumed by 4.5's kified CW product, 8.10 and 8.11a/b"
- line 783: "single k coreflection/CW compact-generation API of HomotopySpheres §3A.1"
- table rows 2411, 2429 and 2430
- prose lines 123, 581, 636, 1864, 2265, 2304 and 2367

**Claim.** Stages 4.5, 8.10 and 8.11a/b consume the coreflection k and the pointed suspension–loop adjunction from HomotopySpheres §3A. HomotopySpheres is on the never-cite list.

**Witness.**

- The brief's dependency check, run today, prints `UPWARD: AlgebraicTopology (on main) -> HomotopySpheres (#45) at README lines [2411, 2429, 2430]` and `CYCLE among: AlgebraicTopology, HomotopySpheres, IndexTheory, StringOrientation, TangentialBordism`.
- The gate reports `dropped=12` on these lines.
- New since 70140e6: CharacteristicClasses (this pull request) lines 25–27 and 436 consume "AlgebraicTopology Stage 4.5's compact-generation coreflection k, right adjoint of … `compactlyGeneratedToTop`, with its counit". This README says it does not own k.

**Repair.**

- Own k in Stage 4.5: package `TopologicalSpace.compactlyGenerated` as the right adjoint of the inclusion of Mathlib's `CompactlyGenerated`, whose counit is the identity on points, together with its CW and locally-compact product comparisons.
- Own the based suspension–loop adjunction on the native fixed-interval loops in 8.11b.
- Delete every HomotopySpheres mention, consumer clauses included.

This also makes CharacteristicClasses 25–27 and 436 resolve. Tested: the AlgebraicTopology README at #1854's head does exactly this (lines 139–144 and 1006–1009, no HomotopySpheres mention). The dependency check on a scratch copy of it prints `depcheck: 237 roadmaps, 2339 edges, 0 problem(s)`.

## R02 (P1) — The gate's build check fails on a non-`sorry` warning

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` line 486 (`noncomputable def chartAt [IsManifold I ∞ M] :`).

**Witness.** `lake env lean` today exits 0 with 215 `declaration uses sorry` warnings. It also prints `486:18: warning: Overlapping instance parameters in chartAt: … There are 2 [IsManifold I ∞ M] instances; one is sufficient.`

**Repair.** Drop the duplicate binder. Once R05 is repaired, the declaration (sorry'd data) is deleted anyway.

## R03 (P2) — Two owners: DGFloer still owns what this pull request moves here, and consumers still cite DGFloer

**Location.** README 102–122 ("The ordinary Serre and Eilenberg–MacLane machinery is owned here … DGFloer Layer 1 consumes these ordinary targets"), 907–910, 1146–1147 and 1911–1917.

**Witness.**

- DGFloer on main (54fc140), lines 231–232: "owns the multiplicative/local-pairing construction …; AlgebraicTopology Stage 5.5 and GeneralizedCohomology consume these targets".
- #1798's head, line 1038: "the spectral sequence consumed by AlgebraicTopology Stage 5.5".
- ReductiveGroups 2111 (this pull request): "DGFloer Layer1.2's based fiber sequence".
- On main: MorseNovikov 161, MorseTheory 885, RiemannianGeometry 786, SmoothBundlesConnections 59 and HeegaardFloer 1137.
- Open pull requests:
  - StableHomotopyKTheory (#1227) line 121 and §3.34 (line 1400: "Use DGFloer Layer 1 item 4's Serre-class carrier").
  - AlgebraicTopologyPartII (#1694) line 12: "DGFloer Layer 1 item 2 owns CW approximation, the fibration homotopy exact sequence …".
  - AlgebraicTopologyPartII line 13 also names StableHomotopyKTheory §§3.36–3.37 as the owner of Hurewicz modulo Serre classes, which is this README's 8.8d.

**Repair.**

- In #1798, make DGFloer Layer 1 items 1–4 cite Stages 4.8, 5.0, 5.5, 8.3, 8.8c and 8.8d, and make its lines 231–232 state this README's direction.
- Repoint ReductiveGroups 2111 to Stage 5.5 in this pull request.
- Repoint the five main consumers in a named follow-up.
- State the order in the descriptions of this pull request and #1798. Settle 8.8d against StableHomotopyKTheory §3.36: that roadmap cites 8.8d, or this one cites it.

## R04 (P2) — This roadmap and CharacteristicClasses still supply each other

**Location.**

- README 1393: "Stage4 cellular data, ordinary6.1–6.2, and CC C1.2a's S0–S4 interfaces"
- README 1970: "Consume CC C1.2a's generic compact-relative support diagram"
- table rows 2419 and 2422

**Witness.** The CharacteristicClasses README at this head was revised at ac36c47, but these lines are unchanged:

- lines 64–66: "C1.5a's Eilenberg–MacLane identification … consumes AT8.5"
- lines 71–72: "The separate AT supported-cellular supplement consumes C1.2a S0–S4"

So AT 8.5 → CC C1.2a and CC C1.5a → AT 8.5, a cycle. The dependency check misses it because it does not resolve "CC".

**Repair.**

- State S0–S4 here as targets of the supported-cellular supplement after 6.2: compactly supported local-coefficient cochains as a support colimit, with enlargement and cofinality, proper pullback, open extension and jointly proper homotopy invariance.
- Let CharacteristicClasses C1.2a consume them.

Tested: #1854's README lines 162–165 ("CharacteristicClasses C1.2a consumes the compactly supported local-coefficient cochains of the supported-cellular supplement after Stage 6.2"). Its dependency check prints 0 problems.

## R05 (P2) — `Suggested.lean` is an API catalogue with 69 sorry'd data bodies and a `set_option`

**Location.** `Suggested.lean`:

- the module docstring ("not exhaustive … suggest Lean forms for load-bearing interfaces")
- line 910: `set_option maxHeartbeats 800000 in`
- sorry'd `def`s, among them 160, 955 `poincareDualityMap`, 1112 `relativeHurewicz`, 1640 `absoluteHurewicz` and 1802 `relativeObstructionCochain`

**Witness.**

- The gate, re-run today, reports `sorry-data=69`, `set_option=1` and `statement-hygiene=22`.
- Several headlines are stated about sorry'd maps and so cannot be refuted: `poincareDualityMap_isIso` (963), `relativeHurewicz_isIso` (1133) and `ordinaryEMRepresentability` (1712).
- `relativeObstructionCochain` lost `[SimplyConnectedSpace Y]` (signatures transcript).

**Repair.** Replace the file by the acceptance test:

- `import Mathlib` and the `TauCeti.*` modules used;
- a docstring listing the headline theorems, and those not statable at the pins with what each lacks;
- the headlines stated on native carriers (`HomotopyGroup.hurewiczHom`, `RelHomotopyGroup.hurewicz`, `TopCat.singularCap`);
- no sorry'd data and no `set_option`.

#1854's head carries such a file: 771 lines, docstring line 110 "Headline theorems not statable at the pins", no `set_option`. Bring it here, or merge after #1854 and say so.

## R06 (P2) — The headlines this pull request adds are statable but absent

**Location.**

- README 41 ("Relative homotopy groups, Hurewicz, Hurewicz modulo a Serre class, Whitehead …")
- README 899–902 (CW approximation of every space and pair)
- README 2176–2180 (8.8d)
- `Suggested.lean` states neither, and its docstring names no headline.

**Witness.** Everything both need is at the pins:

- `HomotopyGroup.hurewiczHom` (Tau Ceti `Homotopy/Hurewicz/Basic.lean` 652)
- `ObjectProperty.IsSerreClass` (Mathlib `CategoryTheory/Abelian/SerreClass/Basic.lean` 45)
- `TopCat.CWComplex`, `ContinuousMap.IsWeakHomotopyEquivalence` (`WeakHomotopyEquivalence.lean` 78)

#1854's head states both: `exists_cwApproximation` at line 351 and `hurewicz_isCIso` at line 682.

**Repair.** In the R05 rewrite, state:

- `hurewicz_isCIso`, with these hypotheses:
  - X simply connected;
  - `[C.IsSerreClass]` together with Serre's axioms as a hypothesis structure;
  - `π_i X ∈ C` for `1 ≤ i < n`.
- `exists_cwApproximation` for arbitrary X.

Name the Serre spectral sequences and the fibration boundary map in the docstring as not statable, with the missing carrier.

## R07 (P2) — The pull request moves into the roadmap objects the pinned Tau Ceti proves, and the degree-one Hurewicz sign contradicts the native map

**Location.** README 1911–1917 ("own the degree-one Hurewicz theorem: … sending a loop to its positively oriented singular circle class"), 825–831, 899–907, 1049–1061 and 2162–2171.

**Witness (sign).** The pinned `HomotopyGroup.hurewiczHom_hom_one_eq_neg_hurewicz₁` (`Hurewicz/One/Comparison.lean` 160, re-opened today) says the native degree-one Hurewicz map is *minus* the loop class. The README's sphere-normalized `h` gives plus.

**Witness (duplicates at the pin).**

- `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv` (`Hurewicz/One/Basic.lean` 705)
- `TauCeti.ComplexProjectiveSpace.cwComplex` (`Classical/ComplexProjective.lean` 419)
- `exists_homotopicRel_range_subset` (`Classical/Compression.lean` 63)
- `isIso_singularHomologyMap` (`Singular/Homotopy/WeakHomotopyEquivalence.lean` 110)
- CW approximation (`CWApproximation/Basic.lean` 336)
- `IsHurewiczFibration` (`HurewiczFibration/Basic.lean` 58)
- `AddCommGrpCat.isTorsion` (`SerreClass/Torsion.lean` 41)
- the finite K(A,1) axiom (`ClassifyingSpace/Torsion.lean` 66)

**Repair.** Consume these natives by name. Keep as targets only what the pins lack:

- the comparison of the 8.3 map with `hurewiczHom`, with sign −1 in degree one;
- `ComplexProjectiveSpace n ≃ₜ Projectivization ℂ (Fin (n+1) → ℂ)`;
- CW approximation of arbitrary spaces and pairs;
- the cohomology and pair forms of the weak-equivalence comparison;
- the fibration long exact sequence;
- the bar-model K(A,1) transport.

Tested: #1854's README line 2283 consumes `hurewiczHomologyAddEquiv`.

## R08 (P3) — The roadmap still plans and states what the pins prove

**Location.** README 407–431 ("Own the single generic no-retraction and finite-dimensional Brouwer theorem"), 686–690 and 756–761. `Suggested.lean` lines 2439, 2444, 2486, 2492, 2499, 2576 and 2645.

**Witness.** The file is unchanged since r64. r64's `exact` probe closes these seven declarations from native lemmas, for example `noRetraction_diskBoundary` by `TauCeti.noRetraction_diskBoundary` (`Singular/BrouwerFixedPoint.lean` 71, re-opened today).

**Repair.**

- Delete the seven declarations from `Suggested.lean`.
- In those README places, consume the native names and files: `wang_exact₁`, `singularTransfer`, `relCWComplexCylinder`, `RealProjectiveSpace.cwComplex` and the others r64 lists.
- Keep as targets only the local-coefficient, relative or bar-model extensions the native files lack.

## R09 (P3) — 44 backticked names of the roadmap's own are declared nowhere

**Location.** README 392 `coordinateCubeReferenceChain_eq_shuffle`, 859 `standardCellBallToOrderedSimplex`, 984 `isQuotientCoveringMap_iff_isCoveringMap_and`, 756 `basedHomotopyInverseOfEquivalence`, 767 `cwProductKelley`, 1880 `kanCubicalHomotopyComparison`, 2056 `groupCohomologyCup`, and others.

**Witness.**

- The gate, re-run today, reports `readme-ids-missing=2`: the first and third names above.
- `isQuotientCoveringMap_iff_isCoveringMap_and` is Mathlib's (`Topology/Covering/Quotient.lean` 339), but the README writes it as if it were this roadmap's own.

**Repair.**

- State each such fact in prose without the name, or declare the name in `Suggested.lean` where it is a headline.
- Attribute the Mathlib lemma to Mathlib, with its file.

## R10 (P3) — TeX outside a code span

**Location.** README line 1400 ("Construct C_c^{cell,n}(X,A;ℤ) as the direct sum …").

**Witness.** The gate reports `tex=1` at this line.

**Repair.** Write it in a code span: `` `C_c^(cell,n)(X,A;ℤ)` ``.

## R11 (P3) — Locators and References for the newly cited theorems

**Location.**

- README 907: "unique up to homotopy equivalence (Hatcher 4.18)"
- README 902: "(Hatcher 4.13), with the n-connected CW-model and n-connected-pair forms"
- README 2177: "Serre 1953, Theorem 1"
- README 689: "Strøm's product theorem"
- References 2500–2521

**Witness.**

- hatcher line 15476 is Corollary 4.19 (uniqueness up to homotopy equivalence rel A). Proposition 4.18 at 15454–15460 is existence and uniqueness of maps between models.
- strom1972 line 181 is Theorem 6 (product of cofibered pairs with A closed).
- Serre 1953 restarts its theorem numbering in each chapter.
- The References list none of tom Dieck 2008, Serre 1953, Strøm 1972, Farrell–Taylor–Wagoner 1973 or Milnor 1963.

**Repair.**

- Cite Corollary 4.19, and Example 4.14 with Proposition 4.15.
- Write "Serre 1953, Chapter III, Theorem 1" and "Strøm 1972, Theorem 6".
- Add the missing works and Hatcher Sections 2.A, 4.2 and the Appendix to the References.

## R12 (P3) — Vocabulary and internal-order slips in the 8.8c/8.8d and 4.5 text

**Location.**

- README 2162–2164: "A Serre class is a class of abelian groups closed under subgroups, quotients and extensions and satisfying Serre's axioms for ⊗, Tor and …"
- README 2177: "if π_i(X)∈C for i<n"
- README 2116 ("uses only 8.1–8.8b") against 116–117 ("uses only 8.1–8.8a")
- README 791, inside item 4.5: "Prove it on Stage 4.7's realization CW structures"

**Witness.**

- Mathlib's `ObjectProperty.IsSerreClass` (45) means only the closure properties, so the README gives that name to a stronger notion.
- π₀ is not a group, so `i < n` cannot start at 0.
- The two 8.8c input lists disagree.
- Item 4.5 consumes the later item 4.7.

**Repair.**

- Keep "Serre class" for Mathlib's notion and state Serre's axioms separately (#1854's `SatisfiesSerreAxioms`, Lean line 665).
- Write `1 ≤ i < n`.
- Make the 8.8c input lists agree.
- Move the realization-product comparison after 4.7, or say that it consumes 4.7.

## R13 (P3) — Pull-request description: order with the other open revisions, and stale claims

**Location.** The description's merge-order paragraph ("No open pull request must merge before this one") and its change list.

**Witness.**

- The overlap index lists #1187, #1652, #1663, #1797, #1808 and #1854 as also changing this folder. The description orders none of them.
- The change list claims rewrites in ArithmeticDirichletSeries and SymplecticGeometry, but the diff touches neither.
- It says all loops but one are cut, but R01's cycle remains.
- New: "No Suggested.lean changes" is false. `git diff --stat origin/main...HEAD` changes eight `Suggested.lean` files, CharacteristicClasses (225 lines) among them.

**Repair.**

- State which of these pull requests is rebased on which, in particular this one against #1854.
- Correct the change list, the loop count and the `Suggested.lean` sentence.

## Previous findings

- R01 — not repaired: README 126 still reads "HomotopySpheres §3A.1 owns the compact-generation coreflection"; the dependency check prints the same UPWARD and CYCLE; CharacteristicClasses 25–27 and 436 now cite Stage 4.5 for k.
- R02 — not repaired: `Suggested.lean` 486, `chartAt` with two `[IsManifold I ∞ M]` binders; linter warning reproduced today.
- R03 — not repaired: DGFloer main 231–232 and #1798 1038 still own the Serre machinery; ReductiveGroups 2111 still cites "DGFloer Layer1.2's based fiber sequence".
- R04 — not repaired: README 1393 "CC C1.2a's S0–S4 interfaces"; CharacteristicClasses 64–66 and 71–72 unchanged by its revision.
- R05 — not repaired: `Suggested.lean` unchanged; `sorry-data=69`, `set_option` at 910, `statement-hygiene=22`.
- R06 — not repaired: no `hurewicz_isCIso` or `exists_cwApproximation` in `Suggested.lean`; the docstring names no headline.
- R07 — not repaired: README 1911–1917 "sending a loop to its positively oriented singular circle class"; native map is its negative.
- R08 — not repaired: README 407–431 "Own the single generic no-retraction and finite-dimensional Brouwer theorem"; `Suggested.lean` 2439–2645 unchanged.
- R09 — not repaired: README 392, 859, 984 names unchanged; gate `readme-ids-missing=2`.
- R10 — not repaired: README 1400 "C_c^{cell,n}(X,A;ℤ)"; gate `tex=1`.
- R11 — not repaired: README 907 "(Hatcher 4.18)"; References unchanged.
- R12 — not repaired: README 2162–2164, 2177 "π_i(X)∈C for i<n", 2116 vs 116–117, 791 unchanged.
- R13 — not repaired: merge-order paragraph unchanged; new false sentence "No Suggested.lean changes".

## Verified sound

**Gate, dependency check, elaboration at e473a36.**

- **Gate.** Re-run with the brief's command. Its counts match the worker's `gate.md` line for line; my run omits the build step, which I ran separately below. It also reports `outside-folder=21`: those are the 21 files of the other 13 folders this pull request owns, which the brief names as its own. `git diff --stat origin/main...HEAD` with those folders excluded is empty, so there is no edit outside the pull request's folders. Stray files: 0.
- **Dependency check.** Output, verbatim:

  ```text
  UPWARD: AlgebraicTopology (on main) -> HomotopySpheres (#45) at README lines [2411, 2429, 2430]
  CYCLE among: AlgebraicTopology, HomotopySpheres, IndexTheory, StringOrientation, TangentialBordism
  depcheck: 237 roadmaps, 2340 edges, 2 problem(s)
  ```

  A scratch copy of #1854's AlgebraicTopology README prints `237 roadmaps, 2339 edges, 0 problem(s)`.
- **Elaboration.** `lake env lean` on `Suggested.lean`: exit 0 in 79 s, 215 `sorry` warnings and the one linter warning of R02.
- **Unchanged files and pins.** `git diff 70140e6 e473a36` touches neither the folder nor `lake-manifest.json` nor `lean-toolchain`, so the pins and `Suggested.lean` are those r64 elaborated.
- **Elaborated signatures.** I used the worker's transcript of 362 declarations, unchanged since r64. Its ten flagged declarations are the same `FreshInteriorRechart` data and `relativeObstructionCochain` (R05). I did not re-run `#check`, since the file is unchanged.
- **Padding probes.** r64's one-tactic probe (no body closes) and its `exact` probe (seven close, R08) stand, because the file is unchanged.

**Seeded sample.** With 0 changed lines, none of the 15 sampled targets falls in a changed passage, so r64's verification of them stands:

- Hatcher 4.13, 4.6, 4.18, 2A.1, 4.30, 4.31, A.3, A.6, 0.19, 2.21, 3.27, 3.29 and 3.43;
- Milnor 1959 Thm 3;
- FTW Thm 4.2, Lemma 4.3 and Cor 4.9.

Today I re-read the two locators that carry R11: hatcher 15454–15460 and 15476–15480 (Prop 4.18 and Cor 4.19), and strom1972 181–184 (Thm 6). The README flags no locator as unverified.

**Adversarial table.** No statement changed. The rows are carried from r64 with the values recomputed there; the last row is added for the interface CharacteristicClasses now cites.

| statement (README or Lean line) | instances | values each side | result |
| --- | --- | --- | --- |
| 4.6 CPⁿ cells (826–830), r64 | n = 0, 1, 2 | {e⁰}; e⁰ ∪ e² = S²; e⁰ ∪ e² ∪ e⁴; native `nat_card_cell_cwComplex` gives 1 iff m even and m ≤ 2n | correct; native (R07) |
| 7 χ(CPⁿ) = n+1 (1819), r64 | n = 0, 1, 2 | 1 = 1; 2 = χ(S²); 3 = 1+1+1 | correct |
| 8.3 degree-one Hurewicz (1911), r64 | S¹; S¹∨S¹; S¹⊔pt | ℤ ≅ ℤ; ℤ² ≅ ℤ², aba⁻¹b⁻¹ ↦ 0; π₁ = 0 but H₁ = ℤ | path-connected hypothesis needed and present |
| 8.3 sign (1913), r64 | loop t ↦ e^{2πit} | README h: +[γ]; native `hurewiczHom`: −[γ] | opposite signs (R07) |
| 4.8 connected-map comparison (888–893), r64 | pt⊔pt → pt; S¹ → pt | H₀ ℤ² → ℤ onto; H₁ ℤ → 0 onto | as stated |
| 4.8 weak equivalences (893–897), r64 | Warsaw circle → pt | π_* bijective; H_* equal | as stated; native |
| 4.8 compression (903–904), r64 | (D¹,S⁰) → (S¹,pt), degree 1 | π₁(S¹) = ℤ, not 1-connected; no compression | hypothesis needed |
| 4.8 CW approximation (899–902), r64 | ∅; two points; Warsaw circle | ∅; two 0-cells; point, weak but not homotopy equivalence | as stated; arbitrary-space form genuine |
| 5.0 homological reindexing (946–947), r64 | (0,0), (2,1) | (1,−1) deg 0; (−4,1) deg −3 | agrees |
| 5.0 cohomological reindexing (949–950), r64 | (0,0), (1,2) | (1,−1) deg 0; (5,−2) deg 3 | agrees |
| 5.0 lower bound (932–933), r64 | F_p C = C for all p | E¹ = 0, H(C) ≠ 0 | hypothesis needed and present |
| 5.5 homological Serre (1062–1072), r64 | Hopf S¹ → S³ → S² | E² = ℤ at (0,0), (2,0), (0,1), (2,1); d² iso | consistent |
| 5.5 cohomological finiteness (1078–1080), r64 | CP^∞, id | H^{2k}(CP^∞) → H^{2k}(CP^k) injective | as stated |
| 5.5 E₂ sign (−1)^{qp′} (1120–1122), r64 | q = 0; p′ = 0 | +1; +1 | agrees |
| 5.5 Leibniz (1124), r64 | Hopf, d₂x = a | d₂(ax) = a² = 0 | consistent |
| 5.5 weakly contractible fibres (1044–1047), r64 | ℝ → S¹; ∅ → pt | fibre ℤ; empty fibre, π₀ not onto | nonemptiness needed and present |
| 5.5 mapping-path fibre (1055–1060), r64 | f = id; pt → X | contractible; `Path x₀ x` | as stated; native |
| 8.8c models (2102–2107), r64 | A = ℤ, n = 1, 2 | S¹, π₁ = ℤ; π₂ = ℤ, others 0 | as stated |
| 8.8c colimit counterexample (2121), r64 | S¹ →(z²) S¹ → ⋯ | ℝ/ℤ[1/2] dense, indiscrete | correct |
| 8.8c ΩK(A,n) ≃ K(A,n−1) (2155), r64 | n = 2; n = 1 | ΩCP^∞ ≃ S¹; ΩS¹ ≃ ℤ disconnected | n ≥ 2 needed and present |
| 8.8d torsion ⇔ ⊗ℚ = 0 (2165), r64 | ℚ/ℤ; ℤ | 0; ℚ | holds |
| 8.8d fixed dᵐ (2166–2168), r64 | d = 2; d = 1 | ℤ/2 → ℤ/4 → ℤ/2 not closed; {0} | d ≥ 2 needed and present |
| 8.8d K(A,1) axiom (2168–2171), r64 | ℤ/2 | H̃_odd(RP^∞) = ℤ/2, killed by 2 | as stated; native |
| 8.8d Hurewicz mod C (2176–2180), r64 | torsion; S², n = 2; S³, n = 3 | h₂ iso, h₃ ℤ → 0 C-epi; h₃ iso, h₄ ℤ/2 → 0 | as stated; i starts at 1 (R12) |
| 8.12 circle (2376–2383), r64 | bar edge +1 | degree +1 loop; π₁ = ℤ both | as stated |
| 4.5 realization product (787–800), r64 | Δ[0]×Δ[0]; Δ[1]×Δ[1] | point; I² with 2 shuffle 2-simplices | as stated |
| `relativeHurewicz_isIso` (Lean 1133), r64 | (D³,S²); (D²,S¹) | π₃ = ℤ = H₃; S¹ excluded | hypotheses right; carrier sorry'd (R05) |
| `homologicalWhitehead` (Lean 1214), r64 | Poincaré sphere → S³ | H_* iso, π₁ ≠ 0 | hypothesis needed and present |
| `noRetraction_diskBoundary` (Lean 2439), r64 | n = 0; n = 1 | ∂D⁰ = ∅; S⁰ not a retract of [−1,1] | true; native (R08) |
| `closedCofibrationCylinderHomotopyExtension` (Lean 2645), r64 | A = ∅; A = X | {0,1}×X; I×X | native (R08) |
| 4.5 kified product (797–798), cited by CharacteristicClasses 436 | ℝ×ℝ; ℚ×ℚ | ℝ locally compact so k(ℝ²) = ℝ²; ℚ² first countable, hence compactly generated, so k(ℚ²) = ℚ², though neither factor is locally compact | "either factor locally compact" is sufficient, stated as such; owner of k unresolved (R01) |

**Library declarations re-opened at the pins** (unchanged since r64):

- `HomotopyGroup.hurewiczHom_hom_one_eq_neg_hurewicz₁` (`Hurewicz/One/Comparison.lean` 160)
- `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv` (`Hurewicz/One/Basic.lean` 705)
- `TauCeti.noRetraction_diskBoundary` (`Singular/BrouwerFixedPoint.lean` 71)

r64's other opened declarations stand on the same pins.

**Cross-roadmap citations resolved today.**

- **CharacteristicClasses at this head:**
  - lines 25–27 and 436 cite Stage 4.5 for k (unresolved, R01);
  - line 445 cites AT5.5's fibration homotopy exact sequence (resolves to README 105);
  - lines 2319 and 2321 cite AT4.6's comparison of the antipodal quotient with the projective-coordinate carrier (resolves to README 833–834);
  - lines 64–73 (R04).
- **ClassifyingSpaces at this head:** its changes cite only pinned Tau Ceti files, no AlgebraicTopology section. This README's citations of ClassifyingSpaces Stage 3/4 (97, 2057–2074) are unaffected.
- **DGFloer:** main lines 231–232, #1798 line 1038.
- **Main consumers:** MorseNovikov 161, MorseTheory 885, RiemannianGeometry 786, SmoothBundlesConnections 59, HeegaardFloer 1137.
- **Open pull requests:** StableHomotopyKTheory #1227 lines 121, 1398–1424; AlgebraicTopologyPartII #1694 lines 11–13.
- **#1854's AlgebraicTopology:** README 139–144, 162–165, 1006–1009, 2283; `Suggested.lean` 110, 351, 665, 682.

**Overlaps.** The overlap index lists no dropped ids, no revision-only ids and no ids of this roadmap dropped by this pull request. It lists six pull requests that change this folder (R13). The closest roadmaps in vocabulary are CharacteristicClasses (R04), StableHomotopyKTheory (R03), HomotopySpheres (R01) and DGFloer (R03).

**Remark on untouched text** (not a finding). Stage 4.6 (README 822) refers to the Mathlib pull request mathlib4#44117 by number. The README's section "Mathlib pull requests determine interface shapes" (276–284), on main, does the same.

## Not verifiable

- tom Dieck 9.5.1 (README 885), Weibel 5.5.1(2) and 5.5.10 (939, 953), Serre 1953 Theorem 1 (2177), Milnor *Morse Theory* Lemmas 3.6–3.7 (685): settled as uncertified in the manifest, so I did not read them.
- Milnor 1959 Theorem 4 (2268): the cached text refers to it at milnor1959 line 221, but I could not find its statement by its label in the extracted text.
- The Brown collar theorem (1592): it is cited through the native `TauCeti.IsLocallyCollared.isCollared`, and the manifest's `brown` entry has no title, so I did not read the locator.

## Source issues

- none
