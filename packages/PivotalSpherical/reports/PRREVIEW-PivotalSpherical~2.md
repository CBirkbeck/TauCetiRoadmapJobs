# Review of PivotalSpherical (pull request #2311 at 366c9e0)

**Verdict:** needs changes

## R01 (P1) — Tensor multiplicativity is false for a general pivotal category

**Location:** `TauCetiRoadmap/PivotalSpherical/Suggested.lean:228`; `README.md:348`: “monoidality”.

**Claim:** The tensor-trace theorem and the unconditional dimension multiplicativity in Layer 2 omit compatibility of the two actions of unit endomorphisms.

**Witness:** In the pivotal matrix category Mat₂(Vecℚ), take f=id(E₁₂), g=id(E₂₁). The left side is (1,0); the right side is (0,1)(1,0)=(0,0).

**Repair:** Use the general nested-loop identity `TauCeti.leftTrace_tensorHom`, and its right-handed counterpart, from `TauCeti/CategoryTheory/Monoidal/Pivotal/Tensor.lean:140`. State multiplicativity with the scalar-action equality of `leftTrace_tensorHom_eq_comp` (line 164), or its braided/scalar-unit corollaries. Keep the matrix-category example as a negative Check; the nested-loop expression gives (1,0).

## R02 (P1) — The new scalar-trace signature does not elaborate

**Location:** `TauCetiRoadmap/PivotalSpherical/Suggested.lean:248`; `README.md:147`: “`End (𝟙_ C)` is definitionally the same thing”.

**Claim:** The signature passes a bundled endomorphism to a function taking a morphism; the accompanying convention is false at the pin.

**Witness:** `Mathlib/CategoryTheory/Endomorphism.lean:34` defines `End` as a structure with field `asHom`. Both the gate and direct elaboration fail at line 248.

**Repair:** Change the argument to `leftTrace (X := X) f.asHom`. Replace the convention with “`End X` bundles a morphism `X ⟶ X`; use `End.of` and `.asHom` to cross this boundary.” The corrected scratch copy elaborates.

## R03 (P1) — Admitted data invalidate the acceptance test

**Location:** `TauCetiRoadmap/PivotalSpherical/Suggested.lean:85`, throughout: “`: C ⥤ C := sorry`”.

**Claim:** The gate finds 47 admitted definitions or instances, including category carriers, duality, traces, induction and global dimension. Their intended operations are not determined by their signatures.

**Witness:** At lines 199–204 both traces are admitted data. In a scratch copy, `leftTrace_comm` and `leftDim_comp_rightDim_eq` close by `rfl`, without any trace or pivotal laws.

**Repair:** Delete all admitted data and declarations depending on them. Import available native constructions; retain only small definitions with real bodies needed by new headline theorems. Name genuinely unavailable carriers, such as ring-valued twisted graded categories, and their affected headlines in the module docstring; do not replace them by admitted types.

## R04 (P2) — Replace duplicate targets with the pinned Tau Ceti APIs

**Location:** `TauCetiRoadmap/PivotalSpherical/README.md:371`: “none of them exists”; `Suggested.lean:132`, `:305`, `:439`.

**Claim:** The roadmap rebuilds implemented pivotal, trace, semisimple, based-ring, Perron–Frobenius, grading, balanced and centre infrastructure, while importing no Tau Ceti module.

**Witness:** The pin defines `TauCeti.PivotalCategory` (`Monoidal/Pivotal/Basic.lean:76`), `TauCeti.IsFiniteSemisimpleCategory` (`Semisimple/Basic.lean:56`) and `FDRep.trace_eq_smul` (`RepresentationTheory/FDRep/Pivotal.lean:63`). Five native one-lemma probes pass.

**Repair:** Add exact supplier contracts and import the used `TauCeti.CategoryTheory.Monoidal.Pivotal.*`, `TauCeti.CategoryTheory.Semisimple.*`, `TauCeti.CategoryTheory.Monoidal.Grading.*` and `TauCeti.CategoryTheory.Monoidal.Center.*` modules. Remove supplied objects and results from the target lists and private declarations. Keep the ring-level scalar and pairing extensions explicitly distinguished from the field-only results.

## R05 (P2) — The ring-level split-family API has two owners

**Location:** `TauCetiRoadmap/PivotalSpherical/README.md:391`: “Split simple families”.

**Claim:** This target and open PR #2308 both own freeness, perfect composition pairings and the completeness relation over a commutative ring.

**Witness:** PR #2308, `TauCetiRoadmap/PresentationsOfMonoidalCategories/README.md:148`–158, defines `IsSplitSimpleBasis` and asks for those same three general results; its head does not replace them with supplier citations.

**Repair:** Record PivotalSpherical Layer 3 as the owner of the general split-family API and PresentationsOfMonoidalCategories Layer 2 as its consumer. Coordinate removal of the duplicate general targets from #2308; that roadmap keeps its model-specific extraction and reconstruction theorems. Do not make this existing roadmap depend on #2308.

## R06 (P2) — Finite decompositions do not imply finitely many simple classes

**Location:** `TauCetiRoadmap/PivotalSpherical/README.md:401`: “the representatives of `SimpleClasses C` form such a family”.

**Claim:** The referenced family has a finite index type, but the advertised field corollary assumes only finite decompositions and finite-dimensional simple endomorphisms.

**Witness:** Finite-support ℤ-graded complex vector spaces satisfy both assumptions. Their pairwise nonisomorphic simples δₙ have End=ℂ, yet `SimpleClasses` is indexed by all integers.

**Repair:** State the split-family pairing theorem for arbitrary indices with finite decompositions, and the completeness sum over the finite support of each object. The finite-index version is a corollary. Then the stated general semisimple field corollary applies to ℤ-graded vector spaces without adding an unjustified finiteness assumption.

## R07 (P2) — The fusion-centre and pseudo-unitarity targets omit the nonpivotal case

**Location:** `TauCetiRoadmap/PivotalSpherical/Suggested.lean:815`, `:851`, `:880`; `README.md:508`: “a pivotal fusion category”.

**Claim:** The general nonvanishing, fusion-centre and canonical pseudo-unitary structure theorems are restricted to an already chosen pivotal structure. This bypasses the squared-norm theory used by their sources.

**Witness:** `eno` lines 173–184 define global dimension by squared norms without pivotality; Theorem 2.15, lines 273–276, and Proposition 8.23, lines 1545–1547, impose no pre-existing pivotal structure.

**Repair:** Add the nonpivotal squared-norm definition and independence theorem (ENO Proposition 2.1 and Definition 2.2, preprint p.4). State centre semisimplicity, dimension squaring and pseudo-unitary pivotal existence at that generality; identify the squared-norm sum with the displayed pivotal sum when a pivotal structure is given. For Vec(C₂), both definitions give 2 and the centre gives 4.

## R08 (P2) — The spherical-to-ribbon converse is unnecessarily restricted

**Location:** `TauCetiRoadmap/PivotalSpherical/README.md:675`: “fusion-category-over-an-algebraically-closed-characteristic-zero bar, as HPT does”.

**Claim:** HPT does not restrict Proposition A.4 to fusion categories or characteristic zero; the roadmap excludes semisimple examples with infinitely many simple classes.

**Witness:** `hpt` lines 1692–1700, Proposition A.4, p.45, adds semisimplicity. Vecℤ over ℂ has spherical standard pivot and identity ribbon twist, but infinitely many simples.

**Repair:** State the converse for split semisimple rigid braided k-linear categories with finite-dimensional Hom spaces, under the induced twist, without finite-simple-class or characteristic-zero assumptions. Cite HPT Proposition A.4, pp.45–46, with splitness explicit. Keep the fusion-centre result as a corollary and the characteristic-three nonsplit-sequence example as a negative control.

## R09 (P2) — Statable headline results are omitted or replaced by mere existence

**Location:** `TauCetiRoadmap/PivotalSpherical/Suggested.lean:435`: “the statement is deliberately omitted here”; `:619`.

**Claim:** The ordinary-trace comparison is statable without a scalar algebra equivalence. The promised pivotal/balanced round-trips and pseudo-unitary uniqueness are also statable on the pinned APIs, but are absent.

**Witness:** `FDRep.trace_eq_smul`, `TauCeti.pivotalBalancedEquiv` (`Monoidal/Pivotal/OfBalanced.lean:114`) and `TauCeti.IsPseudoUnitary.existsUnique_pivotalCategory` (`PseudoUnitary/Existence.lean:161`) already state these results.

**Repair:** Reclassify these completed headlines as exact supplier contracts and remove the claims that their signatures cannot be expressed. For any genuinely new variant retained as a headline, state its full theorem against those carriers; two `Nonempty` implications do not replace round-trip equations. The trace comparison reads `trace f = LinearMap.trace k V f.hom.hom.hom • 𝟙 _`.

## R10 (P2) — Finish the spherical and indicator classification statements

**Location:** `TauCetiRoadmap/PivotalSpherical/README.md:584`: “Identify the spherical ones”; `:589`: “State the hypotheses under which they are complete.”

**Claim:** These headline interfaces do not specify the promised classification or completeness theorem, and the indicator target names no rotation map or formula.

**Witness:** For untwisted Vecℤ over ℚ, χ(n)=2ⁿ gives dimensions 2⁻ⁿ and 2ⁿ; all positive indicators of δ₁ vanish. The trivial character has the same vanishing indicators.

**Repair:** Define the pivotal rotation on Hom(𝟙,X⊗ⁿ), with finite-projective Hom modules over rings, and its trace. With the canonical basepoint and character χ, state sphericity iff χ(g)²=1 for every g. State νₙ(δg)=0 if gⁿ≠1 and otherwise χ(g)⁻¹·∏ᵣ₌₁ⁿ⁻¹ω(g,gʳ,g); deduce completeness for torsion groups. This distinguishes the two pivots on δg of C₂ by ν₂=±1.

## R11 (P2) — The matrix Perron theorem needs a nonempty index type

**Location:** `TauCetiRoadmap/PivotalSpherical/README.md:478`: “existence of the Perron root as the spectral radius, a nonnegative eigenvector”.

**Claim:** The statement gives neither a finite nonempty index hypothesis nor the required nonzero eigenvector condition.

**Witness:** For the 0×0 matrix, the only vector is zero and det(tI−A)=1, so there is no eigenvalue or nonzero eigenvector. `TauCeti/LinearAlgebra/Matrix/PerronFrobenius/Nonnegative.lean:149` requires `[Nonempty n]`.

**Repair:** Consume the pinned Perron theorem for finite nonempty real square matrices, explicitly requiring v≠0. Record the empty matrix as excluded, [0] as λ=0 with v=(1), and [[0,1],[1,0]] as λ=1 with v=(1,1).

## R12 (P3) — Pin the cocycle sign rather than assigning it to implementation

**Location:** `TauCetiRoadmap/PivotalSpherical/README.md:579`: “the exponent’s sign depends on the associator and duality conventions, which the implementation pins”.

**Claim:** The roadmap has already fixed the associator and right-dual convention; leaving the sign undecided leaves the pivotal basepoint and indicator conventions ambiguous.

**Witness:** On C₃ over ℚ, take the normalized coboundary of b(1,2)=2 and b=1 otherwise. All 81 pentagons hold; ω(1,2,1)=1/2. Inverting the proposed pivot changes right dimension 1 to 4.

**Repair:** Fix evaluation 1, coevaluation ω(g,g⁻¹,g)⁻¹ and pivotal component ω(g,g⁻¹,g), with the native right-dual conventions. Add the C₃ coboundary Check: coevaluation 2, pivot 1/2, both dimensions 1; inverse pivot gives right dimension 4 and left dimension 1/4.

## R13 (P3) — Supply the required roadmap structure and discriminating Checks

**Location:** `TauCetiRoadmap/PivotalSpherical/README.md:260`: “The build, in layers”.

**Claim:** There is no Summary, Scope and ownership or Exact supplier contracts section; no definition has the required three labelled Checks, and no layer has its own Examples, Dependencies or target-level Needs lines.

**Witness:** The file has 12 “### Layer” headings, zero `**Checks.**` blocks and zero `*Needs:*` lines. Layer 3’s pairing has no explicit positive, negative or zero-module test.

**Repair:** Use the required headings and mathematical subsection numbering while preserving existing layer citations. Replace the source-following claim at lines 844–846 with mathematical provenance, keeping the organization derived from the targets. Give each definition its API and at least three computed Checks, and each target its inputs. For the pairing use R² with dot-product value 11 on (1,2),(3,4), X=0 with value 0, and S=ℚ² where scalar surjectivity fails.

## R14 (P3) — Replace broad and incorrect source locators

**Location:** `TauCetiRoadmap/PivotalSpherical/README.md:839`: “Ch. 4 duals … Ch. 7 Frobenius–Perron and global dimension”; also `:749`.

**Claim:** Duals and Perron–Frobenius are assigned to the wrong EGNO chapters; most API bullets and the new ring extensions lack exact claim-level locators.

**Witness:** `egno` contents lines 122, 128–129, 148 and 209 place duals in §2.10, Perron–Frobenius in §§3.2–3.3, pivotal traces in §4.7 and global dimension in §7.21.

**Repair:** Replace the reference by “EGNO §2.10, pp.40–43; §§3.2–3.3, pp.51–56; §4.7, pp.73–76; §7.21, pp.179–183.” Give each remaining theorem its exact locator and hypotheses; use DGNO Proposition 2.3(iii), preprint p.7, for characters, and Ng–Schauenburg Definition 3.1, p.8, for rotation. Label ring extensions as deductions and state their additional argument.

## R15 (P3) — Remove pull-request references from mathematical content

**Location:** `TauCetiRoadmap/PivotalSpherical/README.md:232`–240: “expected from #42145”, “also in flight as #42150”.

**Claim:** The `prnum` gate fails at five entries, and the same process-dependent references recur in layer prose and Lean docstrings.

**Witness:** The gate reports `prnum=5`; `Suggested.lean:80`, `:126`, `:198` repeat numbered upstream-status labels.

**Repair:** Replace these labels and the upstream-status sections by timeless exact library contracts and bibliographic provenance. State the mathematics and native declaration names, without pull-request numbers or merge-status instructions.

## R16 (P3) — Remove process residue

**Location:** `TauCetiRoadmap/PivotalSpherical/README.md:11`: “carries the standing TODO”.

**Claim:** The `residue` gate fails, and “today”, “currently”, “in flight” and “Build … now” make the document a process narrative.

**Witness:** The supplied gate reports `residue=1` at line 11; lines 49–88 describe merge timing rather than mathematical dependencies.

**Repair:** Delete the TODO quotation and process narrative. Retain the mathematical scope in Summary and Scope and ownership, and the actual pinned inputs in Exact supplier contracts.

## R17 (P3) — Remove local instance bindings from theorem signatures

**Location:** `TauCetiRoadmap/PivotalSpherical/Suggested.lean:256`, `:615`, `:652`, `:746`, `:888`.

**Claim:** The gate reports six `letI` occurrences in five public signatures.

**Witness:** `leftDim_comp_rightDim_eq` binds P and Q with `letI`; `spherical_of_ribbon` and the three centre statements similarly hide their selected structures inside signatures.

**Repair:** Use explicit structure arguments, such as `@leftDim C _ _ _ P X`, or named canonical instances. Keep the centre’s chosen structures fixed; do not replace them with arbitrary instance parameters. Apply this to all five named signatures.

## R18 (P3) — Resolve the three undeclared README names

**Location:** `TauCetiRoadmap/PivotalSpherical/README.md:270`–271 and `:385`.

**Claim:** The README presents `doubleRightDualFunctor_ε`, `doubleRightDualFunctor_μ` and `homPairing_comp` as declarations of this roadmap, but the acceptance file declares none.

**Witness:** The gate reports `readme-ids-missing=3`. The first two already exist in `TauCeti/CategoryTheory/Monoidal/Rigid/DualFunctor.lean:362` and `:393`; the third has no local declaration.

**Repair:** Cite the two fully qualified `TauCeti` structure-map theorems in supplier contracts. State the composition-pairing API in prose without the invented local name. Do not add API declarations to satisfy the name scanner.

## R19 (P3) — Delete acceptance-file padding

**Location:** `TauCetiRoadmap/PivotalSpherical/Suggested.lean:233`, `:237`, `:605`.

**Claim:** The unit boundary case, the immediate dimension specialization and the inhabitedness wrapper are API or boundary checks, not headline acceptance theorems.

**Witness:** `leftDim_eq_rightDim_rightDual` closes with one `simpa only [leftDim, rightDim, rightAdjointMate_id] using leftTrace_eq_rightTrace_mate (𝟙 X)`; line 607 merely packages `balancedOfBraidedPivotal` into `Nonempty`.

**Repair:** Delete these three declarations from `Suggested.lean`; the README keeps the statements as API or Checks. Also delete the current vacuous versions of `leftTrace_comm` and `leftDim_comp_rightDim_eq` identified in R03; any retained new headline must use real native operations.

## R20 (P3) — Correct the independence claim in the ordering paragraph

**Location:** `TauCetiRoadmap/PivotalSpherical/README.md:776`: “Layers 3 to 5 are independent of all of that”.

**Claim:** Layer 4 explicitly assumes a pivotal category and invokes pivotal identification of duals, so its stated proof route consumes Layer 1.

**Witness:** `README.md:469`–476 requires pivotality for the complex-character theorem; line 776 says the whole layer is independent of Layers 0–2.

**Repair:** Move the pivotal-character specialization to Layer 6, or prove and cite its general based-ring version without pivotality. State item-level Needs lines; describe only the remaining semisimple/based-ring/Perron strand as independent.

## R21 (P3) — Correct the pull-request claim about available field implementations

**Location:** Pull-request description: “Tau Ceti already implements the field versions (`Semisimple/DualBasis.lean`, `Monoidal/Pivotal/Simple.lean`, `GradedObject/VecTwisted.lean`)”.

**Claim:** Only the scalar-trace file is available in this head’s pinned dependency. The other two claimed implementations cannot supply this revision.

**Witness:** At Tau Ceti pin `2fd255d`, `CategoryTheory/Monoidal/Pivotal/Simple.lean:57` exists; no `Semisimple/DualBasis.lean`, `GradedObject/VecTwisted.lean`, `homDual` or `VecTwisted` exists in that dependency.

**Repair:** Replace the sentence with “The pinned Tau Ceti supplies the field scalar-trace results. The dual-basis and twisted-graded constructions are roadmap targets at this pin; this revision specifies their ring generalizations.” Keep the description’s accurate statement that this revises the existing roadmap.

## Verified sound

Headline inventory: duality and pivotal torsors; scalar traces and dimension-product invariance; split-family perfectness and completeness; Perron–Frobenius dimensions and pseudo-unitary uniqueness; ordinary `FDRep` traces; pointed pivotal/spherical classification and indicators; universal-grading characters; pivotal/balanced equivalence and ribbon comparison; centre induction, averaging, semisimplicity and dimension squaring.

The values below evaluate the advertised mathematics; admitted Lean data supply no certified computation.

| Statement | Instances | Left side / construction | Right side / control | Result | Change |
|---|---|---|---|---|---|
| Sample: policy paragraph (51) | Pinned categorical core | Local duplicate pivotal class: 1 | Native pivotal class: 1 | duplicate | R04 |
| Sample: never push work to Mathlib (83) | Requested ownership | Targets assigned to Tau Ceti | Required upstream submissions: 0 | agrees | — |
| Sample: build Layer 0 now (267) | Native dual functor | Requested equivalence: 1 | Native equivalence: 1 | supplied | R04 |
| Sample: build PivotalCategory now (294) | Native Basic.lean | Requested class fields: 2 | Native class fields: 2 | supplied | R04 |
| Sample: build traces and spherical class (330) | Pinned trace core | Requested trace operations: 2 | Native trace operations: 2 | supplied | R04 |
| Sample: Prerequisites (686) | Dependencies of conditional centre theorem | Layer 10 conditional; Layer 11 producer | External upward/cyclic edges: 0 | agrees | — |
| Sample: Source (749) | Vec(C₂), characteristic zero | dim Z(C)=4 | dim(C)²=2²=4 | agrees | — |
| Sample: Mathlib sequencing (793) | Pinned native API probes | Five targets restated | Five one-lemma proofs pass | supplied | R04, R15 |
| Double-right-dual functor; monoidal instance | V=ℚ²; f=diag(2,3) | f**=diag(2,3) | Canonical double-dual comparison gives diag(2,3) | agrees | — |
| Right dual equivalence | ℚ², ℚ³; f rectangular | (g∘f)*=fᵀgᵀ | f*∘g*=fᵀgᵀ | agrees | — |
| Double-left-dual functor | V=0, ℚ, ℚ² | Dimensions 0,1,2 | Dimensions after double dual 0,1,2 | agrees | — |
| Mixed double-dual inverse | V=ℚ² | Evaluation twice identifies V with V | Composite matrix I₂ | agrees | — |
| PivotalCategory; pivotalIsoApp | Vecℤ; χ(1)=2 | φ₁=2; φ₂=4 | φ₁⊗φ₁=4; constant rescaling 2 fails | agrees | — |
| Pivotal pairing | Degree 1, untwisted; φ=2 | Pivotal evaluation 2; coevaluation 1/2 | Both snake composites 1 | agrees | — |
| Freyd–Yetter theorem | χ(1)=2 | φ₋₁=1/2 | (φ₁⁻¹)*=1/2 | agrees | — |
| MonoidalAut and commutative group | Vecℤ; characters 2ⁿ,3ⁿ | Product at 1: 6 | Reverse product: 6; inverse: 1/2 | agrees | — |
| Pivotal torsor transitivity | P(n)=2ⁿ; Q(n)=3ⁿ | u(1)=2/3; uQ at 1=2 | P at 1=2 | agrees | — |
| Pivotal torsor uniqueness | Same P,Q; uQ=u′Q | 3u(1)=2=3u′(1) | u(1)=u′(1)=2/3 | agrees | — |
| Left trace definition | Degree 1, χ(1)=2; f=3 | Pivotal coevaluation 1/2 times 3 | Left trace 3/2 | agrees | — |
| Right trace definition | Same object and f | 3 times pivotal evaluation 2 | Right trace 6 | agrees | — |
| Left dimension | Same object; f=id | Left trace of identity 1/2 | Left dimension 1/2 | agrees | — |
| Right dimension | Same object; f=id | Right trace of identity 2 | Right dimension 2 | agrees | — |
| Trace cyclicity | f=(1,2)ᵀ; g=(3,4) | Tr(gf)=11 | Tr(fg)=3+8=11 | agrees | — |
| Trace and dual mate | Degree 1; χ(1)=2; f=3 | Left trace 3/2 | Right trace on dual 3·(1/2)=3/2 | agrees | — |
| Left trace tensor theorem | Mat₂(Vecℚ); E₁₂,E₂₁ | (1,0) | (0,1)(1,0)=(0,0) | false | R01 |
| Unconditional dimension multiplicativity | Same identities | dimL(E₁₁)=(1,0) | dimL(E₁₂)dimL(E₂₁)=(0,0) | false | R01 |
| Unit trace | Unit; scalar 3 | Trace 3 | Scalar 3 | boundary | R19 |
| Dimension under dual | Degree 1; χ(1)=2 | dimL=1/2 | dimR(dual)=1/2 | API specialization | R19 |
| Scalar trace over a ring | R=ℤ/4; δₑ; f=2 | Left trace 2 | Scalar 2 times dimension 1 =2 | signature repair | R02 |
| Pivotal dimension-product invariance | Vecℤ; pivots 2ⁿ and 3ⁿ | (1/2)·2=1 | (1/3)·3=1 | intended identity; vacuous encoding | R03 |
| SphericalCategory | Vec(C₂), χ(g)=−1; Vecℤ, χ(1)=2 | C₂: left=right=−1 | ℤ: left=1/2, right=2 | distinguishes | R10 |
| Common trace | C₂ sign pivot; f=3 | Left trace −3 | Right trace −3 | agrees | — |
| Quantum dimension | C₂ sign line; zero object | −1; 0 | Tr(id) values −1; 0 | agrees | — |
| Trace additivity and linearity | ℚ²; diag(2,3), diag(1,4) | Tr(sum)=10; Tr(2f)=10 | 5+5=10; 2·5=10 | agrees | — |
| Biproduct dimension | ℚ²⊕ℚ³; zero summand | 5; 2 | 2+3=5; 2+0=2 | agrees | — |
| Composition pairing | S=R; X=R²; R=ℤ | (1,2) followed by (3,4): 11 | Dot product 3+8=11 | agrees | — |
| Perfect pairing theorem | R=ℤ, ℤ/4, zero ring; X=R² | Gram matrix I₂; determinant 1 | Dual map identity; zero-ring modules both zero | agrees | — |
| Finite split-family corollary | Finite-support ℤ-graded ℂ-spaces | Every decomposition finite; End δₙ=ℂ | Number of simple classes infinite | false finiteness implication | R06 |
| Dual-basis API | R=ℤ; X=R² | eᵢ followed by eⱼ*=δᵢⱼ | I₂ entries 1,0,0,1 | agrees | — |
| Canonical element independence | Basis (e₁,e₂) and (e₁,e₁+e₂) | Sum of dual⊗basis represents I₂ | Changed-basis sum also I₂ | agrees | — |
| Completeness relation | X=R² and X=0 | e₁e₁*+e₂e₂*=I₂; empty sum 0 | Identity I₂; identity on zero 0 | agrees | — |
| Functorial constituent factorization | F=id; B=R²; T=R | Two rank-one summands give I₂ | Canonical element gives I₂ | agrees | — |
| Finite semisimplicity class | Vecℚ; zero object; ℚ[t]/t²-modules | Finite decomposition; empty decomposition | Jordan block has no simple direct-sum decomposition | agrees | — |
| SimpleClasses; representative; simple instance | Vecℂ; Vec(C₂) | 1 class; 2 classes | Representatives dimension 1; nonisomorphic degrees | agrees | — |
| Multiplicity | S=ℝ-rotation simple of C₃; X=S | Multiplicity 1 | dimℝ End(S)=2; nonsplit formula excluded | agrees | — |
| Split multiplicity formula | S=ℂ; X=ℂ² and 0 | Multiplicities 2,0 | Hom dimensions 2,0 | agrees | — |
| Scalar unit equivalence | Vecℂ; Vec over ℂ(t) viewed ℂ-linear | End unit ℂ; ℂ(t) | Scalar surjective in first; t absent in second | agrees | — |
| Fusion coefficient | Repℝ(C₃), unit and rotation V | Raw Hom dimension 2 | Multiplicity 1; split hypothesis excludes it | agrees | — |
| Grothendieck based ring | Vec(C₂) | [g]²=[1] | Ngg¹=1; Nggᵍ=0 | agrees | — |
| Based-ring transitivity | Vec(S₃); any x,z | Choose y=x⁻¹z | Coefficient Nxyᶻ=1 | agrees | — |
| Complex characters respect duals | C₃ character ζ; S₃ sign character | ψ(g⁻¹)=ζ²; ψ(transposition)=−1 | Conjugates ζ²; −1 | agrees | — |
| Perron existence and degeneracy | Empty matrix; [0]; swap matrix | No nonzero vector; λ=0; λ=1 | Characteristic polynomial 1; v=1; v=(1,1) | needs nonempty index | R11 |
| Positive/primitive/irreducible Perron API | All-ones 2×2; swap matrix | Roots 2,0; roots 1,−1 | Perron roots simple; swap not primitive | agrees | — |
| Unique nonnegative based-ring character | C₂; N₁+Nᵍ=[[1,1],[1,1]] | χ(g)=1; Perron vector (1,1) | χ(g)=−1 violates nonnegativity | agrees | — |
| Frobenius–Perron dimension | Vec(C₂), 0 and 1⊕g | 0; 2 | Zero iff zero; dim((1⊕g)²)=4=2² | agrees | — |
| Global dimension and pivot independence | Vec(C₃), character ζ | 1+ζζ⁻¹+ζ²ζ⁻²=3 | Trivial-pivot sum 1+1+1=3 | agrees | — |
| Categorical/FP bound | Fibonacci and Yang–Lee dimension roots | φ≈1.618; −1/φ≈−0.618 | Absolute values ≤ FPdim=φ | agrees | — |
| Pseudo-unitarity and unique positive pivot | Vec(C₂), pivots +1 and −1 | Both global dimensions 2 | Only +1 pivot has both simple dimensions +1 | general theorem narrowed | R07 |
| FGModuleCat left-rigid and rigid instances | ℚ²; standard basis | Evaluation Σeᵢ*eᵢ | Both snake maps I₂ | agrees | — |
| FDRep pivotal and spherical instances | C₃ Jordan representation in characteristic 3 | Standard pivot I₂ | Left=right ordinary trace | agrees | — |
| FDRep quantum-dimension theorem | Ranks 0,1,2 in characteristic 2 | Dimensions 0,1,0 in field | Rank cast 0,1,0 | supplied | R04 |
| FDRep ordinary-trace headline | Trivial representation; f=diag(2,3) | Categorical trace 5·id | Linear trace 5·id | omitted but native | R09 |
| Normalized cocycle predicate and bundle | C₃ coboundary; constant function 2 | 81/81 pentagons for coboundary | Constant 2: pentagon 8≠4; normalization fails | agrees | — |
| VecTwisted carrier and category | R=ℤ; G=ℤ; δ₁⊕δ₋₁ | Support size 2; End δ₁=ℤ | Infinite-support family excluded; torsion ℤ/2 nonprojective | agrees | — |
| VecTwisted tensor and unit | G=S₃; g=(12), h=(23) | δg⊗δh=δ(123) | Reverse order δ(132); unit degree e | agrees | — |
| VecTwisted rigidity | δg; evaluation 1, ω(g,g⁻¹,g)=1/2 | Coevaluation 2; snake 2·(1/2)=1 | Dual degree g⁻¹ | agrees | — |
| VecTwisted pivotal basepoint | Same C₃ coboundary | Pivot 1/2 gives dimL=dimR=1 | Inverse pivot 2 gives dimL=1/4, dimR=4 | sign must be pinned | R12 |
| VecTwisted pivotal classification | R=ℤ; G=C₂; R=zero ring | Characters 2; characters 1 | Pivots 2; pivots 1 | agrees | — |
| Indicator definition and non-completeness | C₂ sign pivot, n=2; ℤ degree 1 | ν₂=−1; all positive νₙ=0 | Trivial C₂ pivot ν₂=1; ℤ trivial pivot same zeros | missing formula | R10 |
| Grading; adjoint generators | Vec(C₂); simple g versus X=1⊕g | g⊗g*=1 | X⊗X*=2·1⊕2·g; arbitrary X gives wrong closure | agrees | — |
| Universal grading group and group instance | Vec(C₂); Rep(S₃) | U=C₂; U=1 | Neutral pieces Vec; all Rep(S₃) | agrees | — |
| Monoidal-aut character equivalence | Vec(C₂) over ℂ; Rep(S₃) | Characters 2; characters 1 | Monoidal automorphisms 2; 1 | native at wider generality | R04 |
| Pivotal-character torsor theorem | C₂ pivots P(g)=−1,Q(g)=1 | Unique χ(g)=−1 | χ(g)Q(g)=P(g)=−1 | agrees | — |
| BalancedCategory | Graded braiding b(m,n)=q^(mn); θ(n)=q^(n²) | θ(m+n)=q^(m²+2mn+n²) | θ(m)θ(n)b(m,n)b(n,m)=same | agrees | — |
| RibbonCategory | Same θ; symmetric Vecℤ twist 2ⁿ | q^((-n)²)=q^(n²) | 2⁻ⁿ≠2ⁿ at n=1 rejects ribbon | agrees | — |
| Induced balanced structure | Symmetric Vec, standard pivot | Twist I | HPT equation (3) gives I | agrees | — |
| Nonempty balanced wrapper | Chosen balancedOfBraidedPivotal | One supplied structure | Nonempty constructor ⟨that structure⟩ | padding | R19 |
| Ribbon implies spherical | C₂ sign twist | Dual-compatible twist −1 | Left and right dimensions −1 | agrees | — |
| Balanced-to-pivotal; round-trips | Symmetric Vecℤ; θ(n)=2ⁿ | Recovered φ(n)=2ⁿ | Re-induced θ(n)=2ⁿ | round-trips omitted | R09 |
| Spherical does not imply ribbon generally | FDRep F₃ C₃; generator I+N | Tr((I+N)f)=Tr((I−N)f)=2a | Dual twists [[1,0],[2,1]]≠[[1,0],[1,1]] | agrees | — |
| Semisimple spherical-to-ribbon converse | Standard Vecℤ over ℂ | Left=right; twist I | Dual twist I; infinitely many simples | unnecessarily excluded | R08 |
| Centre rigid structure and dual comparison | Z(Vec(C₂)); object (g,χ) | Dual (g⁻¹,χ⁻¹) | Underlying dual δg⁻¹; comparison I | agrees | — |
| Induced centre pivotal structure | C₂ sign pivot | Component at (g,χ)=−1 | Forgotten pivotal component −1 | agrees | — |
| Centre pivotal forgetfulness theorem | Same central object | Underlying composite −1·1·1 | Base pivotal component −1 | agrees | — |
| Induced centre balanced structure | Z(Vec(C₂)); g nontrivial, χ(g)=−1 | Standard-pivot twist −1 | Sign-pivot twist +1 | agrees | — |
| Centre preadditive and linear instances | Vec; maps 2,3; scalar 4 | Sum 5; scalar multiple 8 | Underlying operations 5; 8 | agrees | — |
| Forgetful additive instance | Central maps 2,3 | U(2+3)=5 | U(2)+U(3)=5 | agrees | — |
| Forgetful linear instance | Central map 2; scalar 4 | U(4·2)=8 | 4·U(2)=8 | agrees | — |
| Forgetful faithful instance | Central maps 2 and 3 | Underlying maps unequal | Original maps unequal | agrees | — |
| Centre abelian structure | Vec; map diag(1,0) | Kernel dimension 1; cokernel dimension 1 | Underlying kernel and cokernel dimensions 1 | agrees | — |
| Forgetful preserves finite limits | Same kernel; zero object | U(ker f) has dimension 1; U(0)=0 | ker(Uf) dimension 1; terminal dimension 0 | agrees | — |
| Forgetful preserves finite colimits | Same cokernel; zero object | U(coker f) dimension 1; U(0)=0 | coker(Uf) dimension 1; initial dimension 0 | agrees | — |
| Centre monoidal-preadditive instance | Vec scalars 2,3,4 | (2+3)⊗4=20 | 2⊗4+3⊗4=8+12=20 | agrees | — |
| Centre monoidal-linear instance | Vec scalars 2,3,4 | (4·2)⊗3=24 | 4·(2⊗3)=24 | agrees | — |
| Ribbon centre theorem | Spherical Vec(C₂) over ℂ | Central twists ±1 | Their duals also ±1 | agrees | — |
| Induction functor | Vec(C₂); X=δₑ | Underlying I(X)=2δₑ | Centre decomposition (e,+)⊕(e,−) | agrees | — |
| Left induction adjunction | X=δₑ; Z=(e,+) | dim HomZ(I X,Z)=1 | dim HomC(X,U Z)=1 | agrees | — |
| Right induction adjunction | Same X,Z | dim HomZ(Z,I X)=1 | dim HomC(U Z,X)=1 | agrees | — |
| Global dimension definition | Vec(C₂), characteristic 0; characteristic 2 | 1+1=2; 1+1=0 | Squared-norm sums 2; 0 | agrees | — |
| Global dimension nonvanishing | Vec(C₂) char 0; Vec(C₃) char 3 | 2≠0; 3=0 | CharZero admits first, excludes second | agrees | — |
| Averaging identity and normalization | Vec(C₂); Z=unit | Normalized composite 2·id | dim(C)·id=2·id; rescaled unit gives 6·id | agrees | — |
| Centre semisimplicity | Vec(C₂) char 0; char 2 | Centre semisimple; not semisimple | dim(C)=2≠0; dim(C)=0 excludes second | agrees | — |
| Centre fusion hypotheses | Vec(C₂) over ℂ | Four simple classes; Hom dimensions 0 or 1 | Unit endomorphism dimension 1; simple unit | agrees | — |
| Centre dimension-squaring theorem | Vec(C₂) over ℂ; alternative tensor structure | Canonical global dimension 4 | 2²=4; transported Rep(D₁₀) gives 10 | agrees | — |
| Layer order assertion | Layer 4 complex-character route | Pivotal premise used: 1 | Claimed core dependencies: 0 | contradiction | R20 |
| Source chapter locator | EGNO contents | Duals §2.10; Perron §§3.2–3.3 | README Ch.4 and Ch.7 | wrong locators | R14 |
| PR implementation assertion | Pinned field files | Simple.lean present: 1 | DualBasis/VecTwisted present: 0 | unsupported at pin | R21 |
| HPT Lemma A.5 over a nonsplit field | Real C₃ rotation simple V; J²=−I | End(V)=ℂ; Hom(1,V⊗V*) has real dimension 2 | Identity/complex-structure contraction Tr(J)=0 | source error; split case used | — |

- Sources: 14 named mathematical locators opened across 7 readable works; all 8 seeded targets examined; 6 upstream PR pages retrieved; 1 work uncertified.
- Pins: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`; native `End` opened at `Mathlib/CategoryTheory/Endomorphism.lean:34`, including its missing definitional coercion to Hom.
- Library witnesses: 5 native exact-lemma probes pass; core APIs opened at `TauCeti/CategoryTheory/Monoidal/Pivotal/Basic.lean:76`, `Trace.lean:139`, `Tensor.lean:164`, and `Semisimple/Basic.lean:56`.
- Further native witnesses: `Semisimple/FrobeniusPerron.lean:116`, `Monoidal/Grading/Classification.lean:68`, `Monoidal/Center/Pivotal.lean:139`, `RepresentationTheory/FDRep/Pivotal.lean:63`; the two automated same-name hits were unrelated homonyms.
- Cross-roadmap audit: 1 explicit CharacterTheory link resolved on main (scope line 115, contract line 241); 4 closest-roadmap scopes read; 1 duplicated open-PR API; 0 dropped-id or conflicting-head overlaps; no second copy of this roadmap.
- Dependency check: `depcheck: 244 roadmaps, 2198 edges, 0 problem(s)`; no UPWARD or CYCLE; no declared gaps.
- Gate: FAIL — prnum 5, sorry-data 47, residue 1, statement-hygiene 6, readme-ids-missing 3, build failure; direct elaboration reproduces line 248; `.asHom` scratch repair passes.
- Signatures/probes: 71 named declarations and 18 anonymously declared instances checked with `#check @`; 3 supplied binder-loss alerts are false positives; 23 admitted theorems probed, 3 close without admission; 0 PR files changed and 0 outside-folder changes.

Overlap check: read PresentationsOfMonoidalCategories, CategoricalOperatorAlgebras, QuantumGroups, TemperleyLieb; general split-family duality belongs to PivotalSpherical (duplicate in #2308); generic pivotal/trace/fusion/centre theory belongs to PivotalSpherical or its pinned implementations; analytic unitary refinements, quantum-group instances and diagram instances belong to the respective consumers.

Source independence: 20 passages compared with 7 mathematical sources, no nonmathematical wording or material reuse found; largest share HPT, 17 of 32 explicit mathematical locator occurrences including repetitions. HPT contents compared: no one-to-one chapter sequence; duality→traces and semisimplicity→based ring→Perron are mathematical dependencies. Freyd–Yetter wording was not testable.

## Not verifiable

- `freyd_yetter`: the sources service resolved Freyd–Yetter (1989) only to a paywalled Elsevier work; original wording/definition was not read. Selinger Lemma 4.11 independently supports the redundancy claim.
- No computational interpretation can be certified for the 47 admitted data bodies; table values refer to the stated constructions, not evaluations of those bodies.

## Source issues

- **Error** in hpt at Lemma A.5, p.46: the source says nonzero evaluation-type and coevaluation-type maps for a simple object always compose nontrivially over any field; it should assume split simple endomorphisms; affects a stated result.
- **Error** in selinger at Remark 4.22, p.28: the source says the proposed iteration yields countably infinitely many distinct pivotal–twist correspondences; it should give two distinct correspondences; affects nothing.

## For the human reviewers

- Licence: `TauCetiRoadmap/PivotalSpherical/Suggested.lean:25`–36 attributes target signatures to Mathlib pull requests #42145, #42150, #42191 and #42192, outside the pinned library; review the stated formalisation reuse and its licence.
