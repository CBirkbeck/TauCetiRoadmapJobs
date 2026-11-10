# Review of ReductiveGroups (pull request #1807 at b765981)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/ReductiveGroups/` at `b765981` against the pins of `lake-manifest.json` (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`). The pull request changes `README.md` (Layers 3A.5, 6A, 6A.2, 7c, 8, 9A.1a, 9A.1a-L, 10B, 10D, 11A, 11D, 11G) and `Suggested.lean`; every other passage was reviewed as well. The gate passes, and so does the dependency check, but the check parses only 4 supplier edges from this README because it has no `*Needs:*` lines. Every prose citation was therefore resolved by hand, and that is where the blocking findings below come from.

## R01 (P1) — Two-roadmap cycle with ReductiveGroupsPartII through Lang's theorem (sampled target "Supplier:")

**Location.** `TauCetiRoadmap/ReductiveGroups/README.md` line 699: "**Supplier:** ReductiveGroupsPartII RG2.3.7 owns ordinary q-Frobenius Lang surjectivity, its quotient/H¹ consequences, and generic fixed-coset lifting." The same supply is repeated at lines 723, 847 and 986.

**Claim.** Layers 7a, 7d and 7g consume *lang-theorem* and *fixed-coset-lifting* from ReductiveGroupsPartII.

**Witness.** ReductiveGroupsPartII on main, line 21: "It extends the Reductive groups roadmap". RG2.3.7's *Needs:* line (line 5214) is "ReductiveGroups layer 3". So each roadmap supplies the other. This README's own Layer 7g (lines 986–988) owns Lang–Steinberg, which is Milne iAG v2.00 Prop. 27.54 (`milne-iag` line 20248). Lang's theorem, Cor. 27.55 (line 20264), is the special case `F` = q-Frobenius of that proposition.

**Repair.** Move the notion down into this roadmap:
- State *lang-theorem* in Layer 7a with locator Milne iAG v2.00, Cor. 27.55 and 27.56, p. 488. It covers a smooth, geometrically connected, finite-type group over `F_q`, the Lang map onto the `F̄_q`-points, `H¹ = 1`, and the exact-sequence surjectivity. Alternatively, derive it as the `σ = F` case of Layer 7g's Lang–Steinberg (Prop. 27.54, p. 487) and place that statement before 7a.
- State *fixed-coset-lifting* in Layer 7a as well.
- Delete the **Supplier:** paragraph and the RG2.3.7 citations at lines 723, 847 and 986.
- Record that RG2.3.7 keeps its id as a citation of ReductiveGroups Layer 7a. Several roadmaps cite RG2.3.7's `Lang.lang_surjective`, among them PELModuli, EndoscopicTransferAndUnitaryTraceComparison and AdelicAlgebraicGroups.

Tested on the RG2.3.7 non-example: for `μ₂` over `F_3`, the map `z ↦ z^{q−1} = 1` misses `−1`. The connectedness hypothesis still excludes this case.

The dependency check does not report the loop because it treats an extended base as never a consumer. Its `0 problem(s)` line is a false negative here.

## R02 (P1) — Cycles through three open roadmaps, each of them also upward of a roadmap on main

**Location.**
- `README.md` line 342: "consume ComplexComparisonPartII C−1.1's actual `.complexPoints`, `.closedSubspace`, `.proper`, `.separatedHausdorff` and `.smooth` interfaces".
- Lines 1992–1993: "Consume the early configuration contract InverseGaloisAndArithmeticFundamentalGroups IG.5.1".
- Lines 1985–1986: "The lower smooth/holomorphic dictionary of FormalConnectionsOpers F4.3 … is a prerequisite for the analytic charts here." The ordering paragraph at line 2196 repeats this.

**Claim.** These three roadmaps supply Layers 3A.5, 11A and 11C–11D.

**Witness.** None of the three is on main (`roadmaps list`: #848, #850, #1056). Each lists ReductiveGroups as its own supplier:
- ComplexComparisonPartII (line 786): "ReductiveGroups. Layer 3A.5 … the classical topology on `G(ℂ)`".
- InverseGaloisAndArithmeticFundamentalGroups (line 412): "ReductiveGroups Layers 0, 3 and 6".
- FormalConnectionsOpers (line 79): "ReductiveGroups Layers 0–9 and 6B owns".

**Repair.** A roadmap on main cites only main and the pins, so take over each piece here:
- **3A.5.** ComplexComparisonPartII already assigns the classical topology and charts on `G(ℂ)` to "ReductiveGroups §3A.5". State the point topology, the compact-Hausdorff comparison for proper `X` and the smooth charts as 3A.5 targets, and drop the C−1.1 input.
- **11A.** State `PConf_n(ℂ)` and `Conf_n(ℂ)` and their covering here, with the native `TauCeti.BraidGroup`, and drop IG.5.1. Lines 1997–2031 already specify all of it.
- **11C–11D.** Build the analytic charts from Mathlib's `HasStrictFDerivAt.toOpenPartialHomeomorph` (`Mathlib/Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean`), which holds over `ℂ`. Drop F4.3 from lines 1985–1987, from "FCO's lower … dictionary" in 11C and 11D, and from 11G.

## R03 (P1) — The companion Lean files carry sorry'd data and forbidden imports

**Location.**
- `SignedADETargets.lean` lines 143–144: `def rootLineQuotientEquiv … ≃ₗ[ℤ] (Root D →₀ ℤ) := by sorry`, and line 221, `normalizationEquiv … := by sorry`.
- `FoldingADETargets.lean` lines 190–194, `fixedIntegralBasis … := by sorry`, plus lines 223–227 and 362–367.
- `IntegralRationalTargets.lean` lines 107–109, `integralPBWBasis … := by sorry`.
- `SpectralWeylTargets.lean` line 64, `centerHomeomorph … := sorry`, plus lines 118 and 266 (a `MulAction … := sorry`).

**Claim.** These files are target signatures held to the same Lean form as `Suggested.lean`.

**Witness.**
- Whole-body `sorry` on `def`s and an instance, plus theorems about them (`centerHomeomorph_fst`, line 67).
- `Mathlib.<submodule>` imports, for example `SignedADETargets.lean` lines 4–10.
- Imports of this roadmap's own module: `import TauCetiRoadmap.ReductiveGroups.Suggested` in `IntegralRationalTargets.lean`, `OrbitGeometryTargets.lean` and `SpectralWeylTargets.lean`, line 1 of each.
- `CoverLiftTargets.lean` has 1 docstring for 13 declarations.

**Repair.**
- Delete `IntegralRationalTargets.lean`, `SignedADETargets.lean`, `FoldingADETargets.lean`, `CoverLiftTargets.lean`, `SpectralWeylTargets.lean`, `OrbitGeometryTargets.lean` and `BruhatCoordinateTargets.lean`.
- Delete the README sentences that point to them: lines 120–122, 433–435, 695, 1290–1291, 1317–1319 and 1989–1990.
- Move any headline among them that is statable with real carriers into `Suggested.lean` (R06).

## R04 (P2) — IntegralHeckeAndGaloisDeterminants is cited as a supplier but is not on main

**Location.** `README.md` lines 221–223: "The generic cofree-resolution/rational-cohomology and cotensor-induction constructions are supplied by IntegralHeckeAndGaloisDeterminants0.7". Also line 527 (6A.2) and line 1783 (10B).

**Claim.** §0.7 of that roadmap supplies Layer 6A's rational cohomology and Layer 10B's induction.

**Witness.** IntegralHeckeAndGaloisDeterminants exists only in open #1689. For induction, the pinned Tau Ceti already has `TauCeti.Comodule.induced` and `TauCeti.Comodule.inducedEquiv` (`TauCeti/Algebra/Coalgebra/Comodule/Induced.lean`): the cotensor equalizer with the convention `F(hg)=hF(g)`, and Frobenius reciprocity.

**Repair.**
- In 10B (line 1783), cite `TauCeti.Comodule.induced` and `inducedEquiv` and keep the antipode transport.
- In 6A.2, state the Hochschild complex `Cⁿ = V ⊗ k[H]^{⊗n}` and `Hⁿ_alg` for a flat commutative Hopf algebra as this roadmap's own target, with a locator in Jantzen, *Representations of Algebraic Groups*, Part I §4. It can build on `TauCeti.Comodule.cofree` and `TauCeti.ComoduleCat`.
- Delete lines 221–225.

## R05 (P2) — "Cross-cutting prerequisite: sheaves and descent" (sampled) has no owner or locator, and re-plans pinned material

**Location.** `README.md` lines 124–127: "The functor-of-points comparison, quotients, torsors and representability use the fppf topology and faithfully-flat descent: presheaves on `CommAlgCat k`, Yoneda/representability, fppf sheafification, torsors, and faithfully-flat descent." Also lines 172–174, "Develop … in the cross-cutting lane", and line 1067, "Build the needed sheaf-torsor and descent API here from Layer0 if no lower supplier has it."

**Claim.** This lane develops the fppf and descent foundations.

**Witness.** The pinned Tau Ceti already has most of this:
- the topology `CommAlgCat.fppfTopology` (`TauCeti/Algebra/Category/CommAlgCat/Fppf.lean:61`);
- `TauCeti.HopfAlgebra.pointsPresheaf_isSheaf`;
- `TauCeti.CommHopfAlgCat.fppfQuotientSheaf` (`Fppf/Quotient/Basic.lean:151`);
- `Fppf/Quotient/Torsor.lean`.

On main, SchemeAndStackFoundations owns fpqc descent (§1.1), the quotient sheaf (§1.5) and torsors (§1.15). "The cross-cutting lane" is not a layer, and no locator is given.

**Repair.**
- Replace the paragraph and line 1067 with a supplier contract naming those declarations, SchemeAndStackFoundations §§1.1, 1.5 and 1.15, and Mathlib's `fppfTopology` and `fpqcTopology` (`Mathlib/AlgebraicGeometry/Sites/Fpqc.lean`).
- State the comparison between Tau Ceti's affine site `(CommAlgCat R)ᵒᵖ` and SchemeAndStackFoundations' presheaves on schemes.
- Keep, as Layer 6A.1 targets with locators, only the roadmap-specific facts: vector-group torsors over affine `k`-schemes are trivial, and `U(k)→(U/U₁)(k)` is surjective.

## R06 (P2) — `Suggested.lean` states no headline theorem, and a statable one is absent

**Location.** `Suggested.lean` lines 4–23: the docstring lists "native signature examples" and "the carrier of Layer 9A.1a-L". The file contains no `sorry`; `lake env lean` prints nothing.

**Claim.** The file is the roadmap's acceptance test.

**Witness.** This scratch probe elaborates against the pins with only the `sorry` warning:

```lean
theorem exists_conjugate_eq_of_isMaximalTorus {k : Type u} [Field k] [IsAlgClosed k]
    {H : Type u} [CommRing H] [HopfAlgebra k H] [Algebra.FiniteType k H]
    {I J : TauCeti.HopfIdeal k H}
    (hI : TauCeti.HopfIdeal.IsMaximalTorus k (CommHopfAlgCat.of k H) I)
    (hJ : TauCeti.HopfIdeal.IsMaximalTorus k (CommHopfAlgCat.of k H) J) :
    ∃ g : WithConv (H →ₐ[k] k), I.conjugate g = J := by
  sorry
```

The pin has this theorem only under a conjugate-into-reference hypothesis (`TauCeti/Algebra/AlgebraicGroup/Torus/Conjugation.lean:149`).

**Repair.**
- State maximal-torus conjugacy as above. Its instances: two maximal tori of a non-smooth or disconnected group lie in `(G_red)°`, so the statement holds without smoothness, as Borel conjugacy does at the pin.
- State every other headline that is statable at the pins. Candidates: Lang over `F_q` once R01 places it in Layer 7a; Mostow's Levi decomposition (6A); the Bruhat decomposition; `π₁(V_reg/W) ≃ TauCeti.ArtinGroup (coxeterMatrixOfBase P b)` (11B).
- Rewrite the docstring to the standard form. It should list the headline theorems, name each one that is not statable together with its missing carrier (for example the root datum of a group, or the split classification of Layer 8), and say that the headlines already proved at the pin are cited in the README (R09).

## R07 (P2) — Layer 3A.5's rewritten supplier sentence cites the wrong owner and denies a dependency it has

**Location.** `README.md` lines 357–363: "Consume SmoothBundlesConnections B1.1/B1.4 for the principal-bundle projection G(ℂ)→G(ℂ)/H(ℂ) … and LieGroupoidsPoisson G0.1 for regular fibre products; … nothing of LieGroups is an input here."

**Claim.**
- LieGroupoidsPoisson G0.1 supplies regular fibre products.
- Neither a closed-subgroup theorem nor anything of LieGroups is an input.

**Witness.**
- LieGroupoidsPoisson G0.1 (lines 301–302) says fibre products "are consumed from SmoothBundlesConnections B1.0 and are not constructed here".
- SmoothBundlesConnections B1.4's *Needs:* line (line 490) is "B1.1; LieGroups Layer 2", the closed-subgroup theorem. LieGroups, which lines 361 and 429 call a consumer of this layer, is therefore a transitive supplier of it.

**Repair.**
- Cite SmoothBundlesConnections B1.0 for regular fibres and fibre products.
- Replace "no closed-subgroup theorem … nothing of LieGroups is an input here" with: "B1.4's `G/H` uses LieGroups Layer 2; LieGroups' later layers consume this one".
- Say that the complex structure on `G(ℂ)/H(ℂ)` is transported from the smooth reduced orbit `O_x(ℂ)` through the bijection. B1.4 builds a real smooth quotient.

## R08 (P3) — Padding in `Suggested.lean`

**Location.** `Suggested.lean`: lines 34–43 (`globalSectionsHopfAlgebra`, `specGroupObject`), lines 55–64 (`indFromProjectedLevi`, `finrank_indFromProjectedLevi`) and lines 79–112 (`liftSubgroup`, `LiftGroup`, `projection`).

**Claim.** These are the definitions a headline needs.

**Witness.** No headline uses them. A scratch copy confirms each is one library step:
- `finrank_indFromProjectedLevi` closes with `exact TauCeti.finrank_indFDRep (A := FDRep.of (M.ρ.comp π))`.
- `specGroupObject` is `inferInstance`.
- `globalSectionsHopfAlgebra` is a single Mathlib instance term.

**Repair.** Delete all seven declarations and the README code block at lines 154–164. The README keeps the statements as prose; lines 828–832 and 1256–1259 already state them. This also removes the imports the R03 files rely on.

## R09 (P3) — Theorems proved at the pinned Tau Ceti are still planned as open targets

**Location.** `README.md`:
- lines 206–210, "Prove that every affine group scheme of finite type has a faithful finite-dimensional representation / closed immersion into `GLₙ`";
- 3A.2–3A.4 (lines 279–333);
- lines 477–483, the characteristic-zero equivalence;
- 6B (lines 622–632);
- line 635, Borel conjugacy.

**Claim.** These are targets of this roadmap.

**Witness.** Each is already at the pin:

| README target | Pinned Tau Ceti declaration |
|---|---|
| Embedding into `GLₙ` | `TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear` (`Algebra/AlgebraicGroup/Representation/Embedding.lean:212`) |
| 3A.2 local closedness | `TauCeti.SchemeAction.isLocallyClosed_orbit` (`AlgebraicGeometry/GroupAction/LocallyClosed.lean:177`) |
| 3A.3 boundary dimension | `topologicalKrullDim_orbitBoundary_lt` (`LocallyClosed.lean:213`) |
| 3A.4 closed orbits | `exists_isClosed_orbit` (`GroupAction/ClosedOrbit.lean:178`) |
| Char-0 reductive ⇔ linearly reductive | `reductiveCommHopfAlgProperty_iff_linearlyReductive` (`Reductive/CompleteReducibility.lean:118`) |
| 6B Matsushima | `isIso_fppfHomogeneousQuotientToCoinvariantsPoints_of_reductive` (`Fppf/Quotient/Homogeneous/Coinvariants.lean:255`) |
| Borel conjugacy | `TauCeti.HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq` (`Borel/Conjugacy/Existence.lean:133`) |

**Repair.** List these in the supplier contracts and delete the corresponding "Prove …" sentences. Keep only what the pin lacks, for example 3A.5–3A.6.

## R10 (P3) — Layer 7f restates an identity proved at the pin and consumes a sorry'd copy of the criterion

**Location.** `README.md` lines 958–974: "consume `Gassmann.almostConjugate_iff_permutation_equiv` … this roadmap does not treat it as already proved … The target identity is `Nat.card (MulAction.fixedBy (G ⧸ H) g) * Nat.card H = …`".

**Claim.** The identity is an open target, and the criterion comes from InductionRestriction.

**Witness.** The displayed identity is `Subgroup.natCard_fixedBy_mul_natCard` (`TauCeti/GroupTheory/QuotientGroup/Basic.lean:177`), verbatim. The criterion is `TauCeti.almostConjugate_iff_nonempty_equiv_ofMulAction` (`RepresentationTheory/CharacterTable/FixedPointCount.lean:183`). InductionRestriction's copy rests on a `sorry` (its `Suggested.lean`, lines 660–664).

**Repair.** Cite `Subgroup.AlmostConjugate`, `Subgroup.natCard_fixedBy_mul_natCard` and `TauCeti.almostConjugate_iff_nonempty_equiv_ofMulAction`, and delete lines 962–974. Tested: for `S₃`, `H=⟨(12)⟩` and `g=(12)`, both sides equal `1·2 = 2·1`.

## R11 (P3) — No stated order against four open pull requests that change this folder differently

**Location.** The pull-request description (data): "No open pull request must merge before this one."

**Claim.** The merge order is settled.

**Witness.** `scratch/overlaps.md` reports conflicts in `ReductiveGroups/README.md` and `ReductiveGroups/Suggested.lean` with #1332, #1676, #1797 and #1854. These change the same targets differently:
- #1854's head (line 837) puts Lang's theorem in Layer 7a.
- #1854 keeps LieGroups Layer 8 and DGFloer Layer 1.2 in 11D (lines 2305 and 2312).
- #1797 replaces `Suggested.lean` with headline statements.

**Repair.** In the merge-order paragraph, state which of these pull requests rebases on which, and reconcile 7a (R01) and 11D with #1854.

## R12 (P3) — The README does not have the house shape

**Location.** `README.md` lines 1–127.

**Claim.** The README is in house roadmap form.

**Witness.**
- None of these is present: `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`.
- Layers are `###` headings.
- `grep -c '*Needs:*'` returns 0, and so does `grep -c '**Checks'`.
- No layer ends with `### Examples` and `### Dependencies`.
- Most theorems have no locator, for example 6A, 7b, 8 and 10B.
- The permalinks at lines 103, 470 and 685 point to stale pins (`a91d3aaf`, `6b7abb3c`).

**Repair.** Restructure to the house shape:
- Add the opening sections. #1854's head already drafts a Summary, Scope and supplier contracts.
- Give each target a `*Needs:*` line, which also lets the dependency check see R01, R02 and R04.
- Give each definition its API bullets and at least three Checks.
- Add the per-layer Examples and Dependencies, and a locator for each theorem.

## R13 (P3) — Process and status wording

**Location.** `README.md`:
- line 66, "## Remaining roadmap targets";
- line 101, "The remaining targets are";
- lines 120–121, "Nonexhaustive … honest `sorry` construction targets";
- line 1107, "These are active basic-theory and example targets";
- line 1659, "(`TauCeti.SpStd.specialIsogeny`, done)";
- line 1673, "that do not yet exist";
- line 2224, "## Design notes (from Zulip)".

**Claim.** The README is timeless.

**Witness.** These phrases record the progress of the work, not mathematics.

**Repair.**
- Delete them, or rewrite them as scope statements.
- Move the design notes into Conventions.
- At lines 1660–1672, state the G₂ and F₄ carrier constructions in full here instead of deferring "in detail" to CFSGStatement's carrier plan. CFSGStatement is a consumer of this roadmap.

## Verified sound

**Gate and build.**
- Gate: every check passes (`scratch/gate.md`).
- Dependency check output: `depcheck: 235 roadmaps, 2260 edges, 0 problem(s)`. The parser sees only the edges SmoothBundlesConnections (line 428), ReductiveGroupsPartII (line 986), RepresentationTheory and RootSystems (line 1123), because the README has no `*Needs:*` lines. The 0 is a false negative for R01, R02 and R04.
- `lake env lean TauCetiRoadmap/ReductiveGroups/Suggested.lean`: no output (no `sorry`, no warning).
- `#check @name` on all 7 declarations: every binder is kept, and the types match README lines 830–831 and 1256–1259.

**Sampled targets.**
- "Supplier:" (line 699). RG2.3.7 exists on main with *lang-theorem* and *fixed-coset-lifting*. Its hypotheses (smooth, geometrically connected, finite type) match Milne iAG v2.00 Cor. 27.55, p. 488 (`milne-iag` line 20264). Prop. 27.54, p. 487 (line 20248) is Lang–Steinberg. The citation resolves; the supply direction is the defect (R01).
- "Cross-cutting prerequisite: sheaves and descent" (line 124). There is no locator in the README. Its contents were checked against the pin and SchemeAndStackFoundations (R05).

**Cross-roadmap citations resolved (16).**
- AlgebraicTopology Stage 1, open-cover van Kampen (README line 581).
- AlgebraicTopology Stage 5, item 5: the fibration long exact sequence, `TauCeti.TopCat.serreFibrations` and locally trivial ⇒ Serre (line 1456).
- SmoothBundlesConnections B1.0, B1.1 and B1.4 (lines 221, 315 and 421).
- LieGroupoidsPoisson G0.1 (line 299).
- InductionRestriction Layer 2.1 and `Gassmann.almostConjugate_iff_permutation_equiv`.
- SchemeAndStackFoundations 0.3, 0.7, 1.1, 1.5 and 1.15.
- IntegralHeckeAndGaloisDeterminants §0.7 (*Rational cohomology of a flat affine group scheme*, *Algebraic induction*, at #1689).
- ComplexComparisonPartII C−1.1 (#848).
- InverseGaloisAndArithmeticFundamentalGroups IG.5.1 (#850).
- FormalConnectionsOpers F4.3 (#1056).
- ReductiveGroupsPartII RG2.3.7.

**Pinned declarations opened (59).** In addition to those named in the findings:
- All 7 Weil-restriction names of Layer 8: `TauCeti/Algebra/HopfAlgebra/WeilRestriction.lean:215, 255, 274, 451`; `RingTheory/WeilRestriction/Smooth.lean` `instSmooth` (finite projective `B`, smooth `C`); `MultiplicativeGroup/WeilRestriction/Basic.lean:65`; `Connected.lean:233` (`[Module.Finite k B]`). Their hypotheses match the README text.
- `pointsFunctorIsoTensorAutFunctor`, `kostantForm`, `instHopfAlgebraKostantForm`, `kostantFormComul_dividedPower`, `kostantFormComul_ringChoose`, `serreLift`, `IsSerreSystem`, `serreDiagramAut_iterate_eq_id`, `serreLift_comp_serreDiagramAut`, `geckLieEquivOfEquiv`, `diagramAut`, `weylCoxeterHom`, `rootPairingBaseChange`, `weylGroupCorootRep`, `coxeterMatrixOfBase`, `BraidGroup.pureSubgroup`, `permHom`, `exponentSum`, `fundamentalGroupToMulOpposite`, `indTrivialEquiv`, `indTrivialIso`, `iterateFrobeniusPoints`, `frobeniusFixedPointsMulEquiv`, `baseChangePointsMulEquiv`, `exists_fixed_preimage_of_isLinearlyReductive`, `fixedMap_surjective_of_isLinearlyReductive`, `exact_fixedMap_of_isLinearlyReductive`, `mem_serreFibrations_of_exists_trivialization`.
- Mathlib `FundamentalGroup` multiplication, `p * q = .of (q.asHom.trans p.asHom)`, which agrees with README line 2014.

**Ownership against open pull requests.** Checked with `roadmaps grep` and `roadmaps show` for the 7 declarations of `Suggested.lean`, for Lang's theorem and for the four supplier roadmaps above. No other roadmap declares these fully qualified names. The only other carriers of `TauCetiRoadmap.ReductiveGroups.*` are revisions of this roadmap (R11).

**Adversarial pass.**

| Statement | Instances tried | Values computed (left / right) | Result |
|---|---|---|---|
| 7c `finrank_indFromProjectedLevi` | `P=G`; `M=0`; `G=S₃`, `P=⟨(12)⟩`, `L=1`, `M=k` | `finrank M = 1·finrank M`; `0 = index·0`; `3 = 3·1` | holds; padding (R08) |
| 7f fixed-coset identity | `S₃`, `H=⟨(12)⟩`, `g=(12)` and `g=e` | `1·2 = 2·1`; `3·2 = 6·1` | holds; proved at pin (R10) |
| 9A.1a `ε`, A2 ordered `α₁<α₂` | `ε(α₁+α₂, −α₁−α₂)` | exponent `1·1·(−1) = −1`, so `ε = −1`; matches `x_{−α₁−α₂} = −E₃₁` | holds |
| 9A.1a commutator `(−1)^{B(a,b)}` | general bilinear | `Σ_{i≠j} bond·a_i b_j ≡ B(a,b) mod 2` | holds |
| 9A.1a-L kernel order `2^{rank Q}` | rank 0; `A1` | `1 = 2⁰`; `|Hom(ℤ,±1)| = 2` | holds |
| 9A.1b folded Cartan matrices | A3; A4; D4 triality | `[[2,−2],[−1,2]]`; `[[2,−1],[−2,2]]`; `[[2,−3],[−1,2]]` (from `C_{O,P} = c_O Σ B`) | all equal README |
| 9A.1b `B(β_O,β_O) = d_O/|O|` | A3 middle; A3 outer; A4 two orbits | `2`; `1`; `1` and `1/2` (two lengths, no fixed vertex) | holds, as README says |
| 9A.1b A_n frame `J` | `m=2`, `m=3` | `Jᵀ = (−1)^{m−1}J`: `−J` and `J`; `J² = (−1)^{m−1}I` | holds (C_r and B_r) |
| 9A.1b `γY = [[0,−1],[1,−1]]` | integral and `F₃` | `det(γY−I) = 3`, Smith form `diag(1,3)`; `(γY−I)(1,−1) ≡ 0 mod 3`; `γY³ = I` | holds |
| 9A.1b A2 exchange frame | `[e,f]`, `[h,e]`; index | `h`; `e`; lattice index `4` | holds |
| 9A.3 opposite-root rule | `a=b=1` | `ef = fe·1 + h` (terms `r=0`, `r=1`) | holds |
| 9C `μ₀ = Π binom(H−1,p−1)` | `p=3`, weights `0,1,3` | `binom(−1,2)=1`, `binom(0,2)=0`, `binom(2,2)=1` | projects onto `pX`; holds |
| 9C contraction not monoidal | `𝔾_m`, weights `1` and `p−1` | each contracts to `0`; tensor weight `p` survives | holds |
| 10C `dim L(n) = Π(n_j+1)` | `p=3,n=4`; `p=2,n=2`; `p=2,n=3` | `4` (socle `x⁴,x³y,xy³,y⁴`); `2` (not simple); `4 = n+1` (simple; `3 = 2·2−1`) | criterion `n=(a+1)p^m−1` holds |
| 10C `R₂` in char 2 | `g·xy` | `cd·u² + uv + ab·v²` spans `R₂`; `y²` spans only `⟨x²,y²⟩` | holds |
| 10D `SL₂/N⁺` charts | `s_c = s_a n(−1/(ac))` | product `[[a,−c⁻¹],[c,0]]`; `u_c − u_a = 1/(ac)` | holds |
| 11A disc homeomorphism | `z=1` | `w = 1/√2`, inverse returns `1` | holds |
| 11A `B_n → S_n` nonsplit | `n=2` | order-2 lift has exponent sum `0`; sign needs odd | holds |
| 11D big-cell cover, van Kampen | `G=T`; `SL₂` | `W=1`, point; two charts of `P¹`, overlap `ℂˣ` (path connected), `π₁=1` | holds |
| 11D `U n_w B ⊂ n_w U⁻B` | `J_w = U∩n_wU⁻n_w⁻¹` | `n_w⁻¹J_wn_w ⊂ U⁻` and `n_w⁻¹H_wn_w ⊂ U` give `U n_w B = J_w n_w B` | holds |
| 11C regular ≠ semisimple | regular nilpotent in `GL₂` | centralizer `{[[a,b],[0,a]]} ≅ ℂ*×ℂ` | holds |
| 8 `Res_{K/k} G_m` | `K = k(a^{1/p})`; `K=k` | `K⊗k̄ = k̄[t]/(t^p)`, unipotent kernel of dim `p−1`; `G_m` | holds |
| 3A.7 `ℂ*` on `P¹` | char 0; char `p` | orbits `{0}`, `{∞}`, `ℂ*`; stabilizer `μ_p` | holds |
| 7 maximal-torus conjugacy (headline) | Lean probe at the pins | elaborates, `sorry` the only warning | statable, absent (R06) |
| 7a Lang (sampled) | `μ₂` over `F₃` | `z ↦ z²= 1` misses `−1` | needs connectedness, as stated |
| Fundamental-group product | Mathlib pin | `p*q = q.trans p` | agrees with line 2014 |

## Not verifiable

- Dudas–Michel Prop. 8.9, Howlett–Lehrer (J. Algebra 165) and Dipper–Du (Crelle 437), cited for Layers 7b–7e: no open copy was fetched this round, and the README gives no locator for most 7b–7e statements (R12). They are not listed in `needs-references.toml`, because the findings do not depend on them.
- Conrad–Feng §6.3, Prop. 12.3.1 and App. H.1 (Layer 7), McNinch §§2–5 (6A), Gros–Kaneda (9C) and Hedén (10D) are in the sources cache. Their locators were not re-read this round; these are not the sampled targets.

## Source issues

- none
