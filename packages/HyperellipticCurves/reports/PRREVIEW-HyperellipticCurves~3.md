# Review of HyperellipticCurves (pull request #1707 at 5ff7f10)

**Verdict:** needs changes

## R01 (P1) — Reverse the cluster-depth inequality

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:1433`, repeated at line 1449: “strictly increasing along inclusion”.

**Claim:** The abstract carrier has increasing depth under inclusion, and the minimum-distance construction gives an inhabitant of that carrier.

**Witness:** Over ℚ₇ take roots {0,7,1,2,3}. The twin {0,7} has depth 1; the containing root set has depth 0. DDMM Definition 1.26(3), ddmm line 416, requires the opposite inequality.

Thus the polynomial construction violates the stated carrier law. The existing Check at line 1455 also has an included twin of depth 1/2 inside a depth-zero root.

**Repair:** Write explicitly: for proper clusters 𝔱⊊𝔰, d_𝔱>d_𝔰. Make the API and conventions use this inequality, and keep the example as a negative control. On the witness, the repaired law reads 1>0 and the relative depth is 1; the current increasing-under-inclusion law reads 1<0.

## R02 (P2) — Include leading-coefficient and denominator primes in descent

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:1881`: “its image lies in the classes unramified outside `S ⊇ {v ∣ 2∞ disc f}`”.

**Claim:** That exceptional set suffices for an arbitrary separable odd-degree polynomial over a number field.

**Witness:** Let f=5x⁵+x⁴+3x. Its discriminant is 7,773,813≡3 mod 5. The point (1,3), transported to the monic model, has rootwise descent valuations (1,1,1,1,0) after unramified extension at 5.

Here are reproducible details of the witness. Set X=5x, Y=25y. The monic equation is Y²=F(X)=X⁵+X⁴+375X and the point is (5,75), since F(5)=5625. For the four nonzero roots of f, the Newton polygon of 5x⁴+x³+3 has vertices (0,0),(3,0),(4,1): three roots have valuation 0 and one has valuation −1. Together with the root 0, these give four finite reductions, none equal to 1, because f mod 5 is x(x³+3) and f(1)≡4. It is separable mod 5 at those four roots. Under L≅ℚ[X]/(F), the ordinary monic descent value at [(5,75)−∞] is 5−X, hence 5(1−T) in the original algebra. It has odd valuation at each of the four finite-root factors. At odd residue characteristic, adjoining a square root of an odd-valuation element is ramified. Yet 5 is absent from the stated mandatory set.

**Repair:** Specify the nonmonic normalization of the descent map and enlarge S to contain archimedean places, places above 2, all coefficient-denominator places, nonunit-leading-coefficient places, and discriminant places; alternatively use all bad-reduction places of J with the appropriate descent comparison. Poonen–Schaefer Proposition 12.4 and its following remark, author version p.26, explicitly supply these conditions (poonenschaefer lines 1194–1202). For this witness the enlarged set includes 5, while an integral monic equation retains the familiar set supported on 2 disc f. Do not narrow the theorem to monic equations.

## R03 (P2) — Supply the semistable-extension fibre and its descent action

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:1639`: “`H¹_{ab} = ⊕_𝔰 Ind_{G_𝔰}^{G_K} H¹(Γ̃_𝔰)`”; its Needs line cites §4.6, which starts “For semistable `C`”.

**Claim:** The representation formula applies to general hyperelliptic C/K, including the nonsemistable examples used in §4.9, using the components constructed in §4.6.

**Witness:** For y²=x⁵−7 over ℚ₇, d_ℛ=1/5, ν_ℛ=1 and root ramification index=5. It fails §4.4. Over a semistable extension, scaling gives Y²=X⁵−1, a smooth genus-two fibre.

The required Γ̃_𝔰 is a component over a finite Galois extension F/K where C becomes semistable, with the **G_K descent action**, not simply the usual residue-field action of a model over K. DDMM states these inputs immediately before Theorem 10.1 (ddmm lines 2544–2548, p.54), and supplies the action in Theorems 8.5(2)–(3), 8.7(i). The present §4.6 constructs only the semistable-over-K fibre and does not state that extension/action contract.

**Repair:** Extend §4.6 to a chosen finite Galois semistable extension, stating the valuation conversion, the maps Γ̃_𝔰→Γ̃_σ𝔰 and their composition law, and independence of the chosen extension in the resulting representation. Import existence of that extension from StableReduction Layers 7–8. Keep §4.7 at its full generality. On the witness, a tame extension of ramification degree 10 gives the smooth fibre; inertia on H¹ has eigenvalues −ζ₅,−ζ₅²,−ζ₅³,−ζ₅⁴, hence invariant dimension 0 and conductor 4. A trivial descent action would incorrectly give invariant dimension 4 and conductor 0.

## R04 (P2) — Use the unpointed Jacobian supplier for good reduction

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:1292`: “the Jacobian of the smooth model is an abelian scheme”, attributed to RelativeJacobiansAndIntegralCurveModels §§2.2–2.3.

**Claim:** Those sections provide the abelian-scheme comparison for every smooth hyperelliptic model in §3.5.

**Witness:** The cited §2.2 assumes a pointed family; §2.3 assumes a K-point. Over ℝ[[t]], the constant curve y²=−x⁶−1 is smooth, has unit discriminant −2¹⁴3⁶, and has no section.

The negative right-hand side excludes finite real points, and the equation at infinity has no real solution either. Any section would specialize to a real point. Thus the cited pointed contract cannot be applied, although the intended good-Jacobian-reduction conclusion is true.

**Repair:** Cite NeronModelsAndSemistableAbelianVarieties §3.8 `smooth_case` and §3.9, with §1.8 for the Néron identification; these explicitly provide the unpointed smooth-family statement. Keep the current generality and add this pointless smooth-family Check. For the witness, the corrected supplier gives a dimension-two abelian scheme without manufacturing a section of C.

## R05 (P2) — Keep the genus-zero exception to model uniqueness

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:1290`: “conversely a smooth proper model is unique and its generic-fibre hyperelliptic structure extends”.

**Claim:** The proof route uses uniqueness without a positive-genus hypothesis, although the model carrier and Layer 3 allow g=0.

**Witness:** For R=ℤ₅ and K=ℚ₅, y²=x has genus 0 and Δ=1. The two marked models ℙ¹_R with generic coordinates u and 5u are not isomorphic respecting their generic-fibre markings.

Indeed the required generic automorphism is represented by diag(5,1); no scalar multiple lies in GL₂(R). Scaling by a scalar of valuation m gives determinant valuation 2m+1, which cannot be 0. StableReduction Layer 5, README lines 563–574, explicitly restricts uniqueness to positive genus and retains the genus-zero exception.

**Repair:** State uniqueness only for g≥1. If the good-reduction equivalence is intended for all admitted genera, give its genus-zero argument separately without uniqueness; otherwise state precisely which geometric theorem is restricted while retaining the general algebraic model theory. On the witness both models are smooth, and the corrected assertion makes no claim that their prescribed generic identification extends.

## R06 (P3) — Finish exact source locators

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:1019`: “Liu 1993 §0 and Théorème 2 for the same statement over `ℤ`”; also §§1.1, 2.7, 3.4–3.6.

**Claim:** These citations locate the stated constructions and theorems.

**Witness:** Liu's Théorème 2 describes the compactified moduli scheme as a normalization of a blowup, not the smooth-moduli identification (liu1993 lines 333–357, pp.208–210). The latter is in §0, pp.201–202.

Other missing locators remain: §1.1 gives no source for the group convention; §2.7 cites Mestre and Cardona–Quer only by year; §3.4 cites entire Lockhart/Liu papers for global patching and obstruction claims; §3.5 has no exact source for extending the hyperelliptic structure; §3.6 says only “main theorem”.

**Repair:** Point the smooth-moduli statement to Igusa Theorem 2 and Liu §0, pp.201–202; reserve Liu Théorème 2 for its actual compactification statement. Add the exact theorem/section and printed page for the other claims, distinguishing an author's derived statement from a quoted theorem. The repaired Liu locator directly contains the open locus J₁₀≠0 and its moduli interpretation. Unread primary texts are listed below rather than assigned invented locators.

## Verified sound

This is a full review of both files, not an incremental approval. The computations below are finite adversarial tests, not proofs of all roadmap theorems; failed or incomplete checks are explicitly marked. The worktree was not edited. No changes outside this roadmap occur in the PR diff.

The worker's gate passed every rule, including the targeted build. Independent elaboration of Suggested.lean succeeded with exactly 16 `sorry` warnings and no other warnings or errors. The independent dependency command, with the requested movable/order/content options, returned:

```text
depcheck: 204 roadmaps, 1594 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. All Needs lines were read. Gate success does not detect the internal carrier/supplier gaps in R03–R04.

The file has 35 named declarations in the supplied signature inventory. I independently elaborated the scratch copy with all 35 `#check @name` commands and compared their types with the README. No standing binder was lost: in particular, characteristic ≠2 remains explicit on the separability criterion; irreducibility instances remain on the AdjoinRoot field statements; the genus≥2 guard remains on coordinate classification; DVR/fraction-field and PID/Dedekind hypotheses remain on minimality. No signature changes were made. A copy with `simp`, `rfl` and `infer_instance` tried at each of the 16 admissions retained all 16 admissions. Inspection of the native declarations below did not reveal a single-library-lemma replacement for those model-level headlines. The proved degree-bound helper supports the real action definition; it is not an admitted Check.

The six citation-scanner leads are not missing declarations: `Model.weierstrassForm` is declared in Suggested.lean, and the other five are LMFDB knowl identifiers.

### Reconciliation with the previous review

All eleven findings from the preceding review were checked before the full pass. No repair report marking a finding “not actionable in this package” was present in the supplied previous-review material.

| Previous finding | Current passage | Result |
| --- | --- | --- |
| R01, primitive I-vectors | README 986: “invariant only under rational weighted scaling” | Repaired. The a=1,2 examples give primitive final coordinates 4 and 8 with the same geometric point. |
| R02, characteristic-two automorphism recognition | README 1082–1099: the Artin–Schreier lift condition `B²+B=F∘A−F` | Repaired. The fifth-root action has zero obstruction on x⁵ and a nonzero cubic obstruction on x⁵+x³. |
| R03, Liu 1994 residue characteristic | README 1380: “henselian DVR with algebraically closed residue field of characteristic different from two” | Repaired; matches the source's strict local hypotheses. |
| R04, small residue fields in genus-two tables | README 1784–1789: “`|k|>5`” on model coverage/minimal-discriminant values | Repaired; the reduction-type classification itself retains odd residue fields, including 3 and 5. |
| R05, analytic continuation | README 2019: “require in addition that `L(J,s)` is holomorphic at 1” | Repaired in §5.7; meromorphic continuation, holomorphy and paramodularity are now distinguished. |
| R06, local-solubility algorithm | README 1955–1962 gives the finite bad-place/Weil-bound statement | Repaired; no decision/search algorithm is planned there. |
| R07, absent formulas | README 1351–1374, 1473–1478, 1595–1616, 1680–1686, 1704–1708, 1883–1887, 1985–1991 | Repaired as specification: seven Liu clauses, ancestor sum, chain/lattice formulas, U/V, E, local indices and Brumer–Kramer function are now stated. R01–R03 identify separate residual problems. |
| R08, Newton recovery ownership | README 1906: “FunctionFieldArithmetic … §§5.3, 5.6” | Repaired; this is now an application of the supplier's general theorem. |
| R09, Lean padding | Removed sample/cluster/accessor material; the 16 admissions are headline signatures | Repaired by deletion; the new probe did not close them trivially. |
| R10, roadmap/Lean shape | Six Layer headings, each ending in Examples and Dependencies; docstring names missing headlines | Repaired structurally. Some definitions' examples remain tests of surrounding notions rather than the construction itself; see the Mestre limitation below. |
| R11, source locators | Root-sum and discriminant references are more precise; the n≥2 guard is present | Partly repaired; R06 records the remaining identifiable locator defects. |

### Seeded source sample

There are 15 seeded targets. No additional README locator is explicitly labelled unverified. Sources were fetched through the source service from arXiv, Numdam or author/public institutional pages; no paywall was bypassed. DDMM pages and numbering below refer specifically to arXiv:1808.02936v2, as the README requests. A primary source unavailable in full is not certified merely because another author cites it.

| Seeded target | Text/locator inspected | Outcome |
| --- | --- | --- |
| 1.1 group 𝒢_g | No exact locator in the subsection; native opposite-substitution representation opened | Algebraic order tested below; bibliographic verification incomplete, R06. |
| 2.3 Igusa point/normal forms | liu1993 lines 38–53, 99–119, pp.201–203; lmfdb-igusa_clebsch_invariants lines 90–103 | Geometric point versus rational scaling is now separated correctly. The knowl itself has normalization slips listed under Source issues. |
| 2.4 Igusa classification | liu1993 lines 38–53 and 333–357 | Smooth-moduli assertion is supported in Liu's introduction; Théorème 2 is a different assertion. Igusa's primary text not obtained. |
| 2.7 Mestre | cardonaquer lines 29–35, 124–187, author preprint §§1–2, Lemma 1/Theorem 2 | Extra-automorphism descent statement located; generic conic/cubic construction not certified because Mestre's text is unavailable. |
| 3.4 global minimality | Lockhart fetch unavailable; independent supplement liu2022global (see below) | Algebraic valuation/ideal identities tested; the cited global proof and odd-genus extra hypothesis require an exact locator. |
| 3.5 reduction | Native discriminant specialization; pointed and unpointed supplier contracts | Jacobian conclusion supported by the corrected supplier in R04; hyperelliptic extension/converse lacks an exact cited theorem. |
| 3.6 conductor/discriminant | liu1994conductor lines 30–98, 107–124; §§1,4,6 | The source distinguishes equation-minimal and regular-model discriminants. The numerical inequality is consistent with the tested examples, but “main theorem” is insufficient to identify its complete derivation. |
| 4.1 cluster carrier | ddmm lines 64–68, 411–420, Definitions 1.1/1.26, pp.1,8 | R01: explicit inequality reversed in the README. |
| 4.2 vocabulary/numerics | ddmm Definitions 1.3–1.6, 1.9, 1.11–1.13, Notation 1.18, pp.2–6; §16 | Ancestor sum and sign/zero conventions tested. No contrary formula found. |
| 4.3 equivalence | ddmm lines 3049–3068, 3090–3095; Definition 14.1/Theorem 14.4, pp.63–64; Corollary 14.7 | Redistribution and addition/removal moves agree. Equivalence does not assert K-isomorphism in the converse. |
| 4.6 special fibre | ddmm lines 2317–2343, 2365–2399; Theorems 8.5/8.7, pp.50–51; Theorem 1.14 | Chain lengths and lattice relation agree. The README corrects the introductory reduction-coordinate sign. General extension/action input still needed for §4.7. |
| 4.7 Galois representation | ddmm lines 2544–2562, Theorem 10.1, p.54 | Displayed decomposition matches the theorem, but its component carriers require the setup omitted here: R03. |
| 4.11 deficiency/parity | ddmm Theorems 1.15/12.4, pp.6,59–60; poonenstoll1999 lines 574–608, Theorem 11/Corollary 12, pp.13–14 | Rational divisors, even genus, semistability and finite actual Ш matter. The main target carries them. The stored parity flag is an independent input in the worked example. |
| 4.13 genus-two types | ddmm lines 3769–3777, 4078–4092, Theorems 18.7/18.8, pp.76–78, Tables 7–8 | q>5 is now retained for the model-coverage and minimum-discriminant assertions. Representative rows checked by lattice calculations below. |
| 5.2 descent | poonenschaefer lines 1194–1207 and 1334–1340, Proposition 12.4/remark and Lemma 12.10, pp.26,29 | Local orders match. Exceptional-place claim drops source conditions: R02. Schaefer 1995 primary odd-degree theorem unavailable. |

Liu's seven-clause Théorème 1 was also checked on the image of printed p.204, not just its OCR; the exponents and characteristic-dependent ε agree. Liu 1994's hypotheses and author's errata were read, including the table corrections explicitly consumed here. Brumer–Kramer Theorem 6.2 was checked on the image of printed p.228: the ramification factor multiplies the correction term, not 2g.

The independently fetched supplement Liu, *Global Weierstrass equations of hyperelliptic curves*, arXiv:2109.07318v3, Lemma 2.3/Remark 2.5 (liu2022global lines 194–213, p.5), supports PID equations and patching minimal Weierstrass models. It is not the Lockhart/Liu-1994 locator currently printed in §3.4, and it does not by itself certify every stated defect-class converse.

### Ownership and supply audit

I searched by objects (binary forms/substitution, hyperelliptic function fields and models, Igusa invariants, Mestre conics, clusters, Jacobians, local doubling, Newton recovery), using the roadmap grep/show tools, pinned-library searches and the board packages. I inspected the relevant matches, including the provided open heads. HyperellipticCurves is a new equation/arithmetic owner, not a re-plan of AlgebraicCurves: the latter explicitly assigns these invariants and clusters to it at README lines 101–103 and 1334. No second owner for the proposed cluster or Igusa constructions appeared. The open SatoTateGroups and AbelianVarietiesOverFiniteFields scope passages defer these objects to this roadmap. The namespace search found only this Suggested.lean, not a second declaration owner.

The following cross-roadmap contracts were resolved on main/completed main or the new-roadmap open head, as appropriate. References to excluded later consumers were read as ownership boundaries, not supplier edges.

| Owner and relative file | Resolved contract and consequence |
| --- | --- |
| `TauCetiRoadmap/AlgebraicCurves/README.md:1193`, :1396, :1468 | Layers 10–12 provide the function-field model class, automorphism results and regular proper curve dictionary. Layer 12 distinguishes regularity from smoothness over imperfect fields. The new equation bridge is additional work. |
| `TauCetiRoadmap/EllipticCurves/README.md:793`, :905, :1013 | Local minimality, defect invariants and global equations remain elliptic-owned. The higher-genus model bridge does not duplicate them. |
| `Completed/LocalFieldsRamification/README.md:72`, :724 | Valuation extensions and inertia/ramification filtration. The main/completed version, not a revision PR, is the supply checked. |
| `TauCetiRoadmap/StableReduction/README.md:343`, :372, :405, :467, :552, :576, :621, :658 | Models, nodes/graphs, duality, stable-fibre automorphisms, regular models, numerical types and stable reduction. The positive-genus uniqueness guard matters: R05. |
| `TauCetiRoadmap/JacobianChallenge/README.md:218`, :332, :448 | Relative Picard/Jacobian and abelian variety, with no rational-point assumption for the Jacobian; Abel–Jacobi alone needs a point. Actual line bundles and Picard-sheaf points are distinguished. |
| `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md`, §§1.8–1.9, 1.11, 2.2, 3.1, 3.5, 3.8–3.9, 3.13, 4.1–4.7 | Abelian schemes, global models/differentials, components, semistability, toric–finite filtration, unpointed Picard comparison and monodromy pairing. The equation/cluster identifications are new here. |
| Same owner, §§5.0b–5.0c, 5.4–5.6, 6.10 | Arithmetic Frobenius on the homological Tate module corresponds to geometric Frobenius on its cohomological dual. Conductors, Euler polynomials and compatible systems are supplied; the README uses the same orientation. |
| `TauCetiRoadmap/RelativeJacobiansAndIntegralCurveModels/README.md`, §§2.2–2.3, 3.3, 4.1–4.4 | Pointed actual-class comparison; regular-model/Néron comparison; component reduction and torsion. The first two are too narrow for §3.5 as cited: R04. |
| `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md`, §§1.1–1.5, 1.7–1.8, 1.12–1.14, 1.17–1.18, 2.1–2.5, 3.17a, 3.18c, 6.1 | Kummer/Selmer, rank/regulator, local doubling, actual Sha pairing/parity and local-solubility predicate. In §5.2(c), explicitly cite its §1.17 for the general doubling index; the new result here is its transport through odd-degree descent. |
| `TauCetiRoadmap/EffectiveDiophantineMethods/README.md`, §3.23 | The existing sextic, rational-point descent interface is consumed; the odd-degree comparison here is distinct. |
| `TauCetiRoadmap/FunctionFieldArithmetic/README.md`, §§5.1, 5.3, 5.6 | Point counts, numerator and general Newton recovery. §5.3 now imports rather than re-plans Newton recovery. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:7273` | §5.11 supplies the Weil bound with smooth, projective, geometrically irreducible hypotheses. |
| `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md`, §§2.7, 3 | Characteristic-zero local constants and the general conductor. |
| `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md`, §AL.3.10.3 | Equal-characteristic local constants with finite wild image/quasi-unipotent inertia, geometric Frobenius and additive-character/measure choices. |
| `TauCetiRoadmap/PeriodsAndSpecialValues/README.md`, PS.1.1, PS.1.8, PS.3.3 | Euler product, meromorphic continuation predicate, and signed meromorphic order/leading coefficient. These do not supply a BSD equality. |
| `Completed/NumberFieldArithmetic/README.md`, Layer 5 | Completion/local-field dictionary used for global places. |
| `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:1041`, :1089 | §§F.4.5–F.4.6 supply rational adic cohomology and continuous Galois actions; ℓ is invertible and geometric cohomology is finite-dimensional. |

The pinned declarations actually opened include the following. Paths are relative to the pinned library source roots, not a newer checkout.

| Pinned file and line | Declaration/body inspected and boundary |
| --- | --- |
| Mathlib `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:934`, :940, :944, :957, :1015 | `Polynomial.discr`, constant/linear/quadratic/cubic formulas. A constant has discriminant 1, including zero; it is not a fixed-degree binary discriminant. |
| Mathlib `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:304`, :311 | `twoTorsionPolynomial` and `twoTorsionPolynomial_discr`: native cubic discriminant=16Δ. The extra leading-coefficient square is needed for the quartic binary form. |
| Mathlib `Mathlib/AlgebraicGeometry/EllipticCurve/VariableChange.lean:100`, :123 | Group and action conventions; composition agrees with the README's reversed matrices under the elliptic embedding. |
| Tau Ceti `TauCeti/FieldTheory/FunctionField/Hyperelliptic/Basic.lean:76`, :207 | `IsHyperellipticFunctionField` requires genus≥2 and a separable degree-two rational subfield. It does **not** include `IsFunctionField` or exact constants; the new bridge supplies those separately. |
| Tau Ceti `TauCeti/FieldTheory/FunctionField/Hyperelliptic/Genus.lean:243`, :258, :272 | Exact constants, genus and hyperellipticity for y²=f with squarefree nonconstant f, characteristic≠2 and a generating element. These do not supply the characteristic-two equation bridge. |
| Tau Ceti `TauCeti/FieldTheory/FunctionField/Hyperelliptic/RationalSubfield.lean:154` | `adjoin_eq_adjoin_of_finrank_adjoin_eq_two`: function-field/exact-constant/genus≥2 assumptions retained. |
| Tau Ceti `TauCeti/FieldTheory/FunctionField/Hyperelliptic/Finite.lean:44`, :49, :72, :90 | Branch permutation, kernel and finiteness; characteristic≠2 is a standing binder and algebraic closure enters the kernel/finiteness theorem. The README does not use it for the characteristic-two case. |
| Tau Ceti `TauCeti/NumberTheory/ModularForms/BinaryForms.lean:71`; `TauCeti/RingTheory/MvPolynomial/LinearSubst.lean:231` | `binaryFormRep` uses integral matrices and the opposite monoid; `linearSubstRep` provides general coefficient-ring matrices. The new bounded-univariate formula is the stated coordinate realization. |
| Tau Ceti `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean:169`, :239 | Real coefficient formula for `quadraticTwistOf` and discriminant D⁶Δ. The proposed degree-two-cover twist has an additional coordinate rescaling before this comparison. |
| Tau Ceti `TauCeti/AlgebraicGeometry/EllipticCurve/GlobalMinimalModel.lean:98`; `TauCeti/AlgebraicGeometry/EllipticCurve/MinimalModel/ObstructionExponent.lean:85`, :94 | Local-at-every-height-one-prime minimality, obstruction quotient by 12 and its multiplication identity. No second elliptic defect construction is needed. |
| Tau Ceti `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`; `TauCeti/AlgebraicGeometry/Curves/StableReduction/Model/Basic.lean:44` | A proper geometrically integral group scheme, and a flat finite-presentation DVR model with its generic-fibre data. Neither is the missing model-to-Jacobian construction. |

### Headline coverage

The README's end theorems and deep intermediate results are: binary-discriminant covariance/integrality; smoothness and function-field/genus comparison; coordinate-orbit classification; automorphism and twist classification; Igusa classification and Mestre descent; local/global minimality and the Dedekind obstruction; good-reduction/conductor/Liu comparisons; cluster semistability, special fibre, representation and arithmetic dictionary; Jacobian two-torsion/descent/Euler factors; local solubility, conductor bounds, and period/BSD-quotient interfaces.

The 16 admitted Lean statements cover the statable algebraic portion: covariance, universal divisibility, separability criterion, equation irreducibility, function-field/exact constants, genus, hyperellipticity, elliptic discriminant comparison, model discriminant transformation, coordinate classification, twist discriminant and elliptic twist comparison, local minimality, elliptic minimality comparison, PID global minimality and equality of signed global minimal discriminants. Their 19 other named declarations are supporting bodies, carriers or the proved degree-bound theorem.

The module docstring, lines 16–40, names the omitted geometric, Igusa/Mestre, obstruction, cluster, Jacobian and analytic interfaces and the constructions each lacks. Object searches found no ready-made pinned hyperelliptic Jacobian, cluster picture, Igusa polynomial package or Mestre construction that would make these missing headlines immediately statable. No free-Prop substitute, sorry'd data, admitted example, set_option or additional roadmap import was found.

### Adversarial calculations

The table contains 109 computation rows; another 16 rows below cover every admitted Lean theorem. Rows give actual values, including failed controls; “passes” means the stated instance agrees, not that finite testing proves the theorem. The notation Δ is the roadmap's integral binary-form normalization, not the ordinary polynomial discriminant. Matrix examples use column substitution as written in the README. The final tables separately expose every admitted Lean signature.

| Statement | Instances and computed values on the two sides | Result / change |
| --- | --- | --- |
| 0.1 universal discriminant at n=0 | Universal polynomial is constant; native discr=1. Both homogeneity and covariance exponents truncate to 0, giving 1=1. | Passes total-function control. |
| 0.1 n=1 exception | G=2: binary discr₁=1, whereas lc²·discr(G)=4. | n≥2 guard on degree-drop formula is necessary and present. |
| 0.1 one degree drop | n=2, G=2X+3: binary discriminant=4; lc²·ordinary discr=4·1=4. | Passes. |
| 0.1 two degree drop | n=4, G=X²+1: binary discriminant=0, ordinary discriminant=−4. | Double infinity root detected. |
| 0.1 coefficient homogeneity | n=2, G=X²−1, λ=3: discr(3G)=36; λ² discr(G)=9·4=36. | Passes. |
| 0.1 homogeneous substitution/covariance | n=2, M=diag(2,1), G=X²−1: G∘M=4X²−1, discr=16; det(M)²·4=16. M=0 gives 0=0. | Singular matrices also satisfy this polynomial law. |
| 0.1 degree bound | n=2, p=X³+X: truncated homogeneous substitution at identity gives X, degree 1≤2. It is not the identity on unrestricted polynomials. | The p.natDegree≤n hypothesis on covariance is retained. |
| 0.2 Model bounds and two charts | g=2, f=X⁵,h=1: degrees 5≤6 and 0≤3. At infinity t=1/x,z=y/x³ gives z²+t³z=t; at (0,0), derivative in t is −1. | Infinity is a smooth point, not discarded by the affine chart. |
| 0.2 genus-one boundary | y²=−x⁴−1 over ℝ: finite RHS<0 and infinity equation Y²=−1; point count=0. | Cannot be the pointed elliptic bridge. |
| 0.3 discriminant normalization | g=2, f=X⁵,h=1: formDiscr₆(4X⁵+1)=12,800,000; 2¹²Δ=4096·3125=12,800,000. | Passes including the extra leading-coefficient square. |
| 0.3 smoothness versus repeated roots | y²=X⁵−X has Δ=−65536≠0 over ℚ. y²=X⁵−X³ has Δ=0; after dividing y by x the normalization has genus 1. | Smoothness excludes the misleading genus-two singular equation. |
| 0.3 inseparability | Over 𝔽₅(t), f=X⁵−t is irreducible/squarefree but f′=0; Δ=0 and separability=false. | Squarefree cannot replace separable. |
| 0.3 characteristic two | y²+y=X⁵ over 𝔽₂: Δ=3125 mod 2=1, while 4f+h²=1 has degree 0. | Smooth=true; the characteristic≠2 signature correctly excludes the false polynomial criterion here. |
| 0.3 nonreduced/zero base | Constant base change of y²+y=X⁵ to 𝔽₂[ε]/ε² has Δ=1, a unit. Over the zero ring both sides of discriminant identities are 0, including 1=0. | No field theorem applies to the zero ring; coefficient identities remain meaningful. |
| 0.4 equation and extension | Over ℚ, y²=X⁵−X gives a quadratic extension; genus=(5−1)/2=2. Over 𝔽₂, Y²+Y−X⁵ has an odd pole of order 5, so no rational Artin–Schreier root. | Irreducibility and characteristic-two route survive. |
| 0.4 exact constants/genus | Smooth y²=X over ℚ has function field ℚ(y), degree two over ℚ(x), genus 0; exact constants are ℚ. | Genus gives 0=0; hyperelliptic predicate rejects 0≥2. |
| 0.4 hyperellipticity threshold | y²=X³−X has genus 1, so predicate=false; y²=X⁵−X has genus 2, predicate=true. | g≥2 guard present. |
| 0.5 elliptic discriminant bridge | y²=X³−X: ordinary discr(4X³−4X)=1024, binary discr₄=16·1024=16384, divide by 256 gives 64=native Δ. | Passes. |
| 0.5 another elliptic bridge | y²+y=X³: binary discr₄(4X³+1)=−6912, divide by 256 gives −27=native Δ. | Sign and h-term checked. |
| 0.6 involution | Map y↦−h−y applied twice gives y. For h=1 in characteristic two it is y↦y+1, not identity. | Correct on both characteristics. |
| 0.6 fixed points | y²=X⁵−X over ℚ: rational branch points 0,1,−1,∞, count 4. y²+y=X⁵ over 𝔽₂: no finite fixed point, one at infinity. | Ordinary root counting cannot be used at 2. |
| 0.6 infinity points | h=0, sextic leading coefficient 1 over ℝ gives Y²=1, two points; coefficient −1 gives Y²=−1, zero. Odd degree gives one ramified point. | Projective boundary retained. |
| 1.1 reversed group law | M₁:x↦x+1, M₂:x↦2x. Successive pullback of X gives 2X+2; M₂M₁ gives 2X+2; M₁M₂ gives 2X+1. | Noncommuting witness fixes direction. |
| 1.1 translation term | e₂=3,t₁=X,t₂=X²,M₁:x↦x+1 gives 3X+(X+1)²=X²+5X+1. | Matches e₂t₁+t₂∘M₁, not e₁t₂+t₁∘M₂. |
| 1.1 scalar kernel | g=2, λ=5: G scales by 5⁶ and e²=125²=5⁶; f,h return unchanged. Δ multiplier 5³⁰/125²⁰=1. | Action is not faithful; scalar centrality compatible. |
| 1.1 elliptic composition | u₁=2,r₁=3,u₂=5,r₂=7 gives upper-right entry r₁u₂²+r₂=82; reversed order gives 31. | Native VariableChange convention agrees with 82. |
| 1.2 action | e=1,M=1,t=1 on y²+y=X⁵ gives f′=X⁵−2,h′=3. Then 4f′+h′²=4X⁵+1=G. | Translation signs checked. |
| 1.2 discriminant scaling | g=2,e=2,M=1 gives Δ′=3125/2²⁰; det=2,e=1 gives Δ′=2³⁰·3125. | Both independent weights tested. |
| 1.3 coordinate isomorphism | Translation x↦x+1 gives an explicit field isomorphism and equal Δ. y²=X⁶+1 and y²+y=X⁶ have N₁ at 7 equal to 16 and 4. | Geometrically isomorphic but not ℚ-isomorphic; both directions are distinguished. |
| 1.4 automorphisms | On y²=X⁵−X, a:(x,y)↦(−1/x,y/x³) has a²=(x,−y), a⁴=id. | Central involution extension need not split. |
| 1.4 finite/geometric distinction | y²=X⁵−1 over 𝔽₇ versus 𝔽₁₁: fifth roots of unity number 1 versus 5; the displayed automorphism subgroups have orders 2 versus 10. At characteristic 5 Δ=0. | Smoothness and field guards discriminate. Full exceptional-group table not certified from unread Igusa. |
| 1.5 quadratic twist law | g=2,t=0,n=−3: D=12, G′=12G, Δ′=12¹⁰Δ. D=0 gives G′=0 and Δ′=0. | No smooth twist at a nonunit D over a field. |
| 1.5 characteristic-two twist | t=1,n=c over 𝔽₂: D=1, h′=h, f′=f+ch², Δ′=Δ. | Artin–Schreier rather than square-class branch. |
| 1.5 elliptic twist bridge | E:y²=x³−x, D=4: raw twist f=4x³−4x; (M=diag(1,4),e=4) yields x³−16x. Both target discriminants are 4⁶·64 after the coordinate rescaling. | Native twist comparison has its required rescaling. |
| 2.1 root-sum normalization | Six distinct root labels give 15 pairings, 10 unordered triples-of-triples and 60 triangle-pair/matching products; averaging would divide by 15,10,60. | README uses sums, not the knowl's contradictory averaging phrase. |
| 2.1 coefficient I₂ | For the seven worked G, coefficient formula −240a₀a₆+40a₁a₅−16a₂a₄+6a₃² gives 8,−216,−256,0,−960,−640,135328. | Matches the examples and 8J₂. |
| 2.1 invariant covariance | Scaling G by 4 sends I₂=8 to 128=4²·8; I₁₀/Δ=4096 on every worked equation. | Weights, not ordinary invariance of representatives. |
| 2.2 integral J relation | For 169: J₂J₆−J₄²=−43−1089=−1132=4(−283). For 249: 864−784=80=4·20. | Passes. |
| 2.2 bad-characteristic relation | Mod 2, 4J₈=0; tuples (0,0,0,0,1) and (0,0,0,1,1) both satisfy 0=0. | Dividing by 4 is not permitted at 2. |
| 2.3 weighted points | e=2 multiplies J₂ₖ by 2^(−4k), preserving the projective point. a=1,2 in y²+y=ax⁵ give I₁₀=12,800,000 and 819,200,000. | Primitive I-vectors need not be geometrically invariant. |
| 2.3 primitive normalization | 20⁵·4=12,800,000 and 40⁵·8=819,200,000; primitive last entries 4≠8, absolute triples both (0,0,0). | Previous R01 repaired. |
| 2.4 classification domain | The above pair becomes isomorphic by fifth-root x-scaling, while its primitive vectors differ. Singular J₁₀=0 is excluded. | Classification is of geometric points; primary Igusa text not certified. |
| 2.5 absolute invariants | 169 gives (−1/169,33/169,43/169); 4096 gives (50000,3750,−125). For J₂=J₄=0,J₁₀≠0 the third branch is defined. | Denominators are nonzero. |
| 2.5 characteristic-two negative control | The two J-points above both map to (0,0,0); they are distinct since scaling cannot change zero J₈ into nonzero J₈. | char≠2 guard necessary. |
| 2.6 characteristic-two lift | F=x⁵: F(ζ₅x)−F(x)=0. F=x⁵+x³: difference=(ζ₅³−1)x³≠0. A rational B with polynomial B²+B has no finite poles; a nonconstant polynomial B²+B has even degree. | Zero obstruction lifts; cubic obstruction does not. |
| 2.7 split/nonsplit conic | X²+Y²−Z² vanishes at (1:0:1); X²+Y²+Z² has no nonzero real zero; over ℂ it vanishes at (1:i:0). | Tests arithmetic obstruction, but not actual Mestre coefficients; construction remains unverified. |
| 2.7 extra automorphisms | y²=x⁵−1 has the displayed order-10 group, not order 2. | Generic Mestre criterion does not cover this case; separate theorem required as written. |
| 3.1 clearing denominators | f=X⁵+π⁻¹,h=0,e=π⁻¹ gives π²X⁵+π. Scaling x alone leaves π⁻¹ as constant. | Correct route clears all coefficients. |
| 3.1 valuation step | g=0,1,2,3 gives gcd weights 2,12,10,28. At g=2, e=π changes valuation by −20 and det M=π by +30; gcd=10. | No incorrect uniform step 2(2g+1) in odd genus. |
| 3.2 local minimality | E:y²=x³−x at 5 has vΔ=0. y²=x³−5⁴x has vΔ=12 and scales to E. The minimality scalar would need valuation −12. | Integral predicate rejects the latter; identity scalar=1 passes. |
| 3.2 minimum existence control | y²+y=x⁵ at 5 has vΔ=5; all decreases have step 10 and would be negative. | Minimum 5 is attained. |
| 3.3 obstruction exponent | Elliptic pair above gives (12−0)/12=1, not 2. In genus two simplified y²=4x⁵+1 adds 20 at 2, giving 20/10=2. | Matches native elliptic normalization and higher-genus difference. |
| 3.3 nonuniqueness of minimal equations | The two sextics at 11 in §3.3 each have vΔ=12. For x↦a+b/x in PGL₂(𝔽₁₁), exhaustive a∈𝔽₁₁,b≠0 gives zero maps sending {1,2,3} onto {0,1,2}. | Branch configurations distinguish their integral coordinate orbits. |
| 3.4 global defect | y²+y=x⁵: minimal ideal (5⁵), defect (1). Simplified equation: defect (4), and (4)¹⁰ contributes 2²⁰. | Ideal-power identity tested. |
| 3.4 change of defect | g=2,e=2,det M=1: defect multiplier (2)⁻², its tenth power (2)⁻²⁰ equals discriminant multiplier. g=3 gives e exponent −1, step 28. | Both parity formulas agree with their valuation weights. |
| 3.4 global signed equality | A rational multiplier unit at every prime is ±1; the displayed even powers make it positive, hence 1. For x↦x+1, Δ=3125 on both models. | Signed equality, not only absolute equality. |
| 3.4 field base | O=K a field: height-one-prime set is empty, global minimality=true; coefficient integrality also=true. | Vacuous localization condition is harmless in this boundary case. |
| 3.5 good reduction | y²+y=x⁵ reduces with Δ=1 at 2 and Δ=0 at 5; the minimal valuations are 0 and 5. | Matches the two directions of the discriminant criterion. |
| 3.5 unpointed supplier | Constant y²=−x⁶−1 over ℝ[[t]]: v_tΔ=0, real-point count=0, section count=0; Jacobian dimension=2. | R04: use unpointed supply. |
| 3.5 genus-zero uniqueness | y²=x over ℤ₅: genus 0, Δ=1; generic matrix diag(5,1) has determinant valuation 1, and scalar multiples have odd determinant valuation. | R05: uniqueness of marked smooth models fails. |
| 3.6 conductor/divisibility | 3125: N=3125, abs Δ=3125, quotient 1. 2916: N=2916, abs Δ=11664, quotient 4. | Numerical examples fit divisibility. Stored conductor values not independently proved here. |
| 3.6 strict support/Ogg control | Two odd principal halves at depth 2 give toric rank=0, conductor=0, curve vΔ_min=24, two edges and three minimal-regular components. Thus vΔ_min−n=24≠3−1=2. | Good Jacobian need not mean good curve; elliptic Ogg formula fails. |
| 3.7 seven stable graph types | Arithmetic genera: smooth 2; genus1 plus loop 1+1=2; rational plus two loops 0+2=2; two rationals/three edges 0+3−2+1=2; elliptic pair 1+1=2; elliptic plus nodal rational 1+1=2; nodal rational pair 1+1=2. Triangle=1. | Type-IV negative control repaired. |
| 3.7 Type-I valuations | For y²+y=x⁵ at 5, J₂,…,J₈=0, D=5⁵: the first four ratios are 0, the fifth is 1, all integral. For 169 at 13, v(J₂⁵/D)=−2. | First is potentially good, second is not. |
| 3.7 quotient guards | A=0 excludes Types III/IV/VII as written; B=0 excludes II/VI; D=0 excludes all smooth input. ε at residue 2,3,5 is 4,3,1. | No totalized 0/0 is used. |
| 3.7 strict local/tame tables | Residue characteristic 2 fails the Liu-1994 guard; 3 passes. Extension ramification divisible by residue characteristic fails the tame guard. | Previous characteristic-two overclaim repaired. |
| 4.1 depth | {0,7}⊊{0,7,1,2,3}: depths 1 and 0; current increasing law demands 1<0. | Fails, R01; repaired antitone law gives 1>0. |
| 4.1 empty root set | Constant separable polynomial 1 has 0 roots; requiring ∅ itself as a nonempty cluster would be impossible. Positive degree gives at least 1 root. | Positive-degree guard present. |
| 4.2 children/ancestor sum | Three depth-one twins under six roots at depth 0: each twin ν=2, λ̃=1; ancestor sum 6·0+2·1=2. Root has 3 even children, 0 odd. | Passes. |
| 4.2 odd halves | Two size-three clusters of depth 2 under depth-zero root: each ν=6, λ̃=3; cross-half meet has depth 0. | Principal/root and meet conventions discriminate. |
| 4.2 zero/sign convention | Good quintic: ε_ℛ=0, toric expression 0−0=0. Substituting a trivial one-dimensional representation gives dimension −1. ξ_ℛ(0)=0. | Zero representation convention is essential and present. |
| 4.3 equivalent pictures | The 336 form at 3 gives 10−(36−16−2)/2=1; inversion gives a twin with (4−2)/2=1. | Same discriminant valuation from distinct equivalent pictures. |
| 4.3 equivalence is not arithmetic classification | A unit nonsquare twist changes ε/Frobenius signs but leaves all root distances unchanged. For a single loop, w changes from −1 to +1. | Plain cluster equivalence does not identify K-isomorphism classes. |
| 4.4 semistability | Good sextic: e=1,d=0,ν=0, all conditions true. One ramified twin at depth 1/2 with principal root d=0,ν=0 also passes with e=2. | Half-integral twin depth is allowed. |
| 4.4 failure control | y²=x⁵−7 over ℚ₇: e(root field)=5,d_ℛ=1/5,ν_ℛ=1; all three required tests fail. | Nonsemistable input still belongs to §4.7's advertised scope; R03. |
| 4.5 good curve versus Jacobian | Two odd principal triples at depth 2: curve good=false, Jacobian good=true, potential toric rank=0. Three twins: toric rank=3−1=2. | Correct separation of notions. |
| 4.6 reduction-coordinate sign | z_𝔰=0,z_𝔬=π^d: (z_𝔬−z_𝔰)/π^d=+1. Opposite sign yields −1 and puts the branch point at the wrong coordinate. | README sign agrees with actual chart. |
| 4.6 chain length | Twin δ=1/2 gives 2δ=1 edge, 0 inserted components; δ=1 gives 2 edges, 1 inserted component. Odd halves δ₁=δ₂=1 give (1+1)/2=1 edge. | Edge count is not inserted-component count. |
| 4.6 lattice | Three split twins δ=1: a₁+a₂+a₃=0; basis ℓ₁−ℓ₃,ℓ₂−ℓ₃ has Gram [[4,2],[2,4]], determinant 12, rank 2. Components=6+1−2=5. | Relation and off-diagonal terms retained. |
| 4.7 good reduction decomposition | Good quintic: H¹_t dimension 0, H¹_ab dimension 5−1=4; sextic: H¹_ab dimension 6−1−1=4. | Total dimension 2g=4 in both parity cases. |
| 4.7 nonsemistable action | y²=x⁵−7: over tame degree-10 extension, smooth fibre genus 2; four eigenvalues −ζ₅^i give invariant dimension 0, conductor 4. Trivial action gives 4,0 instead. | R03: supply the descent action. |
| 4.8 Tamagawa cokernel | L=0 gives order 1. Pairing [2], Frobenius −1 gives (ℤ/2)^F=ℤ/2, order 2; cokernel of invariant lattices has order 1. | Correct order of invariants and cokernel. |
| 4.8 split lattice | Gram [[4,2],[2,4]] with trivial Frobenius has cokernel order 12. | Matches determinant 12 and DDMM row. |
| 4.9 tame conductor | Good sextic: dim H¹^I=6−1−1=4, n=0. Good quintic: 5−1−0=4, n=0. Three twins: n=3−1=2. | Correct V index and parity correction. |
| 4.9 wild term | Unramified degree d: discriminant valuation 0, residue degree d, term 0−d+d=0. Tame totally ramified degree e: (e−1)−e+1=0. | Separates wild correction from tame ramification. |
| 4.10 discriminant sum | 169 triple at depth 1/3 gives (9−3)/3=2; twin at 1/2 gives 1; five roots at depth 1/4 give (25−5)/4=5. | Matches polynomial valuations. |
| 4.10 minimum and E | Three depth-one twins give vΔ=6 and minimum 6 for q>5. Conjugate size-three halves at depth 1, v(c_f)=1 give E=1, vΔ=10+6+6=22 and decrease 0. E=0 would predict decrease 10. | E clause is necessary and now specified. |
| 4.11 real deficiency | Genus 2, y²=−x⁶−1: no real points and all real divisors have even degree, so degree-one divisor impossible. Genus 3 pointless curve: conjugate pair has degree 2=g−1. | Even-genus guard correct. |
| 4.11 cluster deficiency | Three split twins have ε_ℛ=+1 and deficiency=false; two conjugate odd halves at odd relative depth give deficiency=true. | Sign/depth, not only topology, matter. |
| 4.11 actual Sha parity | One deficient place gives N/2=1/2 in ℚ/ℤ; two give 1=0. Orders 2a² and a² respectively under finite actual Ш. | Use the separately stored parity flag; the analytic quotient alone does not supply the input. |
| 4.12 root numbers | Split one-loop torus: invariant rank 1,w=−1. Nonsplit one-loop torus: invariant rank 0,w=+1. Three split twins: rank 2,w=+1. At infinity g=1 gives −1,g=2 gives +1. | Sign convention pinned. |
| 4.13 genus-two tables | I₁⁺: n=1,c=1,w=−1; I₁⁻: n=1,c=1,w=+1. Three split depth-one twins: n=2,c=12,w=+1,vΔ_min=6 at q=7. | Representative rows agree with lattice formulas. |
| 4.13 small residue-field guards | q=3 or 5: q>5=false; q=7:true. In all three, “odd residue characteristic”=true. | Classification retained; large-q conclusions correctly restricted. |
| 4.13 constancy | Replace root 7 by 7+49 among {0,7,1,2,3} over ℚ₇: twin distance remains valuation 1, other distances 0; cofactor at twin reduces to −6=1. | Same depths and split sign; Δ valuation 2,n=1,c=2,w=−1 remain. |
| 5.1 geometric two-torsion | g=2: even subsets of 6 roots number 32; quotient by complements has 16=2⁴ classes. g=0 gives 2/2=1. | Rank 2g recovered. |
| 5.1 rational orbit formula | Orbit sizes 6: d=1−1=0; 1+5: d=2−2=0; 1+2+3: d=3−2=1; 2+4: d=2−1=1; 1+1+1+1+2: d=5−2=3. | Matches worked cases. |
| 5.1 odd-genus control | x⁸−2: one Galois orbit, so stable even subsets give only ∅ and all; two conjugate four-root halves give a nonzero complement-fixed class. | At least 2 rational torsion classes, not the naive 1. |
| 5.1 faithfulness guard | Six roots: S₆ acts faithfully on 16 classes; four roots: V₄ acts trivially on 4 classes. For y²=x⁴+1, branch splitting degree 4, Jacobian 2-torsion field degree 1. | g≥2 guard required. |
| 5.2 exceptional places | f=5x⁵+x⁴+3x: disc≡3 mod5; monic-coordinate image 5−X has valuation pattern (1,1,1,1,0). | Fails unramifiedness at omitted 5; R02. |
| 5.2 local image order | g=2, rational 2-torsion order 16: over ℚ₃ image=16; over ℚ₂ image=4·16=64; degree-two ℚ₂ extension gives 16·16=256. | Local field degree retained. |
| 5.2 archimedean/rank | Over ℝ with #J[2]=4, image=4/4=1; over ℂ image=1. Selmer dimension 3 and torsion dimension 1 give rank≤2. | Correct quotient and subtraction. |
| 5.3 Newton/Euler signs | 169 at 3: N₁=6,N₂=8 gives a₁=2,a₂=(4+8−10)/2=1; L(1)=19. | Supplier orientation agrees. Full count table follows. |
| 5.4 semistable factors | At 3 for 249, (1−T)(1+3T+3T²)=1+2T−3T³, degree 3=4−1. Nonsplit factor 1+T changes the sign. | Correct toric factor; no q multiplying its eigenvalue. |
| 5.4 wild degree test | 3125 at 5: stored L₅=1 has degree 0 and stored conductor exponent 5; 4−0=4, leaving Swan contribution 1. | Degree equality 4−n fails as expected at a wild prime. |
| 5.5 local solubility | y²+y=x⁵ has rational infinity and is locally soluble at every place. y²=−x⁶−1 has no ℝ-point. At q=17,g=2, Weil lower bound 18−4√17≈1.508>0. | Infinity, archimedean obstruction and finite large-q bound distinguished. |
| 5.6 conductor bound | (p,r,λ,bound)=(2,4,8,20),(3,2,0,10),(5,1,0,9),(7,0,0,4). At e_K=2,p=2 the bound is 4+2·16=36, not 40. | Correct normalization and empty digit sum. |
| 5.7 analytic order | L=(s−1)⁻² has order −2; L=1 order 0; L=(s−1)² order 2 and leading coefficient 1, although second derivative=2. | Holomorphy and factorial both matter. |
| 5.7 period and regulator | Basis swap determinant −1 and shear determinant 1 preserve Ω; scaling one vector by 2 gives 2Ω and is not a ℤ-basis change. Rank-zero regulator determinant=1. | Positivity/nonzero denominators explicit. |
| 5.7 BSD quotient | For L*=2, torsion=1,Ω=Reg=∏c=1 the defined real quotient is 2; no equation in its definition mentions #Ш. | No #Ш=2 conclusion is part of this definition. |

For clarity, every admitted Lean theorem was also checked against a concrete instance; the longer rows above give the constructions.

| Admitted theorem (within TauCetiRoadmap.HyperellipticCurves) | Computed comparison |
| --- | --- |
| formDiscr_homogSubst | Quadratic/diag(2,1): 16=2²·4; n=0: 1=1. |
| Model.two_pow_mul_universalΔ | g=2,f=x⁵,h=1: 4096·3125=12,800,000. |
| Model.isSmooth_iff_separable | x⁵−x over ℚ: true=true; x⁵−t over 𝔽₅(t): false=false. |
| Model.irreducible_equationPolynomial | Artin–Schreier x⁵ has odd pole order 5; no B²+B can have that pole order. |
| Model.isFunctionField_functionField | y²=x: field ℚ(y), transcendence degree 1 and constant field ℚ. |
| Model.genus_functionField | Degrees 1,3,5 give genera 0,1,2, equal to their smooth model parameters. |
| Model.isHyperellipticFunctionField | g=2 gives genus 2 and extension degree 2; g=1 is excluded by 2≤g. |
| Model.Δ_ofWeierstrass | Cubics x³−x and y²+y=x³ give 64=64 and −27=−27. |
| CoordChange.Δ_smul | e=2,g=2 gives multiplier 2⁻²⁰; scalar triple (5I,125,0) gives multiplier 1. |
| Model.nonempty_algEquiv_functionField_iff | x-translation: both propositions true; the two sextic twists counted at 7 have 16 versus 4 points, excluding a rational coordinate isomorphism. |
| Model.Δ_quadraticTwist | D=12,g=2 gives 12¹⁰Δ on both sides; D=0 gives 0=0. |
| Model.exists_smul_quadraticTwist_ofWeierstrass | E:x³−x,D=4 gives x³−16x after the stated rescaling; Δ=262144 on both sides. |
| Model.exists_isMinimal | y²+y=x⁵ at 5 has minimum valuation 5; lowering by 10 would give −5. |
| Model.isMinimal_ofWeierstrass_iff | x³−x at 5: true=true; x³−5⁴x: false=false, valuations 0 and 12. |
| Model.exists_isGlobalMinimal | Integral model y²+y=x⁵ has local minima 5 at 5 and 0 elsewhere. |
| Model.Δ_eq_of_isGlobalMinimal | Translation gives 3125=3125; the possible global rational unit ratio reduces from ±1 to +1. |

Independent exact discriminant computation used a Sylvester determinant, with the degree-five leading-coefficient square. In worked-example order 169,249,277,3125,2916,4096,336, it gives
`−169,249,277,3125,−11664,−65536,−172032`.
Five complete displayed I/J tuples were checked through all four conversion equations and the J₈ relation, not just their final discriminants.

Nineteen independent point-count pairs were computed directly over 𝔽_p and a quadratic extension, including infinity. Entries are `(p; N₁,N₂; a₁,a₂; L(1))`; they agree with all good Euler factors quoted in the worked suite.

| Curve prefix | Computed values |
| --- | --- |
| 169 | (3;6,8;2,1;19), (5;6,12;0,−7;19), (7;8,64;0,7;57), (11;12,144;0,11;133) |
| 249 | (5;6,30;0,2;28), (7;9,45;1,−2;56), (11;11,125;−1,2;112) |
| 277 | (3;5,11;1,1;15), (5;7,21;1,−2;30) |
| 3125 | (2;3,5;0,0;5), (3;4,10;0,0;10), (7;8,50;0,0;50), (11;13,103;1,−9;125) |
| 2916 | (5;6,46;0,10;36), (7;4,52;−4,9;27) |
| 4096 | (3;4,6;0,−2;8), (5;6,6;0,−10;16), (7;8,78;0,14;64), (17;30,286;12,70;576) |

## Not verifiable

- **igusa1960:** DOI/JSTOR landing page found; no legal full text obtained. The exact primary Theorem 2 and §8 exceptional automorphism/characteristic-two normal-form assertions are not certified. Liu's readable introduction supports the moduli description, not an independent check of every Igusa proof.
- **lockhart1994:** DOI/JSTOR landing page found; no legal full text. The cited general discriminant/global-equation claims lack an exact roadmap locator. The independent Liu supplement supports PID existence, not every claimed obstruction converse.
- **mestre1991:** source service classified the publisher citation as paywalled/uncertified. Generic Mestre conic/cubic coefficients and their full exceptional-locus hypotheses were not inspected. The three README Checks do not evaluate the actual conic/cubic construction.
- **bolza1887:** DOI/JSTOR landing page only. Full characteristic-zero automorphism table not independently certified from that primary text.
- **casselsflynn:** Cambridge book landing page only. Full book statements concerning model isomorphisms/descent were not inspected.
- **mumford1984:** bibliographic fetch yielded no readable text. Chapter IIIa torsion description was cross-checked through readable Poonen–Schaefer, not certified against the book itself.
- **schaefer1995:** Elsevier citation classified uncertified. Odd-degree kernel theorem not read in its original article; local order/ramification conditions were checked in Poonen–Schaefer.
- **stoll2001:** the DOI endpoint returned HTTP 502 on both attempts. No full-text verification.
- **namikawaueno, blr1990, stichtenoth2009:** publisher citations classified uncertified. I checked DDMM's type dictionary and the named roadmap/native contracts, not these unavailable primary books/articles.
- **liu2002:** OUP DOI endpoint returned HTTP 403; no readable book. In particular, §7.4.3 was not independently checked.
- **silverman2009:** bibliographic fetch found no readable book. The pinned elliptic API and roadmap contract were inspected, not VII.1.3 in the book.
- **lmfdb-hasse_weil_conjecture, lmfdb-paramodular_conjecture, lmfdb-two_selmer_rank, lmfdb-conductor, lmfdb-discriminant:** the service retrieved CAPTCHA pages, not knowl contents. These five responses are not evidence for the cited assertions. The Igusa–Clebsch and G2-invariant knowls did yield readable text.
- The worked suite's stored analytic Sha, global torsion orders, complete automorphism groups, some wild local conductors/root numbers and bad-prime Euler factors were not all recomputed or independently proved. The exact discriminants, I₂ values, I/J conversion checks, and nineteen good-prime point-count pairs above were recomputed.
- For §3.4's full Dedekind converse, §3.5's extension of the hyperelliptic structure, and the generic Mestre construction, the table records boundary tests rather than a complete source certification. These limitations do not establish falsehood; the concrete findings above do establish that this head needs changes.

Unavailable references were collected together in the scratch missing-reference list. Successfully fetched replacements for Poonen–Stoll and Flynn–Poonen–Schaefer were removed from that list. No source manifest or repository file was edited.

## Source issues

- **Misprint** in ddmm at Definition 1.1, p.1 (line 68): the source says depth is the minimum disc threshold cutting out a cluster; it should be the maximum threshold, equal to the minimum pairwise valuation; affects a stated result.
- **Misprint** in ddmm at Theorem 1.10 notation, p.5 (line 196): the source says the reduced child coordinate uses parent centre minus child centre; it should use child centre minus parent centre, consistently with the x-chart; affects a stated result.
- **Misprint** in ddmm at Theorem 1.20(ii), p.7, and Theorem 11.3, p.57: the source says V tests the parent cluster's character denominator; it should test the cluster's own denominator, as in the proof at line 2744; affects a stated result.
- **Misprint** in lmfdb-igusa_clebsch_invariants at normalization paragraph, unpaginated (line 92): the source says odd-weight sign normalization uses powers of minus i; it should use powers of minus one when a sign change is needed; affects a stated result.
- **Error** in lmfdb-igusa_clebsch_invariants at root-sum paragraph, unpaginated (line 103): the source says to average the distinct orbit expressions; it should sum them without division by orbit size; affects a stated result.
- **Gap** in cardonaquer at proof of Lemma 1, p.4 (line 133): the source says its last representative handles every j₁=j₂=0; it should separate j₃=0 and use (0,0,0,1) there; affects the proof.
- **Error** in liu1994models at Proposition 4.2.1(b), p.143: the source says the printed ramification and regularity conditions suffice; it should require ramified ω and regular inverse image; affects a stated result; corrected in print at liu1994errata, item 1.
- **Misprint** in liu1994models at Proposition 4.3.1(d), p.144: the source says the condition uses the printed A-invariant monomial; it should use a₀⁻²⁰A₅⁶J₂⁻⁵; affects a stated result; corrected in print at liu1994errata, item 2.
- **Misprint** in liu1994models at equation (4), p.145: the source says one quarter of d_K; it should be one half of d_K; affects a stated result; corrected in print at liu1994errata, item 3.
- **Gap** in liu1994models at §5.1 lemma, p.149: the source says the lemma needs no positivity assumption on b₆; it should assume v(b₆)>0; affects a stated result; corrected in print at liu1994errata, item 4.
- **Gap** in liu1994models at §5.2 lemma, p.151: the source says the lemma needs no positivity assumption on c₆; it should assume v(c₆)>0; affects a stated result; corrected in print at liu1994errata, item 5.
- **Error** in liu1994models at line 7, p.156: the source says the printed normalization can be imposed; it should be θ₀(S)=1/3, v(b₆)=3, v(b₅)≥3; affects the proof; corrected in print at liu1994errata, item 6.
- **Error** in liu1994models at Table 2.2, n=2,r=1, p.159: the source says the IIa−b entry is symmetric in the two parameters; it should retain ordered equation-dependent e₁,e₂; affects a stated result; corrected in print at liu1994errata, item 7.
- **Misprint** in liu1994models at Table 2.3, rows 4–5, p.159: the source says the printed assignments of e₁,e₂ apply; it should interchange them; affects a stated result; corrected in print at liu1994errata, item 8.
- **Misprint** in liu1994models at Table 3.2, first row, p.162: the source says the type is [2I₀−(r−1)]; it should be [2I₀−r] under the corrected convention; affects a stated result; corrected in print at liu1994errata, item 9.
- **Error** in liu1994models at Table 3.4, p.163: the source says the entries use d₁ and q as printed; it should replace both by d₁/n; affects a stated result; corrected in print at liu1994errata, item 10.
