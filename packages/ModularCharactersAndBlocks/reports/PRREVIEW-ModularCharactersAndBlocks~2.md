# Review of ModularCharactersAndBlocks (pull request #1775 at 4b23da3)
Folder: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`
**Verdict:** needs changes

🤖 Independent AI review. Eleven findings: two P1, five P2 and four P3. The scope is repairable; this is not a rejection of the subject. No pull-request file was changed.

## R01 (P1) — Replace the nonexistent native scalar-extension supplier

**Location:** `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md:60–61`, “`groupAlgebraBaseChangeK0`”.

**Claim:** This is supplied by the pinned native library and can support M2's scalar-extension comparisons.

**Witness:** At Tau Ceti `358314d4` and Mathlib `f6090c70`, a whole-source search finds no `groupAlgebraBaseChangeK0`. ModularInduction Layer 1 instead plans `modRepK0.baseChange` at `TauCetiRoadmap/RepresentationTheory/ModularInduction/README.md:227–231` on main.

**Repair:** Cite ModularInduction Layer 1's field-extension ring homomorphism and its restriction/induction compatibility as a roadmap contract; remove the assertion that this native declaration exists. This needs no new owner or declared gap: the cited main-branch target exists. For `G = 1` and `𝔽₂ → 𝔽₄`, its specified action sends the simple class `1` to `1`, exactly the comparison M2 needs. Do not replace it by a second Grothendieck-group construction.

## R02 (P1) — Clear the failing targeted-build gate

**Location:** `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/Suggested.lean:2–6`.

**Claim:** The acceptance build must have only `sorry` warnings.

**Witness:** The supplied gate records `build=5 FAIL`: each Mathlib submodule import generates a module-system warning. Independent `lake env lean` exits successfully with two `sorry` warnings; that does not clear the recorded targeted-build failure.

**Repair:** Apply R10's import repair, then rerun the targeted build and gate until these five diagnostics disappear. A scratch version with `import Mathlib` followed by the used Tau Ceti module elaborated with only `sorry` warnings. Do not add `set_option` or change pins. This is a gate failure, not a claim that either theorem fails to elaborate.

## R03 (P2) — State the block partitions instead of bijecting simples with blocks

**Location:** `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md:237–238`, “The finite classes of ordinary irreducibles, the modular simple modules and the idempotents must be linked by proved bijections.”

**Claim:** As written, the modular simple modules are among the sets to be related bijectively to block idempotents.

**Witness:** The roadmap's S₃, `p = 3` example has three ordinary irreducibles, two modular simple isomorphism classes, and one block idempotent. The cardinalities are `3`, `2`, `1`, respectively.

**Repair:** Specify surjections from ordinary irreducibles and modular simple isomorphism classes to blocks, with fibres `Irr(B)` and `IBr(B)`. Bijections are between the resulting block partitions and primitive central idempotents in `O[G]` and `k[G]`. If “classes” meant these partitions, say so for both sorts. On this S₃ example both quotient sets have cardinality `1`, while their unique fibres have sizes `3` and `2`; those are the correct bijections. Martínez Definition 2.1, p.9, and Theorem 2.11, p.15, distinguish these objects (`martinez` lines 365 and 648).

## R04 (P2) — Import the existing element decomposition

**Location:** `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md:130–131`, “Construct the commuting `p`-part and `p'`-part of every element. Prove uniqueness”.

**Claim:** M0 owns this construction, its uniqueness and conjugation laws.

**Witness:** `TauCeti/GroupTheory/OrderOfElement/PPart.lean:69,132,170,188,199,208,215,245,272` already defines `pFreePart`, `pPart` and proves uniqueness, commutation, product, conjugation and order formulas at the pin.

**Repair:** Delete the duplicated construction and laws from M0's build targets and list these exact native suppliers. Retain genuinely additional section parametrizations and missing transport laws. For a generator `g` of C₆ at `p = 2`, the imported parts are `g³` and `g⁴`; their orders are `2` and `3`, and their product is `g`. Use this to identify the conventions. Do not confuse the native induction library's sections indexed by the prime-to-`p` part with this roadmap's sections indexed by the `p`-part.

## R05 (P2) — Consume complete-adic lifting already present at the pin

**Location:** `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md:20–22,163–164`, “Lifting through the maximal ideal of a complete DVR is a separate completeness argument in M1”.

**Claim:** M1 must construct the complete-adic idempotent and projective-module lifting argument.

**Witness:** `TauCeti.IsAdicComplete.exists_isIdempotentElem_eq`, `TauCeti/RingTheory/AdicCompletion/Idempotent.lean:75`, handles complete algebras. `TauCeti.exists_projective_quotient_smul_top_linearEquiv`, `TauCeti/Algebra/Module/Projective/Lift.lean:89`, lifts projective summands.

**Repair:** Import these theorems. Keep the adapters proving completeness, identifying the residue quotient and maximal ideal, and the additional centrality/uniqueness comparisons. State precisely what is additional. For `O = ℤ₂`, `G = 1`, the idempotents `0,1` of `𝔽₂` lift to `0,1`, and a rank-one projective lifts to rank one. The supplier applies even though `(2)` is not nilpotent; the README correctly rejects a nilpotent-kernel argument but overlooks its native complete-adic replacement.

## R06 (P2) — Include statable headlines and account for the remaining headlines

**Location:** `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/Suggested.lean:9–13,33–45`; README M3–M8, particularly `README.md:287`.

**Claim:** Two selected algebraic targets suffice in place of a headline acceptance test, without identifying unstated headlines or their missing carriers.

**Witness:** A scratch file elaborated “the principal block has exactly the Sylow subgroups as defect groups” using the existing projection, primitive central idempotents, coefficient-sum augmentation, `IsPGroup` and `Sylow`, plus one actual maximal-nonvanishing predicate.

**Repair:** State this headline and audit the other end theorems listed below. For each omitted headline, identify the precise missing carrier in the module docstring, after checking whether a few simple native definitions suffice. Do not use arbitrary predicates or weaker substitutes. The tested defect predicate is: `P` is a `p`-group, `Br_P(b) ≠ 0`, and every larger `p`-subgroup with nonzero Brauer image equals `P`. For S₃ at `p = 2`, the principal idempotent is `1+r+r²`, its image at `⟨t⟩` is `1`, and the maximal such subgroups are exactly the three Sylow C₂ subgroups. For the trivial group the unique defect subgroup and unique Sylow subgroup are both trivial.

## R07 (P2) — Give the actual orthogonality and integral-lattice statements

**Location:** `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md:251–253,258–263`, “their section orthogonality, the class-algebra coefficient formulas, and the corresponding integral change-of-basis statements”.

**Claim:** This specifies enough to implement the generalized-decomposition and within-section comparisons.

**Witness:** For C₂ at `p = 2`, the generalized character-value matrix is `[[1,1],[1,−1]]`, determinant `−2`; its inverse has halves. For S₃, the full column Gram matrix is `diag(6,2,3)`.

**Repair:** State each identity with index sets, conjugations, centralizer factors and coefficient rings. Distinguish integral coefficients from an integral basis isomorphism: the displayed C₂ matrix is not invertible over the integers or over 2-local integers. Name the two lattices if an integral change of basis is intended. State the promised block-restricted within-section Cartan formula as a target in M7; merely saying it “belongs” there leaves no formula to prove. The repaired normalization must reproduce the C₂ determinant and S₃ factors above. This is an underspecified target, not a finding that the explicitly written cross-section zero formula is false.

## R08 (P3) — Attach exact source locators to the mathematical targets

**Location:** `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md:130–369,373–379`.

**Claim:** The bibliography's “Part III”, book titles and “Chapters 2–6” locate all the preceding assertions.

**Witness:** None of M0–M8 attaches a theorem number and page to an individual claim. The worker found no heading-based sample targets. The source sample below records support, narrower settings and unavailable text separately.

**Repair:** Attach verified locators at each target, including definitions and proof inputs; distinguish any adaptation from the exact source theorem. For example, the Brauer basis/count target is Martínez Theorem 1.9, p.5 (`martinez` line 219), and primitive central block idempotents are Theorem 2.11, p.15 (line 648). On S₃ at `p = 3`, these give two simple Brauer characters and one block, respectively. Retain unavailable references as uncertified instead of implying that their contents were checked. No manifest was edited in this review.

## R09 (P3) — Restore per-definition APIs, discriminating Checks and dependencies

**Location:** `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md:3,13,69,114–369`.

**Claim:** The milestone table and final examples provide the required roadmap structure and acceptance Checks.

**Witness:** There are zero `**Checks.**` lists, zero `*Needs:*` lines, and no per-layer Examples/Dependencies sections. M6's Brauer-pair inclusion is requested without a defining relation. The final Cartan examples are symmetric and cannot detect transposition.

**Repair:** Use the required Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, numbered Layers, Downstream consumers and References sections. Give each introduced definition its precise API and at least three discriminating Checks; put target-specific dependencies beside the target. Define pair inclusion and defect before using their laws. Useful existing computations below distinguish nonfixed inputs (`1 ≠ 0`), wrong characteristic (`2 ≠ 0`), and the wrong subgroup prime (`1+r+r² ≠ 0`). To test the native/transposed Cartan interface, use an asymmetric supplier example, such as native A₂ `[[1,0],[1,1]]` versus its transpose. This is a Check of transport, not a new quiver target.

## R10 (P3) — Fix the imports and acceptance-file form

**Location:** `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/Suggested.lean:1–13,21–45`.

**Claim:** The file meets the import and target-signature form rules.

**Witness:** The gate reports `imports=1`, `mathlib-subimports=5`, `no-import-mathlib=1`. None of the four local declaration names appears in the README; the theorem at line 33 has no docstring, and M6 precedes M0.

**Repair:** Replace the five Mathlib subimports by a first `import Mathlib`, followed by the used Tau Ceti import. Use the “target signatures” module docstring, add the mathematical theorem docstring, introduce the four kept names in the README, and put layer comments and targets in README order. R06 covers the missing mathematical content separately. The repaired import header was tested in the scratch headline probe and elaborated; do not prove or delete the two nontrivial existing targets merely to satisfy a size preference.

## R11 (P3) — Remove the pull-request citation from the roadmap

**Location:** `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md:47–50`, “LocalFiniteGroupTheory [#1634]”.

**Claim:** A pull-request number and “that proposal's cores” are suitable permanent supplier locators.

**Witness:** The dependency is identified by review-process metadata rather than only a roadmap name and section. The supplied scanner reports `prnum=0`, but this explicit numbered link remains in the file.

**Repair:** Cite LocalFiniteGroupTheory L1 by roadmap name and section, with its exact prime-to-`p` core contract. Remove the pull-request link and proposal terminology. The mathematical test remains S₃ at `p = 2`: the core is C₃ and equals the intersection of the trivial/sign kernels. Its open source files were not supplied for substantive verification; that limitation is recorded below rather than treated as evidence of a missing theorem.

## Verified sound

This section records finite-instance evidence and the checks actually performed; it does not certify every general statement. All four Lean signatures were printed together in a scratch copy and compared with the README. No required section binder disappeared. Both existing theorems survived the `simp`, `rfl` and `infer_instance` one-tactic probes. Reading the pinned idempotent uniqueness theorem confirmed that it supplies isomorphisms of left ideals, not equality of central idempotents by one application. No padding finding was established.

The worktree head is exactly `4b23da3e20ae2d849ec6477eb8ec32c117f176ed`; the worktree was clean. The specified outside-folder diff was empty. Family-index changes are within the authorization. The requested original-file elaboration exited 0 with exactly two `sorry` warnings. No sorry'd data, `set_option`, algorithms, route-specific good-prime restrictions or external instructions were found in the reviewed folder. The nine-layer dependency table is acyclic as written, but is too coarse to replace per-target dependencies.

The dependency command returned exactly:

```text
depcheck: 205 roadmaps, 1645 edges, 0 problem(s)
```

There was no `UPWARD`, `CYCLE` or `moved:` line. There are no `*Needs:*` lines to inspect. This result does not validate a nonexistent library declaration (R01) or the contents of an unavailable supplier. The supplied gate result remains:

```text
gate ModularCharactersAndBlocks: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=1 mathlib-subimports=5 no-import-mathlib=1 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=5 FAIL
```

R02 and R10 cover every failing rule and all five build diagnostics. The citation resolver returned no missing roadmap citations, but explicitly said it had not checked pinned library names; direct pin inspection found R01. Its clean result therefore does not contradict that finding.

**Pinned declarations opened.** Tau Ceti pin `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`; Mathlib pin `f6090c7095e1e56b3464c1daba5f24631f1290d2`. Paths in this table are relative to the named library repository. These are 18 inspection groups, not 18 newly proposed targets.

| Object / exact declaration | File and line at the pin | What it supplies, and what it does not |
| --- | --- | --- |
| `TauCeti.pFreePart`, `TauCeti.pPart`, `eq_pFreePart`, `eq_pPart` | `TauCeti/GroupTheory/OrderOfElement/PPart.lean:69,132,170,272` | Actual factors and uniqueness; finite-order hypotheses for order statements. |
| `commute_pFreePart_pPart`, `pPart_mul_pFreePart`, `pPart_conj`, `orderOf_pPart` | Same file:188,199,215,245 | Correct product order and conjugation. No new definition needed. |
| `TauCeti.IsPrimitiveIdempotent` | `TauCeti/RingTheory/Idempotents/Primitive/Basic.lean:88` | Includes idempotence, nonzero and indecomposability; centrality comes from the carrier used here. |
| `CompleteOrthogonalIdempotents` | `Mathlib/RingTheory/Idempotents.lean:129` | Orthogonal idempotents summing to one; does not itself require primitive or nonzero terms. |
| `exists_isIdempotentElem_eq_of_ker_isNilpotent`, `CompleteOrthogonalIdempotents.of_ker_isNilpotent` | `Mathlib/RingTheory/Idempotents.lean:249,405` | Nil-kernel results; the latter lies in the commutative-ring section. They do not justify a nonnilpotent DVR ideal. |
| `TauCeti.exists_completeOrthogonalIdempotents_isPrimitiveIdempotent` | `TauCeti/RingTheory/Idempotents/Primitive/Decomposition.lean:223` | Existence under `IsArtinianRing`. |
| `CompleteOrthogonalIdempotents.exists_equiv_linearEquiv_span_singleton` | Same file:185 | Matches left ideals up to linear equivalence; does not directly prove the proposed central-element equality. |
| `TauCeti.IsAdicComplete.exists_isIdempotentElem_eq` | `TauCeti/RingTheory/AdicCompletion/Idempotent.lean:75` | Lifts idempotents when the algebra is adically complete and the kernel equals the indicated ideal multiple. |
| `TauCeti.exists_projective_quotient_smul_top_linearEquiv` | `TauCeti/Algebra/Module/Projective/Lift.lean:89` | Lifts an explicitly split summand; requires completeness of the endomorphism module. |
| `TauCeti.IsProjectiveCover`, `exists_isProjectiveCover_of_finite` | `TauCeti/Algebra/Module/ProjectiveCover/Basic.lean:106`; `Existence.lean:195` | Projective covers over algebras finite over an Artinian ring. |
| `Ideal.nonempty_linearEquiv_of_quotient_smul_top` | `TauCeti/Algebra/Module/Projective/Reduction.lean:73` | Radical-quotient uniqueness with projectivity and coatomic submodule lattices. |
| `TauCeti.projectiveSimplePairing`, `projectiveSimplePairing_isPerfPair`, `cartanMatrix` | `TauCeti/RepresentationTheory/GrothendieckGroup/CartanMatrix.lean:77,115,138` | Chosen exhaustive nonisomorphic families; the pairing is coordinate-dual. Cover compatibility is extra. Rows of Cartan are simples, columns projectives. |
| `TauCeti.resK0`, `TauCeti.indK0` | `TauCeti/RepresentationTheory/GrothendieckGroup/GroupAlgebra/Restriction.lean:70`; `Induction.lean:91` | Exact restriction and finite-index induction via coinduction. |
| `TauCeti.reductionK0` | `TauCeti/RepresentationTheory/GrothendieckGroup/GroupAlgebra/LatticeDefect/Basic.lean:96` | Reduction of a finitely generated integral representation; not all `O`-lattices. M1's general lattice comparison remains additional work. |
| `TauCeti.ClassFunction.indVirtualCharacters_eq_virtualCharacters_isElementary` | `TauCeti/RepresentationTheory/Induction/Brauer/Induction.lean:82` | Ordinary virtual-character induction, algebraically closed characteristic zero. M2 still needs the elementary modular comparison. |
| `FDRep.exists_simple_nonempty_iso_baseChange_of_isPrimitiveRoot` | `TauCeti/RepresentationTheory/Induction/Cyclotomic/SplittingField.lean:107` | A simple model over the root-containing characteristic-zero field, scalar endomorphisms, common universe. M1 must supply its adapters. |
| `TauCeti.Representation.primitiveCentralIdempotent`, `TauCeti.Cyclotomic.complexRoot` | `TauCeti/RepresentationTheory/CharacterTable/CentralIdempotent.lean:303`; `TauCeti/RingTheory/Cyclotomic/Basic.lean:460` | The first explicitly requires finite dimension, algebraic closure, irreducibility and invertible group order. The root is primitive only for nonzero exponent. |
| DVR instance on `HeightOneSpectrum.adicCompletionIntegers` | `Mathlib/NumberTheory/NumberField/Completion/FinitePlace.lean:75` | The promised completed valuation ring really is a DVR. It does not by itself identify its residue field with `𝔽_p(ζ_e')`. |

**Resolved roadmap ownership.** Main-branch sources, rather than revisions of existing roadmaps, were used for six suppliers. Three nearby main roadmaps were also inspected for form: CharacterTheory, ModularInduction and GrothendieckEulerForms.

| Supplier citation | Resolved location on main | Result |
| --- | --- | --- |
| SemisimpleAlgebras, simple-module/radical dictionary | `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md:176–180,186–233` | Correct division of ownership; semisimplicity of the quotient does not imply semisimplicity of `k[G]`. |
| QuiverRepresentations Layer 3 | `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/README.md:270–305` | Covers, radical powers and composition-factor Cartan matrix are there. Its orientation is `[P_i:S_j]`, the transpose of the native matrix. |
| ModularInduction Layers 0–3 | `TauCetiRoadmap/RepresentationTheory/ModularInduction/README.md:174–292` | Exact classes, simple basis, restriction, induction and integral reduction are there. Field base change is a planned Layer 1 contract, not the claimed native name. |
| GrothendieckEulerForms | `TauCetiRoadmap/GrothendieckEulerForms/README.md`, Layers 1–4 | Exact/split groups, projectives, Cartan map and pairings are owned there; the target should cite these layers explicitly. |
| CharacterTheory §4.5 and ordinary central characters/idempotents | `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md:499–519,741–759,817–831` | Splitting realization and ordinary idempotents are supplied. The non-algebraically-closed coefficient comparison is a legitimate additional target. |
| InductionRestriction Layer 6 | `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md:661–719` | Ordinary Brauer induction and cyclotomic descent are present. |

Object searches used the roadmap index, main, the board packages and available open-checkout text. The supplied RepresentationTheory revisions still exclude general modular blocks; AbelianSurfacesModularity has A₅-specific modular tables, not this general block library. SheafTheoreticSmithTheory's Smith/Brauer operations have different carriers. No collision of the four proposed fully qualified Lean names was found. This folder can own the general modular block theory after deleting the pinned duplicates in R04–R05. The index additionally exposed Brauer-character targets in GL2AutomorphicRepresentationsAndTransfer R17.5, but that checkout was not provided in the brief; no ownership finding is inferred from a truncated search hit. Ownership against open pull requests without supplied files was not checked substantively. No later supplier was introduced or moved by this review.

**Headline inventory and acceptance coverage.** The README's deep results are: modular-system existence and splitting; stable-lattice independence; Brauer-character basis and recognition; decomposition-map surjectivity; Brauer reciprocity, projective/Brauer duality and `C = DᵀD`; integral/modular block comparison; generalized decomposition and section orthogonality; Brauer multiplicativity and its relative-trace kernel; Brauer-pair/defect classification and principal Sylow defect; Brauer's first, second and third main theorems; normal-subgroup block comparisons; and the ordinary principal-block kernel equality. Suggested.lean states only Brauer multiplicativity and central block-idempotent uniqueness. The latter is a legitimate M0 theorem; neither is padding under the tested criterion. The principal-Sylow headline is demonstrably statable with one simple native predicate. The other omissions receive no missing-carrier account in the module docstring; their formalization needs must be assessed explicitly, not replaced by selected easier statements.

**Sources and sample.** No source manifest existed and none was created or changed. Six cited works were requested through the sources service. The accessible texts were the [Martínez course notes](https://www.uv.es/jomimar8/pdfs/course%20notes.pdf) (`martinez`) and the two pinned Axiom files (`axiom-third`, `axiom-section`). Axiom helper files were fetched through the same service under the same work key. Source line numbers below refer to the service's numbered text; printed pages are stated separately.

The worker supplied no actual sampled targets (“none found by heading”), and the README flags no locator as unverified. To avoid treating that as a source audit, I sampled 15 of 24 explicit claim groups, using seed `0x4b23da3` and sorted the sample by README line. The pool's start lines were `130,139,147,159,163,168,174,179,184,193,216,233,248,255,268,277,281,306,312,322,333,340,347,360`. This is a reproducible reviewer sample, not a claim to have recovered missing worker selections.

| Sample target (README line) | Text actually opened and comparison | Result |
| --- | --- | --- |
| M0 factors (130) | `martinez` lines 165–167, p.3; native factor uniqueness as above | Decomposition supported; the full requested transport API is not individually located in the notes. |
| M1 lattices (159) | `martinez` lines 188–203, Theorem 1.7 and Lemma 1.8, p.4 | Integral realization/reduction is supported over the notes' localization of algebraic integers; arbitrary complete-DVR lattice independence is not proved at this locator. |
| M1 lifting (163) | Native complete-adic and projective-lifting declarations opened | Existence is already supplied; the books' exact locator and central-uniqueness argument remain unverified. |
| M2 character definition (168) | `martinez` lines 122–157, Lemmas 1.1–1.2, pp.2–3 | Lifted roots, class invariance, inverse/dual and restriction match; the notes use an algebraically closed residue field. |
| M2 basis (179) | `martinez` lines 174–177 and 219–241, Proposition 1.5, p.3, Theorem 1.9, p.5 | Basis and number of regular classes match the algebraically closed stage. |
| M2 finite residue splitting (184) | Compared against `martinez` lines 125–132 | Not supplied there: the notes choose the algebraic closure, whereas this target must descend to finite `k`. |
| M4 block comparison (233) | `martinez` lines 365–398 and 638–672, Definition 2.1, p.9, Theorems 2.11–2.12, pp.15–16 | Block partitions and modular projectors supported. R03's individual-simple bijection is not. Complete-DVR comparison needs an additional locator. |
| M5 generalized numbers (248) | Searched the accessible course text; bibliography checked | No precise generalized-number theorem located in that text; Navarro/Alperin full texts unavailable. |
| M5 cross-section orthogonality (255) | `axiom-section` lines 17–24, pinned `BlockSectionOrthogonality.lean` | Same finite-group, prime, residue-place, block and nonconjugate-`p`-part hypotheses. Supports the displayed zero identity. |
| M6 Brauer map (268) | `martinez` lines 887–921, Theorem 4.1, pp.23–24 | Source states the central restriction. The orbit-count argument applies to invariant coefficients, but the full fixed-algebra formulation needs to be identified as an extension. |
| M6 relative-trace kernel (277) | `martinez` Lemma 4.2, p.24, inspected in context | Its kernel description concerns the central map/class sums, not the stated sum of proper-subgroup trace ideals. General source locator unverified. |
| M7 first main (306) | `martinez` lines 1083–1121, Theorem 4.10, pp.27–28 | Normalizer version is present. Intermediate `H` follows by applying this to `G` and `H` and identifying their normalizers of `D`; record that adaptation. |
| M7 third main (322) | `martinez` lines 1354–1372, Theorem 5.8 and Corollary 5.9, pp.34–35; `axiom-third` lines 45–55 | Defined-block principal criterion and the stated local `P C_G(P) ≤ H ≤ N_G(P)` iff are supported. Existence for the general defect-centralizer hypothesis needs its own locator. |
| M8 normal-`p` quotient (333) | `martinez` lines 316–327, Theorem 1.14, pp.6–7; lines 1895–1974, Corollary 8.2 and Theorem 8.5, pp.51–53 | Trivial normal-`p` action and the distinction between domination and a block bijection are supported. |
| M8 ordinary kernel equality (347) | Searched the accessible notes' kernel and principal-block sections | No locator for the equality found; the normal-`p` Brauer-kernel theorem is different. Text certification unavailable. |

The Axiom citations were also checked beyond their exported names. In `axiom-section`'s `BlockOrthogonality.lean`, lines 70–105 apply a local matrix trace theorem to an idempotent commuting with the two-sided permutation. `PermutationTrace.lean`, lines 95–102, requires a finite permutation, a fixed-point-free `p`-part, a local integral coefficient ring, idempotence and commutation. Its proof at lines 104–132 uses a primitive `p`-th root with residue one. `BimoduleTrace.lean`, lines 60–65, identifies the trace with `Σ χ(g)χ(h⁻¹)`. This validates the proposed route in that specific coefficient setting; it is not an off-the-shelf theorem for arbitrary local rings. Links: [orthogonality source](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/CharacterTheory/BlockSectionOrthogonality.lean), [third-main source](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/CharacterTheory/BrauerThirdMainTheorem.lean).

**Adversarial computations.** Here `r=(123)`, `t=(12)`, and `s,u` are the other two transpositions of S₃. Ordinary rows are trivial, sign, standard, with values `(1,1,1)`, `(1,−1,1)`, `(2,0,−1)` on `(1,t,r)`. `e₀=1+r+r²` and `e₂=r+r²` denote the two modular block idempotents at `p=2`. Matrix products, column Gram values and group-algebra counterchecks were recomputed by finite convolution; other rows give direct calculations. A “pass” is an instance check, not a proof. Rows marked “specify” explicitly do not certify an absent formula.

The following table contains 94 computed rows covering the sample, the headlines, the four Lean declarations, all explicit formulas and the remaining API families. Where the README does not state a formula, the row tests the intended object and records the specification limitation.

| Statement | Instances | Computed values on the two sides / discriminants | Result | Change |
| --- | --- | --- | --- | --- |
| A01: Conventions: p-regularity (72) | S₃, p=2; identity, t, r | gcd(2,1)=1; gcd(2,2)=2; gcd(2,3)=1 | Pass: identity/r admitted, t excluded | Keep domain restriction. |
| A02: Element factorization and uniqueness (73,130) | C₆ generator g, p=2; identity | g³·g⁴=g; orders 2,3; identity factors 1,1 | Pass; pinned duplicate | R04. |
| A03: Power laws (131) | C₆, p=2, g² | (g²)_p=1=(g³)²; (g²)_p'=g²=(g⁴)² | Pass | Use native factors. |
| A04: Conjugation law (131) | S₃, p=2, rtr⁻¹=s | p-part of s=s=rtr⁻¹; prime-free parts both 1 | Pass | Import native law. |
| A05: Subgroup/quotient/homomorphism laws (131) | C₆→C₃, g↦r; cyclic subgroup inclusion | g³↦1=r_p; g⁴↦r=r_p'; same powers under inclusion | Pass | Specify remaining transport targets. |
| A06: Sections and centralizer parametrization (131–133) | S₃ at p=2 and p=3 | p=2 section sizes 3,3; p=3 sizes 4,2; each sum 6 | Pass for cardinalities | State general parametrization. |
| A07: Block idempotent definition (112; Lean 21) | 𝔽₂[C₂]; zero ring; 𝔽₃[C₂] | 1 primitive, 0 not; zero ring has none; 1=e₊+e₋ is not primitive in 𝔽₃[C₂] | Pass; wrong zero model excluded by native ne_zero | Add three Checks. |
| A08: Artinian centre (137) | 𝔽₂[C₂]=𝔽₂[ε]/ε² | centre dimension 2; radical dimension 1; ε²=0 | Pass; semisimplicity would fail | Use finite-dimensional centre instance. |
| A09: Complete central decomposition/uniqueness (138; Lean 40) | 𝔽₃[C₂], families (e₊,e₋) and (e₋,e₊) | e₊e₋=0; e₊+e₋=1; swap matches both entries | Pass; empty family sums 0≠1 | Keep substantive uniqueness target. |
| A10: Block ideals and product equivalence (139–141) | 𝔽₃[C₂] | A≅𝔽₃×𝔽₃; dimensions 2=1+1; block units e₊,e₋ | Pass | Define source/target and units explicitly. |
| A11: Module projections (140) | Trivial and sign modules over 𝔽₃[C₂] | e₊ acts (1,0), e₋ acts (0,1); sum acts identity | Pass | Add projector API and Checks. |
| A12: Equivalence transport (141–143) | C₃ automorphism r↦r² over 𝔽₄ | e_ζ↦e_ζ²; principal e₁↦e₁ | Pass | Record coefficient/root transport. |
| A13: Scalar extension need not preserve primitiveness (142–143) | 𝔽₂[C₃]→𝔽₄[C₃] | 2 blocks→3 blocks; dimension-2 factor splits into two dimension-1 factors | Pass negative control | Keep preservation hypotheses. |
| A14: Modular-system existence and residue field (76–93,147–157) | e=1; e=3,p=2; e=3,p=3 | (Q₂,ℤ₂,𝔽₂); Q₂(ζ₃) unramified quadratic with 𝔽₄; Q₃(ζ₃) ramified quadratic with 𝔽₃ | Instances consistent | General residue-identification locator unverified. |
| A15: Coefficient exclusions (76–83) | 𝔽₂((T)); field O; missing roots in Q₂ for C₃ | CharZero fails; DVR nonfield condition fails; X²+X+1 has no 𝔽₂ root | Hypotheses exclude these inputs | Do not silently admit them in future signatures. |
| A16: Complex root normalization (87,95–101) | e=1,2,3; total-function e=0 | ζ₁=1; ζ₂=−1; ζ₃=exp(2πi/3); ζ₀=1 but exponent 0 excluded for finite G | Pass | Use nonzero exponent when invoking primitive-root theorem. |
| A17: Prime-to-p root lifting/product/powers (95–98,155–157) | 𝔽₄=𝔽₂(α), α²+α+1=0 | α↦ζ₃, α²↦ζ₃²; lifts multiply to ζ₃³=1 | Pass; inverse choice changes χ(r) | Fix comparison once for all subgroups. |
| A18: Characteristic-zero splitting and subgroup restriction (92,153–155) | C₃ over Q₂(ζ₃); trivial subgroup | 3 simple dimensions 1,1,1; restrictions all dimension 1 | Pass instance | Consume root-containing-field realization. |
| A19: Stable lattice existence/fullness (159–161) | G=1, V=K²; V=0 | O² spans K², ranks 2=2; zero lattice spans 0, ranks 0=0 | Pass | General proof still requires lattice API. |
| A20: Independence of lattice reduction (161–162) | G=1, O and πO in K | O/πO≅πO/π²O, both class 1 in G₀(k) | Pass | Not module equality inside the same quotient. |
| A21: Additivity/tensor of reduction (162) | G=1, O⊕O and O⊗O | 2=1+1; 1=1·1; zero module class 0 | Pass | Keep exact rather than split relations. |
| A22: Reduction restriction/induction/conjugation (162–163) | 1≤C₂, p=2; conjugate subgroups of S₃ | regular reduction class 2; restriction dimension 2; conjugates have same dimension/index | Pass numerical check | State maps and compatibility squares. |
| A23: Idempotent/projective lifting (163–164) | ℤ₂→𝔽₂, G=1; rank-one summand | 0↦0, 1↦1; rank 1 lifts to rank 1; (2)ⁿ≠0 for every n | Pass, native supplied | R05. |
| A24: Uniqueness of central lifts (164,233) | ℤ₂[C₃]→𝔽₂[C₃] | (1+r+r²)/3 reduces to e₀ and complementary idempotent to e₂ | Pass example | Keep centrality and completeness in statement. |
| A25: Brauer character definition (168–171) | C₃ over 𝔽₄, eigenvalue α; zero module | φ(r)=ζ₃, φ(r²)=ζ₃²; zero character 0 | Pass; residue trace α is not a complex value | Add definition Checks. |
| A26: Class invariance (171–173) | S₃,p=2, standard simple | φ(r)=φ(r²)=−1 | Pass | Keep native conjugacy convention. |
| A27: Exact-sequence additivity (172) | 𝔽₂[C₂] regular module extension 0→1→V→1→0 | φ_V(1)=2=1+1; V has nonzero radical | Pass; does not assert extension splits | Retain exact formulation. |
| A28: Tensor multiplication (172) | C₃ over 𝔽₄, character α tensor α | φ_tensor(r)=ζ₃²=ζ₃·ζ₃ | Pass | Zero tensor gives 0=0. |
| A29: Duality and inverse convention (172) | C₃, eigenvalue α | φ_dual(r)=ζ₃⁻¹=ζ₃²=conjugate(ζ₃) | Pass; unchanged χ would be wrong | Add explicit convention Check. |
| A30: Inflation/restriction (172–173) | S₃/C₃=C₂,p=3; sign | inflated value at t=−1; restriction to C₃ has Brauer value 1 at identity | Pass | Restrict evaluations to p-regular elements. |
| A31: Induced Brauer-character formula (173) | Ind_1^S₃(1), p=2 | values on 1,r are (6,0); multiplicities in modular basis are (2,2) | Pass: 2(1,1)+2(2,−1)=(6,0) | State division by subgroup order in characteristic zero. |
| A32: Ordinary/lattice/Brauer comparison (174–178) | S₃ standard,p=3 | ordinary restriction on 1,t is (2,0)=(1,1)+(1,−1) | Pass | Same root comparison required. |
| A33: Independence and basis count (179–181) | S₃,p=3 | Brauer table [[1,1],[1,−1]], determinant −2≠0; two regular classes, two simples | Pass over ℂ | Do not reduce this determinant to characteristic 2. |
| A34: Semisimple recognition (181–182) | C₂,p=2, V=1⊕1 versus nonsplit regular module | both Brauer degree 2; only V is semisimple; radical dimensions 0 versus 1 | Pass negative control | Keep semisimplicity hypothesis. |
| A35: Finite-field descent/splitting (184–191) | C₃,p=2: 𝔽₂ versus 𝔽₄ | 𝔽₂ has two simple classes (dims 1,2); 𝔽₄ has three (dims 1,1,1) | Root-containing hypothesis discriminates | General descent proof/source not certified. |
| A36: Decomposition-map surjectivity (193–205) | S₃,p=3; C₂,p=2 | D maps trivial/sign rows to (1,0),(0,1); C₂ maps both ordinary rows to 1 | Pass: image ranks 2 and 1 | Include elementary-group lift input. |
| A37: Elementary-group lifting route (199–204) | E=C₃×C₂, p=2 | Sylow C₂ normal; quotient C₃; three one-dimensional simples lift via ζ₃^j | Pass | State both equal-prime and unequal-prime cases generally. |
| A38: Nonnegative decomposition coefficients (205–206) | S₃,p=3 | standard restriction coefficients (1,1), uniquely solve (2,0) | Pass | Actual characters, not arbitrary virtual classes, for nonnegativity. |
| A39: Change of splitting system (207–212) | C₃,p=2, α versus α² root marking | columns labelled ζ₃ and ζ₃² swap; coefficients stay 1 after relabelling | Pass only with transported labels | State comparison, not unmarked equality. |
| A40: Projective lifting and character (216–218) | C₃,p=3, regular projective | lift O[C₃] has character (3,0,0); simple head dimension 1 | Pass | Reuse lifting supplier. |
| A41: Projective characters vanish on singular elements (219) | S₃,p=3; Φ₁=1+std, Φ_sgn=sgn+std | at r:1−1=0 for both; degrees 3,3 | Pass | Do not assert all ordinary characters vanish. |
| A42: Brauer reciprocity (219–220) | S₃,p=3 | multiplicities in Φ₁,Φ_sgn are columns (1,0,1),(0,1,1) of D | Pass | Maintain row/column convention. |
| A43: Cartan C=DᵀD and nonsingularity (220) | S₃ at p=2,3 | C₂=diag(2,1), det2; C₃=[[2,1],[1,2]], det3 | Pass | These determinants are nonzero over ℚ, not units over ℤ. |
| A44: Projective/Brauer duality (221–223) | S₃,p=3; class sizes on regular elements 1,3 | pairing matrix: (3+3)/6=1, (3−3)/6=0 on/off diagonal | Pass | Specify denominator \|G\|=6, not regular-element count 4. |
| A45: Cartan supplier orientation (106–109,223) | Native A₂ supplier | C₀₁=0,C₁₀=1; transposed convention gives 1,0 | Discriminates transpose unlike symmetric group-algebra examples | R09; native Quiver/Kronecker/A2.lean:68. |
| A46: Ordinary idempotent descent/formula (227–231) | C₂ over Q₂, t generator | e₊=(1+t)/2, e₋=(1−t)/2; e₊e₋=0, sum1 | Pass; neither individually integral over ℤ₂ | Do not divide by \|G\| in residue characteristic. |
| A47: Integral/modular primitive blocks (233–235) | C₂,p=2; S₃,p=2 | C₂'s two ordinary idempotents sum to integral 1; S₃ has two integral sums reducing to e₀,e₂ | Pass | Partition ordinary irreducibles first. |
| A48: Reduced central characters (236–238) | S₃,p=3, class sums of t and r | ordinary central values: (3,2),(−3,2),(0,−1); reductions all (0,2) | Pass: all ordinary characters one block | R03: two simples are still distinct. |
| A49: Claimed bijections (237–238) | S₃,p=3 | ordinary/simple/block cardinalities 3/2/1; block quotient cardinalities 1/1/1 | Overclaim unless quotient sets specified | R03. |
| A50: Block diagonal D,C (240) | S₃,p=2 | D=[[1,0],[1,0],[0,1]]; C=diag(2,1) | Pass | Retain decomposition by block fibres. |
| A51: Ordinary/modular projections and isomorphism transport (240–241) | S₃,p=2, standard and trivial modules | e₀ acts 0 on std,1 on trivial; e₂ acts 1,0; conjugation fixes both idempotents | Pass | Give the corresponding maps. |
| A52: Principal idempotent/augmentation (242–244) | S₃,p=2 | aug(e₀)=3=1 in 𝔽₂; aug(e₂)=2=0 | Pass; uniqueness distinguishes the other block | Needed in headline signature. |
| A53: Generalized coefficients and cyclotomic integrality (248–251) | C₃,p=3,x=r,u=1 | for χ_j, d^r=ζ₃^j and χ_j(r)=ζ₃^j·1 | Pass; values ζ₃,ζ₃² not nonnegative integers | Define coefficient ring and uniqueness. |
| A54: Generalized orthogonality/integral change (251–253) | C₂,p=2; S₃,p=3,x=r | C₂ matrix det−2, inverse has 1/2; S₃ sum d^r·conj(d^r)=1+1+1=3 | Specify; integral invertibility cannot be assumed | R07. |
| A55: Cross-section block orthogonality (255–257) | S₃,p=2,(1,t); p=3,(1,r) | p=2 principal sum1−1=0 and defect-zero sum0; p=3 total1+1−2=0 | Pass | Retain nonconjugate p-parts. |
| A56: Within-section full column orthogonality (258–259) | S₃, columns 1,t,r | Gram diag(6,2,3), all off-diagonals 0 | Pass numerical factors | R07: write factors explicitly. |
| A57: Local idempotent trace route (260–262) | C₂ permutation swap σ; E=I₂; rational E=(I₂+σ)/2 | tr(I₂σ)=0; tr(Eσ)=1, but E is not integral at 2 | Pass negative control for local integrality | State coefficient ring and commutation. |
| A58: Block-restricted within-section formula (263) | S₃,p=2, g=h=1 | principal sum2, defect-zero sum4, total6 | Specify; replacing each block sum by centralizer size6 is false | R07: supply the actual Cartan formula. |
| A59: Relative trace definition/transitivity (268–270) | 1<C₂<C₂×C₂, characteristic2, abelian action | Tr_1^C₂(1)=2=0; Tr_1^C₂×C₂(1)=4=0; composite0 | Pass boundary, not sufficient alone | Add noncentral orbit Checks. |
| A60: Trace conjugation/Mackey/product (269) | S₃,p=2,P=⟨t⟩,a=r | Tr_1^P(r)=r+r²; conjugate trace same pair; Tr(r)·1=Tr(r·1) | Pass instance | State double-coset identity explicitly. |
| A61: Trace image ideals (270) | S₃,p=2,P=⟨t⟩ | image has basis r+r²,s+u; dimension2; multiplication by t exchanges these two generators | Pass | Name ambient fixed algebra. |
| A62: Coefficient projection/linearity/unit (271; Lean 27) | S₃,P=⟨t⟩; P=1 | Br(1)=1,Br(t)=t,Br(r)=0; for P=1 projection is identity | Pass; zero map excluded | Add three Checks. |
| A63: Brauer multiplicativity (272–274; Lean 33) | S₃,p=2,x=y=r+r², P=⟨t⟩ | x²=x in 𝔽₂[G]; Br(x²)=0=Br(x)² | Pass invariant-input theorem | No missing Lean binder. |
| A64: Nonfixed-input negative control (274) | S₃,p=2,x=r,y=r²,P=⟨t⟩ | Br(xy)=Br(1)=1; Br(x)Br(y)=0 | Pass rejection | Keep both invariance hypotheses. |
| A65: Characteristic negative control (272) | Same fixed x=r+r² over ℚ | Br(x²)=2; Br(x)²=0 | Pass rejection | Keep CharP. |
| A66: P-group negative control (271–272) | S₃,char2,P=C₃,x=sum of transpositions | Br(x²)=1+r+r²; Br(x)²=0 | Pass rejection | Keep IsPGroup p P. |
| A67: Projection conjugation/subgroup/iteration (275) | S₃,p=2, 1≤P=⟨t⟩, conjugate ⟨s⟩ | Br_P∘Br_1 sends r→0,t→t; conjugation sends retained t→s | Pass instance | Specify domains of iterated projections. |
| A68: Brauer kernel (277) | S₃,p=2,P=⟨t⟩; P=1 | fixed dimension4→centralizer dimension2; kernel span(r+r²,s+u)=trace image; P=1 kernel0=empty sum | Pass | General source locator unverified. |
| A69: Rosenberg primitive-idempotent lemma (278–279) | 𝔽₂[C₂]=𝔽₂[ε]/ε²; ideals (ε),A | 1∈(ε)+A and 1∈A; 1∉(ε); zero is not primitive | Pass instance | Keep finite-dimensional/local-corner hypotheses; ℤ with (2)+(3) would fail. |
| A70: Brauer-pair nonzero overlap (281–282) | S₃,p=2,P=⟨t⟩, unique centralizer block1 | Br_P(e₀)·1=1; Br_P(e₂)·1=0 | Pass; excludes wrong global block | Add explicit pair definition. |
| A71: Pair inclusion/unique lower pair (282–284) | S₃,p=2, (P,1), Q=1 | lower global principal pair overlaps1; defect-zero overlaps0 | Intended relation discriminated; relation not defined in prose | R09: state relation before theorem. |
| A72: Maximal pairs/conjugacy/defects (284–286) | S₃,p=2 | principal maximal P: three conjugate C₂ subgroups; defect-zero maximal P: trivial only | Pass instance | General pair theory unverified from sources. |
| A73: Defect-zero criteria (286–287) | S₃,p=2, standard block | degree2 has full 2-part2; D=1,C=[1], simple dimension2 is projective | Pass | Spell out which iff and its hypotheses. |
| A74: Principal Sylow defect (287) | S₃,p=2; trivial G | Br_P(e₀)=1 for Sylow P; three maximal P of size2; trivial G has unique size1 subgroup | Pass; headline statable | R06. |
| A75: Normal p-subgroup containment (288–289) | S₃,p=3,N=C₃; C_G(r)=C₃ | unique global defect C₃ contains N; local defect C₃ contains ⟨r⟩ | Pass | Explicitly distinguish subgroup of centralizer from central in G. |
| A76: Trace characterization of defect (290–291) | C₂,p=2,principal block1 | Tr_1^C₂=0, so 1 not in its image; Tr_C₂^C₂=id, so 1 is in image | Pass: minimal subgroup C₂ | Define global trace ideal and conjugacy-minimality. |
| A77: Brauer centre comparison at defect (292–294) | S₃,p=2,D=C₂,N_G(D)=C₂ | principal image e₀↦1; defect-zero image e₂↦0 | Pass; full centres have dimensions3 versus2, so no full-centre isomorphism | Specify relative-trace pieces. |
| A78: Central-character block induction (298–304) | S₃,p=2,Q=C₂,H=C₂,b=1 | Br_Q(e₀)=1,Br_Q(e₂)=0; b^G=B₀; central characters take these values1,0 | Pass instance | General induction-domain locator unverified. |
| A79: First main theorem (306–310) | S₃,p=2,D=C₂; p=3,D=C₃; D=1,p=2 | defect-D block counts 1↔1 in first two cases; N_G(1)=G gives identity on one defect-zero block | Pass | Preserve normalizer-containing hypothesis. |
| A80: Second main theorem (312–320) | S₃,p=2,x=t; p=3,x=r | p=2 d^t=(1,−1,0): nonzero rows in B₀; p=3 d^r=(1,1,−1): all in unique block | Pass instance | No general-text certification. |
| A81: Third main theorem, general defined-block criterion (322–324) | S₃,p=2,H=C₂; H=G | unique H block induces B₀; for H=G both block identity maps give principal iff principal | Pass two directions on examples | Keep existence criterion separate. |
| A82: Third main theorem, local overlap (325–329) | S₃,p=2,P=C₂,H=C₂; P=1,H=G | first overlap1; for P=1 products e₀e₀=e₀≠0,e₀e₂=0 | Pass two directions | State maps into shared centralizer explicitly. |
| A83: Normal p action/simple inflation (333–335) | S₃,p=3,N=C₃ | both modular simples have r↦1; quotient C₂ has same two simples | Pass | Do not infer block bijection. |
| A84: Normal p block images/partition (335–338) | S₃,p=3→C₂ | global idempotent1 maps to1=e₊+e₋; one block dominates two | Pass; exactly the README negative control | Retain it when repairing R03. |
| A85: Normal p-prime average (340–341) | S₃,p=2,N=C₃ | \|N\|=3=1 in 𝔽₂, e_N=1+r+r², e_N²=e_N | Pass; p-prime makes denominator nonzero | Zero-ring case excluded by Field. |
| A86: Quotient block algebra equivalence (341) | Same example | basis e_N,t e_N; (t e_N)²=e_N; dimension2=dim𝔽₂[C₂] | Pass | Unit of source ideal is e_N. |
| A87: Inflation/block bijection over trivial N-character (342–344) | S₃,p=2,N=C₃ | quotient C₂ has one block with ordinary 1,sgn; inflated block is B₀ of S₃ | Pass | Bijection restricted to trivial-N covering blocks. |
| A88: Covering other character orbits (344–345) | S₃,p=2,N=C₃ | orbit {ζ₃,ζ₃²} has size2; standard restriction is ζ₃+ζ₃² and belongs to the other block | Pass instance | Define covering and restriction formulas. |
| A89: Ordinary principal kernel equality (347–351) | S₃,p=2 and p=3; C_p,p | p=2 ker1∩kersgn=C₃=O₂'; p=3 standard faithful gives intersection1=O₃'; C_p all ordinary characters intersect in1 | Pass instances, not source certification | Core supplier unavailable for substantive check. |
| A90: Brauer principal kernel containment (353–358) | S₃,p=2; C_p,p | S₃ principal simple trivial: values on C₃ all1=degree; C_p simple kernel C_p whereas O_p'=1 | Pass; modular equality would be false | Keep containment only. |
| A91: Worked C_p and prime-to-p cyclic examples (360–363) | C₂,p=2; C₃,p=3; split C₃,p=2 | Cartan [2],[3],I₃; simple/block counts1/1,1/1,3/3; regular radical nonzero in first two | Pass | Use splitting coefficients for C₃,p=2. |
| A92: Worked S₃ at p=2 (363–366) | Rows 1,sgn,std; modular columns1,std | D=[[1,0],[1,0],[0,1]], C=diag(2,1); block sizes2,1 | Pass | Keep defect-zero degree-two example. |
| A93: Worked S₃ at p=3 (367–369) | Rows 1,sgn,std; columns1,sgn | D=[[1,0],[0,1],[1,1]], C=[[2,1],[1,2]], one block | Pass | Also the R03 countercheck. |
| A94: Missing native base-change name (60–61) | G=1,𝔽₂→𝔽₄ | intended K₀ map1↦1; exact claimed declaration search has zero matches | Supplier failure, not a false numerical law | R01; import ModularInduction Layer1 contract. |

## Not verifiable

- **Serre, Part III (`serre`).** The sources service returned `uncertified`, resolving to a paywalled Springer DOI. No full text was read, and no new request for this settled status was added. The README gives no theorem/page locators within Part III.
- **Alperin (`alperin`).** The sources service resolved the title to the Cambridge publisher landing page but returned no legal full text. Relative traces, Rosenberg's lemma and the complete Brauer-pair inclusion theory therefore have finite-instance checks here, not source certification. The missing-text record lists this attempt.
- **Navarro (`navarro`).** Title lookup first returned HTTP 429; retry by DOI `10.1017/CBO9780511526015` reached the publisher landing page but no legal full text. Chapters 2–6 alone do not locate the finite-field descent, generalized-decomposition identities, second main theorem or principal-block kernel equality. The missing-text record lists both attempts. No paywall was bypassed.
- **Different coefficient settings.** Martínez works with a localization of the algebraic integers and algebraically closed residue field. Its character statements do not certify every complete-DVR, finite-residue-field construction in M1–M2. Axiom's trace argument was read in its actual integral coefficient ring; no claim was made that it directly handles arbitrary local rings.
- **Absent formulas.** The generalized integral-lattice comparisons, block-restricted within-section Cartan formula and Brauer-pair order cannot be fully checked as statements until their domains and formulas are given. R07/R09 describe the repair; the computed rows do not fill these gaps by assumption.
- **Unavailable open supplier/ownership text.** LocalFiniteGroupTheory is named in the target but its checkout was not supplied. Its L1–L3 assertions were not substantively verified. The index's GL2AutomorphicRepresentationsAndTransfer Brauer-character hits likewise were not promoted to findings without the supplied source text. Ownership against other open pull requests lacking supplied files was not checked. No search result was treated as proof that a theorem is missing.
- **Gate versus elaboration.** The independent direct Lean elaboration and scratch probes passed, but the worker's targeted-build gate remains failed. The final report does not claim that running direct elaboration cleared it.

## Source issues

- **Misprint** in martinez at Proposition 1.5 proof, printed p.3 (`martinez` line 175): the source says trace functions of representations are linearly independent; it should be traces of pairwise inequivalent irreducible representations; affects the proof.
- **Misprint** in martinez at Theorem 4.10, Claim 2, printed p.28 (`martinez` line 1105): the source says defect groups of b are contained in defect groups of b; it should be defect groups of the induced block b^G; affects the proof.
- **Misprint** in martinez at Theorem 5.8 and proof, printed pp.34–35 (`martinez` lines 1356,1365,1369): the source says e^G in the conclusion and later uses undeclared e and ξ; it should be c^G, c and ψ, respectively; affects a stated result.
- **Misprint** in martinez at Theorem 8.8 proof, printed p.54 (`martinez` lines 1994–1995): the source says induction to N_G(P) in two places; it should be induction to N_G(D), the normalizer used throughout that argument; affects the proof.
