# Review of ClassFieldTheory (pull request #617 at b254b25)

**Verdict:** needs changes

Independent AI review of the complete 907-line README and 752-line acceptance test, including all ten admitted targets. The worktree was not edited. The gate fails; elaboration succeeds.

## R01 (P1) — The local-duality example interchanges the module and its dual

**Location:** `TauCetiRoadmap/ClassFieldTheory/README.md:472–474`: “its dual has `H⁰` of order `1` while `H⁰` of the module has order `3`”.

**Claim:** For the nontrivial unramified action on `A = ℤ/3` over ℚ₂, these orders are reversed.

**Witness:** Frobenius acts on A by −1, giving fixed set {0}. It acts on μ₃ by 2 = −1, hence on Hom(A,μ₃) by (−1)/(−1) = 1. The orders are 1 and 3.

**Repair:** Write `#H⁰(A)=1` and `#H⁰(Aᴰ)=3`. Keep the nontrivial action explicit. Add the complementary trivial-action calculation: `#H⁰(ℤ/3)=3`, `#H⁰(μ₃)=1`. Both calculations then agree with duality.

## R02 (P1) — Name and own the valuation comparison used by three headlines

**Location:** `TauCetiRoadmap/ClassFieldTheory/README.md:462–465`: “The missing input is that compatibility”; line 530 sends the cyclotomic target back here.

**Claim:** The route uses uniqueness of a rank-one henselian valuation and automatic compatibility with the chosen ℚₚ-algebra map. Neither is an explicit target with prerequisites or a resolved supplier contract. A literature attribution alone does not supply the formal prerequisite.

**Witness:** `TauCeti/NumberTheory/LocalField/AbsoluteRamificationIndex.lean:64–89` requires `ValuativeExtension` to construct `FinitePadicExtension`. No provider is named here. Searches at both pins found no independent-henselian-valuation uniqueness theorem. Revision #1411 explicitly plans the comparison at its README line 1120.

**Repair:** Make the general valuation-uniqueness input and its finite-ℚₚ comparison explicit named targets, with exact hypotheses, locators, prerequisites and Checks, before applying the three pinned theorems. Reconcile this with #1411 under R11; do not silently depend on that revision. State preservation and reflection of the valuative relation, not equality of normalized integer valuations. Test ℚ₂(i): `v_F(2)=2` while `v₂(2)=1`, but the multiplicative valuations both satisfy `|2|<|1|` and reject `|1|≤|2|`. This retains the broader headlines without adding the compatibility assumption to them.

## R03 (P1) — The trivial-layer Artin map need not have a trivial source

**Location:** `TauCetiRoadmap/ClassFieldTheory/README.md:417`: “the Artin map is the unique map between trivial groups”.

**Claim:** Its source is the ground level, not the norm quotient. Only the target and the induced quotient equivalence are trivial in the identity layer.

**Witness:** In ℚ₂/ℚ₂ the source is ℚ₂ˣ, with distinct elements 1 and 2. The norm is identity and Artin sends both to 1. `TauCeti/NumberTheory/ClassFieldTheory/Formation/TrivialLayer.lean:149` states that the map is zero, not that its source is trivial.

**Repair:** Say the Artin map is zero and its induced equivalence is between trivial groups. Retest 1 and 2 in the source and the one-element norm quotient. README 756–757 already makes the correct distinction.

## R04 (P2) — Finite local cohomology needs the coefficient restriction

**Location:** `TauCetiRoadmap/ClassFieldTheory/README.md:447–456`: “finiteness of `H⁰`, `H¹`, `H²` of a finite smooth discrete module”; invertibility is attached only to perfectness.

**Claim:** Over an equal-characteristic local field, a finite smooth discrete module can have infinite H¹. The finiteness sentence drops the coefficient restriction of the pinned theorem.

**Witness:** For F=𝔽₂((t)), A=𝔽₂ trivial, H¹=F/{x²−x}. The classes t⁻¹,t⁻³,t⁻⁵,… are independent: a nonzero Artin–Schreier difference with negative valuation has even pole order. H¹ is infinite, although A has two elements.

**Repair:** State finiteness with `(n : F) ≠ 0` for `A : GalRep n F`, as `TauCeti/NumberTheory/ClassFieldTheory/FiniteCohomology/DegreeTwo.lean:97` does. Keep characteristic-p coefficients over characteristic-zero local fields. Add this equal-characteristic example as a negative Check: n=2 becomes zero in F and is excluded, while ℚ₂ with A=𝔽₂ still gives finite cardinalities (2,8,2). Do not weaken the claim to prime-to-residue-characteristic coefficients.

## R05 (P3) — Remove the compatibility catalogue and small tests from the acceptance file

**Location:** `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:59–64`: “Each is an abbreviation of a Tau Ceti declaration … or a theorem closed by Tau Ceti's theorem”; also targets at 163, 588 and 690.

**Claim:** Downstream compatibility names do not become acceptance-test headlines. Most of this file is an API catalogue. The abstract/global quadratic tests mirror README §5.4. The maximal-order comparison is a one-tactic consequence of pinned definitions.

**Witness:** A copy with the single simp proof below for `ringClassField_maximal` elaborates with nine rather than ten sorry warnings and no others. Lines 101, 110, 157, 204 and 616 already contain literal one-term proofs from the pinned library.

```lean
by simp [TauCeti.ClassFieldTheory.ringClassField,
  TauCeti.ClassFieldTheory.hilbertClassField,
  TauCeti.ClassFieldTheory.rayClassField,
  TauCeti.ClassFieldTheory.ringClassNormSubgroup,
  TauCeti.ClassFieldTheory.rayNormSubgroup,
  TauCeti.ClassFieldTheory.ker_ringClassIdeleQuotient_maximalNumberFieldOrder]
```

**Repair:** Delete the three small tests and the imported-API compatibility catalogue from `Suggested.lean`; retain only definitions needed to state substantive headlines. Keep the mathematical tests and pinned citations in the README. Migrate consumers to native declarations in separately reviewed consumer changes; do not break their build. In particular remove the artificial zero-pairing branch at `n=0` and its helper with that wrapper. Do not prove the padding in place. The simp probe works for arbitrary number fields; at ℚ and ℚ(√−5), both sides respectively give ℚ and ℚ(√−5,i).

## R06 (P3) — The acceptance file still imports another roadmap

**Location:** `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:28`: `import Completed.GlobalNumberFields.Suggested`; README 841–843 prescribes it.

**Claim:** Only Mathlib and individual pinned Tau Ceti imports are permitted. The worker's `imports=1` is real even though the import elaborates here.

**Witness:** The converter at 697–699 copies `toSubalgebra`, `finite`, `spans`, all present in the native `TauCeti.GlobalNumberFields.NumberFieldOrder`. No admitted headline uses the roadmap order; only the compatibility wrappers do.

**Repair:** Move consumers to the pinned order/Picard carriers, remove this import and obsolete wrappers, and correct the module prose and README §6. Re-elaborate migrated consumers. The subrings of ℤ[i], ℤ[2i] and a maximal cubic order are unchanged, so their class fields remain the same.

## R07 (P3) — Several sampled targets lack exact source locators

**Location:** `TauCetiRoadmap/ClassFieldTheory/README.md:409–413,460–465,527–530,620–623,694–702`. Example: “They follow from Tau Ceti's splitting criterion … through `rayClassArtinEquiv`”.

**Claim:** These claims lack theorem/section and printed-page locators. The reference list does not repair this: Schmidt has no theorem/page locator and Milne ADT only I §2. The two correctly numbered Milne V headlines also omit pages.

**Witness:** `milne-adt` line 1227 is I Theorem 2.8, p.31. `milne-cft` lines 7252 and 7423 are V Theorems 3.17 and 3.27, pp.161 and 165; line 7436 is Remark 3.28. These locators are absent at the claims.

**Repair:** Attach those locators to the Euler, principal-ideal and conductor claims. For derived corollaries, give precise pinned kernel/splitting declarations and file locations, and textual reciprocity locators: Milne V §1, pp.152–154, and the decomposition statement after V 3.13, p.159. For cyclotomic normalization cite VII Example 8.2, pp.221–222, plus norm functoriality; that example supplies the ℚₚ normalization, not automatic valuation compatibility. Supply an exact readable Schmidt locator or explicitly mark it uncertified. Correct the Kopp–Lagarias title to the version read. These changes preserve the computed examples below.

## R08 (P3) — The nonempty isomorphism corollary still fails statement hygiene

**Location:** `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:721–723`: `gal_ringClassField_equiv_pic … : Nonempty (…)`.

**Claim:** The canonical isomorphism is already data immediately above. This is neither a headline nor a correctly named `nonempty_*` corollary. The worker reports `statement-hygiene=1`.

**Witness:** Line 723 proves it by `⟨(ringClassArtinEquiv K O).symm⟩`. The gate requests canonical data or an `IsIso` statement, retaining a Nonempty corollary only under a `nonempty_*` name.

**Repair:** Delete it from `Suggested.lean` under R05 and use canonical data in the consumer. If retained in the library as a corollary, use `nonempty_*`. At the class-number-one order ℤ[2i], this is the unique equivalence of two one-element groups.

## R09 (P3) — Finish the README structure and remove process residue

**Location:** `TauCetiRoadmap/ClassFieldTheory/README.md:809`: “to be checked in two cases”; numbered structural headings at 22,128,242,289,839,856,879.

**Claim:** The residue gate fails. Layers now have examples/dependencies, but targets still lack individual `*Needs:*` lines. Retained own definitions lack their API/three discriminating Checks. The layers repeatedly inventory completed results outside Scope instead of presenting the remaining build.

**Witness:** Both gates report `residue=1` at 809. Distinct targets at 685–702 share one dependency paragraph at 719–721. The order converter and coefficient wrappers have no three-Check definition blocks.

**Repair:** Replace the process phrase with the two computations already following it. Use the prescribed unnumbered structural headings, move the pinned-result inventory to Scope/supplier contracts, and give each remaining target statement/route dependencies. After R05 removes obsolete wrappers, give each retained definition its API and three discriminating Checks. Preserve the C₄/V₄ computations.

## R10 (P3) — Five changed files lie outside this brief's authorized folders

**Location:** `Completed/LocalFieldsRamification/COMPLETION.md`, `README.md`, `Suggested.lean`; `Completed/LocalGaloisGroups/README.md`, `Suggested.lean`.

**Claim:** The brief names ClassFieldTheory, IntegralLattices and QuadraticFormInvariants as this PR's own folders. It explicitly requires the five other gate hits to be findings. The description's LocalFieldsRamification subject does not override that scope.

**Witness:** The prescribed excluded-path diff returns exactly these five paths: 958 insertions, 3167 deletions. The supplied gate reports `outside-folder=5`.

**Repair:** Split these edits into independently reviewed PRs, or have intake explicitly register these folders as owned and separately reviewed and rerun the scoped gate. Validate an empty excluded-path diff and a passing scoped gate. Coordinate the supplier split rather than discarding substantive changes.

## R11 (P3) — Resolve two conflicting revisions before merge

**Location:** The description's merge-order paragraph names only #1410.

**Claim:** No order is stated for this head, #1215 and #1411, although they revise this roadmap incompatibly.

**Witness:** The overlap report lists conflicts in both ClassFieldTheory files. #1411's `TauCetiRoadmap/ClassFieldTheory/README.md:1120` names valuation comparison; its Layer 7 plans unit-filtration reciprocity. #1215's same file at 1778 states principalization. This head changes those interfaces again.

**Repair:** State which revision rebases on which; reconcile shared targets and consumer migrations in that order. Validate by a clean merge and re-resolved citations. The #1410 sentence settles neither conflicting ClassFieldTheory revision.

## R12 (P3) — Preserve or map three heading anchors used by consumers

**Location:** `TauCetiRoadmap/ClassFieldTheory/README.md:426,588,639` renames Layers 5,10,12 without old-to-new mappings.

**Claim:** Keeping layer numbers does not preserve GitHub heading anchors; consumer links break on merge.

**Witness:** #1405 `TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md:2626,2806,2817` and main `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:145,167` use old Layer 5/10 anchors. #1005 `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md:1492,3530` uses the old Layer 12 anchor. There is no mapping here.

**Repair:** Restore the headings or add one explicit old → new heading mapping per moved id and coordinate consumer-link updates:

- `layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality` → `layer-5-local-coefficients-kummer-theory-the-local-symbol-and-duality`;
- `layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants` → `layer-10-global-carriers-the-brauer-sequence-and-the-global-invariant`;
- `layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence` → `layer-12-global-existence-the-norm-index-and-the-global-correspondence`.

Retesting each quoted link then resolves it to the same mathematics.

## Verified sound

The following records successful checks and identifies failed rows explicitly. It does not claim the admitted targets have been formally proved.

**Previous review, finding by finding.** These were reconciled before the full pass. No supplied repair report marks a finding not actionable in this package.

| Previous id | Passage at this head | Assessment |
|---|---|---|
| R01, sorry data | README 92: “an abbreviation of a Tau Ceti declaration”; Lean 126–142,480–481 | Repaired: no sorry data. Compatibility catalogue remains under R05. |
| R02, lost local binders | Lean 466 supplies the local stack; elaborated `@artinMap` retains it | Repaired for every surviving local map. |
| R03, options/imports | Lean 1 `import Mathlib`; 28 `import Completed.GlobalNumberFields.Suggested` | Partly repaired: no options; one forbidden import (R06). |
| R04, absent headlines | Lean 654 `isPrincipal_map_hilbertClassField`; 680 `relDiscr_eq_finprod_abelianConductor` | Repaired: both stated on native carriers and elaborate. |
| R05, quadratic-only orders | README 112: “every order in every number field”; Lean 704 | Repaired: no quadratic binder. |
| R06, padding/replanning | README 13: “All of this is proved in the pinned Tau Ceti”; Lean 101,616 | Partly repaired: pinned results acknowledged, but still an acceptance-file catalogue (R05). |
| R07, hygiene | Lean 278/288 are equivalences; 715 is canonical data; 722 retains Nonempty | Partly repaired: choices/signature-local instances gone; R08 remains. |
| R08, pin claims | README 307: “namespace `Rep`”; 456: “the topology is discrete and every point stabilizer is open” | Repaired for all six cited passages: post-pin/logarithm-equivariance claims removed and native APIs used. |
| R09, C₄ Check | README 811: “agrees with the quotient map”; 814: “transfer … is trivial” for V₄ | Repaired: C₄ kernels agree; V₄ kernels differ. |
| R10, shape/residue | README 3 has Summary; all layers have Examples/Dependencies; 809 retains “to be checked” | Partly repaired: TeX/long fences gone; R09 remains. |
| R11, conflicts | Description: “merge first: #1410” | Not repaired; R11. |
| R12, outside changes | Five paths in scoped diff | Not repaired under this brief's owned-folder list; R10. |
| R13, build warning | Old concrete ℚ₂ theorem no longer declared | Repaired: only ten sorry warnings. |


**Gate and signatures.** The inspected revisions match `lake-manifest.json`: Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`. HEAD matches the requested commit; the worktree was clean.

The supplied gate fails residue 1, imports 1, statement-hygiene 1, outside-folder 5; its targeted build passes. My rerun reproduces the first three categories but reports outside-folder 8: the raw invocation additionally counts three authorized IntegralLattices/QuadraticFormInvariants paths. Those three extra hits are not findings. All other scanner counts are zero. The rerun exits before a build. Separately, `lake env lean` on the exact acceptance file exits 0 with ten sorry warnings and no others.

A scratch copy with `#check @name` for all **75 public declarations and the one private helper** also exits 0. One accidental regex match inside a docstring was removed from the probe generator before the successful run. Local-field, number-field, finite-module, Galois and scalar-extension binders agree with the mathematical signatures. In particular, `artinMap`, `localArtinMap`, `normResidue`, strict cohomological dimension and cyclotomic normalization retain their local-field binders. Euler/cyclotomic targets intentionally omit compatibility. No signature correction or missing-object build was needed.

For all ten admissions I tried `simp`, `rfl`, `infer_instance` in copies and inspected pinned counterparts. Nine did not close with the bare tactics. The maximal-order comparison closes by the displayed single simp call. A fresh copy containing only that replacement exits 0 with nine sorry warnings and no others. Failure of those tactics is not proof of nontriviality; the independent no-Checks rule also applies.

**Adversarial coverage:** 123 computed rows below cover the declarations, sampled targets, headline theorems, conventions and additional README claims. Failed and uncertified rows are labeled explicitly.

**Dependency output** from the requested movable check:

```text
depcheck: 238 roadmaps, 2318 edges, 0 problem(s)
```

All 15 layer-dependency paragraphs and the 15 lines of §7 were read. No UPWARD/CYCLE lines or forbidden suppliers occur. GlobalNumberFields is the only direct roadmap supplier. R02 is a missing contract, not a reported graph cycle.

**Resolved ownership.** Main `Completed/GlobalNumberFields/Suggested.lean:742–745,758–759,789` supplies the finite spanning order, invertible fractional ideals and ClassGroup Picard carrier (README Layer 11, 578–584). The converter preserves these fields. ProfiniteCohomology #616 README 113–116 leaves class formations here; ProfiniteCohomologyPartII #1839 README 60–64,207–222 consumes local duality. ArtinRepresentations #1711 README 151–157 consumes the abelian conductor–discriminant result; its representation-theoretic generalization remains downstream. QuadraticFormInvariants at this head, Suggested 2537–2583, owns the quadratic-form-symbol comparison. IntegralLattices Suggested 417–420 consumes the ring-class/Hilbert-symbol names. Neither is an upward supplier.

Object searches used `roadmaps grep` over indexed heads/main and the board's ProfiniteCohomologyPartII package. The five overlap leads were examined: two conflicts, three dropped anchors. No dropped supplier ids or ids defined only by an undeclared revision are reported. Ownership against #1187 LocalGaloisGroups and #1811 LocalAnabelianGeometry was **not checked**: their files were not supplied. #1215/#1411 and #1005 were read through `roadmaps show` specifically to verify the supplied conflict/link leads, not adopted as suppliers. The relevant supplied open heads introduce no additional owner of these ideal-theoretic headlines.

The resolver's one missing-name lead is false: the abstract quadratic theorem is declared at Suggested 163. An inventory found declaration-leaf matches for all **334 names** in the Tau Ceti contract table; that is an existence check, not independent proof of every library theorem. Exact-file elaboration checks the fully qualified references actually used in Lean.

**Pinned declarations read.** Paths are relative to their library repositories:

| File and line | Declaration or assumption inspected | Consequence |
|---|---|---|
| `Mathlib/NumberTheory/LocalField/Basic.lean:46` | `IsNonarchimedeanLocalField` extends valuative topology, local compactness, nontrivial valuation | No condition on a separately chosen algebra map. |
| `TauCeti/NumberTheory/LocalField/AbsoluteRamificationIndex.lean:64,85` | `FinitePadicExtension`, `ofInstances` | Compatibility is required. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:259` | `IsSmoothDiscrete` | Includes discrete topology and open stabilizers. |
| `TauCeti/NumberTheory/ClassFieldTheory/Formation/ArtinMap.lean:193,204` | `artinMap_eq_iff`, `artinMap_eq_zero_iff` | Ground level is the source; kernel is norms. |
| `TauCeti/NumberTheory/ClassFieldTheory/Formation/TrivialLayer.lean:149` | `artinMap_trivialLayer` | Map is zero; source need not be trivial. |
| `TauCeti/NumberTheory/ClassFieldTheory/Formation/Tate/Theorem.lean:138,150` | `tateTheorem_apply`, `tateTheorem_toAddMonoidHom` | Isomorphism is cup product with the specified class. |
| `TauCeti/NumberTheory/ClassFieldTheory/Local/EulerCharacteristic/Theorem.lean:97,110` | cardinal/rank formulas | Uses the compatible finite-extension structure. |
| `TauCeti/NumberTheory/ClassFieldTheory/Local/ExplicitCyclotomicSymbol/ArtinMap.lean:294,311` | ℚₚ/extension-unit normalization | Inverse sign and field norm; compatibility required. |
| `TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RingClass/Field.lean:101,111` | norm subgroup and ring class field | Arbitrary orders; constructed from the kernel. |
| `TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RingClass/Quotient.lean:144` | maximal-order kernel equality | Supplies the simp proof. |
| `TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean:104,124,209,218` | ray subgroup/field, Artin equivalence, evaluation | Actual Artin map used in splitting. |
| `TauCeti/NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/Reciprocity.lean:257` | prime-splitting criterion | Admissible modulus and prime-to-modulus maximal ideal required. |
| `TauCeti/RepresentationTheory/Homological/TateCohomology/NakayamaRim.lean:117` | `Rep.projective_ker_of_isZero_res` | Suggested 91 is its direct application. |

**Seeded sources.** No locator is explicitly labelled unverified in this README. The five sampled headings cover ten admissions. Abstract quadratic Artin and quadratic splitting have no attached external locator (R07); their implications follow from the pinned kernel/Frobenius theorems and the computations below. Milne II Theorem 3.11, p.84 (`milne-cft` line 3911), the restriction argument at 3919, Remark 3.12 at 3988 and Example 3.14 at 3995 support Tate's hypotheses, Tor condition and inverse Artin direction.

Milne ADT I Theorem 2.8, p.31 (`milne-adt` line 1227) gives χ = [O:mO]⁻¹. In a finite ℚₚ-extension the index is p raised to [F:ℚₚ]vₚ(m), giving both Euler forms. It does not supply the formal valuation comparison in R02. Milne VII Example 8.2, pp.221–222 (`milne-cft` lines 10059–10109), has arithmetic Frobenius away from the cyclotomic prime and inverse units there; the local product is 1. Finite-extension transport is the pinned norm-functoriality theorem. Schmidt could not be certified from readable primary text.

Milne V Theorem 3.17, p.161 (`milne-cft` 7252), supports principalization of every ideal. V Theorem 3.27/Remark 3.28, p.165 (7423–7437), supports the finite abelian conductor product and kernel-field character conductor. Grouping by cyclic quotient gives φ([M:K]) characters, including φ(1)=1; the intermediate-field set is finite because the Galois group is finite. The splitting laws at V §1, pp.152–154 and after V 3.13, p.159 (6865,7183–7188), support the inert/split and ray-class tests. Kopp–Lagarias v3 Theorems 1.1–1.3, pp.3–4 (`kopp-lagarias` 128–181), covers every order; m=O and empty real set gives the ring class field and the maximal-order specialization.

**Headlines.** All ten open signatures listed in Scope are present: abstract quadratic Artin; cardinal/rank Euler; norm cyclotomic normalization; quadratic global splitting; principal ideal theorem; Hilbert/ray splitting; conductor–discriminant product; maximal-order comparison. All use real mathematical carriers. The module's claim that no headline is unstatable is consistent with this check; no absent statable headline or free-Prop substitute was found. Coverage does not excuse R02/R05.

**Computed adversarial table.** Cardinality 1 means the trivial group. Additive Hilbert invariant 1 in ℤ/2 corresponds to 1/2 in ℚ/ℤ. A pass records a computed instance, not a universal proof. Every retained declaration is addressed below, followed by the additional conventions and layer assertions. Delete means R05; the mathematics remains in the README/library.

| Statement | Instances | Computed sides / negative control | Result; change |
|---|---|---|---|
| `projective_ker_of_isZero_res` | k=ℤ, G=1, P=ℤ²→ℤ first projection; G=C₂, regular module→0 | Kernels ℤ and ℤ[C₂], both free/projective; trivial C₂-module ℤ fails H²=0 since H²=ℤ/2 | Pass; delete wrapper |
| `primaryComponent_tateCohomology_eq_bot` | p=3, trivial C₂ action on ℤ/2; p=2 negative control | Multiplication by 3 is identity; Ĥ⁰=ℤ/2 has 3-primary part 0. Multiplication by 2 is zero and not bijective | Pass; delete wrapper |
| `ClassFormation` | ℂˣ over C₂; identity layer | H¹=0, H²=C₂, inv(nonzero)=1/2; identity H²=0, image {0}=order-one subgroup | Pass; use native carrier |
| `tateTheorem` | C₂, ℂˣ, fundamental generator; trivial ℤ/2 coefficients | Ĥ⁻²(ℤ)=C₂→Ĥ⁰(ℂˣ)=C₂ is iso; latter coefficients have H¹=C₂≠0 and fail hypothesis | Pass; delete wrapper |
| `ClassFormation.artinMap_conj` | abelian unramified quartic layer, a=2 | Conjugation identity: both sides Frob, exponent 1 mod 4; zero-map model sends 2 to 0, contradicting normalization | Pass; delete wrapper |
| abstract quadratic Artin target | ℚ₂(i), a=−1,5; σ=τ | −1: Art=τ and not norm, true↔true; 5: Art=1 and norm, false↔false; σ=1 excluded | True instance; delete Check-target |
| `GalRep` | n=2, F=ℚ₂, trivial line versus zero module | Underlying cardinalities 2 and 1; both are actual TopRep objects, not interchangeable | Pass; native carrier |
| `H` | same trivial line, i=0,1,2; zero module | Cardinalities (2,8,2); zero-module cardinalities (1,1,1) | Pass; native cohomology |
| `absoluteGaloisGroupComparison` | F=ℚ, identity and conjugation on i | 1 maps i→i; conjugation maps i→−i in both closures | Pass; native comparison |
| `muNRep` | F=ℚ₂, n=1,2,3; F=𝔽₂, n=2 | Cardinalities 1,2,3 in separable closure; characteristic-two μ₂ has cardinality 1, not 2 | Pass; native carrier |
| `muNRepCoeffDictionary` | μ₂, elements 1,−1 | Additive coordinates 0,1 on both sides; maps two distinct elements to two distinct elements | Pass; native dictionary |
| dictionary continuity | μ₂ with discrete topology | Preimages of the two singleton opens are singleton opens; empty preimage empty | Pass; delete wrapper |
| dictionary equivariance | μ₃ over ℚ₂, arithmetic Frobenius | ζ→ζ² on both sides; coordinate 1→2, not 1→1 | Pass; delete wrapper |
| `instFactIsSmoothDiscreteMuNRep` | μ₃/ℚ₂ | Generator stabilizer has index 2 and is open; identity-root stabilizer index 1 | Pass; native smoothness |
| `instFactIsSmoothDiscreteTrivialFp` | p=2, trivial line | Both elements fixed; both stabilizers whole group of index 1 | Pass; native smoothness |
| `muNRepEquivZMod` | n=2, ζ=−1; n=1, ζ=1 | −1→1 mod 2, 1→0; n=1 only 0 mod 1 | Pass; native equivalence |
| `muNRep_ρ_eq_self` | μ₂/ℚ₂; μ₃/ℚ₂ negative control | ±1 fixed; Frobenius sends ζ₃→ζ₃², but no primitive ζ₃ lies in ℚ₂ | Pass; correct root hypothesis |
| `kummerClass` | ℚ₂, n=2, a=1,−1; n=0; char 2, n=2 | Classes 0, nonzero; noninvertible-n branches are 0 by definition and have no Kummer theorem | Pass; remove wrapper/junk branch |
| `kummerClass_eq_kummerCocycleClass` | n=2, a=−1, root i | Conjugation cocycle (−i)/i=−1; identity gives i/i=1; corresponds to nonzero/zero coordinates | Pass; native theorem |
| `kummerEquiv_mixed` | ℚ₂, n=2; ℚ₃, n=2; n=1 | Square-class/H¹ cardinalities 8=8, 4=4; n=1 both 1 | Pass; native Kummer equivalence |
| `kummerEquiv_mixed_mk` | ℚ₂, n=2, a=4,−1 | [4]→0=κ(4); [−1]→nonzero=κ(−1) | Pass; delete wrapper |
| `h2MuEquivZMod_mixed` | ℚ₂, n=1,2,3 | H² cardinalities 1,2,3 equal those of ℤ/n; inv 1/2 maps to 1 mod 2 | Pass; native invariant |
| `h2FpEquivZMod_of_mu` | p=2, T=μ₂, e=id; T=0 | H²=C₂ maps to C₂; zero-module H² has one element, but e cannot exist since 2≠1 | Pass; coefficient iso essential |
| private `zeroTopPairing` | n=0, ζ=2 of infinite order; inputs x,y | Bilinear map returns 0 for every input, as does its defining zero map | Definition; delete helper |
| `kummerCupPairing` | n=2, ζ=−1, x=y=nonzero; n=0 | 1·1=1 in ℤ/2; n=0 artificial branch returns 0 | Pass; remove wrapper |
| `kummerCupPairing_bil` | n=2, coordinates (1,1),(0,1) | Both sides 1 and 0 respectively | Pass; delete API theorem |
| `localSymbol` | ℚ₂, pairs (−1,−1),(5,−1), fixed trace | Additive values 1 and 0; signs −1 and +1. Zero pairing would give 0,0 and is a different input | Pass; use native map |
| `tateDual` | nontrivial unramified A=ℤ/3 over ℚ₂ | Frobenius dual multiplier (−1)/(−1)=1; #H⁰(Aᴰ)=3, #H⁰(A)=1 | README reverses counts; R01 |
| `instFactIsSmoothDiscreteTateDual` | preceding dual | Three elements each have stabilizer whole group, open of index 1 | Pass; native smoothness |
| `tateDualityPairing` | μ₂/ℚ₂, degrees 0,2 | Generator paired with generator gives 1; pairing either with 0 gives 0 | Pass; native pairing |
| `muNRepToTateDual` | μ₂, ζ=−1 | 0 maps to zero endomorphism, 1 to identity endomorphism; exactly two maps | Pass; native map |
| `bijective_muNRepToTateDual` | same | Domain 2, codomain 2; two distinct images, kernel {0} | Pass; delete wrapper |
| `tateDualityPairing_muNRepToTateDual` | κ(−1),κ(−1); κ(5),κ(−1) over ℚ₂ | Both pairings give 1; then both give 0 | Pass; delete wrapper |
| `finite_H` | trivial 𝔽₂ over ℚ₂; zero module | #H⁰,#H¹,#H² = 2,8,2 and 1,1,1, all finite; i>2 not claimed here | Pass; native theorem |
| `tateDualityPairing_perfect_mixed` | μ₂/ℚ₂, degrees 0,2; zero module | Induced map C₂→Hom(C₂,C₂) sends 0→0,1→id, bijective; zero groups have unique zero character | Pass; native theorem |
| `eulerCharacteristic_mixed` | ℚ₃, trivial 𝔽₃; ℚ₂, trivial 𝔽₂; ℚ₂ with μ₃; zero module | 9=3·1·3; 8=2·2·2; 3=1·3·1; 1=1·1·1 | Values pass; route needs R02 |
| `eulerCharacteristic_finrank_fp` | ℚ₃, trivial 𝔽₃; ℚ₂, trivial 𝔽₂; ℚ₂(i), trivial 𝔽₂; zero module | 2=1+0+1; 3=1+1+1; 4=1+1+2; 0=0+0+0 | Values pass; route needs R02 |
| `restrictAbsolute` | ℚ(i)/ℚ, conjugation and identity | Restriction sends i→−i and i→i; two distinct automorphisms | Pass; native restriction |
| `iota_restrictAbsolute_apply` | same, x=i | Both sides −i for conjugation, i for identity | Pass; delete characterization wrapper |
| `absoluteGaloisGroupExtend` | L=K; quadratic L/K | Identity extension gives identity homomorphism; quadratic image is subgroup of index 2 | Pass; native embedding |
| `scd_p_absoluteGaloisGroup_eq_two` | K=ℚ₂, ℓ=2,3; K=𝔽₂((t)) negative control | Dimensions 2,2; equal-characteristic cd₂=1, and ℚₚ-algebra hypothesis cannot hold | Pass; native theorem |
| `artinMap` | ℚ₂ on 2 and −1 | Unramified coordinate 1 for 2; −1 acts nontrivially on μ₄, i→−i | Pass; wrong zero map excluded |
| `denseRange_artinMap` | ℚ₂, unramified quotient ℤ/3 | 1,2,4 give exponents 0,1,2; reduction image all 3 elements | Pass; native theorem |
| `unramifiedCoordinate` | Frob, Frob⁻¹, inertia | Coordinates 1,−1,0 in Ẑ; geometric convention reverses first two | Pass; native coordinate |
| `unramifiedCoordinate_artinMap` | ℚ₂, x=8,1/2,3 | Both sides respectively 3,−1,0 | Pass; native theorem |
| `localArtinMap` | ℚ₂(ζ₅)/ℚ₂, x=2,8 | ζ₅→ζ₅² and ζ₅→ζ₅³; exponents 1,3 in C₄ | Pass; native map |
| `normResidue` | same unramified quartic; identity extension | Quotient generated by [2], size 4=Gal size; identity quotient and Gal both size 1 | Pass; native equivalence |
| `artinMap_restrict` | absolute symbol of 2 restricted to ℚ₂(ζ₅) | Both finite classes are Frob: ζ₅→ζ₅² | Pass; native theorem |
| `artinMap_norm` | ℚ₂(i)/ℚ₂, x=i; identity extension | N(i)=1 and both abelianized images are identity; L=K gives Art(x)=Art(x) | Pass; compatibility binder retained |
| `cyclotomicCharacter_artinMap_padic_uniformizer` | ℚ₂, x=2, μ₄ and μ₁₆ | Cyclotomic exponents 1,1; unramified coordinate still 1, not 0 | Pass; native theorem |
| `cyclotomicCharacter_artinMap_padic` | ℚ₂ units −1,−3 | Mod 4 exponent −1=3; mod 16 inverse of −3 is 5, versus uninverted 13 | Pass; native theorem |
| `cyclotomicCharacter_artinMap` | ℚ₂(i), u=i; ℚ₂, u=−3; nonunit 2 | N(i)=1 gives exponent 1; inverse −3 gives 5 mod 16. u=2 fails valuation=1 | Values pass; R02 |
| `globalArtinMap_quadratic_prime` | ℚ(i)/ℚ, primes 3,5; prime 2 | 3: Art=τ and f=2, true↔true; 5: Art=1 and f=1, false↔false; 2 excluded by ramification | True Check; delete target |
| `principalIdele` | ℚ, x=2,−1 | Every component is 2 or −1; class in Cℚ equals 1 in both cases | Pass; native embedding |
| `ideleNormMap` | ℚ(i)/ℚ, diagonal 1+i | All components become N(1+i)=2, the principal idele of 2 | Pass; native norm |
| `ideleClassNorm` | same principal class; identity extension | [1+i]=1 maps to [2]=1; L=K norm map is identity | Pass; native map |
| `card_ideleClassNormQuotient` | ℚ(i)/ℚ; ℚ(ζ₅)/ℚ; L=K | 2=2; 4=4; 1=1; nonabelian S₃ case would have quotient size 2, not 6, and is excluded | Pass; native theorem |
| `cyclicHasseNorm` | ℚ(i)/ℚ, x=3,5 | 3 fails at inert prime 3, so false↔false; 5=N(1+2i), true↔true | Pass; native theorem |
| `IsFiniteLocalNorm` | ℚ(i)/ℚ at 3, x=3,5; at 5 | v₃(3)=1 odd rejects 3; v₃(5)=0 admits 5; split algebra at 5 has norm (a,b)→ab, surjective | Pass; native predicate |
| `IsInfiniteLocalNorm` | ℚ(i)/ℚ at ∞, x=−1,5 | Complex norm x²+y² positive: −1 rejected, 5 accepted; a split real algebra admits both | Pass; native predicate |
| `IsLocalNormEverywhere` | ℚ(i)/ℚ, x=3,5 | Conjunction false for 3 (place 3), true for 5 (global norm witness) | Pass; native predicate |
| `isGlobalNorm_iff_isLocalNormEverywhere` | preceding 3,5; L=K | false=false, true=true; identity extension admits every x with witness x | Pass; native theorem |
| `isPrincipal_map_hilbertClassField` | ℚ(√−5), I=(2,1+√−5); I=0,1 | In H=ℚ(√−5,i), I becomes (1+i); (1+i)²=(2) as ideals since i is a unit. 0→(0), 1→(1) | Pass; substantive headline |
| Hilbert splitting target | K=ℚ; K=ℚ(√−5), prime over 2 | ℚ: 1 prime=degree1 and principal=true. Nonprincipal class over 2: 1 prime≠degree2 and principal=false | Pass; present |
| ray splitting target | ℚ, modulus 4∞, primes 3,5; trivial modulus | ℚ(i): counts 1≠2 and 2=2; ray classes 3≠1 and 1=1 mod4. Modulus1: 1=1, trivial class | Pass; present |
| conductor–discriminant target | ℚ(ζ₅), ℚ(ζ₈), ℚ(i), L=K | 125=1·5·5²; 256=1·4·8·8; 4=1·4; 1=1^φ(1)=1. Omitting cyclicity in V₄ would multiply by an extra conductor | Pass; substantive headline |
| `ringClassField_maximal` | ℚ; ℚ(√−5) | Both fields ℚ; both fields ℚ(√−5,i). General one-simp proof succeeds | Padding; delete |
| `numberFieldOrderToTauCeti` | ℤ[i], ℤ[2i], ℤ+2O_K for cubic K | Same subrings and indices 1,2,4 before/after; no quadratic restriction | Mathematically sound; remove adapter |
| `ringClassField` | ℤ[√−3], ℤ[2i], maximal ℤ[√−5] | Pic orders 1,1,2 give extension degrees 1,1,2 | Pass; native carrier |
| `ringClassArtinMap` | class-number-one ℤ[2i]; maximal ℤ[√−5] at nonprincipal prime | Every ideal maps to identity in first case; nonprincipal class maps to τ in second | Pass; native map |
| `ringClassArtinEquiv` | same orders | Cardinalities 1=1 and 2=2; principal class→1, nonprincipal class→τ | Pass; native data |
| `gal_ringClassField_equiv_pic` | same | Inverse bijections exist on singleton and C₂; explicitly inverse of preceding data | Hygiene/padding; delete |
| `finiteHilbertInvariantAt` | ℚ, (3,7) at 2,3,7 | Values 1,0,1 in ℤ/2; at 3, 7≡1 is a square so 0 | Pass; native map |
| `infiniteHilbertInvariantAt` | ℚ, (−1,−1),(3,7) | Real values 1,0 in ℤ/2; complex value always 0 | Pass; native map |
| `finiteHilbertSupport` | ℚ, units a=b=1; (−1,−1) | Only primes over 2 need inclusion for units; outside 2 the symbol is 0. For (−1,−1), sole nonzero finite term is at 2 | Pass; support may overestimate |
| `hilbertProductFormula` | ℚ, (3,7),(−1,−1),(1,1) | In ℤ/2: 1+0+1+0=0; 1+1=0; 0=0 | Pass; native theorem |
| Formation levels/normal layers, §2.1 | G=1, A=ℤ; local quadratic layer | First ground ℤ, Γ=1, N=id, quotient0; second ground ℚ₂ˣ, Γ=C₂, quotient order2 | Pass; corrects R03 |
| Nonabelian layer/abelianization | S₃ and Q₈; cyclic C₄ | Abelianizations C₂, C₂×C₂, C₄, of orders 2,4,4; not the original orders 6,8,4 | Pass; norm limitation uses abelianization |
| Class-formation invariant normalization | unramified degree6, intermediate degree2 | inv(u)=1/6; restricted inv=2/6=1/3, order3. Zero invariant not injective | Pass |
| Fundamental restriction, §2.3 | indices [U:V]=4, [U:U′]=2 | res(u) invariant 2/4=1/2 equals fundamental invariant in degree2 | Pass |
| Fundamental corestriction, §2.3 | same | cor(u′) invariant 1/2 equals inv(2u)=2/4; incorrect index reversal gives 1/8 | Pass |
| Fundamental inflation, §2.3 | [U:V]=4, [V:V′]=3 | inf(u) invariant1/4 equals inv(3u′)=3/12 | Pass |
| Tate–Nakayama Tor condition | M=ℤ/2,C=ℂˣ; M=ℤ | Tor₁=μ₂ of size2≠0, excluded; Tor₁(ℤ,C)=0 | Pass |
| Inverse Artin convention, §2.5 | ℚ₂(ζ₅), uniformizer2 | Arithmetic action ζ→ζ²; inverse action ζ→ζ³; 2·3=1 mod5 | Pass; distinguishes inverse |
| Character formula | cyclic quartic, generator a, character g→1/4 | χ(Art a)=1/4 and invariant cup=1/4; inverse map gives 3/4 | Pass |
| Generic Tate res/cor, Layer0 | trivial C₄-module ℤ, subgroup C₂, degree0 Tate class1 | res 1 mod4→1 mod2; cor→2 mod4 = index2·1 | Pass |
| Generic periodicity/Herbrand quotient | trivial cyclic C₂ on ℤ and ℤ/2 | ℤ: Ĥ⁰=C₂,Ĥ⁻¹=0,h=2. ℤ/2: both C₂,h=1; finite-module quotient1 | Pass |
| Projective/cohomologically trivial API | regular ℤ[C₂]; trivial ℤ | Regular Tate groups0; trivial module Ĥ⁰=C₂, hence not cohomologically trivial/projective | Pass; hypotheses distinguish |
| Norm/transfer/inclusion diagrams | C₄⊃C₂; V₄⊃C₂ | C₄ transfer g→g², quotient kernel C₂; inclusion image size2. V₄ transfer g→g²=1, quotient image size2 | Pass; previous false Check repaired |
| Local Kummer scope, Layer5 | char2, n=2; char0,n=2; n=1 | μ₂(separable closure) size1 in char2 versus size2 in char0; n=1 quotient/H¹ both1 | Pass; invertibility is essential |
| Local Brauer res/cor, Layer5 | degree2 local extension, inv=1/4 | Restriction gives1/2; cor of invariant1/2 remains1/2; cor∘res=2·1/4 | Pass |
| Local Hilbert bilinearity | ℚ₂, a=b=−1, fixed second slot −1 | Symbol(1,−1)=0; symbol(−1,−1)+itself=1+1=0 mod2 | Pass |
| Steinberg relation | ℚ₂, a=3,b=−2 with a+b=1 | (3,−2)₂=+1, additive0; unrelated (−1,−1)₂=−1 | Pass |
| Antisymmetry/nondegeneracy | ℚ₂ square classes | Pair (−1,−1) gives1=−1 mod2, consistent; −1 detected by −1; 5 detected by 2, with (5,2)₂=−1 | Pass |
| Local finiteness in the README | trivial 𝔽_p over 𝔽_p((t)) | H¹ contains infinitely many independent negative t-powers modulo Artin–Schreier; n=p not invertible, excluded by the pinned theorem but not by the README sentence | Missing hypothesis; R04 |
| Finite unramified normalization | ℚ₂(ζ₅), x=8; L=K | Frob³ sends ζ₅→ζ₅⁸=ζ₅³; identity case ℤ/1 has one element and Art=1 | Pass |
| Root prime-to-q requirement | ℚ₂, m=2, ζ=−1 | Art fixes −1, but ζ²=1≠−1; m not prime to q=2 | Pass negative control |
| Local H³/dimension | ℚ₂, μ₂; equal characteristic2 | H²(μ₂)=C₂ nonzero gives lower bound2; H³((Kˢ)ˣ)=0. Equal-characteristic cd₂=1, not2 | Pass at stated scopes |
| Local norm subgroups/correspondence | ℚ₂ squares; trivial layer | Square subgroup index8 ↔ ℚ₂(i,√2,√5) degree8; whole ℚ₂ˣ ↔ degree1 field ℚ₂ | Pass |
| Correspondence direction | unramified degrees2,4 over ℚ₂ | Norm valuation subgroups2ℤ⊃4ℤ, indices2,4; fields have containment degree2⊂degree4 | Pass |
| Local existence in equal characteristic | 𝔽₂((t)), prime-to-2 unramified degree3 | Norm valuations3ℤ, units all norms, quotient C₃; pro-2 principal units map trivially in this quotient | Pass; does not assert full Artin kernel |
| Absolute Artin density/non-surjectivity | unramified coordinate | Integers reduce onto every ℤ/n; integers form a proper subset of Ẑ | Pass; dense does not mean onto |
| Weil group/topology | identity extension; unramified degree2 | Degree map onto ℤ; inertia degree0 open. Image degree subgroup2ℤ has index2; G_K inertia not open since quotientẐ infinite | Pass |
| Weil degree functoriality | unramified degree2; totally ramified degree2 | deg_K=2deg_L in first, =deg_L in second; at deg_L=1 values2 versus1 | Pass |
| Archimedean invariants | ℝ,ℂ | Brauer groups C₂,0; complex norm image positive reals; −1 maps to conjugation over ℝ | Pass |
| Global Brauer sum | Hamilton quaternion class over ℚ | 1/2 at2 and∞, sum1=0 in ℚ/ℤ; deleting∞ leaves1/2≠0 | Pass |
| Noncyclic idele H² lifting obstruction | ℚ(√13,√17)/ℚ | All local degrees≤2, so idele H² killed by2; class-formation H² contains order4 element of invariant1/4 | Pass; no universal direct lift |
| Global invariant/refinement | cyclic quartic and degree8 refinement | Fundamental invariants1/4,1/8; inflation of first=2·second with invariant1/4 | Pass |
| Global Artin principal/tower/local laws | ℚ(ζ₅), principal2 | Local factors at2 and5 are [2] and [3]; product[6]=[1]; restriction to ℚ(√5) is nontrivial at2 | Pass |
| General global Frobenius and quadratic checks | ℚ(√5), primes11,19,2,7 | Residues1,4 are squares mod5, Art=1; residues2,2 nonsquares, Art=τ | Pass |
| Global cyclotomic checks | m=5,ℓ=2,3,11; m=8,ℓ=3,5,7 | Exponents2,3,1 mod5 and3,5,7 mod8; m=1 unique automorphism; m=2 fixes−1 | Pass |
| Global existence/index | ray subgroup4∞ in Cℚ | Index2 and field ℚ(i), degree2; whole Cℚ gives ℚ, degree1 | Pass |
| Admissible modulus/conductor | ℚ(i), moduli1,4,4∞ | Ray groups at1 and4 without∞ are trivial, cannot surject to C₂; 4∞ has order2 and works | Pass |
| Abelianity in ramification/conductor | splitting field of x³−2 over ℚ | G=S₃, abelianization C₂, abelian subfield ℚ(ζ₃) conductor3∞; original extension ramifies at2 | Pass; claimed implication needs abelianity |
| Composita/intersections | distinct D₄ extensions with same V₄ subfield | Fiber product order16; commutator diagonal C₂, abelianization order8; old common abelian subfield degree4 | Pass with distinctness understood |
| Hasse norm noncyclic control | ℚ(√13,√17), x=25 | Local norms: valuations0 at2,2 at5; 25≡5² mod13,17; positive at∞. Global norm obstruction nonzero (not recomputed from a readable cited proof) | Local checks pass; global obstruction uncertified |
| Principalization worked example | ℚ(√−5), I over2 | Norm_K(I)=2; Norm_H(I O_H)=4=Norm_H(1+i); (1+i)²=(2) as ideals | Pass |
| Hilbert versus narrow field | ℚ(√3) | Ordinary class number1; no norm−1 unit, narrow class number2; H=K, H⁺=K(i) | Pass |
| Cyclotomic least levels | ℚ(√5),ℚ(i),ℚ(√2) | Levels5,4,8; conductor norms5,4,8; none ≡2 mod4 | Pass |
| Ring orders generality | ℤ[√−3],ℤ[2i], cubic ℤ+2O_K | First two Pic sizes1,1; cubic order index4 still legitimate; no degree2 requirement in source or pin | Pass |
| Hilbert versus sign convention | ℚ,(3,7),(−1,−1) | Additive sums 1+1=0 mod2; multiplicative products (−1)(−1)=+1 | Pass; identifies coordinates |
| Total functions and excluded degeneracies | n=0,1; zero ideal; zero module; zero ring; inseparable quadratic extension | n=0 excluded in Euler/Kummer isos; n=1 gives cardinal1; zero ideal principal; zero module gives cardinal identity 1=1 and rank identity 0=0; zero ring not a Field; inseparable extension fails IsGalois | Pass at intended signatures |
| Schmidt comparison controls | ℚ₂ and ℚ₂(i); ℂ₂ negative control | Normalized v(2)=1,2 respectively, but same restricted ordering; ℂ₂ is not finite over ℚ₂ and not locally compact | Mathematical comparison plausible; missing named build input R02 |

## Not verifiable

- **Automatic valuation compatibility:** the Schmidt reference has no theorem/page locator. The source service found EuDML's bibliographic record (`schmidt1933`, volume 108, pp.1–25) and its GDZ link, but extracted only catalogue/viewer text, not the article. No readable theorem was obtained; OCR is unavailable. A general henselian statement must not be certified merely from this metadata. The finite complete-field application remains the explicit missing route input R02.
- **Settled access restrictions, not renewed requests:** `neukirch-ant` Chapters VI–VII, `serre-local-fields` IX §§3–5 and XI–XIV, and `nsw` (7.1.8),(7.2.5),(7.2.6),(7.3.1)–(7.3.4) remain uncertified. `artin-tate` remains waived. Their mathematical content was not inferred from their titles.
- **Other cited works:** the sources service was tried for `tate1952`, `nakayama1957`, `serre-galois`, `brown-cohomology`, `rim1959`, `lang-algebra`, `cox-primes`, `weil1951`, `tate-corvallis`. Tate/Nakayama/Rim resolved to JSTOR landing pages without certified open text; Serre to a paywalled Springer DOI; Brown/Lang searches failed; Cox encountered arXiv/Crossref rate limits; Weil reached Project Euclid without a PDF link; Corvallis reached an access-broker page. arXiv searches returned 429/503. These were recorded together in `needs-references.toml`; no manifest was edited and no approval or parking request was made. The checked Milne and Kopp–Lagarias texts provide the overlapping mathematics actually certified above.
- **The global nonnorm assertion for 25 in ℚ(√13,√17):** local norm conditions and the degree-four idele-lifting obstruction were computed, but neither alone proves that particular scalar is not a global norm. The README supplies no exact locator for its nonnorm proof; that part of the worked example remains uncertified here.
- Ownership against the two unsupplied close open roadmaps named above was not checked. The 334-name inventory is not a semantic reproof of the full pinned class-field-theory library. No source-copying allegation is made for texts unavailable to this review.

## Source issues

- **Misprint** in milne-cft at V Remark 3.26(e), printed p.165, line 7412: the source says a Galois extension K/ℚ has primes described by an undefined L/K Frobenius; it should consistently name a Galois extension L/K and primes of K unramified in L; affects nothing.
