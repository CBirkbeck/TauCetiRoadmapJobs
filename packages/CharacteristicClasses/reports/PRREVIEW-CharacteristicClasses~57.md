# Review of CharacteristicClasses (pull request #1808 at 7933169)

**Verdict:** needs changes

This is an incremental re-review. Since dc47c7e, `TauCetiRoadmap/CharacteristicClasses/` has changed by 0 lines (`git diff dc47c7e HEAD -- TauCetiRoadmap/CharacteristicClasses` is empty), and the pins are unchanged. The six new commits touch AlgebraicCurves, AlgebraicTopology, BordismFormalGroups and ComplexKahlerGeometry.

None of the nine previous findings is repaired; R01–R09 below carry them with their witnesses re-read at this head. The AlgebraicTopology revision in this pull request makes two passages of this README wrong, R10 and R11, both P3. The worker's gate fails only on `outside-folder=2` (R09).

## R01 (P2) — `e(TM)[M] = χ(M)` is statable at the pins, but the module docstring says it is not and `Suggested.lean` omits it

Location: `TauCetiRoadmap/CharacteristicClasses/Suggested.lean:61–69`: "no identification of a tangent-bundle orientation with the homological orientation that fixes `[M]`, so the sign of `e(TM)[M]` has no carrier". Also README C2.3.

Claim: one manifold orientation `o` determines both orientations, so `o` fixes the sign:
- the pinned `TauCeti.localOrientationOfManifoldOrientation o hE x` gives the homological local orientation at `x`;
- `o.toVectorBundleOrientation` orients `TM`;
- `Orientation.localOrientation` normalizes the Thom class on each tangent space.

The headline is statable with no new definition.

Witness: Tau Ceti pin, `AlgebraicTopology/Singular/LocalHomology/Orientation/Chart.lean:202` defines `localOrientationOfManifoldOrientation`. `Cohomology/FundamentalClass.lean:88` defines `evalFundamentalClass`, and `Cellular/EulerCharacteristic/FiniteCWType.lean:123` defines `eulerChar`.

Repair (unchanged from the previous report):
- Add the four imports `TauCeti.AlgebraicTopology.Cohomology.FundamentalClass`, `TauCeti.AlgebraicTopology.Singular.LocalHomology.Orientation.Linear`, `TauCeti.AlgebraicTopology.Cellular.EulerCharacteristic.FiniteCWType` and `TauCeti.Geometry.Manifold.Orientation.Basic`.
- After `end Bundle`, add a `C2.3` section comment and this theorem, with a docstring citing Milnor–Stasheff, Corollary 11.12:

```lean
open scoped Manifold ContDiff in
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

- In the docstring, name this headline among the stated ones and delete the bullet at 61–69. The self-map identity stays in the README as a corollary.
- In README C2.3, name the theorem, and fix the homological orientation as the one whose local orientations are `TauCeti.localOrientationOfManifoldOrientation`.

Tested at this head: a scratch copy of `Suggested.lean` with this theorem (and `open Module in`) elaborates under `lake env lean`; the only warnings are five `declaration uses sorry`. Values: S² gives 2 = χ; T² and S¹ give 0 = 0. With `h` reversed the pairing is −2 ≠ 2, so `hh` is needed and does not contain the conclusion.

## R02 (P2) — C5.1 states as its own the compact splitting and root data that LieGroups Layer 5A and Layer 6 own on main

Location: `README.md:1576–1577`, "[LieGroups Layer1 and Layer6]". Also `README.md:1587–1603`: "State as this item's own input, with hypotheses G compact and connected: the orthogonal splitting `𝔤 = 𝔷(𝔤) ⊕ [𝔤,𝔤]` … the identification of t_ss,C as a Cartan subalgebra; and the actual root-pairing isomorphism".

Claim: on main these objects have an owner. If this text merges, the splitting, the Killing negativity, the Cartan identification and the root pairing have two owners. Line 1604–1605 ("a second construction of the Cartan/root dictionary is not made here") contradicts the passage.

Witness: main `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:641` "Layer 5A: compact Lie-algebra metric and splitting"; 655–656: "prove `𝔤 = z(𝔤) ⊕ [𝔤,𝔤]` orthogonally … its Killing form is negative-definite". Line 750 exports the root-pairing isomorphism. Main's own C5.1 (line 1350) consumes "LieGroups Layer5A and Layer6".

Repair:
- Line 1577: cite "[LieGroups Layer1, Layer5A and Layer6]".
- Replace 1587–1603: consume Layer 5A's metric, splitting and negative-definite Killing form of `[𝔤,𝔤]`, and Layer 6's Cartan identification and root-pairing isomorphism.
- Keep as C5.1's own: the pinned `ContRepresentation.isUnitarizable`, the scalar comparison on each simple factor, the transport through invariant polynomials, and the pinned Chevalley restriction.

#1854's copy at df0367f already reads this way (its line 2000).

Test: `grep -n "own input" README.md` returns nothing (now: line 1587).

## R03 (P2) — CharacteristicClasses and TopologicalKTheory each supply the other through C1.1a

Location:
- `README.md:20–23`: "C1.0 and C1.1a construct their positive-rank oriented double covers, lifted finite cells and coordinate maps. TopK T1.6a owns the fixed-rank and stable colimits";
- `README.md:293`: "C1.1a. Finite oriented-cover precursor. Before TopK T1.6";
- `README.md:1508` and `1511`.

Claim: this README consumes TopK T1, T1.5–T1.6a and T6.4. TopologicalKTheory, unchanged in this pull request since dc47c7e, takes C1.1a's lifted cells as T1.6a's input. Each roadmap names the other as a supplier. The dependency check passes only because the chain T1.5 → C1.1a → T1.6a → C1.1b is acyclic item by item.

Witness: this head's `TauCetiRoadmap/TopologicalKTheory/README.md:367` compares "using CharacteristicClasses C1.1a's finite oriented-cover" precursor. Line 475 reads "CC C1.1a owns the positive-rank finite"; lines 75, 113 and 297 say the same.

Repair:
- In this README, T1.6a owns the positive-rank finite oriented carriers (the pinned `TauCeti.finiteOrientedGrassmannian`), their lifted cells and the coordinate maps. C1.0 and C1.1a only identify the determinant-sign cover with them, and 1508/1511 read "TopK T1.6a's oriented lift".
- TopologicalKTheory 75–79, 113–114, 297, 366–368, 431–432 and 475–477: name C1.1a–b only as consumers.

#1854's copy at df0367f makes this README's half of that change (its lines 253, 264, 617–622).

Test: `grep -n "C1.1a" TauCetiRoadmap/TopologicalKTheory/README.md` then returns only consumer sentences.

## R04 (P2) — C7.1 makes a target depend on IndexTheory I7.2, and IndexTheory consumes C1–C7

Location: `README.md:2163–2164`: "Compare its pairing on a closed oriented twelve-manifold with IndexTheory I7.2's signature index formula."

Claim: IndexTheory is not on main. At its open head, IndexTheory consumes this roadmap throughout, and I7.2 itself needs C5, so the two roadmaps cite each other. The CP⁶ and HP³ Checks of C7.1 already test L₃ against the known signatures, so the comparison is not needed.

Witness: IndexTheory at 6d85f5d, `TauCetiRoadmap/IndexTheory/README.md:239`: "[CharacteristicClasses C1–C7]". Line 1390, I7.2's *Needs:*: "Layers 6.1–6.3; SpinGeometry G2; ComplexKahlerGeometry K5; CharacteristicClasses C5."

Repair: replace 2163–2164 with "IndexTheory I7.2 consumes L₃ for the signature theorem in dimension twelve." #1854's copy at df0367f has this sentence (its line 2715).

Test: `grep -n IndexTheory README.md` then returns only that consumer sentence.

## R05 (P3) — The not-statable list omits two headline comparisons, and two pinned names are attributed wrongly

Location:
- `Suggested.lean:44–88`;
- `README.md:5–6`: "Construct the compact connected Lie-group CE/de Rham, primitive/exterior and universal-transgression comparisons";
- `README.md:947` and `README.md:1592`.

Claim:
- The docstring does not name C5a.1's comparison `H*_dR(K) ≅ H*(CE(𝔤;ℝ))` or C5a.4–C5a.5's universal transgression among the headlines that are not statable.
- `README.md:947` cites `TauCeti.IsThomClass.pullback` for pullback along fibrewise isomorphisms. That statement is `TauCeti.IsThomClass.singularCohomologyMap`; `IsThomClass.pullback` is the special case for f*E.
- `README.md:1592` calls Mathlib's `LieAlgebra.HasCentralRadical` "LieHighestWeight L9's".

Witness: Tau Ceti pin, `Topology/VectorBundle/EulerClass.lean:269` (`IsThomClass.singularCohomologyMap`) and `:327` (`IsThomClass.pullback`). Mathlib pin, `Algebra/Lie/Semisimple/Defs.lean:75` (`class HasCentralRadical`).

Repair:
- Add two docstring bullets: no all-degree CE complex, no Weil algebra and no classifying space of a compact Lie group exist at the pins.
- Line 947: cite both theorems, each for its own statement.
- Line 1592: write "Mathlib's `LieAlgebra.HasCentralRadical`".

## R06 (P3) — The sampled definitions have no Checks, and the README lacks the house headings

Location: `README.md:1` "# Characteristic classes and Chern–Weil theory"; C1.0 (229–292), C2.0 (858–931), C5a.1 (1692–1767) and C5a.3 (1799–1853).

Claim: these items define objects and have no Checks block:
- C1.0: H^(−1/2) and the SO(n) subbundle;
- C2.0: the disk/sphere relative cells;
- C5a.1: j, A_forms, A_CE and H;
- C5a.3: W(𝔤), d_W, CS_P and τ(P).

The house headings are also missing.

Witness: `grep -c '\*\*Checks\.\*\*' README.md` gives 8. `grep -n '^## '` lists only "Carriers, scope and suppliers", "Conventions", C1–C7 and "Dependency order and references".

Repair: adopt the house shape (`# Roadmap:`, **Summary.**, Scope and ownership, Exact supplier contracts, How to read the build, per-layer Examples and Dependencies, Downstream consumers), and add the Checks the previous report computed:
- C1.0: H^(−1/2)e₁ = e₁/2 for h₁ = diag(4,1).
- C2.0: a rank-2 bundle over S² has relative cells in dimensions 2 and 4; the sup-ball map sends (1,1) to (1,1)/√2.
- C5a.1: Σeᵃ∧L_(eₐ)a = −2a([X,Y]); H¹ = 0 for SU(2).
- C5a.3: the transgression coefficient is −1/6 for degree 2; F₀ = 0 and F₁ = Ω.

#1854's copy at df0367f has the house headings and 17 Checks blocks.

## R07 (P3) — `cechSingularCWTypeComparison`, which ComplexComparisonPartII cites five times, no longer appears in C1.2b

Location: `README.md:715`: "Own the Čech/singular comparison on CW type: for every paracompact Hausdorff X of CW type". Main line 640 reads "Own `cechSingularCWTypeComparison`".

Claim: the label is gone, and there is no old → new mapping, so ComplexComparisonPartII's citations dangle when this merges. #1854's copy has the same gap.

Witness: `roadmaps grep --fixed cechSingularCWTypeComparison` finds ComplexComparisonPartII (#848, head fcf31bc) README lines 120, 277, 785, 3182 and 3192, and on main only this roadmap's line 640.

Repair (either):
- keep the label as plain text: "Own cechSingularCWTypeComparison, the Čech/singular comparison on CW type:";
- or record the rewrite of those five citations to "CharacteristicClasses C1.2b's Čech/singular comparison on CW type" in the merge-order paragraph.

## R08 (P3) — The order with #1854, which rewrites this folder differently, is still not stated

Location: the description's merge-order paragraph: "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**".

Claim: #1854's head has moved to df0367f. Its copy of this README differs from this head's by 1141 diff lines, starting at line 1 ("# Roadmap: characteristic classes and Chern–Weil theory"). Whichever pull request merges second overwrites the other's folder, and neither description says which wins.

That copy already contains the R02–R04 repairs, the house shape of R06, and the `HasCentralRadical`, `IsThomClass` and CE-comparison parts of R05. It does not contain R01, R07, R10 or R11.

Witness: `overlaps.md`: "#1808 and #1854 conflict in … `TauCetiRoadmap/CharacteristicClasses/README.md`, `TauCetiRoadmap/CharacteristicClasses/Suggested.lean`". `diff` against `roadmaps show CharacteristicClasses --pr 1854`: 1141 lines.

Repair:
- State the order with #1854 in the merge-order paragraph.
- Rebase so that both branches carry one agreed copy of this folder. Adopting df0367f's copy and applying R01, R07, R10 and R11 to it would repair R02–R06 in the same step.

## R09 (P3) — Two files outside the pull request's roadmap folders are still changed

Location: `Completed/ArithmeticDirichletSeries/README.md:331` ("`LFunctions` consumes this package and supplies its own character-specific continuation") and `TauCetiRoadmap/SymplecticGeometry/README.md:77`.

Claim: neither folder is one of the fifteen this pull request owns, and the gate fails on exactly these two files.

Witness: worker gate "outside-folder=2 … FAIL". `git log origin/main..HEAD` on the two paths gives e591d103 and 61e5385e (2 insertions, 2 deletions).

Repair: rebase so that e591d103 and 61e5385e drop out, or move them to their own pull request.

## R10 (P3) — The Bockstein and the tower Milnor sequence, which AlgebraicTopology now consumes from the pin, are still credited to AlgebraicTopology's construction

Location:
- `README.md:580–583`: "Consume AlgebraicTopology Stage6.1's coefficient long exact sequence and Bockstein construction on the existing singular/relative cochain complexes";
- `README.md:1242–1243`: "consume AlgebraicTopology Stage 6.0's countable-tower cochain Milnor sequence and Mittag–Leffler vanishing";
- the same attribution at 1470–1471 and 1517–1518.

Claim: at dc47c7e, AT6.1 constructed the coefficient long exact sequence and the Bockstein, and AT6.0 proved the Milnor cochain sequence. This pull request's AlgebraicTopology revision (commits 6c9a62ac, 55323ac5) changed both items: they now say these are pinned and are consumed. What AT still owns is:
- for 6.1, the compatibility with pair connecting maps and the cup-product Leibniz signs;
- for 6.0, the remaining comparisons.

This README therefore credits AT with constructions AT no longer makes, and it names none of the pinned declarations.

Witness:
- AT at this head, `README.md:1458–1462`: "the coefficient long exact sequence and the Bockstein … are pinned (`TopCat.singularCohomologyBockstein`, `TopPair.singularCohomologyBockstein`); consume them". The dc47c7e text read "construct … derive the coefficient long exact sequence and Bockstein".
- AT line 365 lists the pinned Milnor sequences and the Mittag–Leffler vanishing.

Repair:
- 580–583: "Consume the pinned coefficient long exact sequences and Bocksteins `TopCat.singularCohomologyBockstein` and `TopPair.singularCohomologyBockstein` (`AlgebraicTopology/Cohomology/Bockstein.lean`), with AlgebraicTopology Stage 6.1's compatibility with pair connecting maps and cup-product Leibniz signs, including 0→ℤ→[×2]ℤ→𝔽₂→0."
- 1242–1243, with 1470–1471 and 1517–1518 shortened to refer to it: "consume the pinned Milnor sequences `TauCeti.ComplexTower.limOneToHomology_injective`, `TauCeti.ComplexTower.exact_limOneToHomology_homologyToLim` and `TauCeti.ComplexTower.homologyToLim_surjective` (`Algebra/Category/ModuleCat/Tower/Milnor/Basic.lean`) and the Mittag–Leffler vanishing `TauCeti.ModuleTower.subsingleton_limOne_of_isMittagLeffler` (`Tower/MittagLeffler.lean`)".

Test:
- All six names exist at the pin: `Bockstein.lean:127` and `:278`, `Milnor/Basic.lean:501`, `:518` and `:532`, `MittagLeffler.lean:191`.
- For 0→ℤ→ℤ→𝔽₂→0 on RP∞, the pinned Bockstein sends a to the generator y of H²(RP∞;ℤ) = ℤ/2, which is C1.5's y = β(a).
- #1854's copy has the same four passages (its lines 871, 1633, 1862, 1909).

## R11 (P3) — C1.5a's first Check fixes a sign that AlgebraicTopology Stage 8.3 now leaves to an unpinned unit

Location: `README.md:825–828`: "The composite CP¹→CP∞→K(ℤ,2) represents the generator of π₂(K(ℤ,2))≅ℤ that is +1 under AT8.10's normalized identification; the map classifying −h represents −1".

Claim: AT8.10's identification is through the native Hurewicz map h: ⟨ι, h(x)⟩ is the label of x.
- At dc47c7e, AT8.3 gave h of a sphere map as its fundamental image, so the composite (a sphere map from CP¹ ≅ S²) read +1.
- At this head, AT8.3 gives h[g] = η₂·g′_*[S²], with η₂ = ε₁ a unit that AT deliberately does not fix. The composite now reads η₂, which may be −1, and the map classifying −h then reads −η₂.

C1.5a's prose (lines 805–810) is unaffected: it argues through h on both sides.

Witness: AT at this head, `README.md:2159–2163`: "η_(n+1)=ε_n for n≥1 … `h[g]=η_n·g′_*[Sⁿ]`". Lines 736–738: "prove the comparison is a unit ε_n∈ℤˣ … rather than asserting a fixed numerical sign". The dc47c7e text (line 1936) read "`h[g]=g'_*[S^n]`".

Repair: replace the first Check with: "The class x∈π₂(CP∞) whose native Hurewicz image is [CP¹] is sent by f_h to the element that is +1 under AT8.10's normalized identification, since ⟨ι,h(f_h∘x)⟩ = ⟨h,[CP¹]⟩ = +1. The map classifying −h sends x to −1. Read through an orientation-preserving sphere map CP¹≅S², the composite is η₂·x, with η₂ = ε₁ of AT8.3."

Tested: with ε₁ = −1, the Check as written gives −1 ≠ +1, while the restated Check gives +1 for every value of ε₁. #1854's copy carries the same Check (its lines 1154 and 1195).

## Previous findings

- R01 — not repaired: `Suggested.lean:61–69` still reads "no identification of a tangent-bundle orientation with the homological orientation that fixes `[M]`, so the sign of `e(TM)[M]` has no carrier", and the file states four theorems.
- R02 — not repaired: `README.md:1587` "State as this item's own input, with hypotheses G compact and connected: the orthogonal splitting `𝔤 = 𝔷(𝔤) ⊕ [𝔤,𝔤]`"; line 1577 "[LieGroups Layer1 and Layer6]".
- R03 — not repaired: `README.md:21–22` "C1.0 and C1.1a construct their positive-rank oriented double covers, lifted finite cells and coordinate maps"; line 293 "Before TopK T1.6"; TopologicalKTheory 475 "CC C1.1a owns the positive-rank finite".
- R04 — not repaired: `README.md:2163–2164` "Compare its pairing on a closed oriented twelve-manifold with IndexTheory I7.2's signature index formula."
- R05 — not repaired: `README.md:947` "pullback of Thom classes along fibrewise isomorphisms `TauCeti.IsThomClass.pullback`"; line 1592 "LieHighestWeight L9's `LieAlgebra.HasCentralRadical`"; the docstring has no CE/de Rham or transgression bullet.
- R06 — not repaired: `README.md:1` "# Characteristic classes and Chern–Weil theory"; 8 Checks blocks; no Scope and ownership, supplier-contract or Downstream consumers heading.
- R07 — not repaired: `README.md:715` "Own the Čech/singular comparison on CW type: for every paracompact Hausdorff X of CW type", with no `cechSingularCWTypeComparison` label or mapping.
- R08 — not repaired: the merge-order paragraph is unchanged ("#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**"), and #1854 is now at df0367f.
- R09 — not repaired: gate "outside-folder=2": `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`.

## Verified sound

**Gate, build and dependency check.**
- Gate rerun at this head: every count is 0 except `outside-folder`.
  - The standalone rerun reports `outside-folder=28`, because it is not given the pull request's own folders. `git diff --name-only origin/main...HEAD` confirms the split: 26 of the 28 files are in the fourteen sibling folders this pull request owns, and the other 2 are R09's files, as the worker's gate reports.
- `lake env lean TauCetiRoadmap/CharacteristicClasses/Suggested.lean` exits 0 in 10 s. Its only warnings are `declaration uses sorry` at lines 125, 149, 165 and 187.
- Dependency check output: `depcheck: 239 roadmaps, 2345 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `git diff dc47c7e HEAD -- lake-manifest.json` is empty, so the pins are those of the previous review.

**Signatures.** One scratch file ran `#check @` on all four declarations and on R01's theorem. The four elaborated types are identical to `signatures.md`, and no binder is lost. `FiniteDimensional ℝ F`, `[Module.Projective K R]`, `[T2Space B]` and `[Topology.CWComplex univ]` are present. The `ContMDiffConstSMul` "instance, line 37" in `signatures.md` is docstring text, not a declaration.

**Padding probe.** Carried from the previous report: file and pins are unchanged, and no `sorry` closes with `simp | rfl | infer_instance | decide | trivial | aesop`.

**Headline theorems.**
- Stated: C2.1 (Thom class, existence/uniqueness over an arbitrary base), C2.2 (Euler class as primary obstruction) and C7.3a (Whitney non-immersion of ℝP^(2^k)).
- Named as not statable: the Thom isomorphism, the Gysin sequence, the universal rings, Borel/Chern–Weil, the singular/de Rham comparison, the exterior Hopf theorem and the Chern character.
- Statable but absent: e(TM)[M] = χ(M) (R01). Missing from the not-statable list: the CE/de Rham comparison and the universal transgression (R05).

**Citations into the folders this pull request changed since dc47c7e.** The README has 77 `AT…` citations over 22 AlgebraicTopology items, plus the "AlgebraicTopology Stage …" prose citations, and 7 lines citing ComplexKahlerGeometry. All of them were resolved at this head.
- AlgebraicTopology at this head:
  - The item numbers of Stages 2–8 are unchanged.
  - A per-item diff against dc47c7e changes 4.5–4.8, 6.0–6.2, 7.2, 8.1–8.3, 8.5, 8.8, 8.10 and 8.12, and leaves 2.5, 5.5, 8.7 and 8.9 unchanged. Every changed item was re-read against the sentence that cites it.
  - 4.5 still owns the coreflection `k` (lines 138, 903), the mapping cylinder, the relative CW pushout and `relativeCWPushoutCWModel` (851), as C1.1/C1.2a/C2.0 cite (438, 632, 901, 918).
  - 4.6 transports the pinned `TauCeti.RealProjectiveSpace.cwComplex` (C1.5, C7.3a).
  - 4.7 owns `simplicialRealizationCW` (1000).
  - 4.8 owns the connected-map comparison with Eilenberg compression, prisms and the coefficient-chain/Hom comparison (1026–1048), as C1.2b and C3 cite (687–691, 1255).
  - 5.5 owns the fibration LES (1196–1206), as C1.1b and C1.3 cite.
  - 8.2 owns `kanRealizationUnitHomotopyIso`.
  - 8.8b, 8.10 and 8.12 still name CharacteristicClasses C1.5a as consumer (157–163, 2808–2811).
  - 8.9 is unchanged.
  - None of the eight renamed targets (2924–2942) is cited here.
- ComplexKahlerGeometry at this head:
  - K4 (1170) supplies Hermitian holomorphic bundles.
  - K7.1 (2223) is the projective carrier.
  - K7.2 (2265–2356) transports the pinned CPⁿ CW structure and normalizes ⟨u,[ℂP¹]⟩ = +1, and line 2315 names C1.5 as consumer. This agrees with C1.5's x = −h pairing to −1 (781–784): c₁(O(−1)) = −u.
- BordismFormalGroups cites C3's `H^*(BO(n);𝔽₂)=𝔽₂[w₁,…,w_n]`, which is this README's line 1367, and is not cited back.
- AlgebraicCurves neither cites nor is cited.

**Other citations re-resolved.**
- LieGroups Layer 5A is main 641 (R02).
- IndexTheory I7.2 is at #1077 (6d85f5d), lines 1371 and 1390 (R04).
- ComplexComparisonPartII is at #848 (fcf31bc) (R07).
- SpinGeometry G4.1a is on main at line 397, so the overlaps lead "only #1674 defines it" is false.
- ReflectionInvariantTheory §§1–4 (C5a.2, C5a.7) are on main at lines 7, 19, 40 and 68.

**Library declarations opened at the pins.**
- Tau Ceti:
  - `Chart.lean:202`;
  - `FundamentalClass.lean:88`;
  - `FiniteCWType.lean:123`;
  - `Orientation/Basic.lean:109`;
  - `EulerClass.lean:269, 327`;
  - `Cohomology/Bockstein.lean:127, 278`;
  - `Tower/MittagLeffler.lean:191`;
  - `Tower/Milnor/Basic.lean:501, 518, 532`;
  - `Homotopy/Relative/CellDimension.lean:64–136`;
  - `SimplicialSet/KanComplex.lean:48`;
  - `Homotopy/SingularSet.lean:164`.
- Mathlib: `Algebra/Lie/Semisimple/Defs.lean:75`.

**Seeded sample** (no passage changed since the previous review, which checked every locator; these were spot-checked again):
- hatcher-vbkt line 633 (printed p. 16), lines 1014–1020 (p. 26) and line 3426 (p. 88);
- cohen-fiber-bundles line 2979 (Proposition 3.7, p. 87);
- dupont-ln Propositions 2.20 (532) and 2.21 (566), Example 4.3 (976), Theorem 9.5 (2244), Lemma 9.6 (2264), Propositions A2 (2627) and A7 (2713), Theorem A8 (2752);
- dupont-ccc (4.15)–(4.17) (2251–2262), Theorem 8.1 (3514), Proposition 8.3 (3548), Corollary 8.35 (3989);
- alekseev-meinrenken-chern-weil (10) at line 368;
- hatcher-at Theorem 3C.4 (12343) and Corollary 4D.3 (18734);
- zentner-instanton-sheet2 line 50.

Each supports the statement as written in C1.0, C2.0, C5a.1–C5a.7 and C7.AdjointHopfObstruction.

**Adversarial table.** Rows marked (r45) are carried from the previous report for untouched statements. The rest are new or recomputed at this head.

| Statement | Instance | Values | Result | Change |
| --- | --- | --- | --- | --- |
| C2.1 `existsUnique_…_fiber` (r45) | B=pt, F=ℝ²; trivialization a reflection r | identity: u=g; r: u=−r*g=−(−g)=g | holds | — |
| same (r45) | rank 0, two points, signs (+,−) | u=(g,−g); (g,g) and (−g,−g) fail | holds | — |
| same (r45) | B=∅; B=ℝ, trivial ℝ² | H^r=0 so u=0; H²≅M, u unique from g | holds | — |
| C2.1 `exists_isThomClass_of_orientation` (r45) | K=ℤ, B=ℝ; K the zero ring | generator exists; span{0}=⊤ in the zero module | holds | — |
| C2.2 `eulerClass_eq_zero_iff…` (r45) | TS² over S² (cells 0,2), n=2 | e=2·gen≠0 / no section | both false | — |
| same (r45) | S²×ℝ²; oriented rank 2 over S¹ | e=0 / section; H²(S¹)=0 / trivial | both true | — |
| same (r45) | su(F) on S⁴, rank 3 | 4-cell > 3, hdim fails; e∈H³(S⁴)=0, no section | hdim necessary | — |
| C7.3a `not_exists_isImmersion…` (r45) | k=1,2,3 | targets ℝ², ℝ⁶, ℝ¹⁴; w̄_(m−1)=a,a³,a⁷≠0 vs normal ranks 0,2,6 | holds | — |
| same (r45) | ℕ subtraction | 2^(k+1)−2 = 2,6,14, never truncated for k≥1 | holds | — |
| R01 headline (recomputed) | S², T², S¹ | ⟨e,[M]⟩ = 2, 0, 0; χ = 2, 0, 0 | holds | add (R01) |
| same | h reversed on S² | −2 vs 2 | fails, so `hh` is needed | — |
| R02 C5.1 (r45) | SU(2), U(2) | 𝔷=0 / iℝ, [𝔤,𝔤]=𝔰𝔲(2), Killing negative on 𝔰𝔲(2) as in LieGroups 655–656 | duplicated | consume |
| R04 C7.1 L₃ (r45) | CP⁶, HP³ | (2170−1911+686)/945 = 1; (496−624+128)/945 = 0 | Checks test it | delete |
| C1.0 (r45) | h₀=I, h₁=diag(4,1) | H^(−1/2)e₁=e₁/2, h₁-norm² 1; H^(1/2) gives 16 | holds | Checks (R06) |
| C2.0 (r45) | S² rank 2; rank 0; (1,1) | cells 2,4 (S²∨S⁴); X₊; (1,1)/√2 of norm 1 | holds | Checks (R06) |
| C5a.1 (r45) | degree 1; SU(2); torus | da=−a([X,Y]); Σeᵃ∧L = −2a([X,Y]); H¹=0; d=0 | holds | Checks (R06) |
| C5a.2 (r45) | SU(3); E8 | gens 3,5, sum 8 = dim SU(3); Σ(2dᵢ−1)=248 | holds | — |
| C5a.3 (r45) | abelian; deg 2 | d_W P(θ)=P(Ω); ∫₀¹(t²−t)/2 = −1/12, giving −1/6; F₀=0, F₁=Ω | holds | Checks (R06) |
| C5a.4 (r45) | SU(2) | quotient Λ(e), \|e\|=3 = H*(S³) | holds | — |
| C5a.5 (r45) | page indices | d_(2d): E^(0,2d−1)→E^(2d,0) | holds | — |
| C5a.6 (r45) | SU(2), U(2), point | 1+t³; (1+t)(1+t³); χ=0; χ(pt)=1 | holds | — |
| C5a.7 (r45) | U(2), SU(2) integral | x₁, x₃; x₃ (Hatcher 4D.3) | holds | — |
| C7.AdjointHopf (r45) | roots 0, ±(x−y); HP¹ | p₁=(x−y)²=c₁²−4c₂; p₁=−4u pairs to −4; e∈H³(S⁴)=0 | holds | — |
| C1.5a prose (recomputed vs AT 8.3/8.10 at this head) | x∈π₂(CP∞) with h(x)=[CP¹] | ⟨ι,h(f_h∘x)⟩ = ⟨f_h*ι,h(x)⟩ = ⟨h,[CP¹]⟩ = +1, for every η₂ | holds | — |
| C1.5a first Check (R11) | sphere map g′: S²≅CP¹→K(ℤ,2), g′_*[S²]=f_h*[CP¹] | AT at dc47c7e: +1; at this head: η₂·(+1)=ε₁; with ε₁=−1, −1 ≠ +1 and −h reads +1 | depends on an unpinned unit | restate through h |
| C1.5 / CKG K7.2 normalization | CP¹ | ⟨u,[CP¹]⟩=+1 = ⟨h,[CP¹]⟩; c₁(O(−1)) = x = −h pairs to −1 (CC 781–784) | agrees | — |
| C1 item 2 Bockstein (R10) | 0→ℤ→ℤ→𝔽₂→0 on RP∞ | pinned β(a)=y generates H²(RP∞;ℤ)=ℤ/2, matching C1.5's y=β(a); AT6.1 now consumes the pinned β | holds; attribution wrong | cite the pin |
| C3 Milnor (R10) | skeletal tower Xᵏ of a CW base | surjective restrictions; lim¹ of eventually constant H^(n−1)(Xᵏ) = 0 by the pinned `subsingleton_limOne_of_isMittagLeffler` | holds; attribution wrong | cite the pin |

**Remarks on untouched text** (no change requested in this round):
- Two interleavings are unchanged: AlgebraicTopology's supported-cellular supplement and proper 8.5 consume C1.2a S0–S4, and C1.5a consumes AT8.5. Only names changed there ("CC" written out).
- C1.2b's "AT8.2 says Sing X is Kan" now resolves through AT8.2 to the pinned `TopCat.kanComplex_toSSet_obj`.
- C2.0's last sentence (931) describes RiemannianGeometry R3's use of AT8.1, whose connectivity theorems AT now consumes from `Homotopy/Relative/CellDimension.lean`.

**Ownership.** Checked with the `roadmaps` tools for the objects of R02–R04, R07 and R10, and for the CharacteristicClasses copies in #1807 and #1854. #1807's order is stated; #1854's is not (R08).

## Not verifiable

- These are settled as uncertified and cited by locator only: Milnor–Stasheff §4, §§9–15, §§18–19 and Appendix C (including Theorem 10.4, Lemma 18.1 and Corollary 11.12); Bott–Tu §§6, 11–14 and 20–23; Milnor, *Topology from the Differentiable Viewpoint* §6; Milnor, *Construction of Universal Bundles II* §§2–3.
- tom Dieck §§9.5 and 13–14.4, and May Chapter 16, are outside the sample and were not re-read.
- Ownership against open pull requests was checked only for the objects named under Ownership, not for every object of the README.
- The value of AlgebraicTopology's sphere unit ε₁ (R11) is not fixed by any text at this head. R11's repair is chosen so as not to depend on it.

## Source issues

- **Misprint** in cohen-fiber-bundles at Proposition 3.7, printed p. 87: the source says η is a bundle over X and ζ×η is a bundle over X∧Y; it should say η is over Y and ζ×η is over X×Y, with Thom space T(ζ)∧T(η); affects nothing.
