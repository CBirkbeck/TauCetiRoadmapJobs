# Review of LieHighestWeight (pull request #1220 at 1b301bf)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`

**Verdict:** needs changes

Seven findings, three blocking. File locations without a directory prefix are relative to the folder above. Library locations refer to the pins, and supplier locations to main unless an explicitly supplied new-roadmap head is identified. No PR file was changed.

## R01 (P1) — The four supplier gaps are not registered contracts

**Location:** README.md:49–57 and :362–414: “They are registered as supplier gaps, with exact contracts”.

**Claim:** The compact extension, period lattice, Frobenius–Schur and LR applications may consume the four displayed gap contracts.

**Witness:** There is no readable `packages/LieHighestWeight/design/plan.json`. The brief declares no gaps. Main LieGroups:407, CompactGroups:369 and SchurWeyl:323 do not supply these additional contracts.

**Repair:** Register each exact slug, named supplier, section and precise needs in this package's design gaps, matching the README; alternatively provide owned extension targets before consuming them. Merely writing `gap:` in the README does not register a contract. Keep the distinct tests: U(1)'s inverse character extends with value 1/2 at 2; SU(2)'s coroot period is 2π; its standard Frobenius–Schur indicator is −1; and the two LR coefficients in the square of the one-box Schur polynomial are 1. The proposed mathematical contracts pass these controls; the missing registration leaves their prerequisites unsupplied. This combines the remaining parts of previous R01 and R02.

## R02 (P2) — Generic Poisson and Fourier constructions still have two owners

**Location:** README.md:35–47: “Layer 6.2 owns the lattice cone expansions, Fourier boundary maps and directional endpoint comparisons”; also :651–679 and :1115–1313.

**Claim:** LieGroupoidsPoisson, PseudodifferentialOperators and TensorProductCombinatorics consume these generic constructions from this roadmap.

**Witness:** At the supplied new heads, LieGroupoidsPoisson README.md:1325 constructs positive smooth Lie–Poisson; PseudodifferentialOperators:702 constructs smooth periodic Fourier decay; TensorProductCombinatorics:694 constructs the cone/Fourier/endpoint comparisons and imports the Fourier estimates.

**Repair:** Import those owners by the cited sections and retain the polynomial/PBW comparison and Weyl-character applications here. Restore the direction already recorded on main in LieHighestWeight README.md:487 and :870. These are identical mathematical objects: the affine bracket has `{x,y}(2,3)=3`; A=(2) has coefficients 1,0,1 at 0,1,2, recovered by 1/2+(-1)^b/2. No distinct variant in this head separates ownership. The mechanical dependency check does not see an ownership reversal expressed as downstream prose.

## R03 (P2) — The tensor companion still contains admitted data

**Location:** Sl2TensorOrthogonalityTargets.lean:49: “noncomputable def polynomialSymmetric : ∀ d : ℕ, P d ≃ₗ[ℂ] S d := by sorry”; also :31, :72 and :77.

**Claim:** The polynomial/symmetric-power equivalence, homogeneous vectors and raising/lowering maps are usable acceptance-test definitions.

**Witness:** `polynomialSymmetric` is admitted data; `e`, `E` and `F` contain admitted construction obligations. `action`, the tensor actions, and the later acceptance statements depend on them. All remain unchanged.

**Repair:** Delete the admitted definitions and dependent acceptance statements. Retain only headline existence statements on native carriers, with any necessary simple definitions fully constructed, as `exists_polynomialSymmetric` already does. Require xy to map with coefficient 1; its averaged tensor is (x⊗y+y⊗x)/2, with norm squared 1/2. A factor-two rescaling has norm squared 2 and is excluded by the normalized existence statement. Building with `sorry` cannot validate the missing data.

## R04 (P3) — Companion files still violate the required Lean form

**Location:** AffinePBWFirstOrderTargets.lean:1–11; ReductiveCenterTargets.lean:1–11; Sl2TensorOrthogonalityTargets.lean:1–14; TypeAHaarTargets.lean:7–15. Example: “import Mathlib.Algebra.MvPolynomial.PDeriv”.

**Claim:** The companion files serve as additional acceptance tests.

**Witness:** Three files use Mathlib submodule imports; two lack `import Mathlib`. The companions describe illustrative or nonexhaustive interfaces and omit required layer headings and many declaration docstrings.

**Repair:** After deleting admitted data and padding, consolidate retained headline statements into Suggested.lean or give every retained companion the required single Mathlib import, permitted TauCeti imports, target-signature module docstring, layer headings and declaration documentation. The signature experiment normalized imports only in scratch; it does not repair the submitted files. The supplied passing gate is not evidence that these companion-specific rules were enforced.

## R05 (P3) — The acceptance files retain API and worked-example padding

**Location:** ReductiveCenterTargets.lean:43, :76, :91–95 and :111; AffinePBWFirstOrderTargets.lean:23; Sl2TensorOrthogonalityTargets.lean:198–214.

**Claim:** These generator equations, evaluation laws, center-membership transport and three concrete cross-products belong among headline acceptance statements.

**Witness:** Center transport closes with `exact MulEquivClass.apply_mem_center_iff (splitEnveloping K Z S e)`. Trace/action evaluation is `rfl`; trace nondegeneracy is a native theorem; the generator identities are single-`simp` proofs. The tensor identities reproduce README item 5.

**Repair:** Delete this material from `Suggested.lean` and its companion acceptance files; keep it as README API or Checks, rather than proving admissions in place. Remove now-unused definitions too. The transport distinction is already provided by the library: Ω is central, while e is not because [h,e]=2e. The three d=n=2 cross-products are 0,0,0, but those example computations do not state the general decomposition headline. The same acceptance-test cleanup should remove coordinate/endpoint API catalogues that exist only to support these examples.

## R06 (P3) — Calling a result derived does not supply its source locator

**Location:** README.md:432–433: “Every statement of this subsection is a derived finite computation”; :828–841, :859–1027 and :2395–2430.

**Claim:** The tensor decomposition, invariant-form sign, independent Haar argument and compact-center comparison meet the requirement for exact source support.

**Witness:** These blocks still have no theorem/section-and-page locator for their new claims. The added principal-sl₂ proof route and supplier-gap descriptions do not provide one. Layer 10's affine/closed-alcove theorems also lack a locator.

**Repair:** Attach exact legal-source locators to the claims, or identify each derived adapter and attach exact locators to its mathematical inputs. Retain the stated generalities and computed normalizations; do not substitute a complex-only reference for the arbitrary-ring Rees theorem. The Rees repair now correctly distinguishes its native-PBW derivation from Gutt's real convention, and §7.1 has usable Etingof locators; those portions of previous R09 are repaired. The remaining failure is documentary, not a counterexample to the displayed mathematics.

## R07 (P3) — Per-definition APIs and three discriminating Checks remain incomplete

**Location:** README.md:1414–1428 (polynomial translation), :1454–1465 (inner automorphism group), :1500–1521 (trace-power constructions), and :1871–1968 (compact Albert constructions).

**Claim:** Every introduced definition has its own usable API, at least three discriminating Checks and identifiable dependencies.

**Witness:** Translation and the inner-automorphism/trace-power maps still sit in large prose blocks without three Checks for each. The four compact-Albert Checks cover determinant, positivity and conjugation, not the several complexification/derivation comparison maps.

**Repair:** Give each retained definition its API and three tests, separating dependencies when they differ. For translation, test 1↦1, h↦h−1 under τ_(−ρ) in A₁, and h²+2h↦h²−1; τ_(+ρ) instead gives h²+4h+3. For a complexification map test the unit, a noncommuting generator product, and complex-linear conjugation on i⊗1 (fixed, rather than negated). The new three-Check lists in §7.1 and §9.3 repair those particular definitions, but not the whole layer.

## Previous findings: repair audit

This audit was performed first, followed by the full review. The companion files are byte-for-byte unchanged from the preceding reviewed head. No supplied repair report marks a finding “not actionable in this package”; none was found among the supplied package/job artifacts.

| Previous finding | Passage at this head | Status |
|---|---|---|
| R01 external contracts | “registered as supplier gaps” (README:51); four contracts at :362–414 | Partly repaired: precise contracts added, registration absent; R01. |
| R02 compact periods | “Consume LieGroups gap:torus-period-lattice” (:2397) | Partly repaired: no longer attributes it to an existing Layer 7 theorem, but the contract is undeclared; R01. |
| R03 reversed ownership | “Layer 6.2 owns the lattice cone expansions” (:40) | Not repaired; R02. |
| R04 admitted data | “The sole admitted data family” (Sl2TensorOrthogonalityTargets:47) | Not repaired; R03. |
| R05 isotypic duplication | “native … consumed, not rebuilt” (README:1075–1082) | Repaired: pinned components, multiplicities, dictionary and decomposition cited; triangular inversion is the retained extension. |
| R06 missing type-A headline | “the statement owned by ClassicalGroups Layer 4” (:874–875); corresponding Suggested docstring :44–46 | Repaired by identifying its existing owner: main ClassicalGroups Suggested:215 states the determinant-twisted character equality. No second declaration is required here. |
| R07 companion form | “Illustrative, nonexhaustive target signatures” (Sl2TensorOrthogonalityTargets:11) | Not repaired; R04. |
| R08 padding | `splitEnveloping_mem_center_iff` (ReductiveCenterTargets:76) remains admitted | Not repaired; the exact-lemma probe succeeds again; R05. |
| R09 locators | “derived finite computation” (README:432); Etingof theorem/page locators at :1654–1719 | Partly repaired: Rees generality clarified and polynomial carriers located; tensor/sign/Haar/alcove-center locators remain R06. |
| R10 per-definition Checks | “Degree≤1 contains 1+h and excludes h²” (:1661), plus determinant and complex-conjugation controls :1951–1962 | Partly repaired: §7.1, §9.3 and several compact controls improved; remaining maps need R07. |

## Verified sound

Read all 2,599 README lines, all five listed Lean files (820 lines), and the family index. Read the normative repository-root README and CONTRIBUTING (the supplied parent-relative paths do not exist in this worktree). Main ReflectionInvariantTheory and Completed/OrthogonalL2Bases supplied shape comparisons. HEAD is the requested commit; the prescribed outside-folder diff and final `git status --porcelain` are empty.

The worker's gate reports every check passing. Independently, the permitted targeted build completed successfully (9,170 jobs), and direct `lake env lean` on Suggested.lean emitted only the 15 expected `sorry` warnings. The prescribed dependency check returned:

```text
depcheck: 204 roadmaps, 1554 edges, 0 problem(s)
```

No UPWARD or CYCLE line occurred. All 26 Needs lines and the supplier paragraphs were read; R01 concerns missing contract registration and R02 ownership hidden by downstream wording. No gate failure, outside-folder edit, copied source passage, executable algorithm, or `set_option` was found in the reviewed content.

The mechanical signature probe printed `#check @name` for all 121 named declarations in one scratch file, normalizing only imports there. It elaborated with only sorry warnings. The 20 main-file declarations retain their intended binders: algebraic closure on the general representation/HC results; characteristic zero but no algebraic closure on split Serre; arbitrary characteristic for central-monic finiteness and product center. The degree filtration omits unused characteristic-zero/Killing hypotheses; Cartan restriction omits characteristic zero and algebraic closure, matching §7.1. No lost-binder correction is needed. This does not certify admitted data in the companion.

There are 60 theorem declarations, 55 admitted. Each admission was tried with one `simp`, `rfl` and `infer_instance` in scratch; none closed. The separate one-lemma center-transport probe closed, and the five already-proved one-line API declarations remained evident. Failed simple tactics do not establish depth: the README Check mirrors remain padding.

The 15 main-file headlines are normalized polynomial/symmetric-power comparison; central-monic module finiteness; equivariant filtered PBW symmetrization; minuscule Pieri; invariant-form Tits sign; Lie–Chevalley restriction; filtered Harish–Chandra; central-character/dot-orbit equivalence; split Serre injectivity; split octonion/G₂ and Albert/F₄ identifications; E₈ dimension; E₆/E₇ dimensions; dual-standard glₙ Pieri; and the normalized product-center equivalence. All have numerical or explicit algebraic controls below. The README additionally promises tensor orthogonal decomposition, Rees fibres/Poisson comparison, Fourier/endpoint comparisons, compact exceptional models, category O, affine closed alcoves and compact centers. The main docstring identifies unavailable carriers for the latter construction headlines. The type-A character identity is supplied by ClassicalGroups, not omitted as “unstatable.” The tensor companion still forces its statements through admitted data (R03).

### Source sample: all ten targets

Source line references are to the service's line-numbered legal extractions. The version and printed-page numbers were checked, rather than inferred from titles. No manifest was edited.

| Seeded target | Locator verification and scope |
|---|---|
| 0.1 polynomial tensor strings/Hermitian orthogonality | No exact source locator is supplied. The native symmetric-tensor normalization was opened, and the formulas recomputed below. This is R06, not source certification. |
| 3.1 PBW/Rees/linear Poisson | `gutt line 899`–`922`, printed slide 14 (PDF page 44), states the positive real linear Poisson convention and averaged PBW comparison. It does not state arbitrary-ring Rees fibres; the head now explicitly derives those from native PBW. |
| 3.2 ordered/symmetrized first order | Same Gutt slide supplies the symmetrization framework. The affine formula is an identified derivation from XY−YX=ħY; the two generator products and quadratic correction below reproduce its half-bracket convention. |
| 5.1 opposition/duality/sign | Native duality/opposition and RootSystems Layer 4 are actual inputs; the new principal-sl₂ sign route has no exact external locator. Compact FS/period inputs remain R01. No claim that an unread book certifies this block. |
| 5.2 Haar type-A characters | ClassicalGroups Layer 4's actual character theorem is resolved. No exact source locator is given for this independent Haar proof. The virtual-coefficient and Haar-norm calculation is checked below; regular extension remains R01. |
| 6.2 Fourier boundaries/endpoints | `dcpv line 475` (Theorem 2.15, p.11) requires unimodularity and an alcove inside the zonotope with 0 in its closure. `dcpv line 517`–`570` gives D/DM, complex scalar extension, restrictions and interpolation (pp.12–13). `dcpv line 653` gives general inversion (Theorem 2.29, p.15); `dcpv line 803`–`902` gives positive and polarized counting, convolution, and general reconstruction (Propositions 3.2/3.4, Theorem 3.3, pp.19–20). These support the displayed formulas with the retained spanning/height/directional hypotheses. Generic ownership is R02. |
| 7.1 polynomial carriers | `etingof line 2153`–`2210` gives Theorem 10.1 and Remark 10.2 (pp.51–52), including Killing-dual restriction. `etingof line 2993`–`2999` supplies averaged equivariant symmetrization and center symbols in the proof of Theorem 13.5 (p.69). `etingof line 3041`–`3080` gives Theorem 14.1 (pp.70–71), raw HC, shift, leading map and filtered isomorphism. The source is complex; the README supplies an algebraic route for the broader field statements. |
| 9.2 reductive center/invariant maps | `etingof line 2211` and `3081` state reductive extensions; Example 10.3, `etingof line 2213`–`2244` (pp.52–53), gives the glₙ/slₙ invariant generators. Native tensor-centralizer input was opened. Dixmier §1.6 remains unread. |
| 9.3 normalized product | Native product/abelian maps and Mathlib tensor centralizer support the identified derivation. The stated Dixmier §1.6 locator cannot be certified from an accessible text. The direct-product theorem is not falsely restricted to reductive/Killing inputs. |
| 10.2 compact center | The dimensionless/compact period calibration now has explicit computed Checks. There is still no exact source locator, and the newly named period gap is unregistered (R01/R06). |

Additional readable locators: `stacks line 13996`–`14006`, tag 02ML, requires finite type, a minimal prime and a finite generic fibre before localizing to a finite map; these hold in the described domain/generically finite polynomial application. `baez line 354`–`398` supports the stated Cayley–Dickson coordinate comparison and alternative norm laws. Its determinant display at `baez line 1475`–`1481` has the layout error recorded below; the roadmap's native cyclic formula does not copy that error. `landsberg-manivel line 45`–`79` is complex magic-square background, not an arbitrary-field construction theorem. The README does not mark any additional locator “unverified”; the unread bibliography is listed under Not verifiable.

### Pinned declarations opened

These 20 groups record concrete inspected definitions/results, including their limits; a module-path token `DotOrbit` is not a missing declaration.

| Pinned file and line | Verified content |
|---|---|
| Mathlib/Algebra/Lie/Sl2.lean:79 | Primitive vectors explicitly require nonzero, h-eigenvector and e-annihilation; this is not generalized-weight membership alone. |
| Mathlib/Algebra/Lie/CartanSubalgebra.lean:49 | Cartan means nilpotent and self-normalizing; splitness is a separate triangularizability hypothesis. |
| Mathlib/Algebra/Lie/Semisimple/Defs.lean:75 | HasCentralRadical is radical=center; it does not assert complete reducibility of all modules. |
| TauCeti/LinearAlgebra/SymmetricPower/Basic.lean:165,184 | `toTensorPower` sums all permutations, including repeated words; no factorial division is built in. |
| TauCeti/Algebra/Lie/Multiplicity.lean:126 | Multiplicity is finrank of the Lie Hom space; without algebraic closure it includes the endomorphism-division-algebra factor. |
| TauCeti/Algebra/Lie/Isotypic.lean:97 | Component is the supremum of submodules equivalent to S, not a chosen decomposition. |
| TauCeti/Algebra/Lie/UniversalEnveloping/Module.lean:562 | The canonical Lie/U(L) submodule order isomorphism preserves the underlying subsets. |
| TauCeti/Algebra/Lie/UniversalEnveloping/Multiplicity.lean:164,227 | Finite-dimensional isotypic component equivalence/dimension over an algebraically closed field; complete reducibility of M is unnecessary. The canonical enveloping action is installed internally. |
| TauCeti/Algebra/Lie/HighestWeight/Decomposition.lean:168,268 | Packaged dominant-weight decomposition and its character sum already exist. |
| TauCeti/Algebra/Lie/HighestWeight/CompleteReducibility.lean:259 | Complements for finite-dimensional modules over characteristic-zero Killing Lie algebras; no algebraic closure premise. |
| TauCeti/Algebra/Lie/HighestWeight/Minuscule.lean:197,226 | Minuscule predicate and orbit-weight multiplicities; not the tensor Pieri theorem asserted here. |
| TauCeti/Algebra/Lie/HighestWeight/CentralCharacter/DotOrbit.lean:25–70 | Dot-orbit invariance and inclusion of HC image in dot invariants; not HC bijectivity or the converse orbit-separation theorem. The module exists and builds. |
| Mathlib/Algebra/Algebra/Subalgebra/Centralizer.lean:170 | Include-right centralizer equals the range of id⊗center inclusion, with a free left module; the field application supplies freeness. |
| Mathlib/Algebra/Group/Center.lean:150 | `MulEquivClass.apply_mem_center_iff` is precisely the scratch-proved transport target. |
| TauCeti/Algebra/Lie/GeneralLinear/TraceForm.lean:126,148 | Actual tr(AB) form and nondegeneracy over a commutative ring, including empty matrix indices. |
| TauCeti/Algebra/AlbertAlgebra/Basic.lean:213,229,317,366 | Split cyclic carrier, product requiring invertible 2, trace, dimensions 27/26. It is not the positive real Albert algebra. |
| TauCeti/Algebra/Octonion/Derivation.lean:263,285,319,339 | Derivation trace/conjugation, skew-adjoint comparison and imaginary submodule on the split octonions. |
| TauCeti/Algebra/Lie/UniversalEnveloping/Prod.lean:163 and Abelian.lean:174 | Opened the actual `prodEquivTensor` and `symmetricAlgebraEquiv` used by both product definitions; normalization is fixed by their generator maps. |
| TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Finite.lean:139,174 | Opened the finite ordered spanning/integrality inputs to the explicit central-monic adapter. |
| TauCeti/Algebra/Lie/Presentation/Serre/Killing.lean:197,217 | Inspected the supplied normalized Serre system/surjection, with transposed root Cartan matrix and split characteristic-zero scope. |

The supplier paragraph at README:334 unnecessarily describes a separate U(L)-module/scalar-tower hypothesis for the isotypic equivalence and dimension theorems: their pinned declarations install it internally. This does not narrow the actual imported theorem or reinstate the deleted construction target; remove that qualification when making the contracts exact.

### Cross-roadmap ownership and order

Object searches used `roadmaps grep`/`show`, the named new-head checkouts, main, and board packages; no unlisted open PR was investigated. The following 15 contract groups were resolved: RootSystems Layers 1–6 (main :296, :321, :356); ClassicalGroups Layers 2–4 and its character theorem (main README:272, Suggested:215); SchurWeyl Layer 7 (main :323); CompactGroups Layer 6 (main :369); LieGroups integration/maximal tori/complexification (main :355–426); ComplexKahlerGeometry K5a (main :570 onward); ReductiveGroups tangent/Cartier cut (main Layer 2 and 5P); CharacteristicClasses C5.1 (main :1059 onward); TangentialBordism's B3-labelled compact Albert geometry (supplied new head §§9.1–9.3, :2053 onward); SpinRepresentations Layer 9's consumer role; AdoIwasawa's PBW consumer role; GroebnerGeometry G4's commutative weight-Rees boundary; and the three disputed generic owners in R02. TangentialBordism's headings now number these B3 targets under Layer 9, but the B3 labels and contracts remain explicit; this is not a missing-target finding.

Main ClassicalGroups already states the type-A character identification. The retained Lie differentiation/intertwiner comparison has a different object. The native isotypic theory is now imported. Split-versus-positive exceptional models remain distinct; TangentialBordism imports the compact algebra rather than constructing it. RootSystemsPartII explicitly avoids an affine Weyl carrier. The LieHighestWeightPartII plan extends category O and analytic representation theory and imports ordinary PBW/HC; it is not an owner of the algebraic comparisons tested here. The object searches and inspected supplier modules revealed no duplicate fully qualified declaration name; this was not an exhaustive namespace scan of unrelated roadmaps. The unresolved three generic constructions are exactly R02.

### Adversarial tables

Each row gives concrete values, rather than a claim that a build proves truth. “Pass” means these instances agree, not that the general theorem has been proved. Tensor rows with admitted constructions test the intended polynomial realization and therefore retain R03. Exceptional isomorphism rows give dimension/form controls only. All 121 named Lean declarations are represented in the next five tables. The subsequent README table covers additional mathematical constructions, every seeded target and all finding witnesses. Exact rational computation independently checked 55 allowed (m,n,r) triples with m,n≤4, 225 lowered norms and 946 cross-string pairings.

**Suggested.lean (20 declarations).**

| Statement | Instances | Values computed on both sides / negative control | Result; change |
|---|---|---|---|
| exists_polynomialSymmetric | d=0,2 | 1↔1; xy↔symmetric xy with coefficient 1; averaged image coefficients 1/2,1/2 | Pass; retain normalization |
| module_finite_of_central_monic_relations | abelian Kx, R=K[x^p], p=2,3; L=0 | x^p−r=0; spanning ranks p=2,3; empty basis gives rank 1 | Pass; positive degrees retained |
| exists_pbwSymmetrization | [x,y]=y; empty word | sym(xy)=YX+Y/2; sym(1)=1; XY differs by Y/2 | Pass; linear, not multiplicative |
| minuscule_pieri | A₁ λ=μ=ω; λ=0 | multiplicities at 2ω,0,4ω are 1,1,0; λ=0 retains only ω with multiplicity 1 | Pass; dominance needed |
| invariantForm_isSymm_iff_tits_sign | A₁ weights 1,2; rank 0 | parity signs −1,+1,+1; alternating standard form versus symmetric quadratic/trivial forms | Pass; nonzero form needed |
| symmetricDegreeLE | rank-one H; n=0,1 | F₀=K; F₁=K+Kh; h² has degree 2>1 | Pass |
| linearInvariants | A₁ at t=±1 | h² gives 1=1; h gives 1≠−1; h²+2h gives 3≠−1 | Pass |
| lieInvariantSymmetricAlgebra | sl₂, h and q=h²+4ef | e·h=−2e≠0; e·q=−4eh+4eh=0 | Pass |
| lieCartanRestriction | sl₂ and L=0 | h↦h, e,f↦0, q↦h²; 1↦1 in rank 0 | Pass |
| exists_lieChevalleyRestrictionIso | sl₂ | K[q]→K[h²], q↦h², degree 2=2; q² has degree 4=4 | Pass control |
| exists_harishChandraIso | sl₂ Ω=h²+2h+4fe | Ω↦t²+2t; Ω²↦(t²+2t)²; filtration degrees 2 and 4 agree | Pass control |
| centralCharacter_eq_iff_dotOrbit | λ=1, μ=−3; λ=0, μ=1 | Casimir 3=3, reflected weights; second pair 0≠3 and different orbits | Pass both directions |
| serreLift_injective_of_base | split A₁; nonsymmetric edge | images h,e,f have rank 3; off-diagonal −1,−2 give Serre exponents 2,3 with transpose | Pass control |
| derivationOctonion_equiv_g2 | split ℚ,ℝ | 8+3+3=14=12 roots+rank 2; split null norm 0 excludes division-real identification | Dimension/form control |
| derivationAlbert_equiv_f4 | split ℚ,ℝ | 27=3+3·8; derivation target dimension 52=48 roots+4 | Dimension control |
| finrank_e8 | split characteristic zero | sl₉ plus two third exterior powers: 80+84+84=248=240+8 | Pass dimension control |
| finrank_e6_e7 | split characteristic zero | 72+6=78; 126+7=133 | Pass dimension control |
| gl_dual_standard_pieri | gl₂ μ=(3/2,1/2); n=0 | summand dimensions 1+3=4=2·2; n=0 is 0=empty direct sum | Pass |
| productEnveloping | Kz×sl₂; zero factors | (z,e)↦z⊗1+1⊗e; unit↦1⊗1 | Pass |
| exists_productCenterEquiv | same product | z⊗Ω maps to zΩ; 1⊗e excluded by [h,e]=2e; zero factors give K≃K | Pass control |

**AffinePBWFirstOrderTargets.lean (4 declarations).**

| Statement | Instances | Values computed | Result; change |
|---|---|---|---|
| orderedFirstOrder | x,y; y,x; x²,y | y,0,2xy | Pass; keep as README example |
| generator_coefficients | ℤ, then 𝔽₂ | y=y and 0=0 in both coefficient rings | Pass; delete padding R05 |
| splittingCorrection | 1,x,y,xy,x²y | 0,0,0,y/2,xy | Pass; rational coefficients needed |
| symmetric_firstOrder | x,y; y,x; x²,y | y−y/2=y/2; 0−y/2=−y/2; 2xy−xy=xy | Pass; half bracket, not full bracket |

**ReductiveCenterTargets.lean (14 declarations).**

| Statement | Instances | Values computed | Result; change |
|---|---|---|---|
| productEnveloping | Kz×sl₂ | z↦z⊗1; e↦1⊗e; 1↦1⊗1 | Pass |
| splitEnveloping | gl₂ diag(2,0) | center coefficient 1; derived diag(1,−1); sum diag(2,0) | Pass |
| productEnveloping_generator | (z,e), (0,0) | z⊗1+1⊗e; 0 | Pass; delete single-simp API R05 |
| tensorCenterInclusion | z⊗Ω, 1⊗1 | unchanged ambient tensors; coefficient 1 stays 1 | Pass |
| tensorCenterInclusion_injective | coefficient of z⊗Ω | 1 remains 1, zero remains zero | Pass field control |
| tensorCenterInclusion_range | Kz, sl₂ | range K[z,Ω]; e excluded since [h,e]=2e≠0 | Pass |
| splitEnveloping_mem_center_iff | Ω and e | true↔true; false↔false | Exact native lemma; delete R05 |
| matrixTracePairing | E₁₂,E₂₁ and E₁₂,E₁₂ | tr(E₁₁)=1; tr(0)=0 | Pass; existing native definition |
| matrixTracePairing_apply | same units | 1=1, 0=0 | rfl; delete R05 |
| matrixTracePairing_nondegenerate | all matrix units; n=0 | each Eᵢⱼ pairs with Eⱼᵢ to 1; empty space radical {0} | Native theorem; delete R05 |
| centralTensorRepresentation | Z=S=C₂, scalar characters m=n=1 | at (−1,−1), product action +1; with m=0,n=1 it is −1 | Pass |
| centralTensorRepresentation_apply | same pair on v=1 | 1=1 and −1=−1 | rfl; delete R05 |
| centralKernelTrivial | diagonal C₂ kernel | m+n even gives +1, odd gives −1 | Pass; excludes odd descent |
| centralTensorRepresentation_descends_iff | quotient by diagonal C₂; identity quotient | even gives descended character; odd would require 1=−1; trivial kernel always descends | Pass both directions |

**Sl2TensorOrthogonalityTargets.lean (56 declarations).** Here x,y are polynomial vectors, and A=y²⊗x², B=xy⊗xy, C=x²⊗y² in the n=2 examples.

| Statement | Instances | Values computed | Result; change |
|---|---|---|---|
| Poly | x²+xy and 0 | degrees 2 and empty support; coefficients (1,1,0) and (0,0,0) | Native carrier |
| P | d=0,2 | dimensions 1,3; x²+1 excluded at d=2 | Pass |
| S | d=0,2 | dimensions 1,3; xy=yx in symmetric quotient | Pass |
| T | m=n=1; m=0,n=2 | dimensions 4 and 3 | Pass |
| monomial | d=2,i=1,3 | xy; y³ from truncated subtraction at i=3 | Correct only with guarded use |
| e | d=2,i=1,3 | xy,0 | Intended values; admitted data R03 |
| exponent | d=2,i=1,3 | exponent pairs (1,1),(0,3), totals 2,3 | Pass; out-of-range coefficient vanishes on P₂ |
| coefficient | d=2, p=xy, i=1,3 | 1,0 | Pass |
| symmetricMonomial | d=2,i=1,3 | symmetric xy,0 | Pass |
| polynomialSymmetric | d=0,2 | intended 1↔1, xy↔symmetric xy | Admitted equivalence; R03 |
| polynomialSymmetric_e | d=2,i=1,3 | intended symmetric xy=symmetric xy; 0=0 | Depends on R03 |
| polynomialSymmetric_inverse | d=2,i=1 | intended xy=xy; factor-two inverse would give xy/2 | Depends on R03 |
| action | diag(2,3), d=2 | x²↦4x², xy↦6xy, y²↦9y² | Intended normalization; R03 |
| tensorAction | diag(2,3), x⊗y | image 6x⊗y; identity gives x⊗y | R03 dependency |
| Epoly | xy and x² | x² and 0 | Pass |
| Fpoly | xy and x² | y² and 2xy | Pass |
| E | same homogeneous inputs | x² and 0, still degree 2 | Admitted linear-map obligations R03 |
| F | same homogeneous inputs | y² and 2xy | Admitted obligations R03 |
| H | xy,x²,y² | 0,2x²,−2y² | Pass intended model |
| Etot | m=n=1, y⊗y | x⊗y+y⊗x | Pass intended model |
| Ftot | m=n=1, x⊗x | y⊗x+x⊗y | Pass intended model |
| Htot | m=n=1, x⊗x and x⊗y | 2x⊗x and 0 | Pass intended model |
| v | m=n=1,r=0,1 | x⊗x; x⊗y−y⊗x | Nonzero coefficients 1,−1 |
| lowered | m=n=1,r=0,k=0,1,2,3 | x⊗x; y⊗x+x⊗y; 2y⊗y; 0 | Pass endpoints |
| tensorCoefficient | xy⊗xy in P₂⊗P₂ | coefficient (1,1)=1, (0,0)=0 | Pass |
| hermitian | P₂: xy, ixy | norm² 1/2; ⟨ixy,xy⟩=−i/2 | Pass first-slot conjugation |
| tensorHermitian | xy⊗xy | norm² 1/4=(1/2)(1/2) | Pass |
| highestNorm | (m,n,r)=(1,1,1),(2,2,2) | 2 and 1+1+1=3 | Pass |
| averagedSymmetrization | d=0,2 | 1↦1; xy↦(x⊗y+y⊗x)/2, norm² 1/2 | Pass; raw sum norm² 2 |
| e_coordinate | d=2,i=j=1; i=0,j=1 | 1=1; 0=0 | API, not headline |
| E_e | d=2,i=1,0 | x²=1·x²; 0=0·e₀ | API; endpoint guarded |
| F_e | d=2,i=1,2 | y²=1·y²; 0=0·e₃ | API; e₃=0 |
| H_e | d=2,i=0,1,2 | 2x²,0,−2y² match 2−2i | API |
| highest_killed | m=n=1,r=1 | E(x⊗y−y⊗x)=x⊗x−x⊗x=0 | Pass intended model |
| highest_nonzero | same r | coefficients 1,−1; squared norm 2>0 | Pass |
| highest_H | m=n=1,r=0,1 | eigenvalues 2 and 0 equal m+n−2r | Pass |
| raising_lowered | m=n=1,r=0,k=1,2,3 | 2v,2Fv,0 agree with k(3−k)F^(k−1)v | Pass |
| lowered_endpoint | m=n=1,r=0,1 | F³v₀=0; Fv₁=0 | Boundary API |
| adjoint_E_F | d=2,p=xy,q=x² | ⟨x²,x²⟩=1=⟨xy,2xy⟩ | Pass; unweighted form would give 1≠2 |
| tensor_hermitian_tmul | xy⊗xy | 1/4=(1/2)(1/2) | API |
| hermitian_positive | xy; zero excluded | real norm 1/2>0, imaginary part 0; zero gives 0 | Pass |
| SU2_invariance | unitary rotation x↦(x+y)/√2 on x² | transformed coefficients (1/2,1,1/2); norm² 1/4+1/2+1/4=1 | Pass intended action; R03 |
| strings_orthogonal | m=n=1, middle symmetric/antisymmetric vectors | inner product 1−1=0; equal H-weight does not imply same string | Pass |
| highest_norm | (2,2,2) | norm(A−2B+C)=1+4/4+1=3=highestNorm | Pass |
| highestNorm_factorials | 55 triples m,n≤4; (2,2,2) | all rational equalities agree; example 2!·0!·0!·3!/(2!·2!·1!)=3 | Pass |
| lowered_norm | m=n=1,r=0,k=1,2 | norms 2,4 equal 1!·2!/1!, 2!·2!/0! | Pass; 225 tests |
| StringIndex | m=n=1; m=n=0 | cardinalities (3+1)=4, 1 | Pass |
| stringVector | m=n=1 | vectors x⊗x, y⊗x+x⊗y, 2y⊗y, x⊗y−y⊗x | Coefficient determinant magnitude 4 |
| strings_independent | preceding four; rank zero case | determinant magnitude 4≠0; rank-zero tensor is 1-dimensional with vector 1 | Pass |
| strings_span | m=n=1, and m,n≤4 | rank 4=dimension 4; all string counts (m+1)(n+1) and nonzero orthogonal norms | Pass intended model |
| sourceV1 | n=2 | x²⊗x² | Highest weight 4 |
| sourceV2 | n=2 | xy⊗x²−x²⊗xy | Highest weight 2 |
| sourceV3 | n=2 | A−2B+C | Highest weight 0 |
| source_F2 | n=2; n=0 | 2A+8B+2C; 2y²⊗1 | Example API; delete R05 |
| source_F1 | n=2; n=1 | A−C; A−B (out-of-range C=0) | Example API; delete R05 |
| source_three_cross_products | n=2,3,4 | pairings 0,0,0 each; corresponding norm triples (24,2,3), (40,5/2,2), (60,3,5/3) | Check padding; delete R05 |

**TypeAHaarTargets.lean (27 declarations).** Write x,y for torus coordinates; exponents remain integral, with evaluation at units.

| Statement | Instances | Values computed | Result; change |
|---|---|---|---|
| Weight | n=0,2 | one empty weight; (1,−1) has degree 0 | Pass |
| Laurent | n=0,2 | ℤ at rank 0; x·x⁻¹=1, exponent 1+(−1)=0 | Pass native carrier |
| rho | n=0,1,2 | empty, (0), (1,0) | Pass |
| permute | transposition on (2,0) | (0,2); applying twice returns (2,0) | Pass inverse-action convention |
| monomial | β=(1,−1); β=0 | x/y; 1 | Pass |
| denominator | n=0,1,2 | 1,1,1−y/x | Pass |
| alternant | n=2, β=(1,0),(0,0) | x−y; 0 | Pass sign/repeated-coordinate control |
| numerator | λ=(1,0) | x⁻¹(x²−y²)=x−y²/x | Pass |
| polynomialToLaurent | X₀+X₁; 1 | x+y; 1 | Pass unit/generator maps |
| candidate | λ=(1,0),(−1,−1); n=0 | x+y, (xy)⁻¹, 1 | Pass |
| evaluate | these candidates at (2,3) | 5,1/6; empty tuple gives 1 | Pass units prevent 0/0 |
| score | x=(3,2,1), weights (1,1,−2),(2,−1,−1) | 3+2−2=3; 6−2−1=3 | Pass; not injective without independence |
| centralDegree | same weights | 0,0 | Pass |
| dominanceLE | μ=(1,1), λ=(2,0); converse | sums 2=2; prefix 1≤2; converse 2≤1 false | Both directions tested |
| orbitSum | λ=(1,1),(1,0) | xy (once), x+y | Pass; excludes stabilizer duplication |
| groupWeightCharacter | standard GL₂ and Sym² | x+y; x²+xy+y² | Pass actual weight multiplicities |
| evaluate_groupWeightCharacter | standard diag(2,3) | 5=trace diag(2,3) | Pass rationality scope |
| group_character_eq_orbit_add_lower | Sym² GL₂ | x²+xy+y²=(x²+y²)+xy; lower coefficient 1 | Pass |
| finite_dominant_score_sublevel | x=(2,1), S=2, B=4 | weights (1,1),(2,0), scores 3,4; (3,−1) score 5 excluded | Pass |
| score_eq_gap_sum | x=(2,1), λ=(2,0) | score 4; mean term 3 plus (2−3/2)·2=1 | Pass; n+1 denominator nonzero |
| finite_dominance_ideal | λ=(2,0); n=0 | ideal {(2,0),(1,1)} size 2; singleton empty weight | Pass |
| staircase_alternant | n=2; n=0 | x−y=x(1−y/x); 1=1 | Pass |
| candidate_mul_denominator | λ=(1,0) | (x+y)(1−y/x)=x−y²/x; at x=y=1 both sides 0 | Pass; evaluate candidate itself as 2 |
| candidate_top_coefficient | λ=(1,0),(−1,−1) | coefficient 1,1 | Pass |
| candidate_support_dominated | λ=(2,0) | supports (2,0),(1,1),(0,2), prefix values 2,1,0≤2 | Pass |
| numerator_coefficient_norm | n=2, λ=(1,0); n=0 | 1²+(−1)²=2=2!; 1=0! | Pass |
| evaluate_mul | p=x,q=y⁻¹ at (2,3) | 2/3=2·(1/3) | API; multiplicative evaluation |

**Additional README statements, conventions and worked examples.**

| Statement | Instances tried | Computed values on each side / excluded model | Result; change |
|---|---|---|---|
| Generalized versus honest weights | abelian generator acting by J=[[0,1],[0,0]] | generalized weight-0 space dimension 2; eigenspace dimension 1 | Distinction retained |
| Cartan splitting and rank-zero conventions | zero algebra; real rotation action | zero Cartan/weights; real rotation eigenvalues ±i unavailable over ℝ | Split hypothesis is separate |
| Integral weight lattice is not a K-space | A₁ | ω(h)=1 integral; (ω/2)(h)=1/2 nonintegral | Arithmetic condition retained |
| Group lattice versus Lie weights | SU(2),SO(3),gl₁ | weight 1 descends only to SU(2); gl₁ allows weight 1/2 | Actual lattices retained |
| Polynomial action versus contragredient | diag(2,3) on x,y | vector action 2x,3y; contragredient 1/2,1/3 | Dictionary fixes direction |
| Bihomogeneous determinant highest vector | m=n=1 | x₁y₂−y₁x₂; E gives x₁x₂−x₁x₂=0 | Pass |
| Group exponential/differentiation | degree 2, exp(tE) on y² | y²+2txy+t²x²=(y+tx)² | Pass; finite E³=0 |
| Tensor decomposition determinant twist | P₂⊗P₂ | highest GL₂ weights (4,0),(3,1),(2,2); dimensions 5+3+1=9 | Pass; twists essential |
| Tensor intertwiner monomial normalization | N=2,i=1,2 | (1!/2!)Fv=(1/2)Fv; (0!/2!)F²v=(1/2)F²v | Matches F(x²)=2xy and F²(x²)=2y² |
| Orthogonal normalization | d=2 | norm²(√2 xy)=2·(1/2)=1 | Pass |
| Ordered PBW in characteristic 2 | affine [x,y]=y | XY−YX=Y, nonzero in char 2; no 1/2 in ordered formula | Pass generality |
| Rees presentation | affine generators | XY−YX=ħY; at ħ=0 commutator 0, at ħ=1 commutator Y | Pass |
| Rees zero fibre versus ambient evaluation | rank-one generator X=tx | quotient class X≠0, ambient evaluation X↦0 | Correct quotient map required |
| Rees freeness and ħ division | R=ℤ/4 and free rank one | coefficient shift t·Σa_nt^n has zero coefficients iff all a_n=0, despite 2·2=0 | No domain assumption needed |
| Zero ring/Rees degenerate case | R=0 or L=0 | zero ring gives zero family; L=0 gives R[t], fibres R | No hidden division |
| Unit parameter fibre | a=2 over ℚ versus ℤ | generator scaling 2x has inverse x/2 over ℚ; unavailable over ℤ | Unit premise retained |
| Poisson generator law | [x,y]=y, ξ=(2,3) | ξ([x,y])=3; reversed value −3 | Pass sign; generic owner R02 |
| Smooth polynomial comparison | 1,x,y at (0,0),(1,0),(0,1) | evaluation matrix determinant 1; zero polynomial gives 0 | Injectivity control |
| Rees Casimir | sl₂ | H²+2ħH+4FE specializes to Ω at 1, h²+4ef at 0 | Lower-degree correction retained |
| General affine ordered product | b=2,c=1,a=d=0 | X²Y=YX²+2ħYX+ħ²Y; star x²⋆y=x²y+2ħxy+ħ²y | Pass beyond generator case |
| Splitting change | xy | S_sym(xy)=YX+ħY/2; S_ord(Txy)=YX+ħY/2 | Pass; averaging needs ℚ-algebra |
| Induced Verma universal generator | zero target map versus Verma identity | 1⊗1↦0 allowed; identity maps it to nonzero vλ | Zero image not excluded |
| Opposition versus full diagram group | A₁,A₂,D₄ | opposition identity, swap ω₁/ω₂, identity; D₄ diagram group has 6 elements | Correct converse counterexample |
| Dual multiplicity/self-duality | A₂ standard; A₁ standard | A₂ ω₁↦ω₂ gives distinct modules; A₁ ω↦ω but alternating form | Distinctions retained |
| Principal sl₂ sign route | A₂ adjoint; A₁ V₁ | A₂ highest principal weight 4, decomposition V₄⊕V₂, sign +1; A₁ sign −1 | Top principal summand occurs once |
| Compact FS comparison | Q₈ standard; S₃ standard; circle z | indicators (2+2−12)/8=−1; (2+6−2)/6=1; ∫z²=0 | Proposed gap passes nonabelian/cyclic tests; R01 |
| Compactness boundary | additive ℝ | Haar mass ℝ=∞, no Haar probability normalization | Compact hypotheses essential |
| Regular compact extension | inverse U(1) character | z⁻¹→t⁻¹ with t=2 value 1/2; weight 1/2 changes sign after 2π | Gap R01, no half-integral character |
| Finite induction properness | n=1,S=2; n=0 | sole weight 2; empty weight degree 0 only | Degenerate slices finite |
| Unitriangular virtual inversion | GL₂ degree 2 | x²+y²=ch(Sym²)−ch(det) | Negative virtual coefficient −1, not a submodule |
| Integral polynomiality at collisions | standard λ=(1,0), x=y=1 | Pλ=2; cleared numerator=denominator=0 | No 0/0 character definition |
| Haar norm | standard GL₂ candidate | unweighted torus norm² 2; weighted group norm² 2/2!=1 | Pass normalization |
| Norm-one virtual identification | integer coefficients aν | Σaν²=1 permits exactly one ±1; top coefficient +1 rules out −1 | Pass identification step |
| Deep-chamber tensor rule | gl₂ λ=(2,0), μ=(1,0) | gap 2>spread 1; summand dimensions 4+2=6=3·2 | Pass strict-spread hypothesis |
| Interlacing branching | λ=(2,1,0) | middle rows (1,0),(1,1),(2,0),(2,1), dimensions 2+1+3+2=8 | Pass |
| Character inversion multiplicities | V₂⊕2V₀ | character e²+3+e⁻²; orbit coefficients 1,3; irreducible counts 1,2 | Distinguishes orbit coefficients |
| Dominant-integral polynomial density | rank one and zero | polynomial t vanishes at 0 but not 1; a constant vanishes on the rank-zero point iff 0 | All dominant points necessary |
| Polarized coefficient series | A=(1), b=−1,0,1 | positive (0,1,1); negative (−1,0,0) | Open reversed endpoint retained |
| Repeated/nonprimitive columns | A=(1,1), A=(2), b=2 | 3 solutions versus 1 | No saturation or dropped multiplicity |
| Smooth Fourier decay bound | φ=e^(2πibθ) | weighted coefficient (1+4π²‖b‖²)^N equals L¹ norm of (1−Δ)^Nφ | Matches Laplacian/Fourier scale |
| Fourier boundary sign | coefficient δ₁ on circle | pairing with z⁻¹=1, pairing with z=0 | Negative-frequency test fixed |
| Abel regularization | A=(1), z=1, ε=log2 | positive sum 2; reversed sum −1 | Distinct expansions; no value at pole |
| Wall-crossing measure | A=(1); A=(2) | coefficient difference all 1 gives δ₀; even-only coefficients give (δ₀+δ_(1/2))/2 | Haar mass 1; nonprimitive subgroup retained |
| Box versus cone Fourier factor | A=(1), ξ=0 | box removable value 1; damped cone value 1/ε | Distinct finite/infinite measures |
| Continuous versus discrete partition | A=(e₁,e₂,e₁+e₂), (2,3) | discrete 3 versus density 2; origin 1 versus 0 | Pass |
| Polarized box/cone identity | A=(−1), positive height | sum of negatively signed intervals shifted by b>0 is negative positive-ray measure | No continuous shift; both signs −1 |
| D/DM cocircuit equations | A=(1,1), x² and b² | ∂²x²=2; (1−τ₁)²b²=2 | Both excluded |
| Nonunimodular interpolation | A=(2), ε=1/2 | window {−1,0}; values of (−1)^b are −1,1; τ₂ difference 0 | Polynomial-only model fails |
| Directional Todd endpoint | A=(1) at b=0 | positive direction gives 1; negative direction gives 0 | Direction/zonotope premise retained |
| Piecewise versus distribution derivative | unit interval, test equal to x nearby | piecewise derivative 0; δ₀−δ₁ pairs to −1 | Distinction retained |
| General toric reconstruction | A=(2), b=0,1,2 | 1/2+(-1)^b/2 = 1,0,1 | Both vertices necessary; R02 ownership |
| Weyl fixed-point rational sum | A₁ λ=ω | t/(1−t⁻²)+t⁻¹/(1−t²)=t+t⁻¹ | Finite sum cancels common-chamber tails |
| ρ on nonsimply connected form | SO(3) | ρ=α/2 not a character; wρ−ρ=−α is a character | Normalized numerator stays integral |
| HC translation | sl₂ Ω | raw t²+2t; τ_(−1) gives t²−1; at λ=2, 8=3²−1 | Pass; opposite translation fails R07 |
| Leading center symbol | sl₂ q=h²+4ef | sym(q)=h²+2h+4fe; HC(sym q)−res(q)=2h, degree 1<2 | Pass |
| Trace-power restriction | standard sl₂ h=diag(t,−t) | tr h=0; tr h²=2t²; h² recovered by dividing by 2 | Characteristic zero explicit |
| Polynomial dominance route | map t↦t² over ℂ | differential at 1 is 2≠0; generic fibre size 2; integral equation t²−s=0 | Supports finite-localization route |
| Central-character dominant uniqueness | A₁ λ=2 | dot orbit {2,−4}; Casimir values 8,8; unique dominant member 2 | Pass |
| Freudenthal actual-weight denominator | A₁ λ=n, μ=n−2j, 1≤j≤n | unscaled norm-square difference 4j(n+1−j)>0; absent μ=−n−2 gives 0 | Actual-weight hypothesis matters |
| Compact versus split octonions | Zorn diag(1,0); division (1,0) | nonzero split norm 0; division norm 1 | Correct separate carriers |
| Division alternative/associator convention | i,j,ℓ | (ji)i=j(ii)=−j; (ij)ℓ=(0,k), i(jℓ)=(0,−k), associator=(0,2k) | Pass signs |
| Cross-product identity | u=i,v=j in quaternion subalgebra | i×(i×j)=−j; g(i,j)i−g(i,i)j=−j | Pass; unrelated triple identity not asserted |
| Albert determinant | diag(1,2,3) | trace 6, trace square 14, trace cube 36; (216−252+72)/6=6 | Pass |
| Albert norm correction | diagonal (3,1,1), x₁=1 | determinant 3−1=2, not 3 | Pass |
| Cyclic Albert cubic orientation | diagonal zero, cyclic off-diagonals (i,1,−i) | T((i·1)(−i))=2; tr A³/3=6/3=2 | Native cyclic formula correct |
| Formal reality and real form | one compact off-diagonal u; split null u | tr(A²)=2N(u)>0 versus 0 for nonzero split A | Positivity requires compact model |
| Complex-linear conjugation | i⊗1 | linear extension fixes i⊗1; tensor star gives −i⊗1 | Pass |
| Derivation compact Killing sign | nonzero skew-adjoint ad D | trace((ad D)²)=−‖ad D‖²<0; D=0 gives 0 | Zero centre needed for strictness |
| Reductive complete reducibility | abelian J²=0,J≠0 | kernel dimension 1, no invariant complement; scalar central action gives complement | Necessary central semisimplicity |
| gl₂ Lie weight versus group weight | μ=(3/2,1/2) | difference 1, dimension 2, scalar centre 2; entries nonintegral | Lie scope retained |
| LR Lie/group comparison | λ=μ=(1), n=2 and 1 | (x+y)²=(x²+xy+y²)+xy; n=1 gives x²=x²+0 | Correct tall-shape boundary; R01 |
| Connected algebraic fixed vectors | Gₘ weight 1 char0; weight p charp; disconnected C₂ sign | differential 1; differential 0 with nontrivial character; differential 0 with action −1 | Connectedness/char0 both needed |
| Scalar projection versus central symbol | gl₂ A=diag(2,0) | scalar coordinate tr(A)/2=1; symbol ι(I) evaluates to tr(A)=2 | Factor n retained |
| Matrix splitting boundary | n=0,1; n=2,char2 | centres K, K[t]; char2 identity trace 0 lies in derived factor | Excludes dividing by zero/nonunit |
| Matrix invariant restriction | diag(a,b), then diag(a,−a) | generators a+b,ab; on sl₂, 0,−a² | Degrees 1,2 versus 2 |
| Affine point orbits and stabilizers | A₁ in α-coordinate | Abar=[0,1]; stabilizer at 0 has order 2, at 1/3 order 1 | Closed boundary theorem distinct |
| Intermediate affine lattice | A₁ Q∨ versus P∨ | 2/3 remains 2/3 for W_aff; x↦1−x identifies it with 1/3 in extension | Ω quotient retained |
| Affine diagram semidirect product | A₂,D₄,E₆ | Ω sizes 3,4,3; finite diagram actions inversion, S₃ on 3 nonzero elements, inversion | Diagram automorphism sizes 6,24,6 |
| Compact-period normalization | SU(2) | exp(2πdiag(i,−i))=1; exp(diag(i,−i))≠1; root differential 2i | Correct period; contract R01 |
| Center versus affine stabilizer quotient | SU(2),SO(3),rank0 | centre sizes 2,1,1; affine stabilizer sizes 1,2,1 | Distinct quotients |
| Reductive central torus boundary | U(1) | root set empty, centre U(1) infinite | Finite-centre assertion confined to semisimple case |
| A₂ dimension Checks | (a,b)=(1,0),(0,1),(1,1),(2,0),(3,0),(2,2) | formula gives 3,3,8,6,10,27 | Pass |
| Adjoint/root-weight Checks | sl₃ | 6 root weights plus zero multiplicity 2 gives dimension 8 | Pass simple scope |
| sl₂ Casimir normalization | h,e,f | κ(h,h)=8, κ(e,f)=4; 8·Casimir=h²+2ef+2fe=h²+2h+4fe | Pass |
| Staircase Casimir separation | N=2,3 | values (1/2,9/2) and (27/4,43/4,59/4); differences 4(t−s) | Pass sign |
| CAR scalar and isotypic dimension | N=1,2 | scalar N²/2=1/2,2; total dimensions 2,16 divided by irreducible dimensions 1,2 give multiplicities 2,8 | Pass scalar/semisimplicity control |

## Not verifiable

- **Uncertified paywalled works:** Humphreys (1972), Bourbaki Chapters 7–8, and Goodman–Wallach (2009). The source service returned uncertified status; their contents were not guessed and no missing-text request was made for them.
- **No legal text returned by the source service:** serre1987, fulton-harris, humphreys2008, jantzen-quantum, jantzen-groups, jacobson, schafer and dixmier. Author/title resolution and the available DOI/AMS landing-page routes were tried. All failures are recorded together in `needs-references.toml`; they do not suspend this review.
- **Wrong work returned:** molev resolves to the 1994 Molev–Nazarov–Olshanski paper (`molev line 5`–`16`), not the cited 2007 monograph. The monograph's Chapters 1–2 remain unverified under the same key, recorded in the missing-text file.
- **No exact locator:** the blocks in R06 cannot be certified by treating a general bibliography as a theorem reference. Computed examples test the formulas and signs, not their external provenance.
- **Limits of the checks:** Etingof supplies complex statements; the algebraic extension routes were examined, but the source alone does not certify arbitrary-field split exceptional identifications or arbitrary-ring Rees statements. No new proof of those general theorems is claimed. Companion signatures were elaborated after scratch-only import normalization, not certified as compliant submitted files.

## Source issues

- **Error** in baez at §3.4, printed p. 32: the source says the displayed Hermitian layout has cubic term 2 Re(xyz); it should be 2 Re((xy)z*) for that layout; affects a stated result.
- **Misprint** in baez at §2.2, printed p. 10: the source says the doubling sequence puts quaternions before complex numbers; it should be ℝ, ℂ, ℍ, 𝕆; affects nothing.
