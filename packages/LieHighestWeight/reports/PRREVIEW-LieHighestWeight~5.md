# Review of LieHighestWeight (pull request #1220 at b469a66)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`

**Verdict:** needs changes

Four findings, two blocking. Filenames below are relative to the folder above; library paths refer to the pinned packages. The passing gate does not detect the admitted data and form violations in the companion files. No pull-request file was changed.

## R01 (P1) — Four consumed prerequisites lack registered supplier contracts

**Location:** README.md:52–58 and :384–433: “not supplied by the cited sections of the roadmaps on which they depend”.

**Claim:** §§5.1–5.2, Layer 9 and §10.2 need regular complexification, the normalized torus period lattice, compact Frobenius–Schur and skew Littlewood–Richardson theory.

**Witness:** No readable `packages/LieHighestWeight/design/plan.json` registers these slugs. Main LieGroups:407 supplies holomorphic extension; CompactGroups:369 character orthogonality; SchurWeyl:323 Schur functions and RSK. These do not supply the additional contracts.

**Repair:** Register the four README slugs with matching named suppliers, sections and precise needs in the design gaps, or supply owned extension targets before their applications. A correctly declared gap is an acceptable contract; merely putting the slug in the README does not register it for intake. Retest the contracts on the U(1) inverse character (extension value 1/2 at 2), SU(2)'s period 2π and root/cocharacter pairing 2, its standard module's indicator −1, and the coefficients 1,1 in `s_(1)^2=s_(2)+s_(1,1)`. These mathematical instances pass; registration and ownership are the defect.

## R02 (P2) — Tensor acceptance targets still depend on admitted data

**Location:** Sl2TensorOrthogonalityTargets.lean:49: “noncomputable def polynomialSymmetric : ∀ d : ℕ, P d ≃ₗ[ℂ] S d := by sorry”; also :31, :72 and :77.

**Claim:** The equivalence, homogeneous vectors and raising/lowering operators are usable acceptance-test definitions.

**Witness:** The equivalence is admitted data. The other three definitions contain admitted construction obligations; the transported representation and tensor theorems depend on these definitions. All four survive unchanged at this head.

**Repair:** Delete the admitted definitions and their dependent acceptance declarations. State the genuine headline as existence on native carriers using only fully constructed simple definitions, as in `exists_polynomialSymmetric` in Suggested.lean:63; otherwise name the missing construction in the module docstring. Do not substitute unconstrained maps or scalar algebra. The degree-two test distinguishes the intended normalization: averaged xy has norm squared 1/2, but twice its image has norm squared 2. The corrected statement must exclude that rescaling.

## R03 (P3) — Companion files do not follow the acceptance-file form

**Location:** AffinePBWFirstOrderTargets.lean:1–11; ReductiveCenterTargets.lean:1–11; Sl2TensorOrthogonalityTargets.lean:1–14; TypeAHaarTargets.lean:7–15. Example: “import Mathlib.Algebra.MvPolynomial.PDeriv”.

**Claim:** These are additional target-signature files, subject to the same rules as Suggested.lean.

**Witness:** Three companions retain Mathlib submodule imports, two omit `import Mathlib`, and required module/declaration documentation or layer comments are absent. The files retain illustrative/API catalogues instead of just headline statements.

**Repair:** Consolidate retained headlines into Suggested.lean or apply its prescribed import, module-docstring, layer and declaration-docstring form to every retained companion. Use one `import Mathlib`, followed only by used TauCeti modules. The normalized-import scratch elaboration succeeded for all declarations; this verifies that the forbidden import form is unnecessary, not that the submitted form passes policy.

## R04 (P3) — Remove worked examples and library consequences from acceptance targets

**Location:** ReductiveCenterTargets.lean:43, :76, :91–95, :111; AffinePBWFirstOrderTargets.lean:23; Sl2TensorOrthogonalityTargets.lean:198–214. Example: “theorem splitEnveloping_mem_center_iff”.

**Claim:** Generator equations, centrality transport, trace/action evaluation and the three specified cross-products are headline acceptance statements.

**Witness:** Center transport closes with `exact MulEquivClass.apply_mem_center_iff (splitEnveloping K Z S e)`. Five other declarations already have single `simp`, `rfl` or native-theorem proofs. The specified tensor cross-products reproduce README Checks.

**Repair:** Delete it from `Suggested.lean` and the companion acceptance files; keep these statements as README API or Checks. Remove definitions used only by that padding. Do not prove admissions in place. The center test gives true for Ω and false for e before and after transport, since `[h,e]=2e`; the three tensor cross-products give 0,0,0 for n=2,3,4. Correctness of those calculations does not make them the general orthogonal-decomposition headline.

## Previous findings: repair audit

Each finding of the review at 605ae69 was checked before the full pass. The companion files remain unchanged. No supplied repair report marks a finding “not actionable in this package”.

| Previous finding | Passage at this head | Result |
| --- | --- | --- |
| R01: supplier registration | README:52, “not supplied by the cited sections”; :384–433 lists the four slugs | **Not repaired.** Precise README descriptions remain, but the required matching design-gap entries are absent. Current R01. |
| R02: admitted tensor data | Sl2TensorOrthogonalityTargets:49, “:= by sorry” | **Not repaired.** Current R02. |
| R03: finite-orbit separation ownership | README:374, “Consume … ReflectionInvariantTheory §2”; :379, “not the interpolation-and-averaging construction” | **Repaired.** The supplier exists on main; :1647–1670 retains only the actual Weyl-action/double-dual and ρ-translation adapters. |
| R04: companion form | AffinePBWFirstOrderTargets:1, “import Mathlib.Algebra.MvPolynomial.PDeriv” | **Not repaired.** Current R03. |
| R05: padding | ReductiveCenterTargets:76, `splitEnveloping_mem_center_iff` | **Not repaired.** The one-library-lemma probe succeeds again. Current R04. |
| R06: orbit/order APIs and Checks | README:1105, “use Mathlib's `MulAction.orbit`”; :1122, “Define the orbit sum”; :1140, “define the predicate that μ is a dominant” | **Repaired.** Separate APIs and distinct-orbit, stabilizer, integrality and direction controls now occur at :1102–1180. |
| R07: Pieri/Serre locators | README:1223–1236, “Corollary 30.7, p. 160”; :1715–1729, “Theorem 24.2 and Lemma 24.3, pp. 130–132” | **Repaired.** Both locations were opened in Etingof 18.755; the stated split-field algebraic extensions preserve the proof inputs. |

## Verified sound

The review read all 2,852 README lines, all five Lean files, the family index, the previous review and the change description. It compared the repository's normative README/CONTRIBUTING and main-roadmap shapes, including ReflectionInvariantTheory and Completed/OrthogonalL2Bases. The prescribed outside-folder diff is empty. The checked head is exactly the head in this report. No computational algorithm, new route-specific restriction, copied source passage or `set_option` was found in the reviewed folder. The remaining original roadmap is built on rather than discarded; rejection of its scope is not warranted.

The worker's gate reports every check passing, including the targeted build, with zero stray files and zero outside-folder changes. Independently, the targeted build of LieHighestWeight.Suggested and AdoIwasawa.Suggested completed, and direct `lake env lean` elaboration of the absolute Suggested.lean path completed with only the 15 permitted `sorry` warnings. This is elaboration evidence, not a truth check. Companion import/form violations are R02–R04; the passing gate does not supersede them.

The final rerun of the required dependency check returned exactly:

```text
depcheck: 204 roadmaps, 1592 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. Every `*Needs:*` line and named supplier citation was read. The source of the remaining dependency defect is the four unregistered gaps, not the merge-order check.

All **121 declarations** were inspected with `#check @name` in one scratch elaboration combining the files under normalized permitted imports. It completed successfully. The resulting signatures preserve the required algebraic closure in the highest-weight theorems, the split-field hypotheses in the Serre theorem, the finite-dimensional hypotheses in invariant-form statements, and the tensor bounds `r≤min m n` and `k≤m+n−2r`. The arbitrary-field product-center theorem does not accidentally acquire characteristic zero or finite dimension. The polynomial-degree and Cartan-restriction definitions do not acquire unrelated section hypotheses. No lost essential binder was found and no declaration was changed.

There are **60 theorem declarations**, 55 admitted. Each admitted theorem was tried with single `simp`, `rfl` and `infer_instance` probes in scratch; the center transport also received the exact one-library-lemma probe recorded in R04. That admitted transport theorem closed. The other 54 admissions remained admissions under those probes. Five existing elementary proofs provide additional padding witnesses: two generator equations, trace evaluation, trace nondegeneracy and central-action evaluation. An unsuccessful one-tactic probe is not evidence of depth.

### Headline coverage

The fifteen statements in Suggested.lean are: normalized polynomial/symmetric-power comparison; finiteness over a central subalgebra from monic relations; normalized PBW symmetrization; minuscule Pieri; the invariant-form/Tits-sign criterion; Lie–Chevalley restriction; filtered Harish–Chandra; equality of central characters iff dot orbit; injectivity of the normalized Serre lift; the split octonion/G₂ and Albert/F₄ identifications; E₈ dimension; E₆/E₇ dimensions; the general-central-weight `gl_n` dual-standard Pieri rule; and the normalized product-center equivalence. Their signatures use native carriers and actual maps, not arbitrary predicates standing for the conclusions.

The module docstring explicitly accounts for absent Rees/fibre/Poisson carriers, category O, affine actions, compact period lattices, compact comparison maps, LR tableaux and exceptional graded-model structures. The statable type-A Schur-character equality is correctly assigned to ClassicalGroups Layer 4, whose Suggested.lean:215 already states `character_irreducible_eq_detTwist`. It should not be duplicated here. The companion tensor catalogue still does not provide a permissible acceptance statement for its concrete orthogonal decomposition because of R02. The scalar affine identity is an algebraic calculation, not a substitute for the Rees comparison named as unavailable in the docstring.

### Seeded source checks

All eleven sampled targets were examined against legal texts where obtainable. Locators below refer to the exact versions read, not remembered published numbering. The source-access failures are separated below. The algebraic adaptations explicitly claimed as derivations were checked against the native inputs and their stated hypotheses.

| Sample | Text and locator checked | Support and limits |
| --- | --- | --- |
| §0.1 polynomial tensor strings/orthogonality | `etingof755` lines 2426–2549; §11.4, Theorems 11.16 and 11.18, printed pp. 65–68 | Highest-weight ladder and Clebsch–Gordan decomposition over ℂ. The polynomial coefficients, factorial norms and Hermitian normalization are additional derived calculations, checked below. The source's monomial-direction typo is not copied. |
| §3.1 PBW/Rees/linear Poisson | `gutt` lines 899–922, Lecture 1, slide 14/28; `etingof` lines 2993–2999, proof of Theorem 13.5, p. 69 | Gutt fixes the positive linear bracket and averaged PBW convention over ℝ. The arbitrary-commutative-ring, free-Lie-module Rees assertion is explicitly derived from native ordered PBW; it is not attributed to the real lecture as a general theorem. |
| §3.2 ordered/symmetrized first order | `gutt` lines 899–922, same slide | Supports the positive bracket and symmetric quantization convention. The ordered splitting and its coboundary correction are derived; the affine computation below distinguishes both choices. |
| §5.1 opposition/self-duality | `etingof755` lines 6640–6658, Example 32.13 and Proposition 32.14, pp. 176–177; `etingof` lines 3469–3472, §17.2, p. 81 | The first text is about self-dual representations of a complex simple group; the second supplies the principal sl₂ construction. The README names the split Chevalley/principal-sl₂ route for its algebraic extension and keeps compact FS separate. |
| §5.2 integral type-A characters/Haar | `woit` lines 94–163, §2 Theorem 1, pp. 2–4, and 192–244, §3 Theorem 2, p. 5 | Normalized compact connected Weyl integration and the integral norm-one argument. The virtual-character construction and dominance induction are additional stated inputs. Regular GLₙ extension remains the gap in R01. |
| §6.1 orbit sums/integral root order | `etingof755` lines 5855–5985, Proposition 30.4 and Corollary 30.5, pp. 159–160; Mathlib `MulAction.orbit`/`orbit_smul` | Dominance uses nonnegative integer root combinations; character expansion uses distinct orbits. A₁ zero has orbit size 1, although its Weyl stabilizer has size 2. The integral-order controls below reject μ=1 below λ=2. |
| §6.2 rational Weyl/finite torus | `etingof755` lines 5127–5147, Proposition 26.3 and Theorem 26.4, pp. 139–140; native finite Fourier declarations listed below | Clearing the Weyl denominator gives the identity in the actual integral character lattice. Division is restricted to nonzero denominators; singular-torus values are evaluated by the finite character. Generic distributional reconstruction stays with its owner. |
| §7.1 polynomial carriers | `etingof` lines 2153–2244, Theorem 10.1, Remark 10.2, Example 10.3, pp. 51–53; lines 2993–2999 and 3041–3081, Theorems 13.5/14.1, pp. 69–71 | Lie invariants, restriction, symmetrization and the HC shift are supported in the complex setting. The README gives algebraic trace/polarization and root-exponential routes rather than importing an analytic real theorem over arbitrary fields. |
| §9.2 reductive center/invariant maps | `etingof` lines 2207–2244, Remark 10.2 and Example 10.3, pp. 52–53; line 3081, Remark 14.2, p. 71 | Reductive extension and matrix trace invariants. The actual center/derived and group/Lie comparisons are separately named and have explicit maps; the characteristic-zero smooth-subgroup input resolves to ReductiveGroups Layer 5P. |
| §9.3 normalized product map | Native Prod/Abelian enveloping equivalences and Mathlib tensor centralizer theorem; cited Dixmier §1.6 unavailable | Native generators determine the product map; the rank-zero and one-central-direction controls pass. The Dixmier text could not be certified legally, so its locator is not reported verified. |
| §10.2 compact-center application | `garnier` lines 231–286, Theorems 1.3.2/1.3.5, pp. 4–5; lines 389–396, Proposition–Definition 2.2.1, pp. 7–8; lines 642–646, Corollary 2.2.7, p. 10; lines 1161–1199, Proposition 2.3.1, pp. 16–17; `etingof755` lines 8808–8849, Theorem 43.4 and Corollaries 43.5–43.6, pp. 231–232 | Affine Coxeter action, alcove fundamental domain and intermediate-lattice extension; compact semisimple covering/center consequences. The text does not replace the 2π-normalized period-lattice contract. |

The repaired Pieri locator is `etingof755` Corollary 30.7, p. 160 (lines 5960–5985); its wall cancellation and minuscule strings are algebraic. The repaired presentation locator is Theorem 24.2/Lemma 24.3, pp. 130–132 (lines 4763–4857): the proof establishes root support and one-dimensional root spaces using rank-one strings and Weyl invariance. The README explains the split characteristic-zero extension. Stacks Lemma 122.11, tag 02ML (`stacks-02ML` lines 13990–14016), supplies the localized generic-finiteness input, not a conclusion in inseparable characteristic.

Garnier was read in the author's 23 October 2020 manuscript; its extraction has additional page markers, so the locators above use printed pages. Gutt's locator is the numbered lecture slide, not the PDF page count. Etingof's two texts are distinct entries: `etingof` is arXiv:2401.01446v2 and `etingof755` is the MIT 18.755 Spring 2024 full notes. The latter's theorem numbering agrees with the README's added locators.

### Pinned-library and ownership audit

Object searches used the roadmap search service, main, the board packages and the supplied open work, as well as both pinned libraries. Searches covered symmetric powers/normalization, PBW and Rees, Poisson brackets, finite and distributional Fourier transforms, highest-weight decomposition, invariant forms, Serre lifts, trace invariants, centers, compact forms and alcoves. No distinct roadmap was found declaring the retained headline names in this roadmap's namespace; the hits were this PR and its own existing version on main.

The following opened declarations are material to the review; paths are relative to their library root.

| Pin/file and line | Declaration or definition examined | What it supplies, and what it does not |
| --- | --- | --- |
| Mathlib `Algebra/Lie/Sl2.lean:79` | `HasPrimitiveVectorWith` | Includes nonzero vector, eigenvalue and raising-annihilation conditions; a zero vector cannot satisfy the primitive-vector input. |
| Mathlib `Algebra/Lie/CartanSubalgebra.lean:49` | Cartan-subalgebra definition | Nilpotence and self-normalization; splitting is a separate hypothesis. |
| Mathlib `Algebra/Lie/Semisimple/Defs.lean:75` | `HasCentralRadical` | Radical equals center; it does not assert that every central action is semisimple. |
| TauCeti `LinearAlgebra/SymmetricPower/Basic.lean:165`, :184, :220, :229 | `toTensorPower`, pure-tensor formula, injectivity, naturality | The map sums permutations. Averaging requires the explicit `1/d!`; xy distinguishes the two maps. |
| TauCeti `Algebra/Lie/HighestWeight/CompleteReducibility.lean:259` | `exists_isCompl_of_isKilling` | Native complete reducibility; this is consumed, not a new target. |
| TauCeti `Algebra/Lie/HighestWeight/Minuscule.lean:197`, :226, :259 | `IsMinuscule`, multiplicity-one consequence, zero-weight instance | Dominant integral weight with one weight orbit; Pieri is additional. The trivial representation at highest weight zero is not silently excluded. The definition alone permits a vanishing irreducible quotient; its native characteristic-zero existence results exclude that degeneracy here. |
| TauCeti `Algebra/Lie/HighestWeight/Tensor.lean:90` | `tensorMultiplicity` | Actual highest-weight tensor multiplicity, not a free scalar. |
| TauCeti `Algebra/Lie/HighestWeight/CentralCharacter/DotOrbit.lean:180`, :203, :222 | `vermaCentralCharacter_dotAction`, `dotInvariants`, `hcProjection_mem_dotInvariants` | Supplies one direction and the image inclusion, not HC surjectivity or the orbit-classification iff. The original resolver lead `DotOrbit` is a valid pinned module; an independent rerun reported no unresolved citations or names. |
| TauCeti `Algebra/Lie/Multiplicity.lean:126` | isotypic multiplicity | Uses the actual Lie-module Hom dimension; it equals multiplicity over an algebraically closed field, whereas a general field retains the End(S)-dimension factor. |
| TauCeti `Algebra/Lie/UniversalEnveloping/PBW/Finite.lean:139`, :174 | `span_range_bounded_orderedPowerProducts_eq_top`, `moduleFinite_of_isIntegral_of_span_eq_top` | Native basis/monic-relation inputs; the central-subalgebra adapter must still identify the actual inclusion. |
| TauCeti `Algebra/Lie/Reductive.lean:249`, :378, :458 | center/derived spanning, complement, irreducible restriction | Distinguishes an arbitrary central character from an integral group character. |
| TauCeti `Algebra/Lie/GeneralLinear/TraceForm.lean:126`, :148 | `traceBilinForm`, `traceBilinForm_nondegenerate` | The full matrix trace pairing, including the empty matrix carrier. It does not make the scalar/trace-zero splitting valid when n=0 or n=0 in the field. |
| Mathlib `Algebra/Algebra/Subalgebra/Centralizer.lean:170` | include-right tensor centralizer theorem | Uses freeness on the other factor. Identifying the whole center also uses commutativity of the symmetric-algebra factor. |
| Mathlib `Algebra/Group/Center.lean:150` | `MulEquivClass.apply_mem_center_iff` | Exactly the padded center-transport theorem in R04. |
| TauCeti `Algebra/Octonion/Basic.lean:345`, :375 | trace and norm | Split Zorn carrier and its quadratic norm, not the compact positive-definite real octonions. |
| TauCeti `Algebra/AlbertAlgebra/Basic.lean:317`, :337 | trace and trace-zero submodule | Native cyclic coordinate carrier; determinant and compact-real comparisons are additional constructions. |
| Mathlib `Analysis/Fourier/AddCircleMulti.lean:49`, :226, :247, :266, :320 | `mFourier`, orthonormality, coefficients, basis, summable series | Fourier coefficient uses the negative frequency in integration. No new generic Fourier theory is needed for the finite character adapter. |

TauCeti `Algebra/Lie/UniversalEnveloping/Prod.lean:163` (`prodEquivTensor`) and `Algebra/Lie/UniversalEnveloping/Abelian.lean:174` (`symmetricAlgebraEquiv`) were also opened at the pin; their generator equations determine the composite rather than an unmarked isomorphism. The `#check` experiment confirms the universes and explicit splitting parameter of the companion map.

Cross-roadmap citations were resolved as follows. Main `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:296–356` supplies chambers, the longest element, classification and integral root data. Main ClassicalGroups:237 and :272 supplies group highest weights and Schur characters; its Suggested.lean:215 is the existing type-A headline. Main SchurWeyl:323 supplies Layer 7, with the extra skew LR contract excluded as R01. Main LieGroups:330, :378 and :407 supplies integration, maximal tori and holomorphic complexification; main CompactGroups:226 and :369 supplies unitary/character inputs. Main ReductiveGroups:227 and :460–464 supplies tangent comparison and the characteristic-zero smooth-subgroup input. Main CharacteristicClasses:1059, C5.1, retains ownership of compact real-group invariant restriction; it is a consumer of the algebraic result here, not a reverse prerequisite.

At the supplied new heads, LieGroupoidsPoisson:1325–1351, G4.6A, owns smooth positive Lie–Poisson; the affine control is `{x,y}=y`. PseudodifferentialOperators:702, §3.1, owns the periodic smooth Fourier estimates. TensorProductCombinatorics:694 onward, §§1.5–1.6, owns lattice-cone/Fourier comparisons, and its §2.6 owns the corresponding type-A dictionary. This roadmap now confines itself to finite Weyl characters and polynomial/Rees comparisons. The sign of the Lie-groupoid's *algebroid* bracket is separately negative, explicitly reconciled there with the positive Lie-algebra bracket; no mismatch is hidden by the shared word “linear”.

SpinRepresentations Layer 9, read through the roadmap service and its main family path, explicitly owns the CAR action/isotypy application at :1065–1089. Its half-normalized quadratics give central scalar N²/2, agreeing with this roadmap's worked example. TangentialBordism B3 is a consumer of compact exceptional constructions. FormalConnectionsOpers' principal triple starts with pinned group data; the pure-Lie principal-sl₂ normalization here is an adapter, not a second generic group construction. ReflectionInvariantTheory §2:30 owns general finite-group orbit separation; the new supplier contract and Layer 7 explicitly consume it. The Weyl-specific double-dual and dot-action comparisons are the remaining work here. Board exceptional-theta work consumes these octonion/Albert comparisons, rather than supplying them. The new affine construction is not finite root geometry planned again: it adds the affine action, closed alcove and period-normalized compact application to the named finite-root inputs.

### Adversarial computations

These are computed controls, not proofs of the universal theorems. Bounds and coefficient assumptions were checked in the elaborated signatures. Zero rings and positive characteristic were used only for the arbitrary-ring PBW lane; field/characteristic-zero, compactness, connectedness and splitness exclusions were retained elsewhere. The **160 computed rows** below cover all 60 Lean theorem declarations, the sampled targets, the headlines and the objects involved in findings. “Keep” means no counterexample was found in the displayed calculation; the findings can still require ownership, acceptance-file or documentation changes.

The tensor coefficients were recomputed with exact fractions for all `0≤m,n≤4`: **225 string vectors, with all cross-string pairings in those cases**. Raising/lowering, endpoint, factorial norm, orthogonality and dimension-count identities all passed. The following rows give explicit values rather than just that test count.

| Statement/object | Instance | Computed left side | Computed right side | Result/change |
| --- | --- | --- | --- | --- |
| `exists_polynomialSymmetric` | d=0,2; monomials 1,xy | normalized inverse gives 1,xy | 1,xy | Keep; double scaling gives xy/2, excluded. |
| `module_finite_of_central_monic_relations` | one abelian generator x, central subalgebra K[x²], relation x²−a | module generated by 1,x | bound 2 | Keep; constant-unit relation cannot hold in nonzero K[x]. |
| `exists_pbwSymmetrization` | sl₂, e,f | sym(ef)=(ef+fe)/2=fe+h/2 | permutation average, degree-two symbol ef | Keep; ordered fe alone fails normalization. |
| `minuscule_pieri` | sl₂, λ=μ=1, ν=2,0,4 | multiplicities 1,1,0 | weight criterion 1,1,0 | Keep; λ=0, ν=−1 excluded by target dominance. |
| `invariantForm_isSymm_iff_tits_sign` | V(1),V(2),V(0) | symmetry false,true,true | signs −1,+1,+1 | Keep; nonselfdual module has no nonzero invariant form. |
| `exists_lieChevalleyRestrictionIso` | sl₂, q=h²+4ef | restriction q↦h², invariant | Weyl-invariant h² | Keep; h is not invariant since e·h=−2e. |
| `exists_harishChandraIso` | Ω=h²+2h+4fe | raw h²+2h; shifted h²−1 | dot-invariant/linear-invariant forms respectively | Keep; shift +ρ would give h²+4h+3. |
| `centralCharacter_eq_iff_dotOrbit` | λ=2, μ=−4; μ=1 | χ₂(Ω)=χ₋₄(Ω)=8; χ₁(Ω)=3 | dot orbit {2,−4}; 1 outside | Both directions distinguish the examples. |
| `serreLift_injective_of_base` | sl₂ normalized generators | kernel 0; three independent images | source rank 3 | Keep; zero generator family fails spanning. The repaired locator is verified. |
| `derivationOctonion_equiv_g2` | split Zorn model | predicted derivation dimension 14; imaginary dimension 7 | G₂ has 12 roots+rank 2; fundamental 7 | Dimension consistency only; no real compact/split identification. |
| `derivationAlbert_equiv_f4` | split Albert model | predicted derivation dimension 52; native trace-zero module 26 | F₄ has 48 roots+rank 4; 27−1=26 | Dimension consistency only; compact comparison needs complexification. |
| `finrank_e8` | rank-eight model | 80+84+84=248 | 240+8=248 | Keep; empty exterior-degree substitutions are not this model. |
| `finrank_e6_e7` | root counts | 72+6=78; 126+7=133 | 78;133 | Keep. |
| `gl_dual_standard_pieri` | μ=(3/2,1/2) | tensor dimension 2·2=4 | weights (1/2,1/2),(3/2,−1/2), dimensions 1+3=4 | Keep; central weights need not be integers. |
| `gl_dual_standard_pieri`, boundaries | n=0,1; n=2, μ=0 | tensor dimensions 0,1,2 | empty sum 0; μ−1 dimension 1; only last lowered weight dimension 2 | Keep; target dominance removes the other n=2 term. |
| `exists_productCenterEquiv` | Z=K, S=sl₂ | center K[t,Ω] | K[t]⊗K[Ω] | Keep; t and Ω images fixed separately. |
| `exists_productCenterEquiv`, zero | Z=S=0 | center K | K⊗K=K | Keep; no finite-dimensional hypothesis needed for the general tensor-center identity. |
| Affine `generator_coefficients` | p=x,q=y and reversed | B(x,y)=y; B(y,x)=0 | y;0 | Sound but padding, R04. |
| Affine `symmetric_firstOrder` | p=x,q=y, at (2,3) | 3−3/2=3/2 | {x,y}/2=3/2 | Keep README calculation; not a Rees headline. |
| `productEnveloping_generator` | z=t,s=e | t⊗1+1⊗e | generator of Z×S maps to same sum | Sound but padding, R04. |
| `tensorCenterInclusion_injective` | K[t]⊗Z(U(sl₂)), t⊗Ω | nonzero polynomial tensor | nonzero image tΩ | Keep; zero-dimensional central direction still gives identity inclusion. |
| `tensorCenterInclusion_range` | t,Ω,e | first two central; [1⊗h,1⊗e]=2(1⊗e) | t,Ω in range; e outside center | Keep; uses commutative first factor. |
| `splitEnveloping_mem_center_iff` | Ω,e | true,false after equivalence | true,false before equivalence | One exact lemma; R04. |
| `matrixTracePairing_apply` | E₀₁,E₁₀ | pairing 1 | tr(E₀₀)=1 | `rfl` padding, R04. |
| `matrixTracePairing_nondegenerate` | 2×2 matrix units; empty index | each Eᵢⱼ pairs to 1 with Eⱼᵢ; zero-space kernel 0 | nondegenerate in both cases | Native theorem; R04. |
| `centralTensorRepresentation_apply` | χ(z)=i, σ(s)=−1, v=1 | −i | i·(−1) | `rfl` padding, R04. |
| `centralTensorRepresentation_descends_iff` | kernel generated by (−1,−1), standard scalar/derived actions | product action (+1) | trivial on kernel, descends | Keep; changing one sign gives −1 and fails descent. |
| `polynomialSymmetric_e` | d=2,i=1 and i=3 | xy↦symmetric xy; 0↦0 | specified symmetric monomial;0 | Intended law sound; admitted data R02. |
| `polynomialSymmetric_inverse` | same inputs | symmetric xy↦xy;0↦0 | xy;0 | Intended law sound; R02. |
| `e_coordinate` | d=2, i,j=0,1,2 | coefficient matrix identity 3×3 | Kronecker delta | Bounds prevent junk exponent interpretation. |
| `E_e` | d=2, i=0,1,2 | 0,x²,2xy | i·e_(i−1) gives 0,x²,2xy | Keep README API; R02. |
| `F_e` | d=2, i=0,1,2 | 2xy,y²,0 | (2−i)e_(i+1) gives same | Endpoint zero extension is consistent. |
| `H_e` | d=2 | 2x²,0,−2y² | (2−2i)e_i | Keep README API. |
| `highest_killed` | m=n=2,r=1 | E(x²⊗xy−xy⊗x²)=x²⊗x²−x²⊗x²=0 | 0 | Keep intended law. |
| `highest_nonzero` | m=n=2,r=2 | coordinates (1,−2,1) | nonzero; first coefficient 1 | Keep; r bound matters. |
| `highest_H` | m=n=2,r=0,1,2 | weights 4,2,0 | m+n−2r=4,2,0 | Keep. |
| `raising_lowered` | m=n=2,r=0,k=1,2,5 | coefficients 4,6,0 times preceding vector | k(5−k)=4,6,0 | Keep, including last zero. |
| `lowered_endpoint` | N=4,2,0 | F⁵v₀=0,F³v₁=0,Fv₂=0 | 0,0,0 | Endpoint API, not independent headline. |
| `adjoint_E_F` | d=2,p=xy,q=x² | ⟨x²,x²⟩=1 | ⟨xy,2xy⟩=1 | Keep; unweighted monomials would give 1 versus 2. |
| `tensor_hermitian_tmul` | xy⊗xy | squared norm 1/4 | (1/2)(1/2)=1/4 | Keep. |
| `hermitian_positive` | p=xy, p=i·xy; p=0 | 1/2,1/2;0 | positive real values; excluded zero | Keep; complex bilinear substitute gives −1/2 for i·xy. |
| `SU2_invariance` | diag(i,−i), d=2,p=x² | norm of −x²=1 | norm x²=1 | Keep; diag(2,1/2) instead gives 16 and is not unitary. |
| `strings_orthogonal` | m=n=2, same weight from r=0,1,2 | weighted pairings 0,0,0 | 0 | Keep; all cross-string controls for 0≤m,n≤4. |
| `highest_norm` | m=n=2,r=0,1,2 | 1,1,3 | binomial sums 1,1,3 | Keep. |
| `highestNorm_factorials` | same three r | 1,1,3 | factorial ratios 1,1,3 | Keep; nonnegative factorial arguments ensured by r bound. |
| `lowered_norm` | (r,k)=(0,2),(1,1),(2,0) | 24,2,3 | k!N!/(N−k)!·norm(v_r)=24,2,3 | Keep; no denominator zero in ℂ. |
| `strings_independent` | m=n=2 | orthogonal nonzero vectors, string lengths 5,3,1 | 9 independent vectors | Keep intended headline; R02. |
| `strings_span` | m=n=2; m=0,n=1 | span dimensions 9;2 | (m+1)(n+1)=9;2 | Keep intended headline; R02. |
| `source_F2` | n=2, basis A=y²⊗x²,B=xy⊗xy,C=x²⊗y² | F²v₀=2A+8B+2C | displayed formula coefficients 2,8,2 | Check padding, R04. |
| `source_F1` | n=2 | F(−v₁)=A−C | coefficients 1,0,−1 | Check padding, R04. |
| `source_three_cross_products` | n=2, Gram diag(1,1/4,1) | 2−2=0;2−4+2=0;1−1=0 | 0,0,0 | Check padding, R04. |
| `evaluate_groupWeightCharacter` | standard GL₂ at diag(2,3) | evaluation x+y=5 | trace diag(2,3)=5 | Keep, with rationality hypothesis in scope. |
| `group_character_eq_orbit_add_lower` | Sym² GL₂ | x²+xy+y² | orbit(2,0)+orbit(1,1) | Coefficients 1,1; no duplicate stabilizer multiplicity. |
| `finite_dominant_score_sublevel` | x=(2,1), central degree 2, bound 4 | weights (1,1),(2,0), count 2 | finite set, size 2 | Keep; central degree cannot be omitted. |
| `score_eq_gap_sum` | x=(2,1), λ=(2,0) | 4 | (2/2)·3+(2−3/2)·2=4 | Keep; n+1 prevents division by zero. |
| `finite_dominance_ideal` | λ=(2,0) | {(2,0),(1,1)} | size 2 | Keep; arbitrary negative central shifts fail equal total degree. |
| `staircase_alternant` | n=0,1,2 | 1,1,x−y | e^ρD=1,1,x(1−y/x) | Keep. |
| `candidate_mul_denominator` | λ=(2,0) | (x²+xy+y²)(1−y/x)=x²−y³/x | normalized numerator x²−y³/x | Keep. |
| `candidate_top_coefficient` | λ=(2,0); n=0 | coefficient x² is 1; constant 1 | 1;1 | Keep intended triangular normalization. |
| `candidate_support_dominated` | λ=(2,0) | support (2,0),(1,1),(0,2), prefix totals 2,1,0 | all ≤2; total degree 2 | Keep; support weights need not themselves be dominant. |
| `numerator_coefficient_norm` | n=0,2,3, strictly decreasing λ+ρ | coefficient-square sums 1,2,6 | n!=1,2,6 | Keep; distinct shifted weights exclude collisions. |
| `evaluate_mul` | p=x,q=y,t=(2,3) | evaluation xy=6 | 2·3=6 | Algebra API, not the Haar headline. |

The following controls cover the README constructions and conventions not exhausted by the Lean headline table.

| Statement/object | Instance | Computed left side | Computed right side | Result/change |
| --- | --- | --- | --- | --- |
| Polynomial monomial, zero extension and coefficient | d=2,i=3 | raw monomial y³; homogeneous e₂,₃=0; its coefficient on degree-two polynomials 0 | extension 0; no degree-two monomial with exponent (0,3) | Natural subtraction junk is not mistaken for a basis vector. |
| Symmetric monomial and averaged tensor map | d=2,xy | raw tensor sum x⊗y+y⊗x; averaged half that | squared norms 2;1/2 | The factor 1/2 is necessary; R02 normalization control. |
| Tensor action and Lie differential | d=1, g=diag(2,1/2) | x↦2x,y↦y/2; e·y=x | standard representation and E=y↦x | Correct column-action convention. |
| String index bounds | m=n=0; m=1,n=2 | cardinalities 1;4+2=6 | dimensions 1;2·3=6 | No spurious out-of-range string. |
| Rees algebra/fibres | one abelian generator, R=ℤ/4 | Rees R[t,tx]; t=0 gives R[u], t=1 gives R[x] | symmetric/enveloping fibres | Ambient evaluation tx↦0 is not the zero-fibre quotient. |
| Rees regular parameter | R=ℤ/4, coefficient 2 | t·2=2t≠0 although 2·2=0 | multiplication by t injective | No domain hypothesis is smuggled in. |
| Rees degenerate carriers | L=0; R=zero ring | R[t], fibres R; zero algebra respectively | same | Arbitrary-ring lane includes these cases. |
| Linear Poisson bracket and antisymmetry | [x,y]=y at (2,3) | {x,y}=3,{y,x}=−3,{x²,y}=12 | bracket and Leibniz rule give 3,−3,12 | Agrees with LieGroupoidsPoisson G4.6A. |
| Ordered versus symmetric multiplication | affine Lie algebra | x²⋆ordered y=x²y+2ħxy+ħ²y | repeated XY=YX+ħY gives same | Second order prevents conflating exact product with first order. |
| Splitting correction | xy | Ssym(xy)=YX+ħY/2 | ordered comparison plus ħ·y/2 | Positive correction matches first-order coboundary. |
| PBW triangular/Verma quotient | sl₂ Verma weight 0 | f·v survives in Verma; e(fv)=0 | simple quotient L(0) kills f·v and has dimension 1 | Verma and irreducible quotient are distinct. |
| Opposition | A₂ fundamental weights; D₄ | −w₀ interchanges ω₁,ω₂; D₄ opposition identity | dual standard versus standard; D₄ diagram automorphisms still S₃ | Self-duality is not arbitrary diagram symmetry. |
| Ordinary dual torus character | circle character z, at z=i | χ(i)=i; dual(i)=−i | inverse weight z⁻¹ | Ordinary dual is not unchanged character. |
| Principal sl₂/Tits sign | A₂ adjoint, highest principal weight 4 | principal decomposition V(4)⊕V(2), both symmetric | sign (−1)^4=+1 | Algebraic sign route agrees with invariant Killing form. |
| Compact FS indicator | Q₈ standard; S₃ standard; circle z; trivial | (2+2−12)/8=−1; (2+6−2)/6=1;0;1 | alternating;symmetric;nonselfdual;trivial symmetric | Gap contract discriminates all three values. |
| Compactness exclusion | additive ℝ | normalized finite translation-invariant measure would force equal masses on infinitely many disjoint intervals | no probability Haar measure | Compact Haar argument cannot be extended by dropping compactness. |
| Regular extension gap | U(1), z↦z⁻¹ | extension at 2 is 1/2 | regular Gₘ function t⁻¹ | “Polynomial in entries only” would wrongly exclude it. R01. |
| Type-A rho/permutation | n=2, swap | ρ=(1,0), swap sends it to (0,1) | alternant x−y | Inverse action and determinant sign are consistent. |
| Laurent embedding and evaluation | p=x²+xy+y², t=(2,3) | 4+6+9=19 | evaluation of polynomial embedding 19 | Negative powers use nonzero torus coordinates. |
| Central degree/dominance | (2,0),(1,1),(0,2) | degrees all 2; first prefixes 2,1,0 | lower-weight order compares these prefixes | Reversed order would reject (0,2). |
| Score properness is not injectivity | x=(3,2,1), λ=(1,1,−2), μ=(2,−1,−1) | scores both 3 | two different weights at same score | Proper induction permits ties; no injective-score claim needed. |
| Distinct orbit sum | GL₂ weight (1,1) | xy | one distinct orbit element, coefficient 1 | Summing both permutations gives wrong 2xy; the new Check excludes it. |
| Integral virtual character | n=2, p=x²+y² | p=ch Sym²−ch det | integer coefficients 1,−1 | Virtual characters need not be genuine characters. |
| Haar norm-one argument | standard U(2) | weighted norm 1 | sum of irreducible coefficient squares 1 | Unweighted torus norm is 2; Haar factor is essential. |
| Haar sign selection | integral norm-one element, leading coefficient +1 | one nonzero coefficient, +1 | one irreducible character | Norm alone would allow −χ. |
| Deep dominant multiplication | GL₂ λ=(2,0), μ=(1,0) | dimensions 3·2=6 | (3,0) and (2,1), dimensions 4+2=6 | The full sum, not a single highest term. |
| Group character ring operations | standard ⊕ trivial, at diag(2,3) | trace 6; tensor-square trace 25 | 5+1=6;5·5=25 | Sum/tensor operations agree with evaluation. |
| Native Weyl orbit / orbit sum | A₁ λ=0,1,2 | {0},{±1},{±2}; sums 1,z+z⁻¹,z²+z⁻² | one contribution per distinct weight | The new distinct-orbit Checks agree; previous R06 repaired. |
| `dominantWeightBelow` | A₁ λ=2, μ=0,1,4 | differences 2,1,−2 | true,false,false in nonnegative integral root span 2ℕ | Root integrality and direction both matter; both now have Checks. |
| Character triangular inversion | V(2)⊕2V(0) | orbit coefficients 1 at ±2,3 at 0 | irreducible multiplicities 1,2 | Subtract the V(2) zero weight, not coefficient 3 as multiplicity. |
| Character equality detects module | V(1)⊗V(1), V(2)⊕V(0), 2V(1) | first two z²+2+z⁻²; third 2z+2z⁻¹ | equivalent first two; third not equivalent despite dimension 4 | Both directions controlled. |
| Finite rational Weyl evaluation | GL₂ standard at (2,3) | 2/(1−3/2)+3/(1−2/3)=−4+9=5 | character 2+3=5 | Nonzero denominators required. |
| Singular torus evaluation | same character at (1,1) | polynomial value 2 | trace identity 2 | Individual rational terms undefined; not total-field 0/0 evaluation. |
| Finite Fourier sign | χ(z)=z on S¹ | coefficient at 1: ∫z·z⁻¹=1; at −1: ∫z²=0 | weight multiplicities 1,0 | Wrong sign exchanges the two values. |
| Finite character, nonabelian/rank-zero controls | SU(2) V(1); A₂ adjoint; trivial group | weights ±1 each 1; zero weight 2 and six roots each 1; constant 1 | total dimensions 2;8;1 | Finite Fourier layer needs no infinite-series theorem. |
| Pure central torus | rank-one torus weight m | character z^m | one weight with multiplicity 1 | Root-free case is retained in finite character statements. |
| Polynomial translation τ₋ρ | A₁, 1,h,h²+2h | 1,h−1,h²−1 | substitute h−1 | Three new checks pass; opposite shift gives h²+4h+3. |
| Inner root automorphism | sl₂ exp(ad e) | h↦h−2e; f↦f+h−e | finite exponential series | Inverse flips the linear term; automorphism is not arbitrary. |
| Killing dual and inverse transpose | g=exp(ad e), inputs h,f | κ(gh,f)=κ(h−2e,f)=−8 | κ(h,g⁻¹f)=−8 | Pins direction of coadjoint transport. |
| Coordinate derivative evaluation | t² at 2 in direction 3; t⁴ at 1 | 12;4 | 2·2·3;4 | Chain rule uses genuine polynomial derivatives. |
| Generic finite/dominant polynomial route | t↦t² in char 0 | derivative at 1 is 2, generic fibre size 2 | surjective differential, finite generic fibre | In char 2 derivative is 0; the hypothesis is essential to this route. |
| Root-exponential orbit differential | sl₂, regular h versus 0 | directions −2e,2f,h span dimension 3 at h; only H dimension 1 at 0 | full rank at regular point, failure at singular point | Density route needs a regular point, not every Cartan element. |
| Trace-power polynomials | standard sl₂ at h | traces degrees 0,1,2,3 are 2,0,2,0 | sum of eigenvalue powers of 1,−1 | Degree zero is dimension, not zero. |
| Trace through Killing dual | sl₂ standard degree 2, λ(h)=8t | h²/32 evaluates to 2t² | tr(diag(t,−t)²)=2t² | Missing Killing scale would give 64t². |
| Adjoint trace normalization | same coordinate | h²/8 evaluates to 8t² | adjoint eigenvalues 2t,0,−2t give 8t² | Standard and adjoint trace polynomials differ by 4. |
| Degree filtration | S(Kh), degree bound 0,1,2 | spans {1};{1,h};{1,h,h²} | dimensions 1,2,3 | Upper bound includes lower degrees; not homogeneous piece alone. |
| Linear invariants | A₁ reflection h↦−h | h² fixed,h not fixed | invariant algebra K[h²] | Characteristic zero excludes h=−h collapse. |
| Lie-invariant symmetric algebra | sl₂ q=h²+4ef, h | e·q=0,e·h=−2e | q invariant,h not | Zero/trivial derivation action would admit the wrong h. |
| Cartan restriction via Killing dual | q=h²+4ef; e | q↦h²; e↦0 | Cartan polynomial restriction | Not an arbitrary algebra equivalence or projection scale. |
| Associated graded HC comparison | q=h²+4ef | sym(q)=h²+4fe+2h=Ω | leading Cartan symbol h² | Lower-order 2h is retained by symmetrization. |
| Finite-orbit separation route | A₁ orbits {±1},{±2}; translated dot orbits {0,−2},{1,−3} | h² values 1,4; (h²−1)/3 values 0,1; translated ((h+1)²−1)/3 also 0,1 | two distinct orbits separated in each convention | The new import of ReflectionInvariantTheory §2 resolves previous R03. |
| Central-character separation | A₁ λ=2,−4,1 | invariant h²+2h evaluates 8,8,3 | two dot-orbit values 8 versus 3 | Values agree; the existing owner is now cited. |
| Freudenthal denominator | sl₂ μ=n−2j, 1≤j≤n | norm difference 4j(n+1−j)>0 | for n=2,j=1,2:8,8 | Absent μ=−n−2 gives 0 and is not an actual lower weight. |
| Serre transpose and higher relations | B₃ α₂=e₂−e₃, α₃=e₃ | A₂₃=−2,A₃₂=−1; [h₂,e₃]=−e₃,[h₃,e₂]=−2e₂ | ad(e₂)²e₃=0, ad(e₃)³e₂=0 | Transpose required; simply-laced test would miss it. The repaired locator is verified. |
| Split versus compact octonions | Zorn nonzero diagonal idempotent; compact unit | split norm 0; compact norm 1 | isotropic split form versus positive compact norm | No real split/compact identification. |
| Cayley–Dickson alternativity/associator | quaternion i,j and doubling unit ℓ | associator (i,j,ℓ)=(0,2k)≠0; (i,i,ℓ)=0 | nonassociative but alternative | Associative `AlgEquiv` is the wrong carrier. |
| Imaginary cross product | i,j orthonormal | i×(i×j)=−j | ⟨i,j⟩i−⟨i,i⟩j=−j | Sign and norm normalization agree. |
| Albert trace/determinant/Newton formula | diag(1,2,3) | trace 6,trace(A²)=14,trace(A³)=36,det 6 | (6³−3·6·14+2·36)/6=6 | Cubic normalization fixed. |
| Albert mixed off-diagonal determinant | diag(3,1,1), x₀=1, other off-diagonals 0 | det=3−3=0 | lower 2×2 block singular | Diagonal coefficient on N(x₀) is a₀, not another diagonal. |
| Albert cubic cyclic term | zero diagonal, (x₀,x₁,x₂)=(i,1,−i) | tr((i·1)(−i))=2 | cyclic determinant term +2 | Wrong conjugation gives −2; source-layout issue below. |
| Compact positivity | nonzero compact Hermitian A | tr(A²)=Σaᵢ²+2ΣN(xᵢ)>0 | positive sum | Split isotropic off-diagonal vector instead gives 0 and is excluded. |
| Jordan product | B=E₀₁+E₁₀,C=E₁₂+E₂₁ | B∘C=(E₀₂+E₂₀)/2 | half the two matrix products | Omitting 1/2 doubles the answer. |
| Complex-bilinear Jordan extension | iB | tr((iB)²)=−2 | i²tr(B²)=−2 | Hermitian-positive extension would give +2 and is wrong. |
| Complexified norm/involution | i⊗1;1⊗1+i⊗u, N(u)=1 | norms −1;0; linear conjugation fixes i⊗1 | bilinear scalar extension; same | Tensor star would send i⊗1 to −i⊗1. |
| Complexified cubic | i⊗diag(1,2,3), unit, E₀₀ | determinants −6i,1,0 | i³·6,1,0 | Unit/degenerate/cubic-scaling checks pass. |
| Jordan inner derivation | A=E₀₀,B=E₀₁+E₁₀,D=[L_A,L_B] | D(A)=−B/4 | direct Jordan products give −B/4 | New README sign check passes. |
| Commutator of inner derivations | D as above,D₁₂=[L_E₁₁,L_(E₁₂+E₂₁)] | [D,D₁₂](A)=−(E₀₂+E₂₀)/16 | repeated product calculation gives same | New bracket check passes; exact fractions used. |
| Derivation scalar extension | d acting on products; zero derivation | extended Leibniz values 0 defect; zero maps to zero | scalar-extended kernel of Leibniz equations | Finite-dimensional flat-base-change route fixes actual maps. |
| Reductive central semisimplicity | 1D abelian Lie algebra acting by 2×2 nilpotent Jordan block | invariant line kernel dimension 1, no stable complement | center action not semisimple | Reductivity alone cannot imply module semisimplicity. |
| `gl_n` scalar/derived splitting | diag(2,0) in gl₂ char 0 | scalar part I, trace-zero part diag(1,−1) | sum diag(2,0) | Projection divides trace by n. In char 2, tr(I)=0; excluded. |
| `gl_n` trace pairing versus center coordinate | scalar matrix tI₂ | trace 2t; projection scalar t | factor 2 retained | Trace symbol and scalar projection are not identical. |
| Reductive-center degenerate ranks | gl₀,gl₁ | centers of enveloping algebras K,K[t] | no matrix generators; one abelian generator | Handle n=0 before division by n. |
| Group versus Lie weights | gl₁ weight 1/2 | one-dimensional Lie representation exists | no algebraic Gₘ character of weight 1/2 | No silent integrality restriction on central Lie weights. |
| Rational restriction/irreducibility | GL₂ standard; disconnected sign representation | Lie image standard irreducible; sign differential trivial | connected case works, disconnected differential loses information | Connectedness retained in the comparison. |
| Central quotient descent | (S¹×SU₂)/⟨(−1,−I)⟩ | weight k, SU₂ degree m: kernel action (−1)^(k+m) | descends iff k+m even | Tests both directions of descent. |
| LR tableau convention | one-box square; empty λ | counts 1 for (2),1 for (1,1); empty case δ_(ν,μ) | Schur product and unit rule | Correct reading-word convention; R01 registration remains. |
| GL₃ branching | λ=(2,1,0) to GL₂ | interlacing rows (2,1),(1,1),(2,0),(1,0): dimensions 2,1,3,2 | total 8 | Includes every row, not just extreme rows. |
| gl₂ Casimir | μ=(3/2,1/2) | μ₁(μ₁+1)+μ₂(μ₂−1)=7/2 | 15/4−1/4=7/2 | Trace normalization distinct from sl₂ Killing Casimir. |
| CAR central scalar/multiplicity | N=1,2 | central scalars 1/2,2; module dimensions 2,16 | N²/2; multiplicities 2,8 times simple dimensions 1,2 | Matches SpinRepresentations Layer 9. |
| Staircase Casimir separation | N=3, lowered indices 0,1,2 | 27/4,43/4,59/4 | successive differences 4; C_t−C_s=4(t−s) | Index direction and half-integral center both fixed. |
| sl₂ Casimir scale | h,e,f standard | κ(h,h)=8,κ(e,f)=4; Ω/8 native Casimir | Ω=h²+2h+4fe | Wrong root-length scale changes eigenvalues. |
| A₂ dimension formula | (a,b)=(1,0),(0,1),(1,1),(2,0),(3,0),(2,2) | 3,3,8,6,10,27 | (a+1)(b+1)(a+b+2)/2 | Small-rank and adjoint controls pass. |
| Affine A₁ action/alcove | α-coordinate | W_aff translations 2ℤ; closed alcove [0,1] | reflections x↦−x, x↦2−x | Translation by 1 is extended, not affine Weyl. |
| Closed representative/stabilizers | x=2/3; x=0 | representative 2/3; stabilizers 1 in interior,2 at 0 | unique closed representative, boundary reflection stabilizer | Closed alcove is not a free fundamental domain. |
| Intermediate lattice Ω | A₁, Y=Q∨ versus P∨ | Ω orders 1 versus 2; extended reflection x↦1−x | 2/3 maps to 1/3 only in extended group | Distinguishes affine and extended quotients. |
| Special nodes/diagram automorphisms | A₂,D₄,E₆ | Ω=C₃,V₄,C₃; semidirect orders 6,24,6 | Ω⋊Aut(finite diagram) | D₄ Ω is not cyclic of order 4. |
| Compact periods/root lattice | SU₂ diagonal circle | kernel 2πℤ·diag(i,−i); root derivative 2i; pairing 2 | differential lattice scaled by 1/(2π) | Omitting 2π fails the exponential-kernel equation. R01. |
| Compact center versus Ω_Y | SU₂;SO₃ | center orders 2;1 | P∨/Y orders 2;1, while Y/Q∨ orders 1;2 | Center and alcove stabilizer are different quotients. |
| Compact semisimple rank zero; torus exclusion | trivial group; S¹ | center order 1; infinite center | root quotient trivial; semisimple-center theorem does not apply to S¹ | No false finite-center claim for all compact connected groups. |

Additional computations at this head:

| Statement/object | Instance | Computed left side | Computed right side | Result/change |
| --- | --- | --- | --- | --- |
| Norm and lowering recurrence | m=2,n=3,r=1,N=3 | highest norm 5/6; lowered norms 5/6,5/2,10,30 | factorial multipliers 1,3,12,36 times 5/6 | Agree; positive and nonzero in the permitted range. |
| Highest norm at r=2 | m=2,n=3,r=2,N=1 | vector coefficients 1,−2,1; norm 2; lowered norm 2 | factorial formula 2 and multiplier 1 | Agree; the r bound prevents negative factorial arguments. |
| Three-source-vector Check | n=3; A=e₂⊗e₀, B=e₁⊗e₁, C=e₀⊗e₂ | coefficients (2,12,6),(1,1,−2),(1,−2,1); cross-products 0,0,0 | norms 40,5/2,2 and zero off-diagonal Gram entries | Agree; still Check padding in R04. |
| Three-source-vector Check | n=4 | coefficients (2,16,12),(1,2,−3),(1,−2,1); cross-products 0,0,0 | norms 60,3,5/3 and zero off-diagonal Gram entries | Agree; the n=2 case is not the only test. |
| Fixed-center score expansion | x=(3,2,1), λ=(2,1,−1) | score 7 | mean contribution 4 plus gaps 1+2 = 7 | Agree; 780 integer tuples in dimensions 1–4 also agree. |
| Revised distinct orbit definition | A₁, zero weight | orbit {0}, size 1; orbit sum 1 | native set orbit and coefficient 1 | Summing Weyl elements gives 2 and is rejected. |
| Revised root order, positive direction | A₁ λ=2, μ=0 | λ−μ=2=1·α | membership in nonnegative integral root span true | Agree. |
| Revised root order, integrality | A₁ λ=2, μ=1 | λ−μ=1=(1/2)α | membership in nonnegative integral root span false | Real-cone replacement wrongly returns true. |
| Revised root order, reversed direction | A₁ λ=2, μ=4 | λ−μ=−2 | membership in nonnegative integral root span false | Reversed order wrongly returns true. |

Mathlib `GroupTheory/GroupAction/Defs.lean:49` defines the orbit as the set of attainable action values, not an enumeration with group-element multiplicities; :228 states orbit invariance under a group action. This supplies the set used by the repaired §6.1. The ownership search used the roadmap service across main/open heads for PBW symmetrization, Lie–Poisson, orbit separation, finite Fourier/cone comparisons, octonion/Albert derivations and period/FS interfaces, plus the board packages. Searches were by objects as well as names. Existing-roadmap revisions were not substituted for main suppliers. KacMoody's new head explicitly leaves the finite Killing/reductive lane here; the relevant affine, quantum and exceptional consumers do not become suppliers. No new duplicate fully qualified target name was identified.

## Not verifiable

The unavailable texts do not stop this review. Every reference was attempted through the sources service; available mathematical work and all gate/signature checks were completed. No manifest or source material was added to the pull request.

- **`dixmier`, Enveloping Algebras, §1.6:** needed for the cited product-enveloping/center locator in §9.3. The service reached the AMS GSM 11 landing page, but obtained no legal readable text. The native maps and the displayed small instances were checked; the book locator itself remains uncertified here.
- **`serre1987`, Complex Semisimple Lie Algebras:** title/author service lookup produced no legal text. Its bibliography entry remains unverified; the separate Etingof presentation locator was verified.
- **`fulton-harris`, Representation Theory (1991):** title/author service lookup produced no legal text. The cited Pieri, branching and character material was not certified against the book. Native statements and examples were checked separately.
- **`humphreys2008`, BGG Category O:** the service reached the AMS GSM 94 landing page without readable legal text. Category-O locators remain unverified; no stand-in category-O headline was accepted.
- **`jantzen-quantum`, Lectures on Quantum Groups:** the service reached AMS GSM 6, without readable legal text. The bibliography's classical-background references were not certified there.
- **`jantzen-groups`, Representations of Algebraic Groups:** title/author lookup yielded no readable legal text. Group-representation source assertions were checked against the named suppliers, not guessed from this book.
- **`jacobson`, Exceptional Lie Algebras; `schafer`, An Introduction to Nonassociative Algebras:** title/author lookups produced no legal texts. The arbitrary-field exceptional comparison proof locators therefore remain unverified. Baez and Landsberg–Manivel provide accessible background, but the latter's complex setting is not a proof over every characteristic-zero field.
- **`molev`, Yangians and Classical Lie Algebras (2007), Chapters 1–2:** the service returned the different 1994 Molev–Nazarov–Olshanski paper, arXiv:hep-th/9409025v2. Its title/authors were inspected; it cannot certify the cited monograph's chapter locators. The missing entry retains the same work key.
- **`humphreys1972`, `bourbaki`, `goodman-wallach`:** the service reported publisher/paywall-only, uncertified sources. Their locators were retained as such; they were not re-requested in the missing-text list.

The job's missing-reference file records the unresolved works in one batch. There is no source manifest in the reviewed folder to supply earlier settled locators. Bibliographic availability is not being treated as a mathematical counterexample. All source issues below concern texts actually read. The exact algebraic generality of the exceptional-model identification proofs is not certified merely by the dimension controls in the table. Landsberg–Manivel v1 explicitly works over ℂ (`landsberg-manivel` lines 45–46, 135–169). Its complex composition/Jordan constructions do not themselves certify the arbitrary-field identification.

## Source issues

- **Misprint** in etingof755 at §11.4, proof of Theorem 11.16, printed p. 67 (`etingof755` line 2500): the source says the highest vector maps to yⁿ under the displayed monomial identification; it should be xⁿ, with exponents n−m and m; affects the proof.
- **Misprint** in etingof755 at §24, proof of Theorem 24.2(iii), printed p. 132 (`etingof755` lines 4834–4839): the source says the single-support case has only one nonnegative root coefficient; it should have only one strictly positive coefficient; affects the proof.
- **Misprint** in woit at §3, proof of Theorem 2, printed p. 5 (`woit` line 241): the source says the leading alternant is indexed by λ+δ; it should be indexed by λ+ρ; affects the proof.
- **Error** in woit at §3, before Corollary 2, printed p. 6 (`woit` lines 286–288): the source says the partition function counts integral combinations of positive roots; it should count nonnegative integral combinations; affects a stated result.
- **Error** in woit at §3, Corollary 3, printed p. 6 (`woit` lines 295–299): the source says the sign exponent multiplies the two lengths and assigns λ to the output representation; it should add lengths and, for the displayed summand, assign ν to the output and λ,μ to the inputs; affects a stated result.
- **Error** in garnier at §2.2, preceding Proposition–Definition 2.2.1, printed p. 7 (`garnier` lines 381–384): the source says highest-root coefficient one characterizes minuscule weights; it should characterize minuscule fundamental coweights, while weights use the highest-coroot coefficients; affects a stated result.
- **Gap** in garnier at proof of Proposition 2.3.1, printed p. 17 (`garnier` line 1191): the source says countability implies discreteness; it should use containment in the discrete coweight lattice; affects the proof.
- **Misprint** in baez at §2.2, printed p. 10 (`baez` line 417): the source says Cayley–Dickson doubling orders the algebras as real, quaternion, complex, octonion; it should order them as real, complex, quaternion, octonion; affects nothing.
- **Error** in baez at §3.4, determinant display, printed p. 32 (`baez` lines 1475–1481): the source says the displayed layout has cubic cross-term 2Re(xyz); it should have 2Re((xy)z*) for that layout; affects a stated result.

The last issue is witnessed already inside the associative complex subalgebra: zero diagonal and x=z=i,y=1 give +2 from the determinant/trace-cubic formula, but −2 from the printed cross-term. The README's native cyclic layout and trace formula give +2 and do not inherit it. In Garnier's weight/coweight terminology, B₂'s vector weight has highest-root coefficient one but is not minuscule, while its spin weight is minuscule. For Woit's missing nonnegativity, A₂ weight zero has infinitely many integer decompositions using α₁,α₂,α₁+α₂, but one nonnegative decomposition. None of these source corrections licenses a narrower roadmap statement.
