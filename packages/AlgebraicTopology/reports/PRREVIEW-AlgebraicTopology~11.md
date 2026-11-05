# Review of AlgebraicTopology (pull request #1652 at b7e4a02)

**Verdict:** needs changes

Incremental re-review: the folder `TauCetiRoadmap/AlgebraicTopology/` has 0 changed lines since f285cc1, the head the previous review (PRREVIEW-AlgebraicTopology~8) accepted with four P3 findings. What changed is the merge of main (commit b7e4a02), which moved the checkout's `lake-manifest.json` pins from Mathlib `6b7abb3c` / Tau Ceti `a91d3aa` to Mathlib `f6090c70` / Tau Ceti `358314d4`. Two consequences are findings of this round: the gate's build check now fails on Lake's module-system warning (R01), and the new Tau Ceti pin carries a homology cross product the supplier contract does not cite (R06). The four previous P3 findings are untouched by the merge and are carried as R02–R05. The dependency check, the text scanners, the elaboration and the one-tactic probe are clean; every library name the README cites exists at the new pins; every supplier citation resolves on main at a0ad405.

## R01 (P1) — The gate's build check fails on Lake's module-system warning

**Location:** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean:1`–`:6`: `import Mathlib` followed by five `import TauCeti.…` lines.

**Claim:** The file builds under the gate at this head.

**Witness:** `lake build TauCetiRoadmap.AlgebraicTopology.Suggested` from the pull-request checkout exits 0 with 18 `declaration uses 'sorry'` warnings and one more: “imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file”. The worker's gate counts that non-`sorry` warning as `build=1 FAIL`; at f285cc1 the pins were `6b7abb3c`/`a91d3aa`, which emit no such warning, so the previous acceptance's gate was clean. The brief forbids acceptance while the gate fails.

**Repair:** Make the file a module-system file: line 1 `module`, a blank line, then `public import Mathlib` and `public import TauCeti.<…>` for each of the five Tau Ceti modules, the module docstring unchanged, then `public section` before `namespace TauCetiRoadmap.AlgebraicTopology` (no matching `end` is needed for `public section`). A bare `module` without `public` makes every declaration private to importers, so the `public` forms are the repair, not `module` alone. Tested: a probe copy with exactly that header, every `sorry` replaced by `first | rfl | (simp; done) | infer_instance | decide | trivial | sorry` and `#check @name` for all 31 declarations, elaborates with `lake env lean` in 20 s, exit 0, with the 18 `sorry` warnings as the only non-linter output; all 31 `#check`s print their types, so nothing becomes private. The gate's import scanner admits `public import`.

## R02 (P3) — Hatcher Theorem 3.11 is on p.210, not p.215

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:986`: “the ordered-product interchange sign (Theorem 3.11, p.215)”.

**Claim:** The graded-commutativity theorem used for the factor-interchange degree (−1)^(mn) is on p.215.

**Witness:** In the cached Hatcher text (hatcher line 9099) Theorem 3.11 sits on PDF page 219; printed page = PDF page − 9 throughout (Theorem 2.44 at PDF 155 = p.146, Example 3.16 at PDF 225 = p.216), so Theorem 3.11 is printed p.210. Unchanged since the previous review (its R01).

**Repair:** Replace “p.215” by “p.210” at line 986.

## R03 (P3) — Say what AlgebraicTopology owns, not what HomotopySpheres currently does

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:121`–`:124`: “HomotopySpheres §3A.1 and the foundation-only suspension–loop portion of §3A.2 use this foundation”; `:3243`–`:3245` repeats it; `:3341`–`:3344` (Worked examples): “The tower difference map, six-term sequence, Mittag--Leffler vanishing, integer-graded Milnor sequences and cofinal shifts satisfy their naturality diagrams.”

**Claim:** The first passages describe HomotopySpheres as already consuming Layer 4.0; the worked-example bullet describes the generic tower algebra as this roadmap's deliverable.

**Witness:** At its open head, `TauCetiRoadmap/HomotopySpheres/README.md:663`–`:700` (§§3A.1–3A.2) still builds the compact-generation coreflection, the exponential law and the suspension–loop adjunction itself. The tower bullet restates what Scope `:128`–`:133` and the supplier contract `:352`–`:363` assign to DerivedModuleAlgebra §§1.T.1 and 1.1 (on main, `TauCetiRoadmap/DerivedModuleAlgebra/README.md:1403`). Unchanged since the previous review (its R02).

**Repair:** Reword `:121`–`:124` and `:3243` as a statement about this roadmap: Layer 4.0 is the single owner of the compact-generation coreflection, convenient products, exponentials, CW comparisons and the foundational pointed suspension–loop adjunction; HomotopySpheres' pointed cones, Puppe sequences and stabilization are consumers of this foundation and of this roadmap's cofibration and relative-homotopy results. Rewrite the worked-example bullet at `:3341` as the adapter statement: the singular and cellular restriction towers have degreewise surjective restriction, their limits are the cochains of the whole pair, and the imported Milnor maps and homotopy-square comparisons transport along the cellular/singular comparison with their chosen homotopies. The tested values stay: on the point tower δ(3,1,0,…) = (2,1,0,…) and lim¹ = 0; on the one-vertex circle the degree-one limit is M and H¹(S¹;M) = M.

## R04 (P3) — `finiteSourceMappingCWType` does not need `[T2Space Y]`

**Location:** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean:308`–`:310` and `README.md:3010`: “for compact Hausdorff X and Hausdorff Y equipped with a `CWTypeModel`”.

**Claim:** Hausdorffness of the target is a hypothesis of the mapping-space CW-type theorem.

**Witness:** `modelY` already supplies a homotopy equivalence e : Y ≃ K with K a Hausdorff CW complex (`CWTypeModel.hausdorff`, `Suggested.lean:212`). Postcomposition by e and by its inverse is continuous on compact-open spaces for any Y, and the homotopy e⁻¹∘e ≃ id_Y induces C(X,Y) × I → C(X,Y) as the adjoint of (f,t,x) ↦ H(t,f(x)), which needs only continuity of evaluation C(X,Y) × X → Y, available for compact Hausdorff X (Hatcher A.14, p.530). So C(X,Y) ≃ C(X,K) and Milnor Theorem 3 (milnor1959 printed p.276) applies to K. For Y the Sierpiński space the statement holds with K a point. Unchanged since the previous review (its R03).

**Repair:** Drop `[T2Space Y]` from the theorem and “Hausdorff Y” from `README.md:3010`; keep `[T2Space X]` with the reason the docstring gives.

## R05 (P3) — Name the carriers two consumers cite by deleted Lean names

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:3251`–`:3270` (“The objects consumers cite are carried by the following sections”).

**Claim:** The list covers the objects consumers cite.

**Witness:** On main, `TauCetiRoadmap/GeneralizedCohomology/README.md:229`–`:239` cites `simplicialRealizationCW`, `simplicialGroupKan`, `simplicialGroupMooreHomotopyIso`, `kanRealizationUnitHomotopyIso`, `ordinaryEMRepresentability` and `ordinaryEMLoopComparison`; `TauCetiRoadmap/HeegaardFloer/README.md:586` cites `compactTriadPoincareLefschetz`. None is declared in this head's `Suggested.lean` (correctly: it states headlines only), and the list names neither consumer's carriers. Unchanged since the previous review (its R04).

**Repair:** Add two bullets: “GeneralizedCohomology (G2.1) consumes §4.7's realization CW structure, §8.2's Kan/Moore/realization-unit comparisons, §8.10's representability and §8.11b's loop comparison” and “HeegaardFloer consumes §6.4's compact-triad Poincaré–Lefschetz theorem”. Repointing the consumers' Lean-name citations is their edit.

## R06 (P3) — The Tau Ceti pin now supplies the homology cross product §5.1 builds on

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:282`–`:284` (supplier contract): “Native `TopCat.eilenbergZilberHomotopyEquiv`, Alexander–Whitney and shuffle maps in `Singular.EilenbergZilber`/`AlexanderWhitney`/`Shuffle`; the missing local-coefficient and Kunneth extensions use these maps”; `:1351`–`:1364` (§5.1): “For a field `k`, prove that the cross product gives `directSum_(i+j=n) H_i(X;k) tensor H_j(Y;k) ~= H_n(X times Y;k)`”.

**Claim:** The pinned library supplies only the chain-level Alexander–Whitney, shuffle and Eilenberg–Zilber maps, so the cross product on homology, with its naturality and its comparison with the chain-level maps, is built here.

**Witness:** At the checkout's Tau Ceti pin `358314d4`, `TauCeti/AlgebraicTopology/Singular/CrossProduct.lean:73` defines `TopCat.singularHomologyCross X Y R S p q n h : H_p(X;R) ⊗ H_q(Y;S) ⟶ H_n(X × Y; R ⊗ S)` (the algebraic `homologyCross` followed by the shuffle map) and proves its value on cycle classes (`homologyπ_tensorHom_singularHomologyCross`), naturality in the spaces and in the coefficients, and `singularHomologyCross_comp_homologyMap_alexanderWhitney`; its header states that the field Künneth isomorphism reduces to the algebraic cross-product statement. The file is new between the pins (`git diff --stat a91d3aa..358314d4` lists it as 202 added lines), which is why the previous review, at the old pin, found nothing to cite. The contract's generality is the native one: a preadditive monoidal category with homology, `w`-small coproducts and tensoring preserving the relevant coequalizers, which `ModuleCat` satisfies by instance search.

**Repair:** In the contract bullet at `:282` add `TopCat.singularHomologyCross`, its cycle-class formula, its two naturality lemmas and `singularHomologyCross_comp_homologyMap_alexanderWhitney` in `TauCeti/AlgebraicTopology/Singular/CrossProduct.lean`, and state §5.1's field isomorphism and the hereditary-ring short exact sequence on that native map (the direct sum over `i + j = n` of `singularHomologyCross X Y k k i j n rfl`), leaving to §5.1 the Künneth spectral sequence, the Tor term, the splitting and the local-coefficient and relative extensions, which the pin does not have (no `Kunneth`, `kunneth` or `Tor` statement in that directory at the pin).

## Previous findings

- R01 — not repaired: `README.md:986` still reads “(Theorem 3.11, p.215)”; carried as R02.
- R02 — not repaired: `README.md:121`–`:124`, `:3243`–`:3245` and `:3341`–`:3344` are verbatim as at f285cc1; carried as R03.
- R03 — not repaired: `Suggested.lean:309` still has `[T2Space Y]` and `README.md:3010` “Hausdorff Y”; carried as R04.
- R04 — not repaired: `README.md:3251`–`:3270` lists MorseTheory, DGFloer, RiemannianGeometry, CharacteristicClasses, GeneralizedCohomology (Hopf quotient only), BanachAlgebras, AffineMorseLefschetz, FuchsianOrbifolds, HeegaardFloer and HomotopySpheres for §8.7, but not the G2.1 or compact-triad carriers; carried as R05.

No repair report marks any finding “not actionable in this package”.

## Verified sound

**Scope of this round.** Incremental re-review of 0 changed lines since f285cc1 (`changes.md`: empty diff). `git diff --stat origin/main...HEAD` outside the folder is empty from the checkout (origin/main a0ad405 is the merge base); the long file list in the worker's change summary is main's own history brought in by the merge commit, not changes of this pull request. I re-ran the gate and the dependency check, rebuilt the module, elaborated a probe copy at the new pins, re-checked every library name the README cites against Mathlib `f6090c70` and Tau Ceti `358314d4`, re-resolved every supplier citation on main a0ad405, diffed Tau Ceti between the two pins for new owners of this roadmap's objects, and checked the seeded targets the previous review's source table did not cover (1.1, 1.6, 4.1, 4.7, 5.2, 8.6), carrying its rows for the rest.

**Gate, dependency check, build.** The brief's text gate at this head prints every counter zero and `OK` (`set_option`, `sorry-data`, `imports`, `readme-ids-missing`, `stray-files`, `outside-folder`, `dirty` all 0); the worker's gate adds `build=1 FAIL` for the Lake warning of R01, which I reproduced with the targeted build (exit 0, 18 `sorry` warnings, one module-system warning). The dependency command returned

```text
depcheck: 235 roadmaps, 2068 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line.

**Elaboration and padding.** The probe copy described under R01 (module-system header, one-tactic replacement of every `sorry`, `#check @name` for all 31 declarations) elaborated with `lake env lean` from the checkout, exit 0 in 20 s. All 18 admitted theorems still report `declaration uses 'sorry'`, so none closes by `rfl`, `simp`, `infer_instance`, `decide` or `trivial` at the new pins. The 31 elaborated types agree with the worker's `signatures.md` and with the README statements, and every instance argument occurs in its type (no lost section binder): for instance `poincareDuality_twoTorsionCoefficients` carries `[T2Space M] [CompactSpace M] [ConnectedSpace M]` and `2 = 0 →`, `finiteSourceMappingCWType` carries `[CompactSpace X] [T2Space X] [T2Space Y]`, `properStrongDeformationRetract_of_inverse` carries `[T2Space X] [LocallyCompactSpace X]`. Lean form unchanged: single `import Mathlib` plus five existing `TauCeti.*` modules (all five exist at `358314d4`, the build imports them), one module docstring naming the non-statable headlines, `theorem` throughout, no `set_option`, `lemma`, `#eval`, `#print axioms`, `True` placeholder or sorried data.

**Library names at the new pins.** Every backticked library declaration in the README (150 candidates after excluding this roadmap's 31 own names and module names) was grepped in the pinned Mathlib and Tau Ceti: all exist. Spot list with file at the pin: `TopologicalSpace.compactlyGenerated` (`Mathlib/Topology/Compactness/CompactlyGeneratedSpace.lean`), `isQuotientCoveringMap_iff_isCoveringMap_and` (`Mathlib/Topology/Covering/Quotient.lean:336`), `isClosed_fixedPoints` (`Mathlib/Dynamics/FixedPoints/Topology.lean`), `IsOpenCover` (`Mathlib/Topology/Sets/OpenCover.lean:27`), `SingleObj.comp_as_mul` (`Mathlib/CategoryTheory/SingleObj.lean`), `TopPair.singularHomologyMap` (`TauCeti/AlgebraicTopology/Singular/Relative.lean:228`), `TopPair.singularHomologyInclIso` (`Singular/Empty.lean`), `twistedChainComplex`/`twistedHomology`/`twistedHomologyMap` (`Singular/Twisted/Basic.lean`, `Relative.lean`, `Functoriality.lean`), `LocalCoefficientSystem.twistedCochainComplex` (`Cohomology/Twisted/Basic.lean:79`) and `TopPair.twistedCochainComplex` (`Cohomology/Twisted/Relative.lean:77`), `cechDiagram`/`cechCocone` (`FundamentalGroupoid/Cech/Diagram.lean:44`, `:66`) and `isColimitCechCocone` (`Cech/Colimit.lean:141`, hypothesis `IsOpenCover U`, as §1.1 states), `FundamentalGroup.cast_map_prod_mul` (`FundamentalGroup/TopologicalMonoid.lean`), `HomotopyGroup.pathLoopSpaceMulEquiv` (`Topology/Homotopy/HomotopyGroup/LoopSpace.lean`), `exists_strong_deformation_retraction` (`Extension/DeformationRetract.lean`), `hasHomotopyExtensionProperty_range_incl` (`Extension/MappingCylinder.lean`), `hasHomotopyExtensionProperty_base` (`Extension/CWComplex.lean`), `isZero_reducedSingularHomologyFunctor_of_contractibleSpace` (`Singular/Contractible.lean`), `finsum_finrank_singularHomology_of_finite_cwComplex` (`Cellular/EulerCharacteristic/Singular.lean`), `TauCeti.IsEilenbergMacLaneSpaceOne` and `AddCircle.isEilenbergMacLaneSpaceOne` (`EilenbergMacLane/Basic.lean`, `UniversalCover/Classification/EilenbergMacLane.lean`), `TopCat.singularCohomology` (`Cohomology/Relative.lean`), `singularHomologyPretheory` (`Singular/HomologyPretheory.lean`), `groupCohomology.inhomogeneousCochains` and `groupHomology.inhomogeneousChains` (`Mathlib/RepresentationTheory/Homological/…/Basic.lean`). The Tau Ceti diff `a91d3aa..358314d4` under `AlgebraicTopology/` and `Topology/Homotopy/` (59 files, 5495 insertions) removed only `mono_twistedChainsMap_app` from `Singular/Twisted/Basic.lean`, which the README does not cite; it added `Singular/CrossProduct.lean` (R06), `singularHomologyIso` in `Singular/Homotopy/Invariance.lean`, and the abstract-simplicial-complex realization, locally finite polyhedron, gluing-homotopy and stellar-subdivision modules under `SimplicialComplex/`, whose headers name GeometricTopology Layer 11 as their roadmap; none mentions `CWComplex`, so they do not supply §4.7's realization CW structure on simplicial sets, §8.7's local-finiteness predicate on CW models, or any other carrier the docstring lists as missing. No `Hurewicz`, relative homotopy group, orientation local system, `lim¹`/Mittag–Leffler, EM family, proper-homotopy or Poincaré-duality declaration exists in Tau Ceti at `358314d4` (grep over `TauCeti/`), so the docstring's list of non-statable headlines is still accurate at the new pin, and no statable headline is absent.

**Suppliers and consumers on main a0ad405.** `tauceti-roadmap roadmaps resolve` lists no cross-roadmap citation or Lean name found nowhere. Resolved by hand: DerivedModuleAlgebra §1.T.1 (`TauCetiRoadmap/DerivedModuleAlgebra/README.md:1403`, with `:29`–`:30` naming AlgebraicTopology as the consumer of the tower foundation and assigning the topological adapters to it); GeneralizedCohomology G2.1 `realizationProductKelleyComparison` (`GeneralizedCohomology/README.md:234`); DGFloer Layer 1 (`DGFloer/README.md:442`, `arbitraryBaseSerreSpectralSequence` at `:533`) and Layer 2 (`:837`); ClassifyingSpaces Stage 3 (`:177`) and Stage 4 (`:222`); CharacteristicClasses C1.2a (`:331`) and its consumption of Stage 6 (`:411`); TopologicalKTheory T1.6 (`:26`, `:66`); ComplexKahlerGeometry K7.1 (`:1407`); GeometricTopology's smooth triangulation (`:939`); DifferentialGeometry `orientationAt` (`:349`), `boundaryOrientation` (`:509`) and 9.3 `poincareDuality` as consumer (`:872`); UniversalCovers in `Completed/`. All are on main and precede this roadmap in the merge order (depcheck 0 problems). HomotopySpheres, FourManifolds and ImplicitAtlases remain cited only as consumers or scope deferrals, never in a `*Needs:*` line or supplier table.

**Seeded source audit.** Texts read from the worker's cache: hatcher (printed page = PDF marker − 9), brown, milnor1959. No passage is copied.

| Target | Locator and text checked | Assessment |
|---|---|---|
| 1.1 | Native `cechDiagram`, `cechCocone`, `isColimitCechCocone` with `IsOpenCover` (pin files above); Brown 6.7.2 (brown line 9424, p.240), 3.6.4 (line 3995, p.91) per the previous review | Locators and pinned names correct. |
| 1.5 | Brown 6.7.2, 3.6.4; Hatcher 1.20 (hatcher line 1956, p.43) | Carried from the previous review: correct. |
| 1.6 | Hatcher §3.C, p.281 (hatcher line 12154, marker 290): H-spaces, pointwise product versus concatenation | Correct. |
| 2.5 | Hatcher 3B.1 (pp.269–270), 3B.6 (p.275), 3.27 (p.236) | Carried: correct. |
| 2.7 | Hatcher Corollary 2.15, p.114 (line 18 of the section) | Carried: correct. |
| 4.1 | Native `cellularChainGroupIso` (`Cellular/Coproduct.lean`), `RelCWComplex.cell`; cellular boundary formula p.140, Lemma 2.34 p.137 | Correct; the pin's comparison is finite-dimensional, as the contract says. |
| 4.7 | Hatcher Propositions 0.16, 0.19 (pp.15–16), Lemma 2.34 (p.137), Theorem 2.35 (p.139), p.140, Theorem 4.8 (p.349) | Carried (all checked at the stated pages in the previous review): correct. |
| 5.1 | Hatcher 3B.5 (p.274), 3B.6 (p.275) | Carried: correct for the PID statement; R06 is about the pinned carrier, not the source. |
| 5.2 | Mapping-cone model of the mapping torus; no page locator in the section (the Wang sequence is derived here from §5.1 and native cones) | Statement checked by computation below. |
| 6.0 | Hatcher A.1 (p.520), 3.5 (p.203); DerivedModuleAlgebra §1.T.1 | Carried: correct. |
| 6.2 | Native `ContinuousMap.Nullhomotopic`, `TopologicalSpace.Opens`, `LocallyContractibleSpace` (pin) | Carried: correct. |
| 7.1 | Native `finsum_finrank_singularHomology_of_finite_cwComplex` (pin) | Carried: correct. |
| 7.4 | ComplexKahlerGeometry K7.1 (`:1407`) | Resolved on main. |
| 8.2 | Native `SSet.KanComplex`, `normalizedMooreComplex`, `sSetTopAdj`, `SingleObj.comp_as_mul` (pin) | Carried: correct. |
| 8.6 | Hatcher §4.1, p.340 (hatcher lines 14822–14847, marker 349): (Iⁿ,∂Iⁿ) → (X,x₀), I⁰ a point with empty boundary, Iⁿ/∂Iⁿ = Sⁿ | Correct; the n = 0 clause matches the README's separate n = 0 comparison. |

**Adversarial computations.** Rows for the sampled targets not computed in the previous review are new; the others cite PRREVIEW-AlgebraicTopology~8 (“r8”), whose values I re-derived where marked. 0 denotes the trivial group or module.

| Statement | Instances tried | Values on the two sides / discriminating value | Result; change |
|---|---|---|---|
| 1.1 Čech colimit | Empty cover of ∅; one open U = X; two arcs on S¹ | Colimit of the empty `Grpd` diagram is the empty groupoid = Π₁(∅); one-element `CechIndex` gives Π₁(X) itself; two arcs with two-component intersection give ℤ as the groupoid colimit, 0 if the intersection were collapsed to one object | New; retain groupoid (not group) colimit |
| 1.5 wedge values, two-arc circle | 0, 1, 2 circles; two arcs | 1, ℤ, F₂; ℤ vs 0 | r8 rows; retain |
| 1.6 pointwise product | U(1), windings m, n; squaring map | m+n; 2(m+n) = 2m+2n vs 2m+n | r8 row; retain |
| 1.6 SO(3) Check | π₁(SO(3),1) = ℤ/2, class a ≠ 0 | Pointwise product a·a = 2a = 0, the double cover SU(2) → SO(3) lifts the squared loop to a closed loop; a model with a·a = a would contradict the group law | New; retain |
| 2.5 interval, square, radial map, S⁰ reference | As in r8 | ∂ = [1]−[0]; right−left−top+bottom; (1/√2,1/√2), 0 ↦ 0; (+1,−1) vs (+1,+1) | r8 rows; retain |
| 2.7 Brouwer headline | Point; I with f(t) = 1−t; ∅; translation on ℝ | 0; 1/2; no point; none (noncompact) | r8 row; retain nonempty, compact |
| 4.1 cellular chain groups | No n-cells; countable wedge of circles, degree 1; finite complex | 0; ⊕ℕ R (finite support), not ∏ℕ R; ⊕ = ∏ | New; retain finite support |
| 4.3 comparison headline | Wedge of one Sⁿ per n ≥ 1; A = X; point | ℤ in every positive degree, no finite dimension; 0; M | r8 row; retain |
| 4.7 orientation homeomorphism | n = 1, z = ±1; n = 2, z = (1,0); z = 0 | w = (−1,1), r = m = 1, weights 1/2 + w_i/2 = (0,1) = e₁; z = −1 gives (1,0) = e₀, so [1]−[−1] ↦ [e₁]−[e₀], coefficient +1 (reflection −1); w = (−1,1,0), weights 1/3 + w_i/3 = (0,2/3,1/3) on the face opposite e₀; z = 0 ↦ centroid; for z ≠ 0, Σw_i = 0 and w ≠ 0 force m > 0 | New; agrees with the README's three values; retain |
| 4.7 cell counts | Δ[0], Δ[1], ∂Δ[2], Δ[2]/∂Δ[2] | 1 cell; 2 vertices + 1 edge, χ = 1; 3 + 3, χ = 0; 1 + 1, H₂ = ℤ; degenerate simplices would give infinitely many cells | New; retain nondegenerate cells |
| 5.1 Künneth | T² over 𝔽₂, 𝔽₃; RP²×RP² over ℤ, degree 3; R = 𝔽₂[ε]/ε² | Betti (1,2,1); Tor₁(ℤ/2,ℤ/2) = ℤ/2 = H₃; Tor_p ≠ 0 for all p | r8 rows; retain; R06 changes the carrier only |
| 5.2 Wang sequence | Mapping torus of id on X = S¹ (T²); of the reflection on S¹ (Klein bottle) | id − f_* = 0 and H₁(T²) = ℤ ⊕ ℤ from 0 → H₁(S¹) → H₁ → H₀(S¹) → 0; id − f_* = 1−(−1) = 2 on H₁(S¹), 0 on H₀, giving 0 → ℤ/2 → H₁(K) → ℤ → 0, H₁(K) = ℤ ⊕ ℤ/2; the sign id + f_* would give 2 on the torus, H₁(T²) ⊇ ℤ/2, false | New; retain id − f_* |
| 5.3 transfer headline | Two-sheet cover of a point over ℤ, 𝔽₂; ∅ → B; z ↦ z³ | tr(1) = (1,1), p∗tr = 2; tr = 0; p∗ = 3, tr = 1 | r8 row; retain |
| 6.0 towers | Point tower; circle tower; extension by zero; countable wedge; ×2 tower | δ(3,1,0,…) = (2,1,0,…); limit M, H¹ = M; δ(e) = 1; ∏ vs ⊕; 3x₀ = −1 impossible | r8 rows; retain |
| 6.2 LS carriers and headline | Point; S¹; ∅; zero ring; T² | Cup-length 0, 1, 0, 0; counts 1, 2, 0, ≥ 1; 1+1 ≤ 2, 2+1 ≤ 3, 0+1 ≤ 2 | r8 rows; retain |
| 6.3 local generator, boundary sign, ρₙ | As in r8 | det(I+J) = 1+m; (−1)^m; (−1)ⁿ | r8 rows; retain |
| 6.4 characteristic-two headline and controls | S¹, RP² over 𝔽₂; RP² over ℤ, ℤ/4; D² | Caps bijective; H⁰ = ℤ vs H₂ = 0; ℤ/4 vs ℤ/2; relative R, R, 0 | r8 rows; retain 2 = 0 |
| 6.5 symmetry and lens spaces | (3,1), (5,2); L(5,1), L(5,2) | 4, 9; −1/5, −2/5 vs +1/5, +2/5 | r8 rows; retain |
| 7.1 Euler definition | ∅, point, interval, subdivided circle, S² | 0, 1, 2−1, 2−2, 1+1 | r8 row, re-derived; retain |
| 7.2–7.3 headlines | I ≃ *; S²×S²; ∅×S²; Hopf; Klein bottle over S¹; S² → RP²; ∅ → B | 1; 4 = 2·2; 0; 0 = 2·0; 0 = 0·0; 2 = 2·1; 0 | r8 rows; retain |
| 7.4 values | Sⁿ, Tⁿ, CPⁿ | 1+(−1)ⁿ; 0 for n > 0, T⁰ gives 1; n+1 | r8 row; retain n > 0 |
| 8.2 nerve order | g = (12), h = (23) | hg = (132): 1 ↦ 3; gh = (123): 1 ↦ 2 | r8 row; retain |
| 8.2 constant simplicial group | G₀ = S₃ | All faces identity, N_n = 0 for n ≥ 1, π₀ = S₃ nonabelian, π_n = 0 | New; retain nonabelian π₀ |
| 8.2 Moore complex of ℤ[Δ¹/∂Δ¹] | Degrees 0, 1, 2 | d₁e = v = d₁s₀v so N₁ = ℤ(e − s₀v), d₀(e − s₀v) = v − v = 0, N₂ = 0; π₀ = π₁ = ℤ, π_n = 0 for n ≥ 2 = H_*(S¹); unnormalized ℤ{e,s₀v} = ℤ² and ℤ{s₀s₀v,s₀e,s₁e} = ℤ³ | New; matches the Check; retain normalized identification |
| 8.3–8.4 Hurewicz normalization | S¹ degree k; S² antipodal; (ℝ,(0,1)); (D²,S¹∨S¹) | k·[S¹]; −1; all 0; F₂ → ℤ² | r8 rows; retain |
| 8.5 Whitehead and proper SDR headlines | S¹ degrees 1, 2; ∅ → *; A = {0} ⊂ I, ⊂ ℝ | ×1 vs ×2; π₀ 0 → 1; compact vs noncompact preimage | r8 rows; retain |
| 8.6 sphere normalization | n = 1; n = 0 | I/∂I = S¹ with basepoint the positive first-coordinate pole; I⁰ a point with ∂I⁰ = ∅ (Hatcher p.340), so the quotient statement is n ≥ 1 and n = 0 is the separate comparison the README names | New; retain n ≥ 1 |
| 8.7 CW-type headlines and recognition | ∅; circle; two points; D²; ℝ; Sⁿ; Poincaré sphere; n = 0, 1 | As in r8 | r8 rows; retain |
| 8.8 K(G,1) headline | G = 1, ℤ, S₃ | π₁ = G, π₂ = 0; abelianizing S₃ gives order 2 | r8 row; retain |
| 8.11 mapping-space headline | X = ∅; point; Y Sierpiński with a point model | point; Y; C(X,Y) ≃ point without T2 on Y | r8 row; R04 |
| 8.12 EM classics | RP¹, CP¹ vs RP∞, CP∞ | ℤ, ℤ; ℤ/2 in degree 1, ℤ in degree 2 | r8 row; retain |

**Ownership against open work.** Unchanged from the previous review for the folder's objects (compact generation owned in Layer 4.0 with HomotopySpheres' duplicate recorded as its repair; module towers imported from DerivedModuleAlgebra; raw Čech refinements owned by TopologicalSheafCohomology). The sibling checkouts the brief lists were not re-read for this 0-line change beyond HomotopySpheres (R03) and AlgebraicTopologyPartII (its Scope still consumes Stages 2–8 and plans configuration cohomology); the between-pin Tau Ceti additions were checked by object as recorded above. Packages on the board (AnalyticNumberTheory, AutomorphicCongruences, KatoEulerSystems, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) are unrelated by subject.

## Not verifiable

- **eilenberg-steenrod**, **whitehead**, **dold**, **may**, **mccleary**, **weibel**, **brown-cohomology**, **freedman-quinn**: no legal full text in the worker's cache and none found at author, institutional or open-publisher locations by the previous rounds; the statements they back were checked against Hatcher and the pinned declarations as in the previous review, and nothing in this 0-line change touches them.
- **thom1954**, **lee**: settled as uncertified in the manifest; cited by locator only.

## Source issues

- **Misprint** in milnor1959 at proof of Theorem 2, implication (c)⇒(d), printed page 276: the source says the weak/strong comparison completes the proof of Theorem 3; it should be Theorem 2; affects nothing.
- **Misprint** in milnor1959 at proof of Corollary 3, printed page 276: the source says Theorem 4 asserts the triad statement; it should be Theorem 3; affects nothing.
