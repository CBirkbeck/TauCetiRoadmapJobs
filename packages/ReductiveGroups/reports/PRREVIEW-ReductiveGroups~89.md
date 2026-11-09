# Review of ReductiveGroups (pull request #1807 at f3a5953)

**Verdict:** needs changes

This pull request changes three lines of `TauCetiRoadmap/ReductiveGroups/README.md` (975–980). The review covers the whole folder at this head: README, `Suggested.lean` and the seven companion Lean files. The gate fails (R05, R10, R11), so the folder cannot be accepted as it stands. The dependency check reports no problem only because it exempts roadmaps on main. Read by hand, the README takes supplies from five roadmaps that consume it (R01–R04). Line 978 was the change meant to cut one of those loops, and the edge is still there.

## R01 (P1) — the supply loop with ReductiveGroupsPartII is still closed

Location: `TauCetiRoadmap/ReductiveGroups/README.md:692–694`: "**Supplier:** ReductiveGroupsPartII RG2.3.7 owns ordinary q-Frobenius Lang surjectivity, its quotient/H¹ consequences, and generic fixed-coset lifting. This layer consumes *lang-theorem* and *fixed-coset-lifting*". The same edge appears at `:715–719` (Layer 7a), `:839–841` (Layer 7d) and `:977–980` (the changed lines: "Lang statement consumed in Layer 7a"). A second edge is at `:1076–1078`: Layer 8 consumes "ReductiveGroupsPartII RG2.0a.1–2" for Weil restriction.

Claim: Layers 7a, 7d, 7g and 8 take supplies from ReductiveGroupsPartII, and ReductiveGroupsPartII consumes this roadmap. The rewording at line 978 keeps the edge ("consumed"), so this loop is still closed.

Witness: on main, `TauCetiRoadmap/ReductiveGroupsPartII/README.md:341–356` consumes ReductiveGroups Layers 0–9, and RG2.3.7 (`:5214`) reads "*Needs:* ReductiveGroups layer 3".

Repair: make Layer 7a the owner, as the open heads #1797, #1676 and #1332 already do (R17).
- State Lang–Steinberg: for a Steinberg endomorphism `F` of a smooth connected group over `F̄_p`, the map `g ↦ g⁻¹F(g)` is surjective (Milne, *Algebraic Groups* v2.00, Prop. 27.54, p. 487, `milne-iag` line 20248).
- State the q-Frobenius case (Cor. 27.55, p. 488, line 20264) and `H¹(F_q,G)=1` (Cor. 27.56, line 20269) as consequences.
- Keep `μ₂` over `F₃` as the negative Check: the Lang map is `z ↦ z²=1` and misses `−1` (line 20275).
- Cite Tau Ceti `MonoidHom.exists_fixed_inv_mul_of_surjective_commutatorMap` (`TauCeti/GroupTheory/FixedSubgroup/Lang.lean:76`) for fixed-coset lifting.
- In Layer 8, replace RG2.0a by Tau Ceti `TauCeti.Algebra.WeilRestriction.instHopfAlgebra`, `pointsMulEquiv` (`TauCeti/Algebra/HopfAlgebra/WeilRestriction.lean`), `multiplicativeGroupPoints` and `geometricallyConnectedCommHopfAlgProperty_multiplicativeGroup` (`MultiplicativeGroup/WeilRestriction/`).
- Delete the Supplier paragraph and the RG2.3.7 and RG2.0a clauses.

One change is owed in ReductiveGroupsPartII, in this pull request or a stacked one: RG2.3.7 and its `:61–62` cite Layer 7a, and its `Lang.lang_surjective` (`Suggested.lean:212`) moves here.

Tested on the instances above. Milne's hypotheses (smooth, connected) are RG2.3.7's. Milne's map `g ↦ gF(g⁻¹)` at `g = x⁻¹` is `x⁻¹F(x)`.

## R02 (P1) — §3A.5 and ComplexComparisonPartII C−1.1 supply each other, through interface names that do not exist

Location: `README.md:341–345`: "Over ℂ, consume ComplexComparisonPartII C−1.1's actual `.complexPoints`, `.closedSubspace`, `.proper`, `.separatedHausdorff` and `.smooth` interfaces".

Claim: §3A.5 takes the complex points and their topology from C−1.1, and C−1.1 takes the classical topology, charts and Lie group structure of `G(ℂ)` from §3A.5. This is a section-level cycle: the two roadmaps hand the same object to each other.

Witness: ComplexComparisonPartII at its head (#848), `README.md:785–788` and `:1067–1069`: "the classical topology on `G(ℂ)`, its smooth charts and its complex Lie group structure are ReductiveGroups §3A.5's". None of `complexPoints`, `closedSubspace`, `separatedHausdorff` occurs there.

Repair: one owner. ComplexComparisonPartII owns the analytification of finite-type ℂ-schemes. Take the ℂ comparison of §3A.5 (`:341–372`) out of this roadmap and put it in a later Part that follows ComplexComparisonPartII, LieGroups and SmoothBundlesConnections; it should cite C−1.1 by section and by its real declarations. §3A keeps 3A.1–3A.4, 3A.6, 3A.7 and the algebraic half of 3A.5 (properness of closed orbits in proper `X`). C−1.1 should then stop citing §3A.5 (that is for its own review). Tested: the 𝔾_m-on-P¹ test of 3A.7 (two closed fixed points, open orbit `ℂ*`) needs no analytic input.

## R03 (P1) — the supply loop with LieGroups (both on main)

Location: `README.md:356–358` ("as specified by LieGroups Layer6's early homogeneous-space floor"); `:605–607` ("use LieGroups Layer7 only for the already reductive factor's compact real form"); `:2102–2104` ("Consume the actual flag CW structure with only even real-dimensional cells from LieGroups Layer8").

Claim: §§3A.5, 6A and 11D consume LieGroups, which consumes this roadmap.

Witness: on main, `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:969–982`: its Layer 7 takes ReductiveGroups Layers 0, 1, 2, 6 and 7C. At `:1081` ReductiveGroups Layer 7 is the "single owner" of Bruhat, and `:1428` consumes ReductiveGroups Layers 0–4, 6, 7C.

Repair: this roadmap supplies LieGroups and consumes nothing from it. Move three passages to the Part of R02/R04, placed after LieGroups:
- the G(ℂ)/H(ℂ) manifold identification of §3A.5;
- the closing ℂ sentence of 6A;
- the homogeneous-fibre topology of 11D.

6A keeps its algebraic Levi theorem unchanged.

## R04 (P1) — Layer 11 consumes two roadmaps that consume this one

Location: `README.md:1962–1964` ("The lower smooth/holomorphic dictionary of FormalConnectionsOpers F4.3 uses those outputs and is a prerequisite for the analytic charts here"), with `:2089` and `:2099`; also `:1971–1972` ("Consume the early configuration contract InverseGaloisAndArithmeticFundamentalGroups IG.5.1") and `:1996` (IG.3.2).

Claim: Layer 11 takes F4.3, IG.5.1 and IG.3.2 as supplies, and both roadmaps consume ReductiveGroups.

Witness: FormalConnectionsOpers at #1056, `README.md:73` and `:262`: "From TauCetiRoadmap.ReductiveGroups", which takes Layers 0–9, 6B and §3A.5. InverseGaloisAndArithmeticFundamentalGroups at #850, `README.md:411` and `:1505`, takes ReductiveGroups Layers 0, 3 and 6.

Repair: move 11A and 11C–11G, with `SpectralWeylTargets.lean`'s content, into the later Part of R02–R03. Place that Part after FormalConnectionsOpers, InverseGalois…, LieGroups and AlgebraicTopology. 11B (finite Weyl arrangements, Brieskorn) uses only RootSystems and AlgebraicTopology, so it can stay here (R07). Tested: 11B's inputs listed at `:2019–2034` name neither FormalConnectionsOpers nor InverseGalois.

## R05 (P1) — sorry'd data in `Suggested.lean`; one theorem is about a `sorry`

Location: `TauCetiRoadmap/ReductiveGroups/Suggested.lean:134–136`: "noncomputable def characterKernelEquiv : … (Q →* ℤˣ) ≃* (projection S ρ).ker := by sorry". There are sorry'd fields in `liftSubgroup` (89–95), `characterTwist` (119–125), `characterInclusion` (127–131) and `liftableExtension` (143–150).

Claim: the gate fails on these five definitions. `characterKernelEquiv_value` (138–141) states a property of an equivalence whose value is `sorry`, so it cannot be proved for any definition.

Witness: gate `sorry-data: line 89, 119, 127, 134, 143`. `lake env lean` on the file gives `declaration uses sorry` at 89, 119, 127, 134, 138 and 143, and nothing else.

Repair: delete lines 80–159 (the `CoverLifts` namespace and the pointer comments after it). None of these is a headline. The kernel ≅ `Hom(Q,ℤˣ)` statement is an elementary fact about central extensions, and §9A.1a-L of the README keeps it. Tested: the mathematics is right. An automorphism fixing `ι` and `π` is `e ↦ e·ι(c(e))`, where `c` is multiplicative by centrality and trivial on `ι`, so `c ∈ Hom(Q,±1)`. Conversely every character gives such an automorphism. For `Q = 1` both sides are trivial.

## R06 (P1) — the seven companion Lean files hold 40 sorry'd definitions and form an API catalogue

Location: `SignedADETargets.lean:87`: "instance coverGroup … := Group.ofLeftAxioms (by sorry) (by sorry) (by sorry)". `SpectralWeylTargets.lean:286–291`: "noncomputable def arrangementArtinEquiv : … ≃* TauCeti.ArtinGroup (TauCeti.coxeterMatrixOfBase P b) := sorry".

Claim: the Lean form rules apply to every listed file, and these files break them.
- They define sorry'd data: CoverLiftTargets 5, FoldingADETargets 12, IntegralRationalTargets 3, SignedADETargets 11, SpectralWeylTargets 9.
- They import `Mathlib.*` submodules and this roadmap's own modules.
- 191 of their 276 declarations have no docstring.
- Brieskorn's theorem is forced into a sorry'd `def`.
- BruhatCoordinateTargets computes A2 examples, which mirror Checks.

Witness: `CoverLiftTargets.lean:1` is `import TauCetiRoadmap.ReductiveGroups.SignedADETargets`. `FoldingADETargets.lean:5–12` and `SignedADETargets.lean:4–10` are `import Mathlib.…` lines. The sorry'd definitions are, for example, `isometryGroup` (CoverLift:13), `fixedH` (FoldingADE:277), `integralPBWBasis` (IntegralRational:107) and `cameralEquiv` (SpectralWeyl:210).

Repair:
- Delete the seven files.
- Delete the README pointers to them (`:120–122`, `:427–429`, `:688`, `:1269–1270`, `:1297–1299`, `:1968–1969`) and the `Suggested.lean` comments at 67–78 and 154–159.
- State Brieskorn's theorem in `Suggested.lean` as a theorem (R07).

The README already carries every target.

## R07 (P2) — headline theorems that can be stated at the pins are absent, and the docstring names none that cannot

Location: `Suggested.lean:8–11`: "**This file is not the roadmap and is not exhaustive.** … The statements here suggest Lean forms for particular milestones". Also `:16–22`.

Claim: the file states no headline theorem. Four of the README's headlines elaborate against the pins on native carriers:
- characteristic-zero reductive ⇒ linearly reductive (`README.md:473–477`);
- conjugacy of maximal tori (`:628–629`);
- the Bruhat decomposition as a Tits system (`:629–630`, `:648`);
- Brieskorn's theorem (`:2036–2039`).

The docstring names no headline as not statable, for example the isomorphism and existence theorems of `:1024–1027`.

Witness: a scratch file with the block below elaborates with exactly four `declaration uses sorry` warnings. Tau Ceti says the char-0 converse "is not proved here" (`Reductive/LinearlyReductive.lean` docstring) and that conjugacy of maximal tori "is a separate theorem" (`Torus/Existence.lean`).

Repair: state these four, and write the docstring in house form. It should list each headline that is not statable and the carrier it lacks; for the isomorphism and existence theorems, that carrier is the root datum of a reductive group.

```lean
import Mathlib
import TauCeti.Algebra.AlgebraicGroup.Torus.Conjugation
import TauCeti.Algebra.AlgebraicGroup.Borel.Basic
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.Algebra.Coalgebra.Comodule.LinearlyReductive
import TauCeti.GroupTheory.TitsSystem.Basic
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Points.Basic
import TauCeti.LinearAlgebra.RootSystem.Coxeter.Matrix
import TauCeti.GroupTheory.Coxeter.Artin

universe u

open TauCeti

/-- Characteristic zero: a reductive group is linearly reductive. -/
theorem isLinearlyReductive_of_reductive {k : Type u} [Field k] [CharZero k]
    (H : FiniteTypeCommHopfAlgCat.{u, u} k) (hH : reductiveCommHopfAlgProperty k H) :
    Coalgebra.IsLinearlyReductive.{u, u, u} k H.obj := by sorry

/-- Maximal tori of a smooth group over an algebraically closed field are conjugate
(Milne, Algebraic Groups v2.00, Thm. 18.14). -/
theorem exists_eq_conjugate_of_isMaximalTorus {k : Type u} [Field k] [IsAlgClosed k]
    (H : Type u) [CommRing H] [HopfAlgebra k H] [Algebra.FiniteType k H] [Algebra.Smooth k H]
    {I J : HopfIdeal k H}
    (hI : HopfIdeal.IsMaximalTorus k (_root_.CommHopfAlgCat.of k H) I)
    (hJ : HopfIdeal.IsMaximalTorus k (_root_.CommHopfAlgCat.of k H) J) :
    ∃ g : WithConv (H →ₐ[k] k), J = I.conjugate g := by sorry

/-- Bruhat decomposition: `(G(k), B(k), N_G(T)(k))` is a Tits system (Milne, Thm. 22.72). -/
theorem exists_titsSystem {k : Type u} [Field k] [IsAlgClosed k]
    (H : FiniteTypeCommHopfAlgCat.{u, u} k) (hred : reductiveCommHopfAlgProperty k H)
    {B T : HopfIdeal k H} (hB : HopfIdeal.IsBorelOverAlgClosed k H B)
    (hT : HopfIdeal.IsMaximalTorus k H.obj T) (hTB : B ≤ T) :
    ∃ τ : TitsSystem (HopfAlgebra.points (R := k) (H := H.obj) (CommAlgCat.of k k)),
      τ.subgroupB = CommHopfAlgCat.quotientPointsSubgroup H.obj B (CommAlgCat.of k k) ∧
      τ.subgroupN = Subgroup.normalizer
        (SetLike.coe (CommHopfAlgCat.quotientPointsSubgroup H.obj T (CommAlgCat.of k k))) := by
  sorry

variable {ι κ : Type} [Fintype κ]
/-- The Weyl group acting on the complexified coroot space. -/
def corootWeyl (P : RootPairing ι ℂ (κ → ℂ) (κ → ℂ)) : Subgroup ((κ → ℂ) ≃ₗ[ℂ] (κ → ℂ)) :=
  Subgroup.closure (Set.range P.coreflection)
/-- The complement of the root hyperplanes. -/
abbrev RegularSet (P : RootPairing ι ℂ (κ → ℂ) (κ → ℂ)) :=
  {x : κ → ℂ // ∀ i, P.toLinearMap (P.root i) x ≠ 0}
/-- Its quotient by the Weyl group. -/
abbrev WeylQuotient (P : RootPairing ι ℂ (κ → ℂ) (κ → ℂ)) :=
  Quotient ((MulAction.orbitRel (corootWeyl P) (κ → ℂ)).comap (Subtype.val : RegularSet P → _))
/-- Brieskorn: the fundamental group of the regular orbit space is the Artin group. -/
theorem nonempty_weylQuotient_artin (P : RootPairing ι ℂ (κ → ℂ) (κ → ℂ)) [Finite ι]
    [P.IsCrystallographic] [P.IsReduced] (b : P.Base) (x : RegularSet P) :
    Nonempty (FundamentalGroup (WeylQuotient P) (Quotient.mk _ x) ≃*
      ArtinGroup (coxeterMatrixOfBase P b)) := by sorry
```

`Torus.Conjugation` had no object file at the pin and was built first with `lake build`.

## R08 (P2) — the README lists theorems Tau Ceti proves at the pin as targets, and says Tau Ceti lacks them

Location: `README.md:206–207`: "**Embedding theorem.** Prove that every affine group scheme of finite type has a faithful finite-dimensional representation / closed immersion into `GLₙ`". Also `:101–102` and `:202–205` (the closed-immersion theorem "require[s] [its] own statements and proofs"), `:139–151` (the anti-equivalence and the Γ identifications), `:1064–1069` (pseudo-reductive: define it, prove that reductive implies it) and `:66–79` ("Remaining roadmap targets").

Claim: these targets restate theorems in the pinned Tau Ceti.

Witness: Tau Ceti `AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear` (`Representation/Embedding.lean:212`); `commHopfAlgCatOpEquivAffineGroupSchemeCat` and `AffineGroupSchemeCat.hopfSpecCoordinateHopfAlgebraIso` (`AffineGroupScheme/Equivalence.lean:42`, `:81`); `pseudoReductiveCommHopfAlgProperty`, `reductiveCommHopfAlgProperty.pseudoReductive`.

Repair:
- Add a `From Tau Ceti` supplier contract naming the declarations above.
- Add the Layers 2–6 natives that "Remaining roadmap targets" ignores: `Bialgebra.leftInvariantDerivation` (`Tangent/`), the `HopfIdeal` quotient API, `HopfAlgebra.identityComponentHopfIdeal`, `DiagonalizableGroup.*`, `SplitTorus.instIsPerfPair`, `smoothUnipotentCommHopfAlgProperty`, `CommHopfAlgCat.IsCentralIsogeny` and `HopfIdeal.exists_isMaximalTorus`.
- Delete the restated targets and keep only what the pin lacks.

Tested: the scratch `example` closes the README's embedding statement with `exists_isClosedImmersion_generalLinear G` and no warning.

## R09 (P2) — seeded sample "Cross-cutting prerequisite: sheaves and descent": unowned, without a locator, and restating its suppliers

Location: `README.md:124–127`: "**Cross-cutting prerequisite: sheaves and descent.** The functor-of-points comparison, quotients, torsors and representability use the fppf topology and faithfully-flat descent". Also `:172–174` ("Develop the fppf sheaf, faithfully-flat descent, torsor, and representability machinery in the cross-cutting lane") and `:1059–1060` ("Build the needed sheaf-torsor and descent API here from Layer0 if no lower supplier has it").

Claim: no layer owns the "cross-cutting lane", the paragraph has no locator, and what it plans to develop is already supplied.

Witness: in Tau Ceti, `CommAlgCat.fppfTopology`, `TauCeti.CommHopfAlgCat.fppfQuotientSheaf` (`Algebra/AlgebraicGroup/Fppf/Quotient/Basic.lean:151`), `isPullback_fppfQuotientTorsor` and `FaithfullyFlatDescent.lean`. In Mathlib, `fppfTopology` (`AlgebraicGeometry/Sites/Fpqc.lean:54`). SchemeAndStackFoundations §§1.1, 1.13, 1.15 and 1.17 (`README.md:2044–2056` at this head).

Repair: replace the paragraph with supplier contracts naming these. In Layer 3, state only the new representability theorems, each with a locator: Milne v2.00 Def. 5.1, p. 81 (`milne-iag` line 3212), Prop. 6.1, p. 97 (line 3855), 6.5, p. 98 (line 3906), and App. A.q, p. 507 (line 21085). Tested on `𝔾_m/μ₂` over ℚ: the pointwise quotient `ℚˣ/{±1} → ℚˣ` misses `2`, so sheafification is needed, and that is what `fppfQuotientSheaf` constructs.

## R10 (P3) — gate `blob`: seven links pinned to commits of the roadmap repository

Location: `README.md:521, 1077, 1210, 1388, 1762, 1918, 1972`.

Claim: the gate fails on these seven links.

Witness: gate output `blob (7)`, the same seven lines.

Repair: cite by name and section, for example "IntegralHeckeAndGaloisDeterminants §0.7", "LieHighestWeight Layer 7", "GroebnerGeometry G5", "InverseGaloisAndArithmeticFundamentalGroups IG.5.1".

## R11 (P3) — gate `imports` and `mathlib-subimports`

Location: `Suggested.lean:1–3`: "import TauCeti.RepresentationTheory.Induction.FiniteDimensional.Basic / import Mathlib / import Mathlib.GroupTheory.GroupExtension.Basic".

Claim: the first import is not `Mathlib`, and line 3 imports a Mathlib submodule.

Witness: the gate's `imports` and `mathlib-subimports` lines.

Repair: start with `import Mathlib`, followed only by the `TauCeti.*` modules the kept statements use (for R07, the eight listed there), and delete line 3.

## R12 (P3) — padding in `Suggested.lean`

Location:
- `Suggested.lean:34–39` (`globalSectionsHopfAlgebra` restates a library instance by its generated name);
- `:42–43` (`specGroupObject := inferInstance`);
- `:55–64` (`indFromProjectedLevi`, `finrank_indFromProjectedLevi`);
- `:99–116` (`projection`, `coverAutomorphism`, `coverAction`, and `coverAction_projection := l.property.2 e`).

Claim: each of these restates a definition or closes in one term.

Witness: the probe `example … := TauCeti.finrank_indFDRep (A := FDRep.of (M.ρ.comp π))` proves `finrank_indFromProjectedLevi`'s statement with no warning.

Repair: delete them from `Suggested.lean`. The README keeps them as targets: the code block at `:154–164` becomes prose, and `:821–824` should state the dimension formula at the Lean file's generality (any field `k`, not just `ℂ`).

## R13 (P3) — the README is not in house shape

Location: `README.md:1–129`. The headings are "Standing hypotheses", "Three synchronized models", "Mathlib foundations to use", "Remaining roadmap targets", "Implemented foundations to consume" and "The build, in layers", with the layers as `###`; there are also "Design notes (from Zulip)", "Design references" and "Acknowledgements".

Claim: the README has no **Summary**, no Scope and ownership, no Conventions, no Exact supplier contracts and no How to read the build. It also has no `*Needs:*` line (count 0), no `**Checks.**` list (count 0), and no `### Examples` or `### Dependencies` in any layer.

Witness: `grep -c Checks README.md` gives `0`, and `grep -c 'Needs:'` gives `0`.

Repair: restructure into the house shape. Give each definition at least three Checks. The README already holds material for them: the GL₃ parabolics (`:996–1004`), the binary forms in characteristics 3 and 2 (`:1839–1843`), the `SL₂/N⁺` charts (`:1890–1904`) and the `γY` Smith example (`:1535–1538`).

## R14 (P3) — almost no target carries a locator

Location: Layers 0–11. For example `:628–630` (conjugacy, Bruhat), `:1024–1027` (isomorphism and existence), `:1809–1812` (Steinberg module) and `:2168–2170` (Brieskorn and Salvetti, named without a theorem).

Claim: only Conrad–Feng (`:641`), Dudas–Michel (`:749`, `:1008–1011`), McNinch (`:611`), Gros–Kaneda and Hedén carry locators. The README contains no page number.

Witness: `grep -c 'p\. [0-9]' README.md` gives `0`.

Repair: add theorem-and-page locators to every target, for example:
- Lang: `milne-iag` line 20248 (Prop. 27.54, p. 487);
- conjugacy of maximal tori: line 12801 (Thm. 18.14, p. 316);
- Bruhat: line 16857 (Thm. 22.72, p. 403).

## R15 (P3) — supplier drift

Location and repair, item by item:
- `:2111` "DGFloer Layer1.2's based fiber sequence". This pull request gives the fibration homotopy long exact sequence to AlgebraicTopology Stage 5.5 (`TauCetiRoadmap/AlgebraicTopology/README.md:118`, `:1319` at this head). Cite Stage 5.5.
- `:1274` "RootSystems4A". RootSystems on main has no 4A; the base stabilizer is §5.1 (its `README.md:43`, `:907`). Cite §5.1.
- `:1102` and `:2207` "milestone L5", and `:1637`, `:1645`, `:1650` "carrier plan". CFSGStatement on main contains none of "L5", "milestone" or "carrier plan". Give the carrier specification here in full, or cite the CFSGStatement section that exists.
- `:952` `Gassmann.AlmostConjugate`. The native is `Subgroup.AlmostConjugate` (Tau Ceti `GroupTheory/AlmostConjugate.lean:92`). `almostConjugate_iff_permutation_equiv` is InductionRestriction's (`Suggested.lean:729` on main) and resolves.
- `:678` "native `coveringHomeomorph`". It is defined in this folder (`BruhatCoordinateTargets.lean:104`). Say so, or cite the Mathlib lemmas it uses.

Witness: the files and lines above, read at main and at this head.

## R16 (P3) — process narrative and a pull-request number

Location:
- `README.md:2231` "mathlib4#39281";
- `:1638` "(`TauCeti.SpStd.specialIsogeny`, done)";
- `:1652` "that do not yet exist";
- `:66` "Remaining roadmap targets";
- `:101` "The remaining targets are";
- `:2183` "Design notes (from Zulip)";
- `Suggested.lean:74` "This pointer adds no import";
- `Suggested.lean:77–78` "this comment adds no reverse import or dependency on Layer11".

Claim: the house style is timeless and allows no pull-request references.

Witness: the quoted lines.

Repair: remove them, or rewrite them timelessly.

## R17 (P3) — three open pull requests change the same Layer 7a text the other way, and no order is stated

Location: `README.md:975–980`, this pull request's only change in the folder. The description's merge-order paragraph says "No open pull request must merge before this one".

Claim: #1797, #1676 and #1332 conflict with this head in `ReductiveGroups/README.md`. All three make Layer 7a the owner of Lang, while this head keeps ReductiveGroupsPartII as the supplier.

Witness: the overlaps list. At their heads: #1797 `README.md:15`, #1676 `:15`, `:2039`, and #1332 `:1904` ("This layer owns Lang surjectivity").

Repair: rebase on #1797, which already carries R01's direction, or state the order in the merge-order paragraph.

## Verified sound

**Gate and build.** The worker's gate fails (`blob=7 sorry-data=5 imports=1 mathlib-subimports=1`). My run agrees on those four. Its `outside-folder=23` lists only this pull request's own folders: `git diff --stat origin/main...HEAD` outside the fourteen named folders is empty, so that is not a finding. `lake env lean` on `Suggested.lean` gives six `declaration uses sorry` warnings and nothing else (6.9 s).

**Dependency check.** With `--content`:

```
depcheck: 239 roadmaps, 2312 edges, 0 problem(s)
```

It shows no UPWARD or CYCLE line. Without `--content` it prints `NOT IN ORDER: ReductiveGroups` (the roadmap is on main). The loops in R01–R04 are not visible to the tool, because it treats roadmaps on main as never-upward suppliers. That is not a false positive, but R01–R04 are its false negatives.

**Signatures.** All 15 declarations of `Suggested.lean` were run through `#check @name` in one scratch file. The types match `signatures.md`. The `and` entry there is a parser artifact (docstring line 17), not a declaration. No section binder is lost. The only README mismatch is `:821–824` (ℂ against any field `k`), in R12.

**Seeded sample.**
- "Supplier:" (`:692`). Checked against `milne-iag`: Prop. 27.54 (line 20248, p. 487) covers a Steinberg endomorphism of a connected group variety, "group variety" meaning smooth (line 100). Cor. 27.55 (line 20264, p. 488) is the Frobenius case, Cor. 27.56 (line 20269) gives `H¹ = 1`, and line 20275 records the failure for `ℤ/2`. RG2.3.7's statement and hypotheses match; the defect is the direction of supply (R01).
- "Sheaves and descent" (`:124`): no locator in the README. Milne's flat-sheaf, sheafification and descent locators are found and given in R09.
- Extra locator checked: Dudas–Michel Prop. 8.9 (`dudas-michel` line 1457, p. 32) matches `:749–753` exactly: a common maximal torus, `(P∩Q)U` parabolic with Levi `L∩M`, and unique factorization of `P∩Q`.

**Library declarations opened at the pins.** Tau Ceti:
- `Representation/Embedding.lean:117,192,212`
- `AffineGroupScheme/Equivalence.lean:42,81`
- `Fppf/Quotient/Basic.lean:151`
- `Reductive/Basic.lean` (`reductiveCommHopfAlgProperty_iff`)
- `Reductive/LinearlyReductive.lean`
- `Coalgebra/Comodule/LinearlyReductive.lean:249`
- `Torus/Maximal.lean:50`
- `Torus/Conjugation.lean:50,62,74`
- `Torus/Existence.lean`
- `Borel/Basic.lean:148`
- `TitsSystem/Basic.lean:50`
- `HopfIdeal/Points/Basic.lean:180`
- `Coxeter/Artin.lean:121`
- `RootSystem/Coxeter/Matrix.lean:278`
- `FixedSubgroup/Lang.lean:76,96`
- `HopfAlgebra/WeilRestriction.lean`
- `MultiplicativeGroup/WeilRestriction/Basic.lean`
- `GroupTheory/AlmostConjugate.lean:92`

Mathlib: `AlgebraicGeometry/Sites/Fpqc.lean:54` and `FieldTheory/Finite/Basic.lean:334`.

Of 39 further names the README cites, 37 were found at the pins (for example `serreLift`, `geckLieEquivOfEquiv`, `weylCoxeterSystem`, `rootPairingBaseChange`, `indTrivialEquiv`, `kostantFormComul_dividedPower`, `pointsFunctorIsoTensorAutFunctor`). `coveringHomeomorph` is in R15; `almostConjugate_iff_permutation_equiv` resolves in InductionRestriction.

**Cross-roadmap citations resolved** (main, or the head named):
- IntegralHeckeAndGaloisDeterminants §0.7 (#1689, `:1114`)
- SchemeAndStackFoundations §§0.3, 0.7, 2.6 (this head)
- ComplexComparisonPartII C−1.1 (#848)
- FormalConnectionsOpers F4.3 and F6 (#1056)
- InverseGalois IG.5.1 and IG.3.2 (#850)
- LieGroups Layers 6, 7, 8
- SmoothBundlesConnections B1.1 and B1.4
- LieGroupoidsPoisson G0.1
- RootSystems Layers 1–6 and §2
- LieHighestWeight Layers 3, 4, 7
- InductionRestriction Layer 2.1
- ModularCurves 0F
- GroebnerGeometry G5
- ReductiveGroupsPartII RG2.0a.1–2 and RG2.3.7
- DGFloer Layer 1 item 2

All of these resolve, except the ids in R02 and R15.

**Adversarial pass.** 41 rows, with computed values. Rows 5, 7, 8 and 9 are the headlines; rows 1–3 are the sampled targets.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | Lang (`:716–718`) | `𝔾_m/F_q`; `μ₂/F₃`; trivial | `x↦x^(q−1)` onto `F̄_qˣ`; `μ₂`: image `{1}≠{±1}`; trivial `{1}→{1}` | true with smooth and connected | R01 owner |
| 2 | `x⁻¹F(x)` against Milne's `gF(g⁻¹)` | `g=x⁻¹` | `gF(g⁻¹)=x⁻¹F(x)` | equal | none |
| 3 | sheaf quotient needed (`:124`) | `𝔾_m/μ₂` over ℚ | squares ⊊ `ℚˣ`; 2 ∉ image | sheafification required | R09 |
| 4 | faithful ⇔ coefficients of `V⊕Vˇ` (`:194–200`) | `𝔾_m→GL₁` | `t` gives `k[t]`; `t,t⁻¹` give `k[t,t⁻¹]` | true | R08 (pinned) |
| 5 | char 0 reductive ⇒ lin. red. | trivial; `𝔾_a/ℚ`; `SL₂/F₂` | trivial: all trivial; `𝔾_a`: `[[1,t],[0,1]]` not CR but not reductive; `SL₂/F₂`: `span(x²,y²)⊂R₂` without complement, excluded by `CharZero` | true | R07 |
| 6 | Nagata (`:476`) | torus; `SL₂` char 2 | torus CR; `∇(2)` not CR | true | none |
| 7 | conjugacy of maximal tori | trivial; `GL₂/k̄`; `SL₂/ℝ` | `g=1`; diagonal against conjugate; split against `SO(2)` not ℝ-conjugate | true; needs `IsAlgClosed`; connectedness not needed (Thm. 18.14) | R07 |
| 8 | Tits system | `𝔾_m`; `SL₂` | `B=T=N=G`, `W=1`, `S=∅`; `G=B⊔BsB` | true | R07 |
| 9 | Brieskorn | empty; A1; A2 | `π₁(ℂ^κ)=1`; `ℂ*/±≅ℂ*` gives `ℤ`; `B₃` | equals Artin group | R07 |
| 10 | kernel ≅ `Hom(Q,±1)` | central `E`; `Q=1` | `c(ee′)=c(e)c(e′)`, `c∘ι=1`; both trivial | true | R05 (data) |
| 11 | `liftSubgroup` closure | `(φψ,ab)`, inverse | `ρ(a)ρ(b)=ρ(ab)`; `π(φ⁻¹e)=ρ(a⁻¹)πe` | provable | R05 |
| 12 | `finrank_indFromProjectedLevi` | one term | `finrank_indFDRep` closes it | padding | R12 |
| 13 | Dudas–Michel 8.9 (`:749`) | hypotheses | source and README agree | true | none |
| 14 | GL₃ example (`:998–1004`) | `q=2` | `Q=[[a,0],[u,B]]` fixes no line; `\|G/P\|=\|G/Q\|=7` | true | none |
| 15 | Gassmann identity (`:962–964`) | `S₃`, `H=⟨(12)⟩` | `g=(12)`: 2=2; `(123)`: 0=0; `1`: 6=6 | true | none |
| 16 | rank-one identity (`:657`) | `SL₂` | both sides `[[1+ab,a],[b,1]]` | true | none |
| 17 | `n_α(a)` (`:658`) | `SL₂` | `[[0,a],[−1/a,0]]` | true | none |
| 18 | `I_w=A_(ww0)` and the A2 test (`:664–666`) | `w=s1` | `A_s1={α2,α1+α2}`, `A_(w0s1)={α2}`, `I_s1={α1}` | true | none |
| 19 | `2ρ∨` positive (`:672`) | simple roots | `⟨α_i,2ρ∨⟩=2` | true | none |
| 20 | `c_b=c+db`, split section (`:564–570`) | `V×H` product | `c_b=b(g)+g·b(h)−b(gh)+c`; `(−v,1)(0,g)(v,1)=(g·v−v,g)` | true | none |
| 21 | `ε(α₁+α₂,−α₁−α₂)=−1` (`:1171`) | A2 | exponent `1·1·(−1)`; `[E₁₃,−E₃₁]=−H` | true | none |
| 22 | `(a,s)⁻¹` (`:1146`) | product | `(0,s²ε²)=(0,1)` | true | none |
| 23 | commutator sign (`:1147`) | bimultiplicative `ε` | `ε(a,b)ε(b,a)=(−1)^B(a,b)` | true | none |
| 24 | folded Cartan (`:1498–1500`) | A3, A4, D4 | `[[2,−2],[−1,2]]`, `[[2,−1],[−2,2]]`, `[[2,−3],[−1,2]]` | true | none |
| 25 | `J` laws (`:1418–1420`) | general `m` | `Jᵀ=(−1)^(m−1)J`, `J²=(−1)^(m−1)I` | true | none |
| 26 | `γY` Smith form (`:1535–1538`) | `[[0,−1],[1,−1]]` | `det=3`, `diag(1,3)`; mod 3, `(1,−1)` fixed | true | none |
| 27 | A2 exchange index (`:1512–1516`) | | `[e,f]=h`; index `4` | true | none |
| 28 | opposite-root rule (`:1567–1568`) | `(1,1)`, `(1,2)` | `EF=FE+H`; `EF⁽²⁾=F⁽²⁾E+F(H−1)` | true | none |
| 29 | `μ₀` (`:1704–1705`) | weight `n` | `binom(n−1,p−1)≡[p∣n]` | true | none |
| 30 | not monoidal (`:1726–1727`) | weights `1`, `p−1` | both killed; product weight `p↦1` | true | none |
| 31 | char 3, `n=4` socle (`:1839`) | | `dim L(4)=4`, weights `±4,±2` | misses `x²y²` | none |
| 32 | char 2, `n=2` (`:1839–1842`) | | `g·y²∈span(x²,y²)`; `g·xy` spans `R₂` | true | none |
| 33 | `∇(n)` simple ⇔ `n=(a+1)p^m−1` (`:1830–1834`) | `p=2`, `n=2`; `p=3`, `n=4` | `dim L=2<3`; `4<5`; neither is of that form | true | none |
| 34 | `SL₂/N⁺` charts (`:1897–1902`) | | `det s_a=det s_c=1`; `u_c=u_a+1/(ac)` | true | none |
| 35 | `B_n→S_n` nonsplit (`:2002–2006`) | lift of a transposition | order 2 forces exponent sum 0, which contradicts odd sign | true | none |
| 36 | Weyl freeness (`:2025–2028`) | `x+iy` fixed | each root vanishes for at most one `c` | true | none |
| 37 | regular nilpotent in GL₂ (`:2062`) | `[[0,1],[0,0]]` | centralizer `{[[a,b],[0,a]]}≅ℂ*×ℂ` | true | none |
| 38 | SU₂ Weyl lift (`:2093`) | `[[0,−1],[1,0]]` | square `−I`, order 4 | true | none |
| 39 | `π₁(𝔤_rs)≅π₁(B_W)` (`:2113–2115`) | `π₁(G/T)=0`, `π₀=*` | injective and surjective | true | R15 (owner) |
| 40 | `p*q=q.trans p` (`:1993`) | Mathlib `Aut` | composition is reversed | true | none |
| 41 | disc map (`:1983–1984`) | | `w/√(1−\|w\|²)=z` | true | none |

## Not verifiable

- Howlett–Lehrer (1994) and Dipper–Du (1993), `:1012–1015`: paywalled, not in the source cache, and outside the sample. They are cited without theorem numbers (R14).
- Conrad–Gabber–Prasad, SGA3 Exposé XIX and Jantzen's book in References (`:2211–2217`): cited without locators, so there is nothing to check (R14).
- He (2018), Lem. 4.5: ReductiveGroupsPartII's locator for fixed-coset lifting. Not in the cache; R01's repair replaces it with the pinned Tau Ceti theorem.
- Ownership against open pull requests: checked against the heads available. FormalConnectionsOpers was read at its local checkout; ComplexComparisonPartII, InverseGalois, IntegralHecke… and ReductiveGroups (#1797, #1676, #1332) were read through `roadmaps show`.

## Source issues

- none
