# PORT-EllipticLegendreCharacterInterfaces

Branch: `roadmap/elliptic-legendre-character-interfaces`.

Head commit: `f140b9b4f0e2dcecaa1eb451401a272bf9cc9439`.

Ported only `TauCetiRoadmap/EllipticLegendreCharacterInterfaces/README.md`, `TauCetiRoadmap/EllipticLegendreCharacterInterfaces/Suggested.lean` and `TauCetiRoadmap/EllipticLegendreCharacterInterfaces/metadata.toml`. The initial checkout was clean at `7922565`. The repository README's writing checklist and CONTRIBUTING guidance were read; the models inspected were EllipticCurves, ClassicalArithmeticCompletion and Completed/EffectiveBounds.

## Validation

```text
Build completed successfully (8995 jobs).
```

Warning count: 7, all admitted-declaration warnings for `sorry`; no other warnings or errors. The accepted Lean file is byte-for-byte unchanged: two definitions and seven headline theorems. Its only imports are `Mathlib`, `TauCeti.AlgebraicGeometry.EllipticCurve.PointCount` and `TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist.Basic`; both individual Tau Ceti modules exist and were built at the manifest pin.

```text
gate EllipticLegendreCharacterInterfaces: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency check, complete output:

```text
depcheck: 53 roadmaps, 592 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Citation resolution against main `7922565` and the indexed open heads reports no cross-roadmap citations or Lean names found nowhere. The final content has no outside-folder diff. The pre-commit gate invocations passed all content checks but rejected the uncommitted and then staged files as dirty; the clean-commit invocation above is the final result.

## Draft pull request body

Build the coefficient-level Legendre interfaces from native Weierstrass equations and two-descent: normalization from full rational two-torsion, ordered root and squareclass readings, good-prime parameter units and odd character-conductor divisibility. Develop the halving criterion and two-primary subgroup results over odd finite fields, the explicit order-four point on the twist by two, symmetric-cubic trace cancellation and the normal-form quadratic-twist trace identity. These supply reusable arithmetic interfaces for progression, modularity and dynamical applications without imposing progression hypotheses on the underlying theory.

AI-assisted port and mathematical self-check by Codex (GPT-6).

## Suppliers and ownership

The direct roadmap suppliers are EllipticCurves Layers 4–5, ClassicalArithmeticCompletion §§1.7, 1.8, 1.51, and NeronModelsAndSemistableAbelianVarieties §§5.3a, 5.3g. Of these, **NeronModelsAndSemistableAbelianVarieties** is still an open new-roadmap pull request. **ArithmeticGaloisRepresentations** is its open supplier for the general Artin and Swan theory, cited through that ownership contract. ModularCurves §§4C, 9E supplies the ownership boundary for the universal family and the moduli-level action; no scheme construction is repeated here. The open revision of ClassicalArithmeticCompletion is not a dependency: its main-branch §1.51 was inspected and is the contract consumed.

All cross-roadmap citations were resolved and their mathematical sections read at main or at the indexed open head. Ownership searches used `roadmaps grep` by mathematical object over main and all indexed open heads, the supplied sibling checkouts and the board packages. Searches covered Legendre equations and normalization, split cubic algebras, ordered root evaluation, unit squareclasses, two-descent, halving, two-primary groups, primitive rational-squareclass characters, symmetric cubics and twist traces. No declaration here has the fully qualified name of another roadmap's declaration. The EllipticCurvesPartII design package explicitly assigns its Legendre interfaces to this package; it is not an independent competing owner.

The ownership decisions in the accepted package are retained. Generic Weierstrass carriers, invariants, variable changes, local reduction and twists are supplied; native XSubT algebra, descent, kernel and norm facts are supplied. This roadmap owns their ordered three-root adapters, not a second generic descent theory. The labelled doubling-kernel equality adds an identification absent from the exported root-count theorem. The symmetric-cubic result covers every coefficient a and singular a=0, rather than only the Legendre subfamily a=-u². The twist trace covers every odd finite field and every normal-form equation, including singular models and d=0.

Two interfaces are owned here below their later consumers in merge order: the coefficient model and invariants used in MordellLawrenceVenkatesh §6.4 and ArithmeticDynamics §§6.35, 6.111, and the general character-sum count also stated in ComputationalNumberTheory §3.17. No later roadmap is a supplier. Their ownership is stated in Scope and ownership; no consumer files were edited. ErdosProgressionPowers Layer 2 remains the owner of progression hypotheses, conductor nontriviality and character-sum inequalities. EllipticCurveModularityPartII §5.1 supplies its own rationality predicates, not the general-field normalization here.

No additional supplier replacement or mathematical duplication deletion was needed during this port. In particular there is no replacement of the actual elliptic conductor by a discriminant, reduction symbol or a predicate encoding the desired conclusion. The accepted package's existing supplier replacements are preserved in both files.

## Lean acceptance test and binder audit

Nothing moved from the accepted `Suggested.lean` to the README during the port. It already satisfies the acceptance-test rule. The supporting unit-model reduction result (§1.3), chosen minus-one half (§3.2), no-eight result (§3.6), conic witness and its APIs (§4.1), and character-support statement (§1.4) remain README targets, with their Checks. The seven statable headlines are retained. The actual elliptic-conductor divisibility headline remains in the module docstring as not statable at the pins because its genuine conductor carrier and reduction comparison are roadmap targets, not native declarations. Searches across both pinned libraries found Hecke-character conductors, but no elliptic-conductor carrier; these cannot substitute for it.

A single scratch module imported the built acceptance test and elaborated `#check @name` for every one of its nine declarations. Exit status was 0. Every elaborated type was compared with the README, including its source and target carriers. There are no section variables to be silently discarded; every required hypothesis remains in its own signature. No binder or theorem needed changing.

| Declaration | Binders and carrier comparison |
|---|---|
| `legendre` | Arbitrary universe; any CommRing R; parameter in R; native WeierstrassCurve R. |
| `scaledLegendre` | Same ring generality; d and lambda both in R; native coefficient model. |
| `exists_scaledLegendre_of_full_two_torsion` | Field K, decidable equality, 2≠0, ellipticity and native doubling-kernel cardinality 4; native variable change and nonzero d, lambda≠0,1. |
| `legendre_units_of_good_reduction` | Prime p≠2; elliptic rational E; specified change to the scaled model; good reduction on the minimal p-adic base change; both rational valuations equal 0. |
| `scaledLegendre_halving_iff_squares` | Field K, decidable equality, 2≠0, d≠0, lambda≠0,1; nonsingular native affine point; existential native half iff the three field-square conditions. |
| `legendre_two_by_four_subgroup` | Any finite field with decidable equality, 2≠0, eta≠0, eta²≠1; injective additive homomorphism from ZMod 2 × ZMod 4 into the native point group. |
| `legendre_minus_one_point_count_v_two` | Any finite field with Fintype instance and card mod 8 = 5; native full projective count, valuation exactly 3. |
| `symmetric_cubic_trace_zero` | Any finite field with card mod 4 = 3; every a; native model (0,0,0,a,0), projective count q+1 and integer trace 0. |
| `quadraticTwistOf_frobeniusTrace` | Any finite field with decidable equality, 2≠0, every native normal-form W and every d; native twist parameters (0,-d/4); integer character factor. |

## Upstream reading and non-blocking review note

The whole target README was reread after editing. No false target or numerical Check was found. The following clarity repairs were made:

- Restricted the ordinary counting interpretation explicitly to finite fields. Native Nat.card has value 0 on an infinite solution type, so its totalized pointCount would be 1 there; the roadmap's counting theorems are finite-field statements.
- Gave the exact pinned files for DirichletCharacter, IsPrimitive and legendreSym, and explained why §1.4's positive modulus matters. Native primitivity also admits the modulus-zero boundary; the arithmetic statement excludes it.
- Replaced §0.3's unrelated WeierstrassCurve dependency with the fields, indexed tuples and field homomorphisms its statement actually uses.
- Consolidated the moduli-level ownership explanation in Scope and ownership and placed the ComputationalNumberTheory counting boundary there. No mathematical target or distinct numerical assertion was deleted.

The accepted review's sole non-blocking finding concerns repeated Checks. Comparing it with the supplied README shows its requested consolidation already present: §0.5 has three distinct invariant/scaling Checks; §1.1 keeps all three valuation triples in one bullet; §1.3 combines the good/bad prime test; §1.5 keeps the discriminant-versus-conductor example once; §2.6 retains the conic root readings once; §2.8 has the two distinct halving controls; §3.7 combines counts 8,8,40 with odd quotients 1,1,5. Those decisions were preserved. All eight constructed-object sections retain API lists and at least three discriminating Checks (counts 7,4,5,4,4,4,3,5 in README order).

## Pinned source verification

Mathlib pin: `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. Tau Ceti pin: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Both installed checkouts were confirmed equal to the manifest entries.

Source identifiers below denote repository-relative files at those pins:

| Source id | File |
|---|---|
| M-W | `.lake/packages/mathlib/Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean` |
| M-N | `.lake/packages/mathlib/Mathlib/AlgebraicGeometry/EllipticCurve/NormalForms.lean` |
| M-R | `.lake/packages/mathlib/Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean` |
| M-P | `.lake/packages/mathlib/Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean` |
| M-V | `.lake/packages/mathlib/Mathlib/AlgebraicGeometry/EllipticCurve/VariableChange.lean` |
| M-Q | `.lake/packages/mathlib/Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean` |
| M-Q2 | `.lake/packages/mathlib/Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/GaussSum.lean` |
| M-D | `.lake/packages/mathlib/Mathlib/NumberTheory/DirichletCharacter/Basic.lean` |
| M-Val | `.lake/packages/mathlib/Mathlib/NumberTheory/Padics/PadicVal/Basic.lean` |
| M-Pad | `.lake/packages/mathlib/Mathlib/NumberTheory/Padics/PadicNumbers.lean` |
| M-I | `.lake/packages/mathlib/Mathlib/RingTheory/Ideal/Quotient/Operations.lean` |
| M-Poly | `.lake/packages/mathlib/Mathlib/RingTheory/Polynomial/Quotient.lean` |
| M-G | `.lake/packages/mathlib/Mathlib/GroupTheory/QuotientGroup/Defs.lean` |
| M-A | `.lake/packages/mathlib/Mathlib/GroupTheory/FiniteAbelian/Basic.lean` |
| M-L | `.lake/packages/mathlib/Mathlib/NumberTheory/LegendreSymbol/Basic.lean` |
| T-N | `.lake/packages/TauCeti/TauCeti/AlgebraicGeometry/EllipticCurve/NormalForms.lean` |
| T-X | `.lake/packages/TauCeti/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/XSubT.lean` |
| T-2 | `.lake/packages/TauCeti/TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/TwoTorsion.lean` |
| T-C | `.lake/packages/TauCeti/TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean` |
| T-S | `.lake/packages/TauCeti/TauCeti/AlgebraicGeometry/EllipticCurve/SingularPointCount.lean` |
| T-T | `.lake/packages/TauCeti/TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean` |
| T-V | `.lake/packages/TauCeti/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/VariableChange.lean` |
| T-F | `.lake/packages/TauCeti/TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FinitePoint.lean` |

M-W line 76 defines exactly five coefficients; it does not assert smoothness. M-W line 366 has the field `isUnit : IsUnit W.Δ`, and M-W line 388 defines j only with that instance. M-N line 107 has exactly the two zero-coefficient fields; it does not include ellipticity or a characteristic assumption. M-N line 166 completes the square using invertible 2. M-V line 126 fixes the inverse powers in the coefficient action; M-V line 246 supplies j invariance, and M-W line 477 supplies coefficient-map invariance.

M-R line 274 defines minimality by maximal multiplicative discriminant valuation among integral changed equations. M-R line 323 extends that predicate and requires `valuation K (maximalIdeal R) W.Δ = 1`; M-R line 328 compares with elliptic reduction under minimality. Its integral-model c4 and Delta comparisons are M-R line 139 and M-R line 149. M-Val line 319 requires nonzero summands, nonzero sum and unequal valuations. M-Val line 223 and M-Val line 261 require nonzero operands for multiplication and division. The comparison with rational casts is M-Pad line 1063, as specified in the supplier contract.

T-X line 164 defines the coefficient cubic; T-X line 276 is `AdjoinRoot W.f`; T-X line 505 is the unit group modulo the range of squaring. T-X line 283 splits at one root, and T-X line 297 gives its polynomial evaluation. T-X line 548 uses the corrected cofactor branch at a root; the branches are T-X line 558 and T-X line 566. T-X line 794 gives source `Multiplicative W.Point` and target `W.M`; T-X line 803, T-X line 590 and T-X line 595 give its pointwise readings. T-X line 961 is the native doubling-kernel theorem and T-X line 1023 is the norm condition. T-2 line 57 exports the root cardinality, not a separate labelled set-equality declaration. T-V line 132 is a bijection and T-V line 177 is the additive equivalence, both in direction points(C•W) to points(W). M-P line 701 is the nonvertical tangent branch and M-P line 823 is the native additive point map.

T-C line 73 defines `Nat.card {p : F × F // W.toAffine.Equation p.1 p.2} + 1`; singular solutions are not excluded. T-C line 86 compares with nonsingular points under ellipticity and finite solutions. T-C line 101 and T-C line 109 fix the integer trace sign. T-S line 247 requires both Delta=0 and c4=0. T-F line 53 supplies finiteness over any finite commutative ring, without ellipticity. T-T line 169 fixes the trace/norm twist coefficients; T-T line 229, T-T line 239, T-T line 299 and T-T line 306 give the c4, Delta, ellipticity and j comparisons.

M-Q line 119 defines the integer-valued character; M-Q line 133 needs a nonzero argument for character-one iff square; M-Q line 158 handles character-minus-one iff nonsquare. M-Q line 213 requires characteristic different from two for square-root counts. M-Q line 180, M-Q line 257 and M-Q2 line 37 fix the Euler criterion and supplementary laws over finite fields, rather than just prime fields. M-D line 39 uses MulChar on ZMod; M-D line 291 is `conductor χ = n`; M-D line 298 explicitly admits the modulus-zero primitive trivial character. These exact native definitions explain the exclusions recorded above.

The remaining named supplier declarations were checked in their specified files: ideal CRT at M-I line 325, linear-factor evaluation at M-Poly line 29, quotient map and identity-class criterion at M-G line 309 and M-G line 120, finite abelian decomposition at M-A line 134, legendreSym at M-L line 109, and the native root-point criterion at T-N line 157. No competing implementation of the new ordered interfaces or the two trace headlines was found at these pins.

BS20 was read in the publisher PDF and its supplied line-numbered extraction. BS20 line 513 fixes the unscaled equation, BS20 line 544 and line 545 the six ratios, BS20 line 526 through line 546 the semistable rational good-prime and conductor application, BS20 line 547 through line 557 the prime-field subgroup case, BS20 line 658 through line 672 the descent readings and minus-one count, and BS20 line 703 through line 727 the scale-two application. The broader general-field and singular-equation claims are derived in the README from the pinned APIs rather than attributed to those narrower source statements. BS20 line 718's printed y-expression was recomputed as a negative control; the accepted corrected expression was preserved. BS20 line 464 identifies K84 p.41. The S09 and K84 book texts remain uncertified and are cited by their exact existing locators, not represented as inspected.

Scoped searches for Mathlib pull requests and Lean Zulip discussions on Legendre elliptic curves returned no matching official results. This is a search limitation, not evidence that no open work exists. No external formalization was used or promised as a port.

## Adversarial mathematics pass

The table records the independently recomputed values, including both sides of identities and equivalences, and negative controls outside the hypotheses. It covers every target, each construction's API and the conventions used across layers. Finite checks are tests of statements and normalizations, not proofs. Ordinary rational arithmetic was exact. Field models were F9=F3[i]/(i²+1), F27=F3[z]/(z³+2z+2) and F125=F5[z]/(z³+z+1); all nonzero elements were checked to have inverses. In the F9 rows, integer encoding a+3b denotes a+b i.

There are 322 split models, 3,486 affine halving comparisons, 176 square-parameter subgroup constructions and 7,267 complete normal-form twist comparisons (81 over F3, 625 over F5, 6,561 over F9). The convention checks also cover the zero ring, a square-zero thickening, total division at zero, a purely inseparable field extension, the nonminimal model, singular curves, characteristic two and three, trivial and rank-one finite groups, and a nonabelian negative control. A field of cardinality one is excluded by its nontriviality; no finite-field result is extended to that ring.

| Statement | Instances tried | Computed values on each side | Result | Change |
|---|---|---|---|---|
| Conventions: zero ring versus field; normal form | zero ring; Q at lambda=0; a3=0 versus 1 | zero ring Delta=0=1, unit=true; Q Delta=0, unit=false; a1=a3=0 true versus false | Pass | None |
| Conventions: total rational valuation | 0,3,1/3 at p=3 | [0, 1, -1] | Pass | None |
| Conventions: variable-change direction and weights | roots (3,5,9); u=1/4,4,1/2 on L(3) | r=3: (-17,87,-135) becomes (-8,12,0); u values give (a2,a4)=(-64,768),(-1/4,3/256),(-16,48) | Pass | None |
| 0.1 definition and equation | lambda=2, x=2,-2; lambda=-1 | a2=-3; expanded/factored cubic=0,-24; wrong a2 gives 24,0; lambda=-1 gives (a2,a4)=(0,-1) | Pass | None |
| 0.1 coefficient map API | Z to F5, lambda=3 | (0,-4,0,3,0) maps to (0,1,0,3,0)=L(3) | Pass | None |
| 0.1 injectivity API, both directions | lambda=2,3; lambda=2,2 | a4=2 versus 3: equality false; same five coefficients: equality true | Pass | None |
| 0.1 normal-form API | lambda=0,1,2 | (a1,a3)=(0,0) three times; Delta=0,0,64 | Pass | None |
| 0.1 square-zero coefficient identities | F5[epsilon]/epsilon^2, lambda=2+epsilon | Delta=4+2epsilon; inverse=4+3epsilon; product=1+0epsilon | Pass | None |
| 0.2 scaled definition and equation | d=2,lambda=1/2,x=3 | a2=-3,a4=2; expanded cubic=27-27+6=6; product=3*1*2=6 | Pass | None |
| 0.2 d=1 specialization API | lambda=1/2 | both coefficient pairs=(-3/2,1/2) | Pass | None |
| 0.2 coefficient map API | d=2,lambda=3,Z to F5 | (-8,12) maps to (2,2)=scaled coefficient pair | Pass | None |
| 0.2 native twist identity and ellipticity API | d=2 and 0, lambda=3 | n=-1/2 gives D=2 and coefficients (-8,12); n=-2 gives D=8 and (-32,192); d=0 gives Delta=0 | Pass | None |
| 0.3 labelled parameter definition | lambda=-1 | [-1, -1, 2, 1/2, 1/2, 2] | Pass | None |
| 0.3 labelled parameter definition | lambda=2 | [2, 1/2, -1, -1, 2, 1/2] | Pass | None |
| 0.3 labelled parameter definition | lambda=1/2 | [1/2, 2, 1/2, 2, -1, -1] | Pass | None |
| 0.3 labelled parameter definition | lambda=3 | [3, 1/3, -2, -1/2, 3/2, 2/3] | Pass | None |
| 0.3 labelled parameter definition | lambda=0 | [0, 0, 1, 1, 0, 0] | Pass | None |
| 0.3 labelled parameter definition | lambda=1 | [1, 1, 0, 0, 0, 0] | Pass | None |
| 0.3 admissibility API | lambda=3 and boundaries 0,1 | six lambda=3 labels avoid 0,1; lambda=0 labels include 0,1; lambda=1 labels include 0,1 | Pass | None |
| 0.3 inverse-pair API | lambda=3 | [1, 1, 1] | Pass | None |
| 0.3 field-map API including inseparability | F3(s) to F3(t), s maps to t^3 | first pair (t^3,t^-3); 1-t^3=(1-t)^3; all six expressions commute with substitution | Pass | None |
| 0.4 Delta,c4,j identities and ellipticity | lambda=-1 | (64, 48, 1728) | Pass | None |
| 0.4 Delta,c4,j identities and ellipticity | lambda=2 | (64, 48, 1728) | Pass | None |
| 0.4 Delta,c4,j identities and ellipticity | lambda=1/2 | (1, 12, 1728) | Pass | None |
| 0.4 Delta,c4,j identities and ellipticity | lambda=3 | (576, 112, 21952/9) | Pass | None |
| 0.4 Delta,c4,j identities and ellipticity | lambda=0 | (0, 16, None) | Pass | None |
| 0.4 Delta,c4,j identities and ellipticity | lambda=1 | (0, 16, None) | Pass | None |
| 0.4 characteristic boundaries | F3 lambda=2; characteristic 2 | (Delta,c4,j)=(1,0,0); characteristic 2 Delta=0 | Pass | None |
| 0.5 scaled invariants and j | d=2,lambda=1/2 | (64, 48, 1728) | Pass | None |
| 0.5 scaled invariants and j | d=2,lambda=3 | (36864, 448, 21952/9) | Pass | None |
| 0.5 scaled invariants and j | d=0,lambda=3 | (0, 0, None) | Pass | None |
| 0.6 permutation cross-ratios | roots (3,5,9), six declared orders | [3, 1/3, -2, -1/2, 3/2, 2/3] | Pass | None |
| 0.6 degenerate root exclusion | roots (0,0,1) | first denominator=0; total quotient=0; pairwise-distinct hypothesis=false | Pass | None |
| 0.8 translated split normalization and native twist | roots (3,5,9); ordering (5,9,3) | r=3 gives L(2,3), Delta=36864; Delta ratio to L(3)=64 not rational twelfth power; u=2,r=5 gives L(-1/2), Delta=9 | Pass | None |
| 0.9 full-two-torsion normalization | Q and F3, y^2=x^3-x; Q,y^2=x^3-2x | doubling kernel size=4,4,2; normalized parameters=-1,2; third curve fails full kernel hypothesis | Pass | None |
| 0.9 completion of square | E=(2,-5,0,3,0) over Q | y_old=y_new-x gives (0,-4,0,3,0)=L(3); original killed points O,(0,0),(1,-1),(3,-3) | Pass | None |
| 0.10 labelled root tuple definition, coordinates, injectivity API | (d,lambda)=(1,-1),(2,1/2) | tuples ((0,0),(1,0),(-1,0)),((0,0),(2,0),(1,0)); each has 3 distinct affine points, excludes O | Pass | None |
| 0.10 doubling, exhaustion and horizontal sum APIs | all admissible d,lambda over F3,F5,F7,F9,F11,F13 | 322 models: kernel={O,T0,Td,Tdl} has size 4; root sum=O | Pass | None |
| 1.1 rational valuation cases | p=3,lambda=3 | (1, 0, -2) | Pass | None |
| 1.1 rational valuation cases | p=3,lambda=1/3 | (-1, -1, -2) | Pass | None |
| 1.1 rational valuation cases | p=3,lambda=-2 | (0, 1, -2) | Pass | None |
| 1.1 rational valuation cases | p=3,lambda=-1 | (0, 0, 3) | Pass | None |
| 1.1 dyadic negative control | p=2,lambda=2 | (1, 0, 6) | Pass | None |
| 1.1 full valuation alternatives and integral-j implication | rational numerator -8..8, denominator 1..9; p=3,5,7,11,13 | 680 instances; each applicable formula LHS-RHS=0; integral-j cases give (a,b)=(0,0) | Pass | None |
| 1.2 good reduction parameter units | L(-1) at p=3,5; all three labels at 5 | p=3: (v(lambda),v(1-lambda),v(j))=(0,0,3); p=5 all labels give (0,0) | Pass | None |
| 1.2 minimal-equation convention | u=1/3 and u=3 on L(-1) at 3 | a4=-81 and -1/81; former Delta=64*3^12, v3=12; minimal model Delta=64,v3=0; same j=1728 | Pass | None |
| 1.3 unit reduction and minimality | L(3) at 5 and 3; p=2 unit pair | Delta=576 residues 1 and 0; v3 Delta=2; at 2 residues lambda=0 or 1 force one parameter nonunit | Pass | None |
| 1.4 primitive-character support | lambda=2; omega=1,-1,2,-2 | [8, 8, 1, 4] | Pass | None |
| 1.4 primitive-character support | lambda=1/2; omega=1,-1,2,-2 | [8, 8, 1, 4] | Pass | None |
| 1.4 primitive-character support | lambda=3; omega=1,-1,2,-2 | [12, 3, 24, 24] | Pass | None |
| 1.4 primitive-character support | lambda=-1; omega=1,-1,2,-2 | [4, 1, 8, 8] | Pass | None |
| 1.4 squareclass and prime-value normalization | a=3 at 5,7,11; a=2 and 8/9 | character values=(-1,-1,1)=residue symbols; 2 and 8/9 both have fundamental discriminant 8 | Pass | None |
| 1.5 actual conductor divisibility | L(-1), M=32 (Neron owner 5.3a); L(3),p=3 | four odd character conductors=1 divide 32; L(3): character N=12, odd part=3; v3 Delta=2, v3 c4=0, elliptic conductor exponent=1 | Pass | None |
| 2.1 ordered root-evaluation definition/API | roots 0,2,6; h=1 | [1, 1, 1] | Pass | None |
| 2.1 ordered root-evaluation definition/API | roots 0,2,6; h=X | [0, 2, 6] | Pass | None |
| 2.1 ordered root-evaluation definition/API | roots 0,2,6; h=X+1 | [1, 3, 7] | Pass | None |
| 2.1 ordered root-evaluation definition/API | roots 0,2,6; h=X^2 | [0, 4, 36] | Pass | None |
| 2.1 inverse, equality detection and unit APIs | Lagrange basis at roots 0,2,6 | evaluation matrix=[[1, 0, 0], [0, 1, 0], [0, 0, 1]]; X has coordinate 0 (nonunit); X+1=(1,3,7), unit | Pass | None |
| 2.3 squareclass-equivalence definition and representative API | unit X+(1), roots 0,2,6 | evaluations=[1, 3, 7]; squarefree representatives=[1, 3, 7] | Pass | None |
| 2.3 squareclass-equivalence definition and representative API | unit X+(2), roots 0,2,6 | evaluations=[2, 4, 8]; squarefree representatives=[2, 1, 2] | Pass | None |
| 2.3 squareclass-equivalence definition and representative API | unit X+(-1), roots 0,2,6 | evaluations=[-1, 1, 5]; squarefree representatives=[-1, 1, 5] | Pass | None |
| 2.3 identity, triviality, multiplicativity and inverse APIs | constants 1,4,0; (X+1)(X+2) | 1 and 4 map to (1,1,1) in squareclasses; 0 excluded; product evaluations=(2,12,56), classes=(2,3,14)=coordinate products; kernel contains only identity class | Pass | None |
| 2.5 native nonroot reading and origin | F7,d=1,lambda=4,P=(3, 1) | representatives=[3, 2, 6]; characters=[-1, 1, -1]; product=1=y^2; O=(1,1,1) | Pass | None |
| 2.5 native nonroot reading and origin | F5,d=1,lambda=4,P=(2, 4) | representatives=[2, 1, 3]; characters=[-1, 1, -1]; product=1=y^2; O=(1,1,1) | Pass | None |
| 2.6 three native root readings | F5,d=2,lambda=3 | [[2, 3, 4], [2, 2, 1], [1, 4, 4]] | Pass | None |
| 2.6 three native root readings | F5,d=1,lambda=4 | [[4, 4, 1], [1, 2, 2], [4, 3, 2]] | Pass | None |
| 2.6 rational root derivative correction | Q,d=2,lambda=3 | [[12, -2, -6], [2, -8, -4], [6, 4, 24]] | Pass | None |
| 2.7 split-product identity at every branch | Q roots 0,2,6; O; F5 nonroot | root products=144,64,576; O product=1; F5 nonroot product=1; every squareclass product=1 | Pass | None |
| 2.8 halving iff field squares, both directions | all admissible models over F3,F5,F7,F9,F11,F13 | 322 models, 3486 affine points: membership in doubles equals square-difference predicate in every case; root zero differences admitted | Pass | None |
| 2.8 boundary negative controls | Q and F5 at T0 on L(-1); F5 at T1 | differences (0,-1,1): false over Q; (0,4,1): true over F5; (1,0,2): false over F5 | Pass | None |
| 3.1 two-by-four subgroup and count divisibility | all admissible eta in F3,F5,F7,F9,F11,F13,F27,F125 | 176 instances: embedded image size=8; point count mod 8=0; F3 has 0 admissible eta | Pass | None |
| 3.2 half definition, coordinates, membership, doubling, exact order, first descent API | F5,i=2 | P=(2, 4); y^2=1=cubic; 2P=(0, 0); order=4; chi(i)=-1 | Pass | None |
| 3.2 half definition, coordinates, membership, doubling, exact order, first descent API | F5,i=3 | P=(3, 3); y^2=4=cubic; 2P=(0, 0); order=4; chi(i)=-1 | Pass | None |
| 3.2 half definition, coordinates, membership, doubling, exact order, first descent API | F17,i=4 | P=(4, 14); y^2=9=cubic; 2P=(0, 0); order=4; chi(i)=1 | Pass | None |
| 3.2 field-map API | F5 to F25, chosen i=2 | coordinate image=(2,4), double=(0,0) on both sides; first class changes from nonsquare to square after extension | Pass | None |
| 3.6 no-eight, divisible roots and 3.7 exact two-part | F5 | count=8; element orders=[1, 2, 4]; v2(count)=3 | Pass | None |
| 3.6 no-eight, divisible roots and 3.7 exact two-part | F13 | count=8; element orders=[1, 2, 4]; v2(count)=3 | Pass | None |
| 3.6 no-eight, divisible roots and 3.7 exact two-part | F29 | count=40; element orders=[1, 2, 4, 5, 10, 20]; v2(count)=3 | Pass | None |
| 3.6/3.7 congruence negative control | F41 (q mod 8 = 1) | count=32; element orders=[1, 2, 4, 8]; v2(count)=5 | Pass | None |
| 3.6 no-eight, divisible roots and 3.7 exact two-part | F125 | count=104; element orders=[1, 2, 4, 13, 26, 52]; v2(count)=3 | Pass | None |
| 3.6 congruence negative control | F41, P=(6,13) | order=8; count=32 | Pass | None |
| 3.7 finite-abelian-group route negative controls | C4 x C4; C2 x C4; S3 | orders=16,8,6; sets of elements killed by 2 have sizes 4,4,4; C4xC4 has 3 divisible nonzero two-points, C2xC4 has 1; S3 is nonabelian and doubling is not a homomorphism | Pass | None |
| 4.1 conic witness definition, coordinates and APIs | F5,t=2,v=2,i=3 | lambda=3, P=(4, 3); y^2=4=cubic; 2P=(1, 0); order=4; third descent rep=3=4itv | Pass | None |
| 4.1 conic witness definition, coordinates and APIs | F5,t=2,v=2,i=2 | lambda=3, P=(3, 4); y^2=1=cubic; 2P=(1, 0); order=4; third descent rep=2=4itv | Pass | None |
| 4.1 conic witness definition, coordinates and APIs | F9,t=1,v=1,i=3 | lambda=2, P=(4, 7); y^2=3=cubic; 2P=(1, 0); order=4; third descent rep=3=4itv | Pass | None |
| 4.1 chosen-sign and printed-expression controls | F5,t=v=2,i=3 and 2 | correct P=(4,3),(3,4); printed P=(4,4),(3,1); y^2/cubic=1/4 and 1/1 respectively | Pass | None |
| 4.1 tangent denominator and slope conventions | F5,t=v=2,i=3 and 2 | (r,s)=(4,2),(4,3); r+s=1,2; 2rs(r+s)=1,3 nonzero; tangent numerator=1,1; quotients=1,2 | Pass | None |
| 4.1 field-map and excluded parameters | F5 to F25; t=0 or v=0 | coordinates (4,3) remain (4,3), double (1,0); t=0 gives lambda=0; v=0 gives lambda=1, both excluded | Pass | None |
| 5.1 symmetric-cubic count/trace theorem | F3, all a | 3/3 values have count q+1 and trace 0; a=0 count=4; a=1 count=4 | Pass | None |
| 5.1 symmetric-cubic count/trace theorem | F5, all a | 1/5 values have count q+1 and trace 0; a=0 count=6; a=1 count=4 | Pass | None |
| 5.1 symmetric-cubic count/trace theorem | F7, all a | 7/7 values have count q+1 and trace 0; a=0 count=8; a=1 count=8 | Pass | None |
| 5.1 symmetric-cubic count/trace theorem | F9, all a | 5/9 values have count q+1 and trace 0; a=0 count=10; a=1 count=16 | Pass | None |
| 5.1 symmetric-cubic count/trace theorem | F11, all a | 11/11 values have count q+1 and trace 0; a=0 count=12; a=1 count=12 | Pass | None |
| 5.1 symmetric-cubic count/trace theorem | F13, all a | 1/13 values have count q+1 and trace 0; a=0 count=14; a=1 count=20 | Pass | None |
| 5.1 symmetric-cubic count/trace theorem | F27, all a | 27/27 values have count q+1 and trace 0; a=0 count=28; a=1 count=28 | Pass | None |
| 5.1 symmetric-cubic count/trace theorem | F125, all a | 1/125 values have count q+1 and trace 0; a=0 count=126; a=1 count=148 | Pass | None |
| 5.1 character-sum and trace convention | F3,a=2 | root counts=[1, 1, 1]; characters=[0, 0, 0]; total=4=q+1+sum chi; trace=0 | Pass | None |
| 5.1 character-sum and trace convention | F7,a=3 | root counts=[1, 2, 1, 2, 0, 1, 0]; characters=[0, 1, 0, 1, -1, 0, -1]; total=8=q+1+sum chi; trace=0 | Pass | None |
| 5.1 character-sum and trace convention | F7,a=1 | root counts=[1, 2, 0, 2, 0, 2, 0]; characters=[0, 1, -1, 1, -1, 1, -1]; total=8=q+1+sum chi; trace=0 | Pass | None |
| 5.1 character-sum and trace convention | F3,a=0 | root counts=[1, 2, 0]; characters=[0, 1, -1]; total=4=q+1+sum chi; trace=0 | Pass | None |
| 5.1 character-sum and trace convention | F5,a=4 | root counts=[1, 1, 2, 2, 1]; characters=[0, 0, 1, 1, 0]; total=8=q+1+sum chi; trace=-2 | Pass | None |
| 5.1 character-sum and trace convention | F5,a=1 | root counts=[1, 0, 1, 1, 0]; characters=[0, -1, 0, 0, -1]; total=4=q+1+sum chi; trace=2 | Pass | None |
| 5.1 characteristic-two negative control | F2,y^2=x^3+1 | actual affine counts=(1,1), projective count=3; native character values=(1,0), q+1+sum chi=4 | Pass | None |
| 5.2 full normal-form quadratic-twist trace identity | F3, all a2,a4,a6,d including singular and d=0 | 81 comparisons: twisted trace minus chi(d)*trace=0 in every case | Pass | None |
| 5.2 full normal-form quadratic-twist trace identity | F5, all a2,a4,a6,d including singular and d=0 | 625 comparisons: twisted trace minus chi(d)*trace=0 in every case | Pass | None |
| 5.2 full normal-form quadratic-twist trace identity | F9, all a2,a4,a6,d including singular and d=0 | 6561 comparisons: twisted trace minus chi(d)*trace=0 in every case | Pass | None |
| 5.2 Legendre twist and Euler-polynomial API | F5,lambda=3,d=2 | counts=4,8; traces=2,-2; chi(d)=-1; elliptic=True | Pass | None |
| 5.2 Legendre twist and Euler-polynomial API | F5,lambda=3,d=4 | counts=4,4; traces=2,2; chi(d)=1; elliptic=True | Pass | None |
| 5.2 Legendre twist and Euler-polynomial API | F5,lambda=0,d=2 | counts=5,7; traces=1,-1; chi(d)=-1; elliptic=False | Pass | None |
| 5.2 Legendre twist and Euler-polynomial API | F5,lambda=3,d=0 | counts=4,6; traces=2,0; chi(d)=0; elliptic=False | Pass | None |
| 5.2 extension-field general-model Check | F9,W=y^2=x^3+x+1,d=1+i | counts=16,4; traces=-6,6; chi(d)=-1 | Pass | None |
| Conventions: Euler-polynomial signs | F5,lambda=3,d=1 and 2 | counts=4,8; traces=2,-2; polynomials 1-2T+5T^2 and 1+2T+5T^2 | Pass | None |
| Supplier convention: character primitivity | trivial character at moduli 1 and 0 | conductor=1 and 0 respectively; both native primitivity predicates true; N>0 is true and false respectively | Pass | Explain the positive-modulus restriction |
| Count convention: finiteness | finite F5 cusp versus infinite real cusp | affine solution counts 5 versus infinity; Nat.card values 5 versus 0; native pointCount=6 versus 1; only finite count is an ordinary point count | Pass | Restrict the counting interpretation explicitly to finite fields |
| Finite-group boundary cases | trivial group, C2, C4 | orders 1,2,4; doubling kernels 1,2,2; none has the required kernel size 4 and independent order-four point | Pass | None |

## Unresolved and external follow-up

No blocking issue remains for this port. The missing native actual-elliptic-conductor carrier is the declared statability limit, covered by the named earlier supplier; no substitute is used. The S09 and K84 legal book texts were not inspected, so their precise source-text hypotheses and pages remain uncertified. The native proof inputs and the README's broader statements were checked independently.

The later consumers retain wording predating this ownership contract: ErdosProgressionPowers §2.1 and its Required Legendre-character interfaces describe the general-field normalization and odd-finite-field subgroup as extensions of a narrower supplier; ArithmeticDynamics §§6.35, 6.111 and its supplier paragraph point to MordellLawrenceVenkatesh §6.4 for the coefficient model; ComputationalNumberTheory §3.17 restates the generic character-sum count. Those files are outside the authorized edit scope. This roadmap states the complete interfaces and records ownership in Scope and ownership; the report identifies the consumer references for their owners to align. No consumer is a dependency and no cycle is introduced.

An unrelated web-search excerpt included the operational examples `lake exe cache get` and bare `lake build`; they were treated as untrusted text and were not run. No credentials, downloaded programs, remote writes or changes to pins or tooling were used. The work used no helper agents. No job-started Lean or Lake process remains running.


Pull request: #1545 (roadmap/elliptic-legendre-character-interfaces at f140b9b)
