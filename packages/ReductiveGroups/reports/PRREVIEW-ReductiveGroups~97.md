# Review of ReductiveGroups (pull request #1808 at dd06ad1)

**Verdict:** needs changes

This is an incremental re-review. `TauCetiRoadmap/ReductiveGroups/` has 0 changed lines since a96d197, so none of the 13 findings of the previous review has been repaired. The gate still fails on `build` (5), `statement-hygiene` (1) and `outside-folder` (2). Every finding is restated below at this head, with its witness re-run. Three findings needed re-checking because their supplier folders changed in this pull request: R05 (ModularCurves) and R04 (ReductiveGroupsPartII, IntegralHeckeAndGaloisDeterminants). Each still holds.

## R01 (P1) — Suggested.lean does not elaborate at the pins

**Location.** `TauCetiRoadmap/ReductiveGroups/Suggested.lean` lines 112, 116 and 119 (`def geometricOrbit`, `def orbitClosure`, `def orbitBoundary`). Line 240: "`g⁻¹ * TauCeti.AlgHom.mapValue (H := H) F g`". `README.md` line 1546: "using `TauCeti.AlgHom.mapValue` for postcomposition".

**Claim.** The acceptance module fails to compile, so `lang_surjective` is not stated at all. Every companion `*Targets.lean` file imports this module, directly or through `IntegralRationalTargets`/`SignedADETargets`, so none of them builds either.

**Witness.** `lake env lean` at this head reports two kinds of error. Lines 112, 116 and 119 give "failed to compile definition … depends on 'Spec'/'orbitClosure'". Line 240 gives "Unknown identifier `TauCeti.AlgHom.mapValue`". The pinned declaration is the root-namespace `AlgHom.mapValue` (`TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean:143`).

**Repair.**
- Mark the three definitions `noncomputable`.
- Replace `TauCeti.AlgHom.mapValue` with `AlgHom.mapValue` at Suggested.lean line 240 and README line 1546.

Tested: a scratch copy with exactly these four edits elaborates with 12 `sorry` warnings and nothing else. If R07 is applied, the three definitions are deleted and only the line-240 fix remains.

## R02 (P2) — The supplier contract misstates the pinned Tau Ceti, and four proved theorem families are planned as targets

**Location.**
- `README.md` lines 181–183: "`Borel/Conjugation.lean` proves conjugacy of Borel subgroups only under the hypothesis … the unconditional theorem is Layer 7's target".
- Line 188: "the characteristic-zero converse is Layer 6's target".
- The Layer 3A, Layer 6, Layer 6B and Layer 7 targets and headlines that restate these.
- `Suggested.lean` lines 39–46 (Matsushima "is not stated").

**Claim.** Each of these is already a theorem at the pinned Tau Ceti, under weaker hypotheses than the roadmap states:
- **Layer 3A.** Orbits, closures and boundaries: `TauCeti.SchemeAction.orbit`, `orbitClosure`, `orbitBoundary`. Local closedness and the boundary dimension drop: `isLocallyClosed_orbit`, `topologicalKrullDim_orbitBoundary_lt`. The reduced orbit scheme: `orbitScheme`, `orbitι`, `range_orbitι`. Closed orbits: `exists_isClosed_orbit_subset_orbitClosure`, `exists_isClosed_orbit`. None of these needs smoothness or affineness.
- **Layer 6.** The characteristic-zero implication from reductive to linearly reductive.
- **Layer 6B.** The Matsushima comparison map and its isomorphism in characteristic zero.
- **Layer 7.** Unconditional Borel conjugacy.

**Witness.**
- `IsBorelOverAlgClosed.exists_conjugate_eq` (`Borel/Conjugacy/Existence.lean:133`; its docstring says the ambient group "need not be smooth, reduced, or connected").
- `reductiveCommHopfAlgProperty.linearlyReductive` (`Reductive/CompleteReducibility.lean:96`).
- `isIso_fppfHomogeneousQuotientToCoinvariantsPoints_of_reductive` (`Fppf/Quotient/Homogeneous/Coinvariants.lean:255`).
- `isLocallyClosed_orbit` (`GroupAction/LocallyClosed.lean:177`).

**Repair.**
- Move the four families into `From Tau Ceti`, with the exact names and files above. The orbit files are `AlgebraicGeometry/GroupAction/{Orbit/Basic,LocallyClosed,Orbit/Scheme,ClosedOrbit}.lean`.
- Delete them as targets and headlines, keeping the Checks of 3A.1 and Layer 6 as consumer tests.
- In 6B, keep only what the pin lacks: the step from "reductive identity component" to linear reductivity (Milne 2017, Corollary 22.43, p. 478), and the base changes.
- Rewrite README lines 181–183 and 188.
- Remove the 3A/6/7 "Stated here" clauses and the 6B bullet from the Suggested.lean docstring.

## R03 (P2) — A statable headline is absent: conjugacy of maximal tori

**Location.** `README.md` lines 1368–1369: "Prove that any two maximal tori are conjugate (Milne, Theorem 17.10, p. 354)". Neither `Suggested.lean` nor its docstring mentions it.

**Claim.** Once Borel conjugacy is consumed from the library (R02), maximal-torus conjugacy is the remaining Layer 7 headline. Every carrier it needs exists at the pins.

**Witness.** `TauCeti.HopfIdeal.IsMaximalTorus` is at `Torus/Maximal.lean:50`. The pinned `exists_conjugate_eq_of_isMaximalTorus` (`Torus/Conjugation.lean:149`) additionally assumes a distinguished torus `D` and the hypotheses `hcontainI`/`hcontainJ`. The statement below elaborates at the pins (scratch probe).

**Repair.** State it:

```lean
theorem exists_conjugate_eq_of_isMaximalTorus {k : Type v} [Field k] [IsAlgClosed k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{v, v} k) (hsm : Algebra.Smooth k H)
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty k H.obj)
    {I J : TauCeti.HopfIdeal k H}
    (hI : TauCeti.HopfIdeal.IsMaximalTorus k H.obj I)
    (hJ : TauCeti.HopfIdeal.IsMaximalTorus k H.obj J) :
    ∃ g : WithConv (H →ₐ[k] k), J = I.conjugate g := by
  sorry
```

Its import is `TauCeti.Algebra.AlgebraicGroup.Torus.Maximal`. The README's negative control at line 1421 (over ℝ, the diagonal torus and `SO₂` are not conjugate) is excluded by `IsAlgClosed`.

## R04 (P2) — Lang's theorem and Layer 1.1 rational cohomology have second owners

**Location.**
- `README.md` lines 15–16: "Layer 7a owns Lang's theorem for the `q`-Frobenius".
- Lines 26–29: "ReductiveGroupsPartII RG2.3.7 states Lang's theorem again … it is a consumer of Layer 7a … IntegralHeckeAndGaloisDeterminants §0.7 states the rational cohomology".

**Claim.** The ownership move is half done. After this pull request merges, main still has two owners of Lang's theorem with conflicting single-owner claims, and two Lean statements of it.

**Witness.**
- ReductiveGroupsPartII on main, README lines 61–62: "RG2.3 is the single owner in Tau Ceti of Lang's theorem".
- RG2.3.7 (line 5204) states `Lang.lang_surjective`; its *Needs* (line 5214) is "ReductiveGroups layer 3".
- #1689, README line 1144, states rational cohomology without citing Layer 1.1.

**Repair.** In a companion revision of ReductiveGroupsPartII, named in this pull request's merge-order paragraph:
- RG2.3: replace the single-owner sentence with "consumes ReductiveGroups Layer 7a".
- RG2.3.7 (a)–(c): cite Layer 7a.
- Drop `Lang.lang_surjective` from RG2's Suggested.lean, with an old → new line.
- Keep the pro-algebraic Lang theorem in RG2.

Name #1689 in the merge-order paragraph, and record there that its rational-cohomology block becomes a citation of Layer 1.1. The direction is sound (no cycle), so ReductiveGroups is the right owner.

## R05 (P2) — Affine descent is attributed to ModularCurves §0E, which at this head assigns it elsewhere

**Location.**
- `README.md` lines 36–37: "ModularCurves §§0E–0F supply effective affine descent and finite-locally-free affine Weil restriction".
- Lines 289–290: "Sections 0E–0F supply affine descent".
- Lines 364–368 and 389 (Layer 0), 2912–2922 (Layer 9D: "ModularCurves §0E for the sheaf, torsor and effective affine descent operations") and 2988.

**Claim.** This is a supplier cited for a statement it does not make. ModularCurves was revised in this pull request after the previous review, and the revision keeps the same assignment: §0E consumes the affine-base cases from Tau Ceti, leaves general effective affine descent to SchemeAndStackFoundations §1.1, and proves only group-object and level-structure descent.

**Witness.** In `TauCetiRoadmap/ModularCurves/README.md` §0E at this head, lines 945–950 assign three descents to "SchemeAndStackFoundations §1.1's":
- affine-over-`S'` descent along a non-affine flat surjective quasi-compact map;
- finite locally free descent over an arbitrary base;
- closed-subscheme descent.

Lines 928–943 consume the affine-base cases from Tau Ceti.

**Repair.** Cite the following in all six places, and rewrite the `From TauCetiRoadmap.ModularCurves` paragraph to match:
- SchemeAndStackFoundations §1.1 *affine_fpqc_descent* (lines 2223–2233) for general effective affine, finite locally free and closed-subscheme descent.
- The pinned Tau Ceti cases, under `From Tau Ceti`:
  - `DescentDatum.descended` and `isPullback_toDescended` (`AlgebraicGeometry/Descent/AffineMorphism.lean:111,435`);
  - `exists_isAffine_baseChange_hom_isIso` (`Descent/Affine.lean:532`);
  - `exists_finiteLocallyFree_baseChange_hom_isIso` (`Descent/FiniteLocallyFree.lean:88`);
  - `isClosedImmersion_descended_hom` (`Descent/MorphismProperty.lean:202`).
- ModularCurves §0E only for descent of group objects and homomorphisms on an already-descended scheme.
- ModularCurves §0F for Weil restriction: its lines 975–983 match that use.

## R06 (P2) — The seven companion `.lean` files carry sorry'd data and are an orphaned API catalogue

**Location.**
- `CoverLiftTargets.lean` lines 13–17 (`isometryGroup … one_mem' := by sorry`).
- `SpectralWeylTargets.lean` lines 63–64 (`noncomputable def centerHomeomorph … := sorry`), and `planeBraidEquiv`, `matrixSpectrum`.
- `BruhatCoordinateTargets.lean` lines 1–5, which import only `Mathlib.*` submodules.

**Claim.** Sorry'd data is blocking under the Principles. The files also break the Lean form rules (no single `import Mathlib`). The README refers to none of them, and they duplicate Suggested.lean and the pin:
- `Spectral.OrderedPlane`, `planePermutationAction` and the nonsplitting theorem duplicate `PlaneBraidAcceptance`.
- `OrbitGeometry.Points` and `orbitMorphism` duplicate `OrbitAcceptance`.
- `ADECoverLifts.isometryGroup` duplicates `TauCeti.BilinForm.isometryGroup` (`LinearAlgebra/BilinearForm/Isometry.lean:183`).

**Witness.** `grep -c sorry` gives SignedADE 41, FoldingADE 39, CoverLift 23, SpectralWeyl 26, IntegralRational 18 and OrbitGeometry 18. `grep -n Targets README.md` finds nothing.

**Repair.** Delete the seven files. The README carries their targets as prose and Checks, and Suggested.lean is the acceptance test.

## R07 (P3) — Padding in Suggested.lean

**Location.** `Suggested.lean`:
- lines 96–174: `OrbitAcceptance`, with `Points`, `orbitMorphism`, `geometricOrbit`, `orbitClosure`, `orbitBoundary`, `orbitDimension` and five theorems;
- line 187: `linearlyReductive_of_reductive`;
- line 220: `exists_conjugate_eq_of_isBorelOverAlgClosed`;
- lines 318–358: `CoverLifts.liftSubgroup`, `LiftGroup`, `projection`.

**Claim.** The orbit, Layer 6 and Layer 7 declarations restate pinned theorems (R02). The `CoverLifts` definitions support no theorem in the file: the docstring says their kernel theorem is a README target.

**Witness.** In the scratch probe at the pins:
- `h.linearlyReductive` closes Layer 6.
- `haveI` (algebraic closedness, from `isBorelOverAlgClosed_iff`) plus `(hI.exists_conjugate_eq hJ).imp fun _ h => h.symm` closes Borel conjugacy.
- `geometricOrbit = SchemeAction.orbit` follows by `comp_orbitMap` and `Hom.smul_def`, and then `isLocallyClosed_orbit` closes local closedness.

**Repair.** Delete these declarations from Suggested.lean. The README keeps them as consumed library facts (R02), and keeps the cover-lift group and its kernel theorem as targets.

## R08 (P3) — `plane_braid` concludes a bare `Nonempty` of an isomorphism (gate: statement-hygiene)

**Location.** `Suggested.lean` lines 303–304: "`Nonempty (FundamentalGroup (UnorderedPlane n) (unorderedBase n) ≃* TauCeti.BraidGroup n)`".

**Claim.** The gate rule asks for a canonical map with `IsIso`, or an existence statement named `nonempty_*`. The generator-characterized form needs half-twist paths, which are not pinned.

**Witness.** Gate `statement-hygiene`, line 304 (reproduced at this head).

**Repair.** Rename it `nonempty_fundamentalGroup_mulEquiv_braidGroup` and update README line 3344. The statement is otherwise sound (table).

## R09 (P3) — Edits outside this pull request's folders (gate: outside-folder)

**Location.**
- `Completed/ArithmeticDirichletSeries/README.md` line 331: "`LFunctions` consumes this package and supplies its own…".
- `TauCetiRoadmap/SymplecticGeometry/README.md` line 77: "adapters consumed by HeegaardFloer and consumed by DGFloer".

**Claim.** Neither folder is one of this pull request's own folders.

**Witness.** Gate `outside-folder` (2). Also, `git diff --stat origin/main...HEAD` lists exactly these two files outside the fifteen folders this pull request owns.

**Repair.** Drop both hunks; they belong to #1854. Alternatively, name both roadmaps in the title and description.

## R10 (P3) — Open pull requests that change ReductiveGroups have no stated order

**Location.** The description's merge-order paragraph: "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**".

**Claim.** Four other open pull requests change this roadmap's files, and their heads conflict with this one. No order is stated for them.

**Witness.** `scratch/overlaps.md` lists the conflicts:
- #1332 in `ReductiveGroups/README.md`, `Suggested.lean`, `OrbitGeometryTargets.lean` and `SpectralWeylTargets.lean`;
- #1676 and #1797 in `README.md` and `Suggested.lean`;
- #1854 in `README.md` and `Suggested.lean`.

**Repair.** State in the merge-order paragraph which of #1332, #1676, #1797 and #1854 rebases on which. Do not restate their changes here.

## R11 (P3) — Layer 1.1's points/comodule dictionary is narrowed below its source

**Location.** `README.md` line 449: "For an affine group scheme G over R with flat coordinate Hopf algebra, extend Layer 1's action/comodule dictionary to arbitrary R-modules."

**Claim.** The equivalence between G-modules and O(G)-comodules needs no flatness.

**Witness.** `jantzen-1985` lines 1127–1136 (§2.8, printed p. 38) prove the two categories equivalent for any k-group scheme. Flatness is a standing hypothesis only "from 3.2 on" (line 1487).

**Repair.** Drop "with flat coordinate Hopf algebra" from this sentence. Keep flatness where it enters: enough injectives (§3.9), cohomology and induction.

## R12 (P3) — The manifest records a different edition of Milne than the README cites

**Location.** `README.md` line 3694 cites "J. S. Milne, *Algebraic Groups* (2017)" at `iAG2017.pdf`, with 2017 numbering throughout. The manifest entry `milne-iag` records `iAG200.pdf` (v2.00), with locator "Prop. 27.54" for Layer 7a.

**Claim.** The two versions are numbered differently. The cached text does not contain the README's locators under the numbers the README cites.

**Witness.** In v2.00, Lang's theorem is 27.54–27.56 (`milne-iag` line 20282). The README cites Theorem 17.96 and Corollary 17.97, p. 383, of the 2017 edition.

**Repair.** The worker records the 2017 author-page copy under the same key `milne-iag`, with a `version_note`; the README keeps its 2017 numbering.

## R13 (P3) — A Mathlib item sits under `From Tau Ceti`

**Location.** `README.md` lines 128–132: "Mathlib `AlgebraicGeometry.Group.Affine` provides `hopfSpec.fullyFaithful` and `essImage_hopfSpec` … Mathlib `AlgebraicGeometry.Group.Smooth` provides `AlgebraicGeometry.smooth_of_grpObj`".

**Claim.** This repeats lines 114–116 of `From Mathlib` under the wrong supplier heading.

**Witness.** `README.md` lines 114–116, under `From Mathlib`, state the same `hopfSpec` dictionary.

**Repair.** Delete lines 128–132, and move the `smooth_of_grpObj` sentence into `From Mathlib`.

## Previous findings

- R01 — not repaired: Suggested.lean line 240 still reads `g⁻¹ * TauCeti.AlgHom.mapValue (H := H) F g`; lines 112/116/119 are still plain `def`; elaboration gives the same four errors.
- R02 — not repaired: README lines 181–183 still say "the unconditional theorem is Layer 7's target", and line 188 still says "the characteristic-zero converse is Layer 6's target".
- R03 — not repaired: no maximal-torus conjugacy statement in Suggested.lean or its docstring; README lines 1368–1369 unchanged.
- R04 — not repaired: README lines 26–27 still call RG2.3.7 "a consumer of Layer 7a"; main's ReductiveGroupsPartII lines 61–62 still claim single ownership.
- R05 — not repaired: README line 36 still reads "ModularCurves §§0E–0F supply effective affine descent"; ModularCurves §0E (revised here) still assigns it to SchemeAndStackFoundations §1.1 and Tau Ceti.
- R06 — not repaired: all seven `*Targets.lean` files are present, with 0, 23, 39, 18, 18, 41 and 26 `sorry`s.
- R07 — not repaired: `OrbitAcceptance`, `linearlyReductive_of_reductive`, `exists_conjugate_eq_of_isBorelOverAlgClosed` and `CoverLifts` are still in Suggested.lean.
- R08 — not repaired: line 304 still concludes `Nonempty (… ≃* TauCeti.BraidGroup n)` under the name `plane_braid`.
- R09 — not repaired: `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md` are still in the diff.
- R10 — not repaired: the merge-order paragraph still names only #1101 and #1807.
- R11 — not repaired: README line 449 still says "with flat coordinate Hopf algebra".
- R12 — not repaired: `milne-iag` still records `iAG200.pdf` with "Prop. 27.54"; README line 3694 still cites the 2017 edition.
- R13 — not repaired: README lines 128–132 still sit under `From Tau Ceti`.

## Verified sound

**Gate and build.**
- I reran the push gate. It reports `statement-hygiene` 1 (line 304) and `outside-folder`, whose entries outside the pull request's own folders are exactly the two files of R09.
- `lake env lean` on Suggested.lean reproduces the four build errors of R01 and 12 `sorry` warnings.

**Dependency check.** It prints `depcheck: 235 roadmaps, 2260 edges, 0 problem(s)`. There is no UPWARD or CYCLE line, and no `moved:` line.

**Scratch probe**, a copy of Suggested.lean plus four pinned imports:
- The four R01 edits give a clean elaboration.
- The R03 statement elaborates.
- The four R07 one-step proofs close.
- 13 `sorry` warnings, exit 0.

**Signatures.** `#check @name` on all 9 theorems and definitions that carry hypotheses: `orbit_locallyClosed` keeps all seven instance binders, and `lang_surjective` keeps `Finite k`, `IsAlgClosed K` and `hF`. `CharZero`, `hsm`, `hconn` and `2 ≤ n` are present where the README states them. This agrees with `scratch/signatures.md` (28 declarations, 0 lost binders). The 22 "Lean names found nowhere" in `scratch/citations.md` are all declared in Suggested.lean.

**Seeded sample, re-read at this head; all correct.**
- 1.1 against `jantzen-1985`: §2.8 printed p. 38 (lines 1127–1136); §3.9 printed p. 60 (lines 1683–1690); flatness from §3.2 (line 1487).
- 8.1 against `conrad-rgs` Definition 5.1.1, p. 136 (lines 5651–5659): nonempty base; roots constant in `M`, coroots in `M∨`; root spaces free of rank one. All three are in the README.
- 8.2 against `conrad-rgs` Definition 6.1.1 and Remark 6.1.2, p. 186 (lines 7725–7751): a pinning is (Φ⁺, {X_a}); over a disconnected base the Borel is not a substitute for Φ⁺. This matches the (+,−) Check.

**Pinned declarations opened at this head.**
- `Borel/Conjugacy/Existence.lean:133`; `Borel/Conjugation.lean:162`; `Borel/Basic.lean:148`.
- `Reductive/CompleteReducibility.lean:96,118`; `Reductive/LinearlyReductive.lean:331`.
- `Torus/Maximal.lean:50`; `Torus/Conjugation.lean:149`.
- `Fppf/Quotient/Homogeneous/Coinvariants.lean:111,255`.
- `GroupAction/LocallyClosed.lean:177,213`; `ClosedOrbit.lean:150,178`; `Orbit/Basic.lean`; `Orbit/Scheme.lean:84`.
- `Cartesian/Action.lean:41,46`; `FunctorOfPoints.lean:143`.
- `BilinearForm/Isometry.lean:183`.
- `Descent/AffineMorphism.lean:111,435`; `Descent/Affine.lean:532`; `Descent/FiniteLocallyFree.lean:88`; `Descent/MorphismProperty.lean:202`.

**Cross-roadmap citations resolved at this head.**
- ModularCurves §0E (lines 925–971) and §0F (lines 973–983); the §0F Weil-restriction use matches.
- SchemeAndStackFoundations §1.1 (lines 2212–2233).
- AlgebraicTopology Stage 1 (van Kampen, line 452) and Stage 4 (CW pairs, line 621), both revised in this pull request; both still supply the 11A/11B interfaces cited at README lines 3381 and 3427.
- ReductiveGroupsPartII on main (lines 61–62, 5201–5215).
- IntegralHeckeAndGaloisDeterminants at #1689 (line 1144).
- `scratch/overlaps.md`: no dropped or revision-only ids.

**Adversarial table.** Rows marked (r73) are carried from the previous report for statements this head leaves untouched. Rows marked (r97) were recomputed or probed at this head.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| `orbit_locallyClosed` (r97 probe) | `𝔾_m` on ℙ¹, x=[1:1] | orbit ℙ¹∖{0,∞}, open in ℙ¹; probe: `geometricOrbit = SchemeAction.orbit`, then `isLocallyClosed_orbit` closes | true; restates pin | R02, R07 |
| `exists_reduced_orbit_model` (r73) | trivial group on Spec k[ε]/(ε²) | orbit one point; model Spec k reduced, closed immersion, range the point | true; pin `orbitScheme` | R02, R07 |
| `boundary_dimension_lt` (r73) | `𝔾_m` on 𝔸¹, x=1; S₃ on itself | dim(𝔸¹∖0)=1 > dim{0}=0; boundary ∅ has dim ⊥ < 0 | true; restates pin | R02, R07 |
| `exists_closed_orbit_in_closure` (r73) | `𝔾_m` on ℙ¹, x=[1:1] | closure ℙ¹ ⊇ closed orbits {0}, {∞} | true; restates pin | R02, R07 |
| `exists_closed_orbit` (r73) | X=∅; 𝔸¹ under `𝔾_m` | ∅: hypothesis `Nonempty (Points X)` false; 𝔸¹: orbit {0} closed | true; restates pin | R02, R07 |
| `linearlyReductive_of_reductive` (r97 probe) | GL₂ char 0; SL₂ char p | char 0 semisimple; char p: ⟨x^p,y^p⟩ ⊂ Sym^p has no complement, excluded by `CharZero`; probe `h.linearlyReductive` closes | true; restates pin | R02, R07 |
| `exists_levi_complement` (r73) | 𝔾_a; B₂⊂GL₂; GL₂; SL₂(W₂) char p | 𝔾_a: O(Q)=k, J=(t), k→k[t]/(t) bijective; GL₂: U=1, J=0; char p: no Levi (McNinch (3.2.1)), excluded | true | none |
| `exists_conjugate_eq_of_isBorelOverAlgClosed` (r97 probe) | SL₂/k̄, B⁺ vs B⁻ | w=[[0,1],[−1,0]]: w[[a,b],[0,d]]w⁻¹=[[d,0],[−b,a]]; probe closes by pinned lemma | true; restates pin | R02, R07 |
| `lang_surjective` (r97) | 𝔾_a/𝔽₂, θ∈𝔽₄; 𝔾_m/𝔽₂; constant C₂ | θ²−θ = (θ+1)−θ = 1; 𝔾_m: g⁻¹g² = g, onto; C₂: every value 1, misses the other point, excluded by `hconn` | true after R01 | R01 |
| maximal-torus conjugacy (r97 probe) | SL₂ over ℝ vs ℂ | diagonal torus (unbounded points) vs SO₂ (compact): not SL₂(ℝ)-conjugate, excluded by `IsAlgClosed`; statement elaborates | true | R03 |
| `exists_coordinatePresentation` (r97) | n=0,1,2 | n=0: det(∅)−1 = 0, ℤ/(0)=ℤ=O(SL₀); n=1: ℤ[x]/(x−1)=ℤ; n=2: ad−bc−1 | true | none |
| `plane_braid` (r97) | n=0,1,2 | n=0,1: π₁ trivial, B₀=B₁=1; n=2: (s,d)=(z₁+z₂,z₁−z₂), swap d↦−d, d↦d² gives ℂ×ℂ*, π₁=ℤ=B₂ | true; `Nonempty` form | R08 |
| `permutation_nonsplit` (r97) | n=2; n=1 | n=2: Hom(ℤ/2, ℤ)=0, so perm∘s trivial ≠ id; n=1: S₁ trivial, section exists, so `2 ≤ n` needed | true | none |
| `CoverLifts.liftSubgroup` (r73) | E=ℤˣ×C₂ split, A trivial | kernel {e↦e·χ(q(e))}: 2 elements = Hom(C₂,ℤˣ) | laws proved; no headline uses it | R07 |
| 1.1 dictionary Check (r73) | weight-one line of 𝔾_m over ℤ at 2∈ℚˣ | 1↦1⊗t↦1⊗2=2; 2 then 3 gives 6 | correct | R11 |
| 1.1 Hochschild Checks (r73) | H=ℤ[t^±] weight one; trivial group, M=ℤ/2 | d¹(1⊗(t−1)) = t⊗(t−1) − (t⊗t−1⊗1) + (t−1)⊗1 = 0; H⁰=ℤ/2, Hⁿ=0 for n>0 | correct | none |
| 1.1 induction Checks (r73) | C₂⊂S₃; q: ℤ→ℤ[t^±] | rank 3 = index; Ind of weight one gives 0, trivial gives ℤ | correct | none |
| 8.1 Checks (r73) | SL₂/𝔽₂; SL₂ vs PGL₂; rank-0 torus | dim 3, centre μ₂ of length 2; α=2ϖ vs α generating X; r=0 trivial group | correct | none |
| 8.2 Checks (r73, re-read) | x_α(t), x_α(2t); Spec(k×k) with B⁺/B⁻ | tangents E₁₂ vs 2E₁₂; signs (+,−) are no constant Φ⁺ (Conrad Rem. 6.1.2, line 7746) | correct | none |
| 7a fixed-coset Check (r73) | F̄_qˣ, q odd, J={±1}, a^{q−1}=−1 | (±1)^{q−1}=1 misses −1; σ(a)=−a, neither ±a fixed | correct | none |
| 7C rank-one identity (r73) | a=b=1 | x_α(1)x_{−α}(1)=[[2,1],[1,1]] = x_{−α}(½)α∨(2)x_α(½) | correct | none |
| 6B Matsushima Checks (r73) | GL₂/O₂, g=diag(2,1), h=swap | (gh)(gh)ᵗ=diag(4,1)=ggᵗ; (gh)ᵗ(gh)=diag(1,4) | correct; theorem pinned | R02 |

**Remarks on untouched text.** None beyond the carried findings.

## Not verifiable

- `waterhouse`, `borel` and `springer` are settled as uncertified (paywalled). They are cited by locator only.
- Cached texts outside the sample and outside the findings were not re-read in this round: `fox-neuwirth`, `fadell-neuwirth`, `birman-brendle`, `frenkel-kac`, `brieskorn`, `salvetti`, `callegaro`, `gros-kaneda`, `heden`, `riche`, `sga1`, `conrad-feng`, `arzhantsev`, `ernst`, `fang-lim-tan`, `conrad-adelic`.
- Ownership against open pull requests was checked through the roadmap tools only for the objects in R04, R05 and R10. A full sweep of the 457 open heads was not run.

## Source issues

- none
