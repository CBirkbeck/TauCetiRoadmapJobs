# Review of LieHighestWeight (pull request #1797 at 657389a)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`

**Verdict:** needs changes

In this folder the pull request only folds `TypeAHaarTargets.lean` into `Suggested.lean` as `section TypeAHaar`. Everything else is main's text. This is a full review of the folder at the head, so most findings predate the pull request. The gate fails: `sorry-data=47`, `mathlib-subimports=1`, `imports=1`, `blob=3`, `prnum=1`, `private-paths=1`, `statement-hygiene=11`, and 31 build warnings other than `sorry`. I reran it at this head and got the same counts. Each gate rule is a finding below.

There is a simpler repair path. The open revision #1220 rewrites this folder in house shape. It removes `TypeAHaarTargets.lean`, and its `Suggested.lean` has no `sorry`'d data. If this pull request drops its LieHighestWeight commit (daf978f2) and leaves the folder to #1220, or is rebased onto it, then R01–R03, R06 and R08–R16 would have to be checked again against #1220's text rather than repaired here (see R21). R04 and R05 also concern text that #1220 keeps (its Layer 5.2).

## R01 (P1) — 47 declarations carry `sorry`'d data
- **Location:** `Suggested.lean` lines 227, 306, 313, 315, 928, 1046, 1057, 1067, 1310, 1355, 1379, 1439, 1673–1679, 1685, 1689, 1703, 1753–1760, 1769, 1773, 1871, 1890, 1892, 1995, 1999, 2017, 2026, 2144, 2149, 2153, 2201–2208, 2302, 2427–2443. Examples: `def Octonion : Type → Type := sorry`; `def glIrreducible : ∀ {K : Type v} … Type v := sorry`.
- **Claim:** a `def`, `abbrev` or `instance` may not have `sorry` in its body. Real-bodied declarations built on these (`hcProjectionLinear`, `harishChandraLinearIso`, `pbwSymmetrizationCenter`, `splitDerivationTransport`, `derivationLieAlgebra K (Octonion K)`) inherit the defect. The `NonAssocRing DivisionOctonionReal` record has ten `by sorry` law fields, and `cross`/`associator` have `by sorry` membership proofs.
- **Witness:** gate `sorry-data (47)`. I reproduced the same 47 by scanning declaration bodies with comments stripped.
- **Repair:**
  - **Native counterpart at the pin:** delete the local declaration and use the native one:
    - `TauCeti.Octonion` (`TauCeti/Algebra/Octonion/Basic.lean:143`)
    - `TauCeti.AlbertAlgebra` (`AlbertAlgebra/Basic.lean:118`)
    - `diagonalCartan` and `glWeightEquiv` (`Lie/GeneralLinear/DiagonalCartan.lean:97,267`)
    - `glIrreducible` (`GeneralLinear/Carrier.lean:204`)
    - `glCasimir` (`GeneralLinear/Casimir.lean:81`)
    - `lieChevalleyRestrictionIso` (`HighestWeight/ChevalleyRestriction.lean:151`)
    - `tracePowerPolynomial` (`Lie/TracePowerPolynomial.lean:201`)
    - `centerPBWGradedInvariantIso` (`PBW/Center.lean:290`)
    - the degreewise `pbwSymmetrization` (`PBW/Symmetrization.lean:78`)
    - for `basisPbwGraded`, `pbwAssociatedGradedEquiv` (`PBW/Injective.lean:213`)
  - **Easy real body:**
    - `slTwoDiagonalCartan` as `LieSubalgebra.lieSpan` of `singleSubSingle 0 1 1`.
    - `weightTranslation μ` as `SymmetricAlgebra.lift` of `x ↦ ι x + algebraMap (μ x)`, with inverse at `−μ`.
    - The `NonAssocRing`, `SMulCommClass` and `IsScalarTower` law fields, and the two trace-zero memberships: these are true (see the adversarial table), so prove them.
  - **Heavy:** keep only as README targets with their signatures: the Layer 10 alcove data (`highestLongRoot`, `fundamentalAlcove`, `affineCartanMatrix`, `affineDiagramAutomorphisms`), `complexificationMap` and `complexifiedConjugation`.

## R02 (P1) — `right_alternative` is the tautology `a = a`
- **Location:** `Suggested.lean:1943`, `theorem right_alternative (x y : DivisionOctonionReal) : y * x * x = (y * x) * x := sorry`.
- **Claim:** `y * x * x` parses as `(y * x) * x`, so the statement is vacuous. The right alternative law is never asserted for the division octonions, although the README (positive division-octonion paragraph) promises it.
- **Witness:** in a scratch copy, `right_alternative := rfl` elaborates with no error and removes the `sorry` warning.
- **Repair:** `(y * x) * x = y * (x * x)`. It elaborates with `sorry` against the pins (scratch `RepairTest.lean`). The law holds on 300 random rational pairs in the README's product convention. It is the same form as native `TauCeti.Octonion.right_alternative` (`Octonion/Basic.lean:684`).

## R03 (P2) — The Layer 8 and Layer 9 headlines are stated on `sorry`'d stand-ins, although native carriers exist
- **Location:** `Suggested.lean` 1663–1806 (`finrank_octonion`, `octonionNorm_mul`, `finrank_derivationOctonion`, `derivationOctonion_equiv_g2`, `finrank_albertAlgebra`, `derivationAlbert_equiv_f4`) and 2144–2323 (all `gl_n` statements on `diagonalCartan`/`glIrreducible`/`glCasimir`).
- **Claim:** a theorem about `Octonion K` with `Octonion := sorry` is about an unspecified type: a headline forced through a stand-in. The stand-in's type `Type → Type` also narrows the scalars to `K : Type`, while the README says "every characteristic-zero field".
- **Witness:** these facts are native on the actual carriers:
  - `Octonion.finrank_derivationLieAlgebra = 14` (`Octonion/Derivation.lean:958`)
  - `AlbertAlgebra.finrank_derivationLieAlgebra` (`Derivation/Finrank.lean:384`)
  - `g₂ToDerivationLieAlgebra_surjective` (`Octonion/Serre.lean:397`)
  - `gl_dual_standard_pieri` (`GeneralLinear/Pieri.lean:388`)
- **Repair:** delete the stand-ins and every statement the pin proves. State the open halves on native carriers:
  - `Function.Injective (TauCeti.Octonion.g₂ToDerivationLieAlgebra (R := K))`
  - `Nonempty (TauCeti.derivationLieAlgebra K (TauCeti.AlbertAlgebra K) ≃ₗ⁅K⁆ LieAlgebra.f₄ (R := K))` with `[Invertible (2 : K)]`, named `nonempty_*`

  Both elaborate for `K : Type*`, `[Field K] [CharZero K]` (scratch `RepairTest.lean`).

## R04 (P2) — The type-A precursor plans ClassicalGroups Layer 4's summit again, and the roadmap is supplied by roadmaps it supplies
- **Location:** README 608–770, "Conclude P_λ=χ_λ|_T and hence the denominator-cleared Weyl character formula by this independent polynomial/Haar route" (line 733). Also Layer 6F (line 873, "ClassicalGroups Layers3–4's group-character comparison"), Layer 9 (lines 1438, 1502) and line 1726 "Late compact-center application in LieGroups". Folded into Lean as `section TypeAHaar`.
- **Claim:**
  - The precursor's headline is ClassicalGroups Layer 4's summit, so the theorem gets two owners.
  - ClassicalGroups Layer 3 and LieGroups Layer 8 are built on this roadmap, while the precursor, Layer 6F, Layer 9 and Layer 10 consume ClassicalGroups Layers 2–4 and LieGroups Layers 4, 6 and 7. Supply therefore runs both ways.
  - The late LieGroups application (`Z(G) ≃ P∨/Y`) has no owner.
- **Witness:**
  - ClassicalGroups `README.md:284–292` states `char(irreducible n λ)(diagonal x) = (∏xᵢ)^m·s_μ(x)` as its Layer 4 summit; its line 238–239 reads "Built on … LieHighestWeight".
  - LieGroups `README.md:135–136` cites this roadmap's `irreducibleQuotient`.
  - LieGroups on main has no `P∨` or `Z(G)` target.
- **Repair:**
  - Cite ClassicalGroups Layer 4 for `P_λ = χ_λ|_T` and delete the precursor's independent proof plan and the Lean `section TypeAHaar`.
  - Move Layer 6F's group-character comparison and Layer 9's differentiation/LR comparison into ClassicalGroups (or a Part II placed after it). Move the compact-centre application into LieGroups as a target there.
  - List these under `## Downstream consumers`.

  The dependency check reports no problem only because the README has no `*Needs:*` lines.

## R05 (P2) — The branching determinant needs `μ` dominant
- **Location:** README 755–760, "the coefficient determinant has entries `[λⱼ+n−j ≥ μᵢ+n−i]` for i<n and final row all 1. Prove its value is 1 precisely when … λᵢ≥μᵢ≥λ_(i+1), and 0 otherwise."
- **Claim:** for a non-dominant `μ` the determinant can be `−1`, so "0 otherwise" is false. `μ` is a GL_(n−1) highest weight in context, but the target does not say so.
- **Witness:** n=3, λ=(0,0,0), μ=(−1,1). The rows are (1,1,0), (1,0,0), (1,1,1) and the determinant is −1, while interlacing fails.
- **Repair:** add "for μ₁ ≥ ⋯ ≥ μ_(n−1)" and keep the instance above as a negative Check. With that hypothesis, a brute force over n=2,3,4, λ∈[−2,2]ⁿ dominant and μ∈[−3,3]ⁿ⁻¹ dominant (6965 cases) gives value 1 exactly at interlacing and 0 otherwise.

## R06 (P2) — The README plans as open targets results that the pinned Tau Ceti already proves
- **Location:** README Layer 0 (319–349); Layer 6 (794, "Prove `finite_dominantWeightBelow` and `formalCharacter_eq_orbitSum_add_lower`"); Layer 7 (1066, "Export `lieChevalleyRestrictionIso`"); Layer 8 (1224, "prove `finrank = 14`, that it is Killing-simple"; 1237, "build `TauCeti.AlbertAlgebra.det`"); Layer 9 (1469, "the carrier `glIrreducible n μ` is **named**").
- **Claim:** what exists at the pins is cited in the supplier contracts, not planned again. Suggested.lean also re-`sorry`s it. For example, `minuscule_pieri` (line 888) has the statement of native `TauCeti.minuscule_pieri` through a re-declared `IsMinuscule`.
- **Witness:** native at the pin:
  - `exists_int_of_hasEigenvalue` (`Sl2/Spectrum.lean:151`)
  - `finrank_eq_of_hasPrimitiveVectorWith` (`Sl2/WeightString.lean:324`)
  - `formalCharacter_eq_orbitSum_add_lower` (`HighestWeight/OrbitSum.lean:89`)
  - `minuscule_pieri` (`Pieri.lean:154`)
  - `isSimple_derivationLieAlgebra` (`Octonion/Simple.lean:515`)
  - `AlbertAlgebra.det`, `six_mul_det` (`Determinant.lean:101,310`)
  - `hasCentralRadical_iff_isCompl_center_derivedSeries` (`Reductive/Basic.lean:476`)
- **Repair:**
  - Add `## Exact supplier contracts` / `From Tau Ceti` listing each native result by name and file, and delete the corresponding targets.
  - Keep as this roadmap's targets only what is open:
    - `serreLift_injective_of_base` and `serre_presentation_equiv`
    - the two identifications of R03
    - `finrank_e8` and `finrank_e6_e7`
    - Cartan conjugacy
    - the `K : Type*` generalisations of the native Harish-Chandra theorems (native binds `K : Type`, `CentralCharacter/Isomorphism.lean:61`)
    - the Vinberg and Freudenthal model brackets, the compact real forms, and the Layer 10 affine theorems

## R07 (P2) — A supplier citation that an open pull request drops
- **Location:** README 915, "[CompactGroups Layer6](../CompactGroups/README.md#layer-6-characters-of-compact-groups)'s actual compact-group character orthogonality gives its squared group-Haar norm".
- **Claim:** at the head of #1047, CompactGroups' Layer 6 is "global forms and representation rings". The anchor breaks when #1047 merges, and character orthogonality is no longer a CompactGroups target there.
- **Witness:** #1047 head `RepresentationTheory/CompactGroups/README.md:721`, `## Layer 6: global forms and representation rings`. On main the anchor resolves (line 369).
- **Repair:** cite native `TauCeti.ContRepresentation.inner_characterLp_eq_finrank_contIntertwiningMap` (`TauCeti/RepresentationTheory/Compact/Intertwiner/Dimension.lean:145`), which exists at the pin.

## R08 (P3) — Padding in Suggested.lean
- **Location:** throughout Layers 0–9, the PBW, `CompactDivisionOctonion`, `PBWRees` and `TypeAHaar` sections.
- **Claim:** 69 theorems are proved in place, most by one native lemma (`weyl_character_formula`, `weyl_dimension_formula`, `kostant_multiplicity_formula`, `freudenthal_multiplicity_formula`, the classification theorems, `isDomain_universalEnvelopingAlgebra := by infer_instance`, the `pairCoordinates_*` lemmas `:= rfl`). There are 35 `abbrev`s, most of them aliases (`vermaModule`, `irreducibleQuotient`, `casimirElement`, `formalCharacter`, `hcProjection`).
  - TypeAHaar adds intermediate lemmas, none a headline:
    - `score_eq_gap_sum`, which is algebra on free real variables
    - `evaluate_mul`, an API lemma
    - `staircase_alternant`, `candidate_*`, `finite_*`
  - The aliases also drift: `weyl_complete_reducibility` elaborates with `[algClosedK : IsAlgClosed K]`. The README (line 595) and native `exists_isCompl_of_isKilling` (`CompleteReducibility.lean:259`, outside `section AlgClosed`, which ends at line 196) do not need it.
- **Witness:** a one-tactic probe on a scratch copy (six native imports added) closes 12 sorried theorems, leaving 182 `sorry` warnings of 195. Examples: `sl2_hAction_eigenvalue_isInt` by `exists_int_of_hasEigenvalue t hμ`, and `right_alternative` by `rfl`. The full list is under Verified sound.
- **Repair:** delete these declarations and the aliases from Suggested.lean. The README keeps the statements as cited native results or as targets. Do not prove them in place.

## R09 (P3) — The module docstrings describe an API catalogue, not the acceptance test
- **Location:** `Suggested.lean` 38–44, "**This file is not the roadmap and is not exhaustive.** … `sorry` is allowed in this human-owned roadmap library". Also 2583–2586, a second module docstring "# Integral type-A character precursor: suggested interfaces … This section is not the roadmap and is not exhaustive", and 2446–2450, a section comment.
- **Claim:**
  - There must be one docstring, "LieHighestWeight: target signatures". It names each headline that cannot be stated and the carrier it lacks: the Layer 10 `Ω ≃ P∨/Q∨` and `Ω ⋊ Γ` theorems, the Vinberg E₈ and Freudenthal E₆/E₇ models, compact G₂/F₄ and the gl_n LR application. None of these is named.
  - Fifteen TypeAHaar declarations have no docstring: `Weight`, `Laurent`, `rho`, `permute`, `monomial`, `denominator`, `alternant`, `numerator`, `score`, `centralDegree`, `dominanceLE`, `finite_dominance_ideal`, `candidate_top_coefficient`, `candidate_support_dominated`, `evaluate_mul`.
- **Witness:** the lines quoted above.
- **Repair:** write one module docstring in the required form, delete the second, and give a docstring to every surviving declaration.

## R10 (P3) — Gate `imports` and `mathlib-subimports`
- **Location:** `Suggested.lean:2`, `import Mathlib.RingTheory.TensorProduct.Basic`.
- **Claim:** only `import Mathlib` followed by the `TauCeti.*` modules used is allowed.
- **Witness:** gate `imports (1)`, `mathlib-subimports (1)`.
- **Repair:** delete line 2. It is redundant under `import Mathlib`.

## R11 (P3) — Gate `build`: 31 warnings other than `sorry`
- **Location:** `Suggested.lean` 350–1494: "automatically included section variable(s) unused" for `algClosedK`, `charZeroK` and `[IsTriangularizable K H L]`. Also unused `hα`/`hlam` at 370, 655, 735, 1556 and 1581.
- **Claim:** `sorry` must be the only warning.
- **Witness:** my `lake env lean` run gives 0 errors, 195 `sorry` warnings and 31 other warnings.
- **Repair:** most of these declarations go under R08. For the rest, carry the needed binders explicitly in each signature and drop the unused hypotheses.

## R12 (P3) — Gate `statement-hygiene`: 11 hits
- **Location:** `Nonempty` conclusions at lines 135, 832, 847, 1647, 1746, 1786, 2052, 2193, 2260 and 2272, and `letI` in the signature of `weylAut_cartan_apply` (1194).
- **Claim:** state the canonical map and its bijectivity, or name the statement `nonempty_*`. A signature may not contain `letI`.
- **Witness:** gate `statement-hygiene (11)`.
- **Repair:**
  - `serre_presentation_equiv` becomes `Function.Bijective (TauCeti.serreLift hS)`.
  - The two exceptional identifications become as in R03.
  - The others are native: delete them (R06/R08).
  - Delete `weylAut_cartan_apply`, which is native `TauCeti.weylAut_apply_of_lie_eq_smul` (`Sl2/Weyl/Automorphism.lean:220`).

## R13 (P3) — Gate `blob`: three links pinned to a commit
- **Location:** README 867, 1516 and 1799, `https://github.com/TauCetiProject/TauCetiRoadmap/blob/149fe79…/SchurWeyl/README.md#layer-7-…`.
- **Claim:** cite the roadmap and section, not a commit.
- **Witness:** gate `blob (3)`.
- **Repair:** `[SchurWeyl Layer 7](../SchurWeyl/README.md#layer-7-symmetric-functions-the-frobenius-characteristic-and-rsk)`.

## R14 (P3) — Gate `prnum`
- **Location:** README 1258, "design of [Mathlib PR41919](https://github.com/leanprover-community/mathlib4/pull/41919)".
- **Claim:** no pull-request numbers.
- **Witness:** gate `prnum (1)`.
- **Repair:** state the convention itself (`Octonion R := CayleyDickson (Quaternion R)` with the displayed product) without referring to an unmerged pull request.

## R15 (P3) — Gate `private-paths`: a web page used as a locator
- **Location:** README 1241, "[Baez's trace-power identity](…)", a link to a page on the `math.ucr.edu` host (`…/octonions/node12.html`).
- **Claim:** the scanner trips on the URL's user-directory segment. The real defect is a web page in place of the manifest source.
- **Witness:** BaezOctonions line 1479 (§3.4, p. 32) gives the cyclic determinant, and line 1481 the trace-power formula with coefficients 1/3, 1/2 and 1/6.
- **Repair:** cite "BaezOctonions §3.4, p. 32". The target is native anyway (`AlbertAlgebra.det_eq_invOf_two_mul_invOf_three_mul`, `Determinant.lean:319`; see R06).

## R16 (P3) — The README is not in house shape
- **Location:** headings at 75, 169, 263, 313, 319–1623 and 1757; a paragraph after References (1850).
- **Claim:** the following are absent: `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `## Layer k` with `### k.n`, per-layer `### Examples` and `### Dependencies`, and `## Downstream consumers`. Layer 10 also comes after "Worked examples".
- **Witness:** `grep -c` gives 0 for `**Checks.**`, `### Examples`, `### Dependencies` and `*Needs:*`.
- **Repair:**
  - Restructure into the house shape. #1220's head is a ready model.
  - Give every surviving definition an API list and at least three discriminating Checks. The worked examples (sl₂ `Ω`, A₂ dimensions, the gl₂ Casimir, R05's instance) are ready-made Checks.
  - Give every target a `*Needs:*` line.

## R17 (P3) — Claims carry no locators, and the precursor cites an unnamed source
- **Location:** README 674 "the source's decomposition procedure", 718 "the source's right-trivialized Jacobian", 750 "the source's strict inequality", 766 "retain the printed p5 `+i`/`+j` indicator … p6". The Weyl, Kostant, dimension, Freudenthal, PBW and octonion statements have no locator. References give chapter ranges only.
- **Claim:** every theorem has its locator at the claim, and every source is named.
- **Witness:** the only locators at claims are Stacks 02ML (line 1038) and Etingof §§10.1, 13.3, 14.1 (line 1123).
- **Repair:** name the precursor's source (author, title, version) or cut it with R04. Add locators at the claims:
  - EtingofLieGroupsLieAlgebras Thm 26.4, p. 131 (line 5190) for the Weyl character formula
  - EtingofLieGroupsLieAlgebras Ex. 26.7(ii), p. 133 (line 5294) for Kostant
  - EtingofRepresentationsLieGroups Thm 10.1, p. 51 (line 2153) and Thm 14.1, pp. 70–71 (line 3041)
  - BaezOctonions §2.2, eq. (2), p. 8 (line 354), stating that the README's product `(ac−d̄b, da+bc̄)` differs from Baez's `(ac−db*, a*d+cb)`

## R18 (P3) — Stale citation ids and library names
- **Location:** README 875 and 922 ("TensorProductCombinatorics H1.6", "H2.6"); 1356 and 1407 ("TangentialBordism B3"); 982 and 1109 (`TauCeti.SymmetricAlgebra.adjointDerivation`, `adjointDerivation_mem_homogeneousSubmodule`); 108 and 191 (`LieAlgebra.exists_isCartanSubalgebra`); 1780 ("`equivOfCartanMatrixEq` of [../RootSystems…]").
- **Claim:** citations must resolve where they are cited.
- **Witness:**
  - Main has `### 1.6` and `### 2.6`, not H-numbers, so `#h16-…` breaks. TangentialBordism (#942) has `### 9.1 … (B3.6)`, not B3.
  - Neither `adjointDerivation` nor `LieAlgebra.exists_isCartanSubalgebra` exists at the pins.
  - `equivOfCartanMatrixEq` is Mathlib's (`CartanMatrix.lean:362`).
- **Repair:**
  - Cite "TensorProductCombinatorics §1.6, §2.6" (main lines 694, 1191) and "TangentialBordism §§9.1–9.2" (#942 head lines 2493, 2552).
  - Use `TauCeti.lieModuleDerivation` and `lieModuleDerivation_mem_homogeneousSubmodule` (`SymmetricAlgebra/LieModule.lean:89,119`) and Mathlib's `exists_isCartanSubalgebra_engel` (`CartanExists.lean:374`).
  - Attribute `RootPairing.Base.equivOfCartanMatrixEq` to Mathlib.

## R19 (P3) — README and Lean disagree on names
- **Location:** README 300 ("`Suggested.lean` pins … `Sl2Irrep` … `weylCharacter`") and 1333–1398 (`compactAlbertAlgebra`, `compactAlbertDerivationBaseChange`, `compactAlbertDerivation_complexification`, `compactAlbertDerivation_skewAdjoint`, `compactAlbertDerivation_killing_negDef`, `divisionOctonionComplexificationIso`, `compactAlbertComplexificationIso`). The TypeAHaar Lean names (`candidate_mul_denominator`, `groupWeightCharacter`, `score_eq_gap_sum`, …) appear nowhere in the README.
- **Claim:** a backticked own name is a claim that Suggested.lean declares it, and every Lean name appears in the README.
- **Witness:** none of these nine names is declared in Suggested.lean or at the pins. TangentialBordism's #942 head (`README.md:2550`) consumes "LieHighestWeight Layer 8 compact Albert algebra".
- **Repair:** write the compact targets as prose without backticks, or declare the compact Albert carrier with a real body. Delete the line-300 claim. TypeAHaar goes with R04.

## R20 (P3) — Process wording and invented vocabulary
- **Location:**
  - README 1850–1852, "**Prototype carrier and chart boundary.** The LHW prototype … only the law fields are admitted … The LG prototype imports …".
  - README 623, "These inputs commission the following construction".
  - README 1649, "The prototype stores the actual … witnesses".
  - `Suggested.lean:1659`, "the samples do not claim native implementation is absent".
  - `exists_chevalleySystem` at `Suggested.lean:1609`.
- **Claim:** timeless text, standard vocabulary.
- **Witness:**
  - The paragraph after References describes Lean files and uses `PositivePairCoordinates A`, which is defined nowhere on main or at the pins.
  - `exists_chevalleySystem` asserts only nonzero `e_α, f_α` with `⁅e_α,f_α⁆=h_α`: an sl₂-triple normalisation, not a Chevalley system.
- **Repair:** delete the paragraph after References and rewrite the other sentences timelessly. Rename the lemma to say what it asserts (for example `exists_rootVectors_lie_eq_coroot`) or delete it with R08.

## R21 (P3) — A conflicting open pull request, with no stated order
- **Location:** `Suggested.lean`, which both this pull request and #1220 ("LieHighestWeight: tensor strings, reductive centers and opposition") change.
- **Claim:** the heads conflict, and neither description says which one rebases.
- **Witness:** the overlap listing reports "#1220 and #1797 conflict in `…/LieHighestWeight/Suggested.lean`". The #1220 head (beea1d2) deletes `TypeAHaarTargets.lean` and has a 201-line `Suggested.lean`.
- **Repair:** state the order in the description. Since #1220 removes the side file, the natural order is to drop daf978f2 from this pull request, or to rebase it onto #1220, where the fold is empty.

## Verified sound

**Adversarial table** (36 rows; values computed on each side).

| Statement | Instances | Values (left / right) | Result | Change |
|---|---|---|---|---|
| Weyl character formula, Layer 6 (`weyl_character_formula`; seeded) | sl₂ λ=ω; λ=0; Etingof Thm 26.4 | `(e^ω+e^−ω)(1−e^−2ω)=e^ω−e^−3ω` / `e^ω−e^(s(2ω)−ω)=e^ω−e^−3ω`; `1−e^−α` / `1−e^−α`; Etingof `Σsgn e^w(λ+ρ)/Δ`, `Δ=e^ρ∏(1−e^−α)` ⇒ same | holds | locator R17; padding R08 |
| Weyl character formula, Layer 6F fixed-point form (seeded) | sl₂ λ=ω | `e^ω/(1−e^−α)+e^−ω/(1−e^α)=(e^ω−e^−3ω)/(1−e^−2ω)` / `e^ω+e^−ω`; `sρ−ρ=−α` / `−Σ{α}` | holds | — |
| Weyl dimension formula | A₂ at ω₁, ω₂, ω₁+ω₂, 2ω₁, 3ω₁; sl₂ nω | `(a+1)(b+1)(a+b+2)/2` = 3, 3, 8, 6, 10 / README 3, 3, 8, 6, 10; `(n+1)/1` / `n+1` | holds | R08 |
| Kostant multiplicity | sl₂, μ=n−2k; k=n+1 | `P(kα)−P(−(2n−2k+2)ω)=1−0` / mult 1; `P((n+1)α)−P(0)=0` / 0; Etingof Ex. 26.7(ii) has the same argument | holds | R08 |
| Freudenthal recursion | sl₂ V(1), μ=−ω | `(⟨2ω,2ω⟩−0)·m=4⟨ω,ω⟩m` / `2·m_ω·⟨ω,α⟩=4⟨ω,ω⟩` ⇒ m=1; μ=λ excluded by `hne` (denominator 0) | holds | — |
| Casimir scalar (`casimir_smul_of_isHighestWeightVector`) | sl₂ V(n), Killing form `⟨ω,ω⟩=1/8` | `((n+1)²−1)/8` / `Ω/8` on V(n) = `n(n+2)/8` | holds | R08 |
| sl₂ `Ω=h²+2h+4fe` and HC images | κ(h,h)=8, κ(e,f)=4; t=λ(h) | `h²/8+(ef+fe)/4=Ω/8` / `Ω=8·casimir`; `(−t−2)²+2(−t−2)=t²+2t`; `(t−1)²+2(t−1)=t²−1`; Etingof Thm 14.1(ii) shift `f_b(λ+ρ)` | holds | — |
| Serre transpose convention | Mathlib `pairing i j = root i (coroot j)`; `adE := ad(E i)^(−CM i j).toNat ⁅E i,E j⁆` | needs `CM i j=α_j(h_i)` / `(base.cartanMatrix)ᵀ i j = α_j(h_i)`; `ad(eᵢ)^(1−A j i)eⱼ` / README same | holds | open target kept |
| `sl2_finrank_of_hasPrimitiveVector` hypothesis | sl₃ adjoint, α₁-triple | `θ(α₁^∨)=1` ⇒ claimed dim 2 / actual 8 | restricted irreducibility needed, as stated | R08 (native) |
| `right_alternative` | any `NonAssocRing` | `(y*x)*x` / `(y*x)*x` | **vacuous** | R02 |
| Division octonion laws (seeded "positive division-octonion algebra") | 300 random rational pairs and triples, product `(ac−d̄b, da+bc̄)` | `N(xy)=N(x)N(y)`, left and right alternative, flexible, both Moufang, `(xy)*=y*x*`, `xx*=N(x)·1`, inverse: all equal on every sample; associator(i,j,ℓ)=(0;0,0,0,2)≠0 | hold; algebra not associative | — |
| Cross product (seeded) | 300 random imaginary triples; u=i, v=j, w=ℓ | `vw=−g(v,w)+v×w`, `u×(u×v)=g(u,v)u−g(u,u)v`, trilinear identity: all equal; lhs=(0;0,0,0,2) / assoc (0;0,0,0,2)+0−0 | holds | — |
| Complex scalar extension (seeded) | `i⊗x` | positive extension `i⊗x̄` / tensor star `−i⊗x̄` (distinct); `dim Der = 14` / native 14 (`Derivation.lean:958`) | holds | R01 (sorry'd maps) |
| Albert determinant | Baez §3.4 p. 32 vs README | `αβγ−Σα‖x‖²+2Re(xyz)` / `a0a1a2−Σa_iN(x_i)+tr((x0x1)x2)`; `⅓tr a³−½tr a²tr a+⅙(tr a)³` / `(p1³−3p1p2+2p3)/6`; `tr L_a=9 tr a` / Baez line 1416 | holds | R06, R15 |
| `score_eq_gap_sum` (seeded "integral weights") | n+1=2; random N=1..5, 2500 cases | `(S/2)(x0+x1)+(x0−x1)(l0−l1)/2` / `x0l0+x1l1`; 0 mismatches | holds | R08 |
| Non-injectivity claim | x=(3,2,1) | score(1,1,−2)=3 / score(2,−1,−1)=3 | holds | — |
| `finite_dominant_score_sublevel` needs `StrictAnti` | x=(1,1) | score ≡ S / infinite set `{(k,S−k)}` | hypothesis necessary | — |
| `finite_dominance_ideal` | dominant μ≤l | `l_n ≤ μ_i ≤ l_1` for all i / bounded | holds | R08 |
| `staircase_alternant` (seeded "polynomiality") | n=2; n=0 | `t0−t1` / `t0(1−t1/t0)`; `1`/`1` | holds | R08 |
| `candidate_mul_denominator` | detShift = last entry (`DominantWeight.lean:115`) | `t^(m·1)s_p·D = t^(m·1)t^(−ρ)A_(p+ρ)` / `t^(−ρ)A_(λ+ρ)` | holds | R08 |
| `numerator_coefficient_norm` | λ+ρ strictly decreasing; n=0 | n! coefficients ±1 ⇒ `Σc²=n!` / n!; `1`/`0!` | holds | R08 |
| Haar norm (seeded) | U(n), Woit Thm 1 p. 3 | `(1/n!)Σ_(w,v)sgn·sgn·δ=1` / 1; `\|D\|²=∏\|t_i−t_j\|²` / Woit's `∏_(j<k)\|e^iθk−e^iθj\|²` | holds | — |
| `group_character_eq_orbit_add_lower` | GL₂ standard, l=(1,0) | weights (1,0), (0,1) / `orbitSum(1,0)`, c=0 | holds | R04 |
| Stable tensor range (seeded "type-A coefficient") | 4000 random n=2,3 with gaps ≥ μ₁−μₙ | every `λ+perm(μ)` dominant / needed for no reflection | holds (also with ≥; source's strict form kept) | — |
| Branching determinant (seeded) | dominant μ: 6965 cases; λ=(0,0,0), μ=(−1,1) | value 1 iff interlacing, 0 else; **−1** / claimed 0 | **missing hypothesis** | R05 |
| gl Casimir scalar | gl₂ standard (1,0); det (1,1) | `ΣE_ijE_ji` acts by 2 / `1·2+0=2`; 2 / `1·2+1·0=2` | holds | R03 (native) |
| Staircase separation | ν_t=N−½−t | `C(ν−ε_t)−C(ν)=−3N+3+4t` / difference `4(t−s)` | holds | — |
| CAR example | `ΣF_ii` | `½(N+N(N−1))=N²/2` / `Σν_i=N²/2`; `2^(N²)/2^(N(N−1)/2)=2^(N(N+1)/2)` | holds | — |
| `gl_dual_standard_pieri` | n=2, μ=(1,0); μ=(0,0) | `V*⊗V`, dim 4 / `L(0,0)⊕L(1,−1)`, 1+3; `L(0,−1)` / only t=1 dominant | holds | R03 (native) |
| `hasCentralRadical_iff_…` | L=0; sl₂⋉K² | both sides true; IsCompl ⊥ ⊤ holds, derived ideal not semisimple ⇒ RHS false / LHS false | both conjuncts needed | R08 (native) |
| `minuscule_pieri` | sl₂ λ=0, μ=ω; λ=μ=ω | ν=ω: 1, ν=−ω excluded by `hnu` / `L(0)⊗L(ω)=L(ω)`; ν∈{2ω,0}: 1, 1 / `V(1)⊗V(1)=V(2)⊕V(0)` | holds | R06 |
| `exists_invariantForm_iff_neg_longest_smul_eq` | sl₂ V(1); sl₃ V(ω₁) | symplectic form ≠0 / `−w₀ω=ω`; no form / `−w₀ω₁=ω₂≠ω₁` | holds | native `Dual.lean:169` |
| Tits sign | sl₂ V(1), V(2) | Σ=1 ⇒ −1 / alternating; Σ=2 ⇒ +1 / Killing symmetric | holds | — |
| Isotypic toolkit example | `(V(1)⊗V(1))⊕V(0)` | multiplicities 1, 0, 2; `3+0+2=5` / `4+1` | holds | — |
| `weyl_complete_reducibility` generality | elaborated type | contains `[algClosedK : IsAlgClosed K]` / README and native: none | **narrowed** | R08 |
| Layer 10 lattices | A₁ adjoint X=ℤα; Ω checks | `Y→Hom(Q,ℤ)` injective, `P∨/Q∨≅C₂`; A_r `C_(r+1)`, D₄ `C₂×C₂`, E₆ `C₃` / centres of simply connected groups | holds | R01 (sorry'd data) |

**Gate, build and probes.**
- Gate rerun at this head: same counts as the worker's. Its `outside-folder` hits are only this pull request's own AlgebraicTopology and GeometricTopology files. The `git diff --stat` outside the named folders is empty.
- `lake env lean` on Suggested.lean: 0 errors, 195 `sorry` warnings, 31 other warnings.
- `#check @name` scaffold: one scratch file with all 355 `theorem`/`def`/`abbrev` names, elaborated once with 0 errors. I compared the elaborated types with the README:
  - Section binders were dropped as intended for the generic sections (`omit` lines).
  - The auto-included `IsAlgClosed` narrows `weyl_complete_reducibility` (R08).
  - The `IsTriangularizable` binders flagged in `signatures.md` are harmless, because native `instIsTriangularizableOfIsAlgClosed` supplies them.
  - The Layer 8 stand-ins force `K : Type` (R03).
- One-tactic probes: 12 sorried theorems closed (R08):
  - `sl2_hAction_eigenvalue_isInt` by `exists_int_of_hasEigenvalue t hμ`
  - `sl2_finrank_of_hasPrimitiveVector` by `finrank_eq_of_hasPrimitiveVectorWith P`
  - `isotypic_decomposition_equiv` by `nonempty_lieModuleEquiv_directSum_irreducibleQuotient`
  - `polynomial_eq_zero_of_dominantIntegral` by its native namesake
  - `span_pow_eq_homogeneous_of_polynomial_vanishing` by `simpa` with its native namesake
  - `nilpotentInnerLieAutomorphism_symm` by `simp`
  - `finrank_exteriorPower_three_nine` by its native namesake
  - `right_alternative` by `rfl`
  - `derivation_apply_one` by `derivationLieAlgebra.apply_one_eq_zero D`
  - `hasCentralRadical_iff_isCompl_center_derivedSeries` by its native namesake
  - `hasCentralRadical_matrix` by its native namesake with `two_ne_zero`
  - `exists_centralWeight_of_isIrreducible` by its native namesake

  `minuscule_pieri` fails only through the re-declared `IsMinuscule`. Repair statements (R02, R03) elaborate in scratch `RepairTest.lean`. The worktree is unchanged.

**Dependency check** (verbatim):

    depcheck: 238 roadmaps, 2321 edges, 0 problem(s)

The tool sees no `*Needs:*` line in this README, so it cannot see the two-way supply of R04.

**Library declarations opened at the pins (file:line).**
- **Mathlib:**
  - `RootPairing.pairing` (`LinearAlgebra/RootSystem/Defs.lean:195`)
  - `cartanMatrixIn` (`CartanMatrix.lean:53`)
  - `equivOfCartanMatrixEq` (`:362`)
  - `CartanMatrix.Relations.adE` (`Algebra/Lie/SerreConstruction.lean:110`)
  - `exists_isCartanSubalgebra_engel` (`CartanExists.lean:374`)
  - `sMulCommClass_right` (`RingTheory/TensorProduct/Basic.lean:137`)
- **Tau Ceti, Lie theory and sl₂:**
  - `exists_int_of_hasEigenvalue` (`Lie/Sl2/Spectrum.lean:151`)
  - `finrank_eq_of_hasPrimitiveVectorWith` (`Sl2/WeightString.lean:324`)
  - `nonempty_lieModuleEquiv_of_hasPrimitiveVectorWith` (`Sl2/Classification.lean:135`)
  - `exists_isCompl_of_isKilling` (`HighestWeight/CompleteReducibility.lean:259`)
  - `formalCharacter_mul_weylDenominator_eq_weylNumerator` (`Weyl/Character.lean:324`)
  - `finrank_eq_prod_coweightPairing_div` (`Weyl/Dimension.lean:116`)
  - `formalCharacter_coeff_eq_kostantMultiplicity` (`KostantMultiplicity.lean:73`)
  - `freudenthal_multiplicity_formula` and `coeff_formalCharacter_eq_freudenthalRHS_div` (`Freudenthal.lean:435,486`)
  - `formalCharacter_eq_orbitSum_add_lower` (`OrbitSum.lean:89`)
  - `minuscule_pieri` and `IsMinuscule` (`Pieri.lean:154`, `Minuscule.lean:259`)
  - `nonempty_lieModuleEquiv_directSum_irreducibleQuotient` (`Decomposition.lean:168`)
  - `exists_ne_zero_lieInvariant_irreducibleQuotient_iff` (`Dual.lean:169`)
  - `polynomial_eq_zero_of_dominantIntegral` (`Weight/Density.lean:63`)
  - `vermaCentralCharacter_eq_iff`, `harishChandraLinearIso` and `harishChandraIso` (`CentralCharacter/Isomorphism.lean:159,84,106`)
  - `lieChevalleyRestrictionIso` (`ChevalleyRestriction.lean:151`)
  - `span_pow_eq_homogeneous_of_polynomial_vanishing` (`SymmetricAlgebra/Polarization.lean:57`)
  - `lieModuleDerivation` (`SymmetricAlgebra/LieModule.lean:89`)
  - `pbwAssociatedGradedEquiv` (`PBW/Injective.lean:213`)
  - `expAd_symm` (`Lie/InnerAutomorphism.lean:139`)
  - `weylAut_apply_of_lie_eq_smul` (`Sl2/Weyl/Automorphism.lean:220`)
- **Tau Ceti, octonions and the Albert algebra:**
  - `Octonion` (`Octonion/Basic.lean:143`) with `right_alternative` (`:684`)
  - `Octonion.finrank_derivationLieAlgebra` (`Octonion/Derivation.lean:958`)
  - `g₂ToDerivationLieAlgebra` and its surjectivity (`Octonion/Serre.lean:267,397`)
  - `isSimple_derivationLieAlgebra` (`Octonion/Simple.lean:515`)
  - `AlbertAlgebra` (`AlbertAlgebra/Basic.lean:118`)
  - `AlbertAlgebra.det` and `six_mul_det` (`Determinant.lean:101,310`)
  - `AlbertAlgebra.finrank_derivationLieAlgebra` (`Derivation/Finrank.lean:384`)
  - `derivationLieAlgebra.apply_one_eq_zero` (`Lie/Derivation/Basic.lean:251`)
  - `finrank_exteriorPower_three_nine` (`Lie/E8/Vinberg.lean:60`)
- **Tau Ceti, reductive and gl_n:**
  - `hasCentralRadical_iff_isCompl_center_derivedSeries` and `isIrreducible_restrict_derivedSeries` (`Lie/Reductive/Basic.lean:476,549`)
  - `exists_centralWeight_of_isIrreducible` (`Lie/Weights/Central.lean:260`)
  - `diagonalCartan` (`GeneralLinear/DiagonalCartan.lean:97`)
  - `glIrreducible` (`Carrier.lean:204`)
  - `glCasimir` (`Casimir.lean:81`)
  - `gl_dual_standard_pieri` (`GeneralLinear/Pieri.lean:388`)
  - `hasCentralRadical_matrix` (`Radical.lean:313`)
- **Tau Ceti, type A and compact groups:**
  - `DominantWeight`, `detShift` and `detShiftShape` (`ClassicalGroups/DominantWeight.lean:85,115,255`)
  - `weightChar` (`Basis/DiagonalTorus/Basic.lean:298`)
  - `inner_characterLp_eq_finrank_contIntertwiningMap` (`Compact/Intertwiner/Dimension.lean:145`)

**Cross-roadmap citations resolved.**
- **Resolve on main:** RootSystems, ClassicalGroups, CharacterTheory, SemisimpleAlgebras, AdoIwasawa, LieGroupoidsPoisson, LieGroups Layer 6 anchor, CharacteristicClasses C5 anchor, SpinRepresentations, and CompactGroups Layer 6 (which breaks at #1047, R07).
- **Broken:** TensorProductCombinatorics H1.6/H2.6 and TangentialBordism B3 (R18).
- **Mutual supply:** ClassicalGroups (`README.md:238–239`, 284–292) and LieGroups (`README.md:135–136`) consume this roadmap (R04).

**Ownership against open pull requests.** I checked #1220 (R21), #1047 (R07), #942 (R18, R19) and #1192 (ClassicalGroups). The vocabulary neighbours SpinRepresentations, ExceptionalThetaCorrespondencesForG2 and ReductiveGroups cite this roadmap's or the native objects; none owns them a second time.

**Sources read at their locators.**
- **EtingofLieGroupsLieAlgebras (v5):**
  - Thm 26.4, p. 131 (line 5190): Weyl character formula with symmetric Δ.
  - Ex. 26.7(ii), p. 133 (line 5294): Kostant multiplicity formula.
- **EtingofRepresentationsLieGroups (v2, the version the README links):**
  - Thm 10.1, p. 51 (line 2153): Chevalley restriction, surjectivity by trace powers.
  - Thm 14.1, pp. 70–71 (line 3041): raw HC `(ε⊗id⊗ε)∘µ⁻¹`, dot invariance, `gr HC = Res`.
- **WoitWeylCharacterFormula:**
  - Thm 1, p. 3 (line 94): Weyl integration formula.
  - Thm 2, p. 5 (line 192): Weyl character formula.
  - Cor. 2, p. 6 (line 289): Kostant.
  - Cor. 4, p. 7 (line 305): dimension formula.
- **BaezOctonions:**
  - §2.2, p. 8 (line 354): Cayley–Dickson product.
  - §3.4, p. 32 (lines 1416, 1479–1481): `tr L_a`, determinant and trace-power formula.
- All of these agree with the README's statements after the stated conventions are converted.

## Not verifiable

- **Seeded targets:**
  - The targets are "Weyl character formula" (×2), "Integral weights, finite induction and virtual characters", "Polynomiality before character identification", "Haar norm and identification", "Type-A coefficient and branching applications", "The positive division-octonion algebra and its invariant tensors", "Complex scalar-extension boundary" and "Prototype carrier and chart boundary".
  - None carries a theorem or page locator, so no locator could be checked.
  - I verified the mathematics against Etingof, Woit and Baez and by computation (table above).
  - The last of these targets is process text (R20).
- **The precursor's "source"/"notes" (printed p5/p6):** unnamed. WoitWeylCharacterFormula, the only Weyl-character note in the manifest, is not it: it has no branching determinant, and its Jacobian is `1−Ad(t⁻¹)` rather than `X−Ad_t X`.
- **Paywalled references:**
  - HumphreysIntroLieAlgebras is uncertified (cited by its locator).
  - Serre, Fulton–Harris, Humphreys GSM 94, Bourbaki VII–VIII, Jantzen, Jacobson, Schafer, Goodman–Wallach, Dixmier and Molev have no legal open copy in the manifest. The README cites them by chapter or not at all.
- **The "Chevalley system" convention (R20):** Bourbaki VIII §2.4 is paywalled, so I relied on the standard definition.

## Source issues

- **Error** in WoitWeylCharacterFormula at Corollary 3, p. 6: the source says the alternating partition sum with argument `w(λ+ρ)+w′(µ+ρ)−ν−2ρ` is the multiplicity of `V_λ` in `V_µ⊗V_ν`; it should be the multiplicity of `V_ν` in `V_λ⊗V_µ` (SU(3), λ=0, µ=ω₁, ν=ω₂ gives 1 versus 0); affects nothing.
- **Misprint** in WoitWeylCharacterFormula at the proof outline of Theorem 2, p. 5: the source says the antisymmetric character `A_(λ+δ)` occurs in `χδ` with coefficient 1; it should be `A_(λ+ρ)`; affects nothing.
- **Misprint** in WoitWeylCharacterFormula at the U(n) integration formula, p. 4: the source writes the integrand's last argument as `θ₂`; it should be `θₙ`; affects nothing.
