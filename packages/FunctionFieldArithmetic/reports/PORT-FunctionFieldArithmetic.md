# FunctionFieldArithmetic port report

Branch: `roadmap/function-field-arithmetic`  
Head commit: `42f4779177aa04bd0f5e8021422ccbc07b4b1c59`

The clean checkout was verified at `0a7ca14` before creating the branch. Only
`TauCetiRoadmap/FunctionFieldArithmetic/README.md`,
`TauCetiRoadmap/FunctionFieldArithmetic/Suggested.lean` and
`TauCetiRoadmap/FunctionFieldArithmetic/metadata.toml` enter the commit. The source package,
source manifest, accepted review and other roadmaps were treated as read-only data.

## Validation

Command: `lake build TauCetiRoadmap.FunctionFieldArithmetic.Suggested`.

Exact outcome: `Build completed successfully (9028 jobs).`

Warnings: **11**, all “declaration uses `sorry`”; zero errors and zero other warnings.
The module has 18 named declarations: 11 admitted headline theorems and seven definitions or
abbreviations with real bodies. It has no examples, admitted data, options or additional imports.
The single Tau Ceti import exists at its pin and is needed for the divisor class number.

Gate summary: `gate FunctionFieldArithmetic: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`

The precommit gate accepted every content check and reported only the uncommitted folder
(`dirty=1` initially, then `dirty=3` for the staged additions). The same required command was rerun against the committed, clean tree; its final
summary is recorded above. No files outside the target folder enter the repository diff.

The complete final dependency-check output, with the supplied order and `--movable`, is:

```text
depcheck: 33 roadmaps, 301 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. LubinTateFormalModulesAndQuasiCanonicalLifts occurs
before this roadmap in the supplied order (positions 57 and 171). No notion moved from a later
roadmap, and no order file was changed.

Citation resolution found no cross-roadmap citation or Lean name found nowhere. Its external
pinned-package lookup was unavailable, so that result is not evidence about library declarations;
the library checks below used the actual pinned checkouts directly.

## Draft pull request body

This roadmap develops the arithmetic of function fields over finite exact constant fields, building on AlgebraicCurves. It constructs reduced bases of Riemann–Roch spaces, adelic divisor-lattice Fourier theory, Artin–Schreier–Witt theory and equal-characteristic local existence, generalized ray geometry, divisor zeta functions and their class-number formulas, integral automorphic cusp modules, and unitary Siegel–Eisenstein coefficients. These interfaces supply the arithmetic and automorphic foundations for function-field Langlands and higher Siegel–Weil applications, with arbitrary finite moduli, enlarged constant fields and ramified inducing data included.

AI assistance: Codex (GPT-6).

## Dependencies still in pull requests

The new-roadmap suppliers in the supplied open-head index are:

- ArithmeticGaloisDuality
- ArithmeticGaloisRepresentations
- AutomorphicLFunctionsAndLocalFactors
- AutomorphicSpectralTheory
- DeligneWeightsAndPurity
- WeilConjectures
- RelativeJacobiansAndIntegralCurveModels
- ReductiveGroupsPartII
- SmoothRepresentationsOfLocalGroups
- AdelicAlgebraicGroups
- GeometryOfNumbersAndQuadraticArithmetic
- MetaplecticAutomorphicForms

LubinTateFormalModulesAndQuasiCanonicalLifts is an additional explicitly allowed earlier
supplier. Its text is available as `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/design/README.md`,
not as an indexed open roadmap folder. Its generic LT.0 contracts and mixed-characteristic
LT.1–LT.2 scope were checked there. This distinction should be retained when the worker records
dependencies. Existing-roadmap revision/progress requests were not used as suppliers in place
of main.

## Accepted decisions, Lean placement and supplier replacements

The accepted package's eleven headlines and seven supporting definitions are preserved byte for
byte in `Suggested.lean`. Nothing moved from that file to the README during this port, and no
headline was deleted. The previously removed concrete polynomial examples remain README Checks;
no API lemmas, value computations, placeholders or ad hoc missing carriers were added to Lean.
The module docstring still identifies every unstatable headline and its missing construction.

The accepted boundaries are retained: ArithmeticGaloisDuality supplies ideles, global formations
and finite Artin maps; AutomorphicLFunctionsAndLocalFactors AL.3 supplies the completion-valued
adeles, residue character, Poisson theory and finite-field rank-one ray/Picard/Lang dictionary;
RelativeJacobiansAndIntegralCurveModels supplies finite-flat rigidification and its smooth
algebraic space; the perfect-field scheme structure/universal property and finite-abelian-group
extensions remain here. The supplied degree-Chebotarev asymptotic, scheme curve numerator,
Jacobian root bound, inert characteristic-not-two densities and complex GL_n spaces also retain
their owners. Every earlier nonblocking finding summarized in the repair reports remains
addressed, including numbering, induction normalization, characteristic-two trace duality,
zero-vector exclusion and the disconnected fixed-centre character group.

Two additional redundant targets were deleted from §0.1 and recorded only in Scope and ownership:
the native divisor-degree/product-formula restatement, and the chosen-generator/intrinsic
function-field comparison already assigned to AlgebraicCurves Layer 0. The remaining comparison
was renumbered and its use in §0.2 repaired. The mathematical facts are still available through
the conventions and exact supplier contracts.

The board object sweep also found LT.0's generic formal-homomorphism, formal-module and adic-point
carriers, and LT.1–LT.2's mixed-characteristic construction. The README now consumes those by name
and section, and §4.1 owns their equal-characteristic extension. This removes overlap without
restricting the complete local theory to a preferred residue characteristic or a prime-to-p
subclass. No Lean import from that roadmap is made.

## Reviewer read-through fixes

1. The local-density section used `q`, `π` and `η(π)` without explicitly resetting their local
   meanings. It now specifies `q=#κ(F_v)≥2`, a uniformizer and the split/inert signs. The same local
   `q` convention is explicit in §7.5.
2. The overlattice sum used `t′(L′)` after defining `t′` only for torsion modules. It now defines
   `t′(L)=t′(L^∨/L)` and explicitly requires integral nondegenerate lattices and finite-length torsion modules. The negative control
   with Gram element `π^(−1)` remains excluded.
3. The total counting definitions and polynomial-data predicate have wider domains than their
   arithmetic interpretation. The README now distinguishes `pointCount 0=0` from `A_0=1`, keeps
   independent universes, states `q−1≠0`, and treats reciprocal formulas as rational-function or
   Laurent-polynomial identities. The q=0,1 polynomial controls are explicit. In the added API,
   the coefficient at degree 2g is q^g; exact degree requires q>0. This avoids calling that
   coefficient the leading coefficient when q=0.
4. The finite-ray construction's modulus API explicitly assumes factorization through the smaller
   ray quotient before comparing covers. This keeps the positive-multiplicity distinction in
   the least-conductor theorem.
5. Exact supplier contracts now have one subsection per supplier. Inline API lists became prose
   bullet lists, retaining their hypotheses and conclusions; the existing Checks, source locators,
   examples and layers remain. Auxiliary density invariants, polynomial data and Frobenius counts
   have explicit API bullets. A duplicated word in the constant-term subgroup description was fixed.
6. The two degree duplications and the Lubin–Tate ownership boundary were resolved as above.
7. The normalized absolute-value formula was unqualified at zero: the pinned total additive
   order gives 0 there, hence its exponential would give 1 rather than the actual absolute value
   0. The formula now requires x≠0, with absolute value zero stated separately and a negative
   Check. The chart-intersection proof likewise separates zero, and the reduced-basis degree
   comparison explicitly uses polynomial degree zero equal to minus infinity. K=F in the adelic
   layer and the local F,F′ notation in the density layer are explicit.
8. The flat base-change proof asserted finitely many distinct coefficient rows on finite
   support. Finite support gives a finite free dual; Noetherianity makes the row submodule
   finitely generated, which is the correct finite-equation argument. The rows 2,4,8,… over
   Z[1/3] are infinitely distinct but generate the row 2. Three explicit base-change Checks
   record this and the nonflat reduction control. The adelic restricted-product comparison
   explicitly uses a group scheme model, so its integral-point factors are subgroups.

9. The rationality proof now evaluates the numerator only after rational cancellation, rather
   than suggesting an evaluation of the divergent formal series at T=1. For P¹ the canceled
   numerator is 1 at T=1, while Z has a pole there. This makes the existing rational-function
   convention explicit in the proof.

No accepted end theorem changed. The absolute-value formula and chart proof required a
nonzero qualification, as recorded below. The source
corrections concerning Parshin, Kosters–Wan, Yu and Feng–Yun–Zhang were retained, with their
negative controls. Computation rows below distinguish these checks from a proof of the targets.

## Signature audit

One scratch file imported the built module and contained `#check @name` for all 18 declarations.
It elaborated successfully, and each expanded type was compared with its README statement.
No section binder was lost and no Lean signature changed.

| Declarations | Elaborated hypotheses and comparison |
| --- | --- |
| exists_divisor_degree_eq_one | Field/algebra instances, Finite k, explicit IsFunctionField and exact constants; conclusion is a divisor, not a rational place. |
| riemannRoch_reducedBasis | Compatible RatFunc algebra/scalar tower, finite dimension, explicit hF, D, unit x and its equality to RatFunc.X; no finiteness/exactness/separability restriction on k; one basis precedes every integer r. |
| artinSchreierWitt; aswQuotient | Prime p, Field F and CharP F p survive explicitly; all lengths, including zero. |
| witt_additiveHilbert90 | Both characteristic-p fields, F-algebra L, finite dimension, Galoisness and cyclic generator survive; operations use truncated Witt addition. |
| artinSchreierWitt_galois | Prime p and characteristic-p field, arbitrary n; actual continuous characters of the absolute Galois group. |
| localAbelianExistence_laurentSeries | Finite field k, open subgroup H with H.FiniteIndex; unique finite Galois abelian intermediate field, norm subgroup and degree=index. |
| effectiveDivisorCount; zeta; placeCount; pointCount | Only fields and algebra are required by their real total bodies; finiteness and arithmetic hypotheses are on the theorems, with index-zero behavior documented. |
| zeta_eulerProduct; zeta_logDeriv | Finite exact constants and explicit function-field hypothesis; r>0 on the coefficient identity; coefficientwise product topology. |
| effectiveDivisorCount_of_large | Same arithmetic hypotheses; 2g≤n+1 explicitly, cleared denominator and nontruncated exponent. |
| zeta_rationality | Same arithmetic hypotheses; exact degree 2g, reciprocal symmetry, linear coefficient and class number all match. |
| IsLPolynomialData; IsLPolynomialData.unique | Arbitrary natural q,g and integer count sequence, integer polynomial; q=0,1 controls included without imposing finite-field assumptions. |
| lPolynomial_isLPolynomialData | Finite exact constants, explicit function-field hypothesis and actual zeta-numerator equality tie P to the construction. |

## Supplier and duplication evidence

Main is `0a7ca14`. The actual dependency checkouts match the manifest: Mathlib
`6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Supplier sources below are the repository-relative
README paths for the named roadmap, at main or at the supplied indexed head. Line references to
head views include the tool's single provenance-header line. The design source is identified
separately.

| Source id | Exact contract anchors inspected |
| --- | --- |
| algebraic_curves | `TauCetiRoadmap/AlgebraicCurves/README.md`; algebraic_curves line 367 (intrinsic predicate/comparison), Layers 2–12 for charts, divisors, expansions and model dictionary. |
| arithmetic_duality | `TauCetiRoadmap/ArithmeticGaloisDuality/README.md`; arithmetic_duality line 1990 (§R02.3.2), line 2007 (degree surjectivity), line 2134 (global class formation). |
| automorphic_factors | `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md`; automorphic_factors line 262 (complex GL_n realization), line 2421 (unramified reciprocity), line 2437 (positive-modulus reciprocity), line 2713 (spherical Whittaker normalization). |
| relative_jacobians | `TauCetiRoadmap/RelativeJacobiansAndIntegralCurveModels/README.md`; relative_jacobians line 270 (rigidificator and O→L direction), line 294 (algebraic space), line 315 (universal family). |
| arithmetic_representations | `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md`; arithmetic_representations line 1085 (§1.8), line 1836 (§2.5), line 2742 (§3.7), line 3452 (§5.13). |
| deligne_weights | `TauCetiRoadmap/DeligneWeightsAndPurity/README.md`; deligne_weights line 1229 (§1.6), line 1266 (§1.9), line 1551 (degree Chebotarev). |
| weil_conjectures | `TauCetiRoadmap/WeilConjectures/README.md`; weil_conjectures line 519 (curve numerator), line 895 (extension recurrence). |
| scheme_foundations | `TauCetiRoadmap/SchemeAndStackFoundations/README.md`; scheme_foundations line 2071 (descent), line 3656 (Hilbert 90), line 3896 (Tsen), line 4713 (curve duality), line 4905 (Picard torsors), line 4958 (high-degree Abel), line 7273 (Weil bound). |
| jacobian; modular_curves | `TauCetiRoadmap/JacobianChallenge/README.md` Layers A–D; `TauCetiRoadmap/ModularCurves/README.md` Layer 0E. |
| class_field; ramification | `TauCetiRoadmap/ClassFieldTheory/README.md` Layers 4–8, including its equal-characteristic exclusions; `TauCetiRoadmap/LocalFieldsRamification/README.md` Layer 3. Main, not a revision request, was used. |
| lubin_tate | `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/design/README.md`; lubin_tate line 5 (mixed-characteristic scope), line 76 (formal homs), line 110 (formal modules), line 146 (adic points), line 238 (LT.1), line 350 (LT.2). |
| spectral_theory | `TauCetiRoadmap/AutomorphicSpectralTheory/README.md`; spectral_theory line 1102 (full fixed-centre group), §§1.12–1.13, 2.15–2.16, 4.11–4.17 (normalizations/discrete data). |
| reductive_groups | `TauCetiRoadmap/ReductiveGroupsPartII/README.md`; reductive_groups line 438 (point topology), line 944 (restriction of scalars), line 5202 (Lang), line 5510 (decompositions). |
| smooth_representations | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md`; smooth_representations line 1834, line 1963, line 2123 (induction/Whittaker); line 3084, line 3352 (Satake/unitary groups). |
| adelic_groups | `TauCetiRoadmap/AdelicAlgebraicGroups/README.md`; adelic_groups line 37 and line 551 (countable second-countable Haar scope); Layer 1 is for number fields. |
| hermitian_densities | `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md`; hermitian_densities line 1132 and line 1308 (inert characteristic-not-two scope, dyadic allowed). |
| etale_cohomology | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md`; etale_cohomology line 613 (compact supports), line 730 (perfectness), line 940 (finite Frobenius), §F.10.3 (finite-projective traces/determinants), §0.11 (curve duality). |
| determinant_lines | `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md`; determinant_lines line 3172 and line 3247 (detLine and its compatibility maps). |
| metaplectic_forms | `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md`; metaplectic_forms line 272 (local characteristic-not-two Schrödinger scope), line 1554 (Siegel–Weil section). |

Object searches used `roadmaps grep` across all indexed open heads and every main roadmap,
then board-package searches and the 32 specifically supplied sibling folders. Objects searched
included polynomial reduced bases, divisor zeta series, completed adelic lattices, rigidified
Picard spaces, Lang/ray covers, Witt additive trace and ASW quotients, Lubin–Tate modules,
Hermitian densities and unitary Eisenstein coefficients. The six keyword hits in the named
sibling folders concern other objects (Dirichlet divisor series, complex value distribution,
K3 separation), or Bessel/boundary uses of Eisenstein theory, not these constructions.
The q-Witt/Habiro objects are not ASW field-character quotients. No acceptance namespace
collision was found. Progress/revision requests were not treated as new owners.

The retained extensions have these distinguishing domains: reduced polynomial lattices rather
than real LLL lattices; perfect-field fixed-modulus universality and arbitrary finite abelian
B-torsors rather than the supplied finite-field rank-one dictionary; an explicit Chebotarev
error rather than its supplied asymptotic; arbitrary reductive groups and integral coefficients
rather than complex GL_n alone; split and equal-characteristic-two Hermitian densities rather
than the supplied inert characteristic-not-two case; unitary continuation rather than the
supplier's spherical GL_n branch. These boundaries account for why the corresponding targets
remain here.

## Pinned library evidence

Each source id below is the indicated repository-relative file inside its pinned dependency.

| Source id | File and inspected declaration |
| --- | --- |
| tc_function_field | `TauCeti/FieldTheory/FunctionField/Basic.lean`; tc_function_field line 49, IsFunctionField. |
| tc_constants | `TauCeti/FieldTheory/FunctionField/ConstantField.lean`; tc_constants line 109, finiteDimensional_algebraicClosure; line 140, exactness instance; line 149, function field over constants; line 158, finite exact-constant normalization. |
| tc_divisor | `TauCeti/FieldTheory/FunctionField/Divisor/Basic.lean`; tc_divisor line 51, degree; line 55, weighted sum; line 160, degree-zero effective divisor iff zero. |
| tc_product | `TauCeti/FieldTheory/FunctionField/Divisor/ProductFormula.lean`; tc_product line 258, degree_principal. |
| tc_rr | `TauCeti/FieldTheory/FunctionField/RiemannRoch/Basic.lean`; tc_rr line 87, riemannRochSpace; line 99, Divisor.dim. |
| tc_genus | `TauCeti/FieldTheory/FunctionField/RiemannRoch/Genus.lean`; tc_genus line 189, truncated supremum genus. |
| tc_counts | `TauCeti/FieldTheory/FunctionField/RiemannRoch/ClassNumber.lean`; tc_counts line 82, finite effective divisors; line 143, finite degree-zero classes; line 202, classNumber; line 210, positivity. |
| tc_place | `TauCeti/FieldTheory/FunctionField/Place/Basic.lean`; tc_place line 186, ordAddMonoidHom; line 487, degree; `TauCeti/FieldTheory/FunctionField/Place/Degree.lean` line 223, positive degree. |
| tc_completion | `TauCeti/FieldTheory/FunctionField/Place/Completion/Basic.lean`; tc_completion line 41, completion; line 49, embedding. `TauCeti/FieldTheory/FunctionField/Place/Expansion/Completion.lean` line 119, rational-place integral expansion. |
| tc_differential | `TauCeti/FieldTheory/FunctionField/Differential/Weil.lean`; tc_differential line 211, weilDifferentialSpace; `TauCeti/FieldTheory/FunctionField/Differential/CanonicalDivisor.lean` line 394, canonical degree. |
| tc_points | `TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean`; tc_points line 120, TauCeti.AlgHom.instGroup; `TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive/Basic.lean` line 89, ReductiveAffineGroupSchemeCat. |
| ml_witt | `Mathlib/RingTheory/WittVector/Truncated.lean`; ml_witt line 62, vector carrier; line 288, ring-hom truncation. `Mathlib/RingTheory/WittVector/Frobenius.lean` line 218, Frobenius; `Mathlib/RingTheory/WittVector/Verschiebung.lean` line 109; `Mathlib/RingTheory/WittVector/Teichmuller.lean` line 93. |
| ml_trace | `Mathlib/RingTheory/Trace/Basic.lean`; ml_trace line 518, Algebra.trace_surjective, with finite dimension and separability. |
| ml_formal | `Mathlib/RingTheory/FormalGroup/Basic.lean`; ml_formal line 56, law; line 74, separate IsComm. |
| ml_laurent | `Mathlib/RingTheory/LaurentSeries.lean`; ml_laurent line 502, valuation; line 1034, ratfuncAdicComplRingEquiv. |
| ml_restricted_units | `Mathlib/Topology/Algebra/RestrictedProduct/Units.lean`; ml_restricted_units line 84, unitsEquiv. |
| ml_haar | `Mathlib/MeasureTheory/Measure/Haar/Basic.lean`; ml_haar line 582, Haar-measure choice on a locally compact Hausdorff group. |
| ml_galois | `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean`; ml_galois line 42, actual absolute Galois group; its continuous coefficient maps are at line 59 and line 87. |

The native definitions relied on include the following literal fragments:

```lean
-- tc_function_field line 49
 def IsFunctionField : Prop :=
   ∃ x : F, Transcendental k x ∧ FiniteDimensional k⟮x⟯ F
-- tc_rr line 88
 carrier := {f : F | ∀ P : Place k F, P.valuation f ≤ WithZero.exp (D.coeff P)}
-- tc_divisor line 51
 noncomputable def degree : Divisor k F →+ ℤ :=
   WeilDivisor.weightedDegree fun P => P.degree
```

IsFunctionField includes neither finite nor exact constants. The Riemann–Roch carrier includes
zero through a multiplicative inequality; it does not itself assert finite dimension. The
formal-group carrier includes associativity and the two linear terms, while commutativity is
separate. Native genus is a natural-number truncation and must not replace the exact-constant
genus in the nonexact Hess sum formula. Object searches found no pinned additive truncated-Witt
Hilbert 90, reduced polynomial-lattice basis theorem, general equal-characteristic local
existence or divisor zeta rationality duplicating the retained headlines.

## Primary sources and limits

The supplied `sources.toml` is unchanged and is not part of the target folder. Its accepted
access decisions are preserved: Rosen, Goss, Stichtenoth, Hess and SGA 4½ have limited/uncertified
access, and Roquette has the settled waiver. No source text was copied into the roadmap.

The browser line identifiers below refer to the specified primary-source PDF/HTML rendering,
not to a remembered theorem number. In particular, [Kosters–Wan](https://arxiv.org/pdf/1607.00523v1)
kw line 339 gives the Witt exact sequence; kw line 1138 gives the residue formula; kw line 1593
gives the reduced-class layer split. [Guignard](https://msp.org/ant/2019/13-6/ant-v13-n6-p03-s.pdf)
guignard_published line 1703 and line 1745 give the high-degree bound and exact-sequence
Abel-bundle argument. [Feng–Yun–Zhang](https://arxiv.org/pdf/2103.11514v4) fyz line 1030 gives
the density reciprocity convention, fyz line 1061 the local substitution, and fyz line 1177
the global theorem. [Stacks](https://stacks.math.columbia.edu/tag/03UZ) stacks line 21 specifies
constructibility and flat finite coefficients for the determinant identity.
[Yoshida](https://www.numdam.org/item/10.5802/afst.1188.pdf) yoshida line 652 fixes the relative
unramified degree to the valuation of x. Yu, Parshin, Conrad's geometric handout and Li–Zhang
were also reopened at their manifest versions. The source proof uses are comparisons with the
accepted detailed locator audit, not a claim to have reproved all the source theorems.

The direct Kosters PDF fetch failed in this pass; the accepted Theorem 1.1/Corollary 1.2 locators
and the package's explicit base-extension deduction were retained. No new source-access request
or unsupported certification was made. The numerical tests of the stated bound below are
independent of that failed fetch.

## Untrusted text

No instruction from a review, roadmap, design or fetched source was executed as authority.
Repository guidance includes the generic passage “register what you intend to work on and claim
it” and general cache/build commands. Those instructions conflict with this job's limited GitHub
and Lean authorization, so no claim, comment, push, pull request, update or cache download was
performed. The mathematical review's proposed repairs were verified against source text before
being used; its incorrect proposed rigidification inversion was not reinstated.

## Adversarial mathematics pass

The table has 272 rows, one per tested target, definition, API law or convention. Entries give concrete
values or concrete finite carriers on both sides; “Matches” means those instances agree, not that
an admitted theorem has been proved. Algebraic calculations were done directly; a small local
Python program independently enumerated the F₂₅/F₉ curves, finite Heisenberg orbits and finite-ring
split rank-one representations. Its output gave 27 and 16 points, orbit probability sums 1,
and stable split densities 1 at q=2 and 4/3 at q=3 for the Gram-π line.

| Statement | Instances tried | Computed values | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: exact constants | F₂(t), and F₄(t) over F₂ | dim L(0)=1 versus 2; exact constant degrees 1 versus 2 | Matches | Exactness retained |
| Conventions: place degree and absolute value | degree-two place, uniformizer | deg=2; ord=1; absolute value=q^(−2) | Matches | — |
| Conventions: divisor and idele signs | t on P¹, uniformizer idele at infinity | div(t)=[0]−[∞], degree=0; idele degrees 1 and −1 | Matches | — |
| Conventions: arithmetic/geometric Frobenius | F₅, degree-one Kummer fiber at t=2 | arithmetic multiplier 2; inverse multiplier 3; 2·3=1 | Matches | — |
| Conventions: absolute value at zero | x=0 | actual absolute value 0; q^(−d·native_ord(0))=1 | Corrected | Nonzero hypothesis and separate zero value |
| 1.1 chart membership at zero | D=−∞,a=0 | fractional-ideal membership true; native additive inequality 0≥1 false | Corrected | Proof separates zero |
| 1.2 zero polynomial degree | d_i=−1,a_i=0 | extended degree −∞≤−1 true; native natDegree 0≤−1 false | Corrected | Extended polynomial degree explicit |
| 6.4 finite equation proof | rows 2,4,8,… over Z[1/3] | infinitely distinct; generated submodule 2Z[1/3]; common kernel 0 | Corrected | Noetherian finite generation replaces finite distinctness |
| Conventions: zeta variable | degree-two place | Euler factor 1+T²+T⁴+…; T coefficient 0 | Matches | — |
| Conventions: Witt operations | p=2, vector [t] | ℘[t]=(t²+t,t²+t³), second coordinate nonzero | Matches | — |
| Conventions: coefficients | R=F_p and Z[1/p] | 1/p unavailable in the first; p·(1/p)=1 in the second | Matches | — |
| Conventions: universes and cardinalities | finite field versus zero ring | q≥2; zero ring has 0=1 and cannot carry Field | Matches | Explicit domains |
| Conventions: total counts and divisions | r=0; q=2 | divisors(0)=∅, N₀=0; A₀=1; q−1=1 | Matches | Added zero-index Check |
| 0.1 degree comparison | idele uniformizer at degree two | weighted divisor degree=2=ideleDegree; Yu degree=−2 | Matches | Native degree/product formula no longer separate targets |
| 0.1 constant reciprocity | (r,d)=(2,2),(3,2) | 2 factors of degree 1, φ²=1; 1 factor of degree 3, order(φ²)=3 | Matches | — |
| 0.2 degree-one divisor | P¹, infinity; real pointless conic | degree=1; conic degree image=2Z excludes 1 | Matches | Finite-field hypothesis retained |
| 0.3 class/Picard comparison | P¹ over F₂ | Cl=Z, Cl⁰=0, h=1=#J(F₂) | Matches | — |
| 0.3 Picard–Brauer obstruction | pointless real conic | actual line-bundle degrees 2Z; relative Picard degree-one point has obstruction 1 in Z/2 | Matches | — |
| 1.1 chart intersection | D=2∞ on k(t) | inverse ideals k[t], t²O∞ intersect in span(1,t,t²), dimension 3 | Matches | API bullets |
| 1.1 chart multiplication | D=∞, E=∞ | t^(−1)O∞·t^(−1)O∞=t^(−2)O∞ | Matches | — |
| 1.1 pole shift | D=0,r=−1,1 | infinite ideals tO∞ and t^(−1)O∞; intersections 0 and span(1,t) | Matches | — |
| 1.1 zero shift | D=0,r=1 | finite ideal t·k[t]; L([0])=span(1,1/t) | Matches | — |
| 1.1 principal chart ideals | f=t | ideals t·k[t] and t·O∞; principal degree 1−1=0 | Matches | — |
| 1.1 valuation zero control | a=0,D=−∞ | multiplicative inequality 0≤q^(−1) true; additive junk order 0≥1 false | Matches | — |
| 1.2 abstract reduced-basis existence | rank zero; rank one with d=2 | empty bases and empty tuple; shifts give dimensions max(0,3+r) | Matches | — |
| 1.2 simultaneous reduced basis | k(t),D=0,r=−1,2 | d=(0),v=(1); empty index or {0,1,2}, dimensions 0,3 | Matches | — |
| 1.2 elliptic reduced basis | y²=x³+x+1, x-pole degree 2 | d=(0,−2); r=0,1,2 dimensions 1,2,4 | Matches | — |
| 1.2 uniqueness | one-variable rational basis | dim at r=−1,0,1 is 0,1,2, forcing sole invariant 0 | Matches | — |
| 1.2 shift API | d=(0,−2),r=1 | shifted tuple (1,−1), dimension 2+0=2 | Matches | — |
| 1.2 dimension API | d=(0,−2),r=−1 | max(0,0)+max(0,−2)=0, never negative | Matches | — |
| 1.2 sum API | constant degree 2, exact genus 2,D=0 | sum=−2−n; native base genus 3 would instead give −4−n | Matches | Exact genus retained |
| 1.2 principal API | k(t),D=0,f=t | L(−div t)=span(t); invariant remains 0 | Matches | — |
| 1.2 inseparable subfield | p=2,x=t²,D=0 | d=(0,−1); r=0,1,−1 dimensions 1,3,0 | Matches | No separability added |
| 2.1 lattice compact openness | D=0 versus D=[v],deg v=2 | integral product and one enlarged compact factor; index q² | Matches | — |
| 2.1 diagonal intersection | P¹,D=−∞ | L(D)=0; zero belongs to every local lattice | Matches | — |
| 2.1 repartition quotient | P¹,W=−2∞,D=−∞,−2∞ | i(D)=ell(−∞)=0 and ell(0)=1 | Matches | — |
| 2.1 lattice monotonicity | D=0≤[v],q=2,deg v=2 | quotient dimension 2; index 4≥1 | Matches | — |
| 2.1 principal scaling | f=t,D=0 | conditions shift from 0 to −[0]+[∞]; ord₀(t)=1 | Matches | — |
| 2.1 index formula | D=D′; D′−D=[v],deg v=2,q=2 | indices 1=2⁰ and 4=2² | Matches | — |
| 2.2 local volume | n_v=−2,0,2,q_v=2 | volumes 2,1,1/2 | Matches | — |
| 2.2 global volume | P¹,q=2,D=m∞,m=−2,0,1 | lattice volumes 1/2,2,4; adelic quotient volume 1 | Matches | — |
| 2.2 differential scaling | dt to t dt on P¹ | local scale 1/sqrt(q) at 0, sqrt(q) at infinity; product 1 | Matches | — |
| 2.2 annihilator | n_v=2 | O_v perpendicular=π^(−2)O_v, index q_v² | Matches | — |
| 2.2 integral/self-dual ratio | g=0,1,2 | q,1,q^(−1); quotient volumes multiply to 1 | Matches | — |
| 2.3 Fourier indicator | P¹,D=0,ω=dt,q=2 | transform=2·1_A(−2∞); second transform factor 2·1/2=1 | Matches | — |
| 2.3 translated indicator | coset c+A(D), b=0 | character ψ(cb)=1, transformed value equals lattice volume | Matches | — |
| 2.3 span by translates | k=F₃, c moved by λ=2 | chosen coset indicator changes from 1 to 0; unshifted indicators remain invariant | Matches | — |
| 2 source-character correction | additive F₄ | image size 2, kernel size 2, not injective; product character at zero=1 | Matches | Preserved source correction |
| 3.1 ASW operator | p=2,n=1,2 | first coordinate t²+t; second t²+t³ excludes coordinatewise subtraction | Matches | — |
| 3.1 finite quotient definition | n=0; F=F₂,n=1 | zero quotient; quotient F₂/0 has 2 elements | Matches | — |
| 3.1 solution field | class 0 and class 1 over F₂ | degrees 1 and 2; X²+X+1 irreducible | Matches | — |
| 3.1 infinite quotient topology | coefficients c_i=2^i | modulo 2^m only i<m survive; infinite support permitted | Matches | — |
| 3.1 Witt Hilbert 90 | n=0 and identity extension | all groups 0; for n=1 identity trace=id, difference=0 | Matches | — |
| 3.1 trace surjectivity | degree-3 AS extension | Tr(1)=0; Tr(−y²)=−2=1 in F₃ | Matches | — |
| 3.1 Witt trace law | p=2,n=2,y²+y=t | (y,0)+(y+1,0)=(1,t), versus coordinate sum (1,0) | Matches | — |
| 3.1 cyclic classification | p=2,n=2,class (t,0) | order 4, extension degree 4; coordinatewise model exponent 2 | Matches | — |
| 3.1 finite character equivalence | F=F_p,n=0,1 | trivial groups at 0; characters of procyclic Galois group to Z/p number p | Matches | — |
| 3.1 same-field criterion | p=3,nonzero a and 2a | same cyclic subgroup of order 3, same field, characters differ by 2 | Matches | Both directions retained |
| 3.1 quotient localization | class T^(−1),at 0 and infinity | nonzero ramified local class at 0, zero at infinity | Matches | — |
| 3.1 truncation | p=2,(t,0), lengths 2→1→0 | class orders 4→2→1 | Matches | — |
| 3.2 reduced expansion | [T^(−p)] | subtracting ℘[T^(−1)] leaves [T^(−1)] | Matches | — |
| 3.2 trace-normalized constant | k=F_(p^p),class [1] | Witt trace of 1=p; coordinate c=p/Tr(β), valuation 1 | Matches | — |
| 3.2 positive-valuation coboundary | p=2,x=T | y=T+T²+T⁴+… satisfies y²+y=T | Matches | — |
| 3.2 reassembly | c=1,c₁=1,all others 0 | class β+[T^(−1)] has precisely those two nonzero coefficients | Matches | — |
| 3.2 unramified criterion | class β versus [T^(−1)] | length-one degrees p,p; conductors 0,2 | Matches | — |
| 3.2 primitive/unramified layers | β+p[T^(−m)] | n₀=0,n_c=1; first layer unramified degree p, inertia pZ_p | Matches | — |
| 3.2 uniformizer change | T′=uT,u∈k× | coefficient of [T′^(−1)] becomes [u]; pole order stays 1 | Matches | — |
| 3.3 one-pole comparison | p=3,m=2 | local conductor 3,different 6,2g−2=−6+6=0 | Matches | — |
| 3.3 constant-extension comparison | preceding curve over F₃ and F₉ | rational points 4 and 16; local pole order 2 in both | Matches | — |
| 3.3 divisible pole control | m=p | class reduces to T^(−1); genus 0, not (p−1)²/2 | Matches | — |
| 3 example: sum versus compositum | p=3,ramified and constant classes | compositum degree 9; sum character has order 3, diagonal field degree 3 | Matches | — |
| 4.1 Lubin–Tate series | Q=2,f=πX+X² | linear coefficient π, reduced series X² | Matches | Uses supplier formal-module carrier |
| 4.1 formal group and action | equal characteristic,constants a∈F_Q | group law X+Y, [a]=aX; [π]=πX+X^Q | Matches | Mixed characteristic supplied elsewhere |
| 4.1 torsion module | Q=2,m=1,2 | torsion sizes 2,4; primitive counts 1,2 | Matches | — |
| 4.1 division-field degree | Q=2,m=1,2; Q=3,m=1 | degrees 1,2,2 | Matches | — |
| 4.1 primitive valuation | f=πX+X^Q,m=1 | nonzero root α has ord_K α=1/(Q−1), normalized extension order 1 | Matches | — |
| 4.1 norm uniformizer | Q=2,m=1 | field K, norm π=π | Matches | — |
| 4.1 coordinate independence | f=g,strict identity | coordinate X has derivative 1; torsion and field unchanged | Matches | — |
| 4.1 relative construction | ord_K x=2,Q=2,m=2 | unramified degree 2,total degree 4,valuation norm subgroup 2Z | Matches | — |
| 4.2 local Kronecker–Weber | unramified and LT subextensions | intersection K by unramified versus total ramification, degree product at finite levels | Matches | — |
| 4.2 norm existence and uniqueness | H=K× and H=ord⁻¹(2Z) | degrees/indices 1 and 2, unramified norm valuations Z and 2Z | Matches | — |
| 4.2 wild norm subgroup | K=F₂((T)),m=2 | H generated by T,1+T²O has index 2; AS pole T^(−1) conductor 2 | Matches | — |
| 4.2 Artin normalization | unit u and uniformizer π | LT action [u^(−1)], unramified action φ; inverse normalization gives [u],φ^(−1) | Matches | — |
| 4.2 Artin injectivity/image | valuation coordinate of π | image degree 1 in Z⊂Zhat; completion enlarges Z to Zhat | Matches | — |
| 4.2 least conductor | AS simple pole versus unramified | U² killed,U¹ not killed; unramified U⁰ killed | Matches | — |
| 4.3 symbol definition/bilinearity | length one,constant a∈F₃ | [a,T)=a, [a,T²)=2a, [a,unit)=0 | Matches | — |
| 4.3 perfect finite quotient | p=2,b=T² | symbol zero for all length-one classes; full completion valuation coordinate 2≠0 | Matches | — |
| 4.3 symbol characterization | constant β and simple pole | [β,T)=Tr β; [T^(−1),T)=0 | Matches | — |
| 4.3 residue formula sign | p=3,a=1 | Res(T^(−1)dlog(1−T))=−1=2 mod 3 | Matches | — |
| 4.3 completed lift | sum 2^j[T^(−(2j+1))] | modulo 4 negative exponents −1,−3; modulo 8 also −5 | Matches | — |
| 4.3 norm annihilator | class T^(−1) over F₂((T)) | T pairs 0; 1−T pairs 1; norm subgroup excludes 1−T | Matches | — |
| 4.4 conductor formula | p=3,m=2,n=1,2 | unit coefficient conductors 3,7; coefficient valuation 1 gives 3 at n=2 | Matches | — |
| 4.4 upper ramification bound | p=2,m=3,c₃=2,r=1 | corrected threshold 1+max(0,−1)=1; uncorrected threshold 0 | Matches | Source correction retained |
| 4.4 constant-only filtration | no pole coefficients | minimum ∞,positive upper groups 0,conductor 0 | Matches | — |
| 4.4 compositum conductor | exponents 2 and 3 | lcm(π²,π³)=π³; exponent max=3 | Matches | — |
| 4.4 length-one specialization | pole m=1 and zero class | conductors 2 and 0 | Matches | — |
| 4.5 finite ray data | P¹,m=0,degree quotient r=3 | quotient Z/3 has 3 elements; unquotiented ray group Z infinite | Matches | — |
| 4.5 ray degree-zero kernels | q=3,moduli 0,0+∞,2[0] | orders 1,2,3 | Matches | — |
| 4.5 finite character soundness | A=Z/3,character of order 3 | image size 3; degree-three relation maps to 1 | Matches | — |
| 4.5 least conductor/minimality | simple AS pole | exponent 2 kills U²; value on 1−T is −1≠0 | Matches | — |
| 4.5 unramified and degree value | degree character λ^deg | all local units map 1; degree-one class maps λ | Matches | — |
| 4.5 local coordinates | infinity,T=t^(−1) | ord(T)=1,dt=−T^(−2)dT,volume(O)=q | Matches | — |
| 4.5 parameter independence | T′=uT | ord remains 1; residue of dT/T remains 1 | Matches | — |
| 4.5 quotient truncation | N=0,1,2 | zero ring,k,k[T]/T²; (1+T)²=1+2T mod T² | Matches | — |
| 4.6 rigidified schemes | P¹,moduli 0,[∞],2[∞] | dimensions 0,0,1; kernels 0,0,G_a | Matches | — |
| 4.6 tensor/torsor law | P¹ degree d and degree e | O(d)⊗O(e)=O(d+e); identity O(0) | Matches | — |
| 4.6 forgetful maps | 2[∞]→[∞]→0 | G_a→0→0; both composites zero | Matches | — |
| 4.6 linear structure | 0+∞ and a degree-two point | geometric torus ranks 1,1; unipotent dimensions 0,0 | Matches | — |
| 4.6 nonreduced modulus | 2[∞] | normalized units 1+bT; (1+bT)(1+cT)=1+(b+c)T | Matches | — |
| 4.6 no rational point assumed | pointless real conic,degree-two modulus | Pic_m¹(R)=∅ while relative Pic¹(R) nonempty; no torsor section forced | Matches | — |
| 4.7 Abel-map coordinate | P¹,0+∞,c=2 over F₅ | rigidification ratio 2; inverse model gives 3 | Matches | — |
| 4.7 additive Abel coordinate | P¹,2∞,c=1 | section 1−T gives coordinate −(−1)=1 | Matches | — |
| 4.7 high-degree affine bundle | P¹,N=2,n=1,2 | ranks 0 and 1,fibers point and A¹ | Matches | — |
| 4.7 elliptic surjectivity threshold | g=1,N=1,n=1,2 | n=1 misses [P]; theorem threshold 2,rank 0 at n=2 | Matches | — |
| 4.7 modulus universal property | t on A¹,m=2∞ versus ∞ | value([1]−[0])=1; congruence mod T holds, mod T² fails | Matches | Both directions and least modulus tested |
| 4.7 zero modulus | P¹,G_a | J=0,only constant factorization; t([1]−[0])=1 excludes t | Matches | — |
| 4.7 modulus operations | identity base change,identity torsor map,m enlarged | induced h remains identity; killed divisor value stays 0 | Matches | — |
| 4.8 ray/Picard coordinate | q=5,unit λ=2 at 0 | rigidification λ^(−1)=3,not 2 | Matches | — |
| 4.8 wild coordinate | 1+bT mod T²,b=1 | inverse 1−T; additive coordinate b=1 in every characteristic | Matches | — |
| 4.8 degree direction | P¹,m=0 | full group Z,degree-zero group 0,degree-one fiber one point | Matches | — |
| 4.9 Lang map | G_m/F₅,at t=2 | equation z⁴=2 implies Frob₅(z)=2z; geometric multiplier 3 | Matches | — |
| 4.9 additive Lang map | G_a/F₃,at t=1 | y³−y=1 implies arithmetic translation 1,inverse translation 2 | Matches | — |
| 4.9 degree multiplier | F₃,m=2∞,a=[1],v=t²+1 | trace(t−1)=−2=1; omitting degree multiplier gives −1=2 | Matches | — |
| 4.9 changing splitting | a→a+b,degree d=2 | deck value decreases by 2b | Matches | — |
| 4.9 q=2 tame/wild control | G_m and G_a | groups have orders 1 and 2; covers identity and degree 2 | Matches | — |
| 4.10 finite B-torsor construction | B=Z/4,θ=0 | four trivial connected components,geometric monodromy 0 | Matches | API made conditional on factorization |
| 4.10 generic Artin character | degree d,geometric x | θ(x−da)+dθ(a)=θ(x) | Matches | — |
| 4.10 group-map API | Z/4→Z/2,degree character | d mod 4 maps to d mod 2; connected degree changes 4→2 | Matches | — |
| 4.10 modulus API | tame q=3 cover at enlarged modulus | conductor [0]+[∞] divides [0]+2[∞]; same cover after restriction | Matches | Conditional wording explicit |
| 4.10 choice independence | a→a+b,degree d | −dθ(b)+dθ(b)=0 | Matches | — |
| 4.10 classifies all torsors | θ=0,θ=deg mod 2,θ=2deg mod 4 | images 0,Z/2,2Z/4; component counts 1 for B=0,1,2 respectively | Matches | Disconnected torsors retained |
| 4.10 connected/geometric criterion | θ=deg mod 3 on P¹ | arithmetic image Z/3,geometric image 0; connected,3 geometric components | Matches | — |
| 4.10 norm group | constant quadratic cover | degree subgroup 2Z,index 2=extension degree | Matches | — |
| 4.10 least conductor | q=2,3 tame Lang cover | identity has conductor 0; degree-two tame cover conductor [0]+[∞] | Matches | — |
| 4.10 wild conductor | y^q−y=t,q=2,3 | exponents 2 at infinity; Swan 1,group orders 2,3 | Matches | — |
| 4.10 modulus multiplicity | y²+y=t | étale on A¹ for both moduli ∞,2∞; conductor 2 excludes factorization through ∞ | Matches | — |
| 5.1 effective divisor count | P¹/F₂,n=0,1,2 | A_n=1,3,7; classes per degree=1 | Matches | — |
| 5.1 zeta definition | P¹/F₂ | Z=1+3T+7T²+15T³+…; denominator (1−T)(1−2T) | Matches | — |
| 5.1 place count | P¹/F₂,d=0,1,2 | counts 0,3,1 | Matches | — |
| 5.1 point count | P¹/F₂,r=0,1,2 | N=0,3,5; N₂=3+2·1 | Matches | — |
| 5.1 Euler product | F₂,degree at most 2 | three linear factors contribute coefficient 6 at T²; one degree-two factor adds 1,total 7 | Matches | — |
| 5.1 logarithmic derivative | P¹/F₂,r=1,2,3 | lhs/rhs 3=3,14=14,45=45 | Matches | — |
| 5.1 point/model comparison | P¹/F₂² | 4 affine points plus infinity=5=3+2 | Matches | — |
| 5.1 count base extension | q=5,r=s=2 | N₂ over F₂₅=25²+1=626=N₄ over F₅ | Matches | — |
| 5.1 Möbius inversion | q=2,r=2 | 2·B₂=2=N₂−N₁=5−3 | Matches | — |
| 5.2 sum over classes | P¹/F₂,degree 2 | one class,ell=3,(2³−1)/(2−1)=7 | Matches | — |
| 5.2 class count in each degree | rational field h=1,n=−1,0,1 | one class in each degree,even when no effective divisor at −1 | Matches | — |
| 5.2 large-degree formula | P¹/F₂,n=0; elliptic q=5,h=9,n=1 | 1·1=1·(2−1); 4·9=9·(5−1)=36 | Matches | — |
| 5.2 natural subtraction bound | g=0,n=0 and g=2,n=3 | exponents 1 and 2,not truncated; guards 0≤1 and 4≤4 | Matches | — |
| 5.3 zeta rationality | P¹/F₂ | numerator 1,degree 0,constant and leading coefficient 1 | Matches | — |
| 5.3 linear coefficient | elliptic q=5,N₁=9 | a₁=9−6=3 | Matches | — |
| 5.3 reciprocal symmetry | same elliptic | a₂=5=5·a₀; qT²L(1/(qT))=1+3T+5T² | Matches | — |
| 5.3 class number | same elliptic | L(1)=1+3+5=9=h | Matches | — |
| 5.3 zeta functional equation | genus zero | substituting 1/(qT) gives qT²/((1−T)(1−qT)) | Matches | Rational-function convention explicit |
| 5.4 model comparison | elliptic over F₅ | affine fibers 2,0,2,2,2; total 9 | Matches | — |
| 5.4 reversed Jacobian polynomial | X²+3X+5 | reversal 1+3T+5T²,not X²+3X+5 | Matches | — |
| 5.4 Weil bound | q=5,g=1,r=1,2 | deviations 3 and 1 bounded by 2sqrt(5) and 10 | Matches | — |
| 5.5 constant extension | elliptic,F₅→F₂₅ | L(T)L(−T)=1+T²+25T⁴; N₂=27 | Matches | — |
| 5.5 splitting law | d=2,r=2 and d=3,r=2 | 2 degree-one places and 1 degree-three place | Matches | — |
| 5.5 rational-field extension | r=2 | denominator (1−T²)(1−q²T²),numerator 1 | Matches | — |
| 5.6 polynomial-data definition | q=5,g=1,N₁=9 or 8 | allowed a₁=3 or 2; fixed polynomial with a₁=3 rejects 8 | Matches | — |
| 5.6 uniqueness | g=0; q=0,1,g=1,N₁=9 | polynomials 1; 1+8T; 1+7T+T² | Matches | Total q domain documented |
| 5.6 actual L-polynomial data | q=5,elliptic numerator | Newton 1·3=(9−5−1)·1=3 | Matches | — |
| 5.6 count dependence API | g=1,N₂ changed 27→100 | predicate still reads only N₁=9; same polynomial | Matches | — |
| 5.6 degree API | q=0,g=1,P=1+8T | coefficient a₂=0=q^g,actual leading coefficient 8 | Matches | Used top coefficient rather than unconditional leading coefficient |
| 5.7 characteristic series | A in degree 0,u=2 | series 1−2T; shift gives reciprocal | Matches | API bullets |
| 5.7 representative independence | contractible [A→^1 A],id | (1−T)/(1−T)=1 | Matches | — |
| 5.7 arbitrary base change | Z→F₂,u=2 | 1−2T maps to 1 | Matches | — |
| 5.7 cohomology formula domain | [Z/4→^2 Z/4] | complex series 1; H⁰=H¹=Z/2 not projective | Matches | — |
| 5.7 finite local Euler factors | rank one,Fr=a; zero stalk | 1−aT and 1; constant coefficients both 1 | Matches | — |
| 5.7 inertia invariants | nontrivial tame rank-one inertia | invariants 0; factor 1 | Matches | — |
| 5.7 cohomological identity | constant F₂ sheaf on P¹/F₃ | H⁰ factor 1−T,H² factor 1−T; L=(1−T)^(−2) | Matches | — |
| 5.7 trace-versus-determinant control | characteristic 2,id on rank 2 | power traces 0; determinant 1+T²≠1 | Matches | — |
| 5.8 Frobenius place count | identity cover P¹/F₂,r=1,2 | counts 3,1; rπ=3,2 | Matches | — |
| 5.8 finiteness/additivity API | empty set versus full trivial conjugacy class,r=2 | counts 0,1; disjoint union sum 1 | Matches | — |
| 5.8 constant congruence | quadratic constant cover,r=1,2 | identity-class count 0,1; arithmetic class φ,1 | Matches | — |
| 5.8 quantitative bound | identity cover P¹/F₂,r=2 | error abs(2−5)=3≤2·2+2=6 | Matches | — |
| 5.8 constant-field main term | constant quadratic cover,r=2 | geometric group size 1 gives main term 5; dividing by full size 2 wrongly gives 5/2 | Matches | — |
| 6.1 adelic-point construction | G_a,G_m | additive adeles versus units with continuous inverse | Matches | Uses native Hopf convolution |
| 6.1 restricted-product comparison | G_a,integral model | integral points O_v and all adeles integral almost everywhere | Matches | — |
| 6.1 discrete diagonal | F₂ additive constants at integral level | F₂∩∏O_v=F₂,cardinality 2 | Matches | — |
| 6.1 finite stabilizer | G_m/F₃,maximal level | stabilizer F₃×,size 2=q−1 | Matches | — |
| 6.1 functorial/product API | G_a² and coordinate projection | adelic points A²; (a,b)↦a,identity composition unchanged | Matches | — |
| 6.1 topology control | idele with changed coordinate at a growing place | component π_v tends to invisible integral perturbation; inverse π_v^(−1) leaves integral product | Matches | — |
| 6.2 automorphic module | G_m,P¹,maximal level,Ξ degree r | coset set Z/r; r=1,2 gives ranks 1,2 | Matches | — |
| 6.2 central equivariance | r=2,χ(d)=(−1)^d | functions (a,−a); over Z/4,(2,2) passes,over Q nonzero constant fails | Matches | — |
| 6.2 evaluation/level API | one-point quotient and refined two-point set | evaluation a↦a; pullback a↦(a,a) injective | Matches | — |
| 6.2 Hecke convolution | G_m,degree character λ^deg | uniformizer at degree d acts by λ^d | Matches | — |
| 6.2 base change | two-point finitely supported set,Z→Q | Z²⊗Q=Q² | Matches | — |
| 6.2 GL_n comparison | n=1,unramified trivial central character | both complex realizations give constant functions on degree quotient | Matches | — |
| 6.3 constant term definition | constant function 1 on GL₂ | weighted sum of 1 is 1; not cuspidal | Matches | — |
| 6.3 nonabelian weights | Heisenberg p=2 | orbits 1,1,2 on 4 cosets; weights 1/4,1/4,1/2,sum 1 | Matches | — |
| 6.3 nonabelian weights | Heisenberg p=3 | orbit sizes 1,1,1,3,3 on 9 cosets; total 1 | Matches | — |
| 6.3 torus cusp module | G_m,Ξ degree 1 | no proper parabolic; every function cuspidal,rank h | Matches | — |
| 6.3 linearity/refinement | weights 1/2,1/2 refined to quarters | average of (a,a,b,b)=(a+b)/2 | Matches | — |
| 6.3 maximal-parabolic/Hecke API | constant 1 and zero function | maximal Borel term 1 excludes first; every translate of 0 has term 0 | Matches | — |
| 6.4 reduction covering | G_m,root set ∅ | quotient by centre one point; no central quotient degree group Z infinite | Matches | — |
| 6.4 bounded reduction regions | GL₂,m=diag(π^a,1) | relative root height −a; c₁≤−a≤c₂ allows finite integer interval | Matches | — |
| 6.4 anisotropic branch | rational root set ∅ | bounded-root conditions empty; entire central quotient compact | Matches | — |
| 6.4 reduction API | bounds (0,1) enlarged to (−1,2) | integer heights {0,1}⊂{−1,0,1,2} | Matches | — |
| 6.4 uniform cusp support | G_m,P¹,Ξ degree 2 | common support contained in two cosets; without Ξ infinitely many degree indicators | Matches | — |
| 6.4 finiteness | G_m,h=1,Ξ degree 1 | cusp module R of rank 1; zero ring gives zero module | Matches | — |
| 6.4 flat base change | finite kernel of row (1,−1),Z→Q | kernel Z(1,1) tensors to Q(1,1) | Matches | — |
| 6.5 integral model | same row,R=Z[1/p]⊂C | both kernels consist of (a,a),dimension 1 over C | Matches | — |
| 6.5 Hecke algebraicity | G_m,r=2 | translation matrix [[0,1],[1,0]],charpoly X²−1,eigenvalues ±1 | Matches | — |
| 6.5 number-field model | preceding eigenlines | spanning vectors (1,1),(1,−1),defined over Q | Matches | — |
| 6.5 nonflat control | multiplication by ell on Z[1/p],ell≠p | kernel 0 before reduction; whole F_ell afterwards | Matches | — |
| 6.6 raw Satake | GL₂,q_v=4,constant 1 | raw coefficients 4,1 give eigenvalue 5 | Matches | — |
| 6.6 normalized Satake | same | normalized coefficients 2,2; CT-normalized translate values 2,1/2; total 5 | Matches | — |
| 6.6 normalized CT at one | δ(1)=1 | CTⁿ(1)=CT(1) | Matches | — |
| 6.6 normalized right translation | δ(m)=1/4,l=1,f=1 | lhs 1; rhs (1/2)·2=1 | Matches | — |
| 6.6 CT transitivity | Q=P=G | both sides identity; normalization factors 1·1=1 | Matches | — |
| 6.6 GL₁ reciprocity | degree d=2,χ=λ^deg | eigenvalue λ²; geometric character uses λ^(−2) | Matches | — |
| 6.7 Yu nonvanishing | n=1,nonzero character | value at identity 1≠0,determinant degree 0 | Matches | — |
| 6.7 Yu determinant sign | n=2,g=2 | valuation degree −2,Yu degree +2; scalar shift −2,total 0 | Matches | — |
| 6.7 zero-vector control | φ=0 | every value 0,so conclusion fails without φ≠0 | Matches | — |
| 7 conventions: split and constant covers | X′=X⊔X or X over F_(q²) | étale degree 2; total canonical degree twice original | Matches | — |
| 7.1 unramified criterion | n=0,2 | η^n=1,χ=1; obstruction evaluation 1 | Matches | — |
| 7.1 split choices | pair (χ₀,χ₀^(−1)) | diagonal restriction χ₀(a)χ₀(a)^(−1)=1 | Matches | — |
| 7.1 constant quadratic choice | inert odd d and split even d | degree after base change d or two copies d/2; χ-value (−1)^d in both | Matches | — |
| 7.1 arithmetic obstruction | E/F₃:y²=x³+2x²+2x | E(F₃)={O,(0,0)}; fiber above P degree 2,above O split; η(P−O)=−1 | Matches | Source correction retained |
| 7.1 finite-ramification existence | even n,trivial character | kernel whole class group,local conductors all 0,S empty | Matches | — |
| 7.1 character API | χ′=χ·ξ,ξ restricts trivially | restrictions multiply η^n·1=η^n; ratio χ′/χ=ξ | Matches | — |
| 7.2 parameter group | split GL₂,P=G | scalar degree 2d; z=1,−1 both satisfy z^(2d)=1; group μ₂ | Matches | — |
| 7.2 cuspidal continuation | P=H_n | E=f,intertwiner=id,denominator 1 | Matches | — |
| 7.2 Weyl constant term | split GL₂ Borel | two Weyl elements; exponents s and −s,distinct for s≠0 | Matches | — |
| 7.2 Levi discrete decomposition | GL₂ determinant character | quotient modulus-one function has constant term 1; discrete but not cuspidal | Matches | — |
| 7.2 discrete-data continuation | same residual datum | nonzero constant term 1 distinguishes residual continuation from cusp case | Matches | — |
| 7.2 inducing series | split n=1,q=4,s=0 | normalized/unnormalized section values both 1/2 | Matches | — |
| 7.2 spherical normalization | Φ→2Φ | value at 1 changes 1→2,so only first is normalized | Matches | — |
| 7.2 section unipotent/parabolic API | α=1,b arbitrary | Φ(n(b),s)=Φ(1,s),norm and character factors 1 | Matches | — |
| 7.2 section degree | split rank one,α=(π,1) | Yu degree −1,Φ=q^(−s−1/2) | Matches | — |
| 7.2 rationality and periodicity | q=3,s→s+2πi/log3 | q^(−s) multiplied by exp(−2πi)=1 | Matches | — |
| 7.2 left automorphy | γ=1,then rational γ | rational parabolic coset permutation bijective; same summands and sum | Matches | — |
| 7.3 residue-pairing sign | n=1,T=θ,b with residue 1 over F₃ | argument −1=2; opposite convention gives 1 | Matches | — |
| 7.3 Hermitian trace pairing | F₄/F₂,basis 1,u | off-diagonal Gram [[0,1],[1,0]],det 1; diagonal Gram [1] | Matches | — |
| 7.3 Fourier coefficient | n=0 | unipotent group trivial,one Fourier index,integral equals E | Matches | — |
| 7.3 rational-Levi covariance | rational α | global norm product 1; transformed matrix remains rational | Matches | — |
| 7.3 local Whittaker covariance | α=1 | character/norm prefactor 1; T′=T | Matches | — |
| 7.3 factorization measure | n=1,g_X=0,1,q=3 | prefactors 3 and 1; self-dual quotient prefactor 1 | Matches | — |
| 7.3 singular-index control | n=1,T=0,split GL₂ | constant term has 2 exponents; one big-cell factor insufficient | Matches | — |
| 7.3 ramified factor | Φ=0,then 2Φ | factors 0,then twice original at every regular parameter | Matches | — |
| 7.3 spherical local check | split n=1,q_v=3,self-dual,s=0 | 1−1/3=2/3 | Matches | — |
| 7.4 integral split lattice | (O,πO) | dual (π^(−1)O,O),torsion total length 2,half-length 1 | Matches | Explicit integrality/nondegeneracy |
| 7.4 lattice type shorthand | same lattice | quotient mod π has total dimension 2,half-type 1=t′(L) | Matches | Defined missing t′(L) shorthand |
| 7.4 cross-duality API | preceding L and L′=(O,O) | L⊂L′,L′∨=L′⊂L∨; double dual L | Matches | — |
| 7.4 representation density | split q=2,m=n=1,N=2,3,Gram π | counts 4,8 divided by 4,8 both 1 | Matches | Local q explicit |
| 7.4 rank-zero/m<n | n=0 and n=1,m=0 | count 1,dimension 0,density 1; no generic embedding,density 0 | Matches | — |
| 7.4 weight polynomial | a=0,1,2 | 1;1−T;(1−T)(1−ηqT) | Matches | — |
| 7.4 half-length/type | split L′/L=(0,k) | total length 1,half-length 1/2,exponent 2ell′=1 | Matches | — |
| 7.4 auxiliary zero invariants | torsion 0 | length 0,type 0; weight m(0)=1 | Matches | — |
| 7.4 self-dual density | split q=2,n=1,j=0 | density 1/2,normalizer 1/2,polynomial value 1 | Matches | — |
| 7.4 inert characteristic two | F₄/F₂,unit line | norm-one fiber {1,u,u+1} has size 3; trace(u)=trace(u+1)=1 | Matches | — |
| 7.4 interpolation denominator | q=2,η=±1,i=1,j=0 | factors 1/2 and 3/2,both nonzero | Matches | — |
| 7.4 split overlattice formula | L=(O,πO) | terms (1−T)+T+T=1+T | Matches | — |
| 7.4 inert overlattice formula | rank-one Gram π | no proper integral overlattice; term 1−T | Matches | — |
| 7.4 functional equation | split/inert rank one,length 1 | T(1+1/T)=1+T; (−T)(1−1/T)=1−T | Matches | Laurent identity explicit |
| 7.4 nonintegral control | Gram π^(−1) | L not contained in L∨,quotient L∨/L undefined | Matches | Excluded explicitly |
| 7.5 local Whittaker/density | self-dual n=1,split q=3,s=0 | W=1−1/3=2/3 | Matches | — |
| 7.5 interpolation rank | q=2,n=1,j=1,split | source rank 3,T=1/4; normalizer 1−1/8=7/8; rank 2 would give 3/4 | Matches | — |
| 7.6 global density product | all local lattices self-dual | each polynomial 1,finite product 1 | Matches | — |
| 7.6 degree weighting | local degree d=2 | T² substitution at T=q^(−2s) gives q^(−4s),not q^(−2s) | Matches | — |
| 7.6 spherical coefficient | n=1,g_X=0 | canonical factor q; exponent −deg(E)(s−1/2)+1 | Matches | — |
| 7.6 Serre-dual degree | n=1,deg E=d | dual degree deg ω_X′−d,versus plain dual −d | Matches | — |
| 7.6 constant-cover degree | line degree d=1 over F_(q²) | original-base degree 2,norm (q²)^1=q² | Matches | — |
| 7.6 general coefficient formula | α=1,scale one bad section by 2 | norm/character factors 1; both coefficients double | Matches | — |
| 7.6 spherical specialization | S=∅ | χ(det bar α)^(−1)=χ(det α),since χ(norm det α)=1 | Matches | — |
| 7.6 independence of S | one spherical place moved into S | factor L_v^(−1)Den_v replaced by identical W_v | Matches | — |
| Worked example 1 | P¹/F₂ | N₁=3,N₂=5,A₂=7,g=0,h=1,μ(∏O)=2 | Matches | — |
| Worked example 2 | elliptic curve/F₅ | discriminant −496=4 mod 5,points 9,L=1+3T+5T² | Matches | — |
| Worked example 3 | same curve/F₂₅ | 13 fibers of size 2,12 of size 0; total 27; L=1+T+25T² | Matches | — |
| Worked example 4 | y³−y=t^(−2) | different 6,genus 1,N₁=4,N₂=16,L=1+3T²; pole orders y=−2,z=−3,π=y/z has order 1 | Matches | — |

## Unresolved items

No unresolved mathematical or port defect was identified. Source-access limitations and the
unindexed design supplier are recorded above rather than treated as certified source access or
an indexed pull request. The worker must retain the earlier LubinTateFormalModulesAndQuasiCanonicalLifts
dependency when it prepares submission metadata. No external service write was made, and no Lean
process from this job remains running.


Pull request: #1474 (roadmap/function-field-arithmetic at 42f4779)
