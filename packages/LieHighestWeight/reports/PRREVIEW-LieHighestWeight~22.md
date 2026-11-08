# Review of LieHighestWeight (pull request #1797 at f925965)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`
**Verdict:** needs changes

This is an incremental re-review. The previous review read a285fd7.

What changed since then:
- `git diff a285fd7 f925965 -- TauCetiRoadmap/RepresentationTheory/` is empty.
- The pins are unchanged: Tau Ceti `2fd255d997`, Mathlib `1b1ccf4b08`.
- The two new commits rewrite AlgebraicTopology and QuadraticFormInvariants and touch 20 lines of IntegralLattices `Suggested.lean`. None of these mentions LieHighestWeight, and this roadmap mentions none of them.

None of the 20 previous findings is repaired, so each is restated below. Witnesses that moved in other roadmaps are updated: R03 (a line number at the pin) and R16/R17 (TangentialBordism at its open head). The gate still fails with the same counts.

## R01 (P1) — 47 declarations carry sorry'd data

Location: `Suggested.lean`, 47 declarations. Lines: 227, 306, 313, 315, 928, 1046, 1057, 1067, 1310, 1355, 1379, 1439, 1673–1679, 1685, 1689, 1703, 1753–1760, 1769, 1773, 1871, 1890, 1892, 1995, 1999, 2017, 2026, 2144, 2149, 2153, 2201–2208, 2302, 2427–2443. Example: line 1673 `def Octonion : Type → Type := sorry`.

Claim: no `def`, `abbrev`, `instance` or `opaque` may have `sorry` as its body, and nothing may mention one. Several declarations with real bodies are built on these stand-ins: `hcProjectionLinear`, `harishChandraLinearIso`, `highestWeightTracePowerRestriction`, `pbwSymmetrizationCenter` and `derivationLieAlgebra K (Octonion K)`.

Witness: gate `sorry-data (47)` at f925965. Native `TauCeti.Octonion` is at `TauCeti/Algebra/Octonion/Basic.lean:143` (a `structure`); native `TauCeti.glIrreducible` is at `Algebra/Lie/GeneralLinear/Carrier.lean:204`.

Repair:
- **Native carrier exists.** Use it in place of the stand-in:
  - `TauCeti.Octonion`, `TauCeti.AlbertAlgebra`
  - `TauCeti.diagonalCartan`, `TauCeti.glWeightEquiv`, `TauCeti.glIrreducible`, `TauCeti.glCasimir`
  - `TauCeti.lieChevalleyRestrictionIso` (`HighestWeight/ChevalleyRestriction.lean:151`)
  - `TauCeti.harishChandraIso` (`CentralCharacter/Isomorphism.lean:106`)
- **A real body is easy.** Write it:
  - `slTwoDiagonalCartan` is `LieSubalgebra.lieSpan` of the diagonal `h`.
  - `weightTranslation μ` is the `SymmetricAlgebra.lift` of `x ↦ ι x + algebraMap (μ x)`.
  - Prove the `NonAssocRing DivisionOctonionReal` fields and the scalar-tower instances.
- **Heavy, and no headline needs it.** Make it a README target with its signature and delete it from the Lean: `basisPbwGraded`, `centerPBWGraded*`, `pbwSymmetrization`, `tracePowerPolynomial` and the Layer 10 alcove data.

## R02 (P1) — `right_alternative` is a tautology

Location: `Suggested.lean:1943`, `theorem right_alternative (x y : DivisionOctonionReal) : y * x * x = (y * x) * x := sorry`.

Claim: `y * x * x` parses as `(y * x) * x`, so the statement is `a = a`. The right alternative law of the division octonions is never asserted.

Witness: the probe was re-run at f925965 on a scratch copy. With `:= rfl` in place of the `sorry`, the line elaborates with no message, and the file still has 0 errors.

Repair: state `(y * x) * x = y * (x * x)`. This form elaborates with `sorry` in the same probe and matches native `TauCeti.Octonion.right_alternative` (`Octonion/Basic.lean:684`).

## R03 (P2) — Layer 8 and Layer 9 headlines are stated on sorry'd stand-ins although native carriers exist

Location: `Suggested.lean:1673–1797` and `2144–2318`. Affected statements: `finrank_derivationOctonion`, `derivationOctonion_equiv_g2`, `derivationAlbert_equiv_f4`, `gl_dual_standard_pieri` and `glCasimir_smul_of_isGlHighestWeightVector`.

Claim: when `Octonion := sorry`, a theorem about `Octonion K` is about an unspecified type. The stand-in also narrows the scalars to `K : Type`.

Witness: these are native at the pin:
- `Octonion.finrank_derivationLieAlgebra` (`Octonion/Derivation.lean:958`, `= 14`)
- `AlbertAlgebra.finrank_derivationLieAlgebra` (`AlbertAlgebra/Derivation/Finrank.lean:384`)
- `gl_dual_standard_pieri` (`GeneralLinear/Pieri.lean:388`)

Repair: delete the stand-ins and the statements the pin already proves. State the open halves on the native carriers, with `K : Type*`, `[Field K] [CharZero K]`:
- `Function.Injective (TauCeti.Octonion.g₂ToDerivationLieAlgebra (R := K))`
- `Nonempty (TauCeti.derivationLieAlgebra K (TauCeti.AlbertAlgebra K) ≃ₗ⁅K⁆ LieAlgebra.f₄ (R := K))`, named `nonempty_*`

Both forms elaborated at f925965 in the scratch probe, which adds `TauCeti.Algebra.Octonion.Serre` and `TauCeti.Algebra.AlbertAlgebra.Basic`.

## R04 (P2) — The README plans, as open targets, results the pinned Tau Ceti already proves

Location (README):
- line 319, the Layer 0 sl₂ classification
- line 1066, "Export `lieChevalleyRestrictionIso`…"
- line 1223, "Build `TauCeti.derivationLieAlgebra K (TauCeti.Octonion K)`"
- line 1237, "build `TauCeti.AlbertAlgebra.det`"
- line 1469, `glIrreducible` "named"
- line 1491, `glCasimir`
- the Layer 6 Pieri, isotypic and orbit-sum targets

Claim: what exists at the pins is cited in the supplier contracts, not planned again.

Witness, all at the pin:
- `TauCeti.minuscule_pieri` (`HighestWeight/Pieri.lean:154`), the same statement as `Suggested.lean:888`
- `nonempty_lieModuleEquiv_directSum_irreducibleQuotient` (`Decomposition.lean:168`)
- `vermaCentralCharacter_eq_iff` (`Isomorphism.lean:159`)
- `exists_int_of_hasEigenvalue` (`Sl2/Spectrum.lean:151`)
- `six_mul_det` (`AlbertAlgebra/Determinant.lean:310`)

Repair: list each native result under `From Tau Ceti`, with its exact name and file, and delete the matching construction target. The open targets that remain:
- the Harish-Chandra universe generalisation
- `serreLift_injective_of_base`
- the two Layer 8 identifications (R03)
- `finrank` of `e₆` and `e₇`
- Cartan conjugacy
- the PBW symmetrisation and Rees results
- the compact real-form lane
- Layer 10

## R05 (P2) — A supplier citation that an open pull request drops

Location: README line 915, "[CompactGroups Layer6](../CompactGroups/README.md#layer-6-characters-of-compact-groups)'s".

Claim: this citation breaks when the open CompactGroups revision merges.

Witness: on main, CompactGroups line 369 is `### Layer 6: characters of compact groups`. At the open revision's head, line 721 is `## Layer 6: global forms and representation rings`.

Repair: cite the native `TauCeti.ContRepresentation.inner_characterLp_eq_finrank_contIntertwiningMap` (`RepresentationTheory/Compact/Intertwiner/Dimension.lean:145`) in place of the layer anchor.

## R06 (P3) — Padding in Suggested.lean

Location: `Suggested.lean`, throughout Layers 0–7 and the PBW, `CompactDivisionOctonion` and `PBWRees` sections.

Claim:
- 69 theorems are proved in place, 31 of them by a single native lemma (`weyl_character_formula`, `weyl_dimension_formula`, `kostant_multiplicity_formula`, …).
- There are 27 alias `abbrev`s and `def`s.
- Several declarations mirror README Checks.
- The auto-included `[IsAlgClosed K]` narrows `weyl_complete_reducibility` below README line 595.

Witness: one-tactic probes close these declarations. Examples: `sl2_hAction_eigenvalue_isInt := TauCeti.exists_int_of_hasEigenvalue t hμ`, and `hasCentralRadical_matrix := inferInstance` at line 2109. The file and the pins are unchanged since those probes.

Repair: delete these declarations from `Suggested.lean`. The README keeps them as cited native results or as Checks.

## R07 (P3) — The module docstrings describe an API catalogue, not the acceptance test

Location: `Suggested.lean:40–42`, "**This file is not the roadmap and is not exhaustive.** … The statements here suggest Lean forms for particular milestones". There is a second module docstring at line 2584, "# Integral type-A character precursor: suggested interfaces".

Claim: the docstring must list the headline theorems and name each one that is not statable, with the carrier it lacks.

Witness: no unstatable headline is named. Among them: the Layer 10 `Ω ≃ P∨/Q∨` theorem, the `E₆` and `E₇` models, and the compact Albert results.

Repair: write one docstring, "LieHighestWeight: target signatures". It lists the open headlines that remain after R04, names each one that is not statable with its missing carrier, and has no process wording.

## R08 (P3) — Gate `imports` / `mathlib-subimports`

Location: `Suggested.lean:2`, `import Mathlib.RingTheory.TensorProduct.Basic`.

Claim: the only imports allowed are `import Mathlib` and then the `TauCeti.*` modules the file uses.

Witness: gate `imports (1)` and `mathlib-subimports (1)` at f925965.

Repair: delete line 2. `import Mathlib` already covers it.

## R09 (P3) — Gate `build`: 31 warnings other than `sorry`

Location: `Suggested.lean`.
- Lines 350–1494: "automatically included section variable(s) unused", for `algClosedK`, `charZeroK` and `[IsTriangularizable K H L]`.
- Lines 370, 655, 735, 1556 and 1581: unused `hα` and `hlam`.

Claim: `sorry` must be the only warning.

Witness: my `lake env lean` run at f925965 gives 0 errors, 195 `sorry` warnings and 31 other warnings.

Repair: most of these declarations go under R06. In the rest, carry the needed binders explicitly and drop the unused hypotheses.

## R10 (P3) — Gate `statement-hygiene`: 11 hits

Location: `Suggested.lean`.
- `Nonempty` conclusions at lines 135, 832, 847, 1647, 1746, 1786, 2052, 2193, 2260 and 2272.
- `letI` in the signature of `weylAut_cartan_apply` (line 1194).

Claim: an equivalence statement names the canonical map and asserts it is bijective, or carries a `nonempty_*` name. A signature does not contain `letI`.

Witness: gate `statement-hygiene (11)` at f925965.

Repair:
- `serre_presentation_equiv` becomes `Function.Bijective (TauCeti.serreLift hS)`.
- The exceptional identifications follow R03.
- Delete the native ones (R04, R06).
- Delete `weylAut_cartan_apply`; it is native `TauCeti.weylAut_apply_of_lie_eq_smul` (`Sl2/Weyl/Automorphism.lean:220`).
- Rename any `Nonempty` statement that survives to `nonempty_*`.

## R11 (P3) — Gate `blob`: links pinned to a commit

Location: README lines 867, 1516 and 1799. Each is a `…/TauCetiRoadmap/blob/149fe79…/SchurWeyl/README.md#layer-7-…` link.

Claim: cite the roadmap and its section, not a commit.

Witness: gate `blob (3)`. On main, SchurWeyl line 580 is `## Layer 7: symmetric functions, the Frobenius characteristic, and RSK`, and `LRTableau` is at line 631.

Repair: link `[SchurWeyl Layer 7](../SchurWeyl/README.md#layer-7-symmetric-functions-the-frobenius-characteristic-and-rsk)`.

## R12 (P3) — Gate `prnum`

Location: README line 1258, "`_root_.Octonion R := CayleyDickson (Quaternion R)` design of [Mathlib PR41919](…/mathlib4/pull/41919)".

Claim: the README may contain no pull-request numbers.

Witness: gate `prnum (1)`.

Repair: state the convention itself: the Cayley–Dickson double of `Quaternion R`, with the displayed product. Drop the pull-request reference.

## R13 (P3) — Gate `private-paths`: a web page used as a source locator

Location: README line 1241, "[Baez's trace-power identity](…/octonions/node12.html)".

Claim: the scanner trips on the `home` segment of the URL. The real defect is a web page standing in for a locator.

Witness: BaezOctonions line 1479 (§3.4, p. 32) gives the cyclic determinant. Line 1481 gives the trace-power expression with coefficients 1/3, 1/2 and 1/6.

Repair: cite "Baez, *The Octonions*, Bull. AMS 39 (2002), §3.4, p. 32". The target itself is native, as `TauCeti.AlbertAlgebra.six_mul_det`.

## R14 (P3) — The README is not in house shape

Location: README headings at lines 75, 169, 263 and 313, and the layers at lines 319–1623.

Claim: the README has none of the following:
- `**Summary.**`
- `## Scope and ownership`
- `## Conventions`
- `## Exact supplier contracts`
- `## How to read the build`
- `## Layer k` headings with `### k.n` subsections
- `## Downstream consumers`

Its layers are `###` headings, and Layer 10 comes after "Worked examples".

Witness: at f925965 the README has 0 `**Checks.**`, 0 `### Examples`, 0 `### Dependencies` and 0 `*Needs:*` lines.

Repair: restructure into the house shape.
- Every definition keeps its API list and at least three Checks. The sl₂ `Ω`, A₂-dimension and gl₂-Casimir worked examples are ready-made Checks.
- Every target gets a `*Needs:*` line.
- Every layer ends with `### Examples` and `### Dependencies`.

## R15 (P3) — Claims carry no locators, and the precursor cites an unnamed source

Location:
- README lines 608–770, which refer to "the source's decomposition procedure" and "the source's strict inequality".
- The Weyl, Kostant, Freudenthal, Harish-Chandra, Serre and PBW statements, which have no theorem or page.

Claim: every theorem needs a locator at the claim, and every source must be named.

Witness: there are only two locators. Stacks 02ML is at line 1038. "Etingof §§10.1,13.3,14.1" at line 1123 gives sections but no theorem or page. The precursor's source is named nowhere in References.

Repair:
- Name the precursor's source and give a theorem and page at each claim.
- At line 1123, cite Etingof (arXiv 2401.01446v2) Thm 10.1, p. 51 (EtingofRepresentationsLieGroups line 2153) and Thm 14.1, pp. 70–71 (line 3041).
- Add section numbers for the classical results.

## R16 (P3) — Stale citation ids and names

Location:
- README line 875, "TensorProductCombinatorics H1.6" (anchor `#h16-…`), and line 922, "H2.6".
- Lines 1356 and 1407, "TangentialBordism B3".
- Line 982, `TauCeti.SymmetricAlgebra.adjointDerivation`.
- Line 1780, which attributes `equivOfCartanMatrixEq` to RootSystems.

Claim: none of these ids or names exists where it is cited.

Witness:
- TensorProductCombinatorics on main: the headings are `### 1.6` (line 694) and `### 2.6` (line 1191).
- TangentialBordism at its open head: `### 9.1 … (B3.6)` is at line 2433 and `### 9.2` at line 2492.
- `adjointDerivation` occurs nowhere at the pin.
- The Cartan-matrix equivalence is in Mathlib, at `CartanMatrix.lean:362`.

Repair:
- Cite "TensorProductCombinatorics §1.6, §2.6" and "TangentialBordism §9.1–9.2" with working anchors.
- Use `TauCeti.lieModuleDerivation` (`SymmetricAlgebra/LieModule.lean:89`).
- Attribute `RootPairing.Base.equivOfCartanMatrixEq` to Mathlib.

## R17 (P3) — The README backticks names of its own that Suggested.lean does not declare

Location:
- README line 300: "`Suggested.lean` pins the load-bearing objects (`Sl2Irrep`/…".
- Lines 1333–1398: `compactAlbertAlgebra`, `compactAlbertDerivation_complexification`, `compactAlbertDerivation_killing_negDef` and further `compactAlbert*` and `*ComplexificationIso` names.

Claim: a backticked name of this roadmap's own claims that `Suggested.lean` declares it.

Witness: none of these 10 names occurs in `Suggested.lean`. TangentialBordism, at its open head, consumes three of them by name: `README.md:323`, `2443` and `2509–2510`.

Repair: do one of the following, and in either case delete the claim at line 300:
- declare the compact Albert carrier with a real body and state the consumed theorems on it, or
- write these as prose targets without backticks.

## R18 (P3) — Process wording, and a misnamed lemma

Location:
- README lines 1850–1852, after References: "**Prototype carrier and chart boundary.** The LHW prototype uses a distinct pair-record carrier…".
- README line 623: "These inputs commission the following construction".
- README line 1649.
- `Suggested.lean:1609`, `exists_chevalleySystem`.

Claim:
- The paragraph after References describes other files and uses names defined nowhere.
- `exists_chevalleySystem` asserts only nonzero root vectors with `⁅e_α, f_α⁆ = h_α`. That is not a Chevalley system, which also fixes structure constants.

Witness: the lines are quoted above. The lemma's conclusion consists only of root-space membership, non-vanishing and bracket conditions.

Repair:
- Delete the paragraph after References.
- Rewrite lines 623 and 1649 timelessly.
- Rename the lemma `exists_rootVectors_lie_eq_coroot`, or delete it in favour of Mathlib's `exists_isSl2Triple_of_weight_isNonZero`.

## R19 (P3) — Layer 10's compact-centre application has no owner

Location: README line 1726, "#### Late compact-center application in LieGroups", through line 1746, "`Z(G) ≃ P∨/Y`".

Claim: this subsection plans group-level targets and labels them as a LieGroups application. LieGroups does not own them.

Witness: `P∨/Y` occurs 0 times in LieGroups' README on main.

Repair: either make this a target of this roadmap, with `*Needs:*` LieGroups Layers 4, 6 and 7, or cut it and name it as a LieGroups Part II item.

## R20 (P3) — A conflicting open pull request, with no stated order

Location: `Suggested.lean`. This pull request and the open revision "LieHighestWeight: tensor strings, reductive centers and opposition" both change it.

Claim: the two heads conflict, and no description says which one is rebased on the other.

Witness: `scratch/overlaps.md` at f925965 reports the conflict in `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/Suggested.lean`. This pull request's description does not mention that revision.

Repair: state the order in the description, for example "this fold is rebased onto that revision after it merges".

## Previous findings

- R01 — not repaired: `Suggested.lean:1673` still reads `def Octonion : Type → Type := sorry`; gate `sorry-data=47`.
- R02 — not repaired: `Suggested.lean:1943` `right_alternative … : y * x * x = (y * x) * x := sorry`; `rfl` still closes it.
- R03 — not repaired: lines 1673–1797 and 2144–2318 still state the headlines on `sorry` stand-ins.
- R04 — not repaired: README lines 319, 1066, 1223, 1237, 1469 and 1491 still plan native results as open targets.
- R05 — not repaired: README line 915 still cites `#layer-6-characters-of-compact-groups`; the open CompactGroups head still renames Layer 6 (line 721).
- R06 — not repaired: one-line native aliases are unchanged (`weyl_character_formula`; `hasCentralRadical_matrix`, line 2109).
- R07 — not repaired: `Suggested.lean:40` "**This file is not the roadmap and is not exhaustive.**"; second docstring at line 2584.
- R08 — not repaired: `Suggested.lean:2` `import Mathlib.RingTheory.TensorProduct.Basic`.
- R09 — not repaired: still 31 warnings other than `sorry`, at lines 350–1581.
- R10 — not repaired: the same 11 `statement-hygiene` hits; `letI : LieAlgebra ℚ L := TauCeti.ratLieAlgebra K L` at line 1194.
- R11 — not repaired: README lines 867, 1516 and 1799 keep `blob/149fe79…` links.
- R12 — not repaired: README line 1258 "design of [Mathlib PR41919]".
- R13 — not repaired: README line 1241 "[Baez's trace-power identity](…/octonions/node12.html)".
- R14 — not repaired: 0 `**Checks.**`, 0 `*Needs:*`; top-level headings are still "Standing conventions", "What Mathlib already has (consume)", ….
- R15 — not repaired: README line 1123 "[Etingof §§10.1,13.3,14.1]" still has no theorem or page; the precursor's source is still unnamed.
- R16 — not repaired: README line 875 "[TensorProductCombinatorics H1.6](…#h16-…)"; line 982 `TauCeti.SymmetricAlgebra.adjointDerivation`.
- R17 — not repaired: README line 300 "`Suggested.lean` pins the load-bearing objects (`Sl2Irrep`/…"; the `compactAlbert*` names are still undeclared.
- R18 — not repaired: README line 1850 "**Prototype carrier and chart boundary.** The LHW prototype uses a distinct pair-record carrier…".
- R19 — not repaired: README line 1726 "#### Late compact-center application in LieGroups".
- R20 — not repaired: the description still states no order against the conflicting LieHighestWeight revision.

## Verified sound

**Scope of the change.**
- `git diff a285fd7 f925965 -- TauCetiRoadmap/RepresentationTheory/` is empty. That covers the folder and the family index.
- Against main, the folder differs only by the earlier fold of `TypeAHaarTargets.lean` into `Suggested.lean` (164+/159−). The README is byte-identical to main's.
- `lake-manifest.json` is unchanged since a285fd7. Its pins are Tau Ceti `2fd255d997` and Mathlib `1b1ccf4b08`.
- The outside-folder `diff --stat` command lists nothing.
- The commits since a285fd7 change AlgebraicTopology README and Lean, IntegralLattices `Suggested.lean` (the Layer 3G Hilbert-reciprocity example, 20 lines) and QuadraticFormInvariants README and Lean.
- `grep` finds no mention of LieHighestWeight in those three folders, and no mention of AlgebraicTopology, GeometricTopology, IntegralLattices, QuadraticFormInvariants or ReductiveGroups in this folder.
- The changed roadmaps state no octonion, Albert, highest-weight, Casimir, Harish-Chandra or alcove object. IntegralLattices' root lattices are Gram matrices, a different carrier from this roadmap's root data. The change therefore makes no text of this roadmap wrong, and it creates no new shared owner.

**Gate and build.**
- I read the worker's gate at f925965 as data: `sorry-data=47`, `blob=3`, `prnum=1`, `private-paths=1`, `imports=1`, `mathlib-subimports=1`, `statement-hygiene=11`, `build=31`, FAIL. Every failing rule is a finding above: R01 and R08–R13.
- My own run of `lake env lean` on `Suggested.lean` at f925965 took 2 min 3 s. It gave 0 errors, 195 `sorry` warnings and 31 other warnings (26 unused-section-variable and 5 unused-variable).
- Scratch probe, a copy of `Suggested.lean` with two Tau Ceti imports added:
  - Line 1943 closed by `rfl`, with no message.
  - The repaired `(y * x) * x = y * (x * x)` elaborates with `sorry`.
  - `#check @TauCeti.Octonion.g₂ToDerivationLieAlgebra` gives `LieAlgebra.g₂ R →ₗ⁅R⁆ ↥(TauCeti.derivationLieAlgebra R (TauCeti.Octonion R))`.
  - Both R03 repair statements elaborate.
  - The probe had 0 errors and 228 warnings: 226, minus 1 for the `rfl`, plus 3 new `sorry`.
- `git status` in the worktree is clean.
- Elaborated signatures: the folder is unchanged, so the previous comparison of `scratch/signatures.md` (360 declarations, 161 flagged) with the README stands.
  - The dropped `[IsTriangularizable K H L]` binders are supplied by a native instance.
  - The auto-included `[IsAlgClosed K]` narrows `weyl_complete_reducibility` (R06).
  - The two "elaboration errors" in `signatures.md` (lines 2965 and 3040, `…CompactDivisionOctonion.is`, `…LieHighestWeight.that`) come from the signature tool reading docstring words. My elaboration has 0 errors.

**Dependency check** at f925965:

    depcheck: 238 roadmaps, 2350 edges, 0 problem(s)

LieHighestWeight is on main and is not listed in `ORDER.txt`. Its suppliers TensorProductCombinatorics, CompactGroups, SchurWeyl and LieGroups are on main.

**Adversarial table.** No statement changed. These rows carry forward from the previous report (r21, which carried them from r20 at 11a9ca1, where the values were computed). Rows marked † were recomputed at f925965.

| Statement | Instances | Values (left / right) | Result | From |
|---|---|---|---|---|
| Weyl character formula | sl₂, λ=ω; λ=0 | `(e^ω+e^{−ω})(1−e^{−2ω}) = e^ω−e^{−3ω}` / `e^{2ω−ω} − e^{−2ω−ω} = e^ω−e^{−3ω}`; `1−e^{−α}` / `1−e^{−α}` | holds; native `Weyl/Character.lean:324` | r21 |
| Weyl dimension formula | sl₂ λ=nω; A₂ at ω₁, ω₂, ω₁+ω₂, 2ω₁, 3ω₁ | `n+1` / `n+1`; `(a+1)(b+1)(a+b+2)/2` = 3, 3, 8, 6, 10 / README 3, 3, 8, 6, 10 | holds | r21 |
| Kostant multiplicity | sl₂ λ=n, μ=n−2k; k=n+1 | `1−0` / 1; `1−P(0)=0` / 0 | holds | r21 |
| Freudenthal | sl₂ V(1), μ=−ω | `4⟨ω,ω⟩·m` / `4⟨ω,ω⟩` ⇒ m=1 | holds | r21 |
| Tits sign | sl₂ V(1); V(2) | −1 / alternating; +1 / symmetric | holds | r21 |
| `minuscule_pieri` | sl₂ λ=0, μ=ν=ω | 1 / 1 | holds; native (R04) | r21 |
| Casimir, sl₂ `Ω=h²+2h+4fe` | κ(h,h)=8, κ(e,f)=4 | `(h²+2h+4fe)/8` / `Ω/8` | holds | r21 |
| HC images, sl₂ | t=λ(h) | `(t−1)²+2(t−1) = t²−1` / README `t²−1`; shift `f_b(λ+ρ)` / EtingofRepresentationsLieGroups line 3049 | holds | r21 |
| Chevalley restriction | degree 0; Etingof v2 Thm 10.1 (line 2153, p. 51) | `tr(id)=dim M` / `Σ mult = dim M`; `C[g]^g → C[h]^W` / README same | holds | r21 |
| Serre transpose convention | `cartanMatrixIn i j = α_i(α_j^∨)` | needs `α_j(h_i)` / `(cartanMatrix)ᵀ i j = α_j(h_i)` | holds | r21 |
| `sl2_finrank_of_hasPrimitiveVector` | sl₃ adjoint, α₁-triple | 2 claimed / 8 | restricted irreducibility needed (stated) | r21 |
| gl_n Casimir scalar | gl₂ | `μ₀(μ₀+1)+μ₁(μ₁−1)` / README same | holds | r21 |
| Staircase separation | ν_t=N−½−t | `4(t−s)` / `4(t−s)` | holds | r21 |
| CAR example | `ΣF_ii` | `N²/2` / `N²/2`; `2^{N(N+1)/2}` / same | holds | r21 |
| `hasCentralRadical_iff_…` | L=0; sl₂⋉K²; gl₁ Jordan | both true; both false | holds | r21 |
| `gl_dual_standard_pieri` | n=1; n=0; μ=(½,½) | 1 summand; 0 / empty; dim 2 / 2 | holds; native | r21 |
| `score_eq_gap_sum` | n=2, x=(x₀,x₁), λ=(l₀,l₁) | `(S/2)(x₀+x₁) + (x₀ − (x₀+x₁)/2)(l₀−l₁) = x₀l₀+x₁l₁` / `x·λ` | holds | r21 |
| Non-injectivity | x=(3,2,1); (1,1,−2), (2,−1,−1) | `3+2−2 = 3` / `6−2−1 = 3` | holds (README line 659) | r21 |
| `finite_dominant_score_sublevel` | x=(1,1) | score ≡ S / infinite set | `StrictAnti` needed | r21 |
| `staircase_alternant` | n=2; n=0 | `t₀−t₁` / `t₀(1−t₁/t₀)`; 1 / 1 | holds | r21 |
| top coefficient | n=2, l=0; n=1 | 2 / 2!; 1 / 1 | holds | r21 |
| Haar norm | λ+ρ strictly decreasing | `(1/n!)·n!` / 1 | holds | r21 |
| Type-A branching | GL₂→GL₁×GL₁, λ=(1,0) | μ₁∈{0,1} / weights (1,0), (0,1) | holds | r21 |
| Stable tensor range | ≥ vs > | inverted gap ≤ −1 / contradiction | holds | r21 |
| Division octonion product and norm | x=(i,0), y=(0,1) | `xy=(0,i)`, N=1 / 1 | holds | r21 |
| Cross-product identities | u=i, v=j, w=j | `i×k=−j` / `−j`; associator `−i` / `−i` | holds | r21 |
| `right_alternative` † | any `NonAssocRing` | `(y*x)*x` / `(y*x)*x` | **vacuous**: `rfl` closes it at f925965 | R02 |
| Complex scalar extension † | ℂ⊗Der_ℝ 𝕆_div vs Der 𝕆_ℂ | 14 / native 14 (`Octonion/Derivation.lean:958`, statement `= 14` at line 959) | holds | r21, line re-read |
| Albert determinant | Baez §3.4 vs native | `⅓tr a³ − ½tr a² tr a + ⅙(tr a)³` (BaezOctonions line 1481) / `six_mul_det` | holds | r21 |
| Isotypic toolkit example | (V(1)⊗V(1))⊕V(0) | `3+0+2 = 5` / `4+1` | holds | r21 |

**Library declarations re-opened at the pins (file:line).** 21 declarations, plus one confirmed absent:
- Octonions:
  - `TauCeti.Octonion` (`Algebra/Octonion/Basic.lean:143`)
  - `TauCeti.Octonion.right_alternative` (`:684`)
  - `Octonion.finrank_derivationLieAlgebra` (`Octonion/Derivation.lean:958`)
  - `Octonion.g₂ToDerivationLieAlgebra` (`Octonion/Serre.lean`, elaborated)
- Albert algebra:
  - `AlbertAlgebra.finrank_derivationLieAlgebra` (`AlbertAlgebra/Derivation/Finrank.lean:384`)
  - `AlbertAlgebra.six_mul_det` (`AlbertAlgebra/Determinant.lean:310`)
- Highest-weight theory:
  - `nonempty_lieModuleEquiv_directSum_irreducibleQuotient` (`HighestWeight/Decomposition.lean:168`)
  - `lieChevalleyRestrictionIso` (`HighestWeight/ChevalleyRestriction.lean:151`)
  - `harishChandraIso` and `vermaCentralCharacter_eq_iff` (`CentralCharacter/Isomorphism.lean:106`, `:159`)
  - `minuscule_pieri` (`HighestWeight/Pieri.lean:154`)
- sl₂:
  - `exists_int_of_hasEigenvalue` (`Sl2/Spectrum.lean:151`)
  - `weylAut_apply_of_lie_eq_smul` (`Sl2/Weyl/Automorphism.lean:220`)
- gl_n:
  - `glIrreducible` (`GeneralLinear/Carrier.lean:204`)
  - `gl_dual_standard_pieri` (`GeneralLinear/Pieri.lean:388`)
- Other Tau Ceti:
  - `lieModuleDerivation` (`SymmetricAlgebra/LieModule.lean:89`)
  - `ContRepresentation.inner_characterLp_eq_finrank_contIntertwiningMap` (`Compact/Intertwiner/Dimension.lean:145`)
- Mathlib:
  - `RootPairing.Base.equivOfCartanMatrixEq` (`LinearAlgebra/RootSystem/CartanMatrix.lean:362`)
- Confirmed absent at the pin: `adjointDerivation`.

**Cross-roadmap citations re-resolved at this round.**
- CompactGroups Layer 6: on main, line 369. At the open head, line 721 renames the layer (R05).
- TensorProductCombinatorics on main: `### 1.6` at line 694 and `### 2.6` at line 1191 (R16).
- TangentialBordism at its open head:
  - §9.1 at line 2433 and §9.2 at line 2492 (R16).
  - It consumes the `compactAlbert*` names at lines 323, 2443 and 2509–2510 (R17).
- SchurWeyl on main: Layer 7 at line 580, `LRTableau` at line 631 (R11).
- LieGroups on main: `P∨/Y` is absent (R19).

**Ownership against open pull requests.**
- `scratch/overlaps.md` at f925965 lists two items: the conflicting LieHighestWeight revision (R20) and the CompactGroups drop (R05).
- It lists no id that only an open revision defines and no id this pull request drops.
- The closest open roadmaps are ClassicalGroups, SpinRepresentations, ExceptionalThetaCorrespondencesForG2, ReductiveGroups and RootSystemsPartII. They are unchanged since a285fd7 except ReductiveGroups, whose last change, 11a9ca1, is older than the previous review. None of them owns this roadmap's objects a second time.

**Leads in `scratch/citations.md`.** Both are confirmed and covered by R16: TensorProductCombinatorics H1.6, and `adjointDerivation`.

**Remarks on untouched text** (no change requested in this incremental round): none beyond the restated findings.

## Not verifiable

- The seeded-sample targets fall in no changed passage, because nothing in the folder changed. Their README locations:
  - "Weyl character formula": lines 24, 275, 813
  - "Integral weights, finite induction and virtual characters": line 637
  - "Polynomiality before character identification": line 676
  - "Haar norm and identification": line 711
  - "Type-A coefficient and branching applications": line 738
  - "The positive division-octonion algebra and its invariant tensors": line 1287
  - "Complex scalar-extension boundary": line 1319
  - "Prototype carrier and chart boundary": line 1850, which is R18

  A `grep` of these sections finds no theorem, page or section locator, so there is nothing to check against a text (R15). Their mathematics is in the adversarial table. The README flags no locator as unverified.
- The precursor's unnamed "source" (lines 608–770) cannot be looked up (R15).
- Humphreys GTM 9 (settled as uncertified), Fulton–Harris, Bourbaki Lie VII–VIII, Jacobson, Schafer, Goodman–Wallach, Dixmier and Molev: there is no open legal copy, and the README cites them only by chapter.

## Source issues

- none
