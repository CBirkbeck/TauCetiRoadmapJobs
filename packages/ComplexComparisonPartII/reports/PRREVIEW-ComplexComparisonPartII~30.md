# Review of ComplexComparisonPartII (pull request #848 at bbf343b)

**Verdict:** needs changes

## R01 (P3) — C4.5 credits the closed-point step to §C-1.1, which does not state it; Mathlib's `pointEquivClosedPoint` is that step

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:2849–2852` (`analyticConnectednessComparison`, algebraic side): "every nonempty locally closed subset of `X` contains a closed point (`nonempty_inter_closedPoints`), and the closed points are the complex points, the image of `φ_X` (§C-1.1)." The same step is used again at :2880–2881 (each fibre "has a closed point", which must then be a complex point). It also appears unsourced at C0.4 :1393 ("closed points are complex points") and C1.9 :2038.

**Claim:** every "if" direction and the surjectivity in item 1 depend on a decomposition of `X` pulling back to a decomposition of `T_X`. That needs every closed point of `X` to lie in the image of `φ_X`. This route credits the step to §C-1.1, but no target, supplier section or pinned declaration provides it.

**Witness:** §C-1.1 (:1034) says only that the underlying set of `X^an` is `X`'s complex points. Mathlib's `AlgebraicGeometry.pointEquivClosedPoint` (`AlgebraicGeometry/AlgClosed/Basic.lean:67`) is the bijection between `K`-points and closed points for `X` locally of finite type over an algebraically closed field `K`.

**Repair:**

- **Mathlib contract.** In the bullet "Points and components (C4.5)" (:518–524), add `AlgebraicGeometry.pointEquivClosedPoint`. State it in prose: for `X` locally of finite type over an algebraically closed field `K`, the `K`-points of `X` correspond bijectively to its closed points. It is applied with `K = ULift.{u} ℂ`, which is algebraically closed by `IsAlgClosed.of_ringEquiv` (`Mathlib/FieldTheory/IsAlgClosed/Basic.lean:213`).
- **C4.5 route.**
  - At :2851, replace "(§C-1.1)" with "(`AlgebraicGeometry.pointEquivClosedPoint`; §C-1.1 identifies the complex points with the points of `T_X`)".
  - At :2881, cite the same declaration for the closed point of the fibre being a complex point.
  - Add it to the *Needs:* line at :2896–2898.
- **Other uses.** Cite the same declaration at C0.4 :1393 and C1.9 :2038.

**Tested:**

- **On `A¹`.** The bijection sends `a ∈ ℂ` to the closed point `(z − a)`. The generic point is neither closed nor a complex point, so a nonempty open of `A¹` pulls back to a nonempty open of `ℂ`, as the route needs.
- **On `Spec ℂ(t)`.** This scheme is not locally of finite type over `ℂ`. Its only point is closed and has residue field `ℂ(t) ≠ ℂ`, so it is not a complex point. The finite-type hypothesis of `pointEquivClosedPoint` excludes this case, and the hypothesis of `analyticConnectednessComparison` excludes it too.

## Previous findings

- **R01 (r29), C4.5 stated only the smooth-affine-curve case of SGA 1 XII Prop. 2.4: repaired.**
  - **The general target.** README :2830–2838 states `analyticConnectednessComparison`: "let `X : Scheme.{u}` be locally of finite type over `ℂ` … the map `π₀(T_X) → π₀(X)` … is a bijection; … `X` is irreducible … if and only if `X^an` is analytically irreducible". Analytic irreducibility is defined through closed analytic subsets cut out by `CoherentAnalyticIdeal`s. The README also notes, correctly, that Mathlib's `IrreducibleSpace` on `T_X` is the wrong notion.
  - **The lemma it needs.** `analyticSubsetComplementConnected` (:2795–2814) is the smooth form of SGA 1 Lemma 2.5, with no Hausdorff hypothesis.
  - **The curve case.** `affineCurveConnectedness` is kept as the case `X = U` (:2784), with its own route.
  - **Consumers.**
    - The C4 headline row (:53) and the `Suggested.lean` docstring (:71–77) name the new target. The docstring says correctly that it is not statable: the scheme side exists at the pins, but `X^an` does not. A grep of the pinned Tau Ceti finds analytification only in a docstring at `AlgebraicGeometry/SmoothPair/AlgebraicChart.lean:20`.
    - C6.2 cites the new target for components and for connectedness (:4838–4841, *Needs:* :4851).
    - All the requested Checks are present: `A¹ ⊔ A¹`, the node, `A²∖{0}`, `⊔_ℕ A¹` and the dual-number point. The nodal cubic and the doubled origin were added as well.
  - **C1.9 rightly left alone.** The author did not make C1.9 cite the new target, and that was correct. C4.5 consumes §C1.9's `properSchemeGagaPushforward`, so the citation that round 29 asked for would have created a cycle inside the roadmap. Instead, :2844 points back to C1.9's own degree-zero argument.
  - **Description and MordellLawrenceVenkatesh.**
    - The pull-request description does not carry the requested sentence about MordellLawrenceVenkatesh §3.10. However, README :5278–5280 records that §3.10 consumes `analyticConnectednessComparison`, "which C4.5 owns", and that is where citing roadmaps read it.
    - At its head `3756140`, MordellLawrenceVenkatesh (`ORDER.txt:159`) still restates the general lemma at README :1463, with "*Needs:* ComplexComparisonPartII §C4.5". This roadmap sits at `ORDER.txt:39` and is the owner, so the repair is a citation in that roadmap's own review: delete the restated first sentence and keep its "in particular" corollary for geometrically connected `K`-schemes.

## Verified sound

### Gate, dependency check and Lean

- **Gate.** My own run on `bbf343b` exits 0 with every scanner at 0: `set_option=0 … readme-ids-missing=0 … target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's `gate.md` agrees and adds `build=0`.
- **Dependency check** (`--movable`). This is its full output:

  ```text
  depcheck: 239 roadmaps, 2334 edges, 0 problem(s)
  ```

  It has no UPWARD, CYCLE or `moved:` line.
  - This roadmap is at `ORDER.txt:39`.
  - The new supplier, ResolutionOfSingularitiesCharacteristicZero, is at :18 and is on main.
  - The consumers come later: InverseGaloisAndArithmeticFundamentalGroups (:54), LefschetzPencilsAndVanishingCycles (:68), ModularCurvesPartII (:71) and MordellLawrenceVenkatesh (:159).
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ComplexComparisonPartII'` is empty, and the worktree is clean.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 18 s. Its only warnings are four `declaration uses sorry`, at :119, :130, :157 and :175.
- **`#check @`.** I checked all four declarations in one scratch file that imports the built module. The elaborated types match `scratch/signatures.md`:
  - `[FiniteDimensional ℂ E]` is kept on `montelTheorem`.
  - `[T2Space]`, `[CompleteSpace]`, `[LocallyConvexSpace ℝ ·]` and `[MetrizableSpace]` are kept on both `E` and `F` in `schwartzFiniteness`.
  - `IsManifold 𝓘(ℂ,E) ⊤ M` is kept on `holomorphicPoincare`.
  - `LocallyContractibleSpace ↑T` is kept on `nonempty_sheafSingularComparison`.

  These match the README statements, and no change was needed.
- **Padding probe.** I made 20 attempts in scratch copies, each replacing a `sorry` by one of `simp`, `rfl`, `infer_instance`, `aesop` and `exact?`. None closes a goal.
  - **`exact?` reran in isolation.** My first copy put each theorem's failed variants into the environment ahead of it, and `exact?` found those stand-ins. I reran `exact?` on a copy where only the four original statements are present, and it fails on all four.
- **Headlines.** All 67 backticked names in the headline table (:47–54) occur in `Suggested.lean`: 4 are declared, and the other 63 are named in the docstring with the carrier they lack. The table and the docstring both swap `affineCurveConnectedness` for `analyticConnectednessComparison`.

### Library declarations opened at the pins

Each was opened at the pin and passes `#check` in a scratch file.

**Mathlib:**

- `AlgebraicGeometry.LocallyOfFiniteType.jacobsonSpace` (`AlgebraicGeometry/Morphisms/FiniteType.lean:112`). It needs `[JacobsonSpace Y]`, which for `Spec (ULift ℂ)` comes from the Artinian-ring instance in `RingTheory/Jacobson/Ring.lean:102`.
- `nonempty_inter_closedPoints` (`Topology/JacobsonSpace.lean:105`).
- `Continuous.connectedComponentsMap` (`Topology/Connected/TotallyDisconnected.lean:293`).
- `AnalyticOnNhd.eqOn_zero_of_preconnected_of_eventuallyEq_zero` (`Analysis/Analytic/Uniqueness.lean:205`).
- `AlgebraicGeometry.pointEquivClosedPoint` (`AlgebraicGeometry/AlgClosed/Basic.lean:67`), for R01.
- `IsAlgClosed.of_ringEquiv` (`FieldTheory/IsAlgClosed/Basic.lean:213`).

**Tau Ceti:**

- `TauCeti.mextDeriv_ofFunction_eq_zero_iff`, which the docstring cites.
- The module `TauCeti.Analysis.Fredholm.CompactPerturbation` (README :364).

### Cross-roadmap citations resolved

**New in this head:**

- **ResolutionOfSingularitiesCharacteristicZero on main.**
  - §5.5 (:841) gives a proper surjective morphism from a smooth scheme. It is an isomorphism over the whole smooth locus and over a common dense open with dense inverse image, with no separatedness assumed.
  - §6.1 (:881) gives the reduced projective closure, which contains `U` as a dense open.
  - These match README :207–216 and the C4.5 route.
- **ComplexKahlerGeometry K3 on main.** At :437–440 it proves that locally bounded holomorphic functions on the complement of a nowhere-dense analytic subset of a complex manifold extend across it. The open revisions keep this statement: #1234 :558, #1398 :942, #1807 :1093 and #1808 :1122 (both in Layer 3, "(K3)"), and #1854 :438.
- **Consumers at their heads.** InverseGaloisAndArithmeticFundamentalGroups (#850) cites `affineCurveCompletionInterface`, `puncturedRiemannSurfaceConnected` and `affineCurveConnectedness` at :462–463. ModularCurvesPartII (#913) cites C4.5 at :281. All of these targets still exist.
- **The renamed heading.** No roadmap links to the old C4.5 anchor; a grep of every open head and of main for `c45-connectedness` and "Connectedness of affine curves" finds only MordellLawrenceVenkatesh :420, which is prose.

**The 39 leads of `scratch/citations.md`:**

- **On main.** 30 resolve by grep: 25 to EtaleCohomologyFoundations (the `VanishingCycles.*` names, `ClassicalAlgebraic.properSupports`, `.smoothTrace`, `.supportLocalization` and `ClassicalDerived.functorCoherence`), 2 to SchemeAndStackFoundations (`VanishingCycles.constructibleEtale` and `.finiteCoefficientCohomology`), and 3 to EnhancedDerivedSheaves (`ClassicalDerived.derivedCompletion`, `.enhancedCategory` and `.inverseLimits`).
- **At open heads.**
  - `DeRham.d_leibniz` is in DerivedDeRhamCohomology (#868) at :3247.
  - `ModuliDescent.coherentPresentationDescent` (:1832), `ProjectiveBundles…projectiveSpaceCechComparison` (:240) and the `spaceDQCoh.*` names (:9758) are in AlgebraicModuliForArithmeticGeometry (#853).
  - Both pull requests add new roadmaps, sit earlier in the merge order, and are named in the description's merge-order block.
- **Sections spot-checked on main:**
  - EtaleCohomologyFoundations G.1 :57, G.2 :105 and G.3 :139;
  - SchemeAndStackFoundations §0.9 :848, §4.11 :5528 and §4.12 :5613;
  - AlgebraicCurves Layer 2 :478 and Layer 12 :1468, which holds the 12B items;
  - UniversalCovers (`Completed/`) Stages 0–2 at :63, :89 and :98.
- **Overlaps.** `scratch/overlaps.md` lists no dropped id, no id that only a revision defines, and no other pull request that changes this folder.

### Ownership against open pull requests

I grepped all 469 open heads and main for the objects of the new targets: SGA 1 XII Prop. 2.4 and Cor. 2.6, `π₀(X^an)`, connectedness of the complement of an analytic or pluripolar subset, and Demailly I (5.26). The only second statement is MordellLawrenceVenkatesh §3.10, which the previous section covers. No roadmap owns the complement-connectedness lemma, so C4.5 owns it. K3 on main proves the extension theorem that it consumes, not the lemma itself.

### Sources: the seeded sample (15 of 15)

I read every text this round. The five texts the manifest lacks came through the sources service into a scratch manifest: Deligne 1968, Freitag, Deligne LNM 163, Sella and Bhatt–Scholze. The board manifest is unchanged.

| Target | Locator checked | Text, line |
| --- | --- | --- |
| The Riemann surface of a smooth complex curve | SGA 1 XII: Prop. 3.1 (viii) on printed p. 244 (separatedness), Prop. 3.2 on p. 245 (proper) | `sga1` 9604, 9639; printed page = marker − 16, e.g. 9531 |
| Curve GAGA as named maps | SGA 1 XII: Thm. 4.4 on p. 249, proof to p. 250 | `sga1` 9805–9844 |
| `IsDifferentialOperator` | EGA IV₄: §16.7 on p. 36, Déf. (16.8.1) on p. 39, Prop. (16.8.8) on p. 42, Prop. (16.8.9) and (16.8.9.2) on p. 43, §16.9 on p. 46; printed page = marker + 1 | `ega4-4` 1259, 1371, 1489, 1526, 1537, 1616 |
| `artinDeRhamBetti` | Deligne 1968: Lemma (5.5.3) and (5.5.4) on printed p. 124. These are the augmentation `A → Ω^•_{X/S}` as a resolution, by the `m`-adic filtration, and `lg H^n_dR = lg(A)·dim H^n(X₀,ℂ)`, under hypothesis (5.5.1), a finite local `ℂ`-algebra | Numdam PMIHES_1968__35__107_0, text lines 685–701 |
| `CurrentCalculus` | Demailly I (2.1) on p. 13, (2.6)–(2.7) on p. 15; III (1.14) on p. 133, (1.21) on p. 135, (1.22) and (1.24) on p. 136 | `demailly-agbook` 505, 617, 6611, 6761, 6781, 6818 |
| `realComplexCurrentComparison` | Demailly I (2.1)–(2.7), pp. 13–15; III (1.14)–(1.15), pp. 133–134; (1.21)–(1.22) and (1.24), pp. 135–136 | `demailly-agbook` 505–617, 6611, 6671, 6761–6818 |
| Analytic cotangent and logarithmic differentials | Freitag *Complex Spaces*: I.2 from p. 2, I.6 from p. 16, II.2 from p. 47 (table of contents). Deligne LNM 163: I.2.10 on p. 9 through 2.15 on p. 11, I.2.22 on p. 14. Kato: see *Not verifiable* | Freitag text lines 10–26 and 147; IAS `Number9.pdf` text lines 302–312, 367–379, 466–474 |
| `complexAlgebraicTopology` | SGA 1 XII §§1–3, pp. 240–247. Hironaka and Bochnak–Coste–Roy: see *Not verifiable* | `sga1` 9405–9700 |
| `topologicalCoefficientComparison` | Hatcher §3.H on p. 333 (direct local-coefficient cochains). Sella: Theorem on p. 2, Lemma 0.1 on pp. 2–4, for semi-locally contractible `X` (defined at lines 14–20). Dimca: see *Not verifiable* | `hatcher-at` 14546, 14576; arXiv:1602.06674v3 text lines 45, 69–113 |
| `riemannExistence` | SGA 1 XII: Thm. 5.1 on p. 251, for `X` locally of finite type; Prop. 2.4 on p. 243 and Cor. 2.6 on p. 244, for the new components clause | `sga1` 9545, 9590, 9872 |
| `artinComparison` | SGA 4: XI §3 on p. 549 with Prop. 3.3, Thm. 4.4 on p. 552; XVI Thm. 4.1 on p. 638; printed page = marker − 9 | `sga4` 24599, 24629, 24748, 24767, 28326, 28350 |
| `artinComparisonCompactSupport` | SGA 4: XVI 4.1(i) for `f` proper and any torsion sheaf; XVII Cor. 5.3.5 on p. 705 for separated compactifiable `X` | `sga4` 28359, 31745 |
| `relativeArtinComparison` | SGA 4: XVI Thm. 4.1 on p. 638, for `f` of finite type between schemes locally of finite type; XVII §5.3 on p. 704 | `sga4` 28350–28361, 31681 |
| `artinSmoothTrace` | SGA 4 XVIII: 2.8, Thm. 2.9, Prop. 2.10, Thm. 3.2.5 | `sga4` 37190, 37209, 37405, 38315 |
| `adicArtinComparison` | Bhatt–Scholze arXiv:1309.1198v2: §5 on the étale comparison, §6.5 (constructible complexes, pro-étale), §6.7 (six functors), §6.8 (`ℤ_ℓ`- and `ℚ_ℓ`-sheaves), as README :5153–5155 cites | arXiv text lines 1571, 2294, 2579, 2757 |

On the `topologicalCoefficientComparison` row: Sella's "semi-locally contractible" is equivalent to Mathlib's `LocallyContractibleSpace`. In one direction, pass to the interior; in the other, compose with `int U ↪ U`.

New locators of C4.5, also read:

- SGA 1 XII Prop. 2.4 on printed p. 243, Lemma 2.5 and Cor. 2.6 on p. 244 (`sga1` 9545–9592). The README's description of SGA 1's own route is accurate: normalization, a normal projective compactification, the connectedness of `P^an`, and Lemma 2.5.
- Demailly I (5.25)–(5.26) on p. 45 (`demailly-agbook` 2119–2132). These are extension across a closed pluripolar set and connectedness of its complement.
- Demailly II Def. (4.1) and Remark (4.2) on p. 91 (`demailly-agbook` 4391–4404). An analytic subset of a connected manifold is either everything or has empty interior and is pluripolar.

### Adversarial pass (values computed this round)

The new C4.5 targets:

| # | Statement | Instances | Values computed | Result |
| --- | --- | --- | --- | --- |
| 1 | `analyticSubsetComplementConnected` | `T = ℂ²`, `A = {z₁z₂=0}`; `T = ℂ`, `A = ℤ = {sin πz = 0}`; doubled-origin line with `A = {0₁}` (ideal `(z)` on chart 1, unit ideal on chart 2) and with `A = {0₁,0₂}`; `T = ℂ ⊔ ℂ`, `A` the first copy; `{0} ⊂ ℝ` | **`z₁z₂ = 0`:** `int A = ∅`, complement `(ℂ*)²` connected. **`ℤ ⊂ ℂ`:** `ℂ∖ℤ` connected, so `A` may be infinite. **`{0₁}`:** `T∖A` is chart 2 `≅ ℂ`, connected. **`{0₁,0₂}`:** `ℂ*`. **`ℂ ⊔ ℂ`:** `int A ≠ ∅`, so connectedness of `T` is needed. **`ℝ∖{0}`:** two components, so the real analogue fails | Holds, without Hausdorffness; the argument is chart-local |
| 2 | `analyticConnectednessComparison` (1) | `∅`; `Spec(ℂ×ℂ)`; `A¹⊔A¹`; `⊔_ℕ A¹`; node; `A²∖{0}` | `#π₀` algebraic / analytic: **`∅`** 0/0, and neither side is a `ConnectedSpace`. **`Spec(ℂ×ℂ)`** 2/2. **`A¹⊔A¹`** 2/2. **`⊔_ℕ A¹`** ℕ/ℕ. **Node** 1/1. **`A²∖{0}`** 1/1, with `T_X ≃ S³` by radial retraction | Holds; the map goes `π₀(T_X) → π₀(X)`, as in SGA 1 2.6 |
| 3 | `analyticConnectednessComparison` (2) | `A¹`; node `xy=0`; nodal cubic `y² = x²(x+1)`; `Spec ℂ[ε]/ε²`; doubled origin; `∅` | **`A¹`:** irreducible, and `ℂ` is analytically irreducible (proper closed analytic subsets are discrete), while Mathlib's `IrreducibleSpace ℂ` fails (Hausdorff with two points). **Node:** `{x=0} ∪ {y=0}` on both sides. **Nodal cubic:** `t ↦ (t²−1, t(t²−1))` satisfies `y² = (t²−1)²t² = x²(x+1)`, and `t = ±1 ↦ (0,0)`; pulled back to `ℂ`, a cover by two proper closed subsets would be two discrete sets, which is impossible, so it is irreducible on both sides. **Dual numbers:** one point on both sides. **Doubled origin:** irreducible on both sides. **`∅`:** irreducible on neither side, since the definition requires nonemptiness | Holds |
| 4 | Route of `analyticConnectednessComparison` | integral affine `X` with `X̄ ⊆ Pⁿ` and resolution `π : Y → X̄`; chain-of-components step | **Resolution:** `π⁻¹(V) ≅ V` is dense and irreducible, so `Y` is irreducible; GAGA in degree 0 gives `H⁰(Y^an,O) = ℂ`, so `T_Y` is connected; `T_W = T_Y ∖ T_Z` is connected by row 1; `W → X` is surjective on complex points, since each fibre is of finite type over `ℂ` and has a closed point. **Chains:** the set of points reachable by chains is a locally finite union of closed sets, as is its complement; the two are disjoint, so it is clopen | Holds; the closed-point step is R01 |
| 5 | Closed points = complex points (R01) | `A¹`; `Spec ℂ(t)` | **`A¹`:** `a ↦ (z−a)` is a bijection `ℂ ≅ closedPoints`, and the generic point is in neither set. **`Spec ℂ(t)`:** the closed point has residue field `ℂ(t)`, so it is not a complex point; it is excluded by local finite type | R01: cite `pointEquivClosedPoint` |
| 6 | `affineCurveConnectedness`, `puncturedRiemannSurfaceConnected` | `G_m`; `E ∖ {O}`; `P¹∖{0,∞}`; `[0,1]∖{1/2}` | **`G_m`:** `ℂ*`, connected on both sides. **`E∖{O}`:** connected on both sides, with model `E`. **`P¹∖{0,∞}`:** path connected. **`[0,1]∖{1/2}`:** two components | Holds |

The four statements of `Suggested.lean`:

| # | Statement | Instances | Values computed | Result |
| --- | --- | --- | --- | --- |
| 7 | `montelTheorem` | polydisc in `ℂ²`, `f_n = (z₁z₂)ⁿ`; `Ω = ∅`; `ℓ²`, `f_n = ⟨e_n,·⟩` | **Polydisc:** on compact `K`, `sup\|z₁z₂\| < 1`, so `f_n → 0` uniformly. **`Ω = ∅`:** `φ = id`, `g = 0`. **`ℓ²`:** bounded on compacts, but `sup_{B(x,r)}\|f_n\| ≥ r` for every `n` while the pointwise limit is 0, so there is no locally uniform limit | Holds; `FiniteDimensional` is needed |
| 8 | `schwartzFiniteness` | `ℓ²`, `g = id`, `h = −P` with `rank P = r`; `h = −id` on `ℓ²`; `h = −id` on `ℂ` | **`h = −P`:** `range(I−P) = ker P`, closed, of codimension `r`. **`−id` on `ℓ²`:** not compact, and the codimension would be ∞. **`−id` on `ℂ`:** range `0`, codimension 1 | Holds |
| 9 | `holomorphicPoincare` | `dz₁∧dz₂` on `ℂ²`; `dz` on `ℂ` (`k = 0`); `dz̄` | **`dz₁∧dz₂`:** `η = (z₁dz₂ − z₂dz₁)/2`, with `dη = dz₁∧dz₂`, and `η` is of type `(1,0)` with `∂̄η = 0`. **`dz`:** `η = z`. **`dz̄`:** of type `(0,1)`, excluded by `hα`; its primitive `z̄` is not holomorphic | Holds |
| 10 | `nonempty_sheafSingularComparison` | a point; `∅`; Warsaw circle `W` | **Point:** `A` in degree 0, 0 above. **`∅`:** 0. **`W`:** `H¹_sheaf = Ȟ¹ = ℤ`, but `H¹_sing = 0`; `W` is not locally contractible | Holds; the hypothesis is needed |

The sampled README targets:

| # | Statement | Instances | Values computed | Result |
| --- | --- | --- | --- | --- |
| 11 | Riemann surface of a smooth curve | `P¹`; nodal cubic; doubled origin | **`P¹`:** transition `1/z` with derivative `−1/z² ≠ 0` on `ℂ*`. **Nodal cubic:** gradient `(−3x²−2x, 2y)` vanishes at the origin, so it is not smooth. **Doubled origin:** smooth but not separated, and excluded by "separated" (:1982) | Holds |
| 12 | Curve GAGA as named maps | `z/(z−1)` on `P¹`; `D = [∞]`; `O(p−q)` on `E` | **`z/(z−1)`:** divisor `[0] − [1]`, order 0 at ∞. **`D = [∞]`:** `h⁰ = 2` (`1, z`) on both sides. **`O(p−q)`:** degree 0 and nontrivial for `p ≠ q` | Holds |
| 13 | `IsDifferentialOperator` | `ℂ[z]`; `𝔽₂[z]` | **`ℂ[z]`:** `[d/dz, z] = 1` and `[[d/dz,z],z] = 0`. **`𝔽₂[z]`:** `(d/dz)²z² = 2 = 0`, but the divided-power `∂^{[2]}z² = 1` has order 2 | Holds; principal parts are needed in characteristic `p` |
| 14 | `artinDeRhamBetti` | `A = ℂ[ε]/(ε²)`, `X = P¹_A`; `A = ℂ`; `X = Spec A` | **`P¹_A`:** `lg H⁰ = lg H² = 2 = 2·1` and `lg H¹ = 0`; the wrong model `H^n(X₀,ℂ)` gives length 1. **`A = ℂ`:** recovers `properDeRhamBetti`. **`Spec A`:** `A` in degree 0, and the augmentation is the identity | Holds; agrees with Deligne (5.5.4) |
| 15 | `CurrentCalculus` | a smooth `k`-form; the wedge on `ℂ` | **Smooth form:** `d(α∧u) = dα∧u + (−1)^k α∧du` with integral 0 gives `∫dα∧u = (−1)^{k+1}∫α∧du`, which is (2.6). **Wedge:** `(a dx + b dy)∧(φdx + ψdy) = (aψ − bφ)dx∧dy` | Holds |
| 16 | `realComplexCurrentComparison` | `n = 1`, `q = 2`, `T = [D]` with `D` the unit disc; `q = 0`, `δ₀` | **`[D]`:** README sign `(−1)^{2−2+1} = −1`, so `dJ₂[D] = −J₁[∂D]`; Demailly (2.7) with `m = 2`, `p = 2` gives `−1`; (2.6) directly gives `⟨d[D],u⟩ = −∫_D du = −∫_{∂D}u`. Mass `π` on both sides. **`δ₀`:** `∂ = 0` and `dJ₀ = 0`, since the degree `3 > 2n` | Holds |
| 17 | Analytic cotangent and log differentials | `ℂ{z,ε}/(ε²)`; `D(z) = 0`, `D(eᶻ) = 1`; the log point | **`ℂ{z,ε}/(ε²)`:** `d(ε²) = 2ε dε`, so `Ω¹ = A dz ⊕ (A/ε) dε`, and relative to `ℂ[ε]/(ε²)` it is `A dz`. **That `D`:** the chain rule forces `D(eᶻ) = eᶻD(z) = 0 ≠ 1`, so it is excluded. **Log point:** `ℂ·dlog t`, and 0 relative to itself | Holds |
| 18 | `complexAlgebraicTopology` | `P¹` with strata `{0}`, `{∞}`, `ℂ*`; the node | **`P¹`:** `ℂ*` is a union of open cells, not a subcomplex. **Node:** a cone over two linked circles, contractible near the node | Holds |
| 19 | `topologicalCoefficientComparison` | `(0,1)` with `Λ`; `𝔽₃` on `S¹` with monodromy −1 | **`(0,1)`:** `H⁰_c = 0`, `H¹_c = Λ`. **`𝔽₃`:** `H⁰ = {v : 2v = 0} = 0` and `H¹ = 𝔽₃/2𝔽₃ = 0`, so `χ = 0` | Holds |
| 20 | `riemannExistence` | `zⁿ` on `G_m`; trivial double cover; `z²` | **`zⁿ`:** deck group `ℤ/n`. **`G_m⊔G_m → G_m`:** `π₀` is 2 on both sides, via the new clause. **`z²`:** connected cover, with `T_Y = ℂ*` connected | Holds |
| 21 | `artinComparison` | `G_m`, `μ_n`, `n = 2` and `n = 3` | The Kummer class goes to the transport `e^{2πi/n}`, and its negation to `e^{−2πi/n}`. These are both −1 at `n = 2` and differ at `n = 3` | Holds |
| 22 | `artinComparisonCompactSupport` | `A¹` | `H⁰_c = 0`, `H⁰ = Λ`, `H²_c(Λ(1)) = Λ` | Holds |
| 23 | `relativeArtinComparison` | `j : G_m ↪ A¹`; `⊕_{x∈ℂ}(i_x)_*Λ` on `A¹` | **`j`:** `(R¹j_*μ_n)₀ = Hom(ℤ, μ_n) ≅ ℤ/n`, and `R^{≥2} = 0`. **Skyscraper sum:** étale `H⁰` consists of finitely supported functions, but the classical side contains `1_ℤ`, so the map is not onto | Holds; constructibility is needed |
| 24 | `artinSmoothTrace` | `P¹`; `A¹⊔A¹` | **`P¹`:** `tr c₁(O(1)) = 1`. **`A¹⊔A¹`:** `Λ² → Λ`, `(a,b) ↦ a+b`, with kernel `Λ` | Holds |
| 25 | `adicArtinComparison` | `P¹`; a torsion object | **`P¹`:** `H²` has rank 1 and trace 1 at every level. **Torsion object:** `⊗ℚ_ℓ` gives 0 | Holds |

## Not verifiable

- **Kato,** *Logarithmic structures of Fontaine–Illusie* (§§1.7–1.9, in the analytic-cotangent sample): the sources service, retried this round, reports "no legal source found".
- **Hironaka,** *Triangulations of algebraic sets* (C6.0): the sources service, retried this round, reports "no legal source found".
- **Bochnak–Coste–Roy,** Thm. 9.2.1 (C6.0): no open host is known.
- **Dimca,** *Sheaves in Topology* (C6.1): the sources service resolves the DOI only to a paywalled page (uncertified).

## Source issues

- none
