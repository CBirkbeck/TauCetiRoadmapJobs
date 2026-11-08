# Review of LieHighestWeight (pull request #1797 at 11a9ca1)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`

**Verdict:** needs changes

The pull request itself only folds `TypeAHaarTargets.lean` into `Suggested.lean`. This is a full review of the folder as it stands at the head, so most findings predate the pull request. The gate fails (`sorry-data=47`, `mathlib-subimports=1`, `imports=1`, `blob=3`, `prnum=1`, `private-paths=1`, `statement-hygiene=11`, `build=31`). Each gate rule is a finding below.

The defect that matters most is structural. At the pinned Tau Ceti (2fd255d99), almost every headline of Layers 0–6 and 9, most of Layer 7 and much of Layer 8 is already a native declaration. Suggested.lean either re-proves these through one-line aliases or, worse, re-declares the native carriers as `sorry` and states the headlines on those stand-ins.

## R01 (P1) — 47 declarations carry sorry'd data

Location: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/Suggested.lean`. The 47 declarations sit at lines 227, 306, 313, 315, 928, 1046, 1057, 1067, 1310, 1355, 1379, 1439, 1673–1679, 1685, 1689, 1703, 1753–1760, 1769, 1773, 1871, 1890, 1892, 1995, 1999, 2017, 2026, 2144, 2149, 2153, 2201–2208, 2302 and 2427–2443. Examples: line 1673 `def Octonion : Type → Type := sorry`; line 2201 `def glIrreducible : ∀ {K : Type v} … Type v := sorry`.

Claim: a `def`, `abbrev` or `instance` may not have `sorry` in its body, and nothing may mention one. Several declarations with real bodies are built on these: `hcProjectionLinear` and `harishChandraLinearIso` (on `weightTranslation`/`weightTranslationDotLinearIso`), `highestWeightTracePowerRestriction` (on `tracePowerPolynomial`), `pbwSymmetrizationCenter`, `splitDerivationTransport`, and `derivationLieAlgebra K (Octonion K)`. The `NonAssocRing DivisionOctonionReal` record (line 1871) and `cross`/`associator` (lines 1995, 1999) also carry `by sorry` fields.

Witness: gate `sorry-data` count 47, which I reproduced by scanning bodies. `Octonion`, `AlbertAlgebra`, `glIrreducible`, `diagonalCartan`, `glWeightEquiv`, `glCasimir` and `lieChevalleyRestrictionIso` all have real native versions at the pin; see R03.

Repair:
- **Native counterpart exists.** Delete the local declaration and use the native one: `TauCeti.Octonion` (`TauCeti/Algebra/Octonion/Basic.lean:143`), `TauCeti.AlbertAlgebra` (`AlbertAlgebra/Basic.lean:118`), `TauCeti.diagonalCartan`, `TauCeti.glWeightEquiv` (`GeneralLinear/DiagonalCartan.lean:97,267`), `TauCeti.glIrreducible` (`GeneralLinear/Carrier.lean:204`), `TauCeti.glCasimir` (`GeneralLinear/Casimir.lean:81`), `TauCeti.lieChevalleyRestrictionIso` (`HighestWeight/ChevalleyRestriction.lean:151`), `TauCeti.harishChandraIso` and `harishChandraLinearIso` (`HighestWeight/CentralCharacter/Isomorphism.lean:84,106`).
- **Easy real body.** Give one:
  - `slTwoDiagonalCartan`: the `LieSubalgebra.lieSpan` of `singleSubSingle 0 1 1`.
  - `weightTranslation μ`: `SymmetricAlgebra.lift` of `x ↦ ι x + algebraMap (μ x)`, with inverse at `−μ`.
  - The ten `NonAssocRing` law fields, the `SMulCommClass` and `IsScalarTower` instances (lines 1890, 1892) and the two trace-zero memberships: these are true and provable by `ext`/`simp`; prove them.
- **Heavy or unneeded for any headline.** Remove from the Lean and keep only as a README target with its signature: `basisPbwGraded`, the `centerPBWGraded*` maps, `pbwSymmetrization`, `tracePowerPolynomial`, the Layer 10 alcove data, `complexificationMap`, `complexifiedConjugation`.

## R02 (P1) — `right_alternative` is a tautology

Location: `Suggested.lean:1943`, `theorem right_alternative (x y : DivisionOctonionReal) : y * x * x = (y * x) * x := sorry`.

Claim: Lean parses `y * x * x` as `(y * x) * x`, so the statement is `a = a`. It does not state the right alternative law, and that law is never asserted for the division octonions.

Witness: replacing the `sorry` by `rfl` on a scratch copy elaborates with no error and no `sorry` warning. Likewise `example {A} [NonAssocRing A] (x y : A) : y * x * x = (y * x) * x := rfl` elaborates.

Repair: `(y * x) * x = y * (x * x)`. I elaborated this form with `sorry` against the pins (scratch `RepairTest.lean`). It matches native `TauCeti.Octonion.right_alternative` (`Octonion/Basic.lean:684`) and README lines 1272 and 1296–1297.

## R03 (P2) — Layer 8 and Layer 9 headlines are stated on sorry'd stand-ins although the native carriers exist

Location: `Suggested.lean:1673–1797` (Exceptional section) and `2144–2318` (Reductive section). Examples: `finrank_derivationOctonion`, `derivationOctonion_equiv_g2`, `derivationAlbert_equiv_f4`, `gl_dual_standard_pieri`, `glCasimir_smul_of_isGlHighestWeightVector`.

Claim: a theorem about `Octonion K` with `Octonion := sorry` is about an unspecified type. `derivationOctonion_equiv_g2` cannot be proved, and `finrank_octonion = 8` says nothing about the split octonions. This is a headline forced through a stand-in. It also narrows the scalars to `K : Type` because the stand-in has type `Type → Type`.

Witness: these statements are already native at the pin, on the actual carriers:
- `TauCeti.Octonion.finrank_derivationLieAlgebra : finrank (Der 𝕆) = 14` (`Octonion/Derivation.lean:959`).
- `TauCeti.AlbertAlgebra.finrank_derivationLieAlgebra = 52` (`AlbertAlgebra/Derivation/Finrank.lean:384`).
- `TauCeti.gl_dual_standard_pieri` (`GeneralLinear/Pieri.lean:388`).
- `TauCeti.glCasimir_smul_of_isGlHighestWeightVector` (`GeneralLinear/Casimir.lean:234`).

Repair: delete the stand-ins and every statement the pin already proves. Keep only the open halves, on the native carriers:
- `Function.Injective (TauCeti.Octonion.g₂ToDerivationLieAlgebra (R := K))`. Surjectivity is native at `Octonion/Serre.lean:397`.
- `Nonempty (TauCeti.derivationLieAlgebra K (TauCeti.AlbertAlgebra K) ≃ₗ⁅K⁆ LieAlgebra.f₄ (R := K))`.

Both elaborate with `sorry` for `K : Type*`, `[Field K] [CharZero K]` (scratch `RepairTest.lean`).

## R04 (P2) — The README plans, as open targets, results the pinned Tau Ceti already proves

Location (README): line 319 Layer 0 (the `V(n)` classification, sl₂ complete reducibility, Clebsch–Gordan, integer spectrum); line 1066 "Export `lieChevalleyRestrictionIso`…"; line 1223 "prove `finrank = 14`, that it is Killing-simple…"; line 1237 "On this native split carrier build `TauCeti.AlbertAlgebra.det`…"; line 1469 "the carrier `glIrreducible n μ` is **named**…"; line 1491 (`glCasimir`); the minuscule Pieri, isotypic decomposition and orbit-sum targets of Layer 6.

Claim: what exists at the pins is cited in the supplier contracts, not planned again. As written, the scope claims open work that is finished, and Suggested.lean re-sorries it (`minuscule_pieri` at line 888 has exactly the statement of native `TauCeti.minuscule_pieri`).

Witness: these exist at the pin:
- **sl₂:** `TauCeti.exists_int_of_hasEigenvalue` (`Lie/Sl2/Spectrum.lean:151`); `nonempty_lieModuleEquiv_of_hasPrimitiveVectorWith` (`Sl2/Classification.lean:135`); `Sl2/ClebschGordan.lean`; `exists_isCompl_of_toLieSubalgebra_eq_top` (`Sl2/CompleteReducibility.lean:135`).
- **Layer 6:** `TauCeti.minuscule_pieri` (`HighestWeight/Pieri.lean:154`); `nonempty_lieModuleEquiv_directSum_irreducibleQuotient` (`HighestWeight/Decomposition.lean:168`); `formalCharacter_irreducibleQuotient_eq_orbitSum_add_lower` (`HighestWeight/OrbitSum.lean:114`); `exists_ne_zero_lieInvariant_irreducibleQuotient_iff` (`HighestWeight/Dual.lean:169`).
- **Layer 7:** `TauCeti.vermaCentralCharacter_eq_iff` (`CentralCharacter/Isomorphism.lean:159`); `polynomial_eq_zero_of_dominantIntegral` (`HighestWeight/Weight/Density.lean:63`).
- **Layer 8:** `TauCeti.AlbertAlgebra.det`, `mul_mul_self`, `six_mul_det` (`AlbertAlgebra/Determinant.lean:101,248,310`); `TauCeti.Octonion.isSimple_derivationLieAlgebra` (`Octonion/Simple.lean:515`); `isIrreducible_imaginaryLieSubmodule` (`Octonion/Fundamental.lean:317`); `TauCeti.finrank_prod_sl_exteriorPower_dual` (`Lie/E8/Vinberg.lean:79`).
- **Layer 9:** `GeneralLinear/{Carrier,Casimir,Pieri,Restriction,Uniqueness,Existence,Isotypic,CompleteReducibility,Radical}.lean`.

Repair: list each of these under a `From Tau Ceti` supplier contract with exact name and file, and delete the corresponding construction targets. State what remains open as this roadmap's targets, for example:
- the universe generalisation of the Harish-Chandra theorems (native only for `K : Type`, see R06);
- `serreLift_injective_of_base`;
- the two Layer 8 identifications of R03;
- `finrank` of `e₆` and `e₇`;
- Cartan conjugacy;
- the PBW symmetrization and Rees results;
- the compact real-form lane;
- Layer 10.

## R05 (P2) — A supplier citation that open PR #1047 drops

Location: README line 915, "[CompactGroups Layer6](../CompactGroups/README.md#layer-6-characters-of-compact-groups)'s actual compact-group character orthogonality gives its squared group-Haar norm".

Claim: at the head of #1047, CompactGroups' Layer 6 is "global forms and representation rings". Character orthogonality there is native, not a Layer 6 target. This citation breaks when #1047 merges.

Witness: the #1047 head `CompactGroups/README.md:721` heading `## Layer 6: global forms and representation rings`; its line 765 says "*Needs:* Native compact complete reducibility and character orthogonality".

Repair: cite the native declaration `TauCeti.ContRepresentation.inner_characterLp_eq_finrank_contIntertwiningMap` (`TauCeti/RepresentationTheory/Compact/Intertwiner/Dimension.lean:145`), which exists at the pin and on both heads, instead of the CompactGroups layer anchor.

## R06 (P3) — Padding in Suggested.lean

Location: Suggested.lean, throughout Layers 0–7 and the PBW, `CompactDivisionOctonion` and `PBWRees` sections.

Claim: the file has 383 declarations. Of these:
- 69 theorems are proved in place, 31 of them by a single native lemma. Examples: `weyl_character_formula` (line 654), `weyl_dimension_formula`, `kostant_multiplicity_formula`, `freudenthal_multiplicity_formula`, the classification theorems, `isDomain_universalEnvelopingAlgebra := by infer_instance`, the `pairCoordinates_*` lemmas (`rfl`), `hbar_*`/`generator_*`.
- 27 `abbrev`/`def` declarations are aliases of native definitions (`vermaModule`, `irreducibleQuotient`, `casimirElement`, `formalCharacter`, `hcProjection`, …).
- Others mirror Checks: `exists_polynomialAlgEquiv_of_finrank_one` ("Acceptance test"), `finrank_exteriorPower_three_nine`, `mem_integralWeightLattice_iff := Iff.rfl`.

The aliases also change generality silently. Because the section binder `[algClosedK : IsAlgClosed K]` is auto-included, `weyl_complete_reducibility` demands algebraic closure, whereas the README (line 595) and native `exists_isCompl_of_isKilling` do not.

Witness (one-tactic probe on a scratch copy, elaborated at the pins): seven sorried theorems close in one tactic.
- `sl2_hAction_eigenvalue_isInt := TauCeti.exists_int_of_hasEigenvalue t hμ`
- `isotypic_decomposition_equiv := by exact TauCeti.nonempty_lieModuleEquiv_directSum_irreducibleQuotient (b := base)`
- `polynomial_eq_zero_of_dominantIntegral` (native)
- `nilpotentInnerLieAutomorphism_symm := by simp [nilpotentInnerLieAutomorphism]`
- `finrank_exteriorPower_three_nine` (native)
- `derivation_apply_one := TauCeti.derivationLieAlgebra.apply_one_eq_zero D`
- `hasCentralRadical_matrix := inferInstance`

Repair: delete these declarations from Suggested.lean; the README keeps the statements as cited native results or Checks. Do not re-prove them in place.

## R07 (P3) — The module docstrings describe an API catalogue, not the acceptance test

Location: Suggested.lean lines 38–43 ("**This file is not the roadmap and is not exhaustive.** … suggest Lean forms for particular milestones… `sorry` is allowed in this human-owned roadmap library") and line 2584 ("This section is not the roadmap and is not exhaustive").

Claim: the docstring must state the headline theorems, and for each headline that cannot be stated at the pins, say which carrier is missing. It names none. Examples that need a statement: the `Ω ≃ P∨/Q∨` and `Ω ⋊ Γ` theorems of Layer 10 (line 2447 only says the README has them), the `E₆`/`E₇` models, and the compact Albert results. The file also contains a second module docstring (line 2584).

Witness: lines 38–43 and 2584–2590 quoted above.

Repair: one docstring titled "LieHighestWeight: target signatures". It lists the headlines that remain open after R04, names each headline that cannot be stated together with the carrier it lacks, and contains no process wording.

## R08 (P3) — Gate `imports` / `mathlib-subimports`

Location: Suggested.lean line 2, `import Mathlib.RingTheory.TensorProduct.Basic`.

Claim: only `import Mathlib` followed by the `TauCeti.*` modules actually used is allowed.

Witness: gate lines `imports (1)` and `mathlib-subimports (1)`.

Repair: delete line 2. It is redundant under `import Mathlib`, and the file still elaborates.

## R09 (P3) — Gate `build`: 31 warnings other than `sorry`

Location: Suggested.lean lines 350–1494 ("automatically included section variable(s) unused" for `algClosedK`, `charZeroK` and `[IsTriangularizable K H L]`) and lines 370, 655, 735, 1556, 1581 (unused `hα`/`hlam`).

Claim: `sorry` must be the only warning.

Witness: my own `lake env lean` run gives 0 errors, 195 `sorry` warnings and 31 other warnings. These match the gate.

Repair: most of the affected declarations disappear under R06. For the remaining ones, carry the needed binders explicitly in each signature and drop unused hypotheses.

## R10 (P3) — Gate `statement-hygiene`: 11 hits

Location (Suggested.lean): `Nonempty` conclusions at lines 135, 832, 847, 1647, 1746, 1786, 2052, 2193, 2260, 2272, and `letI` in the signature of `weylAut_cartan_apply` at line 1194.

Claim: equivalence statements should name the canonical map and assert `IsIso`/bijectivity, or carry a `nonempty_*` name. A signature may not contain `letI`.

Witness: gate `statement-hygiene (11)`.

Repair:
- `serre_presentation_equiv` → state `Function.Bijective (TauCeti.serreLift hS)`.
- The two exceptional identifications → as in R03.
- The rest are native, delete (R04/R06). Any `Nonempty` statement that survives is renamed `nonempty_*`.
- Delete `weylAut_cartan_apply`; it is native `TauCeti.weylAut_apply_of_lie_eq_smul`.

## R11 (P3) — Gate `blob`: links pinned to a commit

Location: README lines 867, 1516, 1799, each `https://github.com/TauCetiProject/TauCetiRoadmap/blob/149fe79…/SchurWeyl/README.md#layer-7-…`.

Claim: cite the roadmap and section, not a commit.

Witness: gate `blob (3)`.

Repair: `[SchurWeyl Layer 7](../SchurWeyl/README.md#layer-7-symmetric-functions-the-frobenius-characteristic-and-rsk)`. The heading exists on main at `SchurWeyl/README.md:580`, and `LRTableau` is at line 631.

## R12 (P3) — Gate `prnum`

Location: README line 1258, "design of [Mathlib PR41919](https://github.com/leanprover-community/mathlib4/pull/41919)".

Claim: no pull-request numbers.

Witness: gate `prnum (1)`.

Repair: state the convention itself (`Octonion R := CayleyDickson (Quaternion R)` with the displayed product) without referring to an unmerged pull request.

## R13 (P3) — Gate `private-paths`: a web locator in place of a source

Location: README line 1241, "[Baez's trace-power identity](…)", a link to a page on the `math.ucr.edu` host (`…/octonions/node12.html`).

Claim: the scanner trips on the `home` segment of that URL. The underlying defect is a web page used as a locator.

Witness: BaezOctonions line 1479 (§3.4, p. 32) gives the cyclic determinant `αβγ − (α‖x‖² + β‖y‖² + γ‖z‖²) + 2Re(xyz)`; line 1481 gives the trace-power formula with coefficients 1/3, 1/2, 1/6.

Repair: cite "Baez, *The Octonions*, Bull. AMS 39 (2002), §3.4, p. 32 (arXiv math/0105155v4)". Then note that this target is native: `TauCeti.AlbertAlgebra.det_eq_invOf_two_mul_invOf_three_mul` (R04).

## R14 (P3) — The README is not in house shape

Location: README headings at lines 75, 169, 263, 313, 319–1623.

Claim: the required sections are absent: `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts` (with From Mathlib / From Tau Ceti / From TauCetiRoadmap.X), `## How to read the build`, `## Layer k` / `### k.n`, and `## Downstream consumers`. Layers are `###`, Layer 10 comes after "Worked examples", and a paragraph follows References.

Witness: counts in the README are 0 for `**Checks.**`, 0 for `### Examples`, 0 for `### Dependencies` and 0 for `*Needs:*`. No definition carries three Checks.

Repair: restructure into the house shape. Every surviving definition gets an API list and at least three discriminating Checks; the README's worked examples (sl₂ `Ω`, A₂ dimensions, gl₂ Casimir) are ready-made Checks. Every target gets a `*Needs:*` line, and every layer gets `### Examples` and `### Dependencies`.

## R15 (P3) — Claims carry no locators, and the precursor cites an unnamed source

Location: README lines 608–770 ("the source's decomposition procedure", "the source's right-trivialized Jacobian", "the source's strict inequality", "retain the printed p5 `+i`/`+j` indicator … p6"). The Weyl character, dimension, Kostant, Freudenthal, Harish-Chandra, Serre and PBW statements have no theorem or page locator. References (line 1808) give chapter ranges only.

Claim: every theorem needs its locator at the claim, and every source must be named.

Witness: only two locators appear in the whole README, Stacks 02ML (line 1038) and Etingof (line 1123). The "notes" of the precursor are not in References.

Repair:
- Name the precursor's source (author, title, version) in References and cite its theorem or page at each claim.
- Add locators at the claims, for example Etingof Thm 10.1, pp. 54–55 (EtingofLieGroups line 2324) for Chevalley restriction and Thm 14.1, pp. 73–74 (line 3260) for Harish-Chandra. The README links v2; I read v3 (21 Jun 2026), so cite the version that was read.
- Add Humphreys GTM 9 section numbers for the classical results.

## R16 (P3) — Stale citation ids and names

Location and witness:
- README line 875 cites "TensorProductCombinatorics H1.6" with anchor `#h16-…`, and line 922 cites "H2.6". At the #1107 head the sections are `### 1.6 Rational cone series, Fourier boundary values and lattice endpoints` (`README.md:694`) and `### 2.6 The type-A Kostant partition function` (`README.md:1191`).
- Lines 1356 and 1407 cite "TangentialBordism B3" with anchor `#b3-low-groups-…`. There is no such heading at the #942 head; the material is `### 9.1 Idempotent Cayley plane (B3.6)` and `### 9.2` (`README.md:2303,2362`).
- Lines 982 and 1109 cite `TauCeti.SymmetricAlgebra.adjointDerivation` and `adjointDerivation_mem_homogeneousSubmodule`. At the pin the object is `TauCeti.lieModuleDerivation` (`LinearAlgebra/SymmetricAlgebra/LieModule.lean:89`); the old name occurs nowhere in Tau Ceti.
- Line 1780 attributes `equivOfCartanMatrixEq` to RootSystems. It is Mathlib's `RootPairing.Base.equivOfCartanMatrixEq` (`Mathlib/LinearAlgebra/RootSystem/CartanMatrix.lean:362`).

Repair: cite "TensorProductCombinatorics §1.6, §2.6" and "TangentialBordism §9.1–9.2 (B3.6–B3.7)" with working anchors, `TauCeti.lieModuleDerivation`, and Mathlib for `equivOfCartanMatrixEq`.

## R17 (P3) — The README backticks its own names that Suggested.lean does not declare

Location: README line 300 ("`Suggested.lean` pins … `Sl2Irrep` … `weylCharacter`"), and lines 1333–1398, which name `compactAlbertAlgebra`, `compactAlbertDerivation_complexification`, `compactAlbertDerivation_killing_negDef`, `compactAlbertDerivationBaseChange`, `compactAlbertDerivation_finrank`, `compactAlbertDerivation_skewAdjoint`, `divisionOctonionComplexificationIso` and `compactAlbertComplexificationIso`.

Claim: a backticked name of this roadmap's own is a claim that Suggested.lean declares it.

Witness: `grep` finds none of these 10 names in Suggested.lean. TangentialBordism (#942 head, `README.md:272`) consumes three of them by name.

Repair: there are two options. Either declare the compact Albert carrier with a real body (it is an explicit structure, as `DivisionOctonionReal` is) and state the consumed theorems, or write them as prose targets without backticks. Delete the claim at line 300.

## R18 (P3) — Process wording and invented vocabulary

Location and witness:
- README lines 1850–1852 (after References): "**Prototype carrier and chart boundary.** The LHW prototype … only the law fields are admitted … The LG prototype imports …". This describes another roadmap's Lean file and uses `PositivePairCoordinates A`, a name defined nowhere (main, the #1051 head, or the pins).
- Line 623: "These inputs commission the following construction".
- Line 1649: "The prototype stores the actual … witnesses".
- Suggested.lean line 1659: "the samples do not claim native implementation is absent".
- `exists_chevalleySystem` (Suggested.lean line 1609) asserts only nonzero root vectors with `⁅e_α, f_α⁆ = h_α`. That is not a Chevalley system in the standard sense, which also fixes the structure constants.

Repair: delete the paragraph after References. Rewrite the other sentences timelessly. Rename the lemma to say what it asserts (for example `exists_rootVectors_lie_eq_coroot`), or delete it as a short consequence of Mathlib's `exists_isSl2Triple_of_weight_isNonZero`.

## R19 (P3) — Layer 10's compact-centre application has no owner

Location: README line 1726, "#### Late compact-center application in LieGroups … Thus prove, equivariantly …, `Z(G) ≃ P∨/Y`".

Claim: the subsection plans group-level targets (the compact torus period comparison, and `Z(G) ≃ P∨/Y` for compact semisimple `G`) and labels them a LieGroups application. Neither LieGroups on main nor its #1051 head has such a target, so nobody owns them.

Witness: `grep 'P∨/Y\|Z(G)'` in LieGroups' README returns only the generic `ker Ad = Z(G)` lines (#1051 head, around line 537).

Repair: either make this a target of this roadmap with `*Needs:*` LieGroups Layers 4, 6 and 7, or cut it and name it as a downstream LieGroups Part II item.

## R20 (P3) — Conflicting open pull request with no stated order

Location: Suggested.lean, which both this pull request and #1220 ("LieHighestWeight: tensor strings, reductive centers and opposition") change.

Claim: the two heads conflict in this file, and neither description says which one rebases on the other.

Witness: `scratch/overlaps.md`: "#1220 and #1797 conflict in `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/Suggested.lean`".

Repair: state the order in the description. Since #1797 only moves text, the natural order is to rebase #1797's fold onto #1220, or the reverse, and to say which.

## Verified sound

**Adversarial table** (28 rows; values computed on each side).

| Statement | Instances | Values (left / right) | Result | Change |
|---|---|---|---|---|
| Weyl character formula (README Layer 6; `weyl_character_formula`) | sl₂, λ=ω; λ=0; rank 0 | `(e^ω+e^{−ω})(1−e^{−2ω}) = e^ω − e^{−3ω}` / `e^{ω} − e^{−3ω}`; `1−e^{−α}` / `1−e^{−2ρ}=1−e^{−α}`; `1`/`1` | holds | delete as padding (R06) |
| Weyl dimension formula | sl₂, λ=nω; A₂ at ω₁, ω₂, ω₁+ω₂, 2ω₁, 3ω₁ | `(n+1)/1` / `n+1`; `(a+1)(b+1)(a+b+2)/2` = 3, 3, 8, 6, 10 / README 3, 3, 8, 6, 10 | holds | R06 |
| Kostant multiplicity | sl₂, λ=n, μ=n−2k | `P(kα) − P(−(2n−2k+2)ω) = 1−0` / mult 1; at k=n+1: `1 − P(0) = 0` / 0 | holds | R06 |
| Freudenthal (native j : ℕ, `.erase 0`) | sl₂ V(1), μ=−ω | `4⟨ω,ω⟩·m` / `2·1·⟨ω,2ω⟩ = 4⟨ω,ω⟩` ⇒ m=1 | holds; `Weights/String.lean:119` confirms j ≥ 1 | R06 |
| Tits sign `invariantForm_isSymm_iff_tits_sign` | sl₂ V(1); V(2) | Σ⟨λ,α^∨⟩ = 1 ⇒ −1 / standard form alternating; 2 ⇒ +1 / Killing form symmetric | holds | native `Dual.lean:169` covers self-duality |
| `minuscule_pieri` | sl₂ λ=0, μ=ω, ν=ω; ν=−ω | mult 1 / ω weight of L(ω) ⇒ 1; ν=−ω excluded by `hnu` | holds | identical to native `Pieri.lean:154` (R04) |
| Casimir normalisation, sl₂ `Ω=h²+2h+4fe` | κ(h,h)=8, κ(e,f)=4 | `h²/8+(ef+fe)/4 = (h²+2h+4fe)/8` / `Ω/8` | holds | — |
| Raw / linear HC images, sl₂ | t=λ(h) | `(−t−2)²+2(−t−2) = t²+2t`; `(t−1)²+2(t−1) = t²−1` / README `t²+2t`, `t²−1`; `χ_n(Ω) = n(n+2)` | holds; Etingof Thm 14.1(ii) shift +ρ agrees | — |
| Chevalley restriction (trace route) | degree 0; Etingof Thm 10.1 | `tr(id) = dim M` / `Σ mult·μ(h)^0 = dim M` | holds | native `ChevalleyRestriction.lean:151` (R04) |
| Serre transpose convention | Mathlib `cartanMatrixIn i j = pairing i j = α_i(α_j^∨)`; `HE`: `⁅H i,E j⁆ = CM i j • E j` | needs `CM i j = α_j(h_i)` / `(base.cartanMatrix)ᵀ i j = α_j(h_i)` | holds | `serreLift_injective_of_base` is the open target |
| `sl2_finrank_of_hasPrimitiveVector` hypothesis | sl₃ adjoint, α₁-triple | `θ(α₁^∨) = 2−1 = 1` ⇒ dim 2 claimed / 8 | restricted irreducibility needed, as stated | — |
| gl_n Casimir scalar | highest weight vector; gl₂ | `Σμ_i² + Σ_{i<j}(μ_i−μ_j) = Σμ_i(μ_i+n−1−2i)`; `μ₀(μ₀+1)+μ₁(μ₁−1)` / README same | holds | native `Casimir.lean:234` (R03) |
| Staircase separation | ν_t = N−½−t | `C(ν−ε_t)−C(ν) = −3N+3+4t` ⇒ difference `4(t−s)` / README `4(t−s)` | holds | — |
| CAR example | `Σ F_ii` | `½(N + N(N−1)) = N²/2` / `Σν_i = N²/2`; `2^{N²}/2^{N(N−1)/2} = 2^{N(N+1)/2}` | holds | — |
| `hasCentralRadical_iff_…` | L=0; sl₂⋉K²; gl₁ Jordan block | both sides true; `IsCompl ⊥ ⊤` holds, derived not semisimple ⇒ RHS false, LHS false | both conjuncts needed | — |
| `gl_dual_standard_pieri` | n=1; n=0; μ=(½,½) | `L(μ−1)` / one summand; `0` / empty sum; `(−½,½)` excluded (diff −1), `(½,−½)` kept, dim 2 / 2 | holds | native `Pieri.lean:388` |
| Integral weights: `score_eq_gap_sum` | n+1=2 | `(S/2)(x₀+x₁) + (x₀−x₁)(l₀−l₁)/2 = x₀l₀+x₁l₁` / `x·l` | holds | — |
| Non-injectivity claim | x=(3,2,1), (1,1,−2), (2,−1,−1) | 3 / 3 | holds | — |
| `finite_dominant_score_sublevel` needs `StrictAnti` | x=(1,1) | score ≡ S / infinite set | hypothesis necessary | — |
| Polynomiality: `staircase_alternant` | n=2; n=0 | `t₀ − t₁` / `t₀(1 − t₁/t₀)`; `1`/`1` | holds | — |
| `numerator_coefficient_norm`, `candidate_top_coefficient` | n=2, l=0; n=1 | coefficients ±1 ⇒ 2 / 2!; `t^m` coefficient 1 / 1 | holds | — |
| Haar norm | λ+ρ strictly decreasing | `(1/n!)Σ_{w,v} sgn·sgn·δ = (1/n!)·n!` / 1; `\|D\|² = ∏_{i<j}\|t_i−t_j\|²` on the unit torus | holds | — |
| Type-A branching indicator | GL₂→GL₁×GL₁, λ=(1,0) | `λ_i ≥ μ_i ≥ λ_{i+1}` ⇒ μ₁ ∈ {0,1} / weights (1,0), (0,1); GL₁ exponent `\|λ\|−\|μ\|` ∈ {1,0} | holds | — |
| Type-A stable tensor range | ≥ versus > | with ≥, an inverted gap gives `(ν+ρ)_i−(ν+ρ)_{i+1} ≤ −1` / contradiction | holds (also with ≥) | none (the source's form is kept) |
| Division octonions: product and norm | x=(i,0), y=(0,1); `x x̄` | `xy = (0,i)`, N=1 / N(x)N(y)=1; `(\|a\|²+\|b\|², 0)` / `N(x)·1` | holds | — |
| Cross-product identities | u=i, v=j, w=j; u=v=i, w=j | `i×k = −j` / `g(i,j)i − g(i,i)j = −j`; associator identity `−i`/`−i`, `j`/`j` | holds | — |
| `right_alternative` | any `NonAssocRing` | `(y*x)*x` / `(y*x)*x` | **vacuous** | R02 |
| Complex scalar extension | ℂ⊗Der_ℝ 𝕆_div vs Der 𝕆_ℂ; conjugation on `i⊗1` | dim 14 / native 14 (`Derivation.lean:959`); `i⊗1` / tensor star `−i⊗1` (distinct) | holds | — |
| Albert determinant | Baez §3.4 vs README vs native | `⅓tr a³ − ½tr a² tr a + ⅙(tr a)³` / `((tr)³ − 3tr·tr(A²) + 2tr(A³))/6` / `six_mul_det` | holds | native (R04, R13) |
| Isotypic toolkit example | M = (V(1)⊗V(1))⊕V(0) | multiplicities 1, 0, 2; `3+0+2 = 5` / `dim M = 4+1` | holds | — |

**Gate and build.**
- I used the worker's gate at this head (as data). I also ran my own `lake env lean` on Suggested.lean: 0 errors, 195 `sorry` warnings, 31 other warnings. I reproduced the 47 `sorry`-data hits by scanning bodies; one extra hit at line 770 was a docstring false positive.
- One-tactic probes: seven closed (R06). Two did not, `hcProjectionToDotInvariants_bijective` and `centralCharacter_eq_iff_dotOrbit`, because native `TauCeti.harishChandraIso` and `vermaCentralCharacter_eq_iff` bind `K : Type` (`Isomorphism.lean:61`), while the local statements use `K : Type*`.
- `right_alternative := rfl` closes.
- Repair statements were elaborated in scratch `RepairTest.lean`.
- The worktree is unchanged (`git status` empty).
- I did not write a separate `#check` scaffold. Instead I compared the supplied elaborated signatures with the README. The flagged dropped `[IsTriangularizable K H L]` binders are harmless: native `instIsTriangularizableOfIsAlgClosed` supplies them. The auto-included `[IsAlgClosed K]` narrows `weyl_complete_reducibility` (R06).

**Dependency check.**

    depcheck: 244 roadmaps, 2467 edges, 0 problem(s)

There is no cycle with TensorProductCombinatorics: its #1107 head, README lines 73–77 and 2575, states that nothing of LieHighestWeight is consumed there.

**Library declarations opened at the pins (file:line).**
- Mathlib: `RootPairing.pairing` (`LinearAlgebra/RootSystem/Defs.lean:195`), `cartanMatrixIn` (`CartanMatrix.lean:53`), `equivOfCartanMatrixEq` (`CartanMatrix.lean:362`), `CartanMatrix.Relations.HE` (`Algebra/Lie/SerreConstruction.lean:102`). No `Casimir` or `Verma` in `Mathlib/Algebra/Lie`, so the README's claim about Mathlib is correct.
- Tau Ceti: `exists_int_of_hasEigenvalue` (`Lie/Sl2/Spectrum.lean:151`); `weightString` (`Lie/Weights/String.lean:119`); `freudenthalRHS` (`HighestWeight/Freudenthal.lean:212`); `IsMinuscule` (`HighestWeight/Minuscule.lean:259`); `minuscule_pieri` (`HighestWeight/Pieri.lean:154`); `lieChevalleyRestrictionIso` (`HighestWeight/ChevalleyRestriction.lean:151`); `harishChandraIso` (`CentralCharacter/Isomorphism.lean:106`); `vermaCentralCharacter_eq_iff` (`:159`); `nonempty_lieModuleEquiv_directSum_irreducibleQuotient` (`HighestWeight/Decomposition.lean:168`); `formalCharacter_irreducibleQuotient_eq_orbitSum_add_lower` (`OrbitSum.lean:114`); `exists_ne_zero_lieInvariant_irreducibleQuotient_iff` (`Dual.lean:169`); `expAd_symm` (`Lie/InnerAutomorphism.lean:139`); `derivationLieAlgebra.apply_one_eq_zero` (`Lie/Derivation/Basic.lean:251`); `TauCeti.Octonion` (`Octonion/Basic.lean:143`) with `norm_mul` (:537) and `right_alternative` (:684); `Octonion.finrank_derivationLieAlgebra` (`Octonion/Derivation.lean:959`); `g₂ToDerivationLieAlgebra` and its surjectivity (`Octonion/Serre.lean:267,397`); `isSimple_derivationLieAlgebra` (`Octonion/Simple.lean:515`); `TauCeti.AlbertAlgebra` (`AlbertAlgebra/Basic.lean:118`) with `finrank_eq_twentySeven` (:227) and `finrank_traceZero` (:442); `AlbertAlgebra.det` (`Determinant.lean:101`), `mul_mul_self` (:248), `six_mul_det` (:310); `AlbertAlgebra.finrank_derivationLieAlgebra` (`Derivation/Finrank.lean:384`); `finrank_exteriorPower_three_nine` and `finrank_prod_sl_exteriorPower_dual` (`Lie/E8/Vinberg.lean:60,79`); `diagonalCartan`, `glWeightEquiv` (`GeneralLinear/DiagonalCartan.lean:97,267`); `glIrreducible` (`Carrier.lean:204`); `glCasimir` (`Casimir.lean:81`); `gl_dual_standard_pieri` (`GeneralLinear/Pieri.lean:388`); `hasCentralRadical_matrix` (`Radical.lean:313`); `lieModuleDerivation` (`SymmetricAlgebra/LieModule.lean:89`); `inner_characterLp_eq_finrank_contIntertwiningMap` (`Compact/Intertwiner/Dimension.lean:145`).

**Cross-roadmap citations resolved.**
- Resolve on main: CompactGroups Layer 6, LieGroups Layers 4, 6 and 7, CharacteristicClasses C5, LieGroupoidsPoisson §G4.6A (positive Lie–Poisson, line 1325, agrees with README line 487), GroebnerGeometry G4, HamiltonianReduction R2, SchurWeyl Layer 7 and `LRTableau`, ClassicalGroups Layers 2–4, SpinRepresentations Layer 9, AdoIwasawa (consumes the PBW layer).
- Broken or stale: TensorProductCombinatorics "H1.6"/"H2.6" (R16), TangentialBordism "B3" (R16), CompactGroups Layer 6 at #1047 (R05).

**Ownership against open pull requests.** Checked #1220 (R20), #1047 (R05), #1107, #942, #1736, #1192, #1207 and #1051. ExceptionalThetaCorrespondencesForG2, ClassicalGroups, SpinRepresentations and LieGroups consume `TauCeti.Octonion`, `TauCeti.irreducibleQuotient` and LieHighestWeight Layer 8 as suppliers; none of them owns these objects a second time.

**Sources read.**
- EtingofLieGroups (arXiv 2401.01446v3): Thm 10.1 (line 2324, pp. 54–55: Chevalley restriction, trace-power surjectivity) and Thm 14.1 (line 3260, pp. 73–74: raw HC with `f_b(λ+ρ)`, `gr(HC) = Res`). Both agree with README Layer 7.
- Stacks Lemma 10.122.11, tag 02ML (line 13996): finite after localising at a minimal prime. This agrees with README line 1038.
- BaezOctonions §3.4 (lines 1479–1481): agrees with the Albert determinant.

## Not verifiable

- Seeded targets "Weyl character formula" (×2), "Integral weights, finite induction and virtual characters", "Polynomiality before character identification", "Haar norm and identification", "Type-A coefficient and branching applications", "The positive division-octonion algebra and its invariant tensors", "Complex scalar-extension boundary" and "Prototype carrier and chart boundary": none carries a locator, so I could not check one. I verified the mathematics instead (table above).
- The precursor's "notes" (printed p5/p6): the README never names the source, so I could not look it up.
- Humphreys GTM 9, Humphreys GSM 94, Fulton–Harris, Serre, Bourbaki Lie VII–VIII, Jacobson, Schafer, Goodman–Wallach, Dixmier, Molev and Jantzen: no open legal copy found. The README cites them only by chapter or not at all.
- The definition of a Chevalley system, used in R18: Bourbaki VIII §2.4 is paywalled, so I relied on the standard definition.
- Etingof v2 numbering (the README links v2): I read v3 only.

## Source issues

- none
