# Review of DrinfeldModulesAndTModulesPartII (pull request #1697 at 9b9bd2d)

**Verdict:** needs changes

## R01 (P2) — Restore the fourteen declared supplier contracts

**Location:** `TauCetiRoadmap/DrinfeldModulesAndTModulesPartII/README.md:7`, supplier contracts at lines 38–77, and local targets §§0.0, 0.2, 0.8, 1.3, 3.2 and 5.14. The scope says: “The power-sum degree theorem belongs to §0.2, the generating-series identity to §3.2, and finite-place specialisation to §5.14.”

**Claim:** The README still assigns this work locally although all fourteen declared gaps assign it to named suppliers. None of their required matching README contracts is present. This head is identical to the head reviewed in round 2; the ownership inconsistency remains.

**Witness:** `packages/DrinfeldModulesAndTModulesPartII/design/plan.json:4742` assigns `general-power-sum-degree` to DrinfeldModulesAndTModules DM.6; README:287 still plans that theorem locally. Counting gives fourteen plan gap entries and zero README `gap:` occurrences.

**Exact repair:** Restore the fourteen `What <Supplier> must provide (gap:<slug>): <needs>` entries under the named suppliers in `Exact supplier contracts`. Import those results by supplier and section in the scope and affected dependency lines, and remove the competing local proof targets. Retain native definitions needed for statable headline tests. The agreed supplier declarations remain contracts even if their implementations are not yet available; their absence from a supplier today is not the defect.

| Gap slug |Declared supplier and section | Competing local ownership |
|---|---|---|
| `general-power-sum-degree` | DrinfeldModulesAndTModules DM.6 | §0.2 |
| `anderson-thakur-generating-series` | DrinfeldModulesAndTModules DM.6 | §3.2 |
| `v-adic-mzv-specialisation` | DrinfeldModulesAndTModules DM.6/v-adic-special-values | §5.14 |
| `parent-carlitz-products` | DrinfeldModulesAndTModules DM.0/carlitz-products | §0.0, products |
| `parent-period-analytic-field` | DrinfeldModulesAndTModules DM.2 | §0.0, field and exponential/logarithm |
| `parent-carlitz-omega` | DrinfeldModulesAndTModules DM.2/omega | §0.0, Omega |
| `parent-effective-dual-motives` | DrinfeldModulesAndTModules DM.4/inverse-twist-dual-motive | §0.0, effective motives |
| `parent-twisted-analytic-rings` | DrinfeldModulesAndTModules DM.8 | §0.0, arithmetic series and twist |
| `parent-abp-interface` | DrinfeldModulesAndTModules DM.8/abp-lifting | §0.0, lifting |
| `abp-entire-from-equation` | DrinfeldModulesAndTModules DM.8/entire-from-equation | §0.0, entireness |
| `frobenius-constant-denominator` | DrinfeldModulesAndTModules DM.8/constant-denominator | §0.0, rational comparisons |
| `frobenius-fundamental-matrix` | DrinfeldModulesAndTModules DM.8/fundamental-matrix | §0.0, rational comparisons |
| `parent-small-power-sums` | DrinfeldModulesAndTModules DM.6/small-power-sum | §0.8 and its depth-one input |
| `integral-positive-index-stuffle` | PeriodsAndSpecialValues PS.9.2 | §1.3 |

**Repair test:** The slug reconciliation currently gives 14 declared / 0 represented; after repair it must give 14 / 14, with the same named suppliers and no competing local ownership. For the concrete degree-theory instance q=3, k=1, d=0,1,2, the values remain 1, −1/(θ³−θ), 1/ℓ₂ and their degrees remain 0, −3, −12. Restoring DM.6 as supplier changes ownership, not this input or its general prime-power scope. For the changed empty-matrix case, the restored ABP and entireness contracts still allow determinant 1, the empty solution and the unique empty lift.

## Previous findings

The previous report reviewed this same head; the supplied change file is empty. I checked its finding before reviewing the whole folder.

- **Previous R01: not repaired.** README:7 still says “The power-sum degree theorem belongs to §0.2, the generating-series identity to §3.2, and finite-place specialisation to §5.14.” There are still fourteen plan gaps and zero matching README contracts. R01 above retains the precise repair.
- **Earlier R02, recorded as repaired by round 2: remains repaired.** README:208 says “The zero square matrix of positive size” in the zero-matrix negative control; README:209 says “In size zero the empty matrix has determinant 1”. The empty solution and unique empty lift satisfy both determinant hypotheses. This is not another finding.

The earlier repair discussion about the missing parent roadmap does not settle R01: this review does not ask this package to create that parent or implement its gaps. It asks the README to preserve the named supplier contracts already declared in the plan. Future supplier delivery is not an additional finding.

## Verified sound

This is a full review of the README and Suggested.lean, including unchanged passages. I read the repository README and CONTRIBUTING rules, compared the main-branch RestrictedPowerSeries and NewtonPolygons roadmap shapes, checked all six layers, API lists, Checks, dependencies and the 40 Lean signatures. The previous review's test cases were used as a checklist and their substitutions were re-examined; the finite arithmetic and one-tactic probes below were run afresh. There is one P2 finding and no additional mathematical counterexample. No worktree file was changed, and the diff outside this folder is empty.

The scope remains arbitrary finite fields, including nonprime q, positive indices with first entry one, every finite place and weight zero where stated. No good-prime restriction, computational algorithm, copied source passage, sorry-backed data or option override was found. The proof routes distinguish ordinary from alternating values, whole-tuple from tail convergence, and q-divisibility from characteristic-p divisibility. The ownership assignments in R01 are the exception to the otherwise resolved supplier audit.

### Gate, dependency direction and Lean

The worker's gate at this exact head passes every scanner and its targeted build:

```text
gate DrinfeldModulesAndTModulesPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

I independently reran the specified movable dependency check. Its complete output is:

```text
depcheck: 204 roadmaps, 1642 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. This does not detect the missing contractual ownership in R01. I also ran direct `lake env lean` elaboration of the original Suggested.lean: exit zero, exactly 23 `sorry` warnings, no other warning or error. I did not rerun the worker's complete gate or targeted build.

A separate scratch copy appended `#check @name` for all **40 declarations** and tried `simp`, `rfl` and `infer_instance` independently on all **23 admitted theorems**, falling back to `sorry`. It elaborated with the same 23 warnings: none of these probes discharged a theorem. I compared all 40 resulting types with the README. No needed binder was lost; no signature change is required. In particular the finite-field cardinality, positive exponent, positive weight for twisted rigidity, compatible scalar towers and the direct theorem's weight bounds are present. The native completion's DecidableEq argument is explicit. An object search at the pins found no single existing special-value theorem that would discharge these statements by `exact`. No padding finding results.

There are **17 definitions with real bodies and 23 headline theorems**. The definitions use native Composition, Polynomial, RatFunc, completion, finitely supported functions, submodules and coefficient substitution. They do not postulate a free predicate or arbitrary realization in place of a headline's objects.

### Headline coverage

The README's end results and principal intermediate theorems are: power-sum degree descent and nonvanishing; MZV and CMPL nonvanishing; graded product algebras; ordinary and alternating Brown spanning; the strong Brown theorem; the equality of value spaces; Chang's grading and descent; ABP independence and Eulerian suffixes; Frobenius solution dimensions, twisted and two-row rigidity; small-entry and small-weight independence; the CMPL IND and Thakur bases; Todd's dimension formula and its algebraic-closure basis; the complete relation kernel; character splitting and normalized period relations; the alternating Hoffman basis and dimension; direct alternating small-weight spanning/independence; finite-place dimension bounds; and their Carlitz/interpolation foundations.

The 23 admitted declarations cover the statable deep results: `powerSum_degree_descent`, `multipleZeta_ne_zero`, `multiplePolylog_ne_zero`, `zeta_space_mul_le`, `brown_spanning`, `alternating_brown_spanning`, `value_space_bridges`, `strong_brown_spanning`, `zeta_algebra_graded`, `frobenius_solution_dimension`, `twisted_system_rigidity`, `two_row_rigidity`, `small_entry_independent`, `q_indivisible_independent`, `cmpl_ind_basis`, `thakur_basis`, `todd_dimension`, `thakur_basis_algebraicClosure`, `character_roots_independent`, `alternating_hoffman_basis`, `alternating_dimension`, `direct_small_weight_spanning` and `direct_small_weight_independent`. Small-weight basis corollaries are covered by the stronger stated bases, rather than padded into separate boundary theorems.

Suggested.lean:12–23 explicitly names the missing analytic Carlitz field/period/Omega and arithmetic entire-series interfaces, interpolation and Frobenius specialization, general MZ-property descent, ABP lifting/independence and Eulerian suffixes, q-shuffle rewriting for the relation kernel, period-character realization and finite-place realization/specialization. Their absence is explained, with no weakened stand-in. The polynomial Frobenius equations that *are* statable have actual coefficient-polynomial bodies and support conditions.

### Seeded source sample

All **15 sampled targets** were checked against the supplied legal extracted texts, including the hypotheses, numbering, page and formula. There are no README locators marked unverified. Page numbers below refer to the version in the supplied cache; the README's source-line pointers disambiguate that version. The audit distinguishes a source theorem from a consequence proved using it.

| Target | Text opened at locator | Result of comparison |
|---|---|---|
| §0.3 Thakur MZVs | ND21 §1.2, pp.2–3, lines 104–130 | Strictly descending nonnegative degrees and positive parts match; weight-zero value is the explicitly stated empty-product extension. |
| §0.5 nonvanishing | THAKUR09P Theorem 4 and proof, p.542, lines 445–465; ND21 line 120 | General prime-power power-sum degree descent gives a unique leading degree tuple. Unit degree characters preserve its nonzero coefficient. No first-entry-at-least-two restriction. |
| §0.13 Carlitz evaluation | IKLNDP24 proof of Theorem 3.4, p.42, line 4520; CCM23 proof of Theorem 5.2.1, p.25, lines 1373–1395 | The explicit evaluation is −π̃^(q−1)/(θ^q−θ); the logarithmic-derivative route gives the same sign. |
| §1.1 correction coefficients | ND21 §2.1, p.6, lines 280–289; CCM23 (2.3.2), p.9, lines 403–437; IKLNDP24 (4.2), p.44, lines 4658–4661 | Support 0<j<a+b and (q−1) dividing j; signs and binomial indices agree after correcting CCM23's dummy-variable misprint. |
| §1.2 equal-degree product | ND21 §2.1, p.6, lines 280–289; IKLNDP24 (4.1), p.43, lines 4629–4654 | Merged character is εη, correction tail character is 1, and correction index is (a+b−j,j). |
| §1.7 value algebras | THAKUR10 Theorem 3(ii)–(iii), p.1978, lines 230–236; THAKUR-UPDATES entry 36, pp.7–8, lines 305–330; IKLNDP24 Proposition 4.2, p.44, lines 4680 onward; CCM23 Proposition 2.3.5, p.9, lines 440–446 | Products preserve weight and total character, with depth bounds. README uses the corrected simultaneous induction, not the faulty proof step. |
| §2.4 controlled C_W(R₁) | ND21 Lemma 2.9, p.10, lines 611–645; IKLNDP24 Proposition 1.6, p.16, lines 2102–2168 | Leading term, first-part bounds and divisibility of the other coefficients by D match. Arbitrary coefficients belong to K, not F_p. |
| §2.12 strong Brown theorem | IKLNDP24 Theorem 1.11 and proof, p.25, lines 3333–3452 | All weights and all degree characters; the IND support and invertibility modulo D used by the proof agree. |
| §3.1 Anderson–Thakur polynomials | ND21 §4.2, p.17, lines 1015–1041; CHANG14 Theorem 5.5.1, p.18, lines 902–916 | The generating series and coefficient bound use H_n here = H_(n−1) there, and Γ_n is the factorial of n−1. |
| §3.7 MZ property | CHANG14 Definition 3.4.1 and Proposition 3.4.4, pp.8–9, lines 343–383 | Z≠0, dimension at least 2, determinant, prescribed last column, specialization and K-unit scale match. |
| §4.1 Frobenius systems | CCM23 §§4.2–4.3, pp.14–16, lines 644–751 | Prefix tree, leaves, root, substitution of θ and off-tree zero condition match; the polynomial model states the actual equation. |
| §4.2 monic descent | CCM23 Lemma 4.2.2 and proof, pp.14–15, lines 666–715; IKLNDP24 Lemma 3.3, pp.34–35, lines 3999–4008 | Descending coefficient comparison supports the stated monic positive-degree multiplier; degree zero is excluded. |
| §5.2 basis through weight q | ND21 Corollary C, p.4, lines 172–175 | Positive weights through q and entries strictly less than q match; weight zero is the singleton extension. |
| §5.10 alternating Hoffman basis | IKLNDP24 Theorem 3.6, p.36, lines 4070–4075 | Non-q-divisible parts, all unit character arrays and arbitrary weight match the family and coefficient field. |
| §5.13 direct bounds | IKLNDP24 Proposition 4.11, p.55, lines 6517 onward; IKLNDP-NOTE definition, p.3, lines 191–228, Propositions 1.3–1.4 and Theorem 1.6, pp.3–4, lines 233–264 | Adjacency condition and q=2 endpoint exception match. Spanning stops at 3q−3; independence reaches 3q−2. The endpoint is not asserted to be a basis. |

I also opened ABP04 Theorem 3.1.1, pp.7–8, lines 346–368 and Proposition 3.1.3, p.9, lines 409–428. The constant-term invertibility and special determinant hypotheses are distinct and are correctly retained. The empty-size extensions follow directly from determinant 1 and empty sums, not from an unstated positive-rank convention. The convergence counterexample in the table explains why the whole-tuple hypothesis in IKLNDP24 cannot supply a full triangular trivialization; the README correctly requires more for that conclusion.

### Duplication and supplier audit

I searched by object through the roadmap service's main/open-head index and the board packages, and read the relevant hits. The searches covered Carlitz, Anderson–Thakur, MZ property, Frobenius denominators, arithmetic entire coefficients and stuffle/ordered merges, rather than just the proposed declaration names. Generic inverse-Frobenius hits in isocrystal/perfectoid roadmaps have different carriers. The KloostermanSheavesAndBesselIsocrystals package's Carlitz exponential-sum identity is not this special-value construction. No second declaration in the target namespace was found: the namespace search returned only this folder.

The specialty object search in both pinned libraries found no Carlitz multiple-zeta, multiple-polylogarithm, MZ-property or Thakur theorem replacing the retained headlines. General objects are already supplied and are cited. This Part II owns the multiple-depth series, q-shuffle correction, degree-character refinements, relation reductions and the stated basis applications; it must return the fourteen foundation contracts to the owners in R01.

The citation resolver reported no unresolved cross-roadmap citation. I checked its leads against main or the supplied open heads rather than treating that output as a proof. Resolved ownership/supply includes:

| Roadmap and repository-relative location | Consumed section and check |
|---|---|
| `TauCetiRoadmap/RestrictedPowerSeries/README.md:193`, :207, :224, :247, :264, :306, :723 | §§0.1–0.3, 1.1–1.2, 2.1, 7.2: restricted norms, evaluation and entire series. The polynomial t can be evaluated at θ outside the unit ball because it is entire; a general radius-one series cannot. Arithmetic finite-coefficient-extension conditions are additional. |
| `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:1993`, :2018 | PS.9.1–9.4: real admissibility, rational stuffle with ordered-merge multiplicities, iterated integrals and convergent double shuffle. The characteristic-p integral specialization is a declared gap at PS.9.2, not supplied by a ring map from Q. |
| `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:1535` | RD.0.33: completed algebraic closure, including equal characteristic. This supplies the gap left by Mathlib's characteristic-zero dense-range theorem. |
| `TauCetiRoadmap/ReductiveGroupsPartII/README.md:5201` | RG2.3.7: Lang for smooth geometrically connected finite-type groups. GL₀ is trivial; for GL₁, b₀=−θ and u=ρ^q give u^(1/q)b₀/u=1. A disconnected constant group of order two has constant Lang map and fails surjectivity. |
| `TauCetiRoadmap/FunctionFieldArithmetic/README.md:438`, :553, :672, :803, :1004, :1717 | Layers 0–5 concern global fields/divisors/curve arithmetic. These are boundary-of-scope citations, not ownership of the Carlitz multiple-depth sums. |
| `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:1054` | Layers 0–3 and §2.7 own shtukas and the marked elliptic-sheaf comparison. They do not duplicate the analytic value spaces here. |

The main revision checked was 929496d; the roadmap service used its supplied 439-open-PR index. Open-head checks are ownership checks, not dependencies on revisions of existing roadmaps. All `Needs` lines were read. No new upward edge, cycle or undeclared prerequisite was identified beyond R01's disagreement with the declared allocation. DrinfeldModulesAndTModules was not available as a roadmap in these copies; that is not separately raised, because the fourteen named gaps are explicit contracts. Their formulas are precise mathematical interfaces; no additional anonymous supplier was introduced. The general restricted-series and Lang inputs are distinguished from the Carlitz-specific requested outputs. The integral stuffle gap extends the rational coefficient presentation rather than reconstructing ordered merges.

### Pinned declarations opened

Pins: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. The following **16 groups** were checked at those pins. These are concrete declaration/body checks, not claims about a newer library.

| File and line | What was checked |
|---|---|
| `Mathlib/Combinatorics/Enumerative/Composition.lean:101`, :146, :155, :161, :217, :1033 | Composition stores positive blocks with the prescribed sum; length, blocksFun, prefix sum and composition_card are native. Empty weight is allowed; real-MZV admissibility is absent. At weight 0 the cardinality formula gives 2^0=1 despite natural subtraction. |
| `Mathlib/Algebra/Polynomial/Degree/Defs.lean:59`, :454 | Monic means leading coefficient 1; Monic.ne_zero uses a nontrivial coefficient ring. |
| `Mathlib/FieldTheory/RatFunc/Defs.lean:67`, :145 | Native fraction-field wrapper and its totalized division; monicity and positive exponents exclude zero denominators in the actual sums. |
| `Mathlib/FieldTheory/RatFunc/Valuation.lean:51`, :81, :96, :103, :108, :138 | Native integer multiplicative valuation, X and X inverse, polynomial value and completion. Values are exp(1), exp(−1), not real q until normalized. Completion derives Field and the rational-function Algebra. |
| `Mathlib/Data/Finsupp/Single.lean:47`, :57, :92 | Single's body and evaluation; coefficient zero gives the zero finitely supported function. |
| `Mathlib/Topology/Algebra/InfiniteSum/Defs.lean:89`, :132 | HasSum and tsum use unconditional summation by default. A nonsummable function has totalized value 0; the definition alone does not assert separation or continuous addition. The actual completion is a separated complete field, and nonzero-value claims require the roadmap's convergence results. |
| `Mathlib/LinearAlgebra/Span/Defs.lean:46` | Span is the infimum of submodules containing the set, not the set itself or its nonzero elements. |
| `Mathlib/Algebra/Algebra/Operations.lean:214`, :222, :445 | Submodule product, mul_le and its span-of-products realization. |
| `Mathlib/LinearAlgebra/LinearIndependent/Defs.lean:98`; `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61` | Native independence and finrank, with their coefficient/module parameters. A finrank conclusion does not itself give independence of an arbitrary spanning list. |
| `Mathlib/FieldTheory/Finite/Basic.lean:266`, :290, :333 | card', sum_pow_units and frobeniusAlgHom. Over F₃ the unit-power sums for exponents 0,1,2 are 2,0,2. The Frobenius hom raises coefficients to q, not the polynomial variable. |
| `Mathlib/Algebra/Polynomial/Eval/Defs.lean:380`, :533 | comp and mapRingHom implement substitution and coefficient mapping, respectively. Thus t+θ twists to t+θ^q, not t^q+θ^q. |
| `Mathlib/Order/SupIndep.lean:328` | iSupIndep is disjointness from the supremum of the remaining family; coincident nonzero lines fail it. |
| `Mathlib/Analysis/Normed/Field/Dense.lean:45` | IsAlgClosed.of_denseRange requires CharZero, CompleteSpace and an ultrametric target; it cannot directly prove the equal-characteristic assertion. |
| `Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean:573`, :699, :828, :882 | spectralNorm_extends, uniqueness, normedField and normedAlgebra with the algebraic-extension, completeness and ultrametric hypotheses. |
| `TauCeti/RingTheory/PowerSeries/TateAlgebra.lean:76`, :80, :94, :105 | Gauss norm, coefficient bound, constant and variable norm. norm_X additionally needs NormOneClass; the native restricted-series carrier does not encode arithmetic coefficients or inverse twist. |
| `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:91`, :97, :798 | det_zero needs a nonempty index type; det_isEmpty and det_fin_zero give 1 in size zero. These facts belong in the README's Checks, not as new admitted headlines. |

### Adversarial table

There are **136 rows** below, covering every numbered target section, the fifteen sampled targets, all 23 admitted headline signatures and the objects touched by R01. Values were checked by explicit substitution or finite arithmetic. The analytic basis and independence claims are also compared with their source theorems; finite counts alone are not proofs of analytic rank.

Fresh exact arithmetic over F₂(θ), F₃(θ) and F₄(θ) verified all **27** small-exponent identities at degrees 0–2 and all **six** fundamental relations at degrees 0–1. It separately computed the displayed power-sum degrees, Chen correction examples, and composition/character counts through weight 3q−2. F₄ used a root of X²+X+1, not arithmetic modulo 4. Other rows are symbolic calculations; in particular the empty-matrix rows were checked from the pinned determinant declarations and empty function/sum definitions, not claimed as new Lean proofs. Here D=θ^q−θ, ℓ=−D and x=t−θ. “Keep” means this test does not refute the mathematical statement, and does not discharge R01.

| Statement | Instances tried | Values computed on the two sides / negative control | Result and change |
|---|---|---|---|
| Conventions: finite field, q versus p | F₄, part 2; q=1 | 4∤2, whereas 2 divides 2; a field of cardinality 1 would have 0=1 | Keep q, not the characteristic; q=1 and zero ring excluded |
| Conventions: sign of ℓ | q=3,d=1 | ℓ+D=0; ℓ−D=2ℓ≠0 | Keep sign |
| Conventions: twist versus power | t+θ, q=3 | Twist=t+θ³; cube=t³+θ³ | Keep coefficient twist |
| §0.0 products, recursion, norms | d=0,1,2; q=3 | ℓ₀=D₀=1; ℓ₂=(θ−θ³)(θ−θ⁹); deg ℓ₂=12; D₂=(θ³−θ)³(θ⁹−θ), degree18 | Keep; R01 ownership |
| §0.0 analytic field | θ and θ^(1/3) at q=3 | v(θ)=−1; v(θ^(1/3))=−1/3, impossible inside K∞ | Keep completed algebraic closure and embeddings; R01 |
| §0.0 exponential functional equation | coefficient z and z^q | e_C(θz): θ, θ^q/D; θe_C(z)+e_C(z)^q: θ, θ/D+1=θ^q/D | Keep; R01 |
| §0.0 logarithm inverse | coefficient z^q in e_C(log_C z) | ℓ⁻¹+D⁻¹=0; linear coefficient1 | Keep convergence restriction; R01 |
| §0.0 arithmetic entire ring | 1,t versus Σt^n | First two entire; coefficients of third have limsup nth root1, not0; its terms do not tend to0 at radius1 | Keep distinction E/T/formal series |
| §0.0 inverse twist domain | t+θ, q=3 | Inverse twist=t+θ^(1/3); coefficient valuation−1/3 versus integral K-valuations | Keep K̄ domain; R01 |
| §0.0 fixed rings/fields | t,1/t,t−θ | σ(t)=t; σ(1/t)=1/t; σ(t−θ)=t−θ^(1/q)≠t−θ | Polynomial fixed ring differs from rational fixed field; keep |
| §0.0 Omega and period | q=3, t=θ | Ω^(1)(θ)=−1/(Dπ̃); v(π̃)=−3/2; changing ρ to−ρ changes π̃ to−π̃, leaving π̃² | Keep; R01 |
| §0.0 effective motive | rank0; rank1 Φ=1 | det empty=1, cokernel0; σ-fixed rank-one basis gives an infinite K̄-dimension module but a K̄[σ]-span of that basis equal to its one-dimensional K̄-line | Do not infer finite σ-generation; keep broad effective definition |
| §0.0 t-module action/differential | d=0; Carlitz n=1,2 | Point exp/log unique; n=1 action θz+z^q; n=2 nilpotent differential part squares to0 and is nonzero | Keep |
| §0.0 torsion/regularity | Carlitz a=t | derivative of θX+X^q is θ≠0; degree q gives q distinct roots, rank1 over F_q; zero object has one point, rank0 | Keep |
| §0.0 quotient coordinate | σν−ν | Coordinate sum 1−1=0; aσν maps to a^q, rather than a | Keep semilinear quotient convention |
| §0.0 coproduct | N amalgamated with N over N | (x,y)↦x+y has relation (n,−n)↦0; quotient N, not N⊕N | Keep |
| §0.0 Yu subspace | Z=0 | exp(0)=0; minimal invariant subspace0=Lie(0) | Keep regularity/algebraic-point hypotheses |
| §0.0 entireness determinant | Φ=((x,0),(x,1)) | det Φ=x; det Φ(0)=−θ≠0 | Keep; R01 ownership |
| §0.0 ABP lift | Φ=I₂, ψ=(1,1), ρ=(1,−1) | ρψ(θ)=0; P=ρ gives Pψ=0 and P(θ)=ρ | Keep; R01 |
| §0.0 constant denominator | Φ₁=Φ₂=1; U=1/t | σ(U)=U=1/t, denominator t; U=1/(t−θ) gives unequal denominators t−θ^(1/q),t−θ | Keep; R01 |
| §0.0 fundamental matrix | Ψ=((Ω,0),(L,1)), C=((1,1),(0,1)) | (ΨC)₁₂=Ω; (CΨ)₁₂=1 | Keep right constant action; R01 |
| §0.1 weight/depth, empty index | (2,1,3),∅ | Sum6,length3; sum0,length0 | Native Composition excludes zero parts |
| §0.1 collapse | T₁(∅),T₃(1,2) | ∅,(3), respectively; no invented zero block | Keep |
| §0.1 prefix dominance | (1,2),(2,1); (1,3),(2,1,1) | Prefixes (1,3)≤(2,3), converse fails; (1,4,4) and (2,3,4) incomparable | Keep distinction from lexicographic order |
| §0.1 initial segment/admissibility | (q),(q,1),(q+1,1) | First is not 1-admissible; second is; Init of third=∅ | Keep terminal restriction |
| §0.2 exact and truncated empty sums | d=−1,0,1 | Exact empty values0,1,0; truncated empty values1,1,1 | Keep explicit convention; do not apply difference formula to empty index |
| §0.2 prefix product at d=0 | s=(1), tail=∅ | S₀(1)S_<0(∅)=1·1=1=S₀(1) | Empty truncation0 would give0≠1 |
| §0.2 positive-depth empty support | s=(1,1),d=0 | No tuple 0>d₂≥0; S₀(1,1)=0 | Keep |
| §0.2 powerSum_degree_descent | q=2,k=1,2,3; d=0,1,2 | Degrees (0,−2,−6), (0,−4,−12), (0,−4,−12), all strictly descending | Keep k>0; R01 ownership |
| §0.2 same theorem, odd field | q=3,k=1,2,3,4; d=0,1,2 | (0,−3,−12), (0,−6,−24), (0,−9,−36), (0,−6,−24) | Keep |
| §0.2 same theorem, nonprime q | q=4,k=1,…,5; d=0,1,2 | (0,−4,−20), (0,−8,−40), (0,−12,−60), (0,−16,−80), (0,−8,−40) | Keep full prime-power generality |
| §0.2 excluded exponent zero | d=0,1; k=0 | S₀(0)=1; S₁(0)=q=0 in F_q | Positivity prevents false nonvanishing and junk zero degree |
| §0.2 no-carry minimum | q=2,k=1,d=2 | Minimal (m₁,m₂)=(2,1), cost2+2=4; −dk−cost=−6 | Agrees with exact rational sum |
| §0.3 MZV convergence | q=3,index(1) | Degree0 term1; next term−1/D has degree−3; subsequent term degree−12 | Leading part1; first entry1 is allowed |
| §0.3 empty MZV / native tsum | weight0 | One empty tuple, product1, sum1 | No empty-sum0 convention |
| §0.4 degree characters | q=3,ε=−1,index1 | Degree1 contribution +1/D versus −1/D for ε=1; difference2/D has valuation3 | Keep ε^degree |
| §0.5 multipleZeta_ne_zero | q=3,index(1,1), any characters | Lowest degree tuple(1,0): −ε₁/D has valuation3; tuple(2,0) valuation12 | Unique leading term nonzero; keep |
| §0.6 ordinary CMPL vs degree-character series | depth1, γ^(q−1)=ε | γ^(q^d)=γ ε^d, so Li₁(γ)=γ Σ ε^d/ℓ_d | Keep root factor, not equality without γ |
| §0.6 domains | q=3,s=(2,2),u=(1,θ⁴) | Normalized exponents−3,+1; whole term exponent−3·3^i+3^j≤−8·3^j for i>j; tail exponent+3^j | Whole convergence does not license all tails |
| §0.7 multiplePolylog_ne_zero | unit coordinates; q=3,s=(1,1) | Lowest tuple norm3^−3; next tuple norm3^−12; a zero coordinate instead makes every term0 | Keep nonzero-coordinate, D′ hypotheses |
| §0.8 Carlitz identity | q=2,3,4; 1≤k≤q,d=0,1,2 | All 27 differences S_d(k)−ℓ_d^−k=0 | Keep range and R01 supplier |
| §0.8 range negative control | q=3,k=4,d=1 | S₁(4)=D^−4−D^−2; Si₁(4)=D^−4; difference−D^−2≠0 | No extension beyond q |
| §0.9 four weight spaces | weight0; zero combination | All spans K·1, dimension1; empty linear combination0 belongs to each | Keep native submodules, not sets of nonzero values |
| §0.10 Thakur versus IND | q=3,w=4 | T contains(3,1), not(4); IND contains(4), not(3,1); both cardinality6 | Keep bijection, not equality of index sets |
| §0.10 array block bijection | q=3,index4 with characterε | (4;ε) maps to (3,1;1,ε); total weight4 and total characterε on both sides | Keep character1 on inserted q-block |
| §0.11 Todd recurrence | q=3,w=5; q=2,w=4 | d₅=6+3+2=11; d₄=2+1=3 | Enumerated values11,3 |
| §0.11 weighted recurrences | q=3,w=5; q=4,w=5 | s₅=2(46+16)+6=130 versus t₅=2(48+16+6)=140; q=4 gives750 versus756 | Keep separate s and t |
| §0.11 small-entry counts | q=3,w=4; q=4,w=5 | c₄=5 versus d₄=6; c₅=13 versus d₅=14 | Keep c separate |
| §0.12 all counts | q=3,w=4 | (T,IND,small,AS,AT)=(6,6,5,46,48); all five defining counts reproduce these values | Keep |
| §0.12 zero counts | q=2,3,4,w=0 | Single empty composition, character count(q−1)^0=1; d=c=s=t=1 | Keep weight-zero extensions |
| §0.13 Carlitz evaluation | coefficient z^(q−1) | z/e_C(z) has coefficient−1/D; zeta generating expression has ζ_A(q−1)/π̃^(q−1)=−1/D | Sign agrees |
| §0.14 Eulerian obstruction | q=3,w=1,2 | v(π̃)=−3/2 not integral; v(π̃²)=−3 integral; nonzero K∞ constant-extension elements have integral valuations | Keep nonzero hypothesis and divisibility condition |
| §1.1 Δ coefficients | q=2,(a,b,j)=(1,2,1),(1,2,2); q=3,(2,2,2) | Coefficients1,0,1 respectively by the two binomial terms | Keep signs and support |
| §1.2 equal-degree product | q=3,d=1,a=b=2 | S₁(2)²=D^−4; S₁(4)+S₁(2,2)=(D^−4−D^−2)+D^−2=D^−4 | Extra q-shuffle term essential |
| §1.3 integral stuffle | [1]*[1] | Over Z:2[1,1]+[2]; over F₂:[2]; over F₃:2[1,1]+[2] | Coefficient extension correct; R01 ownership |
| §1.3 free carrier/unit | [∅]*[1], zero coefficient | [1] on both sides; Finsupp.single s 0=0 with empty support | Keep native carrier |
| §1.4 realisations | ∅; q=3,d=1,[2,2] | Infinite empty value1; finite degree value D^−2, equal to S₁(2)S₀(2) | Keep exact-degree convention |
| §1.5 truncated product | q=3,cutoff1,[1]*[1] | L_<1(1)²=1; L_<1(2)+2L_<1(1,1)=1+0=1 | Keep |
| §1.6 controlled product support | q=3,S₁(2)S₁(2) | Supports(4),(2,2), depths1,2≤2 and weight4; values sum D^−4 | Matches corrected induction |
| §1.7 zeta_space_mul_le | weights0 and0; nonempty indices(1),(1) | (K·1)(K·1)=K·1; stuffle terms have weights2,2 and total weight1+1=2 | Keep both ordinary and alternating algebra statements |
| §1.8 period powers | q=3,m=1,2 | π̃²=−Dζ_A(2); π̃⁴=D²ζ_A(2)², weights2,4 | Keep nonzero D and multiplication input |
| §2.1 binary relation vs total relation | ([∅],−[∅]), d=−1,0 | Degree residuals−1,+1 despite total realization1−1=0 | Excludes false converse |
| §2.2 fundamental relation | q=2,3,4; d=0,1 | S_d(q)+D S_(d+1)(1,q−1)=0 in all six exact rational computations | Keep; character version needs ε⁻¹ |
| §2.3 B* fixed part | q=2,d=1,R₁,head2 | B* fixed part0, C_(1,1) fixed partD^−3, desired S₁(2,2)=D^−2; 0−D·D^−3=D^−2 | Keep shifted coefficient b=D |
| §2.3 wrong BC coefficient | same test, coefficient1 | 0−D^−3=D^−3≠D^−2 | Negative control discriminates |
| §2.3 empty/head domains | C_∅, B*_∅, B*_0 | First two preserve R; head0 is not a positive index and has no operator | Keep |
| §2.4 C leading term | q=3,W=(1),d=0 | S₀(4)=1; shifted D S₁(1,3)=D·(−D^−1)=−1; other terms0 | Residual0 |
| §2.5 reduction | q=2,s=(3) | Two copies of ζ(2,1) and ζ(1,1,1) have coefficients2=0; remaining equation ζ(3)=Dζ(1,2) | Keep correction term before reducing coefficients |
| §2.6 admissible reduction | q=3,s=(3),k=1 | Output(1,2), first part1<3 and depth2≥1; prefix sums (1,3)≤(3,3), total weights3=3 | Keep depth and dominance bounds |
| §2.7 brown_spanning | q=2,w=2; w=0 | ζ(2)=Dζ(1,1); Thakur index count1; empty spanK·1 | Nonzero D gives the tested span equality |
| §2.7 alternating_brown_spanning | q=2,w=2 | F₂ units={1}; ordinary and alternating test both span Kζ(1,1) | Keep general theorem; no stronger inference from this special case |
| §2.8 value_space_bridges | q=3,w=2 | Both compositions(2),(1,1) have parts≤q, so each S/Si difference0; spans coincide term by term | Keep |
| §2.9 rewriting U | q=2 | U(3)=D[1,2]; U²(3)=D²([1,1,1]+[2,1]); both latter indices Thakur | Keep coefficients and direction |
| §2.9 fixed target family | q=3,(3,1) | U([3,1])=[3,1], whereas excluded singleton(3) maps to−D[1,2] | Nontrivial rewriting distinguished from identity |
| §2.10 termination | q=2,weight3 | Initial support{(3)}; after two steps support{(1,1,1),(2,1)}, both admissible | Keep finite homogeneous iteration |
| §2.11 IND generation | q=3,w=2 | IND₂={(2),(1,1)}, and both realizations agree termwise by §0.8 | Tested span equals Z₂ |
| §2.12 strong_brown_spanning | q=2,w=2 | IND₂={(1,1)}; Li(2)=D Li(1,1); dimension of this span1 | Keep nonzero coefficient |
| §2.13 special relation | q=2 | ζ(3)+Dζ(1,2)=0, same as §2.5 since −1=1 | Cross-layer signs agree |
| §3.1 factorial/generating definition | q=3,n=1,3,4,5 | Γ₁=Γ₃=1; Γ₄=Γ₅=D; H₁=H₃=1, H₄=2t³−t−θ³, H₅=θ³−t | Keep shifted n−1 indexing |
| §3.1 degree bound | q=3,n=5 | degθ H₅=3≤(5−1)3/2=6<15/2 | Keep bound, not equality |
| §3.2 generating series | d=0; q=3,d=1 | d=0 gives(1−x)^−1; d=1 gives(ℓ+x³−x)^−1; coefficient x³ is ℓ^−4−ℓ^−2=S₁(4) | Keep; R01 ownership |
| §3.2 interpolation | n=1,d=0,1 | Ω(θ)=π̃^−1; Ω^(1)(θ)=π̃^−1ℓ^−1=Γ₁S₁(1)/π̃ | Keep sign |
| §3.3 twist recursion | depth1,Q=1 | L(1)^(−1)−L(1)=xΩ; lower-row matrix product gives xΩ too | Keep inverse direction |
| §3.3 termwise bound | q=3,s=2,Q=1 versus Q=θ³ | Normalized norms3^−3<1 versus1; latter fails strict termwise bound | Keep strict inequality |
| §3.4 entire first column | q=3,s=(2,2),Q=(1,θ⁴) | Whole exponents≤−8·3^j→−∞, prefix exponent−3·3^i→−∞, tail exponent+3^j→+∞ | Keep prefix-only conclusion under weaker bound |
| §3.5 Frobenius specialisation | q=2,s=(1),Q=1,j=0,1 | L(θ)=−1/D; L(θ²)=1/D²=(−1/D)² | Keep |
| §3.5 zero/empty specialisation | Q has a zero coordinate; empty tuple | Series values0 and0^q=0; empty values1 and1^q=1 | No unsupported nonvanishing |
| §3.6 matrix, determinant | s=(2,1); depth0 | Diagonal x³,x,1 gives det x⁴, not x³; empty index Φ=(1),det1 | Keep tail weights and zero case |
| §3.6 full Ψ convergence | same Q=(1,θ⁴) example | Tail entry terms have norms3^(3^j), not tending to0 | Excluded by termwise hypothesis; source correction retained |
| §3.7 MZ property | Li(1), zero candidate | Φ=((x,0),(x,1)), ψ=(Ω,L); first valueπ̃^−1 and lastLi(1)/π̃; zero candidate violates Z≠0 | Keep nonzero definition |
| §3.7 scaling/products | aZ and Z₁Z₂ | Replacing c by c/a leaves cZ unchanged; tensor first coordinateπ̃^−w₁π̃^−w₂=π̃^−(w₁+w₂) | Keep K-unit coefficient restriction |
| §3.8 normalized general Q-values | Q=1; q=3,γ²=−1 | π̃ L(1;1)(θ)=Li(1); character version introduces γ, with γ²=−1 versus 1²=1 | Do not drop algebraic root factor for nontrivial character |
| §3.9 grading / zeta_algebra_graded | normalized Euler ratio, q=3 | ζ(2)/π̃²=−1/D∈K; its K̄-line equals the line of1, intersection dimension1 rather than0 | Excludes extending grading to normalized ratios; native statement uses MZVs |
| §3.9 scalar extension | w=0 in any compatible E | algebraMap(1)=1≠0; span over K̄ is K̄·1, dimension1 | Both K-scalar towers retained |
| §3.10 merged prefixes | no pairs; (1,2),(3) with Q=1 | I={∅}, size1 in empty case; I={∅,(1)}, size2 in second case; Φ-empty block diag(x^w,1),det x^w | Root retained |
| §3.10 polynomial-decorated prefixes | same index prefix with unequal Q | Distinct decorated prefixes remain distinct; example gives four nodes instead of wrongly merging to three | Keep pair-based prefix carrier |
| §3.11 ABP criterion/gauge | n=0 | Construction gives f=0, ψ̃=(1,Ω^w,0); LD would require both a=0 and a≠0 | No admissible relation in this case; keep nontriviality hypothesis |
| §3.12 Eulerian suffix | q=3,s=(1,2) isolated suffix2; q=2 arbitrary | Suffix weight2 divisible by2; q=2 modulus1 divides every weight | Keep positive/nonzero numerator qualification |
| §4.1 reducedPrefixes | q=3,w=2; w=0 | Reduced tree{∅,(2)}; weight0 tree{∅}; off-tree coordinate forced0 | Support condition excludes extra unconstrained coordinates |
| §4.1 residual / solution-space definition | q=3,w=2: f∅=t³−θ, f₂=t−t³ | Left substitution=t³−θ³; right=(t−θ)(t−θ)²=t³−θ³ | Residual0 in native θ-polynomial carrier |
| §4.2 monic descent | degree0 excluded; q=2,α²+α+1=0 | α²=α+1 permits α∉F₂; monic multiplier of positive degree is absent | Keeps positive degree needed for descent |
| §4.3 degree bound | previous q=3,w=2 solution | degθ f∅=1≤2/(3−1)=1; leaf degree0 | Sharp test |
| §4.4 key lemma / leaf substitution | q=3,M={(2)}, P=−D[2] | Li_P=π̃²; leaf a(θ)=θ−θ³ becomes t−t³; root t³−θ solves both rows | Keeps θ↦t, not original coefficient |
| §4.4 zero/empty-weight case | w=0,M={∅},P=a[∅] | Li_P=a∈K·1; solution coordinate a(t), fixed under θ-substitution | Keep weight-zero extension |
| §4.5 frobenius_solution_dimension | w=0; q=3,w=1,2 | Weight0 solutions constant in θ, dimension1; weight1 root degree≤1/2 forces0; weight2 displayed nonzero line | Predicted dimensions1,0,1 agree |
| §4.5 matrix size | q=3,ℓ=7,m=2 | 2ℓ−m=12; source's stray 2(ℓ−m)=10 | Keep corrected size |
| §4.6 twisted_system_rigidity | q=3,w=2,untwisted γ=1 | δ∅=t³−θ³,δ₂=t−t³ gives residual0; changing root factor yields (1−γ)(t−t³)(t−θ³)² | Nontrivial-character negative control is nonzero |
| §4.6 excluded weight0 | w=0,nontrivial ε | Constant root coordinate1 solves the equation because no child term occurs; asserted vanishing would give1=0 | Native hw>0 is essential |
| §4.7 two_row_rigidity | q=3,k=2,a=1 | δ₁=(t−θ)^6, a₁=t³−t, δ₂=a₂=0; forward equation both sides(t−θ³)^6 | Keep Eulerian line; not universal zero |
| §4.7 other endpoint | q=3,k=3 | Remaining equation(f+a₁)θ³−ft³−a₁t=0 gives a₁=−f and f(t³−t)=0, hence f=a₁=0 | Keep k=q in zero branch |
| §5.1 small_entry_independent | q=2,w=1 and0 | Index families{(1)} and{∅}; leading coefficients1 and1, so each singleton is independent | Correct boundary instantiations of deep theorem |
| §5.2 small-entry basis | q=3,w=2 and4 | At2 all2 compositions have entries<3; at4 small count5 versus Todd count6 | Keep basis range≤q |
| §5.3 q_indivisible_independent | q=3,w=4; q=4,part2 | Candidate count6 at upper bound4; q=4 keeps part2 since4∤2 | Correct family/range; counts alone not a proof of independence |
| §5.4 small-weight Thakur basis | q=3,w=4 | Six listed T-indices, versus six IND-indices; swap(4)↔(3,1) in the combinatorial bijection | Cardinality and range consistent |
| §5.5 cmpl_ind_basis | w=0; q=2,w=1 | Single values1 and Li(1) with leading coefficient1; span dimensions1,1 | Basis tests pass; general theorem matches CCM23 |
| §5.6 thakur_basis | w=0; q=2,w=2 | Single empty value1; ζ(2)=Dζ(1,1), with D≠0 and ζ(1,1)≠0 | Both tested spans dimension1 |
| §5.6 todd_dimension | q=2,w=0,1,2; q=3,w=5 count | Dimensions1,1,1 in singleton cases; defining d(5)=11 by enumeration and6+3+2 | Keeps natural cardinality definition |
| §5.6 thakur_basis_algebraicClosure | w=0, arbitrary compatible E | Empty value maps to1, independent over K̄; both spans K̄·1 | No lost scalar-tower binder |
| §5.7 relation kernel | q=2,w=1,2,3 | Ambient dimensions1,2,4; basis counts1,1,2; kernel dimensions0,1,2; weight3 displayed relations have pivots(1,2),(3) | Correct kernel, not entire free space |
| §5.8 character_roots_independent | q=3, roots1,i with i²=−1 | 1²=1,i²=2; X²+1 has values1,2,2 on F₃, so no root; rank{1,i}=2 over constant Laurent series | Keep distinct characters |
| §5.8 splitting by total character | q=3, coefficients a,b∈K∞ | a+bi=0 gives a=b=0 by the basis1,i; same-character roots differ by an F₃-unit | Group by total character, not individual chosen roots |
| §5.9 normalized period relations | q=3,w=2 | L(2)(θ)=−1/D, so 1+D L(2)(θ)=0; constant coefficient1 | Eulerian relation has nonzero constant and trivial character |
| §5.10 alternating_hoffman_basis | q=2,w=0,1 | F₂ units={1}; AS has one value1 or Li(1), each nonzero | Singleton tests pass |
| §5.11 alternating_dimension | q=2,w=0,1,2; q=3,w=4 count | Singleton dimensions1,1,1; q=3 weighted IND count46, versus Thakur-array spanning count48 | Does not identify spanning size with dimension |
| §5.12 ordinary lower bound | q=3,w=4 | IND count6 equals d(4)=6, while small-entry count5 | Keeps stronger IND family |
| §5.13 directIndices / spanning | q=3,w=4 | Six indices, 46 permitted arrays; unrestricted compositions give54 arrays | Correct restricted carrier |
| §5.13 adjacency control | q=3,w=5,6 | (2,3) admitted and(5) excluded; at6 (2,3,1),(1,2,3) admitted,(3,2,1) excluded; counts130,368 | Adjacency matters |
| §5.13 direct_small_weight_independent | q=3,w=7 | 37 indices,1040 arrays; s(7)=1042; (4,3),(2,5) admitted,(7),(2,2,3) excluded | Endpoint independence does not assert a basis |
| §5.13 q=2 endpoint | q=2,w=4 | Family{(2,1,1),(1,2,1),(1,3)} has3 values; naive preceding-rule family obeys the displayed nonzero relation | Keep special endpoint |
| §5.13 zero-weight signatures | w=0 | One empty array, value1, independent and spanning K | Both native signatures agree |
| §5.14 finite-place dimension bound | q=3,w=1,2,3,4; q=2,w=1,2,3 | d(w)−d(w−q+1)=(1,1,2,4); q=2 gives(0,0,1) | Arithmetic checks pass; negative weights interpreted as0 |
| §5.14 specialisation/kernel | any v, w=q−1 | ζ_A(q−1) maps to0; multiplication by its nonzero infinity-adic value embeds Z₀ of dimension1 | No good-v exclusion; R01 ownership |
| §0.0 positive-size zero Check, README:208 | ℓ=1,2 over F₃[t]; general positive ℓ | det(0₁)=0 and det(0₂)=0; evaluation at 0 is 0. Allowed c(t−θ)^m is nonzero, so cannot equal 0 | Repaired negative control; positive-size restriction is essential |
| §0.0 empty determinant and both hypotheses, README:209 | ℓ=0, c=1, m=0 over F₃[t] | det(0₀)=1=1·(t−θ)^0; evaluation at 0 is 1≠0 | Both determinant hypotheses hold |
| §0.0 empty solution, lift and pairing, README:209 | ℓ=0, unique empty ψ, ρ and P | σψ=()=Φψ; number of coordinates outside E is 0; P(θ)=()=ρ; Pψ=Σ over ∅=0; number of lifts is 1 | New positive control correct, including uniqueness |
| §0.0 determinant implication, README:208 | c=1, m=0,1,2 in F₃(θ)[t] | Evaluation of (t−θ)^m at 0 gives 1, −θ, θ², equal to (−θ)^m; all nonzero | Implication retains m=0 and needs no positive rank |

## Not verifiable

- None of the fifteen sampled source texts was inaccessible: all were read from the supplied legal cache. All twenty recorded source extractions are available; no source fetch, manifest edit or missing-reference request was needed. This does not claim that every page of those twenty works was read.
- The 23 headline theorems remain admitted. Elaboration, finite tests and source comparison do not constitute formal proofs of them.
- Future delivery of the fourteen supplier contracts is not certified. Their absence from today's supplier is not a separate finding; R01 is the conflicting ownership and missing required README declarations.

## Source issues

These source defects are corrected or avoided in the roadmap; they are not additional roadmap findings.

- **Misprint** in CCM23 at §2.2, printed p.7, line 329: the source says the depth-one polylogarithm denominator has exponent d; it should be exponent s; affects a stated result.
- **Misprint** in CCM23 at (2.3.2), printed p.9, line 421: the source says the divisibility condition uses k although the coefficient is indexed by j; it should be (q−1) divides j; affects a stated result.
- **Error** in CCM23 at identities after Definition 2.2.2, printed p.8, line 378: the source says the prepend identity applies at every cutoff with its empty-index convention; it should be restricted or use empty truncation one, since cutoff zero gives 0 versus 1; affects a stated result.
- **Misprint** in CCM23 at proof of Theorem 4.3.5, printed p.18, line 934: the source says the square matrix size is 2(ℓ−m); it should be 2ℓ−m, giving 12 rather than 10 when ℓ=7 and m=2; affects the proof.
- **Misprint** in ND21 at §2.2, printed p.9, line 477: the source says a sum indexed by j uses R(d); it should be R(j); affects the proof.
- **Misprint** in ND21 at §2.2 before Proposition 2.8, printed p.10, line 599: the source says the expanded relation coefficients lie in F_p for arbitrary input coefficients in K; it should be K, as the coefficient D in C_(1)(R₁) demonstrates; affects the proof.
- **Misprint** in CPY19 at Proposition 2.2.1, printed p.6, line 248: the source says the localized morphism matrix has polynomial entries; it should be rational-function entries, allowing the scalar 1/t; affects a stated result.
- **Error** in THAKUR10 at proof of Theorem 3, fourth display, printed p.1979: the source says the displayed induction controls the required products; it should be simultaneous induction controlling mixed-degree and equal-degree products; affects the proof.
- **Error** in IKLNDP24 at §2.2.1, printed pp.27–28, lines 3505 and 3550–3567: the source says whole-tuple decay puts the full triangular trivialization in GL(T); it should be decay for every consecutive subtuple, or the stronger termwise bound; affects a stated result.
