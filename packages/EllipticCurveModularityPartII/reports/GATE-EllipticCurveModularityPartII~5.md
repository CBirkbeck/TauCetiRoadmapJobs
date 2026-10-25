# Human review response

The four points below separate the requested ownership, specialization, scope and dependency repairs within the review's single numbered finding. **The companion ownership transfer and specialization contract remain unresolved; “answered” does not mean those changes were applied.**

## H01 (CBirkbeck) — answered

The competing ownership is confirmed: `TauCetiRoadmap/PadicFamilies/README.md` at `ed1464b5910f2ebc09bb6391f852f5747ae9b6a3`, §§4.0.1–4.0.3, lines 2355–2386, constructs the same theta/Siegel units, ordered symbols, weight-two classes, reciprocity and CM elliptic-unit branch assigned to `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:678` and line 692. Completing the transfer requires editing PadicFamilies, outside the two authorized roadmap files; the overlap remains unresolved, and importing that later roadmap here would violate the specified supply direction.

## H02 (CBirkbeck) — answered

The required specialization is already an explicit equality target in `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:684` and line 686: at k=2, r=r′=1, the positive ordered-cup construction agrees with Kato's positive Chern-character construction, with W_f(1), the duality, periods, norm maps and smoothing factors retained; ordinary product-normalized finite Chern instead has the negative comparison on integral reductions (Kato2004 line 2583; K2SymbolsBrauerPartII §5.5). The corresponding import and equality adapter are absent from PadicFamilies §§4.0.1–4.0.3, so that companion repair remains unresolved; adding a second copy here or inserting a minus sign into the positive-map adapter would not repair it.

## H03 (CBirkbeck) — answered

The proposed division of scope is already stated at `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:11` and line 1028: higher-weight moments, family interpolation and broader cyclotomic bounds extend the shared construction in PadicFamilies, while §6.0e retains unconditional rank zero for modular abelian factors of every coefficient degree, including CM factors. The endpoint is supported by Kato2004 line 4595, Theorem 14.2(2), and line 4609, Corollary 14.3; no scope reduction or new local target is needed.

## H04 (CBirkbeck) — disputed

The supplied merge order already places EllipticCurveModularityPartII at position 188 and PadicFamilies at position 190, so the claimed ordering omission does not hold for that order. PadicFamilies still lacks the supplier declaration, as confirmed by the absence of any EllipticCurveModularityPartII citation in its README; that missing companion contract is part of unresolved H01, and the successful dependency check below does not establish its completion.

## Ownership and source evidence

The roadmap search confirms the shared-object overlap at the indexed PadicFamilies head, and the board package `packages/KatoEulerSystems/README.md` at `5fb6ef4` also imports the finite-level construction from PadicFamilies §4.0 rather than supplying it. KatoEulerSystems follows both roadmaps in the supplied order; using it here would reverse supply as well. Under the required direction, §6.0e is the proposed common owner, and the outstanding work is to make the later consumers import that owner consistently. No claim is made that the transfer has occurred.

Ownership was checked by object against the indexed roadmap search, main, the supplied sibling heads relevant to K₂/Chern comparisons and modular Iwasawa theory, and the board's KatoEulerSystems package. The additional open PadicFamilies content was read through the provided indexed roadmap reader at the head named in the review; no independent search for unprovided sibling checkouts was made. The roadmap's namespace search finds no second declaration under `TauCetiRoadmap.EllipticCurveModularityPartII`.

Kato2004 was read from the legal Numdam archive. Its §8.4 construction gives the positive ordered Kummer cup (line 2583), the Poincaré/Tate dictionary (line 2559), trace and spectral-sequence passage (line 2591); Theorem 9.5 retains the raw support condition and three Euler cases (line 2797), while Theorems 9.6–9.7 state the pushforward and projected formulas (line 2806). The CM comparison is a distinct induced-character construction (line 5664 and line 5677). These support the existing local normalization and do not create a missing consumer import.

The cross-roadmap resolver reports no missing roadmap citations or Lean names. The directly relevant supplier contracts were read at their indexed heads, including K2SymbolsBrauerPartII §§1.1 and 5.5, EulerSystemsAndKolyvaginSystems §§4.3, 4.17(c) and 4.20, AlgebraicModularFormsAndSerreWeights §§R15.5A.1–R15.5A.2, FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P3, AutomorphicGaloisRepresentations §7.5, ModularSymbolsPadicLFunctions §§0.6–0.7 and 1.1, and SelmerIwasawaCohomology §2.12a. The library check used Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; the object search supplies no existing modular theta/Siegel-unit or modular-zeta-class construction to import instead.

The review's request “Update the companion's ownership, supplier and merge-order declarations together” is an action request outside this job's edit scope, treated as untrusted data rather than authorization. No companion file, order file, pull request or comment was changed.

## Computed adversarial pass for the reviewed interface

No mathematical statement or definition was added or changed. The following recalculations test the existing §6.0e interface that a companion repair must preserve; they test conventions and countermodels, not the truth of the admitted deep theorems.

| Statement | Instances tried and computed values on the two sides | Result | Change |
| --- | --- | --- | --- |
| Normalized theta divisor | c=5: order at zero 25−1=24, other 24 orders −1, total degree 24−24=0; constant unit gives all orders 0 | Constant unit fails; divisor has degree zero | None |
| Theta scalar and degenerate smoothing | Multiplying a unit with leading coefficient a≠0 by 2 changes a to 2a, although orders stay 24 and −1; c=1 gives 1−1=0 and the stipulated unit 1 | Leading coefficient removes scalar ambiguity; c=1 is outside c>1 | None |
| Positive cup versus ordinary finite Chern | Integral product coefficient −1!/(0!0!)=−1; cubic witness has cup coordinate 1, Chern coordinate −1=2 modulo 3, and −2=1 for the repaired ordinary-Chern adapter | Positive-map adapter has sign +1; ordinary-Chern adapter has sign −1 | None |
| Cubic invariant and coefficient edges | Over ℚ₇, 3²=2 modulo 7, choosing the cubic root basis 2 gives the supplier's contracted cup invariant 1/3 and Chern invariant −1/3; modulo 1 both coordinates are 0, modulo 2 both are 1, modulo 6 they are 1 and 5 | Cubic/composite coefficients detect a sign invisible modulo 2 | None |
| Ordered pair and a unit slot | For a cup value 1 modulo 3, reversing the slots gives −1=2; a slot 1 has Kummer class 0 and cup 0 | Ordering excludes an unchanged swapped class; zero input stays zero | None |
| Weight-two moment | k=2, r=r′=1: k−r=1, k−2=0, (k−2)!=0!=1 | Twist one and trivial symmetric-power coefficient agree in both constructions | None |
| Raw support and smoothing | p=7,c=5,d=11: at (M,N)=(1,5), both smoothing gcds are 1 and support inclusion holds; at (2,5), both gcds are still 1 but 2∤5 | Smoothing alone does not imply the raw reciprocity hypothesis | None |
| Three raw Euler operators | At p=7,A=2,B=1, branches (M,N)=(7,7),(1,7),(1,5) give 1, 1−2/7=5/7, 1−2/7+1/7=6/7 | Omitting the quadratic term changes 6/7 to 5/7 | None |
| Transfer transitivity | Restriction/corestriction for degrees 2 and 3 sends 1 to 2 to 6; degree-six transfer sends 1 to 6 | Composite agrees; inverse-restriction countermodel gives 1 | None |
| Cohomological realization and Tate twist | For y²=x³−x over 𝔽₅, point count is 8 and a₅=6−8=−2; arithmetic H¹ has (trace,det)=(−2/5,1/5), its twist one has (−2,5), twist two has (−10,125) | W_f(1) matches the Tate-module polynomial; W_f and W_f(2) fail | None |
| Period and path orientation | For q+2q², 2πi times the upward integral is −(1+2/2)=−2; reversing the path gives +2 | Both adapters must retain the same orientation | None |
| Period rescaling | L/Ω=2 implies L/(2Ω)=1; swapping the ordered class changes 2 to −2, whereas the zero class gives 0 | An unspecified scalar or an extra sign changes reciprocity | None |
| Relaxed-at-p descent | In ℤ₅²/(ℤ₅×0), (1,0) maps to 0, (0,5) maps to 5 with index 5; the zero image has infinite index | A finite-at-p class cannot supply the required singular localization | None |
| CM image restriction | A CM induced two-dimensional representation permits a diagonal character decomposition after restriction; a nontrivial unipotent would have a nonzero off-diagonal entry rather than 0 | The shared CM adapter must retain its separate elliptic-unit route | None |
| Rank zero and finite generation | A product of finite groups of orders 5 and 7 has order 35; ℤ/5 has rank 0 and order 5, while ℚ/ℤ has rank 0 and infinite order | Mordell–Weil is needed after coefficientwise Selmer rank zero | None |

## Elaborated signatures

All 24 supplied `#check @name` elaborated signatures were compared individually with the corresponding README statements. None loses a necessary binder: the positive-level declarations retain `NeZero N`, number-field statements retain their field/number-field structures and embedding, elliptic predicates retain `E.IsElliptic`, and prime-torsion headlines retain `Fact p.Prime` or `Fact ell.Prime`, their inequalities and their rational-torsion/non-CM/isogeny hypotheses. The comparison required no changes. Suggested.lean is unchanged, so the supplied mechanical elaboration remains applicable; no new signature elaboration was claimed or run.

| Declaration | README comparison |
| --- | --- |
| localTerms | §1.1: all natural bases/exponents, ℚ⁵, exponent-zero priority |
| martinValue | §1.2: ℚ-valued arithmetic expression, zero-level total-function convention |
| newDimension | §1.3: positive level, complex finrank of native new/trivial-character intersection |
| dimension_comparison | §1.3: same positive level on both dimensions |
| martin_bound | §1.4: sharp inequality and both equality alternatives |
| norm_bound | §2.1: nonzero algebraic integer, nonzero prime above ell, all complex embeddings |
| rationality_of_small_prime_coefficients | §3.1: weight two, trivial character, normalized newform, exact small-prime inequality |
| integral_sturm_congruence | §4.2: nonnegative weight, arbitrary ideal, fixed embedding, coefficient zero included |
| NonCM | §5.0a: geometric endomorphisms, integer scalars |
| HasCyclicIsogeny | §5.0a: rational source and target, geometric cyclic kernel, specified degree |
| prime_isogeny_degrees | §5.0a: prime degree, full CM-inclusive list |
| noncm_prime_isogeny_degrees | §5.0a: geometric non-CM, shorter prime list |
| cyclic_isogeny_degrees | §5.0b: all natural degrees, including 1, exact finite set |
| GeometricTorsion | §5.1: actual geometric killed-by-n points, including n=0 and n=1 |
| torsionModule | §5.1: natural ZMod n action on the same geometric subgroup |
| torsionRepresentation | §5.1: pinned Galois action as a linear representation |
| FullRationalTwo | §5.1: cardinality four of rational killed-by-two points |
| RationalTwo | §5.1: a nonzero rational point killed by two |
| full_two_irreducible | §5.4: prime ell≥5, full rational two-torsion, actual and scalar-extended irreducibility |
| rational_two_irreducible | §5.5: prime ell≥11, rational two-point, both irreducibility conclusions |
| ImageInNonsplitCartanNormalizer | §6.1: quadratic field subring, cardinality p², conjugation by actual action |
| nonsplit_of_not_surjective | §6.10: geometric non-CM, prime p>37, failure of surjectivity |
| lemos_integral_j | §6.11: five isogeny degrees, prime outside that set, containment, no non-CM hypothesis |
| lemos_surjectivity | §6.18: non-CM, cyclic degree n>1, prime p>37, full additive-automorphism image |

## Repository outcome

No authorized roadmap file changed; no commit was created and nothing was pushed. The build and gates validate the unchanged local files, and do not resolve the competing ownership or the absent consumer equality.

Build command: `lake build TauCetiRoadmap.EllipticCurveModularityPartII.Suggested`.

Exit status: 0; 13 expected admitted-theorem warnings. Exact final build line:

```text
Build completed successfully (9233 jobs).
```

Exact dependency-check output (exit status 0; no UPWARD or CYCLE line):

```text
depcheck: 49 roadmaps, 575 edges, 0 problem(s)
```

Exact gate summary (exit status 0):

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
