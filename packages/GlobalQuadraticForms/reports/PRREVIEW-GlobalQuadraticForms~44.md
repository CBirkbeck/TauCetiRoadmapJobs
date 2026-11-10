# Review of GlobalQuadraticForms (pull request #1200 at 53e2c5d)

**Verdict:** needs changes

## R01 (P3) — Restore an explicit order with the conflicting #617

**Location.** PR description, generated `merge-order` block, shared-folder entry: “`GlobalQuadraticForms`: #1215 → **this pull request**.” The affected content is `TauCetiRoadmap/GlobalQuadraticForms/README.md:44`, `:75` and `:1228`.

**Claim.** This entry supplies no order between #1200 and #617. The prose outside the generated block no longer supplies one either. The earlier review's ordering repair has therefore regressed.

**Witness.** At #617 head `dec9d6b8`, `TauCetiRoadmap/GlobalQuadraticForms/README.md:73–75` skips the finite-support entry. A read-only three-way merge with `53e2c5d` conflicts there, at the scope paragraph, and at the downstream paragraph.

**Repair.** State the relative order and which branch rebases, preserving the three additions in this PR. For example: “#1200 → #617; #617 rebases onto #1200 before merging and retains its finite-support map and complex-place descriptions.” Update the shared-folder entry consistently. The direct comparison of these heads shows that their copies of this README differ by exactly these three edits, so preserving them resolves the witnessed folder conflict without changing the mathematics. This is an ordering request, not a request to import #617's other roadmap changes into #1200.

## Verified sound

🤖 Independent AI review using Codex (GPT-6). This is a full review of the two requested files, including unchanged passages, not an incremental endorsement of the previous review. There is **one P3 finding and no P1 or P2 finding**.

**Previous-review disposition, checked first.** The immediately previous report, r43 at `ac85fbd`, was accepted and had no outstanding findings. I also rechecked the two repairs it recorded:

- Its underlying R01 remains repaired. `Suggested.lean:135–136` says `Function.Injective (TauCeti.WittRing.globalToLocal K)`; `README.md:116–118` specifies Mathlib's `invertibleTwo`. The newly elaborated signature has `Field K` and `NumberField K`, any universe for `K`, and no arbitrary `Invertible` parameter.
- Its underlying R02 is no longer repaired. The earlier description said “rebased, before it merges, onto whichever of #1215 and #617 merges first”. That sentence is absent from this head's description, whose generated block names only #1215. R01 above records the surviving conflict with #617.

**Scope, shape and verification.** The PR really changes only `TauCetiRoadmap/GlobalQuadraticForms/README.md`, with 9 insertions and 4 deletions relative to `origin/main`; its description's generated `roadmap-summary` block and the statement that `Suggested.lean` is unchanged from main are accurate. The outside-folder diff is empty. This revises the existing roadmap and preserves its targets; it does not re-plan it. The old Layers 0–3 and 4.4 resolve through the section/name map. The five retained layers have Examples and Dependencies, and all retained targets have their inputs spelled out. Section 4.1's transport construction has its preservation API and seven discriminating Checks. There are no newly defined Lean carriers, algorithms, sorry'd data, admitted examples or options.

The worker's gate at the requested head passed every scanner, dependency check and targeted build, including `build=0`. My gate rerun also returned `OK`, with every reported counter zero. Separately, I ran `lake env lean` on the requested `Suggested.lean`: exit 0, exactly eight `sorry` warnings and no other warnings. No source file was changed.

The independently run dependency check returned:

```text
depcheck: 228 roadmaps, 2121 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. I read every Needs block: the actual suppliers are the pinned libraries; the named roadmaps in Scope and Downstream consumers describe ownership or consumption, not additional prerequisites. No supplier gap is declared or required by the inspected routes.

**Headline coverage and padding.** All eight declared headlines occur on native carriers:

| README | Headline | Suggested.lean line |
|---|---|---|
| 4.2 | Almost-everywhere local squares are global squares | 53 |
| 5.5 | Hasse–Minkowski isotropy | 70 |
| 6.1 | Local–global representation of nonzero scalars | 78 |
| 6.2 | Local–global injective representation of forms | 86 |
| 6.3 | Hasse–Minkowski isometry | 95 |
| 7.3 | Realization of every admissible invariant record | 113 |
| 8.1 | Classification by the full invariant record | 122 |
| 8.3 | Injectivity of the native Witt localization map | 135 |

Sections 7.4 and 8.4 are explicitly directions of the stated classification/isometry results; the hyperbolicity consequences of 8.2 are the form-level route to 8.3. These are not replaced by artificial predicates. Each Lean declaration appears in the README. I elaborated a scratch copy containing `#check @name` for all eight declarations and compared the full types with the README. All finite-dimensionality, regularity and nonzero-scalar binders survive; the universe parameters of the field and vector spaces remain independent. Nothing needed changing.

In a scratch copy, each of the eight admissions was independently tried with `rfl`, `simp`, `infer_instance` and `exact?` before an explicitly marked fallback admission. All eight reached the fallback; none was discharged by these probes. The probe elaborated with no errors. Its additional unused-tactic warnings belong to the probe, not the submitted file. Reading the definitions and candidate library results likewise found no padding.

**Seeded source sample: 15 targets.** The source text used was the supplied line-numbered extraction of `milne-cft`, version 4.03; the author's [course-notes page](https://jmilne.org/math/CourseNotes/cft.html) confirms the version. No source manifest was edited. In the table, “uncertified” concerns the exact book locator, not an assertion that the mathematical statement is false.

| Target | Locator inspected and result |
|---|---|
| 4.1 | The primitive-element and completion/place-transport inputs were opened at the pins, as detailed below. Item 3 agrees with the seven universe-restricted native signatures. The two sign-prescription locators, `omeara` 71:19 and 71:19a, remain uncertified. |
| 4.2 | `milne-cft` VIII Theorem 1.1, printed p.229, lines 10384–10391: nonzero element, primitive nth root of unity, almost all places. For n=2 every number field contains −1; the finitely many infinite places may be exceptions. Exercise 1.3, lines 10397–10405, supports the eighth-power negative control. `omeara` 65:15 remains uncertified. |
| 4.3 | `milne-cft` VIII Theorem 3.1, printed p.234, lines 10629–10641: cyclic extension and nonzero element. A nonsquare d gives a quadratic cyclic extension. The coordinate norm and omitted complex clauses are supplied by the native adapters; the roadmap does not apply the theorem to a noncyclic extension. |
| 5.1 | `milne-cft` VIII Proposition 3.7(b,c), printed p.236, lines 10698–10710, and proof of Theorem 3.5(b), p.237, lines 10772–10778. The binary square reduction and ternary norm reduction agree; the roadmap supplies the correct norm-theorem reference instead of copying the source's erroneous reference. |
| 5.5 | `omeara` 66:1 remains uncertified. Independently, `milne-cft` VIII Theorem 3.5(b), p.235, lines 10686–10689, states the number-field isotropy result. Its higher-rank route, p.237, lines 10788–10804, agrees with the supplied conditional step, with nonzero approximated value explicitly retained here. |
| 6.1 | `omeara` 66:3 remains uncertified. The nonzero-scalar route is supported by `milne-cft` VIII Lemma 3.4 and Corollary 3.6, pp.235–236, lines 10679–10696. The roadmap's a ≠ 0 avoids the source's zero-value issue with “represents”. |
| 6.2 | `omeara` 66:3 remains uncertified. The stated route is valid: choose a nonzero value, split a regular line on both sides, use local extension/cancellation, and induct on the represented form's rank. Native splitting, extension and cancellation hypotheses were checked. |
| 6.3 | `omeara` 66:4 remains uncertified. `milne-cft` VIII Theorem 6.3, printed p.252, lines 11619–11628, independently supports local–global isometry over number fields. |
| 7.2 | Exact `omeara` 72:1 remains uncertified. Supplementary verification: `milne-cft` VIII Theorem 6.12, p.256, lines 11792–11796, has the common global discriminant, almost-everywhere trivial Hasse signs and product-one conditions. Changing from its S to this roadmap's s multiplies by (−1,d) at each place; reciprocity preserves the product condition. |
| 7.3 | Exact `omeara` 72:1 remains uncertified. The equivalent invariant formulation in `milne-cft` VIII §6, p.256, lines 11799–11807, includes positive rank, the rank-one and rank-two exceptions and all real indices. After the same convention conversion it matches the native admissibility predicate. |
| 7.4 | `milne-cft` VIII Theorem 6.3, p.252, lines 11619–11628, and Theorem 6.10, p.255, lines 11745–11746. Equality of records gives local isometry; the convention-conversion factor is identical on both sides. |
| 8.1 | Exact `omeara` 66:5 remains uncertified. The inspected local classification, real signatures and global isometry theorem support the proof through 7.4, including rank zero. |
| 8.2 | `milne-cft` VIII Theorem 6.3, p.252, lines 11619–11628, applied to Q and mH, and Proposition 6.2, p.251, lines 11574–11595, with the cancellation consequence at lines 11608–11609. The Witt statement follows by applying hyperbolicity to Q ⊥ (−R). |
| 8.3 | Same Theorem 6.3 through 8.2. The native map has the precise finite/real target; regular-form representatives exist for every Witt class. No injectivity theorem was found at the pin. |
| 8.4 | Same Theorem 6.3, p.252. Only its form-theoretic reverse implication is exported. The source's subsequent Remark 6.4 concerns O, not an independently proved SO cohomology interface; the roadmap correctly assigns that translation to its consumer. |

For the subsidiary local-realization assertions at `README.md:955–965`, I also read `milne-cft` VIII Proposition 6.11, p.255, lines 11758–11777, and the real-form discussion on p.256, lines 11781–11785. Their small-rank exceptions and the failure of determinant-plus-Hasse-sign to distinguish real rank-four forms agree after conversion. Source errors encountered in these passages are separated below.

**Pinned-library and object-duplication audit.** Pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The search covered objects, signatures and conclusions, not only the eight target names. A scan of 160 qualified README code tokens found declaration-name candidates for all of them; candidates with shared short names were disambiguated by their cited namespaces/files. The following are the substantive carriers and proof inputs opened and compared:

| Native declaration(s) | File and line at the pin; comparison |
|---|---|
| `QuadraticMap.Anisotropic`, `QuadraticMap.Nondegenerate` | `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1054`; `Radical.lean:115`, `:126`. Anisotropy means only the zero vector has value zero. Nondegeneracy includes radical zero and polar-radical rank ≤1; invertible two identifies the radical with the polar kernel. Neither definition supplies finite dimension. |
| `QuadraticMap.Equivalent`, `QuadraticForm.baseChange` | `Mathlib/LinearAlgebra/QuadraticForm/IsometryEquiv.lean:46`; `TensorProduct.lean:128`. The former asserts existence of an isometry equivalence; the latter is the form on the scalar-extension tensor product, under invertible two. |
| `QuadraticMap.Represents`, `IsRepresentedBy` | `TauCeti/LinearAlgebra/QuadraticForm/Representation.lean:46`, `:49`. Scalar representation permits the zero vector; form representation explicitly requires an injective isometry. These are distinct predicates, used in the correct direction. |
| The four local predicates | `TauCeti/NumberTheory/QuadraticForm/Global/Predicates.lean:51`, `:66`, `:85`, `:147`. Each uses actual finite/real localizations. None has the global conclusion as a field or hypothesis. |
| Localizations and operations | `TauCeti/NumberTheory/QuadraticForm/Global/Localization.lean:90`, `:96`, `:105`, `:169`, `:177`, `:198`, `:207`, `:265`, `:278`; `Operations.lean:41`, `:53`, `:180`, `:188`, `:212`, `:222`. Regularity, sums, diagonal weights and scaling match the routes. |
| `GlobalFormInvariants`, `IsAdmissible`, `globalInvariants` | `TauCeti/NumberTheory/QuadraticForm/Global/Invariants.lean:90`, `:178`; `FormInvariants.lean:77`, `:165`, `:193`. The record has no positivity/support axioms; admissibility supplies them. Record equality is a genuine invariant condition. |
| Local classification | `TauCeti/NumberTheory/QuadraticForm/Global/Classification.lean:116`, `:135`, `:161`; `Signature.lean:343`; `ComplexPlaces.lean:66`. The local criterion sees the images of the discriminant, not equality of global discriminants. Section 7.3 correctly explains the extra global-square step if using 7.2 instead of the stronger native reduction. |
| Primitive-element transport | `Mathlib/FieldTheory/PrimitiveElement.lean:209`; `FieldTheory/IntermediateField/Adjoin/Basic.lean:423`; `NumberTheory/NumberField/Basic.lean:193`; `RingTheory/DedekindDomain/Ideal/Lemmas.lean:592`. Separability and finite dimension hold for number fields; AdjoinRoot over ℚ provides the small-universe model. |
| Completion and real-place transport | `TauCeti/RingTheory/DedekindDomain/AdicValuation/Transport.lean:119`, `:140`; `RingTheory/DedekindDomain/Ideal/Basic.lean:279`; `Mathlib/NumberTheory/NumberField/InfinitePlace/Ramification.lean:82`, `:90`; `InfinitePlace/Basic.lean:244`. The valuation compatibility and contravariant real-place direction in 4.1 match these inputs. |
| Square-class approximation and idele norms | `TauCeti/NumberTheory/NumberField/Global/Approximation/SquareClass.lean:40`; `Global/Ideles/Norm/Relative.lean:85`, `:190`; `Range.lean:115`; `Surjective.lean:198`. The surjectivity input concerns norms from the complete local tensor algebra and requires only finitely many exceptional finite places. |
| First inequality; quadratic norm theorem | `TauCeti/NumberTheory/ClassFieldTheory/Global/IdeleClass/FirstInequality.lean:108`; `Global/HasseNorm/Quadratic.lean:45`. The first carries cyclic Galois hypotheses; both restrict the number field to `Type`. The small-model application and 4.1 transport account for this restriction. |
| Hilbert symbol and new 4.4 map entry | `TauCeti/NumberTheory/HilbertSymbol/Basic.lean:47`; `Archimedean.lean:59`; `NumberTheory/QuadraticForm/Global/HilbertSymbol.lean:124`; `ArchimedeanSymbol.lean:102`, `:167`. These prove exactly the norm-equation convention, finite support, real sign and complex value claimed by the three PR edits. |
| Product and prescription inputs | `TauCeti/NumberTheory/QuadraticForm/Global/ProductFormula.lean:67`, `:107`, `:117`; `SignPrescription.lean:154`, `:191`. Their `K : Type` restrictions and parity/nonsquare/positivity conditions match all five corresponding clauses of 4.1 item 3. |
| Conditional isotropy steps | `TauCeti/NumberTheory/QuadraticForm/Global/Quaternary.lean:137`; `HigherRank.lean:87`; `ApproximateValue.lean:61`; `AnisotropicPlaces.lean:90`. The ternary hypothesis ranges over number fields in K's universe; the higher-rank hypothesis uses presented forms of rank n−1, and approximation requires a nonzero value. |
| Splitting, cancellation and extension | `TauCeti/LinearAlgebra/QuadraticForm/Representation.lean:277`, `:332`; `Witt/Cancellation.lean:196`; `Witt/Extension.lean:50`; `Radical.lean:530`, `:677`. The roadmap's regular lines and finite-dimensional complements supply the hypotheses. |
| Realization | `TauCeti/NumberTheory/QuadraticForm/Global/LocalRealization.lean:108`, `:309`, `:331`, `:405`; `PrescribedLocalForms.lean:140`; `CorrectionPlanes.lean:69`, `:74`. The reduction gives a locally represented correction plane and a conditional global conclusion, not the missing global representation theorem. |
| Classes and hyperbolicity | `TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Basic.lean:111`, `:145`, `:656`, `:677`, `:703`, `:726`; `RegularFormClass/TensorProduct.lean:421`; `NumberTheory/QuadraticForm/Global/Hyperbolicity.lean:79`, `:116`, `:139`. Presentations and sums give the global comparison form used in 8.2. |
| Witt quotient and localization | `TauCeti/LinearAlgebra/QuadraticForm/Witt/Ring.lean:108`, `:218`, `:364`, `:371`; `Witt/Decomposition.lean:262`; `NumberTheory/QuadraticForm/Global/WittLocalization.lean:167`, `:188`, `:203`. Kernel description is local vanishing, not kernel triviality. Its docstring at line 40 expressly leaves injectivity to Hasse–Minkowski. |
| Worked examples | `TauCeti/NumberTheory/QuadraticForm/Global/TernaryObstruction.lean:147`, `:191`; `BinaryObstruction.lean:80`; `DefiniteObstruction.lean:68`; `HyperbolicIsometry.lean:68`; `WorkedExamples/Sqrt5.lean:178`. Their hypotheses, including the primitive generator in the √5 example, agree with the instances used here. |

The near-match leads do not duplicate the headlines. For example, `IsSquare.isSumSq` at `Mathlib/Algebra/Ring/SumsOfSquares.lean:97` is a square-to-sum-of-squares implication; `Nat.sum_four_squares` at `Mathlib/NumberTheory/SumFourSquares.lean:202` is a natural-number representation theorem. `QuadraticMap.Isometry.toLinearMap_injective` at `Mathlib/LinearAlgebra/QuadraticForm/Isometry.lean:57` asserts injectivity of the forgetful map on isometries, not existence of an injective isometry. `WittVector.map_injective` at `Mathlib/RingTheory/WittVector/Basic.lean:260` and the truncated/Verschiebung results concern Witt vectors, not Witt groups of forms.

**Cross-roadmap ownership and overlap.** I used the roadmap service's object search and head reads, searched the board packages, and compared the closest open roadmaps. The main-branch QuadraticFormInvariants and completed IntegralLattices also supplied the requested shape examples.

- `TauCetiRoadmap/QuadraticFormInvariants/README.md:90–94` on main assigns number-field Hasse–Minkowski and global classification/realization to this roadmap. The corresponding boundaries at #617, #1411 and #1187 agree. They own the field/local theory and its native declarations, which this roadmap cites rather than redefines.
- #1834, `TauCetiRoadmap/QuadraticFormInvariantsPartII/README.md:25–61`, owns characteristic-two theory, deep Pfister theory and higher invariants. #1691, `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md:15`, explicitly attributes number-field classification and global Witt injectivity to this roadmap. Neither supplies a competing global theorem here.
- `Completed/OrthogonalSpinGroups/README.md:947`, `:963–967` on main requires the isometry theorem and assigns its pointed-set translation to the successor. `TauCetiRoadmap/IntegralLattices/README.md:477`, `:916` names the isometry result and the reverse-direction alias preserved by 8.4. These are consumers, not hidden suppliers.
- `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:166–172` on main asks for both real and complex symbol values and the localized product formula. The three edits correctly repair the description/map of those native inputs.
- There are no dropped cited ids or ids defined only by an open revision in the supplied overlap report. Direct inspection confirms the only shared-folder issue is #617, recorded in R01. There is no new same-namespace duplicate in this PR: its Lean file is main's, unchanged.

**Adversarial mathematics.** The following 47 rows were evaluated afresh. G/L means the global and all-required-local statements; T/F are truth values, not proof claims. For rational examples I recomputed determinant, signature and every pairwise Hilbert symbol at 2, 3, 5, 7 and ℝ, using valuations and unit residues; outside the indicated finite support both arguments are odd-prime units. Other rows give explicit vectors, field-isomorphism calculations or the excluded-hypothesis values. All sampled targets and all eight headlines occur. “None” means no repair to the roadmap is requested.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
|---|---|---|---|---|
| Regularity and isotropy conventions | Zero space; ⟨1⟩; ⟨1,0⟩ over ℚ | Polar kernels have dimensions 0,0,1; regularity T,T,F. Nonzero isotropic vectors: absent, absent, e₂ with Q(e₂)=0. | Zero-dimensional regular does not mean isotropic | None |
| Representation conventions | Zero space; zero quadratic map on a line | Both represent scalar 0 by x=0; the line cannot inject into the zero space, whereas the zero space injects into the line. | Scalar/form predicates distinguished | None |
| Plain versus signed discriminant | H=⟨1,−1⟩; ⟨1,1⟩ | Plain classes [−1],[1]; multiplying by (−1)¹ gives signed classes [1],[−1]. | Matches convention | None |
| Pairwise versus diagonal-inclusive Hasse sign | H over ℝ | s=(1,−1)=1; S=(1,1)(1,−1)(−1,−1)=−1; S/s=(−1,det H)=−1. | Conversion factor correct | None |
| Real signs and natural subtraction | Negative indices q=0,1,2,3,4; invalid n=1,p=2 | Real s=1,1,−1,−1,1; determinant signs=1,−1,1,−1,1. Invalid record gives truncated q=0 but fails 2≤1. | Junk subtraction cannot pass admissibility | None |
| Raw record versus admissibility | Zero record; rank-three record with all finite s=−1 | Zero record is realized, but 1≤0 is F. Infinite support makes finprod's default 1 insufficient: finite-support clause is F. | Neither junk record is admissible | None |
| 4.1(1), model in Type | ℚ(√5), θ²=θ+1 | X²−X−1 maps to θ²−θ−1=0; both field degrees are 2. θ ↔ X̄ gives the same diagonal coefficients. | Model preserves the field | None |
| 4.1(2), finite places | Conjugation on ℚ(i); a=2+i | At (2−i), a≡4 mod5 is a unit square; at (2+i), valuation(a)=1 is odd. Conjugated a=2−i has the reversed values. | Reindexing necessary and sufficient | None |
| 4.1(2), real places | θ↦1−θ in ℚ(√5) | At positive embedding θ≈1.618, σθ≈−0.618. The pulled-back absolute value is ≈0.618, while the embedding is negative; positive indices of σ⟨1,θ,θ⟩ and Q at the pulled-back place both equal 1, versus 3 at the original place. | Direction and embedding sign correct | None |
| 4.1(2), form transport API | Identity; conjugation; Q=⟨1,−1⟩ | Identity gives Q=σQ. Under conjugation Q(1,1)=0=σQ(1,1); transported identity isometry has determinant 1. Q(2,1)=3 maps to 3. | Regularity, isotropy, representation and isometry preserved | None |
| 4.1(2), local families | ⟨1,−(2+i)⟩ at (2−i) and transported plane at (2+i) | Coefficient square test is 4 mod5 on both sides; both isotropic. Reading 2−i at the untransported place has valuation 1 and is anisotropic. | Wrong fixed-place model excluded | None |
| 4.1(2), records | √5 example; zero form | Positive indices (3,1) are permuted to (1,3); rank=3 and d=[θ²]=[1] persist. Zero record remains rank0 and inadmissible on both sides. | Admissibility transport consistent | None |
| 4.1(3), localized product formula | (−1,3) over ℚ | Signs at (2,3,∞)=(−1,−1,1); finite product 1, total product 1. Pair (1,3) has all signs 1. | Correct | None |
| 4.1(3), Hasse product of a form | ⟨−1,−1,−1⟩; zero form | First: s₂=−1 and s∞=(−1)³=−1, product1. Zero form: empty pair product1 at every place. | Includes rank zero for product only | None |
| 4.1(3), admissibility of positive-rank forms | ⟨1⟩ and zero form | Line record (1,[1],all1,p=1) satisfies every clause; zero record has 1≤0 false despite product1. | Rank hypothesis correct | None |
| 4.1(3), fixed-second-argument prescription | b=−1, S={3}, T={∞}; replace 3 by 5 | a=−3 gives signs (2,3,∞)=(1,−1,−1). At 5, −1 is a square so (a,−1)₅=1 for every a. | Nonsquare condition discriminates | None |
| 4.1(3), pair prescription | S={2}, T={∞}; S={3}, T=∅ | a=b=−1 has exactly the required two minus signs, total1. A single requested minus sign has total−1 and odd cardinality1. | Parity condition discriminates | None |
| 4.1(3), coordinate norms | d=−1,a=5; d=−1,a=3 | 5=1²+2², G/L=T/T. For 3, (−1,3)₃=−1, G/L=F/F. | Native coordinate statement transports | None |
| 4.1(3), conditional existence reduction | Record of ⟨1⟩, W=⟨1⟩, a=b=1 | Both correction planes are H; H injects into H⊥⟨1⟩. Returned Q=⟨1⟩ has record I exactly. Rank0 input fails admissibility. | Conditional conclusion is tied to I | None |
| 4.2 headline, positive cases | ℚ,a=4; ℚ(i),a=−1 | 2²=4 and i²=−1; all local images have the same roots. G/L=T/T. | Correct, including no real places | None |
| 4.2 headline, negative cases | ℚ,a=−1,2,−4 | −1 and −4 fail at every p≡3 mod4; 2 fails at p≡±3 mod8. Each has infinitely many bad places and is globally nonsquare. | Finite exceptions cannot hide obstruction | None |
| 4.2 route, cyclic versus nonabelian | Quadratic cyclic E/K; splitting field of X³−2 over ℚ | Surjectivity would give index1, while cyclic degree2 requires 2≤1, F. For S₃ extension, degree6 and norm index2 give 6≤2, F, and the cyclic hypothesis fails. | First inequality used only in its scope | None |
| 4.2 eighth-power Check | 16 over ℚ, S={2} | Factorization is (X²−2)(X²+2)(X²+2X+2)(X²−2X+2). At odd p one of 2,−2,−1 is square, giving an eighth root; rational valuation at2 would require 8v₂(x)=4. | Analogue L=T,G=F | None |
| 4.3 norm adapter | d=−1,a=5 or 3; d=2,a=−1; d=1 | 5=1+4 gives T/T; 3 gives F/F at3. 1²−2·1²=−1 gives T/T. d=1 is square and excluded; its split plane is universal. | Coordinate/localization adapter correct | None |
| 5.1 binary | ℚ: ⟨1,1⟩,⟨1,−4⟩; ℚ(i): ⟨1,1⟩ | Over ℚ, first has −det=−1 nonsquare at3, F/F; second has −det=4 and vector(2,1), T/T. Over ℚ(i), 1+i²=0, T/T. | Discriminant sign correct | None |
| 5.1 ternary | ⟨1,1,−2⟩; ⟨1,1,−3⟩; ⟨1,1,1⟩ | First: d=−1,a=2=1+1 and vector(1,1,1), T/T. Second: norm sign −1 at2,3, F/F. Third: norm sign −1 at2,∞, F/F. | Norm reduction handles split and nonsplit local planes | None |
| 5.1 quaternary consequence | H⊥H; ⟨1,1,1,−7⟩ | First has nonzero zero vector and is locally isotropic. For second, −7 is square in ℚ₂ and it becomes ⟨1,1,1,1⟩: primitive squares modulo8 cannot sum to0. G/L=F/F. | Dyadic place retained | None |
| 5.5 higher-rank route | U=⟨1,1⟩, W=⟨1,−1,1⟩ | x=0 gives b=0 and degenerate ⟨0⟩⊥W. x=(1,0) gives b=1; W(0,1,0)=−1 and total value0. | Nonzero-value condition prevents singular induction input | None |
| 5.5 headline, low ranks | Zero form on zero space; line; H | Global/local isotropy values F/F, F/F, T/T respectively; H(1,1)=0 with nonzero vector. | No vacuous low-rank success | None |
| 5.5 headline, real obstruction | ⟨1,1,1,1,1⟩; ⟨1,1,1,1,−1⟩ | First is anisotropic over ℚ and ℝ, though isotropic at all finite places. Second vanishes at(1,0,0,0,1), globally and locally. | Real clauses essential | None |
| 5.5 degenerate Check | ⟨1,0⟩ | Radical vector e₂ has value0 before and after scalar extension; isotropy T/T. | README correctly distinguishes truth from its regular proof route | None |
| 6.1 headline | ⟨1,1⟩ with a=3,−1; H with a≠0; zero space | For 3 obstruction at3; for −1 at2,∞: F/F. H at((1+a)/2,(1−a)/2) has value a: T/T. Zero space with a=1: F/F. | Nonzero denominators are 2 and t only after t≠0 | None |
| 6.2 headline | ⟨3⟩ into ⟨1,1⟩; ⟨1,1⟩ into four squares; zero source; larger-rank source | F/F at3; coordinate inclusion T/T; unique zero-source map injective T/T; rank inequality fails globally and locally in last case. | Direction of representation correct | None |
| 6.3 headline | H versus ⟨2,−2⟩; lines 1 versus −1; ternaries −3 versus −1 | Hyperbolic pair T/T. Lines F/F at∞. Ternaries share signature(2,1), but at3 first anisotropic and second isotropic: F/F. | Real signatures alone insufficient | None |
| 7.2 prescribed local family | All local ⟨1⟩; positive rank3 with only s₂=−1; localizations of three negative squares | First realized by ⟨1⟩. Second product=−1, not1, so premise F. Third has finite product−1 and real sign−1, hence total1, realized by ⟨−1,−1,−1⟩. | Product condition discriminates | None |
| 7.2 correction-plane formula | a=3,b=−1 over ℚ | P=⟨1,1⟩ has det1,s=1; P′=⟨3,3⟩ has det9, same square class, and s₂=s₃=−1=(3,−1)₂,₃. | Rank/discriminant fixed, Hasse sign flipped | None |
| 7.2 real classification | Four positive squares; two of each sign; four negative squares | d=[1] for all. Pairwise s=1,−1,1; positive indices4,2,0. First and last remain distinct despite equal d and s. | Full real index needed | None |
| 7.3 headline, rank boundary | Line record; zero record; rank1 with two minus signs | Line admissible/positive-rank-realizable=T/T; zero=F/F despite being realized in rank0; rank1 bad signs have product1 but violate s_v=1, hence F/F. | No arbitrary record accepted | None |
| 7.3 headline, rank-two exception | d=[−1], two negative finite signs; d=[1], negative signs at3,7 versus3,5 | First violates hyperbolic sign1. Second realized by ⟨21,21⟩: det441, s₃=s₇=−1, s₂=1. Third fails at5 because [1]=[−1] there. | Local small-rank constraints necessary | None |
| 7.3, two real places | ℚ(√5), Q=⟨1,θ,θ⟩ | d=[θ²]=[1]; p=(3,1), real signs(1,−1); finite minus sign only over2, total(−1)·1·(−1)=1. | Admissible and realized with unequal real indices | None |
| 7.4 uniqueness | ⟨1,1⟩ versus ⟨2,2⟩; versus ⟨21,21⟩ | First records equal: det classes[1]=[4], p=2, all s=1; (x+y)²+(x−y)²=2x²+2y². Second has s₃=−1 versus1. | Equal records imply isometry; negative control differs | None |
| 8.1 headline | ⟨1,1,−1⟩ versus ⟨1,2,−2⟩; zero versus zero or line | Ternaries have rank3,d=[−1]=[−4], all s=1,p=2, so both sides T. Zero/zero T/T; zero/line F/F because ranks0≠1. | Includes rank zero correctly | None |
| 8.2 hyperbolicity | ⟨1,−1,2,−2⟩; ⟨1,1⟩; odd rank | First ≅2H: d=[1], s₂=s∞=−1 as for2H, G/L=T/T. Second has d=[1]≠[−1] and real signature2: F/F. Odd rank cannot equal2m. | Hyperbolic sign is not always1 | None |
| 8.2 Witt equality | ⟨1⟩ versus ⟨1⟩⊥H; ⟨1,1,−3⟩ versus ⟨1,1,−1⟩ | First Witt-class difference is −[H]=0 everywhere. Second difference is nonzero at3: anisotropic ternary part has dimension3 versus1, so local classes differ. | Stable equality differs from equal dimension | None |
| 8.3 headline | [H], [⟨1⟩], [⟨1,1⟩] over ℚ; lines ±1 over ℚ(i) | [H]=0 and image0; odd-dimensional line has nonzero finite image; [⟨1,1⟩] has real signature2. In ℚ(i), −1=i², so the line difference=0 and image0, with empty real factor. | Tests kernel and no-real-place case | None |
| 8.4 form consequence | Hyperbolic pair; unequal ternaries of 6.3 | First local/global isometry T/T; second F/F at3. No arbitrary cohomology-class data is quantified over. | Precisely the reverse direction of 6.3 | None |
| New 4.4 map and complex-place statement | (−1,3) over ℚ; any units a,b over ℂ | Finite support={2,3}, finite product1. Over ℂ choose y=0 and x²=b, so the norm equation holds and symbol=1. | New descriptions agree with native declarations | None |

No zero ring, characteristic-two field or inseparable number-field extension satisfies the standing number-field hypotheses. Dyadic completions are nevertheless present throughout. Empty real-place sets were tested over ℚ(i); the finite-place set of a number field is nonempty. The only denominators introduced in the routes are nonzero diagonal coefficients, 2, and an isotropic vector coordinate in the branch where that coordinate is nonzero.

## Not verifiable

- `omeara`, *Introduction to Quadratic Forms*, numbered paragraphs 58:7, 65:15, 66:1, 66:3, 66:4, 66:5, 71:19, 71:19a and 72:1: the supplied manifest records the publisher DOI as paywalled and the locators as **uncertified**. No legally readable text was supplied. I did not request or fetch it again. The exact paragraph numbering/text remains unverified; the independent Milne/native checks above do not certify O'Meara's pages.
- `serre`, *A Course in Arithmetic*, Ch. III §1.2 Theorem 1, §2.2 Theorem 3, Ch. IV §2.1 and §3.2 Theorem 8: likewise settled **uncertified** in the supplied manifest at its publisher DOI. No new request was made. The explicit sign computations were checked independently.
- No other source-access limitation was encountered. Ownership against the supplied open heads was checked; this is not a claim to have reviewed those other roadmaps in full.

## Source issues

- **Error** in milne-cft at VIII Lemma 3.4, printed p.235 (line 10679): the source says scalar representation is equivalent to isotropy after adjoining −aY², including a=0; it should be restricted to a≠0 under its nonzero-vector representation convention; affects a stated result.
- **Misprint** in milne-cft at VIII proof of Theorem 3.5(b), printed p.237 (line 10777): the source says the ternary and quaternary norm reductions use Theorem 1.1; it should be Theorem 3.1, the cyclic Hasse norm theorem; affects the proof.
- **Misprint** in milne-cft at VIII proof of Theorem 3.5(b), printed p.237 (line 10788): the source says the induction assumes Theorem 3.1b in rank n−1; it should be Theorem 3.5(b) in rank n−1; affects the proof.
- **Gap** in milne-cft at VIII proof of Theorem 3.5(b), printed p.237 (lines 10794–10803): the source says weak approximation provides c for the lower-rank nondegenerate form; it should be ensured that c≠0 even when the exceptional set is empty; affects the proof.
- **Error** in milne-cft at VIII proof of Theorem 6.10, printed p.255 (line 11755): the source says S(q₁⊥⟨a⟩)=(a,d(q₁))S(q₁); it should be (a,a)(a,d(q₁))S(q₁) for its diagonal-inclusive convention; affects the proof.
- **Error** in milne-cft at VIII §6, Generalities (a), printed p.256 (lines 11788–11789): the source says a rank-one local record is realizable with S=1; it should require S=(−1,d), as Proposition 6.11(a) states; affects a stated result.

For the first error, q=X² and a=0 give scalar representation F but isotropy of X²+0Y² T at (0,1). For the last two, over ℚ₂ the form ⟨1,−1⟩ has S=−1 whereas the displayed addition formula gives 1, and the line ⟨−1⟩ has S=(−1,−1)₂=−1, not 1. These errors are in the source, not copied into this roadmap.
