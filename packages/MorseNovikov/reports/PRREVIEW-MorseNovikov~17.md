# Review of MorseNovikov (pull request #1161 at 3a07f9f)

**Verdict:** needs changes

This is a full review, not an incremental one: the folder changed by 2825 lines since `e06d4d0`, mostly through the merge of main. The previous review's only finding (its R01, a locator) is partly repaired; it is re-stated below as R07.

What passes:
- The gate passes on my own run, and the dependency check reports no problem.
- `Suggested.lean` elaborates with only the `sorry` warnings.
- Every cross-roadmap and pinned-library citation resolves.
- Of the fifteen sampled targets, fourteen agree with their texts and one (§7.3, a book) is not verifiable.
- The two headline statements survive every computed instance in the adversarial table.

There are seven findings, all P3 and none blocking. Two are about the acceptance test (R01, R02). One is a target rebuilt from a supplier on main (R03), and one is a pinned predicate that is not cited (R04). The other three are a definition with no Checks (R05) and four locators (R06, R07).

The pins have moved since the previous review: Mathlib is now `1b1ccf4b` and Tau Ceti `2fd255d`. At the new Tau Ceti pin, much of Layers 1, 4 and 5 is already formalised: `TauCeti.NovikovSeries`, Reidemeister torsion and the orbit zeta function. Pull request #1854 rewrites this README to consume those declarations. The generated merge-order block orders this pull request first (`MorseNovikov`: this pull request → #1854), and #1854 is rebased onto it. So this review does not ask for the Layer 1–5 rewrites again. It flags only defects in text this pull request rewrites (R01, R02, R04, R05) or that #1854 leaves unchanged (R03, R06, R07).

## R01 (P3) — The module docstring names as missing carriers that the pinned Tau Ceti has

**Location.** `TauCetiRoadmap/MorseNovikov/Suggested.lean:20–27`: "Layer 1's completion and universal property lack the period-controlled completed group ring and topology. … Layer 4's … lack the based determinant-line torsion construction and the Novikov ring. Layer 5's integral zeta product … lack the periodic orbit counting series".

**Claim.** These headlines are not statable because their carriers are absent at the pins.

**Witness.** All of the following are at the pinned Tau Ceti `2fd255d`:
- `TauCeti.NovikovSeries` (`RingTheory/NovikovSeries/Basic.lean:92`);
- `TauCeti.NovikovSeries.completionPkg` (`Topology.lean:349`);
- `HomologicalComplex.reidemeisterTorsion` (`Algebra/Homology/ReidemeisterTorsion/Basic.lean:291`);
- `TauCeti.NovikovSeries.orbitZeta` (`OrbitZeta.lean:104`) and `orbitZeta_eq_mapRingHom_eulerProduct` (`:264`).

**Repair.** Rewrite the docstring's second paragraph so that it does two things.
- It names the pinned declarations as consumed:
  - Layer 1: `NovikovSeries`, `completionPkg`, `mapRingHom` (`Functoriality.lean:184`) and `isDomain_of_fg` (`LeadingTerm.lean:266`);
  - Layer 4: `reidemeisterTorsion` and `componentwiseReidemeisterTorsion`;
  - Layer 5: `orbitZeta` and its Euler product.
- It names as missing only what is actually absent: the Novikov complex of a closed one-form built from signed trajectory counts, the periodic-orbit data of −α♯, a based cellular torsion of an abelian cover, and the Euler-structure torsor.

#1854's head already has such a paragraph (its `Suggested.lean`, lines 12–37). Taking it verbatim leaves #1854 nothing to re-apply there. The README's Layer 1–5 citations and its Scope sentence "The completed ring, … based Novikov torsion, orbit zeta series … are constructions of this roadmap" stay with #1854.

**Tested.** A grep of the pinned Tau Ceti for a Novikov complex, an Euler structure, or a closed-orbit zeta function of a vector field finds none. The only trajectory count is `TauCeti.morseTrajectoryCount` (`Analysis/Calculus/Morse/Boundary/Basic.lean:120`), which counts mod 2 on a vector space.

## R02 (P3) — The `AbelianCoverHomology` section is padding, and the README says the file has no such declarations

**Location.**
- `Suggested.lean:140–171`: `doubling`, `fiberMap`, `doubling_injective`, `fiberMap_eq_zero`, `fiberMap_not_injective`.
- `README.md:1485–1487`: "Its supporting definitions are `fixedPointDet`, `fixedPointSign`, `rationalHomologyMap`, `zeroDet`, `zeroSign` and `rationalBetti`; all other constructions and API targets are specified in this README."

**Claim.** Implicitly, these declarations belong in the acceptance test.

**Witness.** On a scratch copy each theorem closes with one tactic line:
- `doubling_injective`: `intro a b h; simpa [doubling] using h`;
- `fiberMap_eq_zero`: `ext <;> simp [fiberMap, doubling] <;> rfl`;
- `fiberMap_not_injective`: `intro h; simpa using h (a₁ := 0) (a₂ := 1) (by rw [fiberMap_eq_zero]; rfl)`.

No README line names any of the five declarations.

**Repair.**
- Delete `Suggested.lean:140–171` and the docstring's last paragraph (lines 33–34).
- Keep §2.3's calibration where it already is, as prose (`README.md:447–449`).

#1854 deletes the same section.

**Tested.** The scratch copy with the section deleted elaborates (exit 0, only the two headline `sorry` warnings). The sentence at `README.md:1485–1487` then matches the file.

## R03 (P3) — §6.4 rebuilds GeometricTopology §4.4's Alexander module and its presentation comparison

**Location.** `README.md:1236–1238`: "Build the knot-complement cellular/Fox or Seifert-matrix Alexander module, prove the polynomial/module presentation comparison, and attach the filling chain complex."

**Claim.** This roadmap constructs the Alexander module and the comparison between the polynomial and the module presentation.

**Witness.** GeometricTopology §4.4 on main (`TauCetiRoadmap/GeometricTopology/README.md:2740–2750`) already does this:
- it defines the Alexander module H₁(X∞;ℤ);
- it proves the Seifert presentation `tV − Vᵀ`, the Fox computation and the agreement of the routes;
- it makes Δ_K the order of the module.

**Repair.** This roadmap already consumes GT Layers 4–5 (`README.md:184`), so the change is to cite rather than rebuild.
- Consume GeometricTopology §4.4 for the module, its Seifert and Fox presentations, and Δ_K as its order. Name §4.4 in the "From TauCetiRoadmap.GeometricTopology" contract (`README.md:184`) and in §6.4's *Needs:* (`README.md:1260`).
- Keep here only three things: the based equivariant cellular complex of X̃_K, its identification with GT's presentation, and the filling cells.

FourManifolds (an open pull request) cites this module as N6's (its `README.md:176`). It would then repoint to GT §4.4.

**Tested.** For the trefoil, GT's Seifert route gives everything §6.4's Check needs. With V = [[−1,1],[0,−1]], det(tV − Vᵀ) = (1−t)² + t = t² − t + 1, which Conway-normalises to t⁻¹ − 1 + t, the numerator in §6.4's Check (`README.md:1256`).

## R04 (P3) — §6.5 restates the pinned nondegenerate-fixed-point predicate and its finiteness theorem without citing them

**Location.**
- `Suggested.lean:75–76`: "The fixed set is finite under these hypotheses, so the finite sum is the actual signed count."
- `README.md:1320–1322`: §6.5's *Needs:* names only `mfderiv`, `LinearMap.det`, `LinearMap.trace`, `TopPair.incl` and `TopPair.singularHomologyMap`.
- `Suggested.lean:88`: `hnd` is stated as `fixedPointDet I f x ≠ 0`.

**Claim.** Nondegeneracy and the finiteness of the fixed set are new here.

**Witness.**
- `TauCeti.IsNondegenerateFixedPt` (`Geometry/Manifold/MFDeriv/FixedPoint.lean:74`).
- `TauCeti.finite_fixedPoints_of_isNondegenerateFixedPt` (`:146`): if M is compact and T2, the model is finite-dimensional, f is continuous and every fixed point is nondegenerate, then `(fixedPoints f).Finite`.

**Repair.**
- Name both declarations in "From Tau Ceti" (`README.md:117–138`) and in §6.5's *Needs:*.
- Add the API bullet: "for smooth f and a fixed point x, `fixedPointDet` ≠ 0 iff `IsNondegenerateFixedPt`". In finite dimension, det(1−D) ≠ 0 iff 1−D is injective.
- Cite the finiteness theorem in the docstring at line 75.
- Optionally state `hnd` as `∀ x ∈ Function.fixedPoints f, TauCeti.IsNondegenerateFixedPt I f x`, with `public import TauCeti.Geometry.Manifold.MFDeriv.FixedPoint`.

**Tested.**
- On the identity of S¹, det(1−1) = 0 and every tangent vector is fixed, so both conditions fail.
- On the reflection z ↦ z̄, det(1−(−1)) = 2 and only v = 0 is fixed, so both hold.
- The optional form, with the module built by `lake build TauCeti.Geometry.Manifold.MFDeriv.FixedPoint`, elaborates (exit 0).
- `finite_fixedPoints_of_isNondegenerateFixedPt hf hnd` closes `(Function.fixedPoints f).Finite` under exactly the headline's hypotheses.

## R05 (P3) — `rationalBetti` has neither API nor Checks, and §6.5 has two consecutive Checks blocks

**Location.**
- `README.md:1424–1427`: the definition of `rationalBetti`, followed at line 1429 by "Prove `poincare_hopf`".
- `README.md:1306` and `1312`: two **Checks.** headings in a row.

**Claim.** The definitions here carry their API and at least three discriminating Checks.

**Witness.**
- Lines 1424–1427 are one sentence; the next **Checks.** (line 1438) tests `poincare_hopf`.
- The block at line 1312 tests `lefschetz_fixed_point_formula` (stated at line 1266), after `rationalHomologyMap`'s Checks.

**Repair.**
- Give `rationalBetti` API bullets:
  - finite for compact M;
  - zero above dim M;
  - invariant under homotopy equivalence;
  - its alternating sum equals `TauCeti.eulerChar M` when `[FiniteCWType M]`, by `TauCeti.eulerChar_eq_finsum_finrank_singularHomology` (`AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean:133`).
- Give it three Checks:
  - a point gives (1);
  - the circle gives (1,1), with alternating sum 0;
  - ℝP² gives (1,0,0), where 𝔽₂-coefficients would give (1,1,1).
- Head the block at line 1312 as the formula's Checks, or move it directly after the theorem's paragraph (lines 1264–1281).

## R06 (P3) — Four rt3 locators: wrong pages for §4, a missing locator for the large-gradient step, and a sketch cited as a result

**Location.**
- `README.md:1139`: "Use rt3 Lemmas 2.7–2.9, pp. 220–221 and §4, pp. 237–238".
- `README.md:591–599`: §3.3's large-gradient comparison carries no locator for that step.
- `README.md:1389`: "the refined equality is equation (1.5), p. 215".

**Witness.**
- rt3 §4 begins on p. 235 (line 1624, footer at 1637), with Lemma 4.1 at line 1634; Theorem B's proof ends on p. 236 (line 1702).
- rt3 line 345 only "sketch[es]" (1.5); Remark 4.3 (line 1712, p. 237) makes it depend on Example 1.8.

**Repair.**
- §6.3: write "§4, Lemma 4.1 and the deduction of Theorem B, pp. 235–236".
- §3.3: cite "rt3 Lemma 4.1, p. 235" for the large-gradient comparison.
- §7.2: say that rt3 states (1.5) with a proof sketch (p. 215), that Remark 4.3 (p. 237) makes the sketch depend on Example 1.8, and that the refined equality is therefore constructed here.

## R07 (P3) — The previous review's R01 is only partly repaired: `zeroSign`'s docstring still cites a page that does not state the sign

**Location.** `Suggested.lean:108–110`: "so that at a nondegenerate zero it is `sgn det(dv_p)`, the Poincaré–Hopf index (Hutchings, Forum Math. 14 (2002), Appendix B, p. 241, the sign of a nondegenerate zero)". README §7.3's API bullet 2 (line 1415) states the same convention with no locator.

**Claim.** rt3, p. 241, states the sign convention for a nondegenerate zero.

**Witness.**
- rt3 lines 1953–1956 (p. 241) say only that v⁻¹(0) is "oriented in the standard way".
- The one explicit sign, (−1)^i at the sink of an i-simplex, is at rt3 lines 2047–2049, on p. 242.

**Repair.**
- Cite Milnor, *Topology from the Differentiable Viewpoint*, §6, for the convention: a nondegenerate zero has index +1 or −1 according to the sign of det(dv_z). Put the citation in the docstring and at `README.md:1415`.
- Keep rt3 p. 242 for the simplex sign.

At this head, §§7.1 and 7.3 cite Milnor §6, p. 35, only for the Poincaré–Hopf sum (`README.md:1354`, `1436`).

## Verified sound

### The previous review's finding

| Previous finding (at `e06d4d0`) | Passage at `3a07f9f` | Status |
|---|---|---|
| R01 (P3): the local-index sign has no locator that states it | README §7.1 now cites "Milnor, Topology from the Differentiable Viewpoint, §6, p. 35 for Poincaré–Hopf" (`:1354`). §7.3 cites the same (`:1436`). The `zeroSign` docstring (`Suggested.lean:108–110`) is unchanged. | partly repaired; the rest is R07 |

### Gate and dependency check

- **Gate, own run.** `gate MorseNovikov: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. It agrees with the worker's gate, which also reports `build=0`.
- **Dependency check.** Output: `depcheck: 234 roadmaps, 2263 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. Every supplier is on main.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/MorseNovikov'` is empty.

### Lean

- **Elaboration.** `lake env lean` on a scratch copy of `Suggested.lean`, with 13 `#check @name` lines appended, exits 0 in 4.7 s. The only diagnostics are five "declaration uses `sorry`" warnings (lines 83, 129, 160, 163, 166).
- **Elaborated signatures against the README.**
  - `lefschetz_fixed_point_formula` and `poincare_hopf` carry `[FiniteDimensional ℝ E] [I.Boundaryless] [IsManifold I ∞ M] [CompactSpace M] [T2Space M]`, with M in a universe `u_1` independent of E and H. This matches §6.5 and §7.3: compact Hausdorff, boundaryless model, any universe, with no second countability, orientation or connectedness.
  - `fixedPointDet` and `fixedPointSign` need only `ChartedSpace`.
  - `zeroDet` and `zeroSign` carry `[IsManifold I 1 M]`, which the theorem's `IsManifold I ∞ M` supplies.
  - `rationalHomologyMap` maps `(TopPair.incl.obj ↧M).singularHomology ↧(ULift.{u_1,0} ℚ) i` to itself.
  - No binder is lost, and I changed nothing.
- **One-tactic probe.**
  - Both headlines are left unsolved by `simp`, with the goal unchanged.
  - The three `AbelianCoverHomology` theorems close (R02).
  - The six supporting definitions are the minimum the two statements need.
- **Repair test.** Deleting the padding and stating `hnd` through `TauCeti.IsNondegenerateFixedPt` elaborates with exit 0 (R02, R04).

### Pinned declarations opened

Mathlib `1b1ccf4b`:
- `HahnSeries` (`RingTheory/HahnSeries/Basic.lean:52`);
- `LaurentSeries` (`RingTheory/LaurentSeries.lean:101`, `R⟦ℤ⟧`);
- `IsAddQuotientCoveringMap` (`Topology/Covering/Quotient.lean:29`, a `Prop` structure with no connectedness field);
- `TopPair.incl` (`Topology/Category/TopPair.lean:99`);
- `LinearMap.trace` (`LinearAlgebra/Trace.lean:75`);
- `LinearMap.det_eq_one_of_finrank_eq_zero` (`LinearAlgebra/Determinant.lean:283`), the dimension-0 value the Checks use.

The only `Lefschetz` hits in Mathlib are model-theoretic.

Tau Ceti `2fd255d`:
- `IsManifoldNondegenerateCriticalPoint` (`Geometry/Manifold/Morse/Basic.lean`), `manifoldMorseIndex` (`Morse/Index.lean`), `MorseChart` (`Morse/Lemma.lean:69`), `MorseChart.field` (`Morse/PseudoGradient/Existence.lean`).
- `Riemannian.Tensor.rieszDual` and `inner_rieszDual` (`VectorBundle/Riemannian/Riesz.lean:77`, `:85`).
- `exists_contMDiffAt_localFlow` (`IntegralCurve/SmoothFlow.lean:58`, which needs a finite-dimensional, boundaryless model).
- `isCompleteVectorField_of_compactSpace` (`Flow/Complete.lean:154`). It needs `T2Space`, `BoundarylessManifold`, `IsManifold I 1` and `CompleteSpace E`, which matches the contract's "C¹ fields on a compact boundaryless manifold".
- `TopPair.singularHomology` and `TopPair.singularHomologyMap` (`AlgebraicTopology/Singular/Relative.lean:295`, `:300`).
- `stableSet_eq_biUnion_orbit_localInvariantSet_Ici` (`Analysis/Calculus/Morse/LocalToGlobal.lean`) and `isMeagre_image_criticalPoints_of_isFredholm` (`Analysis/Fredholm/SardSmale.lean`).
- Neither pin has a smooth Lefschetz fixed-point theorem or a vector-field Poincaré–Hopf theorem.
- No pinned instance gives `FiniteCWType` for compact manifolds. So the statement through `rationalBetti` correctly avoids a hypothesis that `TauCeti.eulerChar` would need.

### Cross-roadmap citations resolved

On main (content `4452ffa`):
- **MorseTheory:** M1 (`:110`), M2 (`:144`, finite CW models at `:424–445`), M3, M4 (`:481`), M6 (`:895`).
- **HeegaardFloer:** Lane M (`:217`) with §§1.1–1.5 (`:300–467`); §1.5 (M.5), whose A₂ folds and signed elementary chain changes are at `:536–545`; §1.9 (M.9) (`:1162`, "the Morse Euler/index proof … the orientation-free Poincaré–Hopf theorem of MorseNovikov N7 is a downstream comparison target"); Layer 2 = F0 (`:1349`); §2.8 (F0.6) (`:1913`, with the section conjugacy, reverse branch and all positive iterates at `:1938–1946`). HeegaardFloer lists MorseNovikov only as a consumer (`:54`), so there is no two-way supply.
- **DifferentialGeometry:** Layers 0–3, 5, 6, 8, 10, 12 (`:268–910`). `closedForms`, `RoughForm`, `flowOf`, `toFlow` and `circleAngularForm` appear in its README and `Suggested.lean`.
- **AlgebraicTopology:** Stages 1–7 (`:289–1573`). Stage 4 items 2–3 are `cellularDifferential` and `cellularSingularHomologyIso` (`:512–515`).
- **DGFloer:** Layer 1 (`:451`), item 1 "Hurewicz in degree one" (`:462`).
- **UniversalCovers** (Completed): Stage 2 items 7 and 8 (`:107`, `:111`).
- **GeometricTopology:** Layers 1, 3, 4, 5, 11 (`:783, 1429, 1611, 5893, 7732`).

Downstream consumers, each verified to cite MorseNovikov:
- DGFloer §7.C (`:1343`) and §7.T (`:1375`, N1 and N4);
- TaubesGromov (`:15`, N1 and N4–N6);
- HamiltonianFloerOperations (`:16`, N1);
- at open heads: FukayaTheory (`:26`), GromovWittenTheory (N1), AlgebraicTopologyPartII (`:421`, N6 for §13.3), and K3SurfacesAndSymplecticBoundedness (`:198`).

### Ownership and overlap

- **#1854.** `scratch/overlaps.md` lists one open pull request, #1854, which changes this folder and conflicts with it. The generated merge-order block of this pull request states the order (this pull request → #1854), so a missing order is not a finding.
- **What #1854 already settles** (checked at its head):
  - the Layer 1–5 citations of the pinned `NovikovSeries`, torsion and orbit-zeta declarations (its README lines 65–70 and 153–159);
  - the sentence on CharacteristicClasses C2.3, the oriented Euler-class form Σ ind = ⟨e(TM),[M]⟩ = χ(M) on main (its line 31), against which §7.1 is the orientation-free variant;
  - the deletion of R02's section.
- **Dropped and revision-only ids.** None in either direction.
- **Smooth Lefschetz fixed-point formula.** A grep of main and the 454 open heads finds no second owner. IndexTheory has Atiyah–Bott, SchubertGeometry and GroupActionsOnRiemannSurfaces have the holomorphic formula, and AlgebraicTopologyPartII consumes N6. CharacteristicClasses on main (`:138–140`) gives the fixed-point index sum to MorseNovikov N6.
- **Vector-field Poincaré–Hopf, Novikov completion, dynamical zeta function, Euler structures.** No other owner: the hits are DGFloer, GromovWittenTheory, TaubesGromov, HamiltonianFloerOperations, FukayaTheory and InstantonFloerTheory, all consumers.
- **Closest open roadmaps in vocabulary.** MorseTheory (#1682) and AlgebraicTopology (#1652) have no hits. DGFloer (#1798) consumes N1 and N4 (its `:218`). FourManifolds (#936) consumes N6 (R03).
- **Stale text in HeegaardFloer.** HeegaardFloer's lines 61, 1951 and 4840 say that MorseNovikov N5 specifies its own general-field return germ. At this head, §5.1 consumes F0.6 instead (`README.md:851`), so this roadmap has no second owner. The stale description is HeegaardFloer's to correct.

### Sources: the seeded sample

The README flags no locator as unverified. Texts read in the worker's cache:
- rt3 (file page N = printed 208+N);
- Hat02 (file page N = printed N−9 in Chapter 2, printed 51–52 at file pages 60–61);
- fetched through the sources service for this review: rt2 (Geom. Topol., author copy), rt1 (Topology, author copy), Milnor 1966 (Bull. AMS open archive) and Hutchings' erratum page. I recorded these only in a scratch copy of the manifest; the package's `sources.toml` does not list them.

| Target | README claim | Text at the locator | Result |
|---|---|---|---|
| 1.1 | support model rt3 §1.2, p. 211; rt2 §1, p. 371 for H=H₁, N=−θ | rt3 lines 137–147 (p. 211, Nov(G,N) over ℤ, finitely many coefficients with N(g)<R); rt2 lines 98–104 (p. 371, Nov(H₁,−θ)) | agrees |
| 1.2 | O(R) and limits rt3 §2.1, p. 220; finite-cover restriction §3.4, pp. 226–227 | rt3 lines 604–614 (p. 220); lines 1043–1070 (§3.4 starts p. 226; the pullback "since ι has finite kernel" is at line 1067, p. 227) | agrees |
| 1.3 | rt3 §1.3, (1.1)–(1.2), Remark 1.4, p. 212 | rt3 lines 162–212: Λ⁺ supported on −α(h)>0, exp on Λ⁺⊗ℚ, product (1.2), log by the usual series | agrees |
| 1.4 | cyclic case rt3 Example 1.3, p. 211; leading coefficients in the proof of Lemma A.4, p. 240 | rt3 lines 148–153; lines 1900–1931 ("leading coefficients" argument at 1925–1926) | agrees |
| 2.1 | rt3 §1.1, pp. 210–211, §1.4, pp. 212–213; admissibility (a), (b) of Definition 1.1, p. 211 | rt3 lines 52–99, 119–124, 231–242 (sign: T_pD(p) against Rv ⊕ T_qD(q)) | agrees; the README's TD(p) = TM ⊕ R(−V) ⊕ TD(q) reduces to it when dim M(p,q) = 0 |
| 2.3 | Hatcher §1.2, Klein-bottle van Kampen, pp. 51–52 | Hat02 lines 2338–2350 (N₂, word aba⁻¹b, abelianisation ℤ⊕ℤ/2) | agrees |
| 3.2 | rt3 §2.1, Lemmas 2.2 and 2.5, pp. 218–219; erratum on §2.2 and Proposition 3.4 | rt3 lines 538–575, 592–601; erratum lines 23–27 (choose the function path generic; Proposition 3.4 is false; use a generic connection) | agrees |
| 3.3 | (1.4), p. 213; triangulation-adapted model Example 1.8, p. 215 | rt3 lines 252–258, 364–376 | agrees; the large-gradient step has no locator (R06) |
| 4.1 | rt3 Definition A.1, (A.1), Proposition A.2, p. 239; Proposition A.5, p. 240; Milnor §3, p. 365, Theorem 3.1 modulo ±1 | rt3 lines 1841–1875, 1933–1944; Milnor lines 256–287 ("working in K̄₁A rather than K₁A"; τ(C) = Σ(−1)^i[b_i h_i b_{i−1}/c_i]; Theorem 3.1) | agrees: a two-term complex gives a⁻¹ in rt3 and [a] in Milnor |
| 4.3 | rt3 §2.1, Definition 2.6, Lemmas 2.7–2.9, pp. 220–221; the proof of Lemma 2.8 fixes the acyclic set | rt3 lines 615–631, 632–760; acyclicity is preserved by the Novikov isomorphism (lines 706–711) | agrees |
| 5.1 | HeegaardFloer §2.8 (F0.6); rt3 §1.1, p. 210 | rt3 lines 67–82 (return map; linearisation on the normal quotient independent of U and of q); HeegaardFloer `:1938–1946` | agrees |
| 5.3 | rt3 (1.1)–(1.2), p. 212; Proposition 3.6(a), p. 228; rt2 Definition 1.3, p. 371 | rt3 lines 162–208, 1146–1149; rt2 lines 105–123 (ζ, and product (2) with exponent −(−1)^{i₀}) | agrees; the README's dimension caveat is correct (Source issues) |
| 6.1 | I = rt3 Definition 1.5, p. 214; Theorems A and B, pp. 214–215; rt2 Theorem 1.7, p. 373; good times Definition 2.6, p. 220; §2, pp. 218–222; §§3.1–3.3, pp. 223–226; Lemma 3.2, p. 223 | rt3 lines 305–344, 318–320 ([HL2] for real multiples of integral classes), 508–813, 832–1042, 855; rt2 lines 174–178 | agrees |
| 6.2 | rt3 Lemma 3.7, p. 229 (x, a₁ = ±1); Lemma 3.8(a)–(b), p. 230 (y, b₁ = (−1)^{i+1}a₁); Lemmas 3.5–3.10, pp. 227–231 | rt3 lines 1090 (p. 227), 1241 (p. 229), 1289–1292 (p. 230), 1328 (pp. 230–231) | agrees |
| 7.3 | Milnor, TDV, §6, p. 35 | book; not read (Not verifiable). The `zeroSign` docstring's rt3 p. 241 does not state the sign (R07) | not verifiable |

Locators checked beyond the sample:
- agree: Hatcher Theorem 2C.1 p. 177 (line 7714), Theorem 2C.3 p. 179 (line 7787), trace formula p. 181 (lines 7866–7870); rt1 Example 1.9, p. 863 (rt1 lines 80–83, "Milnor observed (cf. [37] or Lemma 2.6)"); rt2 Example 1.4, p. 372 (rt2 lines 150–154); rt3 Remark 1.6, p. 214; Example 1.9, pp. 215–216 (lines 377–417); Definitions B.1, B.3 and B.4, pp. 241–242 (lines 1983–2064);
- wrong: §6.3's §4 pages (R06).

### Adversarial pass

The rows cover the headlines, the sampled targets, and the targets that findings touch. Each row gives the values computed on each side.

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| `lefschetz_fixed_point_formula`, dim 0 | M = three points; f swaps two and fixes one | det(1−0) on the zero space = 1, so the sign is +1; LHS 1; RHS i=0: trace of the permutation matrix on ℚ³ = 1 | equal | none |
| same, S¹ reflection z ↦ z̄ | fixed points ±1, df = −1 | det 2 > 0 twice, LHS 2; traces 1 (H₀) and −1 (H₁), RHS 1−(−1) = 2 | equal | none |
| same, z ↦ z² on S¹ | fixed point 1, df = 2 | det(1−2) = −1, LHS −1; RHS 1 − 2 = −1 | equal | none |
| same, ℝP² with the rotation by 1 rad | one fixed point | det(1−R) = 2 − 2cos 1 = 0.919 > 0, LHS 1; rational Betti numbers (1,0,0), RHS 1 | equal, nonorientable | none |
| same, identity of S¹ | every point fixed | det(1−1) = 0, so `hnd` fails and nothing is claimed | the hypothesis is needed | none |
| same, M = ∅; translation of ℝ | — | 0 = 0; the translation is excluded by `CompactSpace` (it would give 0 ≠ 1) | correct scope | none |
| `fixedPointDet`, wrong model det(df) | identity of S² | det(df) = 1 ≠ 0 would admit it; finsum over an infinite set = 0 against RHS 2 | `1 −` needed | none |
| `hnd` ↔ `IsNondegenerateFixedPt` (R04) | identity; reflection | det 0 and every v fixed; det 2 and only v = 0 fixed | equivalent | R04 |
| `poincare_hopf`, dim 0 | two points, v = 0 | `zeroDet` = 1 twice, LHS 2; b₀ = 2 | equal | none |
| same, S² height gradient | maximum, minimum | dV = Hess: negative definite on ℝ² (det > 0), positive definite; +1, +1; RHS 1 − 0 + 1 = 2 | equal | none |
| same, S¹, V = sin θ ∂θ | zeros 0 and π | dV = cos θ = 1, −1; LHS 0; RHS 1 − 1 = 0 | equal | none |
| same, T² and ℝP² Morse gradients | indices (0,1,1,2) and (0,1,2) | +1−1−1+1 = 0 = 1−2+1; +1−1+1 = 1 = 1−0+0 | equal, including nonorientable | none |
| same, Klein bottle, nonvanishing field | no zeros | LHS 0; Betti numbers (1,1,0), RHS 0 | equal | none |
| `zeroDet`, wrong model `fst` | T² gradient | the first component is the identity, so det 1 at every zero, LHS 4 ≠ 0 | `snd` needed | none |
| `zeroDet` at a zero | V(x) = ±x on ℝ; V = (−x,y) conjugated by (x,y) ↦ (−x,y) | ±1; the transported field (−u,v) has det −1 = det of the original | chart-independent at zeros | none |
| `rationalBetti` (R05) | point; circle; ℝP² | (1); (1,1), sum 0; (1,0,0), where 𝔽₂ would give (1,1,1) | Checks discriminate | R05 |
| §1.1 support and convolution | N(k) = k, Σ_{k≥0} t^k; N = 0 | three terms below 3; square has coefficient 3 at t² and 0 at t⁻¹; with N = 0 infinitely many terms have N < 1 | as claimed | none |
| §1.1 onto iff N = 0 | N ≠ 0 | pick h with N(h) > 0; Σ_{k≥0} e^{kh} is in Nov but not in R[H] | as claimed (R nontrivial) | none |
| §1.2 neighbourhoods and maps | t², t⁻³t²; ℤ² → ℤ; ℤ⊕ℤ/2 → ℤ | t² ∈ U₂ \ U₃; t⁻¹ ∉ U₂; 1 + e^{(0,1)} ↦ 2; pullback of 1 is 1+g, (1+g)² = 2+2g | as claimed | none |
| §1.2 P(U_C) ⊆ U′_{cC} | N′∘φ = cN | N′(h′) < cC forces N(h) < C on the fibre, so the coefficient is 0 | as claimed | none |
| §1.3 series | (1−t)Σt^k; N(k) = −k; Π(1−t^n)⁻¹ | coefficients 1,0,0; (1−t)(−t⁻¹Σt^{−k}) = 1; the t⁴ coefficient is 5 (machine) | as claimed | none |
| §1.4 domain | ℤ/2; ℤ² with a+√2b | (1−g)(1+g) = 0; N injective gives a unique leading term, so leading terms multiply | the torsion-free hypothesis is needed | none |
| §2.1 Hessians and signs | ±x²/2; d(sin x); cos θ on S¹ | indices 0 and 1; zeros π/2+kπ with second derivative ∓1; the two paths ±1, sum 0 | as claimed | none |
| §2.3 Klein-bottle cover | A(s,y) = (s+1,−y), B(s,y) = (s,y+1) on ℝ × ℝ/2ℤ | AB = (s+1,−y−1) ≡ BA = (s+1,−y+1); A^nB^e = (s+n,(−1)^n(y+e)) = id only if n = 0, e ≡ 0; [a,b] = b⁻², ab²a⁻¹ = b⁻²; π₁/⟨b²⟩ = ℤ⊕ℤ/2; P(A) = 1, P(B) = 0, N(A⁻¹) = 1 | as claimed | none |
| §3.2 continuation | constant family; lift t²; zero complex against Nov →(1−t) Nov | [1]; [t²][t⁻²] = [1]; both complexes contractible | as claimed | none |
| §3.3 large gradient | −∇(cos θ + C⁻¹θ) | = (sin θ − C⁻¹)∂θ; C = 2: zeros at π/6 and 5π/6; C = 1/2: sin θ − 2 < 0, a closed orbit | as claimed | none |
| §4.1 conventions | ℚ →2 ℚ; A₀ = 3, A₁ = 5; basis transposition | rt3 gives 2⁻¹, Milnor gives [2]; A₀⁻¹·2·A₁ = 10/3, torsion 3/10 = (1/2)·3·5⁻¹; new det −1, torsion −1 = 1·det(A₀) | as claimed | none |
| §4.3 continuity | (2+t^m)⁻¹; t^m → 0 | 1/2 − t^m/4 + …; t^{−m} does not tend to 0 | as claimed | none |
| §4.4 norm and trace | ℤ ⊃ 2ℤ, s = t²; 1+ct with c = 3 | matrix of t is [[0,s],[1,0]], trace 0, det −s; Norm(1−t) = 1−s; log(1−9s) = 2·even part of log(1+3t) to degree 8 (machine) | as claimed | none |
| §5.1 conjugacy | P = 2x, h = 3x | hPh⁻¹ = 2x, det(1−2) = −1; transverse dimension 0 gives det 1 | as claimed | none |
| §5.2 local index | x+x²−ε; x+x³ ∓ εx | ±√ε with signs −1 and +1, total 0; 0 (sign +1) and ±√ε (sign −1 each) give −1; 0 alone (sign −1) gives −1 | as claimed | none |
| §5.3 sign rule and exponent | λ = 2, −2, 1/2; i₋ even or odd | ε(γ^k) = (−1)^{i₊}(−1)^{(k+1)i₋}; factors 1−t, 1+t, (1−t)⁻¹ (machine); exponent −(−1)^{i₊+i₋} = (−1)^{n−i₀}, since i₊+i₋+i₀+2c = n−1 | as claimed | none |
| §5.3 Klein-bottle ζ | f(θ) = −θ + ε sin θ | the only fixed points are 0 and π (2θ − ε sin θ is increasing), and f² has none in (0,π); ζ = 1+2t+2t²+… = (1+t)/(1−t) (machine); rt2's exponent gives 1−t² instead | the README is right; rt2 (2) fails in dimension 2 | Source issues |
| §5.3 period doubling; cover norm | — | (1+t)/(1−t²) = 1/(1−t) (machine); Norm((1−t)⁻¹) = (1−s)⁻¹ | as claimed | none |
| §6.1 fold and normal form | x³/3 − εx; V_t with sign + and t < t₀ | zeros ±√ε, Hessians ±2√ε, so indices 0 and 1; −V_t has x₁-component (t₀−t)−x₁² > 0 between x₁ = ∓√(t₀−t), running from index i to index i−1 | agrees with rt3 (3.13) | none |
| §6.2 covers and norms | H = ℤ⊕ℤ/2, h = (2,1) | μ(n,e) = 2n mod 3 gives μ(h) = 1; ν(n,e) = n mod 4 gives ν(h) = 2, and ν(nh) = 0 iff n is even; z = 1+5t² gives coefficient dk·(log z)₂ = 20 = 4c₂ (machine); τ₊ = τ₋x^{(−1)^i} gives y = x^{(−1)^{i+1}} | as claimed | none |
| §6.4 Hopf local index | expanding linear map A on a q-simplex, transverse contraction | sgn det(1−A) = (−1)^q sgn det A = (−1)^q ε; the reflected 1-simplex gives (−1)(−1) = +1 | as claimed | none |
| §6.4 calculations | identity and reflection monodromy; trefoil | (1−t)⁻¹(1−t) = 1; (1−t)⁻¹(1+t); det(tV−Vᵀ) = t²−t+1 (R03); T³: (1−t)⁻¹(1−t)²(1−t)⁻¹ = 1 (machine) | as claimed | R03 |
| §6.4 chain adapter | Sd[v₀,v₁] = [v₀,b] + [b,v₁]; last-vertex map b ↦ v₁ | ↦ [v₀,v₁] + 0 = e | λ#∘Sd = id | none |
| §7.1 signs | maximum of ∇f in dimension n; −∇f | (−1)^n = (−1)^{ind}; (−1)^{n−ind}, which differs in odd n; rt3's simplex sink (−1)^i | consistent | none |
| §7.2 action | critical-free circle, ξ₀ + downward h | (1−t)⁻¹ ↦ t(1−t)⁻¹ | equal modulo deck monomials | none |
| §4.6 inequalities | two-term complex; a point | (c,b) = (1,1),(0,0): 0 ≤ 1 and 0 = 0; 1 = 1 | as claimed | none |
| §3.4 top degree | T² with dx; Klein bottle with ds | (Nov →(1−t) Nov) ⊗ Ccell(S¹) is acyclic; H₂^Nov = 0 while H₂(T²;ℤ) = ℤ | as claimed | none |

### Duplication by object

- **Headline carriers.** Mathlib's `HahnSeries` and `LaurentSeries` do not give finiteness below every threshold for a non-injective N, as §1.4 says. The headlines consume `mfderiv`, `TangentBundle`, `LinearMap.det`, `LinearMap.trace`, `Module.finrank`, `Function.fixedPoints`, `TopPair.incl` and Tau Ceti's relative singular homology, and restate none of them.
- **Pinned Tau Ceti.** The Layer 1–5 duplication is #1854's repair. The two items #1854 does not touch are R03 (GT §4.4) and R04 (`IsNondegenerateFixedPt`).

## Not verifiable

- **Milnor, *Topology from the Differentiable Viewpoint*, §6** (p. 35 for Poincaré–Hopf; the index lemma that R07 proposes). A Princeton University Press book with no legal open copy found; cited by locator.
- **Dold, *Lectures on Algebraic Topology*, Chapter VII §6** (the Lefschetz–Hopf theorem on compact Euclidean neighbourhood retracts). A Springer book, not fetched. The simplicial statement and the trace formula were checked in Hatcher instead.
- **Turaev**, *Introduction to Combinatorial Torsions* (a book) and Math. USSR-Izv. 34 (1990) (paywalled). Cited without locators for based torsion and the lift refinement; rt3 Appendices A–B, which were read, cover what §§4.5 and 7.1–7.2 use.
- **Pajitnov**, *Circle-valued Morse Theory* (a book). Cited without a locator in References only.
- **Manifest.** The package manifest records rt3, Gra72, Hat02 and Hop29 only. The README at this head also cites rt1, rt2, Milnor 1966 and the erratum, which I fetched legally for this review, and the books above.

## Source issues

- **Error** in rt2 at equation (2), printed page 371: the source says the product formula's exponent is −(−1)^{i₀(γ)}, for closed oriented manifolds of any dimension n (p. 370); it should be −(−1)^{i₊(γ)+i₋(γ)} = (−1)^{n−i₀(γ)}, which agrees only for odd n; affects a stated result.
- **Misprint** in rt3 at §1.2, printed page 211: the source says the inclusion ℤG → Nov(G,N) is the identity exactly when N vanishes; it should be that the inclusion is onto, hence an isomorphism, exactly when N vanishes; affects nothing.
- **Gap** in rt3 at equation (1.5), printed page 215, and Remark 4.3, page 237: the source says the Euler-refined equality holds but only sketches it, relying on Example 1.8's apparent triangulation-adapted perturbation; it should be proved with a rigorous Example 1.8; affects a stated result.
