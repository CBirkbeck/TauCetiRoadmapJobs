# Review of LieHighestWeight (pull request #1797 at a285fd7)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`

**Verdict:** needs changes

This is an incremental re-review. The previous review read 11a9ca1. Since then, `TauCetiRoadmap/RepresentationTheory/` has 0 changed lines: `git diff 11a9ca1 a285fd7 -- TauCetiRoadmap/RepresentationTheory/` is empty. The Mathlib and Tau Ceti pins are also unchanged (Tau Ceti `2fd255d99`, Mathlib `1b1ccf4b08`, the same as main). The only commit since then rewrites `TauCetiRoadmap/AlgebraicTopology/`. Neither roadmap cites the other.

None of the 20 previous findings is repaired, so each is restated below with its line numbers and witnesses re-checked at this head. Witnesses that moved in other roadmaps are updated (R15, R16, R17). R15 also corrects the previous report's Etingof line numbers, which came from a different arXiv version than the one cached. The gate still fails, with the same counts as before.

## R01 (P1) — 47 declarations carry sorry'd data

Location: `Suggested.lean` lines 227, 306, 313, 315, 928, 1046, 1057, 1067, 1310, 1355, 1379, 1439, 1673–1679, 1685, 1689, 1703, 1753–1760, 1769, 1773, 1871, 1890, 1892, 1995, 1999, 2017, 2026, 2144, 2149, 2153, 2201–2208, 2302, 2427–2443. Example: line 1673 `def Octonion : Type → Type := sorry`.

Claim: no `def`, `abbrev`, `instance` or `opaque` may have `sorry` in its body, and nothing may mention one. Several declarations with real bodies are built on these: `hcProjectionLinear`, `harishChandraLinearIso`, `highestWeightTracePowerRestriction`, `pbwSymmetrizationCenter` and `derivationLieAlgebra K (Octonion K)`.

Witness: gate `sorry-data (47)` at a285fd7. Line 1673 is byte-identical to 11a9ca1. Native `TauCeti.Octonion` exists at `TauCeti/Algebra/Octonion/Basic.lean:143`, and native `TauCeti.glIrreducible` at `GeneralLinear/Carrier.lean:204`.

Repair:
- **Native carrier exists.** Delete the local stand-in and use the native one: `TauCeti.Octonion`, `TauCeti.AlbertAlgebra`, `TauCeti.diagonalCartan`, `TauCeti.glWeightEquiv`, `TauCeti.glIrreducible`, `TauCeti.glCasimir`, `TauCeti.lieChevalleyRestrictionIso` (`HighestWeight/ChevalleyRestriction.lean:151`) and `TauCeti.harishChandraIso` (`CentralCharacter/Isomorphism.lean:106`).
- **Real body is easy.** Give it one:
  - `slTwoDiagonalCartan` is the `LieSubalgebra.lieSpan` of the diagonal `h`.
  - `weightTranslation μ` is `SymmetricAlgebra.lift` of `x ↦ ι x + algebraMap (μ x)`.
  - Prove the `NonAssocRing DivisionOctonionReal` law fields, the scalar-tower instances and the trace-zero memberships.
- **Heavy, and no headline needs it.** Delete it from the Lean and keep it as a README target with its signature: `basisPbwGraded`, `centerPBWGraded*`, `pbwSymmetrization`, `tracePowerPolynomial` and the Layer 10 alcove data.

## R02 (P1) — `right_alternative` is a tautology

Location: `Suggested.lean:1943`, `theorem right_alternative (x y : DivisionOctonionReal) : y * x * x = (y * x) * x := sorry`.

Claim: `y * x * x` parses as `(y * x) * x`, so the statement is `a = a`. The right alternative law is never asserted for the division octonions.

Witness: I re-ran the probe at this head. Replacing this `sorry` with `rfl` in a scratch copy elaborates with 0 errors and 194 `sorry` warnings instead of 195; line 1943 produces no message.

Repair: state `(y * x) * x = y * (x * x)`. This matches native `TauCeti.Octonion.right_alternative` (`Octonion/Basic.lean:684`, `x * y * y = x * (y * y)`).

## R03 (P2) — Layer 8 and Layer 9 headlines are stated on sorry'd stand-ins although native carriers exist

Location: `Suggested.lean:1673–1797` and `2144–2318`. Examples: `finrank_derivationOctonion`, `derivationOctonion_equiv_g2`, `derivationAlbert_equiv_f4`, `gl_dual_standard_pieri`, `glCasimir_smul_of_isGlHighestWeightVector`.

Claim: a theorem about `Octonion K` with `Octonion := sorry` is about an unspecified type. These headlines are forced through stand-ins, and the stand-in also narrows the scalars to `K : Type`.

Witness: all of these are native at the pin:
- `Octonion.finrank_derivationLieAlgebra` (`Octonion/Derivation.lean:959`: `finrank R (derivationLieAlgebra R (Octonion R)) = 14`)
- `AlbertAlgebra.finrank_derivationLieAlgebra` (`AlbertAlgebra/Derivation/Finrank.lean:384`)
- `gl_dual_standard_pieri` (`GeneralLinear/Pieri.lean:388`)

Repair: delete the stand-ins and the statements the pin already proves. Keep only the open halves, stated on the native carriers:
- `Function.Injective (TauCeti.Octonion.g₂ToDerivationLieAlgebra (R := K))`
- `Nonempty (TauCeti.derivationLieAlgebra K (TauCeti.AlbertAlgebra K) ≃ₗ⁅K⁆ LieAlgebra.f₄ (R := K))`, named `nonempty_*`

Use `K : Type*`, `[Field K] [CharZero K]`. Both forms elaborated with `sorry` in the previous round at the same pins.

## R04 (P2) — The README plans, as open targets, results the pinned Tau Ceti already proves

Location (README):
- line 319, Layer 0 sl₂ classification
- line 1066, "Export `lieChevalleyRestrictionIso`…"
- line 1223, "prove `finrank = 14`…"
- line 1237, "build `TauCeti.AlbertAlgebra.det`"
- line 1469, `glIrreducible` "named"
- line 1491, `glCasimir`
- the Layer 6 Pieri, isotypic and orbit-sum targets

Claim: what exists at the pins is cited in the supplier contracts, not planned again. As written, the scope claims open work that is finished.

Witness: all at the pin:
- `TauCeti.minuscule_pieri` (`HighestWeight/Pieri.lean:154`), which is identical to `Suggested.lean:888`
- `nonempty_lieModuleEquiv_directSum_irreducibleQuotient` (`Decomposition.lean:168`)
- `vermaCentralCharacter_eq_iff` (`Isomorphism.lean:159`)
- `exists_int_of_hasEigenvalue` (`Sl2/Spectrum.lean:151`)
- `lieModuleDerivation` (`SymmetricAlgebra/LieModule.lean:89`)

Repair: list each native result under `From Tau Ceti` with its exact name and file, and delete the corresponding construction targets. The open targets that remain are:
- the universe generalisation of Harish-Chandra
- `serreLift_injective_of_base`
- the two Layer 8 identifications (R03)
- `finrank` of `e₆` and `e₇`
- Cartan conjugacy
- the PBW symmetrisation and Rees results
- the compact real-form lane
- Layer 10

## R05 (P2) — A supplier citation that an open pull request drops

Location: README line 915, "[CompactGroups Layer6](../CompactGroups/README.md#layer-6-characters-of-compact-groups)'s actual compact-group character orthogonality gives its squared group-Haar norm".

Claim: the citation breaks when the open CompactGroups revision merges.

Witness: on main, CompactGroups line 369 is `### Layer 6: characters of compact groups`. At the head of the open CompactGroups revision, line 721 is `## Layer 6: global forms and representation rings`, and line 765 lists character orthogonality as native.

Repair: cite the native `TauCeti.ContRepresentation.inner_characterLp_eq_finrank_contIntertwiningMap` (`TauCeti/RepresentationTheory/Compact/Intertwiner/Dimension.lean:145`, present at the pin) instead of the CompactGroups layer anchor.

## R06 (P3) — Padding in Suggested.lean

Location: Suggested.lean, throughout Layers 0–7 and the PBW, `CompactDivisionOctonion` and `PBWRees` sections.

Claim: there are 69 theorems proved in place, 31 of them by one native lemma (`weyl_character_formula`, `weyl_dimension_formula`, `kostant_multiplicity_formula`, …). There are 27 alias `abbrev`/`def`s, and several declarations mirror Checks. The auto-included `[IsAlgClosed K]` also narrows `weyl_complete_reducibility` below the README (line 595).

Witness: the previous round's one-tactic probe closed seven declarations, for example `sl2_hAction_eigenvalue_isInt := TauCeti.exists_int_of_hasEigenvalue t hμ` and `hasCentralRadical_matrix := inferInstance` (line 2109). The file and the pins are unchanged.

Repair: delete these declarations from Suggested.lean. The README keeps the statements as cited native results or as Checks.

## R07 (P3) — Module docstrings describe an API catalogue, not the acceptance test

Location: `Suggested.lean:38–43`, "**This file is not the roadmap and is not exhaustive.** … The statements here suggest Lean forms for particular milestones". A second module docstring at line 2584 reads "This section is not the roadmap and is not exhaustive".

Claim: the docstring must name the headline theorems and, for each one that is not statable, say which carrier is missing.

Witness: no unstatable headline is named. Examples that need naming: the Layer 10 `Ω ≃ P∨/Q∨` theorem, the `E₆`/`E₇` models and the compact Albert results. Lines 38–43 and 2584 are quoted above.

Repair: write one docstring, "LieHighestWeight: target signatures". It lists the open headlines that remain after R04, names each unstatable headline with the carrier it lacks, and contains no process wording.

## R08 (P3) — Gate `imports` / `mathlib-subimports`

Location: `Suggested.lean:2`, `import Mathlib.RingTheory.TensorProduct.Basic`.

Claim: the file may import only `import Mathlib` followed by the `TauCeti.*` modules it uses.

Witness: gate `imports (1)` and `mathlib-subimports (1)` at a285fd7.

Repair: delete line 2. It is redundant under `import Mathlib`.

## R09 (P3) — Gate `build`: 31 warnings other than `sorry`

Location: `Suggested.lean` lines 350–1494 ("automatically included section variable(s) unused" for `algClosedK`, `charZeroK` and `[IsTriangularizable K H L]`) and lines 370, 655, 735, 1556, 1581 (unused `hα` and `hlam`).

Claim: `sorry` must be the only warning.

Witness: my `lake env lean` run at this head gives 0 errors, 195 `sorry` warnings and 31 other warnings, the same counts as the gate.

Repair: most of these declarations disappear under R06. In the rest, carry the needed binders explicitly and drop the unused hypotheses.

## R10 (P3) — Gate `statement-hygiene`: 11 hits

Location: `Suggested.lean`:
- `Nonempty` conclusions at lines 135, 832, 847, 1647, 1746, 1786, 2052, 2193, 2260, 2272
- `letI` in the signature of `weylAut_cartan_apply` at line 1194

Claim: an equivalence statement names the canonical map and asserts that it is bijective, or carries a `nonempty_*` name. A signature may not contain `letI`.

Witness: gate `statement-hygiene (11)` at a285fd7.

Repair:
- `serre_presentation_equiv` becomes `Function.Bijective (TauCeti.serreLift hS)`.
- Rewrite the exceptional identifications as in R03.
- Delete the native ones (R04, R06).
- Delete `weylAut_cartan_apply`; it is native `TauCeti.weylAut_apply_of_lie_eq_smul`.
- Rename any `Nonempty` statement that survives to `nonempty_*`.

## R11 (P3) — Gate `blob`: links pinned to a commit

Location: README lines 867, 1516 and 1799, each a `…/TauCetiRoadmap/blob/149fe79…/SchurWeyl/README.md#layer-7-…` link.

Claim: cite the roadmap and its section, not a commit.

Witness: gate `blob (3)`. On main, SchurWeyl line 580 is `## Layer 7: symmetric functions, the Frobenius characteristic, and RSK`, and `LRTableau` is at line 631.

Repair: `[SchurWeyl Layer 7](../SchurWeyl/README.md#layer-7-symmetric-functions-the-frobenius-characteristic-and-rsk)`.

## R12 (P3) — Gate `prnum`

Location: README line 1258, "`_root_.Octonion R := CayleyDickson (Quaternion R)` design of [Mathlib PR41919](…/mathlib4/pull/41919)".

Claim: no pull-request numbers.

Witness: gate `prnum (1)`.

Repair: state the convention itself, the Cayley–Dickson double of `Quaternion R` with the displayed product, without the pull-request reference.

## R13 (P3) — Gate `private-paths`: a web page in place of a source locator

Location: README line 1241, "[Baez's trace-power identity](…/octonions/node12.html)".

Claim: the scanner trips on the `home` segment of the URL. The underlying defect is a web page used as a locator.

Witness: BaezOctonions line 1479 (§3.4, p. 32) gives the cyclic determinant, and line 1481 gives the trace-power expression with coefficients 1/3, 1/2 and 1/6.

Repair: cite "Baez, *The Octonions*, Bull. AMS 39 (2002), §3.4, p. 32". Note that the target is native: `TauCeti.AlbertAlgebra.six_mul_det` (`AlbertAlgebra/Determinant.lean:310`).

## R14 (P3) — The README is not in house shape

Location: README headings at lines 75, 169, 263, 313 and 319–1623.

Claim: the README lacks `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `## Layer k` with `### k.n` subsections, and `## Downstream consumers`. Its layers are `###` headings. Layer 10 follows "Worked examples", and a paragraph follows References.

Witness: at this head, the README contains 0 `**Checks.**`, 0 `### Examples`, 0 `### Dependencies` and 0 `*Needs:*` lines.

Repair: restructure into the house shape:
- Each definition keeps its API list and at least three Checks. The sl₂ `Ω`, A₂-dimension and gl₂-Casimir worked examples are ready-made Checks.
- Each target gets a `*Needs:*` line.
- Each layer ends with `### Examples` and `### Dependencies`.

## R15 (P3) — Claims carry no locators, and the precursor cites an unnamed source

Location: README lines 608–770 ("the source's decomposition procedure", "the source's right-trivialized Jacobian", "the source's strict inequality"). The Weyl, Kostant, Freudenthal, Harish-Chandra, Serre and PBW statements have no theorem or page locator.

Claim: every theorem needs its locator at the claim, and every source must be named.

Witness: the only locators are Stacks 02ML (line 1038) and "Etingof §§10.1,13.3,14.1" (line 1123), which gives sections but no theorem or page. The precursor's "source" is never named in References.

Repair:
- Name the precursor's source (author, title, version) and cite its theorem and page at each claim.
- At line 1123, cite Etingof (arXiv 2401.01446v2, the version linked) Thm 10.1, p. 51 (EtingofRepresentationsLieGroups line 2153), and Thm 14.1, pp. 70–71 (line 3041).
- Add section numbers for the classical results.

## R16 (P3) — Stale citation ids and names

Location:
- line 875 "TensorProductCombinatorics H1.6" (anchor `#h16-…`) and line 922 "H2.6"
- lines 1356 and 1407 "TangentialBordism B3" (anchor `#b3-low-groups-…`)
- line 982 `TauCeti.SymmetricAlgebra.adjointDerivation`
- line 1780, which attributes `equivOfCartanMatrixEq` to RootSystems

Claim: these ids and names do not exist where they are cited.

Witness:
- **TensorProductCombinatorics.** On main the headings are `### 1.6` (line 694) and `### 2.6` (line 1191).
- **TangentialBordism.** The open head has `### 9.1 … (B3.6)` (line 2416) and `### 9.2` (line 2475).
- **Symmetric-algebra derivation.** `adjointDerivation` occurs 0 times at the pin.
- **Cartan-matrix equivalence.** It is in Mathlib, at `CartanMatrix.lean:362`.

Repair: cite "TensorProductCombinatorics §1.6, §2.6" and "TangentialBordism §9.1–9.2" with working anchors, use `TauCeti.lieModuleDerivation`, and attribute `RootPairing.Base.equivOfCartanMatrixEq` to Mathlib.

## R17 (P3) — The README backticks names of its own that Suggested.lean does not declare

Location: README line 300 ("`Suggested.lean` pins the load-bearing objects (`Sl2Irrep`/…") and lines 1333–1398. These name `compactAlbertAlgebra`, `compactAlbertDerivation_complexification`, `compactAlbertDerivation_killing_negDef` and five more `compactAlbert*`/`*ComplexificationIso` names.

Claim: a backticked name of this roadmap's own is a claim that Suggested.lean declares it.

Witness: all 10 names occur 0 times in Suggested.lean. TangentialBordism (open head, `README.md:2426`, `2492–2493`) consumes `compactAlbertAlgebra`, `compactAlbertDerivation_complexification` and `compactAlbertDerivation_killing_negDef` by name.

Repair: either declare the compact Albert carrier with a real body and state the consumed theorems on it, or write these as prose targets without backticks. In both cases delete the claim at line 300.

## R18 (P3) — Process wording and a misnamed lemma

Location:
- README lines 1850–1852 (after References): "**Prototype carrier and chart boundary.** The LHW prototype uses a distinct pair-record carrier … The LG prototype imports …"
- Line 623: "These inputs commission the following construction"
- Line 1649
- `Suggested.lean:1609`, `exists_chevalleySystem`

Claim: the paragraph after References describes other files and uses names defined nowhere. `exists_chevalleySystem` asserts only nonzero root vectors with `⁅e_α, f_α⁆ = h_α`, not structure constants, so it does not state what a Chevalley system is.

Witness: the lines are quoted above. The lemma's conclusion consists of root-space membership, non-vanishing and bracket conditions only.

Repair: delete the paragraph after References and rewrite lines 623 and 1649 timelessly. Rename the lemma `exists_rootVectors_lie_eq_coroot`, or delete it in favour of Mathlib's `exists_isSl2Triple_of_weight_isNonZero`.

## R19 (P3) — Layer 10's compact-centre application has no owner

Location: README line 1726, "#### Late compact-center application in LieGroups", through line 1746, "Thus prove, equivariantly …, `Z(G) ≃ P∨/Y`".

Claim: this subsection plans group-level targets and labels them as a LieGroups application, but LieGroups does not own them.

Witness: `P∨/Y` occurs 0 times in LieGroups' README on main.

Repair: either make this a target of this roadmap, with `*Needs:*` LieGroups Layers 4, 6 and 7, or cut it and name it as a LieGroups Part II item.

## R20 (P3) — Conflicting open pull request, with no stated order

Location: `Suggested.lean`, which this pull request and the open revision "LieHighestWeight: tensor strings, reductive centers and opposition" both change.

Claim: the two heads conflict in this file, and neither description says which one rebases on the other.

Witness: `scratch/overlaps.md` at a285fd7 reports the conflict in `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/Suggested.lean`. This pull request's description does not mention the other revision.

Repair: state the order in the description, for example that this fold is rebased onto the other revision after it merges.

## Previous findings

- R01 — not repaired: `Suggested.lean:1673` still reads `def Octonion : Type → Type := sorry`; gate `sorry-data=47` unchanged.
- R02 — not repaired: `Suggested.lean:1943` `right_alternative … : y * x * x = (y * x) * x := sorry`; closes by `rfl` at this head.
- R03 — not repaired: the Exceptional and Reductive sections (lines 1673–1797, 2144–2318) still state headlines on `sorry` stand-ins.
- R04 — not repaired: README lines 319, 1066, 1223, 1237, 1469, 1491 still plan native results as open targets.
- R05 — not repaired: README line 915 still cites `#layer-6-characters-of-compact-groups`; the open CompactGroups head still renames Layer 6.
- R06 — not repaired: one-line native aliases (`weyl_character_formula`, `hasCentralRadical_matrix` at line 2109, …) unchanged.
- R07 — not repaired: `Suggested.lean:40` "**This file is not the roadmap and is not exhaustive.**"; second docstring at line 2584.
- R08 — not repaired: `Suggested.lean:2` `import Mathlib.RingTheory.TensorProduct.Basic`.
- R09 — not repaired: 31 non-`sorry` warnings at lines 350–1581.
- R10 — not repaired: 11 `statement-hygiene` hits at the same lines.
- R11 — not repaired: README lines 867, 1516, 1799 keep `blob/149fe79…` links.
- R12 — not repaired: README line 1258 "design of [Mathlib PR41919]".
- R13 — not repaired: README line 1241 "[Baez's trace-power identity](…/octonions/node12.html)".
- R14 — not repaired: 0 `**Checks.**`, 0 `*Needs:*`, no `## Scope and ownership`.
- R15 — not repaired: README line 1123 "[Etingof §§10.1,13.3,14.1]" without theorem or page; precursor "the source's …" unnamed.
- R16 — not repaired: README line 875 "[TensorProductCombinatorics H1.6](…#h16-…)"; line 982 `TauCeti.SymmetricAlgebra.adjointDerivation`.
- R17 — not repaired: README line 300 "`Suggested.lean` pins … `Sl2Irrep`"; `compactAlbert*` names undeclared.
- R18 — not repaired: README line 1850 "**Prototype carrier and chart boundary.** The LHW prototype uses …".
- R19 — not repaired: README line 1726 "#### Late compact-center application in LieGroups".
- R20 — not repaired: the description still states no order against the conflicting LieHighestWeight revision.

## Verified sound

**Scope of the change.**
- `git diff 11a9ca1 a285fd7 -- TauCetiRoadmap/RepresentationTheory/` is empty.
- The README is byte-identical to main's. Suggested.lean differs from main only by the earlier fold of `TypeAHaarTargets.lean` (164+/159−).
- `lake-manifest.json` is unchanged, and its pins equal main's (Tau Ceti `2fd255d997`, Mathlib `1b1ccf4b08`).
- The outside-folder diff command lists nothing.
- Neither this README nor this Suggested.lean mentions AlgebraicTopology, GeometricTopology, QuadraticFormInvariants or ReductiveGroups. The rewritten AlgebraicTopology README and Suggested.lean do not mention LieHighestWeight. The change therefore makes no text of this roadmap wrong.

**Gate and build.**
- I used the worker's gate at a285fd7 as data: `sorry-data=47`, `blob=3`, `prnum=1`, `private-paths=1`, `imports=1`, `mathlib-subimports=1`, `statement-hygiene=11`, `build=31`, FAIL. Each failing rule is a finding above (R01, R08–R13).
- My own `lake env lean` run of Suggested.lean took 56 s: 0 errors, 195 `sorry` warnings, 31 other warnings, the same as 11a9ca1.
- The R02 probe was re-run on a scratch copy (`rfl` closes line 1943).
- The worktree is clean (`git status` empty).
- Elaborated signatures: the folder is unchanged, so the previous round's comparison of `scratch/signatures.md` with the README stands. The dropped `[IsTriangularizable K H L]` binders are supplied by a native instance; the auto-included `[IsAlgClosed K]` narrows `weyl_complete_reducibility` (R06).

**Dependency check** (at this head):

    depcheck: 229 roadmaps, 2316 edges, 0 problem(s)

**Adversarial table.** No statement changed, so these rows carry forward from the previous report (r20, at 11a9ca1, values computed there). Rows marked † were recomputed at a285fd7.

| Statement | Instances | Values (left / right) | Result | From |
|---|---|---|---|---|
| Weyl character formula † | sl₂, λ=ω; λ=0 | `(e^ω+e^{−ω})(1−e^{−2ω}) = e^ω−e^{−3ω}` / `e^{2ω−ω} − e^{−2ω−ω} = e^ω−e^{−3ω}`; `1−e^{−α}` / `1−e^{−α}` | holds; native `Weyl/Character.lean:324` | r20, recomputed |
| Weyl dimension formula | sl₂ λ=nω; A₂ at ω₁, ω₂, ω₁+ω₂, 2ω₁, 3ω₁ | `n+1` / `n+1`; `(a+1)(b+1)(a+b+2)/2` = 3, 3, 8, 6, 10 / README 3, 3, 8, 6, 10 | holds | r20 |
| Kostant multiplicity | sl₂ λ=n, μ=n−2k; k=n+1 | `1−0` / 1; `1−P(0)=0` / 0 | holds | r20 |
| Freudenthal | sl₂ V(1), μ=−ω | `4⟨ω,ω⟩·m` / `4⟨ω,ω⟩` ⇒ m=1 | holds | r20 |
| Tits sign | sl₂ V(1); V(2) | −1 / alternating; +1 / symmetric | holds | r20 |
| `minuscule_pieri` | sl₂ λ=0, μ=ν=ω | 1 / 1 | holds; native (R04) | r20 |
| Casimir, sl₂ `Ω=h²+2h+4fe` | κ(h,h)=8, κ(e,f)=4 | `(h²+2h+4fe)/8` / `Ω/8` | holds | r20 |
| HC images, sl₂ † | t=λ(h) | `(t−1)²+2(t−1) = t²−1` / README `t²−1`; shift `f_b(λ+ρ)` / EtingofRepresentationsLieGroups line 3049 `f_b(λ+ρ)` | holds | r20; shift re-read in v2 |
| Chevalley restriction † | degree 0; Etingof v2 Thm 10.1 (line 2153, p. 51) | `tr(id)=dim M` / `Σ mult = dim M`; graded iso `C[g]^g → C[h]^W` / README same | holds | r20; locator re-read |
| Serre transpose convention | `cartanMatrixIn i j = α_i(α_j^∨)` | needs `α_j(h_i)` / `(cartanMatrix)ᵀ i j = α_j(h_i)` | holds | r20 |
| `sl2_finrank_of_hasPrimitiveVector` | sl₃ adjoint, α₁-triple | 2 claimed / 8 | restricted irreducibility needed (stated) | r20 |
| gl_n Casimir scalar | gl₂ | `μ₀(μ₀+1)+μ₁(μ₁−1)` / README same | holds | r20 |
| Staircase separation | ν_t=N−½−t | `4(t−s)` / `4(t−s)` | holds | r20 |
| CAR example | `ΣF_ii` | `N²/2` / `N²/2`; `2^{N(N+1)/2}` / same | holds | r20 |
| `hasCentralRadical_iff_…` | L=0; sl₂⋉K²; gl₁ Jordan | both true; both false | holds | r20 |
| `gl_dual_standard_pieri` | n=1; n=0; μ=(½,½) | 1 summand; 0 / empty; dim 2 / 2 | holds; native | r20 |
| `score_eq_gap_sum` † | n=2, x=(x₀,x₁), λ=(l₀,l₁) | `(S/2)(x₀+x₁) + (x₀ − (x₀+x₁)/2)(l₀−l₁) = x₀l₀+x₁l₁` / `x·λ` | holds | r20, recomputed |
| Non-injectivity † | x=(3,2,1); (1,1,−2), (2,−1,−1) | `3+2−2 = 3` / `6−2−1 = 3` | holds (README line 659) | r20, recomputed |
| `finite_dominant_score_sublevel` | x=(1,1) | score ≡ S / infinite set | `StrictAnti` needed | r20 |
| `staircase_alternant` | n=2; n=0 | `t₀−t₁` / `t₀(1−t₁/t₀)`; 1/1 | holds | r20 |
| top coefficient | n=2, l=0; n=1 | 2 / 2!; 1 / 1 | holds | r20 |
| Haar norm | λ+ρ strictly decreasing | `(1/n!)·n!` / 1 | holds | r20 |
| Type-A branching | GL₂→GL₁×GL₁, λ=(1,0) | μ₁∈{0,1} / weights (1,0), (0,1) | holds | r20 |
| Stable tensor range | ≥ vs > | inverted gap ≤ −1 / contradiction | holds | r20 |
| Division octonion product and norm | x=(i,0), y=(0,1) | `xy=(0,i)`, N=1 / 1 | holds | r20 |
| Cross-product identities | u=i, v=j, w=j | `i×k=−j` / `−j`; associator `−i`/`−i` | holds | r20 |
| `right_alternative` † | any `NonAssocRing` | `(y*x)*x` / `(y*x)*x` | **vacuous**, `rfl` closes at a285fd7 | R02 |
| Complex scalar extension | ℂ⊗Der_ℝ 𝕆_div vs Der 𝕆_ℂ | 14 / native 14 (`Derivation.lean:959`) | holds | r20 |
| Albert determinant † | Baez §3.4 vs native | `⅓tr a³ − ½tr a² tr a + ⅙(tr a)³` (BaezOctonions line 1481) / `six_mul_det` | holds | r20, re-read |
| Isotypic toolkit example | (V(1)⊗V(1))⊕V(0) | `3+0+2 = 5` / `4+1` | holds | r20 |

**Library declarations re-opened at the pins (file:line).**
- `TauCeti.Octonion` (`Algebra/Octonion/Basic.lean:143`) and `right_alternative` (`:684`)
- `Octonion.finrank_derivationLieAlgebra` (`Octonion/Derivation.lean:959`)
- `AlbertAlgebra.finrank_derivationLieAlgebra` (`AlbertAlgebra/Derivation/Finrank.lean:384`)
- `nonempty_lieModuleEquiv_directSum_irreducibleQuotient` (`HighestWeight/Decomposition.lean:168`)
- `lieChevalleyRestrictionIso` (`ChevalleyRestriction.lean:151`)
- `harishChandraIso` and `vermaCentralCharacter_eq_iff` (`CentralCharacter/Isomorphism.lean:106,159`)
- `minuscule_pieri` (`HighestWeight/Pieri.lean:154`)
- `exists_int_of_hasEigenvalue` (`Sl2/Spectrum.lean:151`)
- `glIrreducible` (`GeneralLinear/Carrier.lean:204`) and `gl_dual_standard_pieri` (`GeneralLinear/Pieri.lean:388`)
- `exists_isCompl_of_isKilling` (`HighestWeight/CompleteReducibility.lean:259`)
- `lieModuleDerivation` (`SymmetricAlgebra/LieModule.lean:89`)
- `inner_characterLp_eq_finrank_contIntertwiningMap` (`Compact/Intertwiner/Dimension.lean:145`)
- `formalCharacter_mul_weylDenominator_eq_weylNumerator` (`Weyl/Character.lean:324`)
- `finrank_eq_prod_coweightPairing_div` (`Weyl/Dimension.lean:116`)
- `formalCharacter_coeff_eq_kostantMultiplicity` (`KostantMultiplicity.lean:73`)
- `diagramSchurPoly_mul_alternant` (`Schur/Bialternant.lean:254`)
- `DominantWeight` (`ClassicalGroups/DominantWeight.lean:85`)
- Mathlib `RootPairing.Base.equivOfCartanMatrixEq` (`RootSystem/CartanMatrix.lean:362`)
- `adjointDerivation` occurs 0 times in Tau Ceti.

That is 21 declarations, plus one confirmed absent.

**Cross-roadmap citations re-resolved at this round.**
- CompactGroups Layer 6: main line 369; open head line 721 (R05).
- TensorProductCombinatorics §1.6 and §2.6: on main, lines 694 and 1191 (R16).
- TangentialBordism §9.1 and §9.2: open head, lines 2416 and 2475 (R16). Its consumption of `compactAlbert*` is at lines 2426 and 2492 (R17).
- SchurWeyl Layer 7 and `LRTableau`: main, lines 580 and 631 (R11).
- LieGroups on main: `P∨/Y` absent (R19).

**Ownership against open pull requests.** `scratch/overlaps.md` lists the conflicting LieHighestWeight revision (R20) and the CompactGroups drop (R05). It lists no id that only an open revision defines. The closest open roadmaps (ClassicalGroups, SpinRepresentations, ExceptionalThetaCorrespondencesForG2, ReductiveGroups, RootSystemsPartII) were checked last round. None of them owns this roadmap's objects again, and this round changes nothing.

**Remarks on untouched text** (no change requested in this incremental round): none beyond the restated findings.

## Not verifiable

- Seeded targets, by README line:
  - "Weyl character formula" (lines 24, 275, 813)
  - "Integral weights, finite induction and virtual characters" (637)
  - "Polynomiality before character identification" (676)
  - "Haar norm and identification" (711)
  - "Type-A coefficient and branching applications" (738)
  - "The positive division-octonion algebra and its invariant tensors" (1287)
  - "Complex scalar-extension boundary" (1319)
  - "Prototype carrier and chart boundary" (1850)

  None of these carries a locator, so there was nothing to check against a text. Their mathematics is in the adversarial table, the Weyl formula row recomputed. The README flags no locator as unverified.
- The precursor's unnamed "source" (lines 608–770): it is not named, so it cannot be looked up (R15).
- Humphreys GTM 9, Fulton–Harris, Bourbaki Lie VII–VIII, Jacobson, Schafer, Goodman–Wallach, Dixmier and Molev: no open legal copy. The README cites them only by chapter.

## Source issues

- none
