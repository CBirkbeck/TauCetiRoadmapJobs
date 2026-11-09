# Review of CharacteristicClasses (pull request #1808 at dc47c7e)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/CharacteristicClasses/` at dc47c7e. The folder changed by 350 lines since 6931121, all in commit c9403e22, which adopts the copy of this folder that #1854 carried at c07dda7. Of the previous review's four findings, R01 (HomotopySpheres) and R02 (the ℤˣ smooth-action instance) are repaired. R03 (the order with #1854) and R04 (files outside the folders) are not repaired; they are now R08 and R09.

There are nine findings, four of them blocking:
- R01: one headline is statable at the pins although `Suggested.lean` says it is not.
- R02: one item restates, as its own, targets that a roadmap on main owns.
- R03 and R04: two supply directions run both ways, and the dependency check sees neither.

The worker's gate fails only on `outside-folder=2` (R09).

## R01 (P2) — `e(TM)[M] = χ(M)` is statable at the pins, but the module docstring says it is not and `Suggested.lean` omits it

Location: `TauCetiRoadmap/CharacteristicClasses/Suggested.lean:61–69`: "no identification of a tangent-bundle orientation with the homological orientation that fixes `[M]`, so the sign of `e(TM)[M]` has no carrier". Also README C2.3, lines 1050–1063.

Claim: Both orientations are functions of one manifold orientation `o`, so `o` carries the sign:
- The pinned `TauCeti.localOrientationOfManifoldOrientation o hE x` selects, through oriented charts, the local homology orientation of `M` at `x`.
- The pinned `toVectorBundleOrientation` orients `TM`.
- The pinned `Orientation.localOrientation` normalizes the Thom class on each tangent space.

So the headline can be stated on pinned carriers with no new definition. The pointwise identification of the two generators is a step of the proof, not a carrier the statement needs. The theorem below, added to a scratch copy of `Suggested.lean`, elaborates with `sorry` as the only warning, and `#check @` shows the intended type.

Witness: Tau Ceti pin, `AlgebraicTopology/Singular/LocalHomology/Orientation/Chart.lean:202`: `def localOrientationOfManifoldOrientation (o : Manifold.Orientation 𝓘(ℝ, E) M (Fin (n + 1))) (hE : finrank ℝ E = n + 1) (x : M) : LocalOrientation M x (n + 1)`.

Repair:
- Add these imports: `TauCeti.AlgebraicTopology.Cohomology.FundamentalClass`, `TauCeti.AlgebraicTopology.Singular.LocalHomology.Orientation.Linear`, `TauCeti.AlgebraicTopology.Cellular.EulerCharacteristic.FiniteCWType` and `TauCeti.Geometry.Manifold.Orientation.Basic`.
- After `end Bundle`, add `/-! ## C2.3: the Euler class of the tangent bundle -/` and:

```lean
open scoped Manifold ContDiff in
/-- **The Euler number of a closed oriented manifold is its Euler characteristic** (C2.3;
Milnor–Stasheff, Corollary 11.12). For an orientation `o` of a compact boundaryless smooth
manifold `M` of dimension `n + 1`, the homological orientation `h` whose local orientations are
those `o` selects, and the Thom class `u` of the tangent orientation of `o` (pairing to `1` with
the local orientation of every tangent space), `⟨e(u), [M]⟩ = χ(M)`. -/
theorem eulerClass_tangentBundle_evalFundamentalClass_eq_eulerChar
    {E : Type} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
    {M : Type} [TopologicalSpace M] [T2Space M] [CompactSpace M] [ChartedSpace E M]
    [IsManifold 𝓘(ℝ, E) ∞ M] [TauCeti.FiniteCWType M] {n : ℕ} (hE : finrank ℝ E = n + 1)
    (o : TauCeti.Manifold.Orientation 𝓘(ℝ, E) M (Fin (n + 1)))
    (h : TauCeti.HomologicalOrientation M E (n + 1))
    (hh : ∀ x, h x = TauCeti.localOrientationOfManifoldOrientation o hE x)
    (u : (TauCeti.thomPair E (TangentSpace 𝓘(ℝ, E) : M → Type)).singularCohomology
      (ModuleCat.of ℤ (ULift.{0} ℤ)) ℤ (ModuleCat.of ℤ (ULift.{0} ℤ)) (n + 1))
    (hu : ∀ x, (TopPair.singularKronecker _ ℤ (n + 1)
        (TopPair.singularCohomologyMap (TauCeti.fiberThomPairMap E (TangentSpace 𝓘(ℝ, E)) x) _
          u)).hom (Orientation.localOrientation (F := E) (o.toVectorBundleOrientation x) hE).val =
        ULift.up 1) :
    h.evalFundamentalClass hE (ModuleCat.of ℤ (ULift.{0} ℤ)) (ContinuousMap.id M)
      (TauCeti.eulerClass (ModuleCat.of ℤ (ULift.{0} ℤ)) ℤ (ModuleCat.of ℤ (ULift.{0} ℤ)) E
        (TangentSpace 𝓘(ℝ, E) : M → Type) (n + 1) u) = ULift.up (TauCeti.eulerChar M) := by
  sorry
```

- In the docstring, state this headline in the introductory paragraph and delete the bullet at lines 61–69. The self-map identity `⟨f*e(TM),[M]⟩ = deg(f)χ(M)` is a corollary of this theorem and Euler naturality, so it stays in the README.
- README 1050–1063: name the theorem, and replace "construct first the identification … fixes the sign of the identity" with: the homological orientation is the one with the pinned `TauCeti.localOrientationOfManifoldOrientation` (`Singular/LocalHomology/Orientation/Chart.lean`) as its local orientations. Keep the chart-derivative comparison of the two generators as a proof step.

The ULift universes must be explicit. With a bare `ULift ℤ`, instance search on `ModuleCat ℤ` times out.

Tested:
- S² gives `⟨e,[S²]⟩ = 2 = χ`; T² and S¹ give 0 = 0.
- With `h` replaced by its negative, the pairing is −2 ≠ 2. So `hh` is needed, and it does not contain the conclusion.

## R02 (P2) — C5.1 states as its own the compact splitting and root data that LieGroups Layer 5A and Layer 6 own on main

Location: `README.md:1587–1603`: "State as this item's own input, with hypotheses G compact and connected: the orthogonal splitting `𝔤 = 𝔷(𝔤) ⊕ [𝔤,𝔤]` … the identification of t_ss,C as a Cartan subalgebra; and the actual root-pairing isomorphism". Line 1577 consumes only "LieGroups Layer1 and Layer6".

Claim: This pull request's commit beeacfb0 changed C5.1 from consuming "LieGroups Layer5A and Layer6" to stating these objects as its own. At the branch point LieGroups had no Layer 5A. It gained one in #1051, which has since merged into main. The CharacteristicClasses folder merges cleanly with main, so the merge would keep this head's text. The splitting, the Killing negativity, the Cartan identification and the root pairing would then have two owners.

The passage also contradicts itself: line 1605 says "a second construction of the Cartan/root dictionary is not made here".

Witness: main `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:655–656`: "prove `𝔤 = z(𝔤) ⊕ [𝔤,𝔤]` orthogonally, that `s=[𝔤,𝔤]` is a centerless semisimple ideal, and that its Killing form is negative-definite". Also line 750: "Prove t_ss,C is a Cartan subalgebra … Export its actual root-pairing isomorphism". Main's own C5.1 (line 1350) consumes them.

Repair:
- Line 1577: cite "[LieGroups Layer1, Layer5A and Layer6]".
- Replace 1587–1603 with: "Consume LieGroups Layer 5A's Ad-invariant metric, the orthogonal splitting `𝔤=𝔷(𝔤)⊕[𝔤,𝔤]` and the negative-definite Killing form of the semisimple ideal `[𝔤,𝔤]`, and Layer 6's identification of t_ss,ℂ as a Cartan subalgebra with its root-pairing isomorphism to LieHighestWeight's rootSystem."
- Keep as C5.1's own: the pinned unitarian form `ContRepresentation.isUnitarizable`, the scalar comparison with the Killing form on each simple factor, the transport through invariant polynomial functions, and the pinned Chevalley restriction.

Test: `grep -n "own input" README.md` returns nothing.

## R03 (P2) — CharacteristicClasses and TopologicalKTheory each supply the other through C1.1a

Location: `README.md:20–23`: "C1.0 and C1.1a construct their positive-rank oriented double covers, lifted finite cells and coordinate maps. TopK T1.6a owns the fixed-rank and stable colimits". Also C1.1a at 293–333 ("Before TopK T1.6"), 1508 and 1511.

Claim: This README consumes TopologicalKTheory T1, T1.3–T1.6a and T6.4. TopologicalKTheory, carried by this same pull request, takes C1.1a's lifted cells as the input of T1.6a. Each roadmap therefore names the other as a supplier, against the single-direction principle. The dependency check reports no problem: item by item the chain T1.5 → C1.1a → T1.6a → C1.1b is acyclic.

The back edge exists only to supply generic Grassmannian topology on a carrier that is already pinned: `TauCeti.finiteOrientedGrassmannian` with `forget`, `Tautological` and `tautologicalOrientation`, and the stabilization maps `rankStabilization` and `ambientStabilization` (`Topology/Grassmannian/Stabilization.lean:82, 116`).

Witness: this head's `TauCetiRoadmap/TopologicalKTheory/README.md:367` reads "compare using CharacteristicClasses C1.1a's finite oriented-cover precursor". Line 475 reads "CC C1.1a owns the positive-rank finite oriented lift"; lines 75 and 113 say the same.

Repair (#1854's current head 56715a5 already makes this README's half of the change):
- Lines 20–23: "Use TopK T1.5's finite real Grassmannians and tautological bundles, and TopK T1.6a's positive-rank finite oriented carriers, the pinned `TauCeti.finiteOrientedGrassmannian` (the orientation double cover of T1.5's tautological bundle), with their lifted cells, coordinate maps, fixed-rank and stable colimits, universal-bundle diagrams and classifier comparison. C1.0 and C1.1a identify the determinant-sign cover with these carriers."
- C1.1a: delete "Before TopK T1.6" and the construction at 320–331 (lifted cells, characteristic maps, rank/ambient squares). Keep instead: prove that the identification carries T1.6a's lifted cells and maps to the induced maps of determinant-sign covers, and that T1.6a's last-column SO comparison with sign (−1)^(n−1) is the transport of the determinant sign.
- Lines 1508 and 1511: "TopK T1.6a's oriented lift"; "These lifted cells and the fixed-rank and stable colimits belong to TopK T1.6a".
- TopologicalKTheory 75–79, 113–114, 297, 366–368, 431–432 and 475–477: T1.6a owns the lifted cells and oriented lifts on the pinned carrier, and C1.1a–b appear only as consumers.

Test: `grep -n "C1.1a" TauCetiRoadmap/TopologicalKTheory/README.md` then returns only consumer sentences.

## R04 (P2) — C7.1 makes a target depend on IndexTheory I7.2, and IndexTheory consumes C1–C7

Location: `README.md:2163–2164`: "Compare its pairing on a closed oriented twelve-manifold with IndexTheory I7.2's signature index formula."

Claim: IndexTheory is not on main. At its open head it consumes this roadmap throughout, and I7.2 itself needs C5. This sentence makes a C7.1 target consume I7.2, so the two roadmaps cite each other. The dependency check reads other roadmaps from main and cannot see IndexTheory's edges.

The comparison is not needed. The CP⁶ and HP³ Checks at 2170–2177 already test L₃ against the known signatures.

Witness: IndexTheory head (#1077), `TauCetiRoadmap/IndexTheory/README.md:236`: "[CharacteristicClasses C1–C7]". Its I7.2 *Needs:* line reads "Layers 6.1–6.3; SpinGeometry G2; ComplexKahlerGeometry K5; CharacteristicClasses C5."

Repair: replace 2163–2164 with "IndexTheory I7.2 consumes L₃ for the signature theorem in dimension twelve."

Test: `grep -n IndexTheory README.md` then returns only that consumer sentence.

## R05 (P3) — The not-statable list omits two headline comparisons, and two pinned names are attributed wrongly

Location: `Suggested.lean:44–88`; `README.md:5–6` ("Construct the compact connected Lie-group CE/de Rham, primitive/exterior and universal-transgression comparisons"); `README.md:946–947`; `README.md:1592`.

Claim:
- **Not-statable list.** The docstring names the exterior Hopf theorem but not two other headlines of the opening paragraph:
  - C5a.1's de Rham/Chevalley–Eilenberg comparison `H*_dR(K) ≅ H*(CE(𝔤;ℝ))`;
  - C5a.4–C5a.5's universal transgression `d_(2dᵢ)(zᵢ) = uᵢ`.

  Neither is statable at the pins: there is no all-degree CE complex, no Weil algebra and no classifying space of a compact Lie group.
- **`IsThomClass.pullback`.** The README cites it for "pullback of Thom classes along fibrewise isomorphisms". That statement is `TauCeti.IsThomClass.singularCohomologyMap` (`Topology/VectorBundle/EulerClass.lean:269`). `IsThomClass.pullback` (line 327) is its special case for f*E.
- **`HasCentralRadical`.** The README calls `LieAlgebra.HasCentralRadical` "LieHighestWeight L9's", but it is Mathlib's class (`Mathlib/Algebra/Lie/Semisimple/Defs.lean:75`).

Witness: Mathlib `Algebra/Lie/Cochain.lean` is titled "Lie algebra cohomology in low degree" and defines only `d₁₂` and `d₂₃`. Tau Ceti's `Algebra/Lie/Cohomology/` has only `LowDegree.lean` and `Continuous.lean`.

Repair:
- Add two docstring bullets naming these comparisons and the missing carriers.
- Line 947: cite both theorems, each for its own statement.
- Line 1592: write "Mathlib's `LieAlgebra.HasCentralRadical`".

## R06 (P3) — The sampled definitions have no Checks, and the README lacks the house headings

Location:
- `README.md:1`: "# Characteristic classes and Chern–Weil theory";
- C1.0 (229–292), C2.0 (858–931), C5a.1 (1692–1767), C5a.3 (1799–1853).

Claim: Each of these items defines objects:
- C1.0: the metric transport H^(−1/2) and the SO(n) subbundle;
- C2.0: the disk/sphere relative CW structure;
- C5a.1: j, A_forms, A_CE and H;
- C5a.3: W(𝔤), d_W, CS_P and τ(P).

None of them has a Checks block; the whole README has eight. It also has no `# Roadmap:` title, **Summary.**, `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build`, per-layer `### Examples` and `### Dependencies`, or `## Downstream consumers`.

Witness: `grep -c '\*\*Checks\.\*\*' README.md` is 8, and `grep -n '^## '` lists "Carriers, scope and suppliers", "Conventions", C1–C7 and "Dependency order and references".

Repair: rename the headings to the house shape, and add these Checks. Their values were computed in the table below.
- **C1.0.**
  - With h₀ = I and h₁ = diag(4,1), H = diag(4,1), and H^(−1/2) sends e₁ to e₁/2, of h₁-norm 1. The wrong power H^(1/2) gives 2e₁, of h₁-norm 4.
  - In rank 1 the SO(1) subbundle is the positive unit section; the Möbius line has none.
  - Rank 0 has the singleton frame.
- **C2.0.**
  - Over S² with cells in dimensions 0 and 2, a rank-2 bundle gets relative cells in dimensions 2 and 4. For the trivial bundle this is the Thom space S²∨S⁴; a shift by r−1 gives the wrong dimensions.
  - Rank 0 gives the Thom model X₊.
  - The sup-ball map sends (1,1) to (1,1)/√2, of Euclidean norm 1. The inverse formula would give (√2,√2).
- **C5a.1.**
  - In degree 1, da(X,Y) = −a([X,Y]), and Σₐ eᵃ∧L_(eₐ)a evaluates to −2a([X,Y]), confirming 2d = Σ eᵃ∧L_(eₐ).
  - For SU(2), H¹ = ann([𝔤,𝔤]) = 0 = H¹(S³).
  - A torus has zero CE differential.
- **C5a.3.**
  - For abelian 𝔤 = ℝ and P(X) = X, CS_P = θ and d_W θ = Ω.
  - For deg P = 2, τ(P) = 2·(−1/12)·B_P(θ,[θ,θ]) = −(1/6)·B_P(θ,[θ,θ]).
  - F₀ = 0 and F₁ = Ω. The sign (t²+t)/2 would give F₁ = Ω+[θ,θ].

## R07 (P3) — `cechSingularCWTypeComparison`, which ComplexComparisonPartII cites five times, no longer appears in C1.2b

Location: `README.md:715`: "Own the Čech/singular comparison on CW type: for every paracompact Hausdorff X of CW type". Main line 640 reads "Own `cechSingularCWTypeComparison`".

Claim: The pull request removed the backticked name, as the gate requires for names `Suggested.lean` does not declare. It gave no old → new mapping. ComplexComparisonPartII, an open roadmap, cites the name five times, so those citations dangle after the merge.

Witness: the ComplexComparisonPartII head (`roadmaps show ComplexComparisonPartII --pr 848`), README line 117: "C1.2b's locally acyclic singular-cochain sheaf resolution from `cechSingularCWTypeComparison`". The name also appears at 269, 746, 2962 and 2972.

Repair (either):
- Keep the label as plain text, as this pull request's AlgebraicTopology does with its own targets (line 712, "Own relativeCWPushoutCWModel:"): "Own cechSingularCWTypeComparison, the Čech/singular comparison on CW type:".
- Or name, in this pull request's merge-order paragraph, the rewrite of those five citations to "CharacteristicClasses C1.2b's Čech/singular comparison on CW type".

## R08 (P3) — The order with #1854, which rewrites this folder differently, is still not stated (previous R03, not repaired)

Location: the description's merge-order paragraph: "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**".

Claim: #1854's head has moved from c07dda7 to 56715a5. Its copy of this README now differs from this head's by 128 diff lines. For example, it hands the finite oriented carriers and lifted cells to TopologicalKTheory T1.6a, which is half of R03's repair. Whichever pull request merges second overwrites the other's folder. Neither description states which one wins.

Witness: `overlaps.md`: "#1808 and #1854 conflict in … `TauCetiRoadmap/CharacteristicClasses/README.md`, … `Suggested.lean`". `diff` of this README against #1854's: 128 lines, the first at line 20.

Repair: state the order with #1854 in the merge-order paragraph, and rebase the later branch on the earlier. The rebased branch must carry one agreed copy of this folder, the one that makes R03's change in both CharacteristicClasses and TopologicalKTheory.

## R09 (P3) — Two files outside the pull request's roadmap folders are still changed (previous R04, not repaired)

Location: `Completed/ArithmeticDirichletSeries/README.md:331` and `TauCetiRoadmap/SymplecticGeometry/README.md:77`.

Claim: Neither folder is one of the fifteen this pull request owns. The gate fails on exactly these two files.

Witness: gate "outside-folder=2 … FAIL". The two files come from commits e591d103 and 61e5385e; `git diff --stat` reports 2 insertions and 2 deletions.

Repair: rebase so that e591d103 and 61e5385e drop out, or move them to their own pull request.

## Previous findings (review r40 at 6931121)

- **R01 — repaired.** HomotopySpheres is cited nowhere: `grep -c HomotopySpheres README.md` is 0 and the gate reports `dropped=0`. Lines 24–28 now read "AlgebraicTopology Stage 4.5 supplies the compact-generation coreflection and the compactly generated substrate". C1.1d (518–531) uses the pinned Spin(3) cover and `TauCeti.realSpinThreeHomeomorphQuaternionSphere`.
- **R02 — repaired.** `Suggested.lean:36–42` and README 2326–2331 now read: "The smooth-action instance `ContMDiffConstSMul (𝓡 m) ω ℤˣ Sᵐ` is a target of C7.3a".
- **R03 — not repaired.** The description is unchanged, and #1854 has moved on. Now R08.
- **R04 — not repaired.** `outside-folder=2`. Now R09.

## Verified sound

**Gate, build and dependency check.**
- The worker's gate passes every count except `outside-folder=2`: `set_option=0 … sorry-data=0 … imports=0 … statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 … depcheck=0 … stray-files=0 … build=0`.
- `lake env lean TauCetiRoadmap/CharacteristicClasses/Suggested.lean` exits in 6 s. Its only warnings are `declaration uses sorry` at lines 125, 149, 165 and 187.
- Dependency check output: `depcheck: 239 roadmaps, 2378 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.

**Signatures.** I ran `#check @` on all four declarations in one scratch file. Each elaborated type matches its README statement (C2.1 at 950–965, C2.2 at 1024–1031, C7.3a at 2317–2331), with no binder lost. `FiniteDimensional ℝ F`, `[Module.Projective K R]`, `[T2Space B]` and the CW instance are all present. The `ContMDiffConstSMul` "instance, line 37" in `signatures.md` comes from docstring text; it is not a declaration.

**Padding probe.** I replaced each `sorry` with `first | simp | rfl | infer_instance | decide | trivial | aesop`, and none closes. The pinned compact-base theorems (`exists_isThomClass`, `exists_singularCohomology_thomPair_fiber`, `Orientation/ThomClass.lean:121, 186`) need `[CompactSpace B]`. The pinned Euler theorem (`eulerClass_eq_zero_of_forall_ne_zero`, `EulerClass.lean:383`) gives one direction only. No headline is padding.

**Docstring claims checked at the pin.** All of the following hold:
- `ContMDiffConstSMul (𝓡 2) ω ℤˣ S²` fails to synthesize.
- `TauCeti.instIsManifoldQuotient` requires it (`Geometry/Manifold/Instances/Quotient.lean:205, 242`).
- `Manifold.IsImmersion` uses maximal-atlas charts (`Immersion.lean:802`; `LocalSourceTargetProperty.lean:86`).
- There is no relative cup: `Cohomology/Cup.lean` and `Cap/Basic.lean` are absolute only.
- There is no de Rham-to-singular map: no `DeRham/*.lean` file mentions singular cochains.
- There is no graded cohomology ring, no infinite Grassmannian (`Topology/Grassmannian/` is finite only), no Chern class, and no topological Stiefel–Whitney class (only the quadratic-form `StiefelWhitney`).

The exception is the `e(TM)` bullet (R01).

**Pinned names opened.**
- Orientation and frames: `OrthonormalFrameBundle` (`OrthonormalFrame/Basic.lean`), `orientationCoverHomeomorph` and `toOrientationCover_eq_toOrientationCover_iff` (`Orientation/OrthonormalFrame.lean`), `nonempty_iff_exists_section` and `nonempty_iff_not_connectedSpace` (`Orientation/Cover.lean:533`), `VectorBundleOrientationCover.prodMap` (`Orientation/Prod.lean:147`).
- Grassmannians: `finiteOrientedGrassmannian` (`Grassmannian/Oriented.lean:44`).
- Thom classes: `existsUnique_singularCohomology_thomPairOver_iUnion` and `isZero_singularCohomology_thomPair` (`MayerVietoris/DirectedUnion.lean:227, 301`), `exists_isThomClass_of_compactSpace` (`MayerVietoris/Basic.lean:612`).
- Bundles and homotopy: `FiberBundle.t2Space_totalSpace` (`FiberBundle/Separation.lean:37`), `FiniteRankBundleCore.ofBundle` (`VectorBundle/FiniteRank/Basic.lean`), `HasHomotopyExtensionProperty.image` (`Homotopy/Extension/Basic.lean:275`).
- Spin: `isCoveringMap_realCliffordSpinDoubleCoverZero_rightHom` (`Spin/Covering.lean:108`, which takes `(n) [NeZero n] [CompactSpace …]`), `realSpinThreeHomeomorphQuaternionSphere` (`Spin/SimplyConnected.lean:124`).
- Lie algebras: the Chevalley and Killing names of C5.1 (`Killing/CartanRestriction.lean:247`, `HighestWeight/ChevalleyRestriction.lean:151`, `Killing/SymmetricAlgebra.lean`), `ContRepresentation.isUnitarizable`, Mathlib's `IsKilling.instSemisimple`, `InvariantForm.orthogonal` and `d₁₂_apply_apply_ofTrivial`.
- Power series: the multiplicative-sequence and genus names of C6.1 and C7.1.
- Homotopy groups: `HomotopyGroup.hurewiczAddEquiv` (`Hurewicz/Absolute.lean`).

**Cross-roadmap citations resolved.**
- AlgebraicTopology at this head:
  - Stage 4.5 (line 136) owns the coreflection `k`.
  - 4.7 (846) owns `simplicialRealizationCW`, one cell per nondegenerate simplex.
  - 4.8 (872) owns the Eilenberg compression, local-coefficient prisms and the coefficient-chain/Hom comparison that C1.2b consumes.
  - 5.5 (1007, 1114) owns the fibration LES with components and the multiplicative cohomological Serre sequence.
  - 8.3 (1932) consumes the pinned absolute Hurewicz, as C1.5a uses it.
- TopologicalKTheory at this head:
  - T1.5 (63) owns the rank-one projective diffeomorphisms and the graph-chart upgrade that C7.3a now cites.
  - T6.4 is compact-Lie descent at this head, but the pull request does not touch it. Main's T6.4 (1286, "Continuous principal-bundle foundation") is what C1.1b consumes, and `git merge-tree` keeps main's T6.4. The branch's two TopologicalKTheory conflicts with main (the DGFloer/AT5.5 Serre supplier) are for that roadmap's review.
- Elsewhere:
  - SpinGeometry G4.1a is on main at line 397, so the overlaps lead "only #1674 defines it" is false.
  - GeneralizedCohomology G4.0a is at 1783.
  - IndexTheory I7.2 is at #1077, line 1364.
  - LieGroups Layer 5A is at main 641 (R02).

**Interleavings I did not raise.** Three supply relations run both ways, are acyclic item by item, and pass the dependency check. Their repair would move substantive content between roadmaps on main:
- with AlgebraicTopology: its supported-cellular supplement and proper 8.5 consume C1.2a S0–S4 (lines 1391, 2502), while C1.5a consumes AT8.5;
- with GeneralizedCohomology: its supplier table (line 38) takes C1–C3, while C7.AdjointHopfObstruction takes G4.0a's HP¹;
- with SpinGeometry: G4.1a → C3.5 → G4.3.

The IndexTheory sentence in R04 predates this pull request (#1654), but it is raised because IndexTheory is not on main.

**Sources: seeded sample, read at their locators.**
- hatcher-vbkt:
  - line 633 (printed p. 16): S(E) and D(E) of a metric;
  - lines 1017–1030 (p. 26, §1.2): the Gram–Schmidt deformation retraction GLₙ(ℝ) → O(n);
  - lines 3426–3440 (p. 88, §3.2): the Thom class in Hⁿ(D(E),S(E)).
- cohen-fiber-bundles: line 2950 (2.4), and lines 2979–2992 for Proposition 3.7 (printed p. 87) with its disk/sphere boundary on p. 88.
- dupont-ln:
  - Proposition 2.20 (line 532), Proposition 2.21 (566), Example 4.3(2) (983, orientation as a GL⁺ reduction);
  - Propositions 9.1 (2138) and 9.3 (2195), Theorem 9.5 (2244), Lemma 9.6 (2264);
  - Proposition A2 (2627, the differential with sign (−1)^(i+j)), Proposition A7 (2713), Theorem A8 (2752).
- dupont-ccc:
  - Chapter 4 Exercise 3, (4.15)–(4.17) (lines 2247–2264): `TP(θ)=k∫P(θ∧U_s^(k−1))`, `U_s=sΩ+½(s²−s)[θ,θ]`;
  - Theorem 8.1 (3514), Proposition 8.3 (3548), Corollary 8.35 (3989).
- alekseev-meinrenken-chern-weil: §3.1 (lines 332–373), with (10) at 368, the Koszul identification at 357 and the basic subcomplex at 372. Acyclicity is via the standard homotopy operator (lines 300–304) and Remark 3.1 (379).
- hatcher-at: Theorem 3C.4 (12343), the §3.G E8 row (14239), Corollary 4D.3 (18734).
- zentner-instanton-sheet2: Exercise 2 (lines 45–61), `p₁(su(E))=−4c₂(E)+c₁(E)²` with `p₁=−c₂(su(E)⊗ℂ)`.

Every new locator in the change set matches its text.

**Adversarial table** (values computed on each side):

| Statement | Instance | Values | Result | Change |
| --- | --- | --- | --- | --- |
| C2.1 `existsUnique_…_fiber` | B=pt, F=ℝ², o=ω; second trivialization a reflection r | identity gives u=g; r carries o to −ω, giving u=−r*g=−(−g)=g, consistent | holds | — |
| same | rank 0, two points, signs (+,−) | u=(g,−g); the constant classes (g,g) and (−g,−g) fail | holds | — |
| same | B=∅; B=ℝ, trivial ℝ² bundle | H^r=0 so u=0, unique; H²≅(H₀(ℝ)→M)=M, so u is unique from g | holds; compact pin does not apply | — |
| C2.1 `exists_isThomClass_of_orientation` | K=ℤ, B=ℝ; K the zero ring | generator exists; in the zero module span{0}=⊤ | holds | — |
| same | Möbius over S¹ | cover connected, so no orientation; ℤ/2 class from the pin | consistent | — |
| C2.2 `eulerClass_eq_zero_iff…` | TS² over S² (cells 0,2), n=2 | e=2·gen≠0 / no section | both false | — |
| same | S²×ℝ²; oriented rank 2 over S¹ | e=0 / constant section; H²(S¹)=0 / trivial bundle | both true | — |
| same | su(F) on S⁴, rank 3 | cell of dimension 4>3, so hdim fails; e∈H³(S⁴)=0 / no section | hdim necessary | — |
| same | n=1 (excluded by hn) | e=0, since H¹(E)→H¹(E₀) is injective / trivial line has a section | hn redundant, harmless | note only |
| C7.3a `not_exists_isImmersion…` | k=1,2,3 | targets ℝ², ℝ⁶, ℝ¹⁴; w̄_(m−1)=a,a³,a⁷≠0; normal ranks 0,2,6 < 1,3,7 | holds | — |
| same | ℕ subtraction; k=0 | 2^(k+1)−2 = 2,6,14, never truncated; RP¹→ℝ⁰ impossible by dimension | hk harmless | — |
| same | instance chain | `ContMDiffConstSMul` absent; charts in the maximal atlas | docstring accurate | — |
| R01 proposed headline | S², T², S¹ | 2/2, 0/0, 0/0 | holds | add |
| same | h reversed | −2 vs 2 | fails, so hh is needed | — |
| R02 C5.1 | SU(2), U(2) | 𝔷=0, [𝔤,𝔤]=𝔰𝔲(2); 𝔷=iℝ, [𝔤,𝔤]=𝔰𝔲(2); Killing form negative on 𝔰𝔲(2): identical to LieGroups 655–656 | duplicated | consume |
| R03 C1.1a ↔ T1.6a | pinned oriented Gr₁(ℝ²) | S¹ → RP¹ of degree 2; lifted cells: two 0-cells, two 1-cells | generic Grassmannian topology | move |
| R04 C7.1 L₃ | CP⁶, HP³ | (2170−1911+686)/945=1; (496−624+128)/945=0 | the Checks test it | delete |
| C1.0 | h₀=I, h₁=diag(4,1) | H^(−1/2)e₁=e₁/2, h₁-norm² 1; H^(1/2) gives 16 | holds | Checks |
| C2.0 | S², rank 2; rank 0; (1,1) | cells 2,4 (S²∨S⁴); X₊; (1,1)/√2 has norm 1 | holds | Checks |
| C5a.1 | degree 1; SU(2); torus | −a([X,Y]) matches Dupont A2; Σeᵃ∧L gives −2a([X,Y]); H¹=0; d=0 | holds | Checks |
| C5a.2 | SU(3); E8 | degrees 2,3 → BSU gens 4,6 and SU gens 3,5 (3+5=8); E8 Σ(2d−1)=248 | holds | — |
| C5a.3 | k=1 abelian; k=2 | d_W P(θ)=P(Ω)−½P([θ,θ])=P(Ω); ∫₀¹(t²−t)/2 dt=−1/12 gives −1/6; F₀=0, F₁=Ω; τ(−a/2π)=−θ/2π | holds | Checks |
| C5a.4 | SU(2) | K_I=ℝ[P]⊗Λ(e), De=P; quotient Λ(e), |e|=3, which is H*(S³) | holds | — |
| C5a.5 | page indices | d_(2d): E^(0,2d−1) → E^(2d,0) = (p+r, q−r+1) | holds | — |
| C5a.6 | SU(2), U(2), trivial group | 1+t³ (Betti 2, top 3); (1+t)(1+t³) (Betti 4, top 4); χ=0; χ(pt)=1 | holds | — |
| C5a.7 | U(2), SU(2) integral | x₁, x₃; x₃ (Hatcher 4D.3) | holds | — |
| C7.AdjointHopf | roots 0, x−y, y−x; HP¹ | e₂=−(x−y)², so p₁=(x−y)²=c₁²−4c₂; p₁=−4u pairs to −4; e∈H³(S⁴)=0 | holds (Zentner line 50) | — |
| same | Z=diag(1,−1) | X=0, Y=diag(−i,i), X+iY=Z | holds | — |
| C1.5a Checks (new) | RP∞, CP∞ | H¹(RP∞;ℤ)=Hom(ℤ/2,ℤ)=0; π₂(CP∞)=π₁(S¹)=ℤ; ℤ/1 gives 0 | holds | — |
| C1.1d table (changed) | [S¹,O(2)], [S¹,O(k≥3)], [S²,O(k)] | ℤ⋊(ℤ/2); (ℤ/2)²; ℤ/2, using π₂(SO(3))=π₂(S³)=0 via the pinned cover | holds | — |

**Ownership.** `roadmaps grep` for the names this pull request turned into prose found one dangling citation (R07). Overlap leads: #1807's order is stated; #1854's is not (R08); the SpinGeometry lead is false.

## Not verifiable

- These are settled as uncertified in the manifest and cited by locator only: Milnor–Stasheff §4, §§9–15, §§18–19 and Appendix C (including Lemma 18.1 and Corollary 11.12, cited in R01's repair); Bott–Tu §§6, 11–14 and 20–23; Milnor, *Topology from the Differentiable Viewpoint* §6; Milnor, *Construction of Universal Bundles II* §§2–3.
- tom Dieck §§9.5, 13–14.4 and May Chapter 16 are outside this round's sample; I did not re-read them.
- Ownership against open pull requests was checked with the `roadmaps` tools for the objects of R02–R04 and R07 only, not for every object of the README.

## Source issues

- **Misprint** in cohen-fiber-bundles at Proposition 3.7, printed p. 87: the source says η is a bundle over X and ζ×η is a bundle over X∧Y; it should say η is over Y and ζ×η is over X×Y, with Thom space T(ζ)∧T(η); affects nothing.
